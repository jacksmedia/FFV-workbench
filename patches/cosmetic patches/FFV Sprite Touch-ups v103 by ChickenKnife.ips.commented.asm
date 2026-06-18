;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; FFV Sprite Touch-ups v103 by ChickenKnife.ips.commented.asm
;    Disassembled from IPS patch: FFV Sprite Touch-ups v103 by ChickenKnife.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 232 record(s)

;--- Patch at file offset $1200A8 (SNES $D200A8) ---
org $D200A8

    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $1200C0 (SNES $D200C0) ---
org $D200C0

    db $37                      ; Incomplete/data bytes

;--- Patch at file offset $120458 (SNES $D20458) ---
org $D20458

    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    BRK                     ; [00 01      ] Software interrupt
    BRK                     ; [00 01      ] Software interrupt

;--- Patch at file offset $120468 (SNES $D20468) ---
org $D20468

    BCS $044A               ; [B0 E0      ] Branch if Carry Set
    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $12047A (SNES $D2047A) ---
org $D2047A

    RTS                     ; [60         ] Return from Subroutine
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $1209E0 (SNES $D209E0) ---
org $D209E0

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $1209F3 (SNES $D209F3) ---
org $D209F3

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $121040 (SNES $D21040) ---
org $D21040

    PHP                     ; [08         ] Push Processor Status

;--- Patch at file offset $121062 (SNES $D21062) ---
org $D21062

    SED                     ; [F8         ] Set Decimal Flag

;--- Patch at file offset $121BA6 (SNES $D21BA6) ---
org $D21BA6

    db $D3                      ; Incomplete/data bytes

;--- Patch at file offset $122208 (SNES $D22208) ---
org $D22208

    db $16                      ; Incomplete/data bytes

;--- Patch at file offset $122218 (SNES $D22218) ---
org $D22218

    db $19, $19                 ; Incomplete/data bytes

;--- Patch at file offset $122228 (SNES $D22228) ---
org $D22228

    db $EE                      ; Incomplete/data bytes

;--- Patch at file offset $122796 (SNES $D22796) ---
org $D22796

    SEI                     ; [78         ] Set Interrupt Disable
    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $1227A0 (SNES $D227A0) ---
org $D227A0

    db $F3                      ; Incomplete/data bytes

;--- Patch at file offset $123188 (SNES $D23188) ---
org $D23188

    db $77                      ; Incomplete/data bytes

;--- Patch at file offset $12344C (SNES $D2344C) ---
org $D2344C

    db $E2                      ; Incomplete/data bytes

;--- Patch at file offset $12345C (SNES $D2345C) ---
org $D2345C

    EOR ($00,X)             ; [41 00      ] XOR A with (DP,X)

;--- Patch at file offset $1236E0 (SNES $D236E0) ---
org $D236E0

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $12404C (SNES $D2404C) ---
org $D2404C

    ASL $0F00,X             ; [1E 00 0F   ] Shift Left Absolute,X
    db $05                      ; Incomplete/data bytes

;--- Patch at file offset $12405E (SNES $D2405E) ---
org $D2405E

    db $02                      ; Incomplete/data bytes

;--- Patch at file offset $125080 (SNES $D25080) ---
org $D25080

    ADC $560F,X             ; [7D 0F 56   ] Add with Carry Absolute,X
    ROL $70                 ; [26 70      ] Rotate Left DP
    BRK                     ; [00 79      ] Software interrupt
    JSR $093E               ; [20 3E 09   ] Jump to Subroutine
    CLC                     ; [18         ] Clear Carry Flag
    ORA $0F070D             ; [0F 0D 07 0F] OR A with Absolute Long
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 26      ] Software interrupt
    AND #$2C                ; [29 2C      ] AND A with Immediate
    AND $24,S               ; [23 24      ] AND A with Stack Relative
    JSL $070801             ; [22 01 08 07] Jump to Subroutine Long
    PHP                     ; [08         ] Push Processor Status
    ORA $04,S               ; [03 04      ] OR A with Stack Relative
    BRK                     ; [00 00      ] Software interrupt
    ORA $0C1E06,X           ; [1F 06 1E 0C] OR A with Absolute Long,X
    SBC $FB10,X             ; [FD 10 FB   ] Subtract with Borrow Absolute,X
    PLY                     ; [7A         ] Pull Y Register
    EOR $08773C,X           ; [5F 3C 77 08] XOR A with Absolute Long,X
    AND [$08],Y             ; [37 08      ] AND A with [DP],Y
    ORA $0200,Y             ; [19 00 02   ] OR A with Absolute,Y
    ASL $05                 ; [06 05      ] Shift Left DP
    ORA $0212               ; [0D 12 02   ] OR A with Absolute
    ROL $3D76               ; [2E 76 3D   ] Rotate Left Absolute
    ORA $0B,X               ; [15 0B      ] OR A with DP,X
    ORA $09,S               ; [03 09      ] OR A with Stack Relative
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $125208 (SNES $D25208) ---
org $D25208

    db $7E                      ; Incomplete/data bytes

