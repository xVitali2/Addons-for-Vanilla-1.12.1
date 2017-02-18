Chronometer - an Ace2 Spell Timer AddOn
(stolen heavily from AceTimer)

Chronometer tracks spell effects (HoTs, DoTs, buffs, debuffs, etc.) that you cast. You can see exactly how long is left on your spells so that you know when they're fading so that you can recast or do whatever else it is you need to do. Chronometer uses the Ace2 framework, including CandyBar for the timer bars themselves.

Chronometer is still undergoing heavy development, so please bear with me!

== Chronometer Options: ==
* /chron config - Shows a GUI configuration for Chronometer
* /chron anchor - Shows or hides the anchor to which Chronometer's timer bars are attached
* /chron bar - CandyBar display options
** /chron bar scale - Sets the scale of Chronometer's timer bars
** /chron bar growth - If toggled true, Chronometer's bars appear above the anchor and grow upwards. If toggled false, Chronometer's bars appear below the anchor and grow downwards.
** /chron bar texture - Sets the texture used for the bars
** /chron bar reverse - Toggles reversing the bars (filling up instead of emptying out).
** /chron bar bgalpha - Sets the transparency of the bar background.
** /chron bar bgcolor - Sets the color of the bar background.
** /chron bar color - Sets the default bar color (may be overriden for certain spells).
** /chron bar height - Sets the height of the bars.
** /chron bar textcolor - Sets the color of the bar text.
** /chron bar textsize - Sets the size of the bar text.
** /chron bar width - Sets the width of the bars.
** /chron bar text - Sets the text to be displayed on the bar. Use $s for spell name and $t for the target's name.
* /chron test - Runs some test bars so that you can adjust the other options more easily
* /chron kill - If toggled true, Chronometer will stop bars when the NPC or player the spell was cast on dies. When there are multiple NPCs with the same name, this becomes very inaccurage, since it has no way of knowing if the one that died was the same one that you cast the spell on intitially. If toggled false, deaths will not stop bars.
* /chron fade - If toggled true, Chronometer will stop bars when the spell fades from the NPC of player it was cast on. As with the kill option, multiple NPCs with the same name will make this option less accurate.
* /chron ghost - Sets the amount of time that "ghost" bars stay around. This is useful for seeing which spells have recently faded, and allows you to more easily recast the spell using Chronometer's bar-click functions.
* /chron self - Toggles bars for spell durations on the player. Some people didn't want to see these, since they already use another addon like EBB to give them self-buff/debuff bars.

== Clicking on the Chronometer Bars: ==
* Right-clicking a Chronometer bar will force the bar to disappear - especially useful if you use long debuffs like Curse of Shadows and leave the /chron kill option off to avoid issues with duplicate NPC names.
* Left-clicking a Chronometer bar will recast the spell on the bar's target. If the target is an NPC and there are other NPCs nearby with the same name, Chronometer has no way to distinguish between them, so do so at your own risk.
* Middle-clicking a Chronometer Immolate bar will cast Conflagrate on the bar's target. Again, duplicate NPC names can cause problems with this.
* Middle-clicking a Chronometer Rejuvenation or Regrowth bar will cast Swiftmend on the bar's target.


== Fixes ==

* Fixed SnD timers to work in KRONOS (LaYt)
+ Fixed #1 "Bars not disappearing after kill"
+ Added ruRU locale

== TODO: ==
* Go through and make sure that all spell timers are accurate
* Add rogue poisons
* Add bar disappearance on totem death
* Add pet spellcasts (Intimidation, Seduce, etc.)
* More color for bars (by spell school? by buff/debuff?)
* Sort options, something like PerfectRaid's sort functionality. (duration, target, remaining, spellname, buffdebuff, etc.)
* Handle diminishing returns
* Get more tricky about distinguishing NPCs with the same name (raid targets, perhaps?)
* Items (Net-o-Matic, Mind Control Cap, etc.) (no rush on this one)
* Better solution for event-based bars