*-----------------------------------------------------------
* Title      : GROUP1110 - it's the 1110 family (ASd, LSd, Rod)
* Written by : Cody G
* Date       : 5-20-18
* Description:
*-----------------------------------------------------------


    ****************************
    * This is the 1110 group / family
    
     * A6 as the current spot we're looking at
GROUP1110:

     
    * This is some setup stuff to get things ready
    *WE need to roll back this for a moment
    movea.W -(A2), A6
    * Then we can load it up just the number, not the data
    MOVEA.L A2, A6
    MOVE.W (A6), D4
    * Then we can roll it back
    movea.W (A2)+, A5
    * Let's backup A6 to A5 just in case
    movea.l A6, A5 



Family1110
    * OK we know it's 1110 for now
    
    MOVE.W (A6), D4
    * Then mask it to see if we passed the first check
    AND.W #%1111100011000000, D4
    CMP.W #%1110000011000000, D4
    BEQ OneOfThreeMemoryShift
    
    BRA NoMemoryShiftKeepChecking
    
    
    
OneOfThreeMemoryShift
    
    * OK we know it's a memory shift, that's an check for what type
    
    * Check for ASD
    MOVE.W (A6), D4
    * Then mask it to see if we passed the first check
    AND.W #%1111111011000000, D4
    CMP.W #%1110000011000000, D4
    BEQ ASDMemoryShiftCheck
    
    * Check for LSD
    MOVE.W (A6), D4
    * Then mask it to see if we passed the first check
    AND.W #%1111111011000000, D4
    CMP.W #%1110001011000000, D4
    BEQ LSDMemoryShiftCheck
    
    * Check for ROD
    MOVE.W (A6), D4
    * Then mask it to see if we passed the first check
    AND.W #%1111111011000000, D4
    CMP.W #%1110011011000000, D4
    BEQ RODMemoryShiftCheck
    
    * If we got here, then there was a problem
    BRA Problem

    
ASDMemoryShiftCheck
    
    * Add AS to the  print buffer
    *MOVE.W	#AS_, (A4)+
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$53,(A4)+ * S
    BRA MemoryShiftDirectionCheck

LSDMemoryShiftCheck
    
    * Add LS to the  print buffer
    *MOVE.W	#LS_, (A4)+
    MOVE.B   #$4C,(A4)+ * L
    MOVE.B   #$53,(A4)+ * S
    BRA MemoryShiftDirectionCheck
    
RODMemoryShiftCheck
    
    * Add RO to the  print buffer
    *MOVE.W	#RO_, (A4)+
    MOVE.B   #$52,(A4)+ * R
    MOVE.B   #$4F,(A4)+ * O
    BRA MemoryShiftDirectionCheck
    
    
MemoryShiftDirectionCheck
    
    * At this point, we put the call that it is, just find the direction
    
    * Check for ROD
    MOVE.W (A6), D4
    * Then mask it to see if we passed the first check
    AND.W #%0000000100000000, D4
    CMP.W #%0000000000000000, D4
    BEQ MemoryShiftAddR
    
    * Otherwise, it's a L
    BRA MemoryShiftAddL


MemoryShiftAddR
    
    * Add R to the  print buffer
    *MOVE.W	#Right_, (A4)+
    MOVE.B   #$52,(A4)+ * R
    * Memory shifts are always a word
    *MOVE.W	#W_, (A4)+
    MOVE.B   #$2E,(A4)+ * .
    MOVE.B   #$57,(A4)+ * W
    MOVE.B   #$20,(A4)+ * space
    BRA MemoryShiftDirectionDone
    
MemoryShiftAddL
    
    * Add L to the print buffer
    *MOVE.W	#Left_, (A4)+
    MOVE.B   #$4C,(A4)+ * L
    * Memory shifts are always a word
    *MOVE.W	#W_, (A4)+
    MOVE.B   #$2E,(A4)+ * .
    MOVE.B   #$57,(A4)+ * W
    MOVE.B   #$20,(A4)+ * space
    BRA MemoryShiftDirectionDone
    

*ASL/LSL/ROL/: (An),(An)+,-(An),xxx.W,xxx.L

MemoryShiftDirectionDone
    
    * Now with the direction done, we can look at the EA
         
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000111000, D4
    * Compare it for (An)
    CMP #%0000000000010000, D4
    * If it was equal, then branch
    BEQ MemoryShiftAnBubble
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000111000, D4
    * Compare it for (An)+
    CMP #%0000000000011000, D4
    * If it was equal, then branch
    BEQ MemoryShiftAnPlus
    
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000111000, D4
    * Compare it for -(An)
    CMP #%0000000000100000, D4
    * If it was equal, then branch
    BEQ MemoryShiftAnMinus
    
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000111111, D4
    * Compare it for xxx.W
    CMP #%0000000000111000, D4
    * If it was equal, then branch
    BEQ MemoryShiftWord
    
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000111111, D4
    * Compare it for xxx.L
    CMP #%0000000000111001, D4
    * If it was equal, then branch
    BEQ MemoryShiftLong
    
    *Otherwise, size wasn't right... so call PROBLEM
    BRA Problem


