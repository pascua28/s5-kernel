es705_i2c_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	ip, #1
	mov	r4, r2
	str	lr, [sp, #4]
	ldr	r0, [r0, #120]
	.pad #16
	sub	sp, sp, #16
	mov	r2, ip
	ldrh	r3, [r0, #2]
	str	r1, [sp, #12]
	ldr	r0, [r0, #24]
	add	r1, sp, #4
	strh	r3, [sp, #4]	@ movhi
	strh	ip, [sp, #6]	@ movhi
	strh	r4, [sp, #8]	@ movhi
	bl	i2c_transfer
	cmp	r0, #1
	moveq	r0, #0
	bne	.L6
.L1:
	add	sp, sp, #16
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L6:
	mov	r2, r0
	movw	r1, #:lower16:.LANCHOR0
	movw	r0, #:lower16:.LC0
	mov	r3, r4
	movt	r1, #:upper16:.LANCHOR0
	movt	r0, #:upper16:.LC0
	bl	printk
	mvn	r0, #4
	b	.L1
	.fnend
	.size	es705_i2c_read, .-es705_i2c_read
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_i2c_write, %function
es705_i2c_write:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-20]!
	.save {r4, r5, r6, r7, lr}
	mov	r4, #0
	subs	r5, r2, #0
	strd	r6, [sp, #8]
	str	lr, [sp, #16]
	ldr	ip, [r0, #120]
	.pad #28
	sub	sp, sp, #28
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r4, [sp, #20]
	ldrh	r3, [ip, #2]
	strh	r3, [sp, #12]	@ movhi
	ble	.L8
	mov	r7, r1
	mov	r6, r0
	b	.L11
.L9:
	ldrh	r3, [sp, #16]
	add	r4, r4, r3
	cmp	r5, r4
	ble	.L8
	ldr	ip, [r6, #120]
.L11:
	sub	r3, r5, r4
	add	lr, r7, r4
	ldr	r0, [ip, #24]
	cmp	r3, #512
	mov	r2, #1
	movge	r3, #512
	add	r1, sp, #12
	strh	r3, [sp, #16]	@ movhi
	str	lr, [sp, #20]
	bl	i2c_transfer
	cmp	r0, #1
	beq	.L9
	ldr	ip, [r6]
	movw	r1, #:lower16:.LC1
	mov	r3, r0
	movt	r1, #:upper16:.LC1
	ldr	r2, .L13
	str	r5, [sp]
	mov	r0, ip
	bl	dev_err
	mvn	r0, #4
	b	.L7
.L8:
	mov	r0, #0
.L7:
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
.L14:
	.align	2
.L13:
	.word	.LANCHOR0+16
	.fnend
	.size	es705_i2c_write, .-es705_i2c_write
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_i2c_remove, %function
es705_i2c_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r4, r0
	str	lr, [sp, #4]
	add	r4, r4, #32
	ldr	r0, [r0, #116]
	bl	es705_gpio_free
	mov	r0, r4
	bl	snd_soc_unregister_codec
	mov	r0, r4
	bl	dev_get_drvdata
	bl	kfree
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, #0
	ldr	pc, [sp], #4
	.fnend
	.size	es705_i2c_remove, .-es705_i2c_remove
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_i2c_boot_setup, %function
es705_i2c_boot_setup:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r3, #256
	mov	r2, #2
	str	r6, [sp, #8]
	mov	r5, r0
	str	lr, [sp, #12]
	.pad #8
	sub	sp, sp, #8
	add	r4, sp, #8
	strh	r3, [r4, #-2]!	@ movhi
	ldr	r3, [r0, #56]
	mov	r1, r4
	blx	r3
	subs	r6, r0, #0
	blt	.L22
	mov	r1, #1000
	mov	r0, r1
	bl	usleep_range
	mov	r1, #2
	mov	r0, r4
	bl	__memzero
	mov	r1, r4
	mov	r2, #2
	ldr	r3, [r5, #52]
	mov	r0, r5
	blx	r3
	subs	r6, r0, #0
	blt	.L23
	ldrh	r2, [sp, #6]
	movw	r3, #257
	cmp	r2, r3
	bne	.L24
.L17:
	mov	r0, r6
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L22:
	movw	r1, #:lower16:.LC2
	ldr	r2, .L25
	movt	r1, #:upper16:.LC2
	ldr	r0, [r5]
	bl	dev_err
	b	.L17
.L23:
	movw	r1, #:lower16:.LC3
	ldr	r2, .L25
	movt	r1, #:upper16:.LC3
	ldr	r0, [r5]
	bl	dev_err
	b	.L17
.L24:
.L19:
	movw	r1, #:lower16:.LC4
	ldr	r2, .L25
	mvn	r6, #4
	movt	r1, #:upper16:.LC4
	ldr	r0, [r5]
	bl	dev_err
	b	.L17
.L26:
	.align	2
.L25:
	.word	.LANCHOR0+32
	.fnend
	.size	es705_i2c_boot_setup, .-es705_i2c_boot_setup
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_i2c_probe, %function
es705_i2c_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movw	r4, #:lower16:es705_priv
	add	r5, r0, #32
	strd	r6, [sp, #8]
	movt	r4, #:upper16:es705_priv
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r3, [r0, #116]
	str	r0, [r4, #120]
	cmp	r3, #0
	beq	.L33
	mov	r1, r4
	mov	r0, r5
	bl	dev_set_drvdata
	movw	r3, #:lower16:.LANCHOR1
	movw	lr, #:lower16:es705_i2c_read
	movt	r3, #:upper16:.LANCHOR1
	movw	ip, #:lower16:es705_i2c_write
	ldrd	r0, [r3]
	movt	lr, #:upper16:es705_i2c_read
	movt	ip, #:upper16:es705_i2c_write
	ldrd	r6, [r3, #8]
	mov	r2, r4
	ldr	r8, [r3, #16]
	movw	r3, #:lower16:es705_i2c_cmd
	str	r5, [r2], #32
	movt	r3, #:upper16:es705_i2c_cmd
	strd	r0, [r4, #32]
	movw	r1, #:lower16:es705_i2c_boot_finish
	mov	r0, r5
	str	lr, [r4, #52]
	movw	lr, #:lower16:es705_i2c_write_then_read
	movt	r1, #:upper16:es705_i2c_boot_finish
	str	ip, [r4, #56]
	movw	ip, #:lower16:es705_i2c_boot_setup
	movt	lr, #:upper16:es705_i2c_write_then_read
	strd	r6, [r2, #8]
	movt	ip, #:upper16:es705_i2c_boot_setup
	str	r8, [r2, #16]
	mov	r2, #1
	str	r2, [r4, #24]
	str	lr, [r4, #60]
	str	ip, [r4, #68]
	str	r1, [r4, #72]
	str	r3, [r4, #116]
	bl	es705_core_probe
	subs	r6, r0, #0
	bne	.L34
	mov	r0, r4
	bl	es705_bootup
	subs	r6, r0, #0
	bne	.L35
	movw	r2, #:lower16:es705_dai
	movw	r1, #:lower16:soc_codec_dev_es705
	ldrd	r6, [sp, #8]
	mov	r0, r5
	movt	r2, #:upper16:es705_dai
	ldrd	r4, [sp]
	ldr	r8, [sp, #16]
	movt	r1, #:upper16:soc_codec_dev_es705
	mov	r3, #10
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	snd_soc_register_codec
.L35:
	movw	r1, #:lower16:.LC7
	mov	r0, r5
	ldr	r2, .L36
	movt	r1, #:upper16:.LC7
	mov	r3, r6
	bl	dev_err
.L27:
	mov	r0, r6
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L34:
	movw	r1, #:lower16:.LC6
	mov	r0, r5
	ldr	r2, .L36
	movt	r1, #:upper16:.LC6
	mov	r3, r6
	bl	dev_err
	b	.L27
.L33:
	movw	r1, #:lower16:.LC5
	mov	r0, r5
	ldr	r2, .L36
	movt	r1, #:upper16:.LC5
	mvn	r6, #4
	bl	dev_err
	b	.L27
.L37:
	.align	2
.L36:
	.word	.LANCHOR0+56
	.fnend
	.size	es705_i2c_probe, .-es705_i2c_probe
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_i2c_write_then_read, %function
es705_i2c_write_then_read:
	.fnstart
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, #0
	subs	r5, r2, #0
	strd	r6, [sp, #8]
	mov	r6, r0
	str	r8, [sp, #16]
	mov	r8, r3
	str	lr, [sp, #20]
	ldr	r0, [r0, #120]
	.pad #24
	sub	sp, sp, #24
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	str	r4, [sp, #20]
	ldrh	r3, [r0, #2]
	strh	r3, [sp, #12]	@ movhi
	ble	.L39
	mov	r7, r1
	b	.L42
.L40:
	ldrh	r3, [sp, #16]
	ldr	r0, [r6, #120]
	add	r4, r4, r3
	cmp	r5, r4
	ble	.L39
.L42:
	sub	r3, r5, r4
	add	r1, r7, r4
	cmp	r3, #512
	mov	r2, #1
	movge	r3, #512
	strh	r3, [sp, #16]	@ movhi
	str	r1, [sp, #20]
	add	r1, sp, #12
	ldr	r0, [r0, #24]
	bl	i2c_transfer
	cmp	r0, #1
	beq	.L40
	ldr	ip, [r6]
	movw	r1, #:lower16:.LC1
	mov	r3, r0
	movt	r1, #:upper16:.LC1
	ldr	r2, .L48
	str	r5, [sp]
	mov	r0, ip
	bl	dev_err
	mvn	r0, #4
	b	.L38
.L39:
	ldrh	ip, [r0, #2]
	mov	r3, #1
	add	r1, sp, #12
	ldr	r2, [sp, #48]
	strh	ip, [sp, #12]	@ movhi
	strh	r3, [sp, #14]	@ movhi
	strh	r2, [sp, #16]	@ movhi
	mov	r2, r3
	str	r8, [sp, #20]
	ldr	r0, [r0, #24]
	bl	i2c_transfer
	cmp	r0, #1
	mov	r2, r0
	moveq	r0, #0
	bne	.L47
.L38:
	add	sp, sp, #24
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L47:
	movw	r1, #:lower16:.LANCHOR0
	movw	r0, #:lower16:.LC0
	ldr	r3, [sp, #48]
	movt	r1, #:upper16:.LANCHOR0
	movt	r0, #:upper16:.LC0
	bl	printk
	mvn	r0, #4
	b	.L38
.L49:
	.align	2
.L48:
	.word	.LANCHOR0+16
	.fnend
	.size	es705_i2c_write_then_read, .-es705_i2c_write_then_read
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_i2c_boot_finish, %function
es705_i2c_boot_finish:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	str	r6, [sp, #8]
	mov	r6, r0
	mov	r0, #20
	str	lr, [sp, #12]
	ldr	r3, [r6, #1172]
	.pad #32
	sub	sp, sp, #32
	cmp	r3, #5
	movne	r3, #-2147483648
	moveq	r3, #-2147483644
	str	r3, [sp, #12]
	str	r3, [sp, #16]
	bl	msleep
	ldr	r0, [r6, #120]
	mov	r3, #0
	mov	r4, r3
	str	r3, [sp, #20]
	str	r3, [sp, #24]
	str	r3, [sp, #28]
	ldrh	r3, [r0, #2]
	strh	r3, [sp, #20]	@ movhi
.L54:
	add	r2, sp, #12
	rsb	r3, r4, #4
	add	ip, r2, r4
	add	r1, sp, #20
	strh	r3, [sp, #24]	@ movhi
	mov	r2, #1
	str	ip, [sp, #28]
	ldr	r0, [r0, #24]
	bl	i2c_transfer
	cmp	r0, #1
	mov	r5, r0
	bne	.L60
	ldrh	r3, [sp, #24]
	ldr	r0, [r6, #120]
	add	r4, r4, r3
	cmp	r4, #3
	ble	.L54
	ldrh	r3, [r0, #2]
	add	r2, sp, #16
	add	r1, sp, #20
	strh	r3, [sp, #20]	@ movhi
	strh	r5, [sp, #22]	@ movhi
	strh	r5, [sp, #24]	@ movhi
	str	r2, [sp, #28]
	mov	r2, r5
	ldr	r0, [r0, #24]
	bl	i2c_transfer
	cmp	r0, #1
	mov	r2, r0
	moveq	r0, #0
	bne	.L61
.L50:
	add	sp, sp, #32
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L60:
	mov	ip, #4
	movw	r1, #:lower16:.LC1
	ldr	r2, .L62
	mov	r3, r0
	movt	r1, #:upper16:.LC1
	ldr	r0, [r6]
	str	ip, [sp]
	bl	dev_err
.L53:
	movw	r1, #:lower16:.LC8
	ldr	r2, .L62+4
	movt	r1, #:upper16:.LC8
	ldr	r0, [r6]
	bl	dev_err
	mvn	r0, #4
	b	.L50
.L61:
	movw	r1, #:lower16:.LANCHOR0
	movw	r0, #:lower16:.LC0
	mov	r3, r5
	movt	r1, #:upper16:.LANCHOR0
	movt	r0, #:upper16:.LC0
	bl	printk
	b	.L53
.L63:
	.align	2
.L62:
	.word	.LANCHOR0+16
	.word	.LANCHOR0+72
	.fnend
	.size	es705_i2c_boot_finish, .-es705_i2c_boot_finish
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_i2c_cmd, %function
es705_i2c_cmd:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	strd	r6, [sp, #8]
	mov	r6, r0
	mov	r0, #0
	str	r8, [sp, #16]
	mov	r8, r3
	mov	r7, r2
	str	lr, [sp, #20]
	ldr	ip, [r6, #120]
	.pad #32
	sub	sp, sp, #32
	.syntax divided
@ 38 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/swab.h" 1
	rev r1, r1
@ 0 "" 2
	.arm
	.syntax unified
	str	r1, [sp, #12]
	mov	r4, r0
	str	r0, [sp, #20]
	str	r0, [sp, #24]
	str	r0, [sp, #28]
	ldrh	r3, [ip, #2]
	strh	r3, [sp, #20]	@ movhi
	b	.L68
.L74:
	ldr	ip, [r6, #120]
.L68:
	add	r2, sp, #12
	rsb	r3, r4, #4
	add	r0, r2, r4
	add	r1, sp, #20
	strh	r3, [sp, #24]	@ movhi
	mov	r2, #1
	str	r0, [sp, #28]
	ldr	r0, [ip, #24]
	bl	i2c_transfer
	cmp	r0, #1
	mov	r5, r0
	bne	.L73
	ldrh	r3, [sp, #24]
	add	r4, r4, r3
	cmp	r4, #3
	ble	.L74
	cmp	r7, #0
	movne	r0, #0
	bne	.L64
	movw	r1, #10500
	movw	r0, #10000
	bl	usleep_range
	ldr	r0, [r6, #120]
	add	ip, sp, #16
	mov	r4, #4
	mov	r2, r5
	add	r1, sp, #20
	ldrh	r3, [r0, #2]
	strh	r3, [sp, #20]	@ movhi
	strh	r5, [sp, #22]	@ movhi
	strh	r4, [sp, #24]	@ movhi
	str	ip, [sp, #28]
	ldr	r0, [r0, #24]
	bl	i2c_transfer
	cmp	r0, #1
	mov	r2, r0
	bne	.L69
	mov	r0, r7
	ldr	r3, [sp, #16]
	.syntax divided
@ 38 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/swab.h" 1
	rev r3, r3
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [r8]
.L64:
	add	sp, sp, #32
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L73:
	mov	ip, #4
	movw	r1, #:lower16:.LC1
	ldr	r2, .L75
	mov	r3, r0
	movt	r1, #:upper16:.LC1
	ldr	r0, [r6]
	str	ip, [sp]
	bl	dev_err
	mvn	r0, #4
	b	.L64
.L69:
	movw	r1, #:lower16:.LANCHOR0
	movw	r0, #:lower16:.LC0
	mov	r3, r4
	movt	r1, #:upper16:.LANCHOR0
	movt	r0, #:upper16:.LC0
	bl	printk
	mvn	r0, #4
	b	.L64
.L76:
	.align	2
.L75:
	.word	.LANCHOR0+16
	.fnend
	.size	es705_i2c_cmd, .-es705_i2c_cmd
	.align	2
	.global	es705_i2c_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_i2c_init, %function
es705_i2c_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	ldr	r1, .L81
	mov	r5, r0
	mov	r0, #0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	bl	i2c_register_driver
	subs	r4, r0, #0
	bne	.L78
	movw	r3, #:lower16:es705_priv
	mov	r2, #1
	movt	r3, #:upper16:es705_priv
	str	r2, [r3, #24]
.L77:
	mov	r0, r4
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L78:
	movw	r1, #:lower16:.LC9
	mov	r3, r4
	ldr	r2, .L81+4
	movt	r1, #:upper16:.LC9
	ldr	r0, [r5]
	bl	dev_err
	b	.L77
.L82:
	.align	2
.L81:
	.word	.LANCHOR1+20
	.word	.LANCHOR0+96
	.fnend
	.size	es705_i2c_init, .-es705_i2c_init
	.global	es705_i2c_driver
	.global	i2c_streamdev
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.27619, %object
	.size	__func__.27619, 15
__func__.27619:
	.ascii	"es705_i2c_read\000"
	.space	1
	.type	__func__.27631, %object
	.size	__func__.27631, 16
__func__.27631:
	.ascii	"es705_i2c_write\000"
	.type	__func__.27661, %object
	.size	__func__.27661, 21
__func__.27661:
	.ascii	"es705_i2c_boot_setup\000"
	.space	3
	.type	__func__.27685, %object
	.size	__func__.27685, 16
__func__.27685:
	.ascii	"es705_i2c_probe\000"
	.type	__func__.27675, %object
	.size	__func__.27675, 22
__func__.27675:
	.ascii	"es705_i2c_boot_finish\000"
	.space	2
	.type	__func__.27701, %object
	.size	__func__.27701, 15
__func__.27701:
	.ascii	"es705_i2c_init\000"
	.space	1
	.type	es705_i2c_id, %object
	.size	es705_i2c_id, 48
es705_i2c_id:
	.ascii	"es705\000"
	.space	14
	.word	0
	.space	24
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	i2c_streamdev, %object
	.size	i2c_streamdev, 20
i2c_streamdev:
	.space	4
	.word	es705_i2c_read
	.space	8
	.word	1
	.type	es705_i2c_driver, %object
	.size	es705_i2c_driver, 116
es705_i2c_driver:
	.space	12
	.word	es705_i2c_probe
	.word	es705_i2c_remove
	.space	20
	.word	.LC10
	.space	4
	.word	0
	.space	44
	.word	es705_i2c_id
	.space	16
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<3>%s(): i2c_transfer() failed, rc = %d, msg_len = "
	.ascii	"%d\012\000"
	.space	1
.LC1:
	.ascii	"%s(): i2c_transfer() failed, rc = %d, msg_len = %d\012"
	.ascii	"\000"
.LC2:
	.ascii	"%s(): firmware load failed boot write\012\000"
	.space	1
.LC3:
	.ascii	"%s(): firmware load failed boot ack\012\000"
	.space	3
.LC4:
	.ascii	"%s(): firmware load failed boot ack pattern\000"
.LC5:
	.ascii	"%s(): pdata is NULL\000"
.LC6:
	.ascii	"%s(): es705_core_probe() failed %d\012\000"
.LC7:
	.ascii	"%s(): es705_bootup failed %d\012\000"
	.space	2
.LC8:
	.ascii	"%s(): SYNC fail\012\000"
	.space	3
.LC9:
	.ascii	"%s(): i2c_add_driver failed, rc = %d\000"
	.space	3
.LC10:
	.ascii	"es705-codec\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
