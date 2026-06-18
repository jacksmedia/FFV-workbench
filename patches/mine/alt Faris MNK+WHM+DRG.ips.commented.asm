;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; alt Faris MNK+WHM+DRG.ips.commented.asm
;    Disassembled from IPS patch: alt Faris MNK+WHM+DRG.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 129 record(s)

;--- Patch at file offset $00FFDC (SNES $C0FFDC) ---
org $C0FFDC

    DEC $2116,X             ; [DE 16 21   ] Decrement Absolute,X
    db $E9                      ; Incomplete/data bytes

;--- Patch at file offset $139E02 (SNES $D39E02) ---
org $D39E02

    EOR $3C,S               ; [43 3C      ] XOR A with Stack Relative
    db $F9                      ; Incomplete/data bytes

;--- Patch at file offset $139E12 (SNES $D39E12) ---
org $D39E12

    AND $014703,X           ; [3F 03 47 01] AND A with Absolute Long,X

;--- Patch at file offset $139E2C (SNES $D39E2C) ---
org $D39E2C

    ASL $26FC               ; [0E FC 26   ] Shift Left Absolute
    INX                     ; [E8         ] Increment X
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    INC $FC80,X             ; [FE 80 FC   ] Increment Absolute,X
    db $1C                      ; Incomplete/data bytes

;--- Patch at file offset $139E6C (SNES $D39E6C) ---
org $D39E6C

    PHB                     ; [8B         ] Push Data Bank

;--- Patch at file offset $139E7C (SNES $D39E7C) ---
org $D39E7C

    db $7E                      ; Incomplete/data bytes

;--- Patch at file offset $139EC2 (SNES $D39EC2) ---
org $D39EC2

    EOR $3C,S               ; [43 3C      ] XOR A with Stack Relative
    db $F9                      ; Incomplete/data bytes

;--- Patch at file offset $139ED2 (SNES $D39ED2) ---
org $D39ED2

    AND $014703,X           ; [3F 03 47 01] AND A with Absolute Long,X

;--- Patch at file offset $139EEC (SNES $D39EEC) ---
org $D39EEC

    ASL $27FC               ; [0E FC 27   ] Shift Left Absolute
    NOP                     ; [EA         ] No Operation
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    INC $FC80,X             ; [FE 80 FC   ] Increment Absolute,X
    db $1C                      ; Incomplete/data bytes

;--- Patch at file offset $139F0A (SNES $D39F0A) ---
org $D39F0A

    db $A9                      ; Incomplete/data bytes

;--- Patch at file offset $139F1A (SNES $D39F1A) ---
org $D39F1A

    db $7C                      ; Incomplete/data bytes

;--- Patch at file offset $139F28 (SNES $D39F28) ---
org $D39F28

    TDC                     ; [7B         ] Transfer Direct Page to A

;--- Patch at file offset $139F38 (SNES $D39F38) ---
org $D39F38

    db $DE                      ; Incomplete/data bytes

;--- Patch at file offset $139FDD (SNES $D39FDD) ---
org $D39FDD

    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $139FEE (SNES $D39FEE) ---
org $D39FEE

    db $27                      ; Incomplete/data bytes

;--- Patch at file offset $139FFB (SNES $D39FFB) ---
org $D39FFB

    TRB $3CFC               ; [1C FC 3C   ] Test and Reset Bits Absolute

;--- Patch at file offset $13A020 (SNES $D3A020) ---
org $D3A020

    ASL $84F8               ; [0E F8 84   ] Shift Left Absolute
    INX                     ; [E8         ] Increment X
    db $12                      ; Incomplete/data bytes

;--- Patch at file offset $13A079 (SNES $D3A079) ---
org $D3A079

    db $44                      ; Incomplete/data bytes

;--- Patch at file offset $13A08E (SNES $D3A08E) ---
org $D3A08E

    db $17                      ; Incomplete/data bytes

;--- Patch at file offset $13A0CC (SNES $D3A0CC) ---
org $D3A0CC

    PHB                     ; [8B         ] Push Data Bank

;--- Patch at file offset $13A0DC (SNES $D3A0DC) ---
org $D3A0DC

    db $7F                      ; Incomplete/data bytes

;--- Patch at file offset $13A14E (SNES $D3A14E) ---
org $D3A14E

    PER $A22D               ; [62 DC 00   ] Push Effective Relative
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRA $A143               ; [80 EC      ] Branch Always
    db $02                      ; Incomplete/data bytes

;--- Patch at file offset $13A15E (SNES $D3A15E) ---
org $D3A15E

    db $DC                      ; Incomplete/data bytes

;--- Patch at file offset $13A1C2 (SNES $D3A1C2) ---
org $D3A1C2

    EOR $3C,S               ; [43 3C      ] XOR A with Stack Relative
    db $F9                      ; Incomplete/data bytes

;--- Patch at file offset $13A1D2 (SNES $D3A1D2) ---
org $D3A1D2

    AND $014703,X           ; [3F 03 47 01] AND A with Absolute Long,X

;--- Patch at file offset $13A1EE (SNES $D3A1EE) ---
org $D3A1EE

    PER $A2CD               ; [62 DC 00   ] Push Effective Relative
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRA $A1E3               ; [80 EC      ] Branch Always
    db $02                      ; Incomplete/data bytes

;--- Patch at file offset $13A1FE (SNES $D3A1FE) ---
org $D3A1FE

    db $DC                      ; Incomplete/data bytes

;--- Patch at file offset $13A28C (SNES $D3A28C) ---
org $D3A28C

    ADC $3E,S               ; [63 3E      ] Add with Carry Stack Relative
    TYX                     ; [BB         ] Transfer Y to X
    JMP $0000               ; [4C 00 00   ] Jump Absolute
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ADC [$03],Y             ; [77 03      ] Add with Carry [DP],Y
    db $3F, $21                 ; Incomplete/data bytes

