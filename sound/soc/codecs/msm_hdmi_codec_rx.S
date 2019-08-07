msm_hdmi_audio_codec_rx_plat_remove:
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
	.size	msm_hdmi_audio_codec_rx_plat_remove, .-msm_hdmi_audio_codec_rx_plat_remove
	.section	.init.text,"ax",%progbits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	msm_hdmi_audio_codec_rx_init, %function
msm_hdmi_audio_codec_rx_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	b	platform_driver_register
	.fnend
	.size	msm_hdmi_audio_codec_rx_init, .-msm_hdmi_audio_codec_rx_init
	.section	.devinit.text,"ax",%progbits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	msm_hdmi_audio_codec_rx_plat_probe, %function
msm_hdmi_audio_codec_rx_plat_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	add	r4, r0, #8
	ldr	r3, [r0, #300]
	cmp	r3, #0
	beq	.L5
	movw	r2, #:lower16:.LC0
	movw	r1, #:lower16:.LC1
	movt	r2, #:upper16:.LC0
	movt	r1, #:upper16:.LC1
	mov	r0, r4
	bl	dev_set_name
	b	.L6
.L5:
	movw	r2, #:lower16:.LANCHOR1
	movw	r1, #:lower16:.LC2
	movt	r2, #:upper16:.LANCHOR1
	movt	r1, #:upper16:.LC2
	mov	r0, r4
	bl	dev_err
.L6:
	ldr	r2, .L9
	mov	r0, r4
	mov	r3, #1
	pop	{r4, lr}
	add	r1, r2, #136
	b	snd_soc_register_codec
.L10:
	.align	2
.L9:
	.word	.LANCHOR0+80
	.fnend
	.size	msm_hdmi_audio_codec_rx_plat_probe, .-msm_hdmi_audio_codec_rx_plat_probe
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	msm_hdmi_audio_codec_rx_dai_hw_params, %function
msm_hdmi_audio_codec_rx_dai_hw_params:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	strd	r6, [sp, #8]
	mov	r7, r1
	str	r8, [sp, #16]
	mov	r8, r2
	str	lr, [sp, #20]
	ldr	r3, [r2, #64]
	.pad #8
	sub	sp, sp, #8
	ldr	r6, [r1, #284]
	ldr	r0, [r3, #12]
	bl	dev_get_drvdata
	mov	r5, r0
	mov	r1, #1
	ldr	r0, [r0]
	ldr	r3, [r5, #12]
	blx	r3
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L26
	cmp	r0, #0
	beq	.L27
	sub	r3, r6, #2
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L15
.L17:
	.word	.L16
	.word	.L18
	.word	.L24
	.word	.L20
	.word	.L21
	.word	.L22
	.word	.L23
.L24:
	mov	r3, #6
.L19:
	mov	ip, #0
	ldr	r0, [r5]
	mov	r2, r6
	ldr	r1, [r7, #296]
	str	ip, [sp]
	str	ip, [sp, #4]
	ldr	r4, [r5, #4]
	blx	r4
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L28
.L11:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L20:
	mov	r3, #10
	b	.L19
.L22:
	mov	r3, #18
	b	.L19
.L23:
	mov	r3, #19
	b	.L19
.L16:
	mov	r3, #0
	b	.L19
.L18:
	mov	r3, #2
	b	.L19
.L21:
	mov	r3, #11
	b	.L19
.L15:
	movw	r1, #:lower16:.LC5
	mov	r2, r6
	ldr	r0, [r8, #8]
	movt	r1, #:upper16:.LC5
	mvn	r4, #21
	bl	dev_err
	b	.L11
.L26:
	movw	r1, #:lower16:.LC3
	mov	r3, r0
	ldr	r2, .L29
	movt	r1, #:upper16:.LC3
	ldr	r0, [r8, #8]
	bl	dev_err
	b	.L11
.L28:
	movw	r1, #:lower16:.LC6
	ldr	r2, .L29
	movt	r1, #:upper16:.LC6
	ldr	r0, [r8, #8]
	bl	dev_err
	b	.L11
.L27:
	movw	r1, #:lower16:.LC4
	mov	r3, r0
	ldr	r2, .L29
	movt	r1, #:upper16:.LC4
	ldr	r0, [r8, #8]
	mvn	r4, #10
	bl	dev_err
	b	.L11
.L30:
	.align	2
.L29:
	.word	.LANCHOR1+36
	.fnend
	.size	msm_hdmi_audio_codec_rx_dai_hw_params, .-msm_hdmi_audio_codec_rx_dai_hw_params
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	msm_hdmi_edid_ctl_info, %function
msm_hdmi_edid_ctl_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r4, r1
	str	lr, [sp, #4]
	ldr	r3, [r0, #96]
	.pad #16
	sub	sp, sp, #16
	ldr	r0, [r3, #12]
	bl	dev_get_drvdata
	mov	r3, r0
	mov	r1, sp
	ldr	r0, [r0]
	ldr	r3, [r3, #8]
	blx	r3
	cmn	r0, #4096
	mov	r3, #4
	str	r3, [r4, #64]
	bhi	.L32
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #12]
	add	r3, r3, r2
	str	r3, [r4, #72]
.L32:
	mov	r0, #0
	add	sp, sp, #16
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
	.fnend
	.size	msm_hdmi_edid_ctl_info, .-msm_hdmi_edid_ctl_info
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	msm_hdmi_edid_get, %function
msm_hdmi_edid_get:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r1
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r3, [r0, #96]
	.pad #16
	sub	sp, sp, #16
	ldr	r0, [r3, #12]
	bl	dev_get_drvdata
	mov	r3, r0
	mov	r1, sp
	ldr	r0, [r0]
	ldr	r3, [r3, #8]
	blx	r3
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L34
	ldm	sp, {r1, r6}
	add	r4, r4, #72
	mov	r0, r4
	mov	r2, r6
	bl	memcpy
	ldr	r1, [sp, #8]
	add	r0, r4, r6
	ldr	r2, [sp, #12]
	bl	memcpy
.L34:
	mov	r0, r5
	add	sp, sp, #16
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
	.fnend
	.size	msm_hdmi_edid_get, .-msm_hdmi_edid_get
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	msm_hdmi_audio_codec_rx_remove, %function
msm_hdmi_audio_codec_rx_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	str	lr, [sp, #4]
	ldr	r0, [r0, #12]
	bl	dev_get_drvdata
	bl	kfree
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, #0
	ldr	pc, [sp], #4
	.fnend
	.size	msm_hdmi_audio_codec_rx_remove, .-msm_hdmi_audio_codec_rx_remove
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	msm_hdmi_audio_codec_rx_probe, %function
msm_hdmi_audio_codec_rx_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:kmalloc_caches
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r0
	movt	r3, #:upper16:kmalloc_caches
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r0, [r3, #24]
	cmp	r0, #0
	beq	.L45
	mov	r2, #16
	movw	r1, #32976
	bl	kmem_cache_alloc_trace
	subs	r4, r0, #0
	beq	.L47
.L40:
	ldr	r3, [r5, #12]
	ldr	r0, [r3, #292]
	bl	of_get_parent
	cmp	r0, #0
	beq	.L48
	bl	of_find_device_by_node
	cmp	r0, #0
	str	r0, [r4]
	beq	.L49
	add	r1, r4, #4
	bl	msm_hdmi_register_audio_codec
	subs	r6, r0, #0
	bne	.L50
	mov	r1, r4
	ldr	r0, [r5, #12]
	bl	dev_set_drvdata
.L39:
	mov	r0, r6
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L45:
	mov	r4, #16
	b	.L40
.L50:
	movw	r1, #:lower16:.LC10
	ldr	r2, .L51
	mvn	r6, #18
	movt	r1, #:upper16:.LC10
	ldr	r0, [r5, #12]
	bl	dev_err
	mov	r0, r4
	bl	kfree
	b	.L39
.L48:
	movw	r1, #:lower16:.LC8
	ldr	r2, .L51
	mvn	r6, #18
	movt	r1, #:upper16:.LC8
	ldr	r0, [r5, #12]
	bl	dev_err
	mov	r0, r4
	bl	kfree
	b	.L39
.L49:
	movw	r1, #:lower16:.LC9
	ldr	r2, .L51
	mvn	r6, #18
	movt	r1, #:upper16:.LC9
	ldr	r0, [r5, #12]
	bl	dev_err
	mov	r0, r4
	bl	kfree
	b	.L39
.L47:
	movw	r1, #:lower16:.LC7
	ldr	r2, .L51
	mvn	r6, #11
	movt	r1, #:upper16:.LC7
	ldr	r0, [r5, #12]
	bl	dev_err
	b	.L39
.L52:
	.align	2
.L51:
	.word	.LANCHOR1+76
	.fnend
	.size	msm_hdmi_audio_codec_rx_probe, .-msm_hdmi_audio_codec_rx_probe
	.section	.exit.text,"ax",%progbits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	msm_hdmi_audio_codec_rx_exit, %function
msm_hdmi_audio_codec_rx_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	b	platform_driver_unregister
	.fnend
	.size	msm_hdmi_audio_codec_rx_exit, .-msm_hdmi_audio_codec_rx_exit
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	msm_hdmi_audio_codec_rx_dai_shutdown, %function
msm_hdmi_audio_codec_rx_dai_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r4, r1
	str	lr, [sp, #4]
	ldr	r3, [r1, #64]
	ldr	r0, [r3, #12]
	bl	dev_get_drvdata
	mov	r3, r0
	mov	r1, #0
	ldr	r0, [r0]
	ldr	r3, [r3, #12]
	blx	r3
	cmn	r0, #4096
	bhi	.L57
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L57:
	movw	r1, #:lower16:.LC11
	ldr	r0, [r4, #8]
	movt	r1, #:upper16:.LC11
	ldr	r4, [sp]
	ldr	lr, [sp, #4]
	add	sp, sp, #8
	ldr	r2, .L58
	b	dev_err
.L59:
	.align	2
.L58:
	.word	.LANCHOR1+108
	.fnend
	.size	msm_hdmi_audio_codec_rx_dai_shutdown, .-msm_hdmi_audio_codec_rx_dai_shutdown
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	msm_hdmi_audio_codec_rx_dai_startup, %function
msm_hdmi_audio_codec_rx_dai_startup:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r1
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r3, [r1, #64]
	ldr	r0, [r3, #12]
	bl	dev_get_drvdata
	mov	r3, r0
	mov	r1, #1
	ldr	r0, [r0]
	ldr	r3, [r3, #12]
	blx	r3
	cmn	r0, #4096
	mov	r4, r0
	bhi	.L64
	cmp	r0, #0
	beq	.L65
.L60:
	mov	r0, r4
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L64:
	movw	r1, #:lower16:.LC3
	mov	r3, r0
	ldr	r2, .L66
	movt	r1, #:upper16:.LC3
	ldr	r0, [r5, #8]
	bl	dev_err
	b	.L60
.L65:
	movw	r1, #:lower16:.LC12
	mov	r3, r0
	ldr	r2, .L66
	movt	r1, #:upper16:.LC12
	ldr	r0, [r5, #8]
	mvn	r4, #10
	bl	dev_err
	b	.L60
.L67:
	.align	2
.L66:
	.word	.LANCHOR1+148
	.fnend
	.size	msm_hdmi_audio_codec_rx_dai_startup, .-msm_hdmi_audio_codec_rx_dai_startup
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.26682, %object
	.size	__func__.26682, 35
__func__.26682:
	.ascii	"msm_hdmi_audio_codec_rx_plat_probe\000"
	.space	1
	.type	__func__.26644, %object
	.size	__func__.26644, 38
__func__.26644:
	.ascii	"msm_hdmi_audio_codec_rx_dai_hw_params\000"
	.space	2
	.type	__func__.26668, %object
	.size	__func__.26668, 30
__func__.26668:
	.ascii	"msm_hdmi_audio_codec_rx_probe\000"
	.space	2
	.type	__func__.26661, %object
	.size	__func__.26661, 37
__func__.26661:
	.ascii	"msm_hdmi_audio_codec_rx_dai_shutdown\000"
	.space	3
	.type	__func__.26632, %object
	.size	__func__.26632, 36
__func__.26632:
	.ascii	"msm_hdmi_audio_codec_rx_dai_startup\000"
	.type	msm_hdmi_audio_codec_rx_dt_match, %object
	.size	msm_hdmi_audio_codec_rx_dt_match, 392
msm_hdmi_audio_codec_rx_dt_match:
	.space	64
	.ascii	"qcom,msm-hdmi-audio-codec-rx\000"
	.space	99
	.space	4
	.space	196
	.type	msm_hdmi_codec_rx_controls, %object
	.size	msm_hdmi_codec_rx_controls, 48
msm_hdmi_codec_rx_controls:
	.word	3
	.space	8
	.word	.LC18
	.space	4
	.word	5
	.space	4
	.word	msm_hdmi_edid_ctl_info
	.word	msm_hdmi_edid_get
	.space	12
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	msm_hdmi_audio_codec_rx_driver, %object
	.size	msm_hdmi_audio_codec_rx_driver, 80
msm_hdmi_audio_codec_rx_driver:
	.word	msm_hdmi_audio_codec_rx_plat_probe
	.word	msm_hdmi_audio_codec_rx_plat_remove
	.space	12
	.word	.LC0
	.space	4
	.word	0
	.space	8
	.word	msm_hdmi_audio_codec_rx_dt_match
	.space	32
	.space	4
	.type	msm_hdmi_audio_codec_rx_dais, %object
	.size	msm_hdmi_audio_codec_rx_dais, 136
msm_hdmi_audio_codec_rx_dais:
	.word	.LC16
	.space	28
	.word	msm_hdmi_audio_codec_rx_dai_ops
	.space	44
	.word	.LC17
	.space	4
	.word	4
	.word	0
	.word	128
	.word	48000
	.word	48000
	.word	1
	.word	8
	.space	4
	.space	16
	.type	msm_hdmi_audio_codec_rx_soc_driver, %object
	.size	msm_hdmi_audio_codec_rx_soc_driver, 120
msm_hdmi_audio_codec_rx_soc_driver:
	.word	msm_hdmi_audio_codec_rx_probe
	.word	msm_hdmi_audio_codec_rx_remove
	.space	8
	.word	msm_hdmi_codec_rx_controls
	.word	1
	.space	96
	.type	___modver_attr, %object
	.size	___modver_attr, 36
___modver_attr:
	.word	.LC13
	.short	292
	.space	2
	.word	__modver_version_show
	.space	16
	.word	.LC14
	.word	.LC15
	.type	msm_hdmi_audio_codec_rx_dai_ops, %object
	.size	msm_hdmi_audio_codec_rx_dai_ops, 68
msm_hdmi_audio_codec_rx_dai_ops:
	.space	36
	.word	msm_hdmi_audio_codec_rx_dai_startup
	.word	msm_hdmi_audio_codec_rx_dai_shutdown
	.word	msm_hdmi_audio_codec_rx_dai_hw_params
	.space	20
	.section	.exitcall.exit,"aw",%progbits
	.align	2
	.type	__exitcall_msm_hdmi_audio_codec_rx_exit, %object
	.size	__exitcall_msm_hdmi_audio_codec_rx_exit, 4
__exitcall_msm_hdmi_audio_codec_rx_exit:
	.word	msm_hdmi_audio_codec_rx_exit
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_msm_hdmi_audio_codec_rx_init6, %object
	.size	__initcall_msm_hdmi_audio_codec_rx_init6, 4
__initcall_msm_hdmi_audio_codec_rx_init6:
	.word	msm_hdmi_audio_codec_rx_init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"msm-hdmi-audio-codec-rx\000"
.LC1:
	.ascii	"%s\000"
	.space	1
.LC2:
	.ascii	"%s(): platfrom data not from device tree\012\000"
	.space	2
.LC3:
	.ascii	"%s() HDMI core is not ready (rv = %d)\012\000"
	.space	1
.LC4:
	.ascii	"%s() HDMI cable is not connected (rv = %d)\012\000"
.LC5:
	.ascii	"invalid Channels = %u\012\000"
	.space	1
.LC6:
	.ascii	"%s() HDMI core is not ready\012\000"
	.space	3
.LC7:
	.ascii	"%s(): fail to allocate dai data\012\000"
	.space	3
.LC8:
	.ascii	"%s(): Parent device tree node not found\012\000"
	.space	3
.LC9:
	.ascii	"%s(): can't get parent pdev\012\000"
	.space	3
.LC10:
	.ascii	"%s(): can't register with hdmi core\000"
.LC11:
	.ascii	"%s() HDMI core had problems releasing HDMI audio fl"
	.ascii	"ag\012\000"
	.space	1
.LC12:
	.ascii	"%s() HDMI cable is not connected (ret val = %d)\012"
	.ascii	"\000"
	.space	3
.LC13:
	.ascii	"version\000"
.LC14:
	.ascii	"msm_hdmi_codec_rx\000"
	.space	2
.LC15:
	.ascii	"1.0\000"
.LC16:
	.ascii	"msm_hdmi_audio_codec_rx_dai\000"
.LC17:
	.ascii	"HDMI Playback\000"
	.space	2
.LC18:
	.ascii	"HDMI EDID\000"
	.section	__modver,"a",%progbits
	.align	2
	.type	__modver_attr, %object
	.size	__modver_attr, 4
__modver_attr:
	.word	___modver_attr
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
