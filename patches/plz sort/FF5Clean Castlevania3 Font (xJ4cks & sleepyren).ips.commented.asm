;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; FF5Clean Castlevania3 Font (xJ4cks & sleepyren).ips.commented.asm
;    Disassembled from IPS patch: FF5Clean Castlevania3 Font (xJ4cks & sleepyren).ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 72 record(s)

;--- Patch at file offset $11F201 (SNES $D1F201) ---
org $D1F201

    TSB $06FF               ; [0C FF 06   ] Test and Set Bits Absolute
    SBC $16FF0E,X           ; [FF 0E FF 16] Subtract with Borrow Absolute Long,X
    SBC $7EFF26,X           ; [FF 26 FF 7E] Subtract with Borrow Absolute Long,X
    SBC $00FF66,X           ; [FF 66 FF 00] Subtract with Borrow Absolute Long,X
    SBC $66FFDC,X           ; [FF DC FF 66] Subtract with Borrow Absolute Long,X
    SBC $68FF66,X           ; [FF 66 FF 68] Subtract with Borrow Absolute Long,X
    SBC $66FF64,X           ; [FF 64 FF 66] Subtract with Borrow Absolute Long,X
    SBC $00FFDC,X           ; [FF DC FF 00] Subtract with Borrow Absolute Long,X
    SBC $2AFF1C,X           ; [FF 1C FF 2A] Subtract with Borrow Absolute Long,X
    SBC $58FF48,X           ; [FF 48 FF 58] Subtract with Borrow Absolute Long,X
    SBC $22FF70,X           ; [FF 70 FF 22] Subtract with Borrow Absolute Long,X
    SBC $00FF1C,X           ; [FF 1C FF 00] Subtract with Borrow Absolute Long,X
    SBC $68FFD0,X           ; [FF D0 FF 68] Subtract with Borrow Absolute Long,X
    SBC $66FF64,X           ; [FF 64 FF 66] Subtract with Borrow Absolute Long,X
    SBC $64FF66,X           ; [FF 66 FF 64] Subtract with Borrow Absolute Long,X
    SBC $00FFD8,X           ; [FF D8 FF 00] Subtract with Borrow Absolute Long,X
    SBC $62FFDC,X           ; [FF DC FF 62] Subtract with Borrow Absolute Long,X
    SBC $78FF60,X           ; [FF 60 FF 78] Subtract with Borrow Absolute Long,X
    SBC $62FF60,X           ; [FF 60 FF 62] Subtract with Borrow Absolute Long,X
    SBC $00FFDE,X           ; [FF DE FF 00] Subtract with Borrow Absolute Long,X
    SBC $62FFDC,X           ; [FF DC FF 62] Subtract with Borrow Absolute Long,X
    SBC $78FF60,X           ; [FF 60 FF 78] Subtract with Borrow Absolute Long,X
    SBC $60FF60,X           ; [FF 60 FF 60] Subtract with Borrow Absolute Long,X
    SBC $00FFC0,X           ; [FF C0 FF 00] Subtract with Borrow Absolute Long,X
    SBC $22FF1C,X           ; [FF 1C FF 22] Subtract with Borrow Absolute Long,X
    SBC $6EFF60,X           ; [FF 60 FF 6E] Subtract with Borrow Absolute Long,X
    SBC $26FF66,X           ; [FF 66 FF 26] Subtract with Borrow Absolute Long,X
    SBC $00FF1C,X           ; [FF 1C FF 00] Subtract with Borrow Absolute Long,X
    SBC $66FFC3,X           ; [FF C3 FF 66] Subtract with Borrow Absolute Long,X
    SBC $6EFF66,X           ; [FF 66 FF 6E] Subtract with Borrow Absolute Long,X
    SBC $66FF66,X           ; [FF 66 FF 66] Subtract with Borrow Absolute Long,X
    SBC $00FFC3,X           ; [FF C3 FF 00] Subtract with Borrow Absolute Long,X
    db $FF, $0C                 ; Incomplete/data bytes

;--- Patch at file offset $11F28D (SNES $D1F28D) ---
org $D1F28D

    db $30                      ; Incomplete/data bytes

;--- Patch at file offset $11F299 (SNES $D1F299) ---
org $D1F299

    JMP ($4CFF)             ; [6C FF 4C   ] Jump Indirect
    SBC $00FF38,X           ; [FF 38 FF 00] Subtract with Borrow Absolute Long,X
    SBC $64FFCE,X           ; [FF CE FF 64] Subtract with Borrow Absolute Long,X
    SBC $70FF68,X           ; [FF 68 FF 70] Subtract with Borrow Absolute Long,X
    SBC $66FF6C,X           ; [FF 6C FF 66] Subtract with Borrow Absolute Long,X
    SBC $00FFC2,X           ; [FF C2 FF 00] Subtract with Borrow Absolute Long,X
    db $FF, $C0                 ; Incomplete/data bytes

;--- Patch at file offset $11F2B9 (SNES $D1F2B9) ---
org $D1F2B9

    RTS                     ; [60         ] Return from Subroutine
    SBC $DEFF62,X           ; [FF 62 FF DE] Subtract with Borrow Absolute Long,X
    SBC $C3FF00,X           ; [FF 00 FF C3] Subtract with Borrow Absolute Long,X
    SBC $7EFF66,X           ; [FF 66 FF 7E] Subtract with Borrow Absolute Long,X
    SBC $66FF76,X           ; [FF 76 FF 66] Subtract with Borrow Absolute Long,X
    SBC $CCFF66,X           ; [FF 66 FF CC] Subtract with Borrow Absolute Long,X
    SBC $C1FF00,X           ; [FF 00 FF C1] Subtract with Borrow Absolute Long,X
    SBC $72FF62,X           ; [FF 62 FF 72] Subtract with Borrow Absolute Long,X
    SBC $66FF6A,X           ; [FF 6A FF 66] Subtract with Borrow Absolute Long,X
    SBC $C4FF62,X           ; [FF 62 FF C4] Subtract with Borrow Absolute Long,X
    SBC $18FF00,X           ; [FF 00 FF 18] Subtract with Borrow Absolute Long,X
    SBC $66FF24,X           ; [FF 24 FF 66] Subtract with Borrow Absolute Long,X
    SBC $66FF66,X           ; [FF 66 FF 66] Subtract with Borrow Absolute Long,X
    SBC $18FF24,X           ; [FF 24 FF 18] Subtract with Borrow Absolute Long,X
    SBC $DCFF00,X           ; [FF 00 FF DC] Subtract with Borrow Absolute Long,X
    SBC $E6FF66,X           ; [FF 66 FF E6] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F2FD (SNES $D1F2FD) ---