;--- Patch at file offset $13A2A5 (SNES $D3A2A5) ---
org $D3A2A5

    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $13A2B3 (SNES $D3A2B3) ---
org $D3A2B3

    BRK                     ; [00 E4      ] Software interrupt
    TRB $E8                 ; [14 E8      ] Test and Reset Bits DP
    BCC $A2B5               ; [90 FC      ] Branch if Carry Clear
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $13A2C6 (SNES $D3A2C6) ---
org $D3A2C6

    PHX                     ; [DA         ] Push X Register

;--- Patch at file offset $13A2D6 (SNES $D3A2D6) ---
org $D3A2D6

    db $74                      ; Incomplete/data bytes

;--- Patch at file offset $13A320 (SNES $D3A320) ---
org $D3A320

    db $D3                      ; Incomplete/data bytes

;--- Patch at file offset $13A330 (SNES $D3A330) ---
org $D3A330

    SEI                     ; [78         ] Set Interrupt Disable

;--- Patch at file offset $13A342 (SNES $D3A342) ---
org $D3A342

    EOR $3C,S               ; [43 3C      ] XOR A with Stack Relative
    db $F9                      ; Incomplete/data bytes

;--- Patch at file offset $13A352 (SNES $D3A352) ---
org $D3A352

    AND $014703,X           ; [3F 03 47 01] AND A with Absolute Long,X

;--- Patch at file offset $13A36C (SNES $D3A36C) ---
org $D3A36C

    ASL $24FC               ; [0E FC 24   ] Shift Left Absolute
    INX                     ; [E8         ] Increment X
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    INC $FC80,X             ; [FE 80 FC   ] Increment Absolute,X
    db $1C                      ; Incomplete/data bytes

;--- Patch at file offset $13A382 (SNES $D3A382) ---
org $D3A382

    STA ($00),Y             ; [91 00      ] Store A to (DP),Y
    STA ($0D)               ; [92 0D      ] Store A to (DP)
    PHB                     ; [8B         ] Push Data Bank
    TSB $CE                 ; [04 CE      ] Test and Set Bits in DP

;--- Patch at file offset $13A392 (SNES $D3A392) ---
org $D3A392

    JMP ($6D02)             ; [6C 02 6D   ] Jump Indirect
    BRK                     ; [00 64      ] Software interrupt
    BPL $A3BA               ; [10 21      ] Branch if Plus

;--- Patch at file offset $13A3AC (SNES $D3A3AC) ---
org $D3A3AC

    db $D2                      ; Incomplete/data bytes

;--- Patch at file offset $13A3BC (SNES $D3A3BC) ---
org $D3A3BC

    SEI                     ; [78         ] Set Interrupt Disable

;--- Patch at file offset $13A3C3 (SNES $D3A3C3) ---
org $D3A3C3

    BRK                     ; [00 4A      ] Software interrupt
    db $05                      ; Incomplete/data bytes

;--- Patch at file offset $13A3D4 (SNES $D3A3D4) ---
org $D3A3D4

    AND $10                 ; [25 10      ] AND A with Direct Page

;--- Patch at file offset $13A3EC (SNES $D3A3EC) ---
org $D3A3EC

    db $D2                      ; Incomplete/data bytes

;--- Patch at file offset $13A3FC (SNES $D3A3FC) ---
org $D3A3FC

    SEI                     ; [78         ] Set Interrupt Disable

