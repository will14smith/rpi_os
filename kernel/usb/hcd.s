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
	push {r4,lr}
	mov r4, #0

	_hcdResetLoop1:
		cmp r4, #0x100000
		ldrge r0, =_hcdHang
		blge PrintS
		cmp r4, #0x100000
		movge r0, #1
		popge {r4, pc}

		add r4, r4, #1

		@ Read(Core->Reset)
		mov r0, #0x10
		mov r1, #0
		bl HcdRead

		and r0, r0, #0x80000000
		teq r0, #0
		beq _hcdResetLoop1

	@ Read(Core->Reset)
        mov r0, #0x10
        mov r1, #0
        bl HcdRead

	orr r2, r0, #1

	@ Write(Core->Reset, r2)
	mov r0, #0x10
        mov r1, #0
        bl HcdWrite

	mov r4, #0
	_hcdResetLoop2:
		cmp r4, #0x100000
                ldrge r0, =_hcdHang
                blge PrintS
                cmp r4, #0x100000
                movge r0, #1
                popge {r4, pc}

                add r4, r4, #1

                @ Read(Core->Reset)
                mov r0, #0x10
                mov r1, #0
                bl HcdRead

                and r1, r0, #0x80000000
                teq r1, #0
                beq _hcdResetLoop2
                and r1, r0, #1
                teq r1, #1
                beq _hcdResetLoop2

	mov r0, #0

	pop {r4, pc}

_hcdHang:
string(HCD: Device Hang!\n)

HcdTransmitFifoFlush:
	push {r4, lr}

	and r4, r0, #0x1F

	ldr r0, =_hcdTFFStr1
	bl PrintS

	teq r4, #16
	ldreq r0, =_hcdTFFStr2
	bleq PrintS
	teq r4, #16
	beq _hcdTFFeif
	teq r4, #0
	ldreq r0, =_hcdTFFStr3
	bleq PrintS
	teq r4, #0
	beq _hcdTFFeif

	mov r0, r4
	bl PrintU

	_hcdTFFeif:

	mov r0, #0xa @ '\n'
	bl PrintC

	mov r2, #0x20
	orr r2, r2, r4, lsl #6

	@ Write(Core->Reset, r2)
	mov r0, #0x10
	mov r1, #0
	bl HcdWrite

	mov r4, #0
	_hcdTFFLoop1:
                cmp r4, #0x100000
                ldrge r0, =_hcdHang
		blge PrintS
		cmp r4, #0x100000
		movge r0, #1
		popge {r4, pc}

		add r4, r4, #1
		@ Read(Core->Reset)
		mov r0, #0x10
	        mov r1, #0
        	bl HcdRead

		and r0, r0, #0x20
		teq r0, #0
		bne _hcdTFFLoop1

	mov r0, #0
	pop {r4, pc}

_hcdTFFStr1:
string(HCD: TXFlush: )
_hcdTFFStr2:
string(All)
_hcdTFFStr3:
string(NP)

HcdReceiveFifoFlush:
	push {r4, lr}

        ldr r0, =_hcdRFFStr1
        bl PrintS

        @ Write(Core->Reset, 0x10)
        mov r0, #0x10
        mov r1, #0
	mov r2, #0x10
        bl HcdWrite

        mov r4, #0
        _hcdRFFLoop1:
                cmp r4, #0x100000
                ldrge r0, =_hcdHang
                blge PrintS
                cmp r4, #0x100000
                movge r0, #1
                popge {r4, pc}

                add r4, r4, #1
                @ Read(Core->Reset)
                mov r0, #0x10
                mov r1, #0
                bl HcdRead

                and r0, r0, #0x10
                teq r0, #0
                bne _hcdRFFLoop1

        mov r0, #0
        pop {r4, pc}


