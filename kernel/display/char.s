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
