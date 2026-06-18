;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_giantdrink_enemy.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_giantdrink_enemy.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 3 record(s)

;--- Patch at file offset $0273F5 (SNES $C273F5) ---
org $C273F5

    db $0E                      ; Incomplete/data bytes

;--- Patch at file offset $029163 (SNES $C29163) ---
org $C29163

    LDA $48                 ; [A5 48      ] Load A from DP
    CMP #$04                ; [C9 04      ] Compare A Immediate
    BCC $916C               ; [90 03      ] Branch if Carry Clear
    INC $56                 ; [E6 56      ] Increment DP
    RTS                     ; [60         ] Return from Subroutine
    ASL                     ; [0A         ] Shift Left Accumulator
    TAY                     ; [A8         ] Transfer A to Y
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDX $49                 ; [A6 49      ] Load X from DP
    LDA $2008,X             ; [BD 08 20   ] Load A from Absolute,X
    STA $7C11,Y             ; [99 11 7C   ] Store A to Absolute,Y
    ASL                     ; [0A         ] Shift Left Accumulator
    CMP #$0F                ; [C9 0F      ] Compare A Immediate
    AND [$90]               ; [27 90      ] AND A with [DP]
    ORA $A9,S               ; [03 A9      ] OR A with Stack Relative
    db $0F, $27                 ; Incomplete/data bytes

;--- Patch at file offset $029188 (SNES $C29188) ---
org $C29188

    CMP #$0F                ; [C9 0F      ] Compare A Immediate
    AND [$90]               ; [27 90      ] AND A with [DP]
    ORA $A9,S               ; [03 A9      ] OR A with Stack Relative
    db $0F, $27                 ; Incomplete/data bytes

;--- End of patch ---