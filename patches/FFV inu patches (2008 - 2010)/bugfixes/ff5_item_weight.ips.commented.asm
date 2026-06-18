;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_item_weight.ips.commented.asm
;    Disassembled from IPS patch: ff5_item_weight.ips
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

;--- Patch at file offset $029BAF (SNES $C29BAF) ---
org $C29BAF

    CLC                     ; [18         ] Clear Carry Flag
    LDA $404A,Y             ; [B9 4A 40   ] Load A from Absolute,Y
    ADC $4056,Y             ; [79 56 40   ] Add with Carry Absolute,Y
    ADC $4062,Y             ; [79 62 40   ] Add with Carry Absolute,Y
    ADC $406E,Y             ; [79 6E 40   ] Add with Carry Absolute,Y
    ADC $407A,Y             ; [79 7A 40   ] Add with Carry Absolute,Y
    STA $2023,X             ; [9D 23 20   ] Store A to Absolute,X

;--- End of patch ---