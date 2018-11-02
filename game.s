	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #2
	mov	r4, #16
	mov	lr, #8
	mov	ip, #150
	mov	r0, #112
	mov	r1, #20
	ldr	r3, .L4
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #24]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r0, r1
	mov	fp, #20
	mov	r7, r1
	mov	r6, r1
	mov	lr, #2
	mvn	r9, #0
	mov	ip, #16
	mov	r8, #1
	ldr	r3, .L15
	ldr	r10, .L15+4
	b	.L9
.L14:
	cmp	r0, #3
	str	fp, [r3, #44]
	add	r7, r7, #20
	addle	r0, r0, #2
	movgt	r0, r2
.L8:
	add	r1, r1, #1
	cmp	r1, #25
	str	r7, [r3, #40]
	str	lr, [r3, #48]
	str	r9, [r3, #52]
	str	ip, [r3, #56]
	str	ip, [r3, #60]
	str	r8, [r3, #64]
	str	r0, [r3, #68]
	str	r6, [r3, #72]
	str	r6, [r3, #76]
	str	lr, [r3, #80]
	add	r3, r3, #44
	beq	.L13
.L9:
	smull	r4, r5, r1, r10
	asr	r2, r1, #31
	rsb	r2, r2, r5, asr #1
	add	r2, r2, r2, lsl #2
	subs	r2, r1, r2
	beq	.L14
	ldr	r2, [r3]
	add	r2, r2, #31
	str	r2, [r3, #44]
	b	.L8
.L13:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	enemies-40
	.word	1717986919
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #16
	mov	lr, #8
	mov	r2, #2
	mov	ip, #150
	mov	r0, #112
	mov	r1, #20
	ldr	r3, .L19
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	pop	{r4, lr}
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #24]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	b	initEnemies
.L20:
	.align	2
.L19:
	.word	player
	.size	initGame, .-initGame
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	ldr	r0, .L28
	ldr	r3, [r0]
	ldr	r1, .L28+4
	orr	r3, r3, #16384
	push	{r4, r5, lr}
	strh	r3, [r1]	@ movhi
	ldr	r3, .L28+8
	ldr	r0, [r0, #4]
	add	lr, r3, #1088
	mov	r2, r1
	mov	r4, #512
	strh	r0, [r1, #2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	add	lr, lr, #12
	b	.L24
.L23:
	add	r3, r3, #44
	cmp	r3, lr
	add	r2, r2, #8
	beq	.L27
.L24:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	strheq	r4, [r2, #48]	@ movhi
	beq	.L23
	ldr	ip, [r3, #36]
	ldr	r0, [r3, #28]
	ldr	r1, [r3, #4]
	ldr	r5, [r3]
	add	ip, ip, #1
	add	r3, r3, #44
	add	r0, r0, ip, lsl #6
	orr	r1, r1, #16384
	cmp	r3, lr
	strh	r0, [r2, #52]	@ movhi
	strh	r1, [r2, #50]	@ movhi
	strh	r5, [r2, #48]	@ movhi
	add	r2, r2, #8
	bne	.L24
.L27:
	pop	{r4, r5, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	player
	.word	shadowOAM
	.word	enemies
	.size	drawGame, .-drawGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	ldr	r3, .L31
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L31+4
	orr	r2, r2, #16384
	strh	r2, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L32:
	.align	2
.L31:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bne	.L40
	mov	r2, #512
	ldr	r3, .L41
	lsl	r1, r1, #3
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L40:
	push	{r4, lr}
	ldr	ip, [r0, #36]
	ldr	r2, [r0, #4]
	ldr	lr, .L41
	ldr	r3, [r0, #28]
	ldr	r4, [r0]
	lsl	r1, r1, #3
	add	r0, ip, #1
	add	r3, r3, r0, lsl #6
	orr	r2, r2, #16384
	add	r0, lr, r1
	strh	r4, [lr, r1]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	shadowOAM
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L46
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L44
	ldr	r2, .L46+4
	ldr	r1, [r2, #4]
	ldr	r3, [r2, #16]
	add	r3, r1, r3
	cmp	r3, #237
	addle	r1, r1, #1
	strle	r1, [r2, #4]
.L44:
	ldr	r3, .L46
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bxne	lr
	ldr	r2, .L46+4
	ldr	r3, [r2, #4]
	cmp	r3, #2
	subgt	r3, r3, #1
	strgt	r3, [r2, #4]
	bx	lr
.L47:
	.align	2
.L46:
	.word	67109120
	.word	player
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #32]
	ldr	r3, .L56
	push	{r4, r5, lr}
	smull	r4, r5, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r5, asr #3
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #2
	bne	.L49
	ldr	r1, [r0, #40]
	ldr	ip, [r0, #36]
	sub	r1, r1, #1
	cmp	ip, r1
	addlt	ip, ip, #1
	strlt	ip, [r0, #36]
	strge	r3, [r0, #36]
.L49:
	ldr	r3, .L56+4
	add	r2, r2, #1
	add	lr, r3, #1088
	str	r2, [r0, #32]
	ldr	r1, [r0, #12]
	add	lr, lr, #12
.L53:
	ldr	r2, [r3, #4]
	cmp	r2, #0
	ble	.L51
	ldr	ip, [r3, #16]
	add	r2, r2, ip
	cmp	r2, #239
	ble	.L52
.L51:
	ldr	r2, [r0]
	ldr	ip, [r0, #8]
	rsb	r1, r1, #0
	add	r2, r2, ip
	str	r1, [r0, #12]
	str	r2, [r0]
.L52:
	add	r3, r3, #44
	cmp	r3, lr
	bne	.L53
	ldr	r3, [r0, #4]
	add	r1, r3, r1
	str	r1, [r0, #4]
	pop	{r4, r5, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	1717986919
	.word	enemies
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r4, .L62
	add	r5, r4, #1088
	add	r5, r5, #12
.L59:
	mov	r0, r4
	add	r4, r4, #44
	bl	updateEnemy
	cmp	r4, r5
	bne	.L59
	pop	{r4, r5, r6, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	enemies
	.size	updateGame, .-updateGame
	.comm	shadowOAM,1024,4
	.comm	enemies,1100,4
	.comm	player,28,4
	.comm	lives,4,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
