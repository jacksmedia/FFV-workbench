;Includes: This is where you can customize which sprite file is being loaded for what job.
pushpc
org !bank1
;Knight / job 00
incbin ./inj/P_knight.bin
incbin ./inj/L_knight.bin
incbin ./inj/G_knight.bin
incbin ./inj/F_knight.bin
incbin ./inj/K_knight.bin
;Monk / job 01
incbin ./inj/P_monk.bin
incbin ./inj/L_monk.bin
incbin ./inj/G_monk.bin
incbin ./inj/F_monk.bin
incbin ./inj/K_monk.bin
;Thief / job 02
incbin ./inj/P_drk.bin
incbin ./inj/L_drk.bin
incbin ./inj/G_drk.bin
incbin ./inj/F_drk.bin
incbin ./inj/K_drk.bin
;Dragoon / job 03
incbin ./inj/P_dragoon.bin
incbin ./inj/L_dragoon.bin
incbin ./inj/G_dragoon.bin
incbin ./inj/F_dragoon.bin
incbin ./inj/K_dragoon.bin
;Ninja / job 04
incbin ./inj/P_ninja.bin
incbin ./inj/L_ninja.bin
incbin ./inj/G_ninja.bin
incbin ./inj/F_ninja.bin
incbin ./inj/K_ninja.bin
;Samurai / job 05
incbin ./inj/P_samurai.bin
incbin ./inj/L_samurai.bin
incbin ./inj/G_samurai.bin
incbin ./inj/F_samurai.bin
incbin ./inj/K_samurai.bin
org !bank2
;Berserker / job 06
incbin ./inj/P_astrologer.bin
incbin ./inj/L_astrologer.bin
incbin ./inj/G_astrologer.bin
incbin ./inj/F_astrologer.bin
incbin ./inj/K_astrologer.bin
;Ranger / job 07
incbin ./inj/P_ranger.bin
incbin ./inj/L_ranger.bin
incbin ./inj/G_ranger.bin
incbin ./inj/F_ranger.bin
incbin ./inj/K_ranger.bin
;Mystic / job 08
incbin ./inj/P_viking.bin
incbin ./inj/L_viking.bin
incbin ./inj/G_viking.bin
incbin ./inj/F_viking.bin
incbin ./inj/K_viking.bin
;White mage / job 09
incbin ./inj/P_white.bin
incbin ./inj/L_white.bin
incbin ./inj/G_white.bin
incbin ./inj/F_white.bin
incbin ./inj/K_white.bin
;Black mage / job 10/$0A
incbin ./inj/P_black.bin
incbin ./inj/L_black.bin
incbin ./inj/G_black.bin
incbin ./inj/F_black.bin
incbin ./inj/K_black.bin
;Time mage / job 11/$0B
incbin ./inj/P_time.bin
incbin ./inj/L_time.bin
incbin ./inj/G_time.bin
incbin ./inj/F_time.bin
incbin ./inj/K_time.bin
org !bank3
;Summoner / job 12/0C
incbin ./inj/P_summoner.bin
incbin ./inj/L_summoner.bin
incbin ./inj/G_summoner.bin
incbin ./inj/F_summoner.bin
incbin ./inj/K_summoner.bin
;Blue mage / job 13/$0D
incbin ./inj/P_psychic.bin
incbin ./inj/L_psychic.bin
incbin ./inj/G_psychic.bin
incbin ./inj/F_psychic.bin
incbin ./inj/K_psychic.bin
;Red mage / job 14/$0E
incbin ./inj/P_red.bin
incbin ./inj/L_red.bin
incbin ./inj/G_red.bin
incbin ./inj/F_red.bin
incbin ./inj/K_red.bin
;Beastmaster / job 15/$0F
incbin ./inj/P_moogle.bin
incbin ./inj/L_moogle.bin
incbin ./inj/G_moogle.bin
incbin ./inj/F_moogle.bin
incbin ./inj/K_moogle.bin
;Chemist / job 16/$10
incbin ./inj/P_alchemist.bin
incbin ./inj/L_alchemist.bin
incbin ./inj/G_alchemist.bin
incbin ./inj/F_alchemist.bin
incbin ./inj/K_alchemist.bin
;Geomancer / job 17/$11
incbin ./inj/P_imitator.bin
incbin ./inj/L_imitator.bin
incbin ./inj/G_imitator.bin
incbin ./inj/F_imitator.bin
incbin ./inj/K_imitator.bin
;modified palette moogle (outdoors)
mod_moogle:
incbin ./inj/A_moogle.bin
;modified moogle (indoors)
org $DA8400
incbin ./inj/A_moogle_v.bin

org !bank4
;Bard / job 18/$12
incbin ./inj/P_minstrel.bin
incbin ./inj/L_minstrel.bin
incbin ./inj/G_minstrel.bin
incbin ./inj/F_minstrel.bin
incbin ./inj/K_minstrel.bin
;Dancer / job 19/$13
incbin ./inj/P_shaman.bin
incbin ./inj/L_shaman.bin
incbin ./inj/G_shaman.bin
incbin ./inj/F_shaman.bin
incbin ./inj/K_shaman.bin
;Mime / job 20/$14
incbin ./inj/P_holy.bin
incbin ./inj/L_holy.bin
incbin ./inj/G_mime.bin
incbin ./inj/F_holy.bin
incbin ./inj/K_holy.bin
;freelancer
incbin ./inj/P_free.bin
incbin ./inj/L_free.bin
incbin ./inj/G_free.bin
incbin ./inj/F_free.bin
incbin ./inj/K_free.bin
;special sprites
;freelancer "vanilla" style
incbin ./inj/P_vanilla.bin
incbin ./inj/L_vanilla.bin
incbin ./inj/G_vanilla.bin
incbin ./inj/F_vanilla.bin
incbin ./inj/K_vanilla.bin
;formal attire
incbin ./inj/P_formal.bin
incbin ./inj/L_formal.bin
incbin ./inj/G_formal.bin
incbin ./inj/F_formal.bin
incbin ./inj/K_formal.bin
;mini
miniloc:
incbin ./inj/A_mini.bin
;toad
toadloc:
incbin ./inj/A_toad.bin

org $db2800
tiedloc:
incbin ./inj/IC_tied.bin
org $dad000
incbin ./inj/A_npcfrog.bin

org $14fe80
;vanillapalette
vanillapaletteloc:
incbin ./inj/P_vanilla.pal
incbin ./inj/L_vanilla.pal
incbin ./inj/G_vanilla.pal
incbin ./inj/F_vanilla.pal
incbin ./inj/K_vanilla.pal
;formal
formalpaletteloc:
incbin ./inj/P_formal.pal
incbin ./inj/L_formal.pal
incbin ./inj/G_formal.pal
incbin ./inj/F_formal.pal
incbin ./inj/K_formal.pal

org $138000
incbin ./inj/G_mime_B.bin ;mime battle sprites
org $14abc0
incbin ./inj/G_mime.pal
pullpc 