        TITL	"1802/1805A Cross-Assembler dice"
        EJCT	60

; Register Definitions:
;
R0		EQU	0
R1		EQU	1
R2		EQU	2
R3		EQU	3
R4		EQU	4
R5		EQU	5
R6		EQU	6
R7		EQU	7
R8		EQU	8
R9		EQU	9
RA		EQU	10
RB		EQU	11
RC		EQU	12
RD		EQU	13
RE		EQU	14
RF		EQU	15

	cpu 1802

	org 0

	ldi 0		;F8 00
	phi 2		;B2 
	ldi 00ffh	;F8 FF 
	plo 2		;A2 
	sex 2		;E2
.07	ldi 0		;F8 00 
	plo 000ah	;AA
.0a	b4 .0a		;37 0A
.0c	b4 .1a		;37 1A
	inc 000ah	;1A 
	glo 000ah	;8A
	smi 6		;FF 06
	bz .17		;32 17
	sex 2		;E2
	br .0c		;30 0C
.17 	plo 000ah	;AA
	br .0c		;30 0C
.1a	glo 000ah	;8A 
	adi 1		;FC 01
	str 2		;52
	out 4		;64 
	dec 2		;22
	br .07		;30 07

	end
