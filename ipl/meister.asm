		TITL	"1802/1805A MEISTERMIND"
		EJCT	60

;     MEISTERMIND number guessing game for the COSMAC ELF
;                 written in 1977 by Klaus Ernst
;
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

;     REGISTERS
;     R0   program counter    
;     R1   memory pointer
;     R2   number of random digits (5)    
;     R3   paritytest turn counter
;     R4   store for number of digits played    
;     R5   random # generator counter
;     R6   random # store 2    
;     R7   random # store 1    
;     R8   right # , right place counter    
;     R9   right # , wrong place counter    
;     RA   number of digits selected by player    
;     RB   store for guessed digit    
;     RC    
;     RD   number of digits entered    
;     RE    
;     RF    

;     LABELS
;     STUP  00   setup    
;     NDIG  0F   next digit    
;     CONT  18   countdown    
;     RND   12   random # generator
;     PAR1  2E   parity test 1    
;     PAR2  3C   parity test 2    
;     PAR3  4C   parity test 3    
;     SAME  62   2 digits same    
;     GAME  65   ready for game    
;     NTRY  77   next try    
;     GNDG  79   guess next digit    
;     ADV   85   advance right/right counter    
;     RWR   8C   right/wrong test    
;     RPT   92   repeat right/wrong test
;     INCR  99   increment right/wrong counter    
;     DSPL  A0   display    

;    note1 : | is used for 'not equal' (e.g. if D|0 branch to 79)
;    note2 : this listing using mnemonics and labels was NOT written
;           with an assembler ( I followed the program listing conventions 
;           I found in the book "PROGRAMMER'S GUIDE TO THE 1802 ( with an
;           assembler for your machine ) by Tom Swan, HAYDEN 1981" )

	cpu 1802
	org 0

STUP	NOP
	LDI $05      ; load 05 into D
	PLO   R2 ; put D in R2.0
	LDI $E0      ; load E0 into D
	PLO   R7 ; put D in R7.0
	LDI $E8      ; load E8 into D
	PLO   R6 ; put D in R6.0
	LDI $A0      ; load A0 into D
	PLO   R8 ; put D in R8.0
	LDI $B0      ; load B0 intoD
	PLO   R9 ; put D in R9.0
NDIG 	LDI $0A     ; load 0A into D
	PLO   R5 ; put D in R5.0
RND	GLO   R5 ; get R5.0
	BNZ CONT   ; if D|0 branch to 18
	LDI $0A      ; load 0A into D
	PLO   R5 ; put D in R5.0
CONT 	DEC   R5 ; decrement R5
	BN4 RND     ; if EF4=0 (INPUT button up)branch to 12
.1B     B4 .1B      ; if EF4=1 (INPUT button down) branch to 1B
	REQ      ; reset Q (LED off)
	GLO   R5 ; get R5.0
	STR   R7 ; store value of D at location addressed by R7
	INC   R7 ; increment R7
	STR   R6 ; store value of D at location addressed by R6
	INC   R6 ; increment R6
	DEC   R2 ; decrement R2
	GLO   R2 ; get R2.0
	BNZ NDIG      ; if D|0 branch to 0F
	LDI $E0   ; load E0 into D
	PLO   R7 ; put D to R7.0
	SEX   R7 ; set X=7
	LDI $04      ; load 04 into D
	PLO   R3 ; put in R3.0
PAR1 	LDA   R7   ; get byte from location addressed by R7
	SD       ; subtract D
	BZ SAME       ; if D=0 branch to 62
	DEC   R3 ; decrement R3
	GLO   R3 ; get R3.0
	BNZ PAR1      ; if D|0 branch to 2E
	LDI $E0     ;load E0 into D
	PLO   R7 ; put in R7.0
	LDI $03     ; load 03 into D
	PLO   R3 ; put in R3.0
PAR2 	LDA   R7   ; get byte from location addressed by R7
	INC   R7 ; increment R7
	SD       ; subtract D
	BZ SAME       ; if D=0 branch to 62
	DEC   R7 ; decrement R7
	DEC   R3 ; decrement R3
	GLO   R3 ; get R3.0
	BNZ PAR2      ; if D|0 branch to 3C  
	LDI $E0     ; load E0 into D
	PLO   R7 ; put in R7.0
	LDI $02      ; load 02 into D
	PLO   R3 ; put in R3.0
