*-----------------------------------------------------------
* Title      : Loop Instructions
* Written by : Robert Stewart
* Description: Main driver. Loops through all instructions.
*-----------------------------------------------------------
  
	 ORG    $1000
START:                  ; first instruction of program

    INCLUDE "Get_Address_Input.x68"

* initial loop to verify ending address
VERIFY_ENDING_ADDRESS_GREATER:
    CMP.L   A2, A3
    BLT ENDING_ADDRESS_LT_STARTING
    JMP DISSASSEMBLY_LOOP

* check if ending address is greater than starting 
ENDING_ADDRESS_LT_STARTING:
    LEA ENDING_ADDRESS_LT_STARTING_MSG,    A1
    MOVE.B  #14,    D0    
    TRAP    #15
    JMP PROMPT_FOR_STARTING_ADDRESS

* main loop for dissembling instructions
DISSASSEMBLY_LOOP:
    * might need to reset A7 SP, to location for D2 and movem
    ADDI.B  #$01,   D2 
    CMP.L   A2, A3
    BLT DISSASSEMBLED_ALL
    BEQ DISSASSEMBLED_ALL
    CMPI.L  #$00000010, D2
    BEQ PROMP_FOR_MORE_ADDRESSES
    JMP PROCESS_OPCODE

    
* prompt for user to get more address on screen    
PROMP_FOR_MORE_ADDRESSES:
    MOVE.L  #$00000000, D2
    
    LEA PROMPT_FOR_MORE_ADDRESSES_MSG,    A1
    MOVE.B  #14,    D0    
    TRAP    #15
    
    MOVE.W  #0750, A1
    MOVE.B  #2, D0
    TRAP    #15
    
    JMP DISSASSEMBLY_LOOP

* once all instructions are dissembled 
DISSASSEMBLED_ALL:
    LEA PROMPT_FOR_MORE_INSTRUCTIONS_MSG,    A1
    MOVE.B  #14,    D0    
    TRAP    #15

* gets input once all instructions are dissasembled
GET_DISSASSEMBLED_INPUT:    
    MOVE.B  #5,    D0    
    TRAP    #15

    CMPI.B  #$51,   D1
    BEQ END_OF_PROGRAM
    CMPI.B  #$71,   D1
    BEQ END_OF_PROGRAM
    CMPI.B  #$6D,   D1
    BEQ PROMPT_FOR_STARTING_ADDRESS
    CMPI.B  #$4D,   D1
    BEQ PROMPT_FOR_STARTING_ADDRESS
    
    LEA INVALID_DISSASSEMBLED_INPUT_MSG,    A1
    MOVE.B  #14,    D0    
    TRAP    #15    
    JMP GET_DISSASSEMBLED_INPUT


* outputes message at end of program
END_OF_PROGRAM:
    
    LEA END_OF_PROGRAM_MSG,    A1
    MOVE.B  #14,    D0    
    TRAP    #15
    SIMHALT             ; halt simulator
    
    * files for each opcode grouping, utilities, and for initial processing opcode 
	INCLUDE "Process_Opcode.x68"
	INCLUDE "GROUP0000.x68"
	INCLUDE "GROUP0001.x68"
	INCLUDE "GROUP0010_AND_GROUP0011.x68"	
	INCLUDE "GROUP0100.x68"
	INCLUDE "GROUP0101.x68"
	INCLUDE "GROUP0110.x68"
	INCLUDE "GROUP0111.x68"	
	INCLUDE "GROUP1000.x68"
	INCLUDE "GROUP1011.x68"
	INCLUDE "GROUP1001.x68"
	INCLUDE "GROUP1100.x68" 
	INCLUDE "GROUP1101.x68"
	INCLUDE "GROUP1110.x68"
	INCLUDE "Rob_Utilities.x68"
	INCLUDE "Hanna_utilities.x68"
	INCLUDE "Cody_utilities.x68"
    
* Put variables and constants here
        
CR  EQU $0D
LF  EQU $0A

