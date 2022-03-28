; assembly2.asm A) binary to ascii

; print the binary version of a four numeral decimal number
; the number should be stored with a label of NUMBER
;
;

; read value from console, store as NUMBER

;LABELS		OPCODE		OPERANDS
			.ORIG		x3000

			LD			R1, N
			AND			R2, R2, #0	; R2 as accumulation spot

LOOP		ADD			R2, R2, R1
			ADD			R1, R1, #-1
			BRp			LOOP


			ST			R2, SUM
			HALT
NUMBER		.BLKW		16		; reserve 16 memory slot
			.FILL		#0 ;      initialize memory for NUMBER
			.END


;LABEL     ;OPCODE     ;OPERANDS
           .ORIG       x3000
           LD          R1, NUMBER1
           LD          R2, NUMBER2
           JSR         ADDTWO
           ST          R0, SUM
           HALT

NUMBER1    .FILL       x2
NUMBER2    .FILL       x3
SUM        .BLKW       x1


ADDTWO     ADD         R0, R1, R2
           ST          R7, RVALUE
           JSR         ADDFIVE
           LD          R7, RVALUE
           RET
RVALUE     .BLKW       x1

ADDFIVE    ADD         R0, R0, #5
           RET

           .END
