;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_golem.ips.commented.asm
;    Disassembled from IPS patch: ff5_golem.ips
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

;--- Patch at file offset $026690 (SNES $C26690) ---
org $C26690

    BIT $AA7B               ; [2C 7B AA   ] Test Bits Absolute
    LDA $7B2D,X             ; [BD 2D 7B   ] Load A from Absolute,X
    CMP #$01                ; [C9 01      ] Compare A Immediate

;--- Patch at file offset $02669B (SNES $C2669B) ---
org $C2669B

    db $02                      ; Incomplete/data bytes

;--- End of patch ---