es705_i2s_set_sysclk:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_i2s_set_sysclk, .-es705_i2s_set_sysclk
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_i2s_set_pll, %function
es705_i2s_set_pll:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_i2s_set_pll, .-es705_i2s_set_pll
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_i2s_set_clkdiv, %function
es705_i2s_set_clkdiv:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_i2s_set_clkdiv, .-es705_i2s_set_clkdiv
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_i2s_set_dai_fmt, %function
es705_i2s_set_dai_fmt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_i2s_set_dai_fmt, .-es705_i2s_set_dai_fmt
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_i2s_set_tdm_slot, %function
es705_i2s_set_tdm_slot:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_i2s_set_tdm_slot, .-es705_i2s_set_tdm_slot
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_i2s_set_channel_map, %function
es705_i2s_set_channel_map:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_i2s_set_channel_map, .-es705_i2s_set_channel_map
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_i2s_hw_free, %function
es705_i2s_hw_free:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_i2s_hw_free, .-es705_i2s_hw_free
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_i2s_port_mute, %function
es705_i2s_port_mute:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	ldr	r0, [r0, #64]
	cmp	r3, #1
	bhi	.L10
	clz	r2, r1
	mov	r1, #0
	lsr	r2, r2, #5
	b	snd_soc_write
.L10:
	mvn	r0, #21
	bx	lr
	.fnend
	.size	es705_i2s_port_mute, .-es705_i2s_port_mute
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_i2s_set_tristate, %function
es705_i2s_set_tristate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	ldr	r0, [r0, #64]
	cmp	r3, #1
	bhi	.L13
	adds	r2, r1, #0
	mov	r1, #0
	movne	r2, #1
	b	snd_soc_write
.L13:
	mvn	r0, #21
	bx	lr
	.fnend
	.size	es705_i2s_set_tristate, .-es705_i2s_set_tristate
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_i2s_hw_params, %function
es705_i2s_hw_params:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r2, #4]
	cmp	r3, #1
	bhi	.L29
	ldr	r2, [r1, #284]
	cmp	r2, #4
	bhi	.L29
	mov	r3, #1
	lsl	r3, r3, r2
	tst	r3, #22
	beq	.L29
	ldr	r3, [r1, #296]
	movw	r2, #22050
	cmp	r3, r2
	beq	.L18
	bls	.L40
	movw	r2, #48000
	cmp	r3, r2
	beq	.L18
	bls	.L41
	mov	r2, #30464
	movt	r2, 1
	cmp	r3, r2
	beq	.L18
	mov	r2, #60928
	movt	r2, 2
	cmp	r3, r2
	bne	.L29
.L18:
	ldr	r3, [r1, #36]
	cmp	r3, #0
	bne	.L28
	ldr	r3, [r1, #40]
	cmp	r3, #0
	movne	r2, #32
	bne	.L21
.L29:
	mvn	r0, #21
	bx	lr
.L40:
	movw	r2, #11025
	cmp	r3, r2
	beq	.L18
	cmp	r3, #16000
	beq	.L18
	cmp	r3, #8000
	bne	.L29
	b	.L18
.L28:
	mov	r2, #0
.L21:
	rsb	r1, r3, #0
	and	r3, r3, r1
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r3, r3
@ 0 "" 2
	.arm
	.syntax unified
	sub	r3, r2, r3
	add	r3, r3, #29
	cmp	r3, #35
	ldrls	pc, [pc, r3, asl #2]
	b	.L29
.L23:
	.word	.L30
	.word	.L30
	.word	.L29
	.word	.L29
	.word	.L30
	.word	.L30
	.word	.L29
	.word	.L29
	.word	.L30
	.word	.L30
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L29
	.word	.L30
	.word	.L30
.L30:
	mov	r0, #0
	bx	lr
.L41:
	cmp	r3, #32000
	beq	.L18
	b	.L29
	.fnend
	.size	es705_i2s_hw_params, .-es705_i2s_hw_params
	.global	es705_i2s_port_dai_ops
	.data
	.align	2
	.type	es705_i2s_port_dai_ops, %object
	.size	es705_i2s_port_dai_ops, 68
es705_i2s_port_dai_ops:
	.word	es705_i2s_set_sysclk
	.word	es705_i2s_set_pll
	.word	es705_i2s_set_clkdiv
	.word	es705_i2s_set_dai_fmt
	.word	es705_i2s_set_tdm_slot
	.word	es705_i2s_set_channel_map
	.word	es705_i2s_set_tristate
	.space	4
	.word	es705_i2s_port_mute
	.word	0
	.word	0
	.word	es705_i2s_hw_params
	.word	es705_i2s_hw_free
	.word	0
	.word	0
	.space	8
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
