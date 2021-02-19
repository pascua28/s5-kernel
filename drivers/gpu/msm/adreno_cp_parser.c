/* Copyright (c) 2013, The Linux Foundation. All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 and
 * only version 2 as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#include "kgsl.h"
#include "kgsl_sharedmem.h"
#include "kgsl_snapshot.h"

#include "adreno.h"
#include "adreno_pm4types.h"
#include "a3xx_reg.h"
#include "adreno_cp_parser.h"

#define MAX_IB_OBJS 1000
#define NUM_SET_DRAW_GROUPS 32

struct set_draw_state {
	unsigned int cmd_stream_addr;
	unsigned int cmd_stream_dwords;
};

/* List of variables used when parsing an IB */
struct ib_parser_variables {
	/* List of registers containing addresses and their sizes */
	unsigned int cp_addr_regs[ADRENO_CP_ADDR_MAX];
	/* 32 groups of command streams in set draw state packets */
	struct set_draw_state set_draw_groups[NUM_SET_DRAW_GROUPS];
};

/*
 * Used for locating shader objects. This array holds the unit size of shader
 * objects based on type and block of shader. The type can be 0 or 1 hence there
 * are 2 columns and block can be 0-7 hence 7 rows.
 */
static int load_state_unit_sizes[7][2] = {
	{ 2, 4 },
	{ 0, 1 },
	{ 2, 4 },
	{ 0, 1 },
	{ 8, 2 },
	{ 8, 2 },
	{ 8, 2 },
};

static int adreno_ib_find_objs(struct kgsl_device *device,
				phys_addr_t ptbase,
				unsigned int gpuaddr, unsigned int dwords,
				int obj_type,
				struct adreno_ib_object_list *ib_obj_list);

static int ib_parse_set_draw_state(struct kgsl_device *device,
	unsigned int *ptr,
	phys_addr_t ptbase, struct adreno_ib_object_list *ib_obj_list,
	struct ib_parser_variables *ib_parse_vars);

/*
 * adreno_ib_merge_range() - Increases the address range tracked by an ib
 * object
 * @ib_obj: The ib object
 * @gpuaddr: The start address which is to be merged
 * @size: Size of the merging address
 */
static void adreno_ib_merge_range(struct adreno_ib_object *ib_obj,
		unsigned int gpuaddr, unsigned int size)
{
	unsigned int addr_end1 = ib_obj->gpuaddr + ib_obj->size;
	unsigned int addr_end2 = gpuaddr + size;
	if (gpuaddr < ib_obj->gpuaddr)
		ib_obj->gpuaddr = gpuaddr;
	if (addr_end2 > addr_end1)
		ib_obj->size = addr_end2 - ib_obj->gpuaddr;
	else
		ib_obj->size = addr_end1 - ib_obj->gpuaddr;
}

/*
 * adreno_ib_check_overlap() - Checks if an address range overlap
 * @gpuaddr: The start address range to check for overlap
 * @size: Size of the address range
 * @type: The type of address range
 * @ib_obj_list: The list of address ranges to check for overlap
 *
 * Checks if an address range overlaps with a list of address ranges
 * Returns the entry from list which overlaps else NULL
 */
static struct adreno_ib_object *adreno_ib_check_overlap(unsigned int gpuaddr,
		unsigned int size, int type,
		struct adreno_ib_object_list *ib_obj_list)
{
	struct adreno_ib_object *ib_obj;
	int i;

	for (i = 0; i < ib_obj_list->num_objs; i++) {
		ib_obj = &(ib_obj_list->obj_list[i]);
		if ((type == ib_obj->snapshot_obj_type) &&
			kgsl_addr_range_overlap(ib_obj->gpuaddr, ib_obj->size,
			gpuaddr, size))
			/* regions overlap */
			return ib_obj;
	}
	return NULL;
}

/*
 * adreno_ib_add_range() - Add a gpuaddress range to list
 * @device: Device on which the gpuaddress range is valid
 * @ptbase: Pagtebale base on which the gpuaddress is mapped
 * @size: Size of the address range in concern
 * @type: The type of address range
 * @ib_obj_list: List of the address ranges in which the given range is to be
 * added
 *
 * Add a gpuaddress range as an ib object to a given list after checking if it
 * overlaps with another entry on the list. If it conflicts then change the
 * existing entry to incorporate this range
 *
 * Returns 0 on success else error code
 */
