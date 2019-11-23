*-----------------------------------------------------------
* Title      : GROUP0000
* Written by : Robert Stewart
* Description: Subroutine for dissembling ADDI and SUBI
*-----------------------------------------------------------

* main for group
GROUP0000:
    CLR.L   D3
    JSR G0_BITS_11_THRU_8
    JSR G0_BITS_7_AND_6
    JSR PRINT_IMMEDIATE_DATA
    JSR PRINT_OPERAND_SEPERATOR
    JSR G0_BITS_5_THRU_3
    JMP END_OF_VALID_INSTRUCTION
    
* determines if addi or subi
G0_BITS_11_THRU_8:
    MOVE.L  D1, D3   
    ANDI.L    #$00000F00,   D3 
    CMPI.L  #$00000600, D3
    BEQ G0_IS_ADDI
    CMPI.L  #$00000400, D3
    BEQ G0_IS_SUBI
    JMP  ILLEGAL
    
*determines size
G0_BITS_7_AND_6:
    MOVE.L  D1, D3
    ANDI.L    #$000000C0,   D3
    CMPI.L  #$00000000, D3
    BEQ IS_BYTE
    CMPI.L  #$00000040, D3
    BEQ IS_WORD
    CMPI.L  #$00000080, D3
    BEQ IS_LONG    
    JMP ILLEGAL         

*determines effective address
G0_BITS_5_THRU_3:
    MOVE.L  D1, D3
    ANDI.L    #$00000038,   D3 
    CMPI.L  #$00000000, D3
    BEQ OPND_IS_D
    CMPI.L  #$00000010, D3
    BEQ OPND_IS_INDIRCET_AN
    CMPI.L  #$00000018, D3
    BEQ OPND_IS_INDIRCET_POST_AN
    CMPI.L  #$00000020, D3
    BEQ OPND_IS_INDIRCET_PRE_AN   
    CMPI.L  #$00000038, D3
    BEQ OPND_IS_ADDRESS
    JMP ILLEGAL     

*adds subi to string buffer
G0_IS_SUBI:
    MOVE.L  #$53554249, (A4)+
    RTS
* adds addi to string buffer
G0_IS_ADDI:
    MOVE.L  #$41444449, (A4)+
    RTS
    


