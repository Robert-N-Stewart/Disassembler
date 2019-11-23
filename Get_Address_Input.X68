*-----------------------------------------------------------
* Title      : GET_USER_INPUT
* Written by : ROBERT STEWART
* Date       : 05/10/2018
* Description: OUTPUTS PROGRAM DESCRIPTION AND GETS USER INPUT FOR STARTING AND ENDING ADRESSES 
*-----------------------------------------------------------
    LEA PROGRAM_DESCRIPTION_1,    A1    
    MOVE.B  #14,    D0
    TRAP    #15


PROMPT_FOR_STARTING_ADDRESS:
* program code
    * Prompts user for starting address input
    LEA PROMT_FOR_STARTING_ADDRESS_MSG,    A1
    MOVE.B  #14,    D0    
    TRAP    #15
    JMP GET_ADDRESS_INPUT 
    
PROMPT_FOR_ENDING_ADDRESS:
    LEA PROMT_FOR_ENDING_ADDRESS_MSG,    A1    
    MOVE.B  #14,    D0
    TRAP    #15    

GET_ADDRESS_INPUT:
    * d2 acts as counter for ascii characters processed 
    * D4 acts as placeholder for hex values processed
    *  must reset both if coming from invalid address input 
    MOVE.L  #$00000000, D4
    MOVE.L  #$00000000, D2 
    * Reads string of input. String input is stored at memory $7000
    * String size stored in D1
    MOVE.W  #$750, A1
    MOVE.B  #2, D0
    TRAP    #15
    
    LEA EMPTY_LINE,    A1    
    MOVE.B  #14,    D0
    TRAP    #15    
    
    MOVE.W  #$750, A1
    MOVE.B  #2, D0

    

    * If string input is longer than 8 characters (if D1 is greater than 8)
    * invalid adress
    CMPI.L   #$00000008,    D1
    BGT INVALID_ADDRESS
    
ADD_ALL_CHAR_TO_D4:
    * D2 contains counter for loop control (starts at 0)
    * A1 contains pointer to address of string
    CMP.B   D1,    D2  *Condition for loop break (once all 8 bytes are compared)
    BLT ADD_CHAR_TO_D4
    
    MOVE.L  D4, D6  * D6 used as Temp for odd comparison using ANDI
    ANDI.L  #$00000001,  D6
    CMPI.B  #$01,   D6  * If odd address
    BEQ  INVALID_ADDRESS
    
    CMPI.B  #$00,   D5  * If storing starting or ending address
    BEQ MOVE_D4_TO_A2
    BNE MOVE_D4_TO_A3
    
MOVE_D4_TO_A2:
    MOVE.L  D4, A2
    * Done with first address, now for second
    ADDI.B  #$1,    D5  * Indicator that first address is verified and stored
    MOVE.L  #$00000000, D4
    MOVE.L  #$00000000, D2
    JMP PROMPT_FOR_ENDING_ADDRESS
    
MOVE_D4_TO_A3:
    MOVE.L  D4, A3
    MOVE.L #$00000000,  D0
    MOVE.L #$00000000,  D1
    MOVE.L #$00000000,  D2
    MOVE.L #$00000000,  D3
    MOVE.L #$00000000,  D4
    MOVE.L #$00000000,  D5
    MOVE.L #$00000000,  D6
    MOVEA.L #$00000000,  A1

    JMP VERIFY_ENDING_ADDRESS_GREATER
    
    
ADD_CHAR_TO_D4:

        * If char ascii hex is less than 30 its invalid        
        CMPI.B  #$30,   (A1)
        BLT INVALID_ADDRESS
        
        * If char ascii hex is greater than 29 and less than 3A 
        * Its a numeric char
        CMPI.B  #$3A,   (A1)
        BLT NUMBERIC_CHAR
        
        * If char ascii hex is greater than 39 and less than 41 
        * Its invalid  
        CMPI.B  #$41,   (A1)
        BLT INVALID_ADDRESS

        * If char ascii hex is greater than 40 and less than 47 
        * Its a uppercase char A-F        
        CMPI.B  #$47,   (A1)
        BLT UPPERCASE_CHAR

        * If char ascii hex is greater than 46 and less than 61 
        * Its invalid        
        CMPI.B  #$61,   (A1)
        BLT INVALID_ADDRESS

        * If char ascii hex is greater than 60 and less than 67 
        * Its a lowercase char a-f
        CMPI.B  #$67,   (A1)
        BLT LOWERCASE_CHAR
        
        * If char ascii hex is greater than 66 than it is invalid 
        JMP INVALID_ADDRESS        
                

        
NUMBERIC_CHAR:   
        *
        SUBI.B #$30, (A1)
        JMP MOVE_CHAR_TO_D4

UPPERCASE_CHAR:
        SUBI.B #$37, (A1)
        JMP MOVE_CHAR_TO_D4


LOWERCASE_CHAR:
        SUBI.B #$57, (A1)
        JMP MOVE_CHAR_TO_D4

MOVE_CHAR_TO_D4:
        * D4 acts as temp storage to hold full address to add to A2 after address is full
        * D3 acts as temp storage for holding hex character to add to full address in D4
        * move.b  (A1)+,   D3
        ASL.L   #4, D4  
        ADD.B  (A1)+, D4
        ADDI    #$1,    D2  * increment counter for total hex characters added
        JMP ADD_ALL_CHAR_TO_D4





INVALID_ADDRESS:
    CMPI.B  #$00,   D5
    BEQ INVALID_STARTING_ADDRESS
    BNE INVALID_ENDING_ADDRESS
    
INVALID_STARTING_ADDRESS:
    
    LEA INVALID_STARTING_ADDRESS_MSG,    A1
    JMP DISPLAY_INVAL_ADDRESS_AND_RETURN

INVALID_ENDING_ADDRESS:

    LEA INVALID_ENDING_ADDRESS_MSG,    A1
    JMP DISPLAY_INVAL_ADDRESS_AND_RETURN
    
DISPLAY_INVAL_ADDRESS_AND_RETURN:
    MOVE.B  #14,    D0
    TRAP    #15   
    JMP GET_ADDRESS_INPUT
    

* variables and constants





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
