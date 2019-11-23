*-----------------------------------------------------------
* Title      :
* Written by : Hanna Sasina
* Date       : 05/19/2018
* Description: Has common functions for all subroutines
*-----------------------------------------------------------
*D1 holds the OP-CODE
*D7 holds flag for the size: 
						*D7 = 0 size is in bits 7 and 6
						*D7 = 1 size is in bit 8

GET_SIZE
	CMP.B	#0, D7
	BEQ		GET_BIT_76_SIZE
	BNE		GET_BIT_8_SIZE

GET_BIT_76_SIZE
	MOVE.W 	D1, D3					*Move opdocode into D3 to check for size
	ANDI.W	#%0000000011000000, D3  	*clear everything except for bits 7 and 6
	LSR.L   	#6 ,D3           			*shift by 6 to make 7th and 6th bits in the LSB place for comparison
	ADD.B	D7, D3					*JUST ADDED: normalize B, W, L
  	RTS
                                             	
GET_BIT_8_SIZE
	MOVE.W	D1, D3				*move the opcode to start working with it
	ANDI.L	#%0000000100000000, D3	*mask all bits except for 8
	LSR.L	#8, D3
	ADD.B	D7, D3				*JUST ADDED: normalize B, W, L
	RTS
*expects size to be in D3
APPEND_BIT_8_SIZE	
	CMP.B	#1, D3
	BEQ		append_W				*If zero, append .W
	BNE		append_L
		
*Expects size to be in D3
APPEND_SIZE								
                                             	CMP.B	#0, D3					*check if D3 has 0 for Byte
	BEQ		append_B				
	CMP.B	#1, D3					*check if D3 has 1 for Word			
	BEQ		append_W
	CMP.B	#2, D3
	BEQ		append_L					*check if D3 has 2 for Long
	BNE		illegal					*Instruction not recognized, push DATA and exit the subroutine

append_B	
	MOVE.B	#$2E,(A4)+				*dot
	MOVE.B	#$42,(A4)+				*ascii B 		
	MOVE.B	#$20,(A4)+				*Ascii value of space           
	RTS
           
append_W	
	MOVE.B	#$2E,(A4)+				*dot
	MOVE.B	#$57,(A4)+				*ascii W 				
	MOVE.B	#$20,(A4)+				*Ascii value of space      
	RTS
			
append_L	
	MOVE.B	#$2E,(A4)+				*dot
	MOVE.B	#$4C,(A4)+				*ascii L			
	MOVE.B	#$20,(A4)+				*Ascii value of space         
	RTS

BITS_11109	
	CLR.L	D5
	MOVE.W	D1, D5
	ANDI.L	#%0000111000000000, D5
	MOVE.B	#9, D4
	LSR.L	D4, D5
	RTS

BITS_11109_Dreg					
	JSR		BITS_11109
	JSR		append_dreg
	JSR		append_reg
	RTS

BITS_11109_Areg
	JSR		BITS_11109
	JSR		append_areg
	JSR		append_reg
	RTS

COMMA_SPACE
	MOVE.B #$2C, (A4)+			* ASCII value of comma
    	MOVE.B #$20, (A4)+ 			*ASCII value of space
	RTS

DECODE_EFFECTIVE_ADDRESS
	MOVE.W  	D1, D3            		 	*Move opcode into a register to work with it	
	ANDI.W	#%0000000000111000, D3		*Clear everything except for bits 5, 4, 3
	LSR.L	#3, D3					*Shift by 3 to make 5, 4, 3 in the LSD place for comparison
			
	LEA		JMP_Table2, A0
	MULU		#6, D3
	JSR		0(A0, D3)				*Jump to correct MODE		
	RTS
      					 					
JMP_Table2	
	JMP		mode000					*Dn
	JMP		mode001					*An
	JMP		mode010					*(An)				
	JMP		mode011					*(An)+
	JMP		mode100					*-(An)
	JMP		mode101					*Not Required (illegal for our case)
	JMP		mode110					*NotRequired (illegal for our case)
	JMP		mode111					*(xxx).W, (xxx).L, #<data> 

mode000		
	JSR      append_dreg
	JSR		BITS_210
	RTS
						
mode001		
	JSR		append_areg
	JSR		BITS_210
	RTS	
			
mode010		
	MOVE.B	#$28, (A4)+				*( in ASCII
	JSR		append_areg 	
	JSR		BITS_210		
	MOVE.B	#$29, (A4)+				*) in ASCII
	RTS
			
mode011		
	MOVE.B	#$28, (A4)+				*( in ASCII	
	JSR		append_areg 			
	JSR		BITS_210 			
	MOVE.B	#$29, (A4)+ 				*) in ASCII		
	MOVE.B	#$2B, (A4)+				*+ in ASCII
	RTS

mode100		
	MOVE.B	#$2D, (A4)+				* - in ASCII
	MOVE.B	#$28, (A4)+				*() in ASCII
	JSR		append_areg 	
	JSR		BITS_210		
	MOVE.B	#$29, (A4)+ 			
	RTS

mode101		
	BRA		illegal					*if get 101 or 110, then illegal instruction *!!!!! put ILLEGAL HERE!!!!!

mode110		
	BRA		illegal

