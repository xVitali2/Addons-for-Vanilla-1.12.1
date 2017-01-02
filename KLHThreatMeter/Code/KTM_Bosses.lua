--! This module references these other modules:
--! combat:	event, addattacktodata, 
--! data:	threatconstants, 
--! net:	lastmtsender, sendmessage, clearmastertarget, sendmastertarget, clearraidthreat, reportspelleffect, sendevent, 
--! out:	checktrace, printtrace, print, 
--! regex:	parse, addparsestring, 
--! table:	raiddata, raidthreatoffset, getraidthreat, resetraidthreat, 
--! unit:	findunitidfromname, isplayerofficer, 
--! string:	unlocalise, get, 

--! This module is referenced by these other modules:
--! console:	starttrigger, 
--! net:	bossattacks, 
--! netin:	mastertarget, isspellreportingactive, istrackingspells, bossevents, reportevent, bossattacks, newmastertarget, clearmastertarget, 
--! guiraid:	mastertarget, mttruetarget, updateaggrogain, 

local mod = klhtm
local me = {}
mod.boss = me

--[[
KTM_Bosses.lua

This module contains all the code for special boss encounters, determining who has aggro, etc.

The old functions from the old KLHTMTargetting.lua are a bit scrappy and due for a major buff in R17, as well
as the entire rest of this module, with lots more boss encounters being added.
]]

--! This variable is referenced by these modules: netin, 
me.isspellreportingactive = false
--! This variable is referenced by these modules: netin, 
me.istrackingspells = false
me.bosstarget = ""

-- me.onload() - called by Core.lua.
me.onload = function()
	
	-- Let's create our parser!
	me.createparser()
	
end

function klhtm:ResetRaidThreat()
        mod.table.resetraidthreat()
end

me.myevents = { "CHAT_MSG_MONSTER_EMOTE", "CHAT_MSG_MONSTER_YELL", "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CHAT_MSG_COMBAT_HOSTILE_DEATH", }

