;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_optimize.ips.commented.asm
;    Disassembled from IPS patch: ff5_optimize.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 7 record(s)

;--- Patch at file offset $02F88A (SNES $C2F88A) ---
org $C2F88A

    ORA $9420               ; [0D 20 94   ] OR A with Absolute
    INC $80A4               ; [EE A4 80   ] Increment Absolute
    LDA $0521,Y             ; [B9 21 05   ] Load A from Absolute,Y
    STA $F0                 ; [85 F0      ] Store A to DP
    JSR $F949               ; [20 49 F9   ] Jump to Subroutine
    PLP                     ; [28         ] Pull Processor Status
    PLB                     ; [AB         ] Pull Data Bank
    RTS                     ; [60         ] Return from Subroutine
    LDY $8E                 ; [A4 8E      ] Load Y from DP
    JSR $F932               ; [20 32 F9   ] Jump to Subroutine
    BCS $F8A9               ; [B0 07      ] Branch if Carry Set
    STA $72                 ; [85 72      ] Store A to DP
    JSR $FA92               ; [20 92 FA   ] Jump to Subroutine
    BRA $F8AE               ; [80 05      ] Branch Always
    INY                     ; [C8         ] Increment Y
    CPY $75                 ; [C4 75      ] Compare Y with DP
    BMI $F89D               ; [30 EF      ] Branch if Minus
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02F8B7 (SNES $C2F8B7) ---
org $C2F8B7

    DEC                     ; [3A         ] Decrement Accumulator
    STA $2CCF               ; [8D CF 2C   ] Store A to Absolute
    STZ $2CD0               ; [9C D0 2C   ] Store Zero to Absolute
    LDY $8E                 ; [A4 8E      ] Load Y from DP
    STY $2CCB               ; [8C CB 2C   ] Store Y to Absolute
    LDA $7B00,Y             ; [B9 00 7B   ] Load A from Absolute,Y
    BEQ $F8E9               ; [F0 21      ] Branch if Equal
    JSR $F932               ; [20 32 F9   ] Jump to Subroutine
    BMI $F8E9               ; [30 1C      ] Branch if Minus
    BCS $F8E9               ; [B0 1A      ] Branch if Carry Set
    JSR $D9AB               ; [20 AB D9   ] Jump to Subroutine
    LDA $9F                 ; [A5 9F      ] Load A from DP
    AND $2CCD               ; [2D CD 2C   ] AND A with Absolute
    EOR $2CCE               ; [4D CE 2C   ] XOR A with Absolute
    BEQ $F8E9               ; [F0 0D      ] Branch if Equal
    LDA $A2                 ; [A5 A2      ] Load A from DP
    STA $2CCC               ; [8D CC 2C   ] Store A to Absolute
    LDA $7A00,Y             ; [B9 00 7A   ] Load A from Absolute,Y
    STA $2CCB               ; [8D CB 2C   ] Store A to Absolute
    BRA $F8EE               ; [80 05      ] Branch Always
    INY                     ; [C8         ] Increment Y
    CPY $75                 ; [C4 75      ] Compare Y with DP
    BMI $F8C3               ; [30 D5      ] Branch if Minus
    LDX $2CCF               ; [AE CF 2C   ] Load X from Absolute
    LDA $2CCB               ; [AD CB 2C   ] Load A from Absolute
    STA $2CD1,X             ; [9D D1 2C   ] Store A to Absolute,X
    LDA $2CCC               ; [AD CC 2C   ] Load A from Absolute
    STA $2CD5,X             ; [9D D5 2C   ] Store A to Absolute,X
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02F90E (SNES $C2F90E) ---
org $C2F90E

    DEC                     ; [3A         ] Decrement Accumulator
    STA $2CCF               ; [8D CF 2C   ] Store A to Absolute
    STZ $2CD0               ; [9C D0 2C   ] Store Zero to Absolute
    LDX $2CCF               ; [AE CF 2C   ] Load X from Absolute
    LDY $8E                 ; [A4 8E      ] Load Y from DP
    LDA $7B00,Y             ; [B9 00 7B   ] Load A from Absolute,Y
    BEQ $F92B               ; [F0 0C      ] Branch if Equal
    JSR $F932               ; [20 32 F9   ] Jump to Subroutine
    BPL $F92B               ; [10 07      ] Branch if Plus
    db $B0                      ; Incomplete/data bytes

;--- Patch at file offset $02F92F (SNES $C2F92F) ---
org $C2F92F

    NOP                     ; [EA         ] No Operation
    PLP                     ; [28         ] Pull Processor Status
    RTS                     ; [60         ] Return from Subroutine
    LDA $7A00,Y             ; [B9 00 7A   ] Load A from Absolute,Y
    PHA                     ; [48         ] Push Accumulator
    PHX                     ; [DA         ] Push X Register
    LDX #$FF                ; [A2 FF      ] Load X Immediate
    SBC $BF18E8,X           ; [FF E8 18 BF] Subtract with Borrow Absolute Long,X
    ADC $FA                 ; [65 FA      ] Add with Carry DP
    REP #$F0                ; [C2 F0      ] Reset Processor Status Bits
    TSB $C3                 ; [04 C3      ] Test and Set Bits in DP
    ORA $D0,S               ; [03 D0      ] OR A with Stack Relative
    PEA $68FA               ; [F4 FA 68   ] Push Effective Absolute
    RTS                     ; [60         ] Return from Subroutine
    LDX #$80                ; [A2 80      ] Load X Immediate

