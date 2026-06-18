;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_item_stat_bonus.ips.commented.asm
;    Disassembled from IPS patch: ff5_item_stat_bonus.ips
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

    STA $19                 ; [85 19      ] Store A to DP
    ASL $19                 ; [06 19      ] Shift Left DP
    AND #$07                ; [29 07      ] AND A with Immediate
    ASL                     ; [0A         ] Shift Left Accumulator
    TAX                     ; [AA         ] Transfer A to X
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $D12880,X           ; [BF 80 28 D1] Load A from Absolute Long,X
    STA $14                 ; [85 14      ] Store A to DP
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    LDA $14                 ; [A5 14      ] Load A from DP
    ASL $18                 ; [06 18      ] Shift Left DP
    BCC $9B29               ; [90 01      ] Branch if Carry Clear
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 C9      ] Software interrupt
    BRA $9B2F               ; [80 00      ] Branch Always
    BMI $9B34               ; [30 03      ] Branch if Minus
    ORA #$00                ; [09 00      ] OR A with Immediate
    SBC $EAEAEA,X           ; [FF EA EA EA] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $029B44 (SNES $C29B44) ---
org $C29B44

    db $DD                      ; Incomplete/data bytes

;--- End of patch ---