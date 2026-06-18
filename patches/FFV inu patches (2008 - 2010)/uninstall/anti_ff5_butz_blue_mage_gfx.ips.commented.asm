;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_butz_blue_mage_gfx.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_butz_blue_mage_gfx.ips
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

;--- Patch at file offset $125080 (SNES $D25080) ---
org $D25080

    AND [$00],Y             ; [37 00      ] AND A with [DP],Y
    EOR $6F26,Y             ; [59 26 6F   ] XOR A with Absolute,Y
    BPL $5082               ; [10 FB      ] Branch if Plus
    TSB $BB                 ; [04 BB      ] Test and Set Bits in DP
    MVP $BB,$44             ; [44 BB 44   ] Block Move Positive
    ADC [$03],Y             ; [77 03      ] Add with Carry [DP],Y
    AND $000F,X             ; [3D 0F 00   ] AND A with Absolute,X
    BRK                     ; [00 11      ] Software interrupt
    ROL $0F                 ; [26 0F      ] Rotate Left DP
    BPL $50BA               ; [10 23      ] Branch if Plus
    MVN $22,$44             ; [54 22 44   ] Block Move Negative
    COP #$65                ; [02 65      ] Coprocessor interrupt
    AND $08,S               ; [23 08      ] AND A with Stack Relative
    ORA #$00                ; [09 00      ] OR A with Immediate
    ADC $560F,X             ; [7D 0F 56   ] Add with Carry Absolute,X
    ROL $70                 ; [26 70      ] Rotate Left DP
    BRK                     ; [00 79      ] Software interrupt
    JSR $093E               ; [20 3E 09   ] Jump to Subroutine
    CLC                     ; [18         ] Clear Carry Flag
    ORA $3F172D             ; [0F 2D 17 3F] OR A with Absolute Long
    BRK                     ; [00 09      ] Software interrupt
    BRK                     ; [00 26      ] Software interrupt
    AND #$2C                ; [29 2C      ] AND A with Immediate
    AND $24,S               ; [23 24      ] AND A with Stack Relative
    JSL $070801             ; [22 01 08 07] Jump to Subroutine Long
    PHP                     ; [08         ] Push Processor Status
    ORA ($14,S),Y           ; [13 14      ] OR A with (SR),Y
    BPL $50D0               ; [10 10      ] Branch if Plus

;--- End of patch ---