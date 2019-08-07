taiko_hph_impedance_get:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r0, r3
	str	r3, [r1, #72]
	bx	lr
	.fnend
	.size	taiko_hph_impedance_get, .-taiko_hph_impedance_get
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	slim_tx_mixer_get, %function
slim_tx_mixer_get:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #96]
	mov	r0, #0
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #44]
	str	r3, [r1, #72]
	bx	lr
	.fnend
	.size	slim_tx_mixer_get, .-slim_tx_mixer_get
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	slim_rx_mux_get, %function
slim_rx_mux_get:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #96]
	mov	r0, #0
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #44]
	str	r3, [r1, #72]
	bx	lr
	.fnend
	.size	slim_rx_mux_get, .-slim_rx_mux_get
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_spk_dac_event, %function
taiko_spk_dac_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	taiko_spk_dac_event, .-taiko_spk_dac_event
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_readable, %function
taiko_readable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:taiko_reg_readable
	movt	r3, #:upper16:taiko_reg_readable
	ldrb	r0, [r3, r1]	@ zero_extendqisi2
	bx	lr
	.fnend
	.size	taiko_readable, .-taiko_readable
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_set_dai_sysclk, %function
taiko_set_dai_sysclk:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	taiko_set_dai_sysclk, .-taiko_set_dai_sysclk
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_esxxx_startup, %function
taiko_esxxx_startup:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	taiko_esxxx_startup, .-taiko_esxxx_startup
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_compute_impedance, %function
taiko_compute_impedance:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r1
	movw	r4, #61980
	str	r6, [sp, #8]
	movt	r4, 62
	str	lr, [sp, #12]
	ldrsh	r6, [r0]
	mov	lr, #1000
	ldrsh	ip, [r0, #2]
	ldrsh	r1, [r0, #4]
	sub	r0, r6, ip
	sub	r6, r6, r1
	mul	r0, lr, r0
	sdiv	r0, r0, r6
	smull	r0, r1, r0, r4
	lsr	ip, r0, #16
	asr	r6, r1, #16
	orr	ip, ip, r1, lsl #16
	lsl	r1, r6, #4
	lsl	r0, ip, #4
	orr	r1, r1, ip, lsr #28
	subs	r0, r0, ip
	sbc	r1, r1, r6
	lsl	ip, r0, #8
	lsl	r6, r1, #8
	adds	ip, r0, ip
	orr	r6, r6, r0, lsr #24
	lsr	ip, ip, #16
	adc	r1, r1, r6
	orr	ip, ip, r1, lsl #16
	str	ip, [r2]
	ldrsh	r2, [r5]
	ldrsh	r0, [r5, #2]
	ldrsh	r1, [r5, #4]
	ldr	r6, [sp, #8]
	sub	r0, r2, r0
	sub	r2, r2, r1
	mul	r0, lr, r0
	sdiv	r0, r0, r2
	smull	r0, r1, r0, r4
	ldrd	r4, [sp]
	add	sp, sp, #12
	lsr	r2, r0, #16
	asr	ip, r1, #16
	orr	r2, r2, r1, lsl #16
	lsl	r1, ip, #4
	lsl	r0, r2, #4
	orr	r1, r1, r2, lsr #28
	subs	r0, r0, r2
	sbc	r1, r1, ip
	lsl	r2, r0, #8
	lsl	ip, r1, #8
	adds	r2, r0, r2
	orr	ip, ip, r0, lsr #24
	lsr	r2, r2, #16
	adc	r1, r1, ip
	orr	r2, r2, r1, lsl #16
	str	r2, [r3]
	ldr	pc, [sp], #4
	.fnend
	.size	taiko_compute_impedance, .-taiko_compute_impedance
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_get_cdc_type, %function
taiko_get_cdc_type:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #1
	bx	lr
	.fnend
	.size	taiko_get_cdc_type, .-taiko_get_cdc_type
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_suspend, %function
taiko_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	taiko_suspend, .-taiko_suspend
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_pa_gain_put, %function
taiko_pa_gain_put:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r2, #224
	str	lr, [sp, #4]
	ldr	r3, [r1, #72]
	movw	r1, #445
	ldr	r0, [r0, #96]
	lsl	r3, r3, #5
	and	r3, r3, r2
	bl	snd_soc_update_bits
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, #0
	ldr	pc, [sp], #4
	.fnend
	.size	taiko_pa_gain_put, .-taiko_pa_gain_put
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	tx_hpf_corner_freq_callback, %function
tx_hpf_corner_freq_callback:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r3, [r0, #-4]	@ zero_extendqisi2
	mov	r2, #48
	ldrd	r0, [r0, #-12]
	lsl	r3, r3, #4
	lsl	r1, r1, #3
	ldr	r0, [r0]
	add	r1, r1, #536
	add	r1, r1, #3
	uxth	r1, r1
	b	snd_soc_update_bits
	.fnend
	.size	tx_hpf_corner_freq_callback, .-tx_hpf_corner_freq_callback
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	spkr_drv_wrnd_param_set, %function
spkr_drv_wrnd_param_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:.LANCHOR0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movt	r3, #:upper16:.LANCHOR0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r4, [r3]
	cmp	r4, #0
	bne	.L30
.L16:
	mov	r0, r4
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L30:
	ldr	r9, [r4]
	mov	r5, r0
	mov	r6, r1
	movw	r7, #:lower16:.LANCHOR1
	mov	r10, r4
	movt	r7, #:upper16:.LANCHOR1
	add	r8, r9, #20
	mov	r0, r8
	bl	mutex_lock
	mov	r0, r5
	mov	r1, r6
	ldr	r5, [r7]
	bl	param_set_int
	subs	r4, r0, #0
	bne	.L21
	add	r3, r5, #1
	ldr	r6, [r7]
	cmp	r3, #1
	bls	.L31
	cmp	r5, #1
	cmpeq	r6, #0
	beq	.L32
.L21:
	mov	r0, r8
	bl	mutex_unlock
	b	.L16
.L31:
	cmp	r6, #1
	bne	.L21
	add	r5, r10, #552
	add	r10, r10, #416
	mov	r0, r5
	bl	mutex_lock
	mov	r1, r6
	mov	r0, r10
	bl	wcd9xxx_resmgr_get_bandgap
	mov	r0, r5
	bl	mutex_unlock
	mov	r3, #128
	mov	r0, r9
	mov	r2, r3
	movw	r1, #479
	bl	snd_soc_update_bits
	b	.L21
.L32:
	add	r5, r10, #552
	add	r6, r10, #416
	mov	r0, r5
	bl	mutex_lock
	mov	r0, r6
	mov	r1, #1
	bl	wcd9xxx_resmgr_put_bandgap
	mov	r0, r5
	bl	mutex_unlock
	ldrb	r3, [r10, #390]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L21
	mov	r0, r9
	mov	r3, r4
	mov	r2, #128
	movw	r1, #479
	bl	snd_soc_update_bits
	b	.L21
	.fnend
	.size	spkr_drv_wrnd_param_set, .-spkr_drv_wrnd_param_set
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_get_anc_slot, %function
taiko_get_anc_slot:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r4, r1
	str	lr, [sp, #4]
	ldr	r3, [r0, #96]
	ldr	r0, [r3, #12]
	bl	dev_get_drvdata
	ldr	r3, [r0, #32]
	mov	r0, #0
	str	r3, [r4, #72]
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
	.fnend
	.size	taiko_get_anc_slot, .-taiko_get_anc_slot
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_put_anc_slot, %function
taiko_put_anc_slot:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r4, r1
	str	lr, [sp, #4]
	ldr	r3, [r0, #96]
	ldr	r0, [r3, #12]
	bl	dev_get_drvdata
	ldr	r3, [r4, #72]
	str	r3, [r0, #32]
	mov	r0, #0
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
	.fnend
	.size	taiko_put_anc_slot, .-taiko_put_anc_slot
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_get_anc_func, %function
taiko_get_anc_func:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r4, r1
	str	lr, [sp, #4]
	ldr	r3, [r0, #96]
	ldr	r0, [r3, #12]
	bl	dev_get_drvdata
	ldrb	r3, [r0, #36]	@ zero_extendqisi2
	mov	r0, #0
	str	r3, [r4, #72]
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
	.fnend
	.size	taiko_get_anc_func, .-taiko_get_anc_func
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_get_compander, %function
taiko_get_compander:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r1
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldrd	r2, [r0, #92]
	ldr	r4, [r2, #24]
	ldr	r0, [r3, #12]
	bl	dev_get_drvdata
	add	r4, r4, #90
	ldr	r3, [r0, r4, lsl #2]
	mov	r0, #0
	str	r3, [r5, #72]
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
	.fnend
	.size	taiko_get_compander, .-taiko_get_compander
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_spk_pa, %function
taiko_codec_enable_spk_pa:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r2
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r5, [r0, #12]
	ldr	r0, [r5, #12]
	bl	dev_get_drvdata
	cmp	r4, #1
	mov	r1, r0
	beq	.L43
	cmp	r4, #8
	bne	.L42
	mov	ip, #0
	mov	r0, r5
	mov	r3, ip
	mov	r2, #128
	strb	ip, [r1, #390]
	movw	r1, #479
	bl	snd_soc_update_bits
.L42:
	ldrd	r4, [sp]
	mov	r0, #0
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L43:
	mov	r3, #128
	strb	r4, [r1, #390]
	mov	r0, r5
	mov	r2, r3
	movw	r1, #479
	bl	snd_soc_update_bits
	b	.L42
	.fnend
	.size	taiko_codec_enable_spk_pa, .-taiko_codec_enable_spk_pa
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_esxxx_shutdown, %function
taiko_esxxx_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #64]
	ldr	r3, [r3, #12]
	ldr	r0, [r3]
	b	dev_get_drvdata
	.fnend
	.size	taiko_esxxx_shutdown, .-taiko_esxxx_shutdown
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_esxxx_get_channel_map, %function
taiko_esxxx_get_channel_map:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, r0
	movw	r5, #:lower16:.LANCHOR1
	strd	r6, [sp, #8]
	mov	r6, r1
	mov	r7, r3
	strd	r8, [sp, #16]
	movw	r1, #:lower16:.LANCHOR2
	movt	r5, #:upper16:.LANCHOR1
	str	r10, [sp, #24]
	movt	r1, #:upper16:.LANCHOR2
	mov	r8, r2
	str	lr, [sp, #28]
	ldr	r10, [r0]
	.pad #8
	sub	sp, sp, #8
	ldr	ip, [r6]
	ldr	lr, [r7]
	ldr	r3, [r0, #4]
	movw	r0, #:lower16:.LC1
	mov	r2, r10
	movt	r0, #:upper16:.LC1
	ldr	r9, [sp, #40]
	stm	sp, {ip, lr}
	bl	printk
	mov	r0, r4
	ldr	r3, [r5, #4]
	blx	r3
	subs	r10, r0, #0
	beq	.L48
	ldr	lr, [r5, #8]
	mov	r3, r7
	mov	r2, r8
	mov	r1, r6
	mov	r0, r4
	str	r9, [sp, #40]
	mov	ip, lr
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	ldr	lr, [sp, #28]
	add	sp, sp, #32
	bx	ip
.L48:
	ldr	r3, [r4, #64]
	ldr	r0, [r3, #12]
	bl	dev_get_drvdata
	ldr	r2, [r4, #4]
	cmp	r2, #7
	bhi	.L49
	mov	r3, #1
	lsl	r3, r3, r2
	tst	r3, #234
	bne	.L50
	tst	r3, #21
	beq	.L49
	cmp	r7, #0
	cmpne	r9, #0
	beq	.L66
	add	r2, r2, r2, lsl #2
	lsl	r2, r2, #3
	add	r3, r0, r2
	add	r2, r2, #48
	ldr	r3, [r3, #48]
	add	r2, r0, r2
	cmp	r2, r3
	sub	r2, r3, #16
	moveq	ip, r10
	beq	.L53
	sub	r9, r9, #4
	mov	ip, r10
.L54:
	ldr	r3, [r2, #4]
	add	ip, ip, #1
	str	r3, [r9, #4]!
	ldr	r3, [r4, #4]
	ldr	r1, [r2, #16]
	add	r3, r3, r3, lsl #2
	sub	r2, r1, #16
	add	r3, r0, r3, lsl #3
	add	r3, r3, #48
	cmp	r1, r3
	bne	.L54
.L53:
	str	ip, [r7]
	b	.L47
.L50:
	cmp	r6, #0
	cmpne	r8, #0
	beq	.L67
	add	r2, r2, r2, lsl #2
	lsl	r2, r2, #3
	add	r3, r0, r2
	add	r2, r2, #48
	ldr	r3, [r3, #48]
	add	r2, r0, r2
	cmp	r3, r2
	sub	r2, r3, #16
	moveq	ip, r10
	beq	.L56
	sub	r8, r8, #4
	mov	ip, r10
.L57:
	ldr	r3, [r2, #4]
	add	ip, ip, #1
	str	r3, [r8, #4]!
	ldr	r3, [r4, #4]
	ldr	r1, [r2, #16]
	add	r3, r3, r3, lsl #2
	sub	r2, r1, #16
	add	r3, r0, r3, lsl #3
	add	r3, r3, #48
	cmp	r1, r3
	bne	.L57
.L56:
	str	ip, [r6]
.L47:
	mov	r0, r10
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L49:
	movw	r0, #:lower16:.LC4
	ldr	r1, .L68
	movt	r0, #:upper16:.LC4
	bl	printk
	b	.L47
.L66:
	movw	r0, #:lower16:.LC2
	mov	r3, r7
	ldr	r1, .L68
	mov	r2, r9
	movt	r0, #:upper16:.LC2
	bl	printk
	mvn	r10, #21
	b	.L47
.L67:
	movw	r0, #:lower16:.LC3
	mov	r3, r6
	ldr	r1, .L68
	mov	r2, r8
	movt	r0, #:upper16:.LC3
	bl	printk
	mvn	r10, #21
	b	.L47
.L69:
	.align	2
.L68:
	.word	.LANCHOR2+28
	.fnend
	.size	taiko_esxxx_get_channel_map, .-taiko_esxxx_get_channel_map
	.section	.devexit.text,"ax",%progbits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_remove, %function
taiko_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	add	r0, r0, #8
	bl	snd_soc_unregister_codec
	mov	r0, #0
	pop	{r4, pc}
	.fnend
	.size	taiko_remove, .-taiko_remove
	.section	.exit.text,"ax",%progbits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_exit, %function
taiko_codec_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L73
	b	platform_driver_unregister
.L74:
	.align	2
.L73:
	.word	.LANCHOR1+12
	.fnend
	.size	taiko_codec_exit, .-taiko_codec_exit
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_prepare, %function
taiko_prepare:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	mov	fp, r1
	str	lr, [sp, #32]
	ldr	r6, [r1, #64]
	.pad #20
	sub	sp, sp, #20
	ldr	r0, [r6, #12]
	bl	dev_get_drvdata
	ldr	r4, [r4, #48]
	cmp	r4, #0
	bne	.L89
	ldr	r3, [fp, #4]
	mov	r5, r0
	mov	lr, #60928
	ldr	r7, [r0, #364]
	mov	ip, #30464
	movt	lr, 2
	movt	ip, 1
	add	r3, r3, r3, lsl #2
	add	r3, r0, r3, lsl #3
	ldrd	r0, [r3, #40]
	subs	r3, r1, #24
	movne	r3, #1
	cmp	r7, #0
	moveq	r3, #1
	cmp	r0, lr
	cmpne	r0, ip
	movne	r0, #1
	moveq	r0, #0
	orrs	r3, r3, r0
	beq	.L77
	mov	r3, #32
	mov	r0, r6
	strb	r4, [r5, #1180]
	mov	r2, r3
	movw	r1, #421
	bl	snd_soc_update_bits
.L89:
	mov	r0, #0
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L77:
	add	r1, sp, #12
	mov	r0, fp
	bl	snd_soc_dapm_codec_dai_get_playback_connected_widgets
	cmp	r0, #0
	beq	.L78
	ldr	r3, [sp, #12]
	str	r3, [sp, #4]
	ldr	r3, [r3]
	cmp	r3, #0
	str	r3, [sp]
	ble	.L80
	movw	r9, #:lower16:.LC6
	movw	r8, #:lower16:.LC7
	ldr	r7, [sp, #4]
	movt	r9, #:upper16:.LC6
	movt	r8, #:upper16:.LC7
	b	.L82
.L95:
	bl	strcmp
	cmp	r0, #0
	beq	.L81
	ldr	r3, [sp]
	cmp	r4, r3
	beq	.L80
.L82:
	ldr	r3, [r7, #4]!
	mov	r1, r9
	add	r4, r4, #1
	ldr	r10, [r3, #4]
	mov	r0, r10
	bl	strcmp
	cmp	r0, #0
	mov	r1, r8
	mov	r0, r10
	bne	.L95
.L81:
	ldr	r0, [sp, #4]
	bl	kfree
	ldr	r2, [fp, #4]
	mov	r0, #60928
	mov	r1, #30464
	ldr	ip, [r5, #364]
	movt	r0, 2
	movt	r1, 1
	add	r2, r2, r2, lsl #2
	cmp	ip, #0
	add	r2, r5, r2, lsl #3
	ldrd	r2, [r2, #40]
	sub	r3, r3, #24
	clz	r3, r3
	lsr	r3, r3, #5
	moveq	r3, #0
	cmp	r2, r1
	cmpne	r2, r0
	moveq	r2, #1
	movne	r2, #0
	ands	r2, r3, r2
	bne	.L96
	mov	r3, #32
	strb	r2, [r5, #1180]
	mov	r0, r6
	movw	r1, #421
	mov	r2, r3
	bl	snd_soc_update_bits
	b	.L89
.L78:
	movw	r1, #:lower16:.LC5
	ldr	r2, .L97
	movt	r1, #:upper16:.LC5
	ldr	r0, [fp, #8]
	bl	dev_err
	b	.L89
.L80:
	ldr	r0, [sp, #4]
	bl	kfree
	b	.L89
.L96:
	mov	r1, #1
	mov	r0, r6
	mov	r3, #0
	mov	r2, #32
	strb	r1, [r5, #1180]
	movw	r1, #421
	bl	snd_soc_update_bits
	b	.L89
.L98:
	.align	2
.L97:
	.word	.LANCHOR2+52
	.fnend
	.size	taiko_prepare, .-taiko_prepare
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_dsm_mux_event, %function
taiko_codec_dsm_mux_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #2
	.save {r4, lr}
	str	r4, [sp, #-8]!
	str	lr, [sp, #4]
	ldr	r4, [r0, #12]
	beq	.L101
	cmp	r2, #8
	bne	.L100
	mov	r0, r4
	mov	r3, #0
	mov	r2, #12
	mov	r1, #944
	bl	snd_soc_update_bits
.L100:
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, #0
	ldr	pc, [sp], #4
.L101:
	mov	r1, #944
	mov	r0, r4
	bl	snd_soc_read
	and	r0, r0, #48
	cmp	r0, #16
	beq	.L104
	cmp	r0, #32
	moveq	r3, #8
	bne	.L100
.L103:
	mov	r0, r4
	mov	r2, #12
	mov	r1, #944
	bl	snd_soc_update_bits
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, #0
	ldr	pc, [sp], #4
.L104:
	mov	r3, #4
	b	.L103
	.fnend
	.size	taiko_codec_dsm_mux_event, .-taiko_codec_dsm_mux_event
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_mad_input_get, %function
taiko_mad_input_get:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r4, r1
	movw	r1, #946
	str	lr, [sp, #4]
	ldr	r0, [r0, #96]
	bl	snd_soc_read
	and	r3, r0, #15
	mov	r0, #0
	str	r3, [r4, #72]
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
	.fnend
	.size	taiko_mad_input_get, .-taiko_mad_input_get
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_put_iir_enable_audio_mixer, %function
taiko_put_iir_enable_audio_mixer:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	ip, #1
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r3, [r1, #72]
	ldr	r1, [r0, #92]
	ldr	r5, [r0, #96]
	ldr	r4, [r1, #16]
	ldr	r2, [r1, #24]
	mov	r0, r5
	lsl	r4, r4, #4
	lsl	r3, r3, r2
	add	r4, r4, #840
	uxth	r1, r4
	lsl	r2, ip, r2
	bl	snd_soc_update_bits
	mov	r1, r4
	mov	r0, r5
	bl	snd_soc_read
	ldrd	r4, [sp]
	mov	r0, #0
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
	.fnend
	.size	taiko_put_iir_enable_audio_mixer, .-taiko_put_iir_enable_audio_mixer
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_get_iir_enable_audio_mixer, %function
taiko_get_iir_enable_audio_mixer:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r1
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r3, [r0, #92]
	ldr	r0, [r0, #96]
	ldr	r1, [r3, #16]
	ldr	r5, [r3, #24]
	lsl	r1, r1, #4
	add	r1, r1, #840
	bl	snd_soc_read
	mov	r3, #1
	ands	r3, r0, r3, lsl r5
	mov	r0, #0
	movne	r3, #1
	moveq	r3, r0
	str	r3, [r4, #72]
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
	.fnend
	.size	taiko_get_iir_enable_audio_mixer, .-taiko_get_iir_enable_audio_mixer
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_pa_gain_get, %function
taiko_pa_gain_get:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r4, r1
	movw	r1, #445
	str	lr, [sp, #4]
	ldr	r0, [r0, #96]
	bl	snd_soc_read
	ubfx	r3, r0, #5, #3
	mov	r0, #0
	str	r3, [r4, #72]
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
	.fnend
	.size	taiko_pa_gain_get, .-taiko_pa_gain_get
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_aux_pga, %function
taiko_codec_enable_aux_pga:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r2
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r3, [r0, #12]
	ldr	r0, [r3, #12]
	bl	dev_get_drvdata
	cmp	r5, #1
	beq	.L116
	cmp	r5, #8
	bne	.L115
	add	r5, r0, #552
	add	r4, r0, #416
	mov	r0, r5
	bl	mutex_lock
	mov	r0, r4
	mov	r1, #0
	bl	wcd9xxx_resmgr_enable_rx_bias
	mov	r0, r4
	mov	r1, #1
	bl	wcd9xxx_resmgr_put_bandgap
	mov	r0, r4
	mov	r1, #1
	bl	wcd9xxx_resmgr_put_clk_block
	mov	r0, r5
	bl	mutex_unlock
.L115:
	ldrd	r4, [sp]
	mov	r0, #0
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L116:
	add	r6, r0, #552
	add	r4, r0, #416
	mov	r0, r6
	bl	mutex_lock
	mov	r1, r5
	mov	r0, r4
	bl	wcd9xxx_resmgr_get_bandgap
	mov	r1, r5
	mov	r0, r4
	bl	wcd9xxx_resmgr_get_clk_block
	mov	r0, r4
	mov	r1, r5
	bl	wcd9xxx_resmgr_enable_rx_bias
	mov	r0, r6
	bl	mutex_unlock
	b	.L115
	.fnend
	.size	taiko_codec_enable_aux_pga, .-taiko_codec_enable_aux_pga
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_rx_bias, %function
taiko_codec_enable_rx_bias:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r4, r2
	str	lr, [sp, #4]
	ldr	r3, [r0, #12]
	ldr	r0, [r3, #12]
	bl	dev_get_drvdata
	cmp	r4, #1
	beq	.L121
	cmp	r4, #8
	bne	.L120
	add	r0, r0, #416
	mov	r1, #0
	bl	wcd9xxx_resmgr_enable_rx_bias
.L120:
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, #0
	ldr	pc, [sp], #4
.L121:
	mov	r1, r4
	add	r0, r0, #416
	bl	wcd9xxx_resmgr_enable_rx_bias
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, #0
	ldr	pc, [sp], #4
	.fnend
	.size	taiko_codec_enable_rx_bias, .-taiko_codec_enable_rx_bias
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_dmic, %function
taiko_codec_enable_dmic:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-20]!
	.save {r4, r5, r6, r7, lr}
	strd	r6, [sp, #8]
	mov	r6, r0
	mov	r7, r2
	str	lr, [sp, #16]
	ldr	r5, [r0, #12]
	.pad #12
	sub	sp, sp, #12
	ldr	r0, [r5, #12]
	bl	dev_get_drvdata
	movw	r1, #:lower16:.LC8
	mov	r4, r0
	ldr	r0, [r6, #4]
	movt	r1, #:upper16:.LC8
	bl	strpbrk
	add	r2, sp, #4
	mov	r1, #10
	bl	kstrtouint
	cmp	r0, #0
	blt	.L141
	ldr	r1, [sp, #4]
	cmp	r1, #6
	bhi	.L127
	mov	r2, #1
	lsl	r1, r2, r1
	tst	r1, #96
	beq	.L142
	add	r0, r4, #20
	movw	r1, #773
.L130:
	cmp	r7, #1
	beq	.L131
.L144:
	cmp	r7, #8
	bne	.L139
	ldr	r4, [r0]
	sub	r4, r4, #1
	cmp	r4, #0
	str	r4, [r0]
	beq	.L143
.L139:
	mov	r0, #0
.L124:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
.L142:
	tst	r1, #24
	bne	.L129
	tst	r1, #6
	beq	.L127
	cmp	r7, #1
	add	r0, r4, #12
	mov	r1, #772
	bne	.L144
.L131:
	ldr	r3, [r0]
	add	r3, r3, #1
	cmp	r3, #1
	str	r3, [r0]
	bne	.L139
	mov	r0, r5
	mov	r3, r2
	bl	snd_soc_update_bits
	mov	r0, #0
	b	.L124
.L129:
	add	r0, r4, #16
	mov	r2, #16
	mov	r1, #772
	b	.L130
.L143:
	mov	r0, r5
	mov	r3, r4
	bl	snd_soc_update_bits
	mov	r0, r4
	b	.L124
.L127:
	movw	r0, #:lower16:.LC10
	ldr	r1, .L145
	movt	r0, #:upper16:.LC10
	bl	printk
	mvn	r0, #21
	b	.L124
.L141:
	movw	r0, #:lower16:.LC9
	ldr	r1, .L145
	movt	r0, #:upper16:.LC9
	bl	printk
	mvn	r0, #21
	b	.L124
.L146:
	.align	2
.L145:
	.word	.LANCHOR2+68
	.fnend
	.size	taiko_codec_enable_dmic, .-taiko_codec_enable_dmic
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	slim_tx_mixer_put, %function
slim_tx_mixer_put:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	mov	r7, r1
	strd	r8, [sp, #16]
	mov	r8, r0
	strd	r10, [sp, #24]
	movw	fp, #:lower16:.LANCHOR2
	str	lr, [sp, #32]
	ldr	r3, [r0, #96]
	.pad #28
	sub	sp, sp, #28
	movt	fp, #:upper16:.LANCHOR2
	ldr	r6, [r3, #4]
	ldr	r4, [r6, #12]
	ldr	r0, [r4, #12]
	add	r9, r4, #20
	bl	dev_get_drvdata
	ldr	r3, [r4, #12]
	mov	r10, r0
	ldr	r0, [r3]
	bl	dev_get_drvdata
	ldr	r2, [r7, #72]
	ldrb	r5, [r6, #38]	@ zero_extendqisi2
	ldr	r3, [r8, #92]
	str	r2, [sp, #4]
	lsl	r2, r5, #2
	str	r0, [sp, #12]
	mov	r0, r9
	ldr	r7, [r3, #24]
	add	r3, fp, r2
	str	r2, [sp, #20]
	ldr	r2, [r3, #92]
	str	r3, [sp, #8]
	str	r2, [sp, #16]
	bl	mutex_lock
	ldrb	r1, [r10, #37]	@ zero_extendqisi2
	ldr	r3, [sp, #8]
	cmp	r1, #1
	cmpne	r5, #1
	bne	.L164
	cmp	r5, #5
	bhi	.L150
	mov	r4, #1
	lsl	r2, r4, r5
	tst	r2, #42
	beq	.L150
	ldr	r0, [sp, #4]
	lsl	r4, r4, r7
	ldr	r2, [r6, #44]
	cmp	r0, #0
	and	r0, r2, r4
	beq	.L151
	cmp	r0, #0
	bne	.L163
	cmp	r1, #2
	add	r2, r10, #40
	ldreq	r3, [r3, #144]
	mov	r1, r7
	streq	r3, [sp, #16]
	mov	r3, #8
	ldr	r0, [sp, #16]
	bl	wcd9xxx_tx_vport_validation
	cmp	r0, #0
	bne	.L163
	ldr	r3, [sp, #20]
	mov	r2, #40
	add	r7, r7, r7, lsl #1
	ldr	r1, [r6, #44]
	mov	r0, r6
	add	r3, r3, r5
	mla	r5, r2, r5, r10
	ldr	r2, [sp, #12]
	orr	r4, r1, r4
	add	r3, r10, r3, lsl #3
	str	r4, [r6, #44]
	ldr	r1, [r3, #52]
	add	r5, r5, #48
	ldr	r2, [r2, #372]
	add	r7, r2, r7, lsl #3
	add	r2, r7, #16
	str	r2, [r3, #52]
	str	r5, [r7, #16]
	str	r1, [r7, #20]
	str	r2, [r1]
	mov	r1, r8
	ldr	r2, [sp, #4]
	bl	snd_soc_dapm_mixer_update_power
.L163:
	mov	r0, r9
	bl	mutex_unlock
	mov	r0, #0
.L147:
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L151:
	cmp	r0, #0
	beq	.L163
	ldr	r3, [sp, #12]
	bic	r4, r2, r4
	add	r7, r7, r7, lsl #1
	mov	r0, r6
	str	r4, [r6, #44]
	ldr	r3, [r3, #372]
	add	r7, r3, r7, lsl #3
	ldr	r1, [r7, #16]
	add	r3, r7, #16
	ldr	r2, [r7, #20]
	str	r2, [r1, #4]
	str	r1, [r2]
	mov	r1, r8
	ldr	r2, [sp, #4]
	str	r3, [r7, #16]
	str	r3, [r7, #20]
	bl	snd_soc_dapm_mixer_update_power
	b	.L163
.L164:
	movw	r1, #:lower16:.LC11
	add	r2, fp, #124
	ldr	r0, [r4, #12]
	movt	r1, #:upper16:.LC11
	bl	dev_err
	mov	r0, r9
	bl	mutex_unlock
	mvn	r0, #21
	b	.L147
.L150:
	movw	r0, #:lower16:.LC12
	mov	r1, r5
	movt	r0, #:upper16:.LC12
	bl	printk
	mov	r0, r9
	bl	mutex_unlock
	mvn	r0, #21
	b	.L147
	.fnend
	.size	slim_tx_mixer_put, .-slim_tx_mixer_put
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_interpolator, %function
taiko_codec_enable_interpolator:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #1
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r2
	str	r6, [sp, #8]
	mov	r5, r0
	str	lr, [sp, #12]
	ldr	r6, [r0, #12]
	beq	.L167
	cmp	r2, #2
	bne	.L166
	ldrb	r3, [r0, #38]	@ zero_extendqisi2
	cmp	r3, #6
	bls	.L170
.L166:
	ldrd	r4, [sp]
	mov	r0, #0
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L167:
	ldrb	r3, [r0, #38]	@ zero_extendqisi2
	movw	r1, #769
	mov	r0, r6
	lsl	r3, r2, r3
	mov	r2, r3
	bl	snd_soc_update_bits
	ldrb	r2, [r5, #38]	@ zero_extendqisi2
	mov	r0, r6
	mov	r3, #0
	movw	r1, #769
	lsl	r2, r4, r2
	bl	snd_soc_update_bits
	b	.L166
.L170:
	movw	r2, #:lower16:.LANCHOR2
	mov	r0, r6
	movt	r2, #:upper16:.LANCHOR2
	add	r3, r2, r3, lsl #1
	ldrh	r4, [r3, #176]
	mov	r1, r4
	bl	snd_soc_read
	mov	r2, r0
	mov	r1, r4
	mov	r0, r6
	bl	snd_soc_write
	b	.L166
	.fnend
	.size	taiko_codec_enable_interpolator, .-taiko_codec_enable_interpolator
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_set_compander, %function
taiko_set_compander:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r0
	str	r6, [sp, #8]
	mov	r6, r1
	str	lr, [sp, #12]
	ldr	r5, [r0, #96]
	ldr	r0, [r5, #12]
	bl	dev_get_drvdata
	ldr	r3, [r4, #92]
	ldr	r4, [r6, #72]
	ldr	r2, [r3, #24]
	cmp	r2, #1
	add	r2, r2, #90
	str	r4, [r0, r2, lsl #2]
	beq	.L175
.L172:
	ldrd	r4, [sp]
	mov	r0, #0
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L175:
	cmp	r4, #1
	beq	.L176
	cmp	r4, #0
	bne	.L172
	mov	r2, #219
	mov	r1, #428
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #88
	movw	r1, #429
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #26
	movw	r1, #425
	mov	r0, r5
	bl	snd_soc_write
	mov	r3, r4
	mov	r2, #128
	movw	r1, #421
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r0, r5
	mov	r2, #16
	mov	r1, #408
	bl	snd_soc_write
	b	.L172
.L176:
	mov	r2, #218
	mov	r1, #428
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #21
	movw	r1, #429
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, #42
	movw	r1, #425
	mov	r0, r5
	bl	snd_soc_write
	mov	r3, #128
	movw	r1, #421
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r0, r5
	mov	r2, #32
	mov	r1, #408
	bl	snd_soc_write
	b	.L172
	.fnend
	.size	taiko_set_compander, .-taiko_set_compander
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	get_iir_band_coeff, %function
get_iir_band_coeff:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	add	r2, r2, r2, lsl #2
	lsl	r1, r1, #4
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	strd	r6, [sp, #8]
	add	r2, r2, r3
	add	r7, r1, #840
	strd	r8, [sp, #16]
	lsl	r4, r2, #2
	add	r7, r7, #2
	str	r10, [sp, #24]
	add	r5, r1, #840
	str	lr, [sp, #28]
	mov	r6, r0
	add	r5, r5, #3
	and	r2, r4, #124
	mov	r1, r7
	bl	snd_soc_write
	mov	r1, r5
	mov	r0, r6
	bl	snd_soc_read
	add	r2, r4, #1
	mov	r8, r0
	mov	r1, r7
	and	r2, r2, #127
	mov	r0, r6
	bl	snd_soc_write
	mov	r1, r5
	mov	r0, r6
	bl	snd_soc_read
	add	r2, r4, #2
	mov	r9, r0
	mov	r1, r7
	and	r2, r2, #126
	mov	r0, r6
	bl	snd_soc_write
	mov	r1, r5
	mov	r0, r6
	bl	snd_soc_read
	lsl	r0, r0, #16
	add	r2, r4, #3
	mov	r1, r7
	orr	r4, r0, r9, lsl #8
	and	r2, r2, #127
	mov	r0, r6
	bl	snd_soc_write
	mov	r1, r5
	mov	r0, r6
	bl	snd_soc_read
	lsl	r0, r0, #24
	orr	r4, r4, r8
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	and	r0, r0, #1056964608
	ldr	r10, [sp, #24]
	orr	r0, r0, r4
	ldrd	r4, [sp]
	add	sp, sp, #28
	ldr	pc, [sp], #4
	.fnend
	.size	get_iir_band_coeff, .-get_iir_band_coeff
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_mad, %function
taiko_codec_enable_mad:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #1
	strd	r4, [sp, #-20]!
	.save {r4, r5, r6, r7, lr}
	strd	r6, [sp, #8]
	str	lr, [sp, #16]
	.pad #12
	sub	sp, sp, #12
	beq	.L200
.L196:
	mov	r6, #0
.L179:
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
.L200:
	ldr	r4, [r0, #12]
	mov	r5, r2
	ldr	r0, [r4, #12]
	bl	dev_get_drvdata
	add	r7, r0, #1184
	mvn	r2, #0
	add	r7, r7, #12
	mov	r1, r5
	mov	r6, r0
	mov	r0, r7
	bl	pm_qos_add_request
	bl	msm_cpuidle_get_deep_idle_latency
	mov	r1, r0
	mov	r0, r7
	bl	pm_qos_update_request
	ldr	r0, [r6, #1272]
	cmp	r0, #0
	beq	.L201
	mov	r1, r5
	bl	wcdcal_get_fw_cal
	subs	r6, r0, #0
	beq	.L184
	ldr	r5, [r6]
	ldr	r2, [r6, #4]
	cmp	r2, #147
	bls	.L202
	cmp	r5, #0
	beq	.L203
.L193:
	ldrb	r2, [r5, #5]	@ zero_extendqisi2
	movw	r1, #993
	mov	r0, r4
	bl	snd_soc_write
	ldrb	r3, [r5, #6]	@ zero_extendqisi2
	movw	r2, #2040
	mov	r1, #992
	mov	r0, r4
	lsl	r3, r3, #3
	bl	snd_soc_update_bits
	ldrb	r2, [r5, #16]	@ zero_extendqisi2
	movw	r1, #1001
	mov	r0, r4
	bl	snd_soc_write
	ldrb	r3, [r5, #17]	@ zero_extendqisi2
	mov	r2, #112
	movw	r1, #994
	mov	r0, r4
	lsl	r3, r3, #4
	bl	snd_soc_update_bits
	ldrb	r3, [r5, #18]	@ zero_extendqisi2
	mov	r2, #12
	movw	r1, #995
	mov	r0, r4
	lsl	r3, r3, #2
	bl	snd_soc_update_bits
	ldrb	r2, [r5, #19]	@ zero_extendqisi2
	mov	r1, #1000
	mov	r0, r4
	and	r2, r2, #63
	bl	snd_soc_write
	ldrb	r2, [r5, #20]	@ zero_extendqisi2
	movw	r1, #998
	mov	r0, r4
	bl	snd_soc_write
	ldrb	r2, [r5, #21]	@ zero_extendqisi2
	movw	r1, #999
	mov	r0, r4
	bl	snd_soc_write
	ldrb	r2, [r5, #60]	@ zero_extendqisi2
	movw	r1, #1018
	mov	r0, r4
	bl	snd_soc_write
	ldrb	r3, [r5, #61]	@ zero_extendqisi2
	mov	r2, #112
	movw	r1, #1011
	mov	r0, r4
	bl	snd_soc_update_bits
	ldrb	r3, [r5, #62]	@ zero_extendqisi2
	mov	r2, #12
	mov	r1, #1012
	mov	r0, r4
	lsl	r3, r3, #2
	bl	snd_soc_update_bits
	ldrb	r2, [r5, #63]	@ zero_extendqisi2
	movw	r1, #1017
	mov	r0, r4
	and	r2, r2, #31
	bl	snd_soc_write
	ldrb	r2, [r5, #64]	@ zero_extendqisi2
	movw	r1, #1015
	mov	r0, r4
	bl	snd_soc_write
	ldrb	r2, [r5, #65]	@ zero_extendqisi2
	mov	r1, #1016
	mov	r0, r4
	bl	snd_soc_write
	ldrb	r3, [r5, #61]	@ zero_extendqisi2
	mov	r2, #112
	movw	r1, #1011
	mov	r0, r4
	bl	snd_soc_update_bits
	ldrb	r3, [r5, #105]	@ zero_extendqisi2
	mov	r2, #12
	movw	r1, #1005
	mov	r0, r4
	bl	snd_soc_update_bits
	ldrb	r2, [r5, #106]	@ zero_extendqisi2
	movw	r1, #1010
	mov	r0, r4
	and	r2, r2, #31
	bl	snd_soc_write
	ldrb	r2, [r5, #107]	@ zero_extendqisi2
	mov	r1, #1008
	mov	r0, r4
	bl	snd_soc_write
	ldrb	r2, [r5, #108]	@ zero_extendqisi2
	movw	r1, #1009
	mov	r0, r4
	bl	snd_soc_write
	mvn	r1, #0
	mov	r0, r7
	bl	pm_qos_update_request
	mov	r0, r7
	bl	pm_qos_remove_request
	cmp	r6, #0
	bne	.L196
	ldr	r0, [sp, #4]
	bl	release_firmware
	b	.L179
.L203:
	movw	r1, #:lower16:.LC19
	ldr	r2, .L207
	mvn	r6, #21
	movt	r1, #:upper16:.LC19
	ldr	r0, [r4, #12]
	bl	dev_err
.L183:
	movw	r0, #:lower16:.LC17
	ldr	r1, .L207+4
	movt	r0, #:upper16:.LC17
	bl	printk
	b	.L179
.L184:
	movw	r1, #:lower16:.LC14
	ldr	r2, [r4, #12]
	add	r0, sp, #4
	movt	r1, #:upper16:.LC14
	bl	request_firmware
	subs	r2, r0, #0
	bne	.L204
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L205
	ldm	r3, {r2, r5}
	cmp	r2, #147
	bls	.L206
	cmp	r5, #0
	bne	.L193
	movw	r1, #:lower16:.LC19
	ldr	r2, .L207
	mvn	r6, #21
	movt	r1, #:upper16:.LC19
	ldr	r0, [r4, #12]
	bl	dev_err
	ldr	r0, [sp, #4]
	bl	release_firmware
	b	.L183
.L201:
	movw	r1, #:lower16:.LC13
	ldr	r2, .L207
	mvn	r6, #18
	movt	r1, #:upper16:.LC13
	ldr	r0, [r4, #12]
	bl	dev_err
	b	.L183
.L205:
	movw	r1, #:lower16:.LC16
	ldr	r0, [r4, #12]
	mvn	r6, #18
	movt	r1, #:upper16:.LC16
	bl	dev_err
	b	.L183
.L202:
	movw	r0, #:lower16:.LC18
	ldr	r1, .L207
	mvn	r6, #11
	movt	r0, #:upper16:.LC18
	bl	printk
	b	.L183
.L204:
	movw	r1, #:lower16:.LC14
	movw	r0, #:lower16:.LC15
	movt	r1, #:upper16:.LC14
	movt	r0, #:upper16:.LC15
	mvn	r6, #18
	bl	printk
	b	.L183
.L206:
	movw	r0, #:lower16:.LC18
	ldr	r1, .L207
	mvn	r6, #11
	movt	r0, #:upper16:.LC18
	bl	printk
	ldr	r0, [sp, #4]
	bl	release_firmware
	b	.L183
.L208:
	.align	2
.L207:
	.word	.LANCHOR2+192
	.word	.LANCHOR2+216
	.fnend
	.size	taiko_codec_enable_mad, .-taiko_codec_enable_mad
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_int_port, %function
taiko_codec_enable_int_port:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #0
	cmpne	r0, #0
	beq	.L220
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	mov	r7, r0
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r4, [r7, #8]!
	.pad #4
	sub	sp, sp, #4
	cmp	r7, r4
	sub	r4, r4, #16
	beq	.L209
	mov	r6, r1
	mov	r8, #1
	b	.L216
.L222:
	mov	r1, r10
	and	fp, fp, #7
	bl	wcd9xxx_interface_reg_read
	uxtb	r3, r0
	asr	r3, r3, fp
	tst	r3, #1
	beq	.L221
.L214:
	ldr	r4, [r4, #16]
	cmp	r7, r4
	sub	r4, r4, #16
	beq	.L209
.L216:
	ldrh	r5, [r4, #10]
	ldr	r2, [r6, #108]
	sub	fp, r5, #16
	asr	r9, r5, #3
	asr	r3, fp, #3
	cmp	r5, #15
	add	r9, r9, #50
	add	r3, r3, #48
	uxth	r10, r3
	mov	r1, r9
	mov	r0, r2
	bhi	.L222
	bl	wcd9xxx_interface_reg_read
	uxtb	r3, r0
	and	r5, r5, #7
	asr	r3, r3, r5
	tst	r3, #1
	bne	.L214
	mov	r1, r9
	orr	r5, r0, r8, lsl r5
	ldr	r0, [r6, #108]
	uxtb	r2, r5
	bl	wcd9xxx_interface_reg_write
	mov	r1, r9
	ldr	r0, [r6, #108]
	bl	wcd9xxx_interface_reg_read
	ldr	r4, [r4, #16]
	cmp	r7, r4
	sub	r4, r4, #16
	bne	.L216
.L209:
	add	sp, sp, #4
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L221:
	mov	r1, r10
	orr	fp, r0, r8, lsl fp
	ldr	r0, [r6, #108]
	uxtb	r2, fp
	bl	wcd9xxx_interface_reg_write
	mov	r1, r10
	ldr	r0, [r6, #108]
	bl	wcd9xxx_interface_reg_read
	b	.L214
.L220:
	movw	r0, #:lower16:.LC20
	ldr	r1, .L223
	movt	r0, #:upper16:.LC20
	b	printk
.L224:
	.align	2
.L223:
	.word	.LANCHOR2+240
	.fnend
	.size	taiko_codec_enable_int_port, .-taiko_codec_enable_int_port
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	wcd9320_put_dec_enum, %function
wcd9320_put_dec_enum:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	ip, #0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r3, [r0, #92]
	.pad #8
	sub	sp, sp, #8
	ldr	r2, [r0, #96]
	ldr	r5, [r1, #72]
	str	ip, [sp, #4]
	ldr	r3, [r3, #8]
	ldr	r8, [r2, #4]
	sub	r3, r3, #1
	cmp	r5, r3
	ldr	r7, [r8, #12]
	bhi	.L235
	mov	r6, r1
	mov	r4, r0
	ldr	r0, [r8, #4]
	mov	r2, #208
	mov	r1, #15
	bl	kstrndup
	cmp	r0, #0
	mov	r9, r0
	str	r0, [sp, #4]
	beq	.L236
	movw	r1, #:lower16:.LC21
	add	r0, sp, #4
	movt	r1, #:upper16:.LC21
	bl	strsep
	subs	r10, r0, #0
	str	r9, [sp, #4]
	beq	.L238
	movw	r1, #:lower16:.LC23
	movt	r1, #:upper16:.LC23
	bl	strpbrk
	mov	r2, sp
	mov	r1, #10
	bl	kstrtouint
	cmp	r0, #0
	blt	.L239
	ldr	ip, [sp]
	sub	r3, ip, #1
	cmp	r3, #9
	ldrls	pc, [pc, r3, asl #2]
	b	.L230
.L232:
	.word	.L231
	.word	.L231
	.word	.L231
	.word	.L231
	.word	.L231
	.word	.L231
	.word	.L233
	.word	.L233
	.word	.L233
	.word	.L233
.L233:
	sub	r5, r5, #1
	cmp	r5, #1
	movhi	r3, #0
	movls	r3, #1
.L234:
	lsl	ip, ip, #3
	mov	r2, #1
	mov	r0, r7
	add	ip, ip, #536
	add	ip, ip, #3
	uxth	r1, ip
	bl	snd_soc_update_bits
	mov	r0, r4
	mov	r1, r6
	bl	snd_soc_dapm_put_enum_double
	mov	r4, r0
.L228:
	ldr	r0, [sp, #4]
	bl	kfree
.L225:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L231:
	sub	r3, r5, #1
	clz	r3, r3
	lsr	r3, r3, #5
	b	.L234
.L235:
	mvn	r4, #21
	b	.L225
.L236:
	mvn	r4, #11
	b	.L225
.L230:
	movw	r0, #:lower16:.LC24
	mov	r2, ip
	ldr	r1, .L240
	movt	r0, #:upper16:.LC24
	mvn	r4, #21
	bl	printk
	b	.L228
.L239:
	movw	r0, #:lower16:.LC22
	mov	r2, r10
	ldr	r1, .L240
	movt	r0, #:upper16:.LC22
	mvn	r4, #21
	bl	printk
	b	.L228
.L238:
	movw	r0, #:lower16:.LC22
	ldr	r1, .L240
	mvn	r4, #21
	ldr	r2, [r8, #4]
	movt	r0, #:upper16:.LC22
	bl	printk
	b	.L228
.L241:
	.align	2
.L240:
	.word	.LANCHOR2+268
	.fnend
	.size	wcd9320_put_dec_enum, .-wcd9320_put_dec_enum
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_dec, %function
taiko_codec_enable_dec:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-28]!
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r5, #0
	mov	r4, r0
	strd	r6, [sp, #8]
	mov	r1, #15
	strd	r8, [sp, #16]
	mov	r9, r2
	mov	r2, #208
	str	lr, [sp, #24]
	.pad #12
	sub	sp, sp, #12
	ldr	r0, [r0, #4]
	ldr	r6, [r4, #12]
	str	r5, [sp, #4]
	bl	kstrndup
	cmp	r0, r5
	str	r0, [sp, #4]
	beq	.L255
	movw	r1, #:lower16:.LC21
	mov	r7, r0
	movt	r1, #:upper16:.LC21
	add	r0, sp, #4
	bl	strsep
	subs	r8, r0, #0
	str	r7, [sp, #4]
	beq	.L265
	movw	r1, #:lower16:.LC23
	movt	r1, #:upper16:.LC23
	bl	strpbrk
	mov	r2, sp
	mov	r1, #10
	bl	kstrtouint
	subs	r7, r0, #0
	blt	.L266
	ldrsh	r2, [r4, #36]
	movw	r1, #778
	ldr	r3, [sp]
	cmp	r2, r1
	beq	.L256
	movw	r1, #779
	cmp	r2, r1
	moveq	r5, #8
	movweq	r8, #771
	bne	.L267
.L247:
	sub	r3, r3, #-536870911
	sub	r2, r9, #1
	lsl	r3, r3, #3
	uxth	r3, r3
	add	r1, r3, #544
	mov	r3, r1
	add	r1, r1, #2
	add	r3, r3, #3
	uxth	r1, r1
	uxth	r9, r3
	cmp	r2, #7
	ldrls	pc, [pc, r2, asl #2]
	b	.L245
.L249:
	.word	.L248
	.word	.L250
	.word	.L245
	.word	.L251
	.word	.L245
	.word	.L245
	.word	.L245
	.word	.L252
.L250:
	mov	r3, #0
	mov	r2, #1
	mov	r0, r6
	movw	r9, #:lower16:.LANCHOR0
	bl	snd_soc_update_bits
	ldr	r8, [sp]
	movt	r9, #:upper16:.LANCHOR0
	sub	r8, r8, #1
	lsl	r8, r8, #6
	add	r3, r9, r8
	ldrb	r3, [r3, #12]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L254
	mov	r0, #300
	bl	msecs_to_jiffies
	movw	r1, #:lower16:system_wq
	add	r2, r9, r8
	movt	r1, #:upper16:system_wq
	mov	r3, r0
	add	r2, r2, #16
	mov	r0, #4
	ldr	r1, [r1]
	bl	queue_delayed_work_on
.L254:
	ldrb	r3, [r4, #38]	@ zero_extendqisi2
	add	r5, r3, r5
	cmp	r5, #9
	bgt	.L245
	ldr	r3, .L268
	lsl	r5, r5, #1
	mov	r0, r6
	ldrh	r4, [r3, r5]
	mov	r1, r4
	bl	snd_soc_read
	mov	r2, r0
	mov	r1, r4
	mov	r0, r6
	bl	snd_soc_write
.L245:
	ldr	r0, [sp, #4]
	bl	kfree
.L242:
	mov	r0, r7
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	add	sp, sp, #24
	ldr	pc, [sp], #4
.L256:
	movw	r8, #770
	b	.L247
.L252:
	mov	r3, #8
	mov	r1, r9
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	ldr	ip, [sp]
	movw	r3, #:lower16:.LANCHOR0
	mov	r1, r9
	movt	r3, #:upper16:.LANCHOR0
	mov	r0, r6
	mov	r2, #48
	add	r3, r3, ip, lsl #6
	ldrb	r3, [r3, #-52]	@ zero_extendqisi2
	lsl	r3, r3, #4
	bl	snd_soc_update_bits
	b	.L245
.L248:
	mov	r3, #1
	mov	r0, r6
	mov	r2, r3
	mov	r5, #1
	bl	snd_soc_update_bits
	ldrb	r3, [r4, #38]	@ zero_extendqisi2
	mov	r1, r8
	mov	r0, r6
	lsl	r3, r5, r3
	mov	r2, r3
	bl	snd_soc_update_bits
	ldrb	r2, [r4, #38]	@ zero_extendqisi2
	mov	r3, #0
	mov	r1, r8
	mov	r0, r6
	lsl	r2, r5, r2
	bl	snd_soc_update_bits
	mov	r1, r9
	mov	r0, r6
	bl	snd_soc_read
	ldr	r2, [sp]
	movw	r3, #:lower16:.LANCHOR0
	ubfx	r0, r0, #4, #2
	movt	r3, #:upper16:.LANCHOR0
	cmp	r0, #2
	add	r3, r3, r2, lsl #6
	strb	r0, [r3, #-52]
	beq	.L253
	mov	r3, #32
	mov	r2, #48
	mov	r1, r9
	mov	r0, r6
	bl	snd_soc_update_bits
.L253:
	mov	r1, r9
	mov	r0, r6
	mov	r3, #0
	mov	r2, #8
	bl	snd_soc_update_bits
	b	.L245
.L251:
	mov	r3, #1
	mov	r0, r6
	mov	r2, r3
	bl	snd_soc_update_bits
	ldr	r3, [sp]
	ldr	r0, .L268+4
	add	r0, r0, r3, lsl #6
	sub	r0, r0, #52
	bl	cancel_delayed_work_sync
	b	.L245
.L255:
	mvn	r7, #11
	b	.L242
.L265:
	movw	r0, #:lower16:.LC22
	ldr	r1, .L268+8
	mvn	r7, #21
	ldr	r2, [r4, #4]
	movt	r0, #:upper16:.LC22
	bl	printk
	b	.L245
.L266:
	movw	r0, #:lower16:.LC22
	mov	r2, r8
	ldr	r1, .L268+8
	movt	r0, #:upper16:.LC22
	mvn	r7, #21
	bl	printk
	b	.L245
.L267:
	movw	r0, #:lower16:.LC25
	ldr	r1, .L268+8
	mvn	r7, #21
	movt	r0, #:upper16:.LC25
	bl	printk
	b	.L242
.L269:
	.align	2
.L268:
	.word	.LANCHOR2+316
	.word	.LANCHOR0+4
	.word	.LANCHOR2+292
	.fnend
	.size	taiko_codec_enable_dec, .-taiko_codec_enable_dec
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__taiko_codec_enable_ldo_h, %function
__taiko_codec_enable_ldo_h:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r2
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r6, [r0, #12]
	ldr	r0, [r6, #12]
	bl	dev_get_drvdata
	cmp	r5, #1
	mov	r4, r0
	beq	.L272
	cmp	r5, #8
	bne	.L271
	ldr	r5, [r0, #24]
	sub	r5, r5, #1
	cmp	r5, #0
	str	r5, [r0, #24]
	beq	.L278
.L275:
	cmp	r5, #0
	blt	.L279
.L271:
	ldrd	r4, [sp]
	mov	r0, #0
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L272:
	ldr	r5, [r0, #24]
	add	r5, r5, #1
	cmp	r5, #1
	str	r5, [r0, #24]
	bne	.L271
	add	r7, r0, #552
	add	r4, r0, #416
	mov	r0, r7
	bl	mutex_lock
	mov	r1, r5
	mov	r0, r4
	bl	wcd9xxx_resmgr_get_bandgap
	mov	r1, r5
	mov	r0, r4
	bl	wcd9xxx_resmgr_get_clk_block
	mov	r3, #128
	mov	r0, r6
	mov	r2, r3
	mov	r1, #272
	bl	snd_soc_update_bits
	mov	r1, r5
	mov	r0, r4
	bl	wcd9xxx_resmgr_put_clk_block
	mov	r0, r7
	bl	mutex_unlock
	mov	r1, #1000
	mov	r0, r1
	bl	usleep_range
	b	.L271
.L278:
	add	r8, r0, #552
	add	r7, r0, #416
	mov	r0, r8
	bl	mutex_lock
	mov	r0, r7
	mov	r1, #1
	bl	wcd9xxx_resmgr_get_clk_block
	mov	r3, r5
	mov	r2, #128
	mov	r1, #272
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r0, r7
	mov	r1, #1
	bl	wcd9xxx_resmgr_put_clk_block
	mov	r0, r7
	mov	r1, #1
	bl	wcd9xxx_resmgr_put_bandgap
	mov	r0, r8
	bl	mutex_unlock
	ldr	r5, [r4, #24]
	b	.L275
.L279:
	movw	r2, #:lower16:.LC26
	movw	r0, #:lower16:.LC27
	mov	r3, r5
	movt	r2, #:upper16:.LC26
	movt	r0, #:upper16:.LC27
	movw	r1, #3283
	bl	warn_slowpath_fmt
	b	.L271
	.fnend
	.size	__taiko_codec_enable_ldo_h, .-__taiko_codec_enable_ldo_h
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_micbias, %function
taiko_codec_enable_micbias:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	mov	fp, r2
	str	lr, [sp, #32]
	ldr	r6, [r0, #12]
	.pad #20
	sub	sp, sp, #20
	ldr	r0, [r6, #12]
	bl	dev_get_drvdata
	movw	r1, #:lower16:.LC28
	mov	r5, r0
	ldr	r0, [r4, #4]
	mov	r2, #10
	movt	r1, #:upper16:.LC28
	bl	strnstr
	cmp	r0, #0
	beq	.L281
	ldr	r0, [r5, #456]
	mov	r3, #16
	mov	r7, #0
	mov	r2, #24
	mov	r1, #23
	movw	r10, #299
	mov	r9, #300
	str	r3, [sp, #12]
	ldrb	r8, [r0, #504]	@ zero_extendqisi2
.L282:
	cmp	fp, #2
	beq	.L287
	cmp	fp, #8
	beq	.L288
	cmp	fp, #1
	beq	.L312
.L303:
	mov	r0, #0
.L280:
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L312:
	add	fp, r5, #416
	mov	r0, fp
	bl	wcd9xxx_resmgr_notifier_call
	mov	r1, r8
	mov	r0, fp
	bl	wcd9xxx_resmgr_cfilt_get
	movw	r1, #:lower16:.LC33
	mov	r2, #30
	ldr	r0, [r4, #4]
	movt	r1, #:upper16:.LC33
	bl	strnstr
	cmp	r0, #0
	beq	.L290
	mov	r3, #224
	mov	r1, r9
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
.L291:
	ldrb	r0, [r5, #396]	@ zero_extendqisi2
	ands	r7, r7, r0
	bne	.L313
	ldrb	r2, [r4, #38]	@ zero_extendqisi2
	mov	r3, #1
	mov	r1, r10
	mov	r0, r6
	lsl	r3, r3, r2
	mov	r2, r3
	bl	snd_soc_update_bits
	mov	r0, r7
	b	.L280
.L288:
	ldrb	r3, [r5, #396]	@ zero_extendqisi2
	add	r2, r5, #416
	mov	fp, r2
	ands	r3, r7, r3
	bne	.L314
	ldrb	r2, [r4, #38]	@ zero_extendqisi2
	mov	ip, #1
	mov	r1, r10
	mov	r0, r6
	lsl	r2, ip, r2
	bl	snd_soc_update_bits
.L298:
	mov	r0, fp
	ldr	r1, [sp, #12]
	bl	wcd9xxx_resmgr_notifier_call
	movw	r1, #:lower16:.LC33
	mov	r2, #30
	ldr	r0, [r4, #4]
	movt	r1, #:upper16:.LC33
	bl	strnstr
	subs	r5, r0, #0
	beq	.L299
	mov	r1, r9
	mov	r0, r6
	mov	r3, #0
	mov	r2, #128
	bl	snd_soc_update_bits
.L300:
	mov	r0, fp
	mov	r1, r8
	bl	wcd9xxx_resmgr_cfilt_put
	mov	r0, #0
	b	.L280
.L287:
	movw	r1, #20000
	str	r2, [sp, #12]
	mov	r0, r1
	bl	usleep_range
	ldr	r2, [sp, #12]
	add	r0, r5, #416
	mov	r1, r2
	bl	wcd9xxx_resmgr_notifier_call
	mov	r0, #0
	b	.L280
.L290:
	movw	r1, #:lower16:.LC34
	mov	r2, #30
	ldr	r0, [r4, #4]
	movt	r1, #:upper16:.LC34
	bl	strnstr
	cmp	r0, #0
	beq	.L292
	mov	r3, #28
	mov	r1, r9
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	b	.L291
.L314:
	ldr	r3, [r5, #28]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r5, #28]
	bne	.L296
	ldrb	r2, [r0, #512]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L297
	str	r3, [sp]
	movw	r2, #305
	mov	r3, #7
	mov	r1, #2
	mov	r0, fp
	bl	wcd9xxx_resmgr_rm_cond_update_bits
	ldr	r3, [r5, #28]
.L296:
	cmp	r3, #0
	bge	.L298
	movw	r2, #:lower16:.LC36
	movw	r0, #:lower16:.LC27
	movt	r2, #:upper16:.LC36
	movt	r0, #:upper16:.LC27
	movw	r1, #2955
	bl	warn_slowpath_fmt
	b	.L298
.L281:
	movw	r1, #:lower16:.LC29
	mov	r2, #10
	ldr	r0, [r4, #4]
	movt	r1, #:upper16:.LC29
	bl	strnstr
	subs	r7, r0, #0
	beq	.L283
	ldr	r0, [r5, #456]
	mov	r3, #18
	mov	r7, #1
	mov	r2, #26
	mov	r1, #25
	movw	r10, #305
	movw	r9, #306
	str	r3, [sp, #12]
	ldrb	r8, [r0, #505]	@ zero_extendqisi2
	b	.L282
.L299:
	movw	r1, #:lower16:.LC34
	mov	r2, #30
	ldr	r0, [r4, #4]
	movt	r1, #:upper16:.LC34
	bl	strnstr
	subs	r7, r0, #0
	beq	.L301
	mov	r3, r5
	mov	r1, r9
	mov	r0, r6
	mov	r2, #16
	bl	snd_soc_update_bits
	b	.L300
.L313:
	ldr	r2, [r5, #28]
	add	r2, r2, #1
	cmp	r2, #1
	str	r2, [r5, #28]
	bne	.L303
	ldr	r1, [r5, #456]
	ldrb	r3, [r4, #38]	@ zero_extendqisi2
	ldrb	r7, [r1, #512]	@ zero_extendqisi2
	cmp	r7, #0
	beq	.L294
	mov	r7, #0
	mov	r0, fp
	movw	r2, #305
	mov	r1, #2
	str	r7, [sp]
	bl	wcd9xxx_resmgr_add_cond_update_bits
	mov	r0, r7
	b	.L280
.L283:
	movw	r1, #:lower16:.LC30
	mov	r2, #10
	ldr	r0, [r4, #4]
	movt	r1, #:upper16:.LC30
	bl	strnstr
	subs	r8, r0, #0
	beq	.L284
	ldr	r0, [r5, #456]
	mov	r3, #20
	mov	r2, #28
	mov	r1, #27
	movw	r10, #311
	mov	r9, #312
	str	r3, [sp, #12]
	ldrb	r8, [r0, #506]	@ zero_extendqisi2
	b	.L282
.L292:
	movw	r1, #:lower16:.LC35
	mov	r2, #30
	ldr	r0, [r4, #4]
	movt	r1, #:upper16:.LC35
	bl	strnstr
	cmp	r0, #0
	beq	.L291
	mov	r3, #3
	mov	r1, r9
	mov	r2, r3
	mov	r0, r6
	bl	snd_soc_update_bits
	b	.L291
.L301:
	movw	r1, #:lower16:.LC35
	mov	r2, #30
	ldr	r0, [r4, #4]
	movt	r1, #:upper16:.LC35
	bl	strnstr
	cmp	r0, #0
	beq	.L300
	mov	r3, r7
	mov	r1, r9
	mov	r0, r6
	mov	r2, #2
	bl	snd_soc_update_bits
	b	.L300
.L297:
	ldrb	r2, [r4, #38]	@ zero_extendqisi2
	mov	ip, #1
	movw	r1, #305
	mov	r0, r6
	lsl	r2, ip, r2
	bl	snd_soc_update_bits
	ldr	r3, [r5, #28]
	b	.L296
.L294:
	mov	r0, r6
	lsl	r3, r2, r3
	movw	r1, #305
	mov	r2, r3
	bl	snd_soc_update_bits
	mov	r0, r7
	b	.L280
.L284:
	movw	r1, #:lower16:.LC31
	mov	r2, #10
	ldr	r0, [r4, #4]
	movt	r1, #:upper16:.LC31
	bl	strnstr
	cmp	r0, #0
	beq	.L285
	ldr	ip, [r5, #452]
	mov	r3, #22
	mov	r7, r8
	ldr	r0, [r5, #456]
	mov	r2, #30
	mov	r1, #29
	movw	r10, #317
	str	r3, [sp, #12]
	ldrh	r9, [ip, #2]
	ldrb	r8, [r0, #507]	@ zero_extendqisi2
	b	.L282
.L285:
	movw	r0, #:lower16:.LC32
	ldr	r1, .L315
	movt	r0, #:upper16:.LC32
	ldr	r2, [r4, #4]
	bl	printk
	mvn	r0, #21
	b	.L280
.L316:
	.align	2
.L315:
	.word	.LANCHOR2+336
	.fnend
	.size	taiko_codec_enable_micbias, .-taiko_codec_enable_micbias
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_vdd_spkr, %function
taiko_codec_enable_vdd_spkr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r2
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r5, [r0, #12]
	ldr	r3, [r5, #12]
	ldr	r0, [r3]
	bl	dev_get_drvdata
	mov	r7, r0
	ldr	r0, [r5, #12]
	bl	dev_get_drvdata
	mov	r6, r0
	ldr	r0, [r0, #392]
	cmp	r0, #0
	beq	.L358
	cmp	r4, #1
	beq	.L325
.L356:
	cmp	r4, #8
	bne	.L320
	ldrb	r3, [r7, #60]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L359
.L328:
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L360
	ldr	r0, [r6, #392]
	cmp	r0, #0
	beq	.L320
.L362:
	bl	regulator_disable
	subs	r4, r0, #0
	beq	.L317
	movw	r2, #:lower16:.LC37
	movw	r0, #:lower16:.LC40
	ldr	r1, .L367
	movt	r2, #:upper16:.LC37
	movt	r0, #:upper16:.LC40
	bl	printk
	b	.L317
.L320:
	mov	r4, #0
.L317:
	mov	r0, r4
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L360:
	movw	r1, #479
	mov	r0, r5
	bl	snd_soc_read
	tst	r0, #128
	bne	.L361
.L330:
	mov	r3, #128
	mov	r0, r5
	mov	r2, r3
	movw	r1, #479
	bl	snd_soc_update_bits
	ldr	r0, [r6, #392]
	cmp	r0, #0
	bne	.L362
	b	.L320
.L366:
	movw	r3, #:lower16:.LC37
	movw	r2, #:lower16:.LC38
	movw	r0, #:lower16:.LC27
	movt	r3, #:upper16:.LC37
	movt	r2, #:upper16:.LC38
	movt	r0, #:upper16:.LC27
	mov	r1, #3168
	bl	warn_slowpath_fmt
	mov	r3, #1
	cmp	r4, #1
	strb	r3, [r8]
	bne	.L356
	ldr	r0, [r6, #392]
	cmp	r0, #0
	beq	.L333
.L325:
	bl	regulator_enable
	subs	r4, r0, #0
	bne	.L363
.L324:
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L364
.L326:
	ldrb	r3, [r7, #60]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L317
	mov	r0, r5
	mov	r3, #0
	mov	r2, #36
	movw	r1, #487
	bl	snd_soc_update_bits
	b	.L317
.L364:
	movw	r1, #479
	mov	r0, r5
	bl	snd_soc_read
	tst	r0, #128
	beq	.L365
.L327:
	mov	r3, #0
	mov	r2, #128
	movw	r1, #479
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L326
.L358:
	movw	r8, #:lower16:.LANCHOR3
	movt	r8, #:upper16:.LANCHOR3
	ldrb	r3, [r8]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L366
	cmp	r4, #1
	bne	.L356
.L333:
	mov	r4, r0
	b	.L324
.L359:
	mov	r3, #36
	movw	r1, #487
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L328
.L365:
	movw	r0, #:lower16:.LC27
	movw	r1, #3179
	movt	r0, #:upper16:.LC27
	bl	warn_slowpath_null
	b	.L327
.L361:
	movw	r0, #:lower16:.LC27
	movw	r1, #3193
	movt	r0, #:upper16:.LC27
	bl	warn_slowpath_null
	b	.L330
.L363:
	movw	r2, #:lower16:.LC37
	movw	r0, #:lower16:.LC39
	ldr	r1, .L367
	movt	r2, #:upper16:.LC37
	movt	r0, #:upper16:.LC39
	bl	printk
	b	.L324
.L368:
	.align	2
.L367:
	.word	.LANCHOR2+364
	.fnend
	.size	taiko_codec_enable_vdd_spkr, .-taiko_codec_enable_vdd_spkr
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_lineout_dac_event, %function
taiko_lineout_dac_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r2
	str	r6, [sp, #8]
	mov	r6, r0
	str	lr, [sp, #12]
	ldr	r5, [r0, #12]
	.pad #8
	sub	sp, sp, #8
	ldr	r0, [r5, #12]
	bl	dev_get_drvdata
	cmp	r4, #1
	beq	.L371
	cmp	r4, #8
	bne	.L370
	ldrh	r1, [r6, #36]
	mov	r0, r5
	mov	r3, #0
	mov	r2, #64
	bl	snd_soc_update_bits
.L370:
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L371:
	add	r1, r0, #1136
	mov	r3, r4
	str	r4, [sp]
	mov	r0, r5
	add	r1, r1, #12
	mov	r2, #8
	bl	wcd9xxx_clsh_fsm
	mov	r3, #64
	ldrh	r1, [r6, #36]
	mov	r0, r5
	mov	r2, r3
	bl	snd_soc_update_bits
	b	.L370
	.fnend
	.size	taiko_lineout_dac_event, .-taiko_lineout_dac_event
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_lineout, %function
taiko_codec_enable_lineout:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r0
	mov	r4, r2
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r6, [r0, #12]
	.pad #8
	sub	sp, sp, #8
	ldr	r0, [r6, #12]
	bl	dev_get_drvdata
	ldrb	r3, [r5, #38]	@ zero_extendqisi2
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L375
.L377:
	.word	.L376
	.word	.L378
	.word	.L385
	.word	.L380
.L380:
	movw	r5, #473
.L379:
	cmp	r4, #2
	beq	.L382
.L389:
	cmp	r4, #8
	beq	.L383
	cmp	r4, #1
	movne	r0, #0
	bne	.L374
	mov	r3, #64
	mov	r1, r5
	mov	r0, r6
	mov	r2, r3
	bl	snd_soc_update_bits
	mov	r0, #0
.L374:
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L385:
	cmp	r4, #2
	movw	r5, #469
	bne	.L389
.L382:
	add	r1, r0, #1136
	mov	r3, #1
	str	r4, [sp]
	mov	r0, r6
	add	r1, r1, #12
	mov	r2, #8
	bl	wcd9xxx_clsh_fsm
	movw	r0, #5000
	movw	r1, #5100
	bl	usleep_range
	mov	r0, #0
	b	.L374
.L378:
	movw	r5, #465
	b	.L379
.L376:
	movw	r5, #461
	b	.L379
.L383:
	mov	r3, #2
	add	r1, r0, #1136
	add	r1, r1, #12
	mov	r2, r4
	mov	r0, r6
	str	r3, [sp]
	mov	r3, #0
	bl	wcd9xxx_clsh_fsm
	mov	r1, r5
	mov	r3, #0
	mov	r2, #64
	mov	r0, r6
	bl	snd_soc_update_bits
	movw	r0, #5000
	movw	r1, #5100
	bl	usleep_range
	mov	r0, #0
	b	.L374
.L375:
	movw	r0, #:lower16:.LC41
	ldr	r1, .L390
	movt	r0, #:upper16:.LC41
	bl	printk
	mvn	r0, #21
	b	.L374
.L391:
	.align	2
.L390:
	.word	.LANCHOR2+392
	.fnend
	.size	taiko_codec_enable_lineout, .-taiko_codec_enable_lineout
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_hphr_dac_event, %function
taiko_hphr_dac_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-20]!
	.save {r4, r5, r6, r7, lr}
	mov	r5, r2
	strd	r6, [sp, #8]
	mov	r6, r0
	str	lr, [sp, #16]
	ldr	r4, [r0, #12]
	.pad #12
	sub	sp, sp, #12
	ldr	r0, [r4, #12]
	bl	dev_get_drvdata
	cmp	r5, #1
	beq	.L394
	cmp	r5, #8
	bne	.L393
	mov	r3, #0
	mov	r2, #4
	movw	r1, #781
	mov	r0, r4
	bl	snd_soc_update_bits
	ldrh	r1, [r6, #36]
	mov	r0, r4
	mov	r3, #0
	mov	r2, #64
	bl	snd_soc_update_bits
.L393:
	mov	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
.L394:
	mov	r3, #4
	mov	r7, r0
	mov	r2, r3
	movw	r1, #781
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r3, #64
	ldrh	r1, [r6, #36]
	mov	r0, r4
	mov	r2, r3
	bl	snd_soc_update_bits
	add	r1, r7, #1136
	mov	r3, r5
	str	r5, [sp]
	add	r1, r1, #12
	mov	r0, r4
	mov	r2, #4
	bl	wcd9xxx_clsh_fsm
	b	.L393
	.fnend
	.size	taiko_hphr_dac_event, .-taiko_hphr_dac_event
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_hph_pa_event, %function
taiko_hph_pa_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	mov	r5, r2
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r6, [r0, #12]
	.pad #8
	sub	sp, sp, #8
	ldr	r0, [r6, #12]
	bl	dev_get_drvdata
	ldrb	r4, [r4, #38]	@ zero_extendqisi2
	mov	r7, r0
	cmp	r4, #5
	beq	.L404
	cmp	r4, #4
	moveq	r8, #46
	moveq	lr, #45
	bne	.L410
.L398:
	ldr	ip, [r7, #364]
	movw	r2, #13000
	movw	r3, #14000
	movw	r0, #3000
	cmp	ip, #0
	moveq	r0, r2
	movne	r1, #4000
	moveq	r1, r3
	cmp	r5, #2
	beq	.L401
	cmp	r5, #8
	beq	.L402
	cmp	r5, #1
	movne	r0, #0
	bne	.L397
	add	r0, r7, #416
	mov	r1, lr
	bl	wcd9xxx_resmgr_notifier_call
	mov	r0, #0
.L397:
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L402:
	bl	usleep_range
	mov	r1, r8
	add	r0, r7, #416
	bl	wcd9xxx_resmgr_notifier_call
	mov	r3, #2
	add	r1, r7, #1136
	mov	r0, r6
	add	r1, r1, #12
	str	r3, [sp]
	mov	r2, r4
	mov	r3, #0
	bl	wcd9xxx_clsh_fsm
	mov	r0, #0
	b	.L397
.L404:
	mov	r4, #2
	mov	r8, #44
	mov	lr, #43
	b	.L398
.L401:
	bl	usleep_range
	add	r1, r7, #1136
	mov	r0, r6
	str	r5, [sp]
	mov	r2, r4
	add	r1, r1, #12
	mov	r3, #1
	bl	wcd9xxx_clsh_fsm
	mov	r0, #0
	b	.L397
.L410:
	movw	r0, #:lower16:.LC42
	mov	r2, r4
	ldr	r1, .L411
	movt	r0, #:upper16:.LC42
	bl	printk
	mvn	r0, #21
	b	.L397
.L412:
	.align	2
.L411:
	.word	.LANCHOR2+420
	.fnend
	.size	taiko_hph_pa_event, .-taiko_hph_pa_event
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_ear_dac_event, %function
taiko_codec_ear_dac_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	mov	r4, r2
	str	lr, [sp, #8]
	ldr	r5, [r0, #12]
	.pad #12
	sub	sp, sp, #12
	ldr	r0, [r5, #12]
	bl	dev_get_drvdata
	cmp	r4, #1
	bne	.L414
	add	r1, r0, #1136
	mov	r3, r4
	str	r4, [sp]
	mov	r0, r5
	add	r1, r1, #12
	mov	r2, r4
	bl	wcd9xxx_clsh_fsm
.L414:
	mov	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
	.fnend
	.size	taiko_codec_ear_dac_event, .-taiko_codec_ear_dac_event
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_ear_pa, %function
taiko_codec_enable_ear_pa:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	mov	r4, r2
	str	lr, [sp, #8]
	ldr	r5, [r0, #12]
	.pad #12
	sub	sp, sp, #12
	ldr	r0, [r5, #12]
	bl	dev_get_drvdata
	cmp	r4, #2
	beq	.L419
	cmp	r4, #8
	bne	.L418
	mov	r3, #2
	add	r1, r0, #1136
	add	r1, r1, #12
	mov	r0, r5
	str	r3, [sp]
	mov	r3, #0
.L422:
	mov	r2, #1
	bl	wcd9xxx_clsh_fsm
	movw	r1, #5000
	mov	r0, r1
	bl	usleep_range
.L418:
	mov	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L419:
	add	r1, r0, #1136
	mov	r3, #1
	str	r4, [sp]
	add	r1, r1, #12
	mov	r0, r5
	b	.L422
	.fnend
	.size	taiko_codec_enable_ear_pa, .-taiko_codec_enable_ear_pa
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_hphl_dac_event, %function
taiko_hphl_dac_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r2
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r4, [r0, #12]
	.pad #8
	sub	sp, sp, #8
	ldr	r0, [r4, #12]
	bl	dev_get_drvdata
	cmp	r5, #1
	beq	.L425
	cmp	r5, #8
	bne	.L424
	mov	r0, r4
	mov	r3, #0
	mov	r2, #2
	movw	r1, #781
	bl	snd_soc_update_bits
.L424:
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L425:
	mov	r3, #2
	mov	r6, r0
	mov	r2, r3
	movw	r1, #781
	mov	r0, r4
	bl	snd_soc_update_bits
	add	r1, r6, #1136
	mov	r0, r4
	str	r5, [sp]
	mov	r3, r5
	add	r1, r1, #12
	mov	r2, #2
	bl	wcd9xxx_clsh_fsm
	mov	r0, r4
	mov	r1, #0
	bl	wcd9xxx_clsh_imped_config
	b	.L424
	.fnend
	.size	taiko_hphl_dac_event, .-taiko_hphl_dac_event
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	slim_rx_mux_put, %function
slim_rx_mux_put:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r1
	strd	r6, [sp, #8]
	mov	r7, r0
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #96]
	.pad #12
	sub	sp, sp, #12
	ldr	r4, [r3, #4]
	ldr	r6, [r4, #12]
	ldr	r0, [r6, #12]
	add	r8, r6, #20
	bl	dev_get_drvdata
	ldr	r3, [r6, #12]
	mov	fp, r0
	ldr	r0, [r3]
	bl	dev_get_drvdata
	ldr	r3, [r5, #72]
	mov	r10, r0
	mov	r0, r8
	ldr	r9, [r7, #92]
	ldrb	r5, [r4, #38]	@ zero_extendqisi2
	str	r3, [r4, #44]
	bl	mutex_lock
	ldrb	r3, [fp, #37]	@ zero_extendqisi2
	ldr	r1, [r4, #44]
	cmp	r3, #1
	beq	.L430
	cmp	r1, #2
	bhi	.L442
.L430:
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L432
.L434:
	.word	.L433
	.word	.L435
	.word	.L436
	.word	.L437
.L437:
	add	r6, fp, #208
	add	r0, r5, #16
	mov	r1, r6
	bl	wcd9xxx_rx_vport_validation
	cmp	r0, #0
	bne	.L438
	ldr	r3, [r10, #368]
	add	r5, r5, r5, lsl #1
	ldr	r2, [fp, #212]
	add	r5, r3, r5, lsl #3
	add	r3, r5, #16
	str	r3, [fp, #212]
	str	r6, [r5, #16]
	str	r2, [r5, #20]
	str	r3, [r2]
	b	.L438
.L436:
	add	r6, fp, #128
	add	r0, r5, #16
	mov	r1, r6
	bl	wcd9xxx_rx_vport_validation
	cmp	r0, #0
	bne	.L438
	ldr	r3, [r10, #368]
	add	r5, r5, r5, lsl #1
	ldr	r2, [fp, #132]
	add	r5, r3, r5, lsl #3
	add	r3, r5, #16
	str	r3, [fp, #132]
	str	r6, [r5, #16]
	str	r2, [r5, #20]
	str	r3, [r2]
	b	.L438
.L435:
	add	r6, fp, #48
	add	r0, r5, #16
	mov	r1, r6
	bl	wcd9xxx_rx_vport_validation
	cmp	r0, #0
	bne	.L438
	ldr	r3, [r10, #368]
	add	r5, r5, r5, lsl #1
	ldr	r2, [fp, #52]
	add	r5, r3, r5, lsl #3
	add	r3, r5, #16
	str	r3, [fp, #52]
	str	r6, [r5, #16]
	str	r2, [r5, #20]
	str	r3, [r2]
	b	.L438
.L433:
	ldr	r3, [r10, #368]
	add	r5, r5, r5, lsl #1
	add	r5, r3, r5, lsl #3
	ldr	r1, [r5, #16]
	add	r3, r5, #16
	ldr	r2, [r5, #20]
	str	r2, [r1, #4]
	str	r1, [r2]
	str	r3, [r5, #16]
	str	r3, [r5, #20]
.L438:
	ldr	r3, [r4, #44]
	mov	r1, r7
	mov	r2, #1
	mov	r0, r4
	str	r9, [sp]
	bl	snd_soc_dapm_mux_update_power
	mov	r0, r8
	bl	mutex_unlock
	mov	r0, #0
.L428:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L442:
	movw	r1, #:lower16:.LC11
	ldr	r2, .L443
	movt	r1, #:upper16:.LC11
	ldr	r0, [r6, #12]
	bl	dev_err
.L431:
	mov	r0, r8
	bl	mutex_unlock
	mvn	r0, #21
	b	.L428
.L432:
	movw	r0, #:lower16:.LC12
	movt	r0, #:upper16:.LC12
	bl	printk
	b	.L431
.L444:
	.align	2
.L443:
	.word	.LANCHOR2+440
	.fnend
	.size	slim_rx_mux_put, .-slim_rx_mux_put
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_mad_input_put, %function
taiko_mad_input_put:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldrb	r3, [r1, #72]	@ zero_extendqisi2
	.pad #44
	sub	sp, sp, #44
	ldr	r2, [r0, #96]
	cmp	r3, #15
	str	r3, [sp, #16]
	ldr	r8, [r2, #44]
	str	r2, [sp, #20]
	bhi	.L478
	mov	r2, r3
	movw	r3, #:lower16:.LANCHOR2
	movt	r3, #:upper16:.LANCHOR2
	movw	r1, #:lower16:.LC44
	add	r3, r3, r2, lsl #2
	movt	r1, #:upper16:.LC44
	ldr	r7, [r3, #476]
	mov	r0, r7
	bl	strcmp
	cmp	r0, #0
	beq	.L448
	movw	r1, #:lower16:.LC45
	mov	r0, r7
	movt	r1, #:upper16:.LC45
	bl	strcmp
	cmp	r0, #0
	beq	.L448
	movw	r1, #:lower16:.LC46
	mov	r0, r7
	movt	r1, #:upper16:.LC46
	bl	strcmp
	cmp	r0, #0
	beq	.L448
	movw	r1, #:lower16:.LC47
	mov	r0, r7
	movt	r1, #:upper16:.LC47
	bl	strcmp
	cmp	r0, #0
	beq	.L448
	movw	r1, #:lower16:.LC49
	mov	r2, #4
	movt	r1, #:upper16:.LC49
	mov	r0, r7
	bl	strnstr
	cmp	r0, #0
	beq	.L450
	movw	r1, #:lower16:.LC8
	mov	r0, r7
	movt	r1, #:upper16:.LC8
	bl	strpbrk
	add	r2, sp, #28
	mov	r1, #10
	bl	kstrtouint
	cmp	r0, #0
	blt	.L451
	ldr	r2, [sp, #28]
	cmp	r2, #6
	bhi	.L451
.L452:
	movw	r3, #:lower16:.LC51
	str	r2, [sp]
	movw	r2, #:lower16:.LC52
	add	r0, sp, #34
	movt	r3, #:upper16:.LC51
	mov	r1, #6
	movt	r2, #:upper16:.LC52
	mov	r7, r0
	bl	snprintf
.L450:
	ldr	r9, [r8, #268]
	cmp	r9, #0
	beq	.L453
	movw	r3, #:lower16:.LC29
	movw	r2, #:lower16:.LC30
	movt	r3, #:upper16:.LC29
	movt	r2, #:upper16:.LC30
	movw	fp, #:lower16:.LC28
	mov	r4, #0
	movt	fp, #:upper16:.LC28
	str	r3, [sp, #8]
	str	r2, [sp, #12]
	b	.L456
.L454:
	cmp	r9, r4
	bls	.L453
.L456:
	mov	r0, r7
	lsl	r6, r4, #4
	bl	strlen
	ldr	r5, [r8, #264]
	mov	r2, r0
	mov	r1, r7
	ldr	r0, [r5, r4, lsl #4]
	add	r4, r4, #1
	add	r5, r5, r6
	bl	strncmp
	subs	r10, r0, #0
	bne	.L454
	mov	r2, #10
	mov	r1, fp
	ldr	r0, [r5, #8]
	bl	strnstr
	cmp	r0, #0
	mov	r2, #10
	ldr	r1, [sp, #8]
	bne	.L457
	ldr	r3, [r8, #264]
	add	r3, r3, r6
	ldr	r0, [r3, #8]
	bl	strnstr
	cmp	r0, #0
	mov	r2, #10
	ldr	r1, [sp, #12]
	bne	.L458
	ldr	r3, [r8, #264]
	add	r3, r3, r6
	ldr	r0, [r3, #8]
	bl	strnstr
	cmp	r0, #0
	movw	r1, #:lower16:.LC31
	mov	r2, #10
	movt	r1, #:upper16:.LC31
	bne	.L459
	ldr	r3, [r8, #264]
	add	r6, r3, r6
	ldr	r0, [r6, #8]
	bl	strnstr
	cmp	r0, #0
	bne	.L460
	ldr	r9, [r8, #268]
	cmp	r9, r4
	bhi	.L456
.L453:
	movw	r0, #:lower16:.LC53
	mov	r2, r7
	ldr	r1, .L479
	movt	r0, #:upper16:.LC53
	mvn	r10, #21
	bl	printk
.L445:
	mov	r0, r10
	add	sp, sp, #44
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L457:
	mov	r4, #1
.L455:
	mov	r2, #15
	movw	r1, #946
	ldr	r3, [sp, #16]
	ldr	r5, [sp, #20]
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r4
	mov	r0, r5
	mov	r2, #7
	mov	r1, #336
	bl	snd_soc_update_bits
	b	.L445
.L458:
	mov	r4, #2
	b	.L455
.L459:
	mov	r4, #3
	b	.L455
.L460:
	mov	r4, #4
	b	.L455
.L478:
	movw	r1, #:lower16:.LC43
	ldr	r0, [r2, #12]
	mvn	r10, #21
	movt	r1, #:upper16:.LC43
	ldr	r2, .L479
	bl	dev_err
	b	.L445
.L448:
	movw	r0, #:lower16:.LC48
	mov	r2, r7
	ldr	r1, .L479
	movt	r0, #:upper16:.LC48
	mvn	r10, #21
	bl	printk
	b	.L445
.L451:
	movw	r0, #:lower16:.LC50
	mov	r2, r7
	ldr	r1, .L479
	movt	r0, #:upper16:.LC50
	bl	printk
	ldr	r2, [sp, #28]
	b	.L452
.L480:
	.align	2
.L479:
	.word	.LANCHOR2+456
	.fnend
	.size	taiko_mad_input_put, .-taiko_mad_input_put
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_put_anc_func, %function
taiko_put_anc_func:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	strd	r6, [sp, #8]
	mov	r7, r1
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r5, [r0, #96]
	ldr	r0, [r5, #12]
	add	r4, r5, #176
	bl	dev_get_drvdata
	mov	r6, r0
	ldr	r0, [r5, #256]
	add	r0, r0, #20
	bl	mutex_lock
	ldr	r3, [r7, #72]
	movw	r1, #:lower16:.LC54
	mov	r0, r4
	movt	r1, #:upper16:.LC54
	cmp	r3, #0
	movne	r3, #1
	moveq	r3, #0
	strb	r3, [r6, #36]
	bne	.L485
	bl	snd_soc_dapm_disable_pin
	movw	r1, #:lower16:.LC55
	mov	r0, r4
	movt	r1, #:upper16:.LC55
	bl	snd_soc_dapm_disable_pin
	movw	r1, #:lower16:.LC56
	mov	r0, r4
	movt	r1, #:upper16:.LC56
	bl	snd_soc_dapm_disable_pin
	movw	r1, #:lower16:.LC57
	mov	r0, r4
	movt	r1, #:upper16:.LC57
	bl	snd_soc_dapm_disable_pin
	movw	r1, #:lower16:.LC58
	mov	r0, r4
	movt	r1, #:upper16:.LC58
	bl	snd_soc_dapm_disable_pin
	movw	r1, #:lower16:.LC7
	mov	r0, r4
	movt	r1, #:upper16:.LC7
	bl	snd_soc_dapm_enable_pin
	movw	r1, #:lower16:.LC6
	mov	r0, r4
	movt	r1, #:upper16:.LC6
	bl	snd_soc_dapm_enable_pin
	movw	r1, #:lower16:.LC59
	mov	r0, r4
	movt	r1, #:upper16:.LC59
	bl	snd_soc_dapm_enable_pin
	movw	r1, #:lower16:.LC60
	mov	r0, r4
	movt	r1, #:upper16:.LC60
	bl	snd_soc_dapm_enable_pin
	movw	r1, #:lower16:.LC61
	mov	r0, r4
	movt	r1, #:upper16:.LC61
	bl	snd_soc_dapm_enable_pin
.L483:
	mov	r0, r4
	bl	snd_soc_dapm_sync
	ldr	r0, [r5, #256]
	add	r0, r0, #20
	bl	mutex_unlock
	ldrd	r4, [sp]
	mov	r0, #0
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L485:
	bl	snd_soc_dapm_enable_pin
	movw	r1, #:lower16:.LC55
	mov	r0, r4
	movt	r1, #:upper16:.LC55
	bl	snd_soc_dapm_enable_pin
	movw	r1, #:lower16:.LC56
	mov	r0, r4
	movt	r1, #:upper16:.LC56
	bl	snd_soc_dapm_enable_pin
	movw	r1, #:lower16:.LC57
	mov	r0, r4
	movt	r1, #:upper16:.LC57
	bl	snd_soc_dapm_enable_pin
	movw	r1, #:lower16:.LC58
	mov	r0, r4
	movt	r1, #:upper16:.LC58
	bl	snd_soc_dapm_enable_pin
	movw	r1, #:lower16:.LC7
	mov	r0, r4
	movt	r1, #:upper16:.LC7
	bl	snd_soc_dapm_disable_pin
	movw	r1, #:lower16:.LC6
	mov	r0, r4
	movt	r1, #:upper16:.LC6
	bl	snd_soc_dapm_disable_pin
	movw	r1, #:lower16:.LC59
	mov	r0, r4
	movt	r1, #:upper16:.LC59
	bl	snd_soc_dapm_disable_pin
	movw	r1, #:lower16:.LC60
	mov	r0, r4
	movt	r1, #:upper16:.LC60
	bl	snd_soc_dapm_disable_pin
	movw	r1, #:lower16:.LC61
	mov	r0, r4
	movt	r1, #:upper16:.LC61
	bl	snd_soc_dapm_disable_pin
	b	.L483
	.fnend
	.size	taiko_put_anc_func, .-taiko_put_anc_func
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_remove, %function
taiko_codec_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r0, [r0, #12]
	bl	dev_get_drvdata
	add	r5, r0, #552
	mov	r4, r0
	add	r6, r0, #416
	mov	r0, r5
	bl	mutex_lock
	movw	r2, #:lower16:.LANCHOR1
	mov	r1, #0
	movt	r2, #:upper16:.LANCHOR1
	movw	r3, #:lower16:.LANCHOR0
	ldr	r2, [r2]
	movt	r3, #:upper16:.LANCHOR0
	str	r1, [r3]
	cmp	r2, r1
	ble	.L488
	mov	r1, #1
	mov	r0, r6
	bl	wcd9xxx_resmgr_put_bandgap
.L488:
	mov	r0, r5
	mov	r5, #0
	bl	mutex_unlock
	ldr	r3, [r4]
	mov	r2, r4
	mov	r1, r5
	ldr	r0, [r3, #108]
	add	r0, r0, #100
	bl	wcd9xxx_free_irq
	mov	r0, r6
	bl	wcd9xxx_resmgr_deinit
	ldr	r0, [r4, #1272]
	str	r5, [r4, #392]
	bl	kfree
	mov	r0, r4
	bl	kfree
	ldr	r6, [sp, #8]
	mov	r0, r5
	ldrd	r4, [sp]
	add	sp, sp, #12
	ldr	pc, [sp], #4
	.fnend
	.size	taiko_codec_remove, .-taiko_codec_remove
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_device_down, %function
taiko_device_down:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r1, #0
	str	lr, [sp, #4]
	ldr	r3, [r0, #84]
	ldr	r0, [r3, #44]
	bl	snd_soc_card_change_online_state
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, #0
	ldr	pc, [sp], #4
	.fnend
	.size	taiko_device_down, .-taiko_device_down
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_enable_mbhc_micbias, %function
taiko_enable_mbhc_micbias:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	r3, r2, #1
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	cmp	r3, #1
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	bhi	.L497
	movw	r3, #:lower16:.LC63
	mov	ip, r1
	cmp	r2, #2
	movw	r1, #:lower16:.LC62
	movt	r3, #:upper16:.LC63
	movt	r1, #:upper16:.LC62
	movne	r1, r3
	cmp	ip, #0
	add	r4, r0, #176
	mov	r0, r4
	bne	.L500
	bl	snd_soc_dapm_disable_pin
	mov	r5, r0
.L496:
	cmp	r5, #0
	bne	.L492
	mov	r0, r4
	bl	snd_soc_dapm_sync
.L492:
	mov	r0, r5
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L500:
	bl	snd_soc_dapm_force_enable_pin
	mov	r5, r0
	b	.L496
.L497:
	mvn	r5, #21
	b	.L492
	.fnend
	.size	taiko_enable_mbhc_micbias, .-taiko_enable_mbhc_micbias
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_handle_pdata, %function
taiko_handle_pdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	.pad #12
	sub	sp, sp, #12
	ldr	r5, [r0]
	ldr	r4, [r0, #456]
	cmp	r4, #0
	beq	.L615
	ldrb	r1, [r4, #488]	@ zero_extendqisi2
	ldrb	r2, [r4, #16]	@ zero_extendqisi2
	ldrb	r7, [r4, #17]	@ zero_extendqisi2
	ldrb	r3, [r4, #18]	@ zero_extendqisi2
	ldrb	r6, [r4, #19]	@ zero_extendqisi2
	cmp	r1, #3
	and	r9, r2, #127
	and	r7, r7, #127
	and	r10, r3, #127
	and	r6, r6, #127
	bhi	.L505
	ldrb	r3, [r4, #504]	@ zero_extendqisi2
	cmp	r3, #2
	bhi	.L505
	ldrb	r3, [r4, #505]	@ zero_extendqisi2
	cmp	r3, #2
	bhi	.L505
	ldrb	r3, [r4, #506]	@ zero_extendqisi2
	cmp	r3, #2
	bhi	.L505
	ldrb	r3, [r4, #507]	@ zero_extendqisi2
	cmp	r3, #2
	bhi	.L505
	add	fp, r0, #416
	ldr	r1, [r4, #492]
	mov	r8, r0
	mov	r0, fp
	bl	wcd9xxx_resmgr_get_k_val
	str	r0, [sp]
	ldr	r1, [r4, #496]
	mov	r0, fp
	bl	wcd9xxx_resmgr_get_k_val
	str	r0, [sp, #4]
	ldr	r1, [r4, #500]
	mov	r0, fp
	bl	wcd9xxx_resmgr_get_k_val
	ldr	r3, [sp]
	mov	fp, r0
	cmn	r3, #4096
	bhi	.L505
	ldr	r2, [sp, #4]
	cmn	r2, #4096
	bhi	.L505
	cmn	r0, #4096
	bhi	.L505
	ldrb	r3, [r4, #488]	@ zero_extendqisi2
	mov	r2, #12
	mov	r1, #272
	mov	r0, r5
	lsl	r3, r3, #2
	bl	snd_soc_update_bits
	ldr	r3, [sp]
	mov	r2, #252
	movw	r1, #297
	mov	r0, r5
	lsl	r3, r3, #2
	bl	snd_soc_update_bits
	ldr	r2, [sp, #4]
	movw	r1, #303
	mov	r0, r5
	lsl	r3, r2, #2
	mov	r2, #252
	bl	snd_soc_update_bits
	lsl	r3, fp, #2
	mov	r2, #252
	movw	r1, #309
	mov	r0, r5
	bl	snd_soc_update_bits
	ldrb	r3, [r4, #504]	@ zero_extendqisi2
	mov	r2, #96
	movw	r1, #299
	mov	r0, r5
	lsl	r3, r3, #5
	bl	snd_soc_update_bits
	ldrb	r3, [r4, #505]	@ zero_extendqisi2
	mov	r2, #96
	movw	r1, #305
	mov	r0, r5
	lsl	r3, r3, #5
	bl	snd_soc_update_bits
	ldrb	r3, [r4, #506]	@ zero_extendqisi2
	mov	r2, #96
	movw	r1, #311
	mov	r0, r5
	lsl	r3, r3, #5
	bl	snd_soc_update_bits
	ldrb	r3, [r4, #507]	@ zero_extendqisi2
	mov	r2, #96
	mov	r0, r5
	ldr	r1, [r8, #452]
	lsl	r3, r3, #5
	ldrh	r1, [r1]
	bl	snd_soc_update_bits
	tst	r6, #1
	bne	.L616
	tst	r6, #2
	bne	.L617
.L507:
	tst	r6, #4
	bne	.L618
.L508:
	tst	r6, #8
	bne	.L619
.L509:
	tst	r6, #16
	bne	.L620
.L510:
	tst	r6, #32
	bne	.L621
.L511:
	tst	r6, #64
	bne	.L622
.L512:
	ldrb	r3, [r4, #516]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L513
.L625:
	ldrb	r2, [r4, #517]	@ zero_extendqisi2
	and	r2, r2, #96
	cmp	r2, #32
	beq	.L505
	ubfx	r3, r3, #1, #4
	mov	r2, #15
	movw	r1, #415
	mov	r0, r5
	bl	snd_soc_update_bits
	add	r2, r4, #516
	ldrb	r3, [r4, #517]	@ zero_extendqisi2
	mov	r1, #416
	ldrh	r2, [r2]
	mov	r0, r5
	ubfx	r3, r3, #1, #4
	ubfx	r2, r2, #5, #4
	orr	r2, r3, r2, lsl #4
	bl	snd_soc_write
	ldrb	r3, [r4, #517]	@ zero_extendqisi2
	mov	r2, #224
	movw	r1, #426
	mov	r0, r5
	and	r3, r3, r2
	bl	snd_soc_update_bits
.L513:
	ldr	r0, [r4, #520]
	cmp	r0, #0
	beq	.L514
	movw	r1, #:lower16:.LC65
	mov	r2, #11
	movt	r1, #:upper16:.LC65
	bl	strncmp
	cmp	r0, #0
	beq	.L515
.L514:
	ldr	r0, [r4, #544]
	cmp	r0, #0
	beq	.L516
	movw	r1, #:lower16:.LC65
	mov	r2, #11
	movt	r1, #:upper16:.LC65
	bl	strncmp
	cmp	r0, #0
	beq	.L540
.L516:
	ldr	r0, [r4, #568]
	cmp	r0, #0
	beq	.L517
	movw	r1, #:lower16:.LC65
	mov	r2, #11
	movt	r1, #:upper16:.LC65
	bl	strncmp
	cmp	r0, #0
	beq	.L541
.L517:
	ldr	r0, [r4, #592]
	cmp	r0, #0
	beq	.L518
	movw	r1, #:lower16:.LC65
	mov	r2, #11
	movt	r1, #:upper16:.LC65
	bl	strncmp
	cmp	r0, #0
	beq	.L542
.L518:
	ldr	r0, [r4, #616]
	cmp	r0, #0
	beq	.L519
	movw	r1, #:lower16:.LC65
	mov	r2, #11
	movt	r1, #:upper16:.LC65
	bl	strncmp
	cmp	r0, #0
	beq	.L543
.L519:
	ldr	r0, [r4, #640]
	cmp	r0, #0
	beq	.L520
	movw	r1, #:lower16:.LC65
	mov	r2, #11
	movt	r1, #:upper16:.LC65
	bl	strncmp
	cmp	r0, #0
	beq	.L544
.L520:
	ldr	r0, [r4, #664]
	cmp	r0, #0
	beq	.L521
	movw	r1, #:lower16:.LC65
	mov	r2, #11
	movt	r1, #:upper16:.LC65
	bl	strncmp
	cmp	r0, #0
	beq	.L545
.L521:
	ldr	r0, [r4, #688]
	cmp	r0, #0
	beq	.L547
	movw	r1, #:lower16:.LC65
	mov	r2, #11
	movt	r1, #:upper16:.LC65
	bl	strncmp
	cmp	r0, #0
	moveq	r0, #7
	beq	.L515
.L547:
	mov	r6, #0
.L522:
	ldrb	r3, [r4, #508]	@ zero_extendqisi2
	mov	r2, #30
	movw	r1, #299
	mov	r0, r5
	cmp	r3, #0
	movne	r3, #22
	moveq	r3, #0
	bl	snd_soc_update_bits
	ldrb	r3, [r4, #509]	@ zero_extendqisi2
	mov	r2, #30
	movw	r1, #305
	mov	r0, r5
	cmp	r3, #0
	movne	r3, #22
	moveq	r3, #0
	bl	snd_soc_update_bits
	ldrb	r3, [r4, #510]	@ zero_extendqisi2
	mov	r2, #30
	movw	r1, #311
	mov	r0, r5
	cmp	r3, #0
	movne	r3, #22
	moveq	r3, #0
	bl	snd_soc_update_bits
	ldrb	r3, [r4, #511]	@ zero_extendqisi2
	mov	r2, #30
	movw	r1, #317
	mov	r0, r5
	cmp	r3, #0
	movne	r3, #22
	moveq	r3, #0
	bl	snd_soc_update_bits
	ldr	r2, [r4, #712]
	mov	r3, #31744
	movt	r3, 146
	cmp	r2, r3
	beq	.L623
	mov	r3, #32768
	movt	r3, 187
	cmp	r2, r3
	bne	.L535
	ldr	r2, [r4, #716]
	mov	r3, #57344
	movt	r3, 46
	cmp	r2, r3
	beq	.L531
	bls	.L624
	cmp	r2, #4096000
	beq	.L539
	mov	r3, #49152
	movt	r3, 93
	cmp	r2, r3
	beq	.L553
.L536:
	mov	r3, #32768
	movw	r0, #:lower16:.LC67
	ldr	r1, .L629
	movt	r3, 187
	movt	r0, #:upper16:.LC67
	mvn	r6, #21
	bl	printk
	b	.L501
.L622:
	asr	r3, r7, #5
	asr	r0, r9, #2
	and	r3, r3, #2
	and	r0, r0, #16
	orr	r3, r3, r10, lsr #6
	mov	r2, #19
	movw	r1, #369
	orr	r3, r3, r0
	mov	r0, r5
	bl	snd_soc_update_bits
	ldrb	r3, [r4, #516]	@ zero_extendqisi2
	tst	r3, #1
	beq	.L513
	b	.L625
.L621:
	lsr	r1, r7, #4
	ubfx	r8, r10, #5, #1
	ubfx	r3, r9, #5, #1
	and	r1, r1, #2
	mov	r2, #1
	orr	r8, r1, r8
	mov	r0, r5
	movw	r1, #359
	bl	snd_soc_update_bits
	mov	r3, r8
	mov	r2, #3
	mov	r1, #360
	mov	r0, r5
	bl	snd_soc_update_bits
	tst	r6, #64
	beq	.L512
	b	.L622
.L620:
	lsl	r1, r7, #1
	and	r8, r10, #16
	and	r3, r9, #16
	and	r1, r1, #32
	mov	r2, #16
	orr	r8, r1, r8
	mov	r0, r5
	movw	r1, #359
	bl	snd_soc_update_bits
	mov	r3, r8
	mov	r2, #48
	mov	r1, #360
	mov	r0, r5
	bl	snd_soc_update_bits
	tst	r6, #32
	beq	.L511
	b	.L621
.L619:
	lsr	r1, r7, #2
	ubfx	r8, r10, #3, #1
	ubfx	r3, r9, #3, #1
	and	r1, r1, #2
	mov	r2, #1
	orr	r8, r1, r8
	mov	r0, r5
	movw	r1, #349
	bl	snd_soc_update_bits
	mov	r3, r8
	mov	r2, #3
	movw	r1, #350
	mov	r0, r5
	bl	snd_soc_update_bits
	tst	r6, #16
	beq	.L510
	b	.L620
.L616:
	lsl	r8, r10, #4
	lsl	r2, r7, #5
	lsl	r3, r9, #4
	and	r2, r2, #32
	and	r8, r8, #16
	orr	r8, r8, r2
	and	r3, r3, #16
	mov	r2, #16
	movw	r1, #339
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r8
	mov	r2, #48
	mov	r1, #340
	mov	r0, r5
	bl	snd_soc_update_bits
	tst	r6, #2
	beq	.L507
	b	.L617
.L618:
	lsl	r8, r10, #2
	lsl	r2, r7, #3
	lsl	r3, r9, #2
	and	r2, r2, #32
	and	r8, r8, #16
	orr	r8, r8, r2
	and	r3, r3, #16
	mov	r2, #16
	movw	r1, #349
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r8
	mov	r2, #48
	movw	r1, #350
	mov	r0, r5
	bl	snd_soc_update_bits
	tst	r6, #8
	beq	.L509
	b	.L619
.L617:
	and	r3, r7, #2
	ubfx	r8, r10, #1, #1
	orr	r8, r8, r3
	mov	r2, #1
	ubfx	r3, r9, #1, #1
	movw	r1, #339
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r8
	mov	r2, #3
	mov	r1, #340
	mov	r0, r5
	bl	snd_soc_update_bits
	tst	r6, #4
	beq	.L508
	b	.L618
.L624:
	cmp	r2, #0
	bne	.L536
.L539:
	mov	r8, #0
	mov	r7, #2
	mov	r9, #34
	mov	r4, #1
.L534:
	mov	r3, r4
	mov	r2, #7
	movw	r1, #549
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r4
	mov	r2, #7
	movw	r1, #557
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r4
	mov	r2, #7
	movw	r1, #565
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r4
	mov	r2, #7
	movw	r1, #573
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r4
	mov	r2, #7
	movw	r1, #581
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r4
	mov	r2, #7
	movw	r1, #589
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r4
	mov	r2, #7
	movw	r1, #597
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r4
	mov	r2, #7
	movw	r1, #605
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r4
	mov	r2, #7
	movw	r1, #613
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r4
	mov	r2, #7
	movw	r1, #621
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r9
	mov	r2, #238
	mov	r1, #772
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r7
	mov	r2, #14
	movw	r1, #773
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r8
	mov	r0, r5
	mov	r2, #1
	movw	r1, #525
	bl	snd_soc_update_bits
.L503:
.L501:
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L505:
	mvn	r6, #21
	b	.L501
.L623:
	ldr	r2, [r4, #716]
	mov	r3, #40704
	movt	r3, 36
	cmp	r2, r3
	beq	.L531
	bls	.L626
	mov	r3, #54272
	movt	r3, 48
	cmp	r2, r3
	beq	.L539
	mov	r3, #15872
	movt	r3, 73
	cmp	r2, r3
	bne	.L530
.L553:
	mov	r7, #0
	mov	r8, #1
	mov	r9, r7
	mov	r4, r7
	b	.L534
.L531:
	mov	r8, #0
	mov	r7, #4
	mov	r9, #68
	mov	r4, #2
	b	.L534
.L545:
	mov	r0, #6
.L515:
	add	r0, r0, r0, lsl #1
	movw	r1, #30528
	movt	r1, 27
	add	r0, r4, r0, lsl #3
	ldr	r2, [r0, #524]
	ldr	r3, [r0, #528]
	cmp	r2, r1
	beq	.L627
	movw	r1, #37312
	movt	r1, 33
	cmp	r2, r1
	bne	.L524
	cmp	r3, r2
	bne	.L524
	mov	r2, #30
	mov	r1, #256
	mov	r0, r5
	mov	r6, #0
	bl	snd_soc_write
	b	.L522
.L627:
	cmp	r3, r2
	beq	.L628
.L524:
	movw	r0, #:lower16:.LC66
	ldr	r1, .L629
	mvn	r6, #21
	movt	r0, #:upper16:.LC66
	bl	printk
	b	.L522
.L540:
	mov	r0, #1
	b	.L515
.L541:
	mov	r0, #2
	b	.L515
.L542:
	mov	r0, #3
	b	.L515
.L626:
	cmp	r2, #0
	beq	.L539
.L530:
	mov	r3, #31744
	movw	r0, #:lower16:.LC67
	ldr	r1, .L629
	movt	r3, 146
	movt	r0, #:upper16:.LC67
	mvn	r6, #21
	bl	printk
	b	.L501
.L543:
	mov	r0, #4
	b	.L515
.L544:
	mov	r0, #5
	b	.L515
.L628:
	mov	r2, #28
	mov	r1, #256
	mov	r0, r5
	mov	r6, #0
	bl	snd_soc_write
	b	.L522
.L615:
	movw	r0, #:lower16:.LC64
	ldr	r1, .L629
	mvn	r6, #18
	movt	r0, #:upper16:.LC64
	bl	printk
	b	.L501
.L535:
	movw	r0, #:lower16:.LC68
	ldr	r1, .L629
	mvn	r6, #21
	movt	r0, #:upper16:.LC68
	bl	printk
	b	.L501
.L630:
	.align	2
.L629:
	.word	.LANCHOR2+540
	.fnend
	.size	taiko_handle_pdata, .-taiko_handle_pdata
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_slimbus_irq, %function
taiko_slimbus_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r3, #0
	mov	r4, #52
	strd	r6, [sp, #8]
	mov	r5, r3
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r7, [r1]
	.pad #28
	sub	sp, sp, #28
	str	r1, [sp, #8]
	str	r3, [sp, #20]
.L632:
	uxth	r1, r4
	ldr	r0, [r7, #108]
	add	r4, r4, #1
	bl	wcd9xxx_interface_reg_read
	ldr	r3, [sp, #20]
	uxtb	r0, r0
	cmp	r4, #56
	orr	r3, r3, r0, lsl r5
	add	r5, r5, #8
	str	r3, [sp, #20]
	bne	.L632
	mov	r1, #32
	add	r0, sp, #20
	bl	_find_first_bit_le
	cmp	r0, #31
	mov	r4, r0
	bgt	.L633
	mov	fp, #1
	b	.L655
.L649:
	rsbs	r3, r4, #0
	and	r2, r4, #7
	ldr	r0, [r7, #108]
	and	r3, r3, #7
	add	r1, r4, #7
	rsbpl	r2, r3, #0
	cmp	r4, #0
	movge	r1, r4
	lsl	r2, fp, r2
	asr	r1, r1, #3
	uxtb	r2, r2
	add	r1, r1, #56
	uxth	r1, r1
	bl	wcd9xxx_interface_reg_write
	add	r0, sp, #20
	add	r2, r4, #1
	mov	r1, #32
	bl	_find_next_bit_le
	cmp	r0, #31
	mov	r4, r0
	bgt	.L633
.L655:
	add	r1, r4, #96
	cmp	r4, #15
	ldr	r0, [r7, #108]
	uxth	r1, r1
	subgt	r6, r4, #16
	movle	r6, r4
	bl	wcd9xxx_interface_reg_read
	tst	r0, #1
	mov	r8, r0
	uxtb	r5, r0
	bne	.L676
.L636:
	tst	r8, #2
	bne	.L677
.L640:
	tst	r5, #3
	beq	.L644
	cmp	r6, #0
	add	r5, r6, #7
	ldr	r0, [r7, #108]
	movge	r5, r6
	cmp	r4, #15
	ubfx	r5, r5, #3, #16
	addle	r5, r5, #48
	addgt	r5, r5, #50
	uxth	r5, r5
	mov	r1, r5
	bl	wcd9xxx_interface_reg_read
	rsbs	r1, r6, #0
	uxtb	r3, r0
	and	r1, r1, #7
	and	r2, r6, #7
	rsbpl	r2, r1, #0
	asr	r3, r3, r2
	tst	r3, #1
	bne	.L678
.L644:
	tst	r8, #4
	beq	.L649
	cmp	r4, #15
	ble	.L650
	movw	r3, #:lower16:.LC69
	sub	r9, r4, #16
	movt	r3, #:upper16:.LC69
	str	r3, [sp, #12]
.L651:
	ldr	r3, [sp, #8]
	mov	r10, #0
	add	r5, r3, #60
	add	r8, r3, #380
	b	.L653
.L652:
	add	r5, r5, #40
	cmp	r8, r5
	beq	.L679
.L653:
	mov	r1, r5
	mov	r0, r9
	bl	_test_and_clear_bit
	cmp	r0, #0
	beq	.L652
	ldr	r3, [r5]
	mov	r10, #1
	cmp	r3, #0
	bne	.L652
	add	r0, r5, #4
	mov	r2, r10
	mov	r1, #3
	add	r5, r5, #40
	bl	__wake_up
	cmp	r8, r5
	bne	.L653
.L679:
	cmp	r10, #0
	bne	.L649
	movw	r2, #:lower16:.LC73
	movw	r0, #:lower16:.LC27
	ldr	r3, [sp, #12]
	movt	r2, #:upper16:.LC73
	movt	r0, #:upper16:.LC27
	str	r6, [sp]
	movw	r1, #6417
	bl	warn_slowpath_fmt
	b	.L649
.L677:
	ldr	r1, .L680
	ldr	r0, .L680+4
	bl	___ratelimit
	cmp	r0, #0
	beq	.L640
	movw	r3, #:lower16:.LC69
	cmp	r4, #15
	ldr	r1, .L680
	movt	r3, #:upper16:.LC69
	movw	r2, #:lower16:.LC70
	str	r5, [sp]
	movw	r0, #:lower16:.LC72
	movt	r2, #:upper16:.LC70
	movt	r0, #:upper16:.LC72
	movgt	r2, r3
	mov	r3, r6
	bl	printk
	b	.L640
.L676:
	ldr	r1, .L680
	ldr	r0, .L680+8
	bl	___ratelimit
	cmp	r0, #0
	beq	.L636
	movw	r3, #:lower16:.LC69
	cmp	r4, #15
	ldr	r1, .L680
	movt	r3, #:upper16:.LC69
	movw	r2, #:lower16:.LC70
	str	r5, [sp]
	movw	r0, #:lower16:.LC71
	movt	r2, #:upper16:.LC70
	movt	r0, #:upper16:.LC71
	movgt	r2, r3
	mov	r3, r6
	bl	printk
	b	.L636
.L633:
	mov	r0, #1
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L650:
	movw	r3, #:lower16:.LC70
	add	r9, r4, #16
	movt	r3, #:upper16:.LC70
	str	r3, [sp, #12]
	b	.L651
.L678:
	mov	r1, r5
	eor	r2, r0, fp, lsl r2
	ldr	r0, [r7, #108]
	uxtb	r2, r2
	bl	wcd9xxx_interface_reg_write
	b	.L644
.L681:
	.align	2
.L680:
	.word	.LANCHOR2+560
	.word	.LANCHOR1+116
	.word	.LANCHOR1+92
	.fnend
	.size	taiko_slimbus_irq, .-taiko_slimbus_irq
	.section	.init.text,"ax",%progbits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_init, %function
taiko_codec_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L683
	b	platform_driver_register
.L684:
	.align	2
.L683:
	.word	.LANCHOR1+12
	.fnend
	.size	taiko_codec_init, .-taiko_codec_init
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_volatile, %function
taiko_volatile:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	r3, r1, #256
	cmp	r3, #704
	bcs	.L716
	sub	r3, r1, #840
	sub	r3, r3, #2
	cmp	r3, #17
	bls	.L716
	bic	r3, r1, #128
	sub	r3, r3, #512
	sub	r3, r3, #2
	cmp	r3, #5
	bls	.L716
	movw	r3, #609
	cmp	r1, r3
	beq	.L716
	bhi	.L688
	movw	r3, #569
	cmp	r1, r3
	beq	.L716
	bls	.L717
	movw	r3, #585
	cmp	r1, r3
	beq	.L716
	bls	.L718
	movw	r3, #593
	cmp	r1, r3
	beq	.L716
	movw	r3, #601
	cmp	r1, r3
	bne	.L687
.L716:
	mov	r0, #1
	bx	lr
.L688:
	movw	r3, #711
	cmp	r1, r3
	beq	.L716
	cmp	r1, #712
	bcc	.L719
	movw	r3, #727
	cmp	r1, r3
	beq	.L716
	cmp	r1, #728
	bcc	.L720
	movw	r3, #735
	cmp	r1, r3
	beq	.L716
	movw	r3, #743
	cmp	r1, r3
	beq	.L716
.L687:
	movw	r3, #441
	sub	r2, r1, #424
	movw	r0, #331
	sub	r2, r2, #3
	cmp	r1, r0
	cmpne	r1, r3
	moveq	r3, #1
	movne	r3, #0
	bics	r2, r2, #8
	moveq	r3, #1
	cmp	r3, #0
	bne	.L716
	cmp	r1, #624
	bcc	.L693
	cmp	r1, #632
	bcc	.L716
	movw	r3, #763
	cmp	r1, r3
	beq	.L716
.L693:
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r2, [r3, #144]
	sub	r2, r2, #2048
	cmp	r1, r2
	beq	.L716
	ldr	r2, [r3, #164]
	sub	r2, r2, #2048
	cmp	r1, r2
	beq	.L716
	ldr	r2, [r3, #184]
	sub	r2, r2, #2048
	cmp	r1, r2
	beq	.L716
	ldr	r2, [r3, #204]
	sub	r2, r2, #2048
	cmp	r1, r2
	beq	.L716
	ldr	r2, [r3, #224]
	sub	r2, r2, #2048
	cmp	r1, r2
	beq	.L716
	ldr	r2, [r3, #244]
	sub	r2, r2, #2048
	cmp	r1, r2
	beq	.L716
	ldr	r2, [r3, #264]
	sub	r2, r2, #2048
	cmp	r1, r2
	beq	.L716
	ldr	r2, [r3, #284]
	sub	r2, r2, #2048
	cmp	r1, r2
	beq	.L716
	ldr	r2, [r3, #304]
	sub	r2, r2, #2048
	cmp	r1, r2
	beq	.L716
	ldr	r2, [r3, #324]
	sub	r2, r2, #2048
	cmp	r1, r2
	beq	.L716
	ldr	r2, [r3, #344]
	sub	r2, r2, #2048
	cmp	r1, r2
	beq	.L716
	ldr	r2, [r3, #364]
	sub	r2, r2, #2048
	cmp	r1, r2
	beq	.L716
	ldr	r2, [r3, #384]
	sub	r2, r2, #2048
	cmp	r1, r2
	beq	.L716
	ldr	r2, [r3, #404]
	sub	r2, r2, #2048
	cmp	r1, r2
	beq	.L716
	ldr	r2, [r3, #424]
	sub	r2, r2, #2048
	cmp	r1, r2
	beq	.L716
	ldr	r2, [r3, #444]
	sub	r2, r2, #2048
	cmp	r1, r2
	beq	.L716
	ldr	r2, [r3, #464]
	sub	r2, r2, #2048
	cmp	r1, r2
	beq	.L716
	ldr	r0, [r3, #484]
	sub	r0, r0, #2048
	sub	r0, r0, r1
	clz	r0, r0
	lsr	r0, r0, #5
	bx	lr
.L719:
	movw	r3, #695
	cmp	r1, r3
	beq	.L716
	movw	r3, #703
	cmp	r1, r3
	beq	.L716
	movw	r3, #617
	cmp	r1, r3
	bne	.L687
	b	.L716
.L717:
	movw	r3, #553
	cmp	r1, r3
	beq	.L716
	movw	r3, #561
	cmp	r1, r3
	beq	.L716
	movw	r3, #545
	cmp	r1, r3
	bne	.L687
	b	.L716
.L718:
	movw	r3, #577
	cmp	r1, r3
	bne	.L687
	b	.L716
.L720:
	movw	r3, #719
	cmp	r1, r3
	bne	.L687
	b	.L716
	.fnend
	.size	taiko_volatile, .-taiko_volatile
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_set_dai_fmt, %function
taiko_set_dai_fmt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r1
	mov	r5, r0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r3, [r0, #64]
	ldr	r0, [r3, #12]
	bl	dev_get_drvdata
	and	r1, r4, #61440
	cmp	r1, #4096
	beq	.L723
	cmp	r1, #16384
	mvnne	r4, #21
	bne	.L721
	ldrb	r3, [r0, #37]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L734
.L731:
	mov	r4, #0
.L721:
	mov	r0, r4
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L723:
	ldrb	r3, [r0, #37]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L731
	ldr	r4, [r5, #4]
	cmp	r4, #1
	beq	.L735
	cmp	r4, #0
	bne	.L731
	mov	r3, #8
	movw	r1, #774
	ldr	r0, [r5, #64]
	mov	r2, r3
	bl	snd_soc_update_bits
	b	.L721
.L734:
	ldr	r4, [r5, #4]
	cmp	r4, #1
	beq	.L736
	cmp	r4, #0
	bne	.L731
	mov	r3, r4
	mov	r2, #8
	ldr	r0, [r5, #64]
	movw	r1, #774
	bl	snd_soc_update_bits
	b	.L721
.L735:
	mov	r3, #8
	movw	r1, #775
	ldr	r0, [r5, #64]
	mov	r2, r3
	mov	r4, #0
	bl	snd_soc_update_bits
	b	.L721
.L736:
	mov	r3, #0
	mov	r2, #8
	ldr	r0, [r5, #64]
	movw	r1, #775
	mov	r4, r3
	bl	snd_soc_update_bits
	b	.L721
	.fnend
	.size	taiko_set_dai_fmt, .-taiko_set_dai_fmt
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_resume, %function
taiko_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r4, r0
	str	lr, [sp, #4]
	bl	dev_get_drvdata
	cmp	r0, #0
	beq	.L741
	add	r0, r0, #416
	mov	r1, #47
	bl	wcd9xxx_resmgr_notifier_call
	mov	r0, #0
.L737:
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L741:
	movw	r1, #:lower16:.LC74
	mov	r0, r4
	ldr	r2, .L742
	movt	r1, #:upper16:.LC74
	bl	dev_err
	mvn	r0, #21
	b	.L737
.L743:
	.align	2
.L742:
	.word	.LANCHOR2+580
	.fnend
	.size	taiko_resume, .-taiko_resume
	.section	.devinit.text,"ax",%progbits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_probe, %function
taiko_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	bl	wcd9xxx_get_intf_type
	cmp	r0, #1
	bne	.L745
	ldr	r2, .L748
	add	r0, r4, #8
	mov	r3, #8
	pop	{r4, lr}
	add	r1, r2, #1088
	b	snd_soc_register_codec
.L745:
	bl	wcd9xxx_get_intf_type
	cmp	r0, #2
	bne	.L746
	ldr	r2, .L748+4
	add	r0, r4, #8
	mov	r3, #4
	pop	{r4, lr}
	sub	r1, r2, #120
	b	snd_soc_register_codec
.L746:
	mov	r0, #0
	pop	{r4, pc}
.L749:
	.align	2
.L748:
	.word	.LANCHOR1+504
	.word	.LANCHOR1+1712
	.fnend
	.size	taiko_probe, .-taiko_probe
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_get_hwdep_fw_cal, %function
taiko_get_hwdep_fw_cal:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	subs	r4, r0, #0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	beq	.L754
	ldr	r0, [r4, #12]
	mov	r5, r1
	bl	dev_get_drvdata
	ldr	r0, [r0, #1272]
	mov	r1, r5
	bl	wcdcal_get_fw_cal
	subs	r6, r0, #0
	beq	.L755
.L750:
	mov	r0, r6
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L755:
	movw	r1, #:lower16:.LC76
	mov	r3, r5
	ldr	r2, .L756
	movt	r1, #:upper16:.LC76
	ldr	r0, [r4, #12]
	bl	dev_err
	b	.L750
.L754:
	movw	r0, #:lower16:.LC75
	ldr	r1, .L756
	mov	r6, r4
	movt	r0, #:upper16:.LC75
	bl	printk
	b	.L750
.L757:
	.align	2
.L756:
	.word	.LANCHOR2+596
	.fnend
	.size	taiko_get_hwdep_fw_cal, .-taiko_get_hwdep_fw_cal
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_update_reg_defaults, %function
taiko_update_reg_defaults:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	ldr	r4, .L769
	mov	r5, r0
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r3, [r0, #12]
	add	r6, r4, #148
	ldr	r0, [r3]
	bl	dev_get_drvdata
	mov	r7, r0
.L759:
	ldrb	r2, [r4, #3]	@ zero_extendqisi2
	mov	r0, r5
	ldrh	r1, [r4], #4
	bl	snd_soc_write
	cmp	r6, r4
	bne	.L759
	ldrb	r3, [r7, #60]	@ zero_extendqisi2
	cmp	r3, #1
	ldrne	r4, .L769+4
	addne	r6, r4, #212
	beq	.L768
.L763:
	ldrb	r2, [r4, #3]	@ zero_extendqisi2
	mov	r0, r5
	ldrh	r1, [r4], #4
	bl	snd_soc_write
	cmp	r4, r6
	bne	.L763
	movw	r3, #:lower16:.LANCHOR1
	mvn	r2, #0
	movt	r3, #:upper16:.LANCHOR1
	str	r2, [r3]
.L758:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L768:
	ldr	r4, .L769+8
	add	r6, r4, #48
.L761:
	ldrb	r2, [r4, #3]	@ zero_extendqisi2
	mov	r0, r5
	ldrh	r1, [r4], #4
	bl	snd_soc_write
	cmp	r6, r4
	bne	.L761
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L758
	mov	r0, r5
	mov	r2, #239
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	movw	r1, #479
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	snd_soc_write
.L770:
	.align	2
.L769:
	.word	.LANCHOR2+620
	.word	.LANCHOR2+816
	.word	.LANCHOR2+768
	.fnend
	.size	taiko_update_reg_defaults, .-taiko_update_reg_defaults
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_config_gain_compander, %function
taiko_config_gain_compander:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #1
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	beq	.L773
	cmp	r1, #2
	mov	r4, r1
	beq	.L774
	cmp	r1, #0
	beq	.L779
	movw	r0, #:lower16:.LC27
	movw	r1, #971
	movt	r0, #:upper16:.LC27
	bl	warn_slowpath_null
	mvn	r0, #21
.L771:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L779:
	eor	r3, r2, #1
	mov	r1, #480
	mov	r2, #4
	lsl	r3, r3, #2
	bl	snd_soc_update_bits
	mov	r0, r4
	b	.L771
.L774:
	eor	r4, r2, #1
	movw	r1, #461
	lsl	r4, r4, #5
	mov	r2, #32
	mov	r3, r4
	bl	snd_soc_update_bits
	mov	r3, r4
	mov	r2, #32
	movw	r1, #469
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r4
	mov	r2, #32
	movw	r1, #465
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r4
	mov	r0, r5
	mov	r2, #32
	movw	r1, #473
	bl	snd_soc_update_bits
	mov	r0, #0
	b	.L771
.L773:
	eor	r4, r2, #1
	movw	r1, #430
	lsl	r4, r4, #5
	mov	r2, #32
	mov	r3, r4
	bl	snd_soc_update_bits
	mov	r3, r4
	mov	r0, r5
	mov	r2, #32
	mov	r1, #436
	bl	snd_soc_update_bits
	mov	r0, #0
	b	.L771
	.fnend
	.size	taiko_config_gain_compander, .-taiko_config_gain_compander
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_probe, %function
taiko_codec_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r5, #:lower16:kmalloc_caches
	mov	r4, r0
	strd	r6, [sp, #8]
	movt	r5, #:upper16:kmalloc_caches
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #12]
	.pad #36
	sub	sp, sp, #36
	str	r5, [sp, #16]
	ldr	r0, [r3]
	bl	dev_get_drvdata
	ldr	r3, [r4, #12]
	str	r0, [sp, #20]
	ldr	r0, [r3]
	bl	dev_get_drvdata
	mov	r6, r0
	movw	r3, #:lower16:taiko_post_reset_cb
	ldr	r2, .L847
	movw	r0, #:lower16:taiko_device_down
	movt	r3, #:upper16:taiko_post_reset_cb
	movt	r0, #:upper16:taiko_device_down
	movw	r1, #:lower16:.LC77
	str	r6, [r4, #108]
	movt	r1, #:upper16:.LC77
	str	r0, [r6, #76]
	str	r3, [r6, #80]
	str	r4, [r6, #84]
	ldr	r0, [r4, #12]
	bl	_dev_info
	ldr	r0, [r5, #44]
	cmp	r0, #0
	beq	.L811
	movw	r2, #1276
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r5, r0, #0
	beq	.L834
.L781:
	ldr	r7, .L847+4
	movw	r10, #:lower16:tx_hpf_corner_freq_callback
	movw	r9, #:lower16:delayed_work_timer_fn
	mov	fp, #65024
	movt	r10, #:upper16:tx_hpf_corner_freq_callback
	movt	r9, #:upper16:delayed_work_timer_fn
	movt	fp, 65535
	mov	r8, #0
.L783:
	sub	ip, r7, #12
	add	r8, r8, #1
	str	r5, [r7, #-28]
	mov	r3, #0
	mov	r0, r7
	mov	r2, r3
	mov	r1, r3
	str	r8, [r7, #-24]
	str	fp, [r7, #-16]
	str	ip, [r7, #-12]
	str	ip, [r7, #-8]
	str	r10, [r7, #-4]
	bl	init_timer_key
	sub	r3, r7, #16
	cmp	r8, #10
	str	r9, [r7, #16]
	add	r7, r7, #64
	str	r3, [r7, #-44]
	bne	.L783
	mov	r1, r5
	ldr	r0, [r4, #12]
	mov	fp, #1
	bl	dev_set_drvdata
	ldr	r3, [r4, #12]
	add	r8, r5, #416
	mov	r1, r4
	ldr	ip, .L847+8
	mov	r0, r8
	ldr	r10, [r4, #108]
	ldr	r3, [r3]
	add	r2, r10, #100
	ldr	r3, [r3, #84]
	str	ip, [sp, #4]
	str	fp, [sp, #8]
	add	ip, r3, #488
	str	ip, [sp]
	bl	wcd9xxx_resmgr_init
	subs	r9, r0, #0
	bne	.L835
	ldr	r0, [r4, #12]
	bl	dev_get_drvdata
	ldr	r7, [r0, #456]
	movw	r1, #:lower16:.LC80
	mov	r2, #13
	movt	r1, #:upper16:.LC80
	ldr	r0, [r7, #520]
	bl	strncmp
	cmp	r0, #0
	beq	.L787
	movw	r1, #:lower16:.LC80
	mov	r2, #13
	ldr	r0, [r7, #544]
	movt	r1, #:upper16:.LC80
	bl	strncmp
	cmp	r0, #0
	beq	.L812
	movw	r1, #:lower16:.LC80
	mov	r2, #13
	ldr	r0, [r7, #568]
	movt	r1, #:upper16:.LC80
	bl	strncmp
	cmp	r0, #0
	beq	.L813
	movw	r1, #:lower16:.LC80
	mov	r2, #13
	ldr	r0, [r7, #592]
	movt	r1, #:upper16:.LC80
	bl	strncmp
	cmp	r0, #0
	beq	.L814
	movw	r1, #:lower16:.LC80
	mov	r2, #13
	ldr	r0, [r7, #616]
	movt	r1, #:upper16:.LC80
	bl	strncmp
	cmp	r0, #0
	beq	.L815
	movw	r1, #:lower16:.LC80
	mov	r2, #13
	ldr	r0, [r7, #640]
	movt	r1, #:upper16:.LC80
	bl	strncmp
	cmp	r0, #0
	beq	.L816
	movw	r1, #:lower16:.LC80
	mov	r2, #13
	ldr	r0, [r7, #664]
	movt	r1, #:upper16:.LC80
	bl	strncmp
	cmp	r0, #0
	beq	.L817
	movw	r1, #:lower16:.LC80
	mov	r2, #13
	ldr	r0, [r7, #688]
	movt	r1, #:upper16:.LC80
	bl	strncmp
	cmp	r0, #0
	moveq	r0, #7
	beq	.L787
	mov	r3, #0
.L788:
	mov	r2, #0
	add	r0, r5, #1136
	str	r3, [r5, #1152]
	add	r0, r0, #12
	mov	r1, r8
	strb	r2, [r5, #1156]
	bl	wcd9xxx_clsh_init
	ldr	r3, [sp, #16]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L836
	mov	r2, #52
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	cmp	r0, #0
	str	r0, [r5, #1272]
	bne	.L790
	movw	r1, #:lower16:.LC81
	ldr	r0, [r4, #12]
	movt	r1, #:upper16:.LC81
	bl	dev_err
.L786:
	mov	r0, r5
	bl	kfree
.L780:
	mov	r0, r9
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L836:
	mov	r3, #16
	mov	r0, r3
	str	r3, [r5, #1272]
.L790:
	add	r1, r0, #12
	mov	r0, #0
	bl	_set_bit
	ldr	r1, [r5, #1272]
	mov	r0, #1
	add	r1, r1, #12
	bl	_set_bit
	ldr	r1, [r5, #1272]
	mov	r0, #2
	add	r1, r1, #12
	bl	_set_bit
	mov	r2, r4
	mov	r1, #1000
	ldr	r0, [r5, #1272]
	bl	wcd_cal_create_hwdep
	subs	r3, r0, #0
	blt	.L837
	mov	r7, #0
	mov	r3, #3
	str	r4, [r5]
	str	r7, [r5, #360]
	str	r7, [r5, #364]
	str	r7, [r5, #368]
	str	r3, [r5, #372]
	str	r3, [r5, #376]
	str	r3, [r5, #380]
	bl	wcd9xxx_get_intf_type
	add	r3, r5, #388
	movw	r2, #7967
	strb	r0, [r5, #37]
	str	r7, [r5, #384]
	mov	r0, r4
	strh	r2, [r3]	@ movhi
	str	r7, [r5, #24]
	str	r7, [r5, #28]
	bl	taiko_update_reg_defaults
	ldr	r2, [r10, #376]
	mov	r3, #32768
	movt	r3, 187
	cmp	r2, r3
	beq	.L838
	mov	r3, #31744
	movt	r3, 146
	cmp	r2, r3
	beq	.L839
.L794:
	ldr	r7, .L847+12
	add	r10, r7, #176
.L795:
	ldrb	r3, [r7, #3]	@ zero_extendqisi2
	mov	r0, r4
	ldrb	r2, [r7, #2]	@ zero_extendqisi2
	ldrh	r1, [r7], #4
	bl	snd_soc_update_bits
	cmp	r10, r7
	bne	.L795
	mov	r0, r5
	bl	taiko_handle_pdata
	cmn	r0, #4096
	mov	r3, r0
	bhi	.L840
	ldr	r3, [r4, #12]
	ldr	r0, [r3]
	bl	dev_get_drvdata
	ldr	r7, [r0, #92]
	cmp	r7, #0
	beq	.L797
	ldr	fp, [r0, #96]
	movw	r10, #:lower16:.LC37
	movt	r10, #:upper16:.LC37
.L799:
	ldr	r3, [fp]
	mov	r1, r10
	add	r9, r9, #1
	subs	r0, r3, #0
	beq	.L798
	bl	strcmp
	cmp	r0, #0
	beq	.L841
.L798:
	cmp	r9, r7
	add	fp, fp, #20
	bne	.L799
	mov	r7, #0
.L797:
	movw	r9, #:lower16:.LANCHOR1
	str	r7, [r5, #392]
	movt	r9, #:upper16:.LANCHOR1
	ldr	r3, [r9]
	cmp	r3, #0
	ble	.L800
	add	r7, r5, #552
	mov	r0, r7
	bl	mutex_lock
	mov	r0, r8
	mov	r1, #1
	bl	wcd9xxx_resmgr_get_bandgap
	mov	r0, r7
	bl	mutex_unlock
.L800:
	ldr	r3, [r9, #2264]
	mov	r0, r4
	blx	r3
	ldr	r3, [sp, #16]
	ldr	r0, [r3, #40]
	cmp	r0, #0
	beq	.L821
	mov	r2, #696
	mov	r1, #208
	bl	kmem_cache_alloc_trace
	subs	r8, r0, #0
	beq	.L802
	ldrb	r2, [r5, #37]	@ zero_extendqisi2
	add	r9, r8, #312
	add	r7, r4, #176
	cmp	r2, #2
	beq	.L842
.L803:
	cmp	r2, #1
	beq	.L843
.L805:
	ldrb	r3, [r6, #60]	@ zero_extendqisi2
	mov	r2, #6
	cmp	r3, #1
	beq	.L844
.L808:
	ldr	r1, .L847+16
	mov	r0, r7
	bl	snd_soc_dapm_new_controls
	mov	r2, #14
	ldr	r1, .L847+20
	mov	r0, r4
	bl	snd_soc_add_codec_controls
.L809:
	mov	r2, #2
	ldr	r1, .L847+24
	mov	r0, r4
	bl	snd_soc_add_codec_controls
	mov	r3, #13
	mov	r2, #312
	ldr	r1, .L847+28
	mov	r0, r8
	str	r3, [r6, #360]
	str	r8, [r6, #368]
	bl	memcpy
	mov	r3, #16
	mov	r2, #384
	ldr	r1, .L847+32
	mov	r0, r9
	str	r3, [r6, #364]
	str	r9, [r6, #372]
	bl	memcpy
	mov	r0, r7
	bl	snd_soc_dapm_sync
	ldr	r6, [r5]
	movw	r3, #:lower16:.LC86
	movw	r2, #:lower16:taiko_slimbus_irq
	movt	r3, #:upper16:.LC86
	movt	r2, #:upper16:taiko_slimbus_irq
	mov	r1, #0
	ldr	r0, [r6, #108]
	str	r5, [sp]
	add	r0, r0, #100
	bl	wcd9xxx_request_irq
	subs	r9, r0, #0
	bne	.L845
	mov	r2, #255
	mov	r1, #48
	ldr	r0, [r6, #108]
	bl	wcd9xxx_interface_reg_write
	mov	r2, #255
	mov	r1, #49
	ldr	r0, [r6, #108]
	bl	wcd9xxx_interface_reg_write
	mov	r2, #255
	mov	r1, #50
	ldr	r0, [r6, #108]
	bl	wcd9xxx_interface_reg_write
	ldr	r0, [r4, #256]
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	str	r5, [r3]
	add	r0, r0, #20
	bl	mutex_lock
	movw	r1, #:lower16:.LC55
	mov	r0, r7
	movt	r1, #:upper16:.LC55
	bl	snd_soc_dapm_disable_pin
	movw	r1, #:lower16:.LC54
	mov	r0, r7
	movt	r1, #:upper16:.LC54
	bl	snd_soc_dapm_disable_pin
	movw	r1, #:lower16:.LC56
	mov	r0, r7
	movt	r1, #:upper16:.LC56
	bl	snd_soc_dapm_disable_pin
	movw	r1, #:lower16:.LC57
	mov	r0, r7
	movt	r1, #:upper16:.LC57
	bl	snd_soc_dapm_disable_pin
	movw	r1, #:lower16:.LC58
	mov	r0, r7
	movt	r1, #:upper16:.LC58
	bl	snd_soc_dapm_disable_pin
	mov	r0, r7
	bl	snd_soc_dapm_sync
	ldr	r0, [r4, #256]
	add	r0, r0, #20
	bl	mutex_unlock
	ldrb	r3, [r4, #292]	@ zero_extendqisi2
	mov	r0, r4
	orr	r3, r3, #1
	strb	r3, [r4, #292]
	bl	boeffla_sound_hook_taiko_codec_probe
	b	.L780
.L811:
	mov	r5, #16
	b	.L781
.L817:
	mov	r0, #6
.L787:
	add	r0, r0, r0, lsl #1
	movw	r1, #30528
	movw	r2, #52848
	add	r7, r7, r0, lsl #3
	movt	r1, 27
	movt	r2, 32
	ldr	r3, [r7, #524]
	cmp	r3, r2
	cmpne	r3, r1
	movne	r3, #0
	b	.L788
.L821:
	ldrb	r2, [r5, #37]	@ zero_extendqisi2
	mov	r9, #328
	mov	r8, #16
	add	r7, r4, #176
	cmp	r2, #2
	bne	.L803
.L842:
	ldr	r1, .L847+36
	mov	r0, r7
	bl	snd_soc_dapm_new_controls
	mov	r2, #8
	ldr	r1, .L847+40
	mov	r0, r7
	bl	snd_soc_dapm_add_routes
	ldr	r3, [sp, #20]
	ldrb	r2, [r3, #60]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L846
	mov	r2, #1
	ldr	r1, .L847+44
	mov	r0, r7
	bl	snd_soc_dapm_add_routes
.L806:
	add	r2, r5, #128
	add	r3, r5, #168
	add	r0, r5, #48
	add	r1, r5, #88
	str	r0, [r5, #48]
	str	r0, [r5, #52]
	str	r1, [r5, #88]
	str	r1, [r5, #92]
	str	r2, [r5, #128]
	str	r2, [r5, #132]
	mov	r2, #6
	str	r3, [r5, #168]
	str	r3, [r5, #172]
	ldrb	r3, [r6, #60]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L808
.L844:
	ldr	r1, .L847+48
	mov	r0, r7
	bl	snd_soc_dapm_new_controls
	mov	r2, #14
	ldr	r1, .L847+52
	mov	r0, r4
	bl	snd_soc_add_codec_controls
	b	.L809
.L838:
	mov	r3, r7
	mov	r1, r7
	mov	r2, #6
	mov	r0, r4
	bl	snd_soc_update_bits
	b	.L794
.L841:
	ldr	r7, [fp, #4]
	b	.L797
.L837:
	movw	r1, #:lower16:.LC82
	ldr	r2, .L847
	mov	r9, r3
	movt	r1, #:upper16:.LC82
	ldr	r0, [r4, #12]
	bl	dev_err
.L792:
	ldr	r0, [r5, #1272]
	bl	kfree
	b	.L786
.L843:
	movw	r10, #:lower16:.LC85
	add	fp, r5, #64
	str	r4, [sp, #16]
	movt	r10, #:upper16:.LC85
	add	r3, r5, #384
	mov	r4, fp
	mov	fp, r10
	mov	r10, r3
.L807:
	sub	ip, r4, #16
	mov	r0, r4
	ldr	r2, .L847+56
	mov	r1, fp
	add	r4, r4, #40
	str	ip, [r4, #-56]
	str	ip, [r4, #-52]
	bl	__init_waitqueue_head
	cmp	r10, r4
	bne	.L807
	ldr	r2, [r6, #8]
	mov	r1, #12
	mov	r10, #1048576
	ldr	r3, .L847+60
	ldr	r4, [sp, #16]
	ldrb	r2, [r2, #372]	@ zero_extendqisi2
	strh	r2, [r3, #8]	@ movhi
	ldr	r2, [r6, #4]
	strh	r1, [r3, #16]	@ movhi
	ldr	r0, [r4, #12]
	ldrb	r2, [r2, #372]	@ zero_extendqisi2
	strh	r2, [r3, #6]	@ movhi
	bl	dev_get_drvdata
	ldr	lr, [r4, #108]
	mov	ip, #0
	mov	r3, #1
	add	r1, sp, #32
	mov	r2, #0
	strb	r3, [r0, #397]
	mov	r3, #0
	strb	ip, [r0, #398]
	strb	ip, [r0, #399]
	strb	ip, [r0, #400]
	str	r10, [r0, #409]	@ unaligned
	ldr	ip, [lr, #4]
	strd	r2, [r1, #-8]!
	ldr	r3, [ip, #356]!	@ unaligned
	ldrh	r2, [ip, #4]	@ unaligned
	str	r3, [sp, #24]
	str	r3, [r0, #401]	@ unaligned
	strh	r2, [r1, #4]	@ movhi
	ldr	r3, [sp, #28]
	str	r3, [r0, #405]	@ unaligned
	b	.L805
.L839:
	mov	r1, r7
	mov	r3, #2
	mov	r2, #6
	mov	r0, r4
	bl	snd_soc_update_bits
	b	.L794
.L812:
	mov	r0, fp
	b	.L787
.L813:
	mov	r0, #2
	b	.L787
.L814:
	mov	r0, #3
	b	.L787
.L840:
	movw	r0, #:lower16:.LC83
	ldr	r1, .L847
	mov	r9, r3
	movt	r0, #:upper16:.LC83
	bl	printk
	b	.L792
.L815:
	mov	r0, #4
	b	.L787
.L816:
	mov	r0, #5
	b	.L787
.L846:
	ldr	r1, .L847+64
	mov	r0, r7
	bl	snd_soc_dapm_add_routes
	b	.L806
.L834:
	movw	r1, #:lower16:.LC78
	ldr	r0, [r4, #12]
	mvn	r9, #11
	movt	r1, #:upper16:.LC78
	bl	dev_err
	b	.L780
.L845:
	movw	r0, #:lower16:.LC87
	mov	r2, #0
	ldr	r1, .L847+68
	movt	r0, #:upper16:.LC87
	bl	printk
	movw	r0, #:lower16:.LC88
	mov	r2, r9
	ldr	r1, .L847
	movt	r0, #:upper16:.LC88
	bl	printk
	ldr	r3, [r5]
	mov	r2, r5
	mov	r1, #0
	ldr	r0, [r3, #108]
	add	r0, r0, #100
	bl	wcd9xxx_free_irq
	mov	r0, r8
	bl	kfree
	b	.L792
.L802:
	movw	r0, #:lower16:.LC84
	ldr	r1, .L847
	mvn	r9, #11
	movt	r0, #:upper16:.LC84
	bl	printk
	b	.L792
.L835:
	movw	r0, #:lower16:.LC79
	mov	r2, r9
	ldr	r1, .L847
	movt	r0, #:upper16:.LC79
	bl	printk
	b	.L786
.L848:
	.align	2
.L847:
	.word	.LANCHOR2+1028
	.word	.LANCHOR0+32
	.word	.LANCHOR1+2256
	.word	.LANCHOR2+1048
	.word	.LANCHOR2+3144
	.word	.LANCHOR2+3960
	.word	.LANCHOR4-3552
	.word	.LANCHOR4-3456
	.word	.LANCHOR4-3144
	.word	.LANCHOR2+1224
	.word	.LANCHOR2+1496
	.word	.LANCHOR2+1640
	.word	.LANCHOR2+1656
	.word	.LANCHOR2+2472
	.word	.LANCHOR0+644
	.word	.LANCHOR1+2268
	.word	.LANCHOR2+1624
	.word	.LANCHOR4-2760
	.fnend
	.size	taiko_codec_probe, .-taiko_codec_probe
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_slimrx, %function
taiko_codec_enable_slimrx:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	mov	r6, r0
	strd	r8, [sp, #16]
	mov	r8, r2
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r4, [r0, #12]
	.pad #44
	sub	sp, sp, #44
	ldr	r0, [r4, #12]
	bl	dev_get_drvdata
	ldr	r3, [r4, #12]
	mov	r5, r0
	ldr	r0, [r3]
	bl	dev_get_drvdata
	ldrb	r3, [r5, #37]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L879
.L876:
	mov	r0, #0
.L849:
	add	sp, sp, #44
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L879:
	cmp	r8, #2
	mov	r10, r0
	ldrb	r7, [r6, #38]	@ zero_extendqisi2
	beq	.L851
	cmp	r8, #8
	bne	.L876
	add	r4, r7, r7, lsl #2
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	add	r6, r5, r4, lsl #3
	lsl	r4, r4, #3
	ldr	r3, [r3, #2304]
	mov	r0, r7
	add	r9, r4, #48
	blx	r3
	add	r3, r5, r9
	ldrh	r2, [r6, #56]
	mov	r0, r10
	mov	r1, r3
	lsl	r8, r7, #2
	str	r3, [sp, #12]
	bl	wcd9xxx_close_slim_sch_rx
	ldrb	fp, [r6, #76]	@ zero_extendqisi2
	cmp	fp, #0
	beq	.L880
	cmp	r0, #0
	blt	.L866
.L865:
	add	r7, r8, r7
	mov	r3, #0
	add	r5, r5, r7, lsl #3
	strb	r3, [r5, #76]
	b	.L849
.L851:
	add	r8, r7, #1
	add	r9, r7, r7, lsl #2
	add	r8, r8, r8, lsl #2
	add	r9, r5, r9, lsl #3
	lsl	r8, r8, #3
	mov	r3, #0
	mov	r1, r4
	add	r0, r5, r8
	strb	r3, [r9, #76]
	bl	taiko_codec_enable_int_port
	ldr	r4, [r9, #48]
	add	r9, r8, #8
	add	r9, r5, r9
	cmp	r9, r4
	sub	r4, r4, #16
	beq	.L853
	add	fp, r8, #20
	movw	r3, #:lower16:.LC89
	movt	r3, #:upper16:.LC89
	add	fp, r5, fp
	str	r3, [sp, #12]
.L854:
	ldr	r0, [r4, #4]
	bl	wcd9xxx_get_slave_port
	subs	r2, r0, #0
	mov	r1, fp
	blt	.L881
	bl	_set_bit
	ldr	r4, [r4, #16]
	cmp	r9, r4
	sub	r4, r4, #16
	bne	.L854
.L853:
	add	r7, r7, r7, lsl #2
	movw	r3, #:lower16:.LANCHOR1
	ldrb	r0, [r6, #38]	@ zero_extendqisi2
	movt	r3, #:upper16:.LANCHOR1
	add	r8, r8, #16
	ldr	r3, [r3, #2300]
	add	r8, r5, r8
	add	r5, r5, r7, lsl #3
	blx	r3
	ldrd	r2, [r5, #40]
	mov	r1, r9
	mov	r0, r10
	str	r8, [sp]
	bl	wcd9xxx_cfg_slim_sch_rx
	b	.L849
.L880:
	mov	r0, #1000
	bl	msecs_to_jiffies
	mov	r9, r0
	ldr	r0, [r6, #60]
	cmp	r0, #0
	beq	.L858
	mov	r3, sp
	str	fp, [sp, #20]
	add	r1, sp, #32
	bic	r2, r3, #8128
	add	r4, r4, #64
	bic	r2, r2, #63
	add	r4, r5, r4
	ldr	r0, [r2, #12]
	movw	r2, #:lower16:autoremove_wake_function
	movt	r2, #:upper16:autoremove_wake_function
	str	r0, [sp, #24]
	str	r2, [sp, #28]
	str	r1, [sp, #32]
	str	r1, [sp, #36]
	b	.L861
.L883:
	bl	schedule_timeout
	subs	r9, r0, #0
	beq	.L882
.L861:
	mov	r2, #2
	mov	r0, r4
	add	r1, sp, #20
	add	fp, r6, #60
	bl	prepare_to_wait
	ldr	r2, [r6, #60]
	mov	r0, r9
	cmp	r2, #0
	bne	.L883
	cmp	r9, #0
	beq	.L862
	mov	r0, r4
	add	r1, sp, #20
	str	r2, [sp, #12]
	bl	finish_wait
	ldr	r2, [sp, #12]
	mov	r0, r2
	b	.L865
.L858:
	cmp	r9, #0
	bne	.L865
.L864:
	movw	r0, #:lower16:.LC90
	ldr	r1, .L884
	movt	r0, #:upper16:.LC90
	bl	printk
.L866:
	add	r3, r8, r7
	mov	r0, r10
	ldr	r1, [sp, #12]
	add	r3, r5, r3, lsl #3
	ldrh	r2, [r3, #56]
	bl	wcd9xxx_disconnect_port
	b	.L865
.L882:
	ldr	r3, [fp]
	cmp	r3, #0
	beq	.L862
	add	r1, sp, #20
	mov	r0, r4
	bl	finish_wait
	b	.L864
.L862:
	mov	r0, r4
	add	r1, sp, #20
	bl	finish_wait
	mov	r0, #0
	b	.L865
.L881:
	ldr	r1, .L884
	ldr	r0, [sp, #12]
	bl	printk
	ldr	r4, [r4, #16]
	cmp	r9, r4
	sub	r4, r4, #16
	bne	.L854
	b	.L853
.L885:
	.align	2
.L884:
	.word	.LANCHOR4-2740
	.fnend
	.size	taiko_codec_enable_slimrx, .-taiko_codec_enable_slimrx
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_esxxx_hw_params, %function
taiko_esxxx_hw_params:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L986
	mov	r5, r2
	strd	r6, [sp, #8]
	mov	r6, r1
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	lr, [r1, #284]
	.pad #44
	sub	sp, sp, #44
	ldr	ip, [r1, #296]
	ldr	r3, [r2, #4]
	str	r2, [sp, #16]
	str	r0, [sp, #24]
	movw	r0, #:lower16:.LC91
	ldr	r2, [r2]
	movt	r0, #:upper16:.LC91
	stm	sp, {ip, lr}
	str	r1, [sp, #20]
	sub	r1, r4, #4
	bl	printk
	ldr	r3, [r5, #64]
	ldr	r0, [r3, #12]
	str	r3, [sp, #36]
	bl	dev_get_drvdata
	ldr	lr, [r6, #284]
	str	r0, [sp, #28]
	movw	r0, #:lower16:.LC91
	ldr	ip, [r6, #296]
	add	r1, r4, #20
	movt	r0, #:upper16:.LC91
	ldrd	r2, [r5]
	stm	sp, {ip, lr}
	bl	printk
	ldr	r2, [r6, #296]
	cmp	r2, #32000
	beq	.L888
	bls	.L975
	mov	r3, #30464
	movt	r3, 1
	cmp	r2, r3
	beq	.L892
	mov	r3, #60928
	movt	r3, 2
	cmp	r2, r3
	beq	.L893
	movw	r3, #48000
	cmp	r2, r3
	beq	.L976
.L887:
	ldr	r3, .L986+4
	movw	r0, #:lower16:.LC92
	movt	r0, #:upper16:.LC92
	sub	r1, r3, #12
	bl	printk
	mvn	r3, #21
	str	r3, [sp, #32]
.L895:
	ldr	r5, [sp, #16]
	movw	r4, #:lower16:.LANCHOR1
	movt	r4, #:upper16:.LANCHOR1
	ldr	r3, [r4, #4]
	mov	r0, r5
	blx	r3
	cmp	r0, #0
	beq	.L886
	ldr	r3, [r4, #2308]
	mov	r2, r5
	ldr	r1, [sp, #20]
	ldr	r0, [sp, #24]
	add	sp, sp, #44
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	ldr	lr, [sp, #32]
	add	sp, sp, #36
	bx	r3
.L975:
	cmp	r2, #8000
	beq	.L890
	cmp	r2, #16000
	moveq	r3, #1
	moveq	r9, #32
	streq	r3, [sp, #8]
	bne	.L887
.L891:
	ldr	r3, [sp, #24]
	ldr	r3, [r3, #48]
	cmp	r3, #0
	str	r3, [sp, #32]
	beq	.L897
	cmp	r3, #1
	bne	.L970
	ldr	r10, [sp, #16]
	ldr	r3, [r10, #4]
	cmp	r3, #6
	beq	.L899
	ldr	r5, [r10, #64]
	ldr	r0, [r5, #12]
	bl	dev_get_drvdata
	ldr	r3, [r10, #4]
	mov	r7, r0
	add	r2, r3, r3, lsl #2
	lsl	r2, r2, #3
	add	r1, r0, r2
	add	r2, r2, #48
	ldr	r1, [r1, #48]
	add	r2, r0, r2
	cmp	r2, r1
	sub	r4, r1, #16
	beq	.L899
	ldrh	r9, [r1, #-6]
	cmp	r9, #9
	add	r6, r9, #1
	bhi	.L900
	movw	r8, #931
	ldr	fp, [sp, #8]
	b	.L901
.L979:
	and	r0, r0, #15
	cmp	r0, #8
	sxtbeq	r1, r6
	beq	.L905
	sub	r3, r0, #1
	cmp	r3, #6
	bls	.L907
	sub	r3, r0, #8
	cmp	r3, #9
	bls	.L977
.L908:
	cmp	r0, #0
	bne	.L978
.L907:
	ldr	r3, [r10, #4]
	ldr	r1, [r4, #16]
	add	r2, r3, r3, lsl #2
	sub	r4, r1, #16
	add	r2, r7, r2, lsl #3
	add	r2, r2, #48
	cmp	r1, r2
	beq	.L899
	ldrh	r9, [r1, #-6]
	cmp	r9, #9
	add	r6, r9, #1
	bhi	.L900
.L901:
	add	r1, r9, r8
	mov	r0, r5
	uxth	r1, r1
	bl	snd_soc_read
	cmp	r9, #5
	uxtb	r0, r0
	bls	.L979
	and	r0, r0, #31
	sub	r3, r0, #8
	cmp	r3, #9
	subls	r1, r0, #7
	sxtbls	r1, r1
	bls	.L905
	sub	r3, r0, #1
	cmp	r3, #6
	bls	.L907
	b	.L908
.L890:
	mov	r9, #0
	str	r9, [sp, #8]
	b	.L891
.L892:
	mov	r3, #4
	mov	r9, #128
	str	r3, [sp, #8]
	b	.L891
.L893:
	mov	r3, #5
	mov	r9, #160
	str	r3, [sp, #8]
	b	.L891
.L905:
	lsl	r1, r1, #3
	mov	r3, fp
	mov	r2, #7
	add	r1, r1, #540
	mov	r0, r5
	uxth	r1, r1
	bl	snd_soc_update_bits
	b	.L907
.L899:
	ldr	r2, [sp, #28]
	ldrb	r2, [r2, #37]	@ zero_extendqisi2
	cmp	r2, #2
	beq	.L980
	ldr	r2, [sp, #20]
	mov	r1, #0
	add	r3, r3, #1
	add	r3, r3, r3, lsl #2
	str	r1, [sp, #32]
	ldr	r1, [sp, #28]
	ldr	r2, [r2, #296]
	str	r2, [r1, r3, lsl #3]
	b	.L895
.L897:
	ldr	r4, [sp, #16]
	ldr	r7, [r4, #64]
	ldr	r0, [r7, #12]
	bl	dev_get_drvdata
	ldr	r3, [r4, #4]
	mov	r10, r0
	add	r2, r3, r3, lsl #2
	lsl	r2, r2, #3
	add	r1, r0, r2
	add	r2, r2, #48
	ldr	r1, [r1, #48]
	add	r2, r0, r2
	cmp	r2, r1
	sub	r2, r1, #16
	str	r2, [sp, #12]
	beq	.L928
	ldrb	r2, [r1, #-6]	@ zero_extendqisi2
	sub	r1, r2, #16
	sub	r2, r2, #11
	cmp	r1, #6
	uxtb	r6, r2
	bhi	.L919
	ldr	fp, .L986+8
.L920:
	mov	r4, #0
	mov	r5, #896
	b	.L926
.L982:
	cmp	ip, r6
	beq	.L921
.L922:
	cmp	r4, #1
	add	r3, r5, #2
	add	r4, r4, #1
	addls	r5, r5, #3
	uxthls	r5, r5
	uxthhi	r5, r3
	cmp	r4, #7
	beq	.L981
.L926:
	mov	r1, r5
	mov	r0, r7
	bl	snd_soc_read
	uxtb	r8, r0
	add	r1, r5, #1
	uxth	r1, r1
	mov	r0, r7
	bl	snd_soc_read
	lsl	r1, r4, #3
	and	lr, r8, #15
	cmp	lr, r6
	mov	ip, r0
	add	r1, r1, #692
	mov	r0, r7
	mov	r3, r9
	mov	r2, #224
	uxth	r1, r1
	and	ip, ip, #15
	beq	.L921
	cmp	r6, r8, lsr #4
	bne	.L982
.L921:
	bl	snd_soc_update_bits
	ldr	r3, [fp, r4, lsl #2]
	cmp	r3, #2
	add	r2, r10, r3, lsl #2
	ldrle	r3, [sp, #8]
	strle	r3, [r2, #372]
	b	.L922
.L981:
	ldrd	r2, [sp, #12]
	ldr	r3, [r3, #4]
	ldr	r1, [r2, #16]
	add	r2, r3, r3, lsl #2
	sub	r0, r1, #16
	add	r2, r10, r2, lsl #3
	str	r0, [sp, #12]
	add	r2, r2, #48
	cmp	r1, r2
	beq	.L928
	ldrb	r6, [r1, #-6]	@ zero_extendqisi2
	sub	r2, r6, #16
	sub	r6, r6, #11
	cmp	r2, #6
	uxtb	r6, r6
	bls	.L920
.L919:
	movw	r0, #:lower16:.LC100
	ldr	r1, .L986+12
	sub	r2, r6, #5
	movt	r0, #:upper16:.LC100
	bl	printk
.L974:
	ldr	r3, .L986+4
	movw	r0, #:lower16:.LC98
	mvn	r2, #21
	movt	r0, #:upper16:.LC98
	sub	r1, r3, #12
	bl	printk
	mvn	r3, #21
	str	r3, [sp, #32]
	b	.L895
.L928:
	ldr	r3, [sp, #28]
	ldrb	r3, [r3, #37]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L983
	ldr	r2, [sp, #20]
	ldr	r3, [r2, #36]
	cmp	r3, #0
	bne	.L949
	ldr	r3, [r2, #40]
	cmp	r3, #0
	movne	r1, #32
	bne	.L929
.L930:
	movw	r0, #:lower16:.LC99
	movt	r0, #:upper16:.LC99
	bl	printk
.L933:
	mov	r2, #3
	movw	r1, #774
	ldr	r3, [sp, #8]
	ldr	r0, [sp, #36]
	bl	snd_soc_update_bits
	b	.L895
.L983:
	ldr	r3, [sp, #16]
	ldr	r5, [r3, #64]
	ldr	r0, [r5, #12]
	bl	dev_get_drvdata
	ldr	r2, [sp, #20]
	ldr	r3, [r2, #36]
	cmp	r3, #0
	bne	.L950
	ldr	r3, [r2, #40]
	cmp	r3, #0
	movne	r2, #32
	bne	.L934
.L935:
	movw	r1, #:lower16:.LC101
	ldr	r0, [r5, #12]
	movt	r1, #:upper16:.LC101
	bl	dev_err
	ldr	r3, [sp, #16]
	ldr	r3, [r3, #4]
.L939:
	ldr	r2, [sp, #20]
	add	r3, r3, #1
	ldr	r1, [sp, #28]
	add	r3, r3, r3, lsl #2
	ldr	r2, [r2, #296]
	str	r2, [r1, r3, lsl #3]
	b	.L895
.L980:
	ldr	r2, [sp, #20]
	ldr	r3, [r2, #36]
	cmp	r3, #0
	bne	.L948
	ldr	r3, [r2, #40]
	cmp	r3, #0
	movne	r1, #32
	bne	.L911
.L912:
	movw	r0, #:lower16:.LC99
	movt	r0, #:upper16:.LC99
	bl	printk
.L915:
	ldr	r3, [sp, #8]
	mov	r2, #7
	movw	r1, #775
	ldr	r0, [sp, #36]
	bl	snd_soc_update_bits
	mov	r3, #0
	str	r3, [sp, #32]
	b	.L895
.L888:
	mov	r3, #2
	mov	r9, #64
	str	r3, [sp, #8]
	b	.L891
.L976:
	mov	r3, #3
	mov	r9, #96
	str	r3, [sp, #8]
	b	.L891
.L886:
	ldr	r0, [sp, #32]
	add	sp, sp, #44
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L949:
	mov	r1, #0
.L929:
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
	cmp	r3, #2
	beq	.L931
	cmp	r3, #10
	bne	.L930
	mov	r3, #0
	mov	r2, #32
	ldr	r0, [sp, #36]
	movw	r1, #774
	bl	snd_soc_update_bits
	b	.L933
.L931:
	mov	r3, #32
	movw	r1, #774
	ldr	r0, [sp, #36]
	mov	r2, r3
	bl	snd_soc_update_bits
	b	.L933
.L950:
	mov	r2, #0
.L934:
	rsb	r6, r3, #0
	and	r6, r6, r3
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r6, r6
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r6, r6, #31
	add	r6, r6, r2
	cmp	r6, #2
	beq	.L936
	cmp	r6, #6
	bne	.L935
	ldr	r3, [sp, #16]
	mov	r2, #24
	mov	r6, #0
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	add	r3, r3, r3, lsl #2
	add	r3, r0, r3, lsl #3
	str	r2, [r3, #4]
.L938:
	ldr	r3, [sp, #16]
	ldr	r3, [r3, #4]
	add	r2, r3, r3, lsl #2
	lsl	r2, r2, #3
	add	r1, r0, r2
	add	r2, r2, #48
	ldr	r4, [r1, #48]
	add	r7, r0, r2
	cmp	r7, r4
	sub	r4, r4, #16
	beq	.L939
	mov	r8, #3
	b	.L940
.L985:
	lsl	lr, r2, #1
	cmp	ip, #6
	uxth	r2, r3
	uxth	lr, lr
	lsl	r3, r6, r2
	lsl	r2, r8, r2
	bhi	.L941
	cmp	ip, #3
	movwgt	r1, #943
	lslgt	r3, r6, lr
	lslgt	r2, r8, lr
	movgt	r0, r5
	bl	snd_soc_update_bits
	ldr	r4, [r4, #16]
	cmp	r7, r4
	sub	r4, r4, #16
	beq	.L984
.L940:
	ldr	r0, [r4, #4]
	bl	wcd9xxx_get_slave_port
	mov	r9, r0
	movw	r1, #942
	sub	ip, r9, #16
	cmn	r9, #4096
	uxth	r3, ip
	mov	r0, r5
	sub	r2, r3, #4
	lsl	r3, r3, #1
	bls	.L985
.L941:
	movw	r1, #:lower16:.LC102
	ldr	r2, .L986+16
	mov	r3, r9
	movt	r1, #:upper16:.LC102
	ldr	r0, [r5, #12]
	bl	dev_warn
	ldr	r3, [sp, #16]
	ldr	r3, [r3, #4]
	b	.L939
.L936:
	ldr	r3, [sp, #16]
	mov	r2, #16
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	add	r3, r3, r3, lsl #2
	add	r3, r0, r3, lsl #3
	str	r2, [r3, #4]
	b	.L938
.L984:
	ldr	r3, [sp, #16]
	ldr	r3, [r3, #4]
	b	.L939
.L948:
	mov	r1, #0
.L911:
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
	cmp	r3, #2
	beq	.L913
	cmp	r3, #10
	bne	.L912
	mov	r3, #0
	mov	r2, #32
	ldr	r0, [sp, #36]
	movw	r1, #775
	bl	snd_soc_update_bits
	b	.L915
.L913:
	mov	r3, #32
	movw	r1, #775
	ldr	r0, [sp, #36]
	mov	r2, r3
	bl	snd_soc_update_bits
	b	.L915
.L900:
	movw	r0, #:lower16:.LC93
	ldr	r1, .L986+20
	mov	r2, r6
	movt	r0, #:upper16:.LC93
	bl	printk
	b	.L974
.L970:
	ldr	r3, .L986+4
	movw	r0, #:lower16:.LC103
	ldr	r2, [sp, #32]
	movt	r0, #:upper16:.LC103
	sub	r1, r3, #12
	mvn	r3, #21
	str	r3, [sp, #32]
	bl	printk
	b	.L895
.L978:
	mov	r9, r0
	movw	r0, #:lower16:.LC96
	ldr	r1, .L986+20
	mov	r2, r6
	movt	r0, #:upper16:.LC96
	bl	printk
	movw	r0, #:lower16:.LC97
	mov	r2, r9
	ldr	r1, .L986+20
	movt	r0, #:upper16:.LC97
	bl	printk
	b	.L974
.L977:
	movw	r0, #:lower16:.LC94
	ldr	r1, .L986+20
	movt	r0, #:upper16:.LC94
	bl	printk
	movw	r0, #:lower16:.LC95
	mov	r2, r6
	ldr	r1, .L986+20
	movt	r0, #:upper16:.LC95
	bl	printk
	b	.L974
.L987:
	.align	2
.L986:
	.word	.LANCHOR4-2704
	.word	.LANCHOR4-2672
	.word	.LANCHOR4-2612
	.word	.LANCHOR4-2640
	.word	.LANCHOR4-2580
	.word	.LANCHOR4-2668
	.fnend
	.size	taiko_esxxx_hw_params, .-taiko_esxxx_hw_params
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_anc.constprop.15, %function
taiko_codec_enable_anc.constprop.15:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	strd	r6, [sp, #8]
	mov	r6, r1
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r5, [r0, #12]
	.pad #8
	sub	sp, sp, #8
	ldr	r0, [r5, #12]
	bl	dev_get_drvdata
	ldrb	r3, [r0, #36]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1018
	cmp	r6, #1
	beq	.L991
	cmp	r6, #4
	beq	.L992
.L1018:
	mov	r4, #0
.L988:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L992:
	mov	r4, #0
	mov	r0, #40
	bl	msleep
	mov	r3, r4
	mov	r2, #1
	mov	r1, #512
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r3, r4
	mov	r2, #2
	mov	r1, #640
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r0, #20
	bl	msleep
	mov	r2, #15
	mov	r1, #768
	mov	r0, r5
	bl	snd_soc_write
	mov	r2, r4
	movw	r1, #782
	mov	r0, r5
	bl	snd_soc_write
	mov	r0, r5
	mov	r2, #255
	mov	r1, #768
	bl	snd_soc_write
	b	.L988
.L991:
	mov	r4, r0
	mov	r1, #0
	ldr	r0, [r0, #1272]
	bl	wcdcal_get_fw_cal
	subs	r6, r0, #0
	beq	.L993
	ldr	r3, [r6]
	ldr	r1, [r6, #4]
.L994:
	cmp	r1, #15
	bls	.L1020
	ldr	lr, [r3, #12]
	sub	r2, r1, #16
	ldr	r4, [r4, #32]
	cmp	lr, r4
	bls	.L999
	cmp	lr, #0
	ble	.L1000
	cmp	r2, #3
	bls	.L1002
	ldr	ip, [r3, #16]
	sub	r1, r1, #20
	add	r3, r3, #20
	lsl	r2, ip, #2
	cmp	r2, r1
	bhi	.L1002
	cmp	r4, #0
	beq	.L1003
	mov	r0, #0
	b	.L1004
.L1007:
	cmp	ip, #3
	bls	.L1002
	ldr	ip, [r3], #4
	lsl	r2, ip, #2
	cmp	r1, r2
	bcc	.L1002
	cmp	r0, r4
	beq	.L1003
.L1004:
	add	r0, r0, #1
	sub	ip, r1, r2
	cmp	lr, r0
	sub	r1, ip, #4
	add	r3, r3, r2
	bne	.L1007
.L1012:
	movw	r1, #:lower16:.LC110
	ldr	r0, [r5, #12]
	mvn	r4, #21
	movt	r1, #:upper16:.LC110
	bl	dev_err
	b	.L998
.L1020:
	movw	r1, #:lower16:.LC107
	ldr	r0, [r5, #12]
	mov	r4, #0
	movt	r1, #:upper16:.LC107
	bl	dev_err
.L998:
	cmp	r6, #0
	bne	.L988
	ldr	r0, [sp, #4]
	bl	release_firmware
	b	.L988
.L1002:
	movw	r1, #:lower16:.LC109
	ldr	r0, [r5, #12]
	mvn	r4, #21
	movt	r1, #:upper16:.LC109
	bl	dev_err
	b	.L998
.L999:
	movw	r1, #:lower16:.LC108
	ldr	r0, [r5, #12]
	mvn	r4, #21
	movt	r1, #:upper16:.LC108
	bl	dev_err
	b	.L998
.L993:
	movw	r1, #:lower16:.LC104
	add	r0, sp, #4
	ldr	r2, [r5, #12]
	movt	r1, #:upper16:.LC104
	bl	request_firmware
	cmp	r0, #0
	bne	.L1021
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L1022
	ldm	r3, {r1, r3}
	b	.L994
.L1003:
	cmp	ip, #0
	movne	r4, r3
	addne	r7, r4, r2
	beq	.L1011
.L1008:
	ldr	r9, [r4], #4
	mov	r0, r5
	lsr	r10, r9, #16
	lsr	r8, r9, #8
	mov	r1, r10
	bl	snd_soc_read
	bic	r2, r0, r8
	and	r8, r8, r9
	orr	r2, r8, r2
	mov	r1, r10
	uxtb	r2, r2
	mov	r0, r5
	bl	snd_soc_write
	cmp	r7, r4
	bne	.L1008
.L1011:
	cmp	r6, #0
	bne	.L1018
	ldr	r0, [sp, #4]
	mov	r4, r6
	bl	release_firmware
	b	.L988
.L1000:
	bne	.L1011
	b	.L1012
.L1021:
	movw	r1, #:lower16:.LC105
	mov	r2, r0
	ldr	r0, [r5, #12]
	movt	r1, #:upper16:.LC105
	mvn	r4, #18
	bl	dev_err
	b	.L988
.L1022:
	movw	r1, #:lower16:.LC106
	ldr	r0, [r5, #12]
	mvn	r4, #18
	movt	r1, #:upper16:.LC106
	bl	dev_err
	b	.L988
	.fnend
	.size	taiko_codec_enable_anc.constprop.15, .-taiko_codec_enable_anc.constprop.15
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_adc, %function
taiko_codec_enable_adc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	mov	r6, r2
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r5, [r0, #12]
	ldr	r3, [r5, #12]
	ldr	r0, [r3]
	bl	dev_get_drvdata
	ldrb	r3, [r0, #60]	@ zero_extendqisi2
	cmp	r3, #1
	ldrsh	r3, [r4, #36]
	beq	.L1048
	sub	r3, r3, #336
	sub	r3, r3, #3
	cmp	r3, #22
	ldrls	pc, [pc, r3, asl #2]
	b	.L1028
.L1030:
	.word	.L1029
	.word	.L1028
	.word	.L1043
	.word	.L1028
	.word	.L1028
	.word	.L1028
	.word	.L1028
	.word	.L1028
	.word	.L1028
	.word	.L1028
	.word	.L1031
	.word	.L1028
	.word	.L1032
	.word	.L1028
	.word	.L1028
	.word	.L1028
	.word	.L1028
	.word	.L1028
	.word	.L1028
	.word	.L1028
	.word	.L1033
	.word	.L1028
	.word	.L1034
.L1048:
	movw	r2, #339
	cmp	r3, r2
	beq	.L1038
	movw	r2, #349
	cmp	r3, r2
	beq	.L1039
	movw	r2, #359
	cmp	r3, r2
	moveq	r7, #364
	bne	.L1028
.L1025:
	ldrb	r3, [r4, #38]	@ zero_extendqisi2
	cmp	r3, #3
	beq	.L1041
.L1052:
	cmp	r3, #7
	moveq	r4, #128
	bne	.L1049
.L1027:
	cmp	r6, #2
	beq	.L1035
.L1051:
	cmp	r6, #8
	beq	.L1036
	cmp	r6, #1
	beq	.L1050
.L1045:
	mov	r0, #0
.L1023:
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L1029:
	cmp	r6, #2
	mov	r4, #128
	mov	r7, #344
	bne	.L1051
.L1035:
	mov	r2, r4
	mov	r1, r7
	mov	r0, r5
	mov	r3, #0
	bl	snd_soc_update_bits
	mov	r0, #0
	b	.L1023
.L1031:
	mov	r4, #128
	movw	r7, #354
	b	.L1027
.L1032:
	mov	r4, #64
	movw	r7, #354
	b	.L1027
.L1033:
	mov	r4, #128
	mov	r7, #364
	b	.L1027
.L1034:
	mov	r4, #64
	mov	r7, #364
	b	.L1027
.L1043:
	mov	r4, #64
	mov	r7, #344
	b	.L1027
.L1039:
	movw	r7, #354
	b	.L1025
.L1050:
	ldr	r0, [r5, #12]
	bl	dev_get_drvdata
	mov	lr, r0
	mov	r3, #2
	ldr	ip, [lr, #4]
	mov	r2, r3
	mov	r1, #780
	mov	r0, r5
	add	ip, ip, #1
	str	ip, [lr, #4]
	bl	snd_soc_update_bits
	mov	r3, r4
	mov	r2, r4
	mov	r1, r7
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r0, #0
	b	.L1023
.L1036:
	ldr	r0, [r5, #12]
	bl	dev_get_drvdata
	ldr	r4, [r0, #4]
	sub	r4, r4, #1
	cmp	r4, #0
	str	r4, [r0, #4]
	bne	.L1045
	mov	r0, r5
	mov	r3, r4
	mov	r2, #2
	mov	r1, #780
	bl	snd_soc_update_bits
	mov	r0, r4
	b	.L1023
.L1038:
	ldrb	r3, [r4, #38]	@ zero_extendqisi2
	mov	r7, #344
	cmp	r3, #3
	bne	.L1052
.L1041:
	mov	r4, #64
	b	.L1027
.L1028:
	movw	r0, #:lower16:.LC111
	ldr	r1, .L1053
	movt	r0, #:upper16:.LC111
	bl	printk
	mvn	r0, #21
	b	.L1023
.L1049:
	movw	r0, #:lower16:.LC112
	ldr	r1, .L1053
	movt	r0, #:upper16:.LC112
	bl	printk
	mvn	r0, #21
	b	.L1023
.L1054:
	.align	2
.L1053:
	.word	.LANCHOR4-2552
	.fnend
	.size	taiko_codec_enable_adc, .-taiko_codec_enable_adc
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_setup_zdet, %function
taiko_setup_zdet:
	.fnstart
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, r1
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	str	r10, [sp, #24]
	mov	r10, r0
	str	lr, [sp, #28]
	ldr	r9, [r0, #324]
	.pad #112
	sub	sp, sp, #112
	ldr	r0, [r9, #12]
	bl	dev_get_drvdata
	cmp	r4, #1
	beq	.L1057
	mov	r6, r0
	bcc	.L1058
	cmp	r4, #2
	beq	.L1059
	mov	r0, #0
.L1055:
	add	sp, sp, #112
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L1059:
	mov	r2, #10
	movw	r1, #866
	mov	r0, r9
	bl	snd_soc_write
	movw	r1, #18100
	movw	r0, #18000
	bl	usleep_range
	mov	r2, #0
	movw	r1, #866
	mov	r0, r9
	bl	snd_soc_write
	mov	r2, #0
	movw	r1, #865
	mov	r0, r9
	bl	snd_soc_write
	ldr	r3, [r10, #332]
	cmp	r3, #0
	bne	.L1061
	ldr	r3, [r10, #336]
	tst	r3, #1
	bne	.L1061
	ldr	r4, [r10, #336]
	ubfx	r4, r4, #1, #1
	cmp	r4, #0
	beq	.L1066
.L1061:
	add	r1, r6, #1184
	mov	r0, r9
	add	r1, r1, #4
	bl	wcd9xxx_restore_registers
	mov	r0, #0
	b	.L1055
.L1058:
	add	r5, r0, #1184
	ldr	r1, .L1067
	add	r0, sp, #12
	add	r5, r5, #4
	mov	r2, #100
	mov	r4, r0
	add	r8, sp, #112
	str	r5, [r6, #1188]
	str	r5, [r6, #1192]
	mov	r6, #0
	ldr	r7, [r10, #324]
	bl	memcpy
.L1060:
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	str	r6, [sp, #4]
	mov	r1, r5
	ldrb	ip, [r4, #3]	@ zero_extendqisi2
	mov	r0, r7
	add	r4, r4, #4
	ldrh	r2, [r4, #-4]
	str	ip, [sp]
	bl	wcd9xxx_soc_update_bits_push
	cmp	r8, r4
	bne	.L1060
	ldr	r7, [r10, #324]
	movw	r1, #429
	mov	r0, r7
	bl	snd_soc_read
	rsb	r4, r0, r0, lsl #4
	mov	r3, #48
	mov	r2, r3
	lsl	r4, r4, #4
	movw	r1, #427
	mov	r0, r7
	bl	snd_soc_update_bits
	add	r1, r4, #100
	mov	r0, r4
	bl	usleep_range
	mov	r2, #28
	movw	r1, #865
	mov	r0, r9
	bl	snd_soc_write
	mov	r2, #31
	movw	r1, #865
	mov	r0, r9
	bl	snd_soc_write
	mov	r2, #3
	movw	r1, #865
	mov	r0, r9
	bl	snd_soc_write
	mov	r2, #54
	movw	r1, #867
	mov	r0, r9
	bl	snd_soc_write
	mov	r2, #192
	mov	r1, #868
	mov	r0, r9
	bl	snd_soc_write
	mov	r0, #192
	mov	r3, #255
	movw	r2, #334
	mov	r1, r5
	stm	sp, {r0, r6}
	mov	r0, r9
	bl	wcd9xxx_soc_update_bits_push
	cmp	r0, #0
	blt	.L1055
	mov	r0, #240
	mov	r3, #255
	movw	r2, #335
	mov	r1, r5
	stm	sp, {r0, r6}
	mov	r0, r9
	bl	wcd9xxx_soc_update_bits_push
	cmp	r0, #0
	blt	.L1055
	mov	r0, #120
	mov	r3, #255
	mov	r2, #372
	mov	r1, r5
	stm	sp, {r0, r6}
	mov	r0, r9
	bl	wcd9xxx_soc_update_bits_push
	cmp	r0, #0
	blt	.L1055
	mov	r0, #140
	mov	r3, #255
	movw	r2, #369
	mov	r1, r5
	stm	sp, {r0, r6}
	mov	r0, r9
	bl	wcd9xxx_soc_update_bits_push
	cmp	r0, #0
	blt	.L1055
	mov	r0, #64
	movw	r2, #966
	mov	r3, r0
	mov	r1, r5
	stm	sp, {r0, r6}
	mov	r0, r9
	bl	wcd9xxx_soc_update_bits_push
	cmp	r0, #0
	blt	.L1055
	mov	r0, #16
	mov	r3, #255
	movw	r2, #967
	mov	r1, r5
	stm	sp, {r0, r6}
	mov	r0, r9
	bl	wcd9xxx_soc_update_bits_push
	cmp	r0, #0
	blt	.L1055
	mov	r0, #10
	mov	r3, #255
	mov	r2, #988
	mov	r1, r5
	stm	sp, {r0, r6}
	mov	r0, r9
	bl	wcd9xxx_soc_update_bits_push
	cmp	r0, #0
	blt	.L1055
	mov	r2, #2
	mov	r1, #960
	mov	r0, r9
	bl	snd_soc_write
	mov	r0, #2
	mov	r3, #255
	mov	r2, #988
	mov	r1, r5
	stm	sp, {r0, r6}
	mov	r0, r9
	bl	wcd9xxx_soc_update_bits_push
	cmp	r0, #0
	blt	.L1055
	mov	r2, #128
	mov	r1, r5
	mov	r0, r9
	mov	r3, #179
	stm	sp, {r2, r6}
	movw	r2, #510
	bl	wcd9xxx_soc_update_bits_push
	b	.L1055
.L1057:
	mov	r2, #5
	movw	r1, #866
	mov	r0, r9
	bl	snd_soc_write
	movw	r1, #18100
	movw	r0, #18000
	bl	usleep_range
	mov	r2, #0
	movw	r1, #866
	mov	r0, r9
	bl	snd_soc_write
	movw	r0, #18000
	movw	r1, #18100
	bl	usleep_range
	mov	r0, #0
	b	.L1055
.L1066:
	ldr	r5, [r10, #324]
	movw	r1, #429
	mov	r0, r5
	bl	snd_soc_read
	rsb	r2, r0, r0, lsl #4
	mov	r3, r4
	mov	r0, r5
	lsl	r4, r2, #4
	movw	r1, #427
	mov	r2, #48
	bl	snd_soc_update_bits
	add	r1, r4, #100
	mov	r0, r4
	bl	usleep_range
	b	.L1061
.L1068:
	.align	2
.L1067:
	.word	.LANCHOR4-2528
	.fnend
	.size	taiko_setup_zdet, .-taiko_setup_zdet
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_config_compander, %function
taiko_config_compander:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	strd	r6, [sp, #8]
	mov	r7, r2
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r4, [r0, #12]
	.pad #4
	sub	sp, sp, #4
	ldr	r0, [r4, #12]
	bl	dev_get_drvdata
	ldrb	r6, [r5, #38]	@ zero_extendqisi2
	add	r1, r0, r6, lsl #2
	ldr	r3, [r1, #360]
	cmp	r3, #0
	beq	.L1098
	cmp	r6, #0
	ldr	r0, [r4, #12]
	movne	r8, #3
	moveq	r8, #2
	ldr	r10, [r1, #372]
	movne	r9, r8
	moveq	r9, #1
	bl	dev_get_drvdata
	ldr	r5, [r0, #456]
	movw	r1, #:lower16:.LC80
	mov	r2, #13
	movt	r1, #:upper16:.LC80
	ldr	r0, [r5, #520]
	bl	strncmp
	cmp	r0, #0
	beq	.L1072
	movw	r1, #:lower16:.LC80
	mov	r2, #13
	ldr	r0, [r5, #544]
	movt	r1, #:upper16:.LC80
	bl	strncmp
	cmp	r0, #0
	beq	.L1080
	movw	r1, #:lower16:.LC80
	mov	r2, #13
	ldr	r0, [r5, #568]
	movt	r1, #:upper16:.LC80
	bl	strncmp
	cmp	r0, #0
	beq	.L1081
	movw	r1, #:lower16:.LC80
	mov	r2, #13
	ldr	r0, [r5, #592]
	movt	r1, #:upper16:.LC80
	bl	strncmp
	cmp	r0, #0
	beq	.L1082
	movw	r1, #:lower16:.LC80
	mov	r2, #13
	ldr	r0, [r5, #616]
	movt	r1, #:upper16:.LC80
	bl	strncmp
	cmp	r0, #0
	beq	.L1083
	movw	r1, #:lower16:.LC80
	mov	r2, #13
	ldr	r0, [r5, #640]
	movt	r1, #:upper16:.LC80
	bl	strncmp
	cmp	r0, #0
	beq	.L1084
	movw	r1, #:lower16:.LC80
	mov	r2, #13
	ldr	r0, [r5, #664]
	movt	r1, #:upper16:.LC80
	bl	strncmp
	cmp	r0, #0
	beq	.L1085
	movw	r1, #:lower16:.LC80
	mov	r2, #13
	ldr	r0, [r5, #688]
	movt	r1, #:upper16:.LC80
	bl	strncmp
	cmp	r0, #0
	moveq	r0, #7
	beq	.L1072
.L1073:
	cmp	r7, #1
	beq	.L1078
.L1106:
	cmp	r7, #4
	bne	.L1098
	add	r1, r6, #109
	mov	r2, r8
	lsl	r1, r1, #3
	mov	r3, #0
	mov	r0, r4
	bl	snd_soc_update_bits
	movw	r3, #:lower16:.LANCHOR4
	movw	r1, #777
	movt	r3, #:upper16:.LANCHOR4
	mov	r0, r4
	add	r3, r3, r6, lsl #2
	ldr	r3, [r3, #-2428]
	lsl	r9, r9, r3
	mov	r3, r9
	mov	r2, r9
	bl	snd_soc_update_bits
	mov	r2, r9
	mov	r3, #0
	movw	r1, #777
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r2, r9
	mov	r1, #784
	mov	r3, #0
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r1, r6
	mov	r0, r4
	mov	r2, #0
	bl	taiko_config_gain_compander
.L1098:
	mov	r0, #0
	add	sp, sp, #4
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1085:
	mov	r0, #6
.L1072:
	add	r0, r0, r0, lsl #1
	movw	r3, #30528
	movw	r1, #52848
	add	r5, r5, r0, lsl #3
	movt	r3, 27
	movt	r1, 32
	ldr	r2, [r5, #524]
	sub	fp, r2, r3
	cmp	r2, r3
	cmpne	r2, r1
	clz	fp, fp
	lsr	fp, fp, #5
	bne	.L1073
	cmp	r7, #1
	bne	.L1106
	lsl	r5, r6, #3
	mov	r3, r10
	mov	r2, #7
	add	r1, r5, #876
	mov	r0, r4
	add	r1, r1, #3
	cmp	r6, #1
	movne	fp, #0
	andeq	fp, fp, #1
	bl	snd_soc_update_bits
	add	r3, r5, #872
	cmp	fp, #0
	add	r3, r3, #3
	uxth	r1, r3
	beq	.L1076
	mov	r3, #128
	mov	r2, r3
	mov	r0, r4
	bl	snd_soc_update_bits
.L1077:
	movw	r7, #:lower16:.LANCHOR4
	mov	r1, #784
	movt	r7, #:upper16:.LANCHOR4
	mov	r0, r4
	add	r3, r7, r6, lsl #2
	add	r5, r5, #872
	add	r5, r5, #1
	ldr	r3, [r3, #-2428]
	add	r10, r10, r10, lsl #1
	add	r7, r7, r10, lsl #2
	lsl	r9, r9, r3
	mov	r3, r9
	mov	r2, r9
	bl	snd_soc_update_bits
	mov	r3, r9
	mov	r2, r9
	movw	r1, #777
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r2, r9
	mov	r3, #0
	movw	r1, #777
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r1, r6
	mov	r2, #1
	mov	r0, r4
	bl	taiko_config_gain_compander
	add	r1, r6, #109
	mov	r3, r8
	mov	r2, r8
	lsl	r1, r1, #3
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r1, r5
	mov	r3, #80
	mov	r2, #240
	mov	r0, r4
	bl	snd_soc_update_bits
	movw	r3, #874
	mov	r2, #1
	add	r6, r3, r6, lsl #3
	mov	r0, r4
	mov	r1, r6
	bl	snd_soc_write
	movw	r1, #3000
	mov	r0, r1
	bl	usleep_range
	mov	r1, r6
	ldr	r2, [r7, #-2408]
	mov	r0, r4
	bl	snd_soc_write
	ldr	r3, [r7, #-2412]
	mov	r1, r5
	mov	r2, #240
	mov	r0, r4
	lsl	r3, r3, #4
	bl	snd_soc_update_bits
	mov	r1, r5
	mov	r0, r4
	ldr	r3, [r7, #-2416]
	mov	r2, #15
	bl	snd_soc_update_bits
	b	.L1098
.L1078:
	lsl	r5, r6, #3
	mov	r3, r10
	mov	r2, #7
	add	r1, r5, #876
	mov	r0, r4
	add	r1, r1, #3
	bl	snd_soc_update_bits
	add	r3, r5, #872
	add	r3, r3, #3
.L1076:
	mov	r1, r3
	mov	r2, #128
	mov	r3, #0
	mov	r0, r4
	bl	snd_soc_update_bits
	b	.L1077
.L1080:
	mov	r0, #1
	b	.L1072
.L1081:
	mov	r0, #2
	b	.L1072
.L1082:
	mov	r0, #3
	b	.L1072
.L1083:
	mov	r0, #4
	b	.L1072
.L1084:
	mov	r0, #5
	b	.L1072
	.fnend
	.size	taiko_config_compander, .-taiko_config_compander
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_post_reset_cb, %function
taiko_post_reset_cb:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	mov	r9, r0
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r5, [r0, #84]
	.pad #36
	sub	sp, sp, #36
	ldr	r0, [r5, #12]
	add	r8, r5, #20
	bl	dev_get_drvdata
	mov	r7, r0
	mov	r1, #1
	ldr	r0, [r5, #44]
	bl	snd_soc_card_change_online_state
	mov	r0, r8
	bl	mutex_lock
	ldr	r3, [r5, #140]
	cmp	r3, #0
	beq	.L1108
	ldr	r0, [r5, #136]
	bl	kfree
	mov	r2, #208
	ldr	r1, [r5, #72]
	ldr	r0, [r5, #140]
	bl	kmemdup
	cmp	r0, #0
	str	r0, [r5, #136]
	beq	.L1128
.L1108:
	mov	r0, r5
	bl	taiko_update_reg_defaults
	ldr	r2, [r9, #376]
	mov	r3, #32768
	movt	r3, 187
	cmp	r2, r3
	beq	.L1129
	mov	r3, #31744
	movt	r3, 146
	cmp	r2, r3
	beq	.L1130
.L1111:
	ldr	r4, .L1136
	add	r6, r4, #176
.L1112:
	ldrb	r3, [r4, #3]	@ zero_extendqisi2
	mov	r0, r5
	ldrb	r2, [r4, #2]	@ zero_extendqisi2
	ldrh	r1, [r4], #4
	bl	snd_soc_update_bits
	cmp	r4, r6
	bne	.L1112
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L1131
.L1113:
	mov	r3, #1
	mov	r0, r5
	str	r3, [r5, #104]
	bl	snd_soc_cache_sync
	mov	r3, #0
	mov	r0, r7
	str	r3, [r5, #104]
	bl	taiko_handle_pdata
	cmn	r0, #4096
	bhi	.L1132
.L1114:
	ldr	r0, [r5, #12]
	mov	r6, #0
	mov	r4, #1
	bl	dev_get_drvdata
	ldr	r1, [r5, #108]
	mov	ip, #1048576
	strb	r4, [r0, #397]
	strb	r6, [r0, #398]
	add	r3, sp, #32
	mov	r10, #0
	strb	r6, [r0, #399]
	mov	fp, #0
	mov	r2, #255
	strb	r6, [r0, #400]
	str	ip, [r0, #409]	@ unaligned
	ldr	ip, [r1, #4]
	mov	r1, #48
	strd	r10, [r3, #-8]!
	add	r10, r7, #416
	ldr	lr, [ip, #356]!	@ unaligned
	ldrh	ip, [ip, #4]	@ unaligned
	str	lr, [sp, #24]
	str	lr, [r0, #401]	@ unaligned
	strh	ip, [r3, #4]	@ movhi
	ldr	r3, [sp, #28]
	str	r3, [r0, #405]	@ unaligned
	ldr	r0, [r5, #108]
	bl	wcd9xxx_interface_reg_write
	mov	r2, #255
	mov	r1, #49
	ldr	r0, [r5, #108]
	bl	wcd9xxx_interface_reg_write
	mov	r2, #255
	mov	r1, #50
	ldr	r0, [r5, #108]
	bl	wcd9xxx_interface_reg_write
	mov	r0, r10
	bl	wcd9xxx_resmgr_post_ssr
	ldrb	r3, [r7, #396]	@ zero_extendqisi2
	cmp	r3, r6
	bne	.L1133
.L1116:
	mov	r0, r5
	mov	r1, #0
	ldr	r3, [r7, #1184]
	blx	r3
	ldr	r3, [r7]
	mov	r2, r7
	mov	r1, #0
	ldr	r0, [r3, #108]
	add	r0, r0, #100
	bl	wcd9xxx_free_irq
	ldr	r4, [r7]
	movw	r3, #:lower16:.LC86
	movw	r2, #:lower16:taiko_slimbus_irq
	movt	r3, #:upper16:.LC86
	movt	r2, #:upper16:taiko_slimbus_irq
	mov	r1, #0
	ldr	r0, [r4, #108]
	str	r7, [sp]
	add	r0, r0, #100
	bl	wcd9xxx_request_irq
	subs	r5, r0, #0
	bne	.L1134
	mov	r2, #255
	mov	r1, #48
	ldr	r0, [r4, #108]
	bl	wcd9xxx_interface_reg_write
	mov	r2, #255
	mov	r1, #49
	ldr	r0, [r4, #108]
	bl	wcd9xxx_interface_reg_write
	mov	r2, #255
	mov	r1, #50
	ldr	r0, [r4, #108]
	bl	wcd9xxx_interface_reg_write
.L1121:
	mov	r3, #1
	mov	r0, r8
	strb	r3, [r7, #76]
	strb	r3, [r7, #116]
	strb	r3, [r7, #156]
	strb	r3, [r7, #196]
	strb	r3, [r7, #236]
	strb	r3, [r7, #276]
	strb	r3, [r7, #316]
	strb	r3, [r7, #356]
	bl	mutex_unlock
.L1107:
	mov	r0, r5
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1133:
	add	r2, r7, #580
	ldr	fp, .L1136+4
	mov	r0, r2
	str	r2, [sp, #20]
	bl	wcd9xxx_mbhc_deinit
	strb	r6, [r7, #396]
	ldrb	lr, [r9, #60]	@ zero_extendqisi2
	mov	r3, #32768
	ldr	r2, [sp, #20]
	movt	r3, 187
	mov	ip, #31744
	movt	ip, 146
	mov	r1, r10
	str	r6, [sp, #12]
	cmp	lr, r4
	moveq	ip, r3
	mov	r0, r2
	add	r2, fp, #36
	movw	r3, #:lower16:taiko_enable_mbhc_micbias
	movt	r3, #:upper16:taiko_enable_mbhc_micbias
	stm	sp, {r2, fp, ip}
	mov	r2, r5
	bl	wcd9xxx_mbhc_init
	subs	r2, r0, #0
	bne	.L1135
	ldr	r9, [r7, #644]
	ldr	r0, [r5, #12]
	bl	dev_get_drvdata
	mov	r6, r0
	add	r0, r0, #580
	mov	r1, r9
	bl	wcd9xxx_mbhc_start
	cmp	r0, #0
	strbeq	r4, [r6, #396]
	b	.L1116
.L1131:
	mov	r3, #128
	movw	r1, #479
	mov	r2, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L1113
.L1129:
	mov	r3, #0
	mov	r2, #6
	mov	r1, r3
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L1111
.L1130:
	mov	r3, #2
	mov	r2, #6
	mov	r1, #0
	mov	r0, r5
	bl	snd_soc_update_bits
	b	.L1111
.L1132:
	movw	r0, #:lower16:.LC83
	ldr	r1, .L1136+8
	movt	r0, #:upper16:.LC83
	bl	printk
	b	.L1114
.L1128:
	movw	r0, #:lower16:.LC113
	ldr	r1, .L1136+8
	mvn	r5, #11
	movt	r0, #:upper16:.LC113
	bl	printk
	mov	r0, r8
	bl	mutex_unlock
	b	.L1107
.L1134:
	ldr	r4, .L1136+12
	movw	r0, #:lower16:.LC87
	mov	r2, #0
	movt	r0, #:upper16:.LC87
	sub	r1, r4, #8
	bl	printk
	movw	r0, #:lower16:.LC115
	mov	r2, r5
	add	r1, r4, #408
	movt	r0, #:upper16:.LC115
	bl	printk
	b	.L1121
.L1135:
	movw	r0, #:lower16:.LC114
	sub	r1, fp, #20
	movt	r0, #:upper16:.LC114
	bl	printk
	b	.L1116
.L1137:
	.align	2
.L1136:
	.word	.LANCHOR2+1048
	.word	.LANCHOR4-2324
	.word	.LANCHOR4-2344
	.word	.LANCHOR4-2752
	.fnend
	.size	taiko_post_reset_cb, .-taiko_post_reset_cb
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_esxxx_set_channel_map, %function
taiko_esxxx_set_channel_map:
	.fnstart
	@ args = 4, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	movw	r5, #:lower16:.LANCHOR1
	strd	r6, [sp, #8]
	mov	r7, r1
	mov	r6, r3
	strd	r8, [sp, #16]
	ldr	r1, .L1170
	movt	r5, #:upper16:.LANCHOR1
	strd	r10, [sp, #24]
	mov	r9, r2
	str	lr, [sp, #32]
	ldr	ip, [r0]
	.pad #60
	sub	sp, sp, #60
	ldr	r3, [r0, #4]
	movw	r0, #:lower16:.LC116
	movt	r0, #:upper16:.LC116
	str	r7, [sp]
	ldr	r8, [sp, #96]
	str	r6, [sp, #4]
	mov	r2, ip
	bl	printk
	ldr	r3, [r5, #4]
	mov	r0, r4
	blx	r3
	ldr	r3, [r4, #64]
	subs	r10, r0, #0
	ldr	r0, [r3, #12]
	bne	.L1166
	bl	dev_get_drvdata
	ldr	r3, [r4, #64]
	mov	r5, r0
	ldr	r3, [r3, #12]
	ldr	r0, [r3]
	bl	dev_get_drvdata
	cmp	r9, #0
	cmpeq	r8, #0
	mov	r4, r0
	beq	.L1167
	ldrb	r3, [r5, #37]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1168
.L1138:
	mov	r0, r10
	add	sp, sp, #60
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1166:
	bl	dev_get_drvdata
	ldr	r2, [r4, #4]
	cmp	r2, #7
	bhi	.L1140
	mov	r3, #1
	lsl	r3, r3, r2
	tst	r3, #234
	bne	.L1141
	tst	r3, #21
	beq	.L1140
	add	r2, r2, r2, lsl #2
	lsl	r2, r2, #3
	add	r3, r0, r2
	add	r2, r2, #48
	ldr	r3, [r3, #48]
	add	r0, r0, r2
	cmp	r0, r3
	sub	r3, r3, #16
	beq	.L1143
	add	r2, sp, #32
.L1144:
	ldr	r1, [r3, #4]
	str	r1, [r2], #4
	ldr	r3, [r3, #16]
	cmp	r0, r3
	sub	r3, r3, #16
	bne	.L1144
.L1143:
	ldr	r3, [r4, #64]
	ldr	r0, [r3, #12]
	bl	dev_get_drvdata
	ldr	r3, [r4, #64]
	mov	r10, r0
	ldr	r3, [r3, #12]
	ldr	r0, [r3]
	bl	dev_get_drvdata
	ldrb	r3, [r10, #37]	@ zero_extendqisi2
	mov	fp, r0
	cmp	r3, #1
	beq	.L1169
.L1148:
	str	r8, [sp]
	mov	r3, r6
	mov	r2, r9
	mov	r1, r7
	mov	r0, r4
	ldr	r5, [r5, #2312]
	blx	r5
	mov	r10, r0
	b	.L1138
.L1141:
	add	r2, r2, r2, lsl #2
	lsl	r2, r2, #3
	add	r3, r0, r2
	add	r2, r2, #48
	ldr	r3, [r3, #48]
	add	r2, r0, r2
	cmp	r2, r3
	sub	r3, r3, #16
	beq	.L1143
	add	r1, sp, #8
.L1146:
	ldr	r0, [r3, #4]
	str	r0, [r1], #4
	ldr	r3, [r3, #16]
	cmp	r2, r3
	sub	r3, r3, #16
	bne	.L1146
	b	.L1143
.L1168:
	ldr	r1, [r0, #4]
	mov	r3, r9
	mov	r2, r7
	ldrb	r1, [r1, #372]	@ zero_extendqisi2
	stm	sp, {r6, r8}
	bl	wcd9xxx_init_slimslave
	cmn	r5, #280
	beq	.L1138
	ldr	r3, [r4, #372]
	add	r0, r5, #288
	ldr	r2, [r5, #292]
	add	r1, r3, #256
	str	r1, [r5, #292]
	str	r0, [r3, #256]
	str	r2, [r3, #260]
	str	r1, [r2]
	ldr	r3, [r4, #372]
	ldr	r2, [r5, #292]
	add	r1, r3, #280
	str	r1, [r5, #292]
	str	r0, [r3, #280]
	str	r2, [r3, #284]
	str	r1, [r2]
	b	.L1138
.L1169:
	ldr	r1, [r0, #4]
	add	ip, sp, #32
	add	r3, sp, #8
	mov	r2, r7
	ldrb	r1, [r1, #372]	@ zero_extendqisi2
	stm	sp, {r6, ip}
	bl	wcd9xxx_init_slimslave
	cmn	r10, #280
	beq	.L1148
	ldr	r3, [fp, #372]
	add	r0, r10, #288
	ldr	r2, [r10, #292]
	add	r1, r3, #256
	str	r1, [r10, #292]
	str	r0, [r3, #256]
	str	r2, [r3, #260]
	str	r1, [r2]
	ldr	r2, [r10, #292]
	ldr	r3, [fp, #372]
	add	r1, r3, #280
	str	r1, [r10, #292]
	str	r0, [r3, #280]
	str	r2, [r3, #284]
	str	r1, [r2]
	b	.L1148
.L1140:
	movw	r0, #:lower16:.LC4
	ldr	r1, .L1170+4
	movt	r0, #:upper16:.LC4
	bl	printk
	b	.L1143
.L1167:
	movw	r0, #:lower16:.LC117
	ldr	r1, .L1170+8
	mvn	r10, #21
	movt	r0, #:upper16:.LC117
	bl	printk
	b	.L1138
.L1171:
	.align	2
.L1170:
	.word	.LANCHOR4-2232
	.word	.LANCHOR2+28
	.word	.LANCHOR4-2204
	.fnend
	.size	taiko_esxxx_set_channel_map, .-taiko_esxxx_set_channel_map
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_put_iir_band_audio_mixer, %function
taiko_put_iir_band_audio_mixer:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	mov	r8, r1
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r3, [r0, #92]
	ldr	r4, [r0, #96]
	ldr	r7, [r3, #16]
	ldr	r6, [r3, #24]
	mov	r0, r4
	lsl	r5, r7, #4
	add	r2, r6, r6, lsl #2
	add	r1, r5, #840
	lsl	r2, r2, #2
	add	r1, r1, #2
	add	r5, r5, #840
	and	r2, r2, #124
	add	r5, r5, #3
	bl	snd_soc_write
	ldr	r9, [r8, #72]
	mov	r1, r5
	mov	r0, r4
	uxtb	r2, r9
	bl	snd_soc_write
	mov	r1, r5
	ubfx	r2, r9, #8, #8
	mov	r0, r4
	bl	snd_soc_write
	mov	r1, r5
	ubfx	r2, r9, #16, #8
	mov	r0, r4
	bl	snd_soc_write
	ubfx	r2, r9, #24, #6
	mov	r1, r5
	mov	r0, r4
	bl	snd_soc_write
	ldr	r9, [r8, #76]
	mov	r1, r5
	mov	r0, r4
	uxtb	r2, r9
	bl	snd_soc_write
	mov	r1, r5
	ubfx	r2, r9, #8, #8
	mov	r0, r4
	bl	snd_soc_write
	mov	r1, r5
	ubfx	r2, r9, #16, #8
	mov	r0, r4
	bl	snd_soc_write
	ubfx	r2, r9, #24, #6
	mov	r1, r5
	mov	r0, r4
	bl	snd_soc_write
	ldr	r9, [r8, #80]
	mov	r1, r5
	mov	r0, r4
	uxtb	r2, r9
	bl	snd_soc_write
	mov	r1, r5
	ubfx	r2, r9, #8, #8
	mov	r0, r4
	bl	snd_soc_write
	mov	r1, r5
	ubfx	r2, r9, #16, #8
	mov	r0, r4
	bl	snd_soc_write
	ubfx	r2, r9, #24, #6
	mov	r1, r5
	mov	r0, r4
	bl	snd_soc_write
	ldr	r9, [r8, #84]
	mov	r1, r5
	mov	r0, r4
	uxtb	r2, r9
	bl	snd_soc_write
	mov	r1, r5
	ubfx	r2, r9, #8, #8
	mov	r0, r4
	bl	snd_soc_write
	mov	r1, r5
	ubfx	r2, r9, #16, #8
	mov	r0, r4
	bl	snd_soc_write
	ubfx	r2, r9, #24, #6
	mov	r1, r5
	mov	r0, r4
	bl	snd_soc_write
	ldr	r8, [r8, #88]
	mov	r1, r5
	mov	r0, r4
	uxtb	r2, r8
	bl	snd_soc_write
	mov	r1, r5
	ubfx	r2, r8, #8, #8
	mov	r0, r4
	bl	snd_soc_write
	mov	r1, r5
	ubfx	r2, r8, #16, #8
	mov	r0, r4
	bl	snd_soc_write
	mov	r1, r5
	ubfx	r2, r8, #24, #6
	mov	r0, r4
	bl	snd_soc_write
	mov	r2, r6
	mov	r1, r7
	mov	r0, r4
	mov	r3, #0
	bl	get_iir_band_coeff
	mov	r2, r6
	mov	r1, r7
	mov	r0, r4
	mov	r3, #1
	bl	get_iir_band_coeff
	mov	r2, r6
	mov	r1, r7
	mov	r0, r4
	mov	r3, #2
	bl	get_iir_band_coeff
	mov	r2, r6
	mov	r1, r7
	mov	r0, r4
	mov	r3, #3
	bl	get_iir_band_coeff
	mov	r2, r6
	mov	r1, r7
	mov	r0, r4
	mov	r3, #4
	bl	get_iir_band_coeff
	ldrd	r4, [sp]
	mov	r0, #0
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
	.fnend
	.size	taiko_put_iir_band_audio_mixer, .-taiko_put_iir_band_audio_mixer
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_ldo_h, %function
taiko_codec_enable_ldo_h:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r2
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r6, [r0, #12]
	ldr	r0, [r6, #12]
	bl	dev_get_drvdata
	cmp	r5, #1
	mov	r4, r0
	beq	.L1176
	cmp	r5, #8
	bne	.L1175
	ldr	r5, [r0, #24]
	sub	r5, r5, #1
	cmp	r5, #0
	str	r5, [r0, #24]
	beq	.L1182
.L1179:
	cmp	r5, #0
	blt	.L1183
.L1175:
	ldrd	r4, [sp]
	mov	r0, #0
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L1176:
	ldr	r5, [r0, #24]
	add	r5, r5, #1
	cmp	r5, #1
	str	r5, [r0, #24]
	bne	.L1175
	add	r7, r0, #552
	add	r4, r0, #416
	mov	r0, r7
	bl	mutex_lock
	mov	r1, r5
	mov	r0, r4
	bl	wcd9xxx_resmgr_get_bandgap
	mov	r1, r5
	mov	r0, r4
	bl	wcd9xxx_resmgr_get_clk_block
	mov	r3, #128
	mov	r0, r6
	mov	r2, r3
	mov	r1, #272
	bl	snd_soc_update_bits
	mov	r1, r5
	mov	r0, r4
	bl	wcd9xxx_resmgr_put_clk_block
	mov	r0, r7
	bl	mutex_unlock
	mov	r1, #1000
	mov	r0, r1
	bl	usleep_range
	b	.L1175
.L1182:
	add	r8, r0, #552
	add	r7, r0, #416
	mov	r0, r8
	bl	mutex_lock
	mov	r0, r7
	mov	r1, #1
	bl	wcd9xxx_resmgr_get_clk_block
	mov	r3, r5
	mov	r2, #128
	mov	r1, #272
	mov	r0, r6
	bl	snd_soc_update_bits
	mov	r0, r7
	mov	r1, #1
	bl	wcd9xxx_resmgr_put_clk_block
	mov	r0, r7
	mov	r1, #1
	bl	wcd9xxx_resmgr_put_bandgap
	mov	r0, r8
	bl	mutex_unlock
	ldr	r5, [r4, #24]
	b	.L1179
.L1183:
	movw	r2, #:lower16:.LC26
	movw	r0, #:lower16:.LC27
	mov	r3, r5
	movt	r2, #:upper16:.LC26
	movt	r0, #:upper16:.LC27
	movw	r1, #3283
	bl	warn_slowpath_fmt
	b	.L1175
	.fnend
	.size	taiko_codec_enable_ldo_h, .-taiko_codec_enable_ldo_h
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_anc_ear, %function
taiko_codec_enable_anc_ear:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	r2, r2, #1
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	mov	r4, r0
	str	lr, [sp, #8]
	.pad #12
	sub	sp, sp, #12
	ldr	r5, [r0, #12]
	cmp	r2, #7
	ldrls	pc, [pc, r2, asl #2]
	b	.L1191
.L1187:
	.word	.L1186
	.word	.L1188
	.word	.L1191
	.word	.L1189
	.word	.L1191
	.word	.L1191
	.word	.L1191
	.word	.L1190
.L1190:
	ldr	r0, [r5, #12]
	mov	r4, #0
	bl	dev_get_drvdata
	mov	r3, #2
	add	r1, r0, #1136
	add	r1, r1, #12
	mov	r0, r5
	str	r3, [sp]
	mov	r3, r4
.L1193:
	mov	r2, #1
	bl	wcd9xxx_clsh_fsm
	movw	r1, #5000
	mov	r0, r1
	bl	usleep_range
.L1184:
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L1189:
	mov	r3, #0
	mov	r2, #16
	mov	r1, #444
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r0, #40
	bl	msleep
	mov	r0, r4
	mov	r1, #4
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldr	lr, [sp, #8]
	add	sp, sp, #12
	b	taiko_codec_enable_anc.constprop.15
.L1188:
	ldr	r0, [r5, #12]
	mov	r4, #0
	bl	dev_get_drvdata
	mov	r2, #2
	add	r1, r0, #1136
	mov	r3, #1
	add	r1, r1, #12
	mov	r0, r5
	str	r2, [sp]
	b	.L1193
.L1186:
	mov	r1, #1
	bl	taiko_codec_enable_anc.constprop.15
	mov	r4, r0
	mov	r0, #50
	bl	msleep
	mov	r3, #16
	mov	r0, r5
	mov	r2, r3
	mov	r1, #444
	bl	snd_soc_update_bits
	b	.L1184
.L1191:
	mov	r4, #0
	b	.L1184
	.fnend
	.size	taiko_codec_enable_anc_ear, .-taiko_codec_enable_anc_ear
	.align	2
	.global	taiko_write
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_write, %function
taiko_write:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmn	r1, #1
	beq	.L1195
	cmp	r1, #1024
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	bcs	.L1213
	mov	r4, r1
	mov	r5, r0
	mov	r1, r2
	mov	r0, r4
	ldr	r7, [r5, #108]
	bl	boeffla_sound_hook_taiko_write
	sub	r3, r4, #256
	mov	r6, r0
	cmp	r3, #704
	bcs	.L1198
	sub	r3, r4, #840
	sub	r3, r3, #2
	cmp	r3, #17
	bls	.L1198
	bic	r3, r4, #128
	sub	r3, r3, #512
	sub	r3, r3, #2
	cmp	r3, #5
	bls	.L1198
	movw	r3, #609
	cmp	r4, r3
	beq	.L1198
	bhi	.L1201
	movw	r3, #569
	cmp	r4, r3
	beq	.L1198
	bls	.L1214
	movw	r3, #585
	cmp	r4, r3
	beq	.L1198
	bls	.L1215
	movw	r3, #593
	cmp	r4, r3
	beq	.L1198
	movw	r3, #601
	cmp	r4, r3
	beq	.L1198
.L1200:
	movw	r3, #331
	sub	r2, r4, #424
	movw	r1, #441
	sub	r2, r2, #3
	cmp	r4, r1
	cmpne	r4, r3
	moveq	r3, #1
	movne	r3, #0
	bics	r2, r2, #8
	moveq	r3, #1
	cmp	r3, #0
	bne	.L1198
	cmp	r4, #624
	bcc	.L1206
	cmp	r4, #632
	bcc	.L1198
	movw	r3, #763
	cmp	r4, r3
	beq	.L1198
.L1206:
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r2, [r3, #144]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1198
	ldr	r2, [r3, #164]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1198
	ldr	r2, [r3, #184]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1198
	ldr	r2, [r3, #204]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1198
	ldr	r2, [r3, #224]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1198
	ldr	r2, [r3, #244]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1198
	ldr	r2, [r3, #264]
	sub	r2, r2, #2048
	cmp	r2, r4
	beq	.L1198
	ldr	r2, [r3, #284]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1198
	ldr	r2, [r3, #304]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1198
	ldr	r2, [r3, #324]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1198
	ldr	r2, [r3, #344]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1198
	ldr	r2, [r3, #364]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1198
	ldr	r2, [r3, #384]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1198
	ldr	r2, [r3, #404]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1198
	ldr	r2, [r3, #424]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1198
	ldr	r2, [r3, #444]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1198
	ldr	r2, [r3, #464]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1198
	ldr	r3, [r3, #484]
	sub	r3, r3, #2048
	cmp	r4, r3
	beq	.L1198
	mov	r2, r6
	mov	r1, r4
	mov	r0, r5
	bl	snd_soc_cache_write
	subs	r3, r0, #0
	beq	.L1198
	movw	r1, #:lower16:.LC118
	mov	r2, r4
	ldr	r0, [r5, #12]
	movt	r1, #:upper16:.LC118
	bl	dev_err
.L1198:
	uxtb	r2, r6
	uxth	r1, r4
	ldrd	r4, [sp]
	ldr	r8, [sp, #16]
	add	r0, r7, #100
	ldrd	r6, [sp, #8]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	wcd9xxx_reg_write
.L1195:
	mov	r0, #0
	bx	lr
.L1213:
	.syntax divided
@ 4323 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9320.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9320.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 4323, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L1201:
	movw	r3, #711
	cmp	r4, r3
	beq	.L1198
	cmp	r4, #712
	bcc	.L1216
	movw	r3, #727
	cmp	r4, r3
	beq	.L1198
	cmp	r4, #728
	bcc	.L1217
	movw	r3, #735
	cmp	r4, r3
	beq	.L1198
	movw	r3, #743
	cmp	r4, r3
	bne	.L1200
	b	.L1198
.L1214:
	movw	r3, #553
	cmp	r4, r3
	beq	.L1198
	movw	r3, #561
	cmp	r4, r3
	beq	.L1198
	movw	r3, #545
	cmp	r4, r3
	bne	.L1200
	b	.L1198
.L1216:
	movw	r3, #695
	cmp	r4, r3
	beq	.L1198
	movw	r3, #703
	cmp	r4, r3
	beq	.L1198
	movw	r3, #617
	cmp	r4, r3
	bne	.L1200
	b	.L1198
.L1215:
	movw	r3, #577
	cmp	r4, r3
	bne	.L1200
	b	.L1198
.L1217:
	movw	r3, #719
	cmp	r4, r3
	bne	.L1200
	b	.L1198
	.fnend
	.size	taiko_write, .-taiko_write
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_slimvi_feedback, %function
taiko_codec_enable_slimvi_feedback:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-28]!
	.save {r4, r5, r6, r7, r8, r9, lr}
	strd	r6, [sp, #8]
	subs	r6, r0, #0
	strd	r8, [sp, #16]
	str	lr, [sp, #24]
	.pad #36
	sub	sp, sp, #36
	beq	.L1219
	ldr	r4, [r6, #12]
	cmp	r4, #0
	beq	.L1219
	ldr	r0, [r4, #12]
	mov	r8, r2
	bl	dev_get_drvdata
	ldr	r3, [r4, #12]
	mov	r5, r0
	ldr	r0, [r3]
	bl	dev_get_drvdata
	ldrb	r3, [r5, #37]	@ zero_extendqisi2
	mov	r7, r0
	cmp	r3, #1
	bne	.L1258
	ldrb	r3, [r6, #38]	@ zero_extendqisi2
	cmp	r3, #6
	bne	.L1259
	cmp	r8, #2
	beq	.L1225
	cmp	r8, #8
	bne	.L1260
	add	r3, r5, #296
	add	r1, r5, #288
	ldrh	r2, [r3]
	bl	wcd9xxx_close_slim_sch_tx
	subs	r2, r0, #0
	bne	.L1261
.L1231:
	mov	r0, #1000
	bl	msecs_to_jiffies
	ldr	r6, [r5, #300]
	mov	r7, r0
	cmp	r6, #0
	beq	.L1232
	mov	r3, sp
	add	r1, sp, #24
	bic	r2, r3, #8128
	mov	r3, #0
	bic	r2, r2, #63
	add	r8, r5, #304
	ldr	r0, [r2, #12]
	movw	r2, #:lower16:autoremove_wake_function
	str	r3, [sp, #12]
	movt	r2, #:upper16:autoremove_wake_function
	str	r0, [sp, #16]
	str	r2, [sp, #20]
	str	r1, [sp, #24]
	str	r1, [sp, #28]
	b	.L1235
.L1263:
	bl	schedule_timeout
	subs	r7, r0, #0
	beq	.L1262
.L1235:
	mov	r0, r8
	mov	r2, #2
	add	r1, sp, #12
	bl	prepare_to_wait
	ldr	r6, [r5, #300]
	mov	r0, r7
	cmp	r6, #0
	bne	.L1263
	cmp	r7, #0
	beq	.L1236
	add	r1, sp, #12
	mov	r0, r8
	bl	finish_wait
	b	.L1239
.L1260:
	mov	r6, #0
.L1224:
.L1218:
	mov	r0, r6
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	add	sp, sp, #24
	ldr	pc, [sp], #4
.L1225:
	mov	r3, #136
	movw	r1, #493
	mov	r2, r3
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r3, #12
	movw	r1, #779
	mov	r2, r3
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r1, r4
	add	r0, r5, #280
	bl	taiko_codec_enable_int_port
	mov	r3, #0
	mov	r6, r5
	strb	r3, [r5, #316]
	ldr	r4, [r6, #288]!
	cmp	r6, r4
	sub	r4, r4, #16
	beq	.L1228
	ldr	r9, .L1265
	movw	r8, #:lower16:.LC89
	movt	r8, #:upper16:.LC89
.L1227:
	ldr	r0, [r4, #4]
	bl	wcd9xxx_get_slave_port
	subs	r2, r0, #0
	add	r1, r5, #300
	blt	.L1264
	bl	_set_bit
	ldr	r4, [r4, #16]
	cmp	r6, r4
	sub	r4, r4, #16
	bne	.L1227
.L1228:
	ldr	r2, [r5, #280]
	add	r5, r5, #296
	mov	r1, r6
	ldr	r3, [r5, #-12]
	mov	r0, r7
	str	r5, [sp]
	bl	wcd9xxx_cfg_slim_sch_tx
	mov	r6, r0
	b	.L1218
.L1232:
	cmp	r0, #0
	beq	.L1238
.L1239:
	mov	r3, #0
	mov	r2, #12
	movw	r1, #779
	mov	r0, r4
	bl	snd_soc_update_bits
	mov	r3, #0
	mov	r0, r4
	mov	r2, #136
	movw	r1, #493
	bl	snd_soc_update_bits
	mov	r3, #0
	strb	r3, [r5, #316]
	b	.L1218
.L1262:
	ldr	r3, [r5, #300]
	cmp	r3, #0
	beq	.L1236
	add	r1, sp, #12
	mov	r0, r8
	bl	finish_wait
.L1238:
	movw	r0, #:lower16:.LC90
	ldr	r1, .L1265
	mvn	r6, #109
	movt	r0, #:upper16:.LC90
	bl	printk
	b	.L1239
.L1236:
	add	r1, sp, #12
	mov	r0, r8
	bl	finish_wait
	mov	r6, #0
	b	.L1239
.L1219:
	movw	r0, #:lower16:.LC119
	ldr	r1, .L1265+4
	mvn	r6, #21
	movt	r0, #:upper16:.LC119
	bl	printk
	b	.L1218
.L1264:
	mov	r1, r9
	mov	r0, r8
	bl	printk
	ldr	r4, [r4, #16]
	cmp	r6, r4
	sub	r4, r4, #16
	bne	.L1227
	b	.L1228
.L1259:
	movw	r0, #:lower16:.LC121
	ldr	r1, .L1265+4
	mvn	r6, #21
	movt	r0, #:upper16:.LC121
	bl	printk
	b	.L1218
.L1258:
	movw	r0, #:lower16:.LC120
	ldr	r1, .L1265+4
	mov	r6, #0
	movt	r0, #:upper16:.LC120
	bl	printk
	b	.L1218
.L1261:
	movw	r0, #:lower16:.LC122
	ldr	r1, .L1265+4
	movt	r0, #:upper16:.LC122
	bl	printk
	b	.L1231
.L1266:
	.align	2
.L1265:
	.word	.LANCHOR4-2740
	.word	.LANCHOR4-2180
	.fnend
	.size	taiko_codec_enable_slimvi_feedback, .-taiko_codec_enable_slimvi_feedback
	.align	2
	.global	taiko_read
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_read, %function
taiko_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	cmn	r1, #1
	beq	.L1279
	cmp	r1, #1024
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	.pad #8
	sub	sp, sp, #8
	bcs	.L1287
	sub	r3, r1, #256
	mov	r5, r0
	ldr	r6, [r0, #108]
	cmp	r3, #704
	mov	r4, r1
	bcs	.L1270
	sub	r3, r1, #840
	sub	r3, r3, #2
	cmp	r3, #17
	bls	.L1270
	bic	r3, r1, #128
	sub	r3, r3, #512
	sub	r3, r3, #2
	cmp	r3, #5
	bls	.L1270
	movw	r3, #609
	cmp	r1, r3
	beq	.L1270
	bhi	.L1272
	movw	r3, #569
	cmp	r1, r3
	beq	.L1270
	bls	.L1288
	movw	r3, #585
	cmp	r1, r3
	beq	.L1270
	bls	.L1289
	movw	r3, #593
	cmp	r1, r3
	beq	.L1270
	movw	r3, #601
	cmp	r1, r3
	beq	.L1270
.L1271:
	movw	r3, #331
	sub	r2, r4, #424
	movw	r1, #441
	sub	r2, r2, #3
	cmp	r4, r1
	cmpne	r4, r3
	moveq	r3, #1
	movne	r3, #0
	bics	r2, r2, #8
	moveq	r3, #1
	cmp	r3, #0
	bne	.L1270
	cmp	r4, #624
	bcc	.L1277
	cmp	r4, #632
	bcc	.L1270
	movw	r3, #763
	cmp	r4, r3
	beq	.L1270
.L1277:
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r2, [r3, #144]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1270
	ldr	r2, [r3, #164]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1270
	ldr	r2, [r3, #184]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1270
	ldr	r2, [r3, #204]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1270
	ldr	r2, [r3, #224]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1270
	ldr	r2, [r3, #244]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1270
	ldr	r2, [r3, #264]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1270
	ldr	r2, [r3, #284]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1270
	ldr	r2, [r3, #304]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1270
	ldr	r2, [r3, #324]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1270
	ldr	r2, [r3, #344]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1270
	ldr	r2, [r3, #364]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1270
	ldr	r2, [r3, #384]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1270
	ldr	r2, [r3, #404]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1270
	ldr	r2, [r3, #424]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1270
	ldr	r2, [r3, #444]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1270
	ldr	r2, [r3, #464]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1270
	ldr	r3, [r3, #484]
	sub	r3, r3, #2048
	cmp	r4, r3
	beq	.L1270
	movw	r3, #:lower16:taiko_reg_readable
	movt	r3, #:upper16:taiko_reg_readable
	ldrb	r3, [r3, r4]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L1270
	ldr	r3, [r5, #16]
	ldr	r3, [r3, #72]
	cmp	r3, r4
	bls	.L1270
	add	r2, sp, #4
	mov	r1, r4
	mov	r0, r5
	bl	snd_soc_cache_read
	subs	r3, r0, #0
	blt	.L1278
	ldr	r0, [sp, #4]
	b	.L1267
.L1278:
	movw	r1, #:lower16:.LC123
	mov	r2, r4
	ldr	r0, [r5, #12]
	movt	r1, #:upper16:.LC123
	bl	dev_err
.L1270:
	uxth	r1, r4
	add	r0, r6, #100
	bl	wcd9xxx_reg_read
.L1267:
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L1279:
	mov	r0, #0
	bx	lr
.L1287:
	.syntax divided
@ 4383 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9320.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9320.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 4383, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L1272:
	movw	r3, #711
	cmp	r1, r3
	beq	.L1270
	cmp	r1, #712
	bcc	.L1290
	movw	r3, #727
	cmp	r1, r3
	beq	.L1270
	cmp	r1, #728
	bcc	.L1291
	movw	r3, #735
	cmp	r1, r3
	beq	.L1270
	movw	r3, #743
	cmp	r1, r3
	bne	.L1271
	b	.L1270
.L1288:
	movw	r3, #553
	cmp	r1, r3
	beq	.L1270
	movw	r3, #561
	cmp	r1, r3
	beq	.L1270
	movw	r3, #545
	cmp	r1, r3
	bne	.L1271
	b	.L1270
.L1290:
	movw	r3, #695
	cmp	r1, r3
	beq	.L1270
	movw	r3, #703
	cmp	r1, r3
	beq	.L1270
	movw	r3, #617
	cmp	r1, r3
	bne	.L1271
	b	.L1270
.L1291:
	movw	r3, #719
	cmp	r1, r3
	bne	.L1271
	b	.L1270
.L1289:
	movw	r3, #577
	cmp	r1, r3
	bne	.L1271
	b	.L1270
	.fnend
	.size	taiko_read, .-taiko_read
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_get_iir_band_audio_mixer, %function
taiko_get_iir_band_audio_mixer:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r3, #0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	mov	r9, r1
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r2, [r0, #92]
	.pad #12
	sub	sp, sp, #12
	ldr	r4, [r0, #96]
	ldr	r10, [r2, #16]
	ldr	r7, [r2, #24]
	mov	r0, r4
	mov	r1, r10
	lsl	r6, r10, #4
	mov	r2, r7
	bl	get_iir_band_coeff
	add	r5, r7, r7, lsl #2
	mov	r2, r7
	str	r0, [r9, #72]
	mov	r1, r10
	mov	r3, #1
	mov	r0, r4
	bl	get_iir_band_coeff
	add	r5, r5, #3
	mov	r3, #2
	str	r0, [r9, #76]
	lsl	r5, r5, #2
	mov	r2, r7
	mov	r1, r10
	add	r8, r6, #840
	mov	r0, r4
	bl	get_iir_band_coeff
	add	r8, r8, #2
	add	r6, r6, #840
	str	r0, [r9, #80]
	add	r6, r6, #3
	and	r2, r5, #124
	mov	r1, r8
	mov	r0, r4
	bl	snd_soc_write
	mov	r1, r6
	mov	r0, r4
	bl	snd_soc_read
	add	r2, r5, #1
	mov	fp, r0
	mov	r1, r8
	and	r2, r2, #127
	mov	r0, r4
	bl	snd_soc_write
	mov	r1, r6
	mov	r0, r4
	bl	snd_soc_read
	mov	r3, r0
	add	r2, r5, #2
	mov	r1, r8
	and	r2, r2, #126
	mov	r0, r4
	str	r3, [sp, #4]
	bl	snd_soc_write
	mov	r1, r6
	mov	r0, r4
	bl	snd_soc_read
	ldr	r3, [sp, #4]
	lsl	r0, r0, #16
	add	r2, r5, #3
	and	r2, r2, #127
	mov	r1, r8
	orr	r3, r0, r3, lsl #8
	mov	r0, r4
	orr	r5, r3, fp
	bl	snd_soc_write
	mov	r1, r6
	mov	r0, r4
	bl	snd_soc_read
	lsl	fp, r0, #24
	mov	r2, r7
	mov	r1, r10
	and	fp, fp, #1056964608
	mov	r0, r4
	orr	fp, fp, r5
	mov	r3, #4
	str	fp, [r9, #84]
	bl	get_iir_band_coeff
	str	r0, [r9, #88]
	mov	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
	.fnend
	.size	taiko_get_iir_band_audio_mixer, .-taiko_get_iir_band_audio_mixer
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_anc_hph, %function
taiko_codec_enable_anc_hph:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	r2, r2, #1
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	.pad #8
	sub	sp, sp, #8
	ldr	r5, [r0, #12]
	cmp	r2, #7
	ldrls	pc, [pc, r2, asl #2]
	b	.L1314
.L1297:
	.word	.L1296
	.word	.L1298
	.word	.L1314
	.word	.L1299
	.word	.L1314
	.word	.L1314
	.word	.L1314
	.word	.L1300
.L1300:
	ldr	r0, [r5, #12]
	bl	dev_get_drvdata
	ldrb	r4, [r4, #38]	@ zero_extendqisi2
	mov	r7, r0
	cmp	r4, #5
	beq	.L1315
	cmp	r4, #4
	moveq	r8, #46
	bne	.L1319
.L1306:
	ldr	r2, [r7, #364]
	mov	r6, #0
	movw	r3, #13000
	movw	r0, #3000
	movw	r1, #14000
	cmp	r2, r6
	moveq	r0, r3
	movne	r1, #4000
	bl	usleep_range
	mov	r1, r8
	add	r0, r7, #416
	bl	wcd9xxx_resmgr_notifier_call
	mov	r3, #2
	add	r1, r7, #1136
	add	r1, r1, #12
	mov	r2, r4
	mov	r0, r5
	str	r3, [sp]
	mov	r3, r6
	bl	wcd9xxx_clsh_fsm
	b	.L1294
.L1299:
	ldrb	r3, [r0, #38]	@ zero_extendqisi2
	cmp	r3, #5
	beq	.L1320
.L1314:
	mov	r6, #0
.L1294:
	mov	r0, r6
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L1298:
	ldrb	r3, [r0, #38]	@ zero_extendqisi2
	cmp	r3, #4
	beq	.L1321
.L1303:
	ldr	r0, [r5, #12]
	bl	dev_get_drvdata
	ldrb	r4, [r4, #38]	@ zero_extendqisi2
	mov	r7, r0
	cmp	r4, #5
	beq	.L1311
	cmp	r4, #4
	bne	.L1319
.L1304:
	ldr	r2, [r7, #364]
	mov	r6, #0
	movw	r3, #13000
	movw	r0, #3000
	movw	r1, #14000
	cmp	r2, r6
	moveq	r0, r3
	movne	r1, #4000
	bl	usleep_range
	mov	r3, #2
	add	r1, r7, #1136
	add	r1, r1, #12
	mov	r2, r4
	mov	r0, r5
	str	r3, [sp]
	mov	r3, #1
	bl	wcd9xxx_clsh_fsm
	b	.L1294
.L1296:
	ldr	r0, [r5, #12]
	bl	dev_get_drvdata
	ldrb	r2, [r4, #38]	@ zero_extendqisi2
	cmp	r2, #5
	beq	.L1309
	cmp	r2, #4
	moveq	r1, #45
	bne	.L1322
.L1301:
	add	r0, r0, #416
	mov	r6, #0
	bl	wcd9xxx_resmgr_notifier_call
.L1302:
	ldrb	r3, [r4, #38]	@ zero_extendqisi2
	cmp	r3, #4
	bne	.L1294
	mov	r0, r4
	mov	r1, #1
	bl	taiko_codec_enable_anc.constprop.15
	orr	r6, r6, r0
	mov	r0, #50
	bl	msleep
	b	.L1294
.L1315:
	mov	r4, #2
	mov	r8, #44
	b	.L1306
.L1311:
	mov	r4, #2
	b	.L1304
.L1309:
	mov	r1, #43
	b	.L1301
.L1321:
	mov	r3, #48
	mov	r0, r5
	mov	r2, r3
	movw	r1, #427
	bl	snd_soc_update_bits
	mov	r0, #30
	bl	msleep
	ldr	r5, [r4, #12]
	b	.L1303
.L1320:
	mov	r3, #0
	mov	r2, #48
	movw	r1, #427
	mov	r0, r5
	bl	snd_soc_update_bits
	mov	r0, #40
	bl	msleep
	mov	r0, r5
	mov	r3, #0
	mov	r2, #128
	movw	r1, #369
	bl	snd_soc_update_bits
	mov	r0, r4
	mov	r1, #4
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	taiko_codec_enable_anc.constprop.15
.L1319:
	movw	r0, #:lower16:.LC42
	mov	r2, r4
	ldr	r1, .L1323
	movt	r0, #:upper16:.LC42
	mvn	r6, #21
	bl	printk
	b	.L1294
.L1322:
	movw	r0, #:lower16:.LC42
	ldr	r1, .L1323
	mvn	r6, #21
	movt	r0, #:upper16:.LC42
	bl	printk
	b	.L1302
.L1324:
	.align	2
.L1323:
	.word	.LANCHOR2+420
	.fnend
	.size	taiko_codec_enable_anc_hph, .-taiko_codec_enable_anc_hph
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_codec_enable_slimtx, %function
taiko_codec_enable_slimtx:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	mov	r6, r0
	strd	r8, [sp, #16]
	mov	r8, r2
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r4, [r0, #12]
	.pad #44
	sub	sp, sp, #44
	ldr	r0, [r4, #12]
	bl	dev_get_drvdata
	ldr	r3, [r4, #12]
	mov	r5, r0
	ldr	r0, [r3]
	bl	dev_get_drvdata
	ldrb	r3, [r5, #37]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L1355
.L1343:
	mov	r0, #0
.L1325:
	add	sp, sp, #44
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1355:
	cmp	r8, #2
	mov	r10, r0
	ldrb	r7, [r6, #38]	@ zero_extendqisi2
	beq	.L1328
	cmp	r8, #8
	bne	.L1343
	add	r4, r7, r7, lsl #2
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	add	r8, r5, r4, lsl #3
	lsl	r4, r4, #3
	ldr	r3, [r3, #2320]
	mov	r0, r7
	lsl	r6, r7, #2
	blx	r3
	add	r1, r4, #48
	mov	r0, r10
	ldrh	r2, [r8, #56]
	add	r1, r5, r1
	bl	wcd9xxx_close_slim_sch_tx
	ldrb	fp, [r8, #76]	@ zero_extendqisi2
	cmp	fp, #0
	beq	.L1356
.L1334:
	add	r7, r6, r7
	mov	r3, #0
	add	r5, r5, r7, lsl #3
	strb	r3, [r5, #76]
	b	.L1325
.L1328:
	add	r8, r7, #1
	mov	r1, r4
	add	r8, r8, r8, lsl #2
	lsl	r8, r8, #3
	add	r0, r5, r8
	add	r9, r8, #8
	bl	taiko_codec_enable_int_port
	add	r3, r7, r7, lsl #2
	add	r9, r5, r9
	mov	r2, #0
	add	r3, r5, r3, lsl #3
	ldr	r4, [r3, #48]
	strb	r2, [r3, #76]
	cmp	r9, r4
	sub	r4, r4, #16
	beq	.L1330
	add	fp, r8, #20
	movw	r3, #:lower16:.LC89
	movt	r3, #:upper16:.LC89
	add	fp, r5, fp
	str	r3, [sp, #12]
.L1331:
	ldr	r0, [r4, #4]
	bl	wcd9xxx_get_slave_port
	subs	r2, r0, #0
	mov	r1, fp
	blt	.L1357
	bl	_set_bit
	ldr	r4, [r4, #16]
	cmp	r9, r4
	sub	r4, r4, #16
	bne	.L1331
.L1330:
	add	r7, r7, r7, lsl #2
	add	r8, r8, #16
	add	r8, r5, r8
	add	r5, r5, r7, lsl #3
	mov	r1, r9
	mov	r0, r10
	ldrd	r2, [r5, #40]
	str	r8, [sp]
	bl	wcd9xxx_cfg_slim_sch_tx
	movw	r3, #:lower16:.LANCHOR1
	ldrb	r0, [r6, #38]	@ zero_extendqisi2
	movt	r3, #:upper16:.LANCHOR1
	ldr	r3, [r3, #2316]
	blx	r3
	b	.L1325
.L1356:
	mov	r0, #1000
	bl	msecs_to_jiffies
	mov	r10, r0
	ldr	r0, [r8, #60]
	cmp	r0, #0
	beq	.L1335
	mov	r3, sp
	str	fp, [sp, #20]
	add	r2, sp, #32
	bic	r3, r3, #8128
	add	r4, r4, #64
	bic	r3, r3, #63
	add	r9, r5, r4
	ldr	r1, [r3, #12]
	movw	r3, #:lower16:autoremove_wake_function
	movt	r3, #:upper16:autoremove_wake_function
	str	r1, [sp, #24]
	str	r3, [sp, #28]
	str	r2, [sp, #32]
	str	r2, [sp, #36]
	b	.L1338
.L1359:
	bl	schedule_timeout
	subs	r10, r0, #0
	beq	.L1358
.L1338:
	mov	r0, r9
	mov	r2, #2
	add	r1, sp, #20
	add	fp, r8, #60
	bl	prepare_to_wait
	ldr	r4, [r8, #60]
	mov	r0, r10
	cmp	r4, #0
	bne	.L1359
.L1339:
	mov	r0, r9
	add	r1, sp, #20
	bl	finish_wait
	mov	r0, #0
	b	.L1334
.L1335:
	cmp	r10, #0
	bne	.L1334
.L1341:
	movw	r0, #:lower16:.LC90
	ldr	r1, .L1360
	movt	r0, #:upper16:.LC90
	bl	printk
	mvn	r0, #109
	b	.L1334
.L1358:
	ldr	r3, [fp]
	cmp	r3, #0
	beq	.L1339
	add	r1, sp, #20
	mov	r0, r9
	bl	finish_wait
	b	.L1341
.L1357:
	ldr	r1, .L1360
	ldr	r0, [sp, #12]
	bl	printk
	ldr	r4, [r4, #16]
	cmp	r9, r4
	sub	r4, r4, #16
	bne	.L1331
	b	.L1330
.L1361:
	.align	2
.L1360:
	.word	.LANCHOR4-2740
	.fnend
	.size	taiko_codec_enable_slimtx, .-taiko_codec_enable_slimtx
	.align	2
	.global	taiko_write_no_hook
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_write_no_hook, %function
taiko_write_no_hook:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmn	r1, #1
	beq	.L1363
	cmp	r1, #1024
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	bcs	.L1381
	sub	r3, r1, #256
	mov	r6, r2
	ldr	r7, [r0, #108]
	cmp	r3, #704
	mov	r5, r0
	mov	r4, r1
	bcs	.L1366
	sub	r3, r1, #840
	sub	r3, r3, #2
	cmp	r3, #17
	bls	.L1366
	bic	r3, r1, #128
	sub	r3, r3, #512
	sub	r3, r3, #2
	cmp	r3, #5
	bls	.L1366
	movw	r3, #609
	cmp	r1, r3
	beq	.L1366
	bhi	.L1369
	movw	r3, #569
	cmp	r1, r3
	beq	.L1366
	bls	.L1382
	movw	r3, #585
	cmp	r1, r3
	beq	.L1366
	bls	.L1383
	movw	r3, #593
	cmp	r1, r3
	beq	.L1366
	movw	r3, #601
	cmp	r1, r3
	beq	.L1366
.L1368:
	movw	r3, #331
	sub	r2, r4, #424
	movw	r1, #441
	sub	r2, r2, #3
	cmp	r4, r1
	cmpne	r4, r3
	moveq	r3, #1
	movne	r3, #0
	bics	r2, r2, #8
	moveq	r3, #1
	cmp	r3, #0
	bne	.L1366
	cmp	r4, #624
	bcc	.L1374
	cmp	r4, #632
	bcc	.L1366
	movw	r3, #763
	cmp	r4, r3
	beq	.L1366
.L1374:
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r2, [r3, #144]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1366
	ldr	r2, [r3, #164]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1366
	ldr	r2, [r3, #184]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1366
	ldr	r2, [r3, #204]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1366
	ldr	r2, [r3, #224]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1366
	ldr	r2, [r3, #244]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1366
	ldr	r2, [r3, #264]
	sub	r2, r2, #2048
	cmp	r2, r4
	beq	.L1366
	ldr	r2, [r3, #284]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1366
	ldr	r2, [r3, #304]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1366
	ldr	r2, [r3, #324]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1366
	ldr	r2, [r3, #344]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1366
	ldr	r2, [r3, #364]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1366
	ldr	r2, [r3, #384]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1366
	ldr	r2, [r3, #404]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1366
	ldr	r2, [r3, #424]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1366
	ldr	r2, [r3, #444]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1366
	ldr	r2, [r3, #464]
	sub	r2, r2, #2048
	cmp	r4, r2
	beq	.L1366
	ldr	r3, [r3, #484]
	sub	r3, r3, #2048
	cmp	r4, r3
	beq	.L1366
	mov	r2, r6
	mov	r1, r4
	mov	r0, r5
	bl	snd_soc_cache_write
	subs	r3, r0, #0
	beq	.L1366
	movw	r1, #:lower16:.LC118
	mov	r2, r4
	ldr	r0, [r5, #12]
	movt	r1, #:upper16:.LC118
	bl	dev_err
.L1366:
	uxtb	r2, r6
	uxth	r1, r4
	ldrd	r4, [sp]
	ldr	r8, [sp, #16]
	add	r0, r7, #100
	ldrd	r6, [sp, #8]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	wcd9xxx_reg_write
.L1363:
	mov	r0, #0
	bx	lr
.L1381:
	.syntax divided
@ 4353 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9320.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/wcd9320.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 4353, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L1369:
	movw	r3, #711
	cmp	r1, r3
	beq	.L1366
	cmp	r1, #712
	bcc	.L1384
	movw	r3, #727
	cmp	r1, r3
	beq	.L1366
	cmp	r1, #728
	bcc	.L1385
	movw	r3, #735
	cmp	r1, r3
	beq	.L1366
	movw	r3, #743
	cmp	r1, r3
	bne	.L1368
	b	.L1366
.L1382:
	movw	r3, #553
	cmp	r1, r3
	beq	.L1366
	movw	r3, #561
	cmp	r1, r3
	beq	.L1366
	movw	r3, #545
	cmp	r1, r3
	bne	.L1368
	b	.L1366
.L1384:
	movw	r3, #695
	cmp	r1, r3
	beq	.L1366
	movw	r3, #703
	cmp	r1, r3
	beq	.L1366
	movw	r3, #617
	cmp	r1, r3
	bne	.L1368
	b	.L1366
.L1383:
	movw	r3, #577
	cmp	r1, r3
	bne	.L1368
	b	.L1366
.L1385:
	movw	r3, #719
	cmp	r1, r3
	bne	.L1368
	b	.L1366
	.fnend
	.size	taiko_write_no_hook, .-taiko_write_no_hook
	.align	2
	.global	taiko_mclk_enable
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_mclk_enable, %function
taiko_mclk_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	str	r6, [sp, #8]
	mov	r6, r1
	str	lr, [sp, #12]
	ldr	r0, [r0, #12]
	bl	dev_get_drvdata
	add	r5, r0, #552
	add	r4, r0, #416
	mov	r0, r5
	bl	mutex_lock
	cmp	r6, #0
	bne	.L1390
	mov	r1, #2
	mov	r0, r4
	bl	wcd9xxx_resmgr_put_clk_block
	mov	r0, r4
	mov	r1, #1
	bl	wcd9xxx_resmgr_put_bandgap
.L1388:
	mov	r0, r5
	bl	mutex_unlock
	ldrd	r4, [sp]
	mov	r0, #0
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L1390:
	mov	r0, r4
	mov	r1, #1
	bl	wcd9xxx_resmgr_get_bandgap
	mov	r0, r4
	mov	r1, #2
	bl	wcd9xxx_resmgr_get_clk_block
	b	.L1388
	.fnend
	.size	taiko_mclk_enable, .-taiko_mclk_enable
	.align	2
	.global	taiko_hs_detect
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_hs_detect, %function
taiko_hs_detect:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r1
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r0, [r0, #12]
	bl	dev_get_drvdata
	mov	r4, r0
	mov	r1, r5
	add	r0, r0, #580
	bl	wcd9xxx_mbhc_start
	cmp	r0, #0
	moveq	r3, #1
	strbeq	r3, [r4, #396]
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
	.fnend
	.size	taiko_hs_detect, .-taiko_hs_detect
	.align	2
	.global	taiko_hs_detect_exit
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_hs_detect_exit, %function
taiko_hs_detect_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	str	lr, [sp, #4]
	ldr	r0, [r0, #12]
	bl	dev_get_drvdata
	mov	r4, r0
	add	r0, r0, #580
	bl	wcd9xxx_mbhc_stop
	mov	r3, #0
	strb	r3, [r4, #396]
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
	.fnend
	.size	taiko_hs_detect_exit, .-taiko_hs_detect_exit
	.align	2
	.global	taiko_event_register
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_event_register, %function
taiko_event_register:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r4, r0
	str	lr, [sp, #4]
	ldr	r0, [r1, #12]
	bl	dev_get_drvdata
	str	r4, [r0, #1184]
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
	.fnend
	.size	taiko_event_register, .-taiko_event_register
	.align	2
	.global	taiko_get_afe_config
	.syntax unified
	.arm
	.fpu softvfp
	.type	taiko_get_afe_config, %function
taiko_get_afe_config:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r1
	str	r6, [sp, #8]
	mov	r6, r0
	str	lr, [sp, #12]
	ldr	r0, [r0, #12]
	bl	dev_get_drvdata
	ldr	r3, [r6, #12]
	mov	r4, r0
	ldr	r0, [r3]
	bl	dev_get_drvdata
	cmp	r5, #5
	ldrls	pc, [pc, r5, asl #2]
	b	.L1399
.L1401:
	.word	.L1400
	.word	.L1402
	.word	.L1407
	.word	.L1404
	.word	.L1405
	.word	.L1406
.L1406:
	ldrb	r3, [r0, #60]	@ zero_extendqisi2
	ldr	r0, .L1411
	cmp	r3, #1
	moveq	r0, #0
.L1398:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L1400:
	ldr	r0, .L1411+4
	b	.L1398
.L1402:
	add	r0, r4, #396
	add	r0, r0, #1
	b	.L1398
.L1407:
	ldr	r0, .L1411+8
	b	.L1398
.L1404:
	ldr	r0, .L1411+12
	b	.L1398
.L1405:
	ldrb	r3, [r0, #60]	@ zero_extendqisi2
	ldr	r0, .L1411+16
	cmp	r3, #1
	moveq	r0, #0
	b	.L1398
.L1399:
	movw	r0, #:lower16:.LC124
	mov	r2, r5
	ldr	r1, .L1411+20
	movt	r0, #:upper16:.LC124
	bl	printk
	mov	r0, #0
	b	.L1398
.L1412:
	.align	2
.L1411:
	.word	.LANCHOR1+2340
	.word	.LANCHOR1+2268
	.word	.LANCHOR1+2324
	.word	.LANCHOR1+2332
	.word	.LANCHOR1+2364
	.word	.LANCHOR4-2144
	.fnend
	.size	taiko_get_afe_config, .-taiko_get_afe_config
	.global	remote_add_codec_controls
	.global	remote_close_slim_tx
	.global	remote_cfg_slim_tx
	.global	remote_close_slim_rx
	.global	remote_cfg_slim_rx
	.global	slim_hw_params
	.global	slim_set_channel_map
	.global	slim_get_channel_map
	.global	remote_route_enable
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.set	.LANCHOR4,. + 8184
	.type	__func__.32841, %object
	.size	__func__.32841, 28
__func__.32841:
	.ascii	"taiko_esxxx_get_channel_map\000"
	.type	__func__.32650, %object
	.size	__func__.32650, 22
__func__.32650:
	.ascii	"taiko_get_channel_map\000"
	.space	2
	.type	__func__.32593, %object
	.size	__func__.32593, 14
__func__.32593:
	.ascii	"taiko_prepare\000"
	.space	2
	.type	__func__.32221, %object
	.size	__func__.32221, 24
__func__.32221:
	.ascii	"taiko_codec_enable_dmic\000"
	.type	vport_check_table, %object
	.size	vport_check_table, 32
vport_check_table:
	.word	0
	.word	40
	.word	0
	.word	34
	.word	0
	.word	10
	.space	8
	.type	__func__.32081, %object
	.size	__func__.32081, 18
__func__.32081:
	.ascii	"slim_tx_mixer_put\000"
	.space	2
	.type	vport_i2s_check_table, %object
	.size	vport_i2s_check_table, 32
vport_i2s_check_table:
	.space	32
	.type	rx_digital_gain_reg, %object
	.size	rx_digital_gain_reg, 14
rx_digital_gain_reg:
	.short	695
	.short	703
	.short	711
	.short	719
	.short	727
	.short	735
	.short	743
	.space	2
	.type	__func__.32244, %object
	.size	__func__.32244, 23
__func__.32244:
	.ascii	"taiko_codec_config_mad\000"
	.space	1
	.type	__func__.32255, %object
	.size	__func__.32255, 23
__func__.32255:
	.ascii	"taiko_codec_enable_mad\000"
	.space	1
	.type	__func__.32872, %object
	.size	__func__.32872, 28
__func__.32872:
	.ascii	"taiko_codec_enable_int_port\000"
	.type	__func__.32005, %object
	.size	__func__.32005, 21
__func__.32005:
	.ascii	"wcd9320_put_dec_enum\000"
	.space	3
	.type	__func__.32317, %object
	.size	__func__.32317, 23
__func__.32317:
	.ascii	"taiko_codec_enable_dec\000"
	.space	1
	.type	tx_digital_gain_reg, %object
	.size	tx_digital_gain_reg, 20
tx_digital_gain_reg:
	.short	545
	.short	553
	.short	561
	.short	569
	.short	577
	.short	585
	.short	593
	.short	601
	.short	609
	.short	617
	.type	__func__.32274, %object
	.size	__func__.32274, 27
__func__.32274:
	.ascii	"taiko_codec_enable_micbias\000"
	.space	1
	.type	__func__.32336, %object
	.size	__func__.32336, 28
__func__.32336:
	.ascii	"taiko_codec_enable_vdd_spkr\000"
	.type	__func__.32187, %object
	.size	__func__.32187, 27
__func__.32187:
	.ascii	"taiko_codec_enable_lineout\000"
	.space	1
	.type	__func__.32465, %object
	.size	__func__.32465, 19
__func__.32465:
	.ascii	"taiko_hph_pa_event\000"
	.space	1
	.type	__func__.32108, %object
	.size	__func__.32108, 16
__func__.32108:
	.ascii	"slim_rx_mux_put\000"
	.type	__func__.31754, %object
	.size	__func__.31754, 20
__func__.31754:
	.ascii	"taiko_mad_input_put\000"
	.type	taiko_conn_mad_text, %object
	.size	taiko_conn_mad_text, 64
taiko_conn_mad_text:
	.word	.LC47
	.word	.LC126
	.word	.LC127
	.word	.LC128
	.word	.LC129
	.word	.LC130
	.word	.LC131
	.word	.LC44
	.word	.LC274
	.word	.LC275
	.word	.LC276
	.word	.LC277
	.word	.LC278
	.word	.LC279
	.word	.LC45
	.word	.LC46
	.type	__func__.33059, %object
	.size	__func__.33059, 19
__func__.33059:
	.ascii	"taiko_handle_pdata\000"
	.space	1
	.type	__func__.33027, %object
	.size	__func__.33027, 18
__func__.33027:
	.ascii	"taiko_slimbus_irq\000"
	.space	2
	.type	__func__.33368, %object
	.size	__func__.33368, 13
__func__.33368:
	.ascii	"taiko_resume\000"
	.space	3
	.type	__func__.33146, %object
	.size	__func__.33146, 23
__func__.33146:
	.ascii	"taiko_get_hwdep_fw_cal\000"
	.space	1
	.type	taiko_reg_defaults, %object
	.size	taiko_reg_defaults, 148
taiko_reg_defaults:
	.short	0
	.byte	0
	.byte	2
	.short	788
	.byte	0
	.byte	3
	.short	446
	.byte	0
	.byte	5
	.short	692
	.byte	0
	.byte	120
	.short	700
	.byte	0
	.byte	120
	.short	708
	.byte	0
	.byte	120
	.short	716
	.byte	0
	.byte	120
	.short	724
	.byte	0
	.byte	120
	.short	732
	.byte	0
	.byte	120
	.short	740
	.byte	0
	.byte	120
	.short	693
	.byte	0
	.byte	-96
	.short	701
	.byte	0
	.byte	-96
	.short	709
	.byte	0
	.byte	-128
	.short	717
	.byte	0
	.byte	-128
	.short	725
	.byte	0
	.byte	-128
	.short	733
	.byte	0
	.byte	-128
	.short	741
	.byte	0
	.byte	-128
	.short	336
	.byte	0
	.byte	-15
	.short	992
	.byte	0
	.byte	0
	.short	993
	.byte	0
	.byte	0
	.short	994
	.byte	0
	.byte	0
	.short	995
	.byte	0
	.byte	3
	.short	996
	.byte	0
	.byte	0
	.short	997
	.byte	0
	.byte	0
	.short	998
	.byte	0
	.byte	0
	.short	999
	.byte	0
	.byte	0
	.short	1000
	.byte	0
	.byte	0
	.short	1001
	.byte	0
	.byte	0
	.short	1002
	.byte	0
	.byte	0
	.short	1003
	.byte	0
	.byte	64
	.short	638
	.byte	0
	.byte	0
	.short	776
	.byte	0
	.byte	0
	.short	780
	.byte	0
	.byte	0
	.short	946
	.byte	0
	.byte	1
	.short	422
	.byte	0
	.byte	85
	.short	396
	.byte	0
	.byte	81
	.short	393
	.byte	0
	.byte	91
	.type	taiko_1_0_reg_defaults, %object
	.size	taiko_1_0_reg_defaults, 48
taiko_1_0_reg_defaults:
	.short	421
	.byte	0
	.byte	-12
	.short	260
	.byte	0
	.byte	8
	.short	395
	.byte	0
	.byte	96
	.short	403
	.byte	0
	.byte	-4
	.short	390
	.byte	0
	.byte	8
	.short	387
	.byte	0
	.byte	-50
	.short	442
	.byte	0
	.byte	118
	.short	454
	.byte	0
	.byte	120
	.short	307
	.byte	0
	.byte	65
	.short	337
	.byte	0
	.byte	-65
	.short	319
	.byte	0
	.byte	-127
	.short	487
	.byte	0
	.byte	36
	.type	taiko_2_0_reg_defaults, %object
	.size	taiko_2_0_reg_defaults, 212
taiko_2_0_reg_defaults:
	.short	339
	.byte	0
	.byte	2
	.short	341
	.byte	0
	.byte	2
	.short	342
	.byte	0
	.byte	68
	.short	349
	.byte	0
	.byte	2
	.short	351
	.byte	0
	.byte	2
	.short	352
	.byte	0
	.byte	68
	.short	359
	.byte	0
	.byte	2
	.short	361
	.byte	0
	.byte	2
	.short	362
	.byte	0
	.byte	68
	.short	387
	.byte	0
	.byte	-50
	.short	390
	.byte	0
	.byte	8
	.short	396
	.byte	0
	.byte	81
	.short	408
	.byte	0
	.byte	16
	.short	421
	.byte	0
	.byte	-92
	.short	426
	.byte	0
	.byte	107
	.short	428
	.byte	0
	.byte	-38
	.short	429
	.byte	0
	.byte	21
	.short	442
	.byte	0
	.byte	118
	.short	450
	.byte	0
	.byte	-64
	.short	454
	.byte	0
	.byte	120
	.short	462
	.byte	0
	.byte	2
	.short	466
	.byte	0
	.byte	2
	.short	470
	.byte	0
	.byte	2
	.short	474
	.byte	0
	.byte	2
	.short	482
	.byte	0
	.byte	-105
	.short	483
	.byte	0
	.byte	1
	.short	484
	.byte	0
	.byte	0
	.short	547
	.byte	0
	.byte	72
	.short	555
	.byte	0
	.byte	72
	.short	563
	.byte	0
	.byte	72
	.short	571
	.byte	0
	.byte	72
	.short	579
	.byte	0
	.byte	72
	.short	587
	.byte	0
	.byte	72
	.short	595
	.byte	0
	.byte	72
	.short	603
	.byte	0
	.byte	72
	.short	611
	.byte	0
	.byte	72
	.short	619
	.byte	0
	.byte	72
	.short	691
	.byte	0
	.byte	8
	.short	699
	.byte	0
	.byte	8
	.short	707
	.byte	0
	.byte	8
	.short	715
	.byte	0
	.byte	8
	.short	723
	.byte	0
	.byte	8
	.short	731
	.byte	0
	.byte	8
	.short	739
	.byte	0
	.byte	8
	.short	762
	.byte	0
	.byte	0
	.short	865
	.byte	0
	.byte	0
	.short	866
	.byte	0
	.byte	0
	.short	867
	.byte	0
	.byte	0
	.short	868
	.byte	0
	.byte	0
	.short	869
	.byte	0
	.byte	0
	.short	875
	.byte	0
	.byte	55
	.short	876
	.byte	0
	.byte	127
	.short	876
	.byte	0
	.byte	127
	.type	__func__.33289, %object
	.size	__func__.33289, 18
__func__.33289:
	.ascii	"taiko_codec_probe\000"
	.space	2
	.type	taiko_codec_reg_init_val, %object
	.size	taiko_codec_reg_init_val, 176
taiko_codec_reg_init_val:
	.short	426
	.byte	-31
	.byte	97
	.short	416
	.byte	-1
	.byte	-1
	.short	431
	.byte	1
	.byte	1
	.short	437
	.byte	1
	.byte	1
	.short	430
	.byte	32
	.byte	32
	.short	436
	.byte	32
	.byte	32
	.short	461
	.byte	32
	.byte	32
	.short	465
	.byte	32
	.byte	32
	.short	469
	.byte	32
	.byte	32
	.short	473
	.byte	32
	.byte	32
	.short	480
	.byte	4
	.byte	4
	.short	931
	.byte	48
	.byte	32
	.short	932
	.byte	48
	.byte	32
	.short	933
	.byte	48
	.byte	32
	.short	934
	.byte	48
	.byte	32
	.short	935
	.byte	48
	.byte	32
	.short	936
	.byte	48
	.byte	32
	.short	937
	.byte	96
	.byte	64
	.short	938
	.byte	96
	.byte	64
	.short	939
	.byte	96
	.byte	64
	.short	940
	.byte	96
	.byte	64
	.short	547
	.byte	8
	.byte	0
	.short	555
	.byte	8
	.byte	0
	.short	563
	.byte	8
	.byte	0
	.short	571
	.byte	8
	.byte	0
	.short	579
	.byte	8
	.byte	0
	.short	587
	.byte	8
	.byte	0
	.short	595
	.byte	8
	.byte	0
	.short	603
	.byte	8
	.byte	0
	.short	611
	.byte	8
	.byte	0
	.short	619
	.byte	8
	.byte	0
	.short	875
	.byte	63
	.byte	55
	.short	883
	.byte	63
	.byte	55
	.short	891
	.byte	63
	.byte	55
	.short	876
	.byte	127
	.byte	127
	.short	884
	.byte	127
	.byte	127
	.short	892
	.byte	127
	.byte	127
	.short	428
	.byte	-1
	.byte	-37
	.short	429
	.byte	-1
	.byte	88
	.short	425
	.byte	-1
	.byte	26
	.short	421
	.byte	-1
	.byte	36
	.short	403
	.byte	-1
	.byte	-4
	.short	260
	.byte	-1
	.byte	4
	.short	946
	.byte	15
	.byte	8
	.type	taiko_dapm_i2s_widgets, %object
	.size	taiko_dapm_i2s_widgets, 272
taiko_dapm_i2s_widgets:
	.word	20
	.word	.LC354
	.space	28
	.short	774
	.byte	4
	.space	21
	.byte	0
	.space	15
	.short	0
	.space	2
	.word	0
	.space	52
	.word	20
	.word	.LC355
	.space	28
	.short	775
	.byte	4
	.space	21
	.byte	0
	.space	15
	.short	0
	.space	2
	.word	0
	.space	52
	.type	audio_i2s_map, %object
	.size	audio_i2s_map, 128
audio_i2s_map:
	.word	.LC146
	.word	0
	.word	.LC354
	.space	4
	.word	.LC147
	.word	0
	.word	.LC354
	.space	4
	.word	.LC148
	.word	0
	.word	.LC354
	.space	4
	.word	.LC149
	.word	0
	.word	.LC354
	.space	4
	.word	.LC270
	.word	0
	.word	.LC355
	.space	4
	.word	.LC271
	.word	0
	.word	.LC355
	.space	4
	.word	.LC272
	.word	0
	.word	.LC355
	.space	4
	.word	.LC273
	.word	0
	.word	.LC355
	.space	4
	.type	audio_i2s_map_1_0, %object
	.size	audio_i2s_map_1_0, 16
audio_i2s_map_1_0:
	.word	.LC354
	.word	0
	.word	.LC211
	.space	4
	.type	audio_i2s_map_2_0, %object
	.size	audio_i2s_map_2_0, 16
audio_i2s_map_2_0:
	.word	.LC354
	.word	0
	.word	.LC210
	.space	4
	.type	taiko_1_dapm_widgets, %object
	.size	taiko_1_dapm_widgets, 816
taiko_1_dapm_widgets:
	.word	9
	.word	.LC126
	.word	0
	.space	24
	.short	339
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_adc
	.space	52
	.word	9
	.word	.LC127
	.word	0
	.space	24
	.short	339
	.byte	3
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_adc
	.space	52
	.word	9
	.word	.LC128
	.word	0
	.space	24
	.short	349
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_adc
	.space	52
	.word	9
	.word	.LC129
	.word	0
	.space	24
	.short	349
	.byte	3
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_adc
	.space	52
	.word	9
	.word	.LC130
	.word	0
	.space	24
	.short	359
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	2
	.space	2
	.word	taiko_codec_enable_adc
	.space	52
	.word	9
	.word	.LC131
	.word	0
	.space	24
	.short	359
	.byte	3
	.space	21
	.byte	0
	.space	15
	.short	2
	.space	2
	.word	taiko_codec_enable_adc
	.space	52
	.type	taiko_1_x_analog_gain_controls, %object
	.size	taiko_1_x_analog_gain_controls, 672
taiko_1_x_analog_gain_controls:
	.word	2
	.space	8
	.word	.LC420
	.space	12
	.word	snd_soc_info_enum_ext
	.word	taiko_pa_gain_get
	.word	taiko_pa_gain_put
	.space	4
	.word	taiko_1_x_ear_pa_gain_enum
	.word	2
	.space	8
	.word	.LC421
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	line_gain
	.word	__compound_literal.70
	.word	2
	.space	8
	.word	.LC422
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	line_gain
	.word	__compound_literal.71
	.word	2
	.space	8
	.word	.LC423
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	line_gain
	.word	__compound_literal.72
	.word	2
	.space	8
	.word	.LC424
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	line_gain
	.word	__compound_literal.73
	.word	2
	.space	8
	.word	.LC425
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	line_gain
	.word	__compound_literal.74
	.word	2
	.space	8
	.word	.LC426
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	line_gain
	.word	__compound_literal.75
	.word	2
	.space	8
	.word	.LC427
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	line_gain
	.word	__compound_literal.76
	.word	2
	.space	8
	.word	.LC428
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	analog_gain
	.word	__compound_literal.77
	.word	2
	.space	8
	.word	.LC429
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	analog_gain
	.word	__compound_literal.78
	.word	2
	.space	8
	.word	.LC430
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	analog_gain
	.word	__compound_literal.79
	.word	2
	.space	8
	.word	.LC431
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	analog_gain
	.word	__compound_literal.80
	.word	2
	.space	8
	.word	.LC432
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	analog_gain
	.word	__compound_literal.81
	.word	2
	.space	8
	.word	.LC433
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	analog_gain
	.word	__compound_literal.82
	.type	taiko_2_dapm_widgets, %object
	.size	taiko_2_dapm_widgets, 816
taiko_2_dapm_widgets:
	.word	9
	.word	.LC126
	.word	0
	.space	24
	.short	339
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_adc
	.space	52
	.word	9
	.word	.LC127
	.word	0
	.space	24
	.short	341
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_adc
	.space	52
	.word	9
	.word	.LC128
	.word	0
	.space	24
	.short	349
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_adc
	.space	52
	.word	9
	.word	.LC129
	.word	0
	.space	24
	.short	351
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_adc
	.space	52
	.word	9
	.word	.LC130
	.word	0
	.space	24
	.short	359
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	2
	.space	2
	.word	taiko_codec_enable_adc
	.space	52
	.word	9
	.word	.LC131
	.word	0
	.space	24
	.short	361
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	2
	.space	2
	.word	taiko_codec_enable_adc
	.space	52
	.type	taiko_2_x_analog_gain_controls, %object
	.size	taiko_2_x_analog_gain_controls, 672
taiko_2_x_analog_gain_controls:
	.word	2
	.space	8
	.word	.LC420
	.space	12
	.word	snd_soc_info_enum_ext
	.word	taiko_pa_gain_get
	.word	taiko_pa_gain_put
	.space	4
	.word	taiko_2_x_ear_pa_gain_enum
	.word	2
	.space	8
	.word	.LC421
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	line_gain
	.word	__compound_literal.83
	.word	2
	.space	8
	.word	.LC422
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	line_gain
	.word	__compound_literal.84
	.word	2
	.space	8
	.word	.LC423
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	line_gain
	.word	__compound_literal.85
	.word	2
	.space	8
	.word	.LC424
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	line_gain
	.word	__compound_literal.86
	.word	2
	.space	8
	.word	.LC425
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	line_gain
	.word	__compound_literal.87
	.word	2
	.space	8
	.word	.LC426
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	line_gain
	.word	__compound_literal.88
	.word	2
	.space	8
	.word	.LC427
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	line_gain
	.word	__compound_literal.89
	.word	2
	.space	8
	.word	.LC428
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	analog_gain
	.word	__compound_literal.90
	.word	2
	.space	8
	.word	.LC429
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	analog_gain
	.word	__compound_literal.91
	.word	2
	.space	8
	.word	.LC430
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	analog_gain
	.word	__compound_literal.92
	.word	2
	.space	8
	.word	.LC431
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	analog_gain
	.word	__compound_literal.93
	.word	2
	.space	8
	.word	.LC432
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	analog_gain
	.word	__compound_literal.94
	.word	2
	.space	8
	.word	.LC433
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.word	analog_gain
	.word	__compound_literal.95
	.type	impedance_detect_controls, %object
	.size	impedance_detect_controls, 96
impedance_detect_controls:
	.word	2
	.space	8
	.word	.LC418
	.space	12
	.word	snd_soc_info_volsw
	.word	taiko_hph_impedance_get
	.word	0
	.space	4
	.word	__compound_literal.96
	.word	2
	.space	8
	.word	.LC419
	.space	12
	.word	snd_soc_info_volsw
	.word	taiko_hph_impedance_get
	.word	0
	.space	4
	.word	__compound_literal.97
	.type	taiko_rx_chs, %object
	.size	taiko_rx_chs, 312
taiko_rx_chs:
	.space	10
	.short	16
	.short	0
	.space	10
	.space	10
	.short	17
	.short	1
	.space	10
	.space	10
	.short	18
	.short	2
	.space	10
	.space	10
	.short	19
	.short	3
	.space	10
	.space	10
	.short	20
	.short	4
	.space	10
	.space	10
	.short	21
	.short	5
	.space	10
	.space	10
	.short	22
	.short	6
	.space	10
	.space	10
	.short	23
	.short	7
	.space	10
	.space	10
	.short	24
	.short	8
	.space	10
	.space	10
	.short	25
	.short	9
	.space	10
	.space	10
	.short	26
	.short	10
	.space	10
	.space	10
	.short	27
	.short	11
	.space	10
	.space	10
	.short	28
	.short	12
	.space	10
	.type	taiko_tx_chs, %object
	.size	taiko_tx_chs, 384
taiko_tx_chs:
	.space	10
	.short	0
	.short	0
	.space	10
	.space	10
	.short	1
	.short	1
	.space	10
	.space	10
	.short	2
	.short	2
	.space	10
	.space	10
	.short	3
	.short	3
	.space	10
	.space	10
	.short	4
	.short	4
	.space	10
	.space	10
	.short	5
	.short	5
	.space	10
	.space	10
	.short	6
	.short	6
	.space	10
	.space	10
	.short	7
	.short	7
	.space	10
	.space	10
	.short	8
	.short	8
	.space	10
	.space	10
	.short	9
	.short	9
	.space	10
	.space	10
	.short	10
	.short	10
	.space	10
	.space	10
	.short	11
	.short	11
	.space	10
	.space	10
	.short	12
	.short	12
	.space	10
	.space	10
	.short	13
	.short	13
	.space	10
	.space	10
	.short	14
	.short	14
	.space	10
	.space	10
	.short	15
	.short	15
	.space	10
	.type	__func__.33133, %object
	.size	__func__.33133, 17
__func__.33133:
	.ascii	"taiko_setup_irqs\000"
	.space	3
	.type	__func__.32855, %object
	.size	__func__.32855, 31
__func__.32855:
	.ascii	"taiko_codec_enable_slim_chmask\000"
	.space	1
	.type	__func__.32819, %object
	.size	__func__.32819, 22
__func__.32819:
	.ascii	"taiko_esxxx_hw_params\000"
	.space	2
	.type	__func__.32756, %object
	.size	__func__.32756, 16
__func__.32756:
	.ascii	"taiko_hw_params\000"
	.type	__func__.32716, %object
	.size	__func__.32716, 25
__func__.32716:
	.ascii	"taiko_set_decimator_rate\000"
	.space	3
	.type	__func__.32692, %object
	.size	__func__.32692, 28
__func__.32692:
	.ascii	"taiko_set_interpolator_rate\000"
	.type	comp_rx_path, %object
	.size	comp_rx_path, 32
comp_rx_path:
	.word	1
	.word	1
	.word	2
	.word	2
	.word	2
	.word	2
	.word	0
	.word	3
	.type	__func__.32740, %object
	.size	__func__.32740, 27
__func__.32740:
	.ascii	"taiko_set_rxsb_port_format\000"
	.space	1
	.type	__func__.32151, %object
	.size	__func__.32151, 23
__func__.32151:
	.ascii	"taiko_codec_enable_adc\000"
	.space	1
.LC0:
	.short	426
	.byte	24
	.byte	0
	.short	431
	.byte	1
	.byte	0
	.short	437
	.byte	1
	.byte	0
	.short	425
	.byte	-1
	.byte	26
	.short	428
	.byte	-1
	.byte	-37
	.short	429
	.byte	-1
	.byte	21
	.short	693
	.byte	-1
	.byte	-127
	.short	783
	.byte	1
	.byte	1
	.short	421
	.byte	-1
	.byte	-92
	.short	430
	.byte	-1
	.byte	44
	.short	701
	.byte	-1
	.byte	-127
	.short	783
	.byte	2
	.byte	2
	.short	436
	.byte	-1
	.byte	44
	.short	403
	.byte	-1
	.byte	-4
	.short	395
	.byte	-1
	.byte	96
	.short	418
	.byte	-1
	.byte	-128
	.short	387
	.byte	-1
	.byte	-58
	.short	388
	.byte	-1
	.byte	-26
	.short	389
	.byte	-1
	.byte	2
	.short	385
	.byte	-1
	.byte	-95
	.short	402
	.byte	-1
	.byte	-1
	.short	389
	.byte	-1
	.byte	123
	.short	800
	.byte	-1
	.byte	-26
	.short	433
	.byte	-1
	.byte	-64
	.short	439
	.byte	-1
	.byte	-64
	.type	comp_shift, %object
	.size	comp_shift, 12
comp_shift:
	.word	4
	.word	0
	.word	2
	.type	comp_samp_params, %object
	.size	comp_samp_params, 72
comp_samp_params:
	.word	6
	.word	9
	.word	6
	.word	7
	.word	10
	.word	12
	.word	8
	.word	11
	.word	30
	.word	9
	.word	11
	.word	40
	.word	10
	.word	12
	.word	80
	.word	11
	.word	12
	.word	80
	.type	__func__.33237, %object
	.size	__func__.33237, 20
__func__.33237:
	.ascii	"taiko_post_reset_cb\000"
	.type	cdc_intr_ids, %object
	.size	cdc_intr_ids, 36
cdc_intr_ids:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	16
	.word	17
	.word	28
	.type	mbhc_cb, %object
	.size	mbhc_cb, 56
mbhc_cb:
	.space	20
	.word	taiko_get_cdc_type
	.space	4
	.word	taiko_setup_zdet
	.word	taiko_compute_impedance
	.space	16
	.word	taiko_get_hwdep_fw_cal
	.type	__func__.32832, %object
	.size	__func__.32832, 28
__func__.32832:
	.ascii	"taiko_esxxx_set_channel_map\000"
	.type	__func__.32636, %object
	.size	__func__.32636, 22
__func__.32636:
	.ascii	"taiko_set_channel_map\000"
	.space	2
	.type	__func__.32904, %object
	.size	__func__.32904, 35
__func__.32904:
	.ascii	"taiko_codec_enable_slimvi_feedback\000"
	.space	1
	.type	__func__.33254, %object
	.size	__func__.33254, 21
__func__.33254:
	.ascii	"taiko_get_afe_config\000"
	.space	3
	.type	taiko_pm_ops, %object
	.size	taiko_pm_ops, 92
taiko_pm_ops:
	.space	8
	.word	taiko_suspend
	.word	taiko_resume
	.space	76
	.type	taiko_dapm_widgets, %object
	.size	taiko_dapm_widgets, 22712
taiko_dapm_widgets:
	.word	1
	.word	.LC61
	.space	28
	.short	-1
	.space	46
	.word	0
	.word	0
	.space	44
	.word	7
	.word	.LC60
	.space	28
	.short	444
	.byte	4
	.space	21
	.byte	0
	.space	15
	.short	10
	.space	2
	.word	taiko_codec_enable_ear_pa
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC132
	.space	28
	.short	444
	.byte	6
	.space	21
	.byte	0
	.space	15
	.short	1
	.space	2
	.word	taiko_codec_ear_dac_event
	.word	1
	.word	dac1_switch
	.space	44
	.word	21
	.word	.LC133
	.word	.LC134
	.space	24
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	10
	.space	2
	.word	taiko_codec_enable_slimrx
	.space	52
	.word	21
	.word	.LC135
	.word	.LC136
	.space	24
	.short	-1
	.byte	2
	.space	21
	.byte	0
	.space	15
	.short	10
	.space	2
	.word	taiko_codec_enable_slimrx
	.space	52
	.word	21
	.word	.LC137
	.word	.LC138
	.space	24
	.short	-1
	.byte	4
	.space	21
	.byte	0
	.space	15
	.short	10
	.space	2
	.word	taiko_codec_enable_slimrx
	.space	52
	.word	2
	.word	.LC139
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	slim_rx_mux
	.space	44
	.word	2
	.word	.LC140
	.space	28
	.short	-1
	.byte	1
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	slim_rx_mux+48
	.space	44
	.word	2
	.word	.LC141
	.space	28
	.short	-1
	.byte	2
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	slim_rx_mux+96
	.space	44
	.word	2
	.word	.LC142
	.space	28
	.short	-1
	.byte	3
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	slim_rx_mux+144
	.space	44
	.word	2
	.word	.LC143
	.space	28
	.short	-1
	.byte	4
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	slim_rx_mux+192
	.space	44
	.word	2
	.word	.LC144
	.space	28
	.short	-1
	.byte	5
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	slim_rx_mux+240
	.space	44
	.word	2
	.word	.LC145
	.space	28
	.short	-1
	.byte	6
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	slim_rx_mux+288
	.space	44
	.word	5
	.word	.LC146
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC147
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC148
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC149
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC150
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC151
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC152
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	0
	.word	0
	.space	44
	.word	1
	.word	.LC59
	.space	28
	.short	-1
	.space	46
	.word	0
	.word	0
	.space	44
	.word	7
	.word	.LC6
	.space	28
	.short	427
	.byte	5
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_hph_pa_event
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC153
	.space	28
	.short	433
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	taiko_hphl_dac_event
	.word	1
	.word	hphl_switch
	.space	44
	.word	7
	.word	.LC7
	.space	28
	.short	427
	.byte	4
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_hph_pa_event
	.word	0
	.word	0
	.space	44
	.word	10
	.word	.LC154
	.word	0
	.space	24
	.short	439
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	taiko_hphr_dac_event
	.space	52
	.word	1
	.word	.LC155
	.space	28
	.short	-1
	.space	46
	.word	0
	.word	0
	.space	44
	.word	1
	.word	.LC156
	.space	28
	.short	-1
	.space	46
	.word	0
	.word	0
	.space	44
	.word	1
	.word	.LC157
	.space	28
	.short	-1
	.space	46
	.word	0
	.word	0
	.space	44
	.word	1
	.word	.LC158
	.space	28
	.short	-1
	.space	46
	.word	0
	.word	0
	.space	44
	.word	1
	.word	.LC159
	.space	28
	.short	-1
	.space	46
	.word	0
	.word	0
	.space	44
	.word	7
	.word	.LC160
	.space	28
	.short	458
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_lineout
	.word	0
	.word	0
	.space	44
	.word	7
	.word	.LC161
	.space	28
	.short	458
	.byte	1
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_lineout
	.word	0
	.word	0
	.space	44
	.word	7
	.word	.LC162
	.space	28
	.short	458
	.byte	2
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_lineout
	.word	0
	.word	0
	.space	44
	.word	7
	.word	.LC163
	.space	28
	.short	458
	.byte	3
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_lineout
	.word	0
	.word	0
	.space	44
	.word	7
	.word	.LC164
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	taiko_codec_enable_spk_pa
	.word	0
	.word	0
	.space	44
	.word	10
	.word	.LC165
	.word	0
	.space	24
	.short	463
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	taiko_lineout_dac_event
	.space	52
	.word	10
	.word	.LC166
	.word	0
	.space	24
	.short	467
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	taiko_lineout_dac_event
	.space	52
	.word	10
	.word	.LC167
	.word	0
	.space	24
	.short	471
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	taiko_lineout_dac_event
	.space	52
	.word	16
	.word	.LC168
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	lineout3_ground_switch
	.space	44
	.word	10
	.word	.LC169
	.word	0
	.space	24
	.short	475
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	taiko_lineout_dac_event
	.space	52
	.word	16
	.word	.LC170
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	lineout4_ground_switch
	.space	44
	.word	10
	.word	.LC171
	.word	0
	.space	24
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	taiko_spk_dac_event
	.space	52
	.word	20
	.word	.LC172
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	taiko_codec_enable_vdd_spkr
	.space	52
	.word	5
	.word	.LC173
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC174
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC175
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC176
	.space	28
	.short	783
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	3
	.space	2
	.word	taiko_codec_enable_interpolator
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC177
	.space	28
	.short	783
	.byte	1
	.space	21
	.byte	0
	.space	15
	.short	3
	.space	2
	.word	taiko_codec_enable_interpolator
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC178
	.space	28
	.short	783
	.byte	2
	.space	21
	.byte	0
	.space	15
	.short	3
	.space	2
	.word	taiko_codec_enable_interpolator
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC179
	.space	28
	.short	783
	.byte	3
	.space	21
	.byte	0
	.space	15
	.short	3
	.space	2
	.word	taiko_codec_enable_interpolator
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC180
	.space	28
	.short	783
	.byte	4
	.space	21
	.byte	0
	.space	15
	.short	3
	.space	2
	.word	taiko_codec_enable_interpolator
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC181
	.space	28
	.short	783
	.byte	5
	.space	21
	.byte	0
	.space	15
	.short	3
	.space	2
	.word	taiko_codec_enable_interpolator
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC182
	.space	28
	.short	783
	.byte	6
	.space	21
	.byte	0
	.space	15
	.short	3
	.space	2
	.word	taiko_codec_enable_interpolator
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC183
	.space	28
	.short	693
	.byte	5
	.space	21
	.byte	0
	.space	23
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC184
	.space	28
	.short	701
	.byte	5
	.space	21
	.byte	0
	.space	23
	.word	0
	.word	0
	.space	44
	.word	2
	.word	.LC185
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx_mix1_inp1_mux
	.space	44
	.word	2
	.word	.LC186
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx_mix1_inp2_mux
	.space	44
	.word	2
	.word	.LC187
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx_mix1_inp3_mux
	.space	44
	.word	2
	.word	.LC188
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx2_mix1_inp1_mux
	.space	44
	.word	2
	.word	.LC189
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx2_mix1_inp2_mux
	.space	44
	.word	2
	.word	.LC190
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx3_mix1_inp1_mux
	.space	44
	.word	2
	.word	.LC191
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx3_mix1_inp2_mux
	.space	44
	.word	2
	.word	.LC192
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx4_mix1_inp1_mux
	.space	44
	.word	2
	.word	.LC193
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx4_mix1_inp2_mux
	.space	44
	.word	2
	.word	.LC194
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx5_mix1_inp1_mux
	.space	44
	.word	2
	.word	.LC195
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx5_mix1_inp2_mux
	.space	44
	.word	2
	.word	.LC196
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx6_mix1_inp1_mux
	.space	44
	.word	2
	.word	.LC197
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx6_mix1_inp2_mux
	.space	44
	.word	2
	.word	.LC198
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx7_mix1_inp1_mux
	.space	44
	.word	2
	.word	.LC199
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx7_mix1_inp2_mux
	.space	44
	.word	2
	.word	.LC200
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx1_mix2_inp1_mux
	.space	44
	.word	2
	.word	.LC201
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx1_mix2_inp2_mux
	.space	44
	.word	2
	.word	.LC202
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx2_mix2_inp1_mux
	.space	44
	.word	2
	.word	.LC203
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx2_mix2_inp2_mux
	.space	44
	.word	2
	.word	.LC204
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx7_mix2_inp1_mux
	.space	44
	.word	2
	.word	.LC205
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx7_mix2_inp2_mux
	.space	44
	.word	2
	.word	.LC206
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx_dac5_mux
	.space	44
	.word	2
	.word	.LC207
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	rx_dac7_mux
	.space	44
	.word	2
	.word	.LC208
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	10
	.space	2
	.word	taiko_codec_dsm_mux_event
	.word	1
	.word	class_h_dsm_mux
	.space	44
	.word	20
	.word	.LC209
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	taiko_codec_enable_rx_bias
	.space	52
	.word	20
	.word	.LC210
	.space	28
	.short	780
	.byte	5
	.space	21
	.byte	0
	.space	15
	.short	0
	.space	2
	.word	0
	.space	52
	.word	20
	.word	.LC211
	.space	28
	.short	780
	.byte	2
	.space	21
	.byte	0
	.space	15
	.short	0
	.space	2
	.word	0
	.space	52
	.word	20
	.word	.LC212
	.space	28
	.short	-1
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	taiko_codec_enable_ldo_h
	.space	52
	.word	20
	.word	.LC213
	.space	28
	.short	-1
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	__taiko_codec_enable_ldo_h
	.space	52
	.word	20
	.word	.LC214
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	5
	.space	2
	.word	taiko_config_compander
	.space	52
	.word	20
	.word	.LC215
	.space	28
	.short	-1
	.byte	1
	.space	21
	.byte	0
	.space	15
	.short	5
	.space	2
	.word	taiko_config_compander
	.space	52
	.word	20
	.word	.LC216
	.space	28
	.short	-1
	.byte	2
	.space	21
	.byte	0
	.space	15
	.short	5
	.space	2
	.word	taiko_config_compander
	.space	52
	.word	0
	.word	.LC217
	.space	28
	.short	-1
	.space	46
	.word	0
	.word	0
	.space	44
	.word	11
	.word	.LC218
	.space	28
	.short	-1
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_micbias
	.word	0
	.word	0
	.space	44
	.word	11
	.word	.LC219
	.space	28
	.short	-1
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_micbias
	.word	0
	.word	0
	.space	44
	.word	11
	.word	.LC220
	.space	28
	.short	-1
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_micbias
	.word	0
	.word	0
	.space	44
	.word	11
	.word	.LC221
	.space	28
	.short	0
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	0
	.word	0
	.word	0
	.space	44
	.word	0
	.word	.LC222
	.space	28
	.short	-1
	.space	46
	.word	0
	.word	0
	.space	44
	.word	0
	.word	.LC223
	.space	28
	.short	-1
	.space	46
	.word	0
	.word	0
	.space	44
	.word	0
	.word	.LC224
	.space	28
	.short	-1
	.space	46
	.word	0
	.word	0
	.space	44
	.word	0
	.word	.LC225
	.space	28
	.short	-1
	.space	46
	.word	0
	.word	0
	.space	44
	.word	2
	.word	.LC226
	.space	28
	.short	778
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	15
	.space	2
	.word	taiko_codec_enable_dec
	.word	1
	.word	dec1_mux
	.space	44
	.word	2
	.word	.LC227
	.space	28
	.short	778
	.byte	1
	.space	21
	.byte	0
	.space	15
	.short	15
	.space	2
	.word	taiko_codec_enable_dec
	.word	1
	.word	dec2_mux
	.space	44
	.word	2
	.word	.LC228
	.space	28
	.short	778
	.byte	2
	.space	21
	.byte	0
	.space	15
	.short	15
	.space	2
	.word	taiko_codec_enable_dec
	.word	1
	.word	dec3_mux
	.space	44
	.word	2
	.word	.LC229
	.space	28
	.short	778
	.byte	3
	.space	21
	.byte	0
	.space	15
	.short	15
	.space	2
	.word	taiko_codec_enable_dec
	.word	1
	.word	dec4_mux
	.space	44
	.word	2
	.word	.LC230
	.space	28
	.short	778
	.byte	4
	.space	21
	.byte	0
	.space	15
	.short	15
	.space	2
	.word	taiko_codec_enable_dec
	.word	1
	.word	dec5_mux
	.space	44
	.word	2
	.word	.LC231
	.space	28
	.short	778
	.byte	5
	.space	21
	.byte	0
	.space	15
	.short	15
	.space	2
	.word	taiko_codec_enable_dec
	.word	1
	.word	dec6_mux
	.space	44
	.word	2
	.word	.LC232
	.space	28
	.short	778
	.byte	6
	.space	21
	.byte	0
	.space	15
	.short	15
	.space	2
	.word	taiko_codec_enable_dec
	.word	1
	.word	dec7_mux
	.space	44
	.word	2
	.word	.LC233
	.space	28
	.short	778
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	15
	.space	2
	.word	taiko_codec_enable_dec
	.word	1
	.word	dec8_mux
	.space	44
	.word	2
	.word	.LC234
	.space	28
	.short	779
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	15
	.space	2
	.word	taiko_codec_enable_dec
	.word	1
	.word	dec9_mux
	.space	44
	.word	2
	.word	.LC235
	.space	28
	.short	779
	.byte	1
	.space	21
	.byte	0
	.space	15
	.short	15
	.space	2
	.word	taiko_codec_enable_dec
	.word	1
	.word	dec10_mux
	.space	44
	.word	2
	.word	.LC236
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	anc1_mux
	.space	44
	.word	2
	.word	.LC237
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	anc2_mux
	.space	44
	.word	1
	.word	.LC56
	.space	28
	.short	-1
	.space	46
	.word	0
	.word	0
	.space	44
	.word	7
	.word	.LC55
	.space	28
	.short	-1
	.byte	5
	.space	21
	.byte	0
	.space	15
	.short	15
	.space	2
	.word	taiko_codec_enable_anc_hph
	.word	0
	.word	0
	.space	44
	.word	7
	.word	.LC54
	.space	28
	.short	-1
	.byte	4
	.space	21
	.byte	0
	.space	15
	.short	15
	.space	2
	.word	taiko_codec_enable_anc_hph
	.word	0
	.word	0
	.space	44
	.word	1
	.word	.LC58
	.space	28
	.short	-1
	.space	46
	.word	0
	.word	0
	.space	44
	.word	7
	.word	.LC57
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	15
	.space	2
	.word	taiko_codec_enable_anc_ear
	.word	0
	.word	0
	.space	44
	.word	2
	.word	.LC238
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	anc1_fb_mux
	.space	44
	.word	0
	.word	.LC239
	.space	28
	.short	-1
	.space	46
	.word	0
	.word	0
	.space	44
	.word	11
	.word	.LC63
	.space	28
	.short	-1
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_micbias
	.word	0
	.word	0
	.space	44
	.word	11
	.word	.LC240
	.space	28
	.short	-1
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_micbias
	.word	0
	.word	0
	.space	44
	.word	11
	.word	.LC241
	.space	28
	.short	-1
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_micbias
	.word	0
	.word	0
	.space	44
	.word	11
	.word	.LC242
	.space	28
	.short	-1
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_micbias
	.word	0
	.word	0
	.space	44
	.word	11
	.word	.LC243
	.space	28
	.short	-1
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_micbias
	.word	0
	.word	0
	.space	44
	.word	11
	.word	.LC62
	.space	28
	.short	-1
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_micbias
	.word	0
	.word	0
	.space	44
	.word	11
	.word	.LC244
	.space	28
	.short	-1
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_micbias
	.word	0
	.word	0
	.space	44
	.word	11
	.word	.LC245
	.space	28
	.short	-1
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_micbias
	.word	0
	.word	0
	.space	44
	.word	11
	.word	.LC246
	.space	28
	.short	-1
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_micbias
	.word	0
	.word	0
	.space	44
	.word	11
	.word	.LC247
	.space	28
	.short	-1
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	taiko_codec_enable_micbias
	.word	0
	.word	0
	.space	44
	.word	11
	.word	.LC248
	.space	28
	.short	0
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	11
	.space	2
	.word	0
	.word	0
	.word	0
	.space	44
	.word	22
	.word	.LC249
	.word	.LC250
	.space	24
	.short	-1
	.byte	1
	.space	21
	.byte	0
	.space	15
	.short	10
	.space	2
	.word	taiko_codec_enable_slimtx
	.space	52
	.word	22
	.word	.LC251
	.word	.LC252
	.space	24
	.short	-1
	.byte	3
	.space	21
	.byte	0
	.space	15
	.short	10
	.space	2
	.word	taiko_codec_enable_slimtx
	.space	52
	.word	22
	.word	.LC253
	.word	.LC254
	.space	24
	.short	-1
	.byte	5
	.space	21
	.byte	0
	.space	15
	.short	10
	.space	2
	.word	taiko_codec_enable_slimtx
	.space	52
	.word	22
	.word	.LC255
	.word	.LC256
	.space	24
	.short	-1
	.byte	6
	.space	21
	.byte	0
	.space	15
	.short	10
	.space	2
	.word	taiko_codec_enable_slimvi_feedback
	.space	52
	.word	22
	.word	.LC257
	.word	.LC258
	.space	24
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	1
	.space	2
	.word	taiko_codec_enable_mad
	.space	52
	.word	16
	.word	.LC259
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	aif4_mad_switch
	.space	44
	.word	0
	.word	.LC260
	.space	28
	.short	-1
	.space	46
	.word	0
	.word	0
	.space	44
	.word	5
	.word	.LC261
	.space	28
	.short	-1
	.byte	1
	.space	21
	.byte	0
	.space	23
	.word	10
	.word	aif_cap_mixer
	.space	44
	.word	5
	.word	.LC262
	.space	28
	.short	-1
	.byte	3
	.space	21
	.byte	0
	.space	23
	.word	10
	.word	aif_cap_mixer
	.space	44
	.word	5
	.word	.LC263
	.space	28
	.short	-1
	.byte	5
	.space	21
	.byte	0
	.space	23
	.word	10
	.word	aif_cap_mixer
	.space	44
	.word	2
	.word	.LC264
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	sb_tx1_mux
	.space	44
	.word	2
	.word	.LC265
	.space	28
	.short	-1
	.byte	1
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	sb_tx2_mux
	.space	44
	.word	2
	.word	.LC266
	.space	28
	.short	-1
	.byte	2
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	sb_tx3_mux
	.space	44
	.word	2
	.word	.LC267
	.space	28
	.short	-1
	.byte	3
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	sb_tx4_mux
	.space	44
	.word	2
	.word	.LC268
	.space	28
	.short	-1
	.byte	4
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	sb_tx5_mux
	.space	44
	.word	2
	.word	.LC269
	.space	28
	.short	-1
	.byte	5
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	sb_tx6_mux
	.space	44
	.word	2
	.word	.LC270
	.space	28
	.short	-1
	.byte	6
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	sb_tx7_mux
	.space	44
	.word	2
	.word	.LC271
	.space	28
	.short	-1
	.byte	7
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	sb_tx8_mux
	.space	44
	.word	2
	.word	.LC272
	.space	28
	.short	-1
	.byte	8
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	sb_tx9_mux
	.space	44
	.word	2
	.word	.LC273
	.space	28
	.short	-1
	.byte	9
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	sb_tx10_mux
	.space	44
	.word	9
	.word	.LC274
	.word	0
	.space	24
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	taiko_codec_enable_dmic
	.space	52
	.word	9
	.word	.LC275
	.word	0
	.space	24
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	taiko_codec_enable_dmic
	.space	52
	.word	9
	.word	.LC276
	.word	0
	.space	24
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	taiko_codec_enable_dmic
	.space	52
	.word	9
	.word	.LC277
	.word	0
	.space	24
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	taiko_codec_enable_dmic
	.space	52
	.word	9
	.word	.LC278
	.word	0
	.space	24
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	taiko_codec_enable_dmic
	.space	52
	.word	9
	.word	.LC279
	.word	0
	.space	24
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	taiko_codec_enable_dmic
	.space	52
	.word	2
	.word	.LC280
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	iir1_inp1_mux
	.space	44
	.word	5
	.word	.LC281
	.space	28
	.short	787
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	0
	.word	0
	.space	44
	.word	2
	.word	.LC282
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	iir2_inp1_mux
	.space	44
	.word	5
	.word	.LC283
	.space	28
	.short	787
	.byte	1
	.space	21
	.byte	0
	.space	23
	.word	0
	.word	0
	.space	44
	.word	9
	.word	.LC284
	.word	0
	.space	24
	.short	411
	.byte	7
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	taiko_codec_enable_aux_pga
	.space	52
	.word	9
	.word	.LC285
	.word	0
	.space	24
	.short	411
	.byte	6
	.space	21
	.byte	0
	.space	15
	.short	9
	.space	2
	.word	taiko_codec_enable_aux_pga
	.space	52
	.word	5
	.word	.LC286
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	ear_pa_mix
	.space	44
	.word	5
	.word	.LC287
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	hphl_pa_mix
	.space	44
	.word	5
	.word	.LC288
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	hphr_pa_mix
	.space	44
	.word	5
	.word	.LC289
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	lineout1_pa_mix
	.space	44
	.word	5
	.word	.LC290
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	lineout2_pa_mix
	.space	44
	.word	5
	.word	.LC291
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	lineout3_pa_mix
	.space	44
	.word	5
	.word	.LC292
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	lineout4_pa_mix
	.space	44
	.word	16
	.word	.LC293
	.space	28
	.short	-1
	.byte	0
	.space	21
	.byte	0
	.space	23
	.word	1
	.word	aif4_vi_switch
	.space	44
	.word	0
	.word	.LC294
	.space	28
	.short	-1
	.space	46
	.word	0
	.word	0
	.space	44
	.type	audio_map, %object
	.size	audio_map, 7728
audio_map:
	.word	.LC249
	.word	0
	.word	.LC261
	.space	4
	.word	.LC251
	.word	0
	.word	.LC262
	.space	4
	.word	.LC253
	.word	0
	.word	.LC263
	.space	4
	.word	.LC255
	.word	0
	.word	.LC293
	.space	4
	.word	.LC293
	.word	.LC307
	.word	.LC294
	.space	4
	.word	.LC257
	.word	0
	.word	.LC211
	.space	4
	.word	.LC259
	.word	.LC307
	.word	.LC260
	.space	4
	.word	.LC257
	.word	0
	.word	.LC259
	.space	4
	.word	.LC261
	.word	.LC308
	.word	.LC264
	.space	4
	.word	.LC261
	.word	.LC309
	.word	.LC265
	.space	4
	.word	.LC261
	.word	.LC310
	.word	.LC266
	.space	4
	.word	.LC261
	.word	.LC311
	.word	.LC267
	.space	4
	.word	.LC261
	.word	.LC312
	.word	.LC268
	.space	4
	.word	.LC261
	.word	.LC313
	.word	.LC269
	.space	4
	.word	.LC261
	.word	.LC314
	.word	.LC270
	.space	4
	.word	.LC261
	.word	.LC315
	.word	.LC271
	.space	4
	.word	.LC261
	.word	.LC316
	.word	.LC272
	.space	4
	.word	.LC261
	.word	.LC317
	.word	.LC273
	.space	4
	.word	.LC262
	.word	.LC308
	.word	.LC264
	.space	4
	.word	.LC262
	.word	.LC309
	.word	.LC265
	.space	4
	.word	.LC262
	.word	.LC310
	.word	.LC266
	.space	4
	.word	.LC262
	.word	.LC311
	.word	.LC267
	.space	4
	.word	.LC262
	.word	.LC312
	.word	.LC268
	.space	4
	.word	.LC262
	.word	.LC313
	.word	.LC269
	.space	4
	.word	.LC262
	.word	.LC314
	.word	.LC270
	.space	4
	.word	.LC262
	.word	.LC315
	.word	.LC271
	.space	4
	.word	.LC262
	.word	.LC316
	.word	.LC272
	.space	4
	.word	.LC262
	.word	.LC317
	.word	.LC273
	.space	4
	.word	.LC263
	.word	.LC308
	.word	.LC264
	.space	4
	.word	.LC263
	.word	.LC309
	.word	.LC265
	.space	4
	.word	.LC263
	.word	.LC310
	.word	.LC266
	.space	4
	.word	.LC263
	.word	.LC311
	.word	.LC267
	.space	4
	.word	.LC263
	.word	.LC312
	.word	.LC268
	.space	4
	.word	.LC263
	.word	.LC313
	.word	.LC269
	.space	4
	.word	.LC263
	.word	.LC314
	.word	.LC270
	.space	4
	.word	.LC263
	.word	.LC315
	.word	.LC271
	.space	4
	.word	.LC263
	.word	.LC316
	.word	.LC272
	.space	4
	.word	.LC263
	.word	.LC317
	.word	.LC273
	.space	4
	.word	.LC264
	.word	.LC318
	.word	.LC226
	.space	4
	.word	.LC265
	.word	.LC319
	.word	.LC227
	.space	4
	.word	.LC266
	.word	.LC320
	.word	.LC228
	.space	4
	.word	.LC266
	.word	.LC321
	.word	.LC173
	.space	4
	.word	.LC266
	.word	.LC322
	.word	.LC174
	.space	4
	.word	.LC266
	.word	.LC323
	.word	.LC178
	.space	4
	.word	.LC266
	.word	.LC324
	.word	.LC179
	.space	4
	.word	.LC266
	.word	.LC325
	.word	.LC180
	.space	4
	.word	.LC266
	.word	.LC326
	.word	.LC181
	.space	4
	.word	.LC266
	.word	.LC327
	.word	.LC175
	.space	4
	.word	.LC267
	.word	.LC328
	.word	.LC229
	.space	4
	.word	.LC268
	.word	.LC329
	.word	.LC230
	.space	4
	.word	.LC268
	.word	.LC321
	.word	.LC173
	.space	4
	.word	.LC268
	.word	.LC322
	.word	.LC174
	.space	4
	.word	.LC268
	.word	.LC323
	.word	.LC178
	.space	4
	.word	.LC268
	.word	.LC324
	.word	.LC179
	.space	4
	.word	.LC268
	.word	.LC325
	.word	.LC180
	.space	4
	.word	.LC268
	.word	.LC326
	.word	.LC181
	.space	4
	.word	.LC268
	.word	.LC327
	.word	.LC175
	.space	4
	.word	.LC269
	.word	.LC330
	.word	.LC231
	.space	4
	.word	.LC270
	.word	.LC318
	.word	.LC226
	.space	4
	.word	.LC270
	.word	.LC319
	.word	.LC227
	.space	4
	.word	.LC270
	.word	.LC320
	.word	.LC228
	.space	4
	.word	.LC270
	.word	.LC328
	.word	.LC229
	.space	4
	.word	.LC270
	.word	.LC329
	.word	.LC230
	.space	4
	.word	.LC270
	.word	.LC330
	.word	.LC231
	.space	4
	.word	.LC270
	.word	.LC331
	.word	.LC232
	.space	4
	.word	.LC270
	.word	.LC332
	.word	.LC233
	.space	4
	.word	.LC270
	.word	.LC333
	.word	.LC234
	.space	4
	.word	.LC270
	.word	.LC334
	.word	.LC235
	.space	4
	.word	.LC270
	.word	.LC321
	.word	.LC173
	.space	4
	.word	.LC270
	.word	.LC322
	.word	.LC174
	.space	4
	.word	.LC270
	.word	.LC323
	.word	.LC178
	.space	4
	.word	.LC270
	.word	.LC324
	.word	.LC179
	.space	4
	.word	.LC270
	.word	.LC325
	.word	.LC180
	.space	4
	.word	.LC270
	.word	.LC326
	.word	.LC181
	.space	4
	.word	.LC270
	.word	.LC327
	.word	.LC175
	.space	4
	.word	.LC271
	.word	.LC318
	.word	.LC226
	.space	4
	.word	.LC271
	.word	.LC319
	.word	.LC227
	.space	4
	.word	.LC271
	.word	.LC320
	.word	.LC228
	.space	4
	.word	.LC271
	.word	.LC328
	.word	.LC229
	.space	4
	.word	.LC271
	.word	.LC329
	.word	.LC230
	.space	4
	.word	.LC271
	.word	.LC330
	.word	.LC231
	.space	4
	.word	.LC271
	.word	.LC331
	.word	.LC232
	.space	4
	.word	.LC271
	.word	.LC332
	.word	.LC233
	.space	4
	.word	.LC271
	.word	.LC333
	.word	.LC234
	.space	4
	.word	.LC271
	.word	.LC334
	.word	.LC235
	.space	4
	.word	.LC272
	.word	.LC318
	.word	.LC226
	.space	4
	.word	.LC272
	.word	.LC319
	.word	.LC227
	.space	4
	.word	.LC272
	.word	.LC320
	.word	.LC228
	.space	4
	.word	.LC272
	.word	.LC328
	.word	.LC229
	.space	4
	.word	.LC272
	.word	.LC329
	.word	.LC230
	.space	4
	.word	.LC272
	.word	.LC330
	.word	.LC231
	.space	4
	.word	.LC272
	.word	.LC331
	.word	.LC232
	.space	4
	.word	.LC272
	.word	.LC332
	.word	.LC233
	.space	4
	.word	.LC272
	.word	.LC333
	.word	.LC234
	.space	4
	.word	.LC272
	.word	.LC334
	.word	.LC235
	.space	4
	.word	.LC273
	.word	.LC318
	.word	.LC226
	.space	4
	.word	.LC273
	.word	.LC319
	.word	.LC227
	.space	4
	.word	.LC273
	.word	.LC320
	.word	.LC228
	.space	4
	.word	.LC273
	.word	.LC328
	.word	.LC229
	.space	4
	.word	.LC273
	.word	.LC329
	.word	.LC230
	.space	4
	.word	.LC273
	.word	.LC330
	.word	.LC231
	.space	4
	.word	.LC273
	.word	.LC331
	.word	.LC232
	.space	4
	.word	.LC273
	.word	.LC332
	.word	.LC233
	.space	4
	.word	.LC273
	.word	.LC333
	.word	.LC234
	.space	4
	.word	.LC273
	.word	.LC334
	.word	.LC235
	.space	4
	.word	.LC61
	.word	0
	.word	.LC60
	.space	4
	.word	.LC60
	.word	0
	.word	.LC286
	.space	4
	.word	.LC286
	.word	0
	.word	.LC132
	.space	4
	.word	.LC132
	.word	0
	.word	.LC209
	.space	4
	.word	.LC58
	.word	0
	.word	.LC57
	.space	4
	.word	.LC57
	.word	0
	.word	.LC286
	.space	4
	.word	.LC238
	.word	.LC335
	.word	.LC176
	.space	4
	.word	.LC238
	.word	.LC336
	.word	.LC177
	.space	4
	.word	.LC59
	.word	0
	.word	.LC6
	.space	4
	.word	.LC59
	.word	0
	.word	.LC7
	.space	4
	.word	.LC6
	.word	0
	.word	.LC287
	.space	4
	.word	.LC287
	.word	0
	.word	.LC153
	.space	4
	.word	.LC153
	.word	0
	.word	.LC209
	.space	4
	.word	.LC7
	.word	0
	.word	.LC288
	.space	4
	.word	.LC288
	.word	0
	.word	.LC154
	.space	4
	.word	.LC154
	.word	0
	.word	.LC209
	.space	4
	.word	.LC56
	.word	0
	.word	.LC55
	.space	4
	.word	.LC56
	.word	0
	.word	.LC54
	.space	4
	.word	.LC55
	.word	0
	.word	.LC287
	.space	4
	.word	.LC54
	.word	0
	.word	.LC288
	.space	4
	.word	.LC236
	.word	.LC126
	.word	.LC126
	.space	4
	.word	.LC236
	.word	.LC127
	.word	.LC127
	.space	4
	.word	.LC236
	.word	.LC128
	.word	.LC128
	.space	4
	.word	.LC236
	.word	.LC129
	.word	.LC129
	.space	4
	.word	.LC236
	.word	.LC274
	.word	.LC274
	.space	4
	.word	.LC236
	.word	.LC275
	.word	.LC275
	.space	4
	.word	.LC236
	.word	.LC276
	.word	.LC276
	.space	4
	.word	.LC236
	.word	.LC277
	.word	.LC277
	.space	4
	.word	.LC236
	.word	.LC278
	.word	.LC278
	.space	4
	.word	.LC236
	.word	.LC279
	.word	.LC279
	.space	4
	.word	.LC237
	.word	.LC126
	.word	.LC126
	.space	4
	.word	.LC237
	.word	.LC127
	.word	.LC127
	.space	4
	.word	.LC237
	.word	.LC128
	.word	.LC128
	.space	4
	.word	.LC237
	.word	.LC129
	.word	.LC129
	.space	4
	.word	.LC54
	.word	0
	.word	.LC211
	.space	4
	.word	.LC132
	.word	.LC307
	.word	.LC208
	.space	4
	.word	.LC153
	.word	.LC307
	.word	.LC208
	.space	4
	.word	.LC154
	.word	0
	.word	.LC184
	.space	4
	.word	.LC155
	.word	0
	.word	.LC160
	.space	4
	.word	.LC156
	.word	0
	.word	.LC161
	.space	4
	.word	.LC157
	.word	0
	.word	.LC162
	.space	4
	.word	.LC158
	.word	0
	.word	.LC163
	.space	4
	.word	.LC159
	.word	0
	.word	.LC164
	.space	4
	.word	.LC160
	.word	0
	.word	.LC289
	.space	4
	.word	.LC289
	.word	0
	.word	.LC165
	.space	4
	.word	.LC161
	.word	0
	.word	.LC290
	.space	4
	.word	.LC290
	.word	0
	.word	.LC166
	.space	4
	.word	.LC162
	.word	0
	.word	.LC291
	.space	4
	.word	.LC291
	.word	0
	.word	.LC167
	.space	4
	.word	.LC163
	.word	0
	.word	.LC292
	.space	4
	.word	.LC292
	.word	0
	.word	.LC169
	.space	4
	.word	.LC165
	.word	0
	.word	.LC178
	.space	4
	.word	.LC206
	.word	.LC337
	.word	.LC178
	.space	4
	.word	.LC206
	.word	.LC338
	.word	.LC179
	.space	4
	.word	.LC167
	.word	0
	.word	.LC206
	.space	4
	.word	.LC166
	.word	0
	.word	.LC180
	.space	4
	.word	.LC207
	.word	.LC339
	.word	.LC180
	.space	4
	.word	.LC207
	.word	.LC340
	.word	.LC181
	.space	4
	.word	.LC169
	.word	0
	.word	.LC207
	.space	4
	.word	.LC164
	.word	0
	.word	.LC171
	.space	4
	.word	.LC171
	.word	0
	.word	.LC182
	.space	4
	.word	.LC171
	.word	0
	.word	.LC172
	.space	4
	.word	.LC208
	.word	.LC341
	.word	.LC183
	.space	4
	.word	.LC183
	.word	0
	.word	.LC176
	.space	4
	.word	.LC184
	.word	0
	.word	.LC177
	.space	4
	.word	.LC176
	.word	0
	.word	.LC236
	.space	4
	.word	.LC177
	.word	0
	.word	.LC237
	.space	4
	.word	.LC165
	.word	0
	.word	.LC209
	.space	4
	.word	.LC166
	.word	0
	.word	.LC209
	.space	4
	.word	.LC167
	.word	0
	.word	.LC209
	.space	4
	.word	.LC169
	.word	0
	.word	.LC209
	.space	4
	.word	.LC171
	.word	0
	.word	.LC209
	.space	4
	.word	.LC175
	.word	0
	.word	.LC214
	.space	4
	.word	.LC173
	.word	0
	.word	.LC215
	.space	4
	.word	.LC174
	.word	0
	.word	.LC215
	.space	4
	.word	.LC178
	.word	0
	.word	.LC216
	.space	4
	.word	.LC180
	.word	0
	.word	.LC216
	.space	4
	.word	.LC173
	.word	0
	.word	.LC185
	.space	4
	.word	.LC173
	.word	0
	.word	.LC186
	.space	4
	.word	.LC173
	.word	0
	.word	.LC187
	.space	4
	.word	.LC174
	.word	0
	.word	.LC188
	.space	4
	.word	.LC174
	.word	0
	.word	.LC189
	.space	4
	.word	.LC178
	.word	0
	.word	.LC190
	.space	4
	.word	.LC178
	.word	0
	.word	.LC191
	.space	4
	.word	.LC179
	.word	0
	.word	.LC192
	.space	4
	.word	.LC179
	.word	0
	.word	.LC193
	.space	4
	.word	.LC180
	.word	0
	.word	.LC194
	.space	4
	.word	.LC180
	.word	0
	.word	.LC195
	.space	4
	.word	.LC181
	.word	0
	.word	.LC196
	.space	4
	.word	.LC181
	.word	0
	.word	.LC197
	.space	4
	.word	.LC175
	.word	0
	.word	.LC198
	.space	4
	.word	.LC175
	.word	0
	.word	.LC199
	.space	4
	.word	.LC176
	.word	0
	.word	.LC173
	.space	4
	.word	.LC176
	.word	0
	.word	.LC200
	.space	4
	.word	.LC176
	.word	0
	.word	.LC201
	.space	4
	.word	.LC177
	.word	0
	.word	.LC174
	.space	4
	.word	.LC177
	.word	0
	.word	.LC202
	.space	4
	.word	.LC177
	.word	0
	.word	.LC203
	.space	4
	.word	.LC182
	.word	0
	.word	.LC175
	.space	4
	.word	.LC182
	.word	0
	.word	.LC204
	.space	4
	.word	.LC182
	.word	0
	.word	.LC205
	.space	4
	.word	.LC139
	.word	.LC342
	.word	.LC133
	.space	4
	.word	.LC140
	.word	.LC342
	.word	.LC133
	.space	4
	.word	.LC141
	.word	.LC342
	.word	.LC133
	.space	4
	.word	.LC142
	.word	.LC342
	.word	.LC133
	.space	4
	.word	.LC143
	.word	.LC342
	.word	.LC133
	.space	4
	.word	.LC144
	.word	.LC342
	.word	.LC133
	.space	4
	.word	.LC145
	.word	.LC342
	.word	.LC133
	.space	4
	.word	.LC139
	.word	.LC343
	.word	.LC135
	.space	4
	.word	.LC140
	.word	.LC343
	.word	.LC135
	.space	4
	.word	.LC141
	.word	.LC343
	.word	.LC135
	.space	4
	.word	.LC142
	.word	.LC343
	.word	.LC135
	.space	4
	.word	.LC143
	.word	.LC343
	.word	.LC135
	.space	4
	.word	.LC144
	.word	.LC343
	.word	.LC135
	.space	4
	.word	.LC145
	.word	.LC343
	.word	.LC135
	.space	4
	.word	.LC139
	.word	.LC344
	.word	.LC137
	.space	4
	.word	.LC140
	.word	.LC344
	.word	.LC137
	.space	4
	.word	.LC141
	.word	.LC344
	.word	.LC137
	.space	4
	.word	.LC142
	.word	.LC344
	.word	.LC137
	.space	4
	.word	.LC143
	.word	.LC344
	.word	.LC137
	.space	4
	.word	.LC144
	.word	.LC344
	.word	.LC137
	.space	4
	.word	.LC145
	.word	.LC344
	.word	.LC137
	.space	4
	.word	.LC146
	.word	0
	.word	.LC139
	.space	4
	.word	.LC147
	.word	0
	.word	.LC140
	.space	4
	.word	.LC148
	.word	0
	.word	.LC141
	.space	4
	.word	.LC149
	.word	0
	.word	.LC142
	.space	4
	.word	.LC150
	.word	0
	.word	.LC143
	.space	4
	.word	.LC151
	.word	0
	.word	.LC144
	.space	4
	.word	.LC152
	.word	0
	.word	.LC145
	.space	4
	.word	.LC185
	.word	.LC345
	.word	.LC146
	.space	4
	.word	.LC185
	.word	.LC346
	.word	.LC147
	.space	4
	.word	.LC185
	.word	.LC347
	.word	.LC148
	.space	4
	.word	.LC185
	.word	.LC348
	.word	.LC149
	.space	4
	.word	.LC185
	.word	.LC349
	.word	.LC150
	.space	4
	.word	.LC185
	.word	.LC350
	.word	.LC151
	.space	4
	.word	.LC185
	.word	.LC351
	.word	.LC152
	.space	4
	.word	.LC185
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC185
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC186
	.word	.LC345
	.word	.LC146
	.space	4
	.word	.LC186
	.word	.LC346
	.word	.LC147
	.space	4
	.word	.LC186
	.word	.LC347
	.word	.LC148
	.space	4
	.word	.LC186
	.word	.LC348
	.word	.LC149
	.space	4
	.word	.LC186
	.word	.LC349
	.word	.LC150
	.space	4
	.word	.LC186
	.word	.LC350
	.word	.LC151
	.space	4
	.word	.LC186
	.word	.LC351
	.word	.LC152
	.space	4
	.word	.LC186
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC186
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC187
	.word	.LC345
	.word	.LC146
	.space	4
	.word	.LC187
	.word	.LC346
	.word	.LC147
	.space	4
	.word	.LC187
	.word	.LC347
	.word	.LC148
	.space	4
	.word	.LC187
	.word	.LC348
	.word	.LC149
	.space	4
	.word	.LC187
	.word	.LC349
	.word	.LC150
	.space	4
	.word	.LC187
	.word	.LC350
	.word	.LC151
	.space	4
	.word	.LC187
	.word	.LC351
	.word	.LC152
	.space	4
	.word	.LC188
	.word	.LC345
	.word	.LC146
	.space	4
	.word	.LC188
	.word	.LC346
	.word	.LC147
	.space	4
	.word	.LC188
	.word	.LC347
	.word	.LC148
	.space	4
	.word	.LC188
	.word	.LC348
	.word	.LC149
	.space	4
	.word	.LC188
	.word	.LC349
	.word	.LC150
	.space	4
	.word	.LC188
	.word	.LC350
	.word	.LC151
	.space	4
	.word	.LC188
	.word	.LC351
	.word	.LC152
	.space	4
	.word	.LC188
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC188
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC189
	.word	.LC345
	.word	.LC146
	.space	4
	.word	.LC189
	.word	.LC346
	.word	.LC147
	.space	4
	.word	.LC189
	.word	.LC347
	.word	.LC148
	.space	4
	.word	.LC189
	.word	.LC348
	.word	.LC149
	.space	4
	.word	.LC189
	.word	.LC349
	.word	.LC150
	.space	4
	.word	.LC189
	.word	.LC350
	.word	.LC151
	.space	4
	.word	.LC189
	.word	.LC351
	.word	.LC152
	.space	4
	.word	.LC189
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC189
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC190
	.word	.LC345
	.word	.LC146
	.space	4
	.word	.LC190
	.word	.LC346
	.word	.LC147
	.space	4
	.word	.LC190
	.word	.LC347
	.word	.LC148
	.space	4
	.word	.LC190
	.word	.LC348
	.word	.LC149
	.space	4
	.word	.LC190
	.word	.LC349
	.word	.LC150
	.space	4
	.word	.LC190
	.word	.LC350
	.word	.LC151
	.space	4
	.word	.LC190
	.word	.LC351
	.word	.LC152
	.space	4
	.word	.LC190
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC190
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC191
	.word	.LC345
	.word	.LC146
	.space	4
	.word	.LC191
	.word	.LC346
	.word	.LC147
	.space	4
	.word	.LC191
	.word	.LC347
	.word	.LC148
	.space	4
	.word	.LC191
	.word	.LC348
	.word	.LC149
	.space	4
	.word	.LC191
	.word	.LC349
	.word	.LC150
	.space	4
	.word	.LC191
	.word	.LC350
	.word	.LC151
	.space	4
	.word	.LC191
	.word	.LC351
	.word	.LC152
	.space	4
	.word	.LC191
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC191
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC192
	.word	.LC345
	.word	.LC146
	.space	4
	.word	.LC192
	.word	.LC346
	.word	.LC147
	.space	4
	.word	.LC192
	.word	.LC347
	.word	.LC148
	.space	4
	.word	.LC192
	.word	.LC348
	.word	.LC149
	.space	4
	.word	.LC192
	.word	.LC349
	.word	.LC150
	.space	4
	.word	.LC192
	.word	.LC350
	.word	.LC151
	.space	4
	.word	.LC192
	.word	.LC351
	.word	.LC152
	.space	4
	.word	.LC192
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC192
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC193
	.word	.LC345
	.word	.LC146
	.space	4
	.word	.LC193
	.word	.LC346
	.word	.LC147
	.space	4
	.word	.LC193
	.word	.LC347
	.word	.LC148
	.space	4
	.word	.LC193
	.word	.LC349
	.word	.LC150
	.space	4
	.word	.LC193
	.word	.LC348
	.word	.LC149
	.space	4
	.word	.LC193
	.word	.LC350
	.word	.LC151
	.space	4
	.word	.LC193
	.word	.LC351
	.word	.LC152
	.space	4
	.word	.LC193
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC193
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC194
	.word	.LC345
	.word	.LC146
	.space	4
	.word	.LC194
	.word	.LC346
	.word	.LC147
	.space	4
	.word	.LC194
	.word	.LC347
	.word	.LC148
	.space	4
	.word	.LC194
	.word	.LC348
	.word	.LC149
	.space	4
	.word	.LC194
	.word	.LC349
	.word	.LC150
	.space	4
	.word	.LC194
	.word	.LC350
	.word	.LC151
	.space	4
	.word	.LC194
	.word	.LC351
	.word	.LC152
	.space	4
	.word	.LC194
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC194
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC195
	.word	.LC345
	.word	.LC146
	.space	4
	.word	.LC195
	.word	.LC346
	.word	.LC147
	.space	4
	.word	.LC195
	.word	.LC347
	.word	.LC148
	.space	4
	.word	.LC195
	.word	.LC348
	.word	.LC149
	.space	4
	.word	.LC195
	.word	.LC349
	.word	.LC150
	.space	4
	.word	.LC195
	.word	.LC350
	.word	.LC151
	.space	4
	.word	.LC195
	.word	.LC351
	.word	.LC152
	.space	4
	.word	.LC195
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC195
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC196
	.word	.LC345
	.word	.LC146
	.space	4
	.word	.LC196
	.word	.LC346
	.word	.LC147
	.space	4
	.word	.LC196
	.word	.LC347
	.word	.LC148
	.space	4
	.word	.LC196
	.word	.LC348
	.word	.LC149
	.space	4
	.word	.LC196
	.word	.LC349
	.word	.LC150
	.space	4
	.word	.LC196
	.word	.LC350
	.word	.LC151
	.space	4
	.word	.LC196
	.word	.LC351
	.word	.LC152
	.space	4
	.word	.LC196
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC196
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC197
	.word	.LC345
	.word	.LC146
	.space	4
	.word	.LC197
	.word	.LC346
	.word	.LC147
	.space	4
	.word	.LC197
	.word	.LC347
	.word	.LC148
	.space	4
	.word	.LC197
	.word	.LC348
	.word	.LC149
	.space	4
	.word	.LC197
	.word	.LC349
	.word	.LC150
	.space	4
	.word	.LC197
	.word	.LC350
	.word	.LC151
	.space	4
	.word	.LC197
	.word	.LC351
	.word	.LC152
	.space	4
	.word	.LC197
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC197
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC198
	.word	.LC345
	.word	.LC146
	.space	4
	.word	.LC198
	.word	.LC346
	.word	.LC147
	.space	4
	.word	.LC198
	.word	.LC347
	.word	.LC148
	.space	4
	.word	.LC198
	.word	.LC348
	.word	.LC149
	.space	4
	.word	.LC198
	.word	.LC349
	.word	.LC150
	.space	4
	.word	.LC198
	.word	.LC350
	.word	.LC151
	.space	4
	.word	.LC198
	.word	.LC351
	.word	.LC152
	.space	4
	.word	.LC198
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC198
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC199
	.word	.LC345
	.word	.LC146
	.space	4
	.word	.LC199
	.word	.LC346
	.word	.LC147
	.space	4
	.word	.LC199
	.word	.LC347
	.word	.LC148
	.space	4
	.word	.LC199
	.word	.LC348
	.word	.LC149
	.space	4
	.word	.LC199
	.word	.LC349
	.word	.LC150
	.space	4
	.word	.LC199
	.word	.LC350
	.word	.LC151
	.space	4
	.word	.LC199
	.word	.LC351
	.word	.LC152
	.space	4
	.word	.LC199
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC199
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC200
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC201
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC202
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC203
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC204
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC205
	.word	.LC281
	.word	.LC281
	.space	4
	.word	.LC200
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC201
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC202
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC203
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC204
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC205
	.word	.LC283
	.word	.LC283
	.space	4
	.word	.LC226
	.word	.LC274
	.word	.LC274
	.space	4
	.word	.LC226
	.word	.LC131
	.word	.LC131
	.space	4
	.word	.LC226
	.word	0
	.word	.LC211
	.space	4
	.word	.LC227
	.word	.LC275
	.word	.LC275
	.space	4
	.word	.LC227
	.word	.LC130
	.word	.LC130
	.space	4
	.word	.LC227
	.word	0
	.word	.LC211
	.space	4
	.word	.LC228
	.word	.LC276
	.word	.LC276
	.space	4
	.word	.LC228
	.word	.LC129
	.word	.LC129
	.space	4
	.word	.LC228
	.word	0
	.word	.LC211
	.space	4
	.word	.LC229
	.word	.LC277
	.word	.LC277
	.space	4
	.word	.LC229
	.word	.LC128
	.word	.LC128
	.space	4
	.word	.LC229
	.word	0
	.word	.LC211
	.space	4
	.word	.LC230
	.word	.LC278
	.word	.LC278
	.space	4
	.word	.LC230
	.word	.LC127
	.word	.LC127
	.space	4
	.word	.LC230
	.word	0
	.word	.LC211
	.space	4
	.word	.LC231
	.word	.LC279
	.word	.LC279
	.space	4
	.word	.LC231
	.word	.LC126
	.word	.LC126
	.space	4
	.word	.LC231
	.word	0
	.word	.LC211
	.space	4
	.word	.LC232
	.word	.LC274
	.word	.LC274
	.space	4
	.word	.LC232
	.word	.LC279
	.word	.LC279
	.space	4
	.word	.LC232
	.word	.LC126
	.word	.LC126
	.space	4
	.word	.LC232
	.word	.LC131
	.word	.LC131
	.space	4
	.word	.LC232
	.word	0
	.word	.LC211
	.space	4
	.word	.LC233
	.word	.LC275
	.word	.LC275
	.space	4
	.word	.LC233
	.word	.LC278
	.word	.LC278
	.space	4
	.word	.LC233
	.word	.LC127
	.word	.LC127
	.space	4
	.word	.LC233
	.word	.LC130
	.word	.LC130
	.space	4
	.word	.LC233
	.word	0
	.word	.LC211
	.space	4
	.word	.LC234
	.word	.LC277
	.word	.LC277
	.space	4
	.word	.LC234
	.word	.LC278
	.word	.LC278
	.space	4
	.word	.LC234
	.word	.LC127
	.word	.LC127
	.space	4
	.word	.LC234
	.word	.LC128
	.word	.LC128
	.space	4
	.word	.LC234
	.word	0
	.word	.LC211
	.space	4
	.word	.LC235
	.word	.LC276
	.word	.LC276
	.space	4
	.word	.LC235
	.word	.LC279
	.word	.LC279
	.space	4
	.word	.LC235
	.word	.LC126
	.word	.LC126
	.space	4
	.word	.LC235
	.word	.LC129
	.word	.LC129
	.space	4
	.word	.LC235
	.word	0
	.word	.LC211
	.space	4
	.word	.LC126
	.word	0
	.word	.LC217
	.space	4
	.word	.LC127
	.word	0
	.word	.LC239
	.space	4
	.word	.LC128
	.word	0
	.word	.LC222
	.space	4
	.word	.LC129
	.word	0
	.word	.LC223
	.space	4
	.word	.LC130
	.word	0
	.word	.LC224
	.space	4
	.word	.LC131
	.word	0
	.word	.LC225
	.space	4
	.word	.LC286
	.word	.LC352
	.word	.LC284
	.space	4
	.word	.LC287
	.word	.LC352
	.word	.LC284
	.space	4
	.word	.LC288
	.word	.LC353
	.word	.LC285
	.space	4
	.word	.LC289
	.word	.LC352
	.word	.LC284
	.space	4
	.word	.LC290
	.word	.LC353
	.word	.LC285
	.space	4
	.word	.LC291
	.word	.LC352
	.word	.LC284
	.space	4
	.word	.LC292
	.word	.LC353
	.word	.LC285
	.space	4
	.word	.LC284
	.word	0
	.word	.LC224
	.space	4
	.word	.LC285
	.word	0
	.word	.LC225
	.space	4
	.word	.LC281
	.word	0
	.word	.LC280
	.space	4
	.word	.LC280
	.word	.LC318
	.word	.LC226
	.space	4
	.word	.LC280
	.word	.LC319
	.word	.LC227
	.space	4
	.word	.LC280
	.word	.LC320
	.word	.LC228
	.space	4
	.word	.LC280
	.word	.LC328
	.word	.LC229
	.space	4
	.word	.LC280
	.word	.LC329
	.word	.LC230
	.space	4
	.word	.LC280
	.word	.LC330
	.word	.LC231
	.space	4
	.word	.LC280
	.word	.LC331
	.word	.LC232
	.space	4
	.word	.LC280
	.word	.LC332
	.word	.LC233
	.space	4
	.word	.LC280
	.word	.LC333
	.word	.LC234
	.space	4
	.word	.LC280
	.word	.LC334
	.word	.LC235
	.space	4
	.word	.LC280
	.word	.LC345
	.word	.LC146
	.space	4
	.word	.LC280
	.word	.LC346
	.word	.LC147
	.space	4
	.word	.LC280
	.word	.LC347
	.word	.LC148
	.space	4
	.word	.LC280
	.word	.LC348
	.word	.LC149
	.space	4
	.word	.LC280
	.word	.LC349
	.word	.LC150
	.space	4
	.word	.LC280
	.word	.LC350
	.word	.LC151
	.space	4
	.word	.LC280
	.word	.LC351
	.word	.LC152
	.space	4
	.word	.LC283
	.word	0
	.word	.LC282
	.space	4
	.word	.LC282
	.word	.LC318
	.word	.LC226
	.space	4
	.word	.LC282
	.word	.LC319
	.word	.LC227
	.space	4
	.word	.LC282
	.word	.LC320
	.word	.LC228
	.space	4
	.word	.LC282
	.word	.LC328
	.word	.LC229
	.space	4
	.word	.LC282
	.word	.LC329
	.word	.LC230
	.space	4
	.word	.LC282
	.word	.LC330
	.word	.LC231
	.space	4
	.word	.LC282
	.word	.LC331
	.word	.LC232
	.space	4
	.word	.LC282
	.word	.LC332
	.word	.LC233
	.space	4
	.word	.LC282
	.word	.LC333
	.word	.LC234
	.space	4
	.word	.LC282
	.word	.LC334
	.word	.LC235
	.space	4
	.word	.LC282
	.word	.LC345
	.word	.LC146
	.space	4
	.word	.LC282
	.word	.LC346
	.word	.LC147
	.space	4
	.word	.LC282
	.word	.LC347
	.word	.LC148
	.space	4
	.word	.LC282
	.word	.LC348
	.word	.LC149
	.space	4
	.word	.LC282
	.word	.LC349
	.word	.LC150
	.space	4
	.word	.LC282
	.word	.LC350
	.word	.LC151
	.space	4
	.word	.LC282
	.word	.LC351
	.word	.LC152
	.space	4
	.word	.LC219
	.word	0
	.word	.LC212
	.space	4
	.word	.LC220
	.word	0
	.word	.LC212
	.space	4
	.word	.LC218
	.word	0
	.word	.LC212
	.space	4
	.word	.LC241
	.word	0
	.word	.LC212
	.space	4
	.word	.LC242
	.word	0
	.word	.LC212
	.space	4
	.word	.LC243
	.word	0
	.word	.LC212
	.space	4
	.word	.LC240
	.word	0
	.word	.LC212
	.space	4
	.word	.LC245
	.word	0
	.word	.LC212
	.space	4
	.word	.LC246
	.word	0
	.word	.LC212
	.space	4
	.word	.LC244
	.word	0
	.word	.LC212
	.space	4
	.word	.LC247
	.word	0
	.word	.LC212
	.space	4
	.word	.LC221
	.word	0
	.word	.LC212
	.space	4
	.word	.LC63
	.word	0
	.word	.LC213
	.space	4
	.word	.LC62
	.word	0
	.word	.LC213
	.space	4
	.word	.LC248
	.word	0
	.word	.LC212
	.space	4
	.type	aif_cap_mixer, %object
	.size	aif_cap_mixer, 480
aif_cap_mixer:
	.word	2
	.space	8
	.word	.LC308
	.space	12
	.word	snd_soc_info_volsw
	.word	slim_tx_mixer_get
	.word	slim_tx_mixer_put
	.space	4
	.word	__compound_literal.111
	.word	2
	.space	8
	.word	.LC309
	.space	12
	.word	snd_soc_info_volsw
	.word	slim_tx_mixer_get
	.word	slim_tx_mixer_put
	.space	4
	.word	__compound_literal.112
	.word	2
	.space	8
	.word	.LC310
	.space	12
	.word	snd_soc_info_volsw
	.word	slim_tx_mixer_get
	.word	slim_tx_mixer_put
	.space	4
	.word	__compound_literal.113
	.word	2
	.space	8
	.word	.LC311
	.space	12
	.word	snd_soc_info_volsw
	.word	slim_tx_mixer_get
	.word	slim_tx_mixer_put
	.space	4
	.word	__compound_literal.114
	.word	2
	.space	8
	.word	.LC312
	.space	12
	.word	snd_soc_info_volsw
	.word	slim_tx_mixer_get
	.word	slim_tx_mixer_put
	.space	4
	.word	__compound_literal.115
	.word	2
	.space	8
	.word	.LC313
	.space	12
	.word	snd_soc_info_volsw
	.word	slim_tx_mixer_get
	.word	slim_tx_mixer_put
	.space	4
	.word	__compound_literal.116
	.word	2
	.space	8
	.word	.LC314
	.space	12
	.word	snd_soc_info_volsw
	.word	slim_tx_mixer_get
	.word	slim_tx_mixer_put
	.space	4
	.word	__compound_literal.117
	.word	2
	.space	8
	.word	.LC315
	.space	12
	.word	snd_soc_info_volsw
	.word	slim_tx_mixer_get
	.word	slim_tx_mixer_put
	.space	4
	.word	__compound_literal.118
	.word	2
	.space	8
	.word	.LC316
	.space	12
	.word	snd_soc_info_volsw
	.word	slim_tx_mixer_get
	.word	slim_tx_mixer_put
	.space	4
	.word	__compound_literal.119
	.word	2
	.space	8
	.word	.LC317
	.space	12
	.word	snd_soc_info_volsw
	.word	slim_tx_mixer_get
	.word	slim_tx_mixer_put
	.space	4
	.word	__compound_literal.120
	.type	slim_rx_mux, %object
	.size	slim_rx_mux, 624
slim_rx_mux:
	.word	2
	.space	8
	.word	.LC356
	.space	12
	.word	snd_soc_info_enum_double
	.word	slim_rx_mux_get
	.word	slim_rx_mux_put
	.space	4
	.word	slim_rx_mux_enum
	.word	2
	.space	8
	.word	.LC357
	.space	12
	.word	snd_soc_info_enum_double
	.word	slim_rx_mux_get
	.word	slim_rx_mux_put
	.space	4
	.word	slim_rx_mux_enum
	.word	2
	.space	8
	.word	.LC358
	.space	12
	.word	snd_soc_info_enum_double
	.word	slim_rx_mux_get
	.word	slim_rx_mux_put
	.space	4
	.word	slim_rx_mux_enum
	.word	2
	.space	8
	.word	.LC359
	.space	12
	.word	snd_soc_info_enum_double
	.word	slim_rx_mux_get
	.word	slim_rx_mux_put
	.space	4
	.word	slim_rx_mux_enum
	.word	2
	.space	8
	.word	.LC360
	.space	12
	.word	snd_soc_info_enum_double
	.word	slim_rx_mux_get
	.word	slim_rx_mux_put
	.space	4
	.word	slim_rx_mux_enum
	.word	2
	.space	8
	.word	.LC361
	.space	12
	.word	snd_soc_info_enum_double
	.word	slim_rx_mux_get
	.word	slim_rx_mux_put
	.space	4
	.word	slim_rx_mux_enum
	.word	2
	.space	8
	.word	.LC362
	.space	12
	.word	snd_soc_info_enum_double
	.word	slim_rx_mux_get
	.word	slim_rx_mux_put
	.space	4
	.word	slim_rx_mux_enum
	.space	288
	.type	slim_rx_mux_enum, %object
	.size	slim_rx_mux_enum, 32
slim_rx_mux_enum:
	.space	8
	.word	4
	.space	4
	.word	slim_rx_mux_text
	.space	12
	.type	slim_rx_mux_text, %object
	.size	slim_rx_mux_text, 16
slim_rx_mux_text:
	.word	.LC363
	.word	.LC342
	.word	.LC343
	.word	.LC344
	.type	aif4_vi_switch, %object
	.size	aif4_vi_switch, 48
aif4_vi_switch:
	.word	2
	.space	8
	.word	.LC307
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_dapm_get_volsw
	.word	snd_soc_dapm_put_volsw
	.space	4
	.word	__compound_literal.110
	.type	aif4_mad_switch, %object
	.size	aif4_mad_switch, 48
aif4_mad_switch:
	.word	2
	.space	8
	.word	.LC307
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_dapm_get_volsw
	.word	snd_soc_dapm_put_volsw
	.space	4
	.word	__compound_literal.109
	.type	lineout4_ground_switch, %object
	.size	lineout4_ground_switch, 48
lineout4_ground_switch:
	.word	2
	.space	8
	.word	.LC307
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_dapm_get_volsw
	.word	snd_soc_dapm_put_volsw
	.space	4
	.word	__compound_literal.108
	.type	lineout3_ground_switch, %object
	.size	lineout3_ground_switch, 48
lineout3_ground_switch:
	.word	2
	.space	8
	.word	.LC307
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_dapm_get_volsw
	.word	snd_soc_dapm_put_volsw
	.space	4
	.word	__compound_literal.107
	.type	lineout4_pa_mix, %object
	.size	lineout4_pa_mix, 48
lineout4_pa_mix:
	.word	2
	.space	8
	.word	.LC353
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_dapm_get_volsw
	.word	snd_soc_dapm_put_volsw
	.space	4
	.word	__compound_literal.106
	.type	lineout3_pa_mix, %object
	.size	lineout3_pa_mix, 48
lineout3_pa_mix:
	.word	2
	.space	8
	.word	.LC352
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_dapm_get_volsw
	.word	snd_soc_dapm_put_volsw
	.space	4
	.word	__compound_literal.105
	.type	lineout2_pa_mix, %object
	.size	lineout2_pa_mix, 48
lineout2_pa_mix:
	.word	2
	.space	8
	.word	.LC353
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_dapm_get_volsw
	.word	snd_soc_dapm_put_volsw
	.space	4
	.word	__compound_literal.104
	.type	lineout1_pa_mix, %object
	.size	lineout1_pa_mix, 48
lineout1_pa_mix:
	.word	2
	.space	8
	.word	.LC352
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_dapm_get_volsw
	.word	snd_soc_dapm_put_volsw
	.space	4
	.word	__compound_literal.103
	.type	ear_pa_mix, %object
	.size	ear_pa_mix, 48
ear_pa_mix:
	.word	2
	.space	8
	.word	.LC352
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_dapm_get_volsw
	.word	snd_soc_dapm_put_volsw
	.space	4
	.word	__compound_literal.102
	.type	hphr_pa_mix, %object
	.size	hphr_pa_mix, 48
hphr_pa_mix:
	.word	2
	.space	8
	.word	.LC353
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_dapm_get_volsw
	.word	snd_soc_dapm_put_volsw
	.space	4
	.word	__compound_literal.101
	.type	hphl_pa_mix, %object
	.size	hphl_pa_mix, 48
hphl_pa_mix:
	.word	2
	.space	8
	.word	.LC352
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_dapm_get_volsw
	.word	snd_soc_dapm_put_volsw
	.space	4
	.word	__compound_literal.100
	.type	hphl_switch, %object
	.size	hphl_switch, 48
hphl_switch:
	.word	2
	.space	8
	.word	.LC307
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_dapm_get_volsw
	.word	snd_soc_dapm_put_volsw
	.space	4
	.word	__compound_literal.99
	.type	dac1_switch, %object
	.size	dac1_switch, 48
dac1_switch:
	.word	2
	.space	8
	.word	.LC307
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_dapm_get_volsw
	.word	snd_soc_dapm_put_volsw
	.space	4
	.word	__compound_literal.98
	.type	anc1_fb_mux, %object
	.size	anc1_fb_mux, 48
anc1_fb_mux:
	.word	2
	.space	8
	.word	.LC364
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	anc1_fb_mux_enum
	.type	anc2_mux, %object
	.size	anc2_mux, 48
anc2_mux:
	.word	2
	.space	8
	.word	.LC365
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	anc2_mux_enum
	.type	anc1_mux, %object
	.size	anc1_mux, 48
anc1_mux:
	.word	2
	.space	8
	.word	.LC366
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	anc1_mux_enum
	.type	iir2_inp1_mux, %object
	.size	iir2_inp1_mux, 48
iir2_inp1_mux:
	.word	2
	.space	8
	.word	.LC367
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	iir2_inp1_mux_enum
	.type	iir1_inp1_mux, %object
	.size	iir1_inp1_mux, 48
iir1_inp1_mux:
	.word	2
	.space	8
	.word	.LC368
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	iir1_inp1_mux_enum
	.type	dec10_mux, %object
	.size	dec10_mux, 48
dec10_mux:
	.word	2
	.space	8
	.word	.LC369
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	wcd9320_put_dec_enum
	.space	4
	.word	dec10_mux_enum
	.type	dec9_mux, %object
	.size	dec9_mux, 48
dec9_mux:
	.word	2
	.space	8
	.word	.LC370
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	wcd9320_put_dec_enum
	.space	4
	.word	dec9_mux_enum
	.type	dec8_mux, %object
	.size	dec8_mux, 48
dec8_mux:
	.word	2
	.space	8
	.word	.LC371
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	wcd9320_put_dec_enum
	.space	4
	.word	dec8_mux_enum
	.type	dec7_mux, %object
	.size	dec7_mux, 48
dec7_mux:
	.word	2
	.space	8
	.word	.LC372
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	wcd9320_put_dec_enum
	.space	4
	.word	dec7_mux_enum
	.type	dec6_mux, %object
	.size	dec6_mux, 48
dec6_mux:
	.word	2
	.space	8
	.word	.LC373
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	wcd9320_put_dec_enum
	.space	4
	.word	dec6_mux_enum
	.type	dec5_mux, %object
	.size	dec5_mux, 48
dec5_mux:
	.word	2
	.space	8
	.word	.LC374
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	wcd9320_put_dec_enum
	.space	4
	.word	dec5_mux_enum
	.type	dec4_mux, %object
	.size	dec4_mux, 48
dec4_mux:
	.word	2
	.space	8
	.word	.LC375
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	wcd9320_put_dec_enum
	.space	4
	.word	dec4_mux_enum
	.type	dec3_mux, %object
	.size	dec3_mux, 48
dec3_mux:
	.word	2
	.space	8
	.word	.LC376
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	wcd9320_put_dec_enum
	.space	4
	.word	dec3_mux_enum
	.type	dec2_mux, %object
	.size	dec2_mux, 48
dec2_mux:
	.word	2
	.space	8
	.word	.LC377
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	wcd9320_put_dec_enum
	.space	4
	.word	dec2_mux_enum
	.type	dec1_mux, %object
	.size	dec1_mux, 48
dec1_mux:
	.word	2
	.space	8
	.word	.LC378
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	wcd9320_put_dec_enum
	.space	4
	.word	dec1_mux_enum
	.type	sb_tx10_mux, %object
	.size	sb_tx10_mux, 48
sb_tx10_mux:
	.word	2
	.space	8
	.word	.LC379
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	sb_tx10_mux_enum
	.type	sb_tx9_mux, %object
	.size	sb_tx9_mux, 48
sb_tx9_mux:
	.word	2
	.space	8
	.word	.LC380
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	sb_tx9_mux_enum
	.type	sb_tx8_mux, %object
	.size	sb_tx8_mux, 48
sb_tx8_mux:
	.word	2
	.space	8
	.word	.LC381
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	sb_tx8_mux_enum
	.type	sb_tx7_mux, %object
	.size	sb_tx7_mux, 48
sb_tx7_mux:
	.word	2
	.space	8
	.word	.LC382
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	sb_tx7_mux_enum
	.type	sb_tx6_mux, %object
	.size	sb_tx6_mux, 48
sb_tx6_mux:
	.word	2
	.space	8
	.word	.LC383
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	sb_tx6_mux_enum
	.type	sb_tx5_mux, %object
	.size	sb_tx5_mux, 48
sb_tx5_mux:
	.word	2
	.space	8
	.word	.LC384
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	sb_tx5_mux_enum
	.type	sb_tx4_mux, %object
	.size	sb_tx4_mux, 48
sb_tx4_mux:
	.word	2
	.space	8
	.word	.LC385
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	sb_tx4_mux_enum
	.type	sb_tx3_mux, %object
	.size	sb_tx3_mux, 48
sb_tx3_mux:
	.word	2
	.space	8
	.word	.LC386
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	sb_tx3_mux_enum
	.type	sb_tx2_mux, %object
	.size	sb_tx2_mux, 48
sb_tx2_mux:
	.word	2
	.space	8
	.word	.LC387
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	sb_tx2_mux_enum
	.type	sb_tx1_mux, %object
	.size	sb_tx1_mux, 48
sb_tx1_mux:
	.word	2
	.space	8
	.word	.LC388
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	sb_tx1_mux_enum
	.type	rx_dac7_mux, %object
	.size	rx_dac7_mux, 48
rx_dac7_mux:
	.word	2
	.space	8
	.word	.LC389
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx_rdac7_enum
	.type	rx_dac5_mux, %object
	.size	rx_dac5_mux, 48
rx_dac5_mux:
	.word	2
	.space	8
	.word	.LC390
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx_rdac5_enum
	.type	rx7_mix2_inp2_mux, %object
	.size	rx7_mix2_inp2_mux, 48
rx7_mix2_inp2_mux:
	.word	2
	.space	8
	.word	.LC391
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx7_mix2_inp2_chain_enum
	.type	rx7_mix2_inp1_mux, %object
	.size	rx7_mix2_inp1_mux, 48
rx7_mix2_inp1_mux:
	.word	2
	.space	8
	.word	.LC392
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx7_mix2_inp1_chain_enum
	.type	rx2_mix2_inp2_mux, %object
	.size	rx2_mix2_inp2_mux, 48
rx2_mix2_inp2_mux:
	.word	2
	.space	8
	.word	.LC393
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx2_mix2_inp2_chain_enum
	.type	rx2_mix2_inp1_mux, %object
	.size	rx2_mix2_inp1_mux, 48
rx2_mix2_inp1_mux:
	.word	2
	.space	8
	.word	.LC394
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx2_mix2_inp1_chain_enum
	.type	rx1_mix2_inp2_mux, %object
	.size	rx1_mix2_inp2_mux, 48
rx1_mix2_inp2_mux:
	.word	2
	.space	8
	.word	.LC395
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx1_mix2_inp2_chain_enum
	.type	rx1_mix2_inp1_mux, %object
	.size	rx1_mix2_inp1_mux, 48
rx1_mix2_inp1_mux:
	.word	2
	.space	8
	.word	.LC396
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx1_mix2_inp1_chain_enum
	.type	rx7_mix1_inp2_mux, %object
	.size	rx7_mix1_inp2_mux, 48
rx7_mix1_inp2_mux:
	.word	2
	.space	8
	.word	.LC397
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx7_mix1_inp2_chain_enum
	.type	rx7_mix1_inp1_mux, %object
	.size	rx7_mix1_inp1_mux, 48
rx7_mix1_inp1_mux:
	.word	2
	.space	8
	.word	.LC398
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx7_mix1_inp1_chain_enum
	.type	rx6_mix1_inp2_mux, %object
	.size	rx6_mix1_inp2_mux, 48
rx6_mix1_inp2_mux:
	.word	2
	.space	8
	.word	.LC399
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx6_mix1_inp2_chain_enum
	.type	rx6_mix1_inp1_mux, %object
	.size	rx6_mix1_inp1_mux, 48
rx6_mix1_inp1_mux:
	.word	2
	.space	8
	.word	.LC400
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx6_mix1_inp1_chain_enum
	.type	rx5_mix1_inp2_mux, %object
	.size	rx5_mix1_inp2_mux, 48
rx5_mix1_inp2_mux:
	.word	2
	.space	8
	.word	.LC401
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx5_mix1_inp2_chain_enum
	.type	rx5_mix1_inp1_mux, %object
	.size	rx5_mix1_inp1_mux, 48
rx5_mix1_inp1_mux:
	.word	2
	.space	8
	.word	.LC402
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx5_mix1_inp1_chain_enum
	.type	rx4_mix1_inp2_mux, %object
	.size	rx4_mix1_inp2_mux, 48
rx4_mix1_inp2_mux:
	.word	2
	.space	8
	.word	.LC403
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx4_mix1_inp2_chain_enum
	.type	rx4_mix1_inp1_mux, %object
	.size	rx4_mix1_inp1_mux, 48
rx4_mix1_inp1_mux:
	.word	2
	.space	8
	.word	.LC404
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx4_mix1_inp1_chain_enum
	.type	rx3_mix1_inp2_mux, %object
	.size	rx3_mix1_inp2_mux, 48
rx3_mix1_inp2_mux:
	.word	2
	.space	8
	.word	.LC405
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx3_mix1_inp2_chain_enum
	.type	rx3_mix1_inp1_mux, %object
	.size	rx3_mix1_inp1_mux, 48
rx3_mix1_inp1_mux:
	.word	2
	.space	8
	.word	.LC406
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx3_mix1_inp1_chain_enum
	.type	rx2_mix1_inp2_mux, %object
	.size	rx2_mix1_inp2_mux, 48
rx2_mix1_inp2_mux:
	.word	2
	.space	8
	.word	.LC407
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx2_mix1_inp2_chain_enum
	.type	rx2_mix1_inp1_mux, %object
	.size	rx2_mix1_inp1_mux, 48
rx2_mix1_inp1_mux:
	.word	2
	.space	8
	.word	.LC408
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx2_mix1_inp1_chain_enum
	.type	rx_mix1_inp3_mux, %object
	.size	rx_mix1_inp3_mux, 48
rx_mix1_inp3_mux:
	.word	2
	.space	8
	.word	.LC409
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx_mix1_inp3_chain_enum
	.type	rx_mix1_inp2_mux, %object
	.size	rx_mix1_inp2_mux, 48
rx_mix1_inp2_mux:
	.word	2
	.space	8
	.word	.LC410
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx_mix1_inp2_chain_enum
	.type	rx_mix1_inp1_mux, %object
	.size	rx_mix1_inp1_mux, 48
rx_mix1_inp1_mux:
	.word	2
	.space	8
	.word	.LC411
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	rx_mix1_inp1_chain_enum
	.type	iir2_inp1_mux_enum, %object
	.size	iir2_inp1_mux_enum, 32
iir2_inp1_mux_enum:
	.short	923
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	18
	.space	4
	.word	iir_inp1_text
	.space	12
	.type	iir1_inp1_mux_enum, %object
	.size	iir1_inp1_mux_enum, 32
iir1_inp1_mux_enum:
	.short	919
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	18
	.space	4
	.word	iir_inp1_text
	.space	12
	.type	anc1_fb_mux_enum, %object
	.size	anc1_fb_mux_enum, 32
anc1_fb_mux_enum:
	.short	914
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	3
	.space	4
	.word	anc1_fb_mux_text
	.space	12
	.type	anc2_mux_enum, %object
	.size	anc2_mux_enum, 32
anc2_mux_enum:
	.short	913
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	16
	.space	4
	.word	anc_mux_text
	.space	12
	.type	anc1_mux_enum, %object
	.size	anc1_mux_enum, 32
anc1_mux_enum:
	.short	913
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	16
	.space	4
	.word	anc_mux_text
	.space	12
	.type	dec10_mux_enum, %object
	.size	dec10_mux_enum, 32
dec10_mux_enum:
	.short	918
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	8
	.space	4
	.word	dec10_mux_text
	.space	12
	.type	dec9_mux_enum, %object
	.size	dec9_mux_enum, 32
dec9_mux_enum:
	.short	917
	.space	2
	.byte	3
	.byte	3
	.space	2
	.word	8
	.space	4
	.word	dec9_mux_text
	.space	12
	.type	dec8_mux_enum, %object
	.size	dec8_mux_enum, 32
dec8_mux_enum:
	.short	917
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	7
	.space	4
	.word	dec8_mux_text
	.space	12
	.type	dec7_mux_enum, %object
	.size	dec7_mux_enum, 32
dec7_mux_enum:
	.short	916
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	7
	.space	4
	.word	dec7_mux_text
	.space	12
	.type	dec6_mux_enum, %object
	.size	dec6_mux_enum, 32
dec6_mux_enum:
	.short	916
	.space	2
	.byte	2
	.byte	2
	.space	2
	.word	3
	.space	4
	.word	dec6_mux_text
	.space	12
	.type	dec5_mux_enum, %object
	.size	dec5_mux_enum, 32
dec5_mux_enum:
	.short	916
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	3
	.space	4
	.word	dec5_mux_text
	.space	12
	.type	dec4_mux_enum, %object
	.size	dec4_mux_enum, 32
dec4_mux_enum:
	.short	915
	.space	2
	.byte	6
	.byte	6
	.space	2
	.word	3
	.space	4
	.word	dec4_mux_text
	.space	12
	.type	dec3_mux_enum, %object
	.size	dec3_mux_enum, 32
dec3_mux_enum:
	.short	915
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	3
	.space	4
	.word	dec3_mux_text
	.space	12
	.type	dec2_mux_enum, %object
	.size	dec2_mux_enum, 32
dec2_mux_enum:
	.short	915
	.space	2
	.byte	2
	.byte	2
	.space	2
	.word	3
	.space	4
	.word	dec2_mux_text
	.space	12
	.type	dec1_mux_enum, %object
	.size	dec1_mux_enum, 32
dec1_mux_enum:
	.short	915
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	3
	.space	4
	.word	dec1_mux_text
	.space	12
	.type	sb_tx10_mux_enum, %object
	.size	sb_tx10_mux_enum, 32
sb_tx10_mux_enum:
	.short	940
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	18
	.space	4
	.word	sb_tx7_to_tx10_mux_text
	.space	12
	.type	sb_tx9_mux_enum, %object
	.size	sb_tx9_mux_enum, 32
sb_tx9_mux_enum:
	.short	939
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	18
	.space	4
	.word	sb_tx7_to_tx10_mux_text
	.space	12
	.type	sb_tx8_mux_enum, %object
	.size	sb_tx8_mux_enum, 32
sb_tx8_mux_enum:
	.short	938
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	18
	.space	4
	.word	sb_tx7_to_tx10_mux_text
	.space	12
	.type	sb_tx7_mux_enum, %object
	.size	sb_tx7_mux_enum, 32
sb_tx7_mux_enum:
	.short	937
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	18
	.space	4
	.word	sb_tx7_to_tx10_mux_text
	.space	12
	.type	sb_tx6_mux_enum, %object
	.size	sb_tx6_mux_enum, 32
sb_tx6_mux_enum:
	.short	936
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	9
	.space	4
	.word	sb_tx6_mux_text
	.space	12
	.type	sb_tx5_mux_enum, %object
	.size	sb_tx5_mux_enum, 32
sb_tx5_mux_enum:
	.short	935
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	9
	.space	4
	.word	sb_tx5_mux_text
	.space	12
	.type	sb_tx4_mux_enum, %object
	.size	sb_tx4_mux_enum, 32
sb_tx4_mux_enum:
	.short	934
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	9
	.space	4
	.word	sb_tx4_mux_text
	.space	12
	.type	sb_tx3_mux_enum, %object
	.size	sb_tx3_mux_enum, 32
sb_tx3_mux_enum:
	.short	933
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	9
	.space	4
	.word	sb_tx3_mux_text
	.space	12
	.type	sb_tx2_mux_enum, %object
	.size	sb_tx2_mux_enum, 32
sb_tx2_mux_enum:
	.short	932
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	9
	.space	4
	.word	sb_tx2_mux_text
	.space	12
	.type	sb_tx1_mux_enum, %object
	.size	sb_tx1_mux_enum, 32
sb_tx1_mux_enum:
	.short	931
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	9
	.space	4
	.word	sb_tx1_mux_text
	.space	12
	.type	rx_rdac7_enum, %object
	.size	rx_rdac7_enum, 32
rx_rdac7_enum:
	.short	945
	.space	2
	.byte	1
	.byte	1
	.space	2
	.word	2
	.space	4
	.word	rx_rdac7_text
	.space	12
	.type	rx_rdac5_enum, %object
	.size	rx_rdac5_enum, 32
rx_rdac5_enum:
	.short	945
	.space	2
	.byte	2
	.byte	2
	.space	2
	.word	2
	.space	4
	.word	rx_rdac5_text
	.space	12
	.type	rx7_mix2_inp2_chain_enum, %object
	.size	rx7_mix2_inp2_chain_enum, 32
rx7_mix2_inp2_chain_enum:
	.short	912
	.space	2
	.byte	3
	.byte	3
	.space	2
	.word	5
	.space	4
	.word	rx_mix2_text
	.space	12
	.type	rx7_mix2_inp1_chain_enum, %object
	.size	rx7_mix2_inp1_chain_enum, 32
rx7_mix2_inp1_chain_enum:
	.short	912
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	5
	.space	4
	.word	rx_mix2_text
	.space	12
	.type	rx2_mix2_inp2_chain_enum, %object
	.size	rx2_mix2_inp2_chain_enum, 32
rx2_mix2_inp2_chain_enum:
	.short	901
	.space	2
	.byte	3
	.byte	3
	.space	2
	.word	5
	.space	4
	.word	rx_mix2_text
	.space	12
	.type	rx2_mix2_inp1_chain_enum, %object
	.size	rx2_mix2_inp1_chain_enum, 32
rx2_mix2_inp1_chain_enum:
	.short	901
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	5
	.space	4
	.word	rx_mix2_text
	.space	12
	.type	rx1_mix2_inp2_chain_enum, %object
	.size	rx1_mix2_inp2_chain_enum, 32
rx1_mix2_inp2_chain_enum:
	.short	898
	.space	2
	.byte	3
	.byte	3
	.space	2
	.word	5
	.space	4
	.word	rx_mix2_text
	.space	12
	.type	rx1_mix2_inp1_chain_enum, %object
	.size	rx1_mix2_inp1_chain_enum, 32
rx1_mix2_inp1_chain_enum:
	.short	898
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	5
	.space	4
	.word	rx_mix2_text
	.space	12
	.type	rx7_mix1_inp2_chain_enum, %object
	.size	rx7_mix1_inp2_chain_enum, 32
rx7_mix1_inp2_chain_enum:
	.short	910
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	12
	.space	4
	.word	rx_mix1_text
	.space	12
	.type	rx7_mix1_inp1_chain_enum, %object
	.size	rx7_mix1_inp1_chain_enum, 32
rx7_mix1_inp1_chain_enum:
	.short	910
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	12
	.space	4
	.word	rx_mix1_text
	.space	12
	.type	rx6_mix1_inp2_chain_enum, %object
	.size	rx6_mix1_inp2_chain_enum, 32
rx6_mix1_inp2_chain_enum:
	.short	908
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	12
	.space	4
	.word	rx_mix1_text
	.space	12
	.type	rx6_mix1_inp1_chain_enum, %object
	.size	rx6_mix1_inp1_chain_enum, 32
rx6_mix1_inp1_chain_enum:
	.short	908
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	12
	.space	4
	.word	rx_mix1_text
	.space	12
	.type	rx5_mix1_inp2_chain_enum, %object
	.size	rx5_mix1_inp2_chain_enum, 32
rx5_mix1_inp2_chain_enum:
	.short	906
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	12
	.space	4
	.word	rx_mix1_text
	.space	12
	.type	rx5_mix1_inp1_chain_enum, %object
	.size	rx5_mix1_inp1_chain_enum, 32
rx5_mix1_inp1_chain_enum:
	.short	906
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	12
	.space	4
	.word	rx_mix1_text
	.space	12
	.type	rx4_mix1_inp2_chain_enum, %object
	.size	rx4_mix1_inp2_chain_enum, 32
rx4_mix1_inp2_chain_enum:
	.short	904
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	12
	.space	4
	.word	rx_mix1_text
	.space	12
	.type	rx4_mix1_inp1_chain_enum, %object
	.size	rx4_mix1_inp1_chain_enum, 32
rx4_mix1_inp1_chain_enum:
	.short	904
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	12
	.space	4
	.word	rx_mix1_text
	.space	12
	.type	rx3_mix1_inp2_chain_enum, %object
	.size	rx3_mix1_inp2_chain_enum, 32
rx3_mix1_inp2_chain_enum:
	.short	902
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	12
	.space	4
	.word	rx_mix1_text
	.space	12
	.type	rx3_mix1_inp1_chain_enum, %object
	.size	rx3_mix1_inp1_chain_enum, 32
rx3_mix1_inp1_chain_enum:
	.short	902
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	12
	.space	4
	.word	rx_mix1_text
	.space	12
	.type	rx2_mix1_inp2_chain_enum, %object
	.size	rx2_mix1_inp2_chain_enum, 32
rx2_mix1_inp2_chain_enum:
	.short	899
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	12
	.space	4
	.word	rx_mix1_text
	.space	12
	.type	rx2_mix1_inp1_chain_enum, %object
	.size	rx2_mix1_inp1_chain_enum, 32
rx2_mix1_inp1_chain_enum:
	.short	899
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	12
	.space	4
	.word	rx_mix1_text
	.space	12
	.type	rx_mix1_inp3_chain_enum, %object
	.size	rx_mix1_inp3_chain_enum, 32
rx_mix1_inp3_chain_enum:
	.short	897
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	12
	.space	4
	.word	rx_mix1_text
	.space	12
	.type	rx_mix1_inp2_chain_enum, %object
	.size	rx_mix1_inp2_chain_enum, 32
rx_mix1_inp2_chain_enum:
	.short	896
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	12
	.space	4
	.word	rx_mix1_text
	.space	12
	.type	rx_mix1_inp1_chain_enum, %object
	.size	rx_mix1_inp1_chain_enum, 32
rx_mix1_inp1_chain_enum:
	.short	896
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	12
	.space	4
	.word	rx_mix1_text
	.space	12
	.type	iir_inp1_text, %object
	.size	iir_inp1_text, 72
iir_inp1_text:
	.word	.LC363
	.word	.LC318
	.word	.LC319
	.word	.LC320
	.word	.LC328
	.word	.LC329
	.word	.LC330
	.word	.LC331
	.word	.LC332
	.word	.LC333
	.word	.LC334
	.word	.LC345
	.word	.LC346
	.word	.LC347
	.word	.LC348
	.word	.LC349
	.word	.LC350
	.word	.LC351
	.type	anc1_fb_mux_text, %object
	.size	anc1_fb_mux_text, 12
anc1_fb_mux_text:
	.word	.LC363
	.word	.LC335
	.word	.LC336
	.type	anc_mux_text, %object
	.size	anc_mux_text, 60
anc_mux_text:
	.word	.LC363
	.word	.LC126
	.word	.LC127
	.word	.LC128
	.word	.LC129
	.word	.LC130
	.word	.LC131
	.word	.LC47
	.word	.LC412
	.word	.LC274
	.word	.LC275
	.word	.LC276
	.word	.LC277
	.word	.LC278
	.word	.LC279
	.type	dec10_mux_text, %object
	.size	dec10_mux_text, 32
dec10_mux_text:
	.word	.LC363
	.word	.LC276
	.word	.LC279
	.word	.LC126
	.word	.LC129
	.word	.LC413
	.word	.LC414
	.word	.LC415
	.type	dec9_mux_text, %object
	.size	dec9_mux_text, 32
dec9_mux_text:
	.word	.LC363
	.word	.LC277
	.word	.LC278
	.word	.LC127
	.word	.LC128
	.word	.LC413
	.word	.LC414
	.word	.LC415
	.type	dec8_mux_text, %object
	.size	dec8_mux_text, 20
dec8_mux_text:
	.word	.LC363
	.word	.LC275
	.word	.LC278
	.word	.LC127
	.word	.LC130
	.type	dec7_mux_text, %object
	.size	dec7_mux_text, 28
dec7_mux_text:
	.word	.LC363
	.word	.LC274
	.word	.LC279
	.word	.LC126
	.word	.LC131
	.word	.LC414
	.word	.LC415
	.type	dec6_mux_text, %object
	.size	dec6_mux_text, 12
dec6_mux_text:
	.word	.LC363
	.word	.LC279
	.word	.LC126
	.type	dec5_mux_text, %object
	.size	dec5_mux_text, 12
dec5_mux_text:
	.word	.LC363
	.word	.LC278
	.word	.LC127
	.type	dec4_mux_text, %object
	.size	dec4_mux_text, 12
dec4_mux_text:
	.word	.LC363
	.word	.LC277
	.word	.LC128
	.type	dec3_mux_text, %object
	.size	dec3_mux_text, 12
dec3_mux_text:
	.word	.LC363
	.word	.LC276
	.word	.LC129
	.type	dec2_mux_text, %object
	.size	dec2_mux_text, 12
dec2_mux_text:
	.word	.LC363
	.word	.LC275
	.word	.LC130
	.type	dec1_mux_text, %object
	.size	dec1_mux_text, 12
dec1_mux_text:
	.word	.LC363
	.word	.LC274
	.word	.LC131
	.type	sb_tx7_to_tx10_mux_text, %object
	.size	sb_tx7_to_tx10_mux_text, 72
sb_tx7_to_tx10_mux_text:
	.word	.LC363
	.word	.LC321
	.word	.LC322
	.word	.LC323
	.word	.LC324
	.word	.LC325
	.word	.LC326
	.word	.LC327
	.word	.LC318
	.word	.LC319
	.word	.LC320
	.word	.LC328
	.word	.LC329
	.word	.LC330
	.word	.LC331
	.word	.LC332
	.word	.LC333
	.word	.LC334
	.type	sb_tx6_mux_text, %object
	.size	sb_tx6_mux_text, 36
sb_tx6_mux_text:
	.word	.LC363
	.word	.LC321
	.word	.LC322
	.word	.LC323
	.word	.LC324
	.word	.LC325
	.word	.LC326
	.word	.LC327
	.word	.LC330
	.type	sb_tx5_mux_text, %object
	.size	sb_tx5_mux_text, 36
sb_tx5_mux_text:
	.word	.LC363
	.word	.LC321
	.word	.LC322
	.word	.LC323
	.word	.LC324
	.word	.LC325
	.word	.LC326
	.word	.LC327
	.word	.LC329
	.type	sb_tx4_mux_text, %object
	.size	sb_tx4_mux_text, 36
sb_tx4_mux_text:
	.word	.LC363
	.word	.LC321
	.word	.LC322
	.word	.LC323
	.word	.LC324
	.word	.LC325
	.word	.LC326
	.word	.LC327
	.word	.LC328
	.type	sb_tx3_mux_text, %object
	.size	sb_tx3_mux_text, 36
sb_tx3_mux_text:
	.word	.LC363
	.word	.LC321
	.word	.LC322
	.word	.LC323
	.word	.LC324
	.word	.LC325
	.word	.LC326
	.word	.LC327
	.word	.LC320
	.type	sb_tx2_mux_text, %object
	.size	sb_tx2_mux_text, 36
sb_tx2_mux_text:
	.word	.LC363
	.word	.LC321
	.word	.LC322
	.word	.LC323
	.word	.LC324
	.word	.LC325
	.word	.LC326
	.word	.LC327
	.word	.LC319
	.type	sb_tx1_mux_text, %object
	.size	sb_tx1_mux_text, 36
sb_tx1_mux_text:
	.word	.LC363
	.word	.LC321
	.word	.LC322
	.word	.LC323
	.word	.LC324
	.word	.LC325
	.word	.LC326
	.word	.LC327
	.word	.LC318
	.type	rx_rdac7_text, %object
	.size	rx_rdac7_text, 8
rx_rdac7_text:
	.word	.LC340
	.word	.LC339
	.type	rx_rdac5_text, %object
	.size	rx_rdac5_text, 8
rx_rdac5_text:
	.word	.LC338
	.word	.LC337
	.type	rx_mix2_text, %object
	.size	rx_mix2_text, 20
rx_mix2_text:
	.word	.LC363
	.word	.LC416
	.word	.LC417
	.word	.LC281
	.word	.LC283
	.type	rx_mix1_text, %object
	.size	rx_mix1_text, 48
rx_mix1_text:
	.word	.LC363
	.word	.LC416
	.word	.LC417
	.word	.LC281
	.word	.LC283
	.word	.LC345
	.word	.LC346
	.word	.LC347
	.word	.LC348
	.word	.LC349
	.word	.LC350
	.word	.LC351
	.type	taiko_2_x_ear_pa_gain_enum, %object
	.size	taiko_2_x_ear_pa_gain_enum, 32
taiko_2_x_ear_pa_gain_enum:
	.space	8
	.word	8
	.space	4
	.word	taiko_2_x_ear_pa_gain_text
	.space	12
	.type	taiko_2_x_ear_pa_gain_text, %object
	.size	taiko_2_x_ear_pa_gain_text, 32
taiko_2_x_ear_pa_gain_text:
	.word	.LC434
	.word	.LC435
	.word	.LC436
	.word	.LC437
	.word	.LC438
	.word	.LC439
	.word	.LC440
	.word	.LC441
	.type	taiko_1_x_ear_pa_gain_enum, %object
	.size	taiko_1_x_ear_pa_gain_enum, 32
taiko_1_x_ear_pa_gain_enum:
	.space	8
	.word	8
	.space	4
	.word	taiko_1_x_ear_pa_gain_text
	.space	12
	.type	taiko_1_x_ear_pa_gain_text, %object
	.size	taiko_1_x_ear_pa_gain_text, 32
taiko_1_x_ear_pa_gain_text:
	.word	.LC434
	.word	.LC442
	.word	.LC443
	.word	.LC444
	.word	.LC445
	.word	.LC439
	.word	.LC446
	.word	.LC441
	.type	taiko_snd_controls, %object
	.size	taiko_snd_controls, 4080
taiko_snd_controls:
	.word	2
	.space	8
	.word	.LC447
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.4
	.word	2
	.space	8
	.word	.LC448
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.5
	.word	2
	.space	8
	.word	.LC449
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.6
	.word	2
	.space	8
	.word	.LC450
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.7
	.word	2
	.space	8
	.word	.LC451
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.8
	.word	2
	.space	8
	.word	.LC452
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.9
	.word	2
	.space	8
	.word	.LC453
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.10
	.word	2
	.space	8
	.word	.LC454
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.11
	.word	2
	.space	8
	.word	.LC455
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.12
	.word	2
	.space	8
	.word	.LC456
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.13
	.word	2
	.space	8
	.word	.LC457
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.14
	.word	2
	.space	8
	.word	.LC458
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.15
	.word	2
	.space	8
	.word	.LC459
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.16
	.word	2
	.space	8
	.word	.LC460
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.17
	.word	2
	.space	8
	.word	.LC461
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.18
	.word	2
	.space	8
	.word	.LC462
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.19
	.word	2
	.space	8
	.word	.LC463
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.20
	.word	2
	.space	8
	.word	.LC464
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.21
	.word	2
	.space	8
	.word	.LC465
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.22
	.word	2
	.space	8
	.word	.LC466
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.23
	.word	2
	.space	8
	.word	.LC467
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.24
	.word	2
	.space	8
	.word	.LC468
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.25
	.word	2
	.space	8
	.word	.LC469
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.26
	.word	2
	.space	8
	.word	.LC470
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.27
	.word	2
	.space	8
	.word	.LC471
	.space	4
	.word	19
	.space	4
	.word	snd_soc_info_volsw_s8
	.word	snd_soc_get_volsw_s8
	.word	snd_soc_put_volsw_s8
	.word	digital_gain
	.word	__compound_literal.28
	.word	2
	.space	8
	.word	.LC472
	.space	12
	.word	snd_soc_info_volsw
	.word	taiko_get_anc_slot
	.word	taiko_put_anc_slot
	.space	4
	.word	__compound_literal.29
	.word	2
	.space	8
	.word	.LC473
	.space	12
	.word	snd_soc_info_enum_ext
	.word	taiko_get_anc_func
	.word	taiko_put_anc_func
	.space	4
	.word	taiko_anc_func_enum
	.word	2
	.space	8
	.word	.LC474
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_get_enum_double
	.word	snd_soc_put_enum_double
	.space	4
	.word	cf_dec1_enum
	.word	2
	.space	8
	.word	.LC475
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_get_enum_double
	.word	snd_soc_put_enum_double
	.space	4
	.word	cf_dec2_enum
	.word	2
	.space	8
	.word	.LC476
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_get_enum_double
	.word	snd_soc_put_enum_double
	.space	4
	.word	cf_dec3_enum
	.word	2
	.space	8
	.word	.LC477
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_get_enum_double
	.word	snd_soc_put_enum_double
	.space	4
	.word	cf_dec4_enum
	.word	2
	.space	8
	.word	.LC478
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_get_enum_double
	.word	snd_soc_put_enum_double
	.space	4
	.word	cf_dec5_enum
	.word	2
	.space	8
	.word	.LC479
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_get_enum_double
	.word	snd_soc_put_enum_double
	.space	4
	.word	cf_dec6_enum
	.word	2
	.space	8
	.word	.LC480
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_get_enum_double
	.word	snd_soc_put_enum_double
	.space	4
	.word	cf_dec7_enum
	.word	2
	.space	8
	.word	.LC481
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_get_enum_double
	.word	snd_soc_put_enum_double
	.space	4
	.word	cf_dec8_enum
	.word	2
	.space	8
	.word	.LC482
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_get_enum_double
	.word	snd_soc_put_enum_double
	.space	4
	.word	cf_dec9_enum
	.word	2
	.space	8
	.word	.LC483
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_get_enum_double
	.word	snd_soc_put_enum_double
	.space	4
	.word	cf_dec10_enum
	.word	2
	.space	8
	.word	.LC484
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.space	4
	.word	__compound_literal.30
	.word	2
	.space	8
	.word	.LC485
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.space	4
	.word	__compound_literal.31
	.word	2
	.space	8
	.word	.LC486
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.space	4
	.word	__compound_literal.32
	.word	2
	.space	8
	.word	.LC487
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.space	4
	.word	__compound_literal.33
	.word	2
	.space	8
	.word	.LC488
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.space	4
	.word	__compound_literal.34
	.word	2
	.space	8
	.word	.LC489
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.space	4
	.word	__compound_literal.35
	.word	2
	.space	8
	.word	.LC490
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.space	4
	.word	__compound_literal.36
	.word	2
	.space	8
	.word	.LC491
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.space	4
	.word	__compound_literal.37
	.word	2
	.space	8
	.word	.LC492
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.space	4
	.word	__compound_literal.38
	.word	2
	.space	8
	.word	.LC493
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.space	4
	.word	__compound_literal.39
	.word	2
	.space	8
	.word	.LC494
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.space	4
	.word	__compound_literal.40
	.word	2
	.space	8
	.word	.LC495
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.space	4
	.word	__compound_literal.41
	.word	2
	.space	8
	.word	.LC496
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.space	4
	.word	__compound_literal.42
	.word	2
	.space	8
	.word	.LC497
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.space	4
	.word	__compound_literal.43
	.word	2
	.space	8
	.word	.LC498
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.space	4
	.word	__compound_literal.44
	.word	2
	.space	8
	.word	.LC499
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.space	4
	.word	__compound_literal.45
	.word	2
	.space	8
	.word	.LC500
	.space	12
	.word	snd_soc_info_volsw
	.word	snd_soc_get_volsw
	.word	snd_soc_put_volsw
	.space	4
	.word	__compound_literal.46
	.word	2
	.space	8
	.word	.LC501
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_get_enum_double
	.word	snd_soc_put_enum_double
	.space	4
	.word	cf_rxmix1_enum
	.word	2
	.space	8
	.word	.LC502
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_get_enum_double
	.word	snd_soc_put_enum_double
	.space	4
	.word	cf_rxmix2_enum
	.word	2
	.space	8
	.word	.LC503
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_get_enum_double
	.word	snd_soc_put_enum_double
	.space	4
	.word	cf_rxmix3_enum
	.word	2
	.space	8
	.word	.LC504
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_get_enum_double
	.word	snd_soc_put_enum_double
	.space	4
	.word	cf_rxmix4_enum
	.word	2
	.space	8
	.word	.LC505
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_get_enum_double
	.word	snd_soc_put_enum_double
	.space	4
	.word	cf_rxmix5_enum
	.word	2
	.space	8
	.word	.LC506
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_get_enum_double
	.word	snd_soc_put_enum_double
	.space	4
	.word	cf_rxmix6_enum
	.word	2
	.space	8
	.word	.LC507
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_get_enum_double
	.word	snd_soc_put_enum_double
	.space	4
	.word	cf_rxmix7_enum
	.word	2
	.space	8
	.word	.LC508
	.space	12
	.word	snd_soc_info_volsw
	.word	taiko_get_iir_enable_audio_mixer
	.word	taiko_put_iir_enable_audio_mixer
	.space	4
	.word	__compound_literal.47
	.word	2
	.space	8
	.word	.LC509
	.space	12
	.word	snd_soc_info_volsw
	.word	taiko_get_iir_enable_audio_mixer
	.word	taiko_put_iir_enable_audio_mixer
	.space	4
	.word	__compound_literal.48
	.word	2
	.space	8
	.word	.LC510
	.space	12
	.word	snd_soc_info_volsw
	.word	taiko_get_iir_enable_audio_mixer
	.word	taiko_put_iir_enable_audio_mixer
	.space	4
	.word	__compound_literal.49
	.word	2
	.space	8
	.word	.LC511
	.space	12
	.word	snd_soc_info_volsw
	.word	taiko_get_iir_enable_audio_mixer
	.word	taiko_put_iir_enable_audio_mixer
	.space	4
	.word	__compound_literal.50
	.word	2
	.space	8
	.word	.LC512
	.space	12
	.word	snd_soc_info_volsw
	.word	taiko_get_iir_enable_audio_mixer
	.word	taiko_put_iir_enable_audio_mixer
	.space	4
	.word	__compound_literal.51
	.word	2
	.space	8
	.word	.LC513
	.space	12
	.word	snd_soc_info_volsw
	.word	taiko_get_iir_enable_audio_mixer
	.word	taiko_put_iir_enable_audio_mixer
	.space	4
	.word	__compound_literal.52
	.word	2
	.space	8
	.word	.LC514
	.space	12
	.word	snd_soc_info_volsw
	.word	taiko_get_iir_enable_audio_mixer
	.word	taiko_put_iir_enable_audio_mixer
	.space	4
	.word	__compound_literal.53
	.word	2
	.space	8
	.word	.LC515
	.space	12
	.word	snd_soc_info_volsw
	.word	taiko_get_iir_enable_audio_mixer
	.word	taiko_put_iir_enable_audio_mixer
	.space	4
	.word	__compound_literal.54
	.word	2
	.space	8
	.word	.LC516
	.space	12
	.word	snd_soc_info_volsw
	.word	taiko_get_iir_enable_audio_mixer
	.word	taiko_put_iir_enable_audio_mixer
	.space	4
	.word	__compound_literal.55
	.word	2
	.space	8
	.word	.LC517
	.space	12
	.word	snd_soc_info_volsw
	.word	taiko_get_iir_enable_audio_mixer
	.word	taiko_put_iir_enable_audio_mixer
	.space	4
	.word	__compound_literal.56
	.word	2
	.space	8
	.word	.LC518
	.space	12
	.word	snd_soc_info_multi_ext
	.word	taiko_get_iir_band_audio_mixer
	.word	taiko_put_iir_band_audio_mixer
	.space	4
	.word	__compound_literal.57
	.word	2
	.space	8
	.word	.LC519
	.space	12
	.word	snd_soc_info_multi_ext
	.word	taiko_get_iir_band_audio_mixer
	.word	taiko_put_iir_band_audio_mixer
	.space	4
	.word	__compound_literal.58
	.word	2
	.space	8
	.word	.LC520
	.space	12
	.word	snd_soc_info_multi_ext
	.word	taiko_get_iir_band_audio_mixer
	.word	taiko_put_iir_band_audio_mixer
	.space	4
	.word	__compound_literal.59
	.word	2
	.space	8
	.word	.LC521
	.space	12
	.word	snd_soc_info_multi_ext
	.word	taiko_get_iir_band_audio_mixer
	.word	taiko_put_iir_band_audio_mixer
	.space	4
	.word	__compound_literal.60
	.word	2
	.space	8
	.word	.LC522
	.space	12
	.word	snd_soc_info_multi_ext
	.word	taiko_get_iir_band_audio_mixer
	.word	taiko_put_iir_band_audio_mixer
	.space	4
	.word	__compound_literal.61
	.word	2
	.space	8
	.word	.LC523
	.space	12
	.word	snd_soc_info_multi_ext
	.word	taiko_get_iir_band_audio_mixer
	.word	taiko_put_iir_band_audio_mixer
	.space	4
	.word	__compound_literal.62
	.word	2
	.space	8
	.word	.LC524
	.space	12
	.word	snd_soc_info_multi_ext
	.word	taiko_get_iir_band_audio_mixer
	.word	taiko_put_iir_band_audio_mixer
	.space	4
	.word	__compound_literal.63
	.word	2
	.space	8
	.word	.LC525
	.space	12
	.word	snd_soc_info_multi_ext
	.word	taiko_get_iir_band_audio_mixer
	.word	taiko_put_iir_band_audio_mixer
	.space	4
	.word	__compound_literal.64
	.word	2
	.space	8
	.word	.LC526
	.space	12
	.word	snd_soc_info_multi_ext
	.word	taiko_get_iir_band_audio_mixer
	.word	taiko_put_iir_band_audio_mixer
	.space	4
	.word	__compound_literal.65
	.word	2
	.space	8
	.word	.LC527
	.space	12
	.word	snd_soc_info_multi_ext
	.word	taiko_get_iir_band_audio_mixer
	.word	taiko_put_iir_band_audio_mixer
	.space	4
	.word	__compound_literal.66
	.word	2
	.space	8
	.word	.LC528
	.space	12
	.word	snd_soc_info_volsw
	.word	taiko_get_compander
	.word	taiko_set_compander
	.space	4
	.word	__compound_literal.67
	.word	2
	.space	8
	.word	.LC529
	.space	12
	.word	snd_soc_info_volsw
	.word	taiko_get_compander
	.word	taiko_set_compander
	.space	4
	.word	__compound_literal.68
	.word	2
	.space	8
	.word	.LC530
	.space	12
	.word	snd_soc_info_volsw
	.word	taiko_get_compander
	.word	taiko_set_compander
	.space	4
	.word	__compound_literal.69
	.word	2
	.space	8
	.word	.LC531
	.space	12
	.word	snd_soc_info_enum_ext
	.word	taiko_mad_input_get
	.word	taiko_mad_input_put
	.space	4
	.word	taiko_conn_mad_enum
	.type	taiko_conn_mad_enum, %object
	.size	taiko_conn_mad_enum, 32
taiko_conn_mad_enum:
	.space	8
	.word	16
	.space	4
	.word	taiko_conn_mad_text
	.space	12
	.type	class_h_dsm_mux, %object
	.size	class_h_dsm_mux, 48
class_h_dsm_mux:
	.word	2
	.space	8
	.word	.LC532
	.space	12
	.word	snd_soc_info_enum_double
	.word	snd_soc_dapm_get_enum_double
	.word	snd_soc_dapm_put_enum_double
	.space	4
	.word	class_h_dsm_enum
	.type	class_h_dsm_enum, %object
	.size	class_h_dsm_enum, 32
class_h_dsm_enum:
	.short	944
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	3
	.space	4
	.word	class_h_dsm_text
	.space	12
	.type	class_h_dsm_text, %object
	.size	class_h_dsm_text, 12
class_h_dsm_text:
	.word	.LC363
	.word	.LC341
	.word	.LC533
	.type	cf_rxmix7_enum, %object
	.size	cf_rxmix7_enum, 32
cf_rxmix7_enum:
	.short	739
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	3
	.space	4
	.word	cf_text
	.space	12
	.type	cf_rxmix6_enum, %object
	.size	cf_rxmix6_enum, 32
cf_rxmix6_enum:
	.short	731
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	3
	.space	4
	.word	cf_text
	.space	12
	.type	cf_rxmix5_enum, %object
	.size	cf_rxmix5_enum, 32
cf_rxmix5_enum:
	.short	723
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	3
	.space	4
	.word	cf_text
	.space	12
	.type	cf_rxmix4_enum, %object
	.size	cf_rxmix4_enum, 32
cf_rxmix4_enum:
	.short	715
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	3
	.space	4
	.word	cf_text
	.space	12
	.type	cf_rxmix3_enum, %object
	.size	cf_rxmix3_enum, 32
cf_rxmix3_enum:
	.short	707
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	3
	.space	4
	.word	cf_text
	.space	12
	.type	cf_rxmix2_enum, %object
	.size	cf_rxmix2_enum, 32
cf_rxmix2_enum:
	.short	699
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	3
	.space	4
	.word	cf_text
	.space	12
	.type	cf_rxmix1_enum, %object
	.size	cf_rxmix1_enum, 32
cf_rxmix1_enum:
	.short	691
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	3
	.space	4
	.word	cf_text
	.space	12
	.type	cf_dec10_enum, %object
	.size	cf_dec10_enum, 32
cf_dec10_enum:
	.short	619
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	3
	.space	4
	.word	cf_text
	.space	12
	.type	cf_dec9_enum, %object
	.size	cf_dec9_enum, 32
cf_dec9_enum:
	.short	611
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	3
	.space	4
	.word	cf_text
	.space	12
	.type	cf_dec8_enum, %object
	.size	cf_dec8_enum, 32
cf_dec8_enum:
	.short	603
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	3
	.space	4
	.word	cf_text
	.space	12
	.type	cf_dec7_enum, %object
	.size	cf_dec7_enum, 32
cf_dec7_enum:
	.short	595
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	3
	.space	4
	.word	cf_text
	.space	12
	.type	cf_dec6_enum, %object
	.size	cf_dec6_enum, 32
cf_dec6_enum:
	.short	587
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	3
	.space	4
	.word	cf_text
	.space	12
	.type	cf_dec5_enum, %object
	.size	cf_dec5_enum, 32
cf_dec5_enum:
	.short	579
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	3
	.space	4
	.word	cf_text
	.space	12
	.type	cf_dec4_enum, %object
	.size	cf_dec4_enum, 32
cf_dec4_enum:
	.short	571
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	3
	.space	4
	.word	cf_text
	.space	12
	.type	cf_dec3_enum, %object
	.size	cf_dec3_enum, 32
cf_dec3_enum:
	.short	563
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	3
	.space	4
	.word	cf_text
	.space	12
	.type	cf_dec2_enum, %object
	.size	cf_dec2_enum, 32
cf_dec2_enum:
	.short	555
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	3
	.space	4
	.word	cf_text
	.space	12
	.type	cf_dec1_enum, %object
	.size	cf_dec1_enum, 32
cf_dec1_enum:
	.short	547
	.space	2
	.byte	4
	.byte	4
	.space	2
	.word	3
	.space	4
	.word	cf_text
	.space	12
	.type	cf_text, %object
	.size	cf_text, 12
cf_text:
	.word	.LC534
	.word	.LC535
	.word	.LC536
	.type	taiko_anc_func_enum, %object
	.size	taiko_anc_func_enum, 32
taiko_anc_func_enum:
	.space	8
	.word	2
	.space	4
	.word	taiko_anc_func_text
	.space	12
	.type	taiko_anc_func_text, %object
	.size	taiko_anc_func_text, 8
taiko_anc_func_text:
	.word	.LC537
	.word	.LC538
	.type	analog_gain, %object
	.size	analog_gain, 16
analog_gain:
	.word	1
	.word	8
	.word	0
	.word	65561
	.type	line_gain, %object
	.size	line_gain, 16
line_gain:
	.word	1
	.word	8
	.word	0
	.word	65543
	.type	digital_gain, %object
	.size	digital_gain, 16
digital_gain:
	.word	1
	.word	8
	.word	0
	.word	1
	.type	__param_str_spkr_drv_wrnd, %object
	.size	__param_str_spkr_drv_wrnd, 22
__param_str_spkr_drv_wrnd:
	.ascii	"wcd9320.spkr_drv_wrnd\000"
	.data
	.align	3
	.set	.LANCHOR1,. + 0
	.type	spkr_drv_wrnd, %object
	.size	spkr_drv_wrnd, 4
spkr_drv_wrnd:
	.word	1
	.type	remote_route_enable, %object
	.size	remote_route_enable, 4
remote_route_enable:
	.word	es705_remote_route_enable
	.type	slim_get_channel_map, %object
	.size	slim_get_channel_map, 4
slim_get_channel_map:
	.word	es705_slim_get_channel_map
	.type	taiko_codec_driver, %object
	.size	taiko_codec_driver, 80
taiko_codec_driver:
	.word	taiko_probe
	.word	taiko_remove
	.space	12
	.word	.LC125
	.space	4
	.word	0
	.space	36
	.word	taiko_pm_ops
	.space	4
	.space	4
	.type	_rs.33025, %object
	.size	_rs.33025, 24
_rs.33025:
	.word	0
	.word	1250
	.word	10
	.space	12
	.type	_rs.33028, %object
	.size	_rs.33028, 24
_rs.33028:
	.word	0
	.word	1250
	.word	10
	.space	12
	.type	audio_reg_cfg, %object
	.size	audio_reg_cfg, 360
audio_reg_cfg:
	.word	1
	.word	3040
	.word	4
	.word	1
	.short	8
	.short	0
	.word	1
	.word	3044
	.word	7
	.word	15
	.short	8
	.short	0
	.word	1
	.word	3045
	.word	10
	.word	1
	.short	8
	.short	0
	.word	1
	.word	2223
	.word	13
	.word	1
	.short	8
	.short	0
	.word	1
	.word	2199
	.word	18
	.word	1
	.short	8
	.short	0
	.word	1
	.word	2203
	.word	23
	.word	1
	.short	8
	.short	0
	.word	1
	.word	2207
	.word	28
	.word	1
	.short	8
	.short	0
	.word	1
	.word	2128
	.word	33
	.word	30
	.short	8
	.short	1
	.word	1
	.word	2128
	.word	34
	.word	1
	.short	8
	.short	1
	.word	1
	.word	2112
	.word	35
	.word	30
	.short	8
	.short	1
	.word	1
	.word	2112
	.word	36
	.word	1
	.short	8
	.short	1
	.word	1
	.word	2562
	.word	41
	.word	4
	.short	8
	.short	0
	.word	1
	.word	2562
	.word	42
	.word	8
	.short	8
	.short	0
	.word	1
	.word	2572
	.word	43
	.word	255
	.short	8
	.short	0
	.word	1
	.word	2223
	.word	16
	.word	8
	.short	8
	.short	0
	.word	1
	.word	2199
	.word	21
	.word	8
	.short	8
	.short	0
	.word	1
	.word	2203
	.word	26
	.word	8
	.short	8
	.short	0
	.word	1
	.word	2207
	.word	31
	.word	8
	.short	8
	.short	0
	.space	4
	.type	taiko_dai, %object
	.size	taiko_dai, 1088
taiko_dai:
	.word	.LC299
	.word	0
	.space	24
	.word	taiko_dai_ops
	.space	44
	.word	.LC134
	.space	4
	.word	6
	.word	0
	.word	5290
	.word	8000
	.word	192000
	.word	1
	.word	2
	.space	4
	.space	16
	.word	.LC300
	.word	1
	.space	24
	.word	taiko_dai_ops
	.space	4
	.word	.LC250
	.space	4
	.word	4
	.word	0
	.word	5290
	.word	8000
	.word	192000
	.word	1
	.word	4
	.space	4
	.space	56
	.word	.LC301
	.word	2
	.space	24
	.word	taiko_dai_ops
	.space	44
	.word	.LC136
	.space	4
	.word	6
	.word	0
	.word	5290
	.word	8000
	.word	192000
	.word	1
	.word	2
	.space	4
	.space	16
	.word	.LC302
	.word	3
	.space	24
	.word	taiko_dai_ops
	.space	4
	.word	.LC252
	.space	4
	.word	4
	.word	0
	.word	5290
	.word	8000
	.word	192000
	.word	1
	.word	8
	.space	4
	.space	56
	.word	.LC303
	.word	5
	.space	24
	.word	taiko_dai_ops
	.space	4
	.word	.LC254
	.space	4
	.word	4
	.word	0
	.word	5290
	.word	8000
	.word	48000
	.word	1
	.word	2
	.space	4
	.space	56
	.word	.LC304
	.word	4
	.space	24
	.word	taiko_dai_ops
	.space	44
	.word	.LC138
	.space	4
	.word	6
	.word	0
	.word	5290
	.word	8000
	.word	192000
	.word	1
	.word	2
	.space	4
	.space	16
	.word	.LC305
	.word	6
	.space	24
	.word	taiko_dai_ops
	.space	4
	.word	.LC256
	.space	4
	.word	4
	.word	0
	.word	128
	.word	48000
	.word	48000
	.word	2
	.word	2
	.space	4
	.space	56
	.word	.LC306
	.word	7
	.space	24
	.word	taiko_dai_ops
	.space	4
	.word	.LC258
	.space	4
	.word	4
	.word	0
	.word	8
	.word	16000
	.word	16000
	.word	1
	.word	1
	.space	4
	.space	56
	.type	soc_codec_dev_taiko, %object
	.size	soc_codec_dev_taiko, 120
soc_codec_dev_taiko:
	.word	taiko_codec_probe
	.word	taiko_codec_remove
	.space	8
	.word	taiko_snd_controls
	.word	85
	.word	taiko_dapm_widgets
	.word	167
	.word	audio_map
	.word	483
	.space	8
	.word	taiko_read
	.word	taiko_write
	.space	4
	.word	taiko_volatile
	.word	taiko_readable
	.space	4
	.word	1024
	.space	2
	.short	1
	.word	taiko_reset_reg_defaults
	.space	36
	.type	taiko_i2s_dai, %object
	.size	taiko_i2s_dai, 544
taiko_i2s_dai:
	.word	.LC295
	.word	0
	.space	24
	.word	taiko_dai_ops
	.space	44
	.word	.LC134
	.space	4
	.word	4
	.word	0
	.word	5290
	.word	8000
	.word	192000
	.word	1
	.word	4
	.space	4
	.space	16
	.word	.LC296
	.word	1
	.space	24
	.word	taiko_dai_ops
	.space	4
	.word	.LC250
	.space	4
	.word	4
	.word	0
	.word	5290
	.word	8000
	.word	192000
	.word	1
	.word	4
	.space	4
	.space	56
	.word	.LC297
	.word	0
	.space	24
	.word	taiko_dai_ops
	.space	44
	.word	.LC136
	.space	4
	.word	4
	.word	0
	.word	5290
	.word	8000
	.word	192000
	.word	1
	.word	4
	.space	4
	.space	16
	.word	.LC298
	.word	1
	.space	24
	.word	taiko_dai_ops
	.space	4
	.word	.LC252
	.space	4
	.word	4
	.word	0
	.word	5290
	.word	8000
	.word	192000
	.word	1
	.word	4
	.space	4
	.space	56
	.type	taiko_reg_address, %object
	.size	taiko_reg_address, 6
taiko_reg_address:
	.short	317
	.short	318
	.short	319
	.space	2
	.type	remote_add_codec_controls, %object
	.size	remote_add_codec_controls, 4
remote_add_codec_controls:
	.word	es705_remote_add_codec_controls
	.type	taiko_slimbus_slave_port_cfg, %object
	.size	taiko_slimbus_slave_port_cfg, 32
taiko_slimbus_slave_port_cfg:
	.word	1
	.short	0
	.short	0
	.short	0
	.short	16
	.short	0
	.short	1
	.space	16
	.type	remote_cfg_slim_rx, %object
	.size	remote_cfg_slim_rx, 4
remote_cfg_slim_rx:
	.word	es705_remote_cfg_slim_rx
	.type	remote_close_slim_rx, %object
	.size	remote_close_slim_rx, 4
remote_close_slim_rx:
	.word	es705_remote_close_slim_rx
	.type	slim_hw_params, %object
	.size	slim_hw_params, 4
slim_hw_params:
	.word	es705_slim_hw_params
	.type	slim_set_channel_map, %object
	.size	slim_set_channel_map, 4
slim_set_channel_map:
	.word	es705_slim_set_channel_map
	.type	remote_cfg_slim_tx, %object
	.size	remote_cfg_slim_tx, 4
remote_cfg_slim_tx:
	.word	es705_remote_cfg_slim_tx
	.type	remote_close_slim_tx, %object
	.size	remote_close_slim_tx, 4
remote_close_slim_tx:
	.word	es705_remote_close_slim_tx
	.type	taiko_audio_reg_cfg, %object
	.size	taiko_audio_reg_cfg, 8
taiko_audio_reg_cfg:
	.word	18
	.word	audio_reg_cfg
	.type	taiko_cdc_aanc_version, %object
	.size	taiko_cdc_aanc_version, 8
taiko_cdc_aanc_version:
	.word	1
	.word	2
	.type	clip_bank_sel, %object
	.size	clip_bank_sel, 24
clip_bank_sel:
	.word	1
	.word	4
	.word	0
	.word	1
	.word	2
	.word	3
	.type	taiko_clip_reg_cfg, %object
	.size	taiko_clip_reg_cfg, 8
taiko_clip_reg_cfg:
	.word	9
	.word	clip_reg_cfg
	.type	taiko_dai_ops, %object
	.size	taiko_dai_ops, 68
taiko_dai_ops:
	.word	taiko_set_dai_sysclk
	.space	8
	.word	taiko_set_dai_fmt
	.space	4
	.word	taiko_esxxx_set_channel_map
	.space	4
	.word	taiko_esxxx_get_channel_map
	.space	4
	.word	taiko_esxxx_startup
	.word	taiko_esxxx_shutdown
	.word	taiko_esxxx_hw_params
	.space	4
	.word	taiko_prepare
	.space	12
	.type	__compound_literal.120, %object
	.size	__compound_literal.120, 32
__compound_literal.120:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	9
	.word	9
	.word	0
	.type	__compound_literal.119, %object
	.size	__compound_literal.119, 32
__compound_literal.119:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	8
	.word	8
	.word	0
	.type	__compound_literal.118, %object
	.size	__compound_literal.118, 32
__compound_literal.118:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	7
	.word	7
	.word	0
	.type	__compound_literal.117, %object
	.size	__compound_literal.117, 32
__compound_literal.117:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	6
	.word	6
	.word	0
	.type	__compound_literal.116, %object
	.size	__compound_literal.116, 32
__compound_literal.116:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	5
	.word	5
	.word	0
	.type	__compound_literal.115, %object
	.size	__compound_literal.115, 32
__compound_literal.115:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	4
	.word	4
	.word	0
	.type	__compound_literal.114, %object
	.size	__compound_literal.114, 32
__compound_literal.114:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	3
	.word	3
	.word	0
	.type	__compound_literal.113, %object
	.size	__compound_literal.113, 32
__compound_literal.113:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.112, %object
	.size	__compound_literal.112, 32
__compound_literal.112:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	1
	.word	1
	.word	0
	.type	__compound_literal.111, %object
	.size	__compound_literal.111, 32
__compound_literal.111:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.110, %object
	.size	__compound_literal.110, 32
__compound_literal.110:
	.space	4
	.word	1
	.word	1
	.word	493
	.word	493
	.word	3
	.word	3
	.word	0
	.type	__compound_literal.109, %object
	.size	__compound_literal.109, 32
__compound_literal.109:
	.space	4
	.word	1
	.word	1
	.word	780
	.word	780
	.word	4
	.word	4
	.word	0
	.type	__compound_literal.108, %object
	.size	__compound_literal.108, 32
__compound_literal.108:
	.space	4
	.word	1
	.word	1
	.word	475
	.word	475
	.word	6
	.word	6
	.word	0
	.type	__compound_literal.107, %object
	.size	__compound_literal.107, 32
__compound_literal.107:
	.space	4
	.word	1
	.word	1
	.word	471
	.word	471
	.word	6
	.word	6
	.word	0
	.type	__compound_literal.106, %object
	.size	__compound_literal.106, 32
__compound_literal.106:
	.space	4
	.word	1
	.word	1
	.word	412
	.word	412
	.word	1
	.word	1
	.word	0
	.type	__compound_literal.105, %object
	.size	__compound_literal.105, 32
__compound_literal.105:
	.space	4
	.word	1
	.word	1
	.word	412
	.word	412
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.104, %object
	.size	__compound_literal.104, 32
__compound_literal.104:
	.space	4
	.word	1
	.word	1
	.word	412
	.word	412
	.word	3
	.word	3
	.word	0
	.type	__compound_literal.103, %object
	.size	__compound_literal.103, 32
__compound_literal.103:
	.space	4
	.word	1
	.word	1
	.word	412
	.word	412
	.word	4
	.word	4
	.word	0
	.type	__compound_literal.102, %object
	.size	__compound_literal.102, 32
__compound_literal.102:
	.space	4
	.word	1
	.word	1
	.word	412
	.word	412
	.word	5
	.word	5
	.word	0
	.type	__compound_literal.101, %object
	.size	__compound_literal.101, 32
__compound_literal.101:
	.space	4
	.word	1
	.word	1
	.word	412
	.word	412
	.word	6
	.word	6
	.word	0
	.type	__compound_literal.100, %object
	.size	__compound_literal.100, 32
__compound_literal.100:
	.space	4
	.word	1
	.word	1
	.word	412
	.word	412
	.word	7
	.word	7
	.word	0
	.type	__compound_literal.99, %object
	.size	__compound_literal.99, 32
__compound_literal.99:
	.space	4
	.word	1
	.word	1
	.word	433
	.word	433
	.word	6
	.word	6
	.word	0
	.type	__compound_literal.98, %object
	.size	__compound_literal.98, 32
__compound_literal.98:
	.space	4
	.word	1
	.word	1
	.word	444
	.word	444
	.word	5
	.word	5
	.word	0
	.type	__compound_literal.97, %object
	.size	__compound_literal.97, 32
__compound_literal.97:
	.space	4
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.type	__compound_literal.96, %object
	.size	__compound_literal.96, 32
__compound_literal.96:
	.space	4
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.95, %object
	.size	__compound_literal.95, 32
__compound_literal.95:
	.space	4
	.word	19
	.word	19
	.word	361
	.word	361
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.94, %object
	.size	__compound_literal.94, 32
__compound_literal.94:
	.space	4
	.word	19
	.word	19
	.word	359
	.word	359
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.93, %object
	.size	__compound_literal.93, 32
__compound_literal.93:
	.space	4
	.word	19
	.word	19
	.word	351
	.word	351
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.92, %object
	.size	__compound_literal.92, 32
__compound_literal.92:
	.space	4
	.word	19
	.word	19
	.word	349
	.word	349
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.91, %object
	.size	__compound_literal.91, 32
__compound_literal.91:
	.space	4
	.word	19
	.word	19
	.word	341
	.word	341
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.90, %object
	.size	__compound_literal.90, 32
__compound_literal.90:
	.space	4
	.word	19
	.word	19
	.word	339
	.word	339
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.89, %object
	.size	__compound_literal.89, 32
__compound_literal.89:
	.space	4
	.word	8
	.word	8
	.word	480
	.word	480
	.word	3
	.word	3
	.word	1
	.type	__compound_literal.88, %object
	.size	__compound_literal.88, 32
__compound_literal.88:
	.space	4
	.word	20
	.word	20
	.word	473
	.word	473
	.word	0
	.word	0
	.word	1
	.type	__compound_literal.87, %object
	.size	__compound_literal.87, 32
__compound_literal.87:
	.space	4
	.word	20
	.word	20
	.word	469
	.word	469
	.word	0
	.word	0
	.word	1
	.type	__compound_literal.86, %object
	.size	__compound_literal.86, 32
__compound_literal.86:
	.space	4
	.word	20
	.word	20
	.word	465
	.word	465
	.word	0
	.word	0
	.word	1
	.type	__compound_literal.85, %object
	.size	__compound_literal.85, 32
__compound_literal.85:
	.space	4
	.word	20
	.word	20
	.word	461
	.word	461
	.word	0
	.word	0
	.word	1
	.type	__compound_literal.84, %object
	.size	__compound_literal.84, 32
__compound_literal.84:
	.space	4
	.word	20
	.word	20
	.word	436
	.word	436
	.word	0
	.word	0
	.word	1
	.type	__compound_literal.83, %object
	.size	__compound_literal.83, 32
__compound_literal.83:
	.space	4
	.word	20
	.word	20
	.word	430
	.word	430
	.word	0
	.word	0
	.word	1
	.type	__compound_literal.82, %object
	.size	__compound_literal.82, 32
__compound_literal.82:
	.space	4
	.word	3
	.word	3
	.word	359
	.word	359
	.word	1
	.word	1
	.word	0
	.type	__compound_literal.81, %object
	.size	__compound_literal.81, 32
__compound_literal.81:
	.space	4
	.word	3
	.word	3
	.word	359
	.word	359
	.word	5
	.word	5
	.word	0
	.type	__compound_literal.80, %object
	.size	__compound_literal.80, 32
__compound_literal.80:
	.space	4
	.word	3
	.word	3
	.word	349
	.word	349
	.word	1
	.word	1
	.word	0
	.type	__compound_literal.79, %object
	.size	__compound_literal.79, 32
__compound_literal.79:
	.space	4
	.word	3
	.word	3
	.word	349
	.word	349
	.word	5
	.word	5
	.word	0
	.type	__compound_literal.78, %object
	.size	__compound_literal.78, 32
__compound_literal.78:
	.space	4
	.word	3
	.word	3
	.word	339
	.word	339
	.word	1
	.word	1
	.word	0
	.type	__compound_literal.77, %object
	.size	__compound_literal.77, 32
__compound_literal.77:
	.space	4
	.word	3
	.word	3
	.word	339
	.word	339
	.word	5
	.word	5
	.word	0
	.type	__compound_literal.76, %object
	.size	__compound_literal.76, 32
__compound_literal.76:
	.space	4
	.word	7
	.word	7
	.word	480
	.word	480
	.word	3
	.word	3
	.word	1
	.type	__compound_literal.75, %object
	.size	__compound_literal.75, 32
__compound_literal.75:
	.space	4
	.word	20
	.word	20
	.word	473
	.word	473
	.word	0
	.word	0
	.word	1
	.type	__compound_literal.74, %object
	.size	__compound_literal.74, 32
__compound_literal.74:
	.space	4
	.word	20
	.word	20
	.word	469
	.word	469
	.word	0
	.word	0
	.word	1
	.type	__compound_literal.73, %object
	.size	__compound_literal.73, 32
__compound_literal.73:
	.space	4
	.word	20
	.word	20
	.word	465
	.word	465
	.word	0
	.word	0
	.word	1
	.type	__compound_literal.72, %object
	.size	__compound_literal.72, 32
__compound_literal.72:
	.space	4
	.word	20
	.word	20
	.word	461
	.word	461
	.word	0
	.word	0
	.word	1
	.type	__compound_literal.71, %object
	.size	__compound_literal.71, 32
__compound_literal.71:
	.space	4
	.word	20
	.word	20
	.word	436
	.word	436
	.word	0
	.word	0
	.word	1
	.type	__compound_literal.70, %object
	.size	__compound_literal.70, 32
__compound_literal.70:
	.space	4
	.word	20
	.word	20
	.word	430
	.word	430
	.word	0
	.word	0
	.word	1
	.type	__compound_literal.69, %object
	.size	__compound_literal.69, 32
__compound_literal.69:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.68, %object
	.size	__compound_literal.68, 32
__compound_literal.68:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	1
	.word	1
	.word	0
	.type	__compound_literal.67, %object
	.size	__compound_literal.67, 32
__compound_literal.67:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.66, %object
	.size	__compound_literal.66, 36
__compound_literal.66:
	.space	4
	.word	255
	.word	255
	.word	5
	.word	1
	.space	4
	.word	4
	.word	4
	.word	0
	.type	__compound_literal.65, %object
	.size	__compound_literal.65, 36
__compound_literal.65:
	.space	4
	.word	255
	.word	255
	.word	5
	.word	1
	.space	4
	.word	3
	.word	3
	.word	0
	.type	__compound_literal.64, %object
	.size	__compound_literal.64, 36
__compound_literal.64:
	.space	4
	.word	255
	.word	255
	.word	5
	.word	1
	.space	4
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.63, %object
	.size	__compound_literal.63, 36
__compound_literal.63:
	.space	4
	.word	255
	.word	255
	.word	5
	.word	1
	.space	4
	.word	1
	.word	1
	.word	0
	.type	__compound_literal.62, %object
	.size	__compound_literal.62, 36
__compound_literal.62:
	.space	4
	.word	255
	.word	255
	.word	5
	.word	1
	.space	4
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.61, %object
	.size	__compound_literal.61, 36
__compound_literal.61:
	.space	4
	.word	255
	.word	255
	.word	5
	.word	0
	.space	4
	.word	4
	.word	4
	.word	0
	.type	__compound_literal.60, %object
	.size	__compound_literal.60, 36
__compound_literal.60:
	.space	4
	.word	255
	.word	255
	.word	5
	.word	0
	.space	4
	.word	3
	.word	3
	.word	0
	.type	__compound_literal.59, %object
	.size	__compound_literal.59, 36
__compound_literal.59:
	.space	4
	.word	255
	.word	255
	.word	5
	.word	0
	.space	4
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.58, %object
	.size	__compound_literal.58, 36
__compound_literal.58:
	.space	4
	.word	255
	.word	255
	.word	5
	.word	0
	.space	4
	.word	1
	.word	1
	.word	0
	.type	__compound_literal.57, %object
	.size	__compound_literal.57, 36
__compound_literal.57:
	.space	4
	.word	255
	.word	255
	.word	5
	.word	0
	.space	4
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.56, %object
	.size	__compound_literal.56, 32
__compound_literal.56:
	.space	4
	.word	1
	.word	1
	.word	1
	.word	1
	.word	4
	.word	4
	.word	0
	.type	__compound_literal.55, %object
	.size	__compound_literal.55, 32
__compound_literal.55:
	.space	4
	.word	1
	.word	1
	.word	1
	.word	1
	.word	3
	.word	3
	.word	0
	.type	__compound_literal.54, %object
	.size	__compound_literal.54, 32
__compound_literal.54:
	.space	4
	.word	1
	.word	1
	.word	1
	.word	1
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.53, %object
	.size	__compound_literal.53, 32
__compound_literal.53:
	.space	4
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	1
	.word	0
	.type	__compound_literal.52, %object
	.size	__compound_literal.52, 32
__compound_literal.52:
	.space	4
	.word	1
	.word	1
	.word	1
	.word	1
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.51, %object
	.size	__compound_literal.51, 32
__compound_literal.51:
	.space	4
	.word	1
	.word	1
	.word	0
	.word	0
	.word	4
	.word	4
	.word	0
	.type	__compound_literal.50, %object
	.size	__compound_literal.50, 32
__compound_literal.50:
	.space	4
	.word	1
	.word	1
	.word	0
	.word	0
	.word	3
	.word	3
	.word	0
	.type	__compound_literal.49, %object
	.size	__compound_literal.49, 32
__compound_literal.49:
	.space	4
	.word	1
	.word	1
	.word	0
	.word	0
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.48, %object
	.size	__compound_literal.48, 32
__compound_literal.48:
	.space	4
	.word	1
	.word	1
	.word	0
	.word	0
	.word	1
	.word	1
	.word	0
	.type	__compound_literal.47, %object
	.size	__compound_literal.47, 32
__compound_literal.47:
	.space	4
	.word	1
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.46, %object
	.size	__compound_literal.46, 32
__compound_literal.46:
	.space	4
	.word	1
	.word	1
	.word	740
	.word	740
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.45, %object
	.size	__compound_literal.45, 32
__compound_literal.45:
	.space	4
	.word	1
	.word	1
	.word	732
	.word	732
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.44, %object
	.size	__compound_literal.44, 32
__compound_literal.44:
	.space	4
	.word	1
	.word	1
	.word	724
	.word	724
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.43, %object
	.size	__compound_literal.43, 32
__compound_literal.43:
	.space	4
	.word	1
	.word	1
	.word	716
	.word	716
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.42, %object
	.size	__compound_literal.42, 32
__compound_literal.42:
	.space	4
	.word	1
	.word	1
	.word	708
	.word	708
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.41, %object
	.size	__compound_literal.41, 32
__compound_literal.41:
	.space	4
	.word	1
	.word	1
	.word	700
	.word	700
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.40, %object
	.size	__compound_literal.40, 32
__compound_literal.40:
	.space	4
	.word	1
	.word	1
	.word	692
	.word	692
	.word	2
	.word	2
	.word	0
	.type	__compound_literal.39, %object
	.size	__compound_literal.39, 32
__compound_literal.39:
	.space	4
	.word	1
	.word	1
	.word	619
	.word	619
	.word	3
	.word	3
	.word	0
	.type	__compound_literal.38, %object
	.size	__compound_literal.38, 32
__compound_literal.38:
	.space	4
	.word	1
	.word	1
	.word	611
	.word	611
	.word	3
	.word	3
	.word	0
	.type	__compound_literal.37, %object
	.size	__compound_literal.37, 32
__compound_literal.37:
	.space	4
	.word	1
	.word	1
	.word	603
	.word	603
	.word	3
	.word	3
	.word	0
	.type	__compound_literal.36, %object
	.size	__compound_literal.36, 32
__compound_literal.36:
	.space	4
	.word	1
	.word	1
	.word	595
	.word	595
	.word	3
	.word	3
	.word	0
	.type	__compound_literal.35, %object
	.size	__compound_literal.35, 32
__compound_literal.35:
	.space	4
	.word	1
	.word	1
	.word	587
	.word	587
	.word	3
	.word	3
	.word	0
	.type	__compound_literal.34, %object
	.size	__compound_literal.34, 32
__compound_literal.34:
	.space	4
	.word	1
	.word	1
	.word	579
	.word	579
	.word	3
	.word	3
	.word	0
	.type	__compound_literal.33, %object
	.size	__compound_literal.33, 32
__compound_literal.33:
	.space	4
	.word	1
	.word	1
	.word	571
	.word	571
	.word	3
	.word	3
	.word	0
	.type	__compound_literal.32, %object
	.size	__compound_literal.32, 32
__compound_literal.32:
	.space	4
	.word	1
	.word	1
	.word	563
	.word	563
	.word	3
	.word	3
	.word	0
	.type	__compound_literal.31, %object
	.size	__compound_literal.31, 32
__compound_literal.31:
	.space	4
	.word	1
	.word	1
	.word	555
	.word	555
	.word	3
	.word	3
	.word	0
	.type	__compound_literal.30, %object
	.size	__compound_literal.30, 32
__compound_literal.30:
	.space	4
	.word	1
	.word	1
	.word	547
	.word	547
	.word	3
	.word	3
	.word	0
	.type	__compound_literal.29, %object
	.size	__compound_literal.29, 32
__compound_literal.29:
	.space	4
	.word	100
	.word	100
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.28, %object
	.size	__compound_literal.28, 32
__compound_literal.28:
	.word	-84
	.word	40
	.word	40
	.word	851
	.space	16
	.type	__compound_literal.27, %object
	.size	__compound_literal.27, 32
__compound_literal.27:
	.word	-84
	.word	40
	.word	40
	.word	850
	.space	16
	.type	__compound_literal.26, %object
	.size	__compound_literal.26, 32
__compound_literal.26:
	.word	-84
	.word	40
	.word	40
	.word	849
	.space	16
	.type	__compound_literal.25, %object
	.size	__compound_literal.25, 32
__compound_literal.25:
	.word	-84
	.word	40
	.word	40
	.word	848
	.space	16
	.type	__compound_literal.24, %object
	.size	__compound_literal.24, 32
__compound_literal.24:
	.word	-84
	.word	40
	.word	40
	.word	835
	.space	16
	.type	__compound_literal.23, %object
	.size	__compound_literal.23, 32
__compound_literal.23:
	.word	-84
	.word	40
	.word	40
	.word	834
	.space	16
	.type	__compound_literal.22, %object
	.size	__compound_literal.22, 32
__compound_literal.22:
	.word	-84
	.word	40
	.word	40
	.word	833
	.space	16
	.type	__compound_literal.21, %object
	.size	__compound_literal.21, 32
__compound_literal.21:
	.word	-84
	.word	40
	.word	40
	.word	832
	.space	16
	.type	__compound_literal.20, %object
	.size	__compound_literal.20, 32
__compound_literal.20:
	.word	-84
	.word	40
	.word	40
	.word	617
	.space	16
	.type	__compound_literal.19, %object
	.size	__compound_literal.19, 32
__compound_literal.19:
	.word	-84
	.word	40
	.word	40
	.word	609
	.space	16
	.type	__compound_literal.18, %object
	.size	__compound_literal.18, 32
__compound_literal.18:
	.word	-84
	.word	40
	.word	40
	.word	601
	.space	16
	.type	__compound_literal.17, %object
	.size	__compound_literal.17, 32
__compound_literal.17:
	.word	-84
	.word	40
	.word	40
	.word	593
	.space	16
	.type	__compound_literal.16, %object
	.size	__compound_literal.16, 32
__compound_literal.16:
	.word	-84
	.word	40
	.word	40
	.word	585
	.space	16
	.type	__compound_literal.15, %object
	.size	__compound_literal.15, 32
__compound_literal.15:
	.word	-84
	.word	40
	.word	40
	.word	577
	.space	16
	.type	__compound_literal.14, %object
	.size	__compound_literal.14, 32
__compound_literal.14:
	.word	-84
	.word	40
	.word	40
	.word	569
	.space	16
	.type	__compound_literal.13, %object
	.size	__compound_literal.13, 32
__compound_literal.13:
	.word	-84
	.word	40
	.word	40
	.word	561
	.space	16
	.type	__compound_literal.12, %object
	.size	__compound_literal.12, 32
__compound_literal.12:
	.word	-84
	.word	40
	.word	40
	.word	553
	.space	16
	.type	__compound_literal.11, %object
	.size	__compound_literal.11, 32
__compound_literal.11:
	.word	-84
	.word	40
	.word	40
	.word	545
	.space	16
	.type	__compound_literal.10, %object
	.size	__compound_literal.10, 32
__compound_literal.10:
	.word	-84
	.word	40
	.word	40
	.word	743
	.space	16
	.type	__compound_literal.9, %object
	.size	__compound_literal.9, 32
__compound_literal.9:
	.word	-84
	.word	40
	.word	40
	.word	735
	.space	16
	.type	__compound_literal.8, %object
	.size	__compound_literal.8, 32
__compound_literal.8:
	.word	-84
	.word	40
	.word	40
	.word	727
	.space	16
	.type	__compound_literal.7, %object
	.size	__compound_literal.7, 32
__compound_literal.7:
	.word	-84
	.word	40
	.word	40
	.word	719
	.space	16
	.type	__compound_literal.6, %object
	.size	__compound_literal.6, 32
__compound_literal.6:
	.word	-84
	.word	40
	.word	40
	.word	711
	.space	16
	.type	__compound_literal.5, %object
	.size	__compound_literal.5, 32
__compound_literal.5:
	.word	-84
	.word	40
	.word	40
	.word	703
	.space	16
	.type	__compound_literal.4, %object
	.size	__compound_literal.4, 32
__compound_literal.4:
	.word	-84
	.word	40
	.word	40
	.word	695
	.space	16
	.type	clip_reg_cfg, %object
	.size	clip_reg_cfg, 180
clip_reg_cfg:
	.word	1
	.word	2917
	.word	44
	.word	3
	.short	8
	.short	0
	.word	1
	.word	2672
	.word	45
	.word	255
	.short	8
	.short	0
	.word	1
	.word	2673
	.word	46
	.word	255
	.short	8
	.short	0
	.word	1
	.word	2674
	.word	47
	.word	255
	.short	8
	.short	0
	.word	1
	.word	2675
	.word	48
	.word	255
	.short	8
	.short	0
	.word	1
	.word	2676
	.word	49
	.word	255
	.short	8
	.short	0
	.word	1
	.word	2677
	.word	50
	.word	255
	.short	8
	.short	0
	.word	1
	.word	2678
	.word	51
	.word	255
	.short	8
	.short	0
	.word	1
	.word	2679
	.word	52
	.word	255
	.short	8
	.short	0
	.type	spkr_drv_wrnd_param_ops, %object
	.size	spkr_drv_wrnd_param_ops, 12
spkr_drv_wrnd_param_ops:
	.word	spkr_drv_wrnd_param_set
	.word	param_get_int
	.space	4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	kp_taiko_priv, %object
	.size	kp_taiko_priv, 4
kp_taiko_priv:
	.space	4
	.type	tx_hpf_work, %object
	.size	tx_hpf_work, 640
tx_hpf_work:
	.space	640
	.type	__key.33319, %object
	.size	__key.33319, 0
__key.33319:
	.section	.data.unlikely,"aw",%progbits
	.set	.LANCHOR3,. + 0
	.type	__warned.32337, %object
	.size	__warned.32337, 1
__warned.32337:
	.space	1
	.section	.exitcall.exit,"aw",%progbits
	.align	2
	.type	__exitcall_taiko_codec_exit, %object
	.size	__exitcall_taiko_codec_exit, 4
__exitcall_taiko_codec_exit:
	.word	taiko_codec_exit
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_taiko_codec_init6, %object
	.size	__initcall_taiko_codec_init6, 4
__initcall_taiko_codec_init6:
	.word	taiko_codec_init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"<6>%s(): dai_name = %s DAI-ID %d tx_ch %d rx_ch %d\012"
	.ascii	"\000"
.LC2:
	.ascii	"<3>%s: Invalid rx_slot %d or rx_num %d\012\000"
.LC3:
	.ascii	"<3>%s: Invalid tx_slot %d or tx_num %d\012\000"
.LC4:
	.ascii	"<3>%s: Invalid DAI ID %x\012\000"
	.space	2
.LC5:
	.ascii	"%s(): found no audio playback paths\012\000"
	.space	3
.LC6:
	.ascii	"HPHL\000"
	.space	3
.LC7:
	.ascii	"HPHR\000"
	.space	3
.LC8:
	.ascii	"123456\000"
	.space	1
.LC9:
	.ascii	"<3>%s: Invalid DMIC line on the codec\012\000"
	.space	1
.LC10:
	.ascii	"<3>%s: Invalid DMIC Selection\012\000"
	.space	1
.LC11:
	.ascii	"%s: invalid AIF for I2C mode\012\000"
	.space	2
.LC12:
	.ascii	"<3>Unknown AIF %d\012\000"
	.space	1
.LC13:
	.ascii	"%s: invalid cal data\012\000"
	.space	2
.LC14:
	.ascii	"wcd9320/wcd9320_mad_audio.bin\000"
	.space	2
.LC15:
	.ascii	"<3>Failed to acquire MAD firwmare data %s: %d\012\000"
	.space	1
.LC16:
	.ascii	"failed to get mad fw\000"
	.space	3
.LC17:
	.ascii	"<3>%s: Failed to config MAD\012\000"
	.space	3
.LC18:
	.ascii	"<3>%s: incorrect hwdep cal size %zu\012\000"
	.space	3
.LC19:
	.ascii	"%s: Invalid calibration data\012\000"
	.space	2
.LC20:
	.ascii	"<3>%s: Invalid params\012\000"
	.space	1
.LC21:
	.ascii	" \000"
	.space	2
.LC22:
	.ascii	"<3>%s: Invalid decimator = %s\012\000"
	.space	1
.LC23:
	.ascii	"123456789\000"
	.space	2
.LC24:
	.ascii	"<3>%s: Invalid Decimator = %u\012\000"
	.space	1
.LC25:
	.ascii	"<3>%s: Error, incorrect dec\012\000"
	.space	3
.LC26:
	.ascii	"Unexpected ldo_h users %d\012\000"
	.space	1
.LC27:
	.ascii	"/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/w"
	.ascii	"cd9320.c\000"
.LC28:
	.ascii	"MIC BIAS1\000"
	.space	2
.LC29:
	.ascii	"MIC BIAS2\000"
	.space	2
.LC30:
	.ascii	"MIC BIAS3\000"
	.space	2
.LC31:
	.ascii	"MIC BIAS4\000"
	.space	2
.LC32:
	.ascii	"<3>%s: Error, invalid micbias %s\012\000"
	.space	2
.LC33:
	.ascii	"Internal1\000"
	.space	2
.LC34:
	.ascii	"Internal2\000"
	.space	2
.LC35:
	.ascii	"Internal3\000"
	.space	2
.LC36:
	.ascii	"Unexpected micbias users %d\012\000"
	.space	3
.LC37:
	.ascii	"cdc-vdd-spkdrv\000"
	.space	1
.LC38:
	.ascii	"SPKDRV supply %s isn't defined\012\000"
.LC39:
	.ascii	"<3>%s: Failed to enable spkdrv_reg %s\012\000"
	.space	1
.LC40:
	.ascii	"<3>%s: Failed to disable spkdrv_reg %s\012\000"
.LC41:
	.ascii	"<3>%s: Error, incorrect lineout register value\012\000"
.LC42:
	.ascii	"<3>%s: Invalid w->shift %d\012\000"
.LC43:
	.ascii	"%s: taiko_mad_input = %d out of bounds\012\000"
.LC44:
	.ascii	"NOTUSED1\000"
	.space	3
.LC45:
	.ascii	"NOTUSED2\000"
	.space	3
.LC46:
	.ascii	"NOTUSED3\000"
	.space	3
.LC47:
	.ascii	"ADC_MB\000"
	.space	1
.LC48:
	.ascii	"<6>%s: taiko mad input is set to unsupported input "
	.ascii	"= %s\012\000"
	.space	3
.LC49:
	.ascii	"ADC\000"
.LC50:
	.ascii	"<3>%s: Invalid ADC = %s\012\000"
	.space	3
.LC51:
	.ascii	"AMIC\000"
	.space	3
.LC52:
	.ascii	"%s%u\000"
	.space	3
.LC53:
	.ascii	"<3>%s: mic bias source not found for input = %s\012"
	.ascii	"\000"
	.space	3
.LC54:
	.ascii	"ANC HPHR\000"
	.space	3
.LC55:
	.ascii	"ANC HPHL\000"
	.space	3
.LC56:
	.ascii	"ANC HEADPHONE\000"
	.space	2
.LC57:
	.ascii	"ANC EAR PA\000"
	.space	1
.LC58:
	.ascii	"ANC EAR\000"
.LC59:
	.ascii	"HEADPHONE\000"
	.space	2
.LC60:
	.ascii	"EAR PA\000"
	.space	1
.LC61:
	.ascii	"EAR\000"
.LC62:
	.ascii	"MIC BIAS3 External Standalone\000"
	.space	2
.LC63:
	.ascii	"MIC BIAS2 External Standalone\000"
	.space	2
.LC64:
	.ascii	"<3>%s: NULL pdata\012\000"
	.space	1
.LC65:
	.ascii	"CDC_VDDA_RX\000"
.LC66:
	.ascii	"<3>%s: unsupported CDC_VDDA_RX voltage\012min %d, m"
	.ascii	"ax %d\012\000"
	.space	1
.LC67:
	.ascii	"<3>%s Invalid sample rate %d for mclk %d\012\000"
	.space	2
.LC68:
	.ascii	"<3>%s MCLK is not set!\012\000"
.LC69:
	.ascii	"TX\000"
	.space	1
.LC70:
	.ascii	"RX\000"
	.space	1
.LC71:
	.ascii	"<3>%s: overflow error on %s port %d, value %x\012\000"
	.space	1
.LC72:
	.ascii	"<3>%s: underflow error on %s port %d, value %x\012\000"
.LC73:
	.ascii	"Couldn't find slimbus %s port %d for closing\012\000"
	.space	2
.LC74:
	.ascii	"%s: taiko private data is NULL\012\000"
.LC75:
	.ascii	"<3>%s: NULL codec pointer\012\000"
	.space	1
.LC76:
	.ascii	"%s: cal not sent by %d\012\000"
.LC77:
	.ascii	"%s()\012\000"
	.space	2
.LC78:
	.ascii	"Failed to allocate private data\012\000"
	.space	3
.LC79:
	.ascii	"<3>%s: wcd9xxx init failed %d\012\000"
	.space	1
.LC80:
	.ascii	"cdc-vdd-buck\000"
	.space	3
.LC81:
	.ascii	"Failed to allocate fw_data\012\000"
.LC82:
	.ascii	"%s hwdep failed %d\012\000"
.LC83:
	.ascii	"<3>%s: bad pdata\012\000"
	.space	2
.LC84:
	.ascii	"<3>%s: no mem for slim chan ctl data\012\000"
	.space	2
.LC85:
	.ascii	"&taiko->dai[i].dai_wait\000"
.LC86:
	.ascii	"SLIMBUS Slave\000"
	.space	2
.LC87:
	.ascii	"<3>%s: Failed to request irq %d\012\000"
	.space	3
.LC88:
	.ascii	"<3>%s: taiko irq setup failed %d\012\000"
	.space	2
.LC89:
	.ascii	"<3>%s: Invalid slave port ID: %d\012\000"
	.space	2
.LC90:
	.ascii	"<3>%s: Slim close tx/rx wait timeout\012\000"
	.space	2
.LC91:
	.ascii	"<6>%s: dai_name = %s DAI-ID %x rate %d num_ch %d\012"
	.ascii	"\000"
	.space	2
.LC92:
	.ascii	"<3>%s: Invalid sampling rate %d\012\000"
	.space	3
.LC93:
	.ascii	"<3>%s: Invalid SLIM TX%u port. DAI ID is %d\012\000"
	.space	3
.LC94:
	.ascii	"<3>%s: ERROR: Should not be here\012\000"
	.space	2
.LC95:
	.ascii	"<3>%s: ERROR: DEC connected to SLIM TX%u\012\000"
	.space	2
.LC96:
	.ascii	"<3>%s: ERROR: wrong signal to SLIM TX%u\012\000"
	.space	3
.LC97:
	.ascii	"<3>%s: ERROR: wrong signal = %u\012\000"
	.space	3
.LC98:
	.ascii	"<3>%s: set decimator rate failed %d\012\000"
	.space	3
.LC99:
	.ascii	"<3>invalid format\012\000"
	.space	1
.LC100:
	.ascii	"<3>%s: Invalid TAIKO_RX%u port. Dai ID is %d\012\000"
	.space	2
.LC101:
	.ascii	"Invalid format\012\000"
.LC102:
	.ascii	"%s: invalid port ID %d returned for RX DAI\012\000"
.LC103:
	.ascii	"<3>%s: Invalid stream type %d\012\000"
	.space	1
.LC104:
	.ascii	"wcd9320/wcd9320_anc.bin\000"
.LC105:
	.ascii	"Failed to acquire ANC data: %d\012\000"
.LC106:
	.ascii	"failed to get anc fw\000"
	.space	3
.LC107:
	.ascii	"Not enough data\012\000"
	.space	3
.LC108:
	.ascii	"Invalid ANC slot selected\012\000"
	.space	1
.LC109:
	.ascii	"Invalid register format\012\000"
	.space	3
.LC110:
	.ascii	"Selected ANC slot not present\012\000"
	.space	1
.LC111:
	.ascii	"<3>%s: Error, invalid adc register\012\000"
.LC112:
	.ascii	"<3>%s: Error, invalid init bit postion adc register"
	.ascii	"\012\000"
	.space	3
.LC113:
	.ascii	"<3>%s: Cache update failed!\012\000"
	.space	3
.LC114:
	.ascii	"<3>%s: mbhc init failed %d\012\000"
.LC115:
	.ascii	"<3>%s: Failed to setup irq: %d\012\000"
.LC116:
	.ascii	"<6>%s(): dai_name = %s DAI-ID %x tx_ch %d rx_ch %d\012"
	.ascii	"\000"
.LC117:
	.ascii	"<3>%s: Invalid\012\000"
.LC118:
	.ascii	"Cache write to %x failed: %d\012\000"
	.space	2
.LC119:
	.ascii	"<3>%s invalid params\012\000"
	.space	2
.LC120:
	.ascii	"<3>%s Interface is not correct\000"
	.space	1
.LC121:
	.ascii	"<3>%s Error in enabling the tx path\012\000"
	.space	3
.LC122:
	.ascii	"<3>%s error in close_slim_sch_tx %d\012\000"
	.space	3
.LC123:
	.ascii	"Cache read from %x failed: %d\012\000"
	.space	1
.LC124:
	.ascii	"<3>%s: Unknown config_type 0x%x\012\000"
	.space	3
.LC125:
	.ascii	"taiko_codec\000"
.LC126:
	.ascii	"ADC1\000"
	.space	3
.LC127:
	.ascii	"ADC2\000"
	.space	3
.LC128:
	.ascii	"ADC3\000"
	.space	3
.LC129:
	.ascii	"ADC4\000"
	.space	3
.LC130:
	.ascii	"ADC5\000"
	.space	3
.LC131:
	.ascii	"ADC6\000"
	.space	3
.LC132:
	.ascii	"DAC1\000"
	.space	3
.LC133:
	.ascii	"AIF1 PB\000"
.LC134:
	.ascii	"AIF1 Playback\000"
	.space	2
.LC135:
	.ascii	"AIF2 PB\000"
.LC136:
	.ascii	"AIF2 Playback\000"
	.space	2
.LC137:
	.ascii	"AIF3 PB\000"
.LC138:
	.ascii	"AIF3 Playback\000"
	.space	2
.LC139:
	.ascii	"SLIM RX1 MUX\000"
	.space	3
.LC140:
	.ascii	"SLIM RX2 MUX\000"
	.space	3
.LC141:
	.ascii	"SLIM RX3 MUX\000"
	.space	3
.LC142:
	.ascii	"SLIM RX4 MUX\000"
	.space	3
.LC143:
	.ascii	"SLIM RX5 MUX\000"
	.space	3
.LC144:
	.ascii	"SLIM RX6 MUX\000"
	.space	3
.LC145:
	.ascii	"SLIM RX7 MUX\000"
	.space	3
.LC146:
	.ascii	"SLIM RX1\000"
	.space	3
.LC147:
	.ascii	"SLIM RX2\000"
	.space	3
.LC148:
	.ascii	"SLIM RX3\000"
	.space	3
.LC149:
	.ascii	"SLIM RX4\000"
	.space	3
.LC150:
	.ascii	"SLIM RX5\000"
	.space	3
.LC151:
	.ascii	"SLIM RX6\000"
	.space	3
.LC152:
	.ascii	"SLIM RX7\000"
	.space	3
.LC153:
	.ascii	"HPHL DAC\000"
	.space	3
.LC154:
	.ascii	"HPHR DAC\000"
	.space	3
.LC155:
	.ascii	"LINEOUT1\000"
	.space	3
.LC156:
	.ascii	"LINEOUT2\000"
	.space	3
.LC157:
	.ascii	"LINEOUT3\000"
	.space	3
.LC158:
	.ascii	"LINEOUT4\000"
	.space	3
.LC159:
	.ascii	"SPK_OUT\000"
.LC160:
	.ascii	"LINEOUT1 PA\000"
.LC161:
	.ascii	"LINEOUT2 PA\000"
.LC162:
	.ascii	"LINEOUT3 PA\000"
.LC163:
	.ascii	"LINEOUT4 PA\000"
.LC164:
	.ascii	"SPK PA\000"
	.space	1
.LC165:
	.ascii	"LINEOUT1 DAC\000"
	.space	3
.LC166:
	.ascii	"LINEOUT2 DAC\000"
	.space	3
.LC167:
	.ascii	"LINEOUT3 DAC\000"
	.space	3
.LC168:
	.ascii	"LINEOUT3 DAC GROUND\000"
.LC169:
	.ascii	"LINEOUT4 DAC\000"
	.space	3
.LC170:
	.ascii	"LINEOUT4 DAC GROUND\000"
.LC171:
	.ascii	"SPK DAC\000"
.LC172:
	.ascii	"VDD_SPKDRV\000"
	.space	1
.LC173:
	.ascii	"RX1 MIX1\000"
	.space	3
.LC174:
	.ascii	"RX2 MIX1\000"
	.space	3
.LC175:
	.ascii	"RX7 MIX1\000"
	.space	3
.LC176:
	.ascii	"RX1 MIX2\000"
	.space	3
.LC177:
	.ascii	"RX2 MIX2\000"
	.space	3
.LC178:
	.ascii	"RX3 MIX1\000"
	.space	3
.LC179:
	.ascii	"RX4 MIX1\000"
	.space	3
.LC180:
	.ascii	"RX5 MIX1\000"
	.space	3
.LC181:
	.ascii	"RX6 MIX1\000"
	.space	3
.LC182:
	.ascii	"RX7 MIX2\000"
	.space	3
.LC183:
	.ascii	"RX1 CHAIN\000"
	.space	2
.LC184:
	.ascii	"RX2 CHAIN\000"
	.space	2
.LC185:
	.ascii	"RX1 MIX1 INP1\000"
	.space	2
.LC186:
	.ascii	"RX1 MIX1 INP2\000"
	.space	2
.LC187:
	.ascii	"RX1 MIX1 INP3\000"
	.space	2
.LC188:
	.ascii	"RX2 MIX1 INP1\000"
	.space	2
.LC189:
	.ascii	"RX2 MIX1 INP2\000"
	.space	2
.LC190:
	.ascii	"RX3 MIX1 INP1\000"
	.space	2
.LC191:
	.ascii	"RX3 MIX1 INP2\000"
	.space	2
.LC192:
	.ascii	"RX4 MIX1 INP1\000"
	.space	2
.LC193:
	.ascii	"RX4 MIX1 INP2\000"
	.space	2
.LC194:
	.ascii	"RX5 MIX1 INP1\000"
	.space	2
.LC195:
	.ascii	"RX5 MIX1 INP2\000"
	.space	2
.LC196:
	.ascii	"RX6 MIX1 INP1\000"
	.space	2
.LC197:
	.ascii	"RX6 MIX1 INP2\000"
	.space	2
.LC198:
	.ascii	"RX7 MIX1 INP1\000"
	.space	2
.LC199:
	.ascii	"RX7 MIX1 INP2\000"
	.space	2
.LC200:
	.ascii	"RX1 MIX2 INP1\000"
	.space	2
.LC201:
	.ascii	"RX1 MIX2 INP2\000"
	.space	2
.LC202:
	.ascii	"RX2 MIX2 INP1\000"
	.space	2
.LC203:
	.ascii	"RX2 MIX2 INP2\000"
	.space	2
.LC204:
	.ascii	"RX7 MIX2 INP1\000"
	.space	2
.LC205:
	.ascii	"RX7 MIX2 INP2\000"
	.space	2
.LC206:
	.ascii	"RDAC5 MUX\000"
	.space	2
.LC207:
	.ascii	"RDAC7 MUX\000"
	.space	2
.LC208:
	.ascii	"CLASS_H_DSM MUX\000"
.LC209:
	.ascii	"RX_BIAS\000"
.LC210:
	.ascii	"CDC_I2S_RX_CONN\000"
.LC211:
	.ascii	"CDC_CONN\000"
	.space	3
.LC212:
	.ascii	"LDO_H\000"
	.space	2
.LC213:
	.ascii	"LDO_H Standalone\000"
	.space	3
.LC214:
	.ascii	"COMP0_CLK\000"
	.space	2
.LC215:
	.ascii	"COMP1_CLK\000"
	.space	2
.LC216:
	.ascii	"COMP2_CLK\000"
	.space	2
.LC217:
	.ascii	"AMIC1\000"
	.space	2
.LC218:
	.ascii	"MIC BIAS1 External\000"
	.space	1
.LC219:
	.ascii	"MIC BIAS1 Internal1\000"
.LC220:
	.ascii	"MIC BIAS1 Internal2\000"
.LC221:
	.ascii	"Main Mic Bias\000"
	.space	2
.LC222:
	.ascii	"AMIC3\000"
	.space	2
.LC223:
	.ascii	"AMIC4\000"
	.space	2
.LC224:
	.ascii	"AMIC5\000"
	.space	2
.LC225:
	.ascii	"AMIC6\000"
	.space	2
.LC226:
	.ascii	"DEC1 MUX\000"
	.space	3
.LC227:
	.ascii	"DEC2 MUX\000"
	.space	3
.LC228:
	.ascii	"DEC3 MUX\000"
	.space	3
.LC229:
	.ascii	"DEC4 MUX\000"
	.space	3
.LC230:
	.ascii	"DEC5 MUX\000"
	.space	3
.LC231:
	.ascii	"DEC6 MUX\000"
	.space	3
.LC232:
	.ascii	"DEC7 MUX\000"
	.space	3
.LC233:
	.ascii	"DEC8 MUX\000"
	.space	3
.LC234:
	.ascii	"DEC9 MUX\000"
	.space	3
.LC235:
	.ascii	"DEC10 MUX\000"
	.space	2
.LC236:
	.ascii	"ANC1 MUX\000"
	.space	3
.LC237:
	.ascii	"ANC2 MUX\000"
	.space	3
.LC238:
	.ascii	"ANC1 FB MUX\000"
.LC239:
	.ascii	"AMIC2\000"
	.space	2
.LC240:
	.ascii	"MIC BIAS2 External\000"
	.space	1
.LC241:
	.ascii	"MIC BIAS2 Internal1\000"
.LC242:
	.ascii	"MIC BIAS2 Internal2\000"
.LC243:
	.ascii	"MIC BIAS2 Internal3\000"
.LC244:
	.ascii	"MIC BIAS3 External\000"
	.space	1
.LC245:
	.ascii	"MIC BIAS3 Internal1\000"
.LC246:
	.ascii	"MIC BIAS3 Internal2\000"
.LC247:
	.ascii	"MIC BIAS4 External\000"
	.space	1
.LC248:
	.ascii	"Ear Mic Bias\000"
	.space	3
.LC249:
	.ascii	"AIF1 CAP\000"
	.space	3
.LC250:
	.ascii	"AIF1 Capture\000"
	.space	3
.LC251:
	.ascii	"AIF2 CAP\000"
	.space	3
.LC252:
	.ascii	"AIF2 Capture\000"
	.space	3
.LC253:
	.ascii	"AIF3 CAP\000"
	.space	3
.LC254:
	.ascii	"AIF3 Capture\000"
	.space	3
.LC255:
	.ascii	"AIF4 VI\000"
.LC256:
	.ascii	"VIfeed\000"
	.space	1
.LC257:
	.ascii	"AIF4 MAD\000"
	.space	3
.LC258:
	.ascii	"AIF4 MAD TX\000"
.LC259:
	.ascii	"MADONOFF\000"
	.space	3
.LC260:
	.ascii	"MADINPUT\000"
	.space	3
.LC261:
	.ascii	"AIF1_CAP Mixer\000"
	.space	1
.LC262:
	.ascii	"AIF2_CAP Mixer\000"
	.space	1
.LC263:
	.ascii	"AIF3_CAP Mixer\000"
	.space	1
.LC264:
	.ascii	"SLIM TX1 MUX\000"
	.space	3
.LC265:
	.ascii	"SLIM TX2 MUX\000"
	.space	3
.LC266:
	.ascii	"SLIM TX3 MUX\000"
	.space	3
.LC267:
	.ascii	"SLIM TX4 MUX\000"
	.space	3
.LC268:
	.ascii	"SLIM TX5 MUX\000"
	.space	3
.LC269:
	.ascii	"SLIM TX6 MUX\000"
	.space	3
.LC270:
	.ascii	"SLIM TX7 MUX\000"
	.space	3
.LC271:
	.ascii	"SLIM TX8 MUX\000"
	.space	3
.LC272:
	.ascii	"SLIM TX9 MUX\000"
	.space	3
.LC273:
	.ascii	"SLIM TX10 MUX\000"
	.space	2
.LC274:
	.ascii	"DMIC1\000"
	.space	2
.LC275:
	.ascii	"DMIC2\000"
	.space	2
.LC276:
	.ascii	"DMIC3\000"
	.space	2
.LC277:
	.ascii	"DMIC4\000"
	.space	2
.LC278:
	.ascii	"DMIC5\000"
	.space	2
.LC279:
	.ascii	"DMIC6\000"
	.space	2
.LC280:
	.ascii	"IIR1 INP1 MUX\000"
	.space	2
.LC281:
	.ascii	"IIR1\000"
	.space	3
.LC282:
	.ascii	"IIR2 INP1 MUX\000"
	.space	2
.LC283:
	.ascii	"IIR2\000"
	.space	3
.LC284:
	.ascii	"AUX_PGA_Left\000"
	.space	3
.LC285:
	.ascii	"AUX_PGA_Right\000"
	.space	2
.LC286:
	.ascii	"EAR_PA_MIXER\000"
	.space	3
.LC287:
	.ascii	"HPHL_PA_MIXER\000"
	.space	2
.LC288:
	.ascii	"HPHR_PA_MIXER\000"
	.space	2
.LC289:
	.ascii	"LINEOUT1_PA_MIXER\000"
	.space	2
.LC290:
	.ascii	"LINEOUT2_PA_MIXER\000"
	.space	2
.LC291:
	.ascii	"LINEOUT3_PA_MIXER\000"
	.space	2
.LC292:
	.ascii	"LINEOUT4_PA_MIXER\000"
	.space	2
.LC293:
	.ascii	"VIONOFF\000"
.LC294:
	.ascii	"VIINPUT\000"
.LC295:
	.ascii	"taiko_i2s_rx1\000"
	.space	2
.LC296:
	.ascii	"taiko_i2s_tx1\000"
	.space	2
.LC297:
	.ascii	"taiko_i2s_rx2\000"
	.space	2
.LC298:
	.ascii	"taiko_i2s_tx2\000"
	.space	2
.LC299:
	.ascii	"taiko_rx1\000"
	.space	2
.LC300:
	.ascii	"taiko_tx1\000"
	.space	2
.LC301:
	.ascii	"taiko_rx2\000"
	.space	2
.LC302:
	.ascii	"taiko_tx2\000"
	.space	2
.LC303:
	.ascii	"taiko_tx3\000"
	.space	2
.LC304:
	.ascii	"taiko_rx3\000"
	.space	2
.LC305:
	.ascii	"taiko_vifeedback\000"
	.space	3
.LC306:
	.ascii	"taiko_mad1\000"
	.space	1
.LC307:
	.ascii	"Switch\000"
	.space	1
.LC308:
	.ascii	"SLIM TX1\000"
	.space	3
.LC309:
	.ascii	"SLIM TX2\000"
	.space	3
.LC310:
	.ascii	"SLIM TX3\000"
	.space	3
.LC311:
	.ascii	"SLIM TX4\000"
	.space	3
.LC312:
	.ascii	"SLIM TX5\000"
	.space	3
.LC313:
	.ascii	"SLIM TX6\000"
	.space	3
.LC314:
	.ascii	"SLIM TX7\000"
	.space	3
.LC315:
	.ascii	"SLIM TX8\000"
	.space	3
.LC316:
	.ascii	"SLIM TX9\000"
	.space	3
.LC317:
	.ascii	"SLIM TX10\000"
	.space	2
.LC318:
	.ascii	"DEC1\000"
	.space	3
.LC319:
	.ascii	"DEC2\000"
	.space	3
.LC320:
	.ascii	"DEC3\000"
	.space	3
.LC321:
	.ascii	"RMIX1\000"
	.space	2
.LC322:
	.ascii	"RMIX2\000"
	.space	2
.LC323:
	.ascii	"RMIX3\000"
	.space	2
.LC324:
	.ascii	"RMIX4\000"
	.space	2
.LC325:
	.ascii	"RMIX5\000"
	.space	2
.LC326:
	.ascii	"RMIX6\000"
	.space	2
.LC327:
	.ascii	"RMIX7\000"
	.space	2
.LC328:
	.ascii	"DEC4\000"
	.space	3
.LC329:
	.ascii	"DEC5\000"
	.space	3
.LC330:
	.ascii	"DEC6\000"
	.space	3
.LC331:
	.ascii	"DEC7\000"
	.space	3
.LC332:
	.ascii	"DEC8\000"
	.space	3
.LC333:
	.ascii	"DEC9\000"
	.space	3
.LC334:
	.ascii	"DEC10\000"
	.space	2
.LC335:
	.ascii	"EAR_HPH_L\000"
	.space	2
.LC336:
	.ascii	"EAR_LINE_1\000"
	.space	1
.LC337:
	.ascii	"DEM3_INV\000"
	.space	3
.LC338:
	.ascii	"DEM4\000"
	.space	3
.LC339:
	.ascii	"DEM5_INV\000"
	.space	3
.LC340:
	.ascii	"DEM6\000"
	.space	3
.LC341:
	.ascii	"DSM_HPHL_RX1\000"
	.space	3
.LC342:
	.ascii	"AIF1_PB\000"
.LC343:
	.ascii	"AIF2_PB\000"
.LC344:
	.ascii	"AIF3_PB\000"
.LC345:
	.ascii	"RX1\000"
.LC346:
	.ascii	"RX2\000"
.LC347:
	.ascii	"RX3\000"
.LC348:
	.ascii	"RX4\000"
.LC349:
	.ascii	"RX5\000"
.LC350:
	.ascii	"RX6\000"
.LC351:
	.ascii	"RX7\000"
.LC352:
	.ascii	"AUX_PGA_L Switch\000"
	.space	3
.LC353:
	.ascii	"AUX_PGA_R Switch\000"
	.space	3
.LC354:
	.ascii	"RX_I2S_CLK\000"
	.space	1
.LC355:
	.ascii	"TX_I2S_CLK\000"
	.space	1
.LC356:
	.ascii	"SLIM RX1 Mux\000"
	.space	3
.LC357:
	.ascii	"SLIM RX2 Mux\000"
	.space	3
.LC358:
	.ascii	"SLIM RX3 Mux\000"
	.space	3
.LC359:
	.ascii	"SLIM RX4 Mux\000"
	.space	3
.LC360:
	.ascii	"SLIM RX5 Mux\000"
	.space	3
.LC361:
	.ascii	"SLIM RX6 Mux\000"
	.space	3
.LC362:
	.ascii	"SLIM RX7 Mux\000"
	.space	3
.LC363:
	.ascii	"ZERO\000"
	.space	3
.LC364:
	.ascii	"ANC1 FB MUX Mux\000"
.LC365:
	.ascii	"ANC2 MUX Mux\000"
	.space	3
.LC366:
	.ascii	"ANC1 MUX Mux\000"
	.space	3
.LC367:
	.ascii	"IIR2 INP1 Mux\000"
	.space	2
.LC368:
	.ascii	"IIR1 INP1 Mux\000"
	.space	2
.LC369:
	.ascii	"DEC10 MUX Mux\000"
	.space	2
.LC370:
	.ascii	"DEC9 MUX Mux\000"
	.space	3
.LC371:
	.ascii	"DEC8 MUX Mux\000"
	.space	3
.LC372:
	.ascii	"DEC7 MUX Mux\000"
	.space	3
.LC373:
	.ascii	"DEC6 MUX Mux\000"
	.space	3
.LC374:
	.ascii	"DEC5 MUX Mux\000"
	.space	3
.LC375:
	.ascii	"DEC4 MUX Mux\000"
	.space	3
.LC376:
	.ascii	"DEC3 MUX Mux\000"
	.space	3
.LC377:
	.ascii	"DEC2 MUX Mux\000"
	.space	3
.LC378:
	.ascii	"DEC1 MUX Mux\000"
	.space	3
.LC379:
	.ascii	"SLIM TX10 MUX Mux\000"
	.space	2
.LC380:
	.ascii	"SLIM TX9 MUX Mux\000"
	.space	3
.LC381:
	.ascii	"SLIM TX8 MUX Mux\000"
	.space	3
.LC382:
	.ascii	"SLIM TX7 MUX Mux\000"
	.space	3
.LC383:
	.ascii	"SLIM TX6 MUX Mux\000"
	.space	3
.LC384:
	.ascii	"SLIM TX5 MUX Mux\000"
	.space	3
.LC385:
	.ascii	"SLIM TX4 MUX Mux\000"
	.space	3
.LC386:
	.ascii	"SLIM TX3 MUX Mux\000"
	.space	3
.LC387:
	.ascii	"SLIM TX2 MUX Mux\000"
	.space	3
.LC388:
	.ascii	"SLIM TX1 MUX Mux\000"
	.space	3
.LC389:
	.ascii	"RDAC7 MUX Mux\000"
	.space	2
.LC390:
	.ascii	"RDAC5 MUX Mux\000"
	.space	2
.LC391:
	.ascii	"RX7 MIX2 INP2 Mux\000"
	.space	2
.LC392:
	.ascii	"RX7 MIX2 INP1 Mux\000"
	.space	2
.LC393:
	.ascii	"RX2 MIX2 INP2 Mux\000"
	.space	2
.LC394:
	.ascii	"RX2 MIX2 INP1 Mux\000"
	.space	2
.LC395:
	.ascii	"RX1 MIX2 INP2 Mux\000"
	.space	2
.LC396:
	.ascii	"RX1 MIX2 INP1 Mux\000"
	.space	2
.LC397:
	.ascii	"RX7 MIX1 INP2 Mux\000"
	.space	2
.LC398:
	.ascii	"RX7 MIX1 INP1 Mux\000"
	.space	2
.LC399:
	.ascii	"RX6 MIX1 INP2 Mux\000"
	.space	2
.LC400:
	.ascii	"RX6 MIX1 INP1 Mux\000"
	.space	2
.LC401:
	.ascii	"RX5 MIX1 INP2 Mux\000"
	.space	2
.LC402:
	.ascii	"RX5 MIX1 INP1 Mux\000"
	.space	2
.LC403:
	.ascii	"RX4 MIX1 INP2 Mux\000"
	.space	2
.LC404:
	.ascii	"RX4 MIX1 INP1 Mux\000"
	.space	2
.LC405:
	.ascii	"RX3 MIX1 INP2 Mux\000"
	.space	2
.LC406:
	.ascii	"RX3 MIX1 INP1 Mux\000"
	.space	2
.LC407:
	.ascii	"RX2 MIX1 INP2 Mux\000"
	.space	2
.LC408:
	.ascii	"RX2 MIX1 INP1 Mux\000"
	.space	2
.LC409:
	.ascii	"RX1 MIX1 INP3 Mux\000"
	.space	2
.LC410:
	.ascii	"RX1 MIX1 INP2 Mux\000"
	.space	2
.LC411:
	.ascii	"RX1 MIX1 INP1 Mux\000"
	.space	2
.LC412:
	.ascii	"RSVD_1\000"
	.space	1
.LC413:
	.ascii	"ADCMB\000"
	.space	2
.LC414:
	.ascii	"ANC1_FB\000"
.LC415:
	.ascii	"ANC2_FB\000"
.LC416:
	.ascii	"SRC1\000"
	.space	3
.LC417:
	.ascii	"SRC2\000"
	.space	3
.LC418:
	.ascii	"HPHL Impedance\000"
	.space	1
.LC419:
	.ascii	"HPHR Impedance\000"
	.space	1
.LC420:
	.ascii	"EAR PA Gain\000"
.LC421:
	.ascii	"HPHL Volume\000"
.LC422:
	.ascii	"HPHR Volume\000"
.LC423:
	.ascii	"LINEOUT1 Volume\000"
.LC424:
	.ascii	"LINEOUT2 Volume\000"
.LC425:
	.ascii	"LINEOUT3 Volume\000"
.LC426:
	.ascii	"LINEOUT4 Volume\000"
.LC427:
	.ascii	"SPK DRV Volume\000"
	.space	1
.LC428:
	.ascii	"ADC1 Volume\000"
.LC429:
	.ascii	"ADC2 Volume\000"
.LC430:
	.ascii	"ADC3 Volume\000"
.LC431:
	.ascii	"ADC4 Volume\000"
.LC432:
	.ascii	"ADC5 Volume\000"
.LC433:
	.ascii	"ADC6 Volume\000"
.LC434:
	.ascii	"POS_6_DB\000"
	.space	3
.LC435:
	.ascii	"POS_4P5_DB\000"
	.space	1
.LC436:
	.ascii	"POS_3_DB\000"
	.space	3
.LC437:
	.ascii	"POS_1P5_DB\000"
	.space	1
.LC438:
	.ascii	"POS_0_DB\000"
	.space	3
.LC439:
	.ascii	"NEG_2P5_DB\000"
	.space	1
.LC440:
	.ascii	"UNDEFINED\000"
	.space	2
.LC441:
	.ascii	"NEG_12_DB\000"
	.space	2
.LC442:
	.ascii	"UNDEFINED_1\000"
.LC443:
	.ascii	"UNDEFINED_2\000"
.LC444:
	.ascii	"UNDEFINED_3\000"
.LC445:
	.ascii	"POS_2_DB\000"
	.space	3
.LC446:
	.ascii	"UNDEFINED_4\000"
.LC447:
	.ascii	"RX1 Digital Volume\000"
	.space	1
.LC448:
	.ascii	"RX2 Digital Volume\000"
	.space	1
.LC449:
	.ascii	"RX3 Digital Volume\000"
	.space	1
.LC450:
	.ascii	"RX4 Digital Volume\000"
	.space	1
.LC451:
	.ascii	"RX5 Digital Volume\000"
	.space	1
.LC452:
	.ascii	"RX6 Digital Volume\000"
	.space	1
.LC453:
	.ascii	"RX7 Digital Volume\000"
	.space	1
.LC454:
	.ascii	"DEC1 Volume\000"
.LC455:
	.ascii	"DEC2 Volume\000"
.LC456:
	.ascii	"DEC3 Volume\000"
.LC457:
	.ascii	"DEC4 Volume\000"
.LC458:
	.ascii	"DEC5 Volume\000"
.LC459:
	.ascii	"DEC6 Volume\000"
.LC460:
	.ascii	"DEC7 Volume\000"
.LC461:
	.ascii	"DEC8 Volume\000"
.LC462:
	.ascii	"DEC9 Volume\000"
.LC463:
	.ascii	"DEC10 Volume\000"
	.space	3
.LC464:
	.ascii	"IIR1 INP1 Volume\000"
	.space	3
.LC465:
	.ascii	"IIR1 INP2 Volume\000"
	.space	3
.LC466:
	.ascii	"IIR1 INP3 Volume\000"
	.space	3
.LC467:
	.ascii	"IIR1 INP4 Volume\000"
	.space	3
.LC468:
	.ascii	"IIR2 INP1 Volume\000"
	.space	3
.LC469:
	.ascii	"IIR2 INP2 Volume\000"
	.space	3
.LC470:
	.ascii	"IIR2 INP3 Volume\000"
	.space	3
.LC471:
	.ascii	"IIR2 INP4 Volume\000"
	.space	3
.LC472:
	.ascii	"ANC Slot\000"
	.space	3
.LC473:
	.ascii	"ANC Function\000"
	.space	3
.LC474:
	.ascii	"TX1 HPF cut off\000"
.LC475:
	.ascii	"TX2 HPF cut off\000"
.LC476:
	.ascii	"TX3 HPF cut off\000"
.LC477:
	.ascii	"TX4 HPF cut off\000"
.LC478:
	.ascii	"TX5 HPF cut off\000"
.LC479:
	.ascii	"TX6 HPF cut off\000"
.LC480:
	.ascii	"TX7 HPF cut off\000"
.LC481:
	.ascii	"TX8 HPF cut off\000"
.LC482:
	.ascii	"TX9 HPF cut off\000"
.LC483:
	.ascii	"TX10 HPF cut off\000"
	.space	3
.LC484:
	.ascii	"TX1 HPF Switch\000"
	.space	1
.LC485:
	.ascii	"TX2 HPF Switch\000"
	.space	1
.LC486:
	.ascii	"TX3 HPF Switch\000"
	.space	1
.LC487:
	.ascii	"TX4 HPF Switch\000"
	.space	1
.LC488:
	.ascii	"TX5 HPF Switch\000"
	.space	1
.LC489:
	.ascii	"TX6 HPF Switch\000"
	.space	1
.LC490:
	.ascii	"TX7 HPF Switch\000"
	.space	1
.LC491:
	.ascii	"TX8 HPF Switch\000"
	.space	1
.LC492:
	.ascii	"TX9 HPF Switch\000"
	.space	1
.LC493:
	.ascii	"TX10 HPF Switch\000"
.LC494:
	.ascii	"RX1 HPF Switch\000"
	.space	1
.LC495:
	.ascii	"RX2 HPF Switch\000"
	.space	1
.LC496:
	.ascii	"RX3 HPF Switch\000"
	.space	1
.LC497:
	.ascii	"RX4 HPF Switch\000"
	.space	1
.LC498:
	.ascii	"RX5 HPF Switch\000"
	.space	1
.LC499:
	.ascii	"RX6 HPF Switch\000"
	.space	1
.LC500:
	.ascii	"RX7 HPF Switch\000"
	.space	1
.LC501:
	.ascii	"RX1 HPF cut off\000"
.LC502:
	.ascii	"RX2 HPF cut off\000"
.LC503:
	.ascii	"RX3 HPF cut off\000"
.LC504:
	.ascii	"RX4 HPF cut off\000"
.LC505:
	.ascii	"RX5 HPF cut off\000"
.LC506:
	.ascii	"RX6 HPF cut off\000"
.LC507:
	.ascii	"RX7 HPF cut off\000"
.LC508:
	.ascii	"IIR1 Enable Band1\000"
	.space	2
.LC509:
	.ascii	"IIR1 Enable Band2\000"
	.space	2
.LC510:
	.ascii	"IIR1 Enable Band3\000"
	.space	2
.LC511:
	.ascii	"IIR1 Enable Band4\000"
	.space	2
.LC512:
	.ascii	"IIR1 Enable Band5\000"
	.space	2
.LC513:
	.ascii	"IIR2 Enable Band1\000"
	.space	2
.LC514:
	.ascii	"IIR2 Enable Band2\000"
	.space	2
.LC515:
	.ascii	"IIR2 Enable Band3\000"
	.space	2
.LC516:
	.ascii	"IIR2 Enable Band4\000"
	.space	2
.LC517:
	.ascii	"IIR2 Enable Band5\000"
	.space	2
.LC518:
	.ascii	"IIR1 Band1\000"
	.space	1
.LC519:
	.ascii	"IIR1 Band2\000"
	.space	1
.LC520:
	.ascii	"IIR1 Band3\000"
	.space	1
.LC521:
	.ascii	"IIR1 Band4\000"
	.space	1
.LC522:
	.ascii	"IIR1 Band5\000"
	.space	1
.LC523:
	.ascii	"IIR2 Band1\000"
	.space	1
.LC524:
	.ascii	"IIR2 Band2\000"
	.space	1
.LC525:
	.ascii	"IIR2 Band3\000"
	.space	1
.LC526:
	.ascii	"IIR2 Band4\000"
	.space	1
.LC527:
	.ascii	"IIR2 Band5\000"
	.space	1
.LC528:
	.ascii	"COMP0 Switch\000"
	.space	3
.LC529:
	.ascii	"COMP1 Switch\000"
	.space	3
.LC530:
	.ascii	"COMP2 Switch\000"
	.space	3
.LC531:
	.ascii	"MAD Input\000"
	.space	2
.LC532:
	.ascii	"CLASS_H_DSM MUX Mux\000"
.LC533:
	.ascii	"DSM_SPKR_RX7\000"
	.space	3
.LC534:
	.ascii	"MIN_3DB_4Hz\000"
.LC535:
	.ascii	"MIN_3DB_75Hz\000"
	.space	3
.LC536:
	.ascii	"MIN_3DB_150Hz\000"
	.space	2
.LC537:
	.ascii	"OFF\000"
.LC538:
	.ascii	"ON\000"
	.section	__param,"a",%progbits
	.align	2
	.type	__param_spkr_drv_wrnd, %object
	.size	__param_spkr_drv_wrnd, 16
__param_spkr_drv_wrnd:
	.word	__param_str_spkr_drv_wrnd
	.word	spkr_drv_wrnd_param_ops
	.short	420
	.short	-1
	.word	spkr_drv_wrnd
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
