;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; unchibi Jobless v1.0 (RPGe).ips.commented.asm
;    Disassembled from IPS patch: unchibi Jobless v1.0 (RPGe).ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 407 record(s)

;--- Patch at file offset $00FFDC (SNES $C0FFDC) ---
org $C0FFDC

    ASL $F117               ; [0E 17 F1   ] Shift Left Absolute
    INX                     ; [E8         ] Increment X

;--- Patch at file offset $141004 (SNES $D41004) ---
org $D41004

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $3F5110             ; [2F 10 51 3F] AND A with Absolute Long

;--- Patch at file offset $141016 (SNES $D41016) ---
org $D41016

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
    BVS $106D               ; [70 21      ] Branch if Overflow Set
    EOR $7F11,Y             ; [59 11 7F   ] XOR A with Absolute,Y
    ORA #$0E                ; [09 0E      ] OR A with Immediate
    AND ($02),Y             ; [31 02      ] AND A with (DP),Y
    ORA ($08),Y             ; [11 08      ] OR A with (DP),Y
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
    BCS $1059               ; [B0 EC      ] Branch if Carry Set
    SEC                     ; [38         ] Set Carry Flag
    JML [$C418]             ; [DC 18 C4   ] Jump Long Indirect
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $107D               ; [80 08      ] Branch Always
    CPX #$40                ; [E0 40      ] Compare X Immediate
    TYA                     ; [98         ] Transfer Y to A
    RTI                     ; [40         ] Return from Interrupt
    STY $00B0               ; [8C B0 00   ] Store Y to Absolute
    SEI                     ; [78         ] Set Interrupt Disable
    RTI                     ; [40         ] Return from Interrupt
    SEC                     ; [38         ] Set Carry Flag
    JSR $0C92               ; [20 92 0C   ] Jump to Subroutine
    TXS                     ; [9A         ] Transfer X to Stack Pointer
    BRK                     ; [00 69      ] Software interrupt
    ASL $0A                 ; [06 0A      ] Shift Left DP
    ORA $05                 ; [05 05      ] OR A with Direct Page
    BRK                     ; [00 06      ] Software interrupt
    COP #$05                ; [02 05      ] Coprocessor interrupt
    ORA $07,S               ; [03 07      ] OR A with Stack Relative
    BRK                     ; [00 6D      ] Software interrupt
    BRK                     ; [00 45      ] Software interrupt
    BIT $06                 ; [24 06      ] Test Bits DP
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
    BRA $102B               ; [80 80      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 98      ] Software interrupt
    CLI                     ; [58         ] Clear Interrupt Disable
    BRA $1114               ; [80 60      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRA $10B8               ; [80 00      ] Branch Always
    BRA $10BA               ; [80 00      ] Branch Always
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1410C4 (SNES $D410C4) ---
org $D410C4

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $3F5110             ; [2F 10 51 3F] AND A with Absolute Long

;--- Patch at file offset $1410D6 (SNES $D410D6) ---
org $D410D6

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
    BPL $1147               ; [10 28      ] Branch if Plus
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
    BRA $113D               ; [80 08      ] Branch Always
    CPX #$40                ; [E0 40      ] Compare X Immediate
    TYA                     ; [98         ] Transfer Y to A
    BPL $10C6               ; [10 8C      ] Branch if Plus
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
    BCS $114C               ; [B0 E0      ] Branch if Carry Set
    BCC $11CE               ; [90 60      ] Branch if Carry Clear
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
    BRK                     ; [00 92      ] Software interrupt
    TSB $009A               ; [0C 9A 00   ] Test and Set Bits Absolute
    ADC #$06                ; [69 06      ] Add with Carry Immediate
    TRB $0F                 ; [14 0F      ] Test and Reset Bits DP
    AND ($10),Y             ; [31 10      ] AND A with (DP),Y
    LSR                     ; [4A         ] Shift Right Accumulator
    SEC                     ; [38         ] Set Carry Flag
    AND $08,X               ; [35 08      ] AND A with DP,X
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 6D      ] Software interrupt
    BRK                     ; [00 45      ] Software interrupt
    BIT $06                 ; [24 06      ] Test Bits DP
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 1C      ] Software interrupt
    COP #$39                ; [02 39      ] Coprocessor interrupt
    TSB $08                 ; [04 08      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 6C      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CLI                     ; [58         ] Clear Interrupt Disable
    RTI                     ; [40         ] Return from Interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    RTI                     ; [40         ] Return from Interrupt
    BVS $120C               ; [70 60      ] Branch if Overflow Set
    LDY #$C0                ; [A0 C0      ] Load Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    TYA                     ; [98         ] Transfer Y to A
    CLI                     ; [58         ] Clear Interrupt Disable
    BRA $1214               ; [80 60      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRA $11B8               ; [80 00      ] Branch Always
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    BRA $117D               ; [80 C0      ] Branch Always

;--- Patch at file offset $1411C8 (SNES $D411C8) ---
org $D411C8

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA [$00]               ; [07 00      ] OR A with [DP]

;--- Patch at file offset $1411DA (SNES $D411DA) ---
org $D411DA

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1411EA (SNES $D411EA) ---
org $D411EA

    CLV                     ; [B8         ] Clear Overflow Flag
    BRK                     ; [00 44      ] Software interrupt
    CLV                     ; [B8         ] Clear Overflow Flag
    PLX                     ; [FA         ] Pull X Register
    db $44                      ; Incomplete/data bytes

;--- Patch at file offset $1411FB (SNES $D411FB) ---
org $D411FB

    BRK                     ; [00 80      ] Software interrupt
    CLV                     ; [B8         ] Clear Overflow Flag
    PHP                     ; [08         ] Push Processor Status
    MVN $19,$06             ; [54 19 06   ] Block Move Negative
    AND $3F5010             ; [2F 10 50 3F] AND A with Absolute Long
    EOR $00702F,X           ; [5F 2F 70 00] XOR A with Absolute Long,X
    BMI $120C               ; [30 00      ] Branch if Minus
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

;--- Patch at file offset $14122E (SNES $D4122E) ---
org $D4122E

    AND $128C80,X           ; [3F 80 8C 12] AND A with Absolute Long,X
    STZ $8A                 ; [64 8A      ] Store Zero to DP
    STY $72                 ; [84 72      ] Store Y to DP
    CPX #$14                ; [E0 14      ] Compare X Immediate

;--- Patch at file offset $14123E (SNES $D4123E) ---
org $D4123E

    TSB $62                 ; [04 62      ] Test and Set Bits in DP
    AND $0D,X               ; [35 0D      ] AND A with DP,X
    BVC $1264               ; [50 20      ] Branch if Overflow Clear
    PHA                     ; [48         ] Push Accumulator
    BPL $1276               ; [10 2F      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    AND $3312,X             ; [3D 12 33   ] AND A with Absolute,X
    COP #$53                ; [02 53      ] Coprocessor interrupt
    COP #$7F                ; [02 7F      ] Coprocessor interrupt
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 2F      ] Software interrupt
    BRK                     ; [00 36      ] Software interrupt
    AND ($18,X)             ; [21 18      ] AND A with (DP,X)
    BPL $126B               ; [10 12      ] Branch if Plus
    BRK                     ; [00 0E      ] Software interrupt
    BRK                     ; [00 26      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    ASL $88,X               ; [16 88      ] Shift Left DP,X
    PLY                     ; [7A         ] Pull Y Register
    db $1C, $96                 ; Incomplete/data bytes

;--- Patch at file offset $14126D (SNES $D4126D) ---
org $D4126D

    BNE $126B               ; [D0 FC      ] Branch if Not Equal
    BRK                     ; [00 28      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    TRB $4C80               ; [1C 80 4C   ] Test and Reset Bits Absolute
    PLP                     ; [28         ] Pull Processor Status
    TSB $8074               ; [0C 74 80   ] Test and Set Bits Absolute
    CLC                     ; [18         ] Clear Carry Flag
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BNE $127E               ; [D0 00      ] Branch if Not Equal
    BRK                     ; [00 00      ] Software interrupt
    EOR $003C2E,X           ; [5F 2E 3C 00] XOR A with Absolute Long,X
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BIT $06,X               ; [34 06      ] Test Bits DP,X
    BMI $128D               ; [30 01      ] Branch if Minus
    AND #$01                ; [29 01      ] AND A with Immediate
    AND $310E11             ; [2F 11 0E 31] AND A with Absolute Long
    COP #$11                ; [02 11      ] Coprocessor interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0F,X)             ; [01 0F      ] OR A with (DP,X)
    BRK                     ; [00 17      ] Software interrupt
    BPL $12B0               ; [10 11      ] Branch if Plus
    BRK                     ; [00 1D      ] Software interrupt
    ASL $05                 ; [06 05      ] Shift Left DP
    BRK                     ; [00 04      ] Software interrupt
    ORA $0A,S               ; [03 0A      ] OR A with Stack Relative
    ORA [$18]               ; [07 18      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    AND $1C                 ; [25 1C      ] AND A with Direct Page
    INC                     ; [1A         ] Increment Accumulator
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 06      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    COP #$03                ; [02 03      ] Coprocessor interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($1C,X)             ; [01 1C      ] OR A with (DP,X)
    COP #$04                ; [02 04      ] Coprocessor interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 5F      ] Software interrupt
    ROL $003C               ; [2E 3C 00   ] Rotate Left Absolute
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BIT $06,X               ; [34 06      ] Test Bits DP,X
    BMI $12CC               ; [30 00      ] Branch if Minus
    AND #$01                ; [29 01      ] AND A with Immediate
    ORA $310E00,X           ; [1F 00 0E 31] OR A with Absolute Long,X
    COP #$11                ; [02 11      ] Coprocessor interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($17,X)             ; [01 17      ] OR A with (DP,X)
    BPL $12DF               ; [10 00      ] Branch if Plus
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 EE      ] Software interrupt
    BMI $12A3               ; [30 B4      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $12FD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $1345               ; [90 4C      ] Branch if Carry Clear
    BCC $1307               ; [90 0C      ] Branch if Carry Clear
    BRK                     ; [00 70      ] Software interrupt
    MVP $78,$40             ; [44 78 40   ] Block Move Positive
    BIT $04                 ; [24 04      ] Test Bits DP
    BIT $04                 ; [24 04      ] Test Bits DP
    ORA $070A00,X           ; [1F 00 0A 07] OR A with Absolute Long,X
    CLC                     ; [18         ] Clear Carry Flag
    PHP                     ; [08         ] Push Processor Status
    AND $1C                 ; [25 1C      ] AND A with Direct Page
    INC                     ; [1A         ] Increment Accumulator
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 1B      ] Software interrupt
    TSB $10                 ; [04 10      ] Test and Set Bits in DP
    ORA $070000             ; [0F 00 00 07] OR A with Absolute Long
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($1C,X)             ; [01 1C      ] OR A with (DP,X)
    COP #$04                ; [02 04      ] Coprocessor interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 58      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPY #$B0                ; [C0 B0      ] Compare Y Immediate
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $141330 (SNES $D41330) ---
org $D41330

    BCS $1362               ; [B0 30      ] Branch if Carry Set
    BRK                     ; [00 80      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    BRK                     ; [00 B0      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $141342 (SNES $D41342) ---
org $D41342

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
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 E4      ] Software interrupt
    BRK                     ; [00 A4      ] Software interrupt
    BRK                     ; [00 66      ] Software interrupt
    JSR $30BE               ; [20 BE 30   ] Jump to Subroutine
    ASL $1C00               ; [0E 00 1C   ] Shift Left Absolute
    BRK                     ; [00 C4      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    RTI                     ; [40         ] Return from Interrupt
    BRA $1385               ; [80 10      ] Branch Always
    INY                     ; [C8         ] Increment Y
    RTI                     ; [40         ] Return from Interrupt
    TYA                     ; [98         ] Transfer Y to A
    BRK                     ; [00 B8      ] Software interrupt
    MVP $30,$E0             ; [44 30 E0   ] Block Move Positive
    TRB $40                 ; [14 40      ] Test and Reset Bits DP
    TAY                     ; [A8         ] Transfer A to Y
    EOR $4D07               ; [4D 07 4D   ] XOR A with Absolute
    BRK                     ; [00 34      ] Software interrupt
    ORA $0A,S               ; [03 0A      ] OR A with Stack Relative
    ORA [$18]               ; [07 18      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    AND $1C                 ; [25 1C      ] AND A with Direct Page
    INC                     ; [1A         ] Increment Accumulator
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 37      ] Software interrupt
    BRK                     ; [00 22      ] Software interrupt
    ORA ($03)               ; [12 03      ] OR A with (DP)
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($1C,X)             ; [01 1C      ] OR A with (DP,X)
    COP #$04                ; [02 04      ] Coprocessor interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 B8      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRA $1385               ; [80 E0      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPY #$B0                ; [C0 B0      ] Compare Y Immediate
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $1413B0 (SNES $D413B0) ---
org $D413B0

    BRK                     ; [00 50      ] Software interrupt
    BRA $13B4               ; [80 00      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    BRK                     ; [00 B0      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1413C4 (SNES $D413C4) ---
org $D413C4

    ASL $00                 ; [06 00      ] Shift Left DP
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $3F5110             ; [2F 10 51 3F] AND A with Absolute Long
    db $5F, $2E                 ; Incomplete/data bytes

;--- Patch at file offset $1413D6 (SNES $D413D6) ---
org $D413D6

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
    COP #$11                ; [02 11      ] Coprocessor interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    AND ($0E,X)             ; [21 0E      ] AND A with (DP,X)
    AND ($07,X)             ; [21 07      ] AND A with (DP,X)
    BPL $1425               ; [10 08      ] Branch if Plus
    BRK                     ; [00 0E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BVS $13C9               ; [70 9E      ] Branch if Overflow Set
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
    BRA $14A7               ; [80 40      ] Branch Always
    BRA $13E9               ; [80 80      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $1476               ; [80 00      ] Branch Always
    BRA $1478               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $141482 (SNES $D41482) ---
org $D41482

    BRK                     ; [00 00      ] Software interrupt
    ASL $1300               ; [0E 00 13   ] Shift Left Absolute
    TSB $102F               ; [0C 2F 10   ] Test and Set Bits Absolute
    LSR $5D21,X             ; [5E 21 5D   ] Shift Right Absolute,X
    JSL $000738             ; [22 38 07 00] Jump to Subroutine Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    TSB $1608               ; [0C 08 16   ] Test and Set Bits Absolute
    BPL $14C9               ; [10 2D      ] Branch if Plus
    ORA ($2A),Y             ; [11 2A      ] OR A with (DP),Y
    BPL $14A7               ; [10 07      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 E0      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BVS $1428               ; [70 80      ] Branch if Overflow Set
    LDY $7E40,X             ; [BC 40 7E   ] Load Y from Absolute,X
    BRA $14AB               ; [80 FE      ] Branch Always
    BRK                     ; [00 C7      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    BRA $1438               ; [80 80      ] Branch Always
    JSR $7850               ; [20 50 78   ] Jump to Subroutine
    STY $CC                 ; [84 CC      ] Store Y to DP
    BMI $147B               ; [30 BC      ] Branch if Minus
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
    BPL $14FB               ; [10 24      ] Branch if Plus
    ASL                     ; [0A         ] Shift Left Accumulator
    BRK                     ; [00 2D      ] Software interrupt
    TRB $1900               ; [1C 00 19   ] Test and Reset Bits Absolute
    TSB $01                 ; [04 01      ] Test and Set Bits in DP
    TSB $FCFF               ; [0C FF FC   ] Test and Set Bits Absolute

;--- Patch at file offset $1414EE (SNES $D414EE) ---
org $D414EE

    TDC                     ; [7B         ] Transfer Direct Page to A
    BRL $15F0               ; [82 FE 00   ] Branch Long
    BVS $1480               ; [70 8C      ] Branch if Overflow Set

;--- Patch at file offset $1414FA (SNES $D414FA) ---
org $D414FA

    BVS $1484               ; [70 88      ] Branch if Overflow Set
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
    BPL $14C3               ; [10 9C      ] Branch if Plus
    BPL $1523               ; [10 FA      ] Branch if Plus
    STY $80AC               ; [8C AC 80   ] Store Y to Absolute
    RTI                     ; [40         ] Return from Interrupt
    BRA $14AF               ; [80 80      ] Branch Always
    BRK                     ; [00 E2      ] Software interrupt
    COP #$18                ; [02 18      ] Coprocessor interrupt
    TSB $60                 ; [04 60      ] Test and Set Bits in DP
    TRB $3040               ; [1C 40 30   ] Test and Reset Bits Absolute

;--- Patch at file offset $141544 (SNES $D41544) ---
org $D41544

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $3F5110             ; [2F 10 51 3F] AND A with Absolute Long

;--- Patch at file offset $141556 (SNES $D41556) ---
org $D41556

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
    BPL $1586               ; [10 00      ] Branch if Plus
    ORA ($00)               ; [12 00      ] OR A with (DP)
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    AND ($00),Y             ; [31 00      ] AND A with (DP),Y
    EOR $6F30,X             ; [5D 30 6F   ] XOR A with Absolute,X
    JSR $310E               ; [20 0E 31   ] Jump to Subroutine
    ASL $0E11               ; [0E 11 0E   ] Shift Left Absolute
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    ORA ($0A,X)             ; [01 0A      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 30      ] Software interrupt
    COP #$38                ; [02 38      ] Coprocessor interrupt
    CLC                     ; [18         ] Clear Carry Flag
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    BRK                     ; [00 2E      ] Software interrupt
    BPL $15E9               ; [10 3C      ] Branch if Plus
    PLP                     ; [28         ] Pull Processor Status
    CPY $C4C0               ; [CC C0 C4   ] Compare Y with Absolute
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $15BD               ; [80 08      ] Branch Always
    CPX #$00                ; [E0 00      ] Compare X Immediate
    TYA                     ; [98         ] Transfer Y to A
    RTI                     ; [40         ] Return from Interrupt
    TSB $4090               ; [0C 90 40   ] Test and Set Bits Absolute
    DEY                     ; [88         ] Decrement Y
    RTS                     ; [60         ] Return from Subroutine
    JSR $5FD0               ; [20 D0 5F   ] Jump to Subroutine
    ROL $0030               ; [2E 30 00   ] Rotate Left Absolute
    BPL $15C6               ; [10 00      ] Branch if Plus
    ORA ($00)               ; [12 00      ] OR A with (DP)
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    AND ($00),Y             ; [31 00      ] AND A with (DP),Y
    EOR $6F30,Y             ; [59 30 6F   ] XOR A with Absolute,Y
    JSR $310E               ; [20 0E 31   ] Jump to Subroutine
    ASL $0E11               ; [0E 11 0E   ] Shift Left Absolute
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
    BPL $1629               ; [10 3C      ] Branch if Plus
    PLP                     ; [28         ] Pull Processor Status
    CPY $C4C0               ; [CC C0 C4   ] Compare Y with Absolute
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $15FD               ; [80 08      ] Branch Always
    CPX #$00                ; [E0 00      ] Compare X Immediate
    TYA                     ; [98         ] Transfer Y to A
    RTI                     ; [40         ] Return from Interrupt
    TSB $4090               ; [0C 90 40   ] Test and Set Bits Absolute
    DEY                     ; [88         ] Decrement Y
    RTS                     ; [60         ] Return from Subroutine
    JSR $00D0               ; [20 D0 00   ] Jump to Subroutine
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
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
    BPL $164F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BCS $1608               ; [B0 E0      ] Branch if Carry Set
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
    BRA $167D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $16D5               ; [90 5C      ] Branch if Carry Clear
    BRA $1687               ; [80 0C      ] Branch Always
    BNE $1605               ; [D0 88      ] Branch if Not Equal
    STY $20                 ; [84 20      ] Store Y to DP
    PHP                     ; [08         ] Push Processor Status
    EOR $024F02             ; [4F 02 4F 02] XOR A with Absolute Long
    ROL $1D03,X             ; [3E 03 1D   ] Rotate Left Absolute,X
    ORA $02,S               ; [03 02      ] OR A with Stack Relative
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    BRK                     ; [00 32      ] Software interrupt
    BRK                     ; [00 2A      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    ORA $0203,Y             ; [19 03 02   ] OR A with Absolute,Y
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    BPL $16DB               ; [10 38      ] Branch if Plus
    BPL $167D               ; [10 D8      ] Branch if Plus
    JSR $00F0               ; [20 F0 00   ] Jump to Subroutine
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $16D2               ; [F0 20      ] Branch if Equal
    BCS $1714               ; [B0 60      ] Branch if Carry Set
    BMI $16C6               ; [30 10      ] Branch if Minus
    BRA $1638               ; [80 80      ] Branch Always
    BRA $16BA               ; [80 00      ] Branch Always
    BRA $16BC               ; [80 00      ] Branch Always
    BRA $163E               ; [80 80      ] Branch Always
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
    BPL $170F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BCS $16C8               ; [B0 E0      ] Branch if Carry Set
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
    BRA $173D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $1795               ; [90 5C      ] Branch if Carry Clear
    BRA $1757               ; [80 1C      ] Branch Always
    BRK                     ; [00 E8      ] Software interrupt
    CPX $E0                 ; [E4 E0      ] Compare X with DP
    PLP                     ; [28         ] Pull Processor Status
    ADC $7F21,X             ; [7D 21 7F   ] Add with Carry Absolute,X
    AND ($3B),Y             ; [31 3B      ] AND A with (DP),Y
    ASL $0B                 ; [06 0B      ] Shift Left DP
    ASL $10                 ; [06 10      ] Shift Left DP
    BRK                     ; [00 13      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BPL $178B               ; [10 3C      ] Branch if Plus
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
    BRA $16F4               ; [80 80      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    CPX #$80                ; [E0 80      ] Compare X Immediate
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    BMI $178E               ; [30 10      ] Branch if Minus
    BRK                     ; [00 00      ] Software interrupt
    EOR $064D02             ; [4F 02 4D 06] XOR A with Absolute Long
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    ASL $1F                 ; [06 1F      ] Shift Left DP
    ORA $3B0011             ; [0F 11 00 3B] OR A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    ASL $0C00,X             ; [1E 00 0C   ] Shift Left Absolute,X
    BRK                     ; [00 32      ] Software interrupt
    BRK                     ; [00 26      ] Software interrupt
    ORA ($17)               ; [12 17      ] OR A with (DP)
    ORA $0F,X               ; [15 0F      ] OR A with DP,X
    BRK                     ; [00 0E      ] Software interrupt
    ASL $041C               ; [0E 1C 04   ] Shift Left Absolute
    TSB $000C               ; [0C 0C 00   ] Test and Set Bits Absolute
    BRK                     ; [00 38      ] Software interrupt
    BPL $17DB               ; [10 38      ] Branch if Plus
    BPL $177D               ; [10 D8      ] Branch if Plus
    JSR $00F0               ; [20 F0 00   ] Jump to Subroutine
    BMI $17AA               ; [30 00      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    JSR $40F0               ; [20 F0 40   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    JSR $60B0               ; [20 B0 60   ] Jump to Subroutine
    BMI $17C6               ; [30 10      ] Branch if Minus
    BRA $1738               ; [80 80      ] Branch Always
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    BEQ $178C               ; [F0 D0      ] Branch if Equal
    RTS                     ; [60         ] Return from Subroutine
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $1417C6 (SNES $D417C6) ---
org $D417C6

    BRK                     ; [00 00      ] Software interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    ORA $02                 ; [05 02      ] OR A with Direct Page
    ORA $03                 ; [05 03      ] OR A with Direct Page
    ORA [$00]               ; [07 00      ] OR A with [DP]

;--- Patch at file offset $1417D8 (SNES $D417D8) ---
org $D417D8

    BRK                     ; [00 00      ] Software interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $1417E6 (SNES $D417E6) ---
org $D417E6

    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F8      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    LDY $68,X               ; [B4 68      ] Load Y from DP,X
    SBC ($4C)               ; [F2 4C      ] Subtract with Borrow (DP)

;--- Patch at file offset $1417F8 (SNES $D417F8) ---
org $D417F8

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
    BPL $181F               ; [10 02      ] Branch if Plus
    BRK                     ; [00 02      ] Software interrupt

;--- Patch at file offset $14182E (SNES $D4182E) ---
org $D4182E

    AND $920C80,X           ; [3F 80 0C 92] AND A with Absolute Long,X

;--- Patch at file offset $14183E (SNES $D4183E) ---
org $D4183E

    TSB $6A                 ; [04 6A      ] Test and Set Bits in DP
    ORA $0D,X               ; [15 0D      ] OR A with DP,X
    BPL $1844               ; [10 00      ] Branch if Plus
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

;--- Patch at file offset $14187A (SNES $D4187A) ---
org $D4187A

    PEI ($CC)               ; [D4 CC      ] Push Effective Indirect
    CPY #$58                ; [C0 58      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $10                 ; [06 10      ] Shift Left DP
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    AND $081300,X           ; [3F 00 13 08] AND A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    ORA $0F,S               ; [03 0F      ] OR A with Stack Relative
    COP #$0D                ; [02 0D      ] Coprocessor interrupt
    ASL $0B                 ; [06 0B      ] Shift Left DP
    ORA [$1F]               ; [07 1F      ] OR A with [DP]
    ORA $3B0011             ; [0F 11 00 3B] OR A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    ASL $0C00,X             ; [1E 00 0C   ] Shift Left Absolute,X
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 06      ] Software interrupt
    COP #$07                ; [02 07      ] Coprocessor interrupt
    TSB $0F                 ; [04 0F      ] Test and Set Bits in DP
    BRK                     ; [00 0E      ] Software interrupt
    ASL $041C               ; [0E 1C 04   ] Shift Left Absolute
    TSB $000C               ; [0C 0C 00   ] Test and Set Bits Absolute
    BRK                     ; [00 51      ] Software interrupt
    JSR $003C               ; [20 3C 00   ] Jump to Subroutine
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BPL $18CC               ; [10 00      ] Branch if Plus
    ORA #$00                ; [09 00      ] OR A with Immediate
    AND $3F0001,X           ; [3F 01 00 3F] AND A with Absolute Long,X
    BRK                     ; [00 13      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
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
    BRA $18FD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $1955               ; [90 5C      ] Branch if Carry Clear
    BRA $1907               ; [80 0C      ] Branch Always
    BNE $1915               ; [D0 18      ] Branch if Not Equal
    BIT $90                 ; [24 90      ] Test Bits DP
    TAY                     ; [A8         ] Transfer A to Y
    EOR $064F07             ; [4F 07 4F 06] XOR A with Absolute Long
    AND [$0C],Y             ; [37 0C      ] AND A with [DP],Y
    ORA $001109,X           ; [1F 09 11 00] OR A with Absolute Long,X
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    CLC                     ; [18         ] Clear Carry Flag
    ASL $0C00,X             ; [1E 00 0C   ] Shift Left Absolute,X
    BRK                     ; [00 3F      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    AND $020E19             ; [2F 19 0E 02] AND A with Absolute Long
    ORA #$00                ; [09 00      ] OR A with Immediate
    ASL $1C0E               ; [0E 0E 1C   ] Shift Left Absolute
    TSB $0C                 ; [04 0C      ] Test and Set Bits in DP
    TSB $0000               ; [0C 00 00   ] Test and Set Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    BRA $1903               ; [80 E0      ] Branch Always
    BRK                     ; [00 F0      ] Software interrupt
    BRA $1907               ; [80 E0      ] Branch Always
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    JSR $40F0               ; [20 F0 40   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 A0      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CPX #$60                ; [E0 60      ] Compare X Immediate
    BRA $18B8               ; [80 80      ] Branch Always
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    BEQ $190C               ; [F0 D0      ] Branch if Equal
    RTS                     ; [60         ] Return from Subroutine
    JSR $0000               ; [20 00 00   ] Jump to Subroutine
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BCS $1928               ; [B0 E0      ] Branch if Carry Set
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
    BMI $192A               ; [30 B0      ] Branch if Minus
    STZ $10,X               ; [74 10      ] Store Zero to DP,X
    BEQ $1982               ; [F0 04      ] Branch if Equal
    BEQ $19B0               ; [F0 30      ] Branch if Equal
    STZ $9D0F,X             ; [9E 0F 9D   ] Store Zero to Absolute,X
    ORA $3F077B             ; [0F 7B 07 3F] OR A with Absolute Long
    ORA $3B0011             ; [0F 11 00 3B] OR A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    ASL $0C00,X             ; [1E 00 0C   ] Shift Left Absolute,X
    BRK                     ; [00 7F      ] Software interrupt
    ORA ($5F),Y             ; [11 5F      ] OR A with (DP),Y
    AND ($37)               ; [32 37      ] AND A with (DP)
    BIT $0F,X               ; [34 0F      ] Test Bits DP,X
    BRK                     ; [00 0E      ] Software interrupt
    ASL $041C               ; [0E 1C 04   ] Shift Left Absolute
    TSB $000C               ; [0C 0C 00   ] Test and Set Bits Absolute
    BRK                     ; [00 F8      ] Software interrupt
    BRA $1993               ; [80 F0      ] Branch Always
    BRA $1985               ; [80 E0      ] Branch Always
    BRA $1997               ; [80 F0      ] Branch Always
    BRA $19D9               ; [80 30      ] Branch Always
    BRK                     ; [00 38      ] Software interrupt
    JSR $40F0               ; [20 F0 40   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 E0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRA $19B4               ; [80 00      ] Branch Always
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    CPX #$60                ; [E0 60      ] Compare X Immediate
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    BEQ $198C               ; [F0 D0      ] Branch if Equal
    RTS                     ; [60         ] Return from Subroutine
    JSR $0000               ; [20 00 00   ] Jump to Subroutine
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
    BPL $1A0F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BCS $19C8               ; [B0 E0      ] Branch if Carry Set
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
    BMI $1A4E               ; [30 3F      ] Branch if Minus
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
    BVS $1A40               ; [70 04      ] Branch if Overflow Set
    BVS $1A4E               ; [70 10      ] Branch if Overflow Set
    BEQ $19D0               ; [F0 90      ] Branch if Equal
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
    BRA $1A45               ; [80 E0      ] Branch Always
    BRA $1A27               ; [80 C0      ] Branch Always
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    JSR $0080               ; [20 80 00   ] Jump to Subroutine
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    BRA $19F8               ; [80 80      ] Branch Always
    BRA $1A7A               ; [80 00      ] Branch Always

;--- Patch at file offset $141A80 (SNES $D41A80) ---
org $D41A80

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
    BRA $1AAA               ; [80 FF      ] Branch Always
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

;--- Patch at file offset $141B26 (SNES $D41B26) ---
org $D41B26

    LDY $3C70,X             ; [BC 70 3C   ] Load Y from Absolute,X
    BRK                     ; [00 20      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRA $1AAF               ; [80 80      ] Branch Always

;--- Patch at file offset $141B36 (SNES $D41B36) ---
org $D41B36

    SEI                     ; [78         ] Set Interrupt Disable
    PHA                     ; [48         ] Push Accumulator
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRA $1B3E               ; [80 00      ] Branch Always
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
    BPL $1B8F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BCS $1B48               ; [B0 E0      ] Branch if Carry Set
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
    BMI $1B84               ; [30 00      ] Branch if Minus
    BPL $1B86               ; [10 00      ] Branch if Plus
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
    BRA $1B75               ; [80 C4      ] Branch Always
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $1BBD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $1C05               ; [90 4C      ] Branch if Carry Clear
    BCC $1BC7               ; [90 0C      ] Branch if Carry Clear
    BCC $1C19               ; [90 5C      ] Branch if Carry Clear
    RTI                     ; [40         ] Return from Interrupt
    INY                     ; [C8         ] Increment Y
    RTI                     ; [40         ] Return from Interrupt
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BMI $1BC4               ; [30 00      ] Branch if Minus
    BPL $1BC6               ; [10 00      ] Branch if Plus
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
    BRA $1BB5               ; [80 C4      ] Branch Always
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $1BFD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $1C45               ; [90 4C      ] Branch if Carry Clear
    BCC $1C07               ; [90 0C      ] Branch if Carry Clear
    BCC $1C59               ; [90 5C      ] Branch if Carry Clear
    RTI                     ; [40         ] Return from Interrupt
    INY                     ; [C8         ] Increment Y
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA $1703               ; [0D 03 17   ] OR A with Absolute
    ORA $18081F             ; [0F 1F 08 18] OR A with Absolute Long
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $141C16 (SNES $D41C16) ---
org $D41C16

    BRK                     ; [00 00      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA $040800             ; [0F 00 08 04] OR A with Absolute Long
    PHP                     ; [08         ] Push Processor Status
    ORA $000000             ; [0F 00 00 00] OR A with Absolute Long
    BRK                     ; [00 78      ] Software interrupt
    BRK                     ; [00 C4      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    JSR ($BE80,X)           ; [FC 80 BE   ] Jump to Subroutine Indirect,X
    CPX #$7F                ; [E0 7F      ] Compare X Immediate
    CPX #$BF                ; [E0 BF      ] Compare X Immediate
    BVS $1C31               ; [70 00      ] Branch if Overflow Set
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    TYA                     ; [98         ] Transfer Y to A
    PHP                     ; [08         ] Push Processor Status
    CPX $E644               ; [EC 44 E6   ] Compare X with Absolute
    ASL                     ; [0A         ] Shift Left Accumulator
    ADC ($04)               ; [72 04      ] Add with Carry (DP)
    PLP                     ; [28         ] Pull Processor Status
    BPL $1C61               ; [10 1E      ] Branch if Plus
    BRK                     ; [00 0B      ] Software interrupt
    COP #$0A                ; [02 0A      ] Coprocessor interrupt
    ORA $0A,S               ; [03 0A      ] OR A with Stack Relative
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    BRK                     ; [00 14      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    AND $140B0C,X           ; [3F 0C 0B 14] AND A with Absolute Long,X
    ORA #$00                ; [09 00      ] OR A with Immediate
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA #$0C                ; [09 0C      ] OR A with Immediate
    TSB $70AF               ; [0C AF 70   ] Test and Set Bits Absolute
    LSR $5E30,X             ; [5E 30 5E   ] Shift Right Absolute,X
    BMI $1CC5               ; [30 5E      ] Branch if Minus
    JSR $207F               ; [20 7F 20   ] Jump to Subroutine
    SBC $B0DF40,X           ; [FF 40 DF B0] Subtract with Borrow Absolute Long,X
    INC $7278               ; [EE 78 72   ] Increment Absolute
    TRB $34                 ; [14 34      ] Test and Reset Bits DP
    BRA $1CA9               ; [80 34      ] Branch Always
    BRA $1C9B               ; [80 24      ] Branch Always
    DEY                     ; [88         ] Decrement Y
    db $2E, $80                 ; Incomplete/data bytes

;--- Patch at file offset $141C80 (SNES $D41C80) ---
org $D41C80

    JMP $4F07               ; [4C 07 4F   ] Jump Absolute
    ORA $34,S               ; [03 34      ] OR A with Stack Relative
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    ORA [$06]               ; [07 06      ] OR A with [DP]
    BRK                     ; [00 03      ] Software interrupt
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    BRK                     ; [00 37      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    ORA ($03,S),Y           ; [13 03      ] OR A with (SR),Y
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 94      ] Software interrupt
    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $141CAA (SNES $D41CAA) ---
org $D41CAA

    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRA $1C2F               ; [80 80      ] Branch Always
    BRK                     ; [00 68      ] Software interrupt

;--- Patch at file offset $141CB8 (SNES $D41CB8) ---
org $D41CB8

    BRK                     ; [00 80      ] Software interrupt
    BRA $1C3C               ; [80 80      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt

;--- Patch at file offset $141CC4 (SNES $D41CC4) ---
org $D41CC4

    BRK                     ; [00 00      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA $1703               ; [0D 03 17   ] OR A with Absolute
    ORA $18081F             ; [0F 1F 08 18] OR A with Absolute Long
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $141CD6 (SNES $D41CD6) ---
org $D41CD6

    BRK                     ; [00 00      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA $040800             ; [0F 00 08 04] OR A with Absolute Long
    PHP                     ; [08         ] Push Processor Status
    ORA $000000             ; [0F 00 00 00] OR A with Absolute Long
    BRK                     ; [00 78      ] Software interrupt
    BRK                     ; [00 C4      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    JSR ($BA80,X)           ; [FC 80 BA   ] Jump to Subroutine Indirect,X
    CPX $7F                 ; [E4 7F      ] Compare X with DP
    CPX #$BF                ; [E0 BF      ] Compare X Immediate
    BVS $1CF1               ; [70 00      ] Branch if Overflow Set
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    TYA                     ; [98         ] Transfer Y to A
    PHP                     ; [08         ] Push Processor Status
    INX                     ; [E8         ] Increment X
    MVP $E6,$0A             ; [44 E6 0A   ] Block Move Positive
    ADC ($04)               ; [72 04      ] Add with Carry (DP)
    PLP                     ; [28         ] Pull Processor Status
    BPL $1D1C               ; [10 19      ] Branch if Plus
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($0A,X)             ; [01 0A      ] OR A with (DP,X)
    ORA $0A,S               ; [03 0A      ] OR A with Stack Relative
    ORA $1C,S               ; [03 1C      ] OR A with Stack Relative
    BRK                     ; [00 32      ] Software interrupt
    BRK                     ; [00 53      ] Software interrupt
    BPL $1D1C               ; [10 0B      ] Branch if Plus
    TRB $0E                 ; [14 0E      ] Test and Reset Bits DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    BMI $1CD0               ; [30 AF      ] Branch if Minus
    BVS $1D81               ; [70 5E      ] Branch if Overflow Set
    BMI $1D83               ; [30 5E      ] Branch if Minus
    BMI $1D85               ; [30 5E      ] Branch if Minus
    JSR $207F               ; [20 7F 20   ] Jump to Subroutine
    SBC $D8EF60,X           ; [FF 60 EF D8] Subtract with Borrow Absolute Long,X
    INC $BC,X               ; [F6 BC      ] Increment DP,X
    ADC ($14)               ; [72 14      ] Add with Carry (DP)
    BIT $80,X               ; [34 80      ] Test Bits DP,X
    BIT $80,X               ; [34 80      ] Test Bits DP,X
    BIT $88                 ; [24 88      ] Test Bits DP
    ROL $6680               ; [2E 80 66   ] Rotate Left Absolute
    BRK                     ; [00 D8      ] Software interrupt
    INC                     ; [1A         ] Increment Accumulator
    LDY $4C3C,X             ; [BC 3C 4C   ] Load Y from Absolute,X
    PHD                     ; [0B         ] Push Direct Page Register
    AND $073C07             ; [2F 07 3C 07] AND A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    ORA $190009             ; [0F 09 00 19] OR A with Absolute Long
    PHP                     ; [08         ] Push Processor Status
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $0300               ; [1C 00 03   ] Test and Reset Bits Absolute
    SEC                     ; [38         ] Set Carry Flag
    TSB $13                 ; [04 13      ] Test and Set Bits in DP
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $020400             ; [0F 00 04 02] OR A with Absolute Long
    ASL $0C                 ; [06 0C      ] Shift Left DP
    PHP                     ; [08         ] Push Processor Status
    TSB $0000               ; [0C 00 00   ] Test and Set Bits Absolute
    STZ $C0                 ; [64 C0      ] Store Zero to DP
    PEA $4CB0               ; [F4 B0 4C   ] Push Effective Absolute

;--- Patch at file offset $141D70 (SNES $D41D70) ---
org $D41D70

    db $D0                      ; Incomplete/data bytes

;--- Patch at file offset $141D80 (SNES $D41D80) ---
org $D41D80

    JMP $4F07               ; [4C 07 4F   ] Jump Absolute
    ORA $34,S               ; [03 34      ] OR A with Stack Relative
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    ORA [$11]               ; [07 11      ] OR A with [DP]
    BRK                     ; [00 39      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    ASL $0404,X             ; [1E 04 04   ] Shift Left Absolute,X
    BRK                     ; [00 37      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    ORA ($03,S),Y           ; [13 03      ] OR A with (SR),Y
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    ASL $04                 ; [06 04      ] Shift Left DP
    ASL $0400,X             ; [1E 00 04   ] Shift Left Absolute,X

;--- Patch at file offset $141DB0 (SNES $D41DB0) ---
org $D41DB0

    PLA                     ; [68         ] Pull Accumulator
    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $141DCC (SNES $D41DCC) ---
org $D41DCC

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

;--- Patch at file offset $141DEC (SNES $D41DEC) ---
org $D41DEC

    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 E4      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag

;--- Patch at file offset $141DFB (SNES $D41DFB) ---
org $D41DFB

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    ORA [$00]               ; [07 00      ] OR A with [DP]
    INC                     ; [1A         ] Increment Accumulator
    ORA [$3F]               ; [07 3F      ] OR A with [DP]
    ORA $51013E             ; [0F 3E 01 51] OR A with Absolute Long
    JSR $0039               ; [20 39 00   ] Jump to Subroutine
    ORA [$00],Y             ; [17 00      ] OR A with [DP],Y
    ORA $06,X               ; [15 06      ] OR A with DP,X
    BRK                     ; [00 00      ] Software interrupt
    ORA [$01]               ; [07 01      ] OR A with [DP]
    ORA $181100,X           ; [1F 00 11 18] OR A with Absolute Long,X
    BPL $1E48               ; [10 2E      ] Branch if Plus
    TRB $02                 ; [14 02      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 FA      ] Software interrupt
    TSB $FD                 ; [04 FD      ] Test and Set Bits in DP
    REP #$BD                ; [C2 BD      ] Reset Processor Status Bits
    SEP #$FF                ; [E2 FF      ] Set Processor Status Bits

;--- Patch at file offset $141E30 (SNES $D41E30) ---
org $D41E30

    CLC                     ; [18         ] Clear Carry Flag
    BIT $16CC               ; [2C CC 16   ] Test Bits Absolute
    CPX $4A                 ; [E4 4A      ] Compare X with DP
    SBC ($04)               ; [F2 04      ] Subtract with Borrow (DP)

;--- Patch at file offset $141E40 (SNES $D41E40) ---
org $D41E40

    ORA $06,X               ; [15 06      ] OR A with DP,X
    AND [$04],Y             ; [37 04      ] AND A with [DP],Y
    db $4C, $00                 ; Incomplete/data bytes

;--- Patch at file offset $141E50 (SNES $D41E50) ---
org $D41E50

    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    db $30                      ; Incomplete/data bytes

;--- Patch at file offset $141E61 (SNES $D41E61) ---
org $D41E61

    BRK                     ; [00 BE      ] Software interrupt
    CPX #$DC                ; [E0 DC      ] Compare X Immediate
    BVS $1EDF               ; [70 78      ] Branch if Overflow Set
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $141E70 (SNES $D41E70) ---
org $D41E70

    TSB $E002               ; [0C 02 E0   ] Test and Set Bits Absolute
    CPX $7070               ; [EC 70 70   ] Compare X with Absolute
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $141E80 (SNES $D41E80) ---
org $D41E80

    PLP                     ; [28         ] Pull Processor Status
    BPL $1EA1               ; [10 1E      ] Branch if Plus
    BRK                     ; [00 0B      ] Software interrupt
    COP #$0A                ; [02 0A      ] Coprocessor interrupt
    ORA $0A,S               ; [03 0A      ] OR A with Stack Relative
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 0B      ] Software interrupt
    TRB $09                 ; [14 09      ] Test and Reset Bits DP
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 0C      ] Software interrupt
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA $04,S               ; [03 04      ] OR A with Stack Relative
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    ORA [$11]               ; [07 11      ] OR A with [DP]
    BRK                     ; [00 39      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    ASL $0404,X             ; [1E 04 04   ] Shift Left Absolute,X
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    ASL $04                 ; [06 04      ] Shift Left DP
    ASL $0400,X             ; [1E 00 04   ] Shift Left Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    BPL $1EE1               ; [10 1E      ] Branch if Plus
    BRK                     ; [00 0B      ] Software interrupt
    COP #$0A                ; [02 0A      ] Coprocessor interrupt
    ORA $0A,S               ; [03 0A      ] OR A with Stack Relative
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 0B      ] Software interrupt
    TRB $09                 ; [14 09      ] Test and Reset Bits DP
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 AF      ] Software interrupt
    BVS $1F41               ; [70 5E      ] Branch if Overflow Set
    BMI $1F43               ; [30 5E      ] Branch if Minus
    BMI $1F45               ; [30 5E      ] Branch if Minus
    JSR $207F               ; [20 7F 20   ] Jump to Subroutine
    SBC $C07F00,X           ; [FF 00 7F C0] Subtract with Borrow Absolute Long,X
    LDX $72E0,Y             ; [BE E0 72   ] Load X from Absolute,Y
    TRB $34                 ; [14 34      ] Test and Reset Bits DP
    BRA $1F29               ; [80 34      ] Branch Always
    BRA $1F1B               ; [80 24      ] Branch Always
    DEY                     ; [88         ] Decrement Y
    db $2E, $80                 ; Incomplete/data bytes

;--- Patch at file offset $141F02 (SNES $D41F02) ---
org $D41F02

    BIT $04                 ; [24 04      ] Test Bits DP
    ORA $070800,X           ; [1F 00 08 07] OR A with Absolute Long,X
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    AND $1E18,Y             ; [39 18 1E   ] AND A with Absolute,Y
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 1B      ] Software interrupt
    TSB $18                 ; [04 18      ] Test and Set Bits in DP
    ORA [$00]               ; [07 00      ] OR A with [DP]
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    ASL $04                 ; [06 04      ] Shift Left DP
    ASL $0400,X             ; [1E 00 04   ] Shift Left Absolute,X

;--- Patch at file offset $141F42 (SNES $D41F42) ---
org $D41F42

    BRK                     ; [00 00      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 C4      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    JSR ($BA80,X)           ; [FC 80 BA   ] Jump to Subroutine Indirect,X
    CPX $7D                 ; [E4 7D      ] Compare X with DP
    SEP #$BF                ; [E2 BF      ] Set Processor Status Bits
    BVS $1F51               ; [70 00      ] Branch if Overflow Set
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    TYA                     ; [98         ] Transfer Y to A
    PHP                     ; [08         ] Push Processor Status
    INX                     ; [E8         ] Increment X
    MVP $E4,$0A             ; [44 E4 0A   ] Block Move Positive
    ADC ($04)               ; [72 04      ] Add with Carry (DP)
    LDA $305E70             ; [AF 70 5E 30] Load A from Absolute Long
    EOR ($20)               ; [52 20      ] XOR A with (DP)
    EOR ($20)               ; [52 20      ] XOR A with (DP)
    ADC $40C718,X           ; [7F 18 C7 40] Add with Carry Absolute Long,X
    CMP [$80]               ; [C7 80      ] Compare A with [DP]
    STX $7200               ; [8E 00 72   ] Store X to Absolute
    TRB $30                 ; [14 30      ] Test and Reset Bits DP
    BRA $1F9D               ; [80 28      ] Branch Always
    STY $2C                 ; [84 2C      ] Store Y to DP
    BRA $1F79               ; [80 00      ] Branch Always
    TYA                     ; [98         ] Transfer Y to A
    EOR ($68)               ; [52 68      ] XOR A with (DP)
    BCS $1F08               ; [B0 8A      ] Branch if Carry Set
    RTS                     ; [60         ] Return from Subroutine
    TRB $4C                 ; [14 4C      ] Test and Reset Bits DP
    ORA [$4F]               ; [07 4F      ] OR A with [DP]
    ORA $34,S               ; [03 34      ] OR A with Stack Relative
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    ORA [$11]               ; [07 11      ] OR A with [DP]
    BRK                     ; [00 39      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    ASL $0404,X             ; [1E 04 04   ] Shift Left Absolute,X
    BRK                     ; [00 37      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    ORA ($03,S),Y           ; [13 03      ] OR A with (SR),Y
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    ASL $04                 ; [06 04      ] Shift Left DP
    ASL $0400,X             ; [1E 00 04   ] Shift Left Absolute,X

;--- Patch at file offset $141FC4 (SNES $D41FC4) ---
org $D41FC4

    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA $1703               ; [0D 03 17   ] OR A with Absolute
    ORA $14081F             ; [0F 1F 08 14] OR A with Absolute Long
    PHP                     ; [08         ] Push Processor Status
    PLP                     ; [28         ] Pull Processor Status
    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $141FD6 (SNES $D41FD6) ---
org $D41FD6

    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA $000800             ; [0F 00 08 00] OR A with Absolute Long
    BRK                     ; [00 0F      ] Software interrupt
    ORA $1C,S               ; [03 1C      ] OR A with Stack Relative
    BRK                     ; [00 00      ] Software interrupt
    JMP ($C600,X)           ; [7C 00 C6   ] Jump Indirect,X
    SEC                     ; [38         ] Set Carry Flag
    SBC $E0BF80,X           ; [FF 80 BF E0] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $141FF4 (SNES $D41FF4) ---
org $D41FF4

    MVP $7C,$9E             ; [44 7C 9E   ] Block Move Positive
    ASL                     ; [0A         ] Shift Left Accumulator
    INC $4A                 ; [E6 4A      ] Increment DP
    INC $08                 ; [E6 08      ] Increment DP
    ADC ($04)               ; [72 04      ] Add with Carry (DP)
    ADC ($14)               ; [72 14      ] Add with Carry (DP)
    ASL $1B00,X             ; [1E 00 1B   ] Shift Left Absolute,X
    COP #$2A                ; [02 2A      ] Coprocessor interrupt
    ORA $2A,S               ; [03 2A      ] OR A with Stack Relative
    ORA $38,S               ; [03 38      ] OR A with Stack Relative
    BPL $2020               ; [10 15      ] Branch if Plus
    BRK                     ; [00 0B      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    ORA [$01]               ; [07 01      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    TSB $10                 ; [04 10      ] Test and Set Bits in DP
    ORA [$10]               ; [07 10      ] OR A with [DP]
    COP #$08                ; [02 08      ] Coprocessor interrupt
    BRK                     ; [00 04      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    EOR $006720,X           ; [5F 20 67 00] XOR A with Absolute Long,X
    ADC [$00]               ; [67 00      ] Add with Carry [DP]
    EOR $408F18,X           ; [5F 18 8F 40] XOR A with Absolute Long,X
    DEC $8C80               ; [CE 80 8C   ] Decrement Absolute
    BRK                     ; [00 D8      ] Software interrupt
    CPY #$20                ; [C0 20      ] Compare Y Immediate
    BRL $AA44               ; [82 10 8A   ] Branch Long
    BPL $1FC0               ; [10 8A      ] Branch if Plus
    JSR $629A               ; [20 9A 62   ] Jump to Subroutine
    MVN $A4,$90             ; [54 A4 90   ] Block Move Negative
    JSR $C050               ; [20 50 C0   ] Jump to Subroutine
    JSR $030F               ; [20 0F 03   ] Jump to Subroutine
    TSB $03                 ; [04 03      ] Test and Set Bits in DP
    TSB $03                 ; [04 03      ] Test and Set Bits in DP
    ASL $00                 ; [06 00      ] Shift Left DP
    COP #$00                ; [02 00      ] Coprocessor interrupt
    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 03      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BEQ $1FE2               ; [F0 80      ] Branch if Equal
    BEQ $2044               ; [F0 E0      ] Branch if Equal
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRA $1FEB               ; [80 80      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $2079               ; [80 00      ] Branch Always
    BRA $207B               ; [80 00      ] Branch Always
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $142084 (SNES $D42084) ---
org $D42084

    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA [$01]               ; [07 01      ] OR A with [DP]
    TSB $0B07               ; [0C 07 0B   ] Test and Set Bits Absolute
    TSB $1F                 ; [04 1F      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $142096 (SNES $D42096) ---
org $D42096

    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA [$00]               ; [07 00      ] OR A with [DP]
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    PHD                     ; [0B         ] Push Direct Page Register
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    INC $7F00,X             ; [FE 00 7F   ] Increment Absolute,X
    CPX #$5F                ; [E0 5F      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    LDA $3CDE78,X           ; [BF 78 DE 3C] Load A from Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BMI $2126               ; [30 70      ] Branch if Minus
    TRB $E604               ; [1C 04 E6   ] Test and Reset Bits Absolute
    BRL $41B6               ; [82 FA 20   ] Branch Long
    PLY                     ; [7A         ] Pull Y Register
    BRK                     ; [00 3C      ] Software interrupt
    BRA $20E0               ; [80 1F      ] Branch Always
    BRK                     ; [00 2C      ] Software interrupt
    BPL $2121               ; [10 5C      ] Branch if Plus
    JSR $205E               ; [20 5E 20   ] Jump to Subroutine
    EOR $7220,X             ; [5D 20 72   ] XOR A with Absolute,X
    BRK                     ; [00 32      ] Software interrupt
    BRK                     ; [00 2F      ] Software interrupt
    TSB $0304               ; [0C 04 03   ] Test and Set Bits Absolute
    ORA $14,S               ; [03 14      ] OR A with Stack Relative
    ORA ($34,S),Y           ; [13 34      ] OR A with (SR),Y
    ORA $1230,Y             ; [19 30 12   ] OR A with Absolute,Y
    JSR $2429               ; [20 29 24   ] Jump to Subroutine
    ORA #$04                ; [09 04      ] OR A with Immediate
    BPL $20EC               ; [10 0C      ] Branch if Plus
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
    BRA $20FC               ; [80 00      ] Branch Always
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

;--- Patch at file offset $14212D (SNES $D4212D) ---
org $D4212D

    BRA $20AF               ; [80 80      ] Branch Always
    BRK                     ; [00 A4      ] Software interrupt
    MVN $80,$60             ; [54 80 60   ] Block Move Negative
    TRB $5C00               ; [1C 00 5C   ] Test and Reset Bits Absolute
    JSR $6080               ; [20 80 60   ] Jump to Subroutine
    BRA $20FC               ; [80 C0      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt

;--- Patch at file offset $142144 (SNES $D42144) ---
org $D42144

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $3E07,X             ; [1D 07 3E   ] OR A with Absolute,X
    ORA $7E1F21,X           ; [1F 21 1F 7E] OR A with Absolute Long,X
    db $21                      ; Incomplete/data bytes

;--- Patch at file offset $142156 (SNES $D42156) ---
org $D42156

    BRK                     ; [00 00      ] Software interrupt
    ORA [$02]               ; [07 02      ] OR A with [DP]
    ORA $001F01,X           ; [1F 01 1F 00] OR A with Absolute Long,X
    AND ($00,X)             ; [21 00      ] AND A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BEQ $2166               ; [F0 00      ] Branch if Equal
    PLP                     ; [28         ] Pull Processor Status
    BNE $2161               ; [D0 F8      ] Branch if Not Equal
    BRK                     ; [00 FC      ] Software interrupt
    CPY #$FE                ; [C0 FE      ] Compare Y Immediate
    CPY #$7E                ; [C0 7E      ] Compare Y Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BEQ $21A9               ; [F0 30      ] Branch if Equal
    BMI $2153               ; [30 D8      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    CPY $E414               ; [CC 14 E4   ] Compare Y with Absolute
    PHP                     ; [08         ] Push Processor Status
    ADC ($10,X)             ; [61 10      ] Add with Carry (DP,X)
    BVS $2184               ; [70 00      ] Branch if Overflow Set
    BMI $2186               ; [30 00      ] Branch if Minus
    ASL $00,X               ; [16 00      ] Shift Left DP,X
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 15      ] Software interrupt
    BRK                     ; [00 25      ] Software interrupt
    ORA ($37,X)             ; [01 37      ] OR A with (DP,X)
    BPL $2191               ; [10 00      ] Branch if Plus
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
    BRA $216B               ; [80 BE      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    JML [$E4F0]             ; [DC F0 E4   ] Jump Long Indirect
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRK                     ; [00 68      ] Software interrupt
    BRK                     ; [00 48      ] Software interrupt
    BPL $2215               ; [10 5C      ] Branch if Plus
    BRK                     ; [00 8C      ] Software interrupt
    BRK                     ; [00 68      ] Software interrupt
    STZ $F0                 ; [64 F0      ] Store Zero to DP
    BEQ $2222               ; [F0 61      ] Branch if Equal
    BPL $2233               ; [10 70      ] Branch if Plus
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 16      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 15      ] Software interrupt
    BRK                     ; [00 25      ] Software interrupt
    ORA ($37,X)             ; [01 37      ] OR A with (DP,X)
    BPL $21D1               ; [10 00      ] Branch if Plus
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
    BRA $21AB               ; [80 BE      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    JML [$E4F0]             ; [DC F0 E4   ] Jump Long Indirect
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRK                     ; [00 68      ] Software interrupt
    BRK                     ; [00 48      ] Software interrupt
    BPL $2255               ; [10 5C      ] Branch if Plus
    BRK                     ; [00 8C      ] Software interrupt
    BRK                     ; [00 68      ] Software interrupt
    STZ $F0                 ; [64 F0      ] Store Zero to DP
    BEQ $2201               ; [F0 00      ] Branch if Equal
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 19      ] Software interrupt
    ASL $27                 ; [06 27      ] Shift Left DP
    CLC                     ; [18         ] Clear Carry Flag
    AND $215810             ; [2F 10 58 21] AND A with Absolute Long

;--- Patch at file offset $142216 (SNES $D42216) ---
org $D42216

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $224F               ; [10 2F      ] Branch if Plus
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
    BPL $2257               ; [10 F6      ] Branch if Plus
    TSB $00FE               ; [0C FE 00   ] Test and Set Bits Absolute
    INC $FE00,X             ; [FE 00 FE   ] Increment Absolute,X
    BRK                     ; [00 F4      ] Software interrupt
    BRA $21EF               ; [80 84      ] Branch Always
    PHP                     ; [08         ] Push Processor Status
    CLC                     ; [18         ] Clear Carry Flag
    BMI $2253               ; [30 E4      ] Branch if Minus
    SEI                     ; [78         ] Set Interrupt Disable
    CPY $4020               ; [CC 20 40   ] Compare Y with Absolute
    LDY $08                 ; [A4 08      ] Load Y from DP
    PEI ($00)               ; [D4 00      ] Push Effective Indirect
    MVN $88,$08             ; [54 88 08   ] Block Move Negative
    SEI                     ; [78         ] Set Interrupt Disable
    BVS $226D               ; [70 F0      ] Branch if Overflow Set
    CPY #$78                ; [C0 78      ] Compare Y Immediate
    BRK                     ; [00 91      ] Software interrupt
    ASL $9F                 ; [06 9F      ] Shift Left DP
    ORA $68                 ; [05 68      ] OR A with Direct Page
    ORA [$0B]               ; [07 0B      ] OR A with [DP]

;--- Patch at file offset $142290 (SNES $D42290) ---
org $D42290

    ROR $4108               ; [6E 08 41   ] Rotate Right Absolute
    BIT $07                 ; [24 07      ] Test Bits DP
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $1422A0 (SNES $D422A0) ---
org $D422A0

    ROL $3C1C,X             ; [3E 1C 3C   ] Rotate Left Absolute,X
    JSR $80E4               ; [20 E4 80   ] Jump to Subroutine
    MVP $B0,$C4             ; [44 B0 C4   ] Block Move Positive
    BMI $224F               ; [30 A4      ] Branch if Minus
    BPL $223F               ; [10 92      ] Branch if Plus
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
    BNE $2293               ; [D0 AC      ] Branch if Not Equal
    BVS $22D7               ; [70 EE      ] Branch if Overflow Set
    BPL $22E9               ; [10 FE      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    DEC $28,X               ; [D6 28      ] Decrement DP,X
    AND $0000C0,X           ; [3F C0 00 00] AND A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BNE $2276               ; [D0 80      ] Branch if Not Equal
    BVS $2308               ; [70 10      ] Branch if Overflow Set
    BPL $228E               ; [10 94      ] Branch if Plus
    INY                     ; [C8         ] Increment Y
    JSR $2CC8               ; [20 C8 2C   ] Jump to Subroutine
    JSR $28D2               ; [20 D2 28   ] Jump to Subroutine
    BPL $2314               ; [10 11      ] Branch if Plus
    BRK                     ; [00 3E      ] Software interrupt
    ORA ($2A,X)             ; [01 2A      ] OR A with (DP,X)
    ORA $2A,S               ; [03 2A      ] OR A with Stack Relative
    ORA ($18,S),Y           ; [13 18      ] OR A with (SR),Y
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 39      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    ORA $1C,S               ; [03 1C      ] OR A with Stack Relative
    ASL $08                 ; [06 08      ] Shift Left DP
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
    BPL $237D               ; [10 14      ] Branch if Plus
    BRK                     ; [00 32      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    DEX                     ; [CA         ] Decrement X
    STZ $FC,X               ; [74 FC      ] Store Zero to DP,X
    BRK                     ; [00 DC      ] Software interrupt
    TRB $0808               ; [1C 08 08   ] Test and Reset Bits Absolute
    BMI $2376               ; [30 00      ] Branch if Minus
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
    BPL $23D5               ; [10 4A      ] Branch if Plus
    SEC                     ; [38         ] Set Carry Flag
    AND $08,X               ; [35 08      ] AND A with DP,X
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 6E      ] Software interrupt

;--- Patch at file offset $142397 (SNES $D42397) ---
org $D42397

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

;--- Patch at file offset $1423C4 (SNES $D423C4) ---
org $D423C4

    BRK                     ; [00 00      ] Software interrupt
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    ASL                     ; [0A         ] Shift Left Accumulator
    TSB $0B                 ; [04 0B      ] Test and Set Bits in DP
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    PHD                     ; [0B         ] Push Direct Page Register
    db $1F, $00                 ; Incomplete/data bytes

;--- Patch at file offset $1423D6 (SNES $D423D6) ---
org $D423D6

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
    BPL $23B3               ; [10 C8      ] Branch if Plus
    BMI $2395               ; [30 A8      ] Branch if Minus
    BVS $244B               ; [70 5C      ] Branch if Overflow Set
    SED                     ; [F8         ] Set Decimal Flag

;--- Patch at file offset $1423F6 (SNES $D423F6) ---
org $D423F6

    BRK                     ; [00 00      ] Software interrupt
    BPL $23FA               ; [10 00      ] Branch if Plus
    BMI $240C               ; [30 10      ] Branch if Minus
    BVS $240E               ; [70 10      ] Branch if Overflow Set
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
    BMI $2421               ; [30 FE      ] Branch if Minus
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

;--- Patch at file offset $142450 (SNES $D42450) ---
org $D42450

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
    BVS $244F               ; [70 EA      ] Branch if Overflow Set
    BEQ $24DD               ; [F0 76      ] Branch if Equal
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
    BPL $24B2               ; [10 11      ] Branch if Plus
    ASL $0F                 ; [06 0F      ] Shift Left DP
    ORA $09                 ; [05 09      ] OR A with Direct Page
    ASL $14                 ; [06 14      ] Shift Left DP
    COP #$32                ; [02 32      ] Coprocessor interrupt
    BPL $24F5               ; [10 4A      ] Branch if Plus
    SEC                     ; [38         ] Set Carry Flag
    AND $08,X               ; [35 08      ] AND A with DP,X
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 0E      ] Software interrupt

;--- Patch at file offset $1424B7 (SNES $D424B7) ---
org $D424B7

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
    BRA $24F9               ; [80 0E      ] Branch Always
    BRK                     ; [00 22      ] Software interrupt
    PEA $709C               ; [F4 9C 70   ] Push Effective Absolute
    CPY $4020               ; [CC 20 40   ] Compare Y with Absolute
    LDY $08                 ; [A4 08      ] Load Y from DP
    PEI ($08)               ; [D4 08      ] Push Effective Indirect
    MVN $80,$08             ; [54 80 08   ] Block Move Negative
    BEQ $24EC               ; [F0 F0      ] Branch if Equal
    JSR ($7008,X)           ; [FC 08 70   ] Jump to Subroutine Indirect,X
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $142506 (SNES $D42506) ---
org $D42506

    TRB $02                 ; [14 02      ] Test and Reset Bits DP
    AND ($10)               ; [32 10      ] AND A with (DP)
    LSR                     ; [4A         ] Shift Right Accumulator
    SEC                     ; [38         ] Set Carry Flag
    db $35                      ; Incomplete/data bytes

;--- Patch at file offset $142517 (SNES $D42517) ---
org $D42517

    ORA ($19,X)             ; [01 19      ] OR A with (DP,X)
    TSB $39                 ; [04 39      ] Test and Set Bits in DP
    TSB $08                 ; [04 08      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E8      ] Software interrupt
    BCS $259F               ; [B0 7C      ] Branch if Carry Set
    CLD                     ; [D8         ] Clear Decimal Flag
    CLD                     ; [D8         ] Clear Decimal Flag
    JSR $3064               ; [20 64 30   ] Jump to Subroutine
    STZ $50                 ; [64 50      ] Store Zero to DP
    CMP ($E8)               ; [D2 E8      ] Compare A with (DP)
    ROL                     ; [2A         ] Rotate Left Accumulator
    CPY #$C4                ; [C0 C4      ] Compare Y Immediate
    BRK                     ; [00 B0      ] Software interrupt
    BRA $250B               ; [80 D8      ] Branch Always
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
    BRA $258D               ; [80 18      ] Branch Always
    BRL $2F88               ; [82 10 0A   ] Branch Long
    LDY #$22                ; [A0 22      ] Load Y Immediate
    BVS $25F0               ; [70 74      ] Branch if Overflow Set
    BEQ $2572               ; [F0 F4      ] Branch if Equal
    PLA                     ; [68         ] Pull Accumulator
    RTS                     ; [60         ] Return from Subroutine
    BCC $2589               ; [90 07      ] Branch if Carry Clear
    STZ $6905,X             ; [9E 05 69   ] Store Zero to Absolute,X
    ASL $14                 ; [06 14      ] Shift Left DP
    COP #$32                ; [02 32      ] Coprocessor interrupt
    BPL $25D5               ; [10 4A      ] Branch if Plus
    SEC                     ; [38         ] Set Carry Flag
    db $35                      ; Incomplete/data bytes

;--- Patch at file offset $142597 (SNES $D42597) ---
org $D42597

    ORA ($19,X)             ; [01 19      ] OR A with (DP,X)
    TSB $39                 ; [04 39      ] Test and Set Bits in DP
    TSB $08                 ; [04 08      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 68      ] Software interrupt
    CPY #$64                ; [C0 64      ] Compare Y Immediate
    DEY                     ; [88         ] Decrement Y
    CPX $50                 ; [E4 50      ] Compare X with DP
    MVN $20,$64             ; [54 20 64   ] Block Move Negative
    BVC $257F               ; [50 D4      ] Branch if Overflow Clear
    CPX #$32                ; [E0 32      ] Compare X Immediate
    INY                     ; [C8         ] Increment Y
    DEC $D000               ; [CE 00 D0   ] Decrement Absolute
    BVC $254B               ; [50 98      ] Branch if Overflow Clear
    BPL $260D               ; [10 58      ] Branch if Plus
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

;--- Patch at file offset $1425D6 (SNES $D425D6) ---
org $D425D6

    BRK                     ; [00 07      ] Software interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $260D               ; [10 2F      ] Branch if Plus
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
    BMI $263C               ; [30 2F      ] Branch if Minus
    PHD                     ; [0B         ] Push Direct Page Register
    BPL $2617               ; [10 07      ] Branch if Plus
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
    BRA $25E7               ; [80 BE      ] Branch Always
    BVS $2667               ; [70 3C      ] Branch if Overflow Set
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
    BNE $2610               ; [D0 D0      ] Branch if Not Equal
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
    BMI $261B               ; [30 B2      ] Branch if Minus
    BRK                     ; [00 0E      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    BMI $2623               ; [30 B0      ] Branch if Minus
    BPL $2625               ; [10 B0      ] Branch if Plus
    BPL $26AF               ; [10 38      ] Branch if Plus
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
    BEQ $26A4               ; [F0 00      ] Branch if Equal
    RTS                     ; [60         ] Return from Subroutine
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    BRK                     ; [00 78      ] Software interrupt
    BRA $26A7               ; [80 FC      ] Branch Always
    BRK                     ; [00 7C      ] Software interrupt
    BRA $26A5               ; [80 F6      ] Branch Always
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRA $269B               ; [80 E0      ] Branch Always
    CLC                     ; [18         ] Clear Carry Flag
    BVS $2646               ; [70 88      ] Branch if Overflow Set
    BCC $272C               ; [90 6C      ] Branch if Carry Clear
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
    BPL $2705               ; [10 08      ] Branch if Plus
    JSR $5094               ; [20 94 50   ] Jump to Subroutine
    ORA $023500,X           ; [1F 00 35 02] OR A with Absolute Long,X
    EOR $02                 ; [45 02      ] XOR A with Direct Page
    db $A6                      ; Incomplete/data bytes

;--- Patch at file offset $14270D (SNES $D4270D) ---
org $D4270D

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

;--- Patch at file offset $142744 (SNES $D42744) ---
org $D42744

    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $215810             ; [2F 10 58 21] AND A with Absolute Long

;--- Patch at file offset $142756 (SNES $D42756) ---
org $D42756

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $278F               ; [10 2F      ] Branch if Plus
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
    ORA ($00)               ; [12 00      ] OR A with (DP)
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    BEQ $278A               ; [F0 00      ] Branch if Equal
    TYA                     ; [98         ] Transfer Y to A
    JSR $114E               ; [20 4E 11   ] Jump to Subroutine
    ADC #$18                ; [69 18      ] Add with Carry Immediate
    ASL $39                 ; [06 39      ] Shift Left DP
    ASL $0C11               ; [0E 11 0C   ] Shift Left Absolute
    ORA ($0A,X)             ; [01 0A      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($66,X)             ; [01 66      ] OR A with (DP,X)
    EOR ($31,X)             ; [41 31      ] XOR A with (DP,X)
    JSR $181E               ; [20 1E 18   ] Jump to Subroutine
    INC $0C,X               ; [F6 0C      ] Increment DP,X
    INC $3E00,X             ; [FE 00 3E   ] Increment Absolute,X
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRA $2777               ; [80 CC      ] Branch Always
    BRK                     ; [00 4E      ] Software interrupt
    TSB $1CE6               ; [0C E6 1C   ] Test and Set Bits Absolute
    CPY $4420               ; [CC 20 44   ] Compare Y with Absolute
    LDY #$44                ; [A0 44      ] Load Y Immediate
    DEY                     ; [88         ] Decrement Y
    MVP $88,$84             ; [44 88 84   ] Block Move Positive
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 AC      ] Software interrupt
    STZ $1C1C               ; [9C 1C 1C   ] Store Zero to Absolute
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    JSR $1200               ; [20 00 12   ] Jump to Subroutine
    BRK                     ; [00 14      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 9C      ] Software interrupt
    JSR $114E               ; [20 4E 11   ] Jump to Subroutine
    ADC #$18                ; [69 18      ] Add with Carry Immediate
    ASL $39                 ; [06 39      ] Shift Left DP
    ASL $0C11               ; [0E 11 0C   ] Shift Left Absolute
    ORA ($0A,X)             ; [01 0A      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($62,X)             ; [01 62      ] OR A with (DP,X)
    EOR ($31,X)             ; [41 31      ] XOR A with (DP,X)
    JSR $181E               ; [20 1E 18   ] Jump to Subroutine
    INC $0C,X               ; [F6 0C      ] Increment DP,X
    INC $3E00,X             ; [FE 00 3E   ] Increment Absolute,X
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRA $27B7               ; [80 CC      ] Branch Always
    BRK                     ; [00 4E      ] Software interrupt
    TSB $1CE6               ; [0C E6 1C   ] Test and Set Bits Absolute
    CPY $4420               ; [CC 20 44   ] Compare Y with Absolute
    LDY #$44                ; [A0 44      ] Load Y Immediate
    DEY                     ; [88         ] Decrement Y
    MVP $88,$84             ; [44 88 84   ] Block Move Positive
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 AC      ] Software interrupt
    STZ $1C1C               ; [9C 1C 1C   ] Store Zero to Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $205911             ; [2F 11 59 20] AND A with Absolute Long

;--- Patch at file offset $142816 (SNES $D42816) ---
org $D42816

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ASL $18                 ; [06 18      ] Shift Left DP
    ORA #$17                ; [09 17      ] OR A with Immediate
    BPL $284E               ; [10 2E      ] Branch if Plus
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
    BVC $281B               ; [50 E0      ] Branch if Overflow Clear
    CPX $B0B4               ; [EC B4 B0   ] Compare X with Absolute
    CPX $E8                 ; [E4 E8      ] Compare X with DP
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600               ; [2C 00 16   ] Test Bits Absolute
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $20                 ; [06 20      ] Shift Left DP
    BPL $2884               ; [10 37      ] Branch if Plus
    ORA $060F78,X           ; [1F 78 0F 06] OR A with Absolute Long,X
    AND $1102,Y             ; [39 02 11   ] AND A with Absolute,Y
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($1E,X)             ; [01 1E      ] OR A with (DP,X)
    ORA ($0F,X)             ; [01 0F      ] OR A with (DP,X)
    BPL $2866               ; [10 07      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    INC $FC40,X             ; [FE 40 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    CPY #$3E                ; [C0 3E      ] Compare Y Immediate
    CPX #$FC                ; [E0 FC      ] Compare X Immediate
    BPL $28B5               ; [10 44      ] Branch if Plus
    PHA                     ; [48         ] Push Accumulator
    BRK                     ; [00 A8      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $2885               ; [90 0C      ] Branch if Carry Clear
    BCC $283F               ; [90 C4      ] Branch if Carry Clear
    CLC                     ; [18         ] Clear Carry Flag
    CPX #$0C                ; [E0 0C      ] Compare X Immediate
    BPL $2888               ; [10 08      ] Branch if Plus
    STA $9F0E,X             ; [9D 0E 9F   ] Store A to Absolute,X
    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $14288C (SNES $D4288C) ---
org $D4288C

    ASL $02                 ; [06 02      ] Shift Left DP
    ORA [$00]               ; [07 00      ] OR A with [DP]
    PER $699F               ; [62 0C 41   ] Push Effective Relative
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
    BPL $2865               ; [10 B8      ] Branch if Plus
    BPL $28BF               ; [10 10      ] Branch if Plus
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BPL $28BD               ; [10 08      ] Branch if Plus
    BRK                     ; [00 20      ] Software interrupt
    TSB $10                 ; [04 10      ] Test and Set Bits in DP
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    BPL $28BD               ; [10 00      ] Branch if Plus
    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $1428C4 (SNES $D428C4) ---
org $D428C4

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $205911             ; [2F 11 59 20] AND A with Absolute Long

;--- Patch at file offset $1428D6 (SNES $D428D6) ---
org $D428D6

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ASL $18                 ; [06 18      ] Shift Left DP
    ORA #$17                ; [09 17      ] OR A with Immediate
    BPL $290E               ; [10 2E      ] Branch if Plus
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
    BVC $28DB               ; [50 E0      ] Branch if Overflow Clear
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
    BMI $2926               ; [30 08      ] Branch if Minus
    AND [$00],Y             ; [37 00      ] AND A with [DP],Y
    INC $FC40,X             ; [FE 40 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 9E      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    LSR $3C30,X             ; [5E 30 3C   ] Shift Right Absolute,X
    BPL $2975               ; [10 44      ] Branch if Plus
    PHA                     ; [48         ] Push Accumulator
    BRK                     ; [00 A8      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $2945               ; [90 0C      ] Branch if Carry Clear
    BCC $299F               ; [90 64      ] Branch if Carry Clear
    PHP                     ; [08         ] Push Processor Status
    BCS $2942               ; [B0 04      ] Branch if Carry Set
    BNE $2940               ; [D0 00      ] Branch if Not Equal
    EOR #$01                ; [49 01      ] XOR A with Immediate
    AND $070900,X           ; [3F 00 09 07] AND A with Absolute Long,X
    TSB $0B00               ; [0C 00 0B   ] Test and Set Bits Absolute
    ORA $11,S               ; [03 11      ] OR A with Stack Relative
    ASL $0819               ; [0E 19 08   ] Shift Left Absolute

;--- Patch at file offset $142956 (SNES $D42956) ---
org $D42956

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
    BNE $297E               ; [D0 04      ] Branch if Not Equal
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
    BMI $29A5               ; [30 08      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    JSR $202E               ; [20 2E 20   ] Jump to Subroutine
    INC $0C,X               ; [F6 0C      ] Increment DP,X
    JML $D8A420             ; [5C 20 A4 D8] Jump Long
    ASL $ACCC,X             ; [1E CC AC   ] Shift Left Absolute,X
    BRA $296F               ; [80 C0      ] Branch Always
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BPL $29BD               ; [10 08      ] Branch if Plus
    TSB $A0                 ; [04 A0      ] Test and Set Bits in DP
    BRK                     ; [00 D8      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BIT $C0C0               ; [2C C0 C0   ] Test Bits Absolute

;--- Patch at file offset $1429CA (SNES $D429CA) ---
org $D429CA

    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA [$00]               ; [07 00      ] OR A with [DP]

;--- Patch at file offset $1429DE (SNES $D429DE) ---
org $D429DE

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1429EA (SNES $D429EA) ---
org $D429EA

    BVS $29EC               ; [70 00      ] Branch if Overflow Set
    STZ $F670               ; [9C 70 F6   ] Store Zero to Absolute
    CLC                     ; [18         ] Clear Carry Flag

;--- Patch at file offset $1429FA (SNES $D429FA) ---
org $D429FA

    BRK                     ; [00 00      ] Software interrupt
    BPL $2A6E               ; [10 70      ] Branch if Plus
    BMI $2A1C               ; [30 1C      ] Branch if Minus
    ORA $2F06,Y             ; [19 06 2F   ] OR A with Absolute,Y
    BPL $2A64               ; [10 5F      ] Branch if Plus
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
    BPL $2A1F               ; [10 02      ] Branch if Plus
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 FF      ] Software interrupt
    BPL $2A1A               ; [10 F7      ] Branch if Plus
    JSR $10FF               ; [20 FF 10   ] Jump to Subroutine
    db $7E                      ; Incomplete/data bytes

;--- Patch at file offset $142A34 (SNES $D42A34) ---
org $D42A34

    BVC $29C8               ; [50 92      ] Branch if Overflow Clear
    MVN $90,$30             ; [54 90 30   ] Block Move Negative
    PEI ($80)               ; [D4 80      ] Push Effective Indirect
    STZ $04                 ; [64 04      ] Store Zero to DP
    ADC ($24)               ; [72 24      ] Add with Carry (DP)
    LSR                     ; [4A         ] Shift Right Accumulator
    AND $0D,X               ; [35 0D      ] AND A with DP,X
    BVC $2A64               ; [50 20      ] Branch if Overflow Clear
    ADC $0F783F,X           ; [7F 3F 78 0F] Add with Carry Absolute Long,X
    JMP ($6737,X)           ; [7C 37 67   ] Jump Indirect,X
    JSR $0025               ; [20 25 00   ] Jump to Subroutine
    ROL $0200,X             ; [3E 00 02   ] Rotate Left Absolute,X
    BRK                     ; [00 2E      ] Software interrupt
    ORA ($0F,X)             ; [01 0F      ] OR A with (DP,X)
    BMI $2A5E               ; [30 07      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    AND ($04,S),Y           ; [33 04      ] AND A with (SR),Y
    PLP                     ; [28         ] Pull Processor Status
    BPL $2A77               ; [10 1A      ] Branch if Plus
    COP #$00                ; [02 00      ] Coprocessor interrupt
    BRK                     ; [00 7F      ] Software interrupt
    BRA $2AB1               ; [80 4E      ] Branch Always
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
    BPL $2AA6               ; [10 07      ] Branch if Plus
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
    BMI $2AC5               ; [30 08      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600               ; [2C 00 16   ] Test Bits Absolute
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $20                 ; [06 20      ] Shift Left DP
    BPL $2B04               ; [10 37      ] Branch if Plus
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
    BCC $2B05               ; [90 0C      ] Branch if Carry Clear
    BCS $2AFF               ; [B0 04      ] Branch if Carry Set
    CLC                     ; [18         ] Clear Carry Flag
    JSR $78C4               ; [20 C4 78   ] Jump to Subroutine
    BRK                     ; [00 24      ] Software interrupt
    TSB $24                 ; [04 24      ] Test and Set Bits in DP
    TSB $1F                 ; [04 1F      ] Test and Set Bits in DP
    BRK                     ; [00 12      ] Software interrupt
    BRK                     ; [00 2C      ] Software interrupt
    TRB $2D63               ; [1C 63 2D   ] Test and Reset Bits Absolute
    db $35                      ; Incomplete/data bytes

;--- Patch at file offset $142B13 (SNES $D42B13) ---
org $D42B13

    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 08      ] Software interrupt
    ORA $1D                 ; [05 1D      ] OR A with Direct Page
    COP #$3D                ; [02 3D      ] Coprocessor interrupt
    BMI $2B25               ; [30 08      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    PLY                     ; [7A         ] Pull Y Register
    TSB $142E               ; [0C 2E 14   ] Test and Set Bits Absolute
    CPX $18                 ; [E4 18      ] Compare X with DP
    JML $CCBE08             ; [5C 08 BE CC] Jump Long
    ASL $B0C0,X             ; [1E C0 B0   ] Shift Left Absolute,X
    BRA $2AEF               ; [80 C0      ] Branch Always
    BRK                     ; [00 0C      ] Software interrupt
    BRA $2B43               ; [80 10      ] Branch Always
    CPY $18                 ; [C4 18      ] Compare Y with DP
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
    BVC $2B3B               ; [50 E0      ] Branch if Overflow Clear
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
    BRA $2BDF               ; [80 64      ] Branch Always
    BPL $2BDD               ; [10 60      ] Branch if Plus
    TRB $40                 ; [14 40      ] Test and Reset Bits DP
    TAY                     ; [A8         ] Transfer A to Y
    db $9D, $0F                 ; Incomplete/data bytes

;--- Patch at file offset $142B88 (SNES $D42B88) ---
org $D42B88

    BIT $631C               ; [2C 1C 63   ] Test Bits Absolute
    AND $0035               ; [2D 35 00   ] AND A with Absolute
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 63      ] Software interrupt

;--- Patch at file offset $142B98 (SNES $D42B98) ---
org $D42B98

    ORA $3D02,X             ; [1D 02 3D   ] OR A with Absolute,X
    BMI $2BA5               ; [30 08      ] Branch if Minus
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

;--- Patch at file offset $142BC4 (SNES $D42BC4) ---
org $D42BC4

    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $205911             ; [2F 11 59 20] AND A with Absolute Long
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y

;--- Patch at file offset $142BD6 (SNES $D42BD6) ---
org $D42BD6

    BRK                     ; [00 07      ] Software interrupt
    ASL $18                 ; [06 18      ] Shift Left DP
    ORA #$17                ; [09 17      ] OR A with Immediate
    BPL $2C0C               ; [10 2E      ] Branch if Plus
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
    BVC $2BD9               ; [50 E0      ] Branch if Overflow Clear
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
    BPL $2C2C               ; [10 0F      ] Branch if Plus
    BPL $2C21               ; [10 02      ] Branch if Plus
    TSB $00FC               ; [0C FC 00   ] Test and Set Bits Absolute
    DEC $CE00               ; [CE 00 CE   ] Decrement Absolute
    BRK                     ; [00 BE      ] Software interrupt
    BMI $2BC7               ; [30 9E      ] Branch if Minus
    BRK                     ; [00 1E      ] Software interrupt
    BRK                     ; [00 1C      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $2C57               ; [80 24      ] Branch Always
    BCC $2C59               ; [90 24      ] Branch if Carry Clear
    BCC $2CAB               ; [90 74      ] Branch if Carry Clear
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
    BPL $2C57               ; [10 F4      ] Branch if Plus
    CLD                     ; [D8         ] Clear Decimal Flag
    PEI ($28)               ; [D4 28      ] Push Effective Indirect
    JML [$DC28]             ; [DC 28 DC   ] Jump Long Indirect
    PLP                     ; [28         ] Pull Processor Status
    JMP ($3828,X)           ; [7C 28 38   ] Jump Indirect,X
    BPL $2CA7               ; [10 38      ] Branch if Plus
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

;--- Patch at file offset $142C97 (SNES $D42C97) ---
org $D42C97

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
    BCS $2CF8               ; [B0 00      ] Branch if Carry Set
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

;--- Patch at file offset $142D25 (SNES $D42D25) ---
org $D42D25

    LDY $4AF5               ; [AC F5 4A   ] Load Y from Absolute
    STA $9B0A,X             ; [9D 0A 9B   ] Store A to Absolute,X
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $142D34 (SNES $D42D34) ---
org $D42D34

    LDY $4A00               ; [AC 00 4A   ] Load Y from Absolute
    RTI                     ; [40         ] Return from Interrupt
    PER $91A3               ; [62 68 64   ] Push Effective Relative
    db $62                      ; Incomplete/data bytes

;--- Patch at file offset $142D44 (SNES $D42D44) ---
org $D42D44

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $205911             ; [2F 11 59 20] AND A with Absolute Long

;--- Patch at file offset $142D56 (SNES $D42D56) ---
org $D42D56

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ASL $18                 ; [06 18      ] Shift Left DP
    ORA #$17                ; [09 17      ] OR A with Immediate
    BPL $2D8E               ; [10 2E      ] Branch if Plus
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
    BVC $2D5B               ; [50 E0      ] Branch if Overflow Clear
    CPX $B0B4               ; [EC B4 B0   ] Compare X with Absolute
    CPX $E8                 ; [E4 E8      ] Compare X with DP
    CLI                     ; [58         ] Clear Interrupt Disable
    JSR $0020               ; [20 20 00   ] Jump to Subroutine
    BPL $2D86               ; [10 00      ] Branch if Plus
    ORA $1000,Y             ; [19 00 10   ] OR A with Absolute,Y
    BRK                     ; [00 34      ] Software interrupt
    BPL $2DB8               ; [10 2B      ] Branch if Plus
    BPL $2DE0               ; [10 51      ] Branch if Plus
    ORA ($16),Y             ; [11 16      ] OR A with (DP),Y
    AND #$0F                ; [29 0F      ] AND A with Immediate
    BPL $2DA4               ; [10 0F      ] Branch if Plus
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
    BPL $2DC3               ; [10 14      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    MVP $48,$00             ; [44 48 00   ] Block Move Positive
    TAY                     ; [A8         ] Transfer A to Y
    PLP                     ; [28         ] Pull Processor Status
    RTI                     ; [40         ] Return from Interrupt
    PHP                     ; [08         ] Push Processor Status
    BNE $2DC5               ; [D0 0C      ] Branch if Not Equal
    BCC $2DBF               ; [90 04      ] Branch if Carry Clear
    PHP                     ; [08         ] Push Processor Status
    BCC $2E02               ; [90 44      ] Branch if Carry Clear
    DEY                     ; [88         ] Decrement Y
    RTS                     ; [60         ] Return from Subroutine
    CLI                     ; [58         ] Clear Interrupt Disable
    JSR $0020               ; [20 20 00   ] Jump to Subroutine
    BPL $2DC6               ; [10 00      ] Branch if Plus
    ORA $1000,Y             ; [19 00 10   ] OR A with Absolute,Y
    BRK                     ; [00 3A      ] Software interrupt
    BPL $2DF8               ; [10 2B      ] Branch if Plus
    BPL $2E20               ; [10 51      ] Branch if Plus
    ORA ($16),Y             ; [11 16      ] OR A with (DP),Y
    AND #$0F                ; [29 0F      ] AND A with Immediate
    BPL $2DE4               ; [10 0F      ] Branch if Plus
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
    BPL $2E03               ; [10 14      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    MVP $48,$00             ; [44 48 00   ] Block Move Positive
    TAY                     ; [A8         ] Transfer A to Y
    PLP                     ; [28         ] Pull Processor Status
    RTI                     ; [40         ] Return from Interrupt
    PHP                     ; [08         ] Push Processor Status
    BNE $2E05               ; [D0 0C      ] Branch if Not Equal
    BCC $2DFF               ; [90 04      ] Branch if Carry Clear
    PHP                     ; [08         ] Push Processor Status
    BCC $2E42               ; [90 44      ] Branch if Carry Clear
    DEY                     ; [88         ] Decrement Y
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    AND [$00]               ; [27 00      ] AND A with [DP]
    ADC $017E01,X           ; [7F 01 7E 01] Add with Carry Absolute Long,X
    ROR $3F25,X             ; [7E 25 3F   ] Rotate Right Absolute,X
    CLC                     ; [18         ] Clear Carry Flag

;--- Patch at file offset $142E16 (SNES $D42E16) ---
org $D42E16

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
    BPL $2E05               ; [10 C8      ] Branch if Plus
    TRB $E4                 ; [14 E4      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    SEI                     ; [78         ] Set Interrupt Disable
    SEC                     ; [38         ] Set Carry Flag
    AND $061400,X           ; [3F 00 14 06] AND A with Absolute Long,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BIT $06,X               ; [34 06      ] Test Bits DP,X
    BVC $2E6C               ; [50 20      ] Branch if Overflow Clear
    ORA #$70                ; [09 70      ] OR A with Immediate
    ROR $0708,X             ; [7E 08 07   ] Rotate Right Absolute,X
    AND $080000,X           ; [3F 00 00 08] AND A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($2E,X)             ; [01 2E      ] OR A with (DP,X)
    AND ($76,X)             ; [21 76      ] AND A with (DP,X)
    RTI                     ; [40         ] Return from Interrupt
    ORA ($09,X)             ; [01 09      ] OR A with (DP,X)
    LDX $DC40,Y             ; [BE 40 DC   ] Load X from Absolute,Y
    BRK                     ; [00 DC      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    JSR ($FE40,X)           ; [FC 40 FE   ] Jump to Subroutine Indirect,X
    RTI                     ; [40         ] Return from Interrupt
    DEC $9630               ; [CE 30 96   ] Decrement Absolute
    SEI                     ; [78         ] Set Interrupt Disable
    SEP #$3C                ; [E2 3C      ] Set Processor Status Bits
    MVP $08,$28             ; [44 08 28   ] Block Move Positive
    JSR $6028               ; [20 28 60   ] Jump to Subroutine
    PHP                     ; [08         ] Push Processor Status
    BVC $2E85               ; [50 0C      ] Branch if Overflow Clear
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

;--- Patch at file offset $142EA0 (SNES $D42EA0) ---
org $D42EA0

    BIT $28,X               ; [34 28      ] Test Bits DP,X
    PLP                     ; [28         ] Pull Processor Status
    JSR $00F0               ; [20 F0 00   ] Jump to Subroutine
    RTI                     ; [40         ] Return from Interrupt
    BRA $2E29               ; [80 80      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E8      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    CPX #$10                ; [E0 10      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRA $2E38               ; [80 80      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $142EC4 (SNES $D42EC4) ---
org $D42EC4

    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    AND $017F00,X           ; [3F 00 7F 01] AND A with Absolute Long,X
    ROR $7E01,X             ; [7E 01 7E   ] Rotate Right Absolute,X
    db $25                      ; Incomplete/data bytes

;--- Patch at file offset $142ED8 (SNES $D42ED8) ---
org $D42ED8

    BRK                     ; [00 00      ] Software interrupt
    AND $24                 ; [25 24      ] AND A with Direct Page
    AND $24                 ; [25 24      ] AND A with Direct Page
    AND $003C,X             ; [3D 3C 00   ] AND A with Absolute,X
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 B0      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    INY                     ; [C8         ] Increment Y
    BMI $2EDD               ; [30 F4      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    JSR ($7A80,X)           ; [FC 80 7A   ] Jump to Subroutine Indirect,X
    CPY $3E                 ; [C4 3E      ] Compare Y with DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CPY #$30                ; [C0 30      ] Compare Y Immediate
    BMI $2F02               ; [30 08      ] Branch if Minus
    DEY                     ; [88         ] Decrement Y
    BPL $2EC5               ; [10 C8      ] Branch if Plus
    TRB $C4                 ; [14 C4      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    AND $387818,X           ; [3F 18 78 38] AND A with Absolute Long,X
    AND $061400,X           ; [3F 00 14 06] AND A with Absolute Long,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BMI $2F0C               ; [30 00      ] Branch if Minus
    ADC #$10                ; [69 10      ] Add with Carry Immediate
    STZ $1860,X             ; [9E 60 18   ] Store Zero to Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    ORA [$3F]               ; [07 3F      ] OR A with [DP]
    BRK                     ; [00 00      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($16,X)             ; [01 16      ] OR A with (DP,X)
    BPL $2F80               ; [10 61      ] Branch if Plus
    RTI                     ; [40         ] Return from Interrupt
    JML $40DC80             ; [5C 80 DC 40] Jump Long
    INC $FE40,X             ; [FE 40 FE   ] Increment Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    DEC $CC00               ; [CE 00 CC   ] Decrement Absolute
    BRK                     ; [00 BA      ] Software interrupt
    BIT $8A,X               ; [34 8A      ] Test Bits DP,X
    TSB $A8                 ; [04 A8      ] Test and Set Bits in DP
    JSR $6028               ; [20 28 60   ] Jump to Subroutine
    TSB $48                 ; [04 48      ] Test and Set Bits in DP
    TSB $48                 ; [04 48      ] Test and Set Bits in DP
    BIT $10                 ; [24 10      ] Test Bits DP
    JSR $7410               ; [20 10 74   ] Jump to Subroutine
    TSB $64                 ; [04 64      ] Test and Set Bits in DP
    TRB $A2                 ; [14 A2      ] Test and Reset Bits DP
    EOR ($E3)               ; [52 E3      ] XOR A with (DP)
    ORA ($32)               ; [12 32      ] OR A with (DP)
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    ORA $11,S               ; [03 11      ] OR A with Stack Relative
    BRK                     ; [00 14      ] Software interrupt
    TSB $1C36               ; [0C 36 1C   ] Test and Set Bits Absolute
    BIT $5E00,X             ; [3C 00 5E   ] Test Bits Absolute,X
    ORA ($1E,X)             ; [01 1E      ] OR A with (DP,X)
    BRK                     ; [00 01      ] Software interrupt
    ORA $0303               ; [0D 03 03   ] OR A with Absolute

;--- Patch at file offset $142F60 (SNES $D42F60) ---
org $D42F60

    CPY $7030               ; [CC 30 70   ] Compare Y with Absolute
    RTI                     ; [40         ] Return from Interrupt
    LDY #$C0                ; [A0 C0      ] Load Y Immediate
    BCC $2EE8               ; [90 80      ] Branch if Carry Clear
    BPL $2F6A               ; [10 00      ] Branch if Plus
    TYA                     ; [98         ] Transfer Y to A
    BMI $2F25               ; [30 B8      ] Branch if Minus
    BVS $2FE7               ; [70 78      ] Branch if Overflow Set
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRA $2F35               ; [80 C0      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    JSR $30C0               ; [20 C0 30   ] Jump to Subroutine
    RTI                     ; [40         ] Return from Interrupt
    RTS                     ; [60         ] Return from Subroutine
    BPL $2F7F               ; [10 00      ] Branch if Plus
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
    BRA $2FBA               ; [80 00      ] Branch Always
    CPX #$00                ; [E0 00      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $142FC8 (SNES $D42FC8) ---
org $D42FC8

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA #$00                ; [09 00      ] OR A with Immediate

;--- Patch at file offset $142FDB (SNES $D42FDB) ---
org $D42FDB

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $142FEA (SNES $D42FEA) ---
org $D42FEA

    CPX #$00                ; [E0 00      ] Compare X Immediate
    CLC                     ; [18         ] Clear Carry Flag
    CPX #$E4                ; [E0 E4      ] Compare X Immediate
    CLC                     ; [18         ] Clear Carry Flag

;--- Patch at file offset $142FFB (SNES $D42FFB) ---
org $D42FFB

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
    MVP $BF,$60             ; [44 BF 60   ] Block Move Positive
    STA $205F70,X           ; [9F 70 5F 20] Store A to Absolute Long,X
    ROL $6E00,X             ; [3E 00 6E   ] Rotate Left Absolute,X
    BRK                     ; [00 EE      ] Software interrupt
    JSR $A07F               ; [20 7F A0   ] Jump to Subroutine
    CLI                     ; [58         ] Clear Interrupt Disable
    TSB $64                 ; [04 64      ] Test and Set Bits in DP
    ASL                     ; [0A         ] Shift Left Accumulator
    STZ $02,X               ; [74 02      ] Store Zero to DP,X
    LDY $82                 ; [A4 82      ] Load Y from DP
    CPY #$C4                ; [C0 C4      ] Compare Y Immediate
    BCC $2FD0               ; [90 94      ] Branch if Carry Clear
    BPL $3072               ; [10 34      ] Branch if Plus
    TSB $2A                 ; [04 2A      ] Test and Set Bits in DP
    AND $0D,X               ; [35 0D      ] AND A with DP,X
    BMI $3044               ; [30 00      ] Branch if Minus
    CLI                     ; [58         ] Clear Interrupt Disable
    JSR $1867               ; [20 67 18   ] Jump to Subroutine
    ROL $04                 ; [26 04      ] Rotate Left DP
    AND [$1C]               ; [27 1C      ] AND A with [DP]
    PHY                     ; [5A         ] Push Y Register
    TSB $007F               ; [0C 7F 00   ] Test and Set Bits Absolute
    COP #$00                ; [02 00      ] Coprocessor interrupt
    ORA $232400             ; [0F 00 24 23] OR A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 15      ] Software interrupt
    ORA #$1C                ; [09 1C      ] OR A with Immediate
    BRK                     ; [00 05      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status

;--- Patch at file offset $143068 (SNES $D43068) ---
org $D43068

    TYA                     ; [98         ] Transfer Y to A

;--- Patch at file offset $143078 (SNES $D43078) ---
org $D43078

    RTI                     ; [40         ] Return from Interrupt
    JSR $20C8               ; [20 C8 20   ] Jump to Subroutine
    CLD                     ; [D8         ] Clear Decimal Flag
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    BRK                     ; [00 78      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    AND $061400,X           ; [3F 00 14 06] AND A with Absolute Long,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BPL $308C               ; [10 00      ] Branch if Plus
    ORA #$00                ; [09 00      ] OR A with Immediate
    ASL $0700               ; [0E 00 07   ] Shift Left Absolute
    AND $080000,X           ; [3F 00 00 08] AND A with Absolute Long,X
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
    SEC                     ; [38         ] Set Carry Flag
    AND $061400,X           ; [3F 00 14 06] AND A with Absolute Long,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA ($1D,X)             ; [01 1D      ] OR A with (DP,X)
    BRK                     ; [00 07      ] Software interrupt
    AND $080000,X           ; [3F 00 00 08] AND A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 05      ] Software interrupt
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    BRK                     ; [00 BE      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    JML [$DC00]             ; [DC 00 DC   ] Jump Long Indirect
    RTI                     ; [40         ] Return from Interrupt
    JSR ($FE40,X)           ; [FC 40 FE   ] Jump to Subroutine Indirect,X
    RTI                     ; [40         ] Return from Interrupt
    INC $3E00,X             ; [FE 00 3E   ] Increment Absolute,X
    CPY #$5C                ; [C0 5C      ] Compare Y Immediate
    CPX #$44                ; [E0 44      ] Compare X Immediate
    PHP                     ; [08         ] Push Processor Status
    PLP                     ; [28         ] Pull Processor Status
    JSR $6028               ; [20 28 60   ] Jump to Subroutine
    PHP                     ; [08         ] Push Processor Status
    BVC $3101               ; [50 08      ] Branch if Overflow Clear
    MVN $18,$24             ; [54 18 24   ] Block Move Negative
    CLD                     ; [D8         ] Clear Decimal Flag
    CPY $E0                 ; [C4 E0      ] Compare Y with DP
    PLP                     ; [28         ] Pull Processor Status
    BIT $04                 ; [24 04      ] Test Bits DP
    AND $04                 ; [25 04      ] AND A with Direct Page
    ORA $0B1701,X           ; [1F 01 17 0B] OR A with Absolute Long,X
    JSL $386A10             ; [22 10 6A 38] Jump to Subroutine Long
    AND $0808,X             ; [3D 08 08   ] AND A with Absolute,X
    BRK                     ; [00 1E      ] Software interrupt
    ORA ($14,X)             ; [01 14      ] OR A with (DP,X)
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    PHD                     ; [0B         ] Push Direct Page Register
    PHP                     ; [08         ] Push Processor Status
    ORA $1900,X             ; [1D 00 19   ] OR A with Absolute,X
    BIT $08                 ; [24 08      ] Test Bits DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 98      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BEQ $3124               ; [F0 00      ] Branch if Equal
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
    BRA $313A               ; [80 00      ] Branch Always
    CPX #$00                ; [E0 00      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    BRA $313F               ; [80 00      ] Branch Always
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
    BPL $3125               ; [10 C8      ] Branch if Plus
    TRB $E4                 ; [14 E4      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    LDX $FC40,Y             ; [BE 40 FC   ] Load X from Absolute,Y
    BRK                     ; [00 E4      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CPX $40                 ; [E4 40      ] Compare X with DP
    DEC $8E18,X             ; [DE 18 8E   ] Decrement Absolute,X
    BRK                     ; [00 0E      ] Software interrupt
    BRK                     ; [00 94      ] Software interrupt
    PLA                     ; [68         ] Pull Accumulator
    MVP $08,$00             ; [44 08 00   ] Block Move Positive
    BRK                     ; [00 10      ] Software interrupt
    PHA                     ; [48         ] Push Accumulator
    CLC                     ; [18         ] Clear Carry Flag
    RTI                     ; [40         ] Return from Interrupt
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 64      ] Software interrupt
    BPL $315D               ; [10 E0      ] Branch if Plus
    TRB $68                 ; [14 68      ] Test and Reset Bits DP
    BRK                     ; [00 99      ] Software interrupt
    BRK                     ; [00 9C      ] Software interrupt
    TSB $076B               ; [0C 6B 07   ] Test and Set Bits Absolute
    ORA [$0B],Y             ; [17 0B      ] OR A with [DP],Y
    JSL $386A10             ; [22 10 6A 38] Jump to Subroutine Long
    db $3D                      ; Incomplete/data bytes

;--- Patch at file offset $143195 (SNES $D43195) ---
org $D43195

    TSB $0B                 ; [04 0B      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    ORA $1900,X             ; [1D 00 19   ] OR A with Absolute,X
    BIT $08                 ; [24 08      ] Test Bits DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 14      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    PLP                     ; [28         ] Pull Processor Status
    JSR $00F0               ; [20 F0 00   ] Jump to Subroutine
    LDY #$40                ; [A0 40      ] Load Y Immediate
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 70      ] Software interrupt
    CPX #$A0                ; [E0 A0      ] Compare X Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRK                     ; [00 E8      ] Software interrupt
    INX                     ; [E8         ] Increment X
    CPX #$D0                ; [E0 D0      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRA $31BA               ; [80 00      ] Branch Always
    CPX #$00                ; [E0 00      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $1431C4 (SNES $D431C4) ---
org $D431C4

    AND [$00]               ; [27 00      ] AND A with [DP]
    ADC $017E01,X           ; [7F 01 7E 01] Add with Carry Absolute Long,X
    ROR $3F25,X             ; [7E 25 3F   ] Rotate Right Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    SEI                     ; [78         ] Set Interrupt Disable
    SEC                     ; [38         ] Set Carry Flag

;--- Patch at file offset $1431D6 (SNES $D431D6) ---
org $D431D6

    AND $24                 ; [25 24      ] AND A with Direct Page
    AND $24                 ; [25 24      ] AND A with Direct Page
    AND $183C,X             ; [3D 3C 18   ] AND A with Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    ORA [$3F]               ; [07 3F      ] OR A with [DP]
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
    BPL $31C3               ; [10 C8      ] Branch if Plus
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
    BPL $321E               ; [10 01      ] Branch if Plus
    ORA ($0F),Y             ; [11 0F      ] OR A with (DP),Y
    ORA $CE00FE             ; [0F FE 00 CE] OR A with Absolute Long
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BMI $31C7               ; [30 9E      ] Branch if Minus
    BRK                     ; [00 1E      ] Software interrupt
    BRK                     ; [00 14      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    PLP                     ; [28         ] Pull Processor Status
    BVC $3235               ; [50 04      ] Branch if Overflow Clear
    BRK                     ; [00 24      ] Software interrupt
    BPL $3259               ; [10 24      ] Branch if Plus
    BPL $326B               ; [10 34      ] Branch if Plus
    BRK                     ; [00 44      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    CPY #$24                ; [C0 24      ] Compare Y Immediate
    INY                     ; [C8         ] Increment Y
    JSR $80D0               ; [20 D0 80   ] Jump to Subroutine
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
    BRA $32A5               ; [80 40      ] Branch Always
    BRA $31E7               ; [80 80      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRA $31F3               ; [80 80      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRA $3277               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 09      ] Software interrupt
    ASL $17                 ; [06 17      ] Shift Left DP
    PHP                     ; [08         ] Push Processor Status
    ORA $011F00,X           ; [1F 00 1F 01] OR A with Absolute Long,X
    ROL $3C13               ; [2E 13 3C   ] Rotate Left Absolute
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
    BRA $32A4               ; [80 00      ] Branch Always
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    SBC ($40)               ; [F2 40      ] Subtract with Borrow (DP)
    AND $C07FC0,X           ; [3F C0 7F C0] AND A with Absolute Long,X
    ADC $0000D2,X           ; [7F D2 00 00] Add with Carry Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRA $32B6               ; [80 00      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 D2      ] Software interrupt
    ORA ($D2)               ; [12 D2      ] OR A with (DP)
    ORA ($DE)               ; [12 DE      ] OR A with (DP)
    ASL $073F,X             ; [1E 3F 07   ] Shift Left Absolute,X
    EOR $007920,X           ; [5F 20 79 00] XOR A with Absolute Long,X
    ADC $2608,Y             ; [79 08 26   ] Add with Carry Absolute,Y
    TSB $23                 ; [04 23      ] Test and Set Bits in DP
    BRK                     ; [00 17      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA [$00],Y             ; [17 00      ] OR A with [DP],Y
    BMI $32F9               ; [30 24      ] Branch if Minus
    COP #$0E                ; [02 0E      ] Coprocessor interrupt
    BRK                     ; [00 1D      ] Software interrupt
    ORA ($18,X)             ; [01 18      ] OR A with (DP,X)
    TSB $01                 ; [04 01      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 03      ] Software interrupt
    ASL $F90C,X             ; [1E 0C F9   ] Shift Left Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    CMP $80E480,X           ; [DF 80 E4 80] Compare A with Absolute Long,X
    PEI ($80)               ; [D4 80      ] Push Effective Indirect
    CPY $80                 ; [C4 80      ] Compare Y with DP
    CPY $F200               ; [CC 00 F2   ] Compare Y with Absolute
    CPY $ECEC               ; [CC EC EC   ] Compare Y with Absolute
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
    BMI $3345               ; [30 3A      ] Branch if Minus
    ORA ($03,X)             ; [01 03      ] OR A with (DP,X)
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    BRK                     ; [00 02      ] Software interrupt
    ORA ($0F,X)             ; [01 0F      ] OR A with (DP,X)
    TSB $011F               ; [0C 1F 01   ] Test and Set Bits Absolute
    AND ($0A,S),Y           ; [33 0A      ] AND A with (SR),Y
    BPL $3342               ; [10 28      ] Branch if Plus
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    AND $3506,Y             ; [39 06 35   ] AND A with Absolute,Y
    ORA ($CB)               ; [12 CB      ] OR A with (DP)
    INY                     ; [C8         ] Increment Y
    STY $1888               ; [8C 88 18   ] Store Y to Absolute
    BRK                     ; [00 A0      ] Software interrupt
    BRA $32ED               ; [80 C0      ] Branch Always
    BRA $32AF               ; [80 80      ] Branch Always
    BRK                     ; [00 E6      ] Software interrupt
    REP #$DA                ; [C2 DA      ] Reset Processor Status Bits
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
    TSB $A8                 ; [04 A8      ] Test and Set Bits in DP
    BVC $3319               ; [50 E0      ] Branch if Overflow Clear
    BRK                     ; [00 80      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $143344 (SNES $D43344) ---
org $D43344

    BRK                     ; [00 00      ] Software interrupt
    ORA #$00                ; [09 00      ] OR A with Immediate
    ORA $001F00,X           ; [1F 00 1F 00] OR A with Absolute Long,X
    ORA $063F09,X           ; [1F 09 3F 06] OR A with Absolute Long,X

;--- Patch at file offset $143356 (SNES $D43356) ---
org $D43356

    BRK                     ; [00 00      ] Software interrupt
    ORA #$09                ; [09 09      ] OR A with Immediate
    ORA #$09                ; [09 09      ] OR A with Immediate
    ORA $06060F             ; [0F 0F 06 06] OR A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 90      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    INX                     ; [E8         ] Increment X
    BPL $335F               ; [10 F4      ] Branch if Plus
    PHA                     ; [48         ] Push Accumulator
    TSX                     ; [BA         ] Transfer Stack Pointer to X
    MVP $BE,$60             ; [44 BE 60   ] Block Move Positive
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    JSR $5010               ; [20 10 50   ] Jump to Subroutine
    PHP                     ; [08         ] Push Processor Status
    PHA                     ; [48         ] Push Accumulator
    TRB $64                 ; [14 64      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    ROL $3F1E,X             ; [3E 1E 3F   ] Rotate Left Absolute,X
    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 19      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 4B      ] Software interrupt
    BMI $332B               ; [30 9C      ] Branch if Minus
    RTS                     ; [60         ] Return from Subroutine
    ORA ($1F,X)             ; [01 1F      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA [$0E]               ; [07 0E      ] OR A with [DP]
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 34      ] Software interrupt
    JSR $4162               ; [20 62 41   ] Jump to Subroutine
    ROL $DC40,X             ; [3E 40 DC   ] Rotate Left Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    JSR ($FE40,X)           ; [FC 40 FE   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 96      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    TXS                     ; [9A         ] Transfer X to Stack Pointer
    TSB $EE                 ; [04 EE      ] Test and Set Bits in DP
    RTS                     ; [60         ] Return from Subroutine
    CPY $88                 ; [C4 88      ] Compare Y with DP
    PLP                     ; [28         ] Pull Processor Status
    JSR $5008               ; [20 08 50   ] Jump to Subroutine
    PHP                     ; [08         ] Push Processor Status
    BVC $33BD               ; [50 04      ] Branch if Overflow Clear
    BRK                     ; [00 68      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    MVP $24,$70             ; [44 24 70   ] Block Move Positive
    BRK                     ; [00 3E      ] Software interrupt
    ASL $003F,X             ; [1E 3F 00   ] Shift Left Absolute,X
    BPL $33C6               ; [10 00      ] Branch if Plus
    BPL $33C8               ; [10 00      ] Branch if Plus
    ORA $3000,Y             ; [19 00 30   ] OR A with Absolute,Y
    BRK                     ; [00 4B      ] Software interrupt
    BMI $336B               ; [30 9C      ] Branch if Minus
    RTS                     ; [60         ] Return from Subroutine
    ORA ($1F,X)             ; [01 1F      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA [$0E]               ; [07 0E      ] OR A with [DP]
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 34      ] Software interrupt
    JSR $4162               ; [20 62 41   ] Jump to Subroutine
    ROL $DC40,X             ; [3E 40 DC   ] Rotate Left Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    JSR ($FE40,X)           ; [FC 40 FE   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 96      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    TXS                     ; [9A         ] Transfer X to Stack Pointer
    TSB $EE                 ; [04 EE      ] Test and Set Bits in DP
    RTS                     ; [60         ] Return from Subroutine
    CPY $88                 ; [C4 88      ] Compare Y with DP
    PLP                     ; [28         ] Pull Processor Status
    JSR $5008               ; [20 08 50   ] Jump to Subroutine
    PHP                     ; [08         ] Push Processor Status
    BVC $33FD               ; [50 04      ] Branch if Overflow Clear
    BRK                     ; [00 68      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    MVP $24,$70             ; [44 24 70   ] Block Move Positive
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
    EOR $004F00             ; [4F 00 4F 00] XOR A with Absolute Long
    AND $000F00,X           ; [3F 00 0F 00] AND A with Absolute Long,X
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    ORA $03                 ; [05 03      ] OR A with Direct Page
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ROL $06,X               ; [36 06      ] Rotate Left DP,X
    ROL $16                 ; [26 16      ] Rotate Left DP
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    COP #$01                ; [02 01      ] Coprocessor interrupt
    BRK                     ; [00 00      ] Software interrupt
    BIT $2C18               ; [2C 18 2C   ] Test Bits Absolute
    CLC                     ; [18         ] Clear Carry Flag
    JSR ($7E30,X)           ; [FC 30 7E   ] Jump to Subroutine Indirect,X
    CPY $2E                 ; [C4 2E      ] Compare Y with DP
    CPY $FE                 ; [C4 FE      ] Compare Y with DP
    LDY $D8FC               ; [AC FC D8   ] Load Y from Absolute
    CLD                     ; [D8         ] Clear Decimal Flag
    BRK                     ; [00 D0      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BNE $34BC               ; [D0 08      ] Branch if Not Equal
    JSR $8010               ; [20 10 80   ] Jump to Subroutine
    MVP $C4,$C0             ; [44 C4 C0   ] Block Move Positive
    TSB $A8                 ; [04 A8      ] Test and Set Bits in DP
    CLD                     ; [D8         ] Clear Decimal Flag
    BRK                     ; [00 00      ] Software interrupt
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
    ORA $17,S               ; [03 17      ] OR A with Stack Relative
    ORA $31000F             ; [0F 0F 00 31] OR A with Absolute Long
    ORA #$13                ; [09 13      ] OR A with Immediate
    PLD                     ; [2B         ] Pull Direct Page Register
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA #$09                ; [09 09      ] OR A with Immediate
    ORA [$00]               ; [07 00      ] OR A with [DP]
    COP #$01                ; [02 01      ] Coprocessor interrupt
    PHD                     ; [0B         ] Push Direct Page Register
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    BRK                     ; [00 CC      ] Software interrupt
    BVS $3561               ; [70 FE      ] Branch if Overflow Set
    PEA $64FE               ; [F4 FE 64   ] Push Effective Absolute
    INC $FE84,X             ; [FE 84 FE   ] Increment Absolute,X
    LDY $BC,X               ; [B4 BC      ] Load Y from DP,X
    CLC                     ; [18         ] Clear Carry Flag
    CLV                     ; [B8         ] Clear Overflow Flag
    BRA $352F               ; [80 C0      ] Branch Always
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    STY $04,X               ; [94 04      ] Store Y to DP,X
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 84      ] Software interrupt
    BIT $90                 ; [24 90      ] Test Bits DP
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 4F      ] Software interrupt
    BRK                     ; [00 4F      ] Software interrupt
    BRK                     ; [00 3F      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 27      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    AND [$16],Y             ; [37 16      ] AND A with [DP],Y
    ASL $0C00,X             ; [1E 00 0C   ] Shift Left Absolute,X
    BRK                     ; [00 36      ] Software interrupt
    ASL $26                 ; [06 26      ] Shift Left DP
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
    PEA $6CFE               ; [F4 FE 6C   ] Push Effective Absolute
    JSR ($D8D8,X)           ; [FC D8 D8   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 D0      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BNE $35BC               ; [D0 08      ] Branch if Not Equal
    JSR $4010               ; [20 10 40   ] Jump to Subroutine
    STY $94                 ; [84 94      ] Store Y to DP
    RTS                     ; [60         ] Return from Subroutine
    BIT $48                 ; [24 48      ] Test Bits DP
    TYA                     ; [98         ] Transfer Y to A
    RTI                     ; [40         ] Return from Interrupt

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
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 27      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    AND [$16],Y             ; [37 16      ] AND A with [DP],Y
    ASL $0C00,X             ; [1E 00 0C   ] Shift Left Absolute,X
    BRK                     ; [00 06      ] Software interrupt
    ASL $06                 ; [06 06      ] Shift Left DP
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
    BEQ $3765               ; [F0 7A      ] Branch if Equal
    CPX #$E7                ; [E0 E7      ] Compare X Immediate
    BRL $F957               ; [82 67 C2   ] Branch Long
    SED                     ; [F8         ] Set Decimal Flag
    BVC $376F               ; [50 7C      ] Branch if Overflow Clear
    PLP                     ; [28         ] Pull Processor Status
    JMP ($7028,X)           ; [7C 28 70   ] Jump Indirect,X
    BIT $50E0               ; [2C E0 50   ] Test Bits Absolute
    CPY #$20                ; [C0 20      ] Compare Y Immediate
    BRK                     ; [00 82      ] Software interrupt
    BRL $5B41               ; [82 40 24   ] Branch Long
    ORA $27,S               ; [03 27      ] OR A with Stack Relative
    ORA $1F,S               ; [03 1F      ] OR A with Stack Relative
    ASL $1F                 ; [06 1F      ] Shift Left DP
    BRK                     ; [00 27      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    AND [$16],Y             ; [37 16      ] AND A with [DP],Y
    ASL $0C00,X             ; [1E 00 0C   ] Shift Left Absolute,X
    BRK                     ; [00 1B      ] Software interrupt
    BRK                     ; [00 1B      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ASL $04                 ; [06 04      ] Shift Left DP
    TSB $1B                 ; [04 1B      ] Test and Set Bits in DP
    ORA ($0C,S),Y           ; [13 0C      ] OR A with (SR),Y
    INC                     ; [1A         ] Increment Accumulator
    TSB $000C               ; [0C 0C 00   ] Test and Set Bits Absolute
    BRK                     ; [00 AE      ] Software interrupt
    CPY $FE                 ; [C4 FE      ] Compare Y with DP
    STZ $40F8               ; [9C F8 40   ] Store Zero to Absolute
    LDY #$E0                ; [A0 E0      ] Load Y Immediate
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    BEQ $378C               ; [F0 60      ] Branch if Equal
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY $40                 ; [C4 40      ] Compare Y with DP
    TYA                     ; [98         ] Transfer Y to A
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    RTI                     ; [40         ] Return from Interrupt
    CPY #$20                ; [C0 20      ] Compare Y Immediate
    LDY #$40                ; [A0 40      ] Load Y Immediate
    JSR $C040               ; [20 40 C0   ] Jump to Subroutine
    BRK                     ; [00 00      ] Software interrupt
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
    EOR $004F00             ; [4F 00 4F 00] XOR A with Absolute Long
    AND $001F00,X           ; [3F 00 1F 00] AND A with Absolute Long,X
    AND [$08]               ; [27 08      ] AND A with [DP]
    AND [$16],Y             ; [37 16      ] AND A with [DP],Y
    ASL $0C00,X             ; [1E 00 0C   ] Shift Left Absolute,X
    BRK                     ; [00 37      ] Software interrupt
    ORA [$27]               ; [07 27      ] OR A with [DP]
    ORA [$07],Y             ; [17 07      ] OR A with [DP],Y
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA [$1B]               ; [07 1B      ] OR A with [DP]
    ORA ($0C,S),Y           ; [13 0C      ] OR A with (SR),Y
    INC                     ; [1A         ] Increment Accumulator
    TSB $000C               ; [0C 0C 00   ] Test and Set Bits Absolute
    BRK                     ; [00 FC      ] Software interrupt
    INX                     ; [E8         ] Increment X
    JSR ($FE88,X)           ; [FC 88 FE   ] Jump to Subroutine Indirect,X
    CPY $E4AE               ; [CC AE E4   ] Compare Y with Absolute
    CPX $F0E0               ; [EC E0 F0   ] Compare X with Absolute
    RTS                     ; [60         ] Return from Subroutine
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    PHA                     ; [48         ] Push Accumulator
    LDY #$08                ; [A0 08      ] Load Y Immediate
    BRA $3735               ; [80 80      ] Branch Always
    JMP $24C0               ; [4C C0 24   ] Jump Absolute
    LDY #$40                ; [A0 40      ] Load Y Immediate
    JSR $C040               ; [20 40 C0   ] Jump to Subroutine
    BRK                     ; [00 00      ] Software interrupt
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
    ORA $12180F,X           ; [1F 0F 18 12] OR A with Absolute Long,X
    PLP                     ; [28         ] Pull Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    AND ($08,X)             ; [21 08      ] AND A with (DP,X)
    ORA ($36,X)             ; [01 36      ] OR A with (DP,X)
    ORA ($18,X)             ; [01 18      ] OR A with (DP,X)
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    MVP $CE,$04             ; [44 CE 04   ] Block Move Positive
    CPY $BC00               ; [CC 00 BC   ] Compare Y with Absolute
    PHA                     ; [48         ] Push Accumulator
    JML [$B478]             ; [DC 78 B4   ] Jump Long Indirect
    SED                     ; [F8         ] Set Decimal Flag
    PHP                     ; [08         ] Push Processor Status
    BEQ $381F               ; [F0 F0      ] Branch if Equal
    CPX #$44                ; [E0 44      ] Compare X Immediate
    BRK                     ; [00 34      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BPL $387F               ; [10 48      ] Branch if Plus
    BRK                     ; [00 30      ] Software interrupt
    PHA                     ; [48         ] Push Accumulator
    PLA                     ; [68         ] Pull Accumulator
    TYA                     ; [98         ] Transfer Y to A
    BEQ $38AE               ; [F0 70      ] Branch if Equal
    BRA $38A0               ; [80 60      ] Branch Always
    ORA $000F00             ; [0F 00 0F 00] OR A with Absolute Long
    ORA $000700             ; [0F 00 07 00] OR A with Absolute Long
    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    ORA $03                 ; [05 03      ] OR A with Direct Page
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    BRK                     ; [00 01      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    COP #$01                ; [02 01      ] Coprocessor interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPX #$80                ; [E0 80      ] Compare X Immediate
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    RTS                     ; [60         ] Return from Subroutine
    CPY #$E4                ; [C0 E4      ] Compare Y Immediate
    BRK                     ; [00 EE      ] Software interrupt
    LDY $FE                 ; [A4 FE      ] Load Y from DP
    BIT $BC                 ; [24 BC      ] Test Bits DP
    CLC                     ; [18         ] Clear Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    BRA $38B3               ; [80 40      ] Branch Always
    BRA $37F5               ; [80 80      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $389E               ; [80 24      ] Branch Always
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
    SEC                     ; [38         ] Set Carry Flag
    LDY #$7C                ; [A0 7C      ] Load Y Immediate
    INX                     ; [E8         ] Increment X
    DEC $8B3C,X             ; [DE 3C 8B   ] Decrement Absolute,X
    JSR ($0000,X)           ; [FC 00 00   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 00      ] Software interrupt
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
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

    EOR $046F08,X           ; [5F 08 6F 04] XOR A with Absolute Long,X
    ROR $7F14,X             ; [7E 14 7F   ] Rotate Right Absolute,X
    BIT $3F                 ; [24 3F      ] Test Bits DP
    BRK                     ; [00 13      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 2B      ] Software interrupt
    AND $36,S               ; [23 36      ] AND A with Stack Relative
    AND ($21)               ; [32 21      ] AND A with (DP)
    AND $35,X               ; [35 35      ] AND A with DP,X
    ORA ($11),Y             ; [11 11      ] OR A with (DP),Y
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $143936 (SNES $D43936) ---
org $D43936

    BCS $3902               ; [B0 CA      ] Branch if Carry Set
    CPY $B2                 ; [C4 B2      ] Compare Y with DP

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
    BMI $3979               ; [30 CA      ] Branch if Minus
    STZ $F8,X               ; [74 F8      ] Store Zero to DP,X
    BVC $3A2F               ; [50 7C      ] Branch if Overflow Clear
    PLP                     ; [28         ] Pull Processor Status
    JMP ($7028,X)           ; [7C 28 70   ] Jump Indirect,X
    BIT $1060               ; [2C 60 10   ] Test Bits Absolute
    BRA $39BC               ; [80 00      ] Branch Always
    BMI $39BE               ; [30 00      ] Branch if Minus
    STZ $04,X               ; [74 04      ] Store Zero to DP,X
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
    BRA $3A24               ; [80 00      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRA $3A27               ; [80 FC      ] Branch Always
    BRK                     ; [00 FA      ] Software interrupt
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRA $3A37               ; [80 00      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    JSR $5800               ; [20 00 58   ] Jump to Subroutine
    PHP                     ; [08         ] Push Processor Status
    MVN $04,$E8             ; [54 04 E8   ] Block Move Negative
    EOR $002C24,X           ; [5F 24 2C 00] XOR A with Absolute Long,X
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BPL $3A4C               ; [10 00      ] Branch if Plus
    ORA #$00                ; [09 00      ] OR A with Immediate
    ROL $09,X               ; [36 09      ] Rotate Left DP,X
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
    BRK                     ; [00 BC      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $3A7D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $3AD5               ; [90 5C      ] Branch if Carry Clear
    BRA $3A87               ; [80 0C      ] Branch Always
    BCS $3A85               ; [B0 08      ] Branch if Carry Set
    TSB $60                 ; [04 60      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    EOR #$06                ; [49 06      ] XOR A with Immediate
    EOR #$06                ; [49 06      ] XOR A with Immediate
    AND $0907,Y             ; [39 07 09   ] AND A with Absolute,Y
    ORA [$04]               ; [07 04      ] OR A with [DP]
    BRK                     ; [00 06      ] Software interrupt
    ORA $06,S               ; [03 06      ] OR A with Stack Relative
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    BRK                     ; [00 36      ] Software interrupt
    BRK                     ; [00 22      ] Software interrupt
    ASL $07,X               ; [16 07      ] Shift Left DP,X
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    ORA $03,S               ; [03 03      ] OR A with Stack Relative
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 38      ] Software interrupt
    BMI $3ACB               ; [30 28      ] Branch if Minus
    JSR $00F0               ; [20 F0 00   ] Jump to Subroutine
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    BRA $3AAA               ; [80 00      ] Branch Always
    BRA $3AAC               ; [80 00      ] Branch Always
    BRA $3AAE               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BNE $3AD2               ; [D0 20      ] Branch if Not Equal
    CPY #$30                ; [C0 30      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRA $3AB8               ; [80 00      ] Branch Always
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
    BRA $3AE4               ; [80 00      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRA $3AE7               ; [80 FC      ] Branch Always
    BRK                     ; [00 FA      ] Software interrupt
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRA $3AF7               ; [80 00      ] Branch Always
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
    BVS $3AF5               ; [70 C4      ] Branch if Overflow Set
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $3B3D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $3B45               ; [90 0C      ] Branch if Carry Clear
    BPL $3BA7               ; [10 6C      ] Branch if Plus
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
    BPL $3BD3               ; [10 70      ] Branch if Plus
    BRA $3B55               ; [80 F0      ] Branch Always
    CPX #$38                ; [E0 38      ] Compare X Immediate
    BEQ $3B71               ; [F0 08      ] Branch if Equal
    BRK                     ; [00 88      ] Software interrupt
    BMI $3BDD               ; [30 70      ] Branch if Minus
    CLC                     ; [18         ] Clear Carry Flag
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 50      ] Software interrupt
    JSR $8080               ; [20 80 80   ] Jump to Subroutine
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BEQ $3B78               ; [F0 00      ] Branch if Equal
    RTI                     ; [40         ] Return from Interrupt
    BCS $3BEB               ; [B0 70      ] Branch if Carry Set
    BMI $3BA5               ; [30 28      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    EOR #$06                ; [49 06      ] XOR A with Immediate
    EOR #$06                ; [49 06      ] XOR A with Immediate
    AND $1107,Y             ; [39 07 11   ] AND A with Absolute,Y
    ORA $22,S               ; [03 22      ] OR A with Stack Relative
    BRK                     ; [00 73      ] Software interrupt
    TRB $1824               ; [1C 24 18   ] Test and Reset Bits Absolute
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 36      ] Software interrupt
    BRK                     ; [00 22      ] Software interrupt
    ASL $07,X               ; [16 07      ] Shift Left DP,X
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    ORA $2C                 ; [05 2C      ] OR A with Direct Page
    BIT $1818,X             ; [3C 18 18   ] Test Bits Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    BMI $3BCB               ; [30 28      ] Branch if Minus
    JSR $00F0               ; [20 F0 00   ] Jump to Subroutine
    CPX #$C0                ; [E0 C0      ] Compare X Immediate

;--- Patch at file offset $143BB0 (SNES $D43BB0) ---
org $D43BB0

    BNE $3BD2               ; [D0 20      ] Branch if Not Equal
    CPY #$30                ; [C0 30      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $143BC4 (SNES $D43BC4) ---
org $D43BC4

    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    COP #$01                ; [02 01      ] Coprocessor interrupt
    COP #$01                ; [02 01      ] Coprocessor interrupt
    ASL $00                 ; [06 00      ] Shift Left DP
    ORA #$06                ; [09 06      ] OR A with Immediate

;--- Patch at file offset $143BD6 (SNES $D43BD6) ---
org $D43BD6

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    ASL $00                 ; [06 00      ] Shift Left DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 6C      ] Software interrupt
    BPL $3C65               ; [10 76      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $143BF8 (SNES $D43BF8) ---
org $D43BF8

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    BRA $3BB6               ; [80 B8      ] Branch Always
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
    BRA $3C22               ; [80 FF      ] Branch Always
    BRA $3BF3               ; [80 CE      ] Branch Always
    db $30                      ; Incomplete/data bytes

;--- Patch at file offset $143C2E (SNES $D43C2E) ---
org $D43C2E

    AND $008E80             ; [2F 80 8E 00] AND A with Absolute Long
    LDY $1A                 ; [A4 1A      ] Load Y from DP
    TSB $70                 ; [04 70      ] Test and Set Bits in DP
    BIT $40,X               ; [34 40      ] Test Bits DP,X
    TSB $F0                 ; [04 F0      ] Test and Set Bits in DP
    TSB $F2                 ; [04 F2      ] Test and Set Bits in DP
    ASL $30                 ; [06 30      ] Shift Left DP
    ASL $60,X               ; [16 60      ] Shift Left DP,X
    EOR $2D,X               ; [55 2D      ] XOR A with DP,X
    BMI $3C44               ; [30 00      ] Branch if Minus
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 19      ] Software interrupt
    ORA $17,S               ; [03 17      ] OR A with Stack Relative
    TSB $1D                 ; [04 1D      ] Test and Set Bits in DP
    ASL $0F                 ; [06 0F      ] Shift Left DP
    BRK                     ; [00 22      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 06      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    TSB $0A                 ; [04 0A      ] Test and Set Bits in DP
    ASL $0000               ; [0E 00 00   ] Shift Left Absolute
    ORA $001E80             ; [0F 80 1E 00] OR A with Absolute Long
    JMP ($9C08,X)           ; [7C 08 9C   ] Jump Indirect,X
    CLC                     ; [18         ] Clear Carry Flag
    PEI ($10)               ; [D4 10      ] Push Effective Indirect
    LDY $00,X               ; [B4 00      ] Load Y from DP,X
    INY                     ; [C8         ] Increment Y
    BMI $3CDF               ; [30 70      ] Branch if Minus
    BRK                     ; [00 14      ] Software interrupt
    PER $2074               ; [62 00 E4   ] Push Effective Relative
    PHP                     ; [08         ] Push Processor Status
    BRA $3CDF               ; [80 68      ] Branch Always
    BPL $3C81               ; [10 08      ] Branch if Plus
    BMI $3C7B               ; [30 00      ] Branch if Minus
    PHA                     ; [48         ] Push Accumulator
    BVS $3CEE               ; [70 70      ] Branch if Overflow Set
    BRK                     ; [00 00      ] Software interrupt
    EOR $002C24,X           ; [5F 24 2C 00] XOR A with Absolute Long,X
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BPL $3C8C               ; [10 00      ] Branch if Plus
    ORA #$00                ; [09 00      ] OR A with Immediate
    ASL $0401               ; [0E 01 04   ] Shift Left Absolute
    AND ($02),Y             ; [31 02      ] AND A with (DP),Y
    ORA ($08),Y             ; [11 08      ] OR A with (DP),Y
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 09      ] Software interrupt
    ASL $09                 ; [06 09      ] Shift Left DP
    ASL $09                 ; [06 09      ] Shift Left DP
    ORA [$11]               ; [07 11      ] OR A with [DP]
    ORA $22,S               ; [03 22      ] OR A with Stack Relative
    BRK                     ; [00 73      ] Software interrupt
    TRB $1824               ; [1C 24 18   ] Test and Reset Bits Absolute
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 06      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    ASL $07                 ; [06 07      ] Shift Left DP
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    ORA $2C                 ; [05 2C      ] OR A with Direct Page
    BIT $1818,X             ; [3C 18 18   ] Test Bits Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    EOR $002C24,X           ; [5F 24 2C 00] XOR A with Absolute Long,X
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BPL $3CCC               ; [10 00      ] Branch if Plus
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
    BRK                     ; [00 BC      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $3CFD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $3D45               ; [90 4C      ] Branch if Carry Clear
    BCC $3D17               ; [90 1C      ] Branch if Carry Clear
    LDY #$08                ; [A0 08      ] Load Y Immediate
    TRB $60                 ; [14 60      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    BIT $04                 ; [24 04      ] Test Bits DP
    BIT $04                 ; [24 04      ] Test Bits DP
    ORA $030B00,X           ; [1F 00 0B 03] OR A with Absolute Long,X
    ORA ($08),Y             ; [11 08      ] OR A with (DP),Y
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    TSB $0C1A               ; [0C 1A 0C   ] Test and Set Bits Absolute
    TSB $1B00               ; [0C 00 1B   ] Test and Set Bits Absolute
    TSB $1A                 ; [04 1A      ] Test and Set Bits in DP
    ORA $00                 ; [05 00      ] OR A with Direct Page
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    ASL                     ; [0A         ] Shift Left Accumulator
    TRB $1C                 ; [14 1C      ] Test and Reset Bits DP
    TSB $0C                 ; [04 0C      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    CPX #$60                ; [E0 60      ] Compare X Immediate
    BRK                     ; [00 E0      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $143D30 (SNES $D43D30) ---
org $D43D30

    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRK                     ; [00 80      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    db $E0                      ; Incomplete/data bytes

;--- Patch at file offset $143D40 (SNES $D43D40) ---
org $D43D40

    BRK                     ; [00 00      ] Software interrupt
    BRA $3D44               ; [80 00      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRA $3D47               ; [80 FC      ] Branch Always
    BRK                     ; [00 FA      ] Software interrupt
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRA $3D57               ; [80 00      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    JSR $5800               ; [20 00 58   ] Jump to Subroutine
    PHP                     ; [08         ] Push Processor Status
    MVN $04,$E8             ; [54 04 E8   ] Block Move Negative
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 E4      ] Software interrupt
    BRK                     ; [00 E4      ] Software interrupt
    JSR $307E               ; [20 7E 30   ] Jump to Subroutine
    STX $0E00               ; [8E 00 0E   ] Store X to Absolute
    BRA $3D0B               ; [80 9C      ] Branch Always
    BRA $3D35               ; [80 C4      ] Branch Always
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine
    BRA $3D8D               ; [80 18      ] Branch Always
    CPY #$18                ; [C0 18      ] Compare Y Immediate
    LDY #$00                ; [A0 00      ] Load Y Immediate
    BCS $3DDF               ; [B0 64      ] Branch if Carry Set
    BPL $3D5D               ; [10 E0      ] Branch if Plus
    TRB $C0                 ; [14 C0      ] Test and Reset Bits DP
    PLP                     ; [28         ] Pull Processor Status
    EOR #$07                ; [49 07      ] XOR A with Immediate
    PHA                     ; [48         ] Push Accumulator
    ORA [$39]               ; [07 39      ] OR A with [DP]
    ORA [$11]               ; [07 11      ] OR A with [DP]
    ORA $22,S               ; [03 22      ] OR A with Stack Relative
    BRK                     ; [00 73      ] Software interrupt
    TRB $1824               ; [1C 24 18   ] Test and Reset Bits Absolute
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 37      ] Software interrupt
    BRK                     ; [00 23      ] Software interrupt
    ORA [$07],Y             ; [17 07      ] OR A with [DP],Y
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    ORA $2C                 ; [05 2C      ] OR A with Direct Page
    BIT $1818,X             ; [3C 18 18   ] Test Bits Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    CPY #$30                ; [C0 30      ] Compare Y Immediate
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $143DB0 (SNES $D43DB0) ---
org $D43DB0

    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $143DC0 (SNES $D43DC0) ---
org $D43DC0

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
    BRA $3DE2               ; [80 00      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRA $3DE5               ; [80 FC      ] Branch Always
    BRK                     ; [00 FA      ] Software interrupt
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$FE                ; [C0 FE      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRA $3DF5               ; [80 00      ] Branch Always
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
    BPL $3E1E               ; [10 01      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    ORA [$00]               ; [07 00      ] OR A with [DP]
    INC $CE00,X             ; [FE 00 CE   ] Increment Absolute,X
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    BMI $3DC7               ; [30 9E      ] Branch if Minus
    BRK                     ; [00 1C      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    CPY #$4C                ; [C0 4C      ] Compare Y Immediate
    BRA $3E57               ; [80 24      ] Branch Always
    BCC $3E59               ; [90 24      ] Branch if Carry Clear
    BCC $3E7B               ; [90 44      ] Branch if Carry Clear
    BMI $3E81               ; [30 48      ] Branch if Minus
    BIT $C8                 ; [24 C8      ] Test Bits DP
    JSR $4080               ; [20 80 40   ] Jump to Subroutine
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    PHP                     ; [08         ] Push Processor Status
    ORA [$09]               ; [07 09      ] OR A with [DP]
    ORA [$0F]               ; [07 0F      ] OR A with [DP]
    ORA ($04,X)             ; [01 04      ] OR A with (DP,X)
    BRK                     ; [00 04      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA $07,S               ; [03 07      ] OR A with Stack Relative
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
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
    BRA $3DE7               ; [80 80      ] Branch Always
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
    BPL $3EA1               ; [10 F8      ] Branch if Plus
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 B8      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    JSR ($0000,X)           ; [FC 00 00   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    CPX #$20                ; [E0 20      ] Compare X Immediate
    BVC $3EC9               ; [50 10      ] Branch if Overflow Clear
    RTS                     ; [60         ] Return from Subroutine
    BPL $3EDC               ; [10 20      ] Branch if Plus
    BCC $3EFE               ; [90 40      ] Branch if Carry Clear
    DEY                     ; [88         ] Decrement Y
    BVC $3EE7               ; [50 26      ] Branch if Overflow Clear
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
    BEQ $3F21               ; [F0 FC      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    INY                     ; [C8         ] Increment Y
    BRK                     ; [00 90      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    LDY #$C0                ; [A0 C0      ] Load Y Immediate
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    BRA $3F30               ; [80 00      ] Branch Always
    CPX #$80                ; [E0 80      ] Compare X Immediate
    BEQ $3F34               ; [F0 00      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 00      ] Software interrupt
    BMI $3F79               ; [30 40      ] Branch if Minus
    RTS                     ; [60         ] Return from Subroutine
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $143F42 (SNES $D43F42) ---
org $D43F42

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
    BRA $3F64               ; [80 00      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRA $3F67               ; [80 FC      ] Branch Always
    BRK                     ; [00 FA      ] Software interrupt
    TSB $3E                 ; [04 3E      ] Test and Set Bits in DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRA $3F77               ; [80 00      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    JSR $5800               ; [20 00 58   ] Jump to Subroutine
    PHP                     ; [08         ] Push Processor Status
    MVN $04,$E8             ; [54 04 E8   ] Block Move Negative
    EOR $002424,X           ; [5F 24 24 00] XOR A with Absolute Long,X
    BPL $3F86               ; [10 00      ] Branch if Plus
    BPL $3F88               ; [10 00      ] Branch if Plus
    ASL $00,X               ; [16 00      ] Shift Left DP,X
    BPL $3F8C               ; [10 00      ] Branch if Plus
    ORA $1300               ; [0D 00 13   ] OR A with Absolute
    BRK                     ; [00 05      ] Software interrupt
    BMI $3F9D               ; [30 0A      ] Branch if Minus
    ORA ($0E),Y             ; [11 0E      ] OR A with (DP),Y
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    COP #$0C                ; [02 0C      ] Coprocessor interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 4C      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $3FBD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $3FD5               ; [90 1C      ] Branch if Carry Clear
    BRA $4007               ; [80 4C      ] Branch Always
    BPL $3F85               ; [10 C8      ] Branch if Plus
    TSB $B0                 ; [04 B0      ] Test and Set Bits in DP
    RTI                     ; [40         ] Return from Interrupt
    EOR $002424,X           ; [5F 24 24 00] XOR A with Absolute Long,X
    BPL $3FC6               ; [10 00      ] Branch if Plus
    BPL $3FC8               ; [10 00      ] Branch if Plus
    ASL $00,X               ; [16 00      ] Shift Left DP,X
    BPL $3FCC               ; [10 00      ] Branch if Plus
    ORA $1300               ; [0D 00 13   ] OR A with Absolute
    BRK                     ; [00 05      ] Software interrupt
    BMI $3FDD               ; [30 0A      ] Branch if Minus
    ORA ($0E),Y             ; [11 0E      ] OR A with (DP),Y
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    COP #$0C                ; [02 0C      ] Coprocessor interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 4C      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $3FFD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $4015               ; [90 1C      ] Branch if Carry Clear
    BRA $4047               ; [80 4C      ] Branch Always
    BPL $3FC5               ; [10 C8      ] Branch if Plus
    TSB $B0                 ; [04 B0      ] Test and Set Bits in DP
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $205810             ; [2F 10 58 20] AND A with Absolute Long

;--- Patch at file offset $144016 (SNES $D44016) ---
org $D44016

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
    BPL $3FEA               ; [10 B0      ] Branch if Plus
    BCC $408C               ; [90 50      ] Branch if Carry Clear
    CPY $10                 ; [C4 10      ] Compare Y with DP
    TRB $D0                 ; [14 D0      ] Test and Reset Bits DP
    BVC $406A               ; [50 28      ] Branch if Overflow Clear
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
    BRA $403B               ; [80 CE      ] Branch Always
    BVS $4053               ; [70 E4      ] Branch if Overflow Set
    TYA                     ; [98         ] Transfer Y to A
    MVP $A8,$68             ; [44 A8 68   ] Block Move Positive
    BRA $407D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $40D5               ; [90 5C      ] Branch if Carry Clear
    BRA $4007               ; [80 8C      ] Branch Always
    BRA $40AD               ; [80 30      ] Branch Always
    MVP $18,$80             ; [44 18 80   ] Block Move Positive
    ADC $004F07             ; [6F 07 4F 00] Add with Carry Absolute Long
    AND $08,X               ; [35 08      ] AND A with DP,X
    ORA $08,X               ; [15 08      ] OR A with DP,X
    ASL $08,X               ; [16 08      ] Shift Left DP,X
    ASL $0C,X               ; [16 0C      ] Shift Left DP,X
    ASL $0704               ; [0E 04 07   ] Shift Left Absolute
    BRK                     ; [00 32      ] Software interrupt
    AND [$20]               ; [27 20      ] AND A with [DP]
    BPL $40A0               ; [10 0B      ] Branch if Plus
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
    BMI $40F0               ; [30 38      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    BCS $4073               ; [B0 B8      ] Branch if Carry Set
    BCS $4079               ; [B0 BC      ] Branch if Carry Set
    CLV                     ; [B8         ] Clear Overflow Flag

;--- Patch at file offset $1440C4 (SNES $D440C4) ---
org $D440C4

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $205810             ; [2F 10 58 20] AND A with Absolute Long

;--- Patch at file offset $1440D6 (SNES $D440D6) ---
org $D440D6

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
    BPL $40AA               ; [10 B0      ] Branch if Plus
    BCC $414C               ; [90 50      ] Branch if Carry Clear
    CPY $10                 ; [C4 10      ] Compare Y with DP
    TRB $D0                 ; [14 D0      ] Test and Reset Bits DP
    BVC $4122               ; [50 20      ] Branch if Overflow Clear
    AND ($08)               ; [32 08      ] AND A with (DP)
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
    BRA $413D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $4185               ; [90 4C      ] Branch if Carry Clear
    BCC $40DF               ; [90 A4      ] Branch if Carry Clear
    BRA $4155               ; [80 18      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    PLP                     ; [28         ] Pull Processor Status
    BCS $41A0               ; [B0 5F      ] Branch if Carry Set
    AND [$27]               ; [27 27      ] AND A with [DP]
    CLC                     ; [18         ] Clear Carry Flag
    AND $2D00,X             ; [3D 00 2D   ] AND A with Absolute,X
    BPL $419C               ; [10 53      ] Branch if Plus
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
    BPL $4198               ; [10 03      ] Branch if Plus
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
    BVC $4190               ; [50 D8      ] Branch if Overflow Clear
    TYA                     ; [98         ] Transfer Y to A
    BPL $41A3               ; [10 E8      ] Branch if Plus
    RTS                     ; [60         ] Return from Subroutine
    db $5C, $58                 ; Incomplete/data bytes

;--- Patch at file offset $1441C8 (SNES $D441C8) ---
org $D441C8

    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    ORA [$00]               ; [07 00      ] OR A with [DP]

;--- Patch at file offset $1441DA (SNES $D441DA) ---
org $D441DA

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $1441E8 (SNES $D441E8) ---
org $D441E8

    BRK                     ; [00 00      ] Software interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    BRK                     ; [00 24      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    PHX                     ; [DA         ] Push X Register
    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $1441FA (SNES $D441FA) ---
org $D441FA

    BRK                     ; [00 00      ] Software interrupt
    CPY #$D8                ; [C0 D8      ] Compare Y Immediate
    PLA                     ; [68         ] Pull Accumulator
    STZ $19                 ; [64 19      ] Store Zero to DP
    ASL $2F                 ; [06 2F      ] Shift Left DP
    BPL $4264               ; [10 5F      ] Branch if Plus
    JSR $2050               ; [20 50 20   ] Jump to Subroutine
    BVS $420C               ; [70 02      ] Branch if Overflow Set
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
    BRA $41C5               ; [80 94      ] Branch Always
    AND ($6C)               ; [32 6C      ] AND A with (DP)
    BRL $244A               ; [82 14 E2   ] Branch Long

;--- Patch at file offset $14423D (SNES $D4423D) ---
org $D4423D

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
    PER $9D01               ; [62 9C 5A   ] Push Effective Relative
    CPX $54EE               ; [EC EE 54   ] Compare X with Absolute
    SBC $BD9E,X             ; [FD 9E BD   ] Subtract with Borrow Absolute,X
    ASL $9F,X               ; [16 9F      ] Shift Left DP,X
    COP #$FE                ; [02 FE      ] Coprocessor interrupt
    BRK                     ; [00 28      ] Software interrupt
    REP #$9C                ; [C2 9C      ] Reset Processor Status Bits
    BRA $4219               ; [80 A4      ] Branch Always
    INY                     ; [C8         ] Increment Y
    BPL $42CC               ; [10 54      ] Branch if Plus
    DEC                     ; [3A         ] Decrement Accumulator
    LDY $3472,X             ; [BC 72 34   ] Load Y from Absolute,X
    RTI                     ; [40         ] Return from Interrupt
    JSL $500000             ; [22 00 00 50] Jump to Subroutine Long
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
    BRK                     ; [00 2B      ] Software interrupt
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
    BVC $42EA               ; [50 28      ] Branch if Overflow Clear
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
    BVS $4335               ; [70 44      ] Branch if Overflow Set
    TAY                     ; [A8         ] Transfer A to Y
    PLA                     ; [68         ] Pull Accumulator
    BRA $42FD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $4355               ; [90 5C      ] Branch if Carry Clear
    BRA $4307               ; [80 0C      ] Branch Always
    BPL $435D               ; [10 60      ] Branch if Plus
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
    BMI $4319               ; [30 F4      ] Branch if Minus
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
    BCC $4348               ; [90 00      ] Branch if Carry Clear
    INX                     ; [E8         ] Increment X
    JSR $00FC               ; [20 FC 00   ] Jump to Subroutine
    INC $2E10,X             ; [FE 10 2E   ] Increment Absolute,X
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BPL $430A               ; [10 B0      ] Branch if Plus
    BCC $43AC               ; [90 50      ] Branch if Carry Clear
    CPY $10                 ; [C4 10      ] Compare Y with DP
    TRB $D0                 ; [14 D0      ] Test and Reset Bits DP
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 E4      ] Software interrupt
    BRK                     ; [00 A4      ] Software interrupt
    BRK                     ; [00 26      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRA $430B               ; [80 9E      ] Branch Always
    BVS $432B               ; [70 BC      ] Branch if Overflow Set
    CPX #$44                ; [E0 44      ] Compare X Immediate
    TAY                     ; [A8         ] Transfer A to Y
    RTI                     ; [40         ] Return from Interrupt
    BRA $438D               ; [80 18      ] Branch Always
    CPY #$58                ; [C0 58      ] Compare Y Immediate
    BRA $43D9               ; [80 60      ] Branch Always
    CLV                     ; [B8         ] Clear Overflow Flag
    LDY $B0,X               ; [B4 B0      ] Load Y from DP,X
    BVS $43F2               ; [70 74      ] Branch if Overflow Set
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
    BPL $4398               ; [10 03      ] Branch if Plus
    ORA $05,S               ; [03 05      ] OR A with Stack Relative
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ASL $1E1E               ; [0E 1E 1E   ] Shift Left Absolute
    ORA $05                 ; [05 05      ] OR A with Direct Page
    BRK                     ; [00 00      ] Software interrupt
    INX                     ; [E8         ] Increment X
    BVC $439B               ; [50 F8      ] Branch if Overflow Clear
    BMI $439D               ; [30 F8      ] Branch if Minus
    BPL $43E3               ; [10 3C      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    JMP ($3618,X)           ; [7C 18 36   ] Jump Indirect,X
    TSB $04FE               ; [0C FE 04   ] Test and Set Bits Absolute
    CPX $00                 ; [E4 00      ] Compare X with DP
    BVC $43F2               ; [50 40      ] Branch if Overflow Clear
    LDY #$B0                ; [A0 B0      ] Load Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    BVC $4407               ; [50 50      ] Branch if Overflow Clear
    CLD                     ; [D8         ] Clear Decimal Flag
    BCC $43D2               ; [90 18      ] Branch if Carry Clear
    INX                     ; [E8         ] Increment X
    STZ $40                 ; [64 40      ] Store Zero to DP
    db $44                      ; Incomplete/data bytes

;--- Patch at file offset $1443C4 (SNES $D443C4) ---
org $D443C4

    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $205810             ; [2F 10 58 20] AND A with Absolute Long
    BVC $43F8               ; [50 28      ] Branch if Overflow Clear

;--- Patch at file offset $1443D6 (SNES $D443D6) ---
org $D443D6

    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA [$18]               ; [07 18      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA [$16],Y             ; [17 16      ] OR A with [DP],Y
    AND #$0F                ; [29 0F      ] AND A with Immediate
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BCC $43E6               ; [90 00      ] Branch if Carry Clear
    INX                     ; [E8         ] Increment X
    JSR $00FC               ; [20 FC 00   ] Jump to Subroutine
    INC $2E10,X             ; [FE 10 2E   ] Increment Absolute,X
    CPY #$FE                ; [C0 FE      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BPL $43A8               ; [10 B0      ] Branch if Plus
    BCC $444A               ; [90 50      ] Branch if Carry Clear
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
    BVC $4471               ; [50 40      ] Branch if Overflow Clear
    BRA $4457               ; [80 24      ] Branch Always
    BCC $4459               ; [90 24      ] Branch if Carry Clear
    BCC $44AB               ; [90 74      ] Branch if Carry Clear
    BNE $44A5               ; [D0 6C      ] Branch if Not Equal
    RTS                     ; [60         ] Return from Subroutine
    RTS                     ; [60         ] Return from Subroutine
    STZ $60                 ; [64 60      ] Store Zero to DP
    RTS                     ; [60         ] Return from Subroutine
    BNE $4400               ; [D0 C0      ] Branch if Not Equal
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
    BMI $445B               ; [30 F8      ] Branch if Minus
    BMI $445D               ; [30 F8      ] Branch if Minus
    BMI $44DB               ; [30 74      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    JSR ($F638,X)           ; [FC 38 F6   ] Jump to Subroutine Indirect,X
    TSB $04CA               ; [0C CA 04   ] Test and Set Bits Absolute
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    BCC $4412               ; [90 A0      ] Branch if Carry Clear
    LDY #$B0                ; [A0 B0      ] Load Y Immediate
    JSR $2830               ; [20 30 28   ] Jump to Subroutine
    BCS $4429               ; [B0 B0      ] Branch if Carry Set
    CLV                     ; [B8         ] Clear Overflow Flag
    DEY                     ; [88         ] Decrement Y
    STY $04                 ; [84 04      ] Store Y to DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 1B      ] Software interrupt
    ORA ($2D,X)             ; [01 2D      ] OR A with (DP,X)
    BPL $44E8               ; [10 5F      ] Branch if Plus
    JSL $5D215E             ; [22 5E 21 5D] Jump to Subroutine Long
    JSL $002758             ; [22 58 27 00] Jump to Subroutine Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($0B,X)             ; [01 0B      ] OR A with (DP,X)
    ORA ($10,S),Y           ; [13 10      ] OR A with (SR),Y
    ROL                     ; [2A         ] Rotate Left Accumulator
    BPL $44C5               ; [10 29      ] Branch if Plus
    ORA ($2A),Y             ; [11 2A      ] OR A with (DP),Y
    BRK                     ; [00 37      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $44A4               ; [80 00      ] Branch Always
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
    BRA $44B7               ; [80 00      ] Branch Always
    BRK                     ; [00 20      ] Software interrupt
    BVC $452B               ; [50 70      ] Branch if Overflow Clear
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
    BRK                     ; [00 06      ] Software interrupt
    JSR $008C               ; [20 8C 00   ] Jump to Subroutine
    MVN $00,$04             ; [54 00 04   ] Block Move Negative
    SED                     ; [F8         ] Set Decimal Flag
    TXA                     ; [8A         ] Transfer X to A
    STZ $FD,X               ; [74 FD      ] Store Zero to DP,X
    STX $CC32               ; [8E 32 CC   ] Store X to Absolute
    BEQ $4500               ; [F0 0C      ] Branch if Equal
    BEQ $451E               ; [F0 28      ] Branch if Equal
    BVS $44F8               ; [70 00      ] Branch if Overflow Set
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
    BEQ $453F               ; [F0 0C      ] Branch if Equal
    TSB $BCDC               ; [0C DC BC   ] Test and Set Bits Absolute
    PLY                     ; [7A         ] Pull Y Register
    CLC                     ; [18         ] Clear Carry Flag
    LDY $30,X               ; [B4 30      ] Load Y from DP,X
    STY $B880               ; [8C 80 B8   ] Store Y to Absolute
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $144544 (SNES $D44544) ---
org $D44544

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $205810             ; [2F 10 58 20] AND A with Absolute Long

;--- Patch at file offset $144556 (SNES $D44556) ---
org $D44556

    BRK                     ; [00 00      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA [$18]               ; [07 18      ] OR A with [DP]
    PHP                     ; [08         ] Push Processor Status
    ORA [$16],Y             ; [17 16      ] OR A with [DP],Y
    AND #$00                ; [29 00      ] AND A with Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 90      ] Software interrupt
    BRA $4551               ; [80 E8      ] Branch Always
    JSR $00FC               ; [20 FC 00   ] Jump to Subroutine
    INC $2E10,X             ; [FE 10 2E   ] Increment Absolute,X
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    CPX #$10                ; [E0 10      ] Compare X Immediate
    BMI $450B               ; [30 90      ] Branch if Minus
    BVC $4541               ; [50 C4      ] Branch if Overflow Clear
    BPL $4593               ; [10 14      ] Branch if Plus
    BNE $45D1               ; [D0 50      ] Branch if Not Equal
    JSR $0830               ; [20 30 08   ] Jump to Subroutine
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    ASL $00,X               ; [16 00      ] Shift Left DP,X
    BMI $458A               ; [30 00      ] Branch if Minus
    BIT $2403               ; [2C 03 24   ] Test Bits Absolute
    ORA $27,S               ; [03 27      ] OR A with Stack Relative
    BRK                     ; [00 07      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    ORA $000E18             ; [0F 18 0E 00] OR A with Absolute Long
    ORA #$00                ; [09 00      ] OR A with Immediate
    ASL $1301               ; [0E 01 13   ] Shift Left Absolute
    ORA $13,S               ; [03 13      ] OR A with Stack Relative
    PHD                     ; [0B         ] Push Direct Page Register
    BPL $45A8               ; [10 08      ] Branch if Plus
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BEQ $45A3               ; [F0 F4      ] Branch if Equal
    DEY                     ; [88         ] Decrement Y
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $45BD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $4615               ; [90 5C      ] Branch if Carry Clear
    BRA $45BF               ; [80 04      ] Branch Always
    BRK                     ; [00 30      ] Software interrupt
    CPY #$08                ; [C0 08      ] Compare Y Immediate
    BRA $4611               ; [80 50      ] Branch Always
    JSR $0830               ; [20 30 08   ] Jump to Subroutine
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    ASL $00,X               ; [16 00      ] Shift Left DP,X
    BMI $45CA               ; [30 00      ] Branch if Minus
    BIT $2403               ; [2C 03 24   ] Test Bits Absolute
    ORA $27,S               ; [03 27      ] OR A with Stack Relative
    BRK                     ; [00 07      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    ORA $000E18             ; [0F 18 0E 00] OR A with Absolute Long
    ORA #$00                ; [09 00      ] OR A with Immediate
    ASL $1301               ; [0E 01 13   ] Shift Left Absolute
    ORA $13,S               ; [03 13      ] OR A with Stack Relative
    PHD                     ; [0B         ] Push Direct Page Register
    BPL $45E8               ; [10 08      ] Branch if Plus
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BEQ $45E3               ; [F0 F4      ] Branch if Equal
    DEY                     ; [88         ] Decrement Y
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $45FD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $4655               ; [90 5C      ] Branch if Carry Clear
    BRA $45FF               ; [80 04      ] Branch Always
    BRK                     ; [00 30      ] Software interrupt
    CPY #$08                ; [C0 08      ] Compare Y Immediate
    BRA $4601               ; [80 00      ] Branch Always
    BRK                     ; [00 0C      ] Software interrupt
    BRK                     ; [00 14      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    PHP                     ; [08         ] Push Processor Status
    AND #$1F                ; [29 1F      ] AND A with Immediate
    RTI                     ; [40         ] Return from Interrupt
    AND $007F8F,X           ; [3F 8F 7F 00] AND A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    TSB $0C                 ; [04 0C      ] Test and Set Bits in DP
    ORA $003F00,X           ; [1F 00 3F 00] OR A with Absolute Long,X
    ADC $00000E,X           ; [7F 0E 00 00] Add with Carry Absolute Long,X
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 6C      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    STY $1C68               ; [8C 68 1C   ] Store Y to Absolute
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
    BRK                     ; [00 91      ] Software interrupt
    ADC ($BD),Y             ; [71 BD      ] Add with Carry (DP),Y
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
    JSR $20B8               ; [20 B8 20   ] Jump to Subroutine
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
    BRK                     ; [00 28      ] Software interrupt
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
    BRK                     ; [00 50      ] Software interrupt
    JSR $5098               ; [20 98 50   ] Jump to Subroutine
    SEC                     ; [38         ] Set Carry Flag
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
    LDY $F462,X             ; [BC 62 F4   ] Load Y from Absolute,X
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
    TRB $2700               ; [1C 00 27   ] Test and Reset Bits Absolute
    db $1C                      ; Incomplete/data bytes

;--- Patch at file offset $1447DC (SNES $D447DC) ---
org $D447DC

    BRK                     ; [00 00      ] Software interrupt
    db $1C, $00                 ; Incomplete/data bytes

;--- Patch at file offset $1447EA (SNES $D447EA) ---
org $D447EA

    BRK                     ; [00 00      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 8C      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable

;--- Patch at file offset $1447FC (SNES $D447FC) ---
org $D447FC

    BRK                     ; [00 00      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 43      ] Software interrupt
    AND ($30,S),Y           ; [33 30      ] AND A with (SR),Y
    ORA $271F37,X           ; [1F 37 1F 27] OR A with Absolute Long,X
    TRB $3848               ; [1C 48 38   ] Test and Reset Bits Absolute
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
    TYX                     ; [BB         ] Transfer Y to X
    ASL $1EFB,X             ; [1E FB 1E   ] Shift Left Absolute,X
    TYX                     ; [BB         ] Transfer Y to X
    DEC $30FC               ; [CE FC 30   ] Decrement Absolute
    CPX #$18                ; [E0 18      ] Compare X Immediate
    JSR ($7C84,X)           ; [FC 84 7C   ] Jump to Subroutine Indirect,X
    CPY #$FE                ; [C0 FE      ] Compare Y Immediate
    PER $987A               ; [62 3E 50   ] Push Effective Relative
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
    BRK                     ; [00 91      ] Software interrupt
    ADC ($BD),Y             ; [71 BD      ] Add with Carry (DP),Y
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
    STA ($71),Y             ; [91 71      ] Store A to (DP),Y
    LDA $F660,X             ; [BD 60 F6   ] Load A from Absolute,X
    STZ $F4                 ; [64 F4      ] Store Zero to DP
    ROR $74                 ; [66 74      ] Rotate Right DP
    ROL $70                 ; [26 70      ] Rotate Left DP
    JSR $1039               ; [20 39 10   ] Jump to Subroutine
    PLY                     ; [7A         ] Pull Y Register
    AND $71                 ; [25 71      ] AND A with Direct Page
    ORA $683261,X           ; [1F 61 32 68] OR A with Absolute Long,X
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
    DEY                     ; [88         ] Decrement Y
    SED                     ; [F8         ] Set Decimal Flag
    CPY #$B8                ; [C0 B8      ] Compare Y Immediate
    JSR $20B8               ; [20 B8 20   ] Jump to Subroutine
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
    BRK                     ; [00 6C      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    STY $1C68               ; [8C 68 1C   ] Store Y to Absolute
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
    LDY $8820               ; [AC 20 88   ] Load Y from Absolute
    TSB $88                 ; [04 88      ] Test and Set Bits in DP
    CLC                     ; [18         ] Clear Carry Flag
    PHP                     ; [08         ] Push Processor Status
    SEC                     ; [38         ] Set Carry Flag
    DEY                     ; [88         ] Decrement Y
    CLV                     ; [B8         ] Clear Overflow Flag
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
    AND #$1F                ; [29 1F      ] AND A with Immediate
    RTI                     ; [40         ] Return from Interrupt
    AND $DF7F8F,X           ; [3F 8F 7F DF] AND A with Absolute Long,X
    AND ($00),Y             ; [31 00      ] AND A with (DP),Y
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    TSB $0C                 ; [04 0C      ] Test and Set Bits in DP
    ORA $003F00,X           ; [1F 00 3F 00] OR A with Absolute Long,X
    ADC $1F310E,X           ; [7F 0E 31 1F] Add with Carry Absolute Long,X
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 6C      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    STY $1C68               ; [8C 68 1C   ] Store Y to Absolute
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
    EOR ($12,X)             ; [41 12      ] XOR A with (DP,X)
    PHA                     ; [48         ] Push Accumulator
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
    ROR $4700,X             ; [7E 00 47   ] Rotate Right Absolute,X
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
    BRK                     ; [00 24      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    JMP $EC38               ; [4C 38 EC   ] Jump Absolute
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
    AND ($1F,X)             ; [21 1F      ] AND A with (DP,X)
    EOR [$3F]               ; [47 3F      ] XOR A with [DP]
    EOR $006524,X           ; [5F 24 65 00] XOR A with Absolute Long,X
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
    BRK                     ; [00 14      ] Software interrupt
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
    CLI                     ; [58         ] Clear Interrupt Disable
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
    CLI                     ; [58         ] Clear Interrupt Disable
    BMI $4C03               ; [30 7C      ] Branch if Minus
    BMI $4C01               ; [30 78      ] Branch if Minus
    BMI $4BB8               ; [30 2D      ] Branch if Minus
    BRK                     ; [00 3A      ] Software interrupt
    BRK                     ; [00 32      ] Software interrupt
    BRK                     ; [00 1D      ] Software interrupt
    ORA [$3B]               ; [07 3B      ] OR A with [DP]
    TSB $1037               ; [0C 37 10   ] Test and Set Bits Absolute
    AND ($10,S),Y           ; [33 10      ] AND A with (SR),Y
    AND ($15)               ; [32 15      ] AND A with (DP)
    ORA ($00)               ; [12 00      ] OR A with (DP)
    ORA ($04,X)             ; [01 04      ] OR A with (DP,X)
    ORA #$04                ; [09 04      ] OR A with Immediate
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
    CLI                     ; [58         ] Clear Interrupt Disable
    BMI $4C43               ; [30 7C      ] Branch if Minus
    BMI $4C41               ; [30 78      ] Branch if Minus
    BMI $4BF8               ; [30 2D      ] Branch if Minus
    BRK                     ; [00 3A      ] Software interrupt
    BRK                     ; [00 32      ] Software interrupt
    BRK                     ; [00 1D      ] Software interrupt
    ORA [$3B]               ; [07 3B      ] OR A with [DP]
    TSB $1037               ; [0C 37 10   ] Test and Set Bits Absolute
    AND ($10,S),Y           ; [33 10      ] AND A with (SR),Y
    AND ($15)               ; [32 15      ] AND A with (DP)
    ORA ($00)               ; [12 00      ] OR A with (DP)
    ORA ($04,X)             ; [01 04      ] OR A with (DP,X)
    ORA #$04                ; [09 04      ] OR A with Immediate
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

;--- Patch at file offset $144C06 (SNES $D44C06) ---
org $D44C06

    BRK                     ; [00 00      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 7F      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ADC $007F02,X           ; [7F 02 7F 00] Add with Carry Absolute Long,X

;--- Patch at file offset $144C18 (SNES $D44C18) ---
org $D44C18

    BRK                     ; [00 00      ] Software interrupt
    BMI $4C54               ; [30 38      ] Branch if Minus
    BIT $3F3E,X             ; [3C 3E 3F   ] Test Bits Absolute,X
    AND $0E0000,X           ; [3F 00 00 0E] AND A with Absolute Long,X
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    TSB $FC                 ; [04 FC      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    JML [$8C28]             ; [DC 28 8C   ] Jump Long Indirect
    CLI                     ; [58         ] Clear Interrupt Disable
    MVN $D8,$00             ; [54 D8 00   ] Block Move Negative
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    TSB $3C38               ; [0C 38 3C   ] Test and Set Bits Absolute
    BVS $4CB2               ; [70 78      ] Branch if Overflow Set
    BEQ $4C34               ; [F0 F8      ] Branch if Equal
    BVS $4CB6               ; [70 78      ] Branch if Overflow Set
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    ROR $3F21,X             ; [7E 21 3F   ] Rotate Right Absolute,X
    ORA ($3F),Y             ; [11 3F      ] OR A with (DP),Y
    BRK                     ; [00 0F      ] Software interrupt
    TSB $0F                 ; [04 0F      ] Test and Set Bits in DP
    TSB $2F                 ; [04 2F      ] Test and Set Bits in DP
    BRK                     ; [00 20      ] Software interrupt
    BPL $4C7F               ; [10 30      ] Branch if Plus
    ORA $003F1F             ; [0F 1F 3F 00] OR A with Absolute Long
    db $11                      ; Incomplete/data bytes

;--- Patch at file offset $144C5A (SNES $D44C5A) ---
org $D44C5A

    BPL $4C6C               ; [10 10      ] Branch if Plus
    ORA $000F0F,X           ; [1F 0F 0F 00] OR A with Absolute Long,X
    BIT $1038,X             ; [3C 38 10   ] Test Bits Absolute,X
    CLV                     ; [B8         ] Clear Overflow Flag
    TAY                     ; [A8         ] Transfer A to Y
    BEQ $4C63               ; [F0 FC      ] Branch if Equal
    SEI                     ; [78         ] Set Interrupt Disable
    JSR ($1E08,X)           ; [FC 08 1E   ] Jump to Subroutine Indirect,X
    BIT $1C                 ; [24 1C      ] Test Bits DP
    BEQ $4C5B               ; [F0 EC      ] Branch if Equal
    SEC                     ; [38         ] Set Carry Flag
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    BVC $4C66               ; [50 F0      ] Branch if Overflow Clear
    BRK                     ; [00 78      ] Software interrupt
    BPL $4C92               ; [10 18      ] Branch if Plus
    INX                     ; [E8         ] Increment X
    CPY $00F0               ; [CC F0 00   ] Compare Y with Absolute
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 79      ] Software interrupt
    ASL $1E79               ; [0E 79 1E   ] Shift Left Absolute
    SEI                     ; [78         ] Set Interrupt Disable
    ORA $580F58             ; [0F 58 0F 58] OR A with Absolute Long
    ORA $780F58             ; [0F 58 0F 78] OR A with Absolute Long
    ORA $3E007F,X           ; [1F 7F 00 3E] OR A with Absolute Long,X
    BMI $4CC1               ; [30 2E      ] Branch if Minus
    BMI $4CA4               ; [30 0F      ] Branch if Minus
    BRK                     ; [00 2F      ] Software interrupt
    JSR $202F               ; [20 2F 20   ] Jump to Subroutine
    AND $001F20             ; [2F 20 1F 00] AND A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    CPX $EC18               ; [EC 18 EC   ] Compare X with Absolute
    CLI                     ; [58         ] Clear Interrupt Disable
    CPY $CC18               ; [CC 18 CC   ] Compare Y with Absolute
    TYA                     ; [98         ] Transfer Y to A
    MVP $98,$64             ; [44 98 64   ] Block Move Positive
    INY                     ; [C8         ] Increment Y
    INC $FEEC,X             ; [FE EC FE   ] Increment Absolute,X
    BRK                     ; [00 D8      ] Software interrupt
    CPY #$98                ; [C0 98      ] Compare Y Immediate
    CPY #$38                ; [C0 38      ] Compare Y Immediate
    JSR $20B8               ; [20 B8 20   ] Jump to Subroutine
    CLV                     ; [B8         ] Clear Overflow Flag
    JSR $10D8               ; [20 D8 10   ] Jump to Subroutine
    db $EC                      ; Incomplete/data bytes

;--- Patch at file offset $144CC6 (SNES $D44CC6) ---
org $D44CC6

    BRK                     ; [00 00      ] Software interrupt
    AND $037F00,X           ; [3F 00 7F 03] AND A with Absolute Long,X
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $144CD8 (SNES $D44CD8) ---
org $D44CD8

    BRK                     ; [00 00      ] Software interrupt
    BIT $7F3F,X             ; [3C 3F 7F   ] Test Bits Absolute,X
    ADC $007F7F,X           ; [7F 7F 7F 00] Add with Carry Absolute Long,X
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    JSR $30E0               ; [20 E0 30   ] Jump to Subroutine
    CPY #$E8                ; [C0 E8      ] Compare Y Immediate
    CPX #$6C                ; [E0 6C      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    JSR $6020               ; [20 20 60   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    BPL $4D2C               ; [10 30      ] Branch if Plus
    SEC                     ; [38         ] Set Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    LDY $FFFC,X             ; [BC FC FF   ] Load Y from Absolute,X
    EOR $FF,S               ; [43 FF      ] XOR A with Stack Relative
    RTS                     ; [60         ] Return from Subroutine
    ADC $257F28,X           ; [7F 28 7F 25] Add with Carry Absolute Long,X
    AND $002F05,X           ; [3F 05 2F 00] AND A with Absolute Long,X
    LSR $5F20,X             ; [5E 20 5F   ] Shift Right Absolute,X
    BIT $3C                 ; [24 3C      ] Test Bits DP
    db $7F                      ; Incomplete/data bytes

;--- Patch at file offset $144D1E (SNES $D44D1E) ---
org $D44D1E

    PLP                     ; [28         ] Pull Processor Status
    TSB $5C98               ; [0C 98 5C   ] Test and Set Bits Absolute
    CPY $28                 ; [C4 28      ] Compare Y with DP
    CPX $FE98               ; [EC 98 FE   ] Compare X with Absolute
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    TSB $209C               ; [0C 9C 20   ] Test and Set Bits Absolute
    CLC                     ; [18         ] Clear Carry Flag
    BVS $4D87               ; [70 58      ] Branch if Overflow Set
    BEQ $4D1D               ; [F0 EC      ] Branch if Equal
    CPX $7878               ; [EC 78 78   ] Compare X with Absolute
    SEC                     ; [38         ] Set Carry Flag
    SEC                     ; [38         ] Set Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    TRB $0C00               ; [1C 00 0C   ] Test and Reset Bits Absolute
    RTS                     ; [60         ] Return from Subroutine
    RTI                     ; [40         ] Return from Interrupt
    BEQ $4CBE               ; [F0 80      ] Branch if Equal
    BEQ $4D40               ; [F0 00      ] Branch if Equal
    STA $79CF70,X           ; [9F 70 CF 79] Store A to Absolute Long,X
    CMP $66C978             ; [CF 78 C9 66] Compare A with Absolute Long
    CMP #$67                ; [C9 67      ] Compare A Immediate
    STA ($4F),Y             ; [91 4F      ] Store A to (DP),Y
    LDA ($1F),Y             ; [B1 1F      ] Load A from (DP),Y
    SBC $037300,X           ; [FF 00 73 03] Subtract with Borrow Absolute Long,X
    PLY                     ; [7A         ] Pull Y Register
    ORA $78,S               ; [03 78      ] OR A with Stack Relative
    BRK                     ; [00 76      ] Software interrupt

;--- Patch at file offset $144D60 (SNES $D44D60) ---
org $D44D60

    TYA                     ; [98         ] Transfer Y to A
    BVS $4CFF               ; [70 9C      ] Branch if Overflow Set
    SEI                     ; [78         ] Set Interrupt Disable
    TSB $0C78               ; [0C 78 0C   ] Test and Set Bits Absolute
    SEI                     ; [78         ] Set Interrupt Disable
    STY $8C38               ; [8C 38 8C   ] Store Y to Absolute
    CLC                     ; [18         ] Clear Carry Flag
    INC $8C                 ; [E6 8C      ] Increment DP
    JSR ($7000,X)           ; [FC 00 70   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 78      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    BRA $4D6F               ; [80 F8      ] Branch Always
    BRA $4DF1               ; [80 78      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    RTS                     ; [60         ] Return from Subroutine
    STZ $0010               ; [9C 10 00   ] Store Zero to Absolute
    BRK                     ; [00 79      ] Software interrupt
    ASL $1E79               ; [0E 79 1E   ] Shift Left Absolute
    SEI                     ; [78         ] Set Interrupt Disable
    ORA $780F58             ; [0F 58 0F 78] OR A with Absolute Long
    ORA $73035F,X           ; [1F 5F 03 73] OR A with Absolute Long,X
    TRB $007F               ; [1C 7F 00   ] Test and Reset Bits Absolute
    ROL $2E30,X             ; [3E 30 2E   ] Rotate Left Absolute,X
    BMI $4DA4               ; [30 0F      ] Branch if Minus
    BRK                     ; [00 2F      ] Software interrupt
    JSR $001F               ; [20 1F 00   ] Jump to Subroutine
    AND $20,S               ; [23 20      ] AND A with Stack Relative
    TRB $001C               ; [1C 1C 00   ] Test and Reset Bits Absolute
    BRK                     ; [00 EC      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    CPX $CC58               ; [EC 58 CC   ] Compare X with Absolute
    CLC                     ; [18         ] Clear Carry Flag
    MVP $98,$66             ; [44 98 66   ] Block Move Positive
    CPY $E476               ; [CC 76 E4   ] Compare Y with Absolute
    INC $FCF4,X             ; [FE F4 FC   ] Increment Absolute,X
    BRK                     ; [00 D8      ] Software interrupt
    CPY #$98                ; [C0 98      ] Compare Y Immediate
    CPY #$38                ; [C0 38      ] Compare Y Immediate
    JSR $20B8               ; [20 B8 20   ] Jump to Subroutine
    JML [$EC10]             ; [DC 10 EC   ] Jump Long Indirect
    PHP                     ; [08         ] Push Processor Status
    db $F4                      ; Incomplete/data bytes

;--- Patch at file offset $144DCE (SNES $D44DCE) ---
org $D44DCE

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
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $144DEA (SNES $D44DEA) ---
org $D44DEA

    ASL $3E00               ; [0E 00 3E   ] Shift Left Absolute
    BRK                     ; [00 7E      ] Software interrupt

;--- Patch at file offset $144DFA (SNES $D44DFA) ---
org $D44DFA

    BRK                     ; [00 00      ] Software interrupt
    TSB $380C               ; [0C 0C 38   ] Test and Set Bits Absolute
    BIT $003E,X             ; [3C 3E 00   ] Test Bits Absolute,X
    ADC $027F04,X           ; [7F 04 7F 02] Add with Carry Absolute Long,X
    ADC $3F7E21,X           ; [7F 21 7E 3F] Add with Carry Absolute Long,X
    AND $003F11,X           ; [3F 11 3F 00] AND A with Absolute Long,X
    ORA $000004             ; [0F 04 00 00] OR A with Absolute Long
    SEC                     ; [38         ] Set Carry Flag
    BIT $3E3C,X             ; [3C 3C 3E   ] Test Bits Absolute,X
    ASL $013F,X             ; [1E 3F 01   ] Shift Left Absolute,X
    AND $001100,X           ; [3F 00 11 00] AND A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    JML [$8C28]             ; [DC 28 8C   ] Jump Long Indirect
    CLI                     ; [58         ] Clear Interrupt Disable
    MVN $D8,$3C             ; [54 D8 3C   ] Block Move Negative
    SEC                     ; [38         ] Set Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    BCS $4DE5               ; [B0 B8      ] Branch if Carry Set
    CPX #$FC                ; [E0 FC      ] Compare X Immediate
    CLI                     ; [58         ] Clear Interrupt Disable
    BVS $4EAA               ; [70 78      ] Branch if Overflow Set
    BEQ $4E2C               ; [F0 F8      ] Branch if Equal
    BVS $4EAE               ; [70 78      ] Branch if Overflow Set
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    BEQ $4E2C               ; [F0 F0      ] Branch if Equal
    RTI                     ; [40         ] Return from Interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CLI                     ; [58         ] Clear Interrupt Disable
    ORA $002F04             ; [0F 04 2F 00] OR A with Absolute Long
    JSR $3110               ; [20 10 31   ] Jump to Subroutine
    ORA $7F1E31,X           ; [1F 31 1E 7F] OR A with Absolute Long,X
    TSB $107F               ; [0C 7F 10   ] Test and Set Bits Absolute
    ADC $000000,X           ; [7F 00 00 00] Add with Carry Absolute Long,X
    BPL $4E64               ; [10 10      ] Branch if Plus
    ORA $001F0F,X           ; [1F 0F 1F 00] OR A with Absolute Long,X
    ASL $0D00,X             ; [1E 00 0D   ] Shift Left Absolute,X
    ORA ($21,X)             ; [01 21      ] OR A with (DP,X)
    AND ($00),Y             ; [31 00      ] AND A with (DP),Y
    BRK                     ; [00 FC      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ROL $9C24,X             ; [3E 24 9C   ] Rotate Left Absolute,X
    BVS $4E03               ; [70 9C      ] Branch if Overflow Set
    SEI                     ; [78         ] Set Interrupt Disable
    STY $DC78               ; [8C 78 DC   ] Store Y to Absolute
    BVS $4DF3               ; [70 86      ] Branch if Overflow Set
    STY $00FE               ; [8C FE 00   ] Store Y to Absolute
    BPL $4E8A               ; [10 18      ] Branch if Plus
    INX                     ; [E8         ] Increment X
    CPY $0070               ; [CC 70 00   ] Compare Y with Absolute
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 78      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRA $4EF9               ; [80 7C      ] Branch Always
    BEQ $4E7F               ; [F0 00      ] Branch if Equal
    BRK                     ; [00 7E      ] Software interrupt
    AND ($3F,X)             ; [21 3F      ] AND A with (DP,X)
    ORA ($3F),Y             ; [11 3F      ] OR A with (DP),Y
    BRK                     ; [00 0F      ] Software interrupt
    TSB $0F                 ; [04 0F      ] Test and Set Bits in DP
    TSB $2F                 ; [04 2F      ] Test and Set Bits in DP
    BRK                     ; [00 20      ] Software interrupt
    BPL $4E9F               ; [10 10      ] Branch if Plus
    ORA $003F1F             ; [0F 1F 3F 00] OR A with Absolute Long
    db $11                      ; Incomplete/data bytes

;--- Patch at file offset $144E9A (SNES $D44E9A) ---
org $D44E9A

    BPL $4EAC               ; [10 10      ] Branch if Plus
    ORA $000F0F,X           ; [1F 0F 0F 00] OR A with Absolute Long,X
    ORA $190E,Y             ; [19 0E 19   ] OR A with Absolute,Y
    ASL $0F18               ; [0E 18 0F   ] Shift Left Absolute
    CLC                     ; [18         ] Clear Carry Flag
    ORA $3F1F38             ; [0F 38 1F 3F] OR A with Absolute Long
    ORA $33,S               ; [03 33      ] OR A with Stack Relative
    TRB $003F               ; [1C 3F 00   ] Test and Reset Bits Absolute
    ASL $0E00               ; [0E 00 0E   ] Shift Left Absolute
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 1C      ] Software interrupt
    TRB $0000               ; [1C 00 00   ] Test and Reset Bits Absolute
    ROR $3F21,X             ; [7E 21 3F   ] Rotate Right Absolute,X
    ORA ($3F),Y             ; [11 3F      ] OR A with (DP),Y
    BRK                     ; [00 0F      ] Software interrupt
    TSB $0F                 ; [04 0F      ] Test and Set Bits in DP
    TSB $2F                 ; [04 2F      ] Test and Set Bits in DP
    BRK                     ; [00 21      ] Software interrupt
    BPL $4F0D               ; [10 3E      ] Branch if Plus
    BRK                     ; [00 1F      ] Software interrupt
    db $3F, $00, $11            ; Incomplete/data bytes

;--- Patch at file offset $144EDA (SNES $D44EDA) ---
org $D44EDA

    BPL $4EEC               ; [10 10      ] Branch if Plus
    ASL $010E,X             ; [1E 0E 01   ] Shift Left Absolute,X
    ORA ($3C,X)             ; [01 3C      ] OR A with (DP,X)
    SEC                     ; [38         ] Set Carry Flag
    BPL $4E9C               ; [10 B8      ] Branch if Plus
    TAY                     ; [A8         ] Transfer A to Y
    BEQ $4EE3               ; [F0 FC      ] Branch if Equal
    SEI                     ; [78         ] Set Interrupt Disable
    JSR ($FE08,X)           ; [FC 08 FE   ] Jump to Subroutine Indirect,X
    MVP $7C,$60             ; [44 7C 60   ] Block Move Positive
    BMI $4ED0               ; [30 E0      ] Branch if Minus
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    BVC $4EE6               ; [50 F0      ] Branch if Overflow Clear
    BRK                     ; [00 78      ] Software interrupt
    BPL $4F12               ; [10 18      ] Branch if Plus
    PHA                     ; [48         ] Push Accumulator
    TSB $80E0               ; [0C E0 80   ] Test and Set Bits Absolute
    CPX #$00                ; [E0 00      ] Compare X Immediate
    SEI                     ; [78         ] Set Interrupt Disable
    ORA [$78]               ; [07 78      ] OR A with [DP]
    ORA [$18],Y             ; [17 18      ] OR A with [DP],Y
    ORA $1C,S               ; [03 1C      ] OR A with Stack Relative
    ORA #$3A                ; [09 3A      ] OR A with Immediate
    TRB $023F               ; [1C 3F 02   ] Test and Reset Bits Absolute
    AND ($1C,S),Y           ; [33 1C      ] AND A with (SR),Y
    AND $303700,X           ; [3F 00 37 30] AND A with Absolute Long,X
    AND [$30]               ; [27 30      ] AND A with [DP]
    ORA [$04]               ; [07 04      ] OR A with [DP]
    PHD                     ; [0B         ] Push Direct Page Register
    COP #$1D                ; [02 1D      ] Coprocessor interrupt
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    BRK                     ; [00 1C      ] Software interrupt
    TRB $0000               ; [1C 00 00   ] Test and Reset Bits Absolute
    BMI $4F02               ; [30 E0      ] Branch if Minus
    CLC                     ; [18         ] Clear Carry Flag
    BEQ $4F3D               ; [F0 18      ] Branch if Equal
    BEQ $4F3F               ; [F0 18      ] Branch if Equal
    BEQ $4F41               ; [F0 18      ] Branch if Equal
    BEQ $4F43               ; [F0 18      ] Branch if Equal
    BVS $4EC9               ; [70 9C      ] Branch if Overflow Set
    CLC                     ; [18         ] Clear Carry Flag
    JSR ($E000,X)           ; [FC 00 E0   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRA $4FB5               ; [80 78      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ASL $3E00               ; [0E 00 3E   ] Shift Left Absolute
    BRK                     ; [00 7E      ] Software interrupt
    TSB $FC                 ; [04 FC      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    JML [$8C28]             ; [DC 28 8C   ] Jump Long Indirect
    CLI                     ; [58         ] Clear Interrupt Disable
    MVN $D8,$00             ; [54 D8 00   ] Block Move Negative
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    TSB $3C38               ; [0C 38 3C   ] Test and Set Bits Absolute
    BVS $4FD2               ; [70 78      ] Branch if Overflow Set
    BEQ $4F54               ; [F0 F8      ] Branch if Equal
    BVS $4FD6               ; [70 78      ] Branch if Overflow Set
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    BIT $1038,X             ; [3C 38 10   ] Test Bits Absolute,X
    CLV                     ; [B8         ] Clear Overflow Flag
    CLV                     ; [B8         ] Clear Overflow Flag
    CPX #$FC                ; [E0 FC      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    JSR ($5E08,X)           ; [FC 08 5E   ] Jump to Subroutine Indirect,X
    BIT $8C                 ; [24 8C      ] Test Bits DP
    RTS                     ; [60         ] Return from Subroutine
    TSB $F0                 ; [04 F0      ] Test and Set Bits in DP
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    RTI                     ; [40         ] Return from Interrupt
    CPX #$18                ; [E0 18      ] Compare X Immediate
    CLI                     ; [58         ] Clear Interrupt Disable
    BPL $4F92               ; [10 18      ] Branch if Plus
    LDY #$84                ; [A0 84      ] Load Y Immediate
    BVS $4F8E               ; [70 10      ] Branch if Overflow Set
    SED                     ; [F8         ] Set Decimal Flag
    PHP                     ; [08         ] Push Processor Status
    JMP ($780F,X)           ; [7C 0F 78   ] Jump Indirect,X
    ORA $580F78,X           ; [1F 78 0F 58] OR A with Absolute Long,X
    ORA $5E1F78             ; [0F 78 1F 5E] OR A with Absolute Long
    ORA $73,S               ; [03 73      ] OR A with Stack Relative
    TRB $007F               ; [1C 7F 00   ] Test and Reset Bits Absolute
    AND $302F30,X           ; [3F 30 2F 30] AND A with Absolute Long,X
    ORA $202F00             ; [0F 00 2F 20] OR A with Absolute Long
    ORA $202300,X           ; [1F 00 23 20] OR A with Absolute Long,X
    TRB $001C               ; [1C 1C 00   ] Test and Reset Bits Absolute
    BRK                     ; [00 44      ] Software interrupt
    BEQ $4FE5               ; [F0 42      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    REP #$F8                ; [C2 F8      ] Reset Processor Status Bits
    SEP #$B8                ; [E2 B8      ] Set Processor Status Bits
    PER $C463               ; [62 B8 74   ] Push Effective Relative
    BNE $5015               ; [D0 68      ] Branch if Not Equal
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
    BRK                     ; [00 F8      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    JSR ($FC04,X)           ; [FC 04 FC   ] Jump to Subroutine Indirect,X
    TSB $BC                 ; [04 BC      ] Test and Set Bits in DP
    TSB $BC                 ; [04 BC      ] Test and Set Bits in DP
    TSB $D8                 ; [04 D8      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    BNE $4FCE               ; [D0 10      ] Branch if Not Equal

;--- Patch at file offset $144FC6 (SNES $D44FC6) ---
org $D44FC6

    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 7F      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ADC $017F02,X           ; [7F 02 7F 01] Add with Carry Absolute Long,X
    db $7E, $21                 ; Incomplete/data bytes

;--- Patch at file offset $144FD8 (SNES $D44FD8) ---
org $D44FD8

    BMI $5012               ; [30 38      ] Branch if Minus
    BIT $3E3E,X             ; [3C 3E 3E   ] Test Bits Absolute,X
    AND $0E3F1F,X           ; [3F 1F 3F 0E] AND A with Absolute Long,X
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    TSB $FC                 ; [04 FC      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    JML [$8C28]             ; [DC 28 8C   ] Jump Long Indirect
    CLI                     ; [58         ] Clear Interrupt Disable
    MVN $D8,$3C             ; [54 D8 3C   ] Block Move Negative
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    TSB $380C               ; [0C 0C 38   ] Test and Set Bits Absolute
    BIT $7870,X             ; [3C 70 78   ] Test Bits Absolute,X
    BEQ $4FF2               ; [F0 F8      ] Branch if Equal
    BVS $5074               ; [70 78      ] Branch if Overflow Set
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    AND $047F10,X           ; [3F 10 7F 04] AND A with Absolute Long,X
    ADC $046F24,X           ; [7F 24 6F 04] Add with Carry Absolute Long,X
    EOR $104000             ; [4F 00 40 10] XOR A with Absolute Long
    BVC $501D               ; [50 0F      ] Branch if Overflow Clear
    CLI                     ; [58         ] Clear Interrupt Disable
    ORA $201000             ; [0F 00 10 20] OR A with Absolute Long
    JSR $2000               ; [20 00 20   ] Jump to Subroutine
    BPL $5028               ; [10 10      ] Branch if Plus
    BMI $504A               ; [30 30      ] Branch if Minus
    AND $202F2F,X           ; [3F 2F 2F 20] AND A with Absolute Long,X
    AND $B81020             ; [2F 20 10 B8] AND A with Absolute Long
    CLV                     ; [B8         ] Clear Overflow Flag
    RTI                     ; [40         ] Return from Interrupt
    JSR ($FC00,X)           ; [FC 00 FC   ] Jump to Subroutine Indirect,X
    BPL $5067               ; [10 3E      ] Branch if Plus
    MVP $9C,$70             ; [44 9C 70   ] Block Move Positive
    CLC                     ; [18         ] Clear Carry Flag
    BCS $4FBB               ; [B0 8C      ] Branch if Carry Set
    CLV                     ; [B8         ] Clear Overflow Flag
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    BMI $5066               ; [30 30      ] Branch if Minus
    JSR $C030               ; [20 30 C0   ] Jump to Subroutine
    STY $70                 ; [84 70      ] Store Y to DP
    BRK                     ; [00 F0      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    SED                     ; [F8         ] Set Decimal Flag
    RTI                     ; [40         ] Return from Interrupt
    JML $175C0F             ; [5C 0F 5C 17] Jump Long
    BIT $2C07               ; [2C 07 2C   ] Test Bits Absolute
    ORA [$1C]               ; [07 1C      ] OR A with [DP]
    ORA [$1D]               ; [07 1D      ] OR A with [DP]
    ORA [$1C]               ; [07 1C      ] OR A with [DP]
    ORA $2F001F             ; [0F 1F 00 2F] OR A with Absolute Long
    JSR $2037               ; [20 37 20   ] Jump to Subroutine
    ORA [$10],Y             ; [17 10      ] OR A with [DP],Y
    ORA [$10],Y             ; [17 10      ] OR A with [DP],Y
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $000000             ; [0F 00 00 00] OR A with Absolute Long
    STY $CCB8               ; [8C B8 CC   ] Store Y to Absolute
    TYA                     ; [98         ] Transfer Y to A
    CPY $6498               ; [CC 98 64   ] Compare Y with Absolute
    INY                     ; [C8         ] Increment Y
    STZ $E0,X               ; [74 E0      ] Store Zero to DP,X
    STZ $E0,X               ; [74 E0      ] Store Zero to DP,X
    INX                     ; [E8         ] Increment X
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRK                     ; [00 F8      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CLV                     ; [B8         ] Clear Overflow Flag
    JSR $20B8               ; [20 B8 20   ] Jump to Subroutine
    CLD                     ; [D8         ] Clear Decimal Flag
    BPL $5061               ; [10 E8      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    INX                     ; [E8         ] Increment X
    PHP                     ; [08         ] Push Processor Status
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    JSR $58FE               ; [20 FE 58   ] Jump to Subroutine
    ADC $237F06,X           ; [7F 06 7F 23] Add with Carry Absolute Long,X
    ADC $217F20,X           ; [7F 20 7F 21] Add with Carry Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    RTS                     ; [60         ] Return from Subroutine
    JSR $3878               ; [20 78 38   ] Jump to Subroutine
    ROL $3F1C,X             ; [3E 1C 3F   ] Rotate Left Absolute,X
    ASL $1C3E,X             ; [1E 3E 1C   ] Shift Left Absolute,X
    AND $0000,X             ; [3D 00 00   ] AND A with Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $50A8               ; [80 00      ] Branch Always
    JML [$FE80]             ; [DC 80 FE   ] Jump Long Indirect
    TRB $40FE               ; [1C FE 40   ] Test and Reset Bits Absolute
    db $FE, $00                 ; Incomplete/data bytes

;--- Patch at file offset $1450B6 (SNES $D450B6) ---
org $D450B6

    BRK                     ; [00 00      ] Software interrupt
    BRA $503A               ; [80 80      ] Branch Always
    BRK                     ; [00 1C      ] Software interrupt
    BIT $FC7C,X             ; [3C 7C FC   ] Test Bits Absolute,X
    JSR ($307F,X)           ; [FC 7F 30   ] Jump to Subroutine Indirect,X
    ADC $2AFF08,X           ; [7F 08 FF 2A] Add with Carry Absolute Long,X

;--- Patch at file offset $1450CC (SNES $D450CC) ---
org $D450CC

    JMP $9C14               ; [4C 14 9C   ] Jump Absolute
    AND [$03],Y             ; [37 03      ] AND A with [DP],Y
    AND ($06,S),Y           ; [33 06      ] AND A with (SR),Y
    db $0E, $44                 ; Incomplete/data bytes

;--- Patch at file offset $1450E2 (SNES $D450E2) ---
org $D450E2

    JSR ($F808,X)           ; [FC 08 F8   ] Jump to Subroutine Indirect,X
    BPL $50E3               ; [10 FC      ] Branch if Plus
    JSR $80F4               ; [20 F4 80   ] Jump to Subroutine
    INC $FE0C,X             ; [FE 0C FE   ] Increment Absolute,X
    BIT $F6                 ; [24 F6      ] Test Bits DP
    DEY                     ; [88         ] Decrement Y
    SED                     ; [F8         ] Set Decimal Flag
    JSR ($0800,X)           ; [FC 00 08   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    JMP ($4460)             ; [6C 60 44   ] Jump Indirect
    RTS                     ; [60         ] Return from Subroutine
    DEY                     ; [88         ] Decrement Y
    BRK                     ; [00 99      ] Software interrupt
    AND [$99],Y             ; [37 99      ] AND A with [DP],Y
    AND $B12F99             ; [2F 99 2F B1] AND A with Absolute Long
    EOR $611EF1,X           ; [5F F1 1E 61] XOR A with Absolute Long,X
    db $3E                      ; Incomplete/data bytes

;--- Patch at file offset $145113 (SNES $D45113) ---
org $D45113

    RTI                     ; [40         ] Return from Interrupt
    ADC $005F40             ; [6F 40 5F 00] Add with Carry Absolute Long
    ASL $3E00,X             ; [1E 00 3E   ] Shift Left Absolute,X
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E6      ] Software interrupt
    JML [$9CC6]             ; [DC C6 9C   ] Jump Long Indirect
    STX $3C                 ; [86 3C      ] Store X to DP
    STX $1C38               ; [8E 38 1C   ] Store X to Absolute
    RTS                     ; [60         ] Return from Subroutine
    JSR ($F818,X)           ; [FC 18 F8   ] Jump to Subroutine Indirect,X
    BEQ $511F               ; [F0 F0      ] Branch if Equal
    BRK                     ; [00 DC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    JSR $407C               ; [20 7C 40   ] Jump to Subroutine
    SEI                     ; [78         ] Set Interrupt Disable
    RTI                     ; [40         ] Return from Interrupt
    CPX #$80                ; [E0 80      ] Compare X Immediate
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 F0      ] Software interrupt

;--- Patch at file offset $145146 (SNES $D45146) ---
org $D45146

    BRK                     ; [00 00      ] Software interrupt
    AND $7F00,Y             ; [39 00 7F   ] AND A with Absolute,Y
    PHP                     ; [08         ] Push Processor Status
    ADC $017F02,X           ; [7F 02 7F 01] Add with Carry Absolute Long,X

;--- Patch at file offset $145158 (SNES $D45158) ---
org $D45158

    BRK                     ; [00 00      ] Software interrupt
    AND ($39),Y             ; [31 39      ] AND A with (DP),Y
    BIT $3E3E,X             ; [3C 3E 3E   ] Test Bits Absolute,X
    AND $0E0000,X           ; [3F 00 00 0E] AND A with Absolute Long,X
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    TSB $FC                 ; [04 FC      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    JML [$8C38]             ; [DC 38 8C   ] Jump Long Indirect
    CLI                     ; [58         ] Clear Interrupt Disable
    MVN $D8,$00             ; [54 D8 00   ] Block Move Negative
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    TSB $3C38               ; [0C 38 3C   ] Test and Set Bits Absolute
    BEQ $5172               ; [F0 F8      ] Branch if Equal
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BEQ $5176               ; [F0 F8      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    SED                     ; [F8         ] Set Decimal Flag
    ROR $3F21,X             ; [7E 21 3F   ] Rotate Right Absolute,X
    ORA ($1F),Y             ; [11 1F      ] OR A with (DP),Y
    BRK                     ; [00 0F      ] Software interrupt
    COP #$0F                ; [02 0F      ] Coprocessor interrupt
    TSB $1F                 ; [04 1F      ] Test and Set Bits in DP
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 7F      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA $11003F,X           ; [1F 3F 00 11] OR A with Absolute Long,X

;--- Patch at file offset $14519A (SNES $D4519A) ---
org $D4519A

    BRK                     ; [00 00      ] Software interrupt
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    BPL $51B8               ; [10 18      ] Branch if Plus
    BIT $1838,X             ; [3C 38 18   ] Test Bits Absolute,X
    BCS $514D               ; [B0 A8      ] Branch if Carry Set
    BEQ $51A3               ; [F0 FC      ] Branch if Equal
    CLI                     ; [58         ] Clear Interrupt Disable
    JSR ($9E28,X)           ; [FC 28 9E   ] Jump to Subroutine Indirect,X
    BIT $3C                 ; [24 3C      ] Test Bits DP
    BVS $5227               ; [70 78      ] Branch if Overflow Set
    BEQ $5179               ; [F0 C8      ] Branch if Equal
    INY                     ; [C8         ] Increment Y
    BEQ $51A4               ; [F0 F0      ] Branch if Equal
    BVC $51A6               ; [50 F0      ] Branch if Overflow Clear
    JSR $1078               ; [20 78 10   ] Jump to Subroutine
    SEC                     ; [38         ] Set Carry Flag
    PLA                     ; [68         ] Pull Accumulator
    JMP $80F0               ; [4C F0 80   ] Jump Absolute
    BEQ $51C0               ; [F0 00      ] Branch if Equal
    ROR $3F21,X             ; [7E 21 3F   ] Rotate Right Absolute,X
    ORA ($1F),Y             ; [11 1F      ] OR A with (DP),Y
    BRK                     ; [00 0F      ] Software interrupt
    COP #$0F                ; [02 0F      ] Coprocessor interrupt
    TSB $1F                 ; [04 1F      ] Test and Set Bits in DP
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 7F      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA $11003F,X           ; [1F 3F 00 11] OR A with Absolute Long,X

;--- Patch at file offset $1451DA (SNES $D451DA) ---
org $D451DA

    BRK                     ; [00 00      ] Software interrupt
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    BPL $51F8               ; [10 18      ] Branch if Plus
    BIT $1838,X             ; [3C 38 18   ] Test Bits Absolute,X
    BCS $518D               ; [B0 A8      ] Branch if Carry Set
    BEQ $51E3               ; [F0 FC      ] Branch if Equal
    CLI                     ; [58         ] Clear Interrupt Disable
    JSR ($9E28,X)           ; [FC 28 9E   ] Jump to Subroutine Indirect,X
    BIT $3C                 ; [24 3C      ] Test Bits DP
    BVS $5267               ; [70 78      ] Branch if Overflow Set
    BEQ $51B9               ; [F0 C8      ] Branch if Equal
    INY                     ; [C8         ] Increment Y
    BEQ $51E4               ; [F0 F0      ] Branch if Equal
    BVC $51E6               ; [50 F0      ] Branch if Overflow Clear
    JSR $1078               ; [20 78 10   ] Jump to Subroutine
    SEC                     ; [38         ] Set Carry Flag
    PLA                     ; [68         ] Pull Accumulator
    JMP $80F0               ; [4C F0 80   ] Jump Absolute
    BEQ $5200               ; [F0 00      ] Branch if Equal
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    CLC                     ; [18         ] Clear Carry Flag
    ORA [$27]               ; [07 27      ] OR A with [DP]
    ORA $102F,Y             ; [19 2F 10   ] OR A with Absolute,Y
    db $59, $20                 ; Incomplete/data bytes

;--- Patch at file offset $145216 (SNES $D45216) ---
org $D45216

    BRK                     ; [00 00      ] Software interrupt
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    TSB $19                 ; [04 19      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    ASL $17,X               ; [16 17      ] Shift Left DP,X
    PLP                     ; [28         ] Pull Processor Status
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
    MVN $70,$51             ; [54 70 51   ] Block Move Negative
    JSR $002C               ; [20 2C 00   ] Jump to Subroutine
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BMI $524C               ; [30 00      ] Branch if Minus
    EOR $7700,Y             ; [59 00 77   ] XOR A with Absolute,Y
    BMI $5258               ; [30 07      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    ORA $10,S               ; [03 10      ] OR A with Stack Relative
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
    BRA $527D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $5295               ; [90 1C      ] Branch if Carry Clear
    BRA $52BF               ; [80 44      ] Branch Always
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
    BVS $52CD               ; [70 3F      ] Branch if Overflow Set
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

;--- Patch at file offset $1452C4 (SNES $D452C4) ---
org $D452C4

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    CLC                     ; [18         ] Clear Carry Flag
    ORA [$27]               ; [07 27      ] OR A with [DP]
    ORA $112F,Y             ; [19 2F 11   ] OR A with Absolute,Y
    TCD                     ; [5B         ] Transfer A to Direct Page
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $1452D6 (SNES $D452D6) ---
org $D452D6

    BRK                     ; [00 00      ] Software interrupt
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    TSB $19                 ; [04 19      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    ORA $16,X               ; [15 16      ] OR A with DP,X
    PLP                     ; [28         ] Pull Processor Status
    BRK                     ; [00 00      ] Software interrupt
    TRB $E400               ; [1C 00 E4   ] Test and Reset Bits Absolute
    CLC                     ; [18         ] Clear Carry Flag
    BIT $F8,X               ; [34 F8      ] Test Bits DP,X
    CPX $EEF0               ; [EC F0 EE   ] Compare X with Absolute
    BEQ $52BB               ; [F0 CE      ] Branch if Equal
    BEQ $52CD               ; [F0 DE      ] Branch if Equal
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    INY                     ; [C8         ] Increment Y
    SED                     ; [F8         ] Set Decimal Flag
    BPL $52EA               ; [10 F0      ] Branch if Plus
    BPL $52F0               ; [10 F4      ] Branch if Plus
    BMI $52F2               ; [30 F4      ] Branch if Minus
    PLP                     ; [28         ] Pull Processor Status
    CPX $51                 ; [E4 51      ] Compare X with DP
    JSR $0022               ; [20 22 00   ] Jump to Subroutine
    TRB $1402               ; [1C 02 14   ] Test and Reset Bits Absolute
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $36                 ; [06 36      ] Shift Left DP
    BRK                     ; [00 59      ] Software interrupt
    BRK                     ; [00 69      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    ORA [$38]               ; [07 38      ] OR A with [DP]
    TSB $0011               ; [0C 11 00   ] Test and Set Bits Absolute
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
    BVS $5399               ; [70 68      ] Branch if Overflow Set
    RTS                     ; [60         ] Return from Subroutine
    JSR $08C8               ; [20 C8 08   ] Jump to Subroutine
    CPX $48                 ; [E4 48      ] Compare X with DP
    STY $0C,X               ; [94 0C      ] Store Y to DP,X
    BPL $539B               ; [10 60      ] Branch if Plus
    BRK                     ; [00 68      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BVS $53A0               ; [70 60      ] Branch if Overflow Set
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
    BEQ $52F2               ; [F0 80      ] Branch if Equal
    PLA                     ; [68         ] Pull Accumulator
    PHP                     ; [08         ] Push Processor Status
    STY $C41C               ; [8C 1C C4   ] Store Y to Absolute
    TRB $0CE4               ; [1C E4 0C   ] Test and Reset Bits Absolute
    CPX #$0C                ; [E0 0C      ] Compare X Immediate
    BEQ $5382               ; [F0 04      ] Branch if Equal
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
    BEQ $53C0               ; [F0 04      ] Branch if Equal
    BEQ $53C2               ; [F0 04      ] Branch if Equal

;--- Patch at file offset $1453CC (SNES $D453CC) ---
org $D453CC

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]

;--- Patch at file offset $1453DE (SNES $D453DE) ---
org $D453DE

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1453EA (SNES $D453EA) ---
org $D453EA

    TRB $E400               ; [1C 00 E4   ] Test and Reset Bits Absolute
    CLC                     ; [18         ] Clear Carry Flag
    db $34                      ; Incomplete/data bytes

;--- Patch at file offset $1453FA (SNES $D453FA) ---
org $D453FA

    BRK                     ; [00 00      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    INY                     ; [C8         ] Increment Y
    SED                     ; [F8         ] Set Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    ORA [$2F]               ; [07 2F      ] OR A with [DP]
    BPL $5464               ; [10 5F      ] Branch if Plus
    JSR $2051               ; [20 51 20   ] Jump to Subroutine
    BVS $540A               ; [70 00      ] Branch if Overflow Set
    AND $00,X               ; [35 00      ] AND A with DP,X
    ORA $1500,X             ; [1D 00 15   ] OR A with Absolute,X
    ORA $0701               ; [0D 01 07   ] OR A with Absolute
    ASL $1810               ; [0E 10 18   ] Shift Left Absolute
    ROL $07                 ; [26 07      ] Rotate Left DP
    SEC                     ; [38         ] Set Carry Flag
    ROL $0211               ; [2E 11 02   ] Rotate Left Absolute
    CLC                     ; [18         ] Clear Carry Flag
    COP #$00                ; [02 00      ] Coprocessor interrupt
    COP #$00                ; [02 00      ] Coprocessor interrupt
    CPX $CEF0               ; [EC F0 CE   ] Compare X with Absolute
    BEQ $5403               ; [F0 DE      ] Branch if Equal
    CPX #$9C                ; [E0 9C      ] Compare X Immediate
    RTS                     ; [60         ] Return from Subroutine
    JSR ($7C00,X)           ; [FC 00 7C   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRA $5441               ; [80 10      ] Branch Always
    BEQ $5463               ; [F0 30      ] Branch if Equal
    PEA $E428               ; [F4 28 E4   ] Push Effective Absolute
    PLA                     ; [68         ] Pull Accumulator
    RTS                     ; [60         ] Return from Subroutine
    BRA $5442               ; [80 08      ] Branch Always
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
    BMI $549A               ; [30 3F      ] Branch if Minus
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
    BPL $548C               ; [10 00      ] Branch if Plus
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
    BRK                     ; [00 3F      ] Software interrupt
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
    BMI $54DF               ; [30 FC      ] Branch if Minus
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 1E      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 AC      ] Software interrupt
    INY                     ; [C8         ] Increment Y
    LDY $30,X               ; [B4 30      ] Load Y from DP,X
    PLA                     ; [68         ] Pull Accumulator
    BRA $54FD               ; [80 08      ] Branch Always
    CPX #$58                ; [E0 58      ] Compare X Immediate
    BRA $5515               ; [80 1C      ] Branch Always
    BRK                     ; [00 EC      ] Software interrupt
    CPX #$30                ; [E0 30      ] Compare X Immediate
    BIT $58,X               ; [34 58      ] Test Bits DP,X
    CLD                     ; [D8         ] Clear Decimal Flag
    AND [$05]               ; [27 05      ] AND A with [DP]
    AND [$05]               ; [27 05      ] AND A with [DP]
    ORA $192B00,X           ; [1F 00 2B 19] OR A with Absolute Long,X
    ROL                     ; [2A         ] Rotate Left Accumulator
    ORA $3F56,Y             ; [19 56 3F   ] OR A with Absolute,Y
    RTS                     ; [60         ] Return from Subroutine
    AND $1C007F,X           ; [3F 7F 00 1C] AND A with Absolute Long,X
    ORA $1C                 ; [05 1C      ] OR A with Direct Page
    ORA $00                 ; [05 00      ] OR A with Direct Page
    BRK                     ; [00 1F      ] Software interrupt
    ASL $1E1F,X             ; [1E 1F 1E   ] Shift Left Absolute,X
    AND $203F26,X           ; [3F 26 3F 20] AND A with Absolute Long,X
    BRK                     ; [00 00      ] Software interrupt
    TSB $F0                 ; [04 F0      ] Test and Set Bits in DP
    DEY                     ; [88         ] Decrement Y
    BEQ $54AD               ; [F0 88      ] Branch if Equal
    BEQ $550B               ; [F0 E4      ] Branch if Equal
    SEI                     ; [78         ] Set Interrupt Disable
    PEA $7EB8               ; [F4 B8 7E   ] Push Effective Absolute
    CPY $F03E               ; [CC 3E F0   ] Compare Y with Absolute
    JSR ($F800,X)           ; [FC 00 F8   ] Jump to Subroutine Indirect,X
    SED                     ; [F8         ] Set Decimal Flag
    BVS $5524               ; [70 F0      ] Branch if Overflow Set
    BVS $5526               ; [70 F0      ] Branch if Overflow Set
    CLC                     ; [18         ] Clear Carry Flag
    SEI                     ; [78         ] Set Interrupt Disable
    DEY                     ; [88         ] Decrement Y
    SEC                     ; [38         ] Set Carry Flag
    CPY #$0C                ; [C0 0C      ] Compare Y Immediate
    BEQ $553E               ; [F0 00      ] Branch if Equal
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
    BMI $555F               ; [30 FC      ] Branch if Minus
    BRK                     ; [00 E4      ] Software interrupt
    BRK                     ; [00 E4      ] Software interrupt
    JSR $30FE               ; [20 FE 30   ] Jump to Subroutine
    DEC $9E70,X             ; [DE 70 9E   ] Decrement Absolute,X
    BVS $558B               ; [70 1C      ] Branch if Overflow Set
    BEQ $5525               ; [F0 B4      ] Branch if Equal
    BMI $55D3               ; [30 60      ] Branch if Minus
    BRA $558D               ; [80 18      ] Branch Always
    CPY #$38                ; [C0 38      ] Compare Y Immediate
    LDY #$30                ; [A0 30      ] Load Y Immediate
    BMI $55EF               ; [30 74      ] Branch if Minus
    BPL $55ED               ; [10 70      ] Branch if Plus
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
    BEQ $55C0               ; [F0 04      ] Branch if Equal
    CPX #$04                ; [E0 04      ] Compare X Immediate

;--- Patch at file offset $1455C4 (SNES $D455C4) ---
org $D455C4

    ORA [$00]               ; [07 00      ] OR A with [DP]
    CLC                     ; [18         ] Clear Carry Flag
    ORA [$27]               ; [07 27      ] OR A with [DP]
    ORA $102F,Y             ; [19 2F 10   ] OR A with Absolute,Y
    EOR $5120,Y             ; [59 20 51   ] XOR A with Absolute,Y
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $1455D7 (SNES $D455D7) ---
org $D455D7

    ORA [$04]               ; [07 04      ] OR A with [DP]
    ORA $1608,Y             ; [19 08 16   ] OR A with Absolute,Y
    ORA [$28],Y             ; [17 28      ] OR A with [DP],Y
    ORA [$38]               ; [07 38      ] OR A with [DP]
    BRK                     ; [00 00      ] Software interrupt
    ROL $C200,X             ; [3E 00 C2   ] Rotate Left Absolute,X
    BIT $F8F4,X             ; [3C F4 F8   ] Test Bits Absolute,X
    CPX $F8                 ; [E4 F8      ] Compare X with DP
    INC $F8                 ; [E6 F8      ] Increment DP
    LDX $CE70               ; [AE 70 CE   ] Load X from Absolute
    BMI $55F1               ; [30 00      ] Branch if Minus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BIT $F808,X             ; [3C 08 F8   ] Test Bits Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    MVN $70,$B4             ; [54 70 B4   ] Block Move Negative
    BMI $563D               ; [30 3C      ] Branch if Minus
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
    BVS $55E7               ; [70 BE      ] Branch if Overflow Set
    RTS                     ; [60         ] Return from Subroutine
    TRB $38E0               ; [1C E0 38   ] Test and Reset Bits Absolute
    CPX #$68                ; [E0 68      ] Compare X Immediate
    BNE $5675               ; [D0 44      ] Branch if Not Equal
    BRA $5667               ; [80 34      ] Branch Always
    BRA $5659               ; [80 24      ] Branch Always
    BPL $56AB               ; [10 74      ] Branch if Plus
    BVS $56A1               ; [70 68      ] Branch if Overflow Set
    BIT $E8                 ; [24 E8      ] Test Bits DP
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 D0      ] Software interrupt
    BPL $565F               ; [10 1E      ] Branch if Plus
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
    BCS $56CB               ; [B0 68      ] Branch if Carry Set
    BCS $56C9               ; [B0 64      ] Branch if Carry Set
    CLV                     ; [B8         ] Clear Overflow Flag
    STZ $D8,X               ; [74 D8      ] Store Zero to DP,X
    STZ $D8,X               ; [74 D8      ] Store Zero to DP,X
    SEI                     ; [78         ] Set Interrupt Disable
    JML [$E8FC]             ; [DC FC E8   ] Jump Long Indirect
    JSR ($9080,X)           ; [FC 80 90   ] Jump to Subroutine Indirect,X
    BMI $5603               ; [30 90      ] Branch if Minus
    BMI $560D               ; [30 98      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    INY                     ; [C8         ] Increment Y
    CLC                     ; [18         ] Clear Carry Flag
    INY                     ; [C8         ] Increment Y
    CLC                     ; [18         ] Clear Carry Flag
    CPY $1C                 ; [C4 1C      ] Compare Y with DP
    CPX #$08                ; [E0 08      ] Compare X Immediate
    BRA $5600               ; [80 80      ] Branch Always
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
    BMI $56BE               ; [30 CC      ] Branch if Minus
    DEY                     ; [88         ] Decrement Y
    STZ $98,X               ; [74 98      ] Store Zero to DP,X
    MVP $90,$28             ; [44 90 28   ] Block Move Positive
    BRA $575A               ; [80 60      ] Branch Always
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
    BRL $1A0E               ; [82 DA C2   ] Branch Long

;--- Patch at file offset $14573B (SNES $D4573B) ---
org $D4573B

    db $9E                      ; Incomplete/data bytes

;--- Patch at file offset $145744 (SNES $D45744) ---
org $D45744

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    CLC                     ; [18         ] Clear Carry Flag
    ORA [$27]               ; [07 27      ] OR A with [DP]
    ORA $112F,Y             ; [19 2F 11   ] OR A with Absolute,Y
    db $5F, $20                 ; Incomplete/data bytes

;--- Patch at file offset $145756 (SNES $D45756) ---
org $D45756

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
    BEQ $573B               ; [F0 CE      ] Branch if Equal
    BEQ $574D               ; [F0 DE      ] Branch if Equal
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    INY                     ; [C8         ] Increment Y
    SED                     ; [F8         ] Set Decimal Flag
    BPL $576A               ; [10 F0      ] Branch if Plus
    BPL $5770               ; [10 F4      ] Branch if Plus
    BMI $5772               ; [30 F4      ] Branch if Minus
    PLP                     ; [28         ] Pull Processor Status
    CPX $51                 ; [E4 51      ] Compare X with DP
    JSR $0070               ; [20 70 00   ] Jump to Subroutine
    AND ($00)               ; [32 00      ] AND A with (DP)
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    BPL $578A               ; [10 00      ] Branch if Plus
    ADC $005D00             ; [6F 00 5D 00] Add with Carry Absolute Long
    BIT $0318               ; [2C 18 03   ] Test Bits Absolute
    BIT $102F,X             ; [3C 2F 10   ] Test Bits Absolute,X
    TSB $0A01               ; [0C 01 0A   ] Test and Set Bits Absolute
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($10,X)             ; [01 10      ] OR A with (DP,X)
    BPL $57BF               ; [10 22      ] Branch if Plus
    JSR $081B               ; [20 1B 08   ] Jump to Subroutine
    STZ $FC60               ; [9C 60 FC   ] Store Zero to Absolute
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 24      ] Software interrupt
    BRK                     ; [00 D8      ] Software interrupt
    BVS $5819               ; [70 68      ] Branch if Overflow Set
    RTS                     ; [60         ] Return from Subroutine
    CPX #$08                ; [E0 08      ] Compare X Immediate
    PHP                     ; [08         ] Push Processor Status
    CPX $48                 ; [E4 48      ] Compare X with DP
    STY $0C,X               ; [94 0C      ] Store Y to DP,X
    BPL $573B               ; [10 80      ] Branch if Plus
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    BVS $5810               ; [70 50      ] Branch if Overflow Set
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BVS $57C4               ; [70 00      ] Branch if Overflow Set
    AND ($00)               ; [32 00      ] AND A with (DP)
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    BPL $57CA               ; [10 00      ] Branch if Plus
    RTL                     ; [6B         ] Return from Subroutine Long
    BRK                     ; [00 5D      ] Software interrupt
    BRK                     ; [00 2C      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    ORA $3C,S               ; [03 3C      ] OR A with Stack Relative
    AND $010C10             ; [2F 10 0C 01] AND A with Absolute Long
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($14,X)             ; [01 14      ] OR A with (DP,X)
    TRB $22                 ; [14 22      ] Test and Reset Bits DP
    JSR $081B               ; [20 1B 08   ] Jump to Subroutine
    STZ $FC60               ; [9C 60 FC   ] Store Zero to Absolute
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 24      ] Software interrupt
    BRK                     ; [00 D8      ] Software interrupt
    BVS $5859               ; [70 68      ] Branch if Overflow Set
    RTS                     ; [60         ] Return from Subroutine
    CPX #$08                ; [E0 08      ] Compare X Immediate
    PHP                     ; [08         ] Push Processor Status
    CPX $48                 ; [E4 48      ] Compare X with DP
    STY $0C,X               ; [94 0C      ] Store Y to DP,X
    BPL $577B               ; [10 80      ] Branch if Plus
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    BVS $5850               ; [70 50      ] Branch if Overflow Set
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
    BPL $584F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BEQ $5826               ; [F0 00      ] Branch if Equal
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
    BNE $5849               ; [D0 10      ] Branch if Not Equal
    JSR $5880               ; [20 80 58   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $7600,X             ; [3C 00 76   ] Test Bits Absolute,X
    TSB $54                 ; [04 54      ] Test and Set Bits in DP
    ROL $54                 ; [26 54      ] Rotate Left DP
    ROL $61                 ; [26 61      ] Rotate Left DP
    BMI $5886               ; [30 39      ] Branch if Minus
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
    BRA $58BD               ; [80 48      ] Branch Always
    LDY #$44                ; [A0 44      ] Load Y Immediate
    BRA $5895               ; [80 1C      ] Branch Always
    LDY #$30                ; [A0 30      ] Load Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    PLA                     ; [68         ] Pull Accumulator
    DEY                     ; [88         ] Decrement Y
    BPL $5898               ; [10 18      ] Branch if Plus
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
    BVS $5868               ; [70 C0      ] Branch if Overflow Set
    BMI $588A               ; [30 E0      ] Branch if Minus
    BEQ $588C               ; [F0 E0      ] Branch if Equal
    DEY                     ; [88         ] Decrement Y
    BRA $589F               ; [80 F0      ] Branch Always
    BRK                     ; [00 F0      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 30      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BVS $58AE               ; [70 F0      ] Branch if Overflow Set
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
    BPL $590F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BEQ $58E6               ; [F0 00      ] Branch if Equal
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
    BNE $5909               ; [D0 10      ] Branch if Not Equal
    JSR $5880               ; [20 80 58   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    AND ($00)               ; [32 00      ] AND A with (DP)
    TRB $7402               ; [1C 02 74   ] Test and Reset Bits Absolute
    ASL $DC                 ; [06 DC      ] Shift Left DP
    RTS                     ; [60         ] Return from Subroutine
    ADC ($00,S),Y           ; [73 00      ] Add with Carry (SR),Y
    ADC ($11,S),Y           ; [73 11      ] Add with Carry (SR),Y
    ADC $390609,X           ; [7F 09 06 39] Add with Carry Absolute Long,X
    TSB $19                 ; [04 19      ] Test and Set Bits in DP
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
    BRA $597D               ; [80 48      ] Branch Always
    LDY #$00                ; [A0 00      ] Load Y Immediate
    BRA $59B5               ; [80 7C      ] Branch Always
    BPL $59B3               ; [10 78      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    SEI                     ; [78         ] Set Interrupt Disable
    SEI                     ; [78         ] Set Interrupt Disable
    BCS $5978               ; [B0 38      ] Branch if Carry Set
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
    BEQ $5981               ; [F0 18      ] Branch if Equal
    BEQ $5963               ; [F0 F8      ] Branch if Equal
    BEQ $5931               ; [F0 C4      ] Branch if Equal
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
    BMI $5A17               ; [30 70      ] Branch if Minus
    CPY #$38                ; [C0 38      ] Compare Y Immediate
    BEQ $599F               ; [F0 F4      ] Branch if Equal
    BEQ $5991               ; [F0 E4      ] Branch if Equal
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BRK                     ; [00 F0      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 30      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $59BA               ; [F0 00      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    PHP                     ; [08         ] Push Processor Status
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag

;--- Patch at file offset $1459CA (SNES $D459CA) ---
org $D459CA

    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    db $03                      ; Incomplete/data bytes

;--- Patch at file offset $1459DE (SNES $D459DE) ---
org $D459DE

    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $1459E8 (SNES $D459E8) ---
org $D459E8

    BRK                     ; [00 00      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 8C      ] Software interrupt
    BVS $59E5               ; [70 F6      ] Branch if Overflow Set
    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $1459FA (SNES $D459FA) ---
org $D459FA

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 78      ] Software interrupt
    TRB $A8                 ; [14 A8      ] Test and Reset Bits DP
    ORA [$00]               ; [07 00      ] OR A with [DP]
    AND $047F03,X           ; [3F 03 7F 04] AND A with Absolute Long,X
    BIT $3000,X             ; [3C 00 30   ] Test Bits Absolute,X
    BRK                     ; [00 13      ] Software interrupt
    BRK                     ; [00 2E      ] Software interrupt
    ORA ($2A,S),Y           ; [13 2A      ] OR A with (SR),Y
    ORA ($03,S),Y           ; [13 03      ] OR A with (SR),Y
    BRK                     ; [00 00      ] Software interrupt
    ORA $38,S               ; [03 38      ] OR A with Stack Relative
    AND $0300,X             ; [3D 00 03   ] AND A with Absolute,X
    ORA [$08],Y             ; [17 08      ] OR A with [DP],Y
    BRK                     ; [00 0C      ] Software interrupt
    BPL $5A1E               ; [10 00      ] Branch if Plus
    db $14                      ; Incomplete/data bytes

;--- Patch at file offset $145A26 (SNES $D45A26) ---
org $D45A26

    ROR $7E00,X             ; [7E 00 7E   ] Rotate Right Absolute,X
    BRK                     ; [00 7D      ] Software interrupt
    COP #$59                ; [02 59      ] Coprocessor interrupt
    ASL $5A                 ; [06 5A      ] Shift Left DP
    TSB $88                 ; [04 88      ] Test and Set Bits in DP
    LSR $64,X               ; [56 64      ] Shift Right DP,X
    TXA                     ; [8A         ] Transfer X to A
    TSB $F2                 ; [04 F2      ] Test and Set Bits in DP

;--- Patch at file offset $145A3C (SNES $D45A3C) ---
org $D45A3C

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
    PER $3C95               ; [62 30 E2   ] Push Effective Relative
    JSR $A0B6               ; [20 B6 A0   ] Jump to Subroutine
    ROL $F624,X             ; [3E 24 F6   ] Rotate Left Absolute,X
    PHP                     ; [08         ] Push Processor Status
    REP #$C0                ; [C2 C0      ] Reset Processor Status Bits
    JSR ($0800,X)           ; [FC 00 08   ] Jump to Subroutine Indirect,X
    BNE $5A8F               ; [D0 1C      ] Branch if Not Equal
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
    BPL $5AC6               ; [10 39      ] Branch if Plus
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
    BVS $5AEB               ; [70 FC      ] Branch if Overflow Set
    BRA $5AB5               ; [80 C4      ] Branch Always
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $5B3D               ; [80 48      ] Branch Always
    LDY #$00                ; [A0 00      ] Load Y Immediate
    BRA $5B11               ; [80 18      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    STZ $80,X               ; [74 80      ] Store Zero to DP,X
    STZ $00,X               ; [74 00      ] Store Zero to DP,X
    PHP                     ; [08         ] Push Processor Status
    BRA $5B28               ; [80 27      ] Branch Always
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
    BRA $5B13               ; [80 F0      ] Branch Always
    JSR $70B8               ; [20 B8 70   ] Jump to Subroutine
    CLC                     ; [18         ] Clear Carry Flag
    BEQ $5B5D               ; [F0 34      ] Branch if Equal
    BEQ $5B1F               ; [F0 F4      ] Branch if Equal
    BEQ $5B15               ; [F0 E8      ] Branch if Equal
    CPX #$F0                ; [E0 F0      ] Compare X Immediate
    BRK                     ; [00 50      ] Software interrupt
    CPY #$20                ; [C0 20      ] Compare Y Immediate
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 F8      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    INX                     ; [E8         ] Increment X
    CLC                     ; [18         ] Clear Carry Flag
    BPL $5B2E               ; [10 F0      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BEQ $5B46               ; [F0 00      ] Branch if Equal
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
    BNE $5B69               ; [D0 10      ] Branch if Not Equal
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
    BMI $5B67               ; [30 F8      ] Branch if Minus
    BPL $5B35               ; [10 C4      ] Branch if Plus
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine
    BRA $5BCD               ; [80 58      ] Branch Always
    BRA $5BCF               ; [80 58      ] Branch Always
    BRA $5BB1               ; [80 38      ] Branch Always
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
    BEQ $5BE1               ; [F0 38      ] Branch if Equal
    BEQ $5B9F               ; [F0 F4      ] Branch if Equal
    BEQ $5B91               ; [F0 E4      ] Branch if Equal
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BRK                     ; [00 C0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BEQ $5BB8               ; [F0 00      ] Branch if Equal
    BEQ $5BBA               ; [F0 00      ] Branch if Equal
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
    BPL $5C0D               ; [10 2F      ] Branch if Plus
    ASL $39                 ; [06 39      ] Shift Left DP
    BRK                     ; [00 00      ] Software interrupt
    BEQ $5BE4               ; [F0 00      ] Branch if Equal
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
    BNE $5C07               ; [D0 10      ] Branch if Not Equal
    JSR $5880               ; [20 80 58   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    CPY $28                 ; [C4 28      ] Compare Y with DP
    BIT $3600,X             ; [3C 00 36   ] Test Bits Absolute,X
    TSB $54                 ; [04 54      ] Test and Set Bits in DP
    ASL $74                 ; [06 74      ] Shift Left DP
    ROL $21                 ; [26 21      ] Rotate Left DP
    BPL $5C34               ; [10 29      ] Branch if Plus
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
    BMI $5C27               ; [30 FE      ] Branch if Minus
    BRK                     ; [00 FC      ] Software interrupt
    BPL $5C25               ; [10 F8      ] Branch if Plus
    BPL $5C27               ; [10 F8      ] Branch if Plus
    BCC $5C75               ; [90 44      ] Branch if Carry Clear
    BRA $5C57               ; [80 24      ] Branch Always
    BCC $5C59               ; [90 24      ] Branch if Carry Clear
    BCC $5CAB               ; [90 74      ] Branch if Carry Clear
    BVS $5CA1               ; [70 68      ] Branch if Overflow Set
    STZ $E0                 ; [64 E0      ] Store Zero to DP
    BEQ $5C1D               ; [F0 E0      ] Branch if Equal
    BEQ $5C9F               ; [F0 60      ] Branch if Equal
    BEQ $5C57               ; [F0 16      ] Branch if Equal
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
    BEQ $5C42               ; [F0 E0      ] Branch if Equal
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    BVS $5C46               ; [70 E0      ] Branch if Overflow Set
    BVS $5C48               ; [70 E0      ] Branch if Overflow Set
    INX                     ; [E8         ] Increment X
    CPX #$98                ; [E0 98      ] Compare X Immediate
    BRA $5CCD               ; [80 60      ] Branch Always
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BEQ $5C8A               ; [F0 10      ] Branch if Equal
    CPX #$60                ; [E0 60      ] Compare X Immediate
    BRA $5BFE               ; [80 80      ] Branch Always
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
    BPL $5C9B               ; [10 F4      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    PEA $FC08               ; [F4 08 FC   ] Push Effective Absolute
    BRK                     ; [00 5A      ] Software interrupt
    LDY $BF                 ; [A4 BF      ] Load Y from DP
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BPL $5CE7               ; [10 30      ] Branch if Plus
    DEY                     ; [88         ] Decrement Y
    CPY #$18                ; [C0 18      ] Compare Y Immediate
    INY                     ; [C8         ] Increment Y
    JSR $AC40               ; [20 40 AC   ] Jump to Subroutine
    LDY $52                 ; [A4 52      ] Load Y from DP
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BVS $5CC4               ; [70 00      ] Branch if Overflow Set
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 55      ] Software interrupt
    JSR $0070               ; [20 70 00   ] Jump to Subroutine
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 67      ] Software interrupt
    BRK                     ; [00 67      ] Software interrupt
    JSL $0F3F00             ; [22 00 3F 0F] Jump to Subroutine Long
    BMI $5CDC               ; [30 07      ] Branch if Minus
    BPL $5D01               ; [10 2A      ] Branch if Plus
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    ASL $18                 ; [06 18      ] Shift Left DP
    BRK                     ; [00 31      ] Software interrupt
    PLD                     ; [2B         ] Pull Direct Page Register
    SBC $007F00,X           ; [FF 00 7F 00] Subtract with Borrow Absolute Long,X
    db $F3                      ; Incomplete/data bytes

;--- Patch at file offset $145CEB (SNES $D45CEB) ---
org $D45CEB

    COP #$9F                ; [02 9F      ] Coprocessor interrupt
    ORA ($9F)               ; [12 9F      ] OR A with (DP)
    ASL $46,X               ; [16 46      ] Shift Left DP,X
    BCS $5D13               ; [B0 20      ] Branch if Carry Set
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

;--- Patch at file offset $145D24 (SNES $D45D24) ---
org $D45D24

    db $FE                      ; Incomplete/data bytes

;--- Patch at file offset $145D30 (SNES $D45D30) ---
org $D45D30

    BVS $5DAE               ; [70 7C      ] Branch if Overflow Set
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $145D42 (SNES $D45D42) ---
org $D45D42

    BRK                     ; [00 00      ] Software interrupt
    BMI $5D46               ; [30 00      ] Branch if Minus
    AND $001F00,X           ; [3F 00 1F 00] AND A with Absolute Long,X
    AND $102F14             ; [2F 14 2F 10] AND A with Absolute Long
    CLI                     ; [58         ] Clear Interrupt Disable
    AND ($00,X)             ; [21 00      ] AND A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    BPL $5D65               ; [10 0C      ] Branch if Plus
    ORA $1602               ; [0D 02 16   ] OR A with Absolute
    ORA #$10                ; [09 10      ] OR A with Immediate
    BPL $5D8F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BEQ $5D66               ; [F0 00      ] Branch if Equal
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
    BNE $5D89               ; [D0 10      ] Branch if Not Equal
    JSR $5880               ; [20 80 58   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INY                     ; [C8         ] Increment Y
    EOR $7120,Y             ; [59 20 71   ] XOR A with Absolute,Y
    BRK                     ; [00 50      ] Software interrupt
    BRK                     ; [00 72      ] Software interrupt
    JSR $0074               ; [20 74 00   ] Jump to Subroutine
    BVS $5D8C               ; [70 00      ] Branch if Overflow Set
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
    BPL $5DA1               ; [10 FC      ] Branch if Plus
    PLP                     ; [28         ] Pull Processor Status
    JSR ($FE00,X)           ; [FC 00 FE   ] Jump to Subroutine Indirect,X
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    LDY $D8FC               ; [AC FC D8   ] Load Y from Absolute
    STY $28                 ; [84 28      ] Store Y to DP
    BVS $5DC4               ; [70 10      ] Branch if Overflow Set
    BMI $5D6E               ; [30 B8      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    CLV                     ; [B8         ] Clear Overflow Flag
    SEC                     ; [38         ] Set Carry Flag
    LDY $3C38,X             ; [BC 38 3C   ] Load Y from Absolute,X
    BPL $5D7A               ; [10 BC      ] Branch if Plus
    CPY #$18                ; [C0 18      ] Compare Y Immediate
    EOR $7120,Y             ; [59 20 71   ] XOR A with Absolute,Y
    BRK                     ; [00 50      ] Software interrupt
    BRK                     ; [00 72      ] Software interrupt
    JSR $0074               ; [20 74 00   ] Jump to Subroutine
    BVS $5DCC               ; [70 00      ] Branch if Overflow Set
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
    BPL $5DE1               ; [10 FC      ] Branch if Plus
    PLP                     ; [28         ] Pull Processor Status
    JSR ($FE00,X)           ; [FC 00 FE   ] Jump to Subroutine Indirect,X
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    LDY $D8FC               ; [AC FC D8   ] Load Y from Absolute
    STY $28                 ; [84 28      ] Store Y to DP
    BVS $5E04               ; [70 10      ] Branch if Overflow Set
    BMI $5DAE               ; [30 B8      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    CLV                     ; [B8         ] Clear Overflow Flag
    SEC                     ; [38         ] Set Carry Flag
    LDY $3C38,X             ; [BC 38 3C   ] Load Y from Absolute,X
    BPL $5DBA               ; [10 BC      ] Branch if Plus
    CPY #$18                ; [C0 18      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $011E00             ; [0F 00 1E 01] OR A with Absolute Long
    AND $013E00,X           ; [3F 00 3E 01] AND A with Absolute Long,X
    ADC ($0E),Y             ; [71 0E      ] Add with Carry (DP),Y

;--- Patch at file offset $145E16 (SNES $D45E16) ---
org $D45E16

    BRK                     ; [00 00      ] Software interrupt
    ASL $1F0E               ; [0E 0E 1F   ] Shift Left Absolute
    ORA $0E1F1F,X           ; [1F 1F 1F 0E] OR A with Absolute Long,X
    ASL $0000               ; [0E 00 00   ] Shift Left Absolute
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 90      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BVS $5E08               ; [70 E0      ] Branch if Overflow Set
    CLV                     ; [B8         ] Clear Overflow Flag
    CPY #$F4                ; [C0 F4      ] Compare Y Immediate
    PHP                     ; [08         ] Push Processor Status
    PLY                     ; [7A         ] Pull Y Register
    STY $FE                 ; [84 FE      ] Store Y to DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    RTI                     ; [40         ] Return from Interrupt
    BNE $5DCB               ; [D0 90      ] Branch if Not Equal
    TAY                     ; [A8         ] Transfer A to Y
    DEY                     ; [88         ] Decrement Y
    STY $44,X               ; [94 44      ] Store Y to DP,X
    PLP                     ; [28         ] Pull Processor Status
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
    BRA $5EA3               ; [80 3C      ] Branch Always
    BRA $5EA7               ; [80 3E      ] Branch Always
    BRA $5EE9               ; [80 7E      ] Branch Always
    BRK                     ; [00 FE      ] Software interrupt
    TSB $FE                 ; [04 FE      ] Test and Set Bits in DP
    DEY                     ; [88         ] Decrement Y
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $5DFD               ; [80 88      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    INY                     ; [C8         ] Increment Y
    BPL $5E45               ; [10 CC      ] Branch if Plus
    BPL $5E7B               ; [10 00      ] Branch if Plus
    BRA $5EB9               ; [80 3C      ] Branch Always
    BIT $0C88,X             ; [3C 88 0C   ] Test Bits Absolute,X
    STA ($0F),Y             ; [91 0F      ] Store A to (DP),Y
    STA $7206,Y             ; [99 06 72   ] Store A to Absolute,Y
    ASL $344C               ; [0E 4C 34   ] Shift Left Absolute
    EOR $334E33             ; [4F 33 4E 33] XOR A with Absolute Long
    STA $E363,X             ; [9D 63 E3   ] Store A to Absolute,X
    BRK                     ; [00 6F      ] Software interrupt
    BRK                     ; [00 42      ] Software interrupt
    ROL $0F                 ; [26 0F      ] Rotate Left DP
    BRK                     ; [00 37      ] Software interrupt
    BPL $5ED4               ; [10 3B      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    INC                     ; [1A         ] Increment Accumulator
    ADC $20,S               ; [63 20      ] Add with Carry Stack Relative
    BRK                     ; [00 00      ] Software interrupt
    STZ $9E18,X             ; [9E 18 9E   ] Store Zero to Absolute,X
    TRB $9CFA               ; [1C FA 9C   ] Test and Reset Bits Absolute
    PLY                     ; [7A         ] Pull Y Register
    JMP $0CFA               ; [4C FA 0C   ] Jump Absolute
    NOP                     ; [EA         ] No Operation
    TRB $F5                 ; [14 F5      ] Test and Reset Bits DP
    ASL                     ; [0A         ] Shift Left Accumulator
    STA $007800,X           ; [9F 00 78 00] Store A to Absolute Long,X
    JMP ($9C00,X)           ; [7C 00 9C   ] Jump Indirect,X
    BRK                     ; [00 4C      ] Software interrupt
    BRA $5F25               ; [80 6C      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    STZ $70,X               ; [74 70      ] Store Zero to DP,X
    ASL                     ; [0A         ] Shift Left Accumulator
    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $145EC4 (SNES $D45EC4) ---
org $D45EC4

    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $011E00             ; [0F 00 1E 01] OR A with Absolute Long
    AND $013E00,X           ; [3F 00 3E 01] AND A with Absolute Long,X
    ADC ($0E),Y             ; [71 0E      ] Add with Carry (DP),Y

;--- Patch at file offset $145ED6 (SNES $D45ED6) ---
org $D45ED6

    BRK                     ; [00 00      ] Software interrupt
    ASL $1F0E               ; [0E 0E 1F   ] Shift Left Absolute
    ORA $0E1F1F,X           ; [1F 1F 1F 0E] OR A with Absolute Long,X
    ASL $0000               ; [0E 00 00   ] Shift Left Absolute
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 90      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BVS $5EC8               ; [70 E0      ] Branch if Overflow Set
    CLV                     ; [B8         ] Clear Overflow Flag
    CPY #$F4                ; [C0 F4      ] Compare Y Immediate
    PHP                     ; [08         ] Push Processor Status
    PLY                     ; [7A         ] Pull Y Register
    STY $FE                 ; [84 FE      ] Store Y to DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    RTI                     ; [40         ] Return from Interrupt
    BNE $5E8B               ; [D0 90      ] Branch if Not Equal
    TAY                     ; [A8         ] Transfer A to Y
    DEY                     ; [88         ] Decrement Y
    STY $44,X               ; [94 44      ] Store Y to DP,X
    PLP                     ; [28         ] Pull Processor Status
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
    BRA $5F63               ; [80 3C      ] Branch Always
    BRA $5F67               ; [80 3E      ] Branch Always
    BRA $5FA9               ; [80 7E      ] Branch Always
    BRK                     ; [00 FE      ] Software interrupt
    TSB $BE                 ; [04 BE      ] Test and Set Bits in DP
    PHA                     ; [48         ] Push Accumulator
    CPY $28                 ; [C4 28      ] Compare Y with DP
    PLA                     ; [68         ] Pull Accumulator
    BRA $5EBD               ; [80 88      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    INY                     ; [C8         ] Increment Y
    BPL $5F05               ; [10 CC      ] Branch if Plus
    BPL $5F3B               ; [10 00      ] Branch if Plus
    BRA $5F79               ; [80 3C      ] Branch Always
    db $3C, $48                 ; Incomplete/data bytes

;--- Patch at file offset $145F4A (SNES $D45F4A) ---
org $D45F4A

    db $97                      ; Incomplete/data bytes

;--- Patch at file offset $145F60 (SNES $D45F60) ---
org $D45F60

    db $FE                      ; Incomplete/data bytes

;--- Patch at file offset $145F82 (SNES $D45F82) ---
org $D45F82

    STA $7106,Y             ; [99 06 71   ] Store A to Absolute,Y
    ORA $813747             ; [0F 47 37 81] OR A with Absolute Long
    BVS $5F26               ; [70 9B      ] Branch if Overflow Set
    SEI                     ; [78         ] Set Interrupt Disable
    LDA [$48],Y             ; [B7 48      ] Load A from [DP],Y
    WAI                     ; [CB         ] Wait for Interrupt
    BRK                     ; [00 6F      ] Software interrupt
    BRK                     ; [00 42      ] Software interrupt
    ROL $0F                 ; [26 0F      ] Rotate Left DP
    BRK                     ; [00 3F      ] Software interrupt
    BPL $6011               ; [10 78      ] Branch if Plus
    ROL $79                 ; [26 79      ] Rotate Left DP
    db $35                      ; Incomplete/data bytes

;--- Patch at file offset $145FAA (SNES $D45FAA) ---
org $D45FAA

    db $BD                      ; Incomplete/data bytes

;--- Patch at file offset $145FB6 (SNES $D45FB6) ---
org $D45FB6

    BIT $C6C0               ; [2C C0 C6   ] Test Bits Absolute
    db $20, $72                 ; Incomplete/data bytes

;--- Patch at file offset $145FCA (SNES $D45FCA) ---
org $D45FCA

    BRK                     ; [00 00      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    db $1E, $01                 ; Incomplete/data bytes

;--- Patch at file offset $145FDC (SNES $D45FDC) ---
org $D45FDC

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $145FEC (SNES $D45FEC) ---
org $D45FEC

    BVS $5FEE               ; [70 00      ] Branch if Overflow Set
    INY                     ; [C8         ] Increment Y
    db $30                      ; Incomplete/data bytes

;--- Patch at file offset $145FF8 (SNES $D45FF8) ---
org $D45FF8

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BMI $603E               ; [30 3D      ] Branch if Minus
    ORA $7F,S               ; [03 7F      ] OR A with Stack Relative
    BRK                     ; [00 7C      ] Software interrupt
    ORA $E3,S               ; [03 E3      ] OR A with Stack Relative
    TRB $40BF               ; [1C BF 40   ] Test and Reset Bits Absolute
    ADC $132D06,X           ; [7F 06 2D 13] Add with Carry Absolute Long,X
    PLP                     ; [28         ] Pull Processor Status
    ORA $3F1D1C,X           ; [1F 1C 1D 3F] OR A with Absolute Long,X
    AND $1C3F3F,X           ; [3F 3F 3F 1C] AND A with Absolute Long,X
    TRB $4201               ; [1C 01 42   ] Test and Reset Bits Absolute
    ASL $21                 ; [06 21      ] Shift Left DP
    ORA ($00,S),Y           ; [13 00      ] OR A with (SR),Y
    ORA ($00,S),Y           ; [13 00      ] OR A with (SR),Y
    STZ $88,X               ; [74 88      ] Store Zero to DP,X
    LDY $C8,X               ; [B4 C8      ] Load Y from DP,X
    JSR ($FC00,X)           ; [FC 00 FC   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    BPL $5FBC               ; [10 88      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    JSR $5088               ; [20 88 50   ] Jump to Subroutine
    BRA $608A               ; [80 50      ] Branch Always
    INY                     ; [C8         ] Increment Y
    BPL $6049               ; [10 0C      ] Branch if Plus
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
    BEQ $605D               ; [F0 F4      ] Branch if Equal
    SEC                     ; [38         ] Set Carry Flag
    JSL $6ED11C             ; [22 1C D1 6E] Jump to Subroutine Long
    SBC $080400,X           ; [FF 00 04 08] Subtract with Borrow Absolute Long,X
    CPX #$C8                ; [E0 C8      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    JSR $00F0               ; [20 F0 00   ] Jump to Subroutine
    SEC                     ; [38         ] Set Carry Flag
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
    BPL $609E               ; [10 09      ] Branch if Plus
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 06      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 11      ] Software interrupt
    ORA $110619             ; [0F 19 06 11] OR A with Absolute Long
    ORA $310717             ; [0F 17 07 31] OR A with Absolute Long

;--- Patch at file offset $1460B2 (SNES $D460B2) ---
org $D460B2

    COP #$06                ; [02 06      ] Coprocessor interrupt
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
    BPL $60DE               ; [10 09      ] Branch if Plus
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 06      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRA $6123               ; [80 3C      ] Branch Always
    BRA $6127               ; [80 3E      ] Branch Always
    BRA $6169               ; [80 7E      ] Branch Always
    BRK                     ; [00 FF      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    SBC $28C470,X           ; [FF 70 C4 28] Subtract with Borrow Absolute Long,X
    PLA                     ; [68         ] Pull Accumulator
    BRA $607D               ; [80 88      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    INY                     ; [C8         ] Increment Y
    BPL $60C5               ; [10 CC      ] Branch if Plus
    BPL $60FB               ; [10 00      ] Branch if Plus
    STY $3A                 ; [84 3A      ] Store Y to DP
    SEC                     ; [38         ] Set Carry Flag
    BVS $617A               ; [70 7A      ] Branch if Overflow Set

;--- Patch at file offset $14610C (SNES $D4610C) ---
org $D4610C

    AND [$08],Y             ; [37 08      ] AND A with [DP],Y
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 0B      ] Software interrupt
    BRK                     ; [00 19      ] Software interrupt
    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $146120 (SNES $D46120) ---
org $D46120

    db $FE                      ; Incomplete/data bytes

;--- Patch at file offset $146140 (SNES $D46140) ---
org $D46140

    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 90      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BVS $6128               ; [70 E0      ] Branch if Overflow Set
    CLV                     ; [B8         ] Clear Overflow Flag
    CPY #$F4                ; [C0 F4      ] Compare Y Immediate
    PHP                     ; [08         ] Push Processor Status
    PLY                     ; [7A         ] Pull Y Register
    STY $FE                 ; [84 FE      ] Store Y to DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    RTI                     ; [40         ] Return from Interrupt
    BNE $60EB               ; [D0 90      ] Branch if Not Equal
    TAY                     ; [A8         ] Transfer A to Y
    DEY                     ; [88         ] Decrement Y
    STY $44,X               ; [94 44      ] Store Y to DP,X
    PLP                     ; [28         ] Pull Processor Status
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 E4      ] Software interrupt
    BRA $618B               ; [80 24      ] Branch Always
    BRA $61A5               ; [80 3C      ] Branch Always
    BRA $61E9               ; [80 7E      ] Branch Always
    SEC                     ; [38         ] Set Carry Flag
    CMP $74DB38             ; [CF 38 DB 74] Compare A with Absolute Long
    CPY $28                 ; [C4 28      ] Compare Y with DP
    RTS                     ; [60         ] Return from Subroutine
    BRA $610D               ; [80 98      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    BNE $6180               ; [D0 08      ] Branch if Not Equal
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    SEC                     ; [38         ] Set Carry Flag
    BRA $61B5               ; [80 38      ] Branch Always
    COP #$74                ; [02 74      ] Coprocessor interrupt
    ASL $91                 ; [06 91      ] Shift Left DP
    ORA $710699             ; [0F 99 06 71] OR A with Absolute Long
    ORA $A12757             ; [0F 57 27 A1] OR A with Absolute Long
    BVC $61E6               ; [50 5B      ] Branch if Overflow Clear
    SEC                     ; [38         ] Set Carry Flag
    AND $000B08,X           ; [3F 08 0B 00] AND A with Absolute Long,X
    ADC $264200             ; [6F 00 42 26] Add with Carry Absolute Long
    ORA $002F00             ; [0F 00 2F 00] OR A with Absolute Long
    CLI                     ; [58         ] Clear Interrupt Disable
    ASL $39,X               ; [16 39      ] Shift Left DP,X
    ORA $0B,X               ; [15 0B      ] OR A with DP,X

;--- Patch at file offset $1461AA (SNES $D461AA) ---
org $D461AA

    db $FD                      ; Incomplete/data bytes

;--- Patch at file offset $1461B6 (SNES $D461B6) ---
org $D461B6

    TRB $D0                 ; [14 D0      ] Test and Reset Bits DP
    CPY $20                 ; [C4 20      ] Compare Y with DP
    db $72                      ; Incomplete/data bytes

;--- Patch at file offset $1461C6 (SNES $D461C6) ---
org $D461C6

    ASL $3F01,X             ; [1E 01 3F   ] Shift Left Absolute,X
    BRK                     ; [00 3E      ] Software interrupt
    ORA ($71,X)             ; [01 71      ] OR A with (DP,X)
    ASL $205F               ; [0E 5F 20   ] Shift Left Absolute

;--- Patch at file offset $1461D8 (SNES $D461D8) ---
org $D461D8

    ORA $1F1F1F,X           ; [1F 1F 1F 1F] OR A with Absolute Long,X
    ASL $000E               ; [0E 0E 00   ] Shift Left Absolute
    AND ($60,X)             ; [21 60      ] AND A with (DP,X)
    BRK                     ; [00 90      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    SEI                     ; [78         ] Set Interrupt Disable
    CPX #$A4                ; [E0 A4      ] Compare X Immediate
    CLD                     ; [D8         ] Clear Decimal Flag
    PLX                     ; [FA         ] Pull X Register
    TSB $7E                 ; [04 7E      ] Test and Set Bits in DP
    BRA $61EB               ; [80 FE      ] Branch Always
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    RTI                     ; [40         ] Return from Interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    DEY                     ; [88         ] Decrement Y
    LDY $88,X               ; [B4 88      ] Load Y from DP,X
    STY $40,X               ; [94 40      ] Store Y to DP,X
    BIT $28C4               ; [2C C4 28   ] Test Bits Absolute
    AND $0D5603             ; [2F 03 56 0D] AND A with Absolute Long
    MVN $0F,$74             ; [54 0F 74   ] Block Move Negative
    AND $292751             ; [2F 51 27 29] AND A with Absolute Long
    BPL $623C               ; [10 2F      ] Branch if Plus
    ORA ($10),Y             ; [11 10      ] OR A with (DP),Y
    ORA $291003             ; [0F 03 10 29] OR A with Absolute Long
    BRK                     ; [00 09      ] Software interrupt
    JSR $0029               ; [20 29 00   ] Jump to Subroutine
    AND $001600             ; [2F 00 16 00] AND A with Absolute Long
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    ORA $00FE00             ; [0F 00 FE 00] OR A with Absolute Long
    DEC $CE80               ; [CE 80 CE   ] Decrement Absolute
    BRK                     ; [00 FE      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    INC $1C60,X             ; [FE 60 1C   ] Increment Absolute,X
    CPX #$3C                ; [E0 3C      ] Compare X Immediate
    CPX #$7C                ; [E0 7C      ] Compare X Immediate
    INX                     ; [E8         ] Increment X
    MVP $80,$B4             ; [44 80 B4   ] Block Move Positive
    BRK                     ; [00 24      ] Software interrupt
    BPL $627B               ; [10 44      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    STZ $08                 ; [64 08      ] Store Zero to DP
    CPX #$08                ; [E0 08      ] Compare X Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    INX                     ; [E8         ] Increment X
    BRK                     ; [00 19      ] Software interrupt
    ASL $12                 ; [06 12      ] Shift Left DP
    ASL $142C               ; [0E 2C 14   ] Shift Left Absolute
    AND [$1B]               ; [27 1B      ] AND A with [DP]
    LSR $3B                 ; [46 3B      ] Shift Right DP
    EOR $6523,X             ; [5D 23 65   ] XOR A with Absolute,X
    COP #$46                ; [02 46      ] Coprocessor interrupt
    BRK                     ; [00 02      ] Software interrupt
    ASL $0F                 ; [06 0F      ] Shift Left DP
    BRK                     ; [00 17      ] Software interrupt
    BRK                     ; [00 1B      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    INC                     ; [1A         ] Increment Accumulator
    AND $00,S               ; [23 00      ] AND A with Stack Relative
    COP #$00                ; [02 00      ] Coprocessor interrupt
    BRK                     ; [00 00      ] Software interrupt
    INC $EA14               ; [EE 14 EA   ] Increment Absolute
    PEI ($6A)               ; [D4 6A      ] Push Effective Indirect
    MVN $EB,$16             ; [54 EB 16   ] Block Move Negative
    SBC $0A,X               ; [F5 0A      ] Subtract with Borrow DP,X
    LDA $0A,X               ; [B5 0A      ] Load A from DP,X
    ASL $0600,X             ; [1E 00 06   ] Shift Left Absolute,X
    BRK                     ; [00 14      ] Software interrupt
    BPL $6247               ; [10 D4      ] Branch if Plus
    BPL $62C9               ; [10 54      ] Branch if Plus
    BCC $62ED               ; [90 76      ] Branch if Carry Clear
    BVS $62B3               ; [70 3A      ] Branch if Overflow Set
    SEC                     ; [38         ] Set Carry Flag
    INC                     ; [1A         ] Increment Accumulator
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BVS $6284               ; [70 00      ] Branch if Overflow Set
    EOR $2F30,Y             ; [59 30 2F   ] XOR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    ORA ($0E),Y             ; [11 0E      ] OR A with (DP),Y
    AND $3B06,Y             ; [39 06 3B   ] AND A with Absolute,Y
    TSB $73                 ; [04 73      ] Test and Set Bits in DP
    TSB $0000               ; [0C 00 00   ] Test and Set Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 08      ] Software interrupt
    COP #$02                ; [02 02      ] Coprocessor interrupt
    ASL $1C1E,X             ; [1E 1E 1C   ] Shift Left Absolute,X
    TRB $3D3C               ; [1C 3C 3D   ] Test and Reset Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    BEQ $62A4               ; [F0 00      ] Branch if Equal
    DEY                     ; [88         ] Decrement Y
    BVS $629B               ; [70 F4      ] Branch if Overflow Set
    PHP                     ; [08         ] Push Processor Status
    PEA $BC08               ; [F4 08 BC   ] Push Effective Absolute
    RTI                     ; [40         ] Return from Interrupt
    JSR ($BE00,X)           ; [FC 00 BE   ] Jump to Subroutine Indirect,X
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $6326               ; [80 70      ] Branch Always
    BMI $6280               ; [30 C8      ] Branch if Minus
    BPL $62E2               ; [10 28      ] Branch if Plus
    DEY                     ; [88         ] Decrement Y
    BVC $62FD               ; [50 40      ] Branch if Overflow Clear
    TAY                     ; [A8         ] Transfer A to Y
    LDY #$54                ; [A0 54      ] Load Y Immediate
    ADC [$18]               ; [67 18      ] Add with Carry [DP]
    JSR ($4907,X)           ; [FC 07 49   ] Jump to Subroutine Indirect,X
    ASL $0D32               ; [0E 32 0D   ] Shift Left Absolute
    ORA $2E07,Y             ; [19 07 2E   ] OR A with Absolute,Y
    COP #$27                ; [02 27      ] Coprocessor interrupt
    BRK                     ; [00 2F      ] Software interrupt
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    SEC                     ; [38         ] Set Carry Flag
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    EOR [$00]               ; [47 00      ] XOR A with [DP]
    ASL $0D20,X             ; [1E 20 0D   ] Shift Left Absolute,X
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 13      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    BRK                     ; [00 7F      ] Software interrupt
    BRA $629E               ; [80 BB      ] Branch Always
    STY $5F                 ; [84 5F      ] Store Y to DP
    CPY #$FE                ; [C0 FE      ] Compare Y Immediate
    STY $9F                 ; [84 9F      ] Store Y to DP
    ORA ($97)               ; [12 97      ] OR A with (DP)
    TRB $3CE6               ; [1C E6 3C   ] Test and Reset Bits Absolute
    LDX $34D8,Y             ; [BE D8 34   ] Load X from Absolute,Y
    db $C2                      ; Incomplete/data bytes

;--- Patch at file offset $1462FA (SNES $D462FA) ---
org $D462FA

    db $5C, $24                 ; Incomplete/data bytes

;--- Patch at file offset $146304 (SNES $D46304) ---
org $D46304

    AND $19                 ; [25 19      ] AND A with Direct Page
    PHA                     ; [48         ] Push Accumulator
    BMI $62A6               ; [30 9D      ] Branch if Minus
    STZ $77                 ; [64 77      ] Store Zero to DP
    db $0E, $0F                 ; Incomplete/data bytes

;--- Patch at file offset $146314 (SNES $D46314) ---
org $D46314

    ORA $193E0C,X           ; [1F 0C 3E 19] OR A with Absolute Long,X
    JMP ($0F2A)             ; [6C 2A 0F   ] Jump Indirect
    ORA $01                 ; [05 01      ] OR A with Direct Page
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 3A      ] Software interrupt
    CPY $3B                 ; [C4 3B      ] Compare Y with DP
    INC $53,X               ; [F6 53      ] Increment DP,X
    DEC $0E93               ; [CE 93 0E   ] Decrement Absolute
    CMP [$4E],Y             ; [D7 4E      ] Compare A with [DP],Y
    SBC $4CBE56             ; [EF 56 BE 4C] Subtract with Borrow Absolute Long
    CPX $C400               ; [EC 00 C4   ] Compare X with Absolute
    RTI                     ; [40         ] Return from Interrupt
    db $76                      ; Incomplete/data bytes

;--- Patch at file offset $14633A (SNES $D4633A) ---
org $D4633A

    LSR $40,X               ; [56 40      ] Shift Right DP,X

;--- Patch at file offset $146344 (SNES $D46344) ---
org $D46344

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $001F00             ; [0F 00 1F 00] OR A with Absolute Long
    ORA $073800,X           ; [1F 00 38 07] OR A with Absolute Long,X

;--- Patch at file offset $146356 (SNES $D46356) ---
org $D46356

    BRK                     ; [00 00      ] Software interrupt
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA $0F0F0F             ; [0F 0F 0F 0F] OR A with Absolute Long
    ORA [$07]               ; [07 07      ] OR A with [DP]
    BRK                     ; [00 00      ] Software interrupt
    BMI $6364               ; [30 00      ] Branch if Minus
    INY                     ; [C8         ] Increment Y
    BMI $631F               ; [30 B8      ] Branch if Minus
    BVS $63C5               ; [70 5C      ] Branch if Overflow Set
    CPX #$FA                ; [E0 FA      ] Compare X Immediate
    TSB $3D                 ; [04 3D      ] Test and Set Bits in DP
    REP #$FF                ; [C2 FF      ] Reset Processor Status Bits
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BMI $6399               ; [30 20      ] Branch if Minus
    RTS                     ; [60         ] Return from Subroutine
    INY                     ; [C8         ] Increment Y
    PEI ($C4)               ; [D4 C4      ] Push Effective Indirect
    DEX                     ; [CA         ] Decrement X
    JSL $102F14             ; [22 14 2F 10] Jump to Subroutine Long
    ORA ($03),Y             ; [11 03      ] OR A with (DP),Y
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
    ORA $80BFC0,X           ; [1F C0 BF 80] OR A with Absolute Long,X
    AND $98FE00,X           ; [3F 00 FE 98] AND A with Absolute Long,X
    db $62, $94                 ; Incomplete/data bytes

;--- Patch at file offset $1463B8 (SNES $D463B8) ---
org $D463B8

    INC $08                 ; [E6 08      ] Increment DP
    BRL $7FFD               ; [82 40 1C   ] Branch Long
    JML [$1C98]             ; [DC 98 1C   ] Jump Long Indirect
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
    ORA $80BFC0,X           ; [1F C0 BF 80] OR A with Absolute Long,X
    AND $98FE00,X           ; [3F 00 FE 98] AND A with Absolute Long,X
    db $62, $94                 ; Incomplete/data bytes

;--- Patch at file offset $1463F8 (SNES $D463F8) ---
org $D463F8

    INC $08                 ; [E6 08      ] Increment DP
    BRL $803D               ; [82 40 1C   ] Branch Long
    JML [$1C98]             ; [DC 98 1C   ] Jump Long Indirect
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    ASL $03                 ; [06 03      ] Shift Left DP
    ROR $F107,X             ; [7E 07 F1   ] Rotate Right Absolute,X
    db $7F, $FC, $43            ; Incomplete/data bytes

;--- Patch at file offset $146417 (SNES $D46417) ---
org $D46417

    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    COP #$07                ; [02 07      ] Coprocessor interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BVS $6462               ; [70 43      ] Branch if Overflow Set
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
    BRA $6419               ; [80 E0      ] Branch Always
    BRK                     ; [00 E4      ] Software interrupt
    TSB $C8                 ; [04 C8      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    CLD                     ; [D8         ] Clear Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    SBC $207D41,X           ; [FF 41 7D 20] Subtract with Borrow Absolute Long,X
    ADC [$24],Y             ; [77 24      ] Add with Carry [DP],Y
    BIT $06,X               ; [34 06      ] Test Bits DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    AND ($01),Y             ; [31 01      ] AND A with (DP),Y
    PLA                     ; [68         ] Pull Accumulator
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
    CPY $F4F8               ; [CC F8 F4   ] Compare Y with Absolute
    SEC                     ; [38         ] Set Carry Flag
    TSX                     ; [BA         ] Transfer Stack Pointer to X
    TSB $BE                 ; [04 BE      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    JSR ($1800,X)           ; [FC 00 18   ] Jump to Subroutine Indirect,X
    BEQ $643B               ; [F0 CC      ] Branch if Equal
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BPL $646B               ; [10 F8      ] Branch if Plus
    BRK                     ; [00 38      ] Software interrupt
    BRK                     ; [00 44      ] Software interrupt
    BRA $64C1               ; [80 48      ] Branch Always
    LDY #$00                ; [A0 00      ] Load Y Immediate
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    JSR $0E95               ; [20 95 0E   ] Jump to Subroutine
    STA $00,X               ; [95 00      ] Store A to DP,X

;--- Patch at file offset $14648A (SNES $D4648A) ---
org $D4648A

    EOR $BD0B,X             ; [5D 0B BD   ] XOR A with Absolute,X
    ORA #$E7                ; [09 E7      ] OR A with Immediate
    BRK                     ; [00 6E      ] Software interrupt
    BRK                     ; [00 4A      ] Software interrupt

;--- Patch at file offset $14649A (SNES $D4649A) ---
org $D4649A

    PLD                     ; [2B         ] Pull Direct Page Register
    AND $4B,S               ; [23 4B      ] AND A with Stack Relative
    EOR $00,S               ; [43 00      ] XOR A with Stack Relative
    BRK                     ; [00 24      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BIT $08                 ; [24 08      ] Test Bits DP
    CPX $08                 ; [E4 08      ] Compare X with DP
    CPX $C8                 ; [E4 C8      ] Compare X with DP
    CPX $08                 ; [E4 08      ] Compare X with DP
    INC $4C                 ; [E6 4C      ] Increment DP
    INC $44,X               ; [F6 44      ] Increment DP,X
    STZ $D800,X             ; [9E 00 D8   ] Store Zero to Absolute,X
    BPL $648B               ; [10 D8      ] Branch if Plus
    BPL $64CD               ; [10 18      ] Branch if Plus
    BPL $648F               ; [10 D8      ] Branch if Plus
    BPL $64D1               ; [10 18      ] Branch if Plus
    BPL $6517               ; [10 5C      ] Branch if Plus
    BPL $6509               ; [10 4C      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $1464C4 (SNES $D464C4) ---
org $D464C4

    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    ASL $03                 ; [06 03      ] Shift Left DP
    ROR $F107,X             ; [7E 07 F1   ] Rotate Right Absolute,X
    db $7F, $FC, $43            ; Incomplete/data bytes

;--- Patch at file offset $1464D7 (SNES $D464D7) ---
org $D464D7

    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    COP #$07                ; [02 07      ] Coprocessor interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BVS $6522               ; [70 43      ] Branch if Overflow Set
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
    BRA $64D9               ; [80 E0      ] Branch Always
    BRK                     ; [00 E4      ] Software interrupt
    TSB $C8                 ; [04 C8      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    CLD                     ; [D8         ] Clear Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    SBC $207341,X           ; [FF 41 73 20] Subtract with Borrow Absolute Long,X
    ADC $3422,X             ; [7D 22 34   ] Add with Carry Absolute,X
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $31                 ; [06 31      ] Shift Left DP
    BRK                     ; [00 3E      ] Software interrupt
    BPL $6577               ; [10 68      ] Branch if Plus
    BIT $1C41,X             ; [3C 41 1C   ] Test Bits Absolute,X
    JSR $201C               ; [20 1C 20   ] Jump to Subroutine
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 11      ] Software interrupt
    BRK                     ; [00 3F      ] Software interrupt
    COP #$3C                ; [02 3C      ] Coprocessor interrupt
    INX                     ; [E8         ] Increment X
    CPY $F4F8               ; [CC F8 F4   ] Compare Y with Absolute
    PHP                     ; [08         ] Push Processor Status
    DEX                     ; [CA         ] Decrement X
    TSB $CE                 ; [04 CE      ] Test and Set Bits in DP
    BRK                     ; [00 FC      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    JMP $CC38               ; [4C 38 CC   ] Jump Absolute
    SEC                     ; [38         ] Set Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BPL $652B               ; [10 F8      ] Branch if Plus
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 24      ] Software interrupt
    BCC $6569               ; [90 30      ] Branch if Carry Clear
    BRA $6573               ; [80 38      ] Branch Always
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

;--- Patch at file offset $146560 (SNES $D46560) ---
org $D46560

    JML [$78B8]             ; [DC B8 78   ] Jump Long Indirect
    BPL $6559               ; [10 F4      ] Branch if Plus
    RTI                     ; [40         ] Return from Interrupt
    SBC ($C0)               ; [F2 C0      ] Subtract with Borrow (DP)
    DEC                     ; [3A         ] Decrement Accumulator
    BRK                     ; [00 FA      ] Software interrupt
    CPX #$1A                ; [E0 1A      ] Compare X Immediate
    JSR $00EC               ; [20 EC 00   ] Jump to Subroutine
    CLV                     ; [B8         ] Clear Overflow Flag
    BRK                     ; [00 90      ] Software interrupt
    BRA $65BD               ; [80 48      ] Branch Always
    PHP                     ; [08         ] Push Processor Status
    CPY $C40C               ; [CC 0C C4   ] Compare Y with Absolute
    TSB $E4                 ; [04 E4      ] Test and Set Bits in DP
    CPX $E4                 ; [E4 E4      ] Compare X with DP
    CPX $00                 ; [E4 00      ] Compare X with DP
    BRK                     ; [00 95      ] Software interrupt
    ASL $0095               ; [0E 95 00   ] Shift Left Absolute

;--- Patch at file offset $14658A (SNES $D4658A) ---
org $D4658A

    LSR                     ; [4A         ] Shift Right Accumulator
    CLC                     ; [18         ] Clear Carry Flag
    AND $1C18               ; [2D 18 1C   ] AND A with Absolute
    BRK                     ; [00 6E      ] Software interrupt
    BRK                     ; [00 4A      ] Software interrupt

;--- Patch at file offset $14659A (SNES $D4659A) ---
org $D4659A

    AND $183C,Y             ; [39 3C 18   ] AND A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    BIT $08                 ; [24 08      ] Test Bits DP
    BIT $08                 ; [24 08      ] Test Bits DP
    CPX $08                 ; [E4 08      ] Compare X with DP
    CPX $C8                 ; [E4 C8      ] Compare X with DP
    ROR $4C                 ; [66 4C      ] Rotate Right DP
    LDA ($E4)               ; [B2 E4      ] Load A from (DP)
    DEC                     ; [3A         ] Decrement Accumulator
    RTI                     ; [40         ] Return from Interrupt
    INC $D800               ; [EE 00 D8   ] Increment Absolute
    BPL $658B               ; [10 D8      ] Branch if Plus
    BPL $65CD               ; [10 18      ] Branch if Plus
    BPL $658F               ; [10 D8      ] Branch if Plus
    BPL $6615               ; [10 5C      ] Branch if Plus
    BNE $65A7               ; [D0 EC      ] Branch if Not Equal
    INX                     ; [E8         ] Increment X
    CPY $C4                 ; [C4 C4      ] Compare Y with DP

;--- Patch at file offset $1465CC (SNES $D465CC) ---
org $D465CC

    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)

;--- Patch at file offset $1465DF (SNES $D465DF) ---
org $D465DF

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $1465EC (SNES $D465EC) ---
org $D465EC

    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 D0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $1465FC (SNES $D465FC) ---
org $D465FC

    BRK                     ; [00 00      ] Software interrupt
    JSR $3F40               ; [20 40 3F   ] Jump to Subroutine
    ORA ($78,X)             ; [01 78      ] OR A with (DP,X)
    AND $7F217E,X           ; [3F 7E 21 7F] AND A with Absolute Long,X
    JSR $2078               ; [20 78 20   ] Jump to Subroutine
    AND ($10)               ; [32 10      ] AND A with (DP)
    ROL $1A10,X             ; [3E 10 1A   ] Rotate Left Absolute,X
    ASL $00                 ; [06 00      ] Shift Left DP
    ORA ($07,X)             ; [01 07      ] OR A with (DP,X)
    SEC                     ; [38         ] Set Carry Flag
    AND ($00,X)             ; [21 00      ] AND A with (DP,X)
    JSR $200E               ; [20 0E 20   ] Jump to Subroutine
    ORA $110C11             ; [0F 11 0C 11] OR A with Absolute Long
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 9C      ] Software interrupt
    BEQ $66A1               ; [F0 7E      ] Branch if Equal
    CPX $36                 ; [E4 36      ] Compare X with DP
    INX                     ; [E8         ] Increment X
    DEC $6674,X             ; [DE 74 66   ] Decrement Absolute,X
    SEC                     ; [38         ] Set Carry Flag
    LDX $1C,Y               ; [B6 1C      ] Load X from DP,Y
    PLX                     ; [FA         ] Pull X Register
    TSB $9D                 ; [04 9D      ] Test and Set Bits in DP
    REP #$70                ; [C2 70      ] Reset Processor Status Bits
    BRA $661F               ; [80 EC      ] Branch Always
    TSB $04E4               ; [0C E4 04   ] Test and Set Bits Absolute
    JMP ($3808,X)           ; [7C 08 38   ] Jump Indirect,X
    BRA $6657               ; [80 1C      ] Branch Always
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
    BPL $665A               ; [10 00      ] Branch if Plus
    AND [$03],Y             ; [37 03      ] AND A with [DP],Y
    AND $17,S               ; [23 17      ] AND A with Stack Relative
    BRK                     ; [00 00      ] Software interrupt
    STA $487CC4             ; [8F C4 7C 48] Store A to Absolute Long
    STY $4678               ; [8C 78 46   ] Store Y to Absolute
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
    SBC $207D41,X           ; [FF 41 7D 20] Subtract with Borrow Absolute Long,X
    ADC [$24],Y             ; [77 24      ] Add with Carry [DP],Y
    BIT $06,X               ; [34 06      ] Test Bits DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    ORA ($01),Y             ; [11 01      ] OR A with (DP),Y
    SEC                     ; [38         ] Set Carry Flag
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
    AND $1C18               ; [2D 18 1C   ] AND A with Absolute
    BRK                     ; [00 1E      ] Software interrupt
    BPL $66BD               ; [10 0A      ] Branch if Plus

;--- Patch at file offset $1466BA (SNES $D466BA) ---
org $D466BA

    AND $183C,Y             ; [39 3C 18   ] AND A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    SBC $207D41,X           ; [FF 41 7D 20] Subtract with Borrow Absolute Long,X
    ADC [$24],Y             ; [77 24      ] Add with Carry [DP],Y
    BIT $06,X               ; [34 06      ] Test Bits DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    ORA ($01),Y             ; [11 01      ] OR A with (DP),Y
    DEC                     ; [3A         ] Decrement Accumulator
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
    CPY $F4F8               ; [CC F8 F4   ] Compare Y with Absolute
    SEC                     ; [38         ] Set Carry Flag
    TSX                     ; [BA         ] Transfer Stack Pointer to X
    TSB $BE                 ; [04 BE      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    JSR ($7800,X)           ; [FC 00 78   ] Jump to Subroutine Indirect,X
    CPY #$3C                ; [C0 3C      ] Compare Y Immediate
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BPL $66EB               ; [10 F8      ] Branch if Plus
    BRK                     ; [00 38      ] Software interrupt
    BRK                     ; [00 44      ] Software interrupt
    BRA $6741               ; [80 48      ] Branch Always
    LDY #$00                ; [A0 00      ] Load Y Immediate
    BPL $66CD               ; [10 D0      ] Branch if Plus
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 24      ] Software interrupt
    ASL $27                 ; [06 27      ] Shift Left DP
    ASL $1F                 ; [06 1F      ] Shift Left DP
    BRK                     ; [00 11      ] Software interrupt
    ORA $4A1032             ; [0F 32 10 4A] OR A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    AND $1C18               ; [2D 18 1C   ] AND A with Absolute
    BRK                     ; [00 1F      ] Software interrupt
    ORA ($1E,X)             ; [01 1E      ] OR A with (DP,X)

;--- Patch at file offset $14671A (SNES $D4671A) ---
org $D4671A

    AND $183C,Y             ; [39 3C 18   ] AND A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    BIT $1860,X             ; [3C 60 18   ] Test Bits Absolute,X
    BVS $6731               ; [70 0C      ] Branch if Overflow Set
    SEC                     ; [38         ] Set Carry Flag
    STY $6608               ; [8C 08 66   ] Store Y to Absolute
    TRB $ECB2               ; [1C B2 EC   ] Test and Reset Bits Absolute
    ROL $EC44,X             ; [3E 44 EC   ] Rotate Left Absolute,X
    BRK                     ; [00 E8      ] Software interrupt
    BRA $6723               ; [80 F0      ] Branch Always
    BRA $672D               ; [80 F8      ] Branch Always
    CPY #$78                ; [C0 78      ] Compare Y Immediate
    BVS $6745               ; [70 0C      ] Branch if Overflow Set
    BCC $671F               ; [90 E4      ] Branch if Carry Clear
    INX                     ; [E8         ] Increment X
    CPY $C0                 ; [C4 C0      ] Compare Y with DP
    BRK                     ; [00 00      ] Software interrupt
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
    BRA $6739               ; [80 E0      ] Branch Always
    BRK                     ; [00 E4      ] Software interrupt
    TSB $C8                 ; [04 C8      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    CLD                     ; [D8         ] Clear Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    BIT $CCE8,X             ; [3C E8 CC   ] Test Bits Absolute,X
    BEQ $6757               ; [F0 F2      ] Branch if Equal
    JSR $00B2               ; [20 B2 00   ] Jump to Subroutine
    LDY $DC10,X             ; [BC 10 DC   ] Load Y from Absolute,X
    SEC                     ; [38         ] Set Carry Flag
    STY $9878               ; [8C 78 98   ] Store Y to Absolute
    BVS $6769               ; [70 F8      ] Branch if Overflow Set
    BPL $6763               ; [10 F0      ] Branch if Plus
    BRK                     ; [00 2C      ] Software interrupt
    BRK                     ; [00 4C      ] Software interrupt
    BRA $67C9               ; [80 50      ] Branch Always
    BRA $67B3               ; [80 38      ] Branch Always
    BRK                     ; [00 78      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 94      ] Software interrupt
    ASL $0095               ; [0E 95 00   ] Shift Left Absolute
    PLY                     ; [7A         ] Pull Y Register
    ORA $10                 ; [05 10      ] OR A with Direct Page
    ORA $4A1032             ; [0F 32 10 4A] OR A with Absolute Long
    CLC                     ; [18         ] Clear Carry Flag
    AND $1918               ; [2D 18 19   ] AND A with Absolute
    BRK                     ; [00 6F      ] Software interrupt
    ORA ($4A,X)             ; [01 4A      ] OR A with (DP,X)
    ROL                     ; [2A         ] Rotate Left Accumulator
    ORA $00                 ; [05 00      ] OR A with Direct Page
    AND $1D1020             ; [2F 20 10 1D] AND A with Absolute Long
    AND $183C,Y             ; [39 3C 18   ] AND A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
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
    ADC $FF43FC,X           ; [7F FC 43 FF] Add with Carry Absolute Long,X
    EOR ($00,X)             ; [41 00      ] XOR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    db $02                      ; Incomplete/data bytes

;--- Patch at file offset $1467DE (SNES $D467DE) ---
org $D467DE

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
    BRA $67D7               ; [80 E0      ] Branch Always
    BRK                     ; [00 E4      ] Software interrupt
    TSB $C8                 ; [04 C8      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    CLD                     ; [D8         ] Clear Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BPL $687E               ; [10 7D      ] Branch if Plus
    JSR $2477               ; [20 77 24   ] Jump to Subroutine
    STZ $06,X               ; [74 06      ] Store Zero to DP,X
    MVN $06,$51             ; [54 06 51   ] Block Move Negative
    AND ($68,X)             ; [21 68      ] AND A with (DP,X)
    AND ($2E,X)             ; [21 2E      ] AND A with (DP,X)
    PHP                     ; [08         ] Push Processor Status
    AND $0E                 ; [25 0E      ] AND A with Direct Page
    JSR $2812               ; [20 12 28   ] Jump to Subroutine
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($2F,X)             ; [01 2F      ] OR A with (DP,X)
    BRK                     ; [00 37      ] Software interrupt
    BPL $6836               ; [10 19      ] Branch if Plus
    ORA ($1E),Y             ; [11 1E      ] OR A with (DP),Y
    BPL $67FD               ; [10 DC      ] Branch if Plus
    CPX #$E4                ; [E0 E4      ] Compare X Immediate
    BRK                     ; [00 E6      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    JSR $30DC               ; [20 DC 30   ] Jump to Subroutine
    TYA                     ; [98         ] Transfer Y to A
    BVS $67C5               ; [70 98      ] Branch if Overflow Set
    BVS $67E7               ; [70 B8      ] Branch if Overflow Set
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    DEY                     ; [88         ] Decrement Y
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
    BNE $6882               ; [D0 10      ] Branch if Not Equal
    BNE $6884               ; [D0 10      ] Branch if Not Equal
    CLD                     ; [D8         ] Clear Decimal Flag
    BPL $688F               ; [10 18      ] Branch if Plus
    BPL $68E1               ; [10 68      ] Branch if Plus
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
    BEQ $68B1               ; [F0 00      ] Branch if Equal
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    BRA $689D               ; [80 E4      ] Branch Always
    TSB $E8                 ; [04 E8      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    CPX $F00C               ; [EC 0C F0   ] Compare X with Absolute
    BRK                     ; [00 5F      ] Software interrupt
    JSR $183E               ; [20 3E 18   ] Jump to Subroutine
    TRB $1E08               ; [1C 08 1E   ] Test and Reset Bits Absolute
    BRK                     ; [00 25      ] Software interrupt
    BRK                     ; [00 24      ] Software interrupt
    BRK                     ; [00 1E      ] Software interrupt
    TSB $0E1B               ; [0C 1B 0E   ] Test and Set Bits Absolute
    JSR $1800               ; [20 00 18   ] Jump to Subroutine
    ORA [$0B]               ; [07 0B      ] OR A with [DP]
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 12      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    BRK                     ; [00 0D      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    BRK                     ; [00 E6      ] Software interrupt
    TRB $0E1B               ; [1C 1B 0E   ] Test and Reset Bits Absolute
    AND $5F06,X             ; [3D 06 5F   ] AND A with Absolute,X
    COP #$1E                ; [02 1E      ] Coprocessor interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 E6      ] Software interrupt
    BIT $4E83,X             ; [3C 83 4E   ] Test Bits Absolute,X
    TRB $0E00               ; [1C 00 0E   ] Test and Reset Bits Absolute
    CPX #$86                ; [E0 86      ] Compare X Immediate
    BVC $6879               ; [50 82      ] Branch if Overflow Clear
    BMI $6881               ; [30 88      ] Branch if Minus
    RTS                     ; [60         ] Return from Subroutine
    BRA $693C               ; [80 40      ] Branch Always
    BIT $7E00,X             ; [3C 00 7E   ] Test Bits Absolute,X
    BMI $692B               ; [30 2A      ] Branch if Minus
    TSB $2F                 ; [04 2F      ] Test and Set Bits in DP
    BRK                     ; [00 54      ] Software interrupt
    TSB $56                 ; [04 56      ] Test and Set Bits in DP
    ASL $005F               ; [0E 5F 00   ] Shift Left Absolute
    EOR ($00),Y             ; [51 00      ] XOR A with (DP),Y
    ADC ($00,X)             ; [61 00      ] Add with Carry (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    ORA $11,X               ; [15 11      ] OR A with DP,X
    BPL $6924               ; [10 10      ] Branch if Plus
    ROL $2E2D               ; [2E 2D 2E   ] Rotate Left Absolute
    AND $202020             ; [2F 20 20 20] AND A with Absolute Long
    JSR $0000               ; [20 00 00   ] Jump to Subroutine
    BRK                     ; [00 00      ] Software interrupt
    LDA ($06,S),Y           ; [B3 06      ] Load A from (SR),Y
    PHK                     ; [4B         ] Push Program Bank
    BRL $EBF1               ; [82 CB 82   ] Branch Long
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

;--- Patch at file offset $146944 (SNES $D46944) ---
org $D46944

    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $01,S               ; [03 01      ] OR A with Stack Relative
    ASL $03                 ; [06 03      ] Shift Left DP
    ADC $7FF007,X           ; [7F 07 F0 7F] Add with Carry Absolute Long,X
    db $FE, $43                 ; Incomplete/data bytes

;--- Patch at file offset $146957 (SNES $D46957) ---
org $D46957

    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    COP #$07                ; [02 07      ] Coprocessor interrupt
    BRK                     ; [00 0F      ] Software interrupt
    BVS $69A2               ; [70 43      ] Branch if Overflow Set
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
    BRA $6959               ; [80 E0      ] Branch Always
    BRK                     ; [00 E4      ] Software interrupt
    TSB $C8                 ; [04 C8      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    CLD                     ; [D8         ] Clear Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    db $FF, $41, $71            ; Incomplete/data bytes

;--- Patch at file offset $14698A (SNES $D4698A) ---
org $D4698A

    AND ($00)               ; [32 00      ] AND A with (DP)
    ROR $4E30               ; [6E 30 4E   ] Rotate Right Absolute
    BIT $1C41,X             ; [3C 41 1C   ] Test Bits Absolute,X
    BIT $2E12               ; [2C 12 2E   ] Test Bits Absolute
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
    BPL $693B               ; [10 8C      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BPL $69EB               ; [10 38      ] Branch if Plus
    BRK                     ; [00 08      ] Software interrupt
    BRA $69E3               ; [80 2C      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    PHP                     ; [08         ] Push Processor Status
    BRA $69FB               ; [80 40      ] Branch Always
    BRK                     ; [00 50      ] Software interrupt
    BRK                     ; [00 78      ] Software interrupt
    BRK                     ; [00 FF      ] Software interrupt
    EOR ($71,X)             ; [41 71      ] XOR A with (DP,X)

;--- Patch at file offset $1469CA (SNES $D469CA) ---
org $D469CA

    ROL $00,X               ; [36 00      ] Rotate Left DP,X
    ROR $4E30               ; [6E 30 4E   ] Rotate Right Absolute
    BIT $1C41,X             ; [3C 41 1C   ] Test Bits Absolute,X
    BIT $2E12               ; [2C 12 2E   ] Test Bits Absolute
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
    BPL $697B               ; [10 8C      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BPL $6A2B               ; [10 38      ] Branch if Plus
    BRK                     ; [00 08      ] Software interrupt
    BRA $6A23               ; [80 2C      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    PHP                     ; [08         ] Push Processor Status
    BRA $6A3B               ; [80 40      ] Branch Always
    BRK                     ; [00 50      ] Software interrupt
    BRK                     ; [00 78      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
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
    BRA $6A26               ; [80 00      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    BRA $6A61               ; [80 38      ] Branch Always
    CPX #$3C                ; [E0 3C      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    TSB $1AF8               ; [0C F8 1A   ] Test and Set Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $6A38               ; [80 00      ] Branch Always
    CPX #$80                ; [E0 80      ] Compare X Immediate
    CLD                     ; [D8         ] Clear Decimal Flag
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BCS $6A23               ; [B0 E4      ] Branch if Carry Set
    JSR ($3F6F,X)           ; [FC 6F 3F   ] Jump to Subroutine Indirect,X
    ADC $3620,X             ; [7D 20 36   ] Add with Carry Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $10                 ; [06 10      ] Shift Left DP
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 3F      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BMI $6A71               ; [30 1F      ] Branch if Minus
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
    CPY #$60                ; [C0 60      ] Compare Y Immediate
    BRA $6AAF               ; [80 30      ] Branch Always
    BMI $6AF7               ; [30 76      ] Branch if Minus
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

;--- Patch at file offset $146AA6 (SNES $D46AA6) ---
org $D46AA6

    RTS                     ; [60         ] Return from Subroutine
    RTI                     ; [40         ] Return from Interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRA $6A6F               ; [80 C0      ] Branch Always
    BRK                     ; [00 68      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    PLA                     ; [68         ] Pull Accumulator
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 80      ] Software interrupt

;--- Patch at file offset $146AC2 (SNES $D46AC2) ---
org $D46AC2

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
    BRA $6AE6               ; [80 00      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    BRA $6B21               ; [80 38      ] Branch Always
    CPX #$3C                ; [E0 3C      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    TSB $1AF8               ; [0C F8 1A   ] Test and Set Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $6AF8               ; [80 00      ] Branch Always
    CPX #$80                ; [E0 80      ] Compare X Immediate
    CLD                     ; [D8         ] Clear Decimal Flag
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BCS $6AE3               ; [B0 E4      ] Branch if Carry Set
    JSR ($3F6F,X)           ; [FC 6F 3F   ] Jump to Subroutine Indirect,X
    ADC ($20,S),Y           ; [73 20      ] Add with Carry (SR),Y
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
    BEQ $6B25               ; [F0 F8      ] Branch if Equal
    CPX #$7C                ; [E0 7C      ] Compare X Immediate
    BNE $6B05               ; [D0 D4      ] Branch if Not Equal
    BIT $BC6C,X             ; [3C 6C BC   ] Test Bits Absolute,X
    BIT $FC                 ; [24 FC      ] Test Bits DP
    CLC                     ; [18         ] Clear Carry Flag
    JSR ($F800,X)           ; [FC 00 F8   ] Jump to Subroutine Indirect,X
    BVS $6AFC               ; [70 C0      ] Branch if Overflow Set
    RTS                     ; [60         ] Return from Subroutine
    BRA $6B17               ; [80 D8      ] Branch Always
    TYA                     ; [98         ] Transfer Y to A
    INC $7861,X             ; [FE 61 78   ] Increment Absolute,X
    ORA $170F19             ; [0F 19 0F 17] OR A with Absolute Long
    ORA [$22]               ; [07 22      ] OR A with [DP]
    BRK                     ; [00 32      ] Software interrupt
    BRK                     ; [00 7D      ] Software interrupt
    BMI $6B87               ; [30 38      ] Branch if Minus
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
    BCS $6B97               ; [B0 30      ] Branch if Carry Set
    BRK                     ; [00 20      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    BRK                     ; [00 88      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    BCS $6BAC               ; [B0 38      ] Branch if Carry Set
    BMI $6B26               ; [30 B0      ] Branch if Minus
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
    db $0C                      ; Incomplete/data bytes

;--- Patch at file offset $146BA5 (SNES $D46BA5) ---
org $D46BA5

    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $146BB4 (SNES $D46BB4) ---
org $D46BB4

    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $146BCA (SNES $D46BCA) ---
org $D46BCA

    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $3C07,X             ; [1D 07 3C   ] OR A with Absolute,X

;--- Patch at file offset $146BDC (SNES $D46BDC) ---
org $D46BDC

    ORA [$00]               ; [07 00      ] OR A with [DP]
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    db $07                      ; Incomplete/data bytes

;--- Patch at file offset $146BEA (SNES $D46BEA) ---
org $D46BEA

    BRA $6BEC               ; [80 00      ] Branch Always
    BVS $6B6E               ; [70 80      ] Branch if Overflow Set
    PHA                     ; [48         ] Push Accumulator
    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $146BFC (SNES $D46BFC) ---
org $D46BFC

    BRA $6BFE               ; [80 00      ] Branch Always
    BEQ $6B80               ; [F0 80      ] Branch if Equal
    RTI                     ; [40         ] Return from Interrupt
    AND $483F68,X           ; [3F 68 3F 48] AND A with Absolute Long,X
    AND $753F6F,X           ; [3F 6F 3F 75] AND A with Absolute Long,X
    JSR $0036               ; [20 36 00   ] Jump to Subroutine
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    AND $371F1E,X           ; [3F 1E 1F 37] AND A with Absolute Long,X
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
    BCS $6C19               ; [B0 E4      ] Branch if Carry Set
    JSR ($BC54,X)           ; [FC 54 BC   ] Jump to Subroutine Indirect,X
    JMP ($24BC)             ; [6C BC 24   ] Jump Indirect
    JSR ($FC18,X)           ; [FC 18 FC   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 F8      ] Software interrupt
    BPL $6C42               ; [10 00      ] Branch if Plus
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
    BEQ $6C41               ; [F0 DC      ] Branch if Equal
    SEI                     ; [78         ] Set Interrupt Disable
    INC $F354,X             ; [FE 54 F3   ] Increment Absolute,X
    BVC $6C52               ; [50 E7      ] Branch if Overflow Clear
    DEC $F7                 ; [C6 F7      ] Decrement DP
    STY $EE                 ; [84 EE      ] Store Y to DP
    BRK                     ; [00 78      ] Software interrupt
    CPY #$70                ; [C0 70      ] Compare Y Immediate
    BRA $6C9D               ; [80 28      ] Branch Always
    BVC $6CE7               ; [50 70      ] Branch if Overflow Clear
    STZ $62                 ; [64 62      ] Store Zero to DP
    ROR $FEA6,X             ; [7E A6 FE   ] Rotate Right Absolute,X
    DEC $CE                 ; [C6 CE      ] Decrement DP
    BRK                     ; [00 00      ] Software interrupt
    ADC $207D3F             ; [6F 3F 7D 20] Add with Carry Absolute Long
    ROL $04,X               ; [36 04      ] Rotate Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    BPL $6C8C               ; [10 00      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 1F      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    BMI $6CB1               ; [30 1F      ] Branch if Minus
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
    BPL $6CCC               ; [10 00      ] Branch if Plus
    ORA #$01                ; [09 01      ] OR A with Immediate
    ASL $3001,X             ; [1E 01 30   ] Shift Left Absolute,X
    ORA $082300,X           ; [1F 00 23 08] OR A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    ORA ($6A,X)             ; [01 6A      ] OR A with (DP,X)
    INX                     ; [E8         ] Increment X
    CMP ($F0)               ; [D2 F0      ] Compare A with (DP)
    PHX                     ; [DA         ] Push X Register
    CLI                     ; [58         ] Clear Interrupt Disable
    INC $64                 ; [E6 64      ] Increment DP
    JMP ($9C78,X)           ; [7C 78 9C   ] Jump Indirect,X
    SED                     ; [F8         ] Set Decimal Flag
    SEI                     ; [78         ] Set Interrupt Disable
    LDY #$E0                ; [A0 E0      ] Load Y Immediate
    CPY #$D4                ; [C0 D4      ] Compare Y Immediate
    BIT $BC6C,X             ; [3C 6C BC   ] Test Bits Absolute,X
    BIT $FC                 ; [24 FC      ] Test Bits DP
    CLC                     ; [18         ] Clear Carry Flag
    JSR ($F800,X)           ; [FC 00 F8   ] Jump to Subroutine Indirect,X
    SEI                     ; [78         ] Set Interrupt Disable
    CPY #$A0                ; [C0 A0      ] Compare Y Immediate
    BRA $6CBF               ; [80 C0      ] Branch Always
    CPY #$3F                ; [C0 3F      ] Compare Y Immediate
    ORA $1F143F,X           ; [1F 3F 14 1F] OR A with Absolute Long,X
    BRK                     ; [00 0F      ] Software interrupt
    ORA [$19]               ; [07 19      ] OR A with [DP]
    BRK                     ; [00 3D      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    ASL $0C08,X             ; [1E 08 0C   ] Shift Left Absolute,X
    BRK                     ; [00 1B      ] Software interrupt
    ORA $001F1B,X           ; [1F 1B 1F 00] OR A with Absolute Long,X
    BRK                     ; [00 01      ] Software interrupt
    ASL $0C                 ; [06 0C      ] Shift Left DP
    ASL                     ; [0A         ] Shift Left Accumulator
    TRB $0C1E               ; [1C 1E 0C   ] Test and Reset Bits Absolute
    TSB $0000               ; [0C 00 00   ] Test and Set Bits Absolute
    BEQ $6D22               ; [F0 00      ] Branch if Equal
    BEQ $6D24               ; [F0 00      ] Branch if Equal
    BEQ $6D46               ; [F0 20      ] Branch if Equal

;--- Patch at file offset $146D30 (SNES $D46D30) ---
org $D46D30

    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    db $20, $00                 ; Incomplete/data bytes

;--- Patch at file offset $146D42 (SNES $D46D42) ---
org $D46D42

    BRK                     ; [00 00      ] Software interrupt
    BRA $6D46               ; [80 00      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    BRA $6D81               ; [80 38      ] Branch Always
    CPX #$3C                ; [E0 3C      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    TSB $1AF8               ; [0C F8 1A   ] Test and Set Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $6D58               ; [80 00      ] Branch Always
    CPX #$80                ; [E0 80      ] Compare X Immediate
    CLD                     ; [D8         ] Clear Decimal Flag
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BCS $6D43               ; [B0 E4      ] Branch if Carry Set
    JSR ($E86A,X)           ; [FC 6A E8   ] Jump to Subroutine Indirect,X
    PHX                     ; [DA         ] Push X Register
    CPX #$FE                ; [E0 FE      ] Compare X Immediate
    BVC $6D65               ; [50 FE      ] Branch if Overflow Clear
    BVC $6DE5               ; [50 7C      ] Branch if Overflow Clear
    SEC                     ; [38         ] Set Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BVS $6D65               ; [70 F8      ] Branch if Overflow Set
    CPX #$F0                ; [E0 F0      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    PEI ($3C)               ; [D4 3C      ] Push Effective Indirect
    STZ $A4                 ; [64 A4      ] Store Zero to DP
    CLC                     ; [18         ] Clear Carry Flag
    CLD                     ; [D8         ] Clear Decimal Flag
    CLC                     ; [18         ] Clear Carry Flag
    CLD                     ; [D8         ] Clear Decimal Flag
    JSR $70B8               ; [20 B8 70   ] Jump to Subroutine
    BVS $6D6D               ; [70 F0      ] Branch if Overflow Set
    BEQ $6D5F               ; [F0 E0      ] Branch if Equal
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
    BEQ $6DA2               ; [F0 00      ] Branch if Equal
    db $E0                      ; Incomplete/data bytes

;--- Patch at file offset $146DC2 (SNES $D46DC2) ---
org $D46DC2

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
    BMI $6DFF               ; [30 1F      ] Branch if Minus
    BRK                     ; [00 00      ] Software interrupt
    BRA $6DE4               ; [80 00      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    BRA $6E1F               ; [80 38      ] Branch Always
    CPX #$3C                ; [E0 3C      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    TSB $1AF8               ; [0C F8 1A   ] Test and Set Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    ROR                     ; [6A         ] Rotate Right Accumulator
    INX                     ; [E8         ] Increment X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $6DF6               ; [80 00      ] Branch Always
    CPX #$80                ; [E0 80      ] Compare X Immediate
    CLD                     ; [D8         ] Clear Decimal Flag
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BCS $6DE1               ; [B0 E4      ] Branch if Carry Set
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
    BEQ $6DEE               ; [F0 C0      ] Branch if Equal
    BEQ $6DB0               ; [F0 80      ] Branch if Equal
    JMP $348C               ; [4C 8C 34   ] Jump Absolute
    LDY $30,X               ; [B4 30      ] Load Y from DP,X
    LDY $40,X               ; [B4 40      ] Load Y from DP,X
    BVS $6EA1               ; [70 68      ] Branch if Overflow Set
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
    BRA $6E43               ; [80 E0      ] Branch Always
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    BRK                     ; [00 40      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRA $6DEF               ; [80 80      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    BRA $6E77               ; [80 00      ] Branch Always
    BRA $6E79               ; [80 00      ] Branch Always
    BRA $6DFB               ; [80 80      ] Branch Always
    BRA $6DFD               ; [80 80      ] Branch Always
    BRA $6E7F               ; [80 00      ] Branch Always
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
    BEQ $6EF7               ; [F0 4C      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    TSB $4EF8               ; [0C F8 4E   ] Test and Set Bits Absolute
    JSR ($0000,X)           ; [FC 00 00   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $6EF8               ; [80 40      ] Branch Always
    BCS $6EFA               ; [B0 40      ] Branch if Carry Set
    BEQ $6E64               ; [F0 A8      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    BEQ $6EAF               ; [F0 F0      ] Branch if Equal
    LDY $3F77,X             ; [BC 77 3F   ] Load Y from Absolute,X
    JML $387818             ; [5C 18 78 38] Jump Long
    CLI                     ; [58         ] Clear Interrupt Disable
    BPL $6F05               ; [10 3C      ] Branch if Plus
    BPL $6F09               ; [10 3E      ] Branch if Plus
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
    BCS $6F59               ; [B0 68      ] Branch if Carry Set
    STZ $FC04               ; [9C 04 FC   ] Store Zero to Absolute
    TRB $FC                 ; [14 FC      ] Test and Reset Bits DP
    PHP                     ; [08         ] Push Processor Status
    JSR ($8800,X)           ; [FC 00 88   ] Jump to Subroutine Indirect,X
    BVS $6F6C               ; [70 70      ] Branch if Overflow Set
    PLA                     ; [68         ] Pull Accumulator
    SEI                     ; [78         ] Set Interrupt Disable
    PHP                     ; [08         ] Push Processor Status
    CLV                     ; [B8         ] Clear Overflow Flag

;--- Patch at file offset $146F08 (SNES $D46F08) ---
org $D46F08

    INC $62,X               ; [F6 62      ] Increment DP,X
    TDC                     ; [7B         ] Transfer Direct Page to A
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $146F16 (SNES $D46F16) ---
org $D46F16

    ADC ($6D)               ; [72 6D      ] Add with Carry (DP)
    db $71                      ; Incomplete/data bytes

;--- Patch at file offset $146F20 (SNES $D46F20) ---
org $D46F20

    BIT $38D8,X             ; [3C D8 38   ] Test Bits Absolute,X
    CPX #$F0                ; [E0 F0      ] Compare X Immediate
    CPX #$30                ; [E0 30      ] Compare X Immediate
    JSR $0010               ; [20 10 00   ] Jump to Subroutine
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $6F30               ; [80 00      ] Branch Always
    CLD                     ; [D8         ] Clear Decimal Flag
    TYA                     ; [98         ] Transfer Y to A
    CPX #$80                ; [E0 80      ] Compare X Immediate
    JSR $80C0               ; [20 C0 80   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BRA $6F9A               ; [80 60      ] Branch Always
    BRA $6EBC               ; [80 80      ] Branch Always
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
    BRA $6F66               ; [80 00      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    BRA $6FA1               ; [80 38      ] Branch Always
    CPX #$3C                ; [E0 3C      ] Compare X Immediate
    SED                     ; [F8         ] Set Decimal Flag
    TSB $1AF8               ; [0C F8 1A   ] Test and Set Bits Absolute
    SED                     ; [F8         ] Set Decimal Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $6F78               ; [80 00      ] Branch Always
    CPX #$80                ; [E0 80      ] Compare X Immediate
    CLD                     ; [D8         ] Clear Decimal Flag
    CPX #$F8                ; [E0 F8      ] Compare X Immediate
    BCS $6F63               ; [B0 E4      ] Branch if Carry Set
    JSR ($3F6F,X)           ; [FC 6F 3F   ] Jump to Subroutine Indirect,X
    ADC ($20),Y             ; [71 20      ] Add with Carry (DP),Y
    BMI $6F86               ; [30 00      ] Branch if Minus
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
    BMI $6F85               ; [30 D4      ] Branch if Minus
    BIT $BC6C,X             ; [3C 6C BC   ] Test Bits Absolute,X
    BIT $FC                 ; [24 FC      ] Test Bits DP
    CLC                     ; [18         ] Clear Carry Flag
    JSR ($F800,X)           ; [FC 00 F8   ] Jump to Subroutine Indirect,X
    SEI                     ; [78         ] Set Interrupt Disable
    CPX #$40                ; [E0 40      ] Compare X Immediate
    BRA $6FF7               ; [80 38      ] Branch Always
    SEC                     ; [38         ] Set Carry Flag
    ADC $20713F             ; [6F 3F 71 20] Add with Carry Absolute Long
    BMI $6FC6               ; [30 00      ] Branch if Minus
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    ORA ($00)               ; [12 00      ] OR A with (DP)
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 3E      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    ADC $1F3030,X           ; [7F 30 30 1F] Add with Carry Absolute Long,X
    BRK                     ; [00 2F      ] Software interrupt
    ASL $0E01               ; [0E 01 0E   ] Shift Left Absolute
    BRK                     ; [00 0D      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
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
    BMI $6FC5               ; [30 D4      ] Branch if Minus
    BIT $BC6C,X             ; [3C 6C BC   ] Test Bits Absolute,X
    BIT $FC                 ; [24 FC      ] Test Bits DP
    CLC                     ; [18         ] Clear Carry Flag
    JSR ($F800,X)           ; [FC 00 F8   ] Jump to Subroutine Indirect,X
    SEI                     ; [78         ] Set Interrupt Disable
    CPX #$40                ; [E0 40      ] Compare X Immediate
    BRA $7037               ; [80 38      ] Branch Always
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA $0F3000,X           ; [1F 00 30 0F] OR A with Absolute Long,X
    BVC $7011               ; [50 07      ] Branch if Overflow Clear
    JMP ($5003,X)           ; [7C 03 50   ] Jump Indirect,X
    ORA [$7F]               ; [07 7F      ] OR A with [DP]
    AND $000000             ; [2F 00 00 00] AND A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BPL $7058               ; [10 3F      ] Branch if Plus
    AND $3F3F3F,X           ; [3F 3F 3F 3F] AND A with Absolute Long,X
    ROL $103F,X             ; [3E 3F 10   ] Rotate Left Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $6FE8               ; [F0 C0      ] Branch if Equal
    SEC                     ; [38         ] Set Carry Flag
    BEQ $7037               ; [F0 0C      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    ASL $FC                 ; [06 FC      ] Shift Left DP
    DEC $FC                 ; [C6 FC      ] Decrement DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $6FBA               ; [F0 80      ] Branch if Equal
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
    BRA $70C7               ; [80 58      ] Branch Always
    JSR $40FE               ; [20 FE 40   ] Jump to Subroutine
    LDX $1C60,Y             ; [BE 60 1C   ] Load X from Absolute,Y
    BNE $70E7               ; [D0 70      ] Branch if Not Equal
    BCS $70E9               ; [B0 70      ] Branch if Carry Set
    BEQ $7073               ; [F0 F8      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    BCS $7020               ; [B0 A0      ] Branch if Carry Set
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
    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $1470AC (SNES $D470AC) ---
org $D470AC

    SBC $DF06,Y             ; [F9 06 DF   ] Subtract with Borrow Absolute,Y

;--- Patch at file offset $1470BC (SNES $D470BC) ---
org $D470BC

    STZ $0018,X             ; [9E 18 00   ] Store Zero to Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 30      ] Software interrupt
    ORA $7C0750             ; [0F 50 07 7C] OR A with Absolute Long
    ORA $50,S               ; [03 50      ] OR A with Stack Relative
    ORA [$7F]               ; [07 7F      ] OR A with [DP]
    AND $000000             ; [2F 00 00 00] AND A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BPL $7118               ; [10 3F      ] Branch if Plus
    AND $3F3F3F,X           ; [3F 3F 3F 3F] AND A with Absolute Long,X
    ROL $103F,X             ; [3E 3F 10   ] Rotate Left Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $70A8               ; [F0 C0      ] Branch if Equal
    SEC                     ; [38         ] Set Carry Flag
    BEQ $70F7               ; [F0 0C      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    ASL $FC                 ; [06 FC      ] Shift Left DP
    DEC $FC                 ; [C6 FC      ] Decrement DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $707A               ; [F0 80      ] Branch if Equal
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
    BPL $7130               ; [10 13      ] Branch if Plus
    BPL $714E               ; [10 2F      ] Branch if Plus
    BIT $EEFB               ; [2C FB EE   ] Test Bits Absolute
    ADC [$BE],Y             ; [77 BE      ] Add with Carry [DP],Y
    INC $BC1C,X             ; [FE 1C BC   ] Increment Absolute,X
    JSR $4078               ; [20 78 40   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    BRA $70F9               ; [80 CC      ] Branch Always
    BRK                     ; [00 F2      ] Software interrupt
    BIT $40FE,X             ; [3C FE 40   ] Test Bits Absolute,X
    LDX $1C60,Y             ; [BE 60 1C   ] Load X from Absolute,Y
    BNE $71A7               ; [D0 70      ] Branch if Not Equal
    BCS $7179               ; [B0 40      ] Branch if Carry Set
    CPY #$B0                ; [C0 B0      ] Compare Y Immediate
    BRA $715D               ; [80 20      ] Branch Always
    BPL $717B               ; [10 3C      ] Branch if Plus
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

;--- Patch at file offset $14717D (SNES $D4717D) ---
org $D4717D

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

;--- Patch at file offset $1471A6 (SNES $D471A6) ---
org $D471A6

    LDX $3BBC               ; [AE BC 3B   ] Load X from Absolute

;--- Patch at file offset $1471BD (SNES $D471BD) ---
org $D471BD

    db $44                      ; Incomplete/data bytes

;--- Patch at file offset $1471CA (SNES $D471CA) ---
org $D471CA

    BRK                     ; [00 00      ] Software interrupt
    ORA $1B3400,X           ; [1F 00 34 1B] OR A with Absolute Long,X

;--- Patch at file offset $1471DC (SNES $D471DC) ---
org $D471DC

    BRK                     ; [00 00      ] Software interrupt
    db $1F, $04                 ; Incomplete/data bytes

;--- Patch at file offset $1471EA (SNES $D471EA) ---
org $D471EA

    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $71B0               ; [F0 C0      ] Branch if Equal

;--- Patch at file offset $1471FC (SNES $D471FC) ---
org $D471FC

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
    BRA $722F               ; [80 FC      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    INC $FE10,X             ; [FE 10 FE   ] Increment Absolute,X
    BRK                     ; [00 FE      ] Software interrupt
    CPY #$3C                ; [C0 3C      ] Compare Y Immediate
    CPX #$0C                ; [E0 0C      ] Compare X Immediate
    BRK                     ; [00 30      ] Software interrupt
    BVS $7276               ; [70 35      ] Branch if Overflow Set
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

;--- Patch at file offset $147264 (SNES $D47264) ---
org $D47264

    db $4E                      ; Incomplete/data bytes

;--- Patch at file offset $147274 (SNES $D47274) ---
org $D47274

    CLV                     ; [B8         ] Clear Overflow Flag
    BCS $7231               ; [B0 BA      ] Branch if Carry Set
    BRA $72F1               ; [80 78      ] Branch Always
    BPL $7239               ; [10 BE      ] Branch if Plus
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

;--- Patch at file offset $1472F0 (SNES $D472F0) ---
org $D472F0

    INC $BE40,X             ; [FE 40 BE   ] Increment Absolute,X
    RTS                     ; [60         ] Return from Subroutine
    TRB $70D0               ; [1C D0 70   ] Test and Reset Bits Absolute
    BCS $7369               ; [B0 70      ] Branch if Carry Set
    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $147300 (SNES $D47300) ---
org $D47300

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

;--- Patch at file offset $14733D (SNES $D4733D) ---
org $D4733D

    PHA                     ; [48         ] Push Accumulator
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $7308               ; [F0 C0      ] Branch if Equal
    SEC                     ; [38         ] Set Carry Flag
    BEQ $7357               ; [F0 0C      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    ASL $FC                 ; [06 FC      ] Shift Left DP
    DEC $FC                 ; [C6 FC      ] Decrement DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $72DA               ; [F0 80      ] Branch if Equal
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
    BVS $736F               ; [70 FE      ] Branch if Overflow Set
    RTI                     ; [40         ] Return from Interrupt
    LDA ($60)               ; [B2 60      ] Load A from (DP)
    TSB $6CC0               ; [0C C0 6C   ] Test and Set Bits Absolute
    LDY #$5C                ; [A0 5C      ] Load Y Immediate
    CPY $A0B8               ; [CC B8 A0   ] Compare Y with Absolute
    SEI                     ; [78         ] Set Interrupt Disable
    RTI                     ; [40         ] Return from Interrupt
    BEQ $7340               ; [F0 C0      ] Branch if Equal
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

;--- Patch at file offset $1473BD (SNES $D473BD) ---
org $D473BD

    PHA                     ; [48         ] Push Accumulator
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA $0F3000,X           ; [1F 00 30 0F] OR A with Absolute Long,X
    BVC $73CF               ; [50 07      ] Branch if Overflow Clear
    JMP ($5003,X)           ; [7C 03 50   ] Jump Indirect,X
    ORA [$7F]               ; [07 7F      ] OR A with [DP]
    AND $003F7F             ; [2F 7F 3F 00] AND A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BPL $7416               ; [10 3F      ] Branch if Plus
    AND $3F3F3F,X           ; [3F 3F 3F 3F] AND A with Absolute Long,X
    ROL $103F,X             ; [3E 3F 10   ] Rotate Left Absolute,X
    db $3F, $0F                 ; Incomplete/data bytes

;--- Patch at file offset $1473EC (SNES $D473EC) ---
org $D473EC

    DEC $FC                 ; [C6 FC      ] Decrement DP
    XCE                     ; [FB         ] Exchange Carry and Emulation

;--- Patch at file offset $147400 (SNES $D47400) ---
org $D47400

    AND $5600,X             ; [3D 00 56   ] AND A with Absolute,X
    TSB $56                 ; [04 56      ] Test and Set Bits in DP
    ASL $76                 ; [06 76      ] Shift Left DP
    ROL $20                 ; [26 20      ] Rotate Left DP
    BRK                     ; [00 2F      ] Software interrupt
    ORA [$30]               ; [07 30      ] OR A with [DP]
    ORA [$28]               ; [07 28      ] OR A with [DP]
    BPL $7411               ; [10 00      ] Branch if Plus
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
    BVS $73B7               ; [70 88      ] Branch if Overflow Set
    BVS $73D3               ; [70 A2      ] Branch if Overflow Set
    RTS                     ; [60         ] Return from Subroutine
    BPL $73FC               ; [10 C8      ] Branch if Plus
    BVC $73BE               ; [50 88      ] Branch if Overflow Clear
    SEC                     ; [38         ] Set Carry Flag
    TYA                     ; [98         ] Transfer Y to A
    CLV                     ; [B8         ] Clear Overflow Flag
    LDY #$B8                ; [A0 B8      ] Load Y Immediate
    LDY #$F0                ; [A0 F0      ] Load Y Immediate
    CPY #$F0                ; [C0 F0      ] Compare Y Immediate
    CPY #$3F                ; [C0 3F      ] Compare Y Immediate
    BPL $7462               ; [10 1F      ] Branch if Plus
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
    BCC $741D               ; [90 B8      ] Branch if Carry Clear
    CPX #$68                ; [E0 68      ] Compare X Immediate
    BPL $7455               ; [10 EC      ] Branch if Plus
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
    BCC $74BD               ; [90 FE      ] Branch if Carry Clear
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

;--- Patch at file offset $1474EC (SNES $D474EC) ---
org $D474EC

    LDX $DC                 ; [A6 DC      ] Load X from DP
    ROL $08,X               ; [36 08      ] Rotate Left DP,X
    db $FE, $C0                 ; Incomplete/data bytes

;--- Patch at file offset $1474FC (SNES $D474FC) ---
org $D474FC

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

;--- Patch at file offset $147542 (SNES $D47542) ---
org $D47542

    BRK                     ; [00 00      ] Software interrupt
    ORA $0F3000,X           ; [1F 00 30 0F] OR A with Absolute Long,X
    BVC $7551               ; [50 07      ] Branch if Overflow Clear
    JMP ($5003,X)           ; [7C 03 50   ] Jump Indirect,X
    ORA [$7F]               ; [07 7F      ] OR A with [DP]
    AND $000000             ; [2F 00 00 00] AND A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BPL $7598               ; [10 3F      ] Branch if Plus
    AND $3F3F3F,X           ; [3F 3F 3F 3F] AND A with Absolute Long,X
    ROL $103F,X             ; [3E 3F 10   ] Rotate Left Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $7528               ; [F0 C0      ] Branch if Equal
    SEC                     ; [38         ] Set Carry Flag
    BEQ $7577               ; [F0 0C      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    ASL $FC                 ; [06 FC      ] Shift Left DP
    DEC $FC                 ; [C6 FC      ] Decrement DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BEQ $74FA               ; [F0 80      ] Branch if Equal
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
    BPL $75B3               ; [10 16      ] Branch if Plus
    ORA $2A,X               ; [15 2A      ] OR A with DP,X
    ORA ($FB,X)             ; [01 FB      ] OR A with (DP,X)
    INC $5E37               ; [EE 37 5E   ] Increment Absolute
    ROR $6C0C,X             ; [7E 0C 6C   ] Rotate Right Absolute,X

;--- Patch at file offset $1475B0 (SNES $D475B0) ---
org $D475B0

    INC $5EC0,X             ; [FE C0 5E   ] Increment Absolute,X
    BRA $75C1               ; [80 0C      ] Branch Always
    CPY #$30                ; [C0 30      ] Compare Y Immediate
    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $1475C0 (SNES $D475C0) ---
org $D475C0

    ADC $00383F,X           ; [7F 3F 38 00] Add with Carry Absolute Long,X
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    ASL $00,X               ; [16 00      ] Shift Left DP,X
    BMI $75CA               ; [30 00      ] Branch if Minus
    PLD                     ; [2B         ] Pull Direct Page Register
    BRK                     ; [00 7C      ] Software interrupt
    TSB $7C                 ; [04 7C      ] Test and Set Bits in DP
    PLP                     ; [28         ] Pull Processor Status
    AND $1F000F,X           ; [3F 0F 00 1F] AND A with Absolute Long,X
    ASL $0900               ; [0E 00 09   ] Shift Left Absolute
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 14      ] Software interrupt
    BPL $75F3               ; [10 16      ] Branch if Plus
    ORA $2A,X               ; [15 2A      ] OR A with DP,X
    ORA ($FB,X)             ; [01 FB      ] OR A with (DP,X)
    INC $5E37               ; [EE 37 5E   ] Increment Absolute
    ROR $6C0C,X             ; [7E 0C 6C   ] Rotate Right Absolute,X

;--- Patch at file offset $1475F0 (SNES $D475F0) ---
org $D475F0

    INC $5EC0,X             ; [FE C0 5E   ] Increment Absolute,X
    BRA $7601               ; [80 0C      ] Branch Always
    CPY #$30                ; [C0 30      ] Compare Y Immediate
    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $147600 (SNES $D47600) ---
org $D47600

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
    BPL $7672               ; [10 15      ] Branch if Plus
    ORA ($0B),Y             ; [11 0B      ] OR A with (DP),Y
    PHD                     ; [0B         ] Push Direct Page Register
    ROL $9634,X             ; [3E 34 96   ] Rotate Left Absolute,X
    TSB $0CDE               ; [0C DE 0C   ] Test and Set Bits Absolute
    JSR ($F000,X)           ; [FC 00 F0   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 B8      ] Software interrupt
    BRK                     ; [00 78      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BVS $7665               ; [70 F4      ] Branch if Overflow Set
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
    JSR ($7C70,X)           ; [FC 70 7C   ] Jump to Subroutine Indirect,X
    BMI $7628               ; [30 B0      ] Branch if Minus
    BRK                     ; [00 80      ] Software interrupt
    BVS $76EC               ; [70 70      ] Branch if Overflow Set
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    BMI $76CA               ; [30 49      ] Branch if Minus
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
    BPL $769E               ; [10 07      ] Branch if Plus
    COP #$07                ; [02 07      ] Coprocessor interrupt
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 3C      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    BIT $F838,X             ; [3C 38 F8   ] Test Bits Absolute,X
    BMI $7717               ; [30 70      ] Branch if Minus
    CPY #$60                ; [C0 60      ] Compare Y Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRA $766D               ; [80 C0      ] Branch Always
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    INX                     ; [E8         ] Increment X
    CLC                     ; [18         ] Clear Carry Flag
    BMI $76E6               ; [30 30      ] Branch if Minus
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $76BC               ; [80 00      ] Branch Always
    BRA $763E               ; [80 80      ] Branch Always
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
    BEQ $7695               ; [F0 AC      ] Branch if Equal
    SED                     ; [F8         ] Set Decimal Flag
    STY $68,X               ; [94 68      ] Store Y to DP,X
    LSR $2C,X               ; [56 2C      ] Shift Right DP,X
    ROL $0014,X             ; [3E 14 00   ] Rotate Left Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRA $76E7               ; [80 F0      ] Branch Always
    BNE $76F1               ; [D0 F8      ] Branch if Not Equal
    BRK                     ; [00 E8      ] Software interrupt
    BRA $76E9               ; [80 EC      ] Branch Always
    CPX #$F4                ; [E0 F4      ] Compare X Immediate
    CPX #$5F                ; [E0 5F      ] Compare X Immediate
    BRK                     ; [00 7D      ] Software interrupt
    BRK                     ; [00 34      ] Software interrupt
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $1C                 ; [06 1C      ] Shift Left DP
    BRK                     ; [00 33      ] Software interrupt
    BRK                     ; [00 32      ] Software interrupt
    BMI $778D               ; [30 7E      ] Branch if Minus
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
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 B8      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ROR $F41C,X             ; [7E 1C F4   ] Rotate Right Absolute,X
    CPX #$30                ; [E0 30      ] Compare X Immediate
    BIT $30,X               ; [34 30      ] Test Bits DP,X
    BCS $7747               ; [B0 10      ] Branch if Carry Set
    BCC $7739               ; [90 00      ] Branch if Carry Clear
    BRA $77AB               ; [80 70      ] Branch Always
    BVS $7705               ; [70 C8      ] Branch if Overflow Set
    INY                     ; [C8         ] Increment Y
    CPY $DC                 ; [C4 DC      ] Compare Y with DP
    ROR $7D38,X             ; [7E 38 7D   ] Rotate Right Absolute,X
    BMI $7784               ; [30 3F      ] Branch if Minus
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
    BNE $77DD               ; [D0 70      ] Branch if Not Equal
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 84      ] Software interrupt
    LDY $2498,X             ; [BC 98 24   ] Load Y from Absolute,X
    CLD                     ; [D8         ] Clear Decimal Flag
    BRK                     ; [00 D0      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BNE $778C               ; [D0 10      ] Branch if Not Equal
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
    BPL $77A6               ; [10 0F      ] Branch if Plus
    COP #$0F                ; [02 0F      ] Coprocessor interrupt
    BRK                     ; [00 1F      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BIT $3C38,X             ; [3C 38 3C   ] Test Bits Absolute,X
    SEC                     ; [38         ] Set Carry Flag
    SED                     ; [F8         ] Set Decimal Flag
    BMI $7817               ; [30 70      ] Branch if Minus
    CPY #$70                ; [C0 70      ] Compare Y Immediate
    CPX #$F0                ; [E0 F0      ] Compare X Immediate
    BRA $77CD               ; [80 20      ] Branch Always
    BRA $776F               ; [80 C0      ] Branch Always
    BRK                     ; [00 E0      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    INX                     ; [E8         ] Increment X
    CLC                     ; [18         ] Clear Carry Flag
    BMI $77E6               ; [30 30      ] Branch if Minus
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CPX #$60                ; [E0 60      ] Compare X Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate

;--- Patch at file offset $1477C6 (SNES $D477C6) ---
org $D477C6

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $0F1007             ; [0F 07 10 0F] OR A with Absolute Long
    AND [$1D],Y             ; [37 1D      ] AND A with [DP],Y

;--- Patch at file offset $1477D8 (SNES $D477D8) ---
org $D477D8

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    db $0F, $08, $1D            ; Incomplete/data bytes

;--- Patch at file offset $1477E6 (SNES $D477E6) ---
org $D477E6

    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BMI $77AC               ; [30 C0      ] Branch if Minus
    CLC                     ; [18         ] Clear Carry Flag
    BEQ $77F7               ; [F0 08      ] Branch if Equal
    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $1477F8 (SNES $D477F8) ---
org $D477F8

    BRK                     ; [00 00      ] Software interrupt
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BEQ $77DE               ; [F0 E0      ] Branch if Equal
    BEQ $77E0               ; [F0 E0      ] Branch if Equal
    db $2F, $1B                 ; Incomplete/data bytes

;--- Patch at file offset $14780A (SNES $D4780A) ---
org $D4780A

    BVS $780C               ; [70 00      ] Branch if Overflow Set
    ADC $3500,X             ; [7D 00 35   ] Add with Carry Absolute,X
    ORA $001B               ; [0D 1B 00   ] OR A with Absolute

;--- Patch at file offset $14781A (SNES $D4781A) ---
org $D4781A

    AND [$28]               ; [27 28      ] AND A with [DP]
    JSL $000220             ; [22 20 02 00] Jump to Subroutine Long
    JMP $6EF8               ; [4C F8 6E   ] Jump Absolute
    TRB $1C36               ; [1C 36 1C   ] Test and Reset Bits Absolute
    ASL $CE0C,X             ; [1E 0C CE   ] Shift Left Absolute,X
    TSB $6E                 ; [04 6E      ] Test and Set Bits in DP
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 3C      ] Software interrupt
    BRA $7829               ; [80 F8      ] Branch Always
    BCS $782F               ; [B0 FC      ] Branch if Carry Set
    BEQ $7831               ; [F0 FC      ] Branch if Equal
    CPX #$FC                ; [E0 FC      ] Compare X Immediate
    BEQ $78B5               ; [F0 7C      ] Branch if Equal
    SEI                     ; [78         ] Set Interrupt Disable
    SEC                     ; [38         ] Set Carry Flag
    CLV                     ; [B8         ] Clear Overflow Flag
    TRB $085C               ; [1C 5C 08   ] Test and Reset Bits Absolute
    PLA                     ; [68         ] Pull Accumulator
    ORA $0D,X               ; [15 0D      ] OR A with DP,X

;--- Patch at file offset $14784A (SNES $D4784A) ---
org $D4784A

    EOR $1B,X               ; [55 1B      ] XOR A with DP,X
    ADC $7F18,X             ; [7D 18 7F   ] Add with Carry Absolute,X
    BRK                     ; [00 02      ] Software interrupt

;--- Patch at file offset $147860 (SNES $D47860) ---
org $D47860

    BIT $5C80,X             ; [3C 80 5C   ] Test Bits Absolute,X
    BRK                     ; [00 9C      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    TRB $DC3E               ; [1C 3E DC   ] Test and Reset Bits Absolute
    ROR $C4DC,X             ; [7E DC C4   ] Rotate Right Absolute,X
    BRA $786D               ; [80 FE      ] Branch Always
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
    BRK                     ; [00 0B      ] Software interrupt
    ORA ($3F,X)             ; [01 3F      ] OR A with (DP,X)
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
    BRA $78E7               ; [80 F8      ] Branch Always
    CPY #$F4                ; [C0 F4      ] Compare Y Immediate
    CPY #$F8                ; [C0 F8      ] Compare Y Immediate
    JSR ($7C70,X)           ; [FC 70 7C   ] Jump to Subroutine Indirect,X
    BMI $78A8               ; [30 B0      ] Branch if Minus
    BRK                     ; [00 00      ] Software interrupt
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    BMI $78AE               ; [30 B0      ] Branch if Minus
    BVC $78D0               ; [50 D0      ] Branch if Overflow Clear
    EOR $0F4F0F             ; [4F 0F 4F 0F] XOR A with Absolute Long
    AND $081707,X           ; [3F 07 17 08] AND A with Absolute Long,X
    INC                     ; [1A         ] Increment Accumulator
    ORA $1F1727             ; [0F 27 17 1F] OR A with Absolute Long
    BRK                     ; [00 04      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    ORA [$38]               ; [07 38      ] OR A with [DP]
    ORA [$07]               ; [07 07      ] OR A with [DP]
    ORA [$08]               ; [07 08      ] OR A with [DP]
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRA $7905               ; [80 E0      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPY #$70                ; [C0 70      ] Compare Y Immediate
    CPX #$F0                ; [E0 F0      ] Compare X Immediate
    BRA $794D               ; [80 20      ] Branch Always
    BRA $78EF               ; [80 C0      ] Branch Always
    BRK                     ; [00 40      ] Software interrupt
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    BRA $7975               ; [80 40      ] Branch Always
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
    BMI $7963               ; [30 F8      ] Branch if Minus
    BVS $7969               ; [70 FC      ] Branch if Overflow Set
    SEI                     ; [78         ] Set Interrupt Disable
    JSR ($F4F8,X)           ; [FC F8 F4   ] Jump to Subroutine Indirect,X
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    CPX #$58                ; [E0 58      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    BPL $7900               ; [10 88      ] Branch if Plus
    BMI $78FA               ; [30 80      ] Branch if Minus
    BVS $79EC               ; [70 70      ] Branch if Overflow Set
    PHP                     ; [08         ] Push Processor Status
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
    BPL $79A6               ; [10 0F      ] Branch if Plus
    COP #$0F                ; [02 0F      ] Coprocessor interrupt
    BRK                     ; [00 1F      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    BEQ $7993               ; [F0 F0      ] Branch if Equal
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    CPY #$60                ; [C0 60      ] Compare Y Immediate
    CPY #$70                ; [C0 70      ] Compare Y Immediate
    CPX #$F0                ; [E0 F0      ] Compare X Immediate
    BRA $79CD               ; [80 20      ] Branch Always
    BRA $796F               ; [80 C0      ] Branch Always
    BRK                     ; [00 10      ] Software interrupt
    BEQ $7993               ; [F0 E0      ] Branch if Equal
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
    BEQ $79F1               ; [F0 0C      ] Branch if Equal
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
    BVS $7A21               ; [70 F8      ] Branch if Overflow Set
    BEQ $7A23               ; [F0 F8      ] Branch if Equal
    BEQ $7A25               ; [F0 F8      ] Branch if Equal
    BEQ $7A1F               ; [F0 F0      ] Branch if Equal
    RTS                     ; [60         ] Return from Subroutine
    CPY #$C4                ; [C0 C4      ] Compare Y Immediate
    BMI $7A34               ; [30 00      ] Branch if Minus
    JSR $7010               ; [20 10 70   ] Jump to Subroutine
    RTI                     ; [40         ] Return from Interrupt
    BPL $7A2A               ; [10 F0      ] Branch if Plus
    BPL $7A2C               ; [10 F0      ] Branch if Plus
    BCC $7A2E               ; [90 F0      ] Branch if Carry Clear
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
    BRA $7A43               ; [80 E0      ] Branch Always
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRA $7A2B               ; [80 C0      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRA $7A7D               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 19      ] Software interrupt
    ORA [$32]               ; [07 32      ] OR A with [DP]
    ORA $6F1D2E,X           ; [1F 2E 1D 6F] OR A with Absolute Long,X
    BMI $7AE5               ; [30 58      ] Branch if Minus
    BMI $7B02               ; [30 73      ] Branch if Minus
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
    BVS $7AB1               ; [70 F8      ] Branch if Overflow Set
    BNE $7AB7               ; [D0 FC      ] Branch if Not Equal
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
    BVS $7B48               ; [70 79      ] Branch if Overflow Set
    BMI $7B09               ; [30 38      ] Branch if Minus
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
    BPL $7ABE               ; [10 C8      ] Branch if Plus
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

;--- Patch at file offset $147B20 (SNES $D47B20) ---
org $D47B20

    SEI                     ; [78         ] Set Interrupt Disable
    JSR $F0F8               ; [20 F8 F0   ] Jump to Subroutine
    TYA                     ; [98         ] Transfer Y to A
    BVS $7B6F               ; [70 48      ] Branch if Overflow Set
    BCS $7B71               ; [B0 48      ] Branch if Carry Set
    BMI $7B23               ; [30 F8      ] Branch if Minus
    BPL $7B1D               ; [10 F0      ] Branch if Plus
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    CPY #$F0                ; [C0 F0      ] Compare Y Immediate
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 B0      ] Software interrupt
    BRA $7AE9               ; [80 B0      ] Branch Always
    BRA $7B0B               ; [80 D0      ] Branch Always
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
    BMI $7BB2               ; [30 21      ] Branch if Minus
    AND ($06,X)             ; [21 06      ] AND A with (DP,X)
    PHP                     ; [08         ] Push Processor Status
    TSB $0A01               ; [0C 01 0A   ] Test and Set Bits Absolute
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($04,X)             ; [01 04      ] OR A with (DP,X)
    BRK                     ; [00 12      ] Software interrupt
    BPL $7BA3               ; [10 04      ] Branch if Plus
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
    BMI $7B68               ; [30 B0      ] Branch if Minus
    BRK                     ; [00 80      ] Software interrupt
    BVS $7C2C               ; [70 70      ] Branch if Overflow Set
    CPY #$C8                ; [C0 C8      ] Compare Y Immediate
    LDY #$9C                ; [A0 9C      ] Load Y Immediate
    LSR $3900,X             ; [5E 00 39   ] Shift Right Absolute,X
    BRK                     ; [00 12      ] Software interrupt
    BRK                     ; [00 14      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    BRK                     ; [00 3B      ] Software interrupt
    BRK                     ; [00 7D      ] Software interrupt
    BRK                     ; [00 79      ] Software interrupt
    BMI $7BF2               ; [30 21      ] Branch if Minus
    AND ($06,X)             ; [21 06      ] AND A with (DP,X)
    PHP                     ; [08         ] Push Processor Status
    TSB $0A01               ; [0C 01 0A   ] Test and Set Bits Absolute
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($04,X)             ; [01 04      ] OR A with (DP,X)
    BRK                     ; [00 12      ] Software interrupt
    BPL $7BE3               ; [10 04      ] Branch if Plus
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
    BMI $7BA8               ; [30 B0      ] Branch if Minus
    BRK                     ; [00 80      ] Software interrupt
    BVS $7C6C               ; [70 70      ] Branch if Overflow Set
    CPY #$C8                ; [C0 C8      ] Compare Y Immediate
    LDY #$9C                ; [A0 9C      ] Load Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $007F10             ; [2F 10 7F 00] AND A with Absolute Long

;--- Patch at file offset $147C16 (SNES $D47C16) ---
org $D47C16

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
    BNE $7C49               ; [D0 10      ] Branch if Not Equal
    JSR $5880               ; [20 80 58   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $84                 ; [14 84      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    JMP $7F3F               ; [4C 3F 7F   ] Jump Absolute
    BMI $7C7B               ; [30 36      ] Branch if Minus
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $30                 ; [06 30      ] Shift Left DP
    BRK                     ; [00 59      ] Software interrupt
    BMI $7CBE               ; [30 6F      ] Branch if Minus
    AND $193F,Y             ; [39 3F 19   ] AND A with Absolute,Y
    AND $11180F,X           ; [3F 0F 18 11] AND A with Absolute Long,X
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($36,X)             ; [01 36      ] OR A with (DP,X)
    BMI $7C98               ; [30 39      ] Branch if Minus
    BMI $7CDF               ; [30 7E      ] Branch if Minus
    BRA $7C21               ; [80 BE      ] Branch Always
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
    BCC $7C7B               ; [90 00      ] Branch if Carry Clear
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
    ROL $07                 ; [26 07      ] Rotate Left DP
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    BRK                     ; [00 28      ] Software interrupt
    JSR $2028               ; [20 28 20   ] Jump to Subroutine
    BEQ $7CA6               ; [F0 00      ] Branch if Equal
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    BRA $7CAA               ; [80 00      ] Branch Always
    BRA $7CAC               ; [80 00      ] Branch Always
    BRA $7CAE               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BNE $7CE2               ; [D0 30      ] Branch if Not Equal
    BNE $7CE4               ; [D0 30      ] Branch if Not Equal
    BRK                     ; [00 00      ] Software interrupt
    BRA $7CB8               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $147CC4 (SNES $D47CC4) ---
org $D47CC4

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $007F10             ; [2F 10 7F 00] AND A with Absolute Long

;--- Patch at file offset $147CD6 (SNES $D47CD6) ---
org $D47CD6

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
    BVC $7D09               ; [50 10      ] Branch if Overflow Clear
    LDY #$80                ; [A0 80      ] Load Y Immediate
    CLI                     ; [58         ] Clear Interrupt Disable
    INY                     ; [C8         ] Increment Y
    TRB $84                 ; [14 84      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    JMP $7F3F               ; [4C 3F 7F   ] Jump Absolute
    BMI $7D3B               ; [30 36      ] Branch if Minus
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
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($18,X)             ; [01 18      ] OR A with (DP,X)
    COP #$11                ; [02 11      ] Coprocessor interrupt
    PLP                     ; [28         ] Pull Processor Status
    ROR $BE80,X             ; [7E 80 BE   ] Rotate Right Absolute,X
    CPX #$FC                ; [E0 FC      ] Compare X Immediate
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BMI $7D23               ; [30 F4      ] Branch if Minus
    SEI                     ; [78         ] Set Interrupt Disable
    CPX $68                 ; [E4 68      ] Compare X with DP
    CPX $68                 ; [E4 68      ] Compare X with DP
    CPX #$E8                ; [E0 E8      ] Compare X Immediate
    PHA                     ; [48         ] Push Accumulator
    LDY #$4C                ; [A0 4C      ] Load Y Immediate
    BCC $7D47               ; [90 0C      ] Branch if Carry Clear
    BRA $7D6D               ; [80 30      ] Branch Always
    BIT $78,X               ; [34 78      ] Test Bits DP,X
    SEI                     ; [78         ] Set Interrupt Disable
    STA $8F11,Y             ; [99 11 8F   ] Store A to Absolute,Y
    ORA [$59]               ; [07 59      ] OR A with [DP]
    ORA [$31]               ; [07 31      ] OR A with [DP]
    ORA $360012             ; [0F 12 00 36] OR A with Absolute Long
    BPL $7D8A               ; [10 3D      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 67      ] Software interrupt
    db $76                      ; Incomplete/data bytes

;--- Patch at file offset $147D58 (SNES $D47D58) ---
org $D47D58

    ORA #$04                ; [09 04      ] OR A with Immediate
    ORA #$14                ; [09 14      ] OR A with Immediate
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    CPY $F488               ; [CC 88 F4   ] Compare Y with Absolute
    BMI $7D31               ; [30 CC      ] Branch if Minus
    DEY                     ; [88         ] Decrement Y
    INY                     ; [C8         ] Increment Y
    BRA $7D99               ; [80 30      ] Branch Always
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
    BMI $7DCA               ; [30 3D      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 6E      ] Software interrupt
    ASL $40                 ; [06 40      ] Shift Left DP
    ROL $07                 ; [26 07      ] Rotate Left DP
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    ORA $01                 ; [05 01      ] OR A with Direct Page
    BIT $0800,X             ; [3C 00 08   ] Test Bits Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    JSR $2028               ; [20 28 20   ] Jump to Subroutine
    BEQ $7DA6               ; [F0 00      ] Branch if Equal
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    BEQ $7D6E               ; [F0 C0      ] Branch if Equal
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BNE $7DE2               ; [D0 30      ] Branch if Not Equal
    BNE $7DE4               ; [D0 30      ] Branch if Not Equal
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt

;--- Patch at file offset $147DC8 (SNES $D47DC8) ---
org $D47DC8

    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    db $0F, $00                 ; Incomplete/data bytes

;--- Patch at file offset $147DDB (SNES $D47DDB) ---
org $D47DDB

    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $147DE8 (SNES $D47DE8) ---
org $D47DE8

    BRK                     ; [00 00      ] Software interrupt
    BEQ $7DEC               ; [F0 00      ] Branch if Equal
    PHP                     ; [08         ] Push Processor Status
    BEQ $7DE3               ; [F0 F4      ] Branch if Equal
    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $147DFA (SNES $D47DFA) ---
org $D47DFA

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BEQ $7E08               ; [F0 08      ] Branch if Equal
    AND ($0C,S),Y           ; [33 0C      ] AND A with (SR),Y
    EOR $609F30             ; [4F 30 9F 60] XOR A with Absolute Long
    SBC $BF1F,Y             ; [F9 1F BF   ] Subtract with Borrow Absolute,Y
    BVS $7E80               ; [70 75      ] Branch if Overflow Set
    BRK                     ; [00 29      ] Software interrupt
    TSB $29                 ; [04 29      ] Test and Set Bits in DP
    TSB $0F00               ; [0C 00 0F   ] Test and Set Bits Absolute
    ORA $7E1F30             ; [0F 30 1F 7E] OR A with Absolute Long
    ADC $6F7F72,X           ; [7F 72 7F 6F] Add with Carry Absolute Long,X
    AND ($3A),Y             ; [31 3A      ] AND A with (DP),Y
    BPL $7E21               ; [10 03      ] Branch if Plus
    BPL $7E23               ; [10 03      ] Branch if Plus
    INC $FE00,X             ; [FE 00 FE   ] Increment Absolute,X
    BRK                     ; [00 FE      ] Software interrupt
    JSR $C03E               ; [20 3E C0   ] Jump to Subroutine
    JSR ($FC00,X)           ; [FC 00 FC   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    TSB $0C                 ; [04 0C      ] Test and Set Bits in DP
    BNE $7E19               ; [D0 E4      ] Branch if Not Equal
    INX                     ; [E8         ] Increment X
    CPX $68                 ; [E4 68      ] Compare X with DP
    INY                     ; [C8         ] Increment Y
    CPX #$88                ; [E0 88      ] Compare X Immediate
    RTS                     ; [60         ] Return from Subroutine
    JMP $8CA0               ; [4C A0 8C   ] Jump Absolute
    BVC $7EA9               ; [50 68      ] Branch if Overflow Clear
    db $0C                      ; Incomplete/data bytes

;--- Patch at file offset $147E48 (SNES $D47E48) ---
org $D47E48

    AND [$03]               ; [27 03      ] AND A with [DP]
    LSR $10,X               ; [56 10      ] Shift Right DP,X
    XCE                     ; [FB         ] Exchange Carry and Emulation
    ADC ($F1,X)             ; [61 F1      ] Add with Carry (DP,X)
    BRK                     ; [00 10      ] Software interrupt
    ORA $5C,S               ; [03 5C      ] OR A with Stack Relative
    EOR $6C,S               ; [43 6C      ] XOR A with Stack Relative
    RTS                     ; [60         ] Return from Subroutine
    db $22, $21                 ; Incomplete/data bytes

;--- Patch at file offset $147E60 (SNES $D47E60) ---
org $D47E60

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
    BEQ $7EE8               ; [F0 70      ] Branch if Equal
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
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 19      ] Software interrupt
    PHP                     ; [08         ] Push Processor Status
    ORA $070B06             ; [0F 06 0B 07] OR A with Absolute Long
    ORA ($0F),Y             ; [11 0F      ] OR A with (DP),Y
    JSL $307E00             ; [22 00 7E 30] Jump to Subroutine Long
    AND $0808,X             ; [3D 08 08   ] AND A with Absolute,X
    BRK                     ; [00 0E      ] Software interrupt
    ASL $00                 ; [06 00      ] Shift Left DP
    ASL $07                 ; [06 07      ] Shift Left DP
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    ORA $01                 ; [05 01      ] OR A with Direct Page
    BIT $0800,X             ; [3C 00 08   ] Test Bits Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    JMP $7F3F               ; [4C 3F 7F   ] Jump Absolute
    BMI $7EFB               ; [30 36      ] Branch if Minus
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
    BRA $7EA1               ; [80 BE      ] Branch Always
    CPX #$FC                ; [E0 FC      ] Compare X Immediate
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRA $7EAB               ; [80 BC      ] Branch Always
    CPY #$E4                ; [C0 E4      ] Compare Y Immediate
    PLA                     ; [68         ] Pull Accumulator
    CPX $68                 ; [E4 68      ] Compare X with DP
    INX                     ; [E8         ] Increment X
    CPX #$48                ; [E0 48      ] Compare X Immediate
    LDY #$4C                ; [A0 4C      ] Load Y Immediate
    BCC $7F07               ; [90 0C      ] Branch if Carry Clear
    BPL $7E85               ; [10 88      ] Branch if Plus
    STY $D0,X               ; [94 D0      ] Store Y to DP,X
    INY                     ; [C8         ] Increment Y

;--- Patch at file offset $147F06 (SNES $D47F06) ---
org $D47F06

    ORA ($0F),Y             ; [11 0F      ] OR A with (DP),Y
    JSL $307E00             ; [22 00 7E 30] Jump to Subroutine Long
    db $3D                      ; Incomplete/data bytes

;--- Patch at file offset $147F18 (SNES $D47F18) ---
org $D47F18

    CLC                     ; [18         ] Clear Carry Flag
    ORA $01                 ; [05 01      ] OR A with Direct Page
    BIT $0800,X             ; [3C 00 08   ] Test Bits Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    RTS                     ; [60         ] Return from Subroutine
    BEQ $7EA4               ; [F0 80      ] Branch if Equal
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPX #$80                ; [E0 80      ] Compare X Immediate
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CPX #$E0                ; [E0 E0      ] Compare X Immediate
    BRA $7F34               ; [80 00      ] Branch Always
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $7F38               ; [80 00      ] Branch Always
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BEQ $7F46               ; [F0 00      ] Branch if Equal
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
    BNE $7F69               ; [D0 10      ] Branch if Not Equal
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
    BRA $7F79               ; [80 00      ] Branch Always
    CLV                     ; [B8         ] Clear Overflow Flag
    MVP $70,$70             ; [44 70 70   ] Block Move Positive
    STZ $E0,X               ; [74 E0      ] Store Zero to DP,X
    INX                     ; [E8         ] Increment X

;--- Patch at file offset $147F88 (SNES $D47F88) ---
org $D47F88

    JSL $347E00             ; [22 00 7E 34] Jump to Subroutine Long
    db $3D                      ; Incomplete/data bytes

;--- Patch at file offset $147F98 (SNES $D47F98) ---
org $D47F98

    CLC                     ; [18         ] Clear Carry Flag
    ORA $01                 ; [05 01      ] OR A with Direct Page
    BIT $0800,X             ; [3C 00 08   ] Test Bits Absolute,X
    BRK                     ; [00 00      ] Software interrupt
    CLV                     ; [B8         ] Clear Overflow Flag
    BRA $7F93               ; [80 F0      ] Branch Always
    BRK                     ; [00 F0      ] Software interrupt
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    BRA $8009               ; [80 60      ] Branch Always
    BRK                     ; [00 F0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    CPX #$00                ; [E0 00      ] Compare X Immediate
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    BRK                     ; [00 20      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRA $7FB8               ; [80 00      ] Branch Always
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt

;--- Patch at file offset $147FC4 (SNES $D47FC4) ---
org $D47FC4

    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $007F10             ; [2F 10 7F 00] AND A with Absolute Long
    db $4C, $3F                 ; Incomplete/data bytes

;--- Patch at file offset $147FD6 (SNES $D47FD6) ---
org $D47FD6

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
    BRA $7FF1               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BVC $8007               ; [50 10      ] Branch if Overflow Clear
    TAY                     ; [A8         ] Transfer A to Y
    DEY                     ; [88         ] Decrement Y
    MVN $C8,$14             ; [54 C8 14   ] Block Move Negative
    BRA $7FEA               ; [80 EC      ] Branch Always
    CPX $68                 ; [E4 68      ] Compare X with DP
    ADC $043630,X           ; [7F 30 36 04] Add with Carry Absolute Long,X
    STZ $06,X               ; [74 06      ] Store Zero to DP,X
    STY $06,X               ; [94 06      ] Store Y to DP,X
    BEQ $804A               ; [F0 40      ] Branch if Equal
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
    BVS $7FC7               ; [70 9E      ] Branch if Overflow Set
    BRK                     ; [00 9C      ] Software interrupt
    BRA $8045               ; [80 18      ] Branch Always
    BRK                     ; [00 30      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    INX                     ; [E8         ] Increment X
    BMI $7FB8               ; [30 84      ] Branch if Minus
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
    BRK                     ; [00 02      ] Software interrupt
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    COP #$00                ; [02 00      ] Coprocessor interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    CPY #$C0                ; [C0 C0      ] Compare Y Immediate
    BRA $7FE7               ; [80 80      ] Branch Always
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

;--- Patch at file offset $148082 (SNES $D48082) ---
org $D48082

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
    BRA $80A7               ; [80 FC      ] Branch Always
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 9E      ] Software interrupt

;--- Patch at file offset $1480B6 (SNES $D480B6) ---
org $D480B6

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
    BPL $80DB               ; [10 E0      ] Branch if Plus
    BPL $8089               ; [10 8C      ] Branch if Plus
    BIT $0404               ; [2C 04 04   ] Test Bits Absolute
    ASL $3900,X             ; [1E 00 39   ] Shift Left Absolute,X
    ORA $77,S               ; [03 77      ] OR A with Stack Relative
    AND $3F,X               ; [35 3F      ] AND A with DP,X
    ORA $123E,Y             ; [19 3E 12   ] OR A with Absolute,Y
    ORA $020707,X           ; [1F 07 07 02] OR A with Absolute Long,X

;--- Patch at file offset $148116 (SNES $D48116) ---
org $D48116

    BRK                     ; [00 1D      ] Software interrupt
    ORA ($12,X)             ; [01 12      ] OR A with (DP,X)
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    INC $C0                 ; [E6 C0      ] Increment DP
    STY $10,X               ; [94 10      ] Store Y to DP,X
    TYA                     ; [98         ] Transfer Y to A
    BPL $8123               ; [10 FC      ] Branch if Plus
    DEY                     ; [88         ] Decrement Y
    TYA                     ; [98         ] Transfer Y to A
    BRA $80CB               ; [80 A0      ] Branch Always
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 D8      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    PLA                     ; [68         ] Pull Accumulator
    CLC                     ; [18         ] Clear Carry Flag
    RTI                     ; [40         ] Return from Interrupt
    BMI $80BF               ; [30 88      ] Branch if Minus
    BRK                     ; [00 00      ] Software interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $148144 (SNES $D48144) ---
org $D48144

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $007F10             ; [2F 10 7F 00] AND A with Absolute Long

;--- Patch at file offset $148156 (SNES $D48156) ---
org $D48156

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
    BNE $8189               ; [D0 10      ] Branch if Not Equal
    JSR $5880               ; [20 80 58   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    TRB $04                 ; [14 04      ] Test and Reset Bits DP
    INX                     ; [E8         ] Increment X
    JMP $7F3F               ; [4C 3F 7F   ] Jump Absolute
    BMI $81B5               ; [30 30      ] Branch if Minus
    BRK                     ; [00 11      ] Software interrupt
    BRK                     ; [00 1A      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 BD      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    SBC [$61]               ; [E7 61      ] Subtract with Borrow [DP]
    AND $0F3F19,X           ; [3F 19 3F 0F] AND A with Absolute Long,X
    ASL $19,X               ; [16 19      ] Shift Left DP,X
    ASL $0500               ; [0E 00 05   ] Shift Left Absolute
    BRK                     ; [00 0F      ] Software interrupt
    BRK                     ; [00 62      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    EOR $FE60,Y             ; [59 60 FE   ] XOR A with Absolute,Y
    BRK                     ; [00 3E      ] Software interrupt
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
    ROR $60                 ; [66 60      ] Rotate Right DP
    EOR $FE60,Y             ; [59 60 FE   ] XOR A with Absolute,Y
    BRK                     ; [00 3E      ] Software interrupt
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
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 19      ] Software interrupt
    ASL $27                 ; [06 27      ] Shift Left DP
    CLC                     ; [18         ] Clear Carry Flag
    AND $215810             ; [2F 10 58 21] AND A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $824F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BVS $81E6               ; [70 C0      ] Branch if Overflow Set
    PHA                     ; [48         ] Push Accumulator
    BCS $8201               ; [B0 D8      ] Branch if Carry Set
    BMI $821F               ; [30 F4      ] Branch if Minus
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
    BRK                     ; [00 9E      ] Software interrupt
    BRA $823B               ; [80 CC      ] Branch Always
    BRK                     ; [00 C4      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $827D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $82D5               ; [90 5C      ] Branch if Carry Clear
    BRA $8287               ; [80 0C      ] Branch Always
    BCC $8265               ; [90 E8      ] Branch if Carry Clear
    TSB $20                 ; [04 20      ] Test and Set Bits in DP
    BPL $82C2               ; [10 41      ] Branch if Plus
    ASL $0049               ; [0E 49 00   ] Shift Left Absolute
    AND $0F1C07,X           ; [3F 07 1C 0F] AND A with Absolute Long,X
    PHP                     ; [08         ] Push Processor Status
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 05      ] Software interrupt
    COP #$03                ; [02 03      ] Coprocessor interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 26      ] Software interrupt
    BPL $8295               ; [10 00      ] Branch if Plus
    ORA [$03]               ; [07 03      ] OR A with [DP]
    ORA $030704             ; [0F 04 07 03] OR A with Absolute Long
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 28      ] Software interrupt
    BRK                     ; [00 28      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRA $8229               ; [80 80      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    BMI $8293               ; [30 E0      ] Branch if Minus
    BMI $82B5               ; [30 00      ] Branch if Minus
    BRK                     ; [00 00      ] Software interrupt
    BRA $82B9               ; [80 00      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 02      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 0C      ] Software interrupt
    ORA $13,S               ; [03 13      ] OR A with Stack Relative
    TSB $102F               ; [0C 2F 10   ] Test and Set Bits Absolute
    BIT $0010               ; [2C 10 00   ] Test Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
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
    BPL $831C               ; [10 19      ] Branch if Plus
    BRK                     ; [00 1E      ] Software interrupt
    ORA ($0A,X)             ; [01 0A      ] OR A with (DP,X)
    ORA $0A,S               ; [03 0A      ] OR A with Stack Relative
    ORA $08,S               ; [03 08      ] OR A with Stack Relative
    BRK                     ; [00 1E      ] Software interrupt
    BRK                     ; [00 29      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    TRB $0806               ; [1C 06 08   ] Test and Reset Bits Absolute
    BRK                     ; [00 00      ] Software interrupt
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    ORA [$00]               ; [07 00      ] OR A with [DP]
    BRK                     ; [00 01      ] Software interrupt
    ASL $FC08,X             ; [1E 08 FC   ] Shift Left Absolute,X
    BRK                     ; [00 3C      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 4C      ] Software interrupt
    BRK                     ; [00 CC      ] Software interrupt
    BRK                     ; [00 74      ] Software interrupt
    BRA $8371               ; [80 40      ] Branch Always
    BCS $82D3               ; [B0 A0      ] Branch if Carry Set
    BVC $82B9               ; [50 84      ] Branch if Overflow Clear
    PLA                     ; [68         ] Pull Accumulator
    STY $8860               ; [8C 60 88   ] Store Y to Absolute
    MVP $30,$80             ; [44 30 80   ] Block Move Positive
    SEC                     ; [38         ] Set Carry Flag
    PHP                     ; [08         ] Push Processor Status
    BCS $8378               ; [B0 38      ] Branch if Carry Set
    PHA                     ; [48         ] Push Accumulator
    ORA ($4E,X)             ; [01 4E      ] OR A with (DP,X)
    BRK                     ; [00 3F      ] Software interrupt
    ORA [$14]               ; [07 14      ] OR A with [DP]
    ORA $22,S               ; [03 22      ] OR A with Stack Relative
    BRK                     ; [00 23      ] Software interrupt
    BRK                     ; [00 24      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    SEC                     ; [38         ] Set Carry Flag
    BRK                     ; [00 3D      ] Software interrupt
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA #$38                ; [09 38      ] OR A with Immediate
    BRK                     ; [00 07      ] Software interrupt
    PHD                     ; [0B         ] Push Direct Page Register
    ORA $18,S               ; [03 18      ] OR A with Stack Relative
    db $05                      ; Incomplete/data bytes

;--- Patch at file offset $148360 (SNES $D48360) ---
org $D48360

    STZ $C0                 ; [64 C0      ] Store Zero to DP
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 E0      ] Software interrupt
    CPY #$90                ; [C0 90      ] Compare Y Immediate
    CPX #$10                ; [E0 10      ] Compare X Immediate
    BRA $8373               ; [80 08      ] Branch Always
    BRK                     ; [00 C8      ] Software interrupt
    BMI $83E7               ; [30 78      ] Branch if Minus
    BRK                     ; [00 C0      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    LDY #$60                ; [A0 60      ] Load Y Immediate
    BCC $83AD               ; [90 30      ] Branch if Carry Clear
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 41      ] Software interrupt
    ASL $0049               ; [0E 49 00   ] Shift Left Absolute
    AND $0F1B07,X           ; [3F 07 1B 0F] AND A with Absolute Long,X
    JSL $304209             ; [22 09 42 30] Jump to Subroutine Long
    AND $08,X               ; [35 08      ] AND A with DP,X
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 26      ] Software interrupt
    BPL $8395               ; [10 00      ] Branch if Plus
    ORA [$04]               ; [07 04      ] OR A with [DP]
    ORA $390D19             ; [0F 19 0D 39] OR A with Absolute Long
    TSB $08                 ; [04 08      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 28      ] Software interrupt
    BRK                     ; [00 28      ] Software interrupt
    BRK                     ; [00 F0      ] Software interrupt
    BRK                     ; [00 60      ] Software interrupt
    CPY #$20                ; [C0 20      ] Compare Y Immediate
    RTI                     ; [40         ] Return from Interrupt
    BPL $840C               ; [10 60      ] Branch if Plus
    JSR $C0C0               ; [20 C0 C0   ] Jump to Subroutine
    BRK                     ; [00 E0      ] Software interrupt
    BMI $8393               ; [30 E0      ] Branch if Minus
    BMI $83B5               ; [30 00      ] Branch if Minus
    BRK                     ; [00 80      ] Software interrupt
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    BRK                     ; [00 C0      ] Software interrupt

;--- Patch at file offset $1483C6 (SNES $D483C6) ---
org $D483C6

    BRK                     ; [00 00      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    ORA $01                 ; [05 01      ] OR A with Direct Page
    ORA $02                 ; [05 02      ] OR A with Direct Page
    db $0F, $00                 ; Incomplete/data bytes

;--- Patch at file offset $1483D8 (SNES $D483D8) ---
org $D483D8

    BRK                     ; [00 00      ] Software interrupt
    ORA $02,S               ; [03 02      ] OR A with Stack Relative
    COP #$00                ; [02 00      ] Coprocessor interrupt
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $1483E6 (SNES $D483E6) ---
org $D483E6

    BRK                     ; [00 00      ] Software interrupt
    BVS $83EA               ; [70 00      ] Branch if Overflow Set
    DEY                     ; [88         ] Decrement Y
    BVS $8421               ; [70 34      ] Branch if Overflow Set
    INY                     ; [C8         ] Increment Y
    db $7E, $C0                 ; Incomplete/data bytes

;--- Patch at file offset $1483F8 (SNES $D483F8) ---
org $D483F8

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    BNE $8406               ; [D0 08      ] Branch if Not Equal
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
    BRA $8449               ; [80 0C      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    JMP $7290               ; [4C 90 72   ] Jump Absolute
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    LDY #$00                ; [A0 00      ] Load Y Immediate
    STA ($00),Y             ; [91 00      ] Store A to (DP),Y
    STZ $7000,X             ; [9E 00 70   ] Store Zero to Absolute,X
    ASL $1E7A               ; [0E 7A 1E   ] Shift Left Absolute
    LDA $00,S               ; [A3 00      ] Load A from Stack Relative
    SBC $000400,X           ; [FF 00 04 00] Subtract with Borrow Absolute Long,X
    LSR $4C01,X             ; [5E 01 4C   ] Shift Right Absolute,X
    JSL $2F2140             ; [22 40 21 2F] Jump to Subroutine Long
    JSR $1E05               ; [20 05 1E   ] Jump to Subroutine
    BVC $846A               ; [50 0C      ] Branch if Overflow Clear
    BRK                     ; [00 00      ] Software interrupt
    JMP ($8C00,X)           ; [7C 00 8C   ] Jump Indirect,X
    BRK                     ; [00 CC      ] Software interrupt
    BRK                     ; [00 7C      ] Software interrupt
    BRK                     ; [00 38      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    CPY #$F0                ; [C0 F0      ] Compare Y Immediate
    BRK                     ; [00 08      ] Software interrupt
    BRA $84D3               ; [80 60      ] Branch Always
    BPL $849D               ; [10 28      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    TYA                     ; [98         ] Transfer Y to A
    BRA $84BA               ; [80 40      ] Branch Always
    BRA $84BC               ; [80 40      ] Branch Always
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BRK                     ; [00 00      ] Software interrupt
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $10                 ; [06 10      ] Shift Left DP
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    AND $1102,Y             ; [39 02 11   ] AND A with Absolute,Y
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($04,X)             ; [01 04      ] OR A with (DP,X)
    COP #$01                ; [02 01      ] Coprocessor interrupt
    BRK                     ; [00 11      ] Software interrupt
    ASL $0009               ; [0E 09 00   ] Shift Left Absolute
    ORA $0F1B07             ; [0F 07 1B 0F] OR A with Absolute Long
    JSL $304209             ; [22 09 42 30] Jump to Subroutine Long
    AND $08,X               ; [35 08      ] AND A with DP,X
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 0E      ] Software interrupt
    BRK                     ; [00 06      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA [$04]               ; [07 04      ] OR A with [DP]
    ORA $390D19             ; [0F 19 0D 39] OR A with Absolute Long
    TSB $08                 ; [04 08      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 51      ] Software interrupt
    JSR $003C               ; [20 3C 00   ] Jump to Subroutine
    ASL $04,X               ; [16 04      ] Shift Left DP,X
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    TRB $06                 ; [14 06      ] Test and Reset Bits DP
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    ASL                     ; [0A         ] Shift Left Accumulator
    ORA ($1C,X)             ; [01 1C      ] OR A with (DP,X)
    BRK                     ; [00 06      ] Software interrupt
    AND $1102,Y             ; [39 02 11   ] AND A with Absolute,Y
    PHP                     ; [08         ] Push Processor Status
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    BRK                     ; [00 05      ] Software interrupt
    BRK                     ; [00 03      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    CPY #$3C                ; [C0 3C      ] Compare Y Immediate
    JSR $28C4               ; [20 C4 28   ] Jump to Subroutine
    PLA                     ; [68         ] Pull Accumulator
    BRA $84FD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $8555               ; [90 5C      ] Branch if Carry Clear
    BRA $8507               ; [80 0C      ] Branch Always
    BPL $84C5               ; [10 C8      ] Branch if Plus
    TSB $20                 ; [04 20      ] Test and Set Bits in DP
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $148506 (SNES $D48506) ---
org $D48506

    TCS                     ; [1B         ] Transfer A to Stack Pointer
    ORA $420922             ; [0F 22 09 42] OR A with Absolute Long
    BMI $8542               ; [30 35      ] Branch if Minus

;--- Patch at file offset $148516 (SNES $D48516) ---
org $D48516

    TSB $0F                 ; [04 0F      ] Test and Set Bits in DP
    ORA $390D,Y             ; [19 0D 39   ] OR A with Absolute,Y
    TSB $08                 ; [04 08      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 E0      ] Software interrupt
    CPY #$60                ; [C0 60      ] Compare Y Immediate
    BRK                     ; [00 E0      ] Software interrupt
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    BRA $8549               ; [80 20      ] Branch Always
    BRK                     ; [00 10      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    JSR $C0C0               ; [20 C0 C0   ] Jump to Subroutine
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $8535               ; [80 00      ] Branch Always
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    BRA $8539               ; [80 00      ] Branch Always
    CPY #$E0                ; [C0 E0      ] Compare Y Immediate
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    CPY #$48                ; [C0 48      ] Compare Y Immediate
    BCS $8521               ; [B0 D8      ] Branch if Carry Set
    BMI $853F               ; [30 F4      ] Branch if Minus
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
    BRK                     ; [00 9E      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    BRK                     ; [00 1C      ] Software interrupt
    BRK                     ; [00 C4      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine
    BRA $858D               ; [80 18      ] Branch Always
    CPY #$58                ; [C0 58      ] Compare Y Immediate
    BRA $85A9               ; [80 30      ] Branch Always
    BCS $85EF               ; [B0 74      ] Branch if Carry Set
    BPL $855D               ; [10 E0      ] Branch if Plus
    TRB $40                 ; [14 40      ] Test and Reset Bits DP
    TAY                     ; [A8         ] Transfer A to Y
    EOR ($0F,X)             ; [41 0F      ] XOR A with (DP,X)
    PHA                     ; [48         ] Push Accumulator
    BRK                     ; [00 3F      ] Software interrupt
    ORA [$1B]               ; [07 1B      ] OR A with [DP]
    ORA $420922             ; [0F 22 09 42] OR A with Absolute Long
    BMI $85C2               ; [30 35      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 3F      ] Software interrupt
    BRK                     ; [00 26      ] Software interrupt
    ORA ($00),Y             ; [11 00      ] OR A with (DP),Y
    ORA [$04]               ; [07 04      ] OR A with [DP]
    ORA $390D19             ; [0F 19 0D 39] OR A with Absolute Long
    TSB $08                 ; [04 08      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 B8      ] Software interrupt
    BRA $8593               ; [80 F0      ] Branch Always
    BRK                     ; [00 A0      ] Software interrupt
    CPY #$60                ; [C0 60      ] Compare Y Immediate
    BRA $85C9               ; [80 20      ] Branch Always
    BRK                     ; [00 10      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    JSR $C0C0               ; [20 C0 C0   ] Jump to Subroutine
    BRK                     ; [00 80      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BRK                     ; [00 20      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    CPY #$80                ; [C0 80      ] Compare Y Immediate
    BRA $85F9               ; [80 40      ] Branch Always
    BRA $859B               ; [80 E0      ] Branch Always
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    BRK                     ; [00 19      ] Software interrupt
    ASL $27                 ; [06 27      ] Shift Left DP
    CLC                     ; [18         ] Clear Carry Flag
    AND $215810             ; [2F 10 58 21] AND A with Absolute Long
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BRK                     ; [00 00      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $860D               ; [10 2F      ] Branch if Plus
    ASL $39                 ; [06 39      ] Shift Left DP
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BVS $85A4               ; [70 C0      ] Branch if Overflow Set
    PHA                     ; [48         ] Push Accumulator
    BCS $85BB               ; [B0 D4      ] Branch if Carry Set
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
    BRK                     ; [00 29      ] Software interrupt
    BRK                     ; [00 2F      ] Software interrupt
    ORA ($11,X)             ; [01 11      ] OR A with (DP,X)
    ORA $081102             ; [0F 02 11 08] OR A with Absolute Long
    ORA ($28,X)             ; [01 28      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    AND ($2E,X)             ; [21 2E      ] AND A with (DP,X)
    AND ($04,X)             ; [21 04      ] AND A with (DP,X)
    ORA ($01)               ; [12 01      ] OR A with (DP)
    BPL $862E               ; [10 0F      ] Branch if Plus
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 BE      ] Software interrupt
    BRK                     ; [00 9E      ] Software interrupt
    BRK                     ; [00 1C      ] Software interrupt
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 A0      ] Software interrupt
    BRA $8675               ; [80 44      ] Branch Always
    BRA $8657               ; [80 24      ] Branch Always
    BCC $8659               ; [90 24      ] Branch if Carry Clear
    BPL $86AB               ; [10 74      ] Branch if Plus
    BMI $8681               ; [30 48      ] Branch if Minus
    BIT $C8                 ; [24 C8      ] Test Bits DP
    JSR $A040               ; [20 40 A0   ] Jump to Subroutine
    BRA $8680               ; [80 40      ] Branch Always
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 0F      ] Software interrupt
    ORA [$0D]               ; [07 0D      ] OR A with [DP]
    ORA [$11]               ; [07 11      ] OR A with [DP]
    TSB $21                 ; [04 21      ] Test and Set Bits in DP
    CLC                     ; [18         ] Clear Carry Flag
    INC                     ; [1A         ] Increment Accumulator
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 06      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA [$02]               ; [07 02      ] OR A with [DP]
    ORA [$0C]               ; [07 0C      ] OR A with [DP]
    ASL $1C                 ; [06 1C      ] Shift Left DP
    COP #$04                ; [02 04      ] Coprocessor interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 A0      ] Software interrupt
    CPY #$B0                ; [C0 B0      ] Compare Y Immediate
    CPY #$10                ; [C0 10      ] Compare Y Immediate
    BRA $8671               ; [80 08      ] Branch Always
    BMI $85FB               ; [30 90      ] Branch if Minus
    RTS                     ; [60         ] Return from Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 40      ] Software interrupt
    CPY #$40                ; [C0 40      ] Compare Y Immediate
    CPY #$A0                ; [C0 A0      ] Compare Y Immediate
    CPY #$F0                ; [C0 F0      ] Compare Y Immediate
    BRK                     ; [00 60      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 1A      ] Software interrupt
    BRK                     ; [00 2D      ] Software interrupt
    INC                     ; [1A         ] Increment Accumulator
    AND $3F02               ; [2D 02 3F   ] AND A with Absolute
    BRK                     ; [00 4F      ] Software interrupt
    BMI $86E6               ; [30 59      ] Branch if Minus
    ROL $BE                 ; [26 BE      ] Rotate Left DP
    EOR ($00,X)             ; [41 00      ] XOR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 1A      ] Software interrupt
    BRK                     ; [00 12      ] Software interrupt
    BPL $86A5               ; [10 0C      ] Branch if Plus
    ORA ($0F,X)             ; [01 0F      ] OR A with (DP,X)
    BMI $86B6               ; [30 19      ] Branch if Minus
    ROL $30                 ; [26 30      ] Rotate Left DP
    EOR $E00000             ; [4F 00 00 E0] XOR A with Absolute Long
    BRK                     ; [00 90      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    INX                     ; [E8         ] Increment X
    BPL $86A1               ; [10 F8      ] Branch if Plus
    BRK                     ; [00 F8      ] Software interrupt
    BRK                     ; [00 7C      ] Software interrupt
    BRA $86AD               ; [80 FE      ] Branch Always
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    CPX #$10                ; [E0 10      ] Compare X Immediate
    BMI $86FA               ; [30 40      ] Branch if Minus
    BPL $865C               ; [10 A0      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    BNE $8647               ; [D0 88      ] Branch if Not Equal
    MVN $B1,$40             ; [54 B1 40   ] Block Move Negative
    BVS $86C4               ; [70 00      ] Branch if Overflow Set
    JSR $B100               ; [20 00 B1   ] Jump to Subroutine
    BRK                     ; [00 AA      ] Software interrupt
    BRK                     ; [00 70      ] Software interrupt
    BRK                     ; [00 2B      ] Software interrupt
    BRK                     ; [00 1E      ] Software interrupt
    ORA #$01                ; [09 01      ] OR A with Immediate
    ROR $110E,X             ; [7E 0E 11   ] Rotate Right Absolute,X
    ASL $4E01,X             ; [1E 01 4E   ] Shift Left Absolute,X
    BRK                     ; [00 15      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    AND $100420             ; [2F 20 04 10] AND A with Absolute Long
    ORA #$00                ; [09 00      ] OR A with Immediate
    INC $F200,X             ; [FE 00 F2   ] Increment Absolute,X
    BRK                     ; [00 B2      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 44      ] Software interrupt
    BRK                     ; [00 C8      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    BVS $86CE               ; [70 E0      ] Branch if Overflow Set
    BPL $86B0               ; [10 C0      ] Branch if Plus
    BRA $8752               ; [80 60      ] Branch Always
    PHP                     ; [08         ] Push Processor Status
    CPX $5C                 ; [E4 5C      ] Compare X with DP
    BCC $870F               ; [90 18      ] Branch if Carry Clear
    TYA                     ; [98         ] Transfer Y to A
    BMI $8682               ; [30 88      ] Branch if Minus
    RTI                     ; [40         ] Return from Interrupt
    BMI $86DD               ; [30 E0      ] Branch if Minus
    BRK                     ; [00 C0      ] Software interrupt
    JSR $030C               ; [20 0C 03   ] Jump to Subroutine
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    ORA $23                 ; [05 23      ] OR A with Direct Page
    COP #$42                ; [02 42      ] Coprocessor interrupt
    JSR $3046               ; [20 46 30   ] Jump to Subroutine
    db $3C, $02                 ; Incomplete/data bytes

;--- Patch at file offset $148714 (SNES $D48714) ---
org $D48714

    TSB $3912               ; [0C 12 39   ] Test and Set Bits Absolute

;--- Patch at file offset $148720 (SNES $D48720) ---
org $D48720

    SEC                     ; [38         ] Set Carry Flag
    JSR $F8F4               ; [20 F4 F8   ] Jump to Subroutine
    TAY                     ; [A8         ] Transfer A to Y
    BVS $8757               ; [70 30      ] Branch if Overflow Set
    BRK                     ; [00 20      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    JSR $F808               ; [20 08 F8   ] Jump to Subroutine
    BVC $87A6               ; [50 70      ] Branch if Overflow Clear
    BRA $8778               ; [80 40      ] Branch Always
    BRA $877A               ; [80 40      ] Branch Always
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $148744 (SNES $D48744) ---
org $D48744

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    AND $215810             ; [2F 10 58 21] AND A with Absolute Long
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt
    ORA [$18]               ; [07 18      ] OR A with [DP]
    ORA #$16                ; [09 16      ] OR A with Immediate
    BPL $878F               ; [10 2F      ] Branch if Plus
    BRK                     ; [00 00      ] Software interrupt
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    BVS $8726               ; [70 C0      ] Branch if Overflow Set
    PHA                     ; [48         ] Push Accumulator
    BCS $8741               ; [B0 D8      ] Branch if Carry Set
    BMI $875F               ; [30 F4      ] Branch if Minus
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
    BMI $8784               ; [30 00      ] Branch if Minus
    BPL $8786               ; [10 00      ] Branch if Plus
    ORA ($00)               ; [12 00      ] OR A with (DP)
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    BPL $878C               ; [10 00      ] Branch if Plus
    ASL $2900,X             ; [1E 00 29   ] Shift Left Absolute,X
    BRK                     ; [00 06      ] Software interrupt
    AND $110E,Y             ; [39 0E 11   ] AND A with Absolute,Y
    ASL $0C01               ; [0E 01 0C   ] Shift Left Absolute
    ORA ($0A,X)             ; [01 0A      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA ($1E,X)             ; [01 1E      ] OR A with (DP,X)
    PHP                     ; [08         ] Push Processor Status
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 6E      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 D4      ] Software interrupt
    BRA $8775               ; [80 C4      ] Branch Always
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $87BD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $8805               ; [90 4C      ] Branch if Carry Clear
    BRA $87BF               ; [80 04      ] Branch Always
    BCC $87BD               ; [90 00      ] Branch if Carry Clear
    BIT $B0,X               ; [34 B0      ] Test Bits DP,X
    CLC                     ; [18         ] Clear Carry Flag
    EOR ($20),Y             ; [51 20      ] XOR A with (DP),Y
    BMI $87C4               ; [30 00      ] Branch if Minus
    BPL $87C6               ; [10 00      ] Branch if Plus
    ORA ($00)               ; [12 00      ] OR A with (DP)
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    BPL $87CC               ; [10 00      ] Branch if Plus
    ASL $2900,X             ; [1E 00 29   ] Shift Left Absolute,X
    BRK                     ; [00 06      ] Software interrupt
    AND $110E,Y             ; [39 0E 11   ] AND A with Absolute,Y
    ASL $0C01               ; [0E 01 0C   ] Shift Left Absolute
    ORA ($0A,X)             ; [01 0A      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA ($1E,X)             ; [01 1E      ] OR A with (DP,X)
    PHP                     ; [08         ] Push Processor Status
    INC $FC00,X             ; [FE 00 FC   ] Increment Absolute,X
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 BC      ] Software interrupt
    BRK                     ; [00 3E      ] Software interrupt
    BRK                     ; [00 6E      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 D4      ] Software interrupt
    BRA $87B5               ; [80 C4      ] Branch Always
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $87FD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $8845               ; [90 4C      ] Branch if Carry Clear
    BRA $87FF               ; [80 04      ] Branch Always
    BCC $87FD               ; [90 00      ] Branch if Carry Clear
    BIT $B0,X               ; [34 B0      ] Test Bits DP,X
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TSB $27                 ; [04 27      ] Test and Set Bits in DP
    CLC                     ; [18         ] Clear Carry Flag
    BIT $5A13               ; [2C 13 5A   ] Test Bits Absolute
    db $21                      ; Incomplete/data bytes

;--- Patch at file offset $148816 (SNES $D48816) ---
org $D48816

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
    BVC $8862               ; [50 20      ] Branch if Overflow Clear
    BIT $1600,X             ; [3C 00 16   ] Test Bits Absolute,X
    TSB $14                 ; [04 14      ] Test and Set Bits in DP
    ASL $14                 ; [06 14      ] Shift Left DP
    ASL $70                 ; [06 70      ] Shift Left DP
    BRK                     ; [00 88      ] Software interrupt
    BMI $884E               ; [30 FF      ] Branch if Minus
    BPL $8851               ; [10 00      ] Branch if Plus
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
    BRA $887D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $88C5               ; [90 4C      ] Branch if Carry Clear
    BCC $887F               ; [90 04      ] Branch if Carry Clear
    BRA $88F5               ; [80 78      ] Branch Always
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
    SBC $066E00,X           ; [FF 00 6E 06] Subtract with Borrow Absolute Long,X
    LSR $20                 ; [46 20      ] Shift Right DP
    ORA [$10]               ; [07 10      ] OR A with [DP]
    ORA [$30],Y             ; [17 30      ] OR A with [DP],Y
    JSR $2B23               ; [20 23 2B   ] Jump to Subroutine
    PLA                     ; [68         ] Pull Accumulator
    PHY                     ; [5A         ] Push Y Register
    TCD                     ; [5B         ] Transfer A to Direct Page
    BRK                     ; [00 00      ] Software interrupt
    BIT $3C00,X             ; [3C 00 3C   ] Test Bits Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    JSR ($FCC8,X)           ; [FC C8 FC   ] Jump to Subroutine Indirect,X
    INY                     ; [C8         ] Increment Y
    LDY $BE48,X             ; [BC 48 BE   ] Load Y from Absolute,X
    MVP $9E,$60             ; [44 9E 60   ] Block Move Positive
    INC $C000,X             ; [FE 00 C0   ] Increment Absolute,X
    BRK                     ; [00 C0      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    BPL $88CE               ; [10 18      ] Branch if Plus
    BCC $88D0               ; [90 18      ] Branch if Carry Clear
    BVC $8912               ; [50 58      ] Branch if Overflow Clear
    CLI                     ; [58         ] Clear Interrupt Disable
    db $5C, $6C, $6C            ; Incomplete/data bytes

;--- Patch at file offset $1488C4 (SNES $D488C4) ---
org $D488C4

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TSB $27                 ; [04 27      ] Test and Set Bits in DP
    CLC                     ; [18         ] Clear Carry Flag
    BIT $5A13               ; [2C 13 5A   ] Test Bits Absolute
    db $21                      ; Incomplete/data bytes

;--- Patch at file offset $1488D6 (SNES $D488D6) ---
org $D488D6

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
    BVC $8922               ; [50 20      ] Branch if Overflow Clear
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
    BVS $88B7               ; [70 88      ] Branch if Overflow Set
    BRK                     ; [00 C4      ] Software interrupt
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $893D               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $8985               ; [90 4C      ] Branch if Carry Clear
    BCC $893F               ; [90 04      ] Branch if Carry Clear
    PHP                     ; [08         ] Push Processor Status
    BEQ $892E               ; [F0 F0      ] Branch if Equal
    BVS $89B0               ; [70 70      ] Branch if Overflow Set
    BIT $00                 ; [24 00      ] Test Bits DP
    ROR $7B04,X             ; [7E 04 7B   ] Rotate Right Absolute,X
    ORA [$E8]               ; [07 E8      ] OR A with [DP]
    ORA [$E4],Y             ; [17 E4      ] OR A with [DP],Y
    CLC                     ; [18         ] Clear Carry Flag
    INY                     ; [C8         ] Increment Y
    BMI $891C               ; [30 CF      ] Branch if Minus
    db $32                      ; Incomplete/data bytes

;--- Patch at file offset $148958 (SNES $D48958) ---
org $D48958

    TCD                     ; [5B         ] Transfer A to Direct Page
    CLI                     ; [58         ] Clear Interrupt Disable
    ROR $71,X               ; [76 71      ] Rotate Right DP,X
    STZ $76,X               ; [74 76      ] Store Zero to DP,X
    BRK                     ; [00 00      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    BRK                     ; [00 78      ] Software interrupt
    BPL $8961               ; [10 FC      ] Branch if Plus
    INY                     ; [C8         ] Increment Y
    INC $FECC,X             ; [FE CC FE   ] Increment Absolute,X
    TSB $5E                 ; [04 5E      ] Test and Set Bits in DP
    BIT $FC                 ; [24 FC      ] Test Bits DP
    BRA $8947               ; [80 D8      ] Branch Always
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BCS $8985               ; [B0 10      ] Branch if Carry Set
    CLC                     ; [18         ] Clear Carry Flag
    BPL $8994               ; [10 1C      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    TRB $AC28               ; [1C 28 AC   ] Test and Reset Bits Absolute
    PHP                     ; [08         ] Push Processor Status
    DEY                     ; [88         ] Decrement Y
    BRK                     ; [00 00      ] Software interrupt
    STA $9B08,Y             ; [99 08 9B   ] Store A to Absolute,Y
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $14898B (SNES $D4898B) ---
org $D4898B

    BPL $89C9               ; [10 3C      ] Branch if Plus
    PHD                     ; [0B         ] Push Direct Page Register
    ORA $066E00             ; [0F 00 6E 06] OR A with Absolute Long
    db $46                      ; Incomplete/data bytes

;--- Patch at file offset $14899A (SNES $D4899A) ---
org $D4899A

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
    BRK                     ; [00 C0      ] Software interrupt
    BRK                     ; [00 C0      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    BPL $89CE               ; [10 18      ] Branch if Plus
    CLC                     ; [18         ] Clear Carry Flag
    TRB $8C48               ; [1C 48 8C   ] Test and Reset Bits Absolute
    STY $146C               ; [8C 6C 14   ] Store Y to Absolute
    db $D4                      ; Incomplete/data bytes

;--- Patch at file offset $1489C8 (SNES $D489C8) ---
org $D489C8

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    db $0F, $00                 ; Incomplete/data bytes

;--- Patch at file offset $1489DA (SNES $D489DA) ---
org $D489DA

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)

;--- Patch at file offset $1489E8 (SNES $D489E8) ---
org $D489E8

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BCS $89EE               ; [B0 00      ] Branch if Carry Set
    INX                     ; [E8         ] Increment X
    db $90                      ; Incomplete/data bytes

;--- Patch at file offset $1489FB (SNES $D489FB) ---
org $D489FB

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BCC $8A38               ; [90 37      ] Branch if Carry Clear
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
    BPL $8A21               ; [10 03      ] Branch if Plus
    BPL $8A23               ; [10 03      ] Branch if Plus
    PEA $F448               ; [F4 48 F4   ] Push Effective Absolute
    PHP                     ; [08         ] Push Processor Status
    JSR ($7C00,X)           ; [FC 00 7C   ] Jump to Subroutine Indirect,X
    BRA $8A21               ; [80 F8      ] Branch Always
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 7E      ] Software interrupt
    BRK                     ; [00 10      ] Software interrupt
    PHA                     ; [48         ] Push Accumulator
    BPL $89DC               ; [10 A8      ] Branch if Plus
    DEY                     ; [88         ] Decrement Y
    BPL $8A3F               ; [10 08      ] Branch if Plus
    BNE $89B9               ; [D0 80      ] Branch if Not Equal
    BVC $8A03               ; [50 C8      ] Branch if Overflow Clear
    BPL $8A49               ; [10 0C      ] Branch if Plus
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
    BPL $8A65               ; [10 FC      ] Branch if Plus
    SEC                     ; [38         ] Set Carry Flag
    ROL $FF04,X             ; [3E 04 FF   ] Rotate Left Absolute,X
    PER $8B6F               ; [62 FF 00   ] Push Effective Relative
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
    BPL $8A8C               ; [10 00      ] Branch if Plus
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

;--- Patch at file offset $148AAB (SNES $D48AAB) ---
org $D48AAB

    BPL $8AE9               ; [10 3C      ] Branch if Plus
    PHD                     ; [0B         ] Push Direct Page Register
    ORA $060E00             ; [0F 00 0E 06] OR A with Absolute Long
    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $148ABA (SNES $D48ABA) ---
org $D48ABA

    PLP                     ; [28         ] Pull Processor Status
    BIT $03,X               ; [34 03      ] Test Bits DP,X
    PHD                     ; [0B         ] Push Direct Page Register
    BRK                     ; [00 00      ] Software interrupt
    BVC $8AE2               ; [50 20      ] Branch if Overflow Clear
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
    BRA $8B2B               ; [80 3C      ] Branch Always
    BRA $8AB5               ; [80 C4      ] Branch Always
    PLP                     ; [28         ] Pull Processor Status
    PLA                     ; [68         ] Pull Accumulator
    BRA $8AFD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $8B45               ; [90 4C      ] Branch if Carry Clear
    BCC $8B17               ; [90 1C      ] Branch if Carry Clear
    JSR $908C               ; [20 8C 90   ] Jump to Subroutine
    INY                     ; [C8         ] Increment Y
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $148B0B (SNES $D48B0B) ---
org $D48B0B

    BPL $8B49               ; [10 3C      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $148B1A (SNES $D48B1A) ---
org $D48B1A

    PLP                     ; [28         ] Pull Processor Status
    BIT $00,X               ; [34 00      ] Test Bits DP,X
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    JSR $30F8               ; [20 F8 30   ] Jump to Subroutine
    JSR ($FC10,X)           ; [FC 10 FC   ] Jump to Subroutine Indirect,X
    PHP                     ; [08         ] Push Processor Status
    ROR $7E04,X             ; [7E 04 7E   ] Rotate Right Absolute,X
    RTS                     ; [60         ] Return from Subroutine
    INC $F0C0               ; [EE C0 F0   ] Increment Absolute
    BRK                     ; [00 80      ] Software interrupt
    LDY #$40                ; [A0 40      ] Load Y Immediate
    BVS $8B15               ; [70 E0      ] Branch if Overflow Set
    BEQ $8BA7               ; [F0 70      ] Branch if Equal
    SEI                     ; [78         ] Set Interrupt Disable
    CLC                     ; [18         ] Clear Carry Flag
    STZ $6484               ; [9C 84 64   ] Store Zero to Absolute
    BRK                     ; [00 C0      ] Software interrupt
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
    BRA $8B89               ; [80 10      ] Branch Always
    TAY                     ; [A8         ] Transfer A to Y
    RTI                     ; [40         ] Return from Interrupt
    BMI $8B5D               ; [30 E0      ] Branch if Minus
    BPL $8BBF               ; [10 40      ] Branch if Plus
    db $A0                      ; Incomplete/data bytes

;--- Patch at file offset $148B86 (SNES $D48B86) ---
org $D48B86

    SBC $4B,X               ; [F5 4B      ] Subtract with Borrow DP,X
    SEP #$00                ; [E2 00      ] Set Processor Status Bits
    SBC ($10,S),Y           ; [F3 10      ] Subtract with Borrow (SR),Y
    BIT $1D08,X             ; [3C 08 1D   ] Test Bits Absolute,X

;--- Patch at file offset $148B96 (SNES $D48B96) ---
org $D48B96

    PLD                     ; [2B         ] Pull Direct Page Register
    RTS                     ; [60         ] Return from Subroutine
    BVC $8BE7               ; [50 4D      ] Branch if Overflow Clear
    PLP                     ; [28         ] Pull Processor Status
    BIT $00,X               ; [34 00      ] Test Bits DP,X
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    CLV                     ; [B8         ] Clear Overflow Flag
    BCC $8B9F               ; [90 FC      ] Branch if Carry Clear
    PHP                     ; [08         ] Push Processor Status
    JSR ($DEC0,X)           ; [FC C0 DE   ] Jump to Subroutine Indirect,X
    LDY $2E                 ; [A4 2E      ] Load Y from DP
    BPL $8C29               ; [10 7E      ] Branch if Plus
    RTS                     ; [60         ] Return from Subroutine
    INC $C6D0               ; [EE D0 C6   ] Increment Absolute
    BRK                     ; [00 80      ] Software interrupt
    BVC $8BC3               ; [50 10      ] Branch if Overflow Clear
    CLC                     ; [18         ] Clear Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    TAY                     ; [A8         ] Transfer A to Y
    BIT $9454               ; [2C 54 94   ] Test Bits Absolute
    STY $64                 ; [84 64      ] Store Y to DP
    TRB $D4                 ; [14 D4      ] Test and Reset Bits DP

;--- Patch at file offset $148BC4 (SNES $D48BC4) ---
org $D48BC4

    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $2706,Y             ; [19 06 27   ] OR A with Absolute,Y
    CLC                     ; [18         ] Clear Carry Flag
    BIT $5913               ; [2C 13 59   ] Test Bits Absolute
    JSR $2050               ; [20 50 20   ] Jump to Subroutine

;--- Patch at file offset $148BD6 (SNES $D48BD6) ---
org $D48BD6

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
    BMI $8C1D               ; [30 00      ] Branch if Minus
    BPL $8C2E               ; [10 0F      ] Branch if Plus
    ASL $FE                 ; [06 FE      ] Shift Left DP
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 CE      ] Software interrupt
    BRK                     ; [00 FE      ] Software interrupt
    RTS                     ; [60         ] Return from Subroutine
    STZ $1C00,X             ; [9E 00 1C   ] Store Zero to Absolute,X
    BRK                     ; [00 18      ] Software interrupt
    BRK                     ; [00 B8      ] Software interrupt
    BCC $8C75               ; [90 44      ] Branch if Carry Clear
    DEY                     ; [88         ] Decrement Y
    BIT $80,X               ; [34 80      ] Test Bits DP,X
    BIT $90                 ; [24 90      ] Test Bits DP
    TSB $68                 ; [04 68      ] Test and Set Bits in DP
    PHA                     ; [48         ] Push Accumulator
    BIT $C8                 ; [24 C8      ] Test Bits DP
    JSR $A040               ; [20 40 A0   ] Jump to Subroutine
    BRA $8C90               ; [80 50      ] Branch Always
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
    BPL $8C5B               ; [10 F8      ] Branch if Plus
    BCC $8C61               ; [90 FC      ] Branch if Carry Clear
    TYA                     ; [98         ] Transfer Y to A
    LDY $BC48,X             ; [BC 48 BC   ] Load Y from Absolute,X
    PHA                     ; [48         ] Push Accumulator
    JSR ($1800,X)           ; [FC 00 18   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BMI $8C93               ; [30 20      ] Branch if Minus
    BMI $8C15               ; [30 A0      ] Branch if Minus
    SEC                     ; [38         ] Set Carry Flag
    BVC $8CD0               ; [50 58      ] Branch if Overflow Clear
    BVC $8CD2               ; [50 58      ] Branch if Overflow Clear
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $148C84 (SNES $D48C84) ---
org $D48C84

    BRK                     ; [00 00      ] Software interrupt
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    TSB $03                 ; [04 03      ] Test and Set Bits in DP
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA $081702             ; [0F 02 17 08] OR A with Absolute Long

;--- Patch at file offset $148C97 (SNES $D48C97) ---
org $D48C97

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
    BRA $8CA9               ; [80 FC      ] Branch Always
    BRK                     ; [00 DE      ] Software interrupt
    JSR $0000               ; [20 00 00   ] Jump to Subroutine
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $8D1A               ; [80 60      ] Branch Always
    RTS                     ; [60         ] Return from Subroutine
    TYA                     ; [98         ] Transfer Y to A
    BEQ $8CC6               ; [F0 08      ] Branch if Equal
    CLI                     ; [58         ] Clear Interrupt Disable
    LDY $2E                 ; [A4 2E      ] Load Y from DP
    BPL $8D1F               ; [10 5C      ] Branch if Plus
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
    BPL $8CE0               ; [10 EE      ] Branch if Plus
    BRA $8D66               ; [80 72      ] Branch Always
    STY $0860               ; [8C 60 08   ] Store Y to Absolute
    STZ $80                 ; [64 80      ] Store Zero to DP
    JMP ($4C90)             ; [6C 90 4C   ] Jump Indirect
    JSR $E098               ; [20 98 E0   ] Jump to Subroutine
    TSB $F6                 ; [04 F6      ] Test and Set Bits in DP
    ORA ($47,X)             ; [01 47      ] OR A with (DP,X)
    COP #$0E                ; [02 0E      ] Coprocessor interrupt
    ORA $1E                 ; [05 1E      ] OR A with Direct Page
    BRK                     ; [00 38      ] Software interrupt
    BRK                     ; [00 6C      ] Software interrupt
    BIT $27,X               ; [34 27      ] Test Bits DP,X
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
    db $7F                      ; Incomplete/data bytes

;--- Patch at file offset $148D32 (SNES $D48D32) ---
org $D48D32

    STZ $06,X               ; [74 06      ] Store Zero to DP,X
    STY $06                 ; [84 06      ] Store Y to DP
    PEI ($66)               ; [D4 66      ] Push Effective Indirect
    TSB $E6                 ; [04 E6      ] Test and Set Bits in DP
    PHP                     ; [08         ] Push Processor Status
    db $6C                      ; Incomplete/data bytes

;--- Patch at file offset $148D44 (SNES $D48D44) ---
org $D48D44

    BRK                     ; [00 00      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    TSB $27                 ; [04 27      ] Test and Set Bits in DP
    CLC                     ; [18         ] Clear Carry Flag
    BIT $5B13               ; [2C 13 5B   ] Test Bits Absolute
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $148D56 (SNES $D48D56) ---
org $D48D56

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
    BVC $8DA2               ; [50 20      ] Branch if Overflow Clear
    BMI $8D84               ; [30 00      ] Branch if Minus
    BPL $8D86               ; [10 00      ] Branch if Plus
    ORA ($00,S),Y           ; [13 00      ] OR A with (SR),Y
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    BPL $8D8C               ; [10 00      ] Branch if Plus
    TSB $1F00               ; [0C 00 1F   ] Test and Set Bits Absolute
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    AND $0E130C,X           ; [3F 0C 13 0E] AND A with Absolute Long,X
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    BRK                     ; [00 0B      ] Software interrupt
    BRK                     ; [00 0E      ] Software interrupt
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
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
    BRA $8DBD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $8E05               ; [90 4C      ] Branch if Carry Clear
    BCC $8DBF               ; [90 04      ] Branch if Carry Clear
    DEY                     ; [88         ] Decrement Y
    SEI                     ; [78         ] Set Interrupt Disable
    SEI                     ; [78         ] Set Interrupt Disable
    SEC                     ; [38         ] Set Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    BVC $8DE2               ; [50 20      ] Branch if Overflow Clear
    BMI $8DC4               ; [30 00      ] Branch if Minus
    BPL $8DC6               ; [10 00      ] Branch if Plus
    ORA ($00,S),Y           ; [13 00      ] OR A with (SR),Y
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    BPL $8DCC               ; [10 00      ] Branch if Plus
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
    BRA $8DFD               ; [80 08      ] Branch Always
    CPX #$48                ; [E0 48      ] Compare X Immediate
    BCC $8E45               ; [90 4C      ] Branch if Carry Clear
    BCC $8DFF               ; [90 04      ] Branch if Carry Clear
    DEY                     ; [88         ] Decrement Y
    SEI                     ; [78         ] Set Interrupt Disable
    SEI                     ; [78         ] Set Interrupt Disable
    SEC                     ; [38         ] Set Carry Flag
    CLC                     ; [18         ] Clear Carry Flag
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
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
    BRK                     ; [00 4F      ] Software interrupt
    ORA [$00]               ; [07 00      ] OR A with [DP]
    AND $081300,X           ; [3F 00 13 08] AND A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($37,X)             ; [01 37      ] OR A with (DP,X)
    BRK                     ; [00 FE      ] Software interrupt
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
    LDY #$40                ; [A0 40      ] Load Y Immediate
    BRA $8F14               ; [80 60      ] Branch Always
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

    LSR                     ; [4A         ] Shift Right Accumulator
    PHP                     ; [08         ] Push Processor Status
    PLY                     ; [7A         ] Pull Y Register
    TSB $0B                 ; [04 0B      ] Test and Set Bits in DP
    ORA [$11]               ; [07 11      ] OR A with [DP]
    ORA $750022             ; [0F 22 00 75] OR A with Absolute Long
    BPL $8FC5               ; [10 38      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 2D      ] Software interrupt
    TRB $05                 ; [14 05      ] Test and Reset Bits DP
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
    BRK                     ; [00 A0      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
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
    BRK                     ; [00 0D      ] Software interrupt
    JSL $000F00             ; [22 00 0F 00] Jump to Subroutine Long
    BRK                     ; [00 00      ] Software interrupt
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
    BRK                     ; [00 08      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    AND $081300,X           ; [3F 00 13 08] AND A with Absolute Long,X
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($06,X)             ; [01 06      ] OR A with (DP,X)
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 FE      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
    BRK                     ; [00 FC      ] Software interrupt
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
    BIT $04                 ; [24 04      ] Test Bits DP
    ORA $0F1107,X           ; [1F 07 11 0F] OR A with Absolute Long,X
    JSL $107500             ; [22 00 75 10] Jump to Subroutine Long
    SEC                     ; [38         ] Set Carry Flag
    PHP                     ; [08         ] Push Processor Status
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 13      ] Software interrupt
    TSB $0F10               ; [0C 10 0F   ] Test and Set Bits Absolute
    ASL $00                 ; [06 00      ] Shift Left DP
    ORA $0D1000             ; [0F 00 10 0D] OR A with Absolute Long
    PLP                     ; [28         ] Pull Processor Status
    BMI $911D               ; [30 00      ] Branch if Minus
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 00      ] Software interrupt
    SEI                     ; [78         ] Set Interrupt Disable
    RTS                     ; [60         ] Return from Subroutine
    RTS                     ; [60         ] Return from Subroutine
    RTI                     ; [40         ] Return from Interrupt
    BEQ $9106               ; [F0 E0      ] Branch if Equal
    CPX #$C0                ; [E0 C0      ] Compare X Immediate
    JSR $3000               ; [20 00 30   ] Jump to Subroutine
    JSR $20F0               ; [20 F0 20   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 E0      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRA $9135               ; [80 00      ] Branch Always
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
    ORA ($00)               ; [12 00      ] OR A with (DP)
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    BPL $938C               ; [10 00      ] Branch if Plus
    TSB $1F00               ; [0C 00 1F   ] Test and Set Bits Absolute
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    AND $0E130C,X           ; [3F 0C 13 0E] AND A with Absolute Long,X
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    ORA ($0A,X)             ; [01 0A      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)
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
    ORA ($00)               ; [12 00      ] OR A with (DP)
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    BPL $93CC               ; [10 00      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 1F      ] Software interrupt
    TSB $00                 ; [04 00      ] Test and Set Bits in DP
    AND $0E130C,X           ; [3F 0C 13 0E] AND A with Absolute Long,X
    ORA ($0C,X)             ; [01 0C      ] OR A with (DP,X)
    ORA ($0A,X)             ; [01 0A      ] OR A with (DP,X)
    ORA ($0E,X)             ; [01 0E      ] OR A with (DP,X)
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

;--- Patch at file offset $149702 (SNES $D49702) ---
org $D49702

    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA #$06                ; [09 06      ] OR A with Immediate
    ORA [$08],Y             ; [17 08      ] OR A with [DP],Y
    AND $103F00,X           ; [3F 00 3F 10] AND A with Absolute Long,X
    SEI                     ; [78         ] Set Interrupt Disable
    AND [$76]               ; [27 76      ] AND A with [DP]
    ORA #$00                ; [09 00      ] OR A with Immediate
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    ASL $04                 ; [06 04      ] Shift Left DP
    PHD                     ; [0B         ] Push Direct Page Register
    BRK                     ; [00 0C      ] Software interrupt
    ORA ($12,X)             ; [01 12      ] OR A with (DP,X)
    BRK                     ; [00 2F      ] Software interrupt
    ROL $29                 ; [26 29      ] Rotate Left DP
    BRA $9722               ; [80 00      ] Branch Always
    BRA $9724               ; [80 00      ] Branch Always
    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $14972E (SNES $D4972E) ---
org $D4972E

    JSR ($0000,X)           ; [FC 00 00   ] Jump to Subroutine Indirect,X
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 80      ] Software interrupt
    BRK                     ; [00 20      ] Software interrupt
    BNE $9743               ; [D0 0A      ] Branch if Not Equal
    BPL $9701               ; [10 C6      ] Branch if Plus
    AND #$55                ; [29 55      ] AND A with Immediate
    LDX #$81                ; [A2 81      ] Load X Immediate
    db $72                      ; Incomplete/data bytes

;--- Patch at file offset $149760 (SNES $D49760) ---
org $D49760

    ROL $2D01,X             ; [3E 01 2D   ] Rotate Left Absolute,X
    db $12                      ; Incomplete/data bytes

;--- Patch at file offset $149770 (SNES $D49770) ---
org $D49770

    ASL $0D11               ; [0E 11 0D   ] Shift Left Absolute
    db $12                      ; Incomplete/data bytes

;--- Patch at file offset $149780 (SNES $D49780) ---
org $D49780

    SBC $01,S               ; [E3 01      ] Subtract with Borrow Stack Relative
    DEX                     ; [CA         ] Decrement X

;--- Patch at file offset $149790 (SNES $D49790) ---
org $D49790

    db $9C, $61                 ; Incomplete/data bytes

;--- Patch at file offset $14AEC0 (SNES $D4AEC0) ---
org $D4AEC0

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14AECC (SNES $D4AECC) ---
org $D4AECC

    STA $189D39,X           ; [9F 39 9D 18] Store A to Absolute Long,X

;--- Patch at file offset $14AEE0 (SNES $D4AEE0) ---
org $D4AEE0

    BRK                     ; [00 28      ] Software interrupt

;--- Patch at file offset $14AF00 (SNES $D4AF00) ---
org $D4AF00

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14AF20 (SNES $D4AF20) ---
org $D4AF20

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14AF40 (SNES $D4AF40) ---
org $D4AF40

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14AF4C (SNES $D4AF4C) ---
org $D4AF4C

    CPX #$65                ; [E0 65      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    db $49                      ; Incomplete/data bytes

;--- Patch at file offset $14AF56 (SNES $D4AF56) ---
org $D4AF56

    CMP ($6E)               ; [D2 6E      ] Compare A with (DP)
    PHA                     ; [48         ] Push Accumulator
    INC                     ; [1A         ] Increment Accumulator
    ADC $6E0E3F,X           ; [7F 3F 0E 6E] Add with Carry Absolute Long,X
    PLA                     ; [68         ] Pull Accumulator
    TCS                     ; [1B         ] Transfer A to Stack Pointer
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14AF80 (SNES $D4AF80) ---
org $D4AF80

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14AFA0 (SNES $D4AFA0) ---
org $D4AFA0

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14AFC0 (SNES $D4AFC0) ---
org $D4AFC0

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14AFE0 (SNES $D4AFE0) ---
org $D4AFE0

    BRK                     ; [00 04      ] Software interrupt

;--- Patch at file offset $14B000 (SNES $D4B000) ---
org $D4B000

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14B020 (SNES $D4B020) ---
org $D4B020

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14B040 (SNES $D4B040) ---
org $D4B040

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14B060 (SNES $D4B060) ---
org $D4B060

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14B080 (SNES $D4B080) ---
org $D4B080

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14B0A0 (SNES $D4B0A0) ---
org $D4B0A0

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14B0C0 (SNES $D4B0C0) ---
org $D4B0C0

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14B0E0 (SNES $D4B0E0) ---
org $D4B0E0

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14B100 (SNES $D4B100) ---
org $D4B100

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14B120 (SNES $D4B120) ---
org $D4B120

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14B140 (SNES $D4B140) ---
org $D4B140

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $14B160 (SNES $D4B160) ---
org $D4B160

    BRK                     ; [00 00      ] Software interrupt

;--- End of patch ---