;--- Patch at file offset $13C200 (SNES $D3C200) ---
org $D3C200

    ORA $063900             ; [0F 00 39 06] OR A with Absolute Long
    ADC ($1E,X)             ; [61 1E      ] Add with Carry (DP,X)
    TDC                     ; [7B         ] Transfer Direct Page to A
    TSB $B6                 ; [04 B6      ] Test and Set Bits in DP
    EOR #$AE                ; [49 AE      ] XOR A with Immediate
    EOR ($5E),Y             ; [51 5E      ] XOR A with (DP),Y
    AND ($BD,X)             ; [21 BD      ] AND A with (DP,X)
    MVP $00,$00             ; [44 00 00   ] Block Move Positive
    BRK                     ; [00 0F      ] Software interrupt
    AND ($1E,X)             ; [21 1E      ] AND A with (DP,X)
    AND $1C,S               ; [23 1C      ] AND A with Stack Relative
    TSB $69                 ; [04 69      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    EOR $00,X               ; [55 00      ] XOR A with DP,X
    AND $6002,Y             ; [39 02 60   ] AND A with Absolute,Y
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRA $C231               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    BPL $C297               ; [10 60      ] Branch if Plus
    BCC $C269               ; [90 30      ] Branch if Carry Clear
    INY                     ; [C8         ] Increment Y
    BMI $C1C4               ; [30 88      ] Branch if Minus
    BMI $C1CA               ; [30 8C      ] Branch if Minus
    CLC                     ; [18         ] Clear Carry Flag
    CPY $B5                 ; [C4 B5      ] Compare Y with DP
    LSR $51                 ; [46 51      ] Shift Right DP
    BRK                     ; [00 11      ] Software interrupt
    BRK                     ; [00 2B      ] Software interrupt
    BPL $C2BE               ; [10 75      ] Branch if Plus
    INC                     ; [1A         ] Increment Accumulator
    db $9F, $0E                 ; Incomplete/data bytes

;--- Patch at file offset $13C254 (SNES $D3C254) ---
org $D3C254

    TSB $1402               ; [0C 02 14   ] Test and Set Bits Absolute
    BRK                     ; [00 1A      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    ASL $046B               ; [0E 6B 04   ] Shift Left Absolute
    ORA $00FF40             ; [0F 40 FF 00] OR A with Absolute Long
    EOR $807FA0,X           ; [5F A0 7F 80] XOR A with Absolute Long,X
    EOR ($90)               ; [52 90      ] XOR A with (DP)
    TDC                     ; [7B         ] Transfer Direct Page to A
    TXA                     ; [8A         ] Transfer X to A
    CMP [$0E],Y             ; [D7 0E      ] Compare A with [DP],Y
    STA $0C,X               ; [95 0C      ] Store A to DP,X
    STA $0C,X               ; [95 0C      ] Store A to DP,X
    TRB $2A                 ; [14 2A      ] Test and Reset Bits DP
    TRB $AA                 ; [14 AA      ] Test and Reset Bits DP
    BRK                     ; [00 BA      ] Software interrupt
    BIT $0EAC,X             ; [3C AC 0E   ] Test Bits Absolute,X
    STX $2E                 ; [86 2E      ] Store X to DP
    db $82                      ; Incomplete/data bytes

;--- Patch at file offset $13C2A8 (SNES $D3C2A8) ---
org $D3C2A8

    TYX                     ; [BB         ] Transfer Y to X
    LDX $EEBB               ; [AE BB EE   ] Load X from Absolute
    db $FF, $F7                 ; Incomplete/data bytes

;--- Patch at file offset $13C2C0 (SNES $D3C2C0) ---
org $D3C2C0

    ORA [$00]               ; [07 00      ] OR A with [DP]
    TRB $3303               ; [1C 03 33   ] Test and Reset Bits Absolute
    TSB $112E               ; [0C 2E 11   ] Test and Set Bits Absolute
    EOR $5B22,X             ; [5D 22 5B   ] XOR A with Absolute,X
    BIT $B7                 ; [24 B7      ] Test Bits DP
    PHA                     ; [48         ] Push Accumulator
    LDA $000040,X           ; [BF 40 00 00] Load A from Absolute Long,X
    BRK                     ; [00 07      ] Software interrupt
    ORA ($0C,S),Y           ; [13 0C      ] OR A with (SR),Y
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA $14,X               ; [15 14      ] OR A with DP,X
    PLD                     ; [2B         ] Pull Direct Page Register
    BRK                     ; [00 36      ] Software interrupt
    BIT $4A                 ; [24 4A      ] Test Bits DP
    PHP                     ; [08         ] Push Processor Status
    STZ $A0                 ; [64 A0      ] Store Zero to DP
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 7C      ] Software interrupt
    BRA $C36B               ; [80 7E      ] Branch Always
    BRA $C2AD               ; [80 BE      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    CPX #$10                ; [E0 10      ] Compare X Immediate
    RTS                     ; [60         ] Return from Subroutine
    BCC $C2A9               ; [90 B0      ] Branch if Carry Clear
    PHA                     ; [48         ] Push Accumulator
    BPL $C2C4               ; [10 C8      ] Branch if Plus
    BVC $C28A               ; [50 8C      ] Branch if Overflow Clear
    PLP                     ; [28         ] Pull Processor Status
    MVP $AD,$51             ; [44 AD 51   ] Block Move Positive
    EOR ($01),Y             ; [51 01      ] XOR A with (DP),Y
    SEC                     ; [38         ] Set Carry Flag

;--- Patch at file offset $13C311 (SNES $D3C311) ---
org $D3C311

    PHY                     ; [5A         ] Push Y Register
    TSB $0702               ; [0C 02 07   ] Test and Set Bits Absolute
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $13C321 (SNES $D3C321) ---
org $D3C321

    JSR $902E               ; [20 2E 90   ] Jump to Subroutine
    LSR $BE20,X             ; [5E 20 BE   ] Shift Right Absolute,X
    db $30                      ; Incomplete/data bytes

;--- Patch at file offset $13C330 (SNES $D3C330) ---
org $D3C330

    STY $0420               ; [8C 20 04   ] Store Y to Absolute
    BVC $C33D               ; [50 08      ] Branch if Overflow Clear
    LDY $70                 ; [A4 70      ] Load Y from DP
    db $5C                      ; Incomplete/data bytes

;--- Patch at file offset $13C366 (SNES $D3C366) ---
org $D3C366

    EOR $1E,S               ; [43 1E      ] XOR A with Stack Relative
    PLB                     ; [AB         ] Pull Data Bank
    STX $46DF               ; [8E DF 46   ] Store X to Absolute

;--- Patch at file offset $13C3BB (SNES $D3C3BB) ---
org $D3C3BB

    STA ($3B),Y             ; [91 3B      ] Store A to (DP),Y
    XCE                     ; [FB         ] Exchange Carry and Emulation

;--- Patch at file offset $13C3C6 (SNES $D3C3C6) ---
org $D3C3C6

    BRK                     ; [00 00      ] Software interrupt
    ORA $063900             ; [0F 00 39 06] OR A with Absolute Long
    ADC ($1E,X)             ; [61 1E      ] Add with Carry (DP,X)
    TDC                     ; [7B         ] Transfer Direct Page to A
    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $13C3D8 (SNES $D3C3D8) ---
org $D3C3D8

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    AND ($1E,X)             ; [21 1E      ] AND A with (DP,X)
    AND $1C,S               ; [23 1C      ] AND A with Stack Relative
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $13C3F6 (SNES $D3C3F6) ---
org $D3C3F6

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    CPX #$10                ; [E0 10      ] Compare X Immediate
    RTS                     ; [60         ] Return from Subroutine
    BCC $C3B7               ; [90 B6      ] Branch if Carry Clear
    db $49                      ; Incomplete/data bytes

;--- Patch at file offset $13C408 (SNES $D3C408) ---
org $D3C408

    ADC $3D10               ; [6D 10 3D   ] Add with Carry Absolute
    ORA ($38,X)             ; [01 38      ] OR A with (DP,X)
    BRK                     ; [00 78      ] Software interrupt
    JSR $6904               ; [20 04 69   ] Jump to Subroutine
    BRK                     ; [00 57      ] Software interrupt

;--- Patch at file offset $13C41A (SNES $D3C41A) ---
org $D3C41A

    ORA ($08)               ; [12 08      ] OR A with (DP)
    ASL $11                 ; [06 11      ] Shift Left DP
    ROL $01                 ; [26 01      ] Rotate Left DP
    JSR ($FE00,X)           ; [FC 00 FE   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 7E      ] Software interrupt
    BRA $C3E5               ; [80 BE      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    DEC $5E20,X             ; [DE 20 5E   ] Decrement Absolute,X
    LDY #$7C                ; [A0 7C      ] Load Y Immediate
    BPL $C425               ; [10 F6      ] Branch if Plus
    STZ $30,X               ; [74 30      ] Store Zero to DP,X
    INY                     ; [C8         ] Increment Y
    BPL $C4A0               ; [10 6C      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    LDY $08                 ; [A4 08      ] Load Y from DP
    MVN $08,$24             ; [54 08 24   ] Block Move Negative
    TSB $28                 ; [04 28      ] Test and Set Bits in DP
    BPL $C3C6               ; [10 88      ] Branch if Plus
    JMP ($654C,X)           ; [7C 4C 65   ] Jump Indirect,X
    SEC                     ; [38         ] Set Carry Flag
    PLY                     ; [7A         ] Pull Y Register
    db $0D                      ; Incomplete/data bytes

;--- Patch at file offset $13C450 (SNES $D3C450) ---
org $D3C450

    DEC                     ; [3A         ] Decrement Accumulator
    BRK                     ; [00 0D      ] Software interrupt

;--- Patch at file offset $13C461 (SNES $D3C461) ---
org $D3C461

    JSR ($D8E2,X)           ; [FC E2 D8   ] Jump to Subroutine Indirect,X
    REP #$98                ; [C2 98      ] Reset Processor Status Bits
    LDA [$3E],Y             ; [B7 3E      ] Load A from [DP],Y

;--- Patch at file offset $13C470 (SNES $D3C470) ---
org $D3C470

    db $FC, $84                 ; Incomplete/data bytes

;--- Patch at file offset $13C484 (SNES $D3C484) ---
org $D3C484

    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    BPL $C4AE               ; [10 25      ] Branch if Plus
    ASL                     ; [0A         ] Shift Left Accumulator
    db $1F, $0E                 ; Incomplete/data bytes

;--- Patch at file offset $13C494 (SNES $D3C494) ---
org $D3C494

    TSB $1402               ; [0C 02 14   ] Test and Set Bits Absolute
    BRK                     ; [00 1A      ] Software interrupt
    BPL $C49B               ; [10 00      ] Branch if Plus

;--- Patch at file offset $13C4C0 (SNES $D3C4C0) ---
org $D3C4C0

    LDY $46,X               ; [B4 46      ] Load Y from DP,X
    BVC $C4C4               ; [50 00      ] Branch if Overflow Clear
    BPL $C4C6               ; [10 00      ] Branch if Plus
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    BPL $C502               ; [10 39      ] Branch if Plus
    ORA ($5C,X)             ; [01 5C      ] OR A with (DP,X)
    ORA $480F8C,X           ; [1F 8C 0F 48] OR A with Absolute Long,X
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    EOR #$0C                ; [49 0C      ] XOR A with Immediate
    ORA $0C,S               ; [03 0C      ] OR A with Stack Relative
    ORA $14,S               ; [03 14      ] OR A with Stack Relative
    BRK                     ; [00 07      ] Software interrupt
    ASL $3F                 ; [06 3F      ] Shift Left DP
    BPL $C51C               ; [10 3F      ] Branch if Plus
    PHA                     ; [48         ] Push Accumulator
    ORA [$34]               ; [07 34      ] OR A with [DP]
    LDA $205F40,X           ; [BF 40 5F 20] Load A from Absolute Long,X
    SBC $203E50             ; [EF 50 3E 20] Subtract with Borrow Absolute Long
    ROR $3CE0               ; [6E E0 3C   ] Rotate Right Absolute
    BEQ $C519               ; [F0 2C      ] Branch if Equal
    INX                     ; [E8         ] Increment X
    BIT $04E8,X             ; [3C E8 04   ] Test Bits Absolute,X
    ROR                     ; [6A         ] Rotate Right Accumulator
    STY $2A                 ; [84 2A      ] Store Y to DP
    MVP $5A,$E0             ; [44 5A E0   ] Block Move Positive
    CPX $F0                 ; [E4 F0      ] Compare X with DP
    db $14                      ; Incomplete/data bytes

;--- Patch at file offset $13C520 (SNES $D3C520) ---
org $D3C520

    ROL $06F4,X             ; [3E F4 06   ] Rotate Left Absolute,X
    BEQ $C56F               ; [F0 4A      ] Branch if Equal
    SEI                     ; [78         ] Set Interrupt Disable
    STA $06771E,X           ; [9F 1E 77 06] Store A to Absolute Long,X

;--- Patch at file offset $13C540 (SNES $D3C540) ---
org $D3C540

    BVS $C542               ; [70 00      ] Branch if Overflow Set
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 F1      ] Software interrupt
    BRK                     ; [00 E1      ] Software interrupt
    BRK                     ; [00 E1      ] Software interrupt
    BRK                     ; [00 F3      ] Software interrupt
    BRK                     ; [00 6A      ] Software interrupt
    BRA $C551               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    BPL $C5C3               ; [10 6C      ] Branch if Plus
    BRL $8578               ; [82 1E C0   ] Branch Long
    TSB $0092               ; [0C 92 00   ] Test and Set Bits Absolute
    STY $D410               ; [8C 10 D4   ] Store Y to Absolute
    ROR $90,X               ; [76 90      ] Rotate Right DP,X
    ROR $76BC,X             ; [7E BC 76   ] Rotate Right Absolute,X

;--- Patch at file offset $13C570 (SNES $D3C570) ---
org $D3C570

    CLC                     ; [18         ] Clear Carry Flag
    INY                     ; [C8         ] Increment Y
    BIT $3C84,X             ; [3C 84 3C   ] Test Bits Absolute,X
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $13C58C (SNES $D3C58C) ---
org $D3C58C

    db $7F, $3F, $7F            ; Incomplete/data bytes

;--- Patch at file offset $13C59C (SNES $D3C59C) ---
org $D3C59C

    BRK                     ; [00 3F      ] Software interrupt

;--- Patch at file offset $13C5A8 (SNES $D3C5A8) ---
org $D3C5A8

    ORA [$F2],Y             ; [17 F2      ] OR A with [DP],Y

;--- Patch at file offset $13C5C2 (SNES $D3C5C2) ---
org $D3C5C2

    AND $6106,Y             ; [39 06 61   ] AND A with Absolute,Y
    ASL $047B,X             ; [1E 7B 04   ] Shift Left Absolute,X
    LDX $49,Y               ; [B6 49      ] Load X from DP,Y
    LDX $DE51               ; [AE 51 DE   ] Load X from Absolute
    AND ($BD,X)             ; [21 BD      ] AND A with (DP,X)
    MVP $00,$00             ; [44 00 00   ] Block Move Positive
    BRK                     ; [00 0F      ] Software interrupt
    AND ($1E,X)             ; [21 1E      ] AND A with (DP,X)
    AND $1C,S               ; [23 1C      ] AND A with Stack Relative
    TSB $69                 ; [04 69      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    EOR $00,X               ; [55 00      ] XOR A with DP,X
    AND $6002,Y             ; [39 02 60   ] AND A with Absolute,Y
    BVS $C5E2               ; [70 00      ] Branch if Overflow Set
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 F1      ] Software interrupt
    BRK                     ; [00 E1      ] Software interrupt
    BRK                     ; [00 E1      ] Software interrupt
    BRK                     ; [00 F3      ] Software interrupt
    BRK                     ; [00 6A      ] Software interrupt
    BRA $C5F1               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    BPL $C663               ; [10 6C      ] Branch if Plus
    BRL $8618               ; [82 1E C0   ] Branch Long
    TSB $0092               ; [0C 92 00   ] Test and Set Bits Absolute
    STY $D410               ; [8C 10 D4   ] Store Y to Absolute
    LDA $46,X               ; [B5 46      ] Load A from DP,X
    EOR ($00),Y             ; [51 00      ] XOR A with (DP),Y
    ADC ($20),Y             ; [71 20      ] Add with Carry (DP),Y
    PLB                     ; [AB         ] Pull Data Bank
    ORA ($B5),Y             ; [11 B5      ] OR A with (DP),Y
    TCD                     ; [5B         ] Transfer A to Direct Page

;--- Patch at file offset $13C614 (SNES $D3C614) ---
org $D3C614

    BIT $5502               ; [2C 02 55   ] Test Bits Absolute
    RTI                     ; [40         ] Return from Interrupt
    PHY                     ; [5A         ] Push Y Register

;--- Patch at file offset $13C621 (SNES $D3C621) ---
org $D3C621

    BCC $C6A1               ; [90 7E      ] Branch if Carry Clear
    db $BC, $7A                 ; Incomplete/data bytes

;--- Patch at file offset $13C630 (SNES $D3C630) ---
org $D3C630

    CLC                     ; [18         ] Clear Carry Flag
    INY                     ; [C8         ] Increment Y
    BIT $3C84,X             ; [3C 84 3C   ] Test Bits Absolute,X
    db $84                      ; Incomplete/data bytes

;--- Patch at file offset $13C662 (SNES $D3C662) ---
org $D3C662

    AND [$EE],Y             ; [37 EE      ] AND A with [DP],Y
    ROL $3EEC,X             ; [3E EC 3E   ] Rotate Left Absolute,X
    PEA $C43E               ; [F4 3E C4   ] Push Effective Absolute

;--- Patch at file offset $13C682 (SNES $D3C682) ---
org $D3C682

    ORA $FB06,Y             ; [19 06 FB   ] OR A with Absolute,Y
    TSB $87                 ; [04 87      ] Test and Set Bits in DP
    SEI                     ; [78         ] Set Interrupt Disable
    TDC                     ; [7B         ] Transfer Direct Page to A

;--- Patch at file offset $13C692 (SNES $D3C692) ---
org $D3C692

    BRK                     ; [00 0F      ] Software interrupt
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    ADC $040601,X           ; [7F 01 06 04] Add with Carry Absolute Long,X
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    BPL $C6CA               ; [10 2C      ] Branch if Plus
    BRK                     ; [00 62      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $C6A4               ; [F0 00      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 BF      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    LDA $000040,X           ; [BF 40 00 00] Load A from Absolute Long,X
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    JSR $B050               ; [20 50 B0   ] Jump to Subroutine
    PHP                     ; [08         ] Push Processor Status
    BNE $C6E8               ; [D0 2C      ] Branch if Not Equal
    CLC                     ; [18         ] Clear Carry Flag
    CPY $8C                 ; [C4 8C      ] Compare Y with DP
    db $62                      ; Incomplete/data bytes

;--- Patch at file offset $13C6D1 (SNES $D3C6D1) ---
org $D3C6D1

    db $55                      ; Incomplete/data bytes

;--- Patch at file offset $13C6E0 (SNES $D3C6E0) ---
org $D3C6E0

    LDA $40BE40,X           ; [BF 40 BE 40] Load A from Absolute Long,X
    db $2E, $DC                 ; Incomplete/data bytes

;--- Patch at file offset $13C6F0 (SNES $D3C6F0) ---
org $D3C6F0

    PHP                     ; [08         ] Push Processor Status
    LSR $10,X               ; [56 10      ] Shift Right DP,X
    JMP ($E41C)             ; [6C 1C E4   ] Jump Indirect

;--- Patch at file offset $13C726 (SNES $D3C726) ---
org $D3C726

    JML [$7CC8]             ; [DC C8 7C   ] Jump Long Indirect
    CLC                     ; [18         ] Clear Carry Flag

;--- Patch at file offset $13C742 (SNES $D3C742) ---
org $D3C742

    AND $6106,Y             ; [39 06 61   ] AND A with Absolute,Y
    ASL $047B,X             ; [1E 7B 04   ] Shift Left Absolute,X
    LDX $49,Y               ; [B6 49      ] Load X from DP,Y
    LDX $5E51               ; [AE 51 5E   ] Load X from Absolute
    AND ($B9,X)             ; [21 B9      ] AND A with (DP,X)
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    AND ($1E,X)             ; [21 1E      ] AND A with (DP,X)
    AND $1C,S               ; [23 1C      ] AND A with Stack Relative
    TSB $69                 ; [04 69      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    EOR $00,X               ; [55 00      ] XOR A with DP,X
    AND $6600,Y             ; [39 00 66   ] AND A with Absolute,Y
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRA $C771               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    BPL $C7D7               ; [10 60      ] Branch if Plus
    BCC $C7A9               ; [90 30      ] Branch if Carry Clear
    INY                     ; [C8         ] Increment Y
    BMI $C704               ; [30 88      ] Branch if Minus
    BMI $C70A               ; [30 8C      ] Branch if Minus
    CLC                     ; [18         ] Clear Carry Flag
    CPY $B7                 ; [C4 B7      ] Compare Y with DP
    RTI                     ; [40         ] Return from Interrupt
    EOR ($00),Y             ; [51 00      ] XOR A with (DP),Y
    db $17                      ; Incomplete/data bytes

;--- Patch at file offset $13C794 (SNES $D3C794) ---
org $D3C794

    PHP                     ; [08         ] Push Processor Status
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $13C7A0 (SNES $D3C7A0) ---
org $D3C7A0

    SBC $807F00,X           ; [FF 00 7F 80] Subtract with Borrow Absolute Long,X
    ADC $807F80,X           ; [7F 80 7F 80] Add with Carry Absolute Long,X
    SBC [$20]               ; [E7 20      ] Subtract with Borrow [DP]
    DEC $8A7C,X             ; [DE 7C 8A   ] Decrement Absolute,X
    SEI                     ; [78         ] Set Interrupt Disable
    TXA                     ; [8A         ] Transfer X to A
    SED                     ; [F8         ] Set Decimal Flag
    TRB $2A                 ; [14 2A      ] Test and Reset Bits DP
    TRB $AA                 ; [14 AA      ] Test and Reset Bits DP
    TSB $B2                 ; [04 B2      ] Test and Set Bits in DP
    BRK                     ; [00 86      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    INC                     ; [1A         ] Increment Accumulator
    db $7C                      ; Incomplete/data bytes

;--- Patch at file offset $13C7C2 (SNES $D3C7C2) ---
org $D3C7C2

    EOR ($00),Y             ; [51 00      ] XOR A with (DP),Y
    db $17                      ; Incomplete/data bytes

;--- Patch at file offset $13C7D4 (SNES $D3C7D4) ---
org $D3C7D4

    PHP                     ; [08         ] Push Processor Status
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $13C7E0 (SNES $D3C7E0) ---
org $D3C7E0

    SBC $807F00,X           ; [FF 00 7F 80] Subtract with Borrow Absolute Long,X
    ADC $807F80,X           ; [7F 80 7F 80] Add with Carry Absolute Long,X
    SBC [$20]               ; [E7 20      ] Subtract with Borrow [DP]
    DEC $8A7C,X             ; [DE 7C 8A   ] Decrement Absolute,X
    SEI                     ; [78         ] Set Interrupt Disable
    TXA                     ; [8A         ] Transfer X to A
    SED                     ; [F8         ] Set Decimal Flag
    TRB $2A                 ; [14 2A      ] Test and Reset Bits DP
    TRB $AA                 ; [14 AA      ] Test and Reset Bits DP
    TSB $B2                 ; [04 B2      ] Test and Set Bits in DP
    BRK                     ; [00 86      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    INC                     ; [1A         ] Increment Accumulator
    db $7C                      ; Incomplete/data bytes

;--- Patch at file offset $13CE42 (SNES $D3CE42) ---
org $D3CE42

    EOR ($00),Y             ; [51 00      ] XOR A with (DP),Y
    ADC ($00),Y             ; [71 00      ] Add with Carry (DP),Y
    TXY                     ; [9B         ] Transfer X to Y

;--- Patch at file offset $13CE54 (SNES $D3CE54) ---
org $D3CE54

    TSB $7402               ; [0C 02 74   ] Test and Set Bits Absolute
    db $70                      ; Incomplete/data bytes

;--- Patch at file offset $13CEA6 (SNES $D3CEA6) ---
org $D3CEA6

    ORA ($AE,S),Y           ; [13 AE      ] OR A with (SR),Y
    LDA ($EE,S),Y           ; [B3 EE      ] Load A from (SR),Y
    db $F2                      ; Incomplete/data bytes

;--- Patch at file offset $13CEB7 (SNES $D3CEB7) ---
org $D3CEB7

    CPX $4E                 ; [E4 4E      ] Compare X with DP
    CPX $0C                 ; [E4 0C      ] Compare X with DP
    db $E4                      ; Incomplete/data bytes

;--- Patch at file offset $13CF04 (SNES $D3CF04) ---
org $D3CF04

    AND ($00),Y             ; [31 00      ] AND A with (DP),Y
    TCD                     ; [5B         ] Transfer A to Direct Page

;--- Patch at file offset $13CF14 (SNES $D3CF14) ---
org $D3CF14

    TRB $3512               ; [1C 12 35   ] Test and Reset Bits Absolute
    db $31                      ; Incomplete/data bytes

;--- Patch at file offset $13CF28 (SNES $D3CF28) ---
org $D3CF28

    db $7F                      ; Incomplete/data bytes

;--- Patch at file offset $13CF39 (SNES $D3CF39) ---
org $D3CF39

    CLV                     ; [B8         ] Clear Overflow Flag

;--- Patch at file offset $13CF60 (SNES $D3CF60) ---
org $D3CF60

    SBC ($EE,S),Y           ; [F3 EE      ] Subtract with Borrow (SR),Y
    XCE                     ; [FB         ] Exchange Carry and Emulation
    INC $7B,X               ; [F6 7B      ] Increment DP,X
    ASL $97                 ; [06 97      ] Shift Left DP

;--- Patch at file offset $13CF71 (SNES $D3CF71) ---
org $D3CF71

    CPX $F4F6               ; [EC F6 F4   ] Compare X with Absolute
    INC $F4,X               ; [F6 F4      ] Increment DP,X
    PLY                     ; [7A         ] Pull Y Register
    SEI                     ; [78         ] Set Interrupt Disable

;--- Patch at file offset $13D084 (SNES $D3D084) ---
org $D3D084

    AND ($00,X)             ; [21 00      ] AND A with (DP,X)
    PLD                     ; [2B         ] Pull Direct Page Register

;--- Patch at file offset $13D094 (SNES $D3D094) ---
org $D3D094

    TRB $1412               ; [1C 12 14   ] Test and Reset Bits Absolute
    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $13D0C2 (SNES $D3D0C2) ---
org $D3D0C2

    EOR ($00),Y             ; [51 00      ] XOR A with (DP),Y
    AND ($00,X)             ; [21 00      ] AND A with (DP,X)
    ROL                     ; [2A         ] Rotate Left Accumulator

;--- Patch at file offset $13D0D4 (SNES $D3D0D4) ---
org $D3D0D4

    TRB $1512               ; [1C 12 15   ] Test and Reset Bits Absolute
    db $11                      ; Incomplete/data bytes

;--- Patch at file offset $13D0E0 (SNES $D3D0E0) ---
org $D3D0E0

    ROR $BF80,X             ; [7E 80 BF   ] Rotate Right Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    LDA $205F40,X           ; [BF 40 5F 20] Load A from Absolute Long,X
    SBC $E87F40,X           ; [FF 40 7F E8] Subtract with Borrow Absolute Long,X
    ADC $F83FF8,X           ; [7F F8 3F F8] Add with Carry Absolute Long,X
    TRB $E0                 ; [14 E0      ] Test and Reset Bits DP
    TRB $C2                 ; [14 C2      ] Test and Reset Bits DP
    BRK                     ; [00 4A      ] Software interrupt
    BRL $13A1               ; [82 A8 42   ] Branch Long
    TRB $EA                 ; [14 EA      ] Test and Reset Bits DP

;--- Patch at file offset $13D122 (SNES $D3D122) ---
org $D3D122

    DEC $3C                 ; [C6 3C      ] Decrement DP
    STA ($0E),Y             ; [91 0E      ] Store A to (DP),Y
    db $CD                      ; Incomplete/data bytes

;--- Patch at file offset $13D133 (SNES $D3D133) ---
org $D3D133

    PHP                     ; [08         ] Push Processor Status
    db $EE, $E6                 ; Incomplete/data bytes

;--- Patch at file offset $13D160 (SNES $D3D160) ---
org $D3D160

    ROR $7E9C,X             ; [7E 9C 7E   ] Rotate Right Absolute,X
    LDY $B87F,X             ; [BC 7F B8   ] Load Y from Absolute,X
    db $7F, $B8, $FF            ; Incomplete/data bytes

;--- Patch at file offset $13D174 (SNES $D3D174) ---
org $D3D174

    SEC                     ; [38         ] Set Carry Flag
    TSX                     ; [BA         ] Transfer Stack Pointer to X
    SEC                     ; [38         ] Set Carry Flag
    TSX                     ; [BA         ] Transfer Stack Pointer to X
    SEC                     ; [38         ] Set Carry Flag

;--- Patch at file offset $13D1A4 (SNES $D3D1A4) ---
org $D3D1A4

    db $05                      ; Incomplete/data bytes

;--- Patch at file offset $13D1E0 (SNES $D3D1E0) ---
org $D3D1E0

    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $13D204 (SNES $D3D204) ---
org $D3D204

    ADC ($00),Y             ; [71 00      ] Add with Carry (DP),Y
    RTL                     ; [6B         ] Return from Subroutine Long

;--- Patch at file offset $13D214 (SNES $D3D214) ---
org $D3D214

    TSB $1402               ; [0C 02 14   ] Test and Set Bits Absolute
    BPL $D237               ; [10 1E      ] Branch if Plus
    db $1E                      ; Incomplete/data bytes

;--- Patch at file offset $13D220 (SNES $D3D220) ---
org $D3D220

    ROR $7E9C,X             ; [7E 9C 7E   ] Rotate Right Absolute,X
    LDY $B87F,X             ; [BC 7F B8   ] Load Y from Absolute,X
    db $7F, $B8, $FF            ; Incomplete/data bytes

;--- Patch at file offset $13D234 (SNES $D3D234) ---
org $D3D234

    SEC                     ; [38         ] Set Carry Flag
    TSX                     ; [BA         ] Transfer Stack Pointer to X
    SEC                     ; [38         ] Set Carry Flag
    TSX                     ; [BA         ] Transfer Stack Pointer to X
    SEC                     ; [38         ] Set Carry Flag

;--- Patch at file offset $13D244 (SNES $D3D244) ---
org $D3D244

    AND [$18],Y             ; [37 18      ] AND A with [DP],Y
    AND $3C,S               ; [23 3C      ] AND A with Stack Relative
    AND $3C,S               ; [23 3C      ] AND A with Stack Relative
    PLY                     ; [7A         ] Pull Y Register
    db $25                      ; Incomplete/data bytes

;--- Patch at file offset $13D256 (SNES $D3D256) ---
org $D3D256

    AND $3D1D,X             ; [3D 1D 3D   ] AND A with Absolute,X
    ORA $0425,X             ; [1D 25 04   ] OR A with Absolute,X

;--- Patch at file offset $13D266 (SNES $D3D266) ---
org $D3D266

    STA ($0E,S),Y           ; [93 0E      ] Store A to (SR),Y
    ORA [$EA],Y             ; [17 EA      ] OR A with [DP],Y
    db $FF                      ; Incomplete/data bytes

;--- Patch at file offset $13D275 (SNES $D3D275) ---
org $D3D275

    CPY $ECEE               ; [CC EE EC   ] Compare Y with Absolute
    NOP                     ; [EA         ] No Operation
    INX                     ; [E8         ] Increment X

;--- Patch at file offset $13D2E6 (SNES $D3D2E6) ---
org $D3D2E6

    STA $00                 ; [85 00      ] Store A to DP
    db $DD                      ; Incomplete/data bytes

;--- Patch at file offset $13D2F6 (SNES $D3D2F6) ---
org $D3D2F6

    ROR $AE0E,X             ; [7E 0E AE   ] Rotate Right Absolute,X
    db $8E                      ; Incomplete/data bytes

;--- Patch at file offset $13D384 (SNES $D3D384) ---
org $D3D384

    LDA ($00),Y             ; [B1 00      ] Load A from (DP),Y
    LDX $00                 ; [A6 00      ] Load X from DP
    TYA                     ; [98         ] Transfer Y to A
    BRK                     ; [00 8C      ] Software interrupt
    BRK                     ; [00 FB      ] Software interrupt
    BMI $D40E               ; [30 7F      ] Branch if Minus
    AND ($00,S),Y           ; [33 00      ] AND A with (SR),Y
    PHA                     ; [48         ] Push Accumulator
    TSB $0C02               ; [0C 02 0C   ] Test and Set Bits Absolute
    WDM #$18                ; [42 18      ] Reserved (WDM)
    EOR ($63),Y             ; [51 63      ] XOR A with (DP),Y
    TSB $62                 ; [04 62      ] Test and Set Bits in DP
    ORA ($34),Y             ; [11 34      ] OR A with (DP),Y
    BIT $33,X               ; [34 33      ] Test Bits DP,X
    db $33                      ; Incomplete/data bytes

;--- Patch at file offset $13D3C2 (SNES $D3D3C2) ---
org $D3D3C2

    ADC ($00),Y             ; [71 00      ] Add with Carry (DP),Y
    LDA ($00),Y             ; [B1 00      ] Load A from (DP),Y
    LDX $9800               ; [AE 00 98   ] Load X from Absolute
    BRK                     ; [00 8C      ] Software interrupt
    BRK                     ; [00 FB      ] Software interrupt
    BMI $D44E               ; [30 7F      ] Branch if Minus
    AND ($00,S),Y           ; [33 00      ] AND A with (SR),Y
    PHA                     ; [48         ] Push Accumulator
    TSB $0C02               ; [0C 02 0C   ] Test and Set Bits Absolute
    WDM #$10                ; [42 10      ] Reserved (WDM)
    EOR ($63),Y             ; [51 63      ] XOR A with (DP),Y
    TSB $62                 ; [04 62      ] Test and Set Bits in DP
    ORA ($34),Y             ; [11 34      ] OR A with (DP),Y
    BIT $33,X               ; [34 33      ] Test Bits DP,X
    db $33                      ; Incomplete/data bytes

;--- Patch at file offset $14AC20 (SNES $D4AC20) ---
org $D4AC20

    CPY #$01                ; [C0 01      ] Compare Y Immediate

;--- Patch at file offset $14AC2C (SNES $D4AC2C) ---
org $D4AC2C

    LDY $34                 ; [A4 34      ] Load Y from DP
    STA $30,S               ; [83 30      ] Store A to Stack Relative

;--- Patch at file offset $14AC36 (SNES $D4AC36) ---
org $D4AC36

    INC $3C                 ; [E6 3C      ] Increment DP

;--- Patch at file offset $14AC60 (SNES $D4AC60) ---
org $D4AC60

    BRK                     ; [00 5C      ] Software interrupt

;--- Patch at file offset $14AC6C (SNES $D4AC6C) ---
org $D4AC6C

    SBC $01                 ; [E5 01      ] Subtract with Borrow DP
    RTI                     ; [40         ] Return from Interrupt
    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $14AC78 (SNES $D4AC78) ---
org $D4AC78

    TSC                     ; [3B         ] Transfer Stack Pointer to A
    JMP ($033F)             ; [6C 3F 03   ] Jump Indirect
    PHX                     ; [DA         ] Push X Register
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $14AD20 (SNES $D4AD20) ---
org $D4AD20

    LDY #$01                ; [A0 01      ] Load Y Immediate

;--- Patch at file offset $14AD60 (SNES $D4AD60) ---
org $D4AD60

    db $0F, $00                 ; Incomplete/data bytes

;--- End of patch ---