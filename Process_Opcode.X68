*-----------------------------------------------------------
* Title      : Process_Opcode
* Written by : Robert Stewart
* Description: starts proccessing opcode, jumping to correct subroutine
*-----------------------------------------------------------
       
* starts initial processing
PROCESS_OPCODE:
    MOVEM.W D2, -(SP)
    MOVE.L  #$00000000, D2    

    * outputs $ before outputing current address
    MOVE.B #$24,    D1
    MOVE.B  #6,    D0    
    TRAP    #15

    MOVE.L  A2, D3    
    
    * outputs the current address of opcode
OUTPUT_CURRENT_ADDRESS:

    CMPI.L  #$00000008, D2
    BEQ PROCESS_BITS_15_TO_12
    JMP OUTPUT_ONE_CHAR_OF_CURR_ADDRESS

* outputs first char of output
OUTPUT_ONE_CHAR_OF_CURR_ADDRESS:
    
    MOVE.L  D3, D1
    ANDI.L  #$F0000000,  D1
    ROL.L   #4,    D1
    
    * Determine if D1 contains 0-9 or E-F
    CMPI.B #$0A,   D1
    BLT IS_0_TO_9
    JMP IS_A_TO_F
    
    * outputs d1 with char and processes more
OUTPUT_D1_AND_PROCESS_MORE:    
    MOVE.B  #6,    D0    
    TRAP    #15
    
    ASL.L   #4, D3
    ADDI.B  #$01,   D2
    JMP OUTPUT_CURRENT_ADDRESS
    
    * if char is 0-9 make ascii
IS_0_TO_9:
    ADDI.B  #$30,   D1
    JMP OUTPUT_D1_AND_PROCESS_MORE
    
* make ascii
IS_A_TO_F:
    ADDI.B  #$37,   D1
    JMP OUTPUT_D1_AND_PROCESS_MORE

* processes first four bits and jumps to subroutine 
PROCESS_BITS_15_TO_12: 
    LEA EMPTY_SPACE_MSG,    A1
    MOVE.B  #14,    D0    
    TRAP    #15
    
    MOVE.L  #$00000000,   A1
    CLR.L   D0
    CLR.L   D1
    CLR.L   D2
    CLR.L   D3
    * A4 now contains starting address of "string buffer"
    * D1 now contains opcode
    MOVE.W  (A2)+,  D1  
    MOVE.W  #$0500, A4 
    
    MOVE.L  D1, D3
    ROL.W   #4,    D3
    ANDI.L    #$0000000F,   D3 
    
    LEA JMP_TABLE,  A0
    MULU    #6, D3
    JMP 0(A0,D3)
    MOVE.L  #$12,   D1
    
JMP_TABLE:  
    JMP GROUP0000 
    JMP GROUP0001
    JMP GROUP0010
    JMP GROUP0011
    JMP GROUP0100
    JMP GROUP0101
    JMP GROUP0110
    JMP GROUP0111
    JMP GROUP1000
    JMP GROUP1001
    JMP ILLEGAL
    JMP GROUP1011
    JMP GROUP1100
    JMP GROUP1101
    JMP GROUP1110
    JMP ILLEGAL


  








*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
