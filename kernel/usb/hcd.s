_hcdGlobals:
	.word 0 @ CorePhysical
	.word 0 @ Core
	.word 0 @ HostPhysical
	.word 0 @ Host
	.word 0 @ PowerPhysical
	.word 0 @ Power

WriteThroughReg:
	mov r2, r1
	mov r1, #0

WriteThroughRegMask:
	@ r0 = offset, r1 = mask, r2 = (0 = Core, 1 = Host, 2 = Power)

	ldr r1, =0xffffffff

	teq r2, #1
	teqeq r0, #40
	ldreq r2, =0x1f140

	ldr r3, =_hcdGlobals
	add r3, r3, r2, lsl #3

	ldr r2, [r3,#4]
	ldr r2, [r2, r0]
	and r2, r2, r1
	ldr r1, [r3]
	str r2, [r1, r0]

	mov pc, lr

ClearReg:
	teq r1, #1
        beq clrHost
        teq r1, #2
        beq clrPhys

	teq r0, #0x44
        beq clrHW

	ldr r1, =_hcdGlobals+4
        ldr r1, [r1]
	mov r2, #0
	str r2, [r1, r0]

	mov pc, lr

	clrHW:

	ldr r1, =_hcdGlobals+4
        ldr r1, [r1]
        mov r2, #0
        str r2, [r1, #0x44]
        str r2, [r1, #0x48]
        str r2, [r1, #0x4c]
        str r2, [r1, #0x50]

	mov pc, lr

	clrHost:

	ldr r1, =_hcdGlobals+12
        ldr r1, [r1]
        mov r2, #0
        str r2, [r1, r0]

	mov pc, lr

	clrPhys:

	ldr r1, =_hcdGlobals+20
        ldr r1, [r1]
        mov r2, #0
        str r2, [r1]

	mov pc, lr

ReadBackReg:
	teq r1, #1
	beq rbrHost
	teq r1, #2
        beq rbrPhys

	teq r0, #0x44
	beq rbrHW

	ldr r1, =_hcdGlobals
	ldr r1, [r1]
	ldr r2, [r1, r0]
	ldr r1, =_hcdGlobals+4
	ldr r1, [r1]
	str r2, [r1, r0]

	mov pc, lr

	rbrHW:
	ldr r0, =_hcdGlobals
	ldr r0, [r0]
	ldr r1, =_hcdGlobals+4
	ldr r1, [r1]

	ldr r2, [r0, #0x44]
	ldr r3, [r0, #0x48]
	str r2, [r1, #0x44]
	str r3, [r1, #0x48]

	ldr r2, [r0, #0x4C]
	ldr r3, [r0, #0x50]
	str r2, [r1, #0x4C]
	str r3, [r1, #0x50]

	mov pc, lr

	rbrHost:
	ldr r1, =_hcdGlobals+8
	ldr r1, [r1]
	ldr r2, [r1, r0]
	ldr r1, =_hcdGlobals+12
	ldr r1, [r1]
	str r2, [r1, r0]

	mov pc, lr

	rbrPhys:
	ldr r1, =_hcdGlobals+16
        ldr r1, [r1]
        ldr r2, [r1]
	ldr r1, =_hcdGlobals+20
        ldr r1, [r1]
        str r2, [r1]

	mov pc, lr

HcdReset:
	@TODO
	mov pc, lr

HcdInitialise:
	push {r4-r9, lr}

	@ HCD_DESIGNWARE_BASE
	ldr r0, =0x20980000
	ldr r4, =_hcdGlobals

	str r0, [r4]
	add r0, r0, #0x400
	str r0, [r4,#8]
	add r0, r0, #0xA00
	str r0, [r4,#16]

	mov r0, #0x400
	bl malloc
	str r0, [r4,#4]

	mov r0, #0x400
	bl malloc
	str r0, [r4,#12]

	mov r0, #0x4
	bl malloc
	str r0, [r4,#20]

	@ ReadBackReg(Core->VendorId)
	mov r0, #0x40
	mov r1, #0
	bl ReadBackReg

	@ ReadBackReg(Core->UserId)
	mov r0, #0x3c
	mov r1, #0
	bl ReadBackReg

	ldr r0, [r4,#4]
	ldr r1, [r0,#0x40]
	ldr r2, [r0,#0x3c]

	mov r3, r2, lsr #12
	push {r3}
	and r3, r1, #0xf
	push {r3}
	mov r3, r1, lsr #4
	and r3, r3, #0xf
	push {r3}
        mov r3, r1, lsr #8
        and r3, r3, #0xf
        push {r3}
        mov r3, r1, lsr #12
        and r3, r3, #0xf
        push {r3}
        mov r3, r1, lsr #16
        and r3, r3, #0xff
        push {r3}
        mov r3, r1, lsr #24
        and r3, r3, #0xff
        push {r3}

	ldr r0, =_hcdInitHWFormat1
	bl PrintF
	add sp, sp, #28

	@ ReadBackReg(Core->Hardware)
        mov r0, #0x44
        mov r1, #0
        bl ReadBackReg

	ldr r0, [r4,#4]
	ldr r1, [r0,#0x50]
	push {r1}
	ldr r1, [r0,#0x4C]
	push {r1}
	ldr r1, [r0,#0x48]
	push {r1}
	ldr r1, [r0,#0x44]
	push {r1}

	ldr r0, =_hcdInitHWFormat2
	bl PrintF
	add sp, sp, #16

	@ ReadBackReg(Host->Config)
        mov r0, #0x0
        mov r1, #1
        bl ReadBackReg

	ldr r0, [r4,#12]
        ldr r1, [r0]
	push {r1}

	ldr r0, =_hcdInitHWFormat3
        bl PrintF
        add sp, sp, #4

	@ ReadBackReg(Core->Ahb)
        mov r0, #0x8
        mov r1, #0
        bl ReadBackReg

	ldr r0, [r4,#4]
	ldr r1, [r0,#8]
	mvn r2, #1
	and r1, r1, r2
	str r1, [r0,#8]

	@ ClearReg(Core->InterruptMask)
	mov r0, #0x18
        mov r1, #0
        bl ClearReg

	@ WriteThroughReg(Core->InterruptMask)
	mov r0, #0x18
        mov r1, #0
        bl WriteThroughReg

	@ WriteThroughReg(Core->Ahb)
	mov r0, #0x8
        mov r1, #0
        bl WriteThroughReg

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

_hcdDataBuffer:
	.word 0x0
_hcdPhyInit:
	.word 0x0

HcdStart:
	push {r4-r9, lr}

	mov r0, #1024
	bl malloc
	ldr r1, =_hcdDataBuffer
	str r0, [r1]

	ldr r4, =_hcdGlobals

	@ ReadBackReg(Core->Usb)
	mov r0, #0xc
	mov r1, #0
	bl ReadBackReg

	ldr r0, [r4, #4]
	ldr r1, [r0, #0xc]
	mvn r2, #0x500000
	and r1, r1, r2
	str r1, [r0, #0xc]

	@ WriteThroughReg(Core->Usb)
	mov r0, #0xc
        mov r1, #0
	bl WriteThroughReg

	bl HcdReset

	ldr r0, =_hcdPhyInit
	ldr r1, [r0]
	cmp r1, #0
	bne _hcdsPhyInited

		mov r1, #1
		str r1, [r0]

		ldr r0, [r4,#4]
		ldr r1, [r0,#0xc]
		orr r1, r1, #0x10
		mvn r2, #0x8
		and r1, r1, r2
		str r1, [r0,#0xc]

		@ WriteThroughReg(Core->Usb)
        	mov r0, #0xc
	        mov r1, #0
        	bl WriteThroughReg

	_hcdsPhyInited:

	@ ReadBackReg(Core->Usb)
        mov r0, #0xc
        mov r1, #0
        bl ReadBackReg

	ldr r0, [r4, #4]
	ldr r1, [r0, #0x48]
	ldr r2, [r0, #0xc]

	and r1, r1, #0x3C0
	teq r1, #180
	orreq r2, r2, #0xA0000
	mvnne r3, #0xA0000
	andne r2, r2, r3

	moveq r5, #1
	movne r5, #0

	str r2, [r0, #0xc]

	push {r5}
	ldr r0, =_hcdStartFormat1
	bl PrintF
	pop {r5}

	@ WriteThroughReg(Core->Usb)
        mov r0, #0xc
        mov r1, #0
        bl WriteThroughReg

	@ ReadBackReg(Core->Ahb)
        mov r0, #0x8
        mov r1, #0
        bl ReadBackReg

	ldr r0, [r4,#4]
        ldr r1, [r0,#0x8]
	orr r1, r1, #0x20
	mvn r2, #0x800000
	and r1, r1, r2
	str r1, [r0,#0x8]

	@ WriteThroughReg(Core->Ahb)
        mov r0, #0x8
        mov r1, #0
        bl WriteThroughReg

	@ ReadBackReg(Core->Usb)
        mov r0, #0xc
        mov r1, #0
        bl ReadBackReg

	ldr r0, [r4,#4]
	ldr r1, [r0,#0x48]
	ldr r3, [r0,#0xc]
	mvn r2, #0x300

	and r2, r1, #1
	teq r2, #1
	orreq r3, r3, #0x100
	and r2, r1, #7
	teq r2, #0
	orreq r3, r3, #0x300

	str r3, [r0,#0xc]

	@ WriteThroughReg(Core->Usb)
        mov r0, #0xc
        mov r1, #0
        bl WriteThroughReg

	@ ClearReg(Power)
	mov r0, #0
	mov r1, #2
	bl ClearReg
        @ WriteThroughReg(Power)
        mov r0, #0
        mov r1, #2
        bl WriteThroughReg

	@ ReadBackReg(Host->Config)
        mov r0, #0
        mov r1, #1
        bl ReadBackReg

	ldr r0, [r4,#12]
	ldr r3, [r0]
	ldr r1, [r3]

	mvn r2, #3
	and r1, r1, r2

	ldr r0, [r4,#4]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	and r0, r0, #0x20000

	teq r0, #0
	teqne r5, #0

	orrne r1, r1, #1

	str r1, [r3]

        @ WriteThroughReg(Host->Config)
        mov r0, #0
        mov r1, #1
        bl WriteThroughReg

        @ ReadBackReg(Host->Config)
        mov r0, #0
        mov r1, #1
        bl ReadBackReg

	ldr r0, [r4,#12]
        ldr r0, [r0]
        ldr r1, [r0]

	orr r1, r1, #4

        @ WriteThroughReg(Host->Config)
        mov r0, #0
        mov r1, #1
        bl WriteThroughReg

	@ ReadBackReg(Core->Receive.Size)
        mov r0, #0x24
        mov r1, #0
        bl ReadBackReg

	ldr r0, [r4,#4]
	ldr r0, [r0]
	mov r1, #0x5000
	str r1, [r0,#0x24]

	@ WriteThroughReg(Core->Receive.Size)
        mov r0, #0x24
        mov r1, #0
	bl WriteThroughReg

        @ ReadBackReg(Core->NonPeriodicFifo.Size)
        mov r0, #0x28
        mov r1, #0
        bl ReadBackReg

        ldr r0, [r4,#4]
        ldr r0, [r0]
        ldr r1, =0x50005000
        str r1, [r0,#0x28]

        @ WriteThroughReg(Core->NonPeriodicFifo.Size)
        mov r0, #0x28
        mov r1, #0
        bl WriteThroughReg

        @ ReadBackReg(Core->PeriodicFifo.HostSize)
        mov r0, #0x100
        mov r1, #0
        bl ReadBackReg

        ldr r0, [r4,#4]
        ldr r0, [r0]
        ldr r1, =0x5000A000
        str r1, [r0,#0x100]

        @ WriteThroughReg(Core->PeriodicFifo.HostSize)
        mov r0, #0x100
        mov r1, #0
        bl WriteThroughReg

	@ ReadBackReg(Core->OtgControl)
        mov r0, #0x0
        mov r1, #0
        bl ReadBackReg

	ldr r0, [r4,#4]

	@ WriteThroughReg(Core->OtgControl)
        mov r0, #0x0
        mov r1, #0
        bl WriteThroughReg

	@ TODO
	@ Continue from hcd/dwc/designware20.c line 805

	pop {r4-r9, pc}

_hcdStartFormat1:
string(HCD: ULPI FSLS config: %i)

HcdStop:
	@TODO
	mov pc, lr

HcdDeinitialise:
	@TODO
	mov pc, lr
