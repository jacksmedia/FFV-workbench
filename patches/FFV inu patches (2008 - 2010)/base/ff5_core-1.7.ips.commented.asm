;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_core-1.7.ips.commented.asm
;    Disassembled from IPS patch: ff5_core-1.7.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 52 record(s)

;--- Patch at file offset $008A99 (SNES $C08A99) ---
org $C08A99

    BRA $8AB7               ; [80 1C      ] Branch Always
    CMP ($C9),Y             ; [D1 C9      ] Compare A with (DP),Y
    CPX #$B0                ; [E0 B0      ] Compare X Immediate
    db $09                      ; Incomplete/data bytes

;--- Patch at file offset $008ACC (SNES $C08ACC) ---
org $C08ACC

    BRA $8AE1               ; [80 13      ] Branch Always
    CMP ($C9),Y             ; [D1 C9      ] Compare A with (DP),Y
    CPX #$B0                ; [E0 B0      ] Compare X Immediate
    db $09                      ; Incomplete/data bytes

;--- Patch at file offset $008AE2 (SNES $C08AE2) ---
org $C08AE2

    db $09                      ; Incomplete/data bytes

;--- Patch at file offset $010963 (SNES $C10963) ---
org $C10963

    ROL $9E28,X             ; [3E 28 9E   ] Rotate Left Absolute,X
    LDA [$B3],Y             ; [B7 B3      ] Load A from [DP],Y
    DEX                     ; [CA         ] Decrement X
    BPL $0965               ; [10 FA      ] Branch if Plus
    LDX #$8A                ; [A2 8A      ] Load X Immediate
    BRK                     ; [00 9E      ] Software interrupt
    BVS $0971               ; [70 00      ] Branch if Overflow Set
    DEX                     ; [CA         ] Decrement X
    BPL $096E               ; [10 FA      ] Branch if Plus
    TDC                     ; [7B         ] Transfer Direct Page to A
    LDX #$FF                ; [A2 FF      ] Load X Immediate
    ORA ($9D,X)             ; [01 9D      ] OR A with (DP,X)
    ORA #$7E                ; [09 7E      ] OR A with Immediate
    DEX                     ; [CA         ] Decrement X
    BPL $0978               ; [10 FA      ] Branch if Plus
    LDX #$FF                ; [A2 FF      ] Load X Immediate
    ORA $DCF69D             ; [0F 9D F6 DC] OR A with Absolute Long
    DEX                     ; [CA         ] Decrement X
    BPL $0981               ; [10 FA      ] Branch if Plus
    LDX #$5F                ; [A2 5F      ] Load X Immediate
    BRK                     ; [00 9E      ] Software interrupt
    BIT #$F7                ; [89 F7      ] Test Bits Immediate
    DEX                     ; [CA         ] Decrement X
    BPL $098A               ; [10 FA      ] Branch if Plus

;--- Patch at file offset $012EDB (SNES $C12EDB) ---
org $C12EDB

    LDX #$64                ; [A2 64      ] Load X Immediate
    BRK                     ; [00 86      ] Software interrupt
    BRA $2F01               ; [80 20      ] Branch Always
    ADC [$FE]               ; [67 FE      ] Add with Carry [DP]
    LDX $82                 ; [A6 82      ] Load X from DP
    STX $7E                 ; [86 7E      ] Store X to DP
    LDX #$FC                ; [A2 FC      ] Load X Immediate
    BRK                     ; [00 86      ] Software interrupt
    BRA $2F0D               ; [80 20      ] Branch Always
    SBC [$FD]               ; [E7 FD      ] Subtract with Borrow [DP]
    LDX $82                 ; [A6 82      ] Load X from DP
    BRA $2EA7               ; [80 B4      ] Branch Always

;--- Patch at file offset $01B660 (SNES $C1B660) ---
org $C1B660

    SEC                     ; [38         ] Set Carry Flag
    LDA #$70                ; [A9 70      ] Load A Immediate
    TAX                     ; [AA         ] Transfer A to X
    STZ $D1D8,X             ; [9E D8 D1   ] Store Zero to Absolute,X
    STZ $D258,X             ; [9E 58 D2   ] Store Zero to Absolute,X
    STZ $D2D8,X             ; [9E D8 D2   ] Store Zero to Absolute,X
    STZ $D358,X             ; [9E 58 D3   ] Store Zero to Absolute,X
    SBC #$10                ; [E9 10      ] Subtract with Borrow Immediate
    BCS $B663               ; [B0 EF      ] Branch if Carry Set
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $01B687 (SNES $C1B687) ---
org $C1B687

    ROL $B5,X               ; [36 B5      ] Rotate Left DP,X
    JMP $B68C               ; [4C 8C B6   ] Jump Absolute
    JSR $9D93               ; [20 93 9D   ] Jump to Subroutine
    JSR $8D47               ; [20 47 8D   ] Jump to Subroutine
    TAX                     ; [AA         ] Transfer A to X
    JMP $B69C               ; [4C 9C B6   ] Jump Absolute
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    BRA $B6AC               ; [80 0E      ] Branch Always

