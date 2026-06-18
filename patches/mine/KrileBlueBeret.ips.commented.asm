;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; KrileBlueBeret.ips.commented.asm
;    Disassembled from IPS patch: KrileBlueBeret.ips
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

    AND ($0E),Y             ; [31 0E      ] AND A with (DP),Y
    RTI                     ; [40         ] Return from Interrupt
    AND $FF3F40,X           ; [3F 40 3F FF] AND A with Absolute Long,X

;--- Patch at file offset $145E17 (SNES $D45E17) ---
org $D45E17

    BRK                     ; [00 3F      ] Software interrupt
    BRK                     ; [00 3F      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $145E2A (SNES $D45E2A) ---
org $D45E2A

    db $FD                      ; Incomplete/data bytes

;--- Patch at file offset $145E3B (SNES $D45E3B) ---
org $D45E3B

    ASL                     ; [0A         ] Shift Left Accumulator

;--- Patch at file offset $145EC6 (SNES $D45EC6) ---
org $D45EC6

    AND ($0E),Y             ; [31 0E      ] AND A with (DP),Y
    RTI                     ; [40         ] Return from Interrupt
    AND $FF3F40,X           ; [3F 40 3F FF] AND A with Absolute Long,X

;--- Patch at file offset $145ED7 (SNES $D45ED7) ---
org $D45ED7

    BRK                     ; [00 3F      ] Software interrupt
    BRK                     ; [00 3F      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $145EEA (SNES $D45EEA) ---
org $D45EEA

    db $FD                      ; Incomplete/data bytes

;--- Patch at file offset $145EFB (SNES $D45EFB) ---
org $D45EFB

    ASL                     ; [0A         ] Shift Left Accumulator

;--- Patch at file offset $145FCC (SNES $D45FCC) ---
org $D45FCC

    CLC                     ; [18         ] Clear Carry Flag
    ORA [$21]               ; [07 21      ] OR A with [DP]
    db $1E                      ; Incomplete/data bytes

;--- Patch at file offset $145FDD (SNES $D45FDD) ---
org $D45FDD

    BRK                     ; [00 1E      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $146000 (SNES $D46000) ---
org $D46000

    EOR ($3E,X)             ; [41 3E      ] XOR A with (DP,X)
    RTS                     ; [60         ] Return from Subroutine
    db $3F, $BF                 ; Incomplete/data bytes

;--- Patch at file offset $146011 (SNES $D46011) ---
org $D46011

    BRK                     ; [00 3F      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    RTI                     ; [40         ] Return from Interrupt

;--- Patch at file offset $146020 (SNES $D46020) ---
org $D46020

    db $7F, $20, $FF            ; Incomplete/data bytes

;--- Patch at file offset $146031 (SNES $D46031) ---
org $D46031

    TXA                     ; [8A         ] Transfer X to A
    CPY $0A                 ; [C4 0A      ] Compare Y with DP

;--- Patch at file offset $1461C6 (SNES $D461C6) ---
org $D461C6

    AND ($0E),Y             ; [31 0E      ] AND A with (DP),Y
    RTI                     ; [40         ] Return from Interrupt
    AND $FF3F40,X           ; [3F 40 3F FF] AND A with Absolute Long,X

;--- Patch at file offset $1461D7 (SNES $D461D7) ---
org $D461D7

    BRK                     ; [00 3F      ] Software interrupt
    BRK                     ; [00 3F      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $1461EA (SNES $D461EA) ---
org $D461EA

    db $FF                      ; Incomplete/data bytes

;--- Patch at file offset $1461FB (SNES $D461FB) ---
org $D461FB

    ASL                     ; [0A         ] Shift Left Accumulator

;--- Patch at file offset $146286 (SNES $D46286) ---
org $D46286

    AND $3E470E,X           ; [3F 0E 47 3E] AND A with Absolute Long,X
    EOR [$3C]               ; [47 3C      ] XOR A with [DP]
    STA $789F7C             ; [8F 7C 9F 78] Store A to Absolute Long

;--- Patch at file offset $146297 (SNES $D46297) ---
org $D46297

    TSB $003E               ; [0C 3E 00   ] Test and Set Bits Absolute
    BIT $7D00,X             ; [3C 00 7D   ] Test Bits Absolute,X
    BRK                     ; [00 78      ] Software interrupt
    db $03                      ; Incomplete/data bytes

;--- Patch at file offset $146346 (SNES $D46346) ---
org $D46346

    AND ($0E),Y             ; [31 0E      ] AND A with (DP),Y
    RTI                     ; [40         ] Return from Interrupt
    AND $FF3F40,X           ; [3F 40 3F FF] AND A with Absolute Long,X

;--- Patch at file offset $146357 (SNES $D46357) ---
org $D46357

    BRK                     ; [00 3F      ] Software interrupt
    BRK                     ; [00 3F      ] Software interrupt
    BRK                     ; [00 1F      ] Software interrupt
    db $00                      ; Incomplete/data bytes

;--- Patch at file offset $14636A (SNES $D4636A) ---
org $D4636A

    db $FD                      ; Incomplete/data bytes

;--- Patch at file offset $14637B (SNES $D4637B) ---
org $D4637B

    ASL                     ; [0A         ] Shift Left Accumulator

;--- End of patch ---