 main:
	mov r0,#1024
	mov r1,#768
	mov r2,#16
	bl InitialiseFrameBuffer

	mov r4,r0
	bl SetGraphicsAddress

	bl UsbInitialise

@	bl program

@render:
@	mov r0, #65
@	bl PrintC

@	ldr r0, =test_format
@	ldr r1, =test_string
@	mvn r2,#14
@	ldr r3, =0x0102fabc

@	push {r3}
@	push {r2}
@	push {r2}
@	push {r1}

@	bl PrintF

@	ldr r0, =test_string
@	bl PrintS

@	ldr r0, =test_string
@	bl PrintS

@	bl TerminalClearLine
@	bl TerminalScroll

endloop:
	b endloop

@test_format:
@string(Test %% %s %i %u %x\n)
@test_string:
@string(\nHello World)

udiv10:
	sub   r1,r0,#10

	sub   r0,r0,r0,lsr #2
	add   r0,r0,r0,lsr #4
	add   r0,r0,r0,lsr #8
	add   r0,r0,r0,lsr #16
	mov   r0,r0,lsr #3

	add   r2,r0,r0,lsl #2
	subs  r1,r1,r2,lsl #1
	addpl r0,r0,#1

	mov pc, lr

memset:
	@ r0 = dst, r1 = char val, r2 = len
	and r1, r1, #0xff

	msLoop:
		strb r1, [r0]
		add r0,r0,#1

		sub r2, r2, #1
		cmp r2, #0
		bgt msLoop

	mov pc,lr

memcpy:
	@ r0 = dst, r1 = src, r2 = len

	mov r3, #0

	mcLoop:
                cmp r2, #0
                beq mcLoopEnd
                sub r2, r2, #1

		ldrb r3, [r1]
		strb r3, [r0]

		add r0,r0,#1
		add r1,r1,#1

		b mcLoop
	mcLoopEnd:

        mov pc,lr

include(`kernel/malloc.s')
