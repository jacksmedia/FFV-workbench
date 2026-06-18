;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_ext-1.2.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_ext-1.2.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 12 record(s)

;--- Patch at file offset $020570 (SNES $C20570) ---
org $C20570

    STZ $7C62               ; [9C 62 7C   ] Store Zero to Absolute
    JSR $9923               ; [20 23 99   ] Jump to Subroutine
    JSR $175F               ; [20 5F 17   ] Jump to Subroutine
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $2056,X             ; [BD 56 20   ] Load A from Absolute,X
    AND #$10                ; [29 10      ] AND A with Immediate
    BEQ $0585               ; [F0 03      ] Branch if Equal
    JMP $0632               ; [4C 32 06   ] Jump Absolute

;--- Patch at file offset $020642 (SNES $C20642) ---
org $C20642

    ORA $2013BD             ; [0F BD 13 20] OR A with Absolute Long
    STA $205A,X             ; [9D 5A 20   ] Store A to Absolute,X
    STA $7C62               ; [8D 62 7C   ] Store A to Absolute
    TAX                     ; [AA         ] Transfer A to X
    LDA $408B,Y             ; [B9 8B 40   ] Load A from Absolute,Y
    BRA $0661               ; [80 0F      ] Branch Always
    INC $45                 ; [E6 45      ] Increment DP
    LDA $2014,X             ; [BD 14 20   ] Load A from Absolute,X
    STA $205A,X             ; [9D 5A 20   ] Store A to Absolute,X
    STA $7C62               ; [8D 62 7C   ] Store A to Absolute
    TAX                     ; [AA         ] Transfer A to X
    LDA $4097,Y             ; [B9 97 40   ] Load A from Absolute,Y
    STA $46                 ; [85 46      ] Store A to DP
    AND #$7F                ; [29 7F      ] AND A with Immediate
    TXY                     ; [9B         ] Transfer X to Y
    PHA                     ; [48         ] Push Accumulator
    PHA                     ; [48         ] Push Accumulator
    LDA $79FA               ; [AD FA 79   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    PLA                     ; [68         ] Pull Accumulator
    STA $7B2D,X             ; [9D 2D 7B   ] Store A to Absolute,X
    TYA                     ; [98         ] Transfer Y to A
    STA $2621               ; [8D 21 26   ] Store A to Absolute
    LDA #$04                ; [A9 04      ] Load A Immediate
    STA $2620               ; [8D 20 26   ] Store A to Absolute
    JSR $992F               ; [20 2F 99   ] Jump to Subroutine
    LDA $79FA               ; [AD FA 79   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    LDA $7B2D,X             ; [BD 2D 7B   ] Load A from Absolute,X
    LDY $0C                 ; [A4 0C      ] Load Y from DP
    JSR $0324               ; [20 24 03   ] Jump to Subroutine
    JSR $02C2               ; [20 C2 02   ] Jump to Subroutine
    BNE $06A0               ; [D0 13      ] Branch if Not Equal
    LDY $0C                 ; [A4 0C      ] Load Y from DP
    LDA $7A00,Y             ; [B9 00 7A   ] Load A from Absolute,Y
    BPL $069D               ; [10 09      ] Branch if Plus
    LDA $79FA               ; [AD FA 79   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    INC $7BEB,X             ; [FE EB 7B   ] Increment Absolute,X
    BRA $06A0               ; [80 03      ] Branch Always
    JSR $4AFE               ; [20 FE 4A   ] Jump to Subroutine
    JSR $02A9               ; [20 A9 02   ] Jump to Subroutine
    JSR $98FA               ; [20 FA 98   ] Jump to Subroutine
    STZ $384C,X             ; [9E 4C 38   ] Store Zero to Absolute,X
    LDA #$FC                ; [A9 FC      ] Load A Immediate
    STA $384D,X             ; [9D 4D 38   ] Store A to Absolute,X
    LDA #$0A                ; [A9 0A      ] Load A Immediate
    STA $384E,X             ; [9D 4E 38   ] Store A to Absolute,X
    PLA                     ; [68         ] Pull Accumulator
    STA $384F,X             ; [9D 4F 38   ] Store A to Absolute,X
    STZ $3850,X             ; [9E 50 38   ] Store Zero to Absolute,X
    LDA $79FA               ; [AD FA 79   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    LDA $7B2D,X             ; [BD 2D 7B   ] Load A from Absolute,X
    BPL $06C6               ; [10 03      ] Branch if Plus
    TDC                     ; [7B         ] Transfer Direct Page to A
    BRA $06CD               ; [80 07      ] Branch Always
    LDY $0C                 ; [A4 0C      ] Load Y from DP
    LDA $7A00,Y             ; [B9 00 7A   ] Load A from Absolute,Y
    AND #$7F                ; [29 7F      ] AND A with Immediate
    STA $7B2D,X             ; [9D 2D 7B   ] Store A to Absolute,X
    LDA $26A0               ; [AD A0 26   ] Load A from Absolute
    STA $7B1C,X             ; [9D 1C 7B   ] Store A to Absolute,X
    BEQ $06DD               ; [F0 05      ] Branch if Equal
    INC $7B1C,X             ; [FE 1C 7B   ] Increment Absolute,X
    LDA #$80                ; [A9 80      ] Load A Immediate
    STA $7ACC,X             ; [9D CC 7A   ] Store A to Absolute,X
    JSR $1735               ; [20 35 17   ] Jump to Subroutine
    JSR $98E3               ; [20 E3 98   ] Jump to Subroutine
    LDA $46                 ; [A5 46      ] Load A from DP
    BPL $0766               ; [10 7C      ] Branch if Plus
    LDA $47                 ; [A5 47      ] Load A from DP
    JSR $01B7               ; [20 B7 01   ] Jump to Subroutine
    STA $0E                 ; [85 0E      ] Store A to DP
    ASL                     ; [0A         ] Shift Left Accumulator
    CLC                     ; [18         ] Clear Carry Flag
    ADC $0E                 ; [65 0E      ] Add with Carry DP
    TAY                     ; [A8         ] Transfer A to Y
    LDA $45                 ; [A5 45      ] Load A from DP
    BNE $0715               ; [D0 1B      ] Branch if Not Equal
    TDC                     ; [7B         ] Transfer Direct Page to A
    STA $37AC,Y             ; [99 AC 37   ] Store A to Absolute,Y
    STA $37AE,Y             ; [99 AE 37   ] Store A to Absolute,Y
    STA $37B0,Y             ; [99 B0 37   ] Store A to Absolute,Y
    LDA #$38                ; [A9 38      ] Load A Immediate
    STA $37B2,Y             ; [99 B2 37   ] Store A to Absolute,Y
    LDA #$5A                ; [A9 5A      ] Load A Immediate
    STA $37B4,Y             ; [99 B4 37   ] Store A to Absolute,Y
    LDA #$AA                ; [A9 AA      ] Load A Immediate
    STA $37B6,Y             ; [99 B6 37   ] Store A to Absolute,Y
    BRA $072E               ; [80 19      ] Branch Always
    TDC                     ; [7B         ] Transfer Direct Page to A
    STA $37AD,Y             ; [99 AD 37   ] Store A to Absolute,Y
    STA $37AF,Y             ; [99 AF 37   ] Store A to Absolute,Y
    STA $37B1,Y             ; [99 B1 37   ] Store A to Absolute,Y
    LDA #$38                ; [A9 38      ] Load A Immediate
    STA $37B3,Y             ; [99 B3 37   ] Store A to Absolute,Y
    LDA #$5A                ; [A9 5A      ] Load A Immediate
    STA $37B5,Y             ; [99 B5 37   ] Store A to Absolute,Y
    LDA #$AA                ; [A9 AA      ] Load A Immediate
    STA $37B7,Y             ; [99 B7 37   ] Store A to Absolute,Y
    LDA $3CEF               ; [AD EF 3C   ] Load A from Absolute
    TAY                     ; [A8         ] Transfer A to Y
    LDA #$50                ; [A9 50      ] Load A Immediate
    STA $3C5F,Y             ; [99 5F 3C   ] Store A to Absolute,Y
    LDA $3CEF               ; [AD EF 3C   ] Load A from Absolute
    STA $0E                 ; [85 0E      ] Store A to DP
    ASL                     ; [0A         ] Shift Left Accumulator
    CLC                     ; [18         ] Clear Carry Flag
    ADC $0E                 ; [65 0E      ] Add with Carry DP
    TAX                     ; [AA         ] Transfer A to X
    LDA $7C62               ; [AD 62 7C   ] Load A from Absolute
    STA $3CBF,X             ; [9D BF 3C   ] Store A to Absolute,X
    STZ $3CC0,X             ; [9E C0 3C   ] Store Zero to Absolute,X
    STZ $3CC1,X             ; [9E C1 3C   ] Store Zero to Absolute,X
    JSR $994C               ; [20 4C 99   ] Jump to Subroutine
    LDA $41CC               ; [AD CC 41   ] Load A from Absolute
    PHA                     ; [48         ] Push Accumulator
    LDA $47                 ; [A5 47      ] Load A from DP
    STA $41CC               ; [8D CC 41   ] Store A to Absolute
    STA $7B7B               ; [8D 7B 7B   ] Store A to Absolute
    JSR $9F3A               ; [20 3A 9F   ] Jump to Subroutine
    PLA                     ; [68         ] Pull Accumulator
    STA $41CC               ; [8D CC 41   ] Store A to Absolute
    JSR $9A6F               ; [20 6F 9A   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $0217DB (SNES $C217DB) ---
org $C217DB

    STZ $7B7D               ; [9C 7D 7B   ] Store Zero to Absolute
    JSR $9F3A               ; [20 3A 9F   ] Jump to Subroutine
    JSR $9A6F               ; [20 6F 9A   ] Jump to Subroutine

;--- Patch at file offset $021939 (SNES $C21939) ---
org $C21939

    STZ $7B7D               ; [9C 7D 7B   ] Store Zero to Absolute
    JSR $9F3A               ; [20 3A 9F   ] Jump to Subroutine
    JSR $9A6F               ; [20 6F 9A   ] Jump to Subroutine

;--- Patch at file offset $0221BA (SNES $C221BA) ---
org $C221BA

    LDA $C221CD,X           ; [BF CD 21 C2] Load A from Absolute Long,X
    STA $08                 ; [85 08      ] Store A to DP
    LDA $C221CE,X           ; [BF CE 21 C2] Load A from Absolute Long,X
    STA $09                 ; [85 09      ] Store A to DP
    LDA #$C2                ; [A9 C2      ] Load A Immediate
    STA $0A                 ; [85 0A      ] Store A to DP
    JML [$0008]             ; [DC 08 00   ] Jump Long Indirect

;--- Patch at file offset $02221D (SNES $C2221D) ---
org $C2221D

    LDX $0E                 ; [A6 0E      ] Load X from DP
    STX $3C5D               ; [8E 5D 3C   ] Store X to Absolute
    JSR $0276               ; [20 76 02   ] Jump to Subroutine
    LDA #$09                ; [A9 09      ] Load A Immediate
    JMP $0069               ; [4C 69 00   ] Jump Absolute

;--- Patch at file offset $0222DE (SNES $C222DE) ---
org $C222DE

    db $39                      ; Incomplete/data bytes

;--- Patch at file offset $02230B (SNES $C2230B) ---
org $C2230B

    LDX $0E                 ; [A6 0E      ] Load X from DP
    STX $3C5D               ; [8E 5D 3C   ] Store X to Absolute
    JSR $0276               ; [20 76 02   ] Jump to Subroutine
    LDA #$09                ; [A9 09      ] Load A Immediate
    JSR $0069               ; [20 69 00   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02252C (SNES $C2252C) ---
org $C2252C

    LDA $C2254A,X           ; [BF 4A 25 C2] Load A from Absolute Long,X
    STA $08                 ; [85 08      ] Store A to DP
    LDA $C2254B,X           ; [BF 4B 25 C2] Load A from Absolute Long,X
    STA $09                 ; [85 09      ] Store A to DP
    LDA #$C2                ; [A9 C2      ] Load A Immediate
    STA $0A                 ; [85 0A      ] Store A to DP
    JML [$0008]             ; [DC 08 00   ] Jump Long Indirect

;--- Patch at file offset $0283C2 (SNES $C283C2) ---
org $C283C2

    AND #$40                ; [29 40      ] AND A with Immediate
    BEQ $83CC               ; [F0 06      ] Branch if Equal
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    ASL $50                 ; [06 50      ] Shift Left DP
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $201F,X             ; [BD 1F 20   ] Load A from Absolute,X
    AND #$20                ; [29 20      ] AND A with Immediate
    BEQ $83DA               ; [F0 07      ] Branch if Equal
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LSR $50                 ; [46 50      ] Shift Right DP
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $201F,X             ; [BD 1F 20   ] Load A from Absolute,X
    AND #$10                ; [29 10      ] AND A with Immediate
    BEQ $83E7               ; [F0 06      ] Branch if Equal
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    ASL $52                 ; [06 52      ] Shift Left DP
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $201F,X             ; [BD 1F 20   ] Load A from Absolute,X
    AND #$08                ; [29 08      ] AND A with Immediate
    BEQ $83F5               ; [F0 07      ] Branch if Equal
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LSR $52                 ; [46 52      ] Shift Right DP
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $201F,X             ; [BD 1F 20   ] Load A from Absolute,X
    AND #$04                ; [29 04      ] AND A with Immediate
    BEQ $8400               ; [F0 04      ] Branch if Equal
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    STX $54                 ; [86 54      ] Store X to DP
    LDX $49                 ; [A6 49      ] Load X from DP
    LDA $2065,X             ; [BD 65 20   ] Load A from Absolute,X
    BPL $8416               ; [10 0F      ] Branch if Plus
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $201F,X             ; [BD 1F 20   ] Load A from Absolute,X
    AND #$01                ; [29 01      ] AND A with Immediate
    BEQ $8416               ; [F0 06      ] Branch if Equal
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    ASL $50                 ; [06 50      ] Shift Left DP
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDX $49                 ; [A6 49      ] Load X from DP
    LDA $201E,X             ; [BD 1E 20   ] Load A from Absolute,X
    BPL $8424               ; [10 07      ] Branch if Plus
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LSR $52                 ; [46 52      ] Shift Right DP
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $201E,X             ; [BD 1E 20   ] Load A from Absolute,X
    AND #$40                ; [29 40      ] AND A with Immediate
    BEQ $842F               ; [F0 04      ] Branch if Equal
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    STX $50                 ; [86 50      ] Store X to DP
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $029AEC (SNES $C29AEC) ---
org $C29AEC

    INX                     ; [E8         ] Increment X
    db $03                      ; Incomplete/data bytes

;--- Patch at file offset $029B57 (SNES $C29B57) ---
org $C29B57

    TAX                     ; [AA         ] Transfer A to X
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    SEC                     ; [38         ] Set Carry Flag
    LDA $2622,X             ; [BD 22 26   ] Load A from Absolute,X
    SBC #$E8                ; [E9 E8      ] Subtract with Borrow Immediate
    ORA $B0,S               ; [03 B0      ] OR A with Stack Relative
    ORA ($7B,X)             ; [01 7B      ] OR A with (DP,X)
    STA $2622,X             ; [9D 22 26   ] Store A to Absolute,X
    INX                     ; [E8         ] Increment X
    INX                     ; [E8         ] Increment X
    CPX #$08                ; [E0 08      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    CPX $E27B               ; [EC 7B E2   ] Compare X with Absolute
    JSR $0AA4               ; [20 A4 0A   ] Jump to Subroutine
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $2620               ; [AD 20 26   ] Load A from Absolute
    AND #$7F                ; [29 7F      ] AND A with Immediate
    STA $2022,X             ; [9D 22 20   ] Store A to Absolute,X
    LDA $2622               ; [AD 22 26   ] Load A from Absolute
    STA $2028,X             ; [9D 28 20   ] Store A to Absolute,X
    LDA $2624               ; [AD 24 26   ] Load A from Absolute
    STA $2029,X             ; [9D 29 20   ] Store A to Absolute,X
    LDA $2626               ; [AD 26 26   ] Load A from Absolute
    STA $202A,X             ; [9D 2A 20   ] Store A to Absolute,X
    LDA $2628               ; [AD 28 26   ] Load A from Absolute
    STA $202B,X             ; [9D 2B 20   ] Store A to Absolute,X
    STZ $2050,X             ; [9E 50 20   ] Store Zero to Absolute,X
    STZ $2051,X             ; [9E 51 20   ] Store Zero to Absolute,X
    STZ $2052,X             ; [9E 52 20   ] Store Zero to Absolute,X
    STZ $2053,X             ; [9E 53 20   ] Store Zero to Absolute,X
    STZ $2054,X             ; [9E 54 20   ] Store Zero to Absolute,X
    STZ $2055,X             ; [9E 55 20   ] Store Zero to Absolute,X
    STZ $207A,X             ; [9E 7A 20   ] Store Zero to Absolute,X
    LDA $4086,Y             ; [B9 86 40   ] Load A from Absolute,Y
    STA $206C,X             ; [9D 6C 20   ] Store A to Absolute,X
    LDA $4092,Y             ; [B9 92 40   ] Load A from Absolute,Y
    STA $206D,X             ; [9D 6D 20   ] Store A to Absolute,X
    LDA $408C,Y             ; [B9 8C 40   ] Load A from Absolute,Y
    STA $2044,X             ; [9D 44 20   ] Store A to Absolute,X
    LDA $4098,Y             ; [B9 98 40   ] Load A from Absolute,Y
    STA $2045,X             ; [9D 45 20   ] Store A to Absolute,X
    LDA $408A,Y             ; [B9 8A 40   ] Load A from Absolute,Y
    ORA $4096,Y             ; [19 96 40   ] OR A with Absolute,Y
    STA $2038,X             ; [9D 38 20   ] Store A to Absolute,X
    CLC                     ; [18         ] Clear Carry Flag

;--- End of patch ---