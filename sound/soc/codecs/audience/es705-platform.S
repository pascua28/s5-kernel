es705_enable_ext_clk:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:.LC0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r0
	movt	r1, #:upper16:.LC0
	ldr	r0, .L16
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	bl	clk_get
	subs	r4, r0, #0
	beq	.L14
	cmp	r5, #0
	bne	.L15
	bl	clk_disable
.L12:
	mov	r0, r4
	bl	clk_unprepare
.L6:
	mov	r0, r4
	bl	clk_put
	mov	r0, #0
.L1:
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L15:
	bl	clk_prepare
	cmp	r0, #0
	bne	.L6
	mov	r0, r4
	bl	clk_enable
	cmp	r0, #0
	beq	.L6
	b	.L12
.L14:
	movw	r3, #:lower16:es705_priv
	movw	r2, #:lower16:.LANCHOR1
	movt	r3, #:upper16:es705_priv
	movw	r1, #:lower16:.LC1
	movt	r2, #:upper16:.LANCHOR1
	movt	r1, #:upper16:.LC1
	ldr	r0, [r3]
	bl	dev_err
	mvn	r0, #18
	b	.L1
.L17:
	.align	2
.L16:
	.word	.LANCHOR0+8
	.fnend
	.size	es705_enable_ext_clk, .-es705_enable_ext_clk
	.align	2
	.global	es705_gpio_reset
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_gpio_reset, %function
es705_gpio_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r1, #0
	mov	r4, r0
	str	lr, [sp, #4]
	ldr	r3, [r0, #28]
	ldr	r0, [r3, #8]
	bl	__gpio_set_value
	mov	r1, #1000
	mov	r0, r1
	bl	usleep_range
	ldr	r3, [r4, #28]
	mov	r1, #1
	ldr	r0, [r3, #8]
	bl	__gpio_set_value
	movw	r1, #10000
	ldr	r4, [sp]
	ldr	lr, [sp, #4]
	mov	r0, r1
	add	sp, sp, #8
	b	usleep_range
	.fnend
	.size	es705_gpio_reset, .-es705_gpio_reset
	.align	2
	.global	es705_gpio_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_gpio_init, %function
es705_gpio_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	mov	r4, r0
	str	lr, [sp, #8]
	ldr	r3, [r0, #28]
	.pad #12
	sub	sp, sp, #12
	ldr	r0, [r3, #8]
	cmn	r0, #1
	beq	.L21
	movw	r1, #:lower16:.LC2
	movt	r1, #:upper16:.LC2
	bl	gpio_request
	subs	r5, r0, #0
	blt	.L40
	ldr	r3, [r4, #28]
	mov	r1, #0
	ldr	r0, [r3, #8]
	bl	gpio_direction_output
	subs	r5, r0, #0
	blt	.L41
	ldr	r3, [r4, #28]
	ldr	r0, [r3, #12]
	cmn	r0, #1
	beq	.L26
.L47:
	movw	r1, #:lower16:.LC6
	movt	r1, #:upper16:.LC6
	bl	gpio_request
	subs	r5, r0, #0
	blt	.L42
	ldr	r3, [r4, #28]
	mov	r1, #0
	ldr	r0, [r3, #12]
	bl	gpio_direction_output
	subs	r5, r0, #0
	blt	.L43
	ldr	r3, [r4, #28]
	ldr	r0, [r3, #16]
	cmn	r0, #1
	beq	.L30
.L48:
	movw	r1, #:lower16:.LC10
	movt	r1, #:upper16:.LC10
	bl	gpio_request
	subs	r5, r0, #0
	blt	.L44
	ldr	r3, [r4, #28]
	mov	r1, #0
	ldr	r0, [r3, #16]
	bl	gpio_direction_output
	subs	r5, r0, #0
	blt	.L45
.L32:
	ldr	r3, [r4, #28]
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L20
	movw	ip, #:lower16:.LC14
	movw	r2, #:lower16:es705_irq_event
	ldr	r0, [r3]
	movt	ip, #:upper16:.LC14
	movt	r2, #:upper16:es705_irq_event
	mov	r1, #0
	mov	r3, #1
	str	ip, [sp]
	str	r4, [sp, #4]
	bl	request_threaded_irq
	subs	r5, r0, #0
	bne	.L46
	ldr	r3, [r4, #28]
	mov	r1, #1
	ldr	r0, [r3]
	bl	irq_set_irq_wake
	subs	r5, r0, #0
	bge	.L20
	movw	r1, #:lower16:.LC16
	ldr	r2, .L49
	movt	r1, #:upper16:.LC16
	ldr	r0, [r4]
	bl	dev_err
	ldr	r3, [r4, #28]
	ldr	r0, [r3]
	bl	disable_irq
	ldr	r3, [r4, #28]
	mov	r1, r4
	ldr	r0, [r3]
	bl	free_irq
	b	.L20
.L40:
	movw	r1, #:lower16:.LC3
	ldr	r2, .L49
	movt	r1, #:upper16:.LC3
	ldr	r0, [r4]
	bl	dev_err
.L20:
	mov	r0, r5
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L21:
	movw	r1, #:lower16:.LC5
	ldr	r2, .L49
	mov	r5, #0
	movt	r1, #:upper16:.LC5
	ldr	r0, [r4]
	bl	dev_warn
	ldr	r3, [r4, #28]
	ldr	r0, [r3, #12]
	cmn	r0, #1
	bne	.L47
.L26:
	movw	r1, #:lower16:.LC9
	ldr	r2, .L49
	movt	r1, #:upper16:.LC9
	ldr	r0, [r4]
	bl	dev_warn
	ldr	r3, [r4, #28]
	ldr	r0, [r3, #16]
	cmn	r0, #1
	bne	.L48
.L30:
	movw	r1, #:lower16:.LC13
	ldr	r2, .L49
	movt	r1, #:upper16:.LC13
	ldr	r0, [r4]
	bl	dev_warn
	b	.L32
.L44:
	movw	r1, #:lower16:.LC11
	ldr	r2, .L49
	movt	r1, #:upper16:.LC11
	ldr	r0, [r4]
	bl	dev_err
.L29:
.L34:
	ldr	r3, [r4, #28]
	ldr	r0, [r3, #12]
	bl	gpio_free
.L25:
.L35:
	ldr	r3, [r4, #28]
	ldr	r0, [r3, #8]
	bl	gpio_free
	b	.L20
.L42:
	movw	r1, #:lower16:.LC7
	ldr	r2, .L49
	movt	r1, #:upper16:.LC7
	ldr	r0, [r4]
	bl	dev_err
	b	.L35
.L41:
	movw	r1, #:lower16:.LC4
	ldr	r2, .L49
	movt	r1, #:upper16:.LC4
	ldr	r0, [r4]
	bl	dev_err
	b	.L35
.L43:
	movw	r1, #:lower16:.LC8
	ldr	r2, .L49
	movt	r1, #:upper16:.LC8
	ldr	r0, [r4]
	bl	dev_err
	b	.L34
.L46:
	movw	r1, #:lower16:.LC15
	ldr	r2, .L49
	movt	r1, #:upper16:.LC15
	ldr	r0, [r4]
	bl	dev_err
	b	.L20
.L45:
	movw	r1, #:lower16:.LC12
	ldr	r2, .L49
	movt	r1, #:upper16:.LC12
	ldr	r0, [r4]
	bl	dev_err
	ldr	r3, [r4, #28]
	ldr	r0, [r3, #16]
	bl	gpio_free
	b	.L34
.L50:
	.align	2
.L49:
	.word	.LANCHOR1+24
	.fnend
	.size	es705_gpio_init, .-es705_gpio_init
	.align	2
	.global	es705_gpio_wakeup
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_gpio_wakeup, %function
es705_gpio_wakeup:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	movw	r1, #:lower16:.LC17
	movw	r4, #:lower16:system_rev
	str	r6, [sp, #8]
	mov	r5, r0
	ldr	r2, .L57
	str	lr, [sp, #12]
	movt	r1, #:upper16:.LC17
	movt	r4, #:upper16:system_rev
	ldr	r0, [r0]
	bl	_dev_info
	ldr	r3, [r4]
	cmp	r3, #3
	bls	.L52
	mov	r1, #1
	mov	r0, #917504
	bl	gpio_tlmm_config
	ldr	r3, [r5, #28]
	mov	r1, #1
	ldr	r0, [r3, #12]
	bl	gpio_direction_output
.L53:
	mov	r1, #1000
	mov	r0, r1
	bl	usleep_range
	ldr	r3, [r4]
	mov	r1, #0
	cmp	r3, #3
	ldr	r3, [r5, #28]
	ldr	r0, [r3, #12]
	bhi	.L56
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	__gpio_set_value
.L52:
	ldr	r3, [r5, #28]
	mov	r1, #1
	ldr	r0, [r3, #12]
	bl	__gpio_set_value
	b	.L53
.L56:
	bl	gpio_direction_output
	ldr	r3, [r5, #28]
	ldr	r0, [r3, #12]
	bl	gpio_direction_input
	movw	r0, #16386
	ldrd	r4, [sp]
	mov	r1, #1
	ldr	r6, [sp, #8]
	movt	r0, 14
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	gpio_tlmm_config
.L58:
	.align	2
.L57:
	.word	.LANCHOR1+40
	.fnend
	.size	es705_gpio_wakeup, .-es705_gpio_wakeup
	.align	2
	.global	es705_uart_pin_preset
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_uart_pin_preset, %function
es705_uart_pin_preset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #28]
	ldr	r3, [r2, #20]
	cmn	r3, #1
	bxeq	lr
	ldr	r2, [r2, #24]
	cmn	r2, #1
	bxeq	lr
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	movw	r5, #16368
	mov	r4, r0
	str	r6, [sp, #8]
	and	r0, r5, r3, lsl #4
	movw	r6, #16386
	movt	r6, 14
	str	lr, [sp, #12]
	mov	r1, #1
	orr	r0, r0, r6
	bl	gpio_tlmm_config
	ldr	r3, [r4, #28]
	mov	r1, #1
	ldr	lr, [sp, #12]
	ldr	r0, [r3, #24]
	and	r0, r5, r0, lsl #4
	ldrd	r4, [sp]
	orr	r0, r0, r6
	ldr	r6, [sp, #8]
	add	sp, sp, #16
	b	gpio_tlmm_config
	.fnend
	.size	es705_uart_pin_preset, .-es705_uart_pin_preset
	.align	2
	.global	es705_uart_pin_postset
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_uart_pin_postset, %function
es705_uart_pin_postset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #28]
	ldr	r3, [r2, #20]
	cmn	r3, #1
	bxeq	lr
	ldr	r2, [r2, #24]
	cmn	r2, #1
	bxeq	lr
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	movw	r5, #16368
	mov	r4, r0
	and	r0, r5, r3, lsl #4
	mov	r1, #1
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	orr	r0, r0, #917504
	bl	gpio_tlmm_config
	ldr	r3, [r4, #28]
	mov	r1, #1
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #12]
	ldr	r0, [r3, #24]
	and	r0, r5, r0, lsl #4
	ldrd	r4, [sp]
	add	sp, sp, #16
	orr	r0, r0, #917504
	b	gpio_tlmm_config
	.fnend
	.size	es705_uart_pin_postset, .-es705_uart_pin_postset
	.align	2
	.global	es705_init_input_device
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_init_input_device, %function
es705_init_input_device:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	bl	input_allocate_device
	cmp	r0, #0
	str	r0, [r4, #1376]
	beq	.L83
	movw	r2, #:lower16:.LC18
	mov	r3, r0
	movt	r2, #:upper16:.LC18
	mov	r0, #0
	str	r2, [r3]
	ldr	r1, [r4, #1376]
	add	r1, r1, #24
	bl	_set_bit
	ldr	r1, [r4, #1376]
	mov	r0, #1
	add	r1, r1, #24
	bl	_set_bit
	ldr	r1, [r4, #1376]
	mov	r0, #199
	add	r1, r1, #28
	bl	_set_bit
	ldr	r1, [r4, #1376]
	mov	r0, #198
	add	r1, r1, #28
	bl	_set_bit
	ldr	r0, [r4, #1376]
	bl	input_register_device
	subs	r5, r0, #0
	blt	.L85
.L81:
	mov	r0, r5
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L85:
	ldr	r0, [r4, #1376]
	bl	input_free_device
	b	.L81
.L83:
.L82:
	mvn	r5, #11
	b	.L81
	.fnend
	.size	es705_init_input_device, .-es705_init_input_device
	.align	2
	.global	es705_unregister_input_device
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_unregister_input_device, %function
es705_unregister_input_device:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #1376]
	b	input_unregister_device
	.fnend
	.size	es705_unregister_input_device, .-es705_unregister_input_device
	.align	2
	.global	es705_vs_event
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_vs_event, %function
es705_vs_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r3, [r0, #1384]
	ldr	r0, [r0]
	cmp	r3, #1
	beq	.L89
	cmp	r3, #2
	moveq	r5, #198
	bne	.L92
.L88:
	movw	r1, #:lower16:.LC20
	mov	r3, r5
	ldr	r2, .L93
	movt	r1, #:upper16:.LC20
	movw	r4, #:lower16:es705_priv
	bl	_dev_info
	movt	r4, #:upper16:es705_priv
	mov	r3, #1
	mov	r1, r3
	mov	r2, r5
	ldr	r0, [r4, #1376]
	bl	input_event
	mov	r3, #0
	ldr	r0, [r4, #1376]
	mov	r2, r3
	mov	r1, r3
	bl	input_event
	mov	r0, #10
	bl	msleep
	mov	r2, r5
	ldr	r0, [r4, #1376]
	mov	r3, #0
	mov	r1, #1
	bl	input_event
	mov	r3, #0
	ldr	r0, [r4, #1376]
	ldrd	r4, [sp]
	mov	r2, r3
	mov	r1, r3
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	input_event
.L92:
	movw	r1, #:lower16:.LC19
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	movt	r1, #:upper16:.LC19
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	ldr	r2, .L93
	b	_dev_info
.L89:
	mov	r5, #199
	b	.L88
.L94:
	.align	2
.L93:
	.word	.LANCHOR1+60
	.fnend
	.size	es705_vs_event, .-es705_vs_event
	.align	2
	.global	es705_gpio_free
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_gpio_free, %function
es705_gpio_free:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	mov	r4, r0
	str	lr, [sp, #4]
	ldr	r0, [r0, #8]
	cmn	r0, #1
	beq	.L96
	bl	gpio_free
.L96:
	ldr	r0, [r4, #28]
	cmn	r0, #1
	beq	.L97
	bl	gpio_free
.L97:
	ldr	r0, [r4, #16]
	cmn	r0, #1
	beq	.L98
	bl	gpio_free
.L98:
	ldr	r0, [r4, #12]
	cmn	r0, #1
	beq	.L95
	ldr	r4, [sp]
	ldr	lr, [sp, #4]
	add	sp, sp, #8
	b	gpio_free
.L95:
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
	.fnend
	.size	es705_gpio_free, .-es705_gpio_free
	.align	2
	.global	es705_clk_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_clk_init, %function
es705_clk_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #28]
	movw	r3, #:lower16:es705_enable_ext_clk
	movt	r3, #:upper16:es705_enable_ext_clk
	str	r3, [r2, #68]
	bx	lr
	.fnend
	.size	es705_clk_init, .-es705_clk_init
	.align	2
	.global	es705_populate_dt_pdata
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_populate_dt_pdata, %function
es705_populate_dt_pdata:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r2, #208
	mov	r1, #72
	mov	r5, r0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	bl	devm_kzalloc
	subs	r4, r0, #0
	beq	.L123
	mov	r3, #0
	movw	r1, #:lower16:.LC22
	ldr	r0, [r5, #292]
	mov	r2, r3
	movt	r1, #:upper16:.LC22
	bl	of_get_named_gpio_flags
	cmp	r0, #0
	str	r0, [r4, #8]
	blt	.L124
.L114:
	mov	r3, #0
	movw	r1, #:lower16:.LC25
	ldr	r0, [r5, #292]
	mov	r2, r3
	movt	r1, #:upper16:.LC25
	bl	of_get_named_gpio_flags
	cmp	r0, #0
	str	r0, [r4, #28]
	blt	.L125
	mov	r3, #0
	movw	r1, #:lower16:.LC27
	ldr	r0, [r5, #292]
	mov	r2, r3
	movt	r1, #:upper16:.LC27
	bl	of_get_named_gpio_flags
	cmp	r0, #0
	str	r0, [r4, #32]
	blt	.L126
	mov	r3, #0
	movw	r1, #:lower16:.LC29
	ldr	r0, [r5, #292]
	mov	r2, r3
	movt	r1, #:upper16:.LC29
	bl	of_get_named_gpio_flags
	cmp	r0, #0
	str	r0, [r4, #20]
	blt	.L127
.L118:
	mov	r3, #0
	movw	r1, #:lower16:.LC31
	ldr	r0, [r5, #292]
	mov	r2, r3
	movt	r1, #:upper16:.LC31
	bl	of_get_named_gpio_flags
	cmp	r0, #0
	str	r0, [r4, #24]
	blt	.L128
.L119:
	mov	r3, #0
	movw	r1, #:lower16:.LC33
	ldr	r0, [r5, #292]
	mov	r2, r3
	movt	r1, #:upper16:.LC33
	bl	of_get_named_gpio_flags
	cmp	r0, #0
	str	r0, [r4, #12]
	blt	.L129
.L120:
	mov	r3, #0
	movw	r1, #:lower16:.LC35
	ldr	r0, [r5, #292]
	mov	r2, r3
	movt	r1, #:upper16:.LC35
	bl	of_get_named_gpio_flags
	cmp	r0, #0
	str	r0, [r4, #16]
	blt	.L130
.L121:
	ldr	r0, [r4, #32]
	bl	__gpio_to_irq
	str	r0, [r4]
.L111:
	mov	r0, r4
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L124:
	movw	r1, #:lower16:.LC23
	mov	r3, #1
	ldr	r0, [r5, #292]
	movt	r1, #:upper16:.LC23
	add	r2, r4, #8
	bl	of_property_read_u32_array
	ldr	r3, [r4, #8]
	cmp	r3, #0
	bge	.L114
	movw	r1, #:lower16:.LC24
	ldr	r2, .L131
	mov	r0, r5
	movt	r1, #:upper16:.LC24
	bl	dev_err
.L115:
	mov	r1, r4
	mov	r0, r5
	mov	r4, #0
	bl	devm_kfree
	b	.L111
.L130:
	movw	r1, #:lower16:.LC36
	mov	r0, r5
	ldr	r2, .L131
	movt	r1, #:upper16:.LC36
	bl	_dev_info
	mvn	r3, #0
	str	r3, [r4, #16]
	b	.L121
.L127:
	movw	r1, #:lower16:.LC30
	ldr	r2, .L131
	mov	r0, r5
	movt	r1, #:upper16:.LC30
	bl	_dev_info
	mvn	r3, #0
	str	r3, [r4, #20]
	b	.L118
.L128:
	movw	r1, #:lower16:.LC32
	ldr	r2, .L131
	mov	r0, r5
	movt	r1, #:upper16:.LC32
	bl	_dev_info
	mvn	r3, #0
	str	r3, [r4, #24]
	b	.L119
.L129:
	movw	r1, #:lower16:.LC34
	ldr	r2, .L131
	mov	r0, r5
	movt	r1, #:upper16:.LC34
	bl	_dev_info
	mvn	r3, #0
	str	r3, [r4, #12]
	b	.L120
.L125:
	movw	r1, #:lower16:.LC26
	ldr	r2, .L131
	mov	r0, r5
	movt	r1, #:upper16:.LC26
	bl	dev_err
	b	.L115
.L126:
	movw	r1, #:lower16:.LC28
	ldr	r2, .L131
	mov	r0, r5
	movt	r1, #:upper16:.LC28
	bl	dev_err
	b	.L115
.L123:
	movw	r1, #:lower16:.LC21
	mov	r0, r5
	ldr	r2, .L131
	movt	r1, #:upper16:.LC21
	bl	dev_err
	b	.L111
.L132:
	.align	2
.L131:
	.word	.LANCHOR1+76
	.fnend
	.size	es705_populate_dt_pdata, .-es705_populate_dt_pdata
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.27159, %object
	.size	__func__.27159, 21
__func__.27159:
	.ascii	"es705_enable_ext_clk\000"
	.space	3
	.type	__func__.27118, %object
	.size	__func__.27118, 16
__func__.27118:
	.ascii	"es705_gpio_init\000"
	.type	__func__.27131, %object
	.size	__func__.27131, 18
__func__.27131:
	.ascii	"es705_gpio_wakeup\000"
	.space	2
	.type	__func__.27150, %object
	.size	__func__.27150, 15
__func__.27150:
	.ascii	"es705_vs_event\000"
	.space	1
	.type	__func__.27168, %object
	.size	__func__.27168, 24
__func__.27168:
	.ascii	"es705_populate_dt_pdata\000"
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.type	msm_es705_mclk_dev, %object
	.size	msm_es705_mclk_dev, 376
msm_es705_mclk_dev:
	.word	.LC37
	.word	-1
	.space	44
	.word	.LC38
	.space	304
	.space	16
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"osr_clk\000"
.LC1:
	.ascii	"%s: clk_get osr_clk FAIL\012\000"
	.space	2
.LC2:
	.ascii	"es705_reset\000"
.LC3:
	.ascii	"%s(): es705_reset request failed\000"
	.space	3
.LC4:
	.ascii	"%s(): es705_reset direction failed\000"
	.space	1
.LC5:
	.ascii	"%s(): es705_reset undefined\012\000"
	.space	3
.LC6:
	.ascii	"es705_wakeup\000"
	.space	3
.LC7:
	.ascii	"%s(): es705_wakeup request failed\000"
	.space	2
.LC8:
	.ascii	"%s(): es705_wakeup direction failed\000"
.LC9:
	.ascii	"%s(): wakeup_gpio undefined\012\000"
	.space	3
.LC10:
	.ascii	"es705_uart\000"
	.space	1
.LC11:
	.ascii	"%s(): es705_uart request failed\000"
.LC12:
	.ascii	"%s(): es705_uart direction failed\000"
	.space	2
.LC13:
	.ascii	"%s(): es705_uart undefined\012\000"
.LC14:
	.ascii	"es705-irq-event\000"
.LC15:
	.ascii	"%s(): event request_irq() failed\012\000"
	.space	2
.LC16:
	.ascii	"%s(): set event irq wake failed\012\000"
	.space	3
.LC17:
	.ascii	"%s(): generate gpio wakeup falling edge\012\000"
	.space	3
.LC18:
	.ascii	"es705 input\000"
.LC19:
	.ascii	"%s(): Invalid value(%d)\012\000"
	.space	3
.LC20:
	.ascii	"%s(): Raise key event(%d)\012\000"
	.space	1
.LC21:
	.ascii	"%s(): platform data allocation failed\012\000"
	.space	1
.LC22:
	.ascii	"es705-reset-gpio\000"
	.space	3
.LC23:
	.ascii	"es705-reset-expander-gpio\000"
	.space	2
.LC24:
	.ascii	"%s(): get reset_gpio failed\012\000"
	.space	3
.LC25:
	.ascii	"es705-gpioa-gpio\000"
	.space	3
.LC26:
	.ascii	"%s(): get gpioa_gpio failed\012\000"
	.space	3
.LC27:
	.ascii	"es705-gpiob-gpio\000"
	.space	3
.LC28:
	.ascii	"%s(): get gpiob_gpio failed\012\000"
	.space	3
.LC29:
	.ascii	"es705-uart-tx\000"
	.space	2
.LC30:
	.ascii	"%s(): get uart_tx_gpio failed\012\000"
	.space	1
.LC31:
	.ascii	"es705-uart-rx\000"
	.space	2
.LC32:
	.ascii	"%s(): get uart_rx_gpio failed\012\000"
	.space	1
.LC33:
	.ascii	"es705-wakeup-gpio\000"
	.space	2
.LC34:
	.ascii	"%s(): get wakeup_gpio failed\012\000"
	.space	2
.LC35:
	.ascii	"es705-uart-gpio\000"
.LC36:
	.ascii	"%s(): get uart_gpio failed\012\000"
.LC37:
	.ascii	"es705_mclk_dev_pdev\000"
.LC38:
	.ascii	"es705_mclk_dev\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
