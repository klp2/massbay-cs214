; sums the first n integers sum = 1 + 2 + 3 + ... + n = 1/2(n)(n+1)

;LABELS		OPCODE		OPERANDS
			.ORIG		x4000
			LD			R1, N
			AND			R2, R2, #0	; R2 as accumulation spot

LOOP		ADD			R2, R2, R1
			ADD			R1, R1, #-1
			BRp			LOOP


			ST			R2, SUM
			HALT
N			.FILL		xA		; 1/2 * 10 * 11 = 55
SUM			.BLKW		x1		; reserve one memory slot
			.END