me.onevent = function()
	
	if event == "CHAT_MSG_MONSTER_EMOTE" then
		
		if string.find(arg1, mod.string.get("boss", "speech", "razorphase2")) then
			
			-- clear threat when phase 2 starts
			mod.table.resetraidthreat()
			
			-- set the master target to Razorgore, but only if a localised version of him exists.
			local bossname = mod.string.get("boss", "name", "razorgore")
			
			if mod.string.unlocalise("boss", "name", bossname) then
				mod.target.automastertarget(bossname)
			end
			
			return
		end
	
	elseif event == "CHAT_MSG_MONSTER_YELL" then
	
		-- Thad Phase 2
		if string.find(arg1, mod.string.get("boss", "speech", "thad1")) or string.find(arg1, mod.string.get("boss", "speech", "thad2")) or string.find(arg1, mod.string.get("boss", "speech", "thad3")) then
			
			-- reset threat in phase 2
			mod.table.resetraidthreat()
			
			return
		end
	
		-- Noth
		if string.find(arg1, mod.string.get("boss", "speech", "noth1")) or string.find(arg1, mod.string.get("boss", "speech", "noth2")) or string.find(arg1, mod.string.get("boss", "speech", "noth3")) then
			
			mod.target.automastertarget(arg2)
			
			return
		end
	
		-- Ony Phase 2
		if string.find(arg1, mod.string.get("boss", "speech", "onyxiaphase3")) then
			
			-- reset threat in phase 2
			mod.table.resetraidthreat()
			
			return
		end
		-- Nef Phase 2
		if string.find(arg1, mod.string.get("boss", "speech", "nefphase2")) then
			
			-- reset threat in phase 2
			mod.table.resetraidthreat()
			
			-- boss name is given by the arg2
			mod.target.automastertarget(arg2)
			
			return
		end	
	
		-- ZG Tiger boss phase 2
		if string.find(arg1, mod.string.get("boss", "speech", "thekalphase2")) then
			
			-- reset threat in phase 2
			mod.table.resetraidthreat()
			
			-- boss name is given by the arg2
			mod.target.automastertarget(arg2)
			
			return
		end
		
		-- Rajaxx attacks
		if string.find(arg1, mod.string.get("boss", "speech", "rajaxxfinal")) then
			
			-- reset threat when he finally attacks
			mod.table.resetraidthreat()
			
			-- boss name is given by arg2
			mod.target.automastertarget(arg2)
			
			return
		end
		
		-- Azuregos Port
		if string.find(arg1, mod.string.get("boss", "speech", "azuregosport")) then
			
				mod.table.resetraidthreat()
			
			return
		end

		-- KT Phase 2
		if string.find(arg1, mod.string.get("boss", "speech", "ktphase2")) then
			
			-- reset threat in phase 2
			mod.table.resetraidthreat()
			
			-- boss name is given by the arg2
			mod.target.automastertarget(arg2)
			
			return
		end
	
	elseif event == "CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS" then
		
		-- 1) Scan for casting pattern
		local output = mod.regex.parse(me.parserset, arg1, event)
	
		if (output.hit == nil) or (output.parser.identifier ~= "mobbuffgain") then
			return
		end
		
		-- 2) Get Boss, Spell
		local boss, spell = output.final[1], output.final[2]
		
		-- noth blink
		if spell == mod.string.get("boss", "spell", "nothblink") then
			
			-- notify the raid, if this event isn't on cooldown 
			if GetTime() < me.bossevents.nothblink.lastoccurence + me.bossevents.nothblink.cooldown then
				-- on cooldown. don't send
			else
				mod.net.sendevent("nothblink")
			end
		end
	
	elseif event == "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE" then
		
		-- 1) Scan for casting pattern
		local output = mod.regex.parse(me.parserset, arg1, event)
	
		if (output.hit == nil) or (output.parser.identifier ~= "mobspellcast") then
			return
		end
		
		-- 2) Get Boss, Spell
		local boss, spell = output.final[1], output.final[2]
		
		-- twin teleport
		if spell == mod.string.get("boss", "spell", "twinteleport") then
			
			-- notify the raid, if this event isn't on cooldown 
			if GetTime() < me.bossevents.twinteleport.lastoccurence + me.bossevents.twinteleport.cooldown then
				-- on cooldown. don't send
			else
				mod.net.sendevent("twinteleport")
			end
				
		-- gate of shazzrah
		elseif spell == mod.string.get("boss", "spell", "shazzrahgate") then

			-- notify the raid, if this event isn't on cooldown 
			if GetTime() < me.bossevents.shazzrahgate.lastoccurence + me.bossevents.shazzrahgate.cooldown then
				-- on cooldown. don't send
			else
				mod.net.sendevent("shazzrahgate")
			end
		end
	
	elseif event == "CHAT_MSG_COMBAT_HOSTILE_DEATH" then
		
		-- 1) Scan for mob death
		local output = mod.regex.parse(me.parserset, arg1, event)
	
		if (output.hit == nil) or (output.parser.identifier ~= "mobdeath") then
			return
		end
		
		local mobname = output.final[1]
		
		if (mobname == mod.target.mastertarget) and (mod.target.isworldboss == true) then
			
			-- notify the raid, if this event isn't on cooldown 
			if GetTime() < me.bossevents.bossdeath.lastoccurence + me.bossevents.bossdeath.cooldown then
				-- on cooldown. don't send
			else
				mod.net.sendevent("bossdeath")
			end
		
		end
	
	else
		me.parsebossattack(arg1, event)
	end
	
end

--[[
me.onupdate is called by Core.lua. It currently has 3 different parts that are unrelated.
]]
me.onupdate = function()

	local key, value, key2
	
	-- 1) if we are out of combat, reset the ticks on all boss abilities that have them
	if UnitAffectingCombat("player") == nil then
		
		for key, value in me.tickcounters do
			for key2 in value do
				value[key2] = 0
			end
		end
	end
	
	-- 2) clear out all old event reports - one report but no confirmations for 1.0 seconds.
	local timenow = GetTime()
	
	for key, value in me.bossevents do
		if (value.reporter ~= "") and (timenow > value.reporttime + 1.0) then
			
			-- debug
			if mod.out.checktrace("warning", me, "event") then
				mod.out.printtrace(string.format("The event %s has not been confirmed. It was reported by %s.", key, value.reporter))
			end
			
			-- remove the report
			value.reporter = ""
		end
	end

	-- 3) spellreporting: check for target changes
	if (me.isspellreportingactive == true) and (me.istrackingspells == true) and mod.target.mastertarget then
		
		-- 1) find mt
		local x, newtarget
		
		for x = 1, 40 do
			name = UnitName("raid" .. x .. "target")
			if name == mod.target.mastertarget then
				
				-- get target^2
				newtarget = UnitName("raid" .. x .. "targettarget")
				
				if newtarget == nil then
					newtarget = "<none>"
				end
				
				break
			end
		end
		
		-- couldn't find the boss?
		if newtarget == nil then
			newtarget = "<unknown>"
		end
		
		-- report!
		if newtarget ~= me.bosstarget then
			
			-- find the threat of the old target
			local oldthreat = mod.table.raiddata[me.bosstarget]
			if oldthreat == nil then
				oldthreat = "?"
			end
			
			-- threat of the boss' new target
			local newthreat = mod.table.raiddata[me.bosstarget] 
			if newthreat == nil then
				newthreat = "?"
			end
			
			-- print
			mod.out.print(string.format(mod.string.get("print", "boss", "bosstargetchange"), mod.target.mastertarget, me.bosstarget, oldthreat, newtarget, newthreat))
			
			-- update bosstarget
			me.bosstarget = newtarget
		end
	end
	
	-- 4) Check triggers
	me.checktriggers()
	
