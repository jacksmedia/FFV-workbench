;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_lv5_death.ips.commented.asm
;    Disassembled from IPS patch: ff5_lv5_death.ips
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

;--- Patch at file offset $02727C (SNES $C2727C) ---
org $C2727C

    ORA $4C,S               ; [03 4C      ] OR A with Stack Relative
    ORA ($6B),Y             ; [11 6B      ] OR A with (DP),Y
    LDA $2066,X             ; [BD 66 20   ] Load A from Absolute,X
    AND #$20                ; [29 20      ] AND A with Immediate
    BNE $728A               ; [D0 03      ] Branch if Not Equal
    JMP $902B               ; [4C 2B 90   ] Jump Absolute
    INC $56                 ; [E6 56      ] Increment DP

;--- End of patch ---