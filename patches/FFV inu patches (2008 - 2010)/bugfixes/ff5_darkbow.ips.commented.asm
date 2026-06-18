;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_darkbow.ips.commented.asm
;    Disassembled from IPS patch: ff5_darkbow.ips
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

;--- Patch at file offset $028C16 (SNES $C28C16) ---
org $C28C16

    LDA $56                 ; [A5 56      ] Load A from DP
    BNE $8C1F               ; [D0 05      ] Branch if Not Equal
    BRA $8C1D               ; [80 01      ] Branch Always
    NOP                     ; [EA         ] No Operation

;--- End of patch ---