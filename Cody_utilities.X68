*-----------------------------------------------------------
* Title      :
* Written by : Cody G
* Date       : 05/20/2018
* Description: Magic to make things work, so we can use them in multiple places
* Note: SpongeBob
*----------------------------------------------------------







Problem
    NOP
    * There was a problem
    * Reset A2 back to what A5 is holding
   * MOVEA A5, A2
    *SIMHALT             ; halt simulator
    BRA illegal

AllDone
    NOP
    * Everything went well
    *SIMHALT
    JMP		END_OF_VALID_INSTRUCTION
    
************************************************************************



RegPrint
    NOP
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000000111, D5
    * Compare it for DN
    CMP #%0000000000000000, D5
    * If it was equal, then branch
    BEQ PrintHelperZero
    
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000000111, D5
    * Compare it for DN
    CMP #%0000000000000001, D5
    * If it was equal, then branch
    BEQ PrintHelperOne
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000000111, D5
    * Compare it for DN
    CMP #%0000000000000010, D5
    * If it was equal, then branch
    BEQ PrintHelperTwo
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000000111, D5
    * Compare it for DN
    CMP #%0000000000000011, D5
    * If it was equal, then branch
    BEQ PrintHelperThree
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000000111, D5
    * Compare it for DN
    CMP #%0000000000000100, D5
    * If it was equal, then branch
    BEQ PrintHelperFour
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000000111, D5
    * Compare it for DN
    CMP #%0000000000000101, D5
    * If it was equal, then branch
    BEQ PrintHelperFive
    
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000000111, D5
    * Compare it for DN
    CMP #%0000000000000110, D5
    * If it was equal, then branch
    BEQ PrintHelperSix
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000000111, D5
    * Compare it for DN
    CMP #%0000000000000111, D5
    * If it was equal, then branch
    BEQ PrintHelperSeven
    
    BRA PrintHelperDone


*************************


* When we call this we need to make sure that D4 is set up with
* The three digits we want to print in the Right most bits
* It adds it to the A4 string buffer
BinaryToDecimalPrint *Takes the last 3 bits of D4 and adds the decimal number to the buffer
    NOP
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000001111, D5
    * Compare it for DN
    CMP #%0000000000000000, D5
    * If it was equal, then branch
    BEQ PrintHelperZero
    
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000001111, D5
    * Compare it for DN
    CMP #%0000000000000001, D5
    * If it was equal, then branch
    BEQ PrintHelperOne
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000001111, D5
    * Compare it for DN
    CMP #%0000000000000010, D5
    * If it was equal, then branch
    BEQ PrintHelperTwo
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000001111, D5
    * Compare it for DN
    CMP #%0000000000000011, D5
    * If it was equal, then branch
    BEQ PrintHelperThree
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000001111, D5
    * Compare it for DN
    CMP #%0000000000000100, D5
    * If it was equal, then branch
    BEQ PrintHelperFour
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000001111, D5
    * Compare it for DN
    CMP #%0000000000000101, D5
    * If it was equal, then branch
    BEQ PrintHelperFive
    
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000001111, D5
    * Compare it for DN
    CMP #%0000000000000110, D5
    * If it was equal, then branch
    BEQ PrintHelperSix
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000001111, D5
    * Compare it for DN
    CMP #%0000000000000111, D5
    * If it was equal, then branch
    BEQ PrintHelperSeven
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000001111, D5
    * Compare it for DN
    CMP #%0000000000001000, D5
    * If it was equal, then branch
    BEQ PrintHelperEight
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000001111, D5
    * Compare it for DN
    CMP #%0000000000001001, D5
    * If it was equal, then branch
    BEQ PrintHelperNine
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000001111, D5
    * Compare it for DN
    CMP #%0000000000001010, D5
    * If it was equal, then branch
    BEQ PrintHelperA
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000001111, D5
    * Compare it for DN
    CMP #%0000000000001011, D5
    * If it was equal, then branch
    BEQ PrintHelperB
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000001111, D5
    * Compare it for DN
    CMP #%0000000000001100, D5
    * If it was equal, then branch
    BEQ PrintHelperC
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000001111, D5
    * Compare it for DN
    CMP #%0000000000001101, D5
    * If it was equal, then branch
    BEQ PrintHelperD

    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000001111, D5
    * Compare it for DN
    CMP #%0000000000001110, D5
    * If it was equal, then branch
    BEQ PrintHelperE
    
    MOVE.L   D4, D5             * Move to D5 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000001111, D5
    * Compare it for DN
    CMP #%0000000000001111, D5
    * If it was equal, then branch
    BEQ PrintHelperF
    
    BRA PrintHelperDone
    

