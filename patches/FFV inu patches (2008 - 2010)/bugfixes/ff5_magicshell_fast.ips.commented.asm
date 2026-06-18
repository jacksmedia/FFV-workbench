;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_magicshell_fast.ips.commented.asm
;    Disassembled from IPS patch: ff5_magicshell_fast.ips
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

;--- Patch at file offset $0238C2 (SNES $C238C2) ---
org $C238C2

    LDA $3B,S               ; [A3 3B      ] Load A from Stack Relative
    JMP $3680               ; [4C 80 36   ] Jump Absolute
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $201B,X             ; [BD 1B 20   ] Load A from Absolute,X
    ORA $2071,X             ; [1D 71 20   ] OR A with Absolute,X
    AND #$04                ; [29 04      ] AND A with Immediate
    BNE $38EC               ; [D0 19      ] Branch if Not Equal
    LDA $7BE6               ; [AD E6 7B   ] Load A from Absolute
    AND #$40                ; [29 40      ] AND A with Immediate
    BNE $38EC               ; [D0 12      ] Branch if Not Equal
    LDA $201A,X             ; [BD 1A 20   ] Load A from Absolute,X
    ORA $2070,X             ; [1D 70 20   ] OR A with Absolute,X
    AND #$20                ; [29 20      ] AND A with Immediate
    BNE $38EC               ; [D0 08      ] Branch if Not Equal
    LDA $201C,X             ; [BD 1C 20   ] Load A from Absolute,X
    ORA #$20                ; [09 20      ] OR A with Immediate
    STA $201C,X             ; [9D 1C 20   ] Store A to Absolute,X
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $023B7E (SNES $C23B7E) ---
org $C23B7E

    LDA $3B,S               ; [A3 3B      ] Load A from Stack Relative
    JMP $3951               ; [4C 51 39   ] Jump Absolute
    LDA #$20                ; [A9 20      ] Load A Immediate
    STA $41D4               ; [8D D4 41   ] Store A to Absolute
    LDA #$2C                ; [A9 2C      ] Load A Immediate
    STA $41D5               ; [8D D5 41   ] Store A to Absolute
    LDA #$7C                ; [A9 7C      ] Load A Immediate
    STA $41D8               ; [8D D8 41   ] Store A to Absolute
    LDA $4755               ; [AD 55 47   ] Load A from Absolute
    STA $47                 ; [85 47      ] Store A to DP
    TAX                     ; [AA         ] Transfer A to X
    TDC                     ; [7B         ] Transfer Direct Page to A
    JSR $01D6               ; [20 D6 01   ] Jump to Subroutine
    STA $41D7               ; [8D D7 41   ] Store A to Absolute
    STZ $41D6               ; [9C D6 41   ] Store Zero to Absolute
    RTS                     ; [60         ] Return from Subroutine
    JSR $3B83               ; [20 83 3B   ] Jump to Subroutine
    JMP $38C7               ; [4C C7 38   ] Jump Absolute
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- End of patch ---