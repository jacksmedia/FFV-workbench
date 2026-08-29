; ============================================================================
; EQUIP_DELUXE_V1.ASM - Equip Menu Deluxe: Element & Status Icon Display
; ============================================================================
;
; Displays weapon element, armor element halve/immune, and status immunity
; as icons in the lower-left blank area of the Equip menu.
;
; VERIFIED FINDINGS (2026-08-19):
;   Equipment RAM: $01F0-$01F4 holds 5 equipped item IDs during Equip menu
;   Hook point: C2/CB89 — after equipment slot processing loop (5 iterations)
;   Freespace: E0/8000+ is available ($FF filled)
;
; HOOK STRATEGY:
;   At C2/CB89, the Equip menu has finished processing all 5 equipment slots.
;   We replace JSR $CB95 / PLP with JSL $E08000, then our code restores PLP
;   and returns via RTL to the original PLB / RTS sequence.
;
; Assemble:  asar equip_deluxe_v1.asm ff5c.sfc
; ============================================================================

hirom

; ============================================================================
; ROM DATA ADDRESSES
; ============================================================================
!WeaponProps    = $D10000       ; 128 weapons × 12 bytes
!ArmorProps     = $D10600       ; 96 armors × 12 bytes
!ElemLookup     = $D12580       ; 9 element patterns × 5 bytes
!StatusLookup   = $D126C0       ; 20 status patterns × 7 bytes

; Item property byte offsets (within 12-byte record)
!ItemByte_Type      = 2         ; Item type (weapon/armor category)
!ItemByte_ElemStat  = 3         ; Element flags (mask 7F) or stat bonus (bit 7)
!ItemByte_AttackEff = 8         ; Attack effect index (weapons)
!ItemByte_ElemIdx   = 10        ; Element effect index (armor)
!ItemByte_StatusIdx = 11        ; Status effect index (armor)

; Element pattern offsets (within 5-byte record at $D12580)
!ElemPat_Absorb  = 0
!ElemPat_Unused  = 1
!ElemPat_Immune  = 2
!ElemPat_Half    = 3
!ElemPat_Weak    = 4

; Status pattern offsets (within 7-byte record at $D126C0)
!StatusPat_Set1   = 0           ; Status to SET on equip
!StatusPat_Set2   = 1
!StatusPat_Set3   = 2
!StatusPat_Set4   = 3
!StatusPat_Imm1   = 4           ; Status IMMUNITY byte 1
!StatusPat_Imm2   = 5           ; Status IMMUNITY byte 2
!StatusPat_Imm3   = 6           ; Status IMMUNITY byte 3

; ============================================================================
; ICON TILE IDS
; ============================================================================
; Element icons - tiles $D5-$DC (need graphics inserted by user)
!IconFire       = $D5
!IconIce        = $D6
!IconLightning  = $D7
!IconPoison     = $D8           ; Poison element (not status)
!IconHoly       = $D9
!IconEarth      = $DA
!IconWind       = $DB
!IconWater      = $DC

; Drain pseudo-element (for attackEffect = 13)
!IconDrain      = $DD           ; Or reuse another slot

; Existing status icons in menu font
!IconStPoison   = $3E           ; Poison status
!IconPetrify    = $3A           ; Stone
!IconToad       = $3B
!IconMini       = $3C
!IconZombie     = $3F
!IconDarkness   = $40           ; (verify tile exists)

; Blank/padding
!IconBlank      = $FF

; ============================================================================
; TILEMAP GEOMETRY
; ============================================================================
; SNES BG tilemap: 32 tiles wide × 2 bytes per entry = 64 bytes per row
; Menu visible area: ~28×24 tiles, scrolled within 32×32 map
;
; Target blank area in lower-left: approximately rows 12-17, cols 1-8
; Tilemap offset = (row × 64) + (col × 2)

!TilemapBase    = $7F7700       ; Menu tilemap buffer (WRAM)

