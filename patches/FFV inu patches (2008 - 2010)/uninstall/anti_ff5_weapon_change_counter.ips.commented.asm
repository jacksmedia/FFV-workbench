;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_weapon_change_counter.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_weapon_change_counter.ips
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

;--- Patch at file offset $019F70 (SNES $C19F70) ---
org $C19F70

    JSR $8D53               ; [20 53 8D   ] Jump to Subroutine
    BMI $9F7A               ; [30 05      ] Branch if Minus
    LDY #$13                ; [A0 13      ] Load Y Immediate
    BRK                     ; [00 80      ] Software interrupt
    ORA $A0,S               ; [03 A0      ] OR A with Stack Relative
    TRB $00                 ; [14 00      ] Test and Reset Bits DP
    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $D1D3               ; [8D D3 D1   ] Store A to Absolute

;--- Patch at file offset $019F90 (SNES $C19F90) ---
org $C19F90

    ASL                     ; [0A         ] Shift Left Accumulator
    TAY                     ; [A8         ] Transfer A to Y
    LDA $7B7E,Y             ; [B9 7E 7B   ] Load A from Absolute,Y
    AND #$30                ; [29 30      ] AND A with Immediate
    BEQ $9FA2               ; [F0 09      ] Branch if Equal
    LDA #$02                ; [A9 02      ] Load A Immediate
    STA $D1D3               ; [8D D3 D1   ] Store A to Absolute
    TDC                     ; [7B         ] Transfer Direct Page to A
    JMP $9FBA               ; [4C BA 9F   ] Jump Absolute
    JSR $8D2F               ; [20 2F 8D   ] Jump to Subroutine
    TAX                     ; [AA         ] Transfer A to X
    LDA $CEFF84,X           ; [BF 84 FF CE] Load A from Absolute Long,X
    TAX                     ; [AA         ] Transfer A to X
    JSR $8D53               ; [20 53 8D   ] Jump to Subroutine
    BMI $9FB5               ; [30 05      ] Branch if Minus
    LDA $37AC,X             ; [BD AC 37   ] Load A from Absolute,X
    BRA $9FBA               ; [80 05      ] Branch Always
    INC $71                 ; [E6 71      ] Increment DP
    LDA $37AD,X             ; [BD AD 37   ] Load A from Absolute,X

;--- End of patch ---