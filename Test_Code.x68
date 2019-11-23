*-----------------------------------------------------------
* Title      : Test_Code
* Written by : Robert, Cody, and Hanna
* Description: Test code for dissembler
*-----------------------------------------------------------
    ORG    $5000
START:                  ; first instruction of program

*-----------------------------------------------------------
* Title      : Test Cases for Cody's Op codes
* Written by : Cody G
* Date       : 6-1-18
* Description: Test some Code
* Note: Spongebob
*-----------------------------------------------------------
 
*      ORG    $1000
*START:   
    NOP
    NOP
    NOP
    
    * OPCodes we need to test (Not in order)
    * CLR
    * NOP
    * RTS
    * JSR
    * MOVEM
    * LEA
    * ASd
    * LSd
    * ROd
    
   * Test some of the prinouts, to test the 0-F digits
    ASL.W $12345678
    ASR.W $0FEDCBA9
    
    * Make some of the extra yucky MOVEM ones
    MOVEM.W D0-D1/D3-D4/D6-D7/A0-A1/A3-A4/A6-A7 , (A2)
    MOVEM.L D0-D1/D3-D4/D6-D7/A0-A1/A3-A4/A6-A7 , (A2)
    MOVEM.W D2/D4-D5/D7/A4/A6-A7 , (A2)
    MOVEM.L D2/D4-D5/D7/A4/A6-A7 , (A2)
    
    MOVEM.W D0-D1/D3-D4/D6-D7/A0-A1/A3-A4/A6-A7 , -(A2)
    MOVEM.L D0-D1/D3-D4/D6-D7/A0-A1/A3-A4/A6-A7 , -(A2)
    MOVEM.W D2/D4-D5/D7/A4/A6-A7 , -(A2)
    MOVEM.L D2/D4-D5/D7/A4/A6-A7 , -(A2)
    
    MOVEM.W (A2) , D0-D1/D3-D4/D6-D7/A0-A1/A3-A4/A6-A7
    MOVEM.L (A2) , D0-D1/D3-D4/D6-D7/A0-A1/A3-A4/A6-A7
    MOVEM.W (A2) , D2/D4-D5/D7/A4/A6-A7
    MOVEM.L (A2) , D2/D4-D5/D7/A4/A6-A7 
    
    MOVEM.W (A2)+ , D0-D1/D3-D4/D6-D7/A0-A1/A3-A4/A6-A7
    MOVEM.L (A2)+ , D0-D1/D3-D4/D6-D7/A0-A1/A3-A4/A6-A7
    MOVEM.W (A2)+ , D2/D4-D5/D7/A4/A6-A7
    MOVEM.L (A2)+ , D2/D4-D5/D7/A4/A6-A7
    

    * Test some of the Special -(An) cases
    MOVEM.W D4, -(A0)
    MOVEM.W A4, -(A0)
    MOVEM.W D1-D4, -(A0)
    MOVEM.W A1-A4, -(A0)
    MOVEM.W D1-D4/A1-A4, -(A0)
    
    
    * Single Reg to Memory
    * D Reg
    MOVEM.W D0, (A0)
    MOVEM.W D0, (A1)
    MOVEM.W D0, (A2)
    MOVEM.W D0, (A3)
    MOVEM.W D0, (A4)
    MOVEM.W D0, (A5)
    MOVEM.W D0, (A6)
    MOVEM.W D0, (A7)
    
    MOVEM.W D0, -(A0)
    MOVEM.W D0, -(A1)
    MOVEM.W D0, -(A2)
    MOVEM.W D0, -(A3)
    MOVEM.W D0, -(A4)
    MOVEM.W D0, -(A5)
    MOVEM.W D0, -(A6)
    MOVEM.W D0, -(A7)
    
    MOVEM.W D0, $1234
    
    MOVEM.W D0, $12345678
    
    MOVEM.W D4, (A0)
    MOVEM.W D4, (A1)
    MOVEM.W D4, (A2)
    MOVEM.W D4, (A3)
    MOVEM.W D4, (A4)
    MOVEM.W D4, (A5)
    MOVEM.W D4, (A6)
    MOVEM.W D4, (A7)
    
    MOVEM.W D4, -(A0)
    MOVEM.W D4, -(A1)
    MOVEM.W D4, -(A2)
    MOVEM.W D4, -(A3)
    MOVEM.W D4, -(A4)
    MOVEM.W D4, -(A5)
    MOVEM.W D4, -(A6)
    MOVEM.W D4, -(A7)
    
    MOVEM.W D4, $1234
    
    MOVEM.W D4, $12345678
    
    
    MOVEM.W D7, (A0)
    MOVEM.W D7, (A1)
    MOVEM.W D7, (A2)
    MOVEM.W D7, (A3)
    MOVEM.W D7, (A4)
    MOVEM.W D7, (A5)
    MOVEM.W D7, (A6)
    MOVEM.W D7, (A7)
    
    MOVEM.W D7, -(A0)
    MOVEM.W D7, -(A1)
    MOVEM.W D7, -(A2)
    MOVEM.W D7, -(A3)
    MOVEM.W D7, -(A4)
    MOVEM.W D7, -(A5)
    MOVEM.W D7, -(A6)
    MOVEM.W D7, -(A7)
    
    MOVEM.W D7, $1234
    
    MOVEM.W D7, $12345678
    
    * A Range
    * A Reg
    MOVEM.W A0, (A0)
    MOVEM.W A0, (A1)
    MOVEM.W A0, (A2)
    MOVEM.W A0, (A3)
    MOVEM.W A0, (A4)
    MOVEM.W A0, (A5)
    MOVEM.W A0, (A6)
    MOVEM.W A0, (A7)
    
    MOVEM.W A0, -(A0)
    MOVEM.W A0, -(A1)
    MOVEM.W A0, -(A2)
    MOVEM.W A0, -(A3)
    MOVEM.W A0, -(A4)
    MOVEM.W A0, -(A5)
    MOVEM.W A0, -(A6)
    MOVEM.W A0, -(A7)
    
    MOVEM.W A0, $1234
    
    MOVEM.W A0, $12345678
    
    MOVEM.W A4, (A0)
    MOVEM.W A4, (A1)
    MOVEM.W A4, (A2)
    MOVEM.W A4, (A3)
    MOVEM.W A4, (A4)
    MOVEM.W A4, (A5)
    MOVEM.W A4, (A6)
    MOVEM.W A4, (A7)
    
    MOVEM.W A4, -(A0)
    MOVEM.W A4, -(A1)
    MOVEM.W A4, -(A2)
    MOVEM.W A4, -(A3)
    MOVEM.W A4, -(A4)
    MOVEM.W A4, -(A5)
    MOVEM.W A4, -(A6)
    MOVEM.W A4, -(A7)
    
    MOVEM.W A4, $1234
    
    MOVEM.W A4, $12345678
        
    MOVEM.W A7, (A0)
    MOVEM.W A7, (A1)
    MOVEM.W A7, (A2)
    MOVEM.W A7, (A3)
    MOVEM.W A7, (A4)
    MOVEM.W A7, (A5)
    MOVEM.W A7, (A6)
    MOVEM.W A7, (A7)
    
    MOVEM.W A7, -(A0)
    MOVEM.W A7, -(A1)
    MOVEM.W A7, -(A2)
    MOVEM.W A7, -(A3)
    MOVEM.W A7, -(A4)
    MOVEM.W A7, -(A5)
    MOVEM.W A7, -(A6)
    MOVEM.W A7, -(A7)
    
    MOVEM.W A7, $1234
    
    MOVEM.W A7, $12345678
    

    * Only D with small range
    MOVEM.W D0-D1, (A0)
    MOVEM.W D1-D2, (A1)
    MOVEM.W D2-D3, (A2)
    MOVEM.W D3-D4, (A3)
    MOVEM.W D4-D5, (A4)
    MOVEM.W D5-D6, (A5)
    MOVEM.W D6-D7, (A6)
    
    MOVEM.W D0-D1, -(A0)
    MOVEM.W D1-D2, -(A1)
    MOVEM.W D2-D3, -(A2)
    MOVEM.W D3-D4, -(A3)
    MOVEM.W D4-D5, -(A4)
    MOVEM.W D5-D6, -(A5)
    MOVEM.W D6-D7, -(A6)
    
    MOVEM.W D0-D1, $1234
    MOVEM.W D1-D2, $1234
    MOVEM.W D2-D3, $1234
    MOVEM.W D3-D4, $1234
    MOVEM.W D4-D5, $1234
    MOVEM.W D5-D6, $1234
    MOVEM.W D6-D7, $1234
    
    MOVEM.W D0-D1, $12345678
    MOVEM.W D1-D2, $12345678
    MOVEM.W D2-D3, $12345678
    MOVEM.W D3-D4, $12345678
    MOVEM.W D4-D5, $12345678
    MOVEM.W D5-D6, $12345678
    MOVEM.W D6-D7, $12345678
    

    * Only A with small range
    MOVEM.W A0-A1, (A0)
    MOVEM.W A1-A2, (A1)
    MOVEM.W A2-A3, (A2)
    MOVEM.W A3-A4, (A3)
    MOVEM.W A4-A5, (A4)
    MOVEM.W A5-A6, (A5)
    MOVEM.W A6-A7, (A6)
    
    MOVEM.W A0-A1, -(A0)
    MOVEM.W A1-A2, -(A1)
    MOVEM.W A2-A3, -(A2)
    MOVEM.W A3-A4, -(A3)
    MOVEM.W A4-A5, -(A4)
    MOVEM.W A5-A6, -(A5)
    MOVEM.W A6-A7, -(A6)
    
    MOVEM.W A0-A1, $1234
    MOVEM.W A1-A2, $1234
    MOVEM.W A2-A3, $1234
    MOVEM.W A3-A4, $1234
    MOVEM.W A4-A5, $1234
    MOVEM.W A5-A6, $1234
    MOVEM.W A6-A7, $1234
    
    MOVEM.W A0-A1, $12345678
    MOVEM.W A1-A2, $12345678
    MOVEM.W A2-A3, $12345678
    MOVEM.W A3-A4, $12345678
    MOVEM.W A4-A5, $12345678
    MOVEM.W A5-A6, $12345678
    MOVEM.W A6-A7, $12345678
    
    
    * D & A with small range
    MOVEM.W D0-D1/A0-A1, (A0)
    MOVEM.W D1-D2/A1-A2, (A1)
    MOVEM.W D2-D3/A2-A3, (A2)
    MOVEM.W D3-D4/A3-A4, (A3)
    MOVEM.W D4-D5/A4-A5, (A4)
    MOVEM.W D5-D6/A5-A6, (A5)
    MOVEM.W D6-D7/A6-A7, (A6)
    
    MOVEM.W D0-D1/A0-A1, -(A0)
    MOVEM.W D1-D2/A1-A2, -(A1)
    MOVEM.W D2-D3/A2-A3, -(A2)
    MOVEM.W D3-D4/A3-A4, -(A3)
    MOVEM.W D4-D5/A4-A5, -(A4)
    MOVEM.W D5-D6/A5-A6, -(A5)
    MOVEM.W D6-D7/A6-A7, -(A6)
    
    MOVEM.W D0-D1/A0-A1, $1234
    MOVEM.W D1-D2/A1-A2, $1234
    MOVEM.W D2-D3/A2-A3, $1234
    MOVEM.W D3-D4/A3-A4, $1234
    MOVEM.W D4-D5/A4-A5, $1234
    MOVEM.W D5-D6/A5-A6, $1234
    MOVEM.W D6-D7/A6-A7, $1234
    
    MOVEM.W D0-D1/A0-A1, $12345678
    MOVEM.W D1-D2/A1-A2, $12345678
    MOVEM.W D2-D3/A2-A3, $12345678
    MOVEM.W D3-D4/A3-A4, $12345678
    MOVEM.W D4-D5/A4-A5, $12345678
    MOVEM.W D5-D6/A5-A6, $12345678
    MOVEM.W D6-D7/A6-A7, $12345678
    
    
    * Single Memory to Reg
    * D Reg
    MOVEM.W (A0), D0
    MOVEM.W (A1), D0
    MOVEM.W (A2), D0
    MOVEM.W (A3), D0
    MOVEM.W (A4), D0
    MOVEM.W (A5), D0
    MOVEM.W (A6), D0
    MOVEM.W (A7), D0
    
    MOVEM.W (A0)+, D0
    MOVEM.W (A1)+, D0
    MOVEM.W (A2)+, D0
    MOVEM.W (A3)+, D0
    MOVEM.W (A4)+, D0
    MOVEM.W (A5)+, D0
    MOVEM.W (A6)+, D0
    MOVEM.W (A7)+, D0
    
    MOVEM $1234, D0
    
    MOVEM $12345678, D0
    
    MOVEM.W (A0), D4
    MOVEM.W (A1), D4
    MOVEM.W (A2), D4
    MOVEM.W (A3), D4
    MOVEM.W (A4), D4
    MOVEM.W (A5), D4
    MOVEM.W (A6), D4
    MOVEM.W (A7), D4
    
    MOVEM.W (A0)+, D4
    MOVEM.W (A1)+, D4
    MOVEM.W (A2)+, D4
    MOVEM.W (A3)+, D4
    MOVEM.W (A4)+, D4
    MOVEM.W (A5)+, D4
    MOVEM.W (A6)+, D4
    MOVEM.W (A7)+, D4
    
    MOVEM.W $1234, D4
    
    MOVEM.W $12345678, D4
    
    
    MOVEM.W (A0), D7
    MOVEM.W (A1), D7
    MOVEM.W (A2), D7
    MOVEM.W (A3), D7
    MOVEM.W (A4), D7
    MOVEM.W (A5), D7
    MOVEM.W (A6), D7
    MOVEM.W (A7), D7
    
    MOVEM.W (A0)+, D7
    MOVEM.W (A1)+, D7
    MOVEM.W (A2)+, D7
    MOVEM.W (A3)+, D7
    MOVEM.W (A4)+, D7
    MOVEM.W (A5)+, D7
    MOVEM.W (A6)+, D7
    MOVEM.W (A7)+, D7
    
    MOVEM.W $1234, D7
    
    MOVEM.W $12345678, D7
   
 

    * A Range
    * A Reg
    MOVEM.W (A0), A0
    MOVEM.W (A1), A0
    MOVEM.W (A2), A0
    MOVEM.W (A3), A0
    MOVEM.W (A4), A0
    MOVEM.W (A5), A0
    MOVEM.W (A6), A0
    MOVEM.W (A7), A0
    
    MOVEM.W (A0)+, A0
    MOVEM.W (A1)+, A0
    MOVEM.W (A2)+, A0
    MOVEM.W (A3)+, A0
    MOVEM.W (A4)+, A0
    MOVEM.W (A5)+, A0
    MOVEM.W (A6)+, A0
    MOVEM.W (A7)+, A0
    
    MOVEM.W $1234, A0
    
    MOVEM.W $12345678, A0
    
    MOVEM.W (A0), A4
    MOVEM.W (A1), A4
    MOVEM.W (A2), A4
    MOVEM.W (A3), A4
    MOVEM.W (A4), A4
    MOVEM.W (A5), A4
    MOVEM.W (A6), A4
    MOVEM.W (A7), A4
    
    MOVEM.W (A0)+, A4
    MOVEM.W (A1)+, A4
    MOVEM.W (A2)+, A4
    MOVEM.W (A3)+, A4
    MOVEM.W (A4)+, A4
    MOVEM.W (A5)+, A4
    MOVEM.W (A6)+, A4
    MOVEM.W (A7)+, A4
    
    MOVEM.W $1234, A4
    
    MOVEM.W $12345678, A4
        
    MOVEM.W (A0), A7
    MOVEM.W (A1), A7
    MOVEM.W (A2), A7
    MOVEM.W (A3), A7
    MOVEM.W (A4), A7
    MOVEM.W (A5), A7
    MOVEM.W (A6), A7
    MOVEM.W (A7), A7
    
    MOVEM.W (A0)+, A7
    MOVEM.W (A1)+, A7
    MOVEM.W (A2)+, A7
    MOVEM.W (A3)+, A7
    MOVEM.W (A4)+, A7
    MOVEM.W (A5)+, A7
    MOVEM.W (A6)+, A7
    MOVEM.W (A7)+, A7
    
    MOVEM.W $1234, A7
    
    MOVEM.W $12345678, A7
    


    * Only D with small range
    MOVEM.W (A0), D0-D1
    MOVEM.W (A1), D1-D2
    MOVEM.W (A2), D2-D3
    MOVEM.W (A3), D3-D4
    MOVEM.W (A4), D4-D5
    MOVEM.W (A5), D5-D6
    MOVEM.W (A6), D6-D7
   
    MOVEM.W (A0)+, D0-D1
    MOVEM.W (A1)+, D1-D2
    MOVEM.W (A2)+, D2-D3
    MOVEM.W (A3)+, D3-D4
    MOVEM.W (A4)+, D4-D5
    MOVEM.W (A5)+, D5-D6
    MOVEM.W (A6)+, D6-D7
    
    MOVEM.W $1234, D0-D1
    MOVEM.W $1234, D1-D2
    MOVEM.W $1234, D2-D3
    MOVEM.W $1234, D3-D4
    MOVEM.W $1234, D4-D5
    MOVEM.W $1234, D5-D6
    MOVEM.W $1234, D6-D7
    
    MOVEM.W $12345678, D0-D1
    MOVEM.W $12345678, D1-D2
    MOVEM.W $12345678, D2-D3
    MOVEM.W $12345678, D3-D4
    MOVEM.W $12345678, D4-D5
    MOVEM.W $12345678, D5-D6
    MOVEM.W $12345678, D6-D7
    

    * Only A with small range
    MOVEM.W (A0), A0-A1
    MOVEM.W (A1), A1-A2
    MOVEM.W (A2), A2-A3
    MOVEM.W (A3), A3-A4
    MOVEM.W (A4), A4-A5
    MOVEM.W (A5), A5-A6
    MOVEM.W (A6), A6-A7
    
    MOVEM.W (A0)+, A0-A1
    MOVEM.W (A1)+, A1-A2
    MOVEM.W (A2)+, A2-A3
    MOVEM.W (A3)+, A3-A4
    MOVEM.W (A4)+, A4-A5
    MOVEM.W (A5)+, A5-A6
    MOVEM.W (A6)+, A6-A7
    
    MOVEM.W $1234, A0-A1
    MOVEM.W $1234, A1-A2
    MOVEM.W $1234, A2-A3
    MOVEM.W $1234, A3-A4
    MOVEM.W $1234, A4-A5
    MOVEM.W $1234, A5-A6
    MOVEM.W $1234, A6-A7
    
    MOVEM.W $12345678, A0-A1
    MOVEM.W $12345678, A1-A2
    MOVEM.W $12345678, A2-A3
    MOVEM.W $12345678, A3-A4
    MOVEM.W $12345678, A4-A5
    MOVEM.W $12345678, A5-A6
    MOVEM.W $12345678, A6-A7
    
    
    * D & A with small range
    MOVEM.W (A0), D0-D1/A0-A1
    MOVEM.W (A1), D1-D2/A1-A2
    MOVEM.W (A2), D2-D3/A2-A3
    MOVEM.W (A3), D3-D4/A3-A4
    MOVEM.W (A4), D4-D5/A4-A5
    MOVEM.W (A5), D5-D6/A5-A6
    MOVEM.W (A6), D6-D7/A6-A7
    
    MOVEM.W (A0)+, D0-D1/A0-A1
    MOVEM.W (A1)+, D1-D2/A1-A2
    MOVEM.W (A2)+, D2-D3/A2-A3
    MOVEM.W (A3)+, D3-D4/A3-A4
    MOVEM.W (A4)+, D4-D5/A4-A5
    MOVEM.W (A5)+, D5-D6/A5-A6
    MOVEM.W (A6)+, D6-D7/A6-A7
    
    MOVEM.W $1234, D0-D1/A0-A1
    MOVEM.W $1234, D1-D2/A1-A2
    MOVEM.W $1234, D2-D3/A2-A3
    MOVEM.W $1234, D3-D4/A3-A4
    MOVEM.W $1234, D4-D5/A4-A5
    MOVEM.W $1234, D5-D6/A5-A6
    MOVEM.W $1234, D6-D7/A6-A7
    
    MOVEM.W $12345678, D0-D1/A0-A1
    MOVEM.W $12345678, D1-D2/A1-A2
    MOVEM.W $12345678, D2-D3/A2-A3
    MOVEM.W $12345678, D3-D4/A3-A4
    MOVEM.W $12345678, D4-D5/A4-A5
    MOVEM.W $12345678, D5-D6/A5-A6
    MOVEM.W $12345678, D6-D7/A6-A7



    ** LONG
    
    * Single Reg to Memory
    * D Reg
    MOVEM.L D0, (A0)
    MOVEM.L D0, (A1)
    MOVEM.L D0, (A2)
    MOVEM.L D0, (A3)
    MOVEM.L D0, (A4)
    MOVEM.L D0, (A5)
    MOVEM.L D0, (A6)
    MOVEM.L D0, (A7)
    
    MOVEM.L D0, -(A0)
    MOVEM.L D0, -(A1)
    MOVEM.L D0, -(A2)
    MOVEM.L D0, -(A3)
    MOVEM.L D0, -(A4)
    MOVEM.L D0, -(A5)
    MOVEM.L D0, -(A6)
    MOVEM.L D0, -(A7)
    
    MOVEM.L D0, $1234
    
    MOVEM.L D0, $12345678
    
    MOVEM.L D4, (A0)
    MOVEM.L D4, (A1)
    MOVEM.L D4, (A2)
    MOVEM.L D4, (A3)
    MOVEM.L D4, (A4)
    MOVEM.L D4, (A5)
    MOVEM.L D4, (A6)
    MOVEM.L D4, (A7)
    
    MOVEM.L D4, -(A0)
    MOVEM.L D4, -(A1)
    MOVEM.L D4, -(A2)
    MOVEM.L D4, -(A3)
    MOVEM.L D4, -(A4)
    MOVEM.L D4, -(A5)
    MOVEM.L D4, -(A6)
    MOVEM.L D4, -(A7)
    
    MOVEM.L D4, $1234
    
    MOVEM.L D4, $12345678
    
    
    MOVEM.L D7, (A0)
    MOVEM.L D7, (A1)
    MOVEM.L D7, (A2)
    MOVEM.L D7, (A3)
    MOVEM.L D7, (A4)
    MOVEM.L D7, (A5)
    MOVEM.L D7, (A6)
    MOVEM.L D7, (A7)
    
    MOVEM.L D7, -(A0)
    MOVEM.L D7, -(A1)
    MOVEM.L D7, -(A2)
    MOVEM.L D7, -(A3)
    MOVEM.L D7, -(A4)
    MOVEM.L D7, -(A5)
    MOVEM.L D7, -(A6)
    MOVEM.L D7, -(A7)
    
    MOVEM.L D7, $1234
    
    MOVEM.L D7, $12345678
    

    * A Range
    * A Reg
    MOVEM.L A0, (A0)
    MOVEM.L A0, (A1)
    MOVEM.L A0, (A2)
    MOVEM.L A0, (A3)
    MOVEM.L A0, (A4)
    MOVEM.L A0, (A5)
    MOVEM.L A0, (A6)
    MOVEM.L A0, (A7)
    
    MOVEM.L A0, -(A0)
    MOVEM.L A0, -(A1)
    MOVEM.L A0, -(A2)
    MOVEM.L A0, -(A3)
    MOVEM.L A0, -(A4)
    MOVEM.L A0, -(A5)
    MOVEM.L A0, -(A6)
    MOVEM.L A0, -(A7)
    
    MOVEM.L A0, $1234
    
    MOVEM.L A0, $12345678
    
    MOVEM.L A4, (A0)
    MOVEM.L A4, (A1)
    MOVEM.L A4, (A2)
    MOVEM.L A4, (A3)
    MOVEM.L A4, (A4)
    MOVEM.L A4, (A5)
    MOVEM.L A4, (A6)
    MOVEM.L A4, (A7)
    
    MOVEM.L A4, -(A0)
    MOVEM.L A4, -(A1)
    MOVEM.L A4, -(A2)
    MOVEM.L A4, -(A3)
    MOVEM.L A4, -(A4)
    MOVEM.L A4, -(A5)
    MOVEM.L A4, -(A6)
    MOVEM.L A4, -(A7)
    
    MOVEM.L A4, $1234
    
    MOVEM.L A4, $12345678
    
    
    MOVEM.L A7, (A0)
    MOVEM.L A7, (A1)
    MOVEM.L A7, (A2)
    MOVEM.L A7, (A3)
    MOVEM.L A7, (A4)
    MOVEM.L A7, (A5)
    MOVEM.L A7, (A6)
    MOVEM.L A7, (A7)
    
    MOVEM.L A7, -(A0)
    MOVEM.L A7, -(A1)
    MOVEM.L A7, -(A2)
    MOVEM.L A7, -(A3)
    MOVEM.L A7, -(A4)
    MOVEM.L A7, -(A5)
    MOVEM.L A7, -(A6)
    MOVEM.L A7, -(A7)
    
    MOVEM.L A7, $1234
    
    MOVEM.L A7, $12345678
    


    * Only D with small range
    MOVEM.L D0-D1, (A0)
    MOVEM.L D1-D2, (A1)
    MOVEM.L D2-D3, (A2)
    MOVEM.L D3-D4, (A3)
    MOVEM.L D4-D5, (A4)
    MOVEM.L D5-D6, (A5)
    MOVEM.L D6-D7, (A6)
    
    MOVEM.L D0-D1, -(A0)
    MOVEM.L D1-D2, -(A1)
    MOVEM.L D2-D3, -(A2)
    MOVEM.L D3-D4, -(A3)
    MOVEM.L D4-D5, -(A4)
    MOVEM.L D5-D6, -(A5)
    MOVEM.L D6-D7, -(A6)
    
    MOVEM.L D0-D1, $1234
    MOVEM.L D1-D2, $1234
    MOVEM.L D2-D3, $1234
    MOVEM.L D3-D4, $1234
    MOVEM.L D4-D5, $1234
    MOVEM.L D5-D6, $1234
    MOVEM.L D6-D7, $1234
    
    MOVEM.L D0-D1, $12345678
    MOVEM.L D1-D2, $12345678
    MOVEM.L D2-D3, $12345678
    MOVEM.L D3-D4, $12345678
    MOVEM.L D4-D5, $12345678
    MOVEM.L D5-D6, $12345678
    MOVEM.L D6-D7, $12345678
    

    * Only A with small range
    MOVEM.L A0-A1, (A0)
    MOVEM.L A1-A2, (A1)
    MOVEM.L A2-A3, (A2)
    MOVEM.L A3-A4, (A3)
    MOVEM.L A4-A5, (A4)
    MOVEM.L A5-A6, (A5)
    MOVEM.L A6-A7, (A6)
    
    MOVEM.L A0-A1, -(A0)
    MOVEM.L A1-A2, -(A1)
    MOVEM.L A2-A3, -(A2)
    MOVEM.L A3-A4, -(A3)
    MOVEM.L A4-A5, -(A4)
    MOVEM.L A5-A6, -(A5)
    MOVEM.L A6-A7, -(A6)
    
    MOVEM.L A0-A1, $1234
    MOVEM.L A1-A2, $1234
    MOVEM.L A2-A3, $1234
    MOVEM.L A3-A4, $1234
    MOVEM.L A4-A5, $1234
    MOVEM.L A5-A6, $1234
    MOVEM.L A6-A7, $1234
    
    MOVEM.L A0-A1, $12345678
    MOVEM.L A1-A2, $12345678
    MOVEM.L A2-A3, $12345678
    MOVEM.L A3-A4, $12345678
    MOVEM.L A4-A5, $12345678
    MOVEM.L A5-A6, $12345678
    MOVEM.L A6-A7, $12345678
    
    
    * D & A with small range
    MOVEM.L D0-D1/A0-A1, (A0)
    MOVEM.L D1-D2/A1-A2, (A1)
    MOVEM.L D2-D3/A2-A3, (A2)
    MOVEM.L D3-D4/A3-A4, (A3)
    MOVEM.L D4-D5/A4-A5, (A4)
    MOVEM.L D5-D6/A5-A6, (A5)
    MOVEM.L D6-D7/A6-A7, (A6)
    
    MOVEM.L D0-D1/A0-A1, -(A0)
    MOVEM.L D1-D2/A1-A2, -(A1)
    MOVEM.L D2-D3/A2-A3, -(A2)
    MOVEM.L D3-D4/A3-A4, -(A3)
    MOVEM.L D4-D5/A4-A5, -(A4)
    MOVEM.L D5-D6/A5-A6, -(A5)
    MOVEM.L D6-D7/A6-A7, -(A6)
    
    MOVEM.L D0-D1/A0-A1, $1234
    MOVEM.L D1-D2/A1-A2, $1234
    MOVEM.L D2-D3/A2-A3, $1234
    MOVEM.L D3-D4/A3-A4, $1234
    MOVEM.L D4-D5/A4-A5, $1234
    MOVEM.L D5-D6/A5-A6, $1234
    MOVEM.L D6-D7/A6-A7, $1234
    
    MOVEM.L D0-D1/A0-A1, $12345678
    MOVEM.L D1-D2/A1-A2, $12345678
    MOVEM.L D2-D3/A2-A3, $12345678
    MOVEM.L D3-D4/A3-A4, $12345678
    MOVEM.L D4-D5/A4-A5, $12345678
    MOVEM.L D5-D6/A5-A6, $12345678
    MOVEM.L D6-D7/A6-A7, $12345678
    
    
    * Single Memory to Reg
    * D Reg
    MOVEM.L (A0), D0
    MOVEM.L (A1), D0
    MOVEM.L (A2), D0
    MOVEM.L (A3), D0
    MOVEM.L (A4), D0
    MOVEM.L (A5), D0
    MOVEM.L (A6), D0
    MOVEM.L (A7), D0
    
    MOVEM.L (A0)+, D0
    MOVEM.L (A1)+, D0
    MOVEM.L (A2)+, D0
    MOVEM.L (A3)+, D0
    MOVEM.L (A4)+, D0
    MOVEM.L (A5)+, D0
    MOVEM.L (A6)+, D0
    MOVEM.L (A7)+, D0
    
    MOVEM $1234, D0
    
    MOVEM $12345678, D0
    
    MOVEM.L (A0), D4
    MOVEM.L (A1), D4
    MOVEM.L (A2), D4
    MOVEM.L (A3), D4
    MOVEM.L (A4), D4
    MOVEM.L (A5), D4
    MOVEM.L (A6), D4
    MOVEM.L (A7), D4
    
    MOVEM.L (A0)+, D4
    MOVEM.L (A1)+, D4
    MOVEM.L (A2)+, D4
    MOVEM.L (A3)+, D4
    MOVEM.L (A4)+, D4
    MOVEM.L (A5)+, D4
    MOVEM.L (A6)+, D4
    MOVEM.L (A7)+, D4
    
    MOVEM.L $1234, D4
    
    MOVEM.L $12345678, D4
    
    
    MOVEM.L (A0), D7
    MOVEM.L (A1), D7
    MOVEM.L (A2), D7
    MOVEM.L (A3), D7
    MOVEM.L (A4), D7
    MOVEM.L (A5), D7
    MOVEM.L (A6), D7
    MOVEM.L (A7), D7
    
    MOVEM.L (A0)+, D7
    MOVEM.L (A1)+, D7
    MOVEM.L (A2)+, D7
    MOVEM.L (A3)+, D7
    MOVEM.L (A4)+, D7
    MOVEM.L (A5)+, D7
    MOVEM.L (A6)+, D7
    MOVEM.L (A7)+, D7
    
    MOVEM.L $1234, D7
    
    MOVEM.L $12345678, D7
    

    * A Range
    * A Reg
    MOVEM.L (A0), A0
    MOVEM.L (A1), A0
    MOVEM.L (A2), A0
    MOVEM.L (A3), A0
    MOVEM.L (A4), A0
    MOVEM.L (A5), A0
    MOVEM.L (A6), A0
    MOVEM.L (A7), A0
    
    MOVEM.L (A0)+, A0
    MOVEM.L (A1)+, A0
    MOVEM.L (A2)+, A0
    MOVEM.L (A3)+, A0
    MOVEM.L (A4)+, A0
    MOVEM.L (A5)+, A0
    MOVEM.L (A6)+, A0
    MOVEM.L (A7)+, A0
    
    MOVEM.L $1234, A0
    
    MOVEM.L $12345678, A0
    
    MOVEM.L (A0), A4
    MOVEM.L (A1), A4
    MOVEM.L (A2), A4
    MOVEM.L (A3), A4
    MOVEM.L (A4), A4
    MOVEM.L (A5), A4
    MOVEM.L (A6), A4
    MOVEM.L (A7), A4
    
    MOVEM.L (A0)+, A4
    MOVEM.L (A1)+, A4
    MOVEM.L (A2)+, A4
    MOVEM.L (A3)+, A4
    MOVEM.L (A4)+, A4
    MOVEM.L (A5)+, A4
    MOVEM.L (A6)+, A4
    MOVEM.L (A7)+, A4
    
    MOVEM.L $1234, A4
    
    MOVEM.L $12345678, A4
    
    
    MOVEM.L (A0), A7
    MOVEM.L (A1), A7
    MOVEM.L (A2), A7
    MOVEM.L (A3), A7
    MOVEM.L (A4), A7
    MOVEM.L (A5), A7
    MOVEM.L (A6), A7
    MOVEM.L (A7), A7
    
    MOVEM.L (A0)+, A7
    MOVEM.L (A1)+, A7
    MOVEM.L (A2)+, A7
    MOVEM.L (A3)+, A7
    MOVEM.L (A4)+, A7
    MOVEM.L (A5)+, A7
    MOVEM.L (A6)+, A7
    MOVEM.L (A7)+, A7
    
    MOVEM.L $1234, A7
    
    MOVEM.L $12345678, A7
    


    * Only D with small range
    MOVEM.L (A0), D0-D1
    MOVEM.L (A1), D1-D2
    MOVEM.L (A2), D2-D3
    MOVEM.L (A3), D3-D4
    MOVEM.L (A4), D4-D5
    MOVEM.L (A5), D5-D6
    MOVEM.L (A6), D6-D7
   
    MOVEM.L (A0)+, D0-D1
    MOVEM.L (A1)+, D1-D2
    MOVEM.L (A2)+, D2-D3
    MOVEM.L (A3)+, D3-D4
    MOVEM.L (A4)+, D4-D5
    MOVEM.L (A5)+, D5-D6
    MOVEM.L (A6)+, D6-D7
    
    MOVEM.L $1234, D0-D1
    MOVEM.L $1234, D1-D2
    MOVEM.L $1234, D2-D3
    MOVEM.L $1234, D3-D4
    MOVEM.L $1234, D4-D5
    MOVEM.L $1234, D5-D6
    MOVEM.L $1234, D6-D7
    
    MOVEM.L $12345678, D0-D1
    MOVEM.L $12345678, D1-D2
    MOVEM.L $12345678, D2-D3
    MOVEM.L $12345678, D3-D4
    MOVEM.L $12345678, D4-D5
    MOVEM.L $12345678, D5-D6
    MOVEM.L $12345678, D6-D7
    

    * Only A with small range
    MOVEM.L (A0), A0-A1
    MOVEM.L (A1), A1-A2
    MOVEM.L (A2), A2-A3
    MOVEM.L (A3), A3-A4
    MOVEM.L (A4), A4-A5
    MOVEM.L (A5), A5-A6
    MOVEM.L (A6), A6-A7
    
    MOVEM.L (A0)+, A0-A1
    MOVEM.L (A1)+, A1-A2
    MOVEM.L (A2)+, A2-A3
    MOVEM.L (A3)+, A3-A4
    MOVEM.L (A4)+, A4-A5
    MOVEM.L (A5)+, A5-A6
    MOVEM.L (A6)+, A6-A7
    
    MOVEM.L $1234, A0-A1
    MOVEM.L $1234, A1-A2
    MOVEM.L $1234, A2-A3
    MOVEM.L $1234, A3-A4
    MOVEM.L $1234, A4-A5
    MOVEM.L $1234, A5-A6
    MOVEM.L $1234, A6-A7
    
    MOVEM.L $12345678, A0-A1
    MOVEM.L $12345678, A1-A2
    MOVEM.L $12345678, A2-A3
    MOVEM.L $12345678, A3-A4
    MOVEM.L $12345678, A4-A5
    MOVEM.L $12345678, A5-A6
    MOVEM.L $12345678, A6-A7
    
    
    * D & A with small range
    MOVEM.L (A0), D0-D1/A0-A1
    MOVEM.L (A1), D1-D2/A1-A2
    MOVEM.L (A2), D2-D3/A2-A3
    MOVEM.L (A3), D3-D4/A3-A4
    MOVEM.L (A4), D4-D5/A4-A5
    MOVEM.L (A5), D5-D6/A5-A6
    MOVEM.L (A6), D6-D7/A6-A7
    
    MOVEM.L (A0)+, D0-D1/A0-A1
    MOVEM.L (A1)+, D1-D2/A1-A2
    MOVEM.L (A2)+, D2-D3/A2-A3
    MOVEM.L (A3)+, D3-D4/A3-A4
    MOVEM.L (A4)+, D4-D5/A4-A5
    MOVEM.L (A5)+, D5-D6/A5-A6
    MOVEM.L (A6)+, D6-D7/A6-A7
    
    MOVEM.L $1234, D0-D1/A0-A1
    MOVEM.L $1234, D1-D2/A1-A2
    MOVEM.L $1234, D2-D3/A2-A3
    MOVEM.L $1234, D3-D4/A3-A4
    MOVEM.L $1234, D4-D5/A4-A5
    MOVEM.L $1234, D5-D6/A5-A6
    MOVEM.L $1234, D6-D7/A6-A7
    
    MOVEM.L $12345678, D0-D1/A0-A1
    MOVEM.L $12345678, D1-D2/A1-A2
    MOVEM.L $12345678, D2-D3/A2-A3
    MOVEM.L $12345678, D3-D4/A3-A4
    MOVEM.L $12345678, D4-D5/A4-A5
    MOVEM.L $12345678, D5-D6/A5-A6
    MOVEM.L $12345678, D6-D7/A6-A7




      
    NOP
    
    
    * Reg2MEM with -(An)
    MOVEM.W D0 , -(A2)
    MOVEM.W D1 , -(A2)
    MOVEM.W D2 , -(A2)
    MOVEM.W D3 , -(A2)
    MOVEM.W D4 , -(A2)
    MOVEM.W D5 , -(A2)
    MOVEM.W D6 , -(A2)
    MOVEM.W D7 , -(A2)
    
    MOVEM.W A0 , -(A2)
    MOVEM.W A1 , -(A2)
    MOVEM.W A2 , -(A2)
    MOVEM.W A3 , -(A2)
    MOVEM.W A4 , -(A2)
    MOVEM.W A5 , -(A2)
    MOVEM.W A6 , -(A2)
    MOVEM.W A7 , -(A2)
    
    MOVEM.W D0-D1/A6-A7 , -(A2)
    MOVEM.W D1-D2/A5-A6 , -(A2)
    MOVEM.W D2-D3/A4-A5 , -(A2)
    MOVEM.W D3-D4/A3-A4 , -(A2)
    MOVEM.W D4-D5/A2-A3 , -(A2)
    MOVEM.W D5-D6/A1-A2 , -(A2)
    MOVEM.W D6-D7/A0-A1 , -(A2)
    
    
    
    * Mem 2 Reg
    MOVEM.W (A2), D0
    MOVEM.W (A2), D1
    MOVEM.W (A2), D2
    MOVEM.W (A2), D3
    MOVEM.W (A2), D4
    MOVEM.W (A2), D5
    MOVEM.W (A2), D6
    MOVEM.W (A2), D7
    
    MOVEM.W (A2), A0
    MOVEM.W (A2), A1
    MOVEM.W (A2), A2
    MOVEM.W (A2), A3
    MOVEM.W (A2), A4
    MOVEM.W (A2), A5
    MOVEM.W (A2), A6
    MOVEM.W (A2), A7
    
    MOVEM.W (A2), D0-D1
    MOVEM.W (A2), D0-D2
    MOVEM.W (A2), D0-D3
    MOVEM.W (A2), D0-D4
    MOVEM.W (A2), D0-D5
    MOVEM.W (A2), D0-D6
    MOVEM.W (A2), D0-D7
    
    MOVEM.W (A2), A0-A1
    MOVEM.W (A2), A0-A2
    MOVEM.W (A2), A0-A3
    MOVEM.W (A2), A0-A4
    MOVEM.W (A2), A0-A5
    MOVEM.W (A2), A0-A6
    MOVEM.W (A2), A0-A7
    
    * Growing range
    MOVEM.W (A2), D0-D1/A0-A1
    MOVEM.W (A2), D0-D2/A0-A2
    MOVEM.W (A2), D0-D3/A0-A3
    MOVEM.W (A2), D0-D4/A0-A4
    MOVEM.W (A2), D0-D5/A0-A5
    MOVEM.W (A2), D0-D6/A0-A6
    MOVEM.W (A2), D0-D7/A0-A7
    
    MOVEM.W (A2), D1-D2/A1-A2
    MOVEM.W (A2), D2-D3/A2-A3
    MOVEM.W (A2), D3-D4/A3-A4
    MOVEM.W (A2), D4-D5/A4-A5
    MOVEM.W (A2), D5-D6/A5-A6
    MOVEM.W (A2), D6-D7/A6-A7
    
    MOVEM.W (A2), D0-D7/A0-A1
    MOVEM.W (A2), D0-D6/A0-A2
    MOVEM.W (A2), D0-D5/A0-A3
    MOVEM.W (A2), D0-D4/A0-A4
    MOVEM.W (A2), D0-D3/A0-A5
    MOVEM.W (A2), D0-D2/A0-A6
    MOVEM.W (A2), D0-D1/A0-A7
    
    NOP
    
    
    
    NOP
    NOP
    
    
    * Range / Range
    MOVEM.W D0-D1/A0-A1 , (A2)
    MOVEM.W D1-D2/A1-A2 , (A2)
    MOVEM.W D2-D3/A2-A3 , (A2)
    MOVEM.W D3-D4/A3-A4 , (A2)
    MOVEM.W D4-D5/A4-A5 , (A2)
    MOVEM.W D5-D6/A5-A6 , (A2)
    MOVEM.W D6-D7/A6-A7 , (A2)
    MOVEM.W D6-D7/A6-A7 , (A2)
    
    MOVEM.W D0-D7/A0-A1 , (A2)
    MOVEM.W D0-D6/A0-A2 , (A2)
    MOVEM.W D0-D5/A0-A3 , (A2)
    MOVEM.W D0-D4/A0-A4 , (A2)
    MOVEM.W D0-D3/A0-A5 , (A2)
    MOVEM.W D0-D2/A0-A6 , (A2)
    MOVEM.W D0-D1/A0-A7 , (A2)
    
    MOVEM.W D0-D1/A6-A7 , (A2)
    MOVEM.W D1-D2/A5-A6 , (A2)
    MOVEM.W D2-D3/A4-A5 , (A2)
    MOVEM.W D3-D4/A3-A4 , (A2)
    MOVEM.W D4-D5/A2-A3 , (A2)
    MOVEM.W D5-D6/A1-A2 , (A2)
    MOVEM.W D6-D7/A0-A1 , (A2)
    
    
    * Range / Single
    MOVEM.W D0-D1/A0 , (A2)
    MOVEM.W D0-D2/A0 , (A2)
    MOVEM.W D0-D3/A0 , (A2)
    MOVEM.W D0-D4/A0 , (A2)
    MOVEM.W D0-D5/A0 , (A2)
    MOVEM.W D0-D6/A0 , (A2)
    MOVEM.W D0-D7/A0 , (A2)
    
    MOVEM.W D1-D2/A0 , (A2)
    MOVEM.W D1-D3/A0 , (A2)
    MOVEM.W D1-D4/A0 , (A2)
    MOVEM.W D1-D5/A0 , (A2)
    MOVEM.W D1-D6/A0 , (A2)
    MOVEM.W D1-D7/A0 , (A2)
    
    MOVEM.W D2-D3/A0 , (A2)
    MOVEM.W D2-D4/A0 , (A2)
    MOVEM.W D2-D5/A0 , (A2)
    MOVEM.W D2-D6/A0 , (A2)
    MOVEM.W D2-D7/A0 , (A2)
    
    MOVEM.W D3-D4/A0 , (A2)
    MOVEM.W D3-D5/A0 , (A2)
    MOVEM.W D3-D6/A0 , (A2)
    MOVEM.W D3-D7/A0 , (A2)
    
    MOVEM.W D4-D5/A0 , (A2)
    MOVEM.W D4-D6/A0 , (A2)
    MOVEM.W D4-D7/A0 , (A2)
    
    MOVEM.W D5-D6/A0 , (A2)
    MOVEM.W D5-D7/A0 , (A2)
    
    MOVEM.W D6-D7/A0 , (A2)
    
    
    ****
    MOVEM.W D0-D1/A1 , (A2)
    MOVEM.W D0-D2/A1 , (A2)
    MOVEM.W D0-D3/A1 , (A2)
    MOVEM.W D0-D4/A1 , (A2)
    MOVEM.W D0-D5/A1 , (A2)
    MOVEM.W D0-D6/A1 , (A2)
    MOVEM.W D0-D7/A1 , (A2)
    
    MOVEM.W D1-D2/A1 , (A2)
    MOVEM.W D1-D3/A1 , (A2)
    MOVEM.W D1-D4/A1 , (A2)
    MOVEM.W D1-D5/A1 , (A2)
    MOVEM.W D1-D6/A1 , (A2)
    MOVEM.W D1-D7/A1 , (A2)
    
    MOVEM.W D2-D3/A1 , (A2)
    MOVEM.W D2-D4/A1 , (A2)
    MOVEM.W D2-D5/A1 , (A2)
    MOVEM.W D2-D6/A1 , (A2)
    MOVEM.W D2-D7/A1 , (A2)
    
    MOVEM.W D3-D4/A1 , (A2)
    MOVEM.W D3-D5/A1 , (A2)
    MOVEM.W D3-D6/A1 , (A2)
    MOVEM.W D3-D7/A1 , (A2)
    
    MOVEM.W D4-D5/A1 , (A2)
    MOVEM.W D4-D6/A1 , (A2)
    MOVEM.W D4-D7/A1 , (A2)
    
    MOVEM.W D5-D6/A1 , (A2)
    MOVEM.W D5-D7/A1 , (A2)
    
    MOVEM.W D6-D7/A1 , (A2)
    ****
        MOVEM.W D0-D1/A2 , (A2)
    MOVEM.W D0-D2/A2 , (A2)
    MOVEM.W D0-D3/A2 , (A2)
    MOVEM.W D0-D4/A2 , (A2)
    MOVEM.W D0-D5/A2 , (A2)
    MOVEM.W D0-D6/A2 , (A2)
    MOVEM.W D0-D7/A2 , (A2)
    
    MOVEM.W D1-D2/A2 , (A2)
    MOVEM.W D1-D3/A2 , (A2)
    MOVEM.W D1-D4/A2 , (A2)
    MOVEM.W D1-D5/A2 , (A2)
    MOVEM.W D1-D6/A2 , (A2)
    MOVEM.W D1-D7/A2 , (A2)
    
    MOVEM.W D2-D3/A2 , (A2)
    MOVEM.W D2-D4/A2 , (A2)
    MOVEM.W D2-D5/A2 , (A2)
    MOVEM.W D2-D6/A2 , (A2)
    MOVEM.W D2-D7/A2 , (A2)
    
    MOVEM.W D3-D4/A2 , (A2)
    MOVEM.W D3-D5/A2 , (A2)
    MOVEM.W D3-D6/A2 , (A2)
    MOVEM.W D3-D7/A2 , (A2)
    
    MOVEM.W D4-D5/A2 , (A2)
    MOVEM.W D4-D6/A2 , (A2)
    MOVEM.W D4-D7/A2 , (A2)
    
    MOVEM.W D5-D6/A2 , (A2)
    MOVEM.W D5-D7/A2 , (A2)
    
    MOVEM.W D6-D7/A2 , (A2)
    *****
        MOVEM.W D0-D1/A3 , (A2)
    MOVEM.W D0-D2/A3 , (A2)
    MOVEM.W D0-D3/A3 , (A2)
    MOVEM.W D0-D4/A3 , (A2)
    MOVEM.W D0-D5/A3 , (A2)
    MOVEM.W D0-D6/A3 , (A2)
    MOVEM.W D0-D7/A3 , (A2)
    
    MOVEM.W D1-D2/A3 , (A2)
    MOVEM.W D1-D3/A3 , (A2)
    MOVEM.W D1-D4/A3 , (A2)
    MOVEM.W D1-D5/A3 , (A2)
    MOVEM.W D1-D6/A3 , (A2)
    MOVEM.W D1-D7/A3 , (A2)
    
    MOVEM.W D2-D3/A3 , (A2)
    MOVEM.W D2-D4/A3 , (A2)
    MOVEM.W D2-D5/A3 , (A2)
    MOVEM.W D2-D6/A3 , (A2)
    MOVEM.W D2-D7/A3 , (A2)
    
    MOVEM.W D3-D4/A3 , (A2)
    MOVEM.W D3-D5/A3 , (A2)
    MOVEM.W D3-D6/A3 , (A2)
    MOVEM.W D3-D7/A3 , (A2)
    
    MOVEM.W D4-D5/A3 , (A2)
    MOVEM.W D4-D6/A3 , (A2)
    MOVEM.W D4-D7/A3 , (A2)
    
    MOVEM.W D5-D6/A3 , (A2)
    MOVEM.W D5-D7/A3 , (A2)
    
    MOVEM.W D6-D7/A3 , (A2)
    **********
        MOVEM.W D0-D1/A4 , (A2)
    MOVEM.W D0-D2/A4 , (A2)
    MOVEM.W D0-D3/A4 , (A2)
    MOVEM.W D0-D4/A4 , (A2)
    MOVEM.W D0-D5/A4 , (A2)
    MOVEM.W D0-D6/A4 , (A2)
    MOVEM.W D0-D7/A4 , (A2)
    
    MOVEM.W D1-D2/A4 , (A2)
    MOVEM.W D1-D3/A4 , (A2)
    MOVEM.W D1-D4/A4 , (A2)
    MOVEM.W D1-D5/A4 , (A2)
    MOVEM.W D1-D6/A4 , (A2)
    MOVEM.W D1-D7/A4 , (A2)
    
    MOVEM.W D2-D3/A4 , (A2)
    MOVEM.W D2-D4/A4 , (A2)
    MOVEM.W D2-D5/A4 , (A2)
    MOVEM.W D2-D6/A4 , (A2)
    MOVEM.W D2-D7/A4 , (A2)
    
    MOVEM.W D3-D4/A4 , (A2)
    MOVEM.W D3-D5/A4 , (A2)
    MOVEM.W D3-D6/A4 , (A2)
    MOVEM.W D3-D7/A4 , (A2)
    
    MOVEM.W D4-D5/A4 , (A2)
    MOVEM.W D4-D6/A4 , (A2)
    MOVEM.W D4-D7/A4 , (A2)
    
    MOVEM.W D5-D6/A4 , (A2)
    MOVEM.W D5-D7/A4 , (A2)
    
    MOVEM.W D6-D7/A4 , (A2)
    *****
        MOVEM.W D0-D1/A5 , (A2)
    MOVEM.W D0-D2/A5 , (A2)
    MOVEM.W D0-D3/A5 , (A2)
    MOVEM.W D0-D4/A5 , (A2)
    MOVEM.W D0-D5/A5 , (A2)
    MOVEM.W D0-D6/A5 , (A2)
    MOVEM.W D0-D7/A5 , (A2)
    
    MOVEM.W D1-D2/A5 , (A2)
    MOVEM.W D1-D3/A5 , (A2)
    MOVEM.W D1-D4/A5 , (A2)
    MOVEM.W D1-D5/A5 , (A2)
    MOVEM.W D1-D6/A5 , (A2)
    MOVEM.W D1-D7/A5 , (A2)
    
    MOVEM.W D2-D3/A5 , (A2)
    MOVEM.W D2-D4/A5 , (A2)
    MOVEM.W D2-D5/A5 , (A2)
    MOVEM.W D2-D6/A5 , (A2)
    MOVEM.W D2-D7/A5 , (A2)
    
    MOVEM.W D3-D4/A5 , (A2)
    MOVEM.W D3-D5/A5 , (A2)
    MOVEM.W D3-D6/A5 , (A2)
    MOVEM.W D3-D7/A5 , (A2)
    
    MOVEM.W D4-D5/A5 , (A2)
    MOVEM.W D4-D6/A5 , (A2)
    MOVEM.W D4-D7/A5 , (A2)
    
    MOVEM.W D5-D6/A5 , (A2)
    MOVEM.W D5-D7/A5 , (A2)
    
    MOVEM.W D6-D7/A5 , (A2)
    ****
        MOVEM.W D0-D1/A6 , (A2)
    MOVEM.W D0-D2/A6 , (A2)
    MOVEM.W D0-D3/A6 , (A2)
    MOVEM.W D0-D4/A6 , (A2)
    MOVEM.W D0-D5/A6 , (A2)
    MOVEM.W D0-D6/A6 , (A2)
    MOVEM.W D0-D7/A6 , (A2)
    
    MOVEM.W D1-D2/A6 , (A2)
    MOVEM.W D1-D3/A6 , (A2)
    MOVEM.W D1-D4/A6 , (A2)
    MOVEM.W D1-D5/A6 , (A2)
    MOVEM.W D1-D6/A6 , (A2)
    MOVEM.W D1-D7/A6 , (A2)
    
    MOVEM.W D2-D3/A6 , (A2)
    MOVEM.W D2-D4/A6 , (A2)
    MOVEM.W D2-D5/A6 , (A2)
    MOVEM.W D2-D6/A6 , (A2)
    MOVEM.W D2-D7/A6 , (A2)
    
    MOVEM.W D3-D4/A6 , (A2)
    MOVEM.W D3-D5/A6 , (A2)
    MOVEM.W D3-D6/A6 , (A2)
    MOVEM.W D3-D7/A6 , (A2)
    
    MOVEM.W D4-D5/A6 , (A2)
    MOVEM.W D4-D6/A6 , (A2)
    MOVEM.W D4-D7/A6 , (A2)
    
    MOVEM.W D5-D6/A6 , (A2)
    MOVEM.W D5-D7/A6 , (A2)
    
    MOVEM.W D6-D7/A6 , (A2)
    *******
        MOVEM.W D0-D1/A7 , (A2)
    MOVEM.W D0-D2/A7 , (A2)
    MOVEM.W D0-D3/A7 , (A2)
    MOVEM.W D0-D4/A7 , (A2)
    MOVEM.W D0-D5/A7 , (A2)
    MOVEM.W D0-D6/A7 , (A2)
    MOVEM.W D0-D7/A7 , (A2)
    
    MOVEM.W D1-D2/A7 , (A2)
    MOVEM.W D1-D3/A7 , (A2)
    MOVEM.W D1-D4/A7 , (A2)
    MOVEM.W D1-D5/A7 , (A2)
    MOVEM.W D1-D6/A7 , (A2)
    MOVEM.W D1-D7/A7 , (A2)
    
    MOVEM.W D2-D3/A7 , (A2)
    MOVEM.W D2-D4/A7 , (A2)
    MOVEM.W D2-D5/A7 , (A2)
    MOVEM.W D2-D6/A7 , (A2)
    MOVEM.W D2-D7/A7 , (A2)
    
    MOVEM.W D3-D4/A7 , (A2)
    MOVEM.W D3-D5/A7 , (A2)
    MOVEM.W D3-D6/A7 , (A2)
    MOVEM.W D3-D7/A7 , (A2)
    
    MOVEM.W D4-D5/A7 , (A2)
    MOVEM.W D4-D6/A7 , (A2)
    MOVEM.W D4-D7/A7 , (A2)
    
    MOVEM.W D5-D6/A7 , (A2)
    MOVEM.W D5-D7/A7 , (A2)
    
    MOVEM.W D6-D7/A7 , (A2)
    ***********
    
    
    
    
    
    ** Single / Single
    MOVEM.W D0/A0 , (A2)
    MOVEM.W D0/A1 , (A2)
    MOVEM.W D0/A2 , (A2)
    MOVEM.W D0/A3 , (A2)
    MOVEM.W D0/A4 , (A2)
    MOVEM.W D0/A5 , (A2)
    MOVEM.W D0/A6 , (A2)
    MOVEM.W D0/A7 , (A2)
    
    MOVEM.W D1/A0 , (A2)
    MOVEM.W D1/A1 , (A2)
    MOVEM.W D1/A2 , (A2)
    MOVEM.W D1/A3 , (A2)
    MOVEM.W D1/A4 , (A2)
    MOVEM.W D1/A5 , (A2)
    MOVEM.W D1/A6 , (A2)
    MOVEM.W D1/A7 , (A2)
   
    MOVEM.W D2/A0 , (A2)
    MOVEM.W D2/A1 , (A2)
    MOVEM.W D2/A2 , (A2)
    MOVEM.W D2/A3 , (A2)
    MOVEM.W D2/A4 , (A2)
    MOVEM.W D2/A5 , (A2)
    MOVEM.W D2/A6 , (A2)
    MOVEM.W D2/A7 , (A2)
   
    MOVEM.W D3/A0 , (A2)
    MOVEM.W D3/A1 , (A2)
    MOVEM.W D3/A2 , (A2)
    MOVEM.W D3/A3 , (A2)
    MOVEM.W D3/A4 , (A2)
    MOVEM.W D3/A5 , (A2)
    MOVEM.W D3/A6 , (A2)
    MOVEM.W D3/A7 , (A2)
   
    MOVEM.W D4/A0 , (A2)
    MOVEM.W D4/A1 , (A2)
    MOVEM.W D4/A2 , (A2)
    MOVEM.W D4/A3 , (A2)
    MOVEM.W D4/A4 , (A2)
    MOVEM.W D4/A5 , (A2)
    MOVEM.W D4/A6 , (A2)
    MOVEM.W D4/A7 , (A2)
   
    MOVEM.W D5/A0 , (A2)
    MOVEM.W D5/A1 , (A2)
    MOVEM.W D5/A2 , (A2)
    MOVEM.W D5/A3 , (A2)
    MOVEM.W D5/A4 , (A2)
    MOVEM.W D5/A5 , (A2)
    MOVEM.W D5/A6 , (A2)
    MOVEM.W D5/A7 , (A2)
    
    MOVEM.W D6/A0 , (A2)
    MOVEM.W D6/A1 , (A2)
    MOVEM.W D6/A2 , (A2)
    MOVEM.W D6/A3 , (A2)
    MOVEM.W D6/A4 , (A2)
    MOVEM.W D6/A5 , (A2)
    MOVEM.W D6/A6 , (A2)
    MOVEM.W D6/A7 , (A2)

    MOVEM.W D7/A0 , (A2)
    MOVEM.W D7/A1 , (A2)
    MOVEM.W D7/A2 , (A2)
    MOVEM.W D7/A3 , (A2)
    MOVEM.W D7/A4 , (A2)
    MOVEM.W D7/A5 , (A2)
    MOVEM.W D7/A6 , (A2)
    MOVEM.W D7/A7 , (A2)










   
    * A Single
    MOVEM.W A0, (A2)
    MOVEM.W A1, (A2)
    MOVEM.W A2, (A2)
    MOVEM.W A3, (A2)
    MOVEM.W A4, (A2)
    MOVEM.W A5, (A2)
    MOVEM.W A6, (A2)
    MOVEM.W A7, (A2)
    
    * A Ranges
    MOVEM.W A0-A1, (A2)
    MOVEM.W A0-A2, (A2)
    MOVEM.W A0-A3, (A2)
    MOVEM.W A0-A4, (A2)
    MOVEM.W A0-A5, (A2)
    MOVEM.W A0-A6, (A2)
    MOVEM.W A0-A7, (A2)
    NOP
    MOVEM.W A0-A2, (A2)
    MOVEM.W A1-A3, (A2)
    MOVEM.W A2-A4, (A2)
    MOVEM.W A3-A5, (A2)
    MOVEM.W A4-A6, (A2)
    MOVEM.W A5-A7, (A2)
    NOP
    MOVEM.W A0-A3, (A2)
    MOVEM.W A1-A4, (A2)
    MOVEM.W A2-A5, (A2)
    MOVEM.W A3-A6, (A2)
    MOVEM.W A4-A7, (A2)
    NOP
    MOVEM.W A0-A4, (A2)
    MOVEM.W A1-A5, (A2)
    MOVEM.W A2-A6, (A2)
    MOVEM.W A3-A7, (A2)
    NOP
    MOVEM.W A0-A5, (A2)
    MOVEM.W A1-A6, (A2)
    MOVEM.W A2-A7, (A2)
    NOP
    MOVEM.W A0-A6, (A2)
    MOVEM.W A1-A7, (A2)
    NOP
    MOVEM.W A0-A7, (A2)
    
    
    
    
    * D Single
    MOVEM.W D0, (A2)
    MOVEM.W D1, (A2)
    MOVEM.W D2, (A2)
    MOVEM.W D3, (A2)
    MOVEM.W D4, (A2)
    MOVEM.W D5, (A2)
    MOVEM.W D6, (A2)
    MOVEM.W D7, (A2)
    
    * D Ranges
    MOVEM.W D0-D1, (A2)
    MOVEM.W D0-D2, (A2)
    MOVEM.W D0-D3, (A2)
    MOVEM.W D0-D4, (A2)
    MOVEM.W D0-D5, (A2)
    MOVEM.W D0-D6, (A2)
    MOVEM.W D0-D7, (A2)
    NOP
    MOVEM.W D0-D2, (A2)
    MOVEM.W D1-D3, (A2)
    MOVEM.W D2-D4, (A2)
    MOVEM.W D3-D5, (A2)
    MOVEM.W D4-D6, (A2)
    MOVEM.W D5-D7, (A2)
    NOP
    MOVEM.W D0-D3, (A2)
    MOVEM.W D1-D4, (A2)
    MOVEM.W D2-D5, (A2)
    MOVEM.W D3-D6, (A2)
    MOVEM.W D4-D7, (A2)
    NOP
    MOVEM.W D0-D4, (A2)
    MOVEM.W D1-D5, (A2)
    MOVEM.W D2-D6, (A2)
    MOVEM.W D3-D7, (A2)
    NOP
    MOVEM.W D0-D5, (A2)
    MOVEM.W D1-D6, (A2)
    MOVEM.W D2-D7, (A2)
    NOP
    MOVEM.W D0-D6, (A2)
    MOVEM.W D1-D7, (A2)
    NOP
    MOVEM.W D0-D7, (A2)
    NOP
    NOP





























    **************************
    ** LEA: (An), xxx.W, xxx.L
    ************************
    LEA (A0), A0
    LEA (A1), A0
    LEA (A2), A0
    LEA (A3), A0
    LEA (A4), A0
    LEA (A5), A0
    LEA (A6), A0
    LEA (A7), A0
    LEA $1234, A0
    LEA $0FED, A0
    LEA $12345678, A0
    LEA $0FEDCBA9, A0

    LEA (A0), A1
    LEA (A1), A1
    LEA (A2), A1
    LEA (A3), A1
    LEA (A4), A1
    LEA (A5), A1
    LEA (A6), A1
    LEA (A7), A1
    LEA $1234, A1
    LEA $0FED, A1
    LEA $12345678, A1
    LEA $0FEDCBA9, A1
    
    LEA (A0), A2
    LEA (A1), A2
    LEA (A2), A2
    LEA (A3), A2
    LEA (A4), A2
    LEA (A5), A2
    LEA (A6), A2
    LEA (A7), A2
    LEA $1234, A2
    LEA $0FED, A2
    LEA $12345678, A2
    LEA $0FEDCBA9, A2
    
    LEA (A0), A3
    LEA (A1), A3
    LEA (A2), A3
    LEA (A3), A3
    LEA (A4), A3
    LEA (A5), A3
    LEA (A6), A3
    LEA (A7), A3
    LEA $1234, A3
    LEA $0FED, A3
    LEA $12345678, A3
    LEA $0FEDCBA9, A3

    LEA (A0), A4
    LEA (A1), A4
    LEA (A2), A4
    LEA (A3), A4
    LEA (A4), A4
    LEA (A5), A4
    LEA (A6), A4
    LEA (A7), A4
    LEA $1234, A4
    LEA $0FED, A4
    LEA $12345678, A4
    LEA $0FEDCBA9, A4

    LEA (A0), A5
    LEA (A1), A5
    LEA (A2), A5
    LEA (A3), A5
    LEA (A4), A5
    LEA (A5), A5
    LEA (A6), A5
    LEA (A7), A5
    LEA $1234, A5
    LEA $0FED, A5
    LEA $12345678, A5
    LEA $0FEDCBA9, A5

    LEA (A0), A6
    LEA (A1), A6
    LEA (A2), A6
    LEA (A3), A6
    LEA (A4), A6
    LEA (A5), A6
    LEA (A6), A6
    LEA (A7), A6
    LEA $1234, A6
    LEA $0FED, A6
    LEA $12345678, A6
    LEA $0FEDCBA9, A6

    LEA (A0), A7
    LEA (A1), A7
    LEA (A2), A7
    LEA (A3), A7
    LEA (A4), A7
    LEA (A5), A7
    LEA (A6), A7
    LEA (A7), A7
    LEA $1234, A7
    LEA $0FED, A7
    LEA $12345678, A7
    LEA $0FEDCBA9, A7
    
    NOP
    NOP


    **************************
    ** Simple Ones
    ************************
    NOP
    RTS
    
    
    ******************************
    ** JSR: (An), xxx.W, www.L
    ******************************
    JSR (A0)
    JSR (A1)
    JSR (A2)
    JSR (A3)
    JSR (A4)
    JSR (A5)
    JSR (A6)
    JSR (A7)
    JSR $1234
    JSR $0FED
    JSR $12345678 
    JSR $0FEDCBA9





    ******************************
    ** CLR: Dn, (An), (An)+, -(An), xxx.W, xxx.L
    ******************************
    CLR.B D0
    CLR.B D1
    CLR.B D2
    CLR.B D3
    CLR.B D4
    CLR.B D5
    CLR.B D6
    CLR.B D7
    
    CLR.B (A0)
    CLR.B (A1)
    CLR.B (A2)
    CLR.B (A3)
    CLR.B (A4)
    CLR.B (A5)
    CLR.B (A6)
    CLR.B (A7)
    
    CLR.B (A0)+
    CLR.B (A1)+
    CLR.B (A2)+
    CLR.B (A3)+
    CLR.B (A4)+
    CLR.B (A5)+
    CLR.B (A6)+
    CLR.B (A7)+
    
    CLR.B -(A0)
    CLR.B -(A1)
    CLR.B -(A2)
    CLR.B -(A3)
    CLR.B -(A4)
    CLR.B -(A5)
    CLR.B -(A6)
    CLR.B -(A7)
    
    CLR.B $1234
    CLR.B $0FED
    CLR.B $12345678
    CLR.B $0FEDCBA9
    
    ** CLR.W
    CLR.W D0
    CLR.W D1
    CLR.W D2
    CLR.W D3
    CLR.W D4
    CLR.W D5
    CLR.W D6
    CLR.W D7
    
    CLR.W (A0)
    CLR.W (A1)
    CLR.W (A2)
    CLR.W (A3)
    CLR.W (A4)
    CLR.W (A5)
    CLR.W (A6)
    CLR.W (A7)
    
    CLR.W (A0)+
    CLR.W (A1)+
    CLR.W (A2)+
    CLR.W (A3)+
    CLR.W (A4)+
    CLR.W (A5)+
    CLR.W (A6)+
    CLR.W (A7)+
    
    CLR.W -(A0)
    CLR.W -(A1)
    CLR.W -(A2)
    CLR.W -(A3)
    CLR.W -(A4)
    CLR.W -(A5)
    CLR.W -(A6)
    CLR.W -(A7)
    
    CLR.W $1234
    CLR.W $0FED
    CLR.W $12345678
    CLR.W $0FEDCBA9

    ** CLR.L
    CLR.L D0
    CLR.L D1
    CLR.L D2
    CLR.L D3
    CLR.L D4
    CLR.L D5
    CLR.L D6
    CLR.L D7
    
    CLR.L (A0)
    CLR.L (A1)
    CLR.L (A2)
    CLR.L (A3)
    CLR.L (A4)
    CLR.L (A5)
    CLR.L (A6)
    CLR.L (A7)
    
    CLR.L (A0)+
    CLR.L (A1)+
    CLR.L (A2)+
    CLR.L (A3)+
    CLR.L (A4)+
    CLR.L (A5)+
    CLR.L (A6)+
    CLR.L (A7)+
    
    CLR.L -(A0)
    CLR.L -(A1)
    CLR.L -(A2)
    CLR.L -(A3)
    CLR.L -(A4)
    CLR.L -(A5)
    CLR.L -(A6)
    CLR.L -(A7)
    
    CLR.L $1234
    CLR.L $0FED
    CLR.L $0FEDCBA9




    ******************************
    ** LSd
    *****************************
    LSL.B D0, D0
    LSR.B D0, D0
    LSL.B D0, D1
    LSR.B D0, D1
    LSL.B D0, D2
    LSR.B D0, D2
    LSL.B D0, D3
    LSR.B D0, D3
    LSL.B D0, D4
    LSR.B D0, D4
    LSL.B D0, D5
    LSR.B D0, D5
    LSL.B D0, D6
    LSR.B D0, D6
    LSL.B D0, D7
    LSR.B D0, D7
    
    LSL.B D1, D0
    LSR.B D1, D0
    LSL.B D1, D1
    LSR.B D1, D1
    LSL.B D1, D2
    LSR.B D1, D2
    LSL.B D1, D3
    LSR.B D1, D3
    LSL.B D1, D4
    LSR.B D1, D4
    LSL.B D1, D5
    LSR.B D1, D5
    LSL.B D1, D6
    LSR.B D1, D6
    LSL.B D1, D7
    LSR.B D1, D7
    
    LSL.B D2, D0
    LSR.B D2, D0
    LSL.B D2, D1
    LSR.B D2, D1
    LSL.B D2, D2
    LSR.B D2, D2
    LSL.B D2, D3
    LSR.B D2, D3
    LSL.B D2, D4
    LSR.B D2, D4
    LSL.B D2, D5
    LSR.B D2, D5
    LSL.B D2, D6
    LSR.B D2, D6
    LSL.B D2, D7
    LSR.B D2, D7
    
    LSL.B D3, D0
    LSR.B D3, D0
    LSL.B D3, D1
    LSR.B D3, D1
    LSL.B D3, D2
    LSR.B D3, D2
    LSL.B D3, D3
    LSR.B D3, D3
    LSL.B D3, D4
    LSR.B D3, D4
    LSL.B D3, D5
    LSR.B D3, D5
    LSL.B D3, D6
    LSR.B D3, D6
    LSL.B D3, D7
    LSR.B D3, D7
    
    LSL.B D4, D0
    LSR.B D4, D0
    LSL.B D4, D1
    LSR.B D4, D1
    LSL.B D4, D2
    LSR.B D4, D2
    LSL.B D4, D3
    LSR.B D4, D3
    LSL.B D4, D4
    LSR.B D4, D4
    LSL.B D4, D5
    LSR.B D4, D5
    LSL.B D4, D6
    LSR.B D4, D6
    LSL.B D4, D7
    LSR.B D4, D7
    
    LSL.B D5, D0
    LSR.B D5, D0
    LSL.B D5, D1
    LSR.B D5, D1
    LSL.B D5, D2
    LSR.B D5, D2
    LSL.B D5, D3
    LSR.B D5, D3
    LSL.B D5, D4
    LSR.B D5, D4
    LSL.B D5, D5
    LSR.B D5, D5
    LSL.B D5, D6
    LSR.B D5, D6
    LSL.B D5, D7
    LSR.B D5, D7
    
    LSL.B D6, D0
    LSR.B D6, D0
    LSL.B D6, D1
    LSR.B D6, D1
    LSL.B D6, D2
    LSR.B D6, D2
    LSL.B D6, D3
    LSR.B D6, D3
    LSL.B D6, D4
    LSR.B D6, D4
    LSL.B D6, D5
    LSR.B D6, D5
    LSL.B D6, D6
    LSR.B D6, D6
    LSL.B D6, D7
    LSR.B D6, D7
    
    LSL.B D7, D0
    LSR.B D7, D0
    LSL.B D7, D1
    LSR.B D7, D1
    LSL.B D7, D2
    LSR.B D7, D2
    LSL.B D7, D3
    LSR.B D7, D3
    LSL.B D7, D4
    LSR.B D7, D4
    LSL.B D7, D5
    LSR.B D7, D5
    LSL.B D7, D6
    LSR.B D7, D6
    LSL.B D7, D7
    LSR.B D7, D7
    
    ******
    LSL.W D0, D0
    LSR.W D0, D0
    LSL.W D0, D1
    LSR.W D0, D1
    LSL.W D0, D2
    LSR.W D0, D2
    LSL.W D0, D3
    LSR.W D0, D3
    LSL.W D0, D4
    LSR.W D0, D4
    LSL.W D0, D5
    LSR.W D0, D5
    LSL.W D0, D6
    LSR.W D0, D6
    LSL.W D0, D7
    LSR.W D0, D7
    
    LSL.W D1, D0
    LSR.W D1, D0
    LSL.W D1, D1
    LSR.W D1, D1
    LSL.W D1, D2
    LSR.W D1, D2
    LSL.W D1, D3
    LSR.W D1, D3
    LSL.W D1, D4
    LSR.W D1, D4
    LSL.W D1, D5
    LSR.W D1, D5
    LSL.W D1, D6
    LSR.W D1, D6
    LSL.W D1, D7
    LSR.W D1, D7
    
    LSL.W D2, D0
    LSR.W D2, D0
    LSL.W D2, D1
    LSR.W D2, D1
    LSL.W D2, D2
    LSR.W D2, D2
    LSL.W D2, D3
    LSR.W D2, D3
    LSL.W D2, D4
    LSR.W D2, D4
    LSL.W D2, D5
    LSR.W D2, D5
    LSL.W D2, D6
    LSR.W D2, D6
    LSL.W D2, D7
    LSR.W D2, D7
    
    LSL.W D3, D0
    LSR.W D3, D0
    LSL.W D3, D1
    LSR.W D3, D1
    LSL.W D3, D2
    LSR.W D3, D2
    LSL.W D3, D3
    LSR.W D3, D3
    LSL.W D3, D4
    LSR.W D3, D4
    LSL.W D3, D5
    LSR.W D3, D5
    LSL.W D3, D6
    LSR.W D3, D6
    LSL.W D3, D7
    LSR.W D3, D7
    
    LSL.W D4, D0
    LSR.W D4, D0
    LSL.W D4, D1
    LSR.W D4, D1
    LSL.W D4, D2
    LSR.W D4, D2
    LSL.W D4, D3
    LSR.W D4, D3
    LSL.W D4, D4
    LSR.W D4, D4
    LSL.W D4, D5
    LSR.W D4, D5
    LSL.W D4, D6
    LSR.W D4, D6
    LSL.W D4, D7
    LSR.W D4, D7
    
    LSL.W D5, D0
    LSR.W D5, D0
    LSL.W D5, D1
    LSR.W D5, D1
    LSL.W D5, D2
    LSR.W D5, D2
    LSL.W D5, D3
    LSR.W D5, D3
    LSL.W D5, D4
    LSR.W D5, D4
    LSL.W D5, D5
    LSR.W D5, D5
    LSL.W D5, D6
    LSR.W D5, D6
    LSL.W D5, D7
    LSR.W D5, D7
    
    LSL.W D6, D0
    LSR.W D6, D0
    LSL.W D6, D1
    LSR.W D6, D1
    LSL.W D6, D2
    LSR.W D6, D2
    LSL.W D6, D3
    LSR.W D6, D3
    LSL.W D6, D4
    LSR.W D6, D4
    LSL.W D6, D5
    LSR.W D6, D5
    LSL.W D6, D6
    LSR.W D6, D6
    LSL.W D6, D7
    LSR.W D6, D7
    
    LSL.W D7, D0
    LSR.W D7, D0
    LSL.W D7, D1
    LSR.W D7, D1
    LSL.W D7, D2
    LSR.W D7, D2
    LSL.W D7, D3
    LSR.W D7, D3
    LSL.W D7, D4
    LSR.W D7, D4
    LSL.W D7, D5
    LSR.W D7, D5
    LSL.W D7, D6
    LSR.W D7, D6
    LSL.W D7, D7
    LSR.W D7, D7
    *******
    LSL.L D0, D0
    LSR.L D0, D0
    LSL.L D0, D1
    LSR.L D0, D1
    LSL.L D0, D2
    LSR.L D0, D2
    LSL.L D0, D3
    LSR.L D0, D3
    LSL.L D0, D4
    LSR.L D0, D4
    LSL.L D0, D5
    LSR.L D0, D5
    LSL.L D0, D6
    LSR.L D0, D6
    LSL.L D0, D7
    LSR.L D0, D7
    
    LSL.L D1, D0
    LSR.L D1, D0
    LSL.L D1, D1
    LSR.L D1, D1
    LSL.L D1, D2
    LSR.L D1, D2
    LSL.L D1, D3
    LSR.L D1, D3
    LSL.L D1, D4
    LSR.L D1, D4
    LSL.L D1, D5
    LSR.L D1, D5
    LSL.L D1, D6
    LSR.L D1, D6
    LSL.L D1, D7
    LSR.L D1, D7
    
    LSL.L D2, D0
    LSR.L D2, D0
    LSL.L D2, D1
    LSR.L D2, D1
    LSL.L D2, D2
    LSR.L D2, D2
    LSL.L D2, D3
    LSR.L D2, D3
    LSL.L D2, D4
    LSR.L D2, D4
    LSL.L D2, D5
    LSR.L D2, D5
    LSL.L D2, D6
    LSR.L D2, D6
    LSL.L D2, D7
    LSR.L D2, D7
    
    LSL.L D3, D0
    LSR.L D3, D0
    LSL.L D3, D1
    LSR.L D3, D1
    LSL.L D3, D2
    LSR.L D3, D2
    LSL.L D3, D3
    LSR.L D3, D3
    LSL.L D3, D4
    LSR.L D3, D4
    LSL.L D3, D5
    LSR.L D3, D5
    LSL.L D3, D6
    LSR.L D3, D6
    LSL.L D3, D7
    LSR.L D3, D7
    
    LSL.L D4, D0
    LSR.L D4, D0
    LSL.L D4, D1
    LSR.L D4, D1
    LSL.L D4, D2
    LSR.L D4, D2
    LSL.L D4, D3
    LSR.L D4, D3
    LSL.L D4, D4
    LSR.L D4, D4
    LSL.L D4, D5
    LSR.L D4, D5
    LSL.L D4, D6
    LSR.L D4, D6
    LSL.L D4, D7
    LSR.L D4, D7
    
    LSL.L D5, D0
    LSR.L D5, D0
    LSL.L D5, D1
    LSR.L D5, D1
    LSL.L D5, D2
    LSR.L D5, D2
    LSL.L D5, D3
    LSR.L D5, D3
    LSL.L D5, D4
    LSR.L D5, D4
    LSL.L D5, D5
    LSR.L D5, D5
    LSL.L D5, D6
    LSR.L D5, D6
    LSL.L D5, D7
    LSR.L D5, D7
    
    LSL.L D6, D0
    LSR.L D6, D0
    LSL.L D6, D1
    LSR.L D6, D1
    LSL.L D6, D2
    LSR.L D6, D2
    LSL.L D6, D3
    LSR.L D6, D3
    LSL.L D6, D4
    LSR.L D6, D4
    LSL.L D6, D5
    LSR.L D6, D5
    LSL.L D6, D6
    LSR.L D6, D6
    LSL.L D6, D7
    LSR.L D6, D7
    
    LSL.L D7, D0
    LSR.L D7, D0
    LSL.L D7, D1
    LSR.L D7, D1
    LSL.L D7, D2
    LSR.L D7, D2
    LSL.L D7, D3
    LSR.L D7, D3
    LSL.L D7, D4
    LSR.L D7, D4
    LSL.L D7, D5
    LSR.L D7, D5
    LSL.L D7, D6
    LSR.L D7, D6
    LSL.L D7, D7
    LSR.L D7, D7



    
    ******************************
    ** ASd
    *****************************
    ASL.B D0, D0
    ASR.B D0, D0
    ASL.B D0, D1
    ASR.B D0, D1
    ASL.B D0, D2
    ASR.B D0, D2
    ASL.B D0, D3
    ASR.B D0, D3
    ASL.B D0, D4
    ASR.B D0, D4
    ASL.B D0, D5
    ASR.B D0, D5
    ASL.B D0, D6
    ASR.B D0, D6
    ASL.B D0, D7
    ASR.B D0, D7
    
    ASL.B D1, D0
    ASR.B D1, D0
    ASL.B D1, D1
    ASR.B D1, D1
    ASL.B D1, D2
    ASR.B D1, D2
    ASL.B D1, D3
    ASR.B D1, D3
    ASL.B D1, D4
    ASR.B D1, D4
    ASL.B D1, D5
    ASR.B D1, D5
    ASL.B D1, D6
    ASR.B D1, D6
    ASL.B D1, D7
    ASR.B D1, D7
    
    ASL.B D2, D0
    ASR.B D2, D0
    ASL.B D2, D1
    ASR.B D2, D1
    ASL.B D2, D2
    ASR.B D2, D2
    ASL.B D2, D3
    ASR.B D2, D3
    ASL.B D2, D4
    ASR.B D2, D4
    ASL.B D2, D5
    ASR.B D2, D5
    ASL.B D2, D6
    ASR.B D2, D6
    ASL.B D2, D7
    ASR.B D2, D7
    
    ASL.B D3, D0
    ASR.B D3, D0
    ASL.B D3, D1
    ASR.B D3, D1
    ASL.B D3, D2
    ASR.B D3, D2
    ASL.B D3, D3
    ASR.B D3, D3
    ASL.B D3, D4
    ASR.B D3, D4
    ASL.B D3, D5
    ASR.B D3, D5
    ASL.B D3, D6
    ASR.B D3, D6
    ASL.B D3, D7
    ASR.B D3, D7
    
    ASL.B D4, D0
    ASR.B D4, D0
    ASL.B D4, D1
    ASR.B D4, D1
    ASL.B D4, D2
    ASR.B D4, D2
    ASL.B D4, D3
    ASR.B D4, D3
    ASL.B D4, D4
    ASR.B D4, D4
    ASL.B D4, D5
    ASR.B D4, D5
    ASL.B D4, D6
    ASR.B D4, D6
    ASL.B D4, D7
    ASR.B D4, D7
    
    ASL.B D5, D0
    ASR.B D5, D0
    ASL.B D5, D1
    ASR.B D5, D1
    ASL.B D5, D2
    ASR.B D5, D2
    ASL.B D5, D3
    ASR.B D5, D3
    ASL.B D5, D4
    ASR.B D5, D4
    ASL.B D5, D5
    ASR.B D5, D5
    ASL.B D5, D6
    ASR.B D5, D6
    ASL.B D5, D7
    ASR.B D5, D7
    
    ASL.B D6, D0
    ASR.B D6, D0
    ASL.B D6, D1
    ASR.B D6, D1
    ASL.B D6, D2
    ASR.B D6, D2
    ASL.B D6, D3
    ASR.B D6, D3
    ASL.B D6, D4
    ASR.B D6, D4
    ASL.B D6, D5
    ASR.B D6, D5
    ASL.B D6, D6
    ASR.B D6, D6
    ASL.B D6, D7
    ASR.B D6, D7
    
    ASL.B D7, D0
    ASR.B D7, D0
    ASL.B D7, D1
    ASR.B D7, D1
    ASL.B D7, D2
    ASR.B D7, D2
    ASL.B D7, D3
    ASR.B D7, D3
    ASL.B D7, D4
    ASR.B D7, D4
    ASL.B D7, D5
    ASR.B D7, D5
    ASL.B D7, D6
    ASR.B D7, D6
    ASL.B D7, D7
    ASR.B D7, D7
    
    ******
    ASL.W D0, D0
    ASR.W D0, D0
    ASL.W D0, D1
    ASR.W D0, D1
    ASL.W D0, D2
    ASR.W D0, D2
    ASL.W D0, D3
    ASR.W D0, D3
    ASL.W D0, D4
    ASR.W D0, D4
    ASL.W D0, D5
    ASR.W D0, D5
    ASL.W D0, D6
    ASR.W D0, D6
    ASL.W D0, D7
    ASR.W D0, D7
    
    ASL.W D1, D0
    ASR.W D1, D0
    ASL.W D1, D1
    ASR.W D1, D1
    ASL.W D1, D2
    ASR.W D1, D2
    ASL.W D1, D3
    ASR.W D1, D3
    ASL.W D1, D4
    ASR.W D1, D4
    ASL.W D1, D5
    ASR.W D1, D5
    ASL.W D1, D6
    ASR.W D1, D6
    ASL.W D1, D7
    ASR.W D1, D7
    
    ASL.W D2, D0
    ASR.W D2, D0
    ASL.W D2, D1
    ASR.W D2, D1
    ASL.W D2, D2
    ASR.W D2, D2
    ASL.W D2, D3
    ASR.W D2, D3
    ASL.W D2, D4
    ASR.W D2, D4
    ASL.W D2, D5
    ASR.W D2, D5
    ASL.W D2, D6
    ASR.W D2, D6
    ASL.W D2, D7
    ASR.W D2, D7
    
    ASL.W D3, D0
    ASR.W D3, D0
    ASL.W D3, D1
    ASR.W D3, D1
    ASL.W D3, D2
    ASR.W D3, D2
    ASL.W D3, D3
    ASR.W D3, D3
    ASL.W D3, D4
    ASR.W D3, D4
    ASL.W D3, D5
    ASR.W D3, D5
    ASL.W D3, D6
    ASR.W D3, D6
    ASL.W D3, D7
    ASR.W D3, D7
    
    ASL.W D4, D0
    ASR.W D4, D0
    ASL.W D4, D1
    ASR.W D4, D1
    ASL.W D4, D2
    ASR.W D4, D2
    ASL.W D4, D3
    ASR.W D4, D3
    ASL.W D4, D4
    ASR.W D4, D4
    ASL.W D4, D5
    ASR.W D4, D5
    ASL.W D4, D6
    ASR.W D4, D6
    ASL.W D4, D7
    ASR.W D4, D7
    
    ASL.W D5, D0
    ASR.W D5, D0
    ASL.W D5, D1
    ASR.W D5, D1
    ASL.W D5, D2
    ASR.W D5, D2
    ASL.W D5, D3
    ASR.W D5, D3
    ASL.W D5, D4
    ASR.W D5, D4
    ASL.W D5, D5
    ASR.W D5, D5
    ASL.W D5, D6
    ASR.W D5, D6
    ASL.W D5, D7
    ASR.W D5, D7
    
    ASL.W D6, D0
    ASR.W D6, D0
    ASL.W D6, D1
    ASR.W D6, D1
    ASL.W D6, D2
    ASR.W D6, D2
    ASL.W D6, D3
    ASR.W D6, D3
    ASL.W D6, D4
    ASR.W D6, D4
    ASL.W D6, D5
    ASR.W D6, D5
    ASL.W D6, D6
    ASR.W D6, D6
    ASL.W D6, D7
    ASR.W D6, D7
    
    ASL.W D7, D0
    ASR.W D7, D0
    ASL.W D7, D1
    ASR.W D7, D1
    ASL.W D7, D2
    ASR.W D7, D2
    ASL.W D7, D3
    ASR.W D7, D3
    ASL.W D7, D4
    ASR.W D7, D4
    ASL.W D7, D5
    ASR.W D7, D5
    ASL.W D7, D6
    ASR.W D7, D6
    ASL.W D7, D7
    ASR.W D7, D7
    *******
    ASL.L D0, D0
    ASR.L D0, D0
    ASL.L D0, D1
    ASR.L D0, D1
    ASL.L D0, D2
    ASR.L D0, D2
    ASL.L D0, D3
    ASR.L D0, D3
    ASL.L D0, D4
    ASR.L D0, D4
    ASL.L D0, D5
    ASR.L D0, D5
    ASL.L D0, D6
    ASR.L D0, D6
    ASL.L D0, D7
    ASR.L D0, D7
    
    ASL.L D1, D0
    ASR.L D1, D0
    ASL.L D1, D1
    ASR.L D1, D1
    ASL.L D1, D2
    ASR.L D1, D2
    ASL.L D1, D3
    ASR.L D1, D3
    ASL.L D1, D4
    ASR.L D1, D4
    ASL.L D1, D5
    ASR.L D1, D5
    ASL.L D1, D6
    ASR.L D1, D6
    ASL.L D1, D7
    ASR.L D1, D7
    
    ASL.L D2, D0
    ASR.L D2, D0
    ASL.L D2, D1
    ASR.L D2, D1
    ASL.L D2, D2
    ASR.L D2, D2
    ASL.L D2, D3
    ASR.L D2, D3
    ASL.L D2, D4
    ASR.L D2, D4
    ASL.L D2, D5
    ASR.L D2, D5
    ASL.L D2, D6
    ASR.L D2, D6
    ASL.L D2, D7
    ASR.L D2, D7
    
    ASL.L D3, D0
    ASR.L D3, D0
    ASL.L D3, D1
    ASR.L D3, D1
    ASL.L D3, D2
    ASR.L D3, D2
    ASL.L D3, D3
    ASR.L D3, D3
    ASL.L D3, D4
    ASR.L D3, D4
    ASL.L D3, D5
    ASR.L D3, D5
    ASL.L D3, D6
    ASR.L D3, D6
    ASL.L D3, D7
    ASR.L D3, D7
    
    ASL.L D4, D0
    ASR.L D4, D0
    ASL.L D4, D1
    ASR.L D4, D1
    ASL.L D4, D2
    ASR.L D4, D2
    ASL.L D4, D3
    ASR.L D4, D3
    ASL.L D4, D4
    ASR.L D4, D4
    ASL.L D4, D5
    ASR.L D4, D5
    ASL.L D4, D6
    ASR.L D4, D6
    ASL.L D4, D7
    ASR.L D4, D7
    
    ASL.L D5, D0
    ASR.L D5, D0
    ASL.L D5, D1
    ASR.L D5, D1
    ASL.L D5, D2
    ASR.L D5, D2
    ASL.L D5, D3
    ASR.L D5, D3
    ASL.L D5, D4
    ASR.L D5, D4
    ASL.L D5, D5
    ASR.L D5, D5
    ASL.L D5, D6
    ASR.L D5, D6
    ASL.L D5, D7
    ASR.L D5, D7
    
    ASL.L D6, D0
    ASR.L D6, D0
    ASL.L D6, D1
    ASR.L D6, D1
    ASL.L D6, D2
    ASR.L D6, D2
    ASL.L D6, D3
    ASR.L D6, D3
    ASL.L D6, D4
    ASR.L D6, D4
    ASL.L D6, D5
    ASR.L D6, D5
    ASL.L D6, D6
    ASR.L D6, D6
    ASL.L D6, D7
    ASR.L D6, D7
    
    ASL.L D7, D0
    ASR.L D7, D0
    ASL.L D7, D1
    ASR.L D7, D1
    ASL.L D7, D2
    ASR.L D7, D2
    ASL.L D7, D3
    ASR.L D7, D3
    ASL.L D7, D4
    ASR.L D7, D4
    ASL.L D7, D5
    ASR.L D7, D5
    ASL.L D7, D6
    ASR.L D7, D6
    ASL.L D7, D7
    ASR.L D7, D7



    
    ******************************
    ** ROd
    *****************************
    ROL.B D0, D0
    ROR.B D0, D0
    ROL.B D0, D1
    ROR.B D0, D1
    ROL.B D0, D2
    ROR.B D0, D2
    ROL.B D0, D3
    ROR.B D0, D3
    ROL.B D0, D4
    ROR.B D0, D4
    ROL.B D0, D5
    ROR.B D0, D5
    ROL.B D0, D6
    ROR.B D0, D6
    ROL.B D0, D7
    ROR.B D0, D7
    
    ROL.B D1, D0
    ROR.B D1, D0
    ROL.B D1, D1
    ROR.B D1, D1
    ROL.B D1, D2
    ROR.B D1, D2
    ROL.B D1, D3
    ROR.B D1, D3
    ROL.B D1, D4
    ROR.B D1, D4
    ROL.B D1, D5
    ROR.B D1, D5
    ROL.B D1, D6
    ROR.B D1, D6
    ROL.B D1, D7
    ROR.B D1, D7
    
    ROL.B D2, D0
    ROR.B D2, D0
    ROL.B D2, D1
    ROR.B D2, D1
    ROL.B D2, D2
    ROR.B D2, D2
    ROL.B D2, D3
    ROR.B D2, D3
    ROL.B D2, D4
    ROR.B D2, D4
    ROL.B D2, D5
    ROR.B D2, D5
    ROL.B D2, D6
    ROR.B D2, D6
    ROL.B D2, D7
    ROR.B D2, D7
    
    ROL.B D3, D0
    ROR.B D3, D0
    ROL.B D3, D1
    ROR.B D3, D1
    ROL.B D3, D2
    ROR.B D3, D2
    ROL.B D3, D3
    ROR.B D3, D3
    ROL.B D3, D4
    ROR.B D3, D4
    ROL.B D3, D5
    ROR.B D3, D5
    ROL.B D3, D6
    ROR.B D3, D6
    ROL.B D3, D7
    ROR.B D3, D7
    
    ROL.B D4, D0
    ROR.B D4, D0
    ROL.B D4, D1
    ROR.B D4, D1
    ROL.B D4, D2
    ROR.B D4, D2
    ROL.B D4, D3
    ROR.B D4, D3
    ROL.B D4, D4
    ROR.B D4, D4
    ROL.B D4, D5
    ROR.B D4, D5
    ROL.B D4, D6
    ROR.B D4, D6
    ROL.B D4, D7
    ROR.B D4, D7
    
    ROL.B D5, D0
    ROR.B D5, D0
    ROL.B D5, D1
    ROR.B D5, D1
    ROL.B D5, D2
    ROR.B D5, D2
    ROL.B D5, D3
    ROR.B D5, D3
    ROL.B D5, D4
    ROR.B D5, D4
    ROL.B D5, D5
    ROR.B D5, D5
    ROL.B D5, D6
    ROR.B D5, D6
    ROL.B D5, D7
    ROR.B D5, D7
    
    ROL.B D6, D0
    ROR.B D6, D0
    ROL.B D6, D1
    ROR.B D6, D1
    ROL.B D6, D2
    ROR.B D6, D2
    ROL.B D6, D3
    ROR.B D6, D3
    ROL.B D6, D4
    ROR.B D6, D4
    ROL.B D6, D5
    ROR.B D6, D5
    ROL.B D6, D6
    ROR.B D6, D6
    ROL.B D6, D7
    ROR.B D6, D7
    
    ROL.B D7, D0
    ROR.B D7, D0
    ROL.B D7, D1
    ROR.B D7, D1
    ROL.B D7, D2
    ROR.B D7, D2
    ROL.B D7, D3
    ROR.B D7, D3
    ROL.B D7, D4
    ROR.B D7, D4
    ROL.B D7, D5
    ROR.B D7, D5
    ROL.B D7, D6
    ROR.B D7, D6
    ROL.B D7, D7
    ROR.B D7, D7
    
    ******
    ROL.W D0, D0
    ROR.W D0, D0
    ROL.W D0, D1
    ROR.W D0, D1
    ROL.W D0, D2
    ROR.W D0, D2
    ROL.W D0, D3
    ROR.W D0, D3
    ROL.W D0, D4
    ROR.W D0, D4
    ROL.W D0, D5
    ROR.W D0, D5
    ROL.W D0, D6
    ROR.W D0, D6
    ROL.W D0, D7
    ROR.W D0, D7
    
    ROL.W D1, D0
    ROR.W D1, D0
    ROL.W D1, D1
    ROR.W D1, D1
    ROL.W D1, D2
    ROR.W D1, D2
    ROL.W D1, D3
    ROR.W D1, D3
    ROL.W D1, D4
    ROR.W D1, D4
    ROL.W D1, D5
    ROR.W D1, D5
    ROL.W D1, D6
    ROR.W D1, D6
    ROL.W D1, D7
    ROR.W D1, D7
    
    ROL.W D2, D0
    ROR.W D2, D0
    ROL.W D2, D1
    ROR.W D2, D1
    ROL.W D2, D2
    ROR.W D2, D2
    ROL.W D2, D3
    ROR.W D2, D3
    ROL.W D2, D4
    ROR.W D2, D4
    ROL.W D2, D5
    ROR.W D2, D5
    ROL.W D2, D6
    ROR.W D2, D6
    ROL.W D2, D7
    ROR.W D2, D7
    
    ROL.W D3, D0
    ROR.W D3, D0
    ROL.W D3, D1
    ROR.W D3, D1
    ROL.W D3, D2
    ROR.W D3, D2
    ROL.W D3, D3
    ROR.W D3, D3
    ROL.W D3, D4
    ROR.W D3, D4
    ROL.W D3, D5
    ROR.W D3, D5
    ROL.W D3, D6
    ROR.W D3, D6
    ROL.W D3, D7
    ROR.W D3, D7
    
    ROL.W D4, D0
    ROR.W D4, D0
    ROL.W D4, D1
    ROR.W D4, D1
    ROL.W D4, D2
    ROR.W D4, D2
    ROL.W D4, D3
    ROR.W D4, D3
    ROL.W D4, D4
    ROR.W D4, D4
    ROL.W D4, D5
    ROR.W D4, D5
    ROL.W D4, D6
    ROR.W D4, D6
    ROL.W D4, D7
    ROR.W D4, D7
    
    ROL.W D5, D0
    ROR.W D5, D0
    ROL.W D5, D1
    ROR.W D5, D1
    ROL.W D5, D2
    ROR.W D5, D2
    ROL.W D5, D3
    ROR.W D5, D3
    ROL.W D5, D4
    ROR.W D5, D4
    ROL.W D5, D5
    ROR.W D5, D5
    ROL.W D5, D6
    ROR.W D5, D6
    ROL.W D5, D7
    ROR.W D5, D7
    
    ROL.W D6, D0
    ROR.W D6, D0
    ROL.W D6, D1
    ROR.W D6, D1
    ROL.W D6, D2
    ROR.W D6, D2
    ROL.W D6, D3
    ROR.W D6, D3
    ROL.W D6, D4
    ROR.W D6, D4
    ROL.W D6, D5
    ROR.W D6, D5
    ROL.W D6, D6
    ROR.W D6, D6
    ROL.W D6, D7
    ROR.W D6, D7
    
    ROL.W D7, D0
    ROR.W D7, D0
    ROL.W D7, D1
    ROR.W D7, D1
    ROL.W D7, D2
    ROR.W D7, D2
    ROL.W D7, D3
    ROR.W D7, D3
    ROL.W D7, D4
    ROR.W D7, D4
    ROL.W D7, D5
    ROR.W D7, D5
    ROL.W D7, D6
    ROR.W D7, D6
    ROL.W D7, D7
    ROR.W D7, D7
    *******
    ROL.L D0, D0
    ROR.L D0, D0
    ROL.L D0, D1
    ROR.L D0, D1
    ROL.L D0, D2
    ROR.L D0, D2
    ROL.L D0, D3
    ROR.L D0, D3
    ROL.L D0, D4
    ROR.L D0, D4
    ROL.L D0, D5
    ROR.L D0, D5
    ROL.L D0, D6
    ROR.L D0, D6
    ROL.L D0, D7
    ROR.L D0, D7
    
    ROL.L D1, D0
    ROR.L D1, D0
    ROL.L D1, D1
    ROR.L D1, D1
    ROL.L D1, D2
    ROR.L D1, D2
    ROL.L D1, D3
    ROR.L D1, D3
    ROL.L D1, D4
    ROR.L D1, D4
    ROL.L D1, D5
    ROR.L D1, D5
    ROL.L D1, D6
    ROR.L D1, D6
    ROL.L D1, D7
    ROR.L D1, D7
    
    ROL.L D2, D0
    ROR.L D2, D0
    ROL.L D2, D1
    ROR.L D2, D1
    ROL.L D2, D2
    ROR.L D2, D2
    ROL.L D2, D3
    ROR.L D2, D3
    ROL.L D2, D4
    ROR.L D2, D4
    ROL.L D2, D5
    ROR.L D2, D5
    ROL.L D2, D6
    ROR.L D2, D6
    ROL.L D2, D7
    ROR.L D2, D7
    
    ROL.L D3, D0
    ROR.L D3, D0
    ROL.L D3, D1
    ROR.L D3, D1
    ROL.L D3, D2
    ROR.L D3, D2
    ROL.L D3, D3
    ROR.L D3, D3
    ROL.L D3, D4
    ROR.L D3, D4
    ROL.L D3, D5
    ROR.L D3, D5
    ROL.L D3, D6
    ROR.L D3, D6
    ROL.L D3, D7
    ROR.L D3, D7
    
    ROL.L D4, D0
    ROR.L D4, D0
    ROL.L D4, D1
    ROR.L D4, D1
    ROL.L D4, D2
    ROR.L D4, D2
    ROL.L D4, D3
    ROR.L D4, D3
    ROL.L D4, D4
    ROR.L D4, D4
    ROL.L D4, D5
    ROR.L D4, D5
    ROL.L D4, D6
    ROR.L D4, D6
    ROL.L D4, D7
    ROR.L D4, D7
    
    ROL.L D5, D0
    ROR.L D5, D0
    ROL.L D5, D1
    ROR.L D5, D1
    ROL.L D5, D2
    ROR.L D5, D2
    ROL.L D5, D3
    ROR.L D5, D3
    ROL.L D5, D4
    ROR.L D5, D4
    ROL.L D5, D5
    ROR.L D5, D5
    ROL.L D5, D6
    ROR.L D5, D6
    ROL.L D5, D7
    ROR.L D5, D7
    
    ROL.L D6, D0
    ROR.L D6, D0
    ROL.L D6, D1
    ROR.L D6, D1
    ROL.L D6, D2
    ROR.L D6, D2
    ROL.L D6, D3
    ROR.L D6, D3
    ROL.L D6, D4
    ROR.L D6, D4
    ROL.L D6, D5
    ROR.L D6, D5
    ROL.L D6, D6
    ROR.L D6, D6
    ROL.L D6, D7
    ROR.L D6, D7
    
    ROL.L D7, D0
    ROR.L D7, D0
    ROL.L D7, D1
    ROR.L D7, D1
    ROL.L D7, D2
    ROR.L D7, D2
    ROL.L D7, D3
    ROR.L D7, D3
    ROL.L D7, D4
    ROR.L D7, D4
    ROL.L D7, D5
    ROR.L D7, D5
    ROL.L D7, D6
    ROR.L D7, D6
    ROL.L D7, D7
    ROR.L D7, D7



















    *******************
    * Then we do the LSd Data
    LSL.B #1, D0
    LSR.B #1, D0
    LSL.B #1, D1
    LSR.B #1, D1
    LSL.B #1, D2
    LSR.B #1, D2
    LSL.B #1, D3
    LSR.B #1, D3
    LSL.B #1, D4
    LSR.B #1, D4
    LSL.B #1, D5
    LSR.B #1, D5
    LSL.B #1, D6
    LSR.B #1, D6
    LSL.B #1, D7
    LSR.B #1, D7
    
    LSL.B #2, D0
    LSR.B #2, D0
    LSL.B #2, D1
    LSR.B #2, D1
    LSL.B #2, D2
    LSR.B #2, D2
    LSL.B #2, D3
    LSR.B #2, D3
    LSL.B #2, D4
    LSR.B #2, D4
    LSL.B #2, D5
    LSR.B #2, D5
    LSL.B #2, D6
    LSR.B #2, D6
    LSL.B #2, D7
    LSR.B #2, D7
    
    LSL.B #3, D0
    LSR.B #3, D0
    LSL.B #3, D1
    LSR.B #3, D1
    LSL.B #3, D2
    LSR.B #3, D2
    LSL.B #3, D3
    LSR.B #3, D3
    LSL.B #3, D4
    LSR.B #3, D4
    LSL.B #3, D5
    LSR.B #3, D5
    LSL.B #3, D6
    LSR.B #3, D6
    LSL.B #3, D7
    LSR.B #3, D7
    
    LSL.B #4, D0
    LSR.B #4, D0
    LSL.B #4, D1
    LSR.B #4, D1
    LSL.B #4, D2
    LSR.B #4, D2
    LSL.B #4, D3
    LSR.B #4, D3
    LSL.B #4, D4
    LSR.B #4, D4
    LSL.B #4, D5
    LSR.B #4, D5
    LSL.B #4, D6
    LSR.B #4, D6
    LSL.B #4, D7
    LSR.B #4, D7

    LSL.B #5, D0
    LSR.B #5, D0
    LSL.B #5, D1
    LSR.B #5, D1
    LSL.B #5, D2
    LSR.B #5, D2
    LSL.B #5, D3
    LSR.B #5, D3
    LSL.B #5, D4
    LSR.B #5, D4
    LSL.B #5, D5
    LSR.B #5, D5
    LSL.B #5, D6
    LSR.B #5, D6
    LSL.B #5, D7
    LSR.B #5, D7
    
    LSL.B #6, D0
    LSR.B #6, D0
    LSL.B #6, D1
    LSR.B #6, D1
    LSL.B #6, D2
    LSR.B #6, D2
    LSL.B #6, D3
    LSR.B #6, D3
    LSL.B #6, D4
    LSR.B #6, D4
    LSL.B #6, D5
    LSR.B #6, D5
    LSL.B #6, D6
    LSR.B #6, D6
    LSL.B #6, D7
    LSR.B #6, D7
    
    LSL.B #7, D0
    LSR.B #7, D0
    LSL.B #7, D1
    LSR.B #7, D1
    LSL.B #7, D2
    LSR.B #7, D2
    LSL.B #7, D3
    LSR.B #7, D3
    LSL.B #7, D4
    LSR.B #7, D4
    LSL.B #7, D5
    LSR.B #7, D5
    LSL.B #7, D6
    LSR.B #7, D6
    LSL.B #7, D7
    LSR.B #7, D7

    LSL.B #8, D0
    LSR.B #8, D0
    LSL.B #8, D1
    LSR.B #8, D1
    LSL.B #8, D2
    LSR.B #8, D2
    LSL.B #8, D3
    LSR.B #8, D3
    LSL.B #8, D4
    LSR.B #8, D4
    LSL.B #8, D5
    LSR.B #8, D5
    LSL.B #8, D6
    LSR.B #8, D6
    LSL.B #8, D7
    LSR.B #8, D7

    ************
    LSL.W #1, D0
    LSR.W #1, D0
    LSL.W #1, D1
    LSR.W #1, D1
    LSL.W #1, D2
    LSR.W #1, D2
    LSL.W #1, D3
    LSR.W #1, D3
    LSL.W #1, D4
    LSR.W #1, D4
    LSL.W #1, D5
    LSR.W #1, D5
    LSL.W #1, D6
    LSR.W #1, D6
    LSL.W #1, D7
    LSR.W #1, D7
    
    LSL.W #2, D0
    LSR.W #2, D0
    LSL.W #2, D1
    LSR.W #2, D1
    LSL.W #2, D2
    LSR.W #2, D2
    LSL.W #2, D3
    LSR.W #2, D3
    LSL.W #2, D4
    LSR.W #2, D4
    LSL.W #2, D5
    LSR.W #2, D5
    LSL.W #2, D6
    LSR.W #2, D6
    LSL.W #2, D7
    LSR.W #2, D7
    
    LSL.W #3, D0
    LSR.W #3, D0
    LSL.W #3, D1
    LSR.W #3, D1
    LSL.W #3, D2
    LSR.W #3, D2
    LSL.W #3, D3
    LSR.W #3, D3
    LSL.W #3, D4
    LSR.W #3, D4
    LSL.W #3, D5
    LSR.W #3, D5
    LSL.W #3, D6
    LSR.W #3, D6
    LSL.W #3, D7
    LSR.W #3, D7
    
    LSL.W #4, D0
    LSR.W #4, D0
    LSL.W #4, D1
    LSR.W #4, D1
    LSL.W #4, D2
    LSR.W #4, D2
    LSL.W #4, D3
    LSR.W #4, D3
    LSL.W #4, D4
    LSR.W #4, D4
    LSL.W #4, D5
    LSR.W #4, D5
    LSL.W #4, D6
    LSR.W #4, D6
    LSL.W #4, D7
    LSR.W #4, D7

    LSL.W #5, D0
    LSR.W #5, D0
    LSL.W #5, D1
    LSR.W #5, D1
    LSL.W #5, D2
    LSR.W #5, D2
    LSL.W #5, D3
    LSR.W #5, D3
    LSL.W #5, D4
    LSR.W #5, D4
    LSL.W #5, D5
    LSR.W #5, D5
    LSL.W #5, D6
    LSR.W #5, D6
    LSL.W #5, D7
    LSR.W #5, D7
    
    LSL.W #6, D0
    LSR.W #6, D0
    LSL.W #6, D1
    LSR.W #6, D1
    LSL.W #6, D2
    LSR.W #6, D2
    LSL.W #6, D3
    LSR.W #6, D3
    LSL.W #6, D4
    LSR.W #6, D4
    LSL.W #6, D5
    LSR.W #6, D5
    LSL.W #6, D6
    LSR.W #6, D6
    LSL.W #6, D7
    LSR.W #6, D7
    
    LSL.W #7, D0
    LSR.W #7, D0
    LSL.W #7, D1
    LSR.W #7, D1
    LSL.W #7, D2
    LSR.W #7, D2
    LSL.W #7, D3
    LSR.W #7, D3
    LSL.W #7, D4
    LSR.W #7, D4
    LSL.W #7, D5
    LSR.W #7, D5
    LSL.W #7, D6
    LSR.W #7, D6
    LSL.W #7, D7
    LSR.W #7, D7

    LSL.W #8, D0
    LSR.W #8, D0
    LSL.W #8, D1
    LSR.W #8, D1
    LSL.W #8, D2
    LSR.W #8, D2
    LSL.W #8, D3
    LSR.W #8, D3
    LSL.W #8, D4
    LSR.W #8, D4
    LSL.W #8, D5
    LSR.W #8, D5
    LSL.W #8, D6
    LSR.W #8, D6
    LSL.W #8, D7
    LSR.W #8, D7
    ****************
    LSL.L #1, D0
    LSR.L #1, D0
    LSL.L #1, D1
    LSR.L #1, D1
    LSL.L #1, D2
    LSR.L #1, D2
    LSL.L #1, D3
    LSR.L #1, D3
    LSL.L #1, D4
    LSR.L #1, D4
    LSL.L #1, D5
    LSR.L #1, D5
    LSL.L #1, D6
    LSR.L #1, D6
    LSL.L #1, D7
    LSR.L #1, D7
    
    LSL.L #2, D0
    LSR.L #2, D0
    LSL.L #2, D1
    LSR.L #2, D1
    LSL.L #2, D2
    LSR.L #2, D2
    LSL.L #2, D3
    LSR.L #2, D3
    LSL.L #2, D4
    LSR.L #2, D4
    LSL.L #2, D5
    LSR.L #2, D5
    LSL.L #2, D6
    LSR.L #2, D6
    LSL.L #2, D7
    LSR.L #2, D7
    
    LSL.L #3, D0
    LSR.L #3, D0
    LSL.L #3, D1
    LSR.L #3, D1
    LSL.L #3, D2
    LSR.L #3, D2
    LSL.L #3, D3
    LSR.L #3, D3
    LSL.L #3, D4
    LSR.L #3, D4
    LSL.L #3, D5
    LSR.L #3, D5
    LSL.L #3, D6
    LSR.L #3, D6
    LSL.L #3, D7
    LSR.L #3, D7
    
    LSL.L #4, D0
    LSR.L #4, D0
    LSL.L #4, D1
    LSR.L #4, D1
    LSL.L #4, D2
    LSR.L #4, D2
    LSL.L #4, D3
    LSR.L #4, D3
    LSL.L #4, D4
    LSR.L #4, D4
    LSL.L #4, D5
    LSR.L #4, D5
    LSL.L #4, D6
    LSR.L #4, D6
    LSL.L #4, D7
    LSR.L #4, D7

    LSL.L #5, D0
    LSR.L #5, D0
    LSL.L #5, D1
    LSR.L #5, D1
    LSL.L #5, D2
    LSR.L #5, D2
    LSL.L #5, D3
    LSR.L #5, D3
    LSL.L #5, D4
    LSR.L #5, D4
    LSL.L #5, D5
    LSR.L #5, D5
    LSL.L #5, D6
    LSR.L #5, D6
    LSL.L #5, D7
    LSR.L #5, D7
    
    LSL.L #6, D0
    LSR.L #6, D0
    LSL.L #6, D1
    LSR.L #6, D1
    LSL.L #6, D2
    LSR.L #6, D2
    LSL.L #6, D3
    LSR.L #6, D3
    LSL.L #6, D4
    LSR.L #6, D4
    LSL.L #6, D5
    LSR.L #6, D5
    LSL.L #6, D6
    LSR.L #6, D6
    LSL.L #6, D7
    LSR.L #6, D7
    
    LSL.L #7, D0
    LSR.L #7, D0
    LSL.L #7, D1
    LSR.L #7, D1
    LSL.L #7, D2
    LSR.L #7, D2
    LSL.L #7, D3
    LSR.L #7, D3
    LSL.L #7, D4
    LSR.L #7, D4
    LSL.L #7, D5
    LSR.L #7, D5
    LSL.L #7, D6
    LSR.L #7, D6
    LSL.L #7, D7
    LSR.L #7, D7

    LSL.L #8, D0
    LSR.L #8, D0
    LSL.L #8, D1
    LSR.L #8, D1
    LSL.L #8, D2
    LSR.L #8, D2
    LSL.L #8, D3
    LSR.L #8, D3
    LSL.L #8, D4
    LSR.L #8, D4
    LSL.L #8, D5
    LSR.L #8, D5
    LSL.L #8, D6
    LSR.L #8, D6
    LSL.L #8, D7
    LSR.L #8, D7
    
    *****************
    * Then AS
    ASL.B #1, D0
    ASR.B #1, D0
    ASL.B #1, D1
    ASR.B #1, D1
    ASL.B #1, D2
    ASR.B #1, D2
    ASL.B #1, D3
    ASR.B #1, D3
    ASL.B #1, D4
    ASR.B #1, D4
    ASL.B #1, D5
    ASR.B #1, D5
    ASL.B #1, D6
    ASR.B #1, D6
    ASL.B #1, D7
    ASR.B #1, D7
    
    ASL.B #2, D0
    ASR.B #2, D0
    ASL.B #2, D1
    ASR.B #2, D1
    ASL.B #2, D2
    ASR.B #2, D2
    ASL.B #2, D3
    ASR.B #2, D3
    ASL.B #2, D4
    ASR.B #2, D4
    ASL.B #2, D5
    ASR.B #2, D5
    ASL.B #2, D6
    ASR.B #2, D6
    ASL.B #2, D7
    ASR.B #2, D7
    
    ASL.B #3, D0
    ASR.B #3, D0
    ASL.B #3, D1
    ASR.B #3, D1
    ASL.B #3, D2
    ASR.B #3, D2
    ASL.B #3, D3
    ASR.B #3, D3
    ASL.B #3, D4
    ASR.B #3, D4
    ASL.B #3, D5
    ASR.B #3, D5
    ASL.B #3, D6
    ASR.B #3, D6
    ASL.B #3, D7
    ASR.B #3, D7
    
    ASL.B #4, D0
    ASR.B #4, D0
    ASL.B #4, D1
    ASR.B #4, D1
    ASL.B #4, D2
    ASR.B #4, D2
    ASL.B #4, D3
    ASR.B #4, D3
    ASL.B #4, D4
    ASR.B #4, D4
    ASL.B #4, D5
    ASR.B #4, D5
    ASL.B #4, D6
    ASR.B #4, D6
    ASL.B #4, D7
    ASR.B #4, D7

    ASL.B #5, D0
    ASR.B #5, D0
    ASL.B #5, D1
    ASR.B #5, D1
    ASL.B #5, D2
    ASR.B #5, D2
    ASL.B #5, D3
    ASR.B #5, D3
    ASL.B #5, D4
    ASR.B #5, D4
    ASL.B #5, D5
    ASR.B #5, D5
    ASL.B #5, D6
    ASR.B #5, D6
    ASL.B #5, D7
    ASR.B #5, D7
    
    ASL.B #6, D0
    ASR.B #6, D0
    ASL.B #6, D1
    ASR.B #6, D1
    ASL.B #6, D2
    ASR.B #6, D2
    ASL.B #6, D3
    ASR.B #6, D3
    ASL.B #6, D4
    ASR.B #6, D4
    ASL.B #6, D5
    ASR.B #6, D5
    ASL.B #6, D6
    ASR.B #6, D6
    ASL.B #6, D7
    ASR.B #6, D7
    
    ASL.B #7, D0
    ASR.B #7, D0
    ASL.B #7, D1
    ASR.B #7, D1
    ASL.B #7, D2
    ASR.B #7, D2
    ASL.B #7, D3
    ASR.B #7, D3
    ASL.B #7, D4
    ASR.B #7, D4
    ASL.B #7, D5
    ASR.B #7, D5
    ASL.B #7, D6
    ASR.B #7, D6
    ASL.B #7, D7
    ASR.B #7, D7

    ASL.B #8, D0
    ASR.B #8, D0
    ASL.B #8, D1
    ASR.B #8, D1
    ASL.B #8, D2
    ASR.B #8, D2
    ASL.B #8, D3
    ASR.B #8, D3
    ASL.B #8, D4
    ASR.B #8, D4
    ASL.B #8, D5
    ASR.B #8, D5
    ASL.B #8, D6
    ASR.B #8, D6
    ASL.B #8, D7
    ASR.B #8, D7

    ************

    ASL.W #1, D0
    ASR.W #1, D0
    ASL.W #1, D1
    ASR.W #1, D1
    ASL.W #1, D2
    ASR.W #1, D2
    ASL.W #1, D3
    ASR.W #1, D3
    ASL.W #1, D4
    ASR.W #1, D4
    ASL.W #1, D5
    ASR.W #1, D5
    ASL.W #1, D6
    ASR.W #1, D6
    ASL.W #1, D7
    ASR.W #1, D7
    
    ASL.W #2, D0
    ASR.W #2, D0
    ASL.W #2, D1
    ASR.W #2, D1
    ASL.W #2, D2
    ASR.W #2, D2
    ASL.W #2, D3
    ASR.W #2, D3
    ASL.W #2, D4
    ASR.W #2, D4
    ASL.W #2, D5
    ASR.W #2, D5
    ASL.W #2, D6
    ASR.W #2, D6
    ASL.W #2, D7
    ASR.W #2, D7
    
    ASL.W #3, D0
    ASR.W #3, D0
    ASL.W #3, D1
    ASR.W #3, D1
    ASL.W #3, D2
    ASR.W #3, D2
    ASL.W #3, D3
    ASR.W #3, D3
    ASL.W #3, D4
    ASR.W #3, D4
    ASL.W #3, D5
    ASR.W #3, D5
    ASL.W #3, D6
    ASR.W #3, D6
    ASL.W #3, D7
    ASR.W #3, D7
    
    ASL.W #4, D0
    ASR.W #4, D0
    ASL.W #4, D1
    ASR.W #4, D1
    ASL.W #4, D2
    ASR.W #4, D2
    ASL.W #4, D3
    ASR.W #4, D3
    ASL.W #4, D4
    ASR.W #4, D4
    ASL.W #4, D5
    ASR.W #4, D5
    ASL.W #4, D6
    ASR.W #4, D6
    ASL.W #4, D7
    ASR.W #4, D7

    ASL.W #5, D0
    ASR.W #5, D0
    ASL.W #5, D1
    ASR.W #5, D1
    ASL.W #5, D2
    ASR.W #5, D2
    ASL.W #5, D3
    ASR.W #5, D3
    ASL.W #5, D4
    ASR.W #5, D4
    ASL.W #5, D5
    ASR.W #5, D5
    ASL.W #5, D6
    ASR.W #5, D6
    ASL.W #5, D7
    ASR.W #5, D7
    
    ASL.W #6, D0
    ASR.W #6, D0
    ASL.W #6, D1
    ASR.W #6, D1
    ASL.W #6, D2
    ASR.W #6, D2
    ASL.W #6, D3
    ASR.W #6, D3
    ASL.W #6, D4
    ASR.W #6, D4
    ASL.W #6, D5
    ASR.W #6, D5
    ASL.W #6, D6
    ASR.W #6, D6
    ASL.W #6, D7
    ASR.W #6, D7
    
    ASL.W #7, D0
    ASR.W #7, D0
    ASL.W #7, D1
    ASR.W #7, D1
    ASL.W #7, D2
    ASR.W #7, D2
    ASL.W #7, D3
    ASR.W #7, D3
    ASL.W #7, D4
    ASR.W #7, D4
    ASL.W #7, D5
    ASR.W #7, D5
    ASL.W #7, D6
    ASR.W #7, D6
    ASL.W #7, D7
    ASR.W #7, D7

    ASL.W #8, D0
    ASR.W #8, D0
    ASL.W #8, D1
    ASR.W #8, D1
    ASL.W #8, D2
    ASR.W #8, D2
    ASL.W #8, D3
    ASR.W #8, D3
    ASL.W #8, D4
    ASR.W #8, D4
    ASL.W #8, D5
    ASR.W #8, D5
    ASL.W #8, D6
    ASR.W #8, D6
    ASL.W #8, D7
    ASR.W #8, D7
    ****************

    ASL.L #1, D0
    ASR.L #1, D0
    ASL.L #1, D1
    ASR.L #1, D1
    ASL.L #1, D2
    ASR.L #1, D2
    ASL.L #1, D3
    ASR.L #1, D3
    ASL.L #1, D4
    ASR.L #1, D4
    ASL.L #1, D5
    ASR.L #1, D5
    ASL.L #1, D6
    ASR.L #1, D6
    ASL.L #1, D7
    ASR.L #1, D7
    
    ASL.L #2, D0
    ASR.L #2, D0
    ASL.L #2, D1
    ASR.L #2, D1
    ASL.L #2, D2
    ASR.L #2, D2
    ASL.L #2, D3
    ASR.L #2, D3
    ASL.L #2, D4
    ASR.L #2, D4
    ASL.L #2, D5
    ASR.L #2, D5
    ASL.L #2, D6
    ASR.L #2, D6
    ASL.L #2, D7
    ASR.L #2, D7
    
    ASL.L #3, D0
    ASR.L #3, D0
    ASL.L #3, D1
    ASR.L #3, D1
    ASL.L #3, D2
    ASR.L #3, D2
    ASL.L #3, D3
    ASR.L #3, D3
    ASL.L #3, D4
    ASR.L #3, D4
    ASL.L #3, D5
    ASR.L #3, D5
    ASL.L #3, D6
    ASR.L #3, D6
    ASL.L #3, D7
    ASR.L #3, D7
    
    ASL.L #4, D0
    ASR.L #4, D0
    ASL.L #4, D1
    ASR.L #4, D1
    ASL.L #4, D2
    ASR.L #4, D2
    ASL.L #4, D3
    ASR.L #4, D3
    ASL.L #4, D4
    ASR.L #4, D4
    ASL.L #4, D5
    ASR.L #4, D5
    ASL.L #4, D6
    ASR.L #4, D6
    ASL.L #4, D7
    ASR.L #4, D7

    ASL.L #5, D0
    ASR.L #5, D0
    ASL.L #5, D1
    ASR.L #5, D1
    ASL.L #5, D2
    ASR.L #5, D2
    ASL.L #5, D3
    ASR.L #5, D3
    ASL.L #5, D4
    ASR.L #5, D4
    ASL.L #5, D5
    ASR.L #5, D5
    ASL.L #5, D6
    ASR.L #5, D6
    ASL.L #5, D7
    ASR.L #5, D7
    
    ASL.L #6, D0
    ASR.L #6, D0
    ASL.L #6, D1
    ASR.L #6, D1
    ASL.L #6, D2
    ASR.L #6, D2
    ASL.L #6, D3
    ASR.L #6, D3
    ASL.L #6, D4
    ASR.L #6, D4
    ASL.L #6, D5
    ASR.L #6, D5
    ASL.L #6, D6
    ASR.L #6, D6
    ASL.L #6, D7
    ASR.L #6, D7
    
    ASL.L #7, D0
    ASR.L #7, D0
    ASL.L #7, D1
    ASR.L #7, D1
    ASL.L #7, D2
    ASR.L #7, D2
    ASL.L #7, D3
    ASR.L #7, D3
    ASL.L #7, D4
    ASR.L #7, D4
    ASL.L #7, D5
    ASR.L #7, D5
    ASL.L #7, D6
    ASR.L #7, D6
    ASL.L #7, D7
    ASR.L #7, D7

    ASL.L #8, D0
    ASR.L #8, D0
    ASL.L #8, D1
    ASR.L #8, D1
    ASL.L #8, D2
    ASR.L #8, D2
    ASL.L #8, D3
    ASR.L #8, D3
    ASL.L #8, D4
    ASR.L #8, D4
    ASL.L #8, D5
    ASR.L #8, D5
    ASL.L #8, D6
    ASR.L #8, D6
    ASL.L #8, D7
    ASR.L #8, D7

    *****************+
    * Then RO
    ROL.B #1, D0
    ROR.B #1, D0
    ROL.B #1, D1
    ROR.B #1, D1
    ROL.B #1, D2
    ROR.B #1, D2
    ROL.B #1, D3
    ROR.B #1, D3
    ROL.B #1, D4
    ROR.B #1, D4
    ROL.B #1, D5
    ROR.B #1, D5
    ROL.B #1, D6
    ROR.B #1, D6
    ROL.B #1, D7
    ROR.B #1, D7
    
    ROL.B #2, D0
    ROR.B #2, D0
    ROL.B #2, D1
    ROR.B #2, D1
    ROL.B #2, D2
    ROR.B #2, D2
    ROL.B #2, D3
    ROR.B #2, D3
    ROL.B #2, D4
    ROR.B #2, D4
    ROL.B #2, D5
    ROR.B #2, D5
    ROL.B #2, D6
    ROR.B #2, D6
    ROL.B #2, D7
    ROR.B #2, D7
    
    ROL.B #3, D0
    ROR.B #3, D0
    ROL.B #3, D1
    ROR.B #3, D1
    ROL.B #3, D2
    ROR.B #3, D2
    ROL.B #3, D3
    ROR.B #3, D3
    ROL.B #3, D4
    ROR.B #3, D4
    ROL.B #3, D5
    ROR.B #3, D5
    ROL.B #3, D6
    ROR.B #3, D6
    ROL.B #3, D7
    ROR.B #3, D7
    
    ROL.B #4, D0
    ROR.B #4, D0
    ROL.B #4, D1
    ROR.B #4, D1
    ROL.B #4, D2
    ROR.B #4, D2
    ROL.B #4, D3
    ROR.B #4, D3
    ROL.B #4, D4
    ROR.B #4, D4
    ROL.B #4, D5
    ROR.B #4, D5
    ROL.B #4, D6
    ROR.B #4, D6
    ROL.B #4, D7
    ROR.B #4, D7

    ROL.B #5, D0
    ROR.B #5, D0
    ROL.B #5, D1
    ROR.B #5, D1
    ROL.B #5, D2
    ROR.B #5, D2
    ROL.B #5, D3
    ROR.B #5, D3
    ROL.B #5, D4
    ROR.B #5, D4
    ROL.B #5, D5
    ROR.B #5, D5
    ROL.B #5, D6
    ROR.B #5, D6
    ROL.B #5, D7
    ROR.B #5, D7
    
    ROL.B #6, D0
    ROR.B #6, D0
    ROL.B #6, D1
    ROR.B #6, D1
    ROL.B #6, D2
    ROR.B #6, D2
    ROL.B #6, D3
    ROR.B #6, D3
    ROL.B #6, D4
    ROR.B #6, D4
    ROL.B #6, D5
    ROR.B #6, D5
    ROL.B #6, D6
    ROR.B #6, D6
    ROL.B #6, D7
    ROR.B #6, D7
    
    ROL.B #7, D0
    ROR.B #7, D0
    ROL.B #7, D1
    ROR.B #7, D1
    ROL.B #7, D2
    ROR.B #7, D2
    ROL.B #7, D3
    ROR.B #7, D3
    ROL.B #7, D4
    ROR.B #7, D4
    ROL.B #7, D5
    ROR.B #7, D5
    ROL.B #7, D6
    ROR.B #7, D6
    ROL.B #7, D7
    ROR.B #7, D7

    ROL.B #8, D0
    ROR.B #8, D0
    ROL.B #8, D1
    ROR.B #8, D1
    ROL.B #8, D2
    ROR.B #8, D2
    ROL.B #8, D3
    ROR.B #8, D3
    ROL.B #8, D4
    ROR.B #8, D4
    ROL.B #8, D5
    ROR.B #8, D5
    ROL.B #8, D6
    ROR.B #8, D6
    ROL.B #8, D7
    ROR.B #8, D7

    ************

    ROL.W #1, D0
    ROR.W #1, D0
    ROL.W #1, D1
    ROR.W #1, D1
    ROL.W #1, D2
    ROR.W #1, D2
    ROL.W #1, D3
    ROR.W #1, D3
    ROL.W #1, D4
    ROR.W #1, D4
    ROL.W #1, D5
    ROR.W #1, D5
    ROL.W #1, D6
    ROR.W #1, D6
    ROL.W #1, D7
    ROR.W #1, D7
    
    ROL.W #2, D0
    ROR.W #2, D0
    ROL.W #2, D1
    ROR.W #2, D1
    ROL.W #2, D2
    ROR.W #2, D2
    ROL.W #2, D3
    ROR.W #2, D3
    ROL.W #2, D4
    ROR.W #2, D4
    ROL.W #2, D5
    ROR.W #2, D5
    ROL.W #2, D6
    ROR.W #2, D6
    ROL.W #2, D7
    ROR.W #2, D7
    
    ROL.W #3, D0
    ROR.W #3, D0
    ROL.W #3, D1
    ROR.W #3, D1
    ROL.W #3, D2
    ROR.W #3, D2
    ROL.W #3, D3
    ROR.W #3, D3
    ROL.W #3, D4
    ROR.W #3, D4
    ROL.W #3, D5
    ROR.W #3, D5
    ROL.W #3, D6
    ROR.W #3, D6
    ROL.W #3, D7
    ROR.W #3, D7
    
    ROL.W #4, D0
    ROR.W #4, D0
    ROL.W #4, D1
    ROR.W #4, D1
    ROL.W #4, D2
    ROR.W #4, D2
    ROL.W #4, D3
    ROR.W #4, D3
    ROL.W #4, D4
    ROR.W #4, D4
    ROL.W #4, D5
    ROR.W #4, D5
    ROL.W #4, D6
    ROR.W #4, D6
    ROL.W #4, D7
    ROR.W #4, D7

    ROL.W #5, D0
    ROR.W #5, D0
    ROL.W #5, D1
    ROR.W #5, D1
    ROL.W #5, D2
    ROR.W #5, D2
    ROL.W #5, D3
    ROR.W #5, D3
    ROL.W #5, D4
    ROR.W #5, D4
    ROL.W #5, D5
    ROR.W #5, D5
    ROL.W #5, D6
    ROR.W #5, D6
    ROL.W #5, D7
    ROR.W #5, D7
    
    ROL.W #6, D0
    ROR.W #6, D0
    ROL.W #6, D1
    ROR.W #6, D1
    ROL.W #6, D2
    ROR.W #6, D2
    ROL.W #6, D3
    ROR.W #6, D3
    ROL.W #6, D4
    ROR.W #6, D4
    ROL.W #6, D5
    ROR.W #6, D5
    ROL.W #6, D6
    ROR.W #6, D6
    ROL.W #6, D7
    ROR.W #6, D7
    
    ROL.W #7, D0
    ROR.W #7, D0
    ROL.W #7, D1
    ROR.W #7, D1
    ROL.W #7, D2
    ROR.W #7, D2
    ROL.W #7, D3
    ROR.W #7, D3
    ROL.W #7, D4
    ROR.W #7, D4
    ROL.W #7, D5
    ROR.W #7, D5
    ROL.W #7, D6
    ROR.W #7, D6
    ROL.W #7, D7
    ROR.W #7, D7

    ROL.W #8, D0
    ROR.W #8, D0
    ROL.W #8, D1
    ROR.W #8, D1
    ROL.W #8, D2
    ROR.W #8, D2
    ROL.W #8, D3
    ROR.W #8, D3
    ROL.W #8, D4
    ROR.W #8, D4
    ROL.W #8, D5
    ROR.W #8, D5
    ROL.W #8, D6
    ROR.W #8, D6
    ROL.W #8, D7
    ROR.W #8, D7
    ****************

    ROL.L #1, D0
    ROR.L #1, D0
    ROL.L #1, D1
    ROR.L #1, D1
    ROL.L #1, D2
    ROR.L #1, D2
    ROL.L #1, D3
    ROR.L #1, D3
    ROL.L #1, D4
    ROR.L #1, D4
    ROL.L #1, D5
    ROR.L #1, D5
    ROL.L #1, D6
    ROR.L #1, D6
    ROL.L #1, D7
    ROR.L #1, D7
    
    ROL.L #2, D0
    ROR.L #2, D0
    ROL.L #2, D1
    ROR.L #2, D1
    ROL.L #2, D2
    ROR.L #2, D2
    ROL.L #2, D3
    ROR.L #2, D3
    ROL.L #2, D4
    ROR.L #2, D4
    ROL.L #2, D5
    ROR.L #2, D5
    ROL.L #2, D6
    ROR.L #2, D6
    ROL.L #2, D7
    ROR.L #2, D7
    
    ROL.L #3, D0
    ROR.L #3, D0
    ROL.L #3, D1
    ROR.L #3, D1
    ROL.L #3, D2
    ROR.L #3, D2
    ROL.L #3, D3
    ROR.L #3, D3
    ROL.L #3, D4
    ROR.L #3, D4
    ROL.L #3, D5
    ROR.L #3, D5
    ROL.L #3, D6
    ROR.L #3, D6
    ROL.L #3, D7
    ROR.L #3, D7
    
    ROL.L #4, D0
    ROR.L #4, D0
    ROL.L #4, D1
    ROR.L #4, D1
    ROL.L #4, D2
    ROR.L #4, D2
    ROL.L #4, D3
    ROR.L #4, D3
    ROL.L #4, D4
    ROR.L #4, D4
    ROL.L #4, D5
    ROR.L #4, D5
    ROL.L #4, D6
    ROR.L #4, D6
    ROL.L #4, D7
    ROR.L #4, D7

    ROL.L #5, D0
    ROR.L #5, D0
    ROL.L #5, D1
    ROR.L #5, D1
    ROL.L #5, D2
    ROR.L #5, D2
    ROL.L #5, D3
    ROR.L #5, D3
    ROL.L #5, D4
    ROR.L #5, D4
    ROL.L #5, D5
    ROR.L #5, D5
    ROL.L #5, D6
    ROR.L #5, D6
    ROL.L #5, D7
    ROR.L #5, D7
    
    ROL.L #6, D0
    ROR.L #6, D0
    ROL.L #6, D1
    ROR.L #6, D1
    ROL.L #6, D2
    ROR.L #6, D2
    ROL.L #6, D3
    ROR.L #6, D3
    ROL.L #6, D4
    ROR.L #6, D4
    ROL.L #6, D5
    ROR.L #6, D5
    ROL.L #6, D6
    ROR.L #6, D6
    ROL.L #6, D7
    ROR.L #6, D7
    
    ROL.L #7, D0
    ROR.L #7, D0
    ROL.L #7, D1
    ROR.L #7, D1
    ROL.L #7, D2
    ROR.L #7, D2
    ROL.L #7, D3
    ROR.L #7, D3
    ROL.L #7, D4
    ROR.L #7, D4
    ROL.L #7, D5
    ROR.L #7, D5
    ROL.L #7, D6
    ROR.L #7, D6
    ROL.L #7, D7
    ROR.L #7, D7

    ROL.L #8, D0
    ROR.L #8, D0
    ROL.L #8, D1
    ROR.L #8, D1
    ROL.L #8, D2
    ROR.L #8, D2
    ROL.L #8, D3
    ROR.L #8, D3
    ROL.L #8, D4
    ROR.L #8, D4
    ROL.L #8, D5
    ROR.L #8, D5
    ROL.L #8, D6
    ROR.L #8, D6
    ROL.L #8, D7
    ROR.L #8, D7

    *************************
    *******
    *******
    *******
    ***********************
    ** Then the EA ways
    LSL (A0)
    LSR (A0)
    LSL (A1)
    LSR (A1)
    LSL (A2)
    LSR (A2)
    LSL (A3)
    LSR (A3)
    LSL (A4)
    LSR (A4)
    LSL (A5)
    LSR (A5)
    LSL (A6)
    LSR (A6)
    LSL (A7)
    LSR (A7)
    
    LSL (A0)+
    LSR (A0)+
    LSL (A1)+
    LSR (A1)+
    LSL (A2)+
    LSR (A2)+
    LSL (A3)+
    LSR (A3)+
    LSL (A4)+
    LSR (A4)+
    LSL (A5)+
    LSR (A5)+
    LSL (A6)+
    LSR (A6)+
    LSL (A7)+
    LSR (A7)+
    
    LSL -(A0)
    LSR -(A0)
    LSL -(A1)
    LSR -(A1)
    LSL -(A2)
    LSR -(A2)
    LSL -(A3)
    LSR -(A3)
    LSL -(A4)
    LSR -(A4)
    LSL -(A5)
    LSR -(A5)
    LSL -(A6)
    LSR -(A6)
    LSL -(A7)
    LSR -(A7)
    
    LSL $1234
    LSR $1234
    LSL $12345678
    LSR $12345678

    LSL $0FED
    LSR $0FED
    LSL $0FEDCBA9
    LSR $0FEDCBA9
    
    
    ***************
    * ASD
    ASL (A0)
    ASR (A0)
    ASL (A1)
    ASR (A1)
    ASL (A2)
    ASR (A2)
    ASL (A3)
    ASR (A3)
    ASL (A4)
    ASR (A4)
    ASL (A5)
    ASR (A5)
    ASL (A6)
    ASR (A6)
    ASL (A7)
    ASR (A7)
    
    ASL (A0)+
    ASR (A0)+
    ASL (A1)+
    ASR (A1)+
    ASL (A2)+
    ASR (A2)+
    ASL (A3)+
    ASR (A3)+
    ASL (A4)+
    ASR (A4)+
    ASL (A5)+
    ASR (A5)+
    ASL (A6)+
    ASR (A6)+
    ASL (A7)+
    ASR (A7)+
    
    ASL -(A0)
    ASR -(A0)
    ASL -(A1)
    ASR -(A1)
    ASL -(A2)
    ASR -(A2)
    ASL -(A3)
    ASR -(A3)
    ASL -(A4)
    ASR -(A4)
    ASL -(A5)
    ASR -(A5)
    ASL -(A6)
    ASR -(A6)
    ASL -(A7)
    ASR -(A7)
    
    ASL $1234
    ASR $1234
    ASL $12345678
    ASR $12345678

    ASL $0FED
    ASR $0FED
    ASL $0FEDCBA9
    ASR $0FEDCBA9


    ************
    * ROD
    ROL (A0)
    ROR (A0)
    ROL (A1)
    ROR (A1)
    ROL (A2)
    ROR (A2)
    ROL (A3)
    ROR (A3)
    ROL (A4)
    ROR (A4)
    ROL (A5)
    ROR (A5)
    ROL (A6)
    ROR (A6)
    ROL (A7)
    ROR (A7)
    
    ROL (A0)+
    ROR (A0)+
    ROL (A1)+
    ROR (A1)+
    ROL (A2)+
    ROR (A2)+
    ROL (A3)+
    ROR (A3)+
    ROL (A4)+
    ROR (A4)+
    ROL (A5)+
    ROR (A5)+
    ROL (A6)+
    ROR (A6)+
    ROL (A7)+
    ROR (A7)+
    
    ROL -(A0)
    ROR -(A0)
    ROL -(A1)
    ROR -(A1)
    ROL -(A2)
    ROR -(A2)
    ROL -(A3)
    ROR -(A3)
    ROL -(A4)
    ROR -(A4)
    ROL -(A5)
    ROR -(A5)
    ROL -(A6)
    ROR -(A6)
    ROL -(A7)
    ROR -(A7)
    
    ROL $1234
    ROR $1234
    ROL $12345678
    ROR $12345678

    ROL $0FED
    ROR $0FED
    ROL $0FEDCBA9
    ROR $0FEDCBA9


    *******************
    * End of ASd, LSd, ROd
    *************************
    
    	AND.B	D1,D2
	AND.B	(A2),D7
	AND.B	(A2)+, D4
	AND.B	-(A3),D3
	AND.B	$6000, D5	*word
	AND.B	$A000, D5	*long
	AND.B	#$12, D0	
	
	AND.W	D1,D2
	AND.W	(A2),D7
	AND.W	(A2)+, D4
	AND.W	-(A3),D3
	AND.W	$6000, D5	*word
	AND.W	$A000, D5	*long
	AND.W	#$1234, D1
	AND.W	#$12, D0	
	
	AND.L	D1,D2
	AND.L	(A2),D7
	AND.L	(A2)+, D4
	AND.L	-(A3),D3
	AND.L	$6000, D5	*word
	AND.L	$A000, D5	*long
	AND.L	#$1234, D1
	AND.L	#$12, D0	
	AND.L	#$12345678, D3 
	
	*<EA> is destination
	AND.B	D0, (A2)
	AND.B	D1, (A2)+
	AND.B	D2, -(A3)
	AND.B	D3, $3000	*word
	AND.B	D4, $A000	*long
	
	AND.W	D0, (A2)
	AND.W	D1, (A2)+
	AND.W	D2, -(A3)
	AND.W	D3, $3000	*word
	AND.W	D4, $A000	*long
	
	AND.L	D0, (A2)
	AND.L	D1, (A2)+
	AND.L	D2, -(A3)
	AND.L	D3, $3000	*word
	AND.L	D4, $A000	*long

	*Illegal for MULU: C4C9 (An), C4E9 (dAn), C4F1(dAnXn)
	*MULU, MULS, DIVU WORD only
	MULU.W	D2,D4
	MULU.W	(A2),D2
	MULU.W	(A3)+, D5
	MULU.W	-(A6),D0
	MULU.W	$3000, D6
	MULU.W	$9000, D3
	MULU.W	#$1234, D1
	MULU.W	#$12, D7
	
	*Illegal for MULS: C5C9 (An), C5E8 (dAn), C5F0 (dAnXn) 
	MULS.W	D2,D4
	MULS.W	(A2),D2
	MULS.W	(A3)+, D5
	MULS.W	-(A6),D0
	MULS.W	$3000, D6
	MULS.W	$9000, D3
	MULS.W	#$1234, D1
	MULS.W	#$12, D7      	
 	*Illegal for DIVU: 84C9 (An), 84E8 (dAn), 84F0 (dAnXn)
 	DIVU.W	D2,D4
	DIVU.W	(A2),D2
	DIVU.W	(A3)+, D5
	DIVU.W	-(A6),D0
	DIVU.W	$3000, D6
	DIVU.W	$9000, D3
	DIVU.W	#$1234, D1
	DIVU.W	#$12, D7
	
	*Illegall for OR: 844C (An), 846C (dAn), 8474(dAnXn), 857C(#<data> when <ea> is destination)
	*<EA> is source
	OR.B		D1,D2
	OR.B		(A2),D7
	OR.B		(A2)+, D4
	OR.B		-(A3),D3
	OR.B		$6000, D5	*word
	OR.B		$A000, D5	*long
	OR.B		#$12, D0	
	
	OR.W		D1,D2
	OR.W		(A2),D7
	OR.W		(A2)+, D4
	OR.W		-(A3),D3
	OR.W		$6000, D5	*word
	OR.W		$A000, D5	*long
	OR.W		#$1234, D1
	OR.W		#$12, D0	

	OR.L		D1,D2
	OR.L		(A2),D7
	OR.L		(A2)+, D4
	OR.L		-(A3),D3
	OR.L		$6000, D5	*word
	OR.L		$A000, D5	*long
	OR.L		#$1234, D1
	OR.L		#$12, D0	
	OR.L		#$12345678, D3 	
	
	*<EA> is destination
	OR.B		D0, (A2)
	OR.B		D1, (A2)+
	OR.B		D2, -(A3)
	OR.B		D3, $3000	*word
	OR.B		D4, $A000	*long
	
	OR.W		D0, (A2)
	OR.W		D1, (A2)+
	OR.W		D2, -(A3)
	OR.W		D3, $3000	*word
	OR.W		D4, $A000	*long
	
	OR.L		D0, (A2)
	OR.L		D1, (A2)+
	OR.L		D2, -(A3)
	OR.L		D3, $3000	*word
	OR.L		D4, $A000	*long
	
	*Illegal for ADDQ: 540C (.B when source is An), 567C (#<data> when <ea> is destination), 542C (dAn), 5434(dAnXn)
	ADDQ.B	#$4, D7
	ADDQ.B	#$1, (A1)
	ADDQ.B	#$6, (A2)+
	ADDQ.B	#$2, -(A3)
	ADDQ.B	#$7, $9000
	ADDQ.B	#$5, $3000
	
	ADDQ.W	#$4, D7
	ADDQ.W	#$1, A1
	ADDQ.W	#$3, (A2)
	ADDQ.W	#$6, (A3)+
	ADDQ.W	#$2, -(A4)
	ADDQ.W	#$7, $9000
	ADDQ.W	#$5, $3000
	
	ADDQ.L	#$4, D7
	ADDQ.L	#$1, A1
	ADDQ.L	#$3, (A3)
	ADDQ.L	#$6, (A3)+
	ADDQ.L	#$2, -(A3)
	ADDQ.L	#$7, $9000
	ADDQ.L	#$5, $3000
	
	*Illegal for SUB: 960A (.B when source is An) , 9B4A (An is destination), 9B7C (#<data> when <ea> is destination), 
					*9B68(dAn), 9B70(dAnXn)
	SUB.B	D5, D2
	SUB.B	(A1), D1
	SUB.B	(A2)+, D4
	SUB.B	-(A3),D3
	SUB.B	$3000, D5
	SUB.B	$9000, D5
			
	SUB.W	D5, D2
	SUB.W	A2, D3
	SUB.W	(A1), D1
	SUB.W	(A2)+, D4
	SUB.W	-(A3),D3
	SUB.W	$3000, D5
	SUB.W	$9000, D5
	
	SUB.L	D5, D2
	SUB.L	A2, D3
	SUB.L	(A1), D1
	SUB.L	(A2)+, D4
	SUB.L	-(A3),D3
	SUB.L	$3000, D5
	SUB.L	$9000, D5
		
	SUB.B	D1, (A1)
	SUB.B	D2, (A2)+
	SUB.B	D3, -(A3)
	SUB.B	D4, $3000
	SUB.B	D5, $9000
	
	SUB.W	D1, (A1)
	SUB.W	D2, (A2)+
	SUB.W	D3, -(A3)
	SUB.W	D4, $3000
	SUB.W	D5, $9000
	
	SUB.L	D1, (A1)
	SUB.L	D2, (A2)+
	SUB.L	D3, -(A3)
	SUB.L	D4, $3000
	SUB.L	D5, $9000
	
	*Illegal for ADD: D409 (.B when source is An) , D509 (An is destination), D53C (#<data> when <ea> is destination)
					*D528(dAn), D530(dAnXn)
	ADD.B	D5, D2
	ADD.B	(A1), D1
	ADD.B	(A2)+, D4
	ADD.B	-(A3),D3
	ADD.B	$3000, D5
	ADD.B	$9000, D5
			
	ADD.W	D5, D2
	ADD.W	A2, D3
	ADD.W	(A1), D1
	ADD.W	(A2)+, D4
	ADD.W	-(A3),D3
	ADD.W	$3000, D5
	ADD.W	$9000, D5
	
	ADD.L	D5, D2
	ADD.L	A2, D3
	ADD.L	(A1), D1
	ADD.L	(A2)+, D4
	ADD.L	-(A3),D3
	ADD.L	$3000, D5
	ADD.L	$9000, D5
		
	ADD.B	D1, (A1)
	ADD.B	D2, (A2)+
	ADD.B	D3, -(A3)
	ADD.B	D4, $3000
	ADD.B	D5, $9000
	
	ADD.W	D1, (A1)
	ADD.W	D2, (A2)+
	ADD.W	D3, -(A3)
	ADD.W	D4, $3000
	ADD.W	D5, $9000
	
	ADD.L	D1, (A1)
	ADD.L	D2, (A2)+
	ADD.L	D3, -(A3)
	ADD.L	D4, $3000
	ADD.L	D5, $9000	
	
	*Illegal for ADDA: D5E8 (dAn), D5F0 (dAnXn)
	ADDA.W	D2, A3
	ADDA.W	A4, A5
	ADDA.W	(A3),A6
	ADDA.W	(A4)+, A2
	ADDA.W	-(A3),A1
	ADDA.W	$3000, A2
	ADDA.W	$9000, A5
	ADDA.W	#$1234, A3
	ADDA.W	#$12, A4
	
	ADDA.L	D2, A3
	ADDA.L	A4, A5
	ADDA.L	(A3),A6
	ADDA.L	(A4)+, A2
	ADDA.L	-(A3),A1
	ADDA.L	$3000, A2
	ADDA.L	$9000, A5
	ADDA.L	#$1234, A3
	ADDA.L	#$12, A4
	ADDA.L	#$12345678, A3 

*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description: Test code for robs groupings
*-----------------------------------------------------------

    moveq #$00,  D0   
    moveq #$12,  D4    
    moveq #$FF,  D7   
    moveq #$AA,  D7   


    subi.l #$00,  D0   
    subi.l #$1111,  D4    
    subi.l #$FF,  D7   
    subi.l #$AA,  D7   


    subi.l #$11333311,  (a0)   
    subi.l #$1111,  (A3)   
    subi.l #$1111,  (A7)   
    
    subi.l #$1111,  -(a0)   
    subi.l #$FFFFFFFF,  -(A3)   
    subi.l #$1111,  -(A7)   

    
    subi.l #$1111,  (a0)+   
    subi.l #$1111,  (A3)+   

    subi.l #$00000000,  $3000   
    subi.l #$1111,  $FFFFF   
    subi.l #$1111,  $3000   

    subi.l #$1111,  $9000   
    subi.l #$1111,  $9999   
    subi.l #$1111,  $9999   


    addi.l #$00,  D0   
    addi.l #$1111,  D4    
    addi.l #$FF,  D7   
    addi.l #$AA,  D7   

 
    
    addi.l #$11333311,  (a0)   
    addi.l #$1111,  (A3)   
    addi.l #$1111,  (A7)   
    
    addi.l #$1111,  -(a0)   
    addi.l #$FFFFFFFF,  -(A3)   
    addi.l #$1111,  -(A7)   

    
    addi.l #$1111,  (a0)+   
    addi.l #$1111,  (A3)+   

    addi.l #$00000000,  $3000   
    addi.l #$1111,  $FFFFF   
    addi.l #$1111,  $3000   

    addi.l #$1111,  $9000   
    addi.l #$1111,  $9999   
    addi.l #$1111,  $9999   


    subi.w #$00,  D0   
    subi.w #$1111,  D4    
    subi.w #$FF,  D7   
    subi.w #$AA,  D7   


    
    subi.w #$1111,  (a0)   
    subi.w #$1111,  (A3)   
    subi.w #$1111,  (A7)   
    
    subi.w #$1111,  -(a0)   
    subi.w #$1111,  -(A3)   
    subi.w #$1111,  -(A7)   

    
    subi.w #$1111,  (a0)+   
    subi.w #$1111,  (A3)+   

    subi.w #$1111,  $3000   
    subi.w #$1111,  $FFFFF   
    subi.w #$1111,  $3000   

    subi.w #$1111,  $9000   
    subi.w #$1111,  $9999   
    subi.w #$1111,  $9999   


    addi.w #$00,  D0   
    addi.w #$1111,  D4    
    addi.w #$FF,  D7   
    addi.w #$AA,  D7     
    
    addi.w #$1111,  (a0)   
    addi.w #$1111,  (A3)   
    addi.w #$1111,  (A7)   
    
    addi.w #$1111,  -(a0)   
    addi.w #$1111,  -(A3)   
    addi.w #$1111,  -(A7)   

    
    addi.w #$1111,  (a0)+   
    addi.w #$1111,  (A3)+   

    addi.w #$1111,  $3000   
    addi.w #$1111,  $FFFFF   
    addi.w #$1111,  $3000   

    addi.w #$1111,  $9000   
    addi.w #$1111,  $9999   
    addi.w #$1111,  $9999   


    addi.b #$00,  D0   
    addi.b #$12,  D4    
    addi.b #$FF,  D7   
    addi.b #$AA,  D7   


    addi.b #$12,  (a0)   
    addi.b #$12,  (A3)   
    addi.b #$12,  (A7)   
    
    addi.b #$12,  -(a0)   
    addi.b #$12,  -(A3)   
    addi.b #$12,  -(A7)   

    
    addi.b #$12,  (a0)+   
    addi.b #$12,  (A3)+   

    addi.b #$12,  $3000   
    addi.b #$12,  $FFFFF   
    addi.b #$12,  $3000   

    addi.b #$12,  $9000   
    addi.b #$12,  $9999   
    addi.b #$12,  $9999   


    subi.b #$00,  D0   
    subi.b #$12,  D4    
    subi.b #$FF,  D7   
    subi.b #$AA,  D7   

 
    
    subi.b #$12,  (a0)   
    subi.b #$12,  (A3)   
    subi.b #$12,  (A7)   
    
    subi.b #$12,  -(a0)   
    subi.b #$12,  -(A3)   
    subi.b #$12,  -(A7)   

    
    subi.b #$12,  (a0)+   
    subi.b #$12,  (A3)+   

    subi.b #$12,  $3000   
    subi.b #$12,  $FFFFF   
    subi.b #$12,  $3000   

    subi.b #$12,  $9000   
    subi.b #$12,  $9999   
    subi.b #$12,  $9999   


    cmp  D0,   d1
    cmp  D4,    d1
    cmp  D7,   d1
    cmp  D7,   d1


    cmp  A7,   d1
    
    cmp  (a0),   d1
    cmp  (A3),   d1
    cmp  (A7),   d1

    
    cmp  -(a0),   d1
    cmp  -(A3),   d1
    cmp  -(A7),   d1

    
    cmp  (a0)+,   d1
    cmp  (A3)+,   d1

    cmp  $3000,   d1
    cmp  $FFFFF,   d1
    cmp  $3000,   d1

    cmp  $9000,   d1
    cmp  $9999,   d1
    cmp  $9999,   d1

    cmp  #$00,   d1
    cmp  #$1E,   d1
    cmp  #$FF,   d1


    movea.l  D0,   a1
    movea.l  D4,    a1
    movea.l  D7,   a1
    movea.l  D7,   a1

    movea.l  a0,   a7
    movea.l  A3,   a0
    movea.l  A7,   a1
    
    movea.l  (a0),   a1
    movea.l  (A3),   a1
    movea.l  (A7),   a1

    
    movea.l  -(a0),   a1
    movea.l  -(A3),   a1
    movea.l  -(A7),   a1

    
    movea.l  (a0)+,   a1
    movea.l  (A3)+,   a1

    movea.l  $3000,   a1
    movea.l  $FFFFF,   a1
    movea.l  $3000,   a1

    movea.l  $9000,   a1
    movea.l  $9999,   a1
    movea.l  $9999,   a1

    movea.l  #$00,   a1
    movea.l  #$1E,   a1
    movea.l  #$FF,   a1
    

    move.l  D0,   D0
    move.l  D4,   D4
    move.l  D7,   D7
    move.l  D7,   D1
    
      move.l  a0,   D0
    move.l  A3,   D5
    move.l  A7,   D1
    
    move.l  (a0),   D0
    move.l  (A3),   D5
    move.l  (A7),   D1
    
    move.l  -(a0),   D0
    move.l  -(A3),   D5
    move.l  -(A7),   D1
    
    move.l  (a0)+,   D0
    move.l  (A3)+,   D5
    move.l  (A7)+,   D1   

    move.l  $3000,   D0
    move.l  $FFFFF,   D5
    move.l  $3000,   D1

    move.l  $9000,   D0
    move.l  $9999,   D5
    move.l  $9999,   D1 

    move.l  #$00,   D0
    move.l  #$1E,   D4
    move.l  #$FF,   D7
    
    move.l  #$01,   D0
    move.l  #$01,   D4
    move.l  #$01,   D7

******************************************************


    move.l  D0,   (A0)
    move.l  D4,    (A2)
    move.l  D7,   (A7)
    move.l  D7,   (A2)
    
    move.l  a0,   (A0)
    move.l  A3,   (A2)
    move.l  A7,   (A7)
        
    
    move.l  (a0),   (A0)
    move.l  (A3),   (A2)
    move.l  (A7),   (A7)
    
    move.l  -(a0),   (A2)
    move.l  -(A3),   (A7)
    move.l  -(A7),   (A0)
    
    move.l  (a0)+,   (A2)
    move.l  (A3)+,   (A0) 

    move.l  $3000,   (A2)
    move.l  $FFFFF,   (A1)
    move.l  $3000,   (A5)

    move.l  $9000,   (A1)
    move.l  $9999,   (A5)
    move.l  $9999,   (A3)

    move.l  #$00,   (A0)
    move.l  #$1E,   (A0)
    move.l  #$FF,   (A0)




************************************* 



    move.l  D0,   (A0)+
    move.l  D4,    (A2)+
    move.l  D7,   (A7)+
    move.l  D7,   (A2)+
   
     move.l  a0,   (A0)+
    move.l  A3,   (A2)+
    move.l  A7,   (A7)+
 
    move.l  (a0),   (A0)+
    move.l  (A3),   (A2)+
    move.l  (A7),   (A7)+
    
    move.l  -(a0),   (A2)+
    move.l  -(A3),   (A7)+
    move.l  -(A7),   (A0)+
    
    move.l  (a0)+,   (A2)+
    move.l  (A3)+,   (A0)+

    move.l  $3000,   (A2)+
    move.l  $FFFFF,   (A1)+
    move.l  $3000,   (A5)+

    move.l  $9000,   (A1)+
    move.l  $9999,   (A5)+
    move.l  $9999,   (A3)+

    move.l  #$00,   (A0)+
    move.l  #$1E,   (A0)+
    move.l  #$FF,   (A0)+

****************************************************

    move.l  D0,   -(A0)
    move.l  D4,    -(A2)
    move.l  D7,   -(A7)
    move.l  D7,   -(A2)

    move.l  a0,   -(A0)
    move.l  A3,   -(A2)
    move.l  A7,   -(A7)
    
    move.l  (a0),   -(A0)
    move.l  (A3),   -(A2)
    move.l  (A7),   -(A7)
    
    move.l  -(a0),   -(A2)
    move.l  -(A3),   -(A7)
    move.l  -(A7),   -(A0)
    
    move.l  (a0)+,   -(A2)
    move.l  (A3)+,   -(A0)

    move.l  $3000,   -(A2)
    move.l  $FFFFF,   -(A1)
    move.l  $3000,   -(A5)

    move.l  $9000,   -(A1)
    move.l  $9999,   -(A5)
    move.l  $9999,   -(A3)

    move.l  #$00,   -(A0)
    move.l  #$1E,   -(A0)
    move.l  #$FF,   -(A0)
    
    ****************************************************************
    

    move.l  D0,   $3000
    move.l  D4,    $0002
    move.l  D7,   $3245
    move.l  D7,   $34

    move.l  a0,   $0021
    move.l  A3,   $3421
    move.l  A7,   $0021

    
    move.l  (a0),   $0021
    move.l  (A3),   $3421
    move.l  (A7),   $0021

    
    move.l  -(a0),   $0021
    move.l  -(A3),   $0021
    move.l  -(A7),   $0021

    
    move.l  (a0)+,   $0021
    move.l  (A3)+,   $0021

    move.l  $3000,   $0021
    move.l  $FFFFF,   $0021
    move.l  $3000,   $0021

    move.l  $9000,   $0021
    move.l  $9999,   $0021
    move.l  $9999,   $0021

    move.l  #$00,   $0021
    move.l  #$1E,   $0021
    move.l  #$FF,   $0021
    
    *********************************************************************************
    
    
    move.l  D0,   $9000
    move.l  D4,    $9000
    move.l  D7,   $9000
    move.l  D7,   $9000

    move.l  a0,   $9000
    move.l  A3,   $9000
    move.l  A7,   $9000
    
    move.l  (a0),   $9000
    move.l  (A3),   $9000
    move.l  (A7),   $9000

    
    move.l  -(a0),   $9000
    move.l  -(A3),   $9000
    move.l  -(A7),   $9000

    
    move.l  (a0)+,   $9000
    move.l  (A3)+,   $9000

    move.l  $3000,   $9000
    move.l  $FFFFF,   $9000
    move.l  $3000,   $9000

    move.l  $9000,   $9000
    move.l  $9999,   $9000
    move.l  $9999,   $9000

    move.l  #$00,   $9000
    move.l  #$1E,   $9000
    move.l  #$FF,   $9000
    

    movea.w  D0,   a1
    movea.w  D4,    a1
    movea.w  D7,   a1
    movea.w  D7,   a1

    movea.w  a0,   a7
    movea.w  A3,   a0
    movea.w  A7,   a1
    
    movea.w  (a0),   a1
    movea.w  (A3),   a1
    movea.w  (A7),   a1

    
    movea.w  -(a0),   a1
    movea.w  -(A3),   a1
    movea.w  -(A7),   a1

    
    movea.w  (a0)+,   a1
    movea.w  (A3)+,   a1

    movea.w  $3000,   a1
    movea.w  $FFFFF,   a1
    movea.w  $3000,   a1

    movea.w  $9000,   a1
    movea.w  $9999,   a1
    movea.w  $9999,   a1

    movea.w  #$00,   a1
    movea.w  #$1E,   a1
    movea.w  #$FF,   a1


    move.w  D0,   D0
    move.w  D4,   D4
    move.w  D7,   D7
    move.w  D7,   D1
    
      move.w  a0,   D0
    move.w  A3,   D5
    move.w  A7,   D1
    
    move.w  (a0),   D0
    move.w  (A3),   D5
    move.w  (A7),   D1
    
    move.w  -(a0),   D0
    move.w  -(A3),   D5
    move.w  -(A7),   D1
    
    move.w  (a0)+,   D0
    move.w  (A3)+,   D5
    move.w  (A7)+,   D1   

    move.w  $3000,   D0
    move.w  $FFFFF,   D5
    move.w  $3000,   D1

    move.w  $9000,   D0
    move.w  $9999,   D5
    move.w  $9999,   D1 

    move.w  #$00,   D0
    move.w  #$1E,   D4
    move.w  #$FF,   D7
    
    move.w  #$01,   D0
    move.w  #$01,   D4
    move.w  #$01,   D7

******************************************************


    move.w  D0,   (A0)
    move.w  D4,    (A2)
    move.w  D7,   (A7)
    move.w  D7,   (A2)
    
    move.w  a0,   (A0)
    move.w  A3,   (A2)
    move.w  A7,   (A7)
        
    
    move.w  (a0),   (A0)
    move.w  (A3),   (A2)
    move.w  (A7),   (A7)
    
    move.w  -(a0),   (A2)
    move.w  -(A3),   (A7)
    move.w  -(A7),   (A0)
    
    move.w  (a0)+,   (A2)
    move.w  (A3)+,   (A0) 

    move.w  $3000,   (A2)
    move.w  $FFFFF,   (A1)
    move.w  $3000,   (A5)

    move.w  $9000,   (A1)
    move.w  $9999,   (A5)
    move.w  $9999,   (A3)

    move.w  #$00,   (A0)
    move.w  #$1E,   (A0)
    move.w  #$FF,   (A0)




************************************* 



    move.w  D0,   (A0)+
    move.w  D4,    (A2)+
    move.w  D7,   (A7)+
    move.w  D7,   (A2)+
   
     move.w  a0,   (A0)+
    move.w  A3,   (A2)+
    move.w  A7,   (A7)+
 
    move.w  (a0),   (A0)+
    move.w  (A3),   (A2)+
    move.w  (A7),   (A7)+
    
    move.w  -(a0),   (A2)+
    move.w  -(A3),   (A7)+
    move.w  -(A7),   (A0)+
    
    move.w  (a0)+,   (A2)+
    move.w  (A3)+,   (A0)+

    move.w  $3000,   (A2)+
    move.w  $FFFFF,   (A1)+
    move.w  $3000,   (A5)+

    move.w  $9000,   (A1)+
    move.w  $9999,   (A5)+
    move.w  $9999,   (A3)+

    move.w  #$00,   (A0)+
    move.w  #$1E,   (A0)+
    move.w  #$FF,   (A0)+

****************************************************

    move.w  D0,   -(A0)
    move.w  D4,    -(A2)
    move.w  D7,   -(A7)
    move.w  D7,   -(A2)

    move.w  a0,   -(A0)
    move.w  A3,   -(A2)
    move.w  A7,   -(A7)
    
    move.w  (a0),   -(A0)
    move.w  (A3),   -(A2)
    move.w  (A7),   -(A7)
    
    move.w  -(a0),   -(A2)
    move.w  -(A3),   -(A7)
    move.w  -(A7),   -(A0)
    
    move.w  (a0)+,   -(A2)
    move.w  (A3)+,   -(A0)

    move.w  $3000,   -(A2)
    move.w  $FFFFF,   -(A1)
    move.w  $3000,   -(A5)

    move.w  $9000,   -(A1)
    move.w  $9999,   -(A5)
    move.w  $9999,   -(A3)

    move.w  #$00,   -(A0)
    move.w  #$1E,   -(A0)
    move.w  #$FF,   -(A0)
    
    ****************************************************************
    

    move.w  D0,   $3000
    move.w  D4,    $0002
    move.w  D7,   $3245
    move.w  D7,   $34

    move.w  a0,   $0021
    move.w  A3,   $3421
    move.w  A7,   $0021

    
    move.w  (a0),   $0021
    move.w  (A3),   $3421
    move.w  (A7),   $0021

    
    move.w  -(a0),   $0021
    move.w  -(A3),   $0021
    move.w  -(A7),   $0021

    
    move.w  (a0)+,   $0021
    move.w  (A3)+,   $0021

    move.w  $3000,   $0021
    move.w  $FFFFF,   $0021
    move.w  $3000,   $0021

    move.w  $9000,   $0021
    move.w  $9999,   $0021
    move.w  $9999,   $0021

    move.w  #$00,   $0021
    move.w  #$1E,   $0021
    move.w  #$FF,   $0021
    
    *********************************************************************************
    
    
    move.w  D0,   $9000
    move.w  D4,    $9000
    move.w  D7,   $9000
    move.w  D7,   $9000

    move.w  a0,   $9000
    move.w  A3,   $9000
    move.w  A7,   $9000
    
    move.w  (a0),   $9000
    move.w  (A3),   $9000
    move.w  (A7),   $9000

    
    move.w  -(a0),   $9000
    move.w  -(A3),   $9000
    move.w  -(A7),   $9000

    
    move.w  (a0)+,   $9000
    move.w  (A3)+,   $9000

    move.w  $3000,   $9000
    move.w  $FFFFF,   $9000
    move.w  $3000,   $9000

    move.w  $9000,   $9000
    move.w  $9999,   $9000
    move.w  $9999,   $9000

    move.w  #$00,   $9000
    move.w  #$1E,   $9000
    move.w  #$FF,   $9000
    

    move.b  D0,   D0
    move.b  D4,   D4
    move.b  D7,   D7
    move.b  D7,   D1
    
    move.b  (a0),   D0
    move.b  (A3),   D5
    move.b  (A7),   D1
    
    move.b  -(a0),   D0
    move.b  -(A3),   D5
    move.b  -(A7),   D1
    
    move.b  (a0)+,   D0
    move.b  (A3)+,   D5
    move.b  (A7)+,   D1   

    move.b  $3000,   D0
    move.b  $FFFFF,   D5
    move.b  $3000,   D1

    move.b  $9000,   D0
    move.b  $9999,   D5
    move.b  $9999,   D1 

    move.b  #$00,   D0
    move.b  #$1E,   D4
    move.b  #$FF,   D7
    
    move.b  #$01,   D0
    move.b  #$01,   D4
    move.b  #$01,   D7

******************************************************


    move.b  D0,   (A0)
    move.b  D4,    (A2)
    move.b  D7,   (A7)
    move.b  D7,   (A2)
    
    move.b  (a0),   (A0)
    move.b  (A3),   (A2)
    move.b  (A7),   (A7)
    
    move.b  -(a0),   (A2)
    move.b  -(A3),   (A7)
    move.b  -(A7),   (A0)
    
    move.b  (a0)+,   (A2)
    move.b  (A3)+,   (A0) 

    move.b  $3000,   (A2)
    move.b  $FFFFF,   (A1)
    move.b  $3000,   (A5)

    move.b  $9000,   (A1)
    move.b  $9999,   (A5)
    move.b  $9999,   (A3)

    move.b  #$00,   (A0)
    move.b  #$1E,   (A0)
    move.b  #$FF,   (A0)




************************************* 



    move.b  D0,   (A0)+
    move.b  D4,    (A2)+
    move.b  D7,   (A7)+
    move.b  D7,   (A2)+
    
    move.b  (a0),   (A0)+
    move.b  (A3),   (A2)+
    move.b  (A7),   (A7)+
    
    move.b  -(a0),   (A2)+
    move.b  -(A3),   (A7)+
    move.b  -(A7),   (A0)+
    
    move.b  (a0)+,   (A2)+
    move.b  (A3)+,   (A0)+

    move.b  $3000,   (A2)+
    move.b  $FFFFF,   (A1)+
    move.b  $3000,   (A5)+

    move.b  $9000,   (A1)+
    move.b  $9999,   (A5)+
    move.b  $9999,   (A3)+

    move.b  #$00,   (A0)+
    move.b  #$1E,   (A0)+
    move.b  #$FF,   (A0)+

****************************************************

    move.b  D0,   -(A0)
    move.b  D4,    -(A2)
    move.b  D7,   -(A7)
    move.b  D7,   -(A2)
    
    move.b  (a0),   -(A0)
    move.b  (A3),   -(A2)
    move.b  (A7),   -(A7)
    
    move.b  -(a0),   -(A2)
    move.b  -(A3),   -(A7)
    move.b  -(A7),   -(A0)
    
    move.b  (a0)+,   -(A2)
    move.b  (A3)+,   -(A0)

    move.b  $3000,   -(A2)
    move.b  $FFFFF,   -(A1)
    move.b  $3000,   -(A5)

    move.b  $9000,   -(A1)
    move.b  $9999,   -(A5)
    move.b  $9999,   -(A3)

    move.b  #$00,   -(A0)
    move.b  #$1E,   -(A0)
    move.b  #$FF,   -(A0)
    
    ****************************************************************
    

    move.b  D0,   $3000
    move.b  D4,    $0002
    move.b  D7,   $3245
    move.b  D7,   $34
    
    move.b  (a0),   $0021
    move.b  (A3),   $3421
    move.b  (A7),   $0021

    
    move.b  -(a0),   $0021
    move.b  -(A3),   $0021
    move.b  -(A7),   $0021

    
    move.b  (a0)+,   $0021
    move.b  (A3)+,   $0021

    move.b  $3000,   $0021
    move.b  $FFFFF,   $0021
    move.b  $3000,   $0021

    move.b  $9000,   $0021
    move.b  $9999,   $0021
    move.b  $9999,   $0021

    move.b  #$00,   $0021
    move.b  #$1E,   $0021
    move.b  #$FF,   $0021
    
    *********************************************************************************
    
    
    move.b  D0,   $9000
    move.b  D4,    $9000
    move.b  D7,   $9000
    move.b  D7,   $9000
    
    move.b  (a0),   $9000
    move.b  (A3),   $9000
    move.b  (A7),   $9000

    
    move.b  -(a0),   $9000
    move.b  -(A3),   $9000
    move.b  -(A7),   $9000

    
    move.b  (a0)+,   $9000
    move.b  (A3)+,   $9000

    move.b  $3000,   $9000
    move.b  $FFFFF,   $9000
    move.b  $3000,   $9000

    move.b  $9000,   $9000
    move.b  $9999,   $9000
    move.b  $9999,   $9000

    move.b  #$00,   $9000
    move.b  #$1E,   $9000
    move.b  #$FF,   $9000
    



* Put variables and constants here

    END    START        ; last line of source
