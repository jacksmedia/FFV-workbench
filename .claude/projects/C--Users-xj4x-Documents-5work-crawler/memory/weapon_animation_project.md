---
name: weapon-animation-project
description: Open-ended FFV weapon animation/graphics hacking project — spear MVP complete, future work on per-weapon palettes and animation variety
metadata:
  type: project
---

## Weapon Animation Hacking Project

**Status**: MVP COMPLETE (2026-07-30) — spears now visually distinctive
**Location**: `weapons/` folder in crawler project

### What Was Achieved

User manually recolored spear sprite tiles to make Partisan, Holy Lance, and other
spears visually distinctive instead of the generic brown shaft appearance. This was
the primary goal — spears now have visual identity like swords/knives/katanas.

### Key Technical Findings

1. **Weapon Effects Table** at `$D99855` (9 bytes per weapon type):
   - Controls weapon sprite, attack graphic, palette, animation script, sound
   - Spears (type 6) and swords (type 4) share the SAME attack_gfx and animation values
   - The visual difference comes from the actual tile data, not this table

2. **Spear Skip Code** at C1/66BC (file $0166BC):
   - Found `CMP #$06 / BEQ` that skips offset calculation for spears
   - NOPping this did NOT fix the issue — the problem was in tile data, not code
   - This code path may still be relevant for future per-weapon palette variation

3. **Root Cause Confirmed**: Spear tiles had hardcoded palette indices (CCC bits in
   SNES tilemap format) that ignored the weapon's assigned palette. User fixed by
   editing the actual tile palette assignments.

### Files Created

- `weapons/ff5-rpge-clean.sfc` — Clean ROM for testing
- `weapons/WEAPON_ANIMATION_NOTES.md` — Full technical documentation
- `weapons/patch_spear_palette.py` — Test patch (didn't work, but documents the code path)

### Open Questions for Future Work

1. **Per-weapon palette variety**: Can individual spears (Javelin vs Holy Lance) have
   different color schemes like swords do? The C1/66BC skip may need removal + proper
   $DBED table population for this.

2. **Animation variety**: Currently all spears use the same "telescoping thrust"
   animation. Could implement sword-style slash for some spears.

3. **Weapon graphics tilemaps**: Located at $D197A0 (weapon sprites) and $D19BA0
   (weapon hit effects). Future edits could add new weapon appearances.

4. **Attack type vs item type**: Attack types (33=Spear for damage calc) are separate
   from item types (6=Spear for graphics). Both systems documented.

### Related Memory Links

- [[ko_palette_hack_status]] — Similar palette investigation for KO sprites
- [[wounded_wardrobe_phase2]] — WW sprite injection pipeline (reusable for weapon sprites)

**Why**: User wants distinctive weapon visuals; generic brown spears were unsatisfying.
**How to apply**: For future weapon graphic work, start with `weapons/WEAPON_ANIMATION_NOTES.md`
and the tilemaps at $D197A0/$D19BA0.
