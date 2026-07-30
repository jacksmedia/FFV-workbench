;Includes: This is where you can customize which sprite file is being loaded for what job.
hirom
!bank1 = $f90000
!bank2 = $fa0000
!bank3 = $fb0000
!bank4 = $fc0000

org !bank1
;Knight / job 00
incbin ./inj/B_knight.bin
incbin ./inj/L_knight.bin
incbin ./inj/G_knight.bin
incbin ./inj/F_knight.bin
incbin ./inj/K_knight.bin
;Monk / job 01
incbin ./inj/B_monk.bin
incbin ./inj/L_monk.bin
incbin ./inj/G_monk.bin
incbin ./inj/F_monk.bin
incbin ./inj/K_monk.bin
;Thief / job 02
incbin ./inj/B_thief.bin
incbin ./inj/L_thief.bin
incbin ./inj/G_drk.bin
incbin ./inj/F_drk.bin
incbin ./inj/K_drk.bin
;Dragoon / job 03
incbin ./inj/B_dragoon.bin
incbin ./inj/L_dragoon.bin
incbin ./inj/G_dragoon.bin
incbin ./inj/F_dragoon.bin
incbin ./inj/K_dragoon.bin
;Ninja / job 04
incbin ./inj/B_ninja.bin
incbin ./inj/L_ninja.bin
incbin ./inj/G_ninja.bin
incbin ./inj/F_ninja.bin
incbin ./inj/K_ninja.bin
;Samurai / job 05
incbin ./inj/B_samurai.bin
incbin ./inj/L_samurai.bin
incbin ./inj/G_samurai.bin
incbin ./inj/F_samurai.bin
incbin ./inj/K_samurai.bin


org !bank2
;Berserker / job 06
incbin ./inj/B_berserker.bin
incbin ./inj/L_berserker.bin
incbin ./inj/G_astrologer.bin
incbin ./inj/F_astrologer.bin
incbin ./inj/K_astrologer.bin
;Ranger / job 07
incbin ./inj/B_ranger.bin
incbin ./inj/L_ranger.bin
incbin ./inj/G_ranger.bin
incbin ./inj/F_ranger.bin
incbin ./inj/K_ranger.bin
;Mystic / job 08
incbin ./inj/B_mystic.bin
incbin ./inj/L_mystic.bin
incbin ./inj/G_viking.bin
incbin ./inj/F_viking.bin
incbin ./inj/K_viking.bin
;White mage / job 09
incbin ./inj/B_white.bin
incbin ./inj/L_white.bin
incbin ./inj/G_white.bin
incbin ./inj/F_white.bin
incbin ./inj/K_whiteIC.bin
;Black mage / job 10/$0A
incbin ./inj/B_black.bin
incbin ./inj/L_black.bin
incbin ./inj/G_black.bin
incbin ./inj/F_black.bin
incbin ./inj/K_black.bin
;Time mage / job 11/$0B
incbin ./inj/B_time.bin
incbin ./inj/L_time.bin
incbin ./inj/G_time.bin
incbin ./inj/F_time.bin
incbin ./inj/K_time.bin


org !bank3
;Summoner / job 12/0C
incbin ./inj/B_summon.bin
incbin ./inj/L_summon.bin
incbin ./inj/G_summoner.bin
incbin ./inj/F_summoner.bin
incbin ./inj/K_summoner.bin
;Blue mage / job 13/$0D
incbin ./inj/B_blue.bin
incbin ./inj/L_blue.bin
incbin ./inj/G_psychic.bin
incbin ./inj/F_psychic.bin
incbin ./inj/K_psychic.bin
;Red mage / job 14/$0E
incbin ./inj/B_red.bin
incbin ./inj/L_red.bin
incbin ./inj/G_red.bin
incbin ./inj/F_red.bin
incbin ./inj/K_red.bin
;Beastmaster / job 15/$0F
incbin ./inj/B_beast.bin
incbin ./inj/L_beast.bin
incbin ./inj/G_moogle.bin
incbin ./inj/F_moogle.bin
incbin ./inj/K_moogle.bin
;Chemist / job 16/$10
incbin ./inj/B_chem.bin
incbin ./inj/L_chem.bin
incbin ./inj/G_alchemist.bin
incbin ./inj/F_alchemist.bin
incbin ./inj/K_alchemist.bin
;Geomancer / job 17/$11
incbin ./inj/B_geo.bin
incbin ./inj/L_geo.bin
incbin ./inj/G_imitator.bin
incbin ./inj/F_imitator.bin
incbin ./inj/K_imitator.bin
;tied
incbin ./inj/A_tied.bin
;vanillapalette
vanillapaletteloc:
incbin ./inj/B_vanilla.pal
incbin ./inj/L_vanilla.pal
incbin ./inj/G_vanilla.pal
incbin ./inj/F_vanilla.pal
incbin ./inj/K_vanilla.pal
;formal
formalpaletteloc:
incbin ./inj/B_formal.pal
incbin ./inj/L_formal.pal
incbin ./inj/G_formal.pal
incbin ./inj/F_formal.pal
incbin ./inj/K_formal.pal


org !bank4
;Bard / job 18/$12
incbin ./inj/B_bard.bin
incbin ./inj/L_bard.bin
incbin ./inj/G_bard.bin
incbin ./inj/F_bard.bin
incbin ./inj/K_bard.bin
;Dancer / job 19/$13
incbin ./inj/B_dancer.bin
incbin ./inj/L_dancer.bin
incbin ./inj/G_shaman.bin
incbin ./inj/F_shaman.bin
incbin ./inj/K_shaman.bin
;Mime / job 20/$14
incbin ./inj/B_mime.bin
incbin ./inj/L_mime.bin
incbin ./inj/G_holymage.bin
incbin ./inj/F_holymage.bin
incbin ./inj/K_holymage.bin
;freelancer
incbin ./inj/B_free.bin
incbin ./inj/L_free.bin
incbin ./inj/G_free.bin
incbin ./inj/F_free.bin
incbin ./inj/K_free.bin
;special sprites
;freelancer "vanilla" style
incbin ./inj/B_vanilla.bin
incbin ./inj/L_vanilla.bin
incbin ./inj/G_vanilla.bin
incbin ./inj/F_vanilla.bin
incbin ./inj/K_vanilla.bin
;formal attire
incbin ./inj/B_formal.bin
incbin ./inj/L_formal.bin
incbin ./inj/G_formal.bin
incbin ./inj/F_formal.bin
incbin ./inj/K_formal.bin
;mini
incbin ./inj/A_mini.bin
;toad
incbin ./inj/A_toad.bin