_hcdRFFStr1:
string(HCD: RXFlush: All\n)

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

	mov r3, r0, lsr #12
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

	@ Write(Core->Receive.Size, 0x5000)
	mov r0, #0x24
        mov r1, #0
	mov r2, #0x5000
        bl HcdWrite

	@ Write(Core->NonPeriodicFifo.Size, 0x50005000)
	mov r0, #0x28
        mov r1, #0
	ldr r2, =0x50005000
	bl HcdWrite

	@ Write(Core->PeriodicFifo.HostSize, 0x5000A000)
	mov r0, #0x28
        mov r1, #0
        ldr r2, =0x5000A000
        bl HcdWrite

	ldr r0, =_hcdStartStr9
	bl PrintS

	@ Read(Core->OtgControl)
	mov r0, #0
	mov r1, #0
	bl HcdRead

	orr r2, r0, #0x400

	@ Write(Core->OtgControl, r2)
	mov r0, #0
        mov r1, #0
	bl HcdWrite

	mov r0, #16
	bl HcdTransmitFifoFlush
	teq r0, #0
	bne _hcdStartDeallocate

	bl HcdReceiveFifoFlush
	teq r0, #0
        bne _hcdStartDeallocate

	@ Read(Host->Config)
        mov r0, #0
        mov r1, #1
        bl HcdRead

	and r0, r0, #0x800000
	teq r0, #0
	bne _hcdStartNEDD

	@ Read(Core->Hardware+4)
	mov r0, #0x48
	mov r1, #0
	bl HcdRead

	and r0, r0, #0x3C000
	mov r5, r0, lsr #14

	mov r6, #0
	_hcdLoop1:
		cmp r5, r6
		bge _hcdLoopEnd1

		mov r7, r6, lsl #5
		add r7, r7, #0x500

		@ Read(Host->Channel[r6].Characteristic)
		mov r0, r7
		mov r1, #1
		bl HcdRead

		ldr r1, =0x800C0000
		and r2, r0, r1
		orr r2, r2, #0x40000000
		orr r2, r2, #0x40000

		@ Write(Host->Channel[r6].Characteristic, r2)
		mov r0, r7
                mov r1, #1
		bl HcdWrite

		add r6, r6, #1
		b _hcdLoop1
	_hcdLoopEnd1:

	mov r6, #0
        _hcdLoop2:
                cmp r5, r6
                bge _hcdLoopEnd2

                mov r7, r6, lsl #5
                add r7, r7, #0x500

                @ Read(Host->Channel[r6].Characteristic)
                mov r0, r7
                mov r1, #1
                bl HcdRead

                ldr r1, =0xC0000
                and r2, r0, r1
                orr r2, r2, #0xC0000000
                orr r2, r2, #0x40000

                @ Write(Host->Channel[r6].Characteristic, r2)
                mov r0, r7
                mov r1, #1
                bl HcdWrite

		mov r8, #0
		_hcdLoop3:
			add r8, r8, #1
			cmp r8, #0x100000
			ldrgt r0, =_hcdStartFormat3
			pushgt {r6}
			blgt PrintF
			cmp r8, #0x100000
			addgt sp, sp, #4

			@ Read(Host->Channel[r6].Characteristic)
	                mov r0, r7
        	        mov r1, #1
                	bl HcdRead

			and r0, r0, #0x80000000
			teq r0, #0
			bne _hcdLoop3

                add r6, r6, #1
		b _hcdLoop2
        _hcdLoopEnd2:

	_hcdStartNEDD:
	@ Read(Host->Port)
	mov r0, #0x40
	mov r1, #1
	bl HcdRead

	and r0, r0, #0x1000
	teq r0, #0
	bne _hcdStartNP

	ldr r0, =_hcdStartStr10
	bl PrintS

	@ Read(Host->Port)
        mov r0, #0x40
        mov r1, #1
        bl HcdRead

	orr r2, r0, #0x1000

	@ Write(Host->Port, r2)
	mov r0, #0x40
        mov r1, #1
	bl HcdWrite

	_hcdStartNP:

	ldr r0, =_hcdStartStr11
	bl PrintS

	@ Read(Host->Port)
	mov r0, #0x40
	mov r1, #1
	bl HcdRead

	orr r2, r0, #8

	@ Write(Host->Port, r2)
        mov r0, #0x40
        mov r1, #1
        bl HcdWrite

	ldr r0, =50000
	bl MicroDelay

	@ Read(Host->Port)
        mov r0, #0x40
        mov r1, #1
        bl HcdRead

	mvn r1, #8
	and r2, r0, r1

	@ Write(Host->Port, r2)
        mov r0, #0x40
        mov r1, #1
        bl HcdWrite

	ldr r0, =_hcdStartStr12
	bl PrintS

	mov r0, #0

	_hcdStartDeallocate:

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
_hcdStartStr9:
string(HCD: Set HNP: enabled.\n)
_hcdStartFormat3:
string(HCD: Unable to clear halt on channel %u.\n)
_hcdStartStr10:
string(HCD: Powering up port.\n)
_hcdStartStr11:
string(HCD: Reset port.\n)
_hcdStartStr12:
string(HCD: Successfully started.\n)

HcdStop:
	@TODO free(databuffer)
	mov r0, #0
	mov pc, lr

HcdDeinitialise:
	mov r0, #0
	mov pc, lr
