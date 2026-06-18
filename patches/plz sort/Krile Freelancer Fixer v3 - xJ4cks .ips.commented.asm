;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; Krile Freelancer Fixer v3 - xJ4cks .ips.commented.asm
;    Disassembled from IPS patch: Krile Freelancer Fixer v3 - xJ4cks .ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 53 record(s)

;--- Patch at file offset $00FFDC (SNES $C0FFDC) ---
org $C0FFDC

    LDY $4368,X             ; [BC 68 43   ] Load Y from Absolute,X
    db $97                      ; Incomplete/data bytes

;--- Patch at file offset $148E08 (SNES $D48E08) ---
org $D48E08

    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TSB $27                 ; [04 27      ] Test and Set Bits in DP
    CLC                     ; [18         ] Clear Carry Flag
    AND $5A12               ; [2D 12 5A   ] AND A with Absolute
    db $21                      ; Incomplete/data bytes

;--- Patch at file offset $148E19 (SNES $D48E19) ---
org $D48E19

    ORA $07                 ; [05 07      ] OR A with Direct Page
    CLC                     ; [18         ] Clear Carry Flag
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $8E4F               ; [10 2F      ] Branch if Plus

;--- Patch at file offset $148E26 (SNES $D48E26) ---
org $D48E26

    CPX #$40                ; [E0 40      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $148E37 (SNES $D48E37) ---
