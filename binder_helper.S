
output/drivers/staging/android/binder_helper.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <binder32_write>:
   0:	e3520004 	cmp	r2, #4
   4:	8a000028 	bhi	ac <binder32_write+0xac>
   8:	e52d4008 	str	r4, [sp, #-8]!
   c:	e1a0300d 	mov	r3, sp
  10:	e1a04002 	mov	r4, r2
  14:	e3c33d7f 	bic	r3, r3, #8128	; 0x1fc0
  18:	e58de004 	str	lr, [sp, #4]
  1c:	e3c3303f 	bic	r3, r3, #63	; 0x3f
  20:	e5933008 	ldr	r3, [r3, #8]
  24:	e091c002 	adds	ip, r1, r2
  28:	30dcc003 	sbcscc	ip, ip, r3
  2c:	33a03000 	movcc	r3, #0
  30:	e3530000 	cmp	r3, #0
  34:	0a000012 	beq	84 <binder32_write+0x84>
  38:	e3520000 	cmp	r2, #0
  3c:	1a000008 	bne	64 <binder32_write+0x64>
  40:	e3003000 	movw	r3, #0
  44:	e3403000 	movt	r3, #0
  48:	e5d32000 	ldrb	r2, [r3]
  4c:	e3520031 	cmp	r2, #49	; 0x31
  50:	0a000011 	beq	9c <binder32_write+0x9c>
  54:	e1a00004 	mov	r0, r4
  58:	e59d4000 	ldr	r4, [sp]
  5c:	e28dd004 	add	sp, sp, #4
  60:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
  64:	e3000000 	movw	r0, #0
  68:	e1a01002 	mov	r1, r2
  6c:	e3400000 	movt	r0, #0
  70:	ebfffffe 	bl	0 <__memzero>
  74:	e59d4000 	ldr	r4, [sp]
  78:	e28dd004 	add	sp, sp, #4
  7c:	e3e0000d 	mvn	r0, #13
  80:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
  84:	e3000000 	movw	r0, #0
  88:	e3400000 	movt	r0, #0
  8c:	ebfffffe 	bl	0 <__copy_from_user>
  90:	e3500000 	cmp	r0, #0
  94:	0affffe9 	beq	40 <binder32_write+0x40>
  98:	eafffff5 	b	74 <binder32_write+0x74>
  9c:	e3a02001 	mov	r2, #1
  a0:	e5832004 	str	r2, [r3, #4]
  a4:	ebfffffe 	bl	0 <binder32_init>
  a8:	eaffffe9 	b	54 <binder32_write+0x54>
  ac:	e3e0000d 	mvn	r0, #13
  b0:	e12fff1e 	bx	lr

000000b4 <binder_helper_init>:
  b4:	e16d40fc 	strd	r4, [sp, #-12]!
  b8:	e3a04000 	mov	r4, #0
  bc:	e3003000 	movw	r3, #0
  c0:	e58de008 	str	lr, [sp, #8]
  c4:	e24dd00c 	sub	sp, sp, #12
  c8:	e3000000 	movw	r0, #0
  cc:	e1a02004 	mov	r2, r4
  d0:	e3403000 	movt	r3, #0
  d4:	e3a01e1b 	mov	r1, #432	; 0x1b0
  d8:	e3400000 	movt	r0, #0
  dc:	e58d4000 	str	r4, [sp]
  e0:	ebfffffe 	bl	0 <proc_create_data>
  e4:	e59f2084 	ldr	r2, [pc, #132]	; 170 <binder_helper_init+0xbc>
  e8:	e3000000 	movw	r0, #0
  ec:	e3a03020 	mov	r3, #32
  f0:	e3400000 	movt	r0, #0
  f4:	e2821008 	add	r1, r2, #8
  f8:	ebfffffe 	bl	0 <call_usermodehelper_setup>
  fc:	e2505000 	subs	r5, r0, #0
 100:	0a000006 	beq	120 <binder_helper_init+0x6c>
 104:	e1a01004 	mov	r1, r4
 108:	e1a03004 	mov	r3, r4
 10c:	e1a02004 	mov	r2, r4
 110:	ebfffffe 	bl	0 <call_usermodehelper_setfns>
 114:	e1a01004 	mov	r1, r4
 118:	e1a00005 	mov	r0, r5
 11c:	ebfffffe 	bl	0 <call_usermodehelper_exec>
 120:	e59f2048 	ldr	r2, [pc, #72]	; 170 <binder_helper_init+0xbc>
 124:	e3000000 	movw	r0, #0
 128:	e3a03020 	mov	r3, #32
 12c:	e3400000 	movt	r0, #0
 130:	e2821014 	add	r1, r2, #20
 134:	ebfffffe 	bl	0 <call_usermodehelper_setup>
 138:	e2504000 	subs	r4, r0, #0
 13c:	0a000006 	beq	15c <binder_helper_init+0xa8>
 140:	e3a03000 	mov	r3, #0
 144:	e1a01003 	mov	r1, r3
 148:	e1a02003 	mov	r2, r3
 14c:	ebfffffe 	bl	0 <call_usermodehelper_setfns>
 150:	e1a00004 	mov	r0, r4
 154:	e3a01000 	mov	r1, #0
 158:	ebfffffe 	bl	0 <call_usermodehelper_exec>
 15c:	e3a00000 	mov	r0, #0
 160:	e28dd00c 	add	sp, sp, #12
 164:	e1cd40d0 	ldrd	r4, [sp]
 168:	e28dd008 	add	sp, sp, #8
 16c:	e49df004 	pop	{pc}		; (ldr pc, [sp], #4)
 170:	0000006c 	.word	0x0000006c

00000174 <use_binder32>:
 174:	e3003000 	movw	r3, #0
 178:	e3403000 	movt	r3, #0
 17c:	e5930004 	ldr	r0, [r3, #4]
 180:	e12fff1e 	bx	lr
