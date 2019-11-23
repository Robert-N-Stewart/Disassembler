*-----------------------------------------------------------
* Title      : Rob_Utilities
* Written by : Robert Stewart
* Description: Utilities file for all subroutines that are used across groupings
*-----------------------------------------------------------
* moves .b to string buffer
IS_BYTE:
    * D4 used is for tracking size: 1 for byte and word, 2 for long
    MOVE.B #$2E, (A4)+
    MOVE.B #$42, (A4)+    
    MOVE.B  #$20,   (A4)+
    MOVE.B  #$01,   D4
    RTS

* moves .w to string buffer
IS_WORD:
    * D4 used is for tracking size: 1 for byte and word, 2 for long
    MOVE.B  #$2E, (A4)+
    MOVE.B #$57, (A4)+    
    MOVE.B  #$20,   (A4)+    
    MOVE.B  #$02,   D4   
    RTS
    
    * moves .l to string buffer
IS_LONG:
    * D4 used is for tracking size: 1 for byte and word, 2 for long   
    MOVE.B  #$2E, (A4)+
    MOVE.B  #$4C, (A4)+    
    MOVE.B  #$20,   (A4)+  
    MOVE.B  #$03,   D4
    RTS
    
    *moves d to buffer and converts bits for reg number
OPND_IS_D:
    MOVE.B  #$44, (A4)+
    JSR CONVERT_BITS_2_THRU_0_TO_BUFF
    RTS

    *moves a to buffer and converts bits for reg number
OPND_IS_AN:
    CMPI.L  #$00000001, D4
    BEQ ILLEGAL
    MOVE.B  #$41, (A4)+    
    JSR CONVERT_BITS_2_THRU_0_TO_BUFF  
    RTS    
    
    *moves (a) to buffer and converts bits for reg number    
OPND_IS_INDIRCET_AN:
    MOVE.B  #$28, (A4)+
    MOVE.B  #$41, (A4)+    
    JSR CONVERT_BITS_2_THRU_0_TO_BUFF  
    MOVE.B  #$29, (A4)+     
    RTS
    
    *moves (a)+ to buffer and converts bits for reg number
OPND_IS_INDIRCET_POST_AN:
    MOVE.B  #$28, (A4)+
    MOVE.B  #$41, (A4)+    
    JSR CONVERT_BITS_2_THRU_0_TO_BUFF 
    MOVE.B  #$29, (A4)+
    MOVE.B  #$2B, (A4)+ 
    RTS
 
     *moves -(a) to buffer and converts bits for reg number
OPND_IS_INDIRCET_PRE_AN:  
    MOVE.B  #$2D, (A4)+
    MOVE.B  #$28, (A4)+
    MOVE.B  #$41, (A4)+      
    JSR CONVERT_BITS_2_THRU_0_TO_BUFF
    MOVE.B  #$29, (A4)+    
    RTS
    
          *moves $ to buffer moves address to buffer
OPND_IS_ADDRESS:
    MOVE.L  D1, D3
    ANDI.L    #$00000007,   D3 
    CMPI.L  #$00000000, D3
    BEQ PRINT_WORD_ADDRESS
    CMPI.L  #$00000001, D3
    BEQ PRINT_LONG_ADDRESS
    JMP ILLEGAL
    
              *moves $ to buffer moves address to buffer
OPND_IS_ADDRESS_OR_IMMEDIATE:
    MOVE.L  D1, D3
    ANDI.L    #$00000007,   D3 
    CMPI.L  #$00000000, D3
    BEQ PRINT_WORD_ADDRESS
    CMPI.L  #$00000001, D3
    BEQ PRINT_LONG_ADDRESS
    CMPI.L  #$00000004, D3
    BEQ PRINT_IMMEDIATE_DATA
    JMP ILLEGAL

    *moves d to buffer and converts bits for reg number
DES_OPND_IS_D:
    MOVE.B  #$44, (A4)+
    JSR CONVERT_BITS_11_THRU_9_TO_BUFF 
    RTS

    *moves a to buffer and converts bits for reg number
