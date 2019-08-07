version_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, r2
	movw	r1, #:lower16:.LC1
	.save {r4, lr}
	str	r4, [sp, #-8]!
	movw	r2, #:lower16:.LC0
	movt	r1, #:upper16:.LC1
	str	lr, [sp, #4]
	movt	r2, #:upper16:.LC0
	bl	sprintf
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, #6
	ldr	pc, [sp], #4
	.fnend
	.size	version_show, .-version_show
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	debug_show, %function
debug_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movw	r1, #:lower16:.LC2
	movt	r3, #:upper16:.LANCHOR0
	mov	r0, r2
	movt	r1, #:upper16:.LC2
	ldr	r2, [r3]
	b	sprintf
	.fnend
	.size	debug_show, .-debug_show
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	speaker_volume_show, %function
speaker_volume_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	ip, #:lower16:.LANCHOR0
	movw	r1, #:lower16:.LC3
	movt	ip, #:upper16:.LANCHOR0
	mov	r0, r2
	movt	r1, #:upper16:.LC3
	ldr	r3, [ip, #4]
	ldr	r2, [ip, #8]
	b	sprintf
	.fnend
	.size	speaker_volume_show, .-speaker_volume_show
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	headphone_volume_show, %function
headphone_volume_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	ip, #:lower16:.LANCHOR0
	movw	r1, #:lower16:.LC3
	movt	ip, #:upper16:.LANCHOR0
	mov	r0, r2
	movt	r1, #:upper16:.LC3
	ldr	r3, [ip, #12]
	ldr	r2, [ip, #16]
	b	sprintf
	.fnend
	.size	headphone_volume_show, .-headphone_volume_show
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	boeffla_sound_show, %function
boeffla_sound_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movw	r1, #:lower16:.LC4
	movt	r3, #:upper16:.LANCHOR0
	mov	r0, r2
	movt	r1, #:upper16:.LC4
	ldr	r2, [r3, #20]
	b	sprintf
	.fnend
	.size	boeffla_sound_show, .-boeffla_sound_show
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	register_dump_show, %function
register_dump_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r0, #:lower16:.LC5
	strd	r4, [sp, #-24]!
	.save {r4, r5, r6, r7, r8, lr}
	movw	r1, #:lower16:.LC6
	movt	r0, #:upper16:.LC5
	strd	r6, [sp, #8]
	mov	r4, r2
	ldrh	ip, [r0, #12]
	movt	r1, #:upper16:.LC6
	str	r8, [sp, #16]
	str	lr, [sp, #20]
	ldr	r2, [r1]
	movw	r3, #:lower16:.LC7
	ldmib	r0, {r6, lr}
	movt	r3, #:upper16:.LC7
	movw	r5, #:lower16:.LANCHOR0
	ldr	r7, [r0]
	movt	r5, #:upper16:.LANCHOR0
	ldr	r0, [r3, #20]
	strh	ip, [r4, #12]	@ unaligned
	ldr	ip, [r1, #12]
	str	r6, [r4, #4]	@ unaligned
	str	lr, [r4, #8]	@ unaligned
	ldmib	r1, {r6, lr}
	ldr	r1, [r1, #16]
	str	r7, [r4]	@ unaligned
	ldr	r7, [r3]
	str	r2, [r4, #14]	@ unaligned
	str	ip, [r4, #26]	@ unaligned
	ldr	ip, [r3, #16]
	str	r6, [r4, #18]	@ unaligned
	str	lr, [r4, #22]	@ unaligned
	ldmib	r3, {r6, lr}
	str	r1, [r4, #30]	@ unaligned
	ldr	r1, [r3, #12]
	ldrb	r3, [r3, #24]	@ zero_extendqisi2
	str	r7, [r4, #34]	@ unaligned
	str	r6, [r4, #38]	@ unaligned
	str	lr, [r4, #42]	@ unaligned
	str	r1, [r4, #46]	@ unaligned
	movw	r1, #694
	str	ip, [r4, #50]	@ unaligned
	str	r0, [r4, #54]	@ unaligned
	ldr	r0, [r5, #24]
	strb	r3, [r4, #58]
	bl	taiko_read
	movw	r1, #:lower16:.LC8
	mov	r2, r0
	movt	r1, #:upper16:.LC8
	add	r0, r4, #58
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #702
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC9
	mov	r2, r0
	movt	r1, #:upper16:.LC9
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #710
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC10
	mov	r2, r0
	movt	r1, #:upper16:.LC10
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #718
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC11
	mov	r2, r0
	movt	r1, #:upper16:.LC11
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #726
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC12
	mov	r2, r0
	movt	r1, #:upper16:.LC12
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #734
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC13
	mov	r2, r0
	movt	r1, #:upper16:.LC13
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #742
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC14
	mov	r2, r0
	movt	r1, #:upper16:.LC14
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	movw	r3, #:lower16:.LC15
	add	r2, r4, r0
	movt	r3, #:upper16:.LC15
	mov	ip, r0
	ldm	r3, {r7, lr}
	add	r6, r0, #25
	movw	r1, #695
	ldr	r8, [r3, #8]
	add	r6, r4, r6
	ldr	r0, [r5, #24]
	str	r7, [r4, ip]	@ unaligned
	ldr	r7, [r3, #12]
	ldr	ip, [r3, #20]
	str	lr, [r2, #4]	@ unaligned
	ldr	lr, [r3, #16]
	str	r8, [r2, #8]	@ unaligned
	ldrh	r3, [r3, #24]
	str	r7, [r2, #12]	@ unaligned
	str	lr, [r2, #16]	@ unaligned
	str	ip, [r2, #20]	@ unaligned
	strh	r3, [r2, #24]	@ unaligned
	bl	taiko_read
	movw	r1, #:lower16:.LC16
	mov	r2, r0
	movt	r1, #:upper16:.LC16
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #703
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC17
	mov	r2, r0
	movt	r1, #:upper16:.LC17
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #711
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC18
	mov	r2, r0
	movt	r1, #:upper16:.LC18
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #719
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC19
	mov	r2, r0
	movt	r1, #:upper16:.LC19
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #727
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC20
	mov	r2, r0
	movt	r1, #:upper16:.LC20
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #735
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC21
	mov	r2, r0
	movt	r1, #:upper16:.LC21
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #743
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC22
	mov	r2, r0
	movt	r1, #:upper16:.LC22
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	movw	r3, #:lower16:.LC23
	mov	ip, r0
	movt	r3, #:upper16:.LC23
	add	r2, r4, r0
	ldr	r8, [r3]
	add	r6, r0, #16
	movw	r1, #545
	ldmib	r3, {r7, lr}
	add	r6, r4, r6
	ldr	r0, [r5, #24]
	str	r8, [r4, ip]	@ unaligned
	ldr	ip, [r3, #12]
	ldrb	r3, [r3, #16]	@ zero_extendqisi2
	str	r7, [r2, #4]	@ unaligned
	str	lr, [r2, #8]	@ unaligned
	str	ip, [r2, #12]	@ unaligned
	strb	r3, [r2, #16]
	bl	taiko_read
	movw	r1, #:lower16:.LC24
	mov	r2, r0
	movt	r1, #:upper16:.LC24
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #553
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC25
	mov	r2, r0
	movt	r1, #:upper16:.LC25
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #561
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC26
	mov	r2, r0
	movt	r1, #:upper16:.LC26
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #569
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC27
	mov	r2, r0
	movt	r1, #:upper16:.LC27
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #577
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC28
	mov	r2, r0
	movt	r1, #:upper16:.LC28
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #585
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC29
	mov	r2, r0
	movt	r1, #:upper16:.LC29
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #593
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC30
	mov	r2, r0
	movt	r1, #:upper16:.LC30
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #601
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC31
	mov	r2, r0
	movt	r1, #:upper16:.LC31
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #609
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC32
	mov	r2, r0
	movt	r1, #:upper16:.LC32
	mov	r0, r6
	bl	sprintf
	mov	r0, r4
	bl	strlen
	add	r6, r4, r0
	movw	r1, #617
	ldr	r0, [r5, #24]
	bl	taiko_read
	movw	r1, #:lower16:.LC33
	mov	r2, r0
	movt	r1, #:upper16:.LC33
	mov	r0, r6
	bl	sprintf
	ldrd	r6, [sp, #8]
	mov	r0, r4
	ldrd	r4, [sp]
	ldr	r8, [sp, #16]
	ldr	lr, [sp, #20]
	add	sp, sp, #24
	b	strlen
	.fnend
	.size	register_dump_show, .-register_dump_show
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	debug_store, %function
debug_store:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	movw	r1, #:lower16:.LC34
	mov	r0, r2
	str	lr, [sp, #4]
	.pad #8
	sub	sp, sp, #8
	movt	r1, #:upper16:.LC34
	add	r2, sp, #4
	mov	r4, r3
	bl	sscanf
	cmp	r0, #1
	bne	.L13
	ldr	r3, [sp, #4]
	cmp	r3, #1
	bhi	.L12
	movw	r2, #:lower16:.LANCHOR0
	movt	r2, #:upper16:.LANCHOR0
	str	r3, [r2]
.L12:
	mov	r0, r4
.L10:
	add	sp, sp, #8
	@ sp needed
	ldr	r4, [sp]
	add	sp, sp, #4
	ldr	pc, [sp], #4
.L13:
	mvn	r0, #21
	b	.L10
	.fnend
	.size	debug_store, .-debug_store
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	boeffla_sound_store, %function
boeffla_sound_store:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	movw	r1, #:lower16:.LC34
	mov	r0, r2
	str	lr, [sp, #8]
	.pad #12
	sub	sp, sp, #12
	movt	r1, #:upper16:.LC34
	add	r2, sp, #4
	mov	r4, r3
	bl	sscanf
	cmp	r0, #1
	bne	.L21
	ldr	r3, [sp, #4]
	cmp	r3, #1
	bls	.L32
.L18:
	mov	r0, r4
.L15:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L32:
	movw	r5, #:lower16:.LANCHOR0
	mov	r2, #0
	movt	r5, #:upper16:.LANCHOR0
	ldr	r1, [r5]
	str	r2, [r5, #4]
	str	r2, [r5, #8]
	str	r2, [r5, #12]
	cmp	r1, r2
	strd	r2, [r5, #16]
	bne	.L33
.L19:
	mov	r2, #0
	movw	r1, #695
	ldr	r0, [r5, #24]
	bl	taiko_write_no_hook
	mov	r2, #0
	movw	r1, #703
	ldr	r0, [r5, #24]
	bl	taiko_write_no_hook
	mvn	r2, #3
	movw	r1, #711
	ldr	r0, [r5, #24]
	bl	taiko_write_no_hook
	mvn	r2, #3
	movw	r1, #743
	ldr	r0, [r5, #24]
	bl	taiko_write_no_hook
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L18
	movw	r0, #:lower16:.LC36
	movt	r0, #:upper16:.LC36
	bl	printk
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L18
	movw	r0, #:lower16:.LC37
	ldr	r1, [r5, #20]
	movt	r0, #:upper16:.LC37
	bl	printk
	b	.L18
.L21:
	mvn	r0, #21
	b	.L15
.L33:
	movw	r0, #:lower16:.LC35
	movt	r0, #:upper16:.LC35
	bl	printk
	b	.L19
	.fnend
	.size	boeffla_sound_store, .-boeffla_sound_store
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	boeffla_sound_exit, %function
boeffla_sound_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movw	r1, #:lower16:.LANCHOR1
	.save {r4, lr}
	str	r4, [sp, #-8]!
	movt	r1, #:upper16:.LANCHOR1
	str	lr, [sp, #4]
	ldr	r0, [r1, #36]
	add	r0, r0, #8
	bl	sysfs_remove_group
	movw	r0, #:lower16:.LC38
	ldr	r4, [sp]
	ldr	lr, [sp, #4]
	movt	r0, #:upper16:.LC38
	add	sp, sp, #8
	b	printk
	.fnend
	.size	boeffla_sound_exit, .-boeffla_sound_exit
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	speaker_volume_store, %function
speaker_volume_store:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	str	lr, [sp, #8]
	.pad #12
	sub	sp, sp, #12
	ldr	r1, [r4, #20]
	cmp	r1, #0
	moveq	r0, r3
	bne	.L51
.L36:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L51:
	movw	r1, #:lower16:.LC39
	mov	r0, r2
	mov	r5, r3
	movt	r1, #:upper16:.LC39
	add	r3, sp, #4
	mov	r2, sp
	bl	sscanf
	cmp	r0, #2
	bne	.L46
	ldr	r3, [sp]
	cmp	r3, #30
	bgt	.L52
	cmn	r3, #30
	subge	r2, r3, #4
	bge	.L41
	mvn	r1, #29
	mvn	r2, #33
	mov	r3, r1
	str	r1, [sp]
.L41:
	ldr	r0, [sp, #4]
	cmp	r0, #30
	ble	.L43
.L54:
	mov	r1, #30
	mov	r0, r1
	str	r1, [sp, #4]
.L44:
	stmib	r4, {r0, r3}
	movw	r1, #711
	ldr	r0, [r4, #24]
	bl	taiko_write_no_hook
	ldr	r2, [r4, #4]
	movw	r1, #743
	ldr	r0, [r4, #24]
	sub	r2, r2, #4
	bl	taiko_write_no_hook
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L53
.L45:
	mov	r0, r5
	b	.L36
.L52:
	ldr	r0, [sp, #4]
	mov	r1, #30
	mov	r2, #26
	mov	r3, r1
	str	r1, [sp]
	cmp	r0, #30
	bgt	.L54
.L43:
	cmn	r0, #30
	bge	.L44
	mvn	r1, #29
	mov	r0, r1
	str	r1, [sp, #4]
	b	.L44
.L46:
	mvn	r0, #21
	b	.L36
.L53:
	movw	r0, #:lower16:.LC3
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #8]
	movt	r0, #:upper16:.LC3
	bl	printk
	b	.L45
	.fnend
	.size	speaker_volume_store, .-speaker_volume_store
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	headphone_volume_store, %function
headphone_volume_store:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	strd	r4, [sp, #-12]!
	.save {r4, r5, lr}
	movw	r4, #:lower16:.LANCHOR0
	movt	r4, #:upper16:.LANCHOR0
	str	lr, [sp, #8]
	.pad #12
	sub	sp, sp, #12
	ldr	r1, [r4, #20]
	cmp	r1, #0
	moveq	r0, r3
	bne	.L70
.L55:
	add	sp, sp, #12
	@ sp needed
	ldrd	r4, [sp]
	add	sp, sp, #8
	ldr	pc, [sp], #4
.L70:
	movw	r1, #:lower16:.LC39
	mov	r0, r2
	mov	r5, r3
	movt	r1, #:upper16:.LC39
	add	r3, sp, #4
	mov	r2, sp
	bl	sscanf
	cmp	r0, #2
	bne	.L65
	ldr	r3, [sp]
	cmp	r3, #30
	bgt	.L71
	cmn	r3, #30
	movge	r2, r3
	bge	.L60
	mvn	r1, #29
	mov	r2, r1
	mov	r3, r1
	str	r1, [sp]
.L60:
	ldr	r0, [sp, #4]
	cmp	r0, #30
	ble	.L62
.L73:
	mov	r1, #30
	mov	r0, r1
	str	r1, [sp, #4]
.L63:
	movw	r1, #695
	str	r0, [r4, #12]
	ldr	r0, [r4, #24]
	str	r3, [r4, #16]
	bl	taiko_write_no_hook
	movw	r1, #703
	ldr	r2, [r4, #12]
	ldr	r0, [r4, #24]
	bl	taiko_write_no_hook
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L72
.L64:
	mov	r0, r5
	b	.L55
.L71:
	ldr	r0, [sp, #4]
	mov	r3, #30
	mov	r2, r3
	str	r3, [sp]
	cmp	r0, #30
	bgt	.L73
.L62:
	cmn	r0, #30
	bge	.L63
	mvn	r1, #29
	mov	r0, r1
	str	r1, [sp, #4]
	b	.L63
.L65:
	mvn	r0, #21
	b	.L55
.L72:
	movw	r0, #:lower16:.LC3
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #16]
	movt	r0, #:upper16:.LC3
	bl	printk
	b	.L64
	.fnend
	.size	headphone_volume_store, .-headphone_volume_store
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	boeffla_sound_init, %function
boeffla_sound_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.save {r4, lr}
	str	r4, [sp, #-8]!
	movw	r4, #:lower16:.LANCHOR1
	movt	r4, #:upper16:.LANCHOR1
	str	lr, [sp, #4]
	add	r0, r4, #12
	bl	misc_register
	ldr	r0, [r4, #36]
	mov	r1, r4
	add	r0, r0, #8
	bl	sysfs_create_group
	cmp	r0, #0
	blt	.L78
	movw	r3, #:lower16:.LANCHOR0
	mov	r2, #0
	movt	r3, #:upper16:.LANCHOR0
	movw	r1, #:lower16:.LC0
	movw	r0, #:lower16:.LC41
	movt	r1, #:upper16:.LC0
	movt	r0, #:upper16:.LC41
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	bl	printk
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, #0
	ldr	pc, [sp], #4
.L78:
	movw	r0, #:lower16:.LC40
	movt	r0, #:upper16:.LC40
	bl	printk
	ldr	r4, [sp]
	add	sp, sp, #4
	mov	r0, #0
	ldr	pc, [sp], #4
	.fnend
	.size	boeffla_sound_init, .-boeffla_sound_init
	.align	2
	.global	boeffla_sound_hook_taiko_codec_probe
	.syntax unified
	.arm
	.fpu softvfp
	.type	boeffla_sound_hook_taiko_codec_probe, %function
boeffla_sound_hook_taiko_codec_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	movt	r3, #:upper16:.LANCHOR0
	str	r0, [r3, #24]
	movw	r0, #:lower16:.LC42
	movt	r0, #:upper16:.LC42
	b	printk
	.fnend
	.size	boeffla_sound_hook_taiko_codec_probe, .-boeffla_sound_hook_taiko_codec_probe
	.align	2
	.global	boeffla_sound_hook_taiko_write
	.syntax unified
	.arm
	.fpu softvfp
	.type	boeffla_sound_hook_taiko_write, %function
boeffla_sound_hook_taiko_write:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r3, #:lower16:.LANCHOR0
	mov	r2, r0
	movt	r3, #:upper16:.LANCHOR0
	ldr	r0, [r3, #20]
	cmp	r0, #0
	beq	.L81
	movw	r0, #703
	cmp	r2, r0
	beq	.L82
	cmp	r2, #704
	bcc	.L89
	movw	r0, #711
	cmp	r2, r0
	beq	.L84
	movw	r0, #743
	cmp	r2, r0
	ldreq	r1, [r3, #4]
.L81:
	mov	r0, r1
	bx	lr
.L89:
	movw	r0, #695
	cmp	r2, r0
	bne	.L81
.L82:
	ldr	r1, [r3, #16]
	mov	r0, r1
	bx	lr
.L84:
	ldr	r1, [r3, #8]
	mov	r0, r1
	bx	lr
	.fnend
	.size	boeffla_sound_hook_taiko_write, .-boeffla_sound_hook_taiko_write
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	boeffla_sound_control_group, %object
	.size	boeffla_sound_control_group, 12
boeffla_sound_control_group:
	.space	8
	.word	boeffla_sound_attributes
	.type	boeffla_sound_control_device, %object
	.size	boeffla_sound_control_device, 36
boeffla_sound_control_device:
	.word	255
	.word	.LC43
	.space	28
	.type	boeffla_sound_attributes, %object
	.size	boeffla_sound_attributes, 28
boeffla_sound_attributes:
	.word	dev_attr_boeffla_sound
	.word	dev_attr_headphone_volume
	.word	dev_attr_speaker_volume
	.word	dev_attr_debug
	.word	dev_attr_register_dump
	.word	dev_attr_version
	.word	0
	.type	dev_attr_version, %object
	.size	dev_attr_version, 16
dev_attr_version:
	.word	.LC44
	.short	438
	.space	2
	.word	version_show
	.word	0
	.type	dev_attr_register_dump, %object
	.size	dev_attr_register_dump, 16
dev_attr_register_dump:
	.word	.LC45
	.short	438
	.space	2
	.word	register_dump_show
	.word	0
	.type	dev_attr_debug, %object
	.size	dev_attr_debug, 16
dev_attr_debug:
	.word	.LC46
	.short	438
	.space	2
	.word	debug_show
	.word	debug_store
	.type	dev_attr_speaker_volume, %object
	.size	dev_attr_speaker_volume, 16
dev_attr_speaker_volume:
	.word	.LC47
	.short	438
	.space	2
	.word	speaker_volume_show
	.word	speaker_volume_store
	.type	dev_attr_headphone_volume, %object
	.size	dev_attr_headphone_volume, 16
dev_attr_headphone_volume:
	.word	.LC48
	.short	438
	.space	2
	.word	headphone_volume_show
	.word	headphone_volume_store
	.type	dev_attr_boeffla_sound, %object
	.size	dev_attr_boeffla_sound, 16
dev_attr_boeffla_sound:
	.word	.LC43
	.short	438
	.space	2
	.word	boeffla_sound_show
	.word	boeffla_sound_store
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	debug, %object
	.size	debug, 4
debug:
	.space	4
	.type	speaker_volume_r, %object
	.size	speaker_volume_r, 4
speaker_volume_r:
	.space	4
	.type	speaker_volume_l, %object
	.size	speaker_volume_l, 4
speaker_volume_l:
	.space	4
	.type	headphone_volume_r, %object
	.size	headphone_volume_r, 4
headphone_volume_r:
	.space	4
	.type	headphone_volume_l, %object
	.size	headphone_volume_l, 4
headphone_volume_l:
	.space	4
	.type	boeffla_sound, %object
	.size	boeffla_sound, 4
boeffla_sound:
	.space	4
	.type	codec, %object
	.size	codec, 4
codec:
	.space	4
	.section	.exitcall.exit,"aw",%progbits
	.align	2
	.type	__exitcall_boeffla_sound_exit, %object
	.size	__exitcall_boeffla_sound_exit, 4
__exitcall_boeffla_sound_exit:
	.word	boeffla_sound_exit
	.section	.initcall6.init,"aw",%progbits
	.align	2
	.type	__initcall_boeffla_sound_init6, %object
	.size	__initcall_boeffla_sound_init6, 4
__initcall_boeffla_sound_init6:
	.word	boeffla_sound_init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"1.0.0\000"
	.space	2
.LC1:
	.ascii	"%s\012\000"
.LC2:
	.ascii	"Debug status: %d\012\000"
	.space	2
.LC3:
	.ascii	"%d %d\012\000"
	.space	1
.LC4:
	.ascii	"Boeffla sound status: %d\012\000"
	.space	2
.LC5:
	.ascii	"Register dump\012\000"
	.space	1
.LC6:
	.ascii	"===================\012\000"
	.space	3
.LC7:
	.ascii	"** Output values bank 1\012\000"
	.space	3
.LC8:
	.ascii	"TAIKO_A_CDC_RX1_VOL_CTL_B1_CTL: %d\012\000"
.LC9:
	.ascii	"TAIKO_A_CDC_RX2_VOL_CTL_B1_CTL: %d\012\000"
.LC10:
	.ascii	"TAIKO_A_CDC_RX3_VOL_CTL_B1_CTL: %d\012\000"
.LC11:
	.ascii	"TAIKO_A_CDC_RX4_VOL_CTL_B1_CTL: %d\012\000"
.LC12:
	.ascii	"TAIKO_A_CDC_RX5_VOL_CTL_B1_CTL: %d\012\000"
.LC13:
	.ascii	"TAIKO_A_CDC_RX6_VOL_CTL_B1_CTL: %d\012\000"
.LC14:
	.ascii	"TAIKO_A_CDC_RX7_VOL_CTL_B1_CTL: %d\012\000"
.LC15:
	.ascii	"\012** Output values bank 2\012\000"
	.space	2
.LC16:
	.ascii	"TAIKO_A_CDC_RX1_VOL_CTL_B2_CTL: %d (head l)\012\000"
	.space	3
.LC17:
	.ascii	"TAIKO_A_CDC_RX2_VOL_CTL_B2_CTL: %d (head r)\012\000"
	.space	3
.LC18:
	.ascii	"TAIKO_A_CDC_RX3_VOL_CTL_B2_CTL: %d (speaker)\012\000"
	.space	2
.LC19:
	.ascii	"TAIKO_A_CDC_RX4_VOL_CTL_B2_CTL: %d (speaker)\012\000"
	.space	2
.LC20:
	.ascii	"TAIKO_A_CDC_RX5_VOL_CTL_B2_CTL: %d\012\000"
.LC21:
	.ascii	"TAIKO_A_CDC_RX6_VOL_CTL_B2_CTL: %d\012\000"
.LC22:
	.ascii	"TAIKO_A_CDC_RX7_VOL_CTL_B2_CTL: %d\012\000"
.LC23:
	.ascii	"\012** Input gains\012\000"
	.space	3
.LC24:
	.ascii	"TAIKO_A_CDC_TX1_VOL_CTL_GAIN: %d\012\000"
	.space	2
.LC25:
	.ascii	"TAIKO_A_CDC_TX2_VOL_CTL_GAIN: %d\012\000"
	.space	2
.LC26:
	.ascii	"TAIKO_A_CDC_TX3_VOL_CTL_GAIN: %d\012\000"
	.space	2
.LC27:
	.ascii	"TAIKO_A_CDC_TX4_VOL_CTL_GAIN: %d\012\000"
	.space	2
.LC28:
	.ascii	"TAIKO_A_CDC_TX5_VOL_CTL_GAIN: %d\012\000"
	.space	2
.LC29:
	.ascii	"TAIKO_A_CDC_TX6_VOL_CTL_GAIN: %d\012\000"
	.space	2
.LC30:
	.ascii	"TAIKO_A_CDC_TX7_VOL_CTL_GAIN: %d\012\000"
	.space	2
.LC31:
	.ascii	"TAIKO_A_CDC_TX8_VOL_CTL_GAIN: %d\012\000"
	.space	2
.LC32:
	.ascii	"TAIKO_A_CDC_TX9_VOL_CTL_GAIN: %d\012\000"
	.space	2
.LC33:
	.ascii	"TAIKO_A_CDC_TX10_VOL_CTL_GAIN: %d\012\000"
	.space	1
.LC34:
	.ascii	"%d\000"
	.space	1
.LC35:
	.ascii	"Boeffla-sound: boeffla sound reset done\012\000"
	.space	3
.LC36:
	.ascii	"Boeffla-sound: wcd9320 audio hub reset done\012\000"
	.space	3
.LC37:
	.ascii	"Boeffla-sound: status %d\012\000"
	.space	2
.LC38:
	.ascii	"Boeffla-sound: engine stopped\012\000"
	.space	1
.LC39:
	.ascii	"%d %d\000"
	.space	2
.LC40:
	.ascii	"Boeffla-sound: failed to create sys fs object.\012\000"
.LC41:
	.ascii	"Boeffla-sound: engine version %s started\012\000"
	.space	2
.LC42:
	.ascii	"Boeffla-sound: codec pointer received\012\000"
	.space	1
.LC43:
	.ascii	"boeffla_sound\000"
	.space	2
.LC44:
	.ascii	"version\000"
.LC45:
	.ascii	"register_dump\000"
	.space	2
.LC46:
	.ascii	"debug\000"
	.space	2
.LC47:
	.ascii	"speaker_volume\000"
	.space	1
.LC48:
	.ascii	"headphone_volume\000"
	.ident	"GCC: (Linaro GCC 7.4-2019.02) 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff0c2f8e1a2eed33b1edc85d4]"
	.section	.note.GNU-stack,"",%progbits
