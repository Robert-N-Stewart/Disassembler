*-----------------------------------------------------------
* Title      : Group 0100
* Written by : Cody Gustafson
* Date       : 5-16-18
* Description: Testing the cookie cutter method
* Note: SpongeBob Edition
*-----------------------------------------------------------
                  

****************************
    * This is the 0100 group / family
    
     * A6 as the current spot we're looking at

GROUP0100:

     
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




* This will be the call that we want to BRA or JSR to
Family0100Call
    


* ///////////////////////////////
* Ones starting with 0100
* ///////////////////////////////


    * ==========================
    * CLR CHECK
CLRCheckStart 
    * Zero out the non-freebee bits
    AND.L #%1111111100000000, D4
    * Compare it
    CMP #%0100001000000000, D4
    * If it was equal, then branch
    BEQ CLRSpot
CLRCheckEnd
    * Otherwise, fall through (and load D4 again)
    MOVE.W (A6), D4
    * -----------------------------
    
    
    * ==================================
    *  CHECK
CheckStart   
    * Compare it, because it's all the bits
    CMP #%0100111001110001, D4
    * If it was equal, then branch
    BEQ Spot
    *MOVE.W	#_, (A4)+			*Add address of  to buffer
    
CheckEnd
    * Otherwise, fall through (and load D4 again)
    MOVE.W (A6), D4

    * -------------------------------


    * ==================================    
    * RTS CHECK    
RTSCheckStart
    * Compare it, because it's all the bits
    CMP #%0100111001110101, D4
    * If it was equal, then branch
    BEQ RTSSpot
    * It's an easy one...
    *MOVE.W	#RTS_, (A4)+			*Add address of RTS to buffer
    
RTSCheckEnd
    * Otherwise, fall through (and load D4 again)
    MOVE.W (A6), D4
    * ------------------------------------
    
    * ==========================
    * JSR CHECK
JSRCheckStart 
    * Zero out the non-freebee bits
    AND.L #%1111111111000000, D4
    * Compare it
    CMP #%0100111010000000, D4
    * If it was equal, then branch
    BEQ JSRSpot
JSRCheckEnd
    * Otherwise, fall through (and load D4 again)
    MOVE.W (A6), D4
    * -----------------------------


    * ==========================
    * MOVEM CHECK
MOVEMCheckStart 
    * Zero out the non-freebee bits
    AND.L #%1111101110000000, D4
    * Compare it
    CMP #%0100100010000000, D4
    * If it was equal, then branch
    BEQ MOVEMSpot
MOVEMCheckEnd
    * Otherwise, fall through (and load D4 again)
    MOVE.W (A6), D4
    * -----------------------------


    * ==========================
    * LEA CHECK
LEACheckStart 
    * Zero out the non-freebee bits
    AND.L #%1111000111000000, D4
    * Compare it
    CMP #%0100000111000000, D4
    * If it was equal, then branch
    BEQ LEASpot
LEACheckEnd
    * Otherwise, fall through (and load D4 again)
    MOVE.W (A6), D4
    * -----------------------------    

* ++++++++++++++++++++++++++++++++++++++++





* ++++++++++++++++++++++++++++++++++++++++


* We ran out of things to check
* This must be raw data 
    * Do the data stuff....
    
    * The we can jump to the All Done sction
    *BRA ALLDone
    * Now we use problem to show that
    BRA Problem

* ++++++++++++++++++++++++++++++
* 0100 Group
* +++++++++++++++++++++++++++++



*********************************************************
*********************************************************
* CLR
* Modes allowed:
* Dn, (An), (An)+, -(An), xxx.W, xxx.L
*********************************************************
*********************************************************

CLRSpot
     
    * This is the clear stuff
    *MOVE.W	#CLR_, (A4)+			*Add address of CLR to buffer
    
    MOVE.B   #$43,(A4)+ * C
    MOVE.B   #$4C,(A4)+ * L
    MOVE.B   #$52,(A4)+ * R
    
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
     
     
    * Zero out the non-freebee bits
    AND.L #%0000000011000000, D4
    * Compare it for BYTE
    CMP #%0000000000000000, D4
    * If it was equal, then branch
    BEQ CLRPRINTDOTB
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000011000000, D4
    * Compare it for WORD
    CMP #%0000000001000000, D4
    * If it was equal, then branch
    BEQ CLRPRINTDOTW
    
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000011000000, D4
    * Compare it for LONG
    CMP #%0000000010000000, D4
    * If it was equal, then branch
    BEQ CLRPRINTDOTL
    
    *Otherwise, size wasn't right... so call PROBLEM
    BRA Problem
    
    


CLRPRINTDOTB
    * Print out .B
    *MOVE.W	#B_, (A4)+			*Add address of B to buffer
    MOVE.B   #$2E,(A4)+ * .
    MOVE.B   #$42,(A4)+ * B
    MOVE.B   #$20,(A4)+ * space
    BRA CLRLENGTHDONE
    
CLRPRINTDOTW
    * Print out .W
    *MOVE.W	#W_, (A4)+			*Add address of W to buffer
    MOVE.B   #$2E,(A4)+ * .
    MOVE.B   #$57,(A4)+ * W
    MOVE.B   #$20,(A4)+ * space

    BRA CLRLENGTHDONE
    
CLRPRINTDOTL
    * Print out .L
    *MOVE.W	#L_, (A4)+			*Add address of L to buffer
    MOVE.B   #$2E,(A4)+ * .
    MOVE.B   #$4C,(A4)+ * L
    MOVE.B   #$20,(A4)+ * space

    BRA CLRLENGTHDONE
    
    
        
    

CLRLENGTHDONE
    
    * Now look at Modes
    MOVE.W   (A6), D4              * Move to D4 to edit it
     
     
    * Zero out the non-freebee bits
    AND.L #%0000000000111000, D4
    * Compare it for Dn
    CMP #%0000000000000000, D4
    * If it was equal, then branch
    BEQ CLRPRINTDN
    
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000111000, D4
    * Compare it for (An)
    CMP #%0000000000010000, D4
    * If it was equal, then branch
    BEQ CLRPRINTANBUBBLE
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000111000, D4
    * Compare it for (An)+
    CMP #%0000000000011000, D4
    * If it was equal, then branch
    BEQ CLRPRINTANBUBBLEPLUS
    
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000111000, D4
    * Compare it for -(An)
    CMP #%0000000000100000, D4
    * If it was equal, then branch
    BEQ CLRPRINTANBUBBLEMINUS
    
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000111111, D4
    * Compare it for xxx.W
    CMP #%0000000000111000, D4
    * If it was equal, then branch
    BEQ CLRPRINTWORD
    
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.L #%0000000000111111, D4
    * Compare it for xxx.L
    CMP #%0000000000111001, D4
    * If it was equal, then branch
    BEQ CLRPRINTLONG
    
    *Otherwise, size wasn't right... so call PROBLEM
    BRA Problem


CLRPRINTDN
    * Print out Dn
    *MOVE.W	#D_, (A4)+			*Add address of Dn to buffer
    MOVE.B   #$44,(A4)+ * D
    MOVE.W   (A6), D4	* Reset the D4 Register
    JSR RegPrint    *Print the proper number   
    BRA CLRMODEDONE
    
CLRPRINTANBUBBLE
    * Print out (An)
    MOVE.B   #$28,(A4)+ * (
    MOVE.B   #$41,(A4)+ * A
    MOVE.W   (A6), D4	* Reset the D4 Register
    JSR RegPrint    *Print the proper number 
    MOVE.B   #$29,(A4)+ * )

