PowerOnUsb:
	push {lr}

	mov r0, #0x80
	mov r1, #0
	bl MailboxWrite

	mov r0, #0
	bl MailboxRead

	cmp r0, #0x80
	moveq r0, #0

	pop {pc}
