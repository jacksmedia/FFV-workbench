;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; new Krile - xJ4cks .ips.commented.asm
;    Disassembled from IPS patch: new Krile - xJ4cks .ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 27 record(s)

;--- Patch at file offset $00FFDC (SNES $C0FFDC) ---
org $C0FFDC

    LDY $4368,X             ; [BC 68 43   ] Load Y from Absolute,X
    db $97                      ; Incomplete/data bytes

;--- Patch at file offset $148E04 (SNES $D48E04) ---
org $D48E04

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TSB $27                 ; [04 27      ] Test and Set Bits in DP
    CLC                     ; [18         ] Clear Carry Flag
    AND $5A12               ; [2D 12 5A   ] AND A with Absolute
    db $21                      ; Incomplete/data bytes

;--- Patch at file offset $148E16 (SNES $D48E16) ---
org $D48E16

    BRK                     ; [00 00      ] Software interrupt
    COP #$05                ; [02 05      ] Coprocessor interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $8E4F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPX #$40                ; [E0 40      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
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
    BRK                     ; [00 00      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    BRK                     ; [00 01      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 50      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BVC $8EE4               ; [50 40      ] Branch if Overflow Clear
    CPX #$C0                ; [E0 C0      ] Compare X Immediate

;--- Patch at file offset $148EAC (SNES $D48EAC) ---
org $D48EAC

    CPY #$80                ; [C0 80      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $8F12               ; [80 60      ] Branch Always
    BRK                     ; [00 E0      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $148EBD (SNES $D48EBD) ---
org $D48EBD

    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $148EC4 (SNES $D48EC4) ---
org $D48EC4

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TSB $27                 ; [04 27      ] Test and Set Bits in DP
    CLC                     ; [18         ] Clear Carry Flag
    AND $5A12               ; [2D 12 5A   ] AND A with Absolute
    db $21                      ; Incomplete/data bytes

;--- Patch at file offset $148ED6 (SNES $D48ED6) ---
org $D48ED6

    BRK                     ; [00 00      ] Software interrupt
    COP #$05                ; [02 05      ] Coprocessor interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $8F0F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPX #$40                ; [E0 40      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
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

;--- Patch at file offset $148F4D (SNES $D48F4D) ---
org $D48F4D

    COP #$0E                ; [02 0E      ] Coprocessor interrupt
    BRK                     ; [00 0D      ] Software interrupt
    db $14                      ; Incomplete/data bytes

;--- Patch at file offset $148F5C (SNES $D48F5C) ---
org $D48F5C

    TSB $06                 ; [04 06      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BCC $8EE2               ; [90 80      ] Branch if Carry Clear
    JSR $F000               ; [20 00 F0   ] Jump to Subroutine
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
    BRK                     ; [00 00      ] Software interrupt
    CLI                     ; [58         ] Clear Interrupt Disable
    RTI                     ; [40         ] Return from Interrupt
    BVC $8FE4               ; [50 40      ] Branch if Overflow Clear
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    BEQ $8F88               ; [F0 E0      ] Branch if Equal
    JSR $3000               ; [20 00 30   ] Jump to Subroutine
    JSR $20F0               ; [20 F0 20   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 80      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRA $9014               ; [80 60      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRK                     ; [00 C0      ] Software interrupt
    CPY #$20                ; [C0 20      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $148FC8 (SNES $D48FC8) ---
org $D48FC8

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    db $0F, $00                 ; Incomplete/data bytes

;--- Patch at file offset $148FDA (SNES $D48FDA) ---
org $D48FDA

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)

;--- Patch at file offset $148FE8 (SNES $D48FE8) ---
org $D48FE8

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BCS $8FEE               ; [B0 00      ] Branch if Carry Set
    INX                     ; [E8         ] Increment X
    db $90                      ; Incomplete/data bytes

;--- Patch at file offset $148FFB (SNES $D48FFB) ---
org $D48FFB

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
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
    TSB $0021               ; [0C 21 00   ] Test and Set Bits Absolute
    EOR $025200,X           ; [5F 00 52 02] XOR A with Absolute Long,X
    AND ($02)               ; [32 02      ] AND A with (DP)
    ORA $030700             ; [0F 00 07 03] OR A with Absolute Long
    ORA $031000             ; [0F 00 10 03] OR A with Absolute Long
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
    ASL                     ; [0A         ] Shift Left Accumulator
    db $04                      ; Incomplete/data bytes

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
    ASL $10                 ; [06 10      ] Shift Left DP
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 24      ] Software interrupt
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
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
    JSL $107500             ; [22 00 75 10] Jump to Subroutine Long
    SEC                     ; [38         ] Set Carry Flag
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 10      ] Software interrupt
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
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPX #$40                ; [E0 40      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
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

;--- Patch at file offset $14919A (SNES $D4919A) ---
org $D4919A

    PLP                     ; [28         ] Pull Processor Status
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
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1491C4 (SNES $D491C4) ---
org $D491C4

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TSB $27                 ; [04 27      ] Test and Set Bits in DP
    CLC                     ; [18         ] Clear Carry Flag
    AND $5A12               ; [2D 12 5A   ] AND A with Absolute
    db $21                      ; Incomplete/data bytes

;--- Patch at file offset $1491D6 (SNES $D491D6) ---
org $D491D6

    BRK                     ; [00 00      ] Software interrupt
    COP #$05                ; [02 05      ] Coprocessor interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $920F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    SED                     ; [F8         ] Set Decimal Flag
    RTI                     ; [40         ] Return from Interrupt
    CPX $38                 ; [E4 38      ] Compare X with DP
    PLX                     ; [FA         ] Pull X Register
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    BRK                     ; [00 3E      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
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
    JSR $8040               ; [20 40 80   ] Jump to Subroutine

;--- Patch at file offset $149248 (SNES $D49248) ---
org $D49248

    ASL $00                 ; [06 00      ] Shift Left DP
    COP #$00                ; [02 00      ] Coprocessor interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA $01,S               ; [03 01      ] OR A with Stack Relative

;--- Patch at file offset $149259 (SNES $D49259) ---
org $D49259

    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    BRK                     ; [00 01      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA ($F0,X)             ; [01 F0      ] OR A with (DP,X)
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $14926C (SNES $D4926C) ---
org $D4926C

    CPY #$80                ; [C0 80      ] Compare Y Immediate
    BRA $9270               ; [80 00      ] Branch Always
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $9274               ; [80 00      ] Branch Always
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 80      ] Software interrupt
    BRA $927C               ; [80 00      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt

;--- Patch at file offset $149284 (SNES $D49284) ---
org $D49284

    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    COP #$01                ; [02 01      ] Coprocessor interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA [$01]               ; [07 01      ] OR A with [DP]
    ORA #$06                ; [09 06      ] OR A with Immediate

;--- Patch at file offset $149297 (SNES $D49297) ---
org $D49297

    BRK                     ; [00 00      ] Software interrupt
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    COP #$00                ; [02 00      ] Coprocessor interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA [$00]               ; [07 00      ] OR A with [DP]
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 7C      ] Software interrupt
    BRA $9269               ; [80 BE      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    INC $EF00,X             ; [FE 00 EF   ] Increment Absolute,X
    BPL $92B1               ; [10 00      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
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
    ORA #$00                ; [09 00      ] OR A with Immediate
    EOR #$00                ; [49 00      ] XOR A with Immediate
    STA $001106             ; [8F 06 11 00] Store A to Absolute Long
    LDX #$10                ; [A2 10      ] Load X Immediate
    JSR ($08F8,X)           ; [FC F8 08   ] Jump to Subroutine Indirect,X
    INC $C0,X               ; [F6 C0      ] Increment DP,X
    SEC                     ; [38         ] Set Carry Flag
    DEC $30                 ; [C6 30      ] Decrement DP
    LDY $12                 ; [A4 12      ] Load Y from DP
    RTS                     ; [60         ] Return from Subroutine
    ASL $CC,X               ; [16 CC      ] Shift Left DP,X
    JSL $F04C10             ; [22 10 4C F0] Jump to Subroutine Long
    BRK                     ; [00 7B      ] Software interrupt
    ORA ($21,X)             ; [01 21      ] OR A with (DP,X)
    BRK                     ; [00 02      ] Software interrupt
    ORA ($04,X)             ; [01 04      ] OR A with (DP,X)
    ORA ($18,X)             ; [01 18      ] OR A with (DP,X)
    BRK                     ; [00 0D      ] Software interrupt
    TSB $07                 ; [04 07      ] Test and Set Bits in DP
    COP #$02                ; [02 02      ] Coprocessor interrupt
    BRK                     ; [00 21      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ORA #$02                ; [09 02      ] OR A with Immediate
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    COP #$00                ; [02 00      ] Coprocessor interrupt
    BRK                     ; [00 3E      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    AND $CC7EFE,X           ; [3F FE 7E CC] AND A with Absolute Long,X
    PEA $7890               ; [F4 90 78   ] Push Effective Absolute
    BMI $9323               ; [30 F8      ] Branch if Minus
    BMI $935D               ; [30 30      ] Branch if Minus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    CPY #$FC                ; [C0 FC      ] Compare Y Immediate
    BRK                     ; [00 C8      ] Software interrupt
    BRK                     ; [00 A0      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 B0      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt

;--- Patch at file offset $149344 (SNES $D49344) ---
org $D49344

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TSB $27                 ; [04 27      ] Test and Set Bits in DP
    CLC                     ; [18         ] Clear Carry Flag
    BIT $5B13               ; [2C 13 5B   ] Test Bits Absolute
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $149356 (SNES $D49356) ---
org $D49356

    BRK                     ; [00 00      ] Software interrupt
    COP #$05                ; [02 05      ] Coprocessor interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA [$10],Y             ; [17 10      ] OR A with [DP],Y
    AND $000000             ; [2F 00 00 00] AND A with Absolute Long
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    SED                     ; [F8         ] Set Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    JSR $5880               ; [20 80 58   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    BVC $93A2               ; [50 20      ] Branch if Overflow Clear
    BMI $9384               ; [30 00      ] Branch if Minus
    BPL $9386               ; [10 00      ] Branch if Plus
    ORA ($00,S),Y           ; [13 00      ] OR A with (SR),Y
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    BPL $938C               ; [10 00      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 2E      ] Software interrupt
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    AND $0E130C,X           ; [3F 0C 13 0E] AND A with Absolute Long,X
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    BRK                     ; [00 0B      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($15,X)             ; [01 15      ] OR A with (DP,X)
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
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
    BPL $93C6               ; [10 00      ] Branch if Plus
    ORA ($00,S),Y           ; [13 00      ] OR A with (SR),Y
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    BPL $93CC               ; [10 00      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 1F      ] Software interrupt
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    AND $0E130C,X           ; [3F 0C 13 0E] AND A with Absolute Long,X
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    BRK                     ; [00 0B      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($04,X)             ; [01 04      ] OR A with (DP,X)
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
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