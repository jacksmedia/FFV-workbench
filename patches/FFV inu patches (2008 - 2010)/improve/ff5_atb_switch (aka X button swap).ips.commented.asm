;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_atb_switch (aka X button swap).ips.commented.asm
;    Disassembled from IPS patch: ff5_atb_switch (aka X button swap).ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 5 record(s)

;--- Patch at file offset $0153C0 (SNES $C153C0) ---
org $C153C0

    JMP $5478               ; [4C 78 54   ] Jump Absolute
    LDA #$FF                ; [A9 FF      ] Load A Immediate
    STA $41B1               ; [8D B1 41   ] Store A to Absolute
    STZ $3ED4               ; [9C D4 3E   ] Store Zero to Absolute
    JMP $FBAD               ; [4C AD FB   ] Jump Absolute

;--- Patch at file offset $015467 (SNES $C15467) ---
org $C15467

    BPL $540E               ; [10 A5      ] Branch if Plus
    ORA ($89,X)             ; [01 89      ] OR A with (DP,X)
    COP #$F0                ; [02 F0      ] Coprocessor interrupt
    ORA $4C,S               ; [03 4C      ] OR A with Stack Relative
    PLY                     ; [7A         ] Pull Y Register
    EOR ($89,S),Y           ; [53 89      ] XOR A with (SR),Y
    ORA ($F0,X)             ; [01 F0      ] OR A with (DP,X)
    ORA $4C,S               ; [03 4C      ] OR A with Stack Relative
    PHB                     ; [8B         ] Push Data Bank
    EOR ($A5,S),Y           ; [53 A5      ] XOR A with (SR),Y
    BRK                     ; [00 30      ] Software interrupt
    ASL $4029               ; [0E 29 40   ] Shift Left Absolute
    BEQ $5493               ; [F0 13      ] Branch if Equal
    INC $CDF8               ; [EE F8 CD   ] Increment Absolute
    INC $CDF9               ; [EE F9 CD   ] Increment Absolute
    JSR $53C3               ; [20 C3 53   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02177D (SNES $C2177D) ---
org $C2177D

    LDY $201A,X             ; [BC 1A 20   ] Load Y from Absolute,X
    CPY $41CE               ; [CC CE 41   ] Compare Y with Absolute
    BNE $1795               ; [D0 10      ] Branch if Not Equal
    LDY $201C,X             ; [BC 1C 20   ] Load Y from Absolute,X
    CPY $41D0               ; [CC D0 41   ] Compare Y with Absolute
    BNE $1795               ; [D0 08      ] Branch if Not Equal
    LDY $200A,X             ; [BC 0A 20   ] Load Y from Absolute,X
    CPY $41D2               ; [CC D2 41   ] Compare Y with Absolute
    BEQ $17FE               ; [F0 69      ] Branch if Equal
    JSR $1C74               ; [20 74 1C   ] Jump to Subroutine
    BNE $17D6               ; [D0 3C      ] Branch if Not Equal
    JSR $1CB3               ; [20 B3 1C   ] Jump to Subroutine
    JSR $1C9A               ; [20 9A 1C   ] Jump to Subroutine
    BNE $17D6               ; [D0 34      ] Branch if Not Equal
    LDA #$05                ; [A9 05      ] Load A Immediate
    JSR $0069               ; [20 69 00   ] Jump to Subroutine
    LDA #$06                ; [A9 06      ] Load A Immediate
    JSR $0069               ; [20 69 00   ] Jump to Subroutine
    JSR $17B2               ; [20 B2 17   ] Jump to Subroutine
    BRA $17FE               ; [80 4D      ] Branch Always
    NOP                     ; [EA         ] No Operation
    LDX $32                 ; [A6 32      ] Load X from DP
    LDY $201A,X             ; [BC 1A 20   ] Load Y from Absolute,X
    STY $41CE               ; [8C CE 41   ] Store Y to Absolute
    LDY $201C,X             ; [BC 1C 20   ] Load Y from Absolute,X
    STY $41D0               ; [8C D0 41   ] Store Y to Absolute
    LDY $200A,X             ; [BC 0A 20   ] Load Y from Absolute,X
    STY $41D2               ; [8C D2 41   ] Store Y to Absolute
    RTS                     ; [60         ] Return from Subroutine
    LDA #$01                ; [A9 01      ] Load A Immediate
    STA $7C4E               ; [8D 4E 7C   ] Store A to Absolute
    STA $3ED4               ; [8D D4 3E   ] Store A to Absolute
    LDA $3ED6               ; [AD D6 3E   ] Load A from Absolute
    STA $3ED5               ; [8D D5 3E   ] Store A to Absolute
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $021849 (SNES $C21849) ---
org $C21849

    LDA #$FF                ; [A9 FF      ] Load A Immediate
    CMP $41CC               ; [CD CC 41   ] Compare A with Absolute
    BEQ $187E               ; [F0 2E      ] Branch if Equal
    CMP $41BF               ; [CD BF 41   ] Compare A with Absolute
    BEQ $1858               ; [F0 03      ] Branch if Equal
    JMP $18FF               ; [4C FF 18   ] Jump Absolute
    LDA $41CC               ; [AD CC 41   ] Load A from Absolute
    STA $7B7B               ; [8D 7B 7B   ] Store A to Absolute
    LDX $41AE               ; [AE AE 41   ] Load X from Absolute
    STA $41A9,X             ; [9D A9 41   ] Store A to Absolute,X
    INC $41AE               ; [EE AE 41   ] Increment Absolute
    LDA $7B7D               ; [AD 7D 7B   ] Load A from Absolute
    BEQ $187E               ; [F0 12      ] Branch if Equal
    JSR $9F3A               ; [20 3A 9F   ] Jump to Subroutine
    JSR $9A6F               ; [20 6F 9A   ] Jump to Subroutine
    STZ $7B7D               ; [9C 7D 7B   ] Store Zero to Absolute
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    LDA $41A9               ; [AD A9 41   ] Load A from Absolute
    CMP #$FF                ; [C9 FF      ] Compare A Immediate
    BEQ $1848               ; [F0 C3      ] Branch if Equal
    LDX $41AA               ; [AE AA 41   ] Load X from Absolute
    STX $41A9               ; [8E A9 41   ] Store X to Absolute
    LDX $41AC               ; [AE AC 41   ] Load X from Absolute
    STX $41AB               ; [8E AB 41   ] Store X to Absolute
    DEC $41AE               ; [CE AE 41   ] Decrement Absolute
    STA $70                 ; [85 70      ] Store A to DP
    STA $41CC               ; [8D CC 41   ] Store A to Absolute
    JSR $01EC               ; [20 EC 01   ] Jump to Subroutine
    LDA $7C51               ; [AD 51 7C   ] Load A from Absolute
    BEQ $18BA               ; [F0 19      ] Branch if Equal
    LDA $41CC               ; [AD CC 41   ] Load A from Absolute
    CMP $7CB6               ; [CD B6 7C   ] Compare A with Absolute
    BEQ $18BA               ; [F0 11      ] Branch if Equal
    JSR $0207               ; [20 07 02   ] Jump to Subroutine
    LDA $3D7F,Y             ; [B9 7F 3D   ] Load A from Absolute,Y
    BNE $1905               ; [D0 54      ] Branch if Not Equal
    INC                     ; [1A         ] Increment Accumulator
    STA $3D7F,Y             ; [99 7F 3D   ] Store A to Absolute,Y
    STA $3CFB,Y             ; [99 FB 3C   ] Store A to Absolute,Y
    BRA $1905               ; [80 4B      ] Branch Always
    JSR $1C74               ; [20 74 1C   ] Jump to Subroutine
    BNE $1905               ; [D0 46      ] Branch if Not Equal
    STZ $71                 ; [64 71      ] Store Zero to DP
    JSR $1C9A               ; [20 9A 1C   ] Jump to Subroutine
    BNE $1905               ; [D0 3F      ] Branch if Not Equal
    JSR $1CB3               ; [20 B3 1C   ] Jump to Subroutine
    JSR $17B2               ; [20 B2 17   ] Jump to Subroutine
    JSR $190B               ; [20 0B 19   ] Jump to Subroutine
    LDA $41BF               ; [AD BF 41   ] Load A from Absolute
    CMP #$FF                ; [C9 FF      ] Compare A Immediate
    BEQ $18D9               ; [F0 03      ] Branch if Equal
    JSR $17C7               ; [20 C7 17   ] Jump to Subroutine

;--- Patch at file offset $0218F3 (SNES $C218F3) ---
org $C218F3

    db $7E                      ; Incomplete/data bytes

;--- End of patch ---