;--- Patch at file offset $125218 (SNES $D25218) ---
org $D25218

    ORA ($08,X)             ; [01 08      ] OR A with (DP,X)

;--- Patch at file offset $1257C2 (SNES $D257C2) ---
org $D257C2

    ORA $7803               ; [0D 03 78   ] OR A with Absolute

;--- Patch at file offset $125B80 (SNES $D25B80) ---
org $D25B80

    SEI                     ; [78         ] Set Interrupt Disable

;--- Patch at file offset $125CA0 (SNES $D25CA0) ---
org $D25CA0

    CLC                     ; [18         ] Clear Carry Flag

;--- Patch at file offset $125D80 (SNES $D25D80) ---
org $D25D80

    SEI                     ; [78         ] Set Interrupt Disable

;--- Patch at file offset $12628E (SNES $D2628E) ---
org $D2628E

    db $0E, $07                 ; Incomplete/data bytes

;--- Patch at file offset $12629E (SNES $D2629E) ---
org $D2629E

    ORA [$06]               ; [07 06      ] OR A with [DP]

;--- Patch at file offset $126304 (SNES $D26304) ---
org $D26304

    db $FF                      ; Incomplete/data bytes

;--- Patch at file offset $126314 (SNES $D26314) ---
org $D26314

    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $1267A0 (SNES $D267A0) ---
org $D267A0

    db $F6                      ; Incomplete/data bytes

;--- Patch at file offset $126FE0 (SNES $D26FE0) ---
org $D26FE0

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $126FF3 (SNES $D26FF3) ---
org $D26FF3

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $127160 (SNES $D27160) ---
org $D27160

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $127173 (SNES $D27173) ---
org $D27173

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $1278CA (SNES $D278CA) ---
org $D278CA

    LDA ($44,S),Y           ; [B3 44      ] Load A from (SR),Y
    ADC $02,X               ; [75 02      ] Add with Carry DP,X

;--- Patch at file offset $1278E0 (SNES $D278E0) ---
org $D278E0

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $1278F3 (SNES $D278F3) ---
org $D278F3

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $127A02 (SNES $D27A02) ---
org $D27A02

    LDA ($44,S),Y           ; [B3 44      ] Load A from (SR),Y
    ADC $02,X               ; [75 02      ] Add with Carry DP,X

;--- Patch at file offset $127BCA (SNES $D27BCA) ---
org $D27BCA

    LDA ($44,S),Y           ; [B3 44      ] Load A from (SR),Y
    SBC $02,X               ; [F5 02      ] Subtract with Borrow DP,X

;--- Patch at file offset $127BE0 (SNES $D27BE0) ---
org $D27BE0

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $127BF3 (SNES $D27BF3) ---
org $D27BF3

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $127D4A (SNES $D27D4A) ---
org $D27D4A

    LDA ($44,S),Y           ; [B3 44      ] Load A from (SR),Y
    ADC $02,X               ; [75 02      ] Add with Carry DP,X

;--- Patch at file offset $127D60 (SNES $D27D60) ---
org $D27D60

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $127D73 (SNES $D27D73) ---
org $D27D73

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $127E20 (SNES $D27E20) ---
org $D27E20

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $127E33 (SNES $D27E33) ---
org $D27E33

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $127EE0 (SNES $D27EE0) ---
org $D27EE0

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $127EF3 (SNES $D27EF3) ---
org $D27EF3

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $127FE8 (SNES $D27FE8) ---
org $D27FE8

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $127FFB (SNES $D27FFB) ---
org $D27FFB

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $1281E0 (SNES $D281E0) ---
org $D281E0

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $1281F3 (SNES $D281F3) ---
org $D281F3

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $12820C (SNES $D2820C) ---
org $D2820C

    TSB $0807               ; [0C 07 08   ] Test and Set Bits Absolute
    db $07                      ; Incomplete/data bytes

;--- Patch at file offset $12821C (SNES $D2821C) ---
org $D2821C

    ORA $07,S               ; [03 07      ] OR A with Stack Relative
    ORA [$00]               ; [07 00      ] OR A with [DP]

