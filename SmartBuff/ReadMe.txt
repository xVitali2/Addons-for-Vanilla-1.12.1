SmartBuff
Created by Aeldra (EU-Proudmoore)


***********************************************************************


SmartBuff is a buff addon, to cast buffs ease and quickly. All classes are supported. Bind a key (or create a macro '/sb') and it checks if you, a party/raid member, also hunter and warlock pets, needs your buff and cast it. Use the options menu to configure it you like, as example: buffs, raid subgroups, pets, etc.
Run the mod when ever you wish, if nothing is buffed, there is no penalty or cool down.


Features:
- Supports all classes
- Supports EN/DE/FR clients
- Checks buffs and rebuff you, raid/party members, raid/party pets
- Setup your own buff templates (Solo, Party, Raid, Battleground, MC, Ony, BWL, AQ, ZG, Custom 1-5)
- Auto switch templates
- Individual setup for each buff
- Supports group buffs: 'Gift of the Wild'/'Arcane Brilliance'/'Prayer of Fortitude'/'Prayer of Spirit', incl. group size and reagence check
- Supports class buffs: all greater blessings of the Paladin
- Supports self buffs
- Supports weapon buffs (individual for main and off hand): Shaman, all poisons (Rogue), all stones and oils, incl. reagence check
- Supports character level based buffs
- Supports tracking abilities
- Reminder if a buff is missing (Splash/chat/sound)
- ReBuff Timer
- Only one key is needed
- Fast and easy to use


Usage:
Minimapbutton:
Left click: opens SmartBuff options frame
Right click: enables/disables SmartBuff

Chat:
Type /sbm for options menu in game
Type /sb [command] or /smartbuff [command] in game
- cast buff
toggle - Toggles SmartBuff On/Off
menu - Show/hide options menu
target - buffs the current target

Options frame:
Right click on buff checkbox: opens buff setup frame


Please send me a mail or write a comment if you discover Bugs or have Suggestions.

Contact:
aeldra@sonnenkinder.org


***********************************************************************


Beschreibung:
SmartBuff ist ein Buff Addon, dass das (Re)Buffen so einfach und schnell wie möglich von statten geht. Es werden alle Klassen unterstützt. Auf Knopfdruck (Bind oder Macro erstelle ein Macro '/sb') wird der Spieler/Gruppe/Raid Sub-Gruppe, auch die Hexer/Jäger Pets, überprüft und wenn nötig gebufft. Über das Optionen Menü kann alles nötige eingestellt werden, wie z.B. Buffs, die zu buffenden Raid Sub-Gruppen, Buffen der Pets, etc.


Features:
- Unterstützt alle Klassen
- Unterstützt EN/DE/FR Clients
- Überprüft die Buffs und bufft dich, Raid/Party Mitglieder, Raid/Party Pets
- Individuelle Einstellungen für jeden Buff
- Erstellen von Buff-Vorlagen möglich (Solo, Party, Raid, Battleground, MC, Ony, BWL, AQ, ZG, Custom 1-5)
- Automatischer Vorlagewechsel
- Unterstützt Gruppen-Buffs: 'Gabe der Wildnis'/'Arkane Brillanz'/'Gebet der Seelenstärke'/'Gebet der Willenskraft', inkl. Gruppengrösse und Reagenzien Check
- Unterstützt Klassen-Buffs: Grosse Segen des Paladins
- Unterstützt Selbst-Buffs
- Unterstützt Waffen-Buffs (individuell für Waffen- und Schildhand): des Schamanen, alle Gifte (Schurke), alle Steine und Öle, inkl. Reagenzien Check
- Unterstützt vom Charakter-Level abhängige Buffs
- Unterstützt die Suche nach Kräutern, Erzen, etc.
- Erinnerung, falls bei jemandem ein Buff fehlt (Splash/Chat/Ton)
- ReBuff Timer
- Nur ein Knopfdruck :)
- Schnell und einfach


Gebrauch:
Minimap-Knopf:
Linksklick: öffnet das SmartBuff Menü
Rechtskklick: schaltet SmartBuff an/aus

Tippt /sbm für das Option-Menü in game
Tippt /sb [command] oder /smartbuff [command] in game
- um zu buffen
toggle - Toggles SmartBuff An/Aus
menu - Öffnet/versteckt das Options-Menü
target - bufft das anvisierte Zeil

