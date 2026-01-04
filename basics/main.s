;****************************************************************
; Amiga Assembly Programming
; Sample Program: main.s
;****************************************************************


;****************************************************************
; INCLUDES
;****************************************************************
  incdir     "../include"
  include    "hw.i"
    

;****************************************************************
; MAIN PROGRAM
;****************************************************************
  SECTION    source,CODE
main:
  nop
  nop
  
  moveq      #1,d1          

checkEqual: 
  cmp        #1,d1
  beq.s      equal

checkGreater:
  cmp        #0,d1
  bgt.s      greater

checkGreaterEqual:
  cmp        #0,d1
  bge.s      greaterEqual
  
checkLess:
  cmp        #3,d1
  blt.s      less

checkLessEqual:
  cmp        #1,d1
  ble.s      lessEqual

checkNotEqual:
  cmp        #2,d1
  bne.s      notEqual

checkAndMask:
  move.l     #$FFFFFFFF,d2
  andi.w     #$00FF,d2                        
  beq.s      andMask              ; nothing will happen
  andi.w     #0,d2                ; will set Z flag           
  beq.s      andMask              ; compare result is zero

checkExg:
  move.l     #1,d1
  move.l     #$FFFFFFFF,d2
  exg        d1,d2                ; swap registers
  cmpi.w     #1,d2
  beq.s      exchange             ; compare result is one

checkExgZero:
  move.l     #0,d1
  move.l     #$FFFFFFFF,d2
  exg        d1,d2                ; swap registers - not setting Z flag!
  beq.s      exchangeZero         ; d2 is zero?
  
  nop
  bra.s      exchangeZero

checkLeftShift:
  move.l     #16,d1
  lsl.l      #1,d1                ; left shift d1 by 1
  cmpi.b     #32,d1
  beq.s      leftShift            ; d1 is 32?

checkRightShift:
  lsr.l      #1,d1                ; right shift d1 by 1
  cmpi.b     #16,d1
  beq.s      rightShift           ; d1 is 16?

checkRotateLeft:
  clr.l      d1
  move.b     #%10101010,d1
.twice:
  rol.b      #1,d1                ; rotate left d1 by 1
  cmpi.b     #%10101010,d1
  beq.s      rotateLeft
  bra.s      .twice

checkRotateRight:
  clr.l      d1
  move.l     #%10101010,d1
.twice:
  ror.b      #1,d1                ; rotate left d1 by 1
  cmpi.b     #%10101010,d1
  beq.s      rotateRight
  bra.s      .twice
  
  bra.s      mainloop

; ****************************************************************
; BRANCH TABLE
; ****************************************************************

equal:
  bra.s      checkGreater

greater:
  bra.s      checkGreaterEqual

greaterEqual:
  bra.s      checkLess

less:
  bra.s      checkLessEqual

lessEqual:
  bra.s      checkNotEqual

notEqual:
  bra.s      checkAndMask

andMask:
  bra.s      checkExg

exchange:
  bra.s      checkExgZero

exchangeZero:
  bra.s      checkLeftShift

leftShift:
  bra.s      checkRightShift

rightShift:
  bra.s      checkRotateLeft 
    
rotateLeft:
  bra.s      checkRotateRight

rotateRight:
  bra.s      mainloop

mainloop: 
  btst       #6,CIAAPRA           ; wait for button release              
  bne.s      mainloop

  
  moveq      #0,d0                ; Exit code 0
  rts