end

--[[
------------------------------------------------------------------------------------------------
							Boss Events - Sending and Receiving
------------------------------------------------------------------------------------------------

Boss Events are when a mob changes his threat against everyone after taking some action. Some players may be out of (combat log) range of the boss action, so we have nearby players report these special events to the rest of the raid.
There is a potential for abuse if someone in the raid group sends false boss event reports, which could make the raid group incorrectly reset their threat. To counter this we require two people to report the same event within a small time interval for it to be activated.
For each event in <me.bossevents>, we keep track of the person who first reported it, and the time they reported it. If the trace key "boss.fireevent" is enabled, the mod will print out who first reported the event and who confirmed it.
Insertion: players in the raid report events in the network channel, and <me.reportevent(...)> is called from the <netin> module.
Maintenance: no OnUpdate maintenance necessary.
]]

--! This variable is referenced by these modules: netin, 
me.bossevents = { }

--[[
me.addevent(eventid, cooldown)
Defines a new event in <me.bossevents>. This is just a helper method to create <me.bossevents>. Called at file load.
<eventid> is a localisation key in the "boss"-"spell" set.
<cooldown> is the minimum time between casts, extreme lower bound. Want it large enough to avoid spams. 1 sec would probably do.
]]
me.addevent = function(eventid, cooldown)
	
	me.bossevents[eventid] = 
	{
		["cooldown"] = cooldown,
		lastoccurence = 0, 	-- GetTime()
		reporter = "",
		reporttime = 0, 	-- GetTime()
		["eventid"] = eventid,
	}
	
end

-- define all possible events. These methods are called at file read time.
me.addevent("shazzrahgate", 5.0)
me.addevent("twinteleport", 5.0)
me.addevent("wrathofragnaros", 5.0)
me.addevent("nothblink", 5.0)
me.addevent("bossdeath", 5.0)
me.addevent("fourhorsemenmark", 5.0)

--[[
mod.boss.reportevent(eventid, player)
Called when someone in the raid reports a boss event.
<eventid> is the internal name of the event.
<player> is the name of the player who reported it.
]]
--! This variable is referenced by these modules: netin, 
me.reportevent = function(eventid, player)

	local eventdata = me.bossevents[eventid]
	local timenow = GetTime()
	
	-- ignore if the event is cooling down
	if timenow < eventdata.lastoccurence + eventdata.cooldown then
		return
	end
	
	-- has this been reported recently? If so it is now confirmed and we can run it.
	if (eventdata.reporter ~= "") and (eventdata.reporter ~= player) then
		me.fireevent(eventdata, player)
	
	-- always trust reports from yourself
	elseif player == UnitName("player") then
		me.fireevent(eventdata, player)
	
	-- some player reports a new event. wait for confirmation
	else
		eventdata.reporter = player
		eventdata.reporttime = timenow
	end

end