Optionen-Menü:
Rechtsklick auf die Buff-Checkbox: öffnet das Buffsetup-Menü


Bei Fehler oder Verbesserungsvörschläge meldet euch hier oder schickt mir eine Email.

Kontakt:
aeldra@sonnenkinder.org


***********************************************************************


Changes: 
Rev     Date        Description
------  ----------  -----------------------
1.12a   2006/10/01  Fix LUA error 1217 
                    Fix for reset buff timers on group buffs 
                    Fix charge check for priest 
                    Fix Moonkin can cast buffs 
                    Added new buff: Rogue (Slice and Dice)
                    Added new buffs: Racial buffs (Dwarv, Human, Orc, Troll, Undead)
                    Added new option: Advanced group buff check (checks also the single buffs)
                    Added new option: Advanced group buff range check (range check on each group member)
                    Added new option: Buff in cities 
                    Added new option: CTRA sync, tries to sync the buff timers from other players over ctra, works only in raids
                    Added new slider: Blacklist, to adjust the blacklist duration 
                    Added new button: "Reset BT" (reset buff timers) button in the option screen
                    Code optimized on target switch based buffing, to speed up buff checks and reduce the amount of target changing (big thanks to sarf)
                    Fixed german localization (Paladin)
                    Traditional chinese (Taiwan) localization

