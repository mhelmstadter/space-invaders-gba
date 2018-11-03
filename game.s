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
	mov	r2, #2
	mov	lr, #16
	mov	ip, #150
	mov	r0, #112
	mov	r1, #20
	mov	r4, #8
	ldr	r3, .L21
	str	lr, [r3, #16]
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #24]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r4, [r3, #20]
	bl	initEnemies
	mov	r2, r4
	mvn	lr, #7
	mov	r1, #0
	mvn	ip, #1
	ldr	r3, .L21+4
	add	r0, r3, #140
.L18:
	str	r2, [r3, #16]
	str	r2, [r3, #12]
	str	lr, [r3]
	str	r1, [r3, #20]
	stmib	r3, {r1, ip}
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L18
	mov	r0, #5
	mov	r2, #25
	ldr	r1, .L21+8
	ldr	r3, .L21+12
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	player
	.word	playerBullets
	.word	lives
	.word	kills
	.size	initGame, .-initGame
	.align	2
	.global	initPlayerBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayerBullets, %function
initPlayerBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r1, #8
	mvn	lr, #7
	mov	r2, #0
	mvn	ip, #1
	ldr	r3, .L27
	add	r0, r3, #140
.L24:
	str	r1, [r3, #16]
	str	r1, [r3, #12]
	str	lr, [r3]
	str	r2, [r3, #20]
	stmib	r3, {r2, ip}
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L24
	ldr	lr, [sp], #4
	bx	lr
.L28:
	.align	2
.L27:
	.word	playerBullets
	.size	initPlayerBullets, .-initPlayerBullets
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
	ldr	r0, .L40
	ldr	r3, [r0]
	ldr	r1, .L40+4
	orr	r3, r3, #16384
	push	{r4, r5, r6, lr}
	strh	r3, [r1]	@ movhi
	ldr	r3, .L40+8
	ldr	r0, [r0, #4]
	add	lr, r3, #1088
	mov	r4, r1
	mov	r2, r1
	mov	r5, #512
	strh	r0, [r1, #2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	add	lr, lr, #12
	b	.L32
.L31:
	add	r3, r3, #44
	cmp	r3, lr
	add	r2, r2, #8
	beq	.L39
.L32:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	strheq	r5, [r2, #48]	@ movhi
	beq	.L31
	ldr	ip, [r3, #36]
	ldr	r0, [r3, #28]
	ldr	r1, [r3, #4]
	ldr	r6, [r3]
	add	ip, ip, #1
	add	r3, r3, #44
	add	r0, r0, ip, lsl #6
	orr	r1, r1, #16384
	cmp	r3, lr
	strh	r0, [r2, #52]	@ movhi
	strh	r1, [r2, #50]	@ movhi
	strh	r6, [r2, #48]	@ movhi
	add	r2, r2, #8
	bne	.L32
.L39:
	mov	r0, #512
	mov	lr, #4
	ldr	r3, .L40+12
	add	r1, r3, #140
.L35:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ldrne	ip, [r3]
	ldrne	r2, [r3, #4]
	add	r3, r3, #28
	strhne	lr, [r4, #12]	@ movhi
	strhne	ip, [r4, #8]	@ movhi
	strhne	r2, [r4, #10]	@ movhi
	strheq	r0, [r4, #8]	@ movhi
	cmp	r3, r1
	add	r4, r4, #8
	bne	.L35
	pop	{r4, r5, r6, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	player
	.word	shadowOAM
	.word	enemies
	.word	playerBullets
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
	ldr	r3, .L43
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	r3, .L43+4
	orr	r2, r2, #16384
	strh	r2, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L44:
	.align	2
.L43:
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
	bne	.L52
	mov	r2, #512
	ldr	r3, .L53
	lsl	r1, r1, #3
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L52:
	push	{r4, lr}
	ldr	ip, [r0, #36]
	ldr	r2, [r0, #4]
	ldr	lr, .L53
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
.L54:
	.align	2
.L53:
	.word	shadowOAM
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bne	.L62
	mov	r2, #512
	ldr	r3, .L63
	lsl	r1, r1, #3
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L62:
	mov	ip, #4
	ldr	r2, .L63
	str	lr, [sp, #-4]!
	lsl	r1, r1, #3
	ldr	lr, [r0]
	ldr	r0, [r0, #4]
	add	r3, r2, r1
	strh	lr, [r2, r1]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L64:
	.align	2
.L63:
	.word	shadowOAM
	.size	drawBullet, .-drawBullet
	.align	2
	.global	shoot
	.syntax unified
	.arm
	.fpu softvfp
	.type	shoot, %function
shoot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L76
	mov	r2, r0
	ldr	r1, [r2, #20]
	cmp	r1, #0
	mov	r3, #0
	beq	.L75
.L66:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #28
	bxeq	lr
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L66
.L75:
	push	{r4, r5, r6, lr}
	mov	r4, #1
	ldr	r5, .L76+4
	rsb	r3, r3, r3, lsl #3
	ldr	r2, [r5, #16]
	lsl	r3, r3, #2
	add	lr, r0, r3
	add	ip, r2, r2, lsr #31
	ldr	r2, [lr, #12]
	add	r1, r2, r2, lsr #31
	ldr	r2, [r5, #4]
	add	r2, r2, ip, asr r4
	ldr	r6, [r5]
	add	r2, r2, r1, asr r4
	sub	r2, r2, #7
	str	r6, [r0, r3]
	str	r2, [lr, #4]
	str	r4, [lr, #20]
	pop	{r4, r5, r6, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	playerBullets
	.word	player
	.size	shoot, .-shoot
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
	ldr	r3, .L90
	ldrh	r3, [r3, #48]
	tst	r3, #16
	push	{r4, lr}
	ldr	r4, .L90+4
	bne	.L79
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #16]
	add	r3, r2, r3
	cmp	r3, #237
	addle	r2, r2, #1
	strle	r2, [r4, #4]
.L79:
	ldr	r3, .L90
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L80
	ldr	r3, [r4, #4]
	cmp	r3, #2
	subgt	r3, r3, #1
	strgt	r3, [r4, #4]
.L80:
	ldr	r3, .L90+8
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r4, #24]
	beq	.L89
	ldr	r2, .L90+12
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L89
	cmp	r3, #19
	bgt	.L84
.L89:
	add	r3, r3, #1
	str	r3, [r4, #24]
	pop	{r4, lr}
	bx	lr
.L84:
	bl	shoot
	mov	r3, #1
	str	r3, [r4, #24]
	pop	{r4, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
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
	ldr	r3, .L112
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, r0
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #2
	sub	sp, sp, #16
	bne	.L93
	add	r0, r4, #36
	ldm	r0, {r0, r1}
	sub	r1, r1, #1
	cmp	r0, r1
	addlt	r0, r0, #1
	strlt	r0, [r4, #36]
	strge	r3, [r4, #36]
.L93:
	ldr	r3, .L112+4
	add	r2, r2, #1
	add	ip, r3, #1088
	str	r2, [r4, #32]
	ldr	r1, [r4, #12]
	ldr	lr, [r4]
	add	ip, ip, #12
.L97:
	ldr	r2, [r3, #4]
	cmp	r2, #0
	ble	.L95
	ldr	r0, [r3, #16]
	add	r2, r2, r0
	cmp	r2, #239
	ble	.L96
.L95:
	ldr	r2, [r4, #8]
	rsb	r1, r1, #0
	add	lr, lr, r2
	str	r1, [r4, #12]
	str	lr, [r4]
.L96:
	add	r3, r3, #44
	cmp	r3, ip
	bne	.L97
	mov	r8, #0
	ldr	ip, [r4, #4]
	ldr	r5, .L112+8
	add	ip, r1, ip
	str	ip, [r4, #4]
	ldr	r7, .L112+12
	ldr	r9, .L112+16
	add	r6, r5, #140
.L100:
	ldr	r10, [r4, #16]
	str	ip, [sp, #4]
	ldr	ip, [r4, #20]
	ldr	r3, [r5, #12]
	ldr	r2, [r5, #16]
	ldm	r5, {r0, r1}
	str	lr, [sp]
	str	r10, [sp, #12]
	str	ip, [sp, #8]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L98
	ldr	r3, [r5, #20]
	cmp	r3, #0
	beq	.L98
	ldr	r3, [r4, #24]
	cmp	r3, #0
	ldrne	r3, [r9]
	subne	r3, r3, #1
	strne	r8, [r5, #20]
	strne	r3, [r9]
	strne	r8, [r4, #24]
.L98:
	add	r5, r5, #28
	cmp	r5, r6
	ldrne	ip, [r4, #4]
	ldrne	lr, [r4]
	bne	.L100
.L92:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L113:
	.align	2
.L112:
	.word	1717986919
	.word	enemies
	.word	playerBullets
	.word	collision
	.word	kills
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
	ldr	r4, .L125
	add	r5, r4, #1088
	add	r5, r5, #12
.L115:
	mov	r0, r4
	add	r4, r4, #44
	bl	updateEnemy
	cmp	r4, r5
	bne	.L115
	mov	ip, #0
	ldr	r3, .L125+4
	add	r0, r3, #140
.L118:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ldrne	r1, [r3, #8]
	ldr	r2, [r3]
	addne	r2, r2, r1
	ldr	r1, [r3, #16]
	strne	r2, [r3]
	add	r2, r2, r1
	cmp	r2, #0
	strle	ip, [r3, #20]
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L118
	pop	{r4, r5, r6, lr}
	bx	lr
.L126:
	.align	2
.L125:
	.word	enemies
	.word	playerBullets
	.size	updateGame, .-updateGame
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #20]
	cmp	r3, #0
	ldrne	r2, [r0, #8]
	ldr	r3, [r0]
	addne	r3, r3, r2
	ldr	r2, [r0, #16]
	strne	r3, [r0]
	add	r3, r3, r2
	cmp	r3, #0
	movle	r3, #0
	strle	r3, [r0, #20]
	bx	lr
	.size	updateBullet, .-updateBullet
	.comm	shadowOAM,1024,4
	.comm	playerBullets,140,4
	.comm	enemies,1100,4
	.comm	player,28,4
	.comm	kills,4,4
	.comm	lives,4,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