org $D48E37

    CPY #$00                ; [C0 00      ] Compare Y Immediate
    JSR $5880               ; [20 80 58   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $10                 ; [06 10      ] Shift Left DP
    BRK                     ; [00 38      ] Software interrupt
    BRK                     ; [00 5F      ] Software interrupt
    ASL $00,X               ; [16 00      ] Shift Left DP,X
    AND $081300,X           ; [3F 00 13 08] AND A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($26,X)             ; [01 26      ] OR A with (DP,X)
    BPL $8E5F               ; [10 FE      ] Branch if Plus
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    JSR ($C460,X)           ; [FC 60 C4   ] Jump to Subroutine Indirect,X
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $8E7D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $8ED5               ; [90 5C      ] Branch if Carry Clear
    BRA $8E87               ; [80 0C      ] Branch Always
    BCC $8EE5               ; [90 68      ] Branch if Carry Clear
    TSB $60                 ; [04 60      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    LSR                     ; [4A         ] Shift Right Accumulator
    PHP                     ; [08         ] Push Processor Status
    DEC                     ; [3A         ] Decrement Accumulator
    TSB $0B                 ; [04 0B      ] Test and Set Bits in DP
    ORA [$09]               ; [07 09      ] OR A with [DP]
    ORA [$06]               ; [07 06      ] OR A with [DP]
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 2D      ] Software interrupt
    TRB $05                 ; [14 05      ] Test and Reset Bits DP
    BRK                     ; [00 06      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $148EA5 (SNES $D48EA5) ---
org $D48EA5

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $148EB1 (SNES $D48EB1) ---
org $D48EB1

    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 E0      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $148EBD (SNES $D48EBD) ---
org $D48EBD

    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $148EC8 (SNES $D48EC8) ---
org $D48EC8

    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TSB $27                 ; [04 27      ] Test and Set Bits in DP
    CLC                     ; [18         ] Clear Carry Flag
    AND $5A12               ; [2D 12 5A   ] AND A with Absolute
    db $21                      ; Incomplete/data bytes

;--- Patch at file offset $148ED9 (SNES $D48ED9) ---
org $D48ED9

    ORA $07                 ; [05 07      ] OR A with Direct Page
    CLC                     ; [18         ] Clear Carry Flag
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $8F0F               ; [10 2F      ] Branch if Plus

;--- Patch at file offset $148EE6 (SNES $D48EE6) ---
org $D48EE6

    CPX #$40                ; [E0 40      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $148EF7 (SNES $D48EF7) ---
org $D48EF7

    CPY #$00                ; [C0 00      ] Compare Y Immediate
    JSR $5880               ; [20 80 58   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    AND ($00)               ; [32 00      ] AND A with (DP)
    TRB $1402               ; [1C 02 14   ] Test and Reset Bits Absolute
    ASL $1C                 ; [06 1C      ] Shift Left DP
    ASL $28                 ; [06 28      ] Shift Left DP
    BRK                     ; [00 69      ] Software interrupt
    JSR $145E               ; [20 5E 14   ] Jump to Subroutine
    BRK                     ; [00 3F      ] Software interrupt
    TSB $19                 ; [04 19      ] Test and Set Bits in DP
    BRK                     ; [00 01      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA ($16,X)             ; [01 16      ] OR A with (DP,X)
    ORA ($16,X)             ; [01 16      ] OR A with (DP,X)
    JSR $3005               ; [20 05 30   ] Jump to Subroutine
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    SEI                     ; [78         ] Set Interrupt Disable
    RTS                     ; [60         ] Return from Subroutine
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $8F3D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $8F85               ; [90 4C      ] Branch if Carry Clear
    BCC $8F3F               ; [90 04      ] Branch if Carry Clear
    DEY                     ; [88         ] Decrement Y
    RTS                     ; [60         ] Return from Subroutine
    PHP                     ; [08         ] Push Processor Status
    CPX #$00                ; [E0 00      ] Compare X Immediate
    ROL                     ; [2A         ] Rotate Left Accumulator
    PHP                     ; [08         ] Push Processor Status
    ORA $070B05,X           ; [1F 05 0B 07] OR A with Absolute Long,X

;--- Patch at file offset $148F50 (SNES $D48F50) ---
org $D48F50

    db $0D, $14                 ; Incomplete/data bytes

;--- Patch at file offset $148F5D (SNES $D48F5D) ---
org $D48F5D

    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $148F65 (SNES $D48F65) ---
org $D48F65

    db $E0                      ; Incomplete/data bytes

;--- Patch at file offset $148F74 (SNES $D48F74) ---
org $D48F74

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $148F80 (SNES $D48F80) ---
org $D48F80

    TXS                     ; [9A         ] Transfer X to Stack Pointer
    PHP                     ; [08         ] Push Processor Status
    PLY                     ; [7A         ] Pull Y Register
    TSB $0B                 ; [04 0B      ] Test and Set Bits in DP
    ORA [$11]               ; [07 11      ] OR A with [DP]
    ORA $750022             ; [0F 22 00 75] OR A with Absolute Long
    BPL $8FC5               ; [10 38      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 4D      ] Software interrupt
    BIT $05                 ; [24 05      ] Test Bits DP
    BRK                     ; [00 06      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    ORA $3028               ; [0D 28 30   ] OR A with Absolute
    BRK                     ; [00 08      ] Software interrupt

;--- Patch at file offset $148FA5 (SNES $D48FA5) ---
org $D48FA5

    CPY #$F0                ; [C0 F0      ] Compare Y Immediate
    CPX #$20                ; [E0 20      ] Compare X Immediate
    BRK                     ; [00 30      ] Software interrupt
    JSR $20F0               ; [20 F0 20   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 80      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRA $9014               ; [80 60      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRK                     ; [00 C0      ] Software interrupt
    CPY #$20                ; [C0 20      ] Compare Y Immediate

;--- Patch at file offset $148FCE (SNES $D48FCE) ---
org $D48FCE

    db $0F                      ; Incomplete/data bytes

;--- Patch at file offset $148FEF (SNES $D48FEF) ---
org $D48FEF

    db $90                      ; Incomplete/data bytes

;--- Patch at file offset $148FFF (SNES $D48FFF) ---
org $D48FFF

    BCC $9038               ; [90 37      ] Branch if Carry Clear
    PHP                     ; [08         ] Push Processor Status
    EOR $245B30             ; [4F 30 5B 24] XOR A with Absolute Long
    LDY $43,X               ; [B4 43      ] Load Y from DP,X
    LDA $40,S               ; [A3 40      ] Load A from Stack Relative
    ADC $2D00,Y             ; [79 00 2D   ] Add with Carry Absolute,Y
    BRK                     ; [00 29      ] Software interrupt
    TSB $0A04               ; [0C 04 0A   ] Test and Set Bits Absolute
    ORA $2C1330             ; [0F 30 13 2C] OR A with Absolute Long
    JSR $015F               ; [20 5F 01   ] Jump to Subroutine
    ROR $2700,X             ; [7E 00 27   ] Rotate Right Absolute,X
    BPL $9021               ; [10 03      ] Branch if Plus
    BPL $9023               ; [10 03      ] Branch if Plus
    PEA $F448               ; [F4 48 F4   ] Push Effective Absolute
    PHP                     ; [08         ] Push Processor Status
    JSR ($7C00,X)           ; [FC 00 7C   ] Jump to Subroutine Indirect,X
    BRA $9025               ; [80 FC      ] Branch Always
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    PLA                     ; [68         ] Pull Accumulator
    BPL $8FDC               ; [10 A8      ] Branch if Plus
    DEY                     ; [88         ] Decrement Y
    BPL $903F               ; [10 08      ] Branch if Plus
    BNE $8FB9               ; [D0 80      ] Branch if Not Equal
    BVC $9003               ; [50 C8      ] Branch if Overflow Clear
    BPL $9049               ; [10 0C      ] Branch if Plus
    LDY #$84                ; [A0 84      ] Load Y Immediate
    PLP                     ; [28         ] Pull Processor Status
    PLP                     ; [28         ] Pull Processor Status
    db $0C                      ; Incomplete/data bytes

;--- Patch at file offset $149050 (SNES $D49050) ---
org $D49050

    BPL $9055               ; [10 03      ] Branch if Plus
    TRB $2002               ; [1C 02 20   ] Test and Reset Bits Absolute
    BRK                     ; [00 0C      ] Software interrupt
    AND $00,S               ; [23 00      ] AND A with Stack Relative
    ORA $000000             ; [0F 00 00 00] OR A with Absolute Long
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 7C      ] Software interrupt
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
    BNE $90DF               ; [D0 78      ] Branch if Not Equal
    BPL $9025               ; [10 BC      ] Branch if Plus
    SEC                     ; [38         ] Set Carry Flag
    TRB $FC18               ; [1C 18 FC   ] Test and Reset Bits Absolute
    RTS                     ; [60         ] Return from Subroutine
    BEQ $9070               ; [F0 00      ] Branch if Equal
    TSB $08                 ; [04 08      ] Test and Set Bits in DP
    CPY #$08                ; [C0 08      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 80      ] Software interrupt
    PHA                     ; [48         ] Push Accumulator
    BRK                     ; [00 98      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 60      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $10                 ; [06 10      ] Shift Left DP
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    AND $081300,X           ; [3F 00 13 08] AND A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    BRK                     ; [00 1A      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $1490AA (SNES $D490AA) ---
org $D490AA

    ADC $10,X               ; [75 10      ] Add with Carry DP,X
    SEC                     ; [38         ] Set Carry Flag
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 0D      ] Software interrupt
    TSB $05                 ; [04 05      ] Test and Set Bits in DP
    BRK                     ; [00 06      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    ORA $3028               ; [0D 28 30   ] OR A with Absolute
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $1490D1 (SNES $D490D1) ---
org $D490D1

    AND $081300,X           ; [3F 00 13 08] AND A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 13      ] Software interrupt
    TSB $00FE               ; [0C FE 00   ] Test and Set Bits Absolute
    JSR ($FC00,X)           ; [FC 00 FC   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BIT $C460,X             ; [3C 60 C4   ] Test Bits Absolute,X
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $90FD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $9155               ; [90 5C      ] Branch if Carry Clear
    BRA $9107               ; [80 0C      ] Branch Always
    BCC $9145               ; [90 48      ] Branch if Carry Clear
    TSB $E0                 ; [04 E0      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    BIT $04                 ; [24 04      ] Test Bits DP
    ORA $070F03,X           ; [1F 03 0F 07] OR A with Absolute Long,X
    ORA ($0F),Y             ; [11 0F      ] OR A with (DP),Y
    db $22, $00, $75            ; Incomplete/data bytes

;--- Patch at file offset $149111 (SNES $D49111) ---
org $D49111

    ORA $060000             ; [0F 00 00 06] OR A with Absolute Long
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    ORA $3028               ; [0D 28 30   ] OR A with Absolute
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    RTS                     ; [60         ] Return from Subroutine
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    BEQ $9106               ; [F0 E0      ] Branch if Equal
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    JSR $3000               ; [20 00 30   ] Jump to Subroutine
    JSR $20F0               ; [20 F0 20   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 60      ] Software interrupt
    BRA $9133               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    JSR $6040               ; [20 40 60   ] Jump to Subroutine

;--- Patch at file offset $149146 (SNES $D49146) ---
org $D49146

    CPX #$40                ; [E0 40      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $149157 (SNES $D49157) ---
org $D49157

    CPY #$00                ; [C0 00      ] Compare Y Immediate
    JSR $5880               ; [20 80 58   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 A4      ] Software interrupt
    BRK                     ; [00 66      ] Software interrupt
    JSR $30BE               ; [20 BE 30   ] Jump to Subroutine
    ASL $1C00               ; [0E 00 1C   ] Shift Left Absolute
    BRK                     ; [00 C4      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    STY $00                 ; [84 00      ] Store Y to DP
    CPY #$58                ; [C0 58      ] Compare Y Immediate
    BRA $9189               ; [80 10      ] Branch Always
    TAY                     ; [A8         ] Transfer A to Y
    MVP $30,$E0             ; [44 30 E0   ] Block Move Positive
    TRB $40                 ; [14 40      ] Test and Reset Bits DP
    TAY                     ; [A8         ] Transfer A to Y
    STA $7B09,Y             ; [99 09 7B   ] Store A to Absolute,Y
    ORA [$0B]               ; [07 0B      ] OR A with [DP]
    ORA [$11]               ; [07 11      ] OR A with [DP]
    ORA $750022             ; [0F 22 00 75] OR A with Absolute Long
    BPL $91C5               ; [10 38      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 4F      ] Software interrupt
    ROL $07                 ; [26 07      ] Rotate Left DP
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $14919B (SNES $D4919B) ---
org $D4919B

    BMI $919D               ; [30 00      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    JSR ($F8E0,X)           ; [FC E0 F8   ] Jump to Subroutine Indirect,X
    CPY #$F0                ; [C0 F0      ] Compare Y Immediate
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    CPY #$20                ; [C0 20      ] Compare Y Immediate
    BRK                     ; [00 30      ] Software interrupt
    JSR $20F0               ; [20 F0 20   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 C0      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BRA $91C4               ; [80 10      ] Branch Always
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 C0      ] Software interrupt
    CPY #$20                ; [C0 20      ] Compare Y Immediate

;--- Patch at file offset $1491C8 (SNES $D491C8) ---
org $D491C8

    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TSB $27                 ; [04 27      ] Test and Set Bits in DP
    CLC                     ; [18         ] Clear Carry Flag
    AND $5A12               ; [2D 12 5A   ] AND A with Absolute
    db $21                      ; Incomplete/data bytes

;--- Patch at file offset $1491D9 (SNES $D491D9) ---
org $D491D9

    ORA $07                 ; [05 07      ] OR A with Direct Page
    CLC                     ; [18         ] Clear Carry Flag
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $920F               ; [10 2F      ] Branch if Plus

;--- Patch at file offset $1491E6 (SNES $D491E6) ---
org $D491E6

    SED                     ; [F8         ] Set Decimal Flag
    RTI                     ; [40         ] Return from Interrupt
    CPX $38                 ; [E4 38      ] Compare X with DP
    PLX                     ; [FA         ] Pull X Register
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    BRK                     ; [00 3E      ] Software interrupt
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $1491F7 (SNES $D491F7) ---
org $D491F7

    CPY #$00                ; [C0 00      ] Compare Y Immediate
    SEC                     ; [38         ] Set Carry Flag
    DEY                     ; [88         ] Decrement Y
    MVN $CC,$10             ; [54 CC 10   ] Block Move Negative
    TSB $E8                 ; [04 E8      ] Test and Set Bits in DP
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $3600,X             ; [3C 00 36   ] Test Bits Absolute,X
    TSB $54                 ; [04 54      ] Test and Set Bits in DP
    ASL $54                 ; [06 54      ] Shift Left DP
    ASL $70                 ; [06 70      ] Shift Left DP
    JSR $0049               ; [20 49 00   ] Jump to Subroutine
    AND $3B0407             ; [2F 07 04 3B] AND A with Absolute Long
    BRK                     ; [00 13      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    AND ($06,X)             ; [21 06      ] AND A with (DP,X)
    BMI $9226               ; [30 07      ] Branch if Minus
    BPL $921F               ; [10 FE      ] Branch if Plus
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    STZ $1C00,X             ; [9E 00 1C   ] Store Zero to Absolute,X
    BRK                     ; [00 38      ] Software interrupt
    JSR $28C4               ; [20 C4 28   ] Jump to Subroutine
    MVP $80,$30             ; [44 80 30   ] Block Move Positive
    STY $20                 ; [84 20      ] Store Y to DP
    STY $04,X               ; [94 04      ] Store Y to DP,X
    PLA                     ; [68         ] Pull Accumulator
    JMP $C820               ; [4C 20 C8   ] Jump Absolute
    db $20, $40                 ; Incomplete/data bytes

;--- Patch at file offset $14924C (SNES $D4924C) ---
org $D4924C

    db $03                      ; Incomplete/data bytes

;--- Patch at file offset $14925F (SNES $D4925F) ---
org $D4925F

    ORA ($F0,X)             ; [01 F0      ] OR A with (DP,X)
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $149270 (SNES $D49270) ---
org $D49270

    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $9274               ; [80 00      ] Branch Always
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 80      ] Software interrupt
    BRA $927C               ; [80 00      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt

;--- Patch at file offset $14928A (SNES $D4928A) ---
org $D4928A

    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA [$01]               ; [07 01      ] OR A with [DP]
    ORA #$06                ; [09 06      ] OR A with Immediate

;--- Patch at file offset $14929D (SNES $D4929D) ---
org $D4929D

    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    db $07                      ; Incomplete/data bytes

;--- Patch at file offset $1492A8 (SNES $D492A8) ---
org $D492A8

    JMP ($BE80,X)           ; [7C 80 BE   ] Jump Indirect,X
    RTI                     ; [40         ] Return from Interrupt
    INC $EF00,X             ; [FE 00 EF   ] Increment Absolute,X
    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $1492B9 (SNES $D492B9) ---
org $D492B9

    BCS $926B               ; [B0 B0      ] Branch if Carry Set
    JMP $04F8               ; [4C F8 04   ] Jump Absolute
    JMP ($1792)             ; [6C 92 17   ] Jump Indirect
    PHP                     ; [08         ] Push Processor Status
    ROL $5E10               ; [2E 10 5E   ] Rotate Left Absolute
    JSR $205E               ; [20 5E 20   ] Jump to Subroutine
    PHY                     ; [5A         ] Push Y Register
    JSR $102A               ; [20 2A 10   ] Jump to Subroutine
    ROL $5D14               ; [2E 14 5D   ] Rotate Left Absolute
    JSL $090B04             ; [22 04 0B 09] Jump to Subroutine Long
    ASL $19,X               ; [16 19      ] Shift Left DP,X
    BIT $11                 ; [24 11      ] Test Bits DP
    PLP                     ; [28         ] Pull Processor Status
    ORA $20,X               ; [15 20      ] OR A with DP,X
    ORA ($14,X)             ; [01 14      ] OR A with (DP,X)
    ORA ($14,X)             ; [01 14      ] OR A with (DP,X)
    ORA ($28)               ; [12 28      ] OR A with (DP)
    ADC $001E10             ; [6F 10 1E 00] Add with Carry Absolute Long

;--- Patch at file offset $1492EF (SNES $D492EF) ---
org $D492EF

    SED                     ; [F8         ] Set Decimal Flag
    PHP                     ; [08         ] Push Processor Status
    INC $C0,X               ; [F6 C0      ] Increment DP,X
    SEC                     ; [38         ] Set Carry Flag
    DEC $30                 ; [C6 30      ] Decrement DP
    LDY $12                 ; [A4 12      ] Load Y from DP
    RTS                     ; [60         ] Return from Subroutine
    ASL $CC,X               ; [16 CC      ] Shift Left DP,X
    JSL $F04C10             ; [22 10 4C F0] Jump to Subroutine Long
    BRK                     ; [00 7B      ] Software interrupt
    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $149308 (SNES $D49308) ---
org $D49308

    CLC                     ; [18         ] Clear Carry Flag

;--- Patch at file offset $149310 (SNES $D49310) ---
org $D49310

    AND ($00,X)             ; [21 00      ] AND A with (DP,X)

;--- Patch at file offset $14931B (SNES $D4931B) ---
org $D4931B

    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    COP #$00                ; [02 00      ] Coprocessor interrupt
    BRK                     ; [00 3E      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    AND $CC7EFE,X           ; [3F FE 7E CC] AND A with Absolute Long,X
    db $F4, $90                 ; Incomplete/data bytes

;--- Patch at file offset $149330 (SNES $D49330) ---
org $D49330

    SED                     ; [F8         ] Set Decimal Flag
    CPY #$FC                ; [C0 FC      ] Compare Y Immediate
    BRK                     ; [00 C8      ] Software interrupt
    BRK                     ; [00 A0      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 B0      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt

;--- Patch at file offset $149348 (SNES $D49348) ---
org $D49348

    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TSB $27                 ; [04 27      ] Test and Set Bits in DP
    CLC                     ; [18         ] Clear Carry Flag
    BIT $5B13               ; [2C 13 5B   ] Test Bits Absolute
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $149359 (SNES $D49359) ---
org $D49359

    ORA $07                 ; [05 07      ] OR A with Direct Page
    CLC                     ; [18         ] Clear Carry Flag
    PHP                     ; [08         ] Push Processor Status
    ORA [$10],Y             ; [17 10      ] OR A with [DP],Y
    db $2F                      ; Incomplete/data bytes

;--- Patch at file offset $149366 (SNES $D49366) ---
org $D49366

    CPX #$40                ; [E0 40      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $149377 (SNES $D49377) ---
org $D49377

    CPY #$00                ; [C0 00      ] Compare Y Immediate
    JSR $5880               ; [20 80 58   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    BVC $93A2               ; [50 20      ] Branch if Overflow Clear
    BMI $9384               ; [30 00      ] Branch if Minus

;--- Patch at file offset $14938F (SNES $D4938F) ---
org $D4938F

    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    db $3F, $0C, $13            ; Incomplete/data bytes

;--- Patch at file offset $14939E (SNES $D4939E) ---
org $D4939E

    ORA $00,X               ; [15 00      ] OR A with DP,X
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 5C      ] Software interrupt
    JSR $30BC               ; [20 BC 30   ] Jump to Subroutine
    MVP $A8,$68             ; [44 A8 68   ] Block Move Positive
    BRA $93BD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $9415               ; [90 5C      ] Branch if Carry Clear
    BRA $93C7               ; [80 0C      ] Branch Always
    BCC $93DD               ; [90 20      ] Branch if Carry Clear
    DEY                     ; [88         ] Decrement Y
    BVS $93C0               ; [70 00      ] Branch if Overflow Set
    BVC $93E2               ; [50 20      ] Branch if Overflow Clear
    BMI $93C4               ; [30 00      ] Branch if Minus

;--- Patch at file offset $1493CF (SNES $D493CF) ---
org $D493CF

    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    db $3F, $0C, $13            ; Incomplete/data bytes

;--- Patch at file offset $1493DE (SNES $D493DE) ---
org $D493DE

    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 5C      ] Software interrupt
    JSR $30BC               ; [20 BC 30   ] Jump to Subroutine
    MVP $A8,$68             ; [44 A8 68   ] Block Move Positive
    BRA $93FD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $9455               ; [90 5C      ] Branch if Carry Clear
    BRA $9407               ; [80 0C      ] Branch Always
    BCC $941D               ; [90 20      ] Branch if Carry Clear
    DEY                     ; [88         ] Decrement Y

;--- Patch at file offset $14B160 (SNES $D4B160) ---
org $D4B160

    BRK                     ; [00 00      ] Software interrupt

;--- End of patch ---