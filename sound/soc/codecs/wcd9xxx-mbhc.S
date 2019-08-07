codec_debug_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #340]
	mov	r0, #0
	str	r3, [r1, #124]
	bx	lr
	.fnend
	.size	codec_debug_open, .-codec_debug_open
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_calibrate_hs_polling, %function
wcd9xxx_calibrate_hs_polling:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r3, #1800
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r2, [r0, #96]
	ldr	r5, [r0, #324]
	cmp	r2, r3
	beq	.L4
	ldrb	r3, [r0, #156]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L5
	ldrh	r6, [r0, #100]
	ldrh	r8, [r0, #108]
	ldrh	r7, [r0, #112]
.L11:
	add	r3, r4, r3, lsl #1
	uxtb	r2, r6
	mov	r1, #976
	mov	r0, r5
	ldrh	r9, [r3, #116]
	bl	snd_soc_write
	lsr	r2, r6, #8
	movw	r1, #977
	mov	r0, r5
	bl	snd_soc_write
	ldr	r3, [r4, #60]
	cmp	r3, #1
	beq	.L3
	uxtb	r2, r8
	movw	r1, #978
	mov	r0, r5
	bl	snd_soc_write
	lsr	r2, r8, #8
	movw	r1, #979
	mov	r0, r5
	bl	snd_soc_write
	uxtb	r2, r7
	mov	r1, #980
	mov	r0, r5
	bl	snd_soc_write
	lsr	r2, r7, #8
	movw	r1, #981
	mov	r0, r5
	bl	snd_soc_write
	uxtb	r2, r9
	mov	r1, #984
	mov	r0, r5
	bl	snd_soc_write
	lsr	r2, r9, #8
	movw	r1, #985
	mov	r0, r5
	bl	snd_soc_write
	ldrb	r2, [r4, #120]	@ zero_extendqisi2
	movw	r1, #986
	mov	r0, r5
	bl	snd_soc_write
	ldrh	r2, [r4, #120]
	mov	r0, r5
	movw	r1, #987
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	lsr	r2, r2, #8
	ldr	lr, [sp, #28]
	add	sp, sp, #32
	b	snd_soc_write
.L5:
	ldrh	r6, [r0, #102]
	mov	r3, #1
	ldrh	r8, [r0, #110]
	ldrh	r7, [r0, #114]
	b	.L11
.L3:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L4:
	ldrh	r6, [r0, #100]
	mov	r3, #0
	ldrh	r8, [r0, #108]
	ldrh	r7, [r0, #112]
	b	.L11
	.fnend
	.size	wcd9xxx_calibrate_hs_polling, .-wcd9xxx_calibrate_hs_polling
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_start_hs_polling, %function
wcd9xxx_start_hs_polling:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldrb	r3, [r0]	@ zero_extendqisi2
	cmp	r3, #0
	bxeq	lr
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r6, [r0, #60]
	ldr	r3, [r0, #64]
	ldr	r5, [r0, #324]
	ldrb	r3, [r3, #52]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L16
	ldr	r3, [r0, #68]
	cmp	r3, #0
	beq	.L17
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L17
	mov	r1, #1
	mov	r0, r5
	blx	r3
.L16:
	mov	r2, #4
	movw	r1, #334
	mov	r0, r5
	bl	snd_soc_write
	ldr	r3, [r4, #68]
	cmp	r3, #0
	beq	.L18
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L18
	mov	r0, r5
	blx	r3
.L19:
	ldrb	r3, [r4, #328]	@ zero_extendqisi2
	eor	r3, r3, #1
	cmp	r6, #0
	movne	r3, #0
	andeq	r3, r3, #1
	cmp	r3, #0
	bne	.L42
.L20:
	mov	r2, #1
	mov	r1, #960
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #8
	mov	r1, #988
	mov	r0, r5
	mov	r3, #0
	bl	snd_soc_update_bits
	ldr	r6, [sp, #8]
	mov	r0, r5
	mov	r2, #1
	ldrd	r4, [sp]
	mov	r1, #960
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	snd_soc_write
.L18:
	mov	r3, #128
	movw	r1, #334
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L19
.L42:
	mov	r3, #1
	mov	r2, #127
	movw	r1, #977
	mov	r0, r5
	str	r3, [r4, #60]
	bl	snd_soc_write
	mov	r2, #255
	mov	r1, #976
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #127
	movw	r1, #979
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #255
	movw	r1, #978
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #127
	movw	r1, #981
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #255
	mov	r1, #980
	mov	r0, r5
	bl	snd_soc_write
	b	.L20
.L17:
	movw	r1, #:lower16:.LANCHOR0
	movw	r0, #:lower16:.LC1
	movt	r1, #:upper16:.LANCHOR0
	movt	r0, #:upper16:.LC1
	bl	printk
	b	.L16
	.fnend
	.size	wcd9xxx_start_hs_polling, .-wcd9xxx_start_hs_polling
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__wcd9xxx_switch_micbias, %function
__wcd9xxx_switch_micbias:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldrb	ip, [r0, #504]	@ zero_extendqisi2
	ldrb	r5, [r0, #156]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L67
	cmp	r1, #0
	mov	r7, r3
	ldr	r6, [r0, #324]
	mov	r8, r2
	mov	r4, r0
	beq	.L45
	cmp	r5, #0
	movne	r5, #1
	bne	.L67
	cmp	r3, #0
	beq	.L46
	ldrb	r3, [r0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L67
	cmp	r2, #0
	bne	.L63
.L48:
	movw	r1, #974
	mov	r0, r6
	bl	snd_soc_read
	ands	r5, r0, #4
	beq	.L101
.L49:
	ldr	r3, [r4, #96]
	movw	r1, #1800
	cmp	r3, r1
	bne	.L102
.L51:
	mov	r3, #128
	ldrh	r1, [r4, #136]
	mov	r0, r6
	mov	r2, r3
	bl	snd_soc_update_bits
	mov	r0, r6
	mov	r3, #0
	ldrh	r1, [r4, #136]
	mov	r2, #16
	bl	snd_soc_update_bits
	cmp	r5, #0
	beq	.L103
.L53:
	cmp	r8, #0
	beq	.L54
	mov	r0, r4
	bl	wcd9xxx_start_hs_polling
.L54:
	mov	r3, #1
	mov	r5, #0
	strb	r3, [r4, #156]
.L67:
	mov	r0, r5
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L45:
	cmp	r5, #0
	beq	.L67
	cmp	r3, #0
	beq	.L55
	ldrb	r3, [r0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L56
.L57:
	ldr	r1, [r4, #96]
	movw	r3, #1800
	cmp	r1, r3
	beq	.L59
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_k_val
	lsl	r3, r0, #2
	mov	r2, #252
	ldrh	r1, [r4, #132]
	mov	r0, r6
	bl	snd_soc_update_bits
	movw	r1, #10000
	mov	r0, r1
	bl	usleep_range
	ldrb	r2, [r4, #100]	@ zero_extendqisi2
	mov	r1, #976
	mov	r0, r6
	bl	snd_soc_write
	ldrh	r2, [r4, #100]
	movw	r1, #977
	mov	r0, r6
	lsr	r2, r2, #8
	bl	snd_soc_write
	ldr	r3, [r4, #60]
	cmp	r3, #1
	bne	.L104
.L59:
	mov	r3, #0
	mov	r2, #128
	ldrh	r1, [r4, #136]
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r0, r6
	mov	r3, #0
	ldrh	r1, [r4, #136]
	mov	r2, #16
	bl	snd_soc_update_bits
	cmp	r7, #0
	beq	.L61
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L62
.L61:
	cmp	r8, #0
	bne	.L105
.L62:
	mov	r3, #0
	strb	r3, [r4, #156]
	b	.L67
.L46:
	cmp	r2, #0
	beq	.L48
	ldrb	r3, [r0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L48
.L63:
	mov	r3, #8
	mov	r1, #988
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	b	.L48
.L55:
	cmp	r2, #0
	beq	.L57
	ldrb	r3, [r0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L57
.L64:
	mov	r3, #8
	mov	r1, #988
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	b	.L57
.L56:
	cmp	r2, #0
	beq	.L57
	b	.L64
.L105:
	mov	r0, r4
	bl	wcd9xxx_start_hs_polling
	b	.L62
.L104:
	ldrb	r2, [r4, #108]	@ zero_extendqisi2
	movw	r1, #978
	mov	r0, r6
	bl	snd_soc_write
	ldrh	r2, [r4, #108]
	movw	r1, #979
	mov	r0, r6
	lsr	r2, r2, #8
	bl	snd_soc_write
	ldrb	r2, [r4, #112]	@ zero_extendqisi2
	mov	r1, #980
	mov	r0, r6
	bl	snd_soc_write
	ldrh	r2, [r4, #112]
	movw	r1, #981
	mov	r0, r6
	lsr	r2, r2, #8
	bl	snd_soc_write
	ldrb	r2, [r4, #116]	@ zero_extendqisi2
	mov	r1, #984
	mov	r0, r6
	bl	snd_soc_write
	ldrh	r2, [r4, #116]
	movw	r1, #985
	mov	r0, r6
	lsr	r2, r2, #8
	bl	snd_soc_write
	b	.L59
.L102:
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_k_val
	movw	r1, #10000
	mov	r7, r0
	mov	r0, r1
	bl	usleep_range
	lsl	r3, r7, #2
	mov	r2, #252
	ldrh	r1, [r4, #132]
	mov	r0, r6
	bl	snd_soc_update_bits
	movw	r1, #10000
	mov	r0, r1
	bl	usleep_range
	ldrb	r2, [r4, #102]	@ zero_extendqisi2
	mov	r1, #976
	mov	r0, r6
	bl	snd_soc_write
	ldrh	r2, [r4, #102]
	movw	r1, #977
	mov	r0, r6
	lsr	r2, r2, #8
	bl	snd_soc_write
	ldr	r3, [r4, #60]
	cmp	r3, #1
	beq	.L51
	ldrb	r2, [r4, #110]	@ zero_extendqisi2
	movw	r1, #978
	mov	r0, r6
	bl	snd_soc_write
	ldrh	r2, [r4, #110]
	movw	r1, #979
	mov	r0, r6
	lsr	r2, r2, #8
	bl	snd_soc_write
	ldrb	r2, [r4, #114]	@ zero_extendqisi2
	mov	r1, #980
	mov	r0, r6
	bl	snd_soc_write
	ldrh	r2, [r4, #114]
	movw	r1, #981
	mov	r0, r6
	lsr	r2, r2, #8
	bl	snd_soc_write
	ldrb	r2, [r4, #118]	@ zero_extendqisi2
	mov	r1, #984
	mov	r0, r6
	bl	snd_soc_write
	ldrh	r2, [r4, #118]
	movw	r1, #985
	mov	r0, r6
	lsr	r2, r2, #8
	bl	snd_soc_write
	b	.L51
.L101:
	mov	r3, #4
	movw	r1, #974
	ldr	r0, [r4, #324]
	mov	r2, r3
	bl	snd_soc_update_bits
	b	.L49
.L103:
	mov	r3, r5
	mov	r2, #4
	ldr	r0, [r4, #324]
	movw	r1, #974
	bl	snd_soc_update_bits
	b	.L53
	.fnend
	.size	__wcd9xxx_switch_micbias, .-__wcd9xxx_switch_micbias
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_codec_switch_cfilt_mode, %function
wcd9xxx_codec_switch_cfilt_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-20]!
	.save {r4, r5, r6, r7, lr}
	mov	r2, r1
	mov	r4, r0
	strd	r6, [sp, #8]
	str	lr, [sp, #16]
	ldr	r3, [r0, #68]
	.pad #12
	sub	sp, sp, #12
	ldr	r7, [r0, #324]
	cmp	r3, #0
	beq	.L107
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L107
	blx	r3
	uxtb	r6, r0
	ubfx	r3, r0, #8, #8
	ubfx	r5, r0, #16, #8
.L108:
	cmp	r6, r3
	beq	.L106
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L136
.L113:
	mov	r3, r6
	mov	r2, r5
	ldrh	r1, [r4, #134]
	mov	r0, r7
	bl	snd_soc_update_bits
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L137
.L106:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
.L137:
	mov	r1, #960
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	tst	r0, #1
	beq	.L106
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	lr, [sp, #16]
	add	sp, sp, #20
	b	wcd9xxx_start_hs_polling
.L136:
	mov	r1, #960
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	tst	r0, #1
	beq	.L113
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L113
	mov	r3, #8
	mov	r1, #988
	ldr	r0, [r4, #324]
	mov	r2, r3
	bl	snd_soc_update_bits
	b	.L113
.L107:
	cmp	r2, #0
	ldrh	r1, [r4, #134]
	mov	r0, r7
	movne	r6, #0
	moveq	r6, #64
	mov	r5, #64
	bl	snd_soc_read
	and	r3, r0, r5
	b	.L108
	.fnend
	.size	wcd9xxx_codec_switch_cfilt_mode, .-wcd9xxx_codec_switch_cfilt_mode
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_set_and_turnoff_hph_padac, %function
wcd9xxx_set_and_turnoff_hph_padac:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movw	r1, #429
	strd	r6, [sp, #8]
	mov	r6, r0
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r4, [r0, #324]
	mov	r0, r4
	bl	snd_soc_read
	add	r5, r0, #1
	movw	r1, #427
	mov	r0, r4
	and	r5, r5, #255
	bl	snd_soc_read
	tst	r0, #48
	bne	.L152
.L139:
	movw	r1, #433
	mov	r0, r4
	bl	snd_soc_read
	tst	r0, #192
	bne	.L153
.L140:
	movw	r1, #439
	mov	r0, r4
	bl	snd_soc_read
	tst	r0, #192
	beq	.L141
	add	r1, r6, #332
	mov	r0, #3
	bl	_set_bit
.L141:
	mov	r3, #0
	mov	r2, #48
	movw	r1, #427
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r2, #128
	movw	r1, #433
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r0, r4
	movw	r1, #439
	mov	r3, #0
	mov	r2, #192
	bl	snd_soc_update_bits
	mov	r1, #1000
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	mul	r1, r1, r5
	ldrd	r4, [sp]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	mov	r0, r1
	b	usleep_range
.L153:
	add	r1, r6, #332
	mov	r0, #2
	bl	_set_bit
	b	.L140
.L152:
	add	r7, r6, #332
	mov	r0, #0
	mov	r1, r7
	bl	_set_bit
	mov	r1, r7
	mov	r0, #1
	bl	_set_bit
	b	.L139
	.fnend
	.size	wcd9xxx_set_and_turnoff_hph_padac, .-wcd9xxx_set_and_turnoff_hph_padac
	.section	.text.unlikely,"ax",%progbits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_jack_report, %function
wcd9xxx_jack_report:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r6, r1
	add	r1, r0, #348
	mov	r4, r2
	cmp	r6, r1
	mov	r7, r3
	bne	.L155
	mov	r5, r0
	ubfx	r2, r2, #1, #1
	ldr	r0, [r0, #320]
	mov	r1, #2
	bl	wcd9xxx_resmgr_cond_update_cond
	and	r2, r4, #1
	mov	r1, #1
	ldr	r0, [r5, #320]
	bl	wcd9xxx_resmgr_cond_update_cond
.L155:
	mov	r2, r7
	mov	r1, r4
	mov	r0, r6
	pop	{r4, r5, r6, r7, r8, lr}
	b	snd_soc_jack_report_no_dapm
	.fnend
	.size	wcd9xxx_jack_report, .-wcd9xxx_jack_report
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_enable_hs_detect, %function
wcd9xxx_enable_hs_detect:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	strd	r6, [sp, #8]
	mov	r7, r1
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r1, [r0, #64]
	ldr	r4, [r0, #324]
	ldr	r6, [r1, #4]
	cmp	r6, #0
	beq	.L194
	mov	r5, r0
	movw	r1, #989
	mov	r8, r2
	mov	r9, r3
	mov	r2, #1
	mov	r3, #0
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r3, #1
	ldrh	r1, [r5, #140]
	mov	r0, r4
	mov	r2, r3
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r2, #144
	ldrh	r1, [r5, #136]
	mov	r0, r4
	bl	snd_soc_update_bits
	cmp	r7, #0
	bne	.L195
	mov	r3, r7
	mov	r2, #18
	movw	r1, #510
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r3, r7
	mov	r2, #1
	ldrh	r1, [r5, #140]
	mov	r0, r4
	bl	snd_soc_update_bits
	ldr	r3, [r6, #16]	@ unaligned
	mov	r2, #96
	mov	r0, r4
	ldrh	r1, [r5, #136]
	lsl	r3, r3, #5
	bl	snd_soc_update_bits
	mov	r3, #128
	ldrh	r1, [r5, #136]
	mov	r0, r4
	mov	r2, r3
	bl	snd_soc_update_bits
	ldrh	r1, [r6, #24]	@ unaligned
	mov	r0, r1
	bl	usleep_range
	mov	r3, #16
	ldrh	r1, [r5, #136]
	mov	r0, r4
	mov	r2, r3
	bl	snd_soc_update_bits
	mov	r3, #2
	movw	r1, #989
	mov	r2, r3
	mov	r0, r4
	bl	snd_soc_update_bits
.L164:
	movw	r1, #974
	mov	r0, r4
	bl	snd_soc_read
	tst	r0, #4
	bne	.L196
.L165:
	mov	r3, #0
	mov	r2, #128
	ldrh	r1, [r5, #138]
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r1, #17
	mov	r0, r4
	bl	snd_soc_read
	ands	r7, r0, #1
	beq	.L197
	mov	r1, #16
	mov	r0, r4
	bl	snd_soc_read
	tst	r0, #128
	bne	.L198
.L169:
	ldr	r3, [r5, #320]
	ldr	r2, [r3, #36]
	cmp	r2, #0
	beq	.L171
	ldrh	r1, [r2, #4]
	cmp	r1, #0
	bne	.L199
.L171:
	ldr	r2, [r5, #532]
	ldr	r0, [r3, #4]
	ldr	r1, [r2, #20]
	bl	wcd9xxx_enable_irq
	mov	r3, #1
	mov	r0, r4
	mov	r2, r3
	movw	r1, #989
	bl	snd_soc_update_bits
	mov	r0, #0
.L157:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L195:
	mov	r3, #1
	mov	r1, #0
	mov	r2, r3
	mov	r0, r5
	bl	__wcd9xxx_switch_micbias
	cmp	r9, #0
	bne	.L200
.L161:
	tst	r8, #1
	bne	.L201
.L162:
	tst	r8, #2
	bne	.L202
.L163:
	mov	r3, #0
	mov	r2, #2
	movw	r1, #989
	mov	r0, r4
	bl	snd_soc_update_bits
	b	.L164
.L197:
	mov	r3, #3
	mov	r1, #17
	mov	r2, r3
	mov	r0, r4
	bl	snd_soc_update_bits
	ldrb	r1, [r6, #1]	@ zero_extendqisi2
	mov	r0, r1
	bl	usleep_range
	mov	r1, #16
	mov	r0, r4
	bl	snd_soc_read
	tst	r0, #128
	beq	.L169
	mov	r2, #16
	mov	r3, r7
	mov	r1, r2
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r3, #128
	mov	r1, #16
	mov	r2, r3
	mov	r0, r4
	bl	snd_soc_update_bits
	ldrb	r1, [r6]	@ zero_extendqisi2
	mov	r0, r1
	bl	usleep_range
	mov	r3, r7
	mov	r2, #128
	mov	r1, #16
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r3, r7
	mov	r2, #1
	mov	r1, #17
	mov	r0, r4
	bl	snd_soc_update_bits
	b	.L169
.L196:
	movw	r1, #785
	mov	r0, r4
	bl	snd_soc_read
	ands	r7, r0, #5
	bne	.L166
	mov	r1, #1
	ldr	r0, [r5, #320]
	bl	wcd9xxx_resmgr_enable_config_mode
	mov	r3, r7
	mov	r2, #6
	movw	r1, #974
	mov	r0, r4
	bl	snd_soc_update_bits
	ldrb	r1, [r6, #2]	@ zero_extendqisi2
	mov	r0, r1
	bl	usleep_range
	mov	r1, r7
	ldr	r0, [r5, #320]
	bl	wcd9xxx_resmgr_enable_config_mode
	b	.L165
.L199:
	ldr	r3, [r5, #64]
	mov	r2, #3
	mov	r0, r4
	ldr	r3, [r3, #8]
	bl	snd_soc_update_bits
	ldr	r3, [r5, #320]
	b	.L171
.L198:
	mov	r2, #16
	mov	r3, #0
	mov	r1, r2
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r3, #128
	mov	r1, #16
	mov	r2, r3
	mov	r0, r4
	bl	snd_soc_update_bits
	ldrb	r1, [r6]	@ zero_extendqisi2
	mov	r0, r1
	bl	usleep_range
	mov	r3, #0
	mov	r2, #128
	mov	r1, #16
	mov	r0, r4
	bl	snd_soc_update_bits
	b	.L169
.L166:
	mov	r3, #0
	mov	r2, #6
	movw	r1, #974
	mov	r0, r4
	bl	snd_soc_update_bits
	b	.L165
.L202:
	ldr	r3, [r6, #16]	@ unaligned
	mov	r2, #96
	mov	r0, r4
	ldrh	r1, [r5, #136]
	lsl	r3, r3, #5
	bl	snd_soc_update_bits
	mov	r3, #128
	ldrh	r1, [r5, #136]
	mov	r0, r4
	mov	r2, r3
	bl	snd_soc_update_bits
	ldrh	r1, [r6, #24]	@ unaligned
	mov	r0, r1
	bl	usleep_range
	ldrh	r1, [r5, #140]
	mov	r3, #0
	mov	r2, #1
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r3, #16
	ldrh	r1, [r5, #136]
	mov	r0, r4
	mov	r2, r3
	bl	snd_soc_update_bits
	b	.L163
.L201:
	mov	r3, #17
	movw	r1, #510
	mov	r2, r3
	mov	r0, r4
	bl	snd_soc_update_bits
	ldr	r3, [r6, #20]	@ unaligned
	mov	r2, #12
	movw	r1, #510
	mov	r0, r4
	lsl	r3, r3, #2
	bl	snd_soc_update_bits
	mov	r3, #2
	movw	r1, #510
	mov	r2, r3
	mov	r0, r4
	bl	snd_soc_update_bits
	b	.L162
.L200:
	mov	r0, r5
	bl	wcd9xxx_set_and_turnoff_hph_padac
	b	.L161
.L194:
	movw	r0, #:lower16:.LC2
	movt	r0, #:upper16:.LC2
	bl	printk
	mvn	r0, #21
	b	.L157
	.fnend
	.size	wcd9xxx_enable_hs_detect, .-wcd9xxx_enable_hs_detect
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	earjack_state_onoff_show, %function
earjack_state_onoff_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r4, r2
	str	lr, [sp, #4]
	bl	dev_get_drvdata
	ldr	r3, [r0, #160]
	movw	r2, #:lower16:.LC3
	mov	r0, r4
	movt	r2, #:upper16:.LC3
	ldr	r4, [sp]
	mov	r1, #4
	ldr	lr, [sp, #4]
	add	sp, sp, #8
	sub	r3, r3, #3
	clz	r3, r3
	lsr	r3, r3, #5
	b	snprintf
	.fnend
	.size	earjack_state_onoff_show, .-earjack_state_onoff_show
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	key_state_onoff_show, %function
key_state_onoff_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r4, r2
	str	lr, [sp, #4]
	bl	dev_get_drvdata
	ldr	r3, [r0, #56]
	movw	r2, #:lower16:.LC3
	mov	r0, r4
	movt	r2, #:upper16:.LC3
	ldr	r4, [sp]
	mov	r1, #4
	ldr	lr, [sp, #4]
	add	sp, sp, #8
	ubfx	r3, r3, #26, #1
	b	snprintf
	.fnend
	.size	key_state_onoff_show, .-key_state_onoff_show
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	codec_debug_write, %function
codec_debug_write:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	cmp	r2, #31
	strd	r6, [sp, #8]
	movw	r6, #:lower16:__stack_chk_guard
	movt	r6, #:upper16:__stack_chk_guard
	str	r8, [sp, #16]
	ldr	r3, [r6]
	str	lr, [sp, #20]
	.pad #40
	sub	sp, sp, #40
	ldr	r7, [r0, #124]
	str	r3, [sp, #36]
	bhi	.L212
	mov	r3, sp
	mov	r4, r2
	bic	r3, r3, #8128
	bic	r3, r3, #63
	ldr	r3, [r3, #8]
	.syntax divided
@ 439 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/uaccess.h" 1
	adds ip, r1, r2; sbcccs ip, ip, r3; movcc r3, #0
@ 0 "" 2
	.arm
	.syntax unified
	cmp	r3, #0
	beq	.L218
	cmp	r2, #0
	addeq	r8, sp, #4
	bne	.L219
.L210:
	add	r0, sp, #40
	mov	r5, #0
	add	r4, r0, r4
	movw	r1, #:lower16:.LC4
	str	r8, [r0, #-40]!
	movt	r1, #:upper16:.LC4
	strb	r5, [r4, #-36]
	bl	strsep
	ldrb	r3, [r0]	@ zero_extendqisi2
	mov	r0, r5
	subs	r3, r3, #48
	movne	r3, #1
	strb	r3, [r7, #328]
.L207:
	ldr	r2, [sp, #36]
	ldr	r3, [r6]
	cmp	r2, r3
	bne	.L220
	add	sp, sp, #40
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L219:
	add	r0, sp, #4
	mov	r1, r2
	bl	__memzero
	mvn	r0, #13
	b	.L207
.L218:
	add	r8, sp, #4
	mov	r0, r8
	bl	__copy_from_user
	cmp	r0, #0
	beq	.L210
	mvn	r0, #13
	b	.L207
.L212:
	mvn	r0, #21
	b	.L207
.L220:
	bl	__stack_chk_fail
	.fnend
	.size	codec_debug_write, .-codec_debug_write
	.section	.text.unlikely
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_acdb_mclk_index.part.9, %function
wcd9xxx_acdb_mclk_index.part.9:
	.fnstart
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.syntax divided
@ 3851 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9xxx-mbhc.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9xxx-mbhc.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 3851, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
	.fnend
	.size	wcd9xxx_acdb_mclk_index.part.9, .-wcd9xxx_acdb_mclk_index.part.9
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_update_mbhc_clk_rate, %function
wcd9xxx_update_mbhc_clk_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #32768
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r1
	movt	r3, 187
	strd	r6, [sp, #8]
	cmp	r1, r3
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	.pad #4
	sub	sp, sp, #4
	mov	lr, r0
	ldr	r4, [r0, #324]
	beq	.L227
	mov	r3, #31744
	movt	r3, 146
	cmp	r1, r3
	moveq	fp, #1
	bne	.L225
.L223:
	ldr	r3, [lr, #64]
	mov	r2, #32768
	movt	r2, 187
	ldr	r1, [r3, #20]
	cmp	r1, r2
	beq	.L229
	mov	r2, #31744
	movt	r2, 146
	cmp	r1, r2
	bne	.L225
	mov	r6, #1
.L224:
	ldr	r3, [r3, #4]
	movw	r9, #19923
	mov	r0, #512000
	movt	r9, 4194
	mov	r2, #128000
	mov	r7, #256000
	umull	r1, r9, r9, r5
	ldrb	ip, [r3, #65]	@ zero_extendqisi2
	add	r8, r3, #80
	ldrb	r1, [r3, #4]	@ zero_extendqisi2
	ldrb	r10, [r3, #61]	@ zero_extendqisi2
	lsr	r9, r9, #6
	lsl	ip, ip, #2
	mla	r2, r1, r2, r2
	movw	r1, #963
	add	r3, r3, ip
	udiv	r7, r7, r9
	add	ip, ip, fp
	add	r3, r3, r6
	ldrb	r6, [r3, #82]	@ zero_extendqisi2
	udiv	r2, r2, r9
	mul	r3, r0, r6
	mov	r0, r4
	mla	r3, r10, r3, r3
	add	r2, r2, #250
	udiv	r3, r3, r9
	str	r3, [lr, #88]
	str	r2, [lr, #92]
	ldrb	r3, [r8, ip]	@ zero_extendqisi2
	mul	r7, r3, r7
	add	r7, r7, #10
	str	r7, [lr, #84]
	ldrb	r2, [r8, ip]	@ zero_extendqisi2
	bl	snd_soc_write
	mov	r2, r6
	mov	r1, #968
	mov	r0, r4
	bl	snd_soc_write
	mov	r3, #31744
	mov	r1, #964
	movt	r3, 146
	mov	r0, r4
	cmp	r5, r3
	moveq	r5, #23
	movne	r5, #30
	moveq	r2, #3
	movne	r2, #4
	bl	snd_soc_write
	mov	r2, r5
	mov	r0, r4
	movw	r1, #965
	add	sp, sp, #4
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	snd_soc_write
.L227:
	mov	fp, #0
	b	.L223
.L229:
	mov	r6, #0
	b	.L224
.L225:
	bl	wcd9xxx_acdb_mclk_index.part.9
	.fnend
	.size	wcd9xxx_update_mbhc_clk_rate, .-wcd9xxx_update_mbhc_clk_rate
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_pull_down_micbias.constprop.13, %function
wcd9xxx_pull_down_micbias.constprop.13:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r5, [r0, #324]
	ldrh	r1, [r0, #140]
	mov	r0, r5
	bl	snd_soc_read
	ands	r6, r0, #1
	beq	.L233
	movw	r4, #:lower16:.LANCHOR1
	movt	r4, #:upper16:.LANCHOR1
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	mvnne	r0, #13
	beq	.L239
.L232:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L233:
	mov	r1, #336
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	tst	r0, #16
	bne	.L240
	mov	r3, #1
	ldrh	r1, [r4, #140]
	mov	r0, r5
	mov	r2, r3
	bl	snd_soc_update_bits
	movw	r1, #1010
	mov	r0, #1000
	bl	usleep_range
.L236:
	ldrh	r1, [r4, #140]
	mov	r3, #0
	mov	r2, #1
	mov	r0, r5
	bl	snd_soc_update_bits
	movw	r0, #5000
	movw	r1, #5100
	bl	usleep_range
	mov	r0, #0
	b	.L232
.L240:
	mov	r3, r6
	mov	r2, #16
	ldr	r0, [r4, #324]
	mov	r1, #336
	bl	snd_soc_update_bits
	mov	r3, #1
	ldrh	r1, [r4, #140]
	mov	r0, r5
	mov	r2, r3
	bl	snd_soc_update_bits
	movw	r1, #1010
	mov	r0, #1000
	bl	usleep_range
	mov	r3, #16
	mov	r1, #336
	ldr	r0, [r4, #324]
	mov	r2, r3
	bl	snd_soc_update_bits
	b	.L236
.L239:
	movw	r2, #:lower16:.LC5
	movw	r0, #:lower16:.LC6
	movt	r0, #:upper16:.LC6
	movt	r2, #:upper16:.LC5
	movw	r1, #1716
	bl	warn_slowpath_fmt
	mov	r3, #1
	mvn	r0, #13
	strb	r3, [r4]
	b	.L232
	.fnend
	.size	wcd9xxx_pull_down_micbias.constprop.13, .-wcd9xxx_pull_down_micbias.constprop.13
	.section	.text.unlikely
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	scale_v_micb_vddio.constprop.21, %function
scale_v_micb_vddio.constprop.21:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	mov	r4, r1
	ldr	r0, [r0, #320]
	movw	r1, #1800
	bl	wcd9xxx_resmgr_get_k_val
	add	r5, r0, #4
	ldr	r1, [r6, #96]
	ldr	r0, [r6, #320]
	bl	wcd9xxx_resmgr_get_k_val
	add	r0, r0, #4
	mul	r4, r4, r0
	sdiv	r0, r4, r5
	sxth	r0, r0
	pop	{r4, r5, r6, pc}
	.fnend
	.size	scale_v_micb_vddio.constprop.21, .-scale_v_micb_vddio.constprop.21
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__wcd9xxx_codec_sta_dce.constprop.22, %function
__wcd9xxx_codec_sta_dce.constprop.22:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	mov	r7, r1
	strd	r8, [sp, #16]
	mov	r8, r2
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r1, [r0, #320]
	ldr	r5, [r0, #324]
	ldr	r3, [r0, #532]
	ldr	r0, [r1, #4]
	ldr	r1, [r3, #16]
	bl	wcd9xxx_disable_irq
	cmp	r8, #0
	bne	.L263
.L244:
	ldr	r3, [r4, #64]
	ldrb	r3, [r3, #53]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L264
.L245:
	cmp	r7, #0
	beq	.L265
.L246:
	mov	r3, #8
	mov	r1, #988
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r2, #4
	mov	r1, #960
	mov	r0, r5
	bl	snd_soc_write
	mov	r3, #0
	mov	r2, #8
	mov	r1, #988
	mov	r0, r5
	bl	snd_soc_update_bits
	ldr	r3, [r4, #64]
	ldrb	r3, [r3, #53]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L266
.L247:
	ldr	r1, [r4, #84]
	mov	r0, r1
	bl	usleep_range
	mov	r2, #4
	mov	r1, #960
	mov	r0, r5
	bl	snd_soc_write
	ldr	r1, [r4, #88]
	mov	r0, r1
	bl	usleep_range
	movw	r1, #973
	mov	r0, r5
	bl	snd_soc_read
	mov	r9, r0
	mov	r1, #972
	mov	r0, r5
	bl	snd_soc_read
	uxtb	r6, r0
	cmp	r7, #0
	orr	r6, r6, r9, lsl #8
	sxth	r6, r6
	beq	.L267
.L248:
	cmp	r8, #0
	beq	.L249
	mov	r3, #2
	mov	r0, r5
	mov	r2, r3
	movw	r1, #974
	bl	snd_soc_update_bits
.L249:
	ldr	r2, [r4, #320]
	ldr	r3, [r4, #532]
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #16]
	bl	wcd9xxx_enable_irq
	ldrd	r4, [sp]
	mov	r0, r6
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L267:
	mov	r3, r7
	mov	r2, #4
	movw	r1, #974
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L248
.L266:
	mov	r3, #2
	mov	r1, #988
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L247
.L265:
	mov	r3, #4
	movw	r1, #974
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L246
.L264:
	mov	r3, #0
	mov	r2, #2
	mov	r1, #988
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L245
.L263:
	mov	r3, #0
	mov	r2, #2
	movw	r1, #974
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L244
	.fnend
	.size	__wcd9xxx_codec_sta_dce.constprop.22, .-__wcd9xxx_codec_sta_dce.constprop.22
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__wcd9xxx_codec_sta_dce.constprop.23, %function
__wcd9xxx_codec_sta_dce.constprop.23:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r0
	strd	r6, [sp, #8]
	mov	r7, r1
	strd	r8, [sp, #16]
	mov	r8, r2
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r1, [r0, #320]
	ldr	r4, [r0, #324]
	ldr	r3, [r0, #532]
	ldr	r0, [r1, #4]
	ldr	r1, [r3, #16]
	bl	wcd9xxx_disable_irq
	cmp	r8, #0
	bne	.L288
.L269:
	ldr	r3, [r5, #64]
	ldrb	r3, [r3, #53]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L289
.L270:
	cmp	r7, #0
	beq	.L290
.L271:
	mov	r3, #8
	mov	r1, #988
	mov	r2, r3
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r2, #2
	mov	r1, #960
	mov	r0, r4
	bl	snd_soc_write
	mov	r3, #0
	mov	r2, #8
	mov	r1, #988
	mov	r0, r4
	bl	snd_soc_update_bits
	ldr	r3, [r5, #64]
	ldrb	r3, [r3, #53]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L291
.L272:
	ldr	r1, [r5, #84]
	mov	r0, r1
	bl	usleep_range
	mov	r2, #2
	mov	r1, #960
	mov	r0, r4
	bl	snd_soc_write
	ldr	r1, [r5, #92]
	mov	r0, r1
	bl	usleep_range
	movw	r1, #971
	mov	r0, r4
	bl	snd_soc_read
	mov	r9, r0
	movw	r1, #970
	mov	r0, r4
	bl	snd_soc_read
	uxtb	r6, r0
	mov	r3, #8
	mov	r2, r3
	mov	r1, #988
	mov	r0, r4
	orr	r6, r6, r9, lsl r3
	bl	snd_soc_update_bits
	mov	r2, #0
	mov	r1, #960
	mov	r0, r4
	sxth	r6, r6
	bl	snd_soc_write
	cmp	r7, #0
	beq	.L292
.L273:
	cmp	r8, #0
	beq	.L274
	mov	r3, #2
	mov	r0, r4
	mov	r2, r3
	movw	r1, #974
	bl	snd_soc_update_bits
.L274:
	ldr	r2, [r5, #320]
	ldr	r3, [r5, #532]
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #16]
	bl	wcd9xxx_enable_irq
	ldrd	r4, [sp]
	mov	r0, r6
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L292:
	mov	r3, r7
	mov	r2, #4
	movw	r1, #974
	mov	r0, r4
	bl	snd_soc_update_bits
	b	.L273
.L291:
	mov	r3, #2
	mov	r1, #988
	mov	r2, r3
	mov	r0, r4
	bl	snd_soc_update_bits
	b	.L272
.L290:
	mov	r3, #4
	movw	r1, #974
	mov	r2, r3
	mov	r0, r4
	bl	snd_soc_update_bits
	b	.L271
.L289:
	mov	r3, #0
	mov	r2, #2
	mov	r1, #988
	mov	r0, r4
	bl	snd_soc_update_bits
	b	.L270
.L288:
	mov	r3, #0
	mov	r2, #2
	movw	r1, #974
	mov	r0, r4
	bl	snd_soc_update_bits
	b	.L269
	.fnend
	.size	__wcd9xxx_codec_sta_dce.constprop.23, .-__wcd9xxx_codec_sta_dce.constprop.23
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_get_z, %function
wcd9xxx_get_z:
	.fnstart
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r3
	strd	r6, [sp, #8]
	mov	r7, r1
	mov	r6, r0
	strd	r8, [sp, #16]
	mov	r8, r2
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r1, [r0, #320]
	.pad #12
	sub	sp, sp, #12
	ldrb	fp, [sp, #48]	@ zero_extendqisi2
	ldr	r4, [r0, #324]
	ldr	r9, [r1, #112]
	cmp	r9, #1
	beq	.L308
.L294:
	ldrh	r1, [r5, #8]
	mov	r0, r4
	bl	snd_soc_read
	sxth	r9, r0
	mov	r3, #1
	ldrh	r1, [r5, #8]
	mov	r2, #129
	mov	r0, r4
	bl	snd_soc_update_bits
	ldrh	r1, [r5, #4]
	mov	r0, r4
	bl	snd_soc_read
	sxth	r10, r0
	mov	r3, #0
	ldrh	r1, [r5, #4]
	mov	r2, #128
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r3, #1
	mov	r2, #16
	mov	r1, #336
	mov	r0, r4
	bl	snd_soc_update_bits
	str	r0, [sp, #4]
	mov	r1, #2000
	mov	r0, #1000
	bl	usleep_range
	cmp	r8, #0
	beq	.L295
	movw	r1, #974
	ldr	r0, [r6, #324]
	bl	snd_soc_read
	ubfx	r1, r0, #2, #1
	mov	r2, fp
	mov	r0, r6
	bl	__wcd9xxx_codec_sta_dce.constprop.23
	strh	r0, [r8]	@ movhi
.L295:
	cmp	r7, #0
	beq	.L296
	movw	r1, #974
	ldr	r0, [r6, #324]
	bl	snd_soc_read
	ubfx	r1, r0, #2, #1
	mov	r2, fp
	mov	r0, r6
	bl	__wcd9xxx_codec_sta_dce.constprop.22
	strh	r0, [r7]	@ movhi
.L296:
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L297
	mov	r3, #16
	mov	r1, #336
	mov	r2, r3
	mov	r0, r4
	bl	snd_soc_update_bits
.L297:
	mov	r2, r10
	ldrh	r1, [r5, #4]
	mov	r0, r4
	bl	snd_soc_write
	ldrh	r1, [r5, #8]
	mov	r2, r9
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	snd_soc_write
.L308:
	movw	r10, #:lower16:.LANCHOR1
	movt	r10, #:upper16:.LANCHOR1
	ldrb	r3, [r10, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L294
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L309
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #3439
	bl	warn_slowpath_fmt
	strb	r9, [r10, #1]
	b	.L294
.L310:
	.align	2
.L309:
	.word	.LANCHOR0+28
	.fnend
	.size	wcd9xxx_get_z, .-wcd9xxx_get_z
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_btn_lpress_fn, %function
wcd9xxx_btn_lpress_fn:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	movw	r1, #971
	mov	r4, r0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r5, [r0, #320]
	mov	r0, r5
	bl	snd_soc_read
	mov	r0, r5
	movw	r1, #970
	bl	snd_soc_read
	ldr	r5, [r4, #320]
	movw	r1, #973
	mov	r0, r5
	bl	snd_soc_read
	mov	r0, r5
	mov	r1, #972
	bl	snd_soc_read
	ldr	r2, [r4, #52]
	add	r0, r4, #416
	mov	r1, r2
	bl	snd_soc_jack_report_no_dapm
	ldr	r3, [r4, #316]
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	ldr	r0, [r3, #4]
	b	wcd9xxx_unlock_sleep
	.fnend
	.size	wcd9xxx_btn_lpress_fn, .-wcd9xxx_btn_lpress_fn
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_hphr_ocp_irq, %function
wcd9xxx_hphr_ocp_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r0, #:lower16:.LC8
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r1
	movt	r0, #:upper16:.LC8
	ldr	r1, .L318
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	bl	printk
	ldrh	r5, [r4, #164]
	cmp	r5, #0
	beq	.L317
	ldr	r2, [r4, #320]
	ldr	r3, [r4, #532]
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #28]
	bl	wcd9xxx_disable_irq
	ldr	r5, [r4, #160]
	mov	r1, #2
	ldr	r0, [r4, #320]
	orr	r5, r5, #128
	ubfx	r2, r5, #1, #1
	str	r5, [r4, #160]
	bl	wcd9xxx_resmgr_cond_update_cond
	and	r2, r5, #1
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_cond_update_cond
	mov	r1, r5
	add	r0, r4, #348
	movw	r2, #967
	bl	snd_soc_jack_report_no_dapm
.L315:
	ldrd	r4, [sp]
	mov	r0, #1
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L317:
	movw	r0, #:lower16:.LC9
	ldr	r1, .L318
	movt	r0, #:upper16:.LC9
	ldr	r6, [r4, #324]
	bl	printk
	ldrb	ip, [r4, #165]	@ zero_extendqisi2
	mov	r3, r5
	mov	r2, #16
	movw	r1, #426
	mov	r0, r6
	add	ip, ip, #1
	strb	ip, [r4, #165]
	bl	snd_soc_update_bits
	mov	r3, #16
	mov	r0, r6
	mov	r2, r3
	movw	r1, #426
	bl	snd_soc_update_bits
	b	.L315
.L319:
	.align	2
.L318:
	.word	.LANCHOR0+44
	.fnend
	.size	wcd9xxx_hphr_ocp_irq, .-wcd9xxx_hphr_ocp_irq
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_mbhc_calc_thres, %function
wcd9xxx_mbhc_calc_thres:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	mov	r7, r0
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r2, [r0, #64]
	.pad #12
	sub	sp, sp, #12
	ldr	ip, [r0, #96]
	ldr	r6, [r2, #4]
	cmp	ip, #0
	beq	.L347
	ldrh	r1, [r0, #78]
	ldrh	r0, [r0, #80]
	ldrsh	r2, [r6, #48]	@ unaligned
	sub	r0, r0, r1
	smulbb	r2, r2, r0
	udiv	r2, r2, ip
	add	r2, r1, r2
	strh	r2, [r7, #100]	@ movhi
.L323:
	ldrh	r2, [r7, #72]
	ldrh	r0, [r7, #76]
	ldrsh	r1, [r6, #48]	@ unaligned
	sub	r0, r0, r2
	smulbb	r1, r1, r0
	udiv	r1, r1, ip
	add	r2, r2, r1
	uxth	r2, r2
.L324:
	mov	lr, #10
	ldr	r0, [r7, #320]
	strh	r2, [r7, #104]	@ movhi
	movw	r1, #1800
	movt	lr, 80
	cmp	ip, r1
	str	lr, [r7, #124]
	bne	.L348
.L325:
	ldrh	r1, [r7, #74]
	movw	lr, #650
	movw	ip, #46021
	ldrh	r2, [r7, #76]
	movt	ip, 37282
	sub	r2, r2, r1
	smulbb	r2, r2, lr
	umull	r3, r2, ip, r2
	add	r2, r1, r2, lsr #10
	uxth	r2, r2
.L331:
	strh	r2, [r7, #128]	@ movhi
	ldrb	r4, [r6, #65]	@ zero_extendqisi2
	add	r2, r6, #80
	sxth	ip, r4
	cmp	r4, #0
	lsl	r1, ip, #1
	beq	.L332
	add	ip, r2, ip, lsl #2
	add	r2, r2, r1
	mov	r1, #0
.L333:
	ldrh	r4, [r2], #2
	cmp	r1, r4
	movge	r4, r1
	cmp	r2, ip
	sxth	r1, r4
	bne	.L333
	uxth	r4, r4
.L332:
	ldrsh	r2, [r6, #76]	@ unaligned
	movw	r1, #1800
	ldrsh	r5, [r6, #74]	@ unaligned
	add	r5, r4, r5
	add	r4, r4, r2
	bl	wcd9xxx_resmgr_get_k_val
	mov	r10, r0
	ldr	r1, [r7, #96]
	sxth	r5, r5
	ldr	r0, [r7, #320]
	sxth	r4, r4
	bl	wcd9xxx_resmgr_get_k_val
	mov	r9, r0
	movw	r1, #1800
	ldr	r0, [r7, #320]
	bl	wcd9xxx_resmgr_get_k_val
	mov	r8, r0
	ldr	r1, [r7, #96]
	ldr	r0, [r7, #320]
	bl	wcd9xxx_resmgr_get_k_val
	str	r0, [sp, #4]
	ldr	r0, [r7, #96]
	cmp	r0, #0
	beq	.L349
	ldrh	r1, [r7, #78]
	ldrh	lr, [r7, #80]
	sub	r2, lr, r1
	smulbb	r2, r2, r5
	udiv	r2, r2, r0
	add	r2, r1, r2
	strh	r2, [r7, #108]	@ movhi
.L336:
	ldrh	ip, [r7, #72]
	ldrh	fp, [r7, #76]
	sub	r2, fp, ip
	smulbb	r2, r2, r4
	udiv	r2, r2, r0
	add	r2, ip, r2
	strh	r2, [r7, #112]	@ movhi
.L338:
	add	r10, r10, #4
	add	r9, r9, #4
	sub	r2, lr, r1
	mul	r5, r5, r10
	sdiv	r5, r5, r9
	smulbb	r2, r5, r2
	udiv	r2, r2, r0
	add	r2, r1, r2
	strh	r2, [r7, #110]	@ movhi
.L340:
	ldr	r3, [sp, #4]
	add	r8, r8, #4
	sub	r2, fp, ip
	ldrh	r9, [r7, #112]
	mov	r5, #32768
	mul	r4, r4, r8
	add	r3, r3, #4
	strh	r9, [r7, #116]	@ movhi
	sdiv	fp, r4, r3
	strh	r5, [r7, #120]	@ movhi
	smulbb	fp, fp, r2
	udiv	fp, fp, r0
	add	ip, ip, fp
	uxth	ip, ip
	strh	ip, [r7, #114]	@ movhi
	strh	ip, [r7, #118]	@ movhi
.L342:
	ldrsh	r2, [r6, #40]	@ unaligned
	sub	lr, lr, r1
	smulbb	lr, r2, lr
	udiv	r0, lr, r0
	add	r1, r1, r0
	uxth	r1, r1
.L343:
	strh	r1, [r7, #122]	@ movhi
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L348:
	ldrsh	r4, [r6, #48]	@ unaligned
	bl	wcd9xxx_resmgr_get_k_val
	add	r5, r0, #4
	ldr	r1, [r7, #96]
	ldr	r0, [r7, #320]
	bl	wcd9xxx_resmgr_get_k_val
	mul	r4, r4, r5
	add	r0, r0, #4
	ldr	r1, [r7, #96]
	sdiv	r4, r4, r0
	cmp	r1, #0
	sxth	r4, r4
	beq	.L350
	ldrh	r0, [r7, #78]
	ldrh	r2, [r7, #80]
	sub	r2, r2, r0
	smulbb	r2, r2, r4
	udiv	r2, r2, r1
	add	r2, r0, r2
	strh	r2, [r7, #102]	@ movhi
.L328:
	ldrh	r0, [r7, #72]
	ldrh	r2, [r7, #76]
	sub	r2, r2, r0
	smulbb	r4, r2, r4
	udiv	r4, r4, r1
	add	r0, r0, r4
	uxth	r0, r0
.L329:
	movw	r1, #1800
	strh	r0, [r7, #106]	@ movhi
	ldr	r0, [r7, #320]
	ldrsh	r4, [r7, #124]
	bl	wcd9xxx_resmgr_get_k_val
	add	r5, r0, #4
	ldr	r1, [r7, #96]
	ldr	r0, [r7, #320]
	bl	wcd9xxx_resmgr_get_k_val
	add	r2, r0, #4
	movw	r1, #1800
	ldr	r0, [r7, #320]
	mul	r2, r4, r2
	ldrsh	r4, [r7, #126]
	sdiv	r2, r2, r5
	strh	r2, [r7, #124]	@ movhi
	bl	wcd9xxx_resmgr_get_k_val
	add	r5, r0, #4
	ldr	r1, [r7, #96]
	ldr	r0, [r7, #320]
	bl	wcd9xxx_resmgr_get_k_val
	add	r0, r0, #4
	ldr	r2, [r7, #96]
	mul	r4, r4, r0
	cmp	r2, #0
	sdiv	r4, r4, r5
	strh	r4, [r7, #126]	@ movhi
	bne	.L351
	movw	r0, #:lower16:.LC10
	ldr	r1, .L355
	movt	r0, #:upper16:.LC10
	bl	printk
	movw	r2, #65514
	ldr	r0, [r7, #320]
	b	.L331
.L347:
	movw	r0, #:lower16:.LC10
	ldr	r1, .L355
	movt	r0, #:upper16:.LC10
	bl	printk
	ldr	ip, [r7, #96]
	mvn	r2, #21
	strh	r2, [r7, #100]	@ movhi
	cmp	ip, #0
	bne	.L323
	movw	r0, #:lower16:.LC10
	ldr	r1, .L355
	movt	r0, #:upper16:.LC10
	bl	printk
	movw	r2, #65514
	ldr	ip, [r7, #96]
	b	.L324
.L349:
	movw	r0, #:lower16:.LC10
	ldr	r1, .L355
	mvn	fp, #21
	movt	r0, #:upper16:.LC10
	bl	printk
	ldr	r0, [r7, #96]
	strh	fp, [r7, #108]	@ movhi
	cmp	r0, #0
	ldrhne	r1, [r7, #78]
	ldrhne	lr, [r7, #80]
	bne	.L336
	movw	r0, #:lower16:.LC10
	ldr	r1, .L355
	movt	r0, #:upper16:.LC10
	bl	printk
	ldr	r0, [r7, #96]
	strh	fp, [r7, #112]	@ movhi
	cmp	r0, #0
	bne	.L352
	movw	r0, #:lower16:.LC10
	ldr	r1, .L355
	movt	r0, #:upper16:.LC10
	bl	printk
	ldr	r0, [r7, #96]
	strh	fp, [r7, #110]	@ movhi
	cmp	r0, #0
	bne	.L353
	movw	r0, #:lower16:.LC10
	ldr	r1, .L355
	movt	r0, #:upper16:.LC10
	bl	printk
	ldr	r0, [r7, #96]
	mov	r1, #32768
	strh	fp, [r7, #114]	@ movhi
	ldrh	r2, [r7, #112]
	cmp	r0, #0
	strh	r2, [r7, #116]	@ movhi
	strh	fp, [r7, #118]	@ movhi
	strh	r1, [r7, #120]	@ movhi
	bne	.L354
	movw	r0, #:lower16:.LC10
	ldr	r1, .L355
	movt	r0, #:upper16:.LC10
	bl	printk
	movw	r1, #65514
	b	.L343
.L350:
	movw	r0, #:lower16:.LC10
	ldr	r1, .L355
	movt	r0, #:upper16:.LC10
	bl	printk
	ldr	r1, [r7, #96]
	mvn	r2, #21
	strh	r2, [r7, #102]	@ movhi
	cmp	r1, #0
	bne	.L328
	movw	r0, #:lower16:.LC10
	ldr	r1, .L355
	movt	r0, #:upper16:.LC10
	bl	printk
	movw	r0, #65514
	b	.L329
.L351:
	ldr	r0, [r7, #320]
	b	.L325
.L354:
	ldrh	r1, [r7, #78]
	ldrh	lr, [r7, #80]
	b	.L342
.L353:
	ldrh	r1, [r7, #78]
	ldrh	lr, [r7, #80]
	ldrh	ip, [r7, #72]
	ldrh	fp, [r7, #76]
	b	.L340
.L352:
	ldrh	r1, [r7, #78]
	ldrh	lr, [r7, #80]
	ldrh	ip, [r7, #72]
	ldrh	fp, [r7, #76]
	b	.L338
.L356:
	.align	2
.L355:
	.word	.LANCHOR0+68
	.fnend
	.size	wcd9xxx_mbhc_calc_thres, .-wcd9xxx_mbhc_calc_thres
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_hphl_ocp_irq, %function
wcd9xxx_hphl_ocp_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r0, #:lower16:.LC11
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r1
	movt	r0, #:upper16:.LC11
	ldr	r1, .L363
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	bl	printk
	cmp	r4, #0
	beq	.L358
	ldrh	r5, [r4, #164]
	cmp	r5, #0
	beq	.L362
	ldr	r2, [r4, #320]
	ldr	r3, [r4, #532]
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #24]
	bl	wcd9xxx_disable_irq
	ldr	r5, [r4, #160]
	mov	r1, #2
	ldr	r0, [r4, #320]
	orr	r5, r5, #64
	ubfx	r2, r5, #1, #1
	str	r5, [r4, #160]
	bl	wcd9xxx_resmgr_cond_update_cond
	and	r2, r5, #1
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_cond_update_cond
	mov	r1, r5
	add	r0, r4, #348
	movw	r2, #967
	bl	snd_soc_jack_report_no_dapm
.L360:
	ldrd	r4, [sp]
	mov	r0, #1
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L358:
	movw	r0, #:lower16:.LC12
	ldr	r1, .L363
	movt	r0, #:upper16:.LC12
	bl	printk
	b	.L360
.L362:
	movw	r0, #:lower16:.LC9
	ldr	r1, .L363
	movt	r0, #:upper16:.LC9
	ldr	r6, [r4, #324]
	bl	printk
	ldrb	ip, [r4, #164]	@ zero_extendqisi2
	mov	r3, r5
	mov	r2, #16
	movw	r1, #426
	mov	r0, r6
	add	ip, ip, #1
	strb	ip, [r4, #164]
	bl	snd_soc_update_bits
	mov	r3, #16
	mov	r0, r6
	mov	r2, r3
	movw	r1, #426
	bl	snd_soc_update_bits
	b	.L360
.L364:
	.align	2
.L363:
	.word	.LANCHOR0+92
	.fnend
	.size	wcd9xxx_hphl_ocp_irq, .-wcd9xxx_hphl_ocp_irq
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__hphocp_off_report, %function
__hphocp_off_report:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #160]
	tst	r3, r1
	bxeq	lr
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	bic	r5, r3, r1
	mov	r4, r0
	strd	r6, [sp, #8]
	mov	r1, #2
	mov	r6, r2
	str	r8, [sp, #16]
	ubfx	r2, r5, #1, #1
	str	lr, [sp, #20]
	str	r5, [r0, #160]
	ldr	r7, [r4, #324]
	ldr	r0, [r0, #320]
	bl	wcd9xxx_resmgr_cond_update_cond
	and	r2, r5, #1
	ldr	r0, [r4, #320]
	mov	r1, #1
	bl	wcd9xxx_resmgr_cond_update_cond
	mov	r1, r5
	add	r0, r4, #348
	movw	r2, #967
	bl	snd_soc_jack_report_no_dapm
	mov	r0, r7
	mov	r3, #0
	mov	r2, #16
	movw	r1, #426
	bl	snd_soc_update_bits
	mov	r3, #16
	mov	r0, r7
	mov	r2, r3
	movw	r1, #426
	bl	snd_soc_update_bits
	ldr	r3, [r4, #532]
	mov	r1, r6
	ldr	r3, [r3, #24]
	cmp	r3, #0
	movne	r3, #0
	strbeq	r3, [r4, #165]
	strbne	r3, [r4, #164]
	ldr	r3, [r4, #320]
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	ldr	r0, [r3, #4]
	b	wcd9xxx_enable_irq
	.fnend
	.size	__hphocp_off_report, .-__hphocp_off_report
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_release_handler, %function
wcd9xxx_release_handler:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r1
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	.pad #4
	sub	sp, sp, #4
	ldr	r0, [r1, #320]
	bl	wcd9xxx_resmgr_bcl_lock
	ldr	r2, [r4, #56]
	mov	r3, #0
	mov	r1, #2
	movt	r3, 2040
	str	r1, [r4, #60]
	and	r3, r3, r2
	cmp	r3, #0
	bne	.L373
	mov	r0, r4
	bl	wcd9xxx_calibrate_hs_polling
.L374:
	mov	r0, #50
	bl	msleep
.L384:
	mov	r0, r4
	bl	wcd9xxx_start_hs_polling
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_bcl_unlock
	mov	r0, #1
	add	sp, sp, #4
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L373:
	add	r0, r4, #4
	bl	cancel_delayed_work_sync
	subs	r5, r0, #0
	bne	.L396
	mov	r1, r5
	add	r0, r4, #420
	ldr	r2, [r4, #56]
	bl	snd_soc_jack_report_no_dapm
.L386:
	ldr	r3, [r4, #56]
	mov	r0, r4
	bic	r3, r3, #133169152
	bic	r3, r3, #524288
	str	r3, [r4, #56]
	bl	wcd9xxx_calibrate_hs_polling
	b	.L374
.L396:
	ldr	r3, [r4, #320]
	ldr	r0, [r3, #4]
	bl	wcd9xxx_unlock_sleep
	ldr	r2, [r4, #96]
	movw	r3, #1800
	cmp	r2, r3
	beq	.L376
	ldrb	r3, [r4, #156]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L397
	ldrsh	fp, [r4, #102]
	ldrsh	r10, [r4, #106]
	ldrsh	r9, [r4, #110]
.L390:
	add	r5, r4, r5, lsl #1
	movw	r6, #:lower16:jiffies
	movt	r6, #:upper16:jiffies
	mov	r0, #25
	ldrsh	r8, [r5, #112]
	bl	msecs_to_jiffies
	ldr	r7, [r6]
	ldr	r3, [r6]
	add	r7, r0, r7
	sub	r3, r3, r7
	cmp	r3, #0
	bge	.L379
	mov	r5, #0
	b	.L382
.L398:
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ubfx	r1, r0, #2, #1
	mov	r2, #1
	mov	r0, r4
	bl	__wcd9xxx_codec_sta_dce.constprop.23
	cmp	r0, fp
	movle	r3, #0
	movgt	r3, #1
	cmp	r0, r9
	movge	r0, r3
	orrlt	r0, r3, #1
	cmp	r0, #0
	bne	.L386
.L383:
	ldr	r3, [r6]
	sub	r3, r3, r7
	cmp	r3, #0
	bge	.L379
.L382:
	movw	r1, #1100
	mov	r0, #1000
	bl	usleep_range
	cmp	r5, #0
	movw	r1, #974
	add	r5, r5, #1
	beq	.L398
	movw	r1, #974
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ubfx	r1, r0, #2, #1
	mov	r2, #1
	mov	r0, r4
	bl	__wcd9xxx_codec_sta_dce.constprop.22
	cmp	r0, r10
	cmple	r8, r0
	ble	.L383
	b	.L386
.L379:
	ldrb	r5, [r4, #318]	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L386
	movw	r0, #:lower16:.LC13
	ldr	r1, .L399
	add	r6, r4, #420
	movt	r0, #:upper16:.LC13
	bl	printk
	ldr	r3, [r4, #56]
	mov	r1, r6
	mov	r0, r4
	mov	r2, r3
	bl	wcd9xxx_jack_report
	movw	r0, #:lower16:.LC14
	ldr	r1, .L399
	movt	r0, #:upper16:.LC14
	bl	printk
	mov	r0, r4
	ldr	r3, [r4, #56]
	mov	r1, r6
	mov	r2, r5
	bl	wcd9xxx_jack_report
	ldr	r3, [r4, #56]
	mov	r0, r4
	bic	r3, r3, #133169152
	bic	r3, r3, #524288
	str	r3, [r4, #56]
	bl	wcd9xxx_calibrate_hs_polling
	b	.L384
.L376:
	ldrsh	fp, [r4, #100]
	mov	r5, #0
	ldrsh	r10, [r4, #104]
	ldrsh	r9, [r4, #108]
	b	.L390
.L397:
	mov	r5, r3
	ldrsh	fp, [r4, #100]
	ldrsh	r10, [r4, #104]
	ldrsh	r9, [r4, #108]
	b	.L390
.L400:
	.align	2
.L399:
	.word	.LANCHOR0+116
	.fnend
	.size	wcd9xxx_release_handler, .-wcd9xxx_release_handler
	.align	2
	.global	codec_mbhc_debug_read
	.syntax unified
	.arm
	.fpu softvfp
	.type	codec_mbhc_debug_read, %function
codec_mbhc_debug_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	movw	r9, #:lower16:__stack_chk_guard
	strd	r10, [sp, #24]
	.setfp fp, sp, #32
	add	fp, sp, #32
	movt	r9, #:upper16:__stack_chk_guard
	str	lr, [sp, #32]
	.pad #44
	sub	sp, sp, #44
	ldr	r5, [r0, #124]
	str	r3, [fp, #-68]
	movw	r0, #1800
	ldr	ip, [r9]
	sub	sp, sp, #768
	str	r2, [fp, #-64]
	add	r6, sp, #8
	str	r1, [fp, #-60]
	ldr	r3, [r5, #96]
	str	ip, [fp, #-40]
	cmp	r3, r0
	beq	.L402
	ldrb	r1, [r5, #156]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L403
	ldrsh	r8, [r5, #100]
.L416:
	ldrsh	r3, [r5, #108]
	ldrsh	r7, [r5, #104]
	str	r3, [fp, #-56]
	ldrsh	r3, [r5, #112]
	str	r3, [fp, #-52]
.L411:
	add	r1, r5, r1, lsl #1
	mov	r10, #0
	ldrh	r3, [r5, #72]
	movw	r2, #:lower16:.LC15
	ldrsh	r1, [r1, #116]
	movt	r2, #:upper16:.LC15
	str	r10, [sp]
	mov	r0, r6
	str	r1, [fp, #-48]
	mov	r1, #768
	bl	scnprintf
	ldrh	r3, [r5, #76]
	mov	r4, r0
	rsb	r1, r0, #768
	ldrsh	r0, [r5, #72]
	movw	r2, #:lower16:.LC16
	ldr	ip, [r5, #96]
	movt	r2, #:upper16:.LC16
	sxth	lr, r3
	sub	lr, lr, r0
	add	r0, r6, r4
	mul	ip, ip, lr
	sdiv	ip, ip, lr
	str	ip, [sp]
	bl	scnprintf
	add	r4, r4, r0
	movw	r2, #:lower16:.LC17
	ldrh	r3, [r5, #74]
	rsb	r1, r4, #768
	add	r0, r6, r4
	str	r10, [sp]
	movt	r2, #:upper16:.LC17
	bl	scnprintf
	add	r4, r4, r0
	movw	r2, #:lower16:.LC18
	ldrh	r3, [r5, #78]
	rsb	r1, r4, #768
	add	r0, r6, r4
	str	r10, [sp]
	movt	r2, #:upper16:.LC18
	bl	scnprintf
	ldrh	r3, [r5, #80]
	add	r4, r4, r0
	movw	r2, #:lower16:.LC19
	ldrsh	ip, [r5, #78]
	rsb	r1, r4, #768
	movt	r2, #:upper16:.LC19
	ldr	r10, [r5, #96]
	add	r0, r6, r4
	sxth	lr, r3
	sub	ip, lr, ip
	mul	r10, r10, ip
	sdiv	ip, r10, ip
	str	ip, [sp]
	bl	scnprintf
	add	r4, r4, r0
	movw	r2, #:lower16:.LC20
	ldr	r3, [r5, #88]
	rsb	r1, r4, #768
	add	r0, r6, r4
	movt	r2, #:upper16:.LC20
	bl	scnprintf
	add	r4, r4, r0
	movw	r2, #:lower16:.LC21
	ldr	r3, [r5, #92]
	rsb	r1, r4, #768
	add	r0, r6, r4
	movt	r2, #:upper16:.LC21
	bl	scnprintf
	add	r4, r4, r0
	movw	r2, #:lower16:.LC22
	ldr	r3, [r5, #96]
	rsb	r1, r4, #768
	add	r0, r6, r4
	movt	r2, #:upper16:.LC22
	bl	scnprintf
	ldrsh	lr, [r5, #78]
	mov	r3, r8
	add	r4, r4, r0
	ldr	r10, [r5, #96]
	movw	r2, #:lower16:.LC23
	rsb	r1, r4, #768
	ldrsh	ip, [r5, #80]
	movt	r2, #:upper16:.LC23
	add	r0, r6, r4
	sub	r8, r8, lr
	mul	r8, r10, r8
	sub	ip, ip, lr
	sdiv	r8, r8, ip
	str	r8, [sp]
	bl	scnprintf
	ldrsh	lr, [r5, #72]
	mov	r3, r7
	add	r4, r4, r0
	ldr	r8, [r5, #96]
	movw	r2, #:lower16:.LC24
	rsb	r1, r4, #768
	ldrsh	ip, [r5, #76]
	movt	r2, #:upper16:.LC24
	add	r0, r6, r4
	sub	r7, r7, lr
	mul	r7, r8, r7
	sub	ip, ip, lr
	sdiv	r7, r7, ip
	str	r7, [sp]
	bl	scnprintf
	ldrsh	lr, [r5, #78]
	add	r4, r4, r0
	movw	r2, #:lower16:.LC25
	ldr	r10, [fp, #-56]
	rsb	r1, r4, #768
	add	r0, r6, r4
	ldr	r8, [r5, #96]
	movt	r2, #:upper16:.LC25
	ldrsh	ip, [r5, #80]
	sub	r7, r10, lr
	mov	r3, r10
	mul	r7, r8, r7
	sub	ip, ip, lr
	sdiv	r7, r7, ip
	str	r7, [sp]
	bl	scnprintf
	ldrsh	lr, [r5, #72]
	add	r4, r4, r0
	movw	r2, #:lower16:.LC26
	ldr	r10, [fp, #-52]
	rsb	r1, r4, #768
	add	r0, r6, r4
	ldr	r8, [r5, #96]
	movt	r2, #:upper16:.LC26
	ldrsh	ip, [r5, #76]
	sub	r7, r10, lr
	mov	r3, r10
	mul	r7, r8, r7
	sub	ip, ip, lr
	sdiv	r7, r7, ip
	str	r7, [sp]
	bl	scnprintf
	ldrsh	lr, [r5, #72]
	add	r4, r4, r0
	movw	r2, #:lower16:.LC27
	ldr	r7, [fp, #-48]
	rsb	r1, r4, #768
	add	r0, r6, r4
	ldr	r8, [r5, #96]
	movt	r2, #:upper16:.LC27
	ldrsh	ip, [r5, #76]
	mov	r3, r7
	sub	r7, r7, lr
	mul	r7, r8, r7
	sub	ip, ip, lr
	sdiv	r7, r7, ip
	str	r7, [sp]
	bl	scnprintf
	ldrh	r3, [r5, #120]
	add	r4, r4, r0
	movw	r2, #:lower16:.LC28
	ldrsh	r7, [r5, #78]
	rsb	r1, r4, #768
	add	r0, r6, r4
	ldr	r8, [r5, #96]
	movt	r2, #:upper16:.LC28
	ldrsh	ip, [r5, #80]
	sxth	lr, r3
	sub	lr, lr, r7
	sub	ip, ip, r7
	mul	lr, r8, lr
	sdiv	ip, lr, ip
	str	ip, [sp]
	bl	scnprintf
	ldrh	r3, [r5, #122]
	add	r4, r4, r0
	movw	r2, #:lower16:.LC29
	ldrsh	r7, [r5, #78]
	rsb	r1, r4, #768
	add	r0, r6, r4
	ldr	r8, [r5, #96]
	movt	r2, #:upper16:.LC29
	ldrsh	ip, [r5, #80]
	sxth	lr, r3
	sub	lr, lr, r7
	sub	ip, ip, r7
	mul	lr, r8, lr
	sdiv	ip, lr, ip
	str	ip, [sp]
	bl	scnprintf
	add	r4, r4, r0
	movw	r2, #:lower16:.LC30
	ldrsh	r3, [r5, #124]
	rsb	r1, r4, #768
	add	r0, r6, r4
	movt	r2, #:upper16:.LC30
	bl	scnprintf
	add	r4, r4, r0
	movw	r2, #:lower16:.LC31
	ldrsh	r3, [r5, #126]
	rsb	r1, r4, #768
	add	r0, r6, r4
	movt	r2, #:upper16:.LC31
	bl	scnprintf
	ldr	r3, [r5, #64]
	add	r4, r4, r0
	add	r7, r6, r4
	rsb	r8, r4, #768
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L417
	ldrb	r10, [r3, #36]	@ zero_extendqisi2
	cmp	r10, #0
	bne	.L418
	movw	r2, #:lower16:.LC32
	movw	r0, #:lower16:.LC6
	movt	r2, #:upper16:.LC32
	movt	r0, #:upper16:.LC6
	movw	r1, #1954
	bl	warn_slowpath_fmt
	mov	r3, r10
.L406:
	movw	r2, #:lower16:.LC33
	mov	r1, r8
	movt	r2, #:upper16:.LC33
	mov	r0, r7
	bl	scnprintf
	add	r4, r4, r0
	mov	r3, #0
	ldr	r2, [fp, #-68]
	ldr	r1, [fp, #-64]
	strb	r3, [r6, r4]
	ldr	r0, [fp, #-60]
	mov	r3, r6
	str	r4, [sp]
	bl	simple_read_from_buffer
	ldr	r2, [fp, #-40]
	ldr	r3, [r9]
	cmp	r2, r3
	bne	.L419
	sub	sp, fp, #32
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L403:
	ldrsh	r3, [r5, #110]
	mov	r1, #1
	ldrsh	r8, [r5, #102]
	ldrsh	r7, [r5, #106]
	str	r3, [fp, #-56]
	ldrsh	r3, [r5, #114]
	str	r3, [fp, #-52]
	b	.L411
.L402:
	ldrsh	r8, [r5, #100]
	mov	r1, #0
	b	.L416
.L418:
	movw	r1, #331
	ldr	r0, [r5, #324]
	bl	snd_soc_read
	eor	r0, r0, #4
	ubfx	r3, r0, #2, #1
	b	.L406
.L417:
	bl	gpio_get_value_cansleep
	ldr	r3, [r5, #64]
	ldr	r3, [r3, #32]
	sub	r3, r3, r0
	clz	r3, r3
	lsr	r3, r3, #5
	b	.L406
.L419:
	bl	__stack_chk_fail
	.fnend
	.size	codec_mbhc_debug_read, .-codec_mbhc_debug_read
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_cleanup_hs_polling, %function
wcd9xxx_cleanup_hs_polling:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r0, [r0, #320]
	ldr	r5, [r0, #112]
	cmp	r5, #1
	beq	.L440
.L421:
	ldr	r3, [r4, #64]
	add	r0, r0, #136
	ldr	r5, [r4, #324]
	ldr	r6, [r3, #4]
	bl	mutex_lock
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_clk_block
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_unlock
	mov	r3, #2
	mov	r1, #988
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r0, r5
	mov	r2, #6
	movw	r1, #974
	bl	snd_soc_update_bits
	ldrb	r3, [r4, #504]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L422
	ldrb	r3, [r4, #156]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L422
	ldr	r1, [r4, #96]
	movw	r3, #1800
	ldr	r7, [r4, #324]
	cmp	r1, r3
	bne	.L441
.L424:
	mov	r3, #0
	mov	r2, #128
	ldrh	r1, [r4, #136]
	mov	r0, r7
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r0, r7
	ldrh	r1, [r4, #136]
	mov	r2, #16
	bl	snd_soc_update_bits
	mov	r3, #0
	strb	r3, [r4, #156]
.L422:
	ldrb	r1, [r6, #2]	@ zero_extendqisi2
	mov	r0, r1
	bl	usleep_range
	mov	r3, #8
	mov	r2, #10
	mov	r1, #988
	mov	r0, r5
	bl	snd_soc_update_bits
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_lock
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_put_clk_block
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_unlock
	mov	r0, r5
	mov	r2, #0
	movw	r1, #334
	bl	snd_soc_write
	ldr	r3, [r4, #68]
	cmp	r3, #0
	beq	.L426
	ldr	r3, [r3, #40]
	cmp	r3, #0
	beq	.L426
	mov	r2, #1
	mov	r1, #0
	ldr	r0, [r4, #324]
	blx	r3
.L426:
	mov	r2, #0
	mvn	r3, #0
	strb	r2, [r4]
	str	r3, [r4, #60]
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L441:
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_k_val
	lsl	r3, r0, #2
	mov	r2, #252
	ldrh	r1, [r4, #132]
	mov	r0, r7
	bl	snd_soc_update_bits
	movw	r1, #10000
	mov	r0, r1
	bl	usleep_range
	ldrb	r2, [r4, #100]	@ zero_extendqisi2
	mov	r1, #976
	mov	r0, r7
	bl	snd_soc_write
	ldrh	r2, [r4, #100]
	movw	r1, #977
	mov	r0, r7
	lsr	r2, r2, #8
	bl	snd_soc_write
	ldr	r3, [r4, #60]
	cmp	r3, #1
	beq	.L424
	ldrb	r2, [r4, #108]	@ zero_extendqisi2
	movw	r1, #978
	mov	r0, r7
	bl	snd_soc_write
	ldrh	r2, [r4, #108]
	movw	r1, #979
	mov	r0, r7
	lsr	r2, r2, #8
	bl	snd_soc_write
	ldrb	r2, [r4, #112]	@ zero_extendqisi2
	mov	r1, #980
	mov	r0, r7
	bl	snd_soc_write
	ldrh	r2, [r4, #112]
	movw	r1, #981
	mov	r0, r7
	lsr	r2, r2, #8
	bl	snd_soc_write
	ldrb	r2, [r4, #116]	@ zero_extendqisi2
	mov	r1, #984
	mov	r0, r7
	bl	snd_soc_write
	ldrh	r2, [r4, #116]
	movw	r1, #985
	mov	r0, r7
	lsr	r2, r2, #8
	bl	snd_soc_write
	b	.L424
.L440:
	movw	r6, #:lower16:.LANCHOR1
	movt	r6, #:upper16:.LANCHOR1
	ldrb	r3, [r6, #2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L421
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L442
	movt	r0, #:upper16:.LC6
	movt	r2, #:upper16:.LC7
	movw	r1, #1325
	bl	warn_slowpath_fmt
	ldr	r0, [r4, #320]
	strb	r5, [r6, #2]
	b	.L421
.L443:
	.align	2
.L442:
	.word	.LANCHOR0+140
	.fnend
	.size	wcd9xxx_cleanup_hs_polling, .-wcd9xxx_cleanup_hs_polling
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_recalibrate, %function
wcd9xxx_recalibrate:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	ip, #0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #64]
	.pad #36
	sub	sp, sp, #36
	ldr	r7, [r0, #324]
	strh	ip, [sp, #30]	@ movhi
	ldrb	ip, [r3, #53]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L468
.L444:
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L468:
	ldr	r6, [r3, #4]
	mov	r4, r0
	mov	r5, r1
	mov	r0, r7
	movw	r1, #974
	str	r2, [sp, #12]
	bl	snd_soc_read
	str	r0, [sp, #20]
	mov	r2, #120
	movw	r1, #974
	ldrb	r3, [r6, #62]	@ zero_extendqisi2
	mov	r0, r7
	lsl	r3, r3, #3
	bl	snd_soc_update_bits
	ldr	r3, [r4, #320]
	mov	r9, r0
	ldr	r6, [r4, #324]
	ldr	r8, [r3, #112]
	cmp	r8, #1
	beq	.L469
.L447:
	ldrh	r1, [r5, #8]
	mov	r0, r6
	bl	snd_soc_read
	sxth	r10, r0
	mov	r3, #1
	ldrh	r1, [r5, #8]
	mov	r2, #129
	mov	r0, r6
	bl	snd_soc_update_bits
	ldrh	r1, [r5, #4]
	mov	r0, r6
	bl	snd_soc_read
	sxth	fp, r0
	mov	r3, #0
	ldrh	r1, [r5, #4]
	mov	r2, #128
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r2, #16
	mov	r3, #1
	mov	r1, #336
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r3, r0
	mov	r1, #2000
	mov	r0, #1000
	str	r3, [sp, #16]
	bl	usleep_range
	movw	r1, #974
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ubfx	r1, r0, #2, #1
	mov	r2, #1
	mov	r0, r4
	bl	__wcd9xxx_codec_sta_dce.constprop.23
	mov	r8, r0
	movw	r1, #974
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ubfx	r1, r0, #2, #1
	mov	r2, #1
	mov	r0, r4
	bl	__wcd9xxx_codec_sta_dce.constprop.22
	ldr	r3, [sp, #16]
	strh	r0, [sp, #30]	@ movhi
	cmp	r3, #0
	beq	.L448
	mov	r3, #16
	mov	r1, #336
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
.L448:
	mov	r2, fp
	ldrh	r1, [r5, #4]
	mov	r0, r6
	bl	snd_soc_write
	mov	r2, r10
	mov	r0, r6
	ldrh	r1, [r5, #8]
	bl	snd_soc_write
	cmp	r9, #0
	bne	.L470
.L449:
	ldrsh	r2, [sp, #30]
	cmp	r8, #0
	cmpne	r2, #0
	beq	.L450
	mov	r0, r4
	strh	r2, [r4, #72]	@ movhi
	strh	r8, [r4, #78]	@ movhi
	bl	wcd9xxx_mbhc_calc_thres
	mov	r0, r4
	bl	wcd9xxx_calibrate_hs_polling
.L451:
	ldr	r3, [sp, #12]
	cmp	r3, #0
	beq	.L444
	movw	r1, #974
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	mov	r6, r0
	mov	r3, #72
	ldr	r0, [r4, #324]
	mov	r2, #120
	movw	r1, #974
	bl	snd_soc_update_bits
	mov	r0, #1
	mov	r3, r5
	mov	r2, #0
	add	r1, sp, #30
	str	r0, [sp]
	mov	r0, r4
	bl	wcd9xxx_get_z
	sxth	r2, r6
	movw	r1, #974
	ldr	r0, [r4, #324]
	bl	snd_soc_write
	ldrsh	r3, [sp, #30]
	cmp	r3, #0
	beq	.L444
	ldr	r2, [r4, #96]
	uxth	r3, r3
	strh	r3, [r4, #74]	@ movhi
	cmp	r2, #0
	beq	.L471
	ldrh	r2, [r4, #76]
	movw	r0, #650
	movw	r1, #46021
	movt	r1, 37282
	sub	r2, r2, r3
	smulbb	r2, r2, r0
	umull	r1, r2, r1, r2
	add	r3, r3, r2, lsr #10
	uxth	r3, r3
.L454:
	strh	r3, [r4, #128]	@ movhi
	b	.L444
.L470:
	ldrsh	r2, [sp, #20]
	mov	r0, r7
	movw	r1, #974
	bl	snd_soc_write
	b	.L449
.L471:
	movw	r0, #:lower16:.LC10
	ldr	r1, .L472
	movt	r0, #:upper16:.LC10
	bl	printk
	movw	r3, #65514
	b	.L454
.L469:
	movw	r10, #:lower16:.LANCHOR1
	movt	r10, #:upper16:.LANCHOR1
	ldrb	r3, [r10, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L447
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L472+4
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #3439
	bl	warn_slowpath_fmt
	strb	r8, [r10, #1]
	b	.L447
.L450:
	movw	r0, #:lower16:.LC34
	mov	r3, r8
	ldr	r1, .L472+8
	movt	r0, #:upper16:.LC34
	bl	printk
	b	.L451
.L473:
	.align	2
.L472:
	.word	.LANCHOR0+68
	.word	.LANCHOR0+28
	.word	.LANCHOR0+168
	.fnend
	.size	wcd9xxx_recalibrate, .-wcd9xxx_recalibrate
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_event_notify, %function
wcd9xxx_event_notify:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r0, r1
	mov	r5, r1
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r4, [r2, #68]
	add	r6, r4, #544
	ldr	r7, [r4, #324]
	bl	wcd9xxx_get_event_string
	mov	r0, r6
	bl	mutex_lock
	sub	r3, r5, #1
	cmp	r3, #48
	ldrls	pc, [pc, r3, asl #2]
	b	.L475
.L477:
	.word	.L631
	.word	.L478
	.word	.L479
	.word	.L631
	.word	.L631
	.word	.L480
	.word	.L479
	.word	.L631
	.word	.L631
	.word	.L631
	.word	.L631
	.word	.L631
	.word	.L631
	.word	.L631
	.word	.L475
	.word	.L482
	.word	.L475
	.word	.L482
	.word	.L475
	.word	.L482
	.word	.L475
	.word	.L482
	.word	.L483
	.word	.L484
	.word	.L483
	.word	.L484
	.word	.L483
	.word	.L484
	.word	.L483
	.word	.L484
	.word	.L475
	.word	.L485
	.word	.L475
	.word	.L485
	.word	.L475
	.word	.L485
	.word	.L486
	.word	.L475
	.word	.L486
	.word	.L475
	.word	.L486
	.word	.L475
	.word	.L487
	.word	.L488
	.word	.L489
	.word	.L490
	.word	.L491
	.word	.L492
	.word	.L493
.L489:
	add	r1, r4, #336
	mov	r0, #1
	bl	_set_bit
.L631:
	mov	r5, #0
.L476:
	mov	r0, r6
	bl	mutex_unlock
	ldrd	r6, [sp, #8]
	mov	r0, r5
	ldrd	r4, [sp]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L479:
	mov	r1, #960
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	tst	r0, #1
	beq	.L631
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L631
	mov	r3, #8
	mov	r1, #988
	ldr	r0, [r4, #324]
	mov	r2, r3
	mov	r5, #0
	bl	snd_soc_update_bits
	b	.L476
.L491:
	movw	r3, #:lower16:jiffies
	mov	r5, #0
	movt	r3, #:upper16:jiffies
	ldr	r3, [r3]
	str	r3, [r4, #340]
	b	.L476
.L480:
	mov	r3, #16
	mov	r1, #332
	mov	r2, r3
	mov	r0, r7
	bl	snd_soc_update_bits
	ldr	r3, [r4, #64]
	mov	r0, r4
	ldr	r1, [r3, #20]
.L637:
	bl	wcd9xxx_update_mbhc_clk_rate
	mov	r1, #960
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	tst	r0, #1
	beq	.L631
	mov	r0, r4
	mov	r5, #0
	bl	wcd9xxx_calibrate_hs_polling
	mov	r0, r4
	bl	wcd9xxx_start_hs_polling
	b	.L476
.L493:
	add	r1, r4, #336
	mov	r0, #2
	bl	_clear_bit
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L631
	ldrb	r3, [r4, #156]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L631
	ldr	r5, [r4, #336]
	ands	r5, r5, #3
	bne	.L631
.L633:
	mov	r3, #1
	mov	r0, r4
	mov	r2, r3
	mov	r1, r5
	bl	__wcd9xxx_switch_micbias
	b	.L476
.L490:
	add	r1, r4, #336
	mov	r0, #1
	add	r5, r4, #332
	bl	_clear_bit
	mov	r1, r5
	mov	r0, #1
	bl	_clear_bit
	mov	r1, r5
	mov	r0, #3
	bl	_clear_bit
	ldr	r3, [r4, #160]
	tst	r3, #128
	bne	.L642
.L518:
	ldr	r5, [r4, #336]
	ands	r5, r5, #7
	bne	.L631
	b	.L633
.L482:
	ldr	r3, [r4, #64]
	cmp	r3, #0
	beq	.L508
	sub	r5, r5, #17
	ldr	r3, [r3, #8]
	cmp	r5, #5
	ldrls	pc, [pc, r5, asl #2]
	b	.L509
.L511:
	.word	.L548
	.word	.L548
	.word	.L512
	.word	.L512
	.word	.L513
	.word	.L513
.L483:
	ldr	r3, [r4, #64]
	cmp	r3, #0
	beq	.L631
	sub	r5, r5, #25
	ldr	r3, [r3, #8]
	cmp	r5, #4
	ldrls	pc, [pc, r5, asl #2]
	b	.L495
.L497:
	.word	.L546
	.word	.L546
	.word	.L498
	.word	.L498
	.word	.L499
.L484:
	ldr	r3, [r4, #64]
	cmp	r3, #0
	beq	.L631
	sub	r5, r5, #25
	ldr	r3, [r3, #8]
	cmp	r5, #5
	ldrls	pc, [pc, r5, asl #2]
	b	.L502
.L504:
	.word	.L547
	.word	.L547
	.word	.L505
	.word	.L505
	.word	.L506
	.word	.L506
.L485:
	ldr	r0, [r4, #64]
	mov	r3, #1
	sub	r5, r5, #31
	lsl	r5, r3, r5
	ldr	r1, [r4, #320]
	and	r2, r5, #195
	ldr	r3, [r0, #8]
	ldr	r1, [r1, #44]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L528
.L530:
	.word	.L529
	.word	.L531
	.word	.L532
	.word	.L533
.L486:
	ldr	r0, [r4, #64]
	mov	r3, #1
	sub	r5, r5, #31
	lsl	r5, r3, r5
	ldr	r1, [r4, #320]
	and	r2, r5, #195
	ldr	r3, [r0, #8]
	ldr	r1, [r1, #44]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L519
.L521:
	.word	.L520
	.word	.L522
	.word	.L523
	.word	.L524
.L487:
	add	r1, r4, #336
	mov	r0, #0
	bl	_set_bit
	mov	r0, r7
	ldrh	r1, [r4, #140]
	bl	snd_soc_read
	ands	r5, r0, #128
	bne	.L631
	b	.L632
.L488:
	add	r1, r4, #336
	mov	r0, #0
	add	r5, r4, #332
	bl	_clear_bit
	mov	r1, r5
	mov	r0, #0
	bl	_clear_bit
	mov	r1, r5
	mov	r0, #2
	bl	_clear_bit
	ldr	r3, [r4, #160]
	tst	r3, #64
	beq	.L518
	ldr	r3, [r4, #532]
	mov	r1, #64
	mov	r0, r4
	ldr	r2, [r3, #24]
	bl	__hphocp_off_report
	b	.L518
.L492:
	add	r1, r4, #336
	mov	r0, #2
	bl	_set_bit
	mov	r0, r7
	ldrh	r1, [r4, #140]
	bl	snd_soc_read
	tst	r0, #128
	bne	.L631
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L631
	ldrb	r5, [r4, #156]	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L631
.L632:
	mov	r3, #1
	mov	r0, r4
	mov	r2, r3
	mov	r1, r3
	bl	__wcd9xxx_switch_micbias
	b	.L476
.L478:
	mov	r1, #332
	mov	r0, r7
	mov	r3, #0
	mov	r2, #16
	bl	snd_soc_update_bits
	mov	r0, r4
	ldr	r1, [r4, #524]
	b	.L637
.L475:
	movw	r2, #:lower16:.LC35
	movw	r0, #:lower16:.LC6
	mov	r3, r5
	movt	r2, #:upper16:.LC35
	movt	r0, #:upper16:.LC6
	movw	r1, #4802
	bl	warn_slowpath_fmt
	mvn	r5, #21
	b	.L476
.L644:
	ldr	r3, [r4, #68]
	ldr	r0, [r4, #324]
	cmp	r3, #0
	beq	.L516
	ldr	r3, [r3, #36]
	cmp	r3, #0
	beq	.L516
	blx	r3
.L508:
	ldrb	r3, [r4, #504]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L631
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L631
.L541:
	ldrh	r1, [r4, #140]
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ands	r5, r0, #128
	bne	.L631
	mov	r3, #128
	ldrh	r1, [r4, #140]
	mov	r0, r7
	mov	r2, r3
	bl	snd_soc_update_bits
	b	.L476
.L642:
	ldr	r3, [r4, #532]
	mov	r1, #128
	mov	r0, r4
	ldr	r2, [r3, #28]
	bl	__hphocp_off_report
	b	.L518
.L524:
	ldrb	r3, [r1, #19]	@ zero_extendqisi2
.L525:
	cmp	r2, #0
	bne	.L549
	tst	r5, #3120
	movne	r2, #2
	bne	.L537
	tst	r5, #780
	beq	.L631
	mov	r2, #1
.L537:
	cmp	r2, r3
	bne	.L631
.L544:
	mov	r0, r4
	mov	r1, #0
	bl	wcd9xxx_codec_switch_cfilt_mode
	mov	r5, #0
	b	.L476
.L523:
	ldrb	r3, [r1, #18]	@ zero_extendqisi2
	b	.L525
.L522:
	ldrb	r3, [r1, #17]	@ zero_extendqisi2
	b	.L525
.L520:
	ldrb	r3, [r1, #16]	@ zero_extendqisi2
	b	.L525
.L533:
	ldrb	r3, [r1, #19]	@ zero_extendqisi2
.L534:
	cmp	r2, #0
	bne	.L550
	tst	r5, #3120
	movne	r2, #2
	bne	.L539
	tst	r5, #780
	beq	.L631
	mov	r2, #1
.L539:
	cmp	r2, r3
	bne	.L631
	mov	r0, r4
	mov	r1, #1
	bl	wcd9xxx_codec_switch_cfilt_mode
	mov	r5, #0
	b	.L476
.L532:
	ldrb	r3, [r1, #18]	@ zero_extendqisi2
	b	.L534
.L531:
	ldrb	r3, [r1, #17]	@ zero_extendqisi2
	b	.L534
.L529:
	ldrb	r3, [r1, #16]	@ zero_extendqisi2
	b	.L534
.L546:
	mov	r2, #1
.L496:
	cmp	r3, r2
	bne	.L631
	mov	r3, #1
	mov	r1, #0
	mov	r2, r3
	mov	r0, r4
	bl	__wcd9xxx_switch_micbias
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L631
	ldr	r3, [r4, #68]
	ldr	r0, [r4, #324]
	cmp	r3, #0
	beq	.L501
	ldr	r3, [r3, #36]
	cmp	r3, #0
	beq	.L501
	mov	r1, #1
	mov	r5, #0
	blx	r3
	b	.L476
.L547:
	mov	r2, #1
.L503:
	cmp	r3, r2
	bne	.L631
	mov	r1, #960
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	tst	r0, #1
	beq	.L631
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L507
	mov	r3, #8
	mov	r1, #988
	ldr	r0, [r4, #324]
	mov	r2, r3
	bl	snd_soc_update_bits
.L507:
	mov	r0, r4
	mov	r5, #0
	bl	wcd9xxx_start_hs_polling
	b	.L476
.L498:
	mov	r2, #2
	b	.L496
.L495:
	mov	r2, #0
	b	.L496
.L502:
	mov	r2, #0
	b	.L503
.L505:
	mov	r2, #2
	b	.L503
.L548:
	mov	r2, #1
.L510:
	cmp	r3, r2
	bne	.L508
	ldr	r3, [r4, #336]
	tst	r3, #3
	bne	.L643
.L514:
	ldrb	r1, [r4]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L644
	ldrb	r3, [r4, #504]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L541
	b	.L631
.L512:
	mov	r2, #2
	b	.L510
.L509:
	mov	r2, #0
	b	.L510
.L550:
	mov	r2, #0
	b	.L539
.L549:
	mov	r2, #0
	b	.L537
.L528:
	cmp	r2, #0
	bne	.L631
	tst	r5, #3120
	bne	.L631
	tst	r5, #780
	mvneq	r3, #0
	moveq	r2, r3
	beq	.L539
	b	.L631
.L519:
	cmp	r2, #0
	bne	.L631
	tst	r5, #3120
	bne	.L631
	tst	r5, #780
	mvnne	r3, #0
	movne	r2, #1
	bne	.L537
	b	.L544
.L499:
	mov	r2, #3
	b	.L496
.L506:
	mov	r2, #3
	b	.L503
.L513:
	mov	r2, #3
	b	.L510
.L643:
	mov	r3, #1
	mov	r0, r4
	mov	r2, r3
	mov	r1, r3
	bl	__wcd9xxx_switch_micbias
	b	.L514
.L516:
	mov	r3, #0
	mov	r2, #64
	mov	r1, #372
	bl	snd_soc_update_bits
	b	.L508
.L501:
	mov	r3, #64
	mov	r1, #372
	mov	r2, r3
	mov	r5, #0
	bl	snd_soc_update_bits
	b	.L476
	.fnend
	.size	wcd9xxx_event_notify, .-wcd9xxx_event_notify
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_mbhc_setup_hs_polling, %function
wcd9xxx_mbhc_setup_hs_polling:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	mov	r7, r1
	mov	r6, r2
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r3, [r0, #320]
	ldr	r5, [r0, #324]
	ldr	r8, [r3, #112]
	cmp	r8, #1
	beq	.L689
.L646:
	ldr	r2, [r4, #64]
	ldr	r3, [r2, #4]
	cmp	r3, #0
	beq	.L690
	ldr	r3, [r4, #68]
	cmp	r3, #0
	beq	.L649
	ldr	r8, [r3, #40]
	cmp	r8, #0
	beq	.L650
	mov	r2, #1
	mov	r0, r5
	mov	r1, r2
	blx	r8
	ldr	r3, [r4, #64]
	ldrb	r3, [r3, #52]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L652
	ldr	r3, [r4, #68]
	cmp	r3, #0
	beq	.L653
.L662:
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L653
	mov	r1, #1
	mov	r0, r5
	blx	r3
.L652:
	mov	r3, #1
	mov	r2, #5
	mov	r1, #264
	mov	r0, r5
	bl	snd_soc_update_bits
	ldrh	r1, [r7, #2]
	mov	r0, r5
	bl	snd_soc_read
	ldr	r3, [r4, #68]
	mov	r8, r0
	cmp	r3, #0
	beq	.L654
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L654
	mov	r1, r4
	mov	r0, r5
	blx	r3
.L655:
	mov	r3, #2
	mov	r1, #988
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	ldrb	r2, [r4, #529]	@ zero_extendqisi2
	movw	r1, #334
	mov	r0, r5
	bl	snd_soc_write
	ldr	r3, [r4, #68]
	cmp	r3, #0
	beq	.L656
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L656
	mov	r0, r5
	blx	r3
.L657:
	mov	r3, #128
	movw	r1, #369
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #28
	mov	r2, #31
	movw	r1, #369
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #64
	mov	r1, #372
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r2, #128
	movw	r1, #369
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #8
	mov	r1, #988
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r2, #8
	mov	r1, #988
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #2
	movw	r1, #974
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #8
	mov	r1, #988
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	ldr	r3, [r4, #64]
	ldrb	r3, [r3, #53]	@ zero_extendqisi2
	orrs	r3, r6, r3
	beq	.L691
.L658:
	ldr	r2, [r4, #320]
	ldr	r6, [r4, #324]
	ldr	r3, [r4, #532]
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #16]
	bl	wcd9xxx_disable_irq
	mov	r3, #0
	mov	r0, r6
	mov	r2, #2
	movw	r1, #974
	bl	snd_soc_update_bits
	ldr	r3, [r4, #64]
	ldrb	r3, [r3, #53]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L692
.L659:
	mov	r3, #8
	mov	r1, #988
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r2, #4
	mov	r1, #960
	mov	r0, r6
	bl	snd_soc_write
	mov	r3, #0
	mov	r2, #8
	mov	r1, #988
	mov	r0, r6
	bl	snd_soc_update_bits
	ldr	r3, [r4, #64]
	ldrb	r3, [r3, #53]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L693
.L660:
	ldr	r1, [r4, #84]
	mov	r0, r1
	bl	usleep_range
	mov	r2, #4
	mov	r1, #960
	mov	r0, r6
	bl	snd_soc_write
	ldr	r1, [r4, #88]
	mov	r0, r1
	bl	usleep_range
	movw	r1, #973
	mov	r0, r6
	bl	snd_soc_read
	mov	r9, r0
	mov	r1, #972
	mov	r0, r6
	bl	snd_soc_read
	uxtb	r2, r0
	mov	r3, #2
	mov	r0, r6
	movw	r1, #974
	orr	r6, r2, r9, lsl #8
	mov	r2, r3
	bl	snd_soc_update_bits
	ldr	r2, [r4, #320]
	sxth	r6, r6
	ldr	r3, [r4, #532]
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #16]
	bl	wcd9xxx_enable_irq
	uxtb	r2, r8
	ldrh	r1, [r7, #2]
	mov	r0, r5
	bl	snd_soc_write
	mov	r0, r5
	mov	r3, #0
	mov	r2, #19
	movw	r1, #510
	bl	snd_soc_update_bits
.L687:
	mov	r0, r6
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L693:
	mov	r3, #2
	mov	r1, #988
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	b	.L660
.L692:
	mov	r3, #0
	mov	r2, #2
	mov	r1, #988
	mov	r0, r6
	bl	snd_soc_update_bits
	b	.L659
.L649:
	ldrb	r3, [r2, #52]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L652
.L653:
	movw	r0, #:lower16:.LC1
	ldr	r1, .L694
	movt	r0, #:upper16:.LC1
	bl	printk
	b	.L652
.L656:
	mov	r3, #128
	movw	r1, #334
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L657
.L654:
	mov	r3, #0
	mov	r2, #112
	ldrh	r1, [r7, #2]
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L655
.L691:
	mov	r0, r4
	bl	wcd9xxx_calibrate_hs_polling
	b	.L658
.L689:
	movw	r9, #:lower16:.LANCHOR1
	movt	r9, #:upper16:.LANCHOR1
	ldrb	r3, [r9, #3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L646
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L694
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #1157
	bl	warn_slowpath_fmt
	strb	r8, [r9, #3]
	b	.L646
.L650:
	ldrb	r2, [r2, #52]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L652
	b	.L662
.L690:
	movw	r0, #:lower16:.LC36
	ldr	r1, .L694
	mvn	r6, #18
	movt	r0, #:upper16:.LC36
	bl	printk
	b	.L687
.L695:
	.align	2
.L694:
	.word	.LANCHOR0+188
	.fnend
	.size	wcd9xxx_mbhc_setup_hs_polling, .-wcd9xxx_mbhc_setup_hs_polling
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_codec_cs_get_plug_type, %function
wcd9xxx_codec_cs_get_plug_type:
	.fnstart
	@ args = 0, pretend = 0, frame = 144
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r0, [r0, #320]
	.pad #148
	sub	sp, sp, #148
	ldr	r3, [r4, #324]
	ldr	r5, [r0, #112]
	stm	sp, {r1, r3}
	cmp	r5, #1
	beq	.L831
.L697:
	add	r0, r0, #136
	bl	mutex_lock
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_bandgap
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_clk_block
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_unlock
	ldr	r1, [r4, #320]
	mov	r2, #1
	mov	r3, #0
	ldr	r5, [r4, #324]
	strb	r3, [sp, #50]
	strb	r3, [sp, #51]
	ldr	r6, [r1, #112]
	strb	r2, [sp, #52]
	cmp	r6, r2
	beq	.L832
.L698:
	movw	r1, #510
	mov	r0, r5
	bl	snd_soc_read
	add	r8, r4, #132
	mov	r3, #2
	mov	r2, #18
	mov	r7, r0
	movw	r1, #510
	mov	r0, r5
	str	r8, [sp, #8]
	bl	snd_soc_update_bits
	movw	r1, #1100
	mov	r0, #1000
	bl	usleep_range
	movw	r1, #435
	mov	r0, r5
	bl	snd_soc_read
	mov	r6, r0
	uxth	r2, r7
	mov	r0, r5
	movw	r1, #510
	movw	r5, #:lower16:.LANCHOR1
	bl	snd_soc_write
	mov	r2, #1
	mov	r1, r8
	strh	r6, [sp, #48]	@ movhi
	mov	r0, r4
	movt	r5, #:upper16:.LANCHOR1
	bl	wcd9xxx_mbhc_setup_hs_polling
	ldr	r2, [sp]
	mov	r3, #0
	str	r5, [sp, #12]
	add	r6, sp, #44
	mov	r5, #1
	strh	r0, [sp, #44]	@ movhi
	strb	r3, [sp, #53]
	eor	r10, r2, #1
.L703:
	ldr	r3, [r4, #320]
	sub	r2, r5, #2
	ldr	r8, [sp]
	clz	r2, r2
	lsr	r2, r2, #5
	ldr	r7, [r4, #324]
	ldr	r9, [r3, #112]
	cmp	r5, #1
	movne	r8, #0
	andeq	r8, r8, #1
	strb	r2, [r6, #26]
	strb	r8, [r6, #29]
	cmp	r9, #1
	beq	.L833
.L699:
	movw	r1, #510
	mov	r0, r7
	bl	snd_soc_read
	mov	r9, r0
	mov	r3, #2
	mov	r2, #18
	movw	r1, #510
	mov	r0, r7
	bl	snd_soc_update_bits
	movw	r1, #1100
	mov	r0, #1000
	bl	usleep_range
	movw	r1, #435
	mov	r0, r7
	bl	snd_soc_read
	mov	fp, r0
	uxth	r2, r9
	mov	r0, r7
	movw	r1, #510
	bl	snd_soc_write
	cmp	r5, #2
	strh	fp, [r6, #24]	@ movhi
	beq	.L834
.L700:
	cmp	r8, #0
	bne	.L835
	mov	r2, #1
	mov	r1, r10
	mov	r0, r4
	bl	__wcd9xxx_codec_sta_dce.constprop.22
	cmp	r5, #2
	strh	r0, [r6, #20]	@ movhi
	bne	.L702
	mov	r3, r8
	mov	r2, #1
	ldr	r0, [sp, #4]
	movw	r1, #510
	bl	snd_soc_update_bits
.L702:
	add	r5, r5, #1
	add	r6, r6, #20
	cmp	r5, #4
	bne	.L703
	mov	r2, #1
	ldr	r1, [sp, #8]
	mov	r0, r4
	bl	wcd9xxx_recalibrate
	ldrb	r2, [sp, #53]	@ zero_extendqisi2
	ldr	r3, [r4, #64]
	ldr	r1, [r4, #336]
	cmp	r2, #0
	ldr	r7, [r3, #4]
	str	r1, [sp, #32]
	ldrsh	r1, [r4, #76]
	str	r3, [sp, #36]
	bne	.L704
	ldrsh	r6, [r4, #74]
	mov	r0, r2
	movw	ip, #650
	movw	r3, #1800
.L705:
	ldrsh	lr, [sp, #44]
	sub	r5, r1, r6
	sub	lr, lr, r6
	mul	r3, r3, lr
	sdiv	r3, r3, r5
	sxth	lr, r3
	cmp	lr, r0
	strh	lr, [sp, #56]	@ movhi
	blt	.L706
	cmp	lr, ip
	movlt	r0, #1
	movlt	ip, #0
	movge	r0, #3
	movge	ip, #1
	str	ip, [sp, #4]
	str	r0, [sp, #60]
.L708:
	ldrb	r0, [sp, #50]	@ zero_extendqisi2
	ldrh	r6, [sp, #48]
	cmp	r0, #0
	str	r0, [sp, #20]
	and	r5, r6, #1
	bne	.L709
	cmp	r2, #0
	moveq	fp, lr
	streq	lr, [sp, #8]
	beq	.L714
.L713:
	sub	r3, r3, #20
	uxth	r3, r3
	cmp	r3, #60
	bls	.L828
	mov	r3, #-2147483648
	mov	fp, #0
	str	r3, [sp, #8]
.L712:
	ldrb	r6, [sp, #73]	@ zero_extendqisi2
	cmp	r6, #0
	str	r6, [sp, #12]
	bne	.L715
	ldrsh	ip, [r4, #74]
	movw	r8, #650
	movw	r3, #1800
.L716:
	ldrsh	r0, [sp, #64]
	sub	r9, r1, ip
	sub	r0, r0, ip
	mul	r0, r3, r0
	sdiv	r9, r0, r9
	sxth	ip, r9
	cmp	r6, ip
	movgt	r3, #2
	strh	ip, [sp, #76]	@ movhi
	strgt	r3, [sp, #80]
	bgt	.L719
	cmp	r8, ip
	movgt	r3, #1
	strgt	r3, [sp, #80]
	bgt	.L719
	ldr	r0, [sp, #4]
	mov	r3, #3
	str	r3, [sp, #80]
	add	r0, r0, #1
	str	r0, [sp, #4]
.L719:
	ldrb	r3, [sp, #70]	@ zero_extendqisi2
	ldrh	r0, [sp, #68]
	cmp	r3, #0
	str	r3, [sp, #24]
	and	r0, r0, #1
	add	r6, r0, r5
	bne	.L720
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L723
	ldr	r0, [sp, #8]
	clz	r3, fp
	lsr	r3, r3, #5
	cmp	r0, ip
	movlt	r0, ip
	cmp	fp, ip
	orrgt	r3, r3, #1
	cmp	r3, #0
	movne	fp, ip
	str	r0, [sp, #8]
.L724:
	sub	r9, r9, #160
	uxth	r9, r9
	cmp	r9, #10
	bls	.L828
	ldrb	r8, [sp, #93]	@ zero_extendqisi2
	cmp	r8, #0
	str	r8, [sp, #16]
	bne	.L725
.L838:
	ldrsh	r5, [r4, #74]
	movw	r9, #650
	movw	r3, #1800
.L726:
	ldrsh	r0, [sp, #84]
	sub	r10, r1, r5
	sub	r0, r0, r5
	mul	r0, r3, r0
	sdiv	r10, r0, r10
	sxth	r5, r10
	cmp	r8, r5
	movgt	r3, #2
	strh	r5, [sp, #96]	@ movhi
	strgt	r3, [sp, #100]
	bgt	.L729
	cmp	r9, r5
	movgt	r3, #1
	strgt	r3, [sp, #100]
	bgt	.L729
	ldr	r0, [sp, #4]
	mov	r3, #3
	str	r3, [sp, #100]
	add	r0, r0, #1
	str	r0, [sp, #4]
.L729:
	ldrb	r3, [sp, #90]	@ zero_extendqisi2
	ldrh	r0, [sp, #88]
	cmp	r3, #0
	str	r3, [sp, #28]
	and	r0, r0, #1
	add	r0, r0, r6
	bne	.L730
	ldr	r3, [sp, #16]
	cmp	r3, #0
	bne	.L733
	ldr	r6, [sp, #8]
	clz	r3, fp
	lsr	r3, r3, #5
	cmp	r6, r5
	movlt	r6, r5
	cmp	fp, r5
	orrgt	r3, r3, #1
	cmp	r3, #0
	movne	fp, r5
	str	r6, [sp, #8]
.L734:
	sub	r10, r10, #160
	uxth	r10, r10
	cmp	r10, #10
	bls	.L828
	ldrb	r6, [sp, #113]	@ zero_extendqisi2
	cmp	r6, #0
	beq	.L735
.L839:
	ldrsh	r8, [r4, #72]
	ldrsh	r10, [r7, #48]	@ unaligned
	ldrsh	r9, [r7, #40]	@ unaligned
	ldr	r3, [r4, #96]
.L736:
	ldrsh	r7, [sp, #104]
	sub	r1, r1, r8
	sub	r7, r7, r8
	mul	r7, r3, r7
	sdiv	r1, r7, r1
	sxth	r8, r1
	cmp	r8, r9
	movlt	r3, #2
	strh	r8, [sp, #116]	@ movhi
	strlt	r3, [sp, #120]
	blt	.L738
	cmp	r8, r10
	movlt	r3, #1
	strlt	r3, [sp, #120]
	blt	.L738
	ldr	r7, [sp, #4]
	mov	r3, #3
	str	r3, [sp, #120]
	add	r7, r7, #1
	str	r7, [sp, #4]
.L738:
	ldrb	r9, [sp, #110]	@ zero_extendqisi2
	ldrh	r3, [sp, #108]
	cmp	r9, #0
	and	r3, r3, #1
	add	r7, r3, r0
	bne	.L740
	cmp	r6, #0
	bne	.L741
	ldr	r0, [sp, #8]
	clz	r3, fp
	lsr	r3, r3, #5
	cmp	r0, r8
	movlt	r0, r8
	cmp	r8, fp
	orrlt	r3, r3, #1
	cmp	r3, #0
	movne	fp, r8
	str	r0, [sp, #8]
.L742:
	sub	r1, r1, #160
	uxth	r1, r1
	cmp	r1, #10
	bls	.L828
.L743:
	ldr	r3, [sp]
	ldr	r1, [sp, #4]
	cmp	r1, #4
	orreq	r3, r3, #1
	ldr	r1, [sp, #20]
	cmp	r3, #0
	moveq	r3, #12
	movne	r3, #80
	cmp	r1, #0
	bne	.L746
	cmp	r2, #0
	bne	.L784
	sub	r1, fp, lr
	cmp	r1, #0
	rsblt	r1, r1, #0
	cmp	r3, r1
	blt	.L828
	ldr	r1, [sp, #8]
	sub	r1, r1, lr
	cmp	r1, #0
	rsblt	r1, r1, #0
	cmp	r3, r1
	blt	.L828
	ldr	r0, [sp, #12]
	mov	r1, r2
	cmp	r0, #0
	beq	.L836
.L748:
	ldr	r1, [sp, #24]
	cmp	r1, #0
	addeq	r0, sp, #44
	addeq	r1, sp, #64
	bne	.L837
.L750:
	ldr	ip, [sp, #16]
	cmp	ip, #0
	bne	.L752
.L840:
	ldr	ip, [sp, #28]
	cmp	ip, #0
	bne	.L787
	ldr	ip, [r0, #16]
	ldr	r0, [sp, #100]
	cmp	ip, r0
	bne	.L828
	sub	r0, fp, r5
	cmp	r0, #0
	rsblt	r0, r0, #0
	cmp	r0, r3
	bgt	.L828
	ldr	r0, [sp, #8]
	sub	r0, r0, r5
	cmp	r0, #0
	rsblt	r0, r0, #0
	cmp	r0, r3
	bgt	.L828
	add	r0, sp, #84
.L754:
	cmp	r6, #0
	bne	.L756
.L841:
	cmp	r9, #0
	bne	.L757
	ldr	r0, [r0, #16]
	ldr	ip, [sp, #120]
	cmp	ip, r0
	bne	.L828
	sub	r0, fp, r8
	cmp	r0, #0
	rsblt	r0, r0, #0
	cmp	r0, r3
	bgt	.L828
	ldr	r0, [sp, #8]
	sub	r0, r0, r8
	cmp	r0, #0
	rsblt	r0, r0, #0
	cmp	r3, r0
	blt	.L828
	cmp	r2, #0
	ldr	r5, [sp, #60]
	beq	.L761
	b	.L781
.L709:
	cmp	r2, #0
	bne	.L713
	mov	r0, #-2147483648
	mov	fp, r2
	str	r0, [sp, #8]
.L714:
	sub	r3, r3, #160
	uxth	r3, r3
	cmp	r3, #10
	bhi	.L712
.L828:
	mvn	r5, #0
.L744:
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_lock
	ldr	r0, [r4, #320]
	mov	r1, #1
	bl	wcd9xxx_resmgr_put_clk_block
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_put_bandgap
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_unlock
	mov	r0, r5
	add	sp, sp, #148
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L835:
	ldr	r0, [r4, #64]
	mov	r3, #16
	mov	r1, #336
	ldr	r7, [r4, #324]
	mov	r2, r3
	ldr	r8, [r0, #4]
	mov	r0, r7
	bl	snd_soc_update_bits
	ldrh	r1, [r4, #136]
	mov	r0, r7
	mov	r2, #96
	ldr	r3, [r8, #16]	@ unaligned
	lsl	r3, r3, #5
	bl	snd_soc_update_bits
	ldrh	r1, [r4, #136]
	mov	r0, r7
	mov	r3, #0
	mov	r2, #128
	bl	snd_soc_update_bits
	ldrh	r1, [r4, #136]
	mov	r0, r7
	mov	r3, #0
	mov	r2, #16
	bl	snd_soc_update_bits
	ldrb	r3, [r8, #62]	@ zero_extendqisi2
	mov	r0, r7
	mov	r2, #120
	movw	r1, #974
	lsl	r3, r3, #3
	bl	snd_soc_update_bits
	mov	r1, r10
	mov	r2, #1
	mov	r0, r4
	bl	__wcd9xxx_codec_sta_dce.constprop.22
	ldr	r7, [r4, #324]
	strh	r0, [r6, #20]	@ movhi
	mov	r3, #72
	mov	r2, #120
	movw	r1, #974
	mov	r0, r7
	bl	snd_soc_update_bits
	ldrh	r1, [r4, #136]
	mov	r0, r7
	mov	r3, #0
	mov	r2, #1
	bl	snd_soc_update_bits
	mov	r0, r7
	mov	r3, #0
	mov	r2, #1
	movw	r1, #989
	bl	snd_soc_update_bits
	mov	r3, #240
	ldrh	r1, [r4, #136]
	mov	r0, r7
	mov	r2, r3
	bl	snd_soc_update_bits
	mov	r0, r7
	mov	r3, #0
	mov	r2, #16
	mov	r1, #336
	bl	snd_soc_update_bits
	b	.L702
.L834:
	mov	r3, #1
	movw	r1, #510
	ldr	r0, [sp, #4]
	mov	r2, r3
	bl	snd_soc_update_bits
	movw	r1, #5000
	mov	r0, r1
	bl	usleep_range
	b	.L700
.L706:
	mov	r0, #2
	mov	ip, #0
	str	ip, [sp, #4]
	str	r0, [sp, #60]
	b	.L708
.L704:
	ldrsh	r6, [r4, #72]
	ldrsh	ip, [r7, #48]	@ unaligned
	ldrsh	r0, [r7, #40]	@ unaligned
	ldr	r3, [r4, #96]
	b	.L705
.L715:
	ldrsh	ip, [r4, #72]
	ldrsh	r8, [r7, #48]	@ unaligned
	ldrsh	r6, [r7, #40]	@ unaligned
	ldr	r3, [r4, #96]
	b	.L716
.L720:
	ldr	r3, [sp, #12]
	cmp	r3, #0
	beq	.L724
.L723:
	sub	r9, r9, #20
	uxth	r9, r9
	cmp	r9, #60
	bls	.L828
	ldrb	r8, [sp, #93]	@ zero_extendqisi2
	cmp	r8, #0
	str	r8, [sp, #16]
	beq	.L838
.L725:
	ldrsh	r5, [r4, #72]
	ldrsh	r9, [r7, #48]	@ unaligned
	ldrsh	r8, [r7, #40]	@ unaligned
	ldr	r3, [r4, #96]
	b	.L726
.L730:
	ldr	r3, [sp, #16]
	cmp	r3, #0
	beq	.L734
.L733:
	sub	r10, r10, #20
	uxth	r10, r10
	cmp	r10, #60
	bls	.L828
	ldrb	r6, [sp, #113]	@ zero_extendqisi2
	cmp	r6, #0
	bne	.L839
.L735:
	ldrsh	r8, [r4, #74]
	mov	r9, r6
	movw	r10, #650
	movw	r3, #1800
	b	.L736
.L740:
	cmp	r6, #0
	beq	.L742
.L741:
	sub	r1, r1, #20
	uxth	r1, r1
	cmp	r1, #60
	bhi	.L743
	b	.L828
.L833:
	ldr	r3, [sp, #12]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L699
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L843
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #1382
	bl	warn_slowpath_fmt
	ldr	r3, [sp, #12]
	strb	r9, [r3, #5]
	b	.L699
.L746:
	cmp	r2, #0
	add	r2, sp, #44
	mov	r1, r2
	moveq	r1, #0
.L747:
	ldr	r0, [sp, #12]
	cmp	r0, #0
	bne	.L748
.L836:
	ldr	r0, [sp, #24]
	cmp	r0, #0
	bne	.L786
	ldr	lr, [sp, #60]
	ldr	r0, [sp, #80]
	cmp	lr, r0
	bne	.L828
	sub	r0, fp, ip
	cmp	r0, #0
	rsblt	r0, r0, #0
	cmp	r3, r0
	blt	.L828
	ldr	r0, [sp, #8]
	sub	r0, r0, ip
	cmp	r0, #0
	rsblt	r0, r0, #0
	cmp	r3, r0
	blt	.L828
	ldr	ip, [sp, #16]
	add	r0, sp, #64
	cmp	ip, #0
	beq	.L840
.L752:
	ldr	r1, [sp, #28]
	cmp	r1, #0
	addne	r2, sp, #84
	movne	r1, r2
	bne	.L754
	cmp	r6, #0
	add	r1, sp, #84
	beq	.L841
.L756:
	cmp	r9, #0
	bne	.L842
	cmp	r2, #0
	add	r1, sp, #104
	ldr	r5, [sp, #60]
	beq	.L772
.L778:
	cmp	r5, #1
	beq	.L773
.L782:
	ldr	r3, [r2, #16]
	cmp	r3, r5
	bne	.L828
.L761:
	cmp	r1, #0
	beq	.L766
.L772:
	ldr	r3, [r1, #16]
	cmp	r3, #1
	beq	.L763
.L827:
	sub	r3, r5, #1
	clz	r3, r3
	lsr	r3, r3, #5
.L764:
	cmp	r2, #0
	moveq	r3, #0
	cmp	r3, #0
	bne	.L774
.L766:
	ldr	r3, [sp, #32]
	tst	r3, #1
	bne	.L770
	cmp	r7, #4
	cmpne	r7, #0
	bne	.L828
	sub	r3, r5, #1
	cmp	r3, #1
	bhi	.L744
	cmp	r7, #4
	bne	.L828
.L770:
	cmp	r5, #1
	bne	.L744
.L776:
	ldr	r3, [sp, #36]
	ldr	r3, [r3, #40]
	tst	r3, #2
	movne	r3, #1
	moveq	r5, #1
	movne	r5, r3
	strbne	r3, [r4, #504]
	b	.L744
.L784:
	mov	r2, r1
	add	r1, sp, #44
	b	.L747
.L837:
	add	r2, sp, #64
	add	r0, sp, #44
	mov	r1, r2
	b	.L750
.L786:
	add	r0, sp, #44
	add	r2, sp, #64
	b	.L750
.L787:
	add	r2, sp, #84
	b	.L754
.L757:
	ldr	r5, [sp, #60]
	add	r2, sp, #104
.L781:
	cmp	r5, #1
	bne	.L782
	cmp	r1, #0
	bne	.L773
.L774:
	ldrb	r3, [r2, #9]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L767
	ldr	r2, [r2, #16]
	cmp	r2, #2
	moveq	r5, #4
	beq	.L744
	subs	r3, r2, #1
	ldr	r2, [sp, #32]
	movne	r3, #1
	cmp	r1, #0
	movne	r3, #0
	cmp	r3, #0
	and	r2, r2, #1
	bne	.L828
.L769:
	cmp	r2, #0
	bne	.L776
	cmp	r7, #0
	cmpne	r7, #4
	bne	.L828
	cmp	r7, #4
	beq	.L776
	b	.L828
.L842:
	add	r2, sp, #104
	ldr	r5, [sp, #60]
	mov	r1, r2
	b	.L778
.L831:
	movw	r6, #:lower16:.LANCHOR1
	movt	r6, #:upper16:.LANCHOR1
	ldrb	r3, [r6, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L697
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L843+4
	movt	r0, #:upper16:.LC6
	movt	r2, #:upper16:.LC7
	movw	r1, #1812
	bl	warn_slowpath_fmt
	ldr	r0, [r4, #320]
	strb	r5, [r6, #4]
	b	.L697
.L832:
	movw	r7, #:lower16:.LANCHOR1
	movt	r7, #:upper16:.LANCHOR1
	ldrb	r3, [r7, #5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L698
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L843
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #1382
	bl	warn_slowpath_fmt
	strb	r6, [r7, #5]
	b	.L698
.L767:
	ldr	r3, [sp, #32]
	and	r2, r3, #1
	b	.L769
.L763:
	bic	r3, r5, #2
	cmp	r3, #1
	bne	.L827
	cmp	r5, #3
	movne	r5, r3
	movne	r3, r5
	bne	.L764
	ldr	r0, [sp, #36]
	mov	r5, r3
	ldr	r0, [r0, #40]
	tst	r0, #1
	strbne	r3, [r4, #504]
	b	.L764
.L773:
	ldr	r3, [r1, #16]
	cmp	r3, #1
	movne	r5, #1
	bne	.L827
	b	.L774
.L844:
	.align	2
.L843:
	.word	.LANCHOR0+252
	.word	.LANCHOR0+220
	.fnend
	.size	wcd9xxx_codec_cs_get_plug_type, .-wcd9xxx_codec_cs_get_plug_type
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_codec_get_plug_type.constprop.10, %function
wcd9xxx_codec_get_plug_type.constprop.10:
	.fnstart
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #320]
	.pad #124
	sub	sp, sp, #124
	ldr	r2, [r0, #324]
	ldr	r5, [r3, #112]
	str	r2, [sp]
	cmp	r5, #1
	beq	.L1000
.L846:
	movw	r1, #974
	ldr	r0, [sp]
	bl	snd_soc_read
	tst	r0, #4
	beq	.L1001
.L847:
	ldr	ip, [r4, #64]
	movw	r10, #:lower16:.LANCHOR2
	mov	r3, #0
	movt	r10, #:upper16:.LANCHOR2
	mov	r1, r3
	mov	r2, r3
	mov	r0, r4
	ldrb	ip, [ip, #54]	@ zero_extendqisi2
	strb	ip, [r10]
	bl	__wcd9xxx_switch_micbias
	str	r0, [sp, #4]
	mov	r0, r4
	bl	wcd9xxx_pull_down_micbias.constprop.13
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_lock
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_bandgap
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_clk_block
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_unlock
	ldr	r3, [r4, #320]
	ldr	r5, [r4, #324]
	ldr	r6, [r3, #112]
	cmp	r6, #1
	beq	.L1002
.L848:
	movw	r1, #510
	mov	r0, r5
	bl	snd_soc_read
	add	ip, r4, #132
	mov	r3, #2
	mov	r2, #18
	mov	r6, r0
	movw	r1, #510
	mov	r0, r5
	str	ip, [sp, #8]
	mov	r8, ip
	bl	snd_soc_update_bits
	movw	r1, #1100
	mov	r0, #1000
	bl	usleep_range
	movw	r1, #435
	mov	r0, r5
	bl	snd_soc_read
	mov	r7, r0
	uxth	r2, r6
	mov	r0, r5
	movw	r1, #510
	bl	snd_soc_write
	movw	r3, #:lower16:.LANCHOR1
	mov	r1, r8
	strh	r7, [sp, #24]	@ movhi
	mov	r5, r3
	mov	r2, #0
	mov	r0, r4
	bl	wcd9xxx_mbhc_setup_hs_polling
	mov	r2, #1
	mov	r1, r5
	strh	r0, [sp, #20]	@ movhi
	mov	r3, #0
	movt	r1, #:upper16:.LANCHOR1
	mov	r6, r2
	add	r5, sp, #20
	str	r1, [sp, #12]
	strb	r3, [sp, #26]
	strb	r3, [sp, #27]
	strb	r2, [sp, #28]
.L860:
	ldrb	r7, [r10]	@ zero_extendqisi2
	sub	r3, r6, #3
	clz	r3, r3
	lsr	r3, r3, #5
	cmp	r7, #0
	strb	r3, [r5, #26]
	beq	.L849
	sub	r7, r6, #1
	clz	r7, r7
	lsr	r7, r7, #5
.L849:
	ldr	r3, [r4, #320]
	strb	r7, [r5, #27]
	ldr	r9, [r4, #324]
	ldr	fp, [r3, #112]
	cmp	fp, #1
	beq	.L1003
.L850:
	movw	r1, #510
	mov	r0, r9
	bl	snd_soc_read
	mov	fp, r0
	mov	r3, #2
	mov	r2, #18
	movw	r1, #510
	mov	r0, r9
	bl	snd_soc_update_bits
	movw	r1, #1100
	mov	r0, #1000
	bl	usleep_range
	movw	r1, #435
	mov	r0, r9
	bl	snd_soc_read
	mov	r8, r0
	uxth	r2, fp
	mov	r0, r9
	movw	r1, #510
	bl	snd_soc_write
	mov	r3, #0
	cmp	r6, #3
	strh	r8, [r5, #24]	@ movhi
	strb	r3, [r5, #28]
	beq	.L1004
.L851:
	cmp	r7, #0
	bne	.L1005
.L852:
	mov	r0, r4
	bl	wcd9xxx_pull_down_micbias.constprop.13
	ldr	r2, [r4, #320]
	ldr	r7, [r4, #324]
	ldr	r3, [r4, #532]
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #16]
	bl	wcd9xxx_disable_irq
	mov	r3, #0
	mov	r0, r7
	mov	r2, #2
	movw	r1, #974
	bl	snd_soc_update_bits
	ldr	r3, [r4, #64]
	ldrb	r3, [r3, #53]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1006
.L855:
	mov	r3, #8
	mov	r1, #988
	mov	r2, r3
	mov	r0, r7
	bl	snd_soc_update_bits
	mov	r2, #4
	mov	r1, #960
	mov	r0, r7
	bl	snd_soc_write
	mov	r3, #0
	mov	r2, #8
	mov	r1, #988
	mov	r0, r7
	bl	snd_soc_update_bits
	ldr	r3, [r4, #64]
	ldrb	r3, [r3, #53]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1007
.L856:
	ldr	r1, [r4, #84]
	mov	r0, r1
	bl	usleep_range
	mov	r2, #4
	mov	r1, #960
	mov	r0, r7
	bl	snd_soc_write
	ldr	r1, [r4, #88]
	mov	r0, r1
	bl	usleep_range
	movw	r1, #973
	mov	r0, r7
	bl	snd_soc_read
	mov	r9, r0
	mov	r1, #972
	mov	r0, r7
	bl	snd_soc_read
	uxtb	r2, r0
	mov	r3, #2
	mov	r0, r7
	movw	r1, #974
	orr	r7, r2, r9, lsl #8
	mov	r2, r3
	bl	snd_soc_update_bits
	ldr	r2, [r4, #320]
	sxth	r7, r7
	ldr	r3, [r4, #532]
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #16]
	bl	wcd9xxx_enable_irq
	ldrb	r3, [r5, #27]	@ zero_extendqisi2
	strh	r7, [r5, #20]	@ movhi
	cmp	r3, #0
	bne	.L1008
.L857:
	ldrb	r3, [r5, #26]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1009
.L859:
	add	r6, r6, #1
	add	r5, r5, #20
	cmp	r6, #5
	bne	.L860
	mov	r2, #0
	mov	r0, r4
	ldr	r1, [sp, #8]
	bl	wcd9xxx_recalibrate
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L861
	mov	r3, #0
	mov	r1, #1
	mov	r2, r3
	mov	r0, r4
	bl	__wcd9xxx_switch_micbias
.L861:
	ldrsh	ip, [r4, #72]
	ldrsh	r2, [sp, #20]
	ldr	r1, [r4, #64]
	ldr	r3, [r4, #96]
	ldrsh	r5, [r4, #76]
	ldrb	lr, [sp, #27]	@ zero_extendqisi2
	sub	r2, r2, ip
	ldr	r1, [r1, #4]
	mul	r3, r3, r2
	ldr	r0, [r4, #320]
	sub	r5, r5, ip
	ldr	r7, [r4, #336]
	cmp	lr, #0
	sdiv	r5, r3, r5
	ldrsh	r8, [r1, #48]	@ unaligned
	ldrsh	r6, [r1, #40]	@ unaligned
	bne	.L862
	sxth	r3, r5
	strh	r3, [sp, #32]	@ movhi
.L863:
	cmp	r6, r3
	movgt	r2, #2
	strgt	r2, [sp, #36]
	bgt	.L865
	cmp	r8, r3
	movle	r2, #3
	movgt	r2, #1
	str	r2, [sp, #36]
.L865:
	ldrb	r5, [sp, #26]	@ zero_extendqisi2
	ldrh	r10, [sp, #24]
	cmp	r5, #0
	movne	r5, #0
	and	r10, r10, #1
	movne	r9, r5
	bne	.L867
	ldrb	r2, [sp, #28]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L994
	ldrb	r1, [sp, #27]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L925
	mov	r5, r3
	bic	r9, r3, r3, asr #31
.L867:
	sub	r3, r3, #20
	uxth	r3, r3
	cmp	r3, #60
	bls	.L896
	ldrsh	lr, [r4, #72]
	ldrsh	r1, [sp, #40]
	ldr	r2, [r4, #96]
	ldrsh	r3, [r4, #76]
	ldrb	ip, [sp, #47]	@ zero_extendqisi2
	sub	r1, r1, lr
	mul	r2, r2, r1
	sub	r3, r3, lr
	cmp	ip, #0
	sdiv	fp, r2, r3
	bne	.L869
	sxth	r3, fp
	strh	r3, [sp, #52]	@ movhi
.L870:
	cmp	r6, r3
	movgt	r2, #2
	strgt	r2, [sp, #56]
	ble	.L1010
.L872:
	ldrb	r1, [sp, #46]	@ zero_extendqisi2
	ldrh	r2, [sp, #44]
	cmp	r1, #0
	and	r2, r2, #1
	add	r10, r2, r10
	beq	.L1011
.L874:
	sub	r3, r3, #20
	uxth	r3, r3
	cmp	r3, #60
	bls	.L896
	ldrsh	lr, [r4, #72]
	ldrsh	r1, [sp, #60]
	ldr	r2, [r4, #96]
	ldrsh	r3, [r4, #76]
	ldrb	ip, [sp, #67]	@ zero_extendqisi2
	sub	r1, r1, lr
	mul	r2, r2, r1
	sub	r3, r3, lr
	cmp	ip, #0
	sdiv	fp, r2, r3
	bne	.L875
	sxth	r3, fp
	strh	r3, [sp, #72]	@ movhi
.L876:
	cmp	r6, r3
	movgt	r2, #2
	strgt	r2, [sp, #76]
	ble	.L1012
.L878:
	ldrb	r1, [sp, #66]	@ zero_extendqisi2
	ldrh	r2, [sp, #64]
	cmp	r1, #0
	and	r2, r2, #1
	add	r10, r2, r10
	beq	.L1013
.L880:
	sub	r3, r3, #20
	uxth	r3, r3
	cmp	r3, #60
	bls	.L896
	ldrsh	ip, [r4, #72]
	ldrsh	fp, [sp, #80]
	ldr	r2, [r4, #96]
	ldrsh	r3, [r4, #76]
	ldrb	r1, [sp, #87]	@ zero_extendqisi2
	sub	fp, fp, ip
	mul	r2, r2, fp
	sub	r3, r3, ip
	cmp	r1, #0
	sdiv	fp, r2, r3
	bne	.L881
	sxth	r3, fp
	strh	r3, [sp, #92]	@ movhi
.L882:
	cmp	r6, r3
	movgt	r2, #2
	strgt	r2, [sp, #96]
	ble	.L1014
.L884:
	ldrb	r1, [sp, #86]	@ zero_extendqisi2
	ldrh	r2, [sp, #84]
	cmp	r1, #0
	and	r2, r2, #1
	add	r10, r2, r10
	beq	.L1015
.L886:
	sub	r3, r3, #20
	uxth	r3, r3
	cmp	r3, #60
	bls	.L896
	ldrsh	lr, [r4, #72]
	ldrsh	r1, [sp, #100]
	ldr	r2, [r4, #96]
	ldrsh	r3, [r4, #76]
	ldrb	ip, [sp, #107]	@ zero_extendqisi2
	sub	r1, r1, lr
	mul	r2, r2, r1
	sub	r3, r3, lr
	cmp	ip, #0
	sdiv	fp, r2, r3
	sxtheq	r3, fp
	strheq	r3, [sp, #112]	@ movhi
	bne	.L1016
	cmp	r6, r3
	movgt	r2, #2
	strgt	r2, [sp, #116]
	bgt	.L891
.L1022:
	cmp	r8, r3
	movgt	r2, #1
	movle	r2, #3
	str	r2, [sp, #116]
.L891:
	ldrb	r2, [sp, #106]	@ zero_extendqisi2
	ldrh	r1, [sp, #104]
	cmp	r2, #0
	and	r1, r1, #1
	add	r10, r1, r10
	beq	.L1017
.L892:
	sub	r3, r3, #20
	uxth	r3, r3
	cmp	r3, #60
	bls	.L896
	ands	r7, r7, #1
	beq	.L1018
	ldrb	r3, [sp, #27]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L897
.L1021:
	ldrb	r1, [sp, #26]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1019
	add	r1, sp, #20
.L898:
	ldrb	ip, [sp, #47]	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L992
	add	r3, sp, #20
.L920:
	ldrb	ip, [sp, #67]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L900
	cmp	r3, #0
	add	ip, sp, #40
	bne	.L901
	ldrb	r3, [sp, #66]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L930
.L1025:
	ldrb	r3, [sp, #68]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L996
	ldrsh	r3, [sp, #72]
	sub	lr, r5, r3
	cmp	lr, #0
	rsblt	lr, lr, #0
	cmp	lr, #120
	bgt	.L896
	sub	r3, r9, r3
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, #120
	bgt	.L896
.L996:
	ldrb	lr, [sp, #87]	@ zero_extendqisi2
	add	r3, sp, #60
	cmp	lr, #0
	beq	.L905
.L941:
	add	ip, sp, #80
.L904:
	ldrb	lr, [sp, #107]	@ zero_extendqisi2
	cmp	lr, #0
	bne	.L935
.L1023:
	cmp	r3, #0
	beq	.L908
	ldr	r3, [r3, #16]
	ldr	lr, [sp, #116]
	cmp	lr, r3
	bne	.L896
.L908:
	cmp	r2, #0
	bne	.L936
	ldrb	r3, [sp, #108]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L907
	ldrsh	r3, [sp, #112]
	sub	r2, r5, r3
	cmp	r2, #0
	rsblt	r2, r2, #0
	cmp	r2, #120
	bgt	.L896
	sub	r3, r9, r3
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, #120
	bgt	.L896
.L907:
	ldr	r6, [sp, #36]
	cmp	r1, #0
	sub	r3, r6, #1
	clz	r3, r3
	lsr	r3, r3, #5
	moveq	r3, #0
	cmp	r3, #0
	beq	.L909
	ldrsh	r3, [r1, #12]
	add	r2, r3, #150
	cmp	r2, r5
	bge	.L910
	add	r3, r3, #648
	add	r3, r3, #2
	cmp	r3, r9
	bgt	.L911
.L910:
	cmp	r7, #0
	bne	.L918
	cmp	r10, #5
	bne	.L896
.L918:
	cmp	ip, #0
	beq	.L914
	ldrsh	r3, [ip, #12]
	cmp	r8, r3
	bge	.L1020
.L915:
	ldr	r3, [r4, #64]
	ldr	r3, [r3, #40]
	tst	r3, #1
	beq	.L937
.L916:
	mov	r3, #1
	mov	r6, r3
	strb	r3, [r4, #504]
	b	.L894
.L1009:
	mov	r3, #0
	mov	r2, #1
	ldr	r0, [sp]
	movw	r1, #510
	bl	snd_soc_update_bits
	b	.L859
.L1008:
	ldr	r3, [r4, #68]
	ldr	r0, [r4, #324]
	cmp	r3, #0
	beq	.L858
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L858
	mov	r1, #0
	blx	r3
	b	.L857
.L1007:
	mov	r3, #2
	mov	r1, #988
	mov	r2, r3
	mov	r0, r7
	bl	snd_soc_update_bits
	b	.L856
.L1006:
	mov	r3, #0
	mov	r2, #2
	mov	r1, #988
	mov	r0, r7
	bl	snd_soc_update_bits
	b	.L855
.L1005:
	ldr	r3, [r4, #68]
	ldr	r0, [r4, #324]
	cmp	r3, #0
	beq	.L853
	ldr	r3, [r3, #48]
	cmp	r3, #0
	beq	.L853
	mov	r1, #1
	blx	r3
.L854:
	movw	r1, #10000
	mov	r0, r1
	bl	usleep_range
	b	.L852
.L1004:
	mov	r3, #1
	movw	r1, #510
	ldr	r0, [sp]
	mov	r2, r3
	bl	snd_soc_update_bits
	movw	r1, #5000
	mov	r0, r1
	bl	usleep_range
	b	.L851
.L1027:
	cmp	r10, #5
	beq	.L912
.L896:
	mvn	r6, #0
.L894:
	add	r0, r0, #136
	bl	mutex_lock
	ldr	r0, [r4, #320]
	mov	r1, #1
	bl	wcd9xxx_resmgr_put_clk_block
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_put_bandgap
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_unlock
	mov	r0, r6
	add	sp, sp, #124
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1011:
	ldrb	r2, [sp, #48]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L874
	ldrb	r2, [sp, #47]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L874
	clz	r2, r5
	cmp	r9, r3
	lsr	r2, r2, #5
	movlt	r9, r3
	cmp	r5, r3
	orrgt	r2, r2, #1
	cmp	r2, #0
	movne	r5, r3
	b	.L874
.L1010:
	cmp	r8, r3
	movle	r2, #3
	movgt	r2, #1
	str	r2, [sp, #56]
	b	.L872
.L1013:
	ldrb	r2, [sp, #68]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L880
	ldrb	r2, [sp, #67]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L880
	clz	r2, r5
	cmp	r9, r3
	lsr	r2, r2, #5
	movlt	r9, r3
	cmp	r5, r3
	orrgt	r2, r2, #1
	cmp	r2, #0
	movne	r5, r3
	b	.L880
.L1012:
	cmp	r8, r3
	movle	r2, #3
	movgt	r2, #1
	str	r2, [sp, #76]
	b	.L878
.L1015:
	ldrb	r2, [sp, #88]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L886
	ldrb	r2, [sp, #87]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L886
	clz	r2, r5
	cmp	r9, r3
	lsr	r2, r2, #5
	movlt	r9, r3
	cmp	r5, r3
	orrgt	r2, r2, #1
	cmp	r2, #0
	movne	r5, r3
	b	.L886
.L1014:
	cmp	r8, r3
	movle	r2, #3
	movgt	r2, #1
	str	r2, [sp, #96]
	b	.L884
.L1017:
	ldrb	r1, [sp, #108]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L892
	ldrb	r1, [sp, #107]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L892
	cmp	r9, r3
	movlt	r9, r3
	cmp	r3, r5
	movge	r1, #0
	movlt	r1, #1
	cmp	r5, #0
	moveq	r1, #1
	cmp	r1, #0
	movne	r5, r3
	b	.L892
.L1018:
	cmp	r10, #5
	cmpne	r10, #0
	bne	.L896
	ldrb	r3, [sp, #27]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1021
	b	.L897
.L925:
	mov	r5, r2
.L994:
	mov	r9, r5
	b	.L867
.L1016:
	movw	r1, #1800
	bl	wcd9xxx_resmgr_get_k_val
	mov	r2, r0
	ldr	r1, [r4, #96]
	ldr	r0, [r4, #320]
	str	r2, [sp]
	bl	wcd9xxx_resmgr_get_k_val
	ldr	r2, [sp]
	add	r3, r0, #4
	ldr	r0, [r4, #320]
	mul	r3, fp, r3
	add	r2, r2, #4
	sdiv	r3, r3, r2
	sxth	r3, r3
	cmp	r6, r3
	movgt	r2, #2
	strh	r3, [sp, #112]	@ movhi
	strgt	r2, [sp, #116]
	bgt	.L891
	b	.L1022
.L858:
	mov	r3, #16
	mov	r1, #336
	mov	r2, r3
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r2, #128
	ldrh	r1, [r4, #136]
	ldr	r0, [r4, #324]
	bl	snd_soc_update_bits
	b	.L857
.L853:
	mov	r3, #128
	ldrh	r1, [r4, #136]
	mov	r2, r3
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r2, #16
	ldr	r0, [r4, #324]
	mov	r1, #336
	bl	snd_soc_update_bits
	b	.L854
.L1003:
	ldr	r3, [sp, #12]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L850
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L1028
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #1382
	bl	warn_slowpath_fmt
	ldr	r3, [sp, #12]
	strb	fp, [r3, #5]
	b	.L850
.L862:
	movw	r1, #1800
	bl	wcd9xxx_resmgr_get_k_val
	add	r9, r0, #4
	ldr	r1, [r4, #96]
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_k_val
	add	r3, r0, #4
	ldr	r0, [r4, #320]
	mul	r3, r5, r3
	sdiv	r3, r3, r9
	sxth	r3, r3
	strh	r3, [sp, #32]	@ movhi
	b	.L863
.L869:
	movw	r1, #1800
	bl	wcd9xxx_resmgr_get_k_val
	mov	r2, r0
	ldr	r1, [r4, #96]
	ldr	r0, [r4, #320]
	str	r2, [sp]
	bl	wcd9xxx_resmgr_get_k_val
	ldr	r2, [sp]
	add	r3, r0, #4
	ldr	r0, [r4, #320]
	mul	r3, fp, r3
	add	r2, r2, #4
	sdiv	r3, r3, r2
	sxth	r3, r3
	strh	r3, [sp, #52]	@ movhi
	b	.L870
.L875:
	movw	r1, #1800
	bl	wcd9xxx_resmgr_get_k_val
	mov	r2, r0
	ldr	r1, [r4, #96]
	ldr	r0, [r4, #320]
	str	r2, [sp]
	bl	wcd9xxx_resmgr_get_k_val
	ldr	r2, [sp]
	add	r3, r0, #4
	ldr	r0, [r4, #320]
	mul	r3, fp, r3
	add	r2, r2, #4
	sdiv	r3, r3, r2
	sxth	r3, r3
	strh	r3, [sp, #72]	@ movhi
	b	.L876
.L881:
	movw	r1, #1800
	bl	wcd9xxx_resmgr_get_k_val
	mov	r2, r0
	ldr	r1, [r4, #96]
	ldr	r0, [r4, #320]
	str	r2, [sp]
	bl	wcd9xxx_resmgr_get_k_val
	ldr	r2, [sp]
	add	r3, r0, #4
	ldr	r0, [r4, #320]
	mul	r3, fp, r3
	add	r2, r2, #4
	sdiv	r3, r3, r2
	sxth	r3, r3
	strh	r3, [sp, #92]	@ movhi
	b	.L882
.L1019:
	ldrb	ip, [sp, #28]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L898
	ldrsh	r3, [sp, #32]
	sub	r1, r5, r3
	cmp	r1, #0
	rsblt	r1, r1, #0
	cmp	r1, #120
	bgt	.L896
	sub	r3, r9, r3
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, #120
	bgt	.L896
	mov	r1, ip
	b	.L898
.L897:
	ldrb	r1, [sp, #47]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L939
	ldrb	r3, [sp, #46]	@ zero_extendqisi2
	add	ip, sp, #20
	cmp	r3, #0
	bne	.L928
.L1024:
	ldrb	r3, [sp, #48]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L995
	ldrsh	r3, [sp, #52]
	sub	lr, r5, r3
	cmp	lr, #0
	rsblt	lr, lr, #0
	cmp	lr, #120
	bgt	.L896
	sub	r3, r9, r3
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, #120
	bgt	.L896
.L995:
	ldrb	lr, [sp, #67]	@ zero_extendqisi2
	add	r3, sp, #40
	cmp	lr, #0
	beq	.L901
.L900:
	ldrb	ip, [sp, #87]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L941
	cmp	r3, #0
	add	ip, sp, #60
	bne	.L905
	ldrb	r3, [sp, #86]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L933
.L1026:
	ldrb	r3, [sp, #88]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L934
	ldrsh	r3, [sp, #92]
	sub	lr, r5, r3
	cmp	lr, #0
	rsblt	lr, lr, #0
	cmp	lr, #120
	bgt	.L896
	sub	r3, r9, r3
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, #120
	bgt	.L896
.L934:
	ldrb	lr, [sp, #107]	@ zero_extendqisi2
	add	r3, sp, #80
	cmp	lr, #0
	beq	.L1023
.L935:
	add	ip, sp, #100
	b	.L907
.L1020:
	add	r5, r5, #200
	cmp	r3, r5
	bgt	.L915
.L914:
	ldr	r3, [r4, #64]
	ldr	r3, [r3, #40]
	tst	r3, #2
	bne	.L916
.L937:
	mov	r6, #1
	b	.L894
.L992:
	ldr	lr, [sp, #36]
	ldr	r3, [sp, #56]
	cmp	lr, r3
	bne	.L896
	ldrb	r3, [sp, #46]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1024
.L928:
	ldrb	lr, [sp, #67]	@ zero_extendqisi2
	add	r1, sp, #40
	mov	r3, r1
	cmp	lr, #0
	bne	.L900
.L901:
	ldr	lr, [r3, #16]
	ldr	r3, [sp, #76]
	cmp	lr, r3
	bne	.L896
	ldrb	r3, [sp, #66]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1025
.L930:
	ldrb	lr, [sp, #87]	@ zero_extendqisi2
	add	r1, sp, #60
	mov	r3, r1
	cmp	lr, #0
	bne	.L941
.L905:
	ldr	lr, [r3, #16]
	ldr	r3, [sp, #96]
	cmp	lr, r3
	bne	.L896
	ldrb	r3, [sp, #86]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1026
.L933:
	add	r1, sp, #80
	mov	r3, r1
	b	.L904
.L909:
	cmp	r7, #0
	bne	.L912
	sub	r3, r6, #1
	cmp	r3, #1
	bls	.L1027
	sub	r3, r6, #4
	cmp	r10, #0
	clz	r3, r3
	lsr	r3, r3, #5
	moveq	r3, #0
	cmp	r3, #0
	beq	.L894
	b	.L896
.L936:
	add	r1, sp, #100
	b	.L907
.L1002:
	movw	r7, #:lower16:.LANCHOR1
	movt	r7, #:upper16:.LANCHOR1
	ldrb	r3, [r7, #5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L848
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L1028
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #1382
	bl	warn_slowpath_fmt
	strb	r6, [r7, #5]
	b	.L848
.L1000:
	movw	r6, #:lower16:.LANCHOR1
	movt	r6, #:upper16:.LANCHOR1
	ldrb	r3, [r6, #6]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L846
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L1028+4
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #1870
	bl	warn_slowpath_fmt
	strb	r5, [r6, #6]
	b	.L846
.L1001:
	movw	r0, #:lower16:.LC6
	movw	r1, #1873
	movt	r0, #:upper16:.LC6
	bl	warn_slowpath_null
	b	.L847
.L912:
	cmp	r6, #1
	bne	.L894
	b	.L918
.L911:
	cmp	r7, #0
	bne	.L997
	cmp	r10, #0
	bne	.L896
.L997:
	mov	r6, #4
	b	.L894
.L939:
	mov	r1, #0
	mov	r3, r1
	b	.L920
.L1029:
	.align	2
.L1028:
	.word	.LANCHOR0+252
	.word	.LANCHOR0+272
	.fnend
	.size	wcd9xxx_codec_get_plug_type.constprop.10, .-wcd9xxx_codec_get_plug_type.constprop.10
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_report_plug, %function
wcd9xxx_report_plug:
	.fnstart
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	mov	r5, r2
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	mov	r9, r1
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #320]
	.pad #100
	sub	sp, sp, #100
	ldr	r6, [r3, #112]
	cmp	r6, #1
	beq	.L1137
.L1031:
	movw	r0, #1250
	bl	jiffies_to_msecs
	mov	r1, r0
	ldr	r0, .L1154
	bl	__pm_wakeup_event
	cmp	r9, #0
	beq	.L1138
	ldr	r2, [r4, #64]
	ldr	r3, [r4, #160]
	ldrb	r1, [r2, #37]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1136
	ldrb	r1, [r4, #280]	@ zero_extendqisi2
	cmp	r5, #3
	cmpeq	r1, #2
	beq	.L1038
	cmp	r3, #0
	cmpne	r5, r3
	bne	.L1134
.L1136:
	add	r10, r4, #348
.L1037:
	orr	r3, r5, r3
	cmp	r5, #1
	str	r3, [r4, #160]
	moveq	r3, #2
	strbeq	r3, [r4, #280]
	beq	.L1041
	cmp	r5, #256
	moveq	r3, #4
	strbeq	r3, [r4, #280]
	beq	.L1041
.L1042:
	cmp	r5, #3
	beq	.L1139
	cmp	r5, #4
	moveq	r3, #3
	strbeq	r3, [r4, #280]
	beq	.L1041
	movw	r3, #515
	cmp	r5, r3
	beq	.L1140
.L1041:
	ldrb	r3, [r4, #504]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1045
	ldr	r3, [r4, #508]
	cmp	r3, #0
	beq	.L1045
	ldr	r2, [r4, #64]
	mov	r1, #1
	ldr	r0, [r4, #324]
	ldr	r2, [r2, #8]
	blx	r3
.L1045:
	ldrb	r3, [r4, #512]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1046
	movw	r3, #:lower16:.LANCHOR2
	movt	r3, #:upper16:.LANCHOR2
	ldr	r3, [r3, #128]
	cmp	r3, #0
	bne	.L1141
.L1046:
	movw	r0, #:lower16:.LC39
	ldr	r3, [r4, #160]
	mov	r2, r5
	ldr	r1, .L1154+4
	movt	r0, #:upper16:.LC39
	add	r5, r4, #332
	bl	printk
	ldr	r6, [r4, #160]
	mov	r1, #2
	ldr	r0, [r4, #320]
	ubfx	r2, r6, #1, #1
	bl	wcd9xxx_resmgr_cond_update_cond
	and	r2, r6, #1
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_cond_update_cond
	mov	r1, r6
	movw	r2, #967
	mov	r0, r10
	bl	snd_soc_jack_report_no_dapm
	ldr	r7, [r4, #324]
	movw	r1, #429
	mov	r0, r7
	bl	snd_soc_read
	mov	r6, r0
	mov	r1, r5
	mov	r0, #3
	bl	_test_and_clear_bit
	cmp	r0, #0
	bne	.L1142
.L1057:
	mov	r1, r5
	mov	r0, #2
	bl	_test_and_clear_bit
	cmp	r0, #0
	bne	.L1143
.L1058:
	mov	r1, r5
	mov	r0, #1
	bl	_test_and_clear_bit
	cmp	r0, #0
	bne	.L1059
	mov	r1, r5
	bl	_test_and_clear_bit
	cmp	r0, #0
	bne	.L1061
.L1036:
	ldr	r3, [r4, #64]
	ldrb	r3, [r3, #36]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1144
.L1030:
	add	sp, sp, #100
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1059:
	mov	r3, #16
	movw	r1, #427
	mov	r2, r3
	mov	r0, r7
	bl	snd_soc_update_bits
	mov	r1, r5
	mov	r0, #0
	bl	_test_and_clear_bit
	cmp	r0, #0
	bne	.L1061
.L1060:
	add	r6, r6, #1
	mov	r1, #1000
	and	r6, r6, #255
	mul	r1, r1, r6
	mov	r0, r1
	bl	usleep_range
	ldr	r3, [r4, #64]
	ldrb	r3, [r3, #36]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1030
.L1144:
	mov	r3, #0
	mov	r2, #1
	ldr	r0, [r4, #324]
	movw	r1, #330
	bl	snd_soc_update_bits
	ldr	r3, [r4, #64]
	ldr	r3, [r3, #32]
	cmp	r3, #0
	bne	.L1145
	cmp	r9, #0
	movw	r1, #330
	ldr	r0, [r4, #324]
	movne	r2, #108
	moveq	r2, #110
	bl	snd_soc_write
.L1065:
	mov	r3, #1
	movw	r1, #330
	ldr	r0, [r4, #324]
	mov	r2, r3
	bl	snd_soc_update_bits
	b	.L1030
.L1143:
	mov	r3, #128
	movw	r1, #433
	mov	r2, r3
	mov	r0, r7
	bl	snd_soc_update_bits
	b	.L1058
.L1142:
	mov	r3, #192
	movw	r1, #439
	mov	r2, r3
	mov	r0, r7
	bl	snd_soc_update_bits
	b	.L1057
.L1061:
	mov	r3, #32
	mov	r0, r7
	mov	r2, r3
	movw	r1, #427
	bl	snd_soc_update_bits
	b	.L1060
.L1138:
	ldr	r3, [r4, #160]
	add	r0, r4, #4
	bic	r3, r3, r5
	str	r3, [r4, #160]
	bl	cancel_delayed_work_sync
	cmp	r0, #0
	bne	.L1146
	ldr	r2, [r4, #56]
	cmp	r2, #0
	bne	.L1147
.L1034:
	ldrb	r3, [r4, #504]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1035
.L1152:
	ldr	r3, [r4, #508]
	cmp	r3, #0
	beq	.L1035
	ldr	ip, [r4, #64]
	mov	r2, #0
	mov	r1, r2
	ldr	r0, [r4, #324]
	strb	r2, [r4, #504]
	ldr	r2, [ip, #8]
	blx	r3
.L1035:
	mov	r6, #0
	movw	r0, #:lower16:.LC37
	ldr	r3, [r4, #160]
	mov	r2, r5
	ldr	r1, .L1154+4
	movt	r0, #:upper16:.LC37
	str	r6, [r4, #516]
	str	r6, [r4, #520]
	bl	printk
	ldr	r5, [r4, #160]
	mov	r1, #2
	ldr	r0, [r4, #320]
	ubfx	r2, r5, #1, #1
	bl	wcd9xxx_resmgr_cond_update_cond
	and	r2, r5, #1
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_cond_update_cond
	mov	r1, r5
	movw	r2, #967
	add	r0, r4, #348
	bl	snd_soc_jack_report_no_dapm
	mov	r0, r4
	bl	wcd9xxx_set_and_turnoff_hph_padac
	ldr	r3, [r4, #532]
	mov	r1, #128
	mov	r0, r4
	ldr	r2, [r3, #28]
	bl	__hphocp_off_report
	ldr	r3, [r4, #532]
	mov	r1, #64
	mov	r0, r4
	ldr	r2, [r3, #24]
	bl	__hphocp_off_report
	strb	r6, [r4]
	strb	r6, [r4, #280]
	b	.L1036
.L1145:
	cmp	r9, #0
	movw	r1, #330
	ldr	r0, [r4, #324]
	movne	r2, #104
	moveq	r2, #106
	bl	snd_soc_write
	b	.L1065
.L1141:
	ldr	r1, .L1154+8
	add	r3, sp, #44
	add	r0, sp, #36
	ldr	r2, [r4, #320]
	add	ip, sp, #42
	str	r0, [sp, #48]
	add	r0, sp, #38
	ldr	r8, [r4, #324]
	str	r3, [sp, #56]
	str	ip, [sp, #52]
	add	ip, sp, #40
	ldr	r6, [r2, #112]
	str	r0, [sp, #60]
	add	r0, sp, #46
	ldrd	r2, [r1]
	cmp	r6, #1
	strd	r2, [sp]
	ldrd	r2, [r1, #8]
	str	ip, [sp, #64]
	str	r0, [sp, #68]
	strd	r2, [sp, #8]
	ldrd	r2, [r1, #16]
	strd	r2, [sp, #16]
	ldrd	r2, [sp]
	strd	r2, [sp, #72]
	ldrd	r2, [sp, #8]
	strd	r2, [sp, #80]
	add	r3, r4, #516
	str	r3, [sp, #8]
	add	r3, r4, #520
	str	r3, [sp, #24]
	ldrd	r2, [sp, #16]
	strd	r2, [sp, #88]
	beq	.L1148
.L1047:
	ldr	r3, [r4, #68]
	cmp	r3, #0
	beq	.L1046
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L1046
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L1046
	add	r3, r4, #520
	clz	r2, r3
	add	r3, r4, #516
	lsr	r2, r2, #5
	cmp	r3, #0
	moveq	r6, #1
	movne	r6, r2
	cmp	r6, #0
	bne	.L1046
	add	r3, r8, #20
	mov	r0, r3
	str	r3, [sp, #16]
	bl	mutex_lock
	ldr	r3, [r4, #64]
	mov	r2, r6
	mov	r1, #1
	ldr	r0, [r4, #324]
	ldr	r3, [r3, #16]
	blx	r3
	movw	r1, #974
	mov	r0, r8
	bl	snd_soc_read
	ands	r3, r0, #4
	str	r3, [sp]
	beq	.L1149
.L1049:
	ldr	r3, [r4, #68]
	add	r6, sp, #72
	mov	r1, #0
	mov	r0, r4
	mov	r7, r6
	add	fp, sp, #48
	ldr	r3, [r3, #28]
	blx	r3
	str	r5, [sp, #28]
.L1052:
	ldrb	r3, [r7, #3]	@ zero_extendqisi2
	mov	r0, r8
	ldrb	r2, [r7, #2]	@ zero_extendqisi2
	ldrh	r1, [r7]
	bl	snd_soc_update_bits
	ldr	r3, [r4, #68]
	mov	r0, r8
	cmp	r3, #0
	beq	.L1050
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1050
	blx	r3
.L1051:
	mov	r1, #125
	mov	r0, #25
	bl	usleep_range
	mov	r2, #0
	mov	r1, #1
	ldr	r5, [fp], #4
	mov	r0, r4
	add	r7, r7, #4
	bl	__wcd9xxx_codec_sta_dce.constprop.23
	add	r3, sp, #88
	cmp	r3, r7
	strh	r0, [r5]	@ movhi
	bne	.L1052
	ldr	r3, [r4, #68]
	mov	r1, #1
	mov	r0, r4
	mov	r7, #4
	ldr	r5, [sp, #28]
	ldr	r3, [r3, #28]
	blx	r3
	b	.L1055
.L1151:
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1053
	blx	r3
.L1054:
	mov	r1, #125
	mov	r0, #25
	bl	usleep_range
	add	r3, sp, #48
	mov	r2, #0
	ldr	fp, [r3, r7, lsl #2]
	mov	r1, #1
	mov	r0, r4
	bl	__wcd9xxx_codec_sta_dce.constprop.23
	cmp	r7, #5
	add	r6, r6, #4
	mov	r7, #5
	strh	r0, [fp]	@ movhi
	beq	.L1150
.L1055:
	ldrb	r3, [r6, #19]	@ zero_extendqisi2
	mov	r0, r8
	ldrb	r2, [r6, #18]	@ zero_extendqisi2
	ldrh	r1, [r6, #16]
	bl	snd_soc_update_bits
	ldr	r3, [r4, #68]
	mov	r0, r8
	cmp	r3, #0
	bne	.L1151
.L1053:
	mov	r3, #128
	movw	r1, #334
	mov	r2, r3
	mov	r0, r8
	bl	snd_soc_update_bits
	b	.L1054
.L1139:
	mov	r3, #1
	strb	r3, [r4]
	strb	r3, [r4, #280]
	strb	r3, [r4, #528]
	b	.L1041
.L1147:
	mov	r1, r9
	add	r0, r4, #420
	bl	snd_soc_jack_report_no_dapm
	ldr	r3, [r4, #56]
	bic	r3, r3, #133169152
	bic	r3, r3, #524288
	str	r3, [r4, #56]
	b	.L1034
.L1146:
	ldr	r3, [r4, #320]
	ldr	r0, [r3, #4]
	bl	wcd9xxx_unlock_sleep
	ldrb	r3, [r4, #504]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1035
	b	.L1152
.L1150:
	ldr	r3, [r4, #68]
	mov	r1, #2
	mov	r0, r4
	ldr	r3, [r3, #28]
	blx	r3
	ldr	r0, [sp, #16]
	bl	mutex_unlock
	ldr	r3, [r4, #64]
	mov	r2, #0
	mov	r1, r2
	ldr	r0, [r4, #324]
	ldr	r3, [r3, #16]
	blx	r3
	ldr	r3, [sp]
	cmp	r3, #0
	beq	.L1153
.L1056:
	ldr	ip, [r4, #68]
	add	r1, sp, #42
	add	r0, sp, #36
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #24]
	ldr	r6, [ip, #32]
	blx	r6
	b	.L1046
.L1137:
	movw	r7, #:lower16:.LANCHOR1
	movt	r7, #:upper16:.LANCHOR1
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1031
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L1154+4
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	mov	r1, #832
	bl	warn_slowpath_fmt
	strb	r6, [r7, #7]
	b	.L1031
.L1050:
	mov	r3, #128
	movw	r1, #334
	mov	r2, r3
	mov	r0, r8
	bl	snd_soc_update_bits
	b	.L1051
.L1140:
	mov	r2, #1
	mov	r3, #5
	strb	r2, [r4]
	strb	r3, [r4, #280]
	b	.L1041
.L1134:
	ldrb	r1, [r4, #504]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L1039
	ldr	r6, [r4, #508]
	sub	r3, r3, #3
	clz	r3, r3
	lsr	r3, r3, #5
	cmp	r6, #0
	moveq	r3, #0
	cmp	r3, #0
	beq	.L1039
	mov	r3, #0
	ldr	r0, [r4, #324]
	mov	r1, r3
	strb	r3, [r4, #504]
	ldr	r2, [r2, #8]
	blx	r6
.L1039:
	movw	r0, #:lower16:.LC38
	ldr	r1, .L1154+4
	add	r10, r4, #348
	ldr	r2, [r4, #160]
	movt	r0, #:upper16:.LC38
	bl	printk
	mov	ip, #0
	movw	r3, #967
	mov	r1, r10
	mov	r2, ip
	mov	r0, r4
	str	ip, [r4, #516]
	str	ip, [r4, #520]
	bl	wcd9xxx_jack_report
	ldr	r3, [r4, #160]
	bic	r3, r3, #772
	bic	r3, r3, #3
	b	.L1037
.L1038:
	orr	r3, r3, #3
	add	r10, r4, #348
	str	r3, [r4, #160]
	b	.L1042
.L1153:
	mov	r2, #4
	movw	r1, #974
	ldr	r0, [r4, #324]
	bl	snd_soc_update_bits
	b	.L1056
.L1149:
	mov	r3, #4
	movw	r1, #974
	ldr	r0, [r4, #324]
	mov	r2, r3
	bl	snd_soc_update_bits
	b	.L1049
.L1148:
	movw	r7, #:lower16:.LANCHOR1
	movt	r7, #:upper16:.LANCHOR1
	ldrb	r3, [r7, #8]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1047
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	add	r3, r1, #24
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #4870
	bl	warn_slowpath_fmt
	strb	r6, [r7, #8]
	b	.L1047
.L1155:
	.align	2
.L1154:
	.word	.LANCHOR2+8
	.word	.LANCHOR0+300
	.word	.LANCHOR0+320
	.fnend
	.size	wcd9xxx_report_plug, .-wcd9xxx_report_plug
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_find_plug_and_report, %function
wcd9xxx_find_plug_and_report:
	.fnstart
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	mov	r5, r1
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #320]
	.pad #132
	sub	sp, sp, #132
	ldr	r6, [r3, #112]
	cmp	r6, #1
	beq	.L1247
.L1157:
	cmp	r5, #2
	beq	.L1248
	cmp	r5, #4
	beq	.L1249
	cmp	r5, #1
	bne	.L1163
	ldr	r3, [r4, #64]
	ldrb	r2, [r3, #55]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1250
.L1166:
	mov	r2, #3
	mov	r1, #1
	mov	r0, r4
	bl	wcd9xxx_report_plug
.L1196:
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_lock
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_bandgap
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_clk_block
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_unlock
	mov	r0, #100
	bl	msleep
	ldr	r3, [r4, #336]
	tst	r3, #7
	beq	.L1197
	mov	r3, #0
	mov	r1, #1
	mov	r2, r3
	mov	r0, r4
	bl	__wcd9xxx_switch_micbias
.L1197:
	mov	r0, r4
	add	sp, sp, #132
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	wcd9xxx_start_hs_polling
.L1249:
	ldr	r3, [r4, #64]
	ldrb	r1, [r3, #37]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L1161
	ldrb	r3, [r4, #280]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1251
	cmp	r3, #2
	beq	.L1252
.L1161:
	mov	r2, #256
	mov	r1, #1
	mov	r0, r4
.L1245:
	bl	wcd9xxx_report_plug
	mov	r0, r4
	add	sp, sp, #132
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	wcd9xxx_cleanup_hs_polling
.L1248:
	ldrb	r3, [r4, #280]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r2, #1
	moveq	r0, r4
	moveq	r1, r2
	beq	.L1245
.L1159:
	movw	r2, #:lower16:.LC40
	movw	r0, #:lower16:.LC6
	str	r5, [sp]
	movt	r2, #:upper16:.LC40
	movt	r0, #:upper16:.LC6
	movw	r1, #2359
	bl	warn_slowpath_fmt
	add	sp, sp, #132
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1163:
	cmp	r5, #3
	ldrb	r3, [r4, #280]	@ zero_extendqisi2
	bne	.L1159
	ldr	r2, [r4, #64]
	ldrb	r2, [r2, #37]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1198
	cmp	r3, #0
	bne	.L1199
	mov	r2, #4
	mov	r1, #1
	mov	r0, r4
	bl	wcd9xxx_report_plug
.L1199:
	mov	r0, r4
	bl	wcd9xxx_cleanup_hs_polling
	mov	r2, #1
	mov	r0, r4
	mov	r1, r2
	mov	r3, #0
	strb	r2, [r4, #317]
	mov	r2, #2
.L1246:
	add	sp, sp, #132
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	wcd9xxx_enable_hs_detect
.L1250:
	mov	r2, #8
	strb	r2, [r4, #529]
	ldr	r2, [r3, #12]
	sub	r2, r2, #1
	cmp	r2, #1
	bhi	.L1166
	movw	r1, #974
	ldr	r0, [r4, #324]
	ldr	r6, [r3, #4]
	bl	snd_soc_read
	ldr	r3, [r4, #64]
	and	r2, r0, #4
	str	r2, [sp, #40]
	ldr	r2, [r3, #48]
	tst	r2, #8
	bne	.L1253
.L1167:
	ldr	r2, [r3, #12]
.L1169:
	cmp	r2, #2
	beq	.L1254
	ldr	r3, [sp, #40]
	cmp	r3, #0
	bne	.L1172
	mov	r3, #4
	movw	r1, #974
	ldr	r0, [r4, #324]
	mov	r2, r3
	bl	snd_soc_update_bits
.L1172:
	ldrsh	r3, [r6, #48]	@ unaligned
	ldrsh	r7, [r4, #72]
	ldr	r9, [r4, #96]
	str	r3, [sp, #12]
	mov	r3, #0
	str	r3, [sp, #28]
	ldrsh	r10, [r6, #40]	@ unaligned
	str	r3, [sp, #36]
.L1201:
	ldr	r0, [r4, #320]
	movw	r3, #:lower16:.LANCHOR1
	movw	r5, #:lower16:jiffies
	movt	r3, #:upper16:.LANCHOR1
	movw	r2, #:lower16:.LC7
	movt	r2, #:upper16:.LC7
	movt	r5, #:upper16:jiffies
	str	r3, [sp, #32]
	mov	r3, #1
	add	r0, r0, #136
	str	r3, [sp, #16]
	str	r5, [sp, #24]
	str	r2, [sp, #44]
	bl	mutex_lock
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_bandgap
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_clk_block
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_unlock
	movw	r0, #5000
	bl	msecs_to_jiffies
	ldr	r3, [r5]
	add	r3, r0, r3
	str	r3, [sp, #20]
.L1173:
	ldrd	r2, [sp, #20]
	ldr	r3, [r3]
	sub	r3, r2, r3
	cmp	r3, #0
	blt	.L1244
	ldr	r3, [r4, #64]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L1255
	ldrb	r3, [r3, #36]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1256
	movw	r2, #:lower16:.LC32
	movw	r0, #:lower16:.LC6
	str	r3, [sp, #16]
	movt	r0, #:upper16:.LC6
	movt	r2, #:upper16:.LC32
	movw	r1, #1954
	bl	warn_slowpath_fmt
	ldr	r0, [r4, #320]
.L1176:
	add	r0, r0, #136
	bl	mutex_lock
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_put_clk_block
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_put_bandgap
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_unlock
	ldr	r3, [sp, #36]
	cmp	r3, #0
	bne	.L1257
	ldr	r3, [r4, #64]
	ldr	r2, [r3, #12]
	cmp	r2, #2
	beq	.L1258
	ldr	r3, [sp, #40]
	cmp	r3, #0
	bne	.L1194
	mov	r2, #4
	movw	r1, #974
	ldr	r0, [r4, #324]
	bl	snd_soc_update_bits
.L1194:
	ldr	r3, [sp, #16]
	cmp	r3, #0
	beq	.L1166
	movw	r2, #515
	mov	r1, #1
	mov	r0, r4
	bl	wcd9xxx_report_plug
	b	.L1196
.L1198:
	cmp	r3, #0
	bne	.L1200
	mov	r2, #1
	mov	r0, r4
	mov	r1, r2
	bl	wcd9xxx_report_plug
.L1200:
	mov	r0, r4
	bl	wcd9xxx_cleanup_hs_polling
	mov	r2, #1
	mov	r0, r4
	mov	r1, r2
	mov	r3, #0
	strb	r2, [r4, #317]
	mov	r2, #3
	b	.L1246
.L1247:
	movw	r7, #:lower16:.LANCHOR1
	movt	r7, #:upper16:.LANCHOR1
	ldrb	r3, [r7, #9]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1157
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L1265
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #2269
	bl	warn_slowpath_fmt
	strb	r6, [r7, #9]
	b	.L1157
.L1252:
	mov	r2, #1
	mov	r0, r4
	bl	wcd9xxx_report_plug
	b	.L1161
.L1264:
	ldr	r3, [sp, #16]
	cmp	r3, #0
	beq	.L1173
.L1244:
	ldr	r0, [r4, #320]
	b	.L1176
.L1256:
	movw	r1, #331
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ubfx	r0, r0, #2, #1
.L1174:
	cmp	r0, #0
	ldr	r0, [r4, #320]
	bne	.L1206
	ldr	r6, [r0, #112]
	ldr	r5, [r4, #324]
	cmp	r6, #1
	beq	.L1259
.L1177:
	movw	r1, #510
	mov	r0, r5
	bl	snd_soc_read
	mov	r6, r0
	mov	r3, #2
	mov	r2, #18
	movw	r1, #510
	mov	r0, r5
	bl	snd_soc_update_bits
	movw	r1, #1100
	mov	r0, #1000
	bl	usleep_range
	movw	r1, #435
	mov	r0, r5
	bl	snd_soc_read
	uxth	r2, r6
	movw	r1, #510
	mov	r0, r5
	bl	snd_soc_write
	ldr	r2, [sp, #28]
	add	r1, r4, #144
	mov	r0, r4
	bl	wcd9xxx_mbhc_setup_hs_polling
	ldrsh	r2, [r4, #76]
	sub	r3, r0, r7
	mul	r3, r9, r3
	sub	r2, r2, r7
	sdiv	r3, r3, r2
	sxth	r3, r3
	cmp	r3, r10
	movlt	r3, #2
	strlt	r3, [sp, #64]
	blt	.L1180
	ldr	r2, [sp, #12]
	cmp	r3, r2
	movlt	r3, #1
	movge	r3, #3
	str	r3, [sp, #64]
.L1180:
	mov	r6, #0
	mov	fp, #2
	str	r9, [sp, #8]
.L1187:
	ldr	r2, [r4, #320]
	ldr	r8, [r4, #324]
	ldr	r3, [r4, #532]
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #16]
	bl	wcd9xxx_disable_irq
	mov	r3, #0
	mov	r0, r8
	mov	r2, #2
	movw	r1, #974
	bl	snd_soc_update_bits
	ldr	r3, [r4, #64]
	ldrb	r3, [r3, #53]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1260
.L1181:
	mov	r3, #8
	mov	r1, #988
	mov	r2, r3
	mov	r0, r8
	bl	snd_soc_update_bits
	mov	r2, #4
	mov	r1, #960
	mov	r0, r8
	bl	snd_soc_write
	mov	r3, #0
	mov	r2, #8
	mov	r1, #988
	mov	r0, r8
	bl	snd_soc_update_bits
	ldr	r3, [r4, #64]
	ldrb	r3, [r3, #53]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1261
.L1182:
	ldr	r1, [r4, #84]
	mov	r0, r1
	bl	usleep_range
	mov	r2, #4
	mov	r1, #960
	mov	r0, r8
	bl	snd_soc_write
	ldr	r1, [r4, #88]
	mov	r0, r1
	bl	usleep_range
	movw	r1, #973
	mov	r0, r8
	bl	snd_soc_read
	mov	r9, r0
	mov	r1, #972
	mov	r0, r8
	bl	snd_soc_read
	mov	r3, #2
	uxtb	r5, r0
	mov	r2, r3
	movw	r1, #974
	mov	r0, r8
	bl	snd_soc_update_bits
	ldr	r2, [r4, #320]
	orr	r5, r5, r9, lsl #8
	ldr	r3, [r4, #532]
	sxth	r5, r5
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #16]
	bl	wcd9xxx_enable_irq
	ldr	r1, [sp, #8]
	sub	r3, r5, r7
	ldrsh	r2, [r4, #76]
	mul	r3, r1, r3
	sub	r5, r2, r7
	sdiv	r3, r3, r5
	sxth	r3, r3
	cmp	r10, r3
	ble	.L1262
	add	r3, sp, #48
	add	r3, r3, r6
	str	fp, [r3, #36]
.L1185:
	ldr	r3, [r4, #320]
	ldr	r5, [r4, #324]
	ldr	r8, [r3, #112]
	cmp	r8, #1
	beq	.L1263
.L1186:
	movw	r1, #510
	mov	r0, r5
	bl	snd_soc_read
	mov	r8, r0
	mov	r3, #2
	mov	r2, #18
	movw	r1, #510
	mov	r0, r5
	add	r6, r6, #20
	bl	snd_soc_update_bits
	movw	r1, #1100
	mov	r0, #1000
	bl	usleep_range
	movw	r1, #435
	mov	r0, r5
	bl	snd_soc_read
	uxth	r2, r8
	mov	r0, r5
	movw	r1, #510
	bl	snd_soc_write
	cmp	r6, #60
	bne	.L1187
	ldr	r9, [sp, #8]
	ldr	r3, [sp, #64]
	ldr	r2, [sp, #84]
	cmp	r3, r2
	bne	.L1211
	ldr	r2, [sp, #104]
	cmp	r3, r2
	bne	.L1211
	ldr	r2, [sp, #124]
	cmp	r2, r3
	bne	.L1211
	cmp	r2, #1
	beq	.L1264
	cmp	r2, #2
	bne	.L1190
	ldr	r3, [r4, #64]
	ldr	r3, [r3, #56]
	cmp	r3, #1
	beq	.L1191
.L1211:
	mov	r3, #0
	str	r3, [sp, #16]
	b	.L1173
.L1262:
	ldr	r2, [sp, #12]
	cmp	r2, r3
	add	r3, sp, #48
	add	r3, r3, r6
	movgt	r2, #1
	strgt	r2, [r3, #36]
	bgt	.L1185
	mov	r2, #3
	str	r2, [r3, #36]
	b	.L1185
.L1261:
	mov	r3, #2
	mov	r1, #988
	mov	r2, r3
	mov	r0, r8
	bl	snd_soc_update_bits
	b	.L1182
.L1260:
	mov	r3, #0
	mov	r2, #2
	mov	r1, #988
	mov	r0, r8
	bl	snd_soc_update_bits
	b	.L1181
.L1255:
	bl	gpio_get_value_cansleep
	ldr	r3, [r4, #64]
	ldr	r3, [r3, #32]
	subs	r0, r3, r0
	movne	r0, #1
	b	.L1174
.L1263:
	ldr	r3, [sp, #32]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1186
	movw	r0, #:lower16:.LC6
	ldr	r3, .L1265+4
	movw	r1, #1382
	movt	r0, #:upper16:.LC6
	ldr	r2, [sp, #44]
	bl	warn_slowpath_fmt
	ldr	r3, [sp, #32]
	strb	r8, [r3, #5]
	b	.L1186
.L1251:
	mov	r2, #3
	mov	r0, r4
	bl	wcd9xxx_report_plug
	b	.L1161
.L1190:
	cmp	r2, #3
	bne	.L1211
	ldr	r3, [r4, #64]
	ldr	r3, [r3, #56]
	cmp	r3, #2
	bne	.L1211
.L1191:
	mov	r3, #0
	ldr	r0, [r4, #320]
	str	r3, [sp, #16]
	b	.L1176
.L1259:
	ldr	r3, [sp, #32]
	ldrb	r3, [r3, #5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1177
	movw	r0, #:lower16:.LC6
	ldr	r3, .L1265+4
	movw	r1, #1382
	movt	r0, #:upper16:.LC6
	ldr	r2, [sp, #44]
	bl	warn_slowpath_fmt
	ldr	r3, [sp, #32]
	strb	r6, [r3, #5]
	b	.L1177
.L1253:
	ldrh	r1, [r4, #152]
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ands	r7, r0, #128
	ldr	r3, [r4, #64]
	bne	.L1167
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #12]
	cmp	r1, r2
	beq	.L1169
	ldr	r6, [r4, #324]
	mov	r3, #72
	mov	r2, #120
	movw	r1, #974
	str	r5, [sp, #28]
	mov	r10, r7
	movw	r9, #1800
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r3, r7
	mov	r2, r5
	ldrh	r1, [r4, #148]
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r3, r7
	mov	r2, r5
	movw	r1, #989
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r3, #240
	ldrh	r1, [r4, #148]
	mov	r0, r6
	mov	r2, r3
	bl	snd_soc_update_bits
	mov	r3, r7
	mov	r0, r6
	str	r5, [sp, #36]
	mov	r2, #16
	mov	r1, #336
	bl	snd_soc_update_bits
	movw	r3, #650
	ldrsh	r7, [r4, #74]
	str	r3, [sp, #12]
	b	.L1201
.L1257:
	ldr	r0, [r4, #64]
	mov	r3, #16
	mov	r1, #336
	ldr	r5, [r4, #324]
	mov	r2, r3
	ldr	r6, [r0, #4]
	mov	r0, r5
	bl	snd_soc_update_bits
	ldrh	r1, [r4, #148]
	mov	r0, r5
	mov	r2, #96
	ldr	r3, [r6, #16]	@ unaligned
	lsl	r3, r3, #5
	bl	snd_soc_update_bits
	ldrh	r1, [r4, #148]
	mov	r0, r5
	mov	r3, #0
	mov	r2, #128
	bl	snd_soc_update_bits
	ldrh	r1, [r4, #148]
	mov	r0, r5
	mov	r3, #0
	mov	r2, #16
	bl	snd_soc_update_bits
	ldrb	r3, [r6, #62]	@ zero_extendqisi2
	mov	r0, r5
	mov	r2, #120
	movw	r1, #974
	lsl	r3, r3, #3
	bl	snd_soc_update_bits
	b	.L1194
.L1258:
	ldr	r3, [r4, #508]
	cmp	r3, #0
	beq	.L1194
	ldr	r0, [r4, #324]
	ldr	r1, [sp, #36]
	blx	r3
	b	.L1194
.L1254:
	ldr	r3, [r4, #508]
	cmp	r3, #0
	beq	.L1166
	mov	r1, #1
	ldr	r0, [r4, #324]
	blx	r3
	b	.L1172
.L1206:
	mov	r3, #0
	str	r3, [sp, #16]
	b	.L1176
.L1266:
	.align	2
.L1265:
	.word	.LANCHOR0+372
	.word	.LANCHOR0+252
	.fnend
	.size	wcd9xxx_find_plug_and_report, .-wcd9xxx_find_plug_and_report
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_mbhc_decide_swch_plug, %function
wcd9xxx_mbhc_decide_swch_plug:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r3, [r0, #320]
	ldr	r5, [r3, #112]
	cmp	r5, #1
	beq	.L1294
.L1268:
	ldr	r3, [r4, #64]
	ldr	r0, [r4, #324]
	ldr	r3, [r3, #48]
	tst	r3, #2
	bne	.L1295
.L1269:
	mov	r5, #4
	movw	r1, #974
	mov	r3, r5
	mov	r2, r5
	strb	r5, [r4, #529]
	bl	snd_soc_update_bits
	mov	r0, r4
	bl	wcd9xxx_codec_get_plug_type.constprop.10
	mov	r6, r0
	mov	r3, #0
	ldr	r0, [r4, #324]
	mov	r2, r5
	movw	r1, #974
	bl	snd_soc_update_bits
	ldr	r3, [r4, #64]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L1296
.L1271:
	ldrb	r3, [r3, #36]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1297
	movw	r2, #:lower16:.LC32
	movw	r0, #:lower16:.LC6
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	movt	r2, #:upper16:.LC32
	movt	r0, #:upper16:.LC6
	ldr	r8, [sp, #16]
	movw	r1, #1954
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	warn_slowpath_fmt
.L1297:
	movw	r1, #331
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ubfx	r0, r0, #2, #1
	cmp	r0, #0
	bne	.L1267
.L1300:
	cmn	r6, #1
	cmpne	r6, #4
	beq	.L1293
	cmp	r6, #2
	beq	.L1298
	cmp	r6, #3
	beq	.L1293
	mov	r1, r6
	mov	r0, r4
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	wcd9xxx_find_plug_and_report
.L1295:
	ldrh	r1, [r4, #140]
	bl	snd_soc_read
	ands	r5, r0, #128
	bne	.L1299
	ldr	r6, [r4, #324]
	mov	r0, #4
	mov	r3, #72
	mov	r2, #120
	movw	r1, #974
	strb	r0, [r4, #529]
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r3, r5
	mov	r0, r6
	ldrh	r1, [r4, #136]
	mov	r2, #1
	bl	snd_soc_update_bits
	mov	r3, r5
	mov	r0, r6
	mov	r2, #1
	movw	r1, #989
	bl	snd_soc_update_bits
	mov	r3, #240
	mov	r0, r6
	ldrh	r1, [r4, #136]
	mov	r2, r3
	bl	snd_soc_update_bits
	mov	r3, r5
	mov	r2, #16
	mov	r0, r6
	mov	r1, #336
	bl	snd_soc_update_bits
	mov	r1, r5
	mov	r0, r4
	bl	wcd9xxx_codec_cs_get_plug_type
	mov	r6, r0
	ldr	r0, [r4, #64]
	mov	r3, #16
	ldr	r7, [r4, #324]
	mov	r2, r3
	mov	r1, #336
	ldr	r8, [r0, #4]
	mov	r0, r7
	bl	snd_soc_update_bits
	mov	r2, #96
	ldrh	r1, [r4, #136]
	mov	r0, r7
	ldr	r3, [r8, #16]	@ unaligned
	lsl	r3, r3, #5
	bl	snd_soc_update_bits
	mov	r3, r5
	mov	r2, #128
	ldrh	r1, [r4, #136]
	mov	r0, r7
	bl	snd_soc_update_bits
	mov	r3, r5
	mov	r2, #16
	ldrh	r1, [r4, #136]
	mov	r0, r7
	bl	snd_soc_update_bits
	ldrb	r3, [r8, #62]	@ zero_extendqisi2
	mov	r0, r7
	mov	r2, #120
	movw	r1, #974
	lsl	r3, r3, #3
	bl	snd_soc_update_bits
	ldr	r3, [r4, #64]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L1271
.L1296:
	bl	gpio_get_value_cansleep
	ldr	r3, [r4, #64]
	ldr	r3, [r3, #32]
	subs	r0, r3, r0
	movne	r0, #1
	cmp	r0, #0
	beq	.L1300
.L1267:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L1293:
	mov	r0, r4
	add	r6, r4, #284
.L1291:
	bl	wcd9xxx_cleanup_hs_polling
	ldr	r3, [r4, #320]
	ldr	r5, [r3, #112]
	cmp	r5, #1
	beq	.L1301
.L1280:
	mov	r2, #0
	strb	r2, [r4, #316]
	ldr	r0, [r3, #4]
	bl	wcd9xxx_lock_sleep
	movw	r3, #:lower16:system_wq
	mov	r2, r6
	ldrd	r4, [sp]
	movt	r3, #:upper16:system_wq
	ldrd	r6, [sp, #8]
	mov	r0, #4
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	ldr	r1, [r3]
	b	queue_work_on
.L1299:
	ldr	r0, [r4, #324]
	b	.L1269
.L1294:
	movw	r6, #:lower16:.LANCHOR1
	movt	r6, #:upper16:.LANCHOR1
	ldrb	r3, [r6, #10]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1268
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L1302
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #2372
	bl	warn_slowpath_fmt
	strb	r5, [r6, #10]
	b	.L1268
.L1298:
	mov	r2, #1
	mov	r0, r4
	mov	r1, r2
	add	r6, r4, #284
	bl	wcd9xxx_report_plug
	mov	r0, r4
	b	.L1291
.L1301:
	movw	r7, #:lower16:.LANCHOR1
	movt	r7, #:upper16:.LANCHOR1
	ldrb	r2, [r7, #11]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1280
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L1302+4
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #946
	bl	warn_slowpath_fmt
	ldr	r3, [r4, #320]
	strb	r5, [r7, #11]
	b	.L1280
.L1303:
	.align	2
.L1302:
	.word	.LANCHOR0+404
	.word	.LANCHOR0+436
	.fnend
	.size	wcd9xxx_mbhc_decide_swch_plug, .-wcd9xxx_mbhc_decide_swch_plug
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_mbhc_detect_plug_type, %function
wcd9xxx_mbhc_detect_plug_type:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r3, [r0, #320]
	ldr	r5, [r3, #112]
	cmp	r5, #1
	beq	.L1311
.L1305:
	ldr	r3, [r4, #64]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L1312
	ldrb	r3, [r3, #36]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1313
	movw	r2, #:lower16:.LC32
	movw	r0, #:lower16:.LC6
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	movt	r2, #:upper16:.LC32
	movt	r0, #:upper16:.LC6
	ldr	lr, [sp, #12]
	movw	r1, #1954
	add	sp, sp, #16
	b	warn_slowpath_fmt
.L1313:
	movw	r1, #331
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ubfx	r0, r0, #2, #1
.L1307:
	cmp	r0, #0
	bne	.L1304
	mov	r0, r4
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	wcd9xxx_mbhc_decide_swch_plug
.L1312:
	bl	gpio_get_value_cansleep
	ldr	r3, [r4, #64]
	ldr	r3, [r3, #32]
	subs	r0, r3, r0
	movne	r0, #1
	b	.L1307
.L1304:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L1311:
	movw	r6, #:lower16:.LANCHOR1
	movt	r6, #:upper16:.LANCHOR1
	ldrb	r3, [r6, #12]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1305
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L1314
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #2425
	bl	warn_slowpath_fmt
	strb	r5, [r6, #12]
	b	.L1305
.L1315:
	.align	2
.L1314:
	.word	.LANCHOR0+468
	.fnend
	.size	wcd9xxx_mbhc_detect_plug_type, .-wcd9xxx_mbhc_detect_plug_type
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_hs_insert_irq, %function
wcd9xxx_hs_insert_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r1
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r0, [r1, #320]
	ldr	r5, [r1, #324]
	bl	wcd9xxx_resmgr_bcl_lock
	ldr	r2, [r4, #320]
	ldr	r3, [r4, #532]
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #20]
	bl	wcd9xxx_disable_irq
	ldrh	r1, [r4, #136]
	mov	r0, r5
	bl	snd_soc_read
	mov	r7, r0
	movw	r1, #989
	mov	r0, r5
	bl	snd_soc_read
	and	r6, r0, #2
	mov	r3, #0
	mov	r2, #3
	movw	r1, #989
	mov	r0, r5
	bl	snd_soc_update_bits
	ldrh	r1, [r4, #136]
	mov	r3, #0
	mov	r2, #144
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r2, #19
	movw	r1, #510
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r2, #1
	ldrh	r1, [r4, #140]
	mov	r0, r5
	bl	snd_soc_update_bits
	ldr	r3, [r4, #64]
	ldrb	r2, [r3, #37]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1317
	ldrb	r2, [r4, #280]	@ zero_extendqisi2
	cmp	r2, #3
	beq	.L1350
	cmp	r6, #0
	beq	.L1336
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L1351
	ldrb	r3, [r3, #36]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1352
.L1332:
	movw	r2, #:lower16:.LC32
	movw	r0, #:lower16:.LC6
	movt	r0, #:upper16:.LC6
	movt	r2, #:upper16:.LC32
	movw	r1, #1954
	bl	warn_slowpath_fmt
	ldr	r0, [r4, #320]
.L1322:
	bl	wcd9xxx_resmgr_bcl_unlock
	ldrd	r4, [sp]
	mov	r0, #1
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L1317:
	cmp	r6, #0
	bne	.L1353
.L1336:
	.syntax divided
@ 2442 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9xxx-mbhc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	ldrb	r3, [r4, #317]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1354
.L1324:
	.syntax divided
@ 2446 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9xxx-mbhc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	ldrb	r3, [r4, #317]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1325
.L1349:
	ldr	r0, [r4, #320]
	b	.L1322
.L1352:
	movw	r1, #331
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ubfx	r0, r0, #2, #1
.L1331:
	cmp	r0, #0
	ldr	r0, [r4, #320]
	bne	.L1322
	ldr	r5, [r0, #112]
	add	r6, r4, #284
	cmp	r5, #1
	beq	.L1355
.L1333:
	mov	r3, #1
	strb	r3, [r4, #316]
	.syntax divided
@ 959 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9xxx-mbhc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_bcl_unlock
	mov	r0, r6
	bl	cancel_work_sync
	cmp	r0, #0
	beq	.L1334
	ldr	r3, [r4, #320]
	ldr	r0, [r3, #4]
	bl	wcd9xxx_unlock_sleep
.L1334:
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_bcl_lock
.L1348:
	mov	r0, r4
	bl	wcd9xxx_mbhc_decide_swch_plug
	ldr	r0, [r4, #320]
	b	.L1322
.L1325:
	ldr	r3, [r4, #64]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L1356
	ldrb	r3, [r3, #36]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1332
	movw	r1, #331
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ubfx	r0, r0, #2, #1
.L1327:
	cmp	r0, #0
	beq	.L1348
	b	.L1349
.L1354:
	mov	r0, #100
	bl	msleep
	b	.L1324
.L1351:
	bl	gpio_get_value_cansleep
	ldr	r3, [r4, #64]
	ldr	r3, [r3, #32]
	subs	r0, r3, r0
	movne	r0, #1
	b	.L1331
.L1350:
	ldr	r3, [r4, #320]
	add	r6, r4, #284
	ldr	r5, [r3, #112]
	cmp	r5, #1
	beq	.L1357
.L1319:
	mov	r3, #1
	strb	r3, [r4, #316]
	.syntax divided
@ 959 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9xxx-mbhc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_bcl_unlock
	mov	r0, r6
	bl	cancel_work_sync
	cmp	r0, #0
	beq	.L1320
	ldr	r3, [r4, #320]
	ldr	r0, [r3, #4]
	bl	wcd9xxx_unlock_sleep
.L1320:
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_bcl_lock
	tst	r7, #16
	bne	.L1358
	mov	r0, r4
	bl	wcd9xxx_mbhc_detect_plug_type
	ldr	r0, [r4, #320]
	b	.L1322
.L1358:
	mov	r2, #1
	mov	r3, #0
	mov	r1, r2
	mov	r0, r4
	bl	wcd9xxx_enable_hs_detect
	ldr	r0, [r4, #320]
	b	.L1322
.L1353:
	movw	r0, #:lower16:.LC41
	ldr	r1, .L1359
	movt	r0, #:upper16:.LC41
	bl	printk
	b	.L1349
.L1356:
	bl	gpio_get_value_cansleep
	ldr	r3, [r4, #64]
	ldr	r3, [r3, #32]
	subs	r0, r3, r0
	movne	r0, #1
	b	.L1327
.L1355:
	movw	r7, #:lower16:.LANCHOR1
	movt	r7, #:upper16:.LANCHOR1
	ldrb	r3, [r7, #13]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1333
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L1359+4
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #957
	bl	warn_slowpath_fmt
	strb	r5, [r7, #13]
	b	.L1333
.L1357:
	movw	r8, #:lower16:.LANCHOR1
	movt	r8, #:upper16:.LANCHOR1
	ldrb	r3, [r8, #13]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1319
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L1359+4
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #957
	bl	warn_slowpath_fmt
	strb	r5, [r8, #13]
	b	.L1319
.L1360:
	.align	2
.L1359:
	.word	.LANCHOR0+532
	.word	.LANCHOR0+500
	.fnend
	.size	wcd9xxx_hs_insert_irq, .-wcd9xxx_hs_insert_irq
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_mbhc_insert_work, %function
wcd9xxx_mbhc_insert_work:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r3, #0
	mov	r4, r0
	strd	r6, [sp, #8]
	mov	r2, #144
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	ip, [r0, #96]
	ldr	r5, [r0, #100]
	ldrh	r1, [r0, #-88]
	ldr	r6, [ip, #4]
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r0, r5
	mov	r3, #0
	mov	r2, #19
	movw	r1, #510
	bl	snd_soc_update_bits
	mov	r0, r5
	ldrh	r1, [r4, #-84]
	mov	r3, #0
	mov	r2, #1
	bl	snd_soc_update_bits
	ldr	r3, [r4, #308]
	mov	r0, r6
	ldr	r1, [r3, #20]
	bl	wcd9xxx_disable_irq_sync
	ldr	r3, [r4, #96]
	ldr	r5, [r3, #112]
	cmp	r5, #1
	beq	.L1368
.L1362:
	ldr	r3, [r4, #-160]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L1369
	ldrb	r3, [r3, #36]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1370
	movw	r2, #:lower16:.LC32
	movw	r0, #:lower16:.LC6
	movt	r2, #:upper16:.LC32
	movt	r0, #:upper16:.LC6
	movw	r1, #1954
	bl	warn_slowpath_fmt
.L1366:
	mov	r0, r6
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	wcd9xxx_unlock_sleep
.L1370:
	movw	r1, #331
	ldr	r0, [r4, #100]
	bl	snd_soc_read
	ubfx	r0, r0, #2, #1
.L1364:
	cmp	r0, #0
	bne	.L1366
	sub	r0, r4, #224
	bl	wcd9xxx_mbhc_decide_swch_plug
	b	.L1366
.L1369:
	bl	gpio_get_value_cansleep
	ldr	r3, [r4, #-160]
	ldr	r3, [r3, #32]
	subs	r0, r3, r0
	movne	r0, #1
	b	.L1364
.L1368:
	movw	r7, #:lower16:.LANCHOR1
	movt	r7, #:upper16:.LANCHOR1
	ldrb	r3, [r7, #12]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1362
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L1371
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #2425
	bl	warn_slowpath_fmt
	strb	r5, [r7, #12]
	b	.L1362
.L1372:
	.align	2
.L1371:
	.word	.LANCHOR0+468
	.fnend
	.size	wcd9xxx_mbhc_insert_work, .-wcd9xxx_mbhc_insert_work
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_init_and_calibrate, %function
wcd9xxx_init_and_calibrate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r2, #0
	mov	r4, r0
	strd	r6, [sp, #8]
	mov	r1, #1
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r3, [r0, #64]
	.pad #8
	sub	sp, sp, #8
	ldr	r9, [r0, #324]
	ldr	r3, [r3, #16]
	mov	r0, r9
	blx	r3
	ldr	r3, [r4, #64]
	mov	r2, #32768
	movt	r2, 187
	ldr	r6, [r4, #324]
	ldr	r1, [r3, #20]
	cmp	r1, r2
	beq	.L1426
	mov	r2, #31744
	movt	r2, 146
	cmp	r1, r2
	moveq	r10, #1
	bne	.L1515
.L1374:
	ldr	r8, [r3, #4]
	mov	r5, #0
	add	r7, r8, #52
.L1375:
	mov	r3, r5
	mov	r2, #7
	movw	r1, #961
	mov	r0, r6
	bl	snd_soc_update_bits
	add	r5, r5, #1
	ldrsb	r2, [r7], #1
	movw	r1, #962
	mov	r0, r6
	bl	snd_soc_write
	cmp	r5, #8
	bne	.L1375
	ldrb	r3, [r8, #60]	@ zero_extendqisi2
	mov	r2, #7
	movw	r1, #975
	mov	r0, r6
	bl	snd_soc_update_bits
	ldrb	r3, [r8, #3]	@ zero_extendqisi2
	mov	r2, #112
	movw	r1, #966
	mov	r0, r6
	lsl	r3, r3, #4
	bl	snd_soc_update_bits
	ldrb	r3, [r8, #61]	@ zero_extendqisi2
	mov	r2, #15
	movw	r1, #966
	mov	r0, r6
	bl	snd_soc_update_bits
	ldrb	r2, [r8, #4]	@ zero_extendqisi2
	movw	r1, #967
	mov	r0, r6
	bl	snd_soc_write
	mov	r3, #128
	movw	r1, #974
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	ldrb	r3, [r8, #62]	@ zero_extendqisi2
	mov	r2, #120
	movw	r1, #974
	mov	r0, r6
	lsl	r3, r3, #3
	bl	snd_soc_update_bits
	ldr	r3, [r4, #68]
	cmp	r3, #0
	beq	.L1377
	ldr	r3, [r3, #20]
	blx	r3
	cmp	r0, #3
	beq	.L1377
	ldr	r3, [r4, #320]
	ldr	r3, [r3, #36]
	ldrh	r1, [r3, #4]
	cmp	r1, #0
	bne	.L1516
.L1377:
	mov	r3, #2
	movw	r1, #974
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r3, #240
	movw	r1, #335
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	ldrb	r3, [r8, #65]	@ zero_extendqisi2
	mov	r5, #4
	mov	r2, #120
	movw	r1, #975
	mov	r0, r6
	smlabb	r3, r5, r3, r10
	add	r8, r8, r3
	ldrb	r3, [r8, #84]	@ zero_extendqisi2
	lsl	r3, r3, #3
	bl	snd_soc_update_bits
	mov	r3, r5
	mov	r2, r5
	movw	r1, #307
	mov	r0, r6
	bl	snd_soc_update_bits
	ldr	r2, [r4, #320]
	ldr	r5, [r4, #324]
	ldr	r3, [r4, #532]
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #16]
	bl	wcd9xxx_disable_irq
	mov	r3, #0
	mov	r0, r5
	mov	r2, #2
	movw	r1, #974
	bl	snd_soc_update_bits
	ldr	r3, [r4, #88]
	cmp	r3, #0
	beq	.L1517
	ldr	r3, [r4, #92]
	cmp	r3, #0
	beq	.L1518
.L1380:
	ldr	r3, [r4, #68]
	cmp	r3, #0
	beq	.L1381
	ldr	r3, [r3, #40]
	cmp	r3, #0
	beq	.L1381
	mov	r2, #0
	mov	r1, #1
	mov	r0, r5
	blx	r3
.L1381:
	ldrh	r1, [r4, #134]
	mov	r0, r5
	bl	snd_soc_read
	ldr	r3, [r4, #68]
	mov	r6, r0
	cmp	r3, #0
	beq	.L1382
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L1382
	mov	r1, r4
	mov	r0, r5
	blx	r3
.L1383:
	ldr	r3, [r4, #68]
	cmp	r3, #0
	beq	.L1384
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L1384
	mov	r1, r4
	mov	r0, r5
	blx	r3
.L1385:
	mov	r3, #0
	mov	r2, #1
	ldrh	r1, [r4, #140]
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #96
	mov	r1, #272
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r2, #120
	mov	r1, #372
	mov	r0, r5
	bl	snd_soc_write
	ldr	r3, [r4, #68]
	cmp	r3, #0
	beq	.L1386
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L1386
	mov	r1, r4
	mov	r0, r5
	blx	r3
.L1387:
	ldrh	r1, [r4, #140]
	mov	r0, r5
	bl	snd_soc_read
	mov	r3, #1
	ldrh	r1, [r4, #140]
	mov	r8, r0
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r1, #336
	mov	r0, r5
	bl	snd_soc_read
	mov	r7, r0
	mov	r3, #1
	mov	r2, #16
	mov	r1, #336
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r2, #2
	movw	r1, #334
	mov	r0, r5
	bl	snd_soc_write
	ldr	r3, [r4, #68]
	cmp	r3, #0
	beq	.L1388
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1388
	mov	r0, r5
	blx	r3
.L1389:
	mov	r0, #50
	bl	msleep
	mov	r2, #10
	mov	r1, #988
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #2
	mov	r1, #988
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #0
	mov	r1, #1
	mov	r0, r4
	bl	__wcd9xxx_codec_sta_dce.constprop.22
	strh	r0, [r4, #72]	@ movhi
	movw	r1, #974
	mov	r0, r5
	bl	snd_soc_read
	mov	r10, r0
	mov	r3, #72
	mov	r2, #120
	movw	r1, #974
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r2, #10
	mov	r1, #988
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #2
	mov	r1, #988
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #0
	mov	r1, #1
	mov	r0, r4
	bl	__wcd9xxx_codec_sta_dce.constprop.22
	strh	r0, [r4, #74]	@ movhi
	uxth	r2, r10
	movw	r1, #974
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #10
	mov	r1, #988
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #2
	mov	r1, #988
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #0
	mov	r1, #1
	mov	r0, r4
	bl	__wcd9xxx_codec_sta_dce.constprop.23
	strh	r0, [r4, #78]	@ movhi
	uxth	r2, r8
	ldrh	r1, [r4, #140]
	mov	r0, r5
	bl	snd_soc_write
	uxth	r2, r7
	mov	r1, #336
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #10
	mov	r1, #988
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #2
	mov	r1, #988
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #2
	movw	r1, #334
	mov	r0, r5
	bl	snd_soc_write
	ldr	r3, [r4, #68]
	cmp	r3, #0
	beq	.L1390
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1390
	mov	r0, r5
	blx	r3
.L1391:
	mov	r0, #50
	bl	msleep
	mov	r2, #4
	mov	r1, #960
	mov	r0, r5
	bl	snd_soc_write
	ldr	r1, [r4, #88]
	mov	r0, r1
	bl	usleep_range
	movw	r1, #973
	mov	r0, r5
	bl	snd_soc_read
	mov	r7, r0
	mov	r1, #972
	mov	r0, r5
	bl	snd_soc_read
	uxtb	r0, r0
	mov	r2, #10
	mov	r1, #988
	orr	r3, r0, r7, lsl #8
	mov	r0, r5
	strh	r3, [r4, #76]	@ movhi
	bl	snd_soc_write
	mov	r2, #2
	mov	r1, #960
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #2
	mov	r1, #988
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #2
	movw	r1, #334
	mov	r0, r5
	bl	snd_soc_write
	ldr	r3, [r4, #68]
	cmp	r3, #0
	beq	.L1392
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1392
	mov	r0, r5
	blx	r3
.L1393:
	mov	r0, #50
	bl	msleep
	mov	r2, #2
	mov	r1, #960
	mov	r0, r5
	bl	snd_soc_write
	ldr	r1, [r4, #92]
	mov	r0, r1
	bl	usleep_range
	movw	r1, #971
	mov	r0, r5
	bl	snd_soc_read
	mov	r7, r0
	movw	r1, #970
	mov	r0, r5
	bl	snd_soc_read
	uxtb	r0, r0
	mov	r3, #0
	mov	r2, #4
	orr	ip, r0, r7, lsl #8
	movw	r1, #974
	mov	r0, r5
	strh	ip, [r4, #80]	@ movhi
	bl	snd_soc_update_bits
	uxtb	r2, r6
	ldrh	r1, [r4, #134]
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #4
	movw	r1, #334
	mov	r0, r5
	bl	snd_soc_write
	ldr	r3, [r4, #68]
	cmp	r3, #0
	beq	.L1394
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1394
	mov	r0, r5
	blx	r3
.L1395:
	mov	r1, #100
	mov	r0, r1
	bl	usleep_range
	ldr	r3, [r4, #68]
	cmp	r3, #0
	beq	.L1396
	ldr	r3, [r3, #40]
	cmp	r3, #0
	beq	.L1396
	mov	r2, #0
	mov	r0, r5
	mov	r1, r2
	blx	r3
.L1396:
	ldr	r2, [r4, #320]
	ldr	r3, [r4, #532]
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #16]
	bl	wcd9xxx_enable_irq
	mov	r3, #2
	movw	r1, #974
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r0, r4
	bl	wcd9xxx_mbhc_calc_thres
	ldr	r3, [r4, #64]
	mov	r2, #0
	mov	r1, r2
	ldr	r0, [r4, #324]
	ldr	r3, [r3, #16]
	blx	r3
	mov	r0, r4
	bl	wcd9xxx_calibrate_hs_polling
	mov	r3, #1
	ldrh	r1, [r4, #140]
	mov	r0, r9
	mov	r2, r3
	bl	snd_soc_update_bits
	mov	r3, #1
	movw	r1, #510
	mov	r2, r3
	mov	r0, r9
	bl	snd_soc_update_bits
	mov	r2, #65024
	movw	ip, #:lower16:wcd9xxx_correct_swch_plug
	add	lr, r4, #288
	movt	ip, #:upper16:wcd9xxx_correct_swch_plug
	movt	r2, 65535
	mov	r3, #16
	movw	r1, #426
	mov	r0, r9
	str	r2, [r4, #284]
	mov	r2, r3
	str	lr, [r4, #288]
	str	lr, [r4, #292]
	str	ip, [r4, #296]
	bl	snd_soc_update_bits
	ldr	r2, [r4, #320]
	ldr	r3, [r4, #532]
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #24]
	bl	wcd9xxx_enable_irq
	ldr	r2, [r4, #320]
	ldr	r3, [r4, #532]
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #28]
	bl	wcd9xxx_enable_irq
	ldr	r3, [r4, #64]
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L1519
	ldrb	r5, [r3, #36]	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L1520
.L1373:
	mov	r0, r5
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L1520:
	ldr	ip, [r4, #320]
	mov	r3, #2
	movw	r1, #426
	mov	r2, r3
	ldr	r0, [r4, #324]
	ldr	r5, [ip, #4]
	bl	snd_soc_update_bits
	ldr	r1, [r4, #532]
	movw	r3, #:lower16:.LC45
	movw	r2, #:lower16:wcd9xxx_mech_plug_detect_irq
	movt	r3, #:upper16:.LC45
	movt	r2, #:upper16:wcd9xxx_mech_plug_detect_irq
	mov	r0, r5
	ldr	r1, [r1, #32]
	str	r4, [sp]
	bl	wcd9xxx_request_irq
	subs	r5, r0, #0
	bne	.L1521
.L1400:
	ldr	r2, [r4, #64]
	ldr	r3, [r2, #24]
	cmp	r3, #0
	beq	.L1401
	ldr	r0, [r2, #28]
	bl	enable_irq
	mov	r3, #1
	movw	r1, #5000
	ldr	r5, [r4, #324]
	mov	r0, r1
	strb	r3, [r4, #318]
	bl	usleep_range
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_bcl_lock
	add	r0, r4, #4
	bl	cancel_delayed_work_sync
	cmp	r0, #0
	bne	.L1522
.L1402:
	ldr	r3, [r4, #64]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L1523
	ldrb	r3, [r3, #36]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1524
	movw	r2, #:lower16:.LC32
	movw	r0, #:lower16:.LC6
	movt	r2, #:upper16:.LC32
	movt	r0, #:upper16:.LC6
	movw	r1, #1954
	bl	warn_slowpath_fmt
	ldrb	r3, [r4, #280]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1406
.L1407:
	mov	r3, #0
	ldr	r0, [r4, #320]
	mov	r5, r3
	strb	r3, [r4, #318]
	bl	wcd9xxx_resmgr_bcl_unlock
	b	.L1373
.L1516:
	mov	r3, #1
	mov	r2, #3
	mov	r0, r6
	bl	snd_soc_update_bits
	b	.L1377
.L1426:
	mov	r10, #0
	b	.L1374
.L1519:
	movw	ip, #:lower16:.LC42
	movw	r2, #:lower16:wcd9xxx_mech_plug_detect_irq
	ldr	r0, [r3, #28]
	movt	ip, #:upper16:.LC42
	mov	r3, #35
	movt	r2, #:upper16:wcd9xxx_mech_plug_detect_irq
	mov	r1, #0
	str	ip, [sp]
	str	r4, [sp, #4]
	bl	request_threaded_irq
	subs	r5, r0, #0
	ldr	r3, [r4, #64]
	bne	.L1525
	mov	r1, #1
	ldr	r0, [r3, #28]
	bl	irq_set_irq_wake
	subs	r5, r0, #0
	beq	.L1400
	ldr	r3, [r4, #64]
	movw	r0, #:lower16:.LC44
	ldr	r1, .L1532
	movt	r0, #:upper16:.LC44
	ldr	r2, [r3, #28]
	bl	printk
	b	.L1373
.L1394:
	mov	r3, #128
	movw	r1, #334
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L1395
.L1392:
	mov	r3, #128
	movw	r1, #334
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L1393
.L1390:
	mov	r3, #128
	movw	r1, #334
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L1391
.L1388:
	mov	r3, #128
	movw	r1, #334
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L1389
.L1386:
	mov	r3, #4
	movw	r1, #974
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L1387
.L1384:
	ldr	r3, [r4, #64]
	mov	r2, #96
	mov	r0, r5
	ldrh	r1, [r4, #140]
	ldr	r3, [r3, #8]
	lsl	r3, r3, #5
	bl	snd_soc_update_bits
	b	.L1385
.L1382:
	mov	r3, #0
	mov	r2, #64
	ldrh	r1, [r4, #134]
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L1383
.L1517:
	movw	r0, #:lower16:.LC6
	mov	r1, #3920
	movt	r0, #:upper16:.LC6
	bl	warn_slowpath_null
	ldr	r3, [r4, #92]
	cmp	r3, #0
	bne	.L1380
.L1518:
	movw	r0, #:lower16:.LC6
	movw	r1, #3921
	movt	r0, #:upper16:.LC6
	bl	warn_slowpath_null
	b	.L1380
.L1522:
	ldr	r3, [r4, #320]
	ldr	r0, [r3, #4]
	bl	wcd9xxx_unlock_sleep
	b	.L1402
.L1408:
	cmp	r0, #0
	beq	.L1407
.L1406:
	mov	r3, #0
	strb	r3, [r4, #317]
	.syntax divided
@ 3245 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9xxx-mbhc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r3, [r4, #320]
	add	r8, r4, #284
	ldr	r7, [r3, #112]
	cmp	r7, #1
	beq	.L1526
.L1414:
	mov	r3, #1
	strb	r3, [r4, #316]
	.syntax divided
@ 959 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9xxx-mbhc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_bcl_unlock
	mov	r0, r8
	bl	cancel_work_sync
	cmp	r0, #0
	beq	.L1415
	ldr	r3, [r4, #320]
	ldr	r0, [r3, #4]
	bl	wcd9xxx_unlock_sleep
.L1415:
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_bcl_lock
	ldrb	r3, [r4, #280]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1527
	cmp	r3, #4
	beq	.L1528
	cmp	r3, #1
	beq	.L1529
	cmp	r3, #3
	beq	.L1530
	cmp	r3, #5
	bne	.L1407
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1422
	mov	r3, #8
	mov	r1, #988
	ldr	r0, [r4, #324]
	mov	r2, r3
	bl	snd_soc_update_bits
.L1422:
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_lock
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_put_clk_block
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_put_bandgap
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_unlock
	mov	r0, r4
	bl	wcd9xxx_cleanup_hs_polling
	movw	r2, #515
	mov	r1, #0
	mov	r0, r4
	bl	wcd9xxx_report_plug
.L1417:
	mov	r2, #0
	movw	r1, #334
	mov	r0, r5
	bl	snd_soc_write
	mov	r3, #0
	mov	r2, #2
	movw	r1, #974
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #1
	ldrh	r1, [r4, #140]
	mov	r0, r5
	mov	r2, r3
	bl	snd_soc_update_bits
	mov	r3, #1
	movw	r1, #510
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #1
	ldrh	r1, [r4, #140]
	mov	r0, r5
	mov	r2, r3
	bl	snd_soc_update_bits
	ldrh	r1, [r4, #136]
	mov	r3, #0
	mov	r2, #144
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #8
	mov	r1, #988
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r0, r5
	mov	r3, #0
	mov	r2, #8
	mov	r1, #988
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r2, #4
	ldr	r0, [r4, #324]
	movw	r1, #974
	bl	snd_soc_update_bits
	b	.L1407
.L1524:
	movw	r1, #331
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ubfx	r0, r0, #2, #1
.L1404:
	ldrb	r3, [r4, #280]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1408
	cmp	r0, #0
	bne	.L1407
	strb	r0, [r4, #317]
	.syntax divided
@ 3224 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9xxx-mbhc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r3, [r4, #320]
	add	r8, r4, #284
	ldr	r7, [r3, #112]
	cmp	r7, #1
	beq	.L1531
.L1410:
	mov	r3, #1
	strb	r3, [r4, #316]
	.syntax divided
@ 959 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9xxx-mbhc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_bcl_unlock
	mov	r0, r8
	bl	cancel_work_sync
	cmp	r0, #0
	beq	.L1411
	ldr	r3, [r4, #320]
	ldr	r0, [r3, #4]
	bl	wcd9xxx_unlock_sleep
.L1411:
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_bcl_lock
	ldrb	r3, [r4, #280]	@ zero_extendqisi2
	cmp	r3, #0
	cmpne	r3, #3
	beq	.L1413
	movw	r1, #330
	mov	r0, r5
	bl	snd_soc_read
	tst	r0, #2
	beq	.L1407
.L1413:
	ldrh	r1, [r4, #140]
	mov	r3, #0
	mov	r2, #1
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r0, r5
	mov	r3, #0
	mov	r2, #1
	movw	r1, #510
	bl	snd_soc_update_bits
	mov	r0, r4
	bl	wcd9xxx_mbhc_detect_plug_type
	b	.L1407
.L1523:
	bl	gpio_get_value_cansleep
	ldr	r3, [r4, #64]
	ldr	r3, [r3, #32]
	subs	r0, r3, r0
	movne	r0, #1
	b	.L1404
.L1401:
	ldrb	r5, [r2, #36]	@ zero_extendqisi2
	cmp	r5, #0
	beq	.L1373
	mov	r2, #1
	movw	r1, #330
	ldr	r0, [r4, #324]
	bl	snd_soc_update_bits
	ldr	r3, [r4, #64]
	movw	r1, #330
	mov	r5, #0
	ldr	r0, [r4, #324]
	ldr	r3, [r3, #32]
	cmp	r3, #0
	movne	r2, #106
	moveq	r2, #110
	bl	snd_soc_write
	mov	r3, #1
	movw	r1, #330
	ldr	r0, [r4, #324]
	mov	r2, r3
	bl	snd_soc_update_bits
	b	.L1373
.L1529:
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1420
	mov	r3, #8
	mov	r1, #988
	ldr	r0, [r4, #324]
	mov	r2, r3
	bl	snd_soc_update_bits
.L1420:
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_lock
	ldr	r0, [r4, #320]
	mov	r1, #1
	bl	wcd9xxx_resmgr_put_clk_block
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_put_bandgap
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_unlock
	mov	r0, r4
	bl	wcd9xxx_cleanup_hs_polling
	mov	r2, #3
	mov	r1, #0
	mov	r0, r4
	bl	wcd9xxx_report_plug
	b	.L1417
.L1527:
	mov	r2, #1
	mov	r1, #0
	mov	r0, r4
	bl	wcd9xxx_report_plug
	b	.L1417
.L1528:
	mov	r2, #256
	mov	r1, #0
	mov	r0, r4
	bl	wcd9xxx_report_plug
	b	.L1417
.L1531:
	movw	r6, #:lower16:.LANCHOR1
	movt	r6, #:upper16:.LANCHOR1
	ldrb	r3, [r6, #13]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1410
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L1532+4
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #957
	bl	warn_slowpath_fmt
	strb	r7, [r6, #13]
	b	.L1410
.L1526:
	movw	r6, #:lower16:.LANCHOR1
	movt	r6, #:upper16:.LANCHOR1
	ldrb	r3, [r6, #13]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1414
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L1532+4
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #957
	bl	warn_slowpath_fmt
	strb	r7, [r6, #13]
	b	.L1414
.L1530:
	mov	r2, #4
	mov	r1, #0
	mov	r0, r4
	bl	wcd9xxx_report_plug
	b	.L1417
.L1525:
	movw	r0, #:lower16:.LC43
	ldr	r1, .L1532
	ldr	r2, [r3, #28]
	movt	r0, #:upper16:.LC43
	bl	printk
	b	.L1373
.L1521:
	ldr	r3, [r4, #532]
	movw	r0, #:lower16:.LC46
	ldr	r1, .L1532
	movt	r0, #:upper16:.LC46
	ldr	r2, [r3, #32]
	bl	printk
	b	.L1373
.L1515:
	bl	wcd9xxx_acdb_mclk_index.part.9
.L1533:
	.align	2
.L1532:
	.word	.LANCHOR0+560
	.word	.LANCHOR0+500
	.fnend
	.size	wcd9xxx_init_and_calibrate, .-wcd9xxx_init_and_calibrate
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_mbhc_fw_read, %function
wcd9xxx_mbhc_fw_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r0
	mov	r4, #15
	strd	r6, [sp, #8]
	movw	r7, #:lower16:.LC47
	strd	r8, [sp, #16]
	mov	r8, #2304
	sub	r9, r0, #168
	str	r10, [sp, #24]
	movt	r7, #:upper16:.LC47
	movt	r8, 61
	str	lr, [sp, #28]
	ldr	r6, [r0, #156]
	.pad #8
	sub	sp, sp, #8
.L1540:
	ldr	r3, [r5, #-100]
	mov	r1, #2
	mov	r0, r6
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L1538
	blx	r3
	subs	r10, r0, #0
	beq	.L1538
	movw	r0, #:lower16:.LC50
	ldr	r1, .L1575
	movt	r0, #:upper16:.LC50
	bl	printk
	ldr	r3, [r10, #4]
	cmp	r3, #105
	bls	.L1555
	ldr	r0, [r10]
	ldrb	r2, [r0, #65]	@ zero_extendqisi2
	lsl	r2, r2, #2
	add	r1, r2, #86
	cmp	r3, r1
	bcs	.L1572
.L1555:
	movw	r0, #:lower16:.LC49
	ldr	r1, .L1575
	movt	r0, #:upper16:.LC49
	bl	printk
.L1541:
	mov	r0, r9
	bl	wcd9xxx_init_and_calibrate
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L1538:
	mov	r1, r7
	add	r0, sp, #4
	ldr	r2, [r6, #12]
	bl	request_firmware
	subs	r10, r0, #0
	mov	r0, #2304
	mov	r1, r8
	movt	r0, 61
	beq	.L1573
	bl	usleep_range
	subs	r4, r4, #1
	bne	.L1540
	movw	r0, #:lower16:.LC48
	ldr	r1, .L1575
	movt	r0, #:upper16:.LC48
	bl	printk
	b	.L1541
.L1573:
	movw	r0, #:lower16:.LC50
	ldr	r1, .L1575
	movt	r0, #:upper16:.LC50
	bl	printk
	ldr	r3, [sp, #4]
	ldr	r1, [r3]
	ldr	r0, [r3, #4]
	cmp	r1, #105
	bls	.L1557
	ldrb	r3, [r0, #65]	@ zero_extendqisi2
	lsl	r3, r3, #2
	add	r2, r3, #86
	cmp	r2, r1
	bhi	.L1557
	add	r3, r3, #106
	cmp	r3, r1
	bhi	.L1557
	add	r0, r0, r2
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	add	r3, r3, #4
	add	r2, r2, r3, lsl #2
	cmp	r1, r2
	bcc	.L1557
.L1556:
	cmp	r10, #0
	ldr	r3, [r5, #-104]
	beq	.L1574
	ldr	r2, [r10]
	str	r2, [r3, #4]
	str	r10, [r5, #108]
	b	.L1541
.L1574:
	ldr	r2, [sp, #4]
	ldr	r1, [r2, #4]
	str	r1, [r3, #4]
	str	r2, [r5, #52]
	b	.L1541
.L1557:
	movw	r0, #:lower16:.LC49
	ldr	r1, .L1575
	movt	r0, #:upper16:.LC49
	bl	printk
	ldr	r0, [sp, #4]
	bl	release_firmware
	b	.L1541
.L1572:
	add	r2, r2, #106
	cmp	r3, r2
	bcc	.L1555
	add	r0, r0, r1
	ldrb	r2, [r0, #1]	@ zero_extendqisi2
	add	r2, r2, #4
	add	r1, r1, r2, lsl #2
	cmp	r3, r1
	bcs	.L1556
	b	.L1555
.L1576:
	.align	2
.L1575:
	.word	.LANCHOR0+592
	.fnend
	.size	wcd9xxx_mbhc_fw_read, .-wcd9xxx_mbhc_fw_read
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_correct_swch_plug, %function
wcd9xxx_correct_swch_plug:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	sub	r9, r0, #284
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #-220]
	.pad #28
	sub	sp, sp, #28
	ldr	r2, [r0, #40]
	str	r2, [sp, #16]
	ldr	r2, [r3, #48]
	tst	r2, #1
	bne	.L1649
	ldr	r0, [sp, #16]
.L1578:
	mov	r2, #0
	mov	r1, #1
	ldr	r3, [r3, #16]
	mov	r5, r2
	str	r2, [sp, #12]
	blx	r3
	mov	r3, #4
	movw	r1, #974
	ldr	r0, [r4, #40]
	mov	r2, r3
	bl	snd_soc_update_bits
	str	r5, [sp, #4]
.L1609:
	movw	r8, #:lower16:jiffies
	movw	r0, #5000
	movt	r8, #:upper16:jiffies
	mov	r5, #0
	bl	msecs_to_jiffies
	ldr	r3, [r8]
	mov	r10, r5
	mov	fp, r5
	mov	r7, r5
	mvn	r6, #0
	add	r3, r0, r3
	mov	r2, r3
	str	r3, [sp, #8]
.L1580:
	ldr	r3, [r8]
	sub	r3, r2, r3
	cmp	r3, #0
	blt	.L1650
	add	r7, r7, #1
	.syntax divided
@ 3057 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9xxx-mbhc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	ldrb	r3, [r4, #32]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1585
	mov	r0, #100
	bl	msleep
	ldr	r3, [r4, #-220]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L1651
	ldrb	r3, [r3, #36]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1652
	movw	r2, #:lower16:.LC32
	movw	r0, #:lower16:.LC6
	movt	r2, #:upper16:.LC32
	movt	r0, #:upper16:.LC6
	movw	r1, #1954
	bl	warn_slowpath_fmt
.L1585:
	ldr	r3, [sp, #12]
	ldr	r5, [r4, #40]
	cmp	r3, #0
	beq	.L1604
	ldr	ip, [r4, #-220]
	mov	r3, #16
	mov	lr, #0
	mov	r1, #336
	mov	r2, r3
	mov	r0, r5
	str	lr, [sp, #12]
.L1648:
	ldr	r7, [ip, #4]
	bl	snd_soc_update_bits
	mov	r2, #96
	ldrh	r1, [r4, #-148]
	mov	r0, r5
	ldr	r3, [r7, #16]	@ unaligned
	lsl	r3, r3, #5
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r2, #128
	ldrh	r1, [r4, #-148]
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r2, #16
	ldrh	r1, [r4, #-148]
	mov	r0, r5
	bl	snd_soc_update_bits
.L1615:
	ldrb	r3, [r7, #62]	@ zero_extendqisi2
	mov	r0, r5
	mov	r2, #120
	movw	r1, #974
	lsl	r3, r3, #3
	bl	snd_soc_update_bits
	ldr	r0, [r4, #40]
	b	.L1600
.L1652:
	movw	r1, #331
	ldr	r0, [r4, #40]
	bl	snd_soc_read
	ubfx	r0, r0, #2, #1
.L1583:
	cmp	r0, #0
	bne	.L1585
	ldr	r0, [r4, #36]
	bl	wcd9xxx_resmgr_bcl_lock
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L1586
	mov	r1, r5
	mov	r0, r9
	bl	wcd9xxx_codec_cs_get_plug_type
	mov	r6, r0
	ldr	r0, [r4, #36]
	bl	wcd9xxx_resmgr_bcl_unlock
	cmp	r6, #3
	beq	.L1653
.L1588:
	cmn	r6, #1
	bne	.L1590
	ldr	r3, [r4, #-220]
	ldrb	r5, [r3, #37]	@ zero_extendqisi2
	eor	r5, r5, #1
	cmp	r7, #5
	movne	r5, #0
	andeq	r5, r5, #1
	cmp	r5, #0
	bne	.L1654
	mov	r10, r5
	ldr	r2, [sp, #8]
	b	.L1580
.L1586:
	mov	r0, r9
	bl	wcd9xxx_codec_get_plug_type.constprop.10
	mov	r6, r0
	ldr	r0, [r4, #36]
	bl	wcd9xxx_resmgr_bcl_unlock
	cmp	r6, #3
	bne	.L1588
.L1653:
	add	r3, r10, #1
	cmp	r3, #2
	movle	r5, #0
	ble	.L1589
	tst	r10, r3
	moveq	r5, #1
	movne	r5, #0
.L1589:
	ldr	r0, [r4, #36]
	str	r3, [sp, #20]
	bl	wcd9xxx_resmgr_bcl_lock
	ldr	r2, [r4, #-220]
	ldr	r3, [sp, #20]
	ldrb	r2, [r2, #37]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1655
	ldrb	r2, [r4, #-4]	@ zero_extendqisi2
	cmp	r2, #3
	bne	.L1656
.L1594:
	ldr	r0, [r4, #36]
	mov	r10, r3
	bl	wcd9xxx_resmgr_bcl_unlock
	ldr	r2, [sp, #8]
	b	.L1580
.L1590:
	cmp	r6, #2
	beq	.L1657
	cmp	r6, #4
	bne	.L1595
	add	fp, fp, #1
	cmp	fp, #1
	beq	.L1623
	cmp	fp, #2
	bne	.L1595
	ldr	r3, [r4, #-220]
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L1595
	ldr	r0, [sp, #16]
	blx	r3
	cmp	r0, #0
	bne	.L1623
.L1595:
	ldr	r0, [r4, #36]
	bl	wcd9xxx_resmgr_bcl_lock
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L1658
	mov	r2, #4
	movw	r1, #974
	ldr	r0, [r4, #40]
	bl	snd_soc_update_bits
.L1599:
	mov	r1, r6
	mov	r0, r9
	bl	wcd9xxx_find_plug_and_report
	mov	r3, #1
	ldr	r0, [r4, #36]
	str	r3, [sp, #12]
	bl	wcd9xxx_resmgr_bcl_unlock
	ldr	r0, [r4, #40]
.L1600:
	ldr	r3, [r4, #-220]
	mov	r2, #0
	mov	r1, r2
	ldr	r3, [r3, #16]
	blx	r3
	ldr	r3, [r4, #-220]
	ldrb	r3, [r3, #37]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1659
.L1605:
	ldr	r3, [r4, #36]
	ldr	r0, [r3, #4]
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	b	wcd9xxx_unlock_sleep
.L1651:
	bl	gpio_get_value_cansleep
	ldr	r3, [r4, #-220]
	ldr	r3, [r3, #32]
	subs	r0, r3, r0
	movne	r0, #1
	b	.L1583
.L1623:
	mov	r10, #0
	ldr	r2, [sp, #8]
	mov	r5, r10
	b	.L1580
.L1658:
	ldr	r0, [r4, #-220]
	mov	r3, #16
	mov	r1, #336
	ldr	r5, [r4, #40]
	mov	r2, r3
	ldr	r7, [r0, #4]
	mov	r0, r5
	bl	snd_soc_update_bits
	ldrh	r1, [r4, #-148]
	mov	r0, r5
	mov	r2, #96
	ldr	r3, [r7, #16]	@ unaligned
	lsl	r3, r3, #5
	bl	snd_soc_update_bits
	ldrh	r1, [r4, #-148]
	mov	r0, r5
	mov	r3, #0
	mov	r2, #128
	bl	snd_soc_update_bits
	ldrh	r1, [r4, #-148]
	mov	r0, r5
	mov	r3, #0
	mov	r2, #16
	bl	snd_soc_update_bits
	ldrb	r3, [r7, #62]	@ zero_extendqisi2
	mov	r0, r5
	mov	r2, #120
	movw	r1, #974
	lsl	r3, r3, #3
	bl	snd_soc_update_bits
	b	.L1599
.L1657:
	ldr	r0, [r4, #36]
	bl	wcd9xxx_resmgr_bcl_lock
	ldr	r3, [r4, #-220]
	ldrb	r3, [r3, #37]	@ zero_extendqisi2
	cmp	r3, #0
	ldrb	r3, [r4, #-4]	@ zero_extendqisi2
	beq	.L1592
	cmp	r3, #2
	bne	.L1647
.L1593:
	ldr	r0, [r4, #36]
	mov	r5, #0
	bl	wcd9xxx_resmgr_bcl_unlock
	mov	r10, r5
	ldr	r2, [sp, #8]
	b	.L1580
.L1659:
	ldr	r0, [r4, #36]
	bl	wcd9xxx_resmgr_bcl_lock
	ldrb	r3, [r4, #-4]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1660
	cmp	r3, #4
	beq	.L1607
	ldr	r3, [sp, #12]
	cmn	r6, #1
	movne	r6, #0
	moveq	r6, #1
	tst	r3, r6
	beq	.L1608
.L1607:
	mov	r0, r9
	bl	wcd9xxx_cleanup_hs_polling
	mov	r3, #0
	mov	r0, r9
	mov	r2, r3
	mov	r1, r3
	bl	wcd9xxx_enable_hs_detect
.L1608:
	ldr	r0, [r4, #36]
	bl	wcd9xxx_resmgr_bcl_unlock
	b	.L1605
.L1649:
	ldrh	r1, [r9, #140]
	ldr	r0, [sp, #16]
	bl	snd_soc_read
	ands	r6, r0, #128
	ldr	r3, [r4, #-220]
	bne	.L1661
	mov	r1, #1
	mov	r2, r6
	ldr	r3, [r3, #16]
	ldr	r0, [r4, #40]
	str	r1, [sp, #4]
	str	r1, [sp, #12]
	blx	r3
	ldr	r5, [r4, #40]
	mov	r3, #72
	mov	r2, #120
	movw	r1, #974
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r6
	ldrh	r1, [r4, #-148]
	mov	r0, r5
	mov	r2, #1
	bl	snd_soc_update_bits
	mov	r3, r6
	mov	r0, r5
	mov	r2, #1
	movw	r1, #989
	bl	snd_soc_update_bits
	mov	r3, #240
	ldrh	r1, [r4, #-148]
	mov	r0, r5
	mov	r2, r3
	bl	snd_soc_update_bits
	mov	r3, r6
	mov	r0, r5
	mov	r2, #16
	mov	r1, #336
	bl	snd_soc_update_bits
	b	.L1609
.L1592:
	cmp	r3, #0
	bne	.L1593
.L1647:
	mov	r2, #1
	mov	r0, r9
	mov	r1, r2
	bl	wcd9xxx_report_plug
	b	.L1593
.L1650:
	cmp	r6, #3
	bne	.L1602
	ldr	r0, [r4, #36]
	bl	wcd9xxx_resmgr_bcl_lock
	mov	r1, r6
	mov	r0, r9
	bl	wcd9xxx_find_plug_and_report
	ldr	r0, [r4, #36]
	bl	wcd9xxx_resmgr_bcl_unlock
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L1603
	ldr	r5, [r4, #40]
	mov	r3, #1
	str	r3, [sp, #12]
.L1604:
	mov	r0, r5
	mov	r3, #0
	mov	r2, #4
	movw	r1, #974
	bl	snd_soc_update_bits
	ldr	r0, [r4, #40]
	b	.L1600
.L1661:
	ldr	r0, [r4, #40]
	b	.L1578
.L1656:
	mov	r2, #4
	mov	r1, #1
	str	r3, [sp, #20]
	mov	r0, r9
	bl	wcd9xxx_report_plug
	ldr	r3, [sp, #20]
	b	.L1594
.L1654:
	ldrb	r10, [r4, #-4]	@ zero_extendqisi2
	cmp	r10, #0
	beq	.L1662
	mov	r10, #0
	mov	r7, #5
	ldr	r2, [sp, #8]
	mov	r5, r10
	b	.L1580
.L1655:
	ldrb	r2, [r4, #-4]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1594
	mov	r2, #1
	mov	r0, r9
	str	r3, [sp, #20]
	mov	r1, r2
	bl	wcd9xxx_report_plug
	ldr	r3, [sp, #20]
	b	.L1594
.L1660:
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L1607
	b	.L1608
.L1662:
	ldr	r0, [r4, #36]
	mov	r7, #5
	mov	r5, r10
	bl	wcd9xxx_resmgr_bcl_lock
	mov	r2, #1
	mov	r0, r9
	mov	r1, r2
	bl	wcd9xxx_report_plug
	ldr	r0, [r4, #36]
	bl	wcd9xxx_resmgr_bcl_unlock
	ldr	r2, [sp, #8]
	b	.L1580
.L1603:
	ldr	r0, [r4, #-220]
	mov	r3, #16
	mov	r1, #336
	ldr	r5, [r4, #40]
	mov	r2, r3
	ldr	r7, [r0, #4]
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r0, r5
	mov	r2, #96
	ldrh	r1, [r4, #-148]
	ldr	r3, [r7, #16]	@ unaligned
	lsl	r3, r3, #5
	bl	snd_soc_update_bits
	b	.L1615
.L1602:
	ldr	r3, [sp, #12]
	ldr	r5, [r4, #40]
	cmp	r3, #0
	bne	.L1614
	mov	r3, #1
	str	r3, [sp, #12]
	b	.L1604
.L1614:
	mov	r3, #16
	mov	r1, #336
	ldr	ip, [r4, #-220]
	mov	r2, r3
	mov	r0, r5
	b	.L1648
	.fnend
	.size	wcd9xxx_correct_swch_plug, .-wcd9xxx_correct_swch_plug
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_mech_plug_detect_irq, %function
wcd9xxx_mech_plug_detect_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r1
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r3, [r1, #320]
	ldr	r0, [r3, #4]
	bl	wcd9xxx_lock_sleep
	subs	r5, r0, #0
	beq	.L1706
	mov	r3, #1
	movw	r1, #5000
	ldr	r5, [r4, #324]
	mov	r0, r1
	strb	r3, [r4, #318]
	bl	usleep_range
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_bcl_lock
	add	r0, r4, #4
	bl	cancel_delayed_work_sync
	cmp	r0, #0
	bne	.L1707
	ldr	r3, [r4, #64]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L1708
.L1667:
	ldrb	r3, [r3, #36]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1709
	movw	r2, #:lower16:.LC32
	movw	r0, #:lower16:.LC6
	movt	r2, #:upper16:.LC32
	movt	r0, #:upper16:.LC6
	movw	r1, #1954
	bl	warn_slowpath_fmt
	ldrb	r3, [r4, #280]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1670
.L1671:
	mov	r3, #0
	ldr	r0, [r4, #320]
	strb	r3, [r4, #318]
	bl	wcd9xxx_resmgr_bcl_unlock
	ldr	r3, [r4, #320]
	ldr	r0, [r3, #4]
	bl	wcd9xxx_unlock_sleep
	mov	r0, #1
.L1663:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L1709:
	movw	r1, #331
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ubfx	r0, r0, #2, #1
.L1668:
	ldrb	r3, [r4, #280]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1672
	cmp	r0, #0
	bne	.L1671
	strb	r0, [r4, #317]
	.syntax divided
@ 3224 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9xxx-mbhc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r3, [r4, #320]
	add	r7, r4, #284
	ldr	r6, [r3, #112]
	cmp	r6, #1
	beq	.L1710
.L1674:
	mov	r3, #1
	strb	r3, [r4, #316]
	.syntax divided
@ 959 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9xxx-mbhc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_bcl_unlock
	mov	r0, r7
	bl	cancel_work_sync
	cmp	r0, #0
	beq	.L1675
	ldr	r3, [r4, #320]
	ldr	r0, [r3, #4]
	bl	wcd9xxx_unlock_sleep
.L1675:
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_bcl_lock
	ldrb	r3, [r4, #280]	@ zero_extendqisi2
	cmp	r3, #0
	cmpne	r3, #3
	beq	.L1677
	movw	r1, #330
	mov	r0, r5
	bl	snd_soc_read
	tst	r0, #2
	beq	.L1671
.L1677:
	ldrh	r1, [r4, #140]
	mov	r3, #0
	mov	r2, #1
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r0, r5
	mov	r3, #0
	mov	r2, #1
	movw	r1, #510
	bl	snd_soc_update_bits
	mov	r0, r4
	bl	wcd9xxx_mbhc_detect_plug_type
	b	.L1671
.L1672:
	cmp	r0, #0
	beq	.L1671
.L1670:
	mov	r3, #0
	strb	r3, [r4, #317]
	.syntax divided
@ 3245 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9xxx-mbhc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r3, [r4, #320]
	add	r7, r4, #284
	ldr	r6, [r3, #112]
	cmp	r6, #1
	beq	.L1711
.L1678:
	mov	r3, #1
	strb	r3, [r4, #316]
	.syntax divided
@ 959 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9xxx-mbhc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_bcl_unlock
	mov	r0, r7
	bl	cancel_work_sync
	cmp	r0, #0
	beq	.L1679
	ldr	r3, [r4, #320]
	ldr	r0, [r3, #4]
	bl	wcd9xxx_unlock_sleep
.L1679:
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_bcl_lock
	ldrb	r3, [r4, #280]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L1712
	cmp	r3, #4
	beq	.L1713
	cmp	r3, #1
	beq	.L1714
	cmp	r3, #3
	beq	.L1715
	cmp	r3, #5
	bne	.L1671
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1716
.L1686:
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_lock
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_put_clk_block
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_put_bandgap
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_unlock
	mov	r0, r4
	bl	wcd9xxx_cleanup_hs_polling
	movw	r2, #515
	mov	r1, #0
	mov	r0, r4
	bl	wcd9xxx_report_plug
.L1681:
	mov	r2, #0
	movw	r1, #334
	mov	r0, r5
	bl	snd_soc_write
	mov	r3, #0
	mov	r2, #2
	movw	r1, #974
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #1
	ldrh	r1, [r4, #140]
	mov	r0, r5
	mov	r2, r3
	bl	snd_soc_update_bits
	mov	r3, #1
	movw	r1, #510
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #1
	ldrh	r1, [r4, #140]
	mov	r0, r5
	mov	r2, r3
	bl	snd_soc_update_bits
	ldrh	r1, [r4, #136]
	mov	r3, #0
	mov	r2, #144
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #8
	mov	r1, #988
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r0, r5
	mov	r3, #0
	mov	r2, #8
	mov	r1, #988
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r2, #4
	ldr	r0, [r4, #324]
	movw	r1, #974
	bl	snd_soc_update_bits
	b	.L1671
.L1707:
	ldr	r3, [r4, #320]
	ldr	r0, [r3, #4]
	bl	wcd9xxx_unlock_sleep
	ldr	r3, [r4, #64]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L1667
.L1708:
	bl	gpio_get_value_cansleep
	ldr	r3, [r4, #64]
	ldr	r3, [r3, #32]
	subs	r0, r3, r0
	movne	r0, #1
	b	.L1668
.L1706:
	movw	r0, #:lower16:.LC51
	ldr	r1, .L1718
	movt	r0, #:upper16:.LC51
	bl	printk
	mov	r0, r5
	b	.L1663
.L1710:
	movw	r8, #:lower16:.LANCHOR1
	movt	r8, #:upper16:.LANCHOR1
	ldrb	r3, [r8, #13]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1674
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L1718+4
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #957
	bl	warn_slowpath_fmt
	strb	r6, [r8, #13]
	b	.L1674
.L1715:
	mov	r2, #4
	mov	r1, #0
	mov	r0, r4
	bl	wcd9xxx_report_plug
	b	.L1681
.L1714:
	ldrb	r3, [r4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1717
.L1684:
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_lock
	ldr	r0, [r4, #320]
	mov	r1, #1
	bl	wcd9xxx_resmgr_put_clk_block
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_put_bandgap
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_unlock
	mov	r0, r4
	bl	wcd9xxx_cleanup_hs_polling
	mov	r2, #3
	mov	r1, #0
	mov	r0, r4
	bl	wcd9xxx_report_plug
	b	.L1681
.L1712:
	mov	r2, #1
	mov	r1, #0
	mov	r0, r4
	bl	wcd9xxx_report_plug
	b	.L1681
.L1713:
	mov	r2, #256
	mov	r1, #0
	mov	r0, r4
	bl	wcd9xxx_report_plug
	b	.L1681
.L1711:
	movw	r8, #:lower16:.LANCHOR1
	movt	r8, #:upper16:.LANCHOR1
	ldrb	r3, [r8, #13]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1678
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L1718+4
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #957
	bl	warn_slowpath_fmt
	strb	r6, [r8, #13]
	b	.L1678
.L1717:
	mov	r3, #8
	mov	r1, #988
	ldr	r0, [r4, #324]
	mov	r2, r3
	bl	snd_soc_update_bits
	b	.L1684
.L1716:
	mov	r3, #8
	mov	r1, #988
	ldr	r0, [r4, #324]
	mov	r2, r3
	bl	snd_soc_update_bits
	b	.L1686
.L1719:
	.align	2
.L1718:
	.word	.LANCHOR0+616
	.word	.LANCHOR0+500
	.fnend
	.size	wcd9xxx_mech_plug_detect_irq, .-wcd9xxx_mech_plug_detect_irq
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_hs_remove_irq, %function
wcd9xxx_hs_remove_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r1
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	.pad #28
	sub	sp, sp, #28
	ldr	r0, [r1, #320]
	bl	wcd9xxx_resmgr_bcl_lock
	ldrb	r5, [r4, #280]	@ zero_extendqisi2
	cmp	r5, #1
	beq	.L1845
	cmp	r5, #2
	beq	.L1846
.L1722:
	ldr	r3, [r4, #64]
	ldrb	r2, [r3, #37]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1723
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L1847
	ldrb	r3, [r3, #36]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1848
	movw	r2, #:lower16:.LC32
	movw	r0, #:lower16:.LC6
	movt	r2, #:upper16:.LC32
	movt	r0, #:upper16:.LC6
	movw	r1, #1954
	bl	warn_slowpath_fmt
	ldr	r3, [r4, #64]
.L1723:
	ldr	r3, [r3, #48]
	tst	r3, #4
	bne	.L1748
.L1751:
	mov	r7, #0
.L1749:
	movw	r10, #:lower16:jiffies
	movw	r0, #5000
	movt	r10, #:upper16:jiffies
	mov	r8, #0
	bl	msecs_to_jiffies
	ldr	fp, [r10]
	add	r3, r0, fp
	str	r3, [sp]
.L1752:
	ldr	r3, [r10]
	ldr	r2, [sp]
	sub	r3, r2, r3
	cmp	r3, #0
	blt	.L1761
	ldr	r3, [r4, #64]
	add	r8, r8, #1
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L1849
	ldrb	r3, [r3, #36]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1850
.L1754:
	movw	r2, #:lower16:.LC32
	movw	r0, #:lower16:.LC6
	movt	r2, #:upper16:.LC32
	movt	r0, #:upper16:.LC6
	movw	r1, #1954
	mov	r5, #0
	bl	warn_slowpath_fmt
.L1755:
	cmp	r7, #0
	beq	.L1789
	ldr	r0, [r4, #64]
	mov	r3, #16
	mov	r1, #336
	ldr	r6, [r4, #324]
	mov	r2, r3
	ldr	r7, [r0, #4]
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r2, #96
	ldrh	r1, [r4, #136]
	mov	r0, r6
	ldr	r3, [r7, #16]	@ unaligned
	lsl	r3, r3, #5
	bl	snd_soc_update_bits
	mov	r3, #0
	ldrh	r1, [r4, #136]
	mov	r2, #128
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r3, #0
	ldrh	r1, [r4, #136]
	mov	r2, #16
	mov	r0, r6
	bl	snd_soc_update_bits
	ldrb	r3, [r7, #62]	@ zero_extendqisi2
	mov	r0, r6
	mov	r2, #120
	movw	r1, #974
	lsl	r3, r3, #3
	bl	snd_soc_update_bits
.L1789:
	cmp	r5, #0
	bne	.L1734
.L1728:
	ldrb	r5, [r4, #280]	@ zero_extendqisi2
	ldr	r0, [r4, #320]
	cmp	r5, #1
	beq	.L1851
.L1791:
	cmp	r5, #2
	beq	.L1852
.L1792:
	bl	wcd9xxx_resmgr_bcl_unlock
	mov	r0, #1
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1761:
	mov	r5, #0
	b	.L1755
.L1850:
	movw	r1, #331
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ubfx	r0, r0, #2, #1
.L1753:
	cmp	r0, #0
	bne	.L1761
	cmp	r8, #1
	movhi	r0, #250
	movls	r0, #50
	bl	msleep
	ldr	r3, [r4, #64]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L1853
	ldrb	r3, [r3, #36]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1754
	movw	r1, #331
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ubfx	r0, r0, #2, #1
.L1760:
	cmp	r0, #0
	bne	.L1761
	cmp	r7, #0
	add	r6, sp, #12
	beq	.L1762
	add	r9, sp, #24
.L1765:
	ldr	r2, [r4, #320]
	ldr	r5, [r4, #324]
	ldr	r3, [r4, #532]
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #16]
	bl	wcd9xxx_disable_irq
	mov	r3, #0
	mov	r0, r5
	mov	r2, #2
	movw	r1, #974
	bl	snd_soc_update_bits
	ldr	r3, [r4, #64]
	ldrb	r3, [r3, #53]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1854
.L1763:
	mov	r3, #8
	mov	r1, #988
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r2, #4
	mov	r1, #960
	mov	r0, r5
	bl	snd_soc_write
	mov	r3, #0
	mov	r2, #8
	mov	r1, #988
	mov	r0, r5
	bl	snd_soc_update_bits
	ldr	r3, [r4, #64]
	ldrb	r3, [r3, #53]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1855
.L1764:
	ldr	r1, [r4, #84]
	mov	r0, r1
	bl	usleep_range
	mov	r2, #4
	mov	r1, #960
	mov	r0, r5
	bl	snd_soc_write
	ldr	r1, [r4, #88]
	mov	r0, r1
	bl	usleep_range
	movw	r1, #973
	mov	r0, r5
	bl	snd_soc_read
	mov	fp, r0
	mov	r1, #972
	mov	r0, r5
	bl	snd_soc_read
	uxtb	r1, r0
	mov	r3, #2
	mov	r2, r3
	mov	r0, r5
	orr	r5, r1, fp, lsl #8
	movw	r1, #974
	bl	snd_soc_update_bits
	ldr	r2, [r4, #320]
	sxth	r5, r5
	ldr	r3, [r4, #532]
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #16]
	bl	wcd9xxx_enable_irq
	ldrsh	r1, [r4, #74]
	movw	r3, #1800
	ldrsh	r2, [r4, #76]
	sub	r5, r5, r1
	sub	r2, r2, r1
	mul	r5, r3, r5
	sdiv	r5, r5, r2
	str	r5, [r6], #4
	cmp	r6, r9
	bne	.L1765
	ldr	r3, [r4, #64]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L1856
.L1768:
	ldrb	r3, [r3, #36]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1754
	movw	r1, #331
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ubfx	r0, r0, #2, #1
.L1769:
	cmp	r0, #0
	bne	.L1761
	ldrb	r3, [r4, #280]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1761
	ldr	r2, [r4, #64]
	movw	r1, #1800
	ldr	r3, [r4, #96]
	ldr	r5, [sp, #12]
	ldr	r6, [r2, #4]
	cmp	r3, r1
	ldrsh	r3, [r6, #48]	@ unaligned
	beq	.L1770
	ldrb	r2, [r4, #156]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1857
.L1770:
	cmp	r7, #0
	bne	.L1771
	sub	r2, r5, #21
	cmp	r2, #58
	bls	.L1752
	ldrsh	r2, [r6, #40]	@ unaligned
	cmp	r2, r5
	bge	.L1752
	cmp	r5, r3
	bge	.L1752
	ldr	r1, [r4, #64]
	movw	r3, #1800
	ldr	r2, [r4, #96]
	ldr	r5, [sp, #16]
	ldr	r9, [r1, #4]
	cmp	r2, r3
	ldrsh	r3, [r9, #48]	@ unaligned
	beq	.L1796
.L1774:
	ldrb	r2, [r4, #156]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1858
.L1778:
	cmp	r7, #0
	bne	.L1779
.L1796:
	sub	r2, r5, #21
	cmp	r2, #58
	bls	.L1752
	ldrsh	r2, [r9, #40]	@ unaligned
	cmp	r5, r2
	ble	.L1752
	cmp	r5, r3
	bge	.L1752
	ldr	r1, [r4, #64]
	movw	r3, #1800
	ldr	r2, [r4, #96]
	ldr	r5, [sp, #20]
	ldr	r9, [r1, #4]
	cmp	r2, r3
	ldrsh	r3, [r9, #48]	@ unaligned
	beq	.L1797
.L1781:
	ldrb	r2, [r4, #156]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1859
.L1785:
	cmp	r7, #0
	bne	.L1786
.L1797:
	sub	r2, r5, #21
	cmp	r2, #58
	bls	.L1752
	ldrsh	r2, [r9, #40]	@ unaligned
	cmp	r5, r2
	ble	.L1752
	cmp	r5, r3
	blt	.L1787
	b	.L1752
.L1762:
	add	r5, sp, #24
.L1767:
	movw	r1, #974
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ubfx	r1, r0, #2, #1
	mov	r2, #1
	mov	r0, r4
	bl	__wcd9xxx_codec_sta_dce.constprop.22
	ldrsh	r1, [r4, #72]
	ldr	r3, [r4, #96]
	ldrsh	r2, [r4, #76]
	sub	r0, r0, r1
	mul	r3, r3, r0
	sub	r2, r2, r1
	sdiv	r3, r3, r2
	str	r3, [r6], #4
	cmp	r6, r5
	bne	.L1767
	ldr	r3, [r4, #64]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L1768
.L1856:
	bl	gpio_get_value_cansleep
	ldr	r3, [r4, #64]
	ldr	r3, [r3, #32]
	subs	r0, r3, r0
	movne	r0, #1
	b	.L1769
.L1855:
	mov	r3, #2
	mov	r1, #988
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L1764
.L1854:
	mov	r3, #0
	mov	r2, #2
	mov	r1, #988
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L1763
.L1771:
	sub	r5, r5, #1
	cmp	r5, #648
	bhi	.L1752
	ldr	r1, [r4, #64]
	movw	r3, #1800
	ldr	r2, [r4, #96]
	ldr	r5, [sp, #16]
	ldr	r9, [r1, #4]
	cmp	r2, r3
	ldrsh	r3, [r9, #48]	@ unaligned
	bne	.L1774
.L1779:
	sub	r5, r5, #1
	cmp	r5, #648
	bhi	.L1752
	ldr	r1, [r4, #64]
	movw	r3, #1800
	ldr	r2, [r4, #96]
	ldr	r5, [sp, #20]
	ldr	r9, [r1, #4]
	cmp	r2, r3
	ldrsh	r3, [r9, #48]	@ unaligned
	bne	.L1781
.L1786:
	sub	r5, r5, #1
	cmp	r5, #648
	bhi	.L1752
.L1787:
	mov	r0, #200
	mov	r5, #1
	bl	msleep
	b	.L1755
.L1849:
	bl	gpio_get_value_cansleep
	ldr	r3, [r4, #64]
	ldr	r3, [r3, #32]
	subs	r0, r3, r0
	movne	r0, #1
	b	.L1753
.L1853:
	bl	gpio_get_value_cansleep
	ldr	r3, [r4, #64]
	ldr	r3, [r3, #32]
	subs	r0, r3, r0
	movne	r0, #1
	b	.L1760
.L1857:
	ldr	r0, [r4, #320]
	str	r3, [sp, #4]
	bl	wcd9xxx_resmgr_get_k_val
	add	r9, r0, #4
	ldr	r1, [r4, #96]
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_k_val
	ldr	r3, [sp, #4]
	add	r0, r0, #4
	mul	r3, r3, r9
	sdiv	r3, r3, r0
	sxth	r3, r3
	b	.L1770
.L1858:
	movw	r1, #1800
	ldr	r0, [r4, #320]
	str	r3, [sp, #4]
	bl	wcd9xxx_resmgr_get_k_val
	add	r6, r0, #4
	ldr	r1, [r4, #96]
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_k_val
	ldr	r3, [sp, #4]
	add	r0, r0, #4
	mul	r6, r3, r6
	sdiv	r6, r6, r0
	sxth	r3, r6
	b	.L1778
.L1859:
	movw	r1, #1800
	ldr	r0, [r4, #320]
	str	r3, [sp, #4]
	bl	wcd9xxx_resmgr_get_k_val
	add	r6, r0, #4
	ldr	r1, [r4, #96]
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_k_val
	ldr	r3, [sp, #4]
	add	r0, r0, #4
	mul	r6, r3, r6
	sdiv	r6, r6, r0
	sxth	r3, r6
	b	.L1785
.L1729:
	mov	r0, r7
	ldrh	r1, [r4, #140]
	bl	snd_soc_read
	tst	r0, #128
	bne	.L1732
	ldr	r7, [r4, #324]
	mov	r3, #72
	mov	r2, #120
	movw	r1, #974
	movw	r10, #:lower16:jiffies
	movt	r10, #:upper16:jiffies
	mov	r0, r7
	bl	snd_soc_update_bits
	mov	r3, r5
	mov	r2, r6
	ldrh	r1, [r4, #136]
	mov	r0, r7
	bl	snd_soc_update_bits
	mov	r3, r5
	mov	r2, r6
	movw	r1, #989
	mov	r0, r7
	bl	snd_soc_update_bits
	mov	r3, #240
	ldrh	r1, [r4, #136]
	mov	r0, r7
	mov	r2, r3
	bl	snd_soc_update_bits
	mov	r3, r5
	mov	r2, #16
	mov	r1, #336
	mov	r0, r7
	bl	snd_soc_update_bits
	mov	r0, #50
	bl	msecs_to_jiffies
	ldr	r5, [r10]
	add	r5, r5, r0
	b	.L1739
.L1861:
	ldr	r3, [r10]
	sub	r3, r5, r3
	cmp	r3, #0
	blt	.L1860
.L1739:
	mov	r2, #1
	mov	r0, r4
	mov	r1, r2
	bl	__wcd9xxx_codec_sta_dce.constprop.22
	ldrsh	r3, [r4, #128]
	cmp	r3, r0
	ble	.L1861
	mov	r7, #0
.L1738:
	ldr	r0, [r4, #64]
	mov	r3, #16
	mov	r1, #336
	ldr	r5, [r4, #324]
	mov	r2, r3
	ldr	r6, [r0, #4]
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r2, #96
	ldrh	r1, [r4, #136]
	mov	r0, r5
	ldr	r3, [r6, #16]	@ unaligned
	lsl	r3, r3, #5
	bl	snd_soc_update_bits
	mov	r3, #0
	ldrh	r1, [r4, #136]
	mov	r2, #128
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #0
	ldrh	r1, [r4, #136]
	mov	r2, #16
	mov	r0, r5
	bl	snd_soc_update_bits
	ldrb	r3, [r6, #62]	@ zero_extendqisi2
	mov	r0, r5
	mov	r2, #120
	movw	r1, #974
	lsl	r3, r3, #3
	bl	snd_soc_update_bits
	cmp	r7, #0
	bne	.L1737
.L1734:
	mov	r0, r4
	bl	wcd9xxx_start_hs_polling
	ldrb	r5, [r4, #280]	@ zero_extendqisi2
	ldr	r0, [r4, #320]
	cmp	r5, #1
	bne	.L1791
.L1851:
	mov	r2, r5
	mov	r1, r5
	bl	wcd9xxx_resmgr_cond_update_cond
	ldr	r0, [r4, #320]
	mov	r2, r5
	mov	r1, #2
	bl	wcd9xxx_resmgr_cond_update_cond
	ldr	r0, [r4, #320]
	b	.L1792
.L1748:
	ldrh	r1, [r4, #140]
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ands	r6, r0, #128
	bne	.L1751
	ldr	r5, [r4, #324]
	mov	r7, #1
	mov	r3, #72
	mov	r2, #120
	movw	r1, #974
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r6
	mov	r2, r7
	ldrh	r1, [r4, #136]
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r6
	mov	r2, r7
	mov	r0, r5
	movw	r1, #989
	bl	snd_soc_update_bits
	mov	r3, #240
	ldrh	r1, [r4, #136]
	mov	r0, r5
	mov	r2, r3
	bl	snd_soc_update_bits
	mov	r3, r6
	mov	r0, r5
	mov	r2, #16
	mov	r1, #336
	bl	snd_soc_update_bits
	b	.L1749
.L1845:
	ldr	r0, [r4, #320]
	mov	r2, #0
	mov	r1, #2
	bl	wcd9xxx_resmgr_cond_update_cond
	mov	r1, r5
	mov	r2, #0
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_cond_update_cond
	b	.L1722
.L1848:
	movw	r1, #331
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ldr	r3, [r4, #64]
	ubfx	r5, r0, #2, #1
.L1725:
	cmp	r5, #0
	bne	.L1723
	ldrb	r6, [r4, #280]	@ zero_extendqisi2
	ldr	r7, [r4, #324]
	and	r6, r6, #251
	cmp	r6, #1
	bne	.L1862
	ldr	r3, [r3, #4]
	ldrb	r1, [r3, #2]	@ zero_extendqisi2
	mov	r0, r1
	bl	usleep_range
	ldr	r3, [r4, #64]
	ldr	r3, [r3, #48]
	tst	r3, #4
	bne	.L1729
.L1732:
	movw	r10, #:lower16:jiffies
	mov	r0, #50
	movt	r10, #:upper16:jiffies
	movw	r6, #1800
	bl	msecs_to_jiffies
	ldr	r5, [r10]
	add	r5, r0, r5
	b	.L1730
.L1733:
	ldrb	r3, [r4, #156]	@ zero_extendqisi2
.L1736:
	add	r3, r4, r3, lsl #1
	ldrsh	r3, [r3, #104]
	cmp	r3, r0
	bgt	.L1734
	ldr	r3, [r10]
	sub	r3, r5, r3
	cmp	r3, #0
	blt	.L1737
.L1730:
	movw	r1, #974
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ubfx	r1, r0, #2, #1
	mov	r2, #1
	mov	r0, r4
	bl	__wcd9xxx_codec_sta_dce.constprop.22
	ldr	r3, [r4, #96]
	cmp	r3, r6
	bne	.L1733
	mov	r3, #0
	b	.L1736
.L1847:
	bl	gpio_get_value_cansleep
	ldr	r3, [r4, #64]
	ldr	r5, [r3, #32]
	subs	r5, r5, r0
	movne	r5, #1
	b	.L1725
.L1852:
	mov	r2, #1
	mov	r1, r2
	bl	wcd9xxx_resmgr_cond_update_cond
	ldr	r0, [r4, #320]
	b	.L1792
.L1846:
	mov	r2, #0
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_cond_update_cond
	b	.L1722
.L1862:
	mov	r3, #8
	mov	r0, r7
	mov	r2, r3
	mov	r1, #988
	bl	snd_soc_update_bits
	b	.L1728
.L1737:
	ldr	r3, [r4, #64]
	ldrb	r2, [r3, #37]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1740
	ldr	r0, [r3, #24]
	cmp	r0, #0
	bne	.L1863
	ldrb	r3, [r3, #36]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1864
	movw	r2, #:lower16:.LC32
	movw	r0, #:lower16:.LC6
	movt	r2, #:upper16:.LC32
	movt	r0, #:upper16:.LC6
	movw	r1, #1954
	bl	warn_slowpath_fmt
	b	.L1728
.L1740:
	ldr	r3, [r4, #320]
	add	r7, r4, #300
	ldr	r6, [r3, #112]
	cmp	r6, #1
	beq	.L1865
.L1746:
	mov	r3, #1
	strb	r3, [r4, #316]
	.syntax divided
@ 959 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9xxx-mbhc.c" 1
	dsb
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_bcl_unlock
	mov	r0, r7
	bl	cancel_work_sync
	cmp	r0, #0
	beq	.L1747
	ldr	r3, [r4, #320]
	ldr	r0, [r3, #4]
	bl	wcd9xxx_unlock_sleep
.L1747:
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_bcl_lock
	mov	r3, #1
	mov	r1, #0
	mov	r2, r3
	mov	r0, r4
	bl	__wcd9xxx_switch_micbias
	mov	r2, #3
	mov	r1, #0
	mov	r0, r4
	bl	wcd9xxx_report_plug
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_lock
	ldr	r0, [r4, #320]
	mov	r1, #1
	bl	wcd9xxx_resmgr_put_clk_block
	mov	r1, #1
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_put_bandgap
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_unlock
	mov	r0, r4
	bl	wcd9xxx_cleanup_hs_polling
	mov	r3, #1
	mov	r2, #3
	mov	r1, r3
	mov	r0, r4
	bl	wcd9xxx_enable_hs_detect
	b	.L1728
.L1860:
	mov	r7, #1
	b	.L1738
.L1864:
	movw	r1, #331
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ubfx	r0, r0, #2, #1
.L1742:
	cmp	r0, #0
	bne	.L1728
	ldr	r3, [r4, #160]
	cmp	r3, #3
	beq	.L1866
.L1745:
	mov	r2, #4
	mov	r1, #1
	mov	r0, r4
	bl	wcd9xxx_report_plug
	mov	r0, r4
	bl	wcd9xxx_cleanup_hs_polling
	mov	r3, #0
	mov	r2, #2
	mov	r1, #1
	mov	r0, r4
	bl	wcd9xxx_enable_hs_detect
	b	.L1728
.L1863:
	bl	gpio_get_value_cansleep
	ldr	r3, [r4, #64]
	ldr	r3, [r3, #32]
	subs	r0, r3, r0
	movne	r0, #1
	b	.L1742
.L1865:
	movw	r5, #:lower16:.LANCHOR1
	movt	r5, #:upper16:.LANCHOR1
	ldrb	r3, [r5, #13]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1746
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L1867
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #957
	bl	warn_slowpath_fmt
	strb	r6, [r5, #13]
	b	.L1746
.L1866:
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_lock
	ldr	r0, [r4, #320]
	mov	r1, #1
	bl	wcd9xxx_resmgr_put_clk_block
	ldr	r0, [r4, #320]
	mov	r1, #1
	bl	wcd9xxx_resmgr_put_bandgap
	ldr	r0, [r4, #320]
	add	r0, r0, #136
	bl	mutex_unlock
	b	.L1745
.L1868:
	.align	2
.L1867:
	.word	.LANCHOR0+500
	.fnend
	.size	wcd9xxx_hs_remove_irq, .-wcd9xxx_hs_remove_irq
	.align	2
	.global	wcd9xxx_mbhc_cal_btn_det_mp
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_mbhc_cal_btn_det_mp, %function
wcd9xxx_mbhc_cal_btn_det_mp:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	add	r0, r0, #28
	cmp	r1, #4
	ldrls	pc, [pc, r1, asl #2]
	b	.L1878
.L1872:
	.word	.L1869
	.word	.L1873
	.word	.L1874
	.word	.L1875
	.word	.L1876
.L1878:
	mov	r0, #0
.L1869:
	bx	lr
.L1876:
	add	r0, r3, #30
.L1875:
	add	r0, r0, #2
.L1874:
	ldrb	r3, [r3, #13]	@ zero_extendqisi2
	lsl	r3, r3, #1
	add	r0, r0, r3
	add	r0, r0, r3
	bx	lr
.L1873:
	ldrb	r3, [r3, #13]	@ zero_extendqisi2
	lsl	r3, r3, #1
	add	r0, r0, r3
	bx	lr
	.fnend
	.size	wcd9xxx_mbhc_cal_btn_det_mp, .-wcd9xxx_mbhc_cal_btn_det_mp
	.align	2
	.global	wcd9xxx_turn_onoff_current_source
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_turn_onoff_current_source, %function
wcd9xxx_turn_onoff_current_source:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r1
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r4, [r0, #324]
	bne	.L1884
	ldr	ip, [r0, #64]
	mov	r6, r3
	mov	r3, #16
	mov	r2, r3
	mov	r1, #336
	mov	r0, r4
	ldr	r7, [ip, #4]
	bl	snd_soc_update_bits
	mov	r2, #96
	ldrh	r1, [r5, #4]
	mov	r0, r4
	ldr	r3, [r7, #16]	@ unaligned
	lsl	r3, r3, #5
	bl	snd_soc_update_bits
	cmp	r6, #0
	beq	.L1885
.L1881:
	ldrb	r3, [r7, #62]	@ zero_extendqisi2
	mov	r0, r4
	mov	r2, #120
	movw	r1, #974
	lsl	r3, r3, #3
.L1883:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	snd_soc_update_bits
.L1884:
	mov	r3, #72
	mov	r2, #120
	movw	r1, #974
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r2, #1
	ldrh	r1, [r5, #4]
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r2, #1
	movw	r1, #989
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r3, #240
	ldrh	r1, [r5, #4]
	mov	r0, r4
	mov	r2, r3
	bl	snd_soc_update_bits
	mov	r0, r4
	mov	r3, #0
	mov	r2, #16
	mov	r1, #336
	b	.L1883
.L1885:
	mov	r3, r6
	ldrh	r1, [r5, #4]
	mov	r2, #128
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r3, r6
	ldrh	r1, [r5, #4]
	mov	r2, #16
	mov	r0, r4
	bl	snd_soc_update_bits
	b	.L1881
	.fnend
	.size	wcd9xxx_turn_onoff_current_source, .-wcd9xxx_turn_onoff_current_source
	.align	2
	.global	wcd9xxx_update_z
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_update_z, %function
wcd9xxx_update_z:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	add	r9, r0, #72
	str	r10, [sp, #24]
	add	r10, r0, #78
	str	lr, [sp, #28]
	ldr	r3, [r0, #320]
	ldr	r5, [r0, #324]
	ldr	r6, [r3, #112]
	cmp	r6, #1
	beq	.L1901
.L1887:
	ldrh	r1, [r4, #140]
	mov	r0, r5
	bl	snd_soc_read
	sxth	r6, r0
	mov	r3, #1
	ldrh	r1, [r4, #140]
	mov	r2, #129
	mov	r0, r5
	bl	snd_soc_update_bits
	ldrh	r1, [r4, #136]
	mov	r0, r5
	bl	snd_soc_read
	sxth	r7, r0
	mov	r3, #0
	ldrh	r1, [r4, #136]
	mov	r2, #128
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, #1
	mov	r2, #16
	mov	r1, #336
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r8, r0
	mov	r1, #2000
	mov	r0, #1000
	bl	usleep_range
	cmp	r10, #0
	beq	.L1888
	movw	r1, #974
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ubfx	r1, r0, #2, #1
	mov	r2, #0
	mov	r0, r4
	bl	__wcd9xxx_codec_sta_dce.constprop.23
	strh	r0, [r4, #78]	@ movhi
.L1888:
	cmp	r9, #0
	beq	.L1889
	movw	r1, #974
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ubfx	r1, r0, #2, #1
	mov	r2, #0
	mov	r0, r4
	bl	__wcd9xxx_codec_sta_dce.constprop.22
	strh	r0, [r4, #72]	@ movhi
.L1889:
	cmp	r8, #0
	beq	.L1890
	mov	r3, #16
	mov	r1, #336
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
.L1890:
	mov	r2, r7
	ldrh	r1, [r4, #136]
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, r6
	ldrh	r1, [r4, #140]
	mov	r0, r5
	bl	snd_soc_write
	mov	r0, r4
	bl	wcd9xxx_mbhc_calc_thres
	ldrd	r6, [sp, #8]
	mov	r0, r4
	ldrd	r4, [sp]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	ldr	lr, [sp, #28]
	add	sp, sp, #32
	b	wcd9xxx_calibrate_hs_polling
.L1901:
	movw	r7, #:lower16:.LANCHOR1
	movt	r7, #:upper16:.LANCHOR1
	ldrb	r3, [r7, #1]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1887
	movw	r2, #:lower16:.LC7
	movw	r0, #:lower16:.LC6
	ldr	r3, .L1902
	movt	r2, #:upper16:.LC7
	movt	r0, #:upper16:.LC6
	movw	r1, #3439
	bl	warn_slowpath_fmt
	strb	r6, [r7, #1]
	b	.L1887
.L1903:
	.align	2
.L1902:
	.word	.LANCHOR0+28
	.fnend
	.size	wcd9xxx_update_z, .-wcd9xxx_update_z
	.align	2
	.global	wcd9xxx_dce_handler
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_dce_handler, %function
wcd9xxx_dce_handler:
	.fnstart
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r1
	movw	r5, #:lower16:__stack_chk_guard
	strd	r6, [sp, #8]
	add	r6, r1, #544
	movt	r5, #:upper16:__stack_chk_guard
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	.setfp fp, sp, #32
	add	fp, sp, #32
	str	lr, [sp, #32]
	.pad #84
	sub	sp, sp, #84
	ldr	r1, [r1, #64]
	ldr	r3, [r4, #320]
	ldr	r2, [r5]
	ldr	r9, [r4, #324]
	ldr	r7, [r1, #4]
	mov	r0, r3
	ldr	r3, [r3, #4]
	ldrb	r8, [r7, #63]	@ zero_extendqisi2
	str	r3, [fp, #-60]
	str	r2, [fp, #-40]
	add	r3, r8, #1
	lsl	r2, r3, #1
	lsl	r3, r3, #2
	add	r2, r2, #8
	add	r3, r3, #10
	lsr	r2, r2, #3
	lsr	r3, r3, #3
	lsl	r2, r2, #3
	lsl	r3, r3, #3
	sub	sp, sp, r2
	add	r1, sp, #16
	sub	sp, sp, r2
	add	r10, sp, #16
	sub	sp, sp, r3
	add	r2, sp, #16
	sub	sp, sp, r3
	add	r3, sp, #16
	str	r3, [fp, #-56]
	str	r2, [fp, #-52]
	str	r1, [fp, #-48]
	bl	wcd9xxx_resmgr_bcl_lock
	mov	r0, r6
	bl	mutex_lock
	mov	r0, r9
	movw	r1, #969
	bl	snd_soc_read
	ldr	r2, [r4, #60]
	cmp	r2, #1
	beq	.L1907
	ldrb	r2, [r4]	@ zero_extendqisi2
	mov	r1, #0
	str	r1, [r4, #60]
	cmp	r2, r1
	beq	.L2019
	ldrb	r2, [r4, #318]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L1907
	ldr	r2, [r4, #64]
	mov	r3, r0
	ldrb	r2, [r2, #52]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L1908
	ldr	r2, [r4, #68]
	cmp	r2, #0
	beq	.L1909
	ldr	r2, [r2, #44]
	cmp	r2, #0
	beq	.L1909
	mov	r1, #1
	mov	r0, r9
	str	r3, [fp, #-64]
	blx	r2
	ldr	r3, [fp, #-64]
.L1908:
	ldr	r1, [r4, #96]
	str	r3, [fp, #-72]
	movw	r2, #1800
	ldrh	r3, [r4, #72]
	mov	r0, r9
	cmp	r1, r2
	movw	r1, #973
	ldrbne	r2, [r4, #156]	@ zero_extendqisi2
	str	r3, [fp, #-76]
	moveq	r2, #0
	ldrh	r3, [r4, #78]
	str	r3, [fp, #-80]
	str	r2, [fp, #-64]
	bl	snd_soc_read
	str	r0, [fp, #-68]
	mov	r1, #972
	mov	r0, r9
	bl	snd_soc_read
	ldr	r3, [fp, #-68]
	uxtb	r2, r0
	movw	r1, #971
	mov	r0, r9
	orr	r2, r2, r3, lsl #8
	strh	r2, [r10]	@ movhi
	bl	snd_soc_read
	str	r0, [fp, #-68]
	movw	r1, #970
	mov	r0, r9
	bl	snd_soc_read
	ldr	r3, [fp, #-72]
	mov	r9, r0
	and	r3, r3, #62
	cmp	r3, #12
	beq	.L1911
	ldr	r3, [r4, #340]
	cmp	r3, #0
	bne	.L2020
.L1912:
	ldrb	r3, [r4, #528]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2021
.L1914:
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	bne	.L2022
.L1907:
	mov	r0, r6
	bl	mutex_unlock
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_bcl_unlock
	ldr	r2, [fp, #-40]
	mov	r0, #1
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L2023
	sub	sp, fp, #32
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L2020:
	movw	r2, #:lower16:jiffies
	movt	r2, #:upper16:jiffies
	ldr	r2, [r2]
	rsb	r2, r2, #250
	cmn	r2, r3
	bmi	.L1912
	mov	r3, #0
	str	r3, [fp, #-72]
.L1913:
	ldrb	r3, [r7, #63]	@ zero_extendqisi2
	cmp	r3, #0
	movne	r3, #1
	strne	r6, [fp, #-92]
	strne	r10, [fp, #-88]
	strne	r3, [fp, #-84]
	bne	.L1920
	b	.L1919
.L1915:
	cmp	r8, #0
	beq	.L2024
.L1916:
	mov	r3, #8
	mov	r1, #988
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r2, #4
	mov	r1, #960
	mov	r0, r6
	bl	snd_soc_write
	mov	r3, #0
	mov	r2, #8
	mov	r1, #988
	mov	r0, r6
	bl	snd_soc_update_bits
	ldr	r3, [r4, #64]
	ldrb	r3, [r3, #53]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L2025
.L1917:
	ldr	r1, [r4, #84]
	mov	r0, r1
	bl	usleep_range
	mov	r2, #4
	mov	r1, #960
	mov	r0, r6
	bl	snd_soc_write
	ldr	r1, [r4, #88]
	mov	r0, r1
	bl	usleep_range
	movw	r1, #973
	mov	r0, r6
	bl	snd_soc_read
	mov	r2, r0
	mov	r1, #972
	mov	r0, r6
	str	r2, [fp, #-96]
	bl	snd_soc_read
	ldr	r2, [fp, #-96]
	uxtb	r3, r0
	cmp	r8, #0
	orr	r3, r3, r2, lsl #8
	sxth	r3, r3
	str	r3, [fp, #-96]
	beq	.L2026
.L1918:
	ldr	r3, [fp, #-84]
	ldr	r2, [r4, #320]
	add	r6, r3, #1
	ldr	r3, [r4, #532]
	ldr	r0, [r2, #4]
	str	r6, [fp, #-84]
	ldr	r1, [r3, #16]
	bl	wcd9xxx_enable_irq
	ldrb	r3, [r7, #63]	@ zero_extendqisi2
	ldr	r1, [fp, #-96]
	ldr	r2, [fp, #-88]
	cmp	r3, #0
	strh	r1, [r2, #2]!	@ movhi
	str	r2, [fp, #-88]
	beq	.L2014
	add	r3, r3, #1
	cmp	r3, r6
	ble	.L2014
.L1920:
	movw	r1, #974
	ldr	r0, [r4, #324]
	bl	snd_soc_read
	ldr	r2, [r4, #320]
	and	r8, r0, #4
	ldr	r6, [r4, #324]
	ldr	r3, [r4, #532]
	ldr	r0, [r2, #4]
	ldr	r1, [r3, #16]
	bl	wcd9xxx_disable_irq
	ldr	r3, [r4, #64]
	ldrb	r3, [r3, #53]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1915
	mov	r3, #0
	mov	r2, #2
	mov	r1, #988
	mov	r0, r6
	bl	snd_soc_update_bits
	b	.L1915
.L2022:
	movw	r1, #1800
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_k_val
	ldr	r1, [r4, #96]
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_k_val
	movw	r1, #1800
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_k_val
	ldr	r1, [r4, #96]
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_k_val
	b	.L1907
.L2021:
	mov	r0, #0
	add	r3, r4, #132
	add	r2, r4, #78
	add	r1, r4, #72
	str	r0, [sp]
	mov	r0, r4
	bl	wcd9xxx_get_z
	mov	r0, r4
	bl	wcd9xxx_mbhc_calc_thres
	mov	r0, r4
	bl	wcd9xxx_calibrate_hs_polling
	mov	r3, #1
	strb	r3, [r4, #528]
	b	.L1914
.L2023:
	bl	__stack_chk_fail
.L2026:
	mov	r3, r8
	mov	r0, r6
	mov	r2, #4
	movw	r1, #974
	bl	snd_soc_update_bits
	b	.L1918
.L2025:
	mov	r3, #2
	mov	r1, #988
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	b	.L1917
.L2024:
	mov	r3, #4
	movw	r1, #974
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	b	.L1916
.L2019:
	movw	r0, #:lower16:.LC52
	ldr	r1, .L2033
	movt	r0, #:upper16:.LC52
	bl	printk
	b	.L1907
.L2014:
	ldr	r6, [fp, #-92]
.L1919:
	ldrb	r3, [r4, #528]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1921
	ldr	r3, [fp, #-76]
	sxth	r3, r3
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-80]
	sxth	r3, r3
.L1922:
	ldr	r1, [fp, #-68]
	uxtb	r8, r9
	ldr	r2, [fp, #-64]
	ldr	r9, [r4, #96]
	orr	r8, r8, r1, lsl #8
	cmp	r2, #0
	ldrsh	r2, [r4, #80]
	sxth	r8, r8
	sub	r2, r2, r3
	sub	r3, r8, r3
	mul	r3, r9, r3
	sdiv	r9, r3, r2
	moveq	r3, r9
	beq	.L1923
	mov	r1, r9
	mov	r0, r4
	bl	scale_v_micb_vddio.constprop.21
	mov	r3, r0
.L1923:
	movw	r0, #:lower16:.LC53
	uxth	r2, r8
	ldr	r1, .L2033
	str	r3, [sp]
	movt	r0, #:upper16:.LC53
	mov	r3, r9
	bl	printk
	ldrsh	r2, [r10]
	ldr	r3, [fp, #-64]
	ldr	r1, [fp, #-84]
	ldr	r9, [r4, #96]
	str	r2, [fp, #-68]
	cmp	r3, #0
	ldrsh	r3, [r4, #76]
	sub	r2, r2, r1
	mul	r9, r9, r2
	sub	r3, r3, r1
	sdiv	r9, r9, r3
	ldr	r3, [fp, #-52]
	moveq	ip, r9
	str	r9, [r3]
	beq	.L1924
	mov	r1, r9
	mov	r0, r4
	bl	scale_v_micb_vddio.constprop.21
	mov	ip, r0
.L1924:
	ldr	r3, [r4, #64]
	ldr	r2, [fp, #-56]
	ldr	r3, [r3, #4]
	str	ip, [r2]
	ldrb	r2, [r3, #65]	@ zero_extendqisi2
	cmp	r2, #0
	lsl	r0, r2, #1
	beq	.L1925
	add	r3, r3, #78
	mov	r8, #0
	b	.L1928
.L1926:
	add	r8, r8, #1
	cmp	r8, r2
	beq	.L1925
.L1928:
	ldrsh	r1, [r3, #2]!
	cmp	ip, r1
	blt	.L1926
	ldrsh	r1, [r3, r0]
	cmp	ip, r1
	bgt	.L1926
	ldr	r2, [fp, #-68]
	movw	r0, #:lower16:.LC54
	ldr	r3, [fp, #-48]
	movt	r0, #:upper16:.LC54
	ldr	r1, .L2033
	uxth	r2, r2
	strh	r8, [r3]	@ movhi
	mov	r3, r9
	str	ip, [sp]
	str	r8, [sp, #4]
	bl	printk
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	bne	.L1930
.L1929:
	ldrb	r3, [r4, #318]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L1907
	ldrb	r9, [r7, #65]	@ zero_extendqisi2
	add	r7, r7, #80
	cmp	r9, r8
	ble	.L2027
.L1944:
	ldr	r2, [r4, #64]
	add	r3, r8, r9
	lsl	r3, r3, #1
	ldr	r1, [fp, #-64]
	ldr	r10, [r4, #324]
	ldrsh	r7, [r7, r3]
	ldr	r3, [r2, #4]
	cmp	r1, #0
	ldrsh	r3, [r3, #76]	@ unaligned
	add	r7, r7, r3
	bne	.L2028
.L1945:
	ldr	r3, [r4, #60]
	cmp	r3, #1
	beq	.L1946
	ldr	r2, [r4, #96]
	sxth	r7, r7
	cmp	r2, #0
	beq	.L2029
	ldrh	r3, [r4, #78]
	ldrh	r9, [r4, #80]
	sub	r9, r9, r3
	smulbb	r9, r9, r7
	udiv	r9, r9, r2
	add	r3, r3, r9
	uxth	r9, r3
.L1948:
	uxtb	r2, r9
	movw	r1, #978
	mov	r0, r10
	bl	snd_soc_write
	movw	r1, #979
	lsr	r2, r9, #8
	mov	r0, r10
	bl	snd_soc_write
	ldr	r1, [r4, #96]
	cmp	r1, #0
	beq	.L2030
	ldrh	r3, [r4, #72]
	ldrh	r2, [r4, #76]
	sub	r2, r2, r3
	smulbb	r7, r2, r7
	udiv	r7, r7, r1
	add	r3, r3, r7
	uxth	r7, r3
.L1950:
	uxtb	r2, r7
	mov	r1, #984
	mov	r0, r10
	bl	snd_soc_write
	lsr	r2, r7, #8
	mov	r0, r10
	movw	r1, #985
	bl	snd_soc_write
.L1946:
	cmp	r8, #7
	movgt	r2, #0
	bgt	.L1951
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	add	r3, r3, r8, lsl #2
	ldr	r2, [r3, #668]
.L1951:
	ldr	r3, [r4, #56]
	ldr	r0, [fp, #-60]
	orr	r3, r3, r2
	str	r3, [r4, #56]
	bl	wcd9xxx_lock_sleep
	mov	r0, #400
	bl	msecs_to_jiffies
	movw	r1, #:lower16:system_wq
	mov	r3, r0
	movt	r1, #:upper16:system_wq
	add	r2, r4, #4
	mov	r0, #4
	ldr	r1, [r1]
	bl	queue_delayed_work_on
	cmp	r0, #0
	bne	.L1907
	movw	r2, #:lower16:.LC56
	movw	r0, #:lower16:.LC6
	movt	r2, #:upper16:.LC56
	movt	r0, #:upper16:.LC6
	movw	r1, #3715
	bl	warn_slowpath_fmt
	ldr	r0, [fp, #-60]
	bl	wcd9xxx_unlock_sleep
	b	.L1907
.L1909:
	movw	r0, #:lower16:.LC1
	ldr	r1, .L2033
	str	r3, [fp, #-64]
	movt	r0, #:upper16:.LC1
	bl	printk
	ldr	r3, [fp, #-64]
	b	.L1908
.L1911:
	str	r8, [fp, #-72]
	b	.L1913
.L1921:
	mov	r0, r4
	bl	wcd9xxx_update_z
	ldrsh	r3, [r4, #72]
	mov	r2, #1
	strb	r2, [r4, #528]
	str	r3, [fp, #-84]
	ldrsh	r3, [r4, #78]
	b	.L1922
.L1925:
	ldr	r2, [fp, #-68]
	mvn	lr, #0
	movw	r0, #:lower16:.LC54
	ldr	r8, [fp, #-48]
	mov	r3, r9
	movt	r0, #:upper16:.LC54
	ldr	r1, .L2033
	uxth	r2, r2
	strh	lr, [r8]	@ movhi
	stm	sp, {ip, lr}
	bl	printk
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	beq	.L1907
.L1930:
	movw	r3, #:lower16:.LC55
	mov	r9, #1
	str	r10, [fp, #-92]
	movt	r3, #:upper16:.LC55
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-48]
	str	r5, [fp, #-76]
	str	r6, [fp, #-68]
	sub	r3, r3, #2
	str	r3, [fp, #-88]
.L1942:
	ldrb	r3, [r7, #63]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2017
	add	r3, r3, #1
	cmp	r9, r3
	blt	.L2031
.L2017:
	ldr	r5, [fp, #-76]
	ldr	r6, [fp, #-68]
	b	.L1907
.L2031:
	lsl	r10, r9, #1
	ldr	r1, [fp, #-84]
	ldr	r3, [fp, #-64]
	ldrsh	r2, [r4, #76]
	ldr	r5, [r4, #96]
	cmp	r3, #0
	ldr	r3, [fp, #-92]
	sub	r2, r2, r1
	ldrsh	r3, [r3, r10]
	sub	r1, r3, r1
	mul	r5, r5, r1
	sdiv	r5, r5, r2
	ldr	r2, [fp, #-52]
	moveq	ip, r5
	str	r5, [r2, r9, lsl #2]
	beq	.L1931
	mov	r1, r5
	mov	r0, r4
	str	r3, [fp, #-96]
	bl	scale_v_micb_vddio.constprop.21
	ldr	r3, [fp, #-96]
	mov	ip, r0
.L1931:
	ldr	r2, [r4, #64]
	mov	r8, #0
	ldr	r1, [fp, #-56]
	ldr	r2, [r2, #4]
	str	ip, [r1, r9, lsl #2]
	ldrb	r1, [r2, #65]	@ zero_extendqisi2
	add	r2, r2, #78
	lsl	r0, r1, #1
.L1932:
	cmp	r8, r1
	bge	.L2032
	ldrsh	lr, [r2, #2]!
	cmp	ip, lr
	blt	.L1933
	ldrsh	lr, [r2, r0]
	cmp	ip, lr
	ble	.L1934
.L1933:
	add	r8, r8, #1
	b	.L1932
.L2032:
	mvn	r8, #0
.L1934:
	ldr	r0, [fp, #-48]
	sxth	r6, r8
	mov	r2, r9
	uxth	r3, r3
	ldr	r1, .L2033
	add	r9, r9, #1
	strh	r6, [r0, r10]	@ movhi
	ldr	r0, [fp, #-80]
	stm	sp, {r5, ip}
	str	r8, [sp, #8]
	bl	printk
	ldrb	r2, [r7, #64]	@ zero_extendqisi2
	cmp	r9, r2
	blt	.L1942
	ldr	r0, [fp, #-88]
	add	r3, r10, #2
	mov	r1, #0
	add	r3, r0, r3
.L1937:
	cmn	r6, #1
	cmpne	r1, r2
	bge	.L1938
	ldrsh	r0, [r3], #-2
	cmp	r6, r0
	bne	.L1938
	add	r1, r1, #1
	b	.L1937
.L2028:
	movw	r1, #1800
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_get_k_val
	add	r9, r0, #4
	ldr	r1, [r4, #96]
	ldr	r0, [r4, #320]
	mul	r9, r7, r9
	bl	wcd9xxx_resmgr_get_k_val
	add	r3, r0, #4
	sdiv	r3, r9, r3
	sxth	r7, r3
	b	.L1945
.L2030:
	movw	r0, #:lower16:.LC10
	ldr	r1, .L2033+4
	movw	r7, #65514
	movt	r0, #:upper16:.LC10
	bl	printk
	b	.L1950
.L2029:
	movw	r0, #:lower16:.LC10
	ldr	r1, .L2033+4
	movw	r9, #65514
	movt	r0, #:upper16:.LC10
	bl	printk
	b	.L1948
.L2027:
	movw	r0, #:lower16:.LC6
	movw	r1, #3706
	movt	r0, #:upper16:.LC6
	bl	warn_slowpath_null
	b	.L1944
.L1938:
	cmp	r1, r2
	beq	.L1940
	ldr	r3, [fp, #-72]
	sub	r2, r2, #1
	add	r3, r3, #1
	sub	r3, r3, r9
	cmp	r2, r3
	ble	.L1942
	b	.L2017
.L1940:
	cmn	r8, #1
	ldr	r5, [fp, #-76]
	ldr	r6, [fp, #-68]
	bne	.L1929
	b	.L1907
.L2034:
	.align	2
.L2033:
	.word	.LANCHOR0+648
	.word	.LANCHOR0+68
	.fnend
	.size	wcd9xxx_dce_handler, .-wcd9xxx_dce_handler
	.align	2
	.global	wcd9xxx_mbhc_start
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_mbhc_start, %function
wcd9xxx_mbhc_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r5, [r0, #324]
	cmp	r5, #0
	beq	.L2093
	ldr	r3, [r1, #20]
	mov	r4, r0
	mov	r2, #31744
	mov	r0, #32768
	movt	r2, 146
	movt	r0, 187
	cmp	r3, r0
	cmpne	r3, r2
	bne	.L2094
	str	r1, [r4, #64]
	ldr	r3, [r4, #320]
	ldr	r2, [r1, #8]
	ldr	r0, [r3, #44]
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L2039
.L2041:
	.word	.L2040
	.word	.L2042
	.word	.L2043
	.word	.L2044
.L2044:
	ldr	ip, [r3, #36]
	ldrb	r2, [r0, #19]	@ zero_extendqisi2
	ldrh	ip, [ip, #4]
	strh	ip, [r4, #136]	@ movhi
	ldr	ip, [r3, #36]
	ldrh	ip, [ip, #2]
	strh	ip, [r4, #138]	@ movhi
	ldr	ip, [r3, #36]
	ldrh	ip, [ip]
	strh	ip, [r4, #140]	@ movhi
.L2045:
	cmp	r2, #1
	strb	r2, [r4, #142]
	beq	.L2047
.L2098:
	bcc	.L2048
	cmp	r2, #2
	bne	.L2046
	movw	r2, #309
	movt	r2, 308
	str	r2, [r4, #132]	@ unaligned
	ldr	r2, [r0, #12]
	str	r2, [r4, #96]
.L2046:
	ldr	r2, [r1, #12]
	ldr	r1, [r3, #44]
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L2050
.L2052:
	.word	.L2051
	.word	.L2053
	.word	.L2054
	.word	.L2055
.L2055:
	ldr	r0, [r3, #36]
	ldrb	r2, [r1, #19]	@ zero_extendqisi2
	ldrh	r1, [r0, #4]
	strh	r1, [r4, #148]	@ movhi
	ldr	r1, [r3, #36]
	ldrh	r1, [r1, #2]
	strh	r1, [r4, #150]	@ movhi
	ldr	r3, [r3, #36]
	ldrh	r3, [r3]
	strh	r3, [r4, #152]	@ movhi
.L2056:
	cmp	r2, #1
	strb	r2, [r4, #154]
	beq	.L2058
.L2096:
	bcc	.L2059
	cmp	r2, #2
	bne	.L2057
	movw	r3, #309
	movt	r3, 308
	str	r3, [r4, #144]	@ unaligned
.L2057:
	ldr	r3, [r4, #68]
	cmp	r3, #0
	beq	.L2061
.L2097:
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L2061
	mov	r1, r4
	mov	r0, r5
	blx	r3
.L2062:
	ldrd	r2, [r4, #64]
	ldrb	r2, [r2, #52]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L2063
	cmp	r3, #0
	beq	.L2064
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L2064
	mov	r0, r5
	mov	r1, #1
	blx	r3
	ldr	r3, [r4, #68]
.L2063:
	cmp	r3, #0
	beq	.L2065
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L2065
	mov	r1, #1
	ldr	r0, [r4, #324]
	blx	r3
.L2065:
	ldr	r3, [r4, #64]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L2066
	ldr	r3, [r4, #220]
	cmp	r3, #0
	beq	.L2095
.L2066:
	mov	r0, r4
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	wcd9xxx_init_and_calibrate
.L2054:
	ldrb	r2, [r1, #18]	@ zero_extendqisi2
	movw	r3, #313
	movw	r0, #311
	movt	r3, 312
	str	r3, [r4, #148]	@ unaligned
	cmp	r2, #1
	strh	r0, [r4, #152]	@ movhi
	strb	r2, [r4, #154]
	bne	.L2096
.L2058:
	movw	r3, #303
	movt	r3, 302
	str	r3, [r4, #144]	@ unaligned
	ldr	r3, [r4, #68]
	cmp	r3, #0
	bne	.L2097
.L2061:
	mov	r3, #0
	mov	r2, #64
	ldrh	r1, [r4, #134]
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L2062
.L2053:
	movw	r3, #307
	movw	r0, #305
	ldrb	r2, [r1, #17]	@ zero_extendqisi2
	movt	r3, 306
	str	r3, [r4, #148]	@ unaligned
	strh	r0, [r4, #152]	@ movhi
	b	.L2056
.L2051:
	movw	r3, #301
	movw	r0, #299
	ldrb	r2, [r1, #16]	@ zero_extendqisi2
	movt	r3, 300
	str	r3, [r4, #148]	@ unaligned
	strh	r0, [r4, #152]	@ movhi
	b	.L2056
.L2043:
	ldrb	r2, [r0, #18]	@ zero_extendqisi2
	movw	ip, #313
	movw	lr, #311
	movt	ip, 312
	str	ip, [r4, #136]	@ unaligned
	cmp	r2, #1
	strh	lr, [r4, #140]	@ movhi
	strb	r2, [r4, #142]
	bne	.L2098
.L2047:
	movw	r2, #303
	movt	r2, 302
	str	r2, [r4, #132]	@ unaligned
	ldr	r2, [r0, #8]
	str	r2, [r4, #96]
	b	.L2046
.L2042:
	movw	ip, #307
	movw	lr, #305
	ldrb	r2, [r0, #17]	@ zero_extendqisi2
	movt	ip, 306
	str	ip, [r4, #136]	@ unaligned
	strh	lr, [r4, #140]	@ movhi
	b	.L2045
.L2040:
	movw	ip, #301
	movw	lr, #299
	ldrb	r2, [r0, #16]	@ zero_extendqisi2
	movt	ip, 300
	str	ip, [r4, #136]	@ unaligned
	strh	lr, [r4, #140]	@ movhi
	b	.L2045
.L2059:
	movw	r3, #297
	movt	r3, 296
	str	r3, [r4, #144]	@ unaligned
	b	.L2057
.L2048:
	movw	r2, #297
	movt	r2, 296
	str	r2, [r4, #132]	@ unaligned
	ldr	r2, [r0, #4]
	str	r2, [r4, #96]
	b	.L2046
.L2095:
	ldr	r5, [r4, #276]
	cmp	r5, #0
	bne	.L2066
	mov	r0, #2304
	movt	r0, 61
	bl	usecs_to_jiffies
	movw	r1, #:lower16:system_wq
	mov	r3, r0
	movt	r1, #:upper16:system_wq
	add	r2, r4, #168
	mov	r0, #4
	ldr	r1, [r1]
	bl	queue_delayed_work_on
	mov	r0, r5
.L2035:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L2039:
	movw	r0, #:lower16:.LC59
	ldr	r1, .L2099
	movt	r0, #:upper16:.LC59
	bl	printk
	ldr	r1, [r4, #64]
	ldr	r3, [r4, #320]
	b	.L2046
.L2094:
	movw	r0, #:lower16:.LC58
	mov	r1, r3
	movt	r0, #:upper16:.LC58
	bl	printk
	mvn	r0, #21
	b	.L2035
.L2093:
	movw	r0, #:lower16:.LC57
	ldr	r1, .L2099+4
	movt	r0, #:upper16:.LC57
	bl	printk
	mvn	r0, #21
	b	.L2035
.L2050:
	movw	r0, #:lower16:.LC59
	ldr	r1, .L2099
	movt	r0, #:upper16:.LC59
	bl	printk
	b	.L2057
.L2064:
	movw	r0, #:lower16:.LC60
	ldr	r1, .L2099+4
	movt	r0, #:upper16:.LC60
	bl	printk
	ldr	r3, [r4, #68]
	b	.L2063
.L2100:
	.align	2
.L2099:
	.word	.LANCHOR0+720
	.word	.LANCHOR0+700
	.fnend
	.size	wcd9xxx_mbhc_start, .-wcd9xxx_mbhc_start
	.align	2
	.global	wcd9xxx_mbhc_stop
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_mbhc_stop, %function
wcd9xxx_mbhc_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #220]
	cmp	r3, #0
	beq	.L2111
.L2102:
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r4, r0
	add	r0, r0, #168
	str	lr, [sp, #4]
	bl	cancel_delayed_work_sync
	ldr	r3, [r4, #276]
	cmp	r3, #0
	beq	.L2112
.L2104:
	mov	r3, #0
	str	r3, [r4, #220]
	str	r3, [r4, #276]
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L2111:
	ldr	r3, [r0, #276]
	cmp	r3, #0
	bne	.L2102
	bx	lr
.L2112:
	ldr	r0, [r4, #220]
	bl	release_firmware
	b	.L2104
	.fnend
	.size	wcd9xxx_mbhc_stop, .-wcd9xxx_mbhc_stop
	.align	2
	.global	wcd9xxx_mbhc_get_impedance
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_mbhc_get_impedance, %function
wcd9xxx_mbhc_get_impedance:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #516]
	str	r3, [r1]
	ldr	r3, [r0, #520]
	str	r3, [r2]
	ldr	r2, [r1]
	cmp	r2, #0
	cmpne	r3, #0
	mvneq	r0, #21
	movne	r0, #0
	bx	lr
	.fnend
	.size	wcd9xxx_mbhc_get_impedance, .-wcd9xxx_mbhc_get_impedance
	.align	2
	.global	wcd9xxx_mbhc_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_mbhc_init, %function
wcd9xxx_mbhc_init:
	.fnstart
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	add	r0, r0, #132
	strd	r6, [sp, #8]
	mov	r6, r2
	strd	r8, [sp, #16]
	mov	r8, r1
	mov	r1, #12
	strd	r10, [sp, #24]
	mov	fp, r3
	str	lr, [sp, #32]
	.pad #12
	sub	sp, sp, #12
	ldrb	r7, [sp, #60]	@ zero_extendqisi2
	ldr	r5, [sp, #52]
	ldr	r10, [sp, #48]
	ldr	r9, [sp, #56]
	bl	__memzero
	add	r0, r4, #72
	mov	r1, #60
	bl	__memzero
	mov	r2, #55
	movw	r0, #60000
	movw	r3, #5000
	mvn	r1, #0
	cmp	r5, #0
	str	r2, [r4, #84]
	mov	r2, #0
	strb	r2, [r4]
	str	r1, [r4, #60]
	str	r0, [r4, #88]
	str	r3, [r4, #92]
	strb	r2, [r4, #156]
	strb	r2, [r4, #280]
	strb	r2, [r4, #317]
	strb	r2, [r4, #318]
	str	r8, [r4, #320]
	str	r6, [r4, #324]
	strb	r2, [r4, #328]
	str	r2, [r4, #340]
	str	r4, [r8, #68]
	str	r10, [r4, #68]
	str	fp, [r4, #508]
	strb	r7, [r4, #512]
	str	r9, [r4, #524]
	str	r5, [r4, #532]
	beq	.L2148
	ldr	r3, [r4, #372]
	cmp	r3, #0
	beq	.L2149
.L2119:
	movw	r1, #:lower16:.LC71
	ldr	r2, .L2163
	add	r0, r4, #544
	movt	r1, #:upper16:.LC71
	mov	r9, r4
	bl	__mutex_init
	movw	r3, #:lower16:wcd9xxx_event_notify
	movt	r3, #:upper16:wcd9xxx_event_notify
	str	r3, [r9, #492]!
	mov	r1, r9
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_register_notifier
	subs	r5, r0, #0
	bne	.L2150
	ldr	r6, .L2163+4
	movw	r0, #:lower16:.LC73
	mov	r3, r4
	mov	r2, r5
	movw	r1, #33060
	movt	r0, #:upper16:.LC73
	str	r6, [sp]
	add	r6, r6, #108
	bl	debugfs_create_file
	str	r0, [r4, #536]
	movw	r0, #:lower16:.LC74
	mov	r3, r4
	mov	r2, r5
	movw	r1, #33060
	str	r6, [sp]
	movt	r0, #:upper16:.LC74
	bl	debugfs_create_file
	ldr	r3, [r4, #68]
	str	r0, [r4, #540]
	cmp	r3, #0
	beq	.L2129
	ldr	r3, [r3, #20]
	blx	r3
	cmp	r0, #3
	beq	.L2128
.L2129:
	mov	r5, r7
.L2128:
	ldr	r0, [r4, #320]
	movw	r7, #:lower16:.LANCHOR2
	movw	r3, #:lower16:.LC75
	ldr	r1, [r4, #532]
	movt	r7, #:upper16:.LANCHOR2
	movw	r2, #:lower16:wcd9xxx_hs_insert_irq
	movt	r3, #:upper16:.LC75
	movt	r2, #:upper16:wcd9xxx_hs_insert_irq
	str	r5, [r7, #128]
	ldr	r6, [r0, #4]
	ldr	r1, [r1, #20]
	str	r4, [sp]
	mov	r0, r6
	bl	wcd9xxx_request_irq
	subs	r5, r0, #0
	bne	.L2151
	ldr	r3, [r4, #532]
	mov	r0, r6
	ldr	r1, [r3, #20]
	bl	wcd9xxx_disable_irq
	ldr	r1, [r4, #532]
	movw	r3, #:lower16:.LC77
	movw	r2, #:lower16:wcd9xxx_hs_remove_irq
	movt	r3, #:upper16:.LC77
	movt	r2, #:upper16:wcd9xxx_hs_remove_irq
	mov	r0, r6
	ldr	r1, [r1]
	str	r4, [sp]
	bl	wcd9xxx_request_irq
	subs	r5, r0, #0
	bne	.L2152
	ldr	r1, [r4, #532]
	movw	r3, #:lower16:.LC79
	movw	r2, #:lower16:wcd9xxx_dce_handler
	movt	r3, #:upper16:.LC79
	movt	r2, #:upper16:wcd9xxx_dce_handler
	mov	r0, r6
	ldr	r1, [r1, #16]
	str	r4, [sp]
	bl	wcd9xxx_request_irq
	subs	r5, r0, #0
	bne	.L2153
	ldr	r1, [r4, #532]
	movw	r3, #:lower16:.LC80
	movw	r2, #:lower16:wcd9xxx_release_handler
	movt	r3, #:upper16:.LC80
	movt	r2, #:upper16:wcd9xxx_release_handler
	mov	r0, r6
	ldr	r1, [r1, #12]
	str	r4, [sp]
	bl	wcd9xxx_request_irq
	subs	r5, r0, #0
	bne	.L2154
	ldr	r1, [r4, #532]
	movw	r3, #:lower16:.LC81
	movw	r2, #:lower16:wcd9xxx_hphl_ocp_irq
	movt	r3, #:upper16:.LC81
	movt	r2, #:upper16:wcd9xxx_hphl_ocp_irq
	mov	r0, r6
	ldr	r1, [r1, #24]
	str	r4, [sp]
	bl	wcd9xxx_request_irq
	subs	r5, r0, #0
	ldr	r3, [r4, #532]
	bne	.L2155
	ldr	r1, [r3, #24]
	mov	r0, r6
	bl	wcd9xxx_disable_irq
	ldr	r1, [r4, #532]
	movw	r3, #:lower16:.LC82
	movw	r2, #:lower16:wcd9xxx_hphr_ocp_irq
	movt	r3, #:upper16:.LC82
	movt	r2, #:upper16:wcd9xxx_hphr_ocp_irq
	mov	r0, r6
	ldr	r1, [r1, #28]
	str	r4, [sp]
	bl	wcd9xxx_request_irq
	subs	r5, r0, #0
	ldr	r3, [r4, #532]
	bne	.L2156
	ldr	r1, [r3, #28]
	mov	r0, r6
	bl	wcd9xxx_disable_irq
	movw	r1, #:lower16:.LC83
	add	r0, r7, #8
	movt	r1, #:upper16:.LC83
	bl	wakeup_source_prepare
	add	r0, r7, #8
	bl	wakeup_source_add
	mov	r0, r8
	mov	r1, #6
	bl	wcd9xxx_regmgr_cond_register
.L2116:
	mov	r0, r5
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L2149:
	movw	r1, #:lower16:.LC62
	add	r3, r4, #348
	movt	r1, #:upper16:.LC62
	movw	r2, #967
	mov	r0, r6
	bl	snd_soc_jack_new
	subs	r5, r0, #0
	bne	.L2157
	mov	r2, #0
	movw	r1, #:lower16:.LC64
	mov	r0, r6
	movt	r2, 2040
	movt	r1, #:upper16:.LC64
	add	r3, r4, #420
	bl	snd_soc_jack_new
	subs	r5, r0, #0
	bne	.L2158
	mov	r2, #226
	mov	r1, #67108864
	ldr	r0, [r4, #444]
	bl	snd_jack_set_key
	mov	r2, #115
	mov	r1, #33554432
	ldr	r0, [r4, #444]
	bl	snd_jack_set_key
	mov	r2, #114
	mov	r1, #16777216
	ldr	r0, [r4, #444]
	bl	snd_jack_set_key
	movw	r1, #:lower16:.LC66
	mov	r0, r5
	ldr	r2, .L2163
	movt	r1, #:upper16:.LC66
	bl	__class_create
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L2159
.L2122:
	movw	ip, #:lower16:.LC68
	mov	r3, #0
	movt	ip, #:upper16:.LC68
	mov	r0, r5
	mov	r2, r3
	mov	r1, r3
	str	ip, [sp]
	bl	device_create
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L2160
.L2123:
	movw	r6, #:lower16:.LANCHOR3
	mov	r0, r5
	movt	r6, #:upper16:.LANCHOR3
	mov	r1, r6
	bl	device_create_file
	cmp	r0, #0
	bne	.L2161
.L2124:
	ldr	r1, .L2163+8
	mov	r0, r5
	bl	device_create_file
	cmp	r0, #0
	bne	.L2162
.L2125:
	mov	r0, r5
	mov	r1, r4
	bl	dev_set_drvdata
	mov	r6, #65024
	movw	ip, #:lower16:wcd9xxx_mbhc_fw_read
	add	lr, r4, #172
	movt	r6, 65535
	movt	ip, #:upper16:wcd9xxx_mbhc_fw_read
	mov	r3, #0
	mov	r2, r3
	mov	r1, r3
	str	r6, [r4, #168]
	str	lr, [r4, #172]
	add	r0, r4, #184
	movw	r5, #:lower16:delayed_work_timer_fn
	str	lr, [r4, #176]
	movt	r5, #:upper16:delayed_work_timer_fn
	str	ip, [r4, #180]
	bl	init_timer_key
	movw	ip, #:lower16:wcd9xxx_btn_lpress_fn
	add	r1, r4, #8
	str	r6, [r4, #4]
	movt	ip, #:upper16:wcd9xxx_btn_lpress_fn
	add	r2, r4, #168
	mov	r3, #0
	add	r0, r4, #20
	str	r1, [r4, #8]
	str	r1, [r4, #12]
	mov	r1, r3
	str	ip, [r4, #16]
	str	r5, [r4, #200]
	str	r2, [r4, #204]
	mov	r2, r3
	bl	init_timer_key
	movw	ip, #:lower16:wcd9xxx_mbhc_insert_work
	add	lr, r4, #228
	str	r5, [r4, #36]
	add	r2, r4, #4
	movt	ip, #:upper16:wcd9xxx_mbhc_insert_work
	mov	r3, #0
	add	r0, r4, #240
	mov	r1, r3
	str	r2, [r4, #40]
	mov	r2, r3
	str	r6, [r4, #224]
	str	lr, [r4, #228]
	str	lr, [r4, #232]
	str	ip, [r4, #236]
	bl	init_timer_key
	add	r3, r4, #224
	str	r5, [r4, #256]
	str	r3, [r4, #260]
	b	.L2119
.L2159:
	movw	r0, #:lower16:.LC67
	movt	r0, #:upper16:.LC67
	bl	printk
	b	.L2122
.L2160:
	movw	r0, #:lower16:.LC69
	movt	r0, #:upper16:.LC69
	bl	printk
	b	.L2123
.L2156:
	movw	r0, #:lower16:.LC78
	ldr	r2, [r3, #28]
	ldr	r1, .L2163+12
	movt	r0, #:upper16:.LC78
	bl	printk
	ldr	r3, [r4, #532]
	mov	r2, r4
	mov	r0, r6
	ldr	r1, [r3, #24]
	bl	wcd9xxx_free_irq
.L2139:
	ldr	r3, [r4, #532]
	mov	r2, r4
	mov	r0, r6
	ldr	r1, [r3, #12]
	bl	wcd9xxx_free_irq
.L2137:
	ldr	r3, [r4, #532]
	mov	r2, r4
	mov	r0, r6
	ldr	r1, [r3, #16]
	bl	wcd9xxx_free_irq
.L2135:
	ldr	r3, [r4, #532]
	mov	r2, r4
	mov	r0, r6
	ldr	r1, [r3]
	bl	wcd9xxx_free_irq
.L2133:
	ldr	r3, [r4, #532]
	mov	r0, r6
	mov	r2, r4
	ldr	r1, [r3, #20]
	bl	wcd9xxx_free_irq
.L2131:
	mov	r1, r9
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_unregister_notifier
	ldr	r0, .L2163+16
	bl	wakeup_source_remove
	ldr	r0, .L2163+16
	bl	wakeup_source_drop
	b	.L2116
.L2150:
	movw	r0, #:lower16:.LC72
	mov	r2, r5
	ldr	r1, .L2163+12
	movt	r0, #:upper16:.LC72
	bl	printk
	b	.L2116
.L2152:
	ldr	r3, [r4, #532]
	movw	r0, #:lower16:.LC78
	ldr	r1, .L2163+12
	movt	r0, #:upper16:.LC78
	ldr	r2, [r3]
	bl	printk
	b	.L2133
.L2151:
	ldr	r2, [r4, #532]
	movw	r0, #:lower16:.LC76
	mov	r3, r5
	ldr	r1, .L2163+12
	movt	r0, #:upper16:.LC76
	ldr	r2, [r2, #20]
	bl	printk
	b	.L2131
.L2155:
	movw	r0, #:lower16:.LC78
	ldr	r1, .L2163+12
	ldr	r2, [r3, #24]
	movt	r0, #:upper16:.LC78
	bl	printk
	b	.L2139
.L2154:
	ldr	r3, [r4, #532]
	movw	r0, #:lower16:.LC78
	ldr	r1, .L2163+12
	movt	r0, #:upper16:.LC78
	ldr	r2, [r3, #12]
	bl	printk
	b	.L2137
.L2153:
	ldr	r3, [r4, #532]
	movw	r0, #:lower16:.LC78
	ldr	r1, .L2163+12
	movt	r0, #:upper16:.LC78
	ldr	r2, [r3, #16]
	bl	printk
	b	.L2135
.L2148:
	movw	r0, #:lower16:.LC61
	ldr	r1, .L2163+12
	mvn	r5, #21
	movt	r0, #:upper16:.LC61
	bl	printk
	b	.L2116
.L2158:
	movw	r0, #:lower16:.LC65
	movt	r0, #:upper16:.LC65
	bl	printk
	b	.L2116
.L2162:
	movw	r0, #:lower16:.LC70
	ldr	r1, [r6, #16]
	movt	r0, #:upper16:.LC70
	bl	printk
	b	.L2125
.L2157:
	movw	r0, #:lower16:.LC63
	ldr	r1, .L2163+12
	movt	r0, #:upper16:.LC63
	bl	printk
	b	.L2116
.L2161:
	movw	r0, #:lower16:.LC70
	ldr	r1, [r6]
	movt	r0, #:upper16:.LC70
	bl	printk
	b	.L2124
.L2164:
	.align	2
.L2163:
	.word	.LANCHOR2+132
	.word	.LANCHOR0+772
	.word	.LANCHOR3+16
	.word	.LANCHOR0+752
	.word	.LANCHOR2+8
	.fnend
	.size	wcd9xxx_mbhc_init, .-wcd9xxx_mbhc_init
	.align	2
	.global	wcd9xxx_mbhc_deinit
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9xxx_mbhc_deinit, %function
wcd9xxx_mbhc_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r1, #6
	mov	r4, r0
	str	r6, [sp, #8]
	ldr	r6, .L2167
	str	lr, [sp, #12]
	ldr	r3, [r0, #320]
	mov	r0, r3
	ldr	r5, [r3, #4]
	bl	wcd9xxx_regmgr_cond_deregister
	ldr	r3, [r4, #532]
	mov	r2, r4
	mov	r0, r5
	ldr	r1, [r3, #12]
	bl	wcd9xxx_free_irq
	ldr	r3, [r4, #532]
	mov	r0, r5
	mov	r2, r4
	ldr	r1, [r3, #16]
	bl	wcd9xxx_free_irq
	ldr	r3, [r4, #532]
	mov	r0, r5
	mov	r2, r4
	ldr	r1, [r3]
	bl	wcd9xxx_free_irq
	ldr	r3, [r4, #532]
	mov	r0, r5
	mov	r2, r4
	ldr	r1, [r3, #20]
	bl	wcd9xxx_free_irq
	ldr	r3, [r4, #532]
	mov	r0, r5
	mov	r2, r4
	ldr	r1, [r3, #32]
	bl	wcd9xxx_free_irq
	ldr	r3, [r4, #532]
	mov	r0, r5
	mov	r2, r4
	ldr	r1, [r3, #24]
	bl	wcd9xxx_free_irq
	ldr	r3, [r4, #532]
	mov	r2, r4
	mov	r0, r5
	ldr	r1, [r3, #28]
	bl	wcd9xxx_free_irq
	add	r1, r4, #492
	ldr	r0, [r4, #320]
	bl	wcd9xxx_resmgr_unregister_notifier
	ldr	r0, [r4, #536]
	bl	debugfs_remove
	ldr	r0, [r4, #540]
	bl	debugfs_remove
	mov	r0, r6
	bl	wakeup_source_remove
	ldrd	r4, [sp]
	mov	r0, r6
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	wakeup_source_drop
.L2168:
	.align	2
.L2167:
	.word	.LANCHOR2+8
	.fnend
	.size	wcd9xxx_mbhc_deinit, .-wcd9xxx_mbhc_deinit
	.global	det_wake_lock
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.31616, %object
	.size	__func__.31616, 25
__func__.31616:
	.ascii	"wcd9xxx_start_hs_polling\000"
	.space	3
	.type	__func__.32401, %object
	.size	__func__.32401, 14
__func__.32401:
	.ascii	"wcd9xxx_get_z\000"
	.space	2
	.type	__func__.32491, %object
	.size	__func__.32491, 21
__func__.32491:
	.ascii	"wcd9xxx_hphr_ocp_irq\000"
	.space	3
	.type	__func__.32275, %object
	.size	__func__.32275, 24
__func__.32275:
	.ascii	"wcd9xxx_codec_v_sta_dce\000"
	.type	__func__.32484, %object
	.size	__func__.32484, 21
__func__.32484:
	.ascii	"wcd9xxx_hphl_ocp_irq\000"
	.space	3
	.type	__func__.32477, %object
	.size	__func__.32477, 24
__func__.32477:
	.ascii	"wcd9xxx_release_handler\000"
	.type	__func__.31889, %object
	.size	__func__.31889, 27
__func__.31889:
	.ascii	"wcd9xxx_cleanup_hs_polling\000"
	.space	1
	.type	__func__.31875, %object
	.size	__func__.31875, 20
__func__.31875:
	.ascii	"wcd9xxx_recalibrate\000"
	.type	__func__.31861, %object
	.size	__func__.31861, 30
__func__.31861:
	.ascii	"wcd9xxx_mbhc_setup_hs_polling\000"
	.space	2
	.type	__func__.32026, %object
	.size	__func__.32026, 31
__func__.32026:
	.ascii	"wcd9xxx_codec_cs_get_plug_type\000"
	.space	1
	.type	__func__.31914, %object
	.size	__func__.31914, 20
__func__.31914:
	.ascii	"wcd9xxx_hphl_status\000"
	.type	__func__.32048, %object
	.size	__func__.32048, 28
__func__.32048:
	.ascii	"wcd9xxx_codec_get_plug_type\000"
	.type	__func__.31759, %object
	.size	__func__.31759, 20
__func__.31759:
	.ascii	"wcd9xxx_report_plug\000"
.LC0:
	.short	335
	.byte	-1
	.byte	-16
	.short	334
	.byte	-1
	.byte	-96
	.short	335
	.byte	-1
	.byte	-8
	.short	334
	.byte	-1
	.byte	-64
	.short	335
	.byte	-1
	.byte	-16
	.short	334
	.byte	-1
	.byte	-96
	.type	__func__.32763, %object
	.size	__func__.32763, 25
__func__.32763:
	.ascii	"wcd9xxx_detect_impedance\000"
	.space	3
	.type	__func__.32119, %object
	.size	__func__.32119, 29
__func__.32119:
	.ascii	"wcd9xxx_find_plug_and_report\000"
	.space	3
	.type	__func__.32132, %object
	.size	__func__.32132, 30
__func__.32132:
	.ascii	"wcd9xxx_mbhc_decide_swch_plug\000"
	.space	2
	.type	__func__.31766, %object
	.size	__func__.31766, 32
__func__.31766:
	.ascii	"wcd9xxx_schedule_hs_detect_plug\000"
	.type	__func__.32141, %object
	.size	__func__.32141, 30
__func__.32141:
	.ascii	"wcd9xxx_mbhc_detect_plug_type\000"
	.space	2
	.type	__func__.31776, %object
	.size	__func__.31776, 30
__func__.31776:
	.ascii	"wcd9xxx_cancel_hs_detect_plug\000"
	.space	2
	.type	__func__.32151, %object
	.size	__func__.32151, 27
__func__.32151:
	.ascii	"wcd9xxx_hs_insert_irq_swch\000"
	.space	1
	.type	__func__.32545, %object
	.size	__func__.32545, 30
__func__.32545:
	.ascii	"wcd9xxx_setup_jack_detect_irq\000"
	.space	2
	.type	__func__.32566, %object
	.size	__func__.32566, 21
__func__.32566:
	.ascii	"wcd9xxx_mbhc_fw_read\000"
	.space	3
	.type	__func__.32339, %object
	.size	__func__.32339, 29
__func__.32339:
	.ascii	"wcd9xxx_mech_plug_detect_irq\000"
	.space	3
	.type	__func__.32449, %object
	.size	__func__.32449, 20
__func__.32449:
	.ascii	"wcd9xxx_dce_handler\000"
	.type	CSWTCH.203, %object
	.size	CSWTCH.203, 32
CSWTCH.203:
	.word	67108864
	.word	33554432
	.word	16777216
	.word	8388608
	.word	4194304
	.word	2097152
	.word	1048576
	.word	524288
	.type	__func__.32616, %object
	.size	__func__.32616, 19
__func__.32616:
	.ascii	"wcd9xxx_mbhc_start\000"
	.space	1
	.type	__func__.31711, %object
	.size	__func__.31711, 30
__func__.31711:
	.ascii	"wcd9xxx_get_mbhc_micbias_regs\000"
	.space	2
	.type	__func__.32803, %object
	.size	__func__.32803, 18
__func__.32803:
	.ascii	"wcd9xxx_mbhc_init\000"
	.space	2
	.type	mbhc_trrs_debug_ops, %object
	.size	mbhc_trrs_debug_ops, 108
mbhc_trrs_debug_ops:
	.space	12
	.word	codec_debug_write
	.space	28
	.word	codec_debug_open
	.space	60
	.type	mbhc_debug_ops, %object
	.size	mbhc_debug_ops, 108
mbhc_debug_ops:
	.space	8
	.word	codec_mbhc_debug_read
	.space	32
	.word	codec_debug_open
	.space	60
	.type	__param_str_impedance_detect_en, %object
	.size	__param_str_impedance_detect_en, 33
__param_str_impedance_detect_en:
	.ascii	"wcd9xxx-mbhc.impedance_detect_en\000"
	.data
	.align	2
	.set	.LANCHOR3,. + 0
	.type	dev_attr_key_state, %object
	.size	dev_attr_key_state, 16
dev_attr_key_state:
	.word	.LC85
	.short	436
	.space	2
	.word	key_state_onoff_show
	.word	0
	.type	dev_attr_state, %object
	.size	dev_attr_state, 16
dev_attr_state:
	.word	.LC84
	.short	436
	.space	2
	.word	earjack_state_onoff_show
	.word	0
	.bss
	.align	3
	.set	.LANCHOR2,. + 0
	.type	detect_use_vddio_switch, %object
	.size	detect_use_vddio_switch, 1
detect_use_vddio_switch:
	.space	1
	.space	7
	.type	det_wake_lock, %object
	.size	det_wake_lock, 120
det_wake_lock:
	.space	120
	.type	impedance_detect_en, %object
	.size	impedance_detect_en, 4
impedance_detect_en:
	.space	4
	.type	__key.32810, %object
	.size	__key.32810, 0
__key.32810:
	.type	__key.32815, %object
	.size	__key.32815, 0
__key.32815:
	.section	.data.unlikely,"aw",%progbits
	.set	.LANCHOR1,. + 0
	.type	__warned.32003, %object
	.size	__warned.32003, 1
__warned.32003:
	.space	1
	.type	__warned.32398, %object
	.size	__warned.32398, 1
__warned.32398:
	.space	1
	.type	__warned.31890, %object
	.size	__warned.31890, 1
__warned.31890:
	.space	1
	.type	__warned.31858, %object
	.size	__warned.31858, 1
__warned.31858:
	.space	1
	.type	__warned.32027, %object
	.size	__warned.32027, 1
__warned.32027:
	.space	1
	.type	__warned.31911, %object
	.size	__warned.31911, 1
__warned.31911:
	.space	1
	.type	__warned.32049, %object
	.size	__warned.32049, 1
__warned.32049:
	.space	1
	.type	__warned.31756, %object
	.size	__warned.31756, 1
__warned.31756:
	.space	1
	.type	__warned.32764, %object
	.size	__warned.32764, 1
__warned.32764:
	.space	1
	.type	__warned.32120, %object
	.size	__warned.32120, 1
__warned.32120:
	.space	1
	.type	__warned.32133, %object
	.size	__warned.32133, 1
__warned.32133:
	.space	1
	.type	__warned.31767, %object
	.size	__warned.31767, 1
__warned.31767:
	.space	1
	.type	__warned.32142, %object
	.size	__warned.32142, 1
__warned.32142:
	.space	1
	.type	__warned.31777, %object
	.size	__warned.31777, 1
__warned.31777:
	.space	1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"<3>%s: internal bias requested but codec did not pr"
	.ascii	"ovide callback\012\000"
	.space	1
.LC2:
	.ascii	"<3>Error, no wcd9xxx calibration\012\000"
	.space	2
.LC3:
	.ascii	"%d\012\000"
.LC4:
	.ascii	" \000"
	.space	2
.LC5:
	.ascii	"MBHC micbias is already pulled down unexpectedly\012"
	.ascii	"\000"
	.space	2
.LC6:
	.ascii	"/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/w"
	.ascii	"cd9xxx-mbhc.c\000"
	.space	3
.LC7:
	.ascii	"%s: BCL should have acquired\012\000"
	.space	2
.LC8:
	.ascii	"<6>%s: received HPHR OCP irq\012\000"
	.space	2
.LC9:
	.ascii	"<6>%s: retry\012\000"
	.space	2
.LC10:
	.ascii	"<3>%s: Mic Bias voltage is set to zero\012\000"
.LC11:
	.ascii	"<6>%s: received HPHL OCP irq\012\000"
	.space	2
.LC12:
	.ascii	"<3>%s: Bad wcd9xxx private data\012\000"
	.space	3
.LC13:
	.ascii	"<6>%s: Reporting btn press\012\000"
.LC14:
	.ascii	"<6>%s: Reporting btn release\012\000"
	.space	2
.LC15:
	.ascii	"dce_z = %x(%dmv)\012\000"
	.space	2
.LC16:
	.ascii	"dce_mb = %x(%dmv)\012\000"
	.space	1
.LC17:
	.ascii	"dce_nsc_cs_z = %x(%dmv)\012\000"
	.space	3
.LC18:
	.ascii	"sta_z = %x(%dmv)\012\000"
	.space	2
.LC19:
	.ascii	"sta_mb = %x(%dmv)\012\000"
	.space	1
.LC20:
	.ascii	"t_dce = %d\012\000"
.LC21:
	.ascii	"t_sta = %d\012\000"
.LC22:
	.ascii	"micb_mv = %dmv\012\000"
.LC23:
	.ascii	"v_ins_hu = %x(%dmv)\012\000"
	.space	3
.LC24:
	.ascii	"v_ins_h = %x(%dmv)\012\000"
.LC25:
	.ascii	"v_b1_hu = %x(%dmv)\012\000"
.LC26:
	.ascii	"v_b1_h = %x(%dmv)\012\000"
	.space	1
.LC27:
	.ascii	"v_brh = %x(%dmv)\012\000"
	.space	2
.LC28:
	.ascii	"v_brl = %x(%dmv)\012\000"
	.space	2
.LC29:
	.ascii	"v_no_mic = %x(%dmv)\012\000"
	.space	3
.LC30:
	.ascii	"v_inval_ins_low = %d\012\000"
	.space	2
.LC31:
	.ascii	"v_inval_ins_high = %d\012\000"
	.space	1
.LC32:
	.ascii	"Invalid jack detection configuration\012\000"
	.space	2
.LC33:
	.ascii	"Insert detect insert = %d\012\000"
	.space	1
.LC34:
	.ascii	"<4>%s: failed get new dce_z/sta_z 0x%x/0x%x\012\000"
	.space	3
.LC35:
	.ascii	"Unknown event %d\012\000"
	.space	2
.LC36:
	.ascii	"<3>%s: Error, no calibration exists\012\000"
	.space	3
.LC37:
	.ascii	"<6>%s: Reporting removal %d(%x)\012\000"
	.space	3
.LC38:
	.ascii	"<6>%s: Reporting removal (%x)\012\000"
	.space	1
.LC39:
	.ascii	"<6>%s: Reporting insertion %d(%x)\012\000"
	.space	1
.LC40:
	.ascii	"Unexpected current plug_type %d, plug_type %d\012\000"
	.space	1
.LC41:
	.ascii	"<3>%s: Switch IRQ used, invalid MBHC Removal\012\000"
	.space	2
.LC42:
	.ascii	"headset detect\000"
	.space	1
.LC43:
	.ascii	"<3>%s: Failed to request gpio irq %d\012\000"
	.space	2
.LC44:
	.ascii	"<3>%s: Failed to enable wake up irq %d\012\000"
.LC45:
	.ascii	"Jack Detect\000"
.LC46:
	.ascii	"<3>%s: Failed to request insert detect irq %d\012\000"
	.space	1
.LC47:
	.ascii	"wcd9320/wcd9320_mbhc.bin\000"
	.space	3
.LC48:
	.ascii	"<3>%s: Cannot load MBHC firmware use default cal\012"
	.ascii	"\000"
	.space	2
.LC49:
	.ascii	"<3>%s: Invalid MBHC cal data size use default cal\012"
	.ascii	"\000"
	.space	1
.LC50:
	.ascii	"<6>%s: MBHC Firmware read succesful\012\000"
	.space	3
.LC51:
	.ascii	"<4>%s: failed to hold suspend\012\000"
	.space	1
.LC52:
	.ascii	"<4>%s: mbhc polling is not active, skip button pres"
	.ascii	"s\012\000"
	.space	2
.LC53:
	.ascii	"<6>%s: Meas HW - STA 0x%x,%d,%d\012\000"
	.space	3
.LC54:
	.ascii	"<6>%s: Meas HW - DCE 0x%x,%d,%d button %d\012\000"
	.space	1
.LC55:
	.ascii	"<6>%s: Meas %d - DCE 0x%x,%d,%d button %d\012\000"
	.space	1
.LC56:
	.ascii	"Button pressed twice without release event\012\000"
.LC57:
	.ascii	"<3>%s: no codec\012\000"
	.space	3
.LC58:
	.ascii	"<3>Error: unsupported clock rate %d\012\000"
	.space	3
.LC59:
	.ascii	"<3>%s: Invalid MIC BIAS for MBHC\012\000"
	.space	2
.LC60:
	.ascii	"<6>%s: internal bias requested but codec did not pr"
	.ascii	"ovide callback\012\000"
	.space	1
.LC61:
	.ascii	"<3>%s: Interrupt mapping not provided\012\000"
	.space	1
.LC62:
	.ascii	"Headset Jack\000"
	.space	3
.LC63:
	.ascii	"<3>%s: Failed to create new jack\012\000"
	.space	2
.LC64:
	.ascii	"Button Jack\000"
.LC65:
	.ascii	"<3>Failed to create new jack\012\000"
	.space	2
.LC66:
	.ascii	"audio\000"
	.space	2
.LC67:
	.ascii	"<3>Failed to create class(audio)!\012\000"
	.space	1
.LC68:
	.ascii	"earjack\000"
.LC69:
	.ascii	"<3>Failed to create device(earjack)!\012\000"
	.space	2
.LC70:
	.ascii	"<3>Failed to create device file in sysfs entries(%s"
	.ascii	")!\012\000"
	.space	1
.LC71:
	.ascii	"&mbhc->mbhc_lock\000"
	.space	3
.LC72:
	.ascii	"<3>%s: Failed to register notifier %d\012\000"
	.space	1
.LC73:
	.ascii	"TRRS\000"
	.space	3
.LC74:
	.ascii	"wcd9xxx_mbhc\000"
	.space	3
.LC75:
	.ascii	"Headset insert detect\000"
	.space	2
.LC76:
	.ascii	"<3>%s: Failed to request irq %d, ret = %d\012\000"
	.space	1
.LC77:
	.ascii	"Headset remove detect\000"
	.space	2
.LC78:
	.ascii	"<3>%s: Failed to request irq %d\012\000"
	.space	3
.LC79:
	.ascii	"DC Estimation detect\000"
	.space	3
.LC80:
	.ascii	"Button Release detect\000"
	.space	2
.LC81:
	.ascii	"HPH_L OCP detect\000"
	.space	3
.LC82:
	.ascii	"HPH_R OCP detect\000"
	.space	3
.LC83:
	.ascii	"mbhc_wake_lock\000"
	.space	1
.LC84:
	.ascii	"state\000"
	.space	2
.LC85:
	.ascii	"key_state\000"
	.section	__param,"a",%progbits
	.align	2
	.type	__param_impedance_detect_en, %object
	.size	__param_impedance_detect_en, 16
__param_impedance_detect_en:
	.word	__param_str_impedance_detect_en
	.word	param_ops_int
	.short	436
	.short	-1
	.word	impedance_detect_en
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
