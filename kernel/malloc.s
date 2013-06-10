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
