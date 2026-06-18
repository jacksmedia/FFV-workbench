;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_steal3x.ips.commented.asm
;    Disassembled from IPS patch: ff5_steal3x.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 2 record(s)

;--- Patch at file offset $027150 (SNES $C27150) ---
org $C27150

    STZ $7C9A               ; [9C 9A 7C   ] Store Zero to Absolute
    LDY #$02                ; [A0 02      ] Load Y Immediate
    BRK                     ; [00 20      ] Software interrupt
    STA $92,S               ; [83 92      ] Store A to Stack Relative
    LDA $D05000,X           ; [BF 00 50 D0] Load A from Absolute Long,X
    BNE $7167               ; [D0 08      ] Branch if Not Equal
    TDC                     ; [7B         ] Transfer Direct Page to A
    TYX                     ; [BB         ] Transfer Y to X
    JSR $01D6               ; [20 D6 01   ] Jump to Subroutine
    TSB $7C9A               ; [0C 9A 7C   ] Test and Set Bits Absolute
    DEY                     ; [88         ] Decrement Y
    BPL $7156               ; [10 EC      ] Branch if Plus
    LDX $49                 ; [A6 49      ] Load X from DP
    LDA $206B,X             ; [BD 6B 20   ] Load A from Absolute,X
    ORA $7C9A               ; [0D 9A 7C   ] OR A with Absolute
    STA $7C9A               ; [8D 9A 7C   ] Store A to Absolute
    CMP #$E0                ; [C9 E0      ] Compare A Immediate
    BEQ $7196               ; [F0 1D      ] Branch if Equal
    JSR $7C85               ; [20 85 7C   ] Jump to Subroutine
    JSR $7E12               ; [20 12 7E   ] Jump to Subroutine
    LDA $56                 ; [A5 56      ] Load A from DP
    BNE $719C               ; [D0 19      ] Branch if Not Equal
    JSR $9208               ; [20 08 92   ] Jump to Subroutine
    LDA $56                 ; [A5 56      ] Load A from DP
    BNE $719C               ; [D0 12      ] Branch if Not Equal
    LDX $49                 ; [A6 49      ] Load X from DP
    LDA $7C9A               ; [AD 9A 7C   ] Load A from Absolute
    STA $206B,X             ; [9D 6B 20   ] Store A to Absolute,X
    LDA #$21                ; [A9 21      ] Load A Immediate
    BRA $719E               ; [80 08      ] Branch Always
    INC $56                 ; [E6 56      ] Increment DP
    LDA #$4B                ; [A9 4B      ] Load A Immediate
    BRA $719E               ; [80 02      ] Branch Always
    LDA #$22                ; [A9 22      ] Load A Immediate
    PHA                     ; [48         ] Push Accumulator
    JSR $71A7               ; [20 A7 71   ] Jump to Subroutine
    PLA                     ; [68         ] Pull Accumulator
    STA $3C5F,X             ; [9D 5F 3C   ] Store A to Absolute,X
    RTS                     ; [60         ] Return from Subroutine
    LDA $4746               ; [AD 46 47   ] Load A from Absolute
    CMP #$0B                ; [C9 0B      ] Compare A Immediate
    BEQ $71B2               ; [F0 04      ] Branch if Equal
    CMP #$33                ; [C9 33      ] Compare A Immediate
    BNE $71B6               ; [D0 04      ] Branch if Not Equal
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    TAY                     ; [A8         ] Transfer A to Y
    RTS                     ; [60         ] Return from Subroutine
    JMP $9965               ; [4C 65 99   ] Jump Absolute

