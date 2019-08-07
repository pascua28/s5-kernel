macro_preset_id:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	macro_preset_id, .-macro_preset_id
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	command_llseek, %function
command_llseek:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, [sp]
	orrs	r3, r2, r3
	mov	r2, r0
	movne	r3, #1
	moveq	r3, #0
	cmp	r1, #0
	movne	r3, #1
	cmp	r3, #0
	bne	.L5
	mov	ip, #0
	mov	r0, ip
	mov	r1, ip
	str	ip, [r2, #40]
	str	ip, [r2, #44]
	bx	lr
.L5:
	mvn	r0, #28
	mvn	r1, #0
	bx	lr
	.fnend
	.size	command_llseek, .-command_llseek
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	streaming_poll, %function
streaming_poll:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	r2, r1, #0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	str	lr, [sp, #4]
	beq	.L7
	ldr	r3, [r0, #124]
	ldr	r4, [r2]
	add	r1, r3, #1360
	cmp	r4, #0
	cmnne	r3, #1360
	beq	.L7
	blx	r4
.L7:
	movw	r3, #:lower16:.LANCHOR0
	ldr	r4, [sp]
	add	sp, sp, #4
	movt	r3, #:upper16:.LANCHOR0
	ldr	r2, [r3, #512]
	ldr	r3, [r3, #516]
	sub	r3, r2, r3
	tst	r3, #127
	movne	r0, #65
	moveq	r0, #0
	ldr	pc, [sp], #4
	.fnend
	.size	streaming_poll, .-streaming_poll
	.align	2
	.global	macro_cmd
	.syntax unified
	.arm
	.fpu softvfp
	.type	macro_cmd, %function
macro_cmd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	es705_cmd
	.fnend
	.size	macro_cmd, .-macro_cmd
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	command_release, %function
command_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	str	lr, [sp, #4]
	ldr	r0, [r1, #124]
	add	r0, r0, #144
	bl	mutex_unlock
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, #0
	ldr	pc, [sp], #4
	.fnend
	.size	command_release, .-command_release
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	command_open, %function
command_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR0
	str	r6, [sp, #8]
	movt	r4, #:upper16:.LANCHOR0
	mov	r6, r1
	str	lr, [sp, #12]
	ldr	r3, [r0, #48]
	ldr	r1, [r4, #520]
	lsr	r2, r3, #20
	ubfx	r3, r3, #0, #20
	cmp	r3, #2
	cmpls	r1, r2
	bne	.L26
	ldr	r3, [r0, #324]
	sub	r3, r3, #1168
	add	r0, r3, #136
	sub	r5, r3, #8
	bl	mutex_lock_killable
	cmp	r0, #0
	bne	.L24
	movw	r2, #:lower16:macro_preset_id
	movw	r3, #:lower16:macro_cmd
	str	r0, [r4, #524]
	movt	r2, #:upper16:macro_preset_id
	movt	r3, #:upper16:macro_cmd
	str	r0, [r4, #528]
	str	r5, [r6, #124]
	str	r2, [r4, #532]
	str	r3, [r4, #536]
.L20:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L24:
.L22:
	mvn	r0, #15
	b	.L20
.L26:
	movw	r1, #:lower16:.LANCHOR1
	movw	r0, #:lower16:.LC0
	movt	r1, #:upper16:.LANCHOR1
	movt	r0, #:upper16:.LC0
	bl	printk
	mvn	r0, #18
	b	.L20
	.fnend
	.size	command_open, .-command_open
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	firmware_write, %function
firmware_write:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r7, [r0, #124]
	.pad #12
	sub	sp, sp, #12
	cmp	r7, #0
	beq	.L28
	cmp	r2, #0
	moveq	r5, r2
	beq	.L27
	mov	fp, #57344
	movw	r6, #:lower16:fw_buf
	str	r1, [sp, #4]
	mov	r8, r3
	mov	r9, r2
	movt	fp, 65535
	movt	r6, #:upper16:fw_buf
	mov	r10, #0
	b	.L29
.L40:
	mov	r2, r4
	mov	r0, r6
	bl	__copy_from_user
	subs	r5, r0, #0
	bne	.L38
.L33:
	ldr	r5, [r7, #56]
	mov	r2, r4
	mov	r1, r6
	mov	r0, r7
	blx	r5
	subs	r5, r0, #0
	blt	.L27
	ldrd	r0, [r8]
	add	r10, r10, r4
	adds	r2, r0, r4
	adc	r3, r1, #0
	cmp	r9, r10
	strd	r2, [r8]
	bls	.L39
.L29:
	mov	r3, sp
	sub	r4, r9, r10
	and	r2, r3, fp
	ldr	r3, [sp, #4]
	cmp	r4, #1024
	movcs	r4, #1024
	ldr	r2, [r2, #8]
	add	r1, r3, r10
	.syntax divided
@ 439 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r0, r1, r4; sbcccs r0, r0, r2; movcc r2, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r2, #0
	beq	.L40
	mov	r0, r6
	mov	r1, r4
	bl	__memzero
	mov	r0, r4
	subs	r5, r0, #0
	beq	.L33
.L38:
	movw	r1, #:lower16:.LC2
	mov	r3, r5
	ldr	r2, .L41
	movt	r1, #:upper16:.LC2
	ldr	r0, [r7]
	bl	dev_err
.L27:
	mov	r0, r5
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L39:
	mov	r5, r10
	b	.L27
.L28:
	.syntax divided
@ 491 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705-cdev.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705-cdev.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 491, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L42:
	.align	2
.L41:
	.word	.LANCHOR1+16
	.fnend
	.size	firmware_write, .-firmware_write
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	command_write, %function
command_write:
	.fnstart
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #124]
	.pad #60
	sub	sp, sp, #60
	cmp	r3, #0
	str	r3, [sp]
	beq	.L44
	cmp	r2, #0
	str	r2, [sp, #28]
	str	r1, [sp, #36]
	beq	.L69
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	ldr	r2, [r4, #528]
	rsbs	r1, r2, #4096
	beq	.L50
	ldr	r0, [sp, #28]
	movw	r8, #:lower16:parse_buffer
	mov	r3, sp
	movt	r8, #:upper16:parse_buffer
	bic	r3, r3, #8128
	add	r2, r8, r2
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
	cmp	r0, r1
	str	r2, [sp, #20]
	movlt	r1, r0
	ldr	r0, [sp, #36]
	.syntax divided
@ 439 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r2, r0, r1; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	str	r1, [sp, #12]
	bne	.L49
	mov	r2, r1
	ldr	r1, [sp, #36]
	movw	r10, #:lower16:.LC7
	mov	fp, r3
	movt	r10, #:upper16:.LC7
	str	r3, [sp, #16]
.L48:
	ldr	r0, [sp, #20]
	bl	__copy_from_user
	cmp	r0, #0
	bne	.L88
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #16]
	ldr	r5, [r4, #528]
	add	r2, r2, r3
	sub	r5, r5, #1
	add	r5, r5, r3
	str	r2, [sp, #16]
	ldrb	r2, [r8, r5]	@ zero_extendqisi2
	adds	r5, r8, r5
	movcc	r3, #1
	movcs	r3, #0
	cmp	r2, #10
	moveq	r3, #0
	andne	r3, r3, #1
	cmp	r3, #0
	beq	.L52
.L53:
	ldrb	r2, [r5, #-1]!	@ zero_extendqisi2
	subs	r3, r2, #10
	movne	r3, #1
	cmp	r5, r8
	movcc	r3, #0
	cmp	r3, #0
	bne	.L53
.L52:
	ldrb	r3, [r5, #1]	@ zero_extendqisi2
	movw	r7, #:lower16:.LC3
	add	r6, sp, #56
	movt	r7, #:upper16:.LC3
	strb	fp, [r5, #1]
	str	r8, [r6, #-8]!
	str	r3, [sp, #32]
	movw	r3, #:lower16:.LC6
	movt	r3, #:upper16:.LC6
	str	r3, [sp, #8]
	add	r3, r5, #1
	str	r3, [sp, #24]
	mov	r3, #0
	str	r3, [sp, #4]
.L54:
	mov	r1, r10
	mov	r0, r6
	bl	strsep
	ldr	r3, [sp, #48]
	mov	r9, r0
	cmp	r0, r3
	beq	.L89
	ldrb	r2, [r9]	@ zero_extendqisi2
	cmp	r2, #59
	beq	.L90
	ldr	r3, [r4, #524]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L54
.L59:
	.word	.L58
	.word	.L60
	.word	.L61
	.word	.L62
.L49:
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #20]
	bl	__memzero
	mvn	r0, #13
.L43:
	add	sp, sp, #60
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L61:
	mov	r0, r9
	add	r2, sp, #52
	ldr	r1, [sp, #8]
	bl	sscanf
	cmp	r0, #1
	bne	.L65
	ldr	r3, [r4, #532]
	ldr	r0, [sp]
	ldr	r1, [sp, #52]
	blx	r3
	str	fp, [r4, #524]
	b	.L54
.L60:
	movw	r1, #:lower16:.LC5
	mov	r0, r9
	movt	r1, #:upper16:.LC5
	mov	r2, #3
	bl	strnicmp
	cmp	r0, #0
	bne	.L65
	mov	r3, #2
	str	r3, [r4, #524]
	b	.L54
.L58:
	cmp	r2, #48
	beq	.L91
.L63:
	movw	r0, #:lower16:.LC4
	mov	r2, #7
	movt	r0, #:upper16:.LC4
	mov	r1, r9
	bl	strnicmp
	cmp	r0, #0
	moveq	r3, #1
	streq	r3, [r4, #524]
	beq	.L54
	ldrb	r3, [r9]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L54
.L65:
	mvn	r0, #21
	b	.L43
.L62:
	mov	r0, r9
	add	r2, sp, #46
	mov	r1, r7
	bl	sscanf
	cmp	r0, #1
	bne	.L65
	ldrh	r1, [sp, #46]
	ldm	sp, {r0, r2}
	ldr	r3, [r4, #536]
	orr	r1, r1, r2
	blx	r3
	str	fp, [r4, #524]
	b	.L54
.L90:
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #10
	cmpne	r2, #0
	beq	.L54
.L57:
	add	r3, r3, #1
	str	r3, [sp, #48]
	ldrb	r2, [r3]	@ zero_extendqisi2
	cmp	r2, #0
	cmpne	r2, #10
	bne	.L57
	b	.L54
.L91:
	add	r2, sp, #46
	mov	r1, r7
	mov	r0, r9
	bl	sscanf
	cmp	r0, #1
	bne	.L63
	ldrh	r3, [sp, #46]
	mov	r2, #3
	str	r2, [r4, #524]
	lsl	r3, r3, #16
	str	r3, [sp, #4]
	b	.L54
.L89:
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #20]
	add	r3, r3, r2
	ldr	r2, [sp, #32]
	strb	r2, [r5, #1]
	ldr	r2, [sp, #24]
	sub	r5, r3, r2
	cmp	r5, #0
	str	r5, [r4, #528]
	ble	.L71
	movw	r0, #:lower16:parse_buffer
	mov	r1, r2
	movt	r0, #:upper16:parse_buffer
	mov	r2, r5
	bl	memmove
.L71:
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #28]
	cmp	r3, r2
	bls	.L69
	rsbs	r1, r5, #4096
	beq	.L50
	ldr	r0, [sp, #16]
	mov	r2, r3
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
	sub	r2, r2, r0
	ldr	r0, [sp, #36]
	cmp	r2, r1
	movge	r2, r1
	add	r1, r8, r5
	str	r2, [sp, #12]
	str	r1, [sp, #20]
	mov	r1, r2
	.syntax divided
@ 439 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r2, r0, r1; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	bne	.L49
	mov	r1, r0
	ldr	r2, [sp, #12]
	b	.L48
.L69:
	ldr	r0, [sp, #28]
	b	.L43
.L50:
	mvn	r0, #26
	b	.L43
.L44:
	.syntax divided
@ 335 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705-cdev.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705-cdev.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 335, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L88:
	mvn	r0, #13
	b	.L43
	.fnend
	.size	command_write, .-command_write
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	command_read, %function
command_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r10, fp, lr}
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	strd	r10, [sp, #20]
	str	lr, [sp, #28]
	ldr	ip, [r0, #124]
	.pad #16
	sub	sp, sp, #16
	cmp	ip, #0
	beq	.L102
	movw	lr, #:lower16:.LANCHOR0
	mov	r5, r3
	ldr	r3, [ip, #104]
	movt	lr, #:upper16:.LANCHOR0
	mov	r8, r2
	ldr	r2, [lr, #540]
	mov	r6, r1
	cmp	r2, r3
	beq	.L103
.L94:
	mov	r0, ip
	ldr	ip, [ip, #112]
	movw	r2, #:lower16:.LC8
	ldr	r3, [r0, #104]!	@ unaligned
	movt	r2, #:upper16:.LC8
	mov	r1, #128
	ldr	r4, .L105
	ldr	r7, [r0, #4]	@ unaligned
	uxth	r0, ip
	lsr	ip, ip, #16
	str	r3, [lr, #540]
	stm	sp, {r7, ip}
	str	r0, [sp, #8]
	add	r0, r4, #8
	str	r7, [r4, #4]
	bl	snprintf
.L95:
	ldr	r7, .L105+4
	mov	r1, #128
	mov	r0, r7
	bl	strnlen
	ldrd	r10, [r5]
	mov	r3, #0
	cmp	r10, r0
	sbcs	r3, fp, r3
	movge	r0, #0
	bge	.L92
	mov	r3, sp
	sub	r4, r0, r10
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
	.syntax divided
@ 448 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r2, r6, r4; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	movne	r0, r4
	beq	.L104
.L97:
	cmp	r0, #0
	bne	.L92
	ldrd	r6, [r5]
	cmp	r4, r8
	movcs	r4, r8
	mov	r0, r4
	adds	r2, r6, r4
	adc	r3, r7, #0
	strd	r2, [r5]
.L92:
	add	sp, sp, #16
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldrd	r10, [sp, #20]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L103:
	ldr	r3, [ip, #108]
	ldr	r2, [lr, #544]
	cmp	r2, r3
	bne	.L94
	b	.L95
.L104:
	add	r1, r7, r10
	mov	r0, r6
	mov	r2, r4
	bl	__copy_to_user
	b	.L97
.L102:
	.syntax divided
@ 296 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705-cdev.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705-cdev.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 296, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L106:
	.align	2
.L105:
	.word	.LANCHOR0+540
	.word	.LANCHOR0+548
	.fnend
	.size	command_read, .-command_read
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	streaming_open, %function
streaming_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r4, [r0, #324]
	.pad #8
	sub	sp, sp, #8
	ldr	r3, [r4, #-1200]
	cmp	r3, #0
	beq	.L108
	ldr	r3, [r4, #-1188]
	cmp	r3, #0
	blt	.L108
	sub	r6, r4, #1232
	mov	r10, r0
	add	r7, r6, #164
	mov	r9, r1
	mov	r0, r7
	sub	r8, r6, #4
	bl	mutex_lock_killable
	cmp	r0, #0
	bne	.L138
	ldr	r2, [r10, #48]
	movw	r5, #:lower16:.LANCHOR0
	movt	r5, #:upper16:.LANCHOR0
	ldr	r1, [r5, #520]
	lsr	r3, r2, #20
	ubfx	r2, r2, #0, #20
	cmp	r2, #2
	cmpls	r1, r3
	beq	.L112
	movw	r1, #:lower16:.LC11
	ldr	r0, [r4, #-1236]
	str	r2, [sp]
	movt	r1, #:upper16:.LC11
	ldr	r2, .L142
	mvn	r9, #18
	bl	dev_warn
.L113:
	mov	r0, r7
	bl	mutex_unlock
.L107:
	mov	r0, r9
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L112:
	ldr	r10, [r10, #324]
	cmp	r10, r4
	beq	.L114
	movw	r1, #:lower16:.LC1
	ldr	r2, .L142
	mvn	r9, #18
	movt	r1, #:upper16:.LC1
	ldr	r0, [r4, #-1236]
	bl	dev_err
	b	.L113
.L114:
	str	r8, [r9, #124]
	ldr	r3, [r10, #-1204]
	cmp	r3, #0
	beq	.L115
	mov	r0, r8
	blx	r3
	subs	r9, r0, #0
	bne	.L139
.L115:
	ldr	r2, .L142+4
	movw	r1, #:lower16:.LC13
	movt	r1, #:upper16:.LC13
	mov	r0, r2
	bl	__mutex_init
	movw	r0, #:lower16:.LANCHOR0
	mov	r1, #520
	movt	r0, #:upper16:.LANCHOR0
	bl	__memzero
	mov	r1, #0
	movw	r3, #:lower16:.LC14
	movw	r0, #:lower16:streaming_producer
	movt	r3, #:upper16:.LC14
	str	r1, [r5, #700]
	movt	r0, #:upper16:streaming_producer
	mvn	r2, #0
	str	r1, [r5, #704]
	mov	r1, r8
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L116
	bl	wake_up_process
	cmp	r5, #0
	beq	.L116
	mvn	r1, #19
	mov	r0, r5
	add	r6, r6, #140
	bl	set_user_nice
	mov	r0, r6
	str	r5, [r4, #120]
	bl	mutex_lock_killable
	cmp	r0, #0
	beq	.L140
.L117:
	ldr	r0, [r4, #120]
	mvn	r9, #15
	bl	kthread_stop
.L119:
	ldr	r3, [r4, #-1196]
	cmp	r3, #0
	beq	.L113
	mov	r0, r8
	blx	r3
	b	.L113
.L140:
	ldr	r2, [r4, #-1188]
	movw	r3, #:lower16:es705_streaming_cmds
	mov	r0, r8
	movt	r3, #:upper16:es705_streaming_cmds
	ldr	r1, [r3, r2, lsl #2]
	orr	r1, r1, #1
	bl	es705_cmd
	subs	r9, r0, #0
	bne	.L141
	ldr	r3, [r4, #-1212]
	ldr	r2, [r4, #-1188]
	cmp	r2, r3
	beq	.L107
	mov	r0, r6
	bl	mutex_unlock
	b	.L107
.L139:
	movw	r1, #:lower16:.LC12
	mov	r3, r9
	ldr	r2, .L142
	movt	r1, #:upper16:.LC12
	ldr	r0, [r10, #-1236]
	bl	dev_err
	b	.L113
.L108:
	movw	r1, #:lower16:.LC9
	ldr	r2, .L142
	mvn	r9, #18
	movt	r1, #:upper16:.LC9
	ldr	r0, [r4, #-1236]
	bl	dev_err
	b	.L107
.L116:
	movw	r1, #:lower16:.LC15
	mov	r3, r5
	ldr	r2, .L142
	movt	r1, #:upper16:.LC15
	ldr	r0, [r4, #-1236]
	mvn	r9, #11
	bl	dev_err
	b	.L119
.L138:
	movw	r1, #:lower16:.LC10
	mov	r3, r0
	ldr	r2, .L142
	movt	r1, #:upper16:.LC10
	ldr	r0, [r4, #-1236]
	mvn	r9, #15
	bl	dev_err
	b	.L107
.L141:
	mov	r0, r6
	bl	mutex_unlock
	b	.L117
.L143:
	.align	2
.L142:
	.word	.LANCHOR1+32
	.word	.LANCHOR0+676
	.fnend
	.size	streaming_open, .-streaming_open
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	firmware_open, %function
firmware_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r4, [r0, #324]
	subs	r6, r4, #1296
	beq	.L158
	str	r6, [r1, #124]
	ldr	r3, [r4, #-1228]
	cmp	r3, #0
	beq	.L150
	mov	r0, r6
	blx	r3
	cmn	r0, #5
	mov	r5, r0
	bne	.L148
	mov	r0, r6
	ldr	r3, [r4, #-1228]
	blx	r3
	cmn	r0, #5
	mov	r5, r0
	bne	.L148
.L149:
	movw	r1, #:lower16:.LC16
	mov	r3, r5
	ldr	r2, .L159
	movt	r1, #:upper16:.LC16
	ldr	r0, [r4, #-1296]
	bl	dev_err
.L144:
	mov	r0, r5
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L148:
	cmp	r5, #0
	bne	.L149
.L150:
	mov	r5, #0
	b	.L144
.L158:
	.syntax divided
@ 417 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705-cdev.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705-cdev.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 417, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L160:
	.align	2
.L159:
	.word	.LANCHOR1+48
	.fnend
	.size	firmware_open, .-firmware_open
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	firmware_release, %function
firmware_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r0, #20
	mov	r4, r1
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	bl	msleep
	ldr	r5, [r4, #124]
	cmp	r5, #0
	beq	.L169
	ldr	r3, [r5, #72]
	cmp	r3, #0
	beq	.L164
	mov	r0, r5
	blx	r3
	subs	r4, r0, #0
	beq	.L161
	movw	r1, #:lower16:.LC17
	mov	r3, r4
	ldr	r2, .L170
	movt	r1, #:upper16:.LC17
	ldr	r0, [r5]
	bl	dev_err
.L161:
	mov	r0, r4
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L169:
	.syntax divided
@ 456 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705-cdev.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705-cdev.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 456, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L164:
	mov	r4, r3
	b	.L161
.L171:
	.align	2
.L170:
	.word	.LANCHOR1+64
	.fnend
	.size	firmware_release, .-firmware_release
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	streaming_producer, %function
streaming_producer:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	strd	r6, [sp, #8]
	strd	r10, [sp, #24]
	movw	fp, #:lower16:kmalloc_caches
	strd	r8, [sp, #16]
	movt	fp, #:upper16:kmalloc_caches
	str	lr, [sp, #32]
	.pad #12
	sub	sp, sp, #12
	ldr	r0, [fp, #48]
	cmp	r0, #0
	beq	.L192
	mov	r2, #4096
	mov	r1, #208
	bl	kmem_cache_alloc_trace
	subs	r7, r0, #0
	beq	.L175
	movw	r6, #:lower16:.LANCHOR0
	movt	r6, #:upper16:.LANCHOR0
	add	r8, r6, #708
	.syntax divided
@ 45 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r3, [r8]
	add	r3, r3, #1
	strex	r2, r3, [r8]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
.L174:
	movw	r3, #:lower16:.LC18
	movw	r9, #:lower16:.LC19
	ldr	r10, .L197
	movt	r3, #:upper16:.LC18
	movt	r9, #:upper16:.LC19
	mov	r4, #0
	str	r3, [sp, #4]
	b	.L176
.L184:
	add	r4, r4, r3
	bl	kthread_should_stop
.L185:
	cmp	r4, #4096
	beq	.L193
.L176:
	mov	r0, r5
	ldr	r3, [r5, #44]
	blx	r3
	cmp	r0, #0
	ble	.L183
	ldr	r3, [r5, #36]
	rsb	r2, r4, #4096
	add	r1, r7, r4
	mov	r0, r5
	blx	r3
	subs	r3, r0, #0
	bge	.L184
	mov	r2, r10
	mov	r1, r9
	ldr	r0, [r5]
	bl	dev_err
	bl	kthread_should_stop
	cmp	r4, #4096
	bne	.L176
.L193:
	ldr	r1, [r6, #512]
	ldr	r2, [r6, #516]
	add	r3, r1, #1
	sub	r2, r2, r3
	tst	r2, #127
	beq	.L194
.L178:
	str	r7, [r6, r1, lsl #2]
	.syntax divided
@ 865 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705-cdev.c" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	mov	r2, #1
	and	ip, r3, #127
	add	r0, r5, #1360
	mov	r1, r2
	mov	r3, #0
	str	ip, [r6, #512]
	bl	__wake_up
	ldr	r0, [fp, #48]
	cmp	r0, #0
	beq	.L195
	mov	r2, #4096
	mov	r1, #208
	bl	kmem_cache_alloc_trace
	subs	r7, r0, #0
	beq	.L182
	.syntax divided
@ 45 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r3, [r8]
	add	r3, r3, #1
	strex	r2, r3, [r8]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	mov	r4, #0
	b	.L176
.L183:
	bl	kthread_should_stop
	cmp	r0, #0
	beq	.L185
	mov	r0, r7
	bl	kfree
	.syntax divided
@ 83 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r3, [r8]
	sub	r3, r3, #1
	strex	r2, r3, [r8]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	mov	r0, #0
.L172:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L195:
	.syntax divided
@ 45 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r3, [r8]
	add	r3, r3, #1
	strex	r2, r3, [r8]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	mov	r7, #16
	mov	r4, r0
	b	.L176
.L192:
	movw	r6, #:lower16:.LANCHOR0
	movt	r6, #:upper16:.LANCHOR0
	add	r8, r6, #708
	.syntax divided
@ 45 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r3, [r8]
	add	r3, r3, #1
	strex	r2, r3, [r8]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	mov	r7, #16
	b	.L174
.L194:
	mov	r2, r10
	ldr	r1, [sp, #4]
	ldr	r0, [r5]
	bl	dev_err
	ldr	r0, .L197+4
	bl	mutex_lock
	ldr	r2, [r6, #512]
	ldr	r3, [r6, #516]
	sub	r2, r2, r3
	tst	r2, #127
	beq	.L196
	ldr	r4, [r6, r3, lsl #2]
	.syntax divided
@ 745 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705-cdev.c" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	add	r3, r3, #1
	ldr	r0, .L197+4
	and	r3, r3, #127
	str	r3, [r6, #516]
	bl	mutex_unlock
	cmp	r4, #0
	beq	.L180
	mov	r0, r4
	bl	kfree
	.syntax divided
@ 83 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r3, [r8]
	sub	r3, r3, #1
	strex	r2, r3, [r8]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
.L180:
	ldr	r1, [r6, #512]
	ldr	r3, [r6, #516]
	add	r3, r1, #1
	b	.L178
.L182:
	movw	r1, #:lower16:.LC21
	ldr	r2, .L197
	movt	r1, #:upper16:.LC21
	ldr	r0, [r5]
	bl	dev_err
	mvn	r0, #11
	b	.L172
.L175:
	movw	r1, #:lower16:.LC20
	ldr	r2, .L197
	movt	r1, #:upper16:.LC20
	ldr	r0, [r5]
	bl	dev_err
	mvn	r0, #11
	b	.L172
.L196:
	ldr	r0, .L197+4
	bl	mutex_unlock
	b	.L180
.L198:
	.align	2
.L197:
	.word	.LANCHOR1+84
	.word	.LANCHOR0+676
	.fnend
	.size	streaming_producer, .-streaming_producer
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	streaming_release, %function
streaming_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r5, [r1, #124]
	ldr	r3, [r5, #24]
	ldr	r2, [r5, #48]
	cmp	r2, r3
	beq	.L200
	add	r0, r5, #144
	bl	mutex_lock_killable
	cmp	r0, #0
	ldreq	r2, [r5, #48]
	bne	.L204
.L200:
	movw	r3, #:lower16:es705_streaming_cmds
	mov	r0, r5
	movt	r3, #:upper16:es705_streaming_cmds
	ldr	r1, [r3, r2, lsl #2]
	bl	es705_cmd
	subs	r8, r0, #0
	beq	.L203
	ldr	r3, [r5, #24]
	ldr	r2, [r5, #48]
	cmp	r2, r3
	beq	.L221
.L204:
	mvn	r8, #15
.L199:
	mov	r0, r8
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L203:
	add	r0, r5, #144
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	bl	mutex_unlock
	ldr	r0, [r5, #1356]
	add	r7, r4, #676
	add	r6, r4, #708
	bl	kthread_stop
	b	.L206
.L209:
	mov	r0, r9
	bl	kfree
	.syntax divided
@ 83 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r3, [r6]
	sub	r3, r3, #1
	strex	r2, r3, [r6]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
.L206:
	mov	r0, r7
	bl	mutex_lock
	ldr	r2, [r4, #512]
	ldr	r3, [r4, #516]
	sub	r2, r2, r3
	tst	r2, #127
	beq	.L222
	ldr	r9, [r4, r3, lsl #2]
	.syntax divided
@ 745 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705-cdev.c" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	add	r3, r3, #1
	mov	r0, r7
	and	r3, r3, #127
	str	r3, [r4, #516]
	bl	mutex_unlock
	cmp	r9, #0
	bne	.L209
	ldr	r0, [r4, #700]
	cmp	r0, #0
	beq	.L210
.L224:
	bl	kfree
	ldr	r3, .L225
	.syntax divided
@ 83 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r2, [r3]
	sub	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	mov	r3, #0
	str	r3, [r4, #700]
.L210:
	ldr	r3, [r4, #708]
	cmp	r3, #0
	bne	.L223
	ldr	r3, [r5, #40]
	cmp	r3, #0
	beq	.L212
	mov	r0, r5
	blx	r3
.L212:
	add	r0, r5, #168
	bl	mutex_unlock
	b	.L199
.L221:
.L205:
	add	r0, r5, #144
	mvn	r8, #15
	bl	mutex_unlock
	b	.L199
.L222:
	ldr	r0, .L225+4
	bl	mutex_unlock
	ldr	r0, [r4, #700]
	cmp	r0, #0
	bne	.L224
	b	.L210
.L223:
	.syntax divided
@ 714 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705-cdev.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705-cdev.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 714, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L226:
	.align	2
.L225:
	.word	.LANCHOR0+708
	.word	.LANCHOR0+676
	.fnend
	.size	streaming_release, .-streaming_release
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	streaming_read, %function
streaming_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	strd	r6, [sp, #8]
	mov	r7, r1
	strd	r8, [sp, #16]
	ldr	r9, [r4, #700]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #124]
	.pad #44
	sub	sp, sp, #44
	cmp	r9, #0
	str	r2, [sp, #4]
	strd	r2, [sp, #8]
	beq	.L248
	ldr	r1, [r4, #704]
	mov	fp, r2
	mov	r5, #0
	cmp	r1, #4096
	beq	.L229
.L230:
	cmp	fp, #0
	ble	.L227
	mov	r8, #57344
	movt	r8, 65535
	b	.L246
.L244:
	cmp	r0, #0
	bne	.L251
.L260:
	ldr	r1, [r4, #704]
	cmp	fp, #0
	movle	r3, #0
	movgt	r3, #1
	add	r1, r6, r1
	cmp	r1, #4096
	movne	r3, #0
	str	r1, [r4, #704]
	cmp	r3, #0
	bne	.L259
	cmp	fp, #0
	ble	.L227
	ldr	r9, [r4, #700]
.L246:
	rsb	r6, r1, #4096
	mov	r3, sp
	cmp	r6, fp
	and	r3, r3, r8
	movge	r6, fp
	add	r2, r7, r5
	ldr	r3, [r3, #8]
	.syntax divided
@ 448 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds ip, r2, r6; sbcccs ip, ip, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	sub	fp, fp, r6
	add	r5, r5, r6
	mov	r0, r6
	bne	.L244
	mov	r0, r2
	add	r1, r9, r1
	mov	r2, r6
	bl	__copy_to_user
	cmp	r0, #0
	beq	.L260
.L251:
	mvn	r3, #4
	str	r3, [sp, #4]
.L227:
	ldr	r0, [sp, #4]
	add	sp, sp, #44
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L259:
.L231:
	ldr	r9, [r4, #700]
	cmp	r9, #0
	beq	.L228
.L229:
	mov	r0, r9
	bl	kfree
	ldr	r2, .L264
	.syntax divided
@ 83 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r1, [r2]
	sub	r1, r1, #1
	strex	r0, r1, [r2]
	teq	r0, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
.L228:
	ldr	r0, .L264+4
	bl	mutex_lock
	ldr	r9, [r4, #512]
	ldr	r2, [r4, #516]
	sub	r9, r9, r2
	ands	r9, r9, #127
	beq	.L232
	ldr	r9, [r4, r2, lsl #2]
	.syntax divided
@ 745 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705-cdev.c" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	add	r2, r2, #1
	and	r2, r2, #127
	str	r2, [r4, #516]
.L232:
	ldr	r6, .L264+4
	mov	r8, #57344
	movt	r8, 65535
	ldr	r0, .L264+4
	bl	mutex_unlock
	str	r9, [r4, #700]
.L233:
	cmp	r9, #0
	bne	.L252
	mov	r0, r6
	bl	mutex_lock
	ldr	r2, [r4, #512]
	ldr	r3, [r4, #516]
	sub	r2, r2, r3
	tst	r2, #127
	beq	.L261
	ldr	r9, [r4, r3, lsl #2]
	.syntax divided
@ 745 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705-cdev.c" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	add	r3, r3, #1
	mov	r0, r6
	and	r3, r3, #127
	str	r3, [r4, #516]
	bl	mutex_unlock
	cmp	r9, #0
	str	r9, [r4, #700]
	beq	.L235
.L252:
	mov	r2, #0
	mov	r1, r2
	str	r2, [r4, #704]
	b	.L230
.L261:
	mov	r0, r6
	bl	mutex_unlock
	str	r9, [r4, #700]
.L235:
	mov	r3, #0
	mov	r2, sp
	ldr	r0, [sp, #12]
	and	r2, r2, r8
	str	r3, [sp, #20]
	str	r3, [sp, #24]
	str	r3, [sp, #28]
	add	r9, r0, #1360
	str	r3, [sp, #32]
	str	r3, [sp, #36]
	ldr	r1, [r2, #12]
	movw	r3, #:lower16:autoremove_wake_function
	add	r2, sp, #32
	movt	r3, #:upper16:autoremove_wake_function
	str	r1, [sp, #24]
	str	r3, [sp, #28]
	str	r2, [sp, #32]
	str	r2, [sp, #36]
	b	.L241
.L263:
	bl	schedule
.L241:
	mov	r2, #1
	add	r1, sp, #20
	mov	r0, r9
	bl	prepare_to_wait
	mov	r0, r6
	bl	mutex_lock
	ldr	r2, [r4, #512]
	ldr	r3, [r4, #516]
	sub	r2, r2, r3
	ands	r10, r2, #127
	beq	.L262
	ldr	r10, [r4, r3, lsl #2]
	.syntax divided
@ 745 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705-cdev.c" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	add	r3, r3, #1
	mov	r0, r6
	and	r3, r3, #127
	str	r3, [r4, #516]
	bl	mutex_unlock
	cmp	r10, #0
	str	r10, [r4, #700]
	bne	.L239
.L238:
	mov	r3, sp
	and	r3, r3, r8
	ldr	r3, [r3, #12]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #1
	beq	.L263
	add	r1, sp, #20
	mov	r0, r9
	bl	finish_wait
	ldr	r3, [sp, #8]
	cmp	fp, r3
	subne	r3, r3, fp
	mvneq	r3, #3
	strne	r3, [sp, #4]
	streq	r3, [sp, #4]
	b	.L227
.L248:
	mov	fp, r2
	mov	r5, r9
	b	.L228
.L239:
	mov	r0, r9
	add	r1, sp, #20
	bl	finish_wait
	ldr	r9, [r4, #700]
	b	.L233
.L262:
	mov	r0, r6
	bl	mutex_unlock
	str	r10, [r4, #700]
	b	.L238
.L265:
	.align	2
.L264:
	.word	.LANCHOR0+708
	.word	.LANCHOR0+676
	.fnend
	.size	streaming_read, .-streaming_read
	.align	2
	.global	es705_init_cdev
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_init_cdev, %function
es705_init_cdev:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r3, #:lower16:.LC22
	strd	r6, [sp, #8]
	movt	r4, #:upper16:.LANCHOR0
	mov	r7, #0
	strd	r8, [sp, #16]
	movt	r3, #:upper16:.LC22
	mov	r2, #3
	strd	r10, [sp, #24]
	mov	r6, r0
	mov	r1, r7
	str	lr, [sp, #32]
	.pad #20
	sub	sp, sp, #20
	add	r0, sp, #12
	str	r7, [r4, #520]
	str	r7, [r4, #712]
	bl	alloc_chrdev_region
	subs	r5, r0, #0
	beq	.L267
	movw	r1, #:lower16:.LC23
	mov	r3, r5
	ldr	r2, .L296
	movt	r1, #:upper16:.LC23
	ldr	r0, [r6]
	bl	dev_err
.L268:
	movw	r1, #:lower16:.LC28
	ldr	r2, .L296
	movt	r1, #:upper16:.LC28
	ldr	r0, [r6]
	bl	dev_err
.L266:
	mov	r0, r5
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L267:
	ldr	r3, [sp, #12]
	movw	r1, #:lower16:.LC22
	add	r2, r4, #716
	movt	r1, #:upper16:.LC22
	lsr	r3, r3, #20
	str	r3, [r4, #520]
	bl	__class_create
	cmn	r0, #4096
	str	r0, [r4, #716]
	bhi	.L292
	ldr	r3, [r4, #520]
	add	r8, r6, #1168
	ldr	r9, [r4, #712]
	add	r8, r8, #8
	mov	r0, r8
	ldr	r1, .L296+4
	orr	r9, r9, r3, lsl #20
	bl	cdev_init
	str	r5, [r6, #1212]
	mov	r1, r9
	mov	r0, r8
	mov	r2, #1
	bl	cdev_add
	subs	r5, r0, #0
	bne	.L293
	ldr	ip, [r4, #712]
	movw	r10, #:lower16:.LC26
	mov	r2, r9
	movt	r10, #:upper16:.LC26
	mov	r3, r5
	ldr	r0, [r4, #716]
	mov	r1, r5
	stm	sp, {r10, ip}
	bl	device_create
	cmn	r8, #4096
	bhi	.L273
.L276:
	ldr	r3, [r4, #520]
	add	r9, r6, #1296
	ldr	r7, [r4, #712]
	mov	r0, r9
	ldr	r1, .L296+8
	add	r7, r7, #1
	orr	r7, r7, r3, lsl #20
	bl	cdev_init
	mov	r3, #0
	mov	r1, r7
	mov	r0, r9
	mov	r2, #1
	str	r3, [r6, #1332]
	bl	cdev_add
	subs	r5, r0, #0
	bne	.L294
	ldr	ip, [r4, #712]
	mov	r2, r7
	mov	r3, r5
	mov	r1, r5
	ldr	r0, [r4, #716]
	add	ip, ip, #1
	stm	sp, {r10, ip}
	bl	device_create
	cmn	r9, #4096
	bhi	.L278
.L281:
	ldr	r3, [r4, #520]
	add	fp, r6, #1232
	ldr	r7, [r4, #712]
	add	fp, fp, #4
	mov	r0, fp
	ldr	r1, .L296+12
	add	r7, r7, #2
	orr	r7, r7, r3, lsl #20
	bl	cdev_init
	mov	r3, #0
	mov	r1, r7
	mov	r0, fp
	mov	r2, #1
	str	r3, [r6, #1272]
	bl	cdev_add
	subs	r5, r0, #0
	bne	.L295
	ldr	ip, [r4, #712]
	mov	r2, r7
	mov	r3, r5
	mov	r1, r5
	ldr	r0, [r4, #716]
	add	ip, ip, #2
	stm	sp, {r10, ip}
	bl	device_create
	cmn	fp, #4096
	mov	r7, r0
	bls	.L266
	movw	r1, #:lower16:.LC27
	mov	r3, #2
	ldr	r2, .L296+16
	movt	r1, #:upper16:.LC27
	ldr	r0, [r6]
	str	r7, [sp]
	bl	dev_err
	mov	r0, fp
	bl	cdev_del
	cmp	r7, #0
	beq	.L266
	mov	r5, r7
	b	.L282
.L293:
	movw	r1, #:lower16:.LC25
	ldr	r0, [r6]
	mov	r3, r7
	movt	r1, #:upper16:.LC25
	ldr	r2, .L296+16
	str	r5, [sp]
	bl	dev_err
.L272:
	ldr	r0, [r4, #716]
	bl	class_destroy
.L270:
	ldr	r0, [r4, #520]
	mov	r1, #3
	ldr	r3, [r4, #712]
	orr	r0, r3, r0, lsl #20
	bl	unregister_chrdev_region
	b	.L268
.L294:
	movw	r1, #:lower16:.LC25
	ldr	r0, [r6]
	mov	r3, #1
	movt	r1, #:upper16:.LC25
	ldr	r2, .L296+16
	str	r5, [sp]
	bl	dev_err
.L277:
	ldr	r1, [r4, #520]
	ldr	r3, [r4, #712]
	ldr	r0, [r4, #716]
	orr	r1, r3, r1, lsl #20
	bl	device_destroy
	mov	r0, r8
	bl	cdev_del
	b	.L272
.L292:
	ldr	ip, [r6]
	mov	r5, r0
	movw	r3, #:lower16:.LC22
	movw	r1, #:lower16:.LC24
	movt	r3, #:upper16:.LC22
	ldr	r2, .L296
	movt	r1, #:upper16:.LC24
	str	r5, [sp]
	mov	r0, ip
	bl	dev_err
	b	.L270
.L295:
	movw	r1, #:lower16:.LC25
	ldr	r0, [r6]
	mov	r3, #2
	movt	r1, #:upper16:.LC25
	ldr	r2, .L296+16
	str	r5, [sp]
	bl	dev_err
.L282:
	ldr	r1, [r4, #520]
	ldr	r3, [r4, #712]
	ldr	r0, [r4, #716]
	add	r3, r3, #1
	orr	r1, r3, r1, lsl #20
	bl	device_destroy
	mov	r0, r9
	bl	cdev_del
	b	.L277
.L273:
	ldr	ip, [r6]
	mov	r5, r0
	movw	r1, #:lower16:.LC27
	mov	r3, r7
	movt	r1, #:upper16:.LC27
	ldr	r2, .L296+16
	str	r5, [sp]
	mov	r0, ip
	bl	dev_err
	mov	r0, r8
	bl	cdev_del
	cmp	r5, #0
	beq	.L276
	b	.L272
.L278:
	ldr	ip, [r6]
	mov	r5, r0
	movw	r1, #:lower16:.LC27
	movt	r1, #:upper16:.LC27
	mov	r3, #1
	ldr	r2, .L296+16
	str	r5, [sp]
	mov	r0, ip
	bl	dev_err
	mov	r0, r9
	bl	cdev_del
	cmp	r5, #0
	beq	.L281
	b	.L277
.L297:
	.align	2
.L296:
	.word	.LANCHOR1+104
	.word	.LANCHOR1+120
	.word	.LANCHOR1+240
	.word	.LANCHOR1+348
	.word	.LANCHOR1+228
	.fnend
	.size	es705_init_cdev, .-es705_init_cdev
	.align	2
	.global	es705_cleanup_cdev
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_cleanup_cdev, %function
es705_cleanup_cdev:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR0
	mov	r5, r0
	movt	r4, #:upper16:.LANCHOR0
	str	r6, [sp, #8]
	ldr	r1, [r4, #520]
	str	lr, [sp, #12]
	ldr	r3, [r4, #712]
	ldr	r0, [r4, #716]
	add	r3, r3, #2
	orr	r1, r3, r1, lsl #20
	bl	device_destroy
	add	r0, r5, #1232
	add	r0, r0, #4
	bl	cdev_del
	ldr	r1, [r4, #520]
	ldr	r3, [r4, #712]
	ldr	r0, [r4, #716]
	add	r3, r3, #1
	orr	r1, r3, r1, lsl #20
	bl	device_destroy
	add	r0, r5, #1296
	bl	cdev_del
	ldr	r1, [r4, #520]
	ldr	r3, [r4, #712]
	ldr	r0, [r4, #716]
	orr	r1, r3, r1, lsl #20
	bl	device_destroy
	add	r0, r5, #1168
	add	r0, r0, #8
	bl	cdev_del
	ldr	r0, [r4, #716]
	bl	class_destroy
	ldr	r0, [r4, #520]
	mov	r1, #3
	ldr	r3, [r4, #712]
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	orr	r0, r3, r0, lsl #20
	b	unregister_chrdev_region
	.fnend
	.size	es705_cleanup_cdev, .-es705_cleanup_cdev
	.global	streaming_fops
	.global	firmware_fops
	.global	command_fops
	.global	stream_consumer_mutex
	.global	stream_circ
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.27039, %object
	.size	__func__.27039, 13
__func__.27039:
	.ascii	"command_open\000"
	.space	3
	.type	__func__.27137, %object
	.size	__func__.27137, 15
__func__.27137:
	.ascii	"firmware_write\000"
	.space	1
	.type	__func__.27167, %object
	.size	__func__.27167, 15
__func__.27167:
	.ascii	"streaming_open\000"
	.space	1
	.type	__func__.27113, %object
	.size	__func__.27113, 14
__func__.27113:
	.ascii	"firmware_open\000"
	.space	2
	.type	__func__.27124, %object
	.size	__func__.27124, 17
__func__.27124:
	.ascii	"firmware_release\000"
	.space	3
	.type	__func__.27254, %object
	.size	__func__.27254, 19
__func__.27254:
	.ascii	"streaming_producer\000"
	.space	1
	.type	__func__.27288, %object
	.size	__func__.27288, 16
__func__.27288:
	.ascii	"es705_init_cdev\000"
	.type	command_fops, %object
	.size	command_fops, 108
command_fops:
	.word	0
	.word	command_llseek
	.word	command_read
	.word	command_write
	.space	28
	.word	command_open
	.space	4
	.word	command_release
	.space	52
	.type	__func__.27277, %object
	.size	__func__.27277, 12
__func__.27277:
	.ascii	"create_cdev\000"
	.type	firmware_fops, %object
	.size	firmware_fops, 108
firmware_fops:
	.word	0
	.space	8
	.word	firmware_write
	.space	28
	.word	firmware_open
	.space	4
	.word	firmware_release
	.space	52
	.type	streaming_fops, %object
	.size	streaming_fops, 108
streaming_fops:
	.word	0
	.space	4
	.word	streaming_read
	.space	16
	.word	streaming_poll
	.space	12
	.word	streaming_open
	.space	4
	.word	streaming_release
	.space	52
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	stream_circ, %object
	.size	stream_circ, 520
stream_circ:
	.space	520
	.type	cdev_major, %object
	.size	cdev_major, 4
cdev_major:
	.space	4
	.type	last_token, %object
	.size	last_token, 4
last_token:
	.space	4
	.type	parse_have, %object
	.size	parse_have, 4
parse_have:
	.space	4
	.type	parse_cb_preset, %object
	.size	parse_cb_preset, 4
parse_cb_preset:
	.space	4
	.type	parse_cb_cmd, %object
	.size	parse_cb_cmd, 4
parse_cb_cmd:
	.space	4
	.type	read_time, %object
	.size	read_time, 8
read_time:
	.space	8
	.type	readbuf, %object
	.size	readbuf, 128
readbuf:
	.space	128
	.type	__key.27171, %object
	.size	__key.27171, 0
__key.27171:
	.type	stream_consumer_mutex, %object
	.size	stream_consumer_mutex, 24
stream_consumer_mutex:
	.space	24
	.type	stream_read_page, %object
	.size	stream_read_page, 4
stream_read_page:
	.space	4
	.type	stream_read_off, %object
	.size	stream_read_off, 4
stream_read_off:
	.space	4
	.type	cb_pages_out, %object
	.size	cb_pages_out, 4
cb_pages_out:
	.space	4
	.type	cdev_minor, %object
	.size	cdev_minor, 4
cdev_minor:
	.space	4
	.type	__key.27291, %object
	.size	__key.27291, 0
__key.27291:
	.type	cdev_class, %object
	.size	cdev_class, 4
cdev_class:
	.space	4
	.type	fw_buf, %object
	.size	fw_buf, 4096
fw_buf:
	.space	4096
	.type	parse_buffer, %object
	.size	parse_buffer, 4100
parse_buffer:
	.space	4100
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<4>es705-cdev: %s(): no such device major=%u minor="
	.ascii	"%u\012\000"
	.space	1
.LC1:
	.ascii	"%s(): open: error bad cdev field\012\000"
	.space	2
.LC2:
	.ascii	"%s(): error loading firmware: %d\012\000"
	.space	2
.LC3:
	.ascii	"0x%hx\000"
	.space	2
.LC4:
	.ascii	"!Preset\000"
.LC5:
	.ascii	"id:\000"
.LC6:
	.ascii	"%d\000"
	.space	1
.LC7:
	.ascii	" \011\015\012\000"
	.space	3
.LC8:
	.ascii	"%li.%4li 0x%04hx 0x%04hx\012\000"
	.space	2
.LC9:
	.ascii	"%s(): streaming not configured\000"
	.space	1
.LC10:
	.ascii	"%s(): did not get streaming lock: %d\012\000"
	.space	2
.LC11:
	.ascii	"%s(): no such device major=%u minor=%u\012\000"
.LC12:
	.ascii	"%s(): can't open streaming device = %d\012\000"
.LC13:
	.ascii	"&stream_consumer_mutex\000"
	.space	1
.LC14:
	.ascii	"es705 stream thread\000"
.LC15:
	.ascii	"%s(): can't create es705 streaming thread = %p\012\000"
.LC16:
	.ascii	"%s(): bus specific boot setup failed: %d\012\000"
	.space	2
.LC17:
	.ascii	"%s(): bus specific boot finish failed: %d\012\000"
	.space	1
.LC18:
	.ascii	"%s(): lost page of stream buffer\012\000"
	.space	2
.LC19:
	.ascii	"%s(): read error on streamdev: %d\012\000"
	.space	1
.LC20:
	.ascii	"%s(): -ENOMEM, streaming page allocation\012\000"
	.space	2
.LC21:
	.ascii	"%s(): -ENOMEM, exit producer\012\000"
	.space	2
.LC22:
	.ascii	"adnc\000"
	.space	3
.LC23:
	.ascii	"%s(): unable to allocate char dev = %d\000"
	.space	1
.LC24:
	.ascii	"%s(): unable to create %s class = %d\012\000"
	.space	2
.LC25:
	.ascii	"%s(): failed to add cdev=%d error: %d\000"
	.space	2
.LC26:
	.ascii	"adnc%d\000"
	.space	1
.LC27:
	.ascii	"%s(): device_create cdev=%d failed: %d\012\000"
.LC28:
	.ascii	"%s(): setup failure: no cdevs available!\012\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
