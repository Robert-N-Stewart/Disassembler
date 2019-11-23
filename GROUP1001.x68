*-----------------------------------------------------------
* Title      :
* Written by : Hanna Sasina
* Date       : 05/19/2018
* Description: SUB subroutine (G)
*-----------------------------------------------------------
	
	*1001 XXXX XXXX XXXX - SUB
 
	*A2 - starting point address
	*A3 - ending point address. 
	*A4 - holds the adress of buffer
	*A7 - stack pointer
	*D1 - holds the opcode	

*------------------------Decoding---------------------------

GROUP1001:	
	CLR.L	D3
	MOVE.B	#0, D7				*Indicator that size is in bits 7, 6
	
*illegal case 1: Address register is source when data size is B
	MOVE.W	D1, D3
	ANDI.W	#%0000000011111000, D3
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
	
	MOVE.B	#$53, (A4)+			* ASCII values of SUB to buffer
	MOVE.B	#$55, (A4)+
	MOVE.B	#$42, (A4)+
	
	JSR     GET_SIZE             	*will jump to subroutine here to append size
       
	JSR     APPEND_SIZE	

G9_BIT_8
	MOVE.W	D1, D3				*move the opcode to start working with it
	ANDI.L	#%0000000100000000, D3	*mask all bits except for 8
	LSR.L	#8, D3
	CMP.B	#0, D3	
	BEQ		G9_ea_source			
	BNE		G9_ea_destination
	
G9_ea_source
	JSR		DECODE_EFFECTIVE_ADDRESS
	JSR		COMMA_SPACE
	JSR		BITS_11109_Dreg
	BRA		END_OF_VALID_INSTRUCTION

G9_ea_destination
	JSR		BITS_11109_Dreg
	JSR		COMMA_SPACE
	JSR		DECODE_EFFECTIVE_ADDRESS
	BRA		END_OF_VALID_INSTRUCTION

	









*~Font name~Courier New~
*~Font size~11~
*~Tab type~1~
*~Tab size~4~
