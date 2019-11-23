*-----------------------------------------------------------
* Title      : GROUP 0111
* Written by :  Robert Stewart
* Description:  Subroutine for grouping that contains moveq
*-----------------------------------------------------------
    * main for group
GROUP0111:
    JSR G7_BITS_8
    JSR PRINT_MOVEQ
    JSR G7_BITS_7_TRU_0
    JSR PRINT_OPERAND_SEPERATOR            
    JSR G7_PRINT_D
    JMP END_OF_VALID_INSTRUCTION    
    
    * determines if illegal
G7_BITS_8:
    MOVE.L  D1, D3
    ANDI.L  #$00000100, D3
    CMP.L   #$00000100, D3
    BEQ ILLEGAL
    RTS
 
 * moves moveq to string buffer
PRINT_MOVEQ:
    MOVE.B  #$4D,   (A4)+   
    MOVE.B  #$4F,   (A4)+   
    MOVE.B  #$56,   (A4)+   
    MOVE.B  #$45,   (A4)+   
    MOVE.B  #$51,   (A4)+   
    MOVE.B  #$2E,   (A4)+   
    MOVE.B  #$4C,   (A4)+ 
    MOVE.B  #$20,   (A4)+ 
    RTS

* moves byte data to string buffer
G7_BITS_7_TRU_0:
    MOVE.B  #$23,   (A4)+
    MOVE.B  #$24,   (A4)+    
    MOVE.W  D1, D6
    LSR.L   #04,    D6
    JSR NIBBLE_D6_TO_BUFFER
    MOVE.W  D1, D6
    JSR NIBBLE_D6_TO_BUFFER  
    RTS  

* prints D    
G7_PRINT_D:
    MOVE.B  #$44,   (A4)+
    JSR CONVERT_BITS_11_THRU_9_TO_BUFF
    RTS     
    


