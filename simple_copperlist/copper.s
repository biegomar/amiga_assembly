;****************************************************************
; Amiga Assembly Programming
; Sample Program: copper.s
;****************************************************************
  
;****************************************************************
; INCLUDES
;****************************************************************
  incdir     "../include"
  include    "hw.i"

;****************************************************************
; Simple Copperlist
;****************************************************************
  SECTION    cpolst,DATA_C
  
  xdef       copperlist       ; copperlist global
copperlist:
  dc.w       BPLCON0,$0200    ; set to LORES
  dc.w       COLOR00,$000F    ; set color 0 to blue
  dc.w       $c001,$fffe      ; WAIT line 192
  dc.w       COLOR00,$0000    ; set color 0 to black
  dc.w       $ffff,$fffe      ; wait for vertical blanking

  xdef       copperlistAlt    ; copperlist global
copperlistAlt:
  dc.w       BPLCON0,$0200    ; set to LORES
  dc.w       COLOR00,$00FF    ; set color 0 to blue
  dc.w       $b001,$fffe      ; WAIT line 176
  dc.w       COLOR00,$00A0    ; set color 0 to green
  dc.w       $ffff,$fffe      ; wait for vertical blanking  