;--- Patch at file offset $029208 (SNES $C29208) ---
org $C29208

    LDA $48                 ; [A5 48      ] Load A from DP
    CMP #$04                ; [C9 04      ] Compare A Immediate
    BCS $9211               ; [B0 03      ] Branch if Carry Set
    INC $56                 ; [E6 56      ] Increment DP
    RTS                     ; [60         ] Return from Subroutine
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    DEC                     ; [3A         ] Decrement Accumulator
    JSR $007C               ; [20 7C 00   ] Jump to Subroutine
    LDY #$00                ; [A0 00      ] Load Y Immediate
    BRK                     ; [00 C9      ] Software interrupt
    ASL                     ; [0A         ] Shift Left Accumulator
    BCC $921F               ; [90 01      ] Branch if Carry Clear
    INY                     ; [C8         ] Increment Y
    CMP #$F6                ; [C9 F6      ] Compare A Immediate
    BCC $9224               ; [90 01      ] Branch if Carry Clear
    INY                     ; [C8         ] Increment Y
    TDC                     ; [7B         ] Transfer Direct Page to A
    TYX                     ; [BB         ] Transfer Y to X
    JSR $01D6               ; [20 D6 01   ] Jump to Subroutine
    TSB $7C9A               ; [0C 9A 7C   ] Test and Set Bits Absolute
    BNE $920E               ; [D0 E0      ] Branch if Not Equal
    JSR $9283               ; [20 83 92   ] Jump to Subroutine
    LDA $D05000,X           ; [BF 00 50 D0] Load A from Absolute Long,X
    STA $0E                 ; [85 0E      ] Store A to DP
    LDY #$FF                ; [A0 FF      ] Load Y Immediate
    BRK                     ; [00 B9      ] Software interrupt
    BIT $27,X               ; [34 27      ] Test Bits DP,X
    CMP $0E                 ; [C5 0E      ] Compare A with DP
    BEQ $9252               ; [F0 11      ] Branch if Equal
    DEY                     ; [88         ] Decrement Y
    BPL $923A               ; [10 F6      ] Branch if Plus
    INY                     ; [C8         ] Increment Y
    LDA $2734,Y             ; [B9 34 27   ] Load A from Absolute,Y
    BEQ $9252               ; [F0 08      ] Branch if Equal
    INY                     ; [C8         ] Increment Y
    CPY #$00                ; [C0 00      ] Compare Y Immediate
    ORA ($D0,X)             ; [01 D0      ] OR A with (DP,X)
    SBC $80,X               ; [F5 80      ] Subtract with Borrow DP,X
    LDY $0EA5,X             ; [BC A5 0E   ] Load Y from Absolute,X
    STA $2734,Y             ; [99 34 27   ] Store A to Absolute,Y
    PHA                     ; [48         ] Push Accumulator
    LDA $2620,Y             ; [B9 20 26   ] Load A from Absolute,Y
    PHA                     ; [48         ] Push Accumulator
    PHY                     ; [5A         ] Push Y Register
    LDA $0E                 ; [A5 0E      ] Load A from DP
    JSR $03FA               ; [20 FA 03   ] Jump to Subroutine
    JSR $0369               ; [20 69 03   ] Jump to Subroutine
    PLY                     ; [7A         ] Pull Y Register
    STA $2C34,Y             ; [99 34 2C   ] Store A to Absolute,Y
    PLA                     ; [68         ] Pull Accumulator
    STA $2620,Y             ; [99 20 26   ] Store A to Absolute,Y
    LDA $2834,Y             ; [B9 34 28   ] Load A from Absolute,Y
    INC                     ; [1A         ] Increment Accumulator
    CMP #$64                ; [C9 64      ] Compare A Immediate
    BCC $9277               ; [90 02      ] Branch if Carry Clear
    LDA #$63                ; [A9 63      ] Load A Immediate
    STA $2834,Y             ; [99 34 28   ] Store A to Absolute,Y
    JSR $71A7               ; [20 A7 71   ] Jump to Subroutine
    TYX                     ; [BB         ] Transfer Y to X
    PLA                     ; [68         ] Pull Accumulator
    STA $3CBF,X             ; [9D BF 3C   ] Store A to Absolute,X
    RTS                     ; [60         ] Return from Subroutine
    STY $0E                 ; [84 0E      ] Store Y to DP
    SEC                     ; [38         ] Set Carry Flag
    LDA $48                 ; [A5 48      ] Load A from DP
    SBC #$04                ; [E9 04      ] Subtract with Borrow Immediate
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $4020,X             ; [BD 20 40   ] Load A from Absolute,X
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    CLC                     ; [18         ] Clear Carry Flag
    ADC $0E                 ; [65 0E      ] Add with Carry DP
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    RTS                     ; [60         ] Return from Subroutine
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

;--- End of patch ---