--[[
me.fireevent(eventdata, player)
Run when an event is confirmed. Does whatever the event does.
<eventdata> is an structure in <me.bossevents>
<player> is the name of the player who confirmed the event
]]
me.fireevent = function(eventdata, player)
	
	-- debug
	if mod.out.checktrace("info", me, "event") then
		mod.out.printtrace(string.format("The event |cffffff00%s|r has occured. It was reported by %s and confirmed by %s.", eventdata.eventid, eventdata.reporter, player))
	end
	
	-- first reset the event's timers
	eventdata.lastoccurence = GetTime()
	eventdata.reporter = ""
	
	-- now actually do the event
	if eventdata.eventid == "shazzrahgate" then
		mod.table.resetraidthreat()
		
	elseif eventdata.eventid == "twinteleport" then
		mod.table.resetraidthreat()
		
		-- activate the proximity aggro detection trigger
		me.starttrigger("twinemps")
		
	elseif eventdata.eventid == "wrathofragnaros" then
		mod.table.resetraidthreat()
	
	elseif eventdata.eventid == "nothblink" then
		mod.table.resetraidthreat()
		
	elseif eventdata.eventid == "bossdeath" then
		mod.target.bossdeath()
		
	elseif eventdata.eventid == "fourhorsemenmark" then
		-- do a half wipe
		mod.table.raidthreatoffset = mod.table.raidthreatoffset - 0.5 * mod.table.getraidthreat()
	end
	
end

--[[
------------------------------------------------------------------------------------------------
				Triggers - Hard To Detect Events That Require Polling
------------------------------------------------------------------------------------------------

Some events have no easily defined actions such as a combat log event, and must be checked for periodically instead.
For example in the Twin Emperors encounter, after a teleport the closest person to each emperor is given a moderate amount of threat. The only way to see who received the threat is to see who the emperors target. However, after the teleport they become stunned and have no target, so we have to wait until the stun period has ended. So we make a trigger to periodically check them for new targets.
Each trigger has these properties:
<isactive>		boolean, whether the mod is checking the trigger
<startdelay>	time in seconds after the trigger is activated that the mod will start checking it.
<timeout>		time in seconds after the trigger has started that the mod should give up on it
<mystarttime>	when the most recent activation of the trigger occured.

The names and basic properties of triggers are defined in the variable <me.triggers>. This is a key-value list where the key is the internal name of the trigger, and the value is a structure with the variables described above.
To activate a trigger, call the <me.starttrigger(trigger)> function with the internal name of the trigger.
The code that will run each time a trigger is polled is contained in the variable <me.triggerfunctions>. This is a key-value list, where the key is the internal name and the value is the function that is run.
]]

me.triggers = 
{
	twinemps = 
	{
		isactive = false,
		startdelay = 0.5,
		timeout = 5.0,
		mystarttime = 0,
		data = 0,
	},
	autotarget = 
	{
		isactive = false,
		startdelay = 1.0,
		timeout = 300.0,
		mystarttime = 0,
		data = 0,
	}
}

--[[
me.starttrigger(trigger)
Activates a trigger. The mod will start periodically checking for it.
<trigger> is the mod's internal identifier of the trigger, and matches a key to me.triggers.
]]
--! This variable is referenced by these modules: console, 
me.starttrigger = function(trigger)
	
	-- debug check for trigger being defined. We should generalise this, since is happens in a flew different places in the mod. i.e. "badidentifierargument"
	-- maybe also some kind of flood control to stop error messages spamming onupdate.
	
	if (trigger == nil) or (me.triggers[trigger] == nil) then
		
		-- report error
		if mod.out.checktrace("error", me, "trigger") then
			mod.out.printtrace(string.format("There is no trigger |cffffff00%s|r.", trigger or "<nil>"))
		end
		
		return
	end
	
	local triggerdata = me.triggers[trigger]
	triggerdata.isactive = true
	triggerdata.mystarttime = GetTime() + triggerdata.startdelay
	triggerdata.data = 0
	
	-- debug
	if mod.out.checktrace("info", me, "trigger") then
		mod.out.printtrace(string.format("The |cffffff00%s|r trigger has been activated.", trigger))
	end
		
end

