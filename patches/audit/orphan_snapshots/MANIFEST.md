# Orphan Byte Snapshots

Extracted from `ffvclean-wip.sfc` — hand edits not explained by any .ips patch.

These are the ancestral 'bricks' for FFV Clean v2.1 modular rebuild.

| Patch | Regions | Orphan Bytes | Description |
|-------|---------|--------------|-------------|
| `orphan_map_sprites.ips` | 10 | 750 | Custom field/map sprite graphics |
| `orphan_battle_palette.ips` | 3 | 296 | Battle character palette edits |
| `orphan_npc_properties.ips` | 66 | 196 | NPC property table tweaks |
| `orphan_monster_props.ips` | 10 | 30 | Monster property table edits |
| `orphan_custom_asm.ips` | 46 | 480 | Custom ASM code (banks $00-$05) |
| `orphan_misc.ips` | 1 | 1 | Miscellaneous regions |

**Total:** 1,753 orphan bytes in 136 regions

## Usage

Apply these to a clean RPGe ROM to restore the hand-edited regions:

```bash
# Using flips or similar IPS tool
flips --apply orphan_map_sprites.ips base.sfc output.sfc
```

## Region Details

### map_sprites

- `0x1AD007` - `0x1AD800`: 559 orphan bytes — Map Sprite Graphics
- `0x1B2803` - `0x1B297A`: 161 orphan bytes — Map Sprite Graphics
- `0x1A86F8` - `0x1A873D`: 9 orphan bytes — Map Sprite Graphics
- `0x1A8418` - `0x1A843D`: 6 orphan bytes — Map Sprite Graphics
- `0x1A861C` - `0x1A863F`: 4 orphan bytes — Map Sprite Graphics
- `0x1A851A` - `0x1A851F`: 3 orphan bytes — Map Sprite Graphics
- `0x1A859A` - `0x1A859F`: 3 orphan bytes — Map Sprite Graphics
- `0x1A86D0` - `0x1A86D3`: 2 orphan bytes — Map Sprite Graphics
- `0x1A879A` - `0x1A87BB`: 2 orphan bytes — Map Sprite Graphics
- `0x1A869E` - `0x1A869F`: 1 orphan bytes — Map Sprite Graphics

### battle_palette

- `0x14FE80` - `0x14FFBC`: 290 orphan bytes — (unnamed)
- `0x14A7C8` - `0x14A7D2`: 4 orphan bytes — Battle Character Palette
- `0x14ABC0` - `0x14ABE0`: 2 orphan bytes — Battle Character Palette

### npc_properties

