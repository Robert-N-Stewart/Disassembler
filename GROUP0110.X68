*-----------------------------------------------------------
* Title      : GROUP 0110
* Written by :  ROBERT STEWAR
* Description: Grouping for BCC
*-----------------------------------------------------------
* main for gouping
GROUP0110:
    JSR G6_BITS_11_TRU_8
    JSR CALC_DISPLACEMENT
    JMP END_OF_VALID_INSTRUCTION

* determines between bcc, ble, and bgt
G6_BITS_11_TRU_8
    MOVE.L  D1, D3
    ANDI.L  #$00000F00,   D3
    CMPI.L  #$00000400, D3
    BEQ IS_BCC
    CMPI.L  #$00000E00, D3
    BEQ IS_BGT
    CMPI.L  #$00000F00, D3
    BEQ IS_BLE
    JMP ILLEGAL
    
    * moves bcc to string buffer
IS_BCC:
    MOVE.B  #$42,   (A4)+
    MOVE.B  #$43,   (A4)+
    MOVE.B  #$43,   (A4)+
    MOVE.B  #$20,   (A4)+  
    MOVE.B  #$24,   (A4)+     
    RTS

* moves bgt to string buffer
IS_BGT:
    MOVE.B  #$42,   (A4)+
    MOVE.B  #$47,   (A4)+
    MOVE.B  #$54,   (A4)+
    MOVE.B  #$20,   (A4)+
    MOVE.B  #$24,   (A4)+     
    RTS
    
    * moves ble to string buffer
IS_BLE:
    MOVE.B  #$42,   (A4)+
    MOVE.B  #$4C,   (A4)+
    MOVE.B  #$45,   (A4)+
    MOVE.B  #$20,   (A4)+
    MOVE.B  #$24,   (A4)+    
    RTS
    
    * determines the displacement
CALC_DISPLACEMENT:
    MOVE.L  D1, D3
    ANDI.L  #$000000FF,   D3
    CMPI.L  #$00000000, D3
    BEQ CALC_16_BIT_DISPLACEMENT
    CMPI.L  #$000000FF, D3
    BEQ CALC_32_BIT_DISPLACEMENT 
    JMP CALC_8_BIT_DISPLACEMENT   

* calculates the 8 bit displacment
CALC_8_BIT_DISPLACEMENT:
    MOVE.L  A2,  D5
    MOVE.L  D1, D3
    ANDI.L  #$00000080,   D3
    CMPI.L  #$00000080, D3    
    BEQ CALC_NEG_8_BIT_DISPLACEMENT
    BNE CALC_POS_8_BIT_DISPLACEMENT

* calculates the 8 bit displacment for neg
CALC_NEG_8_BIT_DISPLACEMENT:    
    MOVE.L  D1, D3
    ANDI.L  #$000000FF,   D3
    NOT.B D3
    ADDI.B  #$01,   D3
    SUB.W   D3, D5
    JSR ADDRESS_IN_D5_TO_BUFFER
    RTS
    
* calculates the 8 bit displacment for pos    
CALC_POS_8_BIT_DISPLACEMENT:    
    MOVE.L  D1, D3
    ANDI.L  #$000000FF,   D3
    ADD.W   D3, D5
    JSR ADDRESS_IN_D5_TO_BUFFER
    RTS
    
* calculates the 16 bit displacment    
CALC_16_BIT_DISPLACEMENT:
    MOVE.L  A2,  D5    
    MOVE.W  (A2)+,  D7 
    MOVE.L  D7, D3
    ANDI.L  #$00008000,   D3
    CMPI.L  #$00008000, D3
    BEQ CALC_NEG_16_BIT_DISPLACEMENT
    BNE CALC_POS_16_BIT_DISPLACEMENT

* calculates the 16 bit displacment for neg
CALC_NEG_16_BIT_DISPLACEMENT:  
    MOVE.L  D7, D3
    NOT.W D3
    ADDI.B  #$01,   D3
    SUB.W   D3, D5
    JSR ADDRESS_IN_D5_TO_BUFFER
    RTS
    
* calculates the 16 bit displacment for pos    
CALC_POS_16_BIT_DISPLACEMENT:    
    MOVE.L  D7, D3
    ADD.W   D3, D5
    JSR ADDRESS_IN_D5_TO_BUFFER
    RTS    
    
    * calculates the 32 bit displacment
CALC_32_BIT_DISPLACEMENT:
    MOVE.L  A2,  D5    
    MOVE.L  (A2)+,  D7 
    MOVE.L  D7, D3
    ANDI.L  #$80000000,   D3
    CMPI.L  #$80000000, D3
    BEQ CALC_NEG_16_BIT_DISPLACEMENT
    BNE CALC_POS_16_BIT_DISPLACEMENT

* calculates the 32 bit displacment for neg
CALC_NEG_32_BIT_DISPLACEMENT:  
    MOVE.L  D7, D3
    NOT.L D3
    ADDI.B  #$01,   D3
    SUB.W   D3, D5
    JSR ADDRESS_IN_D5_TO_BUFFER
    RTS
    
    
* calculates the 32 bit displacment for pos    
CALC_POS_32_BIT_DISPLACEMENT:    
    MOVE.L  D7, D3
    ADD.W   D3, D5
    JSR ADDRESS_IN_D5_TO_BUFFER
    RTS       
    
    * moves calulated address to string buffer
ADDRESS_IN_D5_TO_BUFFER:
    MOVE.W  D5, D6
    LSR.L   #04,    D6        
    LSR.L   #08,    D6    
    LSR.L   #08,    D6
    LSR.L   #08,    D6    
    JSR NIBBLE_D6_TO_BUFFER
    MOVE.W  D5, D6
    LSR.L   #08,    D6    
    LSR.L   #08,    D6
    LSR.L   #08,    D6    
    JSR NIBBLE_D6_TO_BUFFER
    MOVE.W  D5, D6
    LSR.L   #04,    D6   
    LSR.L   #08,    D6
    LSR.L   #08,    D6    
    JSR NIBBLE_D6_TO_BUFFER
    MOVE.W  D5, D6
    LSR.L   #08,    D6
    LSR.L   #08,    D6    
    JSR NIBBLE_D6_TO_BUFFER
    MOVE.W  D5, D6
    LSR.L   #08,    D6
    LSR.L   #04,    D6    
    JSR NIBBLE_D6_TO_BUFFER
    MOVE.W  D5, D6    
    LSR.L   #08,    D6
    JSR NIBBLE_D6_TO_BUFFER
    MOVE.W  D5, D6
    LSR.L   #04,    D6
    JSR NIBBLE_D6_TO_BUFFER
    MOVE.W  D5, D6
    JSR NIBBLE_D6_TO_BUFFER
    RTS    
    