MemoryShiftAnBubble
    * Print out (An)
    
    MOVE.B   #$28,(A4)+ * (
    MOVE.B   #$41,(A4)+ * A

   
    *MOVE.W	#LPAR_, (A4)+	
    *MOVE.W	#A_, (A4)+		
    MOVE.W  (A6), D4	* Reset the D4 Register
    JSR RegPrint    *Print the proper number 
    *MOVE.W	#RPAR_, (A4)+
    MOVE.B   #$29,(A4)+ * )
    
    
    BRA MemoryShiftModeDone
    
MemoryShiftAnPlus
   * Print out (An)+
    
    MOVE.B   #$28,(A4)+ * (
    MOVE.B   #$41,(A4)+ * A

   
    *MOVE.W	#LPAR_, (A4)+	
    *MOVE.W	#A_, (A4)+		
    MOVE.W   (A6), D4	* Reset the D4 Register
    JSR RegPrint    *Print the proper number 
    *MOVE.W	#RPAR_, (A4)+
    MOVE.B   #$29,(A4)+ * )
    MOVE.B   #$2B,(A4)+ * +
    
    
    *MOVE.W	#LPAR_, (A4)+	
    *MOVE.W	#A_, (A4)+		
    *MOVE.L   (A6), D4	* Reset the D4 Register
    *JSR BinaryToDecimalPrint    *Print the proper number 
    *MOVE.W	#RPAR_, (A4)+
    *MOVE.W	#PLUS_, (A4)+
    


    BRA MemoryShiftModeDone
    