- `0x0E82E3` - `0x0E8354`: 14 orphan bytes — NPC Properties
- `0x0E72CB` - `0x0E7327`: 12 orphan bytes — NPC Properties
- `0x0E7E59` - `0x0E7EB5`: 11 orphan bytes — NPC Properties
- `0x0E6ED4` - `0x0E6F1B`: 10 orphan bytes — NPC Properties
- `0x0E85CC` - `0x0E85FB`: 10 orphan bytes — NPC Properties
- `0x0E83CA` - `0x0E83FC`: 8 orphan bytes — NPC Properties
- `0x0E6F59` - `0x0E6F84`: 7 orphan bytes — NPC Properties
- `0x0E787F` - `0x0E78B1`: 6 orphan bytes — NPC Properties
- `0x0E84AA` - `0x0E84D5`: 6 orphan bytes — NPC Properties
- `0x0E96B6` - `0x0E96DA`: 6 orphan bytes — NPC Properties
- `0x0E6A0B` - `0x0E6A41`: 5 orphan bytes — NPC Properties
- `0x0E867F` - `0x0E869C`: 5 orphan bytes — NPC Properties
- `0x0E6856` - `0x0E686C`: 4 orphan bytes — NPC Properties
- `0x0E6B9E` - `0x0E6BB4`: 4 orphan bytes — NPC Properties
- `0x0E6FFA` - `0x0E701B`: 4 orphan bytes — NPC Properties
- `0x0E86D6` - `0x0E86F7`: 4 orphan bytes — NPC Properties
- `0x0E881C` - `0x0E8832`: 4 orphan bytes — NPC Properties
- `0x0E8BB8` - `0x0E8BCE`: 4 orphan bytes — NPC Properties
- `0x0E60ED` - `0x0E60FC`: 3 orphan bytes — NPC Properties
- `0x0E6228` - `0x0E6237`: 3 orphan bytes — NPC Properties
- `0x0E64DD` - `0x0E64EC`: 3 orphan bytes — NPC Properties
- `0x0E692F` - `0x0E694C`: 3 orphan bytes — NPC Properties
- `0x0E67C3` - `0x0E67CB`: 2 orphan bytes — NPC Properties
- `0x0E68DB` - `0x0E68E3`: 2 orphan bytes — NPC Properties
- `0x0E6AB0` - `0x0E6ABF`: 2 orphan bytes — NPC Properties
- `0x0E6B35` - `0x0E6B3D`: 2 orphan bytes — NPC Properties
- `0x0E6CF5` - `0x0E6CFD`: 2 orphan bytes — NPC Properties
- `0x0E6D73` - `0x0E6D7B`: 2 orphan bytes — NPC Properties
- `0x0E6E22` - `0x0E6E2A`: 2 orphan bytes — NPC Properties
- `0x0E6E84` - `0x0E6E8C`: 2 orphan bytes — NPC Properties
- `0x0E7251` - `0x0E7267`: 2 orphan bytes — NPC Properties
- `0x0E776E` - `0x0E777D`: 2 orphan bytes — NPC Properties
- `0x0E78D3` - `0x0E78DB`: 2 orphan bytes — NPC Properties
- `0x0E844F` - `0x0E845E`: 2 orphan bytes — NPC Properties
- `0x0E8480` - `0x0E8488`: 2 orphan bytes — NPC Properties
- `0x0E864A` - `0x0E864F`: 2 orphan bytes — NPC Properties
- `0x0E8743` - `0x0E874B`: 2 orphan bytes — NPC Properties
- `0x0E9279` - `0x0E9281`: 2 orphan bytes — NPC Properties
- `0x0E5EC4` - `0x0E5EC5`: 1 orphan bytes — NPC Properties
- `0x0E6562` - `0x0E6563`: 1 orphan bytes — NPC Properties
- `0x0E66B9` - `0x0E66BA`: 1 orphan bytes — NPC Properties
- `0x0E6978` - `0x0E697D`: 1 orphan bytes — NPC Properties
- `0x0E69BE` - `0x0E69C3`: 1 orphan bytes — NPC Properties
- `0x0E6AE8` - `0x0E6AE9`: 1 orphan bytes — NPC Properties
- `0x0E6BD6` - `0x0E6BD7`: 1 orphan bytes — NPC Properties
- `0x0E7075` - `0x0E7076`: 1 orphan bytes — NPC Properties
- `0x0E70E1` - `0x0E70E2`: 1 orphan bytes — NPC Properties
- `0x0E719B` - `0x0E719C`: 1 orphan bytes — NPC Properties
- `0x0E7219` - `0x0E721A`: 1 orphan bytes — NPC Properties
- `0x0E769C` - `0x0E769D`: 1 orphan bytes — NPC Properties
- `0x0E77EC` - `0x0E77ED`: 1 orphan bytes — NPC Properties
- `0x0E7AB6` - `0x0E7AB7`: 1 orphan bytes — NPC Properties
- `0x0E7CC3` - `0x0E7CC4`: 1 orphan bytes — NPC Properties
- `0x0E7E28` - `0x0E7E29`: 1 orphan bytes — NPC Properties
- `0x0E8115` - `0x0E8116`: 1 orphan bytes — NPC Properties
- `0x0E84FE` - `0x0E84FF`: 1 orphan bytes — NPC Properties
- `0x0E8521` - `0x0E8522`: 1 orphan bytes — NPC Properties
- `0x0E8922` - `0x0E8923`: 1 orphan bytes — NPC Properties
- `0x0E894C` - `0x0E894D`: 1 orphan bytes — NPC Properties
- `0x0E8A3E` - `0x0E8A3F`: 1 orphan bytes — NPC Properties
- `0x0E8C36` - `0x0E8C37`: 1 orphan bytes — NPC Properties
- `0x0E8C67` - `0x0E8C68`: 1 orphan bytes — NPC Properties
- `0x0E8F2A` - `0x0E8F2B`: 1 orphan bytes — NPC Properties
- `0x0E8F93` - `0x0E8F94`: 1 orphan bytes — NPC Properties
- `0x0E9398` - `0x0E9399`: 1 orphan bytes — NPC Properties
- `0x0E9455` - `0x0E9456`: 1 orphan bytes — NPC Properties

### monster_props

- `0x1025F9` - `0x1026BA`: 7 orphan bytes — Monster Properties
- `0x102AD9` - `0x102B5A`: 5 orphan bytes — Monster Properties
- `0x102799` - `0x1027FA`: 4 orphan bytes — Monster Properties
- `0x102859` - `0x1028BA`: 4 orphan bytes — Monster Properties
- `0x102999` - `0x1029FA`: 4 orphan bytes — Monster Properties
- `0x101F99` - `0x101FBA`: 2 orphan bytes — Monster Properties
- `0x101679` - `0x10167A`: 1 orphan bytes — Monster Properties
- `0x102959` - `0x10295A`: 1 orphan bytes — Monster Properties
- `0x102BD9` - `0x102BDA`: 1 orphan bytes — Monster Properties
- `0x102D39` - `0x102D3A`: 1 orphan bytes — Monster Properties

