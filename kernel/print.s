include(`kernel/terminal.s')

PrintC:
	push {r4-r6, lr}

	ldr r4, =TerminalCursor
	ldr r5, =TerminalCursor+4

	mov r6, r0
	ldr r1, [r4]
	ldr r2, [r5]

	bl DrawCharacter

	teq r6, #0xa ; '\n'

	ldrne r2, [r4]
	addne r2, r2, r0
	moveq r2, #0x0
	str r2, [r4]

	ldreq r2, [r5]
	addeq r2, r2, r1
	streq r2, [r5]

	pop {r4-r6,pc}

PrintI:
	push {r4, lr}

	cmp r0, #0
	movlt r4, r0
	movlt r0, #0x2d @ '-'
	bllt PrintC
	mov r1, #0
	cmp r4, #0
	sublt r0, r1, r4

	bl PrintU

	pop {r4, pc}

PrintU:
	push {r4, r5, lr}

	mov r4, r0

	bl udiv10

	sub r5, r4, r0, lsl #3
	sub r5, r5, r0, lsl #1

	cmp r0, #0
	blne PrintU

	add r0, r5, #0x30 @ '0'
	bl PrintC

	pop {r4, r5, pc}

PrintX:
	push {r4,r5, lr}

	mov r4, r0
	mov r5, #8

	teq r4, #0
	moveq r0, #0x30 @ '0'
	bleq PrintC
	teq r4, #0
	popeq {r4,r5, pc}

	pxBlankLoop:
		cmp r5, #1
		beq hexLoop
		and r0, r4, #0xf0000000
		cmp r0, #0
		lsleq r4, #4
		subeq r5, r5, #1
		beq pxBlankLoop

	hexLoop:
		mov r0, r4, lsr #28
		cmp r0, #0xa
		addlt r0, r0, #0x30 @ '0'
		addge r0, r0, #0x57 @ 'a' - 0xa

		bl PrintC

		lsl r4, #4
		sub r5,r5,#1
		teq r5, #0
		bne hexLoop

	pop {r4,r5, pc}

PrintS:
        push {r4,lr}

        mov r4,r0

        dsLoop:
                ldrb r0,[r4]
                cmp r0, #0
                beq dsLoopEnd
                add r4,r4,#1

                bl PrintC

                b dsLoop
        dsLoopEnd:

        pop {r4,pc}

PrintF:
	push {r4-r8,lr}

	@ r4 = format*
	@ r5 = arg list*
	@ r6 = current char
	@ r7 = next arg

	mov r4, r0
	add r5, sp, #24 @ 6regs*4bytes
	ldr r7,[r5]
	add r5,r5,#4

	pfLoop:
		ldrb r6, [r4]
		add r4,r4,#1
		teq r6, #0
		popeq {r4-r8,pc}

		teq r6, #0x25  @ '%'
		beq pfArg

		pfChar:
			mov r0, r6
			bl PrintC

			b pfLoop

		pfArg:
        	        ldrb r6, [r4]
                	add r4,r4,#1
			teq r6, #0
	                popeq {r4-r8,pc}

			@ %%
			teq r6, #0x25  @ '%'
			beq pfChar

			@ %c
			teq r6,#0x63 @ 'c'
			moveq r6,r7
			ldreq r7,[r5]
			addeq r5, r5, #4
			beq pfChar

			@ %s
			teq r6,#0x73 @ 's'
			beq pfString

			@ %d / %i
			teq   r6,#0x64 @ 'd'
			teqne r6,#0x69 @ 'i'
			beq pfSigned

			@ %u / %b / %o
			teq   r6,#0x75 @ 'u'
			teqne r6,#0x62 @ 'b'
			teqne r6,#0x6f @ 'o'
			beq pfUnsigned

			@ %x
			teq r6,#0x78 @ 'x'
			beq pfHex

			b pfLoop

		pfString:
			mov r0,r7   @ str pointer
                        ldr r7,[r5]
                        add r5, r5, #4

			bl PrintS
			b pfLoop

		pfSigned:
			mov r0,r7
                        ldr r7,[r5]
                        add r5, r5, #4

			bl PrintI
			b pfLoop

		pfUnsigned:
			mov r0,r7
                        ldr r7,[r5]
                        add r5, r5, #4

			bl PrintU
			b pfLoop

		pfHex:
			mov r0,r7
                        ldr r7,[r5]
                        add r5, r5, #4

                        bl PrintX
                        b pfLoop
