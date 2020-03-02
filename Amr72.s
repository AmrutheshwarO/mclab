			AREA PROG72, CODE, READONLY
RADIX							RN 0
LOWERNIBBLEMASK	RN 10
UPPERNIBBLEMASK	RN 11
LOWERNIBBLE			RN 3
UPPERNIBBLE				RN 4
RESULT						RN 5
NUMBYTES					RN 6
BYTE							RN 2
ENTRY
				MOV RADIX, #10
				MOV LOWERNIBBLEMASK, #0x0F
				MOV UPPERNIBBLEMASK, #0xF0
				MOV RESULT, #0
				MOV NUMBYTES, #4
				LDR R1, =NUMBER
				ADD R1, R1, NUMBYTES
				SUB R1, R1, #1
LOOP		LDRB BYTE, [R1]
				SUB R1, R1, #1
				AND LOWERNIBBLE, BYTE, LOWERNIBBLEMASK
				AND UPPERNIBBLE, BYTE, UPPERNIBBLEMASK
				LSR UPPERNIBBLE, #4
				MLA RESULT, RADIX, RESULT, UPPERNIBBLE
				MLA RESULT, RADIX, RESULT, LOWERNIBBLE
				SUBS NUMBYTES, NUMBYTES, #1
				BNE LOOP
STOP		B STOP
NUMBER	DCD 0x00000127
				END