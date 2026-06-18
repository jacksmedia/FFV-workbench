;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_item_transform.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_item_transform.ips
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

;--- Patch at file offset $0224E4 (SNES $C224E4) ---
org $C224E4

    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    STZ $3EAB,X             ; [9E AB 3E   ] Store Zero to Absolute,X
    INX                     ; [E8         ] Increment X
    CPX #$0C                ; [E0 0C      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    db $F7                      ; Incomplete/data bytes

;--- End of patch ---