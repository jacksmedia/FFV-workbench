;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_weapon_change_counter.ips.commented.asm
;    Disassembled from IPS patch: ff5_weapon_change_counter.ips
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

    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $D1D3               ; [8D D3 D1   ] Store A to Absolute
    JSR $8D53               ; [20 53 8D   ] Jump to Subroutine
    BMI $9F7F               ; [30 05      ] Branch if Minus
    LDY #$13                ; [A0 13      ] Load Y Immediate
    BRK                     ; [00 80      ] Software interrupt
    ORA $A0,S               ; [03 A0      ] OR A with Stack Relative
    TRB $00                 ; [14 00      ] Test and Reset Bits DP

;--- Patch at file offset $019F90 (SNES $C19F90) ---
org $C19F90

    TAX                     ; [AA         ] Transfer A to X
    ASL                     ; [0A         ] Shift Left Accumulator
    TAY                     ; [A8         ] Transfer A to Y
    LDA $7B7E,Y             ; [B9 7E 7B   ] Load A from Absolute,Y
    AND #$30                ; [29 30      ] AND A with Immediate
    BEQ $9FA2               ; [F0 08      ] Branch if Equal
    LDA #$02                ; [A9 02      ] Load A Immediate
    STA $D1D3               ; [8D D3 D1   ] Store A to Absolute
    TDC                     ; [7B         ] Transfer Direct Page to A
    BRA $9FBA               ; [80 18      ] Branch Always
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $D97CD1,X           ; [BF D1 7C D9] Load A from Absolute Long,X
    SEC                     ; [38         ] Set Carry Flag
    SBC #$00                ; [E9 00      ] Subtract with Borrow Immediate
    COP #$85                ; [02 85      ] Coprocessor interrupt
    ROR $E27B,X             ; [7E 7B E2   ] Rotate Right Absolute,X
    JSR $5320               ; [20 20 53   ] Jump to Subroutine
    STA $C410               ; [8D 10 C4   ] Store A to Absolute
    INC $71                 ; [E6 71      ] Increment DP
    BRA $9F7F               ; [80 C5      ] Branch Always

;--- End of patch ---