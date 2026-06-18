;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_magical_weapon.ips.commented.asm
;    Disassembled from IPS patch: ff5_magical_weapon.ips
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

;--- Patch at file offset $027CE6 (SNES $C27CE6) ---
org $C27CE6

    JSR $01BE               ; [20 BE 01   ] Jump to Subroutine
    ORA $0E                 ; [05 0E      ] OR A with Direct Page
    BEQ $7CFB               ; [F0 0E      ] Branch if Equal

;--- Patch at file offset $028389 (SNES $C28389) ---
org $C28389

    JSR $01BE               ; [20 BE 01   ] Jump to Subroutine
    ORA $0E                 ; [05 0E      ] OR A with Direct Page
    BEQ $839A               ; [F0 0A      ] Branch if Equal

;--- End of patch ---