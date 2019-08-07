msm_stub_dev_remove:
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
	.size	msm_stub_dev_remove, .-msm_stub_dev_remove
	.section	.init.text,"ax",%progbits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	msm_stub_init, %function
msm_stub_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	b	platform_driver_register
	.fnend
	.size	msm_stub_init, .-msm_stub_init
	.section	.devinit.text,"ax",%progbits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	msm_stub_dev_probe, %function
msm_stub_dev_probe:
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
	mov	r3, #1
	mov	r0, r4
	bl	dev_set_name
.L5:
	movw	r1, #:lower16:.LANCHOR1
	mov	r0, r4
	ldr	r2, .L11
	movt	r1, #:upper16:.LANCHOR1
	mov	r3, #2
	pop	{r4, lr}
	b	snd_soc_register_codec
.L12:
	.align	2
.L11:
	.word	.LANCHOR0+80
	.fnend
	.size	msm_stub_dev_probe, .-msm_stub_dev_probe
	.section	.exit.text,"ax",%progbits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	msm_stub_exit, %function
msm_stub_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	b	platform_driver_unregister
	.fnend
	.size	msm_stub_exit, .-msm_stub_exit
	.section	.rodata
	.align	2
	.type	msm_stub_codec_dt_match, %object
	.size	msm_stub_codec_dt_match, 392
msm_stub_codec_dt_match:
	.space	64
	.ascii	"qcom,msm-stub-codec\000"
	.space	108
	.space	4
	.space	196
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	msm_stub_driver, %object
	.size	msm_stub_driver, 80
msm_stub_driver:
	.word	msm_stub_dev_probe
	.word	msm_stub_dev_remove
	.space	12
	.word	.LC0
	.space	4
	.word	0
	.space	8
	.word	msm_stub_codec_dt_match
	.space	32
	.space	4
	.type	msm_stub_dais, %object
	.size	msm_stub_dais, 272
msm_stub_dais:
	.word	.LC5
	.space	76
	.word	.LC6
	.space	4
	.word	4
	.word	0
	.word	254
	.space	8
	.word	1
	.word	8
	.space	4
	.space	16
	.word	.LC7
	.space	36
	.word	.LC8
	.space	4
	.word	68
	.word	0
	.word	254
	.space	8
	.word	1
	.word	8
	.space	4
	.space	56
	.type	___modver_attr, %object
	.size	___modver_attr, 36
___modver_attr:
	.word	.LC2
	.short	292
	.space	2
	.word	__modver_version_show
	.space	16
	.word	.LC3
	.word	.LC4
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	soc_msm_stub, %object
	.size	soc_msm_stub, 120
soc_msm_stub:
	.space	120
	.section	.exitcall.exit,"aw",%progbits
	.align	2
	.type	__exitcall_msm_stub_exit, %object
	.size	__exitcall_msm_stub_exit, 4
__exitcall_msm_stub_exit:
	.word	msm_stub_exit
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_msm_stub_init6, %object
	.size	__initcall_msm_stub_init6, 4
__initcall_msm_stub_init6:
	.word	msm_stub_init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"msm-stub-codec\000"
	.space	1
.LC1:
	.ascii	"%s.%d\000"
	.space	2
.LC2:
	.ascii	"version\000"
.LC3:
	.ascii	"msm_stub\000"
	.space	3
.LC4:
	.ascii	"1.0\000"
.LC5:
	.ascii	"msm-stub-rx\000"
.LC6:
	.ascii	"Playback\000"
	.space	3
.LC7:
	.ascii	"msm-stub-tx\000"
.LC8:
	.ascii	"Record\000"
	.section	__modver,"a",%progbits
	.align	2
	.type	__modver_attr, %object
	.size	__modver_attr, 4
__modver_attr:
	.word	___modver_attr
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
