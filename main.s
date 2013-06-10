

.base 0x8000
mov sp, #0x8000
b main



heap_entry_table:
	.space 0x1000

.align 4
display_font0:
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x08000000
	.word 0x08080808
	.word 0x08080008
	.word 0x00000000
	.word 0x14000000
	.word 0x00141414
	.word 0x00000000
	.word 0x00000000
	.word 0x48480000
	.word 0x2424fe68
	.word 0x1212147f
	.word 0x00000000
	.word 0x10000000
	.word 0x1c12927c
	.word 0x7c929070
	.word 0x00001010
	.word 0x06000000
	.word 0x38460909
	.word 0x60909066
	.word 0x00000000
	.word 0x38000000
	.word 0x920c0404
	.word 0xbc46a2b2
	.word 0x00000000
	.word 0x08000000
	.word 0x00080808
	.word 0x00000000
	.word 0x00000000
	.word 0x10103000
	.word 0x08080808
	.word 0x10100808
	.word 0x00000020
	.word 0x08080c00
	.word 0x10101010
	.word 0x08081010
	.word 0x0000000c
	.word 0x10000000
	.word 0xd6387c92
	.word 0x00000010
	.word 0x00000000
	.word 0x00000000
	.word 0x7f080808
	.word 0x00080808
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x18180000
	.word 0x00000408
	.word 0x00000000
	.word 0x00000000
	.word 0x0000001c
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x18180000
	.word 0x00000000
	.word 0x40000000
	.word 0x10102020
	.word 0x04080818
	.word 0x00000204
	.word 0x38000000
	.word 0x92828244
	.word 0x38448282
	.word 0x00000000
	.word 0x1c000000
	.word 0x10101010
	.word 0x7c101010
	.word 0x00000000
	.word 0x7c000000
	.word 0x408080c2
	.word 0xfe041830
	.word 0x00000000
	.word 0x7c000000
	.word 0x38c08082
	.word 0x7cc280c0
	.word 0x00000000
	.word 0x60000000
	.word 0x44485850
	.word 0x4040fe42
	.word 0x00000000
	.word 0x7e000000
	.word 0xc03e0202
	.word 0x3cc28080
	.word 0x00000000
	.word 0x78000000
	.word 0xc67a0284
	.word 0x78c48282
	.word 0x00000000
	.word 0xfe000000
	.word 0x20204040
	.word 0x04081810
	.word 0x00000000
	.word 0x7c000000
	.word 0x7c828282
	.word 0x7c868282
	.word 0x00000000
	.word 0x3c000000
	.word 0xc6828246
	.word 0x3c4280bc
	.word 0x00000000
	.word 0x00000000
	.word 0x00181800
	.word 0x18180000
	.word 0x00000000
	.word 0x00000000
	.word 0x00181800
	.word 0x18180000
	.word 0x00000408
	.word 0x00000000
	.word 0x0e708000
	.word 0x0080700e
	.word 0x00000000
	.word 0x00000000
	.word 0x00fe0000
	.word 0x0000fe00
	.word 0x00000000
	.word 0x00000000
	.word 0xe01c0200
	.word 0x00021ce0
	.word 0x00000000
	.word 0x1c000000
	.word 0x08102022
	.word 0x08080008
	.word 0x00000000
	.word 0x78000000
	.word 0x92e284cc
	.word 0x04e29292
	.word 0x0000780c
	.word 0x10000000
	.word 0x44282828
	.word 0x82c67c44
	.word 0x00000000
	.word 0x7e000000
	.word 0x7e828282
	.word 0x7e828282
	.word 0x00000000
	.word 0x78000000
	.word 0x02020284
	.word 0x78840202
	.word 0x00000000
	.word 0x3e000000
	.word 0x82828242
	.word 0x3e428282
	.word 0x00000000
	.word 0xfe000000
	.word 0xfe020202
	.word 0xfe020202
	.word 0x00000000
	.word 0xfe000000
	.word 0xfe020202
	.word 0x02020202
	.word 0x00000000
	.word 0x78000000
	.word 0xc2020284
	.word 0x78848282
	.word 0x00000000
	.word 0x82000000
	.word 0xfe828282
	.word 0x82828282
	.word 0x00000000
	.word 0x3e000000
	.word 0x08080808
	.word 0x3e080808
	.word 0x00000000
	.word 0x38000000
	.word 0x20202020
	.word 0x1c222020
	.word 0x00000000
	.word 0x42000000
	.word 0x0e0a1222
	.word 0x42222212
	.word 0x00000000
	.word 0x02000000
	.word 0x02020202
	.word 0xfe020202
	.word 0x00000000
	.word 0xc6000000
	.word 0xaaaaaac6
	.word 0x82828292
	.word 0x00000000
	.word 0x86000000
	.word 0x928a8a86
	.word 0xc2c2a2a2
	.word 0x00000000
	.word 0x38000000
	.word 0x82828244
	.word 0x38448282
	.word 0x00000000
	.word 0x7e000000
	.word 0xc28282c2
	.word 0x0202027e
	.word 0x00000000
	.word 0x38000000
	.word 0x82828244
	.word 0x78448282
	.word 0x00004060
	.word 0x7e000000
	.word 0x7e8282c2
	.word 0x02828242
	.word 0x00000000
	.word 0x7c000000
	.word 0x7c060286
	.word 0x7dc280c0
	.word 0x00000000
	.word 0x7f000000
	.word 0x08080808
	.word 0x08080808
	.word 0x00000000
	.word 0x82000000
	.word 0x82828282
	.word 0x7c828282
	.word 0x00000000
	.word 0x82000000
	.word 0x444444c6
	.word 0x10282828
	.word 0x00000000
	.word 0x81000000
	.word 0x5a5a8181
	.word 0x6666665a
	.word 0x00000000
	.word 0xc6000000
	.word 0x10382844
	.word 0x82446c28
	.word 0x00000000
	.word 0x41000000
	.word 0x08141422
	.word 0x08080808
	.word 0x00000000
	.word 0xfe000000
	.word 0x102060c0
	.word 0xfe060c08
	.word 0x00000000
	.word 0x08083800
	.word 0x08080808
	.word 0x08080808
	.word 0x00000038
	.word 0x02000000
	.word 0x08080404
	.word 0x20101018
	.word 0x00004020
	.word 0x10101c00
	.word 0x10101010
	.word 0x10101010
	.word 0x0000001c
	.word 0x08000000
	.word 0x00632214
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x007f0000
	.word 0x10080000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x40443800
	.word 0x5c62427c
	.word 0x00000000
	.word 0x02020200
	.word 0x42663e02
	.word 0x3e664242
	.word 0x00000000
	.word 0x00000000
	.word 0x02443800
	.word 0x38440202
	.word 0x00000000
	.word 0x40404000
	.word 0x42667c40
	.word 0x7c664242
	.word 0x00000000
	.word 0x00000000
	.word 0x42663c00
	.word 0x3c46027e
	.word 0x00000000
	.word 0x08083000
	.word 0x08083e08
	.word 0x08080808
	.word 0x00000000
	.word 0x00000000
	.word 0x42667c00
	.word 0x5c664242
	.word 0x00384440
	.word 0x02020200
	.word 0x42463a02
	.word 0x42424242
	.word 0x00000000
	.word 0x00000800
	.word 0x08080e00
	.word 0x3e080808
	.word 0x00000000
	.word 0x00001000
	.word 0x10101c00
	.word 0x10101010
	.word 0x000e1010
	.word 0x02020200
	.word 0x0a122202
	.word 0x4222120e
	.word 0x00000000
	.word 0x08080e00
	.word 0x08080808
	.word 0x70080808
	.word 0x00000000
	.word 0x00000000
	.word 0x9292fe00
	.word 0x92929292
	.word 0x00000000
	.word 0x00000000
	.word 0x42463a00
	.word 0x42424242
	.word 0x00000000
	.word 0x00000000
	.word 0x42663c00
	.word 0x3c664242
	.word 0x00000000
	.word 0x00000000
	.word 0x42663e00
	.word 0x3e664242
	.word 0x00020202
	.word 0x00000000
	.word 0x42667c00
	.word 0x5c664242
	.word 0x00404040
	.word 0x00000000
	.word 0x044c3c00
	.word 0x04040404
	.word 0x00000000
	.word 0x00000000
	.word 0x02423c00
	.word 0x3c42403c
	.word 0x00000000
	.word 0x08000000
	.word 0x08087e08
	.word 0x70080808
	.word 0x00000000
	.word 0x00000000
	.word 0x42424200
	.word 0x5c624242
	.word 0x00000000
	.word 0x00000000
	.word 0x24664200
	.word 0x18183c24
	.word 0x00000000
	.word 0x00000000
	.word 0x5a818100
	.word 0x24245a5a
	.word 0x00000000
	.word 0x00000000
	.word 0x18246600
	.word 0x66241818
	.word 0x00000000
	.word 0x00000000
	.word 0x24444200
	.word 0x10182824
	.word 0x000c0810
	.word 0x00000000
	.word 0x20407e00
	.word 0x7e020418
	.word 0x00000000
	.word 0x08083800
	.word 0x08060808
	.word 0x08080808
	.word 0x00000030
	.word 0x08080800
	.word 0x08080808
	.word 0x08080808
	.word 0x00000808
	.word 0x08080e00
	.word 0x08300808
	.word 0x08080808
	.word 0x00000006
	.word 0x00000000
	.word 0x9c000000
	.word 0x00000062
	.word 0x00000000
	.word 0xffffffff
	.word 0xffffffff
	.word 0xffffffff
	.word 0xffffffff



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
@	.word 0x74736554
	.word 0x20252520
	.word 0x25207325
	.word 0x75252069
	.word 0x0a782520
	.word 0x00000000

