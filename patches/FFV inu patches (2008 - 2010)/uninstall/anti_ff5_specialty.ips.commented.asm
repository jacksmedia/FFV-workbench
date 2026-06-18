;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_specialty.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_specialty.ips
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

;--- Patch at file offset $028C2F (SNES $C28C2F) ---
org $C28C2F

    STZ $59                 ; [64 59      ] Store Zero to DP
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $206E,X             ; [BD 6E 20   ] Load A from Absolute,X
    AND #$20                ; [29 20      ] AND A with Immediate
    BEQ $8C3E               ; [F0 04      ] Branch if Equal
    LDA #$04                ; [A9 04      ] Load A Immediate
    STA $59                 ; [85 59      ] Store A to DP
    LDA $206E,X             ; [BD 6E 20   ] Load A from Absolute,X
    AND #$10                ; [29 10      ] AND A with Immediate
    BEQ $8C4B               ; [F0 06      ] Branch if Equal
    LDA $59                 ; [A5 59      ] Load A from DP
    ORA #$01                ; [09 01      ] OR A with Immediate
    STA $59                 ; [85 59      ] Store A to DP
    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $3ED7               ; [8D D7 3E   ] Store A to Absolute
    JSR $8CAC               ; [20 AC 8C   ] Jump to Subroutine
    STZ $59                 ; [64 59      ] Store Zero to DP
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $206E,X             ; [BD 6E 20   ] Load A from Absolute,X
    AND #$40                ; [29 40      ] AND A with Immediate
    BEQ $8C62               ; [F0 04      ] Branch if Equal
    LDA #$80                ; [A9 80      ] Load A Immediate
    STA $59                 ; [85 59      ] Store A to DP
    LDA $206E,X             ; [BD 6E 20   ] Load A from Absolute,X
    AND #$08                ; [29 08      ] AND A with Immediate
    BEQ $8C6F               ; [F0 06      ] Branch if Equal
    LDA $59                 ; [A5 59      ] Load A from DP
    ORA #$20                ; [09 20      ] OR A with Immediate
    STA $59                 ; [85 59      ] Store A to DP
    LDA $206E,X             ; [BD 6E 20   ] Load A from Absolute,X
    AND #$04                ; [29 04      ] AND A with Immediate
    BEQ $8C87               ; [F0 11      ] Branch if Equal
    PHX                     ; [DA         ] Push X Register
    LDX $49                 ; [A6 49      ] Load X from DP
    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    PLX                     ; [FA         ] Pull X Register
    AND #$20                ; [29 20      ] AND A with Immediate
    BNE $8C87               ; [D0 06      ] Branch if Not Equal
    LDA $59                 ; [A5 59      ] Load A from DP
    ORA #$10                ; [09 10      ] OR A with Immediate
    STA $59                 ; [85 59      ] Store A to DP
    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $3ED7               ; [8D D7 3E   ] Store A to Absolute
    JSR $8D2E               ; [20 2E 8D   ] Jump to Subroutine
    STZ $59                 ; [64 59      ] Store Zero to DP
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $206E,X             ; [BD 6E 20   ] Load A from Absolute,X
    AND #$02                ; [29 02      ] AND A with Immediate
    BEQ $8CA6               ; [F0 0C      ] Branch if Equal
    LDA #$08                ; [A9 08      ] Load A Immediate
    STA $59                 ; [85 59      ] Store A to DP
    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $3ED7               ; [8D D7 3E   ] Store A to Absolute
    JSR $8E05               ; [20 05 8E   ] Jump to Subroutine
    STZ $3ED7               ; [9C D7 3E   ] Store Zero to Absolute
    STZ $56                 ; [64 56      ] Store Zero to DP
    RTS                     ; [60         ] Return from Subroutine

;--- End of patch ---