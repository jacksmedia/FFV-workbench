;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_powerdrink.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_powerdrink.ips
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

    LDA $201F,X             ; [BD 1F 20   ] Load A from Absolute,X

;--- Patch at file offset $0285C2 (SNES $C285C2) ---
org $C285C2

    PHP                     ; [08         ] Push Processor Status
    LDA $2062,X             ; [BD 62 20   ] Load A from Absolute,X
    TAX                     ; [AA         ] Transfer A to X
    STX $52                 ; [86 52      ] Store X to DP
    BRA $85E8               ; [80 1D      ] Branch Always
    LDA $7BE5               ; [AD E5 7B   ] Load A from Absolute
    STA $24                 ; [85 24      ] Store A to DP
    LDA $7BE1               ; [AD E1 7B   ] Load A from Absolute
    STA $25                 ; [85 25      ] Store A to DP
    JSR $00F1               ; [20 F1 00   ] Jump to Subroutine
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $26                 ; [A5 26      ] Load A from DP
    JSR $01BB               ; [20 BB 01   ] Jump to Subroutine
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$02                ; [69 02      ] Add with Carry Immediate
    BRK                     ; [00 85      ] Software interrupt
    EOR ($7B)               ; [52 7B      ] XOR A with (DP)
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDX $49                 ; [A6 49      ] Load X from DP

;--- Patch at file offset $029BA3 (SNES $C29BA3) ---
org $C29BA3

    JSR $559E               ; [20 9E 55   ] Jump to Subroutine
    JSR $7A9E               ; [20 9E 7A   ] Jump to Subroutine
    JSR $86B9               ; [20 B9 86   ] Jump to Subroutine
    RTI                     ; [40         ] Return from Interrupt
    db $9D, $6C                 ; Incomplete/data bytes

;--- End of patch ---