    .ORIG      x3000
           LEA        R1, TESTOUT
BACK_1     LDR        RO, R1, xO
           BRz        NEXT_1
           TRAP       x21

           ADD        R1, #1 ;____________________(a)
           BRnzp      BACK_1

NEXT_1     LEA        R1, TESTOUT
BACK_2     LDR        RO, R1, xO
           BRz        NEXT_2
           JSR        SUB_1
           ADD        R1, R1, x1
           BRnzp      BACK_2

NEXT_2     ADD        R0, #5 ;____________________(b)

SUB_1      ____________________(c)

K          LDI        R2, DSR

           ____________________(d)

           STI        RO, DDR
           RET
DSR        .FILL      xFEO4
DDR        .FILL      XFEO6
TESTOUT    .STRINGZ   "ABC"
           .END
