			AREA PROG62, CODE, READONLY
ENTRY
				MOV R1, #1
				LDR R2, =TABLE
				LDR R3, =NUMFIBONACCI
				LDRB R6, [R3]
				STRB R1, [R2], #1
				MOV R3, #0
				MOV R4, #0
				MOV R5, #1
				SUB R6, R6, #1
BACKK		ADD R4, R3, R1
				STRB R4, [R2], #1
				MOV R3, R1
				MOV R1, R4
				ADD R5, R5, #1
				CMP R5, R6
				BLS BACKK
GO			B GO
NUMFIBONACCI DCB 0x0A
			AREA NUMBER, DATA, READWRITE
TABLE		SPACE 60
				END