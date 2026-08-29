# FFV Clean Project Audit Log

**Project:** FFV Clean — visual overhaul and bugfix compilation for Final Fantasy V (SFC/RPGe)  
**Current version:** v2.09x (ffvclean-wip.sfc)  
**Target version:** v2.1 (modular rebuild)  
**Audit started:** 2026-08-25  
**Last updated:** 2026-08-29

---

## Executive Summary

This audit documents the archaeological analysis of FFV Clean v2.09x to support a modular v2.1 rebuild. Key findings:

1. **37 patches confirmed APPLIED** to v2.09x (≥97% byte match)
2. **47 patches partially present** (applied then overwritten)
3. **1,753 orphan bytes** — hand edits not from any .ips patch
4. **v2.1 carries over <1%** of orphan work — orphan bricks are essential

---

## Audit Documents Generated

| File | Purpose |
|------|---------|
| `PATCH_AUDIT.md` | Complete patch detection report |
| `patch_audit.csv` | Machine-readable patch data |
| `ORPHAN_BYTES.md` | Unaccounted byte regions analysis |
| `orphan_regions.csv` | Raw orphan region data |
| `orphan_snapshots/*.ips` | Extracted orphan byte bricks |
| `orphan_snapshots/MANIFEST.md` | Brick documentation |
| `extract_orphans.py` | Orphan extraction script |
| `compare_v21_orphans.py` | v2.1 vs orphan comparison |
| `disasm_orphan_asm.py` | ASM disassembly tool |
| `FFV_CLEAN_AUDIT_LOG.md` | This master log |

---

## Orphan Byte Bricks (for v2.1 integration)

Extracted 2026-08-25. Apply after v2.1 base patch.

| Brick | Regions | Bytes | Status |
|-------|---------|-------|--------|
| `orphan_map_sprites.ips` | 10 | 750 | Custom field sprite graphics |
| `orphan_custom_asm.ips` | 46 | 480 | Code hooks — see analysis below |
| `orphan_battle_palette.ips` | 3 | 296 | Battle palette edits |
| `orphan_npc_properties.ips` | 66 | 196 | NPC table tweaks |
| `orphan_monster_props.ips` | 10 | 30 | Monster property edits |
| `orphan_misc.ips` | 1 | 1 | Stray byte |

**Total:** 1,753 orphan bytes in 136 regions

---

## Custom ASM Analysis

### Region 1: C5/8D35-8DBB (105 orphan bytes)

**IDENTIFIED:** Extended version of Inu's `ff5_auto_jump.ips`

- **Original purpose:** Fix berserk+jump automatic action wait time
- **Extension adds:** Additional status flag checking via `$201B,X | $2071,X` merge
- **Key RAM:**
  - `$7C04,X` — Per-character jump wait time counter (custom RAM)
  - `$3D7F,Y` — Job ability byte
  - `$3CFB,Y` — Ability flags
- **Cross-reference:** Inu README line 213-217, source at `bugfixes/ff5_auto_jump.ips.commented.asm`

**Recommendation:** Review if v2.1's ff5_auto_jump already includes these extensions, or re-apply brick.

### Region 2: C4/9DD0-9E16 (61 orphan bytes)

**ANALYSIS:** Battle status processing — related to Region 1

- Calls JSR $8D8D (same helper as Region 1)
- Decrements `$7C04,X` counter
- Checks `$201C,X` AND #$10, `$201A,X` AND #$C0
- Likely handles **counter decrement on action completion**

### Region 3: C5/8CCB-8D01 (53 orphan bytes)

**ANALYSIS:** Helper routines for the auto_jump system

- JSR $8D54 calls into Region 1
- REP #$20 / SEP #$20 mode switching
- Stores to `$7C04,X` and `$3D7F,X`

### Region 4: C4/9C04-9C36 (37 orphan bytes)

**ANALYSIS:** Battle initialization routine

- Initializes `$3D7F,Y`, `$3CFB,Y` (job data)
- Zeros `$41BF-$41CA` (battle state RAM)
- Followed by NOP sled (removed vanilla code)

