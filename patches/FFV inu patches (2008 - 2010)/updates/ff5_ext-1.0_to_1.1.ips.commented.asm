;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_ext-1.0_to_1.1.ips.commented.asm
;    Disassembled from IPS patch: ff5_ext-1.0_to_1.1.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 8 record(s)

;--- Patch at file offset $0221BA (SNES $C221BA) ---
org $C221BA

    JMP ($21CD,X)           ; [7C CD 21   ] Jump Indirect,X
    LDX $0E                 ; [A6 0E      ] Load X from DP
    STX $3C5D               ; [8E 5D 3C   ] Store X to Absolute
    JSR $0276               ; [20 76 02   ] Jump to Subroutine
    LDA #$09                ; [A9 09      ] Load A Immediate
    JMP $0069               ; [4C 69 00   ] Jump Absolute
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02221D (SNES $C2221D) ---
org $C2221D

    JMP $21BD               ; [4C BD 21   ] Jump Absolute

;--- Patch at file offset $022220 (SNES $C22220) ---
org $C22220

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $0222DE (SNES $C222DE) ---
org $C222DE

    db $2F                      ; Incomplete/data bytes

;--- Patch at file offset $02230B (SNES $C2230B) ---
org $C2230B

    JSR $21BD               ; [20 BD 21   ] Jump to Subroutine
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02230F (SNES $C2230F) ---
org $C2230F

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02252C (SNES $C2252C) ---
org $C2252C

    JMP ($254A,X)           ; [7C 4A 25   ] Jump Indirect,X

;--- Patch at file offset $02252F (SNES $C2252F) ---
org $C2252F

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- End of patch ---