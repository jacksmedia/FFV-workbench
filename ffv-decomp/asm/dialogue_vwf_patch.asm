; ============================================================================
; DIALOGUE_VWF_PATCH.ASM - Enable Variable Width for 1bpp Dialogue Font
; ============================================================================
;
; QUICK WIN: The 1bpp dialogue VWF infrastructure already exists, but the
; cursor advance is hardcoded to 13 pixels at C1/2DA4.
;
; The width table at $203225 already has proper variable widths:
;   - 'i', 'l', 'I' = 3px
;   - 'M', 'W' = 11px
;   - Standard letters = 6-7px
;
; This patch replaces the hardcoded ADC #$0D with a width table lookup.
;
; Problem: The replacement instruction is 4 bytes but we only have 2.
; Solution: Jump to free space, do the lookup, return.
;
; Assemble with: asar dialogue_vwf_patch.asm ff5c.sfc
; ============================================================================

hirom

; ============================================================================
; HOOK: Replace hardcoded width with JSL to lookup routine in Bank D1
; ============================================================================
;
; Original code at C1/2DA0-2DA8 (10 bytes):
;   C1/2DA0: AD 07 F5     LDA $F507      ; Load current pixel position
;   C1/2DA3: 18           CLC
;   C1/2DA4: 69 0D        ADC #$0D       ; Add FIXED 13 pixels <-- PROBLEM
;   C1/2DA6: 8D 07 F5     STA $F507      ; Store new position
;   C1/2DA9: FA           PLX
;
; New code (10 bytes - exact fit):
;   C1/2DA0: 22 XX XX D1  JSL $D1XXXX    ; Long call to lookup (4 bytes)
;   C1/2DA4: 8D 07 F5     STA $F507      ; Store new position (3 bytes)
;   C1/2DA7: EA EA        NOP NOP        ; Padding (2 bytes)
;   C1/2DA9: FA           PLX            ; Unchanged

org $C12DA0
    JSL VWF_WidthLookup     ; 4 bytes: 22 19 21 D1
    STA $F507               ; 3 bytes: 8D 07 F5
    NOP                     ; 1 byte padding
    NOP                     ; 1 byte padding
    ; PLX follows at 2DA9 - unchanged

; ============================================================================
; VWF_WidthLookup - Look up character width and add to cursor
; ============================================================================
; Located in Bank D1 free space at $D1:2119 (866 bytes available)
;
; Called via JSL from C1/2DA0
; Input:  $7E = character index (char_code - $20, set at C1/2CF7)
; Output: A = new cursor position (cursor + width)
; ============================================================================

org $D12119     ; Free space: 866 bytes at file offset $112119

VWF_WidthLookup:
    PHX                     ; Save X (used by caller's loop)

    ; Load character index from $7E
    LDX $7E                 ; X = character index (char - $20)

    ; Load width from table at $203225
    ; Table is indexed by (char - $20), so X is correct
    LDA $203225,X           ; A = width for this character

    ; Add to current cursor position
    CLC
    ADC $F507               ; A = cursor + width

    PLX                     ; Restore X
    RTL                     ; Return long (4 bytes return address)

; ============================================================================
; NOTES
; ============================================================================
;
; The width table at $203225 contains values like:
;   - Index $00 (space): typically 3-4px
;   - Index $48 (I): 3px
;   - Index $4C (M): 11px
;   - Index $56 (W): 11px
;   - Most letters: 6-7px
;
; Total patch size: ~15 bytes (6 at hook site, 9 at free space)
;
; To test:
;   1. Save ROM backup
;   2. Apply patch with asar
;   3. Start game, trigger dialogue or battle menu
;   4. Observe character spacing - should be variable now
;
; Known issues:
;   - Text may overflow dialogue box if using longer strings
;   - May need to adjust line wrapping logic
;   - Battle menu positioning may need adjustment
;
; ============================================================================
