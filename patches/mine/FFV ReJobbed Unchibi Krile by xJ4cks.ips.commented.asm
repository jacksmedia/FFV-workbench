;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; FFV ReJobbed Unchibi Krile by xJ4cks.ips.commented.asm
;    Disassembled from IPS patch: FFV ReJobbed Unchibi Krile by xJ4cks.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 342 record(s)

;--- Patch at file offset $00FFDC (SNES $C0FFDC) ---
org $C0FFDC

    INY                     ; [C8         ] Increment Y
    ROR $37,X               ; [76 37      ] Rotate Right DP,X
    db $89                      ; Incomplete/data bytes

;--- Patch at file offset $141004 (SNES $D41004) ---
org $D41004

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $007F10             ; [2F 10 7F 00] AND A with Absolute Long

;--- Patch at file offset $141016 (SNES $D41016) ---
org $D41016

    BRK                     ; [00 00      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA [$18]               ; [07 18      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA [$3F],Y             ; [17 3F      ] OR A with [DP],Y
    AND $000000,X           ; [3F 00 00 00] AND A with Absolute Long,X
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 B8      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BNE $1049               ; [D0 10      ] Branch if Not Equal
    JSR $5880               ; [20 80 58   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $84                 ; [14 84      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    JMP $7F3F               ; [4C 3F 7F   ] Jump Absolute
    BMI $107B               ; [30 36      ] Branch if Minus
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $30                 ; [06 30      ] Shift Left DP
    BRK                     ; [00 59      ] Software interrupt
    BMI $10BE               ; [30 6F      ] Branch if Minus
    AND $193F,Y             ; [39 3F 19   ] AND A with Absolute,Y
    AND $11180F,X           ; [3F 0F 18 11] AND A with Absolute Long,X
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    ORA $34,S               ; [03 34      ] OR A with Stack Relative
    AND ($39)               ; [32 39      ] AND A with (DP)
    BMI $10DF               ; [30 7E      ] Branch if Minus
    BRA $1021               ; [80 BE      ] Branch Always
    CPX #$FC                ; [E0 FC      ] Compare X Immediate
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 CC      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    LDY $78,X               ; [B4 78      ] Load Y from DP,X
    CPX $68                 ; [E4 68      ] Compare X with DP
    CPX $68                 ; [E4 68      ] Compare X with DP
    INX                     ; [E8         ] Increment X
    CPX #$48                ; [E0 48      ] Compare X Immediate
    LDY #$4C                ; [A0 4C      ] Load Y Immediate
    BCC $107B               ; [90 00      ] Branch if Carry Clear
    STY $38                 ; [84 38      ] Store Y to DP
    SEC                     ; [38         ] Set Carry Flag
    SEI                     ; [78         ] Set Interrupt Disable
    SEI                     ; [78         ] Set Interrupt Disable
    STA $9F08,Y             ; [99 08 9F   ] Store A to Absolute,Y
    ASL $69                 ; [06 69      ] Shift Left DP
    ORA [$11]               ; [07 11      ] OR A with [DP]
    ORA $05000C             ; [0F 0C 00 05] OR A with Absolute Long
    BRK                     ; [00 07      ] Software interrupt
    ORA $07,S               ; [03 07      ] OR A with Stack Relative
    BRK                     ; [00 6E      ] Software interrupt
    ASL $40                 ; [06 40      ] Shift Left DP
    db $26                      ; Incomplete/data bytes

;--- Patch at file offset $14109A (SNES $D4109A) ---
org $D4109A

    COP #$01                ; [02 01      ] Coprocessor interrupt
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    JSR $2028               ; [20 28 20   ] Jump to Subroutine
    BEQ $10A6               ; [F0 00      ] Branch if Equal
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    BRA $10AA               ; [80 00      ] Branch Always
    BRA $10AC               ; [80 00      ] Branch Always
    BRA $10AE               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BNE $10E2               ; [D0 30      ] Branch if Not Equal
    BNE $10E4               ; [D0 30      ] Branch if Not Equal
    BRK                     ; [00 00      ] Software interrupt
    BRA $10B8               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1410C4 (SNES $D410C4) ---
org $D410C4

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $007F10             ; [2F 10 7F 00] AND A with Absolute Long

;--- Patch at file offset $1410D6 (SNES $D410D6) ---
org $D410D6

    BRK                     ; [00 00      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA [$18]               ; [07 18      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA [$3F],Y             ; [17 3F      ] OR A with [DP],Y
    AND $000000,X           ; [3F 00 00 00] AND A with Absolute Long,X
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 B8      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BVC $1109               ; [50 10      ] Branch if Overflow Clear
    LDY #$80                ; [A0 80      ] Load Y Immediate
    CLI                     ; [58         ] Clear Interrupt Disable
    INY                     ; [C8         ] Increment Y
    TRB $84                 ; [14 84      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    JMP $7F3F               ; [4C 3F 7F   ] Jump Absolute
    BMI $113B               ; [30 36      ] Branch if Minus
    BRK                     ; [00 14      ] Software interrupt
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $18                 ; [06 18      ] Shift Left DP
    BRK                     ; [00 65      ] Software interrupt
    BRK                     ; [00 E7      ] Software interrupt
    AND ($3F,X)             ; [21 3F      ] AND A with (DP,X)
    ORA $0F3F,Y             ; [19 3F 0F   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    ORA ($08),Y             ; [11 08      ] OR A with (DP),Y
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($04,X)             ; [01 04      ] OR A with (DP,X)
    ORA $18,S               ; [03 18      ] OR A with Stack Relative
    COP #$11                ; [02 11      ] Coprocessor interrupt
    PLP                     ; [28         ] Pull Processor Status
    ROR $BE80,X             ; [7E 80 BE   ] Rotate Right Absolute,X
    CPX #$FC                ; [E0 FC      ] Compare X Immediate
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BMI $1123               ; [30 F4      ] Branch if Minus
    SEI                     ; [78         ] Set Interrupt Disable
    CPX $68                 ; [E4 68      ] Compare X with DP
    CPX $68                 ; [E4 68      ] Compare X with DP
    CPX #$E8                ; [E0 E8      ] Compare X Immediate
    PHA                     ; [48         ] Push Accumulator
    LDY #$4C                ; [A0 4C      ] Load Y Immediate
    BCC $1147               ; [90 0C      ] Branch if Carry Clear
    BRA $116D               ; [80 30      ] Branch Always
    BIT $78,X               ; [34 78      ] Test Bits DP,X
    SEI                     ; [78         ] Set Interrupt Disable
    STA $8F11,Y             ; [99 11 8F   ] Store A to Absolute,Y
    ORA [$59]               ; [07 59      ] OR A with [DP]
    ORA [$31]               ; [07 31      ] OR A with [DP]
    ORA $360012             ; [0F 12 00 36] OR A with Absolute Long
    BPL $118A               ; [10 3D      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 67      ] Software interrupt
    db $76                      ; Incomplete/data bytes

;--- Patch at file offset $14115A (SNES $D4115A) ---
org $D4115A

    ORA #$14                ; [09 14      ] OR A with Immediate
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY $F488               ; [CC 88 F4   ] Compare Y with Absolute
    BMI $1131               ; [30 CC      ] Branch if Minus
    DEY                     ; [88         ] Decrement Y
    INY                     ; [C8         ] Increment Y
    BRA $1199               ; [80 30      ] Branch Always
    BRK                     ; [00 E0      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CLV                     ; [B8         ] Clear Overflow Flag
    SEC                     ; [38         ] Set Carry Flag
    PHP                     ; [08         ] Push Processor Status
    SEC                     ; [38         ] Set Carry Flag
    LDY #$18                ; [A0 18      ] Load Y Immediate
    LDY #$10                ; [A0 10      ] Load Y Immediate
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    STA $9F08,Y             ; [99 08 9F   ] Store A to Absolute,Y
    ASL $6B                 ; [06 6B      ] Shift Left DP
    ORA [$11]               ; [07 11      ] OR A with [DP]
    ORA $7E0022             ; [0F 22 00 7E] OR A with Absolute Long
    BMI $11CA               ; [30 3D      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 6E      ] Software interrupt
    ASL $40                 ; [06 40      ] Shift Left DP
    db $26                      ; Incomplete/data bytes

;--- Patch at file offset $14119A (SNES $D4119A) ---
org $D4119A

    ORA ($3C,X)             ; [01 3C      ] OR A with (DP,X)
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    JSR $2028               ; [20 28 20   ] Jump to Subroutine
    BEQ $11A6               ; [F0 00      ] Branch if Equal
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BEQ $116E               ; [F0 C0      ] Branch if Equal
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BNE $11E2               ; [D0 30      ] Branch if Not Equal
    BNE $11E4               ; [D0 30      ] Branch if Not Equal
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt

;--- Patch at file offset $1411C8 (SNES $D411C8) ---
org $D411C8

    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    db $0F, $00                 ; Incomplete/data bytes

;--- Patch at file offset $1411DB (SNES $D411DB) ---
org $D411DB

    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1411E8 (SNES $D411E8) ---
org $D411E8

    BRK                     ; [00 00      ] Software interrupt
    BEQ $11EC               ; [F0 00      ] Branch if Equal
    PHP                     ; [08         ] Push Processor Status
    BEQ $11E3               ; [F0 F4      ] Branch if Equal
    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $1411FA (SNES $D411FA) ---
org $D411FA

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BEQ $1208               ; [F0 08      ] Branch if Equal
    AND ($0C,S),Y           ; [33 0C      ] AND A with (SR),Y
    EOR $609F30             ; [4F 30 9F 60] XOR A with Absolute Long
    SBC $BF1F,Y             ; [F9 1F BF   ] Subtract with Borrow Absolute,Y
    BVS $1280               ; [70 75      ] Branch if Overflow Set
    BRK                     ; [00 29      ] Software interrupt
    TSB $29                 ; [04 29      ] Test and Set Bits in DP
    TSB $0F00               ; [0C 00 0F   ] Test and Set Bits Absolute
    ORA $7E1F30             ; [0F 30 1F 7E] OR A with Absolute Long
    ADC $6F7F72,X           ; [7F 72 7F 6F] Add with Carry Absolute Long,X
    AND ($3A),Y             ; [31 3A      ] AND A with (DP),Y
    BPL $1221               ; [10 03      ] Branch if Plus
    BPL $1223               ; [10 03      ] Branch if Plus
    INC $FE00,X             ; [FE 00 FE   ] Increment Absolute,X
    BRK                     ; [00 FE      ] Software interrupt
    JSR $C03E               ; [20 3E C0   ] Jump to Subroutine
    JSR ($FC00,X)           ; [FC 00 FC   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    TSB $08                 ; [04 08      ] Test and Set Bits in DP
    PEI ($E8)               ; [D4 E8      ] Push Effective Indirect
    CPX $E8                 ; [E4 E8      ] Compare X with DP
    STZ $C0                 ; [64 C0      ] Store Zero to DP
    INX                     ; [E8         ] Increment X
    BRA $12A4               ; [80 68      ] Branch Always
    PHA                     ; [48         ] Push Accumulator
    LDY $88                 ; [A4 88      ] Load Y from DP
    MVN $68,$0C             ; [54 68 0C   ] Block Move Negative

;--- Patch at file offset $141248 (SNES $D41248) ---
org $D41248

    AND [$03]               ; [27 03      ] AND A with [DP]
    LSR $10,X               ; [56 10      ] Shift Right DP,X
    XCE                     ; [FB         ] Exchange Carry and Emulation
    ADC ($F1,X)             ; [61 F1      ] Add with Carry (DP,X)
    BRK                     ; [00 10      ] Software interrupt
    ORA $5C,S               ; [03 5C      ] OR A with Stack Relative
    EOR $60,S               ; [43 60      ] XOR A with Stack Relative
    JMP ($2122)             ; [6C 22 21   ] Jump Indirect

;--- Patch at file offset $141260 (SNES $D41260) ---
org $D41260

    ROR $CC00,X             ; [7E 00 CC   ] Rotate Right Absolute,X
    SEC                     ; [38         ] Set Carry Flag
    STZ $E878               ; [9C 78 E8   ] Store Zero to Absolute
    CPX #$C4                ; [E0 C4      ] Compare X Immediate
    BRK                     ; [00 5C      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    SEP #$80                ; [E2 80      ] Set Processor Status Bits
    DEC $8000,X             ; [DE 00 80   ] Decrement Absolute,X
    MVP $38,$38             ; [44 38 38   ] Block Move Positive
    SEI                     ; [78         ] Set Interrupt Disable
    SEI                     ; [78         ] Set Interrupt Disable
    BEQ $12E8               ; [F0 70      ] Branch if Equal
    SEC                     ; [38         ] Set Carry Flag
    SEC                     ; [38         ] Set Carry Flag
    JSR $18B8               ; [20 B8 18   ] Jump to Subroutine
    STY $00                 ; [84 00      ] Store Y to DP
    BRK                     ; [00 4C      ] Software interrupt
    AND $36307F,X           ; [3F 7F 30 36] AND A with Absolute Long,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $10                 ; [06 10      ] Shift Left DP
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    ORA #$3F                ; [09 3F      ] OR A with Immediate
    ORA $0F3F,Y             ; [19 3F 0F   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    ORA ($08),Y             ; [11 08      ] OR A with (DP),Y
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($04,X)             ; [01 04      ] OR A with (DP,X)
    COP #$09                ; [02 09      ] Coprocessor interrupt
    BRK                     ; [00 19      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA $070B06             ; [0F 06 0B 07] OR A with Absolute Long
    ORA ($0F),Y             ; [11 0F      ] OR A with (DP),Y
    JSL $307E00             ; [22 00 7E 30] Jump to Subroutine Long
    AND $0808,X             ; [3D 08 08   ] AND A with Absolute,X
    BRK                     ; [00 0E      ] Software interrupt
    ASL $00                 ; [06 00      ] Shift Left DP
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $1412BA (SNES $D412BA) ---
org $D412BA

    ORA ($3C,X)             ; [01 3C      ] OR A with (DP,X)
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    JMP $7F3F               ; [4C 3F 7F   ] Jump Absolute
    BMI $12FB               ; [30 36      ] Branch if Minus
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $11                 ; [06 11      ] Shift Left DP
    BRK                     ; [00 0A      ] Software interrupt
    ORA ($1D,X)             ; [01 1D      ] OR A with (DP,X)
    ORA ($3F,X)             ; [01 3F      ] OR A with (DP,X)
    ORA $0F3F,Y             ; [19 3F 0F   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    ORA ($08),Y             ; [11 08      ] OR A with (DP),Y
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 05      ] Software interrupt
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    ORA $7E,S               ; [03 7E      ] OR A with Stack Relative
    BRA $12A1               ; [80 BE      ] Branch Always
    CPX #$FC                ; [E0 FC      ] Compare X Immediate
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRA $12AB               ; [80 BC      ] Branch Always
    CPY #$E4                ; [C0 E4      ] Compare Y Immediate
    PLA                     ; [68         ] Pull Accumulator
    CPX $68                 ; [E4 68      ] Compare X with DP
    CPX #$E8                ; [E0 E8      ] Compare X Immediate
    PHA                     ; [48         ] Push Accumulator
    LDY #$4C                ; [A0 4C      ] Load Y Immediate
    BCC $1307               ; [90 0C      ] Branch if Carry Clear
    BPL $1285               ; [10 88      ] Branch if Plus
    STY $D0,X               ; [94 D0      ] Store Y to DP,X
    INY                     ; [C8         ] Increment Y

;--- Patch at file offset $141306 (SNES $D41306) ---
org $D41306

    ORA ($0F),Y             ; [11 0F      ] OR A with (DP),Y
    JSL $307E00             ; [22 00 7E 30] Jump to Subroutine Long
    db $3D                      ; Incomplete/data bytes

;--- Patch at file offset $14131A (SNES $D4131A) ---
org $D4131A

    ORA ($3C,X)             ; [01 3C      ] OR A with (DP,X)
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    RTS                     ; [60         ] Return from Subroutine
    BEQ $12A4               ; [F0 80      ] Branch if Equal
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPX #$80                ; [E0 80      ] Compare X Immediate
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    BRA $1334               ; [80 00      ] Branch Always
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $1338               ; [80 00      ] Branch Always
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BEQ $1346               ; [F0 00      ] Branch if Equal
    CLV                     ; [B8         ] Clear Overflow Flag
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BNE $1369               ; [D0 10      ] Branch if Not Equal
    JSR $5880               ; [20 80 58   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $84                 ; [14 84      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    ROR $BE80,X             ; [7E 80 BE   ] Rotate Right Absolute,X
    CPX #$FC                ; [E0 FC      ] Compare X Immediate
    BRK                     ; [00 A4      ] Software interrupt
    BRK                     ; [00 64      ] Software interrupt
    JSR $30BE               ; [20 BE 30   ] Jump to Subroutine
    STX $1C00               ; [8E 00 1C   ] Store X to Absolute
    BRK                     ; [00 E4      ] Software interrupt
    PLA                     ; [68         ] Pull Accumulator
    CPX $68                 ; [E4 68      ] Compare X with DP
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    CLI                     ; [58         ] Clear Interrupt Disable
    BRA $1379               ; [80 00      ] Branch Always
    CLV                     ; [B8         ] Clear Overflow Flag
    MVP $70,$70             ; [44 70 70   ] Block Move Positive
    STZ $E0,X               ; [74 E0      ] Store Zero to DP,X
    INX                     ; [E8         ] Increment X

;--- Patch at file offset $141388 (SNES $D41388) ---
org $D41388

    JSL $347E00             ; [22 00 7E 34] Jump to Subroutine Long
    db $3D                      ; Incomplete/data bytes

;--- Patch at file offset $14139A (SNES $D4139A) ---
org $D4139A

    ORA ($3C,X)             ; [01 3C      ] OR A with (DP,X)
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CLV                     ; [B8         ] Clear Overflow Flag
    BRA $1393               ; [80 F0      ] Branch Always
    BRK                     ; [00 F0      ] Software interrupt
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    BRA $1409               ; [80 60      ] Branch Always
    BRK                     ; [00 F0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    BRK                     ; [00 20      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $13B8               ; [80 00      ] Branch Always
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt

;--- Patch at file offset $1413C4 (SNES $D413C4) ---
org $D413C4

    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $007F10             ; [2F 10 7F 00] AND A with Absolute Long
    db $4C, $3F                 ; Incomplete/data bytes

;--- Patch at file offset $1413D6 (SNES $D413D6) ---
org $D413D6

    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA [$18]               ; [07 18      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA [$3F],Y             ; [17 3F      ] OR A with [DP],Y
    AND $00193F,X           ; [3F 3F 19 00] AND A with Absolute Long,X
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 B8      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    PEI ($28)               ; [D4 28      ] Push Effective Indirect
    PLX                     ; [FA         ] Pull X Register
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRA $13F1               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BVC $1407               ; [50 10      ] Branch if Overflow Clear
    TAY                     ; [A8         ] Transfer A to Y
    DEY                     ; [88         ] Decrement Y
    MVN $C8,$14             ; [54 C8 14   ] Block Move Negative
    BRA $13EA               ; [80 EC      ] Branch Always
    CPX $68                 ; [E4 68      ] Compare X with DP
    ADC $043630,X           ; [7F 30 36 04] Add with Carry Absolute Long,X
    STZ $06,X               ; [74 06      ] Store Zero to DP,X
    STY $06,X               ; [94 06      ] Store Y to DP,X
    BEQ $144A               ; [F0 40      ] Branch if Equal
    CLI                     ; [58         ] Clear Interrupt Disable
    ORA ($2E),Y             ; [11 2E      ] OR A with (DP),Y
    ORA $0919,Y             ; [19 19 09   ] OR A with Absolute,Y
    AND $11180F,X           ; [3F 0F 18 11] AND A with Absolute Long,X
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ADC ($0E,X)             ; [61 0E      ] Add with Carry (DP,X)
    EOR ($37,X)             ; [41 37      ] XOR A with (DP,X)
    AND ($19),Y             ; [31 19      ] AND A with (DP),Y
    ORA ($0F),Y             ; [11 0F      ] OR A with (DP),Y
    ORA [$BC]               ; [07 BC      ] OR A with [DP]
    RTS                     ; [60         ] Return from Subroutine
    DEC $CE00               ; [CE 00 CE   ] Decrement Absolute
    BRK                     ; [00 7E      ] Software interrupt
    BVS $13C7               ; [70 9E      ] Branch if Overflow Set
    BRK                     ; [00 9C      ] Software interrupt
    BRA $1445               ; [80 18      ] Branch Always
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    INX                     ; [E8         ] Increment X
    BMI $13B8               ; [30 84      ] Branch if Minus
    BIT $90                 ; [24 90      ] Test Bits DP
    TSB $F0                 ; [04 F0      ] Test and Set Bits in DP
    PLA                     ; [68         ] Pull Accumulator
    STZ $E8                 ; [64 E8      ] Store Zero to DP
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPY #$0F                ; [C0 0F      ] Compare Y Immediate
    ORA [$0B]               ; [07 0B      ] OR A with [DP]
    ORA [$09]               ; [07 09      ] OR A with [DP]
    ORA [$04]               ; [07 04      ] OR A with [DP]
    BRK                     ; [00 05      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    COP #$06                ; [02 06      ] Coprocessor interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA [$07]               ; [07 07      ] OR A with [DP]
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA $02,S               ; [03 02      ] OR A with Stack Relative
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    COP #$00                ; [02 00      ] Coprocessor interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRA $13E7               ; [80 80      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $141482 (SNES $D41482) ---
org $D41482

    BRK                     ; [00 00      ] Software interrupt
    ASL $3100               ; [0E 00 31   ] Shift Left Absolute
    ASL $215E               ; [0E 5E 21   ] Shift Left Absolute
    LDA $BB42,X             ; [BD 42 BB   ] Load A from Absolute,X
    MVP $BF,$40             ; [44 BF 40   ] Block Move Positive
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    AND $21                 ; [25 21      ] AND A with Direct Page
    PHY                     ; [5A         ] Push Y Register
    AND $54,S               ; [23 54      ] AND A with Stack Relative
    AND $00004E             ; [2F 4E 00 00] AND A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    SEI                     ; [78         ] Set Interrupt Disable
    BRA $14A7               ; [80 FC      ] Branch Always
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 9E      ] Software interrupt

;--- Patch at file offset $1414B6 (SNES $D414B6) ---
org $D414B6

    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    LDY #$F0                ; [A0 F0      ] Load Y Immediate
    PHP                     ; [08         ] Push Processor Status
    TYA                     ; [98         ] Transfer Y to A
    RTS                     ; [60         ] Return from Subroutine
    PHA                     ; [48         ] Push Accumulator
    LDY $73,X               ; [B4 73      ] Load Y from DP,X
    ASL $017E               ; [0E 7E 01   ] Shift Left Absolute
    ADC $00F300,X           ; [7F 00 F3 00] Add with Carry Absolute Long,X
    JSR ($4418,X)           ; [FC 18 44   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 46      ] Software interrupt
    BRK                     ; [00 25      ] Software interrupt
    COP #$2F                ; [02 2F      ] Coprocessor interrupt
    ORA [$2F]               ; [07 2F      ] OR A with [DP]
    ASL $2301               ; [0E 01 23   ] Shift Left Absolute
    JMP $4120               ; [4C 20 41   ] Jump Absolute
    INC                     ; [1A         ] Increment Accumulator
    AND $393A,Y             ; [39 3A 39   ] AND A with Absolute,Y
    SEC                     ; [38         ] Set Carry Flag
    INC                     ; [1A         ] Increment Accumulator
    CLC                     ; [18         ] Clear Carry Flag
    INC $6600,X             ; [FE 00 66   ] Increment Absolute,X
    JSR ($00FC,X)           ; [FC FC 00   ] Jump to Subroutine Indirect,X
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 A8      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    BRK                     ; [00 52      ] Software interrupt
    TSB $04FA               ; [0C FA 04   ] Test and Set Bits Absolute
    JSR ($FCFC,X)           ; [FC FC FC   ] Jump to Subroutine Indirect,X
    CPY $F8F8               ; [CC F8 F8   ] Compare Y with Absolute
    CPX #$00                ; [E0 00      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    BPL $14DB               ; [10 E0      ] Branch if Plus
    BPL $1489               ; [10 8C      ] Branch if Plus
    BIT $0404               ; [2C 04 04   ] Test Bits Absolute
    ASL $3900,X             ; [1E 00 39   ] Shift Left Absolute,X
    ORA $77,S               ; [03 77      ] OR A with Stack Relative
    AND $3F,X               ; [35 3F      ] AND A with DP,X
    ORA $123E,Y             ; [19 3E 12   ] OR A with Absolute,Y
    ORA $020707,X           ; [1F 07 07 02] OR A with Absolute Long,X

;--- Patch at file offset $141516 (SNES $D41516) ---
org $D41516

    BRK                     ; [00 1D      ] Software interrupt
    ORA ($12,X)             ; [01 12      ] OR A with (DP,X)
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    INC $C0                 ; [E6 C0      ] Increment DP
    STY $10,X               ; [94 10      ] Store Y to DP,X
    TYA                     ; [98         ] Transfer Y to A
    BPL $1523               ; [10 FC      ] Branch if Plus
    DEY                     ; [88         ] Decrement Y
    TYA                     ; [98         ] Transfer Y to A
    BRA $14CB               ; [80 A0      ] Branch Always
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 D8      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    PLA                     ; [68         ] Pull Accumulator
    CLC                     ; [18         ] Clear Carry Flag
    RTI                     ; [40         ] Return from Interrupt
    BMI $14BF               ; [30 88      ] Branch if Minus
    BRK                     ; [00 00      ] Software interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $141544 (SNES $D41544) ---
org $D41544

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $007F10             ; [2F 10 7F 00] AND A with Absolute Long

;--- Patch at file offset $141556 (SNES $D41556) ---
org $D41556

    BRK                     ; [00 00      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA [$18]               ; [07 18      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA [$3F],Y             ; [17 3F      ] OR A with [DP],Y
    AND $000000,X           ; [3F 00 00 00] AND A with Absolute Long,X
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 B8      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BNE $1589               ; [D0 10      ] Branch if Not Equal
    JSR $5880               ; [20 80 58   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    JMP $7F3F               ; [4C 3F 7F   ] Jump Absolute
    BMI $15B5               ; [30 30      ] Branch if Minus
    BRK                     ; [00 11      ] Software interrupt
    BRK                     ; [00 1A      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 B9      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    SBC [$61]               ; [E7 61      ] Subtract with Borrow [DP]
    AND $0F3F19,X           ; [3F 19 3F 0F] AND A with Absolute Long,X
    ASL $19,X               ; [16 19      ] Shift Left DP,X
    ASL $0500               ; [0E 00 05   ] Shift Left Absolute
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    ROR $59                 ; [66 59      ] Rotate Right DP
    RTS                     ; [60         ] Return from Subroutine
    INC $3E00,X             ; [FE 00 3E   ] Increment Absolute,X
    CPX #$FC                ; [E0 FC      ] Compare X Immediate
    BRK                     ; [00 5C      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 CC      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    LDX $7C,Y               ; [B6 7C      ] Load X from DP,Y
    CPX $E8                 ; [E4 E8      ] Compare X with DP
    CPX $68                 ; [E4 68      ] Compare X with DP
    INX                     ; [E8         ] Increment X
    CPX #$A8                ; [E0 A8      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    STY $48,X               ; [94 48      ] Store Y to DP,X
    BRK                     ; [00 84      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    SEC                     ; [38         ] Set Carry Flag
    JMP ($4C7C,X)           ; [7C 7C 4C   ] Jump Indirect,X
    AND $30307F,X           ; [3F 7F 30 30] AND A with Absolute Long,X
    BRK                     ; [00 11      ] Software interrupt
    BRK                     ; [00 1A      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 B9      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    SBC [$61]               ; [E7 61      ] Subtract with Borrow [DP]
    AND $0F3F19,X           ; [3F 19 3F 0F] AND A with Absolute Long,X
    ASL $19,X               ; [16 19      ] Shift Left DP,X
    ASL $0500               ; [0E 00 05   ] Shift Left Absolute
    BRK                     ; [00 07      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    RTS                     ; [60         ] Return from Subroutine
    ROR $59                 ; [66 59      ] Rotate Right DP
    RTS                     ; [60         ] Return from Subroutine
    INC $3E00,X             ; [FE 00 3E   ] Increment Absolute,X
    CPX #$FC                ; [E0 FC      ] Compare X Immediate
    BRK                     ; [00 5C      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 CC      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    LDX $7C,Y               ; [B6 7C      ] Load X from DP,Y
    CPX $E8                 ; [E4 E8      ] Compare X with DP
    CPX $68                 ; [E4 68      ] Compare X with DP
    INX                     ; [E8         ] Increment X
    CPX #$A8                ; [E0 A8      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    STY $48,X               ; [94 48      ] Store Y to DP,X
    BRK                     ; [00 84      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    SEC                     ; [38         ] Set Carry Flag
    JMP ($007C,X)           ; [7C 7C 00   ] Jump Indirect,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 19      ] Software interrupt
    ASL $27                 ; [06 27      ] Shift Left DP
    CLC                     ; [18         ] Clear Carry Flag
    AND $215810             ; [2F 10 58 21] AND A with Absolute Long

;--- Patch at file offset $141616 (SNES $D41616) ---
org $D41616

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $164F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    STY $5400               ; [8C 00 54   ] Store Y to Absolute
    DEY                     ; [88         ] Decrement Y
    BIT $D4D8               ; [2C D8 D4   ] Test Bits Absolute
    SEC                     ; [38         ] Set Carry Flag
    PEA $FE18               ; [F4 18 FE   ] Push Effective Absolute
    TRB $CC38               ; [1C 38 CC   ] Test and Reset Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    DEY                     ; [88         ] Decrement Y
    BRK                     ; [00 D8      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    SEC                     ; [38         ] Set Carry Flag
    PHP                     ; [08         ] Push Processor Status
    TYA                     ; [98         ] Transfer Y to A
    PHA                     ; [48         ] Push Accumulator
    JML [$0C00]             ; [DC 00 0C   ] Jump Long Indirect
    CPX $51                 ; [E4 51      ] Compare X with DP
    JSR $002C               ; [20 2C 00   ] Jump to Subroutine
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BIT $06,X               ; [34 06      ] Test Bits DP,X
    AND ($00),Y             ; [31 00      ] AND A with (DP),Y
    PLP                     ; [28         ] Pull Processor Status
    ORA ($6E),Y             ; [11 6E      ] OR A with (DP),Y
    PHD                     ; [0B         ] Push Direct Page Register
    ASL $39                 ; [06 39      ] Shift Left DP
    COP #$11                ; [02 11      ] Coprocessor interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 17      ] Software interrupt
    BRK                     ; [00 1B      ] Software interrupt
    BPL $1657               ; [10 F6      ] Branch if Plus
    TSB $00FE               ; [0C FE 00   ] Test and Set Bits Absolute
    INC $FE00,X             ; [FE 00 FE   ] Increment Absolute,X
    BRK                     ; [00 F4      ] Software interrupt
    BRA $15EF               ; [80 84      ] Branch Always
    PHP                     ; [08         ] Push Processor Status
    CLC                     ; [18         ] Clear Carry Flag
    BMI $1653               ; [30 E4      ] Branch if Minus
    SEI                     ; [78         ] Set Interrupt Disable
    CPY $4020               ; [CC 20 40   ] Compare Y with Absolute
    LDY $08                 ; [A4 08      ] Load Y from DP
    PEI ($00)               ; [D4 00      ] Push Effective Indirect
    MVN $88,$08             ; [54 88 08   ] Block Move Negative
    SEI                     ; [78         ] Set Interrupt Disable
    BVS $166D               ; [70 F0      ] Branch if Overflow Set
    CPY #$78                ; [C0 78      ] Compare Y Immediate
    BRK                     ; [00 91      ] Software interrupt
    ASL $9F                 ; [06 9F      ] Shift Left DP
    ORA $68                 ; [05 68      ] OR A with Direct Page
    ORA [$0B]               ; [07 0B      ] OR A with [DP]

;--- Patch at file offset $141690 (SNES $D41690) ---
org $D41690

    ROR $4108               ; [6E 08 41   ] Rotate Right Absolute
    BIT $07                 ; [24 07      ] Test Bits DP
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $1416A0 (SNES $D416A0) ---
org $D416A0

    ROL $3C1C,X             ; [3E 1C 3C   ] Rotate Left Absolute,X
    JSR $80E4               ; [20 E4 80   ] Jump to Subroutine
    MVP $B0,$C4             ; [44 B0 C4   ] Block Move Positive
    BMI $164F               ; [30 A4      ] Branch if Minus
    BPL $163F               ; [10 92      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    ASL $DC00               ; [0E 00 DC   ] Shift Left Absolute
    BRK                     ; [00 E0      ] Software interrupt
    JSR $1898               ; [20 98 18   ] Jump to Subroutine
    CLV                     ; [B8         ] Clear Overflow Flag
    PHP                     ; [08         ] Push Processor Status
    SEC                     ; [38         ] Set Carry Flag
    PHP                     ; [08         ] Push Processor Status
    CLC                     ; [18         ] Clear Carry Flag
    PHP                     ; [08         ] Push Processor Status
    TSB $0004               ; [0C 04 00   ] Test and Set Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    BRK                     ; [00 0C      ] Software interrupt
    ORA $13,S               ; [03 13      ] OR A with Stack Relative
    TSB $102F               ; [0C 2F 10   ] Test and Set Bits Absolute
    BIT $0010               ; [2C 10 00   ] Test Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    TSB $130C               ; [0C 0C 13   ] Test and Set Bits Absolute
    PHP                     ; [08         ] Push Processor Status
    ORA [$00],Y             ; [17 00      ] OR A with [DP],Y
    BRK                     ; [00 D8      ] Software interrupt
    BRK                     ; [00 78      ] Software interrupt
    BNE $1693               ; [D0 AC      ] Branch if Not Equal
    BVS $16D7               ; [70 EE      ] Branch if Overflow Set
    BPL $16E9               ; [10 FE      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    DEC $28,X               ; [D6 28      ] Decrement DP,X
    AND $0000C0,X           ; [3F C0 00 00] AND A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BNE $1676               ; [D0 80      ] Branch if Not Equal
    BVS $1708               ; [70 10      ] Branch if Overflow Set
    BPL $168E               ; [10 94      ] Branch if Plus
    INY                     ; [C8         ] Increment Y
    JSR $2CC8               ; [20 C8 2C   ] Jump to Subroutine
    JSR $28D2               ; [20 D2 28   ] Jump to Subroutine
    BPL $1716               ; [10 13      ] Branch if Plus
    BRK                     ; [00 3E      ] Software interrupt
    ORA ($2A,X)             ; [01 2A      ] OR A with (DP,X)
    ORA $2A,S               ; [03 2A      ] OR A with Stack Relative
    ORA ($18,S),Y           ; [13 18      ] OR A with (SR),Y
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 39      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    ORA $1C,S               ; [03 1C      ] OR A with Stack Relative
    TSB $08                 ; [04 08      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    TRB $10                 ; [14 10      ] Test and Reset Bits DP
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    ORA [$00]               ; [07 00      ] OR A with [DP]
    BRK                     ; [00 00      ] Software interrupt
    ASL $FF18,X             ; [1E 18 FF   ] Shift Left Absolute,X
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 3F      ] Software interrupt
    BRK                     ; [00 3A      ] Software interrupt
    BRK                     ; [00 72      ] Software interrupt
    MVP $CC,$00             ; [44 CC 00   ] Block Move Positive
    JMP $5E88               ; [4C 88 5E   ] Jump Absolute
    LDY $B240,X             ; [BC 40 B2   ] Load Y from Absolute,X
    JSR $02D4               ; [20 D4 02   ] Jump to Subroutine
    INX                     ; [E8         ] Increment X
    TSB $E4                 ; [04 E4      ] Test and Set Bits in DP
    JMP $3088               ; [4C 88 30   ] Jump Absolute
    BRK                     ; [00 A8      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    LDY $293C,X             ; [BC 3C 29   ] Load Y from Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    ORA $030D00,X           ; [1F 00 0D 03] OR A with Absolute Long,X
    ORA [$00],Y             ; [17 00      ] OR A with [DP],Y
    JSL $183B00             ; [22 00 3B 18] Jump to Subroutine Long
    LSR $39                 ; [46 39      ] Shift Right DP
    AND $1C00,X             ; [3D 00 1C   ] AND A with Absolute,X
    INC                     ; [1A         ] Increment Accumulator
    BRK                     ; [00 00      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 19      ] Software interrupt
    TSB $18                 ; [04 18      ] Test and Set Bits in DP
    TSB $39                 ; [04 39      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 66      ] Software interrupt
    JML [$08F4]             ; [DC F4 08   ] Jump Long Indirect
    CPY $2430               ; [CC 30 24   ] Compare Y with Absolute
    BPL $177D               ; [10 14      ] Branch if Plus
    BRK                     ; [00 32      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    DEX                     ; [CA         ] Decrement X
    STZ $FC,X               ; [74 FC      ] Store Zero to DP,X
    BRK                     ; [00 DC      ] Software interrupt
    TRB $0808               ; [1C 08 08   ] Test and Reset Bits Absolute
    BMI $1776               ; [30 00      ] Branch if Minus
    CLC                     ; [18         ] Clear Carry Flag
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    PLP                     ; [28         ] Pull Processor Status
    CPX $7404               ; [EC 04 74   ] Compare X with Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 91      ] Software interrupt
    ASL $9F                 ; [06 9F      ] Shift Left DP
    ORA $69                 ; [05 69      ] OR A with Direct Page
    ASL $14                 ; [06 14      ] Shift Left DP
    COP #$32                ; [02 32      ] Coprocessor interrupt
    BPL $17D5               ; [10 4A      ] Branch if Plus
    SEC                     ; [38         ] Set Carry Flag
    AND $08,X               ; [35 08      ] AND A with DP,X
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 6E      ] Software interrupt

;--- Patch at file offset $141797 (SNES $D41797) ---
org $D41797

    ORA ($19,X)             ; [01 19      ] OR A with (DP,X)
    TSB $39                 ; [04 39      ] Test and Set Bits in DP
    TSB $08                 ; [04 08      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    TRB $203C               ; [1C 3C 20   ] Test and Reset Bits Absolute
    PEA $5440               ; [F4 40 54   ] Push Effective Absolute
    JSR $5064               ; [20 64 50   ] Jump to Subroutine
    PEI ($E0)               ; [D4 E0      ] Push Effective Indirect
    AND ($C8)               ; [32 C8      ] AND A with (DP)
    DEC $DC00               ; [CE 00 DC   ] Decrement Absolute
    BRK                     ; [00 E0      ] Software interrupt
    JSR $0848               ; [20 48 08   ] Jump to Subroutine
    PLP                     ; [28         ] Pull Processor Status
    DEY                     ; [88         ] Decrement Y
    CLI                     ; [58         ] Clear Interrupt Disable
    DEY                     ; [88         ] Decrement Y
    INX                     ; [E8         ] Increment X
    PHP                     ; [08         ] Push Processor Status
    db $CC, $04                 ; Incomplete/data bytes

;--- Patch at file offset $1417C4 (SNES $D417C4) ---
org $D417C4

    BRK                     ; [00 00      ] Software interrupt
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    ASL                     ; [0A         ] Shift Left Accumulator
    TSB $0B                 ; [04 0B      ] Test and Set Bits in DP
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    PHD                     ; [0B         ] Push Direct Page Register
    db $1F, $00                 ; Incomplete/data bytes

;--- Patch at file offset $1417D6 (SNES $D417D6) ---
org $D417D6

    BRK                     ; [00 00      ] Software interrupt
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    PHD                     ; [0B         ] Push Direct Page Register
    ORA #$00                ; [09 00      ] OR A with Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 28      ] Software interrupt
    BPL $17B3               ; [10 C8      ] Branch if Plus
    BMI $1795               ; [30 A8      ] Branch if Minus
    BVS $184B               ; [70 5C      ] Branch if Overflow Set
    SED                     ; [F8         ] Set Decimal Flag

;--- Patch at file offset $1417F6 (SNES $D417F6) ---
org $D417F6

    BRK                     ; [00 00      ] Software interrupt
    BPL $17FA               ; [10 00      ] Branch if Plus
    BMI $180C               ; [30 10      ] Branch if Minus
    BVS $180E               ; [70 10      ] Branch if Overflow Set
    SED                     ; [F8         ] Set Decimal Flag
    JSR $0C33               ; [20 33 0C   ] Jump to Subroutine
    LSR $BF21,X             ; [5E 21 BF   ] Shift Right Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    LDA ($40,X)             ; [A1 40      ] Load A from (DP,X)
    CPX #$00                ; [E0 00      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 3B      ] Software interrupt
    BRK                     ; [00 6A      ] Software interrupt
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    BRK                     ; [00 0F      ] Software interrupt
    ASL $3121,X             ; [1E 21 31   ] Shift Left Absolute,X
    LSR $7F00               ; [4E 00 7F   ] Shift Right Absolute
    JMP $1C33               ; [4C 33 1C   ] Jump Absolute
    AND $04,S               ; [23 04      ] AND A with Stack Relative
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BMI $1821               ; [30 FE      ] Branch if Minus
    CLC                     ; [18         ] Clear Carry Flag
    ROL $FCC0,X             ; [3E C0 FC   ] Rotate Left Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 7C      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 76      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    TSB $98                 ; [04 98      ] Test and Set Bits in DP
    MVP $00,$E4             ; [44 00 E4   ] Block Move Positive
    CPY #$28                ; [C0 28      ] Compare Y Immediate
    BRK                     ; [00 E8      ] Software interrupt
    JSR $00C8               ; [20 C8 00   ] Jump to Subroutine
    STZ $08                 ; [64 08      ] Store Zero to DP
    DEY                     ; [88         ] Decrement Y
    ROR                     ; [6A         ] Rotate Right Accumulator
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    ROL $3911               ; [2E 11 39   ] Rotate Left Absolute
    ASL $27                 ; [06 27      ] Shift Left DP
    db $03                      ; Incomplete/data bytes

;--- Patch at file offset $141850 (SNES $D41850) ---
org $D41850

    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    BIT $1102               ; [2C 02 11   ] Test Bits Absolute
    BRK                     ; [00 06      ] Software interrupt
    BRK                     ; [00 19      ] Software interrupt
    ORA $39,S               ; [03 39      ] OR A with Stack Relative
    TSB $30                 ; [04 30      ] Test and Set Bits in DP
    ORA #$00                ; [09 00      ] OR A with Immediate
    BRK                     ; [00 84      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    INC                     ; [1A         ] Increment Accumulator
    BVS $184F               ; [70 EA      ] Branch if Overflow Set
    BEQ $18DD               ; [F0 76      ] Branch if Equal
    CLD                     ; [D8         ] Clear Decimal Flag
    DEC                     ; [3A         ] Decrement Accumulator
    CPY #$D6                ; [C0 D6      ] Compare Y Immediate
    TYA                     ; [98         ] Transfer Y to A
    STA ($1C)               ; [92 1C      ] Store A to (DP)
    JSR ($7800,X)           ; [FC 00 78   ] Jump to Subroutine Indirect,X
    RTS                     ; [60         ] Return from Subroutine
    PEA $F484               ; [F4 84 F4   ] Push Effective Absolute
    TSB $D8                 ; [04 D8      ] Test and Set Bits in DP
    CPY #$C4                ; [C0 C4      ] Compare Y Immediate
    CPY $98                 ; [C4 98      ] Compare Y with DP
    LDY #$3C                ; [A0 3C      ] Load Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600               ; [2C 00 16   ] Test Bits Absolute
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $11                 ; [06 11      ] Shift Left DP
    BRK                     ; [00 18      ] Software interrupt
    ORA ($2E,X)             ; [01 2E      ] OR A with (DP,X)
    PHD                     ; [0B         ] Push Direct Page Register
    ASL $39                 ; [06 39      ] Shift Left DP
    COP #$11                ; [02 11      ] Coprocessor interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 1B      ] Software interrupt
    BPL $18B2               ; [10 11      ] Branch if Plus
    ASL $0F                 ; [06 0F      ] Shift Left DP
    ORA $09                 ; [05 09      ] OR A with Direct Page
    ASL $14                 ; [06 14      ] Shift Left DP
    COP #$32                ; [02 32      ] Coprocessor interrupt
    BPL $18F5               ; [10 4A      ] Branch if Plus
    SEC                     ; [38         ] Set Carry Flag
    AND $08,X               ; [35 08      ] AND A with DP,X
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 0E      ] Software interrupt

;--- Patch at file offset $1418B7 (SNES $D418B7) ---
org $D418B7

    ORA ($19,X)             ; [01 19      ] OR A with (DP,X)
    TSB $39                 ; [04 39      ] Test and Set Bits in DP
    TSB $08                 ; [04 08      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 51      ] Software interrupt
    JSR $002C               ; [20 2C 00   ] Jump to Subroutine
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA ($1E,X)             ; [01 1E      ] OR A with (DP,X)
    ORA $06,S               ; [03 06      ] OR A with Stack Relative
    AND $1102,Y             ; [39 02 11   ] AND A with Absolute,Y
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 05      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA $F6,S               ; [03 F6      ] OR A with Stack Relative
    TSB $00FE               ; [0C FE 00   ] Test and Set Bits Absolute
    INC $FE00,X             ; [FE 00 FE   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRA $18F9               ; [80 0E      ] Branch Always
    BRK                     ; [00 22      ] Software interrupt
    PEA $709C               ; [F4 9C 70   ] Push Effective Absolute
    CPY $4020               ; [CC 20 40   ] Compare Y with Absolute
    LDY $08                 ; [A4 08      ] Load Y from DP
    PEI ($08)               ; [D4 08      ] Push Effective Indirect
    MVN $80,$08             ; [54 80 08   ] Block Move Negative
    BEQ $18EC               ; [F0 F0      ] Branch if Equal
    JSR ($7008,X)           ; [FC 08 70   ] Jump to Subroutine Indirect,X
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $141906 (SNES $D41906) ---
org $D41906

    TRB $02                 ; [14 02      ] Test and Reset Bits DP
    AND ($10)               ; [32 10      ] AND A with (DP)
    LSR                     ; [4A         ] Shift Right Accumulator
    SEC                     ; [38         ] Set Carry Flag
    db $35                      ; Incomplete/data bytes

;--- Patch at file offset $141917 (SNES $D41917) ---
org $D41917

    ORA ($19,X)             ; [01 19      ] OR A with (DP,X)
    TSB $39                 ; [04 39      ] Test and Set Bits in DP
    TSB $08                 ; [04 08      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E8      ] Software interrupt
    BCS $199F               ; [B0 7C      ] Branch if Carry Set
    CLD                     ; [D8         ] Clear Decimal Flag
    CLD                     ; [D8         ] Clear Decimal Flag
    JSR $3064               ; [20 64 30   ] Jump to Subroutine
    STZ $50                 ; [64 50      ] Store Zero to DP
    CMP ($E8)               ; [D2 E8      ] Compare A with (DP)
    ROL                     ; [2A         ] Rotate Left Accumulator
    CPY #$C4                ; [C0 C4      ] Compare Y Immediate
    BRK                     ; [00 B0      ] Software interrupt
    BRA $190B               ; [80 D8      ] Branch Always
    CPY #$20                ; [C0 20      ] Compare Y Immediate
    BRK                     ; [00 38      ] Software interrupt
    DEY                     ; [88         ] Decrement Y
    CLI                     ; [58         ] Clear Interrupt Disable
    DEY                     ; [88         ] Decrement Y
    CPX $C404               ; [EC 04 C4   ] Compare X with Absolute
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 8C      ] Software interrupt
    BRK                     ; [00 54      ] Software interrupt
    DEY                     ; [88         ] Decrement Y
    BIT $D4D8               ; [2C D8 D4   ] Test Bits Absolute
    SEC                     ; [38         ] Set Carry Flag
    PEA $FE18               ; [F4 18 FE   ] Push Effective Absolute
    TRB $CC38               ; [1C 38 CC   ] Test and Reset Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    DEY                     ; [88         ] Decrement Y
    BRK                     ; [00 D8      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    SEC                     ; [38         ] Set Carry Flag
    PHP                     ; [08         ] Push Processor Status
    TYA                     ; [98         ] Transfer Y to A
    PHA                     ; [48         ] Push Accumulator
    JML [$0C00]             ; [DC 00 0C   ] Jump Long Indirect
    CPX $F6                 ; [E4 F6      ] Compare X with DP
    TSB $00FE               ; [0C FE 00   ] Test and Set Bits Absolute
    SBC [$00]               ; [E7 00      ] Subtract with Borrow [DP]
    SBC [$00]               ; [E7 00      ] Subtract with Borrow [DP]
    SBC $70BEA0,X           ; [FF A0 BE 70] Subtract with Borrow Absolute Long,X
    ASL $94F0,X             ; [1E F0 94   ] Shift Left Absolute,X
    PLA                     ; [68         ] Pull Accumulator
    CPY $4020               ; [CC 20 40   ] Compare Y with Absolute
    BRA $198D               ; [80 18      ] Branch Always
    BRL $2388               ; [82 10 0A   ] Branch Long
    LDY #$22                ; [A0 22      ] Load Y Immediate
    BVS $19F0               ; [70 74      ] Branch if Overflow Set
    BEQ $1972               ; [F0 F4      ] Branch if Equal
    PLA                     ; [68         ] Pull Accumulator
    RTS                     ; [60         ] Return from Subroutine
    BCC $1989               ; [90 07      ] Branch if Carry Clear
    STZ $6905,X             ; [9E 05 69   ] Store Zero to Absolute,X
    ASL $14                 ; [06 14      ] Shift Left DP
    COP #$32                ; [02 32      ] Coprocessor interrupt
    BPL $19D5               ; [10 4A      ] Branch if Plus
    SEC                     ; [38         ] Set Carry Flag
    db $35                      ; Incomplete/data bytes

;--- Patch at file offset $141997 (SNES $D41997) ---
org $D41997

    ORA ($19,X)             ; [01 19      ] OR A with (DP,X)
    TSB $39                 ; [04 39      ] Test and Set Bits in DP
    TSB $08                 ; [04 08      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 68      ] Software interrupt
    CPY #$64                ; [C0 64      ] Compare Y Immediate
    DEY                     ; [88         ] Decrement Y
    CPX $50                 ; [E4 50      ] Compare X with DP
    MVN $20,$64             ; [54 20 64   ] Block Move Negative
    BVC $197F               ; [50 D4      ] Branch if Overflow Clear
    CPX #$32                ; [E0 32      ] Compare X Immediate
    INY                     ; [C8         ] Increment Y
    DEC $D000               ; [CE 00 D0   ] Decrement Absolute
    BVC $194B               ; [50 98      ] Branch if Overflow Clear
    BPL $1A0D               ; [10 58      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    PLP                     ; [28         ] Pull Processor Status
    DEY                     ; [88         ] Decrement Y
    CLI                     ; [58         ] Clear Interrupt Disable
    DEY                     ; [88         ] Decrement Y
    INX                     ; [E8         ] Increment X
    PHP                     ; [08         ] Push Processor Status
    CPY $0004               ; [CC 04 00   ] Compare Y with Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 19      ] Software interrupt
    ASL $27                 ; [06 27      ] Shift Left DP
    CLC                     ; [18         ] Clear Carry Flag
    AND $215810             ; [2F 10 58 21] AND A with Absolute Long
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y

;--- Patch at file offset $1419D6 (SNES $D419D6) ---
org $D419D6

    BRK                     ; [00 07      ] Software interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $1A0D               ; [10 2F      ] Branch if Plus
    ASL $39                 ; [06 39      ] Shift Left DP
    STY $5400               ; [8C 00 54   ] Store Y to Absolute
    DEY                     ; [88         ] Decrement Y
    BIT $D4D8               ; [2C D8 D4   ] Test Bits Absolute
    SEC                     ; [38         ] Set Carry Flag
    PEA $FE18               ; [F4 18 FE   ] Push Effective Absolute
    TRB $CC38               ; [1C 38 CC   ] Test and Reset Bits Absolute
    INC $0C,X               ; [F6 0C      ] Increment DP,X
    BRK                     ; [00 00      ] Software interrupt
    DEY                     ; [88         ] Decrement Y
    BRK                     ; [00 D8      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    SEC                     ; [38         ] Set Carry Flag
    PHP                     ; [08         ] Push Processor Status
    TYA                     ; [98         ] Transfer Y to A
    PHA                     ; [48         ] Push Accumulator
    JML [$0C00]             ; [DC 00 0C   ] Jump Long Indirect
    CPX $CC                 ; [E4 CC      ] Compare X with DP
    JSR $002C               ; [20 2C 00   ] Jump to Subroutine
    LSR $04,X               ; [56 04      ] Shift Right DP,X
    MVN $06,$74             ; [54 06 74   ] Block Move Negative
    ASL $31                 ; [06 31      ] Shift Left DP
    ORA ($49,X)             ; [01 49      ] OR A with (DP,X)
    BMI $1A3C               ; [30 2F      ] Branch if Minus
    PHD                     ; [0B         ] Push Direct Page Register
    BPL $1A17               ; [10 07      ] Branch if Plus
    COP #$11                ; [02 11      ] Coprocessor interrupt
    PLP                     ; [28         ] Pull Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    AND ($08,X)             ; [21 08      ] AND A with (DP,X)
    ORA ($0F,X)             ; [01 0F      ] OR A with (DP,X)
    BRK                     ; [00 36      ] Software interrupt
    BRK                     ; [00 1B      ] Software interrupt
    ORA ($0F),Y             ; [11 0F      ] OR A with (DP),Y
    PHP                     ; [08         ] Push Processor Status
    INC $FE00,X             ; [FE 00 FE   ] Increment Absolute,X
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRA $19E7               ; [80 BE      ] Branch Always
    BVS $1A67               ; [70 3C      ] Branch if Overflow Set
    CPX #$38                ; [E0 38      ] Compare X Immediate
    CPX #$68                ; [E0 68      ] Compare X Immediate
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    LDY #$00                ; [A0 00      ] Load Y Immediate
    STY $20                 ; [84 20      ] Store Y to DP
    TRB $A0                 ; [14 A0      ] Test and Reset Bits DP
    TRB $70                 ; [14 70      ] Test and Reset Bits DP
    STZ $E0,X               ; [74 E0      ] Store Zero to DP,X
    INX                     ; [E8         ] Increment X
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    BNE $1A10               ; [D0 D0      ] Branch if Not Equal
    ORA $070805             ; [0F 05 08 07] OR A with Absolute Long
    PHD                     ; [0B         ] Push Direct Page Register
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 05      ] Software interrupt
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    COP #$05                ; [02 05      ] Coprocessor interrupt
    COP #$06                ; [02 06      ] Coprocessor interrupt
    BRK                     ; [00 01      ] Software interrupt
    TSB $07                 ; [04 07      ] Test and Set Bits in DP
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C8      ] Software interrupt
    BRK                     ; [00 C8      ] Software interrupt
    LDY #$48                ; [A0 48      ] Load Y Immediate
    LDY #$C4                ; [A0 C4      ] Load Y Immediate
    BMI $1A1B               ; [30 B2      ] Branch if Minus
    BRK                     ; [00 0E      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    BMI $1A23               ; [30 B0      ] Branch if Minus
    BPL $1A25               ; [10 B0      ] Branch if Plus
    BPL $1AAF               ; [10 38      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    TSB $000C               ; [0C 0C 00   ] Test and Set Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 3A      ] Software interrupt
    BRK                     ; [00 35      ] Software interrupt
    INC                     ; [1A         ] Increment Accumulator
    TCD                     ; [5B         ] Transfer A to Direct Page
    BIT $2956               ; [2C 56 29   ] Test Bits Absolute
    LDA $B952,X             ; [BD 52 B9   ] Load A from Absolute,X
    LSR $B0                 ; [46 B0      ] Shift Right DP
    EOR $000000             ; [4F 00 00 00] XOR A with Absolute Long
    BRK                     ; [00 1A      ] Software interrupt
    COP #$0C                ; [02 0C      ] Coprocessor interrupt
    JSR $2908               ; [20 08 29   ] Jump to Subroutine
    ORA ($46),Y             ; [11 46      ] OR A with (DP),Y
    ORA ($66,X)             ; [01 66      ] OR A with (DP,X)
    BRK                     ; [00 6F      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BEQ $1AA4               ; [F0 00      ] Branch if Equal
    RTS                     ; [60         ] Return from Subroutine
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    BRK                     ; [00 78      ] Software interrupt
    BRA $1AA7               ; [80 FC      ] Branch Always
    BRK                     ; [00 7C      ] Software interrupt
    BRA $1AA5               ; [80 F6      ] Branch Always
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRA $1A9B               ; [80 E0      ] Branch Always
    CLC                     ; [18         ] Clear Carry Flag
    BVS $1A46               ; [70 88      ] Branch if Overflow Set
    BCC $1B2C               ; [90 6C      ] Branch if Carry Clear
    ADC [$08],Y             ; [77 08      ] Add with Carry [DP],Y
    ROR $B200,X             ; [7E 00 B2   ] Rotate Right Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    LDA ($50,S),Y           ; [B3 50      ] Load A from (SR),Y
    INC $18                 ; [E6 18      ] Increment DP
    DEC $3C                 ; [C6 3C      ] Decrement DP
    STZ $3A                 ; [64 3A      ] Store Zero to DP
    AND $0712,X             ; [3D 12 07   ] AND A with Absolute,X
    PLP                     ; [28         ] Pull Processor Status
    BRK                     ; [00 23      ] Software interrupt
    ORA #$64                ; [09 64      ] OR A with Immediate
    CLC                     ; [18         ] Clear Carry Flag
    MVN $59,$18             ; [54 59 18   ] Block Move Negative
    AND $3B3C,X             ; [3D 3C 3B   ] AND A with Absolute,X
    SEC                     ; [38         ] Set Carry Flag
    ORA ($10)               ; [12 10      ] OR A with (DP)
    DEC $0C00,X             ; [DE 00 0C   ] Decrement Absolute,X
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 1C      ] Software interrupt
    BRK                     ; [00 AE      ] Software interrupt
    TSB $0A                 ; [04 0A      ] Test and Set Bits in DP
    TSB $D4                 ; [04 D4      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    ROL                     ; [2A         ] Rotate Left Accumulator
    TRB $88                 ; [14 88      ] Test and Reset Bits DP
    STZ $60,X               ; [74 60      ] Store Zero to DP,X
    TYA                     ; [98         ] Transfer Y to A
    CPX #$10                ; [E0 10      ] Compare X Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    MVP $10,$E4             ; [44 10 E4   ] Block Move Positive
    BPL $1B05               ; [10 08      ] Branch if Plus
    JSR $5094               ; [20 94 50   ] Jump to Subroutine
    ORA $023500,X           ; [1F 00 35 02] OR A with Absolute Long,X
    EOR $02                 ; [45 02      ] XOR A with Direct Page
    db $A6                      ; Incomplete/data bytes

;--- Patch at file offset $141B0D (SNES $D41B0D) ---
org $D41B0D

    ASL                     ; [0A         ] Shift Left Accumulator
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 0A      ] Software interrupt
    BRK                     ; [00 3A      ] Software interrupt
    BRK                     ; [00 71      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ADC ($00),Y             ; [71 00      ] Add with Carry (DP),Y
    PHD                     ; [0B         ] Push Direct Page Register
    BRK                     ; [00 0A      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 06      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    LDY $FA38               ; [AC 38 FA   ] Load Y from Absolute
    BRK                     ; [00 22      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    BIT $10                 ; [24 10      ] Test Bits DP
    CPY $20                 ; [C4 20      ] Compare Y with DP
    TYA                     ; [98         ] Transfer Y to A
    BRK                     ; [00 60      ] Software interrupt
    BRK                     ; [00 D8      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    SEI                     ; [78         ] Set Interrupt Disable
    SEC                     ; [38         ] Set Carry Flag
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    TRB $98C4               ; [1C C4 98   ] Test and Reset Bits Absolute
    PHA                     ; [48         ] Push Accumulator
    SEC                     ; [38         ] Set Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    RTS                     ; [60         ] Return from Subroutine
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $141B44 (SNES $D41B44) ---
org $D41B44

    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $215810             ; [2F 10 58 21] AND A with Absolute Long

;--- Patch at file offset $141B56 (SNES $D41B56) ---
org $D41B56

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $1B8F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    STY $5400               ; [8C 00 54   ] Store Y to Absolute
    DEY                     ; [88         ] Decrement Y
    BIT $D4D8               ; [2C D8 D4   ] Test Bits Absolute
    SEC                     ; [38         ] Set Carry Flag
    PEA $FE18               ; [F4 18 FE   ] Push Effective Absolute
    TRB $CC38               ; [1C 38 CC   ] Test and Reset Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    DEY                     ; [88         ] Decrement Y
    BRK                     ; [00 D8      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    SEC                     ; [38         ] Set Carry Flag
    PHP                     ; [08         ] Push Processor Status
    TYA                     ; [98         ] Transfer Y to A
    PHA                     ; [48         ] Push Accumulator
    JML [$0C00]             ; [DC 00 0C   ] Jump Long Indirect
    CPX $51                 ; [E4 51      ] Compare X with DP
    JSR $0020               ; [20 20 00   ] Jump to Subroutine
    ORA ($00,S),Y           ; [13 00      ] OR A with (SR),Y
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    BEQ $1B8A               ; [F0 00      ] Branch if Equal
    TXS                     ; [9A         ] Transfer X to Stack Pointer
    JSR $104D               ; [20 4D 10   ] Jump to Subroutine
    ADC #$18                ; [69 18      ] Add with Carry Immediate
    ASL $39                 ; [06 39      ] Shift Left DP
    ASL $0C11               ; [0E 11 0C   ] Shift Left Absolute
    BRK                     ; [00 0A      ] Software interrupt
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($64,X)             ; [01 64      ] OR A with (DP,X)
    EOR ($32,X)             ; [41 32      ] XOR A with (DP,X)
    JSR $181E               ; [20 1E 18   ] Jump to Subroutine
    INC $0C,X               ; [F6 0C      ] Increment DP,X
    INC $3E00,X             ; [FE 00 3E   ] Increment Absolute,X
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRA $1B77               ; [80 CC      ] Branch Always
    BRK                     ; [00 4E      ] Software interrupt
    TSB $1CE6               ; [0C E6 1C   ] Test and Set Bits Absolute
    CPY $4020               ; [CC 20 40   ] Compare Y with Absolute
    LDY $48                 ; [A4 48      ] Load Y from DP
    STY $40                 ; [84 40      ] Store Y to DP
    STY $80                 ; [84 80      ] Store Y to DP
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 AC      ] Software interrupt
    STZ $1C1C               ; [9C 1C 1C   ] Store Zero to Absolute
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    JSR $1300               ; [20 00 13   ] Jump to Subroutine
    BRK                     ; [00 14      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 9C      ] Software interrupt
    JSR $104F               ; [20 4F 10   ] Jump to Subroutine
    ADC #$18                ; [69 18      ] Add with Carry Immediate
    ASL $39                 ; [06 39      ] Shift Left DP
    ASL $0C11               ; [0E 11 0C   ] Shift Left Absolute
    BRK                     ; [00 0A      ] Software interrupt
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($62,X)             ; [01 62      ] OR A with (DP,X)
    EOR ($30,X)             ; [41 30      ] XOR A with (DP,X)
    JSR $181E               ; [20 1E 18   ] Jump to Subroutine
    INC $0C,X               ; [F6 0C      ] Increment DP,X
    INC $3E00,X             ; [FE 00 3E   ] Increment Absolute,X
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 EC      ] Software interrupt
    BRA $1BB7               ; [80 CC      ] Branch Always
    BRK                     ; [00 4E      ] Software interrupt
    TSB $1CE6               ; [0C E6 1C   ] Test and Set Bits Absolute
    CPY $4020               ; [CC 20 40   ] Compare Y with Absolute
    LDY $48                 ; [A4 48      ] Load Y from DP
    STY $40                 ; [84 40      ] Store Y to DP
    STY $90                 ; [84 90      ] Store Y to DP
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 AC      ] Software interrupt
    STZ $1C1C               ; [9C 1C 1C   ] Store Zero to Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    CLC                     ; [18         ] Clear Carry Flag
    ORA [$27]               ; [07 27      ] OR A with [DP]
    CLC                     ; [18         ] Clear Carry Flag
    AND $215810             ; [2F 10 58 21] AND A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $1C4F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BCS $1C08               ; [B0 E0      ] Branch if Carry Set
    SED                     ; [F8         ] Set Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    CLI                     ; [58         ] Clear Interrupt Disable
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $10                 ; [06 10      ] Shift Left DP
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 37      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    AND $081300,X           ; [3F 00 13 08] AND A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    ORA $FE,S               ; [03 FE      ] OR A with Stack Relative
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    JSR $28C4               ; [20 C4 28   ] Jump to Subroutine
    PLA                     ; [68         ] Pull Accumulator
    BRA $1C7D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $1CD5               ; [90 5C      ] Branch if Carry Clear
    BRA $1C87               ; [80 0C      ] Branch Always
    BNE $1C05               ; [D0 88      ] Branch if Not Equal
    STY $20                 ; [84 20      ] Store Y to DP
    PHP                     ; [08         ] Push Processor Status
    EOR $024F06             ; [4F 06 4F 02] XOR A with Absolute Long
    ROL $1D03,X             ; [3E 03 1D   ] Rotate Left Absolute,X
    ORA $02,S               ; [03 02      ] OR A with Stack Relative
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    BRK                     ; [00 36      ] Software interrupt
    BRK                     ; [00 2A      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    ORA $0203,Y             ; [19 03 02   ] OR A with Absolute,Y
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    BPL $1CDB               ; [10 38      ] Branch if Plus
    BPL $1C7D               ; [10 D8      ] Branch if Plus
    JSR $00F0               ; [20 F0 00   ] Jump to Subroutine
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $1CD2               ; [F0 20      ] Branch if Equal
    BCS $1D14               ; [B0 60      ] Branch if Carry Set
    BMI $1CC6               ; [30 10      ] Branch if Minus
    BRA $1C38               ; [80 80      ] Branch Always
    BRA $1CBA               ; [80 00      ] Branch Always
    BRA $1CBC               ; [80 00      ] Branch Always
    BRA $1C3E               ; [80 80      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $215810             ; [2F 10 58 21] AND A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $1D0F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BCS $1CC8               ; [B0 E0      ] Branch if Carry Set
    SED                     ; [F8         ] Set Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    CLI                     ; [58         ] Clear Interrupt Disable
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    AND ($00)               ; [32 00      ] AND A with (DP)
    TRB $1402               ; [1C 02 14   ] Test and Reset Bits Absolute
    ASL $34                 ; [06 34      ] Shift Left DP
    ASL $48                 ; [06 48      ] Shift Left DP
    BRK                     ; [00 4F      ] Software interrupt
    BRK                     ; [00 79      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    AND $001D00,X           ; [3F 00 1D 00] AND A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($16,X)             ; [01 16      ] OR A with (DP,X)
    AND ($30,X)             ; [21 30      ] AND A with (DP,X)
    BRK                     ; [00 27      ] Software interrupt
    JSR $00FE               ; [20 FE 00   ] Jump to Subroutine
    JSR ($FC00,X)           ; [FC 00 FC   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    CPY #$C4                ; [C0 C4      ] Compare Y Immediate
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $1D3D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $1D95               ; [90 5C      ] Branch if Carry Clear
    BRA $1D57               ; [80 1C      ] Branch Always
    BRK                     ; [00 E8      ] Software interrupt
    CPX $E0                 ; [E4 E0      ] Compare X with DP
    PLP                     ; [28         ] Pull Processor Status
    ADC $7F21,X             ; [7D 21 7F   ] Add with Carry Absolute,X
    AND ($3B),Y             ; [31 3B      ] AND A with (DP),Y
    ASL $0B                 ; [06 0B      ] Shift Left DP
    ASL $10                 ; [06 10      ] Shift Left DP
    BRK                     ; [00 13      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BPL $1D8B               ; [10 3C      ] Branch if Plus
    BRK                     ; [00 31      ] Software interrupt
    ORA ($35)               ; [12 35      ] OR A with (DP)
    TSB $06                 ; [04 06      ] Test and Set Bits in DP
    TSB $07                 ; [04 07      ] Test and Set Bits in DP
    ORA $0F                 ; [05 0F      ] OR A with Direct Page
    ORA $180C0C             ; [0F 0C 0C 18] OR A with Absolute Long
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    INX                     ; [E8         ] Increment X
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    JSR $0078               ; [20 78 00   ] Jump to Subroutine
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $1CF4               ; [80 80      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    CPX #$80                ; [E0 80      ] Compare X Immediate
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    BMI $1D8E               ; [30 10      ] Branch if Minus
    BRK                     ; [00 00      ] Software interrupt
    STA $069D0E,X           ; [9F 0E 9D 06] Store A to Absolute Long,X
    TDC                     ; [7B         ] Transfer Direct Page to A
    ASL $3F                 ; [06 3F      ] Shift Left DP
    ORA $3B0011             ; [0F 11 00 3B] OR A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    ASL $0C00,X             ; [1E 00 0C   ] Shift Left Absolute,X
    BRK                     ; [00 6E      ] Software interrupt
    BRK                     ; [00 56      ] Software interrupt
    AND ($37)               ; [32 37      ] AND A with (DP)
    AND $0F,X               ; [35 0F      ] AND A with DP,X
    BRK                     ; [00 0E      ] Software interrupt
    ASL $041C               ; [0E 1C 04   ] Shift Left Absolute
    TSB $000C               ; [0C 0C 00   ] Test and Set Bits Absolute
    BRK                     ; [00 38      ] Software interrupt
    BPL $1DDB               ; [10 38      ] Branch if Plus
    BPL $1D7D               ; [10 D8      ] Branch if Plus
    JSR $00F0               ; [20 F0 00   ] Jump to Subroutine
    BMI $1DAA               ; [30 00      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    JSR $40F0               ; [20 F0 40   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    JSR $60B0               ; [20 B0 60   ] Jump to Subroutine
    BMI $1DC6               ; [30 10      ] Branch if Minus
    BRA $1D38               ; [80 80      ] Branch Always
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    BEQ $1D8C               ; [F0 D0      ] Branch if Equal
    RTS                     ; [60         ] Return from Subroutine
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $141DC6 (SNES $D41DC6) ---
org $D41DC6

    BRK                     ; [00 00      ] Software interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    ORA $02                 ; [05 02      ] OR A with Direct Page
    ORA $03                 ; [05 03      ] OR A with Direct Page
    ORA [$00]               ; [07 00      ] OR A with [DP]

;--- Patch at file offset $141DD9 (SNES $D41DD9) ---
org $D41DD9

    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $141DE6 (SNES $D41DE6) ---
org $D41DE6

    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F8      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    LDY $68,X               ; [B4 68      ] Load Y from DP,X
    SBC ($4C)               ; [F2 4C      ] Subtract with Borrow (DP)

;--- Patch at file offset $141DF8 (SNES $D41DF8) ---
org $D41DF8

    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 60      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    RTI                     ; [40         ] Return from Interrupt
    TRB $0619               ; [1C 19 06   ] Test and Reset Bits Absolute
    ROL $5F11               ; [2E 11 5F   ] Rotate Left Absolute
    JSR $2050               ; [20 50 20   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 25      ] Software interrupt
    BRK                     ; [00 1D      ] Software interrupt
    BRK                     ; [00 15      ] Software interrupt
    ORA $0601               ; [0D 01 06   ] OR A with Absolute
    ASL $1811               ; [0E 11 18   ] Shift Left Absolute
    AND [$00]               ; [27 00      ] AND A with [DP]
    AND $0A1926,X           ; [3F 26 19 0A] AND A with Absolute Long,X
    BPL $1E1F               ; [10 02      ] Branch if Plus
    BRK                     ; [00 02      ] Software interrupt

;--- Patch at file offset $141E2E (SNES $D41E2E) ---
org $D41E2E

    AND $920C80,X           ; [3F 80 0C 92] AND A with Absolute Long,X

;--- Patch at file offset $141E3E (SNES $D41E3E) ---
org $D41E3E

    TSB $6A                 ; [04 6A      ] Test and Set Bits in DP
    ORA $0D,X               ; [15 0D      ] OR A with DP,X
    BPL $1E44               ; [10 00      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 1F      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA $001302,X           ; [1F 02 13 00] OR A with Absolute Long,X
    AND ($10,S),Y           ; [33 10      ] AND A with (SR),Y
    AND $000200,X           ; [3F 00 02 00] AND A with Absolute Long,X
    ORA $000700             ; [0F 00 07 00] OR A with Absolute Long
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 06      ] Software interrupt
    TSB $0C                 ; [04 0C      ] Test and Set Bits in DP
    TSB $0C1E               ; [0C 1E 0C   ] Test and Set Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    ASL $7E80,X             ; [1E 80 7E   ] Shift Left Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    LDY $FE58,X             ; [BC 58 FE   ] Load Y from Absolute,X

;--- Patch at file offset $141E74 (SNES $D41E74) ---
org $D41E74

    SEI                     ; [78         ] Set Interrupt Disable
    RTS                     ; [60         ] Return from Subroutine
    LDY $DC80,X             ; [BC 80 DC   ] Load Y from Absolute,X
    CLD                     ; [D8         ] Clear Decimal Flag
    PEI ($CC)               ; [D4 CC      ] Push Effective Indirect
    CPY #$58                ; [C0 58      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $10                 ; [06 10      ] Shift Left DP
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ORA #$00                ; [09 00      ] OR A with Immediate
    AND $081300,X           ; [3F 00 13 08] AND A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    ORA ($0F,X)             ; [01 0F      ] OR A with (DP,X)
    ORA [$1F]               ; [07 1F      ] OR A with [DP]
    ASL $060D               ; [0E 0D 06   ] Shift Left Absolute
    PHD                     ; [0B         ] Push Direct Page Register
    ORA [$1F]               ; [07 1F      ] OR A with [DP]
    ORA $760022             ; [0F 22 00 76] OR A with Absolute Long
    BMI $1EEA               ; [30 3D      ] Branch if Minus
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    BRK                     ; [00 06      ] Software interrupt
    COP #$07                ; [02 07      ] Coprocessor interrupt
    TSB $0F                 ; [04 0F      ] Test and Set Bits in DP
    BRK                     ; [00 1D      ] Software interrupt
    ORA $0939,X             ; [1D 39 09   ] OR A with Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $10                 ; [06 10      ] Shift Left DP
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 3F      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    AND $081300,X           ; [3F 00 13 08] AND A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    ASL $FE                 ; [06 FE      ] Shift Left DP
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 C4      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $1EFD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $1F45               ; [90 4C      ] Branch if Carry Clear
    BCC $1F07               ; [90 0C      ] Branch if Carry Clear
    BNE $1F15               ; [D0 18      ] Branch if Not Equal
    BIT $90                 ; [24 90      ] Test Bits DP
    TAY                     ; [A8         ] Transfer A to Y
    EOR $064F07             ; [4F 07 4F 06] XOR A with Absolute Long
    AND [$0C],Y             ; [37 0C      ] AND A with [DP],Y
    ORA $002209,X           ; [1F 09 22 00] OR A with Absolute Long,X
    ROR $30,X               ; [76 30      ] Rotate Right DP,X
    AND $1800,X             ; [3D 00 18   ] AND A with Absolute,X
    BRK                     ; [00 3F      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    AND $020E19             ; [2F 19 0E 02] AND A with Absolute Long
    ORA #$00                ; [09 00      ] OR A with Immediate
    ORA $391D,X             ; [1D 1D 39   ] OR A with Absolute,X
    ORA #$18                ; [09 18      ] OR A with Immediate
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    BRA $1F03               ; [80 E0      ] Branch Always
    BRK                     ; [00 F0      ] Software interrupt
    BRA $1F07               ; [80 E0      ] Branch Always
    BRK                     ; [00 60      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CPX #$80                ; [E0 80      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    LDY #$00                ; [A0 00      ] Load Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    CPX #$60                ; [E0 60      ] Compare X Immediate
    BRA $1EB8               ; [80 80      ] Branch Always
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    CPX #$A0                ; [E0 A0      ] Compare X Immediate
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BCS $1F28               ; [B0 E0      ] Branch if Carry Set
    SED                     ; [F8         ] Set Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    CLI                     ; [58         ] Clear Interrupt Disable
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 E4      ] Software interrupt
    BRK                     ; [00 A4      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    INC $FCF0               ; [EE F0 FC   ] Increment Absolute
    CPY #$C4                ; [C0 C4      ] Compare Y Immediate
    PLP                     ; [28         ] Pull Processor Status
    RTI                     ; [40         ] Return from Interrupt
    LDY #$18                ; [A0 18      ] Load Y Immediate
    CPY #$50                ; [C0 50      ] Compare Y Immediate
    DEY                     ; [88         ] Decrement Y
    BMI $1F2A               ; [30 B0      ] Branch if Minus
    STZ $10,X               ; [74 10      ] Store Zero to DP,X
    BEQ $1F82               ; [F0 04      ] Branch if Equal
    BEQ $1FB0               ; [F0 30      ] Branch if Equal
    STZ $9D0F,X             ; [9E 0F 9D   ] Store Zero to Absolute,X
    ORA [$7B]               ; [07 7B      ] OR A with [DP]
    ORA [$3F]               ; [07 3F      ] OR A with [DP]
    ORA $760022             ; [0F 22 00 76] OR A with Absolute Long
    BMI $1FCA               ; [30 3D      ] Branch if Minus
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 7F      ] Software interrupt
    ORA ($57),Y             ; [11 57      ] OR A with (DP),Y
    AND ($37)               ; [32 37      ] AND A with (DP)
    BIT $0F,X               ; [34 0F      ] Test Bits DP,X
    BRK                     ; [00 1D      ] Software interrupt
    ORA $0939,X             ; [1D 39 09   ] OR A with Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    BRA $1F93               ; [80 F0      ] Branch Always
    BRA $1F85               ; [80 E0      ] Branch Always
    BRA $1F97               ; [80 F0      ] Branch Always
    BRA $2009               ; [80 60      ] Branch Always
    BRK                     ; [00 70      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CPX #$80                ; [E0 80      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPX #$60                ; [E0 60      ] Compare X Immediate
    BRA $1FB4               ; [80 00      ] Branch Always
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    CPX #$60                ; [E0 60      ] Compare X Immediate
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    CPX #$A0                ; [E0 A0      ] Compare X Immediate
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $215810             ; [2F 10 58 21] AND A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $200F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BCS $1FC8               ; [B0 E0      ] Branch if Carry Set
    SED                     ; [F8         ] Set Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    CLI                     ; [58         ] Clear Interrupt Disable
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $3600,X             ; [3C 00 36   ] Test Bits Absolute,X
    TSB $54                 ; [04 54      ] Test and Set Bits in DP
    ASL $54                 ; [06 54      ] Shift Left DP
    ASL $70                 ; [06 70      ] Shift Left DP
    BRK                     ; [00 79      ] Software interrupt
    BMI $204E               ; [30 3F      ] Branch if Minus
    ORA $3F00,Y             ; [19 00 3F   ] OR A with Absolute,Y
    BRK                     ; [00 13      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    AND ($2E,X)             ; [21 2E      ] AND A with (DP,X)
    AND ($37,X)             ; [21 37      ] AND A with (DP,X)
    ORA ($1F,X)             ; [01 1F      ] OR A with (DP,X)
    ASL $FE                 ; [06 FE      ] Shift Left DP
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    INC $FC70               ; [EE 70 FC   ] Increment Absolute
    RTS                     ; [60         ] Return from Subroutine
    SEI                     ; [78         ] Set Interrupt Disable
    CPX #$C4                ; [E0 C4      ] Compare X Immediate
    PLP                     ; [28         ] Pull Processor Status
    TSB $C0                 ; [04 C0      ] Test and Set Bits in DP
    BIT $90                 ; [24 90      ] Test Bits DP
    BIT $90                 ; [24 90      ] Test Bits DP
    STZ $30,X               ; [74 30      ] Store Zero to DP,X
    BVS $2040               ; [70 04      ] Branch if Overflow Set
    BVS $204E               ; [70 10      ] Branch if Overflow Set
    BEQ $1FD0               ; [F0 90      ] Branch if Equal
    ASL $0D0F,X             ; [1E 0F 0D   ] Shift Left Absolute,X
    ORA [$05]               ; [07 05      ] OR A with [DP]
    ORA $05,S               ; [03 05      ] OR A with Stack Relative
    ORA $02,S               ; [03 02      ] OR A with Stack Relative
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    BRK                     ; [00 0F      ] Software interrupt
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    COP #$03                ; [02 03      ] Coprocessor interrupt
    COP #$03                ; [02 03      ] Coprocessor interrupt
    COP #$01                ; [02 01      ] Coprocessor interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    BRA $2045               ; [80 E0      ] Branch Always
    BRA $2027               ; [80 C0      ] Branch Always
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt

;--- Patch at file offset $142071 (SNES $D42071) ---
org $D42071

    JSR $0080               ; [20 80 00   ] Jump to Subroutine
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    BRA $1FF8               ; [80 80      ] Branch Always
    BRA $207A               ; [80 00      ] Branch Always

;--- Patch at file offset $142080 (SNES $D42080) ---
org $D42080

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ASL $01                 ; [06 01      ] Shift Left DP
    ORA #$06                ; [09 06      ] OR A with Immediate
    ORA $081700             ; [0F 00 17 08] OR A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ASL $09                 ; [06 09      ] Shift Left DP
    BRK                     ; [00 00      ] Software interrupt
    CLV                     ; [B8         ] Clear Overflow Flag
    BRK                     ; [00 7C      ] Software interrupt
    CLV                     ; [B8         ] Clear Overflow Flag
    INC $7F18               ; [EE 18 7F   ] Increment Absolute
    BRA $20AA               ; [80 FF      ] Branch Always
    BRK                     ; [00 BF      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CMP [$38]               ; [C7 38      ] Compare A with [DP]
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CLV                     ; [B8         ] Clear Overflow Flag
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    SEP #$E2                ; [E2 E2      ] Set Processor Status Bits
    CLC                     ; [18         ] Clear Carry Flag
    LDA ($48)               ; [B2 48      ] Load A from (DP)
    RTI                     ; [40         ] Return from Interrupt
    LDY $0817,X             ; [BC 17 08   ] Load Y from Absolute,X
    JMP ($5C10)             ; [6C 10 5C   ] Jump Indirect
    JSR $2052               ; [20 52 20   ] Jump to Subroutine
    ADC ($00,S),Y           ; [73 00      ] Add with Carry (SR),Y
    BIT $3E10,X             ; [3C 10 3E   ] Test Bits Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    EOR $0B042C,X           ; [5F 2C 04 0B] XOR A with Absolute Long,X
    BRK                     ; [00 17      ] Software interrupt
    ORA ($22),Y             ; [11 22      ] OR A with (DP),Y
    ORA $1820               ; [0D 20 18   ] OR A with Absolute
    BIT $19,X               ; [34 19      ] Test Bits DP,X
    ASL                     ; [0A         ] Shift Left Accumulator
    TRB $0D05               ; [1C 05 0D   ] Test and Reset Bits Absolute
    AND ($7E,X)             ; [21 7E      ] AND A with (DP,X)
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 36      ] Software interrupt
    BRK                     ; [00 5C      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 4E      ] Software interrupt
    BRK                     ; [00 CF      ] Software interrupt
    TSB $BF                 ; [04 BF      ] Test and Set Bits in DP
    LSR $CC30               ; [4E 30 CC   ] Shift Right Absolute
    DEY                     ; [88         ] Decrement Y
    STZ $C8,X               ; [74 C8      ] Store Zero to DP,X
    TRB $80                 ; [14 80      ] Test and Reset Bits DP
    SEC                     ; [38         ] Set Carry Flag
    INY                     ; [C8         ] Increment Y
    PHP                     ; [08         ] Push Processor Status
    LDY $2E0C,X             ; [BC 0C 2E   ] Load Y from Absolute,X
    INC                     ; [1A         ] Increment Accumulator
    DEC $7FD0,X             ; [DE D0 7F   ] Decrement Absolute,X
    ORA ($39,X)             ; [01 39      ] OR A with (DP,X)
    BRK                     ; [00 19      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA $000F04,X           ; [1F 04 0F 00] OR A with Absolute Long,X
    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    AND ($00),Y             ; [31 00      ] AND A with (DP),Y
    ASL $06                 ; [06 06      ] Shift Left DP
    ASL $0E06               ; [0E 06 0E   ] Shift Left Absolute
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)

;--- Patch at file offset $142125 (SNES $D42125) ---
org $D42125

    BEQ $20E3               ; [F0 BC      ] Branch if Equal
    BVS $2165               ; [70 3C      ] Branch if Overflow Set
    BRK                     ; [00 20      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRA $20AF               ; [80 80      ] Branch Always
    BRK                     ; [00 EC      ] Software interrupt
    JSR $20F0               ; [20 F0 20   ] Jump to Subroutine
    SED                     ; [F8         ] Set Decimal Flag
    PLP                     ; [28         ] Pull Processor Status
    SEI                     ; [78         ] Set Interrupt Disable
    PHA                     ; [48         ] Push Accumulator
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRA $213E               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $215810             ; [2F 10 58 21] AND A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $218F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BCS $2148               ; [B0 E0      ] Branch if Carry Set
    SED                     ; [F8         ] Set Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    CLI                     ; [58         ] Clear Interrupt Disable
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BMI $2184               ; [30 00      ] Branch if Minus
    BPL $2186               ; [10 00      ] Branch if Plus
    ORA ($00,S),Y           ; [13 00      ] OR A with (SR),Y
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 14      ] Software interrupt
    BRK                     ; [00 27      ] Software interrupt
    BRK                     ; [00 59      ] Software interrupt
    AND ($00),Y             ; [31 00      ] AND A with (DP),Y
    AND $0E1906,X           ; [3F 06 19 0E] AND A with Absolute Long,X
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    BRK                     ; [00 06      ] Software interrupt
    ORA ($0A,X)             ; [01 0A      ] OR A with (DP,X)
    ORA ($10,X)             ; [01 10      ] OR A with (DP,X)
    PHP                     ; [08         ] Push Processor Status
    AND $02,X               ; [35 02      ] AND A with DP,X
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRA $2175               ; [80 C4      ] Branch Always
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $21BD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $2205               ; [90 4C      ] Branch if Carry Clear
    BCC $21C7               ; [90 0C      ] Branch if Carry Clear
    BCC $2219               ; [90 5C      ] Branch if Carry Clear
    RTI                     ; [40         ] Return from Interrupt
    INY                     ; [C8         ] Increment Y
    RTI                     ; [40         ] Return from Interrupt
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BMI $21C4               ; [30 00      ] Branch if Minus
    BPL $21C6               ; [10 00      ] Branch if Plus
    ORA ($00,S),Y           ; [13 00      ] OR A with (SR),Y
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 14      ] Software interrupt
    BRK                     ; [00 27      ] Software interrupt
    BRK                     ; [00 59      ] Software interrupt
    AND ($00),Y             ; [31 00      ] AND A with (DP),Y
    AND $0E1906,X           ; [3F 06 19 0E] AND A with Absolute Long,X
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    BRK                     ; [00 06      ] Software interrupt
    ORA ($0A,X)             ; [01 0A      ] OR A with (DP,X)
    ORA ($10,X)             ; [01 10      ] OR A with (DP,X)
    PHP                     ; [08         ] Push Processor Status
    AND $02,X               ; [35 02      ] AND A with DP,X
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRA $21B5               ; [80 C4      ] Branch Always
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $21FD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $2245               ; [90 4C      ] Branch if Carry Clear
    BCC $2207               ; [90 0C      ] Branch if Carry Clear
    BCC $2259               ; [90 5C      ] Branch if Carry Clear
    RTI                     ; [40         ] Return from Interrupt
    INY                     ; [C8         ] Increment Y
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    AND $102F14             ; [2F 14 2F 10] AND A with Absolute Long
    CLI                     ; [58         ] Clear Interrupt Disable
    AND ($00,X)             ; [21 00      ] AND A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    TSB $0D                 ; [04 0D      ] Test and Set Bits in DP
    COP #$16                ; [02 16      ] Coprocessor interrupt
    ORA #$10                ; [09 10      ] OR A with Immediate
    BPL $224F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BEQ $2226               ; [F0 00      ] Branch if Equal
    CLV                     ; [B8         ] Clear Overflow Flag
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BNE $2249               ; [D0 10      ] Branch if Not Equal
    JSR $5880               ; [20 80 58   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $7600,X             ; [3C 00 76   ] Test Bits Absolute,X
    TSB $54                 ; [04 54      ] Test and Set Bits in DP
    ROL $54                 ; [26 54      ] Rotate Left DP
    ROL $61                 ; [26 61      ] Rotate Left DP
    BMI $2286               ; [30 39      ] Branch if Minus
    ORA ($3F),Y             ; [11 3F      ] OR A with (DP),Y
    ORA #$06                ; [09 06      ] OR A with Immediate
    AND $1102,Y             ; [39 02 11   ] AND A with Absolute,Y
    PHP                     ; [08         ] Push Processor Status
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($3E,X)             ; [01 3E      ] OR A with (DP,X)
    BRK                     ; [00 17      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA #$FE                ; [09 FE      ] OR A with Immediate
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    BRK                     ; [00 BA      ] Software interrupt
    TSB $66                 ; [04 66      ] Test and Set Bits in DP
    BIT $70DC,X             ; [3C DC 70   ] Test Bits Absolute,X
    STY $E0,X               ; [94 E0      ] Store Y to DP,X
    JSR ($C408,X)           ; [FC 08 C4   ] Jump to Subroutine Indirect,X
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $22BD               ; [80 48      ] Branch Always
    LDY #$44                ; [A0 44      ] Load Y Immediate
    BRA $2295               ; [80 1C      ] Branch Always
    LDY #$30                ; [A0 30      ] Load Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    PLA                     ; [68         ] Pull Accumulator
    DEY                     ; [88         ] Decrement Y
    BPL $2298               ; [10 18      ] Branch if Plus
    EOR $064F06             ; [4F 06 4F 06] XOR A with Absolute Long
    AND ($0F)               ; [32 0F      ] AND A with (DP)
    ORA ($0F)               ; [12 0F      ] OR A with (DP)
    ROL $1F                 ; [26 1F      ] Rotate Left DP
    AND $1F3F1F,X           ; [3F 1F 3F 1F] AND A with Absolute Long,X
    ORA $063200,X           ; [1F 00 32 06] OR A with Absolute Long,X
    BIT $12                 ; [24 12      ] Test Bits DP
    ORA $000F00             ; [0F 00 0F 00] OR A with Absolute Long
    ORA $021D00,X           ; [1F 00 1D 02] OR A with Absolute Long,X
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BIT $3428,X             ; [3C 28 34   ] Test Bits Absolute,X
    JSR $30F8               ; [20 F8 30   ] Jump to Subroutine
    BVS $2268               ; [70 C0      ] Branch if Overflow Set
    BMI $228A               ; [30 E0      ] Branch if Minus
    BEQ $228C               ; [F0 E0      ] Branch if Equal
    DEY                     ; [88         ] Decrement Y
    BRA $229F               ; [80 F0      ] Branch Always
    BRK                     ; [00 F0      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 30      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BVS $22AE               ; [70 F0      ] Branch if Overflow Set
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    AND $102F14             ; [2F 14 2F 10] AND A with Absolute Long
    CLI                     ; [58         ] Clear Interrupt Disable
    AND ($00,X)             ; [21 00      ] AND A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    TSB $0D                 ; [04 0D      ] Test and Set Bits in DP
    COP #$16                ; [02 16      ] Coprocessor interrupt
    ORA #$10                ; [09 10      ] OR A with Immediate
    BPL $230F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BEQ $22E6               ; [F0 00      ] Branch if Equal
    CLV                     ; [B8         ] Clear Overflow Flag
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BNE $2309               ; [D0 10      ] Branch if Not Equal
    JSR $5880               ; [20 80 58   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    ROL $00,X               ; [36 00      ] Rotate Left DP,X
    TRB $7406               ; [1C 06 74   ] Test and Reset Bits Absolute
    ASL $DC                 ; [06 DC      ] Shift Left DP
    RTS                     ; [60         ] Return from Subroutine
    ADC ($00,S),Y           ; [73 00      ] Add with Carry (SR),Y
    ADC ($11,S),Y           ; [73 11      ] Add with Carry (SR),Y
    ADC $390609,X           ; [7F 09 06 39] Add with Carry Absolute Long,X
    BRK                     ; [00 19      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($62,X)             ; [01 62      ] OR A with (DP,X)
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    BRK                     ; [00 3C      ] Software interrupt
    AND ($3A),Y             ; [31 3A      ] AND A with (DP),Y
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 96      ] Software interrupt
    TRB $109C               ; [1C 9C 10   ] Test and Reset Bits Absolute
    JSR ($FC60,X)           ; [FC 60 FC   ] Jump to Subroutine Indirect,X
    DEY                     ; [88         ] Decrement Y
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $237D               ; [80 48      ] Branch Always
    LDY #$00                ; [A0 00      ] Load Y Immediate
    BRA $23B5               ; [80 7C      ] Branch Always
    BPL $23B3               ; [10 78      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    SEI                     ; [78         ] Set Interrupt Disable
    SEI                     ; [78         ] Set Interrupt Disable
    BCS $2378               ; [B0 38      ] Branch if Carry Set
    AND [$0F],Y             ; [37 0F      ] AND A with [DP],Y
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA [$12]               ; [07 12      ] OR A with [DP]
    ORA $261F22             ; [0F 22 1F 26] OR A with Absolute Long
    ORA $7F1F3F,X           ; [1F 3F 1F 7F] OR A with Absolute Long,X
    AND $0B007F,X           ; [3F 7F 00 0B] AND A with Absolute Long,X
    ASL $05                 ; [06 05      ] Shift Left DP
    COP #$0F                ; [02 0F      ] Coprocessor interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 1D      ] Software interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    AND $780000,X           ; [3F 00 00 78] AND A with Absolute Long,X
    CPX #$70                ; [E0 70      ] Compare X Immediate
    CPX #$30                ; [E0 30      ] Compare X Immediate
    CPX #$38                ; [E0 38      ] Compare X Immediate
    BEQ $2381               ; [F0 18      ] Branch if Equal
    BEQ $2363               ; [F0 F8      ] Branch if Equal
    BEQ $2331               ; [F0 C4      ] Branch if Equal
    CPY #$FC                ; [C0 FC      ] Compare Y Immediate
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 00      ] Software interrupt
    EOR $064F06             ; [4F 06 4F 06] XOR A with Absolute Long
    AND ($0F)               ; [32 0F      ] AND A with (DP)
    ORA ($0F)               ; [12 0F      ] OR A with (DP)
    ROL $1F,X               ; [36 1F      ] Rotate Left DP,X
    EOR $1F5F1F,X           ; [5F 1F 5F 1F] XOR A with Absolute Long,X
    ADC $063200,X           ; [7F 00 32 06] Add with Carry Absolute Long,X
    BIT $12                 ; [24 12      ] Test Bits DP
    ORA $000F00             ; [0F 00 0F 00] OR A with Absolute Long
    ORA $263900,X           ; [1F 00 39 26] OR A with Absolute Long,X
    JSR $003F               ; [20 3F 00   ] Jump to Subroutine
    BRK                     ; [00 3C      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    BIT $20,X               ; [34 20      ] Test Bits DP,X
    SED                     ; [F8         ] Set Decimal Flag
    BMI $2417               ; [30 70      ] Branch if Minus
    CPY #$38                ; [C0 38      ] Compare Y Immediate
    BEQ $239F               ; [F0 F4      ] Branch if Equal
    BEQ $2391               ; [F0 E4      ] Branch if Equal
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BRK                     ; [00 F0      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 30      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $23BA               ; [F0 00      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    PHP                     ; [08         ] Push Processor Status
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag

;--- Patch at file offset $1423CA (SNES $D423CA) ---
org $D423CA

    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    db $03                      ; Incomplete/data bytes

;--- Patch at file offset $1423DE (SNES $D423DE) ---
org $D423DE

    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $1423E8 (SNES $D423E8) ---
org $D423E8

    BRK                     ; [00 00      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 8C      ] Software interrupt
    BVS $23E5               ; [70 F6      ] Branch if Overflow Set
    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $1423FA (SNES $D423FA) ---
org $D423FA

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 78      ] Software interrupt
    TRB $A8                 ; [14 A8      ] Test and Reset Bits DP
    ORA [$00]               ; [07 00      ] OR A with [DP]
    BIT $7F03,X             ; [3C 03 7F   ] Test Bits Absolute,X
    TSB $3C                 ; [04 3C      ] Test and Set Bits in DP
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 13      ] Software interrupt
    BRK                     ; [00 2E      ] Software interrupt
    ORA ($2A,S),Y           ; [13 2A      ] OR A with (SR),Y
    ORA ($03,S),Y           ; [13 03      ] OR A with (SR),Y
    BRK                     ; [00 00      ] Software interrupt
    ORA $38,S               ; [03 38      ] OR A with Stack Relative
    AND $0300,X             ; [3D 00 03   ] AND A with Absolute,X
    ORA [$08],Y             ; [17 08      ] OR A with [DP],Y
    BRK                     ; [00 0C      ] Software interrupt
    BPL $241E               ; [10 00      ] Branch if Plus
    db $14                      ; Incomplete/data bytes

;--- Patch at file offset $142426 (SNES $D42426) ---
org $D42426

    ROR $7E00,X             ; [7E 00 7E   ] Rotate Right Absolute,X
    BRK                     ; [00 7D      ] Software interrupt
    COP #$59                ; [02 59      ] Coprocessor interrupt
    ASL $5A                 ; [06 5A      ] Shift Left DP
    TSB $88                 ; [04 88      ] Test and Set Bits in DP
    LSR $64,X               ; [56 64      ] Shift Right DP,X
    TXA                     ; [8A         ] Transfer X to A
    TSB $F2                 ; [04 F2      ] Test and Set Bits in DP

;--- Patch at file offset $14243C (SNES $D4243C) ---
org $D4243C

    ROL $D0                 ; [26 D0      ] Rotate Left DP
    BIT $C0                 ; [24 C0      ] Test Bits DP
    ROL                     ; [2A         ] Rotate Left Accumulator
    ORA ($10,S),Y           ; [13 10      ] OR A with (SR),Y
    PHP                     ; [08         ] Push Processor Status
    AND $085F10,X           ; [3F 10 5F 08] AND A with Absolute Long,X
    EOR [$0E],Y             ; [57 0E      ] XOR A with [DP],Y
    AND [$1F]               ; [27 1F      ] AND A with [DP]
    AND $1F,S               ; [23 1F      ] AND A with Stack Relative
    ORA $001400,X           ; [1F 00 14 00] OR A with Absolute Long,X
    ORA $081800             ; [0F 00 18 08] OR A with Absolute Long
    ROL $2C06               ; [2E 06 2C   ] Rotate Left Absolute
    COP #$1E                ; [02 1E      ] Coprocessor interrupt
    ORA ($1E,X)             ; [01 1E      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 36      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    PER $0695               ; [62 30 E2   ] Push Effective Relative
    JSR $A0B6               ; [20 B6 A0   ] Jump to Subroutine
    ROL $F624,X             ; [3E 24 F6   ] Rotate Left Absolute,X
    PHP                     ; [08         ] Push Processor Status
    REP #$C0                ; [C2 C0      ] Reset Processor Status Bits
    JSR ($0800,X)           ; [FC 00 08   ] Jump to Subroutine Indirect,X
    BNE $248F               ; [D0 1C      ] Branch if Not Equal
    LDY $183C               ; [AC 3C 18   ] Load Y from Absolute
    SEI                     ; [78         ] Set Interrupt Disable
    CLV                     ; [B8         ] Clear Overflow Flag
    PEA $0830               ; [F4 30 08   ] Push Effective Absolute
    BRK                     ; [00 3C      ] Software interrupt
    JSR ($0000,X)           ; [FC 00 00   ] Jump to Subroutine Indirect,X
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $34                 ; [06 34      ] Shift Left DP
    ASL $31                 ; [06 31      ] Shift Left DP
    BPL $24C6               ; [10 39      ] Branch if Plus
    ORA ($1F),Y             ; [11 1F      ] OR A with (DP),Y
    ORA #$06                ; [09 06      ] OR A with Immediate
    AND $1102,Y             ; [39 02 11   ] AND A with Absolute,Y
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($1E,X)             ; [01 1E      ] OR A with (DP,X)
    BRK                     ; [00 17      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA #$0F                ; [09 0F      ] OR A with Immediate
    ASL $0F                 ; [06 0F      ] Shift Left DP
    ASL $12                 ; [06 12      ] Shift Left DP
    ORA $360F12             ; [0F 12 0F 36] OR A with Absolute Long
    ORA $5F1F5F,X           ; [1F 5F 1F 5F] OR A with Absolute Long,X
    ORA $02003F,X           ; [1F 3F 00 02] OR A with Absolute Long,X
    ASL $04                 ; [06 04      ] Shift Left DP
    COP #$0F                ; [02 0F      ] Coprocessor interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 39      ] Software interrupt
    ROL $20                 ; [26 20      ] Rotate Left DP
    AND $510000,X           ; [3F 00 00 51] AND A with Absolute Long,X
    JSR $003C               ; [20 3C 00   ] Jump to Subroutine
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BIT $06,X               ; [34 06      ] Test Bits DP,X
    AND ($10),Y             ; [31 10      ] AND A with (DP),Y
    AND $052700,X           ; [3F 00 27 05] AND A with Absolute Long,X
    ASL $39                 ; [06 39      ] Shift Left DP
    COP #$11                ; [02 11      ] Coprocessor interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($1E,X)             ; [01 1E      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 1E      ] Software interrupt
    ORA [$FE]               ; [07 FE      ] OR A with [DP]
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 E6      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    STX $FEF0               ; [8E F0 FE   ] Store X to Absolute
    BVS $24EB               ; [70 FC      ] Branch if Overflow Set
    BRA $24B5               ; [80 C4      ] Branch Always
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $253D               ; [80 48      ] Branch Always
    LDY #$00                ; [A0 00      ] Load Y Immediate
    BRA $2511               ; [80 18      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    STZ $80,X               ; [74 80      ] Store Zero to DP,X
    STZ $00,X               ; [74 00      ] Store Zero to DP,X
    PHP                     ; [08         ] Push Processor Status
    BRA $2528               ; [80 27      ] Branch Always
    TSB $1F                 ; [04 1F      ] Test and Set Bits in DP
    ORA [$0F]               ; [07 0F      ] OR A with [DP]
    TSB $10                 ; [04 10      ] Test and Set Bits in DP
    ORA $3F0F1E             ; [0F 1E 0F 3F] OR A with Absolute Long
    ORA $3F0F4F,X           ; [1F 4F 0F 3F] OR A with Absolute Long,X
    BRK                     ; [00 1F      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA [$04]               ; [07 04      ] OR A with [DP]
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 19      ] Software interrupt
    ASL $30                 ; [06 30      ] Shift Left DP
    AND $B80000,X           ; [3F 00 00 B8] AND A with Absolute Long,X
    BRA $2513               ; [80 F0      ] Branch Always
    JSR $70B8               ; [20 B8 70   ] Jump to Subroutine
    CLC                     ; [18         ] Clear Carry Flag
    BEQ $255D               ; [F0 34      ] Branch if Equal
    BEQ $251F               ; [F0 F4      ] Branch if Equal
    BEQ $2515               ; [F0 E8      ] Branch if Equal
    CPX #$F0                ; [E0 F0      ] Compare X Immediate
    BRK                     ; [00 50      ] Software interrupt
    CPY #$20                ; [C0 20      ] Compare Y Immediate
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    INX                     ; [E8         ] Increment X
    CLC                     ; [18         ] Clear Carry Flag
    BPL $252E               ; [10 F0      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BEQ $2546               ; [F0 00      ] Branch if Equal
    CLV                     ; [B8         ] Clear Overflow Flag
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BNE $2569               ; [D0 10      ] Branch if Not Equal
    JSR $5880               ; [20 80 58   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    INC $FE00,X             ; [FE 00 FE   ] Increment Absolute,X
    BRK                     ; [00 A4      ] Software interrupt
    BRK                     ; [00 A4      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    INC $FC10,X             ; [FE 10 FC   ] Increment Absolute,X
    BMI $2567               ; [30 F8      ] Branch if Minus
    BPL $2535               ; [10 C4      ] Branch if Plus
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine
    BRA $25CD               ; [80 58      ] Branch Always
    BRA $25CF               ; [80 58      ] Branch Always
    BRA $25B1               ; [80 38      ] Branch Always
    SEC                     ; [38         ] Set Carry Flag
    CPX $F0                 ; [E4 F0      ] Compare X with DP
    CPY #$F0                ; [C0 F0      ] Compare Y Immediate
    CPX #$F0                ; [E0 F0      ] Compare X Immediate
    EOR $074E07             ; [4F 07 4E 07] XOR A with Absolute Long
    AND ($0F)               ; [32 0F      ] AND A with (DP)
    ORA ($0F)               ; [12 0F      ] OR A with (DP)
    ROL $1F                 ; [26 1F      ] Rotate Left DP
    EOR $1F5F1F,X           ; [5F 1F 5F 1F] XOR A with Absolute Long,X
    AND $063300,X           ; [3F 00 33 06] AND A with Absolute Long,X
    AND $12                 ; [25 12      ] AND A with Direct Page
    ORA $000F00             ; [0F 00 0F 00] OR A with Absolute Long
    ORA $263900,X           ; [1F 00 39 26] OR A with Absolute Long,X
    JSR $003F               ; [20 3F 00   ] Jump to Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    LDY #$F0                ; [A0 F0      ] Load Y Immediate
    CPY #$70                ; [C0 70      ] Compare Y Immediate
    CPX #$38                ; [E0 38      ] Compare X Immediate
    BEQ $25E1               ; [F0 38      ] Branch if Equal
    BEQ $259F               ; [F0 F4      ] Branch if Equal
    BEQ $2591               ; [F0 E4      ] Branch if Equal
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BRK                     ; [00 C0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BEQ $25B8               ; [F0 00      ] Branch if Equal
    BEQ $25BA               ; [F0 00      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    PHP                     ; [08         ] Push Processor Status
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    AND $102F14             ; [2F 14 2F 10] AND A with Absolute Long
    CLI                     ; [58         ] Clear Interrupt Disable
    AND ($51,X)             ; [21 51      ] AND A with (DP,X)
    JSR $0000               ; [20 00 00   ] Jump to Subroutine
    BRK                     ; [00 00      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    TSB $0D                 ; [04 0D      ] Test and Set Bits in DP
    COP #$16                ; [02 16      ] Coprocessor interrupt
    ORA #$10                ; [09 10      ] OR A with Immediate
    BPL $260D               ; [10 2F      ] Branch if Plus
    ASL $39                 ; [06 39      ] Shift Left DP
    BRK                     ; [00 00      ] Software interrupt
    BEQ $25E4               ; [F0 00      ] Branch if Equal
    CLV                     ; [B8         ] Clear Overflow Flag
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$FE                ; [C0 FE      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BNE $2607               ; [D0 10      ] Branch if Not Equal
    JSR $5880               ; [20 80 58   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    CPY $28                 ; [C4 28      ] Compare Y with DP
    BIT $3600,X             ; [3C 00 36   ] Test Bits Absolute,X
    TSB $54                 ; [04 54      ] Test and Set Bits in DP
    ASL $74                 ; [06 74      ] Shift Left DP
    ROL $21                 ; [26 21      ] Rotate Left DP
    BPL $2634               ; [10 29      ] Branch if Plus
    ORA ($2F),Y             ; [11 2F      ] OR A with (DP),Y
    ORA $0F17,Y             ; [19 17 0F   ] OR A with Absolute,Y
    COP #$11                ; [02 11      ] Coprocessor interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    AND ($1E,X)             ; [21 1E      ] AND A with (DP,X)
    BRK                     ; [00 16      ] Software interrupt
    ORA ($11,X)             ; [01 11      ] OR A with (DP,X)
    PHP                     ; [08         ] Push Processor Status
    PHD                     ; [0B         ] Push Direct Page Register
    ASL $FE                 ; [06 FE      ] Shift Left DP
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BMI $2627               ; [30 FE      ] Branch if Minus
    BRK                     ; [00 FC      ] Software interrupt
    BPL $2625               ; [10 F8      ] Branch if Plus
    BPL $2627               ; [10 F8      ] Branch if Plus
    BCC $2675               ; [90 44      ] Branch if Carry Clear
    BRA $2657               ; [80 24      ] Branch Always
    BCC $2659               ; [90 24      ] Branch if Carry Clear
    BCC $26AB               ; [90 74      ] Branch if Carry Clear
    BVS $26A1               ; [70 68      ] Branch if Overflow Set
    STZ $E0                 ; [64 E0      ] Store Zero to DP
    BEQ $261D               ; [F0 E0      ] Branch if Equal
    BEQ $269F               ; [F0 60      ] Branch if Equal
    BEQ $2657               ; [F0 16      ] Branch if Equal
    ORA $120F12             ; [0F 12 0F 12] OR A with Absolute Long
    ORA $1A0F12             ; [0F 12 0F 1A] OR A with Absolute Long
    ORA $1F0F1F             ; [0F 1F 0F 1F] OR A with Absolute Long
    ORA [$0F]               ; [07 0F      ] OR A with [DP]
    BRK                     ; [00 0D      ] Software interrupt
    COP #$0F                ; [02 0F      ] Coprocessor interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 05      ] Software interrupt
    ASL                     ; [0A         ] Shift Left Accumulator
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BEQ $2642               ; [F0 E0      ] Branch if Equal
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    BVS $2646               ; [70 E0      ] Branch if Overflow Set
    BVS $2648               ; [70 E0      ] Branch if Overflow Set
    INX                     ; [E8         ] Increment X
    CPX #$98                ; [E0 98      ] Compare X Immediate
    BRA $26CD               ; [80 60      ] Branch Always
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BEQ $268A               ; [F0 10      ] Branch if Equal
    CPX #$60                ; [E0 60      ] Compare X Immediate
    BRA $25FE               ; [80 80      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    AND $003F00,X           ; [3F 00 3F 00] AND A with Absolute Long,X
    AND $106F08,X           ; [3F 08 6F 10] AND A with Absolute Long,X
    TCD                     ; [5B         ] Transfer A to Direct Page
    JSR $0000               ; [20 00 00   ] Jump to Subroutine
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    CLC                     ; [18         ] Clear Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    ASL $0E                 ; [06 0E      ] Shift Left DP
    ORA ($10,X)             ; [01 10      ] OR A with (DP,X)
    ORA ($2E),Y             ; [11 2E      ] OR A with (DP),Y
    BRK                     ; [00 00      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 EC      ] Software interrupt
    BPL $269B               ; [10 F4      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    PEA $FC08               ; [F4 08 FC   ] Push Effective Absolute
    BRK                     ; [00 5A      ] Software interrupt
    LDY $BF                 ; [A4 BF      ] Load Y from DP
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BPL $26E7               ; [10 30      ] Branch if Plus
    DEY                     ; [88         ] Decrement Y
    CPY #$18                ; [C0 18      ] Compare Y Immediate
    INY                     ; [C8         ] Increment Y
    JSR $AC40               ; [20 40 AC   ] Jump to Subroutine
    LDY $52                 ; [A4 52      ] Load Y from DP
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BVS $26C4               ; [70 00      ] Branch if Overflow Set
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 55      ] Software interrupt
    JSR $0070               ; [20 70 00   ] Jump to Subroutine
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 67      ] Software interrupt
    BRK                     ; [00 67      ] Software interrupt
    JSL $0F3F00             ; [22 00 3F 0F] Jump to Subroutine Long
    BMI $26DC               ; [30 07      ] Branch if Minus
    BPL $2701               ; [10 2A      ] Branch if Plus
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    ASL $18                 ; [06 18      ] Shift Left DP
    BRK                     ; [00 31      ] Software interrupt
    PLD                     ; [2B         ] Pull Direct Page Register
    SBC $007F00,X           ; [FF 00 7F 00] Subtract with Borrow Absolute Long,X
    db $F3                      ; Incomplete/data bytes

;--- Patch at file offset $1426EB (SNES $D426EB) ---
org $D426EB

    COP #$9F                ; [02 9F      ] Coprocessor interrupt
    ORA ($9F)               ; [12 9F      ] OR A with (DP)
    ASL $46,X               ; [16 46      ] Shift Left DP,X
    BCS $2713               ; [B0 20      ] Branch if Carry Set
    CPY #$0E                ; [C0 0E      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    CLC                     ; [18         ] Clear Carry Flag
    CPY #$30                ; [C0 30      ] Compare Y Immediate
    STY $0C                 ; [84 0C      ] Store Y to DP
    ASL $1E7C               ; [0E 7C 1E   ] Shift Left Absolute
    CLI                     ; [58         ] Clear Interrupt Disable
    ROL $397F,X             ; [3E 7F 39   ] Rotate Left Absolute,X
    AND $191B,X             ; [3D 1B 19   ] AND A with Absolute,X
    ORA [$23]               ; [07 23      ] OR A with [DP]
    ORA $7F3F4F,X           ; [1F 4F 3F 7F] OR A with Absolute Long,X
    AND $07037B,X           ; [3F 7B 03 07] AND A with Absolute Long,X
    BRK                     ; [00 18      ] Software interrupt
    AND $1902,Y             ; [39 02 19   ] AND A with Absolute,Y
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $023D00,X           ; [1F 00 3D 02] OR A with Absolute Long,X
    ORA ($3E,X)             ; [01 3E      ] OR A with (DP,X)
    TSB $07                 ; [04 07      ] Test and Set Bits in DP

;--- Patch at file offset $142724 (SNES $D42724) ---
org $D42724

    db $FE                      ; Incomplete/data bytes

;--- Patch at file offset $142730 (SNES $D42730) ---
org $D42730

    BVS $27AE               ; [70 7C      ] Branch if Overflow Set
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $142742 (SNES $D42742) ---
org $D42742

    BRK                     ; [00 00      ] Software interrupt
    BMI $2746               ; [30 00      ] Branch if Minus
    AND $001F00,X           ; [3F 00 1F 00] AND A with Absolute Long,X
    AND $102F14             ; [2F 14 2F 10] AND A with Absolute Long
    CLI                     ; [58         ] Clear Interrupt Disable
    AND ($00,X)             ; [21 00      ] AND A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    BPL $2765               ; [10 0C      ] Branch if Plus
    ORA $1602               ; [0D 02 16   ] OR A with Absolute
    ORA #$10                ; [09 10      ] OR A with Immediate
    BPL $278F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BEQ $2766               ; [F0 00      ] Branch if Equal
    CLV                     ; [B8         ] Clear Overflow Flag
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    JSR $08F4               ; [20 F4 08   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BNE $2789               ; [D0 10      ] Branch if Not Equal
    JSR $5880               ; [20 80 58   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INY                     ; [C8         ] Increment Y
    EOR $7120,Y             ; [59 20 71   ] XOR A with Absolute,Y
    BRK                     ; [00 50      ] Software interrupt
    BRK                     ; [00 72      ] Software interrupt
    JSR $0074               ; [20 74 00   ] Jump to Subroutine
    BVS $278C               ; [70 00      ] Branch if Overflow Set
    ADC $3F21,Y             ; [79 21 3F   ] Add with Carry Absolute,Y
    ORA #$14                ; [09 14      ] OR A with Immediate
    PLD                     ; [2B         ] Pull Direct Page Register
    ASL $0E11               ; [0E 11 0E   ] Shift Left Absolute
    AND ($2C,X)             ; [21 2C      ] AND A with (DP,X)
    AND ($2A,X)             ; [21 2A      ] AND A with (DP,X)
    AND ($2E,X)             ; [21 2E      ] AND A with (DP,X)
    AND ($07,X)             ; [21 07      ] AND A with (DP,X)
    AND ($00,X)             ; [21 00      ] AND A with (DP,X)
    ORA #$DE                ; [09 DE      ] OR A with Immediate
    BRK                     ; [00 9C      ] Software interrupt
    BPL $27A1               ; [10 FC      ] Branch if Plus
    PLP                     ; [28         ] Pull Processor Status
    JSR ($FE00,X)           ; [FC 00 FE   ] Jump to Subroutine Indirect,X
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    LDY $D8FC               ; [AC FC D8   ] Load Y from Absolute
    STY $28                 ; [84 28      ] Store Y to DP
    BVS $27C4               ; [70 10      ] Branch if Overflow Set
    BMI $276E               ; [30 B8      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    CLV                     ; [B8         ] Clear Overflow Flag
    SEC                     ; [38         ] Set Carry Flag
    LDY $3C38,X             ; [BC 38 3C   ] Load Y from Absolute,X
    BPL $277A               ; [10 BC      ] Branch if Plus
    CPY #$18                ; [C0 18      ] Compare Y Immediate
    EOR $7120,Y             ; [59 20 71   ] XOR A with Absolute,Y
    BRK                     ; [00 50      ] Software interrupt
    BRK                     ; [00 72      ] Software interrupt
    JSR $0074               ; [20 74 00   ] Jump to Subroutine
    BVS $27CC               ; [70 00      ] Branch if Overflow Set
    ADC $3F21,Y             ; [79 21 3F   ] Add with Carry Absolute,Y
    ORA #$14                ; [09 14      ] OR A with Immediate
    PLD                     ; [2B         ] Pull Direct Page Register
    ASL $0E11               ; [0E 11 0E   ] Shift Left Absolute
    AND ($2C,X)             ; [21 2C      ] AND A with (DP,X)
    AND ($2A,X)             ; [21 2A      ] AND A with (DP,X)
    AND ($2E,X)             ; [21 2E      ] AND A with (DP,X)
    AND ($07,X)             ; [21 07      ] AND A with (DP,X)
    AND ($00,X)             ; [21 00      ] AND A with (DP,X)
    ORA #$DE                ; [09 DE      ] OR A with Immediate
    BRK                     ; [00 9C      ] Software interrupt
    BPL $27E1               ; [10 FC      ] Branch if Plus
    PLP                     ; [28         ] Pull Processor Status
    JSR ($FE00,X)           ; [FC 00 FE   ] Jump to Subroutine Indirect,X
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    LDY $D8FC               ; [AC FC D8   ] Load Y from Absolute
    STY $28                 ; [84 28      ] Store Y to DP
    BVS $2804               ; [70 10      ] Branch if Overflow Set
    BMI $27AE               ; [30 B8      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    CLV                     ; [B8         ] Clear Overflow Flag
    SEC                     ; [38         ] Set Carry Flag
    LDY $3C38,X             ; [BC 38 3C   ] Load Y from Absolute,X
    BPL $27BA               ; [10 BC      ] Branch if Plus
    CPY #$18                ; [C0 18      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    AND [$00]               ; [27 00      ] AND A with [DP]
    ADC $017E01,X           ; [7F 01 7E 01] Add with Carry Absolute Long,X
    ROR $3F25,X             ; [7E 25 3F   ] Rotate Right Absolute,X
    CLC                     ; [18         ] Clear Carry Flag

;--- Patch at file offset $142816 (SNES $D42816) ---
org $D42816

    BRK                     ; [00 00      ] Software interrupt
    AND $24                 ; [25 24      ] AND A with Direct Page
    AND $24                 ; [25 24      ] AND A with Direct Page
    AND $183C,X             ; [3D 3C 18   ] AND A with Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 D0      ] Software interrupt
    JSR $90E8               ; [20 E8 90   ] Jump to Subroutine
    JMP ($3AC0,X)           ; [7C C0 3A   ] Jump Indirect,X
    CPY $3E                 ; [C4 3E      ] Compare Y with DP
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    JSR $10A0               ; [20 A0 10   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    BPL $2805               ; [10 C8      ] Branch if Plus
    TRB $E4                 ; [14 E4      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    SEI                     ; [78         ] Set Interrupt Disable
    CLC                     ; [18         ] Clear Carry Flag
    AND $061400,X           ; [3F 00 14 06] AND A with Absolute Long,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BIT $06,X               ; [34 06      ] Test Bits DP,X
    BVC $286C               ; [50 20      ] Branch if Overflow Clear
    ORA #$70                ; [09 70      ] OR A with Immediate
    ROR $0708,X             ; [7E 08 07   ] Rotate Right Absolute,X
    ORA $080000,X           ; [1F 00 00 08] OR A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($2E,X)             ; [01 2E      ] OR A with (DP,X)
    AND ($76,X)             ; [21 76      ] AND A with (DP,X)
    RTI                     ; [40         ] Return from Interrupt
    ORA ($09,X)             ; [01 09      ] OR A with (DP,X)
    LDX $FC40,Y             ; [BE 40 FC   ] Load X from Absolute,Y
    RTS                     ; [60         ] Return from Subroutine
    JSR ($FC60,X)           ; [FC 60 FC   ] Jump to Subroutine Indirect,X
    RTI                     ; [40         ] Return from Interrupt
    INC $CE40,X             ; [FE 40 CE   ] Increment Absolute,X
    BMI $2803               ; [30 96      ] Branch if Minus
    SEI                     ; [78         ] Set Interrupt Disable
    SEP #$3C                ; [E2 3C      ] Set Processor Status Bits
    MVP $08,$08             ; [44 08 08   ] Block Move Positive
    RTS                     ; [60         ] Return from Subroutine
    PHP                     ; [08         ] Push Processor Status
    RTS                     ; [60         ] Return from Subroutine
    PHP                     ; [08         ] Push Processor Status
    BVC $2885               ; [50 0C      ] Branch if Overflow Clear
    RTI                     ; [40         ] Return from Interrupt
    BIT $30,X               ; [34 30      ] Test Bits DP,X
    SEI                     ; [78         ] Set Interrupt Disable
    PHA                     ; [48         ] Push Accumulator
    BIT $9904,X             ; [3C 04 99   ] Test Bits Absolute,X
    BRK                     ; [00 9D      ] Software interrupt
    TSB $077B               ; [0C 7B 07   ] Test and Set Bits Absolute
    PHD                     ; [0B         ] Push Direct Page Register
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 05      ] Software interrupt
    ORA $07,S               ; [03 07      ] OR A with Stack Relative
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    BRK                     ; [00 6E      ] Software interrupt
    ASL $2E42               ; [0E 42 2E   ] Shift Left Absolute
    ORA [$04]               ; [07 04      ] OR A with [DP]
    TSB $04                 ; [04 04      ] Test and Set Bits in DP

;--- Patch at file offset $1428A0 (SNES $D428A0) ---
org $D428A0

    BIT $28,X               ; [34 28      ] Test Bits DP,X
    PLP                     ; [28         ] Pull Processor Status
    JSR $00F0               ; [20 F0 00   ] Jump to Subroutine
    RTI                     ; [40         ] Return from Interrupt
    BRA $2829               ; [80 80      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E8      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    CPX #$10                ; [E0 10      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRA $2838               ; [80 80      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1428C4 (SNES $D428C4) ---
org $D428C4

    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA $001F00             ; [0F 00 1F 00] OR A with Absolute Long
    ORA $063F09,X           ; [1F 09 3F 06] OR A with Absolute Long,X

;--- Patch at file offset $1428D8 (SNES $D428D8) ---
org $D428D8

    BRK                     ; [00 00      ] Software interrupt
    ORA #$09                ; [09 09      ] OR A with Immediate
    ORA #$09                ; [09 09      ] OR A with Immediate
    ASL $0F                 ; [06 0F      ] Shift Left DP
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BCS $2926               ; [B0 40      ] Branch if Carry Set
    INY                     ; [C8         ] Increment Y
    BMI $28DD               ; [30 F4      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    JMP ($7AC0,X)           ; [7C C0 7A   ] Jump Indirect,X
    CPY $3E                 ; [C4 3E      ] Compare Y with DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CPY #$30                ; [C0 30      ] Compare Y Immediate
    BMI $2902               ; [30 08      ] Branch if Minus
    INY                     ; [C8         ] Increment Y
    BPL $28C5               ; [10 C8      ] Branch if Plus
    TRB $C4                 ; [14 C4      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    ADC $3C7C10             ; [6F 10 7C 3C] Add with Carry Absolute Long
    AND $061400,X           ; [3F 00 14 06] AND A with Absolute Long,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BMI $290C               ; [30 00      ] Branch if Minus
    ADC #$10                ; [69 10      ] Add with Carry Immediate
    STZ $1062,X             ; [9E 62 10   ] Store Zero to Absolute,X
    ASL $03                 ; [06 03      ] Shift Left DP
    AND $080000,X           ; [3F 00 00 08] AND A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($16,X)             ; [01 16      ] OR A with (DP,X)
    BPL $2982               ; [10 63      ] Branch if Plus
    RTI                     ; [40         ] Return from Interrupt
    JML [$DC80]             ; [DC 80 DC   ] Jump Long Indirect
    RTI                     ; [40         ] Return from Interrupt
    INC $FE40,X             ; [FE 40 FE   ] Increment Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    DEC $CC00               ; [CE 00 CC   ] Decrement Absolute
    BRK                     ; [00 BC      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    STY $A808               ; [8C 08 A8   ] Store Y to Absolute
    JSR $6028               ; [20 28 60   ] Jump to Subroutine
    TSB $48                 ; [04 48      ] Test and Set Bits in DP
    TSB $48                 ; [04 48      ] Test and Set Bits in DP
    BIT $10                 ; [24 10      ] Test Bits DP
    BMI $293C               ; [30 00      ] Branch if Minus
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 78      ] Software interrupt
    BRK                     ; [00 A2      ] Software interrupt
    WDM #$E1                ; [42 E1      ] Reserved (WDM)
    BRK                     ; [00 32      ] Software interrupt
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    ORA $11,S               ; [03 11      ] OR A with Stack Relative
    BRK                     ; [00 14      ] Software interrupt
    TSB $1C36               ; [0C 36 1C   ] Test and Set Bits Absolute
    BIT $5E00,X             ; [3C 00 5E   ] Test Bits Absolute,X
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    ORA ($01)               ; [12 01      ] OR A with (DP)
    ORA $0303               ; [0D 03 03   ] OR A with Absolute

;--- Patch at file offset $142960 (SNES $D42960) ---
org $D42960

    INY                     ; [C8         ] Increment Y
    BRK                     ; [00 70      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    LDY #$C0                ; [A0 C0      ] Load Y Immediate
    BCC $28E8               ; [90 80      ] Branch if Carry Clear
    BPL $296A               ; [10 00      ] Branch if Plus
    TYA                     ; [98         ] Transfer Y to A
    BMI $2925               ; [30 B8      ] Branch if Minus
    BVS $29E7               ; [70 78      ] Branch if Overflow Set
    BRK                     ; [00 20      ] Software interrupt
    BPL $2933               ; [10 C0      ] Branch if Plus
    BRA $2935               ; [80 C0      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    JSR $30C0               ; [20 C0 30   ] Jump to Subroutine
    RTI                     ; [40         ] Return from Interrupt
    RTS                     ; [60         ] Return from Subroutine
    BPL $297F               ; [10 00      ] Branch if Plus
    BRK                     ; [00 99      ] Software interrupt
    BRK                     ; [00 9D      ] Software interrupt
    TSB $076B               ; [0C 6B 07   ] Test and Set Bits Absolute
    ORA [$0B],Y             ; [17 0B      ] OR A with [DP],Y
    JSL $386A10             ; [22 10 6A 38] Jump to Subroutine Long
    AND $0808,X             ; [3D 08 08   ] AND A with Absolute,X
    BRK                     ; [00 6E      ] Software interrupt
    ASL $2E42               ; [0E 42 2E   ] Shift Left Absolute
    ORA [$04]               ; [07 04      ] OR A with [DP]
    PHD                     ; [0B         ] Push Direct Page Register
    PHP                     ; [08         ] Push Processor Status
    ORA $1900,X             ; [1D 00 19   ] OR A with Absolute,X
    BIT $08                 ; [24 08      ] Test Bits DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 34      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    PLP                     ; [28         ] Pull Processor Status
    JSR $00F0               ; [20 F0 00   ] Jump to Subroutine
    LDY #$40                ; [A0 40      ] Load Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 70      ] Software interrupt
    CPX #$A0                ; [E0 A0      ] Compare X Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRK                     ; [00 E8      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    CPX #$10                ; [E0 10      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRA $29BA               ; [80 00      ] Branch Always
    CPX #$00                ; [E0 00      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $1429C8 (SNES $D429C8) ---
org $D429C8

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    db $0F, $00                 ; Incomplete/data bytes

;--- Patch at file offset $1429DB (SNES $D429DB) ---
org $D429DB

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $1429EA (SNES $D429EA) ---
org $D429EA

    CPX #$00                ; [E0 00      ] Compare X Immediate
    CLC                     ; [18         ] Clear Carry Flag
    CPX #$E4                ; [E0 E4      ] Compare X Immediate
    CLC                     ; [18         ] Clear Carry Flag

;--- Patch at file offset $1429FB (SNES $D429FB) ---
org $D429FB

    BRK                     ; [00 00      ] Software interrupt
    CPX #$20                ; [E0 20      ] Compare X Immediate
    CLC                     ; [18         ] Clear Carry Flag
    ORA $081F00,X           ; [1F 00 1F 08] OR A with Absolute Long,X
    ORA $063F09,X           ; [1F 09 3F 06] OR A with Absolute Long,X
    ROR $7F30,X             ; [7E 30 7F   ] Rotate Right Absolute,X
    ORA $15001F,X           ; [1F 1F 00 15] OR A with Absolute Long,X
    ORA $0909               ; [0D 09 09   ] OR A with Absolute
    ORA #$09                ; [09 09      ] OR A with Immediate
    ORA $06060F             ; [0F 0F 06 06] OR A with Absolute Long
    ORA ($31,X)             ; [01 31      ] OR A with (DP,X)
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    PLX                     ; [FA         ] Pull X Register
    MVP $9F,$60             ; [44 9F 60   ] Block Move Positive
    STA $006F60,X           ; [9F 60 6F 00] Store A to Absolute Long,X
    ROR $6E00               ; [6E 00 6E   ] Rotate Right Absolute
    JSR $20EE               ; [20 EE 20   ] Jump to Subroutine
    ADC $0458A0,X           ; [7F A0 58 04] Add with Carry Absolute Long,X
    STZ $0A                 ; [64 0A      ] Store Zero to DP
    STZ $02                 ; [64 02      ] Store Zero to DP
    STY $92,X               ; [94 92      ] Store Y to DP,X
    BCC $29CE               ; [90 94      ] Branch if Carry Clear
    BCC $29F0               ; [90 B4      ] Branch if Carry Clear
    BPL $2A72               ; [10 34      ] Branch if Plus
    TSB $2A                 ; [04 2A      ] Test and Set Bits in DP
    AND $0D,X               ; [35 0D      ] AND A with DP,X
    BMI $2A44               ; [30 00      ] Branch if Minus
    CLI                     ; [58         ] Clear Interrupt Disable
    JSR $0067               ; [20 67 00   ] Jump to Subroutine
    ROL $04                 ; [26 04      ] Rotate Left DP
    AND [$1C]               ; [27 1C      ] AND A with [DP]
    PHY                     ; [5A         ] Push Y Register
    TSB $007F               ; [0C 7F 00   ] Test and Set Bits Absolute
    COP #$00                ; [02 00      ] Coprocessor interrupt
    ORA $032400             ; [0F 00 24 03] OR A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 1D      ] Software interrupt
    ORA ($1C,X)             ; [01 1C      ] OR A with (DP,X)
    BRK                     ; [00 05      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status

;--- Patch at file offset $142A68 (SNES $D42A68) ---
org $D42A68

    TYA                     ; [98         ] Transfer Y to A

;--- Patch at file offset $142A78 (SNES $D42A78) ---
org $D42A78

    RTI                     ; [40         ] Return from Interrupt
    JSR $20C8               ; [20 C8 20   ] Jump to Subroutine
    CLD                     ; [D8         ] Clear Decimal Flag
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    BRK                     ; [00 78      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    AND $061400,X           ; [3F 00 14 06] AND A with Absolute Long,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BPL $2A8C               ; [10 00      ] Branch if Plus
    ORA #$00                ; [09 00      ] OR A with Immediate
    ASL $0700               ; [0E 00 07   ] Shift Left Absolute
    ORA $080000,X           ; [1F 00 00 08] OR A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BRK                     ; [00 01      ] Software interrupt
    ORA ($19,X)             ; [01 19      ] OR A with (DP,X)
    BRK                     ; [00 1D      ] Software interrupt
    TSB $070B               ; [0C 0B 07   ] Test and Set Bits Absolute
    ORA [$0B],Y             ; [17 0B      ] OR A with [DP],Y
    JSL $386A10             ; [22 10 6A 38] Jump to Subroutine Long
    AND $0808,X             ; [3D 08 08   ] AND A with Absolute,X
    BRK                     ; [00 0E      ] Software interrupt
    ASL $0E02               ; [0E 02 0E   ] Shift Left Absolute
    ORA [$04]               ; [07 04      ] OR A with [DP]
    PHD                     ; [0B         ] Push Direct Page Register
    PHP                     ; [08         ] Push Processor Status
    ORA $1900,X             ; [1D 00 19   ] OR A with Absolute,X
    BIT $08                 ; [24 08      ] Test Bits DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 78      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    AND $061400,X           ; [3F 00 14 06] AND A with Absolute Long,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA ($1D,X)             ; [01 1D      ] OR A with (DP,X)
    BRK                     ; [00 07      ] Software interrupt
    ORA $080000,X           ; [1F 00 00 08] OR A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 05      ] Software interrupt
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    BRK                     ; [00 BE      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    JML [$DC40]             ; [DC 40 DC   ] Jump Long Indirect
    RTI                     ; [40         ] Return from Interrupt
    JSR ($FE40,X)           ; [FC 40 FE   ] Jump to Subroutine Indirect,X
    RTI                     ; [40         ] Return from Interrupt
    INC $3E00,X             ; [FE 00 3E   ] Increment Absolute,X
    CPY #$5C                ; [C0 5C      ] Compare Y Immediate
    CPX #$44                ; [E0 44      ] Compare X Immediate
    PHP                     ; [08         ] Push Processor Status
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine
    PHP                     ; [08         ] Push Processor Status
    BVC $2B01               ; [50 08      ] Branch if Overflow Clear
    MVN $18,$24             ; [54 18 24   ] Block Move Negative
    CLD                     ; [D8         ] Clear Decimal Flag
    CPY $E0                 ; [C4 E0      ] Compare Y with DP
    PLP                     ; [28         ] Pull Processor Status
    BIT $04                 ; [24 04      ] Test Bits DP
    AND $04                 ; [25 04      ] AND A with Direct Page
    ORA $0B1701,X           ; [1F 01 17 0B] OR A with Absolute Long,X
    JSL $386A10             ; [22 10 6A 38] Jump to Subroutine Long
    db $3D                      ; Incomplete/data bytes

;--- Patch at file offset $142B15 (SNES $D42B15) ---
org $D42B15

    BRK                     ; [00 0B      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA $1900,X             ; [1D 00 19   ] OR A with Absolute,X
    BIT $08                 ; [24 08      ] Test Bits DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 98      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BEQ $2B24               ; [F0 00      ] Branch if Equal
    RTS                     ; [60         ] Return from Subroutine
    CPY #$A0                ; [C0 A0      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 70      ] Software interrupt
    CPX #$A0                ; [E0 A0      ] Compare X Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRK                     ; [00 60      ] Software interrupt
    JSR $0000               ; [20 00 00   ] Jump to Subroutine
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRA $2B3A               ; [80 00      ] Branch Always
    CPX #$00                ; [E0 00      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    BRA $2B3F               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    BRK                     ; [00 D0      ] Software interrupt
    JSR $90E8               ; [20 E8 90   ] Jump to Subroutine
    JMP ($3AC0,X)           ; [7C C0 3A   ] Jump Indirect,X
    CPY $3E                 ; [C4 3E      ] Compare Y with DP
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    JSR $10A0               ; [20 A0 10   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    BPL $2B25               ; [10 C8      ] Branch if Plus
    TRB $E4                 ; [14 E4      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    LDX $FC40,Y             ; [BE 40 FC   ] Load X from Absolute,Y
    RTI                     ; [40         ] Return from Interrupt
    CPX $40                 ; [E4 40      ] Compare X with DP
    CPX $40                 ; [E4 40      ] Compare X with DP
    INC $20                 ; [E6 20      ] Increment DP
    LDX $0E30,Y             ; [BE 30 0E   ] Load X from Absolute,Y
    BRK                     ; [00 9C      ] Software interrupt
    BRK                     ; [00 44      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 40      ] Software interrupt
    BPL $2BBE               ; [10 48      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    RTI                     ; [40         ] Return from Interrupt
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 74      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    TRB $40                 ; [14 40      ] Test and Reset Bits DP
    JSR $0099               ; [20 99 00   ] Jump to Subroutine
    STA $6B0C,X             ; [9D 0C 6B   ] Store A to Absolute,X
    ORA [$17]               ; [07 17      ] OR A with [DP]
    PHD                     ; [0B         ] Push Direct Page Register
    JSL $386A10             ; [22 10 6A 38] Jump to Subroutine Long
    AND $0808,X             ; [3D 08 08   ] AND A with Absolute,X
    BRK                     ; [00 6E      ] Software interrupt
    ASL $2E42               ; [0E 42 2E   ] Shift Left Absolute
    ORA [$04]               ; [07 04      ] OR A with [DP]
    PHD                     ; [0B         ] Push Direct Page Register
    PHP                     ; [08         ] Push Processor Status
    ORA $1900,X             ; [1D 00 19   ] OR A with Absolute,X
    BIT $08                 ; [24 08      ] Test Bits DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 34      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    PLP                     ; [28         ] Pull Processor Status
    JSR $00F0               ; [20 F0 00   ] Jump to Subroutine
    LDY #$40                ; [A0 40      ] Load Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 70      ] Software interrupt
    CPX #$A0                ; [E0 A0      ] Compare X Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRK                     ; [00 E8      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    CPX #$10                ; [E0 10      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRA $2BBA               ; [80 00      ] Branch Always
    CPX #$00                ; [E0 00      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $142BC4 (SNES $D42BC4) ---
org $D42BC4

    AND [$00]               ; [27 00      ] AND A with [DP]
    ADC $017E01,X           ; [7F 01 7E 01] Add with Carry Absolute Long,X
    ROR $3F25,X             ; [7E 25 3F   ] Rotate Right Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    SEI                     ; [78         ] Set Interrupt Disable
    CLC                     ; [18         ] Clear Carry Flag

;--- Patch at file offset $142BD6 (SNES $D42BD6) ---
org $D42BD6

    AND $24                 ; [25 24      ] AND A with Direct Page
    AND $24                 ; [25 24      ] AND A with Direct Page
    AND $183C,X             ; [3D 3C 18   ] AND A with Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    ORA [$1F]               ; [07 1F      ] OR A with [DP]
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 D0      ] Software interrupt
    JSR $90E8               ; [20 E8 90   ] Jump to Subroutine
    JMP ($3AC0,X)           ; [7C C0 3A   ] Jump Indirect,X
    CPY $3E                 ; [C4 3E      ] Compare Y with DP
    CPX #$BE                ; [E0 BE      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    JSR $10A0               ; [20 A0 10   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    BPL $2BC3               ; [10 C8      ] Branch if Plus
    TRB $E4                 ; [14 E4      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    MVP $08,$3F             ; [44 08 3F   ] Block Move Positive
    BRK                     ; [00 74      ] Software interrupt
    ASL $54                 ; [06 54      ] Shift Left DP
    ASL $54                 ; [06 54      ] Shift Left DP
    ASL $70                 ; [06 70      ] Shift Left DP
    JSR $0069               ; [20 69 00   ] Jump to Subroutine
    ROL $1910,X             ; [3E 10 19   ] Rotate Left Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    AND ($2E,X)             ; [21 2E      ] AND A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BPL $2C1E               ; [10 01      ] Branch if Plus
    ORA ($0F),Y             ; [11 0F      ] OR A with (DP),Y
    ORA $CE00FE             ; [0F FE 00 CE] OR A with Absolute Long
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BVS $2C27               ; [70 FE      ] Branch if Overflow Set
    RTS                     ; [60         ] Return from Subroutine
    ASL $1400,X             ; [1E 00 14   ] Shift Left Absolute,X
    PHP                     ; [08         ] Push Processor Status
    PLP                     ; [28         ] Pull Processor Status
    BPL $2C35               ; [10 04      ] Branch if Plus
    BRK                     ; [00 24      ] Software interrupt
    BPL $2C59               ; [10 24      ] Branch if Plus
    BPL $2CAB               ; [10 74      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    STZ $08                 ; [64 08      ] Store Zero to DP
    CPY #$24                ; [C0 24      ] Compare Y Immediate
    INY                     ; [C8         ] Increment Y
    JSR $C090               ; [20 90 C0   ] Jump to Subroutine
    TRB $1B0C               ; [1C 0C 1B   ] Test and Reset Bits Absolute
    ORA [$0B]               ; [07 0B      ] OR A with [DP]
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 05      ] Software interrupt
    ORA $07,S               ; [03 07      ] OR A with Stack Relative
    COP #$07                ; [02 07      ] Coprocessor interrupt
    COP #$06                ; [02 06      ] Coprocessor interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA $040407             ; [0F 07 04 04] OR A with Absolute Long
    TSB $03                 ; [04 03      ] Test and Set Bits in DP
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRA $2CA5               ; [80 40      ] Branch Always
    BRA $2BE7               ; [80 80      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRA $2BF3               ; [80 80      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRA $2C77               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 09      ] Software interrupt
    ASL $17                 ; [06 17      ] Shift Left DP
    PHP                     ; [08         ] Push Processor Status
    ORA $011E00,X           ; [1F 00 1E 01] OR A with Absolute Long,X
    BIT $3C13               ; [2C 13 3C   ] Test Bits Absolute
    ORA [$00]               ; [07 00      ] OR A with [DP]
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    ASL $06                 ; [06 06      ] Shift Left DP
    ORA #$08                ; [09 08      ] OR A with Immediate
    ASL $09                 ; [06 09      ] Shift Left DP
    TSB $03                 ; [04 03      ] Test and Set Bits in DP
    CLC                     ; [18         ] Clear Carry Flag
    ORA [$00],Y             ; [17 00      ] OR A with [DP],Y
    BRK                     ; [00 00      ] Software interrupt
    BRA $2CA4               ; [80 00      ] Branch Always
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    SBC ($40)               ; [F2 40      ] Subtract with Borrow (DP)
    AND $C03FC0,X           ; [3F C0 3F C0] AND A with Absolute Long,X
    AND $0000D2,X           ; [3F D2 00 00] AND A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRA $2CB6               ; [80 00      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 D2      ] Software interrupt
    ORA ($D2)               ; [12 D2      ] OR A with (DP)
    ORA ($DE)               ; [12 DE      ] OR A with (DP)
    ASL $073E,X             ; [1E 3E 07   ] Shift Left Absolute,X
    EOR $007921,X           ; [5F 21 79 00] XOR A with Absolute Long,X
    ADC $2708,Y             ; [79 08 27   ] Add with Carry Absolute,Y
    ORA $23                 ; [05 23      ] OR A with Direct Page
    BRK                     ; [00 17      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    ORA $07,S               ; [03 07      ] OR A with Stack Relative
    BPL $2CD3               ; [10 00      ] Branch if Plus
    AND ($24),Y             ; [31 24      ] AND A with (DP),Y
    COP #$0E                ; [02 0E      ] Coprocessor interrupt
    BRK                     ; [00 1C      ] Software interrupt
    ORA ($18,X)             ; [01 18      ] OR A with (DP,X)
    TSB $01                 ; [04 01      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 03      ] Software interrupt
    ROR $F9EC,X             ; [7E EC F9   ] Rotate Right Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    CMP $80E480,X           ; [DF 80 E4 80] Compare A with Absolute Long,X
    PEI ($80)               ; [D4 80      ] Push Effective Indirect
    CPY $80                 ; [C4 80      ] Compare Y with DP
    CPY $F200               ; [CC 00 F2   ] Compare Y with Absolute
    CPY $2CCC               ; [CC CC 2C   ] Compare Y with Absolute
    ASL $1E                 ; [06 1E      ] Shift Left DP
    BRK                     ; [00 A0      ] Software interrupt
    BRK                     ; [00 98      ] Software interrupt
    JSR $3088               ; [20 88 30   ] Jump to Subroutine
    DEY                     ; [88         ] Decrement Y
    BRK                     ; [00 30      ] Software interrupt
    TSB $0FCC               ; [0C CC 0F   ] Test and Set Bits Absolute
    ORA $13,S               ; [03 13      ] OR A with Stack Relative
    ORA $550726             ; [0F 26 07 55] OR A with Absolute Long
    AND ($77,S),Y           ; [33 77      ] AND A with (SR),Y
    BMI $2D45               ; [30 3A      ] Branch if Minus
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    BRK                     ; [00 02      ] Software interrupt
    ORA ($0F,X)             ; [01 0F      ] OR A with (DP,X)
    TSB $011F               ; [0C 1F 01   ] Test and Set Bits Absolute
    AND ($0A,S),Y           ; [33 0A      ] AND A with (SR),Y
    BPL $2D42               ; [10 28      ] Branch if Plus
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    AND $3506,Y             ; [39 06 35   ] AND A with Absolute,Y
    ORA ($8B)               ; [12 8B      ] OR A with (DP)
    INY                     ; [C8         ] Increment Y
    TSB $1808               ; [0C 08 18   ] Test and Set Bits Absolute
    BRK                     ; [00 A0      ] Software interrupt
    BRA $2CED               ; [80 C0      ] Branch Always
    BRA $2CAF               ; [80 80      ] Branch Always
    BRK                     ; [00 E6      ] Software interrupt
    REP #$DA                ; [C2 DA      ] Reset Processor Status Bits
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
    MVP $28,$D0             ; [44 28 D0   ] Block Move Positive
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRA $2D7C               ; [80 40      ] Branch Always
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $142D44 (SNES $D42D44) ---
org $D42D44

    BRK                     ; [00 00      ] Software interrupt
    ORA #$00                ; [09 00      ] OR A with Immediate
    ORA $001F00,X           ; [1F 00 1F 00] OR A with Absolute Long,X
    ORA $063F09,X           ; [1F 09 3F 06] OR A with Absolute Long,X

;--- Patch at file offset $142D56 (SNES $D42D56) ---
org $D42D56

    BRK                     ; [00 00      ] Software interrupt
    ORA #$09                ; [09 09      ] OR A with Immediate
    ORA #$09                ; [09 09      ] OR A with Immediate
    ORA $06060F             ; [0F 0F 06 06] OR A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 D0      ] Software interrupt
    JSR $10E8               ; [20 E8 10   ] Jump to Subroutine
    JSR ($BA40,X)           ; [FC 40 BA   ] Jump to Subroutine Indirect,X
    MVP $BE,$60             ; [44 BE 60   ] Block Move Positive
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    JSR $1020               ; [20 20 10   ] Jump to Subroutine
    PHA                     ; [48         ] Push Accumulator
    BPL $2DC5               ; [10 48      ] Branch if Plus
    TRB $64                 ; [14 64      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    ROL $3F1E,X             ; [3E 1E 3F   ] Rotate Left Absolute,X
    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 19      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 4B      ] Software interrupt
    BMI $2D2B               ; [30 9C      ] Branch if Minus
    RTS                     ; [60         ] Return from Subroutine
    ORA ($1F,X)             ; [01 1F      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA [$0E]               ; [07 0E      ] OR A with [DP]
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 34      ] Software interrupt
    JSR $4360               ; [20 60 43   ] Jump to Subroutine
    ROL $DC40,X             ; [3E 40 DC   ] Rotate Left Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    JSR ($FC40,X)           ; [FC 40 FC   ] Jump to Subroutine Indirect,X
    RTI                     ; [40         ] Return from Interrupt
    DEC $9600,X             ; [DE 00 96   ] Decrement Absolute,X
    PHP                     ; [08         ] Push Processor Status
    TXS                     ; [9A         ] Transfer X to Stack Pointer
    TSB $EE                 ; [04 EE      ] Test and Set Bits in DP
    RTS                     ; [60         ] Return from Subroutine
    CPY $88                 ; [C4 88      ] Compare Y with DP
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine
    CLC                     ; [18         ] Clear Carry Flag
    RTI                     ; [40         ] Return from Interrupt
    PHP                     ; [08         ] Push Processor Status
    RTI                     ; [40         ] Return from Interrupt
    BIT $00                 ; [24 00      ] Test Bits DP
    PLA                     ; [68         ] Pull Accumulator
    PHP                     ; [08         ] Push Processor Status
    MVP $24,$70             ; [44 24 70   ] Block Move Positive
    BRK                     ; [00 3E      ] Software interrupt
    ASL $003F,X             ; [1E 3F 00   ] Shift Left Absolute,X
    BPL $2DC6               ; [10 00      ] Branch if Plus
    BPL $2DC8               ; [10 00      ] Branch if Plus
    ORA $3000,Y             ; [19 00 30   ] OR A with Absolute,Y
    BRK                     ; [00 4B      ] Software interrupt
    BMI $2D6B               ; [30 9C      ] Branch if Minus
    RTS                     ; [60         ] Return from Subroutine
    ORA ($1F,X)             ; [01 1F      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA [$0E]               ; [07 0E      ] OR A with [DP]
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 34      ] Software interrupt
    JSR $4360               ; [20 60 43   ] Jump to Subroutine
    ROL $DC40,X             ; [3E 40 DC   ] Rotate Left Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    JSR ($FC40,X)           ; [FC 40 FC   ] Jump to Subroutine Indirect,X
    RTI                     ; [40         ] Return from Interrupt
    INC $9600,X             ; [FE 00 96   ] Increment Absolute,X
    PHP                     ; [08         ] Push Processor Status
    TXS                     ; [9A         ] Transfer X to Stack Pointer
    TSB $EE                 ; [04 EE      ] Test and Set Bits in DP
    RTS                     ; [60         ] Return from Subroutine
    CPY $88                 ; [C4 88      ] Compare Y with DP
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine
    CLC                     ; [18         ] Clear Carry Flag
    RTI                     ; [40         ] Return from Interrupt
    PHP                     ; [08         ] Push Processor Status
    RTI                     ; [40         ] Return from Interrupt
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    PLA                     ; [68         ] Pull Accumulator
    PHP                     ; [08         ] Push Processor Status
    MVP $24,$70             ; [44 24 70   ] Block Move Positive
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 1B      ] Software interrupt
    ORA [$2F]               ; [07 2F      ] OR A with [DP]
    ORA $29113E,X           ; [1F 3E 11 29] OR A with Absolute Long,X
    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $142E16 (SNES $D42E16) ---
org $D42E16

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $001100,X           ; [1F 00 11 00] OR A with Absolute Long,X
    BRK                     ; [00 1E      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BEQ $2E26               ; [F0 00      ] Branch if Equal
    CLV                     ; [B8         ] Clear Overflow Flag
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    JSR $C874               ; [20 74 C8   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    CPY $7E                 ; [C4 7E      ] Compare Y with DP
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BNE $2E49               ; [D0 10      ] Branch if Not Equal
    JSR $98C0               ; [20 C0 98   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $E4                 ; [14 E4      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $11                 ; [06 11      ] Shift Left DP
    BRK                     ; [00 29      ] Software interrupt
    ORA ($7F),Y             ; [11 7F      ] OR A with (DP),Y
    CLC                     ; [18         ] Clear Carry Flag
    ASL $38                 ; [06 38      ] Shift Left DP
    COP #$11                ; [02 11      ] Coprocessor interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 15      ] Software interrupt
    ORA ($18)               ; [12 18      ] OR A with (DP)
    CLC                     ; [18         ] Clear Carry Flag
    LSR $BCE0,X             ; [5E E0 BC   ] Shift Right Absolute,X
    RTS                     ; [60         ] Return from Subroutine
    LDY $BC60,X             ; [BC 60 BC   ] Load Y from Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    INC $FE40,X             ; [FE 40 FE   ] Increment Absolute,X
    BRA $2E2B               ; [80 BE      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    JML [$E4F0]             ; [DC F0 E4   ] Jump Long Indirect
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRK                     ; [00 68      ] Software interrupt
    BRK                     ; [00 48      ] Software interrupt
    BPL $2ED5               ; [10 5C      ] Branch if Plus
    BRK                     ; [00 8C      ] Software interrupt
    BPL $2EE5               ; [10 68      ] Branch if Plus
    STZ $F0                 ; [64 F0      ] Store Zero to DP
    BEQ $2E1A               ; [F0 99      ] Branch if Equal
    ASL $069F               ; [0E 9F 06   ] Shift Left Absolute
    ADC #$07                ; [69 07      ] Add with Carry Immediate
    ORA ($0F),Y             ; [11 0F      ] OR A with (DP),Y
    TSB $0600               ; [0C 00 06   ] Test and Set Bits Absolute
    COP #$07                ; [02 07      ] Coprocessor interrupt
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    BRK                     ; [00 6E      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    ROL $07                 ; [26 07      ] Rotate Left DP
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 28      ] Software interrupt
    JSR $2028               ; [20 28 20   ] Jump to Subroutine
    BEQ $2EA6               ; [F0 00      ] Branch if Equal
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    BRA $2EAA               ; [80 00      ] Branch Always
    BRA $2EAC               ; [80 00      ] Branch Always
    BRA $2EAE               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BNE $2ED2               ; [D0 20      ] Branch if Not Equal
    CPY #$30                ; [C0 30      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRA $2EB8               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $142EC4 (SNES $D42EC4) ---
org $D42EC4

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    ORA [$2F]               ; [07 2F      ] OR A with [DP]
    ORA $29113E,X           ; [1F 3E 11 29] OR A with Absolute Long,X
    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $142ED6 (SNES $D42ED6) ---
org $D42ED6

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $001100,X           ; [1F 00 11 00] OR A with Absolute Long,X
    BRK                     ; [00 1E      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BEQ $2EE6               ; [F0 00      ] Branch if Equal
    CLV                     ; [B8         ] Clear Overflow Flag
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    JSR $C874               ; [20 74 C8   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    CPY $7E                 ; [C4 7E      ] Compare Y with DP
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BNE $2F09               ; [D0 10      ] Branch if Not Equal
    JSR $98C0               ; [20 C0 98   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $E4                 ; [14 E4      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    AND ($00)               ; [32 00      ] AND A with (DP)
    TRB $1402               ; [1C 02 14   ] Test and Reset Bits Absolute
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $39                 ; [06 39      ] Shift Left DP
    BRK                     ; [00 65      ] Software interrupt
    ORA ($A7,X)             ; [01 A7      ] OR A with (DP,X)
    AND ($06,X)             ; [21 06      ] AND A with (DP,X)
    SEC                     ; [38         ] Set Carry Flag
    PHP                     ; [08         ] Push Processor Status
    ORA $00,X               ; [15 00      ] OR A with DP,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BRK                     ; [00 19      ] Software interrupt
    COP #$19                ; [02 19      ] Coprocessor interrupt
    RTS                     ; [60         ] Return from Subroutine
    LSR $BCE0,X             ; [5E E0 BC   ] Shift Right Absolute,X
    RTS                     ; [60         ] Return from Subroutine
    LDY $BC60,X             ; [BC 60 BC   ] Load Y from Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    INC $FE40,X             ; [FE 40 FE   ] Increment Absolute,X
    CPY #$DE                ; [C0 DE      ] Compare Y Immediate
    BCS $2F1B               ; [B0 EC      ] Branch if Carry Set
    SEI                     ; [78         ] Set Interrupt Disable
    CPX $28                 ; [E4 28      ] Compare X with DP
    PLA                     ; [68         ] Pull Accumulator
    BRK                     ; [00 68      ] Software interrupt
    BRK                     ; [00 48      ] Software interrupt
    BPL $2F95               ; [10 5C      ] Branch if Plus
    BRK                     ; [00 CC      ] Software interrupt
    BRK                     ; [00 B0      ] Software interrupt
    BIT $78,X               ; [34 78      ] Test Bits DP,X
    SEI                     ; [78         ] Set Interrupt Disable
    TYA                     ; [98         ] Transfer Y to A
    ORA [$5F],Y             ; [17 5F      ] OR A with [DP],Y
    ORA $310F78             ; [0F 78 0F 31] OR A with Absolute Long
    ORA $320012,X           ; [1F 12 00 32] OR A with Absolute Long,X
    BPL $2F7A               ; [10 2D      ] Branch if Plus

;--- Patch at file offset $142F5A (SNES $D42F5A) ---
org $D42F5A

    ORA $1018               ; [0D 18 10   ] OR A with Absolute
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    INY                     ; [C8         ] Increment Y
    BRA $2F4B               ; [80 E8      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    TYA                     ; [98         ] Transfer Y to A
    BPL $2EF7               ; [10 90      ] Branch if Plus
    BRK                     ; [00 60      ] Software interrupt
    BRK                     ; [00 A0      ] Software interrupt
    BRA $2F4D               ; [80 E0      ] Branch Always
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    BRK                     ; [00 A0      ] Software interrupt
    BPL $2F73               ; [10 00      ] Branch if Plus
    BVS $2FD5               ; [70 60      ] Branch if Overflow Set
    BPL $2FD7               ; [10 60      ] Branch if Plus
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 99      ] Software interrupt
    ASL $069F               ; [0E 9F 06   ] Shift Left Absolute
    ADC #$07                ; [69 07      ] Add with Carry Immediate
    ORA ($0F),Y             ; [11 0F      ] OR A with (DP),Y
    JSL $307200             ; [22 00 72 30] Jump to Subroutine Long
    AND $0808,X             ; [3D 08 08   ] AND A with Absolute,X
    BRK                     ; [00 6E      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt

;--- Patch at file offset $142F9A (SNES $D42F9A) ---
org $D42F9A

    ORA #$3C                ; [09 3C      ] OR A with Immediate
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    JSR $2028               ; [20 28 20   ] Jump to Subroutine
    BEQ $2FA6               ; [F0 00      ] Branch if Equal
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    JSR $B000               ; [20 00 B0   ] Jump to Subroutine
    LDY #$E0                ; [A0 E0      ] Load Y Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRK                     ; [00 C0      ] Software interrupt
    BMI $2F73               ; [30 C0      ] Branch if Minus
    BMI $2FB5               ; [30 00      ] Branch if Minus
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    BRA $2FFB               ; [80 40      ] Branch Always
    CPX #$00                ; [E0 00      ] Compare X Immediate
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $142FCC (SNES $D42FCC) ---
org $D42FCC

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $142FEC (SNES $D42FEC) ---
org $D42FEC

    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 EC      ] Software interrupt
    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $142FFB (SNES $D42FFB) ---
org $D42FFB

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    ORA [$00]               ; [07 00      ] OR A with [DP]
    INC                     ; [1A         ] Increment Accumulator
    ORA [$3F]               ; [07 3F      ] OR A with [DP]
    ORA $51112E             ; [0F 2E 11 51] OR A with Absolute Long
    JSR $0039               ; [20 39 00   ] Jump to Subroutine
    ORA [$00],Y             ; [17 00      ] OR A with [DP],Y
    ORA $06,X               ; [15 06      ] OR A with DP,X
    BRK                     ; [00 00      ] Software interrupt
    ORA [$01]               ; [07 01      ] OR A with [DP]
    ORA $180100,X           ; [1F 00 01 18] OR A with Absolute Long,X
    TSB $0422               ; [0C 22 04   ] Test and Set Bits Absolute
    COP #$08                ; [02 08      ] Coprocessor interrupt
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 F7      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    XCE                     ; [FB         ] Exchange Carry and Emulation
    CPY $BD                 ; [C4 BD      ] Compare Y with DP
    SEP #$FF                ; [E2 FF      ] Set Processor Status Bits

;--- Patch at file offset $143030 (SNES $D43030) ---
org $D43030

    TRB $28                 ; [14 28      ] Test and Reset Bits DP
    DEX                     ; [CA         ] Decrement X
    TRB $E4                 ; [14 E4      ] Test and Reset Bits DP
    LSR                     ; [4A         ] Shift Right Accumulator
    SBC ($04)               ; [F2 04      ] Subtract with Borrow (DP)

;--- Patch at file offset $143040 (SNES $D43040) ---
org $D43040

    ORA $06,X               ; [15 06      ] OR A with DP,X
    AND [$04],Y             ; [37 04      ] AND A with [DP],Y
    db $4C, $00                 ; Incomplete/data bytes

;--- Patch at file offset $143050 (SNES $D43050) ---
org $D43050

    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    db $30                      ; Incomplete/data bytes

;--- Patch at file offset $143061 (SNES $D43061) ---
org $D43061

    BRK                     ; [00 BE      ] Software interrupt
    CPX #$DC                ; [E0 DC      ] Compare X Immediate
    BVS $30DF               ; [70 78      ] Branch if Overflow Set
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $143070 (SNES $D43070) ---
org $D43070

    TSB $E002               ; [0C 02 E0   ] Test and Set Bits Absolute
    CPX $7070               ; [EC 70 70   ] Compare X with Absolute
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $143080 (SNES $D43080) ---
org $D43080

    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $11                 ; [06 11      ] Shift Left DP
    BRK                     ; [00 09      ] Software interrupt
    ORA ($0F,X)             ; [01 0F      ] OR A with (DP,X)
    BRK                     ; [00 06      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    COP #$11                ; [02 11      ] Coprocessor interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 05      ] Software interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    BRK                     ; [00 19      ] Software interrupt
    ASL $060F               ; [0E 0F 06   ] Shift Left Absolute
    ORA #$07                ; [09 07      ] OR A with Immediate
    ORA ($0F),Y             ; [11 0F      ] OR A with (DP),Y
    JSL $307200             ; [22 00 72 30] Jump to Subroutine Long
    AND $0808,X             ; [3D 08 08   ] AND A with Absolute,X
    BRK                     ; [00 0E      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $1430BA (SNES $D430BA) ---
org $D430BA

    ORA #$3C                ; [09 3C      ] OR A with Immediate
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $11                 ; [06 11      ] Shift Left DP
    BRK                     ; [00 08      ] Software interrupt
    ORA ($1F,X)             ; [01 1F      ] OR A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    SEC                     ; [38         ] Set Carry Flag
    COP #$11                ; [02 11      ] Coprocessor interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 05      ] Software interrupt
    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    ORA ($5E,X)             ; [01 5E      ] OR A with (DP,X)
    CPX #$BC                ; [E0 BC      ] Compare X Immediate
    RTS                     ; [60         ] Return from Subroutine
    LDY $BC60,X             ; [BC 60 BC   ] Load Y from Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    INC $FE40,X             ; [FE 40 FE   ] Increment Absolute,X
    BRK                     ; [00 FE      ] Software interrupt
    BRA $316B               ; [80 7C      ] Branch Always
    CPY #$E4                ; [C0 E4      ] Compare Y Immediate
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRK                     ; [00 68      ] Software interrupt
    BRK                     ; [00 48      ] Software interrupt
    BPL $3155               ; [10 5C      ] Branch if Plus
    BRK                     ; [00 0C      ] Software interrupt
    BMI $3085               ; [30 88      ] Branch if Minus
    LDY $C0,X               ; [B4 C0      ] Load Y from DP,X
    CLD                     ; [D8         ] Clear Decimal Flag

;--- Patch at file offset $143106 (SNES $D43106) ---
org $D43106

    ORA ($0F),Y             ; [11 0F      ] OR A with (DP),Y
    JSL $307200             ; [22 00 72 30] Jump to Subroutine Long
    db $3D                      ; Incomplete/data bytes

;--- Patch at file offset $14311A (SNES $D4311A) ---
org $D4311A

    ORA #$3C                ; [09 3C      ] OR A with Immediate
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    RTI                     ; [40         ] Return from Interrupt
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    JSR $B000               ; [20 00 B0   ] Jump to Subroutine
    LDY #$E0                ; [A0 E0      ] Load Y Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRK                     ; [00 40      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRA $3134               ; [80 00      ] Branch Always
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $3138               ; [80 00      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    BRA $317B               ; [80 40      ] Branch Always
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 B8      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    JSR $C874               ; [20 74 C8   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    CPY $7E                 ; [C4 7E      ] Compare Y with DP
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BNE $3169               ; [D0 10      ] Branch if Not Equal
    JSR $98C0               ; [20 C0 98   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $E4                 ; [14 E4      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    LSR $BCE0,X             ; [5E E0 BC   ] Shift Right Absolute,X
    RTS                     ; [60         ] Return from Subroutine
    LDY $40                 ; [A4 40      ] Load Y from DP
    LDY $40                 ; [A4 40      ] Load Y from DP
    INC $8E30,X             ; [FE 30 8E   ] Increment Absolute,X
    BRA $30FB               ; [80 8E      ] Branch Always
    BRK                     ; [00 1C      ] Software interrupt
    BRK                     ; [00 E4      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 50      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    CLI                     ; [58         ] Clear Interrupt Disable
    BRK                     ; [00 00      ] Software interrupt
    BMI $311F               ; [30 A4      ] Branch if Minus
    BNE $31DD               ; [D0 60      ] Branch if Not Equal
    TRB $C0                 ; [14 C0      ] Test and Reset Bits DP
    PLP                     ; [28         ] Pull Processor Status

;--- Patch at file offset $143186 (SNES $D43186) ---
org $D43186

    ORA ($0F),Y             ; [11 0F      ] OR A with (DP),Y
    JSL $307200             ; [22 00 72 30] Jump to Subroutine Long
    db $3D                      ; Incomplete/data bytes

;--- Patch at file offset $14319A (SNES $D4319A) ---
org $D4319A

    ORA #$3C                ; [09 3C      ] OR A with Immediate
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CLV                     ; [B8         ] Clear Overflow Flag
    BRA $3193               ; [80 F0      ] Branch Always
    BRK                     ; [00 E0      ] Software interrupt
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    BRA $31C9               ; [80 20      ] Branch Always
    BRK                     ; [00 B0      ] Software interrupt
    LDY #$E0                ; [A0 E0      ] Load Y Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRK                     ; [00 80      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 20      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $31B8               ; [80 00      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    BRA $31FB               ; [80 40      ] Branch Always
    CPX #$00                ; [E0 00      ] Compare X Immediate
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $1431C4 (SNES $D431C4) ---
org $D431C4

    ORA [$00]               ; [07 00      ] OR A with [DP]
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    ORA [$2F]               ; [07 2F      ] OR A with [DP]
    ORA $29113E,X           ; [1F 3E 11 29] OR A with Absolute Long,X
    BPL $3220               ; [10 51      ] Branch if Plus
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $1431D6 (SNES $D431D6) ---
org $D431D6

    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $001100,X           ; [1F 00 11 00] OR A with Absolute Long,X
    BRK                     ; [00 1E      ] Software interrupt
    ASL $38                 ; [06 38      ] Shift Left DP
    BRK                     ; [00 00      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 B4      ] Software interrupt
    PHA                     ; [48         ] Push Accumulator
    PLX                     ; [FA         ] Pull X Register
    TSB $7A                 ; [04 7A      ] Test and Set Bits in DP
    CPY $FE                 ; [C4 FE      ] Compare Y with DP
    CPY #$7E                ; [C0 7E      ] Compare Y Immediate
    CPX #$5E                ; [E0 5E      ] Compare X Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    INY                     ; [C8         ] Increment Y
    SEC                     ; [38         ] Set Carry Flag
    TSB $C8                 ; [04 C8      ] Test and Set Bits in DP
    STY $C8,X               ; [94 C8      ] Store Y to DP,X
    TRB $E0                 ; [14 E0      ] Test and Reset Bits DP
    TSB $28E4               ; [0C E4 28   ] Test and Set Bits Absolute
    BIT $3600,X             ; [3C 00 36   ] Test Bits Absolute,X
    TSB $54                 ; [04 54      ] Test and Set Bits in DP
    ASL $54                 ; [06 54      ] Shift Left DP
    ASL $71                 ; [06 71      ] Shift Left DP
    JSR $012B               ; [20 2B 01   ] Jump to Subroutine
    ORA [$00],Y             ; [17 00      ] OR A with [DP],Y
    ORA $020F,Y             ; [19 0F 02   ] OR A with Absolute,Y
    ORA ($08),Y             ; [11 08      ] OR A with (DP),Y
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    AND ($0E,X)             ; [21 0E      ] AND A with (DP,X)
    JSR $1105               ; [20 05 11   ] Jump to Subroutine
    BRK                     ; [00 08      ] Software interrupt
    ORA $40BE00             ; [0F 00 BE 40] OR A with Absolute Long
    DEC $CE00               ; [CE 00 CE   ] Decrement Absolute
    BRK                     ; [00 BE      ] Software interrupt
    BMI $3247               ; [30 1E      ] Branch if Minus
    BRA $31C7               ; [80 9C      ] Branch Always
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 B0      ] Software interrupt
    BRA $3275               ; [80 44      ] Branch Always
    BRK                     ; [00 24      ] Software interrupt
    BPL $3259               ; [10 24      ] Branch if Plus
    BPL $327B               ; [10 44      ] Branch if Plus
    BMI $3201               ; [30 C8      ] Branch if Minus
    LDY $48                 ; [A4 48      ] Load Y from DP
    JSR $A040               ; [20 40 A0   ] Jump to Subroutine
    BRA $3280               ; [80 40      ] Branch Always
    ORA $070907,X           ; [1F 07 09 07] OR A with Absolute Long,X
    ORA #$07                ; [09 07      ] OR A with Immediate
    TSB $0500               ; [0C 00 05   ] Test and Set Bits Absolute
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    COP #$07                ; [02 07      ] Coprocessor interrupt
    COP #$06                ; [02 06      ] Coprocessor interrupt
    BRK                     ; [00 01      ] Software interrupt
    ASL $07                 ; [06 07      ] Shift Left DP
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    COP #$00                ; [02 00      ] Coprocessor interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRA $31E7               ; [80 80      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $143284 (SNES $D43284) ---
org $D43284

    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA [$01]               ; [07 01      ] OR A with [DP]
    TSB $0B07               ; [0C 07 0B   ] Test and Set Bits Absolute
    TSB $1F                 ; [04 1F      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $143296 (SNES $D43296) ---
org $D43296

    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA [$00]               ; [07 00      ] OR A with [DP]
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 9C      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    INC $7F00,X             ; [FE 00 7F   ] Increment Absolute,X
    CPX #$5F                ; [E0 5F      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    LDA $3CDE78,X           ; [BF 78 DE 3C] Load A from Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BPL $3316               ; [10 60      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    TSB $E0                 ; [04 E0      ] Test and Set Bits in DP
    STX $FA                 ; [86 FA      ] Store X to DP
    JSR $007A               ; [20 7A 00   ] Jump to Subroutine
    BIT $1F80,X             ; [3C 80 1F   ] Test Bits Absolute,X
    BRK                     ; [00 2C      ] Software interrupt
    BPL $3321               ; [10 5C      ] Branch if Plus
    JSR $205E               ; [20 5E 20   ] Jump to Subroutine
    EOR $7220,X             ; [5D 20 72   ] XOR A with Absolute,X
    BRK                     ; [00 32      ] Software interrupt
    BRK                     ; [00 2F      ] Software interrupt
    TSB $0304               ; [0C 04 03   ] Test and Set Bits Absolute
    ORA $14,S               ; [03 14      ] OR A with Stack Relative
    ORA ($24,S),Y           ; [13 24      ] OR A with (SR),Y
    ORA ($28),Y             ; [11 28      ] OR A with (DP),Y
    ORA ($20)               ; [12 20      ] OR A with (DP)
    AND #$04                ; [29 04      ] AND A with Immediate
    ORA #$04                ; [09 04      ] OR A with Immediate
    BPL $32EC               ; [10 0C      ] Branch if Plus
    ROR                     ; [6A         ] Rotate Right Accumulator
    TRB $0C16               ; [1C 16 0C   ] Test and Reset Bits Absolute
    ROL $0C,X               ; [36 0C      ] Rotate Left DP,X
    MVN $08,$14             ; [54 08 14   ] Block Move Negative
    PHP                     ; [08         ] Push Processor Status
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 EC      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    LDX $1C,Y               ; [B6 1C      ] Load X from DP,Y
    TRB $8CC4               ; [1C C4 8C   ] Test and Reset Bits Absolute
    RTS                     ; [60         ] Return from Subroutine
    STY $8840               ; [8C 40 88   ] Store Y to Absolute
    JSR $6088               ; [20 88 60   ] Jump to Subroutine
    BRA $32FC               ; [80 00      ] Branch Always
    SEC                     ; [38         ] Set Carry Flag
    SEC                     ; [38         ] Set Carry Flag
    JML $00261C             ; [5C 1C 26 00] Jump Long
    ASL $0900,X             ; [1E 00 09   ] Shift Left Absolute,X
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 11      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 01      ] Software interrupt
    COP #$04                ; [02 04      ] Coprocessor interrupt
    ASL $01                 ; [06 01      ] Shift Left DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    LSR $5C44               ; [4E 44 5C   ] Shift Right Absolute
    RTI                     ; [40         ] Return from Interrupt
    INC $861C               ; [EE 1C 86   ] Increment Absolute

;--- Patch at file offset $14332D (SNES $D4332D) ---
org $D4332D

    BRA $32AF               ; [80 80      ] Branch Always
    BRK                     ; [00 A4      ] Software interrupt
    MVN $80,$60             ; [54 80 60   ] Block Move Negative
    TRB $5C00               ; [1C 00 5C   ] Test and Reset Bits Absolute
    JSR $6080               ; [20 80 60   ] Jump to Subroutine
    BRA $32FC               ; [80 C0      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt

;--- Patch at file offset $143344 (SNES $D43344) ---
org $D43344

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $3E07,X             ; [1D 07 3E   ] OR A with Absolute,X
    ORA $7E1F21,X           ; [1F 21 1F 7E] OR A with Absolute Long,X
    db $21                      ; Incomplete/data bytes

;--- Patch at file offset $143356 (SNES $D43356) ---
org $D43356

    BRK                     ; [00 00      ] Software interrupt
    ORA [$02]               ; [07 02      ] OR A with [DP]
    ORA $001F01,X           ; [1F 01 1F 00] OR A with Absolute Long,X
    AND ($00,X)             ; [21 00      ] AND A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BEQ $3366               ; [F0 00      ] Branch if Equal
    CLV                     ; [B8         ] Clear Overflow Flag
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    JSR $C8F4               ; [20 F4 C8   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    CPY $7E                 ; [C4 7E      ] Compare Y with DP
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BNE $3389               ; [D0 10      ] Branch if Not Equal
    JSR $18C0               ; [20 C0 18   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $E4                 ; [14 E4      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    ADC ($10,X)             ; [61 10      ] Add with Carry (DP,X)
    BVS $3384               ; [70 00      ] Branch if Overflow Set
    BMI $3386               ; [30 00      ] Branch if Minus
    ASL $00,X               ; [16 00      ] Shift Left DP,X
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 15      ] Software interrupt
    BRK                     ; [00 25      ] Software interrupt
    ORA ($37,X)             ; [01 37      ] OR A with (DP,X)
    BPL $3391               ; [10 00      ] Branch if Plus
    ASL $112E,X             ; [1E 2E 11   ] Shift Left Absolute,X
    ASL $0801               ; [0E 01 08   ] Shift Left Absolute
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($0A,X)             ; [01 0A      ] OR A with (DP,X)
    BRK                     ; [00 19      ] Software interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    CLC                     ; [18         ] Clear Carry Flag
    LSR $BCE0,X             ; [5E E0 BC   ] Shift Right Absolute,X
    RTS                     ; [60         ] Return from Subroutine
    LDY $BC60,X             ; [BC 60 BC   ] Load Y from Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    INC $FE40,X             ; [FE 40 FE   ] Increment Absolute,X
    BRA $336B               ; [80 BE      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    JML [$E4F0]             ; [DC F0 E4   ] Jump Long Indirect
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRK                     ; [00 68      ] Software interrupt
    BRK                     ; [00 48      ] Software interrupt
    BPL $3415               ; [10 5C      ] Branch if Plus
    BRK                     ; [00 8C      ] Software interrupt
    BRK                     ; [00 68      ] Software interrupt
    STZ $F0                 ; [64 F0      ] Store Zero to DP
    BEQ $3422               ; [F0 61      ] Branch if Equal
    BPL $3433               ; [10 70      ] Branch if Plus
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 16      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 15      ] Software interrupt
    BRK                     ; [00 25      ] Software interrupt
    ORA ($37,X)             ; [01 37      ] OR A with (DP,X)
    BPL $33D1               ; [10 00      ] Branch if Plus
    ASL $112E,X             ; [1E 2E 11   ] Shift Left Absolute,X
    ASL $0801               ; [0E 01 08   ] Shift Left Absolute
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($0A,X)             ; [01 0A      ] OR A with (DP,X)
    BRK                     ; [00 19      ] Software interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    CLC                     ; [18         ] Clear Carry Flag
    LSR $BCE0,X             ; [5E E0 BC   ] Shift Right Absolute,X
    RTS                     ; [60         ] Return from Subroutine
    LDY $BC60,X             ; [BC 60 BC   ] Load Y from Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    INC $FE40,X             ; [FE 40 FE   ] Increment Absolute,X
    BRA $33AB               ; [80 BE      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    JML [$E4F0]             ; [DC F0 E4   ] Jump Long Indirect
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRK                     ; [00 68      ] Software interrupt
    BRK                     ; [00 48      ] Software interrupt
    BPL $3455               ; [10 5C      ] Branch if Plus
    BRK                     ; [00 8C      ] Software interrupt
    BRK                     ; [00 68      ] Software interrupt
    STZ $F0                 ; [64 F0      ] Store Zero to DP
    BEQ $3404               ; [F0 03      ] Branch if Equal
    BRK                     ; [00 03      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BRK                     ; [00 0F      ] Software interrupt
    ORA [$1A]               ; [07 1A      ] OR A with [DP]
    ORA $321E35             ; [0F 35 1E 32] OR A with Absolute Long
    ORA $000759             ; [0F 59 07 00] OR A with Absolute Long
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    ORA $07,S               ; [03 07      ] OR A with Stack Relative
    ORA [$0F]               ; [07 0F      ] OR A with [DP]
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL $0F14,X             ; [1E 14 0F   ] Shift Left Absolute,X
    BRK                     ; [00 17      ] Software interrupt
    BMI $3421               ; [30 00      ] Branch if Minus
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRA $3419               ; [80 F2      ] Branch Always
    BRK                     ; [00 46      ] Software interrupt
    INY                     ; [C8         ] Increment Y
    NOP                     ; [EA         ] No Operation
    BVS $34A9               ; [70 7C      ] Branch if Overflow Set
    CLV                     ; [B8         ] Clear Overflow Flag
    LDY $00F8,X             ; [BC F8 00   ] Load Y from Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $3443               ; [80 0C      ] Branch Always
    TSB $74BC               ; [0C BC 74   ] Test and Set Bits Absolute
    SEI                     ; [78         ] Set Interrupt Disable
    TSB $10A8               ; [0C A8 10   ] Test and Set Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 77      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    AND $1610,X             ; [3D 10 16   ] AND A with Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $2F                 ; [06 2F      ] Shift Left DP
    BPL $347D               ; [10 30      ] Branch if Plus
    ORA $000F3F,X           ; [1F 3F 0F 00] OR A with Absolute Long,X
    BRK                     ; [00 18      ] Software interrupt
    ORA ($08)               ; [12 08      ] OR A with (DP)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($10,X)             ; [01 10      ] OR A with (DP,X)
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 2C      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    STX $7C                 ; [86 7C      ] Store X to DP
    STX $7C                 ; [86 7C      ] Store X to DP
    STZ $3C7C,X             ; [9E 7C 3C   ] Store Zero to Absolute,X
    BEQ $345B               ; [F0 F0      ] Branch if Equal
    CPX #$98                ; [E0 98      ] Compare X Immediate
    BEQ $3433               ; [F0 C4      ] Branch if Equal
    SEC                     ; [38         ] Set Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BVC $34EF               ; [50 7C      ] Branch if Overflow Clear
    PLP                     ; [28         ] Pull Processor Status
    JMP ($7028,X)           ; [7C 28 70   ] Jump Indirect,X
    BIT $50E0               ; [2C E0 50   ] Test Bits Absolute
    CPY #$20                ; [C0 20      ] Compare Y Immediate
    CPX #$10                ; [E0 10      ] Compare X Immediate
    SEC                     ; [38         ] Set Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    EOR $4B04               ; [4D 04 4B   ] XOR A with Absolute
    BRK                     ; [00 3B      ] Software interrupt
    BRK                     ; [00 0B      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    BRK                     ; [00 36      ] Software interrupt
    COP #$26                ; [02 26      ] Coprocessor interrupt
    ASL $07,X               ; [16 07      ] Shift Left DP,X
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA [$03]               ; [07 03      ] OR A with [DP]
    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    BRK                     ; [00 02      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 2C      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    BIT $FC18               ; [2C 18 FC   ] Test Bits Absolute
    BMI $3525               ; [30 7E      ] Branch if Minus
    CPY $2E                 ; [C4 2E      ] Compare Y with DP
    CPY $FE                 ; [C4 FE      ] Compare Y with DP
    LDY $18FC               ; [AC FC 18   ] Load Y from Absolute
    CLD                     ; [D8         ] Clear Decimal Flag
    BRK                     ; [00 D0      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BCC $34FC               ; [90 48      ] Branch if Carry Clear
    JSR $8010               ; [20 10 80   ] Jump to Subroutine
    MVP $C4,$C0             ; [44 C4 C0   ] Block Move Positive
    TSB $A8                 ; [04 A8      ] Test and Set Bits in DP
    CLD                     ; [D8         ] Clear Decimal Flag
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BRK                     ; [00 0F      ] Software interrupt
    ORA [$1A]               ; [07 1A      ] OR A with [DP]
    ORA $321E35             ; [0F 35 1E 32] OR A with Absolute Long
    ORA $000759             ; [0F 59 07 00] OR A with Absolute Long
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    ORA $07,S               ; [03 07      ] OR A with Stack Relative
    ORA [$0F]               ; [07 0F      ] OR A with [DP]
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL $0F14,X             ; [1E 14 0F   ] Shift Left Absolute,X
    BRK                     ; [00 17      ] Software interrupt
    BMI $34E1               ; [30 00      ] Branch if Minus
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRA $34D9               ; [80 F2      ] Branch Always
    BRK                     ; [00 46      ] Software interrupt
    INY                     ; [C8         ] Increment Y
    NOP                     ; [EA         ] No Operation
    BVS $3569               ; [70 7C      ] Branch if Overflow Set
    CLV                     ; [B8         ] Clear Overflow Flag
    LDY $00F8,X             ; [BC F8 00   ] Load Y from Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $3503               ; [80 0C      ] Branch Always
    TSB $74BC               ; [0C BC 74   ] Test and Set Bits Absolute
    SEI                     ; [78         ] Set Interrupt Disable
    TSB $10A8               ; [0C A8 10   ] Test and Set Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 37      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ASL $1C08,X             ; [1E 08 1C   ] Shift Left Absolute,X
    COP #$14                ; [02 14      ] Coprocessor interrupt
    ASL $34                 ; [06 34      ] Shift Left DP
    ASL $2F                 ; [06 2F      ] Shift Left DP
    BPL $3546               ; [10 39      ] Branch if Plus
    BRK                     ; [00 69      ] Software interrupt
    BMI $3511               ; [30 00      ] Branch if Minus
    BRK                     ; [00 0C      ] Software interrupt
    ORA #$00                ; [09 00      ] OR A with Immediate
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($10,X)             ; [01 10      ] OR A with (DP,X)
    BRK                     ; [00 06      ] Software interrupt
    BRK                     ; [00 16      ] Software interrupt
    JSR $7098               ; [20 98 70   ] Jump to Subroutine
    STY $8C78               ; [8C 78 8C   ] Store Y to Absolute
    SEI                     ; [78         ] Set Interrupt Disable
    STY $3C78               ; [8C 78 3C   ] Store Y to Absolute
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    RTS                     ; [60         ] Return from Subroutine
    BVC $354E               ; [50 20      ] Branch if Overflow Clear
    PHA                     ; [48         ] Push Accumulator
    BMI $35A1               ; [30 70      ] Branch if Minus
    LDY #$70                ; [A0 70      ] Load Y Immediate
    CLI                     ; [58         ] Clear Interrupt Disable
    SEI                     ; [78         ] Set Interrupt Disable
    BVC $35AF               ; [50 78      ] Branch if Overflow Clear
    BVC $3519               ; [50 E0      ] Branch if Overflow Clear
    TYA                     ; [98         ] Transfer Y to A
    RTI                     ; [40         ] Return from Interrupt
    JSR $A020               ; [20 20 A0   ] Jump to Subroutine
    BMI $34D0               ; [30 90      ] Branch if Minus
    EOR $387F38,X           ; [5F 38 7F 38] XOR A with Absolute Long,X
    AND $011600,X           ; [3F 00 16 01] AND A with Absolute Long,X
    TSB $0F07               ; [0C 07 0F   ] Test and Set Bits Absolute
    ORA $1F,S               ; [03 1F      ] OR A with Stack Relative
    TSB $0F                 ; [04 0F      ] Test and Set Bits in DP
    BRK                     ; [00 31      ] Software interrupt
    ORA #$13                ; [09 13      ] OR A with Immediate
    PLD                     ; [2B         ] Pull Direct Page Register
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA #$09                ; [09 09      ] OR A with Immediate
    ORA [$00]               ; [07 00      ] OR A with [DP]
    COP #$01                ; [02 01      ] Coprocessor interrupt
    PHD                     ; [0B         ] Push Direct Page Register
    ORA $CC0000             ; [0F 00 00 CC] OR A with Absolute Long
    BVS $3561               ; [70 FE      ] Branch if Overflow Set
    PEA $64FE               ; [F4 FE 64   ] Push Effective Absolute
    INC $FE84,X             ; [FE 84 FE   ] Increment Absolute,X
    LDY $FC,X               ; [B4 FC      ] Load Y from DP,X
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    STY $04,X               ; [94 04      ] Store Y to DP,X
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 84      ] Software interrupt
    BIT $90                 ; [24 90      ] Test Bits DP
    CLI                     ; [58         ] Clear Interrupt Disable
    RTI                     ; [40         ] Return from Interrupt
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    EOR $4B04               ; [4D 04 4B   ] XOR A with Absolute
    BRK                     ; [00 3B      ] Software interrupt
    BRK                     ; [00 1B      ] Software interrupt
    BRK                     ; [00 3F      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    AND $001E16,X           ; [3F 16 1E 00] AND A with Absolute Long,X
    TSB $3600               ; [0C 00 36   ] Test and Set Bits Absolute
    COP #$26                ; [02 26      ] Coprocessor interrupt
    ASL $07,X               ; [16 07      ] Shift Left DP,X
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA [$1B]               ; [07 1B      ] OR A with [DP]
    ORA ($0C,S),Y           ; [13 0C      ] OR A with (SR),Y
    INC                     ; [1A         ] Increment Accumulator
    TSB $000C               ; [0C 0C 00   ] Test and Set Bits Absolute
    BRK                     ; [00 2C      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    BIT $FC18               ; [2C 18 FC   ] Test Bits Absolute
    BMI $3565               ; [30 BE      ] Branch if Minus
    CPY $FE                 ; [C4 FE      ] Compare Y with DP
    CPX $FE                 ; [E4 FE      ] Compare X with DP
    JMP $58FC               ; [4C FC 58   ] Jump Absolute
    CLD                     ; [D8         ] Clear Decimal Flag
    BRK                     ; [00 D0      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BCC $35FC               ; [90 48      ] Branch if Carry Clear
    JSR $4010               ; [20 10 40   ] Jump to Subroutine
    STY $94                 ; [84 94      ] Store Y to DP
    BVS $35DF               ; [70 24      ] Branch if Overflow Set
    PLA                     ; [68         ] Pull Accumulator
    TYA                     ; [98         ] Transfer Y to A
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $1435CA (SNES $D435CA) ---
org $D435CA

    BRK                     ; [00 00      ] Software interrupt
    ADC [$00],Y             ; [77 00      ] Add with Carry [DP],Y
    db $5F, $32                 ; Incomplete/data bytes

;--- Patch at file offset $1435DC (SNES $D435DC) ---
org $D435DC

    BRK                     ; [00 00      ] Software interrupt
    AND [$05],Y             ; [37 05      ] AND A with [DP],Y

;--- Patch at file offset $1435EA (SNES $D435EA) ---
org $D435EA

    BRK                     ; [00 00      ] Software interrupt
    DEC $F200,X             ; [DE 00 F2   ] Decrement Absolute,X
    db $DC                      ; Incomplete/data bytes

;--- Patch at file offset $1435FC (SNES $D435FC) ---
org $D435FC

    BRK                     ; [00 00      ] Software interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    BRK                     ; [00 5E      ] Software interrupt
    ORA $25143F             ; [0F 3F 14 25] OR A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    EOR [$3C]               ; [47 3C      ] XOR A with [DP]
    JML $205230             ; [5C 30 52 20] Jump Long
    LSR $2A30               ; [4E 30 2A   ] Shift Right Absolute
    ASL $2F,X               ; [16 2F      ] Shift Left DP,X
    ROL $14                 ; [26 14      ] Rotate Left DP
    TSB $19                 ; [04 19      ] Test and Set Bits in DP
    ORA ($38,S),Y           ; [13 38      ] OR A with (SR),Y
    BIT $1221               ; [2C 21 12   ] Test Bits Absolute
    AND ($0C,X)             ; [21 0C      ] AND A with (DP,X)
    AND ($00),Y             ; [31 00      ] AND A with (DP),Y
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    SBC ($E0)               ; [F2 E0      ] Subtract with Borrow (DP)
    JSR ($94D0,X)           ; [FC D0 94   ] Jump to Subroutine Indirect,X
    SEI                     ; [78         ] Set Interrupt Disable
    TXA                     ; [8A         ] Transfer X to A
    JMP ($3C66,X)           ; [7C 66 3C   ] Jump Indirect,X
    LDX $1C                 ; [A6 1C      ] Load X from DP
    INC $3C                 ; [E6 3C      ] Increment DP
    LDY $D8,X               ; [B4 D8      ] Load Y from DP,X
    CPY $90AC               ; [CC AC 90   ] Compare Y with Absolute
    CPY #$78                ; [C0 78      ] Compare Y Immediate
    PHP                     ; [08         ] Push Processor Status
    JMP ($9C14,X)           ; [7C 14 9C   ] Jump Indirect,X
    PLP                     ; [28         ] Pull Processor Status
    TRB $3C48               ; [1C 48 3C   ] Test and Reset Bits Absolute
    PHP                     ; [08         ] Push Processor Status
    CLC                     ; [18         ] Clear Carry Flag
    PHP                     ; [08         ] Push Processor Status
    ROL                     ; [2A         ] Rotate Left Accumulator
    ASL $17,X               ; [16 17      ] Shift Left DP,X
    PHP                     ; [08         ] Push Processor Status
    SEC                     ; [38         ] Set Carry Flag
    ORA [$4F]               ; [07 4F      ] OR A with [DP]
    ORA $5C,S               ; [03 5C      ] OR A with Stack Relative
    TSB $24                 ; [04 24      ] Test and Set Bits in DP
    TRB $1E2F               ; [1C 2F 1E   ] Test and Reset Bits Absolute
    ORA $001100,X           ; [1F 00 11 00] OR A with Absolute Long,X
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 23      ] Software interrupt
    BPL $367C               ; [10 23      ] Branch if Plus
    ASL $1F                 ; [06 1F      ] Shift Left DP
    ORA $1C,S               ; [03 1C      ] OR A with Stack Relative
    COP #$00                ; [02 00      ] Coprocessor interrupt
    BRK                     ; [00 AC      ] Software interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    LDX $4E44,Y             ; [BE 44 4E   ] Load X from Absolute,Y
    LDY $BE,X               ; [B4 BE      ] Load Y from DP,X
    PEA $74BE               ; [F4 BE 74   ] Push Effective Absolute
    JSR ($3E28,X)           ; [FC 28 3E   ] Jump to Subroutine Indirect,X
    TRB $00FE               ; [1C FE 00   ] Test and Reset Bits Absolute
    CLC                     ; [18         ] Clear Carry Flag
    BPL $36B3               ; [10 40      ] Branch if Plus
    TSB $B4                 ; [04 B4      ] Test and Set Bits in DP
    BPL $36DB               ; [10 64      ] Branch if Plus
    BCC $36D9               ; [90 60      ] Branch if Carry Clear
    TRB $08                 ; [14 08      ] Test and Reset Bits DP
    JSR $4498               ; [20 98 44   ] Jump to Subroutine
    BRK                     ; [00 00      ] Software interrupt
    ADC [$08],Y             ; [77 08      ] Add with Carry [DP],Y
    AND $1610,X             ; [3D 10 16   ] AND A with Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $2F                 ; [06 2F      ] Shift Left DP
    BPL $36BD               ; [10 30      ] Branch if Plus
    ORA $000F1F,X           ; [1F 1F 0F 00] OR A with Absolute Long,X
    BRK                     ; [00 18      ] Software interrupt
    ORA ($08)               ; [12 08      ] OR A with (DP)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($10,X)             ; [01 10      ] OR A with (DP,X)
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 0D      ] Software interrupt
    TSB $0B                 ; [04 0B      ] Test and Set Bits in DP
    BRK                     ; [00 0B      ] Software interrupt
    BRK                     ; [00 1B      ] Software interrupt
    BRK                     ; [00 3F      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    AND $001E16,X           ; [3F 16 1E 00] AND A with Absolute Long,X
    TSB $0600               ; [0C 00 06   ] Test and Set Bits Absolute
    COP #$06                ; [02 06      ] Coprocessor interrupt
    ASL $07                 ; [06 07      ] Shift Left DP
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA [$1B]               ; [07 1B      ] OR A with [DP]
    ORA ($0C,S),Y           ; [13 0C      ] OR A with (SR),Y
    INC                     ; [1A         ] Increment Accumulator
    TSB $000C               ; [0C 0C 00   ] Test and Set Bits Absolute
    BRK                     ; [00 77      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    AND $1610,X             ; [3D 10 16   ] AND A with Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $2F                 ; [06 2F      ] Shift Left DP
    BPL $36FE               ; [10 31      ] Branch if Plus
    ASL $011F,X             ; [1E 1F 01   ] Shift Left Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    ORA ($08)               ; [12 08      ] OR A with (DP)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($10,X)             ; [01 10      ] OR A with (DP,X)
    BRK                     ; [00 1E      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($2C,X)             ; [01 2C      ] OR A with (DP,X)
    SED                     ; [F8         ] Set Decimal Flag
    STX $7C                 ; [86 7C      ] Store X to DP
    STX $7C                 ; [86 7C      ] Store X to DP
    STZ $3C7C,X             ; [9E 7C 3C   ] Store Zero to Absolute,X
    BEQ $3767               ; [F0 7C      ] Branch if Equal
    CPX #$FE                ; [E0 FE      ] Compare X Immediate
    TYA                     ; [98         ] Transfer Y to A
    ROR $F8CC,X             ; [7E CC F8   ] Rotate Right Absolute,X
    BVC $376F               ; [50 7C      ] Branch if Overflow Clear
    PLP                     ; [28         ] Pull Processor Status
    JMP ($7028,X)           ; [7C 28 70   ] Jump Indirect,X
    BIT $50E0               ; [2C E0 50   ] Test Bits Absolute
    CPY #$20                ; [C0 20      ] Compare Y Immediate
    BPL $3686               ; [10 88      ] Branch if Plus
    DEY                     ; [88         ] Decrement Y
    MVP $12,$01             ; [44 12 01   ] Block Move Positive
    ORA ($01,S),Y           ; [13 01      ] OR A with (SR),Y
    ORA $001B03             ; [0F 03 1B 00] OR A with Absolute Long
    AND $163F08,X           ; [3F 08 3F 16] AND A with Absolute Long,X
    ASL $0C00,X             ; [1E 00 0C   ] Shift Left Absolute,X
    BRK                     ; [00 0D      ] Software interrupt
    BRK                     ; [00 0D      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA $04,S               ; [03 04      ] OR A with Stack Relative
    TSB $1B                 ; [04 1B      ] Test and Set Bits in DP
    ORA ($0C,S),Y           ; [13 0C      ] OR A with (SR),Y
    INC                     ; [1A         ] Increment Accumulator
    TSB $000C               ; [0C 0C 00   ] Test and Set Bits Absolute
    BRK                     ; [00 AE      ] Software interrupt
    CPY $EE                 ; [C4 EE      ] Compare Y with DP
    STY $FE                 ; [84 FE      ] Store Y to DP
    JMP $E4BE               ; [4C BE E4   ] Jump Absolute
    JSR ($F0C0,X)           ; [FC C0 F0   ] Jump to Subroutine Indirect,X
    RTI                     ; [40         ] Return from Interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY $40                 ; [C4 40      ] Compare Y with DP
    STY $00                 ; [84 00      ] Store Y to DP
    TSB $48                 ; [04 48      ] Test and Set Bits in DP
    BNE $376C               ; [D0 34      ] Branch if Not Equal
    BCS $37AA               ; [B0 70      ] Branch if Carry Set
    JSR $C060               ; [20 60 C0   ] Jump to Subroutine
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRA $3739               ; [80 F2      ] Branch Always
    BRK                     ; [00 46      ] Software interrupt
    INY                     ; [C8         ] Increment Y
    NOP                     ; [EA         ] No Operation
    BVS $37C9               ; [70 7C      ] Branch if Overflow Set
    CLV                     ; [B8         ] Clear Overflow Flag
    LDY $00F8,X             ; [BC F8 00   ] Load Y from Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $3763               ; [80 0C      ] Branch Always
    TSB $74BC               ; [0C BC 74   ] Test and Set Bits Absolute
    SEI                     ; [78         ] Set Interrupt Disable
    TSB $10A8               ; [0C A8 10   ] Test and Set Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 2C      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    LDX $A664,Y             ; [BE 64 A6   ] Load X from Absolute,Y
    RTI                     ; [40         ] Return from Interrupt
    LDX $40                 ; [A6 40      ] Load X from DP
    JSR ($BE60,X)           ; [FC 60 BE   ] Jump to Subroutine Indirect,X
    PEA $F43E               ; [F4 3E F4   ] Push Effective Absolute
    DEC $F8F4               ; [CE F4 F8   ] Decrement Absolute
    BVC $37D7               ; [50 64      ] Branch if Overflow Clear
    BRK                     ; [00 58      ] Software interrupt
    BRK                     ; [00 50      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    JSR $5040               ; [20 40 50   ] Jump to Subroutine
    LDY $E0                 ; [A4 E0      ] Load Y from DP
    MVN $F4,$30             ; [54 F4 30   ] Block Move Negative
    EOR $4B04               ; [4D 04 4B   ] XOR A with Absolute
    BRK                     ; [00 3B      ] Software interrupt
    BRK                     ; [00 1B      ] Software interrupt
    BRK                     ; [00 3F      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    AND $001E16,X           ; [3F 16 1E 00] AND A with Absolute Long,X
    TSB $3700               ; [0C 00 37   ] Test and Set Bits Absolute
    ORA $27,S               ; [03 27      ] OR A with Stack Relative
    ORA [$07],Y             ; [17 07      ] OR A with [DP],Y
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA [$1B]               ; [07 1B      ] OR A with [DP]
    ORA ($0C,S),Y           ; [13 0C      ] OR A with (SR),Y
    INC                     ; [1A         ] Increment Accumulator
    TSB $000C               ; [0C 0C 00   ] Test and Set Bits Absolute
    BRK                     ; [00 FC      ] Software interrupt
    INX                     ; [E8         ] Increment X
    JSR ($FE88,X)           ; [FC 88 FE   ] Jump to Subroutine Indirect,X
    CPY $E4BE               ; [CC BE E4   ] Compare Y with Absolute
    JSR ($F0C0,X)           ; [FC C0 F0   ] Jump to Subroutine Indirect,X
    RTI                     ; [40         ] Return from Interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    PHP                     ; [08         ] Push Processor Status
    CPX #$08                ; [E0 08      ] Compare X Immediate
    BRA $3735               ; [80 80      ] Branch Always
    JMP $34D0               ; [4C D0 34   ] Jump Absolute
    BCS $382A               ; [B0 70      ] Branch if Carry Set
    JSR $C060               ; [20 60 C0   ] Jump to Subroutine
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 03      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BRK                     ; [00 0F      ] Software interrupt
    ORA [$1A]               ; [07 1A      ] OR A with [DP]
    ORA $321E35             ; [0F 35 1E 32] OR A with Absolute Long
    ORA $770759             ; [0F 59 07 77] OR A with Absolute Long
    PHP                     ; [08         ] Push Processor Status
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    COP #$03                ; [02 03      ] Coprocessor interrupt
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA $141E0A             ; [0F 0A 1E 14] OR A with Absolute Long
    ORA $301700             ; [0F 00 17 30] OR A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRA $37E2               ; [80 00      ] Branch Always
    DEC $F280               ; [CE 80 F2   ] Decrement Absolute
    BRK                     ; [00 46      ] Software interrupt
    INY                     ; [C8         ] Increment Y
    NOP                     ; [EA         ] No Operation
    BVS $3867               ; [70 7C      ] Branch if Overflow Set
    CLV                     ; [B8         ] Clear Overflow Flag
    LDY $0CF8,X             ; [BC F8 0C   ] Load Y from Absolute,X
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    TSB $BC0C               ; [0C 0C BC   ] Test and Set Bits Absolute
    STZ $78,X               ; [74 78      ] Store Zero to DP,X
    TSB $10A8               ; [0C A8 10   ] Test and Set Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 F8      ] Software interrupt
    BVC $383E               ; [50 3D      ] Branch if Overflow Clear
    BPL $3859               ; [10 56      ] Branch if Plus
    TSB $54                 ; [04 54      ] Test and Set Bits in DP
    ASL $74                 ; [06 74      ] Shift Left DP
    ASL $68                 ; [06 68      ] Shift Left DP
    BMI $3842               ; [30 37      ] Branch if Minus
    CLC                     ; [18         ] Clear Carry Flag
    BPL $381D               ; [10 0F      ] Branch if Plus
    ORA $180D,X             ; [1D 0D 18   ] OR A with Absolute,X
    ORA ($28)               ; [12 28      ] OR A with (DP)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    AND ($08,X)             ; [21 08      ] AND A with (DP,X)
    ORA ($36,X)             ; [01 36      ] OR A with (DP,X)
    ORA ($18,X)             ; [01 18      ] OR A with (DP,X)
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    COP #$BE                ; [02 BE      ] Coprocessor interrupt
    MVP $CE,$04             ; [44 CE 04   ] Block Move Positive
    CPY $BC00               ; [CC 00 BC   ] Compare Y with Absolute
    PHA                     ; [48         ] Push Accumulator
    JML [$3478]             ; [DC 78 34   ] Jump Long Indirect
    SED                     ; [F8         ] Set Decimal Flag
    PHP                     ; [08         ] Push Processor Status
    BEQ $381F               ; [F0 F0      ] Branch if Equal
    CPX #$44                ; [E0 44      ] Compare X Immediate
    BRK                     ; [00 24      ] Software interrupt
    BPL $3855               ; [10 20      ] Branch if Plus
    BPL $387F               ; [10 48      ] Branch if Plus
    BRK                     ; [00 30      ] Software interrupt
    PHA                     ; [48         ] Push Accumulator
    INX                     ; [E8         ] Increment X
    CLC                     ; [18         ] Clear Carry Flag
    BEQ $38AE               ; [F0 70      ] Branch if Equal
    BRA $38A0               ; [80 60      ] Branch Always
    ASL                     ; [0A         ] Shift Left Accumulator
    BRK                     ; [00 0B      ] Software interrupt
    BRK                     ; [00 0B      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    BRK                     ; [00 07      ] Software interrupt
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    BRK                     ; [00 07      ] Software interrupt
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA [$03]               ; [07 03      ] OR A with [DP]
    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    BRK                     ; [00 01      ] Software interrupt
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 E0      ] Software interrupt
    BRA $3843               ; [80 E0      ] Branch Always
    CPY #$60                ; [C0 60      ] Compare Y Immediate
    CPY #$E4                ; [C0 E4      ] Compare Y Immediate
    BRK                     ; [00 EE      ] Software interrupt
    BIT $FE                 ; [24 FE      ] Test Bits DP
    BIT $BC                 ; [24 BC      ] Test Bits DP
    CLC                     ; [18         ] Clear Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    BRA $3873               ; [80 00      ] Branch Always
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $381E               ; [80 A4      ] Branch Always
    JSR $1804               ; [20 04 18   ] Jump to Subroutine
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 73      ] Software interrupt
    BRK                     ; [00 7F      ] Software interrupt
    AND ($3A,S),Y           ; [33 3A      ] AND A with (SR),Y
    ORA $1C0F14             ; [0F 14 0F 1C] OR A with Absolute Long
    ORA [$3A]               ; [07 3A      ] OR A with [DP]
    ORA $000000,X           ; [1F 00 00 00] OR A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 33      ] Software interrupt
    ORA $07,S               ; [03 07      ] OR A with Stack Relative
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA $040704             ; [0F 04 07 04] OR A with Absolute Long
    ORA $000002,X           ; [1F 02 00 00] OR A with Absolute Long,X
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    RTI                     ; [40         ] Return from Interrupt
    BMI $38C8               ; [30 20      ] Branch if Minus
    CLV                     ; [B8         ] Clear Overflow Flag
    JSR $E87C               ; [20 7C E8   ] Jump to Subroutine
    DEC $8B3C,X             ; [DE 3C 8B   ] Decrement Absolute,X
    JSR ($0000,X)           ; [FC 00 00   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 00      ] Software interrupt
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    RTS                     ; [60         ] Return from Subroutine
    RTI                     ; [40         ] Return from Interrupt
    CPX #$08                ; [E0 08      ] Compare X Immediate
    BIT $08,X               ; [34 08      ] Test Bits DP,X
    JSR ($6F04,X)           ; [FC 04 6F   ] Jump to Subroutine Indirect,X
    AND ($76,S),Y           ; [33 76      ] AND A with (SR),Y
    AND ($3F,X)             ; [21 3F      ] AND A with (DP,X)
    BRK                     ; [00 48      ] Software interrupt
    BRK                     ; [00 4D      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    TSB $2E                 ; [04 2E      ] Test and Set Bits in DP
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    AND $0F3F10,X           ; [3F 10 3F 0F] AND A with Absolute Long,X
    ORA $2C                 ; [05 2C      ] OR A with Direct Page
    BRK                     ; [00 00      ] Software interrupt
    AND [$00],Y             ; [37 00      ] AND A with [DP],Y
    JSL $000710             ; [22 10 07 00] Jump to Subroutine Long
    ORA ($08,S),Y           ; [13 08      ] OR A with (SR),Y
    ORA ($11,X)             ; [01 11      ] OR A with (DP,X)
    ORA $FE,S               ; [03 FE      ] OR A with Stack Relative
    LDA $1E                 ; [A5 1E      ] Load A from DP
    ROL $9C                 ; [26 9C      ] Rotate Left DP

;--- Patch at file offset $1438F0 (SNES $D438F0) ---
org $D438F0

    INC $1E14,X             ; [FE 14 1E   ] Increment Absolute,X
    LSR                     ; [4A         ] Shift Right Accumulator
    db $1C                      ; Incomplete/data bytes

;--- Patch at file offset $143900 (SNES $D43900) ---
org $D43900

    ADC $067F08,X           ; [7F 08 7F 06] Add with Carry Absolute Long,X
    ADC $247F34,X           ; [7F 34 7F 24] Add with Carry Absolute Long,X
    AND $011301,X           ; [3F 01 13 01] AND A with Absolute Long,X
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    PLD                     ; [2B         ] Pull Direct Page Register
    AND $36,S               ; [23 36      ] AND A with Stack Relative
    BMI $393A               ; [30 25      ] Branch if Minus
    ORA ($35),Y             ; [11 35      ] OR A with (DP),Y
    ORA ($11),Y             ; [11 11      ] OR A with (DP),Y
    BPL $391C               ; [10 01      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $143940 (SNES $D43940) ---
org $D43940

    BRK                     ; [00 00      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA [$01]               ; [07 01      ] OR A with [DP]
    ORA $0F1A07             ; [0F 07 1A 0F] OR A with Absolute Long
    AND $1E,X               ; [35 1E      ] AND A with DP,X
    AND ($0F)               ; [32 0F      ] AND A with (DP)
    EOR $0007,Y             ; [59 07 00   ] XOR A with Absolute,Y
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    COP #$07                ; [02 07      ] Coprocessor interrupt
    ORA [$0F]               ; [07 0F      ] OR A with [DP]
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL $0F14,X             ; [1E 14 0F   ] Shift Left Absolute,X
    BRK                     ; [00 17      ] Software interrupt
    BMI $3961               ; [30 00      ] Branch if Minus
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRA $3959               ; [80 F2      ] Branch Always
    BRK                     ; [00 46      ] Software interrupt
    INY                     ; [C8         ] Increment Y
    NOP                     ; [EA         ] No Operation
    BVS $39E9               ; [70 7C      ] Branch if Overflow Set
    CLV                     ; [B8         ] Clear Overflow Flag
    LDY $00F8,X             ; [BC F8 00   ] Load Y from Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $3983               ; [80 0C      ] Branch Always
    TSB $74BC               ; [0C BC 74   ] Test and Set Bits Absolute
    SEI                     ; [78         ] Set Interrupt Disable
    TSB $10A8               ; [0C A8 10   ] Test and Set Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 37      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    AND $1310,Y             ; [39 10 13   ] AND A with Absolute,Y
    BRK                     ; [00 14      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 0B      ] Software interrupt
    BPL $39C1               ; [10 34      ] Branch if Plus
    BRK                     ; [00 64      ] Software interrupt
    JSR $0000               ; [20 00 00   ] Jump to Subroutine
    ORA $0C16,Y             ; [19 16 0C   ] OR A with Absolute,Y
    BRK                     ; [00 0A      ] Software interrupt
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($14,X)             ; [01 14      ] OR A with (DP,X)
    BRK                     ; [00 02      ] Software interrupt
    ORA #$1A                ; [09 1A      ] OR A with Immediate
    AND ($2C,X)             ; [21 2C      ] AND A with (DP,X)
    SED                     ; [F8         ] Set Decimal Flag
    STX $7C                 ; [86 7C      ] Store X to DP
    STX $7C                 ; [86 7C      ] Store X to DP
    STZ $FC7C,X             ; [9E 7C FC   ] Store Zero to Absolute,X
    BVS $3A23               ; [70 78      ] Branch if Overflow Set
    BRK                     ; [00 DC      ] Software interrupt
    BMI $397D               ; [30 CE      ] Branch if Minus
    STZ $F8,X               ; [74 F8      ] Store Zero to DP,X
    BVC $3A2F               ; [50 7C      ] Branch if Overflow Clear
    PLP                     ; [28         ] Pull Processor Status
    JMP ($7028,X)           ; [7C 28 70   ] Jump Indirect,X
    BIT $1060               ; [2C 60 10   ] Test Bits Absolute
    BRA $39BC               ; [80 00      ] Branch Always
    BMI $39BE               ; [30 00      ] Branch if Minus
    BVS $39C4               ; [70 04      ] Branch if Overflow Set
    AND [$08],Y             ; [37 08      ] AND A with [DP],Y
    AND $1310,Y             ; [39 10 13   ] AND A with Absolute,Y
    BRK                     ; [00 14      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 0B      ] Software interrupt
    BPL $3A01               ; [10 34      ] Branch if Plus
    BRK                     ; [00 64      ] Software interrupt
    JSR $0000               ; [20 00 00   ] Jump to Subroutine
    ORA $0C16,Y             ; [19 16 0C   ] OR A with Absolute,Y
    BRK                     ; [00 0A      ] Software interrupt
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($14,X)             ; [01 14      ] OR A with (DP,X)
    BRK                     ; [00 02      ] Software interrupt
    ORA #$1A                ; [09 1A      ] OR A with Immediate
    AND ($2C,X)             ; [21 2C      ] AND A with (DP,X)
    SED                     ; [F8         ] Set Decimal Flag
    STX $7C                 ; [86 7C      ] Store X to DP
    STX $7C                 ; [86 7C      ] Store X to DP
    STZ $FC7C,X             ; [9E 7C FC   ] Store Zero to Absolute,X
    BVS $3A63               ; [70 78      ] Branch if Overflow Set
    BRK                     ; [00 DC      ] Software interrupt
    BMI $39BD               ; [30 CE      ] Branch if Minus
    STZ $F8,X               ; [74 F8      ] Store Zero to DP,X
    BVC $3A6F               ; [50 7C      ] Branch if Overflow Clear
    PLP                     ; [28         ] Pull Processor Status
    JMP ($7028,X)           ; [7C 28 70   ] Jump Indirect,X
    BIT $1060               ; [2C 60 10   ] Test Bits Absolute
    BRA $39FC               ; [80 00      ] Branch Always
    BMI $39FE               ; [30 00      ] Branch if Minus
    BVS $3A04               ; [70 04      ] Branch if Overflow Set
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TSB $27                 ; [04 27      ] Test and Set Bits in DP
    CLC                     ; [18         ] Clear Carry Flag
    BIT $5A13               ; [2C 13 5A   ] Test Bits Absolute
    db $21                      ; Incomplete/data bytes

;--- Patch at file offset $143A16 (SNES $D43A16) ---
org $D43A16

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
    BVC $3A62               ; [50 20      ] Branch if Overflow Clear
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $70                 ; [06 70      ] Shift Left DP
    BRK                     ; [00 88      ] Software interrupt
    BMI $3A4E               ; [30 FF      ] Branch if Minus
    BPL $3A51               ; [10 00      ] Branch if Plus
    AND $081300,X           ; [3F 00 13 08] AND A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($76,X)             ; [01 76      ] OR A with (DP,X)
    ADC ($10),Y             ; [71 10      ] Add with Carry (DP),Y
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 A6      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    CPY $00                 ; [C4 00      ] Compare Y with DP
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $3A7D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $3AC5               ; [90 4C      ] Branch if Carry Clear
    BCC $3A7F               ; [90 04      ] Branch if Carry Clear
    BRA $3AF5               ; [80 78      ] Branch Always
    SEI                     ; [78         ] Set Interrupt Disable
    SEC                     ; [38         ] Set Carry Flag
    SEC                     ; [38         ] Set Carry Flag
    STA $9B08,Y             ; [99 08 9B   ] Store A to Absolute,Y
    ASL $7B                 ; [06 7B      ] Shift Left DP
    ORA [$79],Y             ; [17 79      ] OR A with [DP],Y
    AND [$7C]               ; [27 7C      ] AND A with [DP]
    BRK                     ; [00 F4      ] Software interrupt
    PHA                     ; [48         ] Push Accumulator
    SBC [$19]               ; [E7 19      ] Subtract with Borrow [DP]
    CMP [$38]               ; [C7 38      ] Compare A with [DP]
    ROR $4606               ; [6E 06 46   ] Rotate Right Absolute
    JSR $1007               ; [20 07 10   ] Jump to Subroutine
    ORA [$30],Y             ; [17 30      ] OR A with [DP],Y
    JSR $2B23               ; [20 23 2B   ] Jump to Subroutine
    PLA                     ; [68         ] Pull Accumulator
    PHY                     ; [5A         ] Push Y Register
    TCD                     ; [5B         ] Transfer A to Direct Page
    SEC                     ; [38         ] Set Carry Flag
    SEC                     ; [38         ] Set Carry Flag
    BIT $3C00,X             ; [3C 00 3C   ] Test Bits Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    JSR ($FCC8,X)           ; [FC C8 FC   ] Jump to Subroutine Indirect,X
    INY                     ; [C8         ] Increment Y
    LDY $BE48,X             ; [BC 48 BE   ] Load Y from Absolute,X
    MVP $9E,$60             ; [44 9E 60   ] Block Move Positive
    ASL $C0F0               ; [0E F0 C0   ] Shift Left Absolute
    BRK                     ; [00 C0      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    BPL $3ACE               ; [10 18      ] Branch if Plus
    BCC $3AD0               ; [90 18      ] Branch if Carry Clear
    BVC $3B12               ; [50 58      ] Branch if Overflow Clear
    CLI                     ; [58         ] Clear Interrupt Disable
    JML $F06C6C             ; [5C 6C 6C F0] Jump Long
    BEQ $3AC1               ; [F0 00      ] Branch if Equal
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 1B      ] Software interrupt
    TSB $27                 ; [04 27      ] Test and Set Bits in DP
    CLC                     ; [18         ] Clear Carry Flag
    BIT $5A13               ; [2C 13 5A   ] Test Bits Absolute
    db $21                      ; Incomplete/data bytes

;--- Patch at file offset $143AD6 (SNES $D43AD6) ---
org $D43AD6

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
    BVC $3B22               ; [50 20      ] Branch if Overflow Clear
    ROL $00,X               ; [36 00      ] Rotate Left DP,X
    TRB $1406               ; [1C 06 14   ] Test and Reset Bits Absolute
    ASL $1C                 ; [06 1C      ] Shift Left DP
    TSB $28                 ; [04 28      ] Test and Set Bits in DP
    BRK                     ; [00 6B      ] Software interrupt
    JSR $105C               ; [20 5C 10   ] Jump to Subroutine
    BRK                     ; [00 3F      ] Software interrupt
    BRK                     ; [00 19      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    ORA ($16,X)             ; [01 16      ] OR A with (DP,X)
    ORA ($14,X)             ; [01 14      ] OR A with (DP,X)
    JSR $3003               ; [20 03 30   ] Jump to Subroutine
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 4C      ] Software interrupt
    BVS $3AB7               ; [70 88      ] Branch if Overflow Set
    BRK                     ; [00 C4      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $3B3D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $3B85               ; [90 4C      ] Branch if Carry Clear
    BCC $3B3F               ; [90 04      ] Branch if Carry Clear
    PHP                     ; [08         ] Push Processor Status
    BEQ $3B2E               ; [F0 F0      ] Branch if Equal
    BVS $3BB0               ; [70 70      ] Branch if Overflow Set
    BIT $00                 ; [24 00      ] Test Bits DP
    ROR $7B04,X             ; [7E 04 7B   ] Rotate Right Absolute,X
    ORA [$E8]               ; [07 E8      ] OR A with [DP]
    ORA [$E4],Y             ; [17 E4      ] OR A with [DP],Y
    CLC                     ; [18         ] Clear Carry Flag
    INY                     ; [C8         ] Increment Y
    BMI $3B1C               ; [30 CF      ] Branch if Minus
    db $32                      ; Incomplete/data bytes

;--- Patch at file offset $143B58 (SNES $D43B58) ---
org $D43B58

    TCD                     ; [5B         ] Transfer A to Direct Page
    CLI                     ; [58         ] Clear Interrupt Disable
    ROR $71,X               ; [76 71      ] Rotate Right DP,X
    STZ $76,X               ; [74 76      ] Store Zero to DP,X
    BRK                     ; [00 00      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 78      ] Software interrupt
    BPL $3B61               ; [10 FC      ] Branch if Plus
    INY                     ; [C8         ] Increment Y
    INC $FECC,X             ; [FE CC FE   ] Increment Absolute,X
    TSB $5E                 ; [04 5E      ] Test and Set Bits in DP
    BIT $FC                 ; [24 FC      ] Test Bits DP
    BRA $3B47               ; [80 D8      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BCS $3B85               ; [B0 10      ] Branch if Carry Set
    CLC                     ; [18         ] Clear Carry Flag
    BPL $3B94               ; [10 1C      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    TRB $AC28               ; [1C 28 AC   ] Test and Reset Bits Absolute
    PHP                     ; [08         ] Push Processor Status
    DEY                     ; [88         ] Decrement Y
    BRK                     ; [00 00      ] Software interrupt
    STA $9B08,Y             ; [99 08 9B   ] Store A to Absolute,Y
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $143B8B (SNES $D43B8B) ---
org $D43B8B

    BPL $3BC9               ; [10 3C      ] Branch if Plus
    PHD                     ; [0B         ] Push Direct Page Register
    ORA $066E00             ; [0F 00 6E 06] OR A with Absolute Long
    db $46                      ; Incomplete/data bytes

;--- Patch at file offset $143B9A (SNES $D43B9A) ---
org $D43B9A

    PLP                     ; [28         ] Pull Processor Status
    BIT $03,X               ; [34 03      ] Test Bits DP,X
    PHD                     ; [0B         ] Push Direct Page Register
    BRK                     ; [00 00      ] Software interrupt
    BIT $3C00,X             ; [3C 00 3C   ] Test Bits Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    JSR ($FE08,X)           ; [FC 08 FE   ] Jump to Subroutine Indirect,X
    CPY $3E                 ; [C4 3E      ] Compare Y with DP
    TSB $7E                 ; [04 7E      ] Test and Set Bits in DP
    RTS                     ; [60         ] Return from Subroutine
    INC $EED0               ; [EE D0 EE   ] Increment Absolute
    BPL $3B71               ; [10 C0      ] Branch if Plus
    BRK                     ; [00 C0      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    BPL $3BCE               ; [10 18      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    TRB $8C48               ; [1C 48 8C   ] Test and Reset Bits Absolute
    STY $146C               ; [8C 6C 14   ] Store Y to Absolute
    PEI ($10)               ; [D4 10      ] Push Effective Indirect
    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $143BC8 (SNES $D43BC8) ---
org $D43BC8

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    db $0F, $00                 ; Incomplete/data bytes

;--- Patch at file offset $143BDA (SNES $D43BDA) ---
org $D43BDA

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)

;--- Patch at file offset $143BE8 (SNES $D43BE8) ---
org $D43BE8

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BCS $3BEE               ; [B0 00      ] Branch if Carry Set
    INX                     ; [E8         ] Increment X
    db $90                      ; Incomplete/data bytes

;--- Patch at file offset $143BFB (SNES $D43BFB) ---
org $D43BFB

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BCC $3C38               ; [90 37      ] Branch if Carry Clear
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
    BPL $3C21               ; [10 03      ] Branch if Plus
    BPL $3C23               ; [10 03      ] Branch if Plus
    PEA $F448               ; [F4 48 F4   ] Push Effective Absolute
    PHP                     ; [08         ] Push Processor Status
    JSR ($7C00,X)           ; [FC 00 7C   ] Jump to Subroutine Indirect,X
    BRA $3C21               ; [80 F8      ] Branch Always
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    PHA                     ; [48         ] Push Accumulator
    BPL $3BDC               ; [10 A8      ] Branch if Plus
    DEY                     ; [88         ] Decrement Y
    BPL $3C3F               ; [10 08      ] Branch if Plus
    BNE $3BB9               ; [D0 80      ] Branch if Not Equal
    BVC $3C03               ; [50 C8      ] Branch if Overflow Clear
    BPL $3C49               ; [10 0C      ] Branch if Plus
    LDY #$84                ; [A0 84      ] Load Y Immediate
    PLP                     ; [28         ] Pull Processor Status
    AND #$0C                ; [29 0C      ] AND A with Immediate
    JSL $005F00             ; [22 00 5F 00] Jump to Subroutine Long
    EOR ($02)               ; [52 02      ] XOR A with (DP)
    AND ($02)               ; [32 02      ] AND A with (DP)
    ORA $030700             ; [0F 00 07 03] OR A with Absolute Long
    ORA $021000             ; [0F 00 10 02] OR A with Absolute Long
    ORA $2001,X             ; [1D 01 20   ] OR A with Absolute,X
    BRK                     ; [00 0C      ] Software interrupt
    AND $00,S               ; [23 00      ] AND A with Stack Relative
    ORA $000000             ; [0F 00 00 00] OR A with Absolute Long
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 9C      ] Software interrupt
    CPX #$18                ; [E0 18      ] Compare X Immediate
    BRK                     ; [00 78      ] Software interrupt
    BPL $3C65               ; [10 FC      ] Branch if Plus
    SEC                     ; [38         ] Set Carry Flag
    ROL $FF04,X             ; [3E 04 FF   ] Rotate Left Absolute,X
    PER $3D6F               ; [62 FF 00   ] Push Effective Relative
    TSB $08                 ; [04 08      ] Test and Set Bits in DP
    CPX #$E8                ; [E0 E8      ] Compare X Immediate
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    BRK                     ; [00 90      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    TYA                     ; [98         ] Transfer Y to A
    JML $006E0C             ; [5C 0C 6E 00] Jump Long
    BRK                     ; [00 50      ] Software interrupt
    JSR $003C               ; [20 3C 00   ] Jump to Subroutine
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BPL $3C8C               ; [10 00      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    AND $081300,X           ; [3F 00 13 08] AND A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 19      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    PHD                     ; [0B         ] Push Direct Page Register
    ASL $0B                 ; [06 0B      ] Shift Left DP

;--- Patch at file offset $143CAB (SNES $D43CAB) ---
org $D43CAB

    BPL $3CE9               ; [10 3C      ] Branch if Plus
    PHD                     ; [0B         ] Push Direct Page Register
    ORA $060E00             ; [0F 00 0E 06] OR A with Absolute Long
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $143CBA (SNES $D43CBA) ---
org $D43CBA

    PLP                     ; [28         ] Pull Processor Status
    BIT $03,X               ; [34 03      ] Test Bits DP,X
    PHD                     ; [0B         ] Push Direct Page Register
    BRK                     ; [00 00      ] Software interrupt
    BVC $3CE2               ; [50 20      ] Branch if Overflow Clear
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $11                 ; [06 11      ] Shift Left DP
    BRK                     ; [00 0B      ] Software interrupt
    ORA ($1E,X)             ; [01 1E      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    AND $081300,X           ; [3F 00 13 08] AND A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 05      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    ORA ($FE,X)             ; [01 FE      ] OR A with (DP,X)
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRA $3D2B               ; [80 3C      ] Branch Always
    BRA $3CB5               ; [80 C4      ] Branch Always
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $3CFD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $3D45               ; [90 4C      ] Branch if Carry Clear
    BCC $3D17               ; [90 1C      ] Branch if Carry Clear
    JSR $908C               ; [20 8C 90   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $143D0B (SNES $D43D0B) ---
org $D43D0B

    BPL $3D49               ; [10 3C      ] Branch if Plus

;--- Patch at file offset $143D1A (SNES $D43D1A) ---
org $D43D1A

    PLP                     ; [28         ] Pull Processor Status
    BIT $03,X               ; [34 03      ] Test Bits DP,X
    PHD                     ; [0B         ] Push Direct Page Register
    BRK                     ; [00 00      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    JSR $30F8               ; [20 F8 30   ] Jump to Subroutine
    JSR ($FC10,X)           ; [FC 10 FC   ] Jump to Subroutine Indirect,X
    PHP                     ; [08         ] Push Processor Status
    ROR $7E04,X             ; [7E 04 7E   ] Rotate Right Absolute,X
    RTS                     ; [60         ] Return from Subroutine
    INC $F0D0               ; [EE D0 F0   ] Increment Absolute
    BRK                     ; [00 80      ] Software interrupt
    LDY #$40                ; [A0 40      ] Load Y Immediate
    BVS $3D15               ; [70 E0      ] Branch if Overflow Set
    BEQ $3DA7               ; [F0 70      ] Branch if Equal
    SEI                     ; [78         ] Set Interrupt Disable
    CLC                     ; [18         ] Clear Carry Flag
    STZ $6484               ; [9C 84 64   ] Store Zero to Absolute
    BPL $3D0E               ; [10 D0      ] Branch if Plus
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
    BRK                     ; [00 64      ] Software interrupt
    JSR $30B8               ; [20 B8 30   ] Jump to Subroutine
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 C4      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    STY $00                 ; [84 00      ] Store Y to DP
    CPX #$58                ; [E0 58      ] Compare X Immediate
    BRA $3D89               ; [80 10      ] Branch Always
    TAY                     ; [A8         ] Transfer A to Y
    RTI                     ; [40         ] Return from Interrupt
    BMI $3D5D               ; [30 E0      ] Branch if Minus
    BPL $3DBF               ; [10 40      ] Branch if Plus
    db $A0                      ; Incomplete/data bytes

;--- Patch at file offset $143D86 (SNES $D43D86) ---
org $D43D86

    SBC $4B,X               ; [F5 4B      ] Subtract with Borrow DP,X
    SEP #$00                ; [E2 00      ] Set Processor Status Bits
    SBC ($10,S),Y           ; [F3 10      ] Subtract with Borrow (SR),Y
    BIT $1F0B,X             ; [3C 0B 1F   ] Test Bits Absolute,X

;--- Patch at file offset $143D96 (SNES $D43D96) ---
org $D43D96

    PLD                     ; [2B         ] Pull Direct Page Register
    RTS                     ; [60         ] Return from Subroutine
    BVC $3DE7               ; [50 4D      ] Branch if Overflow Clear
    PLP                     ; [28         ] Pull Processor Status
    BIT $03,X               ; [34 03      ] Test Bits DP,X
    PHD                     ; [0B         ] Push Direct Page Register
    BRK                     ; [00 00      ] Software interrupt
    CLV                     ; [B8         ] Clear Overflow Flag
    BCC $3D9F               ; [90 FC      ] Branch if Carry Clear
    PHP                     ; [08         ] Push Processor Status
    JSR ($DEC0,X)           ; [FC C0 DE   ] Jump to Subroutine Indirect,X
    LDY $2E                 ; [A4 2E      ] Load Y from DP
    BPL $3E29               ; [10 7E      ] Branch if Plus
    RTS                     ; [60         ] Return from Subroutine
    INC $F6D0               ; [EE D0 F6   ] Increment Absolute
    PHP                     ; [08         ] Push Processor Status
    BRA $3E02               ; [80 50      ] Branch Always
    BPL $3DCC               ; [10 18      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    TAY                     ; [A8         ] Transfer A to Y
    BIT $9454               ; [2C 54 94   ] Test Bits Absolute
    STY $64                 ; [84 64      ] Store Y to DP
    TRB $D4                 ; [14 D4      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    BIT $5913               ; [2C 13 59   ] Test Bits Absolute
    JSR $2050               ; [20 50 20   ] Jump to Subroutine

;--- Patch at file offset $143DD6 (SNES $D43DD6) ---
org $D43DD6

    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA [$18]               ; [07 18      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA [$10],Y             ; [17 10      ] OR A with [DP],Y
    AND $003F00             ; [2F 00 3F 00] AND A with Absolute Long
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CPX $38                 ; [E4 38      ] Compare X with DP
    PLX                     ; [FA         ] Pull X Register
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    BRK                     ; [00 3E      ] Software interrupt
    CPY #$FE                ; [C0 FE      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    SEC                     ; [38         ] Set Carry Flag
    DEY                     ; [88         ] Decrement Y
    MVN $C8,$14             ; [54 C8 14   ] Block Move Negative
    BRK                     ; [00 EC      ] Software interrupt
    CPY $28                 ; [C4 28      ] Compare Y with DP
    BIT $3600,X             ; [3C 00 36   ] Test Bits Absolute,X
    TSB $54                 ; [04 54      ] Test and Set Bits in DP
    ASL $54                 ; [06 54      ] Shift Left DP
    ASL $70                 ; [06 70      ] Shift Left DP
    JSR $0049               ; [20 49 00   ] Jump to Subroutine
    ADC $093900             ; [6F 00 39 09] Add with Carry Absolute Long
    BRK                     ; [00 13      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    AND ($06,X)             ; [21 06      ] AND A with (DP,X)
    BMI $3E1D               ; [30 00      ] Branch if Minus
    BPL $3E2E               ; [10 0F      ] Branch if Plus
    ASL $FE                 ; [06 FE      ] Shift Left DP
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    STZ $1C00,X             ; [9E 00 1C   ] Store Zero to Absolute,X
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 B8      ] Software interrupt
    BCC $3E75               ; [90 44      ] Branch if Carry Clear
    DEY                     ; [88         ] Decrement Y
    BIT $80,X               ; [34 80      ] Test Bits DP,X
    BIT $90                 ; [24 90      ] Test Bits DP
    TSB $68                 ; [04 68      ] Test and Set Bits in DP
    PHA                     ; [48         ] Push Accumulator
    BIT $C8                 ; [24 C8      ] Test Bits DP
    JSR $A040               ; [20 40 A0   ] Jump to Subroutine
    BRA $3E90               ; [80 50      ] Branch Always
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    ORA [$3B]               ; [07 3B      ] OR A with [DP]
    ORA [$79]               ; [07 79      ] OR A with [DP]
    AND [$74]               ; [27 74      ] AND A with [DP]
    PHP                     ; [08         ] Push Processor Status
    STZ $08,X               ; [74 08      ] Store Zero to DP,X
    ADC $026701,X           ; [7F 01 67 02] Add with Carry Absolute Long,X
    EOR [$00]               ; [47 00      ] XOR A with [DP]
    ORA [$10],Y             ; [17 10      ] OR A with [DP],Y
    ORA [$10],Y             ; [17 10      ] OR A with [DP],Y
    ORA [$30],Y             ; [17 30      ] OR A with [DP],Y
    PLP                     ; [28         ] Pull Processor Status
    PLD                     ; [2B         ] Pull Direct Page Register
    PLD                     ; [2B         ] Pull Direct Page Register
    PLP                     ; [28         ] Pull Processor Status
    JSL $020023             ; [22 23 00 02] Jump to Subroutine Long
    BRK                     ; [00 00      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    BPL $3E5B               ; [10 F8      ] Branch if Plus
    BCC $3E61               ; [90 FC      ] Branch if Carry Clear
    TYA                     ; [98         ] Transfer Y to A
    LDY $BC48,X             ; [BC 48 BC   ] Load Y from Absolute,X
    PHA                     ; [48         ] Push Accumulator
    JSR ($1800,X)           ; [FC 00 18   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BMI $3E93               ; [30 20      ] Branch if Minus
    BMI $3E15               ; [30 A0      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    BVC $3ED0               ; [50 58      ] Branch if Overflow Clear
    BVC $3ED2               ; [50 58      ] Branch if Overflow Clear
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $143E84 (SNES $D43E84) ---
org $D43E84

    BRK                     ; [00 00      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    TSB $03                 ; [04 03      ] Test and Set Bits in DP
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $081702             ; [0F 02 17 08] OR A with Absolute Long

;--- Patch at file offset $143E97 (SNES $D43E97) ---
org $D43E97

    BRK                     ; [00 00      ] Software interrupt
    ORA $05,S               ; [03 05      ] OR A with Stack Relative
    TSB $01                 ; [04 01      ] Test and Set Bits in DP
    COP #$04                ; [02 04      ] Coprocessor interrupt
    PHD                     ; [0B         ] Push Direct Page Register
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 7C      ] Software interrupt
    BRA $3EA9               ; [80 FC      ] Branch Always
    BRK                     ; [00 DE      ] Software interrupt
    JSR $0000               ; [20 00 00   ] Jump to Subroutine
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $3F1A               ; [80 60      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    TYA                     ; [98         ] Transfer Y to A
    BEQ $3EC6               ; [F0 08      ] Branch if Equal
    CLI                     ; [58         ] Clear Interrupt Disable
    LDY $2E                 ; [A4 2E      ] Load Y from DP
    BPL $3F1F               ; [10 5C      ] Branch if Plus
    JSR $40BC               ; [20 BC 40   ] Jump to Subroutine
    LDY $B540,X             ; [BC 40 B5   ] Load Y from Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    MVN $20,$5D             ; [54 20 5D   ] Block Move Negative
    PLP                     ; [28         ] Pull Processor Status
    TYX                     ; [BB         ] Transfer Y to X
    EOR $08                 ; [45 08      ] XOR A with Direct Page
    ORA [$13],Y             ; [17 13      ] OR A with [DP],Y
    BIT $4833               ; [2C 33 48   ] Test Bits Absolute
    AND $50,S               ; [23 50      ] AND A with Stack Relative
    ROL                     ; [2A         ] Rotate Left Accumulator
    RTI                     ; [40         ] Return from Interrupt
    ORA $28,S               ; [03 28      ] OR A with Stack Relative
    COP #$28                ; [02 28      ] Coprocessor interrupt
    AND $50                 ; [25 50      ] AND A with Direct Page
    CMP $003F20,X           ; [DF 20 3F 00] Compare A with Absolute Long,X
    ORA ($00,S),Y           ; [13 00      ] OR A with (SR),Y
    STA ($00,S),Y           ; [93 00      ] Store A to (SR),Y
    ASL $220C,X             ; [1E 0C 22   ] Shift Left Absolute,X
    BRK                     ; [00 46      ] Software interrupt
    JSR $E4DE               ; [20 DE E4   ] Jump to Subroutine
    BPL $3EE0               ; [10 EE      ] Branch if Plus
    BRA $3F66               ; [80 72      ] Branch Always
    STY $0860               ; [8C 60 08   ] Store Y to Absolute
    STZ $80                 ; [64 80      ] Store Zero to DP
    JMP ($4C90)             ; [6C 90 4C   ] Jump Indirect
    JSR $E098               ; [20 98 E0   ] Jump to Subroutine
    TSB $F6                 ; [04 F6      ] Test and Set Bits in DP
    ORA ($47,X)             ; [01 47      ] OR A with (DP,X)
    COP #$0E                ; [02 0E      ] Coprocessor interrupt
    ORA $1E                 ; [05 1E      ] OR A with Direct Page
    BRK                     ; [00 38      ] Software interrupt
    BRK                     ; [00 EC      ] Software interrupt
    BIT $67,X               ; [34 67      ] Test Bits DP,X
    INC                     ; [1A         ] Increment Accumulator
    ORA $004100,X           ; [1F 00 41 00] OR A with Absolute Long,X
    COP #$02                ; [02 02      ] Coprocessor interrupt
    ORA $04                 ; [05 04      ] OR A with Direct Page
    BRK                     ; [00 01      ] Software interrupt
    ASL $3309               ; [0E 09 33   ] Shift Left Absolute
    BIT $18,X               ; [34 18      ] Test Bits DP,X
    INC                     ; [1A         ] Increment Accumulator
    BRK                     ; [00 00      ] Software interrupt
    ADC $72FF66,X           ; [7F 66 FF 72] Add with Carry Absolute Long,X
    ADC $A2EF92,X           ; [7F 92 EF A2] Add with Carry Absolute Long,X
    ADC $64FE62,X           ; [7F 62 FE 64] Add with Carry Absolute Long,X
    ROR $9C84,X             ; [7E 84 9C   ] Rotate Right Absolute,X
    BRK                     ; [00 E8      ] Software interrupt
    STX $0674               ; [8E 74 06   ] Store X to Absolute
    STY $06                 ; [84 06      ] Store Y to DP
    PEI ($66)               ; [D4 66      ] Push Effective Indirect
    TSB $E6                 ; [04 E6      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    db $6C                      ; Incomplete/data bytes

;--- Patch at file offset $143F44 (SNES $D43F44) ---
org $D43F44

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TSB $27                 ; [04 27      ] Test and Set Bits in DP
    CLC                     ; [18         ] Clear Carry Flag
    BIT $5B13               ; [2C 13 5B   ] Test Bits Absolute
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $143F56 (SNES $D43F56) ---
org $D43F56

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
    BVC $3FA2               ; [50 20      ] Branch if Overflow Clear
    BMI $3F84               ; [30 00      ] Branch if Minus
    BPL $3F86               ; [10 00      ] Branch if Plus
    ORA ($00,S),Y           ; [13 00      ] OR A with (SR),Y
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    BPL $3F8C               ; [10 00      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
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
    BRK                     ; [00 94      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    CPY $00                 ; [C4 00      ] Compare Y with DP
    MVP $A8,$68             ; [44 A8 68   ] Block Move Positive
    BRA $3FBD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $4005               ; [90 4C      ] Branch if Carry Clear
    BCC $3FBF               ; [90 04      ] Branch if Carry Clear
    DEY                     ; [88         ] Decrement Y
    SEI                     ; [78         ] Set Interrupt Disable
    SEI                     ; [78         ] Set Interrupt Disable
    SEC                     ; [38         ] Set Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    BVC $3FE2               ; [50 20      ] Branch if Overflow Clear
    BMI $3FC4               ; [30 00      ] Branch if Minus
    BPL $3FC6               ; [10 00      ] Branch if Plus
    ORA ($00,S),Y           ; [13 00      ] OR A with (SR),Y
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    BPL $3FCC               ; [10 00      ] Branch if Plus
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
    BRK                     ; [00 94      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    CPY $00                 ; [C4 00      ] Compare Y with DP
    MVP $A8,$68             ; [44 A8 68   ] Block Move Positive
    BRA $3FFD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $4045               ; [90 4C      ] Branch if Carry Clear
    BCC $3FFF               ; [90 04      ] Branch if Carry Clear
    DEY                     ; [88         ] Decrement Y
    SEI                     ; [78         ] Set Interrupt Disable
    SEI                     ; [78         ] Set Interrupt Disable
    SEC                     ; [38         ] Set Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $205911             ; [2F 11 59 20] AND A with Absolute Long

;--- Patch at file offset $144016 (SNES $D44016) ---
org $D44016

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ASL $18                 ; [06 18      ] Shift Left DP
    ORA #$17                ; [09 17      ] OR A with Immediate
    BPL $404E               ; [10 2E      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 F8      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    JSR ($5E40,X)           ; [FC 40 5E   ] Jump to Subroutine Indirect,X
    RTI                     ; [40         ] Return from Interrupt
    INC $5EB0,X             ; [FE B0 5E   ] Increment Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    PHA                     ; [48         ] Push Accumulator
    BVC $401B               ; [50 E0      ] Branch if Overflow Clear
    CPX $B0B4               ; [EC B4 B0   ] Compare X with Absolute
    CPX $E8                 ; [E4 E8      ] Compare X with DP
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600               ; [2C 00 16   ] Test Bits Absolute
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $20                 ; [06 20      ] Shift Left DP
    BPL $4084               ; [10 37      ] Branch if Plus
    ORA $060F78,X           ; [1F 78 0F 06] OR A with Absolute Long,X
    AND $1102,Y             ; [39 02 11   ] AND A with Absolute,Y
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($1E,X)             ; [01 1E      ] OR A with (DP,X)
    ORA ($0F,X)             ; [01 0F      ] OR A with (DP,X)
    BPL $4066               ; [10 07      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    INC $FC40,X             ; [FE 40 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    CPY #$3E                ; [C0 3E      ] Compare Y Immediate
    CPX #$FC                ; [E0 FC      ] Compare X Immediate
    BPL $40B5               ; [10 44      ] Branch if Plus
    PHA                     ; [48         ] Push Accumulator
    BRK                     ; [00 A8      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $4085               ; [90 0C      ] Branch if Carry Clear
    BCC $403F               ; [90 C4      ] Branch if Carry Clear
    CLC                     ; [18         ] Clear Carry Flag
    CPX #$0C                ; [E0 0C      ] Compare X Immediate
    BPL $4088               ; [10 08      ] Branch if Plus
    STA $9F0E,X             ; [9D 0E 9F   ] Store A to Absolute,X
    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $14408C (SNES $D4408C) ---
org $D4408C

    ASL $02                 ; [06 02      ] Shift Left DP
    ORA [$00]               ; [07 00      ] OR A with [DP]
    PER $819F               ; [62 0C 41   ] Push Effective Relative
    JSR $0007               ; [20 07 00   ] Jump to Subroutine
    COP #$01                ; [02 01      ] Coprocessor interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    BRK                     ; [00 00      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    JSR $2028               ; [20 28 20   ] Jump to Subroutine
    PEA $DE08               ; [F4 08 DE   ] Push Effective Absolute
    BIT $AE                 ; [24 AE      ] Test Bits DP
    TRB $BC                 ; [14 BC      ] Test and Reset Bits DP
    BPL $4065               ; [10 B8      ] Branch if Plus
    BPL $40BF               ; [10 10      ] Branch if Plus
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BPL $40BD               ; [10 08      ] Branch if Plus
    BRK                     ; [00 20      ] Software interrupt
    TSB $10                 ; [04 10      ] Test and Set Bits in DP
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    BPL $40BD               ; [10 00      ] Branch if Plus
    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $1440C4 (SNES $D440C4) ---
org $D440C4

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $205911             ; [2F 11 59 20] AND A with Absolute Long

;--- Patch at file offset $1440D6 (SNES $D440D6) ---
org $D440D6

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ASL $18                 ; [06 18      ] Shift Left DP
    ORA #$17                ; [09 17      ] OR A with Immediate
    BPL $410E               ; [10 2E      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 F8      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    JSR ($5E40,X)           ; [FC 40 5E   ] Jump to Subroutine Indirect,X
    RTI                     ; [40         ] Return from Interrupt
    INC $5EB0,X             ; [FE B0 5E   ] Increment Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    PHA                     ; [48         ] Push Accumulator
    BVC $40DB               ; [50 E0      ] Branch if Overflow Clear
    CPX $B0B4               ; [EC B4 B0   ] Compare X with Absolute
    CPX $E8                 ; [E4 E8      ] Compare X with DP
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    JSL $021400             ; [22 00 14 02] Jump to Subroutine Long
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BIT $2506,X             ; [3C 06 25   ] Test Bits Absolute,X
    BRK                     ; [00 67      ] Software interrupt
    JSR $1159               ; [20 59 11   ] Jump to Subroutine
    ASL $39                 ; [06 39      ] Shift Left DP
    PHP                     ; [08         ] Push Processor Status
    ORA $08,X               ; [15 08      ] OR A with DP,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA ($12,X)             ; [01 12      ] OR A with (DP,X)
    PHP                     ; [08         ] Push Processor Status
    BMI $4126               ; [30 08      ] Branch if Minus
    AND [$00],Y             ; [37 00      ] AND A with [DP],Y
    INC $FC40,X             ; [FE 40 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 9E      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    LSR $3C30,X             ; [5E 30 3C   ] Shift Right Absolute,X
    BPL $4175               ; [10 44      ] Branch if Plus
    PHA                     ; [48         ] Push Accumulator
    BRK                     ; [00 A8      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $4145               ; [90 0C      ] Branch if Carry Clear
    BCC $419F               ; [90 64      ] Branch if Carry Clear
    PHP                     ; [08         ] Push Processor Status
    BCS $4142               ; [B0 04      ] Branch if Carry Set
    BNE $4140               ; [D0 00      ] Branch if Not Equal
    EOR #$01                ; [49 01      ] XOR A with Immediate
    AND $070900,X           ; [3F 00 09 07] AND A with Absolute Long,X
    TSB $0B00               ; [0C 00 0B   ] Test and Set Bits Absolute
    ORA $11,S               ; [03 11      ] OR A with Stack Relative
    ASL $0819               ; [0E 19 08   ] Shift Left Absolute

;--- Patch at file offset $144156 (SNES $D44156) ---
org $D44156

    COP #$01                ; [02 01      ] Coprocessor interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ASL $0E00               ; [0E 00 0E   ] Shift Left Absolute
    ASL $0000               ; [0E 00 00   ] Shift Left Absolute
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 F4      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    PLX                     ; [FA         ] Pull X Register
    CPX $04BA               ; [EC BA 04   ] Compare X with Absolute
    ROL $3ED4               ; [2E D4 3E   ] Rotate Left Absolute
    TYA                     ; [98         ] Transfer Y to A
    LDY $CC88,X             ; [BC 88 CC   ] Load Y from Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    CPY #$18                ; [C0 18      ] Compare Y Immediate
    BRK                     ; [00 EC      ] Software interrupt
    BRK                     ; [00 04      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BNE $417E               ; [D0 04      ] Branch if Not Equal
    CPY #$58                ; [C0 58      ] Compare Y Immediate
    CPY #$C8                ; [C0 C8      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    STA $9F0E,X             ; [9D 0E 9F   ] Store A to Absolute,X
    ORA ($6B,X)             ; [01 6B      ] OR A with (DP,X)
    ORA [$12]               ; [07 12      ] OR A with [DP]
    BRK                     ; [00 2C      ] Software interrupt
    TRB $2D63               ; [1C 63 2D   ] Test and Reset Bits Absolute
    AND $00,X               ; [35 00      ] AND A with DP,X
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 62      ] Software interrupt
    TSB $2041               ; [0C 41 20   ] Test and Set Bits Absolute
    ORA [$00]               ; [07 00      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA $1D                 ; [05 1D      ] OR A with Direct Page
    COP #$3D                ; [02 3D      ] Coprocessor interrupt
    BMI $41A5               ; [30 08      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    JSR $202E               ; [20 2E 20   ] Jump to Subroutine
    INC $0C,X               ; [F6 0C      ] Increment DP,X
    JML $D8A420             ; [5C 20 A4 D8] Jump Long
    ASL $ACCC,X             ; [1E CC AC   ] Shift Left Absolute,X
    BRA $416F               ; [80 C0      ] Branch Always
    BRK                     ; [00 E0      ] Software interrupt
    BPL $4193               ; [10 E0      ] Branch if Plus
    BPL $41BD               ; [10 08      ] Branch if Plus
    TSB $A0                 ; [04 A0      ] Test and Set Bits in DP
    BRK                     ; [00 D8      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BIT $C0C0               ; [2C C0 C0   ] Test Bits Absolute

;--- Patch at file offset $1441CA (SNES $D441CA) ---
org $D441CA

    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA [$00]               ; [07 00      ] OR A with [DP]

;--- Patch at file offset $1441DE (SNES $D441DE) ---
org $D441DE

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1441EA (SNES $D441EA) ---
org $D441EA

    BVS $41EC               ; [70 00      ] Branch if Overflow Set
    STZ $F670               ; [9C 70 F6   ] Store Zero to Absolute
    CLC                     ; [18         ] Clear Carry Flag

;--- Patch at file offset $1441FA (SNES $D441FA) ---
org $D441FA

    BRK                     ; [00 00      ] Software interrupt
    BPL $426E               ; [10 70      ] Branch if Plus
    BMI $421C               ; [30 1C      ] Branch if Minus
    ORA $2F06,Y             ; [19 06 2F   ] OR A with Absolute,Y
    BPL $4264               ; [10 5F      ] Branch if Plus
    JSR $2050               ; [20 50 20   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 25      ] Software interrupt
    BRK                     ; [00 3D      ] Software interrupt
    TSB $15                 ; [04 15      ] Test and Set Bits in DP
    ORA $0601               ; [0D 01 06   ] OR A with Absolute
    ORA $271810             ; [0F 10 18 27] OR A with Absolute Long
    COP #$3D                ; [02 3D      ] Coprocessor interrupt
    ROL $19                 ; [26 19      ] Rotate Left DP
    ASL                     ; [0A         ] Shift Left Accumulator
    BPL $421F               ; [10 02      ] Branch if Plus
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 FF      ] Software interrupt
    BPL $421A               ; [10 F7      ] Branch if Plus
    JSR $10FF               ; [20 FF 10   ] Jump to Subroutine
    db $7E                      ; Incomplete/data bytes

;--- Patch at file offset $144234 (SNES $D44234) ---
org $D44234

    BVC $41C8               ; [50 92      ] Branch if Overflow Clear
    MVN $90,$30             ; [54 90 30   ] Block Move Negative
    PEI ($80)               ; [D4 80      ] Push Effective Indirect
    STZ $04                 ; [64 04      ] Store Zero to DP
    ADC ($24)               ; [72 24      ] Add with Carry (DP)
    LSR                     ; [4A         ] Shift Right Accumulator
    AND $0D,X               ; [35 0D      ] AND A with DP,X
    BVC $4264               ; [50 20      ] Branch if Overflow Clear
    ADC $0F783F,X           ; [7F 3F 78 0F] Add with Carry Absolute Long,X
    JMP ($6737,X)           ; [7C 37 67   ] Jump Indirect,X
    JSR $0025               ; [20 25 00   ] Jump to Subroutine
    ROL $0200,X             ; [3E 00 02   ] Rotate Left Absolute,X
    BRK                     ; [00 2E      ] Software interrupt
    ORA ($0F,X)             ; [01 0F      ] OR A with (DP,X)
    BMI $425E               ; [30 07      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    AND ($04,S),Y           ; [33 04      ] AND A with (SR),Y
    PLP                     ; [28         ] Pull Processor Status
    BPL $4277               ; [10 1A      ] Branch if Plus
    COP #$00                ; [02 00      ] Coprocessor interrupt
    BRK                     ; [00 7F      ] Software interrupt
    BRA $42B1               ; [80 4E      ] Branch Always
    BRK                     ; [00 CA      ] Software interrupt
    DEY                     ; [88         ] Decrement Y
    TSX                     ; [BA         ] Transfer Stack Pointer to X
    TYA                     ; [98         ] Transfer Y to A
    INC $9760,X             ; [FE 60 97   ] Increment Absolute,X
    PLA                     ; [68         ] Pull Accumulator
    LDA [$2E],Y             ; [B7 2E      ] Load A from [DP],Y
    ADC $020400             ; [6F 00 04 02] Add with Carry Absolute Long
    JSR $B890               ; [20 90 B8   ] Jump to Subroutine
    TSB $D8                 ; [04 D8      ] Test and Set Bits in DP
    TSB $60                 ; [04 60      ] Test and Set Bits in DP
    BRK                     ; [00 68      ] Software interrupt
    BRK                     ; [00 68      ] Software interrupt
    ROR $00                 ; [66 00      ] Rotate Right DP
    BRK                     ; [00 51      ] Software interrupt
    JSR $002C               ; [20 2C 00   ] Jump to Subroutine
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    JSR $3710               ; [20 10 37   ] Jump to Subroutine
    ORA $060F38,X           ; [1F 38 0F 06] OR A with Absolute Long,X
    AND $1102,Y             ; [39 02 11   ] AND A with Absolute,Y
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($1E,X)             ; [01 1E      ] OR A with (DP,X)
    ORA ($0F,X)             ; [01 0F      ] OR A with (DP,X)
    BPL $42A6               ; [10 07      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    ORA $1F0E,X             ; [1D 0E 1F   ] OR A with Absolute,X
    ORA ($0B,X)             ; [01 0B      ] OR A with (DP,X)
    ORA [$12]               ; [07 12      ] OR A with [DP]
    BRK                     ; [00 2C      ] Software interrupt
    TRB $2D63               ; [1C 63 2D   ] Test and Reset Bits Absolute
    AND $00,X               ; [35 00      ] AND A with DP,X
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 02      ] Software interrupt
    TSB $0001               ; [0C 01 00   ] Test and Set Bits Absolute
    ORA [$00]               ; [07 00      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA $1D                 ; [05 1D      ] OR A with Direct Page
    COP #$3D                ; [02 3D      ] Coprocessor interrupt
    BMI $42C5               ; [30 08      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600               ; [2C 00 16   ] Test Bits Absolute
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $20                 ; [06 20      ] Shift Left DP
    BPL $4304               ; [10 37      ] Branch if Plus
    ORA $060F18,X           ; [1F 18 0F 06] OR A with Absolute Long,X
    AND $1102,Y             ; [39 02 11   ] AND A with Absolute,Y
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($1E,X)             ; [01 1E      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($07),Y             ; [11 07      ] OR A with (DP),Y
    PHP                     ; [08         ] Push Processor Status
    INC $FC40,X             ; [FE 40 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    CPX #$BC                ; [E0 BC      ] Compare X Immediate
    SEI                     ; [78         ] Set Interrupt Disable
    MVP $48,$00             ; [44 48 00   ] Block Move Positive
    TAY                     ; [A8         ] Transfer A to Y
    PHP                     ; [08         ] Push Processor Status
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $4305               ; [90 0C      ] Branch if Carry Clear
    BCS $42FF               ; [B0 04      ] Branch if Carry Set
    CLC                     ; [18         ] Clear Carry Flag
    JSR $78C4               ; [20 C4 78   ] Jump to Subroutine
    BRK                     ; [00 24      ] Software interrupt
    TSB $24                 ; [04 24      ] Test and Set Bits in DP
    TSB $1F                 ; [04 1F      ] Test and Set Bits in DP
    ORA ($12,X)             ; [01 12      ] OR A with (DP,X)
    BRK                     ; [00 2C      ] Software interrupt
    TRB $2D63               ; [1C 63 2D   ] Test and Reset Bits Absolute
    db $35                      ; Incomplete/data bytes

;--- Patch at file offset $144313 (SNES $D44313) ---
org $D44313

    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    BRK                     ; [00 08      ] Software interrupt
    ORA $1D                 ; [05 1D      ] OR A with Direct Page
    COP #$3D                ; [02 3D      ] Coprocessor interrupt
    BMI $4325               ; [30 08      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    PLY                     ; [7A         ] Pull Y Register
    TSB $142E               ; [0C 2E 14   ] Test and Set Bits Absolute
    CPX $98                 ; [E4 98      ] Compare X with DP
    JML $CCBE08             ; [5C 08 BE CC] Jump Long
    ASL $B0C0,X             ; [1E C0 B0   ] Shift Left Absolute,X
    BRA $42EF               ; [80 C0      ] Branch Always
    BRK                     ; [00 0C      ] Software interrupt
    BRA $4343               ; [80 10      ] Branch Always
    CPY $98                 ; [C4 98      ] Compare Y with DP
    BRK                     ; [00 80      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    CPY #$0C                ; [C0 0C      ] Compare Y Immediate
    CPX #$20                ; [E0 20      ] Compare X Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 F8      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    JSR ($5E40,X)           ; [FC 40 5E   ] Jump to Subroutine Indirect,X
    RTI                     ; [40         ] Return from Interrupt
    INC $5EB0,X             ; [FE B0 5E   ] Increment Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    PHA                     ; [48         ] Push Accumulator
    BVC $433B               ; [50 E0      ] Branch if Overflow Clear
    CPX $B0B4               ; [EC B4 B0   ] Compare X with Absolute
    CPX $E8                 ; [E4 E8      ] Compare X with DP
    INC $FC40,X             ; [FE 40 FC   ] Increment Absolute,X
    BRK                     ; [00 E4      ] Software interrupt
    BRK                     ; [00 A4      ] Software interrupt
    BRK                     ; [00 5E      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    STX $8E00               ; [8E 00 8E   ] Store X to Absolute
    BRK                     ; [00 1C      ] Software interrupt
    BRK                     ; [00 44      ] Software interrupt
    PHA                     ; [48         ] Push Accumulator
    BRK                     ; [00 A0      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    CPY #$50                ; [C0 50      ] Compare Y Immediate
    DEY                     ; [88         ] Decrement Y
    SEC                     ; [38         ] Set Carry Flag
    BRA $43DF               ; [80 64      ] Branch Always
    BPL $43DD               ; [10 60      ] Branch if Plus
    TRB $40                 ; [14 40      ] Test and Reset Bits DP
    TAY                     ; [A8         ] Transfer A to Y
    db $9D, $0F                 ; Incomplete/data bytes

;--- Patch at file offset $144388 (SNES $D44388) ---
org $D44388

    BIT $631C               ; [2C 1C 63   ] Test Bits Absolute
    AND $0035               ; [2D 35 00   ] AND A with Absolute
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 63      ] Software interrupt

;--- Patch at file offset $144398 (SNES $D44398) ---
org $D44398

    ORA $3D02,X             ; [1D 02 3D   ] OR A with Absolute,X
    BMI $43A5               ; [30 08      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    JSR ($FA90,X)           ; [FC 90 FA   ] Jump to Subroutine Indirect,X
    PEI ($EA)               ; [D4 EA      ] Push Effective Indirect
    STY $6E,X               ; [94 6E      ] Store Y to DP,X
    TRB $A4                 ; [14 A4      ] Test and Reset Bits DP
    CLD                     ; [D8         ] Clear Decimal Flag
    TRB $BCC8               ; [1C C8 BC   ] Test and Reset Bits Absolute
    DEY                     ; [88         ] Decrement Y
    CLD                     ; [D8         ] Clear Decimal Flag
    BRK                     ; [00 90      ] Software interrupt
    BRK                     ; [00 D4      ] Software interrupt
    BRK                     ; [00 94      ] Software interrupt
    BRK                     ; [00 90      ] Software interrupt
    TSB $D8                 ; [04 D8      ] Test and Set Bits in DP
    BRK                     ; [00 E0      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    CPY #$C8                ; [C0 C8      ] Compare Y Immediate

;--- Patch at file offset $1443C4 (SNES $D443C4) ---
org $D443C4

    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $205911             ; [2F 11 59 20] AND A with Absolute Long
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y

;--- Patch at file offset $1443D6 (SNES $D443D6) ---
org $D443D6

    BRK                     ; [00 07      ] Software interrupt
    ASL $18                 ; [06 18      ] Shift Left DP
    ORA #$17                ; [09 17      ] OR A with Immediate
    BPL $440C               ; [10 2E      ] Branch if Plus
    ASL $39                 ; [06 39      ] Shift Left DP
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 F8      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    JSR ($5E40,X)           ; [FC 40 5E   ] Jump to Subroutine Indirect,X
    RTI                     ; [40         ] Return from Interrupt
    INC $5EB0,X             ; [FE B0 5E   ] Increment Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    INC $0040,X             ; [FE 40 00   ] Increment Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    PHA                     ; [48         ] Push Accumulator
    BVC $43D9               ; [50 E0      ] Branch if Overflow Clear
    CPX $B0B4               ; [EC B4 B0   ] Compare X with Absolute
    CPX $E8                 ; [E4 E8      ] Compare X with DP
    MVP $48,$2C             ; [44 48 2C   ] Block Move Positive
    BRK                     ; [00 56      ] Software interrupt
    TSB $54                 ; [04 54      ] Test and Set Bits in DP
    ASL $74                 ; [06 74      ] Shift Left DP
    ROL $41                 ; [26 41      ] Rotate Left DP
    ORA ($37),Y             ; [11 37      ] OR A with (DP),Y
    ASL $1F30,X             ; [1E 30 1F   ] Shift Left Absolute,X
    ORA $020E,X             ; [1D 0E 02   ] OR A with Absolute,X
    ORA ($28),Y             ; [11 28      ] OR A with (DP),Y
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    AND ($28,X)             ; [21 28      ] AND A with (DP,X)
    ORA ($3F,X)             ; [01 3F      ] OR A with (DP,X)
    BRK                     ; [00 0E      ] Software interrupt
    BPL $442C               ; [10 0F      ] Branch if Plus
    BPL $4421               ; [10 02      ] Branch if Plus
    TSB $00FC               ; [0C FC 00   ] Test and Set Bits Absolute
    DEC $CE00               ; [CE 00 CE   ] Decrement Absolute
    BRK                     ; [00 BE      ] Software interrupt
    BMI $43C7               ; [30 9E      ] Branch if Minus
    BRK                     ; [00 1E      ] Software interrupt
    BRK                     ; [00 1C      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $4457               ; [80 24      ] Branch Always
    BCC $4459               ; [90 24      ] Branch if Carry Clear
    BCC $44AB               ; [90 74      ] Branch if Carry Clear
    BRK                     ; [00 4C      ] Software interrupt
    JSR $24C8               ; [20 C8 24   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    JSR $C000               ; [20 00 C0   ] Jump to Subroutine
    ORA $070B01             ; [0F 01 0B 07] OR A with Absolute Long
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    ORA [$03]               ; [07 03      ] OR A with [DP]
    TSB $03                 ; [04 03      ] Test and Set Bits in DP
    ORA $00                 ; [05 00      ] OR A with Direct Page
    ORA [$02]               ; [07 02      ] OR A with [DP]
    ASL $00                 ; [06 00      ] Shift Left DP
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA [$00]               ; [07 00      ] OR A with [DP]
    COP #$01                ; [02 01      ] Coprocessor interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    COP #$02                ; [02 02      ] Coprocessor interrupt
    COP #$02                ; [02 02      ] Coprocessor interrupt
    BRK                     ; [00 00      ] Software interrupt
    INX                     ; [E8         ] Increment X
    BPL $4457               ; [10 F4      ] Branch if Plus
    CLD                     ; [D8         ] Clear Decimal Flag
    PEI ($28)               ; [D4 28      ] Push Effective Indirect
    JML [$DC28]             ; [DC 28 DC   ] Jump Long Indirect
    PLP                     ; [28         ] Pull Processor Status
    JMP ($3828,X)           ; [7C 28 38   ] Jump Indirect,X
    BPL $44A7               ; [10 38      ] Branch if Plus
    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 D8      ] Software interrupt
    BRK                     ; [00 28      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    JSR $0008               ; [20 08 00   ] Jump to Subroutine
    PLP                     ; [28         ] Pull Processor Status
    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ASL $01                 ; [06 01      ] Shift Left DP
    ORA #$06                ; [09 06      ] OR A with Immediate
    ORA $081700             ; [0F 00 17 08] OR A with Absolute Long

;--- Patch at file offset $144497 (SNES $D44497) ---
org $D44497

    BRK                     ; [00 00      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    ASL $07                 ; [06 07      ] Shift Left DP
    BRK                     ; [00 06      ] Software interrupt
    ORA #$00                ; [09 00      ] OR A with Immediate
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    INC $7E00,X             ; [FE 00 7E   ] Increment Absolute,X
    DEY                     ; [88         ] Decrement Y
    SBC $48BF08,X           ; [FF 08 BF 48] Subtract with Borrow Absolute Long,X
    CMP $000024,X           ; [DF 24 00 00] Compare A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    JSR $0050               ; [20 50 00   ] Jump to Subroutine
    TRB $08                 ; [14 08      ] Test and Reset Bits DP
    CPY $2AC8               ; [CC C8 2A   ] Compare Y with Absolute
    TAY                     ; [A8         ] Transfer A to Y
    LSR                     ; [4A         ] Shift Right Accumulator
    MVP $A4,$17             ; [44 A4 17   ] Block Move Positive
    PHP                     ; [08         ] Push Processor Status
    BIT $5C10               ; [2C 10 5C   ] Test Bits Absolute
    JSR $2052               ; [20 52 20   ] Jump to Subroutine
    AND ($10,S),Y           ; [33 10      ] AND A with (SR),Y
    ROL $260C               ; [2E 0C 26   ] Rotate Left Absolute
    COP #$27                ; [02 27      ] Coprocessor interrupt
    ORA $04,S               ; [03 04      ] OR A with Stack Relative
    PHD                     ; [0B         ] Push Direct Page Register
    ORA $14,S               ; [03 14      ] OR A with Stack Relative
    ORA $20,S               ; [03 20      ] OR A with Stack Relative
    ORA $28                 ; [05 28      ] OR A with Direct Page
    TRB $1D00               ; [1C 00 1D   ] Test and Reset Bits Absolute
    BRK                     ; [00 1B      ] Software interrupt
    BRK                     ; [00 09      ] Software interrupt
    ORA ($7B)               ; [12 7B      ] OR A with (DP)
    CLC                     ; [18         ] Clear Carry Flag
    ROL $3E08,X             ; [3E 08 3E   ] Rotate Left Absolute,X
    BRK                     ; [00 4E      ] Software interrupt
    BRK                     ; [00 4E      ] Software interrupt
    BRK                     ; [00 39      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    SBC ($60),Y             ; [F1 60      ] Subtract with Borrow (DP),Y
    CMP #$F0                ; [C9 F0      ] Compare A Immediate
    TRB $08DC               ; [1C DC 08   ] Test and Reset Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    STY $40                 ; [84 40      ] Store Y to DP
    BCS $44F8               ; [B0 00      ] Branch if Carry Set
    LDY #$10                ; [A0 10      ] Load Y Immediate
    TYA                     ; [98         ] Transfer Y to A
    LSR $6E                 ; [46 6E      ] Shift Right DP
    BRK                     ; [00 F4      ] Software interrupt
    COP #$3F                ; [02 3F      ] Coprocessor interrupt
    ORA ($39,X)             ; [01 39      ] OR A with (DP,X)
    BRK                     ; [00 12      ] Software interrupt
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    BRK                     ; [00 1B      ] Software interrupt
    ORA $050309             ; [0F 09 03 05] OR A with Absolute Long
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    ORA ($10,X)             ; [01 10      ] OR A with (DP,X)
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA [$04]               ; [07 04      ] OR A with [DP]
    COP #$02                ; [02 02      ] Coprocessor interrupt

;--- Patch at file offset $144525 (SNES $D44525) ---
org $D44525

    LDY $4AF5               ; [AC F5 4A   ] Load Y from Absolute
    STA $9B0A,X             ; [9D 0A 9B   ] Store A to Absolute,X
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $144534 (SNES $D44534) ---
org $D44534

    LDY $4A00               ; [AC 00 4A   ] Load Y from Absolute
    RTI                     ; [40         ] Return from Interrupt
    PER $A9A3               ; [62 68 64   ] Push Effective Relative
    db $62                      ; Incomplete/data bytes

;--- Patch at file offset $144544 (SNES $D44544) ---
org $D44544

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $205911             ; [2F 11 59 20] AND A with Absolute Long

;--- Patch at file offset $144556 (SNES $D44556) ---
org $D44556

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ASL $18                 ; [06 18      ] Shift Left DP
    ORA #$17                ; [09 17      ] OR A with Immediate
    BPL $458E               ; [10 2E      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 F8      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    JSR ($5E40,X)           ; [FC 40 5E   ] Jump to Subroutine Indirect,X
    RTI                     ; [40         ] Return from Interrupt
    INC $5EB0,X             ; [FE B0 5E   ] Increment Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    PHA                     ; [48         ] Push Accumulator
    BVC $455B               ; [50 E0      ] Branch if Overflow Clear
    CPX $B0B4               ; [EC B4 B0   ] Compare X with Absolute
    CPX $E8                 ; [E4 E8      ] Compare X with DP
    CLI                     ; [58         ] Clear Interrupt Disable
    JSR $0020               ; [20 20 00   ] Jump to Subroutine
    BPL $4586               ; [10 00      ] Branch if Plus
    ORA $1000,Y             ; [19 00 10   ] OR A with Absolute,Y
    BRK                     ; [00 34      ] Software interrupt
    BPL $45B8               ; [10 2B      ] Branch if Plus
    BPL $45E0               ; [10 51      ] Branch if Plus
    ORA ($16),Y             ; [11 16      ] OR A with (DP),Y
    AND #$0F                ; [29 0F      ] AND A with Immediate
    BPL $45A4               ; [10 0F      ] Branch if Plus
    BRK                     ; [00 06      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    AND $0A,X               ; [35 0A      ] AND A with DP,X
    INC $FC40,X             ; [FE 40 FC   ] Increment Absolute,X
    BRK                     ; [00 9C      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 2E      ] Software interrupt
    BPL $45C3               ; [10 14      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    MVP $48,$00             ; [44 48 00   ] Block Move Positive
    TAY                     ; [A8         ] Transfer A to Y
    PLP                     ; [28         ] Pull Processor Status
    RTI                     ; [40         ] Return from Interrupt
    PHP                     ; [08         ] Push Processor Status
    BNE $45C5               ; [D0 0C      ] Branch if Not Equal
    BCC $45BF               ; [90 04      ] Branch if Carry Clear
    PHP                     ; [08         ] Push Processor Status
    BCC $4602               ; [90 44      ] Branch if Carry Clear
    DEY                     ; [88         ] Decrement Y
    RTS                     ; [60         ] Return from Subroutine
    CLI                     ; [58         ] Clear Interrupt Disable
    JSR $0020               ; [20 20 00   ] Jump to Subroutine
    BPL $45C6               ; [10 00      ] Branch if Plus
    ORA $1000,Y             ; [19 00 10   ] OR A with Absolute,Y
    BRK                     ; [00 3A      ] Software interrupt
    BPL $45F8               ; [10 2B      ] Branch if Plus
    BPL $4620               ; [10 51      ] Branch if Plus
    ORA ($16),Y             ; [11 16      ] OR A with (DP),Y
    AND #$0F                ; [29 0F      ] AND A with Immediate
    BPL $45E4               ; [10 0F      ] Branch if Plus
    BRK                     ; [00 06      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $14,X               ; [15 14      ] OR A with DP,X
    BRK                     ; [00 35      ] Software interrupt
    ASL                     ; [0A         ] Shift Left Accumulator
    INC $FC40,X             ; [FE 40 FC   ] Increment Absolute,X
    BRK                     ; [00 9C      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 2E      ] Software interrupt
    BPL $4603               ; [10 14      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    MVP $48,$00             ; [44 48 00   ] Block Move Positive
    TAY                     ; [A8         ] Transfer A to Y
    PLP                     ; [28         ] Pull Processor Status
    RTI                     ; [40         ] Return from Interrupt
    PHP                     ; [08         ] Push Processor Status
    BNE $4605               ; [D0 0C      ] Branch if Not Equal
    BCC $45FF               ; [90 04      ] Branch if Carry Clear
    PHP                     ; [08         ] Push Processor Status
    BCC $4642               ; [90 44      ] Branch if Carry Clear
    DEY                     ; [88         ] Decrement Y
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 00      ] Software interrupt
    TSB $1400               ; [0C 00 14   ] Test and Set Bits Absolute
    PHP                     ; [08         ] Push Processor Status
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    PHP                     ; [08         ] Push Processor Status
    AND $601F,Y             ; [39 1F 60   ] AND A with Absolute,Y
    AND $007FCF,X           ; [3F CF 7F 00] AND A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    TSB $0C                 ; [04 0C      ] Test and Set Bits in DP
    ORA $003F00,X           ; [1F 00 3F 00] OR A with Absolute Long,X
    ADC $00000E,X           ; [7F 0E 00 00] Add with Carry Absolute Long,X
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 7C      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    STY $9C68               ; [8C 68 9C   ] Store Y to Absolute
    TYA                     ; [98         ] Transfer Y to A
    BIT $3C38,X             ; [3C 38 3C   ] Test Bits Absolute,X
    SED                     ; [F8         ] Set Decimal Flag
    TSB $00F8               ; [0C F8 00   ] Test and Set Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 78      ] Software interrupt
    BPL $4621               ; [10 E8      ] Branch if Plus
    BVS $4603               ; [70 C8      ] Branch if Overflow Set
    BEQ $4605               ; [F0 C8      ] Branch if Equal
    BMI $4637               ; [30 F8      ] Branch if Minus
    BRK                     ; [00 D1      ] Software interrupt
    ADC ($FD),Y             ; [71 FD      ] Add with Carry (DP),Y
    RTS                     ; [60         ] Return from Subroutine
    INC $64,X               ; [F6 64      ] Increment DP,X
    PEA $7466               ; [F4 66 74   ] Push Effective Absolute
    ROL $70                 ; [26 70      ] Rotate Left DP
    JSR $1039               ; [20 39 10   ] Jump to Subroutine
    ADC ($3D)               ; [72 3D      ] Add with Carry (DP)
    ADC ($1F),Y             ; [71 1F      ] Add with Carry (DP),Y
    ADC ($32,X)             ; [61 32      ] Add with Carry (DP,X)
    PLA                     ; [68         ] Pull Accumulator
    AND ($68,X)             ; [21 68      ] AND A with (DP,X)
    AND ($28,X)             ; [21 28      ] AND A with (DP,X)
    ORA ($2E,X)             ; [01 2E      ] OR A with (DP,X)
    ORA ($16,X)             ; [01 16      ] OR A with (DP,X)
    BRK                     ; [00 3D      ] Software interrupt
    ORA $F8E8               ; [0D E8 F8   ] OR A with Absolute
    JSR ($FCF8,X)           ; [FC F8 FC   ] Jump to Subroutine Indirect,X
    SEC                     ; [38         ] Set Carry Flag
    JSR ($EC38,X)           ; [FC 38 EC   ] Jump to Subroutine Indirect,X
    SEC                     ; [38         ] Set Carry Flag
    JML $70D838             ; [5C 38 D8 70] Jump Long
    CPX $F818               ; [EC 18 F8   ] Compare X with Absolute
    DEY                     ; [88         ] Decrement Y
    SED                     ; [F8         ] Set Decimal Flag
    CPY #$B8                ; [C0 B8      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    CLV                     ; [B8         ] Clear Overflow Flag
    RTS                     ; [60         ] Return from Subroutine
    CLV                     ; [B8         ] Clear Overflow Flag
    PLP                     ; [28         ] Pull Processor Status
    SEC                     ; [38         ] Set Carry Flag
    DEY                     ; [88         ] Decrement Y
    BVS $467E               ; [70 00      ] Branch if Overflow Set
    CLC                     ; [18         ] Clear Carry Flag
    PHP                     ; [08         ] Push Processor Status
    STA $0E9B0C,X           ; [9F 0C 9B 0E] Store A to Absolute Long,X

;--- Patch at file offset $14468C (SNES $D4468C) ---
org $D4468C

    ASL $0F0A,X             ; [1E 0A 0F   ] Shift Left Absolute,X
    BRK                     ; [00 60      ] Software interrupt
    TSB $2E46               ; [0C 46 2E   ] Test and Set Bits Absolute

;--- Patch at file offset $14469C (SNES $D4469C) ---
org $D4469C

    ORA #$03                ; [09 03      ] OR A with Immediate
    BRK                     ; [00 00      ] Software interrupt
    ROL $2C,X               ; [36 2C      ] Rotate Left DP,X
    ROL $2C,X               ; [36 2C      ] Rotate Left DP,X
    LDX $3E24,Y             ; [BE 24 3E   ] Load X from Absolute,Y
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    STY $7C                 ; [84 7C      ] Store Y to DP
    PHP                     ; [08         ] Push Processor Status
    SEI                     ; [78         ] Set Interrupt Disable
    BMI $469F               ; [30 F0      ] Branch if Minus
    BRK                     ; [00 CC      ] Software interrupt
    BIT $CC                 ; [24 CC      ] Test Bits DP
    JSR $6044               ; [20 44 60   ] Jump to Subroutine
    CPY $C0                 ; [C4 C0      ] Compare Y with DP
    STY $04                 ; [84 04      ] Store Y to DP
    DEY                     ; [88         ] Decrement Y
    BRA $466D               ; [80 B0      ] Branch Always
    BRA $46BF               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    BPL $46EF               ; [10 28      ] Branch if Plus
    BPL $4738               ; [10 6F      ] Branch if Plus
    SEC                     ; [38         ] Set Carry Flag
    ADC $3F703F,X           ; [7F 3F 70 3F] Add with Carry Absolute Long,X
    ADC $00003F             ; [6F 3F 00 00] Add with Carry Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BPL $46D6               ; [10 00      ] Branch if Plus
    BPL $46D8               ; [10 00      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    JSR $301F               ; [20 1F 30   ] Jump to Subroutine
    AND $263F20,X           ; [3F 20 3F 26] AND A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 70      ] Software interrupt
    JSR $5098               ; [20 98 50   ] Jump to Subroutine
    CLV                     ; [B8         ] Clear Overflow Flag
    BCS $4727               ; [B0 3C      ] Branch if Carry Set
    CLV                     ; [B8         ] Clear Overflow Flag
    BIT $0CF8,X             ; [3C F8 0C   ] Test Bits Absolute,X
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    JSR $7000               ; [20 00 70   ] Jump to Subroutine
    JSR $60D0               ; [20 D0 60   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    BVS $46C5               ; [70 C8      ] Branch if Overflow Set
    BMI $46F7               ; [30 F8      ] Branch if Minus
    BRK                     ; [00 49      ] Software interrupt
    AND $60B3,Y             ; [39 B3 60   ] AND A with Absolute,Y
    JSR ($F462,X)           ; [FC 62 F4   ] Jump to Subroutine Indirect,X
    ROR $F4                 ; [66 F4      ] Rotate Right DP
    db $66                      ; Incomplete/data bytes

;--- Patch at file offset $144710 (SNES $D44710) ---
org $D44710

    AND $610F,Y             ; [39 0F 61   ] AND A with Absolute,Y
    BIT $2160,X             ; [3C 60 21   ] Test Bits Absolute,X
    PLA                     ; [68         ] Pull Accumulator
    AND ($68,X)             ; [21 68      ] AND A with (DP,X)
    ORA ($26,X)             ; [01 26      ] OR A with (DP,X)
    ORA ($1A,X)             ; [01 1A      ] OR A with (DP,X)
    BRK                     ; [00 19      ] Software interrupt
    BRK                     ; [00 CC      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    INC $DC,X               ; [F6 DC      ] Increment DP,X
    INC $F65C,X             ; [FE 5C F6   ] Increment Absolute,X
    JML $5C18EC             ; [5C EC 18 5C] Jump Long
    SEC                     ; [38         ] Set Carry Flag
    CLD                     ; [D8         ] Clear Decimal Flag
    BVS $46FB               ; [70 CC      ] Branch if Overflow Set
    SEC                     ; [38         ] Set Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    DEY                     ; [88         ] Decrement Y
    JML [$DCC0]             ; [DC C0 DC   ] Jump Long Indirect
    RTI                     ; [40         ] Return from Interrupt
    JML [$9844]             ; [DC 44 98   ] Jump Long Indirect
    BRK                     ; [00 38      ] Software interrupt
    DEY                     ; [88         ] Decrement Y
    BVS $473E               ; [70 00      ] Branch if Overflow Set
    SEC                     ; [38         ] Set Carry Flag
    PHP                     ; [08         ] Push Processor Status
    STZ $20                 ; [64 20      ] Store Zero to DP
    PLY                     ; [7A         ] Pull Y Register
    ROL $BF,X               ; [36 BF      ] Rotate Left DP,X
    JMP $4CBE               ; [4C BE 4C   ] Jump Absolute
    LDA ($4F)               ; [B2 4F      ] Load A from (DP)
    BVC $476C               ; [50 20      ] Branch if Overflow Clear
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    CLC                     ; [18         ] Clear Carry Flag
    AND $381B00,X           ; [3F 00 1B 38] AND A with Absolute Long,X
    ORA [$37]               ; [07 37      ] OR A with [DP]
    RTI                     ; [40         ] Return from Interrupt
    TSB $0D41               ; [0C 41 0D   ] Test and Set Bits Absolute
    EOR $0F2F02             ; [4F 02 2F 0F] XOR A with Absolute Long
    TSB $1C                 ; [04 1C      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    LDY $98                 ; [A4 98      ] Load Y from DP
    INC $DC,X               ; [F6 DC      ] Increment DP,X
    PLX                     ; [FA         ] Pull X Register
    TSB $043E               ; [0C 3E 04   ] Test and Set Bits Absolute
    ROR $3EC4,X             ; [7E C4 3E   ] Rotate Right Absolute,X
    TSB $DC                 ; [04 DC      ] Test and Set Bits in DP
    INY                     ; [C8         ] Increment Y
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 58      ] Software interrupt
    CPY #$1C                ; [C0 1C      ] Compare Y Immediate
    CPY $0C                 ; [C4 0C      ] Compare Y with DP
    BRK                     ; [00 C4      ] Software interrupt
    CPY #$C4                ; [C0 C4      ] Compare Y Immediate
    BRK                     ; [00 C4      ] Software interrupt
    CPY #$28                ; [C0 28      ] Compare Y Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRK                     ; [00 9F      ] Software interrupt
    TSB $0E9B               ; [0C 9B 0E   ] Test and Set Bits Absolute

;--- Patch at file offset $14478A (SNES $D4478A) ---
org $D4478A

    ROR $25                 ; [66 25      ] Rotate Right DP
    AND [$12],Y             ; [37 12      ] AND A with [DP],Y
    ORA $0C6000,X           ; [1F 00 60 0C] OR A with Absolute Long,X
    LSR $2E                 ; [46 2E      ] Shift Right DP

;--- Patch at file offset $14479A (SNES $D4479A) ---
org $D4479A

    ORA $0A38,X             ; [1D 38 0A   ] OR A with Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    BIT $28,X               ; [34 28      ] Test Bits DP,X
    ROL $2C,X               ; [36 2C      ] Rotate Left DP,X
    LDX $2C,Y               ; [B6 2C      ] Load X from DP,Y
    ROL $7E04,X             ; [3E 04 7E   ] Rotate Left Absolute,X
    CPY $1E                 ; [C4 1E      ] Compare Y with DP
    TSB $FC                 ; [04 FC      ] Test and Set Bits in DP
    CLD                     ; [D8         ] Clear Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 C8      ] Software interrupt
    JSR $24CC               ; [20 CC 24   ] Jump to Subroutine
    JMP $C460               ; [4C 60 C4   ] Jump Absolute
    CPY #$C4                ; [C0 C4      ] Compare Y Immediate
    BRK                     ; [00 E4      ] Software interrupt
    CPX #$18                ; [E0 18      ] Compare X Immediate
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $1447CA (SNES $D447CA) ---
org $D447CA

    BRK                     ; [00 00      ] Software interrupt
    TRB $3700               ; [1C 00 37   ] Test and Reset Bits Absolute
    db $1C                      ; Incomplete/data bytes

;--- Patch at file offset $1447DC (SNES $D447DC) ---
org $D447DC

    BRK                     ; [00 00      ] Software interrupt
    db $1C, $00                 ; Incomplete/data bytes

;--- Patch at file offset $1447EA (SNES $D447EA) ---
org $D447EA

    BRK                     ; [00 00      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 CC      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable

;--- Patch at file offset $1447FC (SNES $D447FC) ---
org $D447FC

    BRK                     ; [00 00      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 63      ] Software interrupt
    AND ($30,S),Y           ; [33 30      ] AND A with (SR),Y
    ORA $271F37,X           ; [1F 37 1F 27] OR A with Absolute Long,X
    TRB $3868               ; [1C 68 38   ] Test and Reset Bits Absolute
    PHY                     ; [5A         ] Push Y Register
    JSR $327E               ; [20 7E 32   ] Jump to Subroutine
    PLY                     ; [7A         ] Pull Y Register
    ROL $3F,X               ; [36 3F      ] Rotate Left DP,X
    TSB $100F               ; [0C 0F 10   ] Test and Set Bits Absolute
    ORA $071C03,X           ; [1F 03 1C 07] OR A with Absolute Long,X
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    TSB $0C21               ; [0C 21 0C   ] Test and Set Bits Absolute
    AND ($10),Y             ; [31 10      ] AND A with (DP),Y
    AND ($10),Y             ; [31 10      ] AND A with (DP),Y
    STX $CC                 ; [86 CC      ] Store X to DP
    ASL $8EF8,X             ; [1E F8 8E   ] Shift Left Absolute,X
    JSR ($7C66,X)           ; [FC 66 7C   ] Jump to Subroutine Indirect,X
    ADC ($7E,S),Y           ; [73 7E      ] Add with Carry (SR),Y
    TXY                     ; [9B         ] Transfer X to Y
    ASL $1EFB,X             ; [1E FB 1E   ] Shift Left Absolute,X
    TYX                     ; [BB         ] Transfer Y to X
    DEC $30FC               ; [CE FC 30   ] Decrement Absolute
    CPX #$18                ; [E0 18      ] Compare X Immediate
    JSR ($7C84,X)           ; [FC 84 7C   ] Jump to Subroutine Indirect,X
    CPY #$FE                ; [C0 FE      ] Compare Y Immediate
    PER $B85A               ; [62 1E 70   ] Push Effective Relative
    ASL $0E30,X             ; [1E 30 0E   ] Shift Left Absolute,X
    JSL $38367A             ; [22 7A 36 38] Jump to Subroutine Long
    BPL $4863               ; [10 1E      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    AND $6706,Y             ; [39 06 67   ] AND A with Absolute,Y
    AND #$67                ; [29 67      ] AND A with Immediate
    AND $66                 ; [25 66      ] AND A with Direct Page
    BIT $3F                 ; [24 3F      ] Test Bits DP
    BRK                     ; [00 31      ] Software interrupt
    BRK                     ; [00 17      ] Software interrupt
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 06      ] Software interrupt
    ASL $18                 ; [06 18      ] Shift Left DP
    AND ($1C),Y             ; [31 1C      ] AND A with (DP),Y
    AND $391D,Y             ; [39 1D 39   ] AND A with Absolute,Y

;--- Patch at file offset $144866 (SNES $D44866) ---
org $D44866

    INC $1C,X               ; [F6 1C      ] Increment DP,X
    TDC                     ; [7B         ] Transfer Direct Page to A
    LDX $77                 ; [A6 77      ] Load X from DP
    JSL $FF4267             ; [22 67 42 FF] Jump to Subroutine Long
    BRK                     ; [00 0C      ] Software interrupt
    JSR $449C               ; [20 9C 44   ] Jump to Subroutine
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 1C      ] Software interrupt
    BRK                     ; [00 86      ] Software interrupt
    JSL $DAA08A             ; [22 8A A0 DA] Jump to Subroutine Long
    BRA $487F               ; [80 00      ] Branch Always
    BRK                     ; [00 D1      ] Software interrupt
    ADC ($FD),Y             ; [71 FD      ] Add with Carry (DP),Y
    RTS                     ; [60         ] Return from Subroutine
    INC $64,X               ; [F6 64      ] Increment DP,X
    PEA $7466               ; [F4 66 74   ] Push Effective Absolute
    ROL $70                 ; [26 70      ] Rotate Left DP
    JSR $1039               ; [20 39 10   ] Jump to Subroutine
    ADC ($3D)               ; [72 3D      ] Add with Carry (DP)
    ADC ($1F),Y             ; [71 1F      ] Add with Carry (DP),Y
    RTS                     ; [60         ] Return from Subroutine
    AND ($68,S),Y           ; [33 68      ] AND A with (SR),Y
    AND ($68,X)             ; [21 68      ] AND A with (DP,X)
    AND ($28,X)             ; [21 28      ] AND A with (DP,X)
    ORA ($2E,X)             ; [01 2E      ] OR A with (DP,X)
    ORA ($16,X)             ; [01 16      ] OR A with (DP,X)
    BRK                     ; [00 3D      ] Software interrupt
    ORA $2C7F               ; [0D 7F 2C   ] OR A with Absolute
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    db $0E                      ; Incomplete/data bytes

;--- Patch at file offset $1448AA (SNES $D448AA) ---
org $D448AA

    ROR $25                 ; [66 25      ] Rotate Right DP
    AND [$10],Y             ; [37 10      ] AND A with [DP],Y
    ORA $2000,Y             ; [19 00 20   ] OR A with Absolute,Y
    TSB $0E06               ; [0C 06 0E   ] Test and Set Bits Absolute

;--- Patch at file offset $1448BA (SNES $D448BA) ---
org $D448BA

    ORA $0838,X             ; [1D 38 08   ] OR A with Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    CMP ($71),Y             ; [D1 71      ] Compare A with (DP),Y
    SBC $F660,X             ; [FD 60 F6   ] Subtract with Borrow Absolute,X
    STZ $F4                 ; [64 F4      ] Store Zero to DP
    ROR $74                 ; [66 74      ] Rotate Right DP
    ROL $70                 ; [26 70      ] Rotate Left DP
    JSR $1039               ; [20 39 10   ] Jump to Subroutine
    PLY                     ; [7A         ] Pull Y Register
    AND $71                 ; [25 71      ] AND A with Direct Page
    ORA $683360,X           ; [1F 60 33 68] OR A with Absolute Long,X
    AND ($68,X)             ; [21 68      ] AND A with (DP,X)
    AND ($28,X)             ; [21 28      ] AND A with (DP,X)
    ORA ($2E,X)             ; [01 2E      ] OR A with (DP,X)
    ORA ($16,X)             ; [01 16      ] OR A with (DP,X)
    BRK                     ; [00 25      ] Software interrupt
    ORA $EC                 ; [05 EC      ] OR A with Direct Page
    SED                     ; [F8         ] Set Decimal Flag
    INX                     ; [E8         ] Increment X
    SED                     ; [F8         ] Set Decimal Flag
    JSR ($FC38,X)           ; [FC 38 FC   ] Jump to Subroutine Indirect,X
    SEC                     ; [38         ] Set Carry Flag
    JSR ($4C38,X)           ; [FC 38 4C   ] Jump to Subroutine Indirect,X
    SEC                     ; [38         ] Set Carry Flag
    JML [$EC78]             ; [DC 78 EC   ] Jump Long Indirect
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BRA $48EB               ; [80 F8      ] Branch Always
    INY                     ; [C8         ] Increment Y
    CLV                     ; [B8         ] Clear Overflow Flag
    RTS                     ; [60         ] Return from Subroutine
    CLV                     ; [B8         ] Clear Overflow Flag
    RTS                     ; [60         ] Return from Subroutine
    CLV                     ; [B8         ] Clear Overflow Flag
    JSR $8838               ; [20 38 88   ] Jump to Subroutine
    SEI                     ; [78         ] Set Interrupt Disable
    PHP                     ; [08         ] Push Processor Status
    CLC                     ; [18         ] Clear Carry Flag
    PHP                     ; [08         ] Push Processor Status
    ADC $02,S               ; [63 02      ] Add with Carry Stack Relative
    AND $03,S               ; [23 03      ] AND A with Stack Relative
    ORA $081606,X           ; [1F 06 16 08] OR A with Absolute Long,X
    JSL $25661D             ; [22 1D 66 25] Jump to Subroutine Long
    AND [$10],Y             ; [37 10      ] AND A with [DP],Y

;--- Patch at file offset $144914 (SNES $D44914) ---
org $D44914

    BRK                     ; [00 06      ] Software interrupt
    ORA #$01                ; [09 01      ] OR A with Immediate
    ORA $1D00,X             ; [1D 00 1D   ] OR A with Absolute,X
    SEC                     ; [38         ] Set Carry Flag
    PHP                     ; [08         ] Push Processor Status
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    CLI                     ; [58         ] Clear Interrupt Disable
    BEQ $48EB               ; [F0 C8      ] Branch if Equal
    BMI $4911               ; [30 EC      ] Branch if Minus
    CLD                     ; [D8         ] Clear Decimal Flag
    BIT $18                 ; [24 18      ] Test Bits DP
    JMP ($1CC8,X)           ; [7C C8 1C   ] Jump Indirect,X
    PHP                     ; [08         ] Push Processor Status
    SED                     ; [F8         ] Set Decimal Flag
    BNE $491F               ; [D0 F0      ] Branch if Not Equal
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    CPY #$D8                ; [C0 D8      ] Compare Y Immediate
    CPY #$C8                ; [C0 C8      ] Compare Y Immediate
    BRK                     ; [00 E8      ] Software interrupt
    CPX #$10                ; [E0 10      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 7C      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    STY $9C68               ; [8C 68 9C   ] Store Y to Absolute
    TYA                     ; [98         ] Transfer Y to A
    BIT $3C38,X             ; [3C 38 3C   ] Test Bits Absolute,X
    SED                     ; [F8         ] Set Decimal Flag
    TSB $00F8               ; [0C F8 00   ] Test and Set Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 78      ] Software interrupt
    BPL $4941               ; [10 E8      ] Branch if Plus
    BVS $4923               ; [70 C8      ] Branch if Overflow Set
    BEQ $4925               ; [F0 C8      ] Branch if Equal
    BMI $4957               ; [30 F8      ] Branch if Minus
    BRK                     ; [00 CC      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    JSR ($F2F0,X)           ; [FC F0 F2   ] Jump to Subroutine Indirect,X
    JSR $00F2               ; [20 F2 00   ] Jump to Subroutine
    PEA $F410               ; [F4 10 F4   ] Push Effective Absolute
    BMI $49E1               ; [30 74      ] Branch if Minus
    BCS $495B               ; [B0 EC      ] Branch if Carry Set
    RTS                     ; [60         ] Return from Subroutine
    SED                     ; [F8         ] Set Decimal Flag
    DEY                     ; [88         ] Decrement Y
    BEQ $4934               ; [F0 C0      ] Branch if Equal
    LDY $8860               ; [AC 60 88   ] Load Y from Absolute
    MVP $88,$18             ; [44 88 18   ] Block Move Positive
    PHP                     ; [08         ] Push Processor Status
    SEC                     ; [38         ] Set Carry Flag
    DEY                     ; [88         ] Decrement Y
    SEC                     ; [38         ] Set Carry Flag
    BPL $49F0               ; [10 70      ] Branch if Plus
    db $9F, $0D, $9B            ; Incomplete/data bytes

;--- Patch at file offset $14498A (SNES $D4498A) ---
org $D4498A

    ROR $25                 ; [66 25      ] Rotate Right DP
    AND [$12],Y             ; [37 12      ] AND A with [DP],Y
    ORA $0D6000,X           ; [1F 00 60 0D] OR A with Absolute Long,X
    db $46                      ; Incomplete/data bytes

;--- Patch at file offset $14499A (SNES $D4499A) ---
org $D4499A

    ORA $0A38,X             ; [1D 38 0A   ] OR A with Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    PEI ($C8)               ; [D4 C8      ] Push Effective Indirect
    PLX                     ; [FA         ] Pull X Register
    CPY $DA                 ; [C4 DA      ] Compare Y with DP
    CPY $3E                 ; [C4 3E      ] Compare Y with DP
    TSB $7E                 ; [04 7E      ] Test and Set Bits in DP
    CPY $1E                 ; [C4 1E      ] Compare Y with DP
    TSB $FC                 ; [04 FC      ] Test and Set Bits in DP
    CLD                     ; [D8         ] Clear Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 28      ] Software interrupt
    CPX #$04                ; [E0 04      ] Compare X Immediate
    CPY #$24                ; [C0 24      ] Compare Y Immediate
    CPX #$C4                ; [E0 C4      ] Compare X Immediate
    CPY #$C4                ; [C0 C4      ] Compare Y Immediate
    BRK                     ; [00 E4      ] Software interrupt
    CPX #$18                ; [E0 18      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 0C      ] Software interrupt
    BRK                     ; [00 14      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    PHP                     ; [08         ] Push Processor Status
    AND $601F,Y             ; [39 1F 60   ] AND A with Absolute,Y
    AND $DF7FCF,X           ; [3F CF 7F DF] AND A with Absolute Long,X
    AND ($00),Y             ; [31 00      ] AND A with (DP),Y
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    TSB $0C                 ; [04 0C      ] Test and Set Bits in DP
    ORA $003F00,X           ; [1F 00 3F 00] OR A with Absolute Long,X
    ADC $1F310E,X           ; [7F 0E 31 1F] Add with Carry Absolute Long,X
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 7C      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    STY $9C68               ; [8C 68 9C   ] Store Y to Absolute
    TYA                     ; [98         ] Transfer Y to A
    BIT $3C38,X             ; [3C 38 3C   ] Test Bits Absolute,X
    SED                     ; [F8         ] Set Decimal Flag
    TSB $5CF8               ; [0C F8 5C   ] Test and Set Bits Absolute
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 78      ] Software interrupt
    BPL $49DF               ; [10 E8      ] Branch if Plus
    BVS $49C1               ; [70 C8      ] Branch if Overflow Set
    BEQ $49C3               ; [F0 C8      ] Branch if Equal
    BMI $49F5               ; [30 F8      ] Branch if Minus
    BRK                     ; [00 60      ] Software interrupt
    BRA $49BE               ; [80 BD      ] Branch Always
    BRK                     ; [00 96      ] Software interrupt
    TSB $94                 ; [04 94      ] Test and Set Bits in DP
    ASL $94                 ; [06 94      ] Shift Left DP
    ASL $D0                 ; [06 D0      ] Shift Left DP
    RTI                     ; [40         ] Return from Interrupt
    ADC $7630,Y             ; [79 30 76   ] Add with Carry Absolute,Y
    AND $0D2F,Y             ; [39 2F 0D   ] AND A with Absolute,Y
    RTI                     ; [40         ] Return from Interrupt
    ORA ($48,S),Y           ; [13 48      ] OR A with (SR),Y
    AND ($08,X)             ; [21 08      ] AND A with (DP,X)
    ADC ($68,X)             ; [61 68      ] Add with Carry (DP,X)
    ADC ($2E,X)             ; [61 2E      ] Add with Carry (DP,X)
    ADC ($06,X)             ; [61 06      ] Add with Carry (DP,X)
    BMI $4A26               ; [30 09      ] Branch if Minus
    AND $1D10,Y             ; [39 10 1D   ] AND A with Absolute,Y
    CPX $C0                 ; [E4 C0      ] Compare X with DP
    CPX $40                 ; [E4 40      ] Compare X with DP
    CPX $40                 ; [E4 40      ] Compare X with DP
    PEA $7450               ; [F4 50 74   ] Push Effective Absolute
    BMI $4A1F               ; [30 F4      ] Branch if Minus
    BVS $4A15               ; [70 E8      ] Branch if Overflow Set
    RTS                     ; [60         ] Return from Subroutine
    PEI ($C8)               ; [D4 C8      ] Push Effective Indirect
    CLD                     ; [D8         ] Clear Decimal Flag
    BRA $4A83               ; [80 50      ] Branch Always
    PHP                     ; [08         ] Push Processor Status
    CLI                     ; [58         ] Clear Interrupt Disable
    CLI                     ; [58         ] Clear Interrupt Disable
    PHA                     ; [48         ] Push Accumulator
    CLI                     ; [58         ] Clear Interrupt Disable
    PHP                     ; [08         ] Push Processor Status
    CLV                     ; [B8         ] Clear Overflow Flag
    PHP                     ; [08         ] Push Processor Status
    SEI                     ; [78         ] Set Interrupt Disable
    BPL $4AAE               ; [10 70      ] Branch if Plus
    PLP                     ; [28         ] Pull Processor Status
    CPX #$5B                ; [E0 5B      ] Compare X Immediate
    AND $5F2D5F             ; [2F 5F 2D 5F] AND A with Absolute Long
    AND $132C               ; [2D 2C 13   ] AND A with Absolute
    BIT $1E10,X             ; [3C 10 1E   ] Test Bits Absolute,X
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA $000702             ; [0F 02 07 00] OR A with Absolute Long
    ROL $0F                 ; [26 0F      ] Rotate Left DP
    JSR $200D               ; [20 0D 20   ] Jump to Subroutine
    ORA $0417               ; [0D 17 04   ] OR A with Absolute
    ORA ($03,S),Y           ; [13 03      ] OR A with (SR),Y
    ORA #$03                ; [09 03      ] OR A with Immediate
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    LDY $88,X               ; [B4 88      ] Load Y from DP,X
    PEI ($C8)               ; [D4 C8      ] Push Effective Indirect
    LDY $FC88,X             ; [BC 88 FC   ] Load Y from Absolute,X
    DEY                     ; [88         ] Decrement Y
    JMP ($F818)             ; [6C 18 F8   ] Jump Indirect
    BMI $4A65               ; [30 F8      ] Branch if Minus
    JSR $00F0               ; [20 F0 00   ] Jump to Subroutine
    PHA                     ; [48         ] Push Accumulator
    CPY #$28                ; [C0 28      ] Compare Y Immediate
    CPX #$48                ; [E0 48      ] Compare X Immediate
    CPY #$88                ; [C0 88      ] Compare Y Immediate
    BRK                     ; [00 98      ] Software interrupt
    BRA $4AAB               ; [80 30      ] Branch Always
    BRK                     ; [00 20      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $144A84 (SNES $D44A84) ---
org $D44A84

    BRK                     ; [00 00      ] Software interrupt
    ROR $6700,X             ; [7E 00 67   ] Rotate Right Absolute,X
    ROL $0323,X             ; [3E 23 03   ] Rotate Left Absolute,X
    ROL $101F,X             ; [3E 1F 10   ] Rotate Left Absolute,X
    db $0F                      ; Incomplete/data bytes

;--- Patch at file offset $144A96 (SNES $D44A96) ---
org $D44A96

    BRK                     ; [00 00      ] Software interrupt
    ROL $1F02,X             ; [3E 02 1F   ] Rotate Left Absolute,X
    TRB $1807               ; [1C 07 18   ] Test and Reset Bits Absolute
    ORA $000000             ; [0F 00 00 00] OR A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 34      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    JMP ($EC38)             ; [6C 38 EC   ] Jump Indirect
    CLC                     ; [18         ] Clear Carry Flag
    INC $0EFC,X             ; [FE FC 0E   ] Increment Absolute,X
    JSR ($F866,X)           ; [FC 66 F8   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 30      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BPL $4AC2               ; [10 08      ] Branch if Plus
    BEQ $4AC8               ; [F0 0C      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    TSB $F8                 ; [04 F8      ] Test and Set Bits in DP
    RTS                     ; [60         ] Return from Subroutine
    AND ($1F),Y             ; [31 1F      ] AND A with (DP),Y
    ADC [$3F]               ; [67 3F      ] Add with Carry [DP]
    ADC $006524,X           ; [7F 24 65 00] Add with Carry Absolute Long,X
    BIT $00                 ; [24 00      ] Test Bits DP
    ROL $04                 ; [26 04      ] Rotate Left DP
    AND $0D1E1C,X           ; [3F 1C 1E 0D] AND A with Absolute Long,X
    ORA $033F00,X           ; [1F 00 3F 03] OR A with Absolute Long,X
    BIT $01                 ; [24 01      ] Test Bits DP
    BPL $4AE2               ; [10 0A      ] Branch if Plus
    ORA $1902,Y             ; [19 02 19   ] OR A with Absolute,Y
    TRB $1C00               ; [1C 00 1C   ] Test and Reset Bits Absolute
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    STA ($9C)               ; [92 9C      ] Store A to (DP)
    STA $02070A             ; [8F 0A 07 02] Store A to Absolute Long
    STZ $2900,X             ; [9E 00 29   ] Store Zero to Absolute,X

;--- Patch at file offset $144AF0 (SNES $D44AF0) ---
org $D44AF0

    STZ $6AF0               ; [9C F0 6A   ] Store Zero to Absolute
    TYA                     ; [98         ] Transfer Y to A
    SEP #$18                ; [E2 18      ] Set Processor Status Bits
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 C2      ] Software interrupt

;--- Patch at file offset $144B00 (SNES $D44B00) ---
org $D44B00

    ROL $2F13               ; [2E 13 2F   ] Rotate Left Absolute
    ORA ($5F,S),Y           ; [13 5F      ] OR A with (SR),Y
    AND $5D                 ; [25 5D      ] AND A with Direct Page
    JSL $3D1B78             ; [22 78 1B 3D] Jump to Subroutine Long
    TSB $041F               ; [0C 1F 04   ] Test and Set Bits Absolute
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    ORA ($03),Y             ; [11 03      ] OR A with (DP),Y
    BPL $4B17               ; [10 03      ] Branch if Plus
    JSR $2205               ; [20 05 22   ] Jump to Subroutine
    BRK                     ; [00 07      ] Software interrupt
    TRB $0E02               ; [1C 02 0E   ] Test and Reset Bits Absolute
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    INC $F5EC               ; [EE EC F5   ] Increment Absolute
    ADC ($E5)               ; [72 E5      ] Add with Carry (DP)
    JSL $FB86AF             ; [22 AF 86 FB] Jump to Subroutine Long
    LSR $DE,X               ; [56 DE      ] Shift Right DP,X
    JMP $D8FC               ; [4C FC D8   ] Jump Absolute
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 90      ] Software interrupt
    JSR ($780A,X)           ; [FC 0A 78   ] Jump to Subroutine Indirect,X
    INC                     ; [1A         ] Increment Accumulator
    SEC                     ; [38         ] Set Carry Flag
    LSR $D4,X               ; [56 D4      ] Shift Right DP,X
    ASL $42,X               ; [16 42      ] Shift Left DP,X
    BIT $9860               ; [2C 60 98   ] Test Bits Absolute
    PHA                     ; [48         ] Push Accumulator
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 1C      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BIT $3708               ; [2C 08 37   ] Test Bits Absolute
    TRB $37                 ; [14 37      ] Test and Reset Bits DP
    ORA [$38],Y             ; [17 38      ] OR A with [DP],Y
    ORA $000F37,X           ; [1F 37 0F 00] OR A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    BPL $4B65               ; [10 0C      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    ORA $100F18             ; [0F 18 0F 10] OR A with Absolute Long
    ORA $000002             ; [0F 02 00 00] OR A with Absolute Long
    BMI $4B64               ; [30 00      ] Branch if Minus
    SEI                     ; [78         ] Set Interrupt Disable
    BMI $4AFF               ; [30 98      ] Branch if Minus
    BVC $4B85               ; [50 1C      ] Branch if Overflow Clear
    TYA                     ; [98         ] Transfer Y to A
    BIT $3C38,X             ; [3C 38 3C   ] Test Bits Absolute,X
    SED                     ; [F8         ] Set Decimal Flag
    TSB $00F8               ; [0C F8 00   ] Test and Set Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    JSR $60F8               ; [20 F8 60   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    BEQ $4B45               ; [F0 C8      ] Branch if Equal
    BMI $4B77               ; [30 F8      ] Branch if Minus
    BRK                     ; [00 25      ] Software interrupt
    ORA $3848,X             ; [1D 48 38   ] OR A with Absolute,X
    SEI                     ; [78         ] Set Interrupt Disable
    BMI $4C03               ; [30 7C      ] Branch if Minus
    BMI $4C01               ; [30 78      ] Branch if Minus
    JSR $0029               ; [20 29 00   ] Jump to Subroutine
    BIT $00                 ; [24 00      ] Test Bits DP
    ROL $00                 ; [26 00      ] Rotate Left DP
    ORA $3F07,X             ; [1D 07 3F   ] OR A with Absolute,X
    PHP                     ; [08         ] Push Processor Status
    AND [$10],Y             ; [37 10      ] AND A with [DP],Y
    AND ($10,S),Y           ; [33 10      ] AND A with (SR),Y
    JSL $041205             ; [22 05 12 04] Jump to Subroutine Long
    ORA ($0A),Y             ; [11 0A      ] OR A with (DP),Y
    ORA ($08),Y             ; [11 08      ] OR A with (DP),Y
    CPY $26F8               ; [CC F8 26   ] Compare Y with Absolute
    BIT $1C76,X             ; [3C 76 1C   ] Test Bits Absolute,X
    LDX $1C,Y               ; [B6 1C      ] Load X from DP,Y
    BIT $7C18               ; [2C 18 7C   ] Test Bits Absolute
    SEC                     ; [38         ] Set Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BVS $4C1B               ; [70 6C      ] Branch if Overflow Set
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    INY                     ; [C8         ] Increment Y
    BIT $1CE0,X             ; [3C E0 1C   ] Test Bits Absolute,X
    BCC $4BD3               ; [90 1C      ] Branch if Carry Clear
    MVN $18,$C0             ; [54 18 C0   ] Block Move Negative
    SEC                     ; [38         ] Set Carry Flag
    DEY                     ; [88         ] Decrement Y
    BVS $4BBE               ; [70 00      ] Branch if Overflow Set
    CLC                     ; [18         ] Clear Carry Flag
    DEY                     ; [88         ] Decrement Y
    AND $1D                 ; [25 1D      ] AND A with Direct Page
    PHA                     ; [48         ] Push Accumulator
    SEC                     ; [38         ] Set Carry Flag
    SEI                     ; [78         ] Set Interrupt Disable
    BMI $4C43               ; [30 7C      ] Branch if Minus
    BMI $4C41               ; [30 78      ] Branch if Minus
    JSR $0029               ; [20 29 00   ] Jump to Subroutine
    BIT $00                 ; [24 00      ] Test Bits DP
    ROL $00                 ; [26 00      ] Rotate Left DP
    ORA $3F07,X             ; [1D 07 3F   ] OR A with Absolute,X
    PHP                     ; [08         ] Push Processor Status
    AND [$10],Y             ; [37 10      ] AND A with [DP],Y
    AND ($10,S),Y           ; [33 10      ] AND A with (SR),Y
    JSL $041205             ; [22 05 12 04] Jump to Subroutine Long
    ORA ($0A),Y             ; [11 0A      ] OR A with (DP),Y
    ORA ($08),Y             ; [11 08      ] OR A with (DP),Y
    CPY $26F8               ; [CC F8 26   ] Compare Y with Absolute
    BIT $1C76,X             ; [3C 76 1C   ] Test Bits Absolute,X
    LDX $1C,Y               ; [B6 1C      ] Load X from DP,Y
    BIT $7C18               ; [2C 18 7C   ] Test Bits Absolute
    SEC                     ; [38         ] Set Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BVS $4C5B               ; [70 6C      ] Branch if Overflow Set
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    INY                     ; [C8         ] Increment Y
    BIT $1CE0,X             ; [3C E0 1C   ] Test Bits Absolute,X
    BCC $4C13               ; [90 1C      ] Branch if Carry Clear
    MVN $18,$C0             ; [54 18 C0   ] Block Move Negative
    SEC                     ; [38         ] Set Carry Flag
    DEY                     ; [88         ] Decrement Y
    BVS $4BFE               ; [70 00      ] Branch if Overflow Set
    CLC                     ; [18         ] Clear Carry Flag
    DEY                     ; [88         ] Decrement Y
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA [$01]               ; [07 01      ] OR A with [DP]
    ASL $1E07               ; [0E 07 1E   ] Shift Left Absolute
    ORA ($21,X)             ; [01 21      ] OR A with (DP,X)
    BRK                     ; [00 40      ] Software interrupt
    BRK                     ; [00 5C      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    ORA [$1F]               ; [07 1F      ] OR A with [DP]
    ORA $3F3F3F,X           ; [1F 3F 3F 3F] OR A with Absolute Long,X
    AND $E00000,X           ; [3F 00 00 E0] AND A with Absolute Long,X
    BRK                     ; [00 38      ] Software interrupt
    CPX #$0C                ; [E0 0C      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    STY $F8                 ; [84 F8      ] Store Y to DP
    ASL $FC                 ; [06 FC      ] Shift Left DP
    STZ $5A74,X             ; [9E 74 5A   ] Store Zero to Absolute,X
    BIT $00,X               ; [34 00      ] Test Bits DP,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
    PLA                     ; [68         ] Pull Accumulator
    JSR ($F400,X)           ; [FC 00 F4   ] Jump to Subroutine Indirect,X
    LDY #$F4                ; [A0 F4      ] Load Y Immediate
    CPY #$5E                ; [C0 5E      ] Compare Y Immediate
    BRK                     ; [00 3D      ] Software interrupt
    BRK                     ; [00 17      ] Software interrupt
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $21                 ; [06 21      ] Shift Left DP
    BRK                     ; [00 3A      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 21      ] Software interrupt
    AND ($00,X)             ; [21 00      ] AND A with (DP,X)
    ORA ($08)               ; [12 08      ] OR A with (DP)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($1E,X)             ; [01 1E      ] OR A with (DP,X)
    BPL $4C72               ; [10 15      ] Branch if Plus
    ORA ($0B),Y             ; [11 0B      ] OR A with (DP),Y
    PHD                     ; [0B         ] Push Direct Page Register
    ROL $9634,X             ; [3E 34 96   ] Rotate Left Absolute,X
    TSB $0CDE               ; [0C DE 0C   ] Test and Set Bits Absolute
    JSR ($7000,X)           ; [FC 00 70   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 B8      ] Software interrupt
    BRK                     ; [00 78      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BVS $4C65               ; [70 F4      ] Branch if Overflow Set
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
    JSR ($7C70,X)           ; [FC 70 7C   ] Jump to Subroutine Indirect,X
    BMI $4C28               ; [30 B0      ] Branch if Minus
    BRK                     ; [00 80      ] Software interrupt
    BVS $4CEC               ; [70 70      ] Branch if Overflow Set
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    BMI $4CCA               ; [30 49      ] Branch if Minus
    COP #$4B                ; [02 4B      ] Coprocessor interrupt
    BRK                     ; [00 3F      ] Software interrupt
    ORA ($18,S),Y           ; [13 18      ] OR A with (SR),Y
    ORA [$0C]               ; [07 0C      ] OR A with [DP]
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA $04,S               ; [03 04      ] OR A with Stack Relative
    COP #$07                ; [02 07      ] Coprocessor interrupt
    BRK                     ; [00 36      ] Software interrupt
    ASL $26                 ; [06 26      ] Shift Left DP
    ASL $03,X               ; [16 03      ] Shift Left DP,X
    BPL $4C9E               ; [10 07      ] Branch if Plus
    COP #$07                ; [02 07      ] Coprocessor interrupt
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 3C      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    BIT $F838,X             ; [3C 38 F8   ] Test Bits Absolute,X
    BMI $4D17               ; [30 70      ] Branch if Minus
    CPY #$60                ; [C0 60      ] Compare Y Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRA $4C6D               ; [80 C0      ] Branch Always
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    INX                     ; [E8         ] Increment X
    CLC                     ; [18         ] Clear Carry Flag
    BMI $4CE6               ; [30 30      ] Branch if Minus
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $4CBC               ; [80 00      ] Branch Always
    BRA $4C3E               ; [80 80      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ASL $1E03               ; [0E 03 1E   ] Shift Left Absolute
    ORA $39091E             ; [0F 1E 09 39] OR A with Absolute Long
    BRK                     ; [00 60      ] Software interrupt
    BRK                     ; [00 4E      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA ($0F,X)             ; [01 0F      ] OR A with (DP,X)
    ORA ($0F,X)             ; [01 0F      ] OR A with (DP,X)
    ORA [$1F]               ; [07 1F      ] OR A with [DP]
    ORA $3F3F3F,X           ; [1F 3F 3F 3F] OR A with Absolute Long,X
    AND $C00000,X           ; [3F 00 00 C0] AND A with Absolute Long,X
    BRK                     ; [00 30      ] Software interrupt
    CPY #$08                ; [C0 08      ] Compare Y Immediate
    BEQ $4C95               ; [F0 AC      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    STY $68,X               ; [94 68      ] Store Y to DP,X
    LSR $2C,X               ; [56 2C      ] Shift Right DP,X
    ROL $0014,X             ; [3E 14 00   ] Rotate Left Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRA $4CE7               ; [80 F0      ] Branch Always
    BNE $4CF1               ; [D0 F8      ] Branch if Not Equal
    BRK                     ; [00 E8      ] Software interrupt
    BRA $4CE9               ; [80 EC      ] Branch Always
    CPX #$F4                ; [E0 F4      ] Compare X Immediate
    CPX #$5F                ; [E0 5F      ] Compare X Immediate
    BRK                     ; [00 7D      ] Software interrupt
    BRK                     ; [00 34      ] Software interrupt
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $1C                 ; [06 1C      ] Shift Left DP
    BRK                     ; [00 33      ] Software interrupt
    BRK                     ; [00 32      ] Software interrupt
    BMI $4D8D               ; [30 7E      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    AND $2039,Y             ; [39 39 20   ] AND A with Absolute,Y
    JSL $080108             ; [22 08 01 08] Jump to Subroutine Long
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    BRK                     ; [00 3D      ] Software interrupt
    AND ($0B,X)             ; [21 0B      ] AND A with (DP,X)
    AND ($3E,S),Y           ; [33 3E      ] AND A with (SR),Y
    TRB $FE                 ; [14 FE      ] Test and Reset Bits DP
    TSB $FC                 ; [04 FC      ] Test and Set Bits in DP
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 B8      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ROR $F41C,X             ; [7E 1C F4   ] Rotate Right Absolute,X
    CPX #$30                ; [E0 30      ] Compare X Immediate
    BIT $30,X               ; [34 30      ] Test Bits DP,X
    BCS $4D47               ; [B0 10      ] Branch if Carry Set
    BCC $4D39               ; [90 00      ] Branch if Carry Clear
    BRA $4DAB               ; [80 70      ] Branch Always
    BVS $4D05               ; [70 C8      ] Branch if Overflow Set
    INY                     ; [C8         ] Increment Y
    CPY $DC                 ; [C4 DC      ] Compare Y with DP
    ROR $7D38,X             ; [7E 38 7D   ] Rotate Right Absolute,X
    BMI $4D84               ; [30 3F      ] Branch if Minus
    ORA [$30]               ; [07 30      ] OR A with [DP]
    ORA $5F1F22,X           ; [1F 22 1F 5F] OR A with Absolute Long,X
    AND $002D               ; [2D 2D 00   ] AND A with Absolute
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 03      ] Software interrupt
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    AND [$37]               ; [27 37      ] AND A with [DP]
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $001F00,X           ; [1F 00 1F 00] OR A with Absolute Long,X
    AND $1820               ; [2D 20 18   ] AND A with Absolute
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    INC $FE3C,X             ; [FE 3C FE   ] Increment Absolute,X
    LDY $C0E4,X             ; [BC E4 C0   ] Load Y from Absolute,X
    STZ $C0                 ; [64 C0      ] Store Zero to DP
    SEC                     ; [38         ] Set Carry Flag
    CPX #$E8                ; [E0 E8      ] Compare X Immediate
    BNE $4DDD               ; [D0 70      ] Branch if Not Equal
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 84      ] Software interrupt
    LDY $2498,X             ; [BC 98 24   ] Load Y from Absolute,X
    CLD                     ; [D8         ] Clear Decimal Flag
    BRK                     ; [00 D0      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BNE $4D8C               ; [D0 10      ] Branch if Not Equal
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    EOR #$02                ; [49 02      ] XOR A with Immediate
    PHK                     ; [4B         ] Push Program Bank
    BRK                     ; [00 3F      ] Software interrupt
    ORA ($10,S),Y           ; [13 10      ] OR A with (SR),Y
    ORA $270F3A             ; [0F 3A 0F 27] OR A with Absolute Long
    ORA [$1F],Y             ; [17 1F      ] OR A with [DP],Y
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 36      ] Software interrupt
    ASL $26                 ; [06 26      ] Shift Left DP
    ASL $03,X               ; [16 03      ] Shift Left DP,X
    BPL $4DA6               ; [10 0F      ] Branch if Plus
    COP #$0F                ; [02 0F      ] Coprocessor interrupt
    BRK                     ; [00 1F      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BIT $3C38,X             ; [3C 38 3C   ] Test Bits Absolute,X
    SEC                     ; [38         ] Set Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BMI $4E17               ; [30 70      ] Branch if Minus
    CPY #$70                ; [C0 70      ] Compare Y Immediate
    CPX #$F0                ; [E0 F0      ] Compare X Immediate
    BRA $4DCD               ; [80 20      ] Branch Always
    BRA $4D6F               ; [80 C0      ] Branch Always
    BRK                     ; [00 E0      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    INX                     ; [E8         ] Increment X
    CLC                     ; [18         ] Clear Carry Flag
    BMI $4DE6               ; [30 30      ] Branch if Minus
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CPX #$60                ; [E0 60      ] Compare X Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate

;--- Patch at file offset $144DC6 (SNES $D44DC6) ---
org $D44DC6

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $0F1007             ; [0F 07 10 0F] OR A with Absolute Long
    AND [$1D],Y             ; [37 1D      ] AND A with [DP],Y

;--- Patch at file offset $144DD8 (SNES $D44DD8) ---
org $D44DD8

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    db $0F, $08, $1D            ; Incomplete/data bytes

;--- Patch at file offset $144DE6 (SNES $D44DE6) ---
org $D44DE6

    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BMI $4DAC               ; [30 C0      ] Branch if Minus
    CLC                     ; [18         ] Clear Carry Flag
    BEQ $4DF7               ; [F0 08      ] Branch if Equal
    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $144DF8 (SNES $D44DF8) ---
org $D44DF8

    BRK                     ; [00 00      ] Software interrupt
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BEQ $4DDE               ; [F0 E0      ] Branch if Equal
    BEQ $4DE0               ; [F0 E0      ] Branch if Equal
    db $2F, $1B                 ; Incomplete/data bytes

;--- Patch at file offset $144E0A (SNES $D44E0A) ---
org $D44E0A

    BVS $4E0C               ; [70 00      ] Branch if Overflow Set
    ADC $3500,X             ; [7D 00 35   ] Add with Carry Absolute,X
    ORA $001B               ; [0D 1B 00   ] OR A with Absolute

;--- Patch at file offset $144E1A (SNES $D44E1A) ---
org $D44E1A

    AND [$28]               ; [27 28      ] AND A with [DP]
    JSL $000220             ; [22 20 02 00] Jump to Subroutine Long
    JMP $6EF8               ; [4C F8 6E   ] Jump Absolute
    TRB $1C36               ; [1C 36 1C   ] Test and Reset Bits Absolute
    ASL $CE0C,X             ; [1E 0C CE   ] Shift Left Absolute,X
    TSB $6E                 ; [04 6E      ] Test and Set Bits in DP
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BRA $4E29               ; [80 F8      ] Branch Always
    BCS $4E2F               ; [B0 FC      ] Branch if Carry Set
    BEQ $4E31               ; [F0 FC      ] Branch if Equal
    CPX #$FC                ; [E0 FC      ] Compare X Immediate
    BEQ $4EB5               ; [F0 7C      ] Branch if Equal
    SEI                     ; [78         ] Set Interrupt Disable
    SEC                     ; [38         ] Set Carry Flag
    CLV                     ; [B8         ] Clear Overflow Flag
    TRB $085C               ; [1C 5C 08   ] Test and Reset Bits Absolute
    PLA                     ; [68         ] Pull Accumulator
    ORA $0D,X               ; [15 0D      ] OR A with DP,X

;--- Patch at file offset $144E4A (SNES $D44E4A) ---
org $D44E4A

    EOR $1B,X               ; [55 1B      ] XOR A with DP,X
    ADC $7F18,X             ; [7D 18 7F   ] Add with Carry Absolute,X
    BRK                     ; [00 02      ] Software interrupt

;--- Patch at file offset $144E60 (SNES $D44E60) ---
org $D44E60

    BIT $5C80,X             ; [3C 80 5C   ] Test Bits Absolute,X
    BRK                     ; [00 9C      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    TRB $DC3E               ; [1C 3E DC   ] Test and Reset Bits Absolute
    ROR $C4DC,X             ; [7E DC C4   ] Rotate Right Absolute,X
    BRA $4E6D               ; [80 FE      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    SEC                     ; [38         ] Set Carry Flag
    CLV                     ; [B8         ] Clear Overflow Flag
    RTS                     ; [60         ] Return from Subroutine
    RTS                     ; [60         ] Return from Subroutine
    TRB $1C                 ; [14 1C      ] Test and Reset Bits DP
    CPY #$1C                ; [C0 1C      ] Compare Y Immediate
    CLD                     ; [D8         ] Clear Decimal Flag
    TSB $B0                 ; [04 B0      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    LSR $3D00,X             ; [5E 00 3D   ] Shift Right Absolute,X
    BRK                     ; [00 17      ] Software interrupt
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $11                 ; [06 11      ] Shift Left DP
    BRK                     ; [00 2A      ] Software interrupt
    BRK                     ; [00 34      ] Software interrupt
    BRK                     ; [00 21      ] Software interrupt
    AND ($00,X)             ; [21 00      ] AND A with (DP,X)
    ORA ($08)               ; [12 08      ] OR A with (DP)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 15      ] Software interrupt
    ORA ($1B),Y             ; [11 1B      ] OR A with (DP),Y
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    ORA $0B02,Y             ; [19 02 0B   ] OR A with Absolute,Y
    BRK                     ; [00 0F      ] Software interrupt
    ORA $10,S               ; [03 10      ] OR A with Stack Relative
    ORA $270F1A             ; [0F 1A 0F 27] OR A with Absolute Long
    ORA [$1F],Y             ; [17 1F      ] OR A with [DP],Y
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ASL $0606               ; [0E 06 06   ] Shift Left Absolute
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA $000F02             ; [0F 02 0F 00] OR A with Absolute Long
    ORA $040418,X           ; [1F 18 04 04] OR A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    LSR $3D00,X             ; [5E 00 3D   ] Shift Right Absolute,X
    BRK                     ; [00 17      ] Software interrupt
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $11                 ; [06 11      ] Shift Left DP
    BRK                     ; [00 2B      ] Software interrupt
    ORA ($1F,X)             ; [01 1F      ] OR A with (DP,X)
    ORA ($21,X)             ; [01 21      ] OR A with (DP,X)
    AND ($00,X)             ; [21 00      ] AND A with (DP,X)
    ORA ($08)               ; [12 08      ] OR A with (DP)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 14      ] Software interrupt
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    ORA ($3E,X)             ; [01 3E      ] OR A with (DP,X)
    BIT $96,X               ; [34 96      ] Test Bits DP,X
    TSB $0CDE               ; [0C DE 0C   ] Test and Set Bits Absolute
    JSR ($F000,X)           ; [FC 00 F0   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 D8      ] Software interrupt
    BRA $4EE7               ; [80 F8      ] Branch Always
    CPY #$F4                ; [C0 F4      ] Compare Y Immediate
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
    JSR ($7C70,X)           ; [FC 70 7C   ] Jump to Subroutine Indirect,X
    BMI $4EA8               ; [30 B0      ] Branch if Minus
    BRK                     ; [00 00      ] Software interrupt
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    BMI $4EAE               ; [30 B0      ] Branch if Minus
    BVC $4ED0               ; [50 D0      ] Branch if Overflow Clear
    ORA ($03,S),Y           ; [13 03      ] OR A with (SR),Y
    ORA ($03,S),Y           ; [13 03      ] OR A with (SR),Y
    ORA $0E1101             ; [0F 01 11 0E] OR A with Absolute Long
    INC                     ; [1A         ] Increment Accumulator
    ORA $1F1727             ; [0F 27 17 1F] OR A with Absolute Long
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    BRK                     ; [00 0E      ] Software interrupt
    COP #$0F                ; [02 0F      ] Coprocessor interrupt
    BRK                     ; [00 1F      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRA $4F05               ; [80 E0      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPY #$70                ; [C0 70      ] Compare Y Immediate
    CPX #$F0                ; [E0 F0      ] Compare X Immediate
    BRA $4F4D               ; [80 20      ] Branch Always
    BRA $4EEF               ; [80 C0      ] Branch Always
    BRK                     ; [00 40      ] Software interrupt
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    BRA $4F75               ; [80 40      ] Branch Always
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    SEC                     ; [38         ] Set Carry Flag
    CPX #$0C                ; [E0 0C      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    STY $F8                 ; [84 F8      ] Store Y to DP
    ASL $FC                 ; [06 FC      ] Shift Left DP
    STZ $5A74,X             ; [9E 74 5A   ] Store Zero to Absolute,X
    BIT $00,X               ; [34 00      ] Test Bits DP,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
    PLA                     ; [68         ] Pull Accumulator
    JSR ($F400,X)           ; [FC 00 F4   ] Jump to Subroutine Indirect,X
    LDY #$F4                ; [A0 F4      ] Load Y Immediate
    CPY #$3E                ; [C0 3E      ] Compare Y Immediate
    BIT $9E,X               ; [34 9E      ] Test Bits DP,X
    BRK                     ; [00 E6      ] Software interrupt
    BRK                     ; [00 E4      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BMI $4F63               ; [30 F8      ] Branch if Minus
    BVS $4F69               ; [70 FC      ] Branch if Overflow Set
    SEI                     ; [78         ] Set Interrupt Disable
    JSR ($F4F8,X)           ; [FC F8 F4   ] Jump to Subroutine Indirect,X
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    CPX #$58                ; [E0 58      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    CLC                     ; [18         ] Clear Carry Flag
    BRA $4FA9               ; [80 30      ] Branch Always
    BRA $4FEB               ; [80 70      ] Branch Always
    BVS $4F85               ; [70 08      ] Branch if Overflow Set
    SEI                     ; [78         ] Set Interrupt Disable
    PHP                     ; [08         ] Push Processor Status
    SED                     ; [F8         ] Set Decimal Flag
    EOR #$02                ; [49 02      ] XOR A with Immediate
    PHK                     ; [4B         ] Push Program Bank
    ORA ($3E,X)             ; [01 3E      ] OR A with (DP,X)
    ORA ($10,S),Y           ; [13 10      ] OR A with (SR),Y
    ORA $270F3A             ; [0F 3A 0F 27] OR A with Absolute Long
    ORA [$1F],Y             ; [17 1F      ] OR A with [DP],Y
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 36      ] Software interrupt
    ASL $27                 ; [06 27      ] Shift Left DP
    ASL $03,X               ; [16 03      ] Shift Left DP,X
    BPL $4FA6               ; [10 0F      ] Branch if Plus
    COP #$0F                ; [02 0F      ] Coprocessor interrupt
    BRK                     ; [00 1F      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    BEQ $4F93               ; [F0 F0      ] Branch if Equal
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    CPY #$60                ; [C0 60      ] Compare Y Immediate
    CPY #$70                ; [C0 70      ] Compare Y Immediate
    CPX #$F0                ; [E0 F0      ] Compare X Immediate
    BRA $4FCD               ; [80 20      ] Branch Always
    BRA $4F6F               ; [80 C0      ] Branch Always
    BRK                     ; [00 10      ] Software interrupt
    BEQ $4F93               ; [F0 E0      ] Branch if Equal
    RTS                     ; [60         ] Return from Subroutine
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CPX #$60                ; [E0 60      ] Compare X Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA [$01]               ; [07 01      ] OR A with [DP]
    ASL $1E07               ; [0E 07 1E   ] Shift Left Absolute
    ORA ($21,X)             ; [01 21      ] OR A with (DP,X)
    BRK                     ; [00 40      ] Software interrupt
    BRK                     ; [00 5C      ] Software interrupt
    BRK                     ; [00 5E      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    ORA [$1F]               ; [07 1F      ] OR A with [DP]
    ORA $3F3F3F,X           ; [1F 3F 3F 3F] OR A with Absolute Long,X
    AND $F02121,X           ; [3F 21 21 F0] AND A with Absolute Long,X
    BRK                     ; [00 1C      ] Software interrupt
    BEQ $4FF1               ; [F0 0C      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    STX $FC                 ; [86 FC      ] Store X to DP
    ASL $FC                 ; [06 FC      ] Shift Left DP
    TXS                     ; [9A         ] Transfer X to Stack Pointer
    STZ $5E,X               ; [74 5E      ] Store Zero to DP,X
    BIT $3E,X               ; [34 3E      ] Test Bits DP,X
    BIT $00,X               ; [34 00      ] Test Bits DP,X
    BRK                     ; [00 F0      ] Software interrupt
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
    CPY #$FC                ; [C0 FC      ] Compare Y Immediate
    PLA                     ; [68         ] Pull Accumulator
    JSR ($F400,X)           ; [FC 00 F4   ] Jump to Subroutine Indirect,X
    LDY #$F4                ; [A0 F4      ] Load Y Immediate
    CPY #$F4                ; [C0 F4      ] Compare Y Immediate
    CPY #$3D                ; [C0 3D      ] Compare Y Immediate
    BRK                     ; [00 57      ] Software interrupt
    TSB $54                 ; [04 54      ] Test and Set Bits in DP
    ASL $74                 ; [06 74      ] Shift Left DP
    ROL $71                 ; [26 71      ] Rotate Left DP
    JSR $2073               ; [20 73 20   ] Jump to Subroutine
    AND $1910,Y             ; [39 10 19   ] AND A with Absolute,Y
    COP #$00                ; [02 00      ] Coprocessor interrupt
    ORA ($28)               ; [12 28      ] OR A with (DP)
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    JSR $282C               ; [20 2C 28   ] Jump to Subroutine
    ASL $071E,X             ; [1E 1E 07   ] Shift Left Absolute,X
    ORA [$BE]               ; [07 BE      ] OR A with [DP]
    TSB $CC                 ; [04 CC      ] Test and Set Bits in DP
    BRK                     ; [00 C8      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BVS $5021               ; [70 F8      ] Branch if Overflow Set
    BEQ $5023               ; [F0 F8      ] Branch if Equal
    BEQ $5025               ; [F0 F8      ] Branch if Equal
    BEQ $501F               ; [F0 F0      ] Branch if Equal
    RTS                     ; [60         ] Return from Subroutine
    CPY #$C4                ; [C0 C4      ] Compare Y Immediate
    JSR $2010               ; [20 10 20   ] Jump to Subroutine
    BPL $50A7               ; [10 70      ] Branch if Plus
    RTI                     ; [40         ] Return from Interrupt
    BPL $502A               ; [10 F0      ] Branch if Plus
    BPL $502C               ; [10 F0      ] Branch if Plus
    BCC $502E               ; [90 F0      ] Branch if Carry Clear
    LDY #$E0                ; [A0 E0      ] Load Y Immediate
    PHD                     ; [0B         ] Push Direct Page Register
    BRK                     ; [00 0F      ] Software interrupt
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    ORA [$0C]               ; [07 0C      ] OR A with [DP]
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    BRK                     ; [00 04      ] Software interrupt
    COP #$07                ; [02 07      ] Coprocessor interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$03]               ; [07 03      ] OR A with [DP]
    BRK                     ; [00 07      ] Software interrupt
    COP #$07                ; [02 07      ] Coprocessor interrupt
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 E0      ] Software interrupt
    BRA $5043               ; [80 E0      ] Branch Always
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRA $502B               ; [80 C0      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRA $507D               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 19      ] Software interrupt
    ORA [$32]               ; [07 32      ] OR A with [DP]
    ORA $6F1D2E,X           ; [1F 2E 1D 6F] OR A with Absolute Long,X
    BMI $50E5               ; [30 58      ] Branch if Minus
    BMI $5102               ; [30 73      ] Branch if Minus
    JSR $0000               ; [20 00 00   ] Jump to Subroutine
    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $001D08,X           ; [1F 08 1D 00] OR A with Absolute Long,X
    AND ($03,S),Y           ; [33 03      ] AND A with (SR),Y
    AND [$07],Y             ; [37 07      ] AND A with [DP],Y
    AND $00000F             ; [2F 0F 00 00] AND A with Absolute Long
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CLC                     ; [18         ] Clear Carry Flag
    CPX #$0C                ; [E0 0C      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    TSB $C6F8               ; [0C F8 C6   ] Test and Set Bits Absolute
    BIT $0C36,X             ; [3C 36 0C   ] Test Bits Absolute,X
    STX $0004               ; [8E 04 00   ] Store X to Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BVS $50B1               ; [70 F8      ] Branch if Overflow Set
    BNE $50B7               ; [D0 FC      ] Branch if Not Equal
    CPY #$FC                ; [C0 FC      ] Compare Y Immediate
    SED                     ; [F8         ] Set Decimal Flag
    JSR ($C7F8,X)           ; [FC F8 C7   ] Jump to Subroutine Indirect,X
    RTS                     ; [60         ] Return from Subroutine
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 48      ] Software interrupt
    BRK                     ; [00 4B      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    JSR ($FB70,X)           ; [FC 70 FB   ] Jump to Subroutine Indirect,X
    BVS $5148               ; [70 79      ] Branch if Overflow Set
    BMI $5109               ; [30 38      ] Branch if Minus
    SEI                     ; [78         ] Set Interrupt Disable
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA [$20],Y             ; [17 20      ] OR A with [DP],Y
    BIT $00,X               ; [34 00      ] Test Bits DP,X
    ADC [$40]               ; [67 40      ] Add with Carry [DP]
    ORA ($71)               ; [12 71      ] OR A with (DP)
    TSB $74                 ; [04 74      ] Test and Set Bits in DP
    ORA [$37]               ; [07 37      ] OR A with [DP]
    CPY $7E00               ; [CC 00 7E   ] Compare Y with Absolute
    BRK                     ; [00 66      ] Software interrupt
    BRK                     ; [00 64      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BIT $3CFE,X             ; [3C FE 3C   ] Test Bits Absolute,X
    INC $7C3C,X             ; [FE 3C 7C   ] Increment Absolute,X
    SEC                     ; [38         ] Set Carry Flag
    SEC                     ; [38         ] Set Carry Flag
    SEC                     ; [38         ] Set Carry Flag
    TSB $C4                 ; [04 C4      ] Test and Set Bits in DP
    BPL $50BE               ; [10 C8      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    CPY #$1C                ; [C0 1C      ] Compare Y Immediate
    LDY $04                 ; [A4 04      ] Load Y from DP
    BIT $BC84,X             ; [3C 84 BC   ] Test Bits Absolute,X
    LDY #$B8                ; [A0 B8      ] Load Y Immediate
    BIT $1D00,X             ; [3C 00 1D   ] Test Bits Absolute,X
    PHP                     ; [08         ] Push Processor Status
    AND [$1D]               ; [27 1D      ] AND A with [DP]
    AND [$1C]               ; [27 1C      ] AND A with [DP]
    AND $001F18,X           ; [3F 18 1F 00] AND A with Absolute Long,X
    AND [$10]               ; [27 10      ] AND A with [DP]
    TRB $0700               ; [1C 00 07   ] Test and Reset Bits Absolute
    ORA [$0B]               ; [07 0B      ] OR A with [DP]
    ORA $1D,S               ; [03 1D      ] OR A with Stack Relative
    BRK                     ; [00 1C      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt

;--- Patch at file offset $145120 (SNES $D45120) ---
org $D45120

    SEI                     ; [78         ] Set Interrupt Disable
    JSR $F0F8               ; [20 F8 F0   ] Jump to Subroutine
    TYA                     ; [98         ] Transfer Y to A
    BVS $516F               ; [70 48      ] Branch if Overflow Set
    BCS $5171               ; [B0 48      ] Branch if Carry Set
    BMI $5123               ; [30 F8      ] Branch if Minus
    BPL $511D               ; [10 F0      ] Branch if Plus
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    CPY #$F0                ; [C0 F0      ] Compare Y Immediate
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 B0      ] Software interrupt
    BRA $50E9               ; [80 B0      ] Branch Always
    BRA $510B               ; [80 D0      ] Branch Always
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA [$1E]               ; [07 1E      ] OR A with [DP]
    ORA ($21,X)             ; [01 21      ] OR A with (DP,X)
    BRK                     ; [00 40      ] Software interrupt
    BRK                     ; [00 5C      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    ORA [$1F]               ; [07 1F      ] OR A with [DP]
    ORA $3F3F3F,X           ; [1F 3F 3F 3F] OR A with Absolute Long,X
    AND $E00000,X           ; [3F 00 00 E0] AND A with Absolute Long,X
    BRK                     ; [00 38      ] Software interrupt
    CPX #$0C                ; [E0 0C      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    STY $F8                 ; [84 F8      ] Store Y to DP
    ASL $FC                 ; [06 FC      ] Shift Left DP
    STZ $5A74,X             ; [9E 74 5A   ] Store Zero to Absolute,X
    BIT $00,X               ; [34 00      ] Test Bits DP,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
    PLA                     ; [68         ] Pull Accumulator
    JSR ($F400,X)           ; [FC 00 F4   ] Jump to Subroutine Indirect,X
    LDY #$F4                ; [A0 F4      ] Load Y Immediate
    CPY #$5E                ; [C0 5E      ] Compare Y Immediate
    BRK                     ; [00 39      ] Software interrupt
    BRK                     ; [00 12      ] Software interrupt
    BRK                     ; [00 14      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 3B      ] Software interrupt
    BRK                     ; [00 7D      ] Software interrupt
    BRK                     ; [00 79      ] Software interrupt
    BMI $51B2               ; [30 21      ] Branch if Minus
    AND ($06,X)             ; [21 06      ] AND A with (DP,X)
    PHP                     ; [08         ] Push Processor Status
    TSB $0A01               ; [0C 01 0A   ] Test and Set Bits Absolute
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    ORA $04,S               ; [03 04      ] OR A with Stack Relative
    BRK                     ; [00 12      ] Software interrupt
    BPL $51A3               ; [10 04      ] Branch if Plus
    AND ($3E)               ; [32 3E      ] AND A with (DP)
    BIT $96,X               ; [34 96      ] Test Bits DP,X
    TSB $0CDE               ; [0C DE 0C   ] Test and Set Bits Absolute
    JSR ($F000,X)           ; [FC 00 F0   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ROR $F43C,X             ; [7E 3C F4   ] Rotate Right Absolute,X
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
    JSR ($7C70,X)           ; [FC 70 7C   ] Jump to Subroutine Indirect,X
    BMI $5168               ; [30 B0      ] Branch if Minus
    BRK                     ; [00 80      ] Software interrupt
    BVS $522C               ; [70 70      ] Branch if Overflow Set
    CPY #$C8                ; [C0 C8      ] Compare Y Immediate
    LDY #$9C                ; [A0 9C      ] Load Y Immediate
    LSR $3900,X             ; [5E 00 39   ] Shift Right Absolute,X
    BRK                     ; [00 12      ] Software interrupt
    BRK                     ; [00 14      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 3B      ] Software interrupt
    BRK                     ; [00 7D      ] Software interrupt
    BRK                     ; [00 79      ] Software interrupt
    BMI $51F2               ; [30 21      ] Branch if Minus
    AND ($06,X)             ; [21 06      ] AND A with (DP,X)
    PHP                     ; [08         ] Push Processor Status
    TSB $0A01               ; [0C 01 0A   ] Test and Set Bits Absolute
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    ORA $04,S               ; [03 04      ] OR A with Stack Relative
    BRK                     ; [00 12      ] Software interrupt
    BPL $51E3               ; [10 04      ] Branch if Plus
    AND ($3E)               ; [32 3E      ] AND A with (DP)
    BIT $96,X               ; [34 96      ] Test Bits DP,X
    TSB $0CDE               ; [0C DE 0C   ] Test and Set Bits Absolute
    JSR ($F000,X)           ; [FC 00 F0   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ROR $F43C,X             ; [7E 3C F4   ] Rotate Right Absolute,X
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
    JSR ($7C70,X)           ; [FC 70 7C   ] Jump to Subroutine Indirect,X
    BMI $51A8               ; [30 B0      ] Branch if Minus
    BRK                     ; [00 80      ] Software interrupt
    BVS $526C               ; [70 70      ] Branch if Overflow Set
    CPY #$C8                ; [C0 C8      ] Compare Y Immediate
    LDY #$9C                ; [A0 9C      ] Load Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $205810             ; [2F 10 58 20] AND A with Absolute Long

;--- Patch at file offset $145216 (SNES $D45216) ---
org $D45216

    BRK                     ; [00 00      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA [$18]               ; [07 18      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA [$16],Y             ; [17 16      ] OR A with [DP],Y
    AND #$00                ; [29 00      ] AND A with Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 90      ] Software interrupt
    BRK                     ; [00 E8      ] Software interrupt
    JSR $00FC               ; [20 FC 00   ] Jump to Subroutine
    INC $2E10,X             ; [FE 10 2E   ] Increment Absolute,X
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BPL $51EA               ; [10 B0      ] Branch if Plus
    BCC $528C               ; [90 50      ] Branch if Carry Clear
    CPY $10                 ; [C4 10      ] Compare Y with DP
    TRB $D0                 ; [14 D0      ] Test and Reset Bits DP
    CLI                     ; [58         ] Clear Interrupt Disable
    PLP                     ; [28         ] Pull Processor Status
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $16                 ; [04 16      ] Test and Set Bits in DP
    ASL $16                 ; [06 16      ] Shift Left DP
    ASL $0F10               ; [0E 10 0F   ] Shift Left Absolute
    PHP                     ; [08         ] Push Processor Status
    ORA [$3F]               ; [07 3F      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA $100338             ; [0F 38 03 10] OR A with Absolute Long
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    PHD                     ; [0B         ] Push Direct Page Register
    ORA $07070F             ; [0F 0F 07 07] OR A with Absolute Long
    BRK                     ; [00 08      ] Software interrupt
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRA $523B               ; [80 CE      ] Branch Always
    BVS $5253               ; [70 E4      ] Branch if Overflow Set
    TYA                     ; [98         ] Transfer Y to A
    MVP $A8,$68             ; [44 A8 68   ] Block Move Positive
    BRA $527D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $52D5               ; [90 5C      ] Branch if Carry Clear
    BRA $5207               ; [80 8C      ] Branch Always
    BRA $52AD               ; [80 30      ] Branch Always
    MVP $18,$80             ; [44 18 80   ] Block Move Positive
    ADC $004F07             ; [6F 07 4F 00] Add with Carry Absolute Long
    AND $08,X               ; [35 08      ] AND A with DP,X
    ORA $08,X               ; [15 08      ] OR A with DP,X
    ASL $08,X               ; [16 08      ] Shift Left DP,X
    ASL $0C,X               ; [16 0C      ] Shift Left DP,X
    ASL $0704               ; [0E 04 07   ] Shift Left Absolute
    BRK                     ; [00 32      ] Software interrupt
    AND [$20]               ; [27 20      ] AND A with [DP]
    BPL $52A0               ; [10 0B      ] Branch if Plus
    PHD                     ; [0B         ] Push Direct Page Register
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA #$08                ; [09 08      ] OR A with Immediate
    ORA $050D               ; [0D 0D 05   ] OR A with Absolute
    ORA $00                 ; [05 00      ] OR A with Direct Page
    BRK                     ; [00 A6      ] Software interrupt
    TRB $0C96               ; [1C 96 0C   ] Test and Reset Bits Absolute
    JSR ($DC00,X)           ; [FC 00 DC   ] Jump to Subroutine Indirect,X
    SEC                     ; [38         ] Set Carry Flag
    MVN $38,$D4             ; [54 38 D4   ] Block Move Negative
    SEC                     ; [38         ] Set Carry Flag
    PHX                     ; [DA         ] Push X Register
    BIT $00DE,X             ; [3C DE 00   ] Test Bits Absolute,X
    JMP ($5C3C,X)           ; [7C 3C 5C   ] Jump Indirect,X
    BIT $8080,X             ; [3C 80 80   ] Test Bits Absolute,X
    BMI $52F0               ; [30 38      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    BCS $5273               ; [B0 B8      ] Branch if Carry Set
    BCS $5279               ; [B0 BC      ] Branch if Carry Set
    CLV                     ; [B8         ] Clear Overflow Flag

;--- Patch at file offset $1452C4 (SNES $D452C4) ---
org $D452C4

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $205810             ; [2F 10 58 20] AND A with Absolute Long

;--- Patch at file offset $1452D6 (SNES $D452D6) ---
org $D452D6

    BRK                     ; [00 00      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA [$18]               ; [07 18      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA [$16],Y             ; [17 16      ] OR A with [DP],Y
    AND #$00                ; [29 00      ] AND A with Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 90      ] Software interrupt
    BRK                     ; [00 E8      ] Software interrupt
    JSR $00FC               ; [20 FC 00   ] Jump to Subroutine
    INC $2E10,X             ; [FE 10 2E   ] Increment Absolute,X
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BPL $52AA               ; [10 B0      ] Branch if Plus
    BCC $534C               ; [90 50      ] Branch if Carry Clear
    CPY $10                 ; [C4 10      ] Compare Y with DP
    TRB $D0                 ; [14 D0      ] Test and Reset Bits DP
    BVC $5322               ; [50 20      ] Branch if Overflow Clear
    DEC                     ; [3A         ] Decrement Accumulator
    PHP                     ; [08         ] Push Processor Status
    ASL $1602,X             ; [1E 02 16   ] Shift Left Absolute,X
    ASL $16                 ; [06 16      ] Shift Left DP
    ASL $0718               ; [0E 18 07   ] Shift Left Absolute
    BIT $03                 ; [24 03      ] Test Bits DP
    ADC [$00]               ; [67 00      ] Add with Carry [DP]
    ORA [$38]               ; [07 38      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA $0300,X             ; [1D 00 03   ] OR A with Absolute,X
    PHP                     ; [08         ] Push Processor Status
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    PHD                     ; [0B         ] Push Direct Page Register
    ORA [$07]               ; [07 07      ] OR A with [DP]
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    ORA $30,S               ; [03 30      ] OR A with Stack Relative
    PLP                     ; [28         ] Pull Processor Status
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 5E      ] Software interrupt
    LDY #$E4                ; [A0 E4      ] Load Y Immediate
    SEI                     ; [78         ] Set Interrupt Disable
    PEA $44B8               ; [F4 B8 44   ] Push Effective Absolute
    TAY                     ; [A8         ] Transfer A to Y
    PLA                     ; [68         ] Pull Accumulator
    BRA $533D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $5385               ; [90 4C      ] Branch if Carry Clear
    BCC $52DF               ; [90 A4      ] Branch if Carry Clear
    BRA $5355               ; [80 18      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    PLP                     ; [28         ] Pull Processor Status
    BCS $53A0               ; [B0 5F      ] Branch if Carry Set
    AND [$27]               ; [27 27      ] AND A with [DP]
    CLC                     ; [18         ] Clear Carry Flag
    AND $2D00,X             ; [3D 00 2D   ] AND A with Absolute,X
    BPL $539C               ; [10 53      ] Branch if Plus
    JSR $2053               ; [20 53 20   ] Jump to Subroutine
    ADC [$01]               ; [67 01      ] Add with Carry [DP]
    ADC $3200,X             ; [7D 00 32   ] Add with Carry Absolute,X
    AND [$18],Y             ; [37 18      ] AND A with [DP],Y
    CLC                     ; [18         ] Clear Carry Flag
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    ORA ($13,S),Y           ; [13 13      ] OR A with (SR),Y
    BIT $2A20               ; [2C 20 2A   ] Test Bits Absolute
    ROL $1D1D               ; [2E 1D 1D   ] Rotate Left Absolute
    BRK                     ; [00 00      ] Software interrupt
    SBC ($9C)               ; [F2 9C      ] Subtract with Borrow (DP)
    PHX                     ; [DA         ] Push X Register
    TSB $04CA               ; [0C CA 04   ] Test and Set Bits Absolute
    PLY                     ; [7A         ] Pull Y Register
    TSB $1C3A               ; [0C 3A 1C   ] Test and Set Bits Absolute
    TSX                     ; [BA         ] Transfer Stack Pointer to X
    TSB $04BA               ; [0C BA 04   ] Test and Set Bits Absolute
    STZ $00,X               ; [74 00      ] Store Zero to DP,X
    BIT $3CB0,X             ; [3C B0 3C   ] Test Bits Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    BIT $10                 ; [24 10      ] Test Bits DP
    STY $9C08               ; [8C 08 9C   ] Store Y to Absolute
    CLI                     ; [58         ] Clear Interrupt Disable
    JMP ($6468)             ; [6C 68 64   ] Jump Indirect
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 00      ] Software interrupt
    ADC $004F07             ; [6F 07 4F 00] Add with Carry Absolute Long
    AND $0A00,X             ; [3D 00 0A   ] AND A with Absolute,X
    BRK                     ; [00 11      ] Software interrupt
    BRK                     ; [00 2B      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    ORA ($05,X)             ; [01 05      ] OR A with (DP,X)
    BRK                     ; [00 32      ] Software interrupt
    AND [$20]               ; [27 20      ] AND A with [DP]
    BPL $5398               ; [10 03      ] Branch if Plus
    ORA $05,S               ; [03 05      ] OR A with Stack Relative
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ASL $1E1E               ; [0E 1E 1E   ] Shift Left Absolute
    ORA $05                 ; [05 05      ] OR A with Direct Page
    BRK                     ; [00 00      ] Software interrupt
    LDX $1C                 ; [A6 1C      ] Load X from DP
    STX $0C,Y               ; [96 0C      ] Store X to DP,Y
    JSR ($3C00,X)           ; [FC 00 3C   ] Jump to Subroutine Indirect,X
    CLC                     ; [18         ] Clear Carry Flag
    STZ $18,X               ; [74 18      ] Store Zero to DP,X
    BIT $08,X               ; [34 08      ] Test Bits DP,X
    PLX                     ; [FA         ] Pull X Register
    TRB $00DE               ; [1C DE 00   ] Test and Reset Bits Absolute
    JMP ($5C3C,X)           ; [7C 3C 5C   ] Jump Indirect,X
    BIT $4040,X             ; [3C 40 40   ] Test Bits Absolute,X
    BVC $5390               ; [50 D8      ] Branch if Overflow Clear
    TYA                     ; [98         ] Transfer Y to A
    BPL $53A3               ; [10 E8      ] Branch if Plus
    RTS                     ; [60         ] Return from Subroutine
    db $5C, $58                 ; Incomplete/data bytes

;--- Patch at file offset $1453C8 (SNES $D453C8) ---
org $D453C8

    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    ORA [$00]               ; [07 00      ] OR A with [DP]

;--- Patch at file offset $1453DA (SNES $D453DA) ---
org $D453DA

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $1453E8 (SNES $D453E8) ---
org $D453E8

    BRK                     ; [00 00      ] Software interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    BRK                     ; [00 24      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    PHX                     ; [DA         ] Push X Register
    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $1453FA (SNES $D453FA) ---
org $D453FA

    BRK                     ; [00 00      ] Software interrupt
    CPY #$D8                ; [C0 D8      ] Compare Y Immediate
    PLA                     ; [68         ] Pull Accumulator
    STZ $19                 ; [64 19      ] Store Zero to DP
    ASL $2F                 ; [06 2F      ] Shift Left DP
    BPL $5464               ; [10 5F      ] Branch if Plus
    JSR $2050               ; [20 50 20   ] Jump to Subroutine
    ADC ($02)               ; [72 02      ] Add with Carry (DP)
    AND $00,X               ; [35 00      ] AND A with DP,X
    ORA $1500,X             ; [1D 00 15   ] OR A with Absolute,X
    ORA $0601               ; [0D 01 06   ] OR A with Absolute
    ORA $2F1010             ; [0F 10 10 2F] OR A with Absolute Long
    ORA [$38]               ; [07 38      ] OR A with [DP]
    AND $180212             ; [2F 12 02 18] AND A with Absolute Long
    COP #$00                ; [02 00      ] Coprocessor interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    SBC $807F20             ; [EF 20 7F 80] Subtract with Borrow Absolute Long
    STA $007E60,X           ; [9F 60 7E 00] Store A to Absolute Long,X
    ROR $3E00,X             ; [7E 00 3E   ] Rotate Right Absolute,X
    BRK                     ; [00 BF      ] Software interrupt
    BRK                     ; [00 BF      ] Software interrupt
    BRA $53C5               ; [80 94      ] Branch Always
    AND ($6C)               ; [32 6C      ] AND A with (DP)
    BRL $364A               ; [82 14 E2   ] Branch Long

;--- Patch at file offset $14543D (SNES $D4543D) ---
org $D4543D

    ADC ($04)               ; [72 04      ] Add with Carry (DP)
    SEP #$35                ; [E2 35      ] Set Processor Status Bits
    ORA $682F50             ; [0F 50 2F 68] OR A with Absolute Long
    AND [$7F],Y             ; [37 7F      ] AND A with [DP],Y
    PLP                     ; [28         ] Pull Processor Status
    EOR $205727,X           ; [5F 27 57 20] XOR A with Absolute Long,X
    EOR ($20)               ; [52 20      ] XOR A with (DP)
    AND $020200,X           ; [3F 00 02 02] AND A with Absolute Long,X
    AND $27170F             ; [2F 0F 17 27] AND A with Absolute Long
    BRK                     ; [00 28      ] Software interrupt
    JSL $082007             ; [22 07 20 08] Jump to Subroutine Long
    AND $0001               ; [2D 01 00   ] AND A with Absolute
    BRK                     ; [00 97      ] Software interrupt
    DEY                     ; [88         ] Decrement Y
    PER $AF01               ; [62 9C 5A   ] Push Effective Relative
    CPX $54EE               ; [EC EE 54   ] Compare X with Absolute
    SBC $BD9E,X             ; [FD 9E BD   ] Subtract with Borrow Absolute,X
    ASL $9F,X               ; [16 9F      ] Shift Left DP,X
    COP #$FE                ; [02 FE      ] Coprocessor interrupt
    BRK                     ; [00 28      ] Software interrupt
    REP #$9C                ; [C2 9C      ] Reset Processor Status Bits
    BRA $5419               ; [80 A4      ] Branch Always
    INY                     ; [C8         ] Increment Y
    BPL $54CC               ; [10 54      ] Branch if Plus
    DEC                     ; [3A         ] Decrement Accumulator
    LDY $3472,X             ; [BC 72 34   ] Load Y from Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    JSL $580000             ; [22 00 00 58] Jump to Subroutine Long
    PLP                     ; [28         ] Pull Processor Status
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $16                 ; [04 16      ] Test and Set Bits in DP
    ASL $16                 ; [06 16      ] Shift Left DP
    ASL $0F10               ; [0E 10 0F   ] Shift Left Absolute
    PHP                     ; [08         ] Push Processor Status
    ORA [$1F]               ; [07 1F      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA $100338             ; [0F 38 03 10] OR A with Absolute Long
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    PHD                     ; [0B         ] Push Direct Page Register
    ORA $07070F             ; [0F 0F 07 07] OR A with Absolute Long
    BRK                     ; [00 08      ] Software interrupt
    ORA $000707             ; [0F 07 07 00] OR A with Absolute Long
    ORA $00                 ; [05 00      ] OR A with Direct Page
    ASL                     ; [0A         ] Shift Left Accumulator
    BRK                     ; [00 11      ] Software interrupt
    BRK                     ; [00 29      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    ORA ($05,X)             ; [01 05      ] OR A with (DP,X)
    BRK                     ; [00 02      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    BRK                     ; [00 03      ] Software interrupt
    ORA $05,S               ; [03 05      ] OR A with Stack Relative
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ASL $1E1E               ; [0E 1E 1E   ] Shift Left Absolute
    ORA $05                 ; [05 05      ] OR A with Direct Page
    BRK                     ; [00 00      ] Software interrupt
    CLI                     ; [58         ] Clear Interrupt Disable
    PLP                     ; [28         ] Pull Processor Status
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $16                 ; [04 16      ] Test and Set Bits in DP
    ASL $16                 ; [06 16      ] Shift Left DP
    ASL $0F10               ; [0E 10 0F   ] Shift Left Absolute
    ORA #$06                ; [09 06      ] OR A with Immediate
    ASL $0F01,X             ; [1E 01 0F   ] Shift Left Absolute,X
    SEC                     ; [38         ] Set Carry Flag
    ORA $10,S               ; [03 10      ] OR A with Stack Relative
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    PHD                     ; [0B         ] Push Direct Page Register
    ORA $06060F             ; [0F 0F 06 06] OR A with Absolute Long
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 9E      ] Software interrupt
    CPX #$CC                ; [E0 CC      ] Compare X Immediate
    BVS $5535               ; [70 44      ] Branch if Overflow Set
    TAY                     ; [A8         ] Transfer A to Y
    PLA                     ; [68         ] Pull Accumulator
    BRA $54FD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $5555               ; [90 5C      ] Branch if Carry Clear
    BRA $5507               ; [80 0C      ] Branch Always
    BPL $555D               ; [10 60      ] Branch if Plus
    STY $4030               ; [8C 30 40   ] Store Y to Absolute
    ORA ($01)               ; [12 01      ] OR A with (DP)
    ASL $01,X               ; [16 01      ] Shift Left DP,X
    ORA $000A00             ; [0F 00 0A 00] OR A with Absolute Long
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    AND #$00                ; [29 00      ] AND A with Immediate
    ORA $000400,X           ; [1F 00 04 00] OR A with Absolute Long,X
    ORA $070F03             ; [0F 03 0F 07] OR A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    ORA $01                 ; [05 01      ] OR A with Direct Page
    PHP                     ; [08         ] Push Processor Status
    ASL $1E1E               ; [0E 1E 1E   ] Shift Left Absolute
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    JMP ($E8B0)             ; [6C B0 E8   ] Jump Indirect
    BMI $5519               ; [30 F4      ] Branch if Minus
    CLC                     ; [18         ] Clear Carry Flag
    BIT $7A18,X             ; [3C 18 7A   ] Test Bits Absolute,X
    TSB $043E               ; [0C 3E 04   ] Test and Set Bits Absolute
    SBC $CE06,Y             ; [F9 06 CE   ] Subtract with Borrow Absolute,Y
    BRK                     ; [00 90      ] Software interrupt
    LDY #$10                ; [A0 10      ] Load Y Immediate
    JSR $5048               ; [20 48 50   ] Jump to Subroutine
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    STY $08                 ; [84 08      ] Store Y to DP
    CPX #$64                ; [E0 64      ] Compare X Immediate
    LSR $40                 ; [46 40      ] Shift Right DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BCC $5548               ; [90 00      ] Branch if Carry Clear
    INX                     ; [E8         ] Increment X
    JSR $00EC               ; [20 EC 00   ] Jump to Subroutine
    INC $2E10,X             ; [FE 10 2E   ] Increment Absolute,X
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BPL $550A               ; [10 B0      ] Branch if Plus
    BCC $55AC               ; [90 50      ] Branch if Carry Clear
    CPY $10                 ; [C4 10      ] Compare Y with DP
    TRB $D0                 ; [14 D0      ] Test and Reset Bits DP
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 E4      ] Software interrupt
    BRK                     ; [00 A4      ] Software interrupt
    BRK                     ; [00 26      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRA $550B               ; [80 9E      ] Branch Always
    BVS $552B               ; [70 BC      ] Branch if Overflow Set
    CPX #$44                ; [E0 44      ] Compare X Immediate
    TAY                     ; [A8         ] Transfer A to Y
    RTI                     ; [40         ] Return from Interrupt
    BRA $558D               ; [80 18      ] Branch Always
    CPY #$58                ; [C0 58      ] Compare Y Immediate
    BRA $55D9               ; [80 60      ] Branch Always
    CLV                     ; [B8         ] Clear Overflow Flag
    LDY $B0,X               ; [B4 B0      ] Load Y from DP,X
    BVS $55F2               ; [70 74      ] Branch if Overflow Set
    RTS                     ; [60         ] Return from Subroutine
    INX                     ; [E8         ] Increment X
    ADC $004F07             ; [6F 07 4F 00] Add with Carry Absolute Long
    AND $0A00,X             ; [3D 00 0A   ] AND A with Absolute,X
    BRK                     ; [00 11      ] Software interrupt
    BRK                     ; [00 29      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    ORA ($05,X)             ; [01 05      ] OR A with (DP,X)
    BRK                     ; [00 32      ] Software interrupt
    AND [$20]               ; [27 20      ] AND A with [DP]
    BPL $5598               ; [10 03      ] Branch if Plus
    ORA $05,S               ; [03 05      ] OR A with Stack Relative
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ASL $1E1E               ; [0E 1E 1E   ] Shift Left Absolute
    ORA $05                 ; [05 05      ] OR A with Direct Page
    BRK                     ; [00 00      ] Software interrupt
    INX                     ; [E8         ] Increment X
    BVC $559B               ; [50 F8      ] Branch if Overflow Clear
    BMI $559D               ; [30 F8      ] Branch if Minus
    BPL $55E3               ; [10 3C      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    JMP ($3618,X)           ; [7C 18 36   ] Jump Indirect,X
    TSB $04FE               ; [0C FE 04   ] Test and Set Bits Absolute
    CPX $00                 ; [E4 00      ] Compare X with DP
    BVC $55F2               ; [50 40      ] Branch if Overflow Clear
    LDY #$B0                ; [A0 B0      ] Load Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    BVC $5607               ; [50 50      ] Branch if Overflow Clear
    CLD                     ; [D8         ] Clear Decimal Flag
    BCC $55D2               ; [90 18      ] Branch if Carry Clear
    INX                     ; [E8         ] Increment X
    STZ $40                 ; [64 40      ] Store Zero to DP
    db $44                      ; Incomplete/data bytes

;--- Patch at file offset $1455C4 (SNES $D455C4) ---
org $D455C4

    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $205810             ; [2F 10 58 20] AND A with Absolute Long
    CLI                     ; [58         ] Clear Interrupt Disable
    PLP                     ; [28         ] Pull Processor Status

;--- Patch at file offset $1455D6 (SNES $D455D6) ---
org $D455D6

    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA [$18]               ; [07 18      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA [$16],Y             ; [17 16      ] OR A with [DP],Y
    AND #$0F                ; [29 0F      ] AND A with Immediate
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BCC $55E6               ; [90 00      ] Branch if Carry Clear
    INX                     ; [E8         ] Increment X
    JSR $00FC               ; [20 FC 00   ] Jump to Subroutine
    INC $2E10,X             ; [FE 10 2E   ] Increment Absolute,X
    CPY #$FE                ; [C0 FE      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BPL $55A8               ; [10 B0      ] Branch if Plus
    BCC $564A               ; [90 50      ] Branch if Carry Clear
    CPY $10                 ; [C4 10      ] Compare Y with DP
    TRB $D0                 ; [14 D0      ] Test and Reset Bits DP
    MVP $A8,$3C             ; [44 A8 3C   ] Block Move Positive
    BRK                     ; [00 36      ] Software interrupt
    TSB $56                 ; [04 56      ] Test and Set Bits in DP
    ASL $56                 ; [06 56      ] Shift Left DP
    ASL $0F70               ; [0E 70 0F   ] Shift Left Absolute
    CLI                     ; [58         ] Clear Interrupt Disable
    AND [$3F]               ; [27 3F      ] AND A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA $100307,X           ; [1F 07 03 10] OR A with Absolute Long,X
    PHP                     ; [08         ] Push Processor Status
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    PLD                     ; [2B         ] Pull Direct Page Register
    AND $27272F             ; [2F 2F 27 27] AND A with Absolute Long
    BRK                     ; [00 08      ] Software interrupt
    COP #$07                ; [02 07      ] Coprocessor interrupt
    JSR ($CE00,X)           ; [FC 00 CE   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 5E      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    LDX $B460,Y             ; [BE 60 B4   ] Load X from Absolute,Y
    RTS                     ; [60         ] Return from Subroutine
    INX                     ; [E8         ] Increment X
    BVC $5671               ; [50 40      ] Branch if Overflow Clear
    BRA $5657               ; [80 24      ] Branch Always
    BCC $5659               ; [90 24      ] Branch if Carry Clear
    BCC $56AB               ; [90 74      ] Branch if Carry Clear
    BNE $56A5               ; [D0 6C      ] Branch if Not Equal
    RTS                     ; [60         ] Return from Subroutine
    RTS                     ; [60         ] Return from Subroutine
    STZ $60                 ; [64 60      ] Store Zero to DP
    RTS                     ; [60         ] Return from Subroutine
    BNE $5600               ; [D0 C0      ] Branch if Not Equal
    ORA [$08],Y             ; [17 08      ] OR A with [DP],Y
    TRB $08                 ; [14 08      ] Test and Reset Bits DP
    ORA $08,X               ; [15 08      ] OR A with DP,X
    ASL $08,X               ; [16 08      ] Shift Left DP,X
    ASL $0C,X               ; [16 0C      ] Shift Left DP,X
    ASL $08,X               ; [16 08      ] Shift Left DP,X
    ASL                     ; [0A         ] Shift Left Accumulator
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    PHD                     ; [0B         ] Push Direct Page Register
    PHD                     ; [0B         ] Push Direct Page Register
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA #$08                ; [09 08      ] OR A with Immediate
    ORA $090C               ; [0D 0C 09   ] OR A with Absolute
    ORA #$01                ; [09 01      ] OR A with Immediate
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 E8      ] Software interrupt
    BMI $565B               ; [30 F8      ] Branch if Minus
    BMI $565D               ; [30 F8      ] Branch if Minus
    BMI $56DB               ; [30 74      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    JSR ($F638,X)           ; [FC 38 F6   ] Jump to Subroutine Indirect,X
    TSB $04CA               ; [0C CA 04   ] Test and Set Bits Absolute
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    BCC $5612               ; [90 A0      ] Branch if Carry Clear
    LDY #$B0                ; [A0 B0      ] Load Y Immediate
    JSR $2830               ; [20 30 28   ] Jump to Subroutine
    BCS $5629               ; [B0 B0      ] Branch if Carry Set
    CLV                     ; [B8         ] Clear Overflow Flag
    DEY                     ; [88         ] Decrement Y
    STY $04                 ; [84 04      ] Store Y to DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 1B      ] Software interrupt
    ORA ($2D,X)             ; [01 2D      ] OR A with (DP,X)
    BPL $56E8               ; [10 5F      ] Branch if Plus
    JSL $5D215E             ; [22 5E 21 5D] Jump to Subroutine Long
    JSL $002758             ; [22 58 27 00] Jump to Subroutine Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($0B,X)             ; [01 0B      ] OR A with (DP,X)
    ORA ($10,S),Y           ; [13 10      ] OR A with (SR),Y
    ROL                     ; [2A         ] Rotate Left Accumulator
    BPL $56C5               ; [10 29      ] Branch if Plus
    ORA ($2A),Y             ; [11 2A      ] OR A with (DP),Y
    BRK                     ; [00 37      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $56A4               ; [80 00      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    ROR $88,X               ; [76 88      ] Rotate Right DP,X
    PLX                     ; [FA         ] Pull X Register
    TSB $CF                 ; [04 CF      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRA $56B7               ; [80 00      ] Branch Always
    BRK                     ; [00 20      ] Software interrupt
    BVC $572B               ; [50 70      ] Branch if Overflow Clear
    STY $34C8               ; [8C C8 34   ] Store Y to Absolute
    LDY $5A                 ; [A4 5A      ] Load Y from DP
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    TSB $3F                 ; [04 3F      ] Test and Set Bits in DP
    BRK                     ; [00 79      ] Software interrupt
    BRK                     ; [00 79      ] Software interrupt
    BRK                     ; [00 76      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ADC [$1C]               ; [67 1C      ] Add with Carry [DP]
    AND [$1D]               ; [27 1D      ] AND A with [DP]
    ORA $140301,X           ; [1F 01 03 14] OR A with Absolute Long,X
    BRK                     ; [00 11      ] Software interrupt
    ROL $10                 ; [26 10      ] Rotate Left DP
    ROL $2C08               ; [2E 08 2C   ] Rotate Left Absolute
    ORA $1C1C               ; [0D 1C 1C   ] OR A with Absolute
    TRB $001D               ; [1C 1D 00   ] Test and Reset Bits Absolute
    ORA ($87,X)             ; [01 87      ] OR A with (DP,X)
    BRK                     ; [00 06      ] Software interrupt
    BRK                     ; [00 26      ] Software interrupt
    JSR $008C               ; [20 8C 00   ] Jump to Subroutine
    MVN $00,$04             ; [54 00 04   ] Block Move Negative
    SED                     ; [F8         ] Set Decimal Flag
    TXA                     ; [8A         ] Transfer X to A
    STZ $FD,X               ; [74 FD      ] Store Zero to DP,X
    STX $CC32               ; [8E 32 CC   ] Store X to Absolute
    BEQ $5700               ; [F0 0C      ] Branch if Equal
    BEQ $571E               ; [F0 28      ] Branch if Equal
    BVS $56F8               ; [70 00      ] Branch if Overflow Set
    LDY #$08                ; [A0 08      ] Load Y Immediate
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    STZ $70,X               ; [74 70      ] Store Zero to DP,X
    COP #$8C                ; [02 8C      ] Coprocessor interrupt
    AND ($00),Y             ; [31 00      ] AND A with (DP),Y
    AND ($00,X)             ; [21 00      ] AND A with (DP,X)
    DEC                     ; [3A         ] Decrement Accumulator
    BRK                     ; [00 5F      ] Software interrupt
    JSR $3C4E               ; [20 4E 3C   ] Jump to Subroutine
    EOR $6F28,X             ; [5D 28 6F   ] XOR A with Absolute,X
    TSB $0F                 ; [04 0F      ] Test and Set Bits in DP
    BRK                     ; [00 0C      ] Software interrupt
    COP #$1C                ; [02 1C      ] Coprocessor interrupt
    ORA ($19)               ; [12 19      ] OR A with (DP)
    ORA $2020,X             ; [1D 20 20   ] OR A with Absolute,X
    AND $2B3D,X             ; [3D 3D 2B   ] AND A with Absolute,X
    PLD                     ; [2B         ] Pull Direct Page Register
    ORA $05                 ; [05 05      ] OR A with Direct Page
    BRK                     ; [00 00      ] Software interrupt
    SBC $F3F2,X             ; [FD F2 F3   ] Subtract with Borrow Absolute,X
    TSB $0C97               ; [0C 97 0C   ] Test and Set Bits Absolute
    STA $7A0A,X             ; [9D 0A 7A   ] Store A to Absolute,X
    TRB $72                 ; [14 72      ] Test and Reset Bits DP
    TSB $3844               ; [0C 44 38   ] Test and Set Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 82      ] Software interrupt
    BEQ $573F               ; [F0 0C      ] Branch if Equal
    TSB $BCDC               ; [0C DC BC   ] Test and Set Bits Absolute
    PLY                     ; [7A         ] Pull Y Register
    CLC                     ; [18         ] Clear Carry Flag
    LDY $30,X               ; [B4 30      ] Load Y from DP,X
    STY $B880               ; [8C 80 B8   ] Store Y to Absolute
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $145744 (SNES $D45744) ---
org $D45744

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $205810             ; [2F 10 58 20] AND A with Absolute Long

;--- Patch at file offset $145756 (SNES $D45756) ---
org $D45756

    BRK                     ; [00 00      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA [$18]               ; [07 18      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA [$16],Y             ; [17 16      ] OR A with [DP],Y
    AND #$00                ; [29 00      ] AND A with Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 90      ] Software interrupt
    BRA $5751               ; [80 E8      ] Branch Always
    JSR $00FC               ; [20 FC 00   ] Jump to Subroutine
    INC $2E10,X             ; [FE 10 2E   ] Increment Absolute,X
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    CPX #$10                ; [E0 10      ] Compare X Immediate
    BMI $570B               ; [30 90      ] Branch if Minus
    BVC $5741               ; [50 C4      ] Branch if Overflow Clear
    BPL $5793               ; [10 14      ] Branch if Plus
    BNE $57D1               ; [D0 50      ] Branch if Not Equal
    JSR $0838               ; [20 38 08   ] Jump to Subroutine
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    ASL $00,X               ; [16 00      ] Shift Left DP,X
    BMI $578A               ; [30 00      ] Branch if Minus
    BIT $2403               ; [2C 03 24   ] Test Bits Absolute
    ORA $27,S               ; [03 27      ] OR A with Stack Relative
    BRK                     ; [00 07      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    ORA $000E18             ; [0F 18 0E 00] OR A with Absolute Long
    ORA #$00                ; [09 00      ] OR A with Immediate
    ASL $1301               ; [0E 01 13   ] Shift Left Absolute
    ORA $13,S               ; [03 13      ] OR A with Stack Relative
    PHD                     ; [0B         ] Push Direct Page Register
    BPL $57A8               ; [10 08      ] Branch if Plus
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BEQ $57A3               ; [F0 F4      ] Branch if Equal
    DEY                     ; [88         ] Decrement Y
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $57BD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $5815               ; [90 5C      ] Branch if Carry Clear
    BRA $57BF               ; [80 04      ] Branch Always
    BRK                     ; [00 30      ] Software interrupt
    CPY #$08                ; [C0 08      ] Compare Y Immediate
    BRA $5811               ; [80 50      ] Branch Always
    JSR $0838               ; [20 38 08   ] Jump to Subroutine
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    ASL $00,X               ; [16 00      ] Shift Left DP,X
    BMI $57CA               ; [30 00      ] Branch if Minus
    BIT $2403               ; [2C 03 24   ] Test Bits Absolute
    ORA $27,S               ; [03 27      ] OR A with Stack Relative
    BRK                     ; [00 07      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    ORA $000E18             ; [0F 18 0E 00] OR A with Absolute Long
    ORA #$00                ; [09 00      ] OR A with Immediate
    ASL $1301               ; [0E 01 13   ] Shift Left Absolute
    ORA $13,S               ; [03 13      ] OR A with Stack Relative
    PHD                     ; [0B         ] Push Direct Page Register
    BPL $57E8               ; [10 08      ] Branch if Plus
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BEQ $57E3               ; [F0 F4      ] Branch if Equal
    DEY                     ; [88         ] Decrement Y
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $57FD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $5855               ; [90 5C      ] Branch if Carry Clear
    BRA $57FF               ; [80 04      ] Branch Always
    BRK                     ; [00 30      ] Software interrupt
    CPY #$08                ; [C0 08      ] Compare Y Immediate
    BRA $5801               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 1D      ] Software interrupt
    ORA [$3C]               ; [07 3C      ] OR A with [DP]
    ORA $401F20,X           ; [1F 20 1F 40] OR A with Absolute Long,X
    AND $003F68,X           ; [3F 68 3F 00] AND A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 1B      ] Software interrupt
    ORA [$1F]               ; [07 1F      ] OR A with [DP]
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    AND $351F1F,X           ; [3F 1F 1F 35] AND A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $5826               ; [80 00      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    BRA $5861               ; [80 38      ] Branch Always
    CPX #$3C                ; [E0 3C      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    TSB $1AF8               ; [0C F8 1A   ] Test and Set Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $5838               ; [80 00      ] Branch Always
    CPX #$80                ; [E0 80      ] Compare X Immediate
    CLD                     ; [D8         ] Clear Decimal Flag
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BCS $5823               ; [B0 E4      ] Branch if Carry Set
    JSR ($3F6F,X)           ; [FC 6F 3F   ] Jump to Subroutine Indirect,X
    JMP ($3620,X)           ; [7C 20 36   ] Jump Indirect,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $10                 ; [06 10      ] Shift Left DP
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 3F      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BMI $5871               ; [30 1F      ] Branch if Minus
    BRK                     ; [00 23      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    BRK                     ; [00 6A      ] Software interrupt
    INX                     ; [E8         ] Increment X
    CMP ($F0)               ; [D2 F0      ] Compare A with (DP)
    PHX                     ; [DA         ] Push X Register
    CLI                     ; [58         ] Clear Interrupt Disable
    INC $64                 ; [E6 64      ] Increment DP
    JMP ($9C78,X)           ; [7C 78 9C   ] Jump Indirect,X
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BRK                     ; [00 D4      ] Software interrupt
    BIT $BC6C,X             ; [3C 6C BC   ] Test Bits Absolute,X
    BIT $FC                 ; [24 FC      ] Test Bits DP
    CLC                     ; [18         ] Clear Carry Flag
    JSR ($F800,X)           ; [FC 00 F8   ] Jump to Subroutine Indirect,X
    SEI                     ; [78         ] Set Interrupt Disable
    CPX #$60                ; [E0 60      ] Compare X Immediate
    BRA $58AF               ; [80 30      ] Branch Always
    BMI $58F7               ; [30 76      ] Branch if Minus
    AND #$78                ; [29 78      ] AND A with Immediate
    AND [$39],Y             ; [37 39      ] AND A with [DP],Y
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA $02,S               ; [03 02      ] OR A with Stack Relative
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    BRK                     ; [00 03      ] Software interrupt
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    BRK                     ; [00 2F      ] Software interrupt
    AND $073727             ; [2F 27 37 07] AND A with Absolute Long
    ASL $02                 ; [06 02      ] Shift Left DP
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    BRK                     ; [00 01      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $1458A6 (SNES $D458A6) ---
org $D458A6

    RTS                     ; [60         ] Return from Subroutine
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRA $586F               ; [80 C0      ] Branch Always
    BRK                     ; [00 68      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    PLA                     ; [68         ] Pull Accumulator
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 80      ] Software interrupt

;--- Patch at file offset $1458C2 (SNES $D458C2) ---
org $D458C2

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $3C07,X             ; [1D 07 3C   ] OR A with Absolute,X
    ORA $401F20,X           ; [1F 20 1F 40] OR A with Absolute Long,X
    AND $003F68,X           ; [3F 68 3F 00] AND A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 1B      ] Software interrupt
    ORA [$1F]               ; [07 1F      ] OR A with [DP]
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    AND $351F1F,X           ; [3F 1F 1F 35] AND A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $58E6               ; [80 00      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    BRA $5921               ; [80 38      ] Branch Always
    CPX #$3C                ; [E0 3C      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    TSB $1AF8               ; [0C F8 1A   ] Test and Set Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $58F8               ; [80 00      ] Branch Always
    CPX #$80                ; [E0 80      ] Compare X Immediate
    CLD                     ; [D8         ] Clear Decimal Flag
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BCS $58E3               ; [B0 E4      ] Branch if Carry Set
    JSR ($3F6F,X)           ; [FC 6F 3F   ] Jump to Subroutine Indirect,X
    ADC ($20)               ; [72 20      ] Add with Carry (DP)
    BIT $1402,X             ; [3C 02 14   ] Test Bits Absolute,X
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $18                 ; [06 18      ] Shift Left DP
    BRK                     ; [00 3C      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    ADC $1F3038,X           ; [7F 38 30 1F] Add with Carry Absolute Long,X
    BRK                     ; [00 2D      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($1A,X)             ; [01 1A      ] OR A with (DP,X)
    ORA $3818,Y             ; [19 18 38   ] OR A with Absolute,Y
    ROR                     ; [6A         ] Rotate Right Accumulator
    INX                     ; [E8         ] Increment X
    CMP ($F0)               ; [D2 F0      ] Compare A with (DP)
    PHX                     ; [DA         ] Push X Register
    CLI                     ; [58         ] Clear Interrupt Disable
    INC $64                 ; [E6 64      ] Increment DP
    JMP ($9878,X)           ; [7C 78 98   ] Jump Indirect,X
    BEQ $5925               ; [F0 F8      ] Branch if Equal
    CPY #$7C                ; [C0 7C      ] Compare Y Immediate
    BNE $5905               ; [D0 D4      ] Branch if Not Equal
    BIT $BC6C,X             ; [3C 6C BC   ] Test Bits Absolute,X
    BIT $FC                 ; [24 FC      ] Test Bits DP
    CLC                     ; [18         ] Clear Carry Flag
    JSR ($F800,X)           ; [FC 00 F8   ] Jump to Subroutine Indirect,X
    BVS $591C               ; [70 E0      ] Branch if Overflow Set
    RTI                     ; [40         ] Return from Interrupt
    BRA $5917               ; [80 D8      ] Branch Always
    TYA                     ; [98         ] Transfer Y to A
    INC $7861,X             ; [FE 61 78   ] Increment Absolute,X
    ORA $170F19             ; [0F 19 0F 17] OR A with Absolute Long
    ORA [$22]               ; [07 22      ] OR A with [DP]
    BRK                     ; [00 32      ] Software interrupt
    BRK                     ; [00 7D      ] Software interrupt
    BMI $5987               ; [30 38      ] Branch if Minus
    BRK                     ; [00 57      ] Software interrupt
    ADC [$0F],Y             ; [77 0F      ] Add with Carry [DP],Y
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ASL $050A               ; [0E 0A 05   ] Shift Left Absolute
    ORA $1910               ; [0D 10 19   ] OR A with Absolute
    TRB $38                 ; [14 38      ] Test and Reset Bits DP
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    JSR ($FCB0,X)           ; [FC B0 FC   ] Jump to Subroutine Indirect,X
    CLV                     ; [B8         ] Clear Overflow Flag
    SED                     ; [F8         ] Set Decimal Flag
    BCS $5997               ; [B0 30      ] Branch if Carry Set
    BRK                     ; [00 20      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    BRK                     ; [00 88      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    BCS $59AC               ; [B0 38      ] Branch if Carry Set
    BMI $5926               ; [30 B0      ] Branch if Minus
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    ROR $29,X               ; [76 29      ] Rotate Right DP,X
    SEI                     ; [78         ] Set Interrupt Disable
    AND [$3D],Y             ; [37 3D      ] AND A with [DP],Y
    ORA [$0F]               ; [07 0F      ] OR A with [DP]
    ORA [$19]               ; [07 19      ] OR A with [DP]
    BRK                     ; [00 3D      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    ASL $0C08,X             ; [1E 08 0C   ] Shift Left Absolute,X
    BRK                     ; [00 2F      ] Software interrupt
    AND $073727             ; [2F 27 37 07] AND A with Absolute Long
    COP #$01                ; [02 01      ] Coprocessor interrupt
    ASL $0C                 ; [06 0C      ] Shift Left DP
    ASL                     ; [0A         ] Shift Left Accumulator
    TRB $0C1E               ; [1C 1E 0C   ] Test and Reset Bits Absolute
    TSB $0000               ; [0C 00 00   ] Test and Set Bits Absolute
    JSR ($FC78,X)           ; [FC 78 FC   ] Jump to Subroutine Indirect,X
    BVC $599D               ; [50 F8      ] Branch if Overflow Clear
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $1459B4 (SNES $D459B4) ---
org $D459B4

    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $1459CA (SNES $D459CA) ---
org $D459CA

    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $3C07,X             ; [1D 07 3C   ] OR A with Absolute,X

;--- Patch at file offset $1459DC (SNES $D459DC) ---
org $D459DC

    ORA [$00]               ; [07 00      ] OR A with [DP]
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    db $07                      ; Incomplete/data bytes

;--- Patch at file offset $1459EA (SNES $D459EA) ---
org $D459EA

    BRA $59EC               ; [80 00      ] Branch Always
    BVS $596E               ; [70 80      ] Branch if Overflow Set
    PHA                     ; [48         ] Push Accumulator
    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $1459FC (SNES $D459FC) ---
org $D459FC

    BRA $59FE               ; [80 00      ] Branch Always
    BEQ $5980               ; [F0 80      ] Branch if Equal
    RTI                     ; [40         ] Return from Interrupt
    AND $483F68,X           ; [3F 68 3F 48] AND A with Absolute Long,X
    AND $753F6F,X           ; [3F 6F 3F 75] AND A with Absolute Long,X
    AND ($36,X)             ; [21 36      ] AND A with (DP,X)
    BRK                     ; [00 14      ] Software interrupt
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $3F                 ; [06 3F      ] Shift Left DP
    ASL $371F,X             ; [1E 1F 37   ] Shift Left Absolute,X
    AND [$3A],Y             ; [37 3A      ] AND A with [DP],Y
    AND ($1E),Y             ; [31 1E      ] AND A with (DP),Y
    PHP                     ; [08         ] Push Processor Status
    AND $08,S               ; [23 08      ] AND A with Stack Relative
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($3C,X)             ; [01 3C      ] OR A with (DP,X)
    SED                     ; [F8         ] Set Decimal Flag
    TSB $1AF8               ; [0C F8 1A   ] Test and Set Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    NOP                     ; [EA         ] No Operation
    INX                     ; [E8         ] Increment X
    CMP ($F0)               ; [D2 F0      ] Compare A with (DP)
    PHX                     ; [DA         ] Push X Register
    CLI                     ; [58         ] Clear Interrupt Disable
    INC $64                 ; [E6 64      ] Increment DP
    JMP ($D878,X)           ; [7C 78 D8   ] Jump Indirect,X
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BCS $5A19               ; [B0 E4      ] Branch if Carry Set
    JSR ($BC54,X)           ; [FC 54 BC   ] Jump to Subroutine Indirect,X
    JMP ($24BC)             ; [6C BC 24   ] Jump Indirect
    JSR ($FC18,X)           ; [FC 18 FC   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 F8      ] Software interrupt
    BPL $5A42               ; [10 00      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    TSB $1C                 ; [04 1C      ] Test and Set Bits in DP
    ORA $3F1E3F             ; [0F 3F 1E 3F] OR A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($04,X)             ; [01 04      ] OR A with (DP,X)
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 07      ] Software interrupt
    ORA $07,S               ; [03 07      ] OR A with Stack Relative
    ORA $181C1A             ; [0F 1A 1C 18] OR A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    STZ $B8F8               ; [9C F8 B8   ] Store Zero to Absolute
    BEQ $5A41               ; [F0 DC      ] Branch if Equal
    SEI                     ; [78         ] Set Interrupt Disable
    INC $F354,X             ; [FE 54 F3   ] Increment Absolute,X
    BVC $5A52               ; [50 E7      ] Branch if Overflow Clear
    DEC $F7                 ; [C6 F7      ] Decrement DP
    STY $EE                 ; [84 EE      ] Store Y to DP
    BRK                     ; [00 78      ] Software interrupt
    CPY #$70                ; [C0 70      ] Compare Y Immediate
    BRA $5A9D               ; [80 28      ] Branch Always
    BVC $5AE7               ; [50 70      ] Branch if Overflow Clear
    STZ $62                 ; [64 62      ] Store Zero to DP
    ROR $FEA6,X             ; [7E A6 FE   ] Rotate Right Absolute,X
    DEC $CE                 ; [C6 CE      ] Decrement DP
    BRK                     ; [00 00      ] Software interrupt
    ADC $207D3F             ; [6F 3F 7D 20] Add with Carry Absolute Long
    ROL $04,X               ; [36 04      ] Rotate Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BPL $5A8C               ; [10 00      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 1F      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BMI $5AB1               ; [30 1F      ] Branch if Minus
    BRK                     ; [00 23      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    BRK                     ; [00 16      ] Software interrupt
    ORA #$08                ; [09 08      ] OR A with Immediate
    ORA [$0C]               ; [07 0C      ] OR A with [DP]
    ORA [$0F]               ; [07 0F      ] OR A with [DP]
    ORA [$19]               ; [07 19      ] OR A with [DP]
    BRK                     ; [00 3D      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    ASL $0C08,X             ; [1E 08 0C   ] Shift Left Absolute,X
    BRK                     ; [00 0F      ] Software interrupt
    ORA $070707             ; [0F 07 07 07] OR A with Absolute Long
    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    ASL $0C                 ; [06 0C      ] Shift Left DP
    ASL                     ; [0A         ] Shift Left Accumulator
    TRB $0C1E               ; [1C 1E 0C   ] Test and Reset Bits Absolute
    TSB $0000               ; [0C 00 00   ] Test and Set Bits Absolute
    ADC $207D3F             ; [6F 3F 7D 20] Add with Carry Absolute Long
    ROL $04,X               ; [36 04      ] Rotate Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BPL $5ACC               ; [10 00      ] Branch if Plus
    ORA #$00                ; [09 00      ] OR A with Immediate
    ASL $3001               ; [0E 01 30   ] Shift Left Absolute
    ORA $082300,X           ; [1F 00 23 08] OR A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BRK                     ; [00 01      ] Software interrupt
    ORA ($6A,X)             ; [01 6A      ] OR A with (DP,X)
    INX                     ; [E8         ] Increment X
    CMP ($F0)               ; [D2 F0      ] Compare A with (DP)
    PHX                     ; [DA         ] Push X Register
    CLI                     ; [58         ] Clear Interrupt Disable
    INC $64                 ; [E6 64      ] Increment DP
    JMP ($DC78,X)           ; [7C 78 DC   ] Jump Indirect,X
    SEI                     ; [78         ] Set Interrupt Disable
    SEI                     ; [78         ] Set Interrupt Disable
    LDY #$E0                ; [A0 E0      ] Load Y Immediate
    CPY #$D4                ; [C0 D4      ] Compare Y Immediate
    BIT $BC6C,X             ; [3C 6C BC   ] Test Bits Absolute,X
    BIT $FC                 ; [24 FC      ] Test Bits DP
    CLC                     ; [18         ] Clear Carry Flag
    JSR ($F800,X)           ; [FC 00 F8   ] Jump to Subroutine Indirect,X
    SEI                     ; [78         ] Set Interrupt Disable
    JSR $80A0               ; [20 A0 80   ] Jump to Subroutine
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    ORA $0A1F0F,X           ; [1F 0F 1F 0A] OR A with Absolute Long,X
    ORA $070F00             ; [0F 00 0F 07] OR A with Absolute Long
    ORA $3D00,Y             ; [19 00 3D   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    ASL $0C08,X             ; [1E 08 0C   ] Shift Left Absolute,X
    BRK                     ; [00 0D      ] Software interrupt
    ORA $000F0D             ; [0F 0D 0F 00] OR A with Absolute Long
    BRK                     ; [00 01      ] Software interrupt
    ASL $0C                 ; [06 0C      ] Shift Left DP
    ASL                     ; [0A         ] Shift Left Accumulator
    TRB $0C1E               ; [1C 1E 0C   ] Test and Reset Bits Absolute
    TSB $0000               ; [0C 00 00   ] Test and Set Bits Absolute
    BEQ $5B42               ; [F0 20      ] Branch if Equal
    BEQ $5B44               ; [F0 20      ] Branch if Equal

;--- Patch at file offset $145B30 (SNES $D45B30) ---
org $D45B30

    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPX #$C0                ; [E0 C0      ] Compare X Immediate

;--- Patch at file offset $145B42 (SNES $D45B42) ---
org $D45B42

    BRK                     ; [00 00      ] Software interrupt
    BRA $5B46               ; [80 00      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    BRA $5B81               ; [80 38      ] Branch Always
    CPX #$3C                ; [E0 3C      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    TSB $1AF8               ; [0C F8 1A   ] Test and Set Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $5B58               ; [80 00      ] Branch Always
    CPX #$80                ; [E0 80      ] Compare X Immediate
    CLD                     ; [D8         ] Clear Decimal Flag
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BCS $5B43               ; [B0 E4      ] Branch if Carry Set
    JSR ($E86A,X)           ; [FC 6A E8   ] Jump to Subroutine Indirect,X
    PHX                     ; [DA         ] Push X Register
    CPX #$FE                ; [E0 FE      ] Compare X Immediate
    BVC $5B65               ; [50 FE      ] Branch if Overflow Clear
    BVC $5BE5               ; [50 7C      ] Branch if Overflow Clear
    SEC                     ; [38         ] Set Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BVS $5B65               ; [70 F8      ] Branch if Overflow Set
    CPX #$F0                ; [E0 F0      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    PEI ($3C)               ; [D4 3C      ] Push Effective Indirect
    STZ $A4                 ; [64 A4      ] Store Zero to DP
    CLC                     ; [18         ] Clear Carry Flag
    CLD                     ; [D8         ] Clear Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    CLD                     ; [D8         ] Clear Decimal Flag
    JSR $70B8               ; [20 B8 70   ] Jump to Subroutine
    BVS $5B6D               ; [70 F0      ] Branch if Overflow Set
    BEQ $5B5F               ; [F0 E0      ] Branch if Equal
    CPX #$76                ; [E0 76      ] Compare X Immediate
    AND #$78                ; [29 78      ] AND A with Immediate
    ORA [$3D],Y             ; [17 3D      ] OR A with [DP],Y
    ORA [$0F]               ; [07 0F      ] OR A with [DP]
    ORA [$19]               ; [07 19      ] OR A with [DP]
    BRK                     ; [00 3D      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    ASL $0C08,X             ; [1E 08 0C   ] Shift Left Absolute,X
    BRK                     ; [00 2F      ] Software interrupt
    AND $073727             ; [2F 27 37 07] AND A with Absolute Long
    COP #$01                ; [02 01      ] Coprocessor interrupt
    ASL $0C                 ; [06 0C      ] Shift Left DP
    ASL                     ; [0A         ] Shift Left Accumulator
    TRB $0C1E               ; [1C 1E 0C   ] Test and Reset Bits Absolute
    TSB $0000               ; [0C 00 00   ] Test and Set Bits Absolute
    BEQ $5BA2               ; [F0 00      ] Branch if Equal
    db $E0                      ; Incomplete/data bytes

;--- Patch at file offset $145BC2 (SNES $D45BC2) ---
org $D45BC2

    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $3C07,X             ; [1D 07 3C   ] OR A with Absolute,X
    ORA $401F20,X           ; [1F 20 1F 40] OR A with Absolute Long,X
    AND $6F3F68,X           ; [3F 68 3F 6F] AND A with Absolute Long,X
    AND $000000,X           ; [3F 00 00 00] AND A with Absolute Long,X
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 1B      ] Software interrupt
    ORA [$1F]               ; [07 1F      ] OR A with [DP]
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    AND $351F1F,X           ; [3F 1F 1F 35] AND A with Absolute Long,X
    BMI $5BFF               ; [30 1F      ] Branch if Minus
    BRK                     ; [00 00      ] Software interrupt
    BRA $5BE4               ; [80 00      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    BRA $5C1F               ; [80 38      ] Branch Always
    CPX #$3C                ; [E0 3C      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    TSB $1AF8               ; [0C F8 1A   ] Test and Set Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    ROR                     ; [6A         ] Rotate Right Accumulator
    INX                     ; [E8         ] Increment X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $5BF6               ; [80 00      ] Branch Always
    CPX #$80                ; [E0 80      ] Compare X Immediate
    CLD                     ; [D8         ] Clear Decimal Flag
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BCS $5BE1               ; [B0 E4      ] Branch if Carry Set
    JSR ($3CD4,X)           ; [FC D4 3C   ] Jump to Subroutine Indirect,X
    ADC $3620,X             ; [7D 20 36   ] Add with Carry Absolute,X
    TSB $74                 ; [04 74      ] Test and Set Bits in DP
    ROL $74                 ; [26 74      ] Rotate Left DP
    ASL $70                 ; [06 70      ] Shift Left DP
    JSR $0038               ; [20 38 00   ] Jump to Subroutine
    ORA $091608,X           ; [1F 08 16 09] OR A with Absolute Long,X
    BRK                     ; [00 23      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    AND ($28,X)             ; [21 28      ] AND A with (DP,X)
    AND ($0E,X)             ; [21 0E      ] AND A with (DP,X)
    AND ($06,X)             ; [21 06      ] AND A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    BRK                     ; [00 0F      ] Software interrupt
    ORA $FAC0F2             ; [0F F2 C0 FA] OR A with Absolute Long
    JSR $24FE               ; [20 FE 24   ] Jump to Subroutine
    JSR ($FC70,X)           ; [FC 70 FC   ] Jump to Subroutine Indirect,X
    PHA                     ; [48         ] Push Accumulator
    SED                     ; [F8         ] Set Decimal Flag
    RTI                     ; [40         ] Return from Interrupt
    BEQ $5BEE               ; [F0 C0      ] Branch if Equal
    BEQ $5BB0               ; [F0 80      ] Branch if Equal
    JMP $348C               ; [4C 8C 34   ] Jump Absolute
    LDY $30,X               ; [B4 30      ] Load Y from DP,X
    LDY $40,X               ; [B4 40      ] Load Y from DP,X
    BVS $5CA1               ; [70 68      ] Branch if Overflow Set
    RTS                     ; [60         ] Return from Subroutine
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    PHP                     ; [08         ] Push Processor Status
    ORA [$09]               ; [07 09      ] OR A with [DP]
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA $02,S               ; [03 02      ] OR A with Stack Relative
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    BRK                     ; [00 07      ] Software interrupt
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ASL $02                 ; [06 02      ] Shift Left DP
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 E0      ] Software interrupt
    BRA $5C43               ; [80 E0      ] Branch Always
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    BRK                     ; [00 40      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRA $5BEF               ; [80 80      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    BRA $5C77               ; [80 00      ] Branch Always
    BRA $5C79               ; [80 00      ] Branch Always
    BRA $5BFB               ; [80 80      ] Branch Always
    BRA $5BFD               ; [80 80      ] Branch Always
    BRA $5C7F               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    ORA ($1E,X)             ; [01 1E      ] OR A with (DP,X)
    ORA $301F32             ; [0F 32 1F 30] OR A with Absolute Long
    ORA $001F22,X           ; [1F 22 1F 00] OR A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($0D,X)             ; [01 0D      ] OR A with (DP,X)
    COP #$1F                ; [02 1F      ] Coprocessor interrupt
    ORA ($1F,X)             ; [01 1F      ] OR A with (DP,X)
    ORA $000D1F             ; [0F 1F 0D 00] OR A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    CPY #$58                ; [C0 58      ] Compare Y Immediate
    BEQ $5CF7               ; [F0 4C      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    TSB $4EF8               ; [0C F8 4E   ] Test and Set Bits Absolute
    JSR ($0000,X)           ; [FC 00 00   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $5CF8               ; [80 40      ] Branch Always
    BCS $5CFA               ; [B0 40      ] Branch if Carry Set
    BEQ $5C64               ; [F0 A8      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    BEQ $5CAF               ; [F0 F0      ] Branch if Equal
    LDY $3F77,X             ; [BC 77 3F   ] Load Y from Absolute,X
    JML $387818             ; [5C 18 78 38] Jump Long
    CLI                     ; [58         ] Clear Interrupt Disable
    BPL $5D05               ; [10 3C      ] Branch if Plus
    BPL $5D09               ; [10 3E      ] Branch if Plus
    TSB $183E               ; [0C 3E 18   ] Test and Set Bits Absolute
    ADC $3F0838,X           ; [7F 38 08 3F] Add with Carry Absolute Long,X
    PLP                     ; [28         ] Pull Processor Status
    AND [$07],Y             ; [37 07      ] AND A with [DP],Y
    SEC                     ; [38         ] Set Carry Flag
    AND [$30]               ; [27 30      ] AND A with [DP]
    ORA ($00,S),Y           ; [13 00      ] OR A with (SR),Y
    ORA $0D0C               ; [0D 0C 0D   ] OR A with Absolute
    TRB $3830               ; [1C 30 38   ] Test and Reset Bits Absolute
    STX $F4,Y               ; [96 F4      ] Store X to DP,Y
    PLX                     ; [FA         ] Pull X Register
    SEI                     ; [78         ] Set Interrupt Disable
    ROR                     ; [6A         ] Rotate Right Accumulator
    PLP                     ; [28         ] Pull Processor Status
    ROL $14,X               ; [36 14      ] Rotate Left DP,X
    JMP ($FC08,X)           ; [7C 08 FC   ] Jump Indirect,X
    RTS                     ; [60         ] Return from Subroutine
    JSR ($FC50,X)           ; [FC 50 FC   ] Jump to Subroutine Indirect,X
    BCS $5D59               ; [B0 68      ] Branch if Carry Set
    STZ $FC04               ; [9C 04 FC   ] Store Zero to Absolute
    TRB $FC                 ; [14 FC      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    JSR ($8800,X)           ; [FC 00 88   ] Jump to Subroutine Indirect,X
    BVS $5D6C               ; [70 70      ] Branch if Overflow Set
    PLA                     ; [68         ] Pull Accumulator
    SEI                     ; [78         ] Set Interrupt Disable
    PHP                     ; [08         ] Push Processor Status
    CLV                     ; [B8         ] Clear Overflow Flag

;--- Patch at file offset $145D08 (SNES $D45D08) ---
org $D45D08

    INC $62,X               ; [F6 62      ] Increment DP,X
    TDC                     ; [7B         ] Transfer Direct Page to A
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $145D16 (SNES $D45D16) ---
org $D45D16

    ADC ($6D)               ; [72 6D      ] Add with Carry (DP)
    db $71                      ; Incomplete/data bytes

;--- Patch at file offset $145D20 (SNES $D45D20) ---
org $D45D20

    BIT $38D8,X             ; [3C D8 38   ] Test Bits Absolute,X
    CPX #$F0                ; [E0 F0      ] Compare X Immediate
    CPX #$30                ; [E0 30      ] Compare X Immediate
    JSR $0010               ; [20 10 00   ] Jump to Subroutine
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $5D30               ; [80 00      ] Branch Always
    CLD                     ; [D8         ] Clear Decimal Flag
    TYA                     ; [98         ] Transfer Y to A
    CPX #$80                ; [E0 80      ] Compare X Immediate
    JSR $80C0               ; [20 C0 80   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BRA $5D9A               ; [80 60      ] Branch Always
    BRA $5CBC               ; [80 80      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $3C07,X             ; [1D 07 3C   ] OR A with Absolute,X
    ORA $401F20,X           ; [1F 20 1F 40] OR A with Absolute Long,X
    AND $003F68,X           ; [3F 68 3F 00] AND A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 1B      ] Software interrupt
    ORA [$1F]               ; [07 1F      ] OR A with [DP]
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    AND $351F1F,X           ; [3F 1F 1F 35] AND A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $5D66               ; [80 00      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    BRA $5DA1               ; [80 38      ] Branch Always
    CPX #$3C                ; [E0 3C      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    TSB $1AF8               ; [0C F8 1A   ] Test and Set Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $5D78               ; [80 00      ] Branch Always
    CPX #$80                ; [E0 80      ] Compare X Immediate
    CLD                     ; [D8         ] Clear Decimal Flag
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BCS $5D63               ; [B0 E4      ] Branch if Carry Set
    JSR ($3F6F,X)           ; [FC 6F 3F   ] Jump to Subroutine Indirect,X
    ADC ($20),Y             ; [71 20      ] Add with Carry (DP),Y
    BMI $5D86               ; [30 00      ] Branch if Minus
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    ORA ($00)               ; [12 00      ] OR A with (DP)
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 3C      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    ADC $1F3030,X           ; [7F 30 30 1F] Add with Carry Absolute Long,X
    BRK                     ; [00 2F      ] Software interrupt
    ASL $0E01               ; [0E 01 0E   ] Shift Left Absolute
    BRK                     ; [00 0D      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 1A      ] Software interrupt
    ORA $3818,Y             ; [19 18 38   ] OR A with Absolute,Y
    ROR                     ; [6A         ] Rotate Right Accumulator
    INX                     ; [E8         ] Increment X
    CMP ($F0)               ; [D2 F0      ] Compare A with (DP)
    PHX                     ; [DA         ] Push X Register
    CLI                     ; [58         ] Clear Interrupt Disable
    INC $64                 ; [E6 64      ] Increment DP
    JMP ($9C78,X)           ; [7C 78 9C   ] Jump Indirect,X
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    CPY #$FC                ; [C0 FC      ] Compare Y Immediate
    BMI $5D85               ; [30 D4      ] Branch if Minus
    BIT $BC6C,X             ; [3C 6C BC   ] Test Bits Absolute,X
    BIT $FC                 ; [24 FC      ] Test Bits DP
    CLC                     ; [18         ] Clear Carry Flag
    JSR ($F800,X)           ; [FC 00 F8   ] Jump to Subroutine Indirect,X
    SEI                     ; [78         ] Set Interrupt Disable
    CPX #$40                ; [E0 40      ] Compare X Immediate
    BRA $5DF7               ; [80 38      ] Branch Always
    SEC                     ; [38         ] Set Carry Flag
    ADC $20713F             ; [6F 3F 71 20] Add with Carry Absolute Long
    BMI $5DC6               ; [30 00      ] Branch if Minus
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    ORA ($00)               ; [12 00      ] OR A with (DP)
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 3E      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    ADC $1F3030,X           ; [7F 30 30 1F] Add with Carry Absolute Long,X
    BRK                     ; [00 2F      ] Software interrupt
    ORA $000E00             ; [0F 00 0E 00] OR A with Absolute Long
    ORA $0700               ; [0D 00 07   ] OR A with Absolute
    BRK                     ; [00 18      ] Software interrupt
    ORA $3818,Y             ; [19 18 38   ] OR A with Absolute,Y
    ROR                     ; [6A         ] Rotate Right Accumulator
    INX                     ; [E8         ] Increment X
    CMP ($F0)               ; [D2 F0      ] Compare A with (DP)
    PHX                     ; [DA         ] Push X Register
    CLI                     ; [58         ] Clear Interrupt Disable
    INC $64                 ; [E6 64      ] Increment DP
    JMP ($9C78,X)           ; [7C 78 9C   ] Jump Indirect,X
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    CPY #$FC                ; [C0 FC      ] Compare Y Immediate
    BMI $5DC5               ; [30 D4      ] Branch if Minus
    BIT $BC6C,X             ; [3C 6C BC   ] Test Bits Absolute,X
    BIT $FC                 ; [24 FC      ] Test Bits DP
    CLC                     ; [18         ] Clear Carry Flag
    JSR ($F800,X)           ; [FC 00 F8   ] Jump to Subroutine Indirect,X
    SEI                     ; [78         ] Set Interrupt Disable
    CPX #$40                ; [E0 40      ] Compare X Immediate
    BRA $5E37               ; [80 38      ] Branch Always
    SEC                     ; [38         ] Set Carry Flag

;--- Patch at file offset $146404 (SNES $D46404) ---
org $D46404

    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $0F1000             ; [0F 00 10 0F] OR A with Absolute Long
    JSR $211F               ; [20 1F 21   ] Jump to Subroutine
    db $1F, $7F, $0E            ; Incomplete/data bytes

;--- Patch at file offset $146416 (SNES $D46416) ---
org $D46416

    BRK                     ; [00 00      ] Software interrupt
    ASL $1F00               ; [0E 00 1F   ] Shift Left Absolute
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    BRK                     ; [00 90      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BVS $6408               ; [70 E0      ] Branch if Overflow Set
    SED                     ; [F8         ] Set Decimal Flag
    BRA $649F               ; [80 74      ] Branch Always
    DEY                     ; [88         ] Decrement Y
    PLX                     ; [FA         ] Pull X Register
    STY $BE                 ; [84 BE      ] Store Y to DP
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BNE $63CB               ; [D0 90      ] Branch if Not Equal
    PLP                     ; [28         ] Pull Processor Status
    DEY                     ; [88         ] Decrement Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    PLA                     ; [68         ] Pull Accumulator
    EOR $032F20,X           ; [5F 20 2F 03] XOR A with Absolute Long,X
    ASL $0D,X               ; [16 0D      ] Shift Left DP,X
    TRB $0F                 ; [14 0F      ] Test and Reset Bits DP
    TRB $0F                 ; [14 0F      ] Test and Reset Bits DP
    ADC ($07),Y             ; [71 07      ] Add with Carry (DP),Y
    SED                     ; [F8         ] Set Decimal Flag
    RTI                     ; [40         ] Return from Interrupt
    ADC $210018,X           ; [7F 18 00 21] Add with Carry Absolute Long,X
    ORA $10,S               ; [03 10      ] OR A with Stack Relative
    ORA #$00                ; [09 00      ] OR A with Immediate
    ORA #$00                ; [09 00      ] OR A with Immediate
    ORA #$00                ; [09 00      ] OR A with Immediate
    ORA $717600             ; [0F 00 76 71] OR A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRA $64A3               ; [80 3C      ] Branch Always
    BRA $64A7               ; [80 3E      ] Branch Always
    BRA $64E9               ; [80 7E      ] Branch Always
    BRK                     ; [00 FE      ] Software interrupt
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    STY $28C4               ; [8C C4 28   ] Store Y to Absolute
    PLA                     ; [68         ] Pull Accumulator
    BRA $63FD               ; [80 88      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    INY                     ; [C8         ] Increment Y
    BPL $6445               ; [10 CC      ] Branch if Plus
    BPL $647B               ; [10 00      ] Branch if Plus
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $146482 (SNES $D46482) ---
org $D46482

    STA $7206,X             ; [9D 06 72   ] Store A to Absolute,X
    ASL $245C               ; [0E 5C 24   ] Shift Left Absolute
    EOR $334E33             ; [4F 33 4E 33] XOR A with Absolute Long
    STA $DB63,X             ; [9D 63 DB   ] Store A to Absolute,X
    BRK                     ; [00 6F      ] Software interrupt
    BRK                     ; [00 46      ] Software interrupt
    ROL $0F                 ; [26 0F      ] Rotate Left DP
    BRK                     ; [00 27      ] Software interrupt
    BRK                     ; [00 3B      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    INC                     ; [1A         ] Increment Accumulator
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEC                     ; [38         ] Set Carry Flag

;--- Patch at file offset $1464B6 (SNES $D464B6) ---
org $D464B6

    db $4C, $80                 ; Incomplete/data bytes

;--- Patch at file offset $1464C4 (SNES $D464C4) ---
org $D464C4

    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $0F1000             ; [0F 00 10 0F] OR A with Absolute Long
    JSR $211F               ; [20 1F 21   ] Jump to Subroutine
    db $1F, $7F, $0E            ; Incomplete/data bytes

;--- Patch at file offset $1464D6 (SNES $D464D6) ---
org $D464D6

    BRK                     ; [00 00      ] Software interrupt
    ASL $1F00               ; [0E 00 1F   ] Shift Left Absolute
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    BRK                     ; [00 90      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BVS $64C8               ; [70 E0      ] Branch if Overflow Set
    SED                     ; [F8         ] Set Decimal Flag
    BRA $655F               ; [80 74      ] Branch Always
    DEY                     ; [88         ] Decrement Y
    PLX                     ; [FA         ] Pull X Register
    STY $BE                 ; [84 BE      ] Store Y to DP
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BNE $648B               ; [D0 90      ] Branch if Not Equal
    PLP                     ; [28         ] Pull Processor Status
    DEY                     ; [88         ] Decrement Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    PLA                     ; [68         ] Pull Accumulator
    EOR $092F20,X           ; [5F 20 2F 09] XOR A with Absolute Long,X
    TRB $1407               ; [1C 07 14   ] Test and Reset Bits Absolute
    ORA $310F14             ; [0F 14 0F 31] OR A with Absolute Long
    ORA [$7B]               ; [07 7B      ] OR A with [DP]
    JSR $307C               ; [20 7C 30   ] Jump to Subroutine
    BRK                     ; [00 21      ] Software interrupt
    ORA #$10                ; [09 10      ] OR A with Immediate
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA #$00                ; [09 00      ] OR A with Immediate
    ORA #$00                ; [09 00      ] OR A with Immediate
    ORA $202400             ; [0F 00 24 20] OR A with Absolute Long
    AND ($30,S),Y           ; [33 30      ] AND A with (SR),Y
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRA $6563               ; [80 3C      ] Branch Always
    BRA $6567               ; [80 3E      ] Branch Always
    BRA $65A9               ; [80 7E      ] Branch Always
    BRK                     ; [00 FE      ] Software interrupt
    TSB $BE                 ; [04 BE      ] Test and Set Bits in DP
    JMP $28C4               ; [4C C4 28   ] Jump Absolute
    PLA                     ; [68         ] Pull Accumulator
    BRA $64BD               ; [80 88      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    INY                     ; [C8         ] Increment Y
    BPL $6505               ; [10 CC      ] Branch if Plus
    BPL $653B               ; [10 00      ] Branch if Plus
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $14654A (SNES $D4654A) ---
org $D4654A

    db $97                      ; Incomplete/data bytes

;--- Patch at file offset $146582 (SNES $D46582) ---
org $D46582

    STA $7106,X             ; [9D 06 71   ] Store A to Absolute,X
    ORA $813747             ; [0F 47 37 81] OR A with Absolute Long
    BVS $6526               ; [70 9B      ] Branch if Overflow Set
    SEI                     ; [78         ] Set Interrupt Disable
    LDA [$48],Y             ; [B7 48      ] Load A from [DP],Y
    WAI                     ; [CB         ] Wait for Interrupt
    BRK                     ; [00 6F      ] Software interrupt
    BRK                     ; [00 46      ] Software interrupt
    ROL $0F                 ; [26 0F      ] Rotate Left DP
    BRK                     ; [00 3F      ] Software interrupt
    BPL $6611               ; [10 78      ] Branch if Plus
    ROL $79                 ; [26 79      ] Rotate Left DP
    db $35                      ; Incomplete/data bytes

;--- Patch at file offset $1465AA (SNES $D465AA) ---
org $D465AA

    db $BD                      ; Incomplete/data bytes

;--- Patch at file offset $1465B6 (SNES $D465B6) ---
org $D465B6

    BIT $C6C0               ; [2C C0 C6   ] Test Bits Absolute
    db $20, $72                 ; Incomplete/data bytes

;--- Patch at file offset $1465CA (SNES $D465CA) ---
org $D465CA

    BRK                     ; [00 00      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    db $1E, $01                 ; Incomplete/data bytes

;--- Patch at file offset $1465DC (SNES $D465DC) ---
org $D465DC

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $1465EC (SNES $D465EC) ---
org $D465EC

    BVS $65EE               ; [70 00      ] Branch if Overflow Set
    INX                     ; [E8         ] Increment X
    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $1465F9 (SNES $D465F9) ---
org $D465F9

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BVC $6622               ; [50 21      ] Branch if Overflow Clear
    ORA $433F40,X           ; [1F 40 3F 43] OR A with Absolute Long,X
    AND $BF1CFF,X           ; [3F FF 1C BF] AND A with Absolute Long,X
    RTI                     ; [40         ] Return from Interrupt
    ADC $132D06,X           ; [7F 06 2D 13] Add with Carry Absolute Long,X
    PLP                     ; [28         ] Pull Processor Status
    ORA $3F011C,X           ; [1F 1C 01 3F] OR A with Absolute Long,X
    BRK                     ; [00 3F      ] Software interrupt
    BRK                     ; [00 1C      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    WDM #$06                ; [42 06      ] Reserved (WDM)
    AND ($13,X)             ; [21 13      ] AND A with (DP,X)
    BRK                     ; [00 13      ] Software interrupt
    BRK                     ; [00 74      ] Software interrupt
    DEY                     ; [88         ] Decrement Y
    LDY $C8,X               ; [B4 C8      ] Load Y from DP,X
    JSR ($7C00,X)           ; [FC 00 7C   ] Jump to Subroutine Indirect,X
    BRA $6621               ; [80 F8      ] Branch Always
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    BPL $65BC               ; [10 88      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    JSR $D008               ; [20 08 D0   ] Jump to Subroutine
    BRA $668A               ; [80 50      ] Branch Always
    INY                     ; [C8         ] Increment Y
    BPL $6649               ; [10 0C      ] Branch if Plus
    LDY #$84                ; [A0 84      ] Load Y Immediate
    PLP                     ; [28         ] Pull Processor Status
    AND #$1E                ; [29 1E      ] AND A with Immediate
    AND $0C,S               ; [23 0C      ] AND A with Stack Relative
    ORA [$00],Y             ; [17 00      ] OR A with [DP],Y
    ORA $3901,Y             ; [19 01 39   ] OR A with Absolute,Y
    ORA ($7F),Y             ; [11 7F      ] OR A with (DP),Y
    SEC                     ; [38         ] Set Carry Flag
    LSR $0B                 ; [46 0B      ] Shift Right DP
    AND $001200,X           ; [3F 00 12 00] AND A with Absolute Long,X
    ORA $0801,X             ; [1D 01 08   ] OR A with Absolute,X
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 15      ] Software interrupt
    COP #$38                ; [02 38      ] Coprocessor interrupt
    BRK                     ; [00 0B      ] Software interrupt
    DEC                     ; [3A         ] Decrement Accumulator
    BRK                     ; [00 00      ] Software interrupt
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BEQ $665D               ; [F0 F4      ] Branch if Equal
    SEC                     ; [38         ] Set Carry Flag
    JSL $6ED11C             ; [22 1C D1 6E] Jump to Subroutine Long
    SBC $080400,X           ; [FF 00 04 08] Subtract with Borrow Absolute Long,X
    CPX #$C8                ; [E0 C8      ] Compare X Immediate
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    BRK                     ; [00 9C      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    ROR $0040               ; [6E 40 00   ] Rotate Right Absolute
    BRK                     ; [00 5F      ] Software interrupt
    JSR $032F               ; [20 2F 03   ] Jump to Subroutine
    ASL $0D,X               ; [16 0D      ] Shift Left DP,X
    TRB $0F                 ; [14 0F      ] Test and Reset Bits DP
    TRB $0F                 ; [14 0F      ] Test and Reset Bits DP
    ORA ($07),Y             ; [11 07      ] OR A with (DP),Y
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    AND ($03,X)             ; [21 03      ] AND A with (DP,X)
    BPL $669E               ; [10 09      ] Branch if Plus
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 06      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 11      ] Software interrupt
    ORA $11061D             ; [0F 1D 06 11] OR A with Absolute Long
    ORA $310717             ; [0F 17 07 31] OR A with Absolute Long

;--- Patch at file offset $1466B2 (SNES $D466B2) ---
org $D466B2

    ASL $06                 ; [06 06      ] Shift Left DP
    ORA $000F00             ; [0F 00 0F 00] OR A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    ASL $39                 ; [06 39      ] Shift Left DP
    ORA $0B,X               ; [15 0B      ] OR A with DP,X
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 5F      ] Software interrupt
    JSR $032F               ; [20 2F 03   ] Jump to Subroutine
    ASL $0D,X               ; [16 0D      ] Shift Left DP,X
    TRB $0F                 ; [14 0F      ] Test and Reset Bits DP
    TRB $0F                 ; [14 0F      ] Test and Reset Bits DP
    ORA ($07),Y             ; [11 07      ] OR A with (DP),Y
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    AND ($03,X)             ; [21 03      ] AND A with (DP,X)
    BPL $66DE               ; [10 09      ] Branch if Plus
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 06      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRA $6723               ; [80 3C      ] Branch Always
    BRA $6727               ; [80 3E      ] Branch Always
    BRA $6769               ; [80 7E      ] Branch Always
    BRK                     ; [00 FE      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    INC $C478,X             ; [FE 78 C4   ] Increment Absolute,X
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $667D               ; [80 88      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    INY                     ; [C8         ] Increment Y
    BPL $66C5               ; [10 CC      ] Branch if Plus
    BPL $6703               ; [10 08      ] Branch if Plus
    STY $3A,X               ; [94 3A      ] Store Y to DP,X
    SEC                     ; [38         ] Set Carry Flag
    SEI                     ; [78         ] Set Interrupt Disable
    PLY                     ; [7A         ] Pull Y Register

;--- Patch at file offset $146712 (SNES $D46712) ---
org $D46712

    ORA $000700,X           ; [1F 00 07 00] OR A with Absolute Long,X
    PHD                     ; [0B         ] Push Direct Page Register
    BRK                     ; [00 19      ] Software interrupt
    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $146740 (SNES $D46740) ---
org $D46740

    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 90      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BVS $6728               ; [70 E0      ] Branch if Overflow Set
    SED                     ; [F8         ] Set Decimal Flag
    BRA $67BF               ; [80 74      ] Branch Always
    DEY                     ; [88         ] Decrement Y
    PLX                     ; [FA         ] Pull X Register
    STY $BE                 ; [84 BE      ] Store Y to DP
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    SEC                     ; [38         ] Set Carry Flag
    DEY                     ; [88         ] Decrement Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    PLA                     ; [68         ] Pull Accumulator
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 E4      ] Software interrupt
    BRA $67CB               ; [80 64      ] Branch Always
    BRA $67E5               ; [80 7C      ] Branch Always
    LDY #$3E                ; [A0 3E      ] Load Y Immediate
    BVS $67B3               ; [70 46      ] Branch if Overflow Set
    BIT $7ACE,X             ; [3C CE 7A   ] Test Bits Absolute,X
    CPY $28                 ; [C4 28      ] Compare Y with DP
    RTI                     ; [40         ] Return from Interrupt
    BRA $670D               ; [80 98      ] Branch Always
    BRK                     ; [00 98      ] Software interrupt
    BRK                     ; [00 A0      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    BRA $67B9               ; [80 3C      ] Branch Always
    BRA $67F9               ; [80 7A      ] Branch Always
    COP #$91                ; [02 91      ] Coprocessor interrupt
    ORA $71069D             ; [0F 9D 06 71] OR A with Absolute Long
    ORA $A12757             ; [0F 57 27 A1] OR A with Absolute Long

;--- Patch at file offset $146792 (SNES $D46792) ---
org $D46792

    LSR $26                 ; [46 26      ] Shift Right DP
    ORA $002F00             ; [0F 00 2F 00] OR A with Absolute Long
    CLI                     ; [58         ] Clear Interrupt Disable
    ASL $39,X               ; [16 39      ] Shift Left DP,X
    db $15                      ; Incomplete/data bytes

;--- Patch at file offset $1467AA (SNES $D467AA) ---
org $D467AA

    db $FD                      ; Incomplete/data bytes

;--- Patch at file offset $1467B6 (SNES $D467B6) ---
org $D467B6

    TRB $D0                 ; [14 D0      ] Test and Reset Bits DP
    CPY $20                 ; [C4 20      ] Compare Y with DP
    db $72                      ; Incomplete/data bytes

;--- Patch at file offset $1467C4 (SNES $D467C4) ---
org $D467C4

    BRK                     ; [00 00      ] Software interrupt
    ORA $0F1000             ; [0F 00 10 0F] OR A with Absolute Long
    JSR $211F               ; [20 1F 21   ] Jump to Subroutine
    db $1F, $7F, $0E            ; Incomplete/data bytes

;--- Patch at file offset $1467D6 (SNES $D467D6) ---
org $D467D6

    BRK                     ; [00 00      ] Software interrupt
    ASL $1F00               ; [0E 00 1F   ] Shift Left Absolute
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    BRK                     ; [00 90      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    SEI                     ; [78         ] Set Interrupt Disable
    CPX #$E4                ; [E0 E4      ] Compare X Immediate
    TYA                     ; [98         ] Transfer Y to A
    PLY                     ; [7A         ] Pull Y Register
    STY $FE                 ; [84 FE      ] Store Y to DP
    BRA $67AD               ; [80 BE      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    DEY                     ; [88         ] Decrement Y
    BIT $88,X               ; [34 88      ] Test Bits DP,X
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    JMP ($205F)             ; [6C 5F 20   ] Jump Indirect
    AND $0D5603             ; [2F 03 56 0D] AND A with Absolute Long
    MVN $0F,$74             ; [54 0F 74   ] Block Move Negative
    AND $292751             ; [2F 51 27 29] AND A with Absolute Long
    BPL $683E               ; [10 2F      ] Branch if Plus
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    AND ($03,X)             ; [21 03      ] AND A with (DP,X)
    BPL $683E               ; [10 29      ] Branch if Plus
    BRK                     ; [00 09      ] Software interrupt
    JSR $0029               ; [20 29 00   ] Jump to Subroutine
    AND $001600             ; [2F 00 16 00] AND A with Absolute Long
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    INC $FE00,X             ; [FE 00 FE   ] Increment Absolute,X
    BRK                     ; [00 CE      ] Software interrupt
    BRA $67F5               ; [80 CE      ] Branch Always
    BRK                     ; [00 FE      ] Software interrupt
    BVC $6829               ; [50 FE      ] Branch if Overflow Clear
    RTS                     ; [60         ] Return from Subroutine
    TRB $3CE8               ; [1C E8 3C   ] Test and Reset Bits Absolute
    INX                     ; [E8         ] Increment X
    CPY $28                 ; [C4 28      ] Compare Y with DP
    TSB $80                 ; [04 80      ] Test and Set Bits in DP
    LDY $00,X               ; [B4 00      ] Load Y from DP,X
    BIT $00,X               ; [34 00      ] Test Bits DP,X
    BVC $683E               ; [50 04      ] Branch if Overflow Clear
    RTS                     ; [60         ] Return from Subroutine
    TSB $E8                 ; [04 E8      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    INX                     ; [E8         ] Increment X
    BRK                     ; [00 10      ] Software interrupt
    ORA $12061D             ; [0F 1D 06 12] OR A with Absolute Long
    ASL $142C               ; [0E 2C 14   ] Shift Left Absolute
    AND $3B4613             ; [2F 13 46 3B] AND A with Absolute Long

;--- Patch at file offset $146852 (SNES $D46852) ---
org $D46852

    ASL $06                 ; [06 06      ] Shift Left DP

;--- Patch at file offset $14685A (SNES $D4685A) ---
org $D4685A

    TSC                     ; [3B         ] Transfer Stack Pointer to A
    INC                     ; [1A         ] Increment Accumulator
    AND $00,S               ; [23 00      ] AND A with Stack Relative
    COP #$00                ; [02 00      ] Coprocessor interrupt
    ROR $FEEC,X             ; [7E EC FE   ] Rotate Right Absolute,X
    TSB $D4EA               ; [0C EA D4   ] Test and Set Bits Absolute
    ROR                     ; [6A         ] Rotate Right Accumulator
    MVN $EB,$96             ; [54 EB 96   ] Block Move Negative
    SBC $0A,X               ; [F5 0A      ] Subtract with Borrow DP,X
    LDA $0A,X               ; [B5 0A      ] Load A from DP,X
    AND $00EC00,X           ; [3F 00 EC 00] AND A with Absolute Long,X
    TSB $D400               ; [0C 00 D4   ] Test and Set Bits Absolute
    BPL $68CB               ; [10 54      ] Branch if Plus
    BCC $682F               ; [90 B6      ] Branch if Carry Clear
    BMI $68B5               ; [30 3A      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    INC                     ; [1A         ] Increment Accumulator
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BVS $6884               ; [70 00      ] Branch if Overflow Set
    EOR $2F30,Y             ; [59 30 2F   ] XOR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    ORA ($0E,S),Y           ; [13 0E      ] OR A with (SR),Y
    AND [$1E]               ; [27 1E      ] AND A with [DP]
    AND [$1C]               ; [27 1C      ] AND A with [DP]
    EOR $00003C             ; [4F 3C 00 00] XOR A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    TSB $0C                 ; [04 0C      ] Test and Set Bits in DP
    COP #$00                ; [02 00      ] Coprocessor interrupt
    ASL $1C00,X             ; [1E 00 1C   ] Shift Left Absolute,X
    BRK                     ; [00 3C      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 88      ] Software interrupt
    BVS $689B               ; [70 F4      ] Branch if Overflow Set
    PHP                     ; [08         ] Push Processor Status
    PEA $BC08               ; [F4 08 BC   ] Push Effective Absolute
    RTI                     ; [40         ] Return from Interrupt
    JSR ($BE00,X)           ; [FC 00 BE   ] Jump to Subroutine Indirect,X
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $6926               ; [80 70      ] Branch Always
    BMI $6880               ; [30 C8      ] Branch if Minus
    BPL $68E2               ; [10 28      ] Branch if Plus
    DEY                     ; [88         ] Decrement Y
    BVC $68FD               ; [50 40      ] Branch if Overflow Clear
    TAY                     ; [A8         ] Transfer A to Y
    LDY #$54                ; [A0 54      ] Load Y Immediate
    EOR $07FC38,X           ; [5F 38 FC 07] XOR A with Absolute Long,X
    EOR #$0E                ; [49 0E      ] XOR A with Immediate
    AND ($0D)               ; [32 0D      ] AND A with (DP)
    ORA $2E07,Y             ; [19 07 2E   ] OR A with Absolute,Y
    COP #$27                ; [02 27      ] Coprocessor interrupt
    BRK                     ; [00 2F      ] Software interrupt
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    SEC                     ; [38         ] Set Carry Flag
    ORA $47,S               ; [03 47      ] OR A with Stack Relative
    BRK                     ; [00 1E      ] Software interrupt
    JSR $000D               ; [20 0D 00   ] Jump to Subroutine
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA ($00,S),Y           ; [13 00      ] OR A with (SR),Y
    BPL $68E6               ; [10 08      ] Branch if Plus
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    BRK                     ; [00 7F      ] Software interrupt
    BRA $689E               ; [80 BB      ] Branch Always
    STY $5F                 ; [84 5F      ] Store Y to DP
    CPY #$FE                ; [C0 FE      ] Compare Y Immediate
    STY $9F                 ; [84 9F      ] Store Y to DP
    ORA ($97)               ; [12 97      ] OR A with (DP)
    TRB $3CE6               ; [1C E6 3C   ] Test and Reset Bits Absolute
    LDX $34D8,Y             ; [BE D8 34   ] Load X from Absolute,Y
    db $C2                      ; Incomplete/data bytes

;--- Patch at file offset $1468FA (SNES $D468FA) ---
org $D468FA

    db $7C, $04                 ; Incomplete/data bytes

;--- Patch at file offset $146904 (SNES $D46904) ---
org $D46904

    AND $19                 ; [25 19      ] AND A with Direct Page
    PHA                     ; [48         ] Push Accumulator
    BMI $68A6               ; [30 9D      ] Branch if Minus
    STZ $77                 ; [64 77      ] Store Zero to DP
    db $0E, $0F                 ; Incomplete/data bytes

;--- Patch at file offset $146914 (SNES $D46914) ---
org $D46914

    ORA $193E0C,X           ; [1F 0C 3E 19] OR A with Absolute Long,X
    JMP ($0F2A)             ; [6C 2A 0F   ] Jump Indirect
    ORA $01                 ; [05 01      ] OR A with Direct Page
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 3A      ] Software interrupt
    db $C4                      ; Incomplete/data bytes

;--- Patch at file offset $146928 (SNES $D46928) ---
org $D46928

    CMP [$4E],Y             ; [D7 4E      ] Compare A with [DP],Y
    SBC $4CBE56             ; [EF 56 BE 4C] Subtract with Borrow Absolute Long
    CPX $C400               ; [EC 00 C4   ] Compare X with Absolute
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $14693A (SNES $D4693A) ---
org $D4693A

    LSR $40,X               ; [56 40      ] Shift Right DP,X

;--- Patch at file offset $146944 (SNES $D46944) ---
org $D46944

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA [$10]               ; [07 10      ] OR A with [DP]
    ORA $3F0F10             ; [0F 10 0F 3F] OR A with Absolute Long
    db $07                      ; Incomplete/data bytes

;--- Patch at file offset $146956 (SNES $D46956) ---
org $D46956

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $000F00             ; [0F 00 0F 00] OR A with Absolute Long
    ORA [$00]               ; [07 00      ] OR A with [DP]
    BRK                     ; [00 00      ] Software interrupt
    BMI $6964               ; [30 00      ] Branch if Minus
    INY                     ; [C8         ] Increment Y
    BMI $691F               ; [30 B8      ] Branch if Minus
    BVS $69E5               ; [70 7C      ] Branch if Overflow Set
    CPY #$3A                ; [C0 3A      ] Compare Y Immediate
    CPY $FD                 ; [C4 FD      ] Compare Y with DP
    REP #$DF                ; [C2 DF      ] Reset Processor Status Bits
    JSR $0000               ; [20 00 00   ] Jump to Subroutine
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    JSR $C860               ; [20 60 C8   ] Jump to Subroutine
    TRB $C4                 ; [14 C4      ] Test and Reset Bits DP
    ASL                     ; [0A         ] Shift Left Accumulator
    COP #$34                ; [02 34      ] Coprocessor interrupt
    AND $031110             ; [2F 10 11 03] AND A with Absolute Long
    PHP                     ; [08         ] Push Processor Status
    ORA [$09]               ; [07 09      ] OR A with [DP]
    ASL $0A                 ; [06 0A      ] Shift Left DP
    ORA $19                 ; [05 19      ] OR A with Direct Page
    ORA $1C,S               ; [03 1C      ] OR A with Stack Relative
    PHP                     ; [08         ] Push Processor Status
    ORA $100001             ; [0F 01 00 10] OR A with Absolute Long
    ORA [$08]               ; [07 08      ] OR A with [DP]
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ASL $00                 ; [06 00      ] Shift Left DP
    ORA $00                 ; [05 00      ] OR A with Direct Page
    ORA [$00]               ; [07 00      ] OR A with [DP]
    PHD                     ; [0B         ] Push Direct Page Register
    PHP                     ; [08         ] Push Processor Status
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    SBC $80FE00,X           ; [FF 00 FE 80] Subtract with Borrow Absolute Long,X
    ROR $9EC0,X             ; [7E C0 9E   ] Rotate Right Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    ORA $809FC0,X           ; [1F C0 9F 80] OR A with Absolute Long,X
    AND $9CFE10,X           ; [3F 10 FE 9C] AND A with Absolute Long,X
    db $62, $94                 ; Incomplete/data bytes

;--- Patch at file offset $1469B8 (SNES $D469B8) ---
org $D469B8

    INC $08                 ; [E6 08      ] Increment DP
    BRL $861D               ; [82 60 1C   ] Branch Long
    JML [$1C9C]             ; [DC 9C 1C   ] Jump Long Indirect
    AND $031110             ; [2F 10 11 03] AND A with Absolute Long
    PHP                     ; [08         ] Push Processor Status
    ORA [$09]               ; [07 09      ] OR A with [DP]
    ASL $0A                 ; [06 0A      ] Shift Left DP
    ORA $19                 ; [05 19      ] OR A with Direct Page
    ORA $1C,S               ; [03 1C      ] OR A with Stack Relative
    PHP                     ; [08         ] Push Processor Status
    ORA $100001             ; [0F 01 00 10] OR A with Absolute Long
    ORA [$08]               ; [07 08      ] OR A with [DP]
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ASL $00                 ; [06 00      ] Shift Left DP
    ORA $00                 ; [05 00      ] OR A with Direct Page
    ORA [$00]               ; [07 00      ] OR A with [DP]
    PHD                     ; [0B         ] Push Direct Page Register
    PHP                     ; [08         ] Push Processor Status
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    SBC $80FE00,X           ; [FF 00 FE 80] Subtract with Borrow Absolute Long,X
    ROR $9EC0,X             ; [7E C0 9E   ] Rotate Right Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    ORA $809FC0,X           ; [1F C0 9F 80] OR A with Absolute Long,X
    AND $9CFE10,X           ; [3F 10 FE 9C] AND A with Absolute Long,X
    db $62, $94                 ; Incomplete/data bytes

;--- Patch at file offset $1469F8 (SNES $D469F8) ---
org $D469F8

    INC $08                 ; [E6 08      ] Increment DP
    BRL $865D               ; [82 60 1C   ] Branch Long
    JML [$1C9C]             ; [DC 9C 1C   ] Jump Long Indirect
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ASL $1201               ; [0E 01 12   ] Shift Left Absolute
    TSB $1C26               ; [0C 26 1C   ] Test and Set Bits Absolute
    AND $2302,X             ; [3D 02 23   ] AND A with Absolute,X
    ORA $002E57,X           ; [1F 57 2E 00] OR A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 0D      ] Software interrupt
    ORA ($1D,X)             ; [01 1D      ] OR A with (DP,X)
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    JSR $0000               ; [20 00 00   ] Jump to Subroutine
    BRA $6A24               ; [80 00      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRA $6A27               ; [80 FC      ] Branch Always
    BRK                     ; [00 FA      ] Software interrupt
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRA $6A37               ; [80 00      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    JSR $5800               ; [20 00 58   ] Jump to Subroutine
    PHP                     ; [08         ] Push Processor Status
    MVN $04,$E8             ; [54 04 E8   ] Block Move Negative
    EOR $002C24,X           ; [5F 24 2C 00] XOR A with Absolute Long,X
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BPL $6A4C               ; [10 00      ] Branch if Plus
    ORA #$00                ; [09 00      ] OR A with Immediate
    AND [$09],Y             ; [37 09      ] AND A with [DP],Y
    TSB $31                 ; [04 31      ] Test and Set Bits in DP
    COP #$11                ; [02 11      ] Coprocessor interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $6A7D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $6AD5               ; [90 5C      ] Branch if Carry Clear
    BRA $6A87               ; [80 0C      ] Branch Always
    BCC $6A85               ; [90 08      ] Branch if Carry Clear
    TSB $60                 ; [04 60      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    EOR #$06                ; [49 06      ] XOR A with Immediate
    EOR $3902               ; [4D 02 39   ] XOR A with Absolute
    ORA [$09]               ; [07 09      ] OR A with [DP]
    ORA [$04]               ; [07 04      ] OR A with [DP]
    BRK                     ; [00 06      ] Software interrupt
    ORA $06,S               ; [03 06      ] OR A with Stack Relative
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    BRK                     ; [00 36      ] Software interrupt
    BRK                     ; [00 26      ] Software interrupt
    ASL $07,X               ; [16 07      ] Shift Left DP,X
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 38      ] Software interrupt
    BMI $6ACB               ; [30 28      ] Branch if Minus
    JSR $00F0               ; [20 F0 00   ] Jump to Subroutine
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    BRA $6AAA               ; [80 00      ] Branch Always
    BRA $6AAC               ; [80 00      ] Branch Always
    BRA $6AAE               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BNE $6AD2               ; [D0 20      ] Branch if Not Equal
    CPY #$30                ; [C0 30      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRA $6AB8               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ASL $1201               ; [0E 01 12   ] Shift Left Absolute
    TSB $1C26               ; [0C 26 1C   ] Test and Set Bits Absolute
    AND $2302,X             ; [3D 02 23   ] AND A with Absolute,X
    ORA $002E57,X           ; [1F 57 2E 00] OR A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 0D      ] Software interrupt
    ORA ($1D,X)             ; [01 1D      ] OR A with (DP,X)
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    JSR $0000               ; [20 00 00   ] Jump to Subroutine
    BRA $6AE4               ; [80 00      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRA $6AE7               ; [80 FC      ] Branch Always
    BRK                     ; [00 FA      ] Software interrupt
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRA $6AF7               ; [80 00      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    JSR $5800               ; [20 00 58   ] Jump to Subroutine
    PHP                     ; [08         ] Push Processor Status
    MVN $04,$E8             ; [54 04 E8   ] Block Move Negative
    EOR $002724,X           ; [5F 24 27 00] XOR A with Absolute Long,X
    TRB $1406               ; [1C 06 14   ] Test and Reset Bits Absolute
    ASL $14                 ; [06 14      ] Shift Left DP
    TSB $10                 ; [04 10      ] Test and Set Bits in DP
    BRK                     ; [00 0D      ] Software interrupt
    BRK                     ; [00 13      ] Software interrupt
    ORA ($04,X)             ; [01 04      ] OR A with (DP,X)
    AND ($00),Y             ; [31 00      ] AND A with (DP),Y
    ORA $0100,Y             ; [19 00 01   ] OR A with Absolute,Y
    PHP                     ; [08         ] Push Processor Status
    ORA ($0A,X)             ; [01 0A      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    BRK                     ; [00 09      ] Software interrupt
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 9E      ] Software interrupt
    BRK                     ; [00 9E      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BVS $6AF5               ; [70 C4      ] Branch if Overflow Set
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $6B3D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $6B45               ; [90 0C      ] Branch if Carry Clear
    BPL $6BA7               ; [10 6C      ] Branch if Plus
    BRK                     ; [00 68      ] Software interrupt
    TSB $10                 ; [04 10      ] Test and Set Bits in DP
    RTS                     ; [60         ] Return from Subroutine
    AND ($11,S),Y           ; [33 11      ] AND A with (SR),Y
    BIT $3C0B               ; [2C 0B 3C   ] Test Bits Absolute
    ORA [$10]               ; [07 10      ] OR A with [DP]
    ORA $310011             ; [0F 11 00 31] OR A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    ROL $08,X               ; [36 08      ] Rotate Left DP,X
    BIT $0900,X             ; [3C 00 09   ] Test Bits Absolute,X
    TRB $13                 ; [14 13      ] Test and Reset Bits DP
    PHD                     ; [0B         ] Push Direct Page Register
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $080600             ; [0F 00 06 08] OR A with Absolute Long
    PHP                     ; [08         ] Push Processor Status
    ASL $1818,X             ; [1E 18 18   ] Shift Left Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    TYA                     ; [98         ] Transfer Y to A
    BPL $6BD3               ; [10 70      ] Branch if Plus
    BRA $6B55               ; [80 F0      ] Branch Always
    CPX #$38                ; [E0 38      ] Compare X Immediate
    BEQ $6B71               ; [F0 08      ] Branch if Equal
    BRK                     ; [00 88      ] Software interrupt
    BMI $6BDD               ; [30 70      ] Branch if Minus
    CLC                     ; [18         ] Clear Carry Flag
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 50      ] Software interrupt
    JSR $8080               ; [20 80 80   ] Jump to Subroutine
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BEQ $6B78               ; [F0 00      ] Branch if Equal
    RTI                     ; [40         ] Return from Interrupt
    BCS $6BEB               ; [B0 70      ] Branch if Carry Set
    BMI $6BA5               ; [30 28      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    EOR #$06                ; [49 06      ] XOR A with Immediate
    EOR $3902               ; [4D 02 39   ] XOR A with Absolute
    ORA [$11]               ; [07 11      ] OR A with [DP]
    ORA $22,S               ; [03 22      ] OR A with Stack Relative
    BRK                     ; [00 72      ] Software interrupt
    TRB $1825               ; [1C 25 18   ] Test and Reset Bits Absolute
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 36      ] Software interrupt
    BRK                     ; [00 26      ] Software interrupt
    ASL $07,X               ; [16 07      ] Shift Left DP,X
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    ORA $2D                 ; [05 2D      ] OR A with Direct Page
    BIT $1818,X             ; [3C 18 18   ] Test Bits Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    BMI $6BCB               ; [30 28      ] Branch if Minus
    JSR $00F0               ; [20 F0 00   ] Jump to Subroutine
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    JSR $5040               ; [20 40 50   ] Jump to Subroutine
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BNE $6BD2               ; [D0 20      ] Branch if Not Equal
    CPY #$30                ; [C0 30      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    LDY #$E0                ; [A0 E0      ] Load Y Immediate
    BRA $6B7E               ; [80 C0      ] Branch Always

;--- Patch at file offset $146BC4 (SNES $D46BC4) ---
org $D46BC4

    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    COP #$01                ; [02 01      ] Coprocessor interrupt
    COP #$01                ; [02 01      ] Coprocessor interrupt
    ASL $00                 ; [06 00      ] Shift Left DP
    ORA #$06                ; [09 06      ] OR A with Immediate

;--- Patch at file offset $146BD6 (SNES $D46BD6) ---
org $D46BD6

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    ASL $00                 ; [06 00      ] Shift Left DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 6C      ] Software interrupt
    BPL $6C65               ; [10 76      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $146BFA (SNES $D46BFA) ---
org $D46BFA

    BRK                     ; [00 40      ] Software interrupt
    BRA $6BB6               ; [80 B8      ] Branch Always
    STY $B8                 ; [84 B8      ] Store Y to DP
    ORA ($0E,S),Y           ; [13 0E      ] OR A with (SR),Y
    ASL $2603,X             ; [1E 03 26   ] Shift Left Absolute,X
    ORA $67,S               ; [03 67      ] OR A with Stack Relative
    JSL $50307E             ; [22 7E 30 50] Jump to Subroutine Long
    BRK                     ; [00 5D      ] Software interrupt
    BRK                     ; [00 75      ] Software interrupt
    AND $000E               ; [2D 0E 00   ] AND A with Absolute
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA ($08,S),Y           ; [13 08      ] OR A with (SR),Y
    INC                     ; [1A         ] Increment Accumulator
    JSR $3100               ; [20 00 31   ] Jump to Subroutine
    JSR $220F               ; [20 0F 22   ] Jump to Subroutine
    BRK                     ; [00 22      ] Software interrupt
    BRK                     ; [00 FF      ] Software interrupt
    BRA $6C22               ; [80 FF      ] Branch Always
    BRA $6BF3               ; [80 CE      ] Branch Always
    db $30                      ; Incomplete/data bytes

;--- Patch at file offset $146C2E (SNES $D46C2E) ---
org $D46C2E

    AND $008E80             ; [2F 80 8E 00] AND A with Absolute Long
    LDY $1A                 ; [A4 1A      ] Load Y from DP
    TSB $70                 ; [04 70      ] Test and Set Bits in DP
    BIT $40,X               ; [34 40      ] Test Bits DP,X
    TSB $F0                 ; [04 F0      ] Test and Set Bits in DP
    TSB $F2                 ; [04 F2      ] Test and Set Bits in DP
    ASL $30                 ; [06 30      ] Shift Left DP
    ASL $60,X               ; [16 60      ] Shift Left DP,X
    EOR $2D,X               ; [55 2D      ] XOR A with DP,X
    BMI $6C44               ; [30 00      ] Branch if Minus
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 1D      ] Software interrupt
    ORA $17,S               ; [03 17      ] OR A with Stack Relative
    TSB $1D                 ; [04 1D      ] Test and Set Bits in DP
    ASL $0F                 ; [06 0F      ] Shift Left DP
    BRK                     ; [00 22      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 06      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    TSB $0A                 ; [04 0A      ] Test and Set Bits in DP
    ASL $0000               ; [0E 00 00   ] Shift Left Absolute
    ORA $001E80             ; [0F 80 1E 00] OR A with Absolute Long
    JMP ($9C08,X)           ; [7C 08 9C   ] Jump Indirect,X
    CLC                     ; [18         ] Clear Carry Flag
    PEI ($10)               ; [D4 10      ] Push Effective Indirect
    LDY $00,X               ; [B4 00      ] Load Y from DP,X
    INY                     ; [C8         ] Increment Y
    BMI $6CDF               ; [30 70      ] Branch if Minus
    BRK                     ; [00 14      ] Software interrupt
    PER $5074               ; [62 00 E4   ] Push Effective Relative
    PHP                     ; [08         ] Push Processor Status
    BRA $6CDF               ; [80 68      ] Branch Always
    BPL $6C81               ; [10 08      ] Branch if Plus
    BMI $6C7B               ; [30 00      ] Branch if Minus
    PHA                     ; [48         ] Push Accumulator
    BVS $6CEE               ; [70 70      ] Branch if Overflow Set
    BRK                     ; [00 00      ] Software interrupt
    EOR $002C24,X           ; [5F 24 2C 00] XOR A with Absolute Long,X
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BPL $6C8C               ; [10 00      ] Branch if Plus
    ORA #$00                ; [09 00      ] OR A with Immediate
    ORA $310401             ; [0F 01 04 31] OR A with Absolute Long
    COP #$11                ; [02 11      ] Coprocessor interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 09      ] Software interrupt
    ASL $0D                 ; [06 0D      ] Shift Left DP
    COP #$09                ; [02 09      ] Coprocessor interrupt
    ORA [$11]               ; [07 11      ] OR A with [DP]
    ORA $22,S               ; [03 22      ] OR A with Stack Relative
    BRK                     ; [00 72      ] Software interrupt
    TRB $1825               ; [1C 25 18   ] Test and Reset Bits Absolute
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 06      ] Software interrupt
    BRK                     ; [00 06      ] Software interrupt
    ASL $07                 ; [06 07      ] Shift Left DP
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    ORA $2D                 ; [05 2D      ] OR A with Direct Page
    BIT $1818,X             ; [3C 18 18   ] Test Bits Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    EOR $002C24,X           ; [5F 24 2C 00] XOR A with Absolute Long,X
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BPL $6CCC               ; [10 00      ] Branch if Plus
    ORA #$00                ; [09 00      ] OR A with Immediate
    ASL $0401,X             ; [1E 01 04   ] Shift Left Absolute,X
    AND ($02),Y             ; [31 02      ] AND A with (DP),Y
    ORA ($08),Y             ; [11 08      ] OR A with (DP),Y
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 7C      ] Software interrupt
    CPX #$C4                ; [E0 C4      ] Compare X Immediate
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $6CFD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $6D45               ; [90 4C      ] Branch if Carry Clear
    BCC $6D07               ; [90 0C      ] Branch if Carry Clear
    BCC $6D05               ; [90 08      ] Branch if Carry Clear
    TRB $E0                 ; [14 E0      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    AND [$07]               ; [27 07      ] AND A with [DP]
    AND [$07]               ; [27 07      ] AND A with [DP]
    ORA $070901,X           ; [1F 01 09 07] OR A with Absolute Long,X
    TRB $08                 ; [14 08      ] Test and Reset Bits DP
    DEC                     ; [3A         ] Decrement Accumulator
    TSB $0C1B               ; [0C 1B 0C   ] Test and Set Bits Absolute
    TSB $1900               ; [0C 00 19   ] Test and Set Bits Absolute
    ASL $18                 ; [06 18      ] Shift Left DP
    ORA [$01]               ; [07 01      ] OR A with [DP]
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 0A      ] Software interrupt
    ORA #$15                ; [09 15      ] OR A with Immediate
    TRB $0C04               ; [1C 04 0C   ] Test and Reset Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    CPX #$60                ; [E0 60      ] Compare X Immediate
    BRA $6D05               ; [80 E0      ] Branch Always
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRA $6D49               ; [80 20      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    BVC $6D0C               ; [50 E0      ] Branch if Overflow Clear
    CPX #$40                ; [E0 40      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRA $6CB4               ; [80 80      ] Branch Always
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $6D38               ; [80 00      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    CPY #$A0                ; [C0 A0      ] Compare Y Immediate
    CPX #$80                ; [E0 80      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRA $6D47               ; [80 FC      ] Branch Always
    BRK                     ; [00 FA      ] Software interrupt
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRA $6D57               ; [80 00      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    JSR $5800               ; [20 00 58   ] Jump to Subroutine
    PHP                     ; [08         ] Push Processor Status
    MVN $04,$E8             ; [54 04 E8   ] Block Move Negative
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 E4      ] Software interrupt
    BRK                     ; [00 E4      ] Software interrupt
    JSR $307E               ; [20 7E 30   ] Jump to Subroutine
    STX $8E00               ; [8E 00 8E   ] Store X to Absolute
    BRA $6D0B               ; [80 9C      ] Branch Always
    BRA $6D35               ; [80 C4      ] Branch Always
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine
    BRA $6D8D               ; [80 18      ] Branch Always
    CPY #$18                ; [C0 18      ] Compare Y Immediate
    LDY #$00                ; [A0 00      ] Load Y Immediate
    BCS $6DDF               ; [B0 64      ] Branch if Carry Set
    BPL $6D5D               ; [10 E0      ] Branch if Plus
    TRB $C0                 ; [14 C0      ] Test and Reset Bits DP
    PLP                     ; [28         ] Pull Processor Status
    EOR #$07                ; [49 07      ] XOR A with Immediate
    JMP $3903               ; [4C 03 39   ] Jump Absolute
    ORA [$11]               ; [07 11      ] OR A with [DP]
    ORA $22,S               ; [03 22      ] OR A with Stack Relative
    BRK                     ; [00 72      ] Software interrupt
    TRB $1825               ; [1C 25 18   ] Test and Reset Bits Absolute
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 37      ] Software interrupt
    BRK                     ; [00 27      ] Software interrupt
    ORA [$07],Y             ; [17 07      ] OR A with [DP],Y
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    ORA $2D                 ; [05 2D      ] OR A with Direct Page
    BIT $1818,X             ; [3C 18 18   ] Test Bits Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    CPY #$30                ; [C0 30      ] Compare Y Immediate
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    CPY #$20                ; [C0 20      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    BVC $6D8C               ; [50 E0      ] Branch if Overflow Clear
    CPX #$40                ; [E0 40      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    LDY #$E0                ; [A0 E0      ] Load Y Immediate
    BRA $6D7E               ; [80 C0      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ASL $1201               ; [0E 01 12   ] Shift Left Absolute
    TSB $1C26               ; [0C 26 1C   ] Test and Set Bits Absolute
    AND $2302,X             ; [3D 02 23   ] AND A with Absolute,X
    ORA $5F2E57,X           ; [1F 57 2E 5F] OR A with Absolute Long,X
    BIT $00                 ; [24 00      ] Test Bits DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 0D      ] Software interrupt
    ORA ($1D,X)             ; [01 1D      ] OR A with (DP,X)
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    JSR $3104               ; [20 04 31   ] Jump to Subroutine
    BRA $6DE2               ; [80 00      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRA $6DE5               ; [80 FC      ] Branch Always
    BRK                     ; [00 FA      ] Software interrupt
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$FE                ; [C0 FE      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRA $6DF5               ; [80 00      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    JSR $5800               ; [20 00 58   ] Jump to Subroutine
    PHP                     ; [08         ] Push Processor Status
    MVN $04,$E8             ; [54 04 E8   ] Block Move Negative
    CPY $28                 ; [C4 28      ] Compare Y with DP
    BIT $3600               ; [2C 00 36   ] Test Bits Absolute
    TSB $54                 ; [04 54      ] Test and Set Bits in DP
    ASL $54                 ; [06 54      ] Shift Left DP
    ASL $70                 ; [06 70      ] Shift Left DP
    JSR $0029               ; [20 29 00   ] Jump to Subroutine
    ASL $01,X               ; [16 01      ] Shift Left DP,X
    ORA #$07                ; [09 07      ] OR A with Immediate
    COP #$11                ; [02 11      ] Coprocessor interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    AND ($0E,X)             ; [21 0E      ] AND A with (DP,X)
    AND ($06,X)             ; [21 06      ] AND A with (DP,X)
    BPL $6E1E               ; [10 01      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    ORA [$00]               ; [07 00      ] OR A with [DP]
    INC $CE00,X             ; [FE 00 CE   ] Increment Absolute,X
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    BMI $6DC7               ; [30 9E      ] Branch if Minus
    BRK                     ; [00 1C      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    CPY #$4C                ; [C0 4C      ] Compare Y Immediate
    BRA $6E57               ; [80 24      ] Branch Always
    BCC $6E59               ; [90 24      ] Branch if Carry Clear
    BCC $6E7B               ; [90 44      ] Branch if Carry Clear
    BMI $6E81               ; [30 48      ] Branch if Minus
    BIT $C8                 ; [24 C8      ] Test Bits DP
    JSR $4080               ; [20 80 40   ] Jump to Subroutine
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    TSB $0903               ; [0C 03 09   ] Test and Set Bits Absolute
    ORA [$0F]               ; [07 0F      ] OR A with [DP]
    ORA ($04,X)             ; [01 04      ] OR A with (DP,X)
    BRK                     ; [00 04      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA $07,S               ; [03 07      ] OR A with Stack Relative
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$07]               ; [07 07      ] OR A with [DP]
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    ORA $02,S               ; [03 02      ] OR A with Stack Relative
    COP #$00                ; [02 00      ] Coprocessor interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRA $6DE7               ; [80 80      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 06      ] Software interrupt
    BRK                     ; [00 09      ] Software interrupt
    COP #$1C                ; [02 1C      ] Coprocessor interrupt
    ORA ($2E,X)             ; [01 2E      ] OR A with (DP,X)
    CLC                     ; [18         ] Clear Carry Flag
    PHK                     ; [4B         ] Push Program Bank
    ROL $4B,X               ; [36 4B      ] Rotate Left DP,X
    ROL $57,X               ; [36 57      ] Rotate Left DP,X
    ROL $0000               ; [2E 00 00   ] Rotate Left Absolute
    BRK                     ; [00 00      ] Software interrupt
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    COP #$02                ; [02 02      ] Coprocessor interrupt
    ORA $3601,Y             ; [19 01 36   ] OR A with Absolute,Y
    BRK                     ; [00 36      ] Software interrupt
    BRK                     ; [00 2E      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    INX                     ; [E8         ] Increment X
    BPL $6EA1               ; [10 F8      ] Branch if Plus
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 B8      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    JSR ($0000,X)           ; [FC 00 00   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    CPX #$20                ; [E0 20      ] Compare X Immediate
    BVC $6EC9               ; [50 10      ] Branch if Overflow Clear
    RTS                     ; [60         ] Return from Subroutine
    BPL $6EDC               ; [10 20      ] Branch if Plus
    BCC $6EFE               ; [90 40      ] Branch if Carry Clear
    DEY                     ; [88         ] Decrement Y
    BVC $6EE7               ; [50 26      ] Branch if Overflow Clear
    TRB $285E               ; [1C 5E 28   ] Test and Reset Bits Absolute
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 31      ] Software interrupt
    BRK                     ; [00 1C      ] Software interrupt
    BRK                     ; [00 24      ] Software interrupt
    BRK                     ; [00 2E      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    CLC                     ; [18         ] Clear Carry Flag
    TRB $0901               ; [1C 01 09   ] Test and Reset Bits Absolute
    JSL $061423             ; [22 23 14 06] Jump to Subroutine Long
    PHP                     ; [08         ] Push Processor Status
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    BRK                     ; [00 11      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 1C      ] Software interrupt
    JSR ($7E00,X)           ; [FC 00 7E   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 7C      ] Software interrupt
    BRK                     ; [00 B8      ] Software interrupt
    JSR $20A4               ; [20 A4 20   ] Jump to Subroutine
    MVP $00,$F8             ; [44 00 F8   ] Block Move Positive
    RTI                     ; [40         ] Return from Interrupt
    PHA                     ; [48         ] Push Accumulator
    LDY #$28                ; [A0 28      ] Load Y Immediate
    CPY $50                 ; [C4 50      ] Compare Y with DP
    TSB $0890               ; [0C 90 08   ] Test and Set Bits Absolute
    RTI                     ; [40         ] Return from Interrupt
    JSR $2850               ; [20 50 28   ] Jump to Subroutine
    JSR $0098               ; [20 98 00   ] Jump to Subroutine
    RTI                     ; [40         ] Return from Interrupt
    ORA ($01,S),Y           ; [13 01      ] OR A with (SR),Y
    TSB $1101               ; [0C 01 11   ] Test and Set Bits Absolute
    ORA ($31,X)             ; [01 31      ] OR A with (DP,X)
    TSB $183E               ; [0C 3E 18   ] Test and Set Bits Absolute
    ORA $0100,Y             ; [19 00 01   ] OR A with Absolute,Y
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    COP #$0F                ; [02 0F      ] Coprocessor interrupt
    BRK                     ; [00 1C      ] Software interrupt
    ASL $1800,X             ; [1E 00 18   ] Shift Left Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    RTS                     ; [60         ] Return from Subroutine
    CLC                     ; [18         ] Clear Carry Flag
    BEQ $6F21               ; [F0 FC      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    INY                     ; [C8         ] Increment Y
    BRK                     ; [00 90      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    LDY #$C0                ; [A0 C0      ] Load Y Immediate
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    BRA $6F30               ; [80 00      ] Branch Always
    CPX #$80                ; [E0 80      ] Compare X Immediate
    BEQ $6F34               ; [F0 00      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 00      ] Software interrupt
    BMI $6F79               ; [30 40      ] Branch if Minus
    RTS                     ; [60         ] Return from Subroutine
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $146F42 (SNES $D46F42) ---
org $D46F42

    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ASL $1201               ; [0E 01 12   ] Shift Left Absolute
    TSB $1C26               ; [0C 26 1C   ] Test and Set Bits Absolute
    AND $2302,X             ; [3D 02 23   ] AND A with Absolute,X
    ORA $002E57,X           ; [1F 57 2E 00] OR A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 0D      ] Software interrupt
    ORA ($1D,X)             ; [01 1D      ] OR A with (DP,X)
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    JSR $0000               ; [20 00 00   ] Jump to Subroutine
    BRA $6F64               ; [80 00      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRA $6F67               ; [80 FC      ] Branch Always
    BRK                     ; [00 FA      ] Software interrupt
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRA $6F77               ; [80 00      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    JSR $5800               ; [20 00 58   ] Jump to Subroutine
    PHP                     ; [08         ] Push Processor Status
    MVN $04,$E8             ; [54 04 E8   ] Block Move Negative
    EOR $002424,X           ; [5F 24 24 00] XOR A with Absolute Long,X
    BPL $6F86               ; [10 00      ] Branch if Plus
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    ASL $00,X               ; [16 00      ] Shift Left DP,X
    BPL $6F8C               ; [10 00      ] Branch if Plus
    ORA $1300               ; [0D 00 13   ] OR A with Absolute
    BRK                     ; [00 05      ] Software interrupt
    BMI $6F9D               ; [30 0A      ] Branch if Minus
    ORA ($0E),Y             ; [11 0E      ] OR A with (DP),Y
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 08      ] Software interrupt
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    COP #$08                ; [02 08      ] Coprocessor interrupt
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 6C      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $6FBD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $6FD5               ; [90 1C      ] Branch if Carry Clear
    BRA $7007               ; [80 4C      ] Branch Always
    BPL $6F85               ; [10 C8      ] Branch if Plus
    TSB $90                 ; [04 90      ] Test and Set Bits in DP
    RTS                     ; [60         ] Return from Subroutine
    EOR $002424,X           ; [5F 24 24 00] XOR A with Absolute Long,X
    BPL $6FC6               ; [10 00      ] Branch if Plus
    BPL $6FC8               ; [10 00      ] Branch if Plus
    ASL $00,X               ; [16 00      ] Shift Left DP,X
    BPL $6FCC               ; [10 00      ] Branch if Plus
    ORA $1300               ; [0D 00 13   ] OR A with Absolute
    BRK                     ; [00 05      ] Software interrupt
    BMI $6FDD               ; [30 0A      ] Branch if Minus
    ORA ($0E),Y             ; [11 0E      ] OR A with (DP),Y
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    COP #$08                ; [02 08      ] Coprocessor interrupt
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 6C      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $6FFD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $7015               ; [90 1C      ] Branch if Carry Clear
    BRA $7047               ; [80 4C      ] Branch Always
    BPL $6FC5               ; [10 C8      ] Branch if Plus
    TSB $90                 ; [04 90      ] Test and Set Bits in DP
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    ASL $03                 ; [06 03      ] Shift Left DP
    ROR $F107,X             ; [7E 07 F1   ] Rotate Right Absolute,X
    db $7F, $FC, $43            ; Incomplete/data bytes

;--- Patch at file offset $147017 (SNES $D47017) ---
org $D47017

    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    COP #$07                ; [02 07      ] Coprocessor interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BVS $7062               ; [70 43      ] Branch if Overflow Set
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 A0      ] Software interrupt
    CPY #$3C                ; [C0 3C      ] Compare Y Immediate
    CPX #$36                ; [E0 36      ] Compare X Immediate
    INX                     ; [E8         ] Increment X
    INC $7CD8               ; [EE D8 7C   ] Increment Absolute
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    BRA $7019               ; [80 E0      ] Branch Always
    BRK                     ; [00 E4      ] Software interrupt
    TSB $C8                 ; [04 C8      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    CLD                     ; [D8         ] Clear Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    SBC [$41],Y             ; [F7 41      ] Subtract with Borrow [DP],Y
    ADC $7720,X             ; [7D 20 77   ] Add with Carry Absolute,X
    BIT $34                 ; [24 34      ] Test Bits DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $31                 ; [06 31      ] Shift Left DP
    ORA ($68,X)             ; [01 68      ] OR A with (DP,X)
    AND ($6E),Y             ; [31 6E      ] AND A with (DP),Y
    ORA $1C41,Y             ; [19 41 1C   ] OR A with Absolute,Y
    JSR $2812               ; [20 12 28   ] Jump to Subroutine
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0F,X)             ; [01 0F      ] OR A with (DP,X)
    BRK                     ; [00 37      ] Software interrupt
    BRK                     ; [00 19      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    INX                     ; [E8         ] Increment X
    CPX $F4F8               ; [EC F8 F4   ] Compare X with Absolute
    PHP                     ; [08         ] Push Processor Status
    TSX                     ; [BA         ] Transfer Stack Pointer to X
    TSB $BE                 ; [04 BE      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    JSR ($1800,X)           ; [FC 00 18   ] Jump to Subroutine Indirect,X
    BEQ $703B               ; [F0 CC      ] Branch if Equal
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BPL $706B               ; [10 F8      ] Branch if Plus
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 44      ] Software interrupt
    BRA $70C1               ; [80 48      ] Branch Always
    LDY #$00                ; [A0 00      ] Load Y Immediate
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    JSR $0E97               ; [20 97 0E   ] Jump to Subroutine
    STA $00,X               ; [95 00      ] Store A to DP,X

;--- Patch at file offset $14708A (SNES $D4708A) ---
org $D4708A

    EOR $BD0B,X             ; [5D 0B BD   ] XOR A with Absolute,X
    ORA #$FF                ; [09 FF      ] OR A with Immediate
    CLC                     ; [18         ] Clear Carry Flag
    ROR $4A00               ; [6E 00 4A   ] Rotate Right Absolute

;--- Patch at file offset $14709A (SNES $D4709A) ---
org $D4709A

    PLD                     ; [2B         ] Pull Direct Page Register
    AND $4B,S               ; [23 4B      ] AND A with Stack Relative
    EOR $18,S               ; [43 18      ] XOR A with Stack Relative
    BRK                     ; [00 2C      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BIT $08                 ; [24 08      ] Test Bits DP
    CPX $08                 ; [E4 08      ] Compare X with DP
    CPX $C8                 ; [E4 C8      ] Compare X with DP
    CPX $08                 ; [E4 08      ] Compare X with DP
    INC $4C                 ; [E6 4C      ] Increment DP
    INC $44,X               ; [F6 44      ] Increment DP,X
    INC $D860,X             ; [FE 60 D8   ] Increment Absolute,X
    BPL $708B               ; [10 D8      ] Branch if Plus
    BPL $70CD               ; [10 18      ] Branch if Plus
    BPL $708F               ; [10 D8      ] Branch if Plus
    BPL $70D1               ; [10 18      ] Branch if Plus
    BPL $7117               ; [10 5C      ] Branch if Plus
    BPL $7109               ; [10 4C      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA $7E,S               ; [03 7E      ] OR A with Stack Relative
    ORA [$F1]               ; [07 F1      ] OR A with [DP]
    db $7F, $FC, $43            ; Incomplete/data bytes

;--- Patch at file offset $1470D7 (SNES $D470D7) ---
org $D470D7

    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    COP #$07                ; [02 07      ] Coprocessor interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BVS $7122               ; [70 43      ] Branch if Overflow Set
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 A0      ] Software interrupt
    CPY #$3C                ; [C0 3C      ] Compare Y Immediate
    CPX #$36                ; [E0 36      ] Compare X Immediate
    INX                     ; [E8         ] Increment X
    INC $7CD8               ; [EE D8 7C   ] Increment Absolute
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    BRA $70D9               ; [80 E0      ] Branch Always
    BRK                     ; [00 E4      ] Software interrupt
    TSB $C8                 ; [04 C8      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    CLD                     ; [D8         ] Clear Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    SBC [$41],Y             ; [F7 41      ] Subtract with Borrow [DP],Y
    ADC ($20,S),Y           ; [73 20      ] Add with Carry (SR),Y
    ADC $3422,X             ; [7D 22 34   ] Add with Carry Absolute,X
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $31                 ; [06 31      ] Shift Left DP
    BRK                     ; [00 3E      ] Software interrupt
    BPL $7177               ; [10 68      ] Branch if Plus
    BIT $1C41,X             ; [3C 41 1C   ] Test Bits Absolute,X
    JSR $201C               ; [20 1C 20   ] Jump to Subroutine
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 11      ] Software interrupt
    BRK                     ; [00 3F      ] Software interrupt
    COP #$3C                ; [02 3C      ] Coprocessor interrupt
    INX                     ; [E8         ] Increment X
    CPX $F478               ; [EC 78 F4   ] Compare X with Absolute
    PHP                     ; [08         ] Push Processor Status
    DEX                     ; [CA         ] Decrement X
    TSB $CE                 ; [04 CE      ] Test and Set Bits in DP
    BRK                     ; [00 FC      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    JMP $CC38               ; [4C 38 CC   ] Jump Absolute
    SEC                     ; [38         ] Set Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BPL $71AB               ; [10 78      ] Branch if Plus
    BRK                     ; [00 08      ] Software interrupt
    BRA $715B               ; [80 24      ] Branch Always
    BCC $7169               ; [90 30      ] Branch if Carry Clear
    BRA $7173               ; [80 38      ] Branch Always
    BRK                     ; [00 B8      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    BRK                     ; [00 71      ] Software interrupt
    BIT $3862,X             ; [3C 62 38   ] Test Bits Absolute,X
    EOR $38,S               ; [43 38      ] XOR A with Stack Relative
    STY $73                 ; [84 73      ] Store Y to DP
    INY                     ; [C8         ] Increment Y
    RTS                     ; [60         ] Return from Subroutine
    STA $06B30E,X           ; [9F 0E B3 06] Store A to Absolute Long,X
    INC $3E00               ; [EE 00 3E   ] Increment Absolute
    COP #$3D                ; [02 3D      ] Coprocessor interrupt
    ORA $3C                 ; [05 3C      ] OR A with Direct Page
    TSB $7B                 ; [04 7B      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    STZ $13,X               ; [74 13      ] Store Zero to DP,X

;--- Patch at file offset $147160 (SNES $D47160) ---
org $D47160

    JML [$78B8]             ; [DC B8 78   ] Jump Long Indirect
    BPL $7159               ; [10 F4      ] Branch if Plus
    RTI                     ; [40         ] Return from Interrupt
    SBC ($C0)               ; [F2 C0      ] Subtract with Borrow (DP)
    DEC                     ; [3A         ] Decrement Accumulator
    BRK                     ; [00 FA      ] Software interrupt
    CPX #$1A                ; [E0 1A      ] Compare X Immediate
    JSR $00EC               ; [20 EC 00   ] Jump to Subroutine
    CLV                     ; [B8         ] Clear Overflow Flag
    BRK                     ; [00 90      ] Software interrupt
    BRA $71BD               ; [80 48      ] Branch Always
    PHP                     ; [08         ] Push Processor Status
    CPY $C40C               ; [CC 0C C4   ] Compare Y with Absolute
    TSB $E4                 ; [04 E4      ] Test and Set Bits in DP
    CPX $E4                 ; [E4 E4      ] Compare X with DP
    CPX $00                 ; [E4 00      ] Compare X with DP
    BRK                     ; [00 95      ] Software interrupt
    ASL $0095               ; [0E 95 00   ] Shift Left Absolute

;--- Patch at file offset $14718A (SNES $D4718A) ---
org $D4718A

    LSR                     ; [4A         ] Shift Right Accumulator
    CLC                     ; [18         ] Clear Carry Flag
    LDA $FD18               ; [AD 18 FD   ] Load A from Absolute
    BRK                     ; [00 6E      ] Software interrupt
    BRK                     ; [00 4A      ] Software interrupt

;--- Patch at file offset $14719A (SNES $D4719A) ---
org $D4719A

    AND $583C,Y             ; [39 3C 58   ] AND A with Absolute,Y
    CLI                     ; [58         ] Clear Interrupt Disable
    BRK                     ; [00 00      ] Software interrupt
    BIT $08                 ; [24 08      ] Test Bits DP
    BIT $08                 ; [24 08      ] Test Bits DP
    CPX $08                 ; [E4 08      ] Compare X with DP
    CPX $C8                 ; [E4 C8      ] Compare X with DP
    ROR $4C                 ; [66 4C      ] Rotate Right DP
    LDA ($E4)               ; [B2 E4      ] Load A from (DP)
    DEC                     ; [3A         ] Decrement Accumulator
    RTI                     ; [40         ] Return from Interrupt
    INC $D810,X             ; [FE 10 D8   ] Increment Absolute,X
    BPL $718B               ; [10 D8      ] Branch if Plus
    BPL $71CD               ; [10 18      ] Branch if Plus
    BPL $718F               ; [10 D8      ] Branch if Plus
    BPL $7215               ; [10 5C      ] Branch if Plus
    BNE $71A7               ; [D0 EC      ] Branch if Not Equal
    INX                     ; [E8         ] Increment X
    CPY $C4                 ; [C4 C4      ] Compare Y with DP
    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $1471CC (SNES $D471CC) ---
org $D471CC

    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)

;--- Patch at file offset $1471DF (SNES $D471DF) ---
org $D471DF

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $1471EC (SNES $D471EC) ---
org $D471EC

    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 D0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $1471FC (SNES $D471FC) ---
org $D471FC

    BRK                     ; [00 00      ] Software interrupt
    JSR $3F40               ; [20 40 3F   ] Jump to Subroutine
    ORA $78                 ; [05 78      ] OR A with Direct Page
    AND $7B217E,X           ; [3F 7E 21 7B] AND A with Absolute Long,X
    JSR $207C               ; [20 7C 20   ] Jump to Subroutine
    AND ($10)               ; [32 10      ] AND A with (DP)
    ROL $1A10,X             ; [3E 10 1A   ] Rotate Left Absolute,X
    ASL $04                 ; [06 04      ] Shift Left DP
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    SEC                     ; [38         ] Set Carry Flag
    AND ($00,X)             ; [21 00      ] AND A with (DP,X)
    JSR $200E               ; [20 0E 20   ] Jump to Subroutine
    ORA $110C11             ; [0F 11 0C 11] OR A with Absolute Long
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 9C      ] Software interrupt
    BEQ $72A1               ; [F0 7E      ] Branch if Equal
    CPX $36                 ; [E4 36      ] Compare X with DP
    INX                     ; [E8         ] Increment X
    DEC $6674,X             ; [DE 74 66   ] Decrement Absolute,X
    SEC                     ; [38         ] Set Carry Flag
    LDX $1C,Y               ; [B6 1C      ] Load X from DP,Y
    PLX                     ; [FA         ] Pull X Register
    TSB $9D                 ; [04 9D      ] Test and Set Bits in DP
    REP #$70                ; [C2 70      ] Reset Processor Status Bits
    BRA $721F               ; [80 EC      ] Branch Always
    TSB $04E4               ; [0C E4 04   ] Test and Set Bits Absolute
    JMP ($3808,X)           ; [7C 08 38   ] Jump Indirect,X
    BRA $7257               ; [80 1C      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    COP #$30                ; [02 30      ] Coprocessor interrupt
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL $08                 ; [06 08      ] Shift Left DP
    BRK                     ; [00 14      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($04,S),Y           ; [13 04      ] OR A with (SR),Y
    AND $034A10,X           ; [3F 10 4A 03] AND A with Absolute Long,X
    LSR                     ; [4A         ] Shift Right Accumulator
    ORA $7F,S               ; [03 7F      ] OR A with Stack Relative
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 0B      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BPL $725A               ; [10 00      ] Branch if Plus
    AND [$03],Y             ; [37 03      ] AND A with [DP],Y
    AND $17,S               ; [23 17      ] AND A with Stack Relative
    BRK                     ; [00 00      ] Software interrupt
    STA $487CC4             ; [8F C4 7C 48] Store A to Absolute Long
    STY $C678               ; [8C 78 C6   ] Store Y to Absolute
    STZ $0CA2               ; [9C A2 0C   ] Store Zero to Absolute
    SEP #$4C                ; [E2 4C      ] Set Processor Status Bits
    LDA ($60),Y             ; [B1 60      ] Load A from (DP),Y
    SBC $201400,X           ; [FF 00 14 20] Subtract with Borrow Absolute Long,X
    INY                     ; [C8         ] Increment Y
    BRK                     ; [00 78      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    JSR $501C               ; [20 1C 50   ] Jump to Subroutine
    JML $6E6E50             ; [5C 50 6E 6E] Jump Long
    BRK                     ; [00 00      ] Software interrupt
    SBC [$41],Y             ; [F7 41      ] Subtract with Borrow [DP],Y
    ADC $7720,X             ; [7D 20 77   ] Add with Carry Absolute,X
    BIT $34                 ; [24 34      ] Test Bits DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $11                 ; [06 11      ] Shift Left DP
    ORA ($38,X)             ; [01 38      ] OR A with (DP,X)
    ORA ($2E),Y             ; [11 2E      ] OR A with (DP),Y
    ORA $1C41,Y             ; [19 41 1C   ] OR A with Absolute,Y
    JSR $2812               ; [20 12 28   ] Jump to Subroutine
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0F,X)             ; [01 0F      ] OR A with (DP,X)
    BRK                     ; [00 17      ] Software interrupt
    BRK                     ; [00 19      ] Software interrupt
    BRK                     ; [00 25      ] Software interrupt
    ASL $0015               ; [0E 15 00   ] Shift Left Absolute
    ASL                     ; [0A         ] Shift Left Accumulator
    TSB $11                 ; [04 11      ] Test and Set Bits in DP
    ASL $1032               ; [0E 32 10   ] Shift Left Absolute
    LSR                     ; [4A         ] Shift Right Accumulator
    CLC                     ; [18         ] Clear Carry Flag
    ADC $003D18             ; [6F 18 3D 00] Add with Carry Absolute Long
    ASL $0A10,X             ; [1E 10 0A   ] Shift Left Absolute,X

;--- Patch at file offset $1472BA (SNES $D472BA) ---
org $D472BA

    AND $183C,Y             ; [39 3C 18   ] AND A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    SBC [$41],Y             ; [F7 41      ] Subtract with Borrow [DP],Y
    ADC $7720,X             ; [7D 20 77   ] Add with Carry Absolute,X
    BIT $34                 ; [24 34      ] Test Bits DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $11                 ; [06 11      ] Shift Left DP
    ORA ($3A,X)             ; [01 3A      ] OR A with (DP,X)
    ORA ($1C),Y             ; [11 1C      ] OR A with (DP),Y
    BRK                     ; [00 41      ] Software interrupt
    TRB $1220               ; [1C 20 12   ] Test and Reset Bits Absolute
    PLP                     ; [28         ] Pull Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0F,X)             ; [01 0F      ] OR A with (DP,X)
    BRK                     ; [00 15      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA $3C,S               ; [03 3C      ] OR A with Stack Relative
    INX                     ; [E8         ] Increment X
    CPX $F4F8               ; [EC F8 F4   ] Compare X with Absolute
    PHP                     ; [08         ] Push Processor Status
    TSX                     ; [BA         ] Transfer Stack Pointer to X
    TSB $BE                 ; [04 BE      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    JSR ($7800,X)           ; [FC 00 78   ] Jump to Subroutine Indirect,X
    CPY #$3C                ; [C0 3C      ] Compare Y Immediate
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BPL $72EB               ; [10 F8      ] Branch if Plus
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 44      ] Software interrupt
    BRA $7341               ; [80 48      ] Branch Always
    LDY #$00                ; [A0 00      ] Load Y Immediate
    BPL $72CD               ; [10 D0      ] Branch if Plus
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 24      ] Software interrupt
    ASL $27                 ; [06 27      ] Shift Left DP
    ASL $1F                 ; [06 1F      ] Shift Left DP
    BRK                     ; [00 11      ] Software interrupt
    ORA $4A1032             ; [0F 32 10 4A] OR A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    ADC $003D18             ; [6F 18 3D 00] Add with Carry Absolute Long
    db $1F, $01, $1E            ; Incomplete/data bytes

;--- Patch at file offset $14731A (SNES $D4731A) ---
org $D4731A

    AND $183C,Y             ; [39 3C 18   ] AND A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    BIT $1860,X             ; [3C 60 18   ] Test Bits Absolute,X
    BVS $7331               ; [70 0C      ] Branch if Overflow Set
    SEC                     ; [38         ] Set Carry Flag
    STY $6608               ; [8C 08 66   ] Store Y to Absolute
    TRB $ECB2               ; [1C B2 EC   ] Test and Reset Bits Absolute
    ROL $FC44,X             ; [3E 44 FC   ] Rotate Left Absolute,X
    BPL $7319               ; [10 E8      ] Branch if Plus
    BRA $7323               ; [80 F0      ] Branch Always
    BRA $732D               ; [80 F8      ] Branch Always
    CPY #$78                ; [C0 78      ] Compare Y Immediate
    BVS $7345               ; [70 0C      ] Branch if Overflow Set
    BCC $731F               ; [90 E4      ] Branch if Carry Clear
    INX                     ; [E8         ] Increment X
    CPY $C0                 ; [C4 C0      ] Compare Y with DP
    BPL $7340               ; [10 00      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    LDY #$C0                ; [A0 C0      ] Load Y Immediate
    BIT $36E0,X             ; [3C E0 36   ] Test Bits Absolute,X
    INX                     ; [E8         ] Increment X
    INC $7CD8               ; [EE D8 7C   ] Increment Absolute
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    BRA $7339               ; [80 E0      ] Branch Always
    BRK                     ; [00 E4      ] Software interrupt
    TSB $C8                 ; [04 C8      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    CLD                     ; [D8         ] Clear Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    BIT $ACE8,X             ; [3C E8 AC   ] Test Bits Absolute,X
    BEQ $7357               ; [F0 F2      ] Branch if Equal
    RTS                     ; [60         ] Return from Subroutine
    SBC ($00)               ; [F2 00      ] Subtract with Borrow (DP)
    JSR ($DC10,X)           ; [FC 10 DC   ] Jump to Subroutine Indirect,X
    SEC                     ; [38         ] Set Carry Flag
    STY $9878               ; [8C 78 98   ] Store Y to Absolute
    BVS $7369               ; [70 F8      ] Branch if Overflow Set
    BPL $7363               ; [10 F0      ] Branch if Plus
    BRK                     ; [00 6C      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    BRA $7389               ; [80 10      ] Branch Always
    BRA $73B3               ; [80 38      ] Branch Always
    BRK                     ; [00 78      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 94      ] Software interrupt
    ASL $0095               ; [0E 95 00   ] Shift Left Absolute
    PLY                     ; [7A         ] Pull Y Register
    ORA $10                 ; [05 10      ] OR A with Direct Page
    ORA $4A1032             ; [0F 32 10 4A] OR A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    LDA $F918               ; [AD 18 F9   ] Load A from Absolute
    BRK                     ; [00 6F      ] Software interrupt
    ORA ($4A,X)             ; [01 4A      ] OR A with (DP,X)
    ROL                     ; [2A         ] Rotate Left Accumulator
    ORA $00                 ; [05 00      ] OR A with Direct Page
    AND $1D1020             ; [2F 20 10 1D] AND A with Absolute Long
    AND $583C,Y             ; [39 3C 58   ] AND A with Absolute,Y
    CLI                     ; [58         ] Clear Interrupt Disable
    BRK                     ; [00 00      ] Software interrupt
    LDY $60,X               ; [B4 60      ] Load Y from DP,X
    PEA $7480               ; [F4 80 74   ] Push Effective Absolute
    CPY #$F4                ; [C0 F4      ] Compare Y Immediate
    CPY #$72                ; [C0 72      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    TSX                     ; [BA         ] Transfer Stack Pointer to X
    CPX #$3A                ; [E0 3A      ] Compare X Immediate
    PHA                     ; [48         ] Push Accumulator
    INC $00                 ; [E6 00      ] Increment DP
    PLA                     ; [68         ] Pull Accumulator
    PHP                     ; [08         ] Push Processor Status
    DEY                     ; [88         ] Decrement Y
    PHP                     ; [08         ] Push Processor Status
    INY                     ; [C8         ] Increment Y
    PHP                     ; [08         ] Push Processor Status
    INY                     ; [C8         ] Increment Y
    PHP                     ; [08         ] Push Processor Status
    JMP $E4CC               ; [4C CC E4   ] Jump Absolute
    CPX $CC                 ; [E4 CC      ] Compare X with DP
    CPY $00                 ; [C4 00      ] Compare Y with DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA $7E,S               ; [03 7E      ] OR A with Stack Relative
    ORA [$F1]               ; [07 F1      ] OR A with [DP]
    ADC $F743FC,X           ; [7F FC 43 F7] Add with Carry Absolute Long,X
    EOR ($00,X)             ; [41 00      ] XOR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    db $02                      ; Incomplete/data bytes

;--- Patch at file offset $1473DE (SNES $D473DE) ---
org $D473DE

    EOR ($1C,X)             ; [41 1C      ] XOR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    LDY #$C0                ; [A0 C0      ] Load Y Immediate
    BIT $36E0,X             ; [3C E0 36   ] Test Bits Absolute,X
    INX                     ; [E8         ] Increment X
    INC $7CD8               ; [EE D8 7C   ] Increment Absolute
    CPY #$3C                ; [C0 3C      ] Compare Y Immediate
    INX                     ; [E8         ] Increment X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRA $73D7               ; [80 E0      ] Branch Always
    BRK                     ; [00 E4      ] Software interrupt
    TSB $C8                 ; [04 C8      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    CLD                     ; [D8         ] Clear Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BPL $747E               ; [10 7D      ] Branch if Plus
    JSR $2476               ; [20 76 24   ] Jump to Subroutine
    STZ $06,X               ; [74 06      ] Store Zero to DP,X
    MVN $06,$51             ; [54 06 51   ] Block Move Negative
    AND ($68,X)             ; [21 68      ] AND A with (DP,X)
    AND ($2E,X)             ; [21 2E      ] AND A with (DP,X)
    PHP                     ; [08         ] Push Processor Status
    AND $0E                 ; [25 0E      ] AND A with Direct Page
    JSL $012810             ; [22 10 28 01] Jump to Subroutine Long
    PHP                     ; [08         ] Push Processor Status
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($2F,X)             ; [01 2F      ] OR A with (DP,X)
    BRK                     ; [00 37      ] Software interrupt
    BPL $7436               ; [10 19      ] Branch if Plus
    ORA ($1E),Y             ; [11 1E      ] OR A with (DP),Y
    BPL $73DD               ; [10 BC      ] Branch if Plus
    CPX #$E4                ; [E0 E4      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    ROR $00                 ; [66 00      ] Rotate Right DP
    ROR $FC20,X             ; [7E 20 FC   ] Rotate Right Absolute,X
    BMI $73C3               ; [30 98      ] Branch if Minus
    BVS $73C5               ; [70 98      ] Branch if Overflow Set
    BVS $73E7               ; [70 B8      ] Branch if Overflow Set
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    BRK                     ; [00 50      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BPL $73BE               ; [10 88      ] Branch if Plus
    JSR $3080               ; [20 80 30   ] Jump to Subroutine
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 35      ] Software interrupt
    BRK                     ; [00 3A      ] Software interrupt
    ORA $30                 ; [05 30      ] OR A with Direct Page
    ORA $2D002C             ; [0F 2C 00 2D] OR A with Absolute Long
    ORA $5D,S               ; [03 5D      ] OR A with Stack Relative
    ASL                     ; [0A         ] Shift Left Accumulator
    ADC $00                 ; [65 00      ] Add with Carry DP
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA $00                 ; [05 00      ] OR A with Direct Page
    ORA $111200             ; [0F 00 12 11] OR A with Absolute Long
    ORA ($13,S),Y           ; [13 13      ] OR A with (SR),Y
    ROL                     ; [2A         ] Rotate Left Accumulator
    JSL $000202             ; [22 02 02 00] Jump to Subroutine Long
    BRK                     ; [00 E8      ] Software interrupt
    CPY #$E8                ; [C0 E8      ] Compare Y Immediate
    CPY #$E4                ; [C0 E4      ] Compare Y Immediate
    INY                     ; [C8         ] Increment Y
    CPX $08                 ; [E4 08      ] Compare X with DP
    PEA $B460               ; [F4 60 B4   ] Push Effective Absolute
    JSR $0008               ; [20 08 00   ] Jump to Subroutine
    BRK                     ; [00 00      ] Software interrupt
    BNE $7482               ; [D0 10      ] Branch if Not Equal
    BNE $7484               ; [D0 10      ] Branch if Not Equal
    CLD                     ; [D8         ] Clear Decimal Flag
    BPL $748F               ; [10 18      ] Branch if Plus
    BPL $74E1               ; [10 68      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    PLP                     ; [28         ] Pull Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    COP #$01                ; [02 01      ] Coprocessor interrupt
    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    ORA $073F03             ; [0F 03 3F 07] OR A with Absolute Long
    SEI                     ; [78         ] Set Interrupt Disable
    AND $000000,X           ; [3F 00 00 00] AND A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    ORA [$07]               ; [07 07      ] OR A with [DP]
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPX $00                 ; [E4 00      ] Compare X with DP
    TSX                     ; [BA         ] Transfer Stack Pointer to X
    CPX $16                 ; [E4 16      ] Compare X with DP
    CPX $E09C               ; [EC 9C E0   ] Compare X with Absolute
    ROL $FCE0,X             ; [3E E0 FC   ] Rotate Left Absolute,X
    BEQ $74B1               ; [F0 00      ] Branch if Equal
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    BRA $749D               ; [80 E4      ] Branch Always
    TSB $E8                 ; [04 E8      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    CPX $F00C               ; [EC 0C F0   ] Compare X with Absolute
    BRK                     ; [00 5F      ] Software interrupt
    JSR $183C               ; [20 3C 18   ] Jump to Subroutine
    TRB $1E08               ; [1C 08 1E   ] Test and Reset Bits Absolute
    BRK                     ; [00 25      ] Software interrupt
    BRK                     ; [00 24      ] Software interrupt
    BRK                     ; [00 1E      ] Software interrupt
    TSB $0E1B               ; [0C 1B 0E   ] Test and Set Bits Absolute
    JSR $1B00               ; [20 00 1B   ] Jump to Subroutine
    TSB $0B                 ; [04 0B      ] Test and Set Bits in DP
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 12      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    BRK                     ; [00 0D      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    BRK                     ; [00 E6      ] Software interrupt
    TRB $0E1B               ; [1C 1B 0E   ] Test and Reset Bits Absolute
    AND $4F06               ; [2D 06 4F   ] AND A with Absolute
    COP #$1E                ; [02 1E      ] Coprocessor interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 E6      ] Software interrupt
    BIT $4E83,X             ; [3C 83 4E   ] Test Bits Absolute,X
    TRB $8E00               ; [1C 00 8E   ] Test and Reset Bits Absolute
    RTS                     ; [60         ] Return from Subroutine
    STX $40,Y               ; [96 40      ] Store X to DP,Y
    STA ($20)               ; [92 20      ] Store A to (DP)
    DEY                     ; [88         ] Decrement Y
    RTS                     ; [60         ] Return from Subroutine
    BRA $753C               ; [80 40      ] Branch Always
    BIT $7E00,X             ; [3C 00 7E   ] Test Bits Absolute,X
    BMI $752B               ; [30 2A      ] Branch if Minus
    TSB $2F                 ; [04 2F      ] Test and Set Bits in DP
    BRK                     ; [00 54      ] Software interrupt
    TSB $56                 ; [04 56      ] Test and Set Bits in DP
    ASL $005F               ; [0E 5F 00   ] Shift Left Absolute
    EOR ($00),Y             ; [51 00      ] XOR A with (DP),Y
    ADC ($00,X)             ; [61 00      ] Add with Carry (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    ORA $11,X               ; [15 11      ] OR A with DP,X
    BPL $7524               ; [10 10      ] Branch if Plus
    ROL $2E2D               ; [2E 2D 2E   ] Rotate Left Absolute
    AND $202020             ; [2F 20 20 20] AND A with Absolute Long
    JSR $0000               ; [20 00 00   ] Jump to Subroutine
    BRK                     ; [00 00      ] Software interrupt
    LDA ($06,S),Y           ; [B3 06      ] Load A from (SR),Y
    PHK                     ; [4B         ] Push Program Bank
    BRL $F7F1               ; [82 CB 82   ] Branch Long
    TYX                     ; [BB         ] Transfer Y to X
    COP #$92                ; [02 92      ] Coprocessor interrupt
    STY $76                 ; [84 76      ] Store Y to DP
    MVP $E4,$08             ; [44 E4 08   ] Block Move Positive
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 4E      ] Software interrupt
    PHA                     ; [48         ] Push Accumulator
    LDX $04,Y               ; [B6 04      ] Load X from DP,Y
    LDX $14                 ; [A6 14      ] Load X from DP
    LSR $04                 ; [46 04      ] Shift Right DP
    STY $CCE8               ; [8C E8 CC   ] Store Y to Absolute
    INY                     ; [C8         ] Increment Y
    CLC                     ; [18         ] Clear Carry Flag
    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $147544 (SNES $D47544) ---
org $D47544

    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    ASL $03                 ; [06 03      ] Shift Left DP
    ADC $7FF007,X           ; [7F 07 F0 7F] Add with Carry Absolute Long,X
    db $FE, $43                 ; Incomplete/data bytes

;--- Patch at file offset $147557 (SNES $D47557) ---
org $D47557

    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    COP #$07                ; [02 07      ] Coprocessor interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BVS $75A2               ; [70 43      ] Branch if Overflow Set
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 A0      ] Software interrupt
    CPY #$3C                ; [C0 3C      ] Compare Y Immediate
    CPX #$36                ; [E0 36      ] Compare X Immediate
    INX                     ; [E8         ] Increment X
    INC $7CD8               ; [EE D8 7C   ] Increment Absolute
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    BRA $7559               ; [80 E0      ] Branch Always
    BRK                     ; [00 E4      ] Software interrupt
    TSB $C8                 ; [04 C8      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    CLD                     ; [D8         ] Clear Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    SBC [$41],Y             ; [F7 41      ] Subtract with Borrow [DP],Y
    db $71                      ; Incomplete/data bytes

;--- Patch at file offset $14758A (SNES $D4758A) ---
org $D4758A

    AND ($00)               ; [32 00      ] AND A with (DP)
    ROR $4E30               ; [6E 30 4E   ] Rotate Right Absolute
    BIT $1C41,X             ; [3C 41 1C   ] Test Bits Absolute,X
    ROL $2E10               ; [2E 10 2E   ] Rotate Left Absolute
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($0D,X)             ; [01 0D      ] OR A with (DP,X)
    BRK                     ; [00 31      ] Software interrupt
    BRK                     ; [00 3D      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    INX                     ; [E8         ] Increment X
    CPX $7438               ; [EC 38 74   ] Compare X with Absolute
    PHP                     ; [08         ] Push Processor Status
    PHX                     ; [DA         ] Push X Register
    TSB $087E               ; [0C 7E 08   ] Test and Set Bits Absolute
    LDY $B800,X             ; [BC 00 B8   ] Load Y from Absolute,X
    BPL $753B               ; [10 8C      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BPL $75EB               ; [10 38      ] Branch if Plus
    BRK                     ; [00 08      ] Software interrupt
    BRA $75E3               ; [80 2C      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    PHP                     ; [08         ] Push Processor Status
    BRA $75FB               ; [80 40      ] Branch Always
    BRK                     ; [00 50      ] Software interrupt
    BRK                     ; [00 78      ] Software interrupt
    BRK                     ; [00 F7      ] Software interrupt
    EOR ($71,X)             ; [41 71      ] XOR A with (DP,X)

;--- Patch at file offset $1475CA (SNES $D475CA) ---
org $D475CA

    ROL $00,X               ; [36 00      ] Rotate Left DP,X
    ROR $4E30               ; [6E 30 4E   ] Rotate Right Absolute
    BIT $1C41,X             ; [3C 41 1C   ] Test Bits Absolute,X
    ROL $2E10               ; [2E 10 2E   ] Rotate Left Absolute
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($09,X)             ; [01 09      ] OR A with (DP,X)
    BRK                     ; [00 31      ] Software interrupt
    BRK                     ; [00 3D      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    INX                     ; [E8         ] Increment X
    CPX $7438               ; [EC 38 74   ] Compare X with Absolute
    PHP                     ; [08         ] Push Processor Status
    PHX                     ; [DA         ] Push X Register
    TSB $087E               ; [0C 7E 08   ] Test and Set Bits Absolute
    LDY $B800,X             ; [BC 00 B8   ] Load Y from Absolute,X
    BPL $757B               ; [10 8C      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BPL $762B               ; [10 38      ] Branch if Plus
    BRK                     ; [00 08      ] Software interrupt
    BRA $7623               ; [80 2C      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    PHP                     ; [08         ] Push Processor Status
    BRA $763B               ; [80 40      ] Branch Always
    BRK                     ; [00 50      ] Software interrupt
    BRK                     ; [00 78      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    BRK                     ; [00 19      ] Software interrupt
    ASL $27                 ; [06 27      ] Shift Left DP
    CLC                     ; [18         ] Clear Carry Flag
    AND $215810             ; [2F 10 58 21] AND A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $764F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BVS $75E6               ; [70 C0      ] Branch if Overflow Set
    PHA                     ; [48         ] Push Accumulator
    BCS $7601               ; [B0 D8      ] Branch if Carry Set
    BMI $761F               ; [30 F4      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 B0      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    PHA                     ; [48         ] Push Accumulator
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $10                 ; [06 10      ] Shift Left DP
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 36      ] Software interrupt
    ORA #$06                ; [09 06      ] OR A with Immediate
    AND $1102,Y             ; [39 02 11   ] AND A with Absolute,Y
    ORA #$00                ; [09 00      ] OR A with Immediate
    ORA #$00                ; [09 00      ] OR A with Immediate
    ORA #$00                ; [09 00      ] OR A with Immediate
    ASL $0601               ; [0E 01 06   ] Shift Left Absolute
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    LDY #$EC                ; [A0 EC      ] Load Y Immediate
    BPL $7635               ; [10 C4      ] Branch if Plus
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $767D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $76D5               ; [90 5C      ] Branch if Carry Clear
    BRA $7687               ; [80 0C      ] Branch Always
    BCC $7645               ; [90 C8      ] Branch if Carry Clear
    STZ $30                 ; [64 30      ] Store Zero to DP
    BMI $76C2               ; [30 41      ] Branch if Minus
    ASL $004F               ; [0E 4F 00   ] Shift Left Absolute
    AND $0C07,Y             ; [39 07 0C   ] AND A with Absolute,Y
    ORA [$0B]               ; [07 0B      ] OR A with [DP]
    ORA $07                 ; [05 07      ] OR A with Direct Page
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 26      ] Software interrupt
    ASL $07,X               ; [16 07      ] Shift Left DP,X
    BRK                     ; [00 07      ] Software interrupt
    ORA $06,S               ; [03 06      ] OR A with Stack Relative
    ORA [$02]               ; [07 02      ] OR A with [DP]
    ORA $02,S               ; [03 02      ] OR A with Stack Relative
    COP #$00                ; [02 00      ] Coprocessor interrupt
    BRK                     ; [00 28      ] Software interrupt
    BPL $76CB               ; [10 28      ] Branch if Plus
    BMI $7695               ; [30 F0      ] Branch if Minus
    BRK                     ; [00 40      ] Software interrupt
    BRA $7629               ; [80 80      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BMI $7683               ; [30 D0      ] Branch if Minus
    BMI $76B5               ; [30 00      ] Branch if Minus
    BRK                     ; [00 80      ] Software interrupt
    BRA $76B9               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    BRK                     ; [00 0C      ] Software interrupt
    ORA $13,S               ; [03 13      ] OR A with Stack Relative
    TSB $102F               ; [0C 2F 10   ] Test and Set Bits Absolute
    BIT $0010               ; [2C 10 00   ] Test Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    TSB $130C               ; [0C 0C 13   ] Test and Set Bits Absolute
    PHP                     ; [08         ] Push Processor Status
    ORA [$00],Y             ; [17 00      ] OR A with [DP],Y
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    CPY #$E4                ; [C0 E4      ] Compare Y Immediate
    CLI                     ; [58         ] Clear Interrupt Disable
    PLX                     ; [FA         ] Pull X Register
    TSB $FA                 ; [04 FA      ] Test and Set Bits in DP
    TSB $DE                 ; [04 DE      ] Test and Set Bits in DP
    JSR $C03E               ; [20 3E C0   ] Jump to Subroutine
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    CLC                     ; [18         ] Clear Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    STY $C8                 ; [84 C8      ] Store Y to DP
    BIT $C4                 ; [24 C4      ] Test Bits DP
    PLP                     ; [28         ] Pull Processor Status
    BIT $D0                 ; [24 D0      ] Test Bits DP
    PLP                     ; [28         ] Pull Processor Status
    BPL $771C               ; [10 19      ] Branch if Plus
    BRK                     ; [00 1E      ] Software interrupt
    ORA ($0A,X)             ; [01 0A      ] OR A with (DP,X)
    ORA $0A,S               ; [03 0A      ] OR A with Stack Relative
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    BRK                     ; [00 1E      ] Software interrupt
    BRK                     ; [00 39      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    TRB $0806               ; [1C 06 08   ] Test and Reset Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    ORA [$00]               ; [07 00      ] OR A with [DP]
    BRK                     ; [00 01      ] Software interrupt
    ASL $FC18,X             ; [1E 18 FC   ] Shift Left Absolute,X
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 4C      ] Software interrupt
    BRK                     ; [00 CC      ] Software interrupt
    BRK                     ; [00 F4      ] Software interrupt
    DEY                     ; [88         ] Decrement Y
    RTI                     ; [40         ] Return from Interrupt
    BCS $76D3               ; [B0 A0      ] Branch if Carry Set
    BVC $76B9               ; [50 84      ] Branch if Overflow Clear
    PLA                     ; [68         ] Pull Accumulator
    STY $8860               ; [8C 60 88   ] Store Y to Absolute
    MVP $30,$80             ; [44 30 80   ] Block Move Positive
    SEC                     ; [38         ] Set Carry Flag
    PHP                     ; [08         ] Push Processor Status
    CLV                     ; [B8         ] Clear Overflow Flag
    SEC                     ; [38         ] Set Carry Flag
    ADC $7F01,Y             ; [79 01 7F   ] Add with Carry Absolute,Y
    SEC                     ; [38         ] Set Carry Flag
    BIT $1F07,X             ; [3C 07 1F   ] Test Bits Absolute,X
    ORA $3B,S               ; [03 3B      ] OR A with Stack Relative
    TSB $3B                 ; [04 3B      ] Test and Set Bits in DP
    TSB $34                 ; [04 34      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 3D      ] Software interrupt
    DEC                     ; [3A         ] Decrement Accumulator
    ORA ($39,X)             ; [01 39      ] OR A with (DP,X)
    ORA [$00]               ; [07 00      ] OR A with [DP]
    PHD                     ; [0B         ] Push Direct Page Register
    PHP                     ; [08         ] Push Processor Status
    ORA $1C1D,X             ; [1D 1D 1C   ] OR A with Absolute,X
    TRB $1818               ; [1C 18 18   ] Test and Reset Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    CPX $D8                 ; [E4 D8      ] Compare X with DP
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 60      ] Software interrupt
    CPY #$90                ; [C0 90      ] Compare Y Immediate
    CPX #$50                ; [E0 50      ] Compare X Immediate
    LDY #$E8                ; [A0 E8      ] Load Y Immediate
    BPL $7735               ; [10 C8      ] Branch if Plus
    BMI $77E7               ; [30 78      ] Branch if Minus
    BRK                     ; [00 D8      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    BRA $76F4               ; [80 80      ] Branch Always
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    CPX #$F0                ; [E0 F0      ] Compare X Immediate
    BEQ $77AD               ; [F0 30      ] Branch if Equal
    BMI $777F               ; [30 00      ] Branch if Minus
    BRK                     ; [00 93      ] Software interrupt
    ASL $009F               ; [0E 9F 00   ] Shift Left Absolute
    ADC #$07                ; [69 07      ] Add with Carry Immediate
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    ORA $6B0D32             ; [0F 32 0D 6B] OR A with Absolute Long
    TRB $35                 ; [14 35      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 7E      ] Software interrupt
    BPL $77D9               ; [10 46      ] Branch if Plus
    ROL $07                 ; [26 07      ] Rotate Left DP
    BRK                     ; [00 07      ] Software interrupt
    TSB $1D1D               ; [0C 1D 1D   ] Test and Set Bits Absolute
    AND $083D,X             ; [3D 3D 08   ] AND A with Absolute,X
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    BPL $77CB               ; [10 28      ] Branch if Plus
    BMI $7795               ; [30 F0      ] Branch if Minus
    BRK                     ; [00 60      ] Software interrupt
    CPY #$A0                ; [C0 A0      ] Compare Y Immediate
    CPY #$D0                ; [C0 D0      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    CPX #$40                ; [E0 40      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPX #$30                ; [E0 30      ] Compare X Immediate
    BNE $77E4               ; [D0 30      ] Branch if Not Equal
    BRK                     ; [00 00      ] Software interrupt
    BRA $7778               ; [80 C0      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    CPY #$A0                ; [C0 A0      ] Compare Y Immediate
    CPX #$80                ; [E0 80      ] Compare X Immediate
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $1477C6 (SNES $D477C6) ---
org $D477C6

    BRK                     ; [00 00      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA $03                 ; [05 03      ] OR A with Direct Page
    ORA $02                 ; [05 02      ] OR A with Direct Page
    db $0F, $00                 ; Incomplete/data bytes

;--- Patch at file offset $1477D8 (SNES $D477D8) ---
org $D477D8

    BRK                     ; [00 00      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    COP #$00                ; [02 00      ] Coprocessor interrupt
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $1477E6 (SNES $D477E6) ---
org $D477E6

    BRK                     ; [00 00      ] Software interrupt
    BVS $77EA               ; [70 00      ] Branch if Overflow Set
    DEY                     ; [88         ] Decrement Y
    BVS $7821               ; [70 34      ] Branch if Overflow Set
    INY                     ; [C8         ] Increment Y
    db $7E, $C0                 ; Incomplete/data bytes

;--- Patch at file offset $1477F8 (SNES $D477F8) ---
org $D477F8

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    BNE $7806               ; [D0 08      ] Branch if Not Equal
    CLD                     ; [D8         ] Clear Decimal Flag
    TSB $33                 ; [04 33      ] Test and Set Bits in DP
    TSB $215E               ; [0C 5E 21   ] Test and Set Bits Absolute
    LDA $40B140,X           ; [BF 40 B1 40] Load A from Absolute Long,X
    CPX #$00                ; [E0 00      ] Compare X Immediate
    LSR                     ; [4A         ] Shift Right Accumulator
    BRK                     ; [00 3B      ] Software interrupt
    BRK                     ; [00 32      ] Software interrupt
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    COP #$0D                ; [02 0D      ] Coprocessor interrupt
    ASL $3121,X             ; [1E 21 31   ] Shift Left Absolute,X
    LSR $7F00               ; [4E 00 7F   ] Shift Right Absolute
    LSR $1431               ; [4E 31 14   ] Shift Right Absolute
    AND ($04,X)             ; [21 04      ] AND A with (DP,X)
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    CPY #$FC                ; [C0 FC      ] Compare Y Immediate
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    TSB $D8                 ; [04 D8      ] Test and Set Bits in DP
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    CPX $28C0               ; [EC C0 28   ] Compare X with Absolute
    BRK                     ; [00 E8      ] Software interrupt
    PLA                     ; [68         ] Pull Accumulator
    BRA $7849               ; [80 0C      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    JMP $7290               ; [4C 90 72   ] Jump Absolute
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    CPX #$00                ; [E0 00      ] Compare X Immediate
    SBC ($20),Y             ; [F1 20      ] Subtract with Borrow (DP),Y
    SBC $0E7320,X           ; [FF 20 73 0E] Subtract with Borrow Absolute Long,X
    TDC                     ; [7B         ] Transfer Direct Page to A
    ASL $0CB3,X             ; [1E B3 0C   ] Shift Left Absolute,X
    SBC $000400,X           ; [FF 00 04 00] Subtract with Borrow Absolute Long,X
    LSR $4C41,X             ; [5E 41 4C   ] Shift Right Absolute,X
    PER $D999               ; [62 41 61   ] Push Effective Relative
    AND $1D0721             ; [2F 21 07 1D] AND A with Absolute Long
    JML $00001C             ; [5C 1C 00 00] Jump Long
    JMP ($9C00,X)           ; [7C 00 9C   ] Jump Indirect,X
    BRK                     ; [00 D4      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    CPX $18                 ; [E4 18      ] Compare X with DP
    CLV                     ; [B8         ] Clear Overflow Flag
    CPY #$A0                ; [C0 A0      ] Compare Y Immediate
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    BEQ $7870               ; [F0 00      ] Branch if Equal
    PHP                     ; [08         ] Push Processor Status
    BRA $78E3               ; [80 70      ] Branch Always
    BPL $78AD               ; [10 38      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    TYA                     ; [98         ] Transfer Y to A
    TYA                     ; [98         ] Transfer Y to A
    RTI                     ; [40         ] Return from Interrupt
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 51      ] Software interrupt
    JSR $003C               ; [20 3C 00   ] Jump to Subroutine
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BPL $788C               ; [10 00      ] Branch if Plus
    ORA #$00                ; [09 00      ] OR A with Immediate
    ORA $390601             ; [0F 01 06 39] OR A with Absolute Long
    COP #$11                ; [02 11      ] Coprocessor interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($04,X)             ; [01 04      ] OR A with (DP,X)
    COP #$01                ; [02 01      ] Coprocessor interrupt
    BRK                     ; [00 13      ] Software interrupt
    ASL $000F               ; [0E 0F 00   ] Shift Left Absolute
    ORA #$07                ; [09 07      ] OR A with Immediate
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    ORA $6B0D32             ; [0F 32 0D 6B] OR A with Absolute Long
    TRB $35                 ; [14 35      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 0E      ] Software interrupt
    BRK                     ; [00 06      ] Software interrupt
    ASL $07                 ; [06 07      ] Shift Left DP
    BRK                     ; [00 07      ] Software interrupt
    TSB $1D1D               ; [0C 1D 1D   ] Test and Set Bits Absolute
    AND $083D,X             ; [3D 3D 08   ] AND A with Absolute,X
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $11                 ; [06 11      ] Shift Left DP
    BRK                     ; [00 0A      ] Software interrupt
    ORA ($1F,X)             ; [01 1F      ] OR A with (DP,X)
    BRK                     ; [00 06      ] Software interrupt
    AND $1102,Y             ; [39 02 11   ] AND A with Absolute,Y
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 05      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA $FE,S               ; [03 FE      ] OR A with Stack Relative
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    CPY #$AC                ; [C0 AC      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $78FD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $7955               ; [90 5C      ] Branch if Carry Clear
    BRA $7907               ; [80 0C      ] Branch Always
    BPL $78C5               ; [10 C8      ] Branch if Plus
    MVP $C0,$C0             ; [44 C0 C0   ] Block Move Positive
    AND [$01]               ; [27 01      ] AND A with [DP]
    AND [$02]               ; [27 02      ] AND A with [DP]
    ORA $0F1B01,X           ; [1F 01 1B 0F] OR A with Absolute Long,X
    AND ($0D)               ; [32 0D      ] AND A with (DP)
    RTL                     ; [6B         ] Return from Subroutine Long
    TRB $35                 ; [14 35      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 1E      ] Software interrupt
    ORA [$1C]               ; [07 1C      ] OR A with [DP]
    ASL $01                 ; [06 01      ] Shift Left DP
    BRK                     ; [00 07      ] Software interrupt
    TSB $1D1D               ; [0C 1D 1D   ] Test and Set Bits Absolute
    AND $083D,X             ; [3D 3D 08   ] AND A with Absolute,X
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    LDY #$C0                ; [A0 C0      ] Load Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    BRA $7905               ; [80 E0      ] Branch Always
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    BRA $78C9               ; [80 A0      ] Branch Always
    CPY #$D0                ; [C0 D0      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    LDY #$40                ; [A0 40      ] Load Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    BRA $78F5               ; [80 C0      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRA $7979               ; [80 40      ] Branch Always
    CPY #$A0                ; [C0 A0      ] Compare Y Immediate
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    CPY #$48                ; [C0 48      ] Compare Y Immediate
    BCS $7921               ; [B0 D8      ] Branch if Carry Set
    BMI $793F               ; [30 F4      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 B0      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    PHA                     ; [48         ] Push Accumulator
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 E4      ] Software interrupt
    BRK                     ; [00 A4      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BPL $795B               ; [10 EE      ] Branch if Plus
    BMI $794B               ; [30 DC      ] Branch if Minus
    JSR $28C4               ; [20 C4 28   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BRA $798D               ; [80 18      ] Branch Always
    CPY #$58                ; [C0 58      ] Compare Y Immediate
    BRA $79A9               ; [80 30      ] Branch Always
    BCS $79DF               ; [B0 64      ] Branch if Carry Set
    BVS $794D               ; [70 D0      ] Branch if Overflow Set
    PEA $E8E0               ; [F4 E0 E8   ] Push Effective Absolute
    STA ($1F),Y             ; [91 1F      ] Store A to (DP),Y
    STA $076900,X           ; [9F 00 69 07] Store A to Absolute Long,X
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    ORA $6B0D3A             ; [0F 3A 0D 6B] OR A with Absolute Long
    TRB $35                 ; [14 35      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 6F      ] Software interrupt
    BPL $79DA               ; [10 47      ] Branch if Plus
    AND [$07]               ; [27 07      ] AND A with [DP]
    BRK                     ; [00 07      ] Software interrupt
    TSB $1D15               ; [0C 15 1D   ] Test and Set Bits Absolute
    AND $083D,X             ; [3D 3D 08   ] AND A with Absolute,X
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    BRA $7A13               ; [80 70      ] Branch Always
    BRA $7985               ; [80 E0      ] Branch Always
    CPY #$60                ; [C0 60      ] Compare Y Immediate
    BRA $7949               ; [80 A0      ] Branch Always
    CPY #$90                ; [C0 90      ] Compare Y Immediate
    CPX #$A0                ; [E0 A0      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    BRA $7954               ; [80 A0      ] Branch Always
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $7938               ; [80 80      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    CPY #$60                ; [C0 60      ] Compare Y Immediate
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    BRK                     ; [00 19      ] Software interrupt
    ASL $27                 ; [06 27      ] Shift Left DP
    CLC                     ; [18         ] Clear Carry Flag
    AND $215810             ; [2F 10 58 21] AND A with Absolute Long
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $7A0D               ; [10 2F      ] Branch if Plus
    ASL $39                 ; [06 39      ] Shift Left DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BVS $79A4               ; [70 C0      ] Branch if Overflow Set
    PHA                     ; [48         ] Push Accumulator
    BCS $79BB               ; [B0 D4      ] Branch if Carry Set
    SEC                     ; [38         ] Set Carry Flag
    PLX                     ; [FA         ] Pull X Register
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    BRK                     ; [00 3E      ] Software interrupt
    CPY #$FE                ; [C0 FE      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 B0      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    DEY                     ; [88         ] Decrement Y
    MVP $C8,$14             ; [44 C8 14   ] Block Move Positive
    BRK                     ; [00 EC      ] Software interrupt
    CPY $28                 ; [C4 28      ] Compare Y with DP
    BIT $3600,X             ; [3C 00 36   ] Test Bits Absolute,X
    TSB $54                 ; [04 54      ] Test and Set Bits in DP
    ASL $54                 ; [06 54      ] Shift Left DP
    ASL $70                 ; [06 70      ] Shift Left DP
    BRK                     ; [00 39      ] Software interrupt
    BPL $7A4B               ; [10 3E      ] Branch if Plus
    ORA ($11),Y             ; [11 11      ] OR A with (DP),Y
    ORA $081102             ; [0F 02 11 08] OR A with Absolute Long
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    AND ($2E,X)             ; [21 2E      ] AND A with (DP,X)
    AND ($04,X)             ; [21 04      ] AND A with (DP,X)
    ORA ($01)               ; [12 01      ] OR A with (DP)
    BPL $7A2E               ; [10 0F      ] Branch if Plus
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    JSR $20FC               ; [20 FC 20   ] Jump to Subroutine
    SED                     ; [F8         ] Set Decimal Flag
    LDY #$E0                ; [A0 E0      ] Load Y Immediate
    CPY #$44                ; [C0 44      ] Compare Y Immediate
    DEY                     ; [88         ] Decrement Y
    BIT $90                 ; [24 90      ] Test Bits DP
    BIT $90                 ; [24 90      ] Test Bits DP
    JMP ($4860)             ; [6C 60 48   ] Jump Indirect
    STZ $C8                 ; [64 C8      ] Store Zero to DP
    CPX #$40                ; [E0 40      ] Compare X Immediate
    CPX #$80                ; [E0 80      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    ORA $070901             ; [0F 01 09 07] OR A with Absolute Long
    ORA $061907             ; [0F 07 19 06] OR A with Absolute Long
    AND $0A,X               ; [35 0A      ] AND A with DP,X
    INC                     ; [1A         ] Increment Accumulator
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 06      ] Software interrupt
    ORA [$07]               ; [07 07      ] OR A with [DP]
    BRK                     ; [00 03      ] Software interrupt
    TSB $0E                 ; [04 0E      ] Test and Set Bits in DP
    ASL $1E1E               ; [0E 1E 1E   ] Shift Left Absolute
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRA $7A43               ; [80 E0      ] Branch Always
    CPY #$B0                ; [C0 B0      ] Compare Y Immediate
    CPY #$50                ; [C0 50      ] Compare Y Immediate
    CPX #$C8                ; [E0 C8      ] Compare X Immediate
    BVS $7A3B               ; [70 D0      ] Branch if Overflow Set
    JSR $0060               ; [20 60 00   ] Jump to Subroutine
    BRK                     ; [00 00      ] Software interrupt
    BRA $79F2               ; [80 80      ] Branch Always
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    CPY #$A0                ; [C0 A0      ] Compare Y Immediate
    CPX #$B0                ; [E0 B0      ] Compare X Immediate
    BEQ $7ADB               ; [F0 60      ] Branch if Equal
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    INC                     ; [1A         ] Increment Accumulator
    BRK                     ; [00 2D      ] Software interrupt
    INC                     ; [1A         ] Increment Accumulator
    AND $3F12               ; [2D 12 3F   ] AND A with Absolute
    BRK                     ; [00 4F      ] Software interrupt
    BMI $7AE6               ; [30 59      ] Branch if Minus
    ROL $BE                 ; [26 BE      ] Rotate Left DP
    EOR ($00,X)             ; [41 00      ] XOR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 1A      ] Software interrupt
    BRK                     ; [00 12      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    ORA ($0F,X)             ; [01 0F      ] OR A with (DP,X)
    BMI $7AB6               ; [30 19      ] Branch if Minus
    ROL $30                 ; [26 30      ] Rotate Left DP
    EOR $E00000             ; [4F 00 00 E0] XOR A with Absolute Long
    BRK                     ; [00 90      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    INX                     ; [E8         ] Increment X
    BPL $7AA1               ; [10 F8      ] Branch if Plus
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 7C      ] Software interrupt
    BRA $7AAD               ; [80 FE      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPX #$10                ; [E0 10      ] Compare X Immediate
    BMI $7AFA               ; [30 40      ] Branch if Minus
    BPL $7A5C               ; [10 A0      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    BNE $7A47               ; [D0 88      ] Branch if Not Equal
    MVN $B1,$40             ; [54 B1 40   ] Block Move Negative
    BVS $7AC4               ; [70 00      ] Branch if Overflow Set
    JSR $B100               ; [20 00 B1   ] Jump to Subroutine
    BRK                     ; [00 AA      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    JSR $103B               ; [20 3B 10   ] Jump to Subroutine
    ASL $0109,X             ; [1E 09 01   ] Shift Left Absolute,X
    ROR $110E,X             ; [7E 0E 11   ] Rotate Right Absolute,X
    ASL $4E01,X             ; [1E 01 4E   ] Shift Left Absolute,X
    BRK                     ; [00 15      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    ORA $100420             ; [0F 20 04 10] OR A with Absolute Long
    ORA #$00                ; [09 00      ] OR A with Immediate
    INC $F200,X             ; [FE 00 F2   ] Increment Absolute,X
    BRK                     ; [00 B2      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    JMP ($B808,X)           ; [7C 08 B8   ] Jump Indirect,X
    BVC $7B5D               ; [50 70      ] Branch if Overflow Clear
    CPX #$D0                ; [E0 D0      ] Compare X Immediate
    LDY #$80                ; [A0 80      ] Load Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    PHP                     ; [08         ] Push Processor Status
    CPX $5C                 ; [E4 5C      ] Compare X with DP
    BCC $7B07               ; [90 10      ] Branch if Carry Clear
    TYA                     ; [98         ] Transfer Y to A
    BMI $7AB2               ; [30 B8      ] Branch if Minus
    RTS                     ; [60         ] Return from Subroutine
    BMI $7ADD               ; [30 E0      ] Branch if Minus
    BRK                     ; [00 E0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    ORA $051A00             ; [0F 00 1A 05] OR A with Absolute Long
    AND $047B12,X           ; [3F 12 7B 04] AND A with Absolute Long,X
    ADC $013E08,X           ; [7F 08 3E 01] Add with Carry Absolute Long,X
    ORA [$00]               ; [07 00      ] OR A with [DP]
    BRK                     ; [00 00      ] Software interrupt
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    ORA $04                 ; [05 04      ] OR A with Direct Page
    TSB $3D1E               ; [0C 1E 3D   ] Test and Set Bits Absolute
    db $3D, $31                 ; Incomplete/data bytes

;--- Patch at file offset $147B20 (SNES $D47B20) ---
org $D47B20

    BEQ $7B42               ; [F0 20      ] Branch if Equal
    SEI                     ; [78         ] Set Interrupt Disable
    BEQ $7ACD               ; [F0 A8      ] Branch if Equal
    BVS $7AB7               ; [70 90      ] Branch if Overflow Set
    RTS                     ; [60         ] Return from Subroutine
    LDY #$C0                ; [A0 C0      ] Load Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPY #$30                ; [C0 30      ] Compare Y Immediate
    BVC $7BA6               ; [50 70      ] Branch if Overflow Clear
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $147B44 (SNES $D47B44) ---
org $D47B44

    BRK                     ; [00 01      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $215810             ; [2F 10 58 21] AND A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $7B8F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BVS $7B26               ; [70 C0      ] Branch if Overflow Set
    PHA                     ; [48         ] Push Accumulator
    BCS $7B41               ; [B0 D8      ] Branch if Carry Set
    BMI $7B5F               ; [30 F4      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    PLX                     ; [FA         ] Pull X Register
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 B0      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    PHA                     ; [48         ] Push Accumulator
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BMI $7B84               ; [30 00      ] Branch if Minus
    BPL $7B86               ; [10 00      ] Branch if Plus
    ORA ($00)               ; [12 00      ] OR A with (DP)
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    BPL $7B8C               ; [10 00      ] Branch if Plus
    ASL $3900,X             ; [1E 00 39   ] Shift Left Absolute,X
    BRK                     ; [00 06      ] Software interrupt
    AND $110E,Y             ; [39 0E 11   ] AND A with Absolute,Y
    ASL $0C01               ; [0E 01 0C   ] Shift Left Absolute
    ORA ($0A,X)             ; [01 0A      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA ($1E,X)             ; [01 1E      ] OR A with (DP,X)
    CLC                     ; [18         ] Clear Carry Flag
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 6E      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 F4      ] Software interrupt
    DEY                     ; [88         ] Decrement Y
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $7BBD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $7C05               ; [90 4C      ] Branch if Carry Clear
    BRA $7BBF               ; [80 04      ] Branch Always
    BCC $7BBD               ; [90 00      ] Branch if Carry Clear
    BIT $B8,X               ; [34 B8      ] Test Bits DP,X
    SEC                     ; [38         ] Set Carry Flag
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BMI $7BC4               ; [30 00      ] Branch if Minus
    BPL $7BC6               ; [10 00      ] Branch if Plus
    ORA ($00)               ; [12 00      ] OR A with (DP)
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    BPL $7BCC               ; [10 00      ] Branch if Plus
    ASL $3900,X             ; [1E 00 39   ] Shift Left Absolute,X
    BRK                     ; [00 06      ] Software interrupt
    AND $110E,Y             ; [39 0E 11   ] AND A with Absolute,Y
    ASL $0C01               ; [0E 01 0C   ] Shift Left Absolute
    ORA ($0A,X)             ; [01 0A      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA ($1E,X)             ; [01 1E      ] OR A with (DP,X)
    CLC                     ; [18         ] Clear Carry Flag
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 6E      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 F4      ] Software interrupt
    DEY                     ; [88         ] Decrement Y
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $7BFD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $7C45               ; [90 4C      ] Branch if Carry Clear
    BRA $7BFF               ; [80 04      ] Branch Always
    BCC $7BFD               ; [90 00      ] Branch if Carry Clear
    BIT $B8,X               ; [34 B8      ] Test Bits DP,X
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $3F5110             ; [2F 10 51 3F] AND A with Absolute Long

;--- Patch at file offset $147C16 (SNES $D47C16) ---
org $D47C16

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    ORA $000020,X           ; [1F 20 00 00] OR A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
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
    EOR $003C2E,X           ; [5F 2E 3C 00] XOR A with Absolute Long,X
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BIT $06,X               ; [34 06      ] Test Bits DP,X
    BVS $7C6D               ; [70 21      ] Branch if Overflow Set
    EOR $7F11,Y             ; [59 11 7F   ] XOR A with Absolute,Y
    ORA #$0E                ; [09 0E      ] OR A with Immediate
    AND ($00),Y             ; [31 00      ] AND A with (DP),Y
    ORA ($08,S),Y           ; [13 08      ] OR A with (SR),Y
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($2F,X)             ; [01 2F      ] OR A with (DP,X)
    BRK                     ; [00 37      ] Software interrupt
    JSR $1019               ; [20 19 10   ] Jump to Subroutine
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 DC      ] Software interrupt
    BMI $7C59               ; [30 EC      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    JML [$E418]             ; [DC 18 E4   ] Jump Long Indirect
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $7C7D               ; [80 08      ] Branch Always
    CPX #$40                ; [E0 40      ] Compare X Immediate
    TYA                     ; [98         ] Transfer Y to A
    RTI                     ; [40         ] Return from Interrupt
    STY $0030               ; [8C 30 00   ] Store Y to Absolute
    SED                     ; [F8         ] Set Decimal Flag
    CPY #$38                ; [C0 38      ] Compare Y Immediate
    JSR $0C92               ; [20 92 0C   ] Jump to Subroutine
    TXS                     ; [9A         ] Transfer X to Stack Pointer
    BRK                     ; [00 69      ] Software interrupt
    ORA [$0A]               ; [07 0A      ] OR A with [DP]
    ORA $05                 ; [05 05      ] OR A with Direct Page
    BRK                     ; [00 06      ] Software interrupt
    COP #$05                ; [02 05      ] Coprocessor interrupt
    ORA $07,S               ; [03 07      ] OR A with Stack Relative
    BRK                     ; [00 6D      ] Software interrupt
    BRK                     ; [00 45      ] Software interrupt
    BIT $07                 ; [24 07      ] Test Bits DP
    BRK                     ; [00 05      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 6C      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CLI                     ; [58         ] Clear Interrupt Disable
    RTI                     ; [40         ] Return from Interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    BRA $7C2B               ; [80 80      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 98      ] Software interrupt
    CLI                     ; [58         ] Clear Interrupt Disable
    BRA $7D14               ; [80 60      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRA $7CB8               ; [80 00      ] Branch Always
    BRA $7CBA               ; [80 00      ] Branch Always
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $147CC4 (SNES $D47CC4) ---
org $D47CC4

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $3F5110             ; [2F 10 51 3F] AND A with Absolute Long

;--- Patch at file offset $147CD6 (SNES $D47CD6) ---
org $D47CD6

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    ORA $000020,X           ; [1F 20 00 00] OR A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
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
    EOR $00322E,X           ; [5F 2E 32 00] XOR A with Absolute Long,X
    TRB $1402               ; [1C 02 14   ] Test and Reset Bits Absolute
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $30                 ; [06 30      ] Shift Left DP
    BRK                     ; [00 69      ] Software interrupt
    AND ($57,X)             ; [21 57      ] AND A with (DP,X)
    BRK                     ; [00 0E      ] Software interrupt
    AND ($00),Y             ; [31 00      ] AND A with (DP),Y
    ORA $0100,X             ; [1D 00 01   ] OR A with Absolute,X
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($37,X)             ; [01 37      ] OR A with (DP,X)
    BPL $7D47               ; [10 28      ] Branch if Plus
    JSR $00FE               ; [20 FE 00   ] Jump to Subroutine
    JSR ($FC00,X)           ; [FC 00 FC   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 9E      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    STY $00,X               ; [94 00      ] Store Y to DP,X
    CPX $60                 ; [E4 60      ] Compare X with DP
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $7D3D               ; [80 08      ] Branch Always
    CPX #$40                ; [E0 40      ] Compare X Immediate
    TYA                     ; [98         ] Transfer Y to A
    BPL $7CC6               ; [10 8C      ] Branch if Plus
    JMP $4820               ; [4C 20 48   ] Jump Absolute
    PLP                     ; [28         ] Pull Processor Status
    PHP                     ; [08         ] Push Processor Status
    SEI                     ; [78         ] Set Interrupt Disable
    STZ $04,X               ; [74 04      ] Store Zero to DP,X
    BIT $04,X               ; [34 04      ] Test Bits DP,X
    ORA $020B01             ; [0F 01 0B 02] OR A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    PHP                     ; [08         ] Push Processor Status
    ORA $0C,X               ; [15 0C      ] OR A with DP,X
    ROL $1C                 ; [26 1C      ] Rotate Left DP
    BIT $2B00,X             ; [3C 00 2B   ] Test Bits Absolute,X
    BIT $01                 ; [24 01      ] Test Bits DP
    ASL $0001               ; [0E 01 00   ] Shift Left Absolute
    ASL $00                 ; [06 00      ] Shift Left DP
    ASL $0C01               ; [0E 01 0C   ] Shift Left Absolute
    COP #$1C                ; [02 1C      ] Coprocessor interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 8C      ] Software interrupt
    BRK                     ; [00 D8      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BCS $7D4C               ; [B0 E0      ] Branch if Carry Set
    BCC $7DCE               ; [90 60      ] Branch if Carry Clear
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 68      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    JSR $0000               ; [20 00 00   ] Jump to Subroutine
    BRK                     ; [00 80      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 4D      ] Software interrupt
    ASL $4D                 ; [06 4D      ] Shift Left DP
    BRK                     ; [00 34      ] Software interrupt
    ORA $0B,S               ; [03 0B      ] OR A with Stack Relative
    ASL $18                 ; [06 18      ] Shift Left DP
    PHP                     ; [08         ] Push Processor Status
    AND $1C                 ; [25 1C      ] AND A with Direct Page
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 36      ] Software interrupt
    BRK                     ; [00 22      ] Software interrupt
    ORA ($03)               ; [12 03      ] OR A with (DP)
    BRK                     ; [00 06      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($1C,X)             ; [01 1C      ] OR A with (DP,X)
    COP #$04                ; [02 04      ] Coprocessor interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 36      ] Software interrupt
    JSR $202C               ; [20 2C 20   ] Jump to Subroutine
    BEQ $7DA6               ; [F0 00      ] Branch if Equal
    RTS                     ; [60         ] Return from Subroutine
    CPY #$B0                ; [C0 B0      ] Compare Y Immediate
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $147DB0 (SNES $D47DB0) ---
org $D47DB0

    CPY $C02C               ; [CC 2C C0   ] Compare Y with Absolute
    BMI $7DB5               ; [30 00      ] Branch if Minus
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    BRK                     ; [00 B0      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $147DC8 (SNES $D47DC8) ---
org $D47DC8

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA [$00]               ; [07 00      ] OR A with [DP]

;--- Patch at file offset $147DDA (SNES $D47DDA) ---
org $D47DDA

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $147DEA (SNES $D47DEA) ---
org $D47DEA

    CLV                     ; [B8         ] Clear Overflow Flag
    BRK                     ; [00 44      ] Software interrupt
    CLV                     ; [B8         ] Clear Overflow Flag
    PLX                     ; [FA         ] Pull X Register
    db $44                      ; Incomplete/data bytes

;--- Patch at file offset $147DFB (SNES $D47DFB) ---
org $D47DFB

    BRK                     ; [00 80      ] Software interrupt
    CLV                     ; [B8         ] Clear Overflow Flag
    PHP                     ; [08         ] Push Processor Status
    MVN $19,$06             ; [54 19 06   ] Block Move Negative
    AND $3F5010             ; [2F 10 50 3F] AND A with Absolute Long
    EOR $00702F,X           ; [5F 2F 70 00] XOR A with Absolute Long,X
    BMI $7E0C               ; [30 00      ] Branch if Minus
    ORA $1500,X             ; [1D 00 15   ] OR A with Absolute,X
    ORA $0601               ; [0D 01 06   ] OR A with Absolute
    PHP                     ; [08         ] Push Processor Status
    ORA [$1F],Y             ; [17 1F      ] OR A with [DP],Y
    JSR $300F               ; [20 0F 30   ] Jump to Subroutine
    ROL $0211               ; [2E 11 02   ] Rotate Left Absolute
    ORA $0002,X             ; [1D 02 00   ] OR A with Absolute,X
    COP #$00                ; [02 00      ] Coprocessor interrupt
    SBC $807F00,X           ; [FF 00 7F 80] Subtract with Borrow Absolute Long,X
    ORA $80FEE0,X           ; [1F E0 FE 80] OR A with Absolute Long,X

;--- Patch at file offset $147E2E (SNES $D47E2E) ---
org $D47E2E

    AND $128C80,X           ; [3F 80 8C 12] AND A with Absolute Long,X
    STZ $8A                 ; [64 8A      ] Store Zero to DP
    STY $72                 ; [84 72      ] Store Y to DP
    CPX #$14                ; [E0 14      ] Compare X Immediate

;--- Patch at file offset $147E3E (SNES $D47E3E) ---
org $D47E3E

    TSB $62                 ; [04 62      ] Test and Set Bits in DP
    AND $0D,X               ; [35 0D      ] AND A with DP,X
    BVC $7E64               ; [50 20      ] Branch if Overflow Clear
    PHA                     ; [48         ] Push Accumulator
    BPL $7E76               ; [10 2F      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    AND $3312,X             ; [3D 12 33   ] AND A with Absolute,X
    COP #$53                ; [02 53      ] Coprocessor interrupt
    COP #$7F                ; [02 7F      ] Coprocessor interrupt
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 2F      ] Software interrupt
    BRK                     ; [00 36      ] Software interrupt
    AND ($18,X)             ; [21 18      ] AND A with (DP,X)
    BPL $7E6B               ; [10 12      ] Branch if Plus
    BRK                     ; [00 0E      ] Software interrupt
    BRK                     ; [00 26      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    ASL $88,X               ; [16 88      ] Shift Left DP,X
    PLY                     ; [7A         ] Pull Y Register
    db $1C, $96                 ; Incomplete/data bytes

;--- Patch at file offset $147E6D (SNES $D47E6D) ---
org $D47E6D

    BNE $7E6B               ; [D0 FC      ] Branch if Not Equal
    BRK                     ; [00 28      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    TRB $4C80               ; [1C 80 4C   ] Test and Reset Bits Absolute
    PLP                     ; [28         ] Pull Processor Status
    TSB $8074               ; [0C 74 80   ] Test and Set Bits Absolute
    CLC                     ; [18         ] Clear Carry Flag
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BNE $7E7E               ; [D0 00      ] Branch if Not Equal
    BRK                     ; [00 00      ] Software interrupt
    EOR $023C2E,X           ; [5F 2E 3C 02] XOR A with Absolute Long,X
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BIT $06,X               ; [34 06      ] Test Bits DP,X
    BMI $7E8D               ; [30 01      ] Branch if Minus
    AND #$01                ; [29 01      ] AND A with Immediate
    AND $310E11             ; [2F 11 0E 31] AND A with Absolute Long
    COP #$11                ; [02 11      ] Coprocessor interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0F,X)             ; [01 0F      ] OR A with (DP,X)
    BRK                     ; [00 17      ] Software interrupt
    BPL $7EB0               ; [10 11      ] Branch if Plus
    BRK                     ; [00 1D      ] Software interrupt
    ASL $05                 ; [06 05      ] Shift Left DP
    BRK                     ; [00 04      ] Software interrupt
    ORA $0B,S               ; [03 0B      ] OR A with Stack Relative
    ASL $18                 ; [06 18      ] Shift Left DP
    PHP                     ; [08         ] Push Processor Status
    AND $1C                 ; [25 1C      ] AND A with Direct Page
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 06      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    COP #$03                ; [02 03      ] Coprocessor interrupt
    BRK                     ; [00 06      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($1C,X)             ; [01 1C      ] OR A with (DP,X)
    COP #$04                ; [02 04      ] Coprocessor interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 5F      ] Software interrupt
    ROL $003C               ; [2E 3C 00   ] Rotate Left Absolute
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BIT $06,X               ; [34 06      ] Test Bits DP,X
    BMI $7ECC               ; [30 00      ] Branch if Minus
    AND #$01                ; [29 01      ] AND A with Immediate
    ORA $310E00,X           ; [1F 00 0E 31] OR A with Absolute Long,X
    BRK                     ; [00 13      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($17,X)             ; [01 17      ] OR A with (DP,X)
    BPL $7EDF               ; [10 00      ] Branch if Plus
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 EE      ] Software interrupt
    BMI $7EA3               ; [30 B4      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $7EFD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $7F45               ; [90 4C      ] Branch if Carry Clear
    BCC $7F07               ; [90 0C      ] Branch if Carry Clear
    BRK                     ; [00 70      ] Software interrupt
    MVP $78,$40             ; [44 78 40   ] Block Move Positive
    BIT $04                 ; [24 04      ] Test Bits DP
    BIT $04                 ; [24 04      ] Test Bits DP
    ORA $060B00,X           ; [1F 00 0B 06] OR A with Absolute Long,X
    ASL $2608,X             ; [1E 08 26   ] Shift Left Absolute,X
    TRB $041B               ; [1C 1B 04   ] Test and Reset Bits Absolute
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TSB $10                 ; [04 10      ] Test and Set Bits in DP
    ORA $060000             ; [0F 00 00 06] OR A with Absolute Long
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 1D      ] Software interrupt
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 58      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BVS $7F08               ; [70 E0      ] Branch if Overflow Set
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BVS $7F8C               ; [70 60      ] Branch if Overflow Set
    LDY #$C0                ; [A0 C0      ] Load Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BCS $7F62               ; [B0 30      ] Branch if Carry Set
    BRK                     ; [00 80      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
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
    BRK                     ; [00 E4      ] Software interrupt
    BRK                     ; [00 A4      ] Software interrupt
    BRK                     ; [00 66      ] Software interrupt
    JSR $30BE               ; [20 BE 30   ] Jump to Subroutine
    ASL $1C00               ; [0E 00 1C   ] Shift Left Absolute
    BRK                     ; [00 C4      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    RTI                     ; [40         ] Return from Interrupt
    BRA $7F85               ; [80 10      ] Branch Always
    INY                     ; [C8         ] Increment Y
    RTI                     ; [40         ] Return from Interrupt
    TYA                     ; [98         ] Transfer Y to A
    BRK                     ; [00 B8      ] Software interrupt
    MVP $30,$E0             ; [44 30 E0   ] Block Move Positive
    TRB $40                 ; [14 40      ] Test and Reset Bits DP
    TAY                     ; [A8         ] Transfer A to Y
    EOR $4D07               ; [4D 07 4D   ] XOR A with Absolute
    BRK                     ; [00 34      ] Software interrupt
    ORA $0B,S               ; [03 0B      ] OR A with Stack Relative
    ASL $18                 ; [06 18      ] Shift Left DP
    PHP                     ; [08         ] Push Processor Status
    AND $1C                 ; [25 1C      ] AND A with Direct Page
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 37      ] Software interrupt
    BRK                     ; [00 22      ] Software interrupt
    ORA ($03)               ; [12 03      ] OR A with (DP)
    BRK                     ; [00 06      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($1C,X)             ; [01 1C      ] OR A with (DP,X)
    COP #$04                ; [02 04      ] Coprocessor interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 B8      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRA $7F85               ; [80 E0      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPY #$B0                ; [C0 B0      ] Compare Y Immediate
    JSR $7078               ; [20 78 70   ] Jump to Subroutine
    BNE $800E               ; [D0 60      ] Branch if Not Equal
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 00      ] Software interrupt
    BVC $7F33               ; [50 80      ] Branch if Overflow Clear
    BRK                     ; [00 40      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt

;--- Patch at file offset $147FC4 (SNES $D47FC4) ---
org $D47FC4

    ASL $00                 ; [06 00      ] Shift Left DP
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $3F5110             ; [2F 10 51 3F] AND A with Absolute Long
    db $5F, $2E                 ; Incomplete/data bytes

;--- Patch at file offset $147FD6 (SNES $D47FD6) ---
org $D47FD6

    BRK                     ; [00 06      ] Software interrupt
    ASL $19                 ; [06 19      ] Shift Left DP
    ORA #$16                ; [09 16      ] OR A with Immediate
    ORA $310E20,X           ; [1F 20 0E 31] OR A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    SEI                     ; [78         ] Set Interrupt Disable
    CPY #$F4                ; [C0 F4      ] Compare Y Immediate
    PLP                     ; [28         ] Pull Processor Status
    PLX                     ; [FA         ] Pull X Register
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    BRK                     ; [00 3E      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    CPY #$10                ; [C0 10      ] Compare Y Immediate
    PLP                     ; [28         ] Pull Processor Status
    DEY                     ; [88         ] Decrement Y
    MVN $C8,$14             ; [54 C8 14   ] Block Move Negative
    BRK                     ; [00 EC      ] Software interrupt
    AND $3600,X             ; [3D 00 36   ] AND A with Absolute,X
    TSB $54                 ; [04 54      ] Test and Set Bits in DP
    ASL $54                 ; [06 54      ] Shift Left DP
    ASL $70                 ; [06 70      ] Shift Left DP
    JSR $0128               ; [20 28 01   ] Jump to Subroutine
    ORA $0E1908,X           ; [1F 08 19 0E] OR A with Absolute Long,X
    BRK                     ; [00 13      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    AND ($0E,X)             ; [21 0E      ] AND A with (DP,X)
    AND ($07,X)             ; [21 07      ] AND A with (DP,X)
    BPL $8025               ; [10 08      ] Branch if Plus
    BRK                     ; [00 0E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BVS $7FC9               ; [70 9E      ] Branch if Overflow Set
    BRK                     ; [00 1C      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 C4      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    TSB $80                 ; [04 80      ] Test and Set Bits in DP
    BIT $90                 ; [24 90      ] Test Bits DP
    TSB $30                 ; [04 30      ] Test and Set Bits in DP
    TSB $70                 ; [04 70      ] Test and Set Bits in DP
    PHA                     ; [48         ] Push Accumulator
    BIT $C8                 ; [24 C8      ] Test Bits DP
    JSR $A040               ; [20 40 A0   ] Jump to Subroutine
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    BRK                     ; [00 0B      ] Software interrupt
    ORA [$0A]               ; [07 0A      ] OR A with [DP]
    ORA $05                 ; [05 05      ] OR A with Direct Page
    BRK                     ; [00 06      ] Software interrupt
    COP #$05                ; [02 05      ] Coprocessor interrupt
    ORA $05,S               ; [03 05      ] OR A with Stack Relative
    COP #$07                ; [02 07      ] Coprocessor interrupt
    BRK                     ; [00 04      ] Software interrupt
    TSB $07                 ; [04 07      ] Test and Set Bits in DP
    BRK                     ; [00 05      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 B0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRA $80A7               ; [80 40      ] Branch Always
    BRA $7FE9               ; [80 80      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $8076               ; [80 00      ] Branch Always
    BRA $8078               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $148082 (SNES $D48082) ---
org $D48082

    BRK                     ; [00 00      ] Software interrupt
    ASL $1300               ; [0E 00 13   ] Shift Left Absolute
    TSB $102F               ; [0C 2F 10   ] Test and Set Bits Absolute
    LSR $5D21,X             ; [5E 21 5D   ] Shift Right Absolute,X
    JSL $000738             ; [22 38 07 00] Jump to Subroutine Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    TSB $1608               ; [0C 08 16   ] Test and Set Bits Absolute
    BPL $80C9               ; [10 2D      ] Branch if Plus
    ORA ($2A),Y             ; [11 2A      ] OR A with (DP),Y
    BPL $80A7               ; [10 07      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 E0      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BVS $8028               ; [70 80      ] Branch if Overflow Set
    LDY $7E40,X             ; [BC 40 7E   ] Load Y from Absolute,X
    BRA $80AB               ; [80 FE      ] Branch Always
    BRK                     ; [00 C7      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    BRA $8038               ; [80 80      ] Branch Always
    JSR $7850               ; [20 50 78   ] Jump to Subroutine
    STY $CC                 ; [84 CC      ] Store Y to DP
    BMI $807B               ; [30 BC      ] Branch if Minus
    WDM #$3B                ; [42 3B      ] Reserved (WDM)
    TSB $7F                 ; [04 7F      ] Test and Set Bits in DP
    BRK                     ; [00 79      ] Software interrupt
    BRK                     ; [00 79      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ROR $630C,X             ; [7E 0C 63   ] Rotate Right Absolute,X
    BRK                     ; [00 22      ] Software interrupt
    ORA ($13,X)             ; [01 13      ] OR A with (DP,X)
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    TRB $20                 ; [14 20      ] Test and Reset Bits DP
    ORA ($26),Y             ; [11 26      ] OR A with (DP),Y
    BPL $80FB               ; [10 24      ] Branch if Plus
    ASL                     ; [0A         ] Shift Left Accumulator
    BRK                     ; [00 2D      ] Software interrupt
    TRB $1900               ; [1C 00 19   ] Test and Reset Bits Absolute
    TSB $01                 ; [04 01      ] Test and Set Bits in DP
    TSB $FCFF               ; [0C FF FC   ] Test and Set Bits Absolute

;--- Patch at file offset $1480EE (SNES $D480EE) ---
org $D480EE

    TDC                     ; [7B         ] Transfer Direct Page to A
    BRL $81F0               ; [82 FE 00   ] Branch Long
    BVS $8080               ; [70 8C      ] Branch if Overflow Set

;--- Patch at file offset $1480FA (SNES $D480FA) ---
org $D480FA

    BVS $8084               ; [70 88      ] Branch if Overflow Set
    LSR $10                 ; [46 10      ] Shift Right DP
    STX $0F0C               ; [8E 0C 0F   ] Store X to Absolute
    BRK                     ; [00 05      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 15      ] Software interrupt
    TSB $040F               ; [0C 0F 04   ] Test and Set Bits Absolute
    ASL $01                 ; [06 01      ] Shift Left DP
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    ASL $01                 ; [06 01      ] Shift Left DP
    ASL $0400               ; [0E 00 04   ] Shift Left Absolute
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 FF      ] Software interrupt
    CPX #$E3                ; [E0 E3      ] Compare X Immediate
    BRK                     ; [00 92      ] Software interrupt
    BPL $80C3               ; [10 9C      ] Branch if Plus
    BPL $8123               ; [10 FA      ] Branch if Plus
    STY $80AC               ; [8C AC 80   ] Store Y to Absolute
    RTI                     ; [40         ] Return from Interrupt
    BRA $80AF               ; [80 80      ] Branch Always
    BRK                     ; [00 E2      ] Software interrupt
    COP #$18                ; [02 18      ] Coprocessor interrupt
    TSB $60                 ; [04 60      ] Test and Set Bits in DP
    TRB $3040               ; [1C 40 30   ] Test and Reset Bits Absolute

;--- Patch at file offset $148144 (SNES $D48144) ---
org $D48144

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $3F5110             ; [2F 10 51 3F] AND A with Absolute Long

;--- Patch at file offset $148156 (SNES $D48156) ---
org $D48156

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    ORA $000020,X           ; [1F 20 00 00] OR A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
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
    EOR $00302E,X           ; [5F 2E 30 00] XOR A with Absolute Long,X
    BPL $8186               ; [10 00      ] Branch if Plus
    ORA ($00)               ; [12 00      ] OR A with (DP)
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    AND ($00),Y             ; [31 00      ] AND A with (DP),Y
    EOR $6F30,Y             ; [59 30 6F   ] XOR A with Absolute,Y
    JSR $310E               ; [20 0E 31   ] Jump to Subroutine
    TSB $0E13               ; [0C 13 0E   ] Test and Set Bits Absolute
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    ORA ($0A,X)             ; [01 0A      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 30      ] Software interrupt
    ASL $38                 ; [06 38      ] Shift Left DP
    CLC                     ; [18         ] Clear Carry Flag
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    BRK                     ; [00 2E      ] Software interrupt
    BPL $81E9               ; [10 3C      ] Branch if Plus
    PLP                     ; [28         ] Pull Processor Status
    CPY $C4C0               ; [CC C0 C4   ] Compare Y with Absolute
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $81BD               ; [80 08      ] Branch Always
    CPX #$00                ; [E0 00      ] Compare X Immediate
    TYA                     ; [98         ] Transfer Y to A
    RTI                     ; [40         ] Return from Interrupt
    TSB $4090               ; [0C 90 40   ] Test and Set Bits Absolute
    DEY                     ; [88         ] Decrement Y
    RTS                     ; [60         ] Return from Subroutine
    JSR $5FD0               ; [20 D0 5F   ] Jump to Subroutine
    ROL $0030               ; [2E 30 00   ] Rotate Left Absolute
    BPL $81C6               ; [10 00      ] Branch if Plus
    ORA ($00)               ; [12 00      ] OR A with (DP)
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    AND ($00),Y             ; [31 00      ] AND A with (DP),Y
    EOR $6F30,Y             ; [59 30 6F   ] XOR A with Absolute,Y
    JSR $310E               ; [20 0E 31   ] Jump to Subroutine
    TSB $0E13               ; [0C 13 0E   ] Test and Set Bits Absolute
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    ORA ($0A,X)             ; [01 0A      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 30      ] Software interrupt
    ASL $38                 ; [06 38      ] Shift Left DP
    CLC                     ; [18         ] Clear Carry Flag
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    BRK                     ; [00 2E      ] Software interrupt
    BPL $8229               ; [10 3C      ] Branch if Plus
    PLP                     ; [28         ] Pull Processor Status
    CPY $C4C0               ; [CC C0 C4   ] Compare Y with Absolute
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $81FD               ; [80 08      ] Branch Always
    CPX #$00                ; [E0 00      ] Compare X Immediate
    TYA                     ; [98         ] Transfer Y to A
    RTI                     ; [40         ] Return from Interrupt
    TSB $4090               ; [0C 90 40   ] Test and Set Bits Absolute
    DEY                     ; [88         ] Decrement Y
    RTS                     ; [60         ] Return from Subroutine
    JSR $00D0               ; [20 D0 00   ] Jump to Subroutine
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    ORA $7C0750             ; [0F 50 07 7C] OR A with Absolute Long
    ORA $50,S               ; [03 50      ] OR A with Stack Relative
    ORA [$7F]               ; [07 7F      ] OR A with [DP]
    AND $000000             ; [2F 00 00 00] AND A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BPL $8258               ; [10 3F      ] Branch if Plus
    AND $3F3F3F,X           ; [3F 3F 3F 3F] AND A with Absolute Long,X
    ROL $103F,X             ; [3E 3F 10   ] Rotate Left Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $81E8               ; [F0 C0      ] Branch if Equal
    SEC                     ; [38         ] Set Carry Flag
    BEQ $8237               ; [F0 0C      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    ASL $FC                 ; [06 FC      ] Shift Left DP
    DEC $FC                 ; [C6 FC      ] Decrement DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $81BA               ; [F0 80      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    CPY #$FC                ; [C0 FC      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    JSR ($7F10,X)           ; [FC 10 7F   ] Jump to Subroutine Indirect,X
    AND $16003D,X           ; [3F 3D 00 16] AND A with Absolute Long,X
    TSB $16                 ; [04 16      ] Test and Set Bits in DP
    ASL $16                 ; [06 16      ] Shift Left DP
    ASL $20                 ; [06 20      ] Shift Left DP
    BRK                     ; [00 2F      ] Software interrupt
    ORA $3F0730             ; [0F 30 07 3F] OR A with Absolute Long
    ORA $081300             ; [0F 00 13 08] OR A with Absolute Long
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    ORA $1E,S               ; [03 1E      ] OR A with Stack Relative
    ORA ($1F),Y             ; [11 1F      ] OR A with (DP),Y
    ORA $FB0F0F,X           ; [1F 0F 0F FB] OR A with Absolute Long,X
    INC $BE77               ; [EE 77 BE   ] Increment Absolute
    INC $BC1C,X             ; [FE 1C BC   ] Increment Absolute,X
    JSR $4058               ; [20 58 40   ] Jump to Subroutine
    STZ $3C80               ; [9C 80 3C   ] Store Zero to Absolute
    BRA $82C7               ; [80 58      ] Branch Always
    JSR $40FE               ; [20 FE 40   ] Jump to Subroutine
    LDX $1C60,Y             ; [BE 60 1C   ] Load X from Absolute,Y
    BNE $82E7               ; [D0 70      ] Branch if Not Equal
    BCS $82E9               ; [B0 70      ] Branch if Carry Set
    BEQ $8273               ; [F0 F8      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    BCS $8220               ; [B0 A0      ] Branch if Carry Set
    PHA                     ; [48         ] Push Accumulator
    BRK                     ; [00 4F      ] Software interrupt
    BRK                     ; [00 3F      ] Software interrupt
    BRK                     ; [00 09      ] Software interrupt
    ORA [$0A]               ; [07 0A      ] OR A with [DP]
    ASL $07                 ; [06 07      ] Shift Left DP
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    BRK                     ; [00 37      ] Software interrupt
    ORA [$27]               ; [07 27      ] OR A with [DP]
    ORA [$00],Y             ; [17 00      ] OR A with [DP],Y
    BRK                     ; [00 07      ] Software interrupt
    ORA $07                 ; [05 07      ] OR A with Direct Page
    ASL $01                 ; [06 01      ] Shift Left DP
    BRK                     ; [00 01      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 9C      ] Software interrupt
    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $1482AC (SNES $D482AC) ---
org $D482AC

    SBC $DF06,Y             ; [F9 06 DF   ] Subtract with Borrow Absolute,Y

;--- Patch at file offset $1482B7 (SNES $D482B7) ---
org $D482B7

    LDY #$38                ; [A0 38      ] Load Y Immediate
    BCS $8277               ; [B0 BC      ] Branch if Carry Set
    BMI $825B               ; [30 9E      ] Branch if Minus
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA $0F3000,X           ; [1F 00 30 0F] OR A with Absolute Long,X
    BVC $82D1               ; [50 07      ] Branch if Overflow Clear
    JMP ($5003,X)           ; [7C 03 50   ] Jump Indirect,X
    ORA [$7F]               ; [07 7F      ] OR A with [DP]
    AND $000000             ; [2F 00 00 00] AND A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BPL $8318               ; [10 3F      ] Branch if Plus
    AND $3F3F3F,X           ; [3F 3F 3F 3F] AND A with Absolute Long,X
    ROL $103F,X             ; [3E 3F 10   ] Rotate Left Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $82A8               ; [F0 C0      ] Branch if Equal
    SEC                     ; [38         ] Set Carry Flag
    BEQ $82F7               ; [F0 0C      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    ASL $FC                 ; [06 FC      ] Shift Left DP
    DEC $FC                 ; [C6 FC      ] Decrement DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $827A               ; [F0 80      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    CPY #$FC                ; [C0 FC      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    JSR ($7F10,X)           ; [FC 10 7F   ] Jump to Subroutine Indirect,X
    AND $1E003A,X           ; [3F 3A 00 1E] AND A with Absolute Long,X
    COP #$16                ; [02 16      ] Coprocessor interrupt
    ASL $16                 ; [06 16      ] Shift Left DP
    ASL $23                 ; [06 23      ] Shift Left DP
    BRK                     ; [00 6C      ] Software interrupt
    BRK                     ; [00 54      ] Software interrupt
    BIT $0F3F               ; [2C 3F 0F   ] Test Bits Absolute
    BRK                     ; [00 1D      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    ORA $1C,S               ; [03 1C      ] OR A with Stack Relative
    BPL $8330               ; [10 13      ] Branch if Plus
    BPL $834E               ; [10 2F      ] Branch if Plus
    BIT $EEFB               ; [2C FB EE   ] Test Bits Absolute
    ADC [$BE],Y             ; [77 BE      ] Add with Carry [DP],Y
    INC $BC1C,X             ; [FE 1C BC   ] Increment Absolute,X
    JSR $4078               ; [20 78 40   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    BRA $82F9               ; [80 CC      ] Branch Always
    BRK                     ; [00 F2      ] Software interrupt
    BIT $40FE,X             ; [3C FE 40   ] Test Bits Absolute,X
    LDX $1C60,Y             ; [BE 60 1C   ] Load X from Absolute,Y
    BNE $83A7               ; [D0 70      ] Branch if Not Equal
    BCS $8379               ; [B0 40      ] Branch if Carry Set
    CPY #$B0                ; [C0 B0      ] Compare Y Immediate
    BRA $835D               ; [80 20      ] Branch Always
    BPL $837B               ; [10 3C      ] Branch if Plus
    SEC                     ; [38         ] Set Carry Flag
    EOR [$3E],Y             ; [57 3E      ] XOR A with [DP],Y
    EOR [$3C]               ; [47 3C      ] XOR A with [DP]
    AND $0F1C10,X           ; [3F 10 1C 0F] AND A with Absolute Long,X
    ORA ($03,S),Y           ; [13 03      ] OR A with (SR),Y
    ORA $270C,X             ; [1D 0C 27   ] OR A with Absolute,X
    ASL $001E,X             ; [1E 1E 00   ] Shift Left Absolute,X
    ROL $3D26,X             ; [3E 26 3D   ] Rotate Left Absolute,X
    AND ($10,X)             ; [21 10      ] AND A with (DP,X)
    BRK                     ; [00 0F      ] Software interrupt
    ORA $0C030F             ; [0F 0F 03 0C] OR A with Absolute Long
    COP #$1E                ; [02 1E      ] Coprocessor interrupt
    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $14837D (SNES $D4837D) ---
org $D4837D

    JSR $0000               ; [20 00 00   ] Jump to Subroutine
    PHA                     ; [48         ] Push Accumulator
    BRK                     ; [00 4F      ] Software interrupt
    BRK                     ; [00 3F      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    ORA [$1A]               ; [07 1A      ] OR A with [DP]
    PHD                     ; [0B         ] Push Direct Page Register
    AND $1C                 ; [25 1C      ] AND A with Direct Page
    INC                     ; [1A         ] Increment Accumulator
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 37      ] Software interrupt
    ORA [$27]               ; [07 27      ] OR A with [DP]
    ORA [$00],Y             ; [17 00      ] OR A with [DP],Y
    BRK                     ; [00 07      ] Software interrupt
    ORA [$0B]               ; [07 0B      ] OR A with [DP]
    ORA [$1C]               ; [07 1C      ] OR A with [DP]
    ORA ($04)               ; [12 04      ] OR A with (DP)

;--- Patch at file offset $1483A6 (SNES $D483A6) ---
org $D483A6

    LDX $3BBC               ; [AE BC 3B   ] Load X from Absolute

;--- Patch at file offset $1483BD (SNES $D483BD) ---
org $D483BD

    db $44                      ; Incomplete/data bytes

;--- Patch at file offset $1483CA (SNES $D483CA) ---
org $D483CA

    BRK                     ; [00 00      ] Software interrupt
    ORA $1B3400,X           ; [1F 00 34 1B] OR A with Absolute Long,X

;--- Patch at file offset $1483DC (SNES $D483DC) ---
org $D483DC

    BRK                     ; [00 00      ] Software interrupt
    db $1F, $04                 ; Incomplete/data bytes

;--- Patch at file offset $1483EA (SNES $D483EA) ---
org $D483EA

    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $83B0               ; [F0 C0      ] Branch if Equal

;--- Patch at file offset $1483FC (SNES $D483FC) ---
org $D483FC

    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BIT $11                 ; [24 11      ] Test Bits DP
    EOR $316420,X           ; [5F 20 64 31] XOR A with Absolute Long,X
    ADC $30783B             ; [6F 3B 78 30] Add with Carry Absolute Long
    AND $00,X               ; [35 00      ] AND A with DP,X
    ORA $1504,X             ; [1D 04 15   ] OR A with Absolute,X
    ORA $1F1F               ; [0D 1F 1F   ] OR A with Absolute
    AND $0E3F1F,X           ; [3F 1F 3F 0E] AND A with Absolute Long,X
    AND $193605,X           ; [3F 05 36 19] AND A with Absolute Long,X
    COP #$18                ; [02 18      ] Coprocessor interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    BIT $06F0,X             ; [3C F0 06   ] Test Bits Absolute,X
    JSR ($FE03,X)           ; [FC 03 FE   ] Jump to Subroutine Indirect,X
    PHB                     ; [8B         ] Push Data Bank
    INC $FEE7,X             ; [FE E7 FE   ] Increment Absolute,X
    ROL $3C,X               ; [36 3C      ] Rotate Left DP,X
    INC $3C0C,X             ; [FE 0C 3C   ] Increment Absolute,X
    LDY #$F0                ; [A0 F0      ] Load Y Immediate
    BRA $842F               ; [80 FC      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    INC $FE10,X             ; [FE 10 FE   ] Increment Absolute,X
    BRK                     ; [00 FE      ] Software interrupt
    CPY #$3C                ; [C0 3C      ] Compare Y Immediate
    CPX #$0C                ; [E0 0C      ] Compare X Immediate
    BRK                     ; [00 30      ] Software interrupt
    BVS $8476               ; [70 35      ] Branch if Overflow Set
    ORA $0828               ; [0D 28 08   ] OR A with Absolute
    AND $022407,X           ; [3F 07 24 02] AND A with Absolute Long,X
    AND $04                 ; [25 04      ] AND A with Direct Page
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    TRB $0C53               ; [1C 53 0C   ] Test and Reset Bits Absolute
    ADC $0200,X             ; [7D 00 02   ] Add with Carry Absolute,X
    BRK                     ; [00 1E      ] Software interrupt
    ORA $0707,Y             ; [19 07 07   ] OR A with Absolute,Y
    ORA ($0B,S),Y           ; [13 0B      ] OR A with (SR),Y
    ORA $001C03,X           ; [1F 03 1C 00] OR A with Absolute Long,X
    db $2C                      ; Incomplete/data bytes

;--- Patch at file offset $148464 (SNES $D48464) ---
org $D48464

    LSR $E5B8               ; [4E B8 E5   ] Shift Right Absolute
    DEC                     ; [3A         ] Decrement Accumulator
    CMP $3E3B78,X           ; [DF 78 3B 3E] Compare A with Absolute Long,X

;--- Patch at file offset $148474 (SNES $D48474) ---
org $D48474

    CLV                     ; [B8         ] Clear Overflow Flag
    BCS $8431               ; [B0 BA      ] Branch if Carry Set
    BRA $84F1               ; [80 78      ] Branch Always
    BPL $8439               ; [10 BE      ] Branch if Plus
    SEI                     ; [78         ] Set Interrupt Disable
    STZ $0040,X             ; [9E 40 00   ] Store Zero to Absolute,X
    BRK                     ; [00 7F      ] Software interrupt
    AND $16003D,X           ; [3F 3D 00 16] AND A with Absolute Long,X
    TSB $16                 ; [04 16      ] Test and Set Bits in DP
    ASL $16                 ; [06 16      ] Shift Left DP
    ASL $10                 ; [06 10      ] Shift Left DP
    BRK                     ; [00 1F      ] Software interrupt
    ORA [$10]               ; [07 10      ] OR A with [DP]
    ORA [$3F]               ; [07 3F      ] OR A with [DP]
    ORA $081300             ; [0F 00 13 08] OR A with Absolute Long
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    ORA $0E,S               ; [03 0E      ] OR A with Stack Relative
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    ORA [$0F]               ; [07 0F      ] OR A with [DP]
    ORA $0F0008             ; [0F 08 00 0F] OR A with Absolute Long
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    ORA [$1A]               ; [07 1A      ] OR A with [DP]
    PHD                     ; [0B         ] Push Direct Page Register
    AND $1C                 ; [25 1C      ] AND A with Direct Page
    INC                     ; [1A         ] Increment Accumulator
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 07      ] Software interrupt
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA [$00]               ; [07 00      ] OR A with [DP]
    BRK                     ; [00 07      ] Software interrupt
    ORA [$0B]               ; [07 0B      ] OR A with [DP]
    ORA [$1C]               ; [07 1C      ] OR A with [DP]
    ORA ($04)               ; [12 04      ] OR A with (DP)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 7F      ] Software interrupt
    AND $16003D,X           ; [3F 3D 00 16] AND A with Absolute Long,X
    TSB $16                 ; [04 16      ] Test and Set Bits in DP
    ASL $16                 ; [06 16      ] Shift Left DP
    ASL $00                 ; [06 00      ] Shift Left DP
    BRK                     ; [00 1F      ] Software interrupt
    ORA [$11]               ; [07 11      ] OR A with [DP]
    ORA [$3F]               ; [07 3F      ] OR A with [DP]
    ORA $081300             ; [0F 00 13 08] OR A with Absolute Long
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    ORA $0E,S               ; [03 0E      ] OR A with Stack Relative
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    ORA [$0F]               ; [07 0F      ] OR A with [DP]
    ASL $EEFB               ; [0E FB EE   ] Shift Left Absolute
    ADC [$BE],Y             ; [77 BE      ] Add with Carry [DP],Y
    INC $BC1C,X             ; [FE 1C BC   ] Increment Absolute,X
    JSR $4058               ; [20 58 40   ] Jump to Subroutine

;--- Patch at file offset $1484F0 (SNES $D484F0) ---
org $D484F0

    INC $BE40,X             ; [FE 40 BE   ] Increment Absolute,X
    RTS                     ; [60         ] Return from Subroutine
    TRB $70D0               ; [1C D0 70   ] Test and Reset Bits Absolute
    BCS $8569               ; [B0 70      ] Branch if Carry Set
    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $148500 (SNES $D48500) ---
org $D48500

    ORA ($03)               ; [12 03      ] OR A with (DP)
    ORA ($03,S),Y           ; [13 03      ] OR A with (SR),Y
    ORA $070C00             ; [0F 00 0C 07] OR A with Absolute Long
    INC                     ; [1A         ] Increment Accumulator
    PHD                     ; [0B         ] Push Direct Page Register
    AND $1C                 ; [25 1C      ] AND A with Direct Page
    INC                     ; [1A         ] Increment Accumulator
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 0F      ] Software interrupt
    ORA $0F,S               ; [03 0F      ] OR A with Stack Relative
    COP #$00                ; [02 00      ] Coprocessor interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$0B]               ; [07 0B      ] OR A with [DP]
    ORA [$1C]               ; [07 1C      ] OR A with [DP]
    ORA ($04)               ; [12 04      ] OR A with (DP)

;--- Patch at file offset $14853D (SNES $D4853D) ---
org $D4853D

    PHA                     ; [48         ] Push Accumulator
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $8508               ; [F0 C0      ] Branch if Equal
    SEC                     ; [38         ] Set Carry Flag
    BEQ $8557               ; [F0 0C      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    ASL $FC                 ; [06 FC      ] Shift Left DP
    DEC $FC                 ; [C6 FC      ] Decrement DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $84DA               ; [F0 80      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    CPY #$FC                ; [C0 FC      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    JSR ($FB10,X)           ; [FC 10 FB   ] Jump to Subroutine Indirect,X
    INC $B27F               ; [EE 7F B2   ] Increment Absolute
    SBC ($00)               ; [F2 00      ] Subtract with Borrow (DP)
    LDA ($20)               ; [B2 20      ] Load A from (DP)
    ROR $CC5C               ; [6E 5C CC   ] Rotate Right Absolute
    CLV                     ; [B8         ] Clear Overflow Flag
    LDY $9878               ; [AC 78 98   ] Load Y from Absolute
    BVS $856F               ; [70 FE      ] Branch if Overflow Set
    RTI                     ; [40         ] Return from Interrupt
    LDA ($60)               ; [B2 60      ] Load A from (DP)
    TSB $6CC0               ; [0C C0 6C   ] Test and Set Bits Absolute
    LDY #$5C                ; [A0 5C      ] Load Y Immediate
    CPY $A0B8               ; [CC B8 A0   ] Compare Y with Absolute
    SEI                     ; [78         ] Set Interrupt Disable
    RTI                     ; [40         ] Return from Interrupt
    BEQ $8540               ; [F0 C0      ] Branch if Equal
    PHA                     ; [48         ] Push Accumulator
    BRK                     ; [00 4F      ] Software interrupt
    BRK                     ; [00 3F      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    ORA [$1A]               ; [07 1A      ] OR A with [DP]
    PHD                     ; [0B         ] Push Direct Page Register
    AND $1C                 ; [25 1C      ] AND A with Direct Page
    INC                     ; [1A         ] Increment Accumulator
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 37      ] Software interrupt
    ORA [$27]               ; [07 27      ] OR A with [DP]
    ORA [$00],Y             ; [17 00      ] OR A with [DP],Y
    BRK                     ; [00 07      ] Software interrupt
    ORA [$0B]               ; [07 0B      ] OR A with [DP]
    ORA [$1C]               ; [07 1C      ] OR A with [DP]
    ORA ($04)               ; [12 04      ] OR A with (DP)

;--- Patch at file offset $1485BD (SNES $D485BD) ---
org $D485BD

    PHA                     ; [48         ] Push Accumulator
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA $0F3000,X           ; [1F 00 30 0F] OR A with Absolute Long,X
    BVC $85CF               ; [50 07      ] Branch if Overflow Clear
    JMP ($5003,X)           ; [7C 03 50   ] Jump Indirect,X
    ORA [$7F]               ; [07 7F      ] OR A with [DP]
    AND $003F7F             ; [2F 7F 3F 00] AND A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BPL $8616               ; [10 3F      ] Branch if Plus
    AND $3F3F3F,X           ; [3F 3F 3F 3F] AND A with Absolute Long,X
    ROL $103F,X             ; [3E 3F 10   ] Rotate Left Absolute,X
    db $3F, $0F                 ; Incomplete/data bytes

;--- Patch at file offset $1485EC (SNES $D485EC) ---
org $D485EC

    DEC $FC                 ; [C6 FC      ] Decrement DP
    XCE                     ; [FB         ] Exchange Carry and Emulation
    db $EE                      ; Incomplete/data bytes

;--- Patch at file offset $148600 (SNES $D48600) ---
org $D48600

    AND $5600,X             ; [3D 00 56   ] AND A with Absolute,X
    TSB $56                 ; [04 56      ] Test and Set Bits in DP
    ASL $76                 ; [06 76      ] Shift Left DP
    ROL $20                 ; [26 20      ] Rotate Left DP
    BRK                     ; [00 2F      ] Software interrupt
    ORA [$30]               ; [07 30      ] OR A with [DP]
    ORA [$28]               ; [07 28      ] OR A with [DP]
    BPL $8611               ; [10 00      ] Branch if Plus
    ORA ($28,S),Y           ; [13 28      ] OR A with (SR),Y
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    AND $28,S               ; [23 28      ] AND A with Stack Relative
    AND $1E,S               ; [23 1E      ] AND A with Stack Relative
    ORA ($17),Y             ; [11 17      ] OR A with (DP),Y
    ORA [$0F],Y             ; [17 0F      ] OR A with [DP],Y
    ORA $7F0F1F             ; [0F 1F 0F 7F] OR A with Absolute Long
    LDX #$E6                ; [A2 E6      ] Load X Immediate
    BRK                     ; [00 A4      ] Software interrupt
    BRK                     ; [00 5C      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    CPY $5CB8               ; [CC B8 5C   ] Compare Y with Absolute
    CLV                     ; [B8         ] Clear Overflow Flag
    CLV                     ; [B8         ] Clear Overflow Flag
    BVS $85B7               ; [70 88      ] Branch if Overflow Set
    BVS $85D3               ; [70 A2      ] Branch if Overflow Set
    RTS                     ; [60         ] Return from Subroutine
    BPL $85FC               ; [10 C8      ] Branch if Plus
    BVC $85BE               ; [50 88      ] Branch if Overflow Clear
    SEC                     ; [38         ] Set Carry Flag
    TYA                     ; [98         ] Transfer Y to A
    CLV                     ; [B8         ] Clear Overflow Flag
    LDY #$B8                ; [A0 B8      ] Load Y Immediate
    LDY #$F0                ; [A0 F0      ] Load Y Immediate
    CPY #$F0                ; [C0 F0      ] Compare Y Immediate
    CPY #$3F                ; [C0 3F      ] Compare Y Immediate
    BPL $8662               ; [10 1F      ] Branch if Plus
    BRK                     ; [00 09      ] Software interrupt
    ORA [$0A]               ; [07 0A      ] OR A with [DP]
    ASL $06                 ; [06 06      ] Shift Left DP
    BRK                     ; [00 03      ] Software interrupt
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    BRK                     ; [00 17      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    BRK                     ; [00 07      ] Software interrupt
    ORA $07                 ; [05 07      ] OR A with Direct Page
    ASL $01                 ; [06 01      ] Shift Left DP
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 D8      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    SEI                     ; [78         ] Set Interrupt Disable
    BCC $861D               ; [90 B8      ] Branch if Carry Clear
    CPX #$68                ; [E0 68      ] Compare X Immediate
    BPL $8655               ; [10 EC      ] Branch if Plus
    TYA                     ; [98         ] Transfer Y to A
    INC $0C,X               ; [F6 0C      ] Increment DP,X
    LDA ($0C)               ; [B2 0C      ] Load A from (DP)
    ASL $6000,X             ; [1E 00 60   ] Shift Left Absolute,X
    BRK                     ; [00 90      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    LDY #$30                ; [A0 30      ] Load Y Immediate
    LDY #$B8                ; [A0 B8      ] Load Y Immediate
    JSR $303C               ; [20 3C 30   ] Jump to Subroutine
    TRB $0010               ; [1C 10 00   ] Test and Reset Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 32      ] Software interrupt
    ORA $3862,X             ; [1D 62 38   ] OR A with Absolute,X
    EOR $384230             ; [4F 30 42 38] XOR A with Absolute Long
    ADC $00003D             ; [6F 3D 00 00] Add with Carry Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA $0F3F02,X           ; [1F 02 3F 0F] OR A with Absolute Long,X
    AND $1F3F0F,X           ; [3F 0F 3F 1F] AND A with Absolute Long,X
    AND $000012,X           ; [3F 12 00 00] AND A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    SEI                     ; [78         ] Set Interrupt Disable
    CPX #$1C                ; [E0 1C      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    STX $7C                 ; [86 7C      ] Store X to DP
    COP #$FC                ; [02 FC      ] Coprocessor interrupt
    SBC $FE,S               ; [E3 FE      ] Subtract with Borrow Stack Relative
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    CPY #$FC                ; [C0 FC      ] Compare Y Immediate
    CPX #$FC                ; [E0 FC      ] Compare X Immediate
    BCC $86BD               ; [90 FE      ] Branch if Carry Clear
    PHP                     ; [08         ] Push Processor Status
    AND $00181F             ; [2F 1F 18 00] AND A with Absolute Long
    BIT $4A00               ; [2C 00 4A   ] Test Bits Absolute
    BRK                     ; [00 68      ] Software interrupt
    JSR $305D               ; [20 5D 30   ] Jump to Subroutine
    PHK                     ; [4B         ] Push Program Bank
    AND [$2C],Y             ; [37 2C      ] AND A with [DP],Y
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    ORA $090609,X           ; [1F 09 06 09] OR A with Absolute Long,X
    ORA ($00,S),Y           ; [13 00      ] OR A with (SR),Y
    AND $00,X               ; [35 00      ] AND A with DP,X
    AND [$00],Y             ; [37 00      ] AND A with [DP],Y
    AND ($20)               ; [32 20      ] AND A with (DP)
    AND [$27],Y             ; [37 27      ] AND A with [DP],Y
    ORA $FEEB07,X           ; [1F 07 EB FE] OR A with Absolute Long,X

;--- Patch at file offset $1486EC (SNES $D486EC) ---
org $D486EC

    LDX $DC                 ; [A6 DC      ] Load X from DP
    ROL $08,X               ; [36 08      ] Rotate Left DP,X
    db $FE, $C0                 ; Incomplete/data bytes

;--- Patch at file offset $1486FC (SNES $D486FC) ---
org $D486FC

    JML [$E8D0]             ; [DC D0 E8   ] Jump Long Indirect
    INX                     ; [E8         ] Increment X
    ASL $1300,X             ; [1E 00 13   ] Shift Left Absolute,X
    BRK                     ; [00 3A      ] Software interrupt
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    ADC $394F3C             ; [6F 3C 4F 39] Add with Carry Absolute Long
    AND $0502,X             ; [3D 02 05   ] AND A with Absolute,X
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    BRK                     ; [00 03      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    TSB $021F               ; [0C 1F 02   ] Test and Set Bits Absolute
    BIT $3900,X             ; [3C 00 39   ] Test Bits Absolute,X
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt

;--- Patch at file offset $148742 (SNES $D48742) ---
org $D48742

    BRK                     ; [00 00      ] Software interrupt
    ORA $0F3000,X           ; [1F 00 30 0F] OR A with Absolute Long,X
    BVC $8751               ; [50 07      ] Branch if Overflow Clear
    JMP ($5003,X)           ; [7C 03 50   ] Jump Indirect,X
    ORA [$7F]               ; [07 7F      ] OR A with [DP]
    AND $000000             ; [2F 00 00 00] AND A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BPL $8798               ; [10 3F      ] Branch if Plus
    AND $3F3F3F,X           ; [3F 3F 3F 3F] AND A with Absolute Long,X
    ROL $103F,X             ; [3E 3F 10   ] Rotate Left Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $8728               ; [F0 C0      ] Branch if Equal
    SEC                     ; [38         ] Set Carry Flag
    BEQ $8777               ; [F0 0C      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    ASL $FC                 ; [06 FC      ] Shift Left DP
    DEC $FC                 ; [C6 FC      ] Decrement DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $86FA               ; [F0 80      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    CPY #$FC                ; [C0 FC      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    JSR ($7F10,X)           ; [FC 10 7F   ] Jump to Subroutine Indirect,X
    AND $110038,X           ; [3F 38 00 11] AND A with Absolute Long,X
    BRK                     ; [00 16      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 2B      ] Software interrupt
    BRK                     ; [00 7C      ] Software interrupt
    TSB $7C                 ; [04 7C      ] Test and Set Bits in DP
    PLP                     ; [28         ] Pull Processor Status
    AND $1F000F,X           ; [3F 0F 00 1F] AND A with Absolute Long,X
    ASL $0900               ; [0E 00 09   ] Shift Left Absolute
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 14      ] Software interrupt
    BPL $87B3               ; [10 16      ] Branch if Plus
    ORA $2A,X               ; [15 2A      ] OR A with DP,X
    ORA ($FB,X)             ; [01 FB      ] OR A with (DP,X)
    INC $5E37               ; [EE 37 5E   ] Increment Absolute
    ROR $6C0C,X             ; [7E 0C 6C   ] Rotate Right Absolute,X

;--- Patch at file offset $1487B0 (SNES $D487B0) ---
org $D487B0

    INC $5EC0,X             ; [FE C0 5E   ] Increment Absolute,X
    BRA $87C1               ; [80 0C      ] Branch Always
    CPY #$30                ; [C0 30      ] Compare Y Immediate
    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $1487C0 (SNES $D487C0) ---
org $D487C0

    ADC $00383F,X           ; [7F 3F 38 00] Add with Carry Absolute Long,X
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    ASL $00,X               ; [16 00      ] Shift Left DP,X
    BMI $87CA               ; [30 00      ] Branch if Minus
    PLD                     ; [2B         ] Pull Direct Page Register
    BRK                     ; [00 7C      ] Software interrupt
    TSB $7C                 ; [04 7C      ] Test and Set Bits in DP
    PLP                     ; [28         ] Pull Processor Status
    AND $1F000F,X           ; [3F 0F 00 1F] AND A with Absolute Long,X
    ASL $0900               ; [0E 00 09   ] Shift Left Absolute
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 14      ] Software interrupt
    BPL $87F3               ; [10 16      ] Branch if Plus
    ORA $2A,X               ; [15 2A      ] OR A with DP,X
    ORA ($FB,X)             ; [01 FB      ] OR A with (DP,X)
    INC $5E37               ; [EE 37 5E   ] Increment Absolute
    ROR $6C0C,X             ; [7E 0C 6C   ] Rotate Right Absolute,X

;--- Patch at file offset $1487F0 (SNES $D487F0) ---
org $D487F0

    INC $5EC0,X             ; [FE C0 5E   ] Increment Absolute,X
    BRA $8801               ; [80 0C      ] Branch Always
    CPY #$30                ; [C0 30      ] Compare Y Immediate
    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $148804 (SNES $D48804) ---
org $D48804

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    CLC                     ; [18         ] Clear Carry Flag
    ORA [$27]               ; [07 27      ] OR A with [DP]
    ORA $102F,Y             ; [19 2F 10   ] OR A with Absolute,Y
    CLI                     ; [58         ] Clear Interrupt Disable
    db $21                      ; Incomplete/data bytes

;--- Patch at file offset $148816 (SNES $D48816) ---
org $D48816

    BRK                     ; [00 00      ] Software interrupt
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    TSB $19                 ; [04 19      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    ASL $16,X               ; [16 16      ] Shift Left DP,X
    AND #$00                ; [29 00      ] AND A with Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 C2      ] Software interrupt
    BIT $F8F4,X             ; [3C F4 F8   ] Test Bits Absolute,X
    CPX $F8                 ; [E4 F8      ] Compare X with DP
    INC $F8                 ; [E6 F8      ] Increment DP
    LDX $0070               ; [AE 70 00   ] Load X from Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BIT $F808,X             ; [3C 08 F8   ] Test Bits Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    MVN $70,$51             ; [54 70 51   ] Block Move Negative
    JSR $002C               ; [20 2C 00   ] Jump to Subroutine
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BMI $884C               ; [30 00      ] Branch if Minus
    EOR $7700,Y             ; [59 00 77   ] XOR A with Absolute,Y
    BMI $8857               ; [30 06      ] Branch if Minus
    AND $1003,Y             ; [39 03 10   ] AND A with Absolute,Y
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($27,X)             ; [01 27      ] OR A with (DP,X)
    AND ($39,X)             ; [21 39      ] AND A with (DP,X)
    AND $30CE,Y             ; [39 CE 30   ] AND A with Absolute,Y
    JSR ($FC00,X)           ; [FC 00 FC   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    BRK                     ; [00 86      ] Software interrupt
    BRK                     ; [00 CC      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    LDY $30,X               ; [B4 30      ] Load Y from DP,X
    PLA                     ; [68         ] Pull Accumulator
    BRA $887D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $8895               ; [90 1C      ] Branch if Carry Clear
    BRA $88BF               ; [80 44      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    SEI                     ; [78         ] Set Interrupt Disable
    SEC                     ; [38         ] Set Carry Flag
    SEC                     ; [38         ] Set Carry Flag
    EOR $044F04             ; [4F 04 4F 04] XOR A with Absolute Long
    DEC                     ; [3A         ] Decrement Accumulator
    ORA #$2E                ; [09 2E      ] OR A with Immediate
    ORA $1D2C,X             ; [1D 2C 1D   ] OR A with Absolute,X
    ROR $3F                 ; [66 3F      ] Rotate Right DP
    BVS $88CD               ; [70 3F      ] Branch if Overflow Set
    ADC $023600,X           ; [7F 00 36 02] Add with Carry Absolute Long,X
    ROL $12                 ; [26 12      ] Rotate Left DP
    ORA $1E1F0E             ; [0F 0E 1F 1E] OR A with Absolute Long
    ORA $321F16,X           ; [1F 16 1F 32] OR A with Absolute Long,X
    ORA $000030,X           ; [1F 30 00 00] OR A with Absolute Long,X
    BIT $3400,X             ; [3C 00 34   ] Test Bits Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    PEA $7418               ; [F4 18 74   ] Push Effective Absolute
    CLD                     ; [D8         ] Clear Decimal Flag
    STZ $D8,X               ; [74 D8      ] Store Zero to DP,X
    PLY                     ; [7A         ] Pull Y Register
    JML [$EC3A]             ; [DC 3A EC   ] Jump Long Indirect
    INC $C000,X             ; [FE 00 C0   ] Increment Absolute,X
    BRK                     ; [00 C8      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    PHP                     ; [08         ] Push Processor Status
    CLC                     ; [18         ] Clear Carry Flag
    INY                     ; [C8         ] Increment Y
    CLC                     ; [18         ] Clear Carry Flag
    INY                     ; [C8         ] Increment Y
    CLC                     ; [18         ] Clear Carry Flag
    CPY $1C                 ; [C4 1C      ] Compare Y with DP
    CPX $0C                 ; [E4 0C      ] Compare X with DP

;--- Patch at file offset $1488C4 (SNES $D488C4) ---
org $D488C4

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    CLC                     ; [18         ] Clear Carry Flag
    ORA [$27]               ; [07 27      ] OR A with [DP]
    ORA $112F,Y             ; [19 2F 11   ] OR A with Absolute,Y
    db $5F, $20                 ; Incomplete/data bytes

;--- Patch at file offset $1488D6 (SNES $D488D6) ---
org $D488D6

    BRK                     ; [00 00      ] Software interrupt
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    TSB $19                 ; [04 19      ] Test and Set Bits in DP
    TSB $1811               ; [0C 11 18   ] Test and Set Bits Absolute
    ROL $00                 ; [26 00      ] Rotate Left DP
    BRK                     ; [00 1C      ] Software interrupt
    BRK                     ; [00 E4      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    BIT $F8,X               ; [34 F8      ] Test Bits DP,X
    CPX $EEF0               ; [EC F0 EE   ] Compare X with Absolute
    BEQ $88BB               ; [F0 CE      ] Branch if Equal
    BEQ $88CD               ; [F0 DE      ] Branch if Equal
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    INY                     ; [C8         ] Increment Y
    SED                     ; [F8         ] Set Decimal Flag
    BPL $88EA               ; [10 F0      ] Branch if Plus
    BPL $88F0               ; [10 F4      ] Branch if Plus
    BMI $88F2               ; [30 F4      ] Branch if Minus
    PLP                     ; [28         ] Pull Processor Status
    CPX $50                 ; [E4 50      ] Compare X with DP
    AND ($72,X)             ; [21 72      ] AND A with (DP,X)
    BRK                     ; [00 3C      ] Software interrupt
    COP #$14                ; [02 14      ] Coprocessor interrupt
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $36                 ; [06 36      ] Shift Left DP
    BRK                     ; [00 59      ] Software interrupt
    BRK                     ; [00 69      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    ASL $39                 ; [06 39      ] Shift Left DP
    BIT $0011               ; [2C 11 00   ] Test Bits Absolute
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($26,X)             ; [01 26      ] OR A with (DP,X)
    JSR $081E               ; [20 1E 08   ] Jump to Subroutine
    STZ $FC60               ; [9C 60 FC   ] Store Zero to Absolute
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 9C      ] Software interrupt
    BRK                     ; [00 94      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BVS $8999               ; [70 68      ] Branch if Overflow Set
    RTS                     ; [60         ] Return from Subroutine
    JSR $08C8               ; [20 C8 08   ] Jump to Subroutine
    CPX $48                 ; [E4 48      ] Compare X with DP
    STY $0C,X               ; [94 0C      ] Store Y to DP,X
    BPL $899B               ; [10 60      ] Branch if Plus
    BRK                     ; [00 68      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BVS $89A0               ; [70 60      ] Branch if Overflow Set
    AND [$1D]               ; [27 1D      ] AND A with [DP]
    ORA [$09],Y             ; [17 09      ] OR A with [DP],Y
    PLD                     ; [2B         ] Pull Direct Page Register
    ORA ($2E),Y             ; [11 2E      ] OR A with (DP),Y
    ORA $3D6C,X             ; [1D 6C 3D   ] OR A with Absolute,X
    ADC ($3F,S),Y           ; [73 3F      ] Add with Carry (SR),Y
    ADC ($3E),Y             ; [71 3E      ] Add with Carry (DP),Y
    ADC $051D00,X           ; [7F 00 1D 05] Add with Carry Absolute Long,X
    PHD                     ; [0B         ] Push Direct Page Register
    ORA $17,S               ; [03 17      ] OR A with Stack Relative
    ORA [$1F],Y             ; [17 1F      ] OR A with [DP],Y
    ASL $361F,X             ; [1E 1F 36   ] Shift Left Absolute,X
    ORA $301E22,X           ; [1F 22 1E 30] OR A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    STZ $94F0               ; [9C F0 94   ] Store Zero to Absolute
    PLA                     ; [68         ] Pull Accumulator
    SBC ($9C)               ; [F2 9C      ] Subtract with Borrow (DP)
    PLY                     ; [7A         ] Pull Y Register
    JML [$EC7A]             ; [DC 7A EC   ] Jump Long Indirect
    ROL $8EEC,X             ; [3E EC 8E   ] Rotate Left Absolute,X
    PEA $00FC               ; [F4 FC 00   ] Push Effective Absolute
    BEQ $88F2               ; [F0 80      ] Branch if Equal
    PLA                     ; [68         ] Pull Accumulator
    PHP                     ; [08         ] Push Processor Status
    STY $C41C               ; [8C 1C C4   ] Store Y to Absolute
    TRB $0CE4               ; [1C E4 0C   ] Test and Reset Bits Absolute
    CPX #$0C                ; [E0 0C      ] Compare X Immediate
    BEQ $8982               ; [F0 04      ] Branch if Equal
    BRK                     ; [00 00      ] Software interrupt
    EOR $044F04             ; [4F 04 4F 04] XOR A with Absolute Long
    DEC                     ; [3A         ] Decrement Accumulator
    ORA #$6E                ; [09 6E      ] OR A with Immediate
    ORA $3D5C,X             ; [1D 5C 3D   ] OR A with Absolute,X
    LSR $3F                 ; [46 3F      ] Shift Right DP
    RTI                     ; [40         ] Return from Interrupt
    AND $36007F,X           ; [3F 7F 00 36] AND A with Absolute Long,X
    COP #$26                ; [02 26      ] Coprocessor interrupt
    ORA ($0F)               ; [12 0F      ] OR A with (DP)
    ASL $1E1F               ; [0E 1F 1E   ] Shift Left Absolute
    AND $223F36,X           ; [3F 36 3F 22] AND A with Absolute Long,X
    AND $000000,X           ; [3F 00 00 00] AND A with Absolute Long,X
    BIT $3400,X             ; [3C 00 34   ] Test Bits Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    PEA $7A18               ; [F4 18 7A   ] Push Effective Absolute
    JML [$EC3A]             ; [DC 3A EC   ] Jump Long Indirect
    ROL $0EF4,X             ; [3E F4 0E   ] Rotate Left Absolute,X
    PEA $00FE               ; [F4 FE 00   ] Push Effective Absolute
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    INY                     ; [C8         ] Increment Y
    CLC                     ; [18         ] Clear Carry Flag
    PHP                     ; [08         ] Push Processor Status
    CLC                     ; [18         ] Clear Carry Flag
    CPY $1C                 ; [C4 1C      ] Compare Y with DP
    CPX $0C                 ; [E4 0C      ] Compare X with DP
    BEQ $89C0               ; [F0 04      ] Branch if Equal
    BEQ $89C2               ; [F0 04      ] Branch if Equal

;--- Patch at file offset $1489CC (SNES $D489CC) ---
org $D489CC

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]

;--- Patch at file offset $1489DE (SNES $D489DE) ---
org $D489DE

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1489EA (SNES $D489EA) ---
org $D489EA

    TRB $E400               ; [1C 00 E4   ] Test and Reset Bits Absolute
    CLC                     ; [18         ] Clear Carry Flag
    db $34                      ; Incomplete/data bytes

;--- Patch at file offset $1489FA (SNES $D489FA) ---
org $D489FA

    BRK                     ; [00 00      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    INY                     ; [C8         ] Increment Y
    SED                     ; [F8         ] Set Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    ORA [$2F]               ; [07 2F      ] OR A with [DP]
    BPL $8A63               ; [10 5E      ] Branch if Plus
    AND ($51,X)             ; [21 51      ] AND A with (DP,X)
    JSR $0070               ; [20 70 00   ] Jump to Subroutine
    AND $00,X               ; [35 00      ] AND A with DP,X
    ORA $1500,X             ; [1D 00 15   ] OR A with Absolute,X
    ORA $0701               ; [0D 01 07   ] OR A with Absolute
    ASL $1810               ; [0E 10 18   ] Shift Left Absolute
    AND [$06]               ; [27 06      ] AND A with [DP]
    AND $112E,Y             ; [39 2E 11   ] AND A with Absolute,Y
    COP #$18                ; [02 18      ] Coprocessor interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    CPX $CEF0               ; [EC F0 CE   ] Compare X with Absolute
    BEQ $8A03               ; [F0 DE      ] Branch if Equal
    CPX #$9C                ; [E0 9C      ] Compare X Immediate
    RTS                     ; [60         ] Return from Subroutine
    JSR ($FC00,X)           ; [FC 00 FC   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRA $8A41               ; [80 10      ] Branch Always
    BEQ $8A63               ; [F0 30      ] Branch if Equal
    PEA $E428               ; [F4 28 E4   ] Push Effective Absolute
    PLA                     ; [68         ] Pull Accumulator
    RTS                     ; [60         ] Return from Subroutine
    BRA $8A42               ; [80 08      ] Branch Always
    JSR $08C8               ; [20 C8 08   ] Jump to Subroutine
    STZ $04                 ; [64 04      ] Store Zero to DP
    RTI                     ; [40         ] Return from Interrupt
    ADC $0D,X               ; [75 0D      ] Add with Carry DP,X
    PHA                     ; [48         ] Push Accumulator
    BRK                     ; [00 2F      ] Software interrupt
    BRK                     ; [00 3F      ] Software interrupt
    ORA $513F5F             ; [0F 5F 3F 51] OR A with Absolute Long
    AND $3F1F31,X           ; [3F 31 1F 3F] AND A with Absolute Long,X
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 32      ] Software interrupt
    AND $1F,X               ; [35 1F      ] AND A with DP,X
    ORA $3F1F1F,X           ; [1F 1F 1F 3F] OR A with Absolute Long,X
    BMI $8A9A               ; [30 3F      ] Branch if Minus
    JSR $001F               ; [20 1F 00   ] Jump to Subroutine
    BRK                     ; [00 00      ] Software interrupt
    LSR $80                 ; [46 80      ] Shift Right DP
    DEX                     ; [CA         ] Decrement X
    BRK                     ; [00 DA      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    PLX                     ; [FA         ] Pull X Register
    STZ $0C9A               ; [9C 9A 0C   ] Store Zero to Absolute
    TXS                     ; [9A         ] Transfer X to Stack Pointer
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    BRK                     ; [00 38      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    STZ $74,X               ; [74 74      ] Store Zero to DP,X
    CPX $E4                 ; [E4 E4      ] Compare X with DP
    CPY #$D8                ; [C0 D8      ] Compare Y Immediate
    STY $9C                 ; [84 9C      ] Store Y to DP
    STZ $0C                 ; [64 0C      ] Store Zero to DP
    MVP $24,$00             ; [44 24 00   ] Block Move Positive
    BRK                     ; [00 51      ] Software interrupt
    JSR $003C               ; [20 3C 00   ] Jump to Subroutine
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BPL $8A8C               ; [10 00      ] Branch if Plus
    ORA $1700,Y             ; [19 00 17   ] OR A with Absolute,Y
    BRK                     ; [00 07      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    ORA $10,S               ; [03 10      ] OR A with Stack Relative
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    ORA ($09,X)             ; [01 09      ] OR A with (DP,X)
    ORA #$0F                ; [09 0F      ] OR A with Immediate
    TSB $0F                 ; [04 0F      ] Test and Set Bits in DP
    TSB $1A                 ; [04 1A      ] Test and Set Bits in DP
    ORA ($1E,X)             ; [01 1E      ] OR A with (DP,X)
    ORA $1D3C               ; [0D 3C 1D   ] OR A with Absolute
    ROL $1F                 ; [26 1F      ] Rotate Left DP
    RTI                     ; [40         ] Return from Interrupt
    AND $06007F,X           ; [3F 7F 00 06] AND A with Absolute Long,X
    COP #$06                ; [02 06      ] Coprocessor interrupt
    COP #$07                ; [02 07      ] Coprocessor interrupt
    ASL $0F                 ; [06 0F      ] Shift Left DP
    ASL $161F               ; [0E 1F 16   ] Shift Left Absolute
    ORA $003F02,X           ; [1F 02 3F 00] OR A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $15                 ; [06 15      ] Shift Left DP
    ASL $13                 ; [06 13      ] Shift Left DP
    BRK                     ; [00 1B      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    SEC                     ; [38         ] Set Carry Flag
    ORA $10,S               ; [03 10      ] OR A with Stack Relative
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    BRK                     ; [00 0D      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    COP #$00                ; [02 00      ] Coprocessor interrupt
    ORA ($CE,X)             ; [01 CE      ] OR A with (DP,X)
    BMI $8ADF               ; [30 FC      ] Branch if Minus
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 1E      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 AC      ] Software interrupt
    INY                     ; [C8         ] Increment Y
    LDY $30,X               ; [B4 30      ] Load Y from DP,X
    PLA                     ; [68         ] Pull Accumulator
    BRA $8AFD               ; [80 08      ] Branch Always
    CPX #$58                ; [E0 58      ] Compare X Immediate
    BRA $8B15               ; [80 1C      ] Branch Always
    BRK                     ; [00 EC      ] Software interrupt
    CPX #$30                ; [E0 30      ] Compare X Immediate
    BIT $58,X               ; [34 58      ] Test Bits DP,X
    CLD                     ; [D8         ] Clear Decimal Flag
    ORA ($01,S),Y           ; [13 01      ] OR A with (SR),Y
    ORA ($01,S),Y           ; [13 01      ] OR A with (SR),Y
    ORA $192B0C,X           ; [1F 0C 2B 19] OR A with Absolute Long,X
    ROL                     ; [2A         ] Rotate Left Accumulator
    ORA $3F56,Y             ; [19 56 3F   ] OR A with Absolute,Y
    RTS                     ; [60         ] Return from Subroutine
    AND $0C007F,X           ; [3F 7F 00 0C] AND A with Absolute Long,X
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    TSB $1E1F               ; [0C 1F 1E   ] Test and Set Bits Absolute
    ORA $263F1E,X           ; [1F 1E 3F 26] OR A with Absolute Long,X
    AND $000020,X           ; [3F 20 00 00] AND A with Absolute Long,X
    TSB $F0                 ; [04 F0      ] Test and Set Bits in DP
    DEY                     ; [88         ] Decrement Y
    BEQ $8AAD               ; [F0 88      ] Branch if Equal
    BEQ $8B0B               ; [F0 E4      ] Branch if Equal
    SEI                     ; [78         ] Set Interrupt Disable
    PEA $7EB8               ; [F4 B8 7E   ] Push Effective Absolute
    CPY $F03E               ; [CC 3E F0   ] Compare Y with Absolute
    JSR ($F800,X)           ; [FC 00 F8   ] Jump to Subroutine Indirect,X
    SED                     ; [F8         ] Set Decimal Flag
    BVS $8B24               ; [70 F0      ] Branch if Overflow Set
    BVS $8B26               ; [70 F0      ] Branch if Overflow Set
    CLC                     ; [18         ] Clear Carry Flag
    SEI                     ; [78         ] Set Interrupt Disable
    DEY                     ; [88         ] Decrement Y
    SEC                     ; [38         ] Set Carry Flag
    CPY #$0C                ; [C0 0C      ] Compare Y Immediate
    BEQ $8B3E               ; [F0 00      ] Branch if Equal
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ROL $C200,X             ; [3E 00 C2   ] Rotate Left Absolute,X
    BIT $F8F4,X             ; [3C F4 F8   ] Test Bits Absolute,X
    CPX $F8                 ; [E4 F8      ] Compare X with DP
    INC $F8                 ; [E6 F8      ] Increment DP
    LDX $0070               ; [AE 70 00   ] Load X from Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BIT $F808,X             ; [3C 08 F8   ] Test Bits Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    MVN $70,$CE             ; [54 70 CE   ] Block Move Negative
    BMI $8B5F               ; [30 FC      ] Branch if Minus
    BRK                     ; [00 E4      ] Software interrupt
    BRK                     ; [00 E4      ] Software interrupt
    JSR $30FE               ; [20 FE 30   ] Jump to Subroutine
    DEC $9E70,X             ; [DE 70 9E   ] Decrement Absolute,X
    BVS $8B8B               ; [70 1C      ] Branch if Overflow Set
    BEQ $8B25               ; [F0 B4      ] Branch if Equal
    BMI $8BD3               ; [30 60      ] Branch if Minus
    BRA $8B8D               ; [80 18      ] Branch Always
    CPY #$38                ; [C0 38      ] Compare Y Immediate
    LDY #$30                ; [A0 30      ] Load Y Immediate
    BMI $8BEF               ; [30 74      ] Branch if Minus
    BPL $8BED               ; [10 70      ] Branch if Plus
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 4F      ] Software interrupt
    ORA $4E                 ; [05 4E      ] OR A with Direct Page
    ORA $32                 ; [05 32      ] OR A with Direct Page
    ORA #$2E                ; [09 2E      ] OR A with Immediate
    ORA $1D2C,X             ; [1D 2C 1D   ] OR A with Absolute,X
    LSR $3F,X               ; [56 3F      ] Shift Right DP,X
    RTS                     ; [60         ] Return from Subroutine
    AND $37007F,X           ; [3F 7F 00 37] AND A with Absolute Long,X
    ORA $27,S               ; [03 27      ] OR A with Stack Relative
    ORA ($0F)               ; [12 0F      ] OR A with (DP)
    ASL $1F                 ; [06 1F      ] Shift Left DP
    ASL $161F,X             ; [1E 1F 16   ] Shift Left Absolute,X
    AND $203F22,X           ; [3F 22 3F 20] AND A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BIT $E8,X               ; [34 E8      ] Test Bits DP,X
    STZ $98,X               ; [74 98      ] Store Zero to DP,X
    STZ $D8,X               ; [74 D8      ] Store Zero to DP,X
    PLY                     ; [7A         ] Pull Y Register
    CPX $EC3A               ; [EC 3A EC   ] Compare X with Absolute
    ROL $3EF4,X             ; [3E F4 3E   ] Rotate Left Absolute,X
    CPX $EC                 ; [E4 EC      ] Compare X with DP
    BRK                     ; [00 E8      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    DEY                     ; [88         ] Decrement Y
    CLC                     ; [18         ] Clear Carry Flag
    INY                     ; [C8         ] Increment Y
    CLC                     ; [18         ] Clear Carry Flag
    CPX $0C                 ; [E4 0C      ] Compare X with DP
    CPX $0C                 ; [E4 0C      ] Compare X with DP
    BEQ $8BC0               ; [F0 04      ] Branch if Equal
    CPX #$04                ; [E0 04      ] Compare X Immediate

;--- Patch at file offset $148BC4 (SNES $D48BC4) ---
org $D48BC4

    ORA [$00]               ; [07 00      ] OR A with [DP]
    CLC                     ; [18         ] Clear Carry Flag
    ORA [$27]               ; [07 27      ] OR A with [DP]
    ORA $102F,Y             ; [19 2F 10   ] OR A with Absolute,Y
    CLI                     ; [58         ] Clear Interrupt Disable
    AND ($51,X)             ; [21 51      ] AND A with (DP,X)
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $148BD7 (SNES $D48BD7) ---
org $D48BD7

    ORA [$04]               ; [07 04      ] OR A with [DP]
    ORA $1608,Y             ; [19 08 16   ] OR A with Absolute,Y
    ASL $29,X               ; [16 29      ] Shift Left DP,X
    ORA [$38]               ; [07 38      ] OR A with [DP]
    BRK                     ; [00 00      ] Software interrupt
    ROL $C200,X             ; [3E 00 C2   ] Rotate Left Absolute,X
    BIT $F8F4,X             ; [3C F4 F8   ] Test Bits Absolute,X
    CPX $F8                 ; [E4 F8      ] Compare X with DP
    INC $F8                 ; [E6 F8      ] Increment DP
    LDX $CE70               ; [AE 70 CE   ] Load X from Absolute
    BMI $8BF1               ; [30 00      ] Branch if Minus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BIT $F808,X             ; [3C 08 F8   ] Test Bits Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    MVN $70,$B4             ; [54 70 B4   ] Block Move Negative
    BMI $8C3D               ; [30 3C      ] Branch if Minus
    BRK                     ; [00 76      ] Software interrupt
    TSB $54                 ; [04 54      ] Test and Set Bits in DP
    ASL $54                 ; [06 54      ] Shift Left DP
    ASL $70                 ; [06 70      ] Shift Left DP
    JSR $3159               ; [20 59 31   ] Jump to Subroutine
    AND $051F11             ; [2F 11 1F 05] AND A with Absolute Long
    ORA $10,S               ; [03 10      ] OR A with Stack Relative
    PHP                     ; [08         ] Push Processor Status
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    AND ($2E,X)             ; [21 2E      ] AND A with (DP,X)
    AND ($37,X)             ; [21 37      ] AND A with (DP,X)
    ORA ($19,X)             ; [01 19      ] OR A with (DP,X)
    ORA #$0F                ; [09 0F      ] OR A with Immediate
    PHD                     ; [0B         ] Push Direct Page Register
    INC $CE00,X             ; [FE 00 CE   ] Increment Absolute,X
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BVS $8BE7               ; [70 BE      ] Branch if Overflow Set
    RTS                     ; [60         ] Return from Subroutine
    TRB $38E0               ; [1C E0 38   ] Test and Reset Bits Absolute
    CPX #$68                ; [E0 68      ] Compare X Immediate
    BNE $8BF5               ; [D0 C4      ] Branch if Not Equal
    BRK                     ; [00 24      ] Software interrupt
    BCC $8C59               ; [90 24      ] Branch if Carry Clear
    BPL $8CAB               ; [10 74      ] Branch if Plus
    BVS $8CA1               ; [70 68      ] Branch if Overflow Set
    BIT $E8                 ; [24 E8      ] Test Bits DP
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 D0      ] Software interrupt
    BPL $8C5F               ; [10 1E      ] Branch if Plus
    ORA $091A               ; [0D 1A 09   ] OR A with Absolute
    ROL $2C1D               ; [2E 1D 2C   ] Rotate Left Absolute
    ORA $3F6E,X             ; [1D 6E 3F   ] OR A with Absolute,X
    PLA                     ; [68         ] Pull Accumulator
    AND $3F2F7C,X           ; [3F 7C 2F 3F] AND A with Absolute Long,X
    ORA [$0F]               ; [07 0F      ] OR A with [DP]
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA $1E1F0E             ; [0F 0E 1F 1E] OR A with Absolute Long
    ORA $3A1F1E,X           ; [1F 1E 1F 3A] OR A with Absolute Long,X
    ORA $280F38,X           ; [1F 38 0F 28] OR A with Absolute Long,X
    ORA [$07]               ; [07 07      ] OR A with [DP]
    PLA                     ; [68         ] Pull Accumulator
    BCS $8CCB               ; [B0 68      ] Branch if Carry Set
    BCS $8CC9               ; [B0 64      ] Branch if Carry Set
    CLV                     ; [B8         ] Clear Overflow Flag
    STZ $D8,X               ; [74 D8      ] Store Zero to DP,X
    STZ $D8,X               ; [74 D8      ] Store Zero to DP,X
    SEI                     ; [78         ] Set Interrupt Disable
    JML [$E8FC]             ; [DC FC E8   ] Jump Long Indirect
    JSR ($9080,X)           ; [FC 80 90   ] Jump to Subroutine Indirect,X
    BMI $8C03               ; [30 90      ] Branch if Minus
    BMI $8C0D               ; [30 98      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    INY                     ; [C8         ] Increment Y
    CLC                     ; [18         ] Clear Carry Flag
    INY                     ; [C8         ] Increment Y
    CLC                     ; [18         ] Clear Carry Flag
    CPY $1C                 ; [C4 1C      ] Compare Y with DP
    CPX #$08                ; [E0 08      ] Compare X Immediate
    BRA $8C00               ; [80 80      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    ORA $0F1C00,X           ; [1F 00 1C 0F] OR A with Absolute Long,X
    ORA $070B07             ; [0F 07 0B 07] OR A with Absolute Long
    ORA $0C03               ; [0D 03 0C   ] OR A with Absolute
    ORA $17,S               ; [03 17      ] OR A with Stack Relative
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA $0F,S               ; [03 0F      ] OR A with Stack Relative
    BRK                     ; [00 07      ] Software interrupt
    TSB $07                 ; [04 07      ] Test and Set Bits in DP
    COP #$03                ; [02 03      ] Coprocessor interrupt
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    TSB $08                 ; [04 08      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    JML [$3E00]             ; [DC 00 3E   ] Jump Long Indirect
    CPY #$BF                ; [C0 BF      ] Compare Y Immediate
    CPY #$BF                ; [C0 BF      ] Compare Y Immediate
    CPY #$77                ; [C0 77      ] Compare Y Immediate
    DEY                     ; [88         ] Decrement Y
    CMP $000030             ; [CF 30 00 00] Compare A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    JML [$40C0]             ; [DC C0 40   ] Jump Long Indirect
    DEC $52                 ; [C6 52      ] Decrement DP
    INY                     ; [C8         ] Increment Y
    LDA ($88)               ; [B2 88      ] Load A from (DP)
    PHA                     ; [48         ] Push Accumulator
    BIT $16,X               ; [34 16      ] Test Bits DP,X
    PHP                     ; [08         ] Push Processor Status
    BIT $5C10               ; [2C 10 5C   ] Test Bits Absolute
    JSR $205C               ; [20 5C 20   ] Jump to Subroutine
    ADC ($00,S),Y           ; [73 00      ] Add with Carry (SR),Y
    AND ($00)               ; [32 00      ] AND A with (DP)
    RTL                     ; [6B         ] Return from Subroutine Long
    SEC                     ; [38         ] Set Carry Flag
    EOR [$38]               ; [47 38      ] XOR A with [DP]
    TSB $0B                 ; [04 0B      ] Test and Set Bits in DP
    ORA $14,S               ; [03 14      ] OR A with Stack Relative
    ORA ($24,S),Y           ; [13 24      ] OR A with (SR),Y
    ORA ($20,S),Y           ; [13 20      ] OR A with (SR),Y
    PHP                     ; [08         ] Push Processor Status
    TSB $0D                 ; [04 0D      ] Test and Set Bits in DP
    BRK                     ; [00 38      ] Software interrupt
    TSB $033B               ; [0C 3B 03   ] Test and Set Bits Absolute
    ROR $3E00,X             ; [7E 00 3E   ] Rotate Right Absolute,X
    BRK                     ; [00 2E      ] Software interrupt
    BRK                     ; [00 4C      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 7D      ] Software interrupt
    BRK                     ; [00 9A      ] Software interrupt
    BRK                     ; [00 9D      ] Software interrupt
    INC                     ; [1A         ] Increment Accumulator
    BMI $8CBE               ; [30 CC      ] Branch if Minus
    DEY                     ; [88         ] Decrement Y
    STZ $98,X               ; [74 98      ] Store Zero to DP,X
    MVP $90,$28             ; [44 90 28   ] Block Move Positive
    BRA $8D5A               ; [80 60      ] Branch Always
    STZ $4C1E,X             ; [9E 1E 4C   ] Store Zero to Absolute,X
    BIT $1A7A               ; [2C 7A 1A   ] Test Bits Absolute
    AND $19                 ; [25 19      ] AND A with Direct Page
    ORA $3701,X             ; [1D 01 37   ] OR A with Absolute,X
    INC                     ; [1A         ] Increment Accumulator
    AND $3E7A16,X           ; [3F 16 7A 3E] AND A with Absolute Long,X
    ADC ($1F,S),Y           ; [73 1F      ] Add with Carry (SR),Y
    CLC                     ; [18         ] Clear Carry Flag
    ORA [$07]               ; [07 07      ] OR A with [DP]
    BRK                     ; [00 1B      ] Software interrupt
    COP #$03                ; [02 03      ] Coprocessor interrupt
    COP #$0B                ; [02 0B      ] Coprocessor interrupt
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    ORA [$13]               ; [07 13      ] OR A with [DP]
    ORA $131F33,X           ; [1F 33 1F 13] OR A with Absolute Long,X
    ORA [$00]               ; [07 00      ] OR A with [DP]
    BRK                     ; [00 00      ] Software interrupt
    SBC $1A                 ; [E5 1A      ] Subtract with Borrow DP
    SBC $1A                 ; [E5 1A      ] Subtract with Borrow DP
    LDA $DD26,X             ; [BD 26 DD   ] Load A from Absolute,X
    ROR $19,X               ; [76 19      ] Rotate Right DP,X
    ROR $DEF9               ; [6E F9 DE   ] Rotate Right Absolute
    PLY                     ; [7A         ] Pull Y Register
    CPY $00FC               ; [CC FC 00   ] Compare Y with Absolute
    TXS                     ; [9A         ] Transfer X to Stack Pointer
    BRL $500E               ; [82 DA C2   ] Branch Long

;--- Patch at file offset $148D3B (SNES $D48D3B) ---
org $D48D3B

    db $9E                      ; Incomplete/data bytes

;--- Patch at file offset $148D44 (SNES $D48D44) ---
org $D48D44

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    CLC                     ; [18         ] Clear Carry Flag
    ORA [$27]               ; [07 27      ] OR A with [DP]
    ORA $112F,Y             ; [19 2F 11   ] OR A with Absolute,Y
    db $5F, $20                 ; Incomplete/data bytes

;--- Patch at file offset $148D56 (SNES $D48D56) ---
org $D48D56

    BRK                     ; [00 00      ] Software interrupt
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    TSB $19                 ; [04 19      ] Test and Set Bits in DP
    TSB $1811               ; [0C 11 18   ] Test and Set Bits Absolute
    ROL $00                 ; [26 00      ] Rotate Left DP
    BRK                     ; [00 1C      ] Software interrupt
    BRK                     ; [00 E4      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    BIT $F8,X               ; [34 F8      ] Test Bits DP,X
    CPX $EEF0               ; [EC F0 EE   ] Compare X with Absolute
    BEQ $8D3B               ; [F0 CE      ] Branch if Equal
    BEQ $8D4D               ; [F0 DE      ] Branch if Equal
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    INY                     ; [C8         ] Increment Y
    SED                     ; [F8         ] Set Decimal Flag
    BPL $8D6A               ; [10 F0      ] Branch if Plus
    BPL $8D70               ; [10 F4      ] Branch if Plus
    BMI $8D72               ; [30 F4      ] Branch if Minus
    PLP                     ; [28         ] Pull Processor Status
    CPX $50                 ; [E4 50      ] Compare X with DP
    AND ($70,X)             ; [21 70      ] AND A with (DP,X)
    BRK                     ; [00 32      ] Software interrupt
    BRK                     ; [00 14      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 6B      ] Software interrupt
    BRK                     ; [00 5D      ] Software interrupt
    BRK                     ; [00 2C      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    COP #$3D                ; [02 3D      ] Coprocessor interrupt
    AND $010C10             ; [2F 10 0C 01] AND A with Absolute Long
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($14,X)             ; [01 14      ] OR A with (DP,X)
    TRB $22                 ; [14 22      ] Test and Reset Bits DP
    JSR $091B               ; [20 1B 09   ] Jump to Subroutine
    STZ $FC60               ; [9C 60 FC   ] Store Zero to Absolute
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 24      ] Software interrupt
    BRK                     ; [00 D8      ] Software interrupt
    BVS $8E19               ; [70 68      ] Branch if Overflow Set
    RTS                     ; [60         ] Return from Subroutine
    CPX #$08                ; [E0 08      ] Compare X Immediate
    PHP                     ; [08         ] Push Processor Status
    CPX $48                 ; [E4 48      ] Compare X with DP
    STY $0C,X               ; [94 0C      ] Store Y to DP,X
    BPL $8D3B               ; [10 80      ] Branch if Plus
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    BVS $8E10               ; [70 50      ] Branch if Overflow Set
    BVC $8DE3               ; [50 21      ] Branch if Overflow Clear
    BVS $8DC4               ; [70 00      ] Branch if Overflow Set
    AND ($00)               ; [32 00      ] AND A with (DP)
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    BPL $8DCA               ; [10 00      ] Branch if Plus
    RTL                     ; [6B         ] Return from Subroutine Long
    BRK                     ; [00 5D      ] Software interrupt
    BRK                     ; [00 2C      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    COP #$3D                ; [02 3D      ] Coprocessor interrupt
    AND $010C10             ; [2F 10 0C 01] AND A with Absolute Long
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($14,X)             ; [01 14      ] OR A with (DP,X)
    TRB $22                 ; [14 22      ] Test and Reset Bits DP
    JSR $091B               ; [20 1B 09   ] Jump to Subroutine
    STZ $FC60               ; [9C 60 FC   ] Store Zero to Absolute
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 24      ] Software interrupt
    BRK                     ; [00 D8      ] Software interrupt
    BVS $8E59               ; [70 68      ] Branch if Overflow Set
    RTS                     ; [60         ] Return from Subroutine
    CPX #$08                ; [E0 08      ] Compare X Immediate
    PHP                     ; [08         ] Push Processor Status
    CPX $48                 ; [E4 48      ] Compare X with DP
    STY $0C,X               ; [94 0C      ] Store Y to DP,X
    BPL $8D7B               ; [10 80      ] Branch if Plus
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    BVS $8E50               ; [70 50      ] Branch if Overflow Set
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    INC                     ; [1A         ] Increment Accumulator
    ORA [$27]               ; [07 27      ] OR A with [DP]
    ORA $501F29,X           ; [1F 29 1F 50] OR A with Absolute Long,X
    TSC                     ; [3B         ] Transfer Stack Pointer to A

;--- Patch at file offset $148E16 (SNES $D48E16) ---
org $D48E16

    BRK                     ; [00 00      ] Software interrupt
    COP #$04                ; [02 04      ] Coprocessor interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$12                ; [09 12      ] OR A with Immediate
    BPL $8E45               ; [10 25      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    RTI                     ; [40         ] Return from Interrupt
    SED                     ; [F8         ] Set Decimal Flag
    JSR $D8A4               ; [20 A4 D8   ] Jump to Subroutine
    NOP                     ; [EA         ] No Operation
    JML [$EC16]             ; [DC 16 EC   ] Jump Long Indirect
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $8DB8               ; [80 80      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRA $8E44               ; [80 08      ] Branch Always
    INY                     ; [C8         ] Increment Y
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    AND ($2C),Y             ; [31 2C      ] AND A with (DP),Y
    BPL $8E5B               ; [10 16      ] Branch if Plus
    BRK                     ; [00 16      ] Software interrupt
    COP #$16                ; [02 16      ] Coprocessor interrupt
    COP #$10                ; [02 10      ] Coprocessor interrupt
    BRK                     ; [00 38      ] Software interrupt
    BRK                     ; [00 5F      ] Software interrupt
    BPL $8E51               ; [10 00      ] Branch if Plus
    ROL $0300               ; [2E 00 03   ] Rotate Left Absolute
    TSB $0C01               ; [0C 01 0C   ] Test and Set Bits Absolute
    ORA $0C,S               ; [03 0C      ] OR A with Stack Relative
    ORA $0E,S               ; [03 0E      ] OR A with Stack Relative
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($20,X)             ; [01 20      ] OR A with (DP,X)
    ASL $D6                 ; [06 D6      ] Shift Left DP
    CPX $E87C               ; [EC 7C E8   ] Compare X with Absolute
    TRB $2CE8               ; [1C E8 2C   ] Test and Reset Bits Absolute
    TYA                     ; [98         ] Transfer Y to A
    ROL $6E1C,X             ; [3E 1C 6E   ] Rotate Left Absolute,X
    TRB $4CBA               ; [1C BA 4C   ] Test and Reset Bits Absolute
    PEA $C408               ; [F4 08 C4   ] Push Effective Absolute
    BRK                     ; [00 68      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 48      ] Software interrupt
    BRK                     ; [00 5C      ] Software interrupt
    BRA $8E87               ; [80 0C      ] Branch Always
    BRA $8EC5               ; [80 48      ] Branch Always
    JSR $6000               ; [20 00 60   ] Jump to Subroutine
    LSR $3A00               ; [4E 00 3A   ] Shift Right Absolute
    TSB $0B                 ; [04 0B      ] Test and Set Bits in DP
    TSB $09                 ; [04 09      ] Test and Set Bits in DP
    ASL $06                 ; [06 06      ] Shift Left DP
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 25      ] Software interrupt
    TRB $0005               ; [1C 05 00   ] Test and Reset Bits Absolute
    ORA $02                 ; [05 02      ] OR A with Direct Page
    ASL $01                 ; [06 01      ] Shift Left DP
    BRK                     ; [00 01      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BVC $8EE2               ; [50 40      ] Branch if Overflow Clear
    BVC $8EE4               ; [50 40      ] Branch if Overflow Clear
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 40      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRA $8E6F               ; [80 C0      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    JSR $A000               ; [20 00 A0   ] Jump to Subroutine
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 C0      ] Software interrupt

;--- Patch at file offset $148EC4 (SNES $D48EC4) ---
org $D48EC4

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    INC                     ; [1A         ] Increment Accumulator
    ORA [$27]               ; [07 27      ] OR A with [DP]
    ORA $501F29,X           ; [1F 29 1F 50] OR A with Absolute Long,X
    TSC                     ; [3B         ] Transfer Stack Pointer to A

;--- Patch at file offset $148ED6 (SNES $D48ED6) ---
org $D48ED6

    BRK                     ; [00 00      ] Software interrupt
    COP #$04                ; [02 04      ] Coprocessor interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$12                ; [09 12      ] OR A with Immediate
    BPL $8F05               ; [10 25      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    RTI                     ; [40         ] Return from Interrupt
    SED                     ; [F8         ] Set Decimal Flag
    JSR $D8A4               ; [20 A4 D8   ] Jump to Subroutine
    NOP                     ; [EA         ] No Operation
    JML [$EC16]             ; [DC 16 EC   ] Jump Long Indirect
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $8E78               ; [80 80      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRA $8F04               ; [80 08      ] Branch Always
    INY                     ; [C8         ] Increment Y
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    AND ($22),Y             ; [31 22      ] AND A with (DP),Y
    BPL $8F23               ; [10 1E      ] Branch if Plus
    COP #$16                ; [02 16      ] Coprocessor interrupt
    COP #$1E                ; [02 1E      ] Coprocessor interrupt
    COP #$28                ; [02 28      ] Coprocessor interrupt
    BRK                     ; [00 69      ] Software interrupt
    JSR $105E               ; [20 5E 10   ] Jump to Subroutine
    BRK                     ; [00 2E      ] Software interrupt
    TSB $09                 ; [04 09      ] Test and Set Bits in DP
    BRK                     ; [00 03      ] Software interrupt
    TSB $0403               ; [0C 03 04   ] Test and Set Bits Absolute
    ORA $16,S               ; [03 16      ] OR A with Stack Relative
    ORA ($16,X)             ; [01 16      ] OR A with (DP,X)
    BRK                     ; [00 01      ] Software interrupt
    BIT $D6                 ; [24 D6      ] Test Bits DP
    CPX $E87C               ; [EC 7C E8   ] Compare X with Absolute
    TRB $2CE8               ; [1C E8 2C   ] Test and Reset Bits Absolute
    TYA                     ; [98         ] Transfer Y to A
    ROL $761C               ; [2E 1C 76   ] Rotate Left Absolute
    TSB $48B4               ; [0C B4 48   ] Test and Set Bits Absolute
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 C4      ] Software interrupt
    BRK                     ; [00 68      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 48      ] Software interrupt
    BRK                     ; [00 4C      ] Software interrupt
    BRA $8F3F               ; [80 04      ] Branch Always
    BRA $8F7D               ; [80 40      ] Branch Always
    JSR $6080               ; [20 80 60   ] Jump to Subroutine
    ROL $1F00               ; [2E 00 1F   ] Rotate Left Absolute
    ORA ($0B,X)             ; [01 0B      ] OR A with (DP,X)
    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $148F4C (SNES $D48F4C) ---
org $D48F4C

    PHD                     ; [0B         ] Push Direct Page Register
    COP #$0E                ; [02 0E      ] Coprocessor interrupt
    BRK                     ; [00 05      ] Software interrupt
    TRB $0400               ; [1C 00 04   ] Test and Reset Bits Absolute
    ORA $02                 ; [05 02      ] OR A with Direct Page

;--- Patch at file offset $148F5C (SNES $D48F5C) ---
org $D48F5C

    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BCC $8EE2               ; [90 80      ] Branch if Carry Clear
    JSR $F000               ; [20 00 F0   ] Jump to Subroutine
    BRK                     ; [00 78      ] Software interrupt
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $148F71 (SNES $D48F71) ---
org $D48F71

    JSR $C000               ; [20 00 C0   ] Jump to Subroutine
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRA $8FE8               ; [80 70      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    STZ $7A00,X             ; [9E 00 7A   ] Store Zero to Absolute,X
    TSB $0B                 ; [04 0B      ] Test and Set Bits in DP
    TSB $11                 ; [04 11      ] Test and Set Bits in DP
    ASL $0022               ; [0E 22 00   ] Shift Left Absolute
    EOR $10,X               ; [55 10      ] XOR A with DP,X
    SEC                     ; [38         ] Set Carry Flag
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 45      ] Software interrupt
    BIT $0005               ; [2C 05 00   ] Test Bits Absolute
    ORA $02                 ; [05 02      ] OR A with Direct Page
    ASL $1001               ; [0E 01 10   ] Shift Left Absolute
    ORA $2028               ; [0D 28 20   ] OR A with Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CLI                     ; [58         ] Clear Interrupt Disable
    RTI                     ; [40         ] Return from Interrupt
    BVC $8FE4               ; [50 40      ] Branch if Overflow Clear
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BEQ $8FA8               ; [F0 00      ] Branch if Equal
    JSR $3000               ; [20 00 30   ] Jump to Subroutine
    JSR $20B0               ; [20 B0 20   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 80      ] Software interrupt
    JSR $2080               ; [20 80 20   ] Jump to Subroutine
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $148FC8 (SNES $D48FC8) ---
org $D48FC8

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    db $0E, $00                 ; Incomplete/data bytes

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
    db $B0                      ; Incomplete/data bytes

;--- Patch at file offset $148FFB (SNES $D48FFB) ---
org $D48FFB

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BPL $9036               ; [10 35      ] Branch if Plus
    ASL $3F4F               ; [0E 4F 3F   ] Shift Left Absolute
    EOR ($3F,S),Y           ; [53 3F      ] XOR A with (SR),Y
    LDY #$77                ; [A0 77      ] Load Y Immediate
    STA ($63,X)             ; [81 63      ] Store A to (DP,X)
    CLI                     ; [58         ] Clear Interrupt Disable
    AND ($2C,X)             ; [21 2C      ] AND A with (DP,X)
    ORA ($2C,X)             ; [01 2C      ] OR A with (DP,X)
    ORA $04                 ; [05 04      ] OR A with Direct Page
    PHP                     ; [08         ] Push Processor Status
    ORA $241330             ; [0F 30 13 24] OR A with Absolute Long
    JSR $014B               ; [20 4B 01   ] Jump to Subroutine
    JML $100600             ; [5C 00 06 10] Jump Long
    COP #$18                ; [02 18      ] Coprocessor interrupt
    ASL $D4                 ; [06 D4      ] Shift Left DP
    SEI                     ; [78         ] Set Interrupt Disable
    MVN $B8,$EC             ; [54 B8 EC   ] Block Move Negative
    TYA                     ; [98         ] Transfer Y to A
    BIT $ACD8               ; [2C D8 AC   ] Test Bits Absolute
    BNE $9017               ; [D0 EC      ] Branch if Not Equal
    CLD                     ; [D8         ] Clear Decimal Flag
    LSR $56AC,X             ; [5E AC 56   ] Shift Right Absolute,X
    BIT $0810               ; [2C 10 08   ] Test Bits Absolute
    BPL $903C               ; [10 08      ] Branch if Plus
    DEY                     ; [88         ] Decrement Y
    BRK                     ; [00 08      ] Software interrupt
    BRA $8FB9               ; [80 80      ] Branch Always
    BRK                     ; [00 C8      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    BRK                     ; [00 84      ] Software interrupt
    BRK                     ; [00 2C      ] Software interrupt
    TSB $21                 ; [04 21      ] Test and Set Bits in DP
    BRK                     ; [00 5F      ] Software interrupt
    BRK                     ; [00 52      ] Software interrupt
    COP #$32                ; [02 32      ] Coprocessor interrupt
    COP #$0F                ; [02 0F      ] Coprocessor interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA $0F,S               ; [03 0F      ] OR A with Stack Relative
    BRK                     ; [00 18      ] Software interrupt
    ORA [$1C]               ; [07 1C      ] OR A with [DP]
    COP #$20                ; [02 20      ] Coprocessor interrupt
    BRK                     ; [00 0C      ] Software interrupt
    AND ($00,X)             ; [21 00      ] AND A with (DP,X)
    ORA $0000               ; [0D 00 00   ] OR A with Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    INC $0C,X               ; [F6 0C      ] Increment DP,X
    STZ $88,X               ; [74 88      ] Store Zero to DP,X
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 78      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 1C      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BEQ $9070               ; [F0 00      ] Branch if Equal
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    BRA $90B4               ; [80 40      ] Branch Always
    BPL $9036               ; [10 C0      ] Branch if Plus
    BPL $8FF8               ; [10 80      ] Branch if Plus
    BVS $9082               ; [70 08      ] Branch if Overflow Set
    BRA $90F4               ; [80 78      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    AND ($2C),Y             ; [31 2C      ] AND A with (DP),Y
    BPL $909B               ; [10 16      ] Branch if Plus
    BRK                     ; [00 16      ] Software interrupt
    COP #$16                ; [02 16      ] Coprocessor interrupt
    COP #$10                ; [02 10      ] Coprocessor interrupt
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ROL $0300               ; [2E 00 03   ] Rotate Left Absolute
    TSB $0C01               ; [0C 01 0C   ] Test and Set Bits Absolute
    ORA $0C,S               ; [03 0C      ] OR A with Stack Relative
    ORA $0E,S               ; [03 0E      ] OR A with Stack Relative
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA [$1E]               ; [07 1E      ] OR A with [DP]
    BRK                     ; [00 0A      ] Software interrupt
    TSB $0B                 ; [04 0B      ] Test and Set Bits in DP
    TSB $11                 ; [04 11      ] Test and Set Bits in DP
    ASL $0022               ; [0E 22 00   ] Shift Left Absolute
    EOR $10,X               ; [55 10      ] XOR A with DP,X
    SEC                     ; [38         ] Set Carry Flag
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 05      ] Software interrupt
    TSB $0005               ; [0C 05 00   ] Test and Set Bits Absolute
    ORA $02                 ; [05 02      ] OR A with Direct Page
    ASL $1001               ; [0E 01 10   ] Shift Left Absolute
    ORA $2028               ; [0D 28 20   ] OR A with Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    AND ($2C),Y             ; [31 2C      ] AND A with (DP),Y
    BPL $90DB               ; [10 16      ] Branch if Plus
    BRK                     ; [00 16      ] Software interrupt
    COP #$16                ; [02 16      ] Coprocessor interrupt
    COP #$10                ; [02 10      ] Coprocessor interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 24      ] Software interrupt
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    ROL $0300               ; [2E 00 03   ] Rotate Left Absolute
    TSB $0C01               ; [0C 01 0C   ] Test and Set Bits Absolute
    ORA $0C,S               ; [03 0C      ] OR A with Stack Relative
    ORA $0E,S               ; [03 0E      ] OR A with Stack Relative
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 13      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    DEC $EC,X               ; [D6 EC      ] Decrement DP,X
    JMP ($1CE8,X)           ; [7C E8 1C   ] Jump Indirect,X
    INX                     ; [E8         ] Increment X
    BIT $3E98               ; [2C 98 3E   ] Test Bits Absolute
    TRB $1C6E               ; [1C 6E 1C   ] Test and Reset Bits Absolute
    TSX                     ; [BA         ] Transfer Stack Pointer to X
    JMP $4834               ; [4C 34 48   ] Jump Absolute
    CPY $00                 ; [C4 00      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 48      ] Software interrupt
    BRK                     ; [00 5C      ] Software interrupt
    BRA $9107               ; [80 0C      ] Branch Always
    BRA $9145               ; [80 48      ] Branch Always
    BRK                     ; [00 C0      ] Software interrupt
    JSR $0424               ; [20 24 04   ] Jump to Subroutine
    ORA $000F00,X           ; [1F 00 0F 00] OR A with Absolute Long,X
    ORA ($0E),Y             ; [11 0E      ] OR A with (DP),Y
    JSL $105500             ; [22 00 55 10] Jump to Subroutine Long
    SEC                     ; [38         ] Set Carry Flag
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 10      ] Software interrupt
    PHD                     ; [0B         ] Push Direct Page Register
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ASL $1001               ; [0E 01 10   ] Shift Left Absolute
    ORA $2028               ; [0D 28 20   ] OR A with Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    JSR $20B0               ; [20 B0 20   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 00      ] Software interrupt
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRK                     ; [00 40      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    RTI                     ; [40         ] Return from Interrupt
    SED                     ; [F8         ] Set Decimal Flag
    JSR $D8A4               ; [20 A4 D8   ] Jump to Subroutine
    NOP                     ; [EA         ] No Operation
    JML [$EC16]             ; [DC 16 EC   ] Jump Long Indirect
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $90D8               ; [80 80      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRA $9164               ; [80 08      ] Branch Always
    INY                     ; [C8         ] Increment Y
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    CPY #$D6                ; [C0 D6      ] Compare Y Immediate
    CPX $EC78               ; [EC 78 EC   ] Compare X with Absolute
    BIT $24C0,X             ; [3C C0 24   ] Test Bits Absolute,X
    BRA $91CF               ; [80 66      ] Branch Always
    JSR $34BE               ; [20 BE 34   ] Jump to Subroutine
    ASL                     ; [0A         ] Shift Left Accumulator
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    CPY $00                 ; [C4 00      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 58      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    DEY                     ; [88         ] Decrement Y
    MVP $00,$E0             ; [44 00 E0   ] Block Move Positive
    BPL $91BF               ; [10 40      ] Branch if Plus
    LDY #$9F                ; [A0 9F      ] Load Y Immediate
    BRK                     ; [00 7B      ] Software interrupt
    TSB $0B                 ; [04 0B      ] Test and Set Bits in DP
    TSB $11                 ; [04 11      ] Test and Set Bits in DP
    ASL $0022               ; [0E 22 00   ] Shift Left Absolute
    EOR $10,X               ; [55 10      ] XOR A with DP,X
    SEC                     ; [38         ] Set Carry Flag
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 46      ] Software interrupt
    AND $040304             ; [2F 04 03 04] AND A with Absolute Long
    ORA $0E,S               ; [03 0E      ] OR A with Stack Relative
    ORA ($10,X)             ; [01 10      ] OR A with (DP,X)
    ORA $2028               ; [0D 28 20   ] OR A with Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    PEA $E808               ; [F4 08 E8   ] Push Effective Absolute
    BPL $9195               ; [10 F0      ] Branch if Plus
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    JSR $20B0               ; [20 B0 20   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 20      ] Software interrupt
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    BRA $91D5               ; [80 20      ] Branch Always
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRK                     ; [00 40      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1491C4 (SNES $D491C4) ---
org $D491C4

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    INC                     ; [1A         ] Increment Accumulator
    ORA [$27]               ; [07 27      ] OR A with [DP]
    ORA $501F29,X           ; [1F 29 1F 50] OR A with Absolute Long,X
    TSC                     ; [3B         ] Transfer Stack Pointer to A

;--- Patch at file offset $1491D6 (SNES $D491D6) ---
org $D491D6

    BRK                     ; [00 00      ] Software interrupt
    COP #$04                ; [02 04      ] Coprocessor interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$12                ; [09 12      ] OR A with Immediate
    BPL $9205               ; [10 25      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    SEI                     ; [78         ] Set Interrupt Disable
    RTI                     ; [40         ] Return from Interrupt
    CPX $38                 ; [E4 38      ] Compare X with DP
    TAX                     ; [AA         ] Transfer A to X
    JML [$DCEE]             ; [DC EE DC   ] Jump Long Indirect
    ASL $EC,X               ; [16 EC      ] Shift Left DP,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $9178               ; [80 80      ] Branch Always
    BRK                     ; [00 18      ] Software interrupt
    DEY                     ; [88         ] Decrement Y
    TSB $CC                 ; [04 CC      ] Test and Set Bits in DP
    BRK                     ; [00 04      ] Software interrupt
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    AND ($2C),Y             ; [31 2C      ] AND A with (DP),Y
    BPL $923B               ; [10 36      ] Branch if Plus
    BRK                     ; [00 56      ] Software interrupt
    COP #$56                ; [02 56      ] Coprocessor interrupt
    COP #$70                ; [02 70      ] Coprocessor interrupt
    JSR $0049               ; [20 49 00   ] Jump to Subroutine
    AND $2A0400             ; [2F 00 04 2A] AND A with Absolute Long
    BRK                     ; [00 03      ] Software interrupt
    TSB $2C01               ; [0C 01 2C   ] Test and Set Bits Absolute
    ORA $2C,S               ; [03 2C      ] OR A with Stack Relative
    ORA $0E,S               ; [03 0E      ] OR A with Stack Relative
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BMI $921F               ; [30 00      ] Branch if Minus
    ORA [$D6],Y             ; [17 D6      ] OR A with [DP],Y
    CPX $C47E               ; [EC 7E C4   ] Compare X with Absolute
    LSR                     ; [4A         ] Shift Right Accumulator
    STY $4A                 ; [84 4A      ] Store Y to DP
    STY $F6                 ; [84 F6      ] Store Y to DP
    JMP ($0C9E)             ; [6C 9E 0C   ] Jump Indirect
    TRB $3808               ; [1C 08 38   ] Test and Reset Bits Absolute
    BRK                     ; [00 C4      ] Software interrupt
    BRK                     ; [00 44      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BPL $923D               ; [10 04      ] Branch if Plus
    BRK                     ; [00 4C      ] Software interrupt
    JSR $20C8               ; [20 C8 20   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BRA $9260               ; [80 1F      ] Branch Always
    BRK                     ; [00 0B      ] Software interrupt
    TSB $0B                 ; [04 0B      ] Test and Set Bits in DP
    TSB $09                 ; [04 09      ] Test and Set Bits in DP
    ASL $06                 ; [06 06      ] Shift Left DP
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA $040304             ; [0F 04 03 04] OR A with Absolute Long
    ORA $06,S               ; [03 06      ] OR A with Stack Relative
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    BRK                     ; [00 01      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRA $91EF               ; [80 80      ] Branch Always
    BRK                     ; [00 20      ] Software interrupt
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    BRA $9295               ; [80 20      ] Branch Always
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $91FB               ; [80 80      ] Branch Always
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $149284 (SNES $D49284) ---
org $D49284

    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    COP #$01                ; [02 01      ] Coprocessor interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA [$01]               ; [07 01      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    db $07                      ; Incomplete/data bytes

;--- Patch at file offset $149297 (SNES $D49297) ---
org $D49297

    BRK                     ; [00 00      ] Software interrupt
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    COP #$00                ; [02 00      ] Coprocessor interrupt
    BRK                     ; [00 00      ] Software interrupt
    ASL $00                 ; [06 00      ] Shift Left DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 4C      ] Software interrupt
    BEQ $925D               ; [F0 B2      ] Branch if Equal
    JSR ($FCFA,X)           ; [FC FA FC   ] Jump to Subroutine Indirect,X
    ADC $00FE               ; [6D FE 00   ] Add with Carry Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    BRA $926B               ; [80 B0      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 6C      ] Software interrupt
    BPL $92D5               ; [10 14      ] Branch if Plus
    ORA $5A1E28             ; [0F 28 1E 5A] OR A with Absolute Long
    BIT $3856,X             ; [3C 56 38   ] Test Bits Absolute,X
    PHY                     ; [5A         ] Push Y Register
    BMI $92F5               ; [30 2A      ] Branch if Minus
    BPL $92FB               ; [10 2E      ] Branch if Plus
    TRB $55                 ; [14 55      ] Test and Reset Bits DP
    DEC                     ; [3A         ] Decrement Accumulator
    TSB $08                 ; [04 08      ] Test and Set Bits in DP
    ORA #$10                ; [09 10      ] OR A with Immediate
    ORA $1120,Y             ; [19 20 11   ] OR A with Absolute,Y
    JSR $2015               ; [20 15 20   ] Jump to Subroutine
    ORA ($14,X)             ; [01 14      ] OR A with (DP,X)
    ORA ($10,X)             ; [01 10      ] OR A with (DP,X)
    ORA ($20)               ; [12 20      ] OR A with (DP)
    ORA #$7E                ; [09 7E      ] OR A with Immediate
    ASL $18                 ; [06 18      ] Shift Left DP
    ORA #$00                ; [09 00      ] OR A with Immediate
    EOR #$00                ; [49 00      ] XOR A with Immediate
    STA $001106             ; [8F 06 11 00] Store A to Absolute Long
    LDX #$10                ; [A2 10      ] Load X Immediate
    JSR ($0800,X)           ; [FC 00 08   ] Jump to Subroutine Indirect,X
    BCC $92B3               ; [90 C0      ] Branch if Carry Clear
    JSR $30C6               ; [20 C6 30   ] Jump to Subroutine
    LDY $12                 ; [A4 12      ] Load Y from DP
    RTS                     ; [60         ] Return from Subroutine
    BPL $92C7               ; [10 CC      ] Branch if Plus
    JSL $084C10             ; [22 10 4C 08] Jump to Subroutine Long
    BEQ $937C               ; [F0 7B      ] Branch if Equal
    JSR $0021               ; [20 21 00   ] Jump to Subroutine
    COP #$01                ; [02 01      ] Coprocessor interrupt
    TSB $01                 ; [04 01      ] Test and Set Bits in DP
    BPL $930A               ; [10 00      ] Branch if Plus
    ORA $0704               ; [0D 04 07   ] OR A with Absolute
    COP #$02                ; [02 02      ] Coprocessor interrupt
    BRK                     ; [00 20      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ORA #$02                ; [09 02      ] OR A with Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 3F      ] Software interrupt
    CPY #$7E                ; [C0 7E      ] Compare Y Immediate
    BRA $92FB               ; [80 D4      ] Branch Always
    BPL $93A1               ; [10 78      ] Branch if Plus
    BMI $9323               ; [30 F8      ] Branch if Minus
    BMI $935D               ; [30 30      ] Branch if Minus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    REP #$3C                ; [C2 3C      ] Reset Processor Status Bits
    STY $48                 ; [84 48      ] Store Y to DP
    JSR $00A8               ; [20 A8 00   ] Jump to Subroutine
    BRA $933B               ; [80 00      ] Branch Always
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $149344 (SNES $D49344) ---
org $D49344

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    INC                     ; [1A         ] Increment Accumulator
    ORA [$27]               ; [07 27      ] OR A with [DP]
    ORA $501F28,X           ; [1F 28 1F 50] OR A with Absolute Long,X
    TSC                     ; [3B         ] Transfer Stack Pointer to A

;--- Patch at file offset $149356 (SNES $D49356) ---
org $D49356

    BRK                     ; [00 00      ] Software interrupt
    COP #$04                ; [02 04      ] Coprocessor interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA ($10,S),Y           ; [13 10      ] OR A with (SR),Y
    BIT $00                 ; [24 00      ] Test Bits DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    SED                     ; [F8         ] Set Decimal Flag
    JSR $D8A4               ; [20 A4 D8   ] Jump to Subroutine
    NOP                     ; [EA         ] No Operation
    JML [$EC16]             ; [DC 16 EC   ] Jump Long Indirect
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $92F8               ; [80 80      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRA $9384               ; [80 08      ] Branch Always
    INY                     ; [C8         ] Increment Y
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    BMI $93A3               ; [30 20      ] Branch if Minus
    BPL $9395               ; [10 10      ] Branch if Plus
    BRK                     ; [00 13      ] Software interrupt
    BRK                     ; [00 14      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 2E      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    AND $0E030C             ; [2F 0C 03 0E] AND A with Absolute Long
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    BRK                     ; [00 0B      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($11,X)             ; [01 11      ] OR A with (DP,X)
    TSB $56                 ; [04 56      ] Test and Set Bits in DP
    CPX $E87C               ; [EC 7C E8   ] Compare X with Absolute
    TRB $2CE8               ; [1C E8 2C   ] Test and Reset Bits Absolute
    TYA                     ; [98         ] Transfer Y to A
    ROL $6E1C,X             ; [3E 1C 6E   ] Rotate Left Absolute,X
    TRB $2854               ; [1C 54 28   ] Test and Reset Bits Absolute
    LDY $4400,X             ; [BC 00 44   ] Load Y from Absolute,X
    BRK                     ; [00 68      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 48      ] Software interrupt
    BRK                     ; [00 5C      ] Software interrupt
    BRA $93C7               ; [80 0C      ] Branch Always
    BRA $93DD               ; [80 20      ] Branch Always
    BRA $93FF               ; [80 40      ] Branch Always
    BMI $9401               ; [30 40      ] Branch if Minus
    BMI $93E3               ; [30 20      ] Branch if Minus
    BPL $93D5               ; [10 10      ] Branch if Plus
    BRK                     ; [00 13      ] Software interrupt
    BRK                     ; [00 14      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    AND $0E030C             ; [2F 0C 03 0E] AND A with Absolute Long
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    BRK                     ; [00 0B      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    TSB $56                 ; [04 56      ] Test and Set Bits in DP
    CPX $E87C               ; [EC 7C E8   ] Compare X with Absolute
    TRB $2CE8               ; [1C E8 2C   ] Test and Reset Bits Absolute
    TYA                     ; [98         ] Transfer Y to A
    ROL $6E1C,X             ; [3E 1C 6E   ] Rotate Left Absolute,X
    TRB $2854               ; [1C 54 28   ] Test and Reset Bits Absolute
    LDY $4400,X             ; [BC 00 44   ] Load Y from Absolute,X
    BRK                     ; [00 68      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 48      ] Software interrupt
    BRK                     ; [00 5C      ] Software interrupt
    BRA $9407               ; [80 0C      ] Branch Always
    BRA $941D               ; [80 20      ] Branch Always
    BRA $943F               ; [80 40      ] Branch Always
    db $30                      ; Incomplete/data bytes

;--- Patch at file offset $14AF0C (SNES $D4AF0C) ---
org $D4AF0C

    DEC                     ; [3A         ] Decrement Accumulator

;--- Patch at file offset $14AF1A (SNES $D4AF1A) ---
org $D4AF1A

    db $94                      ; Incomplete/data bytes

;--- Patch at file offset $14AF9E (SNES $D4AF9E) ---
org $D4AF9E

    SBC $14,X               ; [F5 14      ] Subtract with Borrow DP,X

;--- Patch at file offset $14B080 (SNES $D4B080) ---
org $D4B080

    RTI                     ; [40         ] Return from Interrupt
    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $14B0F6 (SNES $D4B0F6) ---
org $D4B0F6

    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    AND $4B7E,Y             ; [39 7E 4B   ] AND A with Absolute,Y
    ROR $A942               ; [6E 42 A9   ] Rotate Right Absolute

;--- Patch at file offset $14B15C (SNES $D4B15C) ---
org $D4B15C

    AND $79,S               ; [23 79      ] AND A with Stack Relative
    CMP ($10),Y             ; [D1 10      ] Compare A with (DP),Y
    CPY #$01                ; [C0 01      ] Compare Y Immediate
    STY $10                 ; [84 10      ] Store Y to DP
    STP                     ; [DB         ] Stop Processor
    ORA $407F               ; [0D 7F 40   ] OR A with Absolute
    AND $690053,X           ; [3F 53 00 69] AND A with Absolute Long,X
    LSR $7A,X               ; [56 7A      ] Shift Right DP,X
    ORA $3A3F03,X           ; [1F 03 3F 3A] OR A with Absolute Long,X
    AND $FF79               ; [2D 79 FF   ] AND A with Absolute
    AND $5F7FFF,X           ; [3F FF 7F 5F] AND A with Absolute Long,X
    ADC ($5F)               ; [72 5F      ] Add with Carry (DP)
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- End of patch ---