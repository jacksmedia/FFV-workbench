;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_core-1.4_to_1.5.ips.commented.asm
;    Disassembled from IPS patch: ff5_core-1.4_to_1.5.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 9 record(s)

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

;--- End of patch ---