MemoryShiftAnMinus
    * Print out -(An)
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$28,(A4)+ * (
    MOVE.B   #$41,(A4)+ * A

   
    *MOVE.W	#LPAR_, (A4)+	
    *MOVE.W	#A_, (A4)+		
    MOVE.W   (A6), D4	* Reset the D4 Register
    JSR RegPrint    *Print the proper number 
    *MOVE.W	#RPAR_, (A4)+
    MOVE.B   #$29,(A4)+ * )


    *MOVE.W	#MINUS_, (A4)+
    *MOVE.W	#LPAR_, (A4)+	
    *MOVE.W	#A_, (A4)+		
    *MOVE.L   (A6), D4	* Reset the D4 Register
    *JSR BinaryToDecimalPrint    *Print the proper number 
    *MOVE.W	#RPAR_, (A4)+
    
    
    BRA MemoryShiftModeDone
    
MemoryShiftWord
    * Print out xxx.W
    * So we need to add the next word to the print buffer
    * Put the $ in front
    *MOVE.W #Dollar_, (A4)+
    * Do we need to bump up the (A6) and extra time?
    *MOVE.W (A6)+, D4 * Not really necessary, but to bump it up
    *MOVE.W (A6)+, (A4)+
    
    MOVE.B   #$24,(A4)+ *$
    * We need to bump up the A6
    MOVE.W (A6)+, D4
    MOVE.W (A6)+, D4 * Do it again
    JSR PrintMemoryWord
    * Then we better remember to bump up A2
    MOVE.W (A2)+, D4 * This is just to bump things up






    BRA MemoryShiftModeDone
    
MemoryShiftLong
    * Print out xxx.L
    *MOVE.W #Dollar_, (A4)+
    * Do we need to bump up the (A6) and extra time?
    *MOVE.W (A6)+, D4 * Not really necessary, but to bump it up
    *MOVE.L (A6)+, (A4)+
    
    MOVE.B   #$24,(A4)+ *$

    MOVE.W (A6)+, D4
    MOVE.L (A6)+, D4
    JSR PrintMemoryLong
    
    * Then we better remember to bump up A2
    MOVE.W (A2)+, D4 * This is just to bump things up once
    MOVE.W (A2)+, D4 * Bump it up again
    
    
    
    
    BRA MemoryShiftModeDone



MemoryShiftModeDone
        
    BRA AllDone
    
    
    
    
* If we get here, it's not a Memory shift, but it may be a register shift
NoMemoryShiftKeepChecking
    
    * It looks kinda like this then...
    * ASL.W #BLA, D3
    
    * We need to check the three modes that it could be
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%1111000000011000, D4
    * Compare it for ASd (Register shift)
    CMP #%1110000000000000, D4
    * If it was equal, then branch
    BEQ ASDRegShift
    
    
    MOVE.W  (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%1111000000011000, D4
    * Compare it for ASd (Register shift)
    CMP #%1110000000001000, D4
    * If it was equal, then branch
    BEQ LSDRegShift
    
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%1111000000011000, D4
    * Compare it for ASd (Register shift)
    CMP #%1110000000011000, D4
    * If it was equal, then branch
    BEQ RODRegShift
    
    
    
ASDRegShift
    
    * Our best guess is that it's a AS shift
    * Add AS to the  print buffer
    *MOVE.W	#AS_, (A4)+
    
    MOVE.B   #$41,(A4)+ *A
    MOVE.B   #$53,(A4)+ *S
    
    
    BRA RegShiftModeDone
    

LSDRegShift
    
    * Add LS to the  print buffer
    *MOVE.W	#LS_, (A4)+
    MOVE.B   #$4C,(A4)+ *L
    MOVE.B   #$53,(A4)+ *S

    BRA RegShiftModeDone
    
RODRegShift
    
    * Add LS to the  print buffer
    *MOVE.W	#RO_, (A4)+
    
    MOVE.B   #$52,(A4)+ *R
    MOVE.B   #$4F,(A4)+ *O


    BRA RegShiftModeDone
    
    
    
RegShiftModeDone
    
    * Now that we know what it is, let's add the direction
    
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000100000000, D4
    * Compare it for ASd (Register shift)
    CMP #%0000000100000000, D4
    * If it was equal, then branch
    BEQ RegAddL
    
    * Otherwise it's a R
    BRA RegAddR



RegAddR
    
    *MOVE.W	#Right_, (A4)+
    MOVE.B   #$52,(A4)+ *R

    BRA RegDirectionDone
    
    
RegAddL
     
    *MOVE.W	#LEFT_, (A4)+
    MOVE.B   #$4C,(A4)+ *L
    
    BRA RegDirectionDone
    
RegDirectionDone
    
    
    * Now we need to figure out the size
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000011000000, D4
    * Compare it for ASd (Register shift)
    CMP #%0000000000000000, D4
    * If it was equal, then branch
    BEQ RegByte
    
    * Not that, reset and do it agian
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000011000000, D4
    * Compare it for ASd (Register shift)
    CMP #%0000000001000000, D4
    * If it was equal, then branch
    BEQ RegWord
    
    * Not that, reset and do it agian
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000011000000, D4
    * Compare it for ASd (Register shift)
    CMP #%0000000010000000, D4
    * If it was equal, then branch
    BEQ RegLong
    
    
    * If we got here, then it must be a 11 and not a real on
    BRA Problem

    
    
RegByte
    
    MOVE.B   #$2E,(A4)+ *.
    MOVE.B   #$42,(A4)+ *B
    MOVE.B   #$20,(A4)+ *space
    BRA RegSizeDone
    
RegWord
    
    MOVE.B   #$2E,(A4)+ *.
    MOVE.B   #$57,(A4)+ *W
    MOVE.B   #$20,(A4)+ *space
    BRA RegSizeDone
    
RegLong
    
    MOVE.B   #$2E,(A4)+ *.
    MOVE.B   #$4C,(A4)+ *L
    MOVE.B   #$20,(A4)+ *space
    BRA RegSizeDone

RegSizeDone
    
    
    * Is it instant, or a Data Register?
     MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%00000000000100000, D4
    * Compare it for ASd (Register shift)
    CMP #%0000000000100000, D4
    * If it was equal, then branch
    BEQ AddDataReg
    
    * Otherwise, it's data, so print out the #
    *MOVE.W	#POUND_, (A4)+
    MOVE.B   #$23,(A4)+ *#
    
    * Then check if it's 0
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000111000000000, D4
    * Compare it for ASd (Register shift)
    CMP #%0000000000000000, D4
    * If it was equal, then branch
    BEQ PrintFakeZero

    BRA PrintNumber


AddDataReg
    * It's a data register, so add the D	
    *MOVE.W	#D_, (A4)+
    MOVE.B   #$44,(A4)+ *D
    MOVE.W   (A6), D4 
    ROR.L #4, D4
    ROR.L #5, D4

    JSR RegPrint
    BRA RegFirstRegDone
    
    
PrintFakeZero
    
    * OK It's not really 0, we need to make it 8 for this case
    *MOVE.W	#ZERO_, (A4)+
    MOVE.B  #$38,(A4)+ *8
    BRA RegFirstRegDone
    
PrintNumber
     MOVE.W   (A6), D4 
     ROR.L #4, D4
     ROR.L #5, D4
     JSR RegPrint * BinaryToDecimalPrint
     BRA RegFirstRegDone
     

RegFirstRegDone
* Now with that done, let's print the comma and the other register
    *MOVE.W	#COMMA_, (A4)+
    *MOVE.W	#D_, (A4)+
    
    MOVE.B  #$2C,(A4)+ *,
    MOVE.B  #$20,(A4)+ *space
    MOVE.B  #$44,(A4)+ *D
    
    MOVE.W   (A6), D4
    JSR RegPrint
    
    BRA AllDone
   










