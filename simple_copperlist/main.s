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
  jsr        disable_os      ; takes the control of Amiga's hardware                  
    
mainloop: 
  btst       #6,CIAAPRA      ; wait for button release              
  bne.s      mainloop

  jsr        enable_os       ; releases the hw control to the O.S.
  moveq      #0,d0           ; Exit code 0
  rts