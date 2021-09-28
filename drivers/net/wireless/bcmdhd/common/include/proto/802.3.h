/*
 * Copyright (C) 1999-2013, Broadcom Corporation
 *
<<<<<<< HEAD:drivers/net/wireless/bcmdhd/include/proto/vlan.h
 * Copyright (C) 1999-2015, Broadcom Corporation
 * 
=======
>>>>>>> 40bb591cb6abaf540bf9a988e3fac0ca86368865:drivers/net/wireless/bcmdhd/common/include/proto/802.3.h
 *      Unless you and Broadcom execute a separate written software license
 * agreement governing use of this software, this software is licensed to you
 * under the terms of the GNU General Public License version 2 (the "GPL"),
 * available at http://www.broadcom.com/licenses/GPLv2.php, with the
 * following added to such license:
 * 
 *      As a special exception, the copyright holders of this software give you
 * permission to link this software with independent modules, and to copy and
 * distribute the resulting executable under terms of your choice, provided that
 * you also meet, for each linked independent module, the terms and conditions of
 * the license of that module.  An independent module is a module which is not
 * derived from this software.  The special exception does not apply to any
 * modifications of the software.
 *
 *      Notwithstanding the above, under no circumstances may you combine this
 * software in any way with any other Broadcom software provided under a license
 * other than the GPL, without Broadcom's express prior written consent.
 *
<<<<<<< HEAD:drivers/net/wireless/bcmdhd/include/proto/vlan.h
 * $Id: vlan.h 382883 2013-02-04 23:26:09Z $
 */

#ifndef _vlan_h_
#define _vlan_h_

#ifndef _TYPEDEFS_H_
#include <typedefs.h>
#endif
=======
 * Fundamental constants relating to 802.3
 *
 * $Id: 802.3.h 417942 2013-08-13 07:53:57Z $
 */

#ifndef _802_3_h_
#define _802_3_h_
>>>>>>> 40bb591cb6abaf540bf9a988e3fac0ca86368865:drivers/net/wireless/bcmdhd/common/include/proto/802.3.h

/* This marks the start of a packed structure section. */
#include <packed_section_start.h>

<<<<<<< HEAD:drivers/net/wireless/bcmdhd/include/proto/vlan.h
#ifndef	 VLAN_VID_MASK
#define VLAN_VID_MASK		0xfff	/* low 12 bits are vlan id */
#endif

#define	VLAN_CFI_SHIFT		12	/* canonical format indicator bit */
#define VLAN_PRI_SHIFT		13	/* user priority */

#define VLAN_PRI_MASK		7	/* 3 bits of priority */

#define	VLAN_TPID_OFFSET	12	/* offset of tag protocol id field */
#define	VLAN_TCI_OFFSET		14	/* offset of tag ctrl info field */

#define	VLAN_TAG_LEN		4
#define	VLAN_TAG_OFFSET		(2 * ETHER_ADDR_LEN)	/* offset in Ethernet II packet only */

#define VLAN_TPID		0x8100	/* VLAN ethertype/Tag Protocol ID */

struct vlan_header {
	uint16	vlan_type;		/* 0x8100 */
	uint16	vlan_tag;		/* priority, cfi and vid */
};

struct ethervlan_header {
	uint8	ether_dhost[ETHER_ADDR_LEN];
	uint8	ether_shost[ETHER_ADDR_LEN];
	uint16	vlan_type;		/* 0x8100 */
	uint16	vlan_tag;		/* priority, cfi and vid */
	uint16	ether_type;
};

struct dot3_mac_llc_snapvlan_header {
=======
#define SNAP_HDR_LEN	6	/* 802.3 SNAP header length */
#define DOT3_OUI_LEN	3	/* 802.3 oui length */

BWL_PRE_PACKED_STRUCT struct dot3_mac_llc_snap_header {
>>>>>>> 40bb591cb6abaf540bf9a988e3fac0ca86368865:drivers/net/wireless/bcmdhd/common/include/proto/802.3.h
	uint8	ether_dhost[ETHER_ADDR_LEN];	/* dest mac */
	uint8	ether_shost[ETHER_ADDR_LEN];	/* src mac */
	uint16	length;				/* frame length incl header */
	uint8	dsap;				/* always 0xAA */
	uint8	ssap;				/* always 0xAA */
	uint8	ctl;				/* always 0x03 */
<<<<<<< HEAD:drivers/net/wireless/bcmdhd/include/proto/vlan.h
	uint8	oui[3];				/* RFC1042: 0x00 0x00 0x00
						 * Bridge-Tunnel: 0x00 0x00 0xF8
						 */
	uint16	vlan_type;			/* 0x8100 */
	uint16	vlan_tag;			/* priority, cfi and vid */
	uint16	ether_type;			/* ethertype */
};

#define	ETHERVLAN_HDR_LEN	(ETHER_HDR_LEN + VLAN_TAG_LEN)

=======
	uint8	oui[DOT3_OUI_LEN];		/* RFC1042: 0x00 0x00 0x00
						 * Bridge-Tunnel: 0x00 0x00 0xF8
						 */
	uint16	type;				/* ethertype */
} BWL_POST_PACKED_STRUCT;
>>>>>>> 40bb591cb6abaf540bf9a988e3fac0ca86368865:drivers/net/wireless/bcmdhd/common/include/proto/802.3.h

/* This marks the end of a packed structure section. */
#include <packed_section_end.h>

<<<<<<< HEAD:drivers/net/wireless/bcmdhd/include/proto/vlan.h
#define ETHERVLAN_MOVE_HDR(d, s) \
do { \
	struct ethervlan_header t; \
	t = *(struct ethervlan_header *)(s); \
	*(struct ethervlan_header *)(d) = t; \
} while (0)

#endif /* _vlan_h_ */
=======
#endif	/* #ifndef _802_3_h_ */
>>>>>>> 40bb591cb6abaf540bf9a988e3fac0ca86368865:drivers/net/wireless/bcmdhd/common/include/proto/802.3.h