### custom_asm

- `0x028D35` - `0x028DBB`: 105 orphan bytes — (unnamed)
- `0x021DD0` - `0x021E16`: 61 orphan bytes — (unnamed)
- `0x028CCB` - `0x028D01`: 53 orphan bytes — (unnamed)
- `0x021C04` - `0x021C36`: 37 orphan bytes — (unnamed)
- `0x02904B` - `0x0290CC`: 34 orphan bytes — (unnamed)
- `0x024ED0` - `0x024EF9`: 23 orphan bytes — (unnamed)
- `0x002221` - `0x002240`: 16 orphan bytes — (unnamed)
- `0x03B0C7` - `0x03B146`: 14 orphan bytes — (unnamed)
- `0x001CFE` - `0x001D23`: 11 orphan bytes — (unnamed)
- `0x00008E` - `0x0000B4`: 8 orphan bytes — (unnamed)
- `0x00249B` - `0x0024A7`: 8 orphan bytes — (unnamed)
- `0x0002D9` - `0x0002FC`: 7 orphan bytes — (unnamed)
- `0x005910` - `0x005916`: 6 orphan bytes — (unnamed)
- `0x03B1AA` - `0x03B1DD`: 6 orphan bytes — (unnamed)
- `0x029D74` - `0x029D79`: 5 orphan bytes — (unnamed)
- `0x001207` - `0x00120B`: 4 orphan bytes — (unnamed)
- `0x003DAC` - `0x003DB0`: 4 orphan bytes — (unnamed)
- `0x003EE9` - `0x003EED`: 4 orphan bytes — (unnamed)
- `0x004ACA` - `0x004ACE`: 4 orphan bytes — (unnamed)
- `0x0054C7` - `0x0054CB`: 4 orphan bytes — (unnamed)
- `0x005B6E` - `0x005B72`: 4 orphan bytes — (unnamed)
- `0x005BA3` - `0x005BA7`: 4 orphan bytes — (unnamed)
- `0x0071CE` - `0x0071D2`: 4 orphan bytes — (unnamed)
- `0x00A248` - `0x00A24C`: 4 orphan bytes — (unnamed)
- `0x00A4C7` - `0x00A4CB`: 4 orphan bytes — (unnamed)
- `0x00BAA1` - `0x00BAA5`: 4 orphan bytes — (unnamed)
- `0x00BAC5` - `0x00BAC9`: 4 orphan bytes — (unnamed)
- `0x00C8F8` - `0x00C908`: 4 orphan bytes — (unnamed)
- `0x02502E` - `0x025031`: 3 orphan bytes — (unnamed)
- `0x025982` - `0x025985`: 3 orphan bytes — (unnamed)
- `0x03BAC5` - `0x03BAE4`: 3 orphan bytes — (unnamed)
- `0x02244F` - `0x022451`: 2 orphan bytes — (unnamed)
- `0x023758` - `0x02375A`: 2 orphan bytes — (unnamed)
- `0x023880` - `0x023882`: 2 orphan bytes — (unnamed)
- `0x023A31` - `0x023A33`: 2 orphan bytes — (unnamed)
- `0x023B3C` - `0x023B3E`: 2 orphan bytes — (unnamed)
- `0x02619A` - `0x02619C`: 2 orphan bytes — (unnamed)
- `0x028ECD` - `0x028ECF`: 2 orphan bytes — (unnamed)
- `0x028F55` - `0x028F57`: 2 orphan bytes — (unnamed)
- `0x03AE1F` - `0x03AE22`: 2 orphan bytes — (unnamed)
- `0x03B5AB` - `0x03B5AE`: 2 orphan bytes — (unnamed)
- `0x021FBE` - `0x021FC4`: 1 orphan bytes — (unnamed)
- `0x022422` - `0x022423`: 1 orphan bytes — (unnamed)
- `0x02E3C2` - `0x02E3C3`: 1 orphan bytes — (unnamed)
- `0x03B17B` - `0x03B17C`: 1 orphan bytes — (unnamed)
- `0x03F809` - `0x03F8B9`: 1 orphan bytes — (unnamed)

### misc

- `0x0E59C6` - `0x0E59C7`: 1 orphan bytes — (unnamed)