PAR3 	LDA   R7   ; get byte from location addressed by R7
	INC   R7 ; increment R7
	INC   R7 ; increment R7
	SD       ; subtract D
	BZ SAME       ; ifD=0 branch to 62
	DEC   R7 ; decrement R7
	DEC   R7 ; decrement R7
	DEC   R3 ; decrement R3
	GLO   R3 ; get R3.0
	BNZ PAR3      ; if D|0 branch to 4C
	LDI $E0     ; load E0 into D
	PLO   R7 ; put in R7.0
	LDA   R7   ; get byte from location addressed by R7
	INC   R7 ; increment R7
	INC   R7 ; increment R7
	INC   R7 ; increment R7
	SD       ; subtract D
	BNZ GAME    ; if D|0 branch to 65
SAME 	SEQ      ; set Q (LED on)
	BR STUP     ; branch to 00
GAME 	LDI $F0      ; load F0 into D
	PLO   R1 ; put in R1.0
	LDI $EE      ; load EE into D
	STR   R1 ; store value of D at location addressed by R1
	SEX   R1 ; set X=1
	OUT 4     ; put memory byte addressed by register designated by X
	LDI $E0      ; load E0 into D              on bus (display shows EE)
	PLO   R7 ; put in R7.0
.70	BN4 .70      ; if EF4=0 (INPUT button up) branch to 70
.72	B4 .72       ; if EF4=1 (INPUT button down) branch to 72
	INP 4     ; store byte on bus in D and in mem. loc. addressed by
	PLO   R4 ; put D in R4.0               register designated by X
	OUT 4     ; put mem. byte addressed by register designated by X on 
NTRY	GLO   R4 ; get R4.0                                           bus
	PLO   RA ; put in RA.0
GNDG	SEX   R1 ; set X=1
.7A	BN4 .7A     ; if EF4=0 (INPUT button up) branch to 7A
.7C	B4 .7C      ; if EF4=1 (INPUT button down) branch to 7C
	INP 4     ; store byte on bus in D and in mem. loc. addressed by
	PLO   RB ; put D in RB.0            register designated by X
	SEX   R7 ; set X=7
	SD       ; subtract D
	BNZ RWR    ; if D|0 branch to 8C
	INC   R8 ; increment R8
ADV  	INC   R7 ; increment R7
	DEC   RA ; decrement RA
	GLO   RA ; get RA.0
	BNZ GNDG      ; if D|0 branch to 79
	BR DSPL       ; branch to A0
RWR  	LDI $E8     ; load E8 into D
	PLO   R6 ; put in R6.0
	SEX   R6 ; set X=6
	GLO   R4 ; get R4.0
	PLO   RD ; put in RD.0
RPT  	GLO   RB ; get RB.0
	SD       ; subtract D
	BNZ INCR      ; if D|0 branch to 99
	INC   R9 ; increment R9
	BR ADV       ; branch to 85
INCR 	INC   R6 ; increment R6
	DEC   RD ; decrement RD
	GLO   RD ; get RD.0
	BNZ RPT      ; if D|0 branch to 92
	BR ADV      ; branch to 85
DSPL 	SEX   R1 ; set X=1
	LDI $F0      ; load F0 into D
	PLO   R1 ; put in R1.0
	GLO   R8 ; get R8.0
	STR   R1 ; store value of D at location addressed by R1
	OUT 4     ; put mem. byte addressed by register designated by X on 
	LDI $A0      ; load A0 into D                                   bus
	PLO   R8 ; put in R8.0
	GLO   R9 ; get R9.0
	STR   R1 ; store value of D at location addressed by R1
.AC	BN4 .AC     ; if EF4=0 (INPUT button up) branch to AC
.AE	B4 .AE      ; if EF4=1 (INPUT button down) branch to AE
	OUT 4     ; put mem. byte addressed by register designated by X on 
	LDI $B0      ; load B0 into D                                  bus 
	PLO   R9 ; put in R9.0
	NOP      ; no operation
	LDI $F0      ; load F0 into D
	PLO   R1 ; put in R1.0
	SEX   R1 ; set X=1
	LDI $E0      ; load E0 into D
	PLO   R7 ; put in R7.0
	BR NTRY       ; branch to 77

	end

