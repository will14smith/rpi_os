_hcdGlobals:
	.word 0 @ Core
	.word 0 @ Host
	.word 0 @ Power
	.word 0 @ databuffer
	.word 0 @ PhyInitialised

HcdWrite:
	@ r0 = offset, r1 = sel, r2 = value
	ldr r3, =_hcdGlobals
	add r1, r3, r1, lsl #2

	teq r1, #1
	teqeq r0, #40
	ldreq r3, =0x1f140
	ldrne r3, =0xffffffff

	and r2, r2, r3

	ldr r1, [r1]
	str r2, [r1, r0]

	mov pc, lr

HcdRead:
	@ r0 = offset, r1 = sel, ret = value
	ldr r3, =_hcdGlobals
        add r1, r3, r1, lsl #2

	ldr r1, [r1]
	ldr r0, [r1, r0]

	mov pc, lr

HcdReset:
	@TODO
	mov pc, lr

HcdInitialise:
	push {r4-r9, lr}

	@ HCD_DESIGNWARE_BASE
	ldr r0, =0x20980000
	ldr r1, =_hcdGlobals

	str r0, [r1]
	add r0, r0, #0x400
	str r0, [r1,#4]
	add r0, r0, #0xA00
	str r0, [r1,#8]

	@ Read(Core->VendorId)
	mov r0, #0x40
	mov r1, #0
	bl HcdRead
	mov r4, r0

	@ Read(Core->UserId)
	mov r0, #0x3c
	mov r1, #0
	bl HcdRead

	mov r3, r0
	push {r3}
	and r3, r4, #0xf
	push {r3}
	mov r3, r4, lsr #4
	and r3, r3, #0xf
	push {r3}
        mov r3, r4, lsr #8
        and r3, r3, #0xf
        push {r3}
        mov r3, r4, lsr #12
        and r3, r3, #0xf
        push {r3}
        mov r3, r4, lsr #16
        and r3, r3, #0xff
        push {r3}
        mov r3, r4, lsr #24
        and r3, r3, #0xff
        push {r3}

	ldr r0, =_hcdInitHWFormat1
	bl PrintF
	add sp, sp, #28

	@TODO if 0x4f542000

	@TODO if InternalDma
	@TODO if HighSpeedPhysical

	@ Read(Core->Hardware) x4
	mov r4, #0x50
	hcdInitLdHw:
	        mov r0, r4
        	mov r1, #0
	        bl HcdRead
		push {r0}
		teq r4, #0x44
		subne r4, r4, #4
		bne hcdInitLdHw

	ldr r0, =_hcdInitHWFormat2
	bl PrintF
	add sp, sp, #16

	@ Read(Host->Config)
        mov r0, #0x0
        mov r1, #1
        bl HcdRead
	push {r0}

	ldr r0, =_hcdInitHWFormat3
        bl PrintF
        add sp, sp, #4

	@ Write(Core->InterruptMask, 0)
	mov r0, #0x18
	mov r1, #0
	mov r2, #0
	bl HcdWrite

	@ Read(Core->Ahb)
        mov r0, #0x8
        mov r1, #0
        bl HcdRead

	mvn r2, #1
	and r0, r0, r2

	@ Write(Core->Ahb, r0)
	mov r2, r0
	mov r0, #0x8
        mov r1, #0
        bl HcdWrite

	ldr r0, =_hcdInitHWStr1
	bl PrintS

	bl PowerOnUsb

	mov r4, r0
	teq r0, #0
	ldrne r0, =_hcdInitHWStr2
	ldreq r0, =_hcdInitHWStr3

	bl PrintS

	mov r0, r4

	pop {r4-r9, pc}

_hcdInitHWFormat1:
string(HCD: Hardware: %c%c%x.%x%x%x (BCM%x)\n)
_hcdInitHWFormat2:
string(HCD: Hardware config: %x %x %x %x\n)
_hcdInitHWFormat3:
string(HCD: Host config: %x\n)
_hcdInitHWStr1:
string(HCD: Powering USB on.\n)
_hcdInitHWStr2:
string(HCD: Failed to power on USB Host Controller.\n)
_hcdInitHWStr3:
string(HCD: Load completed.\n)

HcdStart:
        push {r4-r9, lr}

	ldr r0, =_hcdStartStr1
	bl PrintS

	mov r0, #1024
	bl malloc

	teq r0, #0
	moveq r0, #1
	popeq {r4-r9, pc}

	ldr r4, =_hcdGlobals
	str r0, [r4,#12]

	@ Read(Core->Usb)
	mov r0, #0xc
	mov r1, #0
	bl HcdRead

	mvn r2, #0x500000
	and r2, r0, r2

	@ Write(Core->Usb, r2)
	mov r0, #0xc
	mov r1, #0
	bl HcdWrite

	ldr r0, =_hcdStartStr2
        bl PrintS

	ldr r0, [r4,#16]
	teq r0, #0
	bne _hcdstPhyInited

		ldr r0, =_hcdStartStr3
	        bl PrintS

		mov r0, #1
		str r0, [r4, #16]

		@ Read(Core->Usb)
	        mov r0, #0xc
		mov r1, #0
		bl HcdRead

		orr r2, r1, #0x10
		mvn r1, #0x8
		and r2, r2, r1

		@ Write(Core->Usb, r2)
	        mov r0, #0xc
        	mov r1, #0
	        bl HcdWrite

		ldr r0, =_hcdStartStr4
                bl PrintS

		bl HcdReset

	_hcdstPhyInited:

	@ Read(Core->Hardware+4)
        mov r0, #0x48
        mov r1, #0
        bl HcdRead
	mov r6, r0
	@ Read(Core->Usb)
        mov r0, #0xc
	mov r1, #0
        bl HcdRead

	and r6, r6, #0x3C0
	teq r6, #180
	orreq r0, r0, #0xA0000
	mvnne r3, #0xA0000
	andne r0, r0, r3

	moveq r5, #1
	movne r5, #0

	@ Write(Core->Usb, r0)
	mov r2, r0
        mov r0, #0xc
        mov r1, #0
        bl HcdWrite

	push {r5}
	ldr r0, =_hcdStartFormat1
	bl PrintF
	add sp, sp, #4

	@ Read(Core->Ahb)
        mov r0, #0x8
        mov r1, #0
        bl HcdRead

	orr r0, r0, #0x20
	mvn r2, #0x800000
	and r2, r0, r2

        @ Write(Core->Ahb, r2)
        mov r0, #0x8
        mov r1, #0
        bl HcdWrite

	@ Read(Core->Usb)
        mov r0, #0xc
        mov r1, #0
        bl HcdRead

	mvn r2, #0x300
	and r0, r0, r2

	and r2, r6, #1
	teq r2, #1
	orreq r0, r0, #0x100
	and r2, r6, #7
	teq r2, #0
	orreq r0, r0, #0x300

	@ Write(Core->Usb, r0)
        mov r2, r0
        mov r0, #0xc
        mov r1, #0
        bl HcdWrite

	ldr r0, =_hcdStartStr6
	bl PrintS

	mov r0, #0
	mov r1, #2
	mov r2, #0
	bl HcdWrite

	@ Read(Core->Usb)
        mov r0, #0xc
        mov r1, #0
        bl HcdRead

	and r0, r0, #0x20000
	teq r0, #0
	moveq r6, #0

	@ Read(Host->Config)
        mov r0, #0
        mov r1, #1
        bl HcdRead

	mvn r1, #3
	and r0, r0, r2
	teq r6, #1
	orreq r0, r0, #1

	orr r0, r0, #4

	@ Write(Host->Config, r0)
	mov r2, r0
        mov r0, #0
        mov r1, #1
        bl HcdWrite

	teq r6, #1
	ldreq r0, =_hcdStartStr7
	ldrne r0, =_hcdStartStr8
	push {r0}

	ldr r0, =_hcdStartFormat2
	bl PrintF
	add sp, sp, #4

	@ TODO continue at Core->Receive.Size = ...

        pop {r4-r9, pc}

_hcdStartStr1:
string(HCD: Start core.\n)
_hcdStartStr2:
string(HCD: Master reset.\n)
_hcdStartStr3:
string(HCD: One time phy initialisation.\n)
_hcdStartStr4:
string(HCD: Interface: UTMI+.\n)
_hcdStartFormat1:
string(HCD: ULPI FSLS config: %i\n)
_hcdStartStr5:
string(HCD: DMA configuration: enabled.\n)
_hcdStartStr6:
string(HCD: Core started.\nHCD: Starting host.\n)
_hcdStartStr7:
string(Clock48MHz)
_hcdStartStr8:
string(Clock30_60MHz)
_hcdStartFormat2:
string(HCD: Host clock: %s.\n)

HcdStop:
	@TODO
	mov pc, lr

HcdDeinitialise:
	@TODO
	mov pc, lr
