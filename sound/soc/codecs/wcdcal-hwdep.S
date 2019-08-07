wcdcal_hwdep_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r5, [r0, #188]
	add	r4, r5, #28
	mov	r0, r4
	bl	mutex_lock
	add	r0, r5, #16
	mov	r1, #12
	bl	__memzero
	mov	r0, r4
	bl	mutex_unlock
	ldrd	r4, [sp]
	mov	r0, #0
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
	.fnend
	.size	wcdcal_hwdep_release, .-wcdcal_hwdep_release
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcdcal_hwdep_ioctl, %function
wcdcal_hwdep_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #21761
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movt	r1, 16396
	strd	r6, [sp, #8]
	cmp	r2, r1
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	.pad #16
	sub	sp, sp, #16
	bne	.L18
	mov	r6, #57344
	mov	r2, sp
	movt	r6, 65535
	and	r2, r2, r6
	ldr	r2, [r2, #8]
	.syntax divided
@ 439 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r1, r3, #12; sbcccs r1, r1, r2; movcc r2, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r2, #0
	bne	.L7
	mov	r5, r0
	mov	r1, r3
	mov	r2, #12
	add	r0, sp, #4
	bl	__copy_from_user
	cmp	r0, #0
	bne	.L8
	ldr	r4, [sp, #12]
	ldr	r8, [r5, #188]
	ldr	r5, [sp, #4]
	cmp	r4, #0
	add	r3, r4, #31
	movge	r3, r4
	add	r1, r8, #12
	asr	r3, r3, #5
	and	r2, r4, #31
	ldr	r3, [r1, r3, lsl #2]
	ldr	r1, [sp, #8]
	lsr	r3, r3, r2
	tst	r3, #1
	beq	.L19
	cmp	r4, #2
	bhi	.L20
	movw	ip, #:lower16:.LANCHOR0
	lsl	r7, r4, #2
	movt	ip, #:upper16:.LANCHOR0
	add	r2, ip, r7
	clz	r3, r5
	ldr	r2, [r2, #48]
	lsr	r3, r3, #5
	cmp	r2, r5
	orrcc	r3, r3, #1
	cmp	r3, #0
	bne	.L21
	ldr	r2, [r8, r4, lsl #2]
	mov	r3, sp
	and	r6, r6, r3
	ldr	r3, [r6, #8]
	ldr	r0, [r2]
	.syntax divided
@ 439 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r2, r1, r5; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	beq	.L22
	mov	r1, r5
	mov	r6, r5
	bl	__memzero
.L14:
	cmp	r6, #0
	bne	.L15
	ldr	r3, [r8, r4, lsl #2]
	add	r4, r8, #28
	mov	r0, r4
	str	r5, [r3, #4]
	bl	mutex_lock
	add	r1, r7, #16
	mov	r0, #2
	add	r1, r8, r1
	bl	_set_bit
	mov	r0, r4
	bl	mutex_unlock
	mov	r0, r6
.L4:
	add	sp, sp, #16
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L22:
	mov	r2, r5
	bl	__copy_from_user
	mov	r6, r0
	b	.L14
.L15:
	mvn	r0, #13
	b	.L4
.L21:
	movw	r3, #:lower16:.LANCHOR1
	movw	r0, #:lower16:.LC4
	movt	r3, #:upper16:.LANCHOR1
	mov	r2, r5
	add	r1, ip, #20
	ldr	r3, [r3, r4, lsl #2]
	movt	r0, #:upper16:.LC4
	bl	printk
	mvn	r0, #13
	b	.L4
.L7:
	mov	r1, #12
	add	r0, sp, #4
	bl	__memzero
.L8:
	movw	r1, #:lower16:.LANCHOR0
	movw	r0, #:lower16:.LC1
	movt	r1, #:upper16:.LANCHOR0
	movt	r0, #:upper16:.LC1
	bl	printk
	mvn	r0, #13
	b	.L4
.L20:
	movw	r0, #:lower16:.LC3
	mov	r2, r4
	ldr	r1, .L23
	movt	r0, #:upper16:.LC3
	bl	printk
	mvn	r0, #13
	b	.L4
.L19:
	movw	r0, #:lower16:.LC2
	mov	r2, r4
	ldr	r1, .L23
	movt	r0, #:upper16:.LC2
	bl	printk
	mvn	r0, #13
	b	.L4
.L18:
	movw	r1, #:lower16:.LANCHOR0
	movw	r0, #:lower16:.LC0
	movt	r1, #:upper16:.LANCHOR0
	movt	r0, #:upper16:.LC0
	bl	printk
	movw	r0, #65021
	movt	r0, 65535
	b	.L4
.L24:
	.align	2
.L23:
	.word	.LANCHOR0+20
	.fnend
	.size	wcdcal_hwdep_ioctl, .-wcdcal_hwdep_ioctl
	.align	2
	.global	wcdcal_get_fw_cal
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcdcal_get_fw_cal, %function
wcdcal_get_fw_cal:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	strd	r6, [sp, #8]
	subs	r6, r0, #0
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	beq	.L31
	cmp	r1, #2
	mov	r5, r1
	bhi	.L32
	add	r7, r6, #28
	mov	r0, r7
	bl	mutex_lock
	add	r3, r6, r5, lsl #2
	ldr	r0, [r3, #16]
	ubfx	r4, r0, #2, #1
	cmp	r4, #0
	beq	.L33
	mov	r0, r7
	bl	mutex_unlock
	ldr	r0, [r6, r5, lsl #2]
.L25:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L31:
	movw	r0, #:lower16:.LC5
	ldr	r1, .L34
	movt	r0, #:upper16:.LC5
	bl	printk
	mov	r0, r6
	b	.L25
.L33:
	movw	r0, #:lower16:.LC6
	mov	r2, r5
	ldr	r1, .L34
	movt	r0, #:upper16:.LC6
	bl	printk
	mov	r0, r7
	bl	mutex_unlock
	mov	r0, r4
	b	.L25
.L32:
	movw	r0, #:lower16:.LC3
	mov	r2, r1
	ldr	r1, .L34
	movt	r0, #:upper16:.LC3
	bl	printk
	mov	r0, #0
	b	.L25
.L35:
	.align	2
.L34:
	.word	.LANCHOR0+60
	.fnend
	.size	wcdcal_get_fw_cal, .-wcdcal_get_fw_cal
	.align	2
	.global	wcd_cal_create_hwdep
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd_cal_create_hwdep, %function
wcd_cal_create_hwdep:
	.fnstart
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	clz	r3, r2
	cmp	r0, #0
	strd	r6, [sp, #8]
	movw	r7, #:lower16:__stack_chk_guard
	lsr	r3, r3, #5
	movt	r7, #:upper16:__stack_chk_guard
	strd	r8, [sp, #16]
	ldr	ip, [r7]
	movne	r6, r3
	moveq	r6, #1
	strd	r10, [sp, #24]
	cmp	r6, #0
	str	lr, [sp, #32]
	.pad #52
	sub	sp, sp, #52
	str	ip, [sp, #44]
	bne	.L60
	mov	r8, r2
	movw	r2, #:lower16:.LC8
	mov	r5, r1
	movt	r2, #:upper16:.LC8
	ldr	r3, [r8]
	mov	r1, #8
	mov	r4, r0
	add	r0, sp, #4
	bl	snprintf
	ldr	r0, [r8, #44]
	mov	r2, r5
	add	r1, sp, #4
	mov	r3, sp
	ldr	r0, [r0, #16]
	bl	snd_hwdep_new
	subs	r5, r0, #0
	blt	.L61
	ldr	r0, [sp]
	movw	r2, #:lower16:.LC8
	mov	r1, #8
	movt	r2, #:upper16:.LC8
	ldr	r3, [r8]
	add	r5, r4, #12
	add	r0, r0, #48
	bl	snprintf
	ldr	r3, [sp]
	mov	r1, #18
	movw	r0, #:lower16:wcdcal_hwdep_ioctl
	movw	ip, #:lower16:wcdcal_hwdep_release
	movt	r0, #:upper16:wcdcal_hwdep_ioctl
	movt	ip, #:upper16:wcdcal_hwdep_release
	movw	r2, #:lower16:.LANCHOR2
	movt	r2, #:upper16:.LANCHOR2
	str	r1, [r3, #128]
	movw	r1, #:lower16:.LC10
	str	ip, [r3, #148]
	movt	r1, #:upper16:.LC10
	str	r0, [r3, #156]
	add	r0, r4, #28
	str	r6, [r3, #160]
	str	r4, [r3, #188]
	bl	__mutex_init
	mov	r0, r5
	mov	r1, #3
	bl	_find_first_bit_le
	cmp	r0, #2
	mov	r9, r0
	bgt	.L40
	movw	r6, #:lower16:kmalloc_caches
	movt	r6, #:upper16:kmalloc_caches
.L44:
	add	r3, r9, #4
	mov	r0, #0
	lsl	r3, r3, #2
	add	r1, r4, r3
	sub	r10, r3, #16
	bl	_set_bit
	ldr	r0, [r6, #24]
	cmp	r0, #0
	moveq	r3, #16
	streq	r3, [r4, r10]
	beq	.L42
	mov	r2, #8
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	cmp	r0, #0
	str	r0, [r4, r10]
	bne	.L42
	movw	r3, #:lower16:.LANCHOR1
	movw	r1, #:lower16:.LC11
	ldr	r2, .L63
	movt	r3, #:upper16:.LANCHOR1
	movt	r1, #:upper16:.LC11
	ldr	r0, [r8, #12]
	ldr	r3, [r3, r9, lsl #2]
	bl	dev_err
.L43:
	mov	r1, #3
	mov	r0, r5
	bl	_find_first_bit_le
	cmp	r0, #2
	mov	r6, r0
	movle	r8, #0
	bgt	.L51
.L50:
	ldr	r0, [r4, r6, lsl #2]
	bl	kfree
	str	r8, [r4, r6, lsl #2]
	add	r2, r6, #1
	mov	r1, #3
	mov	r0, r5
	bl	_find_next_bit_le
	cmp	r0, #2
	mov	r6, r0
	ble	.L50
.L51:
	mvn	r5, #11
.L36:
	ldr	r2, [sp, #44]
	mov	r0, r5
	ldr	r3, [r7]
	cmp	r2, r3
	bne	.L62
	add	sp, sp, #52
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L42:
	add	r2, r9, #1
	mov	r1, #3
	mov	r0, r5
	bl	_find_next_bit_le
	cmp	r0, #2
	mov	r9, r0
	ble	.L44
.L40:
	mov	r1, #3
	mov	r0, r5
	bl	_find_first_bit_le
	cmp	r0, #2
	mov	r6, r0
	bgt	.L45
	movw	r10, #:lower16:.LANCHOR0
	movt	r10, #:upper16:.LANCHOR0
	b	.L49
.L46:
	add	r1, r9, #16
	mov	r0, #1
	add	r1, r4, r1
	bl	_set_bit
	add	r2, r6, #1
	mov	r1, #3
	mov	r0, r5
	bl	_find_next_bit_le
	cmp	r0, #2
	mov	r6, r0
	bgt	.L45
.L49:
	lsl	r9, r6, #2
	ldr	fp, [r4, r6, lsl #2]
	movw	r1, #32976
	add	r3, r10, r9
	ldr	r0, [r3, #48]
	bl	__kmalloc
	str	r0, [fp]
	ldr	r3, [r4, r6, lsl #2]
	ldr	fp, [r3]
	cmp	fp, #0
	bne	.L46
	movw	r3, #:lower16:.LANCHOR1
	movw	r1, #:lower16:.LC12
	ldr	r2, .L63
	movt	r3, #:upper16:.LANCHOR1
	movt	r1, #:upper16:.LC12
	ldr	r0, [r8, #12]
	ldr	r3, [r3, r6, lsl #2]
	bl	dev_err
	mov	r1, #3
	mov	r0, r5
	bl	_find_first_bit_le
	cmp	r0, #2
	mov	r6, r0
	bgt	.L43
.L47:
	ldr	r3, [r4, r6, lsl #2]
	ldr	r0, [r3]
	bl	kfree
	ldr	r3, [r4, r6, lsl #2]
	add	r2, r6, #1
	mov	r1, #3
	mov	r0, r5
	str	fp, [r3]
	bl	_find_next_bit_le
	cmp	r0, #2
	mov	r6, r0
	ble	.L47
	b	.L43
.L61:
	movw	r1, #:lower16:.LC9
	mov	r3, r5
	ldr	r2, .L63
	movt	r1, #:upper16:.LC9
	ldr	r0, [r8, #12]
	bl	dev_err
	b	.L36
.L45:
	mov	r5, #0
	b	.L36
.L62:
	bl	__stack_chk_fail
.L60:
	movw	r0, #:lower16:.LC7
	ldr	r1, .L63
	mvn	r5, #21
	movt	r0, #:upper16:.LC7
	bl	printk
	b	.L36
.L64:
	.align	2
.L63:
	.word	.LANCHOR0+80
	.fnend
	.size	wcd_cal_create_hwdep, .-wcd_cal_create_hwdep
	.global	cal_name_info
	.global	cal_size_info
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.26423, %object
	.size	__func__.26423, 19
__func__.26423:
	.ascii	"wcdcal_hwdep_ioctl\000"
	.space	1
	.type	__func__.26414, %object
	.size	__func__.26414, 26
__func__.26414:
	.ascii	"wcdcal_hwdep_ioctl_shared\000"
	.space	2
	.type	cal_size_info, %object
	.size	cal_size_info, 12
cal_size_info:
	.word	4096
	.word	4096
	.word	4096
	.type	__func__.26406, %object
	.size	__func__.26406, 18
__func__.26406:
	.ascii	"wcdcal_get_fw_cal\000"
	.space	2
	.type	__func__.26443, %object
	.size	__func__.26443, 21
__func__.26443:
	.ascii	"wcd_cal_create_hwdep\000"
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	cal_name_info, %object
	.size	cal_name_info, 12
cal_name_info:
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.bss
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__key.26444, %object
	.size	__key.26444, 0
__key.26444:
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>%s: wrong ioctl command sent %d!\012\000"
	.space	3
.LC1:
	.ascii	"<3>%s: failed to copy\012\000"
	.space	1
.LC2:
	.ascii	"<3>%s: codec didn't set this %d!!\012\000"
	.space	1
.LC3:
	.ascii	"<3>%s: wrong cal type sent %d\012\000"
	.space	1
.LC4:
	.ascii	"<3>%s: incorrect firmware size %d for %s\012\000"
	.space	2
.LC5:
	.ascii	"<3>%s: fw_data is NULL\012\000"
.LC6:
	.ascii	"<3>%s: cal not sent by userspace %d\012\000"
	.space	3
.LC7:
	.ascii	"<3>%s: wrong arguments passed\012\000"
	.space	1
.LC8:
	.ascii	"Codec %s\000"
	.space	3
.LC9:
	.ascii	"%s: new hwdep failed %d\012\000"
	.space	3
.LC10:
	.ascii	"&fw_data->lock\000"
	.space	1
.LC11:
	.ascii	"%s: no memory for %s cal\012\000"
	.space	2
.LC12:
	.ascii	"%s: no memory for %s cal data\012\000"
	.space	1
.LC13:
	.ascii	"anc\000"
.LC14:
	.ascii	"mad\000"
.LC15:
	.ascii	"mbhc\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