;--- Patch at file offset $12823D (SNES $D2823D) ---
org $D2823D

    CPX #$F0                ; [E0 F0      ] Compare X Immediate
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $12824E (SNES $D2824E) ---
org $D2824E

    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $12825E (SNES $D2825E) ---
org $D2825E

    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $128285 (SNES $D28285) ---
org $D28285

    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $128294 (SNES $D28294) ---
org $D28294

    TSB $03                 ; [04 03      ] Test and Set Bits in DP

;--- Patch at file offset $128360 (SNES $D28360) ---
org $D28360

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $128373 (SNES $D28373) ---
org $D28373

    db $C0                      ; Incomplete/data bytes

;--- Patch at file offset $12880C (SNES $D2880C) ---
org $D2880C

    db $1C                      ; Incomplete/data bytes

;--- Patch at file offset $12884E (SNES $D2884E) ---
org $D2884E

    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $129FA4 (SNES $D29FA4) ---
org $D29FA4

    PHB                     ; [8B         ] Push Data Bank

;--- Patch at file offset $12A043 (SNES $D2A043) ---
org $D2A043

    db $02                      ; Incomplete/data bytes

;--- Patch at file offset $12A052 (SNES $D2A052) ---
org $D2A052

    COP #$01                ; [02 01      ] Coprocessor interrupt

;--- Patch at file offset $12A072 (SNES $D2A072) ---
org $D2A072

    db $4C, $8C                 ; Incomplete/data bytes

;--- Patch at file offset $12A44E (SNES $D2A44E) ---
org $D2A44E

    db $3F                      ; Incomplete/data bytes

;--- Patch at file offset $12A46E (SNES $D2A46E) ---
org $D2A46E

    db $FE, $00                 ; Incomplete/data bytes

;--- Patch at file offset $12BB88 (SNES $D2BB88) ---
org $D2BB88

    AND ($10),Y             ; [31 10      ] AND A with (DP),Y
    PLY                     ; [7A         ] Pull Y Register
    SEC                     ; [38         ] Set Carry Flag
    BIT $0808,X             ; [3C 08 08   ] Test Bits Absolute,X

;--- Patch at file offset $12BCA4 (SNES $D2BCA4) ---
org $D2BCA4

    db $15                      ; Incomplete/data bytes

;--- Patch at file offset $12BD8C (SNES $D2BD8C) ---
org $D2BD8C

    BIT $0808,X             ; [3C 08 08   ] Test Bits Absolute,X

;--- Patch at file offset $12C8A7 (SNES $D2C8A7) ---
org $D2C8A7

    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $12C8B6 (SNES $D2C8B6) ---
org $D2C8B6

    db $0F, $00                 ; Incomplete/data bytes

;--- Patch at file offset $12C907 (SNES $D2C907) ---
org $D2C907

    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $12C916 (SNES $D2C916) ---
org $D2C916

    db $0F, $00                 ; Incomplete/data bytes

;--- Patch at file offset $12CEC0 (SNES $D2CEC0) ---
org $D2CEC0

    db $14                      ; Incomplete/data bytes

;--- Patch at file offset $12D64E (SNES $D2D64E) ---
org $D2D64E

    db $26                      ; Incomplete/data bytes

;--- Patch at file offset $12D65E (SNES $D2D65E) ---
org $D2D65E

    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)

;--- Patch at file offset $12D94A (SNES $D2D94A) ---
org $D2D94A

    db $A3                      ; Incomplete/data bytes

;--- Patch at file offset $12D980 (SNES $D2D980) ---
org $D2D980

    db $79                      ; Incomplete/data bytes

;--- Patch at file offset $12DBC6 (SNES $D2DBC6) ---
org $D2DBC6

    db $63                      ; Incomplete/data bytes

;--- Patch at file offset $12F080 (SNES $D2F080) ---
org $D2F080

    db $27                      ; Incomplete/data bytes

;--- Patch at file offset $12FA0C (SNES $D2FA0C) ---
org $D2FA0C

    db $1D, $0D                 ; Incomplete/data bytes

;--- Patch at file offset $12FA1D (SNES $D2FA1D) ---
org $D2FA1D

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $12FEAA (SNES $D2FEAA) ---
org $D2FEAA

    PLY                     ; [7A         ] Pull Y Register
    SEC                     ; [38         ] Set Carry Flag

;--- Patch at file offset $12FEBA (SNES $D2FEBA) ---
org $D2FEBA

    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $12FF0A (SNES $D2FF0A) ---
org $D2FF0A

    TDC                     ; [7B         ] Transfer Direct Page to A
    db $39                      ; Incomplete/data bytes

