;------------------------------
; Simple Examples
;-----------------------------
;
;*************************************
; Main Program
;*************************************

SECTION  CODE

result:  DC.L                 $FF

main:
; Clear all data registers D0-D7
         CLR.L                d0
         CLR.L                d1
         CLR.L                d2
         CLR.L                d3
         CLR.L                d4
         CLR.L                d5
         CLR.L                d6
         CLR.L                d7
       
         ;indirekt 
         move.l               #05,d0         ;move.l, to fill the register with a long value        
         lea.l                result,a0      ;load effective address, to load the address of result into address register A0         ;move the value of d0 into the address pointed by a0                    
         add.l                d0,(a0)

         ;direkt
         move.l               #$FF,result
         add.l                d0,result

         rts                  

END