static int adreno_ib_add_range(struct kgsl_device *device,
				phys_addr_t ptbase,
				unsigned int gpuaddr,
				unsigned int size, int type,
				struct adreno_ib_object_list *ib_obj_list)
{
	struct adreno_ib_object *ib_obj;
	struct kgsl_mem_entry *entry;

	entry = kgsl_get_mem_entry(device, ptbase, gpuaddr, size);
	if (!entry)
		/*
		 * Do not fail if gpuaddr not found, we can continue
		 * to search for other objects even if few objects are
		 * not found
		 */
		return 0;

	if (!size) {
		size = entry->memdesc.size;
		gpuaddr = entry->memdesc.gpuaddr;
	}

	ib_obj = adreno_ib_check_overlap(gpuaddr, size, type, ib_obj_list);
	if (ib_obj) {
		adreno_ib_merge_range(ib_obj, gpuaddr, size);
	} else {
		if (MAX_IB_OBJS == ib_obj_list->num_objs) {
			KGSL_DRV_ERR(device,
			"Max objects reached %d\n", ib_obj_list->num_objs);
			return -ENOMEM;
		}
		adreno_ib_init_ib_obj(gpuaddr, size, type, entry,
			&(ib_obj_list->obj_list[ib_obj_list->num_objs]));
		ib_obj_list->num_objs++;
	}
	return 0;
}

/*
 * ib_save_mip_addresses() - Find mip addresses
 * @device: Device on which the IB is running
 * @pkt: Pointer to the packet in IB
 * @ptbase: The pagetable on which IB is mapped
 * @ib_obj_list: List in which any objects found are added
 *
 * Returns 0 on success else error code
 */
static int ib_save_mip_addresses(struct kgsl_device *device, unsigned int *pkt,
		phys_addr_t ptbase, struct adreno_ib_object_list *ib_obj_list)
{
	int ret = 0;
	int num_levels = (pkt[1] >> 22) & 0x03FF;
	int i;
	unsigned int *hostptr;
	struct kgsl_mem_entry *ent;
	unsigned int block, type;
	int unitsize = 0;

	block = (pkt[1] >> 19) & 0x07;
	type = pkt[2] & 0x03;

	if (type == 0)
		unitsize = load_state_unit_sizes[block][0];
	else
		unitsize = load_state_unit_sizes[block][1];

	if (3 == block && 1 == type) {
		ent = kgsl_get_mem_entry(device, ptbase, pkt[2] & 0xFFFFFFFC,
					(num_levels * unitsize) << 2);
		if (!ent)
			return -EINVAL;

		hostptr = kgsl_gpuaddr_to_vaddr(&ent->memdesc,
				pkt[2] & 0xFFFFFFFC);
		if (!hostptr) {
			kgsl_mem_entry_put(ent);
			return -EINVAL;
		}
		for (i = 0; i < num_levels; i++) {
			ret = adreno_ib_add_range(device, ptbase, hostptr[i],
				0, SNAPSHOT_GPU_OBJECT_GENERIC, ib_obj_list);
			if (ret < 0)
				break;
		}
		kgsl_memdesc_unmap(&ent->memdesc);
		kgsl_mem_entry_put(ent);
	}
	return ret;
}

/*
 * ib_parse_load_state() - Parse load state packet
 * @device: Device on which the IB is running
 * @pkt: Pointer to the packet in IB
 * @ptbase: The pagetable on which IB is mapped
 * @ib_obj_list: List in which any objects found are added
 * @ib_parse_vars: VAriable list that store temporary addressses
 *
 * Parse load state packet found in an IB and add any memory object found to
 * a list
 * Returns 0 on success else error code
 */
static int ib_parse_load_state(struct kgsl_device *device, unsigned int *pkt,
	phys_addr_t ptbase, struct adreno_ib_object_list *ib_obj_list,
	struct ib_parser_variables *ib_parse_vars)
{
	unsigned int block, source, type;
	int ret = 0;
	int unitsize = 0;

