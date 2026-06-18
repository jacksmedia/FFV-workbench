;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_sandworm.ips.commented.asm
;    Disassembled from IPS patch: ff5_sandworm.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 2 record(s)

;--- Patch at file offset $02761B (SNES $C2761B) ---
org $C2761B

    TDC                     ; [7B         ] Transfer Direct Page to A
    TAX                     ; [AA         ] Transfer A to X
    STX $3EC9               ; [8E C9 3E   ] Store X to Absolute
    STA $3ECB               ; [8D CB 3E   ] Store A to Absolute
    INC                     ; [1A         ] Increment Accumulator
    STA $3EC6               ; [8D C6 3E   ] Store A to Absolute
    STA $3EC7               ; [8D C7 3E   ] Store A to Absolute
    db $8D                      ; Incomplete/data bytes

;--- Patch at file offset $027657 (SNES $C27657) ---
org $C27657

    EOR #$FD                ; [49 FD      ] XOR A with Immediate
    STA $7C0A               ; [8D 0A 7C   ] Store A to Absolute
    ORA #$E3                ; [09 E3      ] OR A with Immediate
    db $8D, $09                 ; Incomplete/data bytes

;--- End of patch ---