;--- Patch at file offset $01B69E (SNES $C1B69E) ---
org $C1B69E

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $01B6AC (SNES $C1B6AC) ---
org $C1B6AC

    STZ $DB6A               ; [9C 6A DB   ] Store Zero to Absolute
    STX $F86E               ; [8E 6E F8   ] Store X to Absolute
    STZ $F86D               ; [9C 6D F8   ] Store Zero to Absolute
    STZ $DB6B               ; [9C 6B DB   ] Store Zero to Absolute
    STZ $DB77               ; [9C 77 DB   ] Store Zero to Absolute
    INC $DB77               ; [EE 77 DB   ] Increment Absolute
    STZ $F86A               ; [9C 6A F8   ] Store Zero to Absolute
    STZ $F86B               ; [9C 6B F8   ] Store Zero to Absolute
    JSR $A847               ; [20 47 A8   ] Jump to Subroutine
    JSR $B300               ; [20 00 B3   ] Jump to Subroutine
    LDA $F582               ; [AD 82 F5   ] Load A from Absolute
    STA $D1BC               ; [8D BC D1   ] Store A to Absolute
    AND #$3F                ; [29 3F      ] AND A with Immediate
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    JSR ($B746,X)           ; [FC 46 B7   ] Jump to Subroutine Indirect,X
    JSR $B660               ; [20 60 B6   ] Jump to Subroutine
    LDX $F86A               ; [AE 6A F8   ] Load X from Absolute
    BNE $B6AF               ; [D0 D0      ] Branch if Not Equal
    LDA $DB61               ; [AD 61 DB   ] Load A from Absolute
    BEQ $B720               ; [F0 3C      ] Branch if Equal
    STZ $F8B4               ; [9C B4 F8   ] Store Zero to Absolute
    LDA #$80                ; [A9 80      ] Load A Immediate
    STA $DB60               ; [8D 60 DB   ] Store A to Absolute
    JSR $02F2               ; [20 F2 02   ] Jump to Subroutine
    LDA #$10                ; [A9 10      ] Load A Immediate
    STA $BC85               ; [8D 85 BC   ] Store A to Absolute
    LDA #$1F                ; [A9 1F      ] Load A Immediate
    JSR $B3FE               ; [20 FE B3   ] Jump to Subroutine
    JSR $24D5               ; [20 D5 24   ] Jump to Subroutine
    JSR $B40A               ; [20 0A B4   ] Jump to Subroutine
    TDC                     ; [7B         ] Transfer Direct Page to A
    STZ $7E                 ; [64 7E      ] Store Zero to DP
    JSR $7B43               ; [20 43 7B   ] Jump to Subroutine
    JSR $02F2               ; [20 F2 02   ] Jump to Subroutine
    LDA $D0EE               ; [AD EE D0   ] Load A from Absolute
    BNE $B705               ; [D0 F8      ] Branch if Not Equal
    LDX $F86E               ; [AE 6E F8   ] Load X from Absolute
    CPX #$68                ; [E0 68      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    PHD                     ; [0B         ] Push Direct Page Register
    LDX #$00                ; [A2 00      ] Load X Immediate
    BRK                     ; [00 8E      ] Software interrupt
    ROR $A2F8               ; [6E F8 A2   ] Rotate Right Absolute
    ORA $9B8000,X           ; [1F 00 80 9B] OR A with Absolute Long,X
    STZ $DB56               ; [9C 56 DB   ] Store Zero to Absolute
    LDA $F86D               ; [AD 6D F8   ] Load A from Absolute
    BNE $B733               ; [D0 0B      ] Branch if Not Equal
    INC $F86D               ; [EE 6D F8   ] Increment Absolute
    LDX $F86E               ; [AE 6E F8   ] Load X from Absolute
    JSR $8D41               ; [20 41 8D   ] Jump to Subroutine
    BNE $B6BB               ; [D0 88      ] Branch if Not Equal