	/*
	 * The object here is to find indirect shaders i.e - shaders loaded from
	 * GPU memory instead of directly in the command.  These should be added
	 * to the list of memory objects to dump. So look at the load state
	 * if the block is indirect (source = 4). If so then add the memory
	 * address to the list.  The size of the object differs depending on the
	 * type per the load_state_unit_sizes array above.
	 */

	if (type3_pkt_size(pkt[0]) < 2)
		return 0;

	/*
	 * pkt[1] 18:16 - source
	 * pkt[1] 21:19 - state block
	 * pkt[1] 31:22 - size in units
	 * pkt[2] 0:1 - type
	 * pkt[2] 31:2 - GPU memory address
	 */

	block = (pkt[1] >> 19) & 0x07;
	source = (pkt[1] >> 16) & 0x07;
	type = pkt[2] & 0x03;

	if (source == 4) {
		if (type == 0)
			unitsize = load_state_unit_sizes[block][0];
		else
			unitsize = load_state_unit_sizes[block][1];

		/* Freeze the GPU buffer containing the shader */

		ret = adreno_ib_add_range(device, ptbase, pkt[2] & 0xFFFFFFFC,
				0, SNAPSHOT_GPU_OBJECT_SHADER,
				ib_obj_list);
		if (ret < 0)
			return ret;
	}
	/* get the mip addresses */
	ret = ib_save_mip_addresses(device, pkt, ptbase, ib_obj_list);
	return ret;
}

/*
 * This opcode sets the base addresses for the visibilty stream buffer and the
 * visiblity stream size buffer.
 */

static int ib_parse_set_bin_data(struct kgsl_device *device, unsigned int *pkt,
	phys_addr_t ptbase, struct adreno_ib_object_list *ib_obj_list,
	struct ib_parser_variables *ib_parse_vars)
{
	int ret = 0;

	if (type3_pkt_size(pkt[0]) < 2)
		return 0;

	/* Visiblity stream buffer */
	ret = adreno_ib_add_range(device, ptbase, pkt[1], 0,
		SNAPSHOT_GPU_OBJECT_GENERIC, ib_obj_list);
	if (ret < 0)
		return ret;

	/* visiblity stream size buffer (fixed size 8 dwords) */
	ret = adreno_ib_add_range(device, ptbase, pkt[2], 0,
		SNAPSHOT_GPU_OBJECT_GENERIC, ib_obj_list);

	return ret;
}

/*
 * This opcode writes to GPU memory - if the buffer is written to, there is a
 * good chance that it would be valuable to capture in the snapshot, so mark all
 * buffers that are written to as frozen
 */

static int ib_parse_mem_write(struct kgsl_device *device, unsigned int *pkt,
	phys_addr_t ptbase, struct adreno_ib_object_list *ib_obj_list,
	struct ib_parser_variables *ib_parse_vars)
{
	int ret = 0;

	if (type3_pkt_size(pkt[0]) < 1)
		return 0;

	/*
	 * The address is where the data in the rest of this packet is written
	 * to, but since that might be an offset into the larger buffer we need
	 * to get the whole thing. Pass a size of 0 tocapture the entire buffer.
	 */

	ret = adreno_ib_add_range(device, ptbase, pkt[1] & 0xFFFFFFFC, 0,
		SNAPSHOT_GPU_OBJECT_GENERIC, ib_obj_list);
	if (ret < 0)
		return ret;

	return ret;
}

/*
 * ib_add_type0_entries() - Add memory objects to list
 * @device: The device on which the IB will execute
 * @ptbase: The ptbase on which IB is mapped
 * @ib_obj_list: The list of gpu objects
 * @ib_parse_vars: addresses ranges found in type0 packets
 *
 * Add memory objects to given list that are found in type0 packets
 * Returns 0 on success else 0
 */
