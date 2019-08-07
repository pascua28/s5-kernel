snd_pcm_mmap_data_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #80]
	add	r2, r3, #220
	.syntax divided
@ 45 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r1, [r2]
	add	r1, r1, #1
	strex	r0, r1, [r2]
	teq	r0, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	bx	lr
	.fnend
	.size	snd_pcm_mmap_data_open, .-snd_pcm_mmap_data_open
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_mmap_data_close, %function
snd_pcm_mmap_data_close:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #80]
	add	r2, r3, #220
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
	bx	lr
	.fnend
	.size	snd_pcm_mmap_data_close, .-snd_pcm_mmap_data_close
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_action_group, %function
snd_pcm_action_group:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	strd	r6, [sp, #8]
	mov	r6, r1
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	mov	r10, r3
	str	lr, [sp, #28]
	ldr	r1, [r1, #208]
	ldr	r4, [r1, #4]!
	cmp	r4, r1
	sub	r4, r4, #184
	beq	.L16
	mov	r5, r0
	mov	r7, r2
	and	r9, r3, #1
	b	.L8
.L6:
	mov	r1, r7
	mov	r0, r4
	ldr	r3, [r5]
	blx	r3
	subs	r8, r0, #0
	blt	.L7
	ldr	r2, [r6, #208]
	ldr	r3, [r4, #184]
	add	r1, r2, #4
	cmp	r3, r1
	sub	r4, r3, #184
	beq	.L32
.L8:
	cmp	r6, r4
	moveq	r3, #0
	andne	r3, r9, #1
	cmp	r3, #0
	beq	.L6
	add	r0, r4, #192
	bl	_raw_spin_lock
	b	.L6
.L32:
	ldr	r4, [r2, #4]
	cmp	r3, r4
	sub	r4, r4, #184
	bne	.L11
	b	.L7
.L9:
	ldr	r2, [r6, #208]
	ldr	r3, [r4, #184]
	add	r1, r2, #4
	cmp	r3, r1
	sub	r4, r3, #184
	beq	.L33
.L11:
	mov	r1, r7
	mov	r0, r4
	ldr	r3, [r5, #4]
	blx	r3
	subs	r8, r0, #0
	bge	.L9
	ldr	r3, [r5, #8]
	cmp	r3, #0
	bne	.L34
.L19:
	mov	r4, #0
.L7:
	cmp	r10, #0
	beq	.L4
	ldr	r3, [r6, #208]
	ldr	r5, [r3, #4]!
	cmp	r5, r3
	sub	r5, r5, #184
	bne	.L15
	b	.L4
.L35:
	ldr	r3, [r6, #208]
	ldr	r5, [r5, #184]
	add	r3, r3, #4
	cmp	r5, r3
	sub	r5, r5, #184
	beq	.L4
.L15:
	cmp	r6, r5
	add	r0, r5, #192
	beq	.L14
	bl	_raw_spin_unlock
.L14:
	cmp	r4, r5
	bne	.L35
.L4:
	mov	r0, r8
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L33:
	ldr	r4, [r2, #4]
	cmp	r3, r4
	sub	r4, r4, #184
	beq	.L7
.L12:
	mov	r0, r4
	ldr	r3, [r5, #12]
	mov	r1, r7
	blx	r3
	ldr	r3, [r6, #208]
	ldr	r4, [r4, #184]
	add	r3, r3, #4
	cmp	r4, r3
	sub	r4, r4, #184
	bne	.L12
	b	.L7
.L34:
	ldr	r2, [r6, #208]
	ldr	r1, [r2, #4]!
	sub	r9, r1, #184
	cmp	r9, r4
	cmpne	r1, r2
	bne	.L10
	b	.L19
.L36:
	ldr	r3, [r5, #8]
.L10:
	mov	r0, r9
	mov	r1, r7
	blx	r3
	ldr	r2, [r9, #184]
	ldr	r3, [r6, #208]
	sub	r9, r2, #184
	add	r3, r3, #4
	cmp	r9, r4
	cmpne	r3, r2
	bne	.L36
	mov	r4, #0
	b	.L7
.L16:
	mov	r8, #0
	b	.L7
	.fnend
	.size	snd_pcm_action_group, .-snd_pcm_action_group
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_pre_start, %function
snd_pcm_pre_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #168]
	ldr	r2, [r3, #160]
	ldr	r1, [r2]
	cmp	r1, #2
	bne	.L42
	ldr	r1, [r0, #48]
	cmp	r1, #0
	bne	.L45
	ldrb	r1, [r0, #264]	@ zero_extendqisi2
	tst	r1, #2
	bne	.L45
	ldr	ip, [r3, #120]
	ldr	r1, [r3, #132]
	cmp	ip, r1
	bcs	.L45
	.save {lr}
	str	lr, [sp, #-4]!
	ldr	r2, [r2, #8]
	ldr	lr, [r3, #164]
	ldr	ip, [r3, #68]
	ldr	lr, [lr]
	add	r2, ip, r2
	subs	r2, r2, lr
	addmi	r2, r1, r2
	bmi	.L41
	cmp	r1, r2
	subls	r2, r2, r1
.L41:
	cmp	ip, r2
	bls	.L43
	str	r0, [r3]
	mov	r0, #0
.L37:
	ldr	pc, [sp], #4
.L45:
	str	r0, [r3]
	mov	r0, #0
	bx	lr
.L42:
	mvn	r0, #76
	bx	lr
.L43:
	mvn	r0, #31
	b	.L37
	.fnend
	.size	snd_pcm_pre_start, .-snd_pcm_pre_start
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_do_start, %function
snd_pcm_do_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #168]
	ldr	r2, [r2]
	cmp	r2, r0
	bne	.L50
	ldr	r3, [r2, #164]
	mov	r1, #1
	ldr	r3, [r3, #24]
	bx	r3
.L50:
	mov	r0, #0
	bx	lr
	.fnend
	.size	snd_pcm_do_start, .-snd_pcm_do_start
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_undo_start, %function
snd_pcm_undo_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #168]
	ldr	r2, [r2]
	cmp	r2, r0
	bne	.L51
	ldr	r3, [r2, #164]
	mov	r1, #0
	ldr	r3, [r3, #24]
	bx	r3
.L51:
	bx	lr
	.fnend
	.size	snd_pcm_undo_start, .-snd_pcm_undo_start
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_pre_stop, %function
snd_pcm_pre_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #168]
	ldr	r2, [r3, #160]
	ldr	r2, [r2]
	cmp	r2, #0
	strne	r0, [r3]
	movne	r0, #0
	mvneq	r0, #76
	bx	lr
	.fnend
	.size	snd_pcm_pre_stop, .-snd_pcm_pre_stop
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_pre_pause, %function
snd_pcm_pre_pause:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #168]
	ldr	r2, [r3, #88]
	tst	r2, #524288
	beq	.L60
	ldr	r2, [r3, #160]
	cmp	r1, #0
	ldr	r2, [r2]
	bne	.L63
	cmp	r2, #6
	bne	.L62
.L59:
	str	r0, [r3]
	mov	r0, #0
	bx	lr
.L63:
	cmp	r2, #3
	beq	.L59
.L62:
	mvn	r0, #76
	bx	lr
.L60:
	mvn	r0, #37
	bx	lr
	.fnend
	.size	snd_pcm_pre_pause, .-snd_pcm_pre_pause
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_pre_suspend, %function
snd_pcm_pre_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #168]
	ldr	r2, [r3, #160]
	ldr	r2, [r2]
	cmp	r2, #7
	strne	r0, [r3]
	movne	r0, #0
	mvneq	r0, #15
	bx	lr
	.fnend
	.size	snd_pcm_pre_suspend, .-snd_pcm_pre_suspend
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_pre_resume, %function
snd_pcm_pre_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #168]
	ldr	r2, [r3, #88]
	tst	r2, #262144
	strne	r0, [r3]
	movne	r0, #0
	mvneq	r0, #37
	bx	lr
	.fnend
	.size	snd_pcm_pre_resume, .-snd_pcm_pre_resume
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_pre_reset, %function
snd_pcm_pre_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #168]
	ldr	r3, [r3, #160]
	ldr	r2, [r3]
	cmp	r2, #7
	bhi	.L72
	mov	r3, #1
	lsl	r3, r3, r2
	tst	r3, #204
	mvneq	r0, #76
	movne	r0, #0
	bx	lr
.L72:
	mvn	r0, #76
	bx	lr
	.fnend
	.size	snd_pcm_pre_reset, .-snd_pcm_pre_reset
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_do_reset, %function
snd_pcm_do_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r2, #0
	str	lr, [sp, #4]
	ldr	ip, [r0, #164]
	mov	r1, r2
	ldr	r4, [r0, #168]
	ldr	r3, [ip, #8]
	blx	r3
	cmp	r0, #0
	blt	.L74
	mov	r2, #0
	ldr	lr, [r4, #60]
	ldr	ip, [r4, #160]
	mov	r0, r2
	str	r2, [r4, #20]
	ldr	r3, [ip, #8]
	udiv	r1, r3, lr
	mls	r1, lr, r1, r3
	sub	r3, r3, r1
	str	r3, [r4, #24]
	ldr	r3, [ip, #8]
	str	r3, [r4, #136]
	str	r2, [r4, #140]
.L74:
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
	.fnend
	.size	snd_pcm_do_reset, .-snd_pcm_do_reset
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_pre_prepare, %function
snd_pcm_pre_prepare:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #168]
	ldr	r3, [r3, #160]
	ldr	r3, [r3]
	bics	r2, r3, #8
	beq	.L80
	cmp	r3, #3
	beq	.L82
	cmp	r3, #5
	beq	.L83
.L79:
	str	r1, [r0, #224]
	mov	r0, #0
	bx	lr
.L83:
	ldr	r3, [r0, #48]
	cmp	r3, #0
	bne	.L79
.L82:
	mvn	r0, #15
	bx	lr
.L80:
	mvn	r0, #76
	bx	lr
	.fnend
	.size	snd_pcm_pre_prepare, .-snd_pcm_pre_prepare
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_pre_drain_init, %function
snd_pcm_pre_drain_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	mov	r0, #0
	ldr	r2, [r3, #168]
	str	r3, [r2]
	bx	lr
	.fnend
	.size	snd_pcm_pre_drain_init, .-snd_pcm_pre_drain_init
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_post_drain_init, %function
snd_pcm_post_drain_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	snd_pcm_post_drain_init, .-snd_pcm_post_drain_init
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_playback_poll, %function
snd_pcm_playback_poll:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	subs	r2, r1, #0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r3, [r0, #124]
	ldr	r5, [r3]
	ldr	r4, [r5, #168]
	beq	.L87
	ldr	r3, [r2]
	add	r1, r4, #172
	cmp	r3, #0
	cmnne	r4, #172
	beq	.L87
	blx	r3
.L87:
	movw	r0, #:lower16:.LANCHOR0
	add	r5, r5, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r5
	bl	_raw_spin_lock
	ldr	ip, [r4, #68]
	ldr	r2, [r4, #160]
	ldr	r0, [r4, #164]
	ldr	r3, [r2, #8]
	ldr	r1, [r0]
	add	r3, r3, ip
	subs	r3, r3, r1
	ldr	r1, [r4, #132]
	addmi	r3, r3, r1
	bmi	.L89
	cmp	r3, r1
	subcs	r3, r3, r1
.L89:
	ldr	r2, [r2]
	sub	r2, r2, #2
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L90
.L92:
	.word	.L91
	.word	.L91
	.word	.L90
	.word	.L94
	.word	.L91
.L94:
	mov	r4, #0
.L93:
	mov	r0, r5
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	ldr	r6, [sp, #8]
	mov	r0, r4
	ldrd	r4, [sp]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L91:
	ldr	r4, [r0, #4]
	cmp	r4, r3
	movls	r4, #260
	movhi	r4, #0
	b	.L93
.L90:
	mov	r4, #268
	b	.L93
	.fnend
	.size	snd_pcm_playback_poll, .-snd_pcm_playback_poll
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_capture_poll, %function
snd_pcm_capture_poll:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	subs	r2, r1, #0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r3, [r0, #124]
	ldr	r5, [r3]
	ldr	r4, [r5, #168]
	beq	.L104
	ldr	r3, [r2]
	add	r1, r4, #172
	cmp	r3, #0
	cmnne	r4, #172
	beq	.L104
	blx	r3
.L104:
	movw	r0, #:lower16:.LANCHOR0
	add	r5, r5, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r5
	bl	_raw_spin_lock
	ldr	r2, [r4, #160]
	ldr	r0, [r4, #164]
	ldr	r3, [r2, #8]
	ldr	r1, [r0]
	ldr	r2, [r2]
	subs	r3, r3, r1
	ldrmi	r1, [r4, #132]
	sub	r2, r2, #2
	addmi	r3, r3, r1
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L110
.L108:
	.word	.L107
	.word	.L107
	.word	.L110
	.word	.L109
	.word	.L107
.L109:
	cmp	r3, #0
	movne	r4, #65
	moveq	r4, #73
.L106:
	mov	r0, r5
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	ldr	r6, [sp, #8]
	mov	r0, r4
	ldrd	r4, [sp]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L107:
	ldr	r4, [r0, #4]
	cmp	r4, r3
	movls	r4, #65
	movhi	r4, #0
	b	.L106
.L110:
	mov	r4, #73
	b	.L106
	.fnend
	.size	snd_pcm_capture_poll, .-snd_pcm_capture_poll
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_hw_rule_buffer_bytes_max, %function
snd_pcm_hw_rule_buffer_bytes_max:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r1
	.save {lr}
	str	lr, [sp, #-4]!
	.pad #20
	sub	sp, sp, #20
	ldr	r3, [ip, #8]
	mov	lr, #0
	add	r1, sp, #4
	ldr	ip, [ip, #28]
	ldrb	r2, [sp, #12]	@ zero_extendqisi2
	str	lr, [sp, #4]
	sub	r3, r3, #8
	add	r3, r3, r3, lsl #1
	ldr	ip, [ip, #128]
	and	r2, r2, #252
	add	r0, r0, r3, lsl #2
	orr	r2, r2, #4
	add	r0, r0, #260
	str	ip, [sp, #8]
	strb	r2, [sp, #12]
	bl	snd_interval_refine
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
	.fnend
	.size	snd_pcm_hw_rule_buffer_bytes_max, .-snd_pcm_hw_rule_buffer_bytes_max
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_post_reset, %function
snd_pcm_post_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #168]
	ldr	ip, [r3, #160]
	ldr	r1, [r3, #164]
	ldr	ip, [ip, #8]
	str	ip, [r1]
	ldr	r2, [r0, #48]
	cmp	r2, #0
	bne	.L122
	ldr	r3, [r3, #128]
	cmp	r3, #0
	bne	.L127
.L122:
	bx	lr
.L127:
	mvn	r1, #0
	b	snd_pcm_playback_silence
	.fnend
	.size	snd_pcm_post_reset, .-snd_pcm_post_reset
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_hw_rule_muldivk, %function
snd_pcm_hw_rule_muldivk:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	mov	r4, r0
	mov	r5, r1
	str	lr, [sp, #8]
	ldrd	r0, [r1, #12]
	.pad #20
	sub	sp, sp, #20
	add	r3, sp, #4
	ldr	r2, [r5, #28]
	sub	r0, r0, #8
	sub	r1, r1, #8
	add	r0, r0, r0, lsl #1
	add	r1, r1, r1, lsl #1
	add	r0, r4, r0, lsl #2
	add	r1, r4, r1, lsl #2
	add	r0, r0, #260
	add	r1, r1, #260
	bl	snd_interval_muldivk
	ldr	r0, [r5, #8]
	add	r1, sp, #4
	sub	r0, r0, #8
	add	r0, r0, r0, lsl #1
	add	r0, r4, r0, lsl #2
	add	r0, r0, #260
	bl	snd_interval_refine
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
	.fnend
	.size	snd_pcm_hw_rule_muldivk, .-snd_pcm_hw_rule_muldivk
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_hw_rule_mulkdiv, %function
snd_pcm_hw_rule_mulkdiv:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	mov	r4, r0
	mov	r5, r1
	str	lr, [sp, #8]
	ldr	r0, [r1, #12]
	.pad #20
	sub	sp, sp, #20
	ldr	r2, [r1, #16]
	add	r3, sp, #4
	ldr	r1, [r1, #28]
	sub	r0, r0, #8
	sub	r2, r2, #8
	add	r0, r0, r0, lsl #1
	add	r2, r2, r2, lsl #1
	add	r0, r4, r0, lsl #2
	add	r2, r4, r2, lsl #2
	add	r0, r0, #260
	add	r2, r2, #260
	bl	snd_interval_mulkdiv
	ldr	r0, [r5, #8]
	add	r1, sp, #4
	sub	r0, r0, #8
	add	r0, r0, r0, lsl #1
	add	r0, r4, r0, lsl #2
	add	r0, r0, #260
	bl	snd_interval_refine
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
	.fnend
	.size	snd_pcm_hw_rule_mulkdiv, .-snd_pcm_hw_rule_mulkdiv
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_hw_rule_mul, %function
snd_pcm_hw_rule_mul:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	mov	r4, r0
	mov	r5, r1
	str	lr, [sp, #8]
	ldrd	r0, [r1, #12]
	.pad #20
	sub	sp, sp, #20
	add	r2, sp, #4
	sub	r0, r0, #8
	sub	r1, r1, #8
	add	r0, r0, r0, lsl #1
	add	r1, r1, r1, lsl #1
	add	r0, r4, r0, lsl #2
	add	r1, r4, r1, lsl #2
	add	r0, r0, #260
	add	r1, r1, #260
	bl	snd_interval_mul
	ldr	r0, [r5, #8]
	add	r1, sp, #4
	sub	r0, r0, #8
	add	r0, r0, r0, lsl #1
	add	r0, r4, r0, lsl #2
	add	r0, r0, #260
	bl	snd_interval_refine
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
	.fnend
	.size	snd_pcm_hw_rule_mul, .-snd_pcm_hw_rule_mul
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_hw_rule_div, %function
snd_pcm_hw_rule_div:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	mov	r4, r0
	mov	r5, r1
	str	lr, [sp, #8]
	ldrd	r0, [r1, #12]
	.pad #20
	sub	sp, sp, #20
	add	r2, sp, #4
	sub	r0, r0, #8
	sub	r1, r1, #8
	add	r0, r0, r0, lsl #1
	add	r1, r1, r1, lsl #1
	add	r0, r4, r0, lsl #2
	add	r1, r4, r1, lsl #2
	add	r0, r0, #260
	add	r1, r1, #260
	bl	snd_interval_div
	ldr	r0, [r5, #8]
	add	r1, sp, #4
	sub	r0, r0, #8
	add	r0, r0, r0, lsl #1
	add	r0, r4, r0, lsl #2
	add	r0, r0, #260
	bl	snd_interval_refine
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
	.fnend
	.size	snd_pcm_hw_rule_div, .-snd_pcm_hw_rule_div
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_hw_rule_sample_bits, %function
snd_pcm_hw_rule_sample_bits:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-20]!
	.save {r4, r5, r6, r7, lr}
	mov	r2, #0
	mov	r5, r1
	strd	r6, [sp, #8]
	mvn	r1, #0
	mov	r4, r2
	str	lr, [sp, #16]
	.pad #20
	sub	sp, sp, #20
	mov	r6, r0
	ldrb	r3, [sp, #12]	@ zero_extendqisi2
	mov	r7, #1
	stmib	sp, {r1, r2}
	and	r3, r3, #254
	bfi	r3, r2, #1, #1
	strb	r3, [sp, #12]
.L141:
	lsr	r2, r4, #5
	and	r3, r4, #31
	mov	r0, r4
	add	r2, r6, r2, lsl #2
	add	r4, r4, #1
	ldr	r2, [r2, #36]
	ands	r3, r2, r7, lsl r3
	beq	.L138
	bl	snd_pcm_format_physical_width
	cmp	r0, #0
	ble	.L138
	ldr	r3, [sp, #4]
	cmp	r3, r0
	ldr	r3, [sp, #8]
	strhi	r0, [sp, #4]
	cmp	r0, r3
	strhi	r0, [sp, #8]
.L138:
	cmp	r4, #48
	bne	.L141
	ldr	r0, [r5, #8]
	add	r1, sp, #4
	ldrb	r3, [sp, #12]	@ zero_extendqisi2
	sub	r0, r0, #8
	add	r0, r0, r0, lsl #1
	orr	r3, r3, #4
	add	r0, r6, r0, lsl #2
	strb	r3, [sp, #12]
	add	r0, r0, #260
	bl	snd_interval_refine
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
	.fnend
	.size	snd_pcm_hw_rule_sample_bits, .-snd_pcm_hw_rule_sample_bits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_hw_rule_format, %function
snd_pcm_hw_rule_format:
	.fnstart
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-28]!
	.save {r4, r5, r6, r7, r8, r9, lr}
	mvn	r2, #0
	mvn	r3, #0
	strd	r6, [sp, #8]
	mov	r4, #0
	mov	r7, r0
	strd	r8, [sp, #16]
	add	r6, r0, #36
	str	lr, [sp, #24]
	ldr	r9, [r1, #12]
	.pad #68
	sub	sp, sp, #68
	strd	r2, [sp]
	sub	r9, r9, #8
	add	r9, r9, r9, lsl #1
	lsl	r9, r9, #2
.L149:
	lsr	r5, r4, #5
	and	r3, r4, #31
	lsl	r5, r5, #2
	mov	r8, #1
	lsl	r8, r8, r3
	add	r3, r7, r5
	ldr	r3, [r3, #36]
	mov	r0, r4
	add	r4, r4, #1
	tst	r8, r3
	beq	.L146
	bl	snd_pcm_format_physical_width
	cmp	r0, #0
	add	r2, sp, #64
	add	r3, r7, r9
	add	r5, r2, r5
	ble	.L146
	ldr	r2, [r3, #260]
	cmp	r2, r0
	bhi	.L148
	ldr	r3, [r3, #264]
	cmp	r0, r3
	bls	.L146
.L148:
	ldr	r3, [r5, #-64]
	bic	r8, r3, r8
	str	r8, [r5, #-64]
.L146:
	cmp	r4, #48
	bne	.L149
	ldrd	r0, [r7, #36]
	ldm	sp, {r4, r8}
	ldr	ip, [r7, #36]
	ldrd	r2, [r6, #8]
	ldr	lr, [r7, #40]
	strd	r0, [sp, #32]
	ldrd	r0, [r6, #24]
	and	ip, ip, r4
	ldrd	r4, [r6, #16]
	strd	r2, [sp, #40]
	cmp	ip, #0
	and	r3, lr, r8
	str	ip, [r7, #36]
	strd	r4, [sp, #48]
	str	r3, [r7, #40]
	strd	r0, [sp, #56]
	bne	.L150
	cmp	r3, #0
	mvneq	r0, #21
	bne	.L150
.L144:
	add	sp, sp, #68
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	add	sp, sp, #24
	ldr	pc, [sp], #4
.L150:
	add	r1, sp, #32
	mov	r0, r6
	mov	r2, #8
	bl	memcmp
	adds	r0, r0, #0
	movne	r0, #1
	b	.L144
	.fnend
	.size	snd_pcm_hw_rule_format, .-snd_pcm_hw_rule_format
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_hw_rule_rate, %function
snd_pcm_hw_rule_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r1
	.save {lr}
	str	lr, [sp, #-4]!
	movw	r2, #:lower16:.LANCHOR1
	ldr	r3, [ip, #8]
	movt	r2, #:upper16:.LANCHOR1
	mov	r1, #13
	ldr	lr, [ip, #28]
	sub	r3, r3, #8
	add	ip, r3, r3, lsl #1
	ldr	r3, [lr, #16]
	ldr	lr, [sp], #4
	add	r0, r0, ip, lsl #2
	add	r0, r0, #260
	b	snd_interval_list
	.fnend
	.size	snd_pcm_hw_rule_rate, .-snd_pcm_hw_rule_rate
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_write, %function
snd_pcm_write:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	str	lr, [sp, #4]
	ldr	r3, [r0, #124]
	ldr	r0, [r3]
	ldr	r4, [r0, #168]
	ldr	r3, [r4, #160]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L159
	ldr	ip, [r4, #76]
	udiv	r3, r2, ip
	mls	r3, ip, r3, r2
	cmp	r3, #0
	bne	.L160
	ldr	r3, [r4, #80]
	lsl	r2, r2, #3
	udiv	r2, r2, r3
	bl	snd_pcm_lib_write
	cmp	r0, #0
	ble	.L157
	ldr	r3, [r4, #80]
	mul	r0, r3, r0
	lsr	r0, r0, #3
.L157:
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L160:
	mvn	r0, #21
	b	.L157
.L159:
	mvn	r0, #76
	b	.L157
	.fnend
	.size	snd_pcm_write, .-snd_pcm_write
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_aio_write, %function
snd_pcm_aio_write:
	.fnstart
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r3, [r0, #20]
	ldr	r3, [r3, #124]
	ldr	r9, [r3]
	ldr	r7, [r9, #168]
	ldr	r3, [r7, #160]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L170
	cmp	r2, #128
	bhi	.L173
	ldr	r3, [r7, #56]
	cmp	r3, r2
	bne	.L173
	ldr	r0, [r1, #4]
	ldr	r3, [r7, #76]
	udiv	r4, r0, r3
	mls	r4, r3, r4, r0
	cmp	r4, #0
	bne	.L173
	lsl	r6, r0, #3
	mov	r5, r2
	lsl	r0, r2, #2
	ldr	r2, [r7, #84]
	mov	r10, r1
	mov	r1, #208
	udiv	r6, r6, r2
	bl	__kmalloc
	subs	r8, r0, #0
	beq	.L178
	cmp	r5, #0
	movne	r3, r4
	subne	r0, r8, #4
	beq	.L169
.L165:
	ldr	ip, [r10, r3, lsl #3]
	add	r3, r3, #1
	cmp	r5, r3
	str	ip, [r0, #4]!
	bne	.L165
.L169:
	mov	r2, r6
	mov	r0, r9
	mov	r1, r8
	bl	snd_pcm_lib_writev
	subs	r4, r0, #0
	ble	.L167
	ldr	r3, [r7, #80]
	mul	r4, r3, r4
	lsr	r4, r4, #3
.L167:
	mov	r0, r8
	bl	kfree
.L162:
	mov	r0, r4
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L173:
	mvn	r4, #21
	b	.L162
.L170:
	mvn	r4, #76
	b	.L162
.L178:
	mvn	r4, #11
	b	.L162
	.fnend
	.size	snd_pcm_aio_write, .-snd_pcm_aio_write
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_sw_params_user, %function
snd_pcm_sw_params_user:
	.fnstart
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	strd	r6, [sp, #8]
	movw	r6, #:lower16:__stack_chk_guard
	mov	r7, r0
	str	r8, [sp, #16]
	movt	r6, #:upper16:__stack_chk_guard
	str	lr, [sp, #20]
	.pad #112
	sub	sp, sp, #112
	ldr	r2, [r6]
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
	str	r2, [sp, #108]
	.syntax divided
@ 439 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r0, r1, #104; sbcccs r0, r0, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	bne	.L180
	mov	r2, #104
	add	r0, sp, #4
	mov	r5, r1
	bl	__copy_from_user
	cmp	r0, #0
	bne	.L204
	ldr	r4, [r7, #168]
	movw	r0, #:lower16:.LANCHOR0
	add	r8, r7, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r8
	bl	_raw_spin_lock
	ldr	r3, [r4, #160]
	mov	r0, r8
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L205
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	ldr	r3, [sp, #4]
	cmp	r3, #1
	bgt	.L197
	ldr	r3, [sp, #16]
	cmp	r3, #0
	beq	.L197
	ldr	r1, [r4, #132]
	ldrd	r2, [sp, #32]
	cmp	r3, r1
	bcs	.L206
	cmp	r3, r2
	bhi	.L197
	ldr	r3, [r4, #68]
	cmp	r3, r2
	bcc	.L197
.L186:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r8
	bl	_raw_spin_lock
	ldrd	r0, [sp, #4]
	ldr	r3, [r4, #164]
	ldr	r2, [sp, #16]
	strd	r0, [r4, #108]
	add	r0, sp, #24
	str	r2, [r3, #4]
	ldr	ip, [r4, #132]
	ldm	r0, {r0, r2, r3}
	ldr	r1, [sp, #36]
	str	ip, [sp, #40]
	str	r0, [r4, #116]
	strd	r2, [r4, #120]
	str	r1, [r4, #128]
	ldr	r3, [r7, #168]
	ldr	r3, [r3, #160]
	ldr	r2, [r3]
	cmp	r2, #3
	beq	.L207
	cmp	r2, #5
	beq	.L208
.L199:
	mov	r4, #0
.L189:
	mov	r0, r8
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
.L184:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
	.syntax divided
@ 448 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r2, r5, #104; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	bne	.L204
	add	r1, sp, #4
	mov	r0, r5
	mov	r2, #104
	bl	__copy_to_user
	cmp	r0, #0
	bne	.L204
.L179:
	ldr	r2, [sp, #108]
	mov	r0, r4
	ldr	r3, [r6]
	cmp	r2, r3
	bne	.L209
	add	sp, sp, #112
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L206:
	cmp	r2, #0
	beq	.L186
.L197:
	mvn	r4, #21
	b	.L184
.L207:
	ldr	r3, [r7, #48]
.L188:
	clz	r3, r3
	cmp	r1, #0
	lsr	r3, r3, #5
	moveq	r3, #0
	cmp	r3, #0
	bne	.L210
.L190:
	mov	r1, r4
	mov	r0, r7
	bl	snd_pcm_update_state
	mov	r4, r0
	b	.L189
.L208:
	ldr	r3, [r7, #48]
	cmp	r3, #0
	bne	.L199
	b	.L188
.L180:
	mov	r1, #104
	add	r0, sp, #4
	bl	__memzero
.L204:
	mvn	r4, #13
	b	.L179
.L210:
	mvn	r1, #0
	mov	r0, r7
	bl	snd_pcm_playback_silence
	b	.L190
.L205:
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	mvn	r4, #76
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	b	.L184
.L209:
	bl	__stack_chk_fail
	.fnend
	.size	snd_pcm_sw_params_user, .-snd_pcm_sw_params_user
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_read, %function
snd_pcm_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	str	lr, [sp, #4]
	ldr	r3, [r0, #124]
	ldr	r0, [r3]
	ldr	r4, [r0, #168]
	ldr	r3, [r4, #160]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L213
	ldr	ip, [r4, #76]
	udiv	r3, r2, ip
	mls	r3, ip, r3, r2
	cmp	r3, #0
	bne	.L214
	ldr	r3, [r4, #80]
	lsl	r2, r2, #3
	udiv	r2, r2, r3
	bl	snd_pcm_lib_read
	cmp	r0, #0
	ble	.L211
	ldr	r3, [r4, #80]
	mul	r0, r3, r0
	lsr	r0, r0, #3
.L211:
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L214:
	mvn	r0, #21
	b	.L211
.L213:
	mvn	r0, #76
	b	.L211
	.fnend
	.size	snd_pcm_read, .-snd_pcm_read
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_aio_read, %function
snd_pcm_aio_read:
	.fnstart
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r3, [r0, #20]
	ldr	r3, [r3, #124]
	ldr	r9, [r3]
	ldr	r7, [r9, #168]
	ldr	r3, [r7, #160]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L224
	cmp	r2, #1024
	bhi	.L227
	ldr	r3, [r7, #56]
	cmp	r3, r2
	bne	.L227
	ldr	r0, [r1, #4]
	ldr	r3, [r7, #76]
	udiv	r4, r0, r3
	mls	r4, r3, r4, r0
	cmp	r4, #0
	bne	.L227
	lsl	r6, r0, #3
	mov	r5, r2
	lsl	r0, r2, #2
	ldr	r2, [r7, #84]
	mov	r10, r1
	mov	r1, #208
	udiv	r6, r6, r2
	bl	__kmalloc
	subs	r8, r0, #0
	beq	.L232
	cmp	r5, #0
	movne	r3, r4
	subne	r0, r8, #4
	beq	.L223
.L219:
	ldr	ip, [r10, r3, lsl #3]
	add	r3, r3, #1
	cmp	r5, r3
	str	ip, [r0, #4]!
	bne	.L219
.L223:
	mov	r2, r6
	mov	r0, r9
	mov	r1, r8
	bl	snd_pcm_lib_readv
	subs	r4, r0, #0
	ble	.L221
	ldr	r3, [r7, #80]
	mul	r4, r3, r4
	lsr	r4, r4, #3
.L221:
	mov	r0, r8
	bl	kfree
.L216:
	mov	r0, r4
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L227:
	mvn	r4, #21
	b	.L216
.L224:
	mvn	r4, #76
	b	.L216
.L232:
	mvn	r4, #11
	b	.L216
	.fnend
	.size	snd_pcm_aio_read, .-snd_pcm_aio_read
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_mmap_data_fault, %function
snd_pcm_mmap_data_fault:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, [r0, #80]
	cmp	r0, #0
	beq	.L249
	ldr	ip, [r0, #168]
	ldr	r2, [r1, #4]
	ldr	r3, [ip, #548]
	lsl	r2, r2, #12
	add	r3, r3, #4080
	add	r3, r3, #15
	bic	r3, r3, #4080
	bic	r3, r3, #15
	sub	r3, r3, #4096
	cmp	r3, r2
	bcc	.L249
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r1
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r3, [r0, #164]
	ldr	r3, [r3, #40]
	cmp	r3, #0
	beq	.L237
	mov	r1, r2
	blx	r3
	mov	r4, r0
.L238:
	cmp	r4, #0
	moveq	r0, #2
	beq	.L233
	ldr	r3, [r4]
	tst	r3, #32768
	bne	.L239
.L241:
	mov	r3, r4
	ldr	r2, [r3, #16]!
	.syntax divided
@ 45 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
.L240:
	mov	r0, #0
	str	r4, [r5, #12]
.L233:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L249:
	mov	r0, #2
	bx	lr
.L239:
	mov	r0, r4
	bl	__get_page_tail
	cmp	r0, #0
	bne	.L240
	b	.L241
.L237:
	ldr	r3, [ip, #540]
	movw	r1, #:lower16:mem_map
	movt	r1, #:upper16:mem_map
	ldr	r4, [r1]
	add	r3, r3, r2
	add	r3, r3, #1073741824
	lsr	r3, r3, #12
	add	r4, r4, r3, lsl #5
	b	.L238
	.fnend
	.size	snd_pcm_mmap_data_fault, .-snd_pcm_mmap_data_fault
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_fasync, %function
snd_pcm_fasync:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #124]
	ldr	r3, [r3]
	ldr	r3, [r3, #168]
	add	r3, r3, #196
	b	fasync_helper
	.fnend
	.size	snd_pcm_fasync, .-snd_pcm_fasync
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_do_stop, %function
snd_pcm_do_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #168]
	ldr	r2, [r3]
	cmp	r2, r0
	beq	.L262
.L260:
	mov	r0, #0
	bx	lr
.L262:
	ldr	r3, [r3, #160]
	ldr	r3, [r3]
	cmp	r3, #3
	bne	.L263
.L255:
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r1, #0
	str	lr, [sp, #4]
	ldr	r3, [r0, #164]
	ldr	r3, [r3, #24]
	blx	r3
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, #0
	ldr	pc, [sp], #4
.L263:
	cmp	r3, #5
	bne	.L260
	ldr	r3, [r0, #48]
	cmp	r3, #0
	beq	.L255
	b	.L260
	.fnend
	.size	snd_pcm_do_stop, .-snd_pcm_do_stop
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_undo_pause, %function
snd_pcm_undo_pause:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #168]
	ldr	r2, [r2]
	cmp	r2, r0
	beq	.L268
	bx	lr
.L268:
	ldr	r3, [r2, #164]
	cmp	r1, #0
	movne	r1, #4
	moveq	r1, #3
	ldr	r3, [r3, #24]
	bx	r3
	.fnend
	.size	snd_pcm_undo_pause, .-snd_pcm_undo_pause
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_do_suspend, %function
snd_pcm_do_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #168]
	ldr	r2, [r3]
	cmp	r2, r0
	beq	.L278
.L276:
	mov	r0, #0
	bx	lr
.L278:
	ldr	r3, [r3, #160]
	ldr	r3, [r3]
	cmp	r3, #3
	bne	.L279
.L271:
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r1, #5
	str	lr, [sp, #4]
	ldr	r3, [r0, #164]
	ldr	r3, [r3, #24]
	blx	r3
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, #0
	ldr	pc, [sp], #4
.L279:
	cmp	r3, #5
	bne	.L276
	ldr	r3, [r0, #48]
	cmp	r3, #0
	beq	.L271
	b	.L276
	.fnend
	.size	snd_pcm_do_suspend, .-snd_pcm_do_suspend
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_do_resume, %function
snd_pcm_do_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #168]
	ldr	r2, [r3]
	cmp	r2, r0
	beq	.L289
.L280:
	mov	r0, #0
	bx	lr
.L289:
	ldr	r3, [r3, #160]
	ldr	r3, [r3, #20]
	cmp	r3, #3
	bne	.L290
.L282:
	ldr	r3, [r0, #164]
	mov	r1, #6
	ldr	r3, [r3, #24]
	bx	r3
.L290:
	cmp	r3, #5
	bne	.L280
	ldr	r3, [r0, #48]
	cmp	r3, #0
	beq	.L282
	b	.L280
	.fnend
	.size	snd_pcm_do_resume, .-snd_pcm_do_resume
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_do_pause, %function
snd_pcm_do_pause:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #168]
	ldr	ip, [r2]
	cmp	ip, r0
	beq	.L300
	mov	r0, #0
	bx	lr
.L300:
	cmp	r1, #0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r4, r0
	str	lr, [sp, #4]
	movweq	r3, #:lower16:jiffies
	moveq	r1, #4
	bne	.L301
.L299:
	movt	r3, #:upper16:jiffies
	mov	r0, r4
	ldr	r3, [r3]
	sub	r3, r3, #249856
	sub	r3, r3, #144
	str	r3, [r2, #28]
	ldr	r3, [r4, #164]
	ldr	r4, [sp]
	ldr	lr, [sp, #4]
	add	sp, sp, #8
	ldr	r3, [r3, #24]
	bx	r3
.L301:
	bl	snd_pcm_update_hw_ptr
	movw	r3, #:lower16:jiffies
	mov	r1, #3
	ldr	r2, [r4, #168]
	b	.L299
	.fnend
	.size	snd_pcm_do_pause, .-snd_pcm_do_pause
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_undo_resume, %function
snd_pcm_undo_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #168]
	ldr	r2, [r3]
	cmp	r2, r0
	beq	.L308
.L302:
	bx	lr
.L308:
	ldr	r3, [r3, #160]
	ldr	r3, [r3]
	cmp	r3, #3
	bne	.L309
.L304:
	ldr	r3, [r0, #164]
	mov	r1, #5
	ldr	r3, [r3, #24]
	bx	r3
.L309:
	cmp	r3, #5
	bne	.L302
	ldr	r3, [r0, #48]
	cmp	r3, #0
	beq	.L304
	b	.L302
	.fnend
	.size	snd_pcm_undo_resume, .-snd_pcm_undo_resume
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_post_prepare, %function
snd_pcm_post_prepare:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r0
	movw	r0, #:lower16:.LANCHOR0
	str	r6, [sp, #8]
	add	r5, r4, #192
	movt	r0, #:upper16:.LANCHOR0
	str	lr, [sp, #12]
	ldr	r3, [r4, #168]
	ldrd	r2, [r3, #160]
	ldr	r2, [r2, #8]
	str	r2, [r3]
	bl	_raw_read_lock_irq
	mov	r0, r5
	bl	_raw_spin_lock
	ldr	r3, [r4, #168]
	mov	r0, r5
	ldr	r3, [r3, #160]
	ldr	r2, [r3]
	cmp	r2, #8
	movne	r2, #2
	strne	r2, [r3]
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	movt	r0, #:upper16:.LANCHOR0
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	_raw_read_unlock_irq
	.fnend
	.size	snd_pcm_post_prepare, .-snd_pcm_post_prepare
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_do_prepare, %function
snd_pcm_do_prepare:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r4, r0
	str	lr, [sp, #4]
	ldr	r3, [r0, #164]
	ldr	r3, [r3, #20]
	blx	r3
	cmp	r0, #0
	blt	.L316
	ldr	r3, [r4, #164]
	mov	r2, #0
	mov	r0, r4
	mov	r1, r2
	ldr	r4, [r4, #168]
	ldr	r3, [r3, #8]
	blx	r3
	cmp	r0, #0
	blt	.L316
	mov	r2, #0
	ldr	lr, [r4, #60]
	ldr	ip, [r4, #160]
	mov	r0, r2
	str	r2, [r4, #20]
	ldr	r3, [ip, #8]
	udiv	r1, r3, lr
	mls	r1, lr, r1, r3
	sub	r3, r3, r1
	str	r3, [r4, #24]
	ldr	r3, [ip, #8]
	str	r3, [r4, #136]
	str	r2, [r4, #140]
.L316:
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
	.fnend
	.size	snd_pcm_do_prepare, .-snd_pcm_do_prepare
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pcm_release_private, %function
pcm_release_private:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r0, .L325
	str	r6, [sp, #8]
	add	r5, r4, #192
	str	lr, [sp, #12]
	bl	down_write
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_write_lock_irq
	ldr	r3, [r4, #208]
	cmp	r3, r5
	beq	.L320
	ldrd	r2, [r4, #184]
	mov	r0, #256
	mov	r1, #512
	add	r6, r4, #184
	str	r3, [r2, #4]
	str	r2, [r3]
	ldr	r2, [r4, #208]
	strd	r0, [r4, #184]
	ldr	r3, [r2, #12]
	sub	r3, r3, #1
	str	r3, [r2, #12]
	ldr	r0, [r4, #208]
	ldr	r3, [r0, #12]
	cmp	r3, #1
	beq	.L324
.L321:
	add	r3, r4, #196
	str	r3, [r4, #184]
	str	r3, [r4, #188]
	str	r6, [r4, #196]
	str	r6, [r4, #200]
	str	r5, [r4, #208]
.L320:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_write_unlock_irq
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	ldr	r0, .L325
	b	up_write
.L324:
	mov	r2, r0
	ldr	r3, [r2, #4]!
	cmp	r3, r2
	beq	.L322
	add	r2, r3, #12
	add	r1, r3, #8
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r3, [r3, #12]
	str	r3, [r3, #16]
	str	r1, [r3, #24]
	ldr	r0, [r4, #208]
.L322:
	bl	kfree
	b	.L321
.L326:
	.align	2
.L325:
	.word	.LANCHOR1+52
	.fnend
	.size	pcm_release_private, .-pcm_release_private
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_sync_ptr, %function
snd_pcm_sync_ptr:
	.fnstart
	@ args = 0, pretend = 0, frame = 144
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r1
	mov	r1, #132
	strd	r6, [sp, #8]
	movw	r6, #:lower16:__stack_chk_guard
	mov	r7, r0
	movt	r6, #:upper16:__stack_chk_guard
	strd	r8, [sp, #16]
	ldr	r3, [r6]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	.pad #148
	sub	sp, sp, #148
	ldr	r4, [r7, #168]
	add	r0, sp, #8
	str	r3, [sp, #140]
	bl	__memzero
	mov	r3, #57344
	mov	r2, sp
	movt	r3, 65535
	mov	r0, r5
	and	r2, r2, r3
	ldr	r1, [r2, #8]
	sub	r1, r1, #1
	.syntax divided
@ 2523 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__get_user_4
@ 0 "" 2
	.arm
	.syntax unified
	subs	r8, r0, #0
	str	r2, [sp, #8]
	bne	.L368
	mov	r2, sp
	add	r1, r5, #68
	and	r3, r3, r2
	ldr	r3, [r3, #8]
	.syntax divided
@ 439 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r2, r1, #8; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	bne	.L330
	mov	r2, #8
	add	r0, sp, #76
	bl	__copy_from_user
	cmp	r0, #0
	bne	.L368
	ldr	r3, [sp, #8]
	add	r10, r7, #192
	ldr	r9, [r4, #160]
	ldr	fp, [r4, #164]
	tst	r3, #1
	beq	.L333
	ldr	r3, [r7, #168]
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	str	r3, [sp, #4]
	bl	_raw_read_lock_irq
	mov	r0, r10
	bl	_raw_spin_lock
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #160]
	ldr	r3, [r3]
	sub	r3, r3, #2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L334
.L336:
	.word	.L335
	.word	.L337
	.word	.L338
	.word	.L339
	.word	.L334
	.word	.L335
.L335:
	mov	r0, r10
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
.L333:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r10
	bl	_raw_spin_lock
	ldr	r3, [sp, #8]
	tst	r3, #2
	beq	.L369
	ldr	r2, [fp]
	str	r2, [sp, #76]
.L343:
	tst	r3, #4
	ldreq	r3, [sp, #80]
	ldrne	r3, [fp, #4]
	streq	r3, [fp, #4]
	ldr	r1, [r4, #104]
	strne	r3, [sp, #80]
	tst	r1, #1
	beq	.L346
	ldr	r2, [r4, #68]
	ldr	r3, [r4, #160]
	ldr	r0, [r4, #164]
	ldr	ip, [r4, #132]
	ldr	r3, [r3, #8]
	ldr	r0, [r0]
	add	r3, r2, r3
	subs	r3, r3, r0
	addmi	r3, r3, ip
	bmi	.L348
	cmp	r3, ip
	subcs	r3, r3, ip
.L348:
	ldr	r0, [r4, #116]
	sub	r3, r2, r3
	cmp	r0, r3
	bls	.L370
.L346:
	ldr	ip, [r9]
	mov	r2, #8
	add	r1, r9, #12
	ldr	r3, [r9, #8]
	add	r0, sp, #24
	str	ip, [sp, #12]
	str	r3, [sp, #20]
	bl	memcpy
	ldr	r3, [r9, #20]
	mov	r0, r10
	str	r3, [sp, #32]
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
	.syntax divided
@ 448 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r2, r5, #132; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	bne	.L368
	add	r1, sp, #8
	mov	r0, r5
	mov	r2, #132
	bl	__copy_to_user
	cmp	r0, #0
	bne	.L368
.L327:
	ldr	r2, [sp, #140]
	mov	r0, r8
	ldr	r3, [r6]
	cmp	r2, r3
	bne	.L371
	add	sp, sp, #148
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L369:
	ldr	r3, [sp, #76]
	str	r3, [fp]
	ldr	r3, [sp, #8]
	b	.L343
.L370:
	tst	r1, #2
	beq	.L346
	ldr	r3, [r7, #164]
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L346
	mov	r0, r7
	blx	r3
	b	.L346
.L339:
	ldr	r3, [r7, #48]
	cmp	r3, #1
	beq	.L334
.L337:
	mov	r0, r7
	bl	snd_pcm_update_hw_ptr
	subs	r3, r0, #0
	bge	.L335
	mov	r0, r10
	mov	r8, r3
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	b	.L327
.L338:
	mov	r0, r10
	mvn	r8, #31
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	b	.L327
.L334:
	mov	r0, r10
	mvn	r8, #76
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	b	.L327
.L330:
	mov	r1, #8
	add	r0, sp, #76
	bl	__memzero
.L368:
	mvn	r8, #13
	b	.L327
.L371:
	bl	__stack_chk_fail
	.fnend
	.size	snd_pcm_sync_ptr, .-snd_pcm_sync_ptr
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_mmap, %function
snd_pcm_mmap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	str	lr, [sp, #8]
	ldr	r2, [r1, #72]
	.pad #12
	sub	sp, sp, #12
	ldr	r3, [r0, #124]
	lsl	r2, r2, #12
	ldr	r4, [r3]
	cmp	r2, #-2147483648
	beq	.L387
	cmp	r2, #-2130706432
	beq	.L387
	ldr	r3, [r4, #48]
	ldr	lr, [r1, #24]
	cmp	r3, #0
	beq	.L402
	tst	lr, #1
	beq	.L390
.L376:
	ldr	r3, [r4, #168]
	ldr	r0, [r3, #160]
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L386
	ldr	r0, [r3, #88]
	tst	r0, #1
	beq	.L387
	ldr	r0, [r3, #40]
	sub	r0, r0, #3
	cmp	r0, #1
	bls	.L390
	ldr	r3, [r3, #548]
	ldmib	r1, {r0, ip}
	add	r3, r3, #4080
	add	r3, r3, #15
	sub	ip, ip, r0
	bic	r3, r3, #4080
	bic	r3, r3, #15
	cmp	ip, r3
	bhi	.L390
	sub	r3, r3, ip
	cmp	r2, r3
	bhi	.L390
	movw	r3, #:lower16:.LANCHOR2
	str	r4, [r1, #80]
	movt	r3, #:upper16:.LANCHOR2
	str	r3, [r1, #68]
	ldr	r3, [r4, #164]
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L377
	mov	r0, r4
	blx	r3
.L378:
	cmp	r0, #0
	bne	.L372
.L382:
	add	r3, r4, #220
	.syntax divided
@ 45 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	mov	r0, #0
.L372:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L402:
	tst	lr, #3
	bne	.L376
.L390:
	mvn	r0, #21
	b	.L372
.L387:
	mvn	r0, #5
	b	.L372
.L377:
	orr	lr, lr, #524288
	str	lr, [r1, #24]
	ldr	r3, [r4, #164]
	ldr	r3, [r3, #40]
	cmp	r3, #0
	beq	.L403
.L379:
	ldr	r3, .L404
	str	r3, [r1, #68]
	b	.L382
.L386:
	mvn	r0, #76
	b	.L372
.L403:
	ldr	r3, [r4, #132]
	cmp	r3, #2
	bne	.L379
	ldr	r0, [r4, #136]
	ldr	r3, [r4, #168]
	cmp	r0, #0
	ldr	r2, [r3, #540]
	ldr	r3, [r3, #544]
	beq	.L380
	ldr	lr, [r0, #284]
	cmp	lr, #0
	beq	.L380
.L381:
	mov	r5, #0
	str	ip, [sp]
	str	r5, [sp, #4]
	ldr	r5, [lr, #8]
	blx	r5
	b	.L378
.L380:
	movw	lr, #:lower16:arm_dma_ops
	movt	lr, #:upper16:arm_dma_ops
	cmp	lr, #0
	bne	.L381
	.syntax divided
@ 236 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/dma-mapping.h" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/dma-mapping.h"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 236, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L405:
	.align	2
.L404:
	.word	.LANCHOR2+20
	.fnend
	.size	snd_pcm_mmap, .-snd_pcm_mmap
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_action, %function
snd_pcm_action:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	add	r4, r1, #192
	strd	r6, [sp, #8]
	mov	r7, r0
	mov	r6, r1
	strd	r8, [sp, #16]
	mov	r9, r2
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r0, [r1, #208]
	cmp	r0, r4
	beq	.L407
	bl	_raw_spin_trylock
	cmp	r0, #0
	beq	.L435
.L408:
	ldr	r2, [r6, #208]
	mov	r3, r2
	ldr	r5, [r3, #4]!
	cmp	r5, r3
	sub	r5, r5, #184
	bne	.L412
	b	.L424
.L410:
	mov	r1, r9
	mov	r0, r5
	ldr	r3, [r7]
	blx	r3
	subs	r8, r0, #0
	ldr	r2, [r6, #208]
	blt	.L411
	ldr	r3, [r5, #184]
	add	r1, r2, #4
	cmp	r3, r1
	sub	r5, r3, #184
	beq	.L436
.L412:
	cmp	r6, r5
	beq	.L410
	add	r0, r5, #192
	bl	_raw_spin_lock
	b	.L410
.L435:
	mov	r0, r4
	bl	_raw_spin_unlock
	ldr	r0, [r6, #208]
	bl	_raw_spin_lock
	mov	r0, r4
	bl	_raw_spin_lock
	b	.L408
.L411:
	mov	r3, r2
	ldr	r1, [r3, #4]!
	sub	r4, r1, #184
.L414:
	cmp	r3, r1
	bne	.L421
	b	.L418
.L437:
	ldr	r4, [r4, #184]
	add	r3, r2, #4
	cmp	r4, r3
	sub	r4, r4, #184
	beq	.L418
.L421:
	cmp	r6, r4
	add	r0, r4, #192
	beq	.L420
	bl	_raw_spin_unlock
	ldr	r2, [r6, #208]
.L420:
	cmp	r5, r4
	bne	.L437
.L418:
	mov	r0, r2
	bl	_raw_spin_unlock
.L406:
	mov	r0, r8
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L436:
	ldr	r10, [r2, #4]
	cmp	r3, r10
	sub	r10, r10, #184
	bne	.L417
	b	.L418
.L413:
	ldr	r3, [r10, #184]
	add	r1, r2, #4
	cmp	r3, r1
	sub	r10, r3, #184
	beq	.L438
.L417:
	mov	r1, r9
	mov	r0, r10
	ldr	r3, [r7, #4]
	blx	r3
	subs	r8, r0, #0
	ldr	r2, [r6, #208]
	bge	.L413
	ldr	r5, [r7, #8]
	add	r3, r2, #4
	ldr	r1, [r2, #4]
	cmp	r5, #0
	sub	r4, r1, #184
	beq	.L414
	cmp	r3, r1
	cmpne	r10, r4
	moveq	r5, #0
	bne	.L416
	b	.L414
.L415:
	ldr	r5, [r7, #8]
.L416:
	mov	r1, r9
	mov	r0, r4
	blx	r5
	ldr	r1, [r4, #184]
	ldr	r2, [r6, #208]
	sub	r4, r1, #184
	add	r3, r2, #4
	cmp	r4, r10
	cmpne	r3, r1
	bne	.L415
	ldr	r1, [r2, #4]
	mov	r5, #0
	sub	r4, r1, #184
	b	.L414
.L407:
	mov	r1, r2
	mov	r0, r6
	ldr	r3, [r7]
	blx	r3
	subs	r8, r0, #0
	blt	.L406
	mov	r1, r9
	mov	r0, r6
	ldr	r3, [r7, #4]
	blx	r3
	subs	r8, r0, #0
	bne	.L423
	mov	r1, r9
	mov	r0, r6
	ldr	r3, [r7, #12]
	blx	r3
	b	.L406
.L438:
	ldr	r5, [r2, #4]
	cmp	r3, r5
	sub	r5, r5, #184
	beq	.L418
.L419:
	mov	r1, r9
	mov	r0, r5
	ldr	r3, [r7, #12]
	blx	r3
	ldr	r5, [r5, #184]
	ldr	r2, [r6, #208]
	mov	r3, r5
	sub	r5, r5, #184
	add	r1, r2, #4
	cmp	r3, r1
	bne	.L419
	ldr	r1, [r2, #4]
	sub	r4, r1, #184
	b	.L414
.L424:
	mov	r8, #0
	b	.L418
.L423:
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L406
	mov	r1, r9
	mov	r0, r6
	blx	r3
	b	.L406
	.fnend
	.size	snd_pcm_action, .-snd_pcm_action
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_release_substream.part.8, %function
snd_pcm_release_substream.part.8:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r6, [r0, #168]
	ldr	r3, [r6, #160]
	ldr	r5, [r3]
	sub	r3, r5, #7
	cmp	r5, #0
	cmpne	r3, #1
	movls	r5, #1
	movhi	r5, #0
	bls	.L440
	movw	r0, #:lower16:.LANCHOR0
	add	r7, r4, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r7
	bl	_raw_spin_lock
	ldr	r3, [r6, #160]
	ldr	r3, [r3]
	cmp	r3, #6
	beq	.L459
.L441:
	mov	r2, #1
	mov	r1, r4
	ldr	r0, .L461
	bl	snd_pcm_action
	mov	r0, r7
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
.L440:
	ldrb	r3, [r4, #264]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L442
	ldr	r3, [r4, #164]
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L443
	mov	r0, r4
	blx	r2
	ldr	r3, [r4, #164]
.L443:
	ldr	r3, [r3, #4]
	mov	r0, r4
	blx	r3
	ldrb	r3, [r4, #264]	@ zero_extendqisi2
	bfc	r3, #0, #1
	strb	r3, [r4, #264]
.L442:
	add	r5, r4, #52
	mov	r0, r5
	bl	pm_qos_request_active
	cmp	r0, #0
	bne	.L460
.L444:
	ldr	r3, [r4, #228]
	cmp	r3, #0
	beq	.L445
	mov	r0, r4
	blx	r3
	mov	r3, #0
	str	r3, [r4, #228]
.L445:
	mov	r0, r4
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	snd_pcm_detach_substream
.L460:
	mov	r0, r5
	bl	pm_qos_remove_request
	b	.L444
.L459:
	mov	r2, r5
	mov	r1, r4
	ldr	r0, .L461+4
	bl	snd_pcm_action
	b	.L441
.L462:
	.align	2
.L461:
	.word	.LANCHOR1+84
	.word	.LANCHOR1+68
	.fnend
	.size	snd_pcm_release_substream.part.8, .-snd_pcm_release_substream.part.8
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_release, %function
snd_pcm_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	strd	r6, [sp, #8]
	mov	r6, r1
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r8, [r1, #124]
	ldr	r4, [r8]
	ldr	r5, [r4]
	add	r7, r5, #240
	mov	r0, r7
	bl	mutex_lock
	ldr	r3, [r4, #216]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #216]
	ble	.L466
.L464:
	mov	r0, r8
	bl	kfree
	mov	r0, r7
	bl	mutex_unlock
	add	r0, r5, #264
	mov	r3, #0
	mov	r2, #1
	mov	r1, #3
	bl	__wake_up
	mov	r1, r6
	ldr	r0, [r5]
	bl	snd_card_file_remove
	ldrd	r4, [sp]
	mov	r0, #0
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L466:
	mov	r0, r4
	bl	snd_pcm_release_substream.part.8
	b	.L464
	.fnend
	.size	snd_pcm_release, .-snd_pcm_release
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_action_nonatomic, %function
snd_pcm_action_nonatomic:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r1
	strd	r6, [sp, #8]
	mov	r6, r0
	ldr	r0, .L493
	mov	r7, r2
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	bl	down_read
	ldr	r3, [r5, #208]
	add	r2, r5, #192
	cmp	r3, r2
	beq	.L468
	ldr	r4, [r3, #4]!
	cmp	r4, r3
	sub	r4, r4, #184
	bne	.L471
	b	.L477
.L490:
	ldr	r2, [r5, #208]
	ldr	r3, [r4, #184]
	add	r1, r2, #4
	cmp	r3, r1
	sub	r4, r3, #184
	beq	.L489
.L471:
	mov	r1, r7
	mov	r0, r4
	ldr	r3, [r6]
	blx	r3
	subs	r8, r0, #0
	bge	.L490
.L470:
	ldr	r0, .L493
	bl	up_read
	ldrd	r4, [sp]
	mov	r0, r8
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L468:
	mov	r1, r7
	mov	r0, r5
	ldr	r3, [r6]
	blx	r3
	subs	r8, r0, #0
	blt	.L470
	mov	r1, r7
	mov	r0, r5
	ldr	r3, [r6, #4]
	blx	r3
	subs	r8, r0, #0
	bne	.L476
	mov	r1, r7
	mov	r0, r5
	ldr	r3, [r6, #12]
	blx	r3
	b	.L470
.L489:
	ldr	r4, [r2, #4]
	cmp	r3, r4
	sub	r4, r4, #184
	bne	.L474
	b	.L470
.L472:
	ldr	r2, [r5, #208]
	ldr	r3, [r4, #184]
	add	r1, r2, #4
	cmp	r3, r1
	sub	r4, r3, #184
	beq	.L491
.L474:
	mov	r1, r7
	mov	r0, r4
	ldr	r3, [r6, #4]
	blx	r3
	subs	r8, r0, #0
	bge	.L472
	ldr	r3, [r6, #8]
	cmp	r3, #0
	beq	.L470
	ldr	r2, [r5, #208]
	ldr	r1, [r2, #4]!
	sub	r9, r1, #184
	cmp	r1, r2
	cmpne	r9, r4
	bne	.L473
	b	.L470
.L492:
	ldr	r3, [r6, #8]
.L473:
	mov	r0, r9
	mov	r1, r7
	blx	r3
	ldr	r2, [r9, #184]
	ldr	r3, [r5, #208]
	sub	r9, r2, #184
	add	r3, r3, #4
	cmp	r9, r4
	cmpne	r3, r2
	bne	.L492
	b	.L470
.L491:
	ldr	r4, [r2, #4]
	cmp	r3, r4
	sub	r4, r4, #184
	beq	.L470
.L475:
	mov	r0, r4
	ldr	r3, [r6, #12]
	mov	r1, r7
	blx	r3
	ldr	r3, [r5, #208]
	ldr	r4, [r4, #184]
	add	r3, r3, #4
	cmp	r4, r3
	sub	r4, r4, #184
	bne	.L475
	b	.L470
.L476:
	ldr	r3, [r6, #8]
	cmp	r3, #0
	beq	.L470
	mov	r1, r7
	mov	r0, r5
	blx	r3
	b	.L470
.L477:
	mov	r8, #0
	b	.L470
.L494:
	.align	2
.L493:
	.word	.LANCHOR1+52
	.fnend
	.size	snd_pcm_action_nonatomic, .-snd_pcm_action_nonatomic
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_action_lock_irq, %function
snd_pcm_action_lock_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r1
	add	r5, r1, #192
	strd	r6, [sp, #8]
	mov	r6, r0
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	str	r8, [sp, #16]
	mov	r7, r2
	str	lr, [sp, #20]
	bl	_raw_read_lock_irq
	ldr	r0, [r4, #208]
	cmp	r0, r5
	beq	.L496
	bl	_raw_spin_lock
	mov	r0, r5
	bl	_raw_spin_lock
	mov	r2, r7
	mov	r3, #1
	mov	r1, r4
	mov	r0, r6
	bl	snd_pcm_action_group
	mov	r8, r0
	mov	r0, r5
	bl	_raw_spin_unlock
	ldr	r0, [r4, #208]
	bl	_raw_spin_unlock
.L497:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	ldrd	r4, [sp]
	mov	r0, r8
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L496:
	mov	r0, r5
	bl	_raw_spin_lock
	mov	r1, r7
	mov	r0, r4
	ldr	r3, [r6]
	blx	r3
	subs	r8, r0, #0
	blt	.L498
	mov	r1, r7
	mov	r0, r4
	ldr	r3, [r6, #4]
	blx	r3
	subs	r8, r0, #0
	bne	.L499
	mov	r1, r7
	mov	r0, r4
	ldr	r3, [r6, #12]
	blx	r3
.L498:
	mov	r0, r5
	bl	_raw_spin_unlock
	b	.L497
.L499:
	ldr	r3, [r6, #8]
	cmp	r3, #0
	beq	.L498
	mov	r1, r7
	mov	r0, r4
	blx	r3
	b	.L498
	.fnend
	.size	snd_pcm_action_lock_irq, .-snd_pcm_action_lock_irq
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_status_user, %function
snd_pcm_status_user:
	.fnstart
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movw	r5, #:lower16:__stack_chk_guard
	movt	r5, #:upper16:__stack_chk_guard
	strd	r6, [sp, #8]
	mov	r6, r0
	ldr	r3, [r5]
	str	r8, [sp, #16]
	mov	r7, r1
	str	lr, [sp, #20]
	.pad #112
	sub	sp, sp, #112
	mov	r1, #108
	mov	r0, sp
	add	r8, r6, #192
	str	r3, [sp, #108]
	bl	__memzero
	ldr	r4, [r6, #168]
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r8
	bl	_raw_spin_lock
	ldr	r2, [r4, #160]
	ldr	r3, [r2]
	ldr	r2, [r2, #20]
	cmp	r3, #0
	str	r3, [sp]
	str	r2, [sp, #44]
	beq	.L505
	ldr	r1, [r6, #168]
	ldrd	r2, [r4, #4]
	ldr	r1, [r1, #160]
	strd	r2, [sp, #4]
	ldr	r3, [r1]
	cmp	r3, #3
	beq	.L506
	cmp	r3, #5
	beq	.L527
.L507:
	ldr	r3, [r4, #536]
	add	r0, sp, #12
	cmp	r3, #1
	beq	.L528
	bl	getnstimeofday
	ldr	r1, [r4, #160]
.L508:
	ldr	r3, [r4, #164]
	ldr	r0, [r6, #48]
	ldr	r2, [r3]
	cmp	r0, #0
	str	r2, [sp, #20]
	ldr	r2, [r1, #8]
	str	r2, [sp, #24]
	bne	.L510
	ldr	r3, [r3]
	ldr	r2, [r4, #68]
	ldr	r0, [r1, #8]
	ldr	ip, [r4, #132]
	sub	r3, r2, r3
	adds	r3, r3, r0
	addmi	r3, r3, ip
	bmi	.L512
	cmp	r3, ip
	subcs	r3, r3, ip
.L512:
	str	r3, [sp, #32]
	ldr	r1, [r1]
	sub	r1, r1, #3
	bics	r1, r1, #2
	beq	.L529
.L513:
	mov	r3, #0
	str	r3, [sp, #28]
.L514:
	ldr	r2, [r4, #16]
	mov	r3, #0
	str	r2, [sp, #36]
	ldr	r2, [r4, #12]
	str	r2, [sp, #40]
	str	r3, [r4, #12]
	str	r3, [r4, #16]
.L505:
	mov	r0, r8
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
	.syntax divided
@ 448 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r2, r7, #108; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	bne	.L518
	mov	r1, sp
	mov	r0, r7
	mov	r2, #108
	bl	__copy_to_user
	cmp	r0, #0
	bne	.L518
.L504:
	ldr	r2, [sp, #108]
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L530
	add	sp, sp, #112
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L510:
	ldr	r2, [r3]
	ldr	r3, [r1, #8]
	subs	r3, r3, r2
	ldrmi	r2, [r4, #132]
	addmi	r3, r3, r2
	str	r3, [sp, #32]
	ldr	r2, [r1]
	cmp	r2, #3
	bne	.L513
	ldr	r2, [r4, #36]
	add	r3, r2, r3
	str	r3, [sp, #28]
	b	.L514
.L529:
	ldr	r1, [r4, #36]
	sub	r3, r2, r3
	add	r3, r3, r1
	str	r3, [sp, #28]
	b	.L514
.L527:
	ldr	r3, [r6, #48]
	cmp	r3, #0
	bne	.L507
.L506:
	mov	r0, r6
	bl	snd_pcm_update_hw_ptr
	ldr	r3, [r4, #108]
	cmp	r3, #1
	bne	.L507
	ldr	r1, [r4, #160]
	ldrd	r2, [r1, #12]
	strd	r2, [sp, #12]
	b	.L508
.L528:
	bl	ktime_get_ts
	ldr	r1, [r4, #160]
	b	.L508
.L518:
	mvn	r0, #13
	b	.L504
.L530:
	bl	__stack_chk_fail
	.fnend
	.size	snd_pcm_status_user, .-snd_pcm_status_user
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_trigger_tstamp, %function
snd_pcm_trigger_tstamp:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r4, [r0, #168]
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L531
	cmp	r3, r0
	bne	.L533
	ldr	r3, [r4, #536]
	add	r0, r4, #4
	cmp	r3, #1
	beq	.L547
	bl	getnstimeofday
.L535:
	mov	r3, #0
	str	r3, [r4]
.L531:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L533:
	ldr	r5, [r3, #168]
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L536
	cmp	r3, r0
	bne	.L537
	ldr	r3, [r5, #536]
	add	r0, r5, #4
	cmp	r3, #1
	beq	.L548
	bl	getnstimeofday
.L539:
	mov	r3, #0
	str	r3, [r5]
	ldr	r3, [r4]
	ldr	r5, [r3, #168]
.L536:
	ldrd	r2, [r5, #4]
	strd	r2, [r4, #4]
	b	.L535
.L547:
	bl	ktime_get_ts
	b	.L535
.L537:
	bl	snd_pcm_trigger_tstamp
	ldr	r3, [r5]
	ldr	r3, [r3, #168]
	ldrd	r2, [r3, #4]
	strd	r2, [r5, #4]
	b	.L539
.L548:
	bl	ktime_get_ts
	b	.L539
	.fnend
	.size	snd_pcm_trigger_tstamp, .-snd_pcm_trigger_tstamp
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_post_resume, %function
snd_pcm_post_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r4, [r0, #168]
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L550
	cmp	r0, r3
	bne	.L551
	ldr	r3, [r4, #536]
	add	r0, r4, #4
	cmp	r3, #1
	beq	.L590
	bl	getnstimeofday
.L553:
	mov	r3, #0
	str	r3, [r4]
.L550:
	ldr	r0, [r5, #172]
	cmp	r0, #0
	beq	.L570
	add	r2, r4, #4
	mov	r1, #18
	bl	snd_timer_notify
.L570:
	ldr	r3, [r4, #160]
	ldr	r2, [r3, #20]
	str	r2, [r3]
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L551:
	ldr	r6, [r3, #168]
	ldr	r2, [r6]
	cmp	r2, #0
	beq	.L554
	cmp	r3, r2
	bne	.L555
	ldr	r3, [r6, #536]
	add	r0, r6, #4
	cmp	r3, #1
	beq	.L591
	bl	getnstimeofday
.L557:
	mov	r3, #0
	str	r3, [r6]
	ldr	r3, [r4]
	ldr	r6, [r3, #168]
.L554:
	ldrd	r2, [r6, #4]
	strd	r2, [r4, #4]
	b	.L553
.L590:
	bl	ktime_get_ts
	b	.L553
.L555:
	ldr	r7, [r2, #168]
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L558
	cmp	r2, r3
	bne	.L559
	ldr	r3, [r7, #536]
	add	r0, r7, #4
	cmp	r3, #1
	beq	.L592
	bl	getnstimeofday
.L561:
	mov	r3, #0
	str	r3, [r7]
	ldr	r3, [r6]
	ldr	r7, [r3, #168]
.L558:
	ldrd	r2, [r7, #4]
	strd	r2, [r6, #4]
	b	.L557
.L591:
	bl	ktime_get_ts
	b	.L557
.L559:
	ldr	r8, [r3, #168]
	ldr	r2, [r8]
	cmp	r2, #0
	beq	.L562
	cmp	r3, r2
	bne	.L563
	ldr	r3, [r8, #536]
	add	r0, r8, #4
	cmp	r3, #1
	beq	.L593
	bl	getnstimeofday
.L565:
	mov	r3, #0
	str	r3, [r8]
	ldr	r3, [r7]
	ldr	r8, [r3, #168]
.L562:
	ldrd	r2, [r8, #4]
	strd	r2, [r7, #4]
	b	.L561
.L592:
	bl	ktime_get_ts
	b	.L561
.L563:
	ldr	r9, [r2, #168]
	ldr	r0, [r9]
	cmp	r0, #0
	beq	.L566
	cmp	r2, r0
	bne	.L567
	ldr	r3, [r9, #536]
	add	r0, r9, #4
	cmp	r3, #1
	beq	.L594
	bl	getnstimeofday
.L569:
	mov	r3, #0
	str	r3, [r9]
	ldr	r2, [r8]
.L566:
	ldr	r3, [r2, #168]
	ldrd	r2, [r3, #4]
	strd	r2, [r8, #4]
	b	.L565
.L593:
	bl	ktime_get_ts
	b	.L565
.L594:
	bl	ktime_get_ts
	b	.L569
.L567:
	bl	snd_pcm_trigger_tstamp
	ldr	r3, [r9]
	ldr	r3, [r3, #168]
	ldrd	r2, [r3, #4]
	strd	r2, [r9, #4]
	b	.L569
	.fnend
	.size	snd_pcm_post_resume, .-snd_pcm_post_resume
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_post_suspend, %function
snd_pcm_post_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r4, [r0, #168]
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L596
	cmp	r0, r3
	bne	.L597
	ldr	r3, [r4, #536]
	add	r0, r4, #4
	cmp	r3, #1
	beq	.L636
	bl	getnstimeofday
.L599:
	mov	r3, #0
	str	r3, [r4]
.L596:
	ldr	r0, [r5, #172]
	cmp	r0, #0
	beq	.L616
	add	r2, r4, #4
	mov	r1, #17
	bl	snd_timer_notify
.L616:
	ldr	ip, [r4, #160]
	mov	lr, #7
	add	r0, r4, #172
	mov	r3, #0
	mov	r2, #1
	mov	r1, #3
	ldr	r5, [ip]
	str	r5, [ip, #20]
	ldr	ip, [r4, #160]
	str	lr, [ip]
	bl	__wake_up
	ldrd	r6, [sp, #8]
	add	r0, r4, #184
	mov	r3, #0
	ldrd	r4, [sp]
	mov	r2, #1
	mov	r1, #3
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	ldr	lr, [sp, #28]
	add	sp, sp, #32
	b	__wake_up
.L597:
	ldr	r6, [r3, #168]
	ldr	r2, [r6]
	cmp	r2, #0
	beq	.L600
	cmp	r3, r2
	bne	.L601
	ldr	r3, [r6, #536]
	add	r0, r6, #4
	cmp	r3, #1
	beq	.L637
	bl	getnstimeofday
.L603:
	mov	r3, #0
	str	r3, [r6]
	ldr	r3, [r4]
	ldr	r6, [r3, #168]
.L600:
	ldrd	r2, [r6, #4]
	strd	r2, [r4, #4]
	b	.L599
.L636:
	bl	ktime_get_ts
	b	.L599
.L601:
	ldr	r7, [r2, #168]
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L604
	cmp	r2, r3
	bne	.L605
	ldr	r3, [r7, #536]
	add	r0, r7, #4
	cmp	r3, #1
	beq	.L638
	bl	getnstimeofday
.L607:
	mov	r3, #0
	str	r3, [r7]
	ldr	r3, [r6]
	ldr	r7, [r3, #168]
.L604:
	ldrd	r2, [r7, #4]
	strd	r2, [r6, #4]
	b	.L603
.L637:
	bl	ktime_get_ts
	b	.L603
.L605:
	ldr	r8, [r3, #168]
	ldr	r2, [r8]
	cmp	r2, #0
	beq	.L608
	cmp	r3, r2
	bne	.L609
	ldr	r3, [r8, #536]
	add	r0, r8, #4
	cmp	r3, #1
	beq	.L639
	bl	getnstimeofday
.L611:
	mov	r3, #0
	str	r3, [r8]
	ldr	r3, [r7]
	ldr	r8, [r3, #168]
.L608:
	ldrd	r2, [r8, #4]
	strd	r2, [r7, #4]
	b	.L607
.L638:
	bl	ktime_get_ts
	b	.L607
.L609:
	ldr	r9, [r2, #168]
	ldr	r0, [r9]
	cmp	r0, #0
	beq	.L612
	cmp	r2, r0
	bne	.L613
	ldr	r3, [r9, #536]
	add	r0, r9, #4
	cmp	r3, #1
	beq	.L640
	bl	getnstimeofday
.L615:
	mov	r3, #0
	str	r3, [r9]
	ldr	r2, [r8]
.L612:
	ldr	r3, [r2, #168]
	ldrd	r2, [r3, #4]
	strd	r2, [r8, #4]
	b	.L611
.L639:
	bl	ktime_get_ts
	b	.L611
.L640:
	bl	ktime_get_ts
	b	.L615
.L613:
	bl	snd_pcm_trigger_tstamp
	ldr	r3, [r9]
	ldr	r3, [r3, #168]
	ldrd	r2, [r3, #4]
	strd	r2, [r9, #4]
	b	.L615
	.fnend
	.size	snd_pcm_post_suspend, .-snd_pcm_post_suspend
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_post_start, %function
snd_pcm_post_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r0
	strd	r6, [sp, #8]
	mov	r6, r1
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r4, [r0, #168]
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L642
	cmp	r0, r3
	bne	.L643
	ldr	r3, [r4, #536]
	add	r0, r4, #4
	cmp	r3, #1
	beq	.L683
	bl	getnstimeofday
.L645:
	mov	r3, #0
	str	r3, [r4]
.L642:
	mov	r3, #250
	ldr	r1, [r4, #52]
	movw	r2, #:lower16:jiffies
	ldr	ip, [r4, #68]
	movt	r2, #:upper16:jiffies
	ldr	r0, [r2]
	ldr	r2, [r4, #160]
	mul	r3, r3, ip
	str	r0, [r4, #28]
	udiv	r3, r3, r1
	str	r3, [r4, #32]
	str	r6, [r2]
	ldr	r3, [r5, #48]
	cmp	r3, #0
	bne	.L662
	ldr	r3, [r4, #128]
	cmp	r3, #0
	bne	.L684
.L662:
	ldr	r0, [r5, #172]
	cmp	r0, #0
	beq	.L641
	add	r2, r4, #4
	mov	r1, #12
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	ldr	lr, [sp, #28]
	add	sp, sp, #32
	b	snd_timer_notify
.L641:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L643:
	ldr	r7, [r3, #168]
	ldr	r2, [r7]
	cmp	r2, #0
	beq	.L646
	cmp	r3, r2
	bne	.L647
	ldr	r3, [r7, #536]
	add	r0, r7, #4
	cmp	r3, #1
	beq	.L685
	bl	getnstimeofday
.L649:
	mov	r3, #0
	str	r3, [r7]
	ldr	r3, [r4]
	ldr	r7, [r3, #168]
.L646:
	ldrd	r2, [r7, #4]
	strd	r2, [r4, #4]
	b	.L645
.L683:
	bl	ktime_get_ts
	b	.L645
.L684:
	mvn	r1, #0
	mov	r0, r5
	bl	snd_pcm_playback_silence
	b	.L662
.L647:
	ldr	r8, [r2, #168]
	ldr	r3, [r8]
	cmp	r3, #0
	beq	.L650
	cmp	r2, r3
	bne	.L651
	ldr	r3, [r8, #536]
	add	r0, r8, #4
	cmp	r3, #1
	beq	.L686
	bl	getnstimeofday
.L653:
	mov	r3, #0
	str	r3, [r8]
	ldr	r3, [r7]
	ldr	r8, [r3, #168]
.L650:
	ldrd	r2, [r8, #4]
	strd	r2, [r7, #4]
	b	.L649
.L685:
	bl	ktime_get_ts
	b	.L649
.L651:
	ldr	r9, [r3, #168]
	ldr	r2, [r9]
	cmp	r2, #0
	beq	.L654
	cmp	r3, r2
	bne	.L655
	ldr	r3, [r9, #536]
	add	r0, r9, #4
	cmp	r3, #1
	beq	.L687
	bl	getnstimeofday
.L657:
	mov	r3, #0
	str	r3, [r9]
	ldr	r3, [r8]
	ldr	r9, [r3, #168]
.L654:
	ldrd	r2, [r9, #4]
	strd	r2, [r8, #4]
	b	.L653
.L686:
	bl	ktime_get_ts
	b	.L653
.L655:
	ldr	r10, [r2, #168]
	ldr	r0, [r10]
	cmp	r0, #0
	beq	.L658
	cmp	r2, r0
	bne	.L659
	ldr	r3, [r10, #536]
	add	r0, r10, #4
	cmp	r3, #1
	beq	.L688
	bl	getnstimeofday
.L661:
	mov	r3, #0
	str	r3, [r10]
	ldr	r2, [r9]
.L658:
	ldr	r3, [r2, #168]
	ldrd	r2, [r3, #4]
	strd	r2, [r9, #4]
	b	.L657
.L687:
	bl	ktime_get_ts
	b	.L657
.L688:
	bl	ktime_get_ts
	b	.L661
.L659:
	bl	snd_pcm_trigger_tstamp
	ldr	r3, [r10]
	ldr	r3, [r3, #168]
	ldrd	r2, [r3, #4]
	strd	r2, [r10, #4]
	b	.L661
	.fnend
	.size	snd_pcm_post_start, .-snd_pcm_post_start
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_do_drain_init, %function
snd_pcm_do_drain_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r2, [r0, #48]
	ldr	r4, [r0, #168]
	cmp	r2, #0
	ldr	r3, [r4, #160]
	ldr	r2, [r3]
	bne	.L690
	cmp	r2, #2
	beq	.L692
	cmp	r2, #3
	moveq	r2, #5
	streq	r2, [r3]
.L726:
	ldrd	r4, [sp]
	mov	r0, #0
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L690:
	cmp	r2, #3
	bne	.L726
	ldr	r2, [r4, #164]
	ldr	r3, [r3, #8]
	ldr	r2, [r2]
	subs	r3, r3, r2
	ldrmi	r2, [r4, #132]
	addmi	r3, r3, r2
	ldr	r2, [r4]
	cmp	r3, #0
	movne	r6, #5
	moveq	r6, #1
	cmp	r0, r2
	beq	.L734
	cmp	r2, #0
	bne	.L703
.L702:
	ldr	r0, [r5, #172]
	cmp	r0, #0
	beq	.L714
	add	r2, r4, #4
	mov	r1, #13
	bl	snd_timer_notify
.L714:
	ldr	r3, [r4, #160]
	str	r6, [r3]
.L701:
	add	r0, r4, #172
	mov	r3, #0
	mov	r2, #1
	mov	r1, #3
	bl	__wake_up
	add	r0, r4, #184
	mov	r3, #0
	mov	r2, #1
	mov	r1, #3
	bl	__wake_up
	b	.L726
.L692:
	ldr	r2, [r3, #8]
	ldr	r0, [r4, #164]
	ldr	r1, [r4, #68]
	ldr	ip, [r4, #132]
	ldr	r0, [r0]
	add	r2, r1, r2
	subs	r2, r2, r0
	addmi	r2, r2, ip
	bmi	.L695
	cmp	r2, ip
	subcs	r2, r2, ip
.L695:
	cmp	r1, r2
	movls	r2, #1
	strls	r2, [r3]
	bls	.L726
	ldr	r3, [r4]
	cmp	r5, r3
	bne	.L697
	ldr	r3, [r5, #164]
	mov	r1, #1
	mov	r0, r5
	ldr	r3, [r3, #24]
	blx	r3
.L697:
	mov	r0, r5
	mov	r1, #5
	bl	snd_pcm_post_start
	b	.L726
.L734:
	ldr	r3, [r0, #164]
	mov	r1, #0
	ldr	r3, [r3, #24]
	blx	r3
	ldr	r4, [r5, #168]
	ldr	r3, [r4, #160]
	ldr	r3, [r3]
	cmp	r3, r6
	beq	.L701
	ldr	r2, [r4]
	cmp	r2, #0
	beq	.L702
	cmp	r5, r2
	bne	.L703
	ldr	r3, [r4, #536]
	add	r0, r4, #4
	cmp	r3, #1
	beq	.L735
	bl	getnstimeofday
	b	.L705
.L703:
	ldr	r7, [r2, #168]
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L706
	cmp	r2, r3
	bne	.L707
	ldr	r3, [r7, #536]
	add	r0, r7, #4
	cmp	r3, #1
	beq	.L736
	bl	getnstimeofday
.L709:
	mov	r3, #0
	str	r3, [r7]
	ldr	r3, [r4]
	ldr	r7, [r3, #168]
.L706:
	ldrd	r2, [r7, #4]
	strd	r2, [r4, #4]
.L705:
	mov	r3, #0
	str	r3, [r4]
	b	.L702
.L707:
	ldr	r8, [r3, #168]
	ldr	r0, [r8]
	cmp	r0, #0
	beq	.L710
	cmp	r3, r0
	bne	.L711
	ldr	r3, [r8, #536]
	add	r0, r8, #4
	cmp	r3, #1
	beq	.L737
	bl	getnstimeofday
.L713:
	mov	r3, #0
	str	r3, [r8]
	ldr	r3, [r7]
	ldr	r8, [r3, #168]
.L710:
	ldrd	r2, [r8, #4]
	strd	r2, [r7, #4]
	b	.L709
.L736:
	bl	ktime_get_ts
	b	.L709
.L711:
	bl	snd_pcm_trigger_tstamp
	ldr	r3, [r8]
	ldr	r3, [r3, #168]
	ldrd	r2, [r3, #4]
	strd	r2, [r8, #4]
	b	.L713
.L737:
	bl	ktime_get_ts
	b	.L713
.L735:
	bl	ktime_get_ts
	b	.L705
	.fnend
	.size	snd_pcm_do_drain_init, .-snd_pcm_do_drain_init
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_post_pause, %function
snd_pcm_post_pause:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r0
	strd	r6, [sp, #8]
	mov	r6, r1
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r4, [r0, #168]
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L739
	cmp	r0, r3
	bne	.L740
	ldr	r3, [r4, #536]
	add	r0, r4, #4
	cmp	r3, #1
	beq	.L781
	bl	getnstimeofday
.L742:
	mov	r3, #0
	str	r3, [r4]
.L739:
	cmp	r6, #0
	ldr	r3, [r4, #160]
	beq	.L759
	mov	r2, #6
	str	r2, [r3]
	ldr	r0, [r5, #172]
	cmp	r0, #0
	beq	.L760
	add	r2, r4, #4
	mov	r1, #15
	bl	snd_timer_notify
.L760:
	add	r0, r4, #172
	mov	r3, #0
	mov	r2, #1
	mov	r1, #3
	bl	__wake_up
	ldrd	r6, [sp, #8]
	add	r0, r4, #184
	mov	r3, #0
	ldrd	r4, [sp]
	mov	r2, #1
	mov	r1, #3
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	ldr	lr, [sp, #28]
	add	sp, sp, #32
	b	__wake_up
.L759:
	mov	r2, #3
	str	r2, [r3]
	ldr	r0, [r5, #172]
	cmp	r0, #0
	beq	.L738
	add	r2, r4, #4
	mov	r1, #14
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	ldr	lr, [sp, #28]
	add	sp, sp, #32
	b	snd_timer_notify
.L738:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L740:
	ldr	r7, [r3, #168]
	ldr	r2, [r7]
	cmp	r2, #0
	beq	.L743
	cmp	r3, r2
	bne	.L744
	ldr	r3, [r7, #536]
	add	r0, r7, #4
	cmp	r3, #1
	beq	.L782
	bl	getnstimeofday
.L746:
	mov	r3, #0
	str	r3, [r7]
	ldr	r3, [r4]
	ldr	r7, [r3, #168]
.L743:
	ldrd	r2, [r7, #4]
	strd	r2, [r4, #4]
	b	.L742
.L781:
	bl	ktime_get_ts
	b	.L742
.L744:
	ldr	r8, [r2, #168]
	ldr	r3, [r8]
	cmp	r3, #0
	beq	.L747
	cmp	r2, r3
	bne	.L748
	ldr	r3, [r8, #536]
	add	r0, r8, #4
	cmp	r3, #1
	beq	.L783
	bl	getnstimeofday
.L750:
	mov	r3, #0
	str	r3, [r8]
	ldr	r3, [r7]
	ldr	r8, [r3, #168]
.L747:
	ldrd	r2, [r8, #4]
	strd	r2, [r7, #4]
	b	.L746
.L782:
	bl	ktime_get_ts
	b	.L746
.L748:
	ldr	r9, [r3, #168]
	ldr	r2, [r9]
	cmp	r2, #0
	beq	.L751
	cmp	r3, r2
	bne	.L752
	ldr	r3, [r9, #536]
	add	r0, r9, #4
	cmp	r3, #1
	beq	.L784
	bl	getnstimeofday
.L754:
	mov	r3, #0
	str	r3, [r9]
	ldr	r3, [r8]
	ldr	r9, [r3, #168]
.L751:
	ldrd	r2, [r9, #4]
	strd	r2, [r8, #4]
	b	.L750
.L783:
	bl	ktime_get_ts
	b	.L750
.L752:
	ldr	r10, [r2, #168]
	ldr	r0, [r10]
	cmp	r0, #0
	beq	.L755
	cmp	r2, r0
	bne	.L756
	ldr	r3, [r10, #536]
	add	r0, r10, #4
	cmp	r3, #1
	beq	.L785
	bl	getnstimeofday
.L758:
	mov	r3, #0
	str	r3, [r10]
	ldr	r2, [r9]
.L755:
	ldr	r3, [r2, #168]
	ldrd	r2, [r3, #4]
	strd	r2, [r9, #4]
	b	.L754
.L784:
	bl	ktime_get_ts
	b	.L754
.L785:
	bl	ktime_get_ts
	b	.L758
.L756:
	bl	snd_pcm_trigger_tstamp
	ldr	r3, [r10]
	ldr	r3, [r3, #168]
	ldrd	r2, [r3, #4]
	strd	r2, [r10, #4]
	b	.L758
	.fnend
	.size	snd_pcm_post_pause, .-snd_pcm_post_pause
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_post_stop, %function
snd_pcm_post_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r4, [r0, #168]
	ldr	r3, [r4, #160]
	ldr	r3, [r3]
	cmp	r3, r1
	beq	.L787
	ldr	r3, [r4]
	mov	r5, r0
	mov	r6, r1
	cmp	r3, #0
	beq	.L788
	cmp	r0, r3
	bne	.L789
	ldr	r3, [r4, #536]
	add	r0, r4, #4
	cmp	r3, #1
	beq	.L828
	bl	getnstimeofday
.L791:
	mov	r3, #0
	str	r3, [r4]
.L788:
	ldr	r0, [r5, #172]
	cmp	r0, #0
	beq	.L808
	add	r2, r4, #4
	mov	r1, #13
	bl	snd_timer_notify
.L808:
	ldr	r3, [r4, #160]
	str	r6, [r3]
.L787:
	add	r0, r4, #172
	mov	r3, #0
	mov	r2, #1
	mov	r1, #3
	bl	__wake_up
	ldrd	r6, [sp, #8]
	add	r0, r4, #184
	mov	r3, #0
	ldrd	r4, [sp]
	mov	r2, #1
	mov	r1, #3
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	ldr	lr, [sp, #28]
	add	sp, sp, #32
	b	__wake_up
.L828:
	bl	ktime_get_ts
	b	.L791
.L789:
	ldr	r7, [r3, #168]
	ldr	r2, [r7]
	cmp	r2, #0
	beq	.L792
	cmp	r3, r2
	bne	.L793
	ldr	r3, [r7, #536]
	add	r0, r7, #4
	cmp	r3, #1
	beq	.L829
	bl	getnstimeofday
.L795:
	mov	r3, #0
	str	r3, [r7]
	ldr	r3, [r4]
	ldr	r7, [r3, #168]
.L792:
	ldrd	r2, [r7, #4]
	strd	r2, [r4, #4]
	b	.L791
.L829:
	bl	ktime_get_ts
	b	.L795
.L793:
	ldr	r8, [r2, #168]
	ldr	r3, [r8]
	cmp	r3, #0
	beq	.L796
	cmp	r2, r3
	bne	.L797
	ldr	r3, [r8, #536]
	add	r0, r8, #4
	cmp	r3, #1
	beq	.L830
	bl	getnstimeofday
.L799:
	mov	r3, #0
	str	r3, [r8]
	ldr	r3, [r7]
	ldr	r8, [r3, #168]
.L796:
	ldrd	r2, [r8, #4]
	strd	r2, [r7, #4]
	b	.L795
.L797:
	ldr	r9, [r3, #168]
	ldr	r2, [r9]
	cmp	r2, #0
	beq	.L800
	cmp	r3, r2
	bne	.L801
	ldr	r3, [r9, #536]
	add	r0, r9, #4
	cmp	r3, #1
	beq	.L831
	bl	getnstimeofday
.L803:
	mov	r3, #0
	str	r3, [r9]
	ldr	r3, [r8]
	ldr	r9, [r3, #168]
.L800:
	ldrd	r2, [r9, #4]
	strd	r2, [r8, #4]
	b	.L799
.L830:
	bl	ktime_get_ts
	b	.L799
.L801:
	ldr	r10, [r2, #168]
	ldr	r0, [r10]
	cmp	r0, #0
	beq	.L804
	cmp	r2, r0
	bne	.L805
	ldr	r3, [r10, #536]
	add	r0, r10, #4
	cmp	r3, #1
	beq	.L832
	bl	getnstimeofday
.L807:
	mov	r3, #0
	str	r3, [r10]
	ldr	r2, [r9]
.L804:
	ldr	r3, [r2, #168]
	ldrd	r2, [r3, #4]
	strd	r2, [r9, #4]
	b	.L803
.L831:
	bl	ktime_get_ts
	b	.L803
.L832:
	bl	ktime_get_ts
	b	.L807
.L805:
	bl	snd_pcm_trigger_tstamp
	ldr	r3, [r10]
	ldr	r3, [r3, #168]
	ldrd	r2, [r3, #4]
	strd	r2, [r10, #4]
	b	.L807
	.fnend
	.size	snd_pcm_post_stop, .-snd_pcm_post_stop
	.align	2
	.global	snd_pcm_info
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_info, %function
snd_pcm_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r1
	mov	r5, r0
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r6, [r0]
	ldr	r7, [r0, #4]
	mov	r0, r1
	mov	r1, #288
	bl	__memzero
	mov	r2, #64
	add	r0, r4, #16
	ldr	r3, [r6]
	add	r1, r6, #24
	ldr	r3, [r3]
	str	r3, [r4, #12]
	ldr	r3, [r6, #12]
	str	r3, [r4]
	ldr	r3, [r5, #48]
	str	r3, [r4, #8]
	ldr	r3, [r5, #12]
	str	r3, [r4, #4]
	bl	strlcpy
	add	r1, r6, #88
	mov	r2, #80
	add	r0, r4, #80
	bl	strlcpy
	ldrh	r3, [r6, #20]
	add	r1, r5, #16
	add	r0, r4, #160
	mov	r2, #32
	str	r3, [r4, #192]
	ldrh	r3, [r6, #22]
	str	r3, [r4, #196]
	ldr	r3, [r7, #8]
	str	r3, [r4, #200]
	ldr	r3, [r7, #8]
	ldr	ip, [r7, #12]
	sub	r3, r3, ip
	str	r3, [r4, #204]
	bl	strlcpy
	ldr	r3, [r5, #168]
	cmp	r3, #0
	beq	.L834
	ldrd	r6, [r3, #144]
	mov	r2, r4
	mov	r0, r5
	mov	r1, #1
	strd	r6, [r4, #208]
	ldrd	r6, [r3, #152]
	strd	r6, [r4, #216]
	ldr	r3, [r5, #164]
	ldr	r3, [r3, #8]
	blx	r3
.L834:
	ldrd	r4, [sp]
	mov	r0, #0
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
	.fnend
	.size	snd_pcm_info, .-snd_pcm_info
	.align	2
	.global	snd_pcm_info_user
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_info_user, %function
snd_pcm_info_user:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:kmalloc_caches
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	movt	r3, #:upper16:kmalloc_caches
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	mov	r8, r1
	str	lr, [sp, #20]
	ldr	r0, [r3, #36]
	cmp	r0, #0
	beq	.L845
	mov	r2, #288
	mov	r1, #208
	bl	kmem_cache_alloc_trace
	subs	r4, r0, #0
	beq	.L852
.L840:
	ldrd	r6, [r5]
	mov	r1, #288
	mov	r0, r4
	bl	__memzero
	mov	r2, #64
	add	r0, r4, #16
	ldr	r3, [r6]
	add	r1, r6, #24
	ldr	r3, [r3]
	str	r3, [r4, #12]
	ldr	r3, [r6, #12]
	str	r3, [r4]
	ldr	r3, [r5, #48]
	str	r3, [r4, #8]
	ldr	r3, [r5, #12]
	str	r3, [r4, #4]
	bl	strlcpy
	mov	r2, #80
	add	r1, r6, #88
	add	r0, r4, r2
	bl	strlcpy
	ldrh	r3, [r6, #20]
	mov	r2, #32
	add	r1, r5, #16
	add	r0, r4, #160
	str	r3, [r4, #192]
	ldrh	r3, [r6, #22]
	str	r3, [r4, #196]
	ldr	r3, [r7, #8]
	str	r3, [r4, #200]
	ldr	r3, [r7, #8]
	ldr	ip, [r7, #12]
	sub	r3, r3, ip
	str	r3, [r4, #204]
	bl	strlcpy
	ldr	r3, [r5, #168]
	cmp	r3, #0
	beq	.L842
	ldrd	r6, [r3, #144]
	mov	r0, r5
	mov	r2, r4
	mov	r1, #1
	strd	r6, [r4, #208]
	ldrd	r6, [r3, #152]
	strd	r6, [r4, #216]
	ldr	r3, [r5, #164]
	ldr	r3, [r3, #8]
	blx	r3
.L842:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
	.syntax divided
@ 448 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r2, r8, #288; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	beq	.L853
.L843:
	mvn	r5, #13
.L844:
	mov	r0, r4
	bl	kfree
.L839:
	mov	r0, r5
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L845:
	mov	r4, #16
	b	.L840
.L853:
	mov	r0, r8
	mov	r2, #288
	mov	r1, r4
	bl	__copy_to_user
	subs	r5, r0, #0
	beq	.L844
	b	.L843
.L852:
	mvn	r5, #11
	b	.L839
	.fnend
	.size	snd_pcm_info_user, .-snd_pcm_info_user
	.align	2
	.global	snd_pcm_hw_refine
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_hw_refine, %function
snd_pcm_hw_refine:
	.fnstart
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 1, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r2, #0
	mov	r5, r1
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	.setfp fp, sp, #32
	add	fp, sp, #32
	movw	r10, #:lower16:__stack_chk_guard
	str	lr, [sp, #32]
	.pad #116
	sub	sp, sp, #116
	movt	r10, #:upper16:__stack_chk_guard
	ldr	r7, [r0, #168]
	str	r0, [fp, #-128]
	ldr	r4, [r1, #512]
	ldr	r1, [r10]
	ldr	r3, [r7, #512]
	str	r2, [r5, #520]
	tst	r4, #256
	str	r2, [r5, #536]
	str	r1, [fp, #-40]
	strne	r2, [r5, #524]
	tst	r4, #2048
	lsl	r3, r3, #2
	add	r3, r3, #10
	bic	r3, r3, #7
	sub	sp, sp, r3
	mov	r6, sp
	beq	.L856
	mov	r3, #0
	str	r3, [r5, #528]
	str	r3, [r5, #532]
.L856:
	ldr	ip, [r5, #4]
	cmp	ip, #0
	bne	.L857
	ldr	r3, [r5, #8]
	cmp	r3, #0
	bne	.L857
.L858:
	mvn	r0, #21
.L854:
	ldr	r2, [fp, #-40]
	ldr	r3, [r10]
	cmp	r2, r3
	bne	.L1042
	sub	sp, fp, #32
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L857:
	ands	r1, r4, #1
	beq	.L861
	add	r0, r5, #4
	ldr	lr, [r7, #272]
	ldrd	r8, [r0, #16]
	ldrd	r2, [r0, #8]
	and	ip, ip, lr
	strd	r8, [fp, #-140]
	ldrd	r8, [r0, #24]
	strd	r8, [fp, #-148]
	ldrd	r8, [r5, #4]
	strd	r2, [fp, #-112]
	ldr	r3, [r5, #8]
	str	ip, [r5, #4]
	ldr	r2, [r7, #276]
	strd	r8, [fp, #-120]
	ldrd	r8, [fp, #-140]
	and	r3, r3, r2
	orrs	r2, ip, r3
	strd	r8, [fp, #-104]
	ldrd	r8, [fp, #-148]
	str	r3, [r5, #8]
	strd	r8, [fp, #-96]
	bne	.L1043
.L860:
	ldr	r3, [r5, #516]
	mvn	r0, #21
	orr	r1, r3, r1
	str	r1, [r5, #516]
	b	.L854
.L1043:
	sub	r1, fp, #120
	mov	r2, #8
	bl	memcmp
	cmp	r0, #0
	beq	.L861
	ldr	r3, [r5, #516]
	orr	r3, r3, #1
	str	r3, [r5, #516]
.L861:
	ldr	r1, [r5, #36]
	cmp	r1, #0
	bne	.L862
	ldr	r3, [r5, #40]
	cmp	r3, #0
	beq	.L858
.L862:
	tst	r4, #2
	beq	.L864
	add	r0, r5, #36
	ldrd	r2, [r0, #8]
	ldr	ip, [r7, #304]
	ldrd	r8, [r0, #16]
	strd	r2, [fp, #-140]
	ldrd	r2, [r0, #24]
	and	r1, r1, ip
	strd	r2, [fp, #-148]
	ldrd	r2, [r5, #36]
	str	r1, [r5, #36]
	strd	r2, [fp, #-120]
	ldrd	r2, [fp, #-140]
	strd	r8, [fp, #-104]
	ldrd	r8, [fp, #-148]
	strd	r2, [fp, #-112]
	ldr	r2, [r7, #308]
	ldr	r3, [r5, #40]
	strd	r8, [fp, #-96]
	and	r3, r3, r2
	orrs	r2, r3, r1
	str	r3, [r5, #40]
	moveq	r1, #2
	beq	.L860
	sub	r1, fp, #120
	mov	r2, #8
	bl	memcmp
	cmp	r0, #0
	bne	.L1044
.L864:
	ldr	r1, [r5, #68]
	cmp	r1, #0
	bne	.L865
	ldr	r3, [r5, #72]
	cmp	r3, #0
	beq	.L858
.L865:
	tst	r4, #4
	beq	.L868
	add	r0, r5, #68
	ldrd	r2, [r0, #8]
	ldr	ip, [r7, #336]
	ldrd	r8, [r0, #16]
	strd	r2, [fp, #-140]
	ldrd	r2, [r0, #24]
	and	r1, r1, ip
	strd	r2, [fp, #-148]
	ldrd	r2, [r5, #68]
	str	r1, [r5, #68]
	strd	r2, [fp, #-120]
	ldrd	r2, [fp, #-140]
	strd	r8, [fp, #-104]
	ldrd	r8, [fp, #-148]
	strd	r2, [fp, #-112]
	ldr	r2, [r7, #340]
	ldr	r3, [r5, #72]
	strd	r8, [fp, #-96]
	and	r3, r3, r2
	orrs	r2, r3, r1
	str	r3, [r5, #72]
	moveq	r1, #4
	beq	.L860
	sub	r1, fp, #120
	mov	r2, #8
	bl	memcmp
	cmp	r0, #0
	bne	.L1045
.L868:
	ldrb	r3, [r5, #268]	@ zero_extendqisi2
	tst	r3, #8
	bne	.L858
	tst	r4, #256
	bne	.L1046
.L871:
	ldrb	r3, [r5, #280]	@ zero_extendqisi2
	tst	r3, #8
	bne	.L858
	ldr	r3, [r5, #512]
	tst	r3, #512
	bne	.L1047
.L872:
	ldrb	r3, [r5, #292]	@ zero_extendqisi2
	tst	r3, #8
	bne	.L858
	ldr	r3, [r5, #512]
	tst	r3, #1024
	bne	.L1048
.L873:
	ldrb	r3, [r5, #304]	@ zero_extendqisi2
	tst	r3, #8
	bne	.L858
	ldr	r3, [r5, #512]
	tst	r3, #2048
	bne	.L1049
.L874:
	ldrb	r3, [r5, #316]	@ zero_extendqisi2
	tst	r3, #8
	bne	.L858
	ldr	r3, [r5, #512]
	tst	r3, #4096
	bne	.L1050
.L875:
	ldrb	r3, [r5, #328]	@ zero_extendqisi2
	tst	r3, #8
	bne	.L858
	ldr	r3, [r5, #512]
	tst	r3, #8192
	bne	.L1051
.L876:
	ldrb	r3, [r5, #340]	@ zero_extendqisi2
	tst	r3, #8
	bne	.L858
.L1058:
	ldr	r3, [r5, #512]
	tst	r3, #16384
	beq	.L877
	add	r1, r7, #440
	add	r0, r5, #332
	bl	snd_interval_refine
	cmp	r0, #0
	bne	.L1052
.L877:
	ldrb	r3, [r5, #352]	@ zero_extendqisi2
	tst	r3, #8
	bne	.L858
	ldr	r3, [r5, #512]
	tst	r3, #32768
	beq	.L878
	add	r1, r7, #452
	add	r0, r5, #344
	bl	snd_interval_refine
	cmp	r0, #0
	bne	.L1053
.L878:
	ldrb	r3, [r5, #364]	@ zero_extendqisi2
	tst	r3, #8
	bne	.L858
	ldr	r3, [r5, #512]
	tst	r3, #65536
	beq	.L879
	add	r1, r7, #464
	add	r0, r5, #356
	bl	snd_interval_refine
	cmp	r0, #0
	bne	.L1054
.L879:
	ldrb	r3, [r5, #376]	@ zero_extendqisi2
	tst	r3, #8
	bne	.L858
	ldr	r3, [r5, #512]
	tst	r3, #131072
	bne	.L1055
.L880:
	ldrb	r3, [r5, #388]	@ zero_extendqisi2
	tst	r3, #8
	bne	.L858
	ldr	r3, [r5, #512]
	tst	r3, #262144
	bne	.L1056
.L881:
	ldrb	r3, [r5, #400]	@ zero_extendqisi2
	tst	r3, #8
	bne	.L858
	ldr	r3, [r5, #512]
	tst	r3, #524288
	bne	.L882
.L885:
	ldr	r3, [r7, #512]
	cmp	r3, #0
	beq	.L884
	lsl	r2, r3, #2
	mov	r1, #0
	str	r3, [fp, #-140]
	mov	r0, r6
	bl	memset
	ldr	r3, [fp, #-140]
.L884:
	ldr	lr, [r5, #512]
	sub	r1, fp, #124
	mov	r2, #0
	mov	ip, #1
	mov	r8, r6
.L886:
	ands	r0, lr, ip, lsl r2
	add	r2, r2, #1
	movne	r0, #1
	moveq	r0, #0
	cmp	r2, #20
	str	r0, [r1, #4]!
	bne	.L886
	mov	r6, r8
	str	r10, [fp, #-140]
	mov	r9, #2
	mov	r1, r3
	mov	r8, r7
	mov	r10, r6
.L895:
	cmp	r1, #0
	beq	.L887
	mov	r7, #0
	mov	r6, r7
.L894:
	ldr	r4, [r8, #520]
	ldr	r3, [r4, r6, lsl #5]
	add	r4, r4, r6, lsl #5
	cmp	r3, #0
	beq	.L891
	ldr	r2, [r5]
	tst	r3, r2
	beq	.L889
.L891:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	blt	.L889
	sub	r2, fp, #36
	add	r3, r2, r3, lsl #2
	ldr	r2, [r10, r6, lsl #2]
	ldr	r3, [r3, #-84]
	cmp	r3, r2
	bhi	.L890
	ldr	r3, [r4, #16]
	cmp	r3, #0
	blt	.L889
	sub	r0, fp, #36
	add	r3, r0, r3, lsl #2
	ldr	r3, [r3, #-84]
	cmp	r2, r3
	bcc	.L890
	ldr	r3, [r4, #20]
	cmp	r3, #0
	blt	.L889
	add	r3, r0, r3, lsl #2
	ldr	r3, [r3, #-84]
	cmp	r2, r3
	bcc	.L890
	ldr	r3, [r4, #24]
	cmp	r3, #0
	blt	.L889
.L890:
	mov	r1, r4
	mov	r0, r5
	ldr	r3, [r4, #4]
	blx	r3
	cmp	r0, #0
	str	r9, [r10, r6, lsl #2]
	beq	.L892
	ldr	r3, [r4, #8]
	cmp	r3, #0
	blt	.L893
	ldr	r2, [r5, #516]
	mov	r7, #1
	orr	r3, r2, r7, lsl r3
	sub	r2, fp, #36
	str	r3, [r5, #516]
	ldr	r3, [r4, #8]
	add	r3, r2, r3, lsl #2
	str	r9, [r3, #-84]
.L893:
	cmp	r0, #0
	blt	.L1040
.L892:
	ldr	r1, [r8, #512]
	add	r9, r9, #1
.L889:
	add	r6, r6, #1
	cmp	r1, r6
	bhi	.L894
	cmp	r7, #0
	bne	.L895
.L887:
	ldr	r3, [r5, #524]
	ldr	r10, [fp, #-140]
	cmp	r3, #0
	bne	.L896
	ldr	r3, [r5, #260]
	ldr	r2, [r5, #264]
	cmp	r3, r2
	beq	.L897
	add	r1, r3, #1
	cmp	r2, r1
	bne	.L896
	ldrb	r2, [r5, #268]	@ zero_extendqisi2
	tst	r2, #2
	beq	.L896
.L897:
	str	r3, [r5, #524]
.L896:
	ldr	r3, [r5, #532]
	cmp	r3, #0
	bne	.L898
	ldr	r3, [r5, #296]
	ldr	r2, [r5, #300]
	cmp	r3, r2
	beq	.L899
	add	r1, r3, #1
	cmp	r2, r1
	bne	.L898
	ldrb	r2, [r5, #304]	@ zero_extendqisi2
	tst	r2, #2
	beq	.L898
.L899:
	mov	r2, #1
	str	r3, [r5, #528]
	str	r2, [r5, #532]
.L898:
	ldr	r3, [r5, #520]
	cmp	r3, #0
	bne	.L900
	ldr	r3, [fp, #-128]
	ldr	r3, [r3, #168]
	ldr	r3, [r3, #208]
	bic	r3, r3, #-2147483648
	str	r3, [r5, #520]
.L900:
	ldr	r3, [r5, #536]
	cmp	r3, #0
	bne	.L911
	ldr	r3, [r5, #36]
	ldr	r1, [r5, #40]
	cmp	r3, #0
	bne	.L902
	cmp	r1, #0
	bne	.L1057
.L904:
	ldrb	r1, [r5, #292]	@ zero_extendqisi2
	ldr	r2, [r5, #284]
	ldr	r3, [r5, #288]
	tst	r1, #2
	subne	r3, r3, #1
	cmp	r3, r2
	bne	.L911
	ldr	r0, [fp, #-128]
	mov	r2, r5
	mov	r1, #4
	ldr	r3, [r0, #164]
	ldr	r3, [r3, #8]
	blx	r3
	cmp	r0, #0
	blt	.L854
.L911:
	mov	r3, #0
	mov	r0, r3
	str	r3, [r5, #512]
	b	.L854
.L1046:
	add	r1, r7, #368
	add	r0, r5, #260
	bl	snd_interval_refine
	cmp	r0, #0
	beq	.L871
	ldr	r3, [r5, #516]
	orr	r3, r3, #256
	str	r3, [r5, #516]
	bge	.L871
	b	.L854
.L1047:
	add	r1, r7, #380
	add	r0, r5, #272
	bl	snd_interval_refine
	cmp	r0, #0
	beq	.L872
	ldr	r3, [r5, #516]
	orr	r3, r3, #512
	str	r3, [r5, #516]
	bge	.L872
	b	.L854
.L1048:
	add	r1, r7, #392
	add	r0, r5, #284
	bl	snd_interval_refine
	cmp	r0, #0
	beq	.L873
	ldr	r3, [r5, #516]
	orr	r3, r3, #1024
	str	r3, [r5, #516]
	bge	.L873
	b	.L854
.L1049:
	add	r1, r7, #404
	add	r0, r5, #296
	bl	snd_interval_refine
	cmp	r0, #0
	beq	.L874
	ldr	r3, [r5, #516]
	orr	r3, r3, #2048
	str	r3, [r5, #516]
	bge	.L874
	b	.L854
.L1050:
	add	r1, r7, #416
	add	r0, r5, #308
	bl	snd_interval_refine
	cmp	r0, #0
	beq	.L875
	ldr	r3, [r5, #516]
	orr	r3, r3, #4096
	str	r3, [r5, #516]
	bge	.L875
	b	.L854
.L1051:
	add	r1, r7, #428
	add	r0, r5, #320
	bl	snd_interval_refine
	cmp	r0, #0
	beq	.L876
	ldr	r3, [r5, #516]
	orr	r3, r3, #8192
	str	r3, [r5, #516]
	blt	.L854
	ldrb	r3, [r5, #340]	@ zero_extendqisi2
	tst	r3, #8
	beq	.L1058
	b	.L858
.L1040:
	ldr	r10, [fp, #-140]
	b	.L854
.L1055:
	add	r1, r7, #476
	add	r0, r5, #368
	bl	snd_interval_refine
	cmp	r0, #0
	beq	.L880
	ldr	r3, [r5, #516]
	orr	r3, r3, #131072
	str	r3, [r5, #516]
	bge	.L880
	b	.L854
.L1056:
	add	r1, r7, #488
	add	r0, r5, #380
	bl	snd_interval_refine
	cmp	r0, #0
	beq	.L881
	ldr	r3, [r5, #516]
	orr	r3, r3, #262144
	str	r3, [r5, #516]
	bge	.L881
	b	.L854
.L882:
	add	r1, r7, #500
	add	r0, r5, #392
	bl	snd_interval_refine
	cmp	r0, #0
	beq	.L885
	ldr	r3, [r5, #516]
	orr	r3, r3, #524288
	str	r3, [r5, #516]
	bge	.L885
	b	.L854
.L1052:
	ldr	r3, [r5, #516]
	orr	r3, r3, #16384
	str	r3, [r5, #516]
	bge	.L877
	b	.L854
.L1053:
	ldr	r3, [r5, #516]
	orr	r3, r3, #32768
	str	r3, [r5, #516]
	bge	.L878
	b	.L854
.L1044:
	ldr	r3, [r5, #516]
	orr	r3, r3, #2
	str	r3, [r5, #516]
	b	.L864
.L1054:
	ldr	r3, [r5, #516]
	orr	r3, r3, #65536
	str	r3, [r5, #516]
	bge	.L879
	b	.L854
.L1045:
	ldr	r3, [r5, #516]
	orr	r3, r3, #4
	str	r3, [r5, #516]
	b	.L868
.L1057:
	rsb	r2, r1, #0
	mov	r3, r1
	and	r2, r2, r1
	mov	r0, #32
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r2, r2
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r2, r2, #63
.L905:
	cmp	r3, #65536
	movcc	ip, #8
	movcc	r1, #0
	bcc	.L906
	lsr	r3, r3, #16
	mov	ip, #24
	mov	r1, #16
.L906:
	cmp	r3, #255
	lsrhi	r3, r3, #8
	movhi	r1, ip
	cmp	r3, #15
	lsrhi	r3, r3, #4
	addhi	r1, r1, #4
	cmp	r3, #3
	lsrhi	r3, r3, #2
	addhi	r1, r1, #2
	cmp	r3, #1
	addne	r1, r1, #1
	add	r1, r1, r0
	cmp	r2, r1
	bne	.L911
	b	.L904
.L1042:
	bl	__stack_chk_fail
.L902:
	cmp	r1, #0
	rsb	r2, r3, #0
	and	r2, r2, r3
	moveq	r0, #0
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r2, r2
@ 0 "" 2
	.arm
	.syntax unified
	movne	r3, r1
	movne	r0, #32
	rsb	r2, r2, #31
	b	.L905
	.fnend
	.size	snd_pcm_hw_refine, .-snd_pcm_hw_refine
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_hw_params, %function
snd_pcm_hw_params:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	movw	r0, #:lower16:.LANCHOR0
	strd	r6, [sp, #8]
	movt	r0, #:upper16:.LANCHOR0
	add	r7, r5, #192
	str	r8, [sp, #16]
	mov	r6, r1
	str	lr, [sp, #20]
	ldr	r4, [r5, #168]
	bl	_raw_read_lock_irq
	mov	r0, r7
	bl	_raw_spin_lock
	ldr	r3, [r4, #160]
	mov	r0, r7
	ldr	r3, [r3]
	cmp	r3, #2
	bhi	.L1109
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	ldr	r3, [r5, #220]
	cmp	r3, #0
	bne	.L1081
	mvn	r3, #0
	mov	r1, r6
	mov	r0, r5
	str	r3, [r6, #512]
	bl	snd_pcm_hw_refine
	subs	r8, r0, #0
	blt	.L1063
	mov	r1, r6
	mov	r0, r5
	bl	snd_pcm_hw_params_choose
	subs	r8, r0, #0
	blt	.L1063
	ldr	r3, [r5, #164]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L1067
	mov	r1, r6
	mov	r0, r5
	blx	r3
	subs	r8, r0, #0
	blt	.L1063
.L1067:
	ldr	r3, [r6, #4]
	cmp	r3, #0
	bne	.L1110
	ldr	r3, [r6, #8]
	cmp	r3, #0
	movne	r1, #32
	bne	.L1065
.L1068:
	str	r3, [r4, #40]
	ldr	r0, [r6, #36]
	cmp	r0, #0
	bne	.L1084
	ldr	r0, [r6, #40]
	cmp	r0, #0
	movne	r2, #32
	bne	.L1069
.L1070:
	str	r0, [r4, #44]
	ldr	r3, [r6, #68]
	cmp	r3, #0
	bne	.L1086
	ldr	r3, [r6, #72]
	cmp	r3, #0
	movne	r1, #32
	bne	.L1071
.L1072:
	str	r3, [r4, #48]
	ldr	r3, [r6, #284]
	ldrb	r2, [r4, #100]	@ zero_extendqisi2
	str	r3, [r4, #56]
	ldr	r3, [r6, #296]
	str	r3, [r4, #52]
	ldr	r3, [r6, #320]
	str	r3, [r4, #60]
	ldr	r3, [r6, #344]
	str	r3, [r4, #64]
	ldr	r3, [r6, #368]
	str	r3, [r4, #68]
	ldr	r3, [r6, #520]
	str	r3, [r4, #88]
	ldr	r3, [r6, #528]
	str	r3, [r4, #92]
	ldr	r3, [r6, #532]
	str	r3, [r4, #96]
	ldr	r3, [r6, #520]
	ands	r3, r3, #8388608
	ldrne	r3, [r6]
	ubfxne	r3, r3, #2, #1
	bfi	r2, r3, #0, #1
	strb	r2, [r4, #100]
	bl	snd_pcm_format_physical_width
	ldr	r3, [r4, #56]
	str	r0, [r4, #84]
	mul	r0, r3, r0
	mov	r3, #1
	tst	r0, #7
	str	r0, [r4, #80]
	beq	.L1074
.L1075:
	lsl	r0, r0, #1
	lsl	r3, r3, #1
	tst	r0, #6
	bne	.L1075
.L1074:
	ldr	ip, [r4, #60]
	lsr	r0, r0, #3
	mov	r1, #0
	ldr	r2, [r4, #164]
	str	r3, [r4, #72]
	mov	r3, #1
	str	r0, [r4, #76]
	mvn	r0, #-2147483648
	str	r1, [r4, #108]
	str	r3, [r4, #112]
	str	ip, [r2, #4]
	ldr	ip, [r4, #56]
	ldr	r2, [r4, #68]
	str	r3, [r4, #116]
	mul	r3, ip, r2
	sub	r0, r0, r2
	str	r2, [r4, #120]
	str	r1, [r4, #124]
	str	r1, [r4, #128]
	cmp	r0, r3, lsl #1
	str	r2, [r4, #132]
	bcc	.L1076
	lsl	r3, r2, #1
.L1077:
	mov	r2, r3
	lsl	r3, r3, #1
	mul	r1, ip, r3
	cmp	r1, r0
	bls	.L1077
	str	r2, [r4, #132]
.L1076:
	mov	r0, r5
	add	r5, r5, #52
	bl	snd_pcm_timer_resolution_change
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r7
	bl	_raw_spin_lock
	ldr	r3, [r5, #116]
	mov	r0, r7
	ldr	r3, [r3, #160]
	ldr	r2, [r3]
	cmp	r2, #8
	movne	r2, #1
	strne	r2, [r3]
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	mov	r0, r5
	bl	pm_qos_request_active
	cmp	r0, #0
	bne	.L1111
.L1079:
	ldr	r8, [r4, #52]
	cmp	r8, #0
	beq	.L1059
	movw	r3, #29104
	ldr	r1, [r4, #60]
	movt	r3, 11
	udiv	r0, r3, r8
	mls	r3, r8, r0, r3
	mul	r3, r1, r3
	udiv	r8, r3, r8
	mlas	r2, r1, r0, r8
	movmi	r8, #0
	bmi	.L1059
	mov	r0, r5
	mov	r1, #1
	mov	r8, #0
	bl	pm_qos_add_request
	b	.L1059
.L1063:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r7
	bl	_raw_spin_lock
	ldr	r3, [r5, #168]
	mov	r0, r7
	ldr	r3, [r3, #160]
	ldr	r2, [r3]
	cmp	r2, #8
	movne	r2, #0
	strne	r2, [r3]
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	ldr	r3, [r5, #164]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L1059
	mov	r0, r5
	blx	r3
.L1059:
	mov	r0, r8
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L1111:
	mov	r0, r5
	bl	pm_qos_remove_request
	b	.L1079
.L1081:
	mvn	r8, #76
	b	.L1059
.L1086:
	mov	r1, #0
.L1071:
	rsb	r2, r3, #0
	and	r3, r3, r2
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r3, r3
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r3, r3, #31
	add	r3, r3, r1
	b	.L1072
.L1110:
	mov	r1, #0
.L1065:
	rsb	r2, r3, #0
	and	r3, r3, r2
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r3, r3
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r3, r3, #31
	add	r3, r3, r1
	b	.L1068
.L1084:
	mov	r2, #0
.L1069:
	rsb	r3, r0, #0
	and	r0, r0, r3
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r0, r0
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r0, r0, #31
	add	r0, r0, r2
	b	.L1070
.L1109:
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	mvn	r8, #76
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	b	.L1059
	.fnend
	.size	snd_pcm_hw_params, .-snd_pcm_hw_params
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_common_ioctl1, %function
snd_pcm_common_ioctl1:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r1
	strd	r6, [sp, #8]
	mov	r6, r3
	str	lr, [sp, #32]
	movw	lr, #16736
	movt	lr, 16388
	strd	r8, [sp, #16]
	cmp	r2, lr
	strd	r10, [sp, #24]
	.pad #36
	sub	sp, sp, #36
	beq	.L1114
	mov	ip, r2
	bhi	.L1115
	movw	r3, #16711
	cmp	r2, r3
	beq	.L1116
	bhi	.L1117
	movw	r3, #16705
	cmp	r2, r3
	beq	.L1118
	mov	r5, r0
	bls	.L1293
	movw	r3, #16707
	cmp	r2, r3
	beq	.L1123
	bcc	.L1124
	movw	r3, #16708
	cmp	r2, r3
	bne	.L1113
	ldr	r2, [r1]
	ldr	r8, [r1, #168]
	ldr	r9, [r2]
	ldr	r3, [r8, #160]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1251
	add	r6, r9, #532
	mov	r0, r6
	bl	mutex_lock
	ldr	r3, [r8, #160]
	ldr	r3, [r3]
	cmp	r3, #7
	beq	.L1294
.L1221:
	cmp	r5, #0
	ldr	r0, .L1310
	add	r7, r4, #192
	ldrne	r5, [r5, #32]
	ldreq	r5, [r4, #224]
	bl	down_read
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r7
	ubfx	r5, r5, #11, #1
	bl	_raw_spin_lock
	ldr	r3, [r8, #160]
	ldr	r3, [r3]
	cmp	r3, #6
	beq	.L1295
.L1224:
	mov	r2, #0
	mov	r1, r4
	ldr	r0, .L1310+4
	bl	snd_pcm_action
	subs	fp, r0, #0
	blt	.L1225
	cmp	r5, #0
	mvnne	fp, #10
	bne	.L1225
	mov	r3, sp
	bic	r2, r3, #8128
	movw	r3, #:lower16:default_wake_function
	bic	r2, r2, #63
	movt	r3, #:upper16:default_wake_function
	strd	r2, [sp]
.L1231:
	ldr	r3, [sp]
	ldr	ip, [r3, #12]
	ldr	r2, [ip, #4]
	ldr	r2, [r2]
	tst	r2, #1
	bne	.L1253
	ldr	r0, [r4, #208]
	ldr	r2, [r0, #4]!
	cmp	r0, r2
	sub	r2, r2, #184
	beq	.L1225
.L1228:
	ldr	r1, [r2, #48]
	cmp	r1, #0
	bne	.L1226
	ldr	r10, [r2, #168]
	ldr	lr, [r10, #160]
	ldr	lr, [lr]
	cmp	lr, #5
	beq	.L1227
.L1226:
	ldr	r2, [r2, #184]
	cmp	r0, r2
	sub	r2, r2, #184
	bne	.L1228
.L1225:
	mov	r0, r7
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	ldr	r0, .L1310
	bl	up_read
.L1285:
	mov	r0, r6
	bl	mutex_unlock
	b	.L1112
.L1115:
	movw	r3, #16641
	movt	r3, 33056
	cmp	r2, r3
	beq	.L1133
	bls	.L1296
	movw	r3, #16656
	movt	r3, 49404
	cmp	r2, r3
	beq	.L1140
	bls	.L1297
	movw	r3, #16656
	movt	r3, 49756
	cmp	r2, r3
	beq	.L1144
	movw	r3, #16657
	bls	.L1298
	movt	r3, 49756
	cmp	r2, r3
	bne	.L1299
	mov	r1, #604
	mov	r0, r6
	bl	memdup_user
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L1280
	mov	r0, r4
	mov	r1, r5
	bl	snd_pcm_hw_params
.L1290:
	mov	r3, sp
	mov	fp, r0
	bic	r2, r3, #8128
	bic	r2, r2, #63
	ldr	r2, [r2, #8]
	.syntax divided
@ 448 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r1, r6, #604; sbcccs r1, r1, r2; movcc r2, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r2, #0
	beq	.L1156
.L1158:
	cmp	fp, #0
	mvneq	fp, #13
.L1157:
	mov	r0, r5
	bl	kfree
	b	.L1112
.L1117:
	movw	r3, #17305
	movt	r3, 16385
	cmp	r2, r3
	beq	.L1281
	bls	.L1300
	movw	r3, #16643
	movt	r3, 16388
	cmp	r2, r3
	beq	.L1130
	movw	r3, #16709
	movt	r3, 16388
	cmp	r2, r3
	beq	.L1131
	movw	r3, #16642
	movt	r3, 16388
	cmp	r2, r3
	beq	.L1234
.L1113:
	ubfx	r3, ip, #8, #8
	cmp	r3, #85
	beq	.L1281
	mvn	fp, #24
	b	.L1112
.L1293:
	movw	r3, #16674
	cmp	r2, r3
	beq	.L1120
	movw	r3, #16704
	cmp	r2, r3
	beq	.L1121
	movw	r3, #16658
	cmp	r2, r3
	bne	.L1113
	ldr	r6, [r1, #168]
	movw	r0, #:lower16:.LANCHOR0
	add	r5, r1, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r5
	bl	_raw_spin_lock
	ldr	r3, [r6, #160]
	mov	r0, r5
	ldr	r3, [r3]
	sub	r3, r3, #1
	cmp	r3, #1
	bhi	.L1284
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	ldr	r3, [r4, #220]
	cmp	r3, #0
	bne	.L1251
	ldr	r3, [r4, #164]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L1238
	mov	r0, r4
	blx	r3
	mov	fp, r0
.L1162:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r5
	bl	_raw_spin_lock
	ldr	r2, [r4, #168]
	mov	r0, r5
	ldr	r2, [r2, #160]
	ldr	r1, [r2]
	cmp	r1, #8
	movne	r1, #0
	strne	r1, [r2]
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	add	r0, r4, #52
	bl	pm_qos_remove_request
	b	.L1112
.L1297:
	movw	r3, #16675
	movt	r3, 49284
	cmp	r2, r3
	beq	.L1142
	movw	r3, #17168
	movt	r3, 49348
	cmp	r2, r3
	beq	.L1281
	movw	r3, #16659
	movt	r3, 49256
	cmp	r2, r3
	bne	.L1113
	mov	r1, r6
	mov	r0, r4
	bl	snd_pcm_sw_params_user
	mov	fp, r0
	b	.L1112
.L1299:
	movw	r3, #17169
	movt	r3, 56200
	cmp	r2, r3
	bne	.L1113
.L1281:
	ldr	r3, [r4, #164]
	mov	r2, r6
	mov	r1, ip
	mov	r0, r4
	ldr	r3, [r3, #8]
	blx	r3
	mov	fp, r0
.L1112:
	mov	r0, fp
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1296:
	movw	r3, #16690
	movt	r3, 32784
	cmp	r2, r3
	beq	.L1135
	bhi	.L1136
	mov	r3, #16640
	movt	r3, 32772
	cmp	r2, r3
	beq	.L1137
	movw	r3, #16673
	movt	r3, 32772
	cmp	r2, r3
	bne	.L1301
	ldr	r7, [r1, #168]
	movw	r0, #:lower16:.LANCHOR0
	add	r5, r1, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r5
	bl	_raw_spin_lock
	ldr	r2, [r7, #160]
	ldr	r3, [r2]
	sub	r3, r3, #2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L1196
.L1198:
	.word	.L1197
	.word	.L1199
	.word	.L1200
	.word	.L1201
	.word	.L1196
	.word	.L1197
.L1300:
	movw	r3, #16737
	cmp	r2, r3
	beq	.L1128
	movw	r3, #17204
	cmp	r2, r3
	beq	.L1281
	movw	r3, #16712
	cmp	r2, r3
	bne	.L1113
	ldr	r3, [r1]
	ldr	r6, [r1, #168]
	ldr	r7, [r3]
	add	r5, r7, #532
	mov	r0, r5
	bl	mutex_lock
	ldr	r3, [r6, #160]
	ldr	r3, [r3]
	cmp	r3, #7
	beq	.L1184
.L1189:
	movw	r0, #:lower16:.LANCHOR0
	add	r7, r4, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r7
	bl	_raw_spin_lock
	ldr	r3, [r6, #160]
	ldr	r3, [r3]
	cmp	r3, #3
	beq	.L1186
	cmp	r3, #4
	moveq	fp, #0
	mvnne	fp, #76
.L1185:
	mov	r0, r7
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
.L1188:
	mov	r0, r5
	bl	mutex_unlock
	b	.L1112
.L1136:
	movw	r3, #16672
	movt	r3, 32876
	cmp	r2, r3
	bne	.L1302
	mov	r1, r6
	mov	r0, r4
	bl	snd_pcm_status_user
	mov	fp, r0
	b	.L1112
.L1298:
	movt	r3, 49404
	cmp	r2, r3
	bne	.L1113
.L1209:
	movw	r3, #:lower16:kmalloc_caches
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #40]
	cmp	r0, #0
	beq	.L1249
	mov	r2, #604
	mov	r1, #208
	bl	kmem_cache_alloc_trace
	subs	r7, r0, #0
	beq	.L1214
.L1213:
	mov	r1, #252
	mov	r0, r6
	bl	memdup_user
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L1288
	mov	r1, #604
	mov	r0, r7
	bl	__memzero
	ldr	r3, [r5]
	add	r9, r7, #260
	add	r8, r5, #16
	mov	r1, r8
	mov	r2, #144
	mov	r0, r9
	str	r3, [r7]
	ldr	r3, [r5, #4]
	str	r3, [r7, #4]
	ldr	r3, [r5, #8]
	str	r3, [r7, #36]
	ldr	r3, [r5, #12]
	str	r3, [r7, #68]
	bl	memcpy
	ldr	r2, [r5, #160]
	mov	r0, r4
	mov	r1, r7
	lsl	r3, r2, #5
	and	r2, r2, #7
	bic	r3, r3, #255
	orr	r3, r3, r2
	str	r3, [r7, #512]
	ldr	r2, [r5, #164]
	lsl	r3, r2, #5
	and	r2, r2, #7
	bic	r3, r3, #255
	orr	r3, r3, r2
	str	r3, [r7, #516]
	ldr	r3, [r5, #168]
	str	r3, [r7, #520]
	ldr	r3, [r5, #172]
	str	r3, [r7, #524]
	ldr	r3, [r5, #176]
	str	r3, [r7, #528]
	ldr	r3, [r5, #180]
	str	r3, [r7, #532]
	ldr	r3, [r5, #184]
	str	r3, [r7, #536]
	bl	snd_pcm_hw_params
.L1292:
	mov	r1, #252
	mov	fp, r0
	mov	r0, r5
	bl	__memzero
	ldr	ip, [r7]
	mov	r1, r9
	mov	r2, #144
	mov	r0, r8
	str	ip, [r5]
	ldr	ip, [r7, #4]
	str	ip, [r5, #4]
	ldr	ip, [r7, #36]
	str	ip, [r5, #8]
	ldr	ip, [r7, #68]
	str	ip, [r5, #12]
	bl	memcpy
	ldr	r1, [r7, #512]
	movw	r2, #65528
	mov	r3, sp
	movt	r2, 2047
	bic	r0, r3, #8128
	bic	r0, r0, #63
	and	ip, r2, r1, lsr #5
	and	r1, r1, #7
	orr	r1, ip, r1
	str	r1, [r5, #160]
	ldr	r1, [r7, #516]
	and	r2, r2, r1, lsr #5
	and	r1, r1, #7
	orr	r2, r2, r1
	str	r2, [r5, #164]
	ldr	r2, [r7, #520]
	str	r2, [r5, #168]
	ldr	r2, [r7, #524]
	str	r2, [r5, #172]
	ldr	r2, [r7, #528]
	str	r2, [r5, #176]
	ldr	r2, [r7, #532]
	str	r2, [r5, #180]
	ldr	r2, [r7, #536]
	str	r2, [r5, #184]
	ldr	r2, [r0, #8]
	.syntax divided
@ 448 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r1, r6, #252; sbcccs r1, r1, r2; movcc r2, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r2, #0
	beq	.L1217
.L1219:
	cmp	fp, #0
	mvneq	fp, #13
.L1218:
	mov	r0, r5
	bl	kfree
.L1216:
	mov	r0, r7
	bl	kfree
	b	.L1112
.L1116:
	ldr	r3, [r1]
	ldr	r6, [r3]
	add	r5, r6, #532
	mov	r0, r5
	bl	mutex_lock
	mov	r0, r6
	mov	r1, #0
	bl	snd_power_wait
	subs	fp, r0, #0
	blt	.L1188
	mov	r1, r4
	mov	r2, #0
	ldr	r0, .L1310+8
	bl	snd_pcm_action_lock_irq
	mov	fp, r0
	b	.L1188
.L1137:
	mov	r3, sp
	mov	r2, #10
	bic	r3, r3, #8128
	mov	r0, r6
	bic	r3, r3, #63
	movt	r2, 2
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
	.syntax divided
@ 2584 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	bne	.L1283
.L1234:
	mov	fp, #0
	b	.L1112
.L1128:
	ldr	r0, .L1310
	add	r5, r1, #192
	bl	down_write
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_write_lock_irq
	ldr	r3, [r4, #208]
	cmp	r3, r5
	beq	.L1243
	ldrd	r2, [r4, #184]
	mov	r0, #256
	mov	r1, #512
	add	r6, r4, #184
	str	r3, [r2, #4]
	str	r2, [r3]
	ldr	r2, [r4, #208]
	strd	r0, [r4, #184]
	ldr	r3, [r2, #12]
	sub	r3, r3, #1
	str	r3, [r2, #12]
	ldr	r0, [r4, #208]
	ldr	r3, [r0, #12]
	cmp	r3, #1
	beq	.L1303
.L1181:
	add	r2, r4, #196
	mov	fp, #0
	str	r2, [r4, #184]
	str	r2, [r4, #188]
	str	r6, [r4, #196]
	str	r6, [r4, #200]
	str	r5, [r4, #208]
.L1180:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_write_unlock_irq
	ldr	r0, .L1310
	bl	up_write
	b	.L1112
.L1142:
	mov	r1, r6
	mov	r0, r4
	bl	snd_pcm_sync_ptr
	mov	fp, r0
	b	.L1112
.L1124:
	mov	r2, #3
	ldr	r0, .L1310+12
	bl	snd_pcm_action_lock_irq
	mov	fp, r0
	b	.L1112
.L1121:
	ldr	r3, [r1]
	cmp	r0, #0
	ldrne	r7, [r0, #32]
	ldreq	r7, [r1, #224]
	ldr	r6, [r3]
	add	r5, r6, #532
	mov	r0, r5
	bl	mutex_lock
	mov	r0, r6
	mov	r1, #0
	bl	snd_power_wait
	subs	fp, r0, #0
	blt	.L1188
	mov	r2, r7
	mov	r1, r4
	ldr	r0, .L1310+16
	bl	snd_pcm_action_nonatomic
	mov	fp, r0
	b	.L1188
.L1131:
	movw	r0, #:lower16:.LANCHOR0
	add	r5, r1, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r5
	bl	_raw_spin_lock
	mov	r2, r6
	mov	r1, r4
	ldr	r0, .L1310+28
	bl	snd_pcm_action
	mov	fp, r0
.L1287:
	mov	r0, r5
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	b	.L1112
.L1302:
	movw	r3, #17171
	movt	r3, 32988
	cmp	r2, r3
	beq	.L1281
	movw	r3, #17184
	movt	r3, 32800
	cmp	r2, r3
	bne	.L1113
	b	.L1281
.L1199:
	mov	r0, r4
	bl	snd_pcm_update_hw_ptr
	subs	fp, r0, #0
	blt	.L1287
	ldr	r2, [r7, #160]
.L1197:
	ldr	r0, [r4, #48]
	ldr	r1, [r7, #164]
	ldr	r3, [r2, #8]
	cmp	r0, #0
	ldr	r4, [r1]
	bne	.L1203
	ldr	r2, [r7, #68]
	ldr	r1, [r7, #132]
	sub	r4, r2, r4
	adds	r3, r4, r3
	addmi	r3, r3, r1
	bmi	.L1205
	cmp	r3, r1
	subcs	r3, r3, r1
.L1205:
	sub	r3, r2, r3
.L1206:
	ldr	r4, [r7, #36]
	mov	r0, r5
	add	r4, r3, r4
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	mov	r3, sp
	mov	r2, r4
	bic	r3, r3, #8128
	mov	r0, r6
	bic	r3, r3, #63
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
	.syntax divided
@ 2507 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	beq	.L1234
.L1283:
	mvn	fp, #13
	b	.L1112
.L1201:
	ldr	r3, [r4, #48]
	cmp	r3, #1
	bne	.L1199
.L1196:
	mov	r0, r5
.L1284:
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	mvn	fp, #76
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	b	.L1112
.L1200:
	mov	r0, r5
	mvn	fp, #31
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	b	.L1112
.L1135:
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
	.syntax divided
@ 439 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r2, r6, #16; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	bne	.L1164
	add	r5, sp, #12
	mov	r2, #16
	mov	r0, r5
	mov	r1, r6
	bl	__copy_from_user
	cmp	r0, #0
	bne	.L1283
	ldr	r8, [r4, #168]
	movw	r0, #:lower16:.LANCHOR0
	add	r7, r4, #192
	movt	r0, #:upper16:.LANCHOR0
	ldr	r9, [sp, #12]
	bl	_raw_read_lock_irq
	mov	r0, r7
	bl	_raw_spin_lock
	ldr	r3, [r8, #160]
	mov	r0, r7
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1284
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	ldr	r3, [r8, #56]
	cmp	r9, r3
	bcs	.L1235
	mov	r1, #16
	mov	r0, r5
	bl	__memzero
	ldr	r3, [r4, #164]
	str	r9, [sp, #12]
	mov	r0, r4
	mov	r2, r5
	mov	r1, #2
	ldr	r3, [r3, #8]
	blx	r3
	subs	fp, r0, #0
	blt	.L1112
	mov	r3, sp
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
	.syntax divided
@ 448 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r2, r6, #16; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	bne	.L1283
	mov	r1, r5
	mov	r0, r6
	mov	r2, #16
	bl	__copy_to_user
	subs	fp, r0, #0
	beq	.L1112
	b	.L1283
.L1133:
	mov	r1, r6
	mov	r0, r4
	bl	snd_pcm_info_user
	mov	fp, r0
	b	.L1112
.L1140:
	movw	r3, #:lower16:kmalloc_caches
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #40]
	cmp	r0, #0
	beq	.L1247
	mov	r2, #604
	mov	r1, #208
	bl	kmem_cache_alloc_trace
	subs	r7, r0, #0
	beq	.L1214
.L1207:
	mov	r1, #252
	mov	r0, r6
	bl	memdup_user
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L1288
	mov	r0, r7
	mov	r1, #604
	bl	__memzero
	ldr	r3, [r5]
	add	r9, r7, #260
	add	r8, r5, #16
	mov	r1, r8
	mov	r0, r9
	mov	r2, #144
	str	r3, [r7]
	ldr	r3, [r5, #4]
	str	r3, [r7, #4]
	ldr	r3, [r5, #8]
	str	r3, [r7, #36]
	ldr	r3, [r5, #12]
	str	r3, [r7, #68]
	bl	memcpy
	ldr	r2, [r5, #160]
	mov	r0, r4
	mov	r1, r7
	lsl	r3, r2, #5
	and	r2, r2, #7
	bic	r3, r3, #255
	orr	r3, r3, r2
	str	r3, [r7, #512]
	ldr	r2, [r5, #164]
	lsl	r3, r2, #5
	and	r2, r2, #7
	bic	r3, r3, #255
	orr	r3, r3, r2
	str	r3, [r7, #516]
	ldr	r3, [r5, #168]
	str	r3, [r7, #520]
	ldr	r3, [r5, #172]
	str	r3, [r7, #524]
	ldr	r3, [r5, #176]
	str	r3, [r7, #528]
	ldr	r3, [r5, #180]
	str	r3, [r7, #532]
	ldr	r3, [r5, #184]
	str	r3, [r7, #536]
	bl	snd_pcm_hw_refine
	b	.L1292
.L1123:
	ldr	r6, [r1, #168]
	ldr	r3, [r6, #160]
	ldr	r5, [r3]
	sub	r3, r5, #7
	cmp	r5, #0
	cmpne	r3, #1
	movls	r5, #1
	movhi	r5, #0
	bls	.L1251
	movw	r0, #:lower16:.LANCHOR0
	add	r7, r1, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r7
	bl	_raw_spin_lock
	ldr	r3, [r6, #160]
	ldr	r3, [r3]
	cmp	r3, #6
	beq	.L1304
.L1232:
	mov	r1, r4
	mov	r2, #1
	ldr	r0, .L1310+24
	bl	snd_pcm_action
	mov	r0, r7
	mov	fp, #0
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	b	.L1112
.L1144:
	mov	r1, #604
	mov	r0, r6
	bl	memdup_user
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L1280
	mov	r0, r4
	mov	r1, r5
	bl	snd_pcm_hw_refine
	b	.L1290
.L1120:
	ldr	r6, [r1, #168]
	movw	r0, #:lower16:.LANCHOR0
	add	r5, r1, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r5
	bl	_raw_spin_lock
	ldr	r3, [r6, #160]
	ldr	r3, [r3]
	sub	r3, r3, #2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L1246
.L1192:
	.word	.L1245
	.word	.L1193
	.word	.L1194
	.word	.L1195
	.word	.L1246
	.word	.L1245
.L1193:
	mov	r0, r4
	bl	snd_pcm_update_hw_ptr
	and	fp, r0, r0, asr #31
	b	.L1287
.L1245:
	mov	fp, #0
	b	.L1287
.L1195:
	ldr	r3, [r4, #48]
	cmp	r3, #1
	bne	.L1193
.L1246:
.L1191:
	mvn	fp, #76
	b	.L1287
.L1194:
	mvn	fp, #31
	b	.L1287
.L1130:
	mov	r3, sp
	mov	r0, r6
	ldr	ip, [r4, #168]
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r1, [r3, #8]
	sub	r1, r1, #1
	.syntax divided
@ 2568 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__get_user_4
@ 0 "" 2
	.arm
	.syntax unified
	subs	fp, r0, #0
	bne	.L1283
	cmp	r2, #1
	bhi	.L1235
	movne	r3, #0
	moveq	r2, #1
	strne	r3, [ip, #536]
	streq	r2, [ip, #536]
	bne	.L1234
	b	.L1112
.L1114:
	mov	r0, r3
	bl	fget
	subs	r5, r0, #0
	beq	.L1251
	ldr	r3, [r5, #12]
	ldr	r1, [r3, #32]
	ldrh	r3, [r1]
	and	r3, r3, #61440
	cmp	r3, #8192
	bne	.L1286
	movw	r2, #:lower16:snd_major
	ldr	r3, [r1, #48]
	movt	r2, #:upper16:snd_major
	ldr	r2, [r2]
	cmp	r2, r3, lsr #20
	bne	.L1286
	ubfx	r6, r3, #0, #20
	mov	r1, #5
	mov	r0, r6
	bl	snd_lookup_minor_data
	cmp	r0, #0
	beq	.L1305
.L1175:
	movw	r3, #:lower16:kmalloc_caches
	ldr	r2, [r5, #124]
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #24]
	ldr	r6, [r2]
	cmp	r0, #0
	beq	.L1306
	mov	r2, #16
	mov	r1, #208
	bl	kmem_cache_alloc_trace
	subs	r7, r0, #0
	beq	.L1307
.L1176:
	ldr	r0, .L1310
	bl	down_write
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_write_lock_irq
	ldr	r3, [r4, #168]
	ldr	r3, [r3, #160]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1241
	ldr	r2, [r6, #168]
	ldr	r2, [r2, #160]
	ldr	r2, [r2]
	cmp	r3, r2
	beq	.L1308
.L1241:
	mvn	fp, #76
.L1178:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_write_unlock_irq
	ldr	r0, .L1310
	bl	up_write
	ldr	r2, [r6]
	ldr	r0, [r2]
	bl	snd_card_unref
	mov	r0, r5
	bl	fput
	b	.L1216
.L1118:
	mov	r2, #0
	ldr	r0, .L1310+20
	bl	snd_pcm_action_nonatomic
	mov	fp, r0
	b	.L1112
.L1156:
	mov	r0, r6
	mov	r2, #604
	mov	r1, r5
	bl	__copy_to_user
	cmp	r0, #0
	bne	.L1158
	b	.L1157
.L1217:
	mov	r0, r6
	mov	r2, #252
	mov	r1, r5
	bl	__copy_to_user
	cmp	r0, #0
	bne	.L1219
	b	.L1218
.L1227:
	cmp	r10, #0
	beq	.L1225
	ldr	r3, [sp, #4]
	add	r5, sp, #12
	add	r8, r10, #172
	mov	r0, r8
	str	r1, [sp, #12]
	mov	r1, r5
	str	ip, [sp, #16]
	str	r3, [sp, #20]
	bl	add_wait_queue
	mov	r0, r7
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	ldr	r0, .L1310
	bl	up_read
	mov	r0, r6
	bl	mutex_unlock
	ldrb	r2, [r10, #100]	@ zero_extendqisi2
	tst	r2, #1
	mvnne	r0, #-2147483648
	bne	.L1229
	ldr	r1, [r10, #52]
	cmp	r1, #0
	movweq	r0, #10000
	beq	.L1230
	ldr	r2, [r10, #60]
	mov	r0, #1000
	lsl	r2, r2, #1
	udiv	r2, r2, r1
	cmp	r2, #10
	movlt	r2, #10
	mul	r0, r0, r2
.L1230:
	bl	msecs_to_jiffies
.L1229:
	bl	schedule_timeout_interruptible
	mov	r10, r0
	mov	r0, r6
	bl	mutex_lock
	ldr	r0, .L1310
	bl	down_read
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r7
	bl	_raw_spin_lock
	mov	r1, r5
	mov	r0, r8
	bl	remove_wait_queue
	ldr	r2, [r9, #476]
	cmp	r2, #0
	bne	.L1256
	cmp	r10, #0
	bne	.L1231
	ldr	r3, [r4, #168]
	ldr	r3, [r3, #160]
	ldr	r3, [r3]
	cmp	r3, #7
	mvneq	fp, #85
	beq	.L1225
	mov	r1, r4
	mov	r2, #1
	ldr	r0, .L1310+24
	bl	snd_pcm_action
	mvn	fp, #4
	b	.L1225
.L1184:
	mov	r0, r7
	mov	r1, #0
	bl	snd_power_wait
	subs	fp, r0, #0
	bge	.L1189
	b	.L1188
.L1303:
	mov	r2, r0
	ldr	r3, [r2, #4]!
	cmp	r3, r2
	beq	.L1182
	add	r2, r3, #12
	add	r1, r3, #8
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r3, [r3, #12]
	str	r3, [r3, #16]
	str	r1, [r3, #24]
	ldr	r0, [r4, #208]
.L1182:
	bl	kfree
	b	.L1181
.L1305:
	mov	r0, r6
	mov	r1, #6
	bl	snd_lookup_minor_data
	cmp	r0, #0
	bne	.L1175
.L1286:
	mov	r0, r5
	mvn	fp, #76
	bl	fput
	b	.L1112
.L1247:
	mov	r7, #16
	b	.L1207
.L1311:
	.align	2
.L1310:
	.word	.LANCHOR1+52
	.word	.LANCHOR1+164
	.word	.LANCHOR1+148
	.word	.LANCHOR1+132
	.word	.LANCHOR1+100
	.word	.LANCHOR1+116
	.word	.LANCHOR1+84
	.word	.LANCHOR1+68
	.word	.LANCHOR1+52
.L1249:
	mov	r7, #16
	b	.L1213
.L1306:
	mov	r7, #16
	b	.L1176
.L1186:
	mov	r1, r4
	mov	r2, #4
	ldr	r0, .L1310+24
	bl	snd_pcm_action
	mov	fp, r0
	b	.L1185
.L1301:
	movw	r3, #17170
	movt	r3, 16616
	cmp	r2, r3
	bne	.L1113
	b	.L1281
.L1307:
	ldr	r2, [r6]
	mvn	fp, #11
	ldr	r0, [r2]
	bl	snd_card_unref
	mov	r0, r5
	bl	fput
	b	.L1216
.L1203:
	subs	r3, r3, r4
	ldrmi	r2, [r7, #132]
	addmi	r3, r3, r2
	b	.L1206
.L1280:
	mov	fp, r5
	b	.L1112
.L1288:
	mov	fp, r5
	b	.L1216
.L1304:
	mov	r2, r5
	mov	r1, r4
	ldr	r0, .L1310+28
	bl	snd_pcm_action
	b	.L1232
.L1294:
	mov	r1, #0
	mov	r0, r9
	bl	snd_power_wait
	subs	fp, r0, #0
	bge	.L1221
	b	.L1285
.L1295:
	mov	r2, #0
	mov	r1, r4
	ldr	r0, .L1310+28
	bl	snd_pcm_action
	b	.L1224
.L1253:
	mov	fp, #65024
	movt	fp, 65535
	b	.L1225
.L1251:
	mvn	fp, #76
	b	.L1112
.L1308:
	ldr	r2, [r6, #208]
	add	r3, r6, #192
	cmp	r2, r3
	mvnne	fp, #113
	bne	.L1178
	ldr	r3, [r4, #208]
	add	r2, r4, #192
	cmp	r3, r2
	beq	.L1309
.L1179:
	ldr	r2, [r3, #8]
	add	ip, r3, #4
	add	r1, r6, #184
	movw	r0, #:lower16:.LANCHOR0
	mov	fp, #0
	str	r1, [r3, #8]
	movt	r0, #:upper16:.LANCHOR0
	str	ip, [r6, #184]
	str	r2, [r6, #188]
	str	r1, [r2]
	ldr	r1, [r4, #208]
	ldr	r2, [r1, #12]
	add	r2, r2, #1
	str	r2, [r1, #12]
	ldr	r2, [r4, #208]
	str	r2, [r6, #208]
	bl	_raw_write_unlock_irq
	ldr	r0, .L1310+32
	bl	up_write
	ldr	r2, [r6]
	ldr	r0, [r2]
	bl	snd_card_unref
	mov	r0, r5
	bl	fput
	b	.L1112
.L1235:
	mvn	fp, #21
	b	.L1112
.L1238:
	mov	fp, r3
	b	.L1162
.L1256:
	mvn	fp, #18
	b	.L1225
.L1164:
	mov	r1, #16
	add	r0, sp, #12
	bl	__memzero
	b	.L1283
.L1214:
	mvn	fp, #11
	b	.L1112
.L1309:
	mov	r2, #0
	str	r7, [r4, #208]
	add	r3, r4, #184
	mov	r0, #1
	str	r2, [r7]
	ldr	r2, [r4, #208]
	add	r1, r2, #4
	str	r1, [r2, #4]
	str	r1, [r2, #8]
	ldr	r2, [r4, #208]
	ldr	r1, [r2, #8]
	add	ip, r2, #4
	str	r3, [r2, #8]
	str	ip, [r4, #184]
	str	r1, [r4, #188]
	str	r3, [r1]
	ldr	r3, [r4, #208]
	str	r0, [r3, #12]
	ldr	r3, [r4, #208]
	b	.L1179
.L1243:
	mvn	fp, #113
	b	.L1180
	.fnend
	.size	snd_pcm_common_ioctl1, .-snd_pcm_common_ioctl1
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_capture_ioctl, %function
snd_pcm_capture_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	ubfx	ip, r1, #8, #8
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	strd	r6, [sp, #8]
	str	lr, [sp, #20]
	and	lr, ip, #253
	cmp	lr, #65
	cmpne	ip, #85
	str	r8, [sp, #16]
	.pad #16
	sub	sp, sp, #16
	movne	ip, #1
	moveq	ip, #0
	ldr	r5, [r0, #124]
	bne	.L1351
	movw	r3, #16713
	mov	r4, r2
	ldr	r5, [r5]
	movt	r3, 16388
	cmp	r1, r3
	beq	.L1315
	bls	.L1367
	movw	r3, #16721
	movt	r3, 32780
	cmp	r1, r3
	beq	.L1318
	movw	r3, #16723
	movt	r3, 32780
	cmp	r1, r3
	bne	.L1314
	ldr	r6, [r5, #168]
	ldr	r3, [r6, #160]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1353
	ldr	r3, [r6, #56]
	cmp	r3, #128
	mvnhi	r5, #21
	bhi	.L1312
	mov	r3, #57344
	mov	r1, sp
	movt	r3, 65535
	mov	r2, ip
	and	r1, r1, r3
	mov	r0, r4
	ldr	r1, [r1, #8]
	sub	r1, r1, #1
	.syntax divided
@ 2773 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	bne	.L1366
	mov	r2, sp
	and	r3, r3, r2
	ldr	r3, [r3, #8]
	.syntax divided
@ 439 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r2, r4, #12; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	bne	.L1322
	mov	r2, #12
	mov	r1, r4
	add	r0, sp, #4
	bl	__copy_from_user
	cmp	r0, #0
	bne	.L1366
	ldr	r1, [r6, #56]
	ldr	r0, [sp, #8]
	lsl	r1, r1, #2
	bl	memdup_user
	cmn	r0, #4096
	mov	r6, r0
	movhi	r5, r0
	bhi	.L1312
	mov	r1, r6
	ldr	r2, [sp, #12]
	mov	r0, r5
	bl	snd_pcm_lib_readv
	mov	r5, r0
	mov	r0, r6
	bl	kfree
	mov	r3, #0
	.syntax divided
@ 2784 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	1:	str	r5,[r4],#0
2:
	.pushsection .fixup,"ax"
	.align	2
3:	mov	r3, #-14
	b	2b
	.popsection
	.pushsection __ex_table,"a"
	.align	3
	.long	1b, 3b
	.popsection
@ 0 "" 2
	.arm
	.syntax unified
	and	r5, r5, r5, asr #31
	b	.L1312
.L1367:
	movw	r3, #16710
	movt	r3, 16388
	cmp	r1, r3
	bne	.L1314
	mov	r3, #57344
	mov	r0, r2
	movt	r3, 65535
	mov	r2, sp
	and	r2, r2, r3
	ldr	r1, [r2, #8]
	sub	r1, r1, #1
	.syntax divided
@ 2792 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__get_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	mov	r6, r2
	bne	.L1366
	mov	r2, sp
	and	r3, r3, r2
	mov	r2, r0
	ldr	r1, [r3, #8]
	mov	r0, r4
	sub	r1, r1, #1
	.syntax divided
@ 2794 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	bne	.L1366
	cmp	r6, #0
	bne	.L1368
.L1359:
	mov	r5, r6
.L1342:
	mov	r3, #0
	.syntax divided
@ 2810 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	1:	str	r6,[r4],#0
2:
	.pushsection .fixup,"ax"
	.align	2
3:	mov	r3, #-14
	b	2b
	.popsection
	.pushsection __ex_table,"a"
	.align	3
	.long	1b, 3b
	.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L1312:
	mov	r0, r5
	add	sp, sp, #16
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L1314:
	mov	r2, r1
	mov	r3, r4
	mov	r1, r5
	bl	snd_pcm_common_ioctl1
	mov	r5, r0
	b	.L1312
.L1318:
	ldr	r3, [r5, #168]
	ldr	r3, [r3, #160]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1353
	mov	r3, #57344
	mov	r1, sp
	movt	r3, 65535
	mov	r2, ip
	and	r1, r1, r3
	mov	r0, r4
	ldr	r1, [r1, #8]
	sub	r1, r1, #1
	.syntax divided
@ 2754 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	bne	.L1366
	mov	r2, sp
	and	r3, r3, r2
	ldr	r3, [r3, #8]
	.syntax divided
@ 439 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r2, r4, #12; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	beq	.L1369
.L1322:
	mov	r1, #12
	add	r0, sp, #4
	bl	__memzero
.L1366:
	mvn	r5, #13
	b	.L1312
.L1338:
.L1315:
	mov	r3, #57344
	mov	r0, r2
	movt	r3, 65535
	mov	r2, sp
	and	r2, r2, r3
	ldr	r1, [r2, #8]
	sub	r1, r1, #1
	.syntax divided
@ 2805 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__get_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	mov	r6, r2
	bne	.L1366
	mov	r2, sp
	and	r3, r3, r2
	mov	r2, r0
	ldr	r1, [r3, #8]
	mov	r0, r4
	sub	r1, r1, #1
	.syntax divided
@ 2807 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	bne	.L1366
	cmp	r6, #0
	beq	.L1359
	ldr	r8, [r5, #168]
	movw	r0, #:lower16:.LANCHOR0
	add	r7, r5, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r7
	bl	_raw_spin_lock
	ldr	r2, [r8, #160]
	ldr	r3, [r2]
	sub	r3, r3, #2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L1343
.L1345:
	.word	.L1344
	.word	.L1346
	.word	.L1360
	.word	.L1344
	.word	.L1344
	.word	.L1348
.L1353:
	mvn	r5, #76
	b	.L1312
.L1368:
	ldr	r8, [r5, #168]
	movw	r0, #:lower16:.LANCHOR0
	add	r7, r5, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r7
	bl	_raw_spin_lock
	ldr	r2, [r8, #160]
	ldr	r3, [r2]
	sub	r3, r3, #2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L1343
.L1336:
	.word	.L1335
	.word	.L1337
	.word	.L1360
	.word	.L1335
	.word	.L1343
	.word	.L1348
.L1369:
	mov	r2, #12
	mov	r1, r4
	add	r0, sp, #4
	bl	__copy_from_user
	subs	r6, r0, #0
	bne	.L1366
	mov	r0, r5
	ldr	r1, [sp, #8]
	ldr	r2, [sp, #12]
	bl	snd_pcm_lib_read
	.syntax divided
@ 2759 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	1:	str	r0,[r4],#0
2:
	.pushsection .fixup,"ax"
	.align	2
3:	mov	r6, #-14
	b	2b
	.popsection
	.pushsection __ex_table,"a"
	.align	3
	.long	1b, 3b
	.popsection
@ 0 "" 2
	.arm
	.syntax unified
	and	r5, r0, r0, asr #31
	b	.L1312
.L1360:
	mvn	r5, #31
	mov	r6, r5
.L1347:
	mov	r0, r7
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	b	.L1342
.L1348:
	mvn	r5, #85
	mov	r6, r5
	b	.L1347
.L1346:
	mov	r0, r5
	bl	snd_pcm_update_hw_ptr
	cmp	r0, #0
	blt	.L1361
	ldr	r2, [r8, #160]
.L1344:
	ldr	r1, [r8, #164]
	ldr	r3, [r2, #8]
	ldr	r2, [r1]
	subs	r3, r3, r2
	ldrmi	r0, [r8, #132]
	addmi	r3, r3, r0
	cmp	r3, #0
	ble	.L1362
	ldr	r0, [r8, #132]
	cmp	r6, r3
	mov	r5, #0
	movcs	r6, r3
	add	r2, r2, r6
	cmp	r2, r0
	subge	r2, r2, r0
	str	r2, [r1]
	b	.L1347
.L1337:
	mov	r0, r5
	bl	snd_pcm_update_hw_ptr
	cmp	r0, #0
	blt	.L1361
	ldr	r2, [r8, #160]
.L1335:
	ldr	r2, [r2, #8]
	ldr	r0, [r8, #164]
	ldr	r1, [r8, #68]
	ldr	r3, [r0]
	subs	r2, r2, r3
	ldrmi	ip, [r8, #132]
	addmi	r2, r2, ip
	sub	r2, r1, r2
	cmp	r2, #0
	ble	.L1362
	cmp	r6, r2
	mov	r5, #0
	movcs	r6, r2
	subs	r3, r3, r6
	ldrmi	r2, [r8, #132]
	addmi	r3, r3, r2
	str	r3, [r0]
	b	.L1347
.L1343:
	mvn	r5, #76
	mov	r6, r5
	b	.L1347
.L1351:
	mvn	r5, #24
	b	.L1312
.L1362:
	mov	r6, #0
	mov	r5, r6
	b	.L1347
.L1361:
	mvn	r6, #31
	mov	r5, r6
	b	.L1347
	.fnend
	.size	snd_pcm_capture_ioctl, .-snd_pcm_capture_ioctl
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_playback_ioctl, %function
snd_pcm_playback_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	lsr	ip, r1, #8
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	strd	r6, [sp, #8]
	and	ip, ip, #253
	str	r8, [sp, #16]
	cmp	ip, #65
	str	lr, [sp, #20]
	.pad #16
	sub	sp, sp, #16
	ldr	lr, [r0, #124]
	bne	.L1411
	movw	r3, #16713
	mov	r4, r2
	ldr	r5, [lr]
	movt	r3, 16388
	cmp	r1, r3
	beq	.L1373
	bls	.L1427
	movw	r3, #16720
	movt	r3, 16396
	cmp	r1, r3
	beq	.L1376
	movw	r3, #16722
	movt	r3, 16396
	cmp	r1, r3
	bne	.L1372
	ldr	r6, [r5, #168]
	ldr	r3, [r6, #160]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1413
	ldr	r3, [r6, #56]
	cmp	r3, #128
	mvnhi	r5, #21
	bhi	.L1370
	mov	r3, #57344
	mov	r1, sp
	movt	r3, 65535
	mov	r2, #0
	and	r1, r1, r3
	mov	r0, r4
	ldr	r1, [r1, #8]
	sub	r1, r1, #1
	.syntax divided
@ 2693 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, r2
	bne	.L1426
	mov	r2, sp
	and	r3, r3, r2
	ldr	r3, [r3, #8]
	.syntax divided
@ 439 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r2, r4, #12; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	bne	.L1380
	mov	r2, #12
	mov	r1, r4
	add	r0, sp, #4
	bl	__copy_from_user
	cmp	r0, #0
	bne	.L1426
	ldr	r1, [r6, #56]
	ldr	r0, [sp, #8]
	lsl	r1, r1, #2
	bl	memdup_user
	cmn	r0, #4096
	mov	r6, r0
	movhi	r5, r0
	bhi	.L1370
	mov	r1, r6
	ldr	r2, [sp, #12]
	mov	r0, r5
	bl	snd_pcm_lib_writev
	mov	r5, r0
	mov	r0, r6
	bl	kfree
	mov	r3, #0
	.syntax divided
@ 2704 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	1:	str	r5,[r4],#0
2:
	.pushsection .fixup,"ax"
	.align	2
3:	mov	r3, #-14
	b	2b
	.popsection
	.pushsection __ex_table,"a"
	.align	3
	.long	1b, 3b
	.popsection
@ 0 "" 2
	.arm
	.syntax unified
	and	r5, r5, r5, asr #31
	b	.L1370
.L1427:
	movw	r3, #16710
	movt	r3, 16388
	cmp	r1, r3
	bne	.L1372
	mov	r3, #57344
	mov	r0, r2
	movt	r3, 65535
	mov	r2, sp
	and	r2, r2, r3
	ldr	r1, [r2, #8]
	sub	r1, r1, #1
	.syntax divided
@ 2712 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__get_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	mov	r6, r2
	bne	.L1426
	mov	r2, sp
	and	r3, r3, r2
	mov	r2, r0
	ldr	r1, [r3, #8]
	mov	r0, r4
	sub	r1, r1, #1
	.syntax divided
@ 2714 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	bne	.L1426
	cmp	r6, #0
	bne	.L1428
.L1419:
	mov	r5, r6
.L1401:
	mov	r3, #0
	.syntax divided
@ 2730 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	1:	str	r6,[r4],#0
2:
	.pushsection .fixup,"ax"
	.align	2
3:	mov	r3, #-14
	b	2b
	.popsection
	.pushsection __ex_table,"a"
	.align	3
	.long	1b, 3b
	.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L1370:
	mov	r0, r5
	add	sp, sp, #16
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L1372:
	mov	r2, r1
	mov	r3, r4
	mov	r1, r5
	bl	snd_pcm_common_ioctl1
	mov	r5, r0
	b	.L1370
.L1376:
	ldr	r3, [r5, #168]
	ldr	r3, [r3, #160]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1413
	mov	r3, #57344
	mov	r1, sp
	movt	r3, 65535
	mov	r2, #0
	and	r1, r1, r3
	mov	r0, r4
	ldr	r1, [r1, #8]
	sub	r1, r1, #1
	.syntax divided
@ 2674 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, r2
	bne	.L1426
	mov	r2, sp
	and	r3, r3, r2
	ldr	r3, [r3, #8]
	.syntax divided
@ 439 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r2, r4, #12; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	beq	.L1429
.L1380:
	mov	r1, #12
	add	r0, sp, #4
	bl	__memzero
.L1426:
	mvn	r5, #13
	b	.L1370
.L1373:
	mov	r3, #57344
	mov	r0, r2
	movt	r3, 65535
	mov	r2, sp
	and	r2, r2, r3
	ldr	r1, [r2, #8]
	sub	r1, r1, #1
	.syntax divided
@ 2725 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__get_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	mov	r6, r2
	bne	.L1426
	mov	r2, sp
	and	r3, r3, r2
	mov	r2, r0
	ldr	r1, [r3, #8]
	mov	r0, r4
	sub	r1, r1, #1
	.syntax divided
@ 2727 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	bne	.L1426
	cmp	r6, #0
	beq	.L1419
	ldr	r8, [r5, #168]
	movw	r0, #:lower16:.LANCHOR0
	add	r7, r5, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r7
	bl	_raw_spin_lock
	ldr	r2, [r8, #160]
	ldr	r3, [r2]
	sub	r3, r3, #2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L1402
.L1404:
	.word	.L1403
	.word	.L1405
	.word	.L1420
	.word	.L1405
	.word	.L1403
	.word	.L1407
.L1413:
	mvn	r5, #76
	b	.L1370
.L1428:
	ldr	r7, [r5, #168]
	movw	r0, #:lower16:.LANCHOR0
	add	r8, r5, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r8
	bl	_raw_spin_lock
	ldr	r2, [r7, #160]
	ldr	r3, [r2]
	sub	r3, r3, #2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L1392
.L1394:
	.word	.L1393
	.word	.L1395
	.word	.L1416
	.word	.L1395
	.word	.L1392
	.word	.L1397
.L1429:
	mov	r2, #12
	mov	r1, r4
	add	r0, sp, #4
	bl	__copy_from_user
	subs	r6, r0, #0
	bne	.L1426
	mov	r0, r5
	ldr	r1, [sp, #8]
	ldr	r2, [sp, #12]
	bl	snd_pcm_lib_write
	.syntax divided
@ 2679 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	1:	str	r0,[r4],#0
2:
	.pushsection .fixup,"ax"
	.align	2
3:	mov	r6, #-14
	b	2b
	.popsection
	.pushsection __ex_table,"a"
	.align	3
	.long	1b, 3b
	.popsection
@ 0 "" 2
	.arm
	.syntax unified
	and	r5, r0, r0, asr #31
	b	.L1370
.L1405:
	mov	r0, r5
	bl	snd_pcm_update_hw_ptr
	cmp	r0, #0
	blt	.L1421
	ldr	r2, [r8, #160]
.L1403:
	ldr	r0, [r2, #8]
	ldr	ip, [r8, #164]
	ldr	r3, [r8, #68]
	ldr	r1, [r8, #132]
	ldr	r2, [ip]
	sub	r3, r3, r2
	adds	r3, r3, r0
	addmi	r3, r3, r1
	bmi	.L1409
	cmp	r3, r1
	subcs	r3, r3, r1
.L1409:
	cmp	r3, #0
	ble	.L1422
	cmp	r6, r3
	mov	r5, #0
	movcs	r6, r3
	add	r2, r6, r2
	cmp	r2, r1
	subge	r2, r2, r1
	str	r2, [ip]
.L1406:
	mov	r0, r7
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	b	.L1401
.L1420:
	mvn	r5, #31
	mov	r6, r5
	b	.L1406
.L1407:
	mvn	r5, #85
	mov	r6, r5
	b	.L1406
.L1395:
	mov	r0, r5
	bl	snd_pcm_update_hw_ptr
	cmp	r0, #0
	blt	.L1417
	ldr	r2, [r7, #160]
.L1393:
	ldr	r0, [r2, #8]
	ldr	ip, [r7, #164]
	ldr	r1, [r7, #68]
	ldr	lr, [r7, #132]
	ldr	r2, [ip]
	sub	r3, r1, r2
	adds	r3, r3, r0
	addmi	r3, r3, lr
	bmi	.L1399
	cmp	r3, lr
	subcs	r3, r3, lr
.L1399:
	sub	r3, r1, r3
	cmp	r3, #0
	ble	.L1418
	cmp	r6, r3
	mov	r5, #0
	movcs	r6, r3
	subs	r2, r2, r6
	addmi	r2, r2, lr
	str	r2, [ip]
.L1396:
	mov	r0, r8
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	b	.L1401
.L1416:
	mvn	r5, #31
	mov	r6, r5
	b	.L1396
.L1397:
	mvn	r5, #85
	mov	r6, r5
	b	.L1396
.L1392:
	mvn	r5, #76
	mov	r6, r5
	b	.L1396
.L1411:
	mvn	r5, #24
	b	.L1370
.L1402:
	mvn	r5, #76
	mov	r6, r5
	b	.L1406
.L1418:
	mov	r6, #0
	mov	r5, r6
	b	.L1396
.L1422:
	mov	r6, #0
	mov	r5, r6
	b	.L1406
.L1417:
	mvn	r6, #31
	mov	r5, r6
	b	.L1396
.L1421:
	mvn	r6, #31
	mov	r5, r6
	b	.L1406
	.fnend
	.size	snd_pcm_playback_ioctl, .-snd_pcm_playback_ioctl
	.align	2
	.global	snd_pcm_status
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_status, %function
snd_pcm_status:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r1
	strd	r6, [sp, #8]
	mov	r6, r0
	movw	r0, #:lower16:.LANCHOR0
	str	r8, [sp, #16]
	movt	r0, #:upper16:.LANCHOR0
	add	r7, r6, #192
	str	lr, [sp, #20]
	ldr	r4, [r6, #168]
	bl	_raw_read_lock_irq
	mov	r0, r7
	bl	_raw_spin_lock
	ldr	r3, [r4, #160]
	ldr	r3, [r3]
	str	r3, [r5]
	ldr	r2, [r4, #160]
	cmp	r3, #0
	ldr	r3, [r2, #20]
	str	r3, [r5, #44]
	beq	.L1431
	ldrd	r2, [r4, #4]
	strd	r2, [r5, #4]
	ldr	r3, [r6, #168]
	ldr	r3, [r3, #160]
	ldr	r3, [r3]
	cmp	r3, #3
	beq	.L1432
	cmp	r3, #5
	beq	.L1449
.L1433:
	ldr	r3, [r4, #536]
	add	r0, r5, #12
	cmp	r3, #1
	beq	.L1450
	bl	getnstimeofday
.L1434:
	ldr	r3, [r4, #164]
	ldr	r3, [r3]
	str	r3, [r5, #20]
	ldr	r3, [r4, #160]
	ldr	r3, [r3, #8]
	str	r3, [r5, #24]
	ldr	r3, [r6, #48]
	ldr	r2, [r4, #164]
	cmp	r3, #0
	ldr	r3, [r4, #160]
	bne	.L1436
	ldr	r3, [r3, #8]
	ldr	r0, [r4, #68]
	ldr	r2, [r2]
	ldr	r1, [r4, #132]
	add	r3, r3, r0
	subs	r3, r3, r2
	addmi	r3, r1, r3
	bmi	.L1438
	cmp	r1, r3
	subls	r3, r3, r1
.L1438:
	str	r3, [r5, #32]
	ldr	r2, [r4, #160]
	ldr	r2, [r2]
	sub	r2, r2, #3
	bics	r2, r2, #2
	beq	.L1451
.L1439:
	mov	r3, #0
	str	r3, [r5, #28]
.L1440:
	ldr	r2, [r4, #16]
	mov	r3, #0
	str	r2, [r5, #36]
	ldr	r2, [r4, #12]
	str	r2, [r5, #40]
	str	r3, [r4, #12]
	str	r3, [r4, #16]
.L1431:
	mov	r0, r7
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	ldrd	r4, [sp]
	mov	r0, #0
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L1436:
	ldr	r2, [r2]
	ldr	r3, [r3, #8]
	subs	r3, r3, r2
	ldrmi	r2, [r4, #132]
	addmi	r3, r3, r2
	str	r3, [r5, #32]
	ldr	r2, [r4, #160]
	ldr	r2, [r2]
	cmp	r2, #3
	bne	.L1439
	ldr	r2, [r4, #36]
	add	r3, r2, r3
	str	r3, [r5, #28]
	b	.L1440
.L1451:
	ldr	r2, [r4, #68]
	sub	r3, r2, r3
	str	r3, [r5, #28]
	ldr	r2, [r4, #36]
	add	r3, r2, r3
	str	r3, [r5, #28]
	b	.L1440
.L1449:
	ldr	r3, [r6, #48]
	cmp	r3, #0
	bne	.L1433
.L1432:
	mov	r0, r6
	bl	snd_pcm_update_hw_ptr
	ldr	r3, [r4, #108]
	cmp	r3, #1
	bne	.L1433
	ldr	r3, [r4, #160]
	ldrd	r2, [r3, #12]
	strd	r2, [r5, #12]
	b	.L1434
.L1450:
	bl	ktime_get_ts
	b	.L1434
	.fnend
	.size	snd_pcm_status, .-snd_pcm_status
	.align	2
	.global	snd_pcm_start
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_start, %function
snd_pcm_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, r0
	mov	r2, #3
	ldr	r0, .L1453
	b	snd_pcm_action
.L1454:
	.align	2
.L1453:
	.word	.LANCHOR1+132
	.fnend
	.size	snd_pcm_start, .-snd_pcm_start
	.align	2
	.global	snd_pcm_stop
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_stop, %function
snd_pcm_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, r1
	mov	r1, r0
	ldr	r0, .L1456
	b	snd_pcm_action
.L1457:
	.align	2
.L1456:
	.word	.LANCHOR1+84
	.fnend
	.size	snd_pcm_stop, .-snd_pcm_stop
	.align	2
	.global	snd_pcm_drain_done
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_drain_done, %function
snd_pcm_drain_done:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR1
	mov	r1, #1
	movt	r4, #:upper16:.LANCHOR1
	str	r6, [sp, #8]
	mov	r6, r0
	ldr	r3, [r4, #84]
	str	lr, [sp, #12]
	blx	r3
	subs	r5, r0, #0
	blt	.L1458
	mov	r1, #1
	mov	r0, r6
	ldr	r3, [r4, #88]
	blx	r3
	subs	r5, r0, #0
	bne	.L1460
	mov	r0, r6
	mov	r1, #1
	ldr	r3, [r4, #96]
	blx	r3
.L1458:
	mov	r0, r5
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L1460:
	ldr	r3, [r4, #92]
	cmp	r3, #0
	beq	.L1458
	mov	r0, r6
	mov	r1, #1
	blx	r3
	b	.L1458
	.fnend
	.size	snd_pcm_drain_done, .-snd_pcm_drain_done
	.align	2
	.global	snd_pcm_suspend
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_suspend, %function
snd_pcm_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	subs	r4, r0, #0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	beq	.L1465
	movw	r0, #:lower16:.LANCHOR0
	add	r5, r4, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irqsave
	mov	r6, r0
	mov	r0, r5
	bl	_raw_spin_lock
	mov	r1, r4
	mov	r2, #0
	ldr	r0, .L1469
	bl	snd_pcm_action
	mov	r4, r0
	mov	r0, r5
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	mov	r1, r6
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irqrestore
.L1465:
	mov	r0, r4
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L1470:
	.align	2
.L1469:
	.word	.LANCHOR1+180
	.fnend
	.size	snd_pcm_suspend, .-snd_pcm_suspend
	.align	2
	.global	snd_pcm_suspend_all
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_suspend_all, %function
snd_pcm_suspend_all:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	subs	r8, r0, #0
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	.pad #12
	sub	sp, sp, #12
	beq	.L1472
	movw	r6, #:lower16:.LANCHOR0
	movw	r9, #:lower16:.LANCHOR1
	add	r3, r8, #72
	movt	r6, #:upper16:.LANCHOR0
	movt	r9, #:upper16:.LANCHOR1
	str	r3, [sp, #4]
.L1483:
	ldr	r4, [r8, #184]
	cmp	r4, #0
	beq	.L1473
	ldr	r10, .L1497
	b	.L1482
.L1496:
	bl	_raw_spin_trylock
	cmp	r0, #0
	bne	.L1477
	mov	r0, r5
	bl	_raw_spin_unlock
	ldr	r0, [r4, #208]
	bl	_raw_spin_lock
	mov	r0, r5
	bl	_raw_spin_lock
.L1477:
	mov	r3, #1
	mov	r2, #0
	mov	r1, r4
	mov	r0, r10
	bl	snd_pcm_action_group
	mov	fp, r0
	ldr	r0, [r4, #208]
	bl	_raw_spin_unlock
.L1478:
	mov	r0, r5
	bl	_raw_spin_unlock
	mov	r1, r7
	mov	r0, r6
	bl	_raw_read_unlock_irqrestore
	adds	r2, fp, #16
	movne	r2, #1
	ands	r3, r2, fp, lsr #31
	bne	.L1471
.L1475:
	ldr	r4, [r4, #180]
	cmp	r4, #0
	beq	.L1473
.L1482:
	ldr	r3, [r4, #168]
	cmp	r3, #0
	beq	.L1475
	mov	r0, r6
	add	r5, r4, #192
	bl	_raw_read_lock_irqsave
	mov	r7, r0
	mov	r0, r5
	bl	_raw_spin_lock
	ldr	r0, [r4, #208]
	cmp	r5, r0
	bne	.L1496
	mov	r1, #0
	mov	r0, r4
	ldr	r3, [r9, #180]
	blx	r3
	subs	fp, r0, #0
	blt	.L1478
	mov	r1, #0
	mov	r0, r4
	ldr	r3, [r9, #184]
	blx	r3
	subs	fp, r0, #0
	bne	.L1479
	mov	r1, fp
	mov	r0, r4
	ldr	r3, [r9, #192]
	blx	r3
	mov	r0, r5
	bl	_raw_spin_unlock
	mov	r1, r7
	mov	r0, r6
	bl	_raw_read_unlock_irqrestore
	ldr	r4, [r4, #180]
	cmp	r4, #0
	bne	.L1482
.L1473:
	ldr	r3, [sp, #4]
	add	r8, r8, #36
	cmp	r3, r8
	bne	.L1483
.L1472:
	mov	fp, #0
.L1471:
	mov	r0, fp
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1479:
	ldr	r2, [r9, #188]
	cmp	r2, #0
	beq	.L1478
	mov	r1, #0
	mov	r0, r4
	blx	r2
	b	.L1478
.L1498:
	.align	2
.L1497:
	.word	.LANCHOR1+180
	.fnend
	.size	snd_pcm_suspend_all, .-snd_pcm_suspend_all
	.align	2
	.global	snd_pcm_hw_constraints_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_hw_constraints_init, %function
snd_pcm_hw_constraints_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r3, #0
	mvn	r2, #0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r4, [r0, #168]
	.pad #20
	sub	sp, sp, #20
	ldrb	r6, [r4, #376]	@ zero_extendqisi2
	str	r2, [r4, #272]	@ unaligned
	ldrb	r5, [r4, #388]	@ zero_extendqisi2
	str	r2, [r4, #276]	@ unaligned
	ldrb	r1, [r4, #400]	@ zero_extendqisi2
	str	r2, [r4, #304]	@ unaligned
	ldrb	lr, [r4, #412]	@ zero_extendqisi2
	str	r2, [r4, #308]	@ unaligned
	ldrb	ip, [r4, #424]	@ zero_extendqisi2
	and	r6, r6, #248
	str	r2, [r4, #336]	@ unaligned
	ldrb	r0, [r4, #436]	@ zero_extendqisi2
	and	r5, r5, #248
	bfi	r6, r3, #3, #1
	and	r1, r1, #248
	bfi	r5, r3, #3, #1
	str	r2, [r4, #340]	@ unaligned
	and	lr, lr, #248
	bfi	r1, r3, #3, #1
	str	r3, [r4, #368]
	and	ip, ip, #248
	bfi	lr, r3, #3, #1
	str	r2, [r4, #372]
	bfi	ip, r3, #3, #1
	and	r0, r0, #248
	strb	r6, [r4, #376]
	bfi	r0, r3, #3, #1
	str	r3, [r4, #380]
	str	r2, [r4, #384]
	strb	r5, [r4, #388]
	str	r3, [r4, #392]
	str	r2, [r4, #396]
	strb	r1, [r4, #400]
	uxtb	r1, r1
	str	r3, [r4, #404]
	str	r2, [r4, #408]
	tst	r1, #4
	strb	lr, [r4, #412]
	orreq	r1, r1, #4
	str	r3, [r4, #416]
	str	r2, [r4, #420]
	strb	ip, [r4, #424]
	ldrb	lr, [r4, #484]	@ zero_extendqisi2
	ldrb	r7, [r4, #448]	@ zero_extendqisi2
	str	r3, [r4, #428]
	ldrb	r6, [r4, #460]	@ zero_extendqisi2
	strb	r0, [r4, #436]
	ldrb	r5, [r4, #472]	@ zero_extendqisi2
	strbeq	r1, [r4, #400]
	ldrb	ip, [r4, #496]	@ zero_extendqisi2
	and	lr, lr, #248
	str	r3, [r4, #440]
	ldrb	r0, [r4, #508]	@ zero_extendqisi2
	bfi	lr, r3, #3, #1
	and	r7, r7, #248
	and	r6, r6, #248
	bfi	r7, r3, #3, #1
	str	r3, [r4, #452]
	and	r5, r5, #248
	bfi	r6, r3, #3, #1
	str	r3, [r4, #464]
	and	ip, ip, #248
	bfi	r5, r3, #3, #1
	str	r3, [r4, #476]
	and	r0, r0, #248
	bfi	ip, r3, #3, #1
	str	r3, [r4, #488]
	bfi	r0, r3, #3, #1
	strb	lr, [r4, #484]
	str	r3, [r4, #500]
	ldrb	r3, [r4, #484]	@ zero_extendqisi2
	str	r2, [r4, #432]
	str	r2, [r4, #444]
	strb	r7, [r4, #448]
	tst	r3, #4
	str	r2, [r4, #456]
	strb	r6, [r4, #460]
	str	r2, [r4, #468]
	strb	r5, [r4, #472]
	str	r2, [r4, #480]
	str	r2, [r4, #492]
	strb	ip, [r4, #496]
	str	r2, [r4, #504]
	strb	r0, [r4, #508]
	bne	.L1502
	and	r3, r3, #3
	cmp	r3, #3
	beq	.L1512
	ldrb	r3, [r4, #484]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r4, #484]
.L1502:
	ldrb	r3, [r4, #496]	@ zero_extendqisi2
	tst	r3, #4
	bne	.L1504
	and	r3, r3, #3
	cmp	r3, #3
	beq	.L1513
	ldrb	r3, [r4, #496]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r4, #496]
.L1504:
	ldrb	r3, [r4, #376]	@ zero_extendqisi2
	tst	r3, #4
	bne	.L1506
	and	r3, r3, #3
	cmp	r3, #3
	beq	.L1514
	ldrb	r3, [r4, #376]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r4, #376]
.L1506:
	ldrb	r3, [r4, #388]	@ zero_extendqisi2
	tst	r3, #4
	bne	.L1508
	and	r3, r3, #3
	cmp	r3, #3
	beq	.L1515
	ldrb	r3, [r4, #388]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r4, #388]
.L1508:
	mov	r5, #0
	mvn	r7, #0
	mov	r6, #8
	movw	r3, #:lower16:snd_pcm_hw_rule_format
	mov	r1, r5
	movt	r3, #:upper16:snd_pcm_hw_rule_format
	mov	r2, #1
	mov	r0, r4
	stm	sp, {r5, r6, r7}
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1499
	mov	r1, #1
	movw	r3, #:lower16:snd_pcm_hw_rule_sample_bits
	str	r5, [sp]
	movt	r3, #:upper16:snd_pcm_hw_rule_sample_bits
	mov	r2, r6
	stmib	sp, {r1, r6, r7}
	mov	r0, r4
	mov	r1, r5
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1499
	mov	r9, #10
	mov	r8, #9
	movw	r3, #:lower16:snd_pcm_hw_rule_div
	mov	r2, r6
	movt	r3, #:upper16:snd_pcm_hw_rule_div
	mov	r1, r5
	str	r7, [sp, #12]
	mov	r0, r4
	stm	sp, {r5, r8, r9}
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1499
	movw	r3, #:lower16:snd_pcm_hw_rule_mul
	mov	r2, r8
	movt	r3, #:upper16:snd_pcm_hw_rule_mul
	mov	r1, r5
	str	r7, [sp, #12]
	mov	r0, r4
	stm	sp, {r5, r6, r9}
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1499
	mov	r1, #14
	mov	r10, #13
	str	r6, [sp]
	movw	r3, #:lower16:snd_pcm_hw_rule_mulkdiv
	mov	r2, r8
	stmib	sp, {r1, r10}
	movt	r3, #:upper16:snd_pcm_hw_rule_mulkdiv
	mov	r0, r4
	str	r7, [sp, #12]
	mov	r1, r5
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1499
	mov	r1, #18
	mov	fp, #17
	str	r6, [sp]
	movw	r3, #:lower16:snd_pcm_hw_rule_mulkdiv
	mov	r2, r8
	stmib	sp, {r1, fp}
	movt	r3, #:upper16:snd_pcm_hw_rule_mulkdiv
	mov	r0, r4
	str	r7, [sp, #12]
	mov	r1, r5
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1499
	movw	r3, #:lower16:snd_pcm_hw_rule_div
	mov	r2, r9
	stm	sp, {r5, r8}
	movt	r3, #:upper16:snd_pcm_hw_rule_div
	mov	r1, r5
	strd	r6, [sp, #8]
	mov	r0, r4
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1499
	movw	r6, #16960
	mov	r2, #12
	movt	r6, 15
	movw	r3, #:lower16:snd_pcm_hw_rule_mulkdiv
	movt	r3, #:upper16:snd_pcm_hw_rule_mulkdiv
	mov	r1, r5
	stm	sp, {r6, r10}
	mov	r0, r4
	str	r2, [sp, #8]
	mov	r2, #11
	str	r7, [sp, #12]
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1499
	mov	r1, #16
	movw	r3, #:lower16:snd_pcm_hw_rule_mulkdiv
	stm	sp, {r6, fp}
	movt	r3, #:upper16:snd_pcm_hw_rule_mulkdiv
	mov	r2, #11
	str	r1, [sp, #8]
	mov	r0, r4
	mov	r1, r5
	str	r7, [sp, #12]
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1499
	movw	r3, #:lower16:snd_pcm_hw_rule_div
	mov	r1, r5
	stm	sp, {r5, fp}
	movt	r3, #:upper16:snd_pcm_hw_rule_div
	mov	r2, #15
	str	r10, [sp, #8]
	mov	r0, r4
	str	r7, [sp, #12]
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1499
	mov	r6, r7
	mov	fp, #15
	mov	r7, #17
	movw	r3, #:lower16:snd_pcm_hw_rule_div
	mov	r1, r5
	movt	r3, #:upper16:snd_pcm_hw_rule_div
	mov	r2, r10
	mov	r0, r4
	stm	sp, {r5, r7, fp}
	str	r6, [sp, #12]
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1499
	mov	r2, #14
	mov	r9, r8
	mov	r10, #8
	movw	r3, #:lower16:snd_pcm_hw_rule_mulkdiv
	movt	r3, #:upper16:snd_pcm_hw_rule_mulkdiv
	mov	r1, r5
	str	r10, [sp]
	mov	r0, r4
	stmib	sp, {r2, r9}
	mov	r2, #13
	str	r6, [sp, #12]
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1499
	movw	r8, #16960
	mov	r2, #11
	mov	r0, #12
	movt	r8, 15
	movw	r3, #:lower16:snd_pcm_hw_rule_muldivk
	mov	r1, r5
	movt	r3, #:upper16:snd_pcm_hw_rule_muldivk
	str	r8, [sp]
	stmib	sp, {r0, r2, r6}
	mov	r2, #13
	mov	r0, r4
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1499
	mov	r1, #13
	movw	r3, #:lower16:snd_pcm_hw_rule_mul
	str	r5, [sp]
	movt	r3, #:upper16:snd_pcm_hw_rule_mul
	mov	r2, r7
	stmib	sp, {r1, fp}
	mov	r0, r4
	mov	r1, r5
	str	r6, [sp, #12]
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1499
	mov	fp, #18
	movw	r3, #:lower16:snd_pcm_hw_rule_mulkdiv
	movt	r3, #:upper16:snd_pcm_hw_rule_mulkdiv
	mov	r2, r7
	mov	r1, r5
	mov	r0, r4
	strd	r10, [sp]
	str	r9, [sp, #8]
	str	r6, [sp, #12]
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1499
	mov	r2, #11
	mov	r0, #16
	str	r8, [sp]
	movw	r3, #:lower16:snd_pcm_hw_rule_muldivk
	mov	r1, r5
	stmib	sp, {r0, r2, r6}
	movt	r3, #:upper16:snd_pcm_hw_rule_muldivk
	mov	r2, r7
	mov	r0, r4
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1499
	mov	r1, #13
	movw	r3, #:lower16:snd_pcm_hw_rule_muldivk
	str	r10, [sp]
	mov	r2, #14
	movt	r3, #:upper16:snd_pcm_hw_rule_muldivk
	stmib	sp, {r1, r9}
	mov	r0, r4
	mov	r1, r5
	str	r6, [sp, #12]
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1499
	movw	r3, #:lower16:snd_pcm_hw_rule_muldivk
	mov	r2, fp
	str	r10, [sp]
	movt	r3, #:upper16:snd_pcm_hw_rule_muldivk
	mov	r1, r5
	stmib	sp, {r7, r9}
	mov	r0, r4
	str	r6, [sp, #12]
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1499
	mov	r1, #13
	mov	r9, #11
	str	r8, [sp]
	movw	r3, #:lower16:snd_pcm_hw_rule_mulkdiv
	mov	r2, #12
	stmib	sp, {r1, r9}
	movt	r3, #:upper16:snd_pcm_hw_rule_mulkdiv
	mov	r0, r4
	str	r6, [sp, #12]
	mov	r1, r5
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1499
	movw	r3, #:lower16:snd_pcm_hw_rule_mulkdiv
	mov	r2, #16
	str	r8, [sp]
	mov	r1, r5
	mov	r0, r4
	stmib	sp, {r7, r9}
	movt	r3, #:upper16:snd_pcm_hw_rule_mulkdiv
	str	r6, [sp, #12]
	bl	snd_pcm_hw_rule_add
	and	r0, r0, r0, asr #31
.L1499:
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1513:
	ldr	r2, [r4, #488]
	ldr	r3, [r4, #492]
	cmp	r2, r3
	beq	.L1504
	ldrb	r3, [r4, #496]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r4, #496]
	b	.L1504
.L1514:
	ldr	r2, [r4, #368]
	ldr	r3, [r4, #372]
	cmp	r2, r3
	beq	.L1506
	ldrb	r3, [r4, #376]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r4, #376]
	b	.L1506
.L1515:
	ldr	r2, [r4, #380]
	ldr	r3, [r4, #384]
	cmp	r2, r3
	beq	.L1508
	ldrb	r3, [r4, #388]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r4, #388]
	b	.L1508
.L1512:
	ldr	r2, [r4, #476]
	ldr	r3, [r4, #480]
	cmp	r2, r3
	beq	.L1502
	ldrb	r3, [r4, #484]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r4, #484]
	b	.L1502
	.fnend
	.size	snd_pcm_hw_constraints_init, .-snd_pcm_hw_constraints_init
	.align	2
	.global	snd_pcm_hw_constraints_complete
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_hw_constraints_complete, %function
snd_pcm_hw_constraints_complete:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r4, [r0, #168]
	.pad #52
	sub	sp, sp, #52
	ldr	r3, [r4, #208]
	and	ip, r3, #256
	cmp	ip, #0
	movne	r10, #30
	moveq	r10, #22
	movne	r2, #8
	moveq	r2, #0
	str	r10, [sp, #24]
	movne	r10, #26
	moveq	r10, #18
	movne	r6, #12
	moveq	r6, #4
	str	r10, [sp, #20]
	movne	r10, #29
	moveq	r10, #21
	movne	r0, #14
	moveq	r0, #6
	str	r10, [sp, #32]
	movne	r10, #31
	moveq	r10, #23
	movne	lr, #10
	moveq	lr, #2
	str	r10, [sp, #28]
	movne	r10, #27
	moveq	r10, #19
	movne	r9, #13
	moveq	r9, #5
	str	r10, [sp, #40]
	movne	r10, #25
	moveq	r10, #17
	movne	r8, #15
	moveq	r8, #7
	str	r10, [sp, #36]
	movne	r10, #24
	moveq	r10, #16
	movne	r7, #11
	moveq	r7, #3
	movne	r1, #9
	moveq	r1, #1
	str	r10, [sp, #44]
	movne	fp, #28
	moveq	fp, #20
	ands	r10, r3, #512
	beq	.L1518
	add	r0, sp, #24
	ldr	lr, [sp, #20]
	mov	r6, fp
	ldm	r0, {r0, r8, r9}
	ldr	r1, [sp, #36]
	ldr	r7, [sp, #40]
	ldr	r2, [sp, #44]
.L1518:
	tst	r3, #1
	beq	.L1519
	cmp	ip, #0
	moveq	r1, r2
	moveq	r2, r6
	bne	.L1539
.L1520:
	cmp	r10, #0
	movne	r2, r0
	movne	r1, lr
	tst	r3, #1024
	moveq	r2, r1
.L1519:
	mov	r1, #0
	mov	r0, r4
	bl	snd_pcm_hw_constraint_mask
	cmp	r0, #0
	blt	.L1516
	mov	r1, #1
	mov	r0, r4
	ldrd	r2, [r4, #216]
	bl	snd_pcm_hw_constraint_mask64
	cmp	r0, #0
	blt	.L1516
	mov	r2, #1
	mov	r1, #2
	mov	r0, r4
	bl	snd_pcm_hw_constraint_mask
	cmp	r0, #0
	blt	.L1516
	mov	r1, #10
	mov	r0, r4
	ldrd	r2, [r4, #236]
	bl	snd_pcm_hw_constraint_minmax
	cmp	r0, #0
	blt	.L1516
	mov	r1, #11
	mov	r0, r4
	ldrd	r2, [r4, #228]
	bl	snd_pcm_hw_constraint_minmax
	cmp	r0, #0
	blt	.L1516
	mov	r1, #14
	mov	r0, r4
	ldrd	r2, [r4, #248]
	bl	snd_pcm_hw_constraint_minmax
	cmp	r0, #0
	blt	.L1516
	mov	r1, #15
	mov	r0, r4
	ldr	r2, [r4, #256]
	ldr	r3, [r4, #260]
	bl	snd_pcm_hw_constraint_minmax
	cmp	r0, #0
	blt	.L1516
	mov	r1, #18
	mov	r0, r4
	ldr	r3, [r4, #244]
	ldr	r2, [r4, #248]
	bl	snd_pcm_hw_constraint_minmax
	cmp	r0, #0
	blt	.L1516
	mov	r1, #18
	mvn	r0, #0
	str	r5, [sp]
	movw	r3, #:lower16:snd_pcm_hw_rule_buffer_bytes_max
	mov	r2, r1
	str	r1, [sp, #4]
	movt	r3, #:upper16:snd_pcm_hw_rule_buffer_bytes_max
	mov	r1, #0
	str	r0, [sp, #8]
	mov	r0, r4
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1516
	ldr	r3, [r4, #548]
	cmp	r3, #0
	bne	.L1523
.L1526:
	ldr	r3, [r4, #224]
	ands	r1, r3, #-1073741824
	bne	.L1525
	mvn	ip, #0
	mov	r2, #11
	add	r0, r4, #208
	movw	r3, #:lower16:snd_pcm_hw_rule_rate
	movt	r3, #:upper16:snd_pcm_hw_rule_rate
	stm	sp, {r0, r2, ip}
	mov	r0, r4
	bl	snd_pcm_hw_rule_add
	cmp	r0, #0
	blt	.L1516
.L1525:
	mov	r0, r4
	mov	r1, #13
	bl	snd_pcm_hw_constraint_integer
	mov	r0, #0
.L1516:
	add	sp, sp, #52
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1539:
	mov	r2, r9
	mov	r0, r8
	mov	lr, r7
	b	.L1520
.L1523:
	mov	r2, #0
	mov	r1, #18
	mov	r0, r4
	bl	snd_pcm_hw_constraint_minmax
	cmp	r0, #0
	bge	.L1526
	mvn	r0, #21
	b	.L1516
	.fnend
	.size	snd_pcm_hw_constraints_complete, .-snd_pcm_hw_constraints_complete
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_open.part.9, %function
snd_pcm_open.part.9:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r3, #:lower16:default_wake_function
	strd	r6, [sp, #8]
	mov	r7, #57344
	movt	r3, #:upper16:default_wake_function
	strd	r8, [sp, #16]
	movt	r7, 65535
	mov	r8, r1
	strd	r10, [sp, #24]
	add	r9, r8, #264
	mov	r6, r0
	str	lr, [sp, #32]
	.pad #28
	sub	sp, sp, #28
	mov	lr, #0
	mov	r1, sp
	mov	r0, r9
	and	r1, r1, r7
	add	r5, r8, #240
	str	lr, [sp, #4]
	ldr	ip, [r1, #12]
	add	r1, sp, #4
	mov	r10, r2
	mov	fp, #1
	str	ip, [sp, #8]
	str	r3, [sp, #12]
	bl	add_wait_queue
	mov	r0, r5
	bl	mutex_lock
.L1552:
	mov	r3, sp
	mov	r2, r6
	mov	r1, r10
	mov	r0, r8
	bl	snd_pcm_attach_substream
	subs	r4, r0, #0
	blt	.L1541
	ldr	r4, [sp]
	ldr	r3, [r4, #216]
	cmp	r3, #1
	ble	.L1561
.L1543:
	movw	r3, #:lower16:kmalloc_caches
	movt	r3, #:upper16:kmalloc_caches
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L1554
	mov	r2, #8
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	cmp	r0, #0
	beq	.L1562
.L1549:
	str	r4, [r0]
	ldr	r3, [r4, #216]
	cmp	r3, #1
	bne	.L1550
	movw	r3, #:lower16:pcm_release_private
	str	r0, [r4, #212]
	movt	r3, #:upper16:pcm_release_private
	str	r3, [r4, #228]
.L1550:
	str	r0, [r6, #124]
	add	r1, sp, #4
	mov	r0, r9
	bl	remove_wait_queue
	mov	r0, r5
	mov	r4, #0
	bl	mutex_unlock
.L1540:
	mov	r0, r4
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1561:
	mov	r0, r4
	bl	snd_pcm_hw_constraints_init
	subs	r4, r0, #0
	blt	.L1544
	ldr	r0, [sp]
	ldr	r3, [r0, #164]
	cmp	r3, #0
	beq	.L1545
	ldr	r3, [r3]
	blx	r3
	subs	r4, r0, #0
	blt	.L1544
	ldr	r3, [sp]
	ldrb	r2, [r3, #264]	@ zero_extendqisi2
	mov	r0, r3
	orr	r2, r2, #1
	strb	r2, [r3, #264]
	bl	snd_pcm_hw_constraints_complete
	subs	r4, r0, #0
	bge	.L1563
.L1544:
	ldr	r0, [sp]
	ldr	r3, [r0, #216]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r0, #216]
	bgt	.L1541
	bl	snd_pcm_release_substream.part.8
.L1541:
	cmn	r4, #11
	bne	.L1548
	ldr	r3, [r6, #32]
	tst	r3, #2048
	bne	.L1556
	mov	r3, sp
	and	r3, r3, r7
	ldr	r3, [r3, #12]
	str	fp, [r3]
	.syntax divided
@ 2200 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	dmb
@ 0 "" 2
	.arm
	.syntax unified
	mov	r0, r5
	bl	mutex_unlock
	bl	schedule
	mov	r0, r5
	bl	mutex_lock
	ldr	r3, [r8]
	ldr	r3, [r3, #476]
	cmp	r3, #0
	bne	.L1557
	mov	r3, sp
	and	r3, r3, r7
	ldr	r3, [r3, #12]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	tst	r3, #1
	beq	.L1552
	mov	r4, #65024
	movt	r4, 65535
.L1548:
	add	r1, sp, #4
	mov	r0, r9
	bl	remove_wait_queue
	mov	r0, r5
	bl	mutex_unlock
	mov	r1, r6
	ldr	r0, [r8]
	bl	snd_card_file_remove
	b	.L1540
.L1554:
	mov	r0, #16
	b	.L1549
.L1562:
	ldr	r3, [r4, #216]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #216]
	mvngt	r4, #11
	bgt	.L1548
	mov	r0, r4
	mvn	r4, #11
.L1560:
	bl	snd_pcm_release_substream.part.8
	b	.L1548
.L1563:
	ldr	r4, [sp]
	b	.L1543
.L1556:
	mvn	r4, #15
	b	.L1548
.L1557:
	mvn	r4, #18
	b	.L1548
.L1545:
	ldr	r3, [r0, #216]
	mvn	r4, #18
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r0, #216]
	bgt	.L1548
	b	.L1560
	.fnend
	.size	snd_pcm_open.part.9, .-snd_pcm_open.part.9
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_capture_open, %function
snd_pcm_capture_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r0
	str	r6, [sp, #8]
	mov	r6, r1
	str	lr, [sp, #12]
	bl	nonseekable_open
	subs	r4, r0, #0
	blt	.L1564
	ldr	r0, [r5, #48]
	mov	r1, #6
	ubfx	r0, r0, #0, #20
	bl	snd_lookup_minor_data
	subs	r5, r0, #0
	beq	.L1567
	mov	r1, r6
	ldr	r0, [r5]
	bl	snd_card_file_add
	subs	r4, r0, #0
	blt	.L1566
	mov	r0, r6
	mov	r2, #1
	mov	r1, r5
	bl	snd_pcm_open.part.9
	mov	r4, r0
.L1566:
	ldr	r0, [r5]
	bl	snd_card_unref
.L1564:
	mov	r0, r4
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L1567:
	mvn	r4, #18
	b	.L1564
	.fnend
	.size	snd_pcm_capture_open, .-snd_pcm_capture_open
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_playback_open, %function
snd_pcm_playback_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r0
	str	r6, [sp, #8]
	mov	r6, r1
	str	lr, [sp, #12]
	bl	nonseekable_open
	subs	r4, r0, #0
	blt	.L1569
	ldr	r0, [r5, #48]
	mov	r1, #5
	ubfx	r0, r0, #0, #20
	bl	snd_lookup_minor_data
	subs	r5, r0, #0
	beq	.L1572
	mov	r1, r6
	ldr	r0, [r5]
	bl	snd_card_file_add
	subs	r4, r0, #0
	blt	.L1571
	mov	r0, r6
	mov	r2, #0
	mov	r1, r5
	bl	snd_pcm_open.part.9
	mov	r4, r0
.L1571:
	ldr	r0, [r5]
	bl	snd_card_unref
.L1569:
	mov	r0, r4
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L1572:
	mvn	r4, #18
	b	.L1569
	.fnend
	.size	snd_pcm_playback_open, .-snd_pcm_playback_open
	.align	2
	.global	snd_pcm_release_substream
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_release_substream, %function
snd_pcm_release_substream:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #216]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r0, #216]
	bxgt	lr
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r6, [r0, #168]
	ldr	r3, [r6, #160]
	ldr	r5, [r3]
	sub	r3, r5, #7
	cmp	r5, #0
	cmpne	r3, #1
	movls	r5, #1
	movhi	r5, #0
	bls	.L1576
	movw	r0, #:lower16:.LANCHOR0
	add	r7, r4, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r7
	bl	_raw_spin_lock
	ldr	r3, [r6, #160]
	ldr	r3, [r3]
	cmp	r3, #6
	beq	.L1597
.L1577:
	mov	r2, #1
	mov	r1, r4
	ldr	r0, .L1599
	bl	snd_pcm_action
	mov	r0, r7
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
.L1576:
	ldrb	r3, [r4, #264]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L1578
	ldr	r3, [r4, #164]
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L1579
	mov	r0, r4
	blx	r2
	ldr	r3, [r4, #164]
.L1579:
	ldr	r3, [r3, #4]
	mov	r0, r4
	blx	r3
	ldrb	r3, [r4, #264]	@ zero_extendqisi2
	bfc	r3, #0, #1
	strb	r3, [r4, #264]
.L1578:
	add	r5, r4, #52
	mov	r0, r5
	bl	pm_qos_request_active
	cmp	r0, #0
	bne	.L1598
.L1580:
	ldr	r3, [r4, #228]
	cmp	r3, #0
	beq	.L1581
	mov	r0, r4
	blx	r3
	mov	r3, #0
	str	r3, [r4, #228]
.L1581:
	mov	r0, r4
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	snd_pcm_detach_substream
.L1598:
	mov	r0, r5
	bl	pm_qos_remove_request
	b	.L1580
.L1597:
	mov	r2, r5
	mov	r1, r4
	ldr	r0, .L1599+4
	bl	snd_pcm_action
	b	.L1577
.L1600:
	.align	2
.L1599:
	.word	.LANCHOR1+84
	.word	.LANCHOR1+68
	.fnend
	.size	snd_pcm_release_substream, .-snd_pcm_release_substream
	.align	2
	.global	snd_pcm_open_substream
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_open_substream, %function
snd_pcm_open_substream:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	mov	r5, r3
	str	lr, [sp, #8]
	.pad #12
	sub	sp, sp, #12
	add	r3, sp, #4
	bl	snd_pcm_attach_substream
	subs	r4, r0, #0
	blt	.L1601
	ldr	r0, [sp, #4]
	ldr	r3, [r0, #216]
	cmp	r3, #1
	ble	.L1603
	mov	r4, #0
	str	r0, [r5]
.L1601:
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L1603:
	bl	snd_pcm_hw_constraints_init
	subs	r4, r0, #0
	ldr	r0, [sp, #4]
	blt	.L1605
	ldr	r3, [r0, #164]
	cmp	r3, #0
	beq	.L1608
	ldr	r3, [r3]
	blx	r3
	subs	r4, r0, #0
	bge	.L1606
.L1610:
	ldr	r0, [sp, #4]
.L1605:
	ldr	r3, [r0, #216]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r0, #216]
	bgt	.L1601
	bl	snd_pcm_release_substream.part.8
	b	.L1601
.L1606:
	ldr	r3, [sp, #4]
	ldrb	r2, [r3, #264]	@ zero_extendqisi2
	mov	r0, r3
	orr	r2, r2, #1
	strb	r2, [r3, #264]
	bl	snd_pcm_hw_constraints_complete
	subs	r4, r0, #0
	blt	.L1610
	ldr	r3, [sp, #4]
	mov	r4, #0
	str	r3, [r5]
	b	.L1601
.L1608:
	mvn	r4, #18
	b	.L1605
	.fnend
	.size	snd_pcm_open_substream, .-snd_pcm_open_substream
	.align	2
	.global	snd_pcm_kernel_ioctl
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_kernel_ioctl, %function
snd_pcm_kernel_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-28]!
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r4, #57344
	mov	r5, r0
	strd	r6, [sp, #8]
	movt	r4, 65535
	mov	r3, #0
	strd	r8, [sp, #16]
	mov	r6, r2
	str	lr, [sp, #24]
	.pad #20
	sub	sp, sp, #20
	mov	r0, sp
	and	r0, r0, r4
	ldr	r7, [r0, #8]
	str	r3, [r0, #8]
	ldr	r2, [r5, #48]
	cmp	r2, r3
	beq	.L1613
	cmp	r2, #1
	bne	.L1713
	movw	r2, #16713
	movt	r2, 16388
	cmp	r1, r2
	beq	.L1654
	bls	.L1721
	movw	r2, #16721
	movt	r2, 32780
	cmp	r1, r2
	beq	.L1657
	movw	r2, #16723
	movt	r2, 32780
	cmp	r1, r2
	bne	.L1615
	ldr	r8, [r5, #168]
	ldr	r2, [r8, #160]
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L1703
	ldr	r2, [r8, #56]
	cmp	r2, #128
	bhi	.L1713
	mov	r2, r3
	mov	r0, r6
	mvn	r1, #0
	.syntax divided
@ 2773 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	mov	r3, sp
	bne	.L1720
	and	r4, r4, r3
	ldr	r3, [r4, #8]
	.syntax divided
@ 439 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r2, r6, #12; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	bne	.L1665
	mov	r2, #12
	mov	r1, r6
	add	r0, sp, #4
	bl	__copy_from_user
	subs	r4, r0, #0
	beq	.L1666
.L1717:
	mov	r3, sp
	mvn	r5, #13
	bic	r0, r3, #8128
	bic	r0, r0, #63
	b	.L1612
.L1713:
	mvn	r5, #21
.L1612:
	str	r7, [r0, #8]
	mov	r0, r5
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	add	sp, sp, #24
	ldr	pc, [sp], #4
.L1613:
	movw	r3, #16713
	movt	r3, 16388
	cmp	r1, r3
	beq	.L1616
	bls	.L1722
	movw	r3, #16720
	movt	r3, 16396
	cmp	r1, r3
	beq	.L1619
	movw	r3, #16722
	movt	r3, 16396
	cmp	r1, r3
	bne	.L1615
	ldr	r8, [r5, #168]
	ldr	r3, [r8, #160]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1703
	ldr	r3, [r8, #56]
	cmp	r3, #128
	bhi	.L1713
	mov	r0, r6
	mvn	r1, #0
	.syntax divided
@ 2693 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	mov	r3, sp
	bne	.L1720
	and	r3, r3, r4
	ldr	r3, [r3, #8]
	.syntax divided
@ 439 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r2, r6, #12; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	bne	.L1661
	mov	r2, #12
	mov	r1, r6
	add	r0, sp, #4
	bl	__copy_from_user
	cmp	r0, #0
	bne	.L1717
	ldr	r1, [r8, #56]
	ldr	r0, [sp, #8]
	lsl	r1, r1, #2
	bl	memdup_user
	cmn	r0, #4096
	mov	r4, r0
	movhi	r3, sp
	movhi	r5, r4
	bichi	r0, r3, #8128
	bichi	r0, r0, #63
	bhi	.L1612
	mov	r1, r4
	ldr	r2, [sp, #12]
	mov	r0, r5
	bl	snd_pcm_lib_writev
	mov	r5, r0
	mov	r0, r4
	bl	kfree
	mov	r3, #0
	.syntax divided
@ 2704 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	1:	str	r5,[r6],#0
2:
	.pushsection .fixup,"ax"
	.align	2
3:	mov	r3, #-14
	b	2b
	.popsection
	.pushsection __ex_table,"a"
	.align	3
	.long	1b, 3b
	.popsection
@ 0 "" 2
	.arm
	.syntax unified
	mov	r3, sp
	and	r5, r5, r5, asr #31
	bic	r0, r3, #8128
	bic	r0, r0, #63
	b	.L1612
.L1722:
	movw	r3, #16710
	movt	r3, 16388
	cmp	r1, r3
	bne	.L1615
	mov	r0, r6
	mvn	r1, #0
	.syntax divided
@ 2712 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__get_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	mov	r3, sp
	mov	r8, r2
	bne	.L1720
	and	r3, r3, r4
	mov	r2, r0
	ldr	r1, [r3, #8]
	mov	r0, r6
	sub	r1, r1, #1
	.syntax divided
@ 2714 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	bne	.L1719
	cmp	r8, #0
	bne	.L1723
.L1709:
	mov	r5, r8
.L1681:
	mov	r3, #0
	.syntax divided
@ 2810 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	1:	str	r8,[r6],#0
2:
	.pushsection .fixup,"ax"
	.align	2
3:	mov	r3, #-14
	b	2b
	.popsection
	.pushsection __ex_table,"a"
	.align	3
	.long	1b, 3b
	.popsection
@ 0 "" 2
	.arm
	.syntax unified
	mov	r3, sp
	bic	r0, r3, #8128
	bic	r0, r0, #63
	b	.L1612
.L1721:
	movw	r3, #16710
	movt	r3, 16388
	cmp	r1, r3
	bne	.L1615
	mov	r0, r6
	mvn	r1, #0
	.syntax divided
@ 2792 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__get_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	mov	r3, sp
	mov	r8, r2
	bne	.L1720
	and	r3, r3, r4
	mov	r2, r0
	ldr	r1, [r3, #8]
	mov	r0, r6
	sub	r1, r1, #1
	.syntax divided
@ 2794 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	bne	.L1719
	cmp	r8, #0
	beq	.L1709
	ldr	r9, [r5, #168]
	movw	r0, #:lower16:.LANCHOR0
	add	r4, r5, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r4
	bl	_raw_spin_lock
	ldr	r2, [r9, #160]
	ldr	r3, [r2]
	sub	r3, r3, #2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L1682
.L1673:
	.word	.L1672
	.word	.L1674
	.word	.L1710
	.word	.L1672
	.word	.L1682
	.word	.L1687
.L1657:
	ldr	r2, [r5, #168]
	ldr	r2, [r2, #160]
	ldr	r2, [r2]
	cmp	r2, #0
	bne	.L1724
.L1703:
	mvn	r5, #76
	b	.L1612
.L1649:
.L1615:
	mov	r3, r6
	mov	r2, r1
	mov	r0, #0
	mov	r1, r5
	bl	snd_pcm_common_ioctl1
	mov	r3, sp
	mov	r5, r0
	bic	r0, r3, #8128
	bic	r0, r0, #63
	b	.L1612
.L1724:
	mov	r2, r3
	mov	r0, r6
	mvn	r1, #0
	.syntax divided
@ 2754 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	mov	r3, sp
	bne	.L1720
	and	r3, r3, r4
	ldr	r3, [r3, #8]
	.syntax divided
@ 439 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r2, r6, #12; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	bne	.L1661
	mov	r2, #12
	mov	r1, r6
	add	r0, sp, #4
	bl	__copy_from_user
	subs	r8, r0, #0
	beq	.L1662
.L1719:
	mov	r3, sp
.L1720:
	and	r0, r3, r4
	mvn	r5, #13
	b	.L1612
.L1619:
	ldr	r3, [r5, #168]
	ldr	r3, [r3, #160]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1703
	mov	r0, r6
	mvn	r1, #0
	.syntax divided
@ 2674 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	mov	r3, sp
	bne	.L1720
	and	r3, r3, r4
	ldr	r3, [r3, #8]
	.syntax divided
@ 439 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds r2, r6, #12; sbcccs r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	bne	.L1661
	mov	r2, #12
	mov	r1, r6
	add	r0, sp, #4
	bl	__copy_from_user
	subs	r8, r0, #0
	bne	.L1719
	mov	r0, r5
	ldr	r1, [sp, #8]
	ldr	r2, [sp, #12]
	bl	snd_pcm_lib_write
	.syntax divided
@ 2679 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	1:	str	r0,[r6],#0
2:
	.pushsection .fixup,"ax"
	.align	2
3:	mov	r8, #-14
	b	2b
	.popsection
	.pushsection __ex_table,"a"
	.align	3
	.long	1b, 3b
	.popsection
@ 0 "" 2
	.arm
	.syntax unified
	mov	r3, sp
	and	r5, r0, r0, asr #31
	and	r0, r3, r4
	b	.L1612
.L1637:
.L1616:
	mov	r0, r6
	mvn	r1, #0
	.syntax divided
@ 2725 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__get_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	mov	r3, sp
	mov	r8, r2
	bne	.L1720
	and	r3, r3, r4
	mov	r2, r0
	ldr	r1, [r3, #8]
	mov	r0, r6
	sub	r1, r1, #1
	.syntax divided
@ 2727 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	bne	.L1719
	cmp	r8, #0
	beq	.L1709
	ldr	r9, [r5, #168]
	movw	r0, #:lower16:.LANCHOR0
	add	r4, r5, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r4
	bl	_raw_spin_lock
	ldr	r2, [r9, #160]
	ldr	r3, [r2]
	sub	r3, r3, #2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L1682
.L1647:
	.word	.L1646
	.word	.L1648
	.word	.L1710
	.word	.L1648
	.word	.L1646
	.word	.L1687
.L1675:
.L1654:
	mov	r0, r6
	mvn	r1, #0
	.syntax divided
@ 2805 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__get_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	mov	r3, sp
	mov	r8, r2
	bne	.L1720
	and	r3, r3, r4
	mov	r2, r0
	ldr	r1, [r3, #8]
	mov	r0, r6
	sub	r1, r1, #1
	.syntax divided
@ 2807 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	.ifnc r0,r0 ; .err ; .endif
	.ifnc r2,r2 ; .err ; .endif
	.ifnc r1,r1 ; .err ; .endif
	bl	__put_user_4
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r0, #0
	bne	.L1719
	cmp	r8, #0
	beq	.L1709
	ldr	r9, [r5, #168]
	movw	r0, #:lower16:.LANCHOR0
	add	r4, r5, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r4
	bl	_raw_spin_lock
	ldr	r2, [r9, #160]
	ldr	r3, [r2]
	sub	r3, r3, #2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L1682
.L1684:
	.word	.L1683
	.word	.L1685
	.word	.L1710
	.word	.L1683
	.word	.L1683
	.word	.L1687
.L1723:
	ldr	r9, [r5, #168]
	movw	r0, #:lower16:.LANCHOR0
	add	r4, r5, #192
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_lock_irq
	mov	r0, r4
	bl	_raw_spin_lock
	ldr	r2, [r9, #160]
	ldr	r3, [r2]
	sub	r3, r3, #2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L1682
.L1635:
	.word	.L1634
	.word	.L1636
	.word	.L1710
	.word	.L1636
	.word	.L1682
	.word	.L1687
.L1710:
	mvn	r5, #31
	mov	r8, r5
.L1686:
	mov	r0, r4
	bl	_raw_spin_unlock
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	_raw_read_unlock_irq
	b	.L1681
.L1687:
	mvn	r5, #85
	mov	r8, r5
	b	.L1686
.L1685:
	mov	r0, r5
	bl	snd_pcm_update_hw_ptr
	cmp	r0, #0
	blt	.L1711
	ldr	r2, [r9, #160]
.L1683:
	ldr	r1, [r9, #164]
	ldr	r3, [r2, #8]
	ldr	r2, [r1]
	subs	r3, r3, r2
	ldrmi	r0, [r9, #132]
	addmi	r3, r3, r0
	cmp	r3, #0
	ble	.L1712
	ldr	r0, [r9, #132]
	cmp	r8, r3
	mov	r5, #0
	movcs	r8, r3
	add	r2, r8, r2
	cmp	r2, r0
	subge	r2, r2, r0
	str	r2, [r1]
	b	.L1686
.L1648:
	mov	r0, r5
	bl	snd_pcm_update_hw_ptr
	cmp	r0, #0
	blt	.L1711
	ldr	r2, [r9, #160]
.L1646:
	ldr	r0, [r2, #8]
	ldr	ip, [r9, #164]
	ldr	r3, [r9, #68]
	ldr	r1, [r9, #132]
	ldr	r2, [ip]
	sub	r3, r3, r2
	adds	r3, r3, r0
	addmi	r3, r3, r1
	bmi	.L1652
	cmp	r3, r1
	subcs	r3, r3, r1
.L1652:
	cmp	r3, #0
	ble	.L1712
	cmp	r8, r3
	movcs	r8, r3
	add	r2, r8, r2
	cmp	r2, r1
	subge	r2, r2, r1
.L1653:
	mov	r5, #0
	str	r2, [ip]
	b	.L1686
.L1674:
	mov	r0, r5
	bl	snd_pcm_update_hw_ptr
	cmp	r0, #0
	blt	.L1711
	ldr	r2, [r9, #160]
.L1672:
	ldr	r2, [r2, #8]
	ldr	r0, [r9, #164]
	ldr	r1, [r9, #68]
	ldr	r3, [r0]
	subs	r2, r2, r3
	ldrmi	ip, [r9, #132]
	addmi	r2, r2, ip
	sub	r2, r1, r2
	cmp	r2, #0
	ble	.L1712
	cmp	r8, r2
	mov	r5, #0
	movcs	r8, r2
	subs	r3, r3, r8
	ldrmi	r2, [r9, #132]
	addmi	r3, r3, r2
	str	r3, [r0]
	b	.L1686
.L1636:
	mov	r0, r5
	bl	snd_pcm_update_hw_ptr
	cmp	r0, #0
	blt	.L1711
	ldr	r2, [r9, #160]
.L1634:
	ldr	r0, [r2, #8]
	ldr	ip, [r9, #164]
	ldr	r1, [r9, #68]
	ldr	lr, [r9, #132]
	ldr	r2, [ip]
	sub	r3, r1, r2
	adds	r3, r3, r0
	addmi	r3, r3, lr
	bmi	.L1640
	cmp	r3, lr
	subcs	r3, r3, lr
.L1640:
	sub	r3, r1, r3
	cmp	r3, #0
	ble	.L1712
	cmp	r8, r3
	movcs	r8, r3
	subs	r2, r2, r8
	addmi	r2, r2, lr
	b	.L1653
.L1682:
	mvn	r5, #76
	mov	r8, r5
	b	.L1686
.L1661:
	mov	r1, #12
	add	r0, sp, #4
	bl	__memzero
	b	.L1719
.L1712:
	mov	r8, #0
	mov	r5, r8
	b	.L1686
.L1711:
	mvn	r8, #31
	mov	r5, r8
	b	.L1686
.L1665:
	mov	r1, #12
	add	r0, sp, #4
	bl	__memzero
	b	.L1717
.L1662:
	mov	r0, r5
	ldr	r1, [sp, #8]
	ldr	r2, [sp, #12]
	bl	snd_pcm_lib_read
	.syntax divided
@ 2759 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	1:	str	r0,[r6],#0
2:
	.pushsection .fixup,"ax"
	.align	2
3:	mov	r8, #-14
	b	2b
	.popsection
	.pushsection __ex_table,"a"
	.align	3
	.long	1b, 3b
	.popsection
@ 0 "" 2
	.arm
	.syntax unified
	mov	r3, sp
	and	r5, r0, r0, asr #31
	and	r0, r3, r4
	b	.L1612
.L1666:
	ldr	r1, [r8, #56]
	ldr	r0, [sp, #8]
	lsl	r1, r1, #2
	bl	memdup_user
	cmn	r0, #4096
	mov	r8, r0
	movhi	r3, sp
	movhi	r5, r8
	bichi	r0, r3, #8128
	bichi	r0, r0, #63
	bhi	.L1612
	mov	r1, r8
	ldr	r2, [sp, #12]
	mov	r0, r5
	bl	snd_pcm_lib_readv
	mov	r5, r0
	mov	r0, r8
	bl	kfree
	.syntax divided
@ 2784 "/home/pascua14/Desktop/s5-kernel/sound/core/pcm_native.c" 1
	1:	str	r5,[r6],#0
2:
	.pushsection .fixup,"ax"
	.align	2
3:	mov	r4, #-14
	b	2b
	.popsection
	.pushsection __ex_table,"a"
	.align	3
	.long	1b, 3b
	.popsection
@ 0 "" 2
	.arm
	.syntax unified
	mov	r3, sp
	and	r5, r5, r5, asr #31
	bic	r0, r3, #8128
	bic	r0, r0, #63
	b	.L1612
	.fnend
	.size	snd_pcm_kernel_ioctl, .-snd_pcm_kernel_ioctl
	.align	2
	.global	snd_pcm_lib_default_mmap
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_lib_default_mmap, %function
snd_pcm_lib_default_mmap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r1, #24]
	orr	r3, r3, #524288
	str	r3, [r1, #24]
	ldr	r3, [r0, #164]
	ldr	r3, [r3, #40]
	cmp	r3, #0
	beq	.L1738
.L1726:
	ldr	r3, .L1739
	mov	r0, #0
	str	r3, [r1, #68]
	bx	lr
.L1738:
	ldr	r3, [r0, #132]
	cmp	r3, #2
	bne	.L1726
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	ldr	ip, [r1, #8]
	str	lr, [sp, #8]
	ldr	r4, [r0, #136]
	.pad #12
	sub	sp, sp, #12
	ldr	r3, [r0, #168]
	ldr	lr, [r1, #4]
	cmp	r4, #0
	ldr	r2, [r3, #540]
	sub	lr, ip, lr
	ldr	r3, [r3, #544]
	beq	.L1727
	ldr	ip, [r4, #284]
	cmp	ip, #0
	beq	.L1727
.L1728:
	mov	r5, #0
	str	lr, [sp]
	mov	r0, r4
	str	r5, [sp, #4]
	ldr	r4, [ip, #8]
	blx	r4
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L1727:
	movw	ip, #:lower16:arm_dma_ops
	movt	ip, #:upper16:arm_dma_ops
	cmp	ip, #0
	bne	.L1728
	.syntax divided
@ 236 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/dma-mapping.h" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/dma-mapping.h"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 236, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L1740:
	.align	2
.L1739:
	.word	.LANCHOR2+20
	.fnend
	.size	snd_pcm_lib_default_mmap, .-snd_pcm_lib_default_mmap
	.align	2
	.global	snd_pcm_mmap_data
	.syntax unified
	.arm
	.fpu softvfp
	.type	snd_pcm_mmap_data, %function
snd_pcm_mmap_data:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	str	lr, [sp, #8]
	ldr	r3, [r0, #48]
	.pad #12
	sub	sp, sp, #12
	ldr	lr, [r2, #24]
	cmp	r3, #0
	bne	.L1742
	tst	lr, #3
	beq	.L1757
.L1744:
	ldr	r3, [r0, #168]
	ldr	r1, [r3, #160]
	ldr	r1, [r1]
	cmp	r1, #0
	beq	.L1753
	ldr	r1, [r3, #88]
	tst	r1, #1
	beq	.L1754
	ldr	r1, [r3, #40]
	sub	r1, r1, #3
	cmp	r1, #1
	bls	.L1757
	ldr	r3, [r3, #548]
	ldr	ip, [r2, #4]
	ldr	r4, [r2, #8]
	ldr	r1, [r2, #72]
	add	r3, r3, #4080
	add	r3, r3, #15
	bic	r3, r3, #4080
	sub	ip, r4, ip
	bic	r3, r3, #15
	lsl	r1, r1, #12
	cmp	ip, r3
	bhi	.L1757
	sub	r3, r3, ip
	cmp	r3, r1
	bcc	.L1757
	movw	r3, #:lower16:.LANCHOR2
	mov	r1, r2
	movt	r3, #:upper16:.LANCHOR2
	mov	r4, r0
	str	r3, [r2, #68]
	str	r0, [r1, #80]
	ldr	r3, [r0, #164]
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L1745
	blx	r3
.L1746:
	cmp	r0, #0
	bne	.L1741
.L1750:
	add	r3, r4, #220
	.syntax divided
@ 45 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.arm
	.syntax unified
	mov	r0, #0
.L1741:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L1742:
	tst	lr, #1
	bne	.L1744
.L1757:
	mvn	r0, #21
	b	.L1741
.L1745:
	orr	lr, lr, #524288
	str	lr, [r2, #24]
	ldr	r3, [r0, #164]
	ldr	r3, [r3, #40]
	cmp	r3, #0
	beq	.L1763
.L1747:
	ldr	r3, .L1764
	str	r3, [r1, #68]
	b	.L1750
.L1753:
	mvn	r0, #76
	b	.L1741
.L1754:
	mvn	r0, #5
	b	.L1741
.L1763:
	ldr	r3, [r0, #132]
	cmp	r3, #2
	bne	.L1747
	ldr	r0, [r0, #136]
	ldr	r3, [r4, #168]
	cmp	r0, #0
	ldr	r2, [r3, #540]
	ldr	r3, [r3, #544]
	beq	.L1748
	ldr	lr, [r0, #284]
	cmp	lr, #0
	beq	.L1748
.L1749:
	mov	r5, #0
	str	ip, [sp]
	str	r5, [sp, #4]
	ldr	r5, [lr, #8]
	blx	r5
	b	.L1746
.L1748:
	movw	lr, #:lower16:arm_dma_ops
	movt	lr, #:upper16:arm_dma_ops
	cmp	lr, #0
	bne	.L1749
	.syntax divided
@ 236 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/dma-mapping.h" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/dma-mapping.h"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 236, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L1765:
	.align	2
.L1764:
	.word	.LANCHOR2+20
	.fnend
	.size	snd_pcm_mmap_data, .-snd_pcm_mmap_data
	.global	snd_pcm_f_ops
	.global	snd_pcm_known_rates
	.global	snd_pcm_link_rwlock
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	snd_pcm_vm_ops_data, %object
	.size	snd_pcm_vm_ops_data, 20
snd_pcm_vm_ops_data:
	.word	snd_pcm_mmap_data_open
	.word	snd_pcm_mmap_data_close
	.space	12
	.type	snd_pcm_vm_ops_data_fault, %object
	.size	snd_pcm_vm_ops_data_fault, 20
snd_pcm_vm_ops_data_fault:
	.word	snd_pcm_mmap_data_open
	.word	snd_pcm_mmap_data_close
	.word	snd_pcm_mmap_data_fault
	.space	8
	.type	snd_pcm_f_ops, %object
	.size	snd_pcm_f_ops, 216
snd_pcm_f_ops:
	.word	0
	.word	no_llseek
	.space	4
	.word	snd_pcm_write
	.space	4
	.word	snd_pcm_aio_write
	.space	4
	.word	snd_pcm_playback_poll
	.word	snd_pcm_playback_ioctl
	.word	0
	.word	snd_pcm_mmap
	.word	snd_pcm_playback_open
	.space	4
	.word	snd_pcm_release
	.space	8
	.word	snd_pcm_fasync
	.space	8
	.word	0
	.space	28
	.word	0
	.word	no_llseek
	.word	snd_pcm_read
	.space	4
	.word	snd_pcm_aio_read
	.space	8
	.word	snd_pcm_capture_poll
	.word	snd_pcm_capture_ioctl
	.word	0
	.word	snd_pcm_mmap
	.word	snd_pcm_capture_open
	.space	4
	.word	snd_pcm_release
	.space	8
	.word	snd_pcm_fasync
	.space	8
	.word	0
	.space	28
	.type	snd_pcm_known_rates, %object
	.size	snd_pcm_known_rates, 12
snd_pcm_known_rates:
	.word	13
	.word	rates
	.space	4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	rates, %object
	.size	rates, 52
rates:
	.word	5512
	.word	8000
	.word	11025
	.word	16000
	.word	22050
	.word	32000
	.word	44100
	.word	48000
	.word	64000
	.word	88200
	.word	96000
	.word	176400
	.word	192000
	.type	snd_pcm_link_rwsem, %object
	.size	snd_pcm_link_rwsem, 16
snd_pcm_link_rwsem:
	.word	0
	.word	0
	.word	snd_pcm_link_rwsem+8
	.word	snd_pcm_link_rwsem+8
	.type	snd_pcm_action_pause, %object
	.size	snd_pcm_action_pause, 16
snd_pcm_action_pause:
	.word	snd_pcm_pre_pause
	.word	snd_pcm_do_pause
	.word	snd_pcm_undo_pause
	.word	snd_pcm_post_pause
	.type	snd_pcm_action_stop, %object
	.size	snd_pcm_action_stop, 16
snd_pcm_action_stop:
	.word	snd_pcm_pre_stop
	.word	snd_pcm_do_stop
	.space	4
	.word	snd_pcm_post_stop
	.type	snd_pcm_action_prepare, %object
	.size	snd_pcm_action_prepare, 16
snd_pcm_action_prepare:
	.word	snd_pcm_pre_prepare
	.word	snd_pcm_do_prepare
	.space	4
	.word	snd_pcm_post_prepare
	.type	snd_pcm_action_reset, %object
	.size	snd_pcm_action_reset, 16
snd_pcm_action_reset:
	.word	snd_pcm_pre_reset
	.word	snd_pcm_do_reset
	.space	4
	.word	snd_pcm_post_reset
	.type	snd_pcm_action_start, %object
	.size	snd_pcm_action_start, 16
snd_pcm_action_start:
	.word	snd_pcm_pre_start
	.word	snd_pcm_do_start
	.word	snd_pcm_undo_start
	.word	snd_pcm_post_start
	.type	snd_pcm_action_resume, %object
	.size	snd_pcm_action_resume, 16
snd_pcm_action_resume:
	.word	snd_pcm_pre_resume
	.word	snd_pcm_do_resume
	.word	snd_pcm_undo_resume
	.word	snd_pcm_post_resume
	.type	snd_pcm_action_drain_init, %object
	.size	snd_pcm_action_drain_init, 16
snd_pcm_action_drain_init:
	.word	snd_pcm_pre_drain_init
	.word	snd_pcm_do_drain_init
	.space	4
	.word	snd_pcm_post_drain_init
	.type	snd_pcm_action_suspend, %object
	.size	snd_pcm_action_suspend, 16
snd_pcm_action_suspend:
	.word	snd_pcm_pre_suspend
	.word	snd_pcm_do_suspend
	.space	4
	.word	snd_pcm_post_suspend
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	snd_pcm_link_rwlock, %object
	.size	snd_pcm_link_rwlock, 4
snd_pcm_link_rwlock:
	.space	4
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
