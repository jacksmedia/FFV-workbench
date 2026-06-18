;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; anti_ff5_ability_menu.ips.commented.asm
;    Disassembled from IPS patch: anti_ff5_ability_menu.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 7 record(s)

;--- Patch at file offset $02B269 (SNES $C2B269) ---
org $C2B269

    db $47                      ; Incomplete/data bytes

;--- Patch at file offset $02B29E (SNES $C2B29E) ---
org $C2B29E

    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $0840               ; [AD 40 08   ] Load A from Absolute
    BNE $B2AD               ; [D0 08      ] Branch if Not Equal
    LDA $0842               ; [AD 42 08   ] Load A from Absolute
    AND #$F8                ; [29 F8      ] AND A with Immediate
    BRK                     ; [00 F0      ] Software interrupt
    CMP [$E2],Y             ; [D7 E2      ] Compare A with [DP],Y
    JSR $D980               ; [20 80 D9   ] Jump to Subroutine
    REP #$20                ; [C2 20      ] Reset Processor Status Bits
    LDA $08F3               ; [AD F3 08   ] Load A from Absolute
    ORA $08F5               ; [0D F5 08   ] OR A with Absolute
    BNE $B2AD               ; [D0 F2      ] Branch if Not Equal
    BRA $B284               ; [80 C7      ] Branch Always

;--- Patch at file offset $02B457 (SNES $C2B457) ---
org $C2B457

    LDA $08F3,X             ; [BD F3 08   ] Load A from Absolute,X

;--- Patch at file offset $02B608 (SNES $C2B608) ---
org $C2B608

    LDA $08F3,X             ; [BD F3 08   ] Load A from Absolute,X

;--- Patch at file offset $02D013 (SNES $C2D013) ---
org $C2D013

    db $11                      ; Incomplete/data bytes

;--- Patch at file offset $02D01B (SNES $C2D01B) ---
org $C2D01B

    db $09                      ; Incomplete/data bytes

;--- Patch at file offset $02D025 (SNES $C2D025) ---
org $C2D025

    LDA $08F3               ; [AD F3 08   ] Load A from Absolute
    ORA $08F5               ; [0D F5 08   ] OR A with Absolute
    BNE $D036               ; [D0 09      ] Branch if Not Equal

;--- End of patch ---