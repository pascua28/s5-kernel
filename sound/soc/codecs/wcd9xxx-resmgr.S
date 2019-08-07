wcd9xxx_disable_clock_block:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r6, [r0]
	ldr	r5, [r0, #136]
	cmp	r5, #1
	beq	.L16
.L2:
	ldr	r3, [r4, #20]
	add	r5, r4, #48
	mov	r2, r4
	mov	r0, r5
	cmp	r3, #1
	moveq	r1, #3
	movne	r1, #7
	bl	blocking_notifier_call_chain
	ldr	r3, [r4, #160]
	cmp	r3, #3
	bne	.L17
	ldr	r3, [r4, #20]
	cmp	r3, #1
	bne	.L9
.L8:
	mov	r2, r4
	mov	r0, r5
	mov	r1, #4
.L14:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	blocking_notifier_call_chain
.L17:
	mov	r3, #0
	mov	r2, #4
	movw	r1, #265
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r1, #50
	mov	r0, r1
	bl	usleep_range
	mov	r3, #2
	movw	r1, #265
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r2, #5
	mov	r1, #264
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r1, #50
	mov	r0, r1
	bl	usleep_range
	ldr	r3, [r4, #20]
	cmp	r3, #1
	beq	.L8
	ldr	r3, [r4, #160]
	cmp	r3, #3
	beq	.L9
.L7:
	mov	r2, r4
	mov	r0, r5
	mov	r1, #8
	b	.L14
.L9:
	mov	r0, r6
	mov	r3, #0
	mov	r2, #3
	movw	r1, #1064
	bl	snd_soc_update_bits
	b	.L7
.L16:
	movw	r7, #:lower16:.LANCHOR0
	movt	r7, #:upper16:.LANCHOR0
	ldrb	r3, [r7]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2
	movw	r3, #:lower16:.LANCHOR1
	movw	r2, #:lower16:.LC0
	movw	r0, #:lower16:.LC1
	movt	r3, #:upper16:.LANCHOR1
	movt	r2, #:upper16:.LC0
	movt	r0, #:upper16:.LC1
	mov	r1, #188
	bl	warn_slowpath_fmt
	strb	r5, [r7]
	b	.L2
	.fnend
	.size	wcd9xxx_disable_clock_block, .-wcd9xxx_disable_clock_block
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_enable_bg_mbhc, %function
wcd9xxx_enable_bg_mbhc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r0
	mov	r4, r0
	str	r6, [sp, #8]
	mov	r2, r0
	mov	r1, #13
	str	lr, [sp, #12]
	ldr	r6, [r5], #48
	mov	r0, r5
	bl	blocking_notifier_call_chain
	ldr	r3, [r4, #160]
	cmp	r3, #3
	beq	.L20
	mov	r0, r6
	movw	r1, #265
	bl	snd_soc_read
	tst	r0, #4
	bne	.L26
.L20:
	ldr	r6, [r4]
	mov	r3, #128
	movw	r1, #257
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r3, #4
	mov	r0, r6
	mov	r2, r3
	movw	r1, #257
	bl	snd_soc_update_bits
	mov	r3, #1
	mov	r0, r6
	mov	r2, r3
	movw	r1, #257
	bl	snd_soc_update_bits
	mov	r1, #1000
	mov	r0, r1
	bl	usleep_range
	mov	r0, r6
	mov	r2, #128
	movw	r1, #257
	mov	r3, #0
	bl	snd_soc_update_bits
	ldr	r6, [sp, #8]
	mov	r2, r4
	mov	r0, r5
	mov	r1, #14
	ldrd	r4, [sp]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	blocking_notifier_call_chain
.L26:
	movw	r0, #:lower16:.LC1
	mov	r1, #176
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	b	.L20
	.fnend
	.size	wcd9xxx_enable_bg_mbhc, .-wcd9xxx_enable_bg_mbhc
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_enable_clock_block, %function
wcd9xxx_enable_clock_block:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	mov	r7, r1
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r5, [r0]
	ldr	r3, [r0, #160]
	cmp	r3, #3
	bne	.L62
.L29:
	cmp	r7, #0
	mov	r2, r4
	add	r8, r4, #48
	beq	.L31
	mov	r1, #1
	mov	r0, r8
	bl	blocking_notifier_call_chain
	ldr	r6, [r4]
	mov	r3, #0
	mov	r2, #16
	movw	r1, #506
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r2, #23
	movw	r1, #261
	mov	r0, r6
	bl	snd_soc_write
	mov	r1, #5
	mov	r0, r1
	bl	usleep_range
	mov	r3, #128
	movw	r1, #506
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r3, #128
	movw	r1, #507
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r1, #10
	mov	r0, r1
	bl	usleep_range
	mov	r3, #0
	mov	r2, #128
	movw	r1, #507
	mov	r0, r6
	bl	snd_soc_update_bits
	movw	r1, #10000
	mov	r0, r1
	bl	usleep_range
	ldr	r3, [r4, #160]
	cmp	r3, #3
	beq	.L32
	mov	r3, #8
	mov	r0, r6
	mov	r2, r3
	mov	r1, #264
	bl	snd_soc_update_bits
.L33:
	ldr	r3, [r4, #160]
	cmp	r3, #3
	beq	.L34
	mov	r2, #2
	movw	r1, #265
	mov	r0, r5
	bl	snd_soc_write
.L34:
	mov	r1, #1000
	mov	r0, r1
	bl	usleep_range
.L35:
	ldr	r3, [r4, #160]
	cmp	r3, #3
	beq	.L42
	mov	r3, #1
	mov	r1, #264
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r1, #1200
	mov	r0, #1000
	bl	usleep_range
	mov	r3, #0
	mov	r2, #2
	movw	r1, #265
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #4
	movw	r1, #265
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #1
	mov	r0, r5
	mov	r2, r3
	movw	r1, #785
	bl	snd_soc_update_bits
.L43:
	mov	r1, #50
	mov	r0, r1
	bl	usleep_range
	cmp	r7, #0
	mov	r2, r4
	ldrd	r4, [sp]
	mov	r0, r8
	ldrd	r6, [sp, #8]
	movne	r1, #2
	ldr	r8, [sp, #16]
	moveq	r1, #6
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	blocking_notifier_call_chain
.L31:
	mov	r1, #5
	mov	r0, r8
	bl	blocking_notifier_call_chain
	ldr	r3, [r4, #160]
	cmp	r3, #3
	beq	.L36
	mov	r3, r7
	mov	r2, #8
	mov	r1, #264
	mov	r0, r5
	bl	snd_soc_update_bits
.L37:
	movw	r1, #506
	mov	r0, r5
	bl	snd_soc_read
	tst	r0, #128
	beq	.L38
	ldr	r3, [r4, #160]
	cmp	r3, #3
	bne	.L63
.L39:
	ldr	r6, [r4]
	mov	r3, #0
	mov	r2, #1
	movw	r1, #261
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r0, r6
	mov	r2, #128
	movw	r1, #506
	bl	snd_soc_update_bits
	ldr	r3, [r4, #160]
	cmp	r3, #3
	beq	.L40
.L41:
	mov	r3, #4
	mov	r2, #12
	mov	r1, #264
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L35
.L62:
	movw	r1, #265
	mov	r0, r5
	bl	snd_soc_read
	tst	r0, #4
	beq	.L29
	movw	r0, #:lower16:.LC1
	movw	r1, #446
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	b	.L29
.L40:
	mov	r0, r6
	mov	r3, #0
	mov	r2, #32
	mov	r1, #34
	bl	snd_soc_update_bits
.L38:
	ldr	r3, [r4, #160]
	cmp	r3, #3
	bne	.L41
.L42:
	mov	r3, #1
	mov	r0, r5
	mov	r2, r3
	movw	r1, #1060
	bl	snd_soc_update_bits
	b	.L43
.L32:
	mov	r3, #32
	mov	r0, r6
	mov	r2, r3
	mov	r1, #34
	bl	snd_soc_update_bits
	b	.L33
.L36:
	mov	r2, r3
	movw	r1, #1064
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #13
	mov	r2, #15
	mov	r1, #34
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L37
.L63:
	mov	r2, #2
	movw	r1, #265
	mov	r0, r5
	bl	snd_soc_write
	b	.L39
	.fnend
	.size	wcd9xxx_enable_clock_block, .-wcd9xxx_enable_clock_block
	.align	2
	.global	wcd9xxx_get_event_string
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_get_event_string, %function
wcd9xxx_get_event_string:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR2
	movt	r3, #:upper16:.LANCHOR2
	add	r0, r3, r0, lsl #6
	bx	lr
	.fnend
	.size	wcd9xxx_get_event_string, .-wcd9xxx_get_event_string
	.align	2
	.global	wcd9xxx_resmgr_notifier_call
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_notifier_call, %function
wcd9xxx_resmgr_notifier_call:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, r0
	add	r0, r0, #48
	b	blocking_notifier_call_chain
	.fnend
	.size	wcd9xxx_resmgr_notifier_call, .-wcd9xxx_resmgr_notifier_call
	.align	2
	.global	wcd9xxx_resmgr_post_ssr
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_post_ssr, %function
wcd9xxx_resmgr_post_ssr:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	add	r8, r0, #136
	strd	r10, [sp, #24]
	mov	r0, r8
	str	lr, [sp, #32]
	.pad #20
	sub	sp, sp, #20
	bl	mutex_lock
	ldrh	r6, [r4, #16]
	mov	r3, #0
	ldrh	r7, [r4, #18]
	ldrh	r5, [r4, #24]
	str	r3, [r4, #12]
	ldrh	fp, [r4, #26]
	str	r3, [r4, #16]
	cmp	r6, r3
	str	r3, [r4, #20]
	str	r3, [r4, #24]
	beq	.L67
	movw	r3, #:lower16:.LANCHOR0
	movw	r2, #:lower16:.LC0
	str	r8, [sp, #4]
	movt	r3, #:upper16:.LANCHOR0
	movt	r2, #:upper16:.LC0
	sub	r6, r6, #1
	str	r3, [sp, #8]
	str	r2, [sp, #12]
	b	.L77
.L70:
	sub	r6, r6, #1
	mov	r3, #1
	cmn	r6, #1
	str	r3, [r4, #12]
	beq	.L122
.L77:
	ldr	r8, [r4, #136]
	cmp	r8, #1
	beq	.L123
.L68:
	ldrh	r3, [r4, #16]
	add	r3, r3, #1
	uxth	r3, r3
	cmp	r3, #1
	strh	r3, [r4, #16]	@ movhi
	bne	.L70
	ldrh	r2, [r4, #18]
	ldr	r3, [r4, #12]
	cmp	r2, #0
	beq	.L71
	cmp	r3, #2
	bne	.L124
.L72:
	ldr	r8, [r4, #136]
	cmp	r8, #1
	beq	.L125
.L73:
	ldr	r10, [r4, #20]
	cmp	r10, #0
	beq	.L74
	mov	r0, r4
	bl	wcd9xxx_disable_clock_block
	ldr	r10, [r4, #20]
.L74:
	add	r8, r4, #48
	mov	r2, r4
	mov	r1, #9
	mov	r0, r8
	bl	blocking_notifier_call_chain
	mov	r3, #0
	mov	r2, #3
	ldr	r0, [r4]
	movw	r1, #257
	bl	snd_soc_update_bits
	mov	r1, #100
	mov	r0, r1
	bl	usleep_range
	mov	r2, r4
	mov	r1, #10
	mov	r0, r8
	bl	blocking_notifier_call_chain
	mov	r2, r4
	mov	r1, #11
	mov	r0, r8
	bl	blocking_notifier_call_chain
	ldr	r9, [r4]
	mov	r3, #128
	movw	r1, #257
	mov	r2, r3
	mov	r0, r9
	bl	snd_soc_update_bits
	mov	r3, #4
	movw	r1, #257
	mov	r2, r3
	mov	r0, r9
	bl	snd_soc_update_bits
	mov	r3, #1
	movw	r1, #257
	mov	r2, r3
	mov	r0, r9
	bl	snd_soc_update_bits
	mov	r1, #1000
	mov	r0, r1
	bl	usleep_range
	mov	r3, #0
	mov	r2, #128
	movw	r1, #257
	mov	r0, r9
	bl	snd_soc_update_bits
	mov	r2, r4
	mov	r0, r8
	mov	r1, #12
	bl	blocking_notifier_call_chain
	cmp	r10, #0
	beq	.L70
	mov	r1, #1
	mov	r0, r4
	bl	wcd9xxx_enable_clock_block
	b	.L70
.L71:
	cmp	r3, #0
	bne	.L126
.L76:
	add	r8, r4, #48
	mov	r2, r4
	mov	r0, r8
	mov	r1, #11
	bl	blocking_notifier_call_chain
	ldr	r9, [r4]
	mov	r3, #128
	movw	r1, #257
	mov	r2, r3
	mov	r0, r9
	bl	snd_soc_update_bits
	mov	r3, #4
	mov	r0, r9
	mov	r2, r3
	movw	r1, #257
	bl	snd_soc_update_bits
	mov	r3, #1
	mov	r0, r9
	mov	r2, r3
	movw	r1, #257
	bl	snd_soc_update_bits
	mov	r1, #1000
	mov	r0, r1
	bl	usleep_range
	mov	r0, r9
	mov	r3, #0
	mov	r2, #128
	movw	r1, #257
	bl	snd_soc_update_bits
	mov	r2, r4
	mov	r0, r8
	mov	r1, #12
	bl	blocking_notifier_call_chain
	b	.L70
.L122:
	ldr	r8, [sp, #4]
.L67:
	cmp	r7, #0
	beq	.L87
	movw	r9, #:lower16:.LANCHOR0
	movw	r10, #:lower16:.LC0
	sub	r6, r7, #1
	movt	r9, #:upper16:.LANCHOR0
	movt	r10, #:upper16:.LC0
	b	.L86
.L84:
	bl	wcd9xxx_enable_bg_mbhc
.L85:
	mov	r3, #2
	str	r3, [r4, #12]
.L82:
	subs	r6, r6, #1
	bcc	.L87
.L86:
	ldr	r7, [r4, #136]
	cmp	r7, #1
	beq	.L127
.L81:
	ldr	r2, [r4, #12]
	ldrh	r3, [r4, #18]
	sub	r2, r2, #1
	add	r3, r3, #1
	cmp	r2, #1
	strh	r3, [r4, #18]	@ movhi
	bls	.L82
	ldr	r7, [r4, #136]
	cmp	r7, #1
	beq	.L128
.L83:
	ldr	r3, [r4, #20]
	mov	r0, r4
	cmp	r3, #0
	beq	.L84
	bl	wcd9xxx_disable_clock_block
	ldr	r7, [r4, #20]
	mov	r0, r4
	bl	wcd9xxx_enable_bg_mbhc
	cmp	r7, #0
	beq	.L85
	mov	r1, #1
	mov	r0, r4
	bl	wcd9xxx_enable_clock_block
	b	.L85
.L87:
	cmp	fp, #0
	beq	.L80
	movw	r6, #:lower16:.LANCHOR0
	movw	r7, #:lower16:.LC0
	ldr	r9, .L132
	sub	r10, fp, #1
	movt	r6, #:upper16:.LANCHOR0
	movt	r7, #:upper16:.LC0
	b	.L94
.L91:
	subs	r10, r10, #1
	bcc	.L80
.L94:
	ldr	fp, [r4, #136]
	cmp	fp, #1
	beq	.L129
.L90:
	ldrh	r3, [r4, #26]
	add	r3, r3, #1
	uxth	r3, r3
	cmp	r3, #1
	strh	r3, [r4, #26]	@ movhi
	bne	.L91
	ldr	r1, [r4, #20]
	cmp	r1, #0
	beq	.L121
	cmp	r1, #1
	bne	.L91
	movw	r1, #506
	ldr	r0, [r4]
	bl	snd_soc_read
	tst	r0, #128
	beq	.L130
.L93:
	mov	r0, r4
	bl	wcd9xxx_disable_clock_block
	mov	r1, #0
.L121:
	mov	r0, r4
	bl	wcd9xxx_enable_clock_block
	mov	r3, #2
	subs	r10, r10, #1
	str	r3, [r4, #20]
	bcs	.L94
.L80:
	cmp	r5, #0
	beq	.L89
	movw	r7, #:lower16:.LANCHOR0
	movw	r9, #:lower16:.LC0
	ldr	r10, .L132
	sub	r5, r5, #1
	movt	r7, #:upper16:.LANCHOR0
	movt	r9, #:upper16:.LC0
	b	.L97
.L96:
	cmn	r5, #1
	beq	.L89
.L97:
	ldr	r6, [r4, #136]
	sub	r5, r5, #1
	cmp	r6, #1
	beq	.L131
.L95:
	ldrh	r6, [r4, #24]
	add	r6, r6, #1
	uxth	r6, r6
	cmp	r6, #1
	strh	r6, [r4, #24]	@ movhi
	bne	.L96
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L96
	mov	r1, r6
	mov	r0, r4
	bl	wcd9xxx_enable_clock_block
	cmn	r5, #1
	str	r6, [r4, #20]
	bne	.L97
.L89:
	mov	r0, r8
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	mutex_unlock
.L131:
	ldrb	r3, [r7, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L95
	movw	r0, #:lower16:.LC1
	mov	r3, r10
	movt	r0, #:upper16:.LC1
	mov	r2, r9
	mov	r1, #532
	bl	warn_slowpath_fmt
	strb	r6, [r7, #3]
	b	.L95
.L123:
	ldr	r3, [sp, #8]
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L68
	movw	r0, #:lower16:.LC1
	ldr	r3, .L132+4
	movw	r1, #282
	movt	r0, #:upper16:.LC1
	ldr	r2, [sp, #12]
	bl	warn_slowpath_fmt
	ldr	r3, [sp, #8]
	strb	r8, [r3, #1]
	b	.L68
.L129:
	ldrb	r3, [r6, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L90
	movw	r0, #:lower16:.LC1
	mov	r3, r9
	movt	r0, #:upper16:.LC1
	mov	r2, r7
	mov	r1, #532
	bl	warn_slowpath_fmt
	strb	fp, [r6, #3]
	b	.L90
.L127:
	ldrb	r3, [r9, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L81
	movw	r0, #:lower16:.LC1
	ldr	r3, .L132+4
	mov	r2, r10
	movt	r0, #:upper16:.LC1
	movw	r1, #282
	bl	warn_slowpath_fmt
	strb	r7, [r9, #1]
	b	.L81
.L128:
	ldrb	r3, [r9, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L83
	movw	r0, #:lower16:.LC1
	ldr	r3, .L132+8
	mov	r2, r10
	movt	r0, #:upper16:.LC1
	movw	r1, #513
	bl	warn_slowpath_fmt
	strb	r7, [r9, #2]
	b	.L83
.L126:
	movw	r0, #:lower16:.LC1
	movw	r1, #303
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	b	.L76
.L130:
	movw	r0, #:lower16:.LC1
	mov	r1, #552
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	b	.L93
.L124:
	movw	r0, #:lower16:.LC1
	mov	r1, #292
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	b	.L72
.L125:
	ldr	r3, [sp, #8]
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L73
	movw	r0, #:lower16:.LC1
	ldr	r3, .L132+8
	movw	r1, #513
	movt	r0, #:upper16:.LC1
	ldr	r2, [sp, #12]
	bl	warn_slowpath_fmt
	ldr	r3, [sp, #8]
	strb	r8, [r3, #2]
	b	.L73
.L133:
	.align	2
.L132:
	.word	.LANCHOR1+76
	.word	.LANCHOR1+28
	.word	.LANCHOR1+56
	.fnend
	.size	wcd9xxx_resmgr_post_ssr, .-wcd9xxx_resmgr_post_ssr
	.align	2
	.global	wcd9xxx_resmgr_get_bandgap
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_get_bandgap, %function
wcd9xxx_resmgr_get_bandgap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	mov	r5, r1
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r6, [r0, #136]
	cmp	r6, #1
	beq	.L168
.L135:
	cmp	r5, #1
	beq	.L137
	cmp	r5, #2
	bne	.L169
	ldr	r2, [r4, #12]
	ldrh	r3, [r4, #18]
	sub	r2, r2, #1
	add	r3, r3, #1
	cmp	r2, #1
	strh	r3, [r4, #18]	@ movhi
	bls	.L134
	ldr	r5, [r4, #136]
	cmp	r5, #1
	beq	.L170
.L148:
	ldr	r3, [r4, #20]
	mov	r0, r4
	cmp	r3, #0
	bne	.L171
	bl	wcd9xxx_enable_bg_mbhc
.L150:
	mov	r3, #2
	str	r3, [r4, #12]
.L134:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L137:
	ldrh	r3, [r4, #16]
	add	r3, r3, #1
	uxth	r3, r3
	cmp	r3, #1
	strh	r3, [r4, #16]	@ movhi
	beq	.L172
.L140:
	mov	r3, #1
	str	r3, [r4, #12]
	b	.L134
.L172:
	ldrh	r2, [r4, #18]
	ldr	r3, [r4, #12]
	cmp	r2, #0
	beq	.L141
	cmp	r3, #2
	bne	.L173
.L142:
	ldr	r5, [r4, #136]
	cmp	r5, #1
	beq	.L174
.L143:
	ldr	r7, [r4, #20]
	cmp	r7, #0
	beq	.L144
	mov	r0, r4
	bl	wcd9xxx_disable_clock_block
	ldr	r7, [r4, #20]
.L144:
	add	r5, r4, #48
	mov	r2, r4
	mov	r1, #9
	mov	r0, r5
	bl	blocking_notifier_call_chain
	mov	r3, #0
	mov	r2, #3
	ldr	r0, [r4]
	movw	r1, #257
	bl	snd_soc_update_bits
	mov	r1, #100
	mov	r0, r1
	bl	usleep_range
	mov	r2, r4
	mov	r1, #10
	mov	r0, r5
	bl	blocking_notifier_call_chain
	mov	r2, r4
	mov	r1, #11
	mov	r0, r5
	bl	blocking_notifier_call_chain
	ldr	r6, [r4]
	mov	r3, #128
	movw	r1, #257
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r3, #4
	movw	r1, #257
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r3, #1
	movw	r1, #257
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r1, #1000
	mov	r0, r1
	bl	usleep_range
	mov	r3, #0
	mov	r2, #128
	movw	r1, #257
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r2, r4
	mov	r0, r5
	mov	r1, #12
	bl	blocking_notifier_call_chain
	cmp	r7, #0
	beq	.L140
	mov	r1, #1
	mov	r0, r4
	bl	wcd9xxx_enable_clock_block
	b	.L140
.L171:
	bl	wcd9xxx_disable_clock_block
	ldr	r5, [r4, #20]
	mov	r0, r4
	bl	wcd9xxx_enable_bg_mbhc
	cmp	r5, #0
	beq	.L150
	mov	r1, #1
	mov	r0, r4
	bl	wcd9xxx_enable_clock_block
	b	.L150
.L141:
	cmp	r3, #0
	bne	.L175
.L146:
	add	r5, r4, #48
	mov	r2, r4
	mov	r1, #11
	mov	r0, r5
	bl	blocking_notifier_call_chain
	ldr	r6, [r4]
	mov	r3, #128
	movw	r1, #257
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r3, #4
	movw	r1, #257
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r3, #1
	movw	r1, #257
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r1, #1000
	mov	r0, r1
	bl	usleep_range
	mov	r3, #0
	mov	r2, #128
	movw	r1, #257
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r2, r4
	mov	r0, r5
	mov	r1, #12
	bl	blocking_notifier_call_chain
	mov	r3, #1
	str	r3, [r4, #12]
	b	.L134
.L168:
	movw	r7, #:lower16:.LANCHOR0
	movt	r7, #:upper16:.LANCHOR0
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L135
	movw	r2, #:lower16:.LC0
	movw	r0, #:lower16:.LC1
	ldr	r3, .L176
	movt	r2, #:upper16:.LC0
	movt	r0, #:upper16:.LC1
	movw	r1, #282
	bl	warn_slowpath_fmt
	strb	r6, [r7, #1]
	b	.L135
.L169:
	movw	r0, #:lower16:.LC2
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	movt	r0, #:upper16:.LC2
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	ldr	r1, .L176
	b	printk
.L170:
	movw	r6, #:lower16:.LANCHOR0
	movt	r6, #:upper16:.LANCHOR0
	ldrb	r3, [r6, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L148
	movw	r2, #:lower16:.LC0
	movw	r0, #:lower16:.LC1
	ldr	r3, .L176+4
	movt	r2, #:upper16:.LC0
	movt	r0, #:upper16:.LC1
	movw	r1, #513
	bl	warn_slowpath_fmt
	strb	r5, [r6, #2]
	b	.L148
.L175:
	movw	r0, #:lower16:.LC1
	movw	r1, #303
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	b	.L146
.L174:
	movw	r6, #:lower16:.LANCHOR0
	movt	r6, #:upper16:.LANCHOR0
	ldrb	r3, [r6, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L143
	movw	r2, #:lower16:.LC0
	movw	r0, #:lower16:.LC1
	ldr	r3, .L176+4
	movt	r2, #:upper16:.LC0
	movt	r0, #:upper16:.LC1
	movw	r1, #513
	bl	warn_slowpath_fmt
	strb	r5, [r6, #2]
	b	.L143
.L173:
	movw	r0, #:lower16:.LC1
	mov	r1, #292
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	b	.L142
.L177:
	.align	2
.L176:
	.word	.LANCHOR1+28
	.word	.LANCHOR1+56
	.fnend
	.size	wcd9xxx_resmgr_get_bandgap, .-wcd9xxx_resmgr_get_bandgap
	.align	2
	.global	wcd9xxx_resmgr_put_bandgap
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_put_bandgap, %function
wcd9xxx_resmgr_put_bandgap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	mov	r5, r1
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r6, [r0, #136]
	cmp	r6, #1
	beq	.L196
.L179:
	cmp	r5, #1
	beq	.L181
	cmp	r5, #2
	bne	.L197
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L198
.L189:
	ldrh	r5, [r4, #18]
	sub	r5, r5, #1
	uxth	r5, r5
	cmp	r5, #0
	strh	r5, [r4, #18]	@ movhi
	bne	.L178
	ldr	r3, [r4, #12]
	cmp	r3, #2
	beq	.L199
.L178:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L181:
	ldrh	r3, [r4, #16]
	sub	r3, r3, #1
	uxth	r3, r3
	cmp	r3, #0
	strh	r3, [r4, #16]	@ movhi
	bne	.L178
	ldrh	r6, [r4, #18]
	cmp	r6, #0
	beq	.L185
	ldr	r3, [r4, #136]
	cmp	r3, #1
	beq	.L200
.L186:
	ldr	r3, [r4, #20]
	mov	r0, r4
	cmp	r3, #0
	bne	.L201
	bl	wcd9xxx_enable_bg_mbhc
.L188:
	mov	r3, #2
	str	r3, [r4, #12]
	b	.L178
.L185:
	add	r5, r4, #48
	mov	r2, r4
	mov	r1, #9
	mov	r0, r5
	bl	blocking_notifier_call_chain
	mov	r3, r6
	mov	r2, #3
	ldr	r0, [r4]
	movw	r1, #257
	bl	snd_soc_update_bits
	mov	r1, #100
	mov	r0, r1
	bl	usleep_range
	mov	r2, r4
	mov	r0, r5
	mov	r1, #10
	bl	blocking_notifier_call_chain
	str	r6, [r4, #12]
	b	.L178
.L199:
	add	r6, r4, #48
	mov	r2, r4
	mov	r1, #9
	mov	r0, r6
	bl	blocking_notifier_call_chain
	mov	r3, r5
	mov	r2, #3
	ldr	r0, [r4]
	movw	r1, #257
	bl	snd_soc_update_bits
	mov	r1, #100
	mov	r0, r1
	bl	usleep_range
	mov	r2, r4
	mov	r0, r6
	mov	r1, #10
	bl	blocking_notifier_call_chain
	str	r5, [r4, #12]
	b	.L178
.L198:
	movw	r2, #:lower16:.LC3
	movw	r0, #:lower16:.LC1
	movt	r2, #:upper16:.LC3
	movt	r0, #:upper16:.LC1
	movw	r1, #366
	bl	warn_slowpath_fmt
	b	.L189
.L196:
	movw	r7, #:lower16:.LANCHOR0
	movt	r7, #:upper16:.LANCHOR0
	ldrb	r3, [r7, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L179
	movw	r2, #:lower16:.LC0
	movw	r0, #:lower16:.LC1
	ldr	r3, .L202
	movt	r2, #:upper16:.LC0
	movt	r0, #:upper16:.LC1
	mov	r1, #344
	bl	warn_slowpath_fmt
	strb	r6, [r7, #4]
	b	.L179
.L201:
	bl	wcd9xxx_disable_clock_block
	ldr	r5, [r4, #20]
	mov	r0, r4
	bl	wcd9xxx_enable_bg_mbhc
	cmp	r5, #0
	beq	.L188
	mov	r1, #1
	mov	r0, r4
	bl	wcd9xxx_enable_clock_block
	b	.L188
.L197:
	movw	r0, #:lower16:.LC2
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	movt	r0, #:upper16:.LC2
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	ldr	r1, .L202
	b	printk
.L200:
	movw	r6, #:lower16:.LANCHOR0
	movt	r6, #:upper16:.LANCHOR0
	ldrb	r3, [r6, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L186
	movw	r2, #:lower16:.LC0
	movw	r0, #:lower16:.LC1
	ldr	r3, .L202+4
	movt	r2, #:upper16:.LC0
	movt	r0, #:upper16:.LC1
	movw	r1, #513
	bl	warn_slowpath_fmt
	strb	r5, [r6, #2]
	b	.L186
.L203:
	.align	2
.L202:
	.word	.LANCHOR1+108
	.word	.LANCHOR1+56
	.fnend
	.size	wcd9xxx_resmgr_put_bandgap, .-wcd9xxx_resmgr_put_bandgap
	.align	2
	.global	wcd9xxx_resmgr_enable_rx_bias
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_enable_rx_bias, %function
wcd9xxx_resmgr_enable_rx_bias:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, #0
	ldr	r2, [r0]
	ldr	r3, [r0, #8]
	beq	.L205
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r0, #8]
	beq	.L209
.L204:
	bx	lr
.L205:
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r0, #8]
	bne	.L204
	mov	r0, r2
	movw	r1, #418
	mov	r2, #128
	b	snd_soc_update_bits
.L209:
	mov	r3, #128
	mov	r0, r2
	movw	r1, #418
	mov	r2, r3
	b	snd_soc_update_bits
	.fnend
	.size	wcd9xxx_resmgr_enable_rx_bias, .-wcd9xxx_resmgr_enable_rx_bias
	.align	2
	.global	wcd9xxx_resmgr_enable_config_mode
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_enable_config_mode, %function
wcd9xxx_resmgr_enable_config_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r0
	str	r6, [sp, #8]
	subs	r6, r1, #0
	str	lr, [sp, #12]
	ldr	r4, [r0]
	beq	.L211
	mov	r3, #0
	mov	r2, #16
	movw	r1, #506
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r2, #23
	movw	r1, #261
	mov	r0, r4
	bl	snd_soc_write
	mov	r1, #5
	mov	r0, r1
	bl	usleep_range
	mov	r3, #128
	movw	r1, #506
	mov	r2, r3
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r3, #128
	movw	r1, #507
	mov	r2, r3
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r1, #10
	mov	r0, r1
	bl	usleep_range
	mov	r3, #0
	mov	r2, #128
	movw	r1, #507
	mov	r0, r4
	bl	snd_soc_update_bits
	movw	r1, #10000
	mov	r0, r1
	bl	usleep_range
	ldr	r3, [r5, #160]
	cmp	r3, #3
	beq	.L212
	mov	r3, #8
	mov	r0, r4
	mov	r2, r3
	mov	r1, #264
	bl	snd_soc_update_bits
.L213:
	ldrd	r4, [sp]
	mov	r0, #0
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L211:
	mov	r3, r6
	mov	r2, #1
	movw	r1, #261
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r3, r6
	mov	r2, #128
	movw	r1, #506
	mov	r0, r4
	bl	snd_soc_update_bits
	ldr	r3, [r5, #160]
	cmp	r3, #3
	bne	.L213
	mov	r3, r6
	mov	r0, r4
	mov	r2, #32
	mov	r1, #34
	bl	snd_soc_update_bits
	b	.L213
.L212:
	mov	r3, #32
	mov	r0, r4
	mov	r2, r3
	mov	r1, #34
	bl	snd_soc_update_bits
	b	.L213
	.fnend
	.size	wcd9xxx_resmgr_enable_config_mode, .-wcd9xxx_resmgr_enable_config_mode
	.align	2
	.global	wcd9xxx_resmgr_get_clk_block
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_get_clk_block, %function
wcd9xxx_resmgr_get_clk_block:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	mov	r5, r1
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r6, [r0, #136]
	cmp	r6, #1
	beq	.L262
.L216:
	cmp	r5, #1
	beq	.L218
	cmp	r5, #2
	bne	.L263
	ldrh	r3, [r4, #26]
	add	r3, r3, #1
	uxth	r3, r3
	cmp	r3, #1
	strh	r3, [r4, #26]	@ movhi
	beq	.L264
.L215:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L218:
	ldrh	r3, [r4, #24]
	add	r3, r3, #1
	uxth	r3, r3
	cmp	r3, #1
	strh	r3, [r4, #24]	@ movhi
	bne	.L215
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L215
	ldr	r6, [r4]
	ldr	r3, [r4, #160]
	cmp	r3, #3
	bne	.L265
.L224:
	add	r7, r4, #48
	mov	r2, r4
	mov	r1, #1
	mov	r0, r7
	bl	blocking_notifier_call_chain
	ldr	r5, [r4]
	mov	r3, #0
	mov	r2, #16
	movw	r1, #506
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r2, #23
	movw	r1, #261
	mov	r0, r5
	bl	snd_soc_write
	mov	r1, #5
	mov	r0, r1
	bl	usleep_range
	mov	r3, #128
	movw	r1, #506
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #128
	movw	r1, #507
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r1, #10
	mov	r0, r1
	bl	usleep_range
	mov	r3, #0
	mov	r2, #128
	movw	r1, #507
	mov	r0, r5
	bl	snd_soc_update_bits
	movw	r1, #10000
	mov	r0, r1
	bl	usleep_range
	ldr	r3, [r4, #160]
	cmp	r3, #3
	beq	.L226
	mov	r3, #8
	mov	r0, r5
	mov	r2, r3
	mov	r1, #264
	bl	snd_soc_update_bits
.L227:
	ldr	r3, [r4, #160]
	cmp	r3, #3
	beq	.L228
	mov	r2, #2
	movw	r1, #265
	mov	r0, r6
	bl	snd_soc_write
.L228:
	mov	r1, #1000
	mov	r0, r1
	bl	usleep_range
	ldr	r3, [r4, #160]
	cmp	r3, #3
	mov	r3, #1
	beq	.L229
	mov	r2, r3
	mov	r1, #264
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r1, #1200
	mov	r0, #1000
	bl	usleep_range
	mov	r3, #0
	mov	r2, #2
	movw	r1, #265
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r3, #4
	movw	r1, #265
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r3, #1
	mov	r0, r6
	mov	r2, r3
	movw	r1, #785
	bl	snd_soc_update_bits
.L230:
	mov	r1, #50
	mov	r0, r1
	bl	usleep_range
	mov	r2, r4
	mov	r0, r7
	mov	r1, #2
	bl	blocking_notifier_call_chain
	mov	r3, #1
	str	r3, [r4, #20]
	b	.L215
.L264:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L266
	cmp	r3, #1
	bne	.L215
	movw	r1, #506
	ldr	r0, [r4]
	bl	snd_soc_read
	tst	r0, #128
	beq	.L267
.L244:
	mov	r0, r4
	bl	wcd9xxx_disable_clock_block
	mov	r1, #0
	mov	r0, r4
	bl	wcd9xxx_enable_clock_block
	mov	r3, #2
	str	r3, [r4, #20]
	b	.L215
.L262:
	movw	r7, #:lower16:.LANCHOR0
	movt	r7, #:upper16:.LANCHOR0
	ldrb	r3, [r7, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L216
	movw	r2, #:lower16:.LC0
	movw	r0, #:lower16:.LC1
	ldr	r3, .L269
	movt	r2, #:upper16:.LC0
	movt	r0, #:upper16:.LC1
	mov	r1, #532
	bl	warn_slowpath_fmt
	strb	r6, [r7, #3]
	b	.L216
.L266:
	ldr	r5, [r4]
	ldr	r3, [r4, #160]
	cmp	r3, #3
	bne	.L268
.L233:
	add	r6, r4, #48
	mov	r2, r4
	mov	r0, r6
	mov	r1, #5
	bl	blocking_notifier_call_chain
	ldr	r3, [r4, #160]
	cmp	r3, #3
	beq	.L235
	mov	r3, #0
	mov	r2, #8
	mov	r1, #264
	mov	r0, r5
	bl	snd_soc_update_bits
.L236:
	movw	r1, #506
	mov	r0, r5
	bl	snd_soc_read
	tst	r0, #128
	beq	.L237
	ldr	r3, [r4, #160]
	cmp	r3, #3
	beq	.L238
	mov	r2, #2
	movw	r1, #265
	mov	r0, r5
	bl	snd_soc_write
.L238:
	ldr	r7, [r4]
	mov	r3, #0
	mov	r2, #1
	movw	r1, #261
	mov	r0, r7
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r0, r7
	mov	r2, #128
	movw	r1, #506
	bl	snd_soc_update_bits
	ldr	r3, [r4, #160]
	cmp	r3, #3
	beq	.L239
.L242:
	mov	r3, #4
	mov	r2, #12
	mov	r1, #264
	mov	r0, r5
	bl	snd_soc_update_bits
	ldr	r3, [r4, #160]
	cmp	r3, #3
	beq	.L241
	mov	r3, #1
	mov	r1, #264
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r1, #1200
	mov	r0, #1000
	bl	usleep_range
	mov	r3, #0
	mov	r2, #2
	movw	r1, #265
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #4
	movw	r1, #265
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #1
	mov	r0, r5
	mov	r2, r3
	movw	r1, #785
	bl	snd_soc_update_bits
.L243:
	mov	r1, #50
	mov	r0, r1
	bl	usleep_range
	mov	r2, r4
	mov	r0, r6
	mov	r1, #6
	bl	blocking_notifier_call_chain
	mov	r3, #2
	str	r3, [r4, #20]
	b	.L215
.L265:
	movw	r1, #265
	mov	r0, r6
	bl	snd_soc_read
	tst	r0, #4
	beq	.L224
	movw	r0, #:lower16:.LC1
	movw	r1, #446
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	b	.L224
.L268:
	movw	r1, #265
	mov	r0, r5
	bl	snd_soc_read
	tst	r0, #4
	beq	.L233
	movw	r0, #:lower16:.LC1
	movw	r1, #446
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	b	.L233
.L226:
	mov	r3, #32
	mov	r0, r5
	mov	r2, r3
	mov	r1, #34
	bl	snd_soc_update_bits
	b	.L227
.L235:
	mov	r2, r3
	movw	r1, #1064
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #13
	mov	r2, #15
	mov	r1, #34
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L236
.L263:
	movw	r0, #:lower16:.LC4
	mov	r2, r5
	ldr	r1, .L269
	ldrd	r4, [sp]
	movt	r0, #:upper16:.LC4
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	printk
.L239:
	mov	r0, r7
	mov	r3, #0
	mov	r2, #32
	mov	r1, #34
	bl	snd_soc_update_bits
.L237:
	ldr	r3, [r4, #160]
	cmp	r3, #3
	bne	.L242
.L241:
	mov	r3, #1
	mov	r0, r5
	mov	r2, r3
	movw	r1, #1060
	bl	snd_soc_update_bits
	b	.L243
.L229:
	mov	r0, r6
	mov	r2, r3
	movw	r1, #1060
	bl	snd_soc_update_bits
	b	.L230
.L267:
	movw	r0, #:lower16:.LC1
	mov	r1, #552
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	b	.L244
.L270:
	.align	2
.L269:
	.word	.LANCHOR1+76
	.fnend
	.size	wcd9xxx_resmgr_get_clk_block, .-wcd9xxx_resmgr_get_clk_block
	.align	2
	.global	wcd9xxx_resmgr_put_clk_block
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_put_clk_block, %function
wcd9xxx_resmgr_put_clk_block:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	mov	r5, r1
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r6, [r0, #136]
	cmp	r6, #1
	beq	.L303
.L272:
	cmp	r5, #1
	beq	.L274
	cmp	r5, #2
	bne	.L304
	ldrh	r3, [r4, #26]
	sub	r3, r3, #1
	uxth	r3, r3
	cmp	r3, #0
	strh	r3, [r4, #26]	@ movhi
	bne	.L271
	ldrh	r5, [r4, #24]
	mov	r0, r4
	cmp	r5, #0
	beq	.L305
	bl	wcd9xxx_disable_clock_block
	ldr	r5, [r4]
	ldr	r3, [r4, #160]
	cmp	r3, #3
	bne	.L306
.L285:
	add	r7, r4, #48
	mov	r2, r4
	mov	r1, #1
	mov	r0, r7
	bl	blocking_notifier_call_chain
	ldr	r6, [r4]
	mov	r3, #0
	mov	r2, #16
	movw	r1, #506
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r2, #23
	movw	r1, #261
	mov	r0, r6
	bl	snd_soc_write
	mov	r1, #5
	mov	r0, r1
	bl	usleep_range
	mov	r3, #128
	movw	r1, #506
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r3, #128
	movw	r1, #507
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r1, #10
	mov	r0, r1
	bl	usleep_range
	mov	r3, #0
	mov	r2, #128
	movw	r1, #507
	mov	r0, r6
	bl	snd_soc_update_bits
	movw	r1, #10000
	mov	r0, r1
	bl	usleep_range
	ldr	r3, [r4, #160]
	cmp	r3, #3
	beq	.L287
	mov	r3, #8
	mov	r0, r6
	mov	r2, r3
	mov	r1, #264
	bl	snd_soc_update_bits
.L288:
	ldr	r3, [r4, #160]
	cmp	r3, #3
	bne	.L307
.L289:
	mov	r1, #1000
	mov	r0, r1
	bl	usleep_range
	ldr	r3, [r4, #160]
	cmp	r3, #3
	mov	r3, #1
	beq	.L290
	mov	r2, r3
	mov	r1, #264
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r1, #1200
	mov	r0, #1000
	bl	usleep_range
	mov	r3, #0
	mov	r2, #2
	movw	r1, #265
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #4
	movw	r1, #265
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #1
	mov	r0, r5
	mov	r2, r3
	movw	r1, #785
	bl	snd_soc_update_bits
.L291:
	mov	r1, #50
	mov	r0, r1
	bl	usleep_range
	mov	r2, r4
	mov	r0, r7
	mov	r1, #2
	bl	blocking_notifier_call_chain
	mov	r3, #1
	str	r3, [r4, #20]
.L271:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L274:
	ldrh	r3, [r4, #24]
	sub	r3, r3, #1
	uxth	r3, r3
	cmp	r3, #0
	strh	r3, [r4, #24]	@ movhi
	bne	.L271
	ldr	r3, [r4, #20]
	cmp	r3, #1
	bne	.L271
	mov	r0, r4
	bl	wcd9xxx_disable_clock_block
	movw	r1, #506
	ldr	r0, [r4]
	bl	snd_soc_read
	tst	r0, #128
	beq	.L280
	ldr	r5, [r4]
	ldr	r3, [r4, #160]
	cmp	r3, #3
	beq	.L281
	mov	r0, r5
	mov	r2, #2
	movw	r1, #265
	bl	snd_soc_write
	ldr	r5, [r4]
.L281:
	mov	r3, #0
	mov	r2, #1
	movw	r1, #261
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r2, #128
	movw	r1, #506
	mov	r0, r5
	bl	snd_soc_update_bits
	ldr	r3, [r4, #160]
	cmp	r3, #3
	bne	.L280
	mov	r0, r5
	mov	r3, #0
	mov	r2, #32
	mov	r1, #34
	bl	snd_soc_update_bits
.L280:
	mov	r3, #0
	str	r3, [r4, #20]
	b	.L271
.L305:
	bl	wcd9xxx_disable_clock_block
	str	r5, [r4, #20]
	b	.L271
.L303:
	movw	r7, #:lower16:.LANCHOR0
	movt	r7, #:upper16:.LANCHOR0
	ldrb	r3, [r7, #5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L272
	movw	r2, #:lower16:.LC0
	movw	r0, #:lower16:.LC1
	ldr	r3, .L308
	movt	r2, #:upper16:.LC0
	movt	r0, #:upper16:.LC1
	movw	r1, #573
	bl	warn_slowpath_fmt
	strb	r6, [r7, #5]
	b	.L272
.L306:
	movw	r1, #265
	mov	r0, r5
	bl	snd_soc_read
	tst	r0, #4
	beq	.L285
	movw	r0, #:lower16:.LC1
	movw	r1, #446
	movt	r0, #:upper16:.LC1
	bl	warn_slowpath_null
	b	.L285
.L307:
	mov	r2, #2
	movw	r1, #265
	mov	r0, r5
	bl	snd_soc_write
	b	.L289
.L304:
	movw	r0, #:lower16:.LC4
	mov	r2, r5
	ldr	r1, .L308
	ldrd	r4, [sp]
	movt	r0, #:upper16:.LC4
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	printk
.L287:
	mov	r3, #32
	mov	r0, r6
	mov	r2, r3
	mov	r1, #34
	bl	snd_soc_update_bits
	b	.L288
.L290:
	mov	r0, r5
	mov	r2, r3
	movw	r1, #1060
	bl	snd_soc_update_bits
	b	.L291
.L309:
	.align	2
.L308:
	.word	.LANCHOR1+136
	.fnend
	.size	wcd9xxx_resmgr_put_clk_block, .-wcd9xxx_resmgr_put_clk_block
	.align	2
	.global	wcd9xxx_resmgr_cfilt_get
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_cfilt_get, %function
wcd9xxx_resmgr_cfilt_get:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #1
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	beq	.L312
	bcc	.L313
	cmp	r1, #2
	bne	.L319
	mov	lr, #41
	mov	r5, #308
.L314:
	add	r3, r0, r1, lsl #1
	ldr	r4, [r0]
	ldrh	ip, [r3, #28]
	cmp	ip, #0
	add	ip, ip, #1
	strh	ip, [r3, #28]	@ movhi
	beq	.L320
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L319:
	movw	r2, #:lower16:.LC5
	movw	r0, #:lower16:.LC1
	ldrd	r4, [sp]
	mov	r3, r1
	ldr	r6, [sp, #8]
	movt	r2, #:upper16:.LC5
	ldr	lr, [sp, #12]
	movt	r0, #:upper16:.LC1
	movw	r1, #642
	add	sp, sp, #16
	b	warn_slowpath_fmt
.L313:
	mov	lr, #37
	mov	r5, #296
	b	.L314
.L312:
	mov	lr, #39
	movw	r5, #302
	b	.L314
.L320:
	mov	r2, r0
	mov	r1, lr
	add	r0, r0, #48
	bl	blocking_notifier_call_chain
	mov	r3, #128
	mov	r1, r5
	ldr	r6, [sp, #8]
	mov	r0, r4
	mov	r2, r3
	ldrd	r4, [sp]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	snd_soc_update_bits
	.fnend
	.size	wcd9xxx_resmgr_cfilt_get, .-wcd9xxx_resmgr_cfilt_get
	.align	2
	.global	wcd9xxx_resmgr_cfilt_put
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_cfilt_put, %function
wcd9xxx_resmgr_cfilt_put:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #1
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	beq	.L328
	bcc	.L324
	cmp	r1, #2
	moveq	r6, #36
	moveq	r7, #308
	bne	.L331
.L323:
	add	r4, r0, r1, lsl #1
	mov	r5, r0
	ldr	r8, [r0]
	ldrh	r3, [r4, #28]
	cmp	r3, #0
	beq	.L332
.L326:
	sub	r3, r3, #1
	uxth	r3, r3
	cmp	r3, #0
	strh	r3, [r4, #28]	@ movhi
	beq	.L333
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L333:
	mov	r1, r7
	mov	r0, r8
	mov	r2, #128
	bl	snd_soc_update_bits
	ldr	r8, [sp, #16]
	mov	r2, r5
	mov	r1, r6
	add	r0, r5, #48
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	blocking_notifier_call_chain
.L331:
	movw	r2, #:lower16:.LC5
	movw	r0, #:lower16:.LC1
	ldrd	r4, [sp]
	mov	r3, r1
	ldrd	r6, [sp, #8]
	movt	r2, #:upper16:.LC5
	ldr	r8, [sp, #16]
	movt	r0, #:upper16:.LC1
	movw	r1, #642
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	warn_slowpath_fmt
.L324:
	mov	r6, #32
	mov	r7, #296
	b	.L323
.L328:
	mov	r6, #34
	movw	r7, #302
	b	.L323
.L332:
	movw	r2, #:lower16:.LC6
	movw	r0, #:lower16:.LC1
	movt	r2, #:upper16:.LC6
	movt	r0, #:upper16:.LC1
	movw	r1, #659
	bl	warn_slowpath_fmt
	ldrh	r3, [r4, #28]
	b	.L326
	.fnend
	.size	wcd9xxx_resmgr_cfilt_put, .-wcd9xxx_resmgr_cfilt_put
	.align	2
	.global	wcd9xxx_resmgr_get_k_val
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_get_k_val, %function
wcd9xxx_resmgr_get_k_val:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #44]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L345
.L337:
	.word	.L344
	.word	.L338
	.word	.L339
	.word	.L340
.L344:
	movw	ip, #1800
	mov	r2, #160
.L336:
	cmp	ip, r1
	movcs	r3, #0
	movcc	r3, #1
	cmp	r2, r1
	orrhi	r3, r3, #1
	cmp	r3, #0
	bne	.L345
	.save {r4, lr}
	str	r4, [sp, #-8]!
	lsl	r3, ip, #2
	mov	r0, #4
	str	lr, [sp, #4]
	movw	lr, #35747
	movt	lr, 47662
	b	.L342
.L341:
	add	r0, r0, #1
	cmp	r0, #45
	beq	.L334
.L342:
	umull	r4, r2, lr, r3
	add	r3, r3, ip
	cmp	r1, r2, lsr #5
	bhi	.L341
	sub	r0, r0, #4
.L334:
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L340:
	movw	ip, #2875
	mov	r2, #260
	b	.L336
.L339:
	movw	ip, #2600
	mov	r2, #240
	b	.L336
.L338:
	movw	ip, #2200
	mov	r2, #200
	b	.L336
.L345:
.L335:
	mvn	r0, #21
	bx	lr
	.fnend
	.size	wcd9xxx_resmgr_get_k_val, .-wcd9xxx_resmgr_get_k_val
	.align	2
	.global	wcd9xxx_regmgr_cond_register
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_regmgr_cond_register, %function
wcd9xxx_regmgr_cond_register:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	mov	r7, r0
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	.pad #20
	sub	sp, sp, #20
	add	fp, sp, #16
	str	r1, [fp, #-4]!
	mov	r1, #32
	mov	r0, fp
	bl	_find_first_bit_le
	cmp	r0, #31
	bhi	.L351
	movw	r3, #:lower16:.LC7
	movw	r2, #:lower16:.LC1
	movt	r3, #:upper16:.LC7
	movt	r2, #:upper16:.LC1
	mov	r5, r0
	add	r10, r7, #88
	str	r3, [sp, #4]
	add	r6, r7, #80
	add	r3, r7, #76
	str	r3, [sp]
	str	r2, [sp, #8]
.L360:
	mov	r0, r10
	bl	mutex_lock
	ldr	r3, [r7, #76]
	lsr	r3, r3, r5
	tst	r3, #1
	bne	.L368
.L353:
	mov	r0, r5
	ldr	r1, [sp]
	bl	_set_bit
	ldr	r3, [r7, #76]
	ldr	r4, [r7, #80]
	lsr	r3, r3, r5
	tst	r3, #1
	ldrne	r8, [r7, #72]
	moveq	r8, #1
	lsrne	r8, r8, r5
	andne	r8, r8, #1
	cmp	r6, r4
	beq	.L355
	mov	r9, #1
.L359:
	ldr	r3, [r4, #-4]
	cmp	r5, r3
	bne	.L356
	ldrb	r3, [r4, #-8]	@ zero_extendqisi2
	cmp	r8, #0
	ldr	ip, [r4, #-12]
	ldrh	r1, [r4, #-16]
	ldr	r0, [r7]
	eorne	r3, r3, #1
	lsl	r2, r9, ip
	lsl	r3, r3, ip
	bl	snd_soc_update_bits
.L356:
	ldr	r4, [r4]
	cmp	r6, r4
	bne	.L359
.L355:
	mov	r0, r10
	bl	mutex_unlock
	add	r2, r5, #1
	mov	r1, #32
	mov	r0, fp
	bl	_find_next_bit_le
	cmp	r0, #31
	mov	r5, r0
	bls	.L360
.L351:
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L368:
	mov	r3, r5
	movw	r1, #758
	ldr	r2, [sp, #4]
	ldr	r0, [sp, #8]
	bl	warn_slowpath_fmt
	b	.L353
	.fnend
	.size	wcd9xxx_regmgr_cond_register, .-wcd9xxx_regmgr_cond_register
	.align	2
	.global	wcd9xxx_regmgr_cond_deregister
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_regmgr_cond_deregister, %function
wcd9xxx_regmgr_cond_deregister:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	mov	r7, r0
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	.pad #20
	sub	sp, sp, #20
	add	fp, sp, #16
	str	r1, [fp, #-4]!
	mov	r1, #32
	mov	r0, fp
	bl	_find_first_bit_le
	cmp	r0, #31
	bhi	.L369
	movw	r3, #:lower16:.LC8
	movw	r2, #:lower16:.LC1
	movt	r3, #:upper16:.LC8
	movt	r2, #:upper16:.LC1
	mov	r5, r0
	add	r10, r7, #88
	str	r3, [sp, #4]
	add	r6, r7, #80
	add	r3, r7, #76
	str	r3, [sp]
	str	r2, [sp, #8]
.L378:
	mov	r0, r10
	bl	mutex_lock
	ldr	r3, [r7, #76]
	lsr	r3, r3, r5
	tst	r3, #1
	beq	.L383
.L371:
	mov	r0, r5
	ldr	r1, [sp]
	bl	_clear_bit
	ldr	r3, [r7, #76]
	ldr	r4, [r7, #80]
	lsr	r3, r3, r5
	tst	r3, #1
	ldrne	r8, [r7, #72]
	moveq	r8, #1
	lsrne	r8, r8, r5
	andne	r8, r8, #1
	cmp	r6, r4
	beq	.L373
	mov	r9, #1
.L377:
	ldr	r3, [r4, #-4]
	cmp	r5, r3
	bne	.L374
	ldrb	r3, [r4, #-8]	@ zero_extendqisi2
	cmp	r8, #0
	ldr	ip, [r4, #-12]
	ldrh	r1, [r4, #-16]
	ldr	r0, [r7]
	eorne	r3, r3, #1
	lsl	r2, r9, ip
	lsl	r3, r3, ip
	bl	snd_soc_update_bits
.L374:
	ldr	r4, [r4]
	cmp	r6, r4
	bne	.L377
.L373:
	mov	r0, r10
	bl	mutex_unlock
	add	r2, r5, #1
	mov	r1, #32
	mov	r0, fp
	bl	_find_next_bit_le
	cmp	r0, #31
	mov	r5, r0
	bls	.L378
.L369:
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L383:
	mov	r3, r5
	movw	r1, #774
	ldr	r2, [sp, #4]
	ldr	r0, [sp, #8]
	bl	warn_slowpath_fmt
	b	.L371
	.fnend
	.size	wcd9xxx_regmgr_cond_deregister, .-wcd9xxx_regmgr_cond_deregister
	.align	2
	.global	wcd9xxx_resmgr_cond_update_cond
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_cond_update_cond, %function
wcd9xxx_resmgr_cond_update_cond:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r1
	strd	r6, [sp, #8]
	add	r7, r0, #88
	mov	r6, r0
	strd	r8, [sp, #16]
	mov	r0, r7
	mov	r8, r2
	str	r10, [sp, #24]
	add	r4, r6, #72
	str	lr, [sp, #28]
	bl	mutex_lock
	cmp	r8, #0
	mov	r1, r4
	mov	r0, r5
	bne	.L396
	bl	_test_and_clear_bit
	cmp	r0, #0
	beq	.L386
.L392:
	cmp	r5, #0
	add	r3, r5, #31
	movge	r3, r5
	add	r2, r6, #76
	asr	r3, r3, #5
	and	r1, r5, #31
	mov	r8, r6
	ldr	r2, [r2, r3, lsl #2]
	lsr	r2, r2, r1
	tst	r2, #1
	ldrne	r9, [r4, r3, lsl #2]
	moveq	r9, #1
	ldr	r4, [r8, #80]!
	lsrne	r9, r9, r1
	andne	r9, r9, #1
	cmp	r4, r8
	beq	.L386
	mov	r10, #1
.L391:
	ldr	r3, [r4, #-4]
	cmp	r5, r3
	bne	.L388
	ldrb	r3, [r4, #-8]	@ zero_extendqisi2
	cmp	r9, #0
	ldr	ip, [r4, #-12]
	ldrh	r1, [r4, #-16]
	ldr	r0, [r6]
	eorne	r3, r3, #1
	lsl	r2, r10, ip
	lsl	r3, r3, ip
	bl	snd_soc_update_bits
.L388:
	ldr	r4, [r4]
	cmp	r4, r8
	bne	.L391
.L386:
	mov	r0, r7
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	ldr	lr, [sp, #28]
	add	sp, sp, #32
	b	mutex_unlock
.L396:
	bl	_test_and_set_bit
	cmp	r0, #0
	bne	.L386
	b	.L392
	.fnend
	.size	wcd9xxx_resmgr_cond_update_cond, .-wcd9xxx_resmgr_cond_update_cond
	.align	2
	.global	wcd9xxx_resmgr_add_cond_update_bits
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_add_cond_update_bits, %function
wcd9xxx_resmgr_add_cond_update_bits:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:kmalloc_caches
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r1
	movt	ip, #:upper16:kmalloc_caches
	strd	r6, [sp, #8]
	mov	r6, r0
	strd	r8, [sp, #16]
	mov	r7, r2
	ldrb	r9, [sp, #32]	@ zero_extendqisi2
	str	r10, [sp, #24]
	mov	r10, r3
	str	lr, [sp, #28]
	ldr	r0, [ip, #24]
	cmp	r0, #0
	beq	.L406
	mov	r2, #24
	mov	r1, #208
	bl	kmem_cache_alloc_trace
	subs	r4, r0, #0
	beq	.L411
.L398:
	add	r8, r6, #88
	strh	r7, [r4]	@ movhi
	add	r7, r6, #80
	mov	r0, r8
	str	r10, [r4, #4]
	strb	r9, [r4, #8]
	str	r5, [r4, #12]
	bl	mutex_lock
	ldr	r1, [r6, #84]
	cmp	r5, #0
	add	r3, r5, #31
	movge	r3, r5
	add	r0, r4, #16
	asr	r3, r3, #5
	add	r2, r6, #76
	str	r0, [r6, #84]
	str	r7, [r4, #16]
	str	r1, [r4, #20]
	str	r0, [r1]
	ldr	r2, [r2, r3, lsl #2]
	and	r1, r5, #31
	lsr	r2, r2, r1
	tst	r2, #1
	moveq	r9, #1
	bne	.L412
.L400:
	ldr	r4, [r6, #80]
	cmp	r7, r4
	beq	.L401
	mov	r10, #1
.L405:
	ldr	r3, [r4, #-4]
	cmp	r5, r3
	bne	.L402
	ldrb	r3, [r4, #-8]	@ zero_extendqisi2
	cmp	r9, #0
	ldr	ip, [r4, #-12]
	ldrh	r1, [r4, #-16]
	ldr	r0, [r6]
	eorne	r3, r3, #1
	lsl	r2, r10, ip
	lsl	r3, r3, ip
	bl	snd_soc_update_bits
.L402:
	ldr	r4, [r4]
	cmp	r7, r4
	bne	.L405
.L401:
	mov	r0, r8
	bl	mutex_unlock
	mov	r0, #0
.L397:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L412:
	add	r2, r6, #72
	ldr	r9, [r2, r3, lsl #2]
	lsr	r9, r9, r1
	and	r9, r9, #1
	b	.L400
.L406:
	mov	r4, #16
	b	.L398
.L411:
	mvn	r0, #11
	b	.L397
	.fnend
	.size	wcd9xxx_resmgr_add_cond_update_bits, .-wcd9xxx_resmgr_add_cond_update_bits
	.align	2
	.global	wcd9xxx_resmgr_rm_cond_update_bits
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_rm_cond_update_bits, %function
wcd9xxx_resmgr_rm_cond_update_bits:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r2
	strd	r6, [sp, #8]
	mov	r7, r3
	strd	r8, [sp, #16]
	add	r8, r0, #88
	mov	r9, r0
	mov	r0, r8
	str	r10, [sp, #24]
	ldrb	r10, [sp, #32]	@ zero_extendqisi2
	str	lr, [sp, #28]
	bl	mutex_lock
	mov	r2, r9
	ldr	r4, [r2, #80]!
	cmp	r2, r4
	ldr	r3, [r4]
	bne	.L417
	b	.L424
.L415:
	cmp	r2, r3
	ldr	r0, [r3]
	beq	.L425
	mov	r4, r3
	mov	r3, r0
.L417:
	ldrh	r0, [r4, #-16]
	sub	r6, r4, #16
	cmp	r0, r5
	bne	.L415
	ldr	r1, [r4, #-12]
	cmp	r1, r7
	bne	.L415
	ldrb	r1, [r4, #-8]	@ zero_extendqisi2
	cmp	r1, r10
	bne	.L415
	mov	r2, #1
	lsl	r3, r10, r7
	ldr	r0, [r9]
	mov	r1, r5
	lsl	r2, r2, r7
	bl	snd_soc_update_bits
	ldrd	r2, [r4]
	mov	ip, #256
	mov	r1, #512
	mov	r0, r8
	str	r3, [r2, #4]
	str	r2, [r3]
	str	ip, [r4]
	str	r1, [r4, #4]
	bl	mutex_unlock
	mov	r0, r6
	bl	kfree
	mov	r0, #0
.L413:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L425:
	mov	r0, r8
	bl	mutex_unlock
	cmp	r6, #0
	ldrhne	r2, [r4, #-16]
	moveq	r2, r6
	ldrne	r3, [r4, #-12]
	moveq	r3, r2
.L419:
	movw	r0, #:lower16:.LC9
	ldr	r1, .L426
	movt	r0, #:upper16:.LC9
	bl	printk
	mvn	r0, #21
	b	.L413
.L424:
	mov	r0, r8
	bl	mutex_unlock
	mov	r2, #0
	mov	r3, r2
	b	.L419
.L427:
	.align	2
.L426:
	.word	.LANCHOR1+168
	.fnend
	.size	wcd9xxx_resmgr_rm_cond_update_bits, .-wcd9xxx_resmgr_rm_cond_update_bits
	.align	2
	.global	wcd9xxx_resmgr_register_notifier
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_register_notifier, %function
wcd9xxx_resmgr_register_notifier:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r0, r0, #48
	b	blocking_notifier_chain_register
	.fnend
	.size	wcd9xxx_resmgr_register_notifier, .-wcd9xxx_resmgr_register_notifier
	.align	2
	.global	wcd9xxx_resmgr_unregister_notifier
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_unregister_notifier, %function
wcd9xxx_resmgr_unregister_notifier:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r0, r0, #48
	b	blocking_notifier_chain_unregister
	.fnend
	.size	wcd9xxx_resmgr_unregister_notifier, .-wcd9xxx_resmgr_unregister_notifier
	.align	2
	.global	wcd9xxx_resmgr_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_init, %function
wcd9xxx_resmgr_init:
	.fnstart
	@ args = 12, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	movw	r5, #:lower16:.LANCHOR3
	strd	r6, [sp, #8]
	ldr	r7, [sp, #28]
	mov	r6, #0
	ldr	ip, [sp, #32]
	add	r0, r0, #80
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	lr, [sp, #24]
	movt	r5, #:upper16:.LANCHOR3
	stm	r4, {r1, r2}
	movw	r1, #:lower16:.LC10
	mov	r2, r5
	str	r6, [r4, #12]
	movt	r1, #:upper16:.LC10
	str	r7, [r4, #36]
	str	r3, [r4, #40]
	str	lr, [r4, #44]
	str	r0, [r4, #80]
	str	r0, [r4, #84]
	add	r0, r4, #48
	str	ip, [r4, #160]
	bl	__init_rwsem
	movw	r1, #:lower16:.LC11
	mov	r2, r5
	str	r6, [r4, #64]
	add	r0, r4, #112
	movt	r1, #:upper16:.LC11
	bl	__mutex_init
	movw	r1, #:lower16:.LC12
	mov	r2, r5
	add	r0, r4, #136
	movt	r1, #:upper16:.LC12
	bl	__mutex_init
	movw	r1, #:lower16:.LC13
	add	r0, r4, #88
	mov	r2, r5
	movt	r1, #:upper16:.LC13
	bl	__mutex_init
	ldrd	r4, [sp]
	mov	r0, r6
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
	.fnend
	.size	wcd9xxx_resmgr_init, .-wcd9xxx_resmgr_init
	.align	2
	.global	wcd9xxx_resmgr_deinit
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_deinit, %function
wcd9xxx_resmgr_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	wcd9xxx_resmgr_deinit, .-wcd9xxx_resmgr_deinit
	.align	2
	.global	wcd9xxx_resmgr_bcl_lock
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_bcl_lock, %function
wcd9xxx_resmgr_bcl_lock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r0, r0, #112
	b	mutex_lock
	.fnend
	.size	wcd9xxx_resmgr_bcl_lock, .-wcd9xxx_resmgr_bcl_lock
	.align	2
	.global	wcd9xxx_resmgr_bcl_unlock
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_resmgr_bcl_unlock, %function
wcd9xxx_resmgr_bcl_unlock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r0, r0, #112
	b	mutex_unlock
	.fnend
	.size	wcd9xxx_resmgr_bcl_unlock, .-wcd9xxx_resmgr_bcl_unlock
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.29165, %object
	.size	__func__.29165, 28
__func__.29165:
	.ascii	"wcd9xxx_disable_clock_block\000"
	.type	__func__.29198, %object
	.size	__func__.29198, 27
__func__.29198:
	.ascii	"wcd9xxx_resmgr_get_bandgap\000"
	.space	1
	.type	__func__.29254, %object
	.size	__func__.29254, 19
__func__.29254:
	.ascii	"wcd9xxx_save_clock\000"
	.space	1
	.type	__func__.29265, %object
	.size	__func__.29265, 29
__func__.29265:
	.ascii	"wcd9xxx_resmgr_get_clk_block\000"
	.space	3
	.type	__func__.29217, %object
	.size	__func__.29217, 27
__func__.29217:
	.ascii	"wcd9xxx_resmgr_put_bandgap\000"
	.space	1
	.type	__func__.29281, %object
	.size	__func__.29281, 29
__func__.29281:
	.ascii	"wcd9xxx_resmgr_put_clk_block\000"
	.space	3
	.type	__func__.29398, %object
	.size	__func__.29398, 35
__func__.29398:
	.ascii	"wcd9xxx_resmgr_rm_cond_update_bits\000"
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	wcd9xxx_event_string, %object
	.size	wcd9xxx_event_string, 3264
wcd9xxx_event_string:
	.ascii	"WCD9XXX_EVENT_INVALID\000"
	.space	42
	.ascii	"WCD9XXX_EVENT_PRE_RCO_ON\000"
	.space	39
	.ascii	"WCD9XXX_EVENT_POST_RCO_ON\000"
	.space	38
	.ascii	"WCD9XXX_EVENT_PRE_RCO_OFF\000"
	.space	38
	.ascii	"WCD9XXX_EVENT_POST_RCO_OFF\000"
	.space	37
	.ascii	"WCD9XXX_EVENT_PRE_MCLK_ON\000"
	.space	38
	.ascii	"WCD9XXX_EVENT_POST_MCLK_ON\000"
	.space	37
	.ascii	"WCD9XXX_EVENT_PRE_MCLK_OFF\000"
	.space	37
	.ascii	"WCD9XXX_EVENT_POST_MCLK_OFF\000"
	.space	36
	.ascii	"WCD9XXX_EVENT_PRE_BG_OFF\000"
	.space	39
	.ascii	"WCD9XXX_EVENT_POST_BG_OFF\000"
	.space	38
	.ascii	"WCD9XXX_EVENT_PRE_BG_AUDIO_ON\000"
	.space	34
	.ascii	"WCD9XXX_EVENT_POST_BG_AUDIO_ON\000"
	.space	33
	.ascii	"WCD9XXX_EVENT_PRE_BG_MBHC_ON\000"
	.space	35
	.ascii	"WCD9XXX_EVENT_POST_BG_MBHC_ON\000"
	.space	34
	.ascii	"WCD9XXX_EVENT_PRE_MICBIAS_1_OFF\000"
	.space	32
	.ascii	"WCD9XXX_EVENT_POST_MICBIAS_1_OFF\000"
	.space	31
	.ascii	"WCD9XXX_EVENT_PRE_MICBIAS_2_OFF\000"
	.space	32
	.ascii	"WCD9XXX_EVENT_POST_MICBIAS_2_OFF\000"
	.space	31
	.ascii	"WCD9XXX_EVENT_PRE_MICBIAS_3_OFF\000"
	.space	32
	.ascii	"WCD9XXX_EVENT_POST_MICBIAS_3_OFF\000"
	.space	31
	.ascii	"WCD9XXX_EVENT_PRE_MICBIAS_4_OFF\000"
	.space	32
	.ascii	"WCD9XXX_EVENT_POST_MICBIAS_4_OFF\000"
	.space	31
	.ascii	"WCD9XXX_EVENT_PRE_MICBIAS_1_ON\000"
	.space	33
	.ascii	"WCD9XXX_EVENT_POST_MICBIAS_1_ON\000"
	.space	32
	.ascii	"WCD9XXX_EVENT_PRE_MICBIAS_2_ON\000"
	.space	33
	.ascii	"WCD9XXX_EVENT_POST_MICBIAS_2_ON\000"
	.space	32
	.ascii	"WCD9XXX_EVENT_PRE_MICBIAS_3_ON\000"
	.space	33
	.ascii	"WCD9XXX_EVENT_POST_MICBIAS_3_ON\000"
	.space	32
	.ascii	"WCD9XXX_EVENT_PRE_MICBIAS_4_ON\000"
	.space	33
	.ascii	"WCD9XXX_EVENT_POST_MICBIAS_4_ON\000"
	.space	32
	.ascii	"WCD9XXX_EVENT_PRE_CFILT_1_OFF\000"
	.space	34
	.ascii	"WCD9XXX_EVENT_POST_CFILT_1_OFF\000"
	.space	33
	.ascii	"WCD9XXX_EVENT_PRE_CFILT_2_OFF\000"
	.space	34
	.ascii	"WCD9XXX_EVENT_POST_CFILT_2_OFF\000"
	.space	33
	.ascii	"WCD9XXX_EVENT_PRE_CFILT_3_OFF\000"
	.space	34
	.ascii	"WCD9XXX_EVENT_POST_CFILT_3_OFF\000"
	.space	33
	.ascii	"WCD9XXX_EVENT_PRE_CFILT_1_ON\000"
	.space	35
	.ascii	"WCD9XXX_EVENT_POST_CFILT_1_ON\000"
	.space	34
	.ascii	"WCD9XXX_EVENT_PRE_CFILT_2_ON\000"
	.space	35
	.ascii	"WCD9XXX_EVENT_POST_CFILT_2_ON\000"
	.space	34
	.ascii	"WCD9XXX_EVENT_PRE_CFILT_3_ON\000"
	.space	35
	.ascii	"WCD9XXX_EVENT_POST_CFILT_3_ON\000"
	.space	34
	.ascii	"WCD9XXX_EVENT_PRE_HPHL_PA_ON\000"
	.space	35
	.ascii	"WCD9XXX_EVENT_POST_HPHL_PA_OFF\000"
	.space	33
	.ascii	"WCD9XXX_EVENT_PRE_HPHR_PA_ON\000"
	.space	35
	.ascii	"WCD9XXX_EVENT_POST_HPHR_PA_OFF\000"
	.space	33
	.ascii	"WCD9XXX_EVENT_POST_RESUME\000"
	.space	38
	.ascii	"WCD9XXX_EVENT_PRE_TX_1_3_ON\000"
	.space	36
	.ascii	"WCD9XXX_EVENT_POST_TX_1_3_OFF\000"
	.space	34
	.ascii	"WCD9XXX_EVENT_LAST\000"
	.space	45
	.bss
	.align	2
	.set	.LANCHOR3,. + 0
	.type	__key.29429, %object
	.size	__key.29429, 0
__key.29429:
	.type	__key.29430, %object
	.size	__key.29430, 0
__key.29430:
	.type	__key.29431, %object
	.size	__key.29431, 0
__key.29431:
	.type	__key.29432, %object
	.size	__key.29432, 0
__key.29432:
	.section	.data.unlikely,"aw",%progbits
	.set	.LANCHOR0,. + 0
	.type	__warned.29166, %object
	.size	__warned.29166, 1
__warned.29166:
	.space	1
	.type	__warned.29199, %object
	.size	__warned.29199, 1
__warned.29199:
	.space	1
	.type	__warned.29251, %object
	.size	__warned.29251, 1
__warned.29251:
	.space	1
	.type	__warned.29266, %object
	.size	__warned.29266, 1
__warned.29266:
	.space	1
	.type	__warned.29218, %object
	.size	__warned.29218, 1
__warned.29218:
	.space	1
	.type	__warned.29282, %object
	.size	__warned.29282, 1
__warned.29282:
	.space	1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%s: BG_CLK lock should have acquired\012\000"
	.space	2
.LC1:
	.ascii	"/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/w"
	.ascii	"cd9xxx-resmgr.c\000"
	.space	1
.LC2:
	.ascii	"<3>%s: Error, Invalid bandgap settings\012\000"
.LC3:
	.ascii	"Unexpected bandgap type %d\012\000"
.LC4:
	.ascii	"<3>%s: Error, Invalid clock get request %d\012\000"
.LC5:
	.ascii	"Invalid CFILT selection %d\012\000"
.LC6:
	.ascii	"Invalid CFILT use count 0\012\000"
	.space	1
.LC7:
	.ascii	"Condition 0x%0x is already registered\012\000"
	.space	1
.LC8:
	.ascii	"Condition 0x%0x isn't registered\012\000"
	.space	2
.LC9:
	.ascii	"<3>%s: Cannot find update bit entry reg 0x%x, shift"
	.ascii	" %d\012\000"
.LC10:
	.ascii	"&(&resmgr->notifier)->rwsem\000"
.LC11:
	.ascii	"&resmgr->codec_resource_lock\000"
	.space	3
.LC12:
	.ascii	"&resmgr->codec_bg_clk_lock\000"
	.space	1
.LC13:
	.ascii	"&resmgr->update_bit_cond_lock\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
