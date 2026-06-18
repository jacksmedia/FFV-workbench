;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_atomos_wormhole.ips.commented.asm
;    Disassembled from IPS patch: ff5_atomos_wormhole.ips
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

;--- Patch at file offset $02795D (SNES $C2795D) ---
org $C2795D

    CPX $BD9E               ; [EC 9E BD   ] Compare X with Absolute
    CMP ($4C),Y             ; [D1 4C      ] Compare A with (DP),Y
    ORA $8E                 ; [05 8E      ] OR A with Direct Page

;--- End of patch ---