;--- Patch at file offset $02F951 (SNES $C2F951) ---
org $C2F951

    LDA $F0                 ; [A5 F0      ] Load A from DP
    AND #$20                ; [29 20      ] AND A with Immediate
    BEQ $F95F               ; [F0 08      ] Branch if Equal
    LDX #$40                ; [A2 40      ] Load X Immediate
    BRK                     ; [00 A9      ] Software interrupt
    COP #$20                ; [02 20      ] Coprocessor interrupt
    LDA ($F8),Y             ; [B1 F8      ] Load A from (DP),Y
    LDX #$80                ; [A2 80      ] Load X Immediate
    BRA $F90C               ; [80 A9      ] Branch Always
    ORA $20,S               ; [03 20      ] OR A with Stack Relative
    LDA ($F8),Y             ; [B1 F8      ] Load A from (DP),Y
    LDA $F0                 ; [A5 F0      ] Load A from DP
    AND #$01                ; [29 01      ] AND A with Immediate
    BEQ $F981               ; [F0 14      ] Branch if Equal
    LDA $7B00,Y             ; [B9 00 7B   ] Load A from Absolute,Y
    DEC                     ; [3A         ] Decrement Accumulator
    STA $7B00,Y             ; [99 00 7B   ] Store A to Absolute,Y
    LDX #$80                ; [A2 80      ] Load X Immediate
    BRA $F921               ; [80 A9      ] Branch Always
    TSB $20                 ; [04 20      ] Test and Set Bits in DP
    LDA ($F8),Y             ; [B1 F8      ] Load A from (DP),Y
    LDA $2CD4               ; [AD D4 2C   ] Load A from Absolute
    BNE $F986               ; [D0 05      ] Branch if Not Equal
    LDA #$04                ; [A9 04      ] Load A Immediate
    JSR $F90B               ; [20 0B F9   ] Jump to Subroutine
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $2CD7               ; [AD D7 2C   ] Load A from Absolute
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 85      ] Software interrupt
    CPX #$AD                ; [E0 AD      ] Compare X Immediate
    CMP $2C,X               ; [D5 2C      ] Compare A with DP,X
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 85      ] Software interrupt
    SEP #$AD                ; [E2 AD      ] Set Processor Status Bits
    DEC $2C,X               ; [D6 2C      ] Decrement DP,X
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 0A      ] Software interrupt
    STA $E4                 ; [85 E4      ] Store A to DP
    LDA $2CD8               ; [AD D8 2C   ] Load A from Absolute
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 18      ] Software interrupt
    ADC $E0                 ; [65 E0      ] Add with Carry DP
    CMP $E2                 ; [C5 E2      ] Compare A with DP
    BMI $F9B7               ; [30 09      ] Branch if Minus
    CMP $E4                 ; [C5 E4      ] Compare A with DP
    BMI $F9C2               ; [30 10      ] Branch if Minus
    LDX $2CD3               ; [AE D3 2C   ] Load X from Absolute
    BRA $F9C9               ; [80 12      ] Branch Always
    LDA $E2                 ; [A5 E2      ] Load A from DP
    CMP $E4                 ; [C5 E4      ] Compare A with DP
    BMI $F9C2               ; [30 05      ] Branch if Minus
    LDA $2CD1               ; [AD D1 2C   ] Load A from Absolute
    BRA $F9C5               ; [80 03      ] Branch Always
    LDA $2CD2               ; [AD D2 2C   ] Load A from Absolute
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 AA      ] Software interrupt
    STX $2CD1               ; [8E D1 2C   ] Store X to Absolute
    JSR $FA75               ; [20 75 FA   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02FA65 (SNES $C2FA65) ---
org $C2FA65

    JML $CE3655             ; [5C 55 36 CE] Jump Long
    CPY $B3BF               ; [CC BF B3   ] Compare Y with Absolute
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    BRK                     ; [00 00      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $02FAB2 (SNES $C2FAB2) ---
org $C2FAB2

    ROR $AB48,X             ; [7E 48 AB   ] Rotate Right Absolute,X
    LDA #$03                ; [A9 03      ] Load A Immediate
    STA $6F                 ; [85 6F      ] Store A to DP
    JSR $ED5E               ; [20 5E ED   ] Jump to Subroutine
    LDX $75                 ; [A6 75      ] Load X from DP
    BEQ $FAC9               ; [F0 09      ] Branch if Equal
    JSR $EE94               ; [20 94 EE   ] Jump to Subroutine
    JSR $F89B               ; [20 9B F8   ] Jump to Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    INC $6F                 ; [E6 6F      ] Increment DP
    LDA $6F                 ; [A5 6F      ] Load A from DP
    CMP #$06                ; [C9 06      ] Compare A Immediate
    BNE $FAB9               ; [D0 E8      ] Branch if Not Equal

;--- End of patch ---