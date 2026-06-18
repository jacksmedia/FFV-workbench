;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_item_menu.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_item_menu.ips
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

;--- Patch at file offset $02DED0 (SNES $C2DED0) ---
org $C2DED0

    CMP #$48                ; [C9 48      ] Compare A Immediate
    BRK                     ; [00 10      ] Software interrupt
    ADC #$C9                ; [69 C9      ] Add with Carry Immediate
    ORA ($00)               ; [12 00      ] OR A with (DP)
    BMI $DF3E               ; [30 64      ] Branch if Minus
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDX $8E                 ; [A6 8E      ] Load X from DP
    LDA $C0EEF4,X           ; [BF F4 EE C0] Load A from Absolute Long,X
    CMP #$FF                ; [C9 FF      ] Compare A Immediate
    BEQ $DF3E               ; [F0 58      ] Branch if Equal
    CMP $29E4               ; [CD E4 29   ] Compare A with Absolute
    BEQ $DEF0               ; [F0 05      ] Branch if Equal
    INX                     ; [E8         ] Increment X
    INX                     ; [E8         ] Increment X
    INX                     ; [E8         ] Increment X
    BRA $DEDE               ; [80 EE      ] Branch Always
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $C0EEF5,X           ; [BF F5 EE C0] Load A from Absolute Long,X
    AND #$0F                ; [29 0F      ] AND A with Immediate
    BRK                     ; [00 A8      ] Software interrupt
    LDA $C0EEF6,X           ; [BF F6 EE C0] Load A from Absolute Long,X
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    CMP $29D8,Y             ; [D9 D8 29   ] Compare A with Absolute,Y
    BEQ $DF07               ; [F0 02      ] Branch if Equal
    BPL $DF3E               ; [10 37      ] Branch if Plus
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDX $29E4               ; [AE E4 29   ] Load X from Absolute
    LDA $2A9D,X             ; [BD 9D 2A   ] Load A from Absolute,X
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 CD      ] Software interrupt
    CMP $04F029,X           ; [DF 29 F0 04] Compare A with Absolute Long,X
    BMI $DF1B               ; [30 02      ] Branch if Minus
    BRA $DF3E               ; [80 23      ] Branch Always
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    LDA $29E1               ; [AD E1 29   ] Load A from Absolute
    BIT #$C2                ; [89 C2      ] Test Bits Immediate
    BNE $DF3E               ; [D0 1A      ] Branch if Not Equal
    BIT #$20                ; [89 20      ] Test Bits Immediate
    BEQ $DF2F               ; [F0 07      ] Branch if Equal
    LDA $29E4               ; [AD E4 29   ] Load A from Absolute
    CMP #$29                ; [C9 29      ] Compare A Immediate
    db $D0                      ; Incomplete/data bytes

;--- Patch at file offset $02E3F9 (SNES $C2E3F9) ---
org $C2E3F9

    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $54                 ; [A5 54      ] Load A from DP
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 C9      ] Software interrupt
    ASL $00,X               ; [16 00      ] Shift Left DP,X
    BEQ $E42A               ; [F0 25      ] Branch if Equal
    LDA $91                 ; [A5 91      ] Load A from DP
    AND #$FF                ; [29 FF      ] AND A with Immediate
    BRK                     ; [00 C9      ] Software interrupt
    CPX #$00                ; [E0 00      ] Compare X Immediate
    BMI $E421               ; [30 12      ] Branch if Minus
    SEP #$20                ; [E2 20      ] Set Processor Status Bits

;--- End of patch ---