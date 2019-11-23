*-----------------------------------------------------------
* Title      : GROPU 1011
* Written by : Robert Stewart
* Description: subroutine gor group 1011
*-----------------------------------------------------------

* main for group
GROUP1011:
    CLR.L   D3
    JSR GB_IS_CMP
    JSR GB_BITS_8_THRU_6
    JSR GB_BITS_5_THRU_3
    JSR PRINT_OPERAND_SEPERATOR    
    JSR GB_PRINT_D
    JMP END_OF_VALID_INSTRUCTION
    
    * moves cmp to string buffer
GB_IS_CMP:
    MOVE.B  #$43,   (A4)+
    MOVE.B  #$4D,   (A4)+
    MOVE.B  #$50,   (A4)+
    RTS    
    
    * determines size
GB_BITS_8_THRU_6:
    MOVE.L  D1, D3
    ANDI.L    #$000001C0,   D3
    CMPI.L  #$00000000, D3
    BEQ IS_BYTE
    CMPI.L  #$00000040, D3
    BEQ IS_WORD
    CMPI.L  #$00000080, D3
    BEQ IS_LONG    
    JMP ILLEGAL 

* determines source operand
GB_BITS_5_THRU_3:
    MOVE.L  D1, D3
    ANDI.L    #$00000038,   D3 
    CMPI.L  #$00000000, D3
    BEQ OPND_IS_D
    CMPI.L  #$00000008, D3
    BEQ OPND_IS_AN
    CMPI.L  #$00000010, D3
    BEQ OPND_IS_INDIRCET_AN
    CMPI.L  #$00000018, D3
    BEQ OPND_IS_INDIRCET_POST_AN
    CMPI.L  #$00000020, D3
    BEQ OPND_IS_INDIRCET_PRE_AN   
    CMPI.L  #$00000038, D3
    BEQ OPND_IS_ADDRESS_OR_IMMEDIATE
    JMP ILLEGAL

* prints d
GB_PRINT_D:
    MOVE.B  #$44,   (A4)+
    JSR CONVERT_BITS_11_THRU_9_TO_BUFF
    RTS     

