=================================
Final Fantasy IV - Job system
=================================

=====
About
=====
It's Final Fantasy IV... With a job system!

To change jobs go to 
Menu-> Equip-> Job
To move to cursor to Job you must unequip your RHand, LHand, Head, and Body.
New jobs are acquired by progressing the story.

Do not worry about the lack of rings, remaining equipment has been balanced accordingly.

Changing jobs affects the following:
* Your available equipment
* Your current stats
* Your stat growth on level ups
* Your list of spells
* Your commands in battle
* Your sprite in battle
* Your class description in the menu

Fog bugs, feedback, comments, and suggestions feel free to comment it in the forum or directly with me:
https://www.romhacking.net/forum/index.php?topic=39897.0

Discord servers where you can find me (as "S3"):
Final Fantasy IV Ultima
Final Fantasy IV Free Enterprise

===========
ROM details
===========
Title: FINAL FANTASY 2
Country: USA|NTSC
Version: 1.1
SMC-Header: no
CRC32: 23084FCD

============
Main changes
============
* Only 5 playable characters in total, no guests, everything else was repurposed to make room for the job system
* Each playable character represents a color (purple, blue, green, yellow, and red)
* A total of 14 unique Jobs available (including Jobless)
* Story mode is the same and it won't have a retranslation, some text is altered though
* New equipment and new spells
* Find information about the job system in Baron's Training Room
* Some algorithms were redone
* Some new battle sprites replacing old sprites
* Some field sprites changed
* Stat growth depends on the job equipped when you level up
* Job slot is available only after removing your equipment

================
Changed formulas
================
Some formulas have been modified, find the details below

Example:
(Old) first line = formula in vanilla
(New) second line = new formula

(Old) Accuracy = Weapon's accuracy + (Level / 4)
(New) Accuracy = Weapon's accuracy + (Agility / 4)

(Old) Attack = Weapon's attack + (Strength / 4) + (Level / 4)
(New) Attack = Weapon's attack + (Strength / 4) + (Agility / 4)

(Old) Magic defense = Equipment's magic defense
(New) Magic defense = Equipment's magic defense + (((Wisdom / 2) + (Will)) / 4)

(Old) Attack multiplier = 1 + (Strength / 8) + (Agility / 16)
(New) Attack multiplier = 1 + (Strength / 8) + (Level / 16)

(Old) Magic evasion = Equipment's magic evasion + ((Wisdom + Will) / 8)
(New) Magic evasion = Equipment's magic evasion + ((Level + Will) / 8)

(Old) Magic defense multiplier = (Wisdom + Will) / 32 + (Agility / 32)
(New) Magic defense multiplier = (Wisdom + Will) / 64 + (Level / 64)

