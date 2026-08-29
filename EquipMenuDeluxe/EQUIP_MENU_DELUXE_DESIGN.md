# Equip Menu Deluxe — Design Document

**Goal:** Add element/status info display to the blank 9 rows in the lower-left of FFV's Equip menu.

## Data Structures Located

### Element Bits (1 byte, 8 elements)
```
Bit 0: Fire      Bit 4: Holy
Bit 1: Ice       Bit 5: Earth  
Bit 2: Lightning Bit 6: Wind
Bit 3: Poison    Bit 7: Water
```

**Note:** FFV has 8 elements. There is NO Dark or Drain element in vanilla FFV — those don't exist as element flags. The user's proposed "Drain" icon would need to be a special-case display for weapons with HP Drain attack effect (attackEffect = 13), not an element.

### Weapon Properties ($D10000, 128 entries × 12 bytes)
| Byte | Mask | Field |
|------|------|-------|
| 3 | 0x80 | Bonus Type: 0=Element, 1=Stat |
| 3 | 0x7F | **Element flags** (if bit 7=0) |
| 8 | 0x7F | Attack Effect index |

For MVP, we read **byte 3** directly for weapon element flags.

Weapon status-on-hit is complex (requires attackEffect cross-ref to attackProperties at $D10B80). Defer to Phase 2.

### Armor Properties ($D10600, 96 entries × 12 bytes)
| Byte | Mask | Field |
|------|------|-------|
| 10 | 0xFF | **Element Effect index** (0-8) → lookup at $D12580 |
| 11 | 0xFF | **Status Effect index** (0-19) → lookup at $D126C0/$D126C4 |

### Element Effect Lookup Table ($D12580)
**5 bytes per entry, 9 entries = 45 bytes total**

| Offset | Field |
|--------|-------|
| +0 | Absorb elements |
| +1 | (unused/evade?) |
| +2 | **Immune elements (nullify)** |
| +3 | **Half elements** |
| +4 | Weak elements |

**Pattern data (VERIFIED from ROM at $D12580):**
```
Entry | Absorb | Immune | Half  | Weak  | Notes
------|--------|--------|-------|-------|------------------
  0   |  0x00  |  0x00  | 0x00  | 0x00  | None
  1   |  0x00  |  0x00  | 0x04  | 0x00  | Diamond Gear: halves Lightning
  2   |  0x00  |  0x00  | 0xFF  | 0x00  | Halve All: halves all 8 elements
  3   |  0x00  |  0x08  | 0x00  | 0x00  | Angel Suit: immune Poison
  4   |  0x01  |  0x02  | 0x00  | 0x80  | Flame Ring: absorb Fire, immune Ice, weak Water
  5   |  0x80  |  0x01  | 0x00  | 0x04  | Coral Ring: absorb Water, immune Fire, weak Lightning
  6   |  0x08  |  0x00  | 0x02  | 0x11  | Bone Mail: absorb Poison, half Ice, weak Fire+Holy
  7   |  0x01  |  0x00  | 0x00  | 0x00  | Flame Shield: absorb Fire only
  8   |  0x02  |  0x00  | 0x00  | 0x00  | Ice Shield: absorb Ice only
```
Note: Byte 1 in ROM is unused (always 0x00). Order is: Absorb, unused, Immune, Half, Weak.

### Status Immunity Lookup Table ($D126C4)
**3 bytes per entry (status immunity portion), 20 entries**

Starting at $D126C0 (full record is 7 bytes):
- Bytes 0-3: Status to SET on equip
- Bytes 4-6: **Status IMMUNITY** flags (24 status bits)

**Status bits (3 bytes = 24 bits):**
```
Byte 0 (statuses 0-7):
  0=Dead, 1=Stone, 2=Toad, 3=Mini, 4=Float?, 5=Poison, 6=Zombie, 7=Darkness

Byte 1 (statuses 8-15):
  8=Old, 9=Sleep, 10=Paralyze, 11=Charm, 12=Berserk, 13=Silence, 14=Image, 15=...

Byte 2 (statuses 16-23):
  (additional status flags including Regen, Haste, etc.)
```

