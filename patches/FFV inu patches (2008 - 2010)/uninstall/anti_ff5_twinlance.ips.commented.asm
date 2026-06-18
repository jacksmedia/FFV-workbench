;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_twinlance.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_twinlance.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 4 record(s)

;--- Patch at file offset $021535 (SNES $C21535) ---
org $C21535

    LDX $0E                 ; [A6 0E      ] Load X from DP
    LDA $408D,X             ; [BD 8D 40   ] Load A from Absolute,X
    PHA                     ; [48         ] Push Accumulator
    LDA $79FA               ; [AD FA 79   ] Load A from Absolute
    TAX                     ; [AA         ] Transfer A to X
    PLA                     ; [68         ] Pull Accumulator
    STA $7B2D,X             ; [9D 2D 7B   ] Store A to Absolute,X
    STZ $7B1C,X             ; [9E 1C 7B   ] Store Zero to Absolute,X
    STZ $7ACC,X             ; [9E CC 7A   ] Store Zero to Absolute,X
    LDA $79FA               ; [AD FA 79   ] Load A from Absolute
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    LDA $2720               ; [AD 20 27   ] Load A from Absolute
    STA $7ADC,X             ; [9D DC 7A   ] Store A to Absolute,X
    LDA $2721               ; [AD 21 27   ] Load A from Absolute
    STA $7ADD,X             ; [9D DD 7A   ] Store A to Absolute,X
    INC $79FA               ; [EE FA 79   ] Increment Absolute
    JSR $98E3               ; [20 E3 98   ] Jump to Subroutine
    JSR $9923               ; [20 23 99   ] Jump to Subroutine
    STY $14                 ; [84 14      ] Store Y to DP
    STZ $12                 ; [64 12      ] Store Zero to DP
    LDX $0E                 ; [A6 0E      ] Load X from DP
    LDA $408A,X             ; [BD 8A 40   ] Load A from Absolute,X
    AND #$02                ; [29 02      ] AND A with Immediate
    BEQ $15C9               ; [F0 59      ] Branch if Equal
    LDA $4090,X             ; [BD 90 40   ] Load A from Absolute,X
    CMP #$55                ; [C9 55      ] Compare A Immediate
    db $D0                      ; Incomplete/data bytes

;--- Patch at file offset $021589 (SNES $C21589) ---
org $C21589

    db $8D                      ; Incomplete/data bytes

;--- Patch at file offset $024926 (SNES $C24926) ---
org $C24926

    BPL $4959               ; [10 31      ] Branch if Plus
    LDA $3BCF               ; [AD CF 3B   ] Load A from Absolute
    ORA $3BD6               ; [0D D6 3B   ] OR A with Absolute
    BEQ $4936               ; [F0 06      ] Branch if Equal
    LDA $3BCE               ; [AD CE 3B   ] Load A from Absolute
    STA $3BCF               ; [8D CF 3B   ] Store A to Absolute
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    LDA $3BDA,X             ; [BD DA 3B   ] Load A from Absolute,X
    db $9D                      ; Incomplete/data bytes

;--- Patch at file offset $02494A (SNES $C2494A) ---
org $C2494A

    TRB $D6AD               ; [1C AD D6   ] Test and Reset Bits Absolute
    TSC                     ; [3B         ] Transfer Stack Pointer to A
    ORA $3BDD               ; [0D DD 3B   ] OR A with Absolute
    BEQ $4959               ; [F0 06      ] Branch if Equal
    LDA $3BD5               ; [AD D5 3B   ] Load A from Absolute
    STA $3BD6               ; [8D D6 3B   ] Store A to Absolute
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    LDA $3BE1,X             ; [BD E1 3B   ] Load A from Absolute,X
    STA $3BDA,X             ; [9D DA 3B   ] Store A to Absolute,X
    INX                     ; [E8         ] Increment X
    db $E0                      ; Incomplete/data bytes

;--- End of patch ---