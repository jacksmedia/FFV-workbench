;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_uptempo_freeze.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_uptempo_freeze.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 9 record(s)

;--- Patch at file offset $01171B (SNES $C1171B) ---
org $C1171B

    LDA $7C95               ; [AD 95 7C   ] Load A from Absolute
    ORA $7C96               ; [0D 96 7C   ] OR A with Absolute
    BEQ $1713               ; [F0 F0      ] Branch if Equal
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    DEC $7C95               ; [CE 95 7C   ] Decrement Absolute
    LDX #$07                ; [A2 07      ] Load X Immediate
    BRK                     ; [00 AD      ] Software interrupt
    STA $7C,X               ; [95 7C      ] Store A to DP,X

;--- Patch at file offset $01172E (SNES $C1172E) ---
org $C1172E

    db $C9                      ; Incomplete/data bytes

;--- Patch at file offset $011734 (SNES $C11734) ---
org $C11734

    db $C9                      ; Incomplete/data bytes

;--- Patch at file offset $01173A (SNES $C1173A) ---
org $C1173A

    db $C9                      ; Incomplete/data bytes

;--- Patch at file offset $011740 (SNES $C11740) ---
org $C11740

    db $C9                      ; Incomplete/data bytes

;--- Patch at file offset $011746 (SNES $C11746) ---
org $C11746

    db $C9                      ; Incomplete/data bytes

;--- Patch at file offset $01174C (SNES $C1174C) ---
org $C1174C

    db $C9                      ; Incomplete/data bytes

;--- Patch at file offset $011752 (SNES $C11752) ---
org $C11752

    db $C9                      ; Incomplete/data bytes

;--- Patch at file offset $011758 (SNES $C11758) ---
org $C11758

    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits

;--- End of patch ---