**Status immunity data (VERIFIED from ROM at $D126C0, showing immunity bytes only):**
```
Entry | Imm1  | Imm2  | Imm3  | Notes (immunity granted)
------|-------|-------|-------|---------------------------
  0   | 0x00  | 0x00  | 0x00  | None
  1   | 0x00  | 0x00  | 0x00  | Guard Ring (sets Regen, no immunity)
  2   | 0x00  | 0x00  | 0x00  | Cursed Ring (sets Zombie/Condemned)
  3   | 0x00  | 0x60  | 0x14  | Running Shoes (Haste)
  4   | 0x40  | 0x00  | 0x00  | Aegis Shield: immune Zombie
  5   | 0xE5  | 0x8C  | 0x00  | Ribbon: immune Stone/Toad/Mini/Poison/Zombie + more
  6   | 0x00  | 0x10  | 0x00  | Tiara/Rainbow/Red Shoes: immune Charm
  7   | 0x00  | 0x04  | 0x00  | Bard's Clothes: immune Silence
  8   | 0x01  | 0x00  | 0x00  | Glasses: immune Darkness
  9   | 0x04  | 0x00  | 0x00  | Angel Suit: immune Poison
 10   | 0x85  | 0x98  | 0x01  | Bone Mail: immune Stone/Poison/Zombie + more
 11   | 0x00  | 0x00  | 0x00  | Wall Ring (sets Reflect)
 12   | 0x10  | 0x00  | 0x00  | Giant's Glove: immune Mini(?)
 13   | 0x02  | 0x80  | 0x00  | Angel Ring: immune Stone/Old
 14   | 0x00  | 0x40  | 0x00  | Thornlet (sets HP Leak)
 15   | 0x00  | 0x00  | 0x00  | Mirage Vest (sets Image)
 16   | 0x10  | 0x20  | 0x00  | Genji Shield: immune Mini + ?
 17   | 0x10  | 0x10  | 0x00  | Genji Helmet: immune Mini + Charm
 18   | 0x20  | 0x10  | 0x00  | Genji Armor
 19   | 0x20  | 0x20  | 0x00  | Genji Glove
```

**Status bits (approximate — need full decode):**
- Byte 0: bit 0=Darkness, 1=Stone(?), 2=Poison, 3=?, 4=Mini(?), 5=?, 6=Zombie, 7=?
- Byte 1: bit 2=Silence, 4=Charm, 7=Old
- Byte 2: (additional flags)

---

## Proposed UI Layout

Using the blank lower-left 9 rows (roughly tiles 1-14 across, rows 12-20 down).

**MVP Display (3 sections):**
```
┌─────────────────────────────────────┐
│  ATTACKS:  [element icons]          │  ← Weapon element flags
│  HALVES:   [element icons]          │  ← Armor elem effect byte 3 (half)
│  BLOCKS:   [element icons]          │  ← Armor elem effect byte 2 (immune)
│            [status icons]           │  ← Armor status immunity
└─────────────────────────────────────┘
```

### Tile Assignments

**New Element Icons ($D5-$DC, 8 tiles):**
- $D5 = Fire
- $D6 = Ice
- $D7 = Lightning
- $D8 = Wind
- $D9 = Holy
- $DA = Dark (unused in vanilla — repurpose for Earth)
- $DB = Earth
- $DC = Water

**Existing Status Icons:**
- $3A = Petrify (Stone)
- $3B = Toad
- $3C = Mini
- $3E = Poison
- $3F = Zombie

---

## Implementation Plan

### Phase 1: Data Read — COMPLETE ✓
- [x] Locate weapon element byte ($D10000 + id×12 + 3)
- [x] Locate armor element effect index + lookup table ($D10600 + id×12 + 10 → $D12580)
- [x] Locate armor status immunity index + lookup table ($D10600 + id×12 + 11 → $D126C0)
- [x] Verify ROM bytes at $D12580 (element patterns) — CONFIRMED
- [x] Verify ROM bytes at $D126C0 (status patterns) — CONFIRMED

### Phase 2: Hook Point Research — COMPLETE ✓

**VERIFIED FINDINGS (2026-08-19):**

**Equipment RAM (CONFIRMED):**
- `$01F0-$01F4`: 5 equipped item IDs during Equip menu
  - $01F0 = Right hand (weapon)
  - $01F1 = Left hand (weapon/shield)
  - $01F2 = Head armor
  - $01F3 = Body armor
  - $01F4 = Relic/Accessory
- These are populated when Equip menu opens, valid only during menu

**Hook Point (CONFIRMED):**
- `C2/CB89`: After equipment slot processing loop (processes all 5 slots)
- Original code: `JSR $CB95 / PLP / PLB / RTS`
- We replace `JSR $CB95 / PLP` (4 bytes) with `JSL $E08000`
- Our code does PLP, draws icons, then RTL to CB8D (PLB/RTS)

