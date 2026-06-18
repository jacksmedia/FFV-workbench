;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_reapply_item_immunity.ips.commented.asm
;    Disassembled from IPS patch: ff5_reapply_item_immunity.ips
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

;--- Patch at file offset $025208 (SNES $C25208) ---
org $C25208

    STZ $2035,X             ; [9E 35 20   ] Store Zero to Absolute,X
    STZ $2036,X             ; [9E 36 20   ] Store Zero to Absolute,X
    STZ $2037,X             ; [9E 37 20   ] Store Zero to Absolute,X

;--- End of patch ---