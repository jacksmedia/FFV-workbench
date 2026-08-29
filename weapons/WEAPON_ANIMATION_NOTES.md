# FFV Weapon Animation System - Research Notes

**Project Goal**: Make spear attack animations colorful/varied like swords, or investigate
why spear shaft doesn't palette-swap while spear head does.

**Date**: 2026-07-29

---

## 1. Key Data Structures

### 1.1 Weapon Effects Table: $D99855 (ROM offset $199855)

Each weapon TYPE has a 9-byte effects entry:

| Offset | Purpose                  | Notes                                    |
|--------|--------------------------|------------------------------------------|
| +0     | Weapon sprite graphic    | Tile index in Weapon Graphics tilemap    |
| +1     | Weapon sprite palette    | Palette index for weapon sprite          |
| +2     | User movement            | How character moves during attack        |
| +3     | Attack/hit graphic       | Tile index in Weapon Hit Graphics        |
| +4     | Attack/hit palette       | Palette index for hit effect             |
| +5     | Animation script ID      | Controls timing/behavior                 |
| +6     | Flags                    | Various behavior flags                   |
| +7     | Sound effect             | SFX played on attack                     |
| +8     | Critical sound           | SFX played on critical hit               |

### 1.2 Item Types (byte 2 of weapon data at $D10002, masked &0x3F)

```
0  = None           10 = Rod            20 = Body Armor
1  = Common         11 = Staff          21 = Robe
2  = Knife          12 = Flail (Unused) 22 = Light Armor
3  = Ninja Sword    13 = Bow            23 = Accessory
4  = Sword          14 = Harp           24 = Chemist
5  = Knight Sword   15 = Whip           25 = Thrown
6  = Spear          16 = Bell           26 = Scroll
7  = Axe            17 = Shield
8  = Hammer         18 = Helmet
9  = Katana         19 = Hat
```

### 1.3 Graphics Tilemaps

- **Weapon Graphics**: $D197A0-$D19BA0 (1024 bytes, 32 rows x 16 tiles x 2 bytes)
- **Weapon Hit Graphics**: $D19BA0-$D1A3A0 (2048 bytes, 64 rows x 16 tiles x 2 bytes)
- **Attack Palettes**: $D1A3A0+ (16 bytes per palette)

---

## 2. Decoded Weapon Effects Entries

### Type 0 (None): $199855
```
0F 00 00 14 68 0C 80 01 80
wpn_gfx=0F pal=00 move=00 atk_gfx=14 atk_pal=68 anim=0C flag=80 sfx=01 crit=80
```

### Type 1 (Common): $19985E
```
0F 00 00 14 68 0C 80 01 80
(same as None)
```

### Type 2 (Knife): $199867
```
05 58 03 02 68 02 00 16 00
wpn_gfx=05 pal=58 move=03 atk_gfx=02 atk_pal=68 anim=02 flag=00 sfx=16 crit=00
```

### Type 3 (Ninja Sword): $199870
```
05 58 03 02 68 02 00 16 00
(same as Knife)
```

### Type 4 (Sword): $199879
```
05 59 03 02 69 02 00 16 00
wpn_gfx=05 pal=59 move=03 atk_gfx=02 atk_pal=69 anim=02 flag=00 sfx=16 crit=00
```

### Type 5 (Knight Sword): $199882
```
05 58 03 02 68 02 00 16 00
wpn_gfx=05 pal=58 move=03 atk_gfx=02 atk_pal=68 anim=02 flag=00 sfx=16 crit=00
```

### Type 6 (Spear): $19988B
```
05 58 03 02 6D 02 00 16 00
wpn_gfx=05 pal=58 move=03 atk_gfx=02 atk_pal=6D anim=02 flag=00 sfx=16 crit=00
```

### Type 7 (Axe): $199894
```
05 58 03 02 68 02 00 16 00
```

### Type 8 (Hammer): $19989D
```
05 58 03 02 68 02 00 16 00
```

### Type 9 (Katana): $1998A6
```
05 5B 03 02 6B 02 00 16 00
wpn_gfx=05 pal=5B move=03 atk_gfx=02 atk_pal=6B anim=02 flag=00 sfx=16 crit=00
```

### Type 10 (Rod): $1998AF
```
05 5A 04 02 6A 02 00 16 00
wpn_gfx=05 pal=5A move=04 atk_gfx=02 atk_pal=6A anim=02 flag=00 sfx=16 crit=00
```

### Type 11 (Staff): $1998B8
```
05 5C 03 02 6C 02 00 16 00
```

---

## 3. Key Observations

### 3.1 Spear vs Sword Comparison

| Field          | Sword (type 4) | Spear (type 6) | Same? |
|----------------|----------------|----------------|-------|
| wpn_gfx        | 05             | 05             | YES   |
| pal            | 59             | 58             | NO    |
| move           | 03             | 03             | YES   |
| atk_gfx        | 02             | 02             | YES   |
| atk_pal        | 69             | 6D             | NO    |
| anim           | 02             | 02             | YES   |
| sfx            | 16             | 16             | YES   |

Both use atk_gfx=$02 and anim=$02 — yet visually they look completely different!

### 3.2 User Discovery (2026-07-29)

- Spear animation is NOT the same as sword visually — it's a telescoping brown spear
- The spear HEAD does change between items (Partisan vs Holy Lance differ)
- The spear SHAFT remains brown/static — hardcoded palette indices in tilemap?
- Changing $19988E (atk_gfx) had no visible effect

### 3.3 Hypothesis

The spear animation uses DIFFERENT TILES than sword despite sharing atk_gfx=$02.
The animation script (anim=$02) may dispatch to different tile sequences based on
weapon type, OR there's a secondary lookup happening.