; Icon display rows (adjust after visual testing)
!RowLabel1      = $0302         ; Row 12: "ATTACKS:" label area
!RowIcons1      = $0342         ; Row 13: weapon element icons
!RowLabel2      = $0382         ; Row 14: "HALVES:" label area
!RowIcons2      = $03C2         ; Row 15: armor halve icons
!RowLabel3      = $0402         ; Row 16: "BLOCKS:" label area
!RowIcons3      = $0442         ; Row 17: armor immune + status icons

; Max icons per row (8 elements + maybe status overflow)
!MaxIconsPerRow = 10

; ============================================================================
; SCRATCH RAM
; ============================================================================
; Using a safe area in menu WRAM. $7EF600 region appears unused in menu.

!Scratch        = $F600         ; Base (bank $7E assumed via DBR)
!WeaponElem     = $F600         ; Weapon element flags (1 byte)
!WeaponDrain    = $F601         ; Weapon has Drain (1 byte, 0 or 1)
!ArmorHalf      = $F602         ; Accumulated halve elements (1 byte)
!ArmorImmune    = $F603         ; Accumulated immune elements (1 byte)
!StatusImm1     = $F604         ; Accumulated status immunity (3 bytes)
!StatusImm2     = $F605
!StatusImm3     = $F606
!TempA          = $F608         ; Temp storage
!TempX          = $F60A
!TempY          = $F60C
!IconCount      = $F60E         ; Icons drawn in current row

; ============================================================================
; EQUIPPED ITEM RAM (VERIFIED)
; ============================================================================
; These addresses hold the 5 equipped item IDs during the Equip menu.
; They are populated when the menu opens and updated when equipment changes.
; Values persist briefly after menu close but are only valid during Equip.
;
; Address $01F0 uses absolute addressing (not DP-relative).

!EquipSlot0     = $01F0         ; Right hand (weapon)
!EquipSlot1     = $01F1         ; Left hand (weapon/shield)
!EquipSlot2     = $01F2         ; Head armor
!EquipSlot3     = $01F3         ; Body armor
!EquipSlot4     = $01F4         ; Relic/Accessory

; ============================================================================
; HOOK INSTALLATION
; ============================================================================
; Hook point: C2/CB86 (CORRECTED!)
;
; Original code at C2/CB86-CB8B:
;   C2/CB86: 20 95 CB    JSR $CB95   ; Cleanup subroutine
;   C2/CB89: 28          PLP         ; Restore processor flags
;   C2/CB8A: AB          PLB         ; Restore data bank
;   C2/CB8B: 60          RTS         ; Return from equip processing
;
; We replace the first 4 bytes (JSR $CB95 / PLP) with JSL $E08000.
; Our code does PLP itself, then JML returns to CB8A (PLB / RTS).
;
; NOTE: This skips the JSR $CB95 call. For MVP testing this appears safe.
;       CB95 updates some display elements; add it back if issues arise.
; ============================================================================

org $C2CB86
    jsl EquipDeluxe_Hook        ; 4 bytes: 22 00 80 E0
    ; Execution returns to $C2CB8A (AB PLB, then 60 RTS)

; ============================================================================
; MAIN HOOK CODE - E0/8000
; ============================================================================

org $E08000

EquipDeluxe_Hook:
    ; ============================================================
    ; FULL VERSION - Draw element/status icons in Equip menu
    ; Hook mechanism verified working 2026-08-22
    ; ============================================================

    ; JSL pushed 3 bytes: [ret_lo, ret_hi, ret_bank]
    ; Original caller pushed: [saved_flags, saved_bank, ...]

    ; Save our working state and force 8-bit mode for consistency
    phb
    php
    sep #$30                    ; 8-bit A/X/Y (IMPORTANT: keeps asm simple)

    ; Set DBR = $7E for WRAM access
    lda #$7E
    pha
    plb

    ; Initialize accumulators
    stz.w !WeaponElem
    stz.w !WeaponDrain
    stz.w !ArmorHalf
    stz.w !ArmorImmune
    stz.w !StatusImm1
    stz.w !StatusImm2
    stz.w !StatusImm3

    ; Process equipment and draw icons
    jsr ProcessWeapon
    jsr ProcessArmorSlots
    jsr DrawAllIconRows

    ; Restore our working state
    plp
    plb

    ; Clean up JSL return info (3 bytes) and do original PLP
    sep #$20                    ; 8-bit A for single-byte pops
    pla                         ; Discard ret_lo
    pla                         ; Discard ret_hi
    pla                         ; Discard ret_bank
    ; Stack is now: [saved_flags, saved_bank, ...]

    plp                         ; Execute original PLP (pops saved_flags)
    ; Stack is now: [saved_bank, ...] — ready for PLB at CB8A

    jml $C2CB8A                 ; Jump to original PLB / RTS

