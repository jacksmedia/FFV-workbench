;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; FFV (RPGe) Even Better Weapons, by xJ4cks.ips.commented.asm
;    Disassembled from IPS patch: FFV (RPGe) Even Better Weapons, by xJ4cks.ips
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

;--- Patch at file offset $00FFDC (SNES $C0FFDC) ---
org $C0FFDC

    LSR $3D                 ; [46 3D      ] Shift Right DP
    db $B9, $C2                 ; Incomplete/data bytes

;--- Patch at file offset $115708 (SNES $D15708) ---
org $D15708

    AND $B300               ; [2D 00 B3   ] AND A with Absolute
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    TSB $A4                 ; [04 A4      ] Test and Set Bits in DP
    COP #$01                ; [02 01      ] Coprocessor interrupt
    PHP                     ; [08         ] Push Processor Status
    LDY $06                 ; [A4 06      ] Load Y from DP
    ORA $00,X               ; [15 00      ] OR A with DP,X
    LDA ($01,S),Y           ; [B3 01      ] Load A from (SR),Y
    STA $00,S               ; [83 00      ] Store A to Stack Relative
    LDY $02                 ; [A4 02      ] Load Y from DP
    STA ($08,X)             ; [81 08      ] Store A to (DP,X)
    LDA ($01,S),Y           ; [B3 01      ] Load A from (SR),Y
    ADC $00,S               ; [63 00      ] Add with Carry Stack Relative
    LDA ($01,S),Y           ; [B3 01      ] Load A from (SR),Y
    ORA ($08),Y             ; [11 08      ] OR A with (DP),Y
    LDY $02                 ; [A4 02      ] Load Y from DP
    ORA $B300               ; [0D 00 B3   ] OR A with Absolute
    ORA ($40,X)             ; [01 40      ] OR A with (DP,X)
    ASL $C1                 ; [06 C1      ] Shift Left DP
    ORA ($01)               ; [12 01      ] OR A with (DP)
    ORA #$C0                ; [09 C0      ] OR A with Immediate
    ORA ($01)               ; [12 01      ] OR A with (DP)
    ORA [$C1]               ; [07 C1      ] OR A with [DP]
    ORA ($01)               ; [12 01      ] OR A with (DP)
    AND $C0,S               ; [23 C0      ] AND A with Stack Relative
    ORA ($45)               ; [12 45      ] OR A with (DP)
    ORA ($E5,X)             ; [01 E5      ] OR A with (DP,X)
    ORA ($05)               ; [12 05      ] OR A with (DP)
    ORA $E5,S               ; [03 E5      ] OR A with Stack Relative
    ORA ($01)               ; [12 01      ] OR A with (DP)
    BVS $56EB               ; [70 A4      ] Branch if Overflow Set
    COP #$01                ; [02 01      ] Coprocessor interrupt
    EOR [$E4]               ; [47 E4      ] XOR A with [DP]
    INC                     ; [1A         ] Increment Accumulator
    ORA ($41,X)             ; [01 41      ] OR A with (DP,X)
    CPY #$12                ; [C0 12      ] Compare Y Immediate
    ORA ($18,X)             ; [01 18      ] OR A with (DP,X)
    CPY #$12                ; [C0 12      ] Compare Y Immediate
    ORA ($60,X)             ; [01 60      ] OR A with (DP,X)

;--- End of patch ---