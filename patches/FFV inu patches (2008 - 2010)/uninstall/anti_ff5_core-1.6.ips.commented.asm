;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_core-1.6.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_core-1.6.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 39 record(s)

;--- Patch at file offset $008A99 (SNES $C08A99) ---
org $C08A99

    STA ($1C,X)             ; [81 1C      ] Store A to (DP,X)
    CMP ($C9),Y             ; [D1 C9      ] Compare A with (DP),Y
    db $FF, $F0, $12            ; Incomplete/data bytes

;--- Patch at file offset $008ACC (SNES $C08ACC) ---
org $C08ACC

    STA ($13,X)             ; [81 13      ] Store A to (DP,X)
    CMP ($C9),Y             ; [D1 C9      ] Compare A with (DP),Y
    db $FF, $F0, $12            ; Incomplete/data bytes

;--- Patch at file offset $008AE2 (SNES $C08AE2) ---
org $C08AE2

    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $010963 (SNES $C10963) ---
org $C10963

    LDA [$B3],Y             ; [B7 B3      ] Load A from [DP],Y
    STZ $0000,X             ; [9E 00 00   ] Store Zero to Absolute,X
    INX                     ; [E8         ] Increment X
    CPX #$F6                ; [E0 F6      ] Compare X Immediate
    STP                     ; [DB         ] Stop Processor
    BNE $0965               ; [D0 F7      ] Branch if Not Equal
    LDX #$70                ; [A2 70      ] Load X Immediate
    BRK                     ; [00 9E      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    INX                     ; [E8         ] Increment X
    CPX #$FB                ; [E0 FB      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    SBC [$7B],Y             ; [F7 7B      ] Subtract with Borrow [DP],Y
    TAX                     ; [AA         ] Transfer A to X
    STA $7E09,X             ; [9D 09 7E   ] Store A to Absolute,X
    INX                     ; [E8         ] Increment X
    CPX #$00                ; [E0 00      ] Compare X Immediate
    COP #$D0                ; [02 D0      ] Coprocessor interrupt
    SBC [$7B],Y             ; [F7 7B      ] Subtract with Borrow [DP],Y
    TAX                     ; [AA         ] Transfer A to X
    STA $DCF6,X             ; [9D F6 DC   ] Store A to Absolute,X
    INX                     ; [E8         ] Increment X
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BPL $095F               ; [10 D0      ] Branch if Plus
    db $F7                      ; Incomplete/data bytes

;--- Patch at file offset $012EDB (SNES $C12EDB) ---
org $C12EDB

    LDA $7E                 ; [A5 7E      ] Load A from DP
    CMP #$FC                ; [C9 FC      ] Compare A Immediate
    BNE $2EF0               ; [D0 0F      ] Branch if Not Equal
    LDA #$54                ; [A9 54      ] Load A Immediate
    JSR $2DEA               ; [20 EA 2D   ] Jump to Subroutine
    LDA #$53                ; [A9 53      ] Load A Immediate
    JSR $2DEA               ; [20 EA 2D   ] Jump to Subroutine
    LDA #$53                ; [A9 53      ] Load A Immediate
    JMP $2DEA               ; [4C EA 2D   ] Jump Absolute
    LDX #$80                ; [A2 80      ] Load X Immediate
    db $0F                      ; Incomplete/data bytes

;--- Patch at file offset $01FF2E (SNES $C1FF2E) ---
org $C1FF2E

    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    STZ $7E                 ; [64 7E      ] Store Zero to DP
    STZ $80                 ; [64 80      ] Store Zero to DP
    STZ $82                 ; [64 82      ] Store Zero to DP
    STZ $84                 ; [64 84      ] Store Zero to DP
    TXA                     ; [8A         ] Transfer X to A
    SEC                     ; [38         ] Set Carry Flag
    SBC #$E8                ; [E9 E8      ] Subtract with Borrow Immediate
    ORA $90,S               ; [03 90      ] OR A with Stack Relative
    ORA $E6                 ; [05 E6      ] OR A with Direct Page
    ROR $394C,X             ; [7E 4C 39   ] Rotate Right Absolute,X
    SBC $E86918,X           ; [FF 18 69 E8] Subtract with Borrow Absolute Long,X
    ORA $38,S               ; [03 38      ] OR A with Stack Relative
    SBC #$64                ; [E9 64      ] Subtract with Borrow Immediate
    BRK                     ; [00 90      ] Software interrupt
    ORA $E6                 ; [05 E6      ] OR A with Direct Page
    BRA $FF9D               ; [80 4C      ] Branch Always
    PHA                     ; [48         ] Push Accumulator
    SBC $646918,X           ; [FF 18 69 64] Subtract with Borrow Absolute Long,X
    BRK                     ; [00 38      ] Software interrupt
    SBC #$0A                ; [E9 0A      ] Subtract with Borrow Immediate
    BRK                     ; [00 90      ] Software interrupt
    ORA $E6                 ; [05 E6      ] OR A with Direct Page
    BRL $56AD               ; [82 4C 57   ] Branch Long
    SBC $0A6918,X           ; [FF 18 69 0A] Subtract with Borrow Absolute Long,X
    BRK                     ; [00 85      ] Software interrupt
    STY $7B                 ; [84 7B      ] Store Y to DP
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $7E                 ; [A5 7E      ] Load A from DP
    CLC                     ; [18         ] Clear Carry Flag
    ADC $CE                 ; [65 CE      ] Add with Carry DP
    STA $C4                 ; [85 C4      ] Store A to DP
    LDA $80                 ; [A5 80      ] Load A from DP
    CLC                     ; [18         ] Clear Carry Flag
    ADC $CE                 ; [65 CE      ] Add with Carry DP
    STA $C5                 ; [85 C5      ] Store A to DP
    LDA $82                 ; [A5 82      ] Load A from DP
    CLC                     ; [18         ] Clear Carry Flag
    ADC $CE                 ; [65 CE      ] Add with Carry DP
    STA $C6                 ; [85 C6      ] Store A to DP
    LDA $84                 ; [A5 84      ] Load A from DP
    CLC                     ; [18         ] Clear Carry Flag
    ADC $CE                 ; [65 CE      ] Add with Carry DP
    STA $C7                 ; [85 C7      ] Store A to DP
    RTS                     ; [60         ] Return from Subroutine
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    STA $C4,X               ; [95 C4      ] Store A to DP,X
    INX                     ; [E8         ] Increment X
    CPX #$08                ; [E0 08      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    SED                     ; [F8         ] Set Decimal Flag
    LDX #$00                ; [A2 00      ] Load X Immediate
    BRK                     ; [00 DA      ] Software interrupt
    TXA                     ; [8A         ] Transfer X to A
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    LDA $D97D09,X           ; [BF 09 7D D9] Load A from Absolute Long,X
    STA $74                 ; [85 74      ] Store A to DP
    LDA $D97D0A,X           ; [BF 0A 7D D9] Load A from Absolute Long,X
    STA $75                 ; [85 75      ] Store A to DP
    LDA $D97D0B,X           ; [BF 0B 7D D9] Load A from Absolute Long,X
    STA $76                 ; [85 76      ] Store A to DP
    JSR $FFC5               ; [20 C5 FF   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    LDA $78                 ; [A5 78      ] Load A from DP
    CLC                     ; [18         ] Clear Carry Flag
    ADC $CE                 ; [65 CE      ] Add with Carry DP
    STA $C4,X               ; [95 C4      ] Store A to DP,X
    INX                     ; [E8         ] Increment X
    CPX #$07                ; [E0 07      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    CLD                     ; [D8         ] Clear Decimal Flag
    LDA $70                 ; [A5 70      ] Load A from DP
    CLC                     ; [18         ] Clear Carry Flag
    ADC $CE                 ; [65 CE      ] Add with Carry DP
    STA $CB                 ; [85 CB      ] Store A to DP
    RTS                     ; [60         ] Return from Subroutine
    STZ $78                 ; [64 78      ] Store Zero to DP
    LDA $70                 ; [A5 70      ] Load A from DP
    SEC                     ; [38         ] Set Carry Flag
    SBC $74                 ; [E5 74      ] Subtract with Borrow DP
    STA $70                 ; [85 70      ] Store A to DP
    LDA $71                 ; [A5 71      ] Load A from DP
    SBC $75                 ; [E5 75      ] Subtract with Borrow DP
    STA $71                 ; [85 71      ] Store A to DP
    LDA $72                 ; [A5 72      ] Load A from DP
    SBC $76                 ; [E5 76      ] Subtract with Borrow DP
    STA $72                 ; [85 72      ] Store A to DP
    INC $78                 ; [E6 78      ] Increment DP
    BCS $FFC7               ; [B0 E9      ] Branch if Carry Set
    DEC $78                 ; [C6 78      ] Decrement DP
    LDA $70                 ; [A5 70      ] Load A from DP
    CLC                     ; [18         ] Clear Carry Flag
    ADC $74                 ; [65 74      ] Add with Carry DP
    STA $70                 ; [85 70      ] Store A to DP
    LDA $71                 ; [A5 71      ] Load A from DP
    ADC $75                 ; [65 75      ] Add with Carry DP
    STA $71                 ; [85 71      ] Store A to DP
    LDA $72                 ; [A5 72      ] Load A from DP
    ADC $76                 ; [65 76      ] Add with Carry DP
    STA $72                 ; [85 72      ] Store A to DP
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02000B (SNES $C2000B) ---
org $C2000B

    LDA #$00                ; [A9 00      ] Load A Immediate
    BRK                     ; [00 E2      ] Software interrupt
    JSR $10C2               ; [20 C2 10   ] Jump to Subroutine
    JSR $0053               ; [20 53 00   ] Jump to Subroutine
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    CLC                     ; [18         ] Clear Carry Flag
    LDA $09C0               ; [AD C0 09   ] Load A from Absolute
    ADC #$01                ; [69 01      ] Add with Carry Immediate
    BRK                     ; [00 90      ] Software interrupt
    ORA $A9,S               ; [03 A9      ] OR A with Stack Relative
    SBC $C08DFF,X           ; [FF FF 8D C0] Subtract with Borrow Absolute Long,X
    ORA #$7B                ; [09 7B      ] OR A with Immediate
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    STZ $7CD8               ; [9C D8 7C   ] Store Zero to Absolute
    JSR $4CE0               ; [20 E0 4C   ] Jump to Subroutine
    LDA #$00                ; [A9 00      ] Load A Immediate
    STA $002100             ; [8F 00 21 00] Store A to Absolute Long
    STA $00420C             ; [8F 0C 42 00] Store A to Absolute Long
    STA $00420B             ; [8F 0B 42 00] Store A to Absolute Long
    STA $004200             ; [8F 00 42 00] Store A to Absolute Long
    LDA $7CD8               ; [AD D8 7C   ] Load A from Absolute
    BNE $002C               ; [D0 E6      ] Branch if Not Equal
    SEI                     ; [78         ] Set Interrupt Disable
    JSR $0053               ; [20 53 00   ] Jump to Subroutine
    REP #$30                ; [C2 30      ] Reset Processor Status Bits
    PLY                     ; [7A         ] Pull Y Register
    PLX                     ; [FA         ] Pull X Register
    PLA                     ; [68         ] Pull Accumulator
    PLD                     ; [2B         ] Pull Direct Page Register
    PLB                     ; [AB         ] Pull Data Bank
    PLP                     ; [28         ] Pull Processor Status
    RTL                     ; [6B         ] Return from Subroutine Long
    LDA #$00                ; [A9 00      ] Load A Immediate
    PHA                     ; [48         ] Push Accumulator
    PLB                     ; [AB         ] Pull Data Bank
    STA $4200               ; [8D 00 42   ] Store A to Absolute
    LDX #$00                ; [A2 00      ] Load X Immediate
    BRK                     ; [00 DA      ] Software interrupt
    PLD                     ; [2B         ] Pull Direct Page Register
    LDA #$80                ; [A9 80      ] Load A Immediate
    STA $2100               ; [8D 00 21   ] Store A to Absolute

;--- Patch at file offset $020B2C (SNES $C20B2C) ---
org $C20B2C

    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $0E                 ; [A5 0E      ] Load A from DP
    STA $2058,X             ; [9D 58 20   ] Store A to Absolute,X
    LDA $04F1               ; [AD F1 04   ] Load A from Absolute
    BEQ $0B46               ; [F0 0E      ] Branch if Equal
    LDA $04F0               ; [AD F0 04   ] Load A from Absolute
    CMP #$BF                ; [C9 BF      ] Compare A Immediate
    BNE $0B46               ; [D0 07      ] Branch if Not Equal

;--- Patch at file offset $021068 (SNES $C21068) ---
org $C21068

    STA $24                 ; [85 24      ] Store A to DP
    LDA #$14                ; [A9 14      ] Load A Immediate
    STA $25                 ; [85 25      ] Store A to DP
    JSR $00F1               ; [20 F1 00   ] Jump to Subroutine
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAY                     ; [A8         ] Transfer A to Y
    LDX $26                 ; [A6 26      ] Load X from DP

;--- Patch at file offset $021287 (SNES $C21287) ---
org $C21287

    STA $24                 ; [85 24      ] Store A to DP
    LDA #$14                ; [A9 14      ] Load A Immediate
    STA $25                 ; [85 25      ] Store A to DP
    JSR $00F1               ; [20 F1 00   ] Jump to Subroutine
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAY                     ; [A8         ] Transfer A to Y
    LDX $26                 ; [A6 26      ] Load X from DP

;--- Patch at file offset $0219ED (SNES $C219ED) ---
org $C219ED

    TAX                     ; [AA         ] Transfer A to X
    STX $2A                 ; [86 2A      ] Store X to DP
    LDX #$8A                ; [A2 8A      ] Load X Immediate
    COP #$86                ; [02 86      ] Coprocessor interrupt
    BIT $D220               ; [2C 20 D2   ] Test Bits Absolute
    BRK                     ; [00 C2      ] Software interrupt
    JSR $A518               ; [20 18 A5   ] Jump to Subroutine
    db $2E                      ; Incomplete/data bytes

;--- Patch at file offset $021A78 (SNES $C21A78) ---
org $C21A78

    STA $24                 ; [85 24      ] Store A to DP
    LDA #$08                ; [A9 08      ] Load A Immediate
    STA $25                 ; [85 25      ] Store A to DP
    JSR $00F1               ; [20 F1 00   ] Jump to Subroutine
    LDX $26                 ; [A6 26      ] Load X from DP

;--- Patch at file offset $021B10 (SNES $C21B10) ---
org $C21B10

    STA $24                 ; [85 24      ] Store A to DP
    LDA #$54                ; [A9 54      ] Load A Immediate
    STA $25                 ; [85 25      ] Store A to DP
    JSR $00F1               ; [20 F1 00   ] Jump to Subroutine
    LDY $26                 ; [A4 26      ] Load Y from DP

;--- Patch at file offset $021BC1 (SNES $C21BC1) ---
org $C21BC1

    STA $24                 ; [85 24      ] Store A to DP
    LDA #$54                ; [A9 54      ] Load A Immediate
    STA $25                 ; [85 25      ] Store A to DP
    JSR $00F1               ; [20 F1 00   ] Jump to Subroutine
    LDY $26                 ; [A4 26      ] Load Y from DP

;--- Patch at file offset $021EAA (SNES $C21EAA) ---
org $C21EAA

    TAX                     ; [AA         ] Transfer A to X
    STX $2A                 ; [86 2A      ] Store X to DP
    LDX #$8A                ; [A2 8A      ] Load X Immediate
    COP #$86                ; [02 86      ] Coprocessor interrupt
    BIT $D220               ; [2C 20 D2   ] Test Bits Absolute
    BRK                     ; [00 A6      ] Software interrupt
    db $2E                      ; Incomplete/data bytes

;--- Patch at file offset $02234D (SNES $C2234D) ---
org $C2234D

    BRA $2350               ; [80 01      ] Branch Always

;--- Patch at file offset $023EDF (SNES $C23EDF) ---
org $C23EDF

    LDA $04F1               ; [AD F1 04   ] Load A from Absolute
    BEQ $3F11               ; [F0 2D      ] Branch if Equal
    LDA $04F0               ; [AD F0 04   ] Load A from Absolute
    CMP #$BA                ; [C9 BA      ] Compare A Immediate

;--- Patch at file offset $023FE0 (SNES $C23FE0) ---
org $C23FE0

    LDA $3F19,X             ; [BD 19 3F   ] Load A from Absolute,X
    BPL $3FF0               ; [10 0B      ] Branch if Plus
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    TYA                     ; [98         ] Transfer Y to A
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$56                ; [69 56      ] Add with Carry Immediate
    BRK                     ; [00 A8      ] Software interrupt
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $3F19,X             ; [BD 19 3F   ] Load A from Absolute,X
    AND #$7F                ; [29 7F      ] AND A with Immediate
    STA $221A,Y             ; [99 1A 22   ] Store A to Absolute,Y
    LDA $3F1A,X             ; [BD 1A 3F   ] Load A from Absolute,X
    STA $221B,Y             ; [99 1B 22   ] Store A to Absolute,Y
    LDA $3F1B,X             ; [BD 1B 3F   ] Load A from Absolute,X
    STA $221C,Y             ; [99 1C 22   ] Store A to Absolute,Y
    LDA $3F1C,X             ; [BD 1C 3F   ] Load A from Absolute,X
    STA $221D,Y             ; [99 1D 22   ] Store A to Absolute,Y

;--- Patch at file offset $024014 (SNES $C24014) ---
org $C24014

    LDA $4021               ; [AD 21 40   ] Load A from Absolute
    STA $4009,Y             ; [99 09 40   ] Store A to Absolute,Y
    LDA $12                 ; [A5 12      ] Load A from DP
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    db $BD                      ; Incomplete/data bytes

;--- Patch at file offset $024056 (SNES $C24056) ---
org $C24056

    LDX #$54                ; [A2 54      ] Load X Immediate
    ASL $86                 ; [06 86      ] Shift Left DP
    ROL                     ; [2A         ] Rotate Left Accumulator
    LDX $12                 ; [A6 12      ] Load X from DP
    STX $2C                 ; [86 2C      ] Store X to DP
    JSR $00D2               ; [20 D2 00   ] Jump to Subroutine
    LDX $2E                 ; [A6 2E      ] Load X from DP

;--- Patch at file offset $024246 (SNES $C24246) ---
org $C24246

    JSL $D0EF78             ; [22 78 EF D0] Jump to Subroutine Long

;--- Patch at file offset $024D5F (SNES $C24D5F) ---
org $C24D5F

    TAY                     ; [A8         ] Transfer A to Y
    TAX                     ; [AA         ] Transfer A to X
    STX $10                 ; [86 10      ] Store X to DP
    LDA #$D0                ; [A9 D0      ] Load A Immediate
    STA $14                 ; [85 14      ] Store A to DP
    LDY #$00                ; [A0 00      ] Load Y Immediate
    BRK                     ; [00 84      ] Software interrupt
    ORA ($A4)               ; [12 A4      ] OR A with (DP)
    BPL $4D28               ; [10 B9      ] Branch if Plus
    AND ($40,X)             ; [21 40      ] AND A with (DP,X)
    BEQ $4D7C               ; [F0 09      ] Branch if Equal
    LDA #$D0                ; [A9 D0      ] Load A Immediate
    STA $14                 ; [85 14      ] Store A to DP
    LDY #$00                ; [A0 00      ] Load Y Immediate
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $024DA2 (SNES $C24DA2) ---
org $C24DA2

    db $D9                      ; Incomplete/data bytes

;--- Patch at file offset $024F01 (SNES $C24F01) ---
org $C24F01

    INC $0E                 ; [E6 0E      ] Increment DP
    LDA $0E                 ; [A5 0E      ] Load A from DP
    CMP #$04                ; [C9 04      ] Compare A Immediate

;--- Patch at file offset $024F0D (SNES $C24F0D) ---
org $C24F0D

    TDC                     ; [7B         ] Transfer Direct Page to A
    STA $00,X               ; [95 00      ] Store A to DP,X
    DEX                     ; [CA         ] Decrement X
    BPL $4F0E               ; [10 FB      ] Branch if Plus
    LDX #$D7                ; [A2 D7      ] Load X Immediate
    JML $009D7B             ; [5C 7B 9D 00] Jump Long
    JSR $10CA               ; [20 CA 10   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    TXA                     ; [8A         ] Transfer X to A
    STA $41A9               ; [8D A9 41   ] Store A to Absolute
    STA $41AA               ; [8D AA 41   ] Store A to Absolute
    STA $41AB               ; [8D AB 41   ] Store A to Absolute
    STA $41AC               ; [8D AC 41   ] Store A to Absolute
    STA $41AD               ; [8D AD 41   ] Store A to Absolute
    STA $41CC               ; [8D CC 41   ] Store A to Absolute
    STA $7C4B               ; [8D 4B 7C   ] Store A to Absolute
    LDX #$FF                ; [A2 FF      ] Load X Immediate
    ORA ($9D,X)             ; [01 9D      ] OR A with (DP,X)
    JMP $CA38               ; [4C 38 CA   ] Jump Absolute
    BPL $4F36               ; [10 FA      ] Branch if Plus
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    LDA $09B4,X             ; [BD B4 09   ] Load A from Absolute,X
    STA $7C74,X             ; [9D 74 7C   ] Store A to Absolute,X
    INX                     ; [E8         ] Increment X
    CPX #$20                ; [E0 20      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    PEA $FBAD               ; [F4 AD FB   ] Push Effective Absolute
    ASL                     ; [0A         ] Shift Left Accumulator
    STA $7C94               ; [8D 94 7C   ] Store A to Absolute
    LDA $0AFC               ; [AD FC 0A   ] Load A from Absolute
    STA $7C95               ; [8D 95 7C   ] Store A to Absolute
    LDA $0AFD               ; [AD FD 0A   ] Load A from Absolute
    STA $7C96               ; [8D 96 7C   ] Store A to Absolute
    INC $7C72               ; [EE 72 7C   ] Increment Absolute
    LDA #$40                ; [A9 40      ] Load A Immediate
    STA $2200               ; [8D 00 22   ] Store A to Absolute
    STA $2280               ; [8D 80 22   ] Store A to Absolute
    STA $2300               ; [8D 00 23   ] Store A to Absolute
    STA $2380               ; [8D 80 23   ] Store A to Absolute
    STA $2400               ; [8D 00 24   ] Store A to Absolute
    STA $2480               ; [8D 80 24   ] Store A to Absolute
    STA $2500               ; [8D 00 25   ] Store A to Absolute
    STA $2580               ; [8D 80 25   ] Store A to Absolute
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02511C (SNES $C2511C) ---
org $C2511C

    JSL $D0EF78             ; [22 78 EF D0] Jump to Subroutine Long

;--- Patch at file offset $02515F (SNES $C2515F) ---
org $C2515F

    STX $0E                 ; [86 0E      ] Store X to DP
    LDA $0502,Y             ; [B9 02 05   ] Load A from Absolute,Y
    STA $2002,X             ; [9D 02 20   ] Store A to Absolute,X
    LDA $0524,Y             ; [B9 24 05   ] Load A from Absolute,Y
    STA $2024,X             ; [9D 24 20   ] Store A to Absolute,X
    LDA $0525,Y             ; [B9 25 05   ] Load A from Absolute,Y
    STA $2025,X             ; [9D 25 20   ] Store A to Absolute,X
    LDA $0526,Y             ; [B9 26 05   ] Load A from Absolute,Y
    STA $2026,X             ; [9D 26 20   ] Store A to Absolute,X
    LDA $0527,Y             ; [B9 27 05   ] Load A from Absolute,Y
    STA $2027,X             ; [9D 27 20   ] Store A to Absolute,X
    JSR $01E0               ; [20 E0 01   ] Jump to Subroutine
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    TYA                     ; [98         ] Transfer Y to A
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$50                ; [69 50      ] Add with Carry Immediate
    BRK                     ; [00 A8      ] Software interrupt
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    INC $0E                 ; [E6 0E      ] Increment DP
    LDA $0E                 ; [A5 0E      ] Load A from DP
    CMP #$04                ; [C9 04      ] Compare A Immediate
    BNE $5161               ; [D0 CC      ] Branch if Not Equal
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    STX $0E                 ; [86 0E      ] Store X to DP
    STX $10                 ; [86 10      ] Store X to DP
    LDX $0E                 ; [A6 0E      ] Load X from DP
    STZ $201E,X             ; [9E 1E 20   ] Store Zero to Absolute,X
    STZ $201F,X             ; [9E 1F 20   ] Store Zero to Absolute,X
    STZ $2022,X             ; [9E 22 20   ] Store Zero to Absolute,X
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAY                     ; [A8         ] Transfer A to Y
    STZ $2030,X             ; [9E 30 20   ] Store Zero to Absolute,X
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    CPY #$0A                ; [C0 0A      ] Compare Y Immediate
    BRK                     ; [00 D0      ] Software interrupt
    INC $A6,X               ; [F6 A6      ] Increment DP,X
    ASL $E020               ; [0E 20 E0   ] Shift Left Absolute
    ORA ($86,X)             ; [01 86      ] OR A with (DP,X)
    ASL $10E6               ; [0E E6 10   ] Shift Left Absolute
    LDA $10                 ; [A5 10      ] Load A from DP
    CMP #$04                ; [C9 04      ] Compare A Immediate
    BNE $519B               ; [D0 DA      ] Branch if Not Equal

;--- Patch at file offset $0251F6 (SNES $C251F6) ---
org $C251F6

    TAY                     ; [A8         ] Transfer A to Y
    STY $10                 ; [84 10      ] Store Y to DP
    STX $12                 ; [86 12      ] Store X to DP
    STZ $0E                 ; [64 0E      ] Store Zero to DP
    LDA $10                 ; [A5 10      ] Load A from DP
    TAX                     ; [AA         ] Transfer A to X
    LDA $7C59,X             ; [BD 59 7C   ] Load A from Absolute,X
    BEQ $5220               ; [F0 1B      ] Branch if Equal
    PHY                     ; [5A         ] Push Y Register
    LDA $10                 ; [A5 10      ] Load A from DP
    ASL                     ; [0A         ] Shift Left Accumulator
    TAY                     ; [A8         ] Transfer A to Y
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $7C11,Y             ; [B9 11 7C   ] Load A from Absolute,Y
    LDX $12                 ; [A6 12      ] Load X from DP
    STA $2008,X             ; [9D 08 20   ] Store A to Absolute,X
    CMP $2006,X             ; [DD 06 20   ] Compare A with Absolute,X
    BCS $521C               ; [B0 03      ] Branch if Carry Set
    STA $2006,X             ; [9D 06 20   ] Store A to Absolute,X
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    PLY                     ; [7A         ] Pull Y Register
    LDX $12                 ; [A6 12      ] Load X from DP
    STZ $201B,X             ; [9E 1B 20   ] Store Zero to Absolute,X
    STZ $201C,X             ; [9E 1C 20   ] Store Zero to Absolute,X
    STZ $201D,X             ; [9E 1D 20   ] Store Zero to Absolute,X
    STZ $201E,X             ; [9E 1E 20   ] Store Zero to Absolute,X
    LDX $10                 ; [A6 10      ] Load X from DP
    LDA $7C1A,X             ; [BD 1A 7C   ] Load A from Absolute,X
    LDX $12                 ; [A6 12      ] Load X from DP
    STA $2000,X             ; [9D 00 20   ] Store A to Absolute,X
    LDA $2000,X             ; [BD 00 20   ] Load A from Absolute,X
    STA $0500,Y             ; [99 00 05   ] Store A to Absolute,Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    INC $0E                 ; [E6 0E      ] Increment DP
    LDA $0E                 ; [A5 0E      ] Load A from DP
    CMP #$46                ; [C9 46      ] Compare A Immediate
    BNE $5238               ; [D0 F0      ] Branch if Not Equal
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    TYA                     ; [98         ] Transfer Y to A
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$0A                ; [69 0A      ] Add with Carry Immediate
    BRK                     ; [00 A8      ] Software interrupt
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDX $12                 ; [A6 12      ] Load X from DP
    JSR $01E0               ; [20 E0 01   ] Jump to Subroutine
    STX $12                 ; [86 12      ] Store X to DP
    INC $10                 ; [E6 10      ] Increment DP
    LDA $10                 ; [A5 10      ] Load A from DP
    CMP #$04                ; [C9 04      ] Compare A Immediate
    BNE $51FB               ; [D0 99      ] Branch if Not Equal
    LDX #$FF                ; [A2 FF      ] Load X Immediate
    BRK                     ; [00 BD      ] Software interrupt
    BIT $27,X               ; [34 27      ] Test Bits DP,X
    STA $0640,X             ; [9D 40 06   ] Store A to Absolute,X
    BNE $5270               ; [D0 03      ] Branch if Not Equal
    TDC                     ; [7B         ] Transfer Direct Page to A
    BRA $5273               ; [80 03      ] Branch Always
    LDA $2834,X             ; [BD 34 28   ] Load A from Absolute,X
    STA $0740,X             ; [9D 40 07   ] Store A to Absolute,X
    BNE $527B               ; [D0 03      ] Branch if Not Equal
    STA $0640,X             ; [9D 40 06   ] Store A to Absolute,X
    DEX                     ; [CA         ] Decrement X
    BPL $5265               ; [10 E7      ] Branch if Plus
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    CLC                     ; [18         ] Clear Carry Flag
    LDA $094A               ; [AD 4A 09   ] Load A from Absolute
    ADC $DB6E               ; [6D 6E DB   ] Add with Carry Absolute
    STA $094A               ; [8D 4A 09   ] Store A to Absolute
    LDA $094C               ; [AD 4C 09   ] Load A from Absolute
    ADC $DB70               ; [6D 70 DB   ] Add with Carry Absolute
    STA $094C               ; [8D 4C 09   ] Store A to Absolute
    BCC $529E               ; [90 09      ] Branch if Carry Clear
    LDA #$FF                ; [A9 FF      ] Load A Immediate
    SBC $094A8D,X           ; [FF 8D 4A 09] Subtract with Borrow Absolute Long,X
    STA $094C               ; [8D 4C 09   ] Store A to Absolute
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02569A (SNES $C2569A) ---
org $C2569A

    LDA $04F1               ; [AD F1 04   ] Load A from Absolute
    BEQ $56A7               ; [F0 08      ] Branch if Equal
    LDA $04F0               ; [AD F0 04   ] Load A from Absolute
    db $C9                      ; Incomplete/data bytes

;--- Patch at file offset $025A8C (SNES $C25A8C) ---
org $C25A8C

    LDA $4008,X             ; [BD 08 40   ] Load A from Absolute,X
    CMP $0E                 ; [C5 0E      ] Compare A with DP
    BEQ $5AA2               ; [F0 0F      ] Branch if Equal
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    STA $4038,Y             ; [99 38 40   ] Store A to Absolute,Y
    STA $0E                 ; [85 0E      ] Store A to DP
    LDA $4021               ; [AD 21 40   ] Load A from Absolute
    STA $4039,Y             ; [99 39 40   ] Store A to Absolute,Y

;--- Patch at file offset $026770 (SNES $C26770) ---
org $C26770

    LDA $7B73               ; [AD 73 7B   ] Load A from Absolute
    STA $3A4C,X             ; [9D 4C 3A   ] Store A to Absolute,X
    LDA $7B74               ; [AD 74 7B   ] Load A from Absolute
    ORA #$80                ; [09 80      ] OR A with Immediate
    STA $3A4D,X             ; [9D 4D 3A   ] Store A to Absolute,X
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $7B73               ; [AD 73 7B   ] Load A from Absolute
    AND #$FF                ; [29 FF      ] AND A with Immediate
    AND $A60E85,X           ; [3F 85 0E A6] AND A with Absolute Long,X
    AND ($18)               ; [32 18      ] AND A with (DP)
    LDA $200A,X             ; [BD 0A 20   ] Load A from Absolute,X
    ADC $0E                 ; [65 0E      ] Add with Carry DP

;--- Patch at file offset $0267B2 (SNES $C267B2) ---
org $C267B2

    LDA $7B75               ; [AD 75 7B   ] Load A from Absolute
    STA $3A4C,X             ; [9D 4C 3A   ] Store A to Absolute,X
    LDA $7B76               ; [AD 76 7B   ] Load A from Absolute
    ORA #$80                ; [09 80      ] OR A with Immediate
    STA $3A4D,X             ; [9D 4D 3A   ] Store A to Absolute,X
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $7B75               ; [AD 75 7B   ] Load A from Absolute
    AND #$FF                ; [29 FF      ] AND A with Immediate
    AND $A60E85,X           ; [3F 85 0E A6] AND A with Absolute Long,X
    EOR #$18                ; [49 18      ] XOR A with Immediate
    LDA $200A,X             ; [BD 0A 20   ] Load A from Absolute,X
    ADC $0E                 ; [65 0E      ] Add with Carry DP

;--- Patch at file offset $02758C (SNES $C2758C) ---
org $C2758C

    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    JSR $01B2               ; [20 B2 01   ] Jump to Subroutine
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    AND #$BF                ; [29 BF      ] AND A with Immediate
    STA $201D,X             ; [9D 1D 20   ] Store A to Absolute,X
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAY                     ; [A8         ] Transfer A to Y
    LDX #$00                ; [A2 00      ] Load X Immediate
    COP #$C2                ; [02 C2      ] Coprocessor interrupt
    JSR $06BD               ; [20 BD 06   ] Jump to Subroutine
    JSR $0E85               ; [20 85 0E   ] Jump to Subroutine
    LDA $2006,X             ; [BD 06 20   ] Load A from Absolute,X
    CMP $0E                 ; [C5 0E      ] Compare A with DP
    BCS $75B2               ; [B0 02      ] Branch if Carry Set
    STA $0E                 ; [85 0E      ] Store A to DP
    CLC                     ; [18         ] Clear Carry Flag
    TXA                     ; [8A         ] Transfer X to A
    ADC #$80                ; [69 80      ] Add with Carry Immediate
    BRK                     ; [00 AA      ] Software interrupt
    INY                     ; [C8         ] Increment Y
    CPY #$04                ; [C0 04      ] Compare Y Immediate
    BRK                     ; [00 D0      ] Software interrupt
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)

;--- Patch at file offset $0293B7 (SNES $C293B7) ---
org $C293B7

    STA $24                 ; [85 24      ] Store A to DP
    LDA #$14                ; [A9 14      ] Load A Immediate
    STA $25                 ; [85 25      ] Store A to DP
    JSR $00F1               ; [20 F1 00   ] Jump to Subroutine
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAY                     ; [A8         ] Transfer A to Y
    LDX $26                 ; [A6 26      ] Load X from DP

;--- Patch at file offset $029511 (SNES $C29511) ---
org $C29511

    db $0C                      ; Incomplete/data bytes

;--- Patch at file offset $029767 (SNES $C29767) ---
org $C29767

    STA $24                 ; [85 24      ] Store A to DP
    LDA #$07                ; [A9 07      ] Load A Immediate
    STA $25                 ; [85 25      ] Store A to DP
    JSR $00F1               ; [20 F1 00   ] Jump to Subroutine
    LDY $26                 ; [A4 26      ] Load Y from DP
    LDA $4747               ; [AD 47 47   ] Load A from Absolute
    CMP #$81                ; [C9 81      ] Compare A Immediate
    BNE $9781               ; [D0 08      ] Branch if Not Equal
    LDA $3BCC,Y             ; [B9 CC 3B   ] Load A from Absolute,Y
    ORA #$01                ; [09 01      ] OR A with Immediate
    STA $3BCC,Y             ; [99 CC 3B   ] Store A to Absolute,Y
    LDA $7BFB               ; [AD FB 7B   ] Load A from Absolute
    BEQ $978E               ; [F0 08      ] Branch if Equal
    LDA $3BCC,Y             ; [B9 CC 3B   ] Load A from Absolute,Y
    ORA #$20                ; [09 20      ] OR A with Immediate
    STA $3BCC,Y             ; [99 CC 3B   ] Store A to Absolute,Y
    LDA $7C5D               ; [AD 5D 7C   ] Load A from Absolute
    BEQ $979B               ; [F0 08      ] Branch if Equal
    LDA $3BCC,Y             ; [B9 CC 3B   ] Load A from Absolute,Y
    ORA #$02                ; [09 02      ] OR A with Immediate
    STA $3BCC,Y             ; [99 CC 3B   ] Store A to Absolute,Y
    LDA $47                 ; [A5 47      ] Load A from DP
    CMP #$04                ; [C9 04      ] Compare A Immediate
    BCC $97AE               ; [90 0D      ] Branch if Carry Clear
    LDA $3BCC,Y             ; [B9 CC 3B   ] Load A from Absolute,Y
    ORA #$80                ; [09 80      ] OR A with Immediate
    STA $3BCC,Y             ; [99 CC 3B   ] Store A to Absolute,Y
    SEC                     ; [38         ] Set Carry Flag
    LDA $47                 ; [A5 47      ] Load A from DP
    SBC #$04                ; [E9 04      ] Subtract with Borrow Immediate
    STA $3BCD,Y             ; [99 CD 3B   ] Store A to Absolute,Y
    LDA $7B45               ; [AD 45 7B   ] Load A from Absolute
    CMP #$04                ; [C9 04      ] Compare A Immediate
    BCC $97C6               ; [90 0E      ] Branch if Carry Clear
    LDA $3BCC,Y             ; [B9 CC 3B   ] Load A from Absolute,Y
    ORA #$40                ; [09 40      ] OR A with Immediate
    STA $3BCC,Y             ; [99 CC 3B   ] Store A to Absolute,Y
    SEC                     ; [38         ] Set Carry Flag
    LDA $7B45               ; [AD 45 7B   ] Load A from Absolute
    SBC #$04                ; [E9 04      ] Subtract with Borrow Immediate
    TAX                     ; [AA         ] Transfer A to X
    LDA $3BCE,Y             ; [B9 CE 3B   ] Load A from Absolute,Y
    JSR $01D6               ; [20 D6 01   ] Jump to Subroutine
    STA $3BCE,Y             ; [99 CE 3B   ] Store A to Absolute,Y
    LDA $5F                 ; [A5 5F      ] Load A from DP
    ORA $61                 ; [05 61      ] OR A with Direct Page
    BEQ $97DE               ; [F0 08      ] Branch if Equal
    LDA $3BCC,Y             ; [B9 CC 3B   ] Load A from Absolute,Y
    ORA #$10                ; [09 10      ] OR A with Immediate
    STA $3BCC,Y             ; [99 CC 3B   ] Store A to Absolute,Y
    LDA $7B40               ; [AD 40 7B   ] Load A from Absolute
    BEQ $97EB               ; [F0 08      ] Branch if Equal
    LDA $3BCC,Y             ; [B9 CC 3B   ] Load A from Absolute,Y
    ORA #$08                ; [09 08      ] OR A with Immediate
    STA $3BCC,Y             ; [99 CC 3B   ] Store A to Absolute,Y
    LDA $7B46               ; [AD 46 7B   ] Load A from Absolute
    BNE $97FB               ; [D0 0B      ] Branch if Not Equal
    LDA $3BCF,Y             ; [B9 CF 3B   ] Load A from Absolute,Y
    ORA $7B41               ; [0D 41 7B   ] OR A with Absolute
    STA $3BCF,Y             ; [99 CF 3B   ] Store A to Absolute,Y
    BRA $9832               ; [80 37      ] Branch Always
    LDA $7B45               ; [AD 45 7B   ] Load A from Absolute
    STA $48                 ; [85 48      ] Store A to DP
    LDA $3BD0,Y             ; [B9 D0 3B   ] Load A from Absolute,Y
    ORA $7B42               ; [0D 42 7B   ] OR A with Absolute
    STA $3BD0,Y             ; [99 D0 3B   ] Store A to Absolute,Y
    LDA $7B41               ; [AD 41 7B   ] Load A from Absolute
    BEQ $9832               ; [F0 24      ] Branch if Equal
    LDA $7B2C               ; [AD 2C 7B   ] Load A from Absolute
    JSR $01B6               ; [20 B6 01   ] Jump to Subroutine
    STA $0F                 ; [85 0F      ] Store A to DP
    LDA $48                 ; [A5 48      ] Load A from DP
    CMP #$04                ; [C9 04      ] Compare A Immediate
    BCC $981F               ; [90 03      ] Branch if Carry Clear
    SEC                     ; [38         ] Set Carry Flag
    SBC #$04                ; [E9 04      ] Subtract with Borrow Immediate
    CLC                     ; [18         ] Clear Carry Flag
    ADC $0F                 ; [65 0F      ] Add with Carry DP
    TAX                     ; [AA         ] Transfer A to X
    LDA $7B43               ; [AD 43 7B   ] Load A from Absolute
    STA $7B49,X             ; [9D 49 7B   ] Store A to Absolute,X
    LDA $3BD1,Y             ; [B9 D1 3B   ] Load A from Absolute,Y
    ORA $7B43               ; [0D 43 7B   ] OR A with Absolute
    STA $3BD1,Y             ; [99 D1 3B   ] Store A to Absolute,Y
    LDA $7B44               ; [AD 44 7B   ] Load A from Absolute
    STA $3BD2,Y             ; [99 D2 3B   ] Store A to Absolute,Y
    LDA $7B2C               ; [AD 2C 7B   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    LDA $7B1C,X             ; [BD 1C 7B   ] Load A from Absolute,X
    BEQ $9849               ; [F0 08      ] Branch if Equal
    INC $7ABC               ; [EE BC 7A   ] Increment Absolute
    CMP $7ABC               ; [CD BC 7A   ] Compare A with Absolute
    BNE $9884               ; [D0 3B      ] Branch if Not Equal
    LDA $3BCF,Y             ; [B9 CF 3B   ] Load A from Absolute,Y
    BNE $9878               ; [D0 2A      ] Branch if Not Equal
    JSR $9965               ; [20 65 99   ] Jump to Subroutine
    STZ $0E                 ; [64 0E      ] Store Zero to DP
    LDA $3C5F,X             ; [BD 5F 3C   ] Load A from Absolute,X
    LSR                     ; [4A         ] Shift Right Accumulator
    ROR $0E                 ; [66 0E      ] Rotate Right DP
    LSR                     ; [4A         ] Shift Right Accumulator
    ROR $0E                 ; [66 0E      ] Rotate Right DP
    LSR                     ; [4A         ] Shift Right Accumulator
    ROR $0E                 ; [66 0E      ] Rotate Right DP
    TAX                     ; [AA         ] Transfer A to X
    LDA $D0EEF6,X           ; [BF F6 EE D0] Load A from Absolute Long,X
    PHA                     ; [48         ] Push Accumulator
    LDA $0E                 ; [A5 0E      ] Load A from DP
    JSR $01BD               ; [20 BD 01   ] Jump to Subroutine
    TAX                     ; [AA         ] Transfer A to X
    PLA                     ; [68         ] Pull Accumulator

;--- Patch at file offset $029F45 (SNES $C29F45) ---
org $C29F45

    JSR $01B7               ; [20 B7 01   ] Jump to Subroutine
    STA $0E                 ; [85 0E      ] Store A to DP
    ASL                     ; [0A         ] Shift Left Accumulator
    CLC                     ; [18         ] Clear Carry Flag
    ADC $0E                 ; [65 0E      ] Add with Carry DP
    TAY                     ; [A8         ] Transfer A to Y

;--- Patch at file offset $10EEF6 (SNES $D0EEF6) ---
org $D0EEF6

    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 07      ] Software interrupt

;--- Patch at file offset $1129E0 (SNES $D129E0) ---
org $D129E0

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

;--- End of patch ---