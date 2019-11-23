*-----------------------------------------------------------
* Title      : 
* Written by : Hanna Sasina
* Date       : 05/14/2018
* Description: ADDQ Subroutine
*-----------------------------------------------------------
 
  
    *0101 XXXX XXXX XXXX XXXX - ADDQ
 
	*A2 - starting point address
	*A3 - ending point address. 
	*A4 - holds the adress of buffer
	*A7 - stack pointer
	*D1 - holds the opcode	
	
*----------------------Actual decoding----------------------------------------------------------------

GROUP0101:	
			CLR.L	D3
			MOVE.B	#0, D7					*Indicator that size is in bits 7, 6
*illegal case 1: Address register is source when data size is B			
			MOVE.W	D1,D3
	 		ANDI.W	#%0000000011111000, D3
			CMP.W	#8, D3
			BEQ		ILLEGAL
							
			CLR.L	D3
			MOVE.W	D1, D3
			ANDI.W	#%0000000100000000, D3	*Check bit 8th, if it is NOT 0 then illegal for ADDQ
            			LSR.L	#8, D3
            			CMP.B	#0, D3
            			BNE		ILLEGAL					*remove ADDQ from buffer and put DATA
			
			CLR.L	D3						*if destination is a mode, instruction is illegal
			MOVE.W	D1, D3
			ANDI.W	#%0000000000111111	, D3
			CMP.W	#60, D3	
			BEQ		ILLEGAL
			
			MOVE.L	#$41444451, (A4)+		*AASCII value of ADDQ		
         
            JSR     GET_SIZE             	*will jump to subroutine here to append size
           			
			JSR     APPEND_SIZE
			
			MOVE.B	#$23,(A4)+    			*push hash to memory       
			
			       CLR.L     D3                    *Clear D3 to start decoding new bits
     
            MOVE.W	D1, D3             		*move opcode into a register to work with it
            ANDI.W  #%0000111000000000, D3  *Clear everything except for bits 11 10 9
            MOVE.W  #9, D4        			*Move the number to shift by into D4 since it is bigger than 8 (have to use register for bigget than 8)
            LSR.L   D4 ,D3   				          *Shift by 9 to make 11, 10, and 9 bits in the LSB place for comparison
            			
			CMPI.W	#0, D3
            			BEQ		ADD8
			CMPI.W #1, D3
			BEQ		make_ascii
			CMPI.W	#2, D3
			BEQ		make_ascii
			CMPI.W	#3, D3
			BEQ		make_ascii
			CMPI	#4, D3
			BEQ		make_ascii
			CMPI	#5, D3
			BEQ		make_ascii
			CMPI	#6, D3
			BEQ		make_ascii
			CMPI	#7, D3
			BEQ		make_Ascii
			
ADD8		ADDQ.B	#8, D3
			BRA		make_ascii	
              
make_ascii	ADDI.B	#$30, D3
			
push_buffer	MOVE.B	#$24, (A4)+				*$ in ASCII
			MOVE.B	D3, (A4)+
			JSR		COMMA_SPACE
			JSR 	DECODE_EFFECTIVE_ADDRESS *Jump to effective address decoding subroutine
       			JMP		END_OF_VALID_INSTRUCTION 

	 
         


















*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
