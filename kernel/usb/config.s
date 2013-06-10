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
