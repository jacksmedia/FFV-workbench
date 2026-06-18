;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_damage_overflow_mp.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_damage_overflow_mp.ips
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

;--- Patch at file offset $02898C (SNES $C2898C) ---
org $C2898C

    STA $2A                 ; [85 2A      ] Store A to DP
    LDA $52                 ; [A5 52      ] Load A from DP
    STA $2C                 ; [85 2C      ] Store A to DP
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    JSR $00D2               ; [20 D2 00   ] Jump to Subroutine
    LDX $49                 ; [A6 49      ] Load X from DP
    LDA $2065,X             ; [BD 65 20   ] Load A from Absolute,X
    AND #$01                ; [29 01      ] AND A with Immediate
    BNE $89A8               ; [D0 07      ] Branch if Not Equal
    LDA $2039,X             ; [BD 39 20   ] Load A from Absolute,X
    AND #$02                ; [29 02      ] AND A with Immediate
    BEQ $89C2               ; [F0 1A      ] Branch if Equal
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $2E                 ; [A5 2E      ] Load A from DP
    CMP $200A,X             ; [DD 0A 20   ] Compare A with Absolute,X
    BCC $89B8               ; [90 05      ] Branch if Carry Clear
    LDA $200A,X             ; [BD 0A 20   ] Load A from Absolute,X
    STA $2E                 ; [85 2E      ] Store A to DP
    LDA $2E                 ; [A5 2E      ] Load A from DP
    STA $7B75               ; [8D 75 7B   ] Store A to Absolute
    STA $7B77               ; [8D 77 7B   ] Store A to Absolute
    BRA $89DA               ; [80 18      ] Branch Always
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDX $49                 ; [A6 49      ] Load X from DP
    LDA $2E                 ; [A5 2E      ] Load A from DP
    CMP $200A,X             ; [DD 0A 20   ] Compare A with Absolute,X
    BCC $89D2               ; [90 05      ] Branch if Carry Clear
    LDA $200A,X             ; [BD 0A 20   ] Load A from Absolute,X
    STA $2E                 ; [85 2E      ] Store A to DP
    LDA $2E                 ; [A5 2E      ] Load A from DP

;--- End of patch ---