;--- Patch at file offset $01FF2E (SNES $C1FF2E) ---
org $C1FF2E

    PHY                     ; [5A         ] Push Y Register
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    TXA                     ; [8A         ] Transfer X to A
    SEP #$11                ; [E2 11      ] Set Processor Status Bits
    LDY $CE                 ; [A4 CE      ] Load Y from DP
    DEY                     ; [88         ] Decrement Y
    STY $7E                 ; [84 7E      ] Store Y to DP
    SBC #$E8                ; [E9 E8      ] Subtract with Borrow Immediate
    ORA $C8,S               ; [03 C8      ] OR A with Stack Relative
    BCS $FF39               ; [B0 FA      ] Branch if Carry Set
    ADC #$E8                ; [69 E8      ] Add with Carry Immediate
    ORA $84,S               ; [03 84      ] OR A with Stack Relative
    CPY $A4                 ; [C4 A4      ] Compare Y with DP
    ROR $64E9,X             ; [7E E9 64   ] Rotate Right Absolute,X
    BRK                     ; [00 C8      ] Software interrupt
    BCS $FF46               ; [B0 FA      ] Branch if Carry Set
    ADC #$64                ; [69 64      ] Add with Carry Immediate
    BRK                     ; [00 84      ] Software interrupt
    CMP $A4                 ; [C5 A4      ] Compare A with DP
    ROR $20E2,X             ; [7E E2 20   ] Rotate Right Absolute,X
    SBC #$0A                ; [E9 0A      ] Subtract with Borrow Immediate
    INY                     ; [C8         ] Increment Y
    BCS $FF55               ; [B0 FB      ] Branch if Carry Set
    STY $C6                 ; [84 C6      ] Store Y to DP
    ADC #$0A                ; [69 0A      ] Add with Carry Immediate
    ADC $7E                 ; [65 7E      ] Add with Carry DP
    STA $C7                 ; [85 C7      ] Store A to DP
    REP #$10                ; [C2 10      ] Reset Processor Status Bits
    PLY                     ; [7A         ] Pull Y Register
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $01FF66 (SNES $C1FF66) ---
org $C1FF66

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $01FF88 (SNES $C1FF88) ---
org $C1FF88

    PHY                     ; [5A         ] Push Y Register
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    TAY                     ; [A8         ] Transfer A to Y
    STZ $73                 ; [64 73      ] Store Zero to DP
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    SEC                     ; [38         ] Set Carry Flag
    STZ $78                 ; [64 78      ] Store Zero to DP
    LDA $70                 ; [A5 70      ] Load A from DP
    SBC $D97D09,X           ; [FF 09 7D D9] Subtract with Borrow Absolute Long,X
    STA $74                 ; [85 74      ] Store A to DP
    LDA $72                 ; [A5 72      ] Load A from DP
    SBC $D97D0B,X           ; [FF 0B 7D D9] Subtract with Borrow Absolute Long,X
    BCC $FFAD               ; [90 0A      ] Branch if Carry Clear
    STA $72                 ; [85 72      ] Store A to DP
    LDA $74                 ; [A5 74      ] Load A from DP
    STA $70                 ; [85 70      ] Store A to DP
    INC $78                 ; [E6 78      ] Increment DP
    BRA $FF93               ; [80 E6      ] Branch Always
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $78                 ; [A5 78      ] Load A from DP
    ADC $CE                 ; [65 CE      ] Add with Carry DP
    STA $00C4,Y             ; [99 C4 00   ] Store A to Absolute,Y
    INY                     ; [C8         ] Increment Y
    INX                     ; [E8         ] Increment X
    INX                     ; [E8         ] Increment X
    INX                     ; [E8         ] Increment X
    INX                     ; [E8         ] Increment X
    CPY #$07                ; [C0 07      ] Compare Y Immediate
    BRK                     ; [00 D0      ] Software interrupt
    DEC $70A5               ; [CE A5 70   ] Decrement Absolute
    CLC                     ; [18         ] Clear Carry Flag
    ADC $CE                 ; [65 CE      ] Add with Carry DP
    STA $CB                 ; [85 CB      ] Store A to DP
    PLY                     ; [7A         ] Pull Y Register
    TDC                     ; [7B         ] Transfer Direct Page to A
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $01FFCA (SNES $C1FFCA) ---
org $C1FFCA

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02000B (SNES $C2000B) ---
org $C2000B

    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    JSR $0053               ; [20 53 00   ] Jump to Subroutine
    JSR $4F5C               ; [20 5C 4F   ] Jump to Subroutine
    STZ $7CD8               ; [9C D8 7C   ] Store Zero to Absolute
    JSR $4CE0               ; [20 E0 4C   ] Jump to Subroutine
    TDC                     ; [7B         ] Transfer Direct Page to A
    STA $002100             ; [8F 00 21 00] Store A to Absolute Long
    STA $00420C             ; [8F 0C 42 00] Store A to Absolute Long
    STA $00420B             ; [8F 0B 42 00] Store A to Absolute Long
    STA $004200             ; [8F 00 42 00] Store A to Absolute Long
    LDA $7CD8               ; [AD D8 7C   ] Load A from Absolute
    BNE $0016               ; [D0 E7      ] Branch if Not Equal
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

;--- Patch at file offset $02003C (SNES $C2003C) ---
org $C2003C

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $020053 (SNES $C20053) ---
org $C20053

    LDX #$00                ; [A2 00      ] Load X Immediate
    BRK                     ; [00 DA      ] Software interrupt
    PLD                     ; [2B         ] Pull Direct Page Register
    TDC                     ; [7B         ] Transfer Direct Page to A
    STA $004200             ; [8F 00 42 00] Store A to Absolute Long
    LDA #$80                ; [A9 80      ] Load A Immediate
    STA $002100             ; [8F 00 21 00] Store A to Absolute Long
    TDC                     ; [7B         ] Transfer Direct Page to A

;--- Patch at file offset $020B2C (SNES $C20B2C) ---
org $C20B2C

    LDX $04F0               ; [AE F0 04   ] Load X from Absolute
    CPX #$BF                ; [E0 BF      ] Compare X Immediate
    ORA ($F0,X)             ; [01 F0      ] OR A with (DP,X)
    ORA #$A6                ; [09 A6      ] OR A with Immediate
    AND ($A5)               ; [32 A5      ] AND A with (DP)
    ASL $589D               ; [0E 9D 58   ] Shift Left Absolute
    JSR $0980               ; [20 80 09   ] Jump to Subroutine
    LDX $32                 ; [A6 32      ] Load X from DP

;--- Patch at file offset $021068 (SNES $C21068) ---
org $C21068

    TAX                     ; [AA         ] Transfer A to X
    LDA $D0EEDB,X           ; [BF DB EE D0] Load A from Absolute Long,X
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAY                     ; [A8         ] Transfer A to Y
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $021287 (SNES $C21287) ---
org $C21287

    TAX                     ; [AA         ] Transfer A to X
    LDA $D0EEDB,X           ; [BF DB EE D0] Load A from Absolute Long,X
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAY                     ; [A8         ] Transfer A to Y
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $0219ED (SNES $C219ED) ---
org $C219ED

    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    REP #$21                ; [C2 21      ] Reset Processor Status Bits
    LDA $D0ED59,X           ; [BF 59 ED D0] Load A from Absolute Long,X
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $021A78 (SNES $C21A78) ---
org $C21A78

    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    JSR $01B6               ; [20 B6 01   ] Jump to Subroutine
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $021B10 (SNES $C21B10) ---
org $C21B10

    TAX                     ; [AA         ] Transfer A to X
    LDA $D0ED85,X           ; [BF 85 ED D0] Load A from Absolute Long,X
    TAY                     ; [A8         ] Transfer A to Y
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $021BC1 (SNES $C21BC1) ---
org $C21BC1

    TAX                     ; [AA         ] Transfer A to X
    LDA $D0ED85,X           ; [BF 85 ED D0] Load A from Absolute Long,X
    TAY                     ; [A8         ] Transfer A to Y
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $021EAA (SNES $C21EAA) ---
org $C21EAA

    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $D0ED59,X           ; [BF 59 ED D0] Load A from Absolute Long,X
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02234D (SNES $C2234D) ---
org $C2234D

    BRK                     ; [00 02      ] Software interrupt