DES_OPND_IS_AN:
    CMPI.L  #$00000001, D4
    BEQ ILLEGAL
    MOVE.B  #$41, (A4)+    
    JSR CONVERT_BITS_11_THRU_9_TO_BUFF 
    RTS    
    
        *moves (a) to buffer and converts bits for reg number    
DES_OPND_IS_INDIRCET_AN:
    MOVE.B  #$28, (A4)+
    MOVE.B  #$41, (A4)+    
    JSR CONVERT_BITS_11_THRU_9_TO_BUFF 
    MOVE.B  #$29, (A4)+     
    RTS

    *moves (a)+ to buffer and converts bits for reg number
DES_OPND_IS_INDIRCET_POST_AN:
    MOVE.B  #$28, (A4)+
    MOVE.B  #$41, (A4)+    
    JSR CONVERT_BITS_11_THRU_9_TO_BUFF 
    MOVE.B  #$29, (A4)+
    MOVE.B  #$2B, (A4)+ 
    RTS
 
      *moves -(a) to buffer and converts bits for reg number
DES_OPND_IS_INDIRCET_PRE_AN:  
    MOVE.B  #$2D, (A4)+
    MOVE.B  #$28, (A4)+
    MOVE.B  #$41, (A4)+      
    JSR CONVERT_BITS_11_THRU_9_TO_BUFF 
    MOVE.B  #$29, (A4)+    
    RTS
      
                *moves $ to buffer moves address to buffer
DES_OPND_IS_ADDRESS:
    MOVE.L  D1, D3
    ANDI.L    #$00000E00,   D3 
    CMPI.L  #$00000000, D3
    BEQ PRINT_WORD_ADDRESS
    CMPI.L  #$00000200, D3
    BEQ PRINT_LONG_ADDRESS
    JMP ILLEGAL
    
              *moves $ to buffer moves address to buffer
DES_OPND_IS_ADDRESS_OR_IMMEDIATE:
    MOVE.L  D1, D3
    ANDI.L    #$00000E00,   D3 
    CMPI.L  #$00000000, D3
    BEQ PRINT_WORD_ADDRESS
    CMPI.L  #$00000200, D3
    BEQ PRINT_LONG_ADDRESS
    CMPI.L  #$00000800, D3
    BEQ PRINT_IMMEDIATE_DATA
    JMP ILLEGAL

* moves next word to string buffer
PRINT_WORD_ADDRESS:
    MOVE.B #$24, (A4)+
    JSR PRINT_WORD
    RTS
    
    * moves next long to string buffer
PRINT_LONG_ADDRESS:
    MOVE.B #$24, (A4)+
    JSR PRINT_LONG
    RTS
    
    * converts bits 2 - 0 to string buffer 
CONVERT_BITS_2_THRU_0_TO_BUFF:
    * uses D3 for storage
    MOVE.L  D1, D3
    ANDI.L    #$00000007,   D3
    ADDI.B  #$30,   D3
    MOVE.B  D3, (A4)+
    RTS
    
    * converts bits 11 - 9 to string buffer
CONVERT_BITS_11_THRU_9_TO_BUFF:
    * uses D3 for storage
    MOVE.L  D1, D3
    ANDI.L    #$00000E00,   D3
    LSR.L   #$8, D3
    LSR.L   #$1, D3    
    ADDI.B  #$30,   D3
    MOVE.B  D3, (A4)+
    RTS

* prints immediate data to buffer
PRINT_IMMEDIATE_DATA:
    MOVE.B #$23, (A4)+
    MOVE.B #$24, (A4)+ 
    CMPI.L  #$00000001, D4
    BEQ PRINT_WORD 
    CMPI.L  #$00000002, D4
    BEQ PRINT_WORD
    CMPI.L  #$00000003, D4
    BEQ PRINT_LONG

*prints next word to buffer
PRINT_WORD:
    JSR BYTE_A2_TO_BUFFER     
    JSR BYTE_A2_TO_BUFFER         
    RTS

