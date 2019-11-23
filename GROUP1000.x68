*-----------------------------------------------------------
* Title      :
* Written by : Hanna Sasina
* Date       : 05/23/2018
* Description: GROUP1000 (OR/DIVU)
*-----------------------------------------------------------

*1000 XXXX XXXX XXXX XXXX - OR/DIVU
 
	*A2 - starting point address
	*A3 - ending point address. 
	*A4 - holds the adress of buffer
	*A7 - stack pointer
	*D1 - holds the opcode	
	
*----------------------Actual decoding----------------------------------------------------------------
  
GROUP1000:

	CLR.L	D3
	MOVE.W	D1, D3
	ANDI.W	#%0000000111000000, D3			*Compare bits 8, 7, 6
	LSR.L	#6, D3
	CMP.W	#$3, D3						*if 8, 7, 6, are 011 => DIVU
	BEQ		DIVU
	CMP.W	#$7, D3						*if 8, 7, 6 are 111 => ILLEGAL
	BEQ		ILLEGAL
	BNE		OR							* all others are OR

OR:
	MOVE.B	#0, D7						*Indicate that size is in bits  7, 6
	CLR.L	D3
*illegal case 1: An is source 
	MOVE.W	D1, D3
	ANDI.W	#%0000000000111000, D3
	CMP.W	#8, D3
	BEQ		ILLEGAL	
	
*illegal case 2: Destination is An 
	CLR.L	D3
	MOVE.W	D1, D3
	ANDI.W	#%0000000100111000, D3
	CMP.W	#264, D3
	BEQ		ILLEGAL
	
*illegal case 3: Immediate data is destination
	CLR.L	D3
	MOVE.W	D1, D3
	ANDI.W	#%0000000100111111, D3
	CMP.W	#316, D3
	BEQ		ILLEGAL	

	MOVE.B	#$4F, (A4)+			* ASCII values of OR to buffer
	MOVE.B	#$52, (A4)+
	JSR		GET_SIZE
	JSR		APPEND_SIZE
	
G8_BIT_8
	MOVE.W	D1, D3				*move the opcode to start working with it
	ANDI.L	#%0000000100000000, D3	*mask all bits except for 8
	LSR.L	#8, D3
	CMP.B	#0, D3	
	BEQ		G8_ea_source			
	BNE		G8_ea_destination
	
G8_ea_source
	JSR		DECODE_EFFECTIVE_ADDRESS
	JSR		COMMA_SPACE
	JSR		BITS_11109_Dreg
	BRA		END_OF_VALID_INSTRUCTION

G8_ea_destination
	JSR		BITS_11109_Dreg
	JSR		COMMA_SPACE
	JSR		DECODE_EFFECTIVE_ADDRESS
	BRA		END_OF_VALID_INSTRUCTION

DIVU:
	MOVE.B	#1, D7					*indicate that size is in bit 8
	CLR.L	D3
*illegal case 1: An is source 
	MOVE.W	D1, D3
	ANDI.W	#%0000000000111000, D3
	CMP.W	#8, D3
	BEQ		ILLEGAL	
	
	MOVE.L	#$44495655, (A4)+			* ASCII values of DIVU to buffer
	
	JSR		append_W
	JSR		DECODE_EFFECTIVE_ADDRESS
	JSR		COMMA_SPACE
	JSR		BITS_11109_Dreg
	JMP		END_OF_VALID_INSTRUCTION


*~Font name~Courier New~
*~Font size~11~
*~Tab type~1~
*~Tab size~4~
