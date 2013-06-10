KbdLoad:
	@ HidUsageAttach[DesktopKeyboard] = KeyboardAttach;
        ldr r0, =HidGlobalUsageAttach
        ldr r1, =KeyboardAttach
        str r1, [r0, #0x6]

	mov pc, lr

KeyboardAttach:
	mov pc, lr
