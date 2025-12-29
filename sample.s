;------------------------------
; Simple Examples
;-----------------------------
;
;*************************************
; Main Program
;*************************************

SECTION           CODE

;*************************************
; Variables
;*************************************

directVarResult:  DC.L      $0
indirectResult:   DC.L      $0

main:
                  JSR       clrDataRegisters
                  JSR       addDirectRegister
                  JSR       addDirectVariable
                  JSR       addIndirect              

                  rts  

;*************************************
; Subroutines
;*************************************
clrDataRegisters:
                  CLR.L     d0
                  CLR.L     d1
                  CLR.L     d2
                  CLR.L     d3
                  CLR.L     d4
                  CLR.L     d5
                  CLR.L     d6
                  CLR.L     d7
                  RTS 

addDirectRegister:
                  move.l    #$05,d0
                  move.l    #$FF,d1
                  ADD.L     d1,d0
                  RTS

addDirectVariable:
                  move.l    #$FF,d1
                  ADD.L     d1,directVarResult
                  RTS                

addIndirect:
                  move.l    #$05,d0
                  lea.l     indirectResult,a0
                  move.l    #$FF,d1
                  ADD.L     d1,(a0)
                  RTS             

END