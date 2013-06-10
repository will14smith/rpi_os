.align 4
fb_info:
        .word 1024      @  0 Width
        .word 768       @  4 Height
        .word 1024      @  8 VWidth
        .word 768       @ 12 VHeight
        .word 0         @ 16 GPU Pitch
        .word 16        @ 20 Bit Depth
        .word 0         @ 24 X
        .word 0         @ 28 Y
        .word 0         @ 32 GPU Pointer
        .word 0         @ 36 GPU Size

GraphicsAddress:
	.word 0

SetGraphicsAddress:
	ldr r1, =GraphicsAddress
	str r0,[r1]
	mov pc,lr

InitialiseFrameBuffer:
	@ r0 = width, r1 = height, r2 = bitdepth
	cmp r0,#4096
	cmpls r1,#4096
	cmpls r2,#32
	movhi r0,#0
	movhi pc,lr

	push {r4, lr}

	ldr r4, =fb_info
	str r0,[r4]
	str r1,[r4,#4]
	str r0,[r4,#8]
	str r1,[r4,#12]
	str r2,[r4,#20]

	mov r0,r4
	mov r1,#1
	bl MailboxWrite

	mov r0,#1
	bl MailboxRead

	teq r0,#0
	movne r0,#0
	popne {r4,pc}

	ifbWait:
		ldr r0,[r4,#32]
		teq r0,#0
		beq ifbWait

	mov r0,r4
	pop {r4, pc}
