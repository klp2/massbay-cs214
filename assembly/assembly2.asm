; assembly2.asm A) binary to ascii
;
; translate integer value to ASCII-code binary version
; so that the binary version can be printed to the console
;
; NUMBER must come directly after the terminator for STRING
;
; I'm pretty sure this could be done more efficiently

            .ORIG       x3000
            LD          R1, NUMBER          ; R1 will hold our number
            LD          R2, MASK_START      ; R2 will hold our mask
            LEA         R3, NUMBER          ; R3 tracks next address to hold character
            ADD         R3, R3, #-2         ; start at end of string

LOOP        LD          R4, ASCII_OFFSE
            AND         R6, R1, R2
            BRz         STORE
            ADD         R4, R4, #1 
STORE       STR         R4, R3, x0
            ADD         R3, R3 #-1
            ADD         R2, R2, R2
            BRz         DONE
            BRnp        LOOP

DONE        LEA         R0, STRING
            TRAP        x22
            HALT

MASK_START  .FILL       x1
BITS        .FILL       #16
ASCII_OFFSE .FILL       x30
STRING      .BLKW       #16
            .FILL       #0
NUMBER      .FILL       #9867
            .END