1.11b   2006/07/05  Added new function: Reset buff timers. It allow rebuffing at any time, if the buffs were casted with SB before. Use '/sb rbt' or key binding. Rebufftimer have to be enabled to use this function.
                    Added new buffs: Druid (Tiger's Fury)
                    Fixed charge check for Shaman lighting shield
                    Fixed bugs on startup (LUA error, font set)
                    Fixed buff while player is PvP flaged
                    
1.11a   2006/06/27  Added new option: check charges
                    Fixes for patch 1.11
                    Removed "Dectect traps" (Rogue)
                    Fixes german localization
                    Fixes group buffs
                    Fixes on startup
                    
1.10g   2006/05/05  Added new option: buff on target change
                    Added new buff option: Notification (individual reminder foreach buff)
                    Added new buff option: Rebuff timer (individual timer foreach buff, if zero it takes the global timer)
                    Improved ReBuff timer (group/class buffs)
                    Improved buff check (if not enough mana)
                    Fix for weapon buffs while moving
                    
1.10f2  2006/04/29  Hotfix for the dead spot on screen

1.10f   2006/04/28  Changed option: Autoswitch template group type based
                    Added new option: Autoswitch template instance based
                    Added new option: Buff PvP flagged players
                    Added new buffs: Priest (Inner Focus)
                    Changed buff: Priest (Power Word: Shield)
                    Added new option to move and change the font of the reminder message (drag to move, click outside to change the font) 
                    Improved ReBuff timer (group/class buffs)
                    Improved warning messages (cooldown, shapeshifted)
                    Fixed Druid bug while shapeshifted
                    Fixed Paladin bug with greater blessings
                    Localized template names
                    Fix for NaturalShapeshifter addon (or other addons which modify the shapeshift bar)

1.10e   2006/04/21  Big changes in 1.10e! The way how buff settings will stored has changed. You have to setup your buffs again.
                    Please be carefully with buffs that could overwritten, like blessings of the Paladin. Your running quickly oom, if you activate all of them ;)
                    
                    Added new buff setup frame, individual setup for each buff is now possible (class select, in combat, out of combat, self only, main/off hand)
                    Added buff setup templates (Solo, Party, Raid, Battleground, MC, Ony, BWL, AQ, ZG, Custom 1-5), quick changing of your individual buff setup
                    Added new buffs: Paladin (most of all Blessings, also the greater one)
                    Added new buffs: Mage (Mana Shield, Fire Ward, Frost Ward, Ice Barrier)
                    Added new buffs: Druid (Nature's Grasp)
                    Added new weapon buffs (individual for main and off hand): all poisons (Rogue), all stones and oils, incl. reagence check
                    Added new option: Autoswitch template (group type/instance based)
                    Added new option: Self first (for each template)
                    Added new option: Hook mousewheel to buff
                    Added new option: Buff target first (it doesn't matter if the target is in your group or not)
                    Moved buff hunter pets: pets could now set for each buff
                    Moved buff warlock pets: pets could now set for each buff
                    Moved advance rules: classes could now set for each buff
                    Moved self only: could now set for each buff
                    Improved ReBuff timer (player buffs)
                    Fixed losing target, when not enough Mana/Rage/Energy
                    Fixed Druids can cast tracking abilities while shapeshifted
                    Fixed german localization (Furchtzauberschutz)
                    Fixed french localization (a lot *g*)

1.10d   2006/04/08  ReBuff timer added (starts at the first buff you cast. Time left of buffs you/party/raid already had, when you logged in or changed group can not detected)
                    Added new buffs: Priest (Prayer of Shadow Protection), Hunter (Rapid Fire)
                    Added new option: Rebuff timer, reminds you (0 - 300sec. 0 = timer disabled) before a buff is running out
                    Added new option: Hide minimap button
                    Added new option: Buff only yourself
                    Fixed Shaman weapon buffs
                    Fixed french localization
                    Fixed when options frame open, keyboard is not locked

1.10c   2006/04/04  Added new buffs: Druid (Barkskin), Priest (Power Word: Shield, but only as self cast), Warlock (Soul Link)
                    Added Shaman support (Lightning Shield, Rockbiter/Frostbrand/Flametongue/Windfury Weapon, Water Breathing)
                    Added basic Warrior support (Battle Shout, Berserker Rage, Bloodrage)
                    Added basic Rogue support (Detect Traps, Blade Flurry, Evasion)
                    Added basic Paladin support (Righteous Fury, Holy Shield, all Auras)
                    Added option: Disable messages (normal/warning/error)
                    Right click the minimap button disable/enable SmartBuff
                    Improved cooldown handling
                    Fixed french localization
                    Fixed Minimap bug
                    Fixed tracking bug for druids in cat form
                    
1.10b   2006/04/01  Added new buffs: Mage (Dampen Magic, Amplify Magic)
                    Added new tracking abilities (all)
                    Added Minimap button
                    French localization (Big thanks to Sasmira)
                    New options menu

1.10a   2006/03/30  Added new buffs: Priest (Touch of Weakness, Prayer of Spirit), Warlock (all Detect ... Invisibility)
                    Options frame close on ESC key press
                    Improved buff detection

1.10    2006/03/29  Fixes for patch 1.10

1.10    2006/03/27  Added reagence check for all group buffs
beta4

1.10    2006/03/21  Added advance rules checkbox in the option frame (does not cast: Thorns on Mages/Priests/Warlocks, Arcane Intellect/Divine Spirit on units without Mana) 
beta3               Bugfix for resting check, while you are resting (in capital cities or taverns) the reminder is disabled, except you are pvp flagged
                    Bugfix for Warlock spell "Unending Breath"

1.10b   2006/03/15  Added support for Hunters and Warlocks
beta2               Added new buffs: Priest (race buffs), Mages (all armors)
                    Added mana check
                    While you are resting (in capital cities or taverns) the reminder is disabled

1.10    2006/03/10  REMOVED Autobuff option, during restriction from blizzard in patch 1.10
beta                Added Reminder if a buff is missing, displays a chat/splash message or plays a sound
                    Added character level based casting, it casts the highst possible rank for lower characters
                    Added basic line of sight check (buff needs to be on an actionbar), includes a blacklist
                    Added group buff check, if 4 or more in a group and 4 or more have not the buff, it casts "Gift of the Wild"/"Arcane Brilliance"/"Prayer of Fortitude"
                    Added new keybind/commmand to buff the current target (keybindings changed, please rebind keys)
                    Added new buffs: Priest "Divine Spirit", Druid "Omen of Clarity"
                    Druid buff "Thorns" is no longer casted on Priests/Mages/Warlocks
                    Added tooltips
                    Movable option menu
                    Save variables per character
                    Improved buff detection 
                    Bugfix for Druids in Shapeshift (Travelforms)

1.4     2006/02/21  Bugfix for Druids in Shapeshift

1.3     2006/02/01  Bugfix for messages in autobuff mode
                    check method improved
                    new buffs added (mage/priest)

1.2     2006/01/25  Bugfix druid thorns buff

1.1     2006/01/17  Autobuff (on movement) option added
                    Autobuff timer added
                    Improved buff detection

1.0     2005/11/25  Initial version of SmartBuff
