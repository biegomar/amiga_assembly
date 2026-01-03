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
              jsr        disable_os                   ; takes the control of Amiga's hardware                  
    
mainloop: 
              btst       #6,CIAAPRA                   ; left mouse button pressed?
              beq.s      .toggle_copper               ; if pressed, toggle copperlist
              bra.s      mainloop                     ; if not, repeat loop

.toggle_copper:
              tst.w      toggle_flag                  ; Check current state
              beq.s      .jump_to_cop2                ; if 0, jump to copperlist 2
                    
              move.l     #copperlist,COP1LC(a5)              
              move.w     #0,toggle_flag
              bra.s      .wait_release
          
.jump_to_cop2:          
              move.l     #copperlistAlt,COP1LC(a5)
              move.w     #1,toggle_flag
          
.wait_release:
              btst       #6,CIAAPRA                   ; wait for button release
              beq.s      .wait_release
              bra.s      mainloop

              jsr        enable_os                    ; releases the hw control to the O.S.
              moveq      #0,d0                        ; Exit code 0
              rts

;****************************************************************
; VARIABLES
;****************************************************************

toggle_flag:  dc.w       0                            ; 0 = COP1LC, 1 = COP2LC
              END