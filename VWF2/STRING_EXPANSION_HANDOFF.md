# String Table Expansion - Handoff Notes
**Last Updated: 2026-07-30**

## Goal
Expand FFV's fixed-size string tables to eliminate ligature compression, allowing full spelling of monster/item/ability names with the VWF system.

## Current Status: BLOCKED on Monster Name Stride Conversion

### What Works
- Table relocation: 6 tables copied to new locations at $E05800+
- Table expansion: Entries padded with $FF to new sizes
- Pointer updates: 17 pointer references patched to new locations
- ASM hooks: JSL instructions installed at C1:3024 and C1:3031
- ROM boots and enters battle without crashing

### What Doesn't Work
- Monster names display as wrong characters (garbage but consistent)
- The stride conversion routine isn't producing correct offsets

## Technical Details

### Table Layout (16-byte monster entries)
```
monsterName:              $E05800, 384 × 16 bytes, ends $E07000
  - Monster 256+ base:    $E06800 (offset $1000 from start)
itemNames:                $E07000, 256 × 13 bytes
battleCommandName:        $E07D00, 96 × 11 bytes
abilityName:              $E08120, 105 × 20 bytes
attackName:               $E089A0, 168 × 16 bytes
monsterSpecialAttackName: $E09420, 64 × 20 bytes
```

### The Stride Problem
Original code: `monster_id × 10` → offset into 10-byte entry table
We need: `monster_id × 16` → offset into 16-byte entry table

Current approach: Hook the table read, convert offset via:
1. Divide old_offset by 10 (iterative subtraction loop)
2. Multiply result by 16 (ASL × 4)
3. Read from table with new offset

### Bugs Fixed Along the Way
1. **Assembler 16-bit operands**: Added `.w` suffix to force 16-bit immediates after `REP #$30`
2. **X register truncation**: Moved `LDA` before `PLP` so X stays 16-bit during table read

### User's Hypothesis (Worth Investigating)
> "dec -> hex conversion was causing a lot of downstream drift"

Potential areas where this could manifest:
- The iterative `SBC #10` loop in ASM (does it handle 16-bit math correctly?)
- Pointer offset calculations in Python build script
- Off-by-one errors in table layout addresses

### Files Involved
```
VWF2/
  build_expanded_v3.py          # Current build script
  ff5c_expanded_v3.sfc          # Latest test ROM (still broken)
  STRING_TABLE_EXPANSION_PLAN.md # Original planning doc

ffv-decomp/asm/
  fix_monster_stride_v2.asm     # Current stride fix (not working)
```

### Debug Approach for Next Session

1. **Verify table data is correct**
   - Check that monster names at $E05800 match original at $E00050
   - ✓ Already verified - data looks correct

2. **Trace the offset calculation**
   - Set breakpoint at $E05680 (hook entry)
   - Check X value on entry (should be monster_id × 10)
   - Step through division loop, verify Y = correct monster_id
   - Verify final X = monster_id × 16

3. **Check what bytes are actually read**
   - After LDA $E05800,X, what's in A?
   - Does it match what's at that ROM location?

4. **Alternative: Skip the division entirely**
   - Use a lookup table (768 bytes) mapping old_offset → new_offset
   - Or: Change game code to pass monster_id directly instead of pre-multiplied offset

### Key Code Locations
```
C1:3031 ($13031) - Monster 0-255 table read, hooked to $E05680
C1:3024 ($13024) - Monster 256-383 table read, hooked to $E056AB
C1:3018 ($13018) - Loop counter (reads 10 chars) - NOT the stride
$E05680          - FixMonster_0_255 routine
$E056AB          - FixMonster_256_383 routine
```

### Quick Test
Load `VWF2/ff5c_expanded_v3.sfc` in Mesen, enter battle.
- Current: Monster names show wrong characters
- Expected: Correct monster names (Python, Treeman, etc.)

---

## Related Memory Entries
- [[ko_palette_hack_status]] - KO palette fix (COMPLETE)
- [[vfw_dialogue_status]] - VWF v5 installed, working
- [[romhacking_pedagogy]] - Debug methodology

## Next Steps (Priority Order)
1. Use Mesen debugger to trace actual values through the hook
2. Verify the division-by-10 loop produces correct monster_id
3. If division is the issue, consider lookup table approach instead
