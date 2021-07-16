.ORIG x3000
	AND R0, R0, #0
	ADD R0, R0, #1
	LEA R1, ARRAY
	LDW R1, R1, #0
	LEA R2, SIZE
	AND R4, R4, #0
	LDW R2, R2, #0
LOOP 	BRz DONE
	LDB R3, R1, #0
	ADD R4, R4, R3
	ADD R1, R1, #1
	ADD R2, R2, #-1
	BR LOOP
DONE	STW R4, R1, #0

; 	EXCEPTION : PROT
	JMP R4

; 	EXCEPTION : UNALIGNED
;	ADD R1, R1, #3
;	STW R4, R1, #0

; 	EXCEPTION : UNKNOWN OPCODE
;	.FILL xA123
;	.FILL xB000

;	EXCEPTION : PAGE FAULT
;	LEA R1, PF
;	LDW R1, R1, #0
;	STW R4, R1, #0


	HALT
ARRAY 	.FILL xC000
SIZE 	.FILL #20
PF	.FILL x4000
.END