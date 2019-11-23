*-----------------------------------------------------------
* Title      :
* Written by : Hanna Sasina
* Date       : 05/19/2018
* Description: ADD/ADDA subroutines
*-----------------------------------------------------------

	*1101 XXXX XXXX XXXX XXXX - ADD/ADDA
 
	*A2 - starting point address
	*A3 - ending point address. 
	*A4 - holds the adress of buffer
	*A7 - stack pointer
	*D1 - holds the opcode	
	
*----------------------Actual decoding----------------------------------------------------------------
GROUP1101:
	CLR.L	D3
	MOVE.W	D1, D3
			
	JSR		GET_SIZE
	CMP.W	#$3, D3
	BEQ		ADDA
	BNE		ADD
			
ADD
*illegal case 1: Address register is source when data size is B
	
	MOVE.W	D1,D3
	 ANDI.W	#%0000000011111000, D3
	CMP.W	#8, D3
	BEQ		illegal
	
	*illegal case 2: Destination is An 
	CLR.L	D3
	MOVE.W	D1, D3
	ANDI.W	#%0000000100111000, D3
	CMP.W	#264, D3
	BEQ		illegal
	
*illegal case 3: Immediate data is destination
	CLR.L	D3
	MOVE.W	D1, D3
	ANDI.W	#%0000000100111111, D3
	CMP.W	#316, D3
	BEQ		illegal	

*DECODING STARTS HERE	
	MOVE.B	#0, D7
	MOVE.B	#$41,(A4)+
	MOVE.B	#$44,(A4)+
	MOVE.B	#$44, (A4)+		* ASCII values of SUB to buffer

	JSR     GET_SIZE             	*will jump to subroutine here to append size
           			
	JSR     APPEND_SIZE	

GD_BIT_8
	MOVE.W	D1, D3				*move the opcode to start working with it
	ANDI.L	#%0000000100000000, D3	*mask all bits except for 8
	LSR.L	#8, D3
	CMP.B	#0, D3	
	BEQ		GD_ea_source			
	BNE		GD_ea_destination
	
GD_ea_source
	JSR		DECODE_EFFECTIVE_ADDRESS
	JSR		COMMA_SPACE
	JSR		BITS_11109_Dreg
	JMP		END_OF_VALID_INSTRUCTION

GD_ea_destination
	JSR		BITS_11109_Dreg
	JSR		COMMA_SPACE
	JSR		DECODE_EFFECTIVE_ADDRESS
	JMP		END_OF_VALID_INSTRUCTION

ADDA
	MOVE.B	#$1, D7				*Indicator that size is in bit 8
	MOVE.L	#$41444441,(A4)+		* ASCII values of ADDA to buffer
	
	JSR		GET_SIZE	
	JSR		APPEND_BIT_8_SIZE
	JSR		DECODE_EFFECTIVE_ADDRESS
	JSR		COMMA_SPACE
	JSR		BITS_11109_Areg
	JMP		END_OF_VALID_INSTRUCTION
			

    










*~Font name~Courier New~
*~Font size~11~
*~Tab type~1~
*~Tab size~4~
