# Unaccounted bytes: hand edits in ffvclean-wip.sfc

Every byte where `ffvclean-wip.sfc` differs from clean `ff5 RPGe [crc32=17444605].sfc`, classified by whether any .ips in the collection explains it.

| | original ROM (< 0x280000) | expansion (>= 0x280000) |
|---|---|---|
| accounted (patch explains it) | 337,807 | 46,951 |
| touched-mismatch (patched area, edited further) | 4,356 | 157,553 |
| orphan (no patch involved = hand edit) | 1,753 | 0 |

## Top accounting patches (cross-check of the recipe)

| patch | diff bytes it explains |
|---|---|
| `backups, other ppls patches\[5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips` | 243,399 |
| `mine\FFV RPGe Clean NPCs - xJ4cks.ips` | 136,809 |
| `mine\FFV RPGe Clean NPCs.ips` | 136,809 |
| `mine\FFV RPGe Clean Warriors.ips` | 70,341 |
| `backups, other ppls patches\[6789]Final+Fantasy+V+Tweaks+v2.7b\Final Fantasy V Dress Code.ips` | 46,094 |
| `cosmetic patches\FFV-DressCode-release6\Final.Fantasy.V.Dress.Code by Cubear.ips` | 45,794 |
| `cosmetic patches\Final_Fantasy_V_Dress_Code beta (Cubear).ips` | 45,549 |
| `mine\FFV Clean Krile + Lenna + Bartz.ips` | 24,667 |
| `mine\FFV Clean Krile+Lenna.ips` | 23,736 |
| `mine\unchibi Jobless v1.0 (RPGe).ips` | 22,132 |
| `backups, other ppls patches\Game versions\Final Fantasy V-Pixel Freemaster (v4.85 by Nintenja and Various authors).7z::Final Fantasy V-Pixel Freemaster (All Jobs Unlocked not included & No 2x abp,gil,xp).ips` | 20,067 |
| `backups, other ppls patches\Game versions\Final Fantasy V-Pixel Freemaster (v4.85 by Nintenja and Various authors).7z::Final Fantasy V-Pixel Freemaster (All Jobs Unlocked not included + 2x abp,gil,xp).ips` | 20,067 |
| `backups, other ppls patches\Game versions\Final Fantasy V-Pixel Freemaster (v4.85 by Nintenja and Various authors).7z::Final Fantasy V-Pixel Freemaster-Kick Butz Edition (All Jobs Unlocked Included & No 2x abp,gil,xp).ips` | 20,067 |
| `backups, other ppls patches\Game versions\Final Fantasy V-Pixel Freemaster (v4.85 by Nintenja and Various authors).7z::Final Fantasy V-Pixel Freemaster-Kick Butz Edition (All Jobs Unlocked Included + 2x abp,gil,xp).ips` | 19,334 |
| `backups, other ppls patches\[6789]Final+Fantasy+V+Tweaks+v2.7b\Final Fantasy V Tweaks v2.7a.ips` | 12,009 |
| `backups, other ppls patches\[3687]Final+Fantasy+V+-+GBA+Script+Port\ff5\Final Fantasy V - GBA Script Port.ips` | 11,461 |
| `backups, other ppls patches\FFV [T+Spa1_06f_noisecross] interesting icons\Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips` | 6,643 |
| `mine\FFV ReJobbed Unchibi Krile by xJ4cks.ips` | 5,830 |
| `backups, other ppls patches\真説FF5r-IC Ver.2.0.0.zip::É^ÉαFF5r-IC Ver.2.0.0/É^Éα FF5r-IC Ver.2.0.0/É^ÉαFF5r-IC Disc3.ips` | 4,147 |
| `backups, other ppls patches\真説FF5r-IC Ver.2.0.0.zip::É^ÉαFF5r-IC Ver.2.0.0/É^Éα FF5r-IC Ver.2.0.0/É^ÉαFF5r-IC Disc2.ips` | 4,139 |
| `backups, other ppls patches\真説FF5r-IC Ver.2.0.0.zip::É^ÉαFF5r-IC Ver.2.0.0/É^Éα FF5r-IC Ver.2.0.0/É^ÉαFF5r-IC Disc1.ips` | 4,015 |
| `backups, other ppls patches\[6789]Final+Fantasy+V+Tweaks+v2.7b\Optional Patches\Inus_patches.ips` | 3,969 |
| `cosmetic patches\FF5 Character Change 0.3 by Tsushiy\FF5 Character Change 0.3\FF5 Character Change 0.3 (Record Keeper sprites by Tsushiy).ips` | 3,002 |
| `backups, other ppls patches\[3687]Final+Fantasy+V+-+GBA+Script+Port\ff5\Bugfixes.ips` | 2,941 |
| `FFV inu patches (2008 - 2010)\improve\ff5_lr_menu-1.0.ips` | 2,889 |

## Unaccounted regions, original ROM area — 305 regions

Sorted by unaccounted byte count; annotation = named range from ff5u-sfc.json containing the region start.

