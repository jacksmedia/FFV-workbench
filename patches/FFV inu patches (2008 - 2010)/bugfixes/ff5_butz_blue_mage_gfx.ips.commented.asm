;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_butz_blue_mage_gfx.ips.commented.asm
;    Disassembled from IPS patch: ff5_butz_blue_mage_gfx.ips
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
    BPL $50B0               ; [10 10      ] Branch if Plus
    ADC $0C7E06,X           ; [7F 06 7E 0C] Add with Carry Absolute Long,X
    SBC $FB10,X             ; [FD 10 FB   ] Subtract with Borrow Absolute,X
    PLY                     ; [7A         ] Pull Y Register
    EOR $08373C,X           ; [5F 3C 37 08] XOR A with Absolute Long,X
    ORA [$08],Y             ; [17 08      ] OR A with [DP],Y
    ORA #$00                ; [09 00      ] OR A with Immediate
    COP #$06                ; [02 06      ] Coprocessor interrupt
    AND $2D                 ; [25 2D      ] AND A with Direct Page
    ORA ($02)               ; [12 02      ] OR A with (DP)
    ROL $3D76               ; [2E 76 3D   ] Rotate Left Absolute
    ORA $0B,X               ; [15 0B      ] OR A with DP,X
    ORA $09,S               ; [03 09      ] OR A with Stack Relative
    ORA ($00,X)             ; [01 00      ] OR A with (DP,X)
    db $00                      ; Incomplete/data bytes

;--- End of patch ---