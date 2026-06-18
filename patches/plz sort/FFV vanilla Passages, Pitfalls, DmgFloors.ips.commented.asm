;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; FFV vanilla Passages, Pitfalls, DmgFloors.ips.commented.asm
;    Disassembled from IPS patch: FFV vanilla Passages, Pitfalls, DmgFloors.ips
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

;--- Patch at file offset $00FFDC (SNES $C0FFDC) ---
org $C0FFDC

    BIT $D33F               ; [2C 3F D3   ] Test Bits Absolute
    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $1157B8 (SNES $D157B8) ---
org $D157B8

    ORA [$80]               ; [07 80      ] OR A with [DP]
    STA [$40]               ; [87 40      ] Store A to [DP]
    ORA $000704             ; [0F 04 07 00] OR A with Absolute Long
    ORA [$03]               ; [07 03      ] OR A with [DP]
    EOR [$00]               ; [47 00      ] XOR A with [DP]
    ORA [$08]               ; [07 08      ] OR A with [DP]
    ORA [$00]               ; [07 00      ] OR A with [DP]
    AND [$00]               ; [27 00      ] AND A with [DP]
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA [$00],Y             ; [17 00      ] OR A with [DP],Y
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA [$10]               ; [07 10      ] OR A with [DP]
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA [$00]               ; [07 00      ] OR A with [DP]
    ORA [$00]               ; [07 00      ] OR A with [DP]
    db $07                      ; Incomplete/data bytes

;--- End of patch ---