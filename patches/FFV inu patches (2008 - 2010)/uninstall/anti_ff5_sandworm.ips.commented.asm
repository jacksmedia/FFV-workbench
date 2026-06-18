;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_sandworm.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_sandworm.ips
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

    STZ $3EC9               ; [9C C9 3E   ] Store Zero to Absolute
    STZ $3ECA               ; [9C CA 3E   ] Store Zero to Absolute
    STZ $3ECB               ; [9C CB 3E   ] Store Zero to Absolute
    INC $3EC6               ; [EE C6 3E   ] Increment Absolute
    INC $3EC7               ; [EE C7 3E   ] Increment Absolute
    db $EE                      ; Incomplete/data bytes

;--- Patch at file offset $027657 (SNES $C27657) ---
org $C27657

    LDA #$02                ; [A9 02      ] Load A Immediate
    STA $7C09               ; [8D 09 7C   ] Store A to Absolute
    LDA #$FD                ; [A9 FD      ] Load A Immediate
    db $8D, $0A                 ; Incomplete/data bytes

;--- End of patch ---