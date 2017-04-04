# FocusFrame
Provides [focus targeting](http://wowwiki.wikia.com/wiki/Focus_target) & frame support for vanilla World of Warcraft. (1.12.1, English client only)

>If you have never used focus before, it's basically a secondary target system that keeps track of a second unit other than the currently targeted unit. Once a focus is set, you can use macros to cast spells on the focus without having to lose your current target.

The focus frame works for both friendly and enemy players.


![alt](http://i.imgur.com/OEcWwgU.jpg)

## Chat commands

Focus current target or by name:

<sup>Will clear current focus if you have no target.</sup>
```
/focus
/focus playername
```

Focus current mouseover target:
```
/mfocus
```

Cast spell on focus target:

<sup>fcast will be used on nearest unit found when there are multiple mobs with same name.</sup>
```
/fcast spellname
```

Cast spell on focus target if sat, else cast on current target:
```
/fcast spellname-target
or:
/fitem itemname-target
```

Use item effect on focus target:
```
/fitem itemname
```

Target the focus target:
```
/tarfocus
```

Swap focus and target:
```
/fswap
```

Assist focus:
```
/fassist
```

Clear current focus:
```
/clearfocus
```

If you need more advanced macros, you'll need to create your own script. "/fcast spell" can be accessed in scripts using 'SlashCmdList.FCAST("spell")'

Example: This macro will cast Polymorph on focus if SHIFT modifier is held down, or else it'll cast it on current target.
```
/run if IsShiftKeyDown() then SlashCmdList.FCAST("Polymorph") else CastSpellByName("Polymorph") end
```


### Options

Set frame scale: (0.2 - 2.0)
```
/foption scale 1.0
```

Toggle frame dragging:

<sup>Hold down left mouse button on focus **portrait** to move it.</sup>
```
/foption lock
```

Toggle fading of frame when focus hasn't been updated for ~10s:
```
/foption fade
```

Toggle hiding of frame on loading screens/release spirit:
```
/foption nohide
```

Reset to default:
```
/foption reset
```

## Important
When using this addon there are some limitations or caveats you should know about due to the way WoW 1.12.1 api works:

- **There's no way to distinguish between NPCs with the exact same name. So most of this addon's functionality won't work properly on mobs.**
- Power for a non-party member focus is updated when you or your party members targets the focus target. (Also every time you use /fcast)
- Health is updated same way as power, but will also update when the focus target's nameplate is in range.
- Casts & buffs for focus are only tracked if the focus is within 40 yards range of your character.
- For rogues/druids: You will lose all your combo points when switching between target and focus!!
- For some reason **healing** spell casts are not tracked if the focus is inside your party. Not sure if this is a vanilla thing or Elysium bug.
- This addon is only tested on Elysium servers. Other servers might not have implemented all the combat log events required for this addon to function properly.

## Installation
1. Download latest [version here.](https://github.com/wardz/FocusFrame/releases)
2. Extract the downloaded file into your "WoW/Interface/AddOns" folder.
3. Remove any suffixes from the addon's folder name. E.g: "FocusFrame-v1.0" to "FocusFrame".

## Plugins
- [modui-FocusFrame](https://github.com/gashole/modui-FocusFrame) by [Gashole](https://github.com/gashole)
