;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_darkbow.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_darkbow.ips
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

;--- Patch at file offset $028C16 (SNES $C28C16) ---
org $C28C16

    LDX $49                 ; [A6 49      ] Load X from DP
    LDA $201A,X             ; [BD 1A 20   ] Load A from Absolute,X
    BPL $8C1F               ; [10 02      ] Branch if Plus

;--- End of patch ---