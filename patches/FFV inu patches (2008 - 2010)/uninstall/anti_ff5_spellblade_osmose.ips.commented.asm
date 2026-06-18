;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_spellblade_osmose.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_spellblade_osmose.ips
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

;--- Patch at file offset $028967 (SNES $C28967) ---
org $C28967

    STA $7B75               ; [8D 75 7B   ] Store A to Absolute
    STA $7B77               ; [8D 77 7B   ] Store A to Absolute
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    RTS                     ; [60         ] Return from Subroutine

;--- Patch at file offset $02897B (SNES $C2897B) ---
org $C2897B

    STA $7B73               ; [8D 73 7B   ] Store A to Absolute
    STA $7B79               ; [8D 79 7B   ] Store A to Absolute
    TDC                     ; [7B         ] Transfer Direct Page to A
    SEP #$20                ; [E2 20      ] Set Processor Status Bits
    RTS                     ; [60         ] Return from Subroutine

;--- End of patch ---