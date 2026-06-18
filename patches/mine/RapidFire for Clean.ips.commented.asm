;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; RapidFire for Clean.ips.commented.asm
;    Disassembled from IPS patch: RapidFire for Clean.ips
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

;--- Patch at file offset $2011F1 (SNES $E011F1) ---
org $E011F1

    ADC ($7A),Y             ; [71 7A      ] Add with Carry (DP),Y
    CMP ($7D,S),Y           ; [D3 7D      ] Compare A with (SR),Y
    ADC $AF                 ; [65 AF      ] Add with Carry DP
    db $7E                      ; Incomplete/data bytes

;--- End of patch ---