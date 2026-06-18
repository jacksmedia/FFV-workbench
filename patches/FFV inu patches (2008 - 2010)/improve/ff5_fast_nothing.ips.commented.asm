;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_fast_nothing.ips.commented.asm
;    Disassembled from IPS patch: ff5_fast_nothing.ips
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

;--- Patch at file offset $01B69C (SNES $C1B69C) ---
org $C1B69C

    CPX #$AA                ; [E0 AA      ] Compare X Immediate
    BRK                     ; [00 F0      ] Software interrupt
    ASL                     ; [0A         ] Shift Left Accumulator
    CPX #$AC                ; [E0 AC      ] Compare X Immediate
    BRK                     ; [00 F0      ] Software interrupt
    ORA $E0                 ; [05 E0      ] OR A with Direct Page
    INC $D000               ; [EE 00 D0   ] Increment Absolute
    ORA ($60,X)             ; [01 60      ] OR A with (DP,X)

;--- End of patch ---