### Region 5: C5/904B-90CC (34+ orphan bytes)

**ANALYSIS:** Status handling with massive NOP padding

- Same pattern: checks `$59`, calls JSR $8D8D
- ~60 bytes of NOPs indicate **shortened vanilla routine**
- End section updates `$201B,X` status flags

### Common RAM Address Glossary

| Address | Purpose | Source |
|---------|---------|--------|
| `$7C04,X` | Per-character jump/action wait counter | ff5_auto_jump extension |
| `$3D7F,Y` | Job ability byte (vanilla) | FFV battle system |
| `$3CFB,Y` | Ability learned flags (vanilla) | FFV battle system |
| `$201A-$201D,X` | Character status bytes (vanilla) | FFV battle system |
| `$2071,X` | Additional status flags (vanilla) | FFV battle system |
| `$41BF-$41CA` | Battle state variables (vanilla) | FFV battle system |
| `$48`, `$49` | Active character indices | FFV battle system |
| `$59` | Battle mode/status flags | FFV battle system |

---

## v2.1 Comparison Results

Comparison run 2026-08-25:

```
v2.1 patch: 734 records, 10,421 total bytes

Total orphan bytes in v2.09x:     1,753
Covered by v2.1:                  3 (0.2%)
Partially covered:                161 (9.2%)
Missing from v2.1:                1,589 (90.6%)
```

**Conclusion:** v2.1 is a clean rebuild that does NOT carry over the hand-edited orphan work. The orphan bricks must be applied after v2.1 to preserve custom modifications.

---

## Recommended v2.1 Assembly Order

```
1. Clean RPGe base ROM
2. FFV Clean v21 + Serity's New Equip Icons.ips  (fresh rebuild)
3. orphan_map_sprites.ips        (750 bytes — field sprite work)
4. orphan_battle_palette.ips     (296 bytes — palettes)
5. orphan_npc_properties.ips     (196 bytes — NPC tweaks)
6. orphan_custom_asm.ips         (480 bytes — REVIEW FIRST)
7. orphan_monster_props.ips      (30 bytes — monster tweaks)
```

**Note:** Step 6 (custom ASM) requires verification that it doesn't conflict with v2.1's included patches. The ff5_auto_jump extension may already be incorporated.

---

## Open Questions

1. [ ] Does v2.1 include an updated ff5_auto_jump that obsoletes the orphan extension?
2. [ ] Which NPC property tweaks are intentional vs. accidental?
3. [ ] What do the monster property edits accomplish?
4. [ ] Is the 290-byte block at 0x14FE80 sprite data or palette data?

---

## Session Notes

### 2026-08-25 — Initial audit

- Tracked down PATCH_AUDIT.md in patches/audit/
- Reviewed 37 confirmed patches, 47 partial, 129 not applied
- Extracted 6 orphan brick .ips files
- Compared v2.1 against orphans: 90.6% missing

### 2026-08-29 — ASM identification

- Disassembled top 5 orphan ASM regions
- Cross-referenced against Inu's documentation
- **IDENTIFIED:** Region 1 (C5/8D35) is extended ff5_auto_jump
- Documented RAM address glossary
- Created this master audit log

---

## References

- Inu patches: `patches/FFV inu patches (2008 - 2010)/`
- Inu README: Comprehensive patch documentation (bilingual JP/EN)
- Inu BUG-LIST: PSX/GBA fix comparison
- ff5_auto_jump source: `bugfixes/ff5_auto_jump.ips.commented.asm`



---

## Some answers to Open Questions (from Jacks)
3. Monster props are bit-level edits to support the `kiss_of_blessing.ips` 
by setting bit6 (0x40) of the 26th byte for many boss monsters.
This is a fix to the vanilla game to prevent the !Mix ability from delivering 
easy wins against the more challenging bosses in the game.

4. Data from 0x14FE80 up to 0x14FFC0 are not sprite data, they sit immeditately 
before the start of all the sprite data ($14FFC0)