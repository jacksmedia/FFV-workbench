;Includes: This is where you can customize which sprite file is being loaded for what job.
pushpc
org !bank1
;Knight / job 00
incbin ./assets/B_knight.bin
incbin ./assets/L_knight.bin
incbin ./assets/G_knight.bin
incbin ./assets/F_knight.bin
incbin ./assets/K_knight.bin
;Monk / job 01
incbin ./assets/B_monk.bin
incbin ./assets/L_monk.bin
incbin ./assets/G_monk.bin
incbin ./assets/F_monk.bin
incbin ./assets/K_monk.bin
;Thief / job 02
incbin ./assets/B_thief.bin
incbin ./assets/L_thief.bin
incbin ./assets/G_thief.bin
incbin ./assets/F_thief.bin
incbin ./assets/K_thief.bin
;Dragoon / job 03
incbin ./assets/B_dragoon.bin
incbin ./assets/L_dragoon.bin
incbin ./assets/G_dragoon.bin
incbin ./assets/F_dragoon.bin
incbin ./assets/K_dragoon.bin
;Ninja / job 04
incbin ./assets/B_ninja.bin
incbin ./assets/L_ninja.bin
incbin ./assets/G_ninja.bin
incbin ./assets/F_ninja.bin
incbin ./assets/K_ninja.bin
;Samurai / job 05
incbin ./assets/B_samurai.bin
incbin ./assets/L_samurai.bin
incbin ./assets/G_samurai.bin
incbin ./assets/F_samurai.bin
incbin ./assets/K_samurai.bin
org !bank2
;Berserker / job 06
incbin ./assets/B_berserker.bin
incbin ./assets/L_berserker.bin
incbin ./assets/G_berserker.bin
incbin ./assets/F_berserker.bin
incbin ./assets/K_berserker.bin
;Ranger / job 07
incbin ./assets/B_ranger.bin
incbin ./assets/L_ranger.bin
incbin ./assets/G_ranger.bin
incbin ./assets/F_ranger.bin
incbin ./assets/K_ranger.bin
;Mystic / job 08
incbin ./assets/B_mystic.bin
incbin ./assets/L_mystic.bin
incbin ./assets/G_mystic.bin
incbin ./assets/F_mystic.bin
incbin ./assets/K_mystic.bin
;White mage / job 09
incbin ./assets/B_white.bin
incbin ./assets/L_white.bin
incbin ./assets/G_white.bin
incbin ./assets/F_white.bin
incbin ./assets/K_white.bin
;Black mage / job 10/$0A
incbin ./assets/B_black.bin
incbin ./assets/L_black.bin
incbin ./assets/G_black.bin
incbin ./assets/F_black.bin
incbin ./assets/K_black.bin
;Time mage / job 11/$0B
incbin ./assets/B_time.bin
incbin ./assets/L_time.bin
incbin ./assets/G_time.bin
incbin ./assets/F_time.bin
incbin ./assets/K_time.bin
org !bank3
;Summoner / job 12/0C
incbin ./assets/B_summon.bin
incbin ./assets/L_summon.bin
incbin ./assets/G_summon.bin
incbin ./assets/F_summon.bin
incbin ./assets/K_summon.bin
;Blue mage / job 13/$0D
incbin ./assets/B_blue.bin
incbin ./assets/L_blue.bin
incbin ./assets/G_blue.bin
incbin ./assets/F_blue.bin
incbin ./assets/K_blue.bin
;Red mage / job 14/$0E
incbin ./assets/B_red.bin
incbin ./assets/L_red.bin
incbin ./assets/G_red.bin
incbin ./assets/F_red.bin
incbin ./assets/K_red.bin
;Beastmaster / job 15/$0F
incbin ./assets/B_beast.bin
incbin ./assets/L_beast.bin
incbin ./assets/G_beast.bin
incbin ./assets/F_beast.bin
incbin ./assets/K_beast.bin
;Chemist / job 16/$10
incbin ./assets/B_chem.bin
incbin ./assets/L_chem.bin
incbin ./assets/G_chem.bin
incbin ./assets/F_chem.bin
incbin ./assets/K_chem.bin
;Geomancer / job 17/$11
incbin ./assets/B_geo.bin
incbin ./assets/L_geo.bin
incbin ./assets/G_geo.bin
incbin ./assets/F_geo.bin
incbin ./assets/K_geo.bin
;modified palette moogle (outdoors)
mod_moogle:
incbin ./assets/A_moogle.bin
;modified moogle (indoors)
org $DA8400
incbin ./assets/A_moogle_v.bin

org !bank4
;Bard / job 18/$12
incbin ./assets/B_bard.bin
incbin ./assets/L_bard.bin
incbin ./assets/G_bard.bin
incbin ./assets/F_bard.bin
incbin ./assets/K_bard.bin
;Dancer / job 19/$13
incbin ./assets/B_dancer.bin
incbin ./assets/L_dancer.bin
incbin ./assets/G_dancer.bin
incbin ./assets/F_dancer.bin
incbin ./assets/K_dancer.bin
;Mime / job 20/$14
incbin ./assets/B_mime.bin
incbin ./assets/L_mime.bin
incbin ./assets/G_mime.bin
incbin ./assets/F_mime.bin
incbin ./assets/K_mime.bin
;freelancer
incbin ./assets/B_free.bin
incbin ./assets/L_free.bin
incbin ./assets/G_free.bin
incbin ./assets/F_free.bin
incbin ./assets/K_free.bin
;special sprites
;freelancer "vanilla" style
incbin ./assets/B_vanilla.bin
incbin ./assets/L_vanilla.bin
incbin ./assets/G_vanilla.bin
incbin ./assets/F_vanilla.bin
incbin ./assets/K_vanilla.bin
;formal attire
incbin ./assets/B_formal.bin
incbin ./assets/L_formal.bin
incbin ./assets/G_formal.bin
incbin ./assets/F_formal.bin
incbin ./assets/K_formal.bin
;mini
miniloc:
incbin ./assets/A_mini.bin
;toad
toadloc:
incbin ./assets/A_toad.bin

org $db2800
tiedloc:
incbin ./assets/A_tied.bin
org $dad000
incbin ./assets/A_npcfrog.bin

org $14fe80
;vanillapalette
vanillapaletteloc:
incbin ./assets/B_vanilla.pal
incbin ./assets/L_vanilla.pal
incbin ./assets/G_vanilla.pal
incbin ./assets/F_vanilla.pal
incbin ./assets/K_vanilla.pal
;formal
formalpaletteloc:
incbin ./assets/B_formal.pal
incbin ./assets/L_formal.pal
incbin ./assets/G_formal.pal
incbin ./assets/F_formal.pal
incbin ./assets/K_formal.pal

org $138000
incbin ./assets/G_mime_B.bin ;mime battle sprites
org $14abc0
incbin ./assets/G_mime.pal
pullpc 