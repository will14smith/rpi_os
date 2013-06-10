HubLoad:
	@ InterfaceClassAttach[InterfaceClassHub] = HubAttach;
	ldr r0, =UsbGlobalClassAttach
	ldr r1, =HubAttach
	str r1, [r0, #0x9]

	mov pc, lr

HubAttach:
	@TODO
	mov pc, lr
