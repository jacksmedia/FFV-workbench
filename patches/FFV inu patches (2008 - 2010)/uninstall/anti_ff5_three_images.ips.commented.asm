;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_three_images.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_three_images.ips
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

;--- Patch at file offset $016EF8 (SNES $C16EF8) ---
org $C16EF8

    TXA                     ; [8A         ] Transfer X to A
    LSR                     ; [4A         ] Shift Right Accumulator
    LSR                     ; [4A         ] Shift Right Accumulator
    LSR                     ; [4A         ] Shift Right Accumulator
    LSR                     ; [4A         ] Shift Right Accumulator
    LSR                     ; [4A         ] Shift Right Accumulator
    TAY                     ; [A8         ] Transfer A to Y
    LDA $D1CB,Y             ; [B9 CB D1   ] Load A from Absolute,Y
    BNE $6F74               ; [D0 70      ] Branch if Not Equal
    JSR $6ED4               ; [20 D4 6E   ] Jump to Subroutine
    LDA $CF5A,X             ; [BD 5A CF   ] Load A from Absolute,X
    BEQ $6F74               ; [F0 68      ] Branch if Equal
    CMP #$01                ; [C9 01      ] Compare A Immediate
    BNE $6F1D               ; [D0 0D      ] Branch if Not Equal
    LDA $CF50,X             ; [BD 50 CF   ] Load A from Absolute,X
    AND #$01                ; [29 01      ] AND A with Immediate
    BEQ $6F74               ; [F0 5D      ] Branch if Equal
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    STX $94                 ; [86 94      ] Store X to DP
    BRA $6F2F               ; [80 12      ] Branch Always
    LDA $CF50,X             ; [BD 50 CF   ] Load A from Absolute,X
    AND #$01                ; [29 01      ] AND A with Immediate
    BEQ $6F2B               ; [F0 07      ] Branch if Equal
    ASL $88                 ; [06 88      ] Shift Left DP
    LDX #$60                ; [A2 60      ] Load X Immediate
    BRK                     ; [00 80      ] Software interrupt
    COP #$7B                ; [02 7B      ] Coprocessor interrupt
    TAX                     ; [AA         ] Transfer A to X
    STX $94                 ; [86 94      ] Store X to DP
    LDA $96                 ; [A5 96      ] Load A from DP
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $D0E1D8,X           ; [BF D8 E1 D0] Load A from Absolute Long,X
    TAY                     ; [A8         ] Transfer A to Y
    LDA $D0E1E0,X           ; [BF E0 E1 D0] Load A from Absolute Long,X
    CLC                     ; [18         ] Clear Carry Flag
    ADC $94                 ; [65 94      ] Add with Carry DP
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $F6                 ; [A5 F6      ] Load A from DP
    BEQ $6F76               ; [F0 2D      ] Branch if Equal
    LDA #$06                ; [A9 06      ] Load A Immediate
    STA $89                 ; [85 89      ] Store A to DP
    LDA $F789,X             ; [BD 89 F7   ] Load A from Absolute,X
    SEC                     ; [38         ] Set Carry Flag
    SBC $88                 ; [E5 88      ] Subtract with Borrow DP
    STA $0200,Y             ; [99 00 02   ] Store A to Absolute,Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    LDA $F789,X             ; [BD 89 F7   ] Load A from Absolute,X
    STA $0200,Y             ; [99 00 02   ] Store A to Absolute,Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    LDA $F789,X             ; [BD 89 F7   ] Load A from Absolute,X
    STA $0200,Y             ; [99 00 02   ] Store A to Absolute,Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    LDA $F789,X             ; [BD 89 F7   ] Load A from Absolute,X
    STA $0200,Y             ; [99 00 02   ] Store A to Absolute,Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    DEC $89                 ; [C6 89      ] Decrement DP
    BNE $6F4D               ; [D0 D9      ] Branch if Not Equal
    BRA $6FA1               ; [80 2B      ] Branch Always
    LDA #$06                ; [A9 06      ] Load A Immediate
    STA $89                 ; [85 89      ] Store A to DP
    LDA $F789,X             ; [BD 89 F7   ] Load A from Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    ADC $88                 ; [65 88      ] Add with Carry DP
    STA $0200,Y             ; [99 00 02   ] Store A to Absolute,Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    LDA $F789,X             ; [BD 89 F7   ] Load A from Absolute,X
    STA $0200,Y             ; [99 00 02   ] Store A to Absolute,Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    LDA $F789,X             ; [BD 89 F7   ] Load A from Absolute,X
    STA $0200,Y             ; [99 00 02   ] Store A to Absolute,Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    LDA $F789,X             ; [BD 89 F7   ] Load A from Absolute,X
    STA $0200,Y             ; [99 00 02   ] Store A to Absolute,Y
    INX                     ; [E8         ] Increment X
    INY                     ; [C8         ] Increment Y
    DEC $89                 ; [C6 89      ] Decrement DP
    BNE $6F7A               ; [D0 D9      ] Branch if Not Equal
    PLY                     ; [7A         ] Pull Y Register
    PLX                     ; [FA         ] Pull X Register
    RTS                     ; [60         ] Return from Subroutine

;--- End of patch ---