(Old) Spell power = (Magic's spell power x 4)
(New) Spell power = (Magic's spell power x 4) + (Level / 2)

(Old) Summon Spell power = (Magic's spell power x 8)
(New) Summon Spell power = (Magic's spell power x 4) + (Will / 2)

(Old) Relative agility formula = (Cecil's Agility x 50) / (My Agility x 10)
(New) Relative agility formula = 750 / (My Agility + 32)

(Old) Critical rate odds = (base critical rate / 98)
(Old) Base critical rate is a fixed value depending on the character. That value is doubled with a weapon equipped, and tripled with bow and arrows.
(New) Critical rate odds = (Agility / 255)

(Old) Critical bonus with 1 weapon = base critical bonus + (Weapon's attack / 2)
(Old) Critical bonus with bow and arrows = critical bonus + Arrow's attack
(Old) Critical bonus with 2 weapons or no weapons = critical bonus
(Old) Base critical bonus is a value between 0 and 60 depending on the character
(New) Critical bonus = 48

(Old) Armor adds +5 to the target's defense
(New) Armor adds +10 to the target's defense if your level is higher than your defense, otherwise adds +3.

(Old) Shell adds +3 to  magic defense
(New) Shell adds +10 to magic defense if your level is higher than your magic defense, otherwise adds +3.

====
Jobs
====

Stat base bonus: Stat bonus for having that job equipped.
Special command: Effect of the special command of the job.
Stat growth: ranking of stat growth of level ups as S, A, B, C, D, or F. Being F the lowest growth and S the highest growth.
Notes: highlights of the job
STR: Strength
AGI: Agility
VIT: Vitality
WIS: Wisdom
WIL: Will

****************
* Job: Jobless *
****************
Stat base bonus
* None

Equipment
* Weapons: all
* Armors: all

Special commands
* None

Stat growth
*****************************************
* HP * MP * STR * AGI * VIT * WIS * WIL *
*****************************************
* D  * D  *  C  *  C  *  C  *  C  *  C  *
*****************************************

Notes
* A party member becomes jobless when the Job slot is empty
* Able to equip all armor types and all weapon types

*****************
* Job: DKnight  *
*****************
Stat base bonus
* STR/AGI/VIT/WIS +5
* WIL -10

Equipment
* Weapons: Axe, Darkblade, Hammer
* Armors: Shield, Heavy

Special commands
* Dark: deal damage to all monsters at the cost of 1/8 of your total HP
* Rage: the user becomes berserk with a KO countdown of 10 seconds

Stat growth
*****************************************
* HP * MP * STR * AGI * VIT * WIS * WIL *
*****************************************
* A  * D  *  S  *  D  *  B  *  D  *  F  *
*****************************************

Notes
* Dark ignores the defense of the monsters

*****************
* Job: Dragoon  *
*****************
Stat base bonus
* STR +5

Equipment
* Weapons: Axe, Spear, Sword
* Armors: Shield, Heavy

Special commands
* Jump: jumps in the air for a while, then lands on a single monster to deal double damage
* Lance: cast magic that drains HP from a single monster

Stat growth
*****************************************
* HP * MP * STR * AGI * VIT * WIS * WIL *
*****************************************
* A  * D  *  B  *  B  *  C  *  D  *  D  *
*****************************************

Notes
* None

*****************
* Job: Caller   *
*****************
Stat base bonus
* WIS/WIL +3

Equipment
* Weapons: Dagger, Rod, Staff, Whip
* Armors: Robe, Female

Special commands
* Call: list of summons that help in battle either by dealing damage, healing, or using special effects.
* Evoke: cast a random summon at no MP cost, it may fail at low MP levels

Stat growth
*****************************************
* HP * MP * STR * AGI * VIT * WIS * WIL *
*****************************************
* F  * S  *  D  *  D  *  F  *  S  *  B  *
*****************************************

Notes
* Call and Evoke scale with Wisdom and Will

*****************
* Job: Sage     *
*****************
Stat base bonus
* VIT/WIS/WIL +5
* STR/AGI -5

Equipment
* Weapons: Rod, Staff
* Armors: Robe

Special commands
* Magic: list of white magic and black magic

Stat growth
*****************************************
* HP * MP * STR * AGI * VIT * WIS * WIL *
*****************************************
* C  * B  *  F  *  F  *  D  *  A  *  A  *
*****************************************

Notes
* None

*****************
* Job: Bard     *
*****************
Stat base bonus
* AGI/WIS/WIL +5
* STR/VIT -5

Equipment
* Weapons: Bows, Dagger, Harp
* Armors: Vest, Robe

Special commands
* Sing: a list of support magic that cast special effects
* Hide: makes the user not targetable for some time
* Salve: consume a cure1 item to heal status effects of all allies

Stat growth
*****************************************
* HP * MP * STR * AGI * VIT * WIS * WIL *
*****************************************
* F  * C  *  C  *  C  *  F  *  B  *  B  *
*****************************************

Notes
* Sing scales with Wisdom and/or level

*****************
* Job: Ranger   *
*****************
Stat base bonus
* STR/AGI +3

Equipment
* Weapons: Bows, Dagger, Thrown, Whip
* Armors: Vest, Female

Special commands
* Aim: attack with high accuracy
* Crush: decreases defense and magic defense of all monsters

Stat growth
*****************************************
* HP * MP * STR * AGI * VIT * WIS * WIL *
*****************************************
* B  * D  *  A  *  B  *  D  *  D  *  D  *
*****************************************

Notes
* Can equip female armor
* Crush decreases defense to 0 and magic defense by half

*****************
* Job: Monk     *
*****************
Stat base bonus
* STR/AGI/VIT +5
* WIS/WIL -5

Equipment
* Weapons: Claw
* Armors: Vest

Special commands
* Focus: increases damage of the next physical attack
* Kick: deal damage to all monsters, can be boosted by Focus
* Aura: recover HP and enters in parry state, increasing defense and magic defense until next turn

Stat growth
*****************************************
* HP * MP * STR * AGI * VIT * WIS * WIL *
*****************************************
* S  * F  *  S  *  D  *  B  *  F  *  F  *
*****************************************

Notes
* None

*****************
* Job: BlackWz  *
*****************
Stat base bonus
* WIS +5

Equipment
* Weapons: Bows, Dagger, Rod
* Armors: Robe

Special commands
* Magic: list of black magic
* Bluff: increases the power of the next spell or item

Stat growth
*****************************************
* HP * MP * STR * AGI * VIT * WIS * WIL *
*****************************************
* D  * A  *  F  *  F  *  D  *  S  *  C  *
*****************************************

Notes
* Black Wizard's Magic scales with Wisdom and/or level
* Bluff also increases the power of weapons that cast magic as item

*****************
* Job: WhiteWz  *
*****************
Stat base bonus
* WIL +5

Equipment
* Weapons: Bows, Staff
* Armors: Robe, Female

Special commands
* Magic: list of white magic
* Pray: recover MP to the party, it has a small chance to fail

Stat growth
*****************************************
* HP * MP * STR * AGI * VIT * WIS * WIL *
*****************************************
* D  * A  *  F  *  D  *  F  *  C  *  S  *
*****************************************

Notes
* Can equip female armor
* White Wizard's Magic scales with Will and level
* Pray scales with level

*****************
* Job: Paladin  *
*****************
Stat base bonus
* VIT +5

Equipment
* Weapons: Axe, Holyblade, Sword 
* Armors: Shield, Heavy

Special commands
* Magic: list of white magic
* Cover: takes physical damage instead of an ally

Stat growth
*****************************************
* HP * MP * STR * AGI * VIT * WIS * WIL *
*****************************************
* S  * D  *  C  *  F  *  S  *  F  *  C  *
*****************************************

Notes
* None

*****************
* Job: Time Wz  *
*****************
Stat base bonus
* AGI/WIS +3

Equipment
* Weapons: Rod, Staff
* Armors: Robe

Special commands
* Magic: list of time magic
* Regen: the party recovers HP over time

Stat growth
*****************************************
* HP * MP * STR * AGI * VIT * WIS * WIL *
*****************************************
* C  * C  *  F  *  C  *  C  *  B  *  B  *
*****************************************

Notes
* Time Wizard's magic scales with Wisdom and level
* Regen scales with Will

*****************
* Job: Ninja    *
*****************
Stat base bonus
* AGI +5

Equipment
* Weapons: Claw, Dagger, Katana, Thrown
* Armors: Vest


Special commands
* Throw: consume shuriken or certain weapons to deal damage to one monster
* Magic: list of ninja magic

Stat growth
*****************************************
* HP * MP * STR * AGI * VIT * WIS * WIL *
*****************************************
* B  * D  *  B  *  A  *  F  *  B  *  F  *
*****************************************

Notes
* Throw ignores defense and scales with level
* Ninja magic scales with Wisdom and level

*****************
* Job: ??????   *
*****************
Stat base bonus
* STR/AGI/WIS/WIL +5
* VIT -10

Equipment
* Weapons: Bows, Dagger, Harp, Whip
* Armors: Vest, Robe, Female

Special commands
* #1???: member in the middle slot executes an unique effect at the cost of some MP
* #2???: either takes an item from a monster or confuses it

Stat growth
*****************************************
* HP * MP * STR * AGI * VIT * WIS * WIL *
*****************************************
* F  * C  *  C  *  C  *  F  *  B  *  B  *
*****************************************

Notes
* Optional job
* Can equip female armor
* Special command #1??? scales with Wisdom and level of the member in the middle slot
* Special command #1??? consumes MP from the member in the middle slot and the user

=================
Tools and patches
=================
Here's a list of some of the public tools and patches used:

FF4kster 0.8 (https://www.romhacking.net/utilities/914/)
FF4tweak 1.15 (https://www.romhacking.net/utilities/1654/)
YY_CHR.NET 20210606 (https://www.romhacking.net/utilities/958/)
Final Fantasy IV User Options 3.1 (https://www.romhacking.net/hacks/2232/)
SNES Final Fantasy IV: Add 15 New Spell Slots 1.0 (https://www.romhacking.net/hacks/5043/)
FF4 Long Range Fix (https://www.romhacking.net/hacks/892/)
Remove poison message (https://www.romhacking.net/hacks/7985/)
Final Fantasy II - Battle dialogue speed up (https://www.romhacking.net/hacks/8196/)
ff6tools (https://www.romhacking.net/utilities/1267/)


==============
Wall of Thanks
==============

People that, in a way or another, have helped me create and/or enhance this Rom hack.

Aexoden
chillyfeez
Crow!
ScytheMarshall


==========
Known bugs
==========

* Lance command will keep the command stance until next action is queued.
* Unequip all soft freezes on the character of slot 5 (4th slot from top to bottom) when inventory is full, press B to leave the menu fixes it.
* Unequip all soft freezes on the character of slot 5 (4th slot from top to bottom) when there is nothing to remove, press B to leave the menu fixes it.
* Using multiple copies of the same job is not fully tested out and may have unknown bugs.

=========
Changelog
=========

version 1.5

* 2026/01/13
* Autosort has been added, all items are sorted upon leaving the inventory screen, the -sort- item has been removed
* Unequip all has been added, press SELECT on the equipment screen to use it
* Updated some maps
* Updated some shops
* Updated some dialogue in the Training Room
* Now extra copies of a Job can be purchased at different shops

version 1.4.1

* 2025/11/04
* Fixed the attack animation of the WingEdge
* When a party member is revived with Life item or spell the formula to set the HP now uses the target's level
* ROM inner data still says version 1.4 for this update

version 1.4

* 2025/10/06
* When a party member is revived with Life item or spell the formula now uses defense instead of vitality
* Minimal stat changes for some weapons and armors
* Some spells of the Caller now cost less MP
* The spreadsheet of weapons and armors was updated
* Fixed a bug with some weapons and armors are either being or not being metallic by mistake
* Fixed a bug where the Power staff wasn't casting Bersk when used as an item 

version 1.3

* 2025/08/26
* Minor change in splash screen
* Minor AI changes for a few bosses
* New armors and weapons (mostly for midgame)
* Reworked Armor and Shell, check "changed formulas" to know how it works
* Armor and Shell effects now work during the final battle
* Content of some chests has been changed, most of them replacing arrows with a consumable item
* Count cannot be reflected anymore
* Salve command, Heal item, and Heal spell do not remove Slow nor Haste effects anymore
* Regen effect fades if the Time Wz has one of these statuses: swoon, stone, paralyze, sleep, charm, or berserk
* Fixed a bug in version 1.2 where monsters drop a batch of 10 arrows instead of only 1
* Fixed a vanilla bug where regen doesn't work if the middle slot is empty
* Armors are now categorized as All, Shield, Heavy, Vest, Robe, or Female, and is restricted to specific jobs
* For more details of weapons and armors check the spreadsheet in the forum's thread
* The readme has a new section with more details about the jobs


version 1.2

* 2025/05/27
* The Feymarch has 1 new item in the armor shop
* The steal table was changed for some bosses
* The table of some monster drops were changed, highlight on Pink Tail and Glass mask
* Fixed a freeze caused by the optional job using a special command and a party member in the middle slot either Jumping or Hiding
* Fixed an oversight where Rosa would join with 50 iron arrows equipped instead of only 1

version 1.1

* 2025/05/11
* Unlimited arrows
* The price of arrows has been adjusted
* Chests that previously had Carrot or Whistle have been replaced with a different item
* The content of some chests has been swapped
* New sprites for all jobs
* Palette adjustments for all new sprites
* Minor map changes
* Encounter rate reduced sightly for some dungeons
* Added Exit item, the Item shop of Silvera sells it
* The price of some items has been adjusted
* Stat adjustment of some weapons and armors
* Damcyan now has a crystal chamber
* Fix graphics and palette of some weapons


Version 1.0

* 2025/04/05
* First release
* Reworked, added, and removed Jobs from Beta
* Reworked, added, and removed Weapons / Armors
* Changed available items for some shops
* Rebalanced, added, and removed some spells
* "Erase" spell also removes float, slow, and fast effects
* Some maps changed from Beta
* Surprise and back attacks are less punishing
* Training Room now has NPCs with dialogue related to the Job system
* Rebalanced some monsters
* Encounter rate decreased for most maps
* Now you can only change your Job after removing your equipment
* Some new field sprites
* Fixed vanilla sylph bug
* Fixed vanilla in-battle dupe weapon/shield bug


Beta

* 2025/02/16
* Beta release for playtesting and feedback

=====
?????
=====
