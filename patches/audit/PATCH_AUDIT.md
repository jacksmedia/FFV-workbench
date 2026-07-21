# Patch audit: what is baked into ffvclean-wip.sfc?

- Target: `ffvclean-wip.sfc` (4,194,304 bytes)
- Clean baseline: `ff5 RPGe [crc32=17444605].sfc` (2,621,440 bytes; offsets beyond it assume 0x00 expansion fill)
- Verdicts use *informative* bytes only (patch value != clean value); APPLIED needs >= 97% of them present.
- `delta` = alignment: -512 means the patch was made for a ROM with a copier header.
- Uninstall/anti patches restore clean bytes, so they score NO-OP against the clean baseline by construction.

## Recipe ingredients (>= 97% of meaningful bytes present) — 37

| patch | informative match | raw match | inf. bytes | delta | notes |
|---|---|---|---|---|---|
| `backups, other ppls patches\[6789]Final+Fantasy+V+Tweaks+v2.7b\Optional Patches\PS1_Dash.ips` | 100.0% | 100.0% | 38 | 0 |  |
| `backups, other ppls patches\[6858]ff5_replace_drag_spell_v1.0\ff5_drag_to_mpcharge_self.ips` | 100.0% | 100.0% | 14 | 0 | 1 duplicate copy(ies) |
| `backups, other ppls patches\[6858]ff5_replace_drag_spell_v1.0\Optional Rename Patches\ff5_optional_rename_surge.ips` | 100.0% | 100.0% | 4 | 0 | 1 duplicate copy(ies) |
| `backups, other ppls patches\ff5_msu1_translation_v2 kurrono.ips` | 100.0% | 100.0% | 450 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_auto_jump.ips` | 100.0% | 100.0% | 30 | 0 | 1 duplicate copy(ies) |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_check.ips` | 100.0% | 100.0% | 1 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_equip_change.ips` | 100.0% | 100.0% | 262 | 0 | 1 duplicate copy(ies) |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_optimize.ips` | 100.0% | 100.0% | 319 | 0 | 1 duplicate copy(ies) |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_remedy_petrified.ips` | 100.0% | 100.0% | 1 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_swdslap.ips` | 100.0% | 100.0% | 31 | 0 |  |
| `FFV inu patches (2008 - 2010)\ff5_swdslap_standalone by RoSoDude.ips` | 100.0% | 100.0% | 106 | 0 |  |
| `FFV inu patches (2008 - 2010)\improve\ff5_atb_switch (aka X button swap).ips` | 100.0% | 100.0% | 265 | 0 |  |
| `FFV inu patches (2008 - 2010)\improve\ff5_dash_ps.ips` | 100.0% | 100.0% | 39 | 0 |  |
| `FFV inu patches (2008 - 2010)\improve\ff5_fast_menu_scroll.ips` | 100.0% | 100.0% | 26 | 0 |  |
| `FFV inu patches (2008 - 2010)\improve\ff5_flee.ips` | 100.0% | 100.0% | 84 | 0 |  |
| `FFV inu patches (2008 - 2010)\improve\ff5_hp_color.ips` | 100.0% | 100.0% | 63 | 0 |  |
| `FFV inu patches (2008 - 2010)\improve\ff5_item_menu.ips` | 100.0% | 100.0% | 107 | 0 |  |
| `FFV inu patches (2008 - 2010)\improve\ff5_items_total.ips` | 100.0% | 100.0% | 79 | 0 |  |
| `FFV inu patches (2008 - 2010)\improve\ff5_lr_menu-1.0.ips` | 100.0% | 100.0% | 2889 | 0 |  |
| `FFV inu patches (2008 - 2010)\improve\ff5_sword_dance.ips` | 100.0% | 100.0% | 96 | 0 |  |
| `FFV inu patches (2008 - 2010)\improve\tactical Berserk\ff5_berserk_command.ips` | 100.0% | 100.0% | 53 | 0 |  |
| `FFV inu patches (2008 - 2010)\updates\ff5_core-1.4_to_1.5.ips` | 100.0% | 100.0% | 430 | 0 |  |
| `mine\_Final Fantasy V J (CRC32 = C1BC267D) Galuf Green Coat on Map.ips` | 100.0% | 100.0% | 279 | 0 | 1 duplicate copy(ies) |
| `mine\DualCast for Clean.ips` | 100.0% | 100.0% | 7 | 0 |  |
| `mine\FF5r ALT CID.ips` | 100.0% | 100.0% | 603 | 0 | 1 duplicate copy(ies) |
| `mine\FFV RPGe without 'abc' in Naming Menu, by xJ4cks.ips` | 100.0% | 100.0% | 9 | 0 |  |
| `mine\RapidFire for Clean.ips` | 100.0% | 100.0% | 7 | 0 |  |
| `plz sort\FFV - Weapon 1.7 Equip for Thief, Ninja.ips` | 100.0% | 100.0% | 6 | 0 |  |
| `mine\FFV RPGe Clean NPCs.ips` | 100.0% | 100.0% | 136814 | 0 |  |
| `mine\FFV RPGe Clean NPCs - xJ4cks.ips` | 100.0% | 100.0% | 136815 | 0 |  |
| `backups, other ppls patches\[6789]Final+Fantasy+V+Tweaks+v2.7b\Optional Patches\Inus_patches.ips` | 99.8% | 99.9% | 3975 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_reequip.ips` | 99.5% | 99.6% | 440 | 0 |  |
| `plz sort\new Krile - xJ4cks .ips` | 99.4% | 99.6% | 1036 | 0 |  |
| `backups, other ppls patches\lrleader - Cubear.ips` | 99.3% | 99.4% | 613 | 0 | 636B in expanded area |
| `plz sort\Krile Freelancer Fixer v3 - xJ4cks .ips` | 99.3% | 99.4% | 824 | 0 |  |
| `FFV inu patches (2008 - 2010)\improve\ff5_sort.ips` | 98.1% | 98.1% | 154 | 0 |  |
| `mine\FFV Clean Krile+Lenna.ips` | 97.1% | 97.7% | 24457 | 0 |  |

## Partially present (applied then partly overwritten, or overlapping patches) — 47

| patch | informative match | raw match | inf. bytes | delta | notes |
|---|---|---|---|---|---|
| `backups, other ppls patches\start encounters - Cubear.ips` | 95.1% | 95.3% | 82 | 0 | 68B in expanded area |
| `plz sort\Cid canon sprites FFVJ - xJ4cks .ips` | 92.5% | 94.6% | 586 | 0 |  |
| `mine\unchibi Jobless v1.0 (RPGe).ips` | 91.3% | 93.1% | 24234 | 0 |  |
| `mine\FFV Clean Krile + Lenna + Bartz.ips` | 90.7% | 92.5% | 27208 | 0 |  |
| `cosmetic patches\FFV Sprite Touch-ups v103 by ChickenKnife.ips` | 89.6% | 91.1% | 452 | 0 |  |
| `plz sort\FFV Clean - Serity's Equip Icons upgrade.ips` | 88.1% | 92.9% | 160 | 0 | 196B in expanded area |
| `mine\Final Fantasy V Pantz n Sleeves 4.ips` | 84.0% | 89.8% | 493 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_berserk_jump.ips` | 79.6% | 80.4% | 49 | 0 | 1 duplicate copy(ies) |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_butz_blue_mage_gfx.ips` | 77.0% | 78.1% | 61 | 0 |  |
| `mine\Cleaner Font for FFV+FF5r.ips` | 74.6% | 80.8% | 2896 | 0 |  |
| `backups, other ppls patches\[5665]ff5_dbl_xp_gold_abp.zip::FFV Clean v195.ips` | 67.5% | 94.6% | 360788 | 0 | 1572864B in expanded area |
| `backups, other ppls patches\[6789]Final+Fantasy+V+Tweaks+v2.7b\Optional Patches\PS1 Font.ips` | 63.6% | 67.9% | 1436 | 0 |  |
| `mine\Galuf Mime by xJ4cks.ips` | 62.7% | 67.6% | 1318 | 0 |  |
| `mine\FFV(RPGe) Galuf Mimic - xJ4cks.ips` | 62.3% | 67.3% | 1314 | 0 |  |
| `backups, other ppls patches\Game versions\[5790]Super_Custom_Classes_v100 - ludmeister + FlamePurge.zip::Super_Custom_Classes_v100.ips` | 61.7% | 68.3% | 1845 | 0 |  |
| `plz sort\FF5Clean Castlevania3 Font (xJ4cks & sleepyren).ips` | 60.1% | 63.4% | 1347 | 0 |  |
| `FFV inu patches (2008 - 2010)\improve\ff5_kiss_of_blessing.ips` | 51.6% | 51.6% | 31 | 0 |  |
| `backups, other ppls patches\[6789]Final+Fantasy+V+Tweaks+v2.7b\Optional Patches\Old Font.ips` | 51.3% | 54.5% | 505 | 0 |  |
| `backups, other ppls patches\[6858]ff5_replace_drag_spell_v1.0\Optional Rename Patches\ff5_optional_rename_chrge.ips` | 50.0% | 60.0% | 4 | 0 | 1 duplicate copy(ies) |
| `FFV inu patches (2008 - 2010)\improve\ff5_font_punctuation --- try this asap.ips` | 48.7% | 56.0% | 150 | -512 |  |
| `backups, other ppls patches\[6858]ff5_replace_drag_spell_v1.0\ff5_drag_to_levelup_self.ips` | 38.5% | 50.0% | 13 | 0 | 1 duplicate copy(ies) |
| `mine\FFV RPGe Clean Warriors.ips` | 38.2% | 92.9% | 184135 | 0 | 1572864B in expanded area |
| `backups, other ppls patches\[6858]ff5_replace_drag_spell_v1.0\ff5_drag_to_nullstatus_self.ips` | 35.7% | 43.8% | 14 | 0 | 1 duplicate copy(ies) |
| `backups, other ppls patches\[6858]ff5_replace_drag_spell_v1.0\ff5_drag_to_haste_self.ips` | 33.3% | 37.5% | 15 | 0 | 1 duplicate copy(ies) |
| `FFV inu patches (2008 - 2010)\base\ff5_core-1.6.ips` | 30.7% | 32.9% | 1400 | 0 |  |
| `backups, other ppls patches\[6789]Final+Fantasy+V+Tweaks+v2.7b\Final Fantasy V Dress Code.ips` | 29.1% | 46.6% | 158661 | 0 | 210681B in expanded area |
| `cosmetic patches\FFV-DressCode-release6\Final.Fantasy.V.Dress.Code by Cubear.ips` | 28.9% | 46.5% | 158564 | 0 | 210660B in expanded area |
| `cosmetic patches\Final_Fantasy_V_Dress_Code beta (Cubear).ips` | 28.7% | 46.4% | 158518 | 0 | 210680B in expanded area |
| `FFV inu patches (2008 - 2010)\base\ff5_core-1.7.ips` | 27.0% | 29.2% | 1594 | 0 | 1 duplicate copy(ies) |
| `backups, other ppls patches\[6858]ff5_replace_drag_spell_v1.0\Optional Rename Patches\ff5_optional_rename_null.ips` | 25.0% | 40.0% | 4 | 0 | 1 duplicate copy(ies) |
| `backups, other ppls patches\[6858]ff5_replace_drag_spell_v1.0\Optional Rename Patches\ff5_optional_rename_null_squish.ips` | 25.0% | 40.0% | 4 | 0 | 1 duplicate copy(ies) |
| `mine\FFV ReJobbed Unchibi Krile by xJ4cks.ips` | 23.2% | 34.0% | 25162 | 0 |  |
| `backups, other ppls patches\[6858]ff5_replace_drag_spell_v1.0\Optional Rename Patches\ff5_optional_rename_nullify_squish.ips` | 20.0% | 20.0% | 5 | 0 | 1 duplicate copy(ies) |
| `backups, other ppls patches\[6858]ff5_replace_drag_spell_v1.0\Optional Rename Patches\ff5_optional_rename_speed.ips` | 20.0% | 20.0% | 5 | 0 | 1 duplicate copy(ies) |
| `FFV inu patches (2008 - 2010)\improve\ff5_dash_gba.ips` | 15.8% | 17.9% | 38 | 0 |  |
| `FFV inu patches (2008 - 2010)\base\ff5_ext-1.2.ips` | 12.3% | 14.7% | 610 | 0 |  |
| `FFV inu patches (2008 - 2010)\improve\ff5_sortplus.ips` | 10.8% | 20.4% | 166 | 0 |  |
| `backups, other ppls patches\[6789]Final+Fantasy+V+Tweaks+v2.7b\Optional Patches\GBA Font.ips` | 9.2% | 16.3% | 2169 | 0 |  |
| `backups, other ppls patches\FFV L+R Leader Swap by Cubear.ips` | 8.8% | 15.1% | 500 | 0 | 519B in expanded area |
| `cosmetic patches\FF5 Character Change 0.3 by Tsushiy\FF5 Character Change 0.3\FF5 Character Change 0.3 (Record Keeper sprites by Tsushiy).ips` | 7.5% | 7.5% | 39765 | 0 | 2 duplicate copy(ies) |
| `backups, other ppls patches\Game versions\Final Fantasy V-Pixel Freemaster (v4.85 by Nintenja and Various authors).7z::Final Fantasy V-Pixel Freemaster (All Jobs Unlocked not included & No 2x abp,gil,xp).ips` | 6.9% | 58.1% | 290334 | 0 |  |
| `backups, other ppls patches\Game versions\Final Fantasy V-Pixel Freemaster (v4.85 by Nintenja and Various authors).7z::Final Fantasy V-Pixel Freemaster-Kick Butz Edition (All Jobs Unlocked Included & No 2x abp,gil,xp).ips` | 6.9% | 58.1% | 290351 | 0 |  |
| `backups, other ppls patches\Game versions\Final Fantasy V-Pixel Freemaster (v4.85 by Nintenja and Various authors).7z::Final Fantasy V-Pixel Freemaster (All Jobs Unlocked not included + 2x abp,gil,xp).ips` | 6.9% | 58.1% | 290394 | 0 |  |
| `backups, other ppls patches\Game versions\Final Fantasy V-Pixel Freemaster (v4.85 by Nintenja and Various authors).7z::Final Fantasy V-Pixel Freemaster-Kick Butz Edition (All Jobs Unlocked Included + 2x abp,gil,xp).ips` | 6.7% | 58.1% | 289027 | 0 |  |
| `backups, other ppls patches\[6789]Final+Fantasy+V+Tweaks+v2.7b\Final Fantasy V Tweaks v2.7a.ips` | 6.5% | 68.9% | 184677 | 0 |  |
| `mine\KrileBlueBeret.ips` | 6.0% | 25.5% | 84 | 0 |  |
| `backups, other ppls patches\[3687]Final+Fantasy+V+-+GBA+Script+Port\ff5\Final Fantasy V - GBA Script Port.ips` | 5.8% | 65.9% | 197835 | 0 | 1 duplicate copy(ies) |

