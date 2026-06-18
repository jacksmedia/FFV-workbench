Release URI: http://x11.s11.xrea.com/ff5_bugfixes.zip
                                      Last Modified on: 8 July 2010
                                                Inu <inuchr at gmail.com>

             Final Fantasy V (SFC) patch set

Introduction
--------

ff5_bugfixes - Final Fantasy V (SFC) patch set for SFC version
A patch that fixes/improves various bugs and glitches in Final Fantasy V (hereinafter referred to as FF5).
A collection of files (IPS format). Patch files do not have headers
Apply it to the ROM image file.

You are free to use, modify, and redistribute ff5_bugfixes, but they are provided ``as is'' (AS IS).
shall be provided. There are no guarantees.

Content
----

This archive contains the following files:

asm/
     This directory contains the source code.

base/
     This directory contains patch files to take advantage of the extension.
     vinegar.

bugfix/
     This directory contains patch files for bug/defect fixes.
     vinegar.

improve/
     This directory contains patch files for functionality improvements.

uninstall/
     This directory contains files for reverting to the state before each patch file was applied.
     Contains files.

updates/
     This directory contains patch files for differential updates.

BUG-LIST.txt
     Reference showing bugs fixed and features implemented in FF5 (PS) and FF5A (GBA)
     This is a document.

CHANGES.txt
     Past changes are recorded.

NEWS.txt
     It contains precautions to be taken when updating.

README.txt
     This is the file.

Explanation
----

Below is an explanation of each patch file.

   * Dependencies are files that need to be applied before each patch file is applied.
     shows the file. If you update a file with dependencies, update the files that depend on it.
     The file must also be reapplied. Files included in the uninstall directory
     If you want to undo changes using , apply them in the normal reverse order.
   * Conflict indicates files that cannot be applied at the same time.
   *Note contains additional information.