INVALID_DISSASSEMBLED_INPUT_MSG DC.B    '', CR, LF    
                               DC.B    '', CR, LF
                               DC.B    '**** INVALID OPTION.  M/m FOR MORE INSTRUCTIONS. ****', CR, LF
                               DC.B    '**** Q/q TO QUIT ****', CR, LF, 0

ENDING_ADDRESS_LT_STARTING_MSG DC.B    '', CR, LF
                               DC.B    '**** ENDING ADDRESS IS LESS THAN STARTING ADDRESS, RENTER ADDRESSES ****', CR, LF
                               DC.B    '', CR, LF, 0
PROMPT_FOR_MORE_INSTRUCTIONS_MSG DC.B    '', CR, LF
                               DC.B    '**** ALL INSTRUCTIONS DISSASSEMBLED. M/m FOR MORE INSTRUCTIONS.  ****', CR, LF
                               DC.B    '**** Q/q TO QUIT ****', CR, LF, 0

END_OF_PROGRAM_MSG  DC.B    '', CR, LF
                    DC.B    '', CR, LF
                    DC.B    '**** NO FURTHER INSTRUCTIONS. END OF PROGRAM ****', CR, LF
                    DC.B    '', CR, LF, 0
PROMPT_FOR_MORE_ADDRESSES_MSG   DC.B    '', CR, LF
                                DC.B    'PRESS ENTER TO DISSASSEMBLE NEXT 15 INSTRUCTIONS', CR, LF, 0
EMPTY_LINE  DC.B    '', CR, LF, 0
EMPTY_SPACE_MSG   DC.B    ' ', 0 

PROGRAM_DESCRIPTION_1 DC.B    'THIS PROGRAM CONVERTS A MEMORY IMAGE OF INSTRUCTIONS BACK TO', CR, LF
                      DC.B    '68000 ASSEMBLY LANGUAGE.', CR, LF
                      DC.B    'DISASSEMBLED CODE IS DISPLAYED.', CR, LF
                      DC.B    'USER MUST PLACE INSTRUCTIONS TO DISSASEBLE INTO MEMORY', CR, LF
                      DC.B    'AND, PROVIDE BOTH STARTING AND ENDING ADDRESSES OF PLACED INSTRUCTIONS.', CR, LF
                      DC.B    'DO NOT OVERWRITE MEMORY OF PROGRAM:', CR, LF
                      DC.B    '    BETWEEN $00000000 - $00004000 AND $EFFFFF- $FFFFFF', CR, LF, CR, LF, 0
PROMT_FOR_STARTING_ADDRESS_MSG DC.B    '', CR, LF 
                               DC.B    '', CR, LF 
                               DC.B    'ENTER STARTING ADDRESS', CR, LF
                               DC.B    'MUST BE EVEN, LESS THAN 9 DIGITS, AND BETWEEN THE RANGE 4000 AND EFFFFF', CR, LF
                               DC.B    'E.G. 00000002. DEFAULT IS 00000000',  CR, LF, 0
PROMT_FOR_ENDING_ADDRESS_MSG DC.B    'ENTER ENDING ADDRESS. NON INCLUSIVE', CR, LF
                               DC.B    'MUST BE EVEN, LESS THAN 9 DIGITS AND BETWEEN THE RANGE 4000  AND EFFFFF', CR, LF
                               DC.B    'E.G. 00000002. DEFAULT IS 00000000',  CR, LF, 0
INVALID_STARTING_ADDRESS_MSG    DC.B     'INVALID STARTING ADDRESS, PLEASE ENTER VALID ADDRESS:', CR, LF, 0
INVALID_ENDING_ADDRESS_MSG DC.B     'INVALID ENDING ADDRESS, PLEASE ENTER VALID ADDRESS', CR, LF, 0


* FILE WITH SUBROUTINE THAT PROCESSES OPCODE AT A2
    *INCLUDE "PROCESS_OPCODE.x68"








    END    START        ; last line of source











*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
