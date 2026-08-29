# Menu-Reader Poke Test — Plan (prepped 2026-08-05)

## Purpose
Find every *hidden* reader of the original string tables — especially
menu-bank (C2/C3) code, which is undisassembled and reaches tables via
split immediates or pointer arithmetic that byte-pattern scans can't see.
No breakpoints needed: pure Mesen MCP memory read/edit + eyeballs.

## Method
The expanded ROM keeps the OLD tables intact at their original addresses
as untouched shadow copies. Any screen still drawing from an old copy is
an unmigrated reader. So:

1. Load `ff5c_expanded_v5.sfc`, get to a save with jobs/magic/items.
2. For one table at a time, use the MCP to overwrite the first glyph of a
   *recognizable* entry in the OLD copy with `$77` ("X").
3. Walk the checklist screens. Anywhere the X appears = that screen reads
   the old table → log it as an unmigrated reader.
4. Restore the original byte (values listed below) before the next table.
5. Repeat for the NEW copy (sanity: battle screens should show the X).

ROM edits via MCP hit emulator memory only — the file on disk is safe;
reloading the ROM also resets everything.

## Poke targets (old copies) — file offset = SNES − $C00000
| Table | Poke at (file) | Entry poked | Orig byte | Watch for |
|---|---|---|---|---|
| battleCommandName | $0115D | cmd[1] "Other" O→X | $68 (check!) | **Job ability-equip list**, battle command window |
| spellName | $111C86+1 | spell[1] icon+"Ice" I→X | read first | Magic menus (menu + battle), shops? |
| jobName | $115600 | job[0] "Knight" K→X | read first | Job change screen, status screen |
| abilityNameInnate | $116200 | innate[0] "Equip…" E→X | read first | Ability-equip list (innate section) |
| itemNames | $111389+0 | item[1] "Empty"? use item[2] | read first | Battle item menu (menu uses itemNamesLong) |
| monsterName | $200050 | mon[0] "Goblin" G→X | read first | (menu contexts only; battle is migrated) |
| abilityName | $270900 | ability[0] | read first | Menu skill lists |
| attackName | $270F90 | attack[0] | read first | Battle msgs (should be migrated) |
| monsterSpecialAttackName | $273700 | monSpec[0] "Critical" | read first | Battle msgs (should be migrated) |

("Orig byte: read first" = MCP-read the byte before poking so the restore
value is logged. Battle-side reads for the six v4 tables SHOULD show no X
— if one does, a battle reader was missed.)

## Screens checklist
- Main menu: Item, Magic (each character), Job, Ability (equip screen —
  both !command list and innate list), Status, Config, Shops (buy/sell)
- Battle: command window, Magic list, Item list, attack/ability/monster
  name message lines, Scan/Check if available
- Name entry screen (characterNames)

## Outcome
A reader map: for each table, which screens read old vs new. Unmigrated
readers then get traced (we know the screen + the table = enough to find
the code by watching WRAM name buffers with MCP reads during that screen)
and repointed in build v6. Only after the reader map is complete is it
safe to start Phase 3 content renames (else menus show stale names).
