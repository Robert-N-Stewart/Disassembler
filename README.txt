#Disassembler
File Descriptions:

B17.x68: Main file. Run this file in EASY68k, all other files are included in assembly. Disassembles instructions.

Test_Code.s68: Testing code data to be loaded in memory for disassembly

Get_User.x68_Input: Gets user input and validates for starting and ending addresses.

Process_Opcode.x68: Starts decoding instruction, starting with op-code. Outputs address of op-code then moves into subroutine for disassembly based on bits 15-12

GROUPXXXX.x68:    Subroutines to disassemble op-code grouping based on first 4 bits XXXX

x68 utilities files: Contains general subroutines used throughput program

compareLogToCode.py: script for automating testing, that compares log file to test code