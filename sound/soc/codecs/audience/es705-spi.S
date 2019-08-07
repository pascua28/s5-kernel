es705_spi_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_spi_init, .-es705_spi_init
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_spi_read, %function
es705_spi_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	mov	r3, #0
	str	lr, [sp, #8]
	.pad #84
	sub	sp, sp, #84
	ldr	r5, [r0, #132]
	add	r4, sp, #36
	mov	r0, r4
	str	r3, [sp]
	stmib	sp, {r1, r2, r3}
	mov	r1, #44
	str	r3, [sp, #16]
	str	r3, [sp, #20]
	str	r3, [sp, #24]
	str	r3, [sp, #28]
	str	r3, [sp, #32]
	bl	__memzero
	add	r3, sp, #28
	mov	r1, r4
	str	r4, [sp, #28]
	mov	r0, r5
	str	r4, [sp, #32]
	str	r3, [sp, #36]
	str	r3, [sp, #40]
	bl	spi_sync
	subs	r4, r0, #0
	blt	.L6
.L2:
	mov	r0, r4
	add	sp, sp, #84
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L6:
	movw	r2, #:lower16:.LANCHOR0
	movw	r1, #:lower16:.LC0
	mov	r0, r5
	movt	r2, #:upper16:.LANCHOR0
	movt	r1, #:upper16:.LC0
	mov	r3, r4
	bl	dev_err
	b	.L2
	.fnend
	.size	es705_spi_read, .-es705_spi_read
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_spi_write, %function
es705_spi_write:
	.fnstart
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-20]!
	.save {r4, r5, r6, r7, lr}
	strd	r6, [sp, #8]
	mov	r6, #0
	mov	r7, #0
	str	lr, [sp, #16]
	.pad #84
	sub	sp, sp, #84
	ldr	r5, [r0, #132]
	add	r4, sp, #36
	mov	r0, r4
	str	r1, [sp]
	mov	r1, #44
	strd	r6, [sp, #4]
	str	r2, [sp, #8]
	strd	r6, [sp, #12]
	strd	r6, [sp, #20]
	strd	r6, [sp, #28]
	bl	__memzero
	add	r3, sp, #28
	mov	r1, r4
	str	r4, [sp, #28]
	mov	r0, r5
	str	r4, [sp, #32]
	str	r3, [sp, #36]
	str	r3, [sp, #40]
	bl	spi_sync
	subs	r4, r0, #0
	beq	.L7
	movw	r1, #:lower16:.LC1
	mov	r0, r5
	ldr	r2, .L13
	movt	r1, #:upper16:.LC1
	mov	r3, r4
	bl	dev_err
.L7:
	mov	r0, r4
	add	sp, sp, #84
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
	.size	es705_spi_write, .-es705_spi_write
	.section	.devexit.text,"ax",%progbits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_spi_remove, %function
es705_spi_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	bl	snd_soc_unregister_codec
	mov	r0, #0
	pop	{r4, pc}
	.fnend
	.size	es705_spi_remove, .-es705_spi_remove
	.section	.devinit.text,"ax",%progbits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_spi_probe, %function
es705_spi_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:es705_priv
	movt	r4, #:upper16:es705_priv
	mov	r3, #2
	ldr	r2, .L24
	movw	r1, #:lower16:es705_spi_write
	movw	r6, #:lower16:es705_spi_read
	movt	r1, #:upper16:es705_spi_write
	str	r3, [r4, #24]
	movw	r5, #:lower16:es705_spi_write_then_read
	movw	lr, #:lower16:es705_spi_boot_setup
	movw	ip, #:lower16:es705_spi_boot_finish
	movw	r3, #:lower16:es705_spi_cmd
	movt	lr, #:upper16:es705_spi_boot_setup
	str	r1, [r4, #56]
	movt	ip, #:upper16:es705_spi_boot_finish
	movt	r3, #:upper16:es705_spi_cmd
	movt	r6, #:upper16:es705_spi_read
	movt	r5, #:upper16:es705_spi_write_then_read
	movw	r1, #:lower16:.LC2
	movt	r1, #:upper16:.LC2
	str	r6, [r4, #52]
	mov	r6, r0
	str	r5, [r4, #60]
	str	lr, [r4, #68]
	str	ip, [r4, #72]
	str	r3, [r4, #116]
	str	r0, [r4, #132]
	bl	_dev_info
	movw	ip, #:lower16:.LANCHOR1
	add	lr, r4, #32
	movt	ip, #:upper16:.LANCHOR1
	ldmia	ip!, {r0, r1, r2, r3}
	ldr	ip, [ip]
	stmia	lr!, {r0, r1, r2, r3}
	mov	r0, r6
	str	ip, [lr]
	bl	es705_core_probe
	subs	r5, r0, #0
	beq	.L18
	movw	r1, #:lower16:.LC3
	mov	r0, r6
	ldr	r2, .L24
	movt	r1, #:upper16:.LC3
	mov	r3, r5
	bl	dev_err
	b	.L17
.L18:
	mov	r0, r4
	bl	es705_bootup
	subs	r5, r0, #0
	beq	.L17
	movw	r1, #:lower16:.LC4
	mov	r0, r6
	ldr	r2, .L24
	movt	r1, #:upper16:.LC4
	mov	r3, r5
	bl	dev_err
.L17:
	mov	r0, r5
	pop	{r4, r5, r6, pc}
.L25:
	.align	2
.L24:
	.word	.LANCHOR0+32
	.fnend
	.size	es705_spi_probe, .-es705_spi_probe
	.section	.exit.text,"ax",%progbits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_spi_exit, %function
es705_spi_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L27
	b	driver_unregister
.L28:
	.align	2
.L27:
	.word	.LANCHOR1+44
	.fnend
	.size	es705_spi_exit, .-es705_spi_exit
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_spi_cmd, %function
es705_spi_cmd:
	.fnstart
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r2
	strd	r6, [sp, #8]
	mov	r7, #4
	strd	r8, [sp, #16]
	mov	r8, #0
	mov	r9, #0
	strd	r10, [sp, #24]
	mov	r10, r0
	str	lr, [sp, #32]
	.pad #100
	sub	sp, sp, #100
	ldr	fp, [r0, #132]
	add	r5, sp, #52
	add	ip, sp, #4
	.syntax divided
@ 38 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/swab.h" 1
	rev r1, r1
@ 0 "" 2
	.arm
	.syntax unified
	mov	r0, r5
	str	r3, [sp]
	str	r1, [sp, #4]
	mov	r1, #44
	add	r6, sp, r1
	str	ip, [sp, #16]
	strd	r8, [sp, #20]
	str	r7, [sp, #24]
	strd	r8, [sp, #28]
	strd	r8, [sp, #36]
	strd	r8, [sp, #44]
	bl	__memzero
	mov	r0, fp
	mov	r1, r5
	str	r5, [sp, #44]
	str	r5, [sp, #48]
	str	r6, [sp, #52]
	str	r6, [sp, #56]
	bl	spi_sync
	subs	r8, r0, #0
	bne	.L39
	cmp	r4, #0
	bne	.L29
	movw	r1, #20500
	movw	r0, #20000
	mov	fp, r7
	mov	r7, #16
	bl	usleep_range
	b	.L34
.L32:
	bl	usleep_range
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L40
	subs	r7, r7, #1
	beq	.L41
.L34:
	ldr	r9, [r10, #132]
	add	r3, sp, #12
	mov	r1, #44
	mov	r0, r5
	str	r4, [sp, #16]
	str	r3, [sp, #20]
	str	fp, [sp, #24]
	str	r4, [sp, #28]
	str	r4, [sp, #32]
	str	r4, [sp, #36]
	str	r4, [sp, #40]
	str	r4, [sp, #44]
	str	r4, [sp, #48]
	bl	__memzero
	mov	r1, r5
	mov	r0, r9
	str	r5, [sp, #44]
	str	r5, [sp, #48]
	str	r6, [sp, #52]
	str	r6, [sp, #56]
	bl	spi_sync
	subs	r8, r0, #0
	movw	r1, #1050
	mov	r0, #1000
	bge	.L32
	movw	r2, #:lower16:.LANCHOR0
	movw	r1, #:lower16:.LC0
	mov	r0, r9
	movt	r2, #:upper16:.LANCHOR0
	movt	r1, #:upper16:.LC0
	mov	r3, r8
	bl	dev_err
.L29:
	mov	r0, r8
	add	sp, sp, #100
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L39:
	movw	r1, #:lower16:.LC1
	mov	r0, fp
	ldr	r2, .L42
	movt	r1, #:upper16:.LC1
	mov	r3, r8
	bl	dev_err
	b	.L29
.L40:
	cmp	r8, #0
	bne	.L29
	ldr	r2, [sp]
	.syntax divided
@ 38 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/swab.h" 1
	rev r3, r3
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [r2]
	b	.L29
.L41:
	mvn	r8, #109
	b	.L29
.L43:
	.align	2
.L42:
	.word	.LANCHOR0+16
	.fnend
	.size	es705_spi_cmd, .-es705_spi_cmd
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_spi_write_then_read, %function
es705_spi_write_then_read:
	.fnstart
	@ args = 4, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	mov	r6, #0
	mov	r7, #0
	strd	r8, [sp, #16]
	mov	r9, r0
	strd	r10, [sp, #24]
	mov	fp, r3
	str	lr, [sp, #32]
	ldr	r10, [r0, #132]
	.pad #84
	sub	sp, sp, #84
	add	r4, sp, #36
	add	r8, sp, #28
	mov	r0, r4
	str	r1, [sp]
	mov	r1, #44
	strd	r6, [sp, #4]
	str	r2, [sp, #8]
	strd	r6, [sp, #12]
	strd	r6, [sp, #20]
	strd	r6, [sp, #28]
	bl	__memzero
	mov	r0, r10
	mov	r1, r4
	str	r4, [sp, #28]
	str	r4, [sp, #32]
	str	r8, [sp, #36]
	str	r8, [sp, #40]
	bl	spi_sync
	subs	r5, r0, #0
	bne	.L49
	ldr	r3, [sp, #120]
	mov	r1, #44
	mov	r0, r4
	ldr	r6, [r9, #132]
	stm	sp, {r5, fp}
	str	r3, [sp, #8]
	str	r5, [sp, #12]
	str	r5, [sp, #16]
	str	r5, [sp, #20]
	str	r5, [sp, #24]
	str	r5, [sp, #28]
	str	r5, [sp, #32]
	bl	__memzero
	mov	r1, r4
	mov	r0, r6
	str	r4, [sp, #28]
	str	r4, [sp, #32]
	str	r8, [sp, #36]
	str	r8, [sp, #40]
	bl	spi_sync
	subs	r5, r0, #0
	blt	.L47
.L44:
	mov	r0, r5
	add	sp, sp, #84
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L49:
	movw	r1, #:lower16:.LC1
	mov	r0, r10
	ldr	r2, .L50
	movt	r1, #:upper16:.LC1
	mov	r3, r5
	bl	dev_err
	b	.L44
.L47:
	movw	r2, #:lower16:.LANCHOR0
	movw	r1, #:lower16:.LC0
	mov	r0, r6
	movt	r2, #:upper16:.LANCHOR0
	movt	r1, #:upper16:.LC0
	mov	r3, r5
	bl	dev_err
	b	.L44
.L51:
	.align	2
.L50:
	.word	.LANCHOR0+16
	.fnend
	.size	es705_spi_write_then_read, .-es705_spi_write_then_read
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_spi_boot_finish, %function
es705_spi_boot_finish:
	.fnstart
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	strd	r6, [sp, #8]
	mov	r7, r0
	mov	r0, #20
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r3, [r7, #1172]
	.pad #88
	sub	sp, sp, #88
	add	r4, sp, #44
	add	r6, sp, #36
	cmp	r3, #5
	moveq	r3, #-2147483644
	movne	r3, #-2147483648
	str	r3, [sp]
	str	r3, [sp, #4]
	bl	msleep
	ldr	r8, [r7, #132]
	mov	r2, #0
	mov	r3, #0
	mov	ip, #4
	mov	r0, r4
	str	sp, [sp, #8]
	mov	r1, #44
	strd	r2, [sp, #12]
	str	ip, [sp, #16]
	strd	r2, [sp, #20]
	strd	r2, [sp, #28]
	strd	r2, [sp, #36]
	bl	__memzero
	mov	r0, r8
	mov	r1, r4
	str	r4, [sp, #36]
	str	r4, [sp, #40]
	str	r6, [sp, #44]
	str	r6, [sp, #48]
	bl	spi_sync
	subs	r5, r0, #0
	bne	.L62
	ldr	r8, [r7, #132]
	add	r2, sp, #4
	mov	r3, #1
	mov	r1, #44
	mov	r0, r4
	str	r5, [sp, #8]
	strd	r2, [sp, #12]
	str	r5, [sp, #20]
	str	r5, [sp, #24]
	str	r5, [sp, #28]
	str	r5, [sp, #32]
	str	r5, [sp, #36]
	str	r5, [sp, #40]
	bl	__memzero
	mov	r1, r4
	mov	r0, r8
	str	r4, [sp, #36]
	str	r4, [sp, #40]
	str	r6, [sp, #44]
	str	r6, [sp, #48]
	bl	spi_sync
	subs	r5, r0, #0
	blt	.L63
	bne	.L55
.L52:
	mov	r0, r5
	add	sp, sp, #88
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L62:
	movw	r1, #:lower16:.LC1
	mov	r0, r8
	ldr	r2, .L64
	movt	r1, #:upper16:.LC1
	mov	r3, r5
	bl	dev_err
.L55:
	movw	r1, #:lower16:.LC5
	ldr	r2, .L64+4
	movt	r1, #:upper16:.LC5
	ldr	r0, [r7]
	bl	dev_err
	b	.L52
.L63:
	movw	r2, #:lower16:.LANCHOR0
	movw	r1, #:lower16:.LC0
	mov	r0, r8
	movt	r2, #:upper16:.LANCHOR0
	movt	r1, #:upper16:.LC0
	mov	r3, r5
	bl	dev_err
	b	.L55
.L65:
	.align	2
.L64:
	.word	.LANCHOR0+16
	.word	.LANCHOR0+48
	.fnend
	.size	es705_spi_boot_finish, .-es705_spi_boot_finish
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_spi_boot_setup, %function
es705_spi_boot_setup:
	.fnstart
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r2, #65535
	movw	r3, #257
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movt	r2, 32768
	strd	r6, [sp, #8]
	movt	r3, 257
	strd	r8, [sp, #16]
	mov	r6, #0
	mov	r7, #0
	strd	r10, [sp, #24]
	mov	ip, #-2147483648
	mov	r1, #44
	str	lr, [sp, #32]
	.pad #100
	sub	sp, sp, #100
	ldr	fp, [r0, #132]
	add	r10, sp, #52
	mov	r9, #1
	add	r5, sp, r1
	mov	r8, r0
	strd	r2, [sp, #8]
	add	r2, sp, #4
	mov	r3, #4
	mov	r0, r10
	stm	sp, {r9, ip}
	str	r2, [sp, #16]
	strd	r6, [sp, #20]
	str	r3, [sp, #24]
	strd	r6, [sp, #28]
	strd	r6, [sp, #36]
	strd	r6, [sp, #44]
	bl	__memzero
	mov	r0, fp
	mov	r1, r10
	str	r10, [sp, #44]
	str	r10, [sp, #48]
	str	r5, [sp, #52]
	str	r5, [sp, #56]
	bl	spi_sync
	subs	r4, r0, #0
	bne	.L80
	ldr	fp, [r8, #132]
	add	r2, sp, #8
	mov	r1, #44
	mov	r0, r10
	str	r4, [sp, #16]
	str	r2, [sp, #20]
	str	r9, [sp, #24]
	str	r4, [sp, #28]
	str	r4, [sp, #32]
	str	r4, [sp, #36]
	str	r4, [sp, #40]
	str	r4, [sp, #44]
	str	r4, [sp, #48]
	bl	__memzero
	mov	r0, fp
	mov	r1, r10
	str	r10, [sp, #44]
	str	r10, [sp, #48]
	str	r5, [sp, #52]
	str	r5, [sp, #56]
	bl	spi_sync
	subs	r4, r0, #0
	blt	.L81
	bne	.L68
	ldr	fp, [r8, #132]
	mov	r3, #4
	mov	r1, #44
	mov	r0, r10
	str	r4, [r8, #596]
	str	sp, [sp, #16]
	strd	r6, [sp, #20]
	str	r3, [sp, #24]
	strd	r6, [sp, #28]
	strd	r6, [sp, #36]
	strd	r6, [sp, #44]
	bl	__memzero
	mov	r0, fp
	mov	r1, r10
	str	r10, [sp, #44]
	str	r10, [sp, #48]
	str	r5, [sp, #52]
	str	r5, [sp, #56]
	bl	spi_sync
	subs	r4, r0, #0
	bne	.L82
	ldr	r6, [r8, #132]
	add	r2, sp, #12
	mov	r1, #44
	mov	r0, r10
	str	r4, [sp, #16]
	str	r2, [sp, #20]
	str	r9, [sp, #24]
	str	r4, [sp, #28]
	str	r4, [sp, #32]
	str	r4, [sp, #36]
	str	r4, [sp, #40]
	str	r4, [sp, #44]
	str	r4, [sp, #48]
	bl	__memzero
	mov	r1, r10
	mov	r0, r6
	str	r10, [sp, #44]
	str	r10, [sp, #48]
	str	r5, [sp, #52]
	str	r5, [sp, #56]
	bl	spi_sync
	subs	r4, r0, #0
	blt	.L83
	bne	.L72
.L66:
	mov	r0, r4
	add	sp, sp, #100
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L80:
	movw	r1, #:lower16:.LC1
	mov	r0, fp
	ldr	r2, .L84
	movt	r1, #:upper16:.LC1
	mov	r3, r4
	bl	dev_err
.L68:
	movw	r1, #:lower16:.LC6
	ldr	r2, .L84+4
	movt	r1, #:upper16:.LC6
	ldr	r0, [r8]
	bl	dev_err
	b	.L66
.L81:
	movw	r2, #:lower16:.LANCHOR0
	movw	r1, #:lower16:.LC0
	mov	r0, fp
	movt	r2, #:upper16:.LANCHOR0
	movt	r1, #:upper16:.LC0
	mov	r3, r4
	bl	dev_err
	b	.L68
.L82:
	movw	r1, #:lower16:.LC1
	mov	r0, fp
	ldr	r2, .L84
	movt	r1, #:upper16:.LC1
	mov	r3, r4
	bl	dev_err
.L72:
.L70:
	movw	r1, #:lower16:.LC7
	ldr	r2, .L84+4
	movt	r1, #:upper16:.LC7
	ldr	r0, [r8]
	bl	dev_err
	b	.L66
.L83:
	movw	r2, #:lower16:.LANCHOR0
	movw	r1, #:lower16:.LC0
	mov	r0, r6
	movt	r2, #:upper16:.LANCHOR0
	movt	r1, #:upper16:.LC0
	mov	r3, r4
	bl	dev_err
	b	.L72
.L85:
	.align	2
.L84:
	.word	.LANCHOR0+16
	.word	.LANCHOR0+72
	.fnend
	.size	es705_spi_boot_setup, .-es705_spi_boot_setup
	.global	es705_spi_driver
	.global	spi_streamdev
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.27190, %object
	.size	__func__.27190, 15
__func__.27190:
	.ascii	"es705_spi_read\000"
	.space	1
	.type	__func__.27198, %object
	.size	__func__.27198, 16
__func__.27198:
	.ascii	"es705_spi_write\000"
	.type	__func__.27249, %object
	.size	__func__.27249, 16
__func__.27249:
	.ascii	"es705_spi_probe\000"
	.type	__func__.27241, %object
	.size	__func__.27241, 22
__func__.27241:
	.ascii	"es705_spi_boot_finish\000"
	.space	2
	.type	__func__.27231, %object
	.size	__func__.27231, 21
__func__.27231:
	.ascii	"es705_spi_boot_setup\000"
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	spi_streamdev, %object
	.size	spi_streamdev, 20
spi_streamdev:
	.space	4
	.word	es705_spi_read
	.space	8
	.word	2
	.type	es705_spi_driver, %object
	.size	es705_spi_driver, 80
es705_spi_driver:
	.space	4
	.word	es705_spi_probe
	.word	es705_spi_remove
	.space	12
	.word	.LC8
	.word	spi_bus_type
	.word	0
	.space	44
	.section	.exitcall.exit,"aw",%progbits
	.align	2
	.type	__exitcall_es705_spi_exit, %object
	.size	__exitcall_es705_spi_exit, 4
__exitcall_es705_spi_exit:
	.word	es705_spi_exit
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_es705_spi_init6, %object
	.size	__initcall_es705_spi_init6, 4
__initcall_es705_spi_init6:
	.word	es705_spi_init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%s(): error %d reading SR\012\000"
	.space	1
.LC1:
	.ascii	"%s(): error %d writing SR\012\000"
	.space	1
.LC2:
	.ascii	"%s()\012\000"
	.space	2
.LC3:
	.ascii	"%s(): es705_core_probe() failed %d\012\000"
.LC4:
	.ascii	"%s(): es705_bootup failed %d\012\000"
	.space	2
.LC5:
	.ascii	"%s(): SYNC fail\012\000"
	.space	3
.LC6:
	.ascii	"%s(): SYNC_SBL fail\012\000"
	.space	3
.LC7:
	.ascii	"%s(): BOOT_CMD fail\012\000"
	.space	3
.LC8:
	.ascii	"es705_spi\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
