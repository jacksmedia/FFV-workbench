;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_hide_reveal.ips.commented.asm
;    Disassembled from IPS patch: ff5_hide_reveal.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 4 record(s)

;--- Patch at file offset $0212AE (SNES $C212AE) ---
org $C212AE

    BRA $129B               ; [80 EB      ] Branch Always
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $0212FE (SNES $C212FE) ---
org $C212FE

    LDA #$08                ; [A9 08      ] Load A Immediate
    STA $3768,X             ; [9D 68 37   ] Store A to Absolute,X
    BRA $12F0               ; [80 EB      ] Branch Always

;--- Patch at file offset $02108F (SNES $C2108F) ---
org $C2108F

    BRA $107C               ; [80 EB      ] Branch Always
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $0293DE (SNES $C293DE) ---
org $C293DE

    BRA $93CB               ; [80 EB      ] Branch Always
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- End of patch ---