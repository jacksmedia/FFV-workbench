;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_condemned.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_condemned.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 3 record(s)

;--- Patch at file offset $022220 (SNES $C22220) ---
org $C22220

    EOR $203C,X             ; [5D 3C 20   ] XOR A with Absolute,X
    ROR $02,X               ; [76 02      ] Rotate Right DP,X
    LDA #$09                ; [A9 09      ] Load A Immediate
    db $4C, $69                 ; Incomplete/data bytes

;--- Patch at file offset $02223D (SNES $C2223D) ---
org $C2223D

    db $0F                      ; Incomplete/data bytes

;--- Patch at file offset $028E6B (SNES $C28E6B) ---
org $C28E6B

    LDA $201C,X             ; [BD 1C 20   ] Load A from Absolute,X
    AND #$04                ; [29 04      ] AND A with Immediate
    BEQ $8E90               ; [F0 1E      ] Branch if Equal
    LDA $0E                 ; [A5 0E      ] Load A from DP
    AND #$04                ; [29 04      ] AND A with Immediate
    BNE $8E90               ; [D0 18      ] Branch if Not Equal
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    LDA $3D75,Y             ; [B9 75 3D   ] Load A from Absolute,Y
    BEQ $8E87               ; [F0 08      ] Branch if Equal
    ASL                     ; [0A         ] Shift Left Accumulator
    BCC $8E84               ; [90 02      ] Branch if Carry Clear
    LDA #$FF                ; [A9 FF      ] Load A Immediate
    STA $3D75,Y             ; [99 75 3D   ] Store A to Absolute,Y
    INY                     ; [C8         ] Increment Y
    INX                     ; [E8         ] Increment X
    CPX #$0B                ; [E0 0B      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    CPX $2280               ; [EC 80 22   ] Compare X with Absolute
    LDA $201C,X             ; [BD 1C 20   ] Load A from Absolute,X
    AND #$08                ; [29 08      ] AND A with Immediate
    BEQ $8EB2               ; [F0 1B      ] Branch if Equal
    LDA $0E                 ; [A5 0E      ] Load A from DP
    AND #$08                ; [29 08      ] AND A with Immediate
    BNE $8EB2               ; [D0 15      ] Branch if Not Equal
    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    LDA $3D75,Y             ; [B9 75 3D   ] Load A from Absolute,Y
    BEQ $8EAB               ; [F0 07      ] Branch if Equal
    LSR                     ; [4A         ] Shift Right Accumulator
    BNE $8EA8               ; [D0 01      ] Branch if Not Equal
    INC                     ; [1A         ] Increment Accumulator
    STA $3D75,Y             ; [99 75 3D   ] Store A to Absolute,Y
    INY                     ; [C8         ] Increment Y
    INX                     ; [E8         ] Increment X
    CPX #$0B                ; [E0 0B      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    db $ED                      ; Incomplete/data bytes

;--- End of patch ---