;--- Patch at file offset $12FF1A (SNES $D2FF1A) ---
org $D2FF1A

    db $05                      ; Incomplete/data bytes

;--- Patch at file offset $12FF8A (SNES $D2FF8A) ---
org $D2FF8A

    TDC                     ; [7B         ] Transfer Direct Page to A
    db $39                      ; Incomplete/data bytes

;--- Patch at file offset $12FF9A (SNES $D2FF9A) ---
org $D2FF9A

    db $05                      ; Incomplete/data bytes

;--- Patch at file offset $12FFAA (SNES $D2FFAA) ---
org $D2FFAA

    db $F5                      ; Incomplete/data bytes

;--- Patch at file offset $12FFBB (SNES $D2FFBB) ---
org $D2FFBB

    PHX                     ; [DA         ] Push X Register

;--- Patch at file offset $130040 (SNES $D30040) ---
org $D30040

    db $2C, $18                 ; Incomplete/data bytes

;--- Patch at file offset $130050 (SNES $D30050) ---
org $D30050

    TCS                     ; [1B         ] Transfer A to Stack Pointer

;--- Patch at file offset $13039A (SNES $D3039A) ---
org $D3039A

    db $0C                      ; Incomplete/data bytes

;--- Patch at file offset $130640 (SNES $D30640) ---
org $D30640

    TSB $00                 ; [04 00      ] Test and Set Bits in DP

;--- Patch at file offset $130650 (SNES $D30650) ---
org $D30650

    db $03                      ; Incomplete/data bytes

;--- Patch at file offset $130C4A (SNES $D30C4A) ---
org $D30C4A

    db $03                      ; Incomplete/data bytes

;--- Patch at file offset $130C5A (SNES $D30C5A) ---
org $D30C5A

    BRK                     ; [00 01      ] Software interrupt

;--- Patch at file offset $130C6A (SNES $D30C6A) ---
org $D30C6A

    BCS $0C4C               ; [B0 E0      ] Branch if Carry Set
    db $30                      ; Incomplete/data bytes

;--- Patch at file offset $130C7A (SNES $D30C7A) ---
org $D30C7A

    RTS                     ; [60         ] Return from Subroutine
    BRA $0C5D               ; [80 E0      ] Branch Always
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $13108E (SNES $D3108E) ---
org $D3108E

    db $1F, $0F                 ; Incomplete/data bytes

;--- Patch at file offset $131120 (SNES $D31120) ---
org $D31120

    db $DD                      ; Incomplete/data bytes

;--- Patch at file offset $131128 (SNES $D31128) ---
org $D31128

    SBC ($F6),Y             ; [F1 F6      ] Subtract with Borrow (DP),Y

;--- Patch at file offset $131138 (SNES $D31138) ---
org $D31138

    db $FE                      ; Incomplete/data bytes

;--- Patch at file offset $131D24 (SNES $D31D24) ---
org $D31D24

    db $33                      ; Incomplete/data bytes

;--- Patch at file offset $1322A0 (SNES $D322A0) ---
org $D322A0

    db $3F, $1F, $39            ; Incomplete/data bytes

;--- Patch at file offset $1322B0 (SNES $D322B0) ---
org $D322B0

    ORA [$18]               ; [07 18      ] OR A with [DP]

;--- Patch at file offset $1323D2 (SNES $D323D2) ---
org $D323D2

    ASL $01                 ; [06 01      ] Shift Left DP
    db $0C, $0B                 ; Incomplete/data bytes

;--- Patch at file offset $132482 (SNES $D32482) ---
org $D32482

    PHD                     ; [0B         ] Push Direct Page Register

;--- Patch at file offset $132492 (SNES $D32492) ---
org $D32492

    ASL $01                 ; [06 01      ] Shift Left DP
    db $0C, $0B                 ; Incomplete/data bytes

;--- Patch at file offset $132CC0 (SNES $D32CC0) ---
org $D32CC0

    db $33                      ; Incomplete/data bytes

;--- Patch at file offset $133527 (SNES $D33527) ---
org $D33527

    ROR                     ; [6A         ] Rotate Right Accumulator

;--- Patch at file offset $133536 (SNES $D33536) ---
org $D33536

    db $74                      ; Incomplete/data bytes

;--- Patch at file offset $133985 (SNES $D33985) ---
org $D33985

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $133994 (SNES $D33994) ---
org $D33994

    BRK                     ; [00 00      ] Software interrupt

;--- Patch at file offset $13408C (SNES $D3408C) ---
org $D3408C

    db $3D, $14                 ; Incomplete/data bytes

;--- Patch at file offset $13409D (SNES $D3409D) ---
org $D3409D

    db $02                      ; Incomplete/data bytes

