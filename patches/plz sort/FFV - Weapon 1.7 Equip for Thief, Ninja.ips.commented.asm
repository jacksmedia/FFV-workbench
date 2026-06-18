;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; FFV - Weapon 1.7 Equip for Thief, Ninja.ips.commented.asm
;    Disassembled from IPS patch: FFV - Weapon 1.7 Equip for Thief, Ninja.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 3 record(s)

;--- Patch at file offset $00FFDC (SNES $C0FFDC) ---
org $C0FFDC

    LDA $C1403E,X           ; [BF 3E 40 C1] Load A from Absolute Long,X

;--- Patch at file offset $115711 (SNES $D15711) ---
org $D15711

    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $115719 (SNES $D15719) ---
org $D15719

    db $80                      ; Incomplete/data bytes

;--- End of patch ---