**Menu dispatch table at C0/E600:**
| Index | Entry Point |
|-------|-------------|
| 0 | C2/A033 |
| 1 | C2/A03B |
| 2 | C2/A03F |
| 3 | C2/A043 |
| 4 | C2/A053 |
| 5 | C2/A069 |
| 6 | C2/A062 |
| 7 | C2/CFDC |

**What didn't work:**
- $43 = always $00 in menus (not useful as indicator)
- $01C7-C8 = shows $A4F0 for Equip, Stats, AND Magic (not unique)
- $7A00 = options array for slot selection, NOT equipped items

**C3 Window System (Lenophis disassembly):**
```
$D0 ($04F0) = 16-bit pointer to current window table
$D2 ($04F2) = bank for window table (usually $C3)
$D3 ($04F3) = 16-bit pointer to tilemap dest ($8000 = $7F8000)
$D5 ($04F5) = bank for tilemap ($7F)

C3/0053: Window interpreter entry point
C3/00FC: RTS after window draw complete
```

**Manual WRAM Watch Strategy:**
1. Open Equip menu in emulator
2. Watch `$04F0-$04F1` — when it reads $AF3C, we're in Equip window
3. Watch `$7F8000+` — tilemap buffer being filled
4. When $D0 advances past $AFxx (table consumed), the window is drawn

**Hook Options:**
- **A)** Patch C3/00FC RTS → JSL EquipDeluxe, check if $D0 was in Equip range
- **B)** Extend Equip window table at C3:AF3C with custom command (requires free table space)
- **C)** Patch the caller that sets $D0 to $AF3C for Equip menu

**Simplest Hook (Option A):**
At C3/00FC, the window interpreter returns. We patch to:
```
org $C300FC
    jml EquipDeluxe_CheckAndDraw
    
; Our code:
EquipDeluxe_CheckAndDraw:
    ; Check if we just drew the Equip menu
    lda $D0
    cmp #$B0xx      ; Past Equip table end?
    bcc .notEquip
    cmp #$AFxx      ; Before next table?
    ; ... draw icons ...
.notEquip:
    rts             ; Original return
```

### Phase 2: Draw Routine (pending hook confirmation)
1. **Find hook point** — likely C2/BB80-BCA0 area where stats are rendered
2. **Write icon draw subroutine** — takes element/status bitfield, draws icons at specified tilemap position
3. **Read equipped items** — get current weapon (slot 0) + armor pieces (slots 1-4)
4. **OR together element flags** from all armor pieces' lookup results
5. **Draw to tilemap** at lower-left area

### Phase 3: Graphics
1. Design 8 element icons (8×8 pixels each) in existing palette
2. Insert into font tile area ($D5-$DC)
3. Test visibility

### Phase 4: Testing
- Verify icons appear for known elemental weapons (Flame Sword, Ice Brand, etc.)
- Verify armor shows correct halve/immune elements (Flame Shield, Ice Shield)
- Verify status immunity shows for Ribbon, Guard Ring, etc.

---

## Key ROM Addresses (Quick Reference)

| Address | Size | Contents |
|---------|------|----------|
| $D10000 | $600 | Weapon properties (128 × 12 bytes) |
| $D10600 | $480 | Armor properties (96 × 12 bytes) |
| $D12580 | $2D | Element effect patterns (9 × 5 bytes) |
| $D126C0 | $8C | Status effect patterns (20 × 7 bytes) |
| $D126C4 | — | Status immunity portion (+4 into each record) |

**Weapon element:** `$D10000 + (weapon_id × 12) + 3` (mask 0x7F if bit 7 clear)

**Armor element effect:** `$D10600 + (armor_id × 12) + 10` → index into $D12580

**Armor status effect:** `$D10600 + (armor_id × 12) + 11` → index into $D126C0

---

## Open Questions

1. **Element icons at $D5-$DC** — Are these tiles already in use? Need to verify font/tileset.
2. **Screen space** — Confirm exact tile coordinates for the blank lower-left area.
3. **Palette** — Which palette row do icons use? Probably palette 0 (white text color).
4. **Hook point** — Where exactly in C2:A000+ does the equip menu draw routine live?

---

## Next Steps

### Phase 2: COMPLETE ✓
- [x] Equipment RAM verified at $01F0-$01F4
- [x] Hook point found at C2/CB89
- [x] ASM updated with correct addresses and hook

### Phase 3: Graphics (USER TASK)
1. **Design 8 element icons** — 8×8 pixels, 2bpp, match menu palette
2. **Insert into font ROM** — Target tiles $D5-$DC (verify these are free)
3. **Test visibility** — Confirm icons render correctly in menu context