;--- Patch at file offset $023EDF (SNES $C23EDF) ---
org $C23EDF

    LDX $04F0               ; [AE F0 04   ] Load X from Absolute
    CPX #$BA                ; [E0 BA      ] Compare X Immediate
    ORA ($F0,X)             ; [01 F0      ] OR A with (DP,X)
    TSB $80                 ; [04 80      ] Test and Set Bits in DP
    PLP                     ; [28         ] Pull Processor Status

;--- Patch at file offset $023FE0 (SNES $C23FE0) ---
org $C23FE0

    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $3F09,X             ; [BD 09 3F   ] Load A from Absolute,X
    CMP $220C,Y             ; [D9 0C 22   ] Compare A with Absolute,Y
    BCC $3FED               ; [90 03      ] Branch if Carry Clear
    STA $220C,Y             ; [99 0C 22   ] Store A to Absolute,Y
    BIT $3F18,X             ; [3C 18 3F   ] Test Bits Absolute,X
    BPL $3FF8               ; [10 06      ] Branch if Plus
    TYA                     ; [98         ] Transfer Y to A
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$56                ; [69 56      ] Add with Carry Immediate
    BRK                     ; [00 A8      ] Software interrupt
    LDA $3F19,X             ; [BD 19 3F   ] Load A from Absolute,X
    AND #$7F                ; [29 7F      ] AND A with Immediate
    SBC $221A99,X           ; [FF 99 1A 22] Subtract with Borrow Absolute Long,X
    LDA $3F1B,X             ; [BD 1B 3F   ] Load A from Absolute,X
    STA $221C,Y             ; [99 1C 22   ] Store A to Absolute,Y
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits

;--- Patch at file offset $024014 (SNES $C24014) ---
org $C24014

    LDA $4021,Y             ; [B9 21 40   ] Load A from Absolute,Y
    CMP #$FF                ; [C9 FF      ] Compare A Immediate
    BEQ $401E               ; [F0 03      ] Branch if Equal
    STA $4009,Y             ; [99 09 40   ] Store A to Absolute,Y
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    db $B9                      ; Incomplete/data bytes

;--- Patch at file offset $024056 (SNES $C24056) ---
org $C24056

    LDA $12                 ; [A5 12      ] Load A from DP
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $D0EEA5,X           ; [BF A5 EE D0] Load A from Absolute Long,X
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits

;--- Patch at file offset $024246 (SNES $C24246) ---
org $C24246

    JSR $51AB               ; [20 AB 51   ] Jump to Subroutine
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $024D5F (SNES $C24D5F) ---
org $C24D5F

    TAX                     ; [AA         ] Transfer A to X
    STX $10                 ; [86 10      ] Store X to DP
    ASL                     ; [0A         ] Shift Left Accumulator
    TAY                     ; [A8         ] Transfer A to Y
    LDA $4021,Y             ; [B9 21 40   ] Load A from Absolute,Y
    BEQ $4D6C               ; [F0 03      ] Branch if Equal
    INC                     ; [1A         ] Increment Accumulator
    BNE $4D73               ; [D0 07      ] Branch if Not Equal
    LDA #$D0                ; [A9 D0      ] Load A Immediate
    LDY #$00                ; [A0 00      ] Load Y Immediate
    BRK                     ; [00 80      ] Software interrupt
    ORA $A9                 ; [05 A9      ] OR A with Direct Page
    BNE $4D16               ; [D0 A0      ] Branch if Not Equal
    BRK                     ; [00 20      ] Software interrupt
    STA $14                 ; [85 14      ] Store A to DP

;--- Patch at file offset $024DA2 (SNES $C24DA2) ---
org $C24DA2

    db $BF                      ; Incomplete/data bytes

;--- Patch at file offset $024F01 (SNES $C24F01) ---
org $C24F01

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    CPX #$00                ; [E0 00      ] Compare X Immediate
    db $02                      ; Incomplete/data bytes

