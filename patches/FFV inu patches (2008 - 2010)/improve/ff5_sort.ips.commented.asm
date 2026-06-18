;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_sort.ips.commented.asm
;    Disassembled from IPS patch: ff5_sort.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 1 record(s)

;--- Patch at file offset $02E00B (SNES $C2E00B) ---
org $C2E00B

    LDX #$00                ; [A2 00      ] Load X Immediate
    ORA $CA,S               ; [03 CA      ] OR A with Stack Relative
    DEX                     ; [CA         ] Decrement X
    STZ $7F00,X             ; [9E 00 7F   ] Store Zero to Absolute,X
    BNE $E00E               ; [D0 F9      ] Branch if Not Equal
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    TXY                     ; [9B         ] Transfer X to Y
    LDA $C2E096,X           ; [BF 96 E0 C2] Load A from Absolute Long,X
    BEQ $E079               ; [F0 5B      ] Branch if Equal
    PHX                     ; [DA         ] Push X Register
    STA $E0                 ; [85 E0      ] Store A to DP
    LDX $8E                 ; [A6 8E      ] Load X from DP
    LDA $0640,X             ; [BD 40 06   ] Load A from Absolute,X
    BEQ $E06F               ; [F0 47      ] Branch if Equal
    CMP #$01                ; [C9 01      ] Compare A Immediate
    BEQ $E06F               ; [F0 43      ] Branch if Equal
    CMP #$80                ; [C9 80      ] Compare A Immediate
    BEQ $E06F               ; [F0 3F      ] Branch if Equal
    CMP #$E0                ; [C9 E0      ] Compare A Immediate
    BCC $E038               ; [90 04      ] Branch if Carry Clear
    LDA #$FD                ; [A9 FD      ] Load A Immediate
    BRA $E04D               ; [80 15      ] Branch Always
    PHX                     ; [DA         ] Push X Register
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 85      ] Software interrupt
    SEP #$0A                ; [E2 0A      ] Set Processor Status Bits
    ASL                     ; [0A         ] Shift Left Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    ADC $E2                 ; [65 E2      ] Add with Carry DP
    TAX                     ; [AA         ] Transfer A to X
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $D11380,X           ; [BF 80 13 D1] Load A from Absolute Long,X
    PLX                     ; [FA         ] Pull X Register
    CMP $E0                 ; [C5 E0      ] Compare A with DP
    BNE $E06F               ; [D0 1E      ] Branch if Not Equal
    LDA $0740,X             ; [BD 40 07   ] Load A from Absolute,X
    BEQ $E06F               ; [F0 19      ] Branch if Equal
    CMP #$64                ; [C9 64      ] Compare A Immediate
    BCC $E05C               ; [90 02      ] Branch if Carry Clear
    LDA #$63                ; [A9 63      ] Load A Immediate
    STA $8100,Y             ; [99 00 81   ] Store A to Absolute,Y
    LDA $0640,X             ; [BD 40 06   ] Load A from Absolute,X
    STA $8000,Y             ; [99 00 80   ] Store A to Absolute,Y
    STZ $0640,X             ; [9E 40 06   ] Store Zero to Absolute,X
    LDA $288A,X             ; [BD 8A 28   ] Load A from Absolute,X
    STA $7F00,Y             ; [99 00 7F   ] Store A to Absolute,Y
    INY                     ; [C8         ] Increment Y
    INX                     ; [E8         ] Increment X
    CPX #$00                ; [E0 00      ] Compare X Immediate
    ORA ($D0,X)             ; [01 D0      ] OR A with (DP,X)
    LDX $E8FA               ; [AE FA E8   ] Load X from Absolute
    BRA $E018               ; [80 9F      ] Branch Always
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDX #$00                ; [A2 00      ] Load X Immediate
    BRA $E01F               ; [80 A0      ] Branch Always
    RTI                     ; [40         ] Return from Interrupt
    ASL $A9                 ; [06 A9      ] Shift Left DP
    SBC $7E5401,X           ; [FF 01 54 7E] Subtract with Borrow Absolute Long,X
    ROR $00A2,X             ; [7E A2 00   ] Rotate Right Absolute,X
    ADC $288AA0,X           ; [7F A0 8A 28] Add with Carry Absolute Long,X
    LDA #$FF                ; [A9 FF      ] Load A Immediate
    BRK                     ; [00 54      ] Software interrupt
    ROR $287E,X             ; [7E 7E 28   ] Rotate Right Absolute,X
    PLB                     ; [AB         ] Pull Data Bank
    RTS                     ; [60         ] Return from Subroutine
    SBC $E3E7,X             ; [FD E7 E3   ] Subtract with Borrow Absolute,X
    INX                     ; [E8         ] Increment X
    SBC #$EA                ; [E9 EA      ] Subtract with Borrow Immediate
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    CPX $EEED               ; [EC ED EE   ] Compare X with Absolute
    SBC $F1FFF0             ; [EF F0 FF F1] Subtract with Borrow Absolute Long
    SBC ($F3)               ; [F2 F3      ] Subtract with Borrow (DP)
    db $F4, $00                 ; Incomplete/data bytes

;--- End of patch ---