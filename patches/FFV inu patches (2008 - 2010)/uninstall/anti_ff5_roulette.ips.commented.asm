;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_roulette.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_roulette.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 6 record(s)

;--- Patch at file offset $014C76 (SNES $C14C76) ---
org $C14C76

    AND #$0F                ; [29 0F      ] AND A with Immediate
    STA $88                 ; [85 88      ] Store A to DP
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $DE                 ; [A5 DE      ] Load A from DP
    AND $DBE1               ; [2D E1 DB   ] AND A with Absolute
    AND $CEFFD5,X           ; [3F D5 FF CE] AND A with Absolute Long,X
    BNE $4C8E               ; [D0 05      ] Branch if Not Equal
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    BRA $4C73               ; [80 E5      ] Branch Always
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $88                 ; [A5 88      ] Load A from DP
    STA $D0C4               ; [8D C4 D0   ] Store A to Absolute

;--- Patch at file offset $014C9D (SNES $C14C9D) ---
org $C14C9D

    STA $88                 ; [85 88      ] Store A to DP
    INC $88                 ; [E6 88      ] Increment DP
    LDA $88                 ; [A5 88      ] Load A from DP
    AND #$0F                ; [29 0F      ] AND A with Immediate
    STA $88                 ; [85 88      ] Store A to DP
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $DE                 ; [A5 DE      ] Load A from DP
    AND $DBE1               ; [2D E1 DB   ] AND A with Absolute
    AND $CEFFD5,X           ; [3F D5 FF CE] AND A with Absolute Long,X
    BNE $4CBB               ; [D0 05      ] Branch if Not Equal
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    BRA $4C9F               ; [80 E4      ] Branch Always
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $88                 ; [A5 88      ] Load A from DP
    db $8D                      ; Incomplete/data bytes

;--- Patch at file offset $014D4D (SNES $C14D4D) ---
org $C14D4D

    LDA $D0C2               ; [AD C2 D0   ] Load A from Absolute

;--- Patch at file offset $014D9E (SNES $C14D9E) ---
org $C14D9E

    JSR $5494               ; [20 94 54   ] Jump to Subroutine
    JSR $FC96               ; [20 96 FC   ] Jump to Subroutine
    AND #$3F                ; [29 3F      ] AND A with Immediate
    CLC                     ; [18         ] Clear Carry Flag
    ADC #$20                ; [69 20      ] Add with Carry Immediate
    STA $DB47               ; [8D 47 DB   ] Store A to Absolute
    LDA #$13                ; [A9 13      ] Load A Immediate
    STA $CD3A               ; [8D 3A CD   ] Store A to Absolute
    BRA $4DB6               ; [80 03      ] Branch Always

;--- Patch at file offset $014DE4 (SNES $C14DE4) ---
org $C14DE4

    LDA $D0C2               ; [AD C2 D0   ] Load A from Absolute
    AND #$20                ; [29 20      ] AND A with Immediate
    BEQ $4E2D               ; [F0 42      ] Branch if Equal
    LDA $D0C2               ; [AD C2 D0   ] Load A from Absolute

;--- Patch at file offset $015160 (SNES $C15160) ---
org $C15160

    LDA $D0C2               ; [AD C2 D0   ] Load A from Absolute

;--- End of patch ---