static int ib_add_type0_entries(struct kgsl_device *device,
	phys_addr_t ptbase, struct adreno_ib_object_list *ib_obj_list,
	struct ib_parser_variables *ib_parse_vars)
{
	struct adreno_device *adreno_dev = ADRENO_DEVICE(device);
	int ret = 0;
	int i;
	int vfd_end;
	unsigned int mask;
	/* First up the visiblity stream buffer */
	if (adreno_is_a4xx(adreno_dev))
		mask = 0xFFFFFFFC;
	else
		mask = 0xFFFFFFFF;
	for (i = ADRENO_CP_ADDR_VSC_PIPE_DATA_ADDRESS_0;
		i < ADRENO_CP_ADDR_VSC_PIPE_DATA_LENGTH_7; i++) {
		if (ib_parse_vars->cp_addr_regs[i]) {
			ret = adreno_ib_add_range(device, ptbase,
				ib_parse_vars->cp_addr_regs[i] & mask,
				0, SNAPSHOT_GPU_OBJECT_GENERIC,
				ib_obj_list);
			if (ret < 0)
				return ret;
			ib_parse_vars->cp_addr_regs[i] = 0;
			ib_parse_vars->cp_addr_regs[i + 1] = 0;
			i++;
		}
	}

	vfd_end = adreno_is_a4xx(adreno_dev) ?
		ADRENO_CP_ADDR_VFD_FETCH_INSTR_1_31 :
		ADRENO_CP_ADDR_VFD_FETCH_INSTR_1_15;
	for (i = ADRENO_CP_ADDR_VFD_FETCH_INSTR_1_0;
		i <= vfd_end; i++) {
		if (ib_parse_vars->cp_addr_regs[i]) {
			ret = adreno_ib_add_range(device, ptbase,
				ib_parse_vars->cp_addr_regs[i],
				0, SNAPSHOT_GPU_OBJECT_GENERIC,
				ib_obj_list);
			if (ret < 0)
				return ret;
			ib_parse_vars->cp_addr_regs[i] = 0;
		}
	}

	if (ib_parse_vars->cp_addr_regs[ADRENO_CP_ADDR_VSC_SIZE_ADDRESS]) {
		ret = adreno_ib_add_range(device, ptbase,
			ib_parse_vars->cp_addr_regs[
				ADRENO_CP_ADDR_VSC_SIZE_ADDRESS] & mask,
			0, SNAPSHOT_GPU_OBJECT_GENERIC, ib_obj_list);
		if (ret < 0)
			return ret;
		ib_parse_vars->cp_addr_regs[
			ADRENO_CP_ADDR_VSC_SIZE_ADDRESS] = 0;
	}
	mask = 0xFFFFFFE0;
	for (i = ADRENO_CP_ADDR_SP_VS_PVT_MEM_ADDR;
		i <= ADRENO_CP_ADDR_SP_FS_OBJ_START_REG; i++) {
		ret = adreno_ib_add_range(device, ptbase,
			ib_parse_vars->cp_addr_regs[i] & mask,
			0, SNAPSHOT_GPU_OBJECT_GENERIC, ib_obj_list);
		if (ret < 0)
			return ret;
		ib_parse_vars->cp_addr_regs[i] = 0;
	}
	return ret;
}
/*
 * The DRAW_INDX opcode sends a draw initator which starts a draw operation in
 * the GPU, so this is the point where all the registers and buffers become
 * "valid".  The DRAW_INDX may also have an index buffer pointer that should be
 * frozen with the others
 */

static int ib_parse_draw_indx(struct kgsl_device *device, unsigned int *pkt,
	phys_addr_t ptbase, struct adreno_ib_object_list *ib_obj_list,
	struct ib_parser_variables *ib_parse_vars)
{
	int ret = 0;
	int i;
	int opcode = cp_type3_opcode(pkt[0]);