;--- Patch at file offset $024F0D (SNES $C24F0D) ---
org $C24F0D

    STZ $00,X               ; [74 00      ] Store Zero to DP,X
    DEX                     ; [CA         ] Decrement X
    BPL $4F0D               ; [10 FB      ] Branch if Plus
    LDX #$D4                ; [A2 D4      ] Load X Immediate
    JML $20009E             ; [5C 9E 00 20] Jump Long
    DEX                     ; [CA         ] Decrement X
    BPL $4F15               ; [10 FA      ] Branch if Plus
    TXA                     ; [8A         ] Transfer X to A
    STX $41A9               ; [8E A9 41   ] Store X to Absolute
    STX $41AB               ; [8E AB 41   ] Store X to Absolute
    STA $41AD               ; [8D AD 41   ] Store A to Absolute
    STA $41CC               ; [8D CC 41   ] Store A to Absolute
    STA $7C4B               ; [8D 4B 7C   ] Store A to Absolute
    LDX #$FF                ; [A2 FF      ] Load X Immediate
    ORA ($9D,X)             ; [01 9D      ] OR A with (DP,X)
    JMP $CA38               ; [4C 38 CA   ] Jump Absolute
    BPL $4F2E               ; [10 FA      ] Branch if Plus
    LDX #$1F                ; [A2 1F      ] Load X Immediate
    BRK                     ; [00 BD      ] Software interrupt
    LDY $09,X               ; [B4 09      ] Load Y from DP,X
    STA $7C74,X             ; [9D 74 7C   ] Store A to Absolute,X
    DEX                     ; [CA         ] Decrement X
    BPL $4F37               ; [10 F7      ] Branch if Plus
    LDA $0AFB               ; [AD FB 0A   ] Load A from Absolute
    STA $7C94               ; [8D 94 7C   ] Store A to Absolute
    LDX $0AFC               ; [AE FC 0A   ] Load X from Absolute
    STX $7C95               ; [8E 95 7C   ] Store X to Absolute
    LDX $7CD5               ; [AE D5 7C   ] Load X from Absolute
    STX $0947               ; [8E 47 09   ] Store X to Absolute
    LDA $7CD7               ; [AD D7 7C   ] Load A from Absolute
    STA $0949               ; [8D 49 09   ] Store A to Absolute
    INC $7C72               ; [EE 72 7C   ] Increment Absolute
    RTS                     ; [60         ] Return from Subroutine
    LDX $09C0               ; [AE C0 09   ] Load X from Absolute
    CPX #$FF                ; [E0 FF      ] Compare X Immediate
    SBC $E804F0,X           ; [FF F0 04 E8] Subtract with Borrow Absolute Long,X
    STX $09C0               ; [8E C0 09   ] Store X to Absolute
    LDX $0947               ; [AE 47 09   ] Load X from Absolute
    STX $7CD5               ; [8E D5 7C   ] Store X to Absolute
    LDA $0949               ; [AD 49 09   ] Load A from Absolute
    STA $7CD7               ; [8D D7 7C   ] Store A to Absolute
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02511C (SNES $C2511C) ---
org $C2511C

    JSR $51AB               ; [20 AB 51   ] Jump to Subroutine
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02515F (SNES $C2515F) ---
org $C2515F

    LDA $0502,Y             ; [B9 02 05   ] Load A from Absolute,Y
    STA $2002,X             ; [9D 02 20   ] Store A to Absolute,X
    STZ $2022,X             ; [9E 22 20   ] Store Zero to Absolute,X
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $0524,Y             ; [B9 24 05   ] Load A from Absolute,Y
    STA $2024,X             ; [9D 24 20   ] Store A to Absolute,X
    LDA $0526,Y             ; [B9 26 05   ] Load A from Absolute,Y
    STA $2026,X             ; [9D 26 20   ] Store A to Absolute,X
    LDA $0508,Y             ; [B9 08 05   ] Load A from Absolute,Y
    STA $2008,X             ; [9D 08 20   ] Store A to Absolute,X
    CMP $2006,X             ; [DD 06 20   ] Compare A with Absolute,X
    BCS $5184               ; [B0 03      ] Branch if Carry Set
    STA $2006,X             ; [9D 06 20   ] Store A to Absolute,X
    STZ $201E,X             ; [9E 1E 20   ] Store Zero to Absolute,X
    STZ $2030,X             ; [9E 30 20   ] Store Zero to Absolute,X
    STZ $2032,X             ; [9E 32 20   ] Store Zero to Absolute,X
    STZ $2034,X             ; [9E 34 20   ] Store Zero to Absolute,X
    STZ $2036,X             ; [9E 36 20   ] Store Zero to Absolute,X
    STZ $2038,X             ; [9E 38 20   ] Store Zero to Absolute,X
    TYA                     ; [98         ] Transfer Y to A
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$50                ; [69 50      ] Add with Carry Immediate
    BRK                     ; [00 A8      ] Software interrupt
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    JSR $01E0               ; [20 E0 01   ] Jump to Subroutine
    CPX #$00                ; [E0 00      ] Compare X Immediate
    COP #$D0                ; [02 D0      ] Coprocessor interrupt
    CLV                     ; [B8         ] Clear Overflow Flag
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    LDX #$FF                ; [A2 FF      ] Load X Immediate
    BRK                     ; [00 BD      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt
    ASL $F0                 ; [06 F0      ] Shift Left DP
    PHP                     ; [08         ] Push Processor Status
    LDA $0740,X             ; [BD 40 07   ] Load A from Absolute,X
    BNE $51BE               ; [D0 06      ] Branch if Not Equal
    STZ $0640,X             ; [9E 40 06   ] Store Zero to Absolute,X
    STZ $0740,X             ; [9E 40 07   ] Store Zero to Absolute,X
    DEX                     ; [CA         ] Decrement X
    BPL $51AE               ; [10 ED      ] Branch if Plus

;--- Patch at file offset $0251F6 (SNES $C251F6) ---
org $C251F6

    LDY #$1A                ; [A0 1A      ] Load Y Immediate
    JMP ($1084,X)           ; [7C 84 10   ] Jump Indirect,X
    TAY                     ; [A8         ] Transfer A to Y
    STZ $201B,X             ; [9E 1B 20   ] Store Zero to Absolute,X
    STZ $201C,X             ; [9E 1C 20   ] Store Zero to Absolute,X
    STZ $201D,X             ; [9E 1D 20   ] Store Zero to Absolute,X
    STZ $201E,X             ; [9E 1E 20   ] Store Zero to Absolute,X
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    LDA ($10)               ; [B2 10      ] Load A from (DP)
    STA $2000,X             ; [9D 00 20   ] Store A to Absolute,X
    LDA #$46                ; [A9 46      ] Load A Immediate
    STA $0E                 ; [85 0E      ] Store A to DP
    LDA $2000,X             ; [BD 00 20   ] Load A from Absolute,X
    STA $0500,Y             ; [99 00 05   ] Store A to Absolute,Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    DEC $0E                 ; [C6 0E      ] Decrement DP
    BNE $521A               ; [D0 F4      ] Branch if Not Equal
    REP #$21                ; [C2 21      ] Reset Processor Status Bits
    TYA                     ; [98         ] Transfer Y to A
    ADC #$0A                ; [69 0A      ] Add with Carry Immediate
    BRK                     ; [00 A8      ] Software interrupt
    TXA                     ; [8A         ] Transfer X to A
    ADC #$3A                ; [69 3A      ] Add with Carry Immediate
    BRK                     ; [00 AA      ] Software interrupt
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    INC $10                 ; [E6 10      ] Increment DP
    CPX #$00                ; [E0 00      ] Compare X Immediate
    COP #$D0                ; [02 D0      ] Coprocessor interrupt
    CPY #$A2                ; [C0 A2      ] Compare Y Immediate
    SBC $34BD00,X           ; [FF 00 BD 34] Subtract with Borrow Absolute Long,X
    AND [$9D]               ; [27 9D      ] AND A with [DP]
    RTI                     ; [40         ] Return from Interrupt
    ASL $F0                 ; [06 F0      ] Shift Left DP
    ORA $BD,S               ; [03 BD      ] OR A with Stack Relative
    BIT $28,X               ; [34 28      ] Test Bits DP,X
    STA $0740,X             ; [9D 40 07   ] Store A to Absolute,X
    BNE $5252               ; [D0 03      ] Branch if Not Equal
    STA $0640,X             ; [9D 40 06   ] Store A to Absolute,X
    DEX                     ; [CA         ] Decrement X
    BPL $523F               ; [10 EA      ] Branch if Plus
    REP #$21                ; [C2 21      ] Reset Processor Status Bits
    LDA $094A               ; [AD 4A 09   ] Load A from Absolute
    ADC $DB6E               ; [6D 6E DB   ] Add with Carry Absolute
    STA $094A               ; [8D 4A 09   ] Store A to Absolute
    LDA $094C               ; [AD 4C 09   ] Load A from Absolute
    ADC $DB70               ; [6D 70 DB   ] Add with Carry Absolute
    STA $094C               ; [8D 4C 09   ] Store A to Absolute
    BCC $5274               ; [90 09      ] Branch if Carry Clear
    LDA #$FF                ; [A9 FF      ] Load A Immediate
    SBC $094A8D,X           ; [FF 8D 4A 09] Subtract with Borrow Absolute Long,X
    STA $094C               ; [8D 4C 09   ] Store A to Absolute
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $025278 (SNES $C25278) ---
org $C25278

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02569A (SNES $C2569A) ---
org $C2569A

    LDX $04F0               ; [AE F0 04   ] Load X from Absolute
    CPX #$BF                ; [E0 BF      ] Compare X Immediate
    ORA ($D0,X)             ; [01 D0      ] OR A with (DP,X)
    ORA $60                 ; [05 60      ] OR A with Direct Page

;--- Patch at file offset $025A8C (SNES $C25A8C) ---
org $C25A8C

    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $4008,X             ; [BD 08 40   ] Load A from Absolute,X
    CMP $0E                 ; [C5 0E      ] Compare A with DP
    BEQ $5A9F               ; [F0 0A      ] Branch if Equal
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    STA $4038,Y             ; [99 38 40   ] Store A to Absolute,Y
    STA $0E                 ; [85 0E      ] Store A to DP
    NOP                     ; [EA         ] No Operation
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits

;--- Patch at file offset $026770 (SNES $C26770) ---
org $C26770

    REP #$21                ; [C2 21      ] Reset Processor Status Bits
    LDA $7B73               ; [AD 73 7B   ] Load A from Absolute
    ORA #$00                ; [09 00      ] OR A with Immediate
    BRA $6716               ; [80 9D      ] Branch Always
    JMP $EA3A               ; [4C 3A EA   ] Jump Absolute
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    LDA $7B73               ; [AD 73 7B   ] Load A from Absolute
    AND #$FF                ; [29 FF      ] AND A with Immediate
    AND $A60E85,X           ; [3F 85 0E A6] AND A with Absolute Long,X
    AND ($BD)               ; [32 BD      ] AND A with (DP)
    ASL                     ; [0A         ] Shift Left Accumulator
    JSR $0E65               ; [20 65 0E   ] Jump to Subroutine
    BCS $6795               ; [B0 05      ] Branch if Carry Set

;--- Patch at file offset $0267B2 (SNES $C267B2) ---
org $C267B2

    REP #$21                ; [C2 21      ] Reset Processor Status Bits
    LDA $7B75               ; [AD 75 7B   ] Load A from Absolute
    ORA #$00                ; [09 00      ] OR A with Immediate
    BRA $6758               ; [80 9D      ] Branch Always
    JMP $EA3A               ; [4C 3A EA   ] Jump Absolute
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    LDA $7B75               ; [AD 75 7B   ] Load A from Absolute
    AND #$FF                ; [29 FF      ] AND A with Immediate
    AND $A60E85,X           ; [3F 85 0E A6] AND A with Absolute Long,X
    EOR #$BD                ; [49 BD      ] XOR A with Immediate
    ASL                     ; [0A         ] Shift Left Accumulator
    JSR $0E65               ; [20 65 0E   ] Jump to Subroutine
    BCS $67D7               ; [B0 05      ] Branch if Carry Set

;--- Patch at file offset $02758C (SNES $C2758C) ---
org $C2758C

    JSR $01EC               ; [20 EC 01   ] Jump to Subroutine
    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    AND #$BF                ; [29 BF      ] AND A with Immediate
    STA $201D,X             ; [9D 1D 20   ] Store A to Absolute,X
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    TDC                     ; [7B         ] Transfer Direct Page to A
    DEC                     ; [3A         ] Decrement Accumulator
    STA $0E                 ; [85 0E      ] Store A to DP
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAY                     ; [A8         ] Transfer A to Y
    TAX                     ; [AA         ] Transfer A to X
    LDA $4020,Y             ; [B9 20 40   ] Load A from Absolute,Y
    CMP #$FF                ; [C9 FF      ] Compare A Immediate
    SBC $BD09F0,X           ; [FF F0 09 BD] Subtract with Borrow Absolute Long,X
    ASL $22                 ; [06 22      ] Shift Left DP
    CMP $0E                 ; [C5 0E      ] Compare A with DP
    BCS $75B1               ; [B0 02      ] Branch if Carry Set
    STA $0E                 ; [85 0E      ] Store A to DP
    CLC                     ; [18         ] Clear Carry Flag
    TXA                     ; [8A         ] Transfer X to A
    ADC #$80                ; [69 80      ] Add with Carry Immediate
    BRK                     ; [00 AA      ] Software interrupt
    INY                     ; [C8         ] Increment Y
    INY                     ; [C8         ] Increment Y
    CPX #$00                ; [E0 00      ] Compare X Immediate
    COP #$D0                ; [02 D0      ] Coprocessor interrupt
    db $E2                      ; Incomplete/data bytes

;--- Patch at file offset $0293B7 (SNES $C293B7) ---
org $C293B7

    TAX                     ; [AA         ] Transfer A to X
    LDA $D0EEDB,X           ; [BF DB EE D0] Load A from Absolute Long,X
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAY                     ; [A8         ] Transfer A to Y
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $029511 (SNES $C29511) ---
org $C29511

    db $0D                      ; Incomplete/data bytes

;--- Patch at file offset $029767 (SNES $C29767) ---
org $C29767

    TAX                     ; [AA         ] Transfer A to X
    LDA $D0EE85,X           ; [BF 85 EE D0] Load A from Absolute Long,X
    TAY                     ; [A8         ] Transfer A to Y
    STZ $0E                 ; [64 0E      ] Store Zero to DP
    LDA $4747               ; [AD 47 47   ] Load A from Absolute
    CMP #$81                ; [C9 81      ] Compare A Immediate
    BNE $977A               ; [D0 04      ] Branch if Not Equal
    LDA #$01                ; [A9 01      ] Load A Immediate
    TSB $0E                 ; [04 0E      ] Test and Set Bits in DP
    LDA $7BFB               ; [AD FB 7B   ] Load A from Absolute
    BEQ $9783               ; [F0 04      ] Branch if Equal
    LDA #$20                ; [A9 20      ] Load A Immediate
    TSB $0E                 ; [04 0E      ] Test and Set Bits in DP
    LDA $7C5D               ; [AD 5D 7C   ] Load A from Absolute
    BEQ $978C               ; [F0 04      ] Branch if Equal
    LDA #$02                ; [A9 02      ] Load A Immediate
    TSB $0E                 ; [04 0E      ] Test and Set Bits in DP
    LDA $47                 ; [A5 47      ] Load A from DP
    CMP #$04                ; [C9 04      ] Compare A Immediate
    BCC $979A               ; [90 08      ] Branch if Carry Clear
    SBC #$04                ; [E9 04      ] Subtract with Borrow Immediate
    TAX                     ; [AA         ] Transfer A to X
    LDA #$80                ; [A9 80      ] Load A Immediate
    TSB $0E                 ; [04 0E      ] Test and Set Bits in DP
    TXA                     ; [8A         ] Transfer X to A
    STA $3BCD,Y             ; [99 CD 3B   ] Store A to Absolute,Y
    LDA $7B45               ; [AD 45 7B   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    CMP #$04                ; [C9 04      ] Compare A Immediate
    BCC $97AC               ; [90 07      ] Branch if Carry Clear
    SBC #$04                ; [E9 04      ] Subtract with Borrow Immediate
    TAX                     ; [AA         ] Transfer A to X
    LDA #$40                ; [A9 40      ] Load A Immediate
    TSB $0E                 ; [04 0E      ] Test and Set Bits in DP
    LDA $3BCE,Y             ; [B9 CE 3B   ] Load A from Absolute,Y
    JSR $01D6               ; [20 D6 01   ] Jump to Subroutine
    STA $3BCE,Y             ; [99 CE 3B   ] Store A to Absolute,Y
    LDA $5F                 ; [A5 5F      ] Load A from DP
    ORA $61                 ; [05 61      ] OR A with Direct Page
    BEQ $97BF               ; [F0 04      ] Branch if Equal
    LDA #$10                ; [A9 10      ] Load A Immediate
    TSB $0E                 ; [04 0E      ] Test and Set Bits in DP
    LDA $7B40               ; [AD 40 7B   ] Load A from Absolute
    BEQ $97C8               ; [F0 04      ] Branch if Equal
    LDA #$08                ; [A9 08      ] Load A Immediate
    TSB $0E                 ; [04 0E      ] Test and Set Bits in DP
    LDA $0E                 ; [A5 0E      ] Load A from DP
    STA $3BCC,Y             ; [99 CC 3B   ] Store A to Absolute,Y
    LDA $7B46               ; [AD 46 7B   ] Load A from Absolute
    BNE $97DD               ; [D0 0B      ] Branch if Not Equal
    LDA $3BCF,Y             ; [B9 CF 3B   ] Load A from Absolute,Y
    ORA $7B41               ; [0D 41 7B   ] OR A with Absolute
    STA $3BCF,Y             ; [99 CF 3B   ] Store A to Absolute,Y
    BRA $9813               ; [80 36      ] Branch Always
    LDA $7B45               ; [AD 45 7B   ] Load A from Absolute
    STA $48                 ; [85 48      ] Store A to DP
    LDA $3BD0,Y             ; [B9 D0 3B   ] Load A from Absolute,Y
    ORA $7B42               ; [0D 42 7B   ] OR A with Absolute
    STA $3BD0,Y             ; [99 D0 3B   ] Store A to Absolute,Y
    LDA $7B41               ; [AD 41 7B   ] Load A from Absolute
    BEQ $9813               ; [F0 23      ] Branch if Equal
    LDA $7B2C               ; [AD 2C 7B   ] Load A from Absolute
    JSR $01B6               ; [20 B6 01   ] Jump to Subroutine
    STA $0F                 ; [85 0F      ] Store A to DP
    LDA $48                 ; [A5 48      ] Load A from DP
    CMP #$04                ; [C9 04      ] Compare A Immediate
    BCC $9800               ; [90 02      ] Branch if Carry Clear
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
    BEQ $982A               ; [F0 08      ] Branch if Equal
    INC $7ABC               ; [EE BC 7A   ] Increment Absolute
    CMP $7ABC               ; [CD BC 7A   ] Compare A with Absolute
    BNE $9884               ; [D0 5A      ] Branch if Not Equal
    LDA $3BCF,Y             ; [B9 CF 3B   ] Load A from Absolute,Y
    BNE $9846               ; [D0 17      ] Branch if Not Equal
    LDA #$D0                ; [A9 D0      ] Load A Immediate
    LDY #$F6                ; [A0 F6      ] Load Y Immediate
    INC $2180               ; [EE 80 21   ] Increment Absolute

;--- Patch at file offset $029836 (SNES $C29836) ---
org $C29836

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $029846 (SNES $C29846) ---
org $C29846

    LDA $3BCC,Y             ; [B9 CC 3B   ] Load A from Absolute,Y
    BPL $9852               ; [10 07      ] Branch if Plus
    LDA #$D1                ; [A9 D1      ] Load A Immediate
    LDY #$F0                ; [A0 F0      ] Load Y Immediate
    AND #$80                ; [29 80      ] AND A with Immediate
    ORA $A9                 ; [05 A9      ] OR A with Direct Page
    CMP ($A0),Y             ; [D1 A0      ] Compare A with (DP),Y
    CPX #$29                ; [E0 29      ] Compare X Immediate
    STY $10                 ; [84 10      ] Store Y to DP
    STA $12                 ; [85 12      ] Store A to DP
    JSR $9965               ; [20 65 99   ] Jump to Subroutine
    LDA $3C5F,X             ; [BD 5F 3C   ] Load A from Absolute,X
    TAY                     ; [A8         ] Transfer A to Y
    AND #$07                ; [29 07      ] AND A with Immediate
    TAX                     ; [AA         ] Transfer A to X
    TYA                     ; [98         ] Transfer Y to A
    LSR                     ; [4A         ] Shift Right Accumulator
    LSR                     ; [4A         ] Shift Right Accumulator
    LSR                     ; [4A         ] Shift Right Accumulator
    TAY                     ; [A8         ] Transfer A to Y
    LDA [$10],Y             ; [B7 10      ] Load A from [DP],Y

;--- Patch at file offset $029F45 (SNES $C29F45) ---
org $C29F45

    PHX                     ; [DA         ] Push X Register
    TAX                     ; [AA         ] Transfer A to X
    LDA $CEFF84,X           ; [BF 84 FF CE] Load A from Absolute Long,X
    TAY                     ; [A8         ] Transfer A to Y
    PLX                     ; [FA         ] Pull X Register
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $10EEF6 (SNES $D0EEF6) ---
org $D0EEF6

    ADC $E7FFFF,X           ; [7F FF FF E7] Add with Carry Absolute Long,X

;--- Patch at file offset $1129E0 (SNES $D129E0) ---
org $D129E0

    SBC $FFFFFF,X           ; [FF FF FF FF] Subtract with Borrow Absolute Long,X
    SBC $CFFFFF,X           ; [FF FF FF CF] Subtract with Borrow Absolute Long,X
    STZ $FF7F               ; [9C 7F FF   ] Store Zero to Absolute
    SBC $FFFFFF,X           ; [FF FF FF FF] Subtract with Borrow Absolute Long,X
    SBC $FFFFFF,X           ; [FF FF FF FF] Subtract with Borrow Absolute Long,X
    SBC $F7FFFF,X           ; [FF FF FF F7] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $1129F7 (SNES $D129F7) ---
org $D129F7

    SBC $FFFFFF,X           ; [FF FF FF FF] Subtract with Borrow Absolute Long,X
    SBC $FFFFFF,X           ; [FF FF FF FF] Subtract with Borrow Absolute Long,X
    db $FF                      ; Incomplete/data bytes

;--- End of patch ---