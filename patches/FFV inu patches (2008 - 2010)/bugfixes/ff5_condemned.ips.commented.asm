;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_condemned.ips.commented.asm
;    Disassembled from IPS patch: ff5_condemned.ips
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

    LDA $201D,X             ; [BD 1D 20   ] Load A from Absolute,X
    AND #$EF                ; [29 EF      ] AND A with Immediate
    STA $201D,X             ; [9D 1D 20   ] Store A to Absolute,X
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02223D (SNES $C2223D) ---
org $C2223D

    db $E2                      ; Incomplete/data bytes

;--- Patch at file offset $028E6B (SNES $C28E6B) ---
org $C28E6B

    LDA $0E                 ; [A5 0E      ] Load A from DP
    EOR #$FF                ; [49 FF      ] XOR A with Immediate
    AND $201C,X             ; [3D 1C 20   ] AND A with Absolute,X
    LDX #$0B                ; [A2 0B      ] Load X Immediate
    BRK                     ; [00 89      ] Software interrupt
    TSB $D0                 ; [04 D0      ] Test and Set Bits in DP
    ORA $89                 ; [05 89      ] OR A with Direct Page
    PHP                     ; [08         ] Push Processor Status
    BNE $8EA2               ; [D0 25      ] Branch if Not Equal
    RTS                     ; [60         ] Return from Subroutine
    LDA $3D75,Y             ; [B9 75 3D   ] Load A from Absolute,Y
    BEQ $8E96               ; [F0 13      ] Branch if Equal
    ASL                     ; [0A         ] Shift Left Accumulator
    BCC $8E88               ; [90 02      ] Branch if Carry Clear
    LDA #$FF                ; [A9 FF      ] Load A Immediate
    CPX #$08                ; [E0 08      ] Compare X Immediate
    BRK                     ; [00 D0      ] Software interrupt
    ASL $C9                 ; [06 C9      ] Shift Left DP
    ADC $90,S               ; [63 90      ] Add with Carry Stack Relative
    COP #$A9                ; [02 A9      ] Coprocessor interrupt
    ADC $99,S               ; [63 99      ] Add with Carry Stack Relative
    ADC $3D,X               ; [75 3D      ] Add with Carry DP,X
    INY                     ; [C8         ] Increment Y
    DEX                     ; [CA         ] Decrement X
    BNE $8E7E               ; [D0 E4      ] Branch if Not Equal
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    LDA $3D75,Y             ; [B9 75 3D   ] Load A from Absolute,Y
    BEQ $8EAE               ; [F0 07      ] Branch if Equal
    LSR                     ; [4A         ] Shift Right Accumulator
    BNE $8EAB               ; [D0 01      ] Branch if Not Equal
    INC                     ; [1A         ] Increment Accumulator
    STA $3D75,Y             ; [99 75 3D   ] Store A to Absolute,Y
    INY                     ; [C8         ] Increment Y
    DEX                     ; [CA         ] Decrement X
    BNE $8EA2               ; [D0 F0      ] Branch if Not Equal

;--- End of patch ---