The shaft tiles likely have palette bits baked into the tilemap data itself
(SNES tilemap format: YXPCCCTT TTTTTTTT where CCC = palette 0-7).
The head tiles use the weapon's palette, but shaft tiles use a fixed palette.

---

## 4. Investigation Paths

### Path A: Make Spear Look Like Sword Slash
1. Find where animation dispatches per weapon type
2. Redirect spear to use sword's tile sequence
3. Adjust palette to match spear colors

### Path B: Fix Spear Palette (preferred by user)
1. Dump the spear tilemap data at $D19BA0+
2. Find shaft tiles with hardcoded palette bits
3. Change CCC bits to use dynamic palette instead of fixed brown

---

## 5. ROM Locations Reference

| Data                    | SNES Address      | File Offset   |
|-------------------------|-------------------|---------------|
| Weapon Effects Table    | $D99855           | $199855       |
| Weapon Properties       | $D10000-$D10600   | $110000       |
| Weapon Graphics         | $D197A0-$D19BA0   | $1197A0       |
| Weapon Hit Graphics     | $D19BA0-$D1A3A0   | $119BA0       |
| Attack Palettes         | $D1A3A0+          | $11A3A0       |

---

## 6. Files in This Folder

- `ff5-rpge-clean.sfc` - Clean copy of RPGe 1.10 ROM for testing
- `WEAPON_ANIMATION_NOTES.md` - This file

---

## 7. CRITICAL DISCOVERY: Spear-Specific Hardcoding

### Location: C1/66BA-66C9 (file offset $0166BA)

```asm
C1/66B5:  STZ $8A            ; Zero the graphic offset
C1/66B7:  LDA $D1CF,X        ; Load weapon type
C1/66BA:  CMP #$06           ; Is it type 6 (spear)?
C1/66BC:  BEQ $66C9          ; YES -> SKIP the offset calculation!
C1/66BE:  LDA $DBED,X        ; NO -> Load offset from table
C1/66C1:  CLC
C1/66C2:  ADC $8E            ; Add extra offset
C1/66C4:  STA $8A            ; Store to graphic offset
C1/66C6:  LDA $D1CF,X        ; Reload weapon type
C1/66C9:  PHX                ; ← Spears jump here (skipping offset calc)
C1/66CA:  JSR $673A          ; Call graphic rendering
```

### What This Means

- **Non-spear weapons**: Load graphic offset from `$DBED,X + $8E`, allowing palette variation
- **Spears**: Always use offset 0 (brown/generic), skipping the palette lookup entirely
- This is WHY spear shafts are always brown regardless of weapon equipped!

### The Fix Options

**Option 1: Remove the spear skip (quick test)**
- At file offset $0166BC, change `F0 0B` (BEQ $66C9) to `EA EA` (NOP NOP)
- This makes spears use the same offset calculation as other weapons

**Option 2: Keep spear behavior but use different palette**
- Find where $DBED is populated for spears and set a non-zero value
- Or change the base graphic used by spears

### Related Tables

- `$D1CF,X` - Current weapon type (0-16+) for party slot X
- `$DBED,X` - Per-slot graphic offset (what spears skip)
- `$8E` - Additional offset (set based on $CF4D context)
- `$8A` - Final graphic offset used by rendering

---

## 8. Next Steps

1. Test the NOP patch at $0166BC to see if spears get palette variation
2. Dump $DBED table to understand how offsets are assigned
3. Investigate how to assign proper palette offsets to spear weapons
4. Consider alternative: modify spear tiles to use dynamic palette indices

---

## 9. Test Patch Created

**File**: `patch_spear_palette.py`

```
python patch_spear_palette.py ff5c.sfc          # Apply patch
python patch_spear_palette.py ff5c.sfc --revert # Revert to original
```

**Patch Details**:
- Location: File offset $0166BC
- Original: `F0 0B` (BEQ $66C9)
- Patched: `EA EA` (NOP NOP)

This removes the spear skip, letting spears use the same palette offset
calculation as swords, knives, and katanas.

---

## 10. Summary

**Root Cause**: At C1/66BC, the game has hardcoded logic that says "if weapon
type is 6 (spear), skip the graphic offset calculation." This means all spears
always use offset 0, resulting in a generic brown shaft regardless of which
spear is equipped.

**User Observation Explained**: The spear HEAD changes per weapon because
it uses a different code path that respects the weapon palette. The SHAFT
is rendered separately and hits this skip logic.

**Fix Approach**: Remove the `BEQ $66C9` instruction so spears go through the
same offset calculation as other melee weapons.

**Alternative**: If the above doesn't fully work, we may need to also adjust
the tilemap data to ensure shaft tiles use the dynamic palette index (CCC bits)
instead of hardcoded palette references.

---

## 11. RESOLUTION (2026-07-30)

**Result**: MVP ACHIEVED via manual sprite tile recoloring!

The NOP patch at C1/66BC did NOT fix the issue — confirming that the problem
was in the **tile data itself**, not the code path. The spear shaft tiles had
hardcoded palette indices baked into them.

**User's Fix**: Manually edited the spear sprite tiles to use the correct
palette indices. Now Partisan, Holy Lance, and other spears are visually
distinctive instead of generic brown.

**Lesson Learned**: The C1/66BC skip was a red herring (or secondary issue).
The actual root cause was tile-level palette assignment in the graphics data
at $D197A0-$D19BA0, not the runtime offset calculation.

**Future Work**: 
- Per-weapon palette variation may still need the C1/66BC fix + $DBED table work
- Animation variety (thrust vs slash) would need animation script changes
- The documented tilemaps and effects table will be useful for future weapon mods

