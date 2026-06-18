;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_specialty.ips.commented.asm
;    Disassembled from IPS patch: ff5_specialty.ips
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
    PHX                     ; [DA         ] Push X Register
    LDA $206E,X             ; [BD 6E 20   ] Load A from Absolute,X
    AND #$20                ; [29 20      ] AND A with Immediate
    BEQ $8C3F               ; [F0 04      ] Branch if Equal
    LDA #$04                ; [A9 04      ] Load A Immediate
    STA $59                 ; [85 59      ] Store A to DP
    LDA $206E,X             ; [BD 6E 20   ] Load A from Absolute,X
    AND #$10                ; [29 10      ] AND A with Immediate
    BEQ $8C4A               ; [F0 04      ] Branch if Equal
    LDA #$01                ; [A9 01      ] Load A Immediate
    TSB $59                 ; [04 59      ] Test and Set Bits in DP
    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $3ED7               ; [8D D7 3E   ] Store A to Absolute
    JSR $8CAC               ; [20 AC 8C   ] Jump to Subroutine
    STZ $59                 ; [64 59      ] Store Zero to DP
    PLX                     ; [FA         ] Pull X Register
    PHX                     ; [DA         ] Push X Register
    LDA $206E,X             ; [BD 6E 20   ] Load A from Absolute,X
    AND #$40                ; [29 40      ] AND A with Immediate
    BEQ $8C61               ; [F0 04      ] Branch if Equal
    LDA #$80                ; [A9 80      ] Load A Immediate
    STA $59                 ; [85 59      ] Store A to DP
    LDA $206E,X             ; [BD 6E 20   ] Load A from Absolute,X
    AND #$08                ; [29 08      ] AND A with Immediate
    BEQ $8C6C               ; [F0 04      ] Branch if Equal
    LDA #$20                ; [A9 20      ] Load A Immediate
    TSB $59                 ; [04 59      ] Test and Set Bits in DP
    LDA $206E,X             ; [BD 6E 20   ] Load A from Absolute,X
    AND #$04                ; [29 04      ] AND A with Immediate
    BEQ $8C82               ; [F0 0F      ] Branch if Equal
    PHX                     ; [DA         ] Push X Register
    LDX $49                 ; [A6 49      ] Load X from DP
    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    PLX                     ; [FA         ] Pull X Register
    AND #$20                ; [29 20      ] AND A with Immediate
    BNE $8C82               ; [D0 04      ] Branch if Not Equal
    LDA #$10                ; [A9 10      ] Load A Immediate
    TSB $59                 ; [04 59      ] Test and Set Bits in DP
    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $3ED7               ; [8D D7 3E   ] Store A to Absolute
    JSR $8D2E               ; [20 2E 8D   ] Jump to Subroutine
    STZ $59                 ; [64 59      ] Store Zero to DP
    PLX                     ; [FA         ] Pull X Register
    PHX                     ; [DA         ] Push X Register
    LDA $206E,X             ; [BD 6E 20   ] Load A from Absolute,X
    AND #$02                ; [29 02      ] AND A with Immediate
    BEQ $8CA1               ; [F0 0C      ] Branch if Equal
    LDA #$08                ; [A9 08      ] Load A Immediate
    STA $59                 ; [85 59      ] Store A to DP
    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $3ED7               ; [8D D7 3E   ] Store A to Absolute
    JSR $8E05               ; [20 05 8E   ] Jump to Subroutine
    PLX                     ; [FA         ] Pull X Register
    STX $32                 ; [86 32      ] Store X to DP
    STZ $3ED7               ; [9C D7 3E   ] Store Zero to Absolute
    STZ $56                 ; [64 56      ] Store Zero to DP
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- End of patch ---