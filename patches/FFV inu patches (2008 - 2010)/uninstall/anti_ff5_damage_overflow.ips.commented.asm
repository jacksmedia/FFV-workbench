;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_damage_overflow.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_damage_overflow.ips
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

    BEQ $9403               ; [F0 02      ] Branch if Equal
    BCS $940A               ; [B0 07      ] Branch if Carry Set
    TDC                     ; [7B         ] Transfer Direct Page to A
    STA $7B69               ; [8D 69 7B   ] Store A to Absolute
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    RTS                     ; [60         ] Return from Subroutine
    STA $2A                 ; [85 2A      ] Store A to DP
    LDA $52                 ; [A5 52      ] Load A from DP
    BNE $9411               ; [D0 01      ] Branch if Not Equal
    INC                     ; [1A         ] Increment Accumulator
    STA $2C                 ; [85 2C      ] Store A to DP
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    JSR $00D2               ; [20 D2 00   ] Jump to Subroutine

;--- End of patch ---