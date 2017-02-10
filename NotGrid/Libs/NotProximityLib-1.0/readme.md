------------------------------------------------
-- Notes About Combat Log Messages
------------------------------------------------

None of the below can be used for accurate proximity assumptions. 
Here's why: Combat events are limited to the likes of "(%a+) hits". There's no "(%a+) gets hit". What does this mean? Lets look at a Ragnaros encounter for an example.

Player -- 0 yards
Ragnaros -- 40 yards
RaidMember --80 yards

When Ragnaros hits the RaidMember the player will get the combat message "Ragnaros hits RaidMember". That's great, our assumption is now that because we see "Ragnaros hits RaidMember" that we can capture the first name of such a string and determine that Ragnaros is in range. However, when the RaidMember hits Ragnaros, the player will get the event "RaidMember hits Ragnaros". Even though the RaidMember is 80 yards away, because he hit a unit that was within 40 yards the player still gets the message "RaidMember hits Ragnaros".

And it's not like you're getting any special arguments(in 1.12) sent along with these events telling you who is responsible for sending said combat message. All you know is you got a CREATURE_HITS_PARTY_MEMBER and PARTY_MEMBER_HITS_CREATURE. There's no way to parse out whether one is further away than the other. Almost all combat messages are made useless by this fact.

These are all deprecated:
CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS = ".+ c?[rh]its (%a+) for .+",
CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS = ".+ c?[rh]its (%a+) for .+",
CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS = ".+ c?[rh]its (%a+) for .+",
CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE = {".+'s .+ c?[rh]its (%a+) for .+", ".+'s .+ was resisted by (%a+)%."},
CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE = {".+'s .+ c?[rh]its (%a+) for .+", ".+'s .+ was resisted by (%a+)%."},
CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE = {".+'s .+ c?[rh]its (%a+) for .+", ".+'s .+ was resisted by (%a+)%."},

CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE = ".+'s .+ c?[rh]its (%a+) for .+",
CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE = "(%a+) is afflicted by .+"

CHAT_MSG_COMBAT_PARTY_HITS = "(%a+) c?[rh]its .+",
CHAT_MSG_COMBAT_FRIENDLYPLAYER_HITS = "(%a+) c?[rh]its .+",

CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE = "%a+ suffers %d+ %a+ damage from (%a+)'s .+" -- For this I could still read it for "(%a+) is Afflicted by" but creatures aren't in the RosterLib so its pointless.

------------------------------------------------
-- Notes About IsActionInRange()
------------------------------------------------

So the premise was we'd recognize that any healing class will have a 40yd healing spell right from the start. We could then use this spell as a default check for 40 yards for the targetted unit (its how the action bar determines whether to color them red or not) but IsActionInRange only accepts the literal button as value, not the spellname. So there's a possibility we could itterate through a player's actionbars and stop at the first 40 yard range spell we see and use that as the default, and listen for action bar changes(if thats a thing) and modify if needed. But that seems excessive, and I think we'd need to make a full table listing every 40 yard range spell to check against.

Level 1 Spells:
pala: Holy Light (40 yd)
prie: Lesser Heal(40 yd)
drui: Healing Touch(40 yd)
sham: Healing Wave(40 yd)

IsSpellInRange() -- TBC
IsItemInRange() -- TBC
IsCurrentAction() -- Useless. If you're casting and a unit runs out of range it won't fail unit it reaches the end of cast.


------------------------------------------------
-- ISSUES/BUGS
------------------------------------------------
unitischarmed -- need to handle this and not set him out of range with certain conditions