	switch (opcode) {
	case CP_DRAW_INDX:
		if (type3_pkt_size(pkt[0]) > 3) {
			ret = adreno_ib_add_range(device, ptbase,
				pkt[4], 0,
				SNAPSHOT_GPU_OBJECT_GENERIC, ib_obj_list);
		}
		break;
	case CP_DRAW_INDX_OFFSET:
		if (type3_pkt_size(pkt[0]) == 6) {
			ret = adreno_ib_add_range(device, ptbase,
				pkt[5], 0,
				SNAPSHOT_GPU_OBJECT_GENERIC, ib_obj_list);
		}
		break;
	case CP_DRAW_INDIRECT:
		if (type3_pkt_size(pkt[0]) == 2) {
			ret = adreno_ib_add_range(device, ptbase,
				pkt[2], 0,
				SNAPSHOT_GPU_OBJECT_GENERIC, ib_obj_list);
		}
		break;
	case CP_DRAW_INDX_INDIRECT:
		if (type3_pkt_size(pkt[0]) == 4) {
			ret = adreno_ib_add_range(device, ptbase,
				pkt[2], 0,
				SNAPSHOT_GPU_OBJECT_GENERIC, ib_obj_list);
			if (ret)
				break;
			ret = adreno_ib_add_range(device, ptbase,
				pkt[4], 0,
				SNAPSHOT_GPU_OBJECT_GENERIC, ib_obj_list);
		}
		break;
	case CP_DRAW_AUTO:
		if (type3_pkt_size(pkt[0]) == 6) {
			ret = adreno_ib_add_range(device, ptbase,
				 pkt[3], 0, SNAPSHOT_GPU_OBJECT_GENERIC,
				ib_obj_list);
			if (ret)
				break;
			ret = adreno_ib_add_range(device, ptbase,
				pkt[4], 0,
				SNAPSHOT_GPU_OBJECT_GENERIC, ib_obj_list);
		}
		break;
	}

	if (ret)
		return ret;
	/*
	 * All of the type0 writes are valid at a draw initiator, so freeze
	 * the various buffers that we are tracking
	 */
	ret = ib_add_type0_entries(device, ptbase, ib_obj_list,
				ib_parse_vars);

	/* Process set draw state command streams if any */
	for (i = 0; i < NUM_SET_DRAW_GROUPS; i++) {
		if (ib_parse_vars->set_draw_groups[i].cmd_stream_dwords)
			ret =
			adreno_ib_find_objs(device, ptbase,
			ib_parse_vars->set_draw_groups[i].cmd_stream_addr,
			ib_parse_vars->set_draw_groups[i].cmd_stream_dwords,
			SNAPSHOT_GPU_OBJECT_DRAW,
			ib_obj_list);
		if (ret)
			break;
	}
	return ret;
}

/*
 * Parse all the type3 opcode packets that may contain important information,
 * such as additional GPU buffers to grab or a draw initator
 */

static int ib_parse_type3(struct kgsl_device *device, unsigned int *ptr,
	phys_addr_t ptbase, struct adreno_ib_object_list *ib_obj_list,
	struct ib_parser_variables *ib_parse_vars)
{
	int opcode = cp_type3_opcode(*ptr);

	switch (opcode) {
	case  CP_LOAD_STATE:
		return ib_parse_load_state(device, ptr, ptbase, ib_obj_list,
					ib_parse_vars);
	case CP_SET_BIN_DATA:
		return ib_parse_set_bin_data(device, ptr, ptbase, ib_obj_list,
					ib_parse_vars);
	case CP_MEM_WRITE:
		return ib_parse_mem_write(device, ptr, ptbase, ib_obj_list,
					ib_parse_vars);
	case CP_DRAW_INDX:
	case CP_DRAW_INDX_OFFSET:
	case CP_DRAW_INDIRECT:
	case CP_DRAW_INDX_INDIRECT:
		return ib_parse_draw_indx(device, ptr, ptbase, ib_obj_list,
					ib_parse_vars);
	case CP_SET_DRAW_STATE:
		return ib_parse_set_draw_state(device, ptr, ptbase,
					ib_obj_list, ib_parse_vars);
	}

	return 0;
}

/*
 * Parse type0 packets found in the stream.  Some of the registers that are
 * written are clues for GPU buffers that we need to freeze.  Register writes
 * are considred valid when a draw initator is called, so just cache the values
 * here and freeze them when a CP_DRAW_INDX is seen.  This protects against
 * needlessly caching buffers that won't be used during a draw call
 */

static void ib_parse_type0(struct kgsl_device *device, unsigned int *ptr,
	phys_addr_t ptbase, struct adreno_ib_object_list *ib_obj_list,
	struct ib_parser_variables *ib_parse_vars)
{
	struct adreno_device *adreno_dev = ADRENO_DEVICE(device);
	int size = type0_pkt_size(*ptr);
	int offset = type0_pkt_offset(*ptr);
	int i;
	int reg_index;

