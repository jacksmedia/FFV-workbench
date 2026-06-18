;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_react_against_reflect.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_react_against_reflect.ips
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

    ORA $EE,S               ; [03 EE      ] OR A with Stack Relative
    BVC $365F               ; [50 47      ] Branch if Overflow Clear
    LDA $3BCF               ; [AD CF 3B   ] Load A from Absolute
    STA $474F               ; [8D 4F 47   ] Store A to Absolute
    BNE $3630               ; [D0 10      ] Branch if Not Equal
    LDA $3BD1               ; [AD D1 3B   ] Load A from Absolute
    BEQ $3630               ; [F0 0B      ] Branch if Equal
    STA $474F               ; [8D 4F 47   ] Store A to Absolute
    LDA $4750               ; [AD 50 47   ] Load A from Absolute
    EOR #$01                ; [49 01      ] XOR A with Immediate
    db $8D                      ; Incomplete/data bytes

;--- Patch at file offset $023642 (SNES $C23642) ---
org $C23642

    ORA $EE,S               ; [03 EE      ] OR A with Stack Relative
    EOR ($47)               ; [52 47      ] XOR A with (DP)
    LDA $3BD6               ; [AD D6 3B   ] Load A from Absolute
    STA $4751               ; [8D 51 47   ] Store A to Absolute
    BNE $365E               ; [D0 10      ] Branch if Not Equal
    LDA $3BD8               ; [AD D8 3B   ] Load A from Absolute
    BEQ $365E               ; [F0 0B      ] Branch if Equal
    STA $4751               ; [8D 51 47   ] Store A to Absolute
    LDA $4752               ; [AD 52 47   ] Load A from Absolute
    EOR #$01                ; [49 01      ] XOR A with Immediate
    db $8D                      ; Incomplete/data bytes

;--- End of patch ---