--[[
This variable gives the code that runs when an active trigger is checked. The keys are the internal names of triggers, that match keys in <me.triggers>.
The values are functions. The functions should return non-nil if the trigger is to be deactivated.
]]
me.triggerfunctions = 
{
	--[[ 
	We want to find out if we are being targetting by one of the emps. To do this we find the emperors by scanning the targets of everyone in the raid group. Then once we have an emps's target, we check whether that is us.
	It might occur that one emps' target is known but the other is not (not sure if this could happen). In this case the trigger should not end; we should keep checking until we know both targets.
	However, if one of the emps is targetting us, we can instantly give ourself threat and exit.
	The threat gained is set at 2000. This isn't confirmed, and is instead a bit of a guess.
	]]
	twinemps = function(triggerdata)
		
		local x, name, firstbossname, unitid
		local bosshits = 0
		local bosstargets = 0
		
		-- loop through everyone in the raid
		for x = 1, 40 do
			
			unitid = "raid" .. x .. "target"
			if UnitExists(unitid) and (UnitClassification(unitid) == "worldboss") then
				
				-- we've found an emperor. check if we've seen him before
				name = UnitName(unitid)
				
				if name ~= firstbossname then
					bosshits = bosshits + 1
					
					-- if this is the first boss we've seen, put his name up
					if bosshits == 1 then
						firstbossname = name
					end
					
					-- now find the player the boss is targetting
					unitid = unitid .. "target"
					
					if UnitExists(unitid) then
						bosstargets = bosstargets + 1
						
						if UnitIsUnit("player", unitid) then
							-- an emp is targetting us. give us a bit of threat.
							
							mod.combat.event.hits = 1
							mod.combat.event.threat = 2000
							mod.combat.event.damage = 0
							mod.combat.event.rage = 0
							
							mod.combat.addattacktodata(mod.string.get("threatsource", "threatwipe"), mod.combat.event)
							
							-- clear hits for total column
							mod.combat.event.hits = 0
							mod.combat.addattacktodata(mod.string.get("threatsource", "total"), mod.combat.event)
							
							-- if an emperor is targetting us, he will be the only one, and we have all the information we need, so we want the trigger to deactivate
							bosstargets = 2
							bosshits = 2
						end
					end
					
					-- if we have found 2 bosses now, there's no need to do more searching
					if bosshits == 2 then 
						break
					end
				end
			end
		end
		
		-- don't give up on the trigger until we have found both boss targets on one loop
		if bosstargets == 2 then
			return true
		end
	end,
	
	--[[
	Autotarget trigger runs when you run the command "/ktm boss autoatarget". When you next target a world boss, you will set the target and clear the meter.
	]]
	autotarget = function(triggerdata)
		
		if UnitExists("target") and (UnitClassification("target") == "worldboss") then
			
			-- found a target. now only activate if we've been targetting him for a while
			if triggerdata.data == 0 then
				triggerdata.data = GetTime()
				return
				
			else
				-- 500 ms minimum.
				if GetTime() < triggerdata.data + 0.5 then
					return
				end
			end
			
			-- found a target. Activate
			if mod.target.mastertarget == UnitName("target") then
				
				-- someone has already set the master target to this mob. In this case don't do anything.
				mod.out.print(string.format(mod.string.get("print", "boss", "autotargetabort"), UnitName("target")))
				
			else
				mod.net.clearraidthreat()
				mod.net.sendmastertarget()
			end
			
			return true
		end	
		
	end
}

--[[
me.checktriggers()
Loops through all possible triggers, checking for active ones and running them if need be. This is called in the OnUpdate() method.
]]
me.checktriggers = function()

	local key, data
	local timenow = GetTime()
	
	for key, data in me.triggers do
		
		-- ignore inactive triggers
		if data.isactive == true then
			
			-- stop the trigger if it has timed out
			if timenow > data.mystarttime + data.timeout then
				
				data.isactive = false
				
				-- debug
				if mod.out.checktrace("warning", me, "trigger") then
					mod.out.printtrace(string.format("The trigger |cffffff00%s|r timed out.", key))
				end
				
			-- don't process the trigger if the start delay is not over
			elseif timenow < data.mystarttime then
				-- (do nothing)
				
			else
				-- ok, run a trigger check
				if me.triggerfunctions[key](data) then
					data.isactive = false
				end
			end
		end
	end
end

--[[
------------------------------------------------------------------------------------------------
			Parsing the Combat Log to Detect Boss Special Attacks and Spells
------------------------------------------------------------------------------------------------
]]

-- me.parserset = { }  -- defined in me.createparser

--[[
me.createparser()
Called from me.onload() on startup. Creates the parser engine from the constructor.
]]
me.createparser = function()
	
	me.parserset = { }
	
	local parserdata
	
	for _, parserdata in me.parserconstructor do
		mod.regex.addparsestring(me.parserset, parserdata[1], parserdata[2], parserdata[3])
	end
	
end

