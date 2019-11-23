*-----------------------------------------------------------
* Title      : GROUP0001
* Written by :  ROBERT STEWART
* Description: Subroutine for grouping 0001, move.b
*-----------------------------------------------------------
* main for group
GROUP0001:
    CLR.L   D3
    JSR MOVEB_TO_BUFF
    JSR G1_BITS_5_TRU_3
    JSR PRINT_OPERAND_SEPERATOR        
    JSR G1_BITS_8_TRU_6 
    JMP END_OF_VALID_INSTRUCTION
    
    * addes move.b to string buffer
MOVEB_TO_BUFF:
    MOVE.B  #$4D, (A4)+
    MOVE.B  #$4F, (A4)+
    MOVE.B  #$56, (A4)+
    MOVE.B  #$45, (A4)+
    MOVE.B  #$2E, (A4)+
    MOVE.B  #$42, (A4)+
    MOVE.B  #$20, (A4)+    
    RTS    

*determines source ea
G1_BITS_5_TRU_3:
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
    
    *determines destination ea
G1_BITS_8_TRU_6:
    MOVE.L  D1, D3
    ANDI.L    #$000001C0,   D3
    CMPI.L  #$00000000, D3
    BEQ DES_OPND_IS_D
    CMPI.L  #$00000080, D3
    BEQ DES_OPND_IS_INDIRCET_AN
    CMPI.L  #$000000C0, D3
    BEQ DES_OPND_IS_INDIRCET_POST_AN
    CMPI.L  #$00000100, D3
    BEQ DES_OPND_IS_INDIRCET_PRE_AN   
    CMPI.L  #$000001C0, D3
    BEQ DES_OPND_IS_ADDRESS
    JMP ILLEGAL



