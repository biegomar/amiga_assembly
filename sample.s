;------------------------------
; Simple Examples
;-----------------------------
;
;*************************************
; Main Program
;*************************************

SECTION           CODE

main:              
                  NOP
                  NOP                      
                  JSR       clrDataRegisters
                  JSR       addDirectReg
                  JSR       addDirectRegister
                  JSR       addDirectVariable
                  
                  move.l    #$10,d0
                  JSR       condition                                
                
                  move.l    #$20,d0
                  JSR       condition
            
                  move.l    #05,loopCounter
                  JSR       forloop

                  move.l    #10,loopCounter
                  JSR       forloop

                  move.l    #5,loopCounter
                  JSR       while

                  JSR       setErrorLevel
                  RTS  

;*************************************
; Subroutines
;*************************************

;--- set error level for OS --- 
setErrorLevel:
                  move.l    errorLevel,d0         ;D0 is result register for OS-functions. So set accordingly
                  RTS

;--- add 255 to a variable directly ---
addDirectVariable:
                  move.l    #$FF,d1
                  ADD.L     d1,directVarResult
                  RTS                

;--- add 255 to a variable indirectly ---
addIndirect:                  
                  lea.l     indirectResult,a0
                  move.l    #$FF,d1
                  ADD.L     d1,(a0)
                  RTS   

;--- clear all data registers ---
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

;--- add two direct registers and store result in directResult ---
addDirectRegister:
                  move.l    #$05,d0
                  move.l    #$FF,d1
                  ADD.L     d0,d1
                  ;move.l    d0,directResult
                  RTS

;--- add two direct registers and store result in directResult ---
addDirectReg:
                  move.l    #$0A,d2
                  move.l    #$0F,d3
                  ADD.L     d3,d2
                  move.l    d2,directResult
                  RTS   

;--- compare d0 with conditionValue ---
condition:
                  cmp.l     conditionValue,d0
                  beq       .equalLabel
.else:
                    ; Not equal
                  move.l    #$0,d4
                  bra       .endLabel
.equalLabel:
                    ; Equal
                  move.l    #$1,d4
.endLabel:
                  RTS       

;--- simple for loop ---
forloop:
                  CLR.L     d5 
                  sub.l     #1,loopCounter
                  move.l    loopCounter,d7        ; Initialize counter                
.loopStart:
                  add.b     #1,d5                 ; the big business calculation
                  dbra      d7,.loopStart         ; Decrement counter and loop if not zero 
                                    
                  RTS

while:
                  move.L    #1,d5
                  CLR.L     d6                    
.whileStart:
                  cmp.l     loopCounter,d6
                  bgt       .exitLoop
                  add.b     #1,d6
                  mulu      #2,d5
                  bra       .whileStart
.exitLoop:
                  NOP
                  RTS

;*************************************
; Variables
;*************************************

errorLevel:       DC.L      $0
directVarResult:  DC.L      $0
indirectResult:   DC.L      $0
directResult:     DC.L      $0
conditionValue:   DC.L      $10
loopCounter:      DC.L      $0

                  END