ff5_core-*.ips
     Update your system:

     - Added the ability to target the 8th monster.
     - Changed the process of setting monster name/parameters:
       o It now works correctly even if the high-order bits of each monster's number are different.
         did
       o Monster number 0xFF is now always treated as 0x00FF.
     - Stalker processing can now be used even in monster parties with fewer than 4 monsters.
     - Specify whether the message after using magic is displayed by enemy or ally attackers.
       Enabled to specify (*1)
     - Monster's maximum MP can be set from the monster data value instead of fixed at 9999.
       (*2)
     - Fixed effect processing:
       o All effect patterns are now disabled after effect processing (white
         (Measures against hole bugs)
       o Fixed a bug where the reflection effect was not displayed for items and special skills.
     - Supports character code 0x11 (item name) up to 9 characters
     - Supports character code 0x12 (magic name) up to 6 characters
     - Corrected an error in the process of determining which character can act first.
     - When an enemy monster sings a song that increases ability values, the wrong character's ability values will be changed.
       Fixed a bug that caused the rise
     - Fixed the monster party branch to accurately check the value of the upper byte.
     - Fixed a bug where the first message was not displayed when reflecting Libra.
     -Fixed a bug where damage calculation would overflow when recovering his MP
     - Corrected a bug where there was an error in the calculation formula for treasure chest recovery rate.
     - Modified so that gil consumed during battle can be reset upon return.
     - Corrected to initialize clone position at the start of battle
     - Fixed a bug where maximum HP did not increase when leveling up in battle using giant medicine.
       Positive
     - Program optimization

     Note 1: Set whether to display when an ally attacks, $D129E0 to $D129EF, when an enemy attacks.
     You can specify whether to display it with $D129F0 to $D129FF.

     Note 2: This feature can be disabled with $C23FE8: 90 -> 80. For compatibility,
     The lower limit of a monster's maximum MP is set to his 9999.

ff5_ext-*.ips
     This is a summary of the common parts of the program and free space required for modification. This is below
     Required to apply the patch file:

     -ff5_condemned.ips
     - ff5_item_evade.ips
     -ff5_item_weight.ips
     - ff5_mimic_blank.ips
     - ff5_mimic_weapon.ips
     -ff5_powerdrink.ips
     - ff5_reapply_item_element.ips
     - ff5_reapply_item_state.ips
     -ff5_swdslap.ips

ff5_ability_menu.ips
     Like in FF5A, you can imitate abilities even if you don't remember a single ability.
     Allows you to set the This is smarter than his FF5A, and is a non-impersonator.
     If you change to a job, check to see if you remember the ability.

ff5_dash_ps.ips
ff5_dash_gba.ips
     Change the specifications of B-dash to be the same as the PS or GBA version.

ff5_fast_nothing.ips
     Speeds up processing of monsters' "do nothing" actions.

     Note: Do nothing (0xAA), No damage magic (0xAC), Monster appearance status change
     (0xEE).

     Dependencies:
         ff5_core.ips

ff5_item_menu.ips
     In places where tents/cottages and teleports cannot be used, such as FF5A, they are
     is displayed in gray.

ff5_kiss_of_blessing.ips
     The effect of Blessing Kiss will be changed so that it does not affect certain monsters. this
     "04: Silence, 08: Berserk," among the "status changes 2" due to the effect of Blessing Kiss.
     10: Confusion, 20: Paralysis, 40: Sleep" effects do not affect specific monsters.
     Change it to: This fix will be applied to monster data after applying this patch file.
     Applies only to monsters that set bit6 (0x40) of the 26th byte.

     Monster parameters (after application)

     25: Various flags
         * bit0-2: (unused)
         * bit3: “Catch” resistance
         * bit4: Resistance of “Yatsuru”
         * bit5: (used by ff5_lv5_death.ips: Level 5 death resistance)
         * bit6: “Blessing Kiss” resistance
         *bit7: His HP display in Libra becomes "????"

ff5_lv5_death.ips
     Changes level 5 death so that it does not hit certain monsters. This modification
     After applying this patch file, bit5 (0x20) of the 26th byte of monster data
     Applies only to monsters that have been set.

     Monster parameters (after application)

     25: Various flags
         * bit0-2: (unused)
         * bit3: “Catch” resistance
         * bit4: Resistance of “Yatsuru”
         * bit5: “Level 5 death” resistance
         * bit6: (used by ff5_kiss_of_blessing.ips: resistance of blessing kiss)
         * bit7: HP display in library becomes "????"

ff5_player_name.ips
     Like in FF5A, you can specify a default name when deciding the name of the main character.
     will do so. The default name is stored in $D15500-$D15505 (default name
     At default, $20,$BC,$82,$FF,$FF,$FF: Bats).

ff5_sort.ips
     We will improve the algorithm that "selects" the item field. This is the item column
     Sort by type. The order of the types can be specified with $C2E096 (hereinafter the default
     default settings).

     org $C2E096
         db $FD ; Normal item (0xE0 to 0xFF)
         db $E7 ; knife
         db $E3 ; sword
         db $E8 ; Spear
         db $E9 ; ax
         db $EA ; sword
         db $EB ; rod
         db $EC; cane
         db $ED ; bow and arrow
         db $EE ; Harp
         db $EF ; Whip
         db $F0 ; Bell
         db $FF ; Blank: Twin Lancer, Engetsurin, Shuriken,
                         ; fuuma shuriken, soot, rising sun
         db $F1 ; shield
         db $F2 ; helmet
         db $F3 ; Armor
         db $F4 ; Accessories
         db $00 ; (eof)

ff5_atomos_wormhole.ips
     atmos


In a battle with a character who is confused and unable to fight,
     This fixes a bug that causes abnormal behavior when

ff5_auto_jump.ips
     The automatic action wait time for characters jumping while in berserk state is incorrect.
     Fixed a bug.

     Note: This modification is usually not necessary.

ff5_berserk_jump.ips
     Corrected the processing when a berserk character hides or jumps.
     vinegar. If the character is jumping, change the command to "fight"
     Instead, perform a normal jump attack. If it is hidden, run Reveal.
     vinegar.

     Note: This modification is usually not necessary.

ff5_butz_blue_mage_gfx.ips
     Corrects a graphical error when attacking with Bats' Blue Mage.

ff5_chemist_ending.ips
     Fixed a bug where the game would hang if a pharmacist character was present in the ending battle scene.
     to correct.

ff5_condemned.ips
     Fixed a bug related to Death Sentence.

     - Increase the upper limit of Death Sentence count increased by slow to 99.
     - Even if the count of death sentences received by a character in zombie state reaches 0, death sentences will not continue.
       Fixed a bug where notifications were not canceled.

     Dependencies:
         ff5_ext.ips

ff5_counter.ips
     Changed so that characters in berserk state cannot use magic barrier/counter.
     To do. This is the same as his FF5A.

ff5_damage_overflow.ips
     Fixed a bug that caused damage calculation to overflow when the damage value exceeded 65535.
     to correct.

ff5_damage_overflow_mp.ips
     If the result of (attack power - defense power) is negative for an attack that absorbs MP, the damage value will be
     Fix overflow bug. Also, the upper limit of damage value is set to 9999.
     vinegar.

     Dependencies:
         ff5_damage_overflow.ips

ff5_darkbow.ips
     Like in FF5A, the screen lights up when you successfully perform a bow and arrow in the dark.

ff5_dead_aegis_shield.ips
     Phoenix is a character who is unable to fight and is equipped with an Aegis shield and bone mail.
     If you use something like the tail, you will be unable to fight and will be able to avoid it with the effect of the Aegis shield.
     I will correct the situation.

Ff5_equip_change.ips
	Items removed when changing equipment during battle are automatically grouped together.

ff5_escape.ips
     Just like in FF5A, you can escape before your ally characters get their turn. Ma
     Additionally, Berserker will be able to escape. This is Berserker chicken
     Fixed a bug where the player would hang up when attacking with a knife and triggering Tonzura.

ff5_evade_animation.ips
     Correct the effect of avoiding enemy attacks.

     - When an enemy makes a magic attack and a physical attack in succession, you can avoid it with a shield, golem, etc.
       Fixed a bug where the effect would not work correctly.
     - When an enemy performs a magic attack and a physical attack in succession, the effect of the Aegis shield will be correct.
       Fixed a bug that did not work properly.
     - When performing a magic attack with a compound effect (C5 xx yy), it will be added to the Aegis shield.
       Fixed a bug where the effects would not work correctly.
     -Fixed a bug where the effect of Aegis Shield was not applied to two or more of her characters.
       to correct.

     Note: If you evade a magic attack that uses a compound effect with the Aegis Shield, the effect will be
     There is an issue where the Aegis shield effect is performed every time the character changes.
     The problem is that the magic attack is global, and the hit/evasion effects are done at the same time.
     Affects only if

     List of magic attacks that use compound effects

     No. Name Effect
     ---------------------------------------------
     022: Holy 0x07F & 0x018
     033: Flare 0x01D & 0x073 & 0x074
     046: Quick 0x076 & 0x0A9
     067: Hitomi Akuma 0x0A5 & 0x024
     083: Shino Roulette 0x0C4 & 0x0F9
     0A6: Grand Cross 0x102 & 0x103 & 0x104
     0B0: Shinigami Sword 0x0B3 & 0x01F
     146: Shadow Flare 0x0FA & 0x0FB & 0x074

ff5_evade_overflow.ips
     The results of the hit judgment and duration setting formula (level + song correction value) are
     Fixed a barflow bug.

ff5_gaiahammer.ips
     Attack with two swords and equip your left hand with an earth hammer, an earth bell, and a windshield blade.
     Fixed a bug where the attack would fail when the special effect of the left hand weapon was activated.
     Masu.

ff5_giantdrink_enemy.ips
     Giant's Potion effect now applies to monsters as well (Maximum: 65535, how many times?
     (Also available).

     Dependencies:
         ff5_core.ips

ff5_golem.ips
     Golem's effect may not activate correctly when the enemy uses his 3 or more consecutive attacks.
     Fix possible bugs.

ff5_hide_escape.ips
     Even if all the characters are hidden, the zombie state will be below the living characters.
     Fixed a bug where characters would not run away.

ff5_hide_reveal.ips
     If you use Hide, Appear, Capture, or Release from the 4th ability, an abnormality will occur.
     Fix the bug that causes the behavior. You can also use the show command to hide
     Fixed a bug that changed the behavior of target selection.

ff5_hp_leak_counter.ips
     Immediately after an ally's counter action is decided, that character will receive slip damage.
     Fixed a bug where the battle would stop progressing if you became incapacitated.

ff5_hp_leak_down.ips
     If the character who is selecting an action becomes unable to fight due to slip damage, the battle will temporarily stop.
     Fixed a bug that caused the app to stop.

ff5_ineffective.ips
     Fixed a bug where hiding/jumping had no effect. Also, the target group
     A bug where the item column ($27C6 to $27CC) is cleared if you receive a full attack when there is no item.
     I will also fix it.

ff5_infinite_items.ips
     Fix "Stealing 99 Pieces".

ff5_item_delay.ips
     Fixes a bug where the wait time before using an item would be an unexpected value.

ff5_item_evade.ips
     Corresponds to the evasion rate of head/body armor and accessories.

     Dependencies:
         ff5_ext.ips

ff5_item_stat_bonus.ips
     If you equip an item that lowers her abilities and her ability values become 0 or less, the values will be over.
     Fixed a bug that caused barflow.

ff5_item_transform.ips
     Fixed "item change".

ff5_item_weight.ips
     Reset the weight of the equipment after changing it during battle.

     Dependencies:
         ff5_ext.ips

ff5_learning.ips
     The limit on blue magic that can be learned at one time is "You can only learn blue magic up to the 8th time."
     He can now learn up to 8 types of blue magic that he hasn't learned yet.
     to correct.

ff5_magical_weapon.ips
     When attacking with a weapon that uses a magic type effect type (e.g. Staff of Judgment, Staff of Light), the eye
     Fixed a bug where the target was considered to be globalized and the magnification and accuracy were halved.

ff5_magicshell.ips
     Corrected so that magic barrier would not be activated multiple times when already in shell state.
     Masu.

ff5_magicshell_fast.ips
     By incorporating the magic barrier effect into the counterattack process, you can omit the production effects and speed up the process.
     I'll make it. Magic barrier effects are included in $C238C7 to $C238EF.

     Dependencies:
         ff5_magicshell.ips

ff5_magicshell_group.ips
     Even if all friendly characters are attacked by the first attack, only the first character will be attacked.
     Fixed a bug where magic barrier could not be activated.

     Dependencies:
         ff5_magicshell.ips

ff5_magicshell_reflect.ips
     The magic barrier will be corrected so that it will activate even if it is in the reflex state.

     Dependencies:
         ff5_magicshell.ips

ff5_mimic_blank.ips
     If you use the blank weapon as an item using impersonation, the effect of magic sword fire will be activated.
     Fix the bug that occurs.

     Dependencies:
         ff5_ext.ips

     Conflict with:
         ff5_mimic_weapon.ips

ff5_mimic_meteor.ips
     Fixed a bug where imitating Meteor would consume MP.

ff5_mimic_weapon.ips
     Allows you to imitate the behavior of using a weapon as an item.

     Dependencies:
         ff5_ext.ips

     Conflict with:
         ff5_mimic_blank.ips

ff5_mini_and_toad.ips
     A bug where the effects of Berserk and Protect do not activate correctly when in the dwarf/frog state.
     Fix it.

ff5_multi_se.ips
     Fixed a bug where the sound settings for multi-controllers were incorrect.

ff5_check.ips
     Inspect will now display enemy weaknesses as explained in the game.

ff5_old.ips
     A bug where ability values overflow due to aging and the attack power of enemy monsters decreases.
     Fixed a bug that does not work. After the modification, the enemy's attack power will be reduced to 0, and other abilities will be reduced to 0.
     The value will be reduced to 1 (if the initial value is 0, it will not be changed). This is FF5A
     is the same as

ff5_old_timer.ips
     Fixed a bug where silence/paralysis that occurred at the same time as aging would not recover.

ff5_optimize.ips
	improves handling of strongest equipment.

ff5_possess.ips
     Fixed a bug where it was possible to select a character who left the game after being glued to it.

ff5_powerdrink.ips
     Changes the effect of Potion of Power to affect normal weapon attacks. Because of this change
     , $2045 for "Attack power increased by potion of power", $2044 for "Right hand and left hand attack"
     The total attack power of the right and left hands exceeds 255.
     calculates the attack power as 255. This change is based on the damage calculation of Goblin Punch.
     It affects the output.

     Dependencies:
         ff5_ext.ips

ff5_react_against_all_target.ips
     Corrects the counter to all attacks. This does not select the attack target before activation, and processes
     Counterattacks that sometimes attack all targets (e.g. magic lamp, summoning, releasing, etc.)
     I will try to do that.

ff5_react_against_reflect.ips
     Use general magic on characters that are reflective and those that are not, and
     Fixed a bug where if you attack by reflecting some magic, you will not receive a counterattack from the enemy.

     Note: Changes have been made to give priority to enemy counterattacks, so in the same situation an ally's magic barrier
     will no longer be triggered.

ff5_reapply_item_element.ips
     Fixed an issue where the attributes obtained by magic effects would be reset when rearranging items.
     to correct.

     Dependencies:
         ff5_ext.ips

ff5_reapply_item_immunity.ips
     Correct "resistance remaining".

     Dependencies:
         ff5_core.ips

ff5_reapply_item_state.ips
     If you rearrange the items, the state of the equipment will change over and over again.
     "Mirage Vest Reupholstery" will be corrected.

     Dependencies:
         ff5_ext.ips


ff5_reequip.ips
	Improve handling of re-equipment. 

ff5_remedy_petrified.ips
     Changed the elixir so that it can be used on petrified characters.

ff5_remember.ips
     Fixed a bug where the selected item/magic position was not swapped when rearranging characters.
     to correct.

ff5_return.ips
     Fixed a bug where the screen would remain black when using Return on an invincible character.
     to correct.

ff5_return_se.ips
     Fixed an issue where her BGM would temporarily become smaller during the return performance.

ff5_roulette.ips
     Fixed an issue when using the Roulette of Death by controlling enemy monsters.

ff5_sandworm.ips
     Corrects stalking behavior in battles with sandworms. This is
     Make the changes below.

     - Correct the process that could cause "ana" to disappear.
     -Fixes an issue where the number of defeated monsters increases by 7 for her. Sandwar after modification
       He will be treated as having defeated only one enemy.

     Note: Enemies do not drop items during battles with Sandworms. This is the above
     Due to a glitch, he could drop unintended items after defeating 7 monsters.
     This is a specification to prevent this. After the fix, this behavior is no longer needed and can be removed
     ($C2569A~$C256A6).

ff5_song.ips
     Fixed song-related bugs.

     - If you silence a character who is singing and then release the singing state, the
       Fixed a bug where ability values would increase even when the song was not sung.
     - When the singing state is canceled due to silence/mute, depending on the timing
       Fixed a bug that caused the character to be unable to act.
     - Imitating a song will set a timer on the selected character when using that song
       Fixed the bug that occurs.

     Note: The bug where ability values increase even when not singing is for characters other than the first.
     Occurs when the song is released.

ff5_specialty.ips
     Fixed a bug where status abnormalities caused by the enemy's special moves would not occur.

ff5_spellblade_osmose.ips
     He will set the upper limit for damage caused by the magic sword Aspir to 9999.

     ff5_spellblade_osmose_fo if ff5_damage_overflow_mp.ips is applied
     Please use r_ff5_damage_overflow_mp.ips.

ff5_stuck_bug.ips
     When you get off the airship, flying dragon, or chocobo at Guido's Shrine and Elder Tree, you will be able to ride it.
     We fix so-called "jams" that make things unusable.

     Note: In Guido's Hollow, the settings of the map parts (terrain type: 9A) have been modified.
     Made it impossible to get off the airship/Hiryu. In elder trees, certain positions
     Added processing to prevent you from getting off at ((55, 120), (57, 122)). this
     Please note that certain positions are hard-coded (this program
     is located in $C007EE. This fix is the same as the PS and GBA versions).

ff5_stuck_teleport.ips
     If you use teleportation in some places, you will not be able to progress through the game.
     Correct the error.

     - Updated the teleport flag in the event of moving from Guido's Shrine to the Ancient Library.
       New.
     - Prevents teleportation from being used in the following locations:

       243(0F3): Exdeath 7F
       259(103): Close
       260(104): Close
       281(119): Cherub Village
       282(11A): Kelgar's House 1F
       283(11B): Kelgar's House 2F
       284(11C): Cherub Village Yadoya
       285(11D): Cherub Village Buki Bouguya
       286(11E): Cherub Village Magica
       358(166): Mowgli's Gauntlet
       362 (16A): Moore's Daishinrin
       364(16C): Choronoki
       366 (16E): Moore's Daishinrin

ff5_swdslap.ips
     Mineuchi will now paralyze enemies as explained in the game (by sword)
     attack only).

     Dependencies:
         ff5_ext.ips

