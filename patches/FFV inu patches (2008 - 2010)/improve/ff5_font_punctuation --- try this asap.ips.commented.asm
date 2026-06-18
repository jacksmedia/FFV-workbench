;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; ff5_font_punctuation --- try this asap.ips.commented.asm
;    Disassembled from IPS patch: ff5_font_punctuation --- try this asap.ips
;    AUTO-GENERATED - May require manual review
;
; NOTE: This disassembly assumes:
;   - HiROM memory mapping (FFV uses HiROM)
;   - 8-bit accumulator/index modes (default)
;   - Code (not data) at patched locations
;   - Some bytes may actually be data, not code
;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=

hirom

; Patch contains 1 record(s)

;--- Patch at file offset $11F410 (SNES $D1F410) ---
org $D1F410

    SBC $6CB700,X           ; [FF 00 B7 6C] Subtract with Borrow Absolute Long,X
    STP                     ; [DB         ] Stop Processor
    JMP ($48FF)             ; [6C FF 48   ] Jump Indirect
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    SBC $60FF00,X           ; [FF 00 FF 60] Subtract with Borrow Absolute Long,X
    SBC $40FF20,X           ; [FF 20 FF 40] Subtract with Borrow Absolute Long,X
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    SBC $60FF60,X           ; [FF 60 FF 60] Subtract with Borrow Absolute Long,X
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    SBC $60FF00,X           ; [FF 00 FF 60] Subtract with Borrow Absolute Long,X
    SBC $40FF20,X           ; [FF 20 FF 40] Subtract with Borrow Absolute Long,X
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    SBC $54FF00,X           ; [FF 00 FF 54] Subtract with Borrow Absolute Long,X
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    SBC $30FF30,X           ; [FF 30 FF 30] Subtract with Borrow Absolute Long,X
    SBC $30FF00,X           ; [FF 00 FF 30] Subtract with Borrow Absolute Long,X
    SBC $20FF10,X           ; [FF 10 FF 20] Subtract with Borrow Absolute Long,X
    SBC $08FF00,X           ; [FF 00 FF 08] Subtract with Borrow Absolute Long,X
    SBC $7CFF28,X           ; [FF 28 FF 7C] Subtract with Borrow Absolute Long,X
    SBC $7CFF28,X           ; [FF 28 FF 7C] Subtract with Borrow Absolute Long,X
    SBC $20FF28,X           ; [FF 28 FF 20] Subtract with Borrow Absolute Long,X
    SBC $0CFF00,X           ; [FF 00 FF 0C] Subtract with Borrow Absolute Long,X
    SBC [$18],Y             ; [F7 18      ] Subtract with Borrow [DP],Y
    SBC $30FF30,X           ; [FF 30 FF 30] Subtract with Borrow Absolute Long,X
    SBC $18F730,X           ; [FF 30 F7 18] Subtract with Borrow Absolute Long,X
    SBC $00FF0C,X           ; [FF 0C FF 00] Subtract with Borrow Absolute Long,X
    SBC $30DF60,X           ; [FF 60 DF 30] Subtract with Borrow Absolute Long,X
    SBC $18FF18,X           ; [FF 18 FF 18] Subtract with Borrow Absolute Long,X
    SBC $30DF18,X           ; [FF 18 DF 30] Subtract with Borrow Absolute Long,X
    SBC $00FF60,X           ; [FF 60 FF 00] Subtract with Borrow Absolute Long,X
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    SBC $92FF60,X           ; [FF 60 FF 92] Subtract with Borrow Absolute Long,X
    SBC $00FF0C,X           ; [FF 0C FF 00] Subtract with Borrow Absolute Long,X
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    SBC $00FF00,X           ; [FF 00 FF 00] Subtract with Borrow Absolute Long,X
    SBC $00FF3C,X           ; [FF 3C FF 00] Subtract with Borrow Absolute Long,X
    SBC $00FF3C,X           ; [FF 3C FF 00] Subtract with Borrow Absolute Long,X
    db $FF                      ; Incomplete/data bytes

;--- End of patch ---