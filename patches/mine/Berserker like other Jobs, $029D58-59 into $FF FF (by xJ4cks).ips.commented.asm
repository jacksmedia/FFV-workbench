;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=
; Berserker like other Jobs, $029D58-59 into $FF FF (by xJ4cks).ips.commented.asm
;    Disassembled from IPS patch: Berserker like other Jobs, $029D58-59 into $FF FF (by xJ4cks).ips
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

;--- Patch at file offset $029D58 (SNES $C29D58) ---
org $C29D58

    db $FF, $FF                 ; Incomplete/data bytes

;--- End of patch ---