;--- Patch at file offset $1340A4 (SNES $D340A4) ---
org $D340A4

    TSC                     ; [3B         ] Transfer Stack Pointer to A

;--- Patch at file offset $134184 (SNES $D34184) ---
org $D34184

    XCE                     ; [FB         ] Exchange Carry and Emulation
    db $57                      ; Incomplete/data bytes

;--- Patch at file offset $134195 (SNES $D34195) ---
org $D34195

    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $1346AD (SNES $D346AD) ---
org $D346AD

    PHD                     ; [0B         ] Push Direct Page Register

;--- Patch at file offset $1346BC (SNES $D346BC) ---
org $D346BC

    db $03                      ; Incomplete/data bytes

;--- Patch at file offset $13470D (SNES $D3470D) ---
org $D3470D

    PHD                     ; [0B         ] Push Direct Page Register
    db $1F                      ; Incomplete/data bytes

;--- Patch at file offset $13471C (SNES $D3471C) ---
org $D3471C

    db $03                      ; Incomplete/data bytes

;--- Patch at file offset $134D0C (SNES $D34D0C) ---
org $D34D0C

    BVS $4D4D               ; [70 3F      ] Branch if Overflow Set
    db $7F                      ; Incomplete/data bytes

;--- Patch at file offset $134D8C (SNES $D34D8C) ---
org $D34D8C

    BVS $4DCD               ; [70 3F      ] Branch if Overflow Set
    db $7F                      ; Incomplete/data bytes

;--- Patch at file offset $13518C (SNES $D3518C) ---
org $D3518C

    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 3F      ] Software interrupt

;--- Patch at file offset $13530C (SNES $D3530C) ---
org $D3530C

    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 3F      ] Software interrupt

;--- Patch at file offset $13538C (SNES $D3538C) ---
org $D3538C

    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 3F      ] Software interrupt

;--- Patch at file offset $135A0C (SNES $D35A0C) ---
org $D35A0C

    db $73                      ; Incomplete/data bytes

;--- Patch at file offset $135F2B (SNES $D35F2B) ---
org $D35F2B

    CLC                     ; [18         ] Clear Carry Flag

;--- Patch at file offset $135F3A (SNES $D35F3A) ---
org $D35F3A

    INC                     ; [1A         ] Increment Accumulator
    INC                     ; [1A         ] Increment Accumulator

;--- Patch at file offset $135FE2 (SNES $D35FE2) ---
org $D35FE2

    db $BE                      ; Incomplete/data bytes

;--- Patch at file offset $138CE0 (SNES $D38CE0) ---
org $D38CE0

    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $138ED0 (SNES $D38ED0) ---
org $D38ED0

    BRK                     ; [00 48      ] Software interrupt
    TSB $0C02               ; [0C 02 0C   ] Test and Set Bits Absolute
    COP #$04                ; [02 04      ] Coprocessor interrupt
    db $01                      ; Incomplete/data bytes

;--- Patch at file offset $138FCA (SNES $D38FCA) ---
org $D38FCA

    LDX $5E51               ; [AE 51 5E   ] Load X from Absolute
    db $21                      ; Incomplete/data bytes

;--- Patch at file offset $138FDB (SNES $D38FDB) ---
org $D38FDB

    db $55                      ; Incomplete/data bytes

;--- Patch at file offset $13900C (SNES $D3900C) ---
org $D3900C

    ORA $030D00             ; [0F 00 0D 03] OR A with Absolute Long

;--- Patch at file offset $13901C (SNES $D3901C) ---
org $D3901C

    TSB $04                 ; [04 04      ] Test and Set Bits in DP
    db $03                      ; Incomplete/data bytes

;--- Patch at file offset $1394D6 (SNES $D394D6) ---
org $D394D6

    ORA $00                 ; [05 00      ] OR A with Direct Page

;--- Patch at file offset $139518 (SNES $D39518) ---
org $D39518

    db $3E, $30                 ; Incomplete/data bytes

;--- Patch at file offset $1395E0 (SNES $D395E0) ---
org $D395E0

    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $139648 (SNES $D39648) ---
org $D39648

    db $05                      ; Incomplete/data bytes

;--- Patch at file offset $139668 (SNES $D39668) ---
org $D39668

    db $90                      ; Incomplete/data bytes

;--- Patch at file offset $139C31 (SNES $D39C31) ---
org $D39C31

    db $04                      ; Incomplete/data bytes

;--- Patch at file offset $139C69 (SNES $D39C69) ---
org $D39C69

    db $E0                      ; Incomplete/data bytes

