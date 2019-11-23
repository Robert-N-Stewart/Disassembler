#!/usr/bin/env python
# written by robert stewart
# Log files by: 
# 	1. Options-->Log Output, make "Output Log Type" "Text Only", and "Execution Log Type" "Instruction Only" and give the file name TestingLog.txt
# 	2. Before run simulation, "Run"-->"Log Start"
# log file cannot contain illegal output (DATA YYYY), so dont put any insturction that will produce that in code file
# run script with "python compareLogWithCode.py" in same directory as log and code files

from itertools import izip
import string
import re


f = open("TestingLog.txt","r+")
d = f.readlines()
f.seek(0)
containsIllegal = False
for line in d:
     if line.startswith('$'):
     	if "DATA" in line: 
    		containsIllegal = True	
        f.write(line)
f.truncate()
f.close()

f = open("TestingCode.txt","r+")
d = f.readlines()
f.seek(0)
for line in d:
	line = re.sub('\*.*', '', line)
	if not re.match(r'\s', line):
		if len(line.split(' ', 1)) > 1:
			line = line.split(' ', 1)[1]
		else:
			continue
	if line.strip():
		if not re.match(r'\s', line):
			line = " " + line
		f.write(line)
f.truncate()
f.close()

if containsIllegal:
	print "Log contains invalid output, cannot compare"
	exit()

f1 = open("TestingLog.txt","r+")
Log = f1.readlines()
f2 = open("TestingCode.txt","r+")
Code = f2.readlines()

print "Comparing..."
print
for idx, (logLine, codeLine) in enumerate(izip(Log, Code)):

	idx += 1

 	logLineCompare = logLine.split(' ', 1)[1]	
	logLineCompare = logLineCompare.translate(string.maketrans("",""), string.whitespace)
	logLineCompare = re.sub('\$0*', '$', logLineCompare)
	logLineCompare = re.sub('#0*', '#', logLineCompare)
	logLineCompare = re.sub('%0*', '%', logLineCompare)
	logLineCompare = logLineCompare.upper()
	
	codeLineCompare = codeLine.translate(string.maketrans("",""), string.whitespace)	
	codeLineCompare = re.sub('\$0*', '$', codeLineCompare)
	codeLineCompare = re.sub('#0*', '#', codeLineCompare)
	codeLineCompare = re.sub('%0*', '%', codeLineCompare)
	codeLineCompare = codeLineCompare.upper()

	if "." in logLineCompare and "." not in codeLineCompare:
		toRem = logLineCompare.find(".")
		logLineCompare = logLineCompare[:toRem] + logLineCompare[toRem+2:]
	codeLine = codeLine.lstrip()
	
	if logLineCompare != codeLineCompare:
		print "Possible wrong output at line", idx
		print logLine[:-1]
		print "\t  " + codeLine
		print

print "Done comparing"
print
log_num_lines = sum(1 for line in open('TestingLog.txt'))
code_num_lines = sum(1 for line in open('TestingCode.txt'))

if code_num_lines == log_num_lines:
	print "all lines compared in both files"
	exit()

if code_num_lines > log_num_lines:
	print	abs(log_num_lines - code_num_lines), "lines not compared in code"
	exit()
print	abs(log_num_lines - code_num_lines), "lines not compared in log"