### Phase 4: Testing (USER TASK)
4. **Assemble and apply patch:**
   ```
   cd EquipMenuDeluxe
   asar equip_deluxe_v1.asm ff5c.sfc
   ```
5. **Test known elemental weapons** — Flame Sword, Ice Brand, Thunder Blade
6. **Test armor element patterns** — Flame Shield, Ice Shield, Bone Mail
7. **Test status immunity** — Ribbon, Aegis Shield, Guard Ring

### If issues arise:
- If menu crashes: the hook point may need adjustment
- If no icons appear: verify tilemap coordinates (!RowIcons1/2/3)
- If CB95 skip causes visual glitches: may need to restore that call via relay









ASM refined! Here's what you can watch in WRAM to triangulate:

Window System (C3 interpreter):

┌──────────┬─────────┬───────────────────────────────────────────────────────┐
│ Address  │  Name   │                     What to watch                     │
├──────────┼─────────┼───────────────────────────────────────────────────────┤
│ $04F0-F1 │ $D0     │ Window table ptr — should read $AF3C when Equip draws │
├──────────┼─────────┼───────────────────────────────────────────────────────┤
│ $04F2    │ $D2     │ Table bank — should be $C3                            │
├──────────┼─────────┼───────────────────────────────────────────────────────┤
│ $7F8000+ │ Tilemap │ Watch for writes during menu draw                     │
└──────────┴─────────┴───────────────────────────────────────────────────────┘

Menu State (find the Equip flag):

┌─────────┬──────────────────────────────────┐
│ Address │              Notes               │
├─────────┼──────────────────────────────────┤
│ $43     │ Often menu type/mode             │
├─────────┼──────────────────────────────────┤
│ $44     │ Submenu state                    │
├─────────┼──────────────────────────────────┤
│ $54     │ Another state byte (seen in inu) │
├─────────┼──────────────────────────────────┤
│ $54     │ Another state byte (seen in inu) │
├─────────┼──────────────────────────────────┤
│ $7B7D   │ Set by equip routines            │
└─────────┴──────────────────────────────────┘

Equipment Slots (verify these):

┌─────────┬───────────────────────────┐
│ Address │         Expected          │
├─────────┼───────────────────────────┤
│ $7A00   │ Right hand weapon ID      │
├─────────┼───────────────────────────┤
│ $7A01   │ Left hand (weapon/shield) │
├─────────┼───────────────────────────┤
│ $7A02   │ Head armor ID             │
├─────────┼───────────────────────────┤
│ $7A03   │ Body armor ID             │
├─────────┼───────────────────────────┤
│ $7A04   │ Relic ID                  │
└─────────┴───────────────────────────┘

Next forensic steps:

1. Find Real Equipment Storage

Equip a distinctive weapon you can identify (e.g., Excalibur). Then search WRAM for its item ID byte. Character data is typically in fixed blocks. Try watching:

┌───────────────┬─────────────────────────────┐
│ Address Range │      What it might be       │
├───────────────┼─────────────────────────────┤
│ $0500-07FF    │ Character save data (field) │
├───────────────┼─────────────────────────────┤
│ $0800-0FFF    │ Extended character data     │
├───────────────┼─────────────────────────────┤
│ $2000-20FF    │ Battle character copies     │
└───────────────┴─────────────────────────────┘

2. Find Menu State Flag

We need a byte that says "Equip menu is active." Try watching these while navigating menus:

┌─────────┬───────────────────────────────────────┐
│ Address │               Watch for               │
├─────────┼───────────────────────────────────────┤
│ $43     │ Changes when entering different menus │
├─────────┼───────────────────────────────────────┤
│ $44     │ Submenu depth/type                    │
├─────────┼───────────────────────────────────────┤
│ $54     │ Menu mode (seen in inu patches)       │
├─────────┼───────────────────────────────────────┤
│ $0500   │ First byte of char data block         │
└─────────┴───────────────────────────────────────┘

What value does $43 or $44 show when you're in the Equip menu vs the main menu or Item menu?

3. Alternative Hook Strategy

Since the C3 window system isn't giving us a stable hook, let's consider:

Hook the VWF layer (already installed): The v5 VWF at $E05300 intercepts C2/E59D. We could add a check there: "if drawing to the Equip menu tilemap region AND menu state flag says Equip, also draw our icons."

Hook NMI ($1F00): Check menu state flag each vblank, draw icons if in Equip menu. Slightly wasteful but reliable.

---
Simplest next test: Tell me what value $43 shows when you're:
- A) In the main menu (before selecting Equip)
- B) In the Equip menu
- C) In the Item menu

If those differ, we have our hook condition!