## Not applied — 129

| patch | informative match | raw match | inf. bytes | delta | notes |
|---|---|---|---|---|---|
| `backups, other ppls patches\真説FF5r-IC Ver.2.0.0.zip::É^ÉαFF5r-IC Ver.2.0.0/É^Éα FF5r-IC Ver.2.0.0/É^ÉαFF5r-IC Disc1.ips` | 5.0% | 5.3% | 80954 | 0 | 2250B in expanded area |
| `backups, other ppls patches\真説FF5r-IC Ver.2.0.0.zip::É^ÉαFF5r-IC Ver.2.0.0/É^Éα FF5r-IC Ver.2.0.0/É^ÉαFF5r-IC Disc2.ips` | 4.2% | 4.7% | 97513 | 0 | 4195B in expanded area |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_dead_aegis_shield.ips` | 4.2% | 4.2% | 24 | -512 | uninstall |
| `backups, other ppls patches\真説FF5r-IC Ver.2.0.0.zip::É^ÉαFF5r-IC Ver.2.0.0/É^Éα FF5r-IC Ver.2.0.0/É^ÉαFF5r-IC Disc3.ips` | 3.9% | 4.5% | 106459 | 0 | 5851B in expanded area |
| `FFV inu patches (2008 - 2010)\improve\ff5_steal3x.ips` | 3.9% | 5.3% | 258 | -512 |  |
| `backups, other ppls patches\[3687]Final+Fantasy+V+-+GBA+Script+Port\ff5\Bugfixes.ips` | 3.4% | 10.7% | 85678 | 0 | 1 duplicate copy(ies) |
| `backups, other ppls patches\FFV [T+Spa1_06f_noisecross] interesting icons\Final Fantasy V (J) [T+Spa1.06f_noisecross][CRC32_4BADF779].ips` | 3.3% | 65.4% | 200829 | 0 |  |
| `cosmetic patches\Final Fantasy V vanilla field sprites.ips` | 1.7% | 18.2% | 646 | -512 |  |
| `FFV inu patches (2008 - 2010)\improve\ff5_player_name.ips` | 1.6% | 4.5% | 64 | -512 |  |
| `mine\KrileRedBeret (to restore Vanilla BlueMage battle sprites).ips` | 1.0% | 6.6% | 100 | -512 |  |
| `mine\_FFV Advanced Items v01.ips` | 1.0% | 28.1% | 523 | 0 |  |
| `plz sort\Final Fantasy V (Japan) [En by RPGe v1.1] - Whirlwind - v3.11 by clymax.ips` | 0.1% | 87.0% | 237565 | 0 | 1572864B in expanded area |
| `backups, other ppls patches\[3687]Final+Fantasy+V+-+GBA+Script+Port\ff5\Ginger Battle Galuf.ips` | 0.0% | 0.0% | 132 | 0 | 1 duplicate copy(ies) |
| `backups, other ppls patches\[6710]Final+Fantasy+V+Better+Job+Equipment+by+T92\Final Fantasy V Better Job Equipment.ips` | 0.0% | 0.0% | 8 | 0 | 2 duplicate copy(ies) |
| `backups, other ppls patches\[6858]ff5_replace_drag_spell_v1.0\ff5_optional_rename_lv_up.ips` | 0.0% | 0.0% | 5 | 0 | 2 duplicate copy(ies) |
| `backups, other ppls patches\[6858]ff5_replace_drag_spell_v1.0\Optional Rename Patches\ff5_optional_rename_boost.ips` | 0.0% | 0.0% | 5 | 0 | 1 duplicate copy(ies) |
| `backups, other ppls patches\[6858]ff5_replace_drag_spell_v1.0\Optional Rename Patches\ff5_optional_rename_focus.ips` | 0.0% | 0.0% | 5 | 0 | 1 duplicate copy(ies) |
| `backups, other ppls patches\[6858]ff5_replace_drag_spell_v1.0\Optional Rename Patches\ff5_optional_rename_level.ips` | 0.0% | 0.0% | 5 | 0 | 1 duplicate copy(ies) |
| `backups, other ppls patches\[6858]ff5_replace_drag_spell_v1.0\Optional Rename Patches\ff5_optional_rename_mp_up.ips` | 0.0% | 0.0% | 5 | 0 | 1 duplicate copy(ies) |
| `backups, other ppls patches\[7573]Final+Fantasy+V+Easy+Learning\Auto Learning.ips` | 0.0% | 0.0% | 8 | 0 |  |
| `backups, other ppls patches\[7573]Final+Fantasy+V+Easy+Learning\Easy Learning.ips` | 0.0% | 10.9% | 82 | 0 |  |
| `backups, other ppls patches\[8749](FF5+Double+EXP,+Gold+and+ABP+1.0+by+C_CliFF)+(bugfixes+1.1+by+clymax)\ff5_dbl_xp_gold_abp_headered.ips` | 0.0% | 0.0% | 60 | 0 | 2 duplicate copy(ies) |
| `backups, other ppls patches\[8749](FF5+Double+EXP,+Gold+and+ABP+1.0+by+C_CliFF)+(bugfixes+1.1+by+clymax)\ff5_dbl_xp_gold_abp_unheadered.ips` | 0.0% | 1.7% | 59 | -512 | 2 duplicate copy(ies) |
| `backups, other ppls patches\[8749](FF5+Double+EXP,+Gold+and+ABP+1.0+by+C_CliFF)+(bugfixes+1.1+by+clymax)\Final Fantasy V (Japan) [En by RPGe v1.1] (FF5 Double EXP, Gold and ABP 1.0 by C_CliFF) (bugfixes 1.1 by clymax).ips` | 0.0% | 7.7% | 48 | 0 | 1 duplicate copy(ies) |
| `backups, other ppls patches\FF5 Map Always Available (by Tzepish).ips` | 0.0% | 0.0% | 2 | 0 |  |
| `backups, other ppls patches\MrShutCo-bettershop-wip\FF5 Better Shop depatcher.ips` | 0.0% | 99.3% | 4 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_atomos_wormhole.ips` | 0.0% | 0.0% | 7 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_chemist_ending.ips` | 0.0% | 0.0% | 3 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_condemned.ips` | 0.0% | 2.5% | 79 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_counter.ips` | 0.0% | 0.0% | 2 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_damage_overflow.ips` | 0.0% | 0.0% | 26 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_damage_overflow_mp.ips` | 0.0% | 0.0% | 72 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_darkbow.ips` | 0.0% | 0.0% | 7 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_dead_aegis_shield.ips` | 0.0% | 4.2% | 23 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_escape.ips` | 0.0% | 0.0% | 5 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_evade_animation.ips` | 0.0% | 3.4% | 85 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_evade_overflow.ips` | 0.0% | 4.9% | 58 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_gaiahammer.ips` | 0.0% | 14.3% | 12 | -512 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_giantdrink_enemy.ips` | 0.0% | 5.1% | 37 | -512 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_golem.ips` | 0.0% | 11.1% | 8 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_hide_escape.ips` | 0.0% | 2.0% | 50 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_hide_reveal.ips` | 0.0% | 5.3% | 18 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_hp_leak_counter.ips` | 0.0% | 15.4% | 22 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_hp_leak_down.ips` | 0.0% | 0.0% | 6 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_ineffective.ips` | 0.0% | 0.0% | 13 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_infinite_items.ips` | 0.0% | 0.0% | 1 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_item_delay.ips` | 0.0% | 0.0% | 17 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_item_evade.ips` | 0.0% | 0.0% | 11 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_item_stat_bonus.ips` | 0.0% | 0.0% | 40 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_item_transform.ips` | 0.0% | 0.0% | 11 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_item_weight.ips` | 0.0% | 31.6% | 13 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_learning.ips` | 0.0% | 5.5% | 188 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_magical_weapon.ips` | 0.0% | 7.1% | 13 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_magicshell.ips` | 0.0% | 5.4% | 141 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_magicshell_fast.ips` | 0.0% | 4.3% | 88 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_magicshell_group.ips` | 0.0% | 0.0% | 2 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_magicshell_reflect.ips` | 0.0% | 0.0% | 2 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_mimic_blank.ips` | 0.0% | 0.0% | 5 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_mimic_meteor.ips` | 0.0% | 4.2% | 113 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_mimic_weapon.ips` | 0.0% | 0.0% | 18 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_mini_and_toad.ips` | 0.0% | 0.0% | 6 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_multi_se.ips` | 0.0% | 0.0% | 1 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_old.ips` | 0.0% | 8.3% | 55 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_old_timer.ips` | 0.0% | 8.3% | 11 | -512 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_possess.ips` | 0.0% | 0.0% | 1 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_powerdrink.ips` | 0.0% | 1.8% | 54 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_react_against_all_target.ips` | 0.0% | 5.6% | 17 | -512 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_react_against_reflect.ips` | 0.0% | 3.8% | 50 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_reapply_item_element.ips` | 0.0% | 8.7% | 95 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_reapply_item_immunity.ips` | 0.0% | 0.0% | 9 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_reapply_item_state.ips` | 0.0% | 1.4% | 70 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_remember.ips` | 0.0% | 0.0% | 1 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_return.ips` | 0.0% | 4.9% | 58 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_return_se.ips` | 0.0% | 0.0% | 1 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_roulette.ips` | 0.0% | 3.8% | 101 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_sandworm.ips` | 0.0% | 28.0% | 18 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_song.ips` | 0.0% | 11.8% | 45 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_specialty.ips` | 0.0% | 4.8% | 119 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_spellblade_osmose.ips` | 0.0% | 0.0% | 20 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_spellblade_osmose_for_ff5_damage_overflow_mp.ips` | 0.0% | 0.0% | 20 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_stuck_bug.ips` | 0.0% | 3.0% | 96 | -512 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_stuck_teleport.ips` | 0.0% | 7.1% | 13 | -512 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_target_meteor.ips` | 0.0% | 0.0% | 2 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_three_images.ips` | 0.0% | 1.2% | 170 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_twinlance.ips` | 0.0% | 3.5% | 109 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_two_handed.ips` | 0.0% | 1.4% | 140 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_unequip_freeze.ips` | 0.0% | 0.0% | 7 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_uptempo_freeze.ips` | 0.0% | 6.9% | 27 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_weak_category.ips` | 0.0% | 3.0% | 128 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_weapon_change_counter.ips` | 0.0% | 5.0% | 57 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_x-redirect.ips` | 0.0% | 0.0% | 2 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_zombie_breath.ips` | 0.0% | 11.1% | 8 | -512 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_zombie_catch.ips` | 0.0% | 0.0% | 1 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_zombie_freeze.ips` | 0.0% | 5.5% | 120 | 0 |  |
| `FFV inu patches (2008 - 2010)\bugfixes\ff5_zombie_powder.ips` | 0.0% | 5.9% | 16 | 0 |  |
| `FFV inu patches (2008 - 2010)\improve\ff5_ability_menu --- what does this do.ips` | 0.0% | 2.1% | 47 | 0 |  |
| `FFV inu patches (2008 - 2010)\improve\ff5_fast_nothing.ips` | 0.0% | 0.0% | 16 | 0 |  |
| `FFV inu patches (2008 - 2010)\improve\ff5_fast_nothing_old.ips` | 0.0% | 3.5% | 139 | 0 |  |
| `FFV inu patches (2008 - 2010)\improve\ff5_field_dash.ips` | 0.0% | 1.4% | 73 | -512 |  |
| `FFV inu patches (2008 - 2010)\improve\ff5_lv5_death.ips` | 0.0% | 6.2% | 15 | 0 |  |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_core-1.6.ips` | 0.0% | 99.4% | 8 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_fast_nothing.ips` | 0.0% | 0.0% | 16 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_item_evade.ips` | 0.0% | 9.1% | 10 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_item_weight.ips` | 0.0% | 0.0% | 19 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_magicshell_fast.ips` | 0.0% | 3.3% | 89 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_magicshell_group.ips` | 0.0% | 50.0% | 1 | -512 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_magicshell_reflect.ips` | 0.0% | 0.0% | 2 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_mimic_blank.ips` | 0.0% | 0.0% | 5 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_mimic_weapon.ips` | 0.0% | 0.0% | 18 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_player_name.ips` | 0.0% | 78.8% | 14 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_reapply_item_element.ips` | 0.0% | 77.9% | 23 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_reapply_item_immunity.ips` | 0.0% | 0.0% | 9 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_swdslap.ips` | 0.0% | 6.1% | 31 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\updates\ff5_core-1.5_to_1.6+monsters_magic_point+reapply_item_immunity.ips` | 0.0% | 14.8% | 341 | 0 |  |
| `FFV inu patches (2008 - 2010)\updates\ff5_core-1.5_to_1.6+monsters_magic_point.ips` | 0.0% | 14.8% | 341 | 0 |  |
| `FFV inu patches (2008 - 2010)\updates\ff5_core-1.5_to_1.6+reapply_item_immunity.ips` | 0.0% | 2.6% | 375 | 0 |  |
| `FFV inu patches (2008 - 2010)\updates\ff5_core-1.6_to_1.7.ips` | 0.0% | 10.2% | 194 | 0 |  |
| `FFV inu patches (2008 - 2010)\updates\ff5_ext-1.0_to_1.1.ips` | 0.0% | 6.1% | 62 | 0 |  |
| `FFV inu patches (2008 - 2010)\updates\ff5_ext-1.1_to_1.2a.ips` | 0.0% | 7.2% | 285 | 0 |  |
| `mine\alt Faris MNK+WHM+DRG.ips` | 0.0% | 25.1% | 869 | 0 |  |
| `mine\Berserker like other Jobs, $029D58-59 into $FF FF (by xJ4cks).ips` | 0.0% | 0.0% | 2 | 0 |  |
| `mine\FFV (RPGe) Even Better Weapons, by xJ4cks.ips` | 0.0% | 69.5% | 25 | 0 |  |
| `mine\FFV Clean Krile.ips` | 0.0% | 36.7% | 93 | 0 |  |
| `mine\Green Shirt Faris Thief.ips` | 0.0% | 27.8% | 265 | 0 |  |
| `mine\Lix & Wind Shrine path\FFV - Accessible Lix, by xJ4cks.ips` | 0.0% | 3.8% | 73132 | 0 | 1 duplicate copy(ies) |
| `plz sort\FFV vanilla Passages, Pitfalls, DmgFloors.ips` | 0.0% | 44.7% | 26 | 0 |  |
| `backups, other ppls patches\[6893]ff5_nomissables_v1.0 - Tzepish.zip::ff5_nomissables_shop_price_changes.ips` | 0.0% | 18.8% | 69 | 0 |  |
| `backups, other ppls patches\[6893]ff5_nomissables_v1.0 - Tzepish.zip::ff5_nomissables_treasure_monster_changes.ips` | 0.0% | 23.3% | 23 | 0 |  |
| `backups, other ppls patches\[6926]ff5_alljobs - Modoh.zip::ff5_alljobs.ips` | 0.0% | 10.5% | 17 | 0 |  |

## No-op vs clean baseline (mostly uninstall/anti patches) — 73

| patch | informative match | raw match | inf. bytes | delta | notes |
|---|---|---|---|---|---|
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_ability_menu.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_atomos_wormhole.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_auto_jump.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_berserk_jump.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_butz_blue_mage_gfx.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_check.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_chemist_ending.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_condemned.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_counter.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_damage_overflow.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_damage_overflow_mp.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_darkbow.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_dash.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_escape.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_evade_animation.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_evade_overflow.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_ext-1.2.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_fast_nothing_old.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_gaiahammer.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_giantdrink_enemy.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_golem.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_hide_escape.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_hide_reveal.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_hp_leak_counter.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_hp_leak_down.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_ineffective.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_infinite_items.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_item_delay.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_item_menu.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_item_stat_bonus.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_item_transform.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_kiss_of_blessing.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_learning.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_lv5_death.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_magical_weapon.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_magicshell.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_mimic_meteor.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_mini_and_toad.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_multi_se.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_old.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_old_timer.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_possess.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_powerdrink.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_react_against_all_target.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_react_against_reflect.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_reapply_item_state.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_remedy_petrified.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_remember.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_return.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_return_se.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_roulette.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_sandworm.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_song.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_sort.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_specialty.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_spellblade_osmose.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_stuck_bug.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_stuck_teleport.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_target_meteor.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_three_images.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_twinlance.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_two_handed.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_unequip_freeze.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_uptempo_freeze.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_weak_category.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_weapon_change_counter.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_x-redirect.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_zombie_breath.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_zombie_catch.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_zombie_freeze.ips` | - | 100.0% | 0 | 0 | uninstall |
| `FFV inu patches (2008 - 2010)\uninstall\anti_ff5_zombie_powder.ips` | - | 100.0% | 0 | 0 | uninstall |
| `mine\Lix & Wind Shrine path\FFV - Original Lix, by xJ4cks.ips` | - | 100.0% | 0 | 0 | 1 duplicate copy(ies) |
| `mine\Original (Ugly) Shirt Faris Thief.ips` | - | 100.0% | 0 | 0 |  |

## All bytes outside the target ROM — 0

## Unparseable files — 7

- `backups, other ppls patches\[6789]Final+Fantasy+V+Tweaks+v2.7b\Optional Patches\._GBA Font.ips`: missing PATCH magic
- `backups, other ppls patches\[6789]Final+Fantasy+V+Tweaks+v2.7b\Optional Patches\._Inus_patches.ips`: missing PATCH magic
- `backups, other ppls patches\[6789]Final+Fantasy+V+Tweaks+v2.7b\Optional Patches\._Old Font.ips`: missing PATCH magic
- `backups, other ppls patches\[6789]Final+Fantasy+V+Tweaks+v2.7b\Optional Patches\._PS1 Font.ips`: missing PATCH magic
- `backups, other ppls patches\[6789]Final+Fantasy+V+Tweaks+v2.7b\Optional Patches\._PS1_Dash.ips`: missing PATCH magic
- `backups, other ppls patches\GBA script patch for RPGe.zip::__MACOSX/GBA script patch for RPGe/._Bugfixes.ips`: missing PATCH magic
- `backups, other ppls patches\GBA script patch for RPGe.zip::__MACOSX/GBA script patch for RPGe/._Final Fantasy V - GBA Script Port.ips`: missing PATCH magic
