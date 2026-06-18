;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; FFV RPGe without 'abc' in Naming Menu, by xJ4cks.ips.commented.asm
;    Disassembled from IPS patch: FFV RPGe without 'abc' in Naming Menu, by xJ4cks.ips
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

;--- Patch at file offset $03A9E7 (SNES $C3A9E7) ---
org $C3A9E7

    ORA $C0,S               ; [03 C0      ] OR A with Stack Relative
    ASL $0300               ; [0E 00 03   ] Shift Left Absolute
    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $03B609 (SNES $C3B609) ---
org $C3B609

    ORA [$01],Y             ; [17 01      ] OR A with [DP],Y
    PHP                     ; [08         ] Push Processor Status
    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    BVC $B610               ; [50 00      ] Branch if Overflow Clear
    INC                     ; [1A         ] Increment Accumulator
    ORA $00,S               ; [03 00      ] OR A with Stack Relative
    TSB $50                 ; [04 50      ] Test and Set Bits in DP
    BRK                     ; [00 1A      ] Software interrupt

;--- End of patch ---