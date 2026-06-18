;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_react_against_reflect.ips.commented.asm
;    Disassembled from IPS patch: ff5_react_against_reflect.ips
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

;--- Patch at file offset $023614 (SNES $C23614) ---
org $C23614

    PHP                     ; [08         ] Push Processor Status
    LDA $3BD1               ; [AD D1 3B   ] Load A from Absolute
    BNE $3620               ; [D0 06      ] Branch if Not Equal
    INC $4750               ; [EE 50 47   ] Increment Absolute
    LDA $3BCF               ; [AD CF 3B   ] Load A from Absolute
    STA $474F               ; [8D 4F 47   ] Store A to Absolute
    BNE $3630               ; [D0 0B      ] Branch if Not Equal
    LDA $3BD1               ; [AD D1 3B   ] Load A from Absolute
    BEQ $3630               ; [F0 06      ] Branch if Equal
    STA $474F               ; [8D 4F 47   ] Store A to Absolute
    db $EE                      ; Incomplete/data bytes

;--- Patch at file offset $023642 (SNES $C23642) ---
org $C23642

    PHP                     ; [08         ] Push Processor Status
    LDA $3BD8               ; [AD D8 3B   ] Load A from Absolute
    BNE $364E               ; [D0 06      ] Branch if Not Equal
    INC $4752               ; [EE 52 47   ] Increment Absolute
    LDA $3BD6               ; [AD D6 3B   ] Load A from Absolute
    STA $4751               ; [8D 51 47   ] Store A to Absolute
    BNE $365E               ; [D0 0B      ] Branch if Not Equal
    LDA $3BD8               ; [AD D8 3B   ] Load A from Absolute
    BEQ $365E               ; [F0 06      ] Branch if Equal
    STA $4751               ; [8D 51 47   ] Store A to Absolute
    db $EE                      ; Incomplete/data bytes

;--- End of patch ---