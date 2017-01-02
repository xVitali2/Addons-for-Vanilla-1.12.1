DoTimer, by Asheyla <Warcraft Gaming Faction> @Shattered Hand (Horde), is a vastly sophisticated DoT tracking addon, featuring spearation by target, smart timer removal, a host of interface options, extreme macro support, and much more!  

Due to the way Blizzard gives addons information, there are some inherent flaws in this addon, but I have tried very hard to overcome them as much as possible.  For instance, if two mobs have the same name/sex/level, no addon can distinguish between them.  DoTimer knows this fact and thus will not erratically delete timers it cannot find on your target if there's a chance you may have targeted an "identical" one.  Also, the spellcasting system in general is very vague.  DoTimer uses a complex system of checks to make sure that it never makes timers when it shouldn't, and always does when it should, but once in a blue moon a timer may not appear.  Note that this is very rare; I cannot recall the last time it happened to me!
	
Overall, though, the mod is very accurate.  It even detects resists, immunes, reflects, and evades =]

Support is added for up to ten unique targets and twenty debuffs on each target.  Once this limit is reached, the addon will delete the oldest entries, to save screen space and processing time.  On a related note, in order to update the timers on the screen as well as for any finished timers, the addon checks all your timers several times per second.  If you notice lag caused by this addon, you may set the time it waits betwen calls higher - but remember, this means that your onscreen timers won't be changed as often.  The default value is 0, or no delay.  No code is run while no timers are present on the screen, and you can change the max # of targets and debuffs to conserve space.

Currently, you can view the onscreen timers as either icons or bars.  There are no current plans for more display options.  

DoTimer detects overwriting old spells as well as casting a different curse on a target, and when this happens it deletes the proper entries.  

DoTimer defines several functions written specifically for macros.  One is called DoT_IsPSpell("spellname").  What it does is lets you test your current target for a specified debuff, and the function will return true if it is on your mob, if not, it'll return false and cast it for you.  This differs from other functions in that it looks ONLY at your own debuffs, not any from other people!  So there can be 15 corruptions on the target, but if none are yours, it'll return false.  See below for sample macros using this command =]  Note that it bases its judgment on if you have a timer running, so in hectic situations, it may not be completely accurate.  If you're farming solo, it is not a bad idea to just use the next function, not this one.  

Another function is DoT_IsSpell("spellname").  It tests if ANY of that debuff are on the target (better for CoS, CoE, etc. that can only be applied once), and casts if it cannot find it.  

Another is DoT_DetermineSpell("spell1","spell2").  It follows this logic: If spell1 is not on the mob, cast it and return "false".  Else, if spell2 is not on it and you did not already cast spell1, cast spell2 and return "false".  else, return "true."

Two minor functions are DoT_OwnSpellOnTarget(spell) and DoT_SpellOnTarget(spell).  They function the same way as their DoT_IsPSpell / DoT_IsSpell counterparts, but do not cast if the query is not found.  

Another, DoT_ReturnRemaining(spell), retuns how much longer spell has left on your target; max duration if it is not present.  DoT_ReturnElapsed(spell) returns how long spell has been on the target, 0 if not present.

All of these functions have an optional 2nd (or 3rd in the case of DoT_DetermineSpell) parameter: unitID.  Obviously, the default is "target", but people wanting to use these functions for raid targets may find this parameter useful.  Note that if the function casts a spell, it WILL auto-target the correct unit based on this parameter!  Unless, of course, you have an acceptable target already and the game forces the spell on it.... but whatever.

The /command for this addon is /dotimer, or /dot.  Typing it opens up a GUI; if you want to use a command-line approach type /dotimer help.  Here are some features:

- changing the scale of the addon
- disabling or enabling the interface
- disabling or enabling the appearing of target names
- changing how often the data is refreshed (for performance issues)
- allowing spells to be cancelled if you don't have enough mana for them, with Life Tap being cast instead
- locking the interface in place
- changing the max allowed displayed targets and debuffs per target
- changing the layout: the direction in which new targets and debuffs are added (16 total setups)
- displaying icons and fake timers for any number of debuffs, to experiment with interface setups (and hiding them of course)
- sorting the timers by time added or time remaining
- changing the scale of the icons themselves
- allowing or unallowing clickable debuffs: if they are clickable, shift+click removes, click targets the mob, and control+click creates a ghost timer
- ghost timers - clicking on this will target the mob as usual, but a subsequent click will recast whatever spell it was created from.  lasts 5 minutes
- simulating timers for testing purposes
- enabling or disabling the appearance of depreciated timers (ones that may not be accurate for your current target, but you may still want to see a timer for) 
- setting the rank of life tap to be used with the check mana feature
- letting the macro functions ignore immolate (so you can include them in macros but not waste casts on fire-immune mobs)
- showing only timers for your own target
- playing sounds when timers near expiration
- having the ghost timer for immolate cast conflag instead
- same thing as above, except rejuv / swiftmend
- bar or icon format

If you want a different sound, just replace "expalert.wav" with whatever you want and rename it.  Very simple.

For non-warlocks: I have added support for priests, druids, and hunters.  The addon should be working for you, but there has been limited testing.  
For foreign users: I have made great strides to localize this addon.  Please download it and test it out!

If you want to suggest a feature, send me an e-mail at ross456@gmail.com, drop me a comment at this addon's curse-gaming website, or send me a PM on the curse-gaming forums.  I will certainly read your suggestion and hopefully implement it!

## SAMPLE MACROS ##
--casts corruption if yours isn't on mob, else shadow bolt
/script if DoT_IsPSpell("Corruption") then CastSpellByName("Shadow Bolt()") end

--casts corruption and immolate then shadowbolt
/script if DoT_IsPSpell("Corruption") then if DoT_IsPSpell("Immolate") then CastSpellByName("Shadow Bolt()") end end

--casts Curse of Shadow if it is not on the mob, else shadowbolt
/script if DoT_IsSpell("Curse of Shadow") then CastSpellByName("Shadow Bolt()") end

--casts CoS or CoA, then shadowbolt
/script if DoT_DetermineSpell("Curse of Shadow","Curse of Agony") then CastSpellByName("Shadow Bolt()") end

--casts Conflag if Immol has been running for at least 13 seconds
/script if DoT_ReturnElapsed("Immolate") >= 13 then CastSpellByName("Conflagrate") end

--casts banish if previous banish has less than 2 seconds left
/script if DoT_ReturnRemaining("Banish") <= 2 then CastSpellByName("Banish") end

--casts Swiftmend if it can be cast, else Rejuvenation
/script local r,s,c="Rejuvenation",DoT_SpellOnTarget,CastSpellByName if (s(r) or s("Regrowth")) then c("Swiftmend") else c(r) end

You get the idea!

If you have any other macro questions, just contact me and I'll help you out.  