;--- Patch at file offset $139C78 (SNES $D39C78) ---
org $D39C78

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $13A08E (SNES $D3A08E) ---
org $D3A08E

    db $15                      ; Incomplete/data bytes

;--- Patch at file offset $13AE4E (SNES $D3AE4E) ---
org $D3AE4E

    db $05                      ; Incomplete/data bytes

;--- Patch at file offset $13B0CF (SNES $D3B0CF) ---
org $D3B0CF

    db $44                      ; Incomplete/data bytes

;--- Patch at file offset $13B0DE (SNES $D3B0DE) ---
org $D3B0DE

    db $02                      ; Incomplete/data bytes

;--- Patch at file offset $13B3CF (SNES $D3B3CF) ---
org $D3B3CF

    db $44                      ; Incomplete/data bytes

;--- Patch at file offset $13B3DE (SNES $D3B3DE) ---
org $D3B3DE

    db $02                      ; Incomplete/data bytes

;--- Patch at file offset $13B921 (SNES $D3B921) ---
org $D3B921

    BRK                     ; [00 FB      ] Software interrupt
    db $80                      ; Incomplete/data bytes

;--- Patch at file offset $13B930 (SNES $D3B930) ---
org $D3B930

    SEI                     ; [78         ] Set Interrupt Disable
    PLY                     ; [7A         ] Pull Y Register
    BVS $B924               ; [70 F0      ] Branch if Overflow Set
    BRK                     ; [00 F0      ] Software interrupt

;--- Patch at file offset $13BCC0 (SNES $D3BCC0) ---
org $D3BCC0

    db $0F                      ; Incomplete/data bytes

;--- Patch at file offset $13BED0 (SNES $D3BED0) ---
org $D3BED0

    BRK                     ; [00 48      ] Software interrupt

;--- Patch at file offset $13C05E (SNES $D3C05E) ---
org $D3C05E

    ORA ($02,X)             ; [01 02      ] OR A with (DP,X)

;--- Patch at file offset $13C1D2 (SNES $D3C1D2) ---
org $D3C1D2

    ORA ($16,X)             ; [01 16      ] OR A with (DP,X)

;--- Patch at file offset $13D58A (SNES $D3D58A) ---
org $D3D58A

    SBC ($33,S),Y           ; [F3 33      ] Subtract with Borrow (SR),Y

;--- Patch at file offset $13D59B (SNES $D3D59B) ---
org $D3D59B

    db $8F                      ; Incomplete/data bytes

;--- Patch at file offset $13D7E0 (SNES $D3D7E0) ---
org $D3D7E0

    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $13DDE0 (SNES $D3DDE0) ---
org $D3DDE0

    RTS                     ; [60         ] Return from Subroutine
    BRK                     ; [00 F0      ] Software interrupt

;--- Patch at file offset $13E008 (SNES $D3E008) ---
org $D3E008

    ORA ($07),Y             ; [11 07      ] OR A with (DP),Y
    RTS                     ; [60         ] Return from Subroutine
    ORA $7F1F83             ; [0F 83 1F 7F] OR A with Absolute Long
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $13E01A (SNES $D3E01A) ---
org $D3E01A

    ORA $607F10,X           ; [1F 10 7F 60] OR A with Absolute Long,X

;--- Patch at file offset $13E0C8 (SNES $D3E0C8) ---
org $D3E0C8

    ORA ($07),Y             ; [11 07      ] OR A with (DP),Y
    RTS                     ; [60         ] Return from Subroutine
    ORA $7F1F83             ; [0F 83 1F 7F] OR A with Absolute Long
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $13E0DA (SNES $D3E0DA) ---
org $D3E0DA

    ORA $607F10,X           ; [1F 10 7F 60] OR A with Absolute Long,X

;--- Patch at file offset $13E200 (SNES $D3E200) ---
org $D3E200

    ORA ($07),Y             ; [11 07      ] OR A with (DP),Y
    RTS                     ; [60         ] Return from Subroutine
    ORA $7F1F83             ; [0F 83 1F 7F] OR A with Absolute Long
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $13E212 (SNES $D3E212) ---
org $D3E212

    ORA $607F10,X           ; [1F 10 7F 60] OR A with Absolute Long,X

;--- Patch at file offset $13E3C8 (SNES $D3E3C8) ---
org $D3E3C8

    ORA ($07),Y             ; [11 07      ] OR A with (DP),Y
    RTS                     ; [60         ] Return from Subroutine
    ORA $7F1F83             ; [0F 83 1F 7F] OR A with Absolute Long
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $13E3DA (SNES $D3E3DA) ---
org $D3E3DA

    ORA $607F10,X           ; [1F 10 7F 60] OR A with Absolute Long,X