*MOVE.W	#LPAR_, (A4)+	
    *MOVE.W	#A_, (A4)+		
    *MOVE.W   (A6), D4	* Reset the D4 Register
    *JSR BinaryToDecimalPrint    *Print the proper number 
    *MOVE.W	#RPAR_, (A4)+	
    
    BRA CLRMODEDONE
    
CLRPRINTANBUBBLEPLUS
    * Print out (An)+
    *MOVE.W	#LPAR_, (A4)+	
    *MOVE.W	#A_, (A4)+		
    *MOVE.L   (A6), D4	* Reset the D4 Register
    *JSR BinaryToDecimalPrint    *Print the proper number 
    *MOVE.W	#RPAR_, (A4)+
    *MOVE.W	#PLUS_, (A4)+
    
    MOVE.B   #$28,(A4)+ * (
    MOVE.B   #$41,(A4)+ * A
    MOVE.W   (A6), D4	* Reset the D4 Register
    JSR RegPrint    *Print the proper number 
    MOVE.B   #$29,(A4)+ * )
    MOVE.B   #$2B,(A4)+ * +
    
    BRA CLRMODEDONE
    
CLRPRINTANBUBBLEMINUS
    * Print out -(An)
    *MOVE.W	#MINUS_, (A4)+
    *MOVE.W	#LPAR_, (A4)+	
    *MOVE.W	#A_, (A4)+		
    *MOVE.L   (A6), D4	* Reset the D4 Register
    *JSR BinaryToDecimalPrint    *Print the proper number 
    *MOVE.W	#RPAR_, (A4)+
    

    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$28,(A4)+ * (
    MOVE.B   #$41,(A4)+ * A
    MOVE.W   (A6), D4	* Reset the D4 Register
    JSR RegPrint    *Print the proper number 
    MOVE.B   #$29,(A4)+ * )
    

    BRA CLRMODEDONE
    
CLRPRINTWORD
    * Print out xxx.W
    * So we need to add the next word to the print buffer
    * Put the $ in front
    *MOVE.W #Dollar_, (A4)+
    *MOVE.W (A6)+, (A4)+
    *MOVE.B   #$24,(A4)+ * $
    
    MOVE.B   #$24,(A4)+ *$
    * We need to bump up the A6
    MOVE.W (A6)+, D4
    MOVE.W (A6)+, D4 * Do it again
    JSR PrintMemoryWord
    * Then we better remember to bump up A2
    MOVE.W (A2)+, D4 * This is just to bump things up

    
    BRA CLRMODEDONE
    
CLRPRINTLONG
    * Print out xxx.L
    *MOVE.W #Dollar_, (A4)+
    *MOVE.L (A6)+, (A4)+
    
    MOVE.B   #$24,(A4)+ *$

    MOVE.W (A6)+, D4
    MOVE.L (A6)+, D4
    JSR PrintMemoryLong
    
    * Then we better remember to bump up A2
    MOVE.W (A2)+, D4 * This is just to bump things up once
    MOVE.W (A2)+, D4 * Bump it up again




    BRA CLRMODEDONE
    
    
    
    
CLRMODEDONE
    
    * Well everything seems to be good, so we can go to AllDone and call it good
    BRA ALLDone

*********************************************************
*********************************************************
*********************************************************
*********************************************************





*********************************************************
*********************************************************
* 
*********************************************************
*********************************************************
Spot
    *It's an easy one
    MOVE.B   #$4E,(A4)+ *N
    MOVE.B   #$4F,(A4)+ *O
    MOVE.B   #$50,(A4)+ *P
    BRA AllDone
*********************************************************
*********************************************************
    
    

*********************************************************
*********************************************************
* RTS
*********************************************************
*********************************************************
RTSSpot
    
    MOVE.B   #$52,(A4)+ *R
    MOVE.B   #$54,(A4)+ *T
    MOVE.B   #$53,(A4)+ *S
    BRA AllDone
*********************************************************
*********************************************************



*********************************************************
*********************************************************
* JSR
* Modes allowed:
* (An), xxx.W, xxx.L
*********************************************************
*********************************************************

JSRSpot
    
    * This is all the JSR Stuff
    
    * We don't have to worry about size and stuff like that...
    
    * So let's print a JSR to the buffer
    *MOVE.W #JSR_, (A4)+
    MOVE.B   #$4A,(A4)+ *J
    MOVE.B   #$53,(A4)+ *S
    MOVE.B   #$52,(A4)+ *R
    MOVE.B   #$20,(A4)+ *space
    
    * Now with that let's check the other modes it could be
     MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.W #%0000000000111000, D4
    * Compare it for (An)
    CMP.W #%0000000000010000, D4
    * If it was equal, then branch
    BEQ JSRAnBubble
    
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.W #%0000000000111111, D4
    * Compare it for xxx.W
    CMP.W #%00000000000111000, D4
    * If it was equal, then branch
    BEQ JSRWord
    
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.W #%0000000000111111, D4
    * Compare it for xxx.L
    CMP.W #%00000000000111001, D4
    * If it was equal, then branch
    BEQ JSRLong
    
    
    
    
    * It wasn't one of the allowed modes
    BRA Problem
    
    
    
    
JSRAnBubble
    

    * Print out (An)
    *MOVE.W	#LPAR_, (A4)+	
    *MOVE.W	#A_, (A4)+	
    *MOVE.L   (A6), D4	* Reset the D4 Register
    *JSR BinaryToDecimalPrint    *Print the proper number 
    *MOVE.W	#RPAR_, (A4)+	
    * Print out (An)
    MOVE.B   #$28,(A4)+ * (
    MOVE.B   #$41,(A4)+ * A
    MOVE.W   (A6), D4	* Reset the D4 Register
    JSR RegPrint    *Print the proper number 
    MOVE.B   #$29,(A4)+ * )


    BRA JSRModeDone
    

JSRWord
    
    *MOVE.W #Dollar_, (A4)+
    *MOVE.W (A6)+, (A4)+
    
    MOVE.B   #$24,(A4)+ *$
    * We need to bump up the A6
    MOVE.W (A6)+, D4
    MOVE.W (A6)+, D4 * Do it again
    JSR PrintMemoryWord
    * Then we better remember to bump up A2
    MOVE.W (A2)+, D4 * This is just to bump things up
    
    BRA JSRModeDone
    
JSRLong
    
    *MOVE.W #Dollar_, (A4)+
    *MOVE.L (A6)+, (A4)+
    
    MOVE.B   #$24,(A4)+ *$

    MOVE.W (A6)+, D4
    MOVE.L (A6)+, D4
    JSR PrintMemoryLong
    
    * Then we better remember to bump up A2
    MOVE.W (A2)+, D4 * This is just to bump things up once
    MOVE.W (A2)+, D4 * Bump it up again



    BRA JSRModeDone
    
    
    
    
    
JSRModeDone
    * OK we figured out the mode and it passed
    
    * We can go to All Done because it's good
    BRA AllDone
  
  
*********************************************************
*********************************************************
*********************************************************
*********************************************************




*********************************************************
*********************************************************
* MOVEM
* Syntax:
*   LEA <EA>, List
* Modes allowed for Register to Memory:
* (An), xxx.W, xxx.L
* Modes allowed for Memory to Register:
* (An), (An)+, xxx.W, xxx.L
* Then there is a register List mask that follows it
*********************************************************
*********************************************************
MOVEMSpot
    
    
    
    * First we need to put the MOVEM into the print buffer
    *MOVE.W #MOVEM_, (A4)+
    MOVE.B   #$4D,(A4)+ *M
    MOVE.B   #$4F,(A4)+ *O
    MOVE.B   #$56,(A4)+ *V
    MOVE.B   #$45,(A4)+ *E
    MOVE.B   #$4D,(A4)+ *M
    
    * Then we can figure out the size needed
    
    * Then load up D4 to mess with
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.W #%0000000001000000, D4
    * Compare it for (An)
    CMP.W #%0000000000000000, D4
    * If it was equal, then branch
    BEQ MOVEMPrintW
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.W #%0000000001000000, D4
    * Compare it for (An)
    CMP.W #%0000000001000000, D4
    * If it was equal, then branch
    BEQ MOVEMPrintL
    
MOVEMPrintW
    
    MOVE.B   #$2E,(A4)+ *.
    MOVE.B   #$57,(A4)+ *W
    MOVE.B   #$20,(A4)+ *space
    *MOVE.W	#W_, (A4)+			*Add address of L to buffer
    

    BRA MOVEMPrintDone
    
MOVEMPrintL
    
    *MOVE.W	#L_, (A4)+			*Add address of L to buffer
    MOVE.B   #$2E,(A4)+ *.
    MOVE.B   #$4C,(A4)+ *L
    MOVE.B   #$20,(A4)+ *space

    BRA MOVEMPrintDone

MOVEMPrintDone
    

    
    
    * We will need this later
    * Make sure D5 is loaded with the regiser mask for us
    * We also need to keep track of the Register List mask
    MOVE.W (A6)+, D5 * This just loads it what it already is
    MOVE.W (A6), D5 * Now it has the Register list mask in case we need it
    CLR.W D6
    MOVE.W D5, D6 * this will be our one to mess with
    MOVE.W -(A6), D5
    MOVE.W D6, D5


    
    * Then load up D4 to mess with
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.W #%0000010000000000, D4
    * Compare it for (An)
    CMP.W #%0000000000000000, D4
    * If it was equal, then branch
    BEQ MOVEMRegToMemory
    
    * Reload D4 to mess with
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.W #%0000010000000000, D4
    * Compare it for (An)
    CMP.W #%0000010000000000, D4
    * If it was equal, then branch
    BEQ MOVEMMemoryToReg

    

MOVEMRegToMemory
    
    * So we need to keep track of the register list
    
    * Reload D4
    MOVE.W   (A6), D4              * Move to D4 to edit it

    * We also need to keep track of the Register List mask
    MOVE.W (A6)+, D5 * This just loads it what it already is
    MOVE.W (A6), D5 * Now it has the Register list mask in case we need it
    CLR.W D6
    MOVE.W D5, D6 * this will be our one to mess with
    MOVE.W -(A6), D5
    MOVE.W D6, D5
    * Now D5 lookes like this, unless it's -(An), then it's backward
    * We will deal with these later
    * A7, A6, A5, A4, A3, A6, A1, A0, D7, D6, D5, D4, D3, D2, D1, D0
    
    * The usual pattern goes like this
    * D1-D3/A6-A5
    CLR.L D7
    * For what wer're doing D7 will hold the info about what we need
    * The word in D7 will let us know the registers
    * $0000 = $Aend Astart Dend Dstart

    
    * If we set everything up right, then it should do the work for us...
    *JSR MOVEMFindRegRange
    
    
    * WE NEED TO CHECK FOR -(An)HERE
    *Reload D4
    MOVE.W (A6), D4
    AND.W #%0000000000111000, D4
    CMP.W #%0000000000100000, D4
    *BEQ BackwardsRegisterPrint
    *BEQ MOVEMBackwardPrintRegRange
    BEQ PrintBackward
    * Now at this point D7 should hold the info we need
    JSR MOVEMRegPrintisterRange
    BRA MOVEMBackOnTrack

PrintBackward
    
    JSR MOVEMBackwardPrintRegRange
   
   
MOVEMBackOnTrack 
    
    *MOVE.W	#COMMA_, (A4)+
    MOVE.B   #$2C,(A4)+ *,
    MOVE.B   #$20,(A4)+ *space

    
    * Now onto the EA
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.W #%0000000000111000, D4
    * Compare it for (An)
    CMP.W #%0000000000010000, D4
    * If it was equal, then branch
    BEQ MOVEMPrintAnBubble
        
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.W #%0000000000111000, D4
    * Compare it for -(An)
    CMP.W #%0000000000100000, D4
    * If it was equal, then branch
    BEQ MOVEMPrintAnMinus
    
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.W #%0000000000111111, D4
    * Compare it for xxx.W
    CMP.W #%0000000000111000, D4
    * If it was equal, then branch
    BEQ MOVEMPrintWord
    
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.W #%0000000000111111, D4
    * Compare it for xxx.L
    CMP.W #%0000000000111001, D4
    * If it was equal, then branch
    BEQ MOVEMPrintLong
    
    *Otherwise, something wasn't right... so call PROBLEM
    BRA MOVEMProblem


MOVEMPrintAnBubble
    
    * Print out (An)
    *MOVE.W	#LPAR_, (A4)+	
    *MOVE.W	#A_, (A4)+	
    *MOVE.L   (A6), D4	* Reset the D4 Register
    *JSR BinaryToDecimalPrint    *Print the proper number 
    *MOVE.W	#RPAR_, (A4)+
    
    MOVE.B   #$28,(A4)+ * (
    MOVE.B   #$41,(A4)+ * A
    MOVE.W   (A6), D4	* Reset the D4 Register
    JSR RegPrint    *Print the proper number 
    MOVE.B   #$29,(A4)+ * )
    
    BRA MOVEMPrintEADone
    
    
    
MOVEMPrintAnMinus
    
    * Print out -(An)
    *MOVE.W	#MINUS_, (A4)+
    *MOVE.W	#LPAR_, (A4)+	
    *MOVE.W	#A_, (A4)+	
    *MOVE.L   (A6), D4	* Reset the D4 Register
    *JSR BinaryToDecimalPrint    *Print the proper number 
    *MOVE.W	#RPAR_, (A4)+
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$28,(A4)+ * (
    MOVE.B   #$41,(A4)+ * A
    MOVE.W   (A6), D4	* Reset the D4 Register
    JSR RegPrint    *Print the proper number 
    MOVE.B   #$29,(A4)+ * )
    
    
    ****************************
    ** THIS IS THE WEIRD ONE!
    ** But we took care of it above
    ***************************
    
    
    BRA MOVEMPrintEADone
    
    
    
MOVEMPrintWord
    
    *MOVE.W #Dollar_, (A4)+
    * This special case we need to bump it up for us
    *MOVE.W (A6)+, D4
    *MOVE.W (A6)+, (A4)+
    *MOVE.W -(A6), D4
    *BRA JSRModeDone
    
    MOVE.B   #$24,(A4)+ *$
    * We need to bump up the A6
    MOVE.W (A6)+, D4
    MOVE.W (A6)+, D4 * Do it again
    *One more time because this is MOVEM
    MOVE.W (A6)+, D4
    JSR PrintMemoryWord
    * Then we better remember to bump up A2
    MOVE.W (A2)+, D4 * This is just to bump things up



    BRA MOVEMPrintEADone

MOVEMPrintLong
    
    *MOVE.W #Dollar_, (A4)+
    * This special case we need to bump it up for us
    *MOVE.W (A6)+, D4
    *MOVE.L (A6)+, (A4)+
    *MOVE.W -(A6), D4
    *BRA JSRModeDone
    
    MOVE.B   #$24,(A4)+ *$

    MOVE.W (A6)+, D4
    MOVE.W (A6)+, D4
    * Then one more final Long time for MOVEM
    MOVEM.L (A6), D4
    JSR PrintMemoryLong
    
    * Then we better remember to bump up A2
    MOVE.W (A2)+, D4 * This is just to bump things up once
    MOVE.W (A2)+, D4 * Bump it up again



    BRA MOVEMPrintEADone
    
MOVEMPrintEADone
    
    BRA MOVEMDirectionDone
    
    



MOVEMMemoryToReg
    

    * Reload D4
    MOVE.W   (A6), D4              * Move to D4 to edit it

    * Then we need 
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.W #%0000000000111000, D4
    * Compare it for (An)
    CMP #%0000000000010000, D4
    * If it was equal, then branch
    BEQ MOVEMM2RPrintAnBubble
        
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.W #%0000000000111000, D4
    * Compare it for -(An)
    CMP #%0000000000011000, D4
    * If it was equal, then branch
    BEQ MOVEMM2RPrintAnPlus
    
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.W #%0000000000111111, D4
    * Compare it for xxx.W
    CMP #%0000000000111000, D4
    * If it was equal, then branch
    BEQ MOVEMM2RPrintWord
    
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.W #%0000000000111111, D4
    * Compare it for xxx.L
    CMP #%0000000000111001, D4
    * If it was equal, then branch
    BEQ MOVEMM2RPrintLong
    
    *Otherwise, size wasn't right... so call PROBLEM
    BRA Problem



MOVEMM2RPrintAnBubble
    
     * Print out (An)
    *MOVE.W	#LPAR_, (A4)+	
    *MOVE.W	#A_, (A4)+	
    *MOVE.L   (A6), D4	* Reset the D4 Register
    *JSR BinaryToDecimalPrint    *Print the proper number 
    *MOVE.W	#RPAR_, (A4)+
    
    
    MOVE.B   #$28,(A4)+ * (
    MOVE.B   #$41,(A4)+ * A
    MOVE.W   (A6), D4	* Reset the D4 Register
    JSR RegPrint    *Print the proper number 
    MOVE.B   #$29,(A4)+ * )
    
    * Get (A6) to the spot to read 
    MOVE.W (A6)+, D4
    MOVE.W (A6), D5
    MOVE.W D5, D6

    BRA MOVEMM2RPrintDone
    
MOVEMM2RPrintAnPlus
    
   
   * MOVE.W	#LPAR_, (A4)+	
   * MOVE.W	#A_, (A4)+	
   * MOVE.L   (A6), D4	* Reset the D4 Register
   * JSR BinaryToDecimalPrint    *Print the proper number 
   * MOVE.W	#RPAR_, (A4)+
   * MOVE.W	#PLUS_, (A4)+
    
    
    MOVE.B   #$28,(A4)+ * (
    MOVE.B   #$41,(A4)+ * A
    MOVE.W   (A6), D4	* Reset the D4 Register
    JSR RegPrint    *Print the proper number 
    MOVE.B   #$29,(A4)+ * )
    MOVE.B   #$2B,(A4)+ * +
    
    * Get (A6) to the spot to read 
    MOVE.W (A6)+, D4
    MOVE.W (A6), D5
    MOVE.W D5, D6
 
    
    * We won't use this
    BRA MOVEMM2RPrintDone
    
MOVEMM2RPrintWord
    
    
    *MOVE.W #Dollar_, (A4)+
    * This special case we need to bump it up for us
    *MOVE.W (A6)+, D4
    *MOVE.W (A6)+, D4
    *MOVE.W (A6), (A4)+
    *MOVE.W -(A6), D4
    *MOVE.W -(A6), D4
    
    

    MOVE.B   #$24,(A4)+ *$
    * We need to bump up the A6
    MOVE.W (A6)+, D4
    MOVE.W (A6)+, D4 * Do it again
    *One more time because this is MOVEM
    MOVE.W (A6), D4
    JSR PrintMemoryWord
    * Then can we roll it back to get D5 ready
    MOVE.W -(A6), D5
    MOVE.W -(A6), D4
    * Then we better remember to bump up A2
    MOVE.W (A2)+, D4 * This is just to bump things up
    * One extra time for MOVEM
    * Taken care of late MOVE.W (A2)+, D4
    
    BRA MOVEMM2RPrintDone
    
    
MOVEMM2RPrintLong
    

    
    *MOVE.W #Dollar_, (A4)+
    * This special case we need to bump it up for us
    *MOVE.W (A6)+, D4
    *MOVE.L (A6)+, (A4)+
    *MOVE.W -(A6), D4
    
    MOVE.B   #$24,(A4)+ *$
    * We need to bump up the A6
    MOVE.W (A6)+, D4
    MOVE.W (A6)+, D4 * Do it again
    *One more time because this is MOVEM
    MOVE.L (A6), D4
    JSR PrintMemoryLong
    * Then can we roll it back to get D5 ready
    MOVE.W -(A6), D5
    MOVE.W -(A6), D4
    * Then we better remember to bump up A2
    MOVE.W (A2)+, D4 * This is just to bump things up
    MOVE.W (A2)+, D4 * One more because of the LONG
    
    BRA MOVEMM2RPrintDone
    
MOVEMM2RPrintDone
    
    
    * Then We have all the mode done
    

    * Let's just assume that D5 and D6 are all loaded and ready to go
    * D7 will hold the info about if things need to be printed
    
    * So let's print a comma
    *MOVE.W #COMMA_, (A4)+
    MOVE.B   #$2C,(A4)+ * ,
    MOVE.B   #$20,(A4)+ * space
     
    
    
    
     * If we set everything up right, then it should do the work for us...
    *JSR MOVEMFindRegRange
    
    * Now at this point D7 should hold the info we need
    JSR MOVEMRegPrintisterRange   
    
    * If we got to this point, then we are good to go
    * At
    BRA MOVEMAllDone
    *BRA AllDone * We don't need an extra bump up for this one....

    
    

    
MOVEMDirectionDone
    
    * This is all the MOVEM Stuff
    * But A6 needs to be bumped up one more Time
    *MOVE.W (A6)+, D4
    BRA MOVEMAllDone


    
    




MOVEMRegPrintisterRange

    * D5 can have our register mask that we will mess with in D4
    * D7 at 0001 or 0000 can tell us if we are looking for a start or end
    * 0001 or bigger is a Start of a streak
    * 0000 is an End of a streak

    * Just for the moment (in this function) we will use D0 as a counter

    
    
    
    * It's the start so we are looking for a first one
    CLR.W D7
    MOVE.W #$0000, D7 * We don't have anything yet...
    
    * Load D5 content into D4
    MOVE.W D5, D4
    * This would be where we roll if necessary
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMIncludeD0
    
    BRA MOVEMNoD0
    
    
MOVEMIncludeD0
    
    * We need to make sure D0 is included
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$30,(A4)+ * 0
    
    * Mark that we started something
    MOVE.W #$0001, D7
    * Then we can call it good
    BRA MOVEMD0Done
    
    
MOVEMNoD0
    
    BRA MOVEMD0Done

MOVEMD0Done  




  
    * Now to check D1
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #1, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMIncludeD1
    
    BRA MOVEMNoD1
    
    
    
MOVEMIncludeD1
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ StartD1Streak
    
    * Otherwise, Streak is going ... just keep going
    ADD.W #1, D7
    BRA MOVEMD1Done
    
    
    
StartD1Streak
    
    * If we're starting a streak we need to check if we need a slash
    *JSR MOVEMCheckPastStreak
    
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$31,(A4)+ * 1
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMD1Done    


MOVEMNoD1
    * If we had a streak we can end it (but this is a weird case)
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BEQ MOVEMEndD1Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMD1Done
    
MOVEMEndD1Streak
    
    * Then we can mark the streak as done
    *JSR MOVEMEndStreak
    *MOVE.B   #$2D,(A4)+ * -
   * MOVE.B   #$44,(A4)+ * D
    *MOVE.B   #$31,(A4)+ * 1
    
    * This one is weird, so let's handle it this way
    MOVE.W #$0100, D7 * Mark the streak is over and that we've had one

    BRA MOVEMD1Done

MOVEMD1Done    
    
    * Now to check D2
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #2, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMIncludeD2
    
    BRA MOVEMNoD2
    
    
    



MOVEMIncludeD2
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0000, D4
    BEQ StartD2Streak
    
    * Otherwise, keep streak going... just keep going
    ADD.W #1, D7
    BRA MOVEMD2Done
    
    
    
StartD2Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$32,(A4)+ * 2
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMD2Done    


MOVEMNoD2
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0001, D4
    BGE MOVEMEndD2Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMD2Done
    
MOVEMEndD2Streak
    
    
    * Print out the end of the streak
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$31,(A4)+ * 1
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    BRA MOVEMD2Done

MOVEMD2Done    
    
    * Now to check D3
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #3, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMIncludeD3
    
    BRA MOVEMNoD3



MOVEMIncludeD3
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ StartD3Streak
    
    * Otherwise, keep going.. just keep going
    ADD.W #1, D7
    BRA MOVEMD3Done
    
    
    
StartD3Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$33,(A4)+ * 3
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMD3Done    


MOVEMNoD3
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMEndD3Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMD3Done
    
MOVEMEndD3Streak
    

    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$32,(A4)+ * 2
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    BRA MOVEMD3Done

MOVEMD3Done    
    
    * Now to check D4
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #4, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMIncludeD4
    
    BRA MOVEMNoD4


MOVEMIncludeD4
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ StartD4Streak
    
    * Otherwise, keep going
    ADD.W #1, D7
    BRA MOVEMD4Done
    
    
    
StartD4Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$34,(A4)+ * 4
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMD4Done    


MOVEMNoD4
    * If we had astreak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMEndD4Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMD4Done
    
MOVEMEndD4Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$33,(A4)+ * 3
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    
    BRA MOVEMD4Done

MOVEMD4Done    
    
    * Now to check D5
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #5, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMIncludeD5
    
    BRA MOVEMNoD5






MOVEMIncludeD5
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ StartD5Streak
    
    * Otherwise, more streak
    ADD.W #1, D7
    BRA MOVEMD5Done
    
    
    
StartD5Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$35,(A4)+ * 5
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMD5Done    


MOVEMNoD5
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMEndD5Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMD5Done
    
MOVEMEndD5Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$34,(A4)+ * 4
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    
    BRA MOVEMD5Done

MOVEMD5Done    
    
    * Now to check D6
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #6, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMIncludeD6
    
    BRA MOVEMNoD6



MOVEMIncludeD6
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ StartD6Streak
    
    * Otherwise, more streak
    ADD.W #1, D7
    BRA MOVEMD6Done
    
    
    
StartD6Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$36,(A4)+ * 6
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMD6Done    


MOVEMNoD6
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMEndD6Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMD6Done
    
MOVEMEndD6Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$35,(A4)+ * 5
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    
    BRA MOVEMD5Done

MOVEMD6Done    
    
    * Now to check D7
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #7, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMIncludeD7
    
    BRA MOVEMNoD7




MOVEMIncludeD7
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ StartD7Streak
    
    * Otherwise, no streak to start..., but we need to end this one
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$37,(A4)+ * 7
    
    * Mark we have a past streak, because it's ending either way
    *JSR MOVEMEndStreak
    * This one is weird, so do it by hand
    MOVE.W #$0100, D7
    
    BRA MOVEMD7Done
    
    
    
StartD7Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$37,(A4)+ * 7
    
    * Mark we have a past streak, because it's ending either way
    *JSR MOVEMEndStreak
    * This one is weird, so do it by hand
    MOVE.W #$0100, D7
    
    BRA MOVEMD7Done    


MOVEMNoD7
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMEndD7Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMD7Done
    
MOVEMEndD7Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$36,(A4)+ * 6
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    BRA MOVEMD7Done

MOVEMD7Done    
    
    
    
    




* Then we can move on to the A section

    * Now to check A0
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #8, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMIncludeA0
    
    BRA MOVEMNoA0


MOVEMIncludeA0
    
    
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    * We need to make sure A0 is included
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$30,(A4)+ * 0
    
    * Mark that we started something
    MOVE.W #$0001, D7
    * Then we can call it good
    BRA MOVEMA0Done
    
    
MOVEMNoA0
    
    BRA MOVEMA0Done

MOVEMA0Done  





    * Now to check A1
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #8, D4
    ROR.W #1, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMIncludeA1
    
    BRA MOVEMNoA1
    
    
    
MOVEMIncludeA1
    
    * Have we started a streak?
    
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0000, D4
    BEQ  StartA1Streak
    
    * Otherwise, no streak to start... just keep going
    ADD.W #1, D7
    BRA MOVEMA1Done
    
    
    
StartA1Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$31,(A4)+ * 1
    
    MOVE.W #$0001, D7
    
    
    BRA MOVEMA1Done    


MOVEMNoA1
    * If we had a streak we can end it (but this is a weird case)
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMEndA1Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMA1Done
    
MOVEMEndA1Streak
    
    * Then we can mark the streak as done
    *JSR MOVEMEndStreak
    * This is a weird one, do it by hand
    MOVE.W #$0100, D7
    * This is where we would print the last one if it wasn't weird
    BRA MOVEMA1Done

MOVEMA1Done    


    * Now to check A2
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #8, D4
    ROR.W #2, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMIncludeA2
    
    BRA MOVEMNoA2



MOVEMIncludeA2
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ StartA2Streak
    
    * Otherwise, no streak to start... just keep it goina
    ADD.W #1, D7
    BRA MOVEMA2Done
    
    
    
StartA2Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$32,(A4)+ * 2
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMA2Done    


MOVEMNoA2
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMEndA2Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMA2Done
    
MOVEMEndA2Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$31,(A4)+ * 1
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    
    BRA MOVEMA2Done

MOVEMA2Done    



    * Now to check A3
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #8, D4
    ROR.W #3, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMIncludeA3
    
    BRA MOVEMNoA3



MOVEMIncludeA3
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ StartA3Streak
    
    * Otherwise, no streak to start... just keep going
    ADD.W #1, D7
    BRA MOVEMA3Done
    
    
    
StartA3Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$33,(A4)+ * 3
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMA3Done    


MOVEMNoA3
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMEndA3Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMA3Done
    
MOVEMEndA3Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$32,(A4)+ * 2
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    
    BRA MOVEMA3Done

MOVEMA3Done   


    * Now to check A4
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #8, D4
    ROR.W #4, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMIncludeA4
    
    BRA MOVEMNoA4



MOVEMIncludeA4
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ StartA4Streak
    
    * Otherwise, no streak to start... just keep going
    ADD.W #1, D7
    BRA MOVEMA4Done
    
    
    
StartA4Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$34,(A4)+ * 4
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMA4Done    


MOVEMNoA4
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMEndA4Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMA4Done
    
MOVEMEndA4Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$33,(A4)+ * 3
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    
    BRA MOVEMA4Done

MOVEMA4Done   


    * Now to check A5
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #8, D4
    ROR.W #5, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMIncludeA5
    
    BRA MOVEMNoA5



MOVEMIncludeA5
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ StartA5Streak
    
    * Otherwise, no streak to start... just keep going
    ADD.W #1, D7
    BRA MOVEMA5Done
    
    
    
StartA5Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$35,(A4)+ * 5
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMA5Done    


MOVEMNoA5
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMEndA5Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMA5Done
    
MOVEMEndA5Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$34,(A4)+ * 4
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    
    BRA MOVEMA5Done

MOVEMA5Done   



    * Now to check A6
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #8, D4
    ROR.W #6, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMIncludeA6
    
    BRA MOVEMNoA6



MOVEMIncludeA6
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ StartA6Streak
    
    * Otherwise, no streak to start... just keep going
    ADD.W #1, D7
    BRA MOVEMA6Done
    
    
    
StartA6Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$36,(A4)+ * 6
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMA6Done    


MOVEMNoA6
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMEndA6Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMA6Done
    
MOVEMEndA6Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$35,(A4)+ * 5
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    
    BRA MOVEMA6Done

MOVEMA6Done   

    * Now to check A7
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #8, D4
    ROR.W #7, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMIncludeA7
    
    BRA MOVEMNoA7



MOVEMIncludeA7
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ StartA7Streak
    
    * Otherwise, no streak to start... just keep going
    * We're going to finish it now
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$37,(A4)+ * 7
    * We don't have to worry about marking things, because we're done
    
    BRA MOVEMA7Done
    
    
    
StartA7Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$37,(A4)+ * 7
    
    * We don't have to worry about staring a streak, this is the end
    BRA MOVEMA7Done    


MOVEMNoA7
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMEndA7Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMA7Done
    
MOVEMEndA7Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$36,(A4)+ * 6
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    * This is another weird case, that we want to do it by hand
    * We probably don't have to worry about things here
    
    
    BRA MOVEMA7Done

MOVEMA7Done   



    
    
    * We're done with this subroutine
    RTS





************************************
* Start of Backward Print
***********************************
MOVEMBackwardPrintRegRange

    * D5 can have our register mask that we will mess with in D4
    * D7 at 0001 or 0000 can tell us if we are looking for a start or end
    * 0001 or bigger is a Start of a streak
    * 0000 is an End of a streak

    * Just for the moment (in this function) we will use D0 as a counter

    
    
    
    * It's the start so we are looking for a first one
    CLR.W D7
    MOVE.W #$0000, D7 * We don't have anything yet...
    
    * Load D5 content into D4
    MOVE.W D5, D4
    ROR.W #8, D4
    ROR.W #7, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMBackwardPrintIncludeD0
    
    BRA MOVEMBackwardPrintNoD0
    
    
MOVEMBackwardPrintIncludeD0
    
    * We need to make sure D0 is included
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$30,(A4)+ * 0
    
    * Mark that we started something
    MOVE.W #$0001, D7
    * Then we can call it good
    BRA MOVEMBackwardPrintD0Done
    
    
MOVEMBackwardPrintNoD0
    
    BRA MOVEMBackwardPrintD0Done

MOVEMBackwardPrintD0Done  




  
    * Now to check D1
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #8, D4
    ROR.W #6, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMBackwardPrintIncludeD1
    
    BRA MOVEMBackwardPrintNoD1
    
    
    
MOVEMBackwardPrintIncludeD1
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ MOVEMBackwardStartD1Streak
    
    * Otherwise, Streak is going ... just keep going
    ADD.W #1, D7
    BRA MOVEMBackwardPrintD1Done
    
    
    
MOVEMBackwardStartD1Streak
    
    * If we're starting a streak we need to check if we need a slash
    *JSR MOVEMBackwardPrintCheckPastStreak
    
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$31,(A4)+ * 1
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMBackwardPrintD1Done    


MOVEMBackwardPrintNoD1
    * If we had a streak we can end it (but this is a weird case)
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BEQ MOVEMBackwardPrintEndD1Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMBackwardPrintD1Done
    
MOVEMBackwardPrintEndD1Streak
    
    * Then we can mark the streak as done
    *JSR MOVEMBackwardPrintEndStreak
    *MOVE.B   #$2D,(A4)+ * -
   * MOVE.B   #$44,(A4)+ * D
    *MOVE.B   #$31,(A4)+ * 1
    
    * This one is weird, so let's handle it this way
    MOVE.W #$0100, D7 * Mark the streak is over and that we've had one

    BRA MOVEMBackwardPrintD1Done

MOVEMBackwardPrintD1Done    
    
    * Now to check D2
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #8, D4
    ROR.W #5, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMBackwardPrintIncludeD2
    
    BRA MOVEMBackwardPrintNoD2
    
    
    



MOVEMBackwardPrintIncludeD2
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0000, D4
    BEQ MOVEMBackwardStartD2Streak
    
    * Otherwise, keep streak going... just keep going
    ADD.W #1, D7
    BRA MOVEMBackwardPrintD2Done
    
    
    
MOVEMBackwardStartD2Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$32,(A4)+ * 2
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMBackwardPrintD2Done    


MOVEMBackwardPrintNoD2
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0001, D4
    BGE MOVEMBackwardPrintEndD2Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMBackwardPrintD2Done
    
MOVEMBackwardPrintEndD2Streak
    
    
    * Print out the end of the streak
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$31,(A4)+ * 1
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    BRA MOVEMBackwardPrintD2Done

MOVEMBackwardPrintD2Done    
    
    * Now to check D3
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #8, D4
    ROR.W #4, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMBackwardPrintIncludeD3
    
    BRA MOVEMBackwardPrintNoD3



MOVEMBackwardPrintIncludeD3
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ MOVEMBackwardStartD3Streak
    
    * Otherwise, keep going.. just keep going
    ADD.W #1, D7
    BRA MOVEMBackwardPrintD3Done
    
    
    
MOVEMBackwardStartD3Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$33,(A4)+ * 3
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMBackwardPrintD3Done    


MOVEMBackwardPrintNoD3
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMBackwardPrintEndD3Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMBackwardPrintD3Done
    
MOVEMBackwardPrintEndD3Streak
    

    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$32,(A4)+ * 2
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    BRA MOVEMBackwardPrintD3Done

MOVEMBackwardPrintD3Done    
    
    * Now to check D4
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #8, D4
    ROR.W #3, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMBackwardPrintIncludeD4
    
    BRA MOVEMBackwardPrintNoD4


MOVEMBackwardPrintIncludeD4
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ MOVEMBackwardStartD4Streak
    
    * Otherwise, keep going
    ADD.W #1, D7
    BRA MOVEMBackwardPrintD4Done
    
    
    
MOVEMBackwardStartD4Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$34,(A4)+ * 4
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMBackwardPrintD4Done    


MOVEMBackwardPrintNoD4
    * If we had astreak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMBackwardPrintEndD4Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMBackwardPrintD4Done
    
MOVEMBackwardPrintEndD4Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$33,(A4)+ * 3
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    
    BRA MOVEMBackwardPrintD4Done

MOVEMBackwardPrintD4Done    
    
    * Now to check D5
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #8, D4
    ROR.W #2, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMBackwardPrintIncludeD5
    
    BRA MOVEMBackwardPrintNoD5






MOVEMBackwardPrintIncludeD5
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ MOVEMBackwardStartD5Streak
    
    * Otherwise, more streak
    ADD.W #1, D7
    BRA MOVEMBackwardPrintD5Done
    
    
    
MOVEMBackwardStartD5Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$35,(A4)+ * 5
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMBackwardPrintD5Done    


MOVEMBackwardPrintNoD5
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMBackwardPrintEndD5Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMBackwardPrintD5Done
    
MOVEMBackwardPrintEndD5Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$34,(A4)+ * 4
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    
    BRA MOVEMBackwardPrintD5Done

MOVEMBackwardPrintD5Done    
    
    * Now to check D6
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #8, D4
    ROR.W #1, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMBackwardPrintIncludeD6
    
    BRA MOVEMBackwardPrintNoD6



MOVEMBackwardPrintIncludeD6
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ MOVEMBackwardStartD6Streak
    
    * Otherwise, more streak
    ADD.W #1, D7
    BRA MOVEMBackwardPrintD6Done
    
    
    
MOVEMBackwardStartD6Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$36,(A4)+ * 6
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMBackwardPrintD6Done    


MOVEMBackwardPrintNoD6
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMBackwardPrintEndD6Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMBackwardPrintD6Done
    
MOVEMBackwardPrintEndD6Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$35,(A4)+ * 5
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    
    BRA MOVEMBackwardPrintD5Done

MOVEMBackwardPrintD6Done    
    
    * Now to check D7
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #8, D4

    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMBackwardPrintIncludeD7
    
    BRA MOVEMBackwardPrintNoD7




MOVEMBackwardPrintIncludeD7
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ MOVEMBackwardStartD7Streak
    
    * Otherwise, no streak to start..., but we need to end this one
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$37,(A4)+ * 7
    
    * Mark we have a past streak, because it's ending either way
    *JSR MOVEMEndStreak
    * This one is weird, so do it by hand
    MOVE.W #$0100, D7
    
    BRA MOVEMBackwardPrintD7Done
    
    
    
MOVEMBackwardStartD7Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$37,(A4)+ * 7
    
    * Mark we have a past streak, because it's ending either way
    *JSR MOVEMEndStreak
    * This one is weird, so do it by hand
    MOVE.W #$0100, D7
    
    BRA MOVEMBackwardPrintD7Done    


MOVEMBackwardPrintNoD7
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMBackwardPrintEndD7Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMBackwardPrintD7Done
    
MOVEMBackwardPrintEndD7Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$44,(A4)+ * D
    MOVE.B   #$36,(A4)+ * 6
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    BRA MOVEMBackwardPrintD7Done

MOVEMBackwardPrintD7Done    
    
    
    
    




* Then we can move on to the A section

    * Now to check A0
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #7, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMBackwardPrintIncludeA0
    
    BRA MOVEMBackwardPrintNoA0


MOVEMBackwardPrintIncludeA0
    
    
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    * We need to make sure A0 is included
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$30,(A4)+ * 0
    
    * Mark that we started something
    MOVE.W #$0001, D7
    * Then we can call it good
    BRA MOVEMBackwardPrintA0Done
    
    
MOVEMBackwardPrintNoA0
    
    BRA MOVEMBackwardPrintA0Done

MOVEMBackwardPrintA0Done  





    * Now to check A1
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #6, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMBackwardPrintIncludeA1
    
    BRA MOVEMBackwardPrintNoA1
    
    
    
MOVEMBackwardPrintIncludeA1
    
    * Have we started a streak?
    
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0000, D4
    BEQ  MOVEMBackwardStartA1Streak
    
    * Otherwise, no streak to start... just keep going
    ADD.W #1, D7
    BRA MOVEMBackwardPrintA1Done
    
    
    
MOVEMBackwardStartA1Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$31,(A4)+ * 1
    
    MOVE.W #$0001, D7
    
    
    BRA MOVEMBackwardPrintA1Done    


MOVEMBackwardPrintNoA1
    * If we had a streak we can end it (but this is a weird case)
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMBackwardPrintEndA1Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMBackwardPrintA1Done
    
MOVEMBackwardPrintEndA1Streak
    
    * Then we can mark the streak as done
    *JSR MOVEMEndStreak
    * This is a weird one, do it by hand
    MOVE.W #$0100, D7
    * This is where we would print the last one if it wasn't weird
    BRA MOVEMBackwardPrintA1Done

MOVEMBackwardPrintA1Done    


    * Now to check A2
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #5, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMBackwardPrintIncludeA2
    
    BRA MOVEMBackwardPrintNoA2



MOVEMBackwardPrintIncludeA2
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ MOVEMBackwardStartA2Streak
    
    * Otherwise, no streak to start... just keep it goina
    ADD.W #1, D7
    BRA MOVEMBackwardPrintA2Done
    
    
    
MOVEMBackwardStartA2Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$32,(A4)+ * 2
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMBackwardPrintA2Done    


MOVEMBackwardPrintNoA2
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMBackwardPrintEndA2Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMBackwardPrintA2Done
    
MOVEMBackwardPrintEndA2Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$31,(A4)+ * 1
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    
    BRA MOVEMBackwardPrintA2Done

MOVEMBackwardPrintA2Done    



    * Now to check A3
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #4, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMBackwardPrintIncludeA3
    
    BRA MOVEMBackwardPrintNoA3



MOVEMBackwardPrintIncludeA3
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ MOVEMBackwardStartA3Streak
    
    * Otherwise, no streak to start... just keep going
    ADD.W #1, D7
    BRA MOVEMBackwardPrintA3Done
    
    
    
MOVEMBackwardStartA3Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$33,(A4)+ * 3
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMBackwardPrintA3Done    


MOVEMBackwardPrintNoA3
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMBackwardPrintEndA3Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMBackwardPrintA3Done
    
MOVEMBackwardPrintEndA3Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$32,(A4)+ * 2
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    
    BRA MOVEMBackwardPrintA3Done

MOVEMBackwardPrintA3Done   


    * Now to check A4
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #3, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMBackwardPrintIncludeA4
    
    BRA MOVEMBackwardPrintNoA4



MOVEMBackwardPrintIncludeA4
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ MOVEMBackwardStartA4Streak
    
    * Otherwise, no streak to start... just keep going
    ADD.W #1, D7
    BRA MOVEMBackwardPrintA4Done
    
    
    
MOVEMBackwardStartA4Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$34,(A4)+ * 4
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMBackwardPrintA4Done    


MOVEMBackwardPrintNoA4
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMBackwardPrintEndA4Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMBackwardPrintA4Done
    
MOVEMBackwardPrintEndA4Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$33,(A4)+ * 3
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    
    BRA MOVEMBackwardPrintA4Done

MOVEMBackwardPrintA4Done   


    * Now to check A5
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #2, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMBackwardPrintIncludeA5
    
    BRA MOVEMBackwardPrintNoA5



MOVEMBackwardPrintIncludeA5
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ MOVEMBackwardStartA5Streak
    
    * Otherwise, no streak to start... just keep going
    ADD.W #1, D7
    BRA MOVEMBackwardPrintA5Done
    
    
    
MOVEMBackwardStartA5Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$35,(A4)+ * 5
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMBackwardPrintA5Done    


MOVEMBackwardPrintNoA5
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMBackwardPrintEndA5Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMBackwardPrintA5Done
    
MOVEMBackwardPrintEndA5Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$34,(A4)+ * 4
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    
    BRA MOVEMBackwardPrintA5Done

MOVEMBackwardPrintA5Done   



    * Now to check A6
    * So we can reset
    MOVE.W D5, D4
    * Roll it
    ROR.W #1, D4
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMBackwardPrintIncludeA6
    
    BRA MOVEMBackwardPrintNoA6



MOVEMBackwardPrintIncludeA6
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ MOVEMBackwardStartA6Streak
    
    * Otherwise, no streak to start... just keep going
    ADD.W #1, D7
    BRA MOVEMBackwardPrintA6Done
    
    
    
MOVEMBackwardStartA6Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$36,(A4)+ * 6
    
    * Mark we have a streak
    MOVE.W #$0001, D7
    BRA MOVEMBackwardPrintA6Done    


MOVEMBackwardPrintNoA6
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMBackwardPrintEndA6Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMBackwardPrintA6Done
    
MOVEMBackwardPrintEndA6Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$35,(A4)+ * 5
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    
    BRA MOVEMBackwardPrintA6Done

MOVEMBackwardPrintA6Done   

    * Now to check A7
    * So we can reset
    MOVE.W D5, D4
    * Roll it... not this time
    * Mask out all but one bit to check
    AND.W #%0000000000000001, D4
    * Then see if we have a start
    CMP #%0000000000000001, D4
    * Then mark we found 
    BEQ MOVEMBackwardPrintIncludeA7
    
    BRA MOVEMBackwardPrintNoA7



MOVEMBackwardPrintIncludeA7
    
    * Have we started a streak?
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP #$0000, D4
    BEQ MOVEMBackwardStartA7Streak
    
    * Otherwise, no streak to start... just keep going
    * We're going to finish it now
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$37,(A4)+ * 7
    * We don't have to worry about marking things, because we're done
    
    BRA MOVEMBackwardPrintA7Done
    
    
    
MOVEMBackwardStartA7Streak
    
    * If we're starting a streak we need to check if we need a slash
    JSR MOVEMCheckPastStreak
    
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$37,(A4)+ * 7
    
    * We don't have to worry about staring a streak, this is the end
    BRA MOVEMBackwardPrintA7Done    


MOVEMBackwardPrintNoA7
    * If we had a streak we can end it
    MOVE.W D7, D4 * Load up D4 to mess with
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BGE MOVEMBackwardPrintEndA7Streak * Mark if we ended a streak
    
    * Otherwise, no streak. Just move on
    
    BRA MOVEMBackwardPrintA7Done
    
MOVEMBackwardPrintEndA7Streak
    
    
    
    MOVE.B   #$2D,(A4)+ * -
    MOVE.B   #$41,(A4)+ * A
    MOVE.B   #$36,(A4)+ * 6
    
    * Then we can mark the streak as done
    JSR MOVEMEndStreak
    
    * This is another weird case, that we want to do it by hand
    * We probably don't have to worry about things here
    
    
    BRA MOVEMBackwardPrintA7Done

MOVEMBackwardPrintA7Done   


    
    RTS

*************************************
* End of Backward Print
*************************************







    * Some other helpful things
    
    * This is a subroutine
MOVEMEndStreak  

    * Before we mark that the streak is over, how long was it
    MOVE.W D7, D4
    * Then we can see if the streak was one
    AND.W #$000F, D4
    CMP.W #$0001, D4
    BEQ MOVEEndStreakSingle
    
    * Otherwise, we can keep it
    BRA MOVEEndStreakLonger

MOVEEndStreakSingle
    
    * At this point we need to unwind the -D# that was there
    MOVE.B   #$FF,-(A4) * #
    MOVE.B   #$FF,-(A4) * D
    MOVE.B   #$FF,-(A4) * -
    
    * OK Then we can fall through

MOVEEndStreakLonger
    
    * Mark that we ended a streak
    * 1 is that we had a streak going
    * 0 Shows that no active streak
    MOVE.W #$0100, D7
    RTS
    
    
MOVEMCheckPastStreak
    
    * We need to see if there was a past streak
    MOVE.W D7, D4
    * Mask out the others
    AND.W #$0100, D4
    CMP.W #$0100, D4
    BEQ MOVEMYesPastStreak
    
    BRA MOVEMastStreak


MOVEMYesPastStreak

    
    MOVE.B   #$2F,(A4)+ * /
    BRA MOVEMPastStreakDone
    
MOVEMastStreak
    
    BRA MOVEMPastStreakDone
    
MOVEMPastStreakDone
    
    RTS    
    
 
***************************************   







* This one we need to push
MOVEMProblem

    * We had a problem with MOVEM
    * We need to put things back the way they were
    * TODO
    BRA Problem


MOVEMAllDone
    
    * It went well, but we need to bump up A2 some more
    MOVE.W (A2)+, D4 * This is just to bump things up once
    BRA AllDone    
    











*********************************************************
*********************************************************
*********************************************************
*********************************************************





*********************************************************
*********************************************************
* LEA
* Syntax:
*   LEA <EA>, An
* Modes allowed:
* (An), xxx.W, xxx.L
*********************************************************
*********************************************************
LEASpot
    
    * This is all the LEA Stuff
    
    * So let's print a LEA to the buffer
    *MOVE.W #LEA_, (A4)+
    MOVE.B   #$4C,(A4)+ *L
    MOVE.B   #$45,(A4)+ *E
    MOVE.B   #$41,(A4)+ *A
    * It's always a .L
    MOVE.B   #$2E,(A4)+ *.
    MOVE.B   #$4C,(A4)+ *L
    MOVE.B   #$20,(A4)+ *space
    
    MOVE.W A6, A5 * Backup A6 to A5 just in case
    
    * Now with that let's check the other modes it could be
     MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.W #%0000000000111000, D4
    * Compare it for (An)
    CMP.W #%0000000000010000, D4
    * If it was equal, then branch
    BEQ LEAAnBubble
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.W #%0000000000111111, D4
    * Compare it for (An)
    CMP.W #%0000000000111000, D4
    * If it was equal, then branch
    BEQ LEAWord
    
    MOVE.W   (A6), D4              * Move to D4 to edit it
    * Zero out the non-freebee bits
    AND.W #%0000000000111111, D4
    * Compare it for (An)
    CMP.W #%0000000000111001, D4
    * If it was equal, then branch
    BEQ LEALong
    
    


    * We didn't find one that worked... so we have a problem
    BRA Problem


LEAAnBubble
    
    * Then we need to print the (An) things
    *MOVE.W	#LPAR_, (A4)+	
    *MOVE.W	#A_, (A4)+
    *MOVE.L   (A6), D4	* Reset the D4 Register
    *JSR BinaryToDecimalPrint    *Print the proper number 
    *MOVE.W	#RPAR_, (A4)+	
    

    MOVE.B   #$28,(A4)+ *(
    MOVE.B   #$41,(A4)+ *A
    MOVE.W (A6), D4
    JSR RegPrint
    MOVE.B   #$29,(A4)+ *)

    BRA LEAModeDone

LEAWord
    
    *MOVE.W #Dollar_, (A4)+
    *MOVE.B   #$24,(A4)+ *$
    *MOVE.W (A6)+, (A4)+
    
    MOVE.B   #$24,(A4)+ *$
    * We need to bump up the A6
    MOVE.W (A6)+, D4
    MOVE.W (A6)+, D4 * Do it again
    JSR PrintMemoryWord
    * Then we better remember to bump up A2
    MOVE.W (A2)+, D4 * This is just to bump things up


    BRA LEAModeDone
    
LEALong
    
    *MOVE.B   #$24,(A4)+ *$
    *MOVE.W #Dollar_, (A4)+
    *MOVE.L (A6)+, (A4)+
    
    
    MOVE.B   #$24,(A4)+ *$

    MOVE.W (A6)+, D4
    MOVE.L (A6)+, D4
    JSR PrintMemoryLong
    
    * Then we better remember to bump up A2
    MOVE.W (A2)+, D4 * This is just to bump things up once
    MOVE.W (A2)+, D4 * Bump it up again
    
    
    BRA LEAModeDone
    
    
    
LEAModeDone
    

* OK now with that done, we need to print the , #
    *MOVE.W	#SPACE_, (A4)+
    *MOVE.W	#COMMA_, (A4)+
    *MOVE.W	#SPACE_, (A4)+
    
    MOVE.B   #$2C,(A4)+ *,
    MOVE.B   #$20,(A4)+ *space
    * Then print the A
    MOVE.B   #$41,(A4)+ *A
    
    * Then we can Reset the D4 register and roll it over
    MOVE.W   (A5), D4	* Reset the D4 Register
    * Before: 0100RRR111MMMRRR
    ROR.W   #4, D4
    ROR.W   #5, D4
    * After: XXXXXXXXX0100RRR
    * Then we can call the number on it
    JSR RegPrint    *Print the proper number
    
    
    * OK everything was good!
    BRA AllDone

* +++++++++++++++++++++++++++++++++

    






