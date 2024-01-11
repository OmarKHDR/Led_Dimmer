ORG 00H
   LJMP MAIN
   
ORG 40H
MAIN:
;=================================================================;
;=================================================================;
   MOV TCON,#05H
   MOV IE,#85H
   MOV P1,#0FFH
   MOV P2,#0FFH
   MOV P2,#01000000B
   CLR CY
   MOV B,#5
   MOV A,#0H
   MOV R0,#0  
   MOV DPTR,#90H
;=================================================================;
;=================================================================;
   MAIN_LOOP:
      JMP @A+DPTR
   LJMP MAIN_LOOP
;=================================================================;
; DISPLAY IS USED TO POWER THE 7-SEGMENT 
;ALSO USED TO CALL CONTROL FUNCTIONS
;=================================================================;
DISPLAY:
   MOV A,R0
   MOV DPTR,#80H
   MOVC A,@A+DPTR
   MOV P2,A
   MOV DPTR,#90H
RET
;=================================================================;
;BASIC DELAY FUNCTION 125 INST AS CRYSTAL FREQ 12MHz AND 
;THE INSTRUCTION NEEDS TWO MACHINE CYCLE EQUALS TO 12 CLOCK PULSES
;SO BASIC DELAY IS 0.25ms AND FOR 8 LEVEL *2 MACHINE CYCLES
; THE PMW CYCLE SHOULD TAKE 4ms
;=================================================================;
DELAY:
   MOV R7,#125
   LP1:
   DJNZ R7,LP1
RET


;===============================================================;
; EX INTERRUPT 0 P3.2
;===============================================================;
ORG 03H
   CJNE R0,#8,CONT
   RETI
   CONT:
      INC R0 
      ACALL DISPLAY
      MOV A,R0
      MUL AB
      MOV B,#5
RETI
;==============================================================;
; EX INTERRUPT 1 P3.3
;==============================================================;
ORG 0013H
   CJNE R0,#0,CONT2
   RETI
   CONT2:
      DEC R0
      ACALL DISPLAY
      MOV A,R0
      MUL AB
      MOV B,#5
RETI  

;=================================================================;
;=================================================================;
ORG 80H
 LABEL: DB 01000000B,11111001B,10100100B,10110000B,10011001B,10010010B,10000010B,11111000B,10000000B

;=================================================================;
;=================================================================;
ORG 90H
   ACALL LEVEL0 
   LJMP MAIN_LOOP 
   ACALL LEVEL1 
   LJMP MAIN_LOOP 
   ACALL LEVEL2 
   LJMP MAIN_LOOP  
   ACALL LEVEL3 
   LJMP MAIN_LOOP   
   ACALL LEVEL4 
   LJMP MAIN_LOOP  
   ACALL LEVEL5 
   LJMP MAIN_LOOP  
   ACALL LEVEL6 
   LJMP MAIN_LOOP  
   ACALL LEVEL7 
   LJMP MAIN_LOOP 
   ACALL LEVEL8 
   LJMP MAIN_LOOP 

;=================================================================;
;============================:(===================================;
;=================================================================;
LEVEL0:
   SETB P1.0
   MOV R4,#8
   LEVEL0_LOOP:
      ACALL DELAY
   DJNZ R4,LEVEL0_LOOP
RET

LEVEL1:
   SETB P1.0
   MOV R4,#7
   LEVEL1_LOOP1:
      ACALL DELAY
   DJNZ R4,LEVEL1_LOOP1
   CLR P1.0
   MOV R4,#1
   LEVEL1_LOOP2:
      ACALL DELAY
   DJNZ R4,LEVEL1_LOOP2    
RET
      
LEVEL2:
   SETB P1.0
   MOV R4,#6
   LEVEL2_LOOP1:
      ACALL DELAY
   DJNZ R4,LEVEL2_LOOP1
   CLR P1.0
   MOV R4,#2
   LEVEL2_LOOP2:
      ACALL DELAY
   DJNZ R4,LEVEL2_LOOP2    
RET      
LEVEL3:
   SETB P1.0
   MOV R4,#5
   LEVEL3_LOOP1:
      ACALL DELAY
   DJNZ R4,LEVEL3_LOOP1
   CLR P1.0
   MOV R4,#3
   LEVEL3_LOOP2:
      ACALL DELAY
   DJNZ R4,LEVEL3_LOOP2    
RET      
LEVEL4:
   SETB P1.0
   MOV R4,#4
   LEVEL4_LOOP1:
      ACALL DELAY
   DJNZ R4,LEVEL4_LOOP1
   CLR P1.0
   MOV R4,#4
   LEVEL4_LOOP2:
      ACALL DELAY
   DJNZ R4,LEVEL4_LOOP2    
RET      
LEVEL5:
   SETB P1.0
   MOV R4,#3
   LEVEL5_LOOP1:
      ACALL DELAY
   DJNZ R4,LEVEL5_LOOP1
   CLR P1.0
   MOV R4,#5
   LEVEL5_LOOP2:
      ACALL DELAY
   DJNZ R4,LEVEL5_LOOP2    
RET      
LEVEL6:
   SETB P1.0
   MOV R4,#2
   LEVEL6_LOOP1:
      ACALL DELAY
   DJNZ R4,LEVEL6_LOOP1
   CLR P1.0
   MOV R4,#6
   LEVEL6_LOOP2:
      ACALL DELAY
   DJNZ R4,LEVEL6_LOOP2    
RET      
LEVEL7:
   SETB P1.0
   MOV R4,#1
   LEVEL7_LOOP1:
      ACALL DELAY
   DJNZ R4,LEVEL7_LOOP1
   CLR P1.0
   MOV R4,#7
   LEVEL7_LOOP2:
      ACALL DELAY
   DJNZ R4,LEVEL7_LOOP2    
RET      
LEVEL8:
   CLR P1.0
   MOV R4,#8
   LEVEL8_LOOP2:
      ACALL DELAY
   DJNZ R4,LEVEL8_LOOP2    
RET      

;=================================================================;

END