;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_item_stat_bonus.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_item_stat_bonus.ips
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

;--- Patch at file offset $029B10 (SNES $C29B10) ---
org $C29B10

    PHA                     ; [48         ] Push Accumulator
    AND #$07                ; [29 07      ] AND A with Immediate
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    LDA $D12880,X           ; [BF 80 28 D1] Load A from Absolute Long,X
    STA $14                 ; [85 14      ] Store A to DP
    LDA $D12881,X           ; [BF 81 28 D1] Load A from Absolute Long,X
    STA $16                 ; [85 16      ] Store A to DP
    PLA                     ; [68         ] Pull Accumulator
    ASL                     ; [0A         ] Shift Left Accumulator
    STA $19                 ; [85 19      ] Store A to DP
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    STZ $15                 ; [64 15      ] Store Zero to DP
    STZ $17                 ; [64 17      ] Store Zero to DP
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    ASL $18                 ; [06 18      ] Shift Left DP
    BCS $9B35               ; [B0 04      ] Branch if Carry Set
    LDA $14                 ; [A5 14      ] Load A from DP
    BRA $9B37               ; [80 02      ] Branch Always
    LDA $16                 ; [A5 16      ] Load A from DP

;--- Patch at file offset $029B44 (SNES $C29B44) ---
org $C29B44

    INX                     ; [E8         ] Increment X

;--- End of patch ---