| start | end | span | orphan | touched | annotation | touching_patches | first_bytes |
|---|---|---|---|---|---|---|---|
| `0x272F55` | `0x273383` | 1070 | 0 | 876 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `9b 96 96 00 66 94 00 65` |
| `0x1AD007` | `0x1AD800` | 2041 | 559 | 16 | Map Sprite Graphics | Final Fantasy V vanilla field sprites.ips | `06 0b 05 0f 07 07 03 0f` |
| `0x14FE80` | `0x14FFBC` | 316 | 290 | 0 |  |  | `06 22 a5 14 ff 7f 60 55` |
| `0x03F100` | `0x03F601` | 1281 | 0 | 276 |  | [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips, Final Fantasy V Tweaks v2.7a.ips | `00 20 20 50 50 50 f8 88` |
| `0x1B2803` | `0x1B297A` | 375 | 161 | 47 | Map Sprite Graphics | É^ÉαFF5r-IC Disc1.ips, É^ÉαFF5r-IC Disc2.ips, É^ÉαFF5r-IC Disc3.ips | `04 2d 12 2d 12 3e 01 1d` |
| `0x277438` | `0x277542` | 266 | 0 | 204 | (free space) | Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `7a 8c 8c 82 88 87 96 85` |
| `0x271194` | `0x2712F6` | 354 | 0 | 183 | Attack Name | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `be 62 88 87 7d 7e 86 87` |
| `0x028D35` | `0x028DBB` | 134 | 105 | 23 |  | anti_ff5_dead_aegis_shield.ips | `d0 f4 a5 59 29 18 f0 69` |
| `0x00F9AF` | `0x00FAB5` | 262 | 0 | 123 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `6e 2f 74 2f 78 2f 7e 2f` |
| `0x03FBB8` | `0x03FCF1` | 313 | 0 | 122 |  | Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips, Final Fantasy V - GBA Script Port.ips, Final Fantasy V-Pixel Freemaster (v4.85 by Nintenja and Various authors).7z::Final Fantasy V-Pixel Freemaster (All Jobs Unlocked not included & No 2x abp,gil,xp).ips | `20 70 20 00 00 00 00 00` |
| `0x02904B` | `0x0290CC` | 129 | 34 | 84 |  | ff5_steal3x.ips, Bugfixes.ips, Final Fantasy V Tweaks v2.7a.ips | `18 f0 5a 20 8d 8d 29 18` |
| `0x11FCD3` | `0x11FDFF` | 300 | 0 | 118 |  | Final Fantasy V Tweaks v2.7a.ips, GBA Font.ips, Final Fantasy V - GBA Script Port.ips | `22 ff 54 ff 28 ff 14 ff` |
| `0x11FAC3` | `0x11FBD4` | 273 | 0 | 113 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `0d ff ec ff 7e ff 6c ff` |
| `0x13820E` | `0x13833C` | 302 | 0 | 109 | Battle Character Graphics | FFV(RPGe) Galuf Mimic - xJ4cks.ips, Galuf Mime by xJ4cks.ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `9a 04 28 17 1c 03 00 1f` |
| `0x11F201` | `0x11F39C` | 411 | 0 | 81 |  | Final Fantasy V Tweaks v2.7a.ips, GBA Font.ips, PS1 Font.ips | `18 ff 3c ff 66 ff 66 ff` |
| `0x232944` | `0x2329A0` | 92 | 0 | 80 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `6b 7e 7a 8b 87 7e 7d 96` |
| `0x03EFC8` | `0x03F0A8` | 224 | 0 | 75 |  | [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips, Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips | `00 70 88 88 88 88 88 88` |
| `0x138106` | `0x1381BC` | 182 | 0 | 69 | Battle Character Graphics | FFV(RPGe) Galuf Mimic - xJ4cks.ips, Galuf Mime by xJ4cks.ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `6f 10 df 20 8e 10 66 00` |
| `0x021DD0` | `0x021E16` | 70 | 61 | 0 |  |  | `1e a6 3f bd 1c 20 29 10` |
| `0x138044` | `0x1380BE` | 122 | 0 | 58 | Battle Character Graphics | FFV(RPGe) Galuf Mimic - xJ4cks.ips, Galuf Mime by xJ4cks.ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `67 18 af 10 ff 00 9f 00` |
| `0x138402` | `0x13847B` | 121 | 0 | 57 | Battle Character Graphics | FFV(RPGe) Galuf Mimic - xJ4cks.ips, Galuf Mime by xJ4cks.ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `50 20 27 18 4f 10 3f 00` |
| `0x028CCB` | `0x028D01` | 54 | 53 | 0 |  |  | `20 54 8d a6 49 9e 06 20` |
| `0x03F760` | `0x03F7E1` | 129 | 0 | 53 |  | [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `00 41 40 f3 41 41 41 49` |
| `0x1384C0` | `0x13853D` | 125 | 0 | 52 | Battle Character Graphics | FFV(RPGe) Galuf Mimic - xJ4cks.ips, Galuf Mime by xJ4cks.ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `5f 20 5e 21 44 38 a3 5c` |
| `0x03F809` | `0x03F8B9` | 176 | 1 | 49 |  | Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips, Final Fantasy V Tweaks v2.7a.ips | `a0 a0 a0 00 00 00 00 00` |
| `0x117CD6` | `0x117D7F` | 169 | 0 | 49 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `74 89 96 00 64 8a 8e 82` |
| `0x271781` | `0x271804` | 131 | 0 | 44 | Attack Name (Long) | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `8d 8b 7e 87 80 8d 81 96` |
| `0x203278` | `0x2032FC` | 132 | 0 | 42 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `06 06 06 06 06 06 06 06` |
| `0x1385A2` | `0x138600` | 94 | 0 | 40 | Battle Character Graphics | FFV(RPGe) Galuf Mimic - xJ4cks.ips, Galuf Mime by xJ4cks.ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `4e 3c e2 60 3f c2 97 6e` |
| `0x11FC4E` | `0x11FCAF` | 97 | 0 | 39 |  | Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `cf 00 ff 00 ff 00 ff 00` |
| `0x11433B` | `0x114369` | 46 | 0 | 38 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `63 88 8e 7b 85 7e 96 66` |
| `0x021C04` | `0x021C36` | 50 | 37 | 0 |  |  | `1a 99 7f 3d a9 41 99 fb` |
| `0x21153D` | `0x211572` | 53 | 0 | 35 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `6b 7e 87 87 7a 9d 96 6f` |
| `0x11F535` | `0x11F5C8` | 147 | 0 | 34 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, GBA Font.ips | `ce ff de ff f6 ff e6 ff` |
| `0x11F765` | `0x11F868` | 259 | 0 | 34 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, GBA Font.ips | `c6 ff d6 ff fe ff ee ff` |
| `0x1119C2` | `0x111AAD` | 235 | 0 | 31 | Item Names | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `df 64 85 7f ff 62 7a 89` |
| `0x11F895` | `0x11F98E` | 249 | 0 | 30 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, GBA Font.ips | `dc ff 66 ff 66 ff 7c ff` |
| `0x27543B` | `0x275469` | 46 | 0 | 30 | Item Description | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `63 88 8e 7b 85 7e 96 66` |
| `0x2114BB` | `0x2114DB` | 32 | 0 | 29 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `a2 a2 a2 9b 96 96 76 81` |
| `0x111E52` | `0x111EB6` | 100 | 0 | 28 | Spell Name | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `82 8d e5 73 82 8d 7a 87` |
| `0x03BAC5` | `0x03BAE4` | 31 | 3 | 23 |  | [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V-Pixel Freemaster (v4.85 by Nintenja and Various authors).7z::Final Fantasy V-Pixel Freemaster (All Jobs Unlocked not included & No 2x abp,gil,xp).ips | `c8 e7 b7 e3 b6 ea e8 e9` |
| `0x03F959` | `0x03F999` | 64 | 0 | 25 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips, Cleaner Font for FFV+FF5r.ips | `c0 40 47 40 47 48 48 e7` |
| `0x21CC5A` | `0x21CC7E` | 36 | 0 | 25 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `6b 7e 7a 8b 87 7e 7d 96` |
| `0x024ED0` | `0x024EF9` | 41 | 23 | 0 |  |  | `07 38 bd 7f 3d 20 f3 8c` |
| `0x03F629` | `0x03F691` | 104 | 0 | 23 |  | Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `c4 40 4c 44 44 44 44 ee` |
| `0x275890` | `0x2758B4` | 36 | 0 | 23 | Item Names (Long) | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `61 8b 7a 8c 8c 96 6a 87` |
| `0x11FF04` | `0x11FF30` | 44 | 0 | 22 |  | Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips, Cleaner Font for FFV+FF5r.ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `e0 3f e0 3e e1 3c f0 1a` |
| `0x138362` | `0x1383BC` | 90 | 0 | 21 | Battle Character Graphics | FFV(RPGe) Galuf Mimic - xJ4cks.ips, Galuf Mime by xJ4cks.ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `6d 12 e1 5e 42 bc 43 bc` |
| `0x21D2CF` | `0x21D2E7` | 24 | 0 | 21 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `ab 6f 85 7e 7a 8c 7e 96` |
| `0x21CF3D` | `0x21CF54` | 23 | 0 | 20 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `6b 7e 7a 8b 87 7e 7d 96` |
| `0x270F91` | `0x270FE0` | 79 | 0 | 20 | Attack Name | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `72 8d 8b 7e 87 80 8d 81` |
| `0x111BFB` | `0x111C2E` | 51 | 0 | 19 | Item Names | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `88 8d 8d 7a 80 7e ff 66` |
| `0x11FA41` | `0x11FA9E` | 93 | 0 | 19 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, GBA Font.ips | `26 ff 60 ff fe ff 66 ff` |
| `0x21CF99` | `0x21CFAE` | 21 | 0 | 19 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `6b 7e 7a 8b 87 7e 7d 96` |
| `0x117691` | `0x1176A7` | 22 | 0 | 18 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `67 8e 8b 85 ff c6 ff 88` |
| `0x1142E3` | `0x11430B` | 40 | 0 | 17 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `b1 8c 00 aa 63 88 8e 7b` |
| `0x21035B` | `0x21036E` | 19 | 0 | 17 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `88 8d 8d 7a 80 7e 9a 9d` |
| `0x002221` | `0x002240` | 31 | 16 | 0 |  |  | `22 85 fb f9 05 08 99 03` |
| `0x03B0C7` | `0x03B146` | 127 | 14 | 2 |  | Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `05 00 03 16 00 04 2f 00` |
| `0x11F605` | `0x11F66A` | 101 | 0 | 16 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, GBA Font.ips | `66 ff 66 ff 7e ff 66 ff` |
| `0x11F6E1` | `0x11F73E` | 93 | 0 | 16 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, GBA Font.ips | `38 ff 6c ff c6 ff c6 ff` |
| `0x211593` | `0x2115B1` | 30 | 0 | 16 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `6f 8b 82 87 7c 7e 8c 8c` |
| `0x21CE55` | `0x21CE66` | 17 | 0 | 16 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `6b 7e 7a 8b 87 7e 7d 96` |
| `0x11F3D3` | `0x11F409` | 54 | 0 | 15 |  | Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips, Cleaner Font for FFV+FF5r.ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `3f ff 7e 63 fc ff f8 df` |
| `0x11FF50` | `0x11FF5F` | 15 | 0 | 15 |  | Final Fantasy V - GBA Script Port.ips, GBA Font.ips, Cleaner Font for FFV+FF5r.ips | `f9 7c c0 fe 81 e0 9f c0` |
| `0x226202` | `0x226216` | 20 | 0 | 15 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `6b 7e 7a 8b 87 7e 7d 96` |
| `0x2753E3` | `0x2753F5` | 18 | 0 | 15 | Item Description | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `b1 8c 00 aa 63 88 8e 7b` |
| `0x275C6F` | `0x275C9E` | 47 | 0 | 15 | (free space) | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `6a 7a 8d 7a 87 7a ff ff` |
| `0x0E82E3` | `0x0E8354` | 113 | 14 | 0 | NPC Properties |  | `40 80 80 4d 14 1e 04 44` |
| `0x275CE8` | `0x275D01` | 25 | 0 | 14 | (free space) | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `61 85 7a 7d 7e ff ff ff` |
| `0x11185A` | `0x1118EB` | 145 | 0 | 13 | Item Names | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `b5 61 8b 88 87 93 7e ff` |
| `0x0E72CB` | `0x0E7327` | 92 | 12 | 0 | NPC Properties |  | `46 2f 1f 0d 20 6f 01 46` |
| `0x111393` | `0x1113C9` | 54 | 0 | 12 | Item Names | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `61 8b 7a 8c 8c ff ff ff` |
| `0x1143D3` | `0x1143DF` | 12 | 0 | 12 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `01 89 ba 8c 88 87 ce 7e` |
| `0x114527` | `0x114555` | 46 | 0 | 12 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `b1 87 8d 8c a3 99 00 74` |
| `0x11FE51` | `0x11FE69` | 24 | 0 | 12 |  | Final Fantasy V - GBA Script Port.ips, Cleaner Font for FFV+FF5r.ips, Final Fantasy V-Pixel Freemaster (v4.85 by Nintenja and Various authors).7z::Final Fantasy V-Pixel Freemaster (All Jobs Unlocked not included & No 2x abp,gil,xp).ips | `3c 81 42 00 a1 00 81 00` |
| `0x200CAC` | `0x200CCD` | 33 | 0 | 12 | Monster Name | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `82 87 7e ff ff ff 6c a9` |
| `0x277151` | `0x27715D` | 12 | 0 | 12 | Innate Ability Name (Long) | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `8b 8d 7f 8e 85 96 63 88` |
| `0x001CFE` | `0x001D23` | 37 | 11 | 0 |  |  | `ea ea ea 80 1a b9 1a 05` |
| `0x0E7E59` | `0x0E7EB5` | 92 | 11 | 0 | NPC Properties |  | `58 1a 03 12 12 1f 94 00` |
| `0x111929` | `0x111957` | 46 | 0 | 11 | Item Names | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `b3 62 88 89 89 7e 8b ff` |
| `0x117DF1` | `0x117DFC` | 11 | 0 | 11 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `74 89 96 96 96 96 96 96` |
| `0x14ABC0` | `0x14ABE0` | 32 | 2 | 9 | Battle Character Palette | FFV(RPGe) Galuf Mimic - xJ4cks.ips, Galuf Mime by xJ4cks.ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `1f 00 a5 14 ff 7f 88 0c` |
| `0x2127C8` | `0x2127E8` | 32 | 0 | 11 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `96 96 96 6c 88 87 84 96` |
| `0x0002D9` | `0x0002FC` | 35 | 7 | 3 |  | Final Fantasy V (Japan) [En by RPGe v1.1] - Whirlwind - v3.11 by clymax.ips | `22 ea f2 f9 ea a2 00 0b` |
| `0x0E6ED4` | `0x0E6F1B` | 71 | 10 | 0 | NPC Properties |  | `46 16 23 04 40 6a 01 46` |
| `0x0E85CC` | `0x0E85FB` | 47 | 10 | 0 | NPC Properties |  | `3b 1c 1c 00 20 b1 02 3b` |
| `0x11FBF8` | `0x11FC1D` | 37 | 0 | 10 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `91 8c b8 06 fc 03 fe 01` |
| `0x2103EC` | `0x2103FB` | 15 | 0 | 10 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `6e 7b 8d 7a b2 7e 7d 96` |
| `0x275627` | `0x275653` | 44 | 0 | 10 | Item Description | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `b1 87 8d 8c a3 99 00 74` |
| `0x275DA0` | `0x275DAA` | 10 | 0 | 10 | (free space) | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `76 88 88 7d 96 72 8d 7a` |
| `0x086E17` | `0x086E20` | 9 | 0 | 9 | Event Script | Final Fantasy V (Japan) [En by RPGe v1.1] - Whirlwind - v3.11 by clymax.ips | `ba 01 fb cd 88 03 c8 83` |
| `0x111670` | `0x1116A2` | 50 | 0 | 9 | Item Names | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `85 7e ff ff e7 72 7a 7b` |
| `0x112084` | `0x112099` | 21 | 0 | 9 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `7e 8b 88 ff ff ff ff be` |
| `0x11FEC8` | `0x11FEDF` | 23 | 0 | 9 |  | Final Fantasy V Tweaks v2.7a.ips, Cleaner Font for FFV+FF5r.ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `f1 0c f8 06 fc 03 ff 00` |
| `0x1A86F8` | `0x1A873D` | 69 | 9 | 0 | Map Sprite Graphics |  | `1f 42 0f 02 0f 02 36 01` |
| `0x275AA1` | `0x275AAB` | 10 | 0 | 9 | (free space) | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `8d 7e 7e 85 96 72 89 7e` |
| `0x275F68` | `0x275F71` | 9 | 0 | 9 | (free space) | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `71 88 89 7e 96 76 81 82` |
| `0x00008E` | `0x0000B4` | 38 | 8 | 0 |  |  | `22 65 f6 f9 a2 10 00 86` |
| `0x00249B` | `0x0024A7` | 12 | 8 | 0 |  |  | `22 b3 f9 f9 85 08 a5 09` |
| `0x03F70A` | `0x03F739` | 47 | 0 | 8 |  | Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips, Final Fantasy V Tweaks v2.7a.ips | `00 00 00 00 00 00 00 00` |
| `0x0E83CA` | `0x0E83FC` | 50 | 8 | 0 | NPC Properties |  | `21 6b 42 46 14 25 04 01` |
| `0x111768` | `0x111775` | 13 | 0 | 8 | Item Names | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `7e 7f 8d ff ff ff ff ff` |
| `0x115640` | `0x115648` | 8 | 0 | 8 | Job Name | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `72 89 a9 85 61 b9 7d 7e` |
| `0x11F691` | `0x11F6BC` | 43 | 0 | 8 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, GBA Font.ips | `1e ff 0c ff 0c ff 0c ff` |
| `0x20066A` | `0x200672` | 8 | 0 | 8 | Monster Name | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `7a 7d 88 90 63 87 7c bb` |
| `0x2007A0` | `0x2007A8` | 8 | 0 | 8 | Monster Name | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `88 8b 7d 63 7a 87 7c bb` |
| `0x2176BB` | `0x2176C4` | 9 | 0 | 8 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `72 89 7e 85 85 7b 85 7a` |
| `0x0E6F59` | `0x0E6F84` | 43 | 7 | 0 | NPC Properties |  | `46 10 39 0d 40 61 01 46` |
| `0x1025F9` | `0x1026BA` | 193 | 7 | 0 | Monster Properties |  | `58 00 00 08 00 2f 29 28` |
| `0x275C3E` | `0x275C45` | 7 | 0 | 7 | (free space) | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `96 6a 7a 8d 7a 87 7a ff` |
| `0x00548F` | `0x005495` | 6 | 0 | 6 |  | Final Fantasy V (Japan) [En by RPGe v1.1] - Whirlwind - v3.11 by clymax.ips | `22 ae f5 fa ea ea ad f7` |
| `0x005910` | `0x005916` | 6 | 6 | 0 |  |  | `ca d0 f6 20 b0 fa 20 67` |
| `0x02BF02` | `0x02BF08` | 6 | 0 | 6 |  | Final Fantasy V (Japan) [En by RPGe v1.1] - Whirlwind - v3.11 by clymax.ips | `22 f4 f8 f9 ea ea 8b 5a` |
| `0x02BF55` | `0x02BF5B` | 6 | 0 | 6 |  | Final Fantasy V (Japan) [En by RPGe v1.1] - Whirlwind - v3.11 by clymax.ips | `22 12 f9 f9 ea ea 8b 54` |
| `0x03B1AA` | `0x03B1DD` | 51 | 6 | 0 |  |  | `0e 00 0a 0a 80 04 29 00` |
| `0x03EF80` | `0x03EF9C` | 28 | 0 | 6 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `00 a0 a0 a0 00 00 00 00` |
| `0x0E787F` | `0x0E78B1` | 50 | 6 | 0 | NPC Properties |  | `40 fd 01 35 32 16 0c 40` |
| `0x0E84AA` | `0x0E84D5` | 43 | 6 | 0 | NPC Properties |  | `41 80 00 46 0b 06 04 01` |
| `0x0E96B6` | `0x0E96DA` | 36 | 6 | 0 | NPC Properties |  | `43 70 03 61 0f 04 9e 63` |
| `0x1115DF` | `0x1115FF` | 32 | 0 | 6 | Item Names | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `85 7e 8b ff ff ed 64 85` |
| `0x116251` | `0x116258` | 7 | 0 | 6 | Innate Ability Name (Short) | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `a3 63 88 7d 80 7e 8b 67` |
| `0x1A8418` | `0x1A843D` | 37 | 6 | 0 | Map Sprite Graphics |  | `1f 42 0f 42 0f 42 06 41` |
| `0x222719` | `0x22271F` | 6 | 0 | 6 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `61 85 7a 7d 7e ff 00 01` |
| `0x029D74` | `0x029D79` | 5 | 5 | 0 |  |  | `80 03 ea ea ea ad 7b 7b` |
| `0x0E6A0B` | `0x0E6A41` | 54 | 5 | 0 | NPC Properties |  | `36 1d 12 0c 40 c7 00 44` |
| `0x0E867F` | `0x0E869C` | 29 | 5 | 0 | NPC Properties |  | `49 80 00 39 2a 0b 04 61` |
| `0x102AD9` | `0x102B5A` | 129 | 5 | 0 | Monster Properties |  | `58 00 00 00 00 56 44 2d` |
| `0x111434` | `0x11145E` | 42 | 0 | 5 | Item Names | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `b6 63 7e 7f 7e 87 7d 7e` |
| `0x114659` | `0x114662` | 9 | 0 | 5 |  | Final Fantasy V Tweaks v2.7a.ips, É^ÉαFF5r-IC Disc1.ips, É^ÉαFF5r-IC Disc2.ips | `00 00 00 00 00 00 00 00` |
| `0x200134` | `0x200149` | 21 | 0 | 5 | Monster Name | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `7e 8b 71 88 7c 84 66 7a` |
| `0x276EFA` | `0x276EFF` | 5 | 0 | 5 | (free space) | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `8d 8d 7a 80 7e ff ff ff` |
| `0x000606` | `0x00060A` | 4 | 0 | 4 |  | ff5_stuck_bug.ips | `22 97 f6 f9 85 ce a5 06` |
| `0x001207` | `0x00120B` | 4 | 4 | 0 |  |  | `5c 22 f5 fa 03 c9 03 f0` |
| `0x001D7D` | `0x001D83` | 6 | 0 | 4 |  | Final Fantasy V Dress Code.ips, Final.Fantasy.V.Dress.Code by Cubear.ips, Final_Fantasy_V_Dress_Code beta (Cubear).ips | `a0 f1 f9 5c a0 f1 f9 ea` |
| `0x003DAC` | `0x003DB0` | 4 | 4 | 0 |  |  | `5c 00 f0 f9 c9 67 90 20` |
| `0x003EE9` | `0x003EED` | 4 | 4 | 0 |  |  | `22 1f fa f9 29 07 0a 85` |
| `0x004ACA` | `0x004ACE` | 4 | 4 | 0 |  |  | `22 c1 fd f9 d0 04 a5 03` |
| `0x0054C7` | `0x0054CB` | 4 | 4 | 0 |  |  | `22 bb ff f9 85 5d a2 10` |
| `0x005B6E` | `0x005B72` | 4 | 4 | 0 |  |  | `22 89 f9 f9 85 48 a5 44` |
| `0x005BA3` | `0x005BA7` | 4 | 4 | 0 |  |  | `22 96 fa f9 60 00 00 fc` |
| `0x0071CE` | `0x0071D2` | 4 | 4 | 0 |  |  | `22 bb f5 fa a5 26 95 7f` |
| `0x00A248` | `0x00A24C` | 4 | 4 | 0 |  |  | `22 9a f5 f9 a0 05 00 b7` |
| `0x00A4C7` | `0x00A4CB` | 4 | 4 | 0 |  |  | `22 b0 fd f9 d0 bb a5 61` |
| `0x00BAA1` | `0x00BAA5` | 4 | 4 | 0 |  |  | `22 f0 ff f8 4c 28 a6 20` |
| `0x00BAC5` | `0x00BAC9` | 4 | 4 | 0 |  |  | `22 c6 f2 f9 85 09 bf 00` |
| `0x00C8F8` | `0x00C908` | 16 | 4 | 0 |  |  | `ea ea 99 82 14 80 30 c9` |
| `0x00FFCA` | `0x00FFDC` | 18 | 0 | 4 | SNES Header | [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips, FFV RPGe Clean Warriors.ips | `20 20 20 20 20 20 20 20` |
| `0x021FBE` | `0x021FC4` | 6 | 1 | 3 |  | Final Fantasy V (Japan) [En by RPGe v1.1] - Whirlwind - v3.11 by clymax.ips | `29 ff 80 02 ea ea 9d 04` |
| `0x0E6856` | `0x0E686C` | 22 | 4 | 0 | NPC Properties |  | `49 01 01 44 14 1c 0e 41` |
| `0x0E6B9E` | `0x0E6BB4` | 22 | 4 | 0 | NPC Properties |  | `00 80 00 3b 00 00 0c 00` |
| `0x0E6FFA` | `0x0E701B` | 33 | 4 | 0 | NPC Properties |  | `46 2d 12 02 60 59 01 46` |
| `0x0E86D6` | `0x0E86F7` | 33 | 4 | 0 | NPC Properties |  | `3b 25 28 0e 40 9a 42 39` |
| `0x0E881C` | `0x0E8832` | 22 | 4 | 0 | NPC Properties |  | `20 d1 02 59 13 19 cf 40` |
| `0x0E8BB8` | `0x0E8BCE` | 22 | 4 | 0 | NPC Properties |  | `41 2e 43 46 0f 0d 0c 41` |
| `0x102799` | `0x1027FA` | 97 | 4 | 0 | Monster Properties |  | `58 00 00 00 00 3c 1d 32` |
| `0x102859` | `0x1028BA` | 97 | 4 | 0 | Monster Properties |  | `58 00 00 00 00 42 25 28` |
| `0x102999` | `0x1029FA` | 97 | 4 | 0 | Monster Properties |  | `58 00 00 00 00 4c 61 23` |
| `0x1145B1` | `0x1145B5` | 4 | 0 | 4 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `00 00 00 00 00 00 00 00` |
| `0x11FE23` | `0x11FE2E` | 11 | 0 | 4 |  | Cleaner Font for FFV+FF5r.ips, GBA Font.ips | `18 ff 18 ff 7e ff 7e ff` |
| `0x14A7C8` | `0x14A7D2` | 10 | 4 | 0 | Battle Character Palette |  | `3f 53 ff 40 20 6a 60 51` |
| `0x1A861C` | `0x1A863F` | 35 | 4 | 0 | Map Sprite Graphics |  | `0f 42 0f 42 00 00 dc 00` |
| `0x2004BE` | `0x2004C2` | 4 | 0 | 4 | Monster Name | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `82 8b 7e 8b ff ff 62 7a` |
| `0x211914` | `0x211919` | 5 | 0 | 4 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `62 7a 89 99 87 9b ff ff` |
| `0x21198B` | `0x211990` | 5 | 0 | 4 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `62 7a 89 99 87 9b ff ff` |
| `0x21A97E` | `0x21A984` | 6 | 0 | 4 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `73 7a 86 7e 8b ff 00 01` |
| `0x21D23F` | `0x21D244` | 5 | 0 | 4 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `71 7a 87 80 bb 00 02 9b` |
| `0x275705` | `0x27570C` | 7 | 0 | 4 | Item Description | Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `00 00 00 00 00 00 00 00` |
| `0x005533` | `0x005536` | 3 | 0 | 3 |  | Final Fantasy V (Japan) [En by RPGe v1.1] - Whirlwind - v3.11 by clymax.ips | `bd fb f9 ea 20 a7 54 a9` |
| `0x02502E` | `0x025031` | 3 | 3 | 0 |  |  | `20 9d 8d a5 12 d0 13 bd` |
| `0x025982` | `0x025985` | 3 | 3 | 0 |  |  | `20 78 8d 9d d0 3e 7a fa` |
| `0x0E60ED` | `0x0E60FC` | 15 | 3 | 0 | NPC Properties |  | `04 80 40 66 20 0b 14 25` |
| `0x0E6228` | `0x0E6237` | 15 | 3 | 0 | NPC Properties |  | `04 4f 00 03 2d 10 ac 19` |
| `0x0E64DD` | `0x0E64EC` | 15 | 3 | 0 | NPC Properties |  | `04 80 00 66 14 17 94 46` |
| `0x0E692F` | `0x0E694C` | 29 | 3 | 0 | NPC Properties |  | `21 13 01 41 24 0e 0e 20` |
| `0x1113EC` | `0x1113F5` | 9 | 0 | 3 | Item Names | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `b7 72 7a 8c 8e 84 7e 99` |
| `0x11153B` | `0x11153F` | 4 | 0 | 3 | Item Names | Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips, É^ÉαFF5r-IC Disc1.ips | `8b 7a 8c 8c ff ff ff eb` |
| `0x117E2E` | `0x117E31` | 3 | 0 | 3 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `74 89 96 00 67 88 85 7d` |
| `0x117F7B` | `0x117F7E` | 3 | 0 | 3 |  | Final Fantasy V Tweaks v2.7a.ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `74 89 96 00 67 88 85 7d` |
| `0x1A851A` | `0x1A851F` | 5 | 3 | 0 | Map Sprite Graphics |  | `3f 10 3f 10 3f 50 00 00` |
| `0x1A859A` | `0x1A859F` | 5 | 3 | 0 | Map Sprite Graphics |  | `3f 10 3f 10 3f 50 00 00` |
| `0x200C66` | `0x200C69` | 3 | 0 | 3 | Monster Name | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `82 87 7e ff ff ff 66 94` |
| `0x21195A` | `0x21195E` | 4 | 0 | 3 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `62 7a 89 99 87 9b ff ff` |
| `0x212839` | `0x21283C` | 3 | 0 | 3 | Dialog | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `61 85 8e 7e ff 6c 7a 80` |
| `0x275989` | `0x27598D` | 4 | 0 | 3 | (free space) | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `61 85 7a 7d 7e ff ff ff` |
| `0x27FAA9` | `0x27FABF` | 22 | 0 | 3 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `a0 ff ff ff 00 da dc ff` |
| `0x02244F` | `0x022451` | 2 | 2 | 0 |  |  | `d8 8c a5 0e 20 ec 01 a5` |
| `0x023758` | `0x02375A` | 2 | 2 | 0 |  |  | `d8 8c fa bd 1b 20 29 bf` |
| `0x023880` | `0x023882` | 2 | 2 | 0 |  |  | `d8 8c 4c 4b 39 bd 1b 20` |
| `0x023A31` | `0x023A33` | 2 | 2 | 0 |  |  | `d8 8c fa bd 1b 20 29 bf` |
| `0x023B3C` | `0x023B3E` | 2 | 2 | 0 |  |  | `d8 8c 4c 4b 39 bd 1b 20` |
| `0x02619A` | `0x02619C` | 2 | 2 | 0 |  |  | `d8 8c 7b 99 f1 3c 99 f2` |
| `0x028ECD` | `0x028ECF` | 2 | 2 | 0 |  |  | `d8 8c fa 86 32 80 11 a5` |
| `0x028F55` | `0x028F57` | 2 | 2 | 0 |  |  | `d8 8c fa 86 32 a6 49 bd` |
| `0x03AE1F` | `0x03AE22` | 3 | 2 | 0 |  |  | `2f 00 13 07 00 04 30 00` |
| `0x03B5AB` | `0x03B5AE` | 3 | 2 | 0 |  |  | `0e 00 01 02 80 00 04 5a` |
| `0x03F6D0` | `0x03F6E9` | 25 | 0 | 2 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `00 40 80 80 80 80 80 80` |
| `0x0E67C3` | `0x0E67CB` | 8 | 2 | 0 | NPC Properties |  | `07 ab 40 4c 26 0f 00 07` |
| `0x0E68DB` | `0x0E68E3` | 8 | 2 | 0 | NPC Properties |  | `41 1d 01 44 23 2f 0d 41` |
| `0x0E6978` | `0x0E697D` | 5 | 1 | 1 | NPC Properties | FFV RPGe Clean NPCs - xJ4cks.ips, FFV RPGe Clean NPCs.ips | `36 0e 0b 0c 40 9a 00 32` |
| `0x0E69BE` | `0x0E69C3` | 5 | 1 | 1 | NPC Properties | FFV RPGe Clean NPCs - xJ4cks.ips | `36 24 35 0a 20 ff 00 4d` |
| `0x0E6AB0` | `0x0E6ABF` | 15 | 2 | 0 | NPC Properties |  | `41 c3 00 44 11 05 02 40` |
| `0x0E6B35` | `0x0E6B3D` | 8 | 2 | 0 | NPC Properties |  | `41 ea 00 0c 08 0f 1c 61` |
| `0x0E6CF5` | `0x0E6CFD` | 8 | 2 | 0 | NPC Properties |  | `18 3a 41 35 0d 11 0d 20` |
| `0x0E6D73` | `0x0E6D7B` | 8 | 2 | 0 | NPC Properties |  | `18 f8 40 35 24 11 0d 20` |
| `0x0E6E22` | `0x0E6E2A` | 8 | 2 | 0 | NPC Properties |  | `18 fa 40 35 0d 11 0d 20` |
| `0x0E6E84` | `0x0E6E8C` | 8 | 2 | 0 | NPC Properties |  | `18 38 41 35 0d 11 0d 20` |
| `0x0E7251` | `0x0E7267` | 22 | 2 | 0 | NPC Properties |  | `24 89 02 42 08 2d 0d 40` |
| `0x0E776E` | `0x0E777D` | 15 | 2 | 0 | NPC Properties |  | `21 ea 01 41 20 1d 0a 40` |
| `0x0E78D3` | `0x0E78DB` | 8 | 2 | 0 | NPC Properties |  | `18 9a 00 47 38 1f 0f 38` |
| `0x0E844F` | `0x0E845E` | 15 | 2 | 0 | NPC Properties |  | `40 9a 02 24 07 1f 04 41` |
| `0x0E8480` | `0x0E8488` | 8 | 2 | 0 | NPC Properties |  | `41 75 02 46 0d 25 0d 41` |
| `0x0E864A` | `0x0E864F` | 5 | 2 | 0 | NPC Properties |  | `3b 0c 0f 0e 60 ff 00 01` |
| `0x0E8743` | `0x0E874B` | 8 | 2 | 0 | NPC Properties |  | `40 ff 00 3c 09 06 04 44` |
| `0x0E9279` | `0x0E9281` | 8 | 2 | 0 | NPC Properties |  | `58 80 40 11 00 00 14 58` |
| `0x101F99` | `0x101FBA` | 33 | 2 | 0 | Monster Properties |  | `58 00 00 60 00 fc 39 4c` |
| `0x10E192` | `0x10E194` | 2 | 0 | 2 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips, Final Fantasy V-Pixel Freemaster (v4.85 by Nintenja and Various authors).7z::Final Fantasy V-Pixel Freemaster (All Jobs Unlocked not included & No 2x abp,gil,xp).ips | `91 89 ff 08 0b 00 40 5f` |
| `0x11148E` | `0x111492` | 4 | 0 | 2 | Item Names | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `f5 73 90 b2 6b 7a 87 7c` |
| `0x1114FC` | `0x1114FE` | 2 | 0 | 2 | Item Names | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `82 8b 61 85 7a 7d 7e ea` |
| `0x111621` | `0x111623` | 2 | 0 | 2 | Item Names | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `99 8c ef 71 88 89 7e ff` |
| `0x1116CE` | `0x1116D8` | 10 | 0 | 2 | Item Names | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `d0 65 85 7a 94 ff ff ff` |
| `0x114164` | `0x114175` | 17 | 0 | 2 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `b1 99 ff 8c 8d 7a 8d 8e` |
| `0x11567B` | `0x11567D` | 2 | 0 | 2 | Job Name | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `7e 8b ff ff ff 62 81 7e` |
| `0x11628B` | `0x116296` | 11 | 0 | 2 | Innate Ability Name (Short) | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `a3 66 8b 82 89 63 8e 7a` |
| `0x1172A3` | `0x1172C4` | 33 | 0 | 2 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `b1 8c 00 69 8e 86 89 ff` |
| `0x1176ED` | `0x117703` | 22 | 0 | 2 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `b1 8c 00 76 82 89 7e ff` |
| `0x117893` | `0x1178A8` | 21 | 0 | 2 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `b1 8c 00 71 7e 8f 82 8f` |
| `0x117E63` | `0x117E7D` | 26 | 0 | 2 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `01 7e 8d 81 bb 8c 00 62` |
| `0x11F9F1` | `0x11FA00` | 15 | 0 | 2 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, GBA Font.ips | `60 ff 30 ff 18 ff 08 ff` |
| `0x1A86D0` | `0x1A86D3` | 3 | 2 | 0 | Map Sprite Graphics |  | `17 50 1f 50 0f 20 02 00` |
| `0x1A879A` | `0x1A87BB` | 33 | 2 | 0 | Map Sprite Graphics |  | `1f 42 0f 40 0e 01 00 00` |
| `0x200483` | `0x200485` | 2 | 0 | 2 | Monster Name | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `7e 8b ff ff ff 73 8b 82` |
| `0x200B09` | `0x200B0B` | 2 | 0 | 2 | Monster Name | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `8b 92 ff ff ff 64 91 7d` |
| `0x275264` | `0x275275` | 17 | 0 | 2 | Item Description | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `b1 99 ff 8c 8d 7a 8d 8e` |
| `0x022422` | `0x022423` | 1 | 1 | 0 |  |  | `ff 9d 04 7c ee c7 7c a5` |
| `0x022491` | `0x022492` | 1 | 0 | 1 |  | [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `c1 01 18 69 78 38 ed e2` |
| `0x02E3C2` | `0x02E3C3` | 1 | 1 | 0 |  |  | `9b 00 9d 00 00 e8 e8 a0` |
| `0x03B17B` | `0x03B17C` | 1 | 1 | 0 |  |  | `20 1e 80 04 29 00 19 20` |
| `0x03FAB0` | `0x03FAB1` | 1 | 0 | 1 |  | Final Fantasy V - GBA Script Port.ips, Final Fantasy V Tweaks v2.7a.ips, Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips | `54 00 00 00 00 00 00 00` |
| `0x0E59C6` | `0x0E59C7` | 1 | 1 | 0 |  |  | `58 04 02 04 02 04 02 04` |
| `0x0E5EC4` | `0x0E5EC5` | 1 | 1 | 0 | NPC Properties |  | `20 80 00 4d 11 1d 04 00` |
| `0x0E6562` | `0x0E6563` | 1 | 1 | 0 | NPC Properties |  | `42 0c 00 4e 00 00 04 40` |
| `0x0E66B9` | `0x0E66BA` | 1 | 1 | 0 | NPC Properties |  | `00 9a 40 50 1b 09 04 04` |
| `0x0E6AE8` | `0x0E6AE9` | 1 | 1 | 0 | NPC Properties |  | `44 9e 00 44 07 0c 0e 20` |
| `0x0E6BD6` | `0x0E6BD7` | 1 | 1 | 0 | NPC Properties |  | `04 7f c0 4e 11 20 0c 00` |
| `0x0E7075` | `0x0E7076` | 1 | 1 | 0 | NPC Properties |  | `44 80 00 4d 14 38 04 60` |
| `0x0E70E1` | `0x0E70E2` | 1 | 1 | 0 | NPC Properties |  | `46 0f 0e 04 60 80 00 19` |
| `0x0E719B` | `0x0E719C` | 1 | 1 | 0 | NPC Properties |  | `41 46 01 28 20 1c 09 20` |
| `0x0E7219` | `0x0E721A` | 1 | 1 | 0 | NPC Properties |  | `41 4c 01 40 0c 0b 0d 00` |
| `0x0E769C` | `0x0E769D` | 1 | 1 | 0 | NPC Properties |  | `41 b4 01 22 21 29 00 21` |
| ... 55 smaller regions in orphan_regions.csv | | | | | | | |

## Unaccounted regions, expansion territory — 3 regions

Special-case area past the RPGe ROM end (0x280000): clean value assumed 0x00. Expect DressCode-adjacent space and hand-imported sprite art here.

| start | end | span | orphan | touched | annotation | touching_patches | first_bytes |
|---|---|---|---|---|---|---|---|
| `0x38FFF0` | `0x3CFFFF` | 262159 | 0 | 157022 |  | FFV RPGe Clean Warriors.ips, Final Fantasy V (Japan) [En by RPGe v1.1] - Whirlwind - v3.11 by clymax.ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `c2 20 48 e2 20 22 46 f9` |
| `0x2FC000` | `0x2FC200` | 512 | 0 | 510 |  | FFV RPGe Clean Warriors.ips, Final Fantasy V (Japan) [En by RPGe v1.1] - Whirlwind - v3.11 by clymax.ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `0c 0c 0c 0c 0c 0c 0c 0c` |
| `0x2FA509` | `0x2FA687` | 382 | 0 | 21 |  | FFV RPGe Clean Warriors.ips, Final Fantasy V (Japan) [En by RPGe v1.1] - Whirlwind - v3.11 by clymax.ips, [5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips | `15 00 b0 06 a6 8e 5c 09` |