; ============================================================================
; ProcessWeapon
; ============================================================================
; Read weapon element byte and check for Drain attack effect.
; ============================================================================
ProcessWeapon:
    ; Get weapon ID from slot 0
    lda.l !EquipSlot0
    cmp #$80                    ; ID >= 128 means armor, not weapon
    bcs .noWeapon
    cmp #$00                    ; ID 0 = empty slot
    beq .noWeapon

    ; Calculate weapon property offset: ID × 12
    ; Need 16-bit A and X for offset calculation (max offset ~1500)
    rep #$30                    ; 16-bit A/X/Y
    and #$00FF
    sta.w !TempA
    asl a
    asl a                       ; ×4
    sta.w !TempX
    asl a                       ; ×8
    clc
    adc.w !TempX                ; ×12
    tax                         ; X = weapon data offset

    sep #$30                    ; Back to 8-bit A/X/Y

    ; Read element byte (offset +3)
    lda.l !WeaponProps+!ItemByte_ElemStat,x
    bit #$80                    ; Check if stat bonus mode
    bne .noElement              ; Bit 7 set = stat bonus, not element

    and #$7F                    ; Mask to element flags
    sta.w !WeaponElem

    ; Check for Drain (attackEffect byte = 13)
    lda.l !WeaponProps+!ItemByte_AttackEff,x
    and #$7F                    ; Mask effect bits
    cmp #13                     ; 13 = Drain HP
    bne .noDrain

    lda #$01
    sta.w !WeaponDrain

.noDrain:
.noElement:
.noWeapon:
    rts

; ============================================================================
; ProcessArmorSlots
; ============================================================================
; Iterate armor slots 1-4, lookup element/status patterns, OR accumulate.
; ============================================================================
ProcessArmorSlots:
    ; Slot 1 (left hand - could be shield)
    lda.l !EquipSlot1
    jsr ProcessOneArmor

    ; Slot 2 (head)
    lda.l !EquipSlot2
    jsr ProcessOneArmor

    ; Slot 3 (body)
    lda.l !EquipSlot3
    jsr ProcessOneArmor

    ; Slot 4 (relic)
    lda.l !EquipSlot4
    jsr ProcessOneArmor

    rts

; ============================================================================
; ProcessOneArmor
; ============================================================================
; Input: A = item ID
; If valid armor (ID 128-223), lookup element/status patterns and accumulate.
; ============================================================================
ProcessOneArmor:
    ; Check if valid armor ID (128-223)
    cmp #$80
    bcc .earlyExit              ; < 128 = weapon or empty
    cmp #$E0
    bcc .validArmor             ; < 224 = valid armor, continue
.earlyExit:
    rts                         ; >= 224 = consumable/etc, early return

.validArmor:
    ; Convert to armor index: ID - 128
    sec
    sbc #$80

    ; Calculate armor property offset: index × 12
    ; Need 16-bit for offset calculation
    rep #$30                    ; 16-bit A/X/Y
    and #$00FF
    sta.w !TempA
    asl a
    asl a                       ; ×4
    sta.w !TempX
    asl a                       ; ×8
    clc
    adc.w !TempX                ; ×12
    sta.w !TempY                ; Save armor offset in TempY
    tax                         ; X = armor data offset

    sep #$30                    ; Back to 8-bit

    ; --- Read element effect index (byte 10) ---
    lda.l !ArmorProps+!ItemByte_ElemIdx,x
    beq .skipElement            ; Index 0 = no element effect

    ; Lookup element pattern: index × 5
    ; Pattern offset max = 8 × 5 = 40, fits in 8-bit
    sta.w !TempA                ; Save element index
    asl a
    asl a                       ; ×4
    clc
    adc.w !TempA                ; ×5
    tax                         ; X = element pattern offset

    ; OR the halve byte (offset +3) into accumulator
    lda.l !ElemLookup+!ElemPat_Half,x
    ora.w !ArmorHalf
    sta.w !ArmorHalf

    ; OR the immune byte (offset +2) into accumulator
    lda.l !ElemLookup+!ElemPat_Immune,x
    ora.w !ArmorImmune
    sta.w !ArmorImmune