org $D1F2FD

    CPY #$FF                ; [C0 FF      ] Compare Y Immediate
    BRK                     ; [00 FF      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    SBC $66FF24,X           ; [FF 24 FF 66] Subtract with Borrow Absolute Long,X
    SBC $6CFF62,X           ; [FF 62 FF 6C] Subtract with Borrow Absolute Long,X
    SBC $1BFF26,X           ; [FF 26 FF 1B] Subtract with Borrow Absolute Long,X
    SBC $DCFF00,X           ; [FF 00 FF DC] Subtract with Borrow Absolute Long,X
    SBC $64FF66,X           ; [FF 66 FF 64] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F31D (SNES $D1F31D) ---
org $D1F31D

    REP #$FF                ; [C2 FF      ] Reset Processor Status Bits
    BRK                     ; [00 FF      ] Software interrupt
    BIT $42FF,X             ; [3C FF 42   ] Test Bits Absolute,X
    SBC $3CFF70,X           ; [FF 70 FF 3C] Subtract with Borrow Absolute Long,X
    SBC $46FF0E,X           ; [FF 0E FF 46] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F333 (SNES $D1F333) ---
org $D1F333

    db $99                      ; Incomplete/data bytes

;--- Patch at file offset $11F33D (SNES $D1F33D) ---
org $D1F33D

    BMI $F33E               ; [30 FF      ] Branch if Minus
    BRK                     ; [00 FF      ] Software interrupt
    db $CC                      ; Incomplete/data bytes

;--- Patch at file offset $11F351 (SNES $D1F351) ---
org $D1F351

    DEC $FF                 ; [C6 FF      ] Decrement DP
    PER $5655               ; [62 FF 62   ] Push Effective Relative
    SBC $34FF72,X           ; [FF 72 FF 34] Subtract with Borrow Absolute Long,X
    SBC $18FF38,X           ; [FF 38 FF 18] Subtract with Borrow Absolute Long,X
    SBC $C1FF00,X           ; [FF 00 FF C1] Subtract with Borrow Absolute Long,X
    SBC $6AFF62,X           ; [FF 62 FF 6A] Subtract with Borrow Absolute Long,X
    SBC $7AFF6A,X           ; [FF 6A FF 7A] Subtract with Borrow Absolute Long,X
    SBC $24FF76,X           ; [FF 76 FF 24] Subtract with Borrow Absolute Long,X
    SBC $73FF00,X           ; [FF 00 FF 73] Subtract with Borrow Absolute Long,X
    SBC $34FF32,X           ; [FF 32 FF 34] Subtract with Borrow Absolute Long,X
    SBC $2CFF18,X           ; [FF 18 FF 2C] Subtract with Borrow Absolute Long,X
    SBC $CEFF4C,X           ; [FF 4C FF CE] Subtract with Borrow Absolute Long,X
    SBC $66FF00,X           ; [FF 00 FF 66] Subtract with Borrow Absolute Long,X
    SBC $26FF26,X           ; [FF 26 FF 26] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F38D (SNES $D1F38D) ---
org $D1F38D

    BMI $F38E               ; [30 FF      ] Branch if Minus
    BRK                     ; [00 FF      ] Software interrupt
    DEC                     ; [3A         ] Decrement Accumulator
    SBC $0CFF46,X           ; [FF 46 FF 0C] Subtract with Borrow Absolute Long,X
    SBC $30FF18,X           ; [FF 18 FF 30] Subtract with Borrow Absolute Long,X
    SBC $5EFF62,X           ; [FF 62 FF 5E] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F531 (SNES $D1F531) ---
org $D1F531

    CLC                     ; [18         ] Clear Carry Flag
    SBC $46FF2C,X           ; [FF 2C FF 46] Subtract with Borrow Absolute Long,X
    SBC $62FF42,X           ; [FF 42 FF 62] Subtract with Borrow Absolute Long,X
    SBC $18FF34,X           ; [FF 34 FF 18] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F54D (SNES $D1F54D) ---
org $D1F54D

    TSB $00FF               ; [0C FF 00   ] Test and Set Bits Absolute
    SBC $64FF38,X           ; [FF 38 FF 64] Subtract with Borrow Absolute Long,X
    SBC $0CFF06,X           ; [FF 06 FF 0C] Subtract with Borrow Absolute Long,X
    SBC $20FF18,X           ; [FF 18 FF 20] Subtract with Borrow Absolute Long,X
    SBC $00FF7E,X           ; [FF 7E FF 00] Subtract with Borrow Absolute Long,X
    SBC $64FF38,X           ; [FF 38 FF 64] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F571 (SNES $D1F571) ---
org $D1F571

    TSB $1CFF               ; [0C FF 1C   ] Test and Set Bits Absolute
    SBC $6CFF2C,X           ; [FF 2C FF 6C] Subtract with Borrow Absolute Long,X
    SBC $0CFF7E,X           ; [FF 7E FF 0C] Subtract with Borrow Absolute Long,X
    SBC $00FF0E,X           ; [FF 0E FF 00] Subtract with Borrow Absolute Long,X
    SBC $40FF7C,X           ; [FF 7C FF 40] Subtract with Borrow Absolute Long,X
    SBC $0CFF78,X           ; [FF 78 FF 0C] Subtract with Borrow Absolute Long,X
    SBC $44FF06,X           ; [FF 06 FF 44] Subtract with Borrow Absolute Long,X
    SBC $00FF38,X           ; [FF 38 FF 00] Subtract with Borrow Absolute Long,X
    SBC $26FF1C,X           ; [FF 1C FF 26] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F59B (SNES $D1F59B) ---
org $D1F59B

    AND ($FF)               ; [32 FF      ] AND A with (DP)
    TRB $00FF               ; [1C FF 00   ] Test and Reset Bits Absolute
    SBC $46FF7E,X           ; [FF 7E FF 46] Subtract with Borrow Absolute Long,X
    SBC $18FF0C,X           ; [FF 0C FF 18] Subtract with Borrow Absolute Long,X
    SBC $30FF18,X           ; [FF 18 FF 30] Subtract with Borrow Absolute Long,X
    SBC $00FF30,X           ; [FF 30 FF 00] Subtract with Borrow Absolute Long,X
    SBC $44FF38,X           ; [FF 38 FF 44] Subtract with Borrow Absolute Long,X
    SBC $3CFF74,X           ; [FF 74 FF 3C] Subtract with Borrow Absolute Long,X
    db $FF, $4E                 ; Incomplete/data bytes

;--- Patch at file offset $11F5C1 (SNES $D1F5C1) ---
org $D1F5C1

    SEC                     ; [38         ] Set Carry Flag
    db $FF, $4C                 ; Incomplete/data bytes

;--- Patch at file offset $11F5CB (SNES $D1F5CB) ---
org $D1F5CB

    db $64                      ; Incomplete/data bytes

;--- Patch at file offset $11F601 (SNES $D1F601) ---
org $D1F601

    TSB $06FF               ; [0C FF 06   ] Test and Set Bits Absolute
    SBC $16FF0E,X           ; [FF 0E FF 16] Subtract with Borrow Absolute Long,X
    SBC $7EFF26,X           ; [FF 26 FF 7E] Subtract with Borrow Absolute Long,X
    SBC $00FF66,X           ; [FF 66 FF 00] Subtract with Borrow Absolute Long,X
    SBC $66FFDC,X           ; [FF DC FF 66] Subtract with Borrow Absolute Long,X
    SBC $68FF66,X           ; [FF 66 FF 68] Subtract with Borrow Absolute Long,X
    SBC $66FF64,X           ; [FF 64 FF 66] Subtract with Borrow Absolute Long,X
    SBC $00FFDC,X           ; [FF DC FF 00] Subtract with Borrow Absolute Long,X
    SBC $2AFF1C,X           ; [FF 1C FF 2A] Subtract with Borrow Absolute Long,X
    SBC $58FF48,X           ; [FF 48 FF 58] Subtract with Borrow Absolute Long,X
    SBC $22FF70,X           ; [FF 70 FF 22] Subtract with Borrow Absolute Long,X
    SBC $00FF1C,X           ; [FF 1C FF 00] Subtract with Borrow Absolute Long,X
    SBC $68FFD0,X           ; [FF D0 FF 68] Subtract with Borrow Absolute Long,X
    SBC $66FF64,X           ; [FF 64 FF 66] Subtract with Borrow Absolute Long,X
    SBC $64FF66,X           ; [FF 66 FF 64] Subtract with Borrow Absolute Long,X
    SBC $00FFD8,X           ; [FF D8 FF 00] Subtract with Borrow Absolute Long,X
    SBC $62FFDC,X           ; [FF DC FF 62] Subtract with Borrow Absolute Long,X
    SBC $78FF60,X           ; [FF 60 FF 78] Subtract with Borrow Absolute Long,X
    SBC $62FF60,X           ; [FF 60 FF 62] Subtract with Borrow Absolute Long,X
    SBC $00FFDE,X           ; [FF DE FF 00] Subtract with Borrow Absolute Long,X
    SBC $62FFDC,X           ; [FF DC FF 62] Subtract with Borrow Absolute Long,X
    SBC $78FF60,X           ; [FF 60 FF 78] Subtract with Borrow Absolute Long,X
    SBC $60FF60,X           ; [FF 60 FF 60] Subtract with Borrow Absolute Long,X
    SBC $00FFC0,X           ; [FF C0 FF 00] Subtract with Borrow Absolute Long,X
    SBC $22FF1C,X           ; [FF 1C FF 22] Subtract with Borrow Absolute Long,X
    SBC $6EFF60,X           ; [FF 60 FF 6E] Subtract with Borrow Absolute Long,X
    SBC $26FF66,X           ; [FF 66 FF 26] Subtract with Borrow Absolute Long,X
    SBC $00FF1C,X           ; [FF 1C FF 00] Subtract with Borrow Absolute Long,X
    SBC $66FFC3,X           ; [FF C3 FF 66] Subtract with Borrow Absolute Long,X
    SBC $6EFF66,X           ; [FF 66 FF 6E] Subtract with Borrow Absolute Long,X
    SBC $66FF66,X           ; [FF 66 FF 66] Subtract with Borrow Absolute Long,X
    SBC $00FFC3,X           ; [FF C3 FF 00] Subtract with Borrow Absolute Long,X
    db $FF, $0C                 ; Incomplete/data bytes

;--- Patch at file offset $11F68D (SNES $D1F68D) ---
org $D1F68D

    db $30                      ; Incomplete/data bytes

;--- Patch at file offset $11F699 (SNES $D1F699) ---
org $D1F699

    JMP ($4CFF)             ; [6C FF 4C   ] Jump Indirect
    SBC $00FF38,X           ; [FF 38 FF 00] Subtract with Borrow Absolute Long,X
    SBC $64FFCE,X           ; [FF CE FF 64] Subtract with Borrow Absolute Long,X
    SBC $70FF68,X           ; [FF 68 FF 70] Subtract with Borrow Absolute Long,X
    SBC $66FF6C,X           ; [FF 6C FF 66] Subtract with Borrow Absolute Long,X
    SBC $00FFC2,X           ; [FF C2 FF 00] Subtract with Borrow Absolute Long,X
    db $FF, $C0                 ; Incomplete/data bytes

;--- Patch at file offset $11F6B9 (SNES $D1F6B9) ---
org $D1F6B9

    RTS                     ; [60         ] Return from Subroutine
    SBC $DEFF62,X           ; [FF 62 FF DE] Subtract with Borrow Absolute Long,X
    SBC $C3FF00,X           ; [FF 00 FF C3] Subtract with Borrow Absolute Long,X
    SBC $7EFF66,X           ; [FF 66 FF 7E] Subtract with Borrow Absolute Long,X
    SBC $66FF76,X           ; [FF 76 FF 66] Subtract with Borrow Absolute Long,X
    SBC $CCFF66,X           ; [FF 66 FF CC] Subtract with Borrow Absolute Long,X
    SBC $C1FF00,X           ; [FF 00 FF C1] Subtract with Borrow Absolute Long,X
    SBC $72FF62,X           ; [FF 62 FF 72] Subtract with Borrow Absolute Long,X
    SBC $66FF6A,X           ; [FF 6A FF 66] Subtract with Borrow Absolute Long,X
    SBC $C4FF62,X           ; [FF 62 FF C4] Subtract with Borrow Absolute Long,X
    SBC $18FF00,X           ; [FF 00 FF 18] Subtract with Borrow Absolute Long,X
    SBC $66FF24,X           ; [FF 24 FF 66] Subtract with Borrow Absolute Long,X
    SBC $66FF66,X           ; [FF 66 FF 66] Subtract with Borrow Absolute Long,X
    SBC $18FF24,X           ; [FF 24 FF 18] Subtract with Borrow Absolute Long,X
    SBC $DCFF00,X           ; [FF 00 FF DC] Subtract with Borrow Absolute Long,X
    SBC $E6FF66,X           ; [FF 66 FF E6] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F6FD (SNES $D1F6FD) ---
org $D1F6FD

    CPY #$FF                ; [C0 FF      ] Compare Y Immediate
    BRK                     ; [00 FF      ] Software interrupt
    CLC                     ; [18         ] Clear Carry Flag
    SBC $66FF24,X           ; [FF 24 FF 66] Subtract with Borrow Absolute Long,X
    SBC $6CFF62,X           ; [FF 62 FF 6C] Subtract with Borrow Absolute Long,X
    SBC $1BFF26,X           ; [FF 26 FF 1B] Subtract with Borrow Absolute Long,X
    SBC $DCFF00,X           ; [FF 00 FF DC] Subtract with Borrow Absolute Long,X
    SBC $64FF66,X           ; [FF 66 FF 64] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F71D (SNES $D1F71D) ---
org $D1F71D

    REP #$FF                ; [C2 FF      ] Reset Processor Status Bits
    BRK                     ; [00 FF      ] Software interrupt
    BIT $42FF,X             ; [3C FF 42   ] Test Bits Absolute,X
    SBC $3CFF70,X           ; [FF 70 FF 3C] Subtract with Borrow Absolute Long,X
    SBC $46FF0E,X           ; [FF 0E FF 46] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F733 (SNES $D1F733) ---
org $D1F733

    db $99                      ; Incomplete/data bytes

;--- Patch at file offset $11F73D (SNES $D1F73D) ---
org $D1F73D

    BMI $F73E               ; [30 FF      ] Branch if Minus
    BRK                     ; [00 FF      ] Software interrupt
    db $CC                      ; Incomplete/data bytes

;--- Patch at file offset $11F751 (SNES $D1F751) ---
org $D1F751

    DEC $FF                 ; [C6 FF      ] Decrement DP
    PER $5A55               ; [62 FF 62   ] Push Effective Relative
    SBC $34FF72,X           ; [FF 72 FF 34] Subtract with Borrow Absolute Long,X
    SBC $18FF38,X           ; [FF 38 FF 18] Subtract with Borrow Absolute Long,X
    SBC $C1FF00,X           ; [FF 00 FF C1] Subtract with Borrow Absolute Long,X
    SBC $6AFF62,X           ; [FF 62 FF 6A] Subtract with Borrow Absolute Long,X
    SBC $7AFF6A,X           ; [FF 6A FF 7A] Subtract with Borrow Absolute Long,X
    SBC $24FF76,X           ; [FF 76 FF 24] Subtract with Borrow Absolute Long,X
    SBC $73FF00,X           ; [FF 00 FF 73] Subtract with Borrow Absolute Long,X
    SBC $34FF32,X           ; [FF 32 FF 34] Subtract with Borrow Absolute Long,X
    SBC $2CFF18,X           ; [FF 18 FF 2C] Subtract with Borrow Absolute Long,X
    SBC $CEFF4C,X           ; [FF 4C FF CE] Subtract with Borrow Absolute Long,X
    SBC $66FF00,X           ; [FF 00 FF 66] Subtract with Borrow Absolute Long,X
    SBC $26FF26,X           ; [FF 26 FF 26] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F78D (SNES $D1F78D) ---
org $D1F78D

    BMI $F78E               ; [30 FF      ] Branch if Minus
    BRK                     ; [00 FF      ] Software interrupt
    DEC                     ; [3A         ] Decrement Accumulator
    SBC $0CFF46,X           ; [FF 46 FF 0C] Subtract with Borrow Absolute Long,X
    SBC $30FF18,X           ; [FF 18 FF 30] Subtract with Borrow Absolute Long,X
    SBC $5EFF62,X           ; [FF 62 FF 5E] Subtract with Borrow Absolute Long,X
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    SBC $38FF40,X           ; [FF 40 FF 38] Subtract with Borrow Absolute Long,X
    SBC $3CFF0C,X           ; [FF 0C FF 3C] Subtract with Borrow Absolute Long,X
    SBC $36FF6C,X           ; [FF 6C FF 36] Subtract with Borrow Absolute Long,X
    SBC $60FF00,X           ; [FF 00 FF 60] Subtract with Borrow Absolute Long,X
    SBC $38FF30,X           ; [FF 30 FF 38] Subtract with Borrow Absolute Long,X
    SBC $36FF34,X           ; [FF 34 FF 36] Subtract with Borrow Absolute Long,X
    SBC $6CFF36,X           ; [FF 36 FF 6C] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F7C5 (SNES $D1F7C5) ---
org $D1F7C5

    TRB $36FF               ; [1C FF 36   ] Test and Reset Bits Absolute
    SBC $32FF60,X           ; [FF 60 FF 32] Subtract with Borrow Absolute Long,X
    SBC $00FF1C,X           ; [FF 1C FF 00] Subtract with Borrow Absolute Long,X
    SBC $0CFF06,X           ; [FF 06 FF 0C] Subtract with Borrow Absolute Long,X
    SBC $2CFF1C,X           ; [FF 1C FF 2C] Subtract with Borrow Absolute Long,X
    SBC $6CFF6C,X           ; [FF 6C FF 6C] Subtract with Borrow Absolute Long,X
    db $FF, $36                 ; Incomplete/data bytes

;--- Patch at file offset $11F7E5 (SNES $D1F7E5) ---
org $D1F7E5

    TRB $2CFF               ; [1C FF 2C   ] Test and Reset Bits Absolute
    SBC $70FF68,X           ; [FF 68 FF 70] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F7F3 (SNES $D1F7F3) ---
org $D1F7F3

    BMI $F7F4               ; [30 FF      ] Branch if Minus
    SED                     ; [F8         ] Set Decimal Flag
    SBC $30FF30,X           ; [FF 30 FF 30] Subtract with Borrow Absolute Long,X
    SBC $18FF30,X           ; [FF 30 FF 18] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F805 (SNES $D1F805) ---
org $D1F805

    DEC                     ; [3A         ] Decrement Accumulator
    SBC $6CFF6C,X           ; [FF 6C FF 6C] Subtract with Borrow Absolute Long,X
    SBC $06FF3C,X           ; [FF 3C FF 06] Subtract with Borrow Absolute Long,X
    SBC $60FF3E,X           ; [FF 3E FF 60] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F81D (SNES $D1F81D) ---
org $D1F81D

    ROR $FF                 ; [66 FF      ] Rotate Right DP
    TSB $18FF               ; [0C FF 18   ] Test and Set Bits Absolute
    SBC $18FF00,X           ; [FF 00 FF 18] Subtract with Borrow Absolute Long,X
    SBC $18FF38,X           ; [FF 38 FF 18] Subtract with Borrow Absolute Long,X
    SBC $1CFF18,X           ; [FF 18 FF 1C] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F837 (SNES $D1F837) ---
org $D1F837

    TRB $0CFF               ; [1C FF 0C   ] Test and Reset Bits Absolute
    SBC $4CFF0C,X           ; [FF 0C FF 4C] Subtract with Borrow Absolute Long,X
    SBC $30FFB8,X           ; [FF B8 FF 30] Subtract with Borrow Absolute Long,X
    SBC $36FF30,X           ; [FF 30 FF 36] Subtract with Borrow Absolute Long,X
    SBC $38FF34,X           ; [FF 34 FF 38] Subtract with Borrow Absolute Long,X
    SBC $36FF35,X           ; [FF 35 FF 36] Subtract with Borrow Absolute Long,X
    SBC $18FF00,X           ; [FF 00 FF 18] Subtract with Borrow Absolute Long,X
    db $FF, $38                 ; Incomplete/data bytes

;--- Patch at file offset $11F85D (SNES $D1F85D) ---
org $D1F85D

    db $0C                      ; Incomplete/data bytes

;--- Patch at file offset $11F867 (SNES $D1F867) ---
org $D1F867

    ROR $56FF,X             ; [7E FF 56   ] Rotate Right Absolute,X
    SBC $53FF56,X           ; [FF 56 FF 53] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F875 (SNES $D1F875) ---
org $D1F875

    CPY $76FF               ; [CC FF 76   ] Compare Y with Absolute
    SBC $66FF66,X           ; [FF 66 FF 66] Subtract with Borrow Absolute Long,X
    db $FF, $63                 ; Incomplete/data bytes

;--- Patch at file offset $11F885 (SNES $D1F885) ---
org $D1F885

    SEC                     ; [38         ] Set Carry Flag
    SBC $66FF6C,X           ; [FF 6C FF 66] Subtract with Borrow Absolute Long,X
    SBC $1CFF36,X           ; [FF 36 FF 1C] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F895 (SNES $D1F895) ---
org $D1F895

    CLI                     ; [58         ] Clear Interrupt Disable
    SBC $66FF64,X           ; [FF 64 FF 66] Subtract with Borrow Absolute Long,X
    SBC $6CFF76,X           ; [FF 76 FF 6C] Subtract with Borrow Absolute Long,X
    SBC $00FFC0,X           ; [FF C0 FF 00] Subtract with Borrow Absolute Long,X
    SBC $34FF00,X           ; [FF 00 FF 34] Subtract with Borrow Absolute Long,X
    SBC $CCFF4C,X           ; [FF 4C FF CC] Subtract with Borrow Absolute Long,X
    SBC $6CFFDC,X           ; [FF DC FF 6C] Subtract with Borrow Absolute Long,X
    SBC $00FF06,X           ; [FF 06 FF 00] Subtract with Borrow Absolute Long,X
    SBC $04FF00,X           ; [FF 00 FF 04] Subtract with Borrow Absolute Long,X
    SBC $36FF6E,X           ; [FF 6E FF 36] Subtract with Borrow Absolute Long,X
    SBC $60FF30,X           ; [FF 30 FF 60] Subtract with Borrow Absolute Long,X
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    SBC $38FF04,X           ; [FF 04 FF 38] Subtract with Borrow Absolute Long,X
    SBC $1CFF70,X           ; [FF 70 FF 1C] Subtract with Borrow Absolute Long,X
    SBC $9CFF6E,X           ; [FF 6E FF 9C] Subtract with Borrow Absolute Long,X
    SBC $30FF00,X           ; [FF 00 FF 30] Subtract with Borrow Absolute Long,X
    SBC $FCFF30,X           ; [FF 30 FF FC] Subtract with Borrow Absolute Long,X
    SBC $30FF30,X           ; [FF 30 FF 30] Subtract with Borrow Absolute Long,X
    db $FF, $36                 ; Incomplete/data bytes

;--- Patch at file offset $11F8E5 (SNES $D1F8E5) ---
org $D1F8E5

    MVP $FF,$66             ; [44 FF 66   ] Block Move Positive
    SBC $6EFF66,X           ; [FF 66 FF 6E] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F8F5 (SNES $D1F8F5) ---
org $D1F8F5

    BIT $FF                 ; [24 FF      ] Test Bits DP
    ROR $FF                 ; [66 FF      ] Rotate Right DP
    ROR $FF                 ; [66 FF      ] Rotate Right DP
    db $2C                      ; Incomplete/data bytes

;--- Patch at file offset $11F905 (SNES $D1F905) ---
org $D1F905

    MVP $FF,$D6             ; [44 FF D6   ] Block Move Positive
    db $FF, $D6                 ; Incomplete/data bytes

;--- Patch at file offset $11F915 (SNES $D1F915) ---
org $D1F915

    db $E6                      ; Incomplete/data bytes

;--- Patch at file offset $11F91D (SNES $D1F91D) ---
org $D1F91D

    db $CE                      ; Incomplete/data bytes

;--- Patch at file offset $11F925 (SNES $D1F925) ---
org $D1F925

    ROR $FF,X               ; [76 FF      ] Rotate Right DP,X
    ROL $FF,X               ; [36 FF      ] Rotate Left DP,X
    ROL $FF,X               ; [36 FF      ] Rotate Left DP,X
    TRB $30FF               ; [1C FF 30   ] Test and Reset Bits Absolute
    SBC $00FF40,X           ; [FF 40 FF 00] Subtract with Borrow Absolute Long,X
    SBC $3EFF00,X           ; [FF 00 FF 3E] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11F93D (SNES $D1F93D) ---
org $D1F93D

    JMP ($00FF,X)           ; [7C FF 00   ] Jump Indirect,X
    SBC $0EFF66,X           ; [FF 66 FF 0E] Subtract with Borrow Absolute Long,X
    SBC $E6FF66,X           ; [FF 66 FF E6] Subtract with Borrow Absolute Long,X
    SBC $66FF66,X           ; [FF 66 FF 66] Subtract with Borrow Absolute Long,X
    SBC $00FF73,X           ; [FF 73 FF 00] Subtract with Borrow Absolute Long,X
    SBC $06FF66,X           ; [FF 66 FF 06] Subtract with Borrow Absolute Long,X
    SBC $E6FF6F,X           ; [FF 6F FF E6] Subtract with Borrow Absolute Long,X
    SBC $66FF66,X           ; [FF 66 FF 66] Subtract with Borrow Absolute Long,X
    db $FF, $73                 ; Incomplete/data bytes

;--- Patch at file offset $11F971 (SNES $D1F971) ---
org $D1F971

    ROR $FF                 ; [66 FF      ] Rotate Right DP
    CPX #$FF                ; [E0 FF      ] Compare X Immediate
    ROR $FF                 ; [66 FF      ] Rotate Right DP
    ROR $66FF               ; [6E FF 66   ] Rotate Right Absolute
    SBC $37FF66,X           ; [FF 66 FF 37] Subtract with Borrow Absolute Long,X
    SBC $66FF00,X           ; [FF 00 FF 66] Subtract with Borrow Absolute Long,X
    db $FF, $EE                 ; Incomplete/data bytes

;--- Patch at file offset $11F98D (SNES $D1F98D) ---
org $D1F98D

    AND ($FF,S),Y           ; [33 FF      ] AND A with (SR),Y
    BRK                     ; [00 FF      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $11F9A1 (SNES $D1F9A1) ---
org $D1F9A1

    BRK                     ; [00 FF      ] Software interrupt
    JMP ($24FF)             ; [6C FF 24   ] Jump Indirect
    db $FF, $48                 ; Incomplete/data bytes

;--- Patch at file offset $11F9B1 (SNES $D1F9B1) ---
org $D1F9B1

    BRK                     ; [00 FF      ] Software interrupt
    BMI $F9B4               ; [30 FF      ] Branch if Minus
    BMI $F9B6               ; [30 FF      ] Branch if Minus
    BRK                     ; [00 FF      ] Software interrupt
    BRK                     ; [00 FF      ] Software interrupt
    BMI $F9BC               ; [30 FF      ] Branch if Minus
    BPL $F9BE               ; [10 FF      ] Branch if Plus
    db $20                      ; Incomplete/data bytes

;--- Patch at file offset $11F9C9 (SNES $D1F9C9) ---
org $D1F9C9

    BRK                     ; [00 FF      ] Software interrupt
    BMI $F9CC               ; [30 FF      ] Branch if Minus
    BMI $F9CE               ; [30 FF      ] Branch if Minus
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $11F9D9 (SNES $D1F9D9) ---
org $D1F9D9

    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $11F9E5 (SNES $D1F9E5) ---
org $D1F9E5

    PHP                     ; [08         ] Push Processor Status
    SBC $10FF10,X           ; [FF 10 FF 10] Subtract with Borrow Absolute Long,X
    db $FF, $08                 ; Incomplete/data bytes

;--- Patch at file offset $11F9F5 (SNES $D1F9F5) ---
org $D1F9F5

    BPL $F9F6               ; [10 FF      ] Branch if Plus
    PHP                     ; [08         ] Push Processor Status
    SBC $10FF08,X           ; [FF 08 FF 10] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11FA11 (SNES $D1FA11) ---
org $D1FA11

    BPL $FA12               ; [10 FF      ] Branch if Plus
    SEC                     ; [38         ] Set Carry Flag
    SBC $10FF38,X           ; [FF 38 FF 10] Subtract with Borrow Absolute Long,X
    SBC $00FF10,X           ; [FF 10 FF 00] Subtract with Borrow Absolute Long,X
    SBC $00FF10,X           ; [FF 10 FF 00] Subtract with Borrow Absolute Long,X
    SBC $4CFF38,X           ; [FF 38 FF 4C] Subtract with Borrow Absolute Long,X
    SBC $0CFF06,X           ; [FF 06 FF 0C] Subtract with Borrow Absolute Long,X
    SBC $00FF10,X           ; [FF 10 FF 00] Subtract with Borrow Absolute Long,X
    db $FF, $10                 ; Incomplete/data bytes

;--- Patch at file offset $11FA51 (SNES $D1FA51) ---
org $D1FA51

    ROL $60FF,X             ; [3E FF 60   ] Rotate Left Absolute,X
    SBC $66FFF6,X           ; [FF F6 FF 66] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11FA63 (SNES $D1FA63) ---
org $D1FA63

    JSR $BCFF               ; [20 FF BC   ] Jump to Subroutine
    SBC $5BFF5A,X           ; [FF 5A FF 5B] Subtract with Borrow Absolute Long,X
    SBC $C6FFCB,X           ; [FF CB FF C6] Subtract with Borrow Absolute Long,X
    SBC $60FF00,X           ; [FF 00 FF 60] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11FA79 (SNES $D1FA79) ---
org $D1FA79

    ROR $6CFF               ; [6E FF 6C   ] Rotate Right Absolute
    SBC $00FF37,X           ; [FF 37 FF 00] Subtract with Borrow Absolute Long,X
    SBC $E0FF60,X           ; [FF 60 FF E0] Subtract with Borrow Absolute Long,X
    SBC $6DFF66,X           ; [FF 66 FF 6D] Subtract with Borrow Absolute Long,X
    SBC $6CFF6E,X           ; [FF 6E FF 6C] Subtract with Borrow Absolute Long,X
    SBC $00FF37,X           ; [FF 37 FF 00] Subtract with Borrow Absolute Long,X
    SBC $0EFF06,X           ; [FF 06 FF 0E] Subtract with Borrow Absolute Long,X
    SBC $D6FF66,X           ; [FF 66 FF D6] Subtract with Borrow Absolute Long,X
    SBC $C6FFE6,X           ; [FF E6 FF C6] Subtract with Borrow Absolute Long,X
    SBC $00FF73,X           ; [FF 73 FF 00] Subtract with Borrow Absolute Long,X
    SBC $02FF00,X           ; [FF 00 FF 02] Subtract with Borrow Absolute Long,X
    db $FF, $04                 ; Incomplete/data bytes

;--- Patch at file offset $11FAB1 (SNES $D1FAB1) ---
org $D1FAB1

    BRK                     ; [00 FF      ] Software interrupt
    ORA ($FF)               ; [12 FF      ] OR A with (DP)
    db $24                      ; Incomplete/data bytes

;--- Patch at file offset $11FAC1 (SNES $D1FAC1) ---
org $D1FAC1

    ADC [$FF]               ; [67 FF      ] Add with Carry [DP]
    TSB $7EFF               ; [0C FF 7E   ] Test and Set Bits Absolute
    SBC $6CFFEC,X           ; [FF EC FF 6C] Subtract with Borrow Absolute Long,X
    SBC $76FF6C,X           ; [FF 6C FF 76] Subtract with Borrow Absolute Long,X
    SBC $36FF00,X           ; [FF 00 FF 36] Subtract with Borrow Absolute Long,X
    db $FF, $76                 ; Incomplete/data bytes

;--- Patch at file offset $11FADD (SNES $D1FADD) ---
org $D1FADD

    TCS                     ; [1B         ] Transfer A to Stack Pointer
    SBC $66FF00,X           ; [FF 00 FF 66] Subtract with Borrow Absolute Long,X
    db $FF, $6E                 ; Incomplete/data bytes

;--- Patch at file offset $11FAEB (SNES $D1FAEB) ---
org $D1FAEB

    ROR $33FF               ; [6E FF 33   ] Rotate Right Absolute
    SBC $60FF00,X           ; [FF 00 FF 60] Subtract with Borrow Absolute Long,X
    SBC $6BFF02,X           ; [FF 02 FF 6B] Subtract with Borrow Absolute Long,X
    SBC $64FFE5,X           ; [FF E5 FF 64] Subtract with Borrow Absolute Long,X
    SBC $7CFF6C,X           ; [FF 6C FF 7C] Subtract with Borrow Absolute Long,X
    SBC $6CFF00,X           ; [FF 00 FF 6C] Subtract with Borrow Absolute Long,X
    SBC $FEFF6C,X           ; [FF 6C FF FE] Subtract with Borrow Absolute Long,X
    SBC $6CFF6C,X           ; [FF 6C FF 6C] Subtract with Borrow Absolute Long,X
    db $FF, $6D                 ; Incomplete/data bytes

;--- Patch at file offset $11FB15 (SNES $D1FB15) ---
org $D1FB15

    ROR $FF                 ; [66 FF      ] Rotate Right DP
    SBC $6EFF               ; [ED FF 6E   ] Subtract with Borrow Absolute
    SBC $77FF6C,X           ; [FF 6C FF 77] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11FB25 (SNES $D1FB25) ---
org $D1FB25

    ROR                     ; [6A         ] Rotate Right Accumulator
    SBC $6DFFEF,X           ; [FF EF FF 6D] Subtract with Borrow Absolute Long,X
    SBC $7DFF6D,X           ; [FF 6D FF 7D] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11FB91 (SNES $D1FB91) ---
org $D1FB91

    RTS                     ; [60         ] Return from Subroutine
    SBC $6EFFE0,X           ; [FF E0 FF 6E] Subtract with Borrow Absolute Long,X
    SBC $67FF63,X           ; [FF 63 FF 67] Subtract with Borrow Absolute Long,X
    SBC $35FF6B,X           ; [FF 6B FF 35] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11FBA5 (SNES $D1FBA5) ---
org $D1FBA5

    ADC $FF,S               ; [63 FF      ] Add with Carry Stack Relative
    CMP [$FF],Y             ; [D7 FF      ] Compare A with [DP],Y
    STP                     ; [DB         ] Stop Processor
    SBC $33FF5B,X           ; [FF 5B FF 33] Subtract with Borrow Absolute Long,X
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    SBC $6BFF02,X           ; [FF 02 FF 6B] Subtract with Borrow Absolute Long,X
    SBC $E4FFD5,X           ; [FF D5 FF E4] Subtract with Borrow Absolute Long,X
    SBC $7CFFCC,X           ; [FF CC FF 7C] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11FC91 (SNES $D1FC91) ---
org $D1FC91

    BPL $FC92               ; [10 FF      ] Branch if Plus
    SEC                     ; [38         ] Set Carry Flag
    SBC $10FF38,X           ; [FF 38 FF 10] Subtract with Borrow Absolute Long,X
    SBC $00FF10,X           ; [FF 10 FF 00] Subtract with Borrow Absolute Long,X
    db $FF, $10                 ; Incomplete/data bytes

;--- Patch at file offset $11FCB1 (SNES $D1FCB1) ---
org $D1FCB1

    SEC                     ; [38         ] Set Carry Flag
    SBC $06FF4C,X           ; [FF 4C FF 06] Subtract with Borrow Absolute Long,X
    SBC $10FF0C,X           ; [FF 0C FF 10] Subtract with Borrow Absolute Long,X
    SBC $10FF00,X           ; [FF 00 FF 10] Subtract with Borrow Absolute Long,X

;--- Patch at file offset $11FD37 (SNES $D1FD37) ---
org $D1FD37

    EOR $FF6FFF             ; [4F FF 6F FF] XOR A with Absolute Long
    TDC                     ; [7B         ] Transfer Direct Page to A
    SBC $C0FF63,X           ; [FF 63 FF C0] Subtract with Borrow Absolute Long,X
    SBC $0EFF06,X           ; [FF 06 FF 0E] Subtract with Borrow Absolute Long,X
    SBC $36FFE6,X           ; [FF E6 FF 36] Subtract with Borrow Absolute Long,X
    SBC $B6FF76,X           ; [FF 76 FF B6] Subtract with Borrow Absolute Long,X
    SBC $00FF6B,X           ; [FF 6B FF 00] Subtract with Borrow Absolute Long,X
    SBC $B6FF7A,X           ; [FF 7A FF B6] Subtract with Borrow Absolute Long,X
    SBC $36FF37,X           ; [FF 37 FF 36] Subtract with Borrow Absolute Long,X
    SBC $36FF36,X           ; [FF 36 FF 36] Subtract with Borrow Absolute Long,X
    db $FF, $66                 ; Incomplete/data bytes

;--- Patch at file offset $11FD65 (SNES $D1FD65) ---
org $D1FD65

    LDA $FF,X               ; [B5 FF      ] Load A from DP,X
    ADC $FF,X               ; [75 FF      ] Add with Carry DP,X
    ADC $FF,X               ; [75 FF      ] Add with Carry DP,X
    ADC $FF,X               ; [75 FF      ] Add with Carry DP,X
    TCD                     ; [5B         ] Transfer A to Direct Page
    SBC $01FF80,X           ; [FF 80 FF 01] Subtract with Borrow Absolute Long,X
    SBC $47FF03,X           ; [FF 03 FF 47] Subtract with Borrow Absolute Long,X
    db $FF, $EB                 ; Incomplete/data bytes

;--- Patch at file offset $11FD87 (SNES $D1FD87) ---
org $D1FD87

    ORA $39FF,Y             ; [19 FF 39   ] OR A with Absolute,Y

;--- Patch at file offset $11FD93 (SNES $D1FD93) ---
org $D1FD93

    BRA $FD94               ; [80 FF      ] Branch Always
    JML [$46FF]             ; [DC FF 46   ] Jump Long Indirect
    SBC $16FF0E,X           ; [FF 0E FF 16] Subtract with Borrow Absolute Long,X
    db $FF, $0D                 ; Incomplete/data bytes

;--- Patch at file offset $11FDA9 (SNES $D1FDA9) ---
org $D1FDA9

    TSC                     ; [3B         ] Transfer Stack Pointer to A

;--- Patch at file offset $11FDD3 (SNES $D1FDD3) ---
org $D1FDD3

    COP #$FF                ; [02 FF      ] Coprocessor interrupt
    XBA                     ; [EB         ] Exchange B and A (high/low bytes)
    SBC $F4FF35,X           ; [FF 35 FF F4] Subtract with Borrow Absolute Long,X
    SBC $6CFFBC,X           ; [FF BC FF 6C] Subtract with Borrow Absolute Long,X

;--- End of patch ---