ff5_target_meteor.ips
     Fixed a bug where Meteor would hit an ally when the attack target could not be selected.
     I'll correct it.

ff5_three_images.ips
     Change to display up to 3 of his clones.

ff5_twinlance.ips
     Fixed a bug related to Twin Lancer.

     -When attacking with Twin Lancer equipped in the left hand, the enemy's counterattack is received twice by him.
       Fix it.

     Note: The following are known bugs, but there are currently no plans to fix them.

     -If Twin Lancer's first attack misses, his second attack will become a physical attack.
       not treated as such
     -If Twin Lancer's first attack misses, the counterattack for the second attack will be
       not working properly

ff5_two_handed.ips
     When calculating damage, whether or not it can be carried with both hands is determined by the two-handed flag in the item data.
     change to determine whether Also, the two-handed flag is determined for all weapons.
     to hold.

     Note: For weapons that use damage calculation formulas that do not support two-handed holding, such as knives and spears.
     Necessary if you want to be able to hold the device with both hands. This modification is usually not necessary.

ff5_unequip_freeze.ips
     As a result of stealing/buying while the command menu is displayed, there is no space in the item field.
     Fixed a bug where the item would hang when unequipped and equipped with another item.
     vinegar.

ff5_uptempo_freeze.ips
     Set his BGM when the remaining time is counted, when the battle is won, or when the battle is annihilated.
     If the tempo of his background music changes depending on the remaining time value during the process
     Fix a hang bug.

