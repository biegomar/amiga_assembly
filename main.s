;****************************************************************
; Amiga Assembly Programming
; Sample Program: main.s
;****************************************************************


;****************************************************************
; INCLUDES
;****************************************************************
          incdir     "include"
          include    "hw.i"

       
;****************************************************************
; MAIN PROGRAM
;****************************************************************
          SECTION    source,CODE
main:
          nop
          nop
          jsr        disable_os     ; takes the control of Amiga's hardware
    
mainloop  btst       #6,CIAAPRA     ; left mouse button pressed?
          bne.s      mainloop       ; if not, repeats the loop

          jsr        enable_os      ; releases the hw control to the O.S.
          rts

          END