	for (i = 0; i < size; i++, offset++) {
		/* Visiblity stream buffer */
		if (offset >= adreno_cp_parser_getreg(adreno_dev,
				ADRENO_CP_ADDR_VSC_PIPE_DATA_ADDRESS_0) &&
			offset <= adreno_cp_parser_getreg(adreno_dev,
				ADRENO_CP_ADDR_VSC_PIPE_DATA_LENGTH_7)) {
			reg_index = adreno_cp_parser_regindex(
					adreno_dev, offset,
					ADRENO_CP_ADDR_VSC_PIPE_DATA_ADDRESS_0,
					ADRENO_CP_ADDR_VSC_PIPE_DATA_LENGTH_7);
			if (reg_index >= 0)
				ib_parse_vars->cp_addr_regs[reg_index] =
								ptr[i + 1];
			continue;
		} else if ((offset >= adreno_cp_parser_getreg(adreno_dev,
					ADRENO_CP_ADDR_VFD_FETCH_INSTR_1_0)) &&
			(offset <= adreno_cp_parser_getreg(adreno_dev,
				ADRENO_CP_ADDR_VFD_FETCH_INSTR_1_15))) {
			reg_index = adreno_cp_parser_regindex(adreno_dev,
					offset,
					ADRENO_CP_ADDR_VFD_FETCH_INSTR_1_0,
					ADRENO_CP_ADDR_VFD_FETCH_INSTR_1_15);
			if (reg_index >= 0)
				ib_parse_vars->cp_addr_regs[reg_index] =
								ptr[i + 1];
			continue;
		} else if ((offset >= adreno_cp_parser_getreg(adreno_dev,
					ADRENO_CP_ADDR_VFD_FETCH_INSTR_1_16)) &&
			(offset <= adreno_cp_parser_getreg(adreno_dev,
				ADRENO_CP_ADDR_VFD_FETCH_INSTR_1_31))) {
			reg_index = adreno_cp_parser_regindex(adreno_dev,
					offset,
					ADRENO_CP_ADDR_VFD_FETCH_INSTR_1_16,
					ADRENO_CP_ADDR_VFD_FETCH_INSTR_1_31);
			if (reg_index >= 0)
				ib_parse_vars->cp_addr_regs[reg_index] =
								ptr[i + 1];
			continue;
		} else {
			if (offset ==
				adreno_cp_parser_getreg(adreno_dev,
					ADRENO_CP_ADDR_VSC_SIZE_ADDRESS))
				ib_parse_vars->cp_addr_regs[
					ADRENO_CP_ADDR_VSC_SIZE_ADDRESS] =
						ptr[i + 1];
			else if (offset == adreno_cp_parser_getreg(adreno_dev,
					ADRENO_CP_ADDR_SP_VS_PVT_MEM_ADDR))
				ib_parse_vars->cp_addr_regs[
					ADRENO_CP_ADDR_SP_VS_PVT_MEM_ADDR] =
						ptr[i + 1];
			else if (offset == adreno_cp_parser_getreg(adreno_dev,
					ADRENO_CP_ADDR_SP_FS_PVT_MEM_ADDR))
				ib_parse_vars->cp_addr_regs[
					ADRENO_CP_ADDR_SP_FS_PVT_MEM_ADDR] =
						ptr[i + 1];
			else if (offset == adreno_cp_parser_getreg(adreno_dev,
					ADRENO_CP_ADDR_SP_VS_OBJ_START_REG))
				ib_parse_vars->cp_addr_regs[
					ADRENO_CP_ADDR_SP_VS_OBJ_START_REG] =
						ptr[i + 1];
			else if (offset == adreno_cp_parser_getreg(adreno_dev,
					ADRENO_CP_ADDR_SP_FS_OBJ_START_REG))
				ib_parse_vars->cp_addr_regs[
					ADRENO_CP_ADDR_SP_FS_OBJ_START_REG] =
						ptr[i + 1];
			else if ((offset == adreno_cp_parser_getreg(adreno_dev,
					ADRENO_CP_UCHE_INVALIDATE0)) ||
				(offset == adreno_cp_parser_getreg(adreno_dev,
					ADRENO_CP_UCHE_INVALIDATE1)))
					adreno_ib_add_range(device, ptbase,
					ptr[i + 1] & 0xFFFFFFC0, 0,
					SNAPSHOT_GPU_OBJECT_GENERIC,
					ib_obj_list);
		}
	}
}