mode111		
	CLR.L 	D3
	CLR.L 	D4
	MOVE.W	D1, D3
	ANDI.L	#%0000000000000111, D3		*keep only bits 2-0
	CMP.B	#0, D3
	BEQ		aa_word					*If bits are 000 branch to absolute addressing WORD
	CMP.B	#1, D3
	BEQ		aa_long					*If bits are 001 branch to absolute addressing LONG
	CMP.B    #4, D3					*If bitst are 100 branch to #<data>
	BEQ      aa_data
	BNE		illegal 
	RTS                              
                          
append_dreg	
	MOVE.B   #$44,(A4)+
	RTS
			
append_areg	
	MOVE.B   #$41,(A4)+
	RTS
			
BITS_210		
	CLR.L	D5	   			
	MOVE.W	D1, D5					*Move the instruction to D5				
	ANDI.L	#%0000000000000111, D5		*mask bits 2-1-0
	JSR		append_reg	 			
	RTS
	
*expects number to be in D5
append_reg	
	LEA		JMP_TABLE3, A0
	MULU		#6, D5
	JSR		0(A0, D5)				*Jump to appropriate register
	RTS	
                             
JMP_Table3	
	JMP		reg_0
	JMP		reg_1
	JMP		reg_2
	JMP		reg_3 
	JMP		reg_4
	JMP		reg_5
	JMP		reg_6
	JMP		reg_7

reg_0	
	MOVE.B	#$30,(A4)+
	RTS
reg_1		
	MOVE.B	#$31,(A4)+
	RTS
reg_2		
	MOVE.B	#$32,(A4)+
	RTS
reg_3		
	MOVE.B	#$33,(A4)+
	RTS
reg_4		
	MOVE.B	#$34,(A4)+
	RTS
reg_5		
	MOVE.B	#$35,(A4)+
	RTS
reg_6		
	MOVE.B	#$36,(A4)+
	RTS
reg_7		
	MOVE.B	#$37,(A4)+
	RTS
			
*need to grab the word that is after the opcode 
aa_word		
	CLR.L	D4	 			
	MOVE.B	#$24, (A4)+				*Move dollar sign to buffer
	CMP.L	A2, A3					*check if can grab more words (if reached end location)
	BLE		illegal
	MOVE.W	(A2)+, D6				*Move next word from memory which is part of this instrction
	MOVE.B   #4, D4					*counter
	MOVE.L	#16, D2
	LSL.L    D2, D6
	JSR		conv_ascii	
	RTS	

*need to grab two words that are after the opcode 
aa_long		
	CLR.L	D4
			
	MOVE.B	#$24, (A4)+				*$in ASCII
	CMP.L	A2, A3					*check if can grab next word
	BLE		illegal					*illegal if reached end location
	MOVEA.W	A2, A5					*peak one more word forward to see if can grab long		
	ADDA.W	#$2, A5
	CMP.L	A5, A3
	BLE		illegal
			 
	MOVE.L   (A2)+, D6				*grab long
                         	MOVE.B	#$8, D4
	JSR		conv_ascii
                         	RTS

aa_data	
	MOVE.B	#$23, (A4)+
	MOVE.B	#$24, (A4)+ 		
	CLR.L	D3
	JSR      GET_SIZE
	CMP.B    #2, D3					*if D3 has 1 - word, 2 - long
 	BNE      aa_data_W
    	 CMP.L	A2, A3					*check if can grab next word
	BLE		illegal					*illegal if reached end location
	MOVEA.W	A2, A5					*peak one more word forward to see if can grab long		
	ADDA.W	#$2, A5
	CMP.L	A5, A3
	BLE		illegal
			 
	MOVE.L   (A2)+, D6				*grab long
	MOVE.B   #8, D4
	JMP      aa_data_end

aa_data_W	 
	CMP.L	A2, A3
	BLE		illegal			
	MOVE.W   (A2)+, D6
	MOVE.L	#16, D2
	LSL.L    D2, D6

         	MOVE.B   #4, D4         			

aa_data_end	  			
	JSR		conv_ascii
	RTS
		        
conv_ascii	
	MOVEM.L	D2/D3-D5, -(SP)		*Free up registers		 			
     	JSR		ascii_loop 			
	MOVEM.L	(SP)+,D2/D3-D5			
	RTS
			
ascii_loop	
	CMPI.B	#0, D4					*Check the counter in D4	
	BNE		  ascii_loop_cont
	RTS	
ascii_loop_cont
	MOVE.L	D6, D3					*Load the shifted number
	ANDI.L	#$F0000000,D3				*Mask all bits except for first 4
	MOVE.L	D3, D5					*Move the number to another register to compare and push to buffer
	MOVE.B	#28, D2					*Move the shift count into D2
	LSR.L	D2, D5					*shift D5 to make the number to push be in the place of LSB
	ROL.L	#4, D6					*Prepare next hex digit for conversion
	SUBI.B	#1, D4					*Decrement counter	
	CMPI.L	#$9, D5	
	BLE		num_conv				 	*If it is less than 9, it is a number
	BGT		char_conv				*If bigger than 9, then it is a letter

num_conv		
	ADDI.B	#$30, D5			
	BRA		to_buffer

char_conv	
	ADDI.B	#$37, D5
	BRA		to_buffer

to_buffer	
	MOVE.B	D5, (A4)+				*save to buffer	
	BRA		ascii_loop





*~Font name~Courier New~
*~Font size~11~
*~Tab type~1~
*~Tab size~4~
