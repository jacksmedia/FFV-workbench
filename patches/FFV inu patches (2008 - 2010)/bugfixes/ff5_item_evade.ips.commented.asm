;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_item_evade.ips.commented.asm
;    Disassembled from IPS patch: ff5_item_evade.ips
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

;--- Patch at file offset $029BC2 (SNES $C29BC2) ---
org $C29BC2

    CLC                     ; [18         ] Clear Carry Flag
    LDA $404F,Y             ; [B9 4F 40   ] Load A from Absolute,Y
    ADC $405B,Y             ; [79 5B 40   ] Add with Carry Absolute,Y
    ADC $4067,Y             ; [79 67 40   ] Add with Carry Absolute,Y
    db $79                      ; Incomplete/data bytes

;--- End of patch ---