;--- Patch at file offset $13E46C (SNES $D3E46C) ---
org $D3E46C

    db $7C                      ; Incomplete/data bytes

;--- Patch at file offset $13E548 (SNES $D3E548) ---
org $D3E548

    ORA ($07),Y             ; [11 07      ] OR A with (DP),Y
    RTS                     ; [60         ] Return from Subroutine
    db $0F, $80, $1F            ; Incomplete/data bytes

;--- Patch at file offset $13E55A (SNES $D3E55A) ---
org $D3E55A

    ORA $607F10,X           ; [1F 10 7F 60] OR A with Absolute Long,X

;--- Patch at file offset $13E886 (SNES $D3E886) ---
org $D3E886

    PLD                     ; [2B         ] Pull Direct Page Register
    BPL $E8B8               ; [10 2F      ] Branch if Plus
    INC                     ; [1A         ] Increment Accumulator
    db $25                      ; Incomplete/data bytes

;--- Patch at file offset $13E8C6 (SNES $D3E8C6) ---
org $D3E8C6

    PLD                     ; [2B         ] Pull Direct Page Register

;--- Patch at file offset $13E8D6 (SNES $D3E8D6) ---
org $D3E8D6

    ORA $11,X               ; [15 11      ] OR A with DP,X

;--- Patch at file offset $13EE8C (SNES $D3EE8C) ---
org $D3EE8C

    ORA #$06                ; [09 06      ] OR A with Immediate

;--- Patch at file offset $13EE9C (SNES $D3EE9C) ---
org $D3EE9C

    db $06                      ; Incomplete/data bytes

;--- Patch at file offset $1406D6 (SNES $D406D6) ---
org $D406D6

    ORA $01                 ; [05 01      ] OR A with Direct Page

;--- Patch at file offset $140734 (SNES $D40734) ---
org $D40734

    TSB $E6                 ; [04 E6      ] Test and Set Bits in DP

;--- Patch at file offset $1407E0 (SNES $D407E0) ---
org $D407E0

    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $14084A (SNES $D4084A) ---
org $D4084A

    db $7F, $25                 ; Incomplete/data bytes

;--- Patch at file offset $140854 (SNES $D40854) ---
org $D40854

    BPL $0867               ; [10 11      ] Branch if Plus
    AND $30                 ; [25 30      ] AND A with Direct Page
    AND $2421               ; [2D 21 24   ] AND A with Absolute

;--- Patch at file offset $140868 (SNES $D40868) ---
org $D40868

    EOR $829F4A,X           ; [5F 4A 9F 82] XOR A with Absolute Long,X

;--- Patch at file offset $140876 (SNES $D40876) ---
org $D40876

    DEC $06,X               ; [D6 06      ] Decrement DP,X
    TAX                     ; [AA         ] Transfer A to X
    SEP #$62                ; [E2 62      ] Set Processor Status Bits

;--- Patch at file offset $140CD0 (SNES $D40CD0) ---
org $D40CD0

    BRK                     ; [00 48      ] Software interrupt

;--- Patch at file offset $140D34 (SNES $D40D34) ---
org $D40D34

    PHP                     ; [08         ] Push Processor Status
    SED                     ; [F8         ] Set Decimal Flag

;--- Patch at file offset $140DB4 (SNES $D40DB4) ---
org $D40DB4

    PHP                     ; [08         ] Push Processor Status
    SED                     ; [F8         ] Set Decimal Flag

;--- Patch at file offset $140DE0 (SNES $D40DE0) ---
org $D40DE0

    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $140E2F (SNES $D40E2F) ---
org $D40E2F

    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $140E3F (SNES $D40E3F) ---
org $D40E3F

    db $F6                      ; Incomplete/data bytes

;--- Patch at file offset $140E4A (SNES $D40E4A) ---
org $D40E4A

    ORA $01,S               ; [03 01      ] OR A with Stack Relative

;--- Patch at file offset $140E54 (SNES $D40E54) ---
org $D40E54

    BRK                     ; [00 01      ] Software interrupt
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    ORA ($01,X)             ; [01 01      ] OR A with (DP,X)
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $140E68 (SNES $D40E68) ---
org $D40E68

    BVC $0EAA               ; [50 40      ] Branch if Overflow Clear
    BCC $0DEC               ; [90 80      ] Branch if Carry Clear

