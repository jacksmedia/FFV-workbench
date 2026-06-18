;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_fast_menu_scroll.ips.commented.asm
;    Disassembled from IPS patch: ff5_fast_menu_scroll.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 5 record(s)

;--- Patch at file offset $00F22E (SNES $C0F22E) ---
org $C0F22E

    PHP                     ; [08         ] Push Processor Status
    BRK                     ; [00 F8      ] Software interrupt
    SBC $08FFF8,X           ; [FF F8 FF 08] Subtract with Borrow Absolute Long,X
    BRK                     ; [00 FC      ] Software interrupt
    SBC $040004,X           ; [FF 04 00 04] Subtract with Borrow Absolute Long,X
    BRK                     ; [00 FC      ] Software interrupt

;--- Patch at file offset $02A6D4 (SNES $C2A6D4) ---
org $C2A6D4

    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02FD7B (SNES $C2FD7B) ---
org $C2FD7B

    ORA $F0,S               ; [03 F0      ] OR A with Stack Relative
    ASL $02C9               ; [0E C9 02   ] Shift Left Absolute
    BEQ $FD94               ; [F0 12      ] Branch if Equal
    CMP #$01                ; [C9 01      ] Compare A Immediate
    BEQ $FD90               ; [F0 0A      ] Branch if Equal
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation
    NOP                     ; [EA         ] No Operation

;--- Patch at file offset $02FE3B (SNES $C2FE3B) ---
org $C2FE3B

    db $03                      ; Incomplete/data bytes

;--- Patch at file offset $02FF8F (SNES $C2FF8F) ---
org $C2FF8F

    BPL $FF94               ; [10 03      ] Branch if Plus

;--- End of patch ---