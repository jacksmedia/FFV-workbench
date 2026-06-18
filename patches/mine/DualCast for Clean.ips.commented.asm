;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; DualCast for Clean.ips.commented.asm
;    Disassembled from IPS patch: DualCast for Clean.ips
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

;--- Patch at file offset $201364 (SNES $E01364) ---
org $E01364

    ADC $8E,S               ; [63 8E      ] Add with Carry Stack Relative
    PEI ($62)               ; [D4 62      ] Push Effective Indirect
    PLY                     ; [7A         ] Pull Y Register
    db $8C, $8D                 ; Incomplete/data bytes

;--- End of patch ---