static int ib_parse_set_draw_state(struct kgsl_device *device,
	unsigned int *ptr,
	phys_addr_t ptbase, struct adreno_ib_object_list *ib_obj_list,
	struct ib_parser_variables *ib_parse_vars)
{
	int size = type0_pkt_size(*ptr);
	int i;
	int grp_id;
	int ret = 0;
	int flags;

	/*
	 * size is the size of the packet that does not include the DWORD
	 * for the packet header, we only want to loop here through the
	 * packet parameters from ptr[1] till ptr[size] where ptr[0] is the
	 * packet header. In each loop we look at 2 DWRODS hence increment
	 * loop counter by 2 always
	 */
	for (i = 1; i <= size; i += 2) {
		grp_id = (ptr[i] & 0x1F000000) >> 24;
		/* take action based on flags */
		flags = (ptr[i] & 0x000F0000) >> 16;
		/* Disable all groups */
		if (flags & 0x4) {
			int j;
			for (j = 0; j < NUM_SET_DRAW_GROUPS; j++)
				ib_parse_vars->set_draw_groups[j].
					cmd_stream_dwords = 0;
			continue;
		}
		/* disable flag */
		if (flags & 0x2) {
			ib_parse_vars->set_draw_groups[grp_id].
						cmd_stream_dwords = 0;
			continue;
		}
		/*
		 * dirty flag or no flags both mean we need to load it for
		 * next draw. No flags is used when the group is activated
		 * or initialized for the first time in the IB
		 */
		if (flags & 0x1 || !flags) {
			ib_parse_vars->set_draw_groups[grp_id].
				cmd_stream_dwords = ptr[i] & 0x0000FFFF;
			ib_parse_vars->set_draw_groups[grp_id].
				cmd_stream_addr = ptr[i + 1];
			continue;
		}
		/* load immediate */
		if (flags & 0x8) {
			ret = adreno_ib_find_objs(device, ptbase,
				ptr[i + 1], (ptr[i] & 0x0000FFFF),
				SNAPSHOT_GPU_OBJECT_IB,
				ib_obj_list);
			if (ret)
				break;
		}
	}
	return ret;
}

/*
 * adreno_ib_find_objs() - Find all IB objects in a given IB
 * @device: The device pointer on which the IB executes
 * @ptbase: The pagetable base in which in the IBis mapped and so are the
 * objects in it
 * @gpuaddr: The gpu address of the IB
 * @dwords: Size of ib in dwords
 * @obj_type: The object type can be either an IB or a draw state sequence
 * @ib_obj_list: The list in which the IB and the objects in it are added.
 *
 * Finds all IB objects in a given IB and puts then in a list. Can be called
 * recursively for the IB2's in the IB1's
 * Returns 0 on success else error code
 */
static int adreno_ib_find_objs(struct kgsl_device *device,
				phys_addr_t ptbase,
				unsigned int gpuaddr, unsigned int dwords,
				int obj_type,
				struct adreno_ib_object_list *ib_obj_list)
{
	int ret = 0;
	int rem = dwords;
	int i;
	struct ib_parser_variables ib_parse_vars;
	unsigned int *src;
	struct adreno_ib_object *ib_obj;
	struct kgsl_mem_entry *entry;

	/* check that this IB is not already on list */
	for (i = 0; i < ib_obj_list->num_objs; i++) {
		ib_obj = &(ib_obj_list->obj_list[i]);
		if ((obj_type == ib_obj->snapshot_obj_type) &&
			(ib_obj->gpuaddr <= gpuaddr) &&
			((ib_obj->gpuaddr + ib_obj->size) >=
			(gpuaddr + (dwords << 2))))
			return 0;
	}

	entry = kgsl_get_mem_entry(device, ptbase, gpuaddr, (dwords << 2));
	if (!entry)
		return -EINVAL;

	src = kgsl_gpuaddr_to_vaddr(&entry->memdesc, gpuaddr);
	if (!src) {
		kgsl_mem_entry_put(entry);
		return -EINVAL;
	}

	memset(&ib_parse_vars, 0, sizeof(struct ib_parser_variables));

	ret = adreno_ib_add_range(device, ptbase, gpuaddr, dwords << 2,
				obj_type, ib_obj_list);
	if (ret)
		goto done;