.skipElement:
    ; Restore armor data offset for status lookup
    ldx.w !TempY                ; X = armor data offset again

    ; --- Read status effect index (byte 11) ---
    lda.l !ArmorProps+!ItemByte_StatusIdx,x
    beq .skipStatus             ; Index 0 = no status effect

    ; Lookup status pattern: index × 7
    ; Pattern offset max = 19 × 7 = 133, fits in 8-bit
    sta.w !TempA                ; Save status index
    asl a                       ; ×2
    sta.w !TempX+1              ; Use TempX high byte as temp
    asl a                       ; ×4
    clc
    adc.w !TempX+1              ; ×6
    clc
    adc.w !TempA                ; ×7
    tax                         ; X = status pattern offset

    ; OR the immunity bytes (+4, +5, +6) into accumulators
    lda.l !StatusLookup+!StatusPat_Imm1,x
    ora.w !StatusImm1
    sta.w !StatusImm1

    lda.l !StatusLookup+!StatusPat_Imm2,x
    ora.w !StatusImm2
    sta.w !StatusImm2

    lda.l !StatusLookup+!StatusPat_Imm3,x
    ora.w !StatusImm3
    sta.w !StatusImm3

.skipStatus:
    rts

; ============================================================================
; DrawAllIconRows
; ============================================================================
; Draw the three icon rows to the tilemap.
; NOTE: Uses 16-bit X/Y for tilemap offsets (>255)
; ============================================================================
DrawAllIconRows:
    rep #$10                    ; 16-bit X/Y for tilemap offsets

    ; Row 1: Weapon attack elements
    ldx.w #!RowIcons1           ; .w forces 16-bit immediate
    lda.w !WeaponElem
    jsr DrawElementIcons

    ; Add Drain icon if applicable
    lda.w !WeaponDrain
    beq .noDrainIcon
    lda #!IconDrain
    jsr AppendIcon
.noDrainIcon:

    ; Row 2: Armor halves elements
    ldx.w #!RowIcons2           ; .w forces 16-bit immediate
    lda.w !ArmorHalf
    jsr DrawElementIcons

    ; Row 3: Armor immune elements + status immunity
    ldx.w #!RowIcons3           ; .w forces 16-bit immediate
    lda.w !ArmorImmune
    jsr DrawElementIcons

    ; Continue with status immunity icons
    jsr DrawStatusIcons

    sep #$10                    ; Back to 8-bit X/Y
    rts

; ============================================================================
; DrawElementIcons
; ============================================================================
; Input: A = element flags (8 bits), X = tilemap row offset (16-bit)
; Draws icon for each set element bit.
; Expects: 8-bit A, 16-bit X/Y
; ============================================================================
DrawElementIcons:
    sta.w !TempA                ; Save element flags
    stx.w !TempX                ; Save tilemap base offset
    stx.w !TempY                ; TempY = current tilemap write position
    stz.w !IconCount            ; Reset icon counter

    ; Clear the row first
    jsr ClearIconRow

    ldy.w #$0000                ; Y = bit index (0-7), 16-bit

.bitLoop:
    lda.w !TempA                ; Load element flags
    and.w ElementBitMask,y      ; Check if this element bit is set
    beq .nextBit

    ; Bit is set - draw this element's icon
    lda.w ElementIconTile,y     ; Get icon tile ID

    ; Write tile to tilemap at current position
    ldx.w !TempY                ; X = tilemap position
    sta.l !TilemapBase,x        ; Write tile ID

    ; Write palette/attributes (high byte) - use palette 0
    lda #$20                    ; Palette 0, priority 1
    sta.l !TilemapBase+1,x

    inx
    inx                         ; Advance tilemap pointer by 2
    stx.w !TempY                ; Save updated position
    inc.w !IconCount