-- This describes all the combat log lines we are checking for
me.parserconstructor = 
{
	-- this is for school spells or debuffs
	{"magicresist", "SPELLRESISTOTHERSELF", "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE"}, -- "%s's %s was resisted."

	-- these two are for school spells only
	{"spellhit", "SPELLLOGSCHOOLOTHERSELF", "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE"}, -- "%s's %s hits you for %d %s damage."
	{"spellhit", "SPELLLOGCRITSCHOOLOTHERSELF", "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE"}, -- "%s's %s crits you for %d %s damage."

	-- spellboth is for abilities or school spells
	{"attackabsorb", "SPELLLOGABSORBOTHERSELF", "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE"}, -- "You absorb %s's %s."
		
	-- ability hit / miss only works for physical spells.
	{"abilityhit", "SPELLLOGOTHERSELF", "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE"}, 		-- "%s's %s hits you for %d."
	{"abilityhit", "SPELLLOGCRITOTHERSELF", "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE"},	-- "%s's %s hits you for %d."
	{"abilityhit", "SPELLBLOCKEDOTHERSELF", "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE"}, 	-- "%s's %s was blocked."
	{"abilitymiss", "SPELLDODGEDOTHERSELF", "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE"},	-- "%s's %s was dodged."
	{"abilitymiss", "SPELLPARRIEDOTHERSELF", "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE"},	-- "%s's %s was parried."
	{"abilitymiss", "SPELLMISSOTHERSELF", "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE"},		-- "%s's %s misses you."
	
	{"debuffstart", "AURAADDEDSELFHARMFUL", "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE"}, -- "You are afflicated by %s."
	{"debufftick", "AURAAPPLICATIONADDEDSELFHARMFUL", "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE"}, -- "You are afflicted by %s (%d)."
	{"mobspellcast", "SPELLCASTGOOTHER", "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE"},		-- "%s casts %s."
	{"mobbuffgain", "AURAADDEDOTHERHELPFUL", "CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS"}, 		-- "%s gains %s."
	
	{"mobdeath", "UNITDIESOTHER", "CHAT_MSG_COMBAT_HOSTILE_DEATH"}, -- "%s dies."
}

me.tickcounters = { }

