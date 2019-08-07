es705_clock_on_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_clock_on_show, .-es705_clock_on_show
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_uart_fw_download_rate, %function
es705_get_uart_fw_download_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	mov	r0, #0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r3, [r3, #620]
	str	r3, [r1, #72]
	bx	lr
	.fnend
	.size	es705_get_uart_fw_download_rate, .-es705_get_uart_fw_download_rate
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_uart_fw_download_rate, %function
es705_put_uart_fw_download_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r1, #72]
	movw	r3, #:lower16:.LANCHOR0
	mov	r0, #0
	movt	r3, #:upper16:.LANCHOR0
	str	r2, [r3, #620]
	bx	lr
	.fnend
	.size	es705_put_uart_fw_download_rate, .-es705_put_uart_fw_download_rate
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_vs_stream_enable, %function
es705_get_vs_stream_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	mov	r0, #0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r3, [r3, #616]
	str	r3, [r1, #72]
	bx	lr
	.fnend
	.size	es705_get_vs_stream_enable, .-es705_get_vs_stream_enable
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_vs_stream_enable, %function
es705_put_vs_stream_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r1, #72]
	movw	r3, #:lower16:.LANCHOR0
	mov	r0, #0
	movt	r3, #:upper16:.LANCHOR0
	str	r2, [r3, #616]
	bx	lr
	.fnend
	.size	es705_put_vs_stream_enable, .-es705_put_vs_stream_enable
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_vs_make_internal_dump, %function
es705_get_vs_make_internal_dump:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_get_vs_make_internal_dump, .-es705_get_vs_make_internal_dump
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_veq_preset_value, %function
es705_get_veq_preset_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r0, [r3, #1416]
	bx	lr
	.fnend
	.size	es705_get_veq_preset_value, .-es705_get_veq_preset_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_streaming_select, %function
es705_get_streaming_select:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r3, #0
	mov	r0, #0
	str	r3, [r1, #72]
	bx	lr
	.fnend
	.size	es705_get_streaming_select, .-es705_get_streaming_select
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_internal_route_config, %function
es705_get_internal_route_config:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	mov	r0, #0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r3, [r3, #1148]
	str	r3, [r1, #72]
	bx	lr
	.fnend
	.size	es705_get_internal_route_config, .-es705_get_internal_route_config
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_network_type, %function
es705_get_network_type:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR1
	mov	r0, #0
	movt	r3, #:upper16:.LANCHOR1
	ldr	r3, [r3]
	str	r3, [r1, #72]
	bx	lr
	.fnend
	.size	es705_get_network_type, .-es705_get_network_type
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_preset_value, %function
es705_get_preset_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movw	r2, #1146
	movt	r3, #:upper16:.LANCHOR0
	mov	r0, #0
	ldrh	r3, [r3, r2]
	str	r3, [r1, #72]
	bx	lr
	.fnend
	.size	es705_get_preset_value, .-es705_get_preset_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_ap_get_tx1_ch_cnt, %function
es705_ap_get_tx1_ch_cnt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	mov	r0, #0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r3, [r3, #1168]
	sub	r3, r3, #1
	str	r3, [r1, #72]
	bx	lr
	.fnend
	.size	es705_ap_get_tx1_ch_cnt, .-es705_ap_get_tx1_ch_cnt
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_vs_enable, %function
es705_get_vs_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	mov	r0, #0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r3, [r3, #608]
	str	r3, [r1, #72]
	bx	lr
	.fnend
	.size	es705_get_vs_enable, .-es705_get_vs_enable
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_vs_enable, %function
es705_put_vs_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	movw	r3, #:lower16:.LANCHOR0
	str	lr, [sp, #4]
	ldr	r1, [r1, #72]
	movt	r3, #:upper16:.LANCHOR0
	mov	r0, r3
	ldr	r2, [r3, #64]
	str	r1, [r3, #608]
	blx	r2
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, #0
	ldr	pc, [sp], #4
	.fnend
	.size	es705_put_vs_enable, .-es705_put_vs_enable
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_vs_wakeup_keyword, %function
es705_get_vs_wakeup_keyword:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	mov	r0, #0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r3, [r3, #612]
	str	r3, [r1, #72]
	bx	lr
	.fnend
	.size	es705_get_vs_wakeup_keyword, .-es705_get_vs_wakeup_keyword
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_vs_wakeup_keyword, %function
es705_put_vs_wakeup_keyword:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r1, #72]
	movw	r3, #:lower16:.LANCHOR0
	mov	r0, #0
	movt	r3, #:upper16:.LANCHOR0
	str	r2, [r3, #612]
	bx	lr
	.fnend
	.size	es705_put_vs_wakeup_keyword, .-es705_put_vs_wakeup_keyword
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_set_bias_level, %function
es705_set_bias_level:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r1, [r0, #180]
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_set_bias_level, .-es705_set_bias_level
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_vs_abort_value, %function
es705_put_vs_abort_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	movw	ip, #:lower16:.LANCHOR1
	movw	r3, #:lower16:.LANCHOR0
	str	lr, [sp, #4]
	ldr	lr, [r1, #72]
	movt	ip, #:upper16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR0
	movw	r2, #:lower16:.LANCHOR2
	movw	r1, #:lower16:.LC8
	ldr	r0, [r3]
	movt	r2, #:upper16:.LANCHOR2
	movt	r1, #:upper16:.LC8
	mov	r3, lr
	str	lr, [ip, #4]
	bl	_dev_info
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, #0
	ldr	pc, [sp], #4
	.fnend
	.size	es705_put_vs_abort_value, .-es705_put_vs_abort_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_voice_lpm_enable_value, %function
es705_get_voice_lpm_enable_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:.LANCHOR0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	ldr	r3, .L24
	movt	ip, #:upper16:.LANCHOR0
	str	lr, [sp, #4]
	.pad #8
	sub	sp, sp, #8
	ldr	lr, [ip]
	movw	r2, #:lower16:.LC9
	movw	r0, #:lower16:.LC10
	ldr	r4, [ip, #1388]
	movt	r2, #:upper16:.LC9
	movt	r0, #:upper16:.LC10
	str	r4, [r1, #72]
	ldr	ip, [ip, #1388]
	mov	r1, lr
	str	ip, [sp]
	bl	dev_printk
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L25:
	.align	2
.L24:
	.word	.LANCHOR2+28
	.fnend
	.size	es705_get_voice_lpm_enable_value, .-es705_get_voice_lpm_enable_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_vs_abort_value, %function
es705_get_vs_abort_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r2, #:lower16:.LANCHOR1
	movw	ip, #:lower16:.LANCHOR0
	.save {lr}
	str	lr, [sp, #-4]!
	movt	r2, #:upper16:.LANCHOR1
	movt	ip, #:upper16:.LANCHOR0
	ldr	r3, .L28
	ldr	lr, [r2, #4]
	.pad #12
	sub	sp, sp, #12
	movw	r0, #:lower16:.LC10
	ldr	ip, [ip]
	movw	r2, #:lower16:.LC8
	movt	r0, #:upper16:.LC10
	movt	r2, #:upper16:.LC8
	str	lr, [r1, #72]
	str	lr, [sp]
	mov	r1, ip
	bl	dev_printk
	mov	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L29:
	.align	2
.L28:
	.word	.LANCHOR2+64
	.fnend
	.size	es705_get_vs_abort_value, .-es705_get_vs_abort_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_voice_wakeup_enable_value, %function
es705_get_voice_wakeup_enable_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:.LANCHOR0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	ldr	r3, .L32
	movt	ip, #:upper16:.LANCHOR0
	str	lr, [sp, #4]
	.pad #8
	sub	sp, sp, #8
	ldr	lr, [ip]
	movw	r2, #:lower16:.LC11
	movw	r0, #:lower16:.LC10
	ldr	r4, [ip, #1384]
	movt	r2, #:upper16:.LC11
	movt	r0, #:upper16:.LC10
	str	r4, [r1, #72]
	ldr	ip, [ip, #1384]
	mov	r1, lr
	str	ip, [sp]
	bl	dev_printk
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L33:
	.align	2
.L32:
	.word	.LANCHOR2+92
	.fnend
	.size	es705_get_voice_wakeup_enable_value, .-es705_get_voice_wakeup_enable_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_aud_zoom, %function
es705_get_aud_zoom:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r2, #:lower16:.LC12
	movt	r4, #:upper16:.LANCHOR0
	str	lr, [sp, #8]
	.pad #12
	sub	sp, sp, #12
	ldr	ip, [r4, #592]
	movw	r0, #:lower16:.LC10
	mov	r5, r1
	ldr	r3, .L36
	movt	r2, #:upper16:.LC12
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	str	ip, [sp]
	bl	dev_printk
	ldr	r3, [r4, #592]
	mov	r0, #0
	str	r3, [r5, #72]
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L37:
	.align	2
.L36:
	.word	.LANCHOR2+128
	.fnend
	.size	es705_get_aud_zoom, .-es705_get_aud_zoom
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_ns_value, %function
es705_get_ns_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r2, #:lower16:.LC13
	movt	r4, #:upper16:.LANCHOR0
	str	lr, [sp, #8]
	.pad #12
	sub	sp, sp, #12
	ldr	ip, [r4, #588]
	movw	r0, #:lower16:.LC10
	mov	r5, r1
	ldr	r3, .L40
	movt	r2, #:upper16:.LC13
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	str	ip, [sp]
	bl	dev_printk
	ldr	r3, [r4, #588]
	mov	r0, #0
	str	r3, [r5, #72]
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L41:
	.align	2
.L40:
	.word	.LANCHOR2+148
	.fnend
	.size	es705_get_ns_value, .-es705_get_ns_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_internal_rate, %function
es705_get_internal_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:.LANCHOR0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	ldr	r3, .L44
	movt	ip, #:upper16:.LANCHOR0
	str	lr, [sp, #4]
	.pad #8
	sub	sp, sp, #8
	ldr	r4, [ip]
	movw	r2, #:lower16:.LC14
	movw	r0, #:lower16:.LC10
	ldr	lr, [ip, #1152]
	movt	r2, #:upper16:.LC14
	movt	r0, #:upper16:.LC10
	str	lr, [r1, #72]
	ldr	ip, [ip, #1152]
	mov	r1, r4
	stm	sp, {ip, lr}
	bl	dev_printk
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L45:
	.align	2
.L44:
	.word	.LANCHOR2+168
	.fnend
	.size	es705_get_internal_rate, .-es705_get_internal_rate
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_rx2_route_enable_value, %function
es705_put_rx2_route_enable_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	movw	r4, #:lower16:.LANCHOR0
	movw	r2, #:lower16:.LC15
	str	lr, [sp, #4]
	ldr	ip, [r1, #72]
	.pad #8
	sub	sp, sp, #8
	movt	r4, #:upper16:.LANCHOR0
	movw	r0, #:lower16:.LC10
	ldr	r3, .L53
	movt	r2, #:upper16:.LC15
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	str	ip, [sp]
	str	ip, [r4, #1164]
	bl	dev_printk
	ldr	r3, [r4, #1380]
	cmp	r3, #0
	beq	.L47
	ldr	r2, [r4, #1164]
	cmp	r2, #0
	beq	.L48
	mov	r1, #174
	mov	r0, #4
	blx	r3
.L47:
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L48:
	ldr	r2, [r4, #1156]
	cmp	r2, #0
	bne	.L47
	ldr	r2, [r4, #1160]
	cmp	r2, #0
	bne	.L47
	mov	r1, #174
	mov	r0, #1
	blx	r3
	b	.L47
.L54:
	.align	2
.L53:
	.word	.LANCHOR2+192
	.fnend
	.size	es705_put_rx2_route_enable_value, .-es705_put_rx2_route_enable_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_rx2_route_enable_value, %function
es705_get_rx2_route_enable_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:.LANCHOR0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	ldr	r3, .L57
	movt	ip, #:upper16:.LANCHOR0
	str	lr, [sp, #4]
	.pad #8
	sub	sp, sp, #8
	ldr	lr, [ip]
	movw	r2, #:lower16:.LC15
	movw	r0, #:lower16:.LC10
	ldr	r4, [ip, #1164]
	movt	r2, #:upper16:.LC15
	movt	r0, #:upper16:.LC10
	str	r4, [r1, #72]
	ldr	ip, [ip, #1164]
	mov	r1, lr
	str	ip, [sp]
	bl	dev_printk
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L58:
	.align	2
.L57:
	.word	.LANCHOR2+228
	.fnend
	.size	es705_get_rx2_route_enable_value, .-es705_get_rx2_route_enable_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_tx1_route_enable_value, %function
es705_put_tx1_route_enable_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	movw	r4, #:lower16:.LANCHOR0
	movw	r2, #:lower16:.LC16
	str	lr, [sp, #4]
	ldr	ip, [r1, #72]
	.pad #8
	sub	sp, sp, #8
	movt	r4, #:upper16:.LANCHOR0
	movw	r0, #:lower16:.LC10
	ldr	r3, .L66
	movt	r2, #:upper16:.LC16
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	str	ip, [sp]
	str	ip, [r4, #1160]
	bl	dev_printk
	ldr	r3, [r4, #1380]
	cmp	r3, #0
	beq	.L60
	ldr	r2, [r4, #1160]
	cmp	r2, #0
	beq	.L61
	mov	r1, #174
	mov	r0, #4
	blx	r3
.L60:
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L61:
	ldr	r2, [r4, #1156]
	cmp	r2, #0
	bne	.L60
	ldr	r2, [r4, #1164]
	cmp	r2, #0
	bne	.L60
	mov	r1, #174
	mov	r0, #1
	blx	r3
	b	.L60
.L67:
	.align	2
.L66:
	.word	.LANCHOR2+264
	.fnend
	.size	es705_put_tx1_route_enable_value, .-es705_put_tx1_route_enable_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_tx1_route_enable_value, %function
es705_get_tx1_route_enable_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:.LANCHOR0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	ldr	r3, .L70
	movt	ip, #:upper16:.LANCHOR0
	str	lr, [sp, #4]
	.pad #8
	sub	sp, sp, #8
	ldr	lr, [ip]
	movw	r2, #:lower16:.LC16
	movw	r0, #:lower16:.LC10
	ldr	r4, [ip, #1160]
	movt	r2, #:upper16:.LC16
	movt	r0, #:upper16:.LC10
	str	r4, [r1, #72]
	ldr	ip, [ip, #1160]
	mov	r1, lr
	str	ip, [sp]
	bl	dev_printk
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L71:
	.align	2
.L70:
	.word	.LANCHOR2+300
	.fnend
	.size	es705_get_tx1_route_enable_value, .-es705_get_tx1_route_enable_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_rx1_route_enable_value, %function
es705_put_rx1_route_enable_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	movw	r4, #:lower16:.LANCHOR0
	movw	r2, #:lower16:.LC17
	str	lr, [sp, #4]
	ldr	ip, [r1, #72]
	.pad #8
	sub	sp, sp, #8
	movt	r4, #:upper16:.LANCHOR0
	movw	r0, #:lower16:.LC10
	ldr	r3, .L79
	movt	r2, #:upper16:.LC17
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	str	ip, [sp]
	str	ip, [r4, #1156]
	bl	dev_printk
	ldr	r3, [r4, #1380]
	cmp	r3, #0
	beq	.L73
	ldr	r2, [r4, #1156]
	cmp	r2, #0
	beq	.L74
	mov	r1, #174
	mov	r0, #4
	blx	r3
.L73:
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L74:
	ldr	r2, [r4, #1164]
	cmp	r2, #0
	bne	.L73
	ldr	r2, [r4, #1160]
	cmp	r2, #0
	bne	.L73
	mov	r1, #174
	mov	r0, #1
	blx	r3
	b	.L73
.L80:
	.align	2
.L79:
	.word	.LANCHOR2+336
	.fnend
	.size	es705_put_rx1_route_enable_value, .-es705_put_rx1_route_enable_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_rx1_route_enable_value, %function
es705_get_rx1_route_enable_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	ip, #:lower16:.LANCHOR0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	ldr	r3, .L83
	movt	ip, #:upper16:.LANCHOR0
	str	lr, [sp, #4]
	.pad #8
	sub	sp, sp, #8
	ldr	lr, [ip]
	movw	r2, #:lower16:.LC17
	movw	r0, #:lower16:.LC10
	ldr	r4, [ip, #1156]
	movt	r2, #:upper16:.LC17
	movt	r0, #:upper16:.LC10
	str	r4, [r1, #72]
	ldr	ip, [ip, #1156]
	mov	r1, lr
	str	ip, [sp]
	bl	dev_printk
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L84:
	.align	2
.L83:
	.word	.LANCHOR2+372
	.fnend
	.size	es705_get_rx1_route_enable_value, .-es705_get_rx1_route_enable_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_gpio_reset_set, %function
es705_gpio_reset_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r5, #:lower16:.LC10
	strd	r6, [sp, #8]
	ldr	r6, .L87
	movt	r4, #:upper16:.LANCHOR0
	movt	r5, #:upper16:.LC10
	movw	r2, #:lower16:.LC18
	ldr	r1, [r4]
	movt	r2, #:upper16:.LC18
	mov	r7, r3
	str	r8, [sp, #16]
	mov	r0, r5
	str	lr, [sp, #20]
	mov	r3, r6
	bl	dev_printk
	mov	r3, #0
	mov	r0, r4
	str	r3, [r4, #596]
	bl	es705_gpio_reset
	movw	r2, #:lower16:.LC19
	mov	r3, r6
	ldr	r1, [r4]
	mov	r0, r5
	movt	r2, #:upper16:.LC19
	bl	dev_printk
	ldrd	r4, [sp]
	mov	r0, r7
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L88:
	.align	2
.L87:
	.word	.LANCHOR2+408
	.fnend
	.size	es705_gpio_reset_set, .-es705_gpio_reset_set
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_write, %function
es705_write:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r0, #258
	mov	r3, r1
	strd	r6, [sp, #8]
	movw	r6, #:lower16:__stack_chk_guard
	cmp	r1, r0
	movt	r6, #:upper16:__stack_chk_guard
	strd	r8, [sp, #16]
	mov	r4, #0
	ldr	r1, [r6]
	str	r10, [sp, #24]
	mov	r5, #0
	str	lr, [sp, #28]
	movw	r7, #:lower16:.LANCHOR0
	.pad #40
	sub	sp, sp, #40
	movt	r7, #:upper16:.LANCHOR0
	ldr	r0, [r7]
	strd	r4, [sp, #20]
	str	r1, [sp, #36]
	bhi	.L97
	lsl	r8, r3, #5
	movw	r9, #:lower16:es705_api_access
	mov	r10, r2
	ldr	r2, .L100
	movt	r9, #:upper16:es705_api_access
	mvn	ip, #0
	add	r1, r9, r8
	str	r10, [sp]
	ldr	r5, [r1, #20]
	ldr	r4, [r1, #28]
	movw	r1, #:lower16:.LC21
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r4, r4
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r4, r4, #32
	movt	r1, #:upper16:.LC21
	mvn	r4, ip, lsl r4
	str	r5, [sp, #4]
	str	r4, [sp, #8]
	bl	_dev_info
	add	r1, r8, #12
	mov	r2, r5
	add	r1, r9, r1
	add	r0, sp, #20
	bl	memcpy
	cmp	r5, #4
	beq	.L93
	cmp	r5, #8
	beq	.L98
.L92:
	add	r1, sp, #20
	mov	r2, r5
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L100+4
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	add	r1, sp, #28
	ldr	r3, [r7, #56]
	mov	r2, r5
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	mov	r4, r0
	ldr	r0, .L100+4
	bl	mutex_unlock
.L89:
	ldr	r2, [sp, #36]
	mov	r0, r4
	ldr	r3, [r6]
	cmp	r2, r3
	bne	.L99
	add	sp, sp, #40
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L98:
	ldr	r3, [sp, #24]
	and	r4, r4, r10
	orr	r4, r3, r4
	str	r4, [sp, #24]
	b	.L92
.L93:
	ldr	r3, [sp, #20]
	and	r4, r4, r10
	orr	r4, r3, r4
	str	r4, [sp, #20]
	b	.L92
.L97:
	movw	r1, #:lower16:.LC20
	ldr	r2, .L100
	mvn	r4, #21
	movt	r1, #:upper16:.LC20
	bl	dev_err
	b	.L89
.L99:
	bl	__stack_chk_fail
.L101:
	.align	2
.L100:
	.word	.LANCHOR2+432
	.word	.LANCHOR0+144
	.fnend
	.size	es705_write, .-es705_write
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_read, %function
es705_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:__stack_chk_guard
	mov	r3, r1
	movt	r4, #:upper16:__stack_chk_guard
	movw	r1, #258
	str	r6, [sp, #8]
	ldr	r2, [r4]
	str	lr, [sp, #12]
	cmp	r3, r1
	.pad #32
	sub	sp, sp, #32
	mov	r0, #0
	mov	r1, #0
	strd	r0, [sp, #12]
	str	r2, [sp, #28]
	bhi	.L108
	movw	r1, #:lower16:es705_api_access
	add	r0, sp, #12
	movt	r1, #:upper16:es705_api_access
	movw	r5, #:lower16:.LANCHOR0
	add	r1, r1, r3, lsl #5
	movt	r5, #:upper16:.LANCHOR0
	ldr	r6, [r1, #8]
	mov	r2, r6
	bl	memcpy
	add	r1, sp, #12
	mov	r2, r6
	add	r0, sp, #20
	bl	memcpy
	add	r0, r5, #144
	bl	mutex_lock
	mov	r3, #0
	mov	r2, r6
	ldr	r6, [r5, #60]
	add	r1, sp, #20
	mov	r0, r5
	str	r3, [sp]
	add	r3, sp, #8
	blx	r6
	mov	r6, r0
	add	r0, r5, #144
	bl	mutex_unlock
	cmp	r6, #0
	blt	.L109
	ldrh	r0, [sp, #8]
.L102:
	ldr	r2, [sp, #28]
	ldr	r3, [r4]
	cmp	r2, r3
	bne	.L110
	add	sp, sp, #32
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L108:
	movw	r0, #:lower16:.LANCHOR0
	movw	r1, #:lower16:.LC20
	ldr	r2, .L111
	movt	r0, #:upper16:.LANCHOR0
	movt	r1, #:upper16:.LC20
	ldr	r0, [r0]
	bl	dev_err
	mvn	r0, #21
	b	.L102
.L109:
	movw	r1, #:lower16:.LC22
	ldr	r2, .L111
	movt	r1, #:upper16:.LC22
	ldr	r0, [r5]
	bl	dev_err
	mov	r0, r6
	b	.L102
.L110:
	bl	__stack_chk_fail
.L112:
	.align	2
.L111:
	.word	.LANCHOR2+444
	.fnend
	.size	es705_read, .-es705_read
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_ap_put_tx1_ch_cnt, %function
es705_ap_put_tx1_ch_cnt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	movw	ip, #:lower16:.LANCHOR0
	movw	r0, #:lower16:.LC23
	str	lr, [sp, #4]
	ldr	r3, [r1, #72]
	movt	ip, #:upper16:.LANCHOR0
	movt	r0, #:upper16:.LC23
	ldr	r1, .L115
	add	r3, r3, #1
	mov	r2, r3
	str	r3, [ip, #1168]
	bl	printk
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, #0
	ldr	pc, [sp], #4
.L116:
	.align	2
.L115:
	.word	.LANCHOR2+456
	.fnend
	.size	es705_ap_put_tx1_ch_cnt, .-es705_ap_put_tx1_ch_cnt
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_forced_reroute_w, %function
es705_forced_reroute_w:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR0
	mov	r5, r1
	movt	r4, #:upper16:.LANCHOR0
	str	r6, [sp, #8]
	ldr	r3, [r4, #244]
	str	lr, [sp, #12]
	tst	r3, #1
	beq	.L118
	add	r0, r4, #244
	bl	cancel_delayed_work_sync
.L118:
	movw	r1, #:lower16:.LC24
	ldr	r2, .L123
	movt	r1, #:upper16:.LC24
	ldr	r0, [r4]
	bl	_dev_info
	mov	r0, #500
	bl	msecs_to_jiffies
	movw	r1, #:lower16:system_wq
	mov	r3, r0
	ldr	r2, .L123+4
	movt	r1, #:upper16:system_wq
	mov	r0, #4
	ldr	r1, [r1]
	bl	queue_delayed_work_on
	ldr	r2, [r5, #72]
	movw	r3, #:lower16:.LANCHOR1
	mov	r0, #0
	movt	r3, #:upper16:.LANCHOR1
	str	r2, [r3, #8]
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L124:
	.align	2
.L123:
	.word	.LANCHOR2+480
	.word	.LANCHOR0+244
	.fnend
	.size	es705_forced_reroute_w, .-es705_forced_reroute_w
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_codec_probe, %function
es705_codec_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r0, [r0, #12]
	bl	dev_get_drvdata
	mov	r5, r0
	movw	r2, #:lower16:.LC25
	ldr	r3, .L127
	movw	r0, #:lower16:.LC10
	ldr	r1, [r4, #12]
	movt	r2, #:upper16:.LC25
	movt	r0, #:upper16:.LC10
	bl	dev_printk
	str	r4, [r5, #4]
	ldr	r0, [r4, #12]
	bl	dev_get_drvdata
	mov	r3, #1
	str	r0, [r4, #108]
	mov	r0, #0
	str	r3, [r4, #180]
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L128:
	.align	2
.L127:
	.word	.LANCHOR2+504
	.fnend
	.size	es705_codec_probe, .-es705_codec_probe
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_codec_remove, %function
es705_codec_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r0
	mov	r4, #0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r0, [r0, #12]
	bl	dev_get_drvdata
	str	r4, [r5, #180]
	bl	kfree
	ldr	r6, [sp, #8]
	mov	r0, r4
	ldrd	r4, [sp]
	add	sp, sp, #12
	ldr	pc, [sp], #4
	.fnend
	.size	es705_codec_remove, .-es705_codec_remove
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_veq_adj_set, %function
es705_veq_adj_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #0
	movw	r1, #:lower16:.LC26
	strd	r6, [sp, #8]
	movw	r6, #:lower16:.LANCHOR0
	mov	r0, r2
	strd	r8, [sp, #16]
	movt	r1, #:upper16:.LC26
	movt	r6, #:upper16:.LANCHOR0
	strd	r10, [sp, #24]
	mov	fp, r3
	ldr	r10, [r6, #1412]
	str	lr, [sp, #32]
	.pad #20
	sub	sp, sp, #20
	ldr	r9, .L137
	add	ip, sp, #16
	ldr	r8, .L137+4
	movw	r7, #:lower16:.LC27
	movt	r7, #:upper16:.LC27
	str	r4, [ip, #-4]!
	mov	r2, ip
	bl	sscanf
	movw	r3, #:lower16:.LANCHOR1
	add	r2, r9, #24
	movt	r3, #:upper16:.LANCHOR1
	ldr	r3, [r3]
	cmp	r3, #1
	movne	r9, r2
	sub	r5, r9, #4
.L133:
	ldr	ip, [r5, #4]!
	mov	r3, r4
	mov	r2, r8
	add	r4, r4, #1
	mov	r1, r7
	ldr	r0, [r6]
	uxtb	ip, ip
	str	ip, [sp]
	bl	_dev_info
	cmp	r4, #6
	bne	.L133
	ldr	ip, [sp, #12]
	movw	r1, #:lower16:.LC28
	mov	r3, r10
	movt	r1, #:upper16:.LC28
	ldr	r0, [r6]
	uxth	r2, ip
	uxtb	ip, ip
	orr	r2, r2, #-1879048192
	orr	r2, r2, #1572864
	str	r2, [r9, r10, lsl #2]
	ldr	r2, .L137+4
	str	ip, [sp]
	bl	_dev_info
	mov	r0, fp
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L138:
	.align	2
.L137:
	.word	.LANCHOR0+1420
	.word	.LANCHOR2+524
	.fnend
	.size	es705_veq_adj_set, .-es705_veq_adj_set
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_veq_max_set, %function
es705_veq_max_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #0
	movw	r1, #:lower16:.LC26
	strd	r6, [sp, #8]
	movw	r6, #:lower16:.LANCHOR0
	mov	r0, r2
	strd	r8, [sp, #16]
	movt	r1, #:upper16:.LC26
	movt	r6, #:upper16:.LANCHOR0
	strd	r10, [sp, #24]
	mov	fp, r3
	ldr	r10, [r6, #1412]
	str	lr, [sp, #32]
	.pad #20
	sub	sp, sp, #20
	ldr	r9, .L145
	add	ip, sp, #16
	ldr	r8, .L145+4
	movw	r7, #:lower16:.LC29
	movt	r7, #:upper16:.LC29
	str	r4, [ip, #-4]!
	mov	r2, ip
	bl	sscanf
	movw	r3, #:lower16:.LANCHOR1
	add	r2, r9, #24
	movt	r3, #:upper16:.LANCHOR1
	ldr	r3, [r3]
	cmp	r3, #1
	movne	r9, r2
	sub	r5, r9, #4
.L141:
	ldr	ip, [r5, #4]!
	mov	r3, r4
	mov	r2, r8
	add	r4, r4, #1
	mov	r1, r7
	ldr	r0, [r6]
	uxtb	ip, ip
	str	ip, [sp]
	bl	_dev_info
	cmp	r4, #6
	bne	.L141
	ldr	ip, [sp, #12]
	movw	r1, #:lower16:.LC30
	mov	r3, r10
	movt	r1, #:upper16:.LC30
	ldr	r0, [r6]
	uxth	r2, ip
	uxtb	ip, ip
	orr	r2, r2, #-1879048192
	orr	r2, r2, #1572864
	str	r2, [r9, r10, lsl #2]
	ldr	r2, .L145+4
	str	ip, [sp]
	bl	_dev_info
	mov	r0, fp
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L146:
	.align	2
.L145:
	.word	.LANCHOR0+1468
	.word	.LANCHOR2+544
	.fnend
	.size	es705_veq_max_set, .-es705_veq_max_set
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_tuning_set, %function
es705_tuning_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	movw	r1, #:lower16:.LC26
	mov	r0, r2
	str	lr, [sp, #4]
	.pad #8
	sub	sp, sp, #8
	mov	lr, #0
	add	ip, sp, #8
	movt	r1, #:upper16:.LC26
	mov	r4, r3
	str	lr, [ip, #-4]!
	mov	r2, ip
	bl	sscanf
	movw	r0, #:lower16:.LC31
	ldr	r1, .L149
	ldr	r2, [sp, #4]
	movt	r0, #:upper16:.LC31
	bl	printk
	ldr	r1, [sp, #4]
	movw	r2, #:lower16:.LANCHOR0
	mov	r0, r4
	movt	r2, #:upper16:.LANCHOR0
	adds	r3, r1, #0
	movne	r3, #1
	str	r3, [r2, #1396]
	add	sp, sp, #8
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L150:
	.align	2
.L149:
	.word	.LANCHOR2+564
	.fnend
	.size	es705_tuning_set, .-es705_tuning_set
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_preset_delay_time_set, %function
es705_preset_delay_time_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR0
	mov	r0, r2
	movt	r4, #:upper16:.LANCHOR0
	mov	r1, #0
	str	r6, [sp, #8]
	add	r2, r4, #1504
	str	lr, [sp, #12]
	mov	r5, r3
	add	r2, r2, #12
	bl	kstrtoint
	movw	r1, #:lower16:.LC32
	ldr	r0, [r4]
	ldr	r3, [r4, #1516]
	movt	r1, #:upper16:.LC32
	ldr	r2, .L153
	bl	_dev_info
	ldr	r6, [sp, #8]
	mov	r0, r5
	ldrd	r4, [sp]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L154:
	.align	2
.L153:
	.word	.LANCHOR2+584
	.fnend
	.size	es705_preset_delay_time_set, .-es705_preset_delay_time_set
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_sleep_delay_set, %function
es705_sleep_delay_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR0
	mov	r0, r2
	movt	r4, #:upper16:.LANCHOR0
	mov	r1, #0
	str	r6, [sp, #8]
	add	r2, r4, #628
	str	lr, [sp, #12]
	mov	r5, r3
	bl	kstrtoint
	movw	r1, #:lower16:.LC33
	ldr	r0, [r4]
	ldr	r3, [r4, #628]
	movt	r1, #:upper16:.LC33
	ldr	r2, .L157
	bl	_dev_info
	ldr	r6, [sp, #8]
	mov	r0, r5
	ldrd	r4, [sp]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L158:
	.align	2
.L157:
	.word	.LANCHOR2+612
	.fnend
	.size	es705_sleep_delay_set, .-es705_sleep_delay_set
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_preset_delay_time_show, %function
es705_preset_delay_time_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	mov	r0, r2
	movt	r3, #:upper16:.LANCHOR0
	movw	r2, #:lower16:.LC34
	movt	r2, #:upper16:.LC34
	mov	r1, #4096
	ldr	r3, [r3, #1516]
	b	snprintf
	.fnend
	.size	es705_preset_delay_time_show, .-es705_preset_delay_time_show
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_sleep_delay_show, %function
es705_sleep_delay_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	mov	r0, r2
	movt	r3, #:upper16:.LANCHOR0
	movw	r2, #:lower16:.LC34
	movt	r2, #:upper16:.LC34
	mov	r1, #4096
	ldr	r3, [r3, #628]
	b	snprintf
	.fnend
	.size	es705_sleep_delay_show, .-es705_sleep_delay_show
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_ping_status_show, %function
es705_ping_status_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r3, #-2147483648
	movw	r4, #:lower16:.LANCHOR0
	str	r6, [sp, #8]
	movt	r4, #:upper16:.LANCHOR0
	mov	r6, r2
	str	lr, [sp, #12]
	.pad #16
	sub	sp, sp, #16
	mov	r0, r4
	add	r5, sp, #16
	mov	r2, #4
	str	r3, [r5, #-4]!
	ldr	r3, [r4, #56]
	mov	r1, r5
	blx	r3
	cmp	r0, #0
	blt	.L165
.L162:
	mov	r0, #20
	bl	msleep
	mov	r1, #4
	mov	r0, r5
	bl	__memzero
	movw	r0, #:lower16:.LANCHOR0
	ldr	r3, [r4, #52]
	mov	r1, r5
	movt	r0, #:upper16:.LANCHOR0
	mov	r2, #4
	blx	r3
	subs	r3, r0, #0
	blt	.L166
.L163:
	ldr	r1, [r4]
	movw	r2, #:lower16:.LC37
	movw	r0, #:lower16:.LC10
	ldr	r4, [sp, #12]
	movt	r2, #:upper16:.LC37
	movt	r0, #:upper16:.LC10
	ldr	r3, .L167
	str	r4, [sp]
	bl	dev_printk
	movw	r3, #:lower16:.LC38
	movw	r2, #:lower16:.LC39
	str	r4, [sp]
	mov	r0, r6
	movt	r3, #:upper16:.LC38
	movt	r2, #:upper16:.LC39
	mov	r1, #4096
	bl	snprintf
	mov	r0, #16
	add	sp, sp, #16
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L166:
	movw	r1, #:lower16:.LC36
	ldr	r2, .L167
	movt	r1, #:upper16:.LC36
	ldr	r0, [r4]
	bl	dev_err
	b	.L163
.L165:
	movw	r1, #:lower16:.LC35
	ldr	r2, .L167
	movt	r1, #:upper16:.LC35
	ldr	r0, [r4]
	bl	dev_err
	b	.L162
.L168:
	.align	2
.L167:
	.word	.LANCHOR2+636
	.fnend
	.size	es705_ping_status_show, .-es705_ping_status_show
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_vs_status_show, %function
es705_vs_status_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-20]!
	.save {r4, r5, r6, r7, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	strd	r6, [sp, #8]
	mov	r6, r2
	add	r5, r4, #144
	str	lr, [sp, #16]
	.pad #12
	sub	sp, sp, #12
	mov	r0, r5
	bl	mutex_lock
	ldr	r7, [r4, #604]
	mov	r3, #0
	mov	r0, r5
	str	r3, [r4, #604]
	bl	mutex_unlock
	movw	r3, #:lower16:.LC40
	movw	r2, #:lower16:.LC41
	str	r7, [sp]
	mov	r0, r6
	movt	r3, #:upper16:.LC40
	movt	r2, #:upper16:.LC41
	mov	r1, #4096
	bl	snprintf
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
	.fnend
	.size	es705_vs_status_show, .-es705_vs_status_show
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_rate_show, %function
es705_rate_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	mov	r5, r2
	movt	r4, #:upper16:.LANCHOR0
	str	lr, [sp, #8]
	.pad #12
	sub	sp, sp, #12
	movw	r2, #:lower16:.LC42
	movw	r0, #:lower16:.LC10
	ldr	r1, [r4]
	ldr	ip, [r4, #1152]
	movt	r2, #:upper16:.LC42
	movt	r0, #:upper16:.LC10
	ldr	r3, .L173
	str	ip, [sp]
	bl	dev_printk
	ldr	r3, [r4, #1152]
	movw	r2, #:lower16:.LC43
	mov	r0, r5
	movt	r2, #:upper16:.LC43
	mov	r1, #4096
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldr	lr, [sp, #8]
	add	sp, sp, #12
	b	snprintf
.L174:
	.align	2
.L173:
	.word	.LANCHOR2+660
	.fnend
	.size	es705_rate_show, .-es705_rate_show
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_route_show, %function
es705_route_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	mov	r5, r2
	movt	r4, #:upper16:.LANCHOR0
	str	lr, [sp, #8]
	.pad #12
	sub	sp, sp, #12
	movw	r2, #:lower16:.LC44
	movw	r0, #:lower16:.LC10
	ldr	r1, [r4]
	ldr	ip, [r4, #1148]
	movt	r2, #:upper16:.LC44
	movt	r0, #:upper16:.LC10
	ldr	r3, .L177
	str	ip, [sp]
	bl	dev_printk
	ldr	r3, [r4, #1148]
	movw	r2, #:lower16:.LC45
	mov	r0, r5
	movt	r2, #:upper16:.LC45
	mov	r1, #4096
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldr	lr, [sp, #8]
	add	sp, sp, #12
	b	snprintf
.L178:
	.align	2
.L177:
	.word	.LANCHOR2+676
	.fnend
	.size	es705_route_show, .-es705_route_show
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_keyword_net_path_set, %function
es705_keyword_net_path_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 208
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:__stack_chk_guard
	mov	r5, r2
	movt	r4, #:upper16:__stack_chk_guard
	str	r6, [sp, #8]
	mov	r2, #100
	ldr	ip, [r4]
	str	lr, [sp, #12]
	.pad #216
	sub	sp, sp, #216
	mov	r1, #0
	add	r0, sp, #112
	mov	r6, r3
	str	ip, [sp, #212]
	bl	memset
	mov	r0, r5
	bl	strlen
	cmp	r0, #100
	bls	.L180
	movw	r3, #:lower16:.LANCHOR0
	movw	r1, #:lower16:.LC46
	ldr	r2, .L188
	movt	r3, #:upper16:.LANCHOR0
	movt	r1, #:upper16:.LC46
	ldr	r0, [r3]
	bl	dev_err
.L179:
	ldr	r2, [sp, #212]
	mov	r0, r6
	ldr	r3, [r4]
	cmp	r2, r3
	bne	.L187
	add	sp, sp, #216
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L180:
	movw	r1, #:lower16:.LC47
	add	r2, sp, #12
	movt	r1, #:upper16:.LC47
	mov	r0, r5
	bl	sscanf
	movw	r0, #:lower16:.LC48
	add	r2, sp, #12
	ldr	r1, .L188
	movt	r0, #:upper16:.LC48
	bl	printk
	add	r0, sp, #12
	mov	r1, #47
	bl	strrchr
	cmp	r0, #0
	beq	.L182
	add	r5, r0, #1
	mov	r0, r5
	bl	strlen
	mov	r2, r0
	mov	r1, r5
	add	r0, sp, #112
	bl	memcpy
.L183:
	movw	r0, #:lower16:.LC50
	movw	r5, #:lower16:.LANCHOR0
	ldr	r1, .L188
	add	r2, sp, #112
	movt	r5, #:upper16:.LANCHOR0
	movt	r0, #:upper16:.LC50
	bl	printk
	mov	r0, r5
	add	r1, sp, #112
	ldr	r2, [r0], #20
	bl	request_firmware
	cmp	r0, #0
	moveq	r3, #1
	streq	r3, [r5, #1404]
	beq	.L179
	movw	r1, #:lower16:.LC51
	add	r3, sp, #112
	ldr	r2, .L188
	movt	r1, #:upper16:.LC51
	str	r0, [sp]
	ldr	r0, [r5]
	bl	dev_err
	b	.L179
.L187:
	bl	__stack_chk_fail
.L182:
	movw	r0, #:lower16:.LC49
	ldr	r1, .L188
	movt	r0, #:upper16:.LC49
	bl	printk
	add	r0, sp, #12
	bl	strlen
	mov	r2, r0
	add	r1, sp, #12
	add	r0, sp, #112
	bl	memcpy
	b	.L183
.L189:
	.align	2
.L188:
	.word	.LANCHOR2+696
	.fnend
	.size	es705_keyword_net_path_set, .-es705_keyword_net_path_set
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_keyword_grammar_path_set, %function
es705_keyword_grammar_path_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 208
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:__stack_chk_guard
	mov	r5, r2
	movt	r4, #:upper16:__stack_chk_guard
	str	r6, [sp, #8]
	mov	r2, #100
	ldr	ip, [r4]
	str	lr, [sp, #12]
	.pad #216
	sub	sp, sp, #216
	mov	r1, #0
	add	r0, sp, #112
	mov	r6, r3
	str	ip, [sp, #212]
	bl	memset
	mov	r0, r5
	bl	strlen
	cmp	r0, #100
	bls	.L191
	movw	r3, #:lower16:.LANCHOR0
	movw	r1, #:lower16:.LC46
	ldr	r2, .L199
	movt	r3, #:upper16:.LANCHOR0
	movt	r1, #:upper16:.LC46
	ldr	r0, [r3]
	bl	dev_err
.L190:
	ldr	r2, [sp, #212]
	mov	r0, r6
	ldr	r3, [r4]
	cmp	r2, r3
	bne	.L198
	add	sp, sp, #216
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L191:
	movw	r1, #:lower16:.LC47
	add	r2, sp, #12
	movt	r1, #:upper16:.LC47
	mov	r0, r5
	bl	sscanf
	movw	r0, #:lower16:.LC52
	add	r2, sp, #12
	ldr	r1, .L199
	movt	r0, #:upper16:.LC52
	bl	printk
	add	r0, sp, #12
	mov	r1, #47
	bl	strrchr
	cmp	r0, #0
	beq	.L193
	add	r5, r0, #1
	mov	r0, r5
	bl	strlen
	mov	r2, r0
	mov	r1, r5
	add	r0, sp, #112
	bl	memcpy
.L194:
	movw	r0, #:lower16:.LC53
	movw	r5, #:lower16:.LANCHOR0
	ldr	r1, .L199
	add	r2, sp, #112
	movt	r5, #:upper16:.LANCHOR0
	movt	r0, #:upper16:.LC53
	bl	printk
	mov	r0, r5
	add	r1, sp, #112
	ldr	r2, [r0], #16
	bl	request_firmware
	cmp	r0, #0
	moveq	r3, #1
	streq	r3, [r5, #1400]
	beq	.L190
	movw	r1, #:lower16:.LC51
	add	r3, sp, #112
	ldr	r2, .L199
	movt	r1, #:upper16:.LC51
	str	r0, [sp]
	ldr	r0, [r5]
	bl	dev_err
	b	.L190
.L198:
	bl	__stack_chk_fail
.L193:
	movw	r0, #:lower16:.LC49
	ldr	r1, .L199
	movt	r0, #:upper16:.LC49
	bl	printk
	add	r0, sp, #12
	bl	strlen
	mov	r2, r0
	add	r1, sp, #12
	add	r0, sp, #112
	bl	memcpy
	b	.L194
.L200:
	.align	2
.L199:
	.word	.LANCHOR2+724
	.fnend
	.size	es705_keyword_grammar_path_set, .-es705_keyword_grammar_path_set
	.section	.init.text,"ax",%progbits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_init, %function
es705_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r0, #:lower16:.LANCHOR0
	push	{r4, lr}
	.save {r4, lr}
	movt	r0, #:upper16:.LANCHOR0
	bl	es705_bus_init
	subs	r4, r0, #0
	beq	.L202
	movw	r0, #:lower16:.LC54
	mov	r1, r4
	movt	r0, #:upper16:.LC54
	bl	printk
	b	.L201
.L202:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	es705_init_cdev
	subs	r4, r0, #0
	beq	.L201
	movw	r0, #:lower16:.LC55
	mov	r1, r4
	movt	r0, #:upper16:.LC55
	bl	printk
.L203:
.L201:
	mov	r0, r4
	pop	{r4, pc}
	.fnend
	.size	es705_init, .-es705_init
	.section	.exit.text,"ax",%progbits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_exit, %function
es705_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	mov	r0, r4
	bl	es705_unregister_input_device
	ldr	r3, [r4, #600]
	cmp	r3, #0
	beq	.L209
	ldr	r0, [r4, #8]
	bl	release_firmware
	ldr	r0, [r4, #12]
	bl	release_firmware
.L209:
	movw	r0, #:lower16:.LANCHOR0
	pop	{r4, lr}
	movt	r0, #:upper16:.LANCHOR0
	b	es705_cleanup_cdev
	.fnend
	.size	es705_exit, .-es705_exit
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_vs_keyword_parameters_set, %function
es705_vs_keyword_parameters_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #512
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	mov	r4, r3
	str	lr, [sp, #8]
	mov	r5, r0
	.pad #12
	sub	sp, sp, #12
	bhi	.L215
	mov	r1, r2
	ldr	r0, .L218
	mov	r2, r3
	bl	memcpy
	ldr	ip, .L218+4
	movw	r2, #:lower16:.LC56
	movw	r0, #:lower16:.LC10
	mov	r1, r5
	movt	r2, #:upper16:.LC56
	ldr	r3, .L218+8
	movt	r0, #:upper16:.LC10
	str	r4, [sp]
	strh	r4, [ip]	@ movhi
	bl	dev_printk
	mov	r0, r4
.L214:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L215:
	movw	r2, #:lower16:.LC57
	movw	r0, #:lower16:.LC10
	ldr	r3, .L218+8
	mov	r1, r5
	movt	r2, #:upper16:.LC57
	str	r4, [sp]
	movt	r0, #:upper16:.LC10
	bl	dev_printk
	mvn	r0, #11
	b	.L214
.L219:
	.align	2
.L218:
	.word	.LANCHOR0+634
	.word	.LANCHOR0+632
	.word	.LANCHOR2+756
	.fnend
	.size	es705_vs_keyword_parameters_set, .-es705_vs_keyword_parameters_set
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_vs_keyword_parameters_show, %function
es705_vs_keyword_parameters_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	ldr	r4, .L225
	mov	r5, r0
	str	lr, [sp, #8]
	.pad #12
	sub	sp, sp, #12
	ldrh	ip, [r4]
	cmp	ip, #0
	bne	.L224
	movw	r2, #:lower16:.LC59
	movw	r0, #:lower16:.LC10
	ldr	r3, .L225+4
	mov	r1, r5
	movt	r2, #:upper16:.LC59
	movt	r0, #:upper16:.LC10
	mov	r4, ip
	bl	dev_printk
.L220:
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L224:
	add	r1, r4, #2
	mov	r0, r2
	mov	r2, ip
	bl	memcpy
	ldrh	r4, [r4]
	movw	r2, #:lower16:.LC58
	movw	r0, #:lower16:.LC10
	mov	r1, r5
	movt	r2, #:upper16:.LC58
	ldr	r3, .L225+4
	movt	r0, #:upper16:.LC10
	str	r4, [sp]
	bl	dev_printk
	b	.L220
.L226:
	.align	2
.L225:
	.word	.LANCHOR0+632
	.word	.LANCHOR2+788
	.fnend
	.size	es705_vs_keyword_parameters_show, .-es705_vs_keyword_parameters_show
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_power_state_enum, %function
es705_put_power_state_enum:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_put_power_state_enum, .-es705_put_power_state_enum
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_veq_filter_set, %function
es705_veq_filter_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r1, #:lower16:.LC26
	movw	r5, #:lower16:.LANCHOR0
	strd	r6, [sp, #8]
	mov	r0, r2
	movt	r5, #:upper16:.LANCHOR0
	strd	r8, [sp, #16]
	movt	r1, #:upper16:.LC26
	mov	r9, r3
	strd	r10, [sp, #24]
	ldr	r7, [r5, #1412]
	str	lr, [sp, #32]
	.pad #44
	sub	sp, sp, #44
	mov	lr, #0
	add	ip, sp, #40
	str	lr, [ip, #-12]!
	mov	r2, ip
	bl	sscanf
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L247
	ldr	r3, .L251
	rsb	r4, r7, r7, lsl #5
	mov	r8, #62
	mov	r6, r8
	add	r4, r3, r4, lsl #1
	ldr	r3, [sp, #28]
	cmp	r3, #1
	beq	.L248
.L231:
	cmp	r3, #2
	ldr	r0, [r5]
	beq	.L249
	movw	r1, #:lower16:.LC67
	ldr	r2, .L251+4
	movt	r1, #:upper16:.LC67
	bl	dev_err
.L236:
	mov	r0, r9
	add	sp, sp, #44
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L247:
	mov	r4, #74
	add	r3, r5, #1520
	mov	r8, r4
	mla	r4, r4, r7, r3
	ldr	r3, [sp, #28]
	mov	r6, r8
	cmp	r3, #1
	bne	.L231
.L248:
	mov	r3, #57344
	mov	r2, sp
	movt	r3, 65535
	mov	fp, #0
	mov	r1, r3
	movw	r3, #:lower16:.LC60
	movt	r3, #:upper16:.LC60
	str	r1, [sp, #8]
	and	r1, r2, r1
	mov	r0, r3
	ldr	r2, [r1, #8]
	str	r3, [sp, #16]
	str	fp, [r1, #8]
	mov	r1, fp
	mov	r10, r2
	mov	r2, fp
	str	r10, [sp, #20]
	bl	filp_open
	ldr	r3, [sp, #8]
	mov	ip, sp
	cmn	r0, #4096
	str	r0, [sp, #12]
	and	r2, ip, r3
	ldr	r3, [sp, #16]
	str	r10, [r2, #8]
	bhi	.L250
	cmp	r0, #0
	beq	.L233
	add	r3, sp, #40
	str	fp, [r2, #8]
	mov	r10, #0
	mov	fp, #0
	mov	r1, r4
	mov	r2, r8
	strd	r10, [r3, #-8]!
	bl	vfs_read
	ldr	r10, [sp, #8]
	mov	r3, sp
	cmp	r6, r0
	and	r10, r10, r3
	ldr	r3, [sp, #20]
	str	r3, [r10, #8]
	ble	.L234
	movw	r1, #:lower16:.LC62
	ldr	r2, .L251+4
	movt	r1, #:upper16:.LC62
	ldr	r0, [r5]
	bl	dev_err
.L235:
	mov	r1, #0
	ldr	r0, [sp, #12]
	bl	filp_close
	b	.L236
.L249:
	movw	r1, #:lower16:.LC66
	movw	r8, #:lower16:.LC65
	ldr	r2, .L251+4
	mov	r3, r7
	movt	r1, #:upper16:.LC66
	add	r6, r4, r6
	movt	r8, #:upper16:.LC65
	bl	_dev_info
.L239:
	ldrb	r2, [r4], #1	@ zero_extendqisi2
	mov	r1, r8
	ldr	r0, [r5]
	bl	_dev_info
	cmp	r4, r6
	bne	.L239
	b	.L236
.L234:
	ldr	ip, [r5]
	movw	r1, #:lower16:.LC63
	mov	r3, r7
	movt	r1, #:upper16:.LC63
	ldr	r2, .L251+4
	str	r0, [sp]
	mov	r0, ip
	bl	_dev_info
	b	.L235
.L250:
	movw	r1, #:lower16:.LC61
	str	r3, [sp]
	ldr	r2, .L251+8
	movt	r1, #:upper16:.LC61
	ldr	r0, [r5]
	ldr	r3, [sp, #12]
	bl	dev_err
.L233:
	movw	r1, #:lower16:.LC64
	movw	r6, #:lower16:.LC65
	ldr	r2, .L251+4
	mov	r3, r7
	movt	r1, #:upper16:.LC64
	ldr	r0, [r5]
	movt	r6, #:upper16:.LC65
	add	r7, r4, #10
	bl	_dev_info
.L237:
	ldrb	r2, [r4], #1	@ zero_extendqisi2
	mov	r1, r6
	ldr	r0, [r5]
	bl	_dev_info
	cmp	r4, r7
	bne	.L237
	b	.L236
.L252:
	.align	2
.L251:
	.word	.LANCHOR0+1964
	.word	.LANCHOR2+836
	.word	.LANCHOR2+824
	.fnend
	.size	es705_veq_filter_set, .-es705_veq_filter_set
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_write.constprop.30, %function
es705_write.constprop.30:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L261
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r5, #:lower16:__stack_chk_guard
	strd	r6, [sp, #8]
	movw	r6, #:lower16:.LANCHOR0
	movt	r5, #:upper16:__stack_chk_guard
	movt	r6, #:upper16:.LANCHOR0
	strd	r8, [sp, #16]
	movw	r1, #:lower16:.LC21
	str	r10, [sp, #24]
	ldr	r8, [r6]
	mvn	r10, #0
	ldr	r4, [ip, #1588]
	str	lr, [sp, #28]
	.pad #40
	sub	sp, sp, #40
	ldr	r3, [ip, #1596]
	mov	r7, r0
	mov	r9, #0
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r3, r3
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r3, r3, #32
	ldr	lr, [r5]
	movt	r1, #:upper16:.LC21
	mvn	r10, r10, lsl r3
	ldr	r2, .L261+4
	mov	r3, #177
	stm	sp, {r0, r4, r10}
	mov	r0, r8
	mov	r8, #0
	strd	r8, [sp, #20]
	str	lr, [sp, #36]
	bl	_dev_info
	add	r0, sp, #20
	mov	r2, r4
	ldr	r1, .L261+8
	bl	memcpy
	cmp	r4, #4
	beq	.L255
	cmp	r4, #8
	beq	.L259
.L254:
	mov	r2, r4
	add	r1, sp, #20
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L261+12
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	mov	r2, r4
	ldr	r3, [r6, #56]
	add	r1, sp, #28
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	mov	r4, r0
	ldr	r0, .L261+12
	bl	mutex_unlock
	ldr	r2, [sp, #36]
	mov	r0, r4
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L260
	add	sp, sp, #40
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L259:
	ldr	r2, [sp, #24]
	and	r7, r7, r10
	orr	r7, r2, r7
	str	r7, [sp, #24]
	b	.L254
.L255:
	ldr	r3, [sp, #20]
	and	r7, r7, r10
	orr	r7, r3, r7
	str	r7, [sp, #20]
	b	.L254
.L260:
	bl	__stack_chk_fail
.L262:
	.align	2
.L261:
	.word	es705_api_access+4096
	.word	.LANCHOR2+432
	.word	es705_api_access+5676
	.word	.LANCHOR0+144
	.fnend
	.size	es705_write.constprop.30, .-es705_write.constprop.30
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_bwe_value, %function
es705_put_bwe_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r2, #:lower16:.LC68
	str	lr, [sp, #8]
	ldr	r5, [r1, #72]
	.pad #12
	sub	sp, sp, #12
	movt	r4, #:upper16:.LANCHOR0
	movw	r0, #:lower16:.LC10
	ldr	r3, .L274
	movt	r2, #:upper16:.LC68
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	str	r5, [sp]
	bl	dev_printk
	ldr	r3, [r4, #584]
	cmp	r3, #3
	bne	.L271
	ldr	r3, [r4, #1408]
	cmp	r3, r5
	beq	.L272
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L273
	cmp	r5, #0
	movwne	r0, #622
	movweq	r0, #623
	bl	es705_write.constprop.30
	str	r5, [r4, #1408]
.L263:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L271:
	movw	r1, #:lower16:.LC69
	ldr	r2, .L274
	movt	r1, #:upper16:.LC69
	ldr	r0, [r4]
	bl	_dev_info
	mov	r0, #0
	b	.L263
.L272:
	movw	r1, #:lower16:.LC70
	ldr	r2, .L274
	movt	r1, #:upper16:.LC70
	ldr	r0, [r4]
	bl	_dev_info
	mov	r0, #0
	b	.L263
.L273:
	movw	r2, #:lower16:.LC71
	movw	r0, #:lower16:.LC10
	ldr	r3, .L274
	movt	r2, #:upper16:.LC71
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	bl	dev_printk
	mov	r0, #0
	b	.L263
.L275:
	.align	2
.L274:
	.word	.LANCHOR2+860
	.fnend
	.size	es705_put_bwe_value, .-es705_put_bwe_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_aud_zoom, %function
es705_put_aud_zoom:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	movw	r5, #:lower16:.LANCHOR0
	movw	r2, #:lower16:.LC12
	str	lr, [sp, #8]
	ldr	r4, [r1, #72]
	.pad #12
	sub	sp, sp, #12
	movt	r5, #:upper16:.LANCHOR0
	movw	r0, #:lower16:.LC10
	ldr	r3, .L285
	movt	r2, #:upper16:.LC12
	movt	r0, #:upper16:.LC10
	ldr	r1, [r5]
	str	r4, [sp]
	bl	dev_printk
	cmp	r4, #1
	str	r4, [r5, #592]
	beq	.L282
	cmp	r4, #2
	beq	.L283
	cmp	r4, #3
	movne	r0, #0
	beq	.L284
.L281:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldr	lr, [sp, #8]
	add	sp, sp, #12
	b	es705_write.constprop.30
.L284:
	movw	r0, #1355
	bl	es705_write.constprop.30
	movw	r0, #758
	b	.L281
.L282:
	movw	r0, #1355
	bl	es705_write.constprop.30
	mov	r0, #756
	b	.L281
.L283:
	movw	r0, #1355
	bl	es705_write.constprop.30
	movw	r0, #757
	b	.L281
.L286:
	.align	2
.L285:
	.word	.LANCHOR2+880
	.fnend
	.size	es705_put_aud_zoom, .-es705_put_aud_zoom
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_veq_preset_value, %function
es705_put_veq_preset_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r2, #:lower16:.LC72
	str	lr, [sp, #8]
	ldr	r5, [r1, #72]
	.pad #12
	sub	sp, sp, #12
	movt	r4, #:upper16:.LANCHOR0
	movw	r0, #:lower16:.LC10
	ldr	r3, .L296
	movt	r2, #:upper16:.LC72
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	str	r5, [sp]
	bl	dev_printk
	ldr	r3, [r4, #584]
	cmp	r3, #3
	bne	.L294
	ldr	r3, [r4, #1416]
	cmp	r3, r5
	beq	.L295
	cmp	r5, #0
	movne	r0, #105
	moveq	r0, #106
	bl	es705_write.constprop.30
	str	r5, [r4, #1416]
.L287:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L294:
	movw	r1, #:lower16:.LC69
	ldr	r2, .L296
	movt	r1, #:upper16:.LC69
	ldr	r0, [r4]
	bl	_dev_info
	mov	r0, #0
	b	.L287
.L295:
	movw	r1, #:lower16:.LC70
	ldr	r2, .L296
	movt	r1, #:upper16:.LC70
	ldr	r0, [r4]
	bl	_dev_info
	mov	r0, #0
	b	.L287
.L297:
	.align	2
.L296:
	.word	.LANCHOR2+900
	.fnend
	.size	es705_put_veq_preset_value, .-es705_put_veq_preset_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_write.constprop.31, %function
es705_write.constprop.31:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r3, r0
	movw	r0, #258
	strd	r6, [sp, #8]
	movw	r6, #:lower16:__stack_chk_guard
	cmp	r3, r0
	movt	r6, #:upper16:__stack_chk_guard
	strd	r8, [sp, #16]
	mov	r4, #0
	ldr	r2, [r6]
	str	r10, [sp, #24]
	mov	r5, #0
	str	lr, [sp, #28]
	movw	r7, #:lower16:.LANCHOR0
	.pad #40
	sub	sp, sp, #40
	movt	r7, #:upper16:.LANCHOR0
	ldr	r0, [r7]
	strd	r4, [sp, #20]
	str	r2, [sp, #36]
	bhi	.L306
	lsl	r8, r3, #5
	movw	r9, #:lower16:es705_api_access
	ldr	r2, .L309
	mov	r10, r1
	movt	r9, #:upper16:es705_api_access
	mvn	ip, #0
	add	r1, r9, r8
	str	r10, [sp]
	ldr	r5, [r1, #20]
	ldr	r4, [r1, #28]
	movw	r1, #:lower16:.LC21
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r4, r4
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r4, r4, #32
	movt	r1, #:upper16:.LC21
	mvn	r4, ip, lsl r4
	str	r5, [sp, #4]
	str	r4, [sp, #8]
	bl	_dev_info
	add	r1, r8, #12
	mov	r2, r5
	add	r1, r9, r1
	add	r0, sp, #20
	bl	memcpy
	cmp	r5, #4
	beq	.L302
	cmp	r5, #8
	beq	.L307
.L301:
	add	r1, sp, #20
	mov	r2, r5
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L309+4
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	add	r1, sp, #28
	ldr	r3, [r7, #56]
	mov	r2, r5
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	mov	r4, r0
	ldr	r0, .L309+4
	bl	mutex_unlock
.L298:
	ldr	r2, [sp, #36]
	mov	r0, r4
	ldr	r3, [r6]
	cmp	r2, r3
	bne	.L308
	add	sp, sp, #40
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L307:
	ldr	r3, [sp, #24]
	and	r4, r4, r10
	orr	r4, r3, r4
	str	r4, [sp, #24]
	b	.L301
.L302:
	ldr	r3, [sp, #20]
	and	r4, r4, r10
	orr	r4, r3, r4
	str	r4, [sp, #20]
	b	.L301
.L306:
	movw	r1, #:lower16:.LC20
	ldr	r2, .L309
	mvn	r4, #21
	movt	r1, #:upper16:.LC20
	bl	dev_err
	b	.L298
.L308:
	bl	__stack_chk_fail
.L310:
	.align	2
.L309:
	.word	.LANCHOR2+432
	.word	.LANCHOR0+144
	.fnend
	.size	es705_write.constprop.31, .-es705_write.constprop.31
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_power_state_enum, %function
es705_get_power_state_enum:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_get_power_state_enum, .-es705_get_power_state_enum
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_vs_make_external_dump, %function
es705_get_vs_make_external_dump:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_get_vs_make_external_dump, .-es705_get_vs_make_external_dump
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_sw_value, %function
es705_get_sw_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_get_sw_value, .-es705_get_sw_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_sts_value, %function
es705_get_sts_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_get_sts_value, .-es705_get_sts_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_rx_ns_value, %function
es705_get_rx_ns_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_get_rx_ns_value, .-es705_get_rx_ns_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_wnf_value, %function
es705_get_wnf_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_get_wnf_value, .-es705_get_wnf_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_bwe_value, %function
es705_get_bwe_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_get_bwe_value, .-es705_get_bwe_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_avalon_value, %function
es705_get_avalon_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_get_avalon_value, .-es705_get_avalon_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_vbb_value, %function
es705_get_vbb_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_get_vbb_value, .-es705_get_vbb_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_audio_custom_profile, %function
es705_get_audio_custom_profile:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.fnend
	.size	es705_get_audio_custom_profile, .-es705_get_audio_custom_profile
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_internal_route, %function
es705_get_internal_route:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	mov	r0, #0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r3, [r3, #1148]
	str	r3, [r1, #72]
	bx	lr
	.fnend
	.size	es705_get_internal_route, .-es705_get_internal_route
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_switch_to_normal_mode.constprop.23, %function
es705_switch_to_normal_mode.constprop.23:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	mov	r3, #-2147483648
	movw	r4, #:lower16:.LANCHOR0
	str	lr, [sp, #8]
	.pad #28
	sub	sp, sp, #28
	movt	r4, #:upper16:.LANCHOR0
	mov	r1, #4
	mov	r2, #268435456
	ldr	r5, [r4, #116]
	movt	r1, 36880
	str	r3, [sp, #12]
	mov	r0, r4
	str	r3, [sp, #16]
	add	r3, sp, #20
	blx	r5
	mov	r0, #20
	bl	msleep
	mov	r2, #3
	mov	ip, #1
	ldr	r5, [r4, #60]
	mov	r0, r4
	add	r3, sp, #16
	str	r2, [r4, #584]
	add	r1, sp, #12
	mov	r2, #4
	str	ip, [sp]
	blx	r5
	cmp	r0, #0
	beq	.L322
	movw	r1, #:lower16:.LC73
	ldr	r2, .L328
	movt	r1, #:upper16:.LC73
	ldr	r0, [r4]
	bl	dev_err
.L322:
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L329:
	.align	2
.L328:
	.word	.LANCHOR2+928
	.fnend
	.size	es705_switch_to_normal_mode.constprop.23, .-es705_switch_to_normal_mode.constprop.23
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_switch_to_vs_mode.constprop.22, %function
es705_switch_to_vs_mode.constprop.22:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:.LANCHOR1
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	movt	r3, #:upper16:.LANCHOR1
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r3, [r3, #4]
	.pad #8
	sub	sp, sp, #8
	cmp	r3, #0
	bne	.L331
	movw	r4, #:lower16:.LANCHOR0
	mov	r1, #5
	movt	r4, #:upper16:.LANCHOR0
	movt	r1, 36880
	ldr	r5, [r4, #116]
	mov	r0, r4
	add	r3, sp, #4
	mov	r2, #268435456
	blx	r5
	subs	r5, r0, #0
	blt	.L353
	mov	r0, #20
	bl	msleep
	movw	r2, #:lower16:.LC75
	movw	r0, #:lower16:.LC10
	ldr	r3, .L359
	movt	r2, #:upper16:.LC75
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	bl	dev_printk
	ldr	r3, [r4, #12]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L354
	mov	r0, #50
	bl	msleep
	mov	r3, #5
	add	r0, r4, #560
	str	r3, [r4, #1172]
	bl	mutex_lock
	movw	r1, #:lower16:.LC76
	mov	r3, #2
	ldr	r2, .L359+4
	movt	r1, #:upper16:.LC76
	ldr	r0, [r4]
	bl	_dev_info
	add	r0, r4, #144
	bl	mutex_lock
	movw	r3, #:lower16:system_rev
	movt	r3, #:upper16:system_rev
	ldr	r3, [r3]
	cmp	r3, #5
	bls	.L355
.L335:
	ldr	r3, [r4, #76]
	cmp	r3, #0
	beq	.L336
	movw	r0, #:lower16:.LANCHOR0
	mov	r1, #2
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	cmp	r0, #0
	blt	.L336
	mov	r3, #2
	ldr	r0, .L359+8
	str	r3, [r4, #596]
	bl	mutex_unlock
	ldr	r0, .L359+12
	bl	mutex_unlock
.L337:
	mov	r0, #50
	bl	msleep
	mov	r1, #4
	mov	r0, #244
	bl	es705_write.constprop.31
	subs	r5, r0, #0
	beq	.L330
	movw	r1, #:lower16:.LC83
	ldr	r2, .L359+16
	movt	r1, #:upper16:.LC83
	ldr	r0, [r4]
	bl	dev_err
	b	.L330
.L331:
	movw	r3, #:lower16:.LANCHOR0
	mov	ip, #4
	ldr	r2, .L359
	movt	r3, #:upper16:.LANCHOR0
	movw	r1, #:lower16:.LC84
	movt	r1, #:upper16:.LC84
	ldr	r0, [r3]
	mov	r5, #0
	str	ip, [r3, #1172]
	bl	_dev_info
.L330:
	mov	r0, r5
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L353:
	movw	r1, #:lower16:.LC74
	ldr	r2, .L359
	movt	r1, #:upper16:.LC74
	ldr	r0, [r4]
	bl	dev_err
	b	.L330
.L355:
	ldr	r3, [r4, #620]
	cmp	r3, #0
	bne	.L335
.L336:
	movw	r0, #:lower16:.LANCHOR0
	ldr	r3, [r4, #68]
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	subs	r5, r0, #0
	bne	.L356
	movw	r1, #:lower16:.LC78
	ldr	r2, .L359+4
	movt	r1, #:upper16:.LC78
	ldr	r0, [r4]
	bl	_dev_info
	ldr	r3, [r4, #12]
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	ldr	r5, [r4, #56]
	ldr	r2, [r3]
	ldr	r1, [r3, #4]
	blx	r5
	cmp	r0, #0
	bne	.L357
	mov	r6, #2
	movw	r0, #:lower16:.LANCHOR0
	ldr	r3, [r4, #72]
	movt	r0, #:upper16:.LANCHOR0
	str	r6, [r4, #596]
	blx	r3
	subs	r5, r0, #0
	bne	.L358
	movw	r1, #:lower16:.LC81
	mov	r3, r6
	ldr	r2, .L359+4
	movt	r1, #:upper16:.LC81
	ldr	r0, [r4]
	bl	_dev_info
	ldr	r0, .L359+8
	bl	mutex_unlock
	ldr	r0, .L359+12
	bl	mutex_unlock
	b	.L337
.L356:
	movw	r1, #:lower16:.LC77
	ldr	r2, .L359+4
	movt	r1, #:upper16:.LC77
	ldr	r0, [r4]
	bl	dev_err
.L339:
	ldr	r0, .L359+8
	bl	mutex_unlock
	ldr	r0, .L359+12
	bl	mutex_unlock
	cmp	r5, #0
	bge	.L337
.L341:
	movw	r1, #:lower16:.LC82
	ldr	r2, .L359+16
	movt	r1, #:upper16:.LC82
	ldr	r0, [r4]
	bl	dev_err
	b	.L330
.L354:
	.syntax divided
@ 1659 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 1659, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L358:
	movw	r1, #:lower16:.LC80
	ldr	r2, .L359+4
	movt	r1, #:upper16:.LC80
	ldr	r0, [r4]
	bl	dev_err
	b	.L339
.L357:
	movw	r1, #:lower16:.LC79
	ldr	r2, .L359+4
	mvn	r5, #4
	movt	r1, #:upper16:.LC79
	ldr	r0, [r4]
	bl	dev_err
	ldr	r0, .L359+8
	bl	mutex_unlock
	ldr	r0, .L359+12
	bl	mutex_unlock
	b	.L341
.L360:
	.align	2
.L359:
	.word	.LANCHOR2+956
	.word	.LANCHOR2+980
	.word	.LANCHOR0+144
	.word	.LANCHOR0+560
	.word	.LANCHOR2+1000
	.fnend
	.size	es705_switch_to_vs_mode.constprop.22, .-es705_switch_to_vs_mode.constprop.22
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_route_status_show, %function
es705_route_status_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L368
	strd	r4, [sp, #-28]!
	.save {r4, r5, r6, r7, r8, r9, lr}
	movw	r5, #:lower16:__stack_chk_guard
	strd	r6, [sp, #8]
	movt	r5, #:upper16:__stack_chk_guard
	mov	r7, r2
	strd	r8, [sp, #16]
	ldr	r3, [r5]
	mov	r8, #0
	str	lr, [sp, #24]
	mov	r9, #0
	.pad #36
	sub	sp, sp, #36
	ldr	r6, [r1, #1736]
	add	r0, sp, #12
	add	r1, r1, #1728
	movw	r4, #:lower16:.LANCHOR0
	strd	r8, [sp, #12]
	str	r3, [sp, #28]
	movt	r4, #:upper16:.LANCHOR0
	mov	r2, r6
	bl	memcpy
	add	r1, sp, #12
	mov	r2, r6
	add	r0, sp, #20
	bl	memcpy
	add	r0, r4, #144
	bl	mutex_lock
	mov	r3, #0
	mov	r2, r6
	ldr	r6, [r4, #60]
	add	r1, sp, #20
	mov	r0, r4
	str	r3, [sp]
	add	r3, sp, #8
	blx	r6
	mov	r6, r0
	add	r0, r4, #144
	bl	mutex_unlock
	cmp	r6, #0
	blt	.L366
	ldrh	r6, [sp, #8]
.L363:
	movw	r3, #:lower16:.LC85
	movw	r2, #:lower16:.LC41
	str	r6, [sp]
	movt	r3, #:upper16:.LC85
	movt	r2, #:upper16:.LC41
	mov	r0, r7
	mov	r1, #4096
	bl	snprintf
	ldr	r2, [sp, #28]
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L367
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	add	sp, sp, #24
	ldr	pc, [sp], #4
.L366:
	movw	r1, #:lower16:.LC22
	ldr	r2, .L368+4
	movt	r1, #:upper16:.LC22
	ldr	r0, [r4]
	bl	dev_err
	b	.L363
.L367:
	bl	__stack_chk_fail
.L369:
	.align	2
.L368:
	.word	es705_api_access+4096
	.word	.LANCHOR2+444
	.fnend
	.size	es705_route_status_show, .-es705_route_status_show
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_vs_make_internal_dump, %function
es705_put_vs_make_internal_dump:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L382
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r4, #:lower16:.LANCHOR0
	strd	r6, [sp, #8]
	movt	r4, #:upper16:.LANCHOR0
	strd	r8, [sp, #16]
	ldr	r0, [r4]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r5, [r1, #72]
	.pad #32
	sub	sp, sp, #32
	ldrd	r6, [r3]
	movw	r1, #:lower16:.LC86
	add	r2, r3, #12
	ldr	ip, [r3, #8]
	movt	r1, #:upper16:.LC86
	mov	r3, r5
	strd	r6, [sp, #20]
	str	ip, [sp, #28]
	bl	_dev_info
	cmp	r5, #2
	bne	.L371
	mov	r3, #2
	movt	r3, 36888
	str	r3, [sp, #24]
.L371:
	ldr	r0, .L382+4
	bl	mutex_lock
	ldr	r3, [sp, #20]
	cmn	r3, #1
	beq	.L372
	ldr	r8, .L382+8
	movw	r7, #:lower16:.LANCHOR0
	movw	r6, #:lower16:.LC87
	add	r5, sp, #20
	movt	r7, #:upper16:.LANCHOR0
	movt	r6, #:upper16:.LC87
.L375:
	add	r1, sp, #16
	str	r3, [sp, #16]
	mov	r2, #4
	ldr	r3, [r4, #56]
	mov	r0, r7
	blx	r3
	ldrb	r3, [sp, #19]	@ zero_extendqisi2
	mov	r1, #1000
	mov	r0, r1
	cmp	r3, #144
	bne	.L373
	ldrb	r3, [sp, #18]	@ zero_extendqisi2
	cmp	r3, #49
	beq	.L381
.L373:
	bl	usleep_range
.L374:
	ldrb	r10, [sp, #16]	@ zero_extendqisi2
	movw	r0, #:lower16:.LC10
	mov	r3, r8
	ldrb	r9, [sp, #17]	@ zero_extendqisi2
	movt	r0, #:upper16:.LC10
	mov	r2, r6
	ldrb	lr, [sp, #18]	@ zero_extendqisi2
	ldrb	ip, [sp, #19]	@ zero_extendqisi2
	ldr	r1, [r4]
	stm	sp, {ip, lr}
	str	r9, [sp, #8]
	str	r10, [sp, #12]
	bl	dev_printk
	ldr	r3, [r5, #4]!
	cmn	r3, #1
	bne	.L375
.L372:
	ldr	r0, .L382+4
	bl	mutex_unlock
	mov	r0, #10
	bl	msleep
	mov	r0, #0
	add	sp, sp, #32
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L381:
	ldr	r3, [r4, #1516]
	mul	r1, r1, r3
	mov	r0, r1
	bl	usleep_range
	b	.L374
.L383:
	.align	2
.L382:
	.word	.LANCHOR2+1016
	.word	.LANCHOR0+144
	.word	.LANCHOR2+1060
	.fnend
	.size	es705_put_vs_make_internal_dump, .-es705_put_vs_make_internal_dump
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_control_value, %function
es705_get_control_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r5, #:lower16:__stack_chk_guard
	movt	r4, #:upper16:.LANCHOR0
	strd	r6, [sp, #8]
	movt	r5, #:upper16:__stack_chk_guard
	str	r8, [sp, #16]
	ldr	r2, [r5]
	mov	r7, r1
	str	lr, [sp, #20]
	ldr	r3, [r0, #92]
	.pad #32
	sub	sp, sp, #32
	ldr	r0, [r4, #1156]
	str	r2, [sp, #28]
	ldr	r3, [r3, #12]
	cmp	r0, #0
	bne	.L385
	ldr	r2, [r4, #1160]
	cmp	r2, #0
	beq	.L393
.L385:
	movw	r2, #258
	mov	r0, #0
	mov	r1, #0
	cmp	r3, r2
	strd	r0, [sp, #12]
	bhi	.L394
	movw	r1, #:lower16:es705_api_access
	add	r0, sp, #12
	movt	r1, #:upper16:es705_api_access
	add	r1, r1, r3, lsl #5
	ldr	r6, [r1, #8]
	mov	r2, r6
	bl	memcpy
	add	r1, sp, #12
	mov	r2, r6
	add	r0, sp, #20
	bl	memcpy
	ldr	r0, .L397
	bl	mutex_lock
	mov	r3, #0
	movw	r0, #:lower16:.LANCHOR0
	ldr	r8, [r4, #60]
	mov	r2, r6
	add	r1, sp, #20
	str	r3, [sp]
	movt	r0, #:upper16:.LANCHOR0
	add	r3, sp, #8
	blx	r8
	mov	r6, r0
	ldr	r0, .L397
	bl	mutex_unlock
	cmp	r6, #0
	blt	.L395
	ldrh	r6, [sp, #8]
.L386:
	ldr	r2, [sp, #28]
	mov	r0, #0
	str	r6, [r7, #72]
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L396
	add	sp, sp, #32
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L393:
	ldr	r6, [r4, #1164]
	cmp	r6, #0
	bne	.L385
	b	.L386
.L394:
	movw	r1, #:lower16:.LC20
	ldr	r2, .L397+4
	mvn	r6, #21
	movt	r1, #:upper16:.LC20
	ldr	r0, [r4]
	bl	dev_err
	b	.L386
.L395:
	movw	r1, #:lower16:.LC22
	ldr	r2, .L397+4
	movt	r1, #:upper16:.LC22
	ldr	r0, [r4]
	bl	dev_err
	b	.L386
.L396:
	bl	__stack_chk_fail
.L398:
	.align	2
.L397:
	.word	.LANCHOR0+144
	.word	.LANCHOR2+444
	.fnend
	.size	es705_get_control_value, .-es705_get_control_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_control_enum, %function
es705_get_control_enum:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r5, #:lower16:__stack_chk_guard
	movt	r4, #:upper16:.LANCHOR0
	strd	r6, [sp, #8]
	movt	r5, #:upper16:__stack_chk_guard
	str	r8, [sp, #16]
	ldr	r2, [r5]
	mov	r7, r1
	str	lr, [sp, #20]
	ldr	r3, [r0, #92]
	.pad #32
	sub	sp, sp, #32
	ldr	r0, [r4, #1156]
	str	r2, [sp, #28]
	ldrh	r3, [r3]
	cmp	r0, #0
	bne	.L400
	ldr	r2, [r4, #1160]
	cmp	r2, #0
	beq	.L410
.L400:
	movw	r2, #258
	mov	r0, #0
	mov	r1, #0
	cmp	r3, r2
	strd	r0, [sp, #12]
	bhi	.L411
	movw	r1, #:lower16:es705_api_access
	add	r0, sp, #12
	movt	r1, #:upper16:es705_api_access
	add	r1, r1, r3, lsl #5
	ldr	r6, [r1, #8]
	mov	r2, r6
	bl	memcpy
	add	r1, sp, #12
	mov	r2, r6
	add	r0, sp, #20
	bl	memcpy
	ldr	r0, .L414
	bl	mutex_lock
	mov	r3, #0
	movw	r0, #:lower16:.LANCHOR0
	ldr	r8, [r4, #60]
	mov	r2, r6
	add	r1, sp, #20
	str	r3, [sp]
	movt	r0, #:upper16:.LANCHOR0
	add	r3, sp, #8
	blx	r8
	mov	r6, r0
	ldr	r0, .L414
	bl	mutex_unlock
	cmp	r6, #0
	blt	.L412
	ldrh	r0, [sp, #8]
.L401:
	ldr	r2, [sp, #28]
	str	r0, [r7, #72]
	mov	r0, #0
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L413
	add	sp, sp, #32
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L410:
	ldr	r0, [r4, #1164]
	cmp	r0, #0
	bne	.L400
	b	.L401
.L411:
	movw	r1, #:lower16:.LC20
	ldr	r2, .L414+4
	movt	r1, #:upper16:.LC20
	ldr	r0, [r4]
	bl	dev_err
	mvn	r0, #21
	b	.L401
.L412:
	movw	r1, #:lower16:.LC22
	ldr	r2, .L414+4
	movt	r1, #:upper16:.LC22
	ldr	r0, [r4]
	bl	dev_err
	mov	r0, r6
	b	.L401
.L413:
	bl	__stack_chk_fail
.L415:
	.align	2
.L414:
	.word	.LANCHOR0+144
	.word	.LANCHOR2+444
	.fnend
	.size	es705_get_control_enum, .-es705_get_control_enum
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_bwe_max_snr_value, %function
es705_get_bwe_max_snr_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r5, #:lower16:__stack_chk_guard
	movt	r4, #:upper16:.LANCHOR0
	strd	r6, [sp, #8]
	movt	r5, #:upper16:__stack_chk_guard
	str	r8, [sp, #16]
	ldr	r2, [r5]
	mov	r7, r1
	str	lr, [sp, #20]
	ldr	r3, [r0, #92]
	.pad #32
	sub	sp, sp, #32
	ldr	r0, [r4, #1156]
	str	r2, [sp, #28]
	ldr	r3, [r3, #12]
	cmp	r0, #0
	bne	.L417
	ldr	r2, [r4, #1160]
	cmp	r2, #0
	beq	.L425
.L417:
	movw	r2, #258
	mov	r0, #0
	mov	r1, #0
	cmp	r3, r2
	strd	r0, [sp, #12]
	bhi	.L426
	movw	r1, #:lower16:es705_api_access
	add	r0, sp, #12
	movt	r1, #:upper16:es705_api_access
	add	r1, r1, r3, lsl #5
	ldr	r6, [r1, #8]
	mov	r2, r6
	bl	memcpy
	add	r1, sp, #12
	mov	r2, r6
	add	r0, sp, #20
	bl	memcpy
	ldr	r0, .L429
	bl	mutex_lock
	mov	r3, #0
	movw	r0, #:lower16:.LANCHOR0
	ldr	r8, [r4, #60]
	mov	r2, r6
	add	r1, sp, #20
	str	r3, [sp]
	movt	r0, #:upper16:.LANCHOR0
	add	r3, sp, #8
	blx	r8
	mov	r6, r0
	ldr	r0, .L429
	bl	mutex_unlock
	cmp	r6, #0
	blt	.L427
	ldrh	r0, [sp, #8]
	add	r0, r0, #20
.L418:
	ldr	r2, [sp, #28]
	str	r0, [r7, #72]
	mov	r0, #0
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L428
	add	sp, sp, #32
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L425:
	ldr	r2, [r4, #1164]
	cmp	r2, #0
	moveq	r0, #20
	bne	.L417
	b	.L418
.L426:
	movw	r1, #:lower16:.LC20
	ldr	r2, .L429+4
	movt	r1, #:upper16:.LC20
	ldr	r0, [r4]
	bl	dev_err
	mvn	r0, #1
	b	.L418
.L427:
	movw	r1, #:lower16:.LC22
	ldr	r2, .L429+4
	movt	r1, #:upper16:.LC22
	ldr	r0, [r4]
	bl	dev_err
	add	r0, r6, #20
	b	.L418
.L428:
	bl	__stack_chk_fail
.L430:
	.align	2
.L429:
	.word	.LANCHOR0+144
	.word	.LANCHOR2+444
	.fnend
	.size	es705_get_bwe_max_snr_value, .-es705_get_bwe_max_snr_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_bwe_high_band_gain_value, %function
es705_get_bwe_high_band_gain_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r5, #:lower16:__stack_chk_guard
	movt	r4, #:upper16:.LANCHOR0
	strd	r6, [sp, #8]
	movt	r5, #:upper16:__stack_chk_guard
	str	r8, [sp, #16]
	ldr	r2, [r5]
	mov	r7, r1
	str	lr, [sp, #20]
	ldr	r3, [r0, #92]
	.pad #32
	sub	sp, sp, #32
	ldr	r0, [r4, #1156]
	str	r2, [sp, #28]
	ldr	r3, [r3, #12]
	cmp	r0, #0
	bne	.L432
	ldr	r2, [r4, #1160]
	cmp	r2, #0
	beq	.L440
.L432:
	movw	r2, #258
	mov	r0, #0
	mov	r1, #0
	cmp	r3, r2
	strd	r0, [sp, #12]
	bhi	.L441
	movw	r1, #:lower16:es705_api_access
	add	r0, sp, #12
	movt	r1, #:upper16:es705_api_access
	add	r1, r1, r3, lsl #5
	ldr	r6, [r1, #8]
	mov	r2, r6
	bl	memcpy
	add	r1, sp, #12
	mov	r2, r6
	add	r0, sp, #20
	bl	memcpy
	ldr	r0, .L444
	bl	mutex_lock
	mov	r3, #0
	movw	r0, #:lower16:.LANCHOR0
	ldr	r8, [r4, #60]
	mov	r2, r6
	add	r1, sp, #20
	str	r3, [sp]
	movt	r0, #:upper16:.LANCHOR0
	add	r3, sp, #8
	blx	r8
	mov	r6, r0
	ldr	r0, .L444
	bl	mutex_unlock
	cmp	r6, #0
	blt	.L442
	ldrh	r0, [sp, #8]
	add	r0, r0, #10
.L433:
	ldr	r2, [sp, #28]
	str	r0, [r7, #72]
	mov	r0, #0
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L443
	add	sp, sp, #32
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L440:
	ldr	r2, [r4, #1164]
	cmp	r2, #0
	moveq	r0, #10
	bne	.L432
	b	.L433
.L441:
	movw	r1, #:lower16:.LC20
	ldr	r2, .L444+4
	movt	r1, #:upper16:.LC20
	ldr	r0, [r4]
	bl	dev_err
	mvn	r0, #11
	b	.L433
.L442:
	movw	r1, #:lower16:.LC22
	ldr	r2, .L444+4
	movt	r1, #:upper16:.LC22
	ldr	r0, [r4]
	bl	dev_err
	add	r0, r6, #10
	b	.L433
.L443:
	bl	__stack_chk_fail
.L445:
	.align	2
.L444:
	.word	.LANCHOR0+144
	.word	.LANCHOR2+444
	.fnend
	.size	es705_get_bwe_high_band_gain_value, .-es705_get_bwe_high_band_gain_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_dereverb_gain_value, %function
es705_get_dereverb_gain_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r5, #:lower16:__stack_chk_guard
	movt	r4, #:upper16:.LANCHOR0
	strd	r6, [sp, #8]
	movt	r5, #:upper16:__stack_chk_guard
	str	r8, [sp, #16]
	ldr	r2, [r5]
	mov	r7, r1
	str	lr, [sp, #20]
	ldr	r3, [r0, #92]
	.pad #32
	sub	sp, sp, #32
	ldr	r0, [r4, #1156]
	str	r2, [sp, #28]
	ldr	r3, [r3, #12]
	cmp	r0, #0
	bne	.L447
	ldr	r2, [r4, #1160]
	cmp	r2, #0
	beq	.L455
.L447:
	movw	r2, #258
	mov	r0, #0
	mov	r1, #0
	cmp	r3, r2
	strd	r0, [sp, #12]
	bhi	.L456
	movw	r1, #:lower16:es705_api_access
	add	r0, sp, #12
	movt	r1, #:upper16:es705_api_access
	add	r1, r1, r3, lsl #5
	ldr	r6, [r1, #8]
	mov	r2, r6
	bl	memcpy
	add	r1, sp, #12
	mov	r2, r6
	add	r0, sp, #20
	bl	memcpy
	ldr	r0, .L459
	bl	mutex_lock
	mov	r3, #0
	movw	r0, #:lower16:.LANCHOR0
	ldr	r8, [r4, #60]
	mov	r2, r6
	add	r1, sp, #20
	str	r3, [sp]
	movt	r0, #:upper16:.LANCHOR0
	add	r3, sp, #8
	blx	r8
	mov	r6, r0
	ldr	r0, .L459
	bl	mutex_unlock
	cmp	r6, #0
	blt	.L457
	ldrh	r0, [sp, #8]
	add	r0, r0, #12
.L448:
	ldr	r2, [sp, #28]
	str	r0, [r7, #72]
	mov	r0, #0
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L458
	add	sp, sp, #32
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L455:
	ldr	r2, [r4, #1164]
	cmp	r2, #0
	moveq	r0, #12
	bne	.L447
	b	.L448
.L456:
	movw	r1, #:lower16:.LC20
	ldr	r2, .L459+4
	movt	r1, #:upper16:.LC20
	ldr	r0, [r4]
	bl	dev_err
	mvn	r0, #9
	b	.L448
.L457:
	movw	r1, #:lower16:.LC22
	ldr	r2, .L459+4
	movt	r1, #:upper16:.LC22
	ldr	r0, [r4]
	bl	dev_err
	add	r0, r6, #12
	b	.L448
.L458:
	bl	__stack_chk_fail
.L460:
	.align	2
.L459:
	.word	.LANCHOR0+144
	.word	.LANCHOR2+444
	.fnend
	.size	es705_get_dereverb_gain_value, .-es705_get_dereverb_gain_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_vs_detection_sensitivity, %function
es705_get_vs_detection_sensitivity:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r5, #:lower16:__stack_chk_guard
	movt	r4, #:upper16:.LANCHOR0
	strd	r6, [sp, #8]
	movt	r5, #:upper16:__stack_chk_guard
	str	r8, [sp, #16]
	ldr	r2, [r5]
	mov	r7, r1
	str	lr, [sp, #20]
	ldr	r3, [r0, #92]
	.pad #32
	sub	sp, sp, #32
	ldr	r0, [r4, #1156]
	str	r2, [sp, #28]
	ldr	r3, [r3, #12]
	cmp	r0, #0
	bne	.L462
	ldr	r2, [r4, #1160]
	cmp	r2, #0
	beq	.L470
.L462:
	movw	r2, #258
	mov	r0, #0
	mov	r1, #0
	cmp	r3, r2
	strd	r0, [sp, #12]
	bhi	.L471
	movw	r1, #:lower16:es705_api_access
	add	r0, sp, #12
	movt	r1, #:upper16:es705_api_access
	add	r1, r1, r3, lsl #5
	ldr	r6, [r1, #8]
	mov	r2, r6
	bl	memcpy
	add	r1, sp, #12
	mov	r2, r6
	add	r0, sp, #20
	bl	memcpy
	ldr	r0, .L474
	bl	mutex_lock
	mov	r3, #0
	movw	r0, #:lower16:.LANCHOR0
	ldr	r8, [r4, #60]
	mov	r2, r6
	add	r1, sp, #20
	str	r3, [sp]
	movt	r0, #:upper16:.LANCHOR0
	add	r3, sp, #8
	blx	r8
	mov	r6, r0
	ldr	r0, .L474
	bl	mutex_unlock
	cmp	r6, #0
	blt	.L472
	ldrh	ip, [sp, #8]
	mov	r6, ip
.L463:
	movw	r2, #:lower16:.LC88
	movw	r0, #:lower16:.LC10
	str	r6, [r7, #72]
	movt	r2, #:upper16:.LC88
	ldr	r3, .L474+4
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	str	ip, [sp]
	str	r6, [sp, #4]
	bl	dev_printk
	ldr	r2, [sp, #28]
	mov	r0, #0
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L473
	add	sp, sp, #32
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L470:
	ldr	ip, [r4, #1164]
	cmp	ip, #0
	moveq	r6, ip
	bne	.L462
	b	.L463
.L471:
	movw	r1, #:lower16:.LC20
	ldr	r2, .L474+8
	mvn	r6, #21
	movt	r1, #:upper16:.LC20
	ldr	r0, [r4]
	bl	dev_err
	mov	ip, r6
	b	.L463
.L472:
	movw	r1, #:lower16:.LC22
	ldr	r2, .L474+8
	movt	r1, #:upper16:.LC22
	ldr	r0, [r4]
	bl	dev_err
	mov	ip, r6
	b	.L463
.L473:
	bl	__stack_chk_fail
.L475:
	.align	2
.L474:
	.word	.LANCHOR0+144
	.word	.LANCHOR2+1080
	.word	.LANCHOR2+444
	.fnend
	.size	es705_get_vs_detection_sensitivity, .-es705_get_vs_detection_sensitivity
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_vad_sensitivity, %function
es705_get_vad_sensitivity:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r5, #:lower16:__stack_chk_guard
	movt	r4, #:upper16:.LANCHOR0
	strd	r6, [sp, #8]
	movt	r5, #:upper16:__stack_chk_guard
	str	r8, [sp, #16]
	ldr	r2, [r5]
	mov	r7, r1
	str	lr, [sp, #20]
	ldr	r3, [r0, #92]
	.pad #32
	sub	sp, sp, #32
	ldr	r0, [r4, #1156]
	str	r2, [sp, #28]
	ldr	r3, [r3, #12]
	cmp	r0, #0
	bne	.L477
	ldr	r2, [r4, #1160]
	cmp	r2, #0
	beq	.L485
.L477:
	movw	r2, #258
	mov	r0, #0
	mov	r1, #0
	cmp	r3, r2
	strd	r0, [sp, #12]
	bhi	.L486
	movw	r1, #:lower16:es705_api_access
	add	r0, sp, #12
	movt	r1, #:upper16:es705_api_access
	add	r1, r1, r3, lsl #5
	ldr	r6, [r1, #8]
	mov	r2, r6
	bl	memcpy
	add	r1, sp, #12
	mov	r2, r6
	add	r0, sp, #20
	bl	memcpy
	ldr	r0, .L489
	bl	mutex_lock
	mov	r3, #0
	movw	r0, #:lower16:.LANCHOR0
	ldr	r8, [r4, #60]
	mov	r2, r6
	add	r1, sp, #20
	str	r3, [sp]
	movt	r0, #:upper16:.LANCHOR0
	add	r3, sp, #8
	blx	r8
	mov	r6, r0
	ldr	r0, .L489
	bl	mutex_unlock
	cmp	r6, #0
	blt	.L487
	ldrh	ip, [sp, #8]
	mov	r6, ip
.L478:
	movw	r2, #:lower16:.LC88
	movw	r0, #:lower16:.LC10
	str	r6, [r7, #72]
	movt	r2, #:upper16:.LC88
	ldr	r3, .L489+4
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	str	ip, [sp]
	str	r6, [sp, #4]
	bl	dev_printk
	ldr	r2, [sp, #28]
	mov	r0, #0
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L488
	add	sp, sp, #32
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L485:
	ldr	ip, [r4, #1164]
	cmp	ip, #0
	moveq	r6, ip
	bne	.L477
	b	.L478
.L486:
	movw	r1, #:lower16:.LC20
	ldr	r2, .L489+8
	mvn	r6, #21
	movt	r1, #:upper16:.LC20
	ldr	r0, [r4]
	bl	dev_err
	mov	ip, r6
	b	.L478
.L487:
	movw	r1, #:lower16:.LC22
	ldr	r2, .L489+8
	movt	r1, #:upper16:.LC22
	ldr	r0, [r4]
	bl	dev_err
	mov	ip, r6
	b	.L478
.L488:
	bl	__stack_chk_fail
.L490:
	.align	2
.L489:
	.word	.LANCHOR0+144
	.word	.LANCHOR2+1116
	.word	.LANCHOR2+444
	.fnend
	.size	es705_get_vad_sensitivity, .-es705_get_vad_sensitivity
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_internal_rate, %function
es705_put_internal_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r2, #:lower16:.LC14
	movt	r4, #:upper16:.LANCHOR0
	strd	r6, [sp, #8]
	movw	r0, #:lower16:.LC10
	strd	r8, [sp, #16]
	ldr	ip, [r4, #1152]
	mov	r5, r1
	str	r10, [sp, #24]
	ldr	r3, .L511
	movt	r2, #:upper16:.LC14
	str	lr, [sp, #28]
	ldr	lr, [r1, #72]
	.pad #24
	sub	sp, sp, #24
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	stm	sp, {ip, lr}
	bl	dev_printk
	ldr	r3, [r5, #72]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L492
.L494:
	.word	.L493
	.word	.L495
	.word	.L496
	.word	.L497
.L497:
	ldr	r1, [r4, #1148]
	movw	r2, #:lower16:.LANCHOR2
	movt	r2, #:upper16:.LANCHOR2
	add	r1, r1, r1, lsl #2
	add	r2, r2, r1, lsl #2
	ldr	r5, [r2, #1184]
.L498:
	cmp	r5, #0
	beq	.L492
	ldr	r0, .L511+4
	str	r3, [r4, #1152]
	bl	mutex_lock
	ldr	r3, [r5]
	cmn	r3, #1
	beq	.L501
	ldr	r8, .L511+8
	movw	r7, #:lower16:.LANCHOR0
	movw	r6, #:lower16:.LC87
	movt	r7, #:upper16:.LANCHOR0
	movt	r6, #:upper16:.LC87
.L504:
	add	r1, sp, #20
	str	r3, [sp, #20]
	mov	r2, #4
	ldr	r3, [r4, #56]
	mov	r0, r7
	blx	r3
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	mov	r1, #1000
	mov	r0, r1
	cmp	r3, #144
	bne	.L502
	ldrb	r3, [sp, #22]	@ zero_extendqisi2
	cmp	r3, #49
	beq	.L510
.L502:
	bl	usleep_range
.L503:
	ldrb	r10, [sp, #20]	@ zero_extendqisi2
	movw	r0, #:lower16:.LC10
	mov	r3, r8
	ldrb	r9, [sp, #21]	@ zero_extendqisi2
	movt	r0, #:upper16:.LC10
	mov	r2, r6
	ldrb	lr, [sp, #22]	@ zero_extendqisi2
	ldrb	ip, [sp, #23]	@ zero_extendqisi2
	ldr	r1, [r4]
	stm	sp, {ip, lr}
	str	r9, [sp, #8]
	str	r10, [sp, #12]
	bl	dev_printk
	ldr	r3, [r5, #4]!
	cmn	r3, #1
	bne	.L504
.L501:
	ldr	r0, .L511+4
	bl	mutex_unlock
	mov	r0, #0
.L491:
	add	sp, sp, #24
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L496:
	ldr	r1, [r4, #1148]
	movw	r2, #:lower16:.LANCHOR2
	movt	r2, #:upper16:.LANCHOR2
	add	r1, r1, r1, lsl #2
	add	r2, r2, r1, lsl #2
	ldr	r5, [r2, #1180]
	b	.L498
.L495:
	ldr	r1, [r4, #1148]
	movw	r2, #:lower16:.LANCHOR2
	movt	r2, #:upper16:.LANCHOR2
	add	r1, r1, r1, lsl #2
	add	r2, r2, r1, lsl #2
	ldr	r5, [r2, #1176]
	b	.L498
.L493:
	ldr	r1, [r4, #1148]
	movw	r2, #:lower16:.LANCHOR2
	movt	r2, #:upper16:.LANCHOR2
	add	r1, r1, r1, lsl #2
	add	r2, r2, r1, lsl #2
	ldr	r5, [r2, #1172]
	b	.L498
.L510:
	ldr	r3, [r4, #1516]
	mul	r1, r1, r3
	mov	r0, r1
	bl	usleep_range
	b	.L503
.L492:
	movw	r1, #:lower16:.LC89
	ldr	r2, .L511
	movt	r1, #:upper16:.LC89
	ldr	r0, [r4]
	bl	dev_err
	mvn	r0, #21
	b	.L491
.L512:
	.align	2
.L511:
	.word	.LANCHOR2+1144
	.word	.LANCHOR0+144
	.word	.LANCHOR2+1060
	.fnend
	.size	es705_put_internal_rate, .-es705_put_internal_rate
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_get_power_control_enum, %function
es705_get_power_control_enum:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-20]!
	.save {r4, r5, r6, r7, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r5, #:lower16:__stack_chk_guard
	movt	r4, #:upper16:.LANCHOR0
	movt	r5, #:upper16:__stack_chk_guard
	strd	r6, [sp, #8]
	ldr	r2, [r4, #584]
	str	lr, [sp, #16]
	.pad #36
	sub	sp, sp, #36
	ldr	r3, [r5]
	mov	r7, r1
	cmp	r2, #1
	str	r3, [sp, #28]
	beq	.L521
	ldr	r3, [r0, #92]
	movw	r2, #258
	mov	r1, #0
	mov	r0, #0
	strd	r0, [sp, #12]
	ldrh	r3, [r3]
	cmp	r3, r2
	bhi	.L522
	movw	r1, #:lower16:es705_api_access
	add	r0, sp, #12
	movt	r1, #:upper16:es705_api_access
	add	r1, r1, r3, lsl #5
	ldr	r6, [r1, #8]
	mov	r2, r6
	bl	memcpy
	add	r1, sp, #12
	mov	r2, r6
	add	r0, sp, #20
	bl	memcpy
	add	r0, r4, #144
	bl	mutex_lock
	mov	r0, #0
	mov	r2, r6
	ldr	r6, [r4, #60]
	add	r1, sp, #20
	add	r3, sp, #8
	str	r0, [sp]
	mov	r0, r4
	blx	r6
	mov	r6, r0
	add	r0, r4, #144
	bl	mutex_unlock
	cmp	r6, #0
	blt	.L523
	ldrh	r0, [sp, #8]
.L515:
	ldr	r2, [sp, #28]
	str	r0, [r7, #72]
	mov	r0, #0
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L524
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
.L521:
	ldr	r0, [r4, #1172]
	b	.L515
.L522:
	movw	r1, #:lower16:.LC20
	ldr	r2, .L525
	movt	r1, #:upper16:.LC20
	ldr	r0, [r4]
	bl	dev_err
	mvn	r0, #21
	b	.L515
.L523:
	movw	r1, #:lower16:.LC22
	ldr	r2, .L525
	movt	r1, #:upper16:.LC22
	ldr	r0, [r4]
	bl	dev_err
	mov	r0, r6
	b	.L515
.L524:
	bl	__stack_chk_fail
.L526:
	.align	2
.L525:
	.word	.LANCHOR2+444
	.fnend
	.size	es705_get_power_control_enum, .-es705_get_power_control_enum
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_fw_version_show, %function
es705_fw_version_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 288
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r1, #256
	strd	r6, [sp, #8]
	movw	r7, #:lower16:.LANCHOR0
	strd	r10, [sp, #24]
	movw	fp, #:lower16:__stack_chk_guard
	movt	r7, #:upper16:.LANCHOR0
	strd	r8, [sp, #16]
	movt	fp, #:upper16:__stack_chk_guard
	str	lr, [sp, #32]
	.pad #300
	sub	sp, sp, #300
	ldr	r3, [fp]
	str	r0, [sp, #8]
	add	r0, sp, #36
	str	r2, [sp, #12]
	str	r3, [sp, #292]
	bl	__memzero
	ldr	r3, [r7, #584]
	cmp	r3, #3
	beq	.L538
	movw	r1, #:lower16:.LC91
	ldr	r0, [sp, #8]
	movt	r1, #:upper16:.LC91
	bl	_dev_info
.L535:
	movw	r2, #:lower16:.LC92
	add	r3, sp, #36
	ldr	r0, [sp, #12]
	movt	r2, #:upper16:.LC92
	mov	r1, #4096
	bl	snprintf
	ldr	r2, [sp, #292]
	ldr	r3, [fp]
	cmp	r2, r3
	bne	.L539
	add	sp, sp, #300
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L538:
	ldr	r8, .L541
	mov	r3, #0
	mov	r2, #0
	add	r0, sp, #20
	strd	r2, [sp, #20]
	ldr	r4, [r8, #3656]
	add	r1, r8, #3648
	mov	r2, r4
	bl	memcpy
	add	r1, sp, #20
	mov	r2, r4
	add	r0, sp, #28
	bl	memcpy
	add	r0, r7, #144
	bl	mutex_lock
	mov	r0, #0
	mov	r2, r4
	ldr	r4, [r7, #60]
	add	r1, sp, #28
	add	r3, sp, #16
	str	r0, [sp]
	mov	r0, r7
	blx	r4
	mov	r4, r0
	add	r0, r7, #144
	bl	mutex_unlock
	cmp	r4, #0
	blt	.L540
	ldr	r3, [sp, #16]
	uxth	r3, r3
.L530:
	add	r9, sp, #288
	ldr	r10, .L541+4
	strb	r3, [sp, #36]
	add	r4, sp, #37
	ldr	r6, .L541+8
	add	r9, r9, #3
	b	.L531
.L532:
	ldr	r3, [sp, #16]
	strb	r3, [r4], #1
	cmp	r4, r9
	beq	.L534
.L531:
	ldr	r5, [r8, #3688]
	mov	r3, #0
	mov	r2, #0
	mov	r1, r10
	add	r0, sp, #20
	strd	r2, [sp, #20]
	mov	r2, r5
	bl	memcpy
	add	r1, sp, #20
	mov	r2, r5
	add	r0, sp, #28
	bl	memcpy
	mov	r0, r6
	bl	mutex_lock
	mov	r1, #0
	movw	r0, #:lower16:.LANCHOR0
	ldr	ip, [r7, #60]
	mov	r2, r5
	add	r3, sp, #16
	str	r1, [sp]
	movt	r0, #:upper16:.LANCHOR0
	add	r1, sp, #28
	blx	ip
	mov	r5, r0
	mov	r0, r6
	bl	mutex_unlock
	cmp	r5, #0
	bge	.L532
	movw	r1, #:lower16:.LC22
	ldr	r2, .L541+12
	movt	r1, #:upper16:.LC22
	ldr	r0, [r7]
	bl	dev_err
	strb	r5, [r4], #1
	cmp	r4, r9
	bne	.L531
.L534:
	mov	r3, #0
	movw	r1, #:lower16:.LC90
	ldr	r0, [sp, #8]
	movt	r1, #:upper16:.LC90
	add	r2, sp, #36
	strb	r3, [sp, #291]
	bl	_dev_info
	b	.L535
.L540:
	movw	r1, #:lower16:.LC22
	ldr	r2, .L541+12
	movt	r1, #:upper16:.LC22
	ldr	r0, [r7]
	bl	dev_err
	mov	r3, r4
	b	.L530
.L539:
	bl	__stack_chk_fail
.L542:
	.align	2
.L541:
	.word	es705_api_access+4096
	.word	es705_api_access+7776
	.word	.LANCHOR0+144
	.word	.LANCHOR2+444
	.fnend
	.size	es705_fw_version_show, .-es705_fw_version_show
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_vs_event_set, %function
es705_vs_event_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-28]!
	.save {r4, r5, r6, r7, r8, r9, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r2, #:lower16:.LC93
	strd	r6, [sp, #8]
	movw	r6, #:lower16:__stack_chk_guard
	movt	r4, #:upper16:.LANCHOR0
	movt	r6, #:upper16:__stack_chk_guard
	strd	r8, [sp, #16]
	movw	r0, #:lower16:.LC10
	ldr	ip, [r6]
	str	lr, [sp, #24]
	.pad #44
	sub	sp, sp, #44
	movt	r2, #:upper16:.LC93
	ldr	r1, [r4]
	movt	r0, #:upper16:.LC10
	mov	r7, r3
	ldr	r3, .L555
	mov	r8, #0
	mov	r9, #0
	str	ip, [sp, #36]
	bl	dev_printk
	ldr	r3, .L555+4
	mov	lr, #4
	mov	r2, #2
	mvn	ip, #0
	movw	r1, #:lower16:.LC21
	ldr	r0, [r4]
	str	lr, [sp]
	movt	r1, #:upper16:.LC21
	str	r2, [r4, #596]
	ldr	r5, [r3, #3732]
	strd	r8, [sp, #20]
	ldr	r2, [r3, #3740]
	mov	r3, #244
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r2, r2
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r2, r2, #32
	mvn	r8, ip, lsl r2
	ldr	r2, .L555+8
	stmib	sp, {r5, r8}
	bl	_dev_info
	add	r0, sp, #20
	mov	r2, r5
	ldr	r1, .L555+12
	bl	memcpy
	cmp	r5, #4
	beq	.L545
	cmp	r5, #8
	beq	.L553
.L544:
	mov	r2, r5
	add	r1, sp, #20
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L555+16
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	mov	r2, r5
	ldr	r3, [r4, #56]
	add	r1, sp, #28
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	mov	r5, r0
	ldr	r0, .L555+16
	bl	mutex_unlock
	cmp	r5, #0
	beq	.L547
	movw	r1, #:lower16:.LC83
	ldr	r2, .L555
	movt	r1, #:upper16:.LC83
	ldr	r0, [r4]
	bl	dev_err
.L547:
	ldr	r2, [sp, #36]
	mov	r0, r7
	ldr	r3, [r6]
	cmp	r2, r3
	bne	.L554
	add	sp, sp, #44
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	add	sp, sp, #24
	ldr	pc, [sp], #4
.L553:
	ldr	r3, [sp, #24]
	and	r2, r8, #4
	orr	r2, r3, r2
	str	r2, [sp, #24]
	b	.L544
.L545:
	ldr	r3, [sp, #20]
	and	r2, r8, #4
	orr	r2, r3, r2
	str	r2, [sp, #20]
	b	.L544
.L554:
	bl	__stack_chk_fail
.L556:
	.align	2
.L555:
	.word	.LANCHOR2+1748
	.word	es705_api_access+4096
	.word	.LANCHOR2+432
	.word	es705_api_access+7820
	.word	.LANCHOR0+144
	.fnend
	.size	es705_vs_event_set, .-es705_vs_event_set
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_overlay_mode_set, %function
es705_overlay_mode_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-28]!
	.save {r4, r5, r6, r7, r8, r9, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r2, #:lower16:.LC94
	strd	r6, [sp, #8]
	movw	r6, #:lower16:__stack_chk_guard
	movt	r4, #:upper16:.LANCHOR0
	movt	r6, #:upper16:__stack_chk_guard
	strd	r8, [sp, #16]
	movw	r0, #:lower16:.LC10
	ldr	ip, [r6]
	str	lr, [sp, #24]
	.pad #44
	sub	sp, sp, #44
	movt	r2, #:upper16:.LC94
	ldr	r1, [r4]
	movt	r0, #:upper16:.LC10
	mov	r7, r3
	ldr	r3, .L568
	mov	r8, #0
	mov	r9, #0
	str	ip, [sp, #36]
	bl	dev_printk
	ldr	r3, .L568+4
	mov	lr, #5
	mov	r2, #0
	mvn	ip, #0
	movw	r1, #:lower16:.LC21
	ldr	r0, [r4]
	str	lr, [sp]
	movt	r1, #:upper16:.LC21
	str	r2, [r4, #596]
	ldr	r5, [r3, #1492]
	strd	r8, [sp, #20]
	ldr	r2, [r3, #1500]
	mov	r3, #174
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r2, r2
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r2, r2, #32
	mvn	r8, ip, lsl r2
	ldr	r2, .L568+8
	stmib	sp, {r5, r8}
	bl	_dev_info
	add	r0, sp, #20
	mov	r2, r5
	ldr	r1, .L568+12
	bl	memcpy
	cmp	r5, #4
	beq	.L559
	cmp	r5, #8
	beq	.L565
.L558:
	mov	r2, r5
	add	r1, sp, #20
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L568+16
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	mov	r2, r5
	ldr	r3, [r4, #56]
	add	r1, sp, #28
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	mov	r5, r0
	ldr	r0, .L568+16
	bl	mutex_unlock
	cmp	r5, #0
	bne	.L566
	mov	r0, #50
	bl	msleep
	mov	r3, #5
	movw	r1, #:lower16:.LC96
	ldr	r2, .L568
	movt	r1, #:upper16:.LC96
	ldr	r0, [r4]
	str	r3, [r4, #1172]
	bl	_dev_info
.L562:
	ldr	r2, [sp, #36]
	mov	r0, r7
	ldr	r3, [r6]
	cmp	r2, r3
	bne	.L567
	add	sp, sp, #44
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	add	sp, sp, #24
	ldr	pc, [sp], #4
.L565:
	ldr	r3, [sp, #24]
	and	r2, r8, #5
	orr	r2, r3, r2
	str	r2, [sp, #24]
	b	.L558
.L566:
	movw	r1, #:lower16:.LC95
	ldr	r2, .L568
	movt	r1, #:upper16:.LC95
	ldr	r0, [r4]
	bl	dev_err
	b	.L562
.L559:
	ldr	r3, [sp, #20]
	and	r2, r8, #5
	orr	r2, r3, r2
	str	r2, [sp, #20]
	b	.L558
.L567:
	bl	__stack_chk_fail
.L569:
	.align	2
.L568:
	.word	.LANCHOR2+1768
	.word	es705_api_access+4096
	.word	.LANCHOR2+432
	.word	es705_api_access+5580
	.word	.LANCHOR0+144
	.fnend
	.size	es705_overlay_mode_set, .-es705_overlay_mode_set
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_preset_value, %function
es705_put_preset_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r2, #258
	strd	r6, [sp, #8]
	movw	r7, #:lower16:__stack_chk_guard
	movw	r6, #:lower16:.LANCHOR0
	strd	r8, [sp, #16]
	movt	r7, #:upper16:__stack_chk_guard
	movt	r6, #:upper16:.LANCHOR0
	str	r10, [sp, #24]
	ldr	ip, [r7]
	str	lr, [sp, #28]
	ldr	r3, [r0, #92]
	.pad #40
	sub	sp, sp, #40
	mov	r0, #0
	ldr	r10, [r1, #72]
	mov	r1, #0
	strd	r0, [sp, #20]
	ldr	r0, [r6]
	ldr	r3, [r3, #12]
	str	ip, [sp, #36]
	cmp	r3, r2
	bhi	.L580
	lsl	r8, r3, #5
	movw	r9, #:lower16:es705_api_access
	str	r10, [sp]
	movt	r9, #:upper16:es705_api_access
	ldr	r2, .L583
	add	r1, r9, r8
	mvn	ip, #0
	ldr	r5, [r1, #20]
	ldr	r4, [r1, #28]
	movw	r1, #:lower16:.LC21
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r4, r4
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r4, r4, #32
	movt	r1, #:upper16:.LC21
	mvn	r4, ip, lsl r4
	str	r5, [sp, #4]
	str	r4, [sp, #8]
	bl	_dev_info
	add	r1, r8, #12
	mov	r2, r5
	add	r1, r9, r1
	add	r0, sp, #20
	bl	memcpy
	cmp	r5, #4
	beq	.L574
	cmp	r5, #8
	beq	.L581
.L573:
	add	r1, sp, #20
	mov	r2, r5
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L583+4
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	ldr	r3, [r6, #56]
	add	r1, sp, #28
	mov	r2, r5
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	mov	r4, r0
	ldr	r0, .L583+4
	bl	mutex_unlock
	cmp	r4, #0
	movweq	r3, #1146
	strheq	r10, [r6, r3]	@ movhi
	bne	.L572
.L570:
	ldr	r2, [sp, #36]
	mov	r0, r4
	ldr	r3, [r7]
	cmp	r2, r3
	bne	.L582
	add	sp, sp, #40
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L581:
	ldr	r3, [sp, #24]
	and	r4, r4, r10
	orr	r4, r3, r4
	str	r4, [sp, #24]
	b	.L573
.L574:
	ldr	r3, [sp, #20]
	and	r4, r4, r10
	orr	r4, r3, r4
	str	r4, [sp, #20]
	b	.L573
.L580:
	movw	r1, #:lower16:.LC20
	ldr	r2, .L583
	mvn	r4, #21
	movt	r1, #:upper16:.LC20
	bl	dev_err
.L572:
	movw	r1, #:lower16:.LC97
	ldr	r2, .L583+8
	movt	r1, #:upper16:.LC97
	ldr	r0, [r6]
	bl	dev_err
	b	.L570
.L582:
	bl	__stack_chk_fail
.L584:
	.align	2
.L583:
	.word	.LANCHOR2+432
	.word	.LANCHOR0+144
	.word	.LANCHOR2+1792
	.fnend
	.size	es705_put_preset_value, .-es705_put_preset_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_control_value, %function
es705_put_control_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r2, #258
	strd	r6, [sp, #8]
	movw	r6, #:lower16:__stack_chk_guard
	movw	r7, #:lower16:.LANCHOR0
	strd	r8, [sp, #16]
	movt	r6, #:upper16:__stack_chk_guard
	movt	r7, #:upper16:.LANCHOR0
	str	r10, [sp, #24]
	ldr	ip, [r6]
	str	lr, [sp, #28]
	ldr	r3, [r0, #92]
	.pad #40
	sub	sp, sp, #40
	mov	r0, #0
	ldr	r10, [r1, #72]
	mov	r1, #0
	strd	r0, [sp, #20]
	ldr	r0, [r7]
	ldr	r3, [r3, #12]
	str	ip, [sp, #36]
	cmp	r3, r2
	bhi	.L593
	lsl	r8, r3, #5
	movw	r9, #:lower16:es705_api_access
	str	r10, [sp]
	movt	r9, #:upper16:es705_api_access
	ldr	r2, .L596
	add	r1, r9, r8
	mvn	ip, #0
	ldr	r5, [r1, #20]
	ldr	r4, [r1, #28]
	movw	r1, #:lower16:.LC21
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r4, r4
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r4, r4, #32
	movt	r1, #:upper16:.LC21
	mvn	r4, ip, lsl r4
	str	r5, [sp, #4]
	str	r4, [sp, #8]
	bl	_dev_info
	add	r1, r8, #12
	mov	r2, r5
	add	r1, r9, r1
	add	r0, sp, #20
	bl	memcpy
	cmp	r5, #4
	beq	.L589
	cmp	r5, #8
	beq	.L594
.L588:
	add	r1, sp, #20
	mov	r2, r5
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L596+4
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	add	r1, sp, #28
	ldr	r3, [r7, #56]
	mov	r2, r5
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	ldr	r0, .L596+4
	bl	mutex_unlock
.L587:
	ldr	r2, [sp, #36]
	mov	r0, #0
	ldr	r3, [r6]
	cmp	r2, r3
	bne	.L595
	add	sp, sp, #40
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L594:
	ldr	r3, [sp, #24]
	and	r4, r4, r10
	orr	r4, r3, r4
	str	r4, [sp, #24]
	b	.L588
.L589:
	ldr	r3, [sp, #20]
	and	r4, r4, r10
	orr	r4, r3, r4
	str	r4, [sp, #20]
	b	.L588
.L593:
	movw	r1, #:lower16:.LC20
	ldr	r2, .L596
	movt	r1, #:upper16:.LC20
	bl	dev_err
	b	.L587
.L595:
	bl	__stack_chk_fail
.L597:
	.align	2
.L596:
	.word	.LANCHOR2+432
	.word	.LANCHOR0+144
	.fnend
	.size	es705_put_control_value, .-es705_put_control_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_control_enum, %function
es705_put_control_enum:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r2, #258
	strd	r6, [sp, #8]
	movw	r6, #:lower16:__stack_chk_guard
	movw	r7, #:lower16:.LANCHOR0
	strd	r8, [sp, #16]
	movt	r6, #:upper16:__stack_chk_guard
	movt	r7, #:upper16:.LANCHOR0
	str	r10, [sp, #24]
	ldr	ip, [r6]
	str	lr, [sp, #28]
	ldr	r3, [r0, #92]
	.pad #40
	sub	sp, sp, #40
	mov	r0, #0
	ldr	r10, [r1, #72]
	mov	r1, #0
	strd	r0, [sp, #20]
	ldr	r0, [r7]
	ldrh	r3, [r3]
	str	ip, [sp, #36]
	cmp	r3, r2
	bhi	.L606
	lsl	r8, r3, #5
	movw	r9, #:lower16:es705_api_access
	str	r10, [sp]
	movt	r9, #:upper16:es705_api_access
	ldr	r2, .L609
	add	r1, r9, r8
	mvn	ip, #0
	ldr	r5, [r1, #20]
	ldr	r4, [r1, #28]
	movw	r1, #:lower16:.LC21
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r4, r4
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r4, r4, #32
	movt	r1, #:upper16:.LC21
	mvn	r4, ip, lsl r4
	str	r5, [sp, #4]
	str	r4, [sp, #8]
	bl	_dev_info
	add	r1, r8, #12
	mov	r2, r5
	add	r1, r9, r1
	add	r0, sp, #20
	bl	memcpy
	cmp	r5, #4
	beq	.L602
	cmp	r5, #8
	beq	.L607
.L601:
	add	r1, sp, #20
	mov	r2, r5
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L609+4
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	add	r1, sp, #28
	ldr	r3, [r7, #56]
	mov	r2, r5
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	ldr	r0, .L609+4
	bl	mutex_unlock
.L600:
	ldr	r2, [sp, #36]
	mov	r0, #0
	ldr	r3, [r6]
	cmp	r2, r3
	bne	.L608
	add	sp, sp, #40
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L607:
	ldr	r3, [sp, #24]
	and	r4, r4, r10
	orr	r4, r3, r4
	str	r4, [sp, #24]
	b	.L601
.L602:
	ldr	r3, [sp, #20]
	and	r4, r4, r10
	orr	r4, r3, r4
	str	r4, [sp, #20]
	b	.L601
.L606:
	movw	r1, #:lower16:.LC20
	ldr	r2, .L609
	movt	r1, #:upper16:.LC20
	bl	dev_err
	b	.L600
.L608:
	bl	__stack_chk_fail
.L610:
	.align	2
.L609:
	.word	.LANCHOR2+432
	.word	.LANCHOR0+144
	.fnend
	.size	es705_put_control_enum, .-es705_put_control_enum
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_vs_detection_sensitivity, %function
es705_put_vs_detection_sensitivity:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r2, #:lower16:.LC98
	strd	r6, [sp, #8]
	movw	r6, #:lower16:.LANCHOR0
	movt	r2, #:upper16:.LC98
	strd	r8, [sp, #16]
	movw	r8, #:lower16:__stack_chk_guard
	movt	r6, #:upper16:.LANCHOR0
	str	r10, [sp, #24]
	movt	r8, #:upper16:__stack_chk_guard
	str	lr, [sp, #28]
	ldr	r3, [r0, #92]
	.pad #40
	sub	sp, sp, #40
	ldr	r7, [r1, #72]
	movw	r0, #:lower16:.LC10
	ldr	ip, [r8]
	movt	r0, #:upper16:.LC10
	ldr	r1, [r6]
	ldr	r5, [r3, #12]
	ldr	r3, .L622
	str	r7, [sp]
	str	r7, [sp, #4]
	str	ip, [sp, #36]
	bl	dev_printk
	movw	r1, #258
	mov	r2, #0
	mov	r3, #0
	cmp	r5, r1
	strd	r2, [sp, #20]
	bhi	.L619
	lsl	r9, r5, #5
	movw	r10, #:lower16:es705_api_access
	str	r7, [sp]
	movt	r10, #:upper16:es705_api_access
	ldr	r2, .L622+4
	add	lr, r10, r9
	mvn	ip, #0
	ldr	r0, [r6]
	ldr	r4, [lr, #28]
	mov	r3, r5
	movw	r1, #:lower16:.LC21
	ldr	r5, [lr, #20]
	movt	r1, #:upper16:.LC21
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r4, r4
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r4, r4, #32
	mvn	r4, ip, lsl r4
	str	r5, [sp, #4]
	str	r4, [sp, #8]
	bl	_dev_info
	add	r1, r9, #12
	mov	r2, r5
	add	r1, r10, r1
	add	r0, sp, #20
	bl	memcpy
	cmp	r5, #4
	beq	.L615
	cmp	r5, #8
	beq	.L620
.L614:
	add	r1, sp, #20
	mov	r2, r5
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L622+8
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	add	r1, sp, #28
	ldr	r3, [r6, #56]
	mov	r2, r5
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	mov	r4, r0
	ldr	r0, .L622+8
	bl	mutex_unlock
.L611:
	ldr	r2, [sp, #36]
	mov	r0, r4
	ldr	r3, [r8]
	cmp	r2, r3
	bne	.L621
	add	sp, sp, #40
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L620:
	ldr	r3, [sp, #24]
	and	r4, r4, r7
	orr	r4, r3, r4
	str	r4, [sp, #24]
	b	.L614
.L615:
	ldr	r3, [sp, #20]
	and	r4, r4, r7
	orr	r4, r3, r4
	str	r4, [sp, #20]
	b	.L614
.L619:
	movw	r1, #:lower16:.LC20
	mov	r3, r5
	ldr	r2, .L622+4
	movt	r1, #:upper16:.LC20
	ldr	r0, [r6]
	mvn	r4, #21
	bl	dev_err
	b	.L611
.L621:
	bl	__stack_chk_fail
.L623:
	.align	2
.L622:
	.word	.LANCHOR2+1816
	.word	.LANCHOR2+432
	.word	.LANCHOR0+144
	.fnend
	.size	es705_put_vs_detection_sensitivity, .-es705_put_vs_detection_sensitivity
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_vad_sensitivity, %function
es705_put_vad_sensitivity:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r2, #:lower16:.LC98
	strd	r6, [sp, #8]
	movw	r6, #:lower16:.LANCHOR0
	movt	r2, #:upper16:.LC98
	strd	r8, [sp, #16]
	movw	r8, #:lower16:__stack_chk_guard
	movt	r6, #:upper16:.LANCHOR0
	str	r10, [sp, #24]
	movt	r8, #:upper16:__stack_chk_guard
	str	lr, [sp, #28]
	ldr	r3, [r0, #92]
	.pad #40
	sub	sp, sp, #40
	ldr	r7, [r1, #72]
	movw	r0, #:lower16:.LC10
	ldr	ip, [r8]
	movt	r0, #:upper16:.LC10
	ldr	r1, [r6]
	ldr	r5, [r3, #12]
	ldr	r3, .L635
	str	r7, [sp]
	str	r7, [sp, #4]
	str	ip, [sp, #36]
	bl	dev_printk
	movw	r1, #258
	mov	r2, #0
	mov	r3, #0
	cmp	r5, r1
	strd	r2, [sp, #20]
	bhi	.L632
	lsl	r9, r5, #5
	movw	r10, #:lower16:es705_api_access
	str	r7, [sp]
	movt	r10, #:upper16:es705_api_access
	ldr	r2, .L635+4
	add	lr, r10, r9
	mvn	ip, #0
	ldr	r0, [r6]
	ldr	r4, [lr, #28]
	mov	r3, r5
	movw	r1, #:lower16:.LC21
	ldr	r5, [lr, #20]
	movt	r1, #:upper16:.LC21
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r4, r4
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r4, r4, #32
	mvn	r4, ip, lsl r4
	str	r5, [sp, #4]
	str	r4, [sp, #8]
	bl	_dev_info
	add	r1, r9, #12
	mov	r2, r5
	add	r1, r10, r1
	add	r0, sp, #20
	bl	memcpy
	cmp	r5, #4
	beq	.L628
	cmp	r5, #8
	beq	.L633
.L627:
	add	r1, sp, #20
	mov	r2, r5
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L635+8
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	add	r1, sp, #28
	ldr	r3, [r6, #56]
	mov	r2, r5
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	mov	r4, r0
	ldr	r0, .L635+8
	bl	mutex_unlock
.L624:
	ldr	r2, [sp, #36]
	mov	r0, r4
	ldr	r3, [r8]
	cmp	r2, r3
	bne	.L634
	add	sp, sp, #40
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L633:
	ldr	r3, [sp, #24]
	and	r4, r4, r7
	orr	r4, r3, r4
	str	r4, [sp, #24]
	b	.L627
.L628:
	ldr	r3, [sp, #20]
	and	r4, r4, r7
	orr	r4, r3, r4
	str	r4, [sp, #20]
	b	.L627
.L632:
	movw	r1, #:lower16:.LC20
	mov	r3, r5
	ldr	r2, .L635+4
	movt	r1, #:upper16:.LC20
	ldr	r0, [r6]
	mvn	r4, #21
	bl	dev_err
	b	.L624
.L634:
	bl	__stack_chk_fail
.L636:
	.align	2
.L635:
	.word	.LANCHOR2+1852
	.word	.LANCHOR2+432
	.word	.LANCHOR0+144
	.fnend
	.size	es705_put_vad_sensitivity, .-es705_put_vad_sensitivity
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_rx_ns_value, %function
es705_put_rx_ns_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movw	r5, #:lower16:__stack_chk_guard
	movw	r4, #:lower16:.LANCHOR0
	strd	r6, [sp, #8]
	movt	r5, #:upper16:__stack_chk_guard
	movt	r4, #:upper16:.LANCHOR0
	str	r8, [sp, #16]
	ldr	ip, [r5]
	movw	r2, #:lower16:.LC99
	str	lr, [sp, #20]
	ldr	r6, [r1, #72]
	.pad #40
	sub	sp, sp, #40
	movw	r0, #:lower16:.LC10
	ldr	r1, [r4]
	movt	r2, #:upper16:.LC99
	ldr	r3, .L648
	movt	r0, #:upper16:.LC10
	str	r6, [sp]
	str	ip, [sp, #36]
	bl	dev_printk
	cmp	r6, #0
	bne	.L645
	ldr	lr, .L648+4
	movw	r8, #997
	mvn	r7, #0
	ldr	r0, [r4]
	mov	r2, #0
	mov	r3, #0
	str	r8, [sp]
	movw	r1, #:lower16:.LC21
	strd	r2, [sp, #20]
	movt	r1, #:upper16:.LC21
	mov	r3, #177
	ldr	r6, [lr, #1588]
	ldr	ip, [lr, #1596]
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	ip, ip
@ 0 "" 2
	.arm
	.syntax unified
	rsb	ip, ip, #32
	ldr	r2, .L648+8
	mvn	r7, r7, lsl ip
	strd	r6, [sp, #4]
	bl	_dev_info
	add	r0, sp, #20
	mov	r2, r6
	ldr	r1, .L648+12
	bl	memcpy
	cmp	r6, #4
	beq	.L641
	cmp	r6, #8
	beq	.L646
.L640:
	add	r1, sp, #20
	mov	r2, r6
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L648+16
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	ldr	r3, [r4, #56]
	add	r1, sp, #28
	mov	r2, r6
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	mov	r4, r0
	ldr	r0, .L648+16
	bl	mutex_unlock
.L637:
	ldr	r2, [sp, #36]
	mov	r0, r4
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L647
	add	sp, sp, #40
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L645:
	mov	r0, #996
	bl	es705_write.constprop.30
	mov	r4, r0
	b	.L637
.L646:
	ldr	r3, [sp, #24]
	and	r7, r7, r8
	orr	r7, r3, r7
	str	r7, [sp, #24]
	b	.L640
.L641:
	ldr	r3, [sp, #20]
	and	r7, r7, r8
	orr	r7, r3, r7
	str	r7, [sp, #20]
	b	.L640
.L647:
	bl	__stack_chk_fail
.L649:
	.align	2
.L648:
	.word	.LANCHOR2+1880
	.word	es705_api_access+4096
	.word	.LANCHOR2+432
	.word	es705_api_access+5676
	.word	.LANCHOR0+144
	.fnend
	.size	es705_put_rx_ns_value, .-es705_put_rx_ns_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_avalon_value, %function
es705_put_avalon_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movw	r5, #:lower16:__stack_chk_guard
	movw	r4, #:lower16:.LANCHOR0
	strd	r6, [sp, #8]
	movt	r5, #:upper16:__stack_chk_guard
	movt	r4, #:upper16:.LANCHOR0
	str	r8, [sp, #16]
	ldr	ip, [r5]
	movw	r2, #:lower16:.LC100
	str	lr, [sp, #20]
	ldr	r6, [r1, #72]
	.pad #40
	sub	sp, sp, #40
	movw	r0, #:lower16:.LC10
	ldr	r1, [r4]
	movt	r2, #:upper16:.LC100
	ldr	r3, .L661
	movt	r0, #:upper16:.LC10
	str	r6, [sp]
	str	ip, [sp, #36]
	bl	dev_printk
	cmp	r6, #0
	bne	.L658
	ldr	lr, .L661+4
	movw	r8, #705
	mvn	r7, #0
	ldr	r0, [r4]
	mov	r2, #0
	mov	r3, #0
	str	r8, [sp]
	movw	r1, #:lower16:.LC21
	strd	r2, [sp, #20]
	movt	r1, #:upper16:.LC21
	mov	r3, #177
	ldr	r6, [lr, #1588]
	ldr	ip, [lr, #1596]
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	ip, ip
@ 0 "" 2
	.arm
	.syntax unified
	rsb	ip, ip, #32
	ldr	r2, .L661+8
	mvn	r7, r7, lsl ip
	strd	r6, [sp, #4]
	bl	_dev_info
	add	r0, sp, #20
	mov	r2, r6
	ldr	r1, .L661+12
	bl	memcpy
	cmp	r6, #4
	beq	.L654
	cmp	r6, #8
	beq	.L659
.L653:
	add	r1, sp, #20
	mov	r2, r6
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L661+16
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	ldr	r3, [r4, #56]
	add	r1, sp, #28
	mov	r2, r6
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	mov	r4, r0
	ldr	r0, .L661+16
	bl	mutex_unlock
.L650:
	ldr	r2, [sp, #36]
	mov	r0, r4
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L660
	add	sp, sp, #40
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L658:
	mov	r0, #704
	bl	es705_write.constprop.30
	mov	r4, r0
	b	.L650
.L659:
	ldr	r3, [sp, #24]
	and	r7, r7, r8
	orr	r7, r3, r7
	str	r7, [sp, #24]
	b	.L653
.L654:
	ldr	r3, [sp, #20]
	and	r7, r7, r8
	orr	r7, r3, r7
	str	r7, [sp, #20]
	b	.L653
.L660:
	bl	__stack_chk_fail
.L662:
	.align	2
.L661:
	.word	.LANCHOR2+1904
	.word	es705_api_access+4096
	.word	.LANCHOR2+432
	.word	es705_api_access+5676
	.word	.LANCHOR0+144
	.fnend
	.size	es705_put_avalon_value, .-es705_put_avalon_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_sw_value, %function
es705_put_sw_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movw	r5, #:lower16:__stack_chk_guard
	movw	r4, #:lower16:.LANCHOR0
	strd	r6, [sp, #8]
	movt	r5, #:upper16:__stack_chk_guard
	movt	r4, #:upper16:.LANCHOR0
	str	r8, [sp, #16]
	ldr	ip, [r5]
	movw	r2, #:lower16:.LC101
	str	lr, [sp, #20]
	ldr	r6, [r1, #72]
	.pad #40
	sub	sp, sp, #40
	movw	r0, #:lower16:.LC10
	ldr	r1, [r4]
	movt	r2, #:upper16:.LC101
	ldr	r3, .L674
	movt	r0, #:upper16:.LC10
	str	r6, [sp]
	str	ip, [sp, #36]
	bl	dev_printk
	cmp	r6, #0
	bne	.L671
	ldr	lr, .L674+4
	movw	r8, #703
	mvn	r7, #0
	ldr	r0, [r4]
	mov	r2, #0
	mov	r3, #0
	str	r8, [sp]
	movw	r1, #:lower16:.LC21
	strd	r2, [sp, #20]
	movt	r1, #:upper16:.LC21
	mov	r3, #177
	ldr	r6, [lr, #1588]
	ldr	ip, [lr, #1596]
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	ip, ip
@ 0 "" 2
	.arm
	.syntax unified
	rsb	ip, ip, #32
	ldr	r2, .L674+8
	mvn	r7, r7, lsl ip
	strd	r6, [sp, #4]
	bl	_dev_info
	add	r0, sp, #20
	mov	r2, r6
	ldr	r1, .L674+12
	bl	memcpy
	cmp	r6, #4
	beq	.L667
	cmp	r6, #8
	beq	.L672
.L666:
	add	r1, sp, #20
	mov	r2, r6
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L674+16
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	ldr	r3, [r4, #56]
	add	r1, sp, #28
	mov	r2, r6
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	mov	r4, r0
	ldr	r0, .L674+16
	bl	mutex_unlock
.L663:
	ldr	r2, [sp, #36]
	mov	r0, r4
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L673
	add	sp, sp, #40
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L671:
	movw	r0, #702
	bl	es705_write.constprop.30
	mov	r4, r0
	b	.L663
.L672:
	ldr	r3, [sp, #24]
	and	r7, r7, r8
	orr	r7, r3, r7
	str	r7, [sp, #24]
	b	.L666
.L667:
	ldr	r3, [sp, #20]
	and	r7, r7, r8
	orr	r7, r3, r7
	str	r7, [sp, #20]
	b	.L666
.L673:
	bl	__stack_chk_fail
.L675:
	.align	2
.L674:
	.word	.LANCHOR2+1928
	.word	es705_api_access+4096
	.word	.LANCHOR2+432
	.word	es705_api_access+5676
	.word	.LANCHOR0+144
	.fnend
	.size	es705_put_sw_value, .-es705_put_sw_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_vbb_value, %function
es705_put_vbb_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movw	r5, #:lower16:__stack_chk_guard
	movw	r4, #:lower16:.LANCHOR0
	strd	r6, [sp, #8]
	movt	r5, #:upper16:__stack_chk_guard
	movt	r4, #:upper16:.LANCHOR0
	str	r8, [sp, #16]
	ldr	ip, [r5]
	movw	r2, #:lower16:.LC102
	str	lr, [sp, #20]
	ldr	r6, [r1, #72]
	.pad #40
	sub	sp, sp, #40
	movw	r0, #:lower16:.LC10
	ldr	r1, [r4]
	movt	r2, #:upper16:.LC102
	ldr	r3, .L687
	movt	r0, #:upper16:.LC10
	str	r6, [sp]
	str	ip, [sp, #36]
	bl	dev_printk
	cmp	r6, #0
	bne	.L684
	ldr	lr, .L687+4
	movw	r8, #707
	mvn	r7, #0
	ldr	r0, [r4]
	mov	r2, #0
	mov	r3, #0
	str	r8, [sp]
	movw	r1, #:lower16:.LC21
	strd	r2, [sp, #20]
	movt	r1, #:upper16:.LC21
	mov	r3, #177
	ldr	r6, [lr, #1588]
	ldr	ip, [lr, #1596]
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	ip, ip
@ 0 "" 2
	.arm
	.syntax unified
	rsb	ip, ip, #32
	ldr	r2, .L687+8
	mvn	r7, r7, lsl ip
	strd	r6, [sp, #4]
	bl	_dev_info
	add	r0, sp, #20
	mov	r2, r6
	ldr	r1, .L687+12
	bl	memcpy
	cmp	r6, #4
	beq	.L680
	cmp	r6, #8
	beq	.L685
.L679:
	add	r1, sp, #20
	mov	r2, r6
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L687+16
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	ldr	r3, [r4, #56]
	add	r1, sp, #28
	mov	r2, r6
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	mov	r4, r0
	ldr	r0, .L687+16
	bl	mutex_unlock
.L676:
	ldr	r2, [sp, #36]
	mov	r0, r4
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L686
	add	sp, sp, #40
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L684:
	movw	r0, #706
	bl	es705_write.constprop.30
	mov	r4, r0
	b	.L676
.L685:
	ldr	r3, [sp, #24]
	and	r7, r7, r8
	orr	r7, r3, r7
	str	r7, [sp, #24]
	b	.L679
.L680:
	ldr	r3, [sp, #20]
	and	r7, r7, r8
	orr	r7, r3, r7
	str	r7, [sp, #20]
	b	.L679
.L686:
	bl	__stack_chk_fail
.L688:
	.align	2
.L687:
	.word	.LANCHOR2+1948
	.word	es705_api_access+4096
	.word	.LANCHOR2+432
	.word	es705_api_access+5676
	.word	.LANCHOR0+144
	.fnend
	.size	es705_put_vbb_value, .-es705_put_vbb_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_sts_value, %function
es705_put_sts_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movw	r5, #:lower16:__stack_chk_guard
	movw	r4, #:lower16:.LANCHOR0
	strd	r6, [sp, #8]
	movt	r5, #:upper16:__stack_chk_guard
	movt	r4, #:upper16:.LANCHOR0
	str	r8, [sp, #16]
	ldr	ip, [r5]
	movw	r2, #:lower16:.LC103
	str	lr, [sp, #20]
	ldr	r6, [r1, #72]
	.pad #40
	sub	sp, sp, #40
	movw	r0, #:lower16:.LC10
	ldr	r1, [r4]
	movt	r2, #:upper16:.LC103
	ldr	r3, .L700
	movt	r0, #:upper16:.LC10
	str	r6, [sp]
	str	ip, [sp, #36]
	bl	dev_printk
	cmp	r6, #0
	bne	.L697
	ldr	lr, .L700+4
	movw	r8, #985
	mvn	r7, #0
	ldr	r0, [r4]
	mov	r2, #0
	mov	r3, #0
	str	r8, [sp]
	movw	r1, #:lower16:.LC21
	strd	r2, [sp, #20]
	movt	r1, #:upper16:.LC21
	mov	r3, #177
	ldr	r6, [lr, #1588]
	ldr	ip, [lr, #1596]
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	ip, ip
@ 0 "" 2
	.arm
	.syntax unified
	rsb	ip, ip, #32
	ldr	r2, .L700+8
	mvn	r7, r7, lsl ip
	strd	r6, [sp, #4]
	bl	_dev_info
	add	r0, sp, #20
	mov	r2, r6
	ldr	r1, .L700+12
	bl	memcpy
	cmp	r6, #4
	beq	.L693
	cmp	r6, #8
	beq	.L698
.L692:
	add	r1, sp, #20
	mov	r2, r6
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L700+16
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	ldr	r3, [r4, #56]
	add	r1, sp, #28
	mov	r2, r6
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	mov	r4, r0
	ldr	r0, .L700+16
	bl	mutex_unlock
.L689:
	ldr	r2, [sp, #36]
	mov	r0, r4
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L699
	add	sp, sp, #40
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L697:
	mov	r0, #984
	bl	es705_write.constprop.30
	mov	r4, r0
	b	.L689
.L698:
	ldr	r3, [sp, #24]
	and	r7, r7, r8
	orr	r7, r3, r7
	str	r7, [sp, #24]
	b	.L692
.L693:
	ldr	r3, [sp, #20]
	and	r7, r7, r8
	orr	r7, r3, r7
	str	r7, [sp, #20]
	b	.L692
.L699:
	bl	__stack_chk_fail
.L701:
	.align	2
.L700:
	.word	.LANCHOR2+1968
	.word	es705_api_access+4096
	.word	.LANCHOR2+432
	.word	es705_api_access+5676
	.word	.LANCHOR0+144
	.fnend
	.size	es705_put_sts_value, .-es705_put_sts_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_wnf_value, %function
es705_put_wnf_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movw	r5, #:lower16:__stack_chk_guard
	movw	r4, #:lower16:.LANCHOR0
	strd	r6, [sp, #8]
	movt	r5, #:upper16:__stack_chk_guard
	movt	r4, #:upper16:.LANCHOR0
	str	r8, [sp, #16]
	ldr	ip, [r5]
	movw	r2, #:lower16:.LC104
	str	lr, [sp, #20]
	ldr	r6, [r1, #72]
	.pad #40
	sub	sp, sp, #40
	movw	r0, #:lower16:.LC10
	ldr	r1, [r4]
	movt	r2, #:upper16:.LC104
	ldr	r3, .L713
	movt	r0, #:upper16:.LC10
	str	r6, [sp]
	str	ip, [sp, #36]
	bl	dev_printk
	cmp	r6, #0
	bne	.L710
	ldr	lr, .L713+4
	movw	r8, #995
	mvn	r7, #0
	ldr	r0, [r4]
	mov	r2, #0
	mov	r3, #0
	str	r8, [sp]
	movw	r1, #:lower16:.LC21
	strd	r2, [sp, #20]
	movt	r1, #:upper16:.LC21
	mov	r3, #177
	ldr	r6, [lr, #1588]
	ldr	ip, [lr, #1596]
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	ip, ip
@ 0 "" 2
	.arm
	.syntax unified
	rsb	ip, ip, #32
	ldr	r2, .L713+8
	mvn	r7, r7, lsl ip
	strd	r6, [sp, #4]
	bl	_dev_info
	add	r0, sp, #20
	mov	r2, r6
	ldr	r1, .L713+12
	bl	memcpy
	cmp	r6, #4
	beq	.L706
	cmp	r6, #8
	beq	.L711
.L705:
	add	r1, sp, #20
	mov	r2, r6
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L713+16
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	ldr	r3, [r4, #56]
	add	r1, sp, #28
	mov	r2, r6
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	mov	r4, r0
	ldr	r0, .L713+16
	bl	mutex_unlock
.L702:
	ldr	r2, [sp, #36]
	mov	r0, r4
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L712
	add	sp, sp, #40
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L710:
	movw	r0, #994
	bl	es705_write.constprop.30
	mov	r4, r0
	b	.L702
.L711:
	ldr	r3, [sp, #24]
	and	r7, r7, r8
	orr	r7, r3, r7
	str	r7, [sp, #24]
	b	.L705
.L706:
	ldr	r3, [sp, #20]
	and	r7, r7, r8
	orr	r7, r3, r7
	str	r7, [sp, #20]
	b	.L705
.L712:
	bl	__stack_chk_fail
.L714:
	.align	2
.L713:
	.word	.LANCHOR2+1988
	.word	es705_api_access+4096
	.word	.LANCHOR2+432
	.word	es705_api_access+5676
	.word	.LANCHOR0+144
	.fnend
	.size	es705_put_wnf_value, .-es705_put_wnf_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_ns_value, %function
es705_put_ns_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-20]!
	.save {r4, r5, r6, r7, lr}
	movw	r5, #:lower16:__stack_chk_guard
	movw	r4, #:lower16:.LANCHOR0
	strd	r6, [sp, #8]
	movt	r5, #:upper16:__stack_chk_guard
	movt	r4, #:upper16:.LANCHOR0
	str	lr, [sp, #16]
	ldr	r6, [r1, #72]
	.pad #44
	sub	sp, sp, #44
	ldr	ip, [r5]
	movw	r2, #:lower16:.LC13
	movw	r0, #:lower16:.LC10
	ldr	r1, [r4]
	movt	r2, #:upper16:.LC13
	movt	r0, #:upper16:.LC10
	ldr	r3, .L726
	str	r6, [sp]
	str	ip, [sp, #36]
	bl	dev_printk
	cmp	r6, #0
	str	r6, [r4, #588]
	bne	.L723
	ldr	ip, .L726+4
	mov	r1, #624
	mov	r2, #0
	mov	r3, #0
	ldr	r0, [r4]
	mvn	r7, #0
	str	r1, [sp]
	movw	r1, #:lower16:.LC21
	strd	r2, [sp, #20]
	movt	r1, #:upper16:.LC21
	mov	r3, #177
	ldr	r6, [ip, #1588]
	ldr	r2, [ip, #1596]
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r2, r2
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r2, r2, #32
	mvn	r7, r7, lsl r2
	ldr	r2, .L726+8
	strd	r6, [sp, #4]
	bl	_dev_info
	add	r0, sp, #20
	mov	r2, r6
	ldr	r1, .L726+12
	bl	memcpy
	cmp	r6, #4
	beq	.L719
	cmp	r6, #8
	beq	.L724
.L718:
	add	r1, sp, #20
	mov	r2, r6
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L726+16
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	ldr	r3, [r4, #56]
	add	r1, sp, #28
	mov	r2, r6
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	mov	r4, r0
	ldr	r0, .L726+16
	bl	mutex_unlock
.L715:
	ldr	r2, [sp, #36]
	mov	r0, r4
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L725
	add	sp, sp, #44
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
.L723:
	movw	r0, #969
	bl	es705_write.constprop.30
	mov	r4, r0
	b	.L715
.L724:
	ldr	r3, [sp, #24]
	and	r7, r7, #624
	orr	r7, r3, r7
	str	r7, [sp, #24]
	b	.L718
.L719:
	ldr	r3, [sp, #20]
	and	r7, r7, #624
	orr	r7, r3, r7
	str	r7, [sp, #20]
	b	.L718
.L725:
	bl	__stack_chk_fail
.L727:
	.align	2
.L726:
	.word	.LANCHOR2+2008
	.word	es705_api_access+4096
	.word	.LANCHOR2+432
	.word	es705_api_access+5676
	.word	.LANCHOR0+144
	.fnend
	.size	es705_put_ns_value, .-es705_put_ns_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_dereverb_gain_value, %function
es705_put_dereverb_gain_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r4, #:lower16:__stack_chk_guard
	strd	r6, [sp, #8]
	movt	r4, #:upper16:__stack_chk_guard
	strd	r8, [sp, #16]
	ldr	r3, [r4]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r5, [r1, #72]
	.pad #40
	sub	sp, sp, #40
	str	r3, [sp, #36]
	cmp	r5, #12
	movgt	r5, #0
	ble	.L738
.L728:
	ldr	r2, [sp, #36]
	mov	r0, r5
	ldr	r3, [r4]
	cmp	r2, r3
	bne	.L739
	add	sp, sp, #40
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L738:
	ldr	ip, [r0, #92]
	mov	r3, #0
	mov	r2, #0
	movw	r1, #258
	movw	r8, #:lower16:.LANCHOR0
	strd	r2, [sp, #20]
	movt	r8, #:upper16:.LANCHOR0
	sub	r6, r5, #12
	ldr	r0, [r8]
	ldr	r3, [ip, #12]
	cmp	r3, r1
	bhi	.L740
	lsl	r9, r3, #5
	movw	r10, #:lower16:es705_api_access
	str	r6, [sp]
	movt	r10, #:upper16:es705_api_access
	ldr	r2, .L741
	add	r1, r10, r9
	mvn	ip, #0
	ldr	r7, [r1, #20]
	ldr	r5, [r1, #28]
	movw	r1, #:lower16:.LC21
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r5, r5
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r5, r5, #32
	movt	r1, #:upper16:.LC21
	mvn	r5, ip, lsl r5
	str	r7, [sp, #4]
	str	r5, [sp, #8]
	bl	_dev_info
	add	r1, r9, #12
	mov	r2, r7
	add	r1, r10, r1
	add	r0, sp, #20
	bl	memcpy
	cmp	r7, #4
	beq	.L733
	cmp	r7, #8
	bne	.L732
	ldr	r3, [sp, #24]
	and	r5, r5, r6
	orr	r5, r3, r5
	str	r5, [sp, #24]
.L732:
	mov	r2, r7
	add	r1, sp, #20
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L741+4
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	add	r1, sp, #28
	ldr	r3, [r8, #56]
	mov	r2, r7
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	mov	r5, r0
	ldr	r0, .L741+4
	bl	mutex_unlock
	b	.L728
.L733:
	ldr	r3, [sp, #20]
	and	r5, r5, r6
	orr	r5, r3, r5
	str	r5, [sp, #20]
	b	.L732
.L740:
	movw	r1, #:lower16:.LC20
	ldr	r2, .L741
	mvn	r5, #21
	movt	r1, #:upper16:.LC20
	bl	dev_err
	b	.L728
.L739:
	bl	__stack_chk_fail
.L742:
	.align	2
.L741:
	.word	.LANCHOR2+432
	.word	.LANCHOR0+144
	.fnend
	.size	es705_put_dereverb_gain_value, .-es705_put_dereverb_gain_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_bwe_max_snr_value, %function
es705_put_bwe_max_snr_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r4, #:lower16:__stack_chk_guard
	strd	r6, [sp, #8]
	movt	r4, #:upper16:__stack_chk_guard
	strd	r8, [sp, #16]
	ldr	r3, [r4]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r5, [r1, #72]
	.pad #40
	sub	sp, sp, #40
	str	r3, [sp, #36]
	cmp	r5, #70
	ble	.L752
.L744:
	ldr	r2, [sp, #36]
	mov	r0, #0
	ldr	r3, [r4]
	cmp	r2, r3
	bne	.L753
	add	sp, sp, #40
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L752:
	ldr	ip, [r0, #92]
	mov	r3, #0
	mov	r2, #0
	movw	r1, #258
	movw	r8, #:lower16:.LANCHOR0
	strd	r2, [sp, #20]
	movt	r8, #:upper16:.LANCHOR0
	sub	r6, r5, #20
	ldr	r0, [r8]
	ldr	r3, [ip, #12]
	cmp	r3, r1
	bhi	.L754
	lsl	r9, r3, #5
	movw	r10, #:lower16:es705_api_access
	str	r6, [sp]
	movt	r10, #:upper16:es705_api_access
	ldr	r2, .L755
	add	r1, r10, r9
	mvn	ip, #0
	ldr	r7, [r1, #20]
	ldr	r5, [r1, #28]
	movw	r1, #:lower16:.LC21
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r5, r5
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r5, r5, #32
	movt	r1, #:upper16:.LC21
	mvn	r5, ip, lsl r5
	str	r7, [sp, #4]
	str	r5, [sp, #8]
	bl	_dev_info
	add	r1, r9, #12
	mov	r2, r7
	add	r1, r10, r1
	add	r0, sp, #20
	bl	memcpy
	cmp	r7, #4
	beq	.L748
	cmp	r7, #8
	bne	.L747
	ldr	r3, [sp, #24]
	and	r5, r5, r6
	orr	r5, r3, r5
	str	r5, [sp, #24]
.L747:
	mov	r2, r7
	add	r1, sp, #20
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L755+4
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	add	r1, sp, #28
	ldr	r3, [r8, #56]
	mov	r2, r7
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	ldr	r0, .L755+4
	bl	mutex_unlock
	b	.L744
.L748:
	ldr	r3, [sp, #20]
	and	r5, r5, r6
	orr	r5, r3, r5
	str	r5, [sp, #20]
	b	.L747
.L754:
	movw	r1, #:lower16:.LC20
	ldr	r2, .L755
	movt	r1, #:upper16:.LC20
	bl	dev_err
	b	.L744
.L753:
	bl	__stack_chk_fail
.L756:
	.align	2
.L755:
	.word	.LANCHOR2+432
	.word	.LANCHOR0+144
	.fnend
	.size	es705_put_bwe_max_snr_value, .-es705_put_bwe_max_snr_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_bwe_high_band_gain_value, %function
es705_put_bwe_high_band_gain_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-32]!
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r4, #:lower16:__stack_chk_guard
	strd	r6, [sp, #8]
	movt	r4, #:upper16:__stack_chk_guard
	strd	r8, [sp, #16]
	ldr	r3, [r4]
	str	r10, [sp, #24]
	str	lr, [sp, #28]
	ldr	r5, [r1, #72]
	.pad #40
	sub	sp, sp, #40
	str	r3, [sp, #36]
	cmp	r5, #30
	ble	.L766
.L758:
	ldr	r2, [sp, #36]
	mov	r0, #0
	ldr	r3, [r4]
	cmp	r2, r3
	bne	.L767
	add	sp, sp, #40
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldr	r10, [sp, #24]
	add	sp, sp, #28
	ldr	pc, [sp], #4
.L766:
	ldr	ip, [r0, #92]
	mov	r3, #0
	mov	r2, #0
	movw	r1, #258
	movw	r8, #:lower16:.LANCHOR0
	strd	r2, [sp, #20]
	movt	r8, #:upper16:.LANCHOR0
	sub	r6, r5, #10
	ldr	r0, [r8]
	ldr	r3, [ip, #12]
	cmp	r3, r1
	bhi	.L768
	lsl	r9, r3, #5
	movw	r10, #:lower16:es705_api_access
	str	r6, [sp]
	movt	r10, #:upper16:es705_api_access
	ldr	r2, .L769
	add	r1, r10, r9
	mvn	ip, #0
	ldr	r7, [r1, #20]
	ldr	r5, [r1, #28]
	movw	r1, #:lower16:.LC21
	.syntax divided
@ 268 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/bitops.h" 1
	clz	r5, r5
@ 0 "" 2
	.arm
	.syntax unified
	rsb	r5, r5, #32
	movt	r1, #:upper16:.LC21
	mvn	r5, ip, lsl r5
	str	r7, [sp, #4]
	str	r5, [sp, #8]
	bl	_dev_info
	add	r1, r9, #12
	mov	r2, r7
	add	r1, r10, r1
	add	r0, sp, #20
	bl	memcpy
	cmp	r7, #4
	beq	.L762
	cmp	r7, #8
	bne	.L761
	ldr	r3, [sp, #24]
	and	r5, r5, r6
	orr	r5, r3, r5
	str	r5, [sp, #24]
.L761:
	mov	r2, r7
	add	r1, sp, #20
	add	r0, sp, #28
	bl	memcpy
	ldr	r0, .L769+4
	bl	mutex_lock
	movw	r0, #:lower16:.LANCHOR0
	add	r1, sp, #28
	ldr	r3, [r8, #56]
	mov	r2, r7
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	ldr	r0, .L769+4
	bl	mutex_unlock
	b	.L758
.L762:
	ldr	r3, [sp, #20]
	and	r5, r5, r6
	orr	r5, r3, r5
	str	r5, [sp, #20]
	b	.L761
.L768:
	movw	r1, #:lower16:.LC20
	ldr	r2, .L769
	movt	r1, #:upper16:.LC20
	bl	dev_err
	b	.L758
.L767:
	bl	__stack_chk_fail
.L770:
	.align	2
.L769:
	.word	.LANCHOR2+432
	.word	.LANCHOR0+144
	.fnend
	.size	es705_put_bwe_high_band_gain_value, .-es705_put_bwe_high_band_gain_value
	.align	2
	.global	es705_write_block
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_write_block, %function
es705_write_block:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r1
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	add	r9, r0, #144
	strd	r10, [sp, #24]
	mov	r0, r9
	str	lr, [sp, #32]
	.pad #28
	sub	sp, sp, #28
	bl	mutex_lock
	ldr	r3, [r5]
	cmn	r3, #1
	beq	.L772
	ldr	r7, .L782
	movw	r8, #:lower16:.LANCHOR0
	movw	r6, #:lower16:.LC87
	movt	r8, #:upper16:.LANCHOR0
	movt	r6, #:upper16:.LC87
.L775:
	add	r1, sp, #20
	str	r3, [sp, #20]
	mov	r2, #4
	ldr	r3, [r4, #56]
	mov	r0, r4
	blx	r3
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	mov	r1, #1000
	mov	r0, r1
	cmp	r3, #144
	bne	.L773
	ldrb	r3, [sp, #22]	@ zero_extendqisi2
	cmp	r3, #49
	beq	.L781
.L773:
	bl	usleep_range
.L774:
	ldrb	fp, [sp, #20]	@ zero_extendqisi2
	movw	r0, #:lower16:.LC10
	mov	r3, r7
	ldrb	r10, [sp, #21]	@ zero_extendqisi2
	movt	r0, #:upper16:.LC10
	mov	r2, r6
	ldrb	lr, [sp, #22]	@ zero_extendqisi2
	ldrb	ip, [sp, #23]	@ zero_extendqisi2
	ldr	r1, [r4]
	stm	sp, {ip, lr}
	strd	r10, [sp, #8]
	bl	dev_printk
	ldr	r3, [r5, #4]!
	cmn	r3, #1
	bne	.L775
.L772:
	mov	r0, r9
	bl	mutex_unlock
	mov	r0, #0
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L781:
	ldr	r3, [r8, #1516]
	mul	r1, r1, r3
	mov	r0, r1
	bl	usleep_range
	b	.L774
.L783:
	.align	2
.L782:
	.word	.LANCHOR2+1060
	.fnend
	.size	es705_write_block, .-es705_write_block
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_switch_route_config, %function
es705_switch_route_config:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	cmp	r0, #27
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	ip, [r4]
	.pad #8
	sub	sp, sp, #8
	bhi	.L795
	sub	r2, r0, #2
	mov	r3, #0
	bics	r2, r2, #2
	str	r3, [r4, #1408]
	bne	.L786
	mvn	r2, #0
	mov	r3, #1
	str	r2, [r4, #1412]
.L786:
	movw	r2, #:lower16:.LANCHOR1
	str	r3, [r4, #1416]
	mov	r5, r0
	movt	r2, #:upper16:.LANCHOR1
	ldr	r3, [r2]
	cmp	r3, #1
	beq	.L796
	cmp	r3, #0
	bne	.L793
	sub	r6, r0, #21
	cmp	r6, #4
	bls	.L797
.L793:
	mov	r6, r5
.L788:
	ldr	lr, [r4, #1148]
	movw	r1, #:lower16:.LC108
	mov	r3, r5
	mov	r0, ip
	ldr	r2, .L798
	movt	r1, #:upper16:.LC108
	movw	r5, #:lower16:.LANCHOR2
	movt	r5, #:upper16:.LANCHOR2
	stm	sp, {r6, lr}
	bl	_dev_info
	ldr	r3, [r4, #1148]
	cmp	r3, r6
	beq	.L784
	add	r5, r5, r6, lsl #2
	movw	r0, #:lower16:.LANCHOR0
	str	r6, [r4, #1148]
	movt	r0, #:upper16:.LANCHOR0
	ldr	r1, [r5, #2056]
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	es705_write_block
.L796:
	cmp	r0, #4
	bhi	.L793
	movw	r2, #:lower16:.LC106
	movw	r0, #:lower16:.LC10
	ldr	r3, .L798
	mov	r1, ip
	movt	r2, #:upper16:.LC106
	movt	r0, #:upper16:.LC10
	add	r6, r5, #21
	bl	dev_printk
	ldr	ip, [r4]
	b	.L788
.L784:
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L795:
	ldr	r2, .L798
	movw	r1, #:lower16:.LC105
	mov	r3, r0
	movt	r1, #:upper16:.LC105
	mov	r0, ip
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	ldr	lr, [sp, #12]
	add	sp, sp, #16
	b	dev_err
.L797:
	movw	r2, #:lower16:.LC107
	movw	r0, #:lower16:.LC10
	ldr	r3, .L798
	mov	r1, ip
	movt	r2, #:upper16:.LC107
	movt	r0, #:upper16:.LC10
	bl	dev_printk
	ldr	ip, [r4]
	b	.L788
.L799:
	.align	2
.L798:
	.word	.LANCHOR2+2028
	.fnend
	.size	es705_switch_route_config, .-es705_switch_route_config
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_network_type, %function
es705_put_network_type:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	mov	r5, r1
	movt	r4, #:upper16:.LANCHOR0
	str	lr, [sp, #8]
	.pad #12
	sub	sp, sp, #12
	ldr	r3, [r1, #72]
	movw	r1, #:lower16:.LC109
	ldr	ip, [r4, #584]
	movt	r1, #:upper16:.LC109
	ldr	r2, .L804
	ldr	r0, [r4]
	str	ip, [sp]
	bl	_dev_info
	ldr	r2, [r5, #72]
	movw	r3, #:lower16:.LANCHOR1
	add	r0, r4, #560
	movt	r3, #:upper16:.LANCHOR1
	sub	r2, r2, #1
	clz	r2, r2
	lsr	r2, r2, #5
	str	r2, [r3]
	bl	mutex_lock
	ldr	r3, [r4, #584]
	cmp	r3, #3
	beq	.L803
.L801:
	ldr	r0, .L804+4
	bl	mutex_unlock
	mov	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L803:
	ldr	r0, [r4, #1148]
	bl	es705_switch_route_config
	b	.L801
.L805:
	.align	2
.L804:
	.word	.LANCHOR2+2168
	.word	.LANCHOR0+560
	.fnend
	.size	es705_put_network_type, .-es705_put_network_type
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_voice_lpm_enable_value, %function
es705_put_voice_lpm_enable_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	str	lr, [sp, #8]
	ldr	ip, [r1, #72]
	ldr	r0, [r4]
	.pad #12
	sub	sp, sp, #12
	ldr	r3, [r4, #1388]
	cmp	r3, ip
	beq	.L814
	movw	r1, #:lower16:.LC9
	mov	r3, ip
	ldr	r2, .L817
	movt	r1, #:upper16:.LC9
	str	ip, [r4, #1388]
	bl	_dev_info
	ldr	r3, [r4, #1380]
	cmp	r3, #0
	beq	.L815
	ldr	r2, [r4, #1388]
	cmp	r2, #0
	beq	.L810
	mov	r1, #174
	mov	r0, #6
	blx	r3
	mov	r0, #0
.L806:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L814:
	movw	r1, #:lower16:.LC110
	ldr	r2, .L817
	str	r3, [sp]
	movt	r1, #:upper16:.LC110
	bl	_dev_info
	mov	r0, #0
	b	.L806
.L810:
	ldr	r2, [r4, #1172]
	cmp	r2, #6
	bne	.L812
	mov	r1, #174
	mov	r0, #5
	blx	r3
	ldr	r3, [r4, #1384]
	cmp	r3, #0
	beq	.L816
.L812:
	mov	r0, #0
	b	.L806
.L816:
	mov	r0, #5
	bl	es705_switch_route_config
	ldr	r3, [r4, #1380]
	mov	r1, #174
	mov	r0, #4
	blx	r3
	ldr	r3, [r4, #1156]
	cmp	r3, #0
	bne	.L812
	ldr	r3, [r4, #1164]
	cmp	r3, #0
	bne	.L812
	ldr	r3, [r4, #1160]
	cmp	r3, #0
	bne	.L812
	ldr	r5, [r4, #1384]
	cmp	r5, #0
	bne	.L812
	mov	r1, #174
	mov	r0, #1
	ldr	r3, [r4, #1380]
	blx	r3
	mov	r0, r5
	b	.L806
.L815:
	movw	r1, #:lower16:.LC111
	ldr	r2, .L817
	movt	r1, #:upper16:.LC111
	ldr	r0, [r4]
	bl	dev_err
	mvn	r0, #18
	b	.L806
.L818:
	.align	2
.L817:
	.word	.LANCHOR2+2192
	.fnend
	.size	es705_put_voice_lpm_enable_value, .-es705_put_voice_lpm_enable_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_audio_custom_profile, %function
es705_put_audio_custom_profile:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r1, #72]
	cmp	r3, #3
	ble	.L825
	mov	r0, #0
	bx	lr
.L825:
	ldr	r1, .L826
	add	r3, r3, r3, lsl #2
	.save {r4, lr}
	str	r4, [sp, #-8]!
	str	lr, [sp, #4]
	sub	r0, r1, #2336
	add	r1, r1, r3, lsl #4
	bl	es705_write_block
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, #0
	ldr	pc, [sp], #4
.L827:
	.align	2
.L826:
	.word	.LANCHOR0+2336
	.fnend
	.size	es705_put_audio_custom_profile, .-es705_put_audio_custom_profile
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_internal_route, %function
es705_put_internal_route:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR0
	ldr	r2, .L833
	str	r6, [sp, #8]
	movt	r4, #:upper16:.LANCHOR0
	mov	r6, r1
	movw	r1, #:lower16:.LC112
	str	lr, [sp, #12]
	ldr	r0, [r4]
	movt	r1, #:upper16:.LC112
	ldr	r3, [r6, #72]
	.pad #8
	sub	sp, sp, #8
	bl	_dev_info
	ldr	r6, [r6, #72]
	movw	r5, #:lower16:.LANCHOR2
	movt	r5, #:upper16:.LANCHOR2
	ldr	r1, [r4]
	cmp	r6, #28
	bgt	.L832
	ldr	ip, [r4, #1148]
	movw	r2, #:lower16:.LC113
	movw	r0, #:lower16:.LC10
	add	r3, r5, #2256
	movt	r2, #:upper16:.LC113
	movt	r0, #:upper16:.LC10
	str	ip, [sp]
	str	r6, [sp, #4]
	bl	dev_printk
	add	r3, r6, r6, lsl #2
	mov	r0, r4
	str	r6, [r4, #1148]
	add	r5, r5, r3, lsl #2
	ldr	r1, [r5, #1168]
	bl	es705_write_block
.L830:
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L832:
	movw	r2, #:lower16:.LC105
	movw	r0, #:lower16:.LC10
	str	r6, [sp]
	add	r3, r5, #2256
	movt	r2, #:upper16:.LC105
	movt	r0, #:upper16:.LC10
	bl	dev_printk
	b	.L830
.L834:
	.align	2
.L833:
	.word	.LANCHOR2+2228
	.fnend
	.size	es705_put_internal_route, .-es705_put_internal_route
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_internal_route_config, %function
es705_put_internal_route_config:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR0
	str	r6, [sp, #8]
	movt	r4, #:upper16:.LANCHOR0
	str	lr, [sp, #12]
	ldr	r5, [r1, #72]
	.pad #8
	sub	sp, sp, #8
	ldr	ip, [r4]
	cmp	r5, #27
	bhi	.L846
	sub	r2, r5, #2
	mov	r3, #0
	bics	r2, r2, #2
	str	r3, [r4, #1408]
	bne	.L838
	mvn	r2, #0
	mov	r3, #1
	str	r2, [r4, #1412]
.L838:
	movw	r2, #:lower16:.LANCHOR1
	str	r3, [r4, #1416]
	movt	r2, #:upper16:.LANCHOR1
	ldr	r3, [r2]
	cmp	r3, #1
	beq	.L847
	cmp	r3, #0
	bne	.L844
	sub	r6, r5, #21
	cmp	r6, #4
	bls	.L848
.L844:
	mov	r6, r5
.L840:
	ldr	lr, [r4, #1148]
	movw	r1, #:lower16:.LC108
	mov	r3, r5
	mov	r0, ip
	ldr	r2, .L849
	movt	r1, #:upper16:.LC108
	movw	r5, #:lower16:.LANCHOR2
	movt	r5, #:upper16:.LANCHOR2
	stm	sp, {r6, lr}
	bl	_dev_info
	ldr	r3, [r4, #1148]
	cmp	r6, r3
	beq	.L837
	add	r5, r5, r6, lsl #2
	movw	r0, #:lower16:.LANCHOR0
	str	r6, [r4, #1148]
	movt	r0, #:upper16:.LANCHOR0
	ldr	r1, [r5, #2056]
	bl	es705_write_block
.L837:
	mov	r0, #0
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L847:
	cmp	r5, #4
	bhi	.L844
	movw	r2, #:lower16:.LC106
	movw	r0, #:lower16:.LC10
	ldr	r3, .L849
	mov	r1, ip
	movt	r2, #:upper16:.LC106
	movt	r0, #:upper16:.LC10
	add	r6, r5, #21
	bl	dev_printk
	ldr	ip, [r4]
	b	.L840
.L846:
	movw	r1, #:lower16:.LC105
	mov	r3, r5
	ldr	r2, .L849
	mov	r0, ip
	movt	r1, #:upper16:.LC105
	bl	dev_err
	b	.L837
.L848:
	movw	r2, #:lower16:.LC107
	movw	r0, #:lower16:.LC10
	ldr	r3, .L849
	mov	r1, ip
	movt	r2, #:upper16:.LC107
	movt	r0, #:upper16:.LC10
	bl	dev_printk
	ldr	ip, [r4]
	b	.L840
.L850:
	.align	2
.L849:
	.word	.LANCHOR2+2028
	.fnend
	.size	es705_put_internal_route_config, .-es705_put_internal_route_config
	.align	2
	.global	es705_read_vs_data_block
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_read_vs_data_block, %function
es705_read_vs_data_block:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	mov	r3, #8
	strd	r6, [sp, #8]
	mov	r0, #0
	add	r6, r4, #632
	strd	r8, [sp, #16]
	movt	r3, 32814
	add	r8, r4, #144
	strd	r10, [sp, #24]
	mov	r9, r1
	mov	r10, r2
	str	lr, [sp, #32]
	.pad #20
	sub	sp, sp, #20
	strh	r0, [r6]	@ movhi
	mov	r0, r8
	str	r3, [sp, #8]
	bl	mutex_lock
	ldr	r3, [r4, #88]
	cmp	r3, #0
	beq	.L853
	mov	r0, r4
	blx	r3
	subs	r5, r0, #0
	blt	.L886
	ldr	r3, [r4, #88]
	cmp	r3, #0
	beq	.L853
	ldr	r3, [sp, #8]
	.syntax divided
@ 38 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/swab.h" 1
	rev r3, r3
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [sp, #8]
.L853:
	mov	r2, #4
	add	r1, sp, #8
	ldr	r3, [r4, #100]
	mov	r0, r4
	blx	r3
	add	r1, sp, #12
	mov	r2, #4
	ldr	r3, [r4, #96]
	mov	r0, r4
	blx	r3
	subs	r5, r0, #0
	blt	.L887
	ldr	r2, [r4, #88]
	ldr	r3, [sp, #12]
	cmp	r2, #0
	beq	.L859
	.syntax divided
@ 38 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/swab.h" 1
	rev r3, r3
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [sp, #12]
.L859:
	lsr	r2, r3, #16
	mov	r1, #0
	ldr	ip, [r4]
	movt	r1, 32814
	lsl	r2, r2, #16
	cmp	r2, r1
	beq	.L860
	movw	r1, #:lower16:.LC116
	ldr	r2, .L891
	mov	r0, ip
	movt	r1, #:upper16:.LC116
	bl	dev_err
	ldr	r3, [r4, #92]
	cmp	r3, #0
	beq	.L885
.L873:
	mov	r0, r4
	blx	r3
.L885:
	mov	r0, r8
	bl	mutex_unlock
.L851:
	mov	r0, r5
	add	sp, sp, #20
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L860:
	uxth	r7, r3
	movw	r2, #:lower16:.LC117
	movw	r0, #:lower16:.LC10
	mov	r1, ip
	movt	r2, #:upper16:.LC117
	stm	sp, {r3, r7}
	movt	r0, #:upper16:.LC10
	ldr	r3, .L891
	bl	dev_printk
	cmp	r7, #0
	beq	.L888
	cmp	r7, r10
	bhi	.L864
	ldrh	ip, [r6]
	cmp	r7, ip
	bls	.L866
	movw	fp, #:lower16:.LC119
	movw	r10, #:lower16:.LC10
	movt	fp, #:upper16:.LC119
	movt	r10, #:upper16:.LC10
	mov	r2, ip
	b	.L865
.L869:
	ldrh	ip, [r6]
	mov	r2, fp
	str	r5, [sp]
	ldr	r3, .L891
	mov	r0, r10
	add	ip, ip, r5
	strh	ip, [r6]	@ movhi
	bl	dev_printk
	ldrh	r2, [r6]
	cmp	r2, r7
	bcs	.L889
.L865:
	ldr	r0, [r4, #88]
	add	r1, r9, r2
	ldr	r3, [r4, #96]
	cmp	r0, #0
	mov	r0, r4
	subne	r2, r7, r2
	moveq	r2, #4
	blx	r3
	cmp	r0, #0
	mov	r5, r0
	ldr	r1, [r4]
	bge	.L869
	movw	r2, #:lower16:.LC118
	movw	r0, #:lower16:.LC10
	ldr	r3, .L891
	movt	r2, #:upper16:.LC118
	movt	r0, #:upper16:.LC10
	bl	dev_printk
	mov	r3, #0
	strh	r3, [r6]	@ movhi
.L858:
	ldr	r3, [r4, #92]
	cmp	r3, #0
	bne	.L890
.L884:
	mov	r0, r8
	bl	mutex_unlock
	b	.L855
.L886:
	movw	r1, #:lower16:.LC114
	ldr	r2, .L891
	movt	r1, #:upper16:.LC114
	ldr	r0, [r4]
	bl	dev_err
	mov	r0, r8
	bl	mutex_unlock
.L855:
	movw	r1, #:lower16:.LC120
	mov	r3, r5
	ldr	r2, .L891
	movt	r1, #:upper16:.LC120
	ldr	r0, [r4]
	bl	dev_err
	b	.L851
.L887:
	movw	r2, #:lower16:.LC115
	movw	r0, #:lower16:.LC10
	ldr	r1, [r4]
	movt	r2, #:upper16:.LC115
	ldr	r3, .L891
	str	r5, [sp]
	movt	r0, #:upper16:.LC10
	bl	dev_printk
	b	.L858
.L889:
	mov	ip, r2
.L866:
	movw	r2, #:lower16:.LC121
	movw	r0, #:lower16:.LC10
	ldr	r3, .L891
	ldr	r1, [r4]
	movt	r2, #:upper16:.LC121
	movt	r0, #:upper16:.LC10
	str	ip, [sp]
	bl	dev_printk
	ldr	r3, [r4, #92]
	cmp	r3, #0
	bne	.L873
	b	.L885
.L888:
	.syntax divided
@ 314 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 314, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L864:
	.syntax divided
@ 315 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 315, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L890:
	mov	r0, r4
	blx	r3
	b	.L884
.L892:
	.align	2
.L891:
	.word	.LANCHOR2+2276
	.fnend
	.size	es705_read_vs_data_block, .-es705_read_vs_data_block
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_vs_make_external_dump, %function
es705_put_vs_make_external_dump:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r3, #:lower16:.LANCHOR2
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	ip, #57401
	movt	r3, #:upper16:.LANCHOR2
	strd	r6, [sp, #8]
	movw	r4, #:lower16:.LANCHOR0
	add	r1, r3, #2304
	ldr	r3, [r3, #2312]
	movt	ip, 32790
	ldrd	r6, [r1]
	movt	r4, #:upper16:.LANCHOR0
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	movw	r1, #:lower16:.LC122
	ldr	r2, .L913
	str	lr, [sp, #32]
	.pad #52
	sub	sp, sp, #52
	movt	r1, #:upper16:.LC122
	ldr	r0, [r4]
	str	ip, [sp, #24]
	strd	r6, [sp, #36]
	str	r3, [sp, #44]
	bl	_dev_info
	mov	r1, #255
	mov	r2, #1
	ldr	r5, [r4, #60]
	movt	r1, 32790
	add	r3, sp, #48
	str	r2, [sp]
	mov	r0, r4
	mov	r2, #4
	str	r1, [r3, #-20]!
	add	r1, sp, #24
	blx	r5
	cmp	r0, #0
	beq	.L894
	movw	r1, #:lower16:.LC123
	ldr	r2, .L913
	movt	r1, #:upper16:.LC123
	ldr	r0, [r4]
	ldr	r3, [sp, #28]
	bl	dev_err
.L895:
	mov	r5, #57344
	mov	r3, sp
	movt	r5, 65535
	mov	r0, #0
	and	r3, r3, r5
	mov	r2, #4
	ldr	ip, [r3, #8]
	mov	r1, #208
	str	r0, [r3, #8]
	mov	r0, #65536
	str	ip, [sp, #20]
	bl	kmalloc_order_trace
	subs	r3, r0, #0
	str	r3, [sp, #16]
	beq	.L910
	movw	r0, #:lower16:.LC126
	mov	r2, #448
	movt	r0, #:upper16:.LC126
	mov	r1, #66
	bl	filp_open
	subs	r9, r0, #0
	beq	.L911
	ldr	r0, .L913+4
	bl	mutex_lock
	ldr	r3, [sp, #36]
	cmn	r3, #1
	beq	.L900
	ldr	r8, .L913+8
	movw	r7, #:lower16:.LANCHOR0
	movw	r6, #:lower16:.LC87
	add	r5, sp, #36
	movt	r7, #:upper16:.LANCHOR0
	movt	r6, #:upper16:.LC87
.L903:
	add	r1, sp, #32
	str	r3, [sp, #32]
	mov	r2, #4
	ldr	r3, [r4, #56]
	mov	r0, r7
	blx	r3
	ldrb	r3, [sp, #35]	@ zero_extendqisi2
	mov	r1, #1000
	mov	r0, r1
	cmp	r3, #144
	bne	.L901
	ldrb	r3, [sp, #34]	@ zero_extendqisi2
	cmp	r3, #49
	beq	.L912
.L901:
	bl	usleep_range
.L902:
	ldrb	fp, [sp, #32]	@ zero_extendqisi2
	movw	r0, #:lower16:.LC10
	mov	r3, r8
	ldrb	r10, [sp, #33]	@ zero_extendqisi2
	movt	r0, #:upper16:.LC10
	mov	r2, r6
	ldrb	lr, [sp, #34]	@ zero_extendqisi2
	ldrb	ip, [sp, #35]	@ zero_extendqisi2
	ldr	r1, [r4]
	stm	sp, {ip, lr}
	strd	r10, [sp, #8]
	bl	dev_printk
	ldr	r3, [r5, #4]!
	cmn	r3, #1
	bne	.L903
.L900:
	ldr	r5, .L913+12
	mov	r10, #0
	mov	fp, #0
	mov	r6, #0
	sub	r0, r5, #488
	bl	mutex_unlock
	ldr	r7, [sp, #16]
	movw	r0, #:lower16:.LANCHOR0
	mov	r2, #65536
	movt	r0, #:upper16:.LANCHOR0
	mov	r1, r7
	bl	es705_read_vs_data_block
	ldrh	ip, [r5]
	movw	r1, #:lower16:.LC128
	ldr	r3, [r9, #40]
	movt	r1, #:upper16:.LC128
	ldr	r2, .L913
	ldr	r0, [r4]
	str	ip, [sp]
	bl	_dev_info
	mov	r3, r9
	mov	r1, r7
	mov	r0, r9
	strd	r10, [r3, #40]!
	ldrh	r2, [r5]
	bl	vfs_write
	mov	r0, r9
	mov	r1, r6
	bl	filp_close
.L899:
	ldr	r0, [sp, #16]
	bl	kfree
.L897:
	mov	r3, sp
	ldr	r2, [sp, #20]
	mov	r0, r6
	bic	r3, r3, #8128
	bic	r3, r3, #63
	str	r2, [r3, #8]
	add	sp, sp, #52
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L912:
	ldr	r3, [r4, #1516]
	mul	r1, r1, r3
	mov	r0, r1
	bl	usleep_range
	b	.L902
.L894:
	movw	r1, #:lower16:.LC124
	ldr	r2, .L913
	movt	r1, #:upper16:.LC124
	ldr	r0, [r4]
	ldr	r3, [sp, #28]
	bl	_dev_info
	b	.L895
.L910:
	movw	r1, #:lower16:.LC125
	ldr	r2, .L913
	mvn	r6, #11
	movt	r1, #:upper16:.LC125
	ldr	r0, [r4]
	bl	dev_err
	b	.L897
.L911:
	movw	r1, #:lower16:.LC127
	ldr	r2, .L913
	mvn	r6, #1
	movt	r1, #:upper16:.LC127
	ldr	r0, [r4]
	bl	dev_err
	mov	r3, sp
	and	r5, r5, r3
	ldr	r3, [sp, #20]
	str	r3, [r5, #8]
	b	.L899
.L914:
	.align	2
.L913:
	.word	.LANCHOR2+2316
	.word	.LANCHOR0+144
	.word	.LANCHOR2+1060
	.word	.LANCHOR0+632
	.fnend
	.size	es705_put_vs_make_external_dump, .-es705_put_vs_make_external_dump
	.align	2
	.global	es705_write_vs_data_block
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_write_vs_data_block, %function
es705_write_vs_data_block:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	r3, r0, #632
	mov	r4, r0
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	.pad #44
	sub	sp, sp, #44
	str	r3, [sp, #12]
	ldrh	r3, [r3]
	cmp	r3, #0
	beq	.L956
	ands	r6, r3, #3
	bne	.L957
	add	r3, r0, #144
	mov	r0, r3
	str	r3, [sp, #16]
	bl	mutex_lock
	ldr	r3, [sp, #12]
	ldrh	r7, [r3]
	lsrs	r5, r7, #9
	moveq	r6, r5
	bne	.L958
.L919:
	subs	r7, r7, r5, lsl #9
	bne	.L959
.L937:
	movw	r2, #:lower16:.LC139
	movw	r0, #:lower16:.LC10
	ldr	r3, .L965
	movt	r2, #:upper16:.LC139
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	bl	dev_printk
.L926:
	ldr	r0, [sp, #16]
	bl	mutex_unlock
.L915:
	mov	r0, r6
	add	sp, sp, #44
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L958:
	mov	r3, #512
	mov	r7, #512
	str	r6, [sp, #20]
	movt	r3, 32815
.L938:
	ldr	r2, [r4, #88]
	str	r3, [sp, #28]
	cmp	r2, #0
	beq	.L920
	.syntax divided
@ 38 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/swab.h" 1
	rev r3, r3
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [sp, #28]
.L920:
	mov	r2, #4
	add	r1, sp, #28
	ldr	r3, [r4, #100]
	mov	r0, r4
	blx	r3
	subs	r6, r0, #0
	blt	.L960
	mov	r2, #4
	add	r1, sp, #32
	ldr	r3, [r4, #96]
	mov	r0, r4
	blx	r3
	subs	r6, r0, #0
	blt	.L961
	ldr	r2, [r4, #88]
	ldr	r3, [sp, #32]
	cmp	r2, #0
	beq	.L924
	.syntax divided
@ 38 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/swab.h" 1
	rev r3, r3
@ 0 "" 2
	.arm
	.syntax unified
	str	r3, [sp, #32]
.L924:
	movw	r2, #:lower16:.LC131
	movw	r0, #:lower16:.LC10
	ldr	r1, [r4]
	movt	r2, #:upper16:.LC131
	str	r3, [sp]
	movt	r0, #:upper16:.LC10
	ldr	r3, .L965
	bl	dev_printk
	ldr	r3, [sp, #32]
	mov	r1, #0
	movt	r1, 32815
	lsr	r2, r3, #16
	lsl	r2, r2, #16
	cmp	r2, r1
	bne	.L962
	ldr	r3, [r4, #88]
	add	r10, r4, #632
	add	r10, r10, #2
	cmp	r3, #0
	beq	.L927
	movw	fp, #:lower16:.LC134
	movw	r8, #:lower16:.LC10
	ldr	r9, .L965
	movt	fp, #:upper16:.LC134
	movt	r8, #:upper16:.LC10
	b	.L931
.L928:
	ldr	r1, [r4]
	mov	r3, r9
	mov	r2, fp
	mov	r0, r8
	str	r7, [sp]
	bl	dev_printk
	mov	ip, #0
	mov	r2, #4
	ldr	r3, [r4, #96]
	add	r1, sp, #32
	mov	r0, r4
	str	ip, [sp, #32]
	blx	r3
	subs	r6, r0, #0
	blt	.L963
	movw	r2, #:lower16:.LC131
	ldr	ip, [sp, #32]
	mov	r3, r9
	.syntax divided
@ 38 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/swab.h" 1
	rev ip, ip
@ 0 "" 2
	.arm
	.syntax unified
	movt	r2, #:upper16:.LC131
	ldr	r1, [r4]
	mov	r0, r8
	str	ip, [sp]
	str	ip, [sp, #32]
	bl	dev_printk
	ldr	r3, [sp, #32]
	uxth	r2, r3
	cmp	r2, #0
	bne	.L955
	subs	r5, r5, #1
	beq	.L932
.L931:
	mov	r2, r7
	mov	r1, r10
	ldr	r3, [r4, #100]
	mov	r0, r4
	blx	r3
	subs	r6, r0, #0
	bge	.L928
	movw	r1, #:lower16:.LC133
	ldr	r2, .L965
	movt	r1, #:upper16:.LC133
	ldr	r0, [r4]
	bl	dev_err
.L922:
	ldr	r0, [sp, #16]
	bl	mutex_unlock
	movw	r1, #:lower16:.LC140
	mov	r3, r6
	ldr	r2, .L965
	movt	r1, #:upper16:.LC140
	ldr	r0, [r4]
	bl	dev_err
	b	.L915
.L927:
	ldr	r3, [sp, #12]
	ldrh	r7, [r3]
	cmp	r7, #0
	beq	.L932
	movw	r8, #:lower16:.LC131
	movw	r9, #:lower16:.LC10
	ldr	fp, .L965
	movt	r8, #:upper16:.LC131
	movt	r9, #:upper16:.LC10
	mov	r5, r10
	b	.L936
.L933:
	mov	ip, #0
	mov	r2, #4
	ldr	r3, [r4, #96]
	add	r1, sp, #32
	mov	r0, r4
	str	ip, [sp, #32]
	blx	r3
	subs	r6, r0, #0
	blt	.L964
	ldr	ip, [sp, #32]
	mov	r3, fp
	mov	r2, r8
	ldr	r1, [r4]
	mov	r0, r9
	str	ip, [sp]
	bl	dev_printk
	ldr	r3, [sp, #32]
	uxth	r2, r3
	cmp	r2, #0
	bne	.L955
	sub	r7, r7, #4
	add	r5, r5, #4
	uxth	r7, r7
	cmp	r7, #0
	beq	.L932
.L936:
	ldrb	r6, [r5, #3]	@ zero_extendqisi2
	mov	r2, #4
	add	r1, sp, #36
	ldrb	r3, [r5, #1]	@ zero_extendqisi2
	mov	r0, r4
	ldrb	lr, [r5, #2]	@ zero_extendqisi2
	ldrb	ip, [r5]	@ zero_extendqisi2
	strb	r6, [sp, #36]
	strb	lr, [sp, #37]
	strb	r3, [sp, #38]
	ldr	r3, [r4, #100]
	strb	ip, [sp, #39]
	blx	r3
	subs	r6, r0, #0
	bge	.L933
	movw	r1, #:lower16:.LC137
	sub	r3, r5, r10
	ldr	r2, .L965
	movt	r1, #:upper16:.LC137
	ldr	r0, [r4]
	bl	dev_err
	b	.L922
.L955:
	movw	r1, #:lower16:.LC136
	ldr	r2, .L965
	movt	r1, #:upper16:.LC136
	ldr	r0, [r4]
	bl	dev_err
	b	.L926
.L932:
	ldr	r3, [sp, #20]
	cmp	r3, #0
	bne	.L937
	ldr	r3, [sp, #12]
	ldrh	r7, [r3]
	lsr	r5, r7, #9
	b	.L919
.L957:
	.syntax divided
@ 375 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 375, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L963:
	movw	r1, #:lower16:.LC135
	ldr	r2, .L965
	movt	r1, #:upper16:.LC135
	ldr	r0, [r4]
	bl	dev_err
	b	.L922
.L959:
	uxth	r3, r7
	mov	r2, #1
	mov	r5, r2
	orr	r3, r3, #-2147483648
	str	r2, [sp, #20]
	orr	r3, r3, #3080192
	b	.L938
.L964:
	movw	r1, #:lower16:.LC138
	ldr	r2, .L965
	movt	r1, #:upper16:.LC138
	ldr	r0, [r4]
	bl	dev_err
	b	.L922
.L956:
	movw	r1, #:lower16:.LC129
	ldr	r2, .L965
	mvn	r6, #1
	movt	r1, #:upper16:.LC129
	ldr	r0, [r0]
	bl	dev_warn
	b	.L915
.L960:
	movw	r1, #:lower16:.LC130
	ldr	r2, .L965
	movt	r1, #:upper16:.LC130
	ldr	r0, [r4]
	ldr	r3, [sp, #28]
	bl	dev_err
	b	.L922
.L961:
	movw	r2, #:lower16:.LC115
	movw	r0, #:lower16:.LC10
	ldr	r1, [r4]
	movt	r2, #:upper16:.LC115
	ldr	r3, .L965
	str	r6, [sp]
	movt	r0, #:upper16:.LC10
	bl	dev_printk
	b	.L922
.L962:
	movw	r1, #:lower16:.LC132
	ldr	r2, .L965
	movt	r1, #:upper16:.LC132
	ldr	r0, [r4]
	bl	dev_err
	b	.L926
.L966:
	.align	2
.L965:
	.word	.LANCHOR2+2348
	.fnend
	.size	es705_write_vs_data_block, .-es705_write_vs_data_block
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_write_sensory_vs_data_block, %function
es705_write_sensory_vs_data_block:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L1017
	movw	r3, #:lower16:.LANCHOR2
	movw	r2, #2376
	movt	r3, #:upper16:.LANCHOR2
	cmp	r0, #0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldrd	r0, [r3, r2]
	strd	r6, [sp, #8]
	mov	r2, #0
	strd	r8, [sp, #16]
	movw	r4, #:lower16:.LANCHOR0
	ldr	r3, [ip, #8]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	.pad #36
	sub	sp, sp, #36
	str	r2, [sp, #12]
	strd	r0, [sp, #20]
	str	r3, [sp, #28]
	bne	.L968
	movt	r4, #:upper16:.LANCHOR0
	ldr	r3, [r4, #16]
	ldm	r3, {r5, r8}
.L969:
	movw	r0, #:lower16:.LANCHOR0
	add	r1, sp, #20
	movt	r0, #:upper16:.LANCHOR0
	add	r6, r5, #5
	bl	es705_write_block
	mov	r0, r6
	movw	r1, #32976
	bl	__kmalloc
	subs	r7, r0, #0
	bne	.L970
	movw	r1, #:lower16:.LC141
	ldr	r2, .L1017+4
	movt	r1, #:upper16:.LC141
	ldr	r0, [r4]
	bl	dev_err
.L967:
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L968:
	movt	r4, #:upper16:.LANCHOR0
	mov	r3, #2
	ldr	r2, [r4, #20]
	movt	r3, 36888
	ldm	r2, {r5, r8}
	str	r3, [sp, #24]
	b	.L969
.L970:
	mov	r1, r8
	mov	r2, r5
	bic	r6, r6, #3
	bl	memcpy
	sub	r3, r6, #2
	cmp	r5, r3
	bge	.L972
	sub	r6, r6, r5
	add	r0, r7, r5
	sub	r2, r6, #2
	mov	r1, #0
	mov	r5, r3
	bl	memset
.L972:
	movw	r0, #33800
	add	ip, r7, r5
	movt	r0, 65535
	mov	r1, r7
	movw	r3, #65535
	b	.L973
.L982:
	ldrb	r2, [r1], #1	@ zero_extendqisi2
	lsr	lr, r3, #1
	eor	r3, r3, r2
	tst	r3, #1
	eorne	lr, lr, #33792
	eorne	lr, lr, #8
	eor	r6, lr, r2, lsr #1
	lsr	r3, lr, #1
	tst	r6, #1
	eorne	r3, r3, r0
	uxthne	r3, r3
	eor	lr, r3, r2, lsr #2
	lsr	r3, r3, #1
	tst	lr, #1
	eorne	r3, r3, r0
	uxthne	r3, r3
	eor	lr, r3, r2, lsr #3
	lsr	r3, r3, #1
	tst	lr, #1
	eorne	r3, r3, r0
	uxthne	r3, r3
	eor	lr, r3, r2, lsr #4
	lsr	r3, r3, #1
	tst	lr, #1
	eorne	r3, r3, r0
	uxthne	r3, r3
	eor	lr, r3, r2, lsr #5
	lsr	r3, r3, #1
	tst	lr, #1
	eorne	r3, r3, r0
	uxthne	r3, r3
	eor	lr, r3, r2, lsr #6
	lsr	r3, r3, #1
	tst	lr, #1
	eorne	r3, r3, r0
	uxthne	r3, r3
	eor	r2, r3, r2, lsr #7
	lsr	r3, r3, #1
	tst	r2, #1
	eorne	r3, r3, r0
	uxthne	r3, r3
.L973:
	cmp	ip, r1
	bne	.L982
	add	r5, r5, #2
	lsr	r2, r3, #8
	strb	r3, [ip]
	cmp	r5, #0
	strb	r2, [ip, #1]
	ble	.L983
	ldr	r8, .L1017+8
	uxth	r6, r5
	mov	r10, #0
	mov	r9, #508
.L986:
	cmp	r6, #508
	add	r3, r6, #4
	ldr	r0, .L1017+12
	mov	fp, #512
	uxthls	fp, r3
	mov	r3, #1
	strhls	r6, [r8]	@ movhi
	mov	r1, #0
	mov	r2, #508
	strhhi	r9, [r8]	@ movhi
	movls	r2, r6
	strb	r3, [sp, #16]
	subs	r3, r10, r1
	movne	r3, #1
	mov	ip, #8
	sub	r6, r6, #508
	strb	ip, [sp, #17]
	uxth	r6, r6
	strb	r1, [sp, #18]
	add	r1, r7, r10
	strb	r3, [sp, #19]
	add	r10, r10, #508
	ldr	r3, [sp, #16]
	str	r3, [r4, #634]	@ unaligned
	bl	memcpy
	movw	r0, #:lower16:.LANCHOR0
	strh	fp, [r8]	@ movhi
	movt	r0, #:upper16:.LANCHOR0
	bl	es705_write_vs_data_block
	mov	r1, #512
	ldr	r0, .L1017+16
	bl	__memzero
	cmp	r5, r10
	bgt	.L986
.L983:
	mov	r0, r7
	add	r5, sp, #32
	bl	kfree
	movw	r2, #57393
	mov	r3, #0
	ldr	r6, [r4, #60]
	movt	r2, 32790
	movw	r0, #:lower16:.LANCHOR0
	str	r3, [sp]
	add	r1, sp, #8
	movt	r0, #:upper16:.LANCHOR0
	str	r3, [r5, #-20]!
	mov	r3, r5
	str	r2, [sp, #8]
	mov	r2, #4
	blx	r6
	movw	r0, #:lower16:.LC142
	ldr	r1, .L1017+4
	ldr	r2, [sp, #12]
	movt	r0, #:upper16:.LC142
	bl	printk
	movw	r2, #57386
	mov	ip, #0
	ldr	r6, [r4, #60]
	mov	lr, #1
	movt	r2, 32790
	movt	ip, 32790
	movw	r0, #:lower16:.LANCHOR0
	str	lr, [sp]
	mov	r3, r5
	add	r1, sp, #8
	str	r2, [sp, #8]
	movt	r0, #:upper16:.LANCHOR0
	mov	r2, #4
	str	ip, [sp, #12]
	blx	r6
	cmp	r0, #0
	beq	.L967
	movw	r1, #:lower16:.LC143
	ldr	r2, .L1017+4
	movt	r1, #:upper16:.LC143
	ldr	r0, [r4]
	bl	dev_err
	b	.L967
.L1018:
	.align	2
.L1017:
	.word	.LANCHOR2+2376
	.word	.LANCHOR2+2388
	.word	.LANCHOR0+632
	.word	.LANCHOR0+638
	.word	.LANCHOR0+634
	.fnend
	.size	es705_write_sensory_vs_data_block, .-es705_write_sensory_vs_data_block
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_voice_wakeup_enable_value, %function
es705_put_voice_wakeup_enable_value:
	.fnstart
	@ args = 0, pretend = 0, frame = 136
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r5, #:lower16:__stack_chk_guard
	movw	r3, #2424
	strd	r6, [sp, #8]
	movw	r6, #:lower16:.LANCHOR2
	movt	r5, #:upper16:__stack_chk_guard
	str	lr, [sp, #32]
	ldr	lr, .L1072
	movt	r6, #:upper16:.LANCHOR2
	strd	r8, [sp, #16]
	mov	r8, #-2147483644
	movw	r4, #:lower16:.LANCHOR0
	strd	r10, [sp, #24]
	.pad #156
	sub	sp, sp, #156
	ldr	ip, [r1, #72]
	ldr	fp, [r5]
	movt	r4, #:upper16:.LANCHOR0
	ldrd	r0, [r6, r3]
	str	r8, [sp, #16]
	ldrd	r2, [lr, #8]
	str	r8, [sp, #20]
	ldrd	r8, [lr, #16]
	ldr	r10, [lr, #48]
	ldr	r7, [r4, #1384]
	strd	r0, [sp, #64]
	strd	r2, [sp, #72]
	ldrd	r2, [lr, #24]
	strd	r8, [sp, #80]
	ldrd	r8, [lr, #40]
	str	fp, [sp, #148]
	ldr	r0, [r4]
	cmp	r7, ip
	str	r10, [sp, #112]
	ldrd	r10, [lr, #32]
	strd	r2, [sp, #88]
	strd	r10, [sp, #96]
	strd	r8, [sp, #104]
	beq	.L1064
	movw	r1, #:lower16:.LC11
	mov	r3, ip
	ldr	r2, .L1072+4
	movt	r1, #:upper16:.LC11
	str	ip, [r4, #1384]
	bl	_dev_info
	ldr	r3, [r4, #1380]
	cmp	r3, #0
	beq	.L1028
	ldr	r2, [r4, #1384]
	cmp	r2, #1
	beq	.L1065
	cmp	r2, #2
	bne	.L1037
	mov	r1, #174
	mov	r0, #5
	blx	r3
	ldr	r3, [r4, #1172]
	cmp	r3, #5
	beq	.L1066
.L1028:
	mov	r7, #0
.L1019:
	ldr	r2, [sp, #148]
	mov	r0, r7
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L1067
	add	sp, sp, #156
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1064:
	movw	r1, #:lower16:.LC144
	mov	r3, r7
	str	r7, [sp]
	movt	r1, #:upper16:.LC144
	add	r2, lr, #52
	bl	_dev_info
	mov	r7, #0
	b	.L1019
.L1065:
	ldr	r2, [r4, #1400]
	cmp	r2, #0
	beq	.L1024
	ldr	r2, [r4, #1404]
	cmp	r2, #0
	bne	.L1025
.L1024:
	movw	r3, #:lower16:.LC145
	movw	r1, #:lower16:.LC146
	ldr	r2, .L1072+8
	movt	r3, #:upper16:.LC145
	movt	r1, #:upper16:.LC146
	ldm	r3, {r0, ip}
	ldr	r7, [r3, #8]
	ldr	lr, [r3, #12]
	str	r0, [sp, #118]	@ unaligned
	ldr	r0, [r3, #16]
	str	ip, [sp, #122]	@ unaligned
	ldr	ip, [r3, #20]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	str	r7, [sp, #126]	@ unaligned
	str	lr, [sp, #130]	@ unaligned
	str	r0, [sp, #134]	@ unaligned
	ldr	r0, [r4]
	str	ip, [sp, #138]	@ unaligned
	strb	r3, [sp, #142]
	bl	_dev_info
	add	r1, sp, #118
	ldr	r0, .L1072+12
	ldr	r2, [r4]
	bl	request_firmware
	subs	r3, r0, #0
	bne	.L1068
.L1026:
	movw	r3, #:lower16:.LC147
	movw	r1, #:lower16:.LC148
	ldr	r2, .L1072+8
	movt	r3, #:upper16:.LC147
	movt	r1, #:upper16:.LC148
	ldr	ip, [r3]
	ldmib	r3, {r7, lr}
	ldr	r0, [r3, #12]
	str	ip, [sp, #118]	@ unaligned
	ldr	ip, [r3, #16]
	ldrh	r3, [r3, #20]
	str	r7, [sp, #122]	@ unaligned
	str	lr, [sp, #126]	@ unaligned
	str	r0, [sp, #130]	@ unaligned
	ldr	r0, [r4]
	str	ip, [sp, #134]	@ unaligned
	strh	r3, [sp, #138]	@ unaligned
	bl	_dev_info
	add	r1, sp, #118
	ldr	r0, .L1072+16
	ldr	r2, [r4]
	bl	request_firmware
	subs	r3, r0, #0
	beq	.L1027
	movw	r1, #:lower16:.LC51
	str	r3, [sp]
	ldr	r2, .L1072+8
	movt	r1, #:upper16:.LC51
	ldr	r0, [r4]
	add	r3, sp, #118
	bl	dev_err
.L1027:
	ldr	r3, [r4, #1380]
.L1025:
	mov	r1, #174
	mov	r0, #5
	blx	r3
	ldr	r3, [r4, #1172]
	cmp	r3, #5
	bne	.L1028
	mov	r0, #27
	bl	es705_switch_route_config
	mov	r2, #1
	movw	r0, #:lower16:.LANCHOR0
	ldr	r7, [r4, #60]
	movt	r0, #:upper16:.LANCHOR0
	add	r3, sp, #20
	str	r2, [sp]
	add	r1, sp, #16
	mov	r2, #4
	blx	r7
	subs	r7, r0, #0
	bne	.L1063
	movw	r3, #2540
	ldr	r8, .L1072+20
	movw	r1, #2552
	ldrd	r2, [r3, r6]
	movw	ip, #2564
	ldrd	r0, [r1, r6]
	ldrd	r10, [r6, ip]
	ldr	ip, [r8, #8]
	strd	r2, [sp, #28]
	ldr	lr, [r8, #20]
	add	r2, r8, #36
	ldr	r3, [r8, #32]
	str	ip, [sp, #36]
	strd	r0, [sp, #40]
	movw	r1, #:lower16:.LC149
	ldr	r0, [r4]
	movt	r1, #:upper16:.LC149
	str	lr, [sp, #48]
	strd	r10, [sp, #52]
	str	r3, [sp, #60]
	bl	_dev_info
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L1069
	ldr	r3, [r4, #88]
	cmp	r3, #0
	beq	.L1031
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	subs	r7, r0, #0
	blt	.L1070
.L1031:
	mov	r0, #0
	bl	es705_write_sensory_vs_data_block
	mov	r0, #1
	bl	es705_write_sensory_vs_data_block
	ldr	r3, [r4, #92]
	cmp	r3, #0
	beq	.L1032
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
.L1032:
	movw	r0, #:lower16:.LANCHOR0
	add	r1, sp, #28
	movt	r0, #:upper16:.LANCHOR0
	bl	es705_write_block
	movw	r0, #:lower16:.LANCHOR0
	add	r1, sp, #40
	movt	r0, #:upper16:.LANCHOR0
	bl	es705_write_block
	ldr	r0, .L1072+24
	bl	mutex_lock
	ldr	r3, [sp, #52]
	cmn	r3, #1
	beq	.L1033
	ldr	r9, .L1072+28
	movw	r8, #:lower16:.LANCHOR0
	movw	r7, #:lower16:.LC87
	add	r6, sp, #52
	movt	r8, #:upper16:.LANCHOR0
	movt	r7, #:upper16:.LC87
.L1036:
	str	r3, [sp, #24]
	mov	r2, #4
	ldr	r3, [r4, #56]
	add	r1, sp, #24
	mov	r0, r8
	blx	r3
	ldrb	r3, [sp, #27]	@ zero_extendqisi2
	cmp	r3, #144
	bne	.L1034
	ldrb	r3, [sp, #26]	@ zero_extendqisi2
	cmp	r3, #49
	beq	.L1071
.L1034:
	mov	r1, #1000
	mov	r0, r1
	bl	usleep_range
.L1035:
	ldrb	fp, [sp, #24]	@ zero_extendqisi2
	movw	r0, #:lower16:.LC10
	mov	r3, r9
	ldrb	r10, [sp, #25]	@ zero_extendqisi2
	movt	r0, #:upper16:.LC10
	mov	r2, r7
	ldrb	lr, [sp, #26]	@ zero_extendqisi2
	ldrb	ip, [sp, #27]	@ zero_extendqisi2
	ldr	r1, [r4]
	stm	sp, {ip, lr}
	strd	r10, [sp, #8]
	bl	dev_printk
	ldr	r3, [r6, #4]!
	cmn	r3, #1
	bne	.L1036
.L1033:
	ldr	r0, .L1072+24
	mov	r7, #0
	bl	mutex_unlock
	movw	r1, #:lower16:.LC153
	ldr	r2, .L1072+32
	movt	r1, #:upper16:.LC153
	ldr	r0, [r4]
	bl	_dev_info
	b	.L1019
.L1066:
	mov	r0, #27
	bl	es705_switch_route_config
	add	r1, sp, #64
	mov	r0, r4
	bl	es705_write_block
	mov	r0, #1
	add	r3, sp, #20
	ldr	r6, [r4, #60]
	mov	r2, #4
	add	r1, sp, #16
	str	r0, [sp]
	mov	r0, r4
	blx	r6
	subs	r7, r0, #0
	beq	.L1019
.L1063:
	movw	r1, #:lower16:.LC73
	ldr	r2, .L1072+4
	movt	r1, #:upper16:.LC73
	ldr	r0, [r4]
	bl	dev_err
	b	.L1019
.L1037:
	ldr	r0, [r4, #1172]
	cmp	r0, #6
	bne	.L1038
	mov	r1, #174
	mov	r0, #5
	blx	r3
	ldr	r0, [r4, #1172]
.L1038:
	cmp	r0, #5
	bne	.L1028
	bl	es705_switch_route_config
	ldr	r3, [r4, #1380]
	mov	r1, #174
	mov	r0, #4
	blx	r3
	ldr	r3, [r4, #1156]
	cmp	r3, #0
	bne	.L1028
	ldr	r3, [r4, #1164]
	cmp	r3, #0
	bne	.L1028
	ldr	r3, [r4, #1160]
	cmp	r3, #0
	bne	.L1028
	ldr	r7, [r4, #1384]
	cmp	r7, #0
	bne	.L1028
	mov	r1, #174
	ldr	r3, [r4, #1380]
	mov	r0, #1
	blx	r3
	b	.L1019
.L1068:
	movw	r1, #:lower16:.LC51
	ldr	r2, .L1072+8
	str	r3, [sp]
	movt	r1, #:upper16:.LC51
	ldr	r0, [r4]
	add	r3, sp, #118
	bl	dev_err
	b	.L1026
.L1071:
	ldr	r3, [r4, #1516]
	mov	r1, #1000
	mul	r1, r1, r3
	mov	r0, r1
	bl	usleep_range
	b	.L1035
.L1070:
	movw	r1, #:lower16:.LC151
	add	r2, r8, #36
	ldr	r0, [r4]
	movt	r1, #:upper16:.LC151
	bl	dev_err
	movw	r1, #:lower16:.LC152
	sub	r2, r8, #64
	ldr	r0, [r4]
	movt	r1, #:upper16:.LC152
	bl	dev_err
	b	.L1019
.L1069:
	movw	r1, #:lower16:.LC150
	add	r2, r8, #36
	ldr	r0, [r4]
	movt	r1, #:upper16:.LC150
	bl	_dev_info
	bl	es705_switch_to_normal_mode.constprop.23
	b	.L1019
.L1067:
	bl	__stack_chk_fail
.L1073:
	.align	2
.L1072:
	.word	.LANCHOR2+2424
	.word	.LANCHOR2+2476
	.word	.LANCHOR2+2512
	.word	.LANCHOR0+16
	.word	.LANCHOR0+20
	.word	.LANCHOR2+2540
	.word	.LANCHOR0+144
	.word	.LANCHOR2+1060
	.word	.LANCHOR2+2576
	.fnend
	.size	es705_put_voice_wakeup_enable_value, .-es705_put_voice_wakeup_enable_value
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_vs_stored_keyword, %function
es705_put_vs_stored_keyword:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r2, #:lower16:.LC154
	str	lr, [sp, #8]
	ldr	r5, [r1, #72]
	.pad #12
	sub	sp, sp, #12
	movt	r4, #:upper16:.LANCHOR0
	movw	r0, #:lower16:.LC10
	ldr	r3, .L1090
	movt	r2, #:upper16:.LC154
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	str	r5, [sp]
	bl	dev_printk
	cmp	r5, #1
	beq	.L1076
	bcc	.L1077
	cmp	r5, #2
	beq	.L1078
	mov	r5, #0
.L1074:
	mov	r0, r5
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L1078:
	ldr	r1, [r4], #632
	movw	r2, #:lower16:.LC158
	movw	r0, #:lower16:.LC10
	ldr	r3, .L1090
	movt	r2, #:upper16:.LC158
	movt	r0, #:upper16:.LC10
	bl	dev_printk
	mov	r3, #0
	mov	r5, r3
	strh	r3, [r4]	@ movhi
	b	.L1074
.L1077:
	movw	r2, #:lower16:.LC155
	movw	r0, #:lower16:.LC10
	ldr	r3, .L1090
	movt	r2, #:upper16:.LC155
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	bl	dev_printk
	ldr	r3, [r4, #88]
	cmp	r3, #0
	beq	.L1079
	mov	r0, r4
	blx	r3
	subs	r5, r0, #0
	blt	.L1089
.L1079:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	es705_write_vs_data_block
	ldr	r3, [r4, #92]
	mov	r5, r0
	cmp	r3, #0
	beq	.L1074
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	subs	r5, r0, #0
	bge	.L1074
	movw	r1, #:lower16:.LC156
	ldr	r2, .L1090
	movt	r1, #:upper16:.LC156
	ldr	r0, [r4]
	bl	dev_err
	b	.L1074
.L1076:
	movw	r2, #:lower16:.LC157
	movw	r0, #:lower16:.LC10
	ldr	r1, [r4]
	ldr	r3, .L1090
	movt	r2, #:upper16:.LC157
	movt	r0, #:upper16:.LC10
	bl	dev_printk
	ldr	r1, .L1090+4
	mov	r0, r4
	mov	r2, #512
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldr	lr, [sp, #8]
	add	sp, sp, #12
	b	es705_read_vs_data_block
.L1089:
	movw	r1, #:lower16:.LC151
	ldr	r2, .L1090
	movt	r1, #:upper16:.LC151
	ldr	r0, [r4]
	bl	dev_err
	b	.L1074
.L1091:
	.align	2
.L1090:
	.word	.LANCHOR2+2608
	.word	.LANCHOR0+634
	.fnend
	.size	es705_put_vs_stored_keyword, .-es705_put_vs_stored_keyword
	.align	2
	.global	es705_cmd
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_cmd, %function
es705_cmd:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-20]!
	.save {r4, r5, r6, r7, lr}
	subs	r5, r0, #0
	strd	r6, [sp, #8]
	str	lr, [sp, #16]
	.pad #12
	sub	sp, sp, #12
	beq	.L1097
	and	r4, r1, #268435456
	add	r3, sp, #4
	ldr	r7, [r5, #116]
	mov	r2, r4
	mov	r6, r1
	blx	r7
	orrs	r4, r4, r0
	bne	.L1092
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L1098
	add	r0, r5, #104
	str	r3, [r5, #112]
	bl	get_monotonic_boottime
	mov	r0, r4
.L1092:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
.L1097:
	.syntax divided
@ 600 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 600, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L1098:
	movw	r1, #:lower16:.LC159
	mov	r3, r6
	ldr	r2, .L1099
	movt	r1, #:upper16:.LC159
	ldr	r0, [r5]
	bl	dev_err
	mvn	r0, #109
	b	.L1092
.L1100:
	.align	2
.L1099:
	.word	.LANCHOR2+2636
	.fnend
	.size	es705_cmd, .-es705_cmd
	.align	2
	.global	es705_bootup
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_bootup, %function
es705_bootup:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strd	r6, [sp, #8]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	ldr	r3, [r0, #8]
	.pad #12
	sub	sp, sp, #12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L1121
	add	r8, r0, #560
	mov	r4, r0
	ldr	r7, .L1125
	mov	r0, r8
	movw	r10, #:lower16:system_rev
	bl	mutex_lock
	mov	r3, #0
	movw	r2, #:lower16:.LC78
	movt	r2, #:upper16:.LC78
	movw	r9, #:lower16:.LC76
	mov	r0, r8
	str	r3, [r4, #584]
	movt	r10, #:upper16:system_rev
	movt	r9, #:upper16:.LC76
	add	r6, r4, #144
	str	r2, [sp, #4]
	mov	r5, #11
	bl	mutex_unlock
.L1111:
	mov	r3, #1
	mov	r2, r7
	ldr	r0, [r4]
	mov	r1, r9
	bl	_dev_info
	mov	r0, r6
	bl	mutex_lock
	ldr	r3, [r10]
	cmp	r3, #5
	bhi	.L1103
	ldr	r3, [r4, #620]
	cmp	r3, #0
	bne	.L1103
.L1104:
	mov	r0, r4
	ldr	r3, [r4, #68]
	blx	r3
	subs	fp, r0, #0
	bne	.L1122
	mov	r2, r7
	ldr	r1, [sp, #4]
	ldr	r0, [r4]
	bl	_dev_info
	ldr	r1, [r4, #8]
	mov	r0, r4
	ldr	r3, [r4, #56]
	ldr	r2, [r1]
	ldr	r1, [r1, #4]
	blx	r3
	cmp	r0, #0
	bne	.L1123
	mov	r3, #1
	mov	r0, r4
	ldr	r2, [r4, #72]
	str	r3, [r4, #596]
	blx	r2
	subs	fp, r0, #0
	mov	r3, #1
	bne	.L1124
	movw	r1, #:lower16:.LC81
	ldr	r2, .L1125
	movt	r1, #:upper16:.LC81
	ldr	r0, [r4]
	bl	_dev_info
	mov	r0, r6
	bl	mutex_unlock
.L1105:
	mov	r0, r8
	mov	fp, #0
	bl	mutex_lock
	mov	r2, #3
	mov	r3, #4
	mov	r0, r8
	str	r2, [r4, #584]
	str	r3, [r4, #1172]
	bl	mutex_unlock
.L1101:
	mov	r0, fp
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1103:
	ldr	r3, [r4, #76]
	cmp	r3, #0
	beq	.L1104
	mov	r1, #1
	mov	r0, r4
	blx	r3
	cmp	r0, #0
	blt	.L1104
	mov	r3, #1
	mov	r0, r6
	str	r3, [r4, #596]
	bl	mutex_unlock
	b	.L1105
.L1122:
	movw	r1, #:lower16:.LC77
	mov	r2, r7
	ldr	r0, [r4]
	movt	r1, #:upper16:.LC77
	bl	dev_err
.L1107:
	mov	r0, r6
	bl	mutex_unlock
.L1109:
	movw	r1, #:lower16:.LC160
	ldr	r2, .L1125+4
	movt	r1, #:upper16:.LC160
	ldr	r0, [r4]
	bl	dev_err
	mov	r0, r4
	bl	es705_gpio_reset
	subs	r5, r5, #1
	bne	.L1111
	b	.L1101
.L1124:
	movw	r1, #:lower16:.LC80
	mov	r2, r7
	ldr	r0, [r4]
	movt	r1, #:upper16:.LC80
	bl	dev_err
	b	.L1107
.L1121:
	.syntax divided
@ 1580 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 1580, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L1123:
	movw	r1, #:lower16:.LC79
	mov	r2, r7
	ldr	r0, [r4]
	movt	r1, #:upper16:.LC79
	mvn	fp, #4
	bl	dev_err
	mov	r0, r6
	bl	mutex_unlock
	b	.L1109
.L1126:
	.align	2
.L1125:
	.word	.LANCHOR2+980
	.word	.LANCHOR2+2648
	.fnend
	.size	es705_bootup, .-es705_bootup
	.align	2
	.global	restore_std_fw
	.syntax unified
	.arm
	.fpu softvfp
	.type	restore_std_fw, %function
restore_std_fw:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	movw	r1, #:lower16:.LC161
	mov	r4, r0
	str	r6, [sp, #8]
	ldr	r6, .L1129
	movt	r1, #:upper16:.LC161
	str	lr, [sp, #12]
	ldr	r0, [r0]
	mov	r2, r6
	bl	_dev_info
	mov	r3, #0
	mov	r0, r4
	str	r3, [r4, #596]
	bl	es705_gpio_reset
	mov	r0, r4
	bl	es705_bootup
	movw	r1, #:lower16:.LC162
	mov	r5, r0
	mov	r3, r0
	mov	r2, r6
	ldr	r0, [r4]
	movt	r1, #:upper16:.LC162
	bl	_dev_info
	ldr	r6, [sp, #8]
	mov	r0, r5
	ldrd	r4, [sp]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L1130:
	.align	2
.L1129:
	.word	.LANCHOR2+2664
	.fnend
	.size	restore_std_fw, .-restore_std_fw
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_sleep, %function
es705_sleep:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movw	r5, #:lower16:__stack_chk_guard
	mov	r3, #-2147483648
	movt	r5, #:upper16:__stack_chk_guard
	strd	r6, [sp, #8]
	movw	r1, #:lower16:.LC163
	ldr	ip, [r5]
	str	r8, [sp, #16]
	mov	r4, r0
	str	lr, [sp, #20]
	.pad #40
	sub	sp, sp, #40
	ldr	r2, .L1169
	movt	r1, #:upper16:.LC163
	ldr	r0, [r0]
	str	r3, [sp, #8]
	str	r3, [sp, #12]
	str	ip, [sp, #36]
	bl	_dev_info
	ldr	r3, [r4, #244]
	tst	r3, #1
	bne	.L1162
.L1132:
	add	r7, r4, #560
	mov	r8, #0
	mov	r0, r7
	bl	mutex_lock
	mov	r2, #1
	mvn	r0, #0
	ldr	r6, [r4, #60]
	add	r3, sp, #12
	str	r8, [r4, #1408]
	add	r1, sp, #8
	str	r8, [r4, #1416]
	str	r2, [sp]
	mov	r2, #4
	str	r0, [r4, #1412]
	mov	r0, r4
	blx	r6
	subs	r3, r0, #0
	bne	.L1160
	movw	r6, #:lower16:.LANCHOR1
	movt	r6, #:upper16:.LANCHOR1
.L1133:
	ldr	r3, [r6, #12]
	cmp	r3, #0
	bne	.L1163
	cmp	r4, #0
	beq	.L1164
.L1135:
	mov	r1, #0
	ldr	r6, [r4, #116]
	add	r3, sp, #20
	movt	r1, 36942
	mov	r2, #268435456
	mov	r0, r4
	blx	r6
	subs	r6, r0, #0
	blt	.L1165
	ldr	r1, .L1169+4
	mov	r3, #0
	mov	r2, #0
	add	r0, sp, #20
	movw	r6, #:lower16:.LANCHOR0
	strd	r2, [sp, #20]
	movt	r6, #:upper16:.LANCHOR0
	ldr	r8, [r1, #1736]
	add	r1, r1, #1728
	mov	r2, r8
	bl	memcpy
	add	r1, sp, #20
	mov	r2, r8
	add	r0, sp, #28
	bl	memcpy
	add	r0, r6, #144
	bl	mutex_lock
	mov	r3, #0
	mov	r2, r8
	ldr	r8, [r6, #60]
	add	r1, sp, #28
	mov	r0, r6
	str	r3, [sp]
	add	r3, sp, #16
	blx	r8
	mov	r8, r0
	add	r0, r6, #144
	bl	mutex_unlock
	cmp	r8, #0
	blt	.L1166
	ldrh	r3, [sp, #16]
	cmp	r3, #0
	bne	.L1139
.L1140:
	mov	r1, #1
	ldr	r6, [r4, #116]
	add	r3, sp, #20
	movt	r1, 36880
	mov	r2, #268435456
	mov	r0, r4
	blx	r6
	subs	r6, r0, #0
	bne	.L1167
.L1141:
	mov	r8, #30
	movw	r2, #:lower16:.LC169
	ldr	r3, .L1169
	movw	r0, #:lower16:.LC10
	movt	r2, #:upper16:.LC169
	ldr	r1, [r4]
	movt	r0, #:upper16:.LC10
	str	r8, [sp]
	bl	dev_printk
	mov	r0, r8
	bl	msleep
	ldr	r2, [r4, #28]
	mov	r3, #1
	str	r3, [r4, #584]
	str	r3, [r4, #1172]
	ldr	r3, [r2, #68]
	cmp	r3, #0
	beq	.L1137
	mov	r0, #0
	blx	r3
	movw	r1, #:lower16:.LC170
	ldr	r2, .L1169
	movt	r1, #:upper16:.LC170
	ldr	r0, [r4]
	bl	_dev_info
.L1137:
	movw	r1, #:lower16:.LC171
	ldr	r2, .L1169
	movt	r1, #:upper16:.LC171
	ldr	r0, [r4]
	bl	_dev_info
	mov	r0, r7
	bl	mutex_unlock
	ldr	r2, [sp, #36]
	mov	r0, r6
	ldr	r3, [r5]
	cmp	r2, r3
	bne	.L1168
	add	sp, sp, #40
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L1163:
	movw	r1, #:lower16:.LC165
	ldr	r2, .L1169
	movt	r1, #:upper16:.LC165
	ldr	r0, [r4]
	bl	_dev_info
	cmp	r4, #0
	bne	.L1135
.L1164:
	.syntax divided
@ 600 "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705.c" 1
	1:	.word 0xe7f001f2
.pushsection .rodata.str, "aMS", %progbits, 1
2:	.asciz "/home/pascua14/Desktop/s5-kernel/sound/soc/codecs/audience/es705.c"
.popsection
.pushsection __bug_table,"a"
3:	.word 1b, 2b
	.hword 600, 0
.popsection
@ 0 "" 2
	.arm
	.syntax unified
.L1160:
	movw	r1, #:lower16:.LC164
	ldr	r2, .L1169
	movw	r6, #:lower16:.LANCHOR1
	movt	r1, #:upper16:.LC164
	ldr	r0, [r4]
	movt	r6, #:upper16:.LANCHOR1
	bl	dev_err
	mov	r0, r7
	bl	mutex_unlock
	movw	r1, #:lower16:.LC161
	ldr	r2, .L1169+8
	movt	r1, #:upper16:.LC161
	ldr	r0, [r4]
	bl	_dev_info
	mov	r0, r4
	str	r8, [r4, #596]
	bl	es705_gpio_reset
	mov	r0, r4
	bl	es705_bootup
	movw	r1, #:lower16:.LC162
	mov	r3, r0
	ldr	r2, .L1169+8
	movt	r1, #:upper16:.LC162
	ldr	r0, [r4]
	bl	_dev_info
	ldr	r3, [r6, #12]
	mov	r0, r7
	add	r3, r3, #1
	str	r3, [r6, #12]
	bl	mutex_lock
	b	.L1133
.L1162:
	add	r0, r4, #244
	bl	cancel_delayed_work_sync
	b	.L1132
.L1165:
	movw	r1, #:lower16:.LC166
	ldr	r2, .L1169
	movt	r1, #:upper16:.LC166
	ldr	r0, [r4]
	bl	dev_err
	b	.L1137
.L1166:
	movw	r1, #:lower16:.LC22
	ldr	r2, .L1169+12
	movt	r1, #:upper16:.LC22
	ldr	r0, [r6]
	bl	dev_err
	mov	r3, r8
.L1139:
	movw	r1, #:lower16:.LC167
	ldr	r2, .L1169
	movt	r1, #:upper16:.LC167
	ldr	r0, [r4]
	bl	dev_err
	b	.L1140
.L1167:
	movw	r1, #:lower16:.LC168
	mov	r3, r6
	ldr	r2, .L1169
	movt	r1, #:upper16:.LC168
	ldr	r0, [r4]
	bl	dev_err
	b	.L1141
.L1168:
	bl	__stack_chk_fail
.L1170:
	.align	2
.L1169:
	.word	.LANCHOR2+2680
	.word	es705_api_access+4096
	.word	.LANCHOR2+2664
	.word	.LANCHOR2+444
	.fnend
	.size	es705_sleep, .-es705_sleep
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_codec_suspend, %function
es705_codec_suspend:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r5, r0
	mov	r4, #0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r0, [r0, #12]
	bl	dev_get_drvdata
	mov	r6, r0
	movw	r2, #:lower16:.LC172
	ldr	r3, .L1173
	movw	r0, #:lower16:.LC10
	ldr	r1, [r6]
	movt	r2, #:upper16:.LC172
	movt	r0, #:upper16:.LC10
	bl	dev_printk
	mov	r0, r6
	str	r4, [r5, #180]
	bl	es705_sleep
	ldr	r6, [sp, #8]
	mov	r0, r4
	ldrd	r4, [sp]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L1174:
	.align	2
.L1173:
	.word	.LANCHOR2+2692
	.fnend
	.size	es705_codec_suspend, .-es705_codec_suspend
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_delayed_sleep, %function
es705_delayed_sleep:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	str	lr, [sp, #8]
	.pad #12
	sub	sp, sp, #12
	ldr	r5, [r4, #308]
	ldr	r1, [r4, #1156]
	ldr	r3, [r4, #324]
	ldr	r2, [r4, #340]
	cmp	r1, #0
	ldr	r1, [r4]
	add	r5, r5, r2
	add	r5, r5, r3
	bne	.L1176
	ldr	r3, [r4, #1164]
	cmp	r3, #0
	beq	.L1179
.L1176:
	mov	ip, #1
	movw	r2, #:lower16:.LC173
	ldr	r3, .L1180
	movw	r0, #:lower16:.LC10
	movt	r2, #:upper16:.LC173
	movt	r0, #:upper16:.LC10
	stm	sp, {r5, ip}
	bl	dev_printk
.L1175:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L1179:
	ldr	r3, [r4, #1160]
	cmp	r3, #0
	bne	.L1176
	movw	r2, #:lower16:.LC173
	movw	r0, #:lower16:.LC10
	str	r5, [sp]
	str	r3, [sp, #4]
	movt	r2, #:upper16:.LC173
	movt	r0, #:upper16:.LC10
	ldr	r3, .L1180
	bl	dev_printk
	cmp	r5, #0
	bgt	.L1175
	ldr	r3, [r4, #584]
	cmp	r3, #2
	bne	.L1175
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldr	lr, [sp, #8]
	add	sp, sp, #12
	b	es705_sleep
.L1181:
	.align	2
.L1180:
	.word	.LANCHOR2+2712
	.fnend
	.size	es705_delayed_sleep, .-es705_delayed_sleep
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_wakeup, %function
es705_wakeup:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	mov	r4, r0
	strd	r6, [sp, #8]
	mov	r3, #-2147483648
	movw	r1, #:lower16:.LC163
	str	r8, [sp, #16]
	ldr	r2, .L1236
	movt	r1, #:upper16:.LC163
	str	lr, [sp, #20]
	ldr	r0, [r5], #560
	.pad #32
	sub	sp, sp, #32
	movw	r6, #:lower16:.LANCHOR0
	str	r3, [sp, #12]
	movt	r6, #:upper16:.LANCHOR0
	str	r3, [sp, #16]
	bl	_dev_info
	mov	r0, r5
	bl	mutex_lock
	ldr	r0, [r6, #128]
	bl	msm_slim_es705_func
	ldr	r3, [r4, #244]
	tst	r3, #1
	bne	.L1228
.L1183:
	ldr	r3, [r4, #192]
	tst	r3, #1
	bne	.L1184
	ldr	r0, [r4, #584]
	cmp	r0, #2
	beq	.L1184
	cmp	r0, #1
	bne	.L1229
.L1187:
	ldr	r3, [r4, #28]
	ldr	r3, [r3, #68]
	cmp	r3, #0
	beq	.L1188
	blx	r3
	movw	r1, #3100
	movw	r0, #3000
	bl	usleep_range
	movw	r1, #:lower16:.LC175
	ldr	r2, .L1236
	movt	r1, #:upper16:.LC175
	ldr	r0, [r4]
	bl	_dev_info
.L1188:
	ldr	r3, [r4, #1396]
	cmp	r3, #0
	bne	.L1230
.L1189:
	ldr	r3, [r6, #1392]
	cmp	r3, #0
	beq	.L1190
	movw	r1, #:lower16:.LC176
	ldr	r2, .L1236
	movt	r1, #:upper16:.LC176
	ldr	r0, [r4]
	bl	_dev_info
	mov	r0, r4
	bl	es705_uart_es705_wakeup
	ldr	r3, [r4, #1396]
	cmp	r3, #0
	bne	.L1231
.L1192:
	mov	r0, #35
	bl	msleep
	mov	r0, #1
	ldr	r7, [r4, #60]
	add	r3, sp, #16
	mov	r2, #4
	add	r1, sp, #12
	str	r0, [sp]
	mov	r0, r4
	blx	r7
	cmp	r0, #0
	bne	.L1232
	movw	r3, #:lower16:.LANCHOR1
	movt	r3, #:upper16:.LANCHOR1
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L1233
.L1198:
	ldr	r3, [r4, #1172]
	sub	r3, r3, #5
	cmp	r3, #1
	bhi	.L1234
.L1196:
	ldr	ip, [sp, #16]
	movw	r2, #:lower16:.LC179
	movw	r0, #:lower16:.LC10
	ldr	r1, [r4]
	movt	r2, #:upper16:.LC179
	movt	r0, #:upper16:.LC10
	ldr	r3, .L1236
	mov	r7, #0
	str	ip, [sp]
	bl	dev_printk
.L1186:
	movw	r1, #:lower16:.LC171
	ldr	r2, .L1236
	movt	r1, #:upper16:.LC171
	ldr	r0, [r4]
	bl	_dev_info
	mov	r0, r5
	bl	mutex_unlock
	mov	r0, r7
	add	sp, sp, #32
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L1184:
	mov	r0, r5
	bl	mutex_unlock
	add	r0, r4, #192
	bl	cancel_delayed_work_sync
	mov	r0, r5
	bl	mutex_lock
	ldr	r0, [r4, #584]
	cmp	r0, #2
	moveq	r3, #3
	moveq	r7, #0
	streq	r3, [r4, #584]
	beq	.L1186
	cmp	r0, #1
	beq	.L1187
.L1229:
	movw	r1, #:lower16:.LC174
	ldr	r2, .L1236
	mov	r7, #0
	movt	r1, #:upper16:.LC174
	ldr	r0, [r4]
	bl	dev_err
	b	.L1186
.L1228:
	add	r0, r4, #244
	bl	cancel_delayed_work_sync
	b	.L1183
.L1190:
	mov	r0, r4
	bl	es705_gpio_wakeup
	ldr	r3, [r4, #1396]
	cmp	r3, #0
	beq	.L1192
.L1231:
	mov	r0, r4
	bl	es705_uart_pin_postset
	b	.L1192
.L1234:
	mov	r2, #-2147483648
	mov	r1, #4
	ldr	r7, [r6, #116]
	movw	r0, #:lower16:.LANCHOR0
	movt	r1, 36880
	add	r3, sp, #28
	str	r2, [sp, #20]
	movt	r0, #:upper16:.LANCHOR0
	str	r2, [sp, #24]
	mov	r2, #268435456
	blx	r7
	mov	r0, #20
	bl	msleep
	mov	r2, #1
	mov	r1, #3
	ldr	r7, [r6, #60]
	movw	r0, #:lower16:.LANCHOR0
	add	r3, sp, #24
	str	r1, [r6, #584]
	movt	r0, #:upper16:.LANCHOR0
	add	r1, sp, #20
	str	r2, [sp]
	mov	r2, #4
	blx	r7
	cmp	r0, #0
	beq	.L1196
	movw	r1, #:lower16:.LC73
	ldr	r2, .L1236+4
	movt	r1, #:upper16:.LC73
	ldr	r0, [r6]
	bl	dev_err
	b	.L1196
.L1232:
	mov	r0, r5
	movw	r8, #:lower16:.LANCHOR1
	bl	mutex_unlock
	movw	r1, #:lower16:.LC161
	ldr	r2, .L1236+8
	movt	r8, #:upper16:.LANCHOR1
	movt	r1, #:upper16:.LC161
	ldr	r0, [r4]
	bl	_dev_info
	mov	r3, #0
	mov	r0, r4
	str	r3, [r4, #596]
	bl	es705_gpio_reset
	mov	r0, r4
	bl	es705_bootup
	movw	r1, #:lower16:.LC162
	mov	r3, r0
	ldr	r2, .L1236+8
	movt	r1, #:upper16:.LC162
	mov	r7, r0
	ldr	r0, [r4]
	bl	_dev_info
	ldr	r3, [r8, #16]
	mov	r0, r5
	add	r3, r3, #1
	str	r3, [r8, #16]
	bl	mutex_lock
	ldr	r3, [r8, #16]
	cmp	r3, #0
	bne	.L1235
.L1194:
	cmp	r7, #0
	beq	.L1198
	movw	r1, #:lower16:.LC178
	ldr	r2, .L1236
	movt	r1, #:upper16:.LC178
	ldr	r0, [r4]
	bl	dev_err
	ldr	r3, [r4, #28]
	ldr	r3, [r3, #68]
	cmp	r3, #0
	beq	.L1186
	mov	r0, #0
	blx	r3
	movw	r1, #3100
	movw	r0, #3000
	bl	usleep_range
	movw	r1, #:lower16:.LC170
	ldr	r2, .L1236
	movt	r1, #:upper16:.LC170
	ldr	r0, [r4]
	bl	_dev_info
	b	.L1186
.L1230:
	mov	r0, r4
	bl	es705_uart_pin_preset
	b	.L1189
.L1233:
	movw	r1, #:lower16:.LC177
	ldr	r2, .L1236
	movt	r1, #:upper16:.LC177
	ldr	r0, [r4]
	bl	_dev_info
	b	.L1198
.L1235:
	movw	r1, #:lower16:.LC177
	ldr	r2, .L1236
	movt	r1, #:upper16:.LC177
	ldr	r0, [r4]
	bl	_dev_info
	b	.L1194
.L1237:
	.align	2
.L1236:
	.word	.LANCHOR2+2732
	.word	.LANCHOR2+928
	.word	.LANCHOR2+2664
	.fnend
	.size	es705_wakeup, .-es705_wakeup
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_power_control_enum, %function
es705_put_power_control_enum:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r5, #:lower16:.LANCHOR2
	movt	r4, #:upper16:.LANCHOR0
	movt	r5, #:upper16:.LANCHOR2
	strd	r6, [sp, #8]
	str	lr, [sp, #32]
	ldr	lr, [r4, #584]
	movw	r7, #:lower16:__stack_chk_guard
	ldr	ip, [r4, #1172]
	movt	r7, #:upper16:__stack_chk_guard
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	ldr	r9, [r1, #72]
	.pad #36
	sub	sp, sp, #36
	movw	r2, #:lower16:.LC184
	movw	r0, #:lower16:.LC10
	ldr	r3, .L1291
	add	lr, r5, lr, lsl #2
	movt	r2, #:upper16:.LC184
	ldr	r1, [r4]
	add	ip, r5, ip, lsl #2
	ldr	r6, [lr, #2808]
	movt	r0, #:upper16:.LC10
	ldr	lr, [ip, #2780]
	ldr	ip, [r7]
	stm	sp, {r6, lr}
	str	ip, [sp, #28]
	bl	dev_printk
	add	ip, r5, r9, lsl #2
	movw	r2, #:lower16:.LC185
	ldr	r3, .L1291
	movw	r0, #:lower16:.LC10
	ldr	r1, [r4]
	ldr	ip, [ip, #2780]
	movt	r2, #:upper16:.LC185
	movt	r0, #:upper16:.LC10
	str	ip, [sp]
	bl	dev_printk
	sub	r3, r9, #2
	cmp	r9, #0
	cmpne	r3, #1
	bls	.L1277
	ldr	r3, [r4, #584]
	cmp	r3, #1
	beq	.L1278
	cmp	r9, #1
	beq	.L1279
.L1242:
	cmp	r9, #4
	ldr	r8, [r4, #1172]
	beq	.L1280
	cmp	r9, #6
	beq	.L1281
	cmp	r9, #5
	beq	.L1259
	add	r3, r5, r3, lsl #2
	add	r8, r5, r8, lsl #2
	ldr	ip, [r3, #2808]
	mov	r6, #0
	ldr	r3, [r8, #2780]
.L1240:
	movw	r2, #:lower16:.LC196
	movw	r0, #:lower16:.LC10
	ldr	r1, [r4]
	movt	r2, #:upper16:.LC196
	str	ip, [sp]
	movt	r0, #:upper16:.LC10
	str	r3, [sp, #4]
	ldr	r3, .L1291
	bl	dev_printk
	ldr	r2, [sp, #28]
	mov	r0, r6
	ldr	r3, [r7]
	cmp	r2, r3
	bne	.L1282
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1278:
	sub	r2, r9, #4
	cmp	r2, #1
	bls	.L1242
	movw	r1, #:lower16:.LC187
	ldr	r2, .L1291
	mvn	r6, #0
	movt	r1, #:upper16:.LC187
	ldr	r0, [r4]
	bl	dev_err
	b	.L1275
.L1280:
	cmp	r8, #5
	beq	.L1246
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	es705_wakeup
	subs	r6, r0, #0
	bne	.L1275
.L1247:
	ldr	r2, [r4, #584]
	mov	r1, #4
	mov	r0, #1
	movw	r3, #:lower16:.LC181
	mov	r6, #0
	movt	r3, #:upper16:.LC181
	str	r0, [r4, #596]
	str	r1, [r4, #1172]
	add	r5, r5, r2, lsl #2
	ldr	ip, [r5, #2808]
	b	.L1240
.L1281:
	cmp	r8, #5
	bne	.L1250
	mov	r1, #0
	mov	r0, #255
	bl	es705_write.constprop.31
	subs	r6, r0, #0
	bne	.L1283
	ldr	r10, .L1291+4
	ldr	r9, .L1291+8
	mov	fp, r10
.L1251:
	mov	r0, #20
	bl	msleep
	ldr	r6, [r10, #8]
	mov	r3, #0
	mov	r2, #0
	mov	r1, fp
	add	r0, sp, #12
	strd	r2, [sp, #12]
	mov	r2, r6
	bl	memcpy
	add	r1, sp, #12
	mov	r2, r6
	add	r0, sp, #20
	bl	memcpy
	mov	r0, r9
	bl	mutex_lock
	mov	r1, #0
	movw	r0, #:lower16:.LANCHOR0
	ldr	ip, [r4, #60]
	mov	r2, r6
	add	r3, sp, #8
	str	r1, [sp]
	movt	r0, #:upper16:.LANCHOR0
	add	r1, sp, #20
	blx	ip
	mov	r6, r0
	mov	r0, r9
	bl	mutex_unlock
	cmp	r6, #0
	blt	.L1284
	ldrh	r0, [sp, #8]
.L1254:
	subs	r6, r0, #0
	ldr	r1, [r4]
	blt	.L1285
	movw	r2, #:lower16:.LC193
	movw	r0, #:lower16:.LC10
	ldr	r3, .L1291+12
	movt	r2, #:upper16:.LC193
	movt	r0, #:upper16:.LC10
	str	r6, [sp]
	bl	dev_printk
	cmp	r6, #0
	beq	.L1256
	subs	r8, r8, #1
	bne	.L1251
	movw	r1, #:lower16:.LC192
	ldr	r2, .L1291+12
	movt	r1, #:upper16:.LC192
	ldr	r0, [r4]
	bl	dev_err
.L1252:
	movw	r1, #:lower16:.LC198
	ldr	r2, .L1291
	movt	r1, #:upper16:.LC198
	ldr	r0, [r4]
	bl	dev_err
	ldr	r3, [r4, #584]
	ldr	r2, [r4, #1172]
	add	r3, r5, r3, lsl #2
	add	r5, r5, r2, lsl #2
	ldr	ip, [r3, #2808]
	ldr	r3, [r5, #2780]
	b	.L1240
.L1279:
	movw	r2, #:lower16:.LC188
	movw	r0, #:lower16:.LC10
	ldr	r3, .L1291
	movt	r2, #:upper16:.LC188
	ldr	r1, [r4]
	movt	r0, #:upper16:.LC10
	bl	dev_printk
	movw	r2, #:lower16:.LC189
	movw	r0, #:lower16:.LC10
	ldr	r3, .L1291+16
	ldr	ip, [r4, #584]
	movt	r2, #:upper16:.LC189
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	str	ip, [sp]
	bl	dev_printk
	add	r0, r4, #560
	bl	mutex_lock
	ldr	r3, [r4, #624]
	cmp	r3, #1
	beq	.L1286
.L1243:
	ldr	r3, [r4, #584]
	cmp	r3, #3
	beq	.L1287
.L1244:
	ldr	r0, .L1291+20
	mov	r6, #0
	bl	mutex_unlock
.L1275:
	ldr	r2, [r4, #584]
.L1276:
	ldr	r3, [r4, #1172]
	add	r2, r5, r2, lsl #2
	ldr	ip, [r2, #2808]
	add	r5, r5, r3, lsl #2
	ldr	r3, [r5, #2780]
	b	.L1240
.L1246:
	mov	r1, r9
	mov	r0, #174
	bl	es705_write.constprop.31
	subs	r6, r0, #0
	bne	.L1288
	mov	r0, #100
	bl	msleep
	b	.L1247
.L1259:
	cmp	r8, #6
	beq	.L1289
	bl	es705_switch_to_vs_mode.constprop.22
	mov	r6, r0
	b	.L1275
.L1284:
	movw	r1, #:lower16:.LC22
	ldr	r2, .L1291+24
	movt	r1, #:upper16:.LC22
	ldr	r0, [r4]
	bl	dev_err
	mov	r0, r6
	b	.L1254
.L1256:
	movw	r2, #:lower16:.LC197
	movw	r0, #:lower16:.LC10
	ldr	r3, .L1291+12
	movt	r2, #:upper16:.LC197
	ldr	r1, [r4]
	movt	r0, #:upper16:.LC10
	bl	dev_printk
	mov	r1, #6
	mov	r0, #174
	bl	es705_write.constprop.31
	subs	r6, r0, #0
	bne	.L1290
	ldr	r3, [r4, #28]
	mov	r2, #6
	str	r2, [r4, #1172]
	ldr	r3, [r3, #68]
	cmp	r3, #0
	beq	.L1266
	blx	r3
	movw	r1, #:lower16:.LC170
	ldr	r2, .L1291+12
	movt	r1, #:upper16:.LC170
	ldr	r0, [r4]
	bl	_dev_info
	ldr	r3, [r4, #1172]
	add	r5, r5, r3, lsl #2
	ldr	r3, [r5, #2780]
.L1258:
	mov	r2, #1
	movw	ip, #:lower16:.LC183
	movt	ip, #:upper16:.LC183
	str	r2, [r4, #584]
	b	.L1240
.L1283:
	movw	r1, #:lower16:.LC191
	ldr	r2, .L1291+12
	movt	r1, #:upper16:.LC191
	ldr	r0, [r4]
	bl	dev_err
	b	.L1252
.L1290:
	movw	r1, #:lower16:.LC194
	ldr	r2, .L1291+12
	movt	r1, #:upper16:.LC194
	ldr	r0, [r4]
	bl	dev_err
	b	.L1252
.L1289:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	es705_wakeup
	subs	r6, r0, #0
	ldr	r2, [r4, #584]
	bne	.L1276
	add	r5, r5, r2, lsl #2
	movw	r3, #:lower16:.LC182
	str	r9, [r4, #1172]
	movt	r3, #:upper16:.LC182
	ldr	ip, [r5, #2808]
	b	.L1240
.L1288:
	movw	r1, #:lower16:.LC190
	ldr	r2, .L1291
	movt	r1, #:upper16:.LC190
	ldr	r0, [r4]
	bl	dev_err
	b	.L1275
.L1287:
	ldr	r0, [r4, #628]
	bl	msecs_to_jiffies
	movw	r1, #:lower16:system_wq
	mov	r3, r0
	ldr	r2, .L1291+28
	movt	r1, #:upper16:system_wq
	mov	r0, #4
	ldr	r1, [r1]
	bl	queue_delayed_work_on
	mov	r3, #2
	str	r3, [r4, #584]
	b	.L1244
.L1286:
	mov	r0, r4
	bl	es705_uart_close
	b	.L1243
.L1285:
	mov	r3, r1
	movw	r1, #:lower16:.LC192
	ldr	r2, .L1291+12
	mov	r0, r3
	movt	r1, #:upper16:.LC192
	bl	dev_err
	b	.L1252
.L1277:
	movw	r1, #:lower16:.LC186
	ldr	r2, .L1291
	mvn	r6, #21
	movt	r1, #:upper16:.LC186
	ldr	r0, [r4]
	bl	dev_err
	b	.L1275
.L1250:
	movw	r1, #:lower16:.LC195
	ldr	r2, .L1291
	mvn	r6, #21
	movt	r1, #:upper16:.LC195
	ldr	r0, [r4]
	bl	dev_err
	b	.L1275
.L1266:
	movw	r3, #:lower16:.LC180
	movt	r3, #:upper16:.LC180
	b	.L1258
.L1282:
	bl	__stack_chk_fail
.L1292:
	.align	2
.L1291:
	.word	.LANCHOR2+2748
	.word	es705_api_access+8192
	.word	.LANCHOR0+144
	.word	.LANCHOR2+2844
	.word	.LANCHOR2+2824
	.word	.LANCHOR0+560
	.word	.LANCHOR2+444
	.word	.LANCHOR0+192
	.fnend
	.size	es705_put_power_control_enum, .-es705_put_power_control_enum
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_codec_resume, %function
es705_codec_resume:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r4, r0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	ldr	r0, [r0, #12]
	bl	dev_get_drvdata
	mov	r5, r0
	movw	r2, #:lower16:.LC199
	ldr	r3, .L1295
	movw	r0, #:lower16:.LC10
	ldr	r1, [r5]
	movt	r2, #:upper16:.LC199
	movt	r0, #:upper16:.LC10
	bl	dev_printk
	mov	r0, r5
	bl	es705_wakeup
	mov	r3, #1
	mov	r0, #0
	str	r3, [r4, #180]
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L1296:
	.align	2
.L1295:
	.word	.LANCHOR2+2860
	.fnend
	.size	es705_codec_resume, .-es705_codec_resume
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_power_control, %function
es705_power_control:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r4, #:lower16:.LANCHOR0
	mov	r5, r0
	strd	r6, [sp, #8]
	movt	r4, #:upper16:.LANCHOR0
	movw	r6, #:lower16:__stack_chk_guard
	strd	r8, [sp, #16]
	ldr	r7, [r4]
	movt	r6, #:upper16:__stack_chk_guard
	strd	r10, [sp, #24]
	mov	r8, r1
	movw	r1, #:lower16:.LC200
	str	lr, [sp, #32]
	.pad #52
	sub	sp, sp, #52
	ldr	r3, [r4, #584]
	ldr	lr, [r4, #1172]
	movt	r1, #:upper16:.LC200
	str	r0, [sp, #4]
	ldr	ip, [r6]
	mov	r0, r7
	ldr	r2, .L1397
	str	lr, [sp]
	str	ip, [sp, #44]
	bl	_dev_info
	sub	r3, r5, #2
	cmp	r5, #0
	cmpne	r3, #1
	bls	.L1385
	ldr	r3, [r4, #584]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L1300
.L1301:
	.word	.L1348
	.word	.L1302
	.word	.L1303
	.word	.L1304
.L1348:
	mvn	r7, #21
.L1297:
	ldr	r2, [sp, #44]
	mov	r0, r7
	ldr	r3, [r6]
	cmp	r2, r3
	bne	.L1386
	add	sp, sp, #52
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1304:
	ldr	r9, [r4, #1172]
	cmp	r9, #5
	beq	.L1331
	cmp	r9, #6
	beq	.L1332
	cmp	r9, #4
	beq	.L1387
.L1356:
	mvn	r7, #21
.L1305:
	movw	r1, #:lower16:.LC205
	ldr	r2, .L1397
	str	r9, [sp]
	movt	r1, #:upper16:.LC205
	ldr	r0, [r4]
	str	r5, [sp, #4]
	bl	_dev_info
	b	.L1297
.L1302:
	ldr	r9, [r4, #1172]
	cmp	r9, #1
	beq	.L1306
	cmp	r9, #6
	bne	.L1356
	cmp	r5, #5
	beq	.L1388
.L1357:
	mov	r7, #0
	b	.L1305
.L1303:
	ldr	r9, [r4, #1172]
	cmp	r9, #4
	beq	.L1313
	cmp	r9, #5
	bne	.L1356
	cmp	r5, #1
	beq	.L1384
	cmp	r5, #4
	beq	.L1389
	cmp	r5, #6
	bne	.L1357
	ldr	r7, .L1397+4
	add	r2, sp, #24
	mov	r1, #0
	mov	r0, #255
	add	r9, sp, #28
	ldr	fp, .L1397+8
	add	r10, sp, #36
	str	r2, [sp, #12]
	bl	es705_write.constprop.31
	str	r5, [sp, #16]
	str	r8, [sp, #20]
	mov	r8, r7
	ldr	r7, [sp, #12]
	str	r6, [sp, #12]
	mov	r6, #11
	b	.L1330
.L1327:
	ldrh	r5, [sp, #24]
.L1328:
	cmp	r5, #0
	beq	.L1390
	subs	r6, r6, #1
	beq	.L1367
.L1330:
	mov	r0, #20
	bl	msleep
	ldr	r5, [r8, #8]
	mov	r3, #0
	mov	r2, #0
	ldr	r1, .L1397+4
	mov	r0, r9
	strd	r2, [r9]
	mov	r2, r5
	bl	memcpy
	mov	r2, r5
	mov	r1, r9
	mov	r0, r10
	bl	memcpy
	mov	r0, fp
	bl	mutex_lock
	mov	r1, #0
	movw	r0, #:lower16:.LANCHOR0
	ldr	ip, [r4, #60]
	mov	r2, r5
	mov	r3, r7
	str	r1, [sp]
	movt	r0, #:upper16:.LANCHOR0
	mov	r1, r10
	blx	ip
	mov	r5, r0
	mov	r0, fp
	bl	mutex_unlock
	cmp	r5, #0
	bge	.L1327
	movw	r1, #:lower16:.LC22
	ldr	r2, .L1397+12
	movt	r1, #:upper16:.LC22
	ldr	r0, [r4]
	bl	dev_err
	b	.L1328
.L1300:
	movw	r1, #:lower16:.LC204
	ldr	r2, .L1397
	mov	r7, #0
	movt	r1, #:upper16:.LC204
	ldr	r0, [r4]
	bl	dev_err
	ldr	r3, [r4, #584]
	ldr	r9, [r4, #1172]
	b	.L1305
.L1306:
	cmp	r5, #4
	beq	.L1391
	cmp	r5, #5
	bne	.L1357
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	es705_wakeup
	subs	r7, r0, #0
	bge	.L1370
.L1373:
	ldr	r2, .L1397+16
	movw	r1, #:lower16:.LC202
.L1369:
	movt	r1, #:upper16:.LC202
	ldr	r0, [r4]
	bl	dev_err
	ldr	r3, [r4, #584]
	ldr	r9, [r4, #1172]
	b	.L1305
.L1313:
	cmp	r5, #1
	beq	.L1384
	cmp	r5, #4
	beq	.L1392
	cmp	r5, #5
	bne	.L1357
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	es705_wakeup
	subs	r7, r0, #0
	blt	.L1371
.L1370:
	bl	es705_switch_to_vs_mode.constprop.22
	mov	r7, r0
	ldr	r3, [r4, #584]
	ldr	r9, [r4, #1172]
	b	.L1305
.L1392:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	es705_wakeup
	subs	r7, r0, #0
	blt	.L1371
	mov	r2, #3
	mov	r1, #1
	mov	r3, r2
	mov	r9, r5
	str	r2, [r4, #584]
	str	r1, [r4, #596]
	str	r5, [r4, #1172]
	b	.L1305
.L1389:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	es705_wakeup
	subs	r7, r0, #0
	blt	.L1371
	mov	r1, r5
	mov	r0, r8
	bl	es705_write.constprop.31
	subs	r7, r0, #0
	movwlt	r1, #:lower16:.LC190
	ldrlt	r2, .L1397+20
	blt	.L1368
.L1341:
	mov	r0, #100
	mov	r9, r5
	bl	msleep
	mov	r2, #1
	ldr	r3, [r4, #584]
	str	r2, [r4, #596]
	str	r5, [r4, #1172]
	b	.L1305
.L1387:
	cmp	r5, #1
	beq	.L1380
	cmp	r5, #5
	beq	.L1370
	b	.L1356
.L1332:
	movw	r2, #:lower16:.LC94
	movw	r0, #:lower16:.LC10
	ldr	r3, .L1397+24
	movt	r2, #:upper16:.LC94
	ldr	r1, [r4]
	movt	r0, #:upper16:.LC10
	bl	dev_printk
	mov	lr, #2
	mov	ip, #5
	ldr	r3, .L1397+24
	movw	r2, #:lower16:.LC203
	movw	r0, #:lower16:.LC10
	ldr	r1, [r4]
	movt	r2, #:upper16:.LC203
	movt	r0, #:upper16:.LC10
	str	lr, [r4, #596]
	str	ip, [r4, #1172]
	mov	r7, #0
	bl	dev_printk
	movw	r1, #:lower16:.LC96
	ldr	r2, .L1397+24
	movt	r1, #:upper16:.LC96
	ldr	r0, [r4]
	bl	_dev_info
	ldr	r3, [r4, #584]
	ldr	r9, [r4, #1172]
	b	.L1305
.L1331:
	cmp	r5, #1
	beq	.L1380
	cmp	r5, #4
	beq	.L1393
	cmp	r5, #6
	bne	.L1357
	ldr	r7, .L1397+4
	add	r2, sp, #24
	mov	r1, #0
	mov	r0, #255
	add	r9, sp, #28
	ldr	fp, .L1397+8
	add	r10, sp, #36
	str	r2, [sp, #12]
	bl	es705_write.constprop.31
	str	r5, [sp, #16]
	str	r8, [sp, #20]
	mov	r8, r7
	ldr	r7, [sp, #12]
	str	r6, [sp, #12]
	mov	r6, #11
	b	.L1346
.L1342:
	ldrh	r5, [sp, #24]
.L1343:
	cmp	r5, #0
	beq	.L1394
	subs	r6, r6, #1
	beq	.L1367
.L1346:
	mov	r0, #20
	bl	msleep
	ldr	r5, [r8, #8]
	mov	r3, #0
	mov	r2, #0
	ldr	r1, .L1397+4
	mov	r0, r9
	strd	r2, [r9]
	mov	r2, r5
	bl	memcpy
	mov	r2, r5
	mov	r1, r9
	mov	r0, r10
	bl	memcpy
	mov	r0, fp
	bl	mutex_lock
	mov	r1, #0
	movw	r0, #:lower16:.LANCHOR0
	ldr	ip, [r4, #60]
	mov	r2, r5
	mov	r3, r7
	str	r1, [sp]
	movt	r0, #:upper16:.LANCHOR0
	mov	r1, r10
	blx	ip
	mov	r5, r0
	mov	r0, fp
	bl	mutex_unlock
	cmp	r5, #0
	bge	.L1342
	movw	r1, #:lower16:.LC22
	ldr	r2, .L1397+12
	movt	r1, #:upper16:.LC22
	ldr	r0, [r4]
	bl	dev_err
	b	.L1343
.L1384:
	ldr	r1, [r4]
	mov	ip, #2
.L1382:
	movw	r2, #:lower16:.LC189
	movw	r0, #:lower16:.LC10
	ldr	r3, .L1397+28
	movt	r2, #:upper16:.LC189
	str	ip, [sp]
	movt	r0, #:upper16:.LC10
	bl	dev_printk
	ldr	r0, .L1397+32
	bl	mutex_lock
	ldr	r3, [r4, #624]
	cmp	r3, #1
	beq	.L1395
.L1338:
	ldr	r3, [r4, #584]
	cmp	r3, #3
	beq	.L1396
.L1339:
	ldr	r0, .L1397+32
	mov	r7, #0
	bl	mutex_unlock
	ldr	r3, [r4, #584]
	ldr	r9, [r4, #1172]
	b	.L1305
.L1385:
	movw	r1, #:lower16:.LC201
	ldr	r2, .L1397
	mvn	r7, #21
	movt	r1, #:upper16:.LC201
	ldr	r0, [r4]
	bl	dev_err
	b	.L1297
.L1380:
	mov	ip, #3
	ldr	r1, [r4]
	b	.L1382
.L1388:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	es705_wakeup
	subs	r7, r0, #0
	blt	.L1373
	mov	r2, #3
	mov	r9, r5
	mov	r3, r2
	str	r2, [r4, #584]
	str	r5, [r4, #1172]
	b	.L1305
.L1391:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	es705_wakeup
	subs	r7, r0, #0
	blt	.L1373
	mov	r1, r5
	mov	r0, r8
	bl	es705_write.constprop.31
	subs	r7, r0, #0
	movwlt	r1, #:lower16:.LC190
	ldrlt	r2, .L1397+16
	blt	.L1368
	mov	r0, #100
	bl	msleep
	mov	r2, #3
	mov	r3, r2
	str	r2, [r4, #584]
	str	r9, [r4, #596]
	mov	r9, r5
	str	r5, [r4, #1172]
	b	.L1305
.L1371:
	movw	r1, #:lower16:.LC202
	ldr	r2, .L1397+20
	b	.L1369
.L1396:
	ldr	r0, [r4, #628]
	bl	msecs_to_jiffies
	movw	r1, #:lower16:system_wq
	mov	r3, r0
	ldr	r2, .L1397+36
	movt	r1, #:upper16:system_wq
	mov	r0, #4
	ldr	r1, [r1]
	bl	queue_delayed_work_on
	mov	r3, #2
	str	r3, [r4, #584]
	b	.L1339
.L1367:
	mov	r7, r5
	ldr	r3, [r4, #584]
	ldr	r9, [r4, #1172]
	ldr	r6, [sp, #12]
	ldr	r5, [sp, #16]
	b	.L1305
.L1393:
	mov	r0, r8
	mov	r1, r5
	bl	es705_write.constprop.31
	subs	r7, r0, #0
	bge	.L1341
	ldr	r2, .L1397+24
	movw	r1, #:lower16:.LC190
.L1368:
	movt	r1, #:upper16:.LC190
	ldr	r0, [r4]
	bl	dev_err
	ldr	r3, [r4, #584]
	ldr	r9, [r4, #1172]
	b	.L1305
.L1395:
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	es705_uart_close
	b	.L1338
.L1390:
	movw	r2, #:lower16:.LC197
	movw	r0, #:lower16:.LC10
	ldr	r3, .L1397+20
	ldr	r8, [sp, #20]
	movt	r2, #:upper16:.LC197
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	mov	r7, r5
	ldr	r6, [sp, #12]
	ldr	r5, [sp, #16]
	bl	dev_printk
	mov	r1, #6
	mov	r0, r8
	bl	es705_write.constprop.31
	mov	r2, #6
	mov	r1, #1
	mov	r9, r2
	mov	r3, r1
	str	r1, [r4, #584]
	str	r2, [r4, #1172]
	b	.L1305
.L1394:
	movw	r2, #:lower16:.LC197
	movw	r0, #:lower16:.LC10
	ldr	r3, .L1397+24
	ldr	r8, [sp, #20]
	movt	r2, #:upper16:.LC197
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	mov	r7, r5
	ldr	r6, [sp, #12]
	ldr	r5, [sp, #16]
	bl	dev_printk
	mov	r1, #6
	mov	r0, r8
	bl	es705_write.constprop.31
	mov	r0, #20
	bl	msleep
	ldr	r3, [r4, #28]
	ldr	r3, [r3, #68]
	cmp	r3, #0
	beq	.L1345
	mov	r0, r7
	blx	r3
	movw	r1, #:lower16:.LC170
	ldr	r2, .L1397+24
	movt	r1, #:upper16:.LC170
	ldr	r0, [r4]
	bl	_dev_info
.L1345:
	mov	r2, #6
	mov	r3, #1
	mov	r9, r2
	str	r3, [r4, #584]
	str	r2, [r4, #1172]
	b	.L1305
.L1386:
	bl	__stack_chk_fail
.L1398:
	.align	2
.L1397:
	.word	.LANCHOR2+2880
	.word	es705_api_access+8192
	.word	.LANCHOR0+144
	.word	.LANCHOR2+444
	.word	.LANCHOR2+2900
	.word	.LANCHOR2+2928
	.word	.LANCHOR2+2964
	.word	.LANCHOR2+2824
	.word	.LANCHOR0+560
	.word	.LANCHOR0+192
	.fnend
	.size	es705_power_control, .-es705_power_control
	.align	2
	.global	fw_download
	.syntax unified
	.arm
	.fpu softvfp
	.type	fw_download, %function
fw_download:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:.LC206
	strd	r4, [sp, #-28]!
	.save {r4, r5, r6, r7, r8, r9, lr}
	ldr	r2, .L1411
	strd	r6, [sp, #8]
	movt	r1, #:upper16:.LC206
	mov	r6, r0
	strd	r8, [sp, #16]
	ldr	r4, .L1411+4
	mov	r5, #0
	str	lr, [sp, #24]
	.pad #12
	sub	sp, sp, #12
	ldr	r0, [r0]
	bl	_dev_info
	mov	r0, r6
	mov	r7, #1
	bl	es705_bootup
	movw	r1, #:lower16:.LC207
	mov	r3, r0
	ldr	r2, .L1411
	movt	r1, #:upper16:.LC207
	ldr	r0, [r6]
	bl	_dev_info
	ldr	r8, [r6, #128]
	mov	r0, r8
	bl	es705_init_slim_slave
	ldr	r3, [r8, #352]
	movw	r2, #:lower16:.LC208
	movw	r0, #:lower16:.LC10
	mov	r1, r8
	movt	r2, #:upper16:.LC208
	movt	r0, #:upper16:.LC10
	str	r3, [sp]
	ldr	r3, .L1411+8
	bl	dev_printk
	mov	r2, r4
	add	r1, r4, #1360
	mov	r0, r8
	mov	r3, #10
	bl	snd_soc_register_codec
	mov	r9, r0
	movw	r2, #:lower16:.LC209
	ldr	r3, .L1411+8
	movw	r0, #:lower16:.LC10
	mov	r1, r8
	movt	r2, #:upper16:.LC209
	str	r9, [sp]
	movt	r0, #:upper16:.LC10
	sub	r8, r4, #2656
	bl	dev_printk
	b	.L1403
.L1410:
	tst	r2, #21
	beq	.L1400
	ldr	r0, [r4, #112]
.L1402:
	movw	r1, #32976
	lsl	r0, r0, #2
	bl	__kmalloc
	add	r3, r8, r5
	str	r0, [r3, #300]
.L1400:
	add	r5, r5, #16
	add	r4, r4, #136
	cmp	r5, #96
	beq	.L1409
.L1403:
	ldr	r3, [r4, #4]
	cmp	r3, #5
	lsl	r2, r7, r3
	bhi	.L1400
	tst	r2, #42
	beq	.L1410
	ldr	r0, [r4, #72]
	b	.L1402
.L1409:
	mov	r0, r6
	bl	es705_slim_map_channels
	movw	r1, #:lower16:.LC210
	mov	r3, r9
	ldr	r2, .L1411
	movt	r1, #:upper16:.LC210
	ldr	r0, [r6]
	bl	_dev_info
	ldr	r2, .L1411
	movw	r1, #:lower16:.LC211
	movt	r1, #:upper16:.LC211
	ldr	r0, [r6]
	bl	_dev_info
	mov	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	add	sp, sp, #24
	ldr	pc, [sp], #4
.L1412:
	.align	2
.L1411:
	.word	.LANCHOR2+2992
	.word	.LANCHOR0+2656
	.word	.LANCHOR2+3004
	.fnend
	.size	fw_download, .-fw_download
	.align	2
	.global	es705_remote_route_enable
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_remote_route_enable, %function
es705_remote_route_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	mov	r5, r0
	str	lr, [sp, #8]
	ldr	lr, [r0]
	.pad #12
	sub	sp, sp, #12
	ldr	ip, [r0, #4]
	movt	r4, #:upper16:.LANCHOR0
	movw	r2, #:lower16:.LC212
	movw	r0, #:lower16:.LC10
	ldr	r3, .L1422
	movt	r2, #:upper16:.LC212
	ldr	r1, [r4]
	movt	r0, #:upper16:.LC10
	str	lr, [sp]
	str	ip, [sp, #4]
	bl	dev_printk
	ldr	r3, [r5, #4]
	cmp	r3, #1
	beq	.L1415
	cmp	r3, #2
	beq	.L1416
	cmp	r3, #0
	movne	r0, #0
	beq	.L1421
.L1413:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L1421:
	ldr	r0, [r4, #1156]
	b	.L1413
.L1416:
	ldr	r0, [r4, #1164]
	b	.L1413
.L1415:
	ldr	r0, [r4, #1160]
	b	.L1413
.L1423:
	.align	2
.L1422:
	.word	.LANCHOR2+3024
	.fnend
	.size	es705_remote_route_enable, .-es705_remote_route_enable
	.align	2
	.global	es705_put_veq_block
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_put_veq_block, %function
es705_put_veq_block:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-36]!
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	strd	r6, [sp, #8]
	ldr	r3, [r4, #584]
	strd	r8, [sp, #16]
	strd	r10, [sp, #24]
	str	lr, [sp, #32]
	.pad #28
	sub	sp, sp, #28
	cmp	r3, #3
	bne	.L1477
	cmp	r0, #5
	mov	r6, r0
	bhi	.L1478
	ldr	r3, [r4, #1416]
	cmp	r3, #0
	beq	.L1428
	ldr	r3, [r4, #1412]
	cmp	r3, r0
	beq	.L1428
	add	r0, r4, #144
	add	r7, sp, #24
	bl	mutex_lock
	mov	r3, #61
	ldr	r5, [r4, #56]
	mov	r2, #4
	movt	r3, 45079
	mov	r0, r4
	str	r6, [r4, #1412]
	str	r3, [r7, #-12]!
	mov	r1, r7
	blx	r5
	subs	r5, r0, #0
	blt	.L1479
	movw	r8, #:lower16:.LANCHOR1
	lsl	r9, r6, #2
	ldr	r5, [r4, #56]
	movt	r8, #:upper16:.LANCHOR1
	ldr	r3, [r8]
	mov	r1, #15
	movw	r0, #:lower16:.LANCHOR0
	movt	r1, 36888
	mov	r2, #4
	movt	r0, #:upper16:.LANCHOR0
	cmp	r3, #1
	add	r3, r4, r9
	ldreq	r3, [r3, #1468]
	ldrne	r3, [r3, #1492]
	cmp	r3, r1
	movcs	r3, r1
	mov	r1, r7
	str	r3, [sp, #12]
	blx	r5
	ldr	ip, [sp, #12]
	mov	r5, r0
	movw	r2, #:lower16:.LC217
	movw	r0, #:lower16:.LC10
	movt	r2, #:upper16:.LC217
	ldr	r3, .L1484
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	str	ip, [sp]
	str	r6, [sp, #4]
	bl	dev_printk
	cmp	r5, #0
	blt	.L1480
	mov	r3, #37
	movw	r0, #:lower16:.LANCHOR0
	ldr	r5, [r4, #56]
	movt	r3, 45079
	movt	r0, #:upper16:.LANCHOR0
	mov	r2, #4
	mov	r1, r7
	str	r3, [sp, #12]
	blx	r5
	subs	r5, r0, #0
	blt	.L1476
	ldr	r3, [r8]
	add	r9, r4, r9
	mov	r1, #30
	movt	r1, 36888
	movw	r0, #:lower16:.LANCHOR0
	ldr	r5, [r4, #56]
	mov	r2, #4
	movt	r0, #:upper16:.LANCHOR0
	cmp	r3, #1
	ldreq	r3, [r9, #1420]
	ldrne	r3, [r9, #1444]
	cmp	r3, r1
	movcs	r3, r1
	mov	r1, r7
	str	r3, [sp, #12]
	blx	r5
	ldr	ip, [sp, #12]
	mov	r5, r0
	movw	r2, #:lower16:.LC220
	movw	r0, #:lower16:.LC10
	movt	r2, #:upper16:.LC220
	ldr	r3, .L1484
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	str	ip, [sp]
	str	r6, [sp, #4]
	bl	dev_printk
	cmp	r5, #0
	blt	.L1476
	ldr	r3, [r8]
	cmp	r3, #1
	beq	.L1481
	ldr	r2, .L1484+4
	rsb	r6, r6, r6, lsl #5
	mov	r8, #62
	mov	r3, r8
	movt	r3, 32815
	mov	r9, r8
	add	r6, r2, r6, lsl #1
.L1444:
	movw	r0, #:lower16:.LANCHOR0
	str	r3, [sp, #12]
	ldr	r3, [r4, #56]
	mov	r2, #4
	mov	r1, r7
	movt	r0, #:upper16:.LANCHOR0
	blx	r3
	ldr	ip, [sp, #12]
	mov	r5, r0
	movw	r2, #:lower16:.LC221
	movw	r0, #:lower16:.LC10
	movt	r2, #:upper16:.LC221
	ldr	r3, .L1484
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	str	ip, [sp]
	bl	dev_printk
	cmp	r5, #0
	blt	.L1482
	movw	r1, #10000
	movw	r10, #:lower16:.LANCHOR0
	mov	r0, r1
	movt	r10, #:upper16:.LANCHOR0
	mov	fp, #10
	bl	usleep_range
.L1447:
	mov	r2, #4
	ldr	r3, [r4, #52]
	add	r1, sp, #16
	mov	r0, r10
	blx	r3
	mov	r1, #2000
	mov	r5, r0
	mov	r0, r1
	bl	usleep_range
	ldr	r1, [sp, #12]
	sub	r2, fp, #1
	ldr	r3, [sp, #16]
	cmp	r3, r1
	beq	.L1460
	ands	fp, r2, #255
	bne	.L1447
	movw	r1, #:lower16:.LC224
	ldr	r2, .L1484
	movt	r1, #:upper16:.LC224
	ldr	r0, [r4]
	bl	dev_err
.L1457:
	ldr	r0, .L1484+8
	bl	mutex_unlock
	cmp	r5, #0
	beq	.L1424
.L1459:
	movw	r1, #:lower16:.LC223
	mov	r3, r5
	ldr	r2, .L1484
	movt	r1, #:upper16:.LC223
	ldr	r0, [r4]
	bl	dev_err
	b	.L1424
.L1428:
	movw	r1, #:lower16:.LC215
	mov	r3, r6
	ldr	r2, .L1484
	movt	r1, #:upper16:.LC215
	ldr	r0, [r4]
	mov	r5, #0
	bl	_dev_info
.L1424:
	mov	r0, r5
	add	sp, sp, #28
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldrd	r8, [sp, #16]
	ldrd	r10, [sp, #24]
	add	sp, sp, #32
	ldr	pc, [sp], #4
.L1477:
	movw	r1, #:lower16:.LC213
	ldr	r2, .L1484
	mov	r5, #0
	movt	r1, #:upper16:.LC213
	ldr	r0, [r4]
	bl	_dev_info
	b	.L1424
.L1478:
	movw	r1, #:lower16:.LC214
	mov	r3, r0
	ldr	r2, .L1484
	movt	r1, #:upper16:.LC214
	ldr	r0, [r4]
	mov	r5, #0
	bl	_dev_info
	b	.L1424
.L1481:
	ldr	r1, .L1484+12
	mov	r2, #74
	mov	r3, r2
	mov	r8, r2
	movt	r3, 32815
	mov	r9, r2
	mla	r6, r2, r6, r1
	b	.L1444
.L1476:
	movw	r1, #:lower16:.LC219
	ldr	r2, .L1484
	movt	r1, #:upper16:.LC219
	ldr	r0, [r4]
	ldr	r3, [sp, #12]
	bl	dev_err
.L1431:
	ldr	r0, .L1484+8
	bl	mutex_unlock
	b	.L1459
.L1479:
	movw	r1, #:lower16:.LC216
	ldr	r2, .L1484
	movt	r1, #:upper16:.LC216
	ldr	r0, [r4]
	ldr	r3, [sp, #12]
	bl	dev_err
	b	.L1431
.L1482:
	movw	r1, #:lower16:.LC222
	ldr	r2, .L1484
	movt	r1, #:upper16:.LC222
	ldr	r0, [r4]
	ldr	r3, [sp, #12]
	bl	dev_err
	b	.L1431
.L1460:
	movw	fp, #:lower16:.LANCHOR0
	mov	r5, #0
	movt	fp, #:upper16:.LANCHOR0
	b	.L1446
.L1449:
	ldr	r3, [r6, r5]
	.syntax divided
@ 38 "/home/pascua14/Desktop/s5-kernel/arch/arm/include/asm/swab.h" 1
	rev r3, r3
@ 0 "" 2
	.arm
	.syntax unified
.L1475:
	add	r5, r5, r10
	str	r3, [sp, #12]
	mov	r2, #4
	uxtb	r5, r5
	mov	r1, r7
	ldr	r3, [r4, #56]
	mov	r0, fp
	blx	r3
	cmp	r9, r5
	bls	.L1483
.L1446:
	sub	r3, r8, r5
	cmp	r3, #4
	movlt	r10, r3
	movge	r10, #4
	cmp	r3, #3
	bgt	.L1449
	cmp	r3, #0
	movle	r3, #0
	ble	.L1475
	ldrb	r3, [r6, r5]	@ zero_extendqisi2
	sub	r1, r10, #1
	add	r2, r5, #1
	cmp	r1, #0
	uxtb	r2, r2
	movle	r10, r1
	movle	r5, r2
	lslle	r3, r3, #24
	ble	.L1475
	ldrb	r0, [r6, r2]	@ zero_extendqisi2
	sub	r1, r10, #2
	add	r2, r5, #2
	cmp	r1, #0
	uxtb	r2, r2
	movle	r10, r1
	orr	r3, r0, r3, lsl #8
	movle	r5, r2
	lslle	r3, r3, #16
	ble	.L1475
	ldrb	r0, [r6, r2]	@ zero_extendqisi2
	sub	r1, r10, #3
	cmp	r1, #1
	add	r2, r5, #3
	uxtb	r2, r2
	orr	r3, r0, r3, lsl #8
	lsl	r3, r3, #8
	bne	.L1462
	ldrb	r2, [r6, r2]	@ zero_extendqisi2
	add	r5, r5, #4
	uxtb	r5, r5
	sub	r10, r10, #4
	orr	r3, r3, r2
	b	.L1475
.L1483:
	movw	r1, #10000
	movw	r7, #:lower16:.LANCHOR0
	mov	r8, #0
	mov	r0, r1
	movt	r7, #:upper16:.LANCHOR0
	movt	r8, 32815
	mov	r6, #10
	mvn	r9, #0
	bl	usleep_range
.L1455:
	mov	r2, #4
	ldr	r3, [r4, #52]
	add	r1, sp, #20
	mov	r0, r7
	str	r9, [sp, #20]
	blx	r3
	mov	r1, #2000
	mov	r5, r0
	mov	r0, r1
	bl	usleep_range
	ldr	r3, [sp, #20]
	sub	r2, r6, #1
	cmp	r3, r8
	beq	.L1454
	ands	r6, r2, #255
	bne	.L1455
	movw	r1, #:lower16:.LC225
	ldr	r2, .L1484
	movt	r1, #:upper16:.LC225
	ldr	r0, [r4]
	bl	dev_err
	b	.L1457
.L1454:
	movw	r1, #:lower16:.LC226
	ldr	r2, .L1484
	movt	r1, #:upper16:.LC226
	ldr	r0, [r4]
	bl	_dev_info
	b	.L1457
.L1480:
	movw	r1, #:lower16:.LC218
	ldr	r2, .L1484
	movt	r1, #:upper16:.LC218
	ldr	r0, [r4]
	ldr	r3, [sp, #12]
	bl	dev_err
	b	.L1431
.L1462:
	mov	r10, r1
	mov	r5, r2
	b	.L1475
.L1485:
	.align	2
.L1484:
	.word	.LANCHOR2+3052
	.word	.LANCHOR0+1964
	.word	.LANCHOR0+144
	.word	.LANCHOR0+1520
	.fnend
	.size	es705_put_veq_block, .-es705_put_veq_block
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_forced_reroute, %function
es705_forced_reroute:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	movw	r4, #:lower16:.LANCHOR0
	movw	r5, #:lower16:.LANCHOR2
	str	r6, [sp, #8]
	movw	r6, #:lower16:.LANCHOR1
	movt	r4, #:upper16:.LANCHOR0
	movt	r6, #:upper16:.LANCHOR1
	str	lr, [sp, #12]
	.pad #8
	sub	sp, sp, #8
	ldr	ip, [r6, #8]
	movt	r5, #:upper16:.LANCHOR2
	movw	r1, #:lower16:.LC227
	add	r2, r5, #3072
	movt	r1, #:upper16:.LC227
	ldr	r0, [r4]
	ldr	r3, [r4, #1148]
	str	ip, [sp]
	bl	_dev_info
	ldr	r3, [r4, #1148]
	mov	r0, r4
	add	r5, r5, r3, lsl #2
	ldr	r1, [r5, #2056]
	bl	es705_write_block
	ldr	r3, [r6, #8]
	cmp	r3, #0
	bne	.L1490
	mvn	r2, #0
	mov	r3, #1
	ldr	r0, [r4, #1412]
	str	r2, [r4, #1412]
	str	r3, [r4, #1416]
	bl	es705_put_veq_block
.L1488:
	mov	r3, #0
	str	r3, [r6, #8]
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L1490:
	mov	r0, #106
	bl	es705_write.constprop.30
	b	.L1488
	.fnend
	.size	es705_forced_reroute, .-es705_forced_reroute
	.align	2
	.global	es705_remote_add_codec_controls
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_remote_add_codec_controls, %function
es705_remote_add_codec_controls:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-16]!
	.save {r4, r5, r6, lr}
	mov	r2, #54
	ldr	r1, .L1497
	mov	r5, r0
	str	r6, [sp, #8]
	str	lr, [sp, #12]
	bl	snd_soc_add_codec_controls
	subs	r4, r0, #0
	beq	.L1491
	movw	r1, #:lower16:.LC228
	ldr	r2, .L1497+4
	movt	r1, #:upper16:.LC228
	ldr	r0, [r5, #12]
	bl	dev_err
.L1491:
	mov	r0, r4
	ldrd	r4, [sp]
	ldr	r6, [sp, #8]
	add	sp, sp, #12
	ldr	pc, [sp], #4
.L1498:
	.align	2
.L1497:
	.word	.LANCHOR3-4048
	.word	.LANCHOR2+3096
	.fnend
	.size	es705_remote_add_codec_controls, .-es705_remote_add_codec_controls
	.align	2
	.global	es705_irq_event
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_irq_event, %function
es705_irq_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L1510
	movw	r3, #:lower16:.LANCHOR2
	movw	r2, #3128
	movt	r3, #:upper16:.LANCHOR2
	strd	r4, [sp, #-20]!
	.save {r4, r5, r6, r7, lr}
	mov	r4, r1
	add	r2, r3, r2
	strd	r6, [sp, #8]
	add	r5, r1, #144
	str	lr, [sp, #16]
	ldrd	r2, [r2]
	.pad #36
	sub	sp, sp, #36
	ldr	r1, [ip, #8]
	mov	r0, r5
	strd	r2, [sp, #20]
	str	r1, [sp, #28]
	bl	mutex_lock
	movw	r3, #:lower16:.LANCHOR3
	movw	r1, #:lower16:.LC229
	ldr	r2, .L1510+4
	ldr	ip, [r4, #596]
	movt	r3, #:upper16:.LANCHOR3
	movt	r1, #:upper16:.LC229
	ldr	r0, [r4]
	add	r3, r3, ip, lsl #2
	ldr	r3, [r3, #-1456]
	bl	_dev_info
	ldr	r2, [r4, #1172]
	mov	r3, #0
	movt	r3, 32877
	str	r3, [sp, #12]
	cmp	r2, #6
	beq	.L1508
.L1500:
	mov	r0, #0
	ldr	r6, [r4, #60]
	add	r3, sp, #16
	mov	r2, #4
	add	r1, sp, #12
	str	r0, [sp]
	mov	r0, r4
	blx	r6
	cmp	r0, #0
	bne	.L1507
	ldr	r3, [r4, #596]
	cmp	r3, #2
	beq	.L1509
.L1502:
	mov	r0, r5
	bl	mutex_unlock
	movw	r0, #:lower16:.LANCHOR0
	add	r1, sp, #20
	movt	r0, #:upper16:.LANCHOR0
	bl	es705_write_block
	mov	r0, #1
	add	sp, sp, #36
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	add	sp, sp, #16
	ldr	pc, [sp], #4
.L1507:
	movw	r1, #:lower16:.LC230
	ldr	r2, .L1510+8
	movt	r1, #:upper16:.LC230
	ldr	r0, [r4]
	bl	dev_err
	b	.L1502
.L1509:
	ldrh	ip, [sp, #16]
	movw	r1, #:lower16:.LC231
	movt	r1, #:upper16:.LC231
	ldr	r2, .L1510+8
	ldr	r0, [r4]
	mov	r3, ip
	str	ip, [sp, #16]
	bl	_dev_info
	ldrb	r6, [sp, #16]	@ zero_extendqisi2
	cmp	r6, #2
	bne	.L1502
	movw	r1, #:lower16:.LC232
	ldr	r2, .L1510+8
	movw	r7, #:lower16:.LANCHOR0
	movt	r1, #:upper16:.LC232
	ldr	r0, [r4]
	movt	r7, #:upper16:.LANCHOR0
	bl	_dev_info
	mov	r0, r4
	str	r6, [r4, #604]
	bl	es705_vs_event
	movw	r1, #:lower16:.LC233
	ldr	r2, .L1510+8
	movt	r1, #:upper16:.LC233
	ldr	r0, [r7]
	bl	_dev_info
	mov	r3, #3
	mov	r1, #174
	mov	r0, #5
	str	r3, [r4, #584]
	ldr	r3, [r7, #1380]
	blx	r3
	b	.L1502
.L1508:
	mov	r0, r4
	bl	es705_wakeup
	cmp	r0, #0
	bne	.L1507
	mov	r0, #50
	bl	msleep
	b	.L1500
.L1511:
	.align	2
.L1510:
	.word	.LANCHOR2+3128
	.word	.LANCHOR2+3140
	.word	.LANCHOR2+3156
	.fnend
	.size	es705_irq_event, .-es705_irq_event
	.align	2
	.global	es705_core_probe
	.syntax unified
	.arm
	.fpu softvfp
	.type	es705_core_probe, %function
es705_core_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	strd	r6, [sp, #8]
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r7, [r0, #84]
	.pad #8
	sub	sp, sp, #8
	cmp	r7, #0
	beq	.L1536
	movw	r2, #:lower16:es705_uart_open
	movw	r4, #:lower16:.LANCHOR0
	movt	r2, #:upper16:es705_uart_open
	movt	r4, #:upper16:.LANCHOR0
	mov	r1, r0
	movw	r3, #:lower16:es705_uart_close
	cmp	r2, #0
	movt	r3, #:upper16:es705_uart_close
	str	r1, [r4]
	mov	r1, #1
	moveq	r1, r2
	cmp	r3, #0
	mov	r0, #0
	str	r7, [r4, #28]
	strd	r2, [r4, #88]
	mov	r2, #1
	moveq	r2, r3
	and	r1, r1, r2
	str	r0, [r4, #600]
	tst	r1, #1
	bne	.L1527
	ldrd	r2, [r4, #52]
.L1515:
	movw	r0, #:lower16:.LANCHOR0
	strd	r2, [r4, #96]
	mov	r5, #0
	movt	r0, #:upper16:.LANCHOR0
	bl	es705_clk_init
	movw	r2, #:lower16:system_rev
	movw	r3, #:lower16:es705_uart_fw_download
	str	r5, [r4, #624]
	movt	r2, #:upper16:system_rev
	movt	r3, #:upper16:es705_uart_fw_download
	ldr	r2, [r2]
	movw	r1, #:lower16:es705_uart_es705_wakeup
	mvn	ip, #0
	movt	r1, #:upper16:es705_uart_es705_wakeup
	str	r3, [r4, #76]
	movw	r3, #:lower16:es705_power_control
	movt	r3, #:upper16:es705_power_control
	str	r1, [r4, #80]
	movw	r1, #:lower16:.LC235
	cmp	r2, #5
	movt	r1, #:upper16:.LC235
	str	r3, [r4, #1380]
	movls	r0, #0
	movhi	r0, #1
	str	r5, [r4, #1408]
	movls	r2, r0
	movhi	r2, #3
	str	r5, [r4, #1416]
	str	r0, [r4, #1392]
	mov	r0, #2000
	str	r2, [r4, #620]
	ldr	r2, .L1540
	str	r0, [r4, #628]
	ldr	r0, .L1540+4
	str	ip, [r4, #1412]
	bl	__mutex_init
	movw	r1, #:lower16:.LC236
	ldr	r2, .L1540
	movt	r1, #:upper16:.LC236
	ldr	r0, .L1540+8
	bl	__mutex_init
	movw	r1, #:lower16:.LC237
	ldr	r2, .L1540
	movt	r1, #:upper16:.LC237
	ldr	r0, .L1540+12
	bl	__mutex_init
	movw	r1, #:lower16:.LC238
	ldr	r2, .L1540
	movt	r1, #:upper16:.LC238
	ldr	r0, .L1540+16
	bl	__init_waitqueue_head
	ldr	r0, [r4]
	ldr	r3, .L1540+20
	ldr	r1, .L1540+24
	add	r0, r0, #8
	strh	r5, [r3]	@ movhi
	bl	sysfs_create_group
	subs	r3, r0, #0
	bne	.L1537
.L1519:
	ldr	r5, .L1540+28
	mov	r8, #65024
	movw	ip, #:lower16:es705_delayed_sleep
	mov	r3, #0
	movt	ip, #:upper16:es705_delayed_sleep
	movt	r8, 65535
	mov	r2, r3
	mov	r1, r3
	movw	r6, #:lower16:delayed_work_timer_fn
	add	r0, r5, #12
	str	r8, [r4, #192]
	movt	r6, #:upper16:delayed_work_timer_fn
	str	r5, [r4, #196]
	str	r5, [r4, #200]
	str	ip, [r4, #204]
	bl	init_timer_key
	sub	r2, r5, #4
	movw	ip, #:lower16:es705_forced_reroute
	str	r6, [r4, #224]
	add	lr, r5, #52
	mov	r3, #0
	movt	ip, #:upper16:es705_forced_reroute
	mov	r1, r3
	str	r2, [r4, #228]
	add	r0, r5, #64
	mov	r2, r3
	str	r8, [r4, #244]
	str	lr, [r4, #248]
	str	lr, [r4, #252]
	str	ip, [r4, #256]
	bl	init_timer_key
	add	r3, r5, #48
	sub	r0, r5, #196
	str	r6, [r4, #276]
	str	r3, [r4, #280]
	bl	es705_init_input_device
	subs	r6, r0, #0
	bge	.L1538
.L1514:
.L1524:
.L1525:
.L1526:
	movw	r2, #:lower16:.LC242
	movw	r0, #:lower16:.LC10
	ldr	r3, .L1540+32
	movt	r2, #:upper16:.LC242
	movt	r0, #:upper16:.LC10
	ldr	r1, [r4]
	bl	dev_printk
.L1512:
	mov	r0, r6
	add	sp, sp, #8
	@ sp needed
	ldrd	r4, [sp]
	ldrd	r6, [sp, #8]
	ldr	r8, [sp, #16]
	add	sp, sp, #20
	ldr	pc, [sp], #4
.L1527:
	movw	r3, #:lower16:es705_uart_write
	movw	r2, #:lower16:es705_uart_read
	movt	r3, #:upper16:es705_uart_write
	movt	r2, #:upper16:es705_uart_read
	b	.L1515
.L1538:
	sub	r0, r5, #196
	bl	es705_gpio_init
	subs	r6, r0, #0
	bne	.L1526
	movw	r1, #:lower16:.LC240
	sub	r0, r5, #188
	ldr	r2, [r4]
	movt	r1, #:upper16:.LC240
	bl	request_firmware
	subs	r6, r0, #0
	beq	.L1520
	movw	r3, #:lower16:.LC240
	movw	r1, #:lower16:.LC51
	ldr	r2, .L1540+32
	movt	r3, #:upper16:.LC240
	movt	r1, #:upper16:.LC51
	ldr	r0, [r4]
	str	r6, [sp]
	bl	dev_err
	b	.L1526
.L1537:
	movw	r1, #:lower16:.LC239
	ldr	r2, .L1540+32
	movt	r1, #:upper16:.LC239
	ldr	r0, [r4]
	bl	dev_err
	b	.L1519
.L1536:
	movw	r1, #:lower16:.LC234
	ldr	r2, .L1540+32
	movw	r4, #:lower16:.LANCHOR0
	movt	r1, #:upper16:.LC234
	movt	r4, #:upper16:.LANCHOR0
	bl	dev_err
	mvn	r6, #4
	b	.L1526
.L1520:
	movw	r1, #:lower16:.LC241
	sub	r0, r5, #184
	ldr	r2, [r4]
	movt	r1, #:upper16:.LC241
	bl	request_firmware
	subs	r6, r0, #0
	bne	.L1539
	ldr	r3, [r7, #68]
	cmp	r3, #0
	beq	.L1522
	mov	r0, #1
	blx	r3
	movw	r1, #:lower16:.LC175
	ldr	r2, .L1540+32
	movt	r1, #:upper16:.LC175
	ldr	r0, [r4]
	bl	_dev_info
.L1522:
	movw	r1, #5000
	mov	r0, r1
	bl	usleep_range
	movw	r0, #:lower16:.LANCHOR0
	movt	r0, #:upper16:.LANCHOR0
	bl	es705_gpio_reset
	mov	r2, #0
	mov	r3, #1
	str	r2, [r4, #584]
	str	r3, [r4, #600]
	b	.L1512
.L1539:
	movw	r3, #:lower16:.LC241
	movw	r1, #:lower16:.LC51
	ldr	r2, .L1540+32
	movt	r3, #:upper16:.LC241
	movt	r1, #:upper16:.LC51
	ldr	r0, [r4]
	str	r6, [sp]
	bl	dev_err
	ldr	r0, [r4, #8]
	bl	release_firmware
	b	.L1526
.L1541:
	.align	2
.L1540:
	.word	.LANCHOR1+20
	.word	.LANCHOR0+144
	.word	.LANCHOR0+560
	.word	.LANCHOR0+168
	.word	.LANCHOR0+1360
	.word	.LANCHOR0+632
	.word	.LANCHOR3-1444
	.word	.LANCHOR0+196
	.word	.LANCHOR2+3176
	.fnend
	.size	es705_core_probe, .-es705_core_probe
	.global	soc_codec_dev_es705
	.global	es705_streaming_cmds
	.global	es705_dai
	.global	esxxx_mode
	.global	es705_priv
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.29500, %object
	.size	__func__.29500, 25
__func__.29500:
	.ascii	"es705_put_vs_abort_value\000"
	.space	3
	.type	__func__.29485, %object
	.size	__func__.29485, 33
__func__.29485:
	.ascii	"es705_get_voice_lpm_enable_value\000"
	.space	3
	.type	__func__.29495, %object
	.size	__func__.29495, 25
__func__.29495:
	.ascii	"es705_get_vs_abort_value\000"
	.space	3
	.type	__func__.29470, %object
	.size	__func__.29470, 36
__func__.29470:
	.ascii	"es705_get_voice_wakeup_enable_value\000"
	.type	__func__.29625, %object
	.size	__func__.29625, 19
__func__.29625:
	.ascii	"es705_get_aud_zoom\000"
	.space	1
	.type	__func__.29535, %object
	.size	__func__.29535, 19
__func__.29535:
	.ascii	"es705_get_ns_value\000"
	.space	1
	.type	__func__.29747, %object
	.size	__func__.29747, 24
__func__.29747:
	.ascii	"es705_get_internal_rate\000"
	.type	__func__.29459, %object
	.size	__func__.29459, 33
__func__.29459:
	.ascii	"es705_put_rx2_route_enable_value\000"
	.space	3
	.type	__func__.29454, %object
	.size	__func__.29454, 33
__func__.29454:
	.ascii	"es705_get_rx2_route_enable_value\000"
	.space	3
	.type	__func__.29449, %object
	.size	__func__.29449, 33
__func__.29449:
	.ascii	"es705_put_tx1_route_enable_value\000"
	.space	3
	.type	__func__.29444, %object
	.size	__func__.29444, 33
__func__.29444:
	.ascii	"es705_get_tx1_route_enable_value\000"
	.space	3
	.type	__func__.29439, %object
	.size	__func__.29439, 33
__func__.29439:
	.ascii	"es705_put_rx1_route_enable_value\000"
	.space	3
	.type	__func__.29434, %object
	.size	__func__.29434, 33
__func__.29434:
	.ascii	"es705_get_rx1_route_enable_value\000"
	.space	3
	.type	__func__.29090, %object
	.size	__func__.29090, 21
__func__.29090:
	.ascii	"es705_gpio_reset_set\000"
	.space	3
	.type	__func__.28935, %object
	.size	__func__.28935, 12
__func__.28935:
	.ascii	"es705_write\000"
	.type	__func__.28919, %object
	.size	__func__.28919, 11
__func__.28919:
	.ascii	"es705_read\000"
	.space	1
	.type	__func__.29774, %object
	.size	__func__.29774, 24
__func__.29774:
	.ascii	"es705_ap_put_tx1_ch_cnt\000"
	.type	__func__.29717, %object
	.size	__func__.29717, 23
__func__.29717:
	.ascii	"es705_forced_reroute_w\000"
	.space	1
	.type	__func__.30099, %object
	.size	__func__.30099, 18
__func__.30099:
	.ascii	"es705_codec_probe\000"
	.space	2
	.type	__func__.29235, %object
	.size	__func__.29235, 18
__func__.29235:
	.ascii	"es705_veq_adj_set\000"
	.space	2
	.type	__func__.29215, %object
	.size	__func__.29215, 18
__func__.29215:
	.ascii	"es705_veq_max_set\000"
	.space	2
	.type	__func__.29122, %object
	.size	__func__.29122, 17
__func__.29122:
	.ascii	"es705_tuning_set\000"
	.space	3
	.type	__func__.29176, %object
	.size	__func__.29176, 28
__func__.29176:
	.ascii	"es705_preset_delay_time_set\000"
	.type	__func__.29161, %object
	.size	__func__.29161, 22
__func__.29161:
	.ascii	"es705_sleep_delay_set\000"
	.space	2
	.type	__func__.29078, %object
	.size	__func__.29078, 23
__func__.29078:
	.ascii	"es705_ping_status_show\000"
	.space	1
	.type	__func__.29016, %object
	.size	__func__.29016, 16
__func__.29016:
	.ascii	"es705_rate_show\000"
	.type	__func__.29008, %object
	.size	__func__.29008, 17
__func__.29008:
	.ascii	"es705_route_show\000"
	.space	3
	.type	__func__.29146, %object
	.size	__func__.29146, 27
__func__.29146:
	.ascii	"es705_keyword_net_path_set\000"
	.space	1
	.type	__func__.29134, %object
	.size	__func__.29134, 31
__func__.29134:
	.ascii	"es705_keyword_grammar_path_set\000"
	.space	1
	.type	__func__.29055, %object
	.size	__func__.29055, 32
__func__.29055:
	.ascii	"es705_vs_keyword_parameters_set\000"
	.type	__func__.29047, %object
	.size	__func__.29047, 33
__func__.29047:
	.ascii	"es705_vs_keyword_parameters_show\000"
	.space	3
	.type	__func__.28790, %object
	.size	__func__.28790, 10
__func__.28790:
	.ascii	"file_open\000"
	.space	2
	.type	__func__.29192, %object
	.size	__func__.29192, 21
__func__.29192:
	.ascii	"es705_veq_filter_set\000"
	.space	3
	.type	__func__.29598, %object
	.size	__func__.29598, 20
__func__.29598:
	.ascii	"es705_put_bwe_value\000"
	.type	__func__.29632, %object
	.size	__func__.29632, 19
__func__.29632:
	.ascii	"es705_put_aud_zoom\000"
	.space	1
	.type	__func__.29644, %object
	.size	__func__.29644, 27
__func__.29644:
	.ascii	"es705_put_veq_preset_value\000"
	.space	1
	.type	__func__.28898, %object
	.size	__func__.28898, 28
__func__.28898:
	.ascii	"es705_switch_to_normal_mode\000"
	.type	__func__.28904, %object
	.size	__func__.28904, 24
__func__.28904:
	.ascii	"es705_switch_to_vs_mode\000"
	.type	__func__.29248, %object
	.size	__func__.29248, 18
__func__.29248:
	.ascii	"es705_fw_download\000"
	.space	2
	.type	__func__.29272, %object
	.size	__func__.29272, 14
__func__.29272:
	.ascii	"es705_vs_load\000"
	.space	2
.LC1:
	.word	-1877483463
	.word	-1877475327
	.word	-1
	.type	__func__.29512, %object
	.size	__func__.29512, 32
__func__.29512:
	.ascii	"es705_put_vs_make_internal_dump\000"
	.type	__func__.28827, %object
	.size	__func__.28827, 18
__func__.28827:
	.ascii	"es705_write_block\000"
	.space	2
	.type	__func__.29993, %object
	.size	__func__.29993, 35
__func__.29993:
	.ascii	"es705_get_vs_detection_sensitivity\000"
	.space	1
	.type	__func__.30010, %object
	.size	__func__.30010, 26
__func__.30010:
	.ascii	"es705_get_vad_sensitivity\000"
	.space	2
	.type	__func__.29735, %object
	.size	__func__.29735, 24
__func__.29735:
	.ascii	"es705_put_internal_rate\000"
	.type	es705_route_config, %object
	.size	es705_route_config, 580
es705_route_config:
	.word	route_off
	.space	16
	.word	route_cs_voice_1mic_ct
	.word	nb_cs_voice_1mic_ct
	.word	wb_cs_voice_1mic_ct
	.word	swb_cs_voice_1mic_ct
	.space	4
	.word	route_cs_voice_2mic_ct
	.word	nb_cs_voice_2mic_ct
	.word	wb_cs_voice_2mic_ct
	.word	swb_cs_voice_2mic_ct
	.space	4
	.word	route_cs_voice_3mic_ct
	.word	nb_cs_voice_3mic_ct
	.word	wb_cs_voice_3mic_ct
	.word	swb_cs_voice_3mic_ct
	.space	4
	.word	route_cs_voice_1mic_ft
	.word	nb_cs_voice_1mic_ft
	.word	wb_cs_voice_1mic_ft
	.word	swb_cs_voice_1mic_ft
	.space	4
	.word	route_cs_voice_2mic_ft
	.word	nb_cs_voice_2mic_ft
	.word	wb_cs_voice_2mic_ft
	.word	swb_cs_voice_2mic_ft
	.space	4
	.word	route_cs_voice_3mic_ft
	.word	nb_cs_voice_3mic_ft
	.word	wb_cs_voice_3mic_ft
	.word	swb_cs_voice_3mic_ft
	.space	4
	.word	route_cs_voice_headset
	.word	nb_cs_voice_headset
	.word	wb_cs_voice_headset
	.word	swb_cs_voice_headset
	.space	4
	.word	route_cs_voice_1mic_headphone
	.word	nb_cs_voice_1mic_headphone
	.word	wb_cs_voice_1mic_headphone
	.word	swb_cs_voice_1mic_headphone
	.space	4
	.word	route_voip_1mic_ct
	.word	nb_voip_1mic_ct
	.word	wb_voip_1mic_ct
	.word	swb_voip_1mic_ct
	.space	4
	.word	route_voip_2mic_ct
	.word	nb_voip_2mic_ct
	.word	wb_voip_2mic_ct
	.word	swb_voip_2mic_ct
	.word	fb_voip_2mic_ct
	.word	route_voip_3mic_ct
	.word	nb_voip_3mic_ct
	.word	wb_voip_3mic_ct
	.word	swb_voip_3mic_ct
	.word	fb_voip_3mic_ct
	.word	route_voip_1mic_ft
	.word	nb_voip_1mic_ft
	.word	wb_voip_1mic_ft
	.word	swb_voip_1mic_ft
	.space	4
	.word	route_voip_2mic_ft
	.word	nb_voip_2mic_ft
	.word	wb_voip_2mic_ft
	.word	swb_voip_2mic_ft
	.word	fb_voip_2mic_ft
	.word	route_voip_3mic_ft
	.word	nb_voip_3mic_ft
	.word	wb_voip_3mic_ft
	.word	swb_voip_3mic_ft
	.word	fb_voip_3mic_ft
	.word	route_voip_headset
	.word	nb_voip_headset
	.word	wb_voip_headset
	.word	swb_voip_headset
	.space	4
	.word	route_voip_1mic_headphone
	.word	nb_voip_1mic_headphone
	.word	wb_voip_1mic_headphone
	.word	swb_voip_1mic_headphone
	.space	4
	.word	route_voice_asr_1mic
	.word	nb_voice_asr_1mic
	.word	wb_voice_asr_1mic
	.word	swb_voice_asr_1mic
	.space	4
	.word	route_voice_asr_2mic
	.word	nb_voice_asr_2mic
	.word	wb_voice_asr_2mic
	.word	swb_voice_asr_2mic
	.space	4
	.word	route_voice_asr_3mic
	.word	nb_voice_asr_3mic
	.word	wb_voice_asr_3mic
	.word	swb_voice_asr_3mic
	.space	4
	.word	route_voicesense_sbusrx4
	.space	16
	.word	route_voicesense_sbusrx0
	.space	16
	.word	route_voicesense_pdm
	.space	16
	.word	route_1chan_playback
	.space	16
	.word	route_2chan_playback
	.space	16
	.word	route_1chan_capture
	.space	16
	.word	route_2chan_capture
	.space	16
	.word	route_audiozoom_2mic
	.space	16
	.word	route_audiozoom_3mic
	.space	16
	.type	__func__.29112, %object
	.size	__func__.29112, 19
__func__.29112:
	.ascii	"es705_vs_event_set\000"
	.space	1
	.type	__func__.29101, %object
	.size	__func__.29101, 23
__func__.29101:
	.ascii	"es705_overlay_mode_set\000"
	.space	1
	.type	__func__.29756, %object
	.size	__func__.29756, 23
__func__.29756:
	.ascii	"es705_put_preset_value\000"
	.space	1
	.type	__func__.29985, %object
	.size	__func__.29985, 35
__func__.29985:
	.ascii	"es705_put_vs_detection_sensitivity\000"
	.space	1
	.type	__func__.30002, %object
	.size	__func__.30002, 26
__func__.30002:
	.ascii	"es705_put_vad_sensitivity\000"
	.space	2
	.type	__func__.29575, %object
	.size	__func__.29575, 22
__func__.29575:
	.ascii	"es705_put_rx_ns_value\000"
	.space	2
	.type	__func__.29609, %object
	.size	__func__.29609, 23
__func__.29609:
	.ascii	"es705_put_avalon_value\000"
	.space	1
	.type	__func__.29553, %object
	.size	__func__.29553, 19
__func__.29553:
	.ascii	"es705_put_sw_value\000"
	.space	1
	.type	__func__.29620, %object
	.size	__func__.29620, 20
__func__.29620:
	.ascii	"es705_put_vbb_value\000"
	.type	__func__.29564, %object
	.size	__func__.29564, 20
__func__.29564:
	.ascii	"es705_put_sts_value\000"
	.type	__func__.29586, %object
	.size	__func__.29586, 20
__func__.29586:
	.ascii	"es705_put_wnf_value\000"
	.type	__func__.29542, %object
	.size	__func__.29542, 19
__func__.29542:
	.ascii	"es705_put_ns_value\000"
	.space	1
	.type	__func__.28881, %object
	.size	__func__.28881, 26
__func__.28881:
	.ascii	"es705_switch_route_config\000"
	.space	2
	.type	es705_route_configs, %object
	.size	es705_route_configs, 112
es705_route_configs:
	.word	route_1Mic_WHS_NB_SWBypass
	.word	route_3Mic_SPK_NB_FO_NSOn
	.word	route_2Mic_HS_NB_NSOn
	.word	route_3Mic_SPK_NB_FO_NSOff
	.word	route_2Mic_HS_NB_NSOff
	.word	route_1Ch_AudioPB
	.word	route_2Ch_AudioPB
	.word	route_2Mic_AudioZoomInterview
	.word	route_2Mic_AudioZoomConversation
	.word	route_dummy
	.word	route_dummy
	.word	route_TTYVCO
	.word	route_TTYHCO
	.word	route_3Mic_ASR_AO
	.word	route_dummy
	.word	route_dummy
	.word	route_dummy
	.word	route_1Mic_HS_LB_SWBypass
	.word	route_1Mic_SPK_LB_SWBypass
	.word	route_1Mic_WHS_LB_SWBypass
	.word	route_dummy
	.word	route_1Mic_WHS_WB_SWBypass
	.word	route_3Mic_SPK_WB_FO_NSOn
	.word	route_2Mic_HS_WB_NSOn
	.word	route_3Mic_SPK_WB_FO_NSOff
	.word	route_2Mic_HS_WB_NSOff
	.word	route_voicesense_pdm
	.word	route_sensory_pdm
	.type	__func__.29700, %object
	.size	__func__.29700, 23
__func__.29700:
	.ascii	"es705_put_network_type\000"
	.space	1
	.type	__func__.29490, %object
	.size	__func__.29490, 33
__func__.29490:
	.ascii	"es705_put_voice_lpm_enable_value\000"
	.space	3
	.type	__func__.29722, %object
	.size	__func__.29722, 25
__func__.29722:
	.ascii	"es705_put_internal_route\000"
	.space	3
	.type	__func__.28871, %object
	.size	__func__.28871, 19
__func__.28871:
	.ascii	"es705_switch_route\000"
	.space	1
	.type	__func__.28840, %object
	.size	__func__.28840, 25
__func__.28840:
	.ascii	"es705_read_vs_data_block\000"
	.space	3
.LC0:
	.word	-1877483487
	.word	-1877475325
	.word	-1
	.type	__func__.29529, %object
	.size	__func__.29529, 32
__func__.29529:
	.ascii	"es705_put_vs_make_external_dump\000"
	.type	__func__.28858, %object
	.size	__func__.28858, 26
__func__.28858:
	.ascii	"es705_write_vs_data_block\000"
	.space	2
.LC6:
	.word	-1877483487
	.word	-1877475327
	.word	-1
	.type	__func__.28975, %object
	.size	__func__.28975, 34
__func__.28975:
	.ascii	"es705_write_sensory_vs_data_block\000"
	.space	2
.LC2:
	.word	-1877483460
	.word	-1877475128
	.word	-1877483459
	.word	-1877474128
	.word	-1877483458
	.word	-1877473920
	.word	-1877483457
	.word	-1877475328
	.word	-1877483456
	.word	-1877475326
	.word	-1877483520
	.word	-1877475326
	.word	-1
	.type	__func__.29480, %object
	.size	__func__.29480, 36
__func__.29480:
	.ascii	"es705_put_voice_wakeup_enable_value\000"
	.type	__func__.29465, %object
	.size	__func__.29465, 26
__func__.29465:
	.ascii	"es705_get_default_keyword\000"
	.space	2
.LC3:
	.word	-1877483518
	.word	-1877475327
	.word	-1
.LC4:
	.word	-1877483517
	.word	-1877475327
	.word	-1
.LC5:
	.word	-1877483520
	.word	-1877475327
	.word	-1
	.type	__func__.28992, %object
	.size	__func__.28992, 31
__func__.28992:
	.ascii	"es705_write_sensory_vs_keyword\000"
	.space	1
	.type	__func__.29971, %object
	.size	__func__.29971, 28
__func__.29971:
	.ascii	"es705_put_vs_stored_keyword\000"
	.type	__func__.28889, %object
	.size	__func__.28889, 10
__func__.28889:
	.ascii	"es705_cmd\000"
	.space	2
	.type	__func__.29255, %object
	.size	__func__.29255, 13
__func__.29255:
	.ascii	"es705_bootup\000"
	.space	3
	.type	__func__.28818, %object
	.size	__func__.28818, 15
__func__.28818:
	.ascii	"restore_std_fw\000"
	.space	1
	.type	__func__.29291, %object
	.size	__func__.29291, 12
__func__.29291:
	.ascii	"es705_sleep\000"
	.type	__func__.30081, %object
	.size	__func__.30081, 20
__func__.30081:
	.ascii	"es705_codec_suspend\000"
	.type	__func__.29298, %object
	.size	__func__.29298, 20
__func__.29298:
	.ascii	"es705_delayed_sleep\000"
	.type	__func__.29310, %object
	.size	__func__.29310, 13
__func__.29310:
	.ascii	"es705_wakeup\000"
	.space	3
	.type	__func__.29428, %object
	.size	__func__.29428, 29
__func__.29428:
	.ascii	"es705_put_power_control_enum\000"
	.space	3
	.type	power_state_cmd, %object
	.size	power_state_cmd, 28
power_state_cmd:
	.word	.LC401
	.word	.LC183
	.word	.LC402
	.word	.LC403
	.word	.LC181
	.word	.LC182
	.word	.LC180
	.type	power_state, %object
	.size	power_state, 16
power_state:
	.word	.LC404
	.word	.LC183
	.word	.LC405
	.word	.LC406
	.type	__func__.29302, %object
	.size	__func__.29302, 20
__func__.29302:
	.ascii	"es705_sleep_request\000"
	.type	__func__.29264, %object
	.size	__func__.29264, 14
__func__.29264:
	.ascii	"es705_set_lpm\000"
	.space	2
	.type	__func__.30086, %object
	.size	__func__.30086, 19
__func__.30086:
	.ascii	"es705_codec_resume\000"
	.space	1
	.type	__func__.29415, %object
	.size	__func__.29415, 20
__func__.29415:
	.ascii	"es705_power_control\000"
	.type	__func__.29374, %object
	.size	__func__.29374, 26
__func__.29374:
	.ascii	"es705_sleep_power_control\000"
	.space	2
	.type	__func__.29388, %object
	.size	__func__.29388, 34
__func__.29388:
	.ascii	"es705_sleep_pending_power_control\000"
	.space	2
	.type	__func__.29405, %object
	.size	__func__.29405, 26
__func__.29405:
	.ascii	"es705_awake_power_control\000"
	.space	2
	.type	__func__.29281, %object
	.size	__func__.29281, 12
__func__.29281:
	.ascii	"fw_download\000"
	.type	__func__.30127, %object
	.size	__func__.30127, 17
__func__.30127:
	.ascii	"register_snd_soc\000"
	.space	3
	.type	__func__.29652, %object
	.size	__func__.29652, 26
__func__.29652:
	.ascii	"es705_remote_route_enable\000"
	.space	2
	.type	__func__.29670, %object
	.size	__func__.29670, 20
__func__.29670:
	.ascii	"es705_put_veq_block\000"
	.type	__func__.29711, %object
	.size	__func__.29711, 21
__func__.29711:
	.ascii	"es705_forced_reroute\000"
	.space	3
	.type	__func__.30094, %object
	.size	__func__.30094, 32
__func__.30094:
	.ascii	"es705_remote_add_codec_controls\000"
.LC7:
	.word	-1877483520
	.word	-1877475328
	.word	-1
	.type	__func__.30119, %object
	.size	__func__.30119, 16
__func__.30119:
	.ascii	"es705_irq_event\000"
	.type	__func__.30112, %object
	.size	__func__.30112, 19
__func__.30112:
	.ascii	"es705_event_status\000"
	.space	1
	.type	__func__.30150, %object
	.size	__func__.30150, 17
__func__.30150:
	.ascii	"es705_core_probe\000"
	.space	3
	.type	es705_vs_training_mode_enum, %object
	.size	es705_vs_training_mode_enum, 32
es705_vs_training_mode_enum:
	.short	248
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	3
	.space	4
	.word	es705_vs_training_mode_texts
	.space	12
	.type	es705_vs_training_mode_texts, %object
	.size	es705_vs_training_mode_texts, 12
es705_vs_training_mode_texts:
	.word	.LC296
	.word	.LC297
	.word	.LC298
	.type	es705_vs_training_record_enum, %object
	.size	es705_vs_training_record_enum, 32
es705_vs_training_record_enum:
	.short	251
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	2
	.space	4
	.word	es705_vs_training_record_texts
	.space	12
	.type	es705_vs_stored_keyword_enum, %object
	.size	es705_vs_stored_keyword_enum, 32
es705_vs_stored_keyword_enum:
	.short	254
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	3
	.space	4
	.word	es705_vs_stored_keyword_texts
	.space	12
	.type	es705_vs_stored_keyword_texts, %object
	.size	es705_vs_stored_keyword_texts, 12
es705_vs_stored_keyword_texts:
	.word	.LC299
	.word	.LC300
	.word	.LC301
	.type	es705_vs_training_record_texts, %object
	.size	es705_vs_training_record_texts, 8
es705_vs_training_record_texts:
	.word	.LC302
	.word	.LC303
	.type	es705_vs_training_status_enum, %object
	.size	es705_vs_training_status_enum, 32
es705_vs_training_status_enum:
	.short	252
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	2
	.space	4
	.word	es705_vs_training_status_texts
	.space	12
	.type	es705_vs_training_status_texts, %object
	.size	es705_vs_training_status_texts, 8
es705_vs_training_status_texts:
	.word	.LC304
	.word	.LC305
	.type	es705_vs_event_enum, %object
	.size	es705_vs_event_enum, 32
es705_vs_event_enum:
	.short	247
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	3
	.space	4
	.word	es705_vs_event_texts
	.space	12
	.type	es705_vs_event_texts, %object
	.size	es705_vs_event_texts, 12
es705_vs_event_texts:
	.word	.LC306
	.word	.LC307
	.word	.LC308
	.type	es705_vs_wakeup_keyword_enum, %object
	.size	es705_vs_wakeup_keyword_enum, 32
es705_vs_wakeup_keyword_enum:
	.short	246
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	5
	.space	4
	.word	es705_vs_wakeup_keyword_texts
	.space	12
	.type	es705_vs_wakeup_keyword_texts, %object
	.size	es705_vs_wakeup_keyword_texts, 20
es705_vs_wakeup_keyword_texts:
	.word	.LC309
	.word	.LC310
	.word	.LC311
	.word	.LC312
	.word	.LC313
	.type	es705_power_state_enum, %object
	.size	es705_power_state_enum, 32
es705_power_state_enum:
	.short	-1
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	2
	.space	4
	.word	es705_power_state_texts
	.space	12
	.type	es705_power_state_texts, %object
	.size	es705_power_state_texts, 8
es705_power_state_texts:
	.word	.LC314
	.word	.LC315
	.type	es705_vbb_enable_enum, %object
	.size	es705_vbb_enable_enum, 32
es705_vbb_enable_enum:
	.short	177
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	2
	.space	4
	.word	es705_off_on_texts
	.space	12
	.type	es705_avalon_wn_enable_enum, %object
	.size	es705_avalon_wn_enable_enum, 32
es705_avalon_wn_enable_enum:
	.short	177
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	2
	.space	4
	.word	es705_off_on_texts
	.space	12
	.type	es705_bwe_preset_enable_enum, %object
	.size	es705_bwe_preset_enable_enum, 32
es705_bwe_preset_enable_enum:
	.short	177
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	2
	.space	4
	.word	es705_off_on_texts
	.space	12
	.type	es705_wnf_enable_enum, %object
	.size	es705_wnf_enable_enum, 32
es705_wnf_enable_enum:
	.short	177
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	2
	.space	4
	.word	es705_off_on_texts
	.space	12
	.type	es705_rx_ns_enable_enum, %object
	.size	es705_rx_ns_enable_enum, 32
es705_rx_ns_enable_enum:
	.short	177
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	2
	.space	4
	.word	es705_off_on_texts
	.space	12
	.type	es705_sts_enable_enum, %object
	.size	es705_sts_enable_enum, 32
es705_sts_enable_enum:
	.short	177
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	2
	.space	4
	.word	es705_off_on_texts
	.space	12
	.type	es705_sw_enable_enum, %object
	.size	es705_sw_enable_enum, 32
es705_sw_enable_enum:
	.short	177
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	2
	.space	4
	.word	es705_off_on_texts
	.space	12
	.type	es705_rx_enable_enum, %object
	.size	es705_rx_enable_enum, 32
es705_rx_enable_enum:
	.short	257
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	2
	.space	4
	.word	es705_off_on_texts
	.space	12
	.type	es705_audio_zoom_enum, %object
	.size	es705_audio_zoom_enum, 32
es705_audio_zoom_enum:
	.short	177
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	4
	.space	4
	.word	es705_audio_zoom_texts
	.space	12
	.type	es705_ns_enable_enum, %object
	.size	es705_ns_enable_enum, 32
es705_ns_enable_enum:
	.short	177
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	2
	.space	4
	.word	es705_off_on_texts
	.space	12
	.type	es705_algo_processing_enable_enum, %object
	.size	es705_algo_processing_enable_enum, 32
es705_algo_processing_enable_enum:
	.short	179
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	2
	.space	4
	.word	es705_off_on_texts
	.space	12
	.type	es705_bwe_post_eq_enable_enum, %object
	.size	es705_bwe_post_eq_enable_enum, 32
es705_bwe_post_eq_enable_enum:
	.short	124
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	2
	.space	4
	.word	es705_off_on_texts
	.space	12
	.type	es705_bwe_enable_enum, %object
	.size	es705_bwe_enable_enum, 32
es705_bwe_enable_enum:
	.short	121
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	2
	.space	4
	.word	es705_off_on_texts
	.space	12
	.type	es705_dereverb_enable_enum, %object
	.size	es705_dereverb_enable_enum, 32
es705_dereverb_enable_enum:
	.short	119
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	2
	.space	4
	.word	es705_off_on_texts
	.space	12
	.type	es705_veq_enable_enum, %object
	.size	es705_veq_enable_enum, 32
es705_veq_enable_enum:
	.short	6
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	2
	.space	4
	.word	es705_off_on_texts
	.space	12
	.type	es705_audio_zoom_texts, %object
	.size	es705_audio_zoom_texts, 16
es705_audio_zoom_texts:
	.word	.LC316
	.word	.LC317
	.word	.LC318
	.word	.LC319
	.type	es705_off_on_texts, %object
	.size	es705_off_on_texts, 8
es705_off_on_texts:
	.word	.LC320
	.word	.LC321
	.type	es705_algorithms_enum, %object
	.size	es705_algorithms_enum, 32
es705_algorithms_enum:
	.short	180
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	5
	.space	4
	.word	es705_algorithms_text
	.space	12
	.type	es705_algorithms_text, %object
	.size	es705_algorithms_text, 20
es705_algorithms_text:
	.word	.LC322
	.word	.LC323
	.word	.LC324
	.word	.LC325
	.word	.LC326
	.type	es705_internal_rate_enum, %object
	.size	es705_internal_rate_enum, 32
es705_internal_rate_enum:
	.short	-1
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	4
	.space	4
	.word	es705_internal_rate_text
	.space	12
	.type	es705_internal_rate_text, %object
	.size	es705_internal_rate_text, 16
es705_internal_rate_text:
	.word	.LC327
	.word	.LC328
	.word	.LC329
	.word	.LC330
	.type	es705_algo_mix_rate_enum, %object
	.size	es705_algo_mix_rate_enum, 32
es705_algo_mix_rate_enum:
	.short	186
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	6
	.space	4
	.word	es705_algo_rates_text
	.space	12
	.type	es705_algo_sample_rate_enum, %object
	.size	es705_algo_sample_rate_enum, 32
es705_algo_sample_rate_enum:
	.short	180
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	6
	.space	4
	.word	es705_algo_rates_text
	.space	12
	.type	es705_algo_rates_text, %object
	.size	es705_algo_rates_text, 24
es705_algo_rates_text:
	.word	.LC331
	.word	.LC332
	.word	.LC333
	.word	.LC334
	.word	.LC335
	.word	.LC336
	.type	es705_aec_mode_enum, %object
	.size	es705_aec_mode_enum, 32
es705_aec_mode_enum:
	.short	1
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	6
	.space	4
	.word	es705_aec_mode_texts
	.space	12
	.type	es705_aec_mode_texts, %object
	.size	es705_aec_mode_texts, 24
es705_aec_mode_texts:
	.word	.LC320
	.word	.LC321
	.word	.LC337
	.word	.LC338
	.word	.LC339
	.word	.LC340
	.type	es705_mic_config_enum, %object
	.size	es705_mic_config_enum, 32
es705_mic_config_enum:
	.short	0
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	9
	.space	4
	.word	es705_mic_config_texts
	.space	12
	.type	es705_mic_config_texts, %object
	.size	es705_mic_config_texts, 36
es705_mic_config_texts:
	.word	.LC341
	.word	.LC342
	.word	.LC343
	.word	.LC344
	.word	.LC345
	.word	.LC346
	.word	.LC347
	.word	.LC348
	.word	.LC349
	.type	es705_vs_power_state_enum, %object
	.size	es705_vs_power_state_enum, 32
es705_vs_power_state_enum:
	.short	174
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	7
	.space	4
	.word	es705_vs_power_state_texts
	.space	12
	.type	es705_vs_power_state_texts, %object
	.size	es705_vs_power_state_texts, 28
es705_vs_power_state_texts:
	.word	.LC322
	.word	.LC314
	.word	.LC350
	.word	.LC351
	.word	.LC352
	.word	.LC353
	.word	.LC354
	.type	es705_ap_tx1_ch_cnt_enum, %object
	.size	es705_ap_tx1_ch_cnt_enum, 32
es705_ap_tx1_ch_cnt_enum:
	.short	-1
	.space	2
	.byte	0
	.byte	0
	.space	2
	.word	3
	.space	4
	.word	es705_ap_tx1_ch_cnt_texts
	.space	12
	.type	es705_ap_tx1_ch_cnt_texts, %object
	.size	es705_ap_tx1_ch_cnt_texts, 12
es705_ap_tx1_ch_cnt_texts:
	.word	.LC310
	.word	.LC311
	.word	.LC312
	.type	route_3Mic_SPK_WB_FO_NSOff, %object
	.size	route_3Mic_SPK_WB_FO_NSOff, 16
route_3Mic_SPK_WB_FO_NSOff:
	.word	-1875835827
	.word	-1875836002
	.word	-1875835929
	.word	-1
	.type	route_3Mic_SPK_WB_FO_NSOn, %object
	.size	route_3Mic_SPK_WB_FO_NSOn, 12
route_3Mic_SPK_WB_FO_NSOn:
	.word	-1875835827
	.word	-1875836002
	.word	-1
	.type	route_3Mic_ASR_AO, %object
	.size	route_3Mic_ASR_AO, 12
route_3Mic_ASR_AO:
	.word	-1875835677
	.word	-1875835974
	.word	-1
	.type	route_3Mic_SPK_NB_FO_NSOff, %object
	.size	route_3Mic_SPK_NB_FO_NSOff, 16
route_3Mic_SPK_NB_FO_NSOff:
	.word	-1875835827
	.word	-1875836003
	.word	-1875835930
	.word	-1
	.type	route_3Mic_SPK_NB_FO_NSOn, %object
	.size	route_3Mic_SPK_NB_FO_NSOn, 12
route_3Mic_SPK_NB_FO_NSOn:
	.word	-1875835827
	.word	-1875836003
	.word	-1
	.type	route_2Mic_HS_WB_NSOff, %object
	.size	route_2Mic_HS_WB_NSOff, 16
route_2Mic_HS_WB_NSOff:
	.word	-1875835877
	.word	-1875836373
	.word	-1875835970
	.word	-1
	.type	route_2Mic_HS_WB_NSOn, %object
	.size	route_2Mic_HS_WB_NSOn, 12
route_2Mic_HS_WB_NSOn:
	.word	-1875835877
	.word	-1875836373
	.word	-1
	.type	route_1Mic_WHS_WB_SWBypass, %object
	.size	route_1Mic_WHS_WB_SWBypass, 16
route_1Mic_WHS_WB_SWBypass:
	.word	-1875835923
	.word	-1875836337
	.word	-1875836307
	.word	-1
	.type	route_1Mic_WHS_LB_SWBypass, %object
	.size	route_1Mic_WHS_LB_SWBypass, 12
route_1Mic_WHS_LB_SWBypass:
	.word	-1875835923
	.word	-1875836307
	.word	-1
	.type	route_1Mic_SPK_LB_SWBypass, %object
	.size	route_1Mic_SPK_LB_SWBypass, 12
route_1Mic_SPK_LB_SWBypass:
	.word	-1875835927
	.word	-1875836307
	.word	-1
	.type	route_1Mic_HS_LB_SWBypass, %object
	.size	route_1Mic_HS_LB_SWBypass, 12
route_1Mic_HS_LB_SWBypass:
	.word	-1875835927
	.word	-1875836307
	.word	-1
	.type	route_TTYHCO, %object
	.size	route_TTYHCO, 16
route_TTYHCO:
	.word	-1875835927
	.word	-1875836338
	.word	-1875836307
	.word	-1
	.type	route_TTYVCO, %object
	.size	route_TTYVCO, 16
route_TTYVCO:
	.word	-1875835923
	.word	-1875836338
	.word	-1875836307
	.word	-1
	.type	route_dummy, %object
	.size	route_dummy, 4
route_dummy:
	.word	-1
	.type	route_2Mic_AudioZoomConversation, %object
	.size	route_2Mic_AudioZoomConversation, 12
route_2Mic_AudioZoomConversation:
	.word	-1875835573
	.word	-1875836175
	.word	-1
	.type	route_2Mic_AudioZoomInterview, %object
	.size	route_2Mic_AudioZoomInterview, 12
route_2Mic_AudioZoomInterview:
	.word	-1875835573
	.word	-1875836176
	.word	-1
	.type	route_2Ch_AudioPB, %object
	.size	route_2Ch_AudioPB, 12
route_2Ch_AudioPB:
	.word	-1875835772
	.word	-1875836072
	.word	-1
	.type	route_1Ch_AudioPB, %object
	.size	route_1Ch_AudioPB, 12
route_1Ch_AudioPB:
	.word	-1875835777
	.word	-1875836077
	.word	-1
	.type	route_2Mic_HS_NB_NSOff, %object
	.size	route_2Mic_HS_NB_NSOff, 16
route_2Mic_HS_NB_NSOff:
	.word	-1875835877
	.word	-1875836374
	.word	-1875835971
	.word	-1
	.type	route_2Mic_HS_NB_NSOn, %object
	.size	route_2Mic_HS_NB_NSOn, 12
route_2Mic_HS_NB_NSOn:
	.word	-1875835877
	.word	-1875836374
	.word	-1
	.type	route_1Mic_WHS_NB_SWBypass, %object
	.size	route_1Mic_WHS_NB_SWBypass, 12
route_1Mic_WHS_NB_SWBypass:
	.word	-1875835923
	.word	-1875836338
	.word	-1
	.type	route_audiozoom_3mic, %object
	.size	route_audiozoom_3mic, 8
route_audiozoom_3mic:
	.word	-1875835571
	.word	-1
	.type	route_audiozoom_2mic, %object
	.size	route_audiozoom_2mic, 8
route_audiozoom_2mic:
	.word	-1875835573
	.word	-1
	.type	route_2chan_capture, %object
	.size	route_2chan_capture, 8
route_2chan_capture:
	.word	-1875835772
	.word	-1
	.type	route_1chan_capture, %object
	.size	route_1chan_capture, 8
route_1chan_capture:
	.word	-1875835776
	.word	-1
	.type	route_2chan_playback, %object
	.size	route_2chan_playback, 8
route_2chan_playback:
	.word	-1875835773
	.word	-1
	.type	route_1chan_playback, %object
	.size	route_1chan_playback, 8
route_1chan_playback:
	.word	-1875835777
	.word	-1
	.type	route_voicesense_sbusrx0, %object
	.size	route_voicesense_sbusrx0, 44
route_voicesense_sbusrx0:
	.word	-1336276480
	.word	-1336213504
	.word	-1335623624
	.word	-1335623280
	.word	-1335689213
	.word	-1335689191
	.word	-1335360768
	.word	-1335355136
	.word	-1341388544
	.word	-1878196224
	.word	-1
	.type	route_sensory_pdm, %object
	.size	route_sensory_pdm, 44
route_sensory_pdm:
	.word	-1336275968
	.word	-1336213504
	.word	-1335623624
	.word	-1335623280
	.word	-1335688957
	.word	-1335688935
	.word	-1335360768
	.word	-1335355136
	.word	-1877483477
	.word	-1877471232
	.word	-1
	.type	route_voicesense_pdm, %object
	.size	route_voicesense_pdm, 8
route_voicesense_pdm:
	.word	-1875835546
	.word	-1
	.type	route_voicesense_sbusrx4, %object
	.size	route_voicesense_sbusrx4, 44
route_voicesense_sbusrx4:
	.word	-1336276416
	.word	-1336213504
	.word	-1335623624
	.word	-1335623280
	.word	-1335689213
	.word	-1335689191
	.word	-1335360768
	.word	-1335355136
	.word	-1341388544
	.word	-1878196224
	.word	-1
	.type	swb_voice_asr_3mic, %object
	.size	swb_voice_asr_3mic, 4
swb_voice_asr_3mic:
	.word	-1
	.type	wb_voice_asr_3mic, %object
	.size	wb_voice_asr_3mic, 4
wb_voice_asr_3mic:
	.word	-1
	.type	nb_voice_asr_3mic, %object
	.size	nb_voice_asr_3mic, 4
nb_voice_asr_3mic:
	.word	-1
	.type	route_voice_asr_3mic, %object
	.size	route_voice_asr_3mic, 4
route_voice_asr_3mic:
	.word	-1
	.type	swb_voice_asr_2mic, %object
	.size	swb_voice_asr_2mic, 4
swb_voice_asr_2mic:
	.word	-1
	.type	wb_voice_asr_2mic, %object
	.size	wb_voice_asr_2mic, 4
wb_voice_asr_2mic:
	.word	-1
	.type	nb_voice_asr_2mic, %object
	.size	nb_voice_asr_2mic, 4
nb_voice_asr_2mic:
	.word	-1
	.type	route_voice_asr_2mic, %object
	.size	route_voice_asr_2mic, 8
route_voice_asr_2mic:
	.word	-1875835702
	.word	-1
	.type	swb_voice_asr_1mic, %object
	.size	swb_voice_asr_1mic, 4
swb_voice_asr_1mic:
	.word	-1
	.type	wb_voice_asr_1mic, %object
	.size	wb_voice_asr_1mic, 4
wb_voice_asr_1mic:
	.word	-1
	.type	nb_voice_asr_1mic, %object
	.size	nb_voice_asr_1mic, 4
nb_voice_asr_1mic:
	.word	-1
	.type	route_voice_asr_1mic, %object
	.size	route_voice_asr_1mic, 8
route_voice_asr_1mic:
	.word	-1875835727
	.word	-1
	.type	swb_voip_1mic_headphone, %object
	.size	swb_voip_1mic_headphone, 4
swb_voip_1mic_headphone:
	.word	-1
	.type	wb_voip_1mic_headphone, %object
	.size	wb_voip_1mic_headphone, 4
wb_voip_1mic_headphone:
	.word	-1
	.type	nb_voip_1mic_headphone, %object
	.size	nb_voip_1mic_headphone, 4
nb_voip_1mic_headphone:
	.word	-1
	.type	route_voip_1mic_headphone, %object
	.size	route_voip_1mic_headphone, 8
route_voip_1mic_headphone:
	.word	-1875835923
	.word	-1
	.type	swb_voip_headset, %object
	.size	swb_voip_headset, 4
swb_voip_headset:
	.word	-1
	.type	wb_voip_headset, %object
	.size	wb_voip_headset, 8
wb_voip_headset:
	.word	-1875836337
	.word	-1
	.type	nb_voip_headset, %object
	.size	nb_voip_headset, 8
nb_voip_headset:
	.word	-1875836338
	.word	-1
	.type	route_voip_headset, %object
	.size	route_voip_headset, 8
route_voip_headset:
	.word	-1875835923
	.word	-1
	.type	fb_voip_3mic_ft, %object
	.size	fb_voip_3mic_ft, 8
fb_voip_3mic_ft:
	.word	-1875836294
	.word	-1
	.type	swb_voip_3mic_ft, %object
	.size	swb_voip_3mic_ft, 8
swb_voip_3mic_ft:
	.word	-1875836348
	.word	-1
	.type	wb_voip_3mic_ft, %object
	.size	wb_voip_3mic_ft, 8
wb_voip_3mic_ft:
	.word	-1875836349
	.word	-1
	.type	nb_voip_3mic_ft, %object
	.size	nb_voip_3mic_ft, 8
nb_voip_3mic_ft:
	.word	-1875836350
	.word	-1
	.type	route_voip_3mic_ft, %object
	.size	route_voip_3mic_ft, 8
route_voip_3mic_ft:
	.word	-1875835499
	.word	-1
	.type	fb_voip_2mic_ft, %object
	.size	fb_voip_2mic_ft, 8
fb_voip_2mic_ft:
	.word	-1875836297
	.word	-1
	.type	swb_voip_2mic_ft, %object
	.size	swb_voip_2mic_ft, 8
swb_voip_2mic_ft:
	.word	-1875836357
	.word	-1
	.type	wb_voip_2mic_ft, %object
	.size	wb_voip_2mic_ft, 8
wb_voip_2mic_ft:
	.word	-1875836358
	.word	-1
	.type	nb_voip_2mic_ft, %object
	.size	nb_voip_2mic_ft, 8
nb_voip_2mic_ft:
	.word	-1875836359
	.word	-1
	.type	route_voip_2mic_ft, %object
	.size	route_voip_2mic_ft, 8
route_voip_2mic_ft:
	.word	-1875835529
	.word	-1
	.type	swb_voip_1mic_ft, %object
	.size	swb_voip_1mic_ft, 8
swb_voip_1mic_ft:
	.word	-1875836336
	.word	-1
	.type	wb_voip_1mic_ft, %object
	.size	wb_voip_1mic_ft, 8
wb_voip_1mic_ft:
	.word	-1875836337
	.word	-1
	.type	nb_voip_1mic_ft, %object
	.size	nb_voip_1mic_ft, 8
nb_voip_1mic_ft:
	.word	-1875836338
	.word	-1
	.type	route_voip_1mic_ft, %object
	.size	route_voip_1mic_ft, 8
route_voip_1mic_ft:
	.word	-1875835927
	.word	-1
	.type	fb_voip_3mic_ct, %object
	.size	fb_voip_3mic_ct, 8
fb_voip_3mic_ct:
	.word	-1875836301
	.word	-1
	.type	swb_voip_3mic_ct, %object
	.size	swb_voip_3mic_ct, 8
swb_voip_3mic_ct:
	.word	-1875836369
	.word	-1
	.type	wb_voip_3mic_ct, %object
	.size	wb_voip_3mic_ct, 8
wb_voip_3mic_ct:
	.word	-1875836370
	.word	-1
	.type	nb_voip_3mic_ct, %object
	.size	nb_voip_3mic_ct, 8
nb_voip_3mic_ct:
	.word	-1875836371
	.word	-1
	.type	route_voip_3mic_ct, %object
	.size	route_voip_3mic_ct, 8
route_voip_3mic_ct:
	.word	-1875835523
	.word	-1
	.type	fb_voip_2mic_ct, %object
	.size	fb_voip_2mic_ct, 8
fb_voip_2mic_ct:
	.word	-1875836302
	.word	-1
	.type	swb_voip_2mic_ct, %object
	.size	swb_voip_2mic_ct, 8
swb_voip_2mic_ct:
	.word	-1875836372
	.word	-1
	.type	wb_voip_2mic_ct, %object
	.size	wb_voip_2mic_ct, 8
wb_voip_2mic_ct:
	.word	-1875836373
	.word	-1
	.type	nb_voip_2mic_ct, %object
	.size	nb_voip_2mic_ct, 8
nb_voip_2mic_ct:
	.word	-1875836374
	.word	-1
	.type	route_voip_2mic_ct, %object
	.size	route_voip_2mic_ct, 8
route_voip_2mic_ct:
	.word	-1875835529
	.word	-1
	.type	swb_voip_1mic_ct, %object
	.size	swb_voip_1mic_ct, 8
swb_voip_1mic_ct:
	.word	-1875836336
	.word	-1
	.type	wb_voip_1mic_ct, %object
	.size	wb_voip_1mic_ct, 8
wb_voip_1mic_ct:
	.word	-1875836337
	.word	-1
	.type	nb_voip_1mic_ct, %object
	.size	nb_voip_1mic_ct, 8
nb_voip_1mic_ct:
	.word	-1875836338
	.word	-1
	.type	route_voip_1mic_ct, %object
	.size	route_voip_1mic_ct, 8
route_voip_1mic_ct:
	.word	-1875835927
	.word	-1
	.type	swb_cs_voice_1mic_headphone, %object
	.size	swb_cs_voice_1mic_headphone, 4
swb_cs_voice_1mic_headphone:
	.word	-1
	.type	wb_cs_voice_1mic_headphone, %object
	.size	wb_cs_voice_1mic_headphone, 4
wb_cs_voice_1mic_headphone:
	.word	-1
	.type	nb_cs_voice_1mic_headphone, %object
	.size	nb_cs_voice_1mic_headphone, 4
nb_cs_voice_1mic_headphone:
	.word	-1
	.type	route_cs_voice_1mic_headphone, %object
	.size	route_cs_voice_1mic_headphone, 8
route_cs_voice_1mic_headphone:
	.word	-1875835923
	.word	-1
	.type	swb_cs_voice_headset, %object
	.size	swb_cs_voice_headset, 4
swb_cs_voice_headset:
	.word	-1
	.type	wb_cs_voice_headset, %object
	.size	wb_cs_voice_headset, 8
wb_cs_voice_headset:
	.word	-1875836337
	.word	-1
	.type	nb_cs_voice_headset, %object
	.size	nb_cs_voice_headset, 8
nb_cs_voice_headset:
	.word	-1875836338
	.word	-1
	.type	route_cs_voice_headset, %object
	.size	route_cs_voice_headset, 8
route_cs_voice_headset:
	.word	-1875835923
	.word	-1
	.type	swb_cs_voice_3mic_ft, %object
	.size	swb_cs_voice_3mic_ft, 4
swb_cs_voice_3mic_ft:
	.word	-1
	.type	wb_cs_voice_3mic_ft, %object
	.size	wb_cs_voice_3mic_ft, 8
wb_cs_voice_3mic_ft:
	.word	-1875836349
	.word	-1
	.type	nb_cs_voice_3mic_ft, %object
	.size	nb_cs_voice_3mic_ft, 8
nb_cs_voice_3mic_ft:
	.word	-1875836350
	.word	-1
	.type	route_cs_voice_3mic_ft, %object
	.size	route_cs_voice_3mic_ft, 8
route_cs_voice_3mic_ft:
	.word	-1875835827
	.word	-1
	.type	swb_cs_voice_2mic_ft, %object
	.size	swb_cs_voice_2mic_ft, 8
swb_cs_voice_2mic_ft:
	.word	-1875836357
	.word	-1
	.type	wb_cs_voice_2mic_ft, %object
	.size	wb_cs_voice_2mic_ft, 8
wb_cs_voice_2mic_ft:
	.word	-1875836358
	.word	-1
	.type	nb_cs_voice_2mic_ft, %object
	.size	nb_cs_voice_2mic_ft, 8
nb_cs_voice_2mic_ft:
	.word	-1875836356
	.word	-1
	.type	route_cs_voice_2mic_ft, %object
	.size	route_cs_voice_2mic_ft, 8
route_cs_voice_2mic_ft:
	.word	-1875835877
	.word	-1
	.type	swb_cs_voice_1mic_ft, %object
	.size	swb_cs_voice_1mic_ft, 8
swb_cs_voice_1mic_ft:
	.word	-1875836336
	.word	-1
	.type	wb_cs_voice_1mic_ft, %object
	.size	wb_cs_voice_1mic_ft, 8
wb_cs_voice_1mic_ft:
	.word	-1875836337
	.word	-1
	.type	nb_cs_voice_1mic_ft, %object
	.size	nb_cs_voice_1mic_ft, 8
nb_cs_voice_1mic_ft:
	.word	-1875836368
	.word	-1
	.type	route_cs_voice_1mic_ft, %object
	.size	route_cs_voice_1mic_ft, 8
route_cs_voice_1mic_ft:
	.word	-1875835927
	.word	-1
	.type	swb_cs_voice_3mic_ct, %object
	.size	swb_cs_voice_3mic_ct, 4
swb_cs_voice_3mic_ct:
	.word	-1
	.type	wb_cs_voice_3mic_ct, %object
	.size	wb_cs_voice_3mic_ct, 8
wb_cs_voice_3mic_ct:
	.word	-1875836370
	.word	-1
	.type	nb_cs_voice_3mic_ct, %object
	.size	nb_cs_voice_3mic_ct, 8
nb_cs_voice_3mic_ct:
	.word	-1875836371
	.word	-1
	.type	route_cs_voice_3mic_ct, %object
	.size	route_cs_voice_3mic_ct, 8
route_cs_voice_3mic_ct:
	.word	-1875835827
	.word	-1
	.type	swb_cs_voice_2mic_ct, %object
	.size	swb_cs_voice_2mic_ct, 8
swb_cs_voice_2mic_ct:
	.word	-1875836372
	.word	-1
	.type	wb_cs_voice_2mic_ct, %object
	.size	wb_cs_voice_2mic_ct, 8
wb_cs_voice_2mic_ct:
	.word	-1875836373
	.word	-1
	.type	nb_cs_voice_2mic_ct, %object
	.size	nb_cs_voice_2mic_ct, 8
nb_cs_voice_2mic_ct:
	.word	-1875836374
	.word	-1
	.type	route_cs_voice_2mic_ct, %object
	.size	route_cs_voice_2mic_ct, 8
route_cs_voice_2mic_ct:
	.word	-1875835877
	.word	-1
	.type	swb_cs_voice_1mic_ct, %object
	.size	swb_cs_voice_1mic_ct, 8
swb_cs_voice_1mic_ct:
	.word	-1875836336
	.word	-1
	.type	wb_cs_voice_1mic_ct, %object
	.size	wb_cs_voice_1mic_ct, 8
wb_cs_voice_1mic_ct:
	.word	-1875836337
	.word	-1
	.type	nb_cs_voice_1mic_ct, %object
	.size	nb_cs_voice_1mic_ct, 8
nb_cs_voice_1mic_ct:
	.word	-1875836377
	.word	-1
	.type	route_cs_voice_1mic_ct, %object
	.size	route_cs_voice_1mic_ct, 8
route_cs_voice_1mic_ct:
	.word	-1875835927
	.word	-1
	.type	route_off, %object
	.size	route_off, 4
route_off:
	.word	-1
	.data
	.align	3
	.set	.LANCHOR0,. + 0
	.set	.LANCHOR3,. + 8184
	.type	es705_priv, %object
	.size	es705_priv, 1420
es705_priv:
	.space	32
	.space	16
	.word	-1
	.space	532
	.word	3
	.word	1
	.space	16
	.word	0
	.word	0
	.space	532
	.word	5
	.space	4
	.word	0
	.word	0
	.word	0
	.word	2
	.word	4
	.space	196
	.word	0
	.space	8
	.word	0
	.word	0
	.word	0
	.word	0
	.space	20
	.type	veq_noise_estimate_adjs_wb, %object
	.size	veq_noise_estimate_adjs_wb, 24
veq_noise_estimate_adjs_wb:
	.word	-1877475298
	.word	-1877475308
	.word	-1877475308
	.word	-1877475308
	.word	-1877475308
	.word	-1877475308
	.type	veq_noise_estimate_adjs_nb, %object
	.size	veq_noise_estimate_adjs_nb, 24
veq_noise_estimate_adjs_nb:
	.word	-1877475298
	.word	-1877475308
	.word	-1877475308
	.word	-1877475308
	.word	-1877475308
	.word	-1877475308
	.type	veq_max_gains_wb, %object
	.size	veq_max_gains_wb, 24
veq_max_gains_wb:
	.word	-1877475324
	.word	-1877475325
	.word	-1877475325
	.word	-1877475325
	.word	-1877475325
	.word	-1877475325
	.type	veq_max_gains_nb, %object
	.size	veq_max_gains_nb, 24
veq_max_gains_nb:
	.word	-1877475324
	.word	-1877475325
	.word	-1877475325
	.word	-1877475325
	.word	-1877475325
	.word	-1877475325
	.type	preset_delay_time, %object
	.size	preset_delay_time, 4
preset_delay_time:
	.word	5
	.type	veq_coefficients_wb, %object
	.size	veq_coefficients_wb, 444
veq_coefficients_wb:
	.byte	17
	.byte	4
	.byte	1
	.byte	0
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	68
	.byte	39
	.byte	28
	.byte	30
	.byte	53
	.byte	48
	.byte	29
	.byte	34
	.byte	48
	.byte	37
	.byte	38
	.byte	50
	.byte	36
	.byte	31
	.byte	45
	.byte	36
	.byte	37
	.byte	45
	.byte	35
	.byte	32
	.byte	41
	.byte	31
	.byte	39
	.byte	30
	.byte	22
	.byte	10
	.byte	11
	.byte	7
	.byte	-4
	.byte	2
	.byte	-6
	.byte	-2
	.byte	-3
	.byte	-9
	.byte	-7
	.byte	-12
	.byte	-17
	.byte	-19
	.byte	-24
	.byte	-30
	.byte	-37
	.byte	-43
	.byte	-49
	.byte	-52
	.byte	-54
	.byte	-56
	.byte	-57
	.byte	-56
	.byte	-57
	.byte	-58
	.byte	-56
	.byte	-54
	.byte	-54
	.byte	-54
	.byte	-54
	.byte	-54
	.byte	-53
	.byte	-57
	.byte	-59
	.byte	-57
	.byte	-61
	.byte	-65
	.byte	-50
	.byte	0
	.byte	-75
	.byte	-78
	.byte	17
	.byte	4
	.byte	1
	.byte	0
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	68
	.byte	39
	.byte	28
	.byte	30
	.byte	53
	.byte	48
	.byte	29
	.byte	34
	.byte	48
	.byte	37
	.byte	38
	.byte	50
	.byte	36
	.byte	31
	.byte	45
	.byte	36
	.byte	37
	.byte	45
	.byte	35
	.byte	32
	.byte	41
	.byte	31
	.byte	39
	.byte	30
	.byte	22
	.byte	10
	.byte	11
	.byte	7
	.byte	-4
	.byte	2
	.byte	-6
	.byte	-2
	.byte	-3
	.byte	-9
	.byte	-7
	.byte	-12
	.byte	-17
	.byte	-19
	.byte	-24
	.byte	-30
	.byte	-37
	.byte	-43
	.byte	-49
	.byte	-52
	.byte	-54
	.byte	-56
	.byte	-57
	.byte	-56
	.byte	-57
	.byte	-58
	.byte	-56
	.byte	-54
	.byte	-54
	.byte	-54
	.byte	-54
	.byte	-54
	.byte	-53
	.byte	-57
	.byte	-59
	.byte	-57
	.byte	-61
	.byte	-65
	.byte	-50
	.byte	0
	.byte	-75
	.byte	-78
	.byte	17
	.byte	4
	.byte	1
	.byte	0
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	68
	.byte	39
	.byte	28
	.byte	30
	.byte	53
	.byte	48
	.byte	29
	.byte	34
	.byte	48
	.byte	37
	.byte	38
	.byte	50
	.byte	36
	.byte	31
	.byte	45
	.byte	36
	.byte	37
	.byte	45
	.byte	35
	.byte	32
	.byte	41
	.byte	31
	.byte	39
	.byte	30
	.byte	22
	.byte	10
	.byte	11
	.byte	7
	.byte	-4
	.byte	2
	.byte	-6
	.byte	-2
	.byte	-3
	.byte	-9
	.byte	-7
	.byte	-12
	.byte	-17
	.byte	-19
	.byte	-24
	.byte	-30
	.byte	-37
	.byte	-43
	.byte	-49
	.byte	-52
	.byte	-54
	.byte	-56
	.byte	-57
	.byte	-56
	.byte	-57
	.byte	-58
	.byte	-56
	.byte	-54
	.byte	-54
	.byte	-54
	.byte	-54
	.byte	-54
	.byte	-53
	.byte	-57
	.byte	-59
	.byte	-57
	.byte	-61
	.byte	-65
	.byte	-50
	.byte	0
	.byte	-75
	.byte	-78
	.byte	17
	.byte	4
	.byte	1
	.byte	0
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	68
	.byte	39
	.byte	28
	.byte	30
	.byte	53
	.byte	48
	.byte	29
	.byte	34
	.byte	48
	.byte	37
	.byte	38
	.byte	50
	.byte	36
	.byte	31
	.byte	45
	.byte	36
	.byte	37
	.byte	45
	.byte	35
	.byte	32
	.byte	41
	.byte	31
	.byte	39
	.byte	30
	.byte	22
	.byte	10
	.byte	11
	.byte	7
	.byte	-4
	.byte	2
	.byte	-6
	.byte	-2
	.byte	-3
	.byte	-9
	.byte	-7
	.byte	-12
	.byte	-17
	.byte	-19
	.byte	-24
	.byte	-30
	.byte	-37
	.byte	-43
	.byte	-49
	.byte	-52
	.byte	-54
	.byte	-56
	.byte	-57
	.byte	-56
	.byte	-57
	.byte	-58
	.byte	-56
	.byte	-54
	.byte	-54
	.byte	-54
	.byte	-54
	.byte	-54
	.byte	-53
	.byte	-57
	.byte	-59
	.byte	-57
	.byte	-61
	.byte	-65
	.byte	-50
	.byte	0
	.byte	-75
	.byte	-78
	.byte	17
	.byte	4
	.byte	1
	.byte	0
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	68
	.byte	39
	.byte	28
	.byte	30
	.byte	53
	.byte	48
	.byte	29
	.byte	34
	.byte	48
	.byte	37
	.byte	38
	.byte	50
	.byte	36
	.byte	31
	.byte	45
	.byte	36
	.byte	37
	.byte	45
	.byte	35
	.byte	32
	.byte	41
	.byte	31
	.byte	39
	.byte	30
	.byte	22
	.byte	10
	.byte	11
	.byte	7
	.byte	-4
	.byte	2
	.byte	-6
	.byte	-2
	.byte	-3
	.byte	-9
	.byte	-7
	.byte	-12
	.byte	-17
	.byte	-19
	.byte	-24
	.byte	-30
	.byte	-37
	.byte	-43
	.byte	-49
	.byte	-52
	.byte	-54
	.byte	-56
	.byte	-57
	.byte	-56
	.byte	-57
	.byte	-58
	.byte	-56
	.byte	-54
	.byte	-54
	.byte	-54
	.byte	-54
	.byte	-54
	.byte	-53
	.byte	-57
	.byte	-59
	.byte	-57
	.byte	-61
	.byte	-65
	.byte	-50
	.byte	0
	.byte	-75
	.byte	-78
	.byte	17
	.byte	4
	.byte	1
	.byte	0
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	68
	.byte	39
	.byte	28
	.byte	30
	.byte	53
	.byte	48
	.byte	29
	.byte	34
	.byte	48
	.byte	37
	.byte	38
	.byte	50
	.byte	36
	.byte	31
	.byte	45
	.byte	36
	.byte	37
	.byte	45
	.byte	35
	.byte	32
	.byte	41
	.byte	31
	.byte	39
	.byte	30
	.byte	22
	.byte	10
	.byte	11
	.byte	7
	.byte	-4
	.byte	2
	.byte	-6
	.byte	-2
	.byte	-3
	.byte	-9
	.byte	-7
	.byte	-12
	.byte	-17
	.byte	-19
	.byte	-24
	.byte	-30
	.byte	-37
	.byte	-43
	.byte	-49
	.byte	-52
	.byte	-54
	.byte	-56
	.byte	-57
	.byte	-56
	.byte	-57
	.byte	-58
	.byte	-56
	.byte	-54
	.byte	-54
	.byte	-54
	.byte	-54
	.byte	-54
	.byte	-53
	.byte	-57
	.byte	-59
	.byte	-57
	.byte	-61
	.byte	-65
	.byte	-50
	.byte	0
	.byte	-75
	.byte	-78
	.type	veq_coefficients_nb, %object
	.size	veq_coefficients_nb, 372
veq_coefficients_nb:
	.byte	17
	.byte	4
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	80
	.byte	83
	.byte	79
	.byte	80
	.byte	82
	.byte	79
	.byte	83
	.byte	80
	.byte	83
	.byte	81
	.byte	81
	.byte	82
	.byte	81
	.byte	83
	.byte	82
	.byte	84
	.byte	82
	.byte	82
	.byte	80
	.byte	78
	.byte	75
	.byte	71
	.byte	63
	.byte	55
	.byte	45
	.byte	31
	.byte	19
	.byte	16
	.byte	18
	.byte	16
	.byte	18
	.byte	11
	.byte	-5
	.byte	-15
	.byte	-24
	.byte	-30
	.byte	-36
	.byte	-44
	.byte	-51
	.byte	-60
	.byte	-69
	.byte	-84
	.byte	-103
	.byte	-111
	.byte	-110
	.byte	-108
	.byte	-108
	.byte	-107
	.byte	-109
	.byte	-97
	.byte	-113
	.byte	0
	.byte	-44
	.byte	-81
	.byte	17
	.byte	4
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	80
	.byte	83
	.byte	79
	.byte	80
	.byte	82
	.byte	79
	.byte	83
	.byte	80
	.byte	83
	.byte	81
	.byte	81
	.byte	82
	.byte	81
	.byte	83
	.byte	82
	.byte	84
	.byte	82
	.byte	82
	.byte	80
	.byte	78
	.byte	75
	.byte	71
	.byte	63
	.byte	55
	.byte	45
	.byte	31
	.byte	19
	.byte	16
	.byte	18
	.byte	16
	.byte	18
	.byte	11
	.byte	-5
	.byte	-15
	.byte	-24
	.byte	-30
	.byte	-36
	.byte	-44
	.byte	-51
	.byte	-60
	.byte	-69
	.byte	-84
	.byte	-103
	.byte	-111
	.byte	-110
	.byte	-108
	.byte	-108
	.byte	-107
	.byte	-109
	.byte	-97
	.byte	-113
	.byte	0
	.byte	-44
	.byte	-81
	.byte	17
	.byte	4
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	80
	.byte	83
	.byte	79
	.byte	80
	.byte	82
	.byte	79
	.byte	83
	.byte	80
	.byte	83
	.byte	81
	.byte	81
	.byte	82
	.byte	81
	.byte	83
	.byte	82
	.byte	84
	.byte	82
	.byte	82
	.byte	80
	.byte	78
	.byte	75
	.byte	71
	.byte	63
	.byte	55
	.byte	45
	.byte	31
	.byte	19
	.byte	16
	.byte	18
	.byte	16
	.byte	18
	.byte	11
	.byte	-5
	.byte	-15
	.byte	-24
	.byte	-30
	.byte	-36
	.byte	-44
	.byte	-51
	.byte	-60
	.byte	-69
	.byte	-84
	.byte	-103
	.byte	-111
	.byte	-110
	.byte	-108
	.byte	-108
	.byte	-107
	.byte	-109
	.byte	-97
	.byte	-113
	.byte	0
	.byte	-44
	.byte	-81
	.byte	17
	.byte	4
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	80
	.byte	83
	.byte	79
	.byte	80
	.byte	82
	.byte	79
	.byte	83
	.byte	80
	.byte	83
	.byte	81
	.byte	81
	.byte	82
	.byte	81
	.byte	83
	.byte	82
	.byte	84
	.byte	82
	.byte	82
	.byte	80
	.byte	78
	.byte	75
	.byte	71
	.byte	63
	.byte	55
	.byte	45
	.byte	31
	.byte	19
	.byte	16
	.byte	18
	.byte	16
	.byte	18
	.byte	11
	.byte	-5
	.byte	-15
	.byte	-24
	.byte	-30
	.byte	-36
	.byte	-44
	.byte	-51
	.byte	-60
	.byte	-69
	.byte	-84
	.byte	-103
	.byte	-111
	.byte	-110
	.byte	-108
	.byte	-108
	.byte	-107
	.byte	-109
	.byte	-97
	.byte	-113
	.byte	0
	.byte	-44
	.byte	-81
	.byte	17
	.byte	4
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	80
	.byte	83
	.byte	79
	.byte	80
	.byte	82
	.byte	79
	.byte	83
	.byte	80
	.byte	83
	.byte	81
	.byte	81
	.byte	82
	.byte	81
	.byte	83
	.byte	82
	.byte	84
	.byte	82
	.byte	82
	.byte	80
	.byte	78
	.byte	75
	.byte	71
	.byte	63
	.byte	55
	.byte	45
	.byte	31
	.byte	19
	.byte	16
	.byte	18
	.byte	16
	.byte	18
	.byte	11
	.byte	-5
	.byte	-15
	.byte	-24
	.byte	-30
	.byte	-36
	.byte	-44
	.byte	-51
	.byte	-60
	.byte	-69
	.byte	-84
	.byte	-103
	.byte	-111
	.byte	-110
	.byte	-108
	.byte	-108
	.byte	-107
	.byte	-109
	.byte	-97
	.byte	-113
	.byte	0
	.byte	-44
	.byte	-81
	.byte	17
	.byte	4
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	80
	.byte	83
	.byte	79
	.byte	80
	.byte	82
	.byte	79
	.byte	83
	.byte	80
	.byte	83
	.byte	81
	.byte	81
	.byte	82
	.byte	81
	.byte	83
	.byte	82
	.byte	84
	.byte	82
	.byte	82
	.byte	80
	.byte	78
	.byte	75
	.byte	71
	.byte	63
	.byte	55
	.byte	45
	.byte	31
	.byte	19
	.byte	16
	.byte	18
	.byte	16
	.byte	18
	.byte	11
	.byte	-5
	.byte	-15
	.byte	-24
	.byte	-30
	.byte	-36
	.byte	-44
	.byte	-51
	.byte	-60
	.byte	-69
	.byte	-84
	.byte	-103
	.byte	-111
	.byte	-110
	.byte	-108
	.byte	-108
	.byte	-107
	.byte	-109
	.byte	-97
	.byte	-113
	.byte	0
	.byte	-44
	.byte	-81
	.type	es705_audio_custom_profiles, %object
	.size	es705_audio_custom_profiles, 320
es705_audio_custom_profiles:
	.word	-1
	.space	76
	.word	-1
	.space	76
	.word	-1
	.space	76
	.word	-1
	.space	76
	.type	es705_dai, %object
	.size	es705_dai, 1360
es705_dai:
	.word	.LC374
	.word	0
	.space	24
	.word	es705_slim_port_dai_ops
	.space	44
	.word	.LC375
	.space	4
	.word	12
	.word	0
	.word	128
	.space	8
	.word	1
	.word	2
	.space	4
	.space	16
	.word	.LC376
	.word	1
	.space	24
	.word	es705_slim_port_dai_ops
	.space	4
	.word	.LC377
	.space	4
	.word	12
	.word	0
	.word	128
	.space	8
	.word	1
	.word	2
	.space	4
	.space	56
	.word	.LC378
	.word	2
	.space	24
	.word	es705_slim_port_dai_ops
	.space	44
	.word	.LC379
	.space	4
	.word	12
	.word	0
	.word	128
	.space	8
	.word	1
	.word	2
	.space	4
	.space	16
	.word	.LC380
	.word	3
	.space	24
	.word	es705_slim_port_dai_ops
	.space	4
	.word	.LC381
	.space	4
	.word	12
	.word	0
	.word	128
	.space	8
	.word	1
	.word	2
	.space	4
	.space	56
	.word	.LC382
	.word	4
	.space	24
	.word	es705_slim_port_dai_ops
	.space	44
	.word	.LC383
	.space	4
	.word	12
	.word	0
	.word	128
	.space	8
	.word	1
	.word	4
	.space	4
	.space	16
	.word	.LC384
	.word	5
	.space	24
	.word	es705_slim_port_dai_ops
	.space	4
	.word	.LC385
	.space	4
	.word	12
	.word	0
	.word	128
	.space	8
	.word	1
	.word	2
	.space	4
	.space	56
	.word	.LC386
	.word	7
	.space	24
	.word	es705_i2s_port_dai_ops
	.space	4
	.word	.LC387
	.space	4
	.word	3276
	.word	48
	.word	5310
	.space	8
	.word	2
	.word	2
	.space	4
	.word	.LC388
	.space	4
	.word	3276
	.word	48
	.word	5310
	.space	8
	.word	2
	.word	2
	.space	4
	.space	16
	.word	.LC389
	.word	8
	.space	24
	.word	es705_i2s_port_dai_ops
	.space	4
	.word	.LC390
	.space	4
	.word	3276
	.word	48
	.word	5310
	.space	8
	.word	2
	.word	2
	.space	4
	.word	.LC391
	.space	4
	.word	3276
	.word	48
	.word	5310
	.space	8
	.word	2
	.word	2
	.space	4
	.space	16
	.word	.LC392
	.word	9
	.space	24
	.word	es705_i2s_port_dai_ops
	.space	4
	.word	.LC393
	.space	4
	.word	3276
	.word	48
	.word	5310
	.space	8
	.word	2
	.word	2
	.space	4
	.word	.LC394
	.space	4
	.word	3276
	.word	48
	.word	5310
	.space	8
	.word	2
	.word	2
	.space	4
	.space	16
	.word	.LC395
	.word	10
	.space	24
	.word	es705_i2s_port_dai_ops
	.space	4
	.word	.LC396
	.space	4
	.word	3276
	.word	48
	.word	5310
	.space	8
	.word	2
	.word	2
	.space	4
	.word	.LC397
	.space	4
	.word	3276
	.word	48
	.word	5310
	.space	8
	.word	2
	.word	2
	.space	4
	.space	16
	.type	soc_codec_dev_es705, %object
	.size	soc_codec_dev_es705, 120
soc_codec_dev_es705:
	.word	es705_codec_probe
	.word	es705_codec_remove
	.word	es705_codec_suspend
	.word	es705_codec_resume
	.space	32
	.word	es705_read
	.word	es705_write
	.space	40
	.word	es705_set_bias_level
	.space	20
	.type	es705_digital_ext_snd_controls, %object
	.size	es705_digital_ext_snd_controls, 2592
es705_digital_ext_snd_controls:
	.word	2
	.space	8
	.word	.LC243
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_rx1_route_enable_value
	.word	es705_put_rx1_route_enable_value
	.space	4
	.word	__compound_literal.0
	.word	2
	.space	8
	.word	.LC244
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_tx1_route_enable_value
	.word	es705_put_tx1_route_enable_value
	.space	4
	.word	__compound_literal.1
	.word	2
	.space	8
	.word	.LC245
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_rx2_route_enable_value
	.word	es705_put_rx2_route_enable_value
	.space	4
	.word	__compound_literal.2
	.word	2
	.space	8
	.word	.LC246
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_control_enum
	.word	es705_put_control_enum
	.space	4
	.word	es705_mic_config_enum
	.word	2
	.space	8
	.word	.LC247
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_control_enum
	.word	es705_put_control_enum
	.space	4
	.word	es705_aec_mode_enum
	.word	2
	.space	8
	.word	.LC248
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_veq_preset_value
	.word	es705_put_veq_preset_value
	.space	4
	.word	es705_veq_enable_enum
	.word	2
	.space	8
	.word	.LC249
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_control_enum
	.word	es705_put_control_enum
	.space	4
	.word	es705_dereverb_enable_enum
	.word	2
	.space	8
	.word	.LC250
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_dereverb_gain_value
	.word	es705_put_dereverb_gain_value
	.space	4
	.word	__compound_literal.3
	.word	2
	.space	8
	.word	.LC251
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_control_enum
	.word	es705_put_control_enum
	.space	4
	.word	es705_bwe_enable_enum
	.word	2
	.space	8
	.word	.LC252
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_bwe_high_band_gain_value
	.word	es705_put_bwe_high_band_gain_value
	.space	4
	.word	__compound_literal.4
	.word	2
	.space	8
	.word	.LC253
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_bwe_max_snr_value
	.word	es705_put_bwe_max_snr_value
	.space	4
	.word	__compound_literal.5
	.word	2
	.space	8
	.word	.LC254
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_control_enum
	.word	es705_put_control_enum
	.space	4
	.word	es705_bwe_post_eq_enable_enum
	.word	2
	.space	8
	.word	.LC255
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_control_value
	.word	es705_put_control_value
	.space	4
	.word	__compound_literal.6
	.word	2
	.space	8
	.word	.LC256
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_power_state_enum
	.word	es705_put_power_state_enum
	.space	4
	.word	es705_power_state_enum
	.word	2
	.space	8
	.word	.LC257
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_control_enum
	.word	es705_put_control_enum
	.space	4
	.word	es705_algo_processing_enable_enum
	.word	2
	.space	8
	.word	.LC258
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_control_enum
	.word	es705_put_control_enum
	.space	4
	.word	es705_algo_sample_rate_enum
	.word	2
	.space	8
	.word	.LC259
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_control_enum
	.word	es705_put_control_enum
	.space	4
	.word	es705_algorithms_enum
	.word	2
	.space	8
	.word	.LC260
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_control_enum
	.word	es705_put_control_enum
	.space	4
	.word	es705_algo_mix_rate_enum
	.word	2
	.space	8
	.word	.LC261
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_internal_route
	.word	es705_put_internal_route
	.space	4
	.word	__compound_literal.7
	.word	2
	.space	8
	.word	.LC262
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_internal_rate
	.word	es705_put_internal_rate
	.space	4
	.word	es705_internal_rate_enum
	.word	2
	.space	8
	.word	.LC263
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_preset_value
	.word	es705_put_preset_value
	.space	4
	.word	__compound_literal.8
	.word	2
	.space	8
	.word	.LC264
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_audio_custom_profile
	.word	es705_put_audio_custom_profile
	.space	4
	.word	__compound_literal.9
	.word	2
	.space	8
	.word	.LC265
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_ap_get_tx1_ch_cnt
	.word	es705_ap_put_tx1_ch_cnt
	.space	4
	.word	es705_ap_tx1_ch_cnt_enum
	.word	2
	.space	8
	.word	.LC266
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_vs_enable
	.word	es705_put_vs_enable
	.space	4
	.word	__compound_literal.10
	.word	2
	.space	8
	.word	.LC267
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_vs_wakeup_keyword
	.word	es705_put_vs_wakeup_keyword
	.space	4
	.word	es705_vs_wakeup_keyword_enum
	.word	2
	.space	8
	.word	.LC40
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_control_enum
	.word	0
	.space	4
	.word	es705_vs_event_enum
	.word	2
	.space	8
	.word	.LC268
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_control_enum
	.word	es705_put_control_enum
	.space	4
	.word	es705_vs_training_mode_enum
	.word	2
	.space	8
	.word	.LC269
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_control_enum
	.word	0
	.space	4
	.word	es705_vs_training_status_enum
	.word	2
	.space	8
	.word	.LC270
	.space	12
	.word	snd_soc_info_enum_ext
	.word	0
	.word	es705_put_control_enum
	.space	4
	.word	es705_vs_training_record_enum
	.word	2
	.space	8
	.word	.LC271
	.space	12
	.word	snd_soc_info_enum_ext
	.word	0
	.word	es705_put_vs_stored_keyword
	.space	4
	.word	es705_vs_stored_keyword_enum
	.word	2
	.space	8
	.word	.LC272
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_vs_detection_sensitivity
	.word	es705_put_vs_detection_sensitivity
	.space	4
	.word	__compound_literal.11
	.word	2
	.space	8
	.word	.LC273
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_vad_sensitivity
	.word	es705_put_vad_sensitivity
	.space	4
	.word	__compound_literal.12
	.word	2
	.space	8
	.word	.LC274
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_power_control_enum
	.word	es705_put_power_control_enum
	.space	4
	.word	es705_vs_power_state_enum
	.word	2
	.space	8
	.word	.LC275
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_ns_value
	.word	es705_put_ns_value
	.space	4
	.word	es705_ns_enable_enum
	.word	2
	.space	8
	.word	.LC276
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_aud_zoom
	.word	es705_put_aud_zoom
	.space	4
	.word	es705_audio_zoom_enum
	.word	2
	.space	8
	.word	.LC277
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_streaming_select
	.word	es705_put_control_value
	.space	4
	.word	__compound_literal.13
	.word	2
	.space	8
	.word	.LC278
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_control_enum
	.word	es705_put_control_enum
	.space	4
	.word	es705_rx_enable_enum
	.word	2
	.space	8
	.word	.LC279
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_sw_value
	.word	es705_put_sw_value
	.space	4
	.word	es705_sw_enable_enum
	.word	2
	.space	8
	.word	.LC280
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_sts_value
	.word	es705_put_sts_value
	.space	4
	.word	es705_sts_enable_enum
	.word	2
	.space	8
	.word	.LC281
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_rx_ns_value
	.word	es705_put_rx_ns_value
	.space	4
	.word	es705_rx_ns_enable_enum
	.word	2
	.space	8
	.word	.LC282
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_wnf_value
	.word	es705_put_wnf_value
	.space	4
	.word	es705_wnf_enable_enum
	.word	2
	.space	8
	.word	.LC283
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_bwe_value
	.word	es705_put_bwe_value
	.space	4
	.word	es705_bwe_preset_enable_enum
	.word	2
	.space	8
	.word	.LC284
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_avalon_value
	.word	es705_put_avalon_value
	.space	4
	.word	es705_avalon_wn_enable_enum
	.word	2
	.space	8
	.word	.LC285
	.space	12
	.word	snd_soc_info_enum_ext
	.word	es705_get_vbb_value
	.word	es705_put_vbb_value
	.space	4
	.word	es705_vbb_enable_enum
	.word	2
	.space	8
	.word	.LC286
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_uart_fw_download_rate
	.word	es705_put_uart_fw_download_rate
	.space	4
	.word	__compound_literal.14
	.word	2
	.space	8
	.word	.LC287
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_vs_stream_enable
	.word	es705_put_vs_stream_enable
	.space	4
	.word	__compound_literal.15
	.word	2
	.space	8
	.word	.LC288
	.space	12
	.word	snd_soc_info_volsw
	.word	0
	.word	es705_forced_reroute_w
	.space	4
	.word	__compound_literal.16
	.word	2
	.space	8
	.word	.LC289
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_voice_wakeup_enable_value
	.word	es705_put_voice_wakeup_enable_value
	.space	4
	.word	__compound_literal.17
	.word	2
	.space	8
	.word	.LC290
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_vs_abort_value
	.word	es705_put_vs_abort_value
	.space	4
	.word	__compound_literal.18
	.word	2
	.space	8
	.word	.LC291
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_vs_make_internal_dump
	.word	es705_put_vs_make_internal_dump
	.space	4
	.word	__compound_literal.19
	.word	2
	.space	8
	.word	.LC292
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_vs_make_external_dump
	.word	es705_put_vs_make_external_dump
	.space	4
	.word	__compound_literal.20
	.word	2
	.space	8
	.word	.LC293
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_voice_lpm_enable_value
	.word	es705_put_voice_lpm_enable_value
	.space	4
	.word	__compound_literal.21
	.word	2
	.space	8
	.word	.LC294
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_internal_route_config
	.word	es705_put_internal_route_config
	.space	4
	.word	__compound_literal.22
	.word	2
	.space	8
	.word	.LC295
	.space	12
	.word	snd_soc_info_volsw
	.word	es705_get_network_type
	.word	es705_put_network_type
	.space	4
	.word	__compound_literal.23
	.type	esxxx_mode, %object
	.size	esxxx_mode, 12
esxxx_mode:
	.word	.LC398
	.word	.LC399
	.word	.LC400
	.type	core_sysfs, %object
	.size	core_sysfs, 12
core_sysfs:
	.space	8
	.word	core_sysfs_attrs
	.type	__compound_literal.23, %object
	.size	__compound_literal.23, 32
__compound_literal.23:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.22, %object
	.size	__compound_literal.22, 32
__compound_literal.22:
	.space	4
	.word	100
	.word	100
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.21, %object
	.size	__compound_literal.21, 32
__compound_literal.21:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.20, %object
	.size	__compound_literal.20, 32
__compound_literal.20:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.19, %object
	.size	__compound_literal.19, 32
__compound_literal.19:
	.space	4
	.word	2
	.word	2
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.18, %object
	.size	__compound_literal.18, 32
__compound_literal.18:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.17, %object
	.size	__compound_literal.17, 32
__compound_literal.17:
	.space	4
	.word	2
	.word	2
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.16, %object
	.size	__compound_literal.16, 32
__compound_literal.16:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.15, %object
	.size	__compound_literal.15, 32
__compound_literal.15:
	.space	4
	.word	1
	.word	1
	.word	258
	.word	258
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.14, %object
	.size	__compound_literal.14, 32
__compound_literal.14:
	.space	4
	.word	3
	.word	3
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.13, %object
	.size	__compound_literal.13, 32
__compound_literal.13:
	.space	4
	.word	65535
	.word	65535
	.word	176
	.word	176
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.12, %object
	.size	__compound_literal.12, 32
__compound_literal.12:
	.space	4
	.word	10
	.word	10
	.word	250
	.word	250
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.11, %object
	.size	__compound_literal.11, 32
__compound_literal.11:
	.space	4
	.word	10
	.word	10
	.word	249
	.word	249
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.10, %object
	.size	__compound_literal.10, 32
__compound_literal.10:
	.space	4
	.word	1
	.word	1
	.word	245
	.word	245
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.9, %object
	.size	__compound_literal.9, 32
__compound_literal.9:
	.space	4
	.word	100
	.word	100
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.8, %object
	.size	__compound_literal.8, 32
__compound_literal.8:
	.space	4
	.word	65535
	.word	65535
	.word	177
	.word	177
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.7, %object
	.size	__compound_literal.7, 32
__compound_literal.7:
	.space	4
	.word	100
	.word	100
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.6, %object
	.size	__compound_literal.6, 32
__compound_literal.6:
	.space	4
	.word	65535
	.word	65535
	.word	173
	.word	173
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.5, %object
	.size	__compound_literal.5, 32
__compound_literal.5:
	.space	4
	.word	100
	.word	100
	.word	123
	.word	123
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.4, %object
	.size	__compound_literal.4, 32
__compound_literal.4:
	.space	4
	.word	100
	.word	100
	.word	122
	.word	122
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.3, %object
	.size	__compound_literal.3, 32
__compound_literal.3:
	.space	4
	.word	100
	.word	100
	.word	120
	.word	120
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.2, %object
	.size	__compound_literal.2, 32
__compound_literal.2:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.1, %object
	.size	__compound_literal.1, 32
__compound_literal.1:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	0
	.type	__compound_literal.0, %object
	.size	__compound_literal.0, 32
__compound_literal.0:
	.space	4
	.word	1
	.word	1
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	0
	.type	core_sysfs_attrs, %object
	.size	core_sysfs_attrs, 80
core_sysfs_attrs:
	.word	dev_attr_route_status
	.word	dev_attr_route
	.word	dev_attr_rate
	.word	dev_attr_fw_version
	.word	dev_attr_clock_on
	.word	dev_attr_vs_keyword_parameters
	.word	dev_attr_vs_status
	.word	dev_attr_ping_status
	.word	dev_attr_gpio_reset
	.word	dev_attr_overlay_mode
	.word	dev_attr_vs_event
	.word	dev_attr_tuning
	.word	dev_attr_keyword_grammar_path
	.word	dev_attr_keyword_net_path
	.word	dev_attr_sleep_delay
	.word	dev_attr_preset_delay
	.word	dev_attr_veq_filter
	.word	dev_attr_veq_max
	.word	dev_attr_veq_adj
	.word	0
	.type	dev_attr_veq_adj, %object
	.size	dev_attr_veq_adj, 16
dev_attr_veq_adj:
	.word	.LC355
	.short	420
	.space	2
	.word	0
	.word	es705_veq_adj_set
	.type	dev_attr_veq_max, %object
	.size	dev_attr_veq_max, 16
dev_attr_veq_max:
	.word	.LC356
	.short	420
	.space	2
	.word	0
	.word	es705_veq_max_set
	.type	dev_attr_veq_filter, %object
	.size	dev_attr_veq_filter, 16
dev_attr_veq_filter:
	.word	.LC357
	.short	420
	.space	2
	.word	0
	.word	es705_veq_filter_set
	.type	dev_attr_preset_delay, %object
	.size	dev_attr_preset_delay, 16
dev_attr_preset_delay:
	.word	.LC358
	.short	420
	.space	2
	.word	es705_preset_delay_time_show
	.word	es705_preset_delay_time_set
	.type	dev_attr_sleep_delay, %object
	.size	dev_attr_sleep_delay, 16
dev_attr_sleep_delay:
	.word	.LC359
	.short	420
	.space	2
	.word	es705_sleep_delay_show
	.word	es705_sleep_delay_set
	.type	dev_attr_keyword_net_path, %object
	.size	dev_attr_keyword_net_path, 16
dev_attr_keyword_net_path:
	.word	.LC360
	.short	436
	.space	2
	.word	0
	.word	es705_keyword_net_path_set
	.type	dev_attr_keyword_grammar_path, %object
	.size	dev_attr_keyword_grammar_path, 16
dev_attr_keyword_grammar_path:
	.word	.LC361
	.short	436
	.space	2
	.word	0
	.word	es705_keyword_grammar_path_set
	.type	dev_attr_tuning, %object
	.size	dev_attr_tuning, 16
dev_attr_tuning:
	.word	.LC362
	.short	420
	.space	2
	.word	0
	.word	es705_tuning_set
	.type	dev_attr_vs_event, %object
	.size	dev_attr_vs_event, 16
dev_attr_vs_event:
	.word	.LC363
	.short	420
	.space	2
	.word	0
	.word	es705_vs_event_set
	.type	dev_attr_overlay_mode, %object
	.size	dev_attr_overlay_mode, 16
dev_attr_overlay_mode:
	.word	.LC364
	.short	420
	.space	2
	.word	0
	.word	es705_overlay_mode_set
	.type	dev_attr_gpio_reset, %object
	.size	dev_attr_gpio_reset, 16
dev_attr_gpio_reset:
	.word	.LC365
	.short	420
	.space	2
	.word	0
	.word	es705_gpio_reset_set
	.type	dev_attr_ping_status, %object
	.size	dev_attr_ping_status, 16
dev_attr_ping_status:
	.word	.LC366
	.short	292
	.space	2
	.word	es705_ping_status_show
	.word	0
	.type	dev_attr_vs_status, %object
	.size	dev_attr_vs_status, 16
dev_attr_vs_status:
	.word	.LC367
	.short	292
	.space	2
	.word	es705_vs_status_show
	.word	0
	.type	dev_attr_vs_keyword_parameters, %object
	.size	dev_attr_vs_keyword_parameters, 16
dev_attr_vs_keyword_parameters:
	.word	.LC368
	.short	420
	.space	2
	.word	es705_vs_keyword_parameters_show
	.word	es705_vs_keyword_parameters_set
	.type	dev_attr_clock_on, %object
	.size	dev_attr_clock_on, 16
dev_attr_clock_on:
	.word	.LC369
	.short	292
	.space	2
	.word	es705_clock_on_show
	.word	0
	.type	dev_attr_fw_version, %object
	.size	dev_attr_fw_version, 16
dev_attr_fw_version:
	.word	.LC370
	.short	292
	.space	2
	.word	es705_fw_version_show
	.word	0
	.type	dev_attr_rate, %object
	.size	dev_attr_rate, 16
dev_attr_rate:
	.word	.LC371
	.short	292
	.space	2
	.word	es705_rate_show
	.word	0
	.type	dev_attr_route, %object
	.size	dev_attr_route, 16
dev_attr_route:
	.word	.LC372
	.short	292
	.space	2
	.word	es705_route_show
	.word	0
	.type	dev_attr_route_status, %object
	.size	dev_attr_route_status, 16
dev_attr_route_status:
	.word	.LC373
	.short	292
	.space	2
	.word	es705_route_status_show
	.word	0
	.type	es705_streaming_cmds, %object
	.size	es705_streaming_cmds, 16
es705_streaming_cmds:
	.word	-1876622848
	.word	-1876623360
	.word	-1876622592
	.word	-1876623104
	.type	es705_api_access, %object
	.size	es705_api_access, 8288
es705_api_access:
	.word	-2146041854
	.space	4
	.word	4
	.word	-1877540862
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041853
	.space	4
	.word	4
	.word	-1877540861
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041852
	.space	4
	.word	4
	.word	-1877540860
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041851
	.space	4
	.word	4
	.word	-1877540859
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041850
	.space	4
	.word	4
	.word	-1877540858
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041849
	.space	4
	.word	4
	.word	-1877540857
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041847
	.space	4
	.word	4
	.word	-1877540855
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041843
	.space	4
	.word	4
	.word	-1877540851
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041842
	.space	4
	.word	4
	.word	-1877540850
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041840
	.space	4
	.word	4
	.word	-1877540848
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041839
	.space	4
	.word	4
	.word	-1877540847
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041838
	.space	4
	.word	4
	.word	-1877540846
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041835
	.space	4
	.word	4
	.word	-1877540843
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041834
	.space	4
	.word	4
	.word	-1877540842
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041830
	.space	4
	.word	4
	.word	-1877540838
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041829
	.space	4
	.word	4
	.word	-1877540837
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041828
	.space	4
	.word	4
	.word	-1877540836
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041825
	.space	4
	.word	4
	.word	-1877540833
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041824
	.space	4
	.word	4
	.word	-1877540832
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041821
	.space	4
	.word	4
	.word	-1877540829
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041820
	.space	4
	.word	4
	.word	-1877540828
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041818
	.space	4
	.word	4
	.word	-1877540826
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041817
	.space	4
	.word	4
	.word	-1877540825
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041816
	.space	4
	.word	4
	.word	-1877540824
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041815
	.space	4
	.word	4
	.word	-1877540823
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041814
	.space	4
	.word	4
	.word	-1877540822
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041813
	.space	4
	.word	4
	.word	-1877540821
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041812
	.space	4
	.word	4
	.word	-1877540820
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041811
	.space	4
	.word	4
	.word	-1877540819
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041810
	.space	4
	.word	4
	.word	-1877540818
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041808
	.space	4
	.word	4
	.word	-1877540816
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041807
	.space	4
	.word	4
	.word	-1877540815
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041804
	.space	4
	.word	4
	.word	-1877540812
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041799
	.space	4
	.word	4
	.word	-1877540807
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041798
	.space	4
	.word	4
	.word	-1877540806
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041795
	.space	4
	.word	4
	.word	-1877540803
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041794
	.space	4
	.word	4
	.word	-1877540802
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041793
	.space	4
	.word	4
	.word	-1877540801
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041792
	.space	4
	.word	4
	.word	-1877540800
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041790
	.space	4
	.word	4
	.word	-1877540798
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041789
	.space	4
	.word	4
	.word	-1877540797
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041785
	.space	4
	.word	4
	.word	-1877540793
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041781
	.space	4
	.word	4
	.word	-1877540789
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041780
	.space	4
	.word	4
	.word	-1877540788
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041779
	.space	4
	.word	4
	.word	-1877540787
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041778
	.space	4
	.word	4
	.word	-1877540786
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041600
	.space	4
	.word	4
	.word	-1877540608
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041598
	.space	4
	.word	4
	.word	-1877540606
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037759
	.space	4
	.word	4
	.word	-1877536767
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037758
	.space	4
	.word	4
	.word	-1877536766
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037757
	.space	4
	.word	4
	.word	-1877536765
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037757
	.space	4
	.word	4
	.word	-1877536765
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037755
	.space	4
	.word	4
	.word	-1877536763
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037754
	.space	4
	.word	4
	.word	-1877536762
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037753
	.space	4
	.word	4
	.word	-1877536761
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037752
	.space	4
	.word	4
	.word	-1877536760
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037751
	.space	4
	.word	4
	.word	-1877536759
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037750
	.space	4
	.word	4
	.word	-1877536758
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037749
	.space	4
	.word	4
	.word	-1877536757
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037748
	.space	4
	.word	4
	.word	-1877536756
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037747
	.space	4
	.word	4
	.word	-1877536755
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037746
	.space	4
	.word	4
	.word	-1877536754
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037745
	.space	4
	.word	4
	.word	-1877536753
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037744
	.space	4
	.word	4
	.word	-1877536752
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037743
	.space	4
	.word	4
	.word	-1877536751
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037742
	.space	4
	.word	4
	.word	-1877536750
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037741
	.space	4
	.word	4
	.word	-1877536749
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037740
	.space	4
	.word	4
	.word	-1877536748
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037739
	.space	4
	.word	4
	.word	-1877536747
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037738
	.space	4
	.word	4
	.word	-1877536746
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037737
	.space	4
	.word	4
	.word	-1877536745
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037736
	.space	4
	.word	4
	.word	-1877536744
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037735
	.space	4
	.word	4
	.word	-1877536743
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037734
	.space	4
	.word	4
	.word	-1877536742
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037733
	.space	4
	.word	4
	.word	-1877536741
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037732
	.space	4
	.word	4
	.word	-1877536740
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037731
	.space	4
	.word	4
	.word	-1877536739
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037730
	.space	4
	.word	4
	.word	-1877536738
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037729
	.space	4
	.word	4
	.word	-1877536737
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146037728
	.space	4
	.word	4
	.word	-1877536736
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033664
	.space	4
	.word	4
	.word	-1877532672
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033663
	.space	4
	.word	4
	.word	-1877532671
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033662
	.space	4
	.word	4
	.word	-1877532670
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033660
	.space	4
	.word	4
	.word	-1877532668
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033658
	.space	4
	.word	4
	.word	-1877532666
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033657
	.space	4
	.word	4
	.word	-1877532665
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033656
	.space	4
	.word	4
	.word	-1877532664
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033655
	.space	4
	.word	4
	.word	-1877532663
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033654
	.space	4
	.word	4
	.word	-1877532662
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033653
	.space	4
	.word	4
	.word	-1877532661
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033652
	.space	4
	.word	4
	.word	-1877532660
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033651
	.space	4
	.word	4
	.word	-1877532659
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033650
	.space	4
	.word	4
	.word	-1877532658
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033649
	.space	4
	.word	4
	.word	-1877532657
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033648
	.space	4
	.word	4
	.word	-1877532656
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033647
	.space	4
	.word	4
	.word	-1877532655
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033645
	.space	4
	.word	4
	.word	-1877532653
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033644
	.space	4
	.word	4
	.word	-1877532652
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033643
	.space	4
	.word	4
	.word	-1877532651
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033642
	.space	4
	.word	4
	.word	-1877532650
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033641
	.space	4
	.word	4
	.word	-1877532649
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033640
	.space	4
	.word	4
	.word	-1877532648
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033639
	.space	4
	.word	4
	.word	-1877532647
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033638
	.space	4
	.word	4
	.word	-1877532646
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033637
	.space	4
	.word	4
	.word	-1877532645
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033636
	.space	4
	.word	4
	.word	-1877532644
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033635
	.space	4
	.word	4
	.word	-1877532643
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033633
	.space	4
	.word	4
	.word	-1877532641
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033632
	.space	4
	.word	4
	.word	-1877532640
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146033631
	.space	4
	.word	4
	.word	-1877532639
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146029567
	.space	4
	.word	4
	.word	-1877528575
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146029566
	.space	4
	.word	4
	.word	-1877528574
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146029565
	.space	4
	.word	4
	.word	-1877528573
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146029563
	.space	4
	.word	4
	.word	-1877528571
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146029562
	.space	4
	.word	4
	.word	-1877528570
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146029561
	.space	4
	.word	4
	.word	-1877528569
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146029560
	.space	4
	.word	4
	.word	-1877528568
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146029559
	.space	4
	.word	4
	.word	-1877528567
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146029558
	.space	4
	.word	4
	.word	-1877528566
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041773
	.space	4
	.word	4
	.word	-1877540781
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041772
	.space	4
	.word	4
	.word	-1877540780
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041777
	.space	4
	.word	4
	.word	-1877540785
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041776
	.space	4
	.word	4
	.word	-1877540784
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041775
	.space	4
	.word	4
	.word	-1877540783
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146041774
	.space	4
	.word	4
	.word	-1877540782
	.word	-1877475328
	.word	8
	.word	0
	.word	65535
	.word	-2146760192
	.space	4
	.word	4
	.word	-1878259200
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146760191
	.space	4
	.word	4
	.word	-1878259199
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146760190
	.space	4
	.word	4
	.word	-1878259198
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146760189
	.space	4
	.word	4
	.word	-1878259197
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146760188
	.space	4
	.word	4
	.word	-1878259196
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146760187
	.space	4
	.word	4
	.word	-1878259195
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146760186
	.space	4
	.word	4
	.word	-1878259194
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146760185
	.space	4
	.word	4
	.word	-1878259193
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146760184
	.space	4
	.word	4
	.word	-1878259192
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146760183
	.space	4
	.word	4
	.word	-1878259191
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146760182
	.space	4
	.word	4
	.word	-1878259190
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146760181
	.space	4
	.word	4
	.word	-1878259189
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759936
	.space	4
	.word	4
	.word	-1878258944
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759935
	.space	4
	.word	4
	.word	-1878258943
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759934
	.space	4
	.word	4
	.word	-1878258942
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759933
	.space	4
	.word	4
	.word	-1878258941
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759932
	.space	4
	.word	4
	.word	-1878258940
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759931
	.space	4
	.word	4
	.word	-1878258939
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759930
	.space	4
	.word	4
	.word	-1878258938
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759929
	.space	4
	.word	4
	.word	-1878258937
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759928
	.space	4
	.word	4
	.word	-1878258936
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759927
	.space	4
	.word	4
	.word	-1878258935
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759926
	.space	4
	.word	4
	.word	-1878258934
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759925
	.space	4
	.word	4
	.word	-1878258933
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759680
	.space	4
	.word	4
	.word	-1878258688
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759679
	.space	4
	.word	4
	.word	-1878258687
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759678
	.space	4
	.word	4
	.word	-1878258686
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759677
	.space	4
	.word	4
	.word	-1878258685
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759676
	.space	4
	.word	4
	.word	-1878258684
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759675
	.space	4
	.word	4
	.word	-1878258683
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759674
	.space	4
	.word	4
	.word	-1878258682
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759673
	.space	4
	.word	4
	.word	-1878258681
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759672
	.space	4
	.word	4
	.word	-1878258680
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759671
	.space	4
	.word	4
	.word	-1878258679
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759670
	.space	4
	.word	4
	.word	-1878258678
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759669
	.space	4
	.word	4
	.word	-1878258677
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759424
	.space	4
	.word	4
	.word	-1878258432
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759423
	.space	4
	.word	4
	.word	-1878258431
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759422
	.space	4
	.word	4
	.word	-1878258430
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759421
	.space	4
	.word	4
	.word	-1878258429
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759420
	.space	4
	.word	4
	.word	-1878258428
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759419
	.space	4
	.word	4
	.word	-1878258427
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759418
	.space	4
	.word	4
	.word	-1878258426
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759417
	.space	4
	.word	4
	.word	-1878258425
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759416
	.space	4
	.word	4
	.word	-1878258424
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759415
	.space	4
	.word	4
	.word	-1878258423
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759414
	.space	4
	.word	4
	.word	-1878258422
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146759413
	.space	4
	.word	4
	.word	-1878258421
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146760448
	.space	4
	.word	4
	.word	-1878259456
	.word	-1878196224
	.word	8
	.word	0
	.word	65535
	.word	-2146500608
	.space	4
	.word	4
	.word	-1877999616
	.space	4
	.word	4
	.word	0
	.word	6
	.word	-2145058816
	.space	4
	.word	4
	.word	-2145058816
	.space	4
	.word	4
	.word	0
	.word	5
	.word	-2144862208
	.space	4
	.word	4
	.word	-1876426752
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2144272384
	.space	4
	.word	4
	.word	-1875836928
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2143158272
	.space	4
	.word	4
	.word	-2143158272
	.space	4
	.word	4
	.word	0
	.word	15
	.word	-2143092736
	.space	4
	.word	4
	.word	-2145648640
	.space	4
	.word	4
	.word	0
	.word	1
	.word	-2142568448
	.space	4
	.word	4
	.word	-2142502912
	.space	4
	.word	4
	.word	0
	.word	5
	.word	-2142437376
	.space	4
	.word	4
	.word	-2142371840
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2142306304
	.space	4
	.word	4
	.word	-2142306304
	.space	4
	.word	4
	.word	0
	.word	4
	.word	-2142109696
	.space	4
	.word	4
	.word	-2142109696
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2141519872
	.space	4
	.word	4
	.word	-2141585408
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2141388800
	.space	4
	.word	4
	.word	-2141454336
	.space	4
	.word	4
	.word	0
	.word	4
	.word	-2140864512
	.space	4
	.word	4
	.word	-2141323264
	.space	4
	.word	4
	.word	0
	.word	5
	.word	-2146238464
	.space	4
	.word	4
	.word	-2146238464
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146238463
	.space	4
	.word	4
	.word	-2146238463
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146238462
	.space	4
	.word	4
	.word	-2146238462
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146238461
	.space	4
	.word	4
	.word	-2146238461
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146238460
	.space	4
	.word	4
	.word	-2146238460
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146238459
	.space	4
	.word	4
	.word	-2146238459
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146238458
	.space	4
	.word	4
	.word	-2146238458
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146238457
	.space	4
	.word	4
	.word	-2146238457
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146238456
	.space	4
	.word	4
	.word	-2146238456
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146238455
	.space	4
	.word	4
	.word	-2146238455
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146238454
	.space	4
	.word	4
	.word	-2146238454
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146238453
	.space	4
	.word	4
	.word	-2146238453
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146238452
	.space	4
	.word	4
	.word	-2146238452
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146238451
	.space	4
	.word	4
	.word	-2146238451
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146238450
	.space	4
	.word	4
	.word	-2146238450
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146238449
	.space	4
	.word	4
	.word	-2146238449
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146172928
	.space	4
	.word	4
	.word	-2146172928
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146172927
	.space	4
	.word	4
	.word	-2146172927
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146172926
	.space	4
	.word	4
	.word	-2146172926
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146172925
	.space	4
	.word	4
	.word	-2146172925
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146172924
	.space	4
	.word	4
	.word	-2146172924
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146172923
	.space	4
	.word	4
	.word	-2146172923
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146172922
	.space	4
	.word	4
	.word	-2146172922
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146172921
	.space	4
	.word	4
	.word	-2146172921
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146172920
	.space	4
	.word	4
	.word	-2146172920
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146172919
	.space	4
	.word	4
	.word	-2146172919
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146172918
	.space	4
	.word	4
	.word	-2146172918
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146172917
	.space	4
	.word	4
	.word	-2146172917
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146172916
	.space	4
	.word	4
	.word	-2146172916
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146172915
	.space	4
	.word	4
	.word	-2146172915
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146172914
	.space	4
	.word	4
	.word	-2146172914
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2146172913
	.space	4
	.word	4
	.word	-2146172913
	.space	4
	.word	4
	.word	0
	.word	65535
	.word	-2145583103
	.space	4
	.word	4
	.word	-2146107136
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2145583102
	.space	4
	.word	4
	.word	-2146106880
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2145583101
	.space	4
	.word	4
	.word	-2146106624
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2145583100
	.space	4
	.word	4
	.word	-2146106368
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2145583099
	.space	4
	.word	4
	.word	-2146106112
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2145583098
	.space	4
	.word	4
	.word	-2146105856
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2145583097
	.space	4
	.word	4
	.word	-2146105600
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2145583096
	.space	4
	.word	4
	.word	-2146105344
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2145583095
	.space	4
	.word	4
	.word	-2146105088
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2145583094
	.space	4
	.word	4
	.word	-2146104832
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2145583093
	.space	4
	.word	4
	.word	-2146104576
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2145583088
	.space	4
	.word	4
	.word	-2146103296
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2145583087
	.space	4
	.word	4
	.word	-2146103040
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2145583086
	.space	4
	.word	4
	.word	-2146102784
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2145583085
	.space	4
	.word	4
	.word	-2146102528
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2145583084
	.space	4
	.word	4
	.word	-2146102272
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2145583083
	.space	4
	.word	4
	.word	-2146102016
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2145583082
	.space	4
	.word	4
	.word	-2146101760
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2141650944
	.space	4
	.word	4
	.word	-2141716480
	.space	4
	.word	4
	.word	0
	.word	15
	.word	-2141646848
	.space	4
	.word	4
	.word	-2141712384
	.space	4
	.word	4
	.word	0
	.word	15
	.word	-2141642752
	.space	4
	.word	4
	.word	-2141708288
	.space	4
	.word	4
	.word	0
	.word	15
	.word	-2141638656
	.space	4
	.word	4
	.word	-2141704192
	.space	4
	.word	4
	.word	0
	.word	15
	.word	-2141585408
	.space	4
	.word	4
	.word	-2141650944
	.space	4
	.word	4
	.word	0
	.word	0
	.word	-2145386496
	.space	4
	.word	4
	.word	-2145386496
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2145320960
	.space	4
	.word	4
	.word	-2145320960
	.space	4
	.word	4
	.word	0
	.word	255
	.word	-2145779712
	.space	4
	.word	4
	.word	-1877344256
	.space	4
	.word	4
	.word	0
	.word	4
	.word	-2147483648
	.space	4
	.word	4
	.word	-2147483648
	.space	4
	.word	4
	.word	0
	.word	1
	.word	-2147483648
	.space	4
	.word	4
	.word	-2147483648
	.space	4
	.word	4
	.word	0
	.word	4
	.word	-2140340224
	.space	4
	.word	4
	.word	-2147483648
	.space	4
	.word	4
	.word	0
	.word	2
	.word	-2146021373
	.space	4
	.word	4
	.word	-1877520381
	.word	-1877475328
	.word	8
	.word	0
	.word	2
	.word	-2146021372
	.space	4
	.word	4
	.word	-1877520380
	.word	-1877475328
	.word	8
	.word	0
	.word	10
	.word	-2146021371
	.space	4
	.word	4
	.word	-1877520379
	.word	-1877475328
	.word	8
	.word	0
	.word	10
	.word	-2146021370
	.space	4
	.word	4
	.word	-1877520378
	.word	-1877475328
	.word	8
	.word	0
	.word	1
	.word	-2147483648
	.space	4
	.word	4
	.word	-2147483648
	.space	4
	.word	4
	.word	0
	.word	1
	.word	-2147483648
	.space	4
	.word	4
	.word	-2147483648
	.space	4
	.word	4
	.word	0
	.word	1
	.space	32
	.word	-2140143616
	.space	4
	.word	4
	.word	-1871708160
	.space	4
	.word	4
	.word	0
	.word	1
	.word	-2140078080
	.space	4
	.word	4
	.word	-2140078080
	.space	4
	.word	4
	.word	0
	.word	1
	.word	-2146041739
	.space	4
	.word	4
	.word	-1877540747
	.word	-1877475328
	.word	8
	.word	0
	.word	1
	.space	32
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	network_type, %object
	.size	network_type, 4
network_type:
	.space	4
	.type	abort_request, %object
	.size	abort_request, 4
abort_request:
	.space	4
	.type	extra_vol_onoff, %object
	.size	extra_vol_onoff, 4
extra_vol_onoff:
	.space	4
	.type	cnt_restore_std_fw_in_sleep, %object
	.size	cnt_restore_std_fw_in_sleep, 4
cnt_restore_std_fw_in_sleep:
	.space	4
	.type	cnt_restore_std_fw_in_wakeup, %object
	.size	cnt_restore_std_fw_in_wakeup, 4
cnt_restore_std_fw_in_wakeup:
	.space	4
	.type	__key.30152, %object
	.size	__key.30152, 0
__key.30152:
	.type	__key.30153, %object
	.size	__key.30153, 0
__key.30153:
	.type	__key.30154, %object
	.size	__key.30154, 0
__key.30154:
	.type	__key.30155, %object
	.size	__key.30155, 0
__key.30155:
	.section	.exitcall.exit,"aw",%progbits
	.align	2
	.type	__exitcall_es705_exit, %object
	.size	__exitcall_es705_exit, 4
__exitcall_es705_exit:
	.word	es705_exit
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_es705_init6, %object
	.size	__initcall_es705_init6, 4
__initcall_es705_init6:
	.word	es705_init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC8:
	.ascii	"%s(): abort request = %d\012\000"
	.space	2
.LC9:
	.ascii	"%s(): voice_lpm_enable = %d\012\000"
	.space	3
.LC10:
	.ascii	"<7>\000"
.LC11:
	.ascii	"%s(): voice_wakeup_enable = %d\012\000"
.LC12:
	.ascii	"%s(): Zoom = %d\012\000"
	.space	3
.LC13:
	.ascii	"%s(): NS = %d\012\000"
	.space	1
.LC14:
	.ascii	"%s():es705->internal_rate = %d ucontrol = %d\012\000"
	.space	2
.LC15:
	.ascii	"%s(): rx2_route_enable = %d\012\000"
	.space	3
.LC16:
	.ascii	"%s(): tx1_route_enable = %d\012\000"
	.space	3
.LC17:
	.ascii	"%s(): rx1_route_enable = %d\012\000"
	.space	3
.LC18:
	.ascii	"%s(): GPIO reset\012\000"
	.space	2
.LC19:
	.ascii	"%s(): Ready for STANDARD download by proxy\012\000"
.LC20:
	.ascii	"%s(): invalid address = 0x%04x\012\000"
.LC21:
	.ascii	"%s(): reg=%d val=%d msg_len = %d val_mask = 0x%08x\012"
	.ascii	"\000"
.LC22:
	.ascii	"%s(): es705_xxxx_write()\000"
	.space	3
.LC23:
	.ascii	"<6>%s : cnt = %d\012\000"
	.space	2
.LC24:
	.ascii	"%s(): put work task workqueue after delay(200ms)\012"
	.ascii	" \000"
	.space	1
.LC25:
	.ascii	"%s()\012\000"
	.space	2
.LC26:
	.ascii	"%d\000"
	.space	1
.LC27:
	.ascii	"%s : adj gain (%d %d): \000"
.LC28:
	.ascii	"%s : adj gain is changed(%d %d): \000"
	.space	2
.LC29:
	.ascii	"%s : max gain (%d %d): \000"
.LC30:
	.ascii	"%s : max gain is changed(%d %d): \000"
	.space	2
.LC31:
	.ascii	"<6>%s : [ES705] uart_pin_config = %d\012\000"
	.space	2
.LC32:
	.ascii	"%s(): preset_delay_time = %d\012\000"
	.space	2
.LC33:
	.ascii	"%s(): sleep delay = %d\012\000"
.LC34:
	.ascii	"%d\012\000"
.LC35:
	.ascii	"%s(): firmware load failed sync write\012\000"
	.space	1
.LC36:
	.ascii	"%s(): error reading sync ack rc=%d\012\000"
.LC37:
	.ascii	"%s(): sync_ack = 0x%08x\012\000"
	.space	3
.LC38:
	.ascii	"Ping\000"
	.space	3
.LC39:
	.ascii	"%s=0x%08x\012\000"
	.space	1
.LC40:
	.ascii	"Voice Sense Status\000"
	.space	1
.LC41:
	.ascii	"%s=0x%04x\012\000"
	.space	1
.LC42:
	.ascii	"%s(): rate=%ld\012\000"
.LC43:
	.ascii	"rate=%ld\012\000"
	.space	2
.LC44:
	.ascii	"%s(): route=%ld\012\000"
	.space	3
.LC45:
	.ascii	"route=%ld\012\000"
	.space	1
.LC46:
	.ascii	"%s(): invalid buf length\012\000"
	.space	2
.LC47:
	.ascii	"%s\000"
	.space	1
.LC48:
	.ascii	"<6>%s : [ES705] net path = %s\012\000"
	.space	1
.LC49:
	.ascii	"<6>%s : [ES705] cannot find /\012\000"
	.space	1
.LC50:
	.ascii	"<6>%s : [ES705] keyword_net_final_path = %s\012\000"
	.space	3
.LC51:
	.ascii	"%s(): request_firmware(%s) failed %d\012\000"
	.space	2
.LC52:
	.ascii	"<6>%s : [ES705] grammar path = %s\012\000"
	.space	1
.LC53:
	.ascii	"<6>%s : [ES705] keyword_grammar_final_path = %s\012"
	.ascii	"\000"
	.space	3
.LC54:
	.ascii	"<7>Error registering Audience eS705 driver: %d\012\000"
.LC55:
	.ascii	"<3>failed to initialize char device = %d\012\000"
	.space	2
.LC56:
	.ascii	"%s(): keyword param block set size = %zi\012\000"
	.space	2
.LC57:
	.ascii	"%s(): keyword param block too big = %zi\012\000"
	.space	3
.LC58:
	.ascii	"%s(): keyword param size=%hu\012\000"
	.space	2
.LC59:
	.ascii	"%s(): keyword param not set\012\000"
	.space	3
.LC60:
	.ascii	"/etc/filter.bin\000"
.LC61:
	.ascii	"%s:Error (%d) Opening file %s\000"
	.space	2
.LC62:
	.ascii	"%s : file read error\012\000"
	.space	2
.LC63:
	.ascii	"%s : Success to change the values (%d): 0x%x\000"
	.space	3
.LC64:
	.ascii	"%s : Current filter values (%d): \000"
	.space	2
.LC65:
	.ascii	"0x%02x \000"
.LC66:
	.ascii	"%s : All filter values (%d): \000"
	.space	2
.LC67:
	.ascii	"%s : enter the value again\012\000"
.LC68:
	.ascii	"%s(): BWE = %d\012\000"
.LC69:
	.ascii	"%s(): can't bwe on/off, pm_state(%d)\012\000"
	.space	2
.LC70:
	.ascii	"%s(): Avoid duplication value (%d)\012\000"
.LC71:
	.ascii	"%s(): WideBand does not need BWE feature\012\000"
	.space	2
.LC72:
	.ascii	"%s(): VEQ Preset = %d\012\000"
	.space	1
.LC73:
	.ascii	"%s(): es705 Sync FAIL\012\000"
	.space	1
.LC74:
	.ascii	"%s(): Set VS SBL Fail\000"
	.space	2
.LC75:
	.ascii	"%s(): VS Overlay Mode\000"
	.space	2
.LC76:
	.ascii	"%s(): fw download type %d begin\012\000"
	.space	3
.LC77:
	.ascii	"%s(): fw download start error\012\000"
	.space	1
.LC78:
	.ascii	"%s(): write firmware image\012\000"
.LC79:
	.ascii	"%s(): firmware image write error\012\000"
	.space	2
.LC80:
	.ascii	"%s() fw download finish error\012\000"
	.space	1
.LC81:
	.ascii	"%s(): fw download type %d done\012\000"
.LC82:
	.ascii	"%s(): FW download fail\012\000"
.LC83:
	.ascii	"%s(): Enable Event Intr fail\012\000"
	.space	2
.LC84:
	.ascii	"%s(): Skip to switch to vs mode\000"
.LC85:
	.ascii	"Route Status\000"
	.space	3
.LC86:
	.ascii	"%s(): start internal dump, mode=%d\012\000"
.LC87:
	.ascii	"%s(): msg = 0x%02x%02x%02x%02x\012\000"
.LC88:
	.ascii	"%s(): value = %d ucontrol = %ld\012\000"
	.space	3
.LC89:
	.ascii	"%s(): internal rate, %d, out of range\012\000"
	.space	1
.LC90:
	.ascii	"Audience fw ver %s\012\000"
.LC91:
	.ascii	"Audience is not awake\012\000"
	.space	1
.LC92:
	.ascii	"FW Version = %s\012\000"
	.space	3
.LC93:
	.ascii	"%s(): Enable Voice Sense Event to Host\012\000"
.LC94:
	.ascii	"%s(): Set Overlay mode\012\000"
.LC95:
	.ascii	"%s(): Set Overlay mode failed\012\000"
	.space	1
.LC96:
	.ascii	"%s(): After successful VOICESENSE download,Enable E"
	.ascii	"vent Intr to Host\012\000"
	.space	2
.LC97:
	.ascii	"%s(): Set Preset failed\012\000"
	.space	3
.LC98:
	.ascii	"%s(): ucontrol = %ld value = %d\012\000"
	.space	3
.LC99:
	.ascii	"%s(): RX_NS = %d\012\000"
	.space	2
.LC100:
	.ascii	"%s(): Avalon Wind Noise = %d\012\000"
	.space	2
.LC101:
	.ascii	"%s(): SW = %d\012\000"
	.space	1
.LC102:
	.ascii	"%s(): Virtual Bass Boost = %d\012\000"
	.space	1
.LC103:
	.ascii	"%s(): STS = %d\012\000"
.LC104:
	.ascii	"%s(): WNF = %d\012\000"
.LC105:
	.ascii	"%s(): new es705_internal_route = %ld is out of rang"
	.ascii	"e\012\000"
	.space	2
.LC106:
	.ascii	"%s() adjust wideband offset\012\000"
	.space	3
.LC107:
	.ascii	"%s() adjust narrowband offset\012\000"
	.space	1
.LC108:
	.ascii	"%s(): converts route_index = %ld to %ld and old num"
	.ascii	" is %ld\012\000"
.LC109:
	.ascii	"%s():network type = %ld pm_state = %d\012\000"
	.space	1
.LC110:
	.ascii	"%s(): skip to set voice_lpm_enable[%d->%ld]\012\000"
	.space	3
.LC111:
	.ascii	"%s(): lpm enable error\012\000"
.LC112:
	.ascii	"%s : put internal route = %ld\012\000"
	.space	1
.LC113:
	.ascii	"%s(): switch current es705_internal_route = %ld to "
	.ascii	"new route = %ld\012\000"
.LC114:
	.ascii	"%s(): RDB open fail\012\000"
	.space	3
.LC115:
	.ascii	"%s(): error sending request = %d\012\000"
	.space	2
.LC116:
	.ascii	"%s(): invalid read v-s data block size = 0x%08x\012"
	.ascii	"\000"
	.space	3
.LC117:
	.ascii	"%s(): resp=0x%08x size=%d\012\000"
	.space	1
.LC118:
	.ascii	"%s(): error reading data block\012\000"
.LC119:
	.ascii	"%s(): stored v-s read and saved of %d bytes\012\000"
	.space	3
.LC120:
	.ascii	"%s(): v-s read data block failure=%d\012\000"
	.space	2
.LC121:
	.ascii	"%s(): stored v-s keyword block of %d bytes\012\000"
.LC122:
	.ascii	"%s(): start\012\000"
	.space	3
.LC123:
	.ascii	"%s(): internal dump is failed rspn 0x%08x\012\000"
	.space	1
.LC124:
	.ascii	"%s(): internal dump is generated rspn 0x%08x\012\000"
	.space	2
.LC125:
	.ascii	"%s(): Memory allocation FAIL\012\000"
	.space	2
.LC126:
	.ascii	"/sdcard/vs_capture.bin\000"
	.space	1
.LC127:
	.ascii	"%s() : fail to open fp\012\000"
.LC128:
	.ascii	"%s(): pos %d write = %d bytes\012\000"
	.space	1
.LC129:
	.ascii	"%s(): attempt to write empty keyword data block\012"
	.ascii	"\000"
	.space	3
.LC130:
	.ascii	"%s(): error writing cmd 0x%08x to device\012\000"
	.space	2
.LC131:
	.ascii	"%s(): resp=0x%08x\012\000"
	.space	1
.LC132:
	.ascii	"%s(): invalid write data block 0x%08x\012\000"
	.space	1
.LC133:
	.ascii	"%s(): v-s wdb UART write error\012\000"
.LC134:
	.ascii	"%s(): v-s wdb %d bytes written\012\000"
.LC135:
	.ascii	"%s(): WDB ACK request fFAIL\012\000"
	.space	3
.LC136:
	.ascii	"%s(): write WDB FAIL. ACK=0x%08x\012\000"
	.space	2
.LC137:
	.ascii	"%s(): v-s WDB write over SLIMBus FAIL, offset=%hu\012"
	.ascii	"\000"
	.space	1
.LC138:
	.ascii	"%s(): WDB ACK request FAIL\012\000"
.LC139:
	.ascii	"%s(): v-s wdb success\012\000"
	.space	1
.LC140:
	.ascii	"%s(): v-s wdb failed ret=%d\012\000"
	.space	3
.LC141:
	.ascii	"%s(): kzalloc fail\012\000"
.LC142:
	.ascii	"<6>%s: size = %x\012\000"
	.space	2
.LC143:
	.ascii	"%s(): es705 CRC check fail\012\000"
.LC144:
	.ascii	"%s(): skip to set voice_wakeup_enable[%d->%ld]\012\000"
.LC145:
	.ascii	"higalaxy_en_us_gram6.bin\000"
	.space	3
.LC146:
	.ascii	"%s(): request default grammar\012\000"
	.space	1
.LC147:
	.ascii	"higalaxy_en_us_am.bin\000"
	.space	2
.LC148:
	.ascii	"%s(): request default net\012\000"
	.space	1
.LC149:
	.ascii	"%s(): ********* START VS Keyword Download\012\000"
	.space	1
.LC150:
	.ascii	"%s(): Skip to download VS Keyword\012\000"
	.space	1
.LC151:
	.ascii	"%s(): WDB UART open FAIL\012\000"
	.space	2
.LC152:
	.ascii	"%s(): es705 keyword download FAIL\012\000"
	.space	1
.LC153:
	.ascii	"%s(): ********* END VS Keyword Download\012\000"
	.space	3
.LC154:
	.ascii	"%s(): op=%d\012\000"
	.space	3
.LC155:
	.ascii	"%s(): keyword params put...\012\000"
	.space	3
.LC156:
	.ascii	"%s(): WDB UART close FAIL\012\000"
	.space	1
.LC157:
	.ascii	"%s(): keyword params get...\012\000"
	.space	3
.LC158:
	.ascii	"%s(): keyword params clear...\012\000"
	.space	1
.LC159:
	.ascii	"%s(): no response to command 0x%08x\012\000"
	.space	3
.LC160:
	.ascii	"%s(): STANDARD fw download error\012\000"
	.space	2
.LC161:
	.ascii	"%s(): START!\012\000"
	.space	2
.LC162:
	.ascii	"%s(): rc = %d\012\000"
	.space	1
.LC163:
	.ascii	"%s\012\000"
.LC164:
	.ascii	"%s(): send sync command failed rc = %d\012\000"
.LC165:
	.ascii	"%s(): cnt_restore_std_fw_in_sleep = %d\012\000"
.LC166:
	.ascii	"%s(): Reset Smooth Rate Fail\000"
	.space	3
.LC167:
	.ascii	"%s(): Route Status = 0x%04x\012\000"
	.space	3
.LC168:
	.ascii	"%s(): send sleep command failed rc = %d\012\000"
	.space	3
.LC169:
	.ascii	"%s: wait %dms for execution\012\000"
	.space	3
.LC170:
	.ascii	"%s(): external clock off\012\000"
	.space	2
.LC171:
	.ascii	"%s(): Exit\012\000"
.LC172:
	.ascii	"%s(): eS705 goes to sleep\012\000"
	.space	1
.LC173:
	.ascii	"%s %d active channels, ports_active: %d\012\000"
	.space	3
.LC174:
	.ascii	"%s(): no need to go to Normal Mode\012\000"
.LC175:
	.ascii	"%s(): external clock on\012\000"
	.space	3
.LC176:
	.ascii	"%s(): begin uart wakeup\012\000"
	.space	3
.LC177:
	.ascii	"%s(): cnt_restore_std_fw_in_wakeup = %d\012\000"
	.space	3
.LC178:
	.ascii	"%s(): es705 wakeup FAIL\012\000"
	.space	3
.LC179:
	.ascii	"%s(): wakeup success, SYNC response 0x%08x\012\000"
.LC180:
	.ascii	"vs_lowpwr\000"
	.space	2
.LC181:
	.ascii	"normal\000"
	.space	1
.LC182:
	.ascii	"vs_overlay\000"
	.space	1
.LC183:
	.ascii	"sleep\000"
	.space	2
.LC184:
	.ascii	"%s(): Previous power state = %s, power set cmd = %s"
	.ascii	"\012\000"
	.space	3
.LC185:
	.ascii	"%s(): Requested power set cmd = %s\012\000"
.LC186:
	.ascii	"%s(): Unsupported state in es705\012\000"
	.space	2
.LC187:
	.ascii	"%s(): ES705 is in sleep mode. Select the Normal Mod"
	.ascii	"e or Overlay if in Low Power mode.\012\000"
	.space	1
.LC188:
	.ascii	"%s(): Activate Sleep Request\012\000"
	.space	2
.LC189:
	.ascii	"%s internal es705_power_state = %d\012\000"
.LC190:
	.ascii	"%s(): Power state command write failed\012\000"
.LC191:
	.ascii	"%s(): OSC Measure Start fail\012\000"
	.space	2
.LC192:
	.ascii	"%s(): OSC Measure Read Status fail\012\000"
.LC193:
	.ascii	"%s(): OSC Measure Status = 0x%04x\012\000"
	.space	1
.LC194:
	.ascii	"%s(): Write cmd fail\012\000"
	.space	2
.LC195:
	.ascii	"%s(): ES705 should be in VS Overlaymode. Select the"
	.ascii	" VS Overlay Mode.\012\000"
	.space	2
.LC196:
	.ascii	"%s(): Current power state = %s, power set cmd = %s\012"
	.ascii	"\000"
.LC197:
	.ascii	"%s(): Activate Low Power Mode\012\000"
	.space	1
.LC198:
	.ascii	"%s(): Can't switch to Low Power Mode\012\000"
	.space	2
.LC199:
	.ascii	"%s(): eS705 waking up\012\000"
	.space	1
.LC200:
	.ascii	"%s(): entry pm state %d es705 state %d value %d\012"
	.ascii	"\000"
	.space	3
.LC201:
	.ascii	"%s(): Unsupported value in es705\012\000"
	.space	2
.LC202:
	.ascii	"%s(): es705_wakeup failed\012\000"
	.space	1
.LC203:
	.ascii	"%s(): Ready for VOICESENSE download by proxy\012\000"
	.space	2
.LC204:
	.ascii	"%s(): Unsupported pm state [%d] in es705\012\000"
	.space	2
.LC205:
	.ascii	"%s(): exit pm state %d es705 state %d value %d\012\000"
.LC206:
	.ascii	"%s(): fw download\012\000"
	.space	1
.LC207:
	.ascii	"%s(): bootup rc=%d\012\000"
.LC208:
	.ascii	"%s(): name = %s\012\000"
	.space	3
.LC209:
	.ascii	"%s(): rc = snd_soc_regsiter_codec() = %d\012\000"
	.space	2
.LC210:
	.ascii	"%s(): register_snd_soc rc=%d\012\000"
	.space	2
.LC211:
	.ascii	"%s(): release module\012\000"
	.space	2
.LC212:
	.ascii	"%s():dai->name = %s dai->id = %d\012\000"
	.space	2
.LC213:
	.ascii	"%s(): can't set veq block, pm_state(%d)\012\000"
	.space	3
.LC214:
	.ascii	"%s(): Invalid volume (%d)\012\000"
	.space	1
.LC215:
	.ascii	"%s(): veq off or avoid duplication value(%d)\012\000"
	.space	2
.LC216:
	.ascii	"%s(): write veq max gain cmd 0x%08x failed\012\000"
.LC217:
	.ascii	"%s(): write veq max gain 0x%08x to volume (%d)\012\000"
.LC218:
	.ascii	"%s(): write veq max gain 0x%08x failed\012\000"
.LC219:
	.ascii	"%s(): write veq estimate adj 0x%08x failed\012\000"
.LC220:
	.ascii	"%s(): write veq estimate adj 0x%08x to volume (%d)\012"
	.ascii	"\000"
.LC221:
	.ascii	"%s(): write veq coeff size 0x%08x\012\000"
	.space	1
.LC222:
	.ascii	"%s(): write veq coeff size 0x%08x failed\012\000"
	.space	2
.LC223:
	.ascii	"%s(): failed ret=%d\012\000"
	.space	3
.LC224:
	.ascii	"%s(): error writing veq coeff size, resp is 0x%08x\012"
	.ascii	"\000"
.LC225:
	.ascii	"%s(): error writing veq coeff block, resp is 0x%08x"
	.ascii	"\012\000"
	.space	3
.LC226:
	.ascii	"%s(): success\012\000"
	.space	1
.LC227:
	.ascii	"%s(): to %ld %d\012\000"
	.space	3
.LC228:
	.ascii	"%s(): es705_digital_ext_snd_controls failed\012\000"
	.space	3
.LC229:
	.ascii	"%s(): %s mode, Interrupt event\000"
	.space	1
.LC230:
	.ascii	"%s(): Get VS Status Fail\012\000"
	.space	2
.LC231:
	.ascii	"%s(): VS status 0x%04x\012\000"
.LC232:
	.ascii	"%s(): Generate VS keyword detected event to User sp"
	.ascii	"ace\012\000"
.LC233:
	.ascii	"%s(): VS keyword detected\012\000"
	.space	1
.LC234:
	.ascii	"%s(): pdata is NULL\000"
.LC235:
	.ascii	"&es705_priv.api_mutex\000"
	.space	2
.LC236:
	.ascii	"&es705_priv.pm_mutex\000"
	.space	3
.LC237:
	.ascii	"&es705_priv.streaming_mutex\000"
.LC238:
	.ascii	"&es705_priv.stream_in_q\000"
.LC239:
	.ascii	"%s(): failed to create core sysfs entries: %d\012\000"
	.space	1
.LC240:
	.ascii	"audience-es705-fw.bin\000"
	.space	2
.LC241:
	.ascii	"audience-es705-vs.bin\000"
	.space	2
.LC242:
	.ascii	"%s(): exit with error\012\000"
	.space	1
.LC243:
	.ascii	"ES705 RX1 Enable\000"
	.space	3
.LC244:
	.ascii	"ES705 TX1 Enable\000"
	.space	3
.LC245:
	.ascii	"ES705 RX2 Enable\000"
	.space	3
.LC246:
	.ascii	"Mic Config\000"
	.space	1
.LC247:
	.ascii	"AEC Mode\000"
	.space	3
.LC248:
	.ascii	"VEQ Enable\000"
	.space	1
.LC249:
	.ascii	"Dereverb Enable\000"
.LC250:
	.ascii	"Dereverb Gain\000"
	.space	2
.LC251:
	.ascii	"BWE Enable\000"
	.space	1
.LC252:
	.ascii	"BWE High Band Gain\000"
	.space	1
.LC253:
	.ascii	"BWE Max SNR\000"
.LC254:
	.ascii	"BWE Post EQ Enable\000"
	.space	1
.LC255:
	.ascii	"SLIMbus Link Multi Channel\000"
	.space	1
.LC256:
	.ascii	"Set Power State\000"
.LC257:
	.ascii	"Algorithm Processing\000"
	.space	3
.LC258:
	.ascii	"Algorithm Sample Rate\000"
	.space	2
.LC259:
	.ascii	"Algorithm\000"
	.space	2
.LC260:
	.ascii	"Mix Sample Rate\000"
.LC261:
	.ascii	"Internal Route\000"
	.space	1
.LC262:
	.ascii	"Internal Rate\000"
	.space	2
.LC263:
	.ascii	"Preset\000"
	.space	1
.LC264:
	.ascii	"Audio Custom Profile\000"
	.space	3
.LC265:
	.ascii	"ES705-AP Tx Channels\000"
	.space	3
.LC266:
	.ascii	"Voice Sense Enable\000"
	.space	1
.LC267:
	.ascii	"Voice Sense Set Wakeup Word\000"
.LC268:
	.ascii	"Voice Sense Training Mode\000"
	.space	2
.LC269:
	.ascii	"Voice Sense Training Status\000"
.LC270:
	.ascii	"Voice Sense Training Record\000"
.LC271:
	.ascii	"Voice Sense Stored Keyword\000"
	.space	1
.LC272:
	.ascii	"Voice Sense Detect Sensitivity\000"
	.space	1
.LC273:
	.ascii	"Voice Activity Detect Sensitivity\000"
	.space	2
.LC274:
	.ascii	"ES705 Power State\000"
	.space	2
.LC275:
	.ascii	"Noise Suppression\000"
	.space	2
.LC276:
	.ascii	"Audio Zoom\000"
	.space	1
.LC277:
	.ascii	"Enable/Disable Streaming PATH/Endpoint\000"
	.space	1
.LC278:
	.ascii	"RX Enable\000"
	.space	2
.LC279:
	.ascii	"Stereo Widening\000"
.LC280:
	.ascii	"Speech Time Stretching\000"
	.space	1
.LC281:
	.ascii	"RX Noise Suppression\000"
	.space	3
.LC282:
	.ascii	"Wind Noise Filter\000"
	.space	2
.LC283:
	.ascii	"BWE Preset\000"
	.space	1
.LC284:
	.ascii	"AVALON Wind Noise\000"
	.space	2
.LC285:
	.ascii	"Virtual Bass Boost\000"
	.space	1
.LC286:
	.ascii	"UART FW Download Rate\000"
	.space	2
.LC287:
	.ascii	"Voice Sense Stream Enable\000"
	.space	2
.LC288:
	.ascii	"ES705 Reroute\000"
	.space	2
.LC289:
	.ascii	"ES705 Voice Wakeup Enable\000"
	.space	2
.LC290:
	.ascii	"ES705 VS Abort\000"
	.space	1
.LC291:
	.ascii	"ES705 VS Make Internal Dump\000"
.LC292:
	.ascii	"ES705 VS Make External Dump\000"
.LC293:
	.ascii	"ES705 Voice LPM Enable\000"
	.space	1
.LC294:
	.ascii	"Internal Route Config\000"
	.space	2
.LC295:
	.ascii	"Current Network Type\000"
	.space	3
.LC296:
	.ascii	"Detect builtin keyword\000"
	.space	1
.LC297:
	.ascii	"Train keyword\000"
	.space	2
.LC298:
	.ascii	"Detect user keyword\000"
.LC299:
	.ascii	"Put\000"
.LC300:
	.ascii	"Get\000"
.LC301:
	.ascii	"Clear\000"
	.space	2
.LC302:
	.ascii	"Stop\000"
	.space	3
.LC303:
	.ascii	"Start\000"
	.space	2
.LC304:
	.ascii	"Training\000"
	.space	3
.LC305:
	.ascii	"Done\000"
	.space	3
.LC306:
	.ascii	"No Event\000"
	.space	3
.LC307:
	.ascii	"Codec Event\000"
.LC308:
	.ascii	"VS Keyword Event\000"
	.space	3
.LC309:
	.ascii	"Default\000"
.LC310:
	.ascii	"One\000"
.LC311:
	.ascii	"Two\000"
.LC312:
	.ascii	"Three\000"
	.space	2
.LC313:
	.ascii	"Four\000"
	.space	3
.LC314:
	.ascii	"Sleep\000"
	.space	2
.LC315:
	.ascii	"Active\000"
	.space	1
.LC316:
	.ascii	"disabled\000"
	.space	3
.LC317:
	.ascii	"Narrator\000"
	.space	3
.LC318:
	.ascii	"Scene\000"
	.space	2
.LC319:
	.ascii	"Narration\000"
	.space	2
.LC320:
	.ascii	"Off\000"
.LC321:
	.ascii	"On\000"
	.space	1
.LC322:
	.ascii	"None\000"
	.space	3
.LC323:
	.ascii	"VP\000"
	.space	1
.LC324:
	.ascii	"Two CHREC\000"
	.space	2
.LC325:
	.ascii	"AUDIO\000"
	.space	2
.LC326:
	.ascii	"Four CHPASS\000"
.LC327:
	.ascii	"NB\000"
	.space	1
.LC328:
	.ascii	"WB\000"
	.space	1
.LC329:
	.ascii	"SWB\000"
.LC330:
	.ascii	"FB\000"
	.space	1
.LC331:
	.ascii	"fs=8khz\000"
.LC332:
	.ascii	"fs=16khz\000"
	.space	3
.LC333:
	.ascii	"fs=24khz\000"
	.space	3
.LC334:
	.ascii	"fs=48khz\000"
	.space	3
.LC335:
	.ascii	"fs=96khz\000"
	.space	3
.LC336:
	.ascii	"fs=192khz\000"
	.space	2
.LC337:
	.ascii	"rsvrd2\000"
	.space	1
.LC338:
	.ascii	"rsvrd3\000"
	.space	1
.LC339:
	.ascii	"rsvrd4\000"
	.space	1
.LC340:
	.ascii	"On half-duplex\000"
	.space	1
.LC341:
	.ascii	"CT 2-mic\000"
	.space	3
.LC342:
	.ascii	"FT 2-mic\000"
	.space	3
.LC343:
	.ascii	"DV 1-mic\000"
	.space	3
.LC344:
	.ascii	"EXT 1-mic\000"
	.space	2
.LC345:
	.ascii	"BT 1-mic\000"
	.space	3
.LC346:
	.ascii	"CT ASR 2-mic\000"
	.space	3
.LC347:
	.ascii	"FT ASR 2-mic\000"
	.space	3
.LC348:
	.ascii	"EXT ASR 1-mic\000"
	.space	2
.LC349:
	.ascii	"FT ASR 1-mic\000"
	.space	3
.LC350:
	.ascii	"MP_Sleep\000"
	.space	3
.LC351:
	.ascii	"MP_Cmd\000"
	.space	1
.LC352:
	.ascii	"Normal\000"
	.space	1
.LC353:
	.ascii	"Overlay\000"
.LC354:
	.ascii	"Low_Power\000"
	.space	2
.LC355:
	.ascii	"veq_adj\000"
.LC356:
	.ascii	"veq_max\000"
.LC357:
	.ascii	"veq_filter\000"
	.space	1
.LC358:
	.ascii	"preset_delay\000"
	.space	3
.LC359:
	.ascii	"sleep_delay\000"
.LC360:
	.ascii	"keyword_net_path\000"
	.space	3
.LC361:
	.ascii	"keyword_grammar_path\000"
	.space	3
.LC362:
	.ascii	"tuning\000"
	.space	1
.LC363:
	.ascii	"vs_event\000"
	.space	3
.LC364:
	.ascii	"overlay_mode\000"
	.space	3
.LC365:
	.ascii	"gpio_reset\000"
	.space	1
.LC366:
	.ascii	"ping_status\000"
.LC367:
	.ascii	"vs_status\000"
	.space	2
.LC368:
	.ascii	"vs_keyword_parameters\000"
	.space	2
.LC369:
	.ascii	"clock_on\000"
	.space	3
.LC370:
	.ascii	"fw_version\000"
	.space	1
.LC371:
	.ascii	"rate\000"
	.space	3
.LC372:
	.ascii	"route\000"
	.space	2
.LC373:
	.ascii	"route_status\000"
	.space	3
.LC374:
	.ascii	"es705-slim-rx1\000"
	.space	1
.LC375:
	.ascii	"SLIM_PORT-1 Playback\000"
	.space	3
.LC376:
	.ascii	"es705-slim-tx1\000"
	.space	1
.LC377:
	.ascii	"SLIM_PORT-1 Capture\000"
.LC378:
	.ascii	"es705-slim-rx2\000"
	.space	1
.LC379:
	.ascii	"SLIM_PORT-2 Playback\000"
	.space	3
.LC380:
	.ascii	"es705-slim-tx2\000"
	.space	1
.LC381:
	.ascii	"SLIM_PORT-2 Capture\000"
.LC382:
	.ascii	"es705-slim-rx3\000"
	.space	1
.LC383:
	.ascii	"SLIM_PORT-3 Playback\000"
	.space	3
.LC384:
	.ascii	"es705-slim-tx3\000"
	.space	1
.LC385:
	.ascii	"SLIM_PORT-3 Capture\000"
.LC386:
	.ascii	"es705-porta\000"
.LC387:
	.ascii	"PORTA Capture\000"
	.space	2
.LC388:
	.ascii	"PORTA Playback\000"
	.space	1
.LC389:
	.ascii	"es705-portb\000"
.LC390:
	.ascii	"PORTB Capture\000"
	.space	2
.LC391:
	.ascii	"PORTB Playback\000"
	.space	1
.LC392:
	.ascii	"es705-portc\000"
.LC393:
	.ascii	"PORTC Capture\000"
	.space	2
.LC394:
	.ascii	"PORTC Playback\000"
	.space	1
.LC395:
	.ascii	"es705-portd\000"
.LC396:
	.ascii	"PORTD Capture\000"
	.space	2
.LC397:
	.ascii	"PORTD Playback\000"
	.space	1
.LC398:
	.ascii	"SBL\000"
.LC399:
	.ascii	"STANDARD\000"
	.space	3
.LC400:
	.ascii	"VOICESENSE\000"
	.space	1
.LC401:
	.ascii	"not defined\000"
.LC402:
	.ascii	"mp_sleep\000"
	.space	3
.LC403:
	.ascii	"mp_cmd\000"
	.space	1
.LC404:
	.ascii	"boot\000"
	.space	3
.LC405:
	.ascii	"sleep pending\000"
	.space	2
.LC406:
	.ascii	"awake\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
