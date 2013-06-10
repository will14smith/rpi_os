GetMailboxBase:
	ldr r0,=0x2000B880
	mov pc,lr

MailboxWrite:
	tst r0,#0xf
	movne pc,lr
	cmp r1,#15
	movhi pc,lr

	mov r2, r0
	push {lr}
	bl GetMailboxBase

	mbwWait1:
		ldr r3,[r0,#0x18]
		tst r3,#0x80000000
		bne mbwWait1

	add r2,r2,r1

	str r2,[r0,#0x20]

	pop {pc}

MailboxRead:
	cmp r0,#15
	movhi pc,lr

	mov r1, r0
	push {lr}
	bl GetMailboxBase

	mbrRight:
		mbrWait1:
			ldr r2,[r0,#0x18]
			tst r2,#0x40000000
			bne mbrWait1

		ldr r2,[r0]
		and r3,r2,#0xf
		teq r3,r1
		bne mbrRight

	mvn r0,#0xf
	and r0,r3,r0
	pop {pc}