*prints next long to buffer
PRINT_LONG:   
    JSR BYTE_A2_TO_BUFFER 
    JSR BYTE_A2_TO_BUFFER     
    JSR BYTE_A2_TO_BUFFER     
    JSR BYTE_A2_TO_BUFFER         
    RTS

* subroutine to jump to once valid instruction is dissasembled in string buffer
END_OF_VALID_INSTRUCTION:
    MOVE.B  #$0D, (A4)+    
    MOVE.B  #$0A, (A4)+        
    MOVE.B  #$00,   (A4)+
    JSR OUTPUT_BUFFER
    JSR CLR_REGISTERS_FOR_LOOP
    MOVE.L  #$00FFFFFE, A7    
    MOVEM.W (SP)+,  D2   
   JMP DISSASSEMBLY_LOOP    
   
*moves operand seperator to string buffer 
PRINT_OPERAND_SEPERATOR:
    MOVE.B #$2C, (A4)+
    MOVE.B #$20, (A4)+    
    RTS 
    
* subroutine that grouping jumps to if instruction is invalid
ILLEGAL:
    MOVE.W  #$0500, A4
    MOVE.B  #$44, (A4)+
    MOVE.B  #$41, (A4)+
    MOVE.B  #$54, (A4)+
    MOVE.B  #$41, (A4)+
    MOVE.B  #$20, (A4)+    
    JSR OPCODE_TO_BUFFER
    MOVE.B  #$0D, (A4)+
    MOVE.B  #$0A, (A4)+
    MOVE.B  #$00, (A4)+    
    JSR OUTPUT_BUFFER
    JSR CLR_REGISTERS_FOR_LOOP 
    MOVE.L  #$00FFFFFE, A7
    MOVEM.W (SP)+,  D2        
  JMP DISSASSEMBLY_LOOP
    
    * outputs byte in a2 to string buffer
BYTE_A2_TO_BUFFER:
    MOVE.B  (A2),   D6
    LSR.L   #04,   D6
    JSR NIBBLE_D6_TO_BUFFER
    MOVE.B  (A2)+,   D6
    JSR NIBBLE_D6_TO_BUFFER
    RTS

*outputs the nible in 65 to buffer
NIBBLE_D6_TO_BUFFER:    
    ANDI.L  #$000000F, D6
    CMPI.B   #$0A,  D6
    BLT O_TO_9_TO_BUFFER
    BGE A_TO_F_TO_BUFFER
    
    * hex value to ascii for 0 - 9
O_TO_9_TO_BUFFER:
    ADDI.B  #$30,   D6
    MOVE.B  D6, (A4)+
    RTS

*hex value to ascii for a - f
A_TO_F_TO_BUFFER:
    ADDI.B  #$37,   D6
    MOVE.B  D6, (A4)+
    RTS

*outputs the current opcode to buffer    
OPCODE_TO_BUFFER:
    MOVE.W  D1, D6
    LSR.L   #08,    D6
    LSR.L   #04,    D6    
    JSR NIBBLE_D6_TO_BUFFER
    MOVE.W  D1, D6    
    LSR.L   #08,    D6
    JSR NIBBLE_D6_TO_BUFFER
    MOVE.W  D1, D6
    LSR.L   #04,    D6
    JSR NIBBLE_D6_TO_BUFFER
    MOVE.W  D1, D6
    JSR NIBBLE_D6_TO_BUFFER
    RTS

* outputs the buffer
OUTPUT_BUFFER:
    MOVE.L  #$00000500, A1
    MOVE.B  #14,    D0    
    TRAP    #15
    RTS
   
* clears all registers for next opcode 
CLR_REGISTERS_FOR_LOOP:
    * Clear all registers except A2, and A3 for starting and ending adresses
    * ... and of course A7
    CLR.L   D0
    CLR.L   D1
    CLR.L   D2
    CLR.L   D3
    CLR.L   D4
    CLR.L   D5
    CLR.L   D6
    CLR.L   D7
    MOVE.L  #$00000000, A0
    MOVE.L  #$00000000, A1
    MOVE.L  #$00000000, A4
    MOVE.L  #$00000000, A5
    MOVE.L  #$00000000,   A6
    RTS
        
    
    