	for (i = 0; rem > 0; rem--, i++) {
		int pktsize;

		/*
		 * If the packet isn't a type 1 or a type 3, then don't bother
		 * parsing it - it is likely corrupted
		 */
		if (!pkt_is_type0(src[i]) && !pkt_is_type3(src[i]))
			break;

		pktsize = type3_pkt_size(src[i]);

		if (!pktsize || (pktsize + 1) > rem)
			break;

		if (pkt_is_type3(src[i])) {
			if (adreno_cmd_is_ib(src[i])) {
				unsigned int gpuaddrib2 = src[i + 1];
				unsigned int size = src[i + 2];

				ret = adreno_ib_find_objs(
						device, ptbase,
						gpuaddrib2, size,
						SNAPSHOT_GPU_OBJECT_IB,
						ib_obj_list);
				if (ret < 0)
					goto done;
			} else {
				ret = ib_parse_type3(device, &src[i], ptbase,
						ib_obj_list,
						&ib_parse_vars);
				/*
				 * If the parse function failed (probably
				 * because of a bad decode) then bail out and
				 * just capture the binary IB data
				 */

				if (ret < 0)
					goto done;
			}
		} else if (pkt_is_type0(src[i])) {
			ib_parse_type0(device, &src[i], ptbase, ib_obj_list,
					&ib_parse_vars);
		}

		i += pktsize;
		rem -= pktsize;
	}

done:
	/*
	 * For set draw objects there may not be a draw_indx packet at its end
	 * to signal that we need to save the found objects in it, so just save
	 * it here.
	 */
	if (!ret && SNAPSHOT_GPU_OBJECT_DRAW == obj_type)
		ret = ib_add_type0_entries(device, ptbase, ib_obj_list,
			&ib_parse_vars);

	kgsl_memdesc_unmap(&entry->memdesc);
	kgsl_mem_entry_put(entry);
	return ret;
}


/*
 * adreno_ib_create_object_list() - Find all the memory objects in IB
 * @device: The device pointer on which the IB executes
 * @ptbase: The pagetable base in which in the IBis mapped and so are the
 * objects in it
 * @gpuaddr: The gpu address of the IB
 * @dwords: Size of ib in dwords
 * @ib_obj_list: The list in which the IB and the objects in it are added.
 *
 * Find all the memory objects that an IB needs for execution and place
 * them in a list including the IB.
 * Returns the ib object list else error code in pointer.
 */
int adreno_ib_create_object_list(struct kgsl_device *device,
		phys_addr_t ptbase,
		unsigned int gpuaddr, unsigned int dwords,
		struct adreno_ib_object_list **out_ib_obj_list)
{
	int ret = 0;
	struct adreno_ib_object_list *ib_obj_list;

	if (!out_ib_obj_list)
		return -EINVAL;

	ib_obj_list = kzalloc(sizeof(*ib_obj_list), GFP_KERNEL);
	if (!ib_obj_list)
		return -ENOMEM;

	ib_obj_list->obj_list = vmalloc(MAX_IB_OBJS *
					sizeof(struct adreno_ib_object));

	if (!ib_obj_list->obj_list) {
		kfree(ib_obj_list);
		return -ENOMEM;
	}

	ret = adreno_ib_find_objs(device, ptbase, gpuaddr, dwords,
		SNAPSHOT_GPU_OBJECT_IB, ib_obj_list);

	if (ret)
		adreno_ib_destroy_obj_list(ib_obj_list);
	else
		*out_ib_obj_list = ib_obj_list;

	return ret;
}

/*
 * adreno_ib_destroy_obj_list() - Destroy an ib object list
 * @ib_obj_list: List to destroy
 *
 * Free up all resources used by an ib_obj_list
 */
void adreno_ib_destroy_obj_list(struct adreno_ib_object_list *ib_obj_list)
{
	int i;

	if (!ib_obj_list)
		return;

	for (i = 0; i < ib_obj_list->num_objs; i++) {
		if (ib_obj_list->obj_list[i].entry)
			kgsl_mem_entry_put(ib_obj_list->obj_list[i].entry);
	}
	vfree(ib_obj_list->obj_list);
	kfree(ib_obj_list);
}