;--- Patch at file offset $140E76 (SNES $D40E76) ---
org $D40E76

    CPY #$00                ; [C0 00      ] Compare Y Immediate
    LDY #$E0                ; [A0 E0      ] Load Y Immediate
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $141180 (SNES $D41180) ---
org $D41180

    db $91                      ; Incomplete/data bytes

;--- Patch at file offset $141254 (SNES $D41254) ---
org $D41254

    db $6C, $42                 ; Incomplete/data bytes

;--- Patch at file offset $1412A0 (SNES $D412A0) ---
org $D412A0

    db $31                      ; Incomplete/data bytes

;--- Patch at file offset $141380 (SNES $D41380) ---
org $D41380

    db $91                      ; Incomplete/data bytes

;--- Patch at file offset $14141A (SNES $D4141A) ---
org $D4141A

    ASL $0D40,X             ; [1E 40 0D   ] Shift Left Absolute,X
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $14159A (SNES $D4159A) ---
org $D4159A

    ASL $6D00,X             ; [1E 00 6D   ] Shift Left Absolute,X
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $141CA1 (SNES $D41CA1) ---
org $D41CA1

    db $10                      ; Incomplete/data bytes

;--- Patch at file offset $141CB0 (SNES $D41CB0) ---
org $D41CB0

    RTS                     ; [60         ] Return from Subroutine
    CLC                     ; [18         ] Clear Carry Flag

;--- Patch at file offset $141F26 (SNES $D41F26) ---
org $D41F26

    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $141FA2 (SNES $D41FA2) ---
org $D41FA2

    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $141FB3 (SNES $D41FB3) ---
org $D41FB3

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1429B0 (SNES $D429B0) ---
org $D429B0

    SEI                     ; [78         ] Set Interrupt Disable
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1440E2 (SNES $D440E2) ---
org $D440E2

    db $F0                      ; Incomplete/data bytes

;--- Patch at file offset $14594E (SNES $D4594E) ---
org $D4594E

    db $7F                      ; Incomplete/data bytes

;--- Patch at file offset $14596E (SNES $D4596E) ---
org $D4596E

    db $FC                      ; Incomplete/data bytes

;--- Patch at file offset $14598E (SNES $D4598E) ---
org $D4598E

    db $7F                      ; Incomplete/data bytes

;--- Patch at file offset $14620C (SNES $D4620C) ---
org $D4620C

    db $50                      ; Incomplete/data bytes

;--- Patch at file offset $14621C (SNES $D4621C) ---
org $D4621C

    db $2C                      ; Incomplete/data bytes

;--- Patch at file offset $146580 (SNES $D46580) ---
org $D46580

    STX $0F,Y               ; [96 0F      ] Store X to DP,Y
    db $94                      ; Incomplete/data bytes

;--- Patch at file offset $1466A0 (SNES $D466A0) ---
org $D466A0

    ROL $0F                 ; [26 0F      ] Rotate Left DP
    db $14                      ; Incomplete/data bytes

;--- Patch at file offset $146780 (SNES $D46780) ---
org $D46780

    db $96                      ; Incomplete/data bytes

;--- Patch at file offset $146992 (SNES $D46992) ---
org $D46992

    db $2E, $11                 ; Incomplete/data bytes

;--- Patch at file offset $14826E (SNES $D4826E) ---
org $D4826E

    db $E6                      ; Incomplete/data bytes

;--- Patch at file offset $148280 (SNES $D48280) ---
org $D48280

    db $91                      ; Incomplete/data bytes

;--- Patch at file offset $148324 (SNES $D48324) ---
org $D48324

    db $8F, $C0, $8F            ; Incomplete/data bytes

;--- Patch at file offset $148334 (SNES $D48334) ---
org $D48334

    ORA ($24)               ; [12 24      ] OR A with (DP)
    ASL $20,X               ; [16 20      ] Shift Left DP,X

;--- Patch at file offset $1485B8 (SNES $D485B8) ---
org $D485B8

    BRA $859A               ; [80 E0      ] Branch Always

;--- Patch at file offset $1491EE (SNES $D491EE) ---
org $D491EE

    db $FF, $00                 ; Incomplete/data bytes

;--- Patch at file offset $1491FF (SNES $D491FF) ---
org $D491FF

    db $94                      ; Incomplete/data bytes

;--- Patch at file offset $149222 (SNES $D49222) ---
org $D49222

    ADC [$00],Y             ; [77 00      ] Add with Carry [DP],Y
    CMP [$00]               ; [C7 00      ] Compare A with [DP]

;--- Patch at file offset $149232 (SNES $D49232) ---
org $D49232

    PHP                     ; [08         ] Push Processor Status
    REP #$30                ; [C2 30      ] Reset Processor Status Bits

;--- End of patch ---