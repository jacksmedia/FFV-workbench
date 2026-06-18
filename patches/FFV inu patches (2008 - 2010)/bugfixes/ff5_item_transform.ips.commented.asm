;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_item_transform.ips.commented.asm
;    Disassembled from IPS patch: ff5_item_transform.ips
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

    PHX                     ; [DA         ] Push X Register
    LDX #$0B                ; [A2 0B      ] Load X Immediate
    BRK                     ; [00 9E      ] Software interrupt
    PLB                     ; [AB         ] Pull Data Bank
    ROL $10CA,X             ; [3E CA 10   ] Rotate Left Absolute,X
    PLX                     ; [FA         ] Pull X Register
    PLX                     ; [FA         ] Pull X Register

;--- End of patch ---