;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_powerdrink.ips.commented.asm
;    Disassembled from IPS patch: ff5_powerdrink.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 3 record(s)

;--- Patch at file offset $0283BF (SNES $C283BF) ---
org $C283BF

    JSR $85D7               ; [20 D7 85   ] Jump to Subroutine

;--- Patch at file offset $0285C2 (SNES $C285C2) ---
org $C285C2

    ORA $4C,S               ; [03 4C      ] OR A with Stack Relative
    EOR ($82,X)             ; [41 82      ] XOR A with (DP,X)
    JMP $8018               ; [4C 18 80   ] Jump Absolute
    LDA $408C,Y             ; [B9 8C 40   ] Load A from Absolute,Y
    ADC $4098,Y             ; [79 98 40   ] Add with Carry Absolute,Y
    BCC $85D3               ; [90 02      ] Branch if Carry Clear
    LDA #$FF                ; [A9 FF      ] Load A Immediate
    STA $2044,X             ; [9D 44 20   ] Store A to Absolute,X
    RTS                     ; [60         ] Return from Subroutine
    LDX $32                 ; [A6 32      ] Load X from DP
    LDA $2045,X             ; [BD 45 20   ] Load A from Absolute,X
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    CLC                     ; [18         ] Clear Carry Flag
    ADC $50                 ; [65 50      ] Add with Carry DP
    STA $50                 ; [85 50      ] Store A to DP
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $201F,X             ; [BD 1F 20   ] Load A from Absolute,X
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $029BA3 (SNES $C29BA3) ---
org $C29BA3

    LDA $7B7D               ; [AD 7D 7B   ] Load A from Absolute
    BNE $9BAB               ; [D0 03      ] Branch if Not Equal
    STZ $2045,X             ; [9E 45 20   ] Store Zero to Absolute,X
    CLC                     ; [18         ] Clear Carry Flag
    JSR $85C9               ; [20 C9 85   ] Jump to Subroutine

;--- End of patch ---