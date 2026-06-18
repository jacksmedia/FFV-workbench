;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_old.ips.commented.asm
;    Disassembled from IPS patch: ff5_old.ips
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

    LDX $3ECE               ; [AE CE 3E   ] Load X from Absolute
    LDA $3EB7,X             ; [BD B7 3E   ] Load A from Absolute,X
    LDX $32                 ; [A6 32      ] Load X from DP
    CMP #$04                ; [C9 04      ] Compare A Immediate
    BCC $228D               ; [90 12      ] Branch if Carry Clear
    LDA $2002,X             ; [BD 02 20   ] Load A from Absolute,X
    CMP #$02                ; [C9 02      ] Compare A Immediate
    BCC $2285               ; [90 03      ] Branch if Carry Clear
    DEC $2002,X             ; [DE 02 20   ] Decrement Absolute,X
    LDA $2044,X             ; [BD 44 20   ] Load A from Absolute,X
    BEQ $228D               ; [F0 03      ] Branch if Equal
    DEC $2044,X             ; [DE 44 20   ] Decrement Absolute,X
    LDA #$04                ; [A9 04      ] Load A Immediate
    STA $0E                 ; [85 0E      ] Store A to DP
    LDA $2024,X             ; [BD 24 20   ] Load A from Absolute,X
    CMP #$02                ; [C9 02      ] Compare A Immediate
    BCC $229B               ; [90 03      ] Branch if Carry Clear
    DEC $2024,X             ; [DE 24 20   ] Decrement Absolute,X
    LDA $2028,X             ; [BD 28 20   ] Load A from Absolute,X
    CMP #$02                ; [C9 02      ] Compare A Immediate
    BCC $22A5               ; [90 03      ] Branch if Carry Clear
    DEC $2028,X             ; [DE 28 20   ] Decrement Absolute,X
    INX                     ; [E8         ] Increment X
    DEC $0E                 ; [C6 0E      ] Decrement DP
    BNE $2291               ; [D0 E7      ] Branch if Not Equal
    RTS                     ; [60         ] Return from Subroutine

;--- End of patch ---