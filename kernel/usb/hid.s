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