PrintHelperZero
    *MOVE.W	#ZERO_, (A4)+			*Add address of 0 to buffer
    MOVE.B	#$30,(A4)+
    BRA PrintHelperDone
    
PrintHelperOne
    *MOVE.W  #ONE_, (A4)+			*Add address of 1 to buffer
    MOVE.B	#$31,(A4)+
    BRA PrintHelperDone

PrintHelperTwo
    *MOVE.W  #TWO_, (A4)+			*Add address of 2 to buffer
    MOVE.B	#$32,(A4)+
    BRA PrintHelperDone
    
PrintHelperThree
    *MOVE.W  #THREE_, (A4)+			*Add address of 3 to buffer
    MOVE.B	#$33,(A4)+
    BRA PrintHelperDone
    
PrintHelperFour
    *MOVE.W  #FOUR_, (A4)+			*Add address of 4 to buffer
    MOVE.B	#$34,(A4)+
    BRA PrintHelperDone
    
PrintHelperFive
    *MOVE.W  #FIVE_, (A4)+			*Add address of 5 to buffer
    MOVE.B	#$35,(A4)+
    BRA PrintHelperDone
    
PrintHelperSix
    *MOVE.W  #SIX_, (A4)+			*Add address of 6 to buffer
    MOVE.B	#$36,(A4)+
    BRA PrintHelperDone
    
PrintHelperSeven
    *MOVE.W  #SEVEN_, (A4)+			*Add address of 7 to buffer
    MOVE.B	#$37,(A4)+
    BRA PrintHelperDone
    
PrintHelperEight
    *MOVE.W  #SEVEN_, (A4)+			*Add address of 8 to buffer
    MOVE.B	#$38,(A4)+
    BRA PrintHelperDone

PrintHelperNine
    *MOVE.W  #SEVEN_, (A4)+			*Add address of 9 to buffer
    MOVE.B	#$39,(A4)+
    BRA PrintHelperDone
    
PrintHelperA
    *MOVE.W  #SEVEN_, (A4)+			*Add address of A to buffer
    MOVE.B	#$41,(A4)+
    BRA PrintHelperDone
    
PrintHelperB
    *MOVE.W  #SEVEN_, (A4)+			*Add address of B to buffer
    MOVE.B	#$42,(A4)+
    BRA PrintHelperDone
    
PrintHelperC
    *MOVE.W  #SEVEN_, (A4)+			*Add address of C to buffer
    MOVE.B	#$43,(A4)+
    BRA PrintHelperDone
    
PrintHelperD
    *MOVE.W  #SEVEN_, (A4)+			*Add address of D to buffer
    MOVE.B	#$44,(A4)+
    BRA PrintHelperDone
    
PrintHelperE
    *MOVE.W  #SEVEN_, (A4)+			*Add address of E to buffer
    MOVE.B	#$45,(A4)+
    BRA PrintHelperDone
    
PrintHelperF
    *MOVE.W  #SEVEN_, (A4)+			*Add address of F to buffer
    MOVE.B	#$46,(A4)+
    BRA PrintHelperDone

PrintHelperDone
    NOP
    RTS
    
    
    
    
*************
* Loads and prints the Value of the memory in a location loaded in D4
* IE, D4 has $1234 in it and we want to print the numbers to the register
PrintMemoryWord
    NOP
    
    * Roll the first number, then print the first number
    ROL.W #4, D4
    JSR BinaryToDecimalPrint 
    
    * Then the second number
    ROL.W #4, D4
    JSR BinaryToDecimalPrint

    * Then the third number
    ROL.W #4, D4
    JSR BinaryToDecimalPrint
    
    * Then the fourth number
    ROL.W #4, D4
    JSR BinaryToDecimalPrint
    
    * Then we're done!
    RTS

*************
* Loads and prints the LONG Value of the memory in a location loaded in D4
* IE, D4 has $12345678 in it and we want to print the numbers to the register
PrintMemoryLong
    NOP
    
    * Roll the first number, then print the first number
    ROL.L #4, D4
    JSR BinaryToDecimalPrint 
    
    * Then the second number
    ROL.L #4, D4
    JSR BinaryToDecimalPrint

    * Then the third number
    ROL.L #4, D4
    JSR BinaryToDecimalPrint
    
    * Then the fourth number
    ROL.L #4, D4
    JSR BinaryToDecimalPrint
    
    *5th
    ROL.L #4, D4
    JSR BinaryToDecimalPrint 
    
    * 6th
    ROL.L #4, D4
    JSR BinaryToDecimalPrint

    * 7th
    ROL.L #4, D4
    JSR BinaryToDecimalPrint
    
    * 8th
    ROL.L #4, D4
    JSR BinaryToDecimalPrint
    
    * Then we're done!
    RTS
