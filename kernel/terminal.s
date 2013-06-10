TerminalCursor:
	.word 0x0 @ px
	.word 0x0 @ py

TerminalClearLine:
	@ clear (0, py) to (width, py+16)
	push {r4-r7, lr}

	ldr r4, =fb_info

	ldr r6, [r4]
	ldr r5, [r4,#16]
	ldr r4, [r4,#32]

	ldr r0, =TerminalCursor+4
	ldr r0, [r0]

	mla r4, r5, r0, r4
	mov r7, #0x10

	tclLoop:
		mov r0, r4
		mov r1, #0
		mov r2, r6
		bl memset

		add r4,r4,r5
		sub r7,r7,#1
		cmp r7, #0
		bne tclLoop

	mov r1, #0
	ldr r0, =TerminalCursor
        str r1, [r0]

	pop {r4-r7, pc}

TerminalScroll:
	@ move all pixels up 16
	push {lr}

	ldr r0, =fb_info

	ldr r2, [r0, #4]
	ldr r1, [r0, #16]
	ldr r0, [r0, #32]

	sub r2, r2, #16
	mul r3, r2, r1
	mov r2, r3

	lsl r1, #4
	add r1, r1, r0

	bl memcpy

	pop {pc}
