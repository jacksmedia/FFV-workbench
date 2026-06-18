;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_uptempo_freeze.ips.commented.asm
;    Disassembled from IPS patch: ff5_uptempo_freeze.ips
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

    LDY $7C95               ; [AC 95 7C   ] Load Y from Absolute
    BEQ $1713               ; [F0 F3      ] Branch if Equal
    DEY                     ; [88         ] Decrement Y
    STY $7C95               ; [8C 95 7C   ] Store Y to Absolute
    LDA $DBB3               ; [AD B3 DB   ] Load A from Absolute
    BNE $176A               ; [D0 41      ] Branch if Not Equal
    LDX #$07                ; [A2 07      ] Load X Immediate
    BRK                     ; [00 EA      ] Software interrupt
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $01172E (SNES $C1172E) ---
org $C1172E

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $011734 (SNES $C11734) ---
org $C11734

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $01173A (SNES $C1173A) ---
org $C1173A

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $011740 (SNES $C11740) ---
org $C11740

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $011746 (SNES $C11746) ---
org $C11746

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $01174C (SNES $C1174C) ---
org $C1174C

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $011752 (SNES $C11752) ---
org $C11752

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $011758 (SNES $C11758) ---
org $C11758

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- End of patch ---