;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_golem.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_golem.ips
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

    EOR [$47]               ; [47 47      ] XOR A with [DP]
    CMP #$80                ; [C9 80      ] Compare A Immediate
    BEQ $669E               ; [F0 08      ] Branch if Equal
    CMP #$DE                ; [C9 DE      ] Compare A Immediate

;--- Patch at file offset $02669B (SNES $C2669B) ---
org $C2669B

    db $81                      ; Incomplete/data bytes

;--- End of patch ---