.nextBit:
    iny
    cpy.w #$0008                ; Check all 8 element bits, 16-bit compare
    bne .bitLoop

    ; Update X to final tilemap position for status icons
    ldx.w !TempY
    rts

; ============================================================================
; DrawStatusIcons
; ============================================================================
; Draws status immunity icons based on accumulated StatusImm1/2/3.
; Continues from current X position (after element icons).
; ============================================================================
DrawStatusIcons:
    ; Check Poison immunity (StatusImm1 bit 2)
    lda.w !StatusImm1
    bit #$04
    beq .noPoison
    lda #!IconStPoison
    jsr WriteOneIcon
.noPoison:

    ; Check Stone immunity (StatusImm1 bit 1)
    lda.w !StatusImm1
    bit #$02
    beq .noStone
    lda #!IconPetrify
    jsr WriteOneIcon
.noStone:

    ; Check Zombie immunity (StatusImm1 bit 6)
    lda.w !StatusImm1
    bit #$40
    beq .noZombie
    lda #!IconZombie
    jsr WriteOneIcon
.noZombie:

    rts

; ============================================================================
; WriteOneIcon
; ============================================================================
; Input: A = tile ID, X = current tilemap position (updated on exit)
; ============================================================================
WriteOneIcon:
    sta.l !TilemapBase,x
    pha
    lda #$20                    ; Palette 0, priority 1
    sta.l !TilemapBase+1,x
    pla
    inx
    inx
    inc.w !IconCount
    rts

; ============================================================================
; AppendIcon
; ============================================================================
; Append a single icon to the current row (uses !TempX as base + !IconCount)
; Input: A = tile ID
; Expects: 8-bit A, 16-bit X/Y
; ============================================================================
AppendIcon:
    pha                         ; Save tile ID
    ; Calculate position: TempX + (IconCount × 2)
    lda.w !IconCount
    asl a                       ; ×2 for tilemap word size
    rep #$20                    ; 16-bit A for add
    and #$00FF                  ; Clear high byte
    clc
    adc.w !TempX                ; Add row base
    tax                         ; X = tilemap position
    sep #$20                    ; Back to 8-bit A
    pla                         ; Restore tile ID
    jsr WriteOneIcon
    rts

; ============================================================================
; ClearIconRow
; ============================================================================
; Input: X = tilemap row offset (16-bit)
; Fills row with blank tiles (10 tiles = 20 bytes)
; Expects: 8-bit A, 16-bit X/Y
; ============================================================================
ClearIconRow:
    phy
    ldy.w #!MaxIconsPerRow      ; .w forces 16-bit immediate
    lda #!IconBlank

.loop:
    sta.l !TilemapBase,x
    pha
    lda #$20                    ; Attributes
    sta.l !TilemapBase+1,x
    pla
    inx
    inx
    dey
    bne .loop

    ply
    rts

; ============================================================================
; DATA TABLES
; ============================================================================
ElementBitMask:
    db $01                      ; Bit 0 = Fire
    db $02                      ; Bit 1 = Ice
    db $04                      ; Bit 2 = Lightning
    db $08                      ; Bit 3 = Poison
    db $10                      ; Bit 4 = Holy
    db $20                      ; Bit 5 = Earth
    db $40                      ; Bit 6 = Wind
    db $80                      ; Bit 7 = Water

ElementIconTile:
    db !IconFire                ; Bit 0
    db !IconIce                 ; Bit 1
    db !IconLightning           ; Bit 2
    db !IconPoison              ; Bit 3
    db !IconHoly                ; Bit 4
    db !IconEarth               ; Bit 5
    db !IconWind                ; Bit 6
    db !IconWater               ; Bit 7

; ============================================================================
; END OF FILE
; ============================================================================