ff5_weak_category.ips
     Fixed so that when you attack with a weakness category, the damage will be twice his.

ff5_weapon_change_counter.ips
     If you counter with changed equipment while selecting a command, the changed equipment will be displayed when attacking.
     effects for weapons (which don't actually change until you select a command)
     Fixed the bug that occurs.

     Note: If you switch a weapon to armor and display the armor's weapon effect, the
     effect will appear or it will hang.

ff5_x-redirect.ips
     If you use Continuous Magic after opening the synthesis menu, the Continuous Demon will use the match you chose the first time.
     Fixes a bug where the elephant would change to the second selected target.

ff5_zombie_breath.ips
     Fixed an issue where the Zombie Breath effect would not occur under certain conditions.

     Note: If the target character's current HP is less than the damage value of Zombie Breath,
     If the condition is resistant

ff5_zombie_catch.ips
     Fixed a bug when capturing enemy monsters in zombie state.

ff5_zombie_freeze.ips
     When a zombie character hides, jumps, or receives a withdrawal process,
     Fix a hang bug.

ff5_zombie_powder.ips
     Dance of the Dead and Zombie Powder will no longer hit hidden characters.
     I will change it. This is the same as his FF5A.

     Dependencies:
         ff5_zombie_freeze.ips






                   Release URI: http://x11.s11.xrea.com/ff5_bugfixes.zip
                                     Last Modified on:       8 July 2010
                                               Inu <inuchr at gmail.com>

            ファイナルファンタジー V (SFC) 修正パッチセット

はじめに
--------

ff5_bugfixes - ファイナルファンタジー V (SFC) 修正パッチセットは SFC 版 ファ
イナルファンタジー V (以下、FF5) の各種バグや不具合などを修正/改善するパッチ
ファイル (IPS 形式) をまとめたものです。パッチファイルはヘッダが付いていない
ROM イメージファイルに適用してください。

ff5_bugfixes の使用、改変および再配布は自由ですが、``現状のまま'' (AS IS) 提
供されるものとします。いかなる保証もありません。

内容
----

このアーカイブには、以下のファイルが含まれます。

asm/
    このディレクトリには、ソースコードが含まれます。

base/
    このディレクトリには、拡張機能を利用するためのパッチファイルが含まれま
    す。

bugfix/
    このディレクトリには、バグ/不具合の修正のためのパッチファイルが含まれま
    す。

improve/
    このディレクトリには、機能改善のためのパッチファイルが含まれます。

uninstall/
    このディレクトリには、各パッチファイルを適用する前の状態に戻すためのファ
    イルが含まれます。

updates/
    このディレクトリには、差分更新用のパッチファイルが含まれます。

BUG-LIST.txt
    FF5 (PS) と FF5A (GBA) で修正されたバグおよび実装された機能を示した参考
    資料です。

CHANGES.txt
    過去の変更が書かれています。

NEWS.txt
    更新の際の注意などが書かれています。

README.txt
    このファイルです。

解説
----

以下は、各パッチファイルについての解説です。

  * 依存関係は、各パッチファイルの適用前にあらかじめ適用する必要があるファイ
    ルを示します。依存関係のあるファイルを更新した場合は、それに依存するファ
    イルも再適用する必要があります。uninstall ディレクトリに含まれるファイル
    を使用して変更を元に戻す場合は、通常の逆の順序で適用してください。
  * Conflict は、同時に適用することができないファイルを示します。
  * Note には、補足的な情報が書かれています。

ff5_core-*.ips
    システムを更新します:

    - 8 番目のモンスターを対象に指定できるようにした
    - モンスターの名前/パラメータを設定する処理を変更:
      o 各モンスターの番号の上位ビットが異なっていても、正しく動作するように
        した
      o モンスターの番号 0xFF を常に 0x00FF として扱うようにした
    - ストーカー処理を 4 体未満のモンスターパーティでも使用できるようにした
    - 魔法使用後のメッセージを敵もしくは味方の攻撃側により表示するかどうかを
      指定できるようにした (*1)
    - モンスターの最大 MP を 9999 固定ではなくモンスターデータの値から設定で
      きるようにした (*2)
    - エフェクト処理を修正:
      o エフェクト処理後に全エフェクトパターンを無効にするようにした (ホワイ
        トホールバグの対策)
      o アイテム・特殊技ではリフレクのエフェクトが表示されないバグを修正
    - 文字コード 0x11 (アイテム名) を 9 文字まで対応
    - 文字コード 0x12 (魔法名) を 6 文字まで対応
    - 最初に行動できるキャラクタを決定する処理の間違いを修正
    - 敵モンスターが能力値が上昇する歌を歌うと、間違ったキャラクタの能力値が
      上昇してしまうバグを修正
    - モンスターパーティの分岐で上位バイトの値を正確にチェックするように修正
    - ライブラをリフレクで反射すると最初のメッセージが表示されないバグを修正
    - ダメージ計算の MP 回復時にオーバーフローするバグを修正
    - 宝箱回収率の計算式に誤差がある不具合を修正
    - 戦闘中に消費したギルをリターン時にリセットできるように修正
    - 戦闘開始時に分身の位置を初期化するように修正
    - 巨人の薬を使用した戦闘でレベルアップすると最大 HP が上昇しないバグを修
      正
    - プログラムの最適化

    Note 1: 味方の攻撃時に表示するかどうかを $D129E0～$D129EF, 敵の攻撃時に
    表示するかどうかを $D129F0～$D129FF で指定できます。

    Note 2: この機能は $C23FE8: 90 -> 80 で無効にできます。互換性のために、
    モンスターの最大 MP の下限は 9999 に設定されています。

ff5_ext-*.ips
    修正に必要なプログラムの共通部分と空き領域をまとめたものです。これは以下
    のパッチファイルを適用するために必要です:

    - ff5_condemned.ips
    - ff5_item_evade.ips
    - ff5_item_weight.ips
    - ff5_mimic_blank.ips
    - ff5_mimic_weapon.ips
    - ff5_powerdrink.ips
    - ff5_reapply_item_element.ips
    - ff5_reapply_item_state.ips
    - ff5_swdslap.ips

ff5_ability_menu.ips
    FF5A のように、アビリティをひとつも覚えていなくても、ものまねしのアビリ
    ティを設定できるようにします。これは FF5A よりも賢く、ものまねし以外のジ
    ョブに変更した場合にはアビリティを覚えているかどうかを確認します。

ff5_dash_ps.ips
ff5_dash_gba.ips
    B ダッシュの仕様を PS 版もしくは GBA 版と同じように変更します。

ff5_fast_nothing.ips
    モンスターの「何もしない」行動の処理を高速化します。

    Note: 何もしない (0xAA), ノーダメージまほう (0xAC), モンスター出現状態変
    更 (0xEE) に対応します。

    依存関係:
        ff5_core.ips

ff5_item_menu.ips
    FF5A のように、テント/コテージおよびテレポを使用できない場所では、それら
    を灰色で表示します。

ff5_kiss_of_blessing.ips
    祝福のキッスの効果を特定のモンスターには影響しないように変更します。これ
    は祝福のキッスの効果による「状態変化2」のうち "04: 沈黙, 08: バーサク,
    10: 混乱, 20: 麻痺, 40: 睡眠" への作用を、特定のモンスターには影響しない
    ように変更します。この修正はこのパッチファイルを適用後、モンスターデータ
    26 バイト目の bit6 (0x40) をセットしたモンスターにのみ適用されます。

    モンスターの各種パラメータ (適用後)

    25: 各種フラグ
        * bit0-2: (未使用)
        * bit3: 「とらえる」の耐性
        * bit4: 「あやつる」の耐性
        * bit5: (ff5_lv5_death.ips が使用: レベル5デスの耐性)
        * bit6: 「祝福のキッス」の耐性
        * bit7: ライブラでの HP 表示が「????」となる

ff5_lv5_death.ips
    レベル5デスを特定のモンスターには命中しないように変更します。この修正は
    このパッチファイルを適用後、モンスターデータ 26 バイト目の bit5 (0x20)
    をセットしたモンスターにのみ適用されます。

    モンスターの各種パラメータ (適用後)

    25: 各種フラグ
        * bit0-2: (未使用)
        * bit3: 「とらえる」の耐性
        * bit4: 「あやつる」の耐性
        * bit5: 「レベル5デス」の耐性
        * bit6: (ff5_kiss_of_blessing.ips が使用: 祝福のキッスの耐性)
        * bit7: ライブラでの HP 表示が「????」となる

ff5_player_name.ips
    FF5A のように、主人公の名前を決定する場面でデフォルトの名前を指定できる
    ようにします。デフォルトの名前は $D15500～$D15505 に格納されています (デ
    フォルトでは、$20,$BC,$82,$FF,$FF,$FF: バッツ)。

ff5_sort.ips
    アイテム欄を「せいとん」するアルゴリズムを改善します。これはアイテム欄を
    種類順に並び替えます。種類の順番は $C2E096 で指定できます (以下、デフォ
    ルトの設定)。

    org $C2E096
        db $FD          ; 通常アイテム (0xE0～0xFF)
        db $E7          ; ナイフ
        db $E3          ; 剣
        db $E8          ; 槍
        db $E9          ; 斧
        db $EA          ; 刀
        db $EB          ; ロッド
        db $EC          ; つえ
        db $ED          ; 弓矢
        db $EE          ; 竪琴
        db $EF          ; むち
        db $F0          ; ベル
        db $FF          ; 空白: ツインランサー, えんげつりん, しゅりけん,
                        ;       ふうましゅりけん, すす, ライジングサン
        db $F1          ; 盾
        db $F2          ; 兜
        db $F3          ; 鎧
        db $F4          ; アクセサリ
        db $00          ; (eof)

ff5_atomos_wormhole.ips
    アトモスとの戦闘において、混乱状態で戦闘不能になったキャラクタが吸い込ま
    れると、異常動作を起こすバグを修正します。

ff5_auto_jump.ips
    バーサク状態でジャンプしているキャラクタの自動行動待ち時間が間違った値に
    なるバグを修正します。

    Note: 通常はこの修正は必要ありません。

ff5_berserk_jump.ips
    バーサク状態のキャラクタが隠れる・ジャンプをしているときの処理を修正しま
    す。そのキャラクタがジャンプしている場合は、コマンドを「たたかう」に変更
    せず、通常のジャンプ攻撃を行います。隠れている場合は、現れるを実行しま
    す。

    Note: 通常はこの修正は必要ありません。

ff5_butz_blue_mage_gfx.ips
    バッツの青魔道士のすで攻撃時グラフィックの間違いを修正します。

ff5_chemist_ending.ips
    エンディングの戦闘シーンで薬師のキャラクタがいるとハングアップするバグを
    修正します。

ff5_condemned.ips
    死の宣告関連のバグを修正します。

    - スロウによって増加する死の宣告のカウントの上限を 99 にします。
    - ゾンビ状態のキャラクタが受けた死の宣告のカウントが 0 になっても死の宣
      告が解除されないバグを修正します。

    依存関係:
        ff5_ext.ips

ff5_counter.ips
    バーサク状態のキャラクタが魔法バリア/カウンターを使用できないように変更
    します。これは FF5A と同じです。

ff5_damage_overflow.ips
    ダメージの算出で、ダメージ値が 65535 を超えるとオーバーフローするバグを
    修正します。

ff5_damage_overflow_mp.ips
    MP を吸収する攻撃で、(攻撃力 - 防御力) の結果が負になると、ダメージ値が
    オーバーフローするバグを修正します。また、ダメージ値の上限を 9999 にしま
    す。

    依存関係:
        ff5_damage_overflow.ips

ff5_darkbow.ips
    FF5A のように、暗闇の弓矢の成功時に画面が発光します。

ff5_dead_aegis_shield.ips
    イージスの盾とボーンメイルを装備した戦闘不能のキャラクタに、フェニックス
    の尾などを使うと、戦闘不能のままイージスの盾の効果で回避することがある不
    具合を修正します。

ff5_escape.ips
    FF5A のように、味方キャラクタの順番がまわってくる前に逃走できます。ま
    た、バーサーカーが逃走できるようになります。これは、バーサーカーがチキン
    ナイフで攻撃し、とんずらが発動するとハングアップするバグを修正します。

ff5_evade_animation.ips
    敵の攻撃を回避する演出効果を修正します。

    - 敵が魔法攻撃と物理攻撃を連続して行うと、盾・ゴーレムなどで回避する演出
      効果が正しく行われないバグを修正します。
    - 敵が魔法攻撃と物理攻撃を連続して行うと、イージスの盾による演出効果が正
      しく行われないバグを修正します。
    - 複合エフェクト (C5 xx yy) が指定された魔法攻撃を行うと、イージスの盾に
      よる演出効果が正しく行われないバグを修正します。
    - イージスの盾による演出効果が 2 人以上のキャラクタに適用されないバグを
      修正します。

    注意: 複合エフェクトを用いる魔法攻撃をイージスの盾で回避した場合、エフェ
    クトが切り替わるたびにイージスの盾による演出が行われる不具合があります。
    この不具合はその魔法攻撃が全体化されていて命中/回避エフェクトが同時に行
    われる場合にのみ影響します。

    複合エフェクトを用いる魔法攻撃一覧

    No.   名前              エフェクト
    ------------------------------------------
    022: ホーリー          0x07F & 0x018
    033: フレア            0x01D & 0x073 & 0x074
    046: クイック          0x076 & 0x0A9
    067: あくまのひとみ    0x0A5 & 0x024
    083: しのルーレット    0x0C4 & 0x0F9
    0A6: グランドクロス    0x102 & 0x103 & 0x104
    0B0: しにがみのつるぎ  0x0B3 & 0x01F
    146: シャドーフレア    0x0FA & 0x0FB & 0x074

ff5_evade_overflow.ips
    命中判定および持続時間設定の式 (レベル + 歌による補正値) の結果がオー
    バーフローするバグを修正します。

ff5_gaiahammer.ips
    二刀流にして、左手に大地のハンマー、大地のベル、かぜきりの刃を装備して攻
    撃すると、左手の武器の特殊効果が発動したときに攻撃に失敗するバグを修正し
    ます。

ff5_giantdrink_enemy.ips
    巨人の薬の効果がモンスターにも適用されるようにします (上限: 65535, 何度
    でも使用可能)。

    依存関係:
        ff5_core.ips

ff5_golem.ips
    敵が 3 回以上の連続攻撃を行った際に、ゴーレムの効果が正しく発動しない可
    能性があるバグを修正します。

ff5_hide_escape.ips
    キャラクタ全員が隠れていても、生存しているキャラクタよりも下にゾンビ状態
    のキャラクタがいると逃げ出さないバグを修正します。

ff5_hide_reveal.ips
    隠れる・現れる・捕らえる・放つを 4 個目のアビリティから使用すると、異常
    動作を起こすバグを修正します。また、現れるのコマンドを使用すると、隠れる
    の対象選択の動作が変わってしまうバグを修正します。

ff5_hp_leak_counter.ips
    味方のカウンター行動が決定された直後に、そのキャラクタがスリップダメージ
    で戦闘不能になると戦闘が進まなくなってしてしまうバグを修正します。

ff5_hp_leak_down.ips
    行動選択中のキャラクタがスリップダメージで戦闘不能になると、戦闘が一時的
    に停止する不具合を修正します。

ff5_ineffective.ips
    隠れる・ジャンプによる「効果がなかった」バグを修正します。また、対象がい
    ない場合に全体攻撃を受けると、アイテム欄 ($27C6～$27CC) が消去されるバグ
    も修正します。

ff5_infinite_items.ips
    「99 個盗み」を修正します。

ff5_item_delay.ips
    アイテムを使用するまでの待機時間が予期しない値になるバグを修正します。

ff5_item_evade.ips
    頭・体防具とアクセサリの回避率に対応します。

    依存関係:
        ff5_ext.ips

ff5_item_stat_bonus.ips
    能力が下がるアイテムを装備して、その能力値が 0 以下になると数値がオー
    バーフローしてしまうバグを修正します。

ff5_item_transform.ips
    「アイテム変化」を修正します。

ff5_item_weight.ips
    戦闘中に装備を変更した後、装備の重さを再設定します。

    依存関係:
        ff5_ext.ips

ff5_learning.ips
    一度にラーニングできる青魔法の制限の「8 回目までの青魔法しかラーニングで
    きない」を、まだラーニングしていない青魔法を 8 種類まで覚えられるように
    修正します。

ff5_magical_weapon.ips
    魔法系の効果タイプを用いる武器 (e.g. 裁きの杖, 光の杖) で攻撃すると、目
    標を全体化したと見なされ、倍率と命中率が半減してしまうバグを修正します。

ff5_magicshell.ips
    既にシェル状態になっている場合に魔法バリアが何度も発動しないように修正し
    ます。

ff5_magicshell_fast.ips
    魔法バリアの効果を反撃処理に組み込むことで、演出効果を省略して処理を高速
    にします。魔法バリアの効果は $C238C7～$C238EF に組み込まれています。

    依存関係:
        ff5_magicshell.ips

ff5_magicshell_group.ips
    1 回目の攻撃で、味方キャラクタ全員が攻撃を受けても、最初のキャラクタしか
    魔法バリアを発動できないバグを修正します。

    依存関係:
        ff5_magicshell.ips

ff5_magicshell_reflect.ips
    リフレク状態になっていても魔法バリアが発動するように修正します。

    依存関係:
        ff5_magicshell.ips

ff5_mimic_blank.ips
    ものまねを使って空欄の武器をアイテムして使用すると魔法剣ファイアの効果が
    発動するバグを修正します。

    依存関係:
        ff5_ext.ips

    Conflict with:
        ff5_mimic_weapon.ips

ff5_mimic_meteor.ips
    メテオをものまねすると MP を消費してしまうバグを修正します。

ff5_mimic_weapon.ips
    武器をアイテムとして使用する行動をものまねできるようにします。

    依存関係:
        ff5_ext.ips

    Conflict with:
        ff5_mimic_blank.ips

ff5_mini_and_toad.ips
    こびと/カエルの状態だと、バーサクとプロテスの効果が正しく発動しないバグ
    を修正します。

ff5_multi_se.ips
    マルチコントローラ用のサウンドの設定が間違っているバグを修正します。

ff5_check.ips
    調べるがゲーム中の説明どおりに敵の弱点を表示するように修正します。

ff5_old.ips
    老化によって能力値がオーバーフローするバグおよび敵モンスターの攻撃力が下
    がらないバグを修正します。修正後は、敵の攻撃力は 0 まで下がり、他の能力
    値は 1 まで (初期値が 0 なら変更せず) 下がる仕様になります。これは FF5A
    と同じです。

ff5_old_timer.ips
    老化と同時に発生した沈黙/麻痺が回復しないバグを修正します。

ff5_possess.ips
    のりうつりを受けて離脱したキャラクタを選択できてしまうバグを修正します。

ff5_powerdrink.ips
    力の薬の効果を通常の武器攻撃に影響するように変更します。この変更のため
    に、$2045 を "力の薬によって上昇した攻撃力", $2044 を "右手と左手の攻撃
    力の合計" として扱います。右手と左手の攻撃力の合計値が 255 を超える場合
    は、攻撃力を 255 として計算します。この変更はゴブリンパンチのダメージ算
    出に影響します。

    依存関係:
        ff5_ext.ips

ff5_react_against_all_target.ips
    全体攻撃へのカウンターを修正します。これは発動前に攻撃目標を選ばず、処理
    時に全体攻撃になる攻撃 (e.g. 魔法のランプ, 呼び出す, 放つなど) にも反撃
    するようにします。

ff5_react_against_reflect.ips
    リフレク状態のキャラクタとそうでないキャラクタに全体魔法を使用して、その
    魔法の一部を反射して攻撃すると、敵の反撃を受けないバグを修正します。

    注意: 敵の反撃を優先するように変更したため、同じ状況で味方の魔法バリア
    が発動しなくなります。

ff5_reapply_item_element.ips
    アイテムを並び替えると、魔法効果で得た属性がリセットされてしまう不具合を
    修正します。

    依存関係:
        ff5_ext.ips

ff5_reapply_item_immunity.ips
    「耐性残存」を修正します。

    依存関係:
        ff5_core.ips

ff5_reapply_item_state.ips
    アイテムを並び替えると、装備の状態変化が何度でも発動してしまう、いわゆる
    「ミラージュベスト張り替え」を修正します。

    依存関係:
        ff5_ext.ips

ff5_remedy_petrified.ips
    万能薬を石化状態のキャラクタに使用できるように変更します。

ff5_remember.ips
    キャラクタの並び替えで選択したアイテム/魔法の位置が入れ替わらないバグを
    修正します。

ff5_return.ips
    リターンを無敵状態のキャラクタに使用すると画面が暗転したままになるバグを
    修正します。

ff5_return_se.ips
    リターンの演出中に一時的に BGM が小さくなる不具合を修正します。

ff5_roulette.ips
    敵モンスターを操って死のルーレットを使用した場合の不具合を修正します。

ff5_sandworm.ips
    サンドウォームとの戦闘におけるストーカー処理の動作を修正します。これは以
    下の変更を行います。

    - 「あな」が消えてしまう可能性がある処理を修正します。
    - 倒したモンスターが 7 体増える不具合を修正します。修正後はサンドウォー
      ムを 1 体だけ倒した扱いになります。

    Note: サンドウォームとの戦闘では敵はアイテムを落としません。これは上記の
    不具合により 7 体 のモンスターを倒した結果、意図しないアイテムを落とすこ
    とを防ぐための仕様です。修正後は、この動作は不要になるため削除できます
    ($C2569A～$C256A6)。

ff5_song.ips
    歌関連のバグを修正します。

    - 歌を歌っているキャラクタを沈黙状態にして歌っている状態を解除すると、そ
      の後歌を歌っていない状態でも能力値が上昇してしまうバグを修正します。
    - 沈黙・ミュートによって歌っている状態が解除されると、タイミングによって
      はそのキャラクタが行動できなくなるバグを修正します。
    - 歌をものまねすると、その歌の使用時に選択したキャラクタにタイマーが設定
      されるバグを修正します。

    Note: 歌っていない状態でも能力値が上昇するバグは、1 番目以外のキャラクタ
    の歌を解除した場合に発生します。

ff5_specialty.ips
    敵のとくいわざによる状態異常が発生しないことがあるバグを修正します。

ff5_spellblade_osmose.ips
    魔法剣アスピルによるダメージ値の上限を 9999 にします。

    ff5_damage_overflow_mp.ips を適用している場合は ff5_spellblade_osmose_fo
    r_ff5_damage_overflow_mp.ips を使用してください。

ff5_stuck_bug.ips
    ギードのほこらおよび長老の木で飛空艇・飛竜・チョコボから降りるとその乗り
    物が利用できなくなる、いわゆる「はまり」を修正します。

    Note: ギードのほこらでは、マップパーツ (地形タイプ: 9A) の設定を修正して
    飛空艇・飛竜では降りられないようにしました。長老の木では、特定の位置
    ((55, 120), (57, 122)) に降りられないようにする処理を追加しました。この
    特定の位置はハードコードされていることに注意してください (このプログラム
    は $C007EE にあります。この修正は PS 版および GBA 版と同じものです)。

ff5_stuck_teleport.ips
    一部の場所でテレポを使用するとゲームが進行できなくなる、いわゆる「はま
    り」を修正します。

    - ギードのほこらから古代図書館へ移動するイベントで、テレポ用のフラグを更
      新します。
    - 以下の場所でテレポを使用できないようにします:

      243(0F3): エクスデスじょう 7F
      259(103): ちかたいが
      260(104): ちかたいが
      281(119): ケルブのむら
      282(11A): ケルガーのいえ 1F
      283(11B): ケルガーのいえ 2F
      284(11C): ケルブのむら やどや
      285(11D): ケルブのむら ぶき・ぼうぐや
      286(11E): ケルブのむら まほうや
      358(166): モーグリのどうくつ
      362(16A): ムーアの だいしんりん
      364(16C): ちょうろうのき
      366(16E): ムーアの だいしんりん

ff5_swdslap.ips
    みねうちがゲーム中の説明どおりに敵を麻痺させるように修正します (刀による
    攻撃のみ)。

    依存関係:
        ff5_ext.ips

ff5_target_meteor.ips
    攻撃目標が選べない状態でメテオを使用すると、味方に命中してしまうバグを修
    正します。

ff5_three_images.ips
    分身を 3 個まで表示できるように変更します。

ff5_twinlance.ips
    ツインランサー関連のバグを修正します。

    - ツインランサーを左手に装備して攻撃すると、敵の反撃を 2 回受ける不具合
      を修正します。

    Note: 以下は既知のバグですが、今のところ修正する予定はありません。

    - ツインランサーの 1 回目の攻撃がミスすると、2 回目の攻撃が物理攻撃とし
      て扱われない
    - ツインランサーの 1 回目の攻撃がミスすると、2 回目の攻撃に対する反撃が
      正しく動作しない

ff5_two_handed.ips
    ダメージ計算時、アイテムデータの両手持ちフラグによって両手持ちできるかど
    うかを決定するように変更します。また、すべての武器で両手持ちフラグの判定
    を行います。

    Note: ナイフ・槍などの両手持ちに対応していないダメージ計算式を利用する武
    器を両手持ち可能にする場合に必要です。通常はこの修正は必要ありません。

ff5_unequip_freeze.ips
    コマンドメニューの表示中に盗む/ぶんどるの結果、アイテム欄に空きがない状
    態で、装備を外して別のアイテムを装備するとハングアップするバグを修正しま
    す。

ff5_uptempo_freeze.ips
    残り時間がカウントされているとき、戦闘の勝利時もしくは全滅時の BGM を設
    定している処理の途中に、残り時間の値によって BGM のテンポが変更されると
    ハングアップするバグを修正します。

ff5_weak_category.ips
    弱点カテゴリで攻撃すると、ダメージが 2 倍になるように修正します。

ff5_weapon_change_counter.ips
    コマンド選択中に装備を変更した状態でカウンターすると、攻撃する際に変更後
    の武器 (実際にはコマンドを選択するまでは変更されない) のエフェクトが表示
    されるバグを修正します。

    Note: 武器を防具に持ち替えて防具の武器エフェクトを表示した場合は、間違っ
    たエフェクトが表示されるか、もしくはハングアップします。

ff5_x-redirect.ips
    調合のメニューを開いた後に連続魔を使用すると、連続魔の 1 回目に選んだ対
    象が、2 回目に選んだ対象に変更されてしまうバグを修正します。

ff5_zombie_breath.ips
    ゾンビブレスのエフェクトが特定の条件では発生しない不具合を修正します。

    Note: 対象のキャラクタの現在 HP がゾンビブレスのダメージ値未満で、ゾンビ
    状態に耐性がある場合

ff5_zombie_catch.ips
    ゾンビ状態の敵モンスターを捕らえる際の不具合を修正します。

ff5_zombie_freeze.ips
    ゾンビ状態のキャラクタが隠れる・ジャンプを行うか、離脱処理を受けた場合に
    ハングアップするバグを修正します。

ff5_zombie_powder.ips
    死者の踊りとゾンビーパウダーを隠れているキャラクタには命中しないように変
    更します。これは FF5A と同じです。

    依存関係:
        ff5_zombie_freeze.ips
