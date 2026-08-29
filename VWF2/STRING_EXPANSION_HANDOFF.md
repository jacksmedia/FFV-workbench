# String Table Expansion - Handoff Notes
**Last Updated: 2026-08-05**

## Goal
Expand FFV's fixed-size string tables to eliminate ligature compression, allowing full spelling of monster/item/ability names with the VWF system.

## Current Status: v5 BUILT + STATICALLY VERIFIED — awaiting playtest
- **v4 (6 tables) PLAYTEST CONFIRMED 2026-08-01** — all battle names resolve.
- **v5 adds spellName, jobName, abilityNameInnate at 12-byte entries**
  (`build_expanded_v5.py` → `ff5c_expanded_v5.sfc`, checked by
  `verify_expanded_v5.py`: all 1,215 entries + code spot checks pass).
- Census of ALL name tables: `census_string_tables.py` / `census2.py` /
  `census3.py`. Remaining unexpanded: characterNames (no pressure),
  battleMessage (182/256 maxed but battletext encoding — own mini-quest),
  variable-length encodings (dialog/mapTitle/itemDescription — not
  stride-limited).
- Next gate before Phase 3 content: **menu-reader poke test** — see
  `POKE_TEST_PLAN.md`. characterNames + abilityNameInnate have ZERO
  contiguous refs in the whole ROM; menu bank C2 reads tables invisibly.

### v5 new-code notes
- spellName ($D11C80 87×6 → $E09940 87×12): 5 battle-bank read sites.
  Three ($12ABD/$12C41/$12FCB) shared ONE `LDA #$06` between char counter
  and stride → replaced with `JSL $E0A000` shim (sets $70=6, $80=12);
  two had standalone strides ($142BF, $1582C → $0C). Width-engine entries
  $E02F40 (name) and $E02F47 (name+1, icon skip) repointed.
- jobName ($D15600 22×8 → $E09D60 22×12): strides at $12A73, $1311C → $0C.
- abilityNameInnate ($D16200 33×8 → $E09E70 33×12): DATA ONLY — no code
  refs exist outside the (unmapped) menu bank; old copy identical so
  nothing diverges until content edits.
- `JSR $FEBA` = hardware multiplier ($7E × $80 → $82 via $4202/$4216),
  clobbers A; `JSR $FE4B` = software multiply ($98 × $9A → $9C).

**Do not reuse `ff5c_expanded_v3.sfc`** — besides broken names, its hook
routines at $E05680 overwrote part of the VWF v5 glyph width table.

## Root Cause (why v3 showed garbage)

The monster-name stride multiply was never in bank C1. It lives in a
pre-existing hack routine at **$E00030** (only caller: C1:3011):

```
E00030: PHY / TXY / LDA $4038,Y      ; A = monster id
        PHA / ASL / STA $4038,Y      ; temp = id*2
        ASL / ASL / CLC / ADC $4038,Y ; id*8 + id*2 = id*10
        TAX / PLA / STA $4038,Y / PLY / RTL
```

The char loop at C1:3018-303D reads 10 chars doing `INX` between reads,
so X = id*10 + char_index at each read. The v2 div-by-10 hook failed
twice over: it discarded the remainder (the char index), and it returned
with X clobbered to id*16, so after `INX` the next division resolved to a
*different monster's* first byte. Hence "garbage but consistent."

## The v4 Fix (no hooks, no asar)

1. **$E00030 rewritten** to multiply by 16: `PHY/TXY/LDA $4038,Y/ASL×4/TAX/PLY/RTL`.
   The game's own INX loop then produces id*16 + char naturally.
2. **C1:3031 / C1:3024 restored to plain reads** at new bases:
   `LDA $E05800,X` (0-255) / `LDA $E06800,X` (256-383; base = start + 256×16).
3. **Stride constants patched** (operand file offsets):
   - itemNames ×9→13: $12FEB, $15E84
   - battleCommandName ×7→11: $12BD2 (shared $2BCF helper), $1431B
   - attackName ×12→16: $142A1, $15861, $202FCE (inside $E02FC9 shim)
   - monsterSpecialAttackName ×16→20: $12B94 (shared $2B91 helper)
4. **abilityName ×16→20**: old routine $E02FB2/$E02FB6 (dual entry, ×16 as
   ASL×4) had no room for ×20 math → relocated to **$E09920** (right after
   the tables); JSLs at $12BA1 and $13C23 retargeted.
5. **Three hidden table refs patched** inside the VWF width engine
   ($E02F39-$E02FA7, builds `LDA table,X / RTL` in RAM at $7E1C00):
   addresses stored *split* (8-bit bank imm + 16-bit LDY imm) so 3-byte
   pointer scans never saw them: $202F51 (command), $202F56/58 (ability),
   $202F5D/5F (monsterSpecial).

## Table Layout (v5)
```
monsterName:              $E05800, 384 × 16 (256+ base: $E06800)
itemNames:                $E07000, 256 × 13
battleCommandName:        $E07D00,  96 × 11
abilityName:              $E08120, 105 × 20
attackName:               $E089A0, 168 × 16
monsterSpecialAttackName: $E09420,  64 × 20
abilityStride20 routine:  $E09920 (28 bytes)
spellName:                $E09940,  87 × 12
jobName:                  $E09D60,  22 × 12
abilityNameInnate:        $E09E70,  33 × 12
spellName cnt/stride shim:$E0A000 (9 bytes)
free to $E10000 (dialog): ~24.5KB remaining
```

## Phase 2 (after playtest confirms): longer visible names
Char-count loop counters were deliberately left at original values —
same on-screen output as before, but resolved from the expanded tables.
To draw more chars, bump these operands (see COUNTERS in build script):
- monster: $13019 (10) · command: $12A37/$12C05/$13263/$14339/$13C09 (7)
- item: $12FF4/$15E8D (9) · ability: $12BA6/$13C29 (16)
- attack: $142AA (12), $1586B/$202FCA (9) · monSpec: $12BBF/$13C49 (16)
- spell: $20A001 (inside shim!), $142C8, $15836 (6) · job: $12A7C, $13125 (8)
Then Phase 3: rewrite string content with full spellings (padding is $FF).

## Playtest Checklist
1. Battle: monster names correct (Goblin, Killer Bee, Nut Eater...)
2. Battle: command window (Fight/Item/...), item names, magic/ability
   names, monster attack names ("Critical", "Tail"...)
3. Menu: VWF v5 still renders correctly (width table untouched in v4)
4. Boss with id ≥ 256 (e.g., WingRaptor) for the $E06800 path

## Open Items / Watch For
- C3 menu monsterName refs ($3EBFD etc.) are data-structure pointers;
  menu-side stride handling unverified (FFV rarely shows monster names
  in menus — low risk, but note it).
- $E02F39/40/47 width entries point at attackNameLong/itemNamesLong —
  different tables, deliberately untouched.

## Related Memory Entries
- [[string_expansion_status]] · [[vfw_dialogue_status]] · [[romhacking_pedagogy]]
