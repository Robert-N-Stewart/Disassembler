*-----------------------------------------------------------
* Title      : GROUP0010_AND_GROUP0011
* Written by : Robert Stewart   
* Description: Subroutine for group 0010 and 0011. move/movea 
*-----------------------------------------------------------
* main for group 0011
GROUP0011:
    CLR.L   D3
    MOVE.B  #$02,  D4    
    JMP G3_AND_G2_BITS_8_TRU_6

*main for group 0010
GROUP0010:
    CLR.L   D3
    MOVE.B  #$03,  D4    
    JMP G3_AND_G2_BITS_8_TRU_6
    
    * determines if move or movea
G3_AND_G2_BITS_8_TRU_6:
    MOVE.L  D1, D3
    ANDI.L    #$000001C0,   D3
    CMPI.L  #$00000040, D3
    BEQ IS_MOVEA
    JMP IS_MOVE
    
    *main for movea
IS_MOVEA:
    JSR MOVEA_TO_BUFF
    JSR G3_AND_G2_PRINT_SIZE
    JSR G3_AND_G2_BITS_5_TRU_3
    JSR PRINT_OPERAND_SEPERATOR
    JSR MOVEA_PRINT_A
    JMP END_OF_VALID_INSTRUCTION
    
    *main for move
IS_MOVE:
    JSR MOVE_TO_BUFF
    JSR G3_AND_G2_PRINT_SIZE    
    JSR G3_AND_G2_BITS_5_TRU_3
    JSR PRINT_OPERAND_SEPERATOR
    JSR MOVE_BITS_8_TRU_6
    JMP END_OF_VALID_INSTRUCTION 
    
    *moves movea to string buffer
MOVEA_TO_BUFF:
    MOVE.B  #$4D, (A4)+
    MOVE.B  #$4F, (A4)+
    MOVE.B  #$56, (A4)+
    MOVE.B  #$45, (A4)+
    MOVE.B  #$41, (A4)+ 
    MOVE.B  #$2E, (A4)+
    RTS
    *moves move to string buffer
MOVE_TO_BUFF:    
    MOVE.B  #$4D, (A4)+
    MOVE.B  #$4F, (A4)+
    MOVE.B  #$56, (A4)+
    MOVE.B  #$45, (A4)+
    MOVE.B  #$2E, (A4)+
    RTS
    
    *determines the size
G3_AND_G2_PRINT_SIZE:
    CMPI.B  #$02,   D4
    BEQ G3_AND_G2_IS_WORD
    CMPI.B  #$03,   D4
    BEQ G3_AND_G2_IS_LONG

* if its a word add w 
G3_AND_G2_IS_WORD:
    MOVE.B  #$57,   (A4)+
    MOVE.B  #$20,   (A4)+    
    RTS
    
    * if its a long add a l
G3_AND_G2_IS_LONG:
    MOVE.B  #$4C,   (A4)+   
    MOVE.B  #$20,   (A4)+
    RTS
    
    * determine source operand mode
G3_AND_G2_BITS_5_TRU_3:    
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
    
    * moves the a of movea to string buffer
MOVEA_PRINT_A:
    MOVE.B  #$41,   (A4)+
    JSR CONVERT_BITS_11_THRU_9_TO_BUFF
    RTS    

    *determines destination operand
MOVE_BITS_8_TRU_6:
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

    