--[[
me.parsebossattack(message, event)

Handles a combat log line that describes a boss's attack or spell against the player.
--> Stage one is to parse the message to find which formatting pattern the message matches, e.g. "magicresist" or
"spellhit" etc, or none (then just exit).
--> Stage two is to fill in <me.action>, whch descibes the important parts of the attack, using the formatting patter and the arguments captured by the pattern.
--> Then we check whether this attack is actually a threat modifying attack. For this to be the case, there would be a localisation string whose value is the attack name, and there would be an entry in <me.bossattacks> with the same key as the localisation key.
--> Next we identify the ability w.r.t. the mob. Does the ability only come from one mob, and if so is the mob who just attacked us the right one? This involves a check in the next level of <me.bossattacks>.
--> Now we know the specific attack performed against us, and we have to work out whether it triggered. If the ability does not trigger on a miss (e.g. Knock Away), we won't do anything. If the ability only triggers after a number of ticks (Time Lapse), it will only trigger if the correct number of ticks has passed.
--> If it triggers, we just change our threat by the right amount, then report the threat change in the <combat> and <table> modules.

<message> is the combat log line.
<event> is the chat message event <message> was received on.
Returns: nothing.
]]
me.parsebossattack = function(message, event)
	
	-- stage 1: regex
	local output = mod.regex.parse(me.parserset, message, event)
	
	if output.hit == nil then
		return
	end

	-- interrupt: wrath of ragnaros
	if output.final[2] == mod.string.get("boss", "spell", "wrathofragnaros") then

		-- notify the raid, if this event isn't on cooldown 
		if GetTime() < me.bossevents.wrathofragnaros.lastoccurence + me.bossevents.wrathofragnaros.cooldown then
			-- on cooldown. don't send
		else
			mod.net.sendevent("wrathofragnaros")
		end
	end
 
	-- Set the mob and ability (always arg1 and arg2, except for debuffgain)
	if output.parser.identifier == "debuffstart" or output.parser.identifier == "debufftick" then
		me.resetaction("", output.final[1])
	else	
		me.resetaction(output.final[1], output.final[2])
	end
	
	-- set the spell and hit types
	local description = me.attackdescription[output.parser.identifier]

	if description.ishit then me.action.ishit = true end
	if description.isspell then me.action.isspell = true end
	if description.isdebuff then me.action.isdebuff = true end
	if description.isphysical then me.action.isphysical = true end
	
	-- find a spellid, if it exists
	local spellid = mod.string.unlocalise("boss", "spell", me.action.ability)
	
	-- interrupt: four horsemen marks
	if spellid == "mark1" or spellid == "mark2" or spellid == "mark3" or spellid == "mark4" then
		-- notify the raid, if this event isn't on cooldown 
		if GetTime() < me.bossevents.fourhorsemenmark.lastoccurence + me.bossevents.fourhorsemenmark.cooldown then
			-- on cooldown. don't send
		else
			mod.net.sendevent("fourhorsemenmark")
		end
		
		return
	end
	
	-- check whether this spellid has special behaviour associated with it
	if (spellid == nil) or (me.bossattacks[spellid] == nil) then
		return
	end
	
	-- Check for a mob match
	local spelldata
	
	local mobid = mod.string.unlocalise("boss", "name", me.action.mobname)
	
	if mobid and me.bossattacks[spellid][mobid] then
		-- there is a specific version of this spell for this particular mob
		spelldata = me.bossattacks[spellid][mobid]
	
	elseif me.bossattacks[spellid].default == nil then
		-- this mob does not match any of the mobs that have the ability
		return
		
	else
		spelldata = me.bossattacks[spellid].default
	end
	
	-- Now process the spell
	
	-- 1) Does the ability activate on a miss?
	if (me.action.ishit == false) and (spelldata.effectonmiss == false) then
		
		-- ability will not activate
		if mod.out.checktrace("info", me, "attack") then
			mod.out.printtrace(string.format("%s's attack %s did not activate because it missed.", me.action.mobname, me.action.ability))
		end
		
		-- spell reporting
		if me.isspellreportingactive == true then
			mod.net.reportspelleffect(me.action.ability, me.action.mobname, "miss")
		end
		
		return
	end
	
	-- 2) Check number of ticks
	local mytickdata
	
	if spelldata.ticks ~= 1 then
		
		-- create a list if none exists yet
		if me.tickcounters[me.action.ability] == nil then
			me.tickcounters[me.action.ability] = { }
		end
		
		if me.tickcounters[me.action.ability][me.action.mobname] == nil then
			me.tickcounters[me.action.ability][me.action.mobname] = 0
		end
		
		-- create an entry if none exists so far
		me.tickcounters[me.action.ability][me.action.mobname] = me.tickcounters[me.action.ability][me.action.mobname] + 1
		
		-- now, have we gone enough ticks?	
		if me.tickcounters[me.action.ability][me.action.mobname] < spelldata.ticks then
			
			-- not enough ticks
			if mod.out.checktrace("info", me, "attack") then
				mod.out.printtrace(string.format("This is tick number %d of %s; it will activate in another %d ticks.", me.tickcounters[me.action.ability][me.action.mobname], me.action.ability, spelldata.ticks - me.tickcounters[me.action.ability][me.action.mobname]))
			end
			
			-- spell reporting
			local value1 = me.tickcounters[me.action.ability][me.action.mobname]
			local value2 = spelldata.ticks - value1
			
			if me.isspellreportingactive then
				mod.net.reportspelleffect(me.action.ability, me.action.mobname, "tick", value1, value2)
			end
			
			return
			
		else
			-- we just got enough ticks, so now reset to 0
			me.tickcounters[me.action.ability][me.action.mobname] = 0
			
		end
	end
	
	-- 3) To get here, the ability is definitely activating
	if mod.out.checktrace("info", me, "attack") then
		mod.out.printtrace(string.format("%s's %s activates, multiplying your threat by %s then adding %s.", me.action.mobname, me.action.ability, spelldata.multiplier, spelldata.addition))
	end
	
	-- compute new threat
	local newthreat = mod.table.getraidthreat() * spelldata.multiplier + spelldata.addition
	
	-- remember threat can't go below 0
	newthreat = math.max(0, newthreat)
	
	-- threat change is the (possibly negative) amount of threat that was added
	local threatchange = newthreat - mod.table.getraidthreat()
	
	-- spellreporting
	if me.isspellreportingactive then
		mod.net.reportspelleffect(me.action.ability, me.action.mobname, "proc", math.floor(0.5 + mod.table.getraidthreat()), math.floor(0.5 + newthreat))
	end
	
	-- add to threat wipes section, but not to totals
	mod.combat.event.hits = 1
	mod.combat.event.damage = 0
	mod.combat.event.rage = 0
	mod.combat.event.threat = threatchange
	
	mod.combat.addattacktodata(mod.string.get("threatsource", "threatwipe"), mod.combat.event)
	
	-- now add it to your raid threat total (but not your personal threat total)
	mod.table.raidthreatoffset = mod.table.raidthreatoffset + threatchange
	
	-- ask for a redraw of the personal window
	KLHTM_RequestRedraw("self")
	
