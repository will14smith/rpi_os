UsbGlobalDevices:
	.space 128 @ 32*sizeof(void*)
UsbGlobalClassAttach:
	.space 64  @ 16*sizeof(void*)

@ return codes
@ 0 = OK
@ else = NOT OK
UsbInitialise:
	push {r4, lr}

	mov r4, #0

	bl UsbConfigLoad

	bl HcdInitialise
	mov r4,r0
	teq r4, #0
	bne usbiReturn

	bl HcdStart
	mov r4,r0
	teq r4, #0
        bne usbiDeinitialise

	bl UsbAttachRootHub
        mov r4,r0
        teq r4, #0
        bne usbiStop

	mov r0, r4
	pop {r4,pc}

	usbiStop:
	bl HcdStop
	usbiDeinitialise:
	bl HcdDeinitialise
	usbiReturn:
	mov r0, r4
	pop {r4,pc}

UsbAttachRootHub:
	@TODO
	mov pc, lr