@test_string:
@	.word 0x6c65480a
	.word 0x57206f6c
	.word 0x646c726f
	.word 0x00000000


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

@ Heap Entry
@	uint32_t size
@	void*    address
@	entry*   next

heap_entry_globals:
	.word 0x0 @ free_head
	.word 0x0 @ alloc_head

mmlist_next_slot:
	@ ret = next empty entry in alloc table
	ldr r0, =heap_entry_table
	add r0, r0, #4

	@ TODO add overflow check?
	mnsLoop:
		ldr r1, [r0]
		teq r1, #0
		subeq r0, r0, #4
		moveq pc, lr

		add r0, r0, #12

		b mnsLoop

mmlist_insert:
	@ r0 = head, r1 = addr, r2 = size
	push {r4-r6, lr}

	mov r4, r0
	mov r5, r1
	mov r6, r2

	bl mmlist_next_slot

	str r6, [r0]
	str r5, [r0, #4]

	ldr r1, [r4, #4]
	cmp r1, r5
	bmi mliLoop

		str r4, [r0, #8]

		ldr r1, =heap_entry_globals
		ldr r2, [r1]
 		teq r2, r4

		streq r0, [r1]
		strne r0, [r1,#4]

		pop {r4-r6, pc}

	mliLoop:
		ldr r1, [r4,#8]
		teq r1, #0

		streq r0, [r4,#8]
		moveq r1, #0
		streq r1, [r0,#8]
		popeq {r4-r6, pc}

		ldr r2, [r1,#4]
		cmp r2, r5

		strgt r1, [r0,#8]
		strgt r0, [r4,#8]
		popgt {r4-r6, pc}

		mov r4,r1
		b mliLoop

mm_init:
	push {lr}

	bl mmlist_next_slot
	ldr r1, =heap_entry_globals
	str r0, [r1]

	ldr r1, =0x8000000
	str r1, [r0]
	ldr r1, =0x2000000
	str r1, [r0,#4]
	mov r1, #0
	str r1, [r0,#8]

	bl mmlist_next_slot
	ldr r1, =heap_entry_globals+4
	str r0, [r1]

	ldr r1, =0x0100000
	str r1, [r0]
	ldr r1, =0x1F00000
	str r1, [r0,#4]
	mov r1, #0
	str r1, [r0,#8]

	pop {pc}

malloc:
	@ r0 = size, ret = ptr
	push {r4-r5, lr}

	mov r4, r0

	@ if !free_head mm_init
	ldr r0, =heap_entry_globals
	ldr r0, [r0]

	teq r0, #0
	bleq mm_init

	@ cur = free_head, prev = NULL
	ldr r0, =heap_entry_globals
	ldr r0, [r0]
	mov r1, #0

	mallocLoop:
		@ if !cur return
		teq r0, #0
		popeq {r4-r5,pc}

		@if cur->size >= size break
		ldr r2, [r0]
		cmp r2, r4
		movlt r1,r0
		ldrlt r0, [r0,#8]
		blt mallocLoop

	@ cur->size -= size
	ldr r3, [r0,#4]
	sub r2, r2, r4
	str r2, [r0]

	@ if !prev prev = &free_head
	teq r1, #0
	ldreq r1, =heap_entry_globals-8

	@ if !cur->size prev->next = cur->next
	@	   cur = NULL
	teq r2, #0
	ldreq r5, [r0,#8]
	streq r5, [r1,#8]
	moveq r5, #0
	streq r5, [r0,#4]
	streq r5, [r0,#8]

	@ else curr->addr += size
	addne r2, r3, r4
	strne r2, [r0, #4]

	@ mmlist_insert(alloc_head, addr, size);
	ldr r0, =heap_entry_globals+4
	ldr r0, [r0]
	mov r1, r3
	mov r2, r4
	mov r4, r1

	bl mmlist_insert

	mov r0, r4
	pop {r4-r5, pc}

free:
	@ r0 = ptr
	push {r4, lr}

	mov r3, r0

	@ cur = alloc_head, prev = null
	ldr r0, =heap_entry_globals+4
        ldr r0, [r0]
	mov r1, #0

	freeLoop1:
		@ if !cur error!
		teq r0, #0
		popeq {r4, pc}

		@ if cur->addr==addr break
		ldr r2, [r0,#4]
		teq r2, r3
		beq freeLoopEnd1

		@ prev = cur, cur = cur->next
		mov r1,r0
		ldr r0, [r0,#8]

		b freeLoop1
	freeLoopEnd1:

	ldr r4, [r0]

	@ if !prev prev=&alloc_head
	ldr r2, [r0,#8]
	teq r1, #0
	ldreq r1, =heap_entry_globals-4
	@ prev->next = cur->next
	str r2, [r1,#8]

	ldr r2, [r0]
	mov r1, r3

	@ cur = null
	mov r3, #0
	str r3, [r0]
	str r3, [r0,#4]
	str r3, [r0,#8]

	@ mmlist_insert(free_head, addr, size)
	ldr r0, =heap_entry_globals
        ldr r0, [r0]
	bl mmlist_insert

	@ Merge adjacent blocks
	ldr r1, =heap_entry_globals
	ldr r1, [r1]
	ldr r0, [r1,#8]

	freeLoop2:
		teq r0, #0
		beq freeLoopEnd2

		ldr r2, [r1]
		ldr r3, [r1,#4]
		add r2, r2, r3
		ldr r3, [r0,#4]

		teq r2, r3
		movne r1, r0
		ldrne r0, [r0,#8]
		bne freeLoop2

		@ perform merge
		ldr r2, [r1]
		ldr r3, [r0]
		add r2, r2, r3
		str r2, [r1]

		ldr r2, [r0, #8]
		str r2, [r1, #8]

		mov r2, #0
		str r0, [r0]
		str r0, [r0,#4]
		str r0, [r0,#8]

		ldr r0, [r1,#8]

		b freeLoop2
	freeLoopEnd2:

	mov r0, r4

	pop {r4,pc}


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

.align 4
fb_info:
        .word 1024      @  0 Width
        .word 768       @  4 Height
        .word 1024      @  8 VWidth
        .word 768       @ 12 VHeight
        .word 0         @ 16 GPU Pitch
        .word 16        @ 20 Bit Depth
        .word 0         @ 24 X
        .word 0         @ 28 Y
        .word 0         @ 32 GPU Pointer
        .word 0         @ 36 GPU Size

GraphicsAddress:
	.word 0

SetGraphicsAddress:
	ldr r1, =GraphicsAddress
	str r0,[r1]
	mov pc,lr

InitialiseFrameBuffer:
	@ r0 = width, r1 = height, r2 = bitdepth
	cmp r0,#4096
	cmpls r1,#4096
	cmpls r2,#32
	movhi r0,#0
	movhi pc,lr

	push {r4, lr}

	ldr r4, =fb_info
	str r0,[r4]
	str r1,[r4,#4]
	str r0,[r4,#8]
	str r1,[r4,#12]
	str r2,[r4,#20]

	mov r0,r4
	mov r1,#1
	bl MailboxWrite

	mov r0,#1
	bl MailboxRead

	teq r0,#0
	movne r0,#0
	popne {r4,pc}

	ifbWait:
		ldr r0,[r4,#32]
		teq r0,#0
		beq ifbWait

	mov r0,r4
	pop {r4, pc}

ForeColour:
	.word 0xFFFF

SetForeColour:
	cmp r0,#0x10000
	movhi pc,lr
	moveq pc,lr

	ldr r1, =ForeColour
	strh r0,[r1]
	mov pc,lr

DrawPixel:
	ldr r2, =GraphicsAddress
	ldr r2,[r2]
	ldr r3,[r2,#4]
	sub r3,r3,#1
	cmp r1,r3
	movhi pc,lr

	ldr r3,[r2,#0]
	sub r3,r3,#1
	cmp r0,r3
	movhi pc,lr

	ldr r2,[r2,#32]
	add r3,r3,#1
	mla r0,r1,r3,r0
	add r2,r2,r0,lsl #1

	ldr r3, =ForeColour
	ldrh r3,[r3]
	strh r3,[r2]

	mov pc,lr

DrawCharacter:
  cmp r0,#127
  movhi r0,#0
  movhi r1,#0
  movhi pc,lr

  push {r4-r8,lr}
  mov r4,r1
  mov r5,r2
  ldr r6,=display_font0
  add r6,r6,r0,lsl #4

  dcLineLoop:
    ldrb r7,[r6]
    mov r8,#8

    dcPixelLoop:
      subs r8,r8,#1
      blt dcPixelLoopEnd
      lsl r7,#1
      tst r7,#0x100
      beq dcPixelLoop

      add r0,r4,r8
      mov r1,r5
      bl DrawPixel

      teq r8,#0
      bne dcPixelLoop
    dcPixelLoopEnd:

    add r5,r5,#1
    add r6,r6,#1
    tst r6,#0xf
    bne dcLineLoop

  mov r0,#8
  mov r1,#16

  pop {r4-r8,pc}


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

UsbConfigLoad:
	push {lr}

@	bl PlatformLoad
@	bl Arm6Load
@	bl Bcm2835Load
@	bl UsbLoad
@	bl DwcLoad
	bl HidLoad
	bl HubLoad
	bl KbdLoad

	pop {pc}

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
	.word 0x3a444348
	.word 0x72614820
	.word 0x72617764
	.word 0x25203a65
	.word 0x25632563
	.word 0x78252e78
	.word 0x78257825
	.word 0x43422820
	.word 0x2978254d
	.word 0x0000000a

_hcdInitHWFormat2:
	.word 0x3a444348
	.word 0x72614820
	.word 0x72617764
	.word 0x6f632065
	.word 0x6769666e
	.word 0x7825203a
	.word 0x20782520
	.word 0x25207825
	.word 0x00000a78

_hcdInitHWFormat3:
	.word 0x3a444348
	.word 0x736f4820
	.word 0x6f632074
	.word 0x6769666e
	.word 0x7825203a
	.word 0x0000000a

_hcdInitHWStr1:
	.word 0x3a444348
	.word 0x776f5020
	.word 0x6e697265
	.word 0x53552067
	.word 0x6e6f2042
	.word 0x00000a2e

_hcdInitHWStr2:
	.word 0x3a444348
	.word 0x69614620
	.word 0x2064656c
	.word 0x70206f74
	.word 0x7265776f
	.word 0x206e6f20
	.word 0x20425355
	.word 0x74736f48
	.word 0x6e6f4320
	.word 0x6c6f7274
	.word 0x2e72656c
	.word 0x0000000a

_hcdInitHWStr3:
	.word 0x3a444348
	.word 0x616f4c20
	.word 0x6f632064
	.word 0x656c706d
	.word 0x2e646574
	.word 0x0000000a


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

	pop {r4-r9, pc}

_hcdStartFormat1:
	.word 0x3a444348
	.word 0x504c5520
	.word 0x53462049
	.word 0x6320534c
	.word 0x69666e6f
	.word 0x25203a67
	.word 0x00000069


HcdStop:
	@TODO
	mov pc, lr

HcdDeinitialise:
	@TODO
	mov pc, lr

HubLoad:
	@ InterfaceClassAttach[InterfaceClassHub] = HubAttach;
	ldr r0, =UsbGlobalClassAttach
	ldr r1, =HubAttach
	str r1, [r0, #0x9]

	mov pc, lr

HubAttach:
	@TODO
	mov pc, lr

HidGlobalUsageAttach:
	.space 0x28 @ 10*sizeof(void*)

HidLoad:
	@ InterfaceClassAttach[InterfaceClassHid] = HidAttach;
        ldr r0, =UsbGlobalClassAttach
        ldr r1, =HidAttach
        str r1, [r0, #0x3]

	mov pc, lr

HidAttach:
	mov pc, lr

KbdLoad:
	@ HidUsageAttach[DesktopKeyboard] = KeyboardAttach;
        ldr r0, =HidGlobalUsageAttach
        ldr r1, =KeyboardAttach
        str r1, [r0, #0x6]

	mov pc, lr

KeyboardAttach:
	mov pc, lr



program:
	push {r4-r9,lr}

	mov r0, #16
	bl program_alloc
	mov r4, r0

	mov r0, #16
	bl program_alloc
	mov r5, r0

	mov r0, #16
	bl program_alloc
	mov r6, r0

	mov r0, r5
	bl program_free

	mov r0, #32
        bl program_alloc
        mov r5, r0

        mov r0, r6
        bl program_free

        mov r0, #32
        bl program_alloc
        mov r5, r0

	mov r0, r5
        bl program_free

	pop {r4-r9,pc}

malloc_format:
	.word 0x6c6c616d
	.word 0x203a636f
	.word 0x73207825
	.word 0x3a657a69
	.word 0x0a752520
	.word 0x00000000


free_format:
	.word 0x65657266
	.word 0x2020203a
	.word 0x73207825
	.word 0x3a657a69
	.word 0x0a752520
	.word 0x00000000


program_alloc:
	push {r4, lr}
	push {r0}

        bl malloc

	mov r4, r0

        push {r0}
        ldr r0, =malloc_format
        bl PrintF
	pop {r0}
	pop {r0}

	mov r0, r4

	pop {r4, pc}

program_free:
        push {r4, lr}

	push {r0}
        bl free

        mov r4, r0

	pop {r1}
	push {r0}
	push {r1}
        ldr r0, =free_format
        bl PrintF
	pop {r0}
	pop {r0}


        mov r0, r4

        pop {r4, pc}



