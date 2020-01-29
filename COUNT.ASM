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

	sex RF	
.01	glo 0
	phi RF
	plo RF
	ghi RE
	str RE
	inc RE
	out 4
	br .01

	end
