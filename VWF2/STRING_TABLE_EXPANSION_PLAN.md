# FFV String Table Expansion Plan

## Goal
Expand 6 fixed-size string tables by +4 bytes per entry to eliminate the need for ligature tiles. This allows full spelling of names without compression.

## Tables to Expand

| Table | Key | ROM Range | Count | Current | New | Δ |
|-------|-----|-----------|-------|---------|-----|---|
| Monsters | monsterName | $E00050-$E00F50 | 384 | 10 bytes | 14 bytes | +1,536 |
| Mon. Attacks | monsterSpecialAttackName | $E73700-$E73B00 | 64 | 16 bytes | 20 bytes | +256 |
| Skills(Menu) | abilityName | $E70900-$E70F90 | 105 | 16 bytes | 20 bytes | +420 |
| Skills(Battle) | attackName | $E70F90-$E71780 | 168 | 12 bytes | 16 bytes | +656 |
| Commands | battleCommandName | $E01150-$E013F0 | 96 | 7 bytes | 11 bytes | +384 |
| Items | itemNames | $D11380-$D11C80 | 256 | 9 bytes | 13 bytes | +1,024 |

**Total additional space needed: 4,276 bytes (~4.2KB)**

## Pointer References to Update

### monsterName ($E00050) — 9 refs
- `$C1:3032` — battle code, monster name display
- `$C3:EBFD` — menu code
- `$C3:EC8D` — menu code
- `$C3:ECA5` — menu code  
- `$C3:ED7D` — menu code
- (4 more in C1/C3 banks)

### monsterSpecialAttackName ($E73700) — 2 refs
- `$C1:2BC3` — battle special attack name
- `$CD:F154` — (possibly compressed data)

### abilityName ($E70900) — 1 ref
- `$C1:2BAA` — ability name lookup

### attackName ($E70F90) — 3 refs
- `$C1:2FBD` — attack name display
- `$C1:42AE` — (secondary ref)
- `$C1:586F` — (tertiary ref)

### battleCommandName ($E01150) — 4 refs
- `$C1:2A3B` — command name lookup
- `$C1:2C09` — command display
- `$C1:3269` — (secondary)
- `$C1:433D` — (tertiary)

### itemNames ($D11380) — 2 refs
- `$C1:2FF8` — item name display
- `$C1:5E92` — item name (alt path)

## Implementation Strategy

### Phase 1: Find Freespace
Need ~4.3KB contiguous freespace. Candidates:
- Bank $E0 after $E056FA (VWF code ends here)
- Bank $28 if WW-project has room
- Any bank with 0xFF runs of sufficient size

### Phase 2: Create Expanded Tables
For each table:
1. Read original entries
2. Pad each entry to new size (add trailing 0xFF or spaces)
3. Write to new ROM location

### Phase 3: Update Pointers
For each 3-byte pointer reference:
1. Change bytes to point to new table location
2. Verify the instruction pattern (typically `LDA $xxxxxx,X` or `BF xx xx xx`)

### Phase 4: Update Entry Size Constants
The code likely multiplies index by entry size. Search for:
- Multiplication routines using current sizes (10, 16, 12, 7, 9)
- Replace with new sizes (14, 20, 16, 11, 13)

### Phase 5: Update String Content
Replace ligature bytes with full spellings in the expanded tables.

## File Offsets (for hex editing)

| Table | File Start | File End |
|-------|------------|----------|
| monsterName | $200050 | $200F50 |
| monsterSpecialAttackName | $273700 | $273B00 |
| abilityName | $270900 | $270F90 |
| attackName | $270F90 | $271780 |
| battleCommandName | $201150 | $2013F0 |
| itemNames | $111380 | $111C80 |

## Notes
- The JSON also defines "Long" versions (itemNamesLong, attackNameLong) at different addresses — these might already be the expanded versions used in certain contexts
- Entry size multiplication code is the trickiest part — may need disassembly tracing
- Consider building a Python script to automate the table relocation

---
*Generated 2026-07-23 as part of VWF2 project*
