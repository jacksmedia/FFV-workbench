;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_sort.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_sort.ips
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

    LDX $8E                 ; [A6 8E      ] Load X from DP
    STZ $7F00,X             ; [9E 00 7F   ] Store Zero to Absolute,X
    INX                     ; [E8         ] Increment X
    INX                     ; [E8         ] Increment X
    CPX #$00                ; [E0 00      ] Compare X Immediate
    ORA $D0,S               ; [03 D0      ] OR A with Stack Relative
    INC $C2,X               ; [F6 C2      ] Increment DP,X
    JSR $8EA4               ; [20 A4 8E   ] Jump to Subroutine
    LDA #$E0                ; [A9 E0      ] Load A Immediate
    BRK                     ; [00 A2      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt
    JSR $E050               ; [20 50 E0   ] Jump to Subroutine
    LDA $8E                 ; [A5 8E      ] Load A from DP
    LDX #$80                ; [A2 80      ] Load X Immediate
    BRK                     ; [00 20      ] Software interrupt
    BVC $E00C               ; [50 E0      ] Branch if Overflow Clear
    LDA #$80                ; [A9 80      ] Load A Immediate
    BRK                     ; [00 A2      ] Software interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    JSR $E050               ; [20 50 E0   ] Jump to Subroutine
    LDX #$00                ; [A2 00      ] Load X Immediate
    BRA $DFD9               ; [80 A0      ] Branch Always
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
    STA $93                 ; [85 93      ] Store A to DP
    STX $95                 ; [86 95      ] Store X to DP
    LDX $8E                 ; [A6 8E      ] Load X from DP
    LDA $0640,X             ; [BD 40 06   ] Load A from Absolute,X
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 F0      ] Software interrupt
    AND $01C9,X             ; [3D C9 01   ] AND A with Absolute,X
    BRK                     ; [00 F0      ] Software interrupt
    SEC                     ; [38         ] Set Carry Flag
    CMP #$80                ; [C9 80      ] Compare A Immediate
    BRK                     ; [00 F0      ] Software interrupt
    AND ($85,S),Y           ; [33 85      ] AND A with (SR),Y
    CPX #$BD                ; [E0 BD      ] Compare X Immediate
    RTI                     ; [40         ] Return from Interrupt
    ORA [$29]               ; [07 29      ] OR A with [DP]
    SBC $29F000,X           ; [FF 00 F0 29] Subtract with Borrow Absolute Long,X
    CMP #$64                ; [C9 64      ] Compare A Immediate
    BRK                     ; [00 30      ] Software interrupt
    ORA $A9,S               ; [03 A9      ] OR A with Stack Relative
    ADC $00,S               ; [63 00      ] Add with Carry Stack Relative
    STA $E2                 ; [85 E2      ] Store A to DP
    LDA $E0                 ; [A5 E0      ] Load A from DP
    CMP $93                 ; [C5 93      ] Compare A with DP
    BMI $E09B               ; [30 19      ] Branch if Minus
    CMP $95                 ; [C5 95      ] Compare A with DP
    BPL $E09B               ; [10 15      ] Branch if Plus
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $E0                 ; [A5 E0      ] Load A from DP
    STA $8000,Y             ; [99 00 80   ] Store A to Absolute,Y
    LDA $E2                 ; [A5 E2      ] Load A from DP
    STA $8100,Y             ; [99 00 81   ] Store A to Absolute,Y
    LDA $288A,X             ; [BD 8A 28   ] Load A from Absolute,X
    STA $7F00,Y             ; [99 00 7F   ] Store A to Absolute,Y
    INY                     ; [C8         ] Increment Y
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    INX                     ; [E8         ] Increment X
    CPX #$00                ; [E0 00      ] Compare X Immediate
    ORA ($D0,X)             ; [01 D0      ] OR A with (DP,X)
    LDA $98,X               ; [B5 98      ] Load A from DP,X
    INC                     ; [1A         ] Increment Accumulator
    AND #$FE                ; [29 FE      ] AND A with Immediate
    db $FF, $A8, $60            ; Incomplete/data bytes

;--- End of patch ---