wcd9xxx_set_fclk_get_ncp:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	mov	r3, #0
	mov	r5, r1
	str	lr, [sp, #8]
	add	lr, r1, r2, lsl #2
	.pad #12
	sub	sp, sp, #12
	mov	r1, #404
	ldr	ip, [lr, #20]
	mov	r2, #16
	mov	r4, r0
	add	ip, ip, #1
	str	ip, [lr, #20]
	bl	snd_soc_update_bits
	ldr	r3, [r5, #20]
	cmp	r3, #0
	bgt	.L8
	ldr	r1, [r5, #24]
	cmp	r1, #0
	bgt	.L9
	movw	r5, #:lower16:.LANCHOR0
	movt	r5, #:upper16:.LANCHOR0
	ldrb	r2, [r5]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L10
.L3:
	mov	r3, #32
	mov	r1, #404
	mov	r2, r3
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r3, #1
	mov	r0, r4
	mov	r2, r3
	movw	r1, #402
	bl	snd_soc_update_bits
	cmp	r0, #0
	bne	.L11
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L9:
	mov	r3, #5
	mov	r2, #15
	mov	r1, #404
	mov	r0, r4
	bl	snd_soc_update_bits
	b	.L3
.L8:
	mov	r3, #8
	mov	r2, #15
	mov	r1, #404
	mov	r0, r4
	bl	snd_soc_update_bits
	b	.L3
.L11:
	mov	r1, #50
	mov	r0, r1
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldr	lr, [sp, #8]
	add	sp, sp, #12
	b	usleep_range
.L10:
	movw	r2, #:lower16:.LC4
	movw	r0, #:lower16:.LC5
	str	r1, [sp]
	movt	r2, #:upper16:.LC4
	movt	r0, #:upper16:.LC5
	mov	r1, #768
	bl	warn_slowpath_fmt
	mov	r3, #1
	strb	r3, [r5]
	b	.L3
	.fnend
	.size	wcd9xxx_set_fclk_get_ncp, .-wcd9xxx_set_fclk_get_ncp
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_clsh_state_err, %function
wcd9xxx_clsh_state_err:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r0, #:lower16:.LC5
	movw	r1, #1274
	movt	r0, #:upper16:.LC5
	b	warn_slowpath_null
	.fnend
	.size	wcd9xxx_clsh_state_err, .-wcd9xxx_clsh_state_err
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_clsh_state_hph_st, %function
wcd9xxx_clsh_state_hph_st:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	.save {lr}
	str	lr, [sp, #-4]!
	.pad #12
	sub	sp, sp, #12
	beq	.L14
	cmp	r2, #2
	beq	.L19
	cmp	r2, #4
	bne	.L13
	mov	ip, #0
	ldr	r0, [r1, #28]
	mov	r3, #2
	mov	r2, #800
	mov	r1, #1
	str	ip, [sp]
	bl	wcd9xxx_resmgr_add_cond_update_bits
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L14:
	cmp	r2, #2
	beq	.L20
	cmp	r2, #4
	beq	.L21
.L13:
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L19:
	mov	ip, #0
	ldr	r0, [r1, #28]
	mov	r3, #3
	mov	r2, #800
	mov	r1, #1
	str	ip, [sp]
	bl	wcd9xxx_resmgr_add_cond_update_bits
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L20:
	ldr	r0, [r1, #28]
	mov	r2, #800
	mov	r1, #1
	str	r3, [sp]
	mov	r3, #3
	bl	wcd9xxx_resmgr_rm_cond_update_bits
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L21:
	ldr	r0, [r1, #28]
	mov	r2, #800
	mov	r1, #1
	str	r3, [sp]
	mov	r3, #2
	bl	wcd9xxx_resmgr_rm_cond_update_bits
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
	.fnend
	.size	wcd9xxx_clsh_state_hph_st, .-wcd9xxx_clsh_state_hph_st
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_clsh_state_hph_ear_lo, %function
wcd9xxx_clsh_state_hph_ear_lo:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	tst	r2, #2
	strd	r4, [sp, #-20]!
	.save {r4, r5, r6, r7, lr}
	and	r5, r2, #4
	strd	r6, [sp, #8]
	and	r4, r2, #1
	mov	r7, r0
	str	lr, [sp, #16]
	mov	r6, r1
	.pad #12
	sub	sp, sp, #12
	bne	.L40
	cmp	r5, #0
	bne	.L41
	cmp	r4, #0
	bne	.L42
.L22:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
.L41:
	cmp	r3, #0
	bne	.L31
.L28:
	mov	ip, #0
	ldr	r0, [r6, #28]
	mov	r3, #2
	mov	r2, #800
	mov	r1, #1
	str	ip, [sp]
	bl	wcd9xxx_resmgr_rm_cond_update_bits
	cmp	r4, #0
	beq	.L22
.L34:
	mov	r3, #0
.L33:
	mov	r0, r7
	mov	r2, #16
	mov	r1, #800
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	lr, [sp, #16]
	add	sp, sp, #20
	b	snd_soc_update_bits
.L40:
	cmp	r3, #0
	ldr	r0, [r1, #28]
	bne	.L43
	str	r3, [sp]
	mov	r2, #800
	mov	r1, #1
	mov	r3, #3
	bl	wcd9xxx_resmgr_rm_cond_update_bits
	cmp	r5, #0
	bne	.L28
	cmp	r4, #0
	beq	.L22
	b	.L34
.L43:
	mov	r1, #0
	mov	r3, #3
	mov	r2, #800
	str	r1, [sp]
	mov	r1, #1
	bl	wcd9xxx_resmgr_add_cond_update_bits
	cmp	r5, #0
	bne	.L31
	cmp	r4, #0
	beq	.L22
	b	.L26
.L31:
	mov	ip, #0
	ldr	r0, [r6, #28]
	mov	r3, #2
	mov	r2, #800
	mov	r1, #1
	str	ip, [sp]
	bl	wcd9xxx_resmgr_add_cond_update_bits
	cmp	r4, #0
	beq	.L22
.L26:
	mov	r3, #16
	b	.L33
.L42:
	cmp	r3, #0
	beq	.L34
	b	.L26
	.fnend
	.size	wcd9xxx_clsh_state_hph_ear_lo, .-wcd9xxx_clsh_state_hph_ear_lo
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_clsh_state_hph_lo, %function
wcd9xxx_clsh_state_hph_lo:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	ip, r3, #0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r2
	strd	r6, [sp, #8]
	mov	r6, r1
	mov	r7, r0
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	.pad #24
	sub	sp, sp, #24
	beq	.L45
	ldrb	r3, [r1]	@ zero_extendqisi2
	cmp	r2, #8
	cmpne	r3, #8
	beq	.L79
.L47:
	cmp	r4, #2
	beq	.L80
	cmp	r4, #4
	beq	.L81
.L44:
	add	sp, sp, #24
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L45:
	cmp	r2, #4
	beq	.L56
	cmp	r2, #8
	beq	.L57
	cmp	r2, #2
	beq	.L82
	ldrb	r3, [r6]	@ zero_extendqisi2
	bic	r3, r3, r4
	cmp	r3, #8
	bne	.L44
.L87:
	ldr	r3, [r6, #20]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6, #20]
	bne	.L62
.L78:
	ldr	r3, [r6, #24]
	cmp	r3, #0
	beq	.L83
	mov	r3, #5
	mov	r2, #15
	mov	r1, #404
	mov	r0, r7
	bl	snd_soc_update_bits
.L62:
	mov	r3, #0
	mov	r2, #16
	mov	r1, #404
	mov	r0, r7
	bl	snd_soc_update_bits
	mov	r1, #60
	mov	r0, #50
	bl	usleep_range
	tst	r4, #6
	beq	.L44
	mov	r1, #60
	mov	r0, #50
	bl	usleep_range
	ldr	r2, [r6, #4]
	movw	r3, #30528
	movt	r3, 27
	cmp	r2, r3
	bne	.L65
	ldr	r3, [r6, #16]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6, #16]
	beq	.L84
.L66:
	mov	r3, #16
	mov	r1, #404
	mov	r2, r3
	mov	r0, r7
	bl	snd_soc_update_bits
	mov	r1, #60
	mov	r0, #50
	bl	usleep_range
.L67:
	mov	r3, #0
	mov	r2, #4
	movw	r1, #385
	mov	r0, r7
	bl	snd_soc_update_bits
	mov	r0, r7
	mov	r3, #230
	mov	r2, #255
	mov	r1, #388
	add	sp, sp, #24
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	snd_soc_update_bits
.L79:
	mov	r3, #8
	movw	r2, #387
	movw	r1, #514
	movw	ip, #389
	movw	lr, #257
	strh	r2, [sp, #12]	@ movhi
	mov	r2, r3
	strh	r3, [sp, #14]	@ movhi
	mov	r3, #0
	add	r5, sp, #12
	strh	ip, [sp, #16]	@ movhi
	strh	r1, [sp, #18]	@ movhi
	movw	r1, #385
	strh	ip, [sp, #20]	@ movhi
	strh	lr, [sp, #22]	@ movhi
	bl	snd_soc_update_bits
	mov	r3, #255
	mov	r1, #388
	mov	r2, r3
	mov	r0, r7
	bl	snd_soc_update_bits
	add	r8, sp, #24
.L48:
	ldrb	r3, [r5, #3]	@ zero_extendqisi2
	mov	r0, r7
	ldrb	r2, [r5, #2]	@ zero_extendqisi2
	ldrh	r1, [r5], #4
	bl	snd_soc_update_bits
	cmp	r8, r5
	bne	.L48
	mov	r1, #60
	mov	r0, #50
	bl	usleep_range
	mov	r2, #0
	mov	r1, r6
	mov	r0, r7
	bl	wcd9xxx_set_fclk_get_ncp
	tst	r4, #6
	beq	.L47
	mov	r3, #16
	mov	r1, #404
	mov	r2, r3
	mov	r0, r7
	bl	snd_soc_update_bits
	mov	r1, #60
	mov	r0, #50
	bl	usleep_range
	ldr	r3, [r6, #12]
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r6, #12]
	beq	.L85
.L50:
	movw	r2, #:lower16:.LANCHOR1
	movt	r2, #:upper16:.LANCHOR1
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r2]
	beq	.L86
.L51:
	mov	r3, #2
	mov	r0, r7
	mov	r2, r3
	mov	r1, #800
	bl	snd_soc_update_bits
	b	.L47
.L56:
	mov	r3, #2
	ldr	r0, [r6, #28]
	mov	r2, #800
	mov	r1, #1
	str	ip, [sp]
	bl	wcd9xxx_resmgr_rm_cond_update_bits
	ldrb	r3, [r6]	@ zero_extendqisi2
	bic	r3, r3, r4
	cmp	r3, #8
	bne	.L44
	b	.L87
.L80:
	mov	ip, #0
	ldr	r0, [r6, #28]
	mov	r3, #3
	mov	r2, #800
	mov	r1, #1
	str	ip, [sp]
	bl	wcd9xxx_resmgr_add_cond_update_bits
	b	.L44
.L82:
	mov	r3, #3
	ldr	r0, [r6, #28]
	mov	r2, #800
	mov	r1, #1
	str	ip, [sp]
	bl	wcd9xxx_resmgr_rm_cond_update_bits
	ldrb	r3, [r6]	@ zero_extendqisi2
	bic	r3, r3, r4
	cmp	r3, #8
	bne	.L44
	b	.L87
.L57:
	mov	r2, #32
	mov	r1, #404
	bl	snd_soc_update_bits
	movw	r2, #387
	movw	r3, #389
	movw	r0, #2056
	mvn	r1, #64768
	strh	r2, [sp, #12]	@ movhi
	add	r5, sp, #12
	movw	r2, #257
	add	r8, sp, #24
	strh	r0, [sp, #14]	@ movhi
	strh	r3, [sp, #16]	@ movhi
	strh	r1, [sp, #18]	@ movhi
	strh	r3, [sp, #20]	@ movhi
	strh	r2, [sp, #22]	@ movhi
.L59:
	ldrb	r3, [r5, #3]	@ zero_extendqisi2
	mov	r0, r7
	ldrb	r2, [r5, #2]	@ zero_extendqisi2
	ldrh	r1, [r5], #4
	bl	snd_soc_update_bits
	cmp	r8, r5
	bne	.L59
	mov	r1, #60
	mov	r0, #50
	bl	usleep_range
	ldr	r3, [r6, #20]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6, #20]
	beq	.L78
	mov	r0, r7
	mov	r3, #0
	mov	r2, #16
	mov	r1, #404
	bl	snd_soc_update_bits
	mov	r1, #60
	mov	r0, #50
	add	sp, sp, #24
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	usleep_range
.L81:
	mov	ip, #0
	ldr	r0, [r6, #28]
	mov	r3, #2
	mov	r2, #800
	mov	r1, #1
	str	ip, [sp]
	bl	wcd9xxx_resmgr_add_cond_update_bits
	b	.L44
.L65:
	mov	r1, #60
	mov	r0, #50
	bl	usleep_range
	mov	r3, #1
	movw	r1, #389
	mov	r2, r3
	mov	r0, r7
	bl	snd_soc_update_bits
	mov	r3, #8
	mov	r2, #252
	movw	r1, #389
	mov	r0, r7
	bl	snd_soc_update_bits
	b	.L67
.L83:
	mov	r2, #1
	movw	r1, #402
	mov	r0, r7
	bl	snd_soc_update_bits
	b	.L62
.L85:
	mov	r2, r3
	mov	r1, #800
	mov	r0, r7
	bl	snd_soc_update_bits
	b	.L50
.L84:
	mov	r2, #128
	movw	r1, #385
	mov	r0, r7
	bl	snd_soc_update_bits
	b	.L66
.L86:
	mov	r2, r3
	mov	r1, #780
	mov	r0, r7
	bl	snd_soc_update_bits
	b	.L51
	.fnend
	.size	wcd9xxx_clsh_state_hph_lo, .-wcd9xxx_clsh_state_hph_lo
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_clsh_state_hph_r, %function
wcd9xxx_clsh_state_hph_r:
	.fnstart
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	strd	r4, [sp, #-28]!
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	strd	r6, [sp, #8]
	mov	r6, r1
	strd	r8, [sp, #16]
	str	lr, [sp, #24]
	.pad #84
	sub	sp, sp, #84
	beq	.L89
	movw	ip, #:lower16:.LANCHOR2
	add	r4, sp, #12
	movt	ip, #:upper16:.LANCHOR2
	add	r7, sp, #52
	ldrd	r0, [ip]
	ldrd	r2, [ip, #8]
	ldrd	r8, [ip, #16]
	strd	r0, [sp, #12]
	ldrd	r0, [ip, #32]
	strd	r2, [sp, #20]
	ldrd	r2, [ip, #24]
	strd	r8, [sp, #28]
	strd	r2, [sp, #36]
	strd	r0, [sp, #44]
.L90:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, r5
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldrh	r1, [r4], #4
	bl	snd_soc_update_bits
	cmp	r7, r4
	bne	.L90
	add	r0, sp, #12
	mov	r2, #68
	ldr	r1, .L122
	mov	r4, r0
	add	r7, sp, #80
	bl	memcpy
.L91:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, r5
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldrh	r1, [r4], #4
	bl	snd_soc_update_bits
	cmp	r7, r4
	bne	.L91
	ldr	r3, [r6, #12]
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r6, #12]
	beq	.L112
.L92:
	movw	r2, #:lower16:.LANCHOR1
	movt	r2, #:upper16:.LANCHOR1
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r2]
	beq	.L113
.L93:
	mov	r3, #2
	mov	r1, #800
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	ip, #0
	mov	r3, #2
	ldr	r0, [r6, #28]
	mov	r2, #800
	mov	r1, #1
	str	ip, [sp]
	bl	wcd9xxx_resmgr_add_cond_update_bits
	ldrb	r3, [r6, #32]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L114
	movw	r2, #389
	movw	r3, #514
	mov	r1, #388
	movw	ip, #385
	strh	r2, [sp, #12]	@ movhi
	mvn	r2, #0
	movw	r0, #1028
	strh	r3, [sp, #14]	@ movhi
	add	r4, sp, #12
	movw	r3, #387
	strh	r1, [sp, #16]	@ movhi
	add	r7, sp, #32
	mov	r1, #4
	strh	r2, [sp, #18]	@ movhi
	mov	r2, #8
	strh	ip, [sp, #20]	@ movhi
	strh	r0, [sp, #22]	@ movhi
	strh	r3, [sp, #24]	@ movhi
	strh	r1, [sp, #26]	@ movhi
	strh	r3, [sp, #28]	@ movhi
	strh	r2, [sp, #30]	@ movhi
.L98:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, r5
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldrh	r1, [r4], #4
	bl	snd_soc_update_bits
	cmp	r7, r4
	bne	.L98
	mov	r1, #50
	mov	r0, r1
	bl	usleep_range
	ldr	r3, [r6, #16]
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r6, #16]
	beq	.L115
.L99:
	mov	r1, r6
	mov	r0, r5
	mov	r2, #0
	add	sp, sp, #84
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	lr, [sp, #24]
	add	sp, sp, #28
	b	wcd9xxx_set_fclk_get_ncp
.L89:
	ldr	r2, [r1, #20]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r1, #20]
	bne	.L100
	ldr	r2, [r1, #24]
	cmp	r2, #0
	beq	.L116
	mov	r3, #5
	mov	r2, #15
	mov	r1, #404
	bl	snd_soc_update_bits
.L100:
	ldrb	r3, [r6, #32]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L103
	ldr	r3, [r6, #16]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6, #16]
	beq	.L117
.L103:
	mov	r7, #0
	movw	r4, #:lower16:.LANCHOR1
	ldr	r0, [r6, #28]
	mov	r3, #2
	movt	r4, #:upper16:.LANCHOR1
	mov	r2, #800
	mov	r1, #1
	str	r7, [sp]
	bl	wcd9xxx_resmgr_rm_cond_update_bits
	ldr	r3, [r4]
	sub	r3, r3, #1
	cmp	r3, r7
	str	r3, [r4]
	blt	.L118
	cmp	r3, #0
	beq	.L119
.L106:
	ldr	r3, [r6, #12]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6, #12]
	beq	.L120
.L88:
	add	sp, sp, #84
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	add	sp, sp, #24
	ldr	pc, [sp], #4
.L114:
	ldr	r3, [r6, #20]
	add	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6, #20]
	bgt	.L121
.L95:
	mov	r3, #48
	mov	r1, #404
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #1
	mov	r0, r5
	mov	r2, r3
	movw	r1, #402
	bl	snd_soc_update_bits
	cmp	r0, #0
	beq	.L88
	mov	r1, #50
	mov	r0, r1
	add	sp, sp, #84
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	lr, [sp, #24]
	add	sp, sp, #28
	b	usleep_range
.L119:
	mov	r2, #1
	mov	r1, #780
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L106
.L120:
	mov	r0, r5
	mov	r2, #1
	mov	r1, #800
	add	sp, sp, #84
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	lr, [sp, #24]
	add	sp, sp, #28
	b	snd_soc_update_bits
.L118:
	mov	r1, #780
	mov	r0, r5
	bl	snd_soc_read
	movw	r0, #:lower16:.LC5
	mov	r1, #532
	str	r7, [r4]
	movt	r0, #:upper16:.LC5
	bl	warn_slowpath_null
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L106
	b	.L119
.L121:
	mov	r3, #8
	mov	r2, #15
	mov	r1, #404
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L95
.L112:
	mov	r2, r3
	mov	r1, #800
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L92
.L113:
	mov	r2, r3
	mov	r1, #780
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L93
.L117:
	mov	r2, #128
	movw	r1, #385
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L103
.L116:
	mov	r2, #1
	movw	r1, #402
	bl	snd_soc_update_bits
	b	.L100
.L115:
	mov	r3, #128
	movw	r1, #385
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L99
.L123:
	.align	2
.L122:
	.word	.LANCHOR2+40
	.fnend
	.size	wcd9xxx_clsh_state_hph_r, .-wcd9xxx_clsh_state_hph_r
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_clsh_state_lo, %function
wcd9xxx_clsh_state_lo:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	strd	r4, [sp, #-20]!
	.save {r4, r5, r6, r7, lr}
	mov	r5, r1
	strd	r6, [sp, #8]
	mov	r6, r0
	str	lr, [sp, #16]
	.pad #28
	sub	sp, sp, #28
	beq	.L125
	movw	r1, #389
	movw	r3, #514
	mov	r2, #388
	mvn	lr, #6400
	strh	r1, [sp, #4]	@ movhi
	mov	r1, #4
	movw	ip, #385
	movw	r0, #1028
	strh	r3, [sp, #6]	@ movhi
	add	r7, sp, #24
	movw	r3, #387
	strh	r2, [sp, #8]	@ movhi
	add	r4, sp, r1
	mov	r2, #8
	strh	lr, [sp, #10]	@ movhi
	strh	ip, [sp, #12]	@ movhi
	strh	r0, [sp, #14]	@ movhi
	strh	r3, [sp, #16]	@ movhi
	strh	r1, [sp, #18]	@ movhi
	strh	r3, [sp, #20]	@ movhi
	strh	r2, [sp, #22]	@ movhi
.L126:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, r6
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldrh	r1, [r4], #4
	bl	snd_soc_update_bits
	cmp	r7, r4
	bne	.L126
	mov	r1, #50
	mov	r0, r1
	bl	usleep_range
	ldr	r3, [r5, #16]
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r5, #16]
	beq	.L139
.L127:
	mov	r2, #1
	mov	r1, r5
	mov	r0, r6
	bl	wcd9xxx_set_fclk_get_ncp
	ldr	r2, [r5, #4]
	movw	r3, #30528
	movt	r3, 27
	cmp	r2, r3
	bne	.L128
	ldr	r3, [r5, #16]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r5, #16]
	beq	.L140
.L129:
	mov	r3, #16
	mov	r1, #404
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r1, #60
	mov	r0, #50
	bl	usleep_range
	b	.L130
.L125:
	ldr	r1, [r1, #20]
	ldr	r2, [r5, #24]
	cmp	r1, #0
	sub	r2, r2, #1
	str	r2, [r5, #24]
	bne	.L131
	cmp	r2, #0
	beq	.L141
	mov	r3, #5
	mov	r2, #15
	mov	r1, #404
	bl	snd_soc_update_bits
.L131:
	ldr	r2, [r5, #4]
	movw	r3, #30528
	movt	r3, 27
	cmp	r2, r3
	beq	.L124
	ldr	r3, [r5, #16]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r5, #16]
	beq	.L142
.L124:
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
.L128:
	mov	r1, #60
	mov	r0, #50
	bl	usleep_range
	mov	r3, #1
	movw	r1, #389
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r3, #8
	mov	r2, #252
	movw	r1, #389
	mov	r0, r6
	bl	snd_soc_update_bits
.L130:
	mov	r0, r6
	mov	r3, #0
	mov	r2, #4
.L138:
	movw	r1, #385
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	lr, [sp, #16]
	add	sp, sp, #20
	b	snd_soc_update_bits
.L139:
	mov	r3, #128
	movw	r1, #385
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	b	.L127
.L140:
	mov	r2, #128
	movw	r1, #385
	mov	r0, r6
	bl	snd_soc_update_bits
	b	.L129
.L141:
	mov	r2, #1
	movw	r1, #402
	bl	snd_soc_update_bits
	b	.L131
.L142:
	mov	r0, r6
	mov	r2, #128
	b	.L138
	.fnend
	.size	wcd9xxx_clsh_state_lo, .-wcd9xxx_clsh_state_lo
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_clsh_state_ear, %function
wcd9xxx_clsh_state_ear:
	.fnstart
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	strd	r4, [sp, #-28]!
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	strd	r6, [sp, #8]
	mov	r6, r1
	strd	r8, [sp, #16]
	str	lr, [sp, #24]
	.pad #76
	sub	sp, sp, #76
	beq	.L144
	movw	ip, #:lower16:.LANCHOR2
	add	r4, sp, #4
	movt	ip, #:upper16:.LANCHOR2
	add	r7, sp, #44
	ldrd	r0, [ip]
	ldrd	r2, [ip, #8]
	ldrd	r8, [ip, #16]
	strd	r0, [sp, #4]
	ldrd	r0, [ip, #32]
	strd	r2, [sp, #12]
	ldrd	r2, [ip, #24]
	strd	r8, [sp, #20]
	strd	r2, [sp, #28]
	strd	r0, [sp, #36]
.L145:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, r5
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldrh	r1, [r4], #4
	bl	snd_soc_update_bits
	cmp	r7, r4
	bne	.L145
	add	r0, sp, #4
	mov	r2, #68
	ldr	r1, .L169
	mov	r4, r0
	add	r7, sp, #72
	bl	memcpy
.L146:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, r5
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldrh	r1, [r4], #4
	bl	snd_soc_update_bits
	cmp	r7, r4
	bne	.L146
	ldr	r3, [r6, #12]
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r6, #12]
	beq	.L161
.L147:
	movw	r2, #:lower16:.LANCHOR1
	movt	r2, #:upper16:.LANCHOR1
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r2]
	beq	.L162
.L148:
	mov	r3, #2
	mov	r1, #800
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #16
	mov	r1, #800
	mov	r2, r3
	mov	r0, r5
	add	r4, sp, #4
	add	r7, sp, #24
	bl	snd_soc_update_bits
	movw	r1, #389
	movw	r3, #514
	mov	r2, #388
	mvn	lr, #0
	movw	ip, #385
	movw	r0, #1028
	strh	r1, [sp, #4]	@ movhi
	strh	r3, [sp, #6]	@ movhi
	mov	r1, #4
	movw	r3, #387
	strh	r2, [sp, #8]	@ movhi
	mov	r2, #8
	strh	lr, [sp, #10]	@ movhi
	strh	ip, [sp, #12]	@ movhi
	strh	r0, [sp, #14]	@ movhi
	strh	r3, [sp, #16]	@ movhi
	strh	r1, [sp, #18]	@ movhi
	strh	r3, [sp, #20]	@ movhi
	strh	r2, [sp, #22]	@ movhi
.L149:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, r5
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldrh	r1, [r4], #4
	bl	snd_soc_update_bits
	cmp	r7, r4
	bne	.L149
	mov	r1, #50
	mov	r0, r1
	bl	usleep_range
	ldr	r3, [r6, #16]
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r6, #16]
	beq	.L163
.L150:
	mov	r1, r6
	mov	r0, r5
	mov	r2, #0
	add	sp, sp, #76
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	lr, [sp, #24]
	add	sp, sp, #28
	b	wcd9xxx_set_fclk_get_ncp
.L144:
	ldr	r2, [r1, #20]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r1, #20]
	bne	.L151
	ldr	r2, [r1, #24]
	cmp	r2, #0
	beq	.L164
	mov	r3, #5
	mov	r2, #15
	mov	r1, #404
	bl	snd_soc_update_bits
.L151:
	ldr	r3, [r6, #16]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6, #16]
	beq	.L165
.L153:
	mov	r3, #16
	movw	r4, #:lower16:.LANCHOR1
	mov	r2, r3
	movt	r4, #:upper16:.LANCHOR1
	mov	r1, #800
	mov	r0, r5
	bl	snd_soc_update_bits
	ldr	r3, [r4]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4]
	blt	.L166
	cmp	r3, #0
	beq	.L167
.L155:
	ldr	r3, [r6, #12]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6, #12]
	beq	.L168
	add	sp, sp, #76
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	add	sp, sp, #24
	ldr	pc, [sp], #4
.L168:
	mov	r0, r5
	mov	r2, #1
	mov	r1, #800
	add	sp, sp, #76
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	lr, [sp, #24]
	add	sp, sp, #28
	b	snd_soc_update_bits
.L167:
	mov	r2, #1
	mov	r1, #780
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L155
.L165:
	mov	r2, #128
	movw	r1, #385
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L153
.L163:
	mov	r3, #128
	movw	r1, #385
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L150
.L166:
	mov	r1, #780
	mov	r0, r5
	bl	snd_soc_read
	mov	r3, #0
	movw	r0, #:lower16:.LC5
	movt	r0, #:upper16:.LC5
	mov	r1, #532
	str	r3, [r4]
	bl	warn_slowpath_null
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L155
	b	.L167
.L161:
	mov	r2, r3
	mov	r1, #800
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L147
.L162:
	mov	r2, r3
	mov	r1, #780
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L148
.L164:
	mov	r2, #1
	movw	r1, #402
	bl	snd_soc_update_bits
	b	.L151
.L170:
	.align	2
.L169:
	.word	.LANCHOR2+108
	.fnend
	.size	wcd9xxx_clsh_state_ear, .-wcd9xxx_clsh_state_ear
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_clsh_state_hph_ear, %function
wcd9xxx_clsh_state_hph_ear:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #1
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	sub	r4, r2, #1
	strd	r6, [sp, #8]
	movne	r7, #0
	moveq	r7, #1
	cmp	r3, #0
	str	r8, [sp, #16]
	uxtb	r4, r4
	str	lr, [sp, #20]
	mov	r8, r1
	.pad #24
	sub	sp, sp, #24
	mov	r6, r0
	beq	.L172
	ldrb	r5, [r1]	@ zero_extendqisi2
	cmp	r5, #1
	orreq	r7, r7, #1
	cmp	r7, #0
	bne	.L195
	cmp	r4, #3
	bls	.L196
.L171:
	add	sp, sp, #24
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L172:
	cmp	r4, #3
	mov	r5, r2
	bls	.L197
.L180:
	ldrb	r3, [r8]	@ zero_extendqisi2
	bic	r5, r3, r5
	cmp	r5, #1
	orreq	r7, r7, #1
	cmp	r7, #0
	beq	.L171
	mov	r3, #0
	mov	r2, #16
	mov	r1, #404
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r1, #60
	mov	r0, #50
	bl	usleep_range
	movw	r2, #387
	movw	r3, #389
	movw	r0, #2056
	mov	r1, #2
	strh	r2, [sp, #12]	@ movhi
	add	r4, sp, #12
	mov	r2, #1
	add	r5, sp, #24
	strh	r0, [sp, #14]	@ movhi
	strh	r3, [sp, #16]	@ movhi
	strh	r1, [sp, #18]	@ movhi
	strh	r3, [sp, #20]	@ movhi
	strh	r2, [sp, #22]	@ movhi
.L183:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, r6
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldrh	r1, [r4], #4
	bl	snd_soc_update_bits
	cmp	r5, r4
	bne	.L183
	mov	r1, #60
	mov	r0, #50
	add	sp, sp, #24
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	usleep_range
.L197:
	movw	r2, #:lower16:CSWTCH.140
	movt	r2, #:upper16:CSWTCH.140
	ldr	r2, [r2, r4, lsl #2]
	cmp	r2, #1
	beq	.L198
	cmp	r2, #2
	beq	.L185
	cmp	r2, #3
	moveq	r3, #2
	bne	.L180
.L182:
	mov	ip, #0
	ldr	r0, [r8, #28]
	mov	r2, #800
	mov	r1, #1
	str	ip, [sp]
	bl	wcd9xxx_resmgr_rm_cond_update_bits
	b	.L180
.L196:
	movw	r3, #:lower16:.LANCHOR2
	movt	r3, #:upper16:.LANCHOR2
	add	r4, r3, r4, lsl #2
	ldr	r3, [r4, #176]
	cmp	r3, #1
	bne	.L177
	mov	r3, #16
	mov	r0, r6
	mov	r2, r3
	mov	r1, #800
	add	sp, sp, #24
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	snd_soc_update_bits
.L195:
	mov	r3, #8
	movw	r2, #387
	movw	r1, #514
	movw	ip, #389
	movw	lr, #257
	strh	r2, [sp, #12]	@ movhi
	mov	r2, r3
	strh	r3, [sp, #14]	@ movhi
	mov	r3, #0
	add	r5, sp, #12
	strh	ip, [sp, #16]	@ movhi
	strh	r1, [sp, #18]	@ movhi
	movw	r1, #385
	strh	ip, [sp, #20]	@ movhi
	strh	lr, [sp, #22]	@ movhi
	bl	snd_soc_update_bits
	mov	r3, #255
	mov	r1, #388
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	add	r7, sp, #24
.L174:
	ldrb	r3, [r5, #3]	@ zero_extendqisi2
	mov	r0, r6
	ldrb	r2, [r5, #2]	@ zero_extendqisi2
	ldrh	r1, [r5], #4
	bl	snd_soc_update_bits
	cmp	r5, r7
	bne	.L174
	mov	r1, #60
	mov	r0, #50
	bl	usleep_range
	mov	r3, #16
	mov	r1, #404
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r1, #60
	mov	r0, #50
	bl	usleep_range
	cmp	r4, #3
	bhi	.L171
	b	.L196
.L198:
	mov	r2, #16
	mov	r1, #800
	bl	snd_soc_update_bits
	b	.L180
.L177:
	cmp	r3, #2
	moveq	r3, #3
	bne	.L199
.L178:
	mov	ip, #0
	ldr	r0, [r8, #28]
	mov	r2, #800
	mov	r1, #1
	str	ip, [sp]
	bl	wcd9xxx_resmgr_add_cond_update_bits
	b	.L171
.L185:
	mov	r3, #3
	b	.L182
.L199:
	cmp	r3, #3
	moveq	r3, #2
	bne	.L171
	b	.L178
	.fnend
	.size	wcd9xxx_clsh_state_hph_ear, .-wcd9xxx_clsh_state_hph_ear
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_clsh_state_ear_lo, %function
wcd9xxx_clsh_state_ear_lo:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	strd	r6, [sp, #8]
	mov	r6, r1
	mov	r7, r2
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	.pad #16
	sub	sp, sp, #16
	beq	.L201
	mov	r3, #8
	movw	r2, #387
	movw	r1, #514
	movw	ip, #389
	movw	lr, #257
	strh	r2, [sp, #4]	@ movhi
	mov	r2, r3
	strh	r3, [sp, #6]	@ movhi
	mov	r3, #0
	add	r4, sp, #4
	strh	ip, [sp, #8]	@ movhi
	strh	r1, [sp, #10]	@ movhi
	movw	r1, #385
	strh	ip, [sp, #12]	@ movhi
	strh	lr, [sp, #14]	@ movhi
	bl	snd_soc_update_bits
	mov	r3, #255
	mov	r1, #388
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	add	r8, sp, #16
.L202:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, r5
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldrh	r1, [r4], #4
	bl	snd_soc_update_bits
	cmp	r8, r4
	bne	.L202
	mov	r1, #60
	mov	r0, #50
	bl	usleep_range
	ldr	r3, [r6, #16]
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r6, #16]
	beq	.L223
	tst	r7, #1
	bne	.L224
.L200:
	add	sp, sp, #16
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L201:
	ldr	r2, [r1, #20]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r1, #20]
	bne	.L208
	ldr	r2, [r1, #24]
	cmp	r2, #0
	beq	.L225
	mov	r3, #5
	mov	r2, #15
	mov	r1, #404
	bl	snd_soc_update_bits
.L208:
	mov	r3, #0
	mov	r2, #16
	mov	r1, #404
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r1, #60
	mov	r0, #50
	bl	usleep_range
	ands	r3, r7, #8
	bne	.L226
	tst	r7, #1
	beq	.L200
	mov	r2, #16
	mov	r1, #800
	mov	r0, r5
	bl	snd_soc_update_bits
	ldr	r2, [r6, #4]
	movw	r3, #30528
	movt	r3, 27
	cmp	r2, r3
	bne	.L213
	ldr	r3, [r6, #16]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6, #16]
	beq	.L227
.L214:
	mov	r3, #16
	mov	r1, #404
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r1, #60
	mov	r0, #50
	bl	usleep_range
.L215:
	mov	r3, #0
	mov	r2, #4
	movw	r1, #385
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r0, r5
	mov	r3, #230
	mov	r2, #255
	mov	r1, #388
	b	.L222
.L224:
	mov	r2, #0
	mov	r1, r6
	mov	r0, r5
	bl	wcd9xxx_set_fclk_get_ncp
	mov	r3, #16
	mov	r1, #404
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r1, #60
	mov	r0, #50
	bl	usleep_range
	ldr	r3, [r6, #12]
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r6, #12]
	beq	.L228
.L206:
	movw	r2, #:lower16:.LANCHOR1
	movt	r2, #:upper16:.LANCHOR1
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r2]
	beq	.L229
.L207:
	mov	r3, #2
	mov	r1, #800
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #16
	mov	r0, r5
	mov	r2, r3
	mov	r1, #800
.L222:
	add	sp, sp, #16
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	snd_soc_update_bits
.L226:
	mov	r3, #0
	mov	r2, #32
	mov	r1, #404
	mov	r0, r5
	bl	snd_soc_update_bits
	movw	r2, #387
	movw	r3, #389
	movw	r0, #2056
	mov	r1, #2
	strh	r2, [sp, #4]	@ movhi
	add	r4, sp, #4
	mov	r2, #1
	add	r6, sp, #16
	strh	r0, [sp, #6]	@ movhi
	strh	r3, [sp, #8]	@ movhi
	strh	r1, [sp, #10]	@ movhi
	strh	r3, [sp, #12]	@ movhi
	strh	r2, [sp, #14]	@ movhi
.L211:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, r5
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldrh	r1, [r4], #4
	bl	snd_soc_update_bits
	cmp	r4, r6
	bne	.L211
	mov	r1, #60
	mov	r0, #50
	add	sp, sp, #16
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	usleep_range
.L223:
	mov	r3, #128
	movw	r1, #385
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	tst	r7, #1
	beq	.L200
	b	.L224
.L225:
	mov	r2, #1
	movw	r1, #402
	bl	snd_soc_update_bits
	b	.L208
.L213:
	mov	r1, #60
	mov	r0, #50
	bl	usleep_range
	mov	r3, #1
	movw	r1, #389
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #8
	mov	r2, #252
	movw	r1, #389
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L215
.L227:
	mov	r2, #128
	movw	r1, #385
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L214
.L228:
	mov	r2, r3
	mov	r1, #800
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L206
.L229:
	mov	r2, r3
	mov	r1, #780
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L207
	.fnend
	.size	wcd9xxx_clsh_state_ear_lo, .-wcd9xxx_clsh_state_ear_lo
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_clsh_state_hph_l, %function
wcd9xxx_clsh_state_hph_l:
	.fnstart
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	strd	r4, [sp, #-28]!
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	strd	r6, [sp, #8]
	mov	r6, r1
	strd	r8, [sp, #16]
	str	lr, [sp, #24]
	.pad #84
	sub	sp, sp, #84
	beq	.L231
	movw	ip, #:lower16:.LANCHOR2
	add	r4, sp, #12
	movt	ip, #:upper16:.LANCHOR2
	add	r7, sp, #52
	ldrd	r0, [ip]
	ldrd	r2, [ip, #8]
	ldrd	r8, [ip, #16]
	strd	r0, [sp, #12]
	ldrd	r0, [ip, #32]
	strd	r2, [sp, #20]
	ldrd	r2, [ip, #24]
	strd	r8, [sp, #28]
	strd	r2, [sp, #36]
	strd	r0, [sp, #44]
.L232:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, r5
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldrh	r1, [r4], #4
	bl	snd_soc_update_bits
	cmp	r7, r4
	bne	.L232
	add	r0, sp, #12
	mov	r2, #68
	ldr	r1, .L264
	mov	r4, r0
	add	r7, sp, #80
	bl	memcpy
.L233:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, r5
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldrh	r1, [r4], #4
	bl	snd_soc_update_bits
	cmp	r7, r4
	bne	.L233
	ldr	r3, [r6, #12]
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r6, #12]
	beq	.L254
.L234:
	movw	r2, #:lower16:.LANCHOR1
	movt	r2, #:upper16:.LANCHOR1
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r2]
	beq	.L255
.L235:
	mov	r3, #2
	mov	r1, #800
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	ip, #0
	mov	r3, #3
	ldr	r0, [r6, #28]
	mov	r2, #800
	mov	r1, #1
	str	ip, [sp]
	bl	wcd9xxx_resmgr_add_cond_update_bits
	ldrb	r3, [r6, #32]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L256
	movw	r2, #389
	movw	r3, #514
	mov	r1, #388
	movw	ip, #385
	strh	r2, [sp, #12]	@ movhi
	mvn	r2, #0
	movw	r0, #1028
	strh	r3, [sp, #14]	@ movhi
	add	r4, sp, #12
	movw	r3, #387
	strh	r1, [sp, #16]	@ movhi
	add	r7, sp, #32
	mov	r1, #4
	strh	r2, [sp, #18]	@ movhi
	mov	r2, #8
	strh	ip, [sp, #20]	@ movhi
	strh	r0, [sp, #22]	@ movhi
	strh	r3, [sp, #24]	@ movhi
	strh	r1, [sp, #26]	@ movhi
	strh	r3, [sp, #28]	@ movhi
	strh	r2, [sp, #30]	@ movhi
.L240:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, r5
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldrh	r1, [r4], #4
	bl	snd_soc_update_bits
	cmp	r7, r4
	bne	.L240
	mov	r1, #50
	mov	r0, r1
	bl	usleep_range
	ldr	r3, [r6, #16]
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r6, #16]
	beq	.L257
.L241:
	mov	r1, r6
	mov	r0, r5
	mov	r2, #0
	add	sp, sp, #84
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	lr, [sp, #24]
	add	sp, sp, #28
	b	wcd9xxx_set_fclk_get_ncp
.L231:
	ldr	r2, [r1, #20]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r1, #20]
	bne	.L242
	ldr	r2, [r1, #24]
	cmp	r2, #0
	beq	.L258
	mov	r3, #5
	mov	r2, #15
	mov	r1, #404
	bl	snd_soc_update_bits
.L242:
	ldrb	r3, [r6, #32]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L245
	ldr	r3, [r6, #16]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6, #16]
	beq	.L259
.L245:
	mov	r7, #0
	movw	r4, #:lower16:.LANCHOR1
	ldr	r0, [r6, #28]
	mov	r3, #3
	movt	r4, #:upper16:.LANCHOR1
	mov	r2, #800
	mov	r1, #1
	str	r7, [sp]
	bl	wcd9xxx_resmgr_rm_cond_update_bits
	ldr	r3, [r4]
	sub	r3, r3, #1
	cmp	r3, r7
	str	r3, [r4]
	blt	.L260
	cmp	r3, #0
	beq	.L261
.L248:
	ldr	r3, [r6, #12]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6, #12]
	beq	.L262
.L230:
	add	sp, sp, #84
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	add	sp, sp, #24
	ldr	pc, [sp], #4
.L256:
	ldr	r3, [r6, #20]
	add	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6, #20]
	bgt	.L263
.L237:
	mov	r3, #48
	mov	r1, #404
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #1
	mov	r0, r5
	mov	r2, r3
	movw	r1, #402
	bl	snd_soc_update_bits
	cmp	r0, #0
	beq	.L230
	mov	r1, #50
	mov	r0, r1
	add	sp, sp, #84
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	lr, [sp, #24]
	add	sp, sp, #28
	b	usleep_range
.L261:
	mov	r2, #1
	mov	r1, #780
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L248
.L262:
	mov	r0, r5
	mov	r2, #1
	mov	r1, #800
	add	sp, sp, #84
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	lr, [sp, #24]
	add	sp, sp, #28
	b	snd_soc_update_bits
.L260:
	mov	r1, #780
	mov	r0, r5
	bl	snd_soc_read
	movw	r0, #:lower16:.LC5
	mov	r1, #532
	str	r7, [r4]
	movt	r0, #:upper16:.LC5
	bl	warn_slowpath_null
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L248
	b	.L261
.L263:
	mov	r3, #8
	mov	r2, #15
	mov	r1, #404
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L237
.L254:
	mov	r2, r3
	mov	r1, #800
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L234
.L255:
	mov	r2, r3
	mov	r1, #780
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L235
.L259:
	mov	r2, #128
	movw	r1, #385
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L245
.L258:
	mov	r2, #1
	movw	r1, #402
	bl	snd_soc_update_bits
	b	.L242
.L257:
	mov	r3, #128
	movw	r1, #385
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L241
.L265:
	.align	2
.L264:
	.word	.LANCHOR2+40
	.fnend
	.size	wcd9xxx_clsh_state_hph_l, .-wcd9xxx_clsh_state_hph_l
	.align	2
	.global	wcd9xxx_clsh_imped_config
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_clsh_imped_config, %function
wcd9xxx_clsh_imped_config:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #4000
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	bcc	.L272
	movw	r3, #32163
	cmp	r1, r3
	bhi	.L273
	movw	r6, #:lower16:.LANCHOR2
	mov	r3, #0
	movt	r6, #:upper16:.LANCHOR2
	add	r4, r6, #192
	b	.L270
.L268:
	cmp	ip, #22
	beq	.L267
.L270:
	ldr	lr, [r4, r3, lsl #3]
	lsl	r2, r3, #3
	add	ip, r3, #1
	mov	r3, ip
	add	r5, r2, #8
	cmp	r1, lr
	bcc	.L268
	ldr	lr, [r4, r5]
	cmp	r1, lr
	bcs	.L268
	add	r2, r6, r2
	ldrb	ip, [r2, #196]	@ zero_extendqisi2
	cmp	ip, #22
	bls	.L267
	movw	r0, #:lower16:.LC6
	mov	r2, r1
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	movt	r0, #:upper16:.LC6
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	ldr	r1, .L277
	b	printk
.L272:
	mov	ip, #0
.L267:
	mov	r5, #52
	ldr	r4, .L277+4
	mov	r6, r0
	mul	ip, r5, ip
	add	r5, r4, r5
	add	r5, r5, ip
	add	r4, r4, ip
.L271:
	ldrb	r2, [r4, #3]	@ zero_extendqisi2
	mov	r0, r6
	ldrh	r1, [r4], #4
	bl	snd_soc_write
	cmp	r5, r4
	bne	.L271
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L273:
	mov	ip, #22
	b	.L267
.L278:
	.align	2
.L277:
	.word	.LANCHOR2+376
	.word	.LANCHOR2+404
	.fnend
	.size	wcd9xxx_clsh_imped_config, .-wcd9xxx_clsh_imped_config
	.align	2
	.global	wcd9xxx_soc_update_bits_push
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_soc_update_bits_push, %function
wcd9xxx_soc_update_bits_push:
	.fnstart
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:kmalloc_caches
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r2
	movt	ip, #:upper16:kmalloc_caches
	strd	r6, [sp, #8]
	mov	r7, r0
	ldr	r0, [ip, #24]
	strd	r8, [sp, #16]
	mov	r6, r1
	str	r10, [sp, #24]
	ldrb	r9, [sp, #32]	@ zero_extendqisi2
	mov	r10, r3
	str	lr, [sp, #28]
	ldr	r8, [sp, #36]
	cmp	r0, #0
	beq	.L284
	mov	r2, #12
	mov	r1, #208
	bl	kmem_cache_alloc_trace
	subs	r4, r0, #0
	bne	.L280
	movw	r0, #:lower16:.LC7
	ldr	r1, .L290
	mvn	r4, #11
	movt	r0, #:upper16:.LC7
	bl	printk
	b	.L279
.L284:
	mov	r4, #16
.L280:
	mov	r1, r5
	mov	r0, r7
	strh	r5, [r4, #8]	@ movhi
	bl	snd_soc_read
	strh	r0, [r4, #10]	@ movhi
	ldr	r3, [r6]
	cmp	r10, #255
	str	r4, [r3, #4]
	stm	r4, {r3, r6}
	str	r4, [r6]
	beq	.L289
	mov	r3, r9
	mov	r2, r10
	mov	r1, r5
	mov	r0, r7
	bl	snd_soc_update_bits
	mov	r4, r0
.L283:
	cmp	r8, #0
	beq	.L279
	add	r1, r8, #100
	mov	r0, r8
	bl	usleep_range
.L279:
	mov	r0, r4
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L289:
	mov	r2, r9
	mov	r1, r5
	mov	r0, r7
	bl	snd_soc_write
	mov	r4, r0
	b	.L283
.L291:
	.align	2
.L290:
	.word	.LANCHOR2+1600
	.fnend
	.size	wcd9xxx_soc_update_bits_push, .-wcd9xxx_soc_update_bits_push
	.align	2
	.global	wcd9xxx_restore_registers
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_restore_registers, %function
wcd9xxx_restore_registers:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r4, [r1]
	cmp	r1, r4
	ldr	r5, [r4]
	beq	.L292
	mov	r7, r0
	mov	r6, r1
	mov	r9, #256
	mov	r8, #512
.L294:
	ldrh	r2, [r4, #10]
	mov	r0, r7
	ldrh	r1, [r4, #8]
	bl	snd_soc_write
	ldrd	r2, [r4]
	mov	r0, r4
	str	r3, [r2, #4]
	str	r2, [r3]
	str	r9, [r4]
	str	r8, [r4, #4]
	mov	r4, r5
	bl	kfree
	cmp	r5, r6
	ldr	r5, [r5]
	bne	.L294
.L292:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
	.fnend
	.size	wcd9xxx_restore_registers, .-wcd9xxx_restore_registers
	.align	2
	.global	wcd9xxx_clsh_fsm
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_clsh_fsm, %function
wcd9xxx_clsh_fsm:
	.fnstart
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-20]!
	.save {r4, r5, r6, r7, lr}
	mov	r5, r1
	strd	r6, [sp, #8]
	str	lr, [sp, #16]
	.pad #20
	sub	sp, sp, #20
	ldrb	lr, [sp, #40]	@ zero_extendqisi2
	cmp	lr, #1
	beq	.L299
	cmp	lr, #2
	bne	.L297
	cmp	r3, #0
	ldrb	lr, [r1]	@ zero_extendqisi2
	bne	.L303
	bic	r4, lr, r2
	cmp	r4, #15
	bhi	.L297
	cmp	lr, #15
	bhi	.L297
	cmp	lr, r4
	beq	.L297
	movw	ip, #:lower16:.LANCHOR1
	movt	ip, #:upper16:.LANCHOR1
	add	lr, ip, lr, lsl #2
	ldr	r6, [lr, #4]
	blx	r6
	strb	r4, [r5]
.L297:
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
.L299:
	cmp	r3, #0
	beq	.L309
	ldrb	r3, [r1]	@ zero_extendqisi2
	orr	r4, r2, r3
	cmp	r4, #15
	bhi	.L297
	cmp	r3, r4
	beq	.L297
	movw	ip, #:lower16:.LANCHOR1
	mov	r3, lr
	movt	ip, #:upper16:.LANCHOR1
	add	ip, ip, r4, lsl #2
	ldr	r6, [ip, #4]
	blx	r6
	strb	r4, [r5]
	b	.L297
.L303:
	tst	lr, #8
	bne	.L297
	ldrb	r3, [r1, #32]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L297
	movw	r3, #:lower16:.LANCHOR2
	mov	r6, r0
	movt	r3, #:upper16:.LANCHOR2
	add	r4, sp, #4
	add	r2, r3, #1632
	ldr	r1, [r3, #1640]
	add	r7, sp, #16
	ldrd	r2, [r2]
	strd	r2, [sp, #4]
	str	r1, [sp, #12]
.L305:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, r6
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldrh	r1, [r4], #4
	bl	snd_soc_update_bits
	cmp	r7, r4
	bne	.L305
	ldrb	r3, [r5, #8]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L297
	mov	r3, #8
	mov	r0, r6
	mov	r2, r3
	movw	r1, #387
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	lr, [sp, #16]
	add	sp, sp, #20
	b	snd_soc_update_bits
.L309:
	.syntax divided
@ 1328 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9xxx-common.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9xxx-common.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 1328, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
	.fnend
	.size	wcd9xxx_clsh_fsm, .-wcd9xxx_clsh_fsm
	.align	2
	.global	wcd9xxx_clsh_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_clsh_init, %function
wcd9xxx_clsh_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	movw	r3, #:lower16:.LANCHOR1
	movw	ip, #:lower16:wcd9xxx_clsh_state_ear
	str	lr, [sp, #8]
	movw	r2, #:lower16:wcd9xxx_clsh_state_hph_r
	movw	lr, #:lower16:wcd9xxx_clsh_state_err
	movt	r3, #:upper16:.LANCHOR1
	str	r1, [r0, #28]
	movt	ip, #:upper16:wcd9xxx_clsh_state_ear
	movt	r2, #:upper16:wcd9xxx_clsh_state_hph_r
	movt	lr, #:upper16:wcd9xxx_clsh_state_err
	mov	r1, #0
	movw	r5, #:lower16:wcd9xxx_clsh_state_hph_l
	str	lr, [r3, #4]
	movw	r4, #:lower16:wcd9xxx_clsh_state_hph_st
	movw	lr, #:lower16:wcd9xxx_clsh_state_lo
	strb	r1, [r0]
	movw	r0, #:lower16:wcd9xxx_clsh_state_hph_ear
	movw	r1, #:lower16:wcd9xxx_clsh_state_hph_lo
	str	ip, [r3, #8]
	movw	ip, #:lower16:wcd9xxx_clsh_state_ear_lo
	movt	r0, #:upper16:wcd9xxx_clsh_state_hph_ear
	movt	r1, #:upper16:wcd9xxx_clsh_state_hph_lo
	movt	r5, #:upper16:wcd9xxx_clsh_state_hph_l
	str	r2, [r3, #20]
	movw	r2, #:lower16:wcd9xxx_clsh_state_hph_ear_lo
	movt	r4, #:upper16:wcd9xxx_clsh_state_hph_st
	movt	r2, #:upper16:wcd9xxx_clsh_state_hph_ear_lo
	movt	ip, #:upper16:wcd9xxx_clsh_state_ear_lo
	str	r5, [r3, #12]
	movt	lr, #:upper16:wcd9xxx_clsh_state_lo
	str	r0, [r3, #16]
	str	r0, [r3, #24]
	str	r4, [r3, #28]
	str	r0, [r3, #32]
	str	lr, [r3, #36]
	str	ip, [r3, #40]
	str	r1, [r3, #44]
	str	r2, [r3, #48]
	str	r1, [r3, #52]
	str	r2, [r3, #56]
	str	r1, [r3, #60]
	str	r2, [r3, #64]
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
	.fnend
	.size	wcd9xxx_clsh_init, .-wcd9xxx_clsh_init
	.set	CSWTCH.140,CSWTCH.139
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
.LC1:
	.short	803
	.byte	3
	.byte	0
	.short	803
	.byte	12
	.byte	4
	.short	803
	.byte	16
	.byte	0
	.short	801
	.byte	3
	.byte	1
	.short	801
	.byte	12
	.byte	4
	.short	801
	.byte	-16
	.byte	48
	.short	802
	.byte	-16
	.byte	48
	.short	802
	.byte	15
	.byte	11
	.short	800
	.byte	32
	.byte	32
	.short	800
	.byte	2
	.byte	2
.LC2:
	.short	800
	.byte	64
	.byte	0
	.short	815
	.byte	63
	.byte	13
	.short	817
	.byte	63
	.byte	29
	.short	804
	.byte	63
	.byte	19
	.short	806
	.byte	31
	.byte	25
	.short	810
	.byte	-1
	.byte	-105
	.short	811
	.byte	-1
	.byte	5
	.short	808
	.byte	-128
	.byte	0
	.short	808
	.byte	15
	.byte	0
	.short	809
	.byte	-1
	.byte	-82
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	28
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	36
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	37
	.short	809
	.byte	-1
	.byte	0
.LC3:
	.short	800
	.byte	-128
	.byte	0
	.short	814
	.byte	63
	.byte	13
	.short	816
	.byte	63
	.byte	58
	.short	805
	.byte	63
	.byte	38
	.short	807
	.byte	63
	.byte	44
	.short	812
	.byte	-1
	.byte	-87
	.short	813
	.byte	-1
	.byte	7
	.short	808
	.byte	-128
	.byte	0
	.short	808
	.byte	15
	.byte	8
	.short	809
	.byte	-1
	.byte	27
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	45
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	54
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	55
	.short	809
	.byte	-1
	.byte	0
	.type	CSWTCH.139, %object
	.size	CSWTCH.139, 16
CSWTCH.139:
	.word	1
	.word	2
	.word	0
	.word	3
	.type	imped_index, %object
	.size	imped_index, 184
imped_index:
	.word	4000
	.byte	0
	.space	3
	.word	4500
	.byte	1
	.space	3
	.word	5000
	.byte	2
	.space	3
	.word	5500
	.byte	3
	.space	3
	.word	6000
	.byte	4
	.space	3
	.word	6500
	.byte	5
	.space	3
	.word	7000
	.byte	6
	.space	3
	.word	7700
	.byte	7
	.space	3
	.word	8470
	.byte	8
	.space	3
	.word	9317
	.byte	9
	.space	3
	.word	10248
	.byte	10
	.space	3
	.word	11273
	.byte	11
	.space	3
	.word	12400
	.byte	12
	.space	3
	.word	13641
	.byte	13
	.space	3
	.word	15005
	.byte	14
	.space	3
	.word	16505
	.byte	15
	.space	3
	.word	18156
	.byte	16
	.space	3
	.word	19971
	.byte	17
	.space	3
	.word	21969
	.byte	18
	.space	3
	.word	24165
	.byte	19
	.space	3
	.word	26582
	.byte	20
	.space	3
	.word	29240
	.byte	21
	.space	3
	.word	32164
	.byte	22
	.space	3
	.type	__func__.26869, %object
	.size	__func__.26869, 26
__func__.26869:
	.ascii	"wcd9xxx_clsh_imped_config\000"
	.space	2
	.type	imped_table, %object
	.size	imped_table, 1196
imped_table:
	.short	810
	.byte	-1
	.byte	70
	.short	811
	.byte	-1
	.byte	4
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	17
	.short	809
	.byte	-1
	.byte	2
	.short	809
	.byte	-1
	.byte	-101
	.short	809
	.byte	-1
	.byte	2
	.short	809
	.byte	-1
	.byte	21
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	28
	.short	809
	.byte	-1
	.byte	1
	.short	804
	.byte	-1
	.byte	4
	.short	806
	.byte	-1
	.byte	12
	.short	810
	.byte	-1
	.byte	71
	.short	811
	.byte	-1
	.byte	5
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	17
	.short	809
	.byte	-1
	.byte	2
	.short	809
	.byte	-1
	.byte	-101
	.short	809
	.byte	-1
	.byte	2
	.short	809
	.byte	-1
	.byte	21
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	28
	.short	809
	.byte	-1
	.byte	1
	.short	804
	.byte	-1
	.byte	5
	.short	806
	.byte	-1
	.byte	12
	.short	810
	.byte	-1
	.byte	73
	.short	811
	.byte	-1
	.byte	7
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	2
	.short	809
	.byte	-1
	.byte	18
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	53
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	78
	.short	809
	.byte	-1
	.byte	1
	.short	804
	.byte	-1
	.byte	6
	.short	806
	.byte	-1
	.byte	14
	.short	810
	.byte	-1
	.byte	73
	.short	811
	.byte	-1
	.byte	22
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	-84
	.short	809
	.byte	-1
	.byte	2
	.short	809
	.byte	-1
	.byte	23
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	95
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	-49
	.short	809
	.byte	-1
	.byte	1
	.short	804
	.byte	-1
	.byte	6
	.short	806
	.byte	-1
	.byte	15
	.short	810
	.byte	-1
	.byte	89
	.short	811
	.byte	-1
	.byte	21
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	-100
	.short	809
	.byte	-1
	.byte	2
	.short	809
	.byte	-1
	.byte	27
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	-50
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	-67
	.short	809
	.byte	-1
	.byte	1
	.short	804
	.byte	-1
	.byte	7
	.short	806
	.byte	-1
	.byte	16
	.short	810
	.byte	-1
	.byte	102
	.short	811
	.byte	-1
	.byte	4
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	-102
	.short	809
	.byte	-1
	.byte	2
	.short	809
	.byte	-1
	.byte	46
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	-67
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	-90
	.short	809
	.byte	-1
	.byte	1
	.short	804
	.byte	-1
	.byte	7
	.short	806
	.byte	-1
	.byte	17
	.short	810
	.byte	-1
	.byte	121
	.short	811
	.byte	-1
	.byte	4
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	17
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	55
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	-90
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	-83
	.short	809
	.byte	-1
	.byte	1
	.short	804
	.byte	-1
	.byte	8
	.short	806
	.byte	-1
	.byte	18
	.short	810
	.byte	-1
	.byte	118
	.short	811
	.byte	-1
	.byte	4
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	17
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	78
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	-83
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	-84
	.short	809
	.byte	-1
	.byte	1
	.short	804
	.byte	-1
	.byte	9
	.short	806
	.byte	-1
	.byte	18
	.short	810
	.byte	-1
	.byte	120
	.short	811
	.byte	-1
	.byte	5
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	18
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	-48
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	-84
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	19
	.short	809
	.byte	-1
	.byte	0
	.short	804
	.byte	-1
	.byte	10
	.short	806
	.byte	-1
	.byte	19
	.short	810
	.byte	-1
	.byte	122
	.short	811
	.byte	-1
	.byte	6
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	20
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	-73
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	19
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	20
	.short	809
	.byte	-1
	.byte	0
	.short	804
	.byte	-1
	.byte	11
	.short	806
	.byte	-1
	.byte	20
	.short	810
	.byte	-1
	.byte	96
	.short	811
	.byte	-1
	.byte	9
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	28
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	-92
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	20
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	31
	.short	809
	.byte	-1
	.byte	0
	.short	804
	.byte	-1
	.byte	12
	.short	806
	.byte	-1
	.byte	20
	.short	810
	.byte	-1
	.byte	121
	.short	811
	.byte	-1
	.byte	23
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	37
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	-82
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	31
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	29
	.short	809
	.byte	-1
	.byte	0
	.short	804
	.byte	-1
	.byte	13
	.short	806
	.byte	-1
	.byte	21
	.short	810
	.byte	-1
	.byte	120
	.short	811
	.byte	-1
	.byte	22
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	44
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	-84
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	29
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	28
	.short	809
	.byte	-1
	.byte	0
	.short	804
	.byte	-1
	.byte	14
	.short	806
	.byte	-1
	.byte	22
	.short	810
	.byte	-1
	.byte	-119
	.short	811
	.byte	-1
	.byte	5
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	64
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	19
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	28
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	27
	.short	809
	.byte	-1
	.byte	0
	.short	804
	.byte	-1
	.byte	16
	.short	806
	.byte	-1
	.byte	22
	.short	810
	.byte	-1
	.byte	-105
	.short	811
	.byte	-1
	.byte	5
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	-48
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	20
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	27
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	27
	.short	809
	.byte	-1
	.byte	0
	.short	804
	.byte	-1
	.byte	18
	.short	806
	.byte	-1
	.byte	23
	.short	810
	.byte	-1
	.byte	-118
	.short	811
	.byte	-1
	.byte	6
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	-73
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	16
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	27
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	36
	.short	809
	.byte	-1
	.byte	0
	.short	804
	.byte	-1
	.byte	19
	.short	806
	.byte	-1
	.byte	23
	.short	810
	.byte	-1
	.byte	-118
	.short	811
	.byte	-1
	.byte	7
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	-92
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	29
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	36
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	37
	.short	809
	.byte	-1
	.byte	0
	.short	804
	.byte	-1
	.byte	21
	.short	806
	.byte	-1
	.byte	24
	.short	810
	.byte	-1
	.byte	-102
	.short	811
	.byte	-1
	.byte	8
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	-82
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	28
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	37
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	39
	.short	809
	.byte	-1
	.byte	0
	.short	804
	.byte	-1
	.byte	24
	.short	806
	.byte	-1
	.byte	25
	.short	810
	.byte	-1
	.byte	-117
	.short	811
	.byte	-1
	.byte	24
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	-84
	.short	809
	.byte	-1
	.byte	1
	.short	809
	.byte	-1
	.byte	27
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	32
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	46
	.short	809
	.byte	-1
	.byte	0
	.short	804
	.byte	-1
	.byte	26
	.short	806
	.byte	-1
	.byte	25
	.short	810
	.byte	-1
	.byte	-102
	.short	811
	.byte	-1
	.byte	23
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	19
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	27
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	46
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	45
	.short	809
	.byte	-1
	.byte	0
	.short	804
	.byte	-1
	.byte	29
	.short	806
	.byte	-1
	.byte	26
	.short	810
	.byte	-1
	.byte	-87
	.short	811
	.byte	-1
	.byte	6
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	20
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	36
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	45
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	44
	.short	809
	.byte	-1
	.byte	0
	.short	804
	.byte	-1
	.byte	31
	.short	806
	.byte	-1
	.byte	25
	.short	810
	.byte	-1
	.byte	-71
	.short	811
	.byte	-1
	.byte	6
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	16
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	37
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	44
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	44
	.short	809
	.byte	-1
	.byte	0
	.short	804
	.byte	-1
	.byte	35
	.short	806
	.byte	-1
	.byte	24
	.short	810
	.byte	-1
	.byte	-87
	.short	811
	.byte	-1
	.byte	7
	.short	808
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	29
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	39
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	44
	.short	809
	.byte	-1
	.byte	0
	.short	809
	.byte	-1
	.byte	53
	.short	809
	.byte	-1
	.byte	0
	.short	804
	.byte	-1
	.byte	38
	.short	806
	.byte	-1
	.byte	22
	.type	__func__.26892, %object
	.size	__func__.26892, 29
__func__.26892:
	.ascii	"wcd9xxx_soc_update_bits_push\000"
	.space	3
.LC0:
	.short	389
	.byte	2
	.byte	0
	.short	404
	.byte	32
	.byte	0
	.short	387
	.byte	4
	.byte	4
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	cp_count.26834, %object
	.size	cp_count.26834, 4
cp_count.26834:
	.space	4
	.type	clsh_state_fp, %object
	.size	clsh_state_fp, 64
clsh_state_fp:
	.space	64
	.section	.data.unlikely,"aw",%progbits
	.set	.LANCHOR0,. + 0
	.type	__warned.26966, %object
	.size	__warned.26966, 1
__warned.26966:
	.space	1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC4:
	.ascii	"Unexpected users %d,%d\012\000"
.LC5:
	.ascii	"/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/w"
	.ascii	"cd9xxx-common.c\000"
	.space	1
.LC6:
	.ascii	"<3>%s, invalid imped = %d\012\000"
	.space	1
.LC7:
	.ascii	"<3>%s: Not enough memory\012\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
