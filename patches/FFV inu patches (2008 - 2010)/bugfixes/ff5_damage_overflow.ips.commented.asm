;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_damage_overflow.ips.commented.asm
;    Disassembled from IPS patch: ff5_damage_overflow.ips
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

;--- Patch at file offset $0293FF (SNES $C293FF) ---
org $C293FF

    STA $2A                 ; [85 2A      ] Store A to DP
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    BCC $9423               ; [90 1C      ] Branch if Carry Clear
    LDX $2A                 ; [A6 2A      ] Load X from DP
    BEQ $9423               ; [F0 18      ] Branch if Equal
    LDX $52                 ; [A6 52      ] Load X from DP
    BNE $9410               ; [D0 01      ] Branch if Not Equal
    INX                     ; [E8         ] Increment X
    STX $2C                 ; [86 2C      ] Store X to DP
    JSR $00D2               ; [20 D2 00   ] Jump to Subroutine
    LDX $30                 ; [A6 30      ] Load X from DP
    BNE $9420               ; [D0 07      ] Branch if Not Equal

;--- End of patch ---