;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_hp_leak_counter.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_hp_leak_counter.ips
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

;--- Patch at file offset $025885 (SNES $C25885) ---
org $C25885

    INC $7C53               ; [EE 53 7C   ] Increment Absolute
    LDA $7C53               ; [AD 53 7C   ] Load A from Absolute
    CMP #$04                ; [C9 04      ] Compare A Immediate
    BNE $5897               ; [D0 08      ] Branch if Not Equal
    STZ $7C53               ; [9C 53 7C   ] Store Zero to Absolute
    INC $7C54               ; [EE 54 7C   ] Increment Absolute
    BRA $589A               ; [80 03      ] Branch Always
    STZ $7C54               ; [9C 54 7C   ] Store Zero to Absolute
    LDA $474E               ; [AD 4E 47   ] Load A from Absolute
    BNE $58A5               ; [D0 06      ] Branch if Not Equal

;--- End of patch ---