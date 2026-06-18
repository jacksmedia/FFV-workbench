;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_old.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_old.ips
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

;--- Patch at file offset $02226F (SNES $C2226F) ---
org $C2226F

    LDX $32                 ; [A6 32      ] Load X from DP
    STZ $0E                 ; [64 0E      ] Store Zero to DP
    LDA $2024,X             ; [BD 24 20   ] Load A from Absolute,X
    DEC                     ; [3A         ] Decrement Accumulator
    BEQ $227C               ; [F0 03      ] Branch if Equal
    STA $2024,X             ; [9D 24 20   ] Store A to Absolute,X
    LDA $2028,X             ; [BD 28 20   ] Load A from Absolute,X
    DEC                     ; [3A         ] Decrement Accumulator
    BEQ $2285               ; [F0 03      ] Branch if Equal
    STA $2028,X             ; [9D 28 20   ] Store A to Absolute,X
    INX                     ; [E8         ] Increment X
    INC $0E                 ; [E6 0E      ] Increment DP
    LDA $0E                 ; [A5 0E      ] Load A from DP
    CMP #$04                ; [C9 04      ] Compare A Immediate
    BNE $2273               ; [D0 E5      ] Branch if Not Equal
    LDX $3ECE               ; [AE CE 3E   ] Load X from Absolute
    LDA $3EB7,X             ; [BD B7 3E   ] Load A from Absolute,X
    CMP #$04                ; [C9 04      ] Compare A Immediate
    BCC $22AC               ; [90 14      ] Branch if Carry Clear
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $2002,X             ; [BD 02 20   ] Load A from Absolute,X
    DEC                     ; [3A         ] Decrement Accumulator
    BEQ $22A3               ; [F0 03      ] Branch if Equal
    STA $2002,X             ; [9D 02 20   ] Store A to Absolute,X
    LDA $2044,X             ; [BD 44 20   ] Load A from Absolute,X
    DEC                     ; [3A         ] Decrement Accumulator
    BPL $22AC               ; [10 03      ] Branch if Plus
    db $9D, $44                 ; Incomplete/data bytes

;--- End of patch ---