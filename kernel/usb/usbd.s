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

UsbGetDescription:
	@TODO
	ldr r0, =_udgStr1
	mov pc, lr

_udgStr1:
string(DESC TODO)

UsbAttachDevice:
	@ TODO
	mov r1, #1
	mov pc, lr

UsbAllocateDevice:
	@ r0 = **device
	push {r4, lr}
	mov r4, r0

	mov r0, #0x4f0
	bl malloc
	teq r0, #0
	moveq r0, #1
	popeq {r4,pc}

	str r0, [r4]
	mov r4, r0

	mov r1, #0
	ldr r2, =UsbGlobalDevices
	_uadLoop1:
		cmp r1, #32
		bge _uadLoopEnd1

		ldr r3, [r2, r1, lsl #2]
		teq r3, #0
		beq _uadLoopEnd1

		add r1,r1,#1
		b _uadLoop1
	_uadLoopEnd1:

	str r4, [r2, r1, lsl #2]
	add r1, r1, #1
	str r1, [r4, #0]

	push {r1}
	ldr r0, =_uadFormat1
	bl PrintF
	add sp, sp, #4

	ldr r0, =0
	str r0, [r4, #0x8] @ Status
	str r0, [r4, #0x14] @ Error
	str r0, [r4, #0x10] @ PortNumber
	str r0, [r4, #0x4e0] @ Parent
	str r0, [r4, #0x4e8] @ DriverData
	str r0, [r4, #0x4e4] @ FullConfig
	str r0, [r4, #0x1c] @ DeviceDeallocated
	str r0, [r4, #0x18] @ DeviceDetached
	str r0, [r4, #0x2c] @ DeviceCheckConnection
	str r0, [r4, #0x20] @ DeviceCheckForChange
	str r0, [r4, #0x24] @ DeviceChildDetached
	str r0, [r4, #0x28] @ DeviceChildReset

	mov r0, #0xff
	str r0, [r4, #0xc] @ ConfigIndex

	mov r1, #0
	pop {r4,pc}

_uadFormat1:
string(USBD: Allocating new device address %x.\n)

UsbDeallocateDevice:
	push {r4, lr}
	mov r4, r0

	bl UsbGetDescription
	push {r0}
	ldr r0, [r4, #0] @ Number
	push {r0}
	ldr r0, =_uddStr1
	bl PrintF
	add sp, sp, #8

	ldr r0, [r4, #0x18] @ DeviceDetached
	teq r0, #0
	blxne r0
	ldr r0, [r4, #0x1c] @ DeviceDeallocate
	teq r0, #0
        blxne r0

	ldr r0, [r4, #0x4e0] @ Parent
	teq r0, #0
	beq _uddL1
	ldr r2, [r0, #0x24] @ Parent->DeviceChildDetached
	teq r2, #0
        beq _uddL1

	mov r4, r1
	blx r2

	_uddL1:
	ldr r0, [r4, #0x8] @ Status
	teq r0, #3
	teqne r0, #4
	bne _uddL2

	ldr r1, [r4, #0] @ Number
	cmp r1, #0
	ble _uddL2
	cmp r1, #32
	bgt _uddL2
	ldr r0, =UsbGlobalDevices
	sub r1, r1, #1
	ldr r3, [r0, r1, lsl #2]
	teq r3, r4
	bne _uddL2

	mov r2, #0
	str r2, [r0, r1, lsl #2]

	_uddL2:

	ldr r0, [r4, #0x4e4] @ FullConfiguration
	teq r0, #0
	blne free

	mov r0, r4
	bl free

	pop {r4, pc}

_uddStr1:
string(USBD: Deallocating device %x: %s.\n)

UsbAttachRootHub:
	push {r4,lr}

	ldr r0, =_usbARHStr1
	bl PrintS

	ldr r4, =UsbGlobalDevices

	ldr r0, [r4]
	teq r0, #0
	blne UsbDeallocateDevice

	ldr r0, =_usbARHrh
	bl UsbAllocateDevice

	teq r0, #0
	popne {r4,pc}

	ldr r0, [r4]
	mov r1, #1
	str r1, [r4, #4]

	bl UsbAttachDevice

	pop {r4,pc}

_usbARHrh:
.word 0x0
_usbARHStr1:
string(USBD: Scanning for devices.\n)
