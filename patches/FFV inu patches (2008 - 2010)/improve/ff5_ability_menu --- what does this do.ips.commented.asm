;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_ability_menu --- what does this do.ips.commented.asm
;    Disassembled from IPS patch: ff5_ability_menu --- what does this do.ips
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

    db $34                      ; Incomplete/data bytes

;--- Patch at file offset $02B29E (SNES $C2B29E) ---
org $C2B29E

    LDA $0842               ; [AD 42 08   ] Load A from Absolute
    AND #$F8                ; [29 F8      ] AND A with Immediate
    ORA $0840               ; [0D 40 08   ] OR A with Absolute
    ORA $0841               ; [0D 41 08   ] OR A with Absolute
    BNE $B28A               ; [D0 DF      ] Branch if Not Equal
    BRA $B284               ; [80 D7      ] Branch Always
    LDA $0501,Y             ; [B9 01 05   ] Load A from Absolute,Y
    CMP #$14                ; [C9 14      ] Compare A Immediate
    BNE $B2B7               ; [D0 03      ] Branch if Not Equal
    LDA #$01                ; [A9 01      ] Load A Immediate
    RTS                     ; [60         ] Return from Subroutine
    LDA $08F3,X             ; [BD F3 08   ] Load A from Absolute,X
    RTS                     ; [60         ] Return from Subroutine
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02B457 (SNES $C2B457) ---
org $C2B457

    JSR $B2AD               ; [20 AD B2   ] Jump to Subroutine

;--- Patch at file offset $02B608 (SNES $C2B608) ---
org $C2B608

    JSR $B2AD               ; [20 AD B2   ] Jump to Subroutine

;--- Patch at file offset $02D013 (SNES $C2D013) ---
org $C2D013

    db $22                      ; Incomplete/data bytes

;--- Patch at file offset $02D01B (SNES $C2D01B) ---
org $C2D01B

    INC                     ; [1A         ] Increment Accumulator

;--- Patch at file offset $02D025 (SNES $C2D025) ---
org $C2D025

    BRA $D02D               ; [80 06      ] Branch Always
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- End of patch ---