;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; KrileRedBeret (to restore Vanilla BlueMage battle sprites).ips.commented.asm
;    Disassembled from IPS patch: KrileRedBeret (to restore Vanilla BlueMage battle sprites).ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 24 record(s)

;--- Patch at file offset $145E06 (SNES $D45E06) ---
org $D45E06

    AND $007F00,X           ; [3F 00 7F 00] AND A with Absolute Long,X
    db $7F, $00, $E0            ; Incomplete/data bytes

;--- Patch at file offset $145E17 (SNES $D45E17) ---
org $D45E17

    ASL $3F3F               ; [0E 3F 3F   ] Shift Left Absolute
    AND $1F1F3F,X           ; [3F 3F 1F 1F] AND A with Absolute Long,X

;--- Patch at file offset $145E2A (SNES $D45E2A) ---
org $D45E2A

    db $3D                      ; Incomplete/data bytes

;--- Patch at file offset $145E3B (SNES $D45E3B) ---
org $D45E3B

    DEX                     ; [CA         ] Decrement X

;--- Patch at file offset $145EC6 (SNES $D45EC6) ---
org $D45EC6

    AND $007F00,X           ; [3F 00 7F 00] AND A with Absolute Long,X
    db $7F, $00, $E0            ; Incomplete/data bytes

;--- Patch at file offset $145ED7 (SNES $D45ED7) ---
org $D45ED7

    ASL $3F3F               ; [0E 3F 3F   ] Shift Left Absolute
    AND $1F1F3F,X           ; [3F 3F 1F 1F] AND A with Absolute Long,X

;--- Patch at file offset $145EEA (SNES $D45EEA) ---
org $D45EEA

    db $3D                      ; Incomplete/data bytes

;--- Patch at file offset $145EFB (SNES $D45EFB) ---
org $D45EFB

    DEX                     ; [CA         ] Decrement X

;--- Patch at file offset $145FCC (SNES $D45FCC) ---
org $D45FCC

    ORA $003F00,X           ; [1F 00 3F 00] OR A with Absolute Long,X

;--- Patch at file offset $145FDD (SNES $D45FDD) ---
org $D45FDD

    ORA [$1E]               ; [07 1E      ] OR A with [DP]
    db $1E                      ; Incomplete/data bytes

;--- Patch at file offset $146000 (SNES $D46000) ---
org $D46000

    ADC $205F00,X           ; [7F 00 5F 20] Add with Carry Absolute Long,X
    db $A0                      ; Incomplete/data bytes

;--- Patch at file offset $146011 (SNES $D46011) ---
org $D46011

    ROL $3F3F,X             ; [3E 3F 3F   ] Rotate Left Absolute,X
    db $1F, $5F                 ; Incomplete/data bytes

;--- Patch at file offset $146020 (SNES $D46020) ---
org $D46020

    db $5F, $20, $3F            ; Incomplete/data bytes

;--- Patch at file offset $146031 (SNES $D46031) ---
org $D46031

    TAX                     ; [AA         ] Transfer A to X
    CPY $CA                 ; [C4 CA      ] Compare Y with DP

;--- Patch at file offset $1461C6 (SNES $D461C6) ---
org $D461C6

    AND $007F00,X           ; [3F 00 7F 00] AND A with Absolute Long,X
    db $7F, $00, $E0            ; Incomplete/data bytes

;--- Patch at file offset $1461D7 (SNES $D461D7) ---
org $D461D7

    ASL $3F3F               ; [0E 3F 3F   ] Shift Left Absolute
    AND $1F1F3F,X           ; [3F 3F 1F 1F] AND A with Absolute Long,X

;--- Patch at file offset $1461EA (SNES $D461EA) ---
org $D461EA

    db $3F                      ; Incomplete/data bytes

;--- Patch at file offset $1461FB (SNES $D461FB) ---
org $D461FB

    DEX                     ; [CA         ] Decrement X

;--- Patch at file offset $146286 (SNES $D46286) ---
org $D46286

    AND $790E,X             ; [3D 0E 79   ] AND A with Absolute,X
    ASL $7B                 ; [06 7B      ] Shift Left DP
    TSB $F3                 ; [04 F3      ] Test and Set Bits in DP
    TSB $18E7               ; [0C E7 18   ] Test and Set Bits Absolute

;--- Patch at file offset $146297 (SNES $D46297) ---
org $D46297

    ASL $3E3E               ; [0E 3E 3E   ] Shift Left Absolute
    BIT $7D3C,X             ; [3C 3C 7D   ] Test Bits Absolute,X
    JMP ($7B78,X)           ; [7C 78 7B   ] Jump Indirect,X

;--- Patch at file offset $146346 (SNES $D46346) ---
org $D46346

    AND $007F00,X           ; [3F 00 7F 00] AND A with Absolute Long,X
    db $7F, $00, $E0            ; Incomplete/data bytes

;--- Patch at file offset $146357 (SNES $D46357) ---
org $D46357

    ASL $3F3F               ; [0E 3F 3F   ] Shift Left Absolute
    AND $1F1F3F,X           ; [3F 3F 1F 1F] AND A with Absolute Long,X

;--- Patch at file offset $14636A (SNES $D4636A) ---
org $D4636A

    db $3D                      ; Incomplete/data bytes

;--- Patch at file offset $14637B (SNES $D4637B) ---
org $D4637B

    DEX                     ; [CA         ] Decrement X

;--- End of patch ---