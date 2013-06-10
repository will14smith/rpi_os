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
string(malloc: %x size: %u\n)

free_format:
string(free:   %x size: %u\n)

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