end

--[[
me.resetaction()
Sets the values of me.action to their defaults.
]]
me.resetaction = function(mobname, ability)

	me.action.mobname = mobname
	me.action.ability = ability
	me.action.ishit = false
	me.action.isphysical = false
	me.action.isdebuff = false
	me.action.isspell = false
	
end

me.action = 
{
	mobname = "",
	ability = "",
	ishit = false,
	isphysical = false,
	isdebuff = false,
	isspell = false,
}

-- Note that <ishit> defaults to false, so we only set it when it is true
me.attackdescription = 
{
	["magicresist"] = 
	{
		isspell = true,
		isdebuff = true,
	},
	["spellhit"] =
	{
		isspell = true,
		ishit = true,
	},
	["attackabsorb"] = 
	{
		isspell = true,
		isphysical = true,
		ishit = true,
	},
	["abilityhit"] = 
	{
		isphysical = true,
		ishit = true,
	},
	["abilitymiss"] = 
	{	
		isphysical = true,
	},
	["debuffstart"] = 
	{
		ishit = true,
		isdebuff = true,
	},
	["debufftick"] = 
	{
		ishit = true,
		isdebuff = true,
	},
}

--[[
Here is where you define all the boss' attacks that affect threat.
	The first key in me.bossattacks is the identifier of the spell. That is, mod.string.get("boss", "spell", <first key>) 
is the localised version.
	The second key deep specifies which mob the attack comes from. You can choose "default" to make it apply to all mobs,
or you can specify a mob id, which will override the "default" value. Mob id's recognised are all the keys in the 
"boss" -> "name" section of the localisation tree.
	So if you want to define a new attack name or boss name, you'll have to add a new key to the localisation tree in the
"boss" -> "spell" and "boss" -> "name" sections respectively.
	Inside each block, the follow parameters are defined:
	<multiplier> - a value that your threat is multiplier by. e.g. the standard Knock Away is -50% threat, so this would be a 
multiplier of 0.5. A complete threat wipe would be a multiplier of 0.
	<addition> - a flat value that is added to your threat. Can be positive or negative or 0.
	<effectonmiss> - a boolean value specifying whether the event triggers even when it is resisted or misses you.
	<ticks> - the number of times you must suffer the attack before your threat is changed. e.g. most knockbacks happen every
time so <ticks> = 1, but Time Lapse reduces your threat only after a certain number of applications.
	<type> - describes the attack. Can be "physical" or "spell" or "debuff". Not used by the mod at the moment: it will 
assume that if the name matches, it has found the right ability.
]]
--! This variable is referenced by these modules: net, netin, 
me.bossattacks = 
{
	knockaway = 
	{
		default = 
		{
			multiplier = 0.5,
			addition = 0,
			effectonmiss = false,
			ticks = 1,
			type = "physical",
		},
		onyxia = 
		{
			multiplier = 0.67,
			addition = 0,
			effectonmiss = false,
			ticks = 1,
			type = "physical",
		},
	},
	wingbuffet = 
	{
		default = 
		{
			multiplier = 0.5,
			addition = 0,
			effectonmiss = false,
			ticks = 1,
			type = "physical",
		},
		onyxia = 
		{
			multiplier = 1.0,
			addition = 0,
			effectonmiss = false,
			ticks = 1,
			type = "physical",
		},
	},
	timelapse = 
	{
		default = 
		{
			multiplier = 1.0,
			addition = 0,
			effectonmiss = false,
			ticks = 5,
			type = "debuff"
		}
	},
	hatefulstrike = 
	{
		default = 
		{
			multiplier = 1.0,
			addition = 1000,
			effectonmiss = false,
			ticks = 1,
			type = "physical"
		}
	},
	sandblast = 
	{
		default = 
		{
			multiplier = 0,
			addition = 0,
			effectonmiss = false,
			ticks = 1,
			type = "spell"
		}
	},
}
