ForeColour:
	.word 0xFFFF

SetForeColour:
	cmp r0,#0x10000
	movhi pc,lr
	moveq pc,lr

	ldr r1, =ForeColour
	strh r0,[r1]
	mov pc,lr

DrawPixel:
	ldr r2, =GraphicsAddress
	ldr r2,[r2]
	ldr r3,[r2,#4]
	sub r3,r3,#1
	cmp r1,r3
	movhi pc,lr

	ldr r3,[r2,#0]
	sub r3,r3,#1
	cmp r0,r3
	movhi pc,lr

	ldr r2,[r2,#32]
	add r3,r3,#1
	mla r0,r1,r3,r0
	add r2,r2,r0,lsl #1

	ldr r3, =ForeColour
	ldrh r3,[r3]
	strh r3,[r2]

	mov pc,lr
