------------------------------------------------------------------------------------------------------------
-- ################### DATA ####################### --
------------------------------------------------------------------------------------------------------------

DoTimer_Settings = {} --table for user-defined settings
DoTimer_DebugChannel = nil --for debugging purposes
local version = "1.1.5.2" --for the help command
local date_uploaded = "November 28, 2016" --for the help command
local Old_CSBN,Old_CS,Old_UA,loaded,class,preventingimmol --random variables i use
local lasttarget = {} --a table holding data for my last target
local casted = {} --governs the currently casted debuffs.  entries are 1-10 targets, which in turn are 1-20 debuffs and the target name
local finalspell = {} --a final table for a spell.  created when the debuff most likely lands on the target, lasts until the icon for that debuff appears
local castpetspell = {} --the table for pet spellcasts
local sentpetspell = {} --table for pet spells, to catch resists/whatever
local finalpetspell = {} --another for pet spells, to await the icon
local finalenslavespell = {} --table for player spells, where we wait for the icon of the debuff
local petresistmsg = string.gsub(SPELLRESISTOTHEROTHER,"%%.-s","(.+)") --the chat message sent when a pet spell is resisted 
local petevademsg = string.gsub(SPELLEVADEDOTHEROTHER,"%%.-s","(.+)") --the chat message sent when a pet spell is evaded
local petimmunemsg = string.gsub(SPELLIMMUNEOTHEROTHER,"%%.-s","(.+)") --the chat message sent when something is immune to pet's spell
local petreflectmsg = string.gsub(SPELLREFLECTOTHEROTHER,"%%.-s","(.+)") --the chat message sent when your pet's spell is reflected back to your pet
local spellhitmsg = string.gsub(string.gsub(SPELLLOGSCHOOLSELFOTHER,"%%.-d","%%d+"),"%%.-s","(.+)") --the chat message sent when your spell hits for some amount
local spellcritmsg = string.gsub(string.gsub(SPELLLOGCRITSCHOOLSELFOTHER,"%%d","%%d+"),"%%.-s","(.+)") --same but for crits
local diesmsg = string.gsub(UNITDIESOTHER,"%%.-s","(.+)") --the chat message sent when something dies
local fadesmsg = string.gsub(AURAREMOVEDOTHER,"%%.-s","(.+)") --the chat message sent when a debuff fades from something
local begincastmsg = string.gsub(SPELLCASTOTHERSTART,"%%.-s","(.+)") --in the pet msg for your pet beginning to cast a spell (seduction)
local slainmsg = string.gsub(SELFKILLOTHER,"%%.-s","(.+)") --when you had the killing blow for a death
local spells,petspells,healspells,enslavespells = {},{},{},{} --spells are offensive duration spells, petspells are pet duration spells,  healspells are friendly duration spells, and enslavespells are enslaving demon spells
local COLOR_RED = {r = 1.0, g = .2, b = .2} -- at 5 seconds
local COLOR_WHITE = {r = 1.0, g = 1.0, b = 1.0} -- normal for timers
local COLOR_GREEN = {r = .2, g = 1.0, b = .2} -- normal for bars
local COLOR_PURPLE = {r = 1.0, g = .2, b = 1.0} -- ghost
local COLOR_YELLOW = {r = 1.0, g = 1.0, b = .2} -- halfway progress for bars
local DEP_SCALE = .9 -- amt. dep. timers are shrunk
local GHOST_ALPHA = .5 --amt. ghost timers are dimmed

------------------------------------------------------------------------------------------------------------
-- ################ LOCALIZATION ################### --
------------------------------------------------------------------------------------------------------------

function DoTimer_ReturnEnglish(spellname) --returns the english name of the spell
--	DoTimer_Debug("DoTimer_ReturnEnglish")
	local tables = {BOOKTYPE_SPELL,BOOKTYPE_PET}
	local english,texture
	for index,value in ipairs(tables) do
		
		local i = 1
		while GetSpellName(i,value) do
			local spell = GetSpellName(i,value)
	--		DoTimer_Debug("DoTimer_ReturnEnglish"..spell)
			if spell == spellname then 
				texture = GetSpellTexture(i,value)
				--DoTimer_Debug("DoTimer_ReturnEnglishSPELL "..spell)
				--DoTimer_Debug("DoTimer_ReturnEnglishTEXTURE "..texture)
				break
			end
			i = i + 1
		end
	end
	if texture and DoTimer_SpellData[class] and DoTimer_SpellData[class][texture] then
	--	DoTimer_Debug("DoTimer_ReturnEnglish 3")
		return DoTimer_SpellData[class][texture].name 
	end
	--DoTimer_Debug("DoTimer_ReturnEnglish- unknown")
	return "unknown"
end

function DoTimer_ToLocale(spellname) -- returns the localized name of the english spell
--	DoTimer_Debug("DoTimer_ToLocale")
	for index,value in pairs(DoTimer_SpellData[class]) do
		if value.name == spellname then
			local i = 1
			while GetSpellName(i,BOOKTYPE_SPELL) do
				local texture = GetSpellTexture(i,BOOKTYPE_SPELL)
				if texture == index then
					local spell = GetSpellName(i,BOOKTYPE_SPELL)
					return spell
				end
				i = i + 1
			end
		end
	end
	return "unknown"
end

------------------------------------------------------------------------------------------------------------
-- ############## BASIC FUNCTIONS ################### --
------------------------------------------------------------------------------------------------------------
	
function DoTimer_OnLoad()
	this:RegisterEvent("PLAYER_ENTERING_WORLD")
	this:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	this:RegisterEvent("PLAYER_DEAD")
	this:RegisterEvent("PLAYER_REGEN_ENABLED")
	this:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER")
	this:RegisterEvent("CHAT_MSG_SPELL_PET_DAMAGE")
	this:RegisterEvent("PLAYER_TARGET_CHANGED")
	this:RegisterEvent("PET_BAR_UPDATE_COOLDOWN")
	this:RegisterEvent("UNIT_PET")
	SpellSystem_RegisterEvent(this,"SPELLSYSTEM_SUCCESS")
	SpellSystem_RegisterEvent(this,"SPELLSYSTEM_FAILAFTER")
	SpellSystem_RegisterEvent(this,"SPELLSYSTEM_STOP")
	SLASH_DOTIMER1 = "/dotimer" --creating the slash command
	SLASH_DOTIMER2 = "/dot" --and the other one, for those who are lazy
	SlashCmdList["DOTIMER"] = DoTimer_Commands
	if DEFAULT_CHAT_FRAME then DEFAULT_CHAT_FRAME:AddMessage(DOTIMER_LOADED) end  --a little PR never hurts ^^
end

function DoTimer_OnEvent(event)
	if event == "PLAYER_ENTERING_WORLD" and not loaded then DoTimer_Startup() -- when you first log in
	elseif event == "PLAYER_TARGET_CHANGED" then DoTimer_ChangedTargets() --time to make the last target's timers eligible for depreciation
	elseif event == "PET_BAR_UPDATE_COOLDOWN" then DoTimer_PotentialSpellLock()
	elseif event == "CHAT_MSG_COMBAT_HOSTILE_DEATH" then DoTimer_HostileDeath() --deletion of entries based on death: if target died, remove his entries, else: if it was a player, remove entries, else leave alone.  mob entries will be removed on exit combat
	elseif event == "PLAYER_DEAD" then DoTimer_PlayerDeath() --deleting entries because player died
	elseif event == "CHAT_MSG_SPELL_PET_DAMAGE" then DoTimer_PotentialSeduction() --for the succubus auto-casting seduce; it does not go through the normal function
	elseif event == "UNIT_PET" and arg1 == "player" then DoTimer_UpdatePet()
	elseif event == "PLAYER_REGEN_ENABLED" then DoTimer_LeftCombat()--deleting mob tables b/c left combat
	elseif event == "CHAT_MSG_SPELL_AURA_GONE_OTHER" then DoTimer_DebuffFade() --checking for debuff fades
	elseif event == "SPELLSYSTEM_SUCCESS" then DoTimer_PotentialSpellTimer()
	elseif event == "SPELLSYSTEM_STOP" then DoTimer_PotentialHealTimer()
	elseif event == "SPELLSYSTEM_FAILAFTER" then DoTimer_CheckConflag()
	end
end

function DoTimer_AddText(msg) --basic output function
	if DEFAULT_CHAT_FRAME then DEFAULT_CHAT_FRAME:AddMessage(msg) end
end

function DoTimer_AddMenuText(msg,fromgui) -- will output a msg if the text menu was accessed; not the GUI menu
	if not fromgui then DoTimer_AddText(msg) end
end

function DoTimer_Debug(msg) --makes a debug msg if i have that turned on
	if DoTimer_DebugChannel then
		if DoTimer_DebugChannel ~= "" and getglobal("ChatFrame"..DoTimer_DebugChannel) then getglobal("ChatFrame"..DoTimer_DebugChannel):AddMessage(msg)
		else DoTimer_AddText(msg)
		end
	end
end

------------------------------------------------------------------------------------------------------------
-- ############ TIMER REMOVAL FUNCTIONS ############## --
------------------------------------------------------------------------------------------------------------

function DoTimer_OnUpdate() --updating the timers onscreen, as well as checking for any finished debuffs
	if table.getn(casted) == 0 then DoTimerFrame:SetScript("OnUpdate",nil) end
	local time = GetTime()
	for index,value in ipairs(casted) do --scanning all the debuffs to see if they are done
		for i = table.getn(casted[index]),1,-1 do
			if (not (casted[index][i].type == "blank" or casted[index][i].type == "ghost")) then
				if time >= casted[index][i].time + casted[index][i].duration then --yep it's done all right
					DoTimer_Debug(casted[index][i].spell.." has expired from the mob; full duration")
					DoTimer_RemoveTimer(index,i,1)
				else
					if DoTimer_Settings.format == "icons" then
						local remaining = tonumber(string.format("%d",math.floor(casted[index][i].duration - time + casted[index][i].time))) --modifying the displayed time if it needs changing
						if (not casted[index][i].displayed) or (remaining < casted[index][i].displayed) then
							getglobal("DoTimerTarget"..index.."Debuff"..i.."DisplayedTime"):SetText(DoTimer_ReturnNewDuration(remaining)) --updating the time if they aren't done
							if remaining == 5 then
								if DoTimer_Settings.playsound then PlaySoundFile("Interface\\Addons\\DoTimer\\Extras\\expalert.wav") end
								if DoTimer_Settings.expalert then 
									getglobal("DoTimerTarget"..index.."Debuff"..i.."DisplayedTexture"):LockHighlight()
									getglobal("DoTimerTarget"..index.."Debuff"..i.."DisplayedTime"):SetTextColor(COLOR_RED.r,COLOR_RED.g,COLOR_RED.b) 
								end
							elseif remaining == 3 then
								if DoTimer_Settings.expalert then getglobal("DoTimerTarget"..index.."Debuff"..i.."DisplayedTexture"):UnlockHighlight() end
							end
							casted[index][i].displayed = remaining
						end
					else
						local remaining = casted[index][i].duration - time + casted[index][i].time
						getglobal("DoTimerTarget"..index.."Debuff"..i.."DisplayedStatusBar"):SetValue(remaining)
						local otherremaining = tonumber(string.format("%d",math.floor(remaining))) --modifying the displayed time if it needs changing
						if (not casted[index][i].displayed) or (otherremaining < casted[index][i].displayed) then
							getglobal("DoTimerTarget"..index.."Debuff"..i.."DisplayedStatusBarText"):SetText(DoTimer_ReturnNewDuration(otherremaining).." - "..casted[index][i].spell) --updating the time if they aren't done
							if otherremaining == 5 then
								if DoTimer_Settings.playsound then PlaySoundFile("Interface\\Addons\\DoTimer\\Extras\\expalert.wav") end
								if DoTimer_Settings.expalert then getglobal("DoTimerTarget"..index.."Debuff"..i.."DisplayedStatusBar"):SetStatusBarColor(COLOR_RED.r,COLOR_RED.g,COLOR_RED.b) end
							elseif (otherremaining > 5) and (otherremaining == math.floor(casted[index][i].duration / 2)) then
								getglobal("DoTimerTarget"..index.."Debuff"..i.."DisplayedStatusBar"):SetStatusBarColor(COLOR_YELLOW.r,COLOR_YELLOW.g,COLOR_YELLOW.b)
							end
							casted[index][i].displayed = otherremaining
						end
					end
				end
			end
		end
	end
	DoTimer_ScanDebuffs() --seeing if anything has faded unexpectedly
	DoTimer_ScanBuffs()
end

function DoTimer_ScanDebuffs() --deletes the timers of spells which are no longer on the target
	DoTimer_Debug("DoTimer_ScanDebuffs")
	local unitids = {"target","pettarget"} --making use of both your target and your pet's target
	for index,value in ipairs(unitids) do
		local target,sex,level
		target = UnitName(value)
		sex = UnitSex(value)
		level = UnitLevel(value)
		local found = DoTimer_ReturnTargetTable(target,sex,level)
		if found then
			local debuffs = DoTimer_ListDebuffs(value)
			for i = table.getn(casted[found]),1,-1 do
				local spellname = casted[found][i].spell
				local english = casted[found][i].english
				if GetTime() >= casted[found][i].time + .5 then
					local ontarget
					if english == "Spell Lock" then ontarget = 1 end --we will not delete spell lock
					for ind,val in ipairs(debuffs) do
						if spellname == val then ontarget = 1 end --a debuff found on the mob matches the query
					end
					if not DoTimer_TimerIsAppreciated(found,i) then ontarget = 1 end --we only want to deal with appreciated timers
					if not ontarget then
						local wrongreason -- if a new curse or a refresh, the timer will disappear before the other code adds it.  in this case we want to delete, not depreciate
						local tables = {SpellSystem_IncomingSpell, SpellSystem_SentSpell, finalspell}
						for index,value in ipairs(tables) do
							for id = table.getn(value),1,-1 do
								if (value[id].target == target and value[id].targetsex == sex and value[id].targetlevel == level) and ((value[id].spell == spellname) or string.sub(english,1,5) == "Curse" and string.sub(DoTimer_ReturnEnglish(value[id].spell),1,5) == "Curse") then wrongreason = 1 end
							end
						end
						if not wrongreason then
							local time = GetTime()
							DoTimer_Debug(casted[found][i].spell.." not found on "..UnitName(value).."; depreciating if mob, deleting if not")
							if casted[found].type == "mob" then DoTimer_DepreciateTimer(found,i) else DoTimer_RemoveTimer(found,i,1) end --player timers are removed because they cannot be depreciated
						else
							DoTimer_Debug(casted[found][i].spell.." not found on "..UnitName(value)..", but we expected that")
							DoTimer_RemoveTimer(found,i)
						end
					end
				end
			end
		end
	end
end

function DoTimer_ScanBuffs() --checking buffs to see if any friendly spells need to be removed
	DoTimer_Debug("DoTimer_ScanBuffs")
	local unitids = {
		"target",
		"mouseover",
	}
	local group
	if GetNumRaidMembers() > 0 then group = "Raid"
	elseif GetNumPartyMembers() > 0 then group = "Party"
	end
	if group then
		for i = 1,getglobal("GetNum"..group.."Members")() do
			table.insert(unitids,string.lower(group)..i)
		end
	end
	for index,value in ipairs(unitids) do
		local target,sex,level
		target = UnitName(value)
		sex = UnitSex(value)
		level = UnitLevel(value)
		local found = DoTimer_ReturnTargetTable(target,sex,level)
		if found then
			local buffs = DoTimer_ListDebuffs(value)
			for i = table.getn(casted[found]),1,-1 do
				if GetTime() >= casted[found][i].time + .5 then
					local spellname = casted[found][i].spell
					local ontarget
					if DoTimer_ReturnEnglish(spellname) == "Power Word: Fortitude" then ontarget = 1 end --we will not delete PWF
					for ind,val in ipairs(buffs) do
						if spellname == val then ontarget = 1 end --a buff found on the mob matches the query
					end
					if not (casted[found][i].type == "heal") then ontarget = 1 end --we only want to deal with heal timers
					if not ontarget then
						DoTimer_Debug(casted[found][i].spell.." not found on target, removing it")
						DoTimer_RemoveTimer(found,i,1)
					end
				end
			end
		end
	end
end

function DoTimer_DepreciateTimer(found,i) --depreciated the timer if the target is eligible
	DoTimer_Debug("DoTimer_DepreciateTimer")
	--if casted[found].eligible then DoTimer_AddText("The timers for "..casted[found].target.." are eligible for depreciation.") else DoTimer_AddText("The timers for "..casted[found].target.." are not eligible for depreciation.") end
	if DoTimer_Settings.dep and (casted[found].eligible) and ((casted[found][i].displayed or 2) > 1) then
		casted[found][i].dep = 1
		casted[found][i].depstart = GetTime()
		if DoTimer_Settings.allghost then DoTimer_CreateGhostTimer(found,i) end
		DoTimer_CreateInterface()
	else
		DoTimer_RemoveTimer(found,i,1)
	end
end

function DoTimer_CheckConflag()
--	DoTimer_Debug("DoTimer_CheckConflag")
	if DoTimer_ReturnEnglish(arg1) == "Conflagrate" then
		local found = DoTimer_ReturnTargetTable(arg5.name,arg5.sex,arg5.level)
		if found then
			local removed
			for i = table.getn(casted[found]),1,-1 do --checking that target for immolate
				if DoTimer_ReturnEnglish(casted[found][i].spell) == "Immolate" and DoTimer_TimerIsAppreciated(found,i) then
					DoTimer_Debug(casted[found].target.." had an appreciated immol, removed it")
					DoTimer_RemoveTimer(found,i,1)
					removed = 1
					break
				end
			end
			if not removed then
				local id,cast
				for i = table.getn(casted[found]),1,-1 do
					if DoTimer_ReturnEnglish(casted[found][i].spell) == "Immolate" and (casted[found][i].dep) then
						if casted[found][i].depstart >= (cast or 0) then
							cast = casted[found][i].depstart
							id = i
						end
					end
				end
				if id then 
					DoTimer_Debug(casted[found].target.." had a depreciated immol, removed it")
					DoTimer_RemoveTimer(found,id,1) 
				end
			end
		end
	end
end

function DoTimer_ChangedTargets()
	DoTimer_Debug("DoTimer_CheckConflag")
	local newtarget
	if UnitName("target") then newtarget = {UnitName("target"),UnitSex("target"),UnitLevel("target")} end
	--DoTimer_AddText("flag1") --flag
	--DoTimer_AddText(newtarget)
	--DoTimer_AddText(lasttarget)
	for i = 1,table.getn(casted) do casted[i].eligible = 1 end --all tables are now eligible for depreciated timers
	local found = DoTimer_ReturnTargetTable(lasttarget[1],lasttarget[2],lasttarget[3])
	if newtarget and newtarget[1] == lasttarget[1] and newtarget[2] == lasttarget[2] and newtarget[3] == lasttarget[3] then
		DoTimer_Debug("new target identical to old target")
		--DoTimer_AddText("flag2") --flag
		if found then
			--DoTimer_AddText("flag3") --flag
			DoTimer_Debug("depreciating all appreciated timers for "..casted[found].target)
			for i = table.getn(casted[found]),1,-1 do
				if DoTimer_TimerIsAppreciated(found,i) then DoTimer_DepreciateTimer(found,i) end --if we are switching targets to one that is "identical" to the previous, automatically depreciate since we know they are inaccurate
			end
		end
	end
	if UnitName("target") then lasttarget = {UnitName("target"),UnitSex("target"),UnitLevel("target")} else lasttarget = {} end
	if DoTimer_Settings.onlytarget then 
		DoTimer_Debug("redoing interface to reflect target change")
		DoTimer_CreateInterface() 
	end
end

function DoTimer_HostileDeath()
	DoTimer_Debug(event)
	DoTimer_Debug(arg1)
	local died = SpellSystem_ParseString(arg1,diesmsg) --checking if the dead mob had any tables
	if not died then
		died = SpellSystem_ParseString(arg1,slainmsg)
	end
	if died == UnitName("target") and UnitIsDead("target") then --your target died, we will delete its entries
		DoTimer_Debug("current target died")
		local found = DoTimer_ReturnTargetTable(died,UnitSex("target"),UnitLevel("target"))
		if found then --sure enough, it did!
			DoTimer_Debug("and it had timers; removing appreciated")
			for i = table.getn(casted[found]),1,-1 do 
				if DoTimer_TimerIsAppreciated(found,i) then DoTimer_RemoveTimer(found,i) end 
			end
			--DoTimer_AddText(died.." died and its entries were removed.")
		end
		local tables = {finalspell,SpellSystem_SentSpell,SpellSystem_IncomingSpell}
		for index,value in ipairs(tables) do
			for i = table.getn(value),1,-1 do
				if (value[i].target == UnitName("target") and value[i].targetsex == UnitSex("target") and value[i].targetlevel == UnitLevel("target")) then table.remove(value,i) end --removing pretimers for that target
			end
		end
	else --will ignore if mob, will delete if player
		DoTimer_Debug("mob died, not current target")
		local targettable = DoTimer_ReturnTargetTable(UnitName("target"),UnitSex("target"),UnitLevel("target"))
		for i = table.getn(casted),1,-1 do
			if not (i == targettable) and (casted[i].target == died) and (not (casted[i].type == "mob")) then
				DoTimer_Debug("removing its timers anyway though")
				DoTimer_RemoveTarget(i) --dont bother with appreciated stuff; it has a unique name so it should be removed outright
				break
				--DoTimer_AddText(died.." died and its entries were removed.")
			end
		end
		local tables = {finalspell,SpellSystem_SentSpell,SpellSystem_IncomingSpell}
		for index,value in ipairs(tables) do
			for i = table.getn(value),1,-1 do
				if (value[i].target == died and not (value[i].targettype == "mob")) then table.remove(value,i) end --removing pretimers for that target
			end
		end
	end
end

function DoTimer_PlayerDeath()
	DoTimer_Debug(event)
	DoTimerDeathFrame.time = GetTime()
	DoTimerDeathFrame:SetScript("OnUpdate",function() --we delay the combat check .5 seconds, just to make sure we are really out of combat
		if GetTime() >= this.time + 3 then
			if UnitIsDeadOrGhost("player") then
				DoTimer_Debug("still dead 3 seconds later; removing all timers")
				DoTimer_RemoveAllTimers()
			end
			this:SetScript("OnUpdate",nil)
		end
	end)
end

function DoTimer_LeftCombat()
	DoTimer_Debug("left combat")
	if preventingimmol then 
		preventingimmol = nil
		DoTimer_AddText("Immolate will not be prevented anymore.")
	end
	DoTimerCombatFrame.time = GetTime()
	DoTimerCombatFrame:SetScript("OnUpdate",function() --we delay the combat check .5 seconds, just to make sure we are really out of combat
		if GetTime() >= this.time + .5 then
			if not UnitAffectingCombat("player") then
				DoTimer_Debug("still out of combat .5 seconds later; removing all non-enslave, non-player timers")
				for i = table.getn(casted),1,-1 do
					if not (casted[i].type == "player") then DoTimer_RemoveTarget(i) end
				end
				for i = table.getn(casted),1,-1 do --deleting all tables that are only ghost timers when you leave combat
					for id = 1,table.getn(casted[i]) do
						if not (casted[i][id].type == "ghost") then break end
						if id == table.getn(casted[i]) then DoTimer_RemoveTarget(i) end
					end
				end
			end
			this:SetScript("OnUpdate",nil)
		end
	end)
end

function DoTimer_DebuffFade()
	DoTimer_Debug("DoTimer_DebuffFade")
	local chatspell,chattarget = SpellSystem_ParseString(arg1,fadesmsg)
	--we will delete the timer if 1) the target is our current target, and 2) there are now no occurrences of the debuff on the target
	if DoTimer_intable(chatspell,spells) then --scan target for debuffs; if no more occurrences then we can delete that timer
		DoTimer_Debug(event)
		if arg1 then DoTimer_Debug(arg1) end
		DoTimer_Debug("the spell that faded is a timer spell")
		if chattarget == UnitName("target") and DoT_OwnSpellOnTarget(chatspell) and not DoT_SpellOnTarget(chatspell) then
			local found = DoTimer_ReturnTargetTable(UnitName("target"),UnitSex("target"),UnitLevel("target"))
			if found then
				for i = table.getn(casted[found]),1,-1 do
					if casted[found][i].spell == chatspell and DoTimer_TimerIsAppreciated(found,i) then
						DoTimer_Debug("no more occurrences of the spell, so removing the timer")
						DoTimer_RemoveTimer(found,i,1)
						break
					end
				end
			end
		end
	elseif DoTimer_intable(chatspell,petspells) then --scan pettarget for pet related spells
		DoTimer_Debug(event)
		if arg1 then DoTimer_Debug(arg1) end
		DoTimer_Debug("it was a pet spell")
		if chattarget == UnitName("pettarget") and DoT_OwnSpellOnTarget(chatspell,"pettarget") and not DoT_SpellOnTarget(chatspell,"pettarget") then
			local found = DoTimer_ReturnTargetTable(UnitName("pettarget"),UnitSex("pettarget"),UnitLevel("pettarget"))
			if found then
				for i = table.getn(casted[found]),1,-1 do
					if casted[found][i].spell == chatspell and (not (DoTimer_ReturnEnglish(chatspell) == "Spell Lock")) and DoTimer_TimerIsAppreciated(found,i) then
						DoTimer_Debug("no more occurrences, removing it")
						DoTimer_RemoveTimer(found,i,1)
						break
					end
				end
			end
		end
	end
end

function DoTimer_RemoveTimer(targetindex,debuffindex,unforced) --deletes a timer onscreen from existence
	DoTimer_Debug("DoTimer_RemoveTimer")
	if unforced then 
		DoTimer_Debug("a timer has been removed unforcibly")
		if DoTimer_Settings.allghost and (DoTimer_TimerIsReal(targetindex,debuffindex) or casted[targetindex][debuffindex].dep) then DoTimer_CreateGhostTimer(targetindex,debuffindex) end
	else 
		DoTimer_Debug("a timer has been removed forcibly") 
	end
	table.remove(casted[targetindex],debuffindex)
	if table.getn(casted[targetindex]) == 0 then
		table.remove(casted,targetindex)
	end
	DoTimer_CreateInterface()
end

function DoTimer_RemoveTarget(targetindex)
	DoTimer_Debug("a target table has been removed forcibly")
	table.remove(casted,targetindex)
	DoTimer_CreateInterface()
end

function DoTimer_RemoveAllTimers()
	DoTimer_Debug("the interface has been cleared")
	for i = table.getn(casted),1,-1 do
		table.remove(casted,i)
	end
	DoTimer_CreateInterface()
end

function DoTimer_CheckPreTimers() --checks all my queues to see if anything can be weeded out
	for i = table.getn(finalspell),1,-1 do
		if GetTime() >= finalspell[i].timestart + 3 then 
			DoTimer_Debug("removed "..finalspell[i].spell.." from finalspell; took too long")
			table.remove(finalspell,i) 
		end
	end
	for i = table.getn(finalpetspell),1,-1 do
		if GetTime() >= finalpetspell[i].timestart + 3 then 
			DoTimer_Debug("removing "..finalpetspell[i].spell.." from finalpetspell; took too long")
			table.remove(finalpetspell,i) 
		end
	end
	for i = table.getn(finalenslavespell),1,-1 do
		if GetTime() >= finalenslavespell[i].timestart + 5 then 
			DoTimer_Debug("removing "..finalenslavespell[i].spell.." from finalenslavespell; took too long")
			table.remove(finalenslavespell,i) 
		end
	end
	if table.getn(finalspell) + table.getn(finalpetspell) + table.getn(finalenslavespell) == 0 then DoTimerPreTimerFrame:SetScript("OnUpdate",nil) end
end

function DoTimer_CheckPetFailure()
	local spellname,target --looking for all the random things that would cause a failed timer
	spellname,target = SpellSystem_ParseString(arg1,petresistmsg)
	if not (spellname and target) then
		spellname,target = SpellSystem_ParseString(arg1,petevademsg)
	end
	if not (spellname and target) then
		spellname,target = SpellSystem_ParseString(arg1,petimmunemsg)
	end
	if not (spellname and target) then
		spellname,target = SpellSystem_ParseString(arg1,petreflectmsg)
	end
	if spellname and target then
		DoTimer_Debug(event)
		if arg1 then DoTimer_Debug(arg1) end
		local lasti
		for i = table.getn(sentpetspell),1,-1 do --figuring out the last spell cast that matches this data
			if sentpetspell[i].spell == spellname and sentpetspell[i].target == target then
				lasti = i
				break
			end
		end
		if lasti then 
			DoTimer_Debug(sentpetspell[lasti].spell.." was not successfully applied to mob; removing it")
			table.remove(sentpetspell,lasti) 
			if table.getn(sentpetspell) == 0 then DoTimerPetDelayFrame:SetScript("OnUpdate",nil) end
		end
	end
end

-----------------------------------------------------------------------------------------------------------
-- ########### GENERAL TIMER FUNCTIONS ############### --
-----------------------------------------------------------------------------------------------------------

function DoTimer_ListDebuffs(unit) --creates a table of all the names of the debuffs on the unit
	if not unit then unit = "target" end
	local debuffs = {}
	local i = 1
	while UnitDebuff(unit,i) do
		DoTimerScanningFrame:ClearLines()
		DoTimerScanningFrame:SetUnitDebuff(unit,i)
		local spell = DoTimerScanningFrameTextLeft1:GetText()
		if spell then table.insert(debuffs,spell) end
		i = i + 1
	end
	i = 1
	while UnitBuff(unit,i) do
		DoTimerScanningFrame:ClearLines()
		DoTimerScanningFrame:SetUnitBuff(unit,i)
		local spell = DoTimerScanningFrameTextLeft1:GetText()
		if spell then table.insert(debuffs,spell) end
		i = i + 1
	end
	return debuffs
end

function DoTimer_ReturnTargetTable(target,sex,level) --returns the timer table for the corresponding target/sex/level information
	local found
	for i = 1,table.getn(casted) do
		if casted[i].target == target and casted[i].sex == sex and casted[i].level == level then found = i end
	end
	return found
end

function DoTimer_ReturnTexture(spell) --returns the texture path for the icon of the spell
	local tables = {BOOKTYPE_SPELL,BOOKTYPE_PET}
	for index,value in ipairs(tables) do
		local i = 1
		while GetSpellName(i,value) do
			local spellname = GetSpellName(i,value)
			if spell == spellname then 
				return GetSpellTexture(i,value)
			end
			i = i + 1
		end
	end
	return GetSpellTexture(1,BOOKTYPE_SPELL)
end

function DoTimer_CreateSpellTimer(spelltable) --creates a timer onscreen from nothingness
	DoTimer_Debug("DoTimer_CreateSpellTimer")
	DoTimer_Debug("processing timer for "..spelltable.spell.." on "..spelltable.target)
	--DoTimer_AddText(spell.." has been successfully cast on "..target..".")
	local list = {spell = spelltable.spell, rank = spelltable.rank, texture = spelltable.texture, duration = spelltable.duration, time = GetTime(), type = spelltable.timertype, english = spelltable.english} --the table that governs debuff data
	local found = DoTimer_ReturnTargetTable(spelltable.target,spelltable.targetsex,spelltable.targetlevel)
	--DEFAULT_CHAT_FRAME:AddMessage("number of tables: "..table.getn(casted))
	if not found then
		DoTimer_Debug("creating new target table")
		if table.getn(casted) == DoTimer_Settings.maxtargets then --deleting tables if over the  limit
			DoTimer_Debug("reached max targets; deleting one")
			table.remove(casted,1)
		end
		local newtableentry = {target = spelltable.target, type = spelltable.targettype, sex = spelltable.targetsex, level = spelltable.targetlevel} --making the new table for a new target
		table.insert(casted,newtableentry)
		found = table.getn(casted) 
	else
	end
	casted[found].type = spelltable.targettype -- in case it has been changed, like for enslave demon (mob -> player)
	--DEFAULT_CHAT_FRAME:AddMessage("table for this target: "..found)
	--DEFAULT_CHAT_FRAME:AddMessage("number of entries in this table: "..table.getn(casted[found]))
	local spelltype
	if string.sub(spelltable.spell,1,5) == "Curse" then spelltype = 1 end
	if not (spelltable.timertype == "ghost" or spelltable.timertype == "fake") then
		for i = table.getn(casted[found]),1,-1 do --testing if any other spells need to be deleted: other curses, or other spells w/ same name (as in, user is refreshing a DoT)
			if ((casted[found][i].spell == spelltable.spell and not (casted[found].target == "Unknown")) or (string.sub(casted[found][i].spell,1,5) == "Curse" and spelltype)) and DoTimer_TimerIsReal(found,i) then
				--DEFAULT_CHAT_FRAME:AddMessage(casted[found][i].spell.." has been removed from "..target)
				table.remove(casted[found],i)
				DoTimer_Debug("removing a duplicate timer, or a different curse")
			end
		end
	end
	if table.getn(casted[found]) == DoTimer_Settings.maxdebuffs then --deleting any extra debuffs on target
		DoTimer_Debug("reached max debuffs; deleting one")
		local ofound
		for i = 1,table.getn(casted[found]) do
			if casted[found][i].dep then
				table.remove(casted[found],i)
				ofound = 1
				break
			end
		end
		if not ofound then table.remove(casted[found],1) end
	end
	if spelltable.timertype == "ghost" or DoTimer_Settings.allghost then
		for i = table.getn(casted[found]),1,-1 do
			if casted[found][i].type == "ghost" and casted[found][i].spell == spelltable.spell then
				if (not DoTimer_Settings.conflag) or (not (DoTimer_ReturnEnglish(spelltable.spell) == "Immolate")) or (not (DoTimer_ReturnEnglish(spelltable.spell) == "Rejuvenation")) or (spelltable.timertype == "ghost") then
					DoTimer_Debug("removing a ghost timer")
					table.remove(casted[found],i)
				end
			end
		end
	end
	table.insert(casted[found],list) --adding the new debuff entry
	if DoTimer_Settings.conflag and DoTimer_Settings.allghost and (DoTimer_ReturnEnglish(spelltable.spell) == "Immolate" or DoTimer_ReturnEnglish(spelltable.spell) == "Rejuvenation") and (not (spelltable.timertype == "ghost")) then DoTimer_CreateGhostTimer(found,table.getn(casted[found])) end
	DoTimer_CreateInterface() --draws the interface based on the variable command given, found = table that the debuff is going to
end

function DoTimer_PotentialSpellTimer()
	if arg3.type == "spell" then
		if DoTimer_intable(arg1,spells) then
			DoTimer_Debug("spell success: "..arg1)
			local finalspellentry = {
				spell = arg1, rank = arg2, target = arg5.name, timestart = GetTime(), targetsex = arg5.sex, targetlevel = arg5.level, texture = arg4, duration = DoTimer_ReturnDuration(arg1,arg2), targettype = arg5.type, timertype = "debuff", english = DoTimer_ReturnEnglish(arg1)
			}
			table.insert(finalspell,finalspellentry)
			if table.getn(finalspell) == 1 then 
			DoTimer_Debug("spell success 2: "..arg1)
				DoTimerPreTimerFrame:SetScript("OnUpdate",function() DoTimer_CheckPreTimers() end)
				DoTimerIconFrame:SetScript("OnUpdate",function() DoTimer_AwaitIcon() end) 
			end
		elseif DoTimer_intable(arg1,enslavespells) then
			DoTimer_Debug("enslave success: "..arg1)
			local finalenslavespellentry = {
				spell = arg1, rank = arg2, timestart = GetTime(), texture = arg4, duration = DoTimer_ReturnDuration(arg1,arg2), timertype = "enslave", english = DoTimer_ReturnEnglish(arg1)
			}
			table.insert(finalenslavespell,finalenslavespellentry)
			if table.getn(finalenslavespell) == 1 then DoTimerPreTimerFrame:SetScript("OnUpdate",function() DoTimer_CheckPreTimers() end) end
		end
		DoTimer_CheckConflag()
	end
end

function DoTimer_PotentialHealTimer()
	if DoTimer_intable(arg1,healspells) then
		DoTimer_Debug("heal success: "..arg1)
		local finishedheal = {
			spell = arg1, rank = arg2, target = arg5.name, targetsex = arg5.sex, targetlevel = arg5.level, texture = arg4, duration = DoTimer_ReturnDuration(arg1,arg2), targettype = arg5.type, timertype = "heal", english = english
		}
		DoTimer_CreateSpellTimer(finishedheal)
	end
end

function DoTimer_TimerIsAppreciated(targetindex,debuffindex) --will return true if the debuff is not depreciated, a ghost timer, a simulated timer, or a beneficial timer, or enslave
	--if (not casted[targetindex][debuffindex].dep) and (not casted[targetindex][debuffindex].ghost) and (not casted[targetindex][debuffindex].fake) and (not casted[targetindex][debuffindex].heal) then return true end
	local type = casted[targetindex][debuffindex].type
	if (not casted[targetindex][debuffindex].dep) and (type == "debuff" or type == "pet") then return true end
	return false
end

function DoTimer_TimerIsReal(targetindex,debuffindex) --will return true if not dep. and either a debuff/pet/heal/enslave timer (no ghost or fake)
	local type = casted[targetindex][debuffindex].type
	if (not casted[targetindex][debuffindex].dep) and (type == "debuff" or type == "heal" or type == "pet" or type == "enslave") then return true end
	return false
end

function DoTimer_intable(query,checkedtable) --checks a spell to see if it needs to be watched (as in, it was in that big spell list at the top)
	return checkedtable[DoTimer_ReturnEnglish(query)] --used to be longer, but code changes made it simpler.  dont feel like replacing it in the code, so it's here to stay
end

function DoTimer_ReturnDuration(spell,rank) --returns the duration of a spell
	local tables = {BOOKTYPE_SPELL,BOOKTYPE_PET}
--	DoTimer_AddText("DoTimer_ReturnDuration")
	for index,value in ipairs(tables) do
		local i = 1
		while GetSpellName(i,value) do
			local spellname,spellrank = GetSpellName(i,value)
			if spell == "Taunt" then
				return 3 -- had to hard code since the Taunt tooltip doesn't contain it's duration //Reaper fixed Kvital -- Otwo
			elseif spell == "Growl" then
				return 3 -- had to hard code since the Growl tooltip doesn't contain it's duration //Kvital --- Otwo	
			elseif spellname == spell and ((spellrank == rank) or (rank == "") or (value == BOOKTYPE_PET)) then
				DoTimerScanningFrame:ClearLines()
				DoTimerScanningFrame:SetSpell(i,value)
				local num = DoTimerScanningFrame:NumLines()
				local text = getglobal("DoTimerScanningFrameTextLeft"..num):GetText()
				local allnumbers = {SpellSystem_ParseString(text,"(%d[%d%.]*)")}
				if allnumbers[1] == false then allnumbers[1] = basenumber end
				local basenumber = DoTimer_SpellData[class][DoTimer_ReturnTexture(spell)].duration
				local multiplier = DoTimer_SpellData[class][DoTimer_ReturnTexture(spell)].multiplier
				if allnumbers[1] == false then allnumbers[1] = basenumber end
				local truenumber
				for index2,value2 in ipairs(allnumbers) do
					if ((not truenumber) or (math.abs(value2 - basenumber) < math.abs(truenumber - basenumber))) then truenumber = value2 end
				end
	--			DoTimer_AddText(truenumber)
	--			DoTimer_AddText(multiplier)
				return truenumber * multiplier
			end
			i = i + 1
		end
	end
	return 0
end

------------------------------------------------------------------------------------------------------------
-- ################ FUNCTION HOOKS ################# --
------------------------------------------------------------------------------------------------------------

Old_CSBN = CastSpellByName
function DoTimer_CSBN(cspell,onself) 
	local spellname,spellrank
	spellrank = SpellSystem_ParseString(cspell,"%((.-)%)",-1)
	if spellrank then
		spellname = string.gsub(cspell,"%("..spellrank.."%)$","")
	else
		spellname = cspell
		spellrank = ""
	end
	local spelltype = SpellSystem_ReturnSpellType(spellname)
	if spellrank == "" then spellrank = DoTimer_ReturnRank(spellname) end
	if (not spelltype) or (not DoTimer_Settings.manacheck) or (DoTimer_EnoughMana(spellname,spellrank)) then Old_CSBN(cspell,onself) end
end
CastSpellByName = DoTimer_CSBN

Old_CS = CastSpell
function DoTimer_CS(cspell,booktype) 
	local spellname,spellrank = GetSpellName(cspell,booktype)
	local spelltype
	if not (booktype == BOOKTYPE_PET) then spelltype = true end
	if (not spelltype) or (not DoTimer_Settings.manacheck) or (DoTimer_EnoughMana(spellname,spellrank)) then Old_CS(cspell,booktype) end
end
CastSpell = DoTimer_CS

Old_UA = UseAction
function DoTimer_UA(cspell,cursor,onself) 
	local spellname,spellrank = SpellSystem_SetAction(cspell)
	if (GetActionCount(cspell) > 0) or (GetActionText(cspell)) or (not DoTimer_Settings.manacheck) or (DoTimer_EnoughMana(spellname,spellrank)) then Old_UA(cspell,cursor,onself) end
end
UseAction = DoTimer_UA

------------------------------------------------------------------------------------------------------------
-- ############## PLAYER TIMER FUNCTIONS ############## --
------------------------------------------------------------------------------------------------------------

function DoTimer_EnoughMana(spellname,rankname) --detects if you have enough mana for the attempted spell before you actually cast it
	if DoTimer_ReturnEnglish(spellname) == "Life Tap" then return true end
	local mana = DoTimer_ReturnManaCost(spellname,rankname)
	if not mana or mana < UnitMana("player") then return true end
	if DoTimer_Settings.lifetaprank == "max" then
		CastSpellByName(DoTimer_ToLocale("Life Tap"))
	else
		local i = 1
		while GetSpellName(i,BOOKTYPE_SPELL) do 
			local spell,rank = GetSpellName(i,BOOKTYPE_SPELL)
			local ranknum = SpellSystem_ParseString(rank,"(%d+)")
			if spell == DoTimer_ToLocale("Life Tap") and ranknum == DoTimer_Settings.lifetaprank then 
				CastSpell(i,BOOKTYPE_SPELL)
				break
			end
			i = i + 1
		end
	end
	return false
end

function DoTimer_ReturnManaCost(spellname,rankname) --parsing the mana cost of the spell
	local i = 1
	local found
	while GetSpellName(i,BOOKTYPE_SPELL) do
		local spell,rank = GetSpellName(i,BOOKTYPE_SPELL)
		if spell == spellname and ((rank == rankname) or (rankname == "")) then
			found = i
			break
		end
		i = i + 1
	end
	if found then
		--DoTimer_AddText("spell found at "..found)
		DoTimerScanningFrame:ClearLines()
		DoTimerScanningFrame:SetSpell(found,"spell")
		local mana = SpellSystem_ParseString(DoTimerScanningFrameTextLeft2:GetText(),"^(%d+) ")
		--DoTimer_AddText("mana: "..UnitMana("player")..", needed: "..mana)
		return (mana or false)
	else
		--DoTimer_AddText("cant find spell")
		return false
	end
end

function DoTimer_ReturnSpellType(spellname) --determining if the player or pet cast the spell
	local spelltype
	local i = 1
	while GetSpellName(i,BOOKTYPE_SPELL) do
		local spell = GetSpellName(i,BOOKTYPE_SPELL)
		if spell == spellname then 
			spelltype = "player"
			break 
		end
		i = i + 1
	end
	return spelltype
end

function DoTimer_SetAction(id) --used to parse information about a spell for UseAction
	DoTimerScanningFrame:ClearLines()
	DoTimerScanningFrameTextRight1:SetText("")
	DoTimerScanningFrame:SetAction(id)
	local spellname = DoTimerScanningFrameTextLeft1:GetText()
	local spellrank = (DoTimerScanningFrameTextRight1:GetText() or "")
	return spellname,spellrank
end

function DoTimer_ReturnRank(spell) --called if the spell did not have a rank from CastSpellByName, returns highest rank
	local highrank
	local i = 1
	while GetSpellName(i,BOOKTYPE_SPELL) do
		local spellname,spellrank = GetSpellName(i,BOOKTYPE_SPELL)
		if spellname == spell then highrank = spellrank end
		i = i + 1
	end
	if highrank == nil then highrank = "" end
	return highrank
end

function DoTimer_AwaitIcon() --the final stage for a timer; waiting for your target to actually have the debuff on it
	local debuffs = DoTimer_ListDebuffs()
	for i = table.getn(finalspell),1,-1 do
		local found
		if not (finalspell[i].target == UnitName("target") and finalspell[i].targetsex == UnitSex("target") and finalspell[i].targetlevel == UnitLevel("target")) then 
			found = 1
		else
			for index,value in ipairs(debuffs) do
				if finalspell[i].spell == value then
					found = 1
					break
				end
			end
		end
		if found then
			DoTimer_Debug("creating a timer for "..finalspell[i].spell)
			DoTimer_CreateSpellTimer(finalspell[i])
			table.remove(finalspell,i)
		end
	end
	if table.getn(finalspell) == 0 then DoTimerIconFrame:SetScript("OnUpdate",nil) end
end

------------------------------------------------------------------------------------------------------------
-- ############### PET TIMER FUNCTIONS ############### --
------------------------------------------------------------------------------------------------------------
	
function DoTimer_InitiatePetSpellTimer(spell) --begins the process of making a pet timer onscreen
	local timestart = GetTime()
	local texture,duration,casttime = DoTimer_ReturnPetInfo(spell)
	local english = DoTimer_ReturnEnglish(spell)
	local unit = "target"
	if UnitExists("pettarget") then unit = "pettarget" end
	local target = (UnitName(unit) or "Unknown")
	local targetsex = (UnitSex(unit) or 0)
	local targettype = SpellSystem_ReturnTargetType(unit)
	local targetlevel = (UnitLevel(unit) or 60)
	local entry = {spell = spell, timestart = timestart, texture = texture, duration = duration, casttime = casttime, target = target, targetsex = targetsex, targettype = targettype, targetlevel = targetlevel, unit = unit, rank = "", timertype = "pet", english = english}
	table.insert(castpetspell,entry)
	if table.getn(castpetspell) == 1 then 
		DoTimerPetFrame:SetScript("OnUpdate",function() DoTimer_AwaitPetCast() end) 
	end
end

function DoTimer_AwaitPetCast()
	--delays the pet timers an amount of time = to casttime, then sends to sentpetspell
	for i = table.getn(castpetspell),1,-1 do
		if (GetTime() >= castpetspell[i].timestart + castpetspell[i].casttime) then
			DoTimer_Debug("sending "..castpetspell[i].spell.." to sentpetspell")
			local sentpetspellentry = {} --now this spell will wait .5 seconds for interrupts, resists, immunes, etc.
			for index,value in pairs(castpetspell[i]) do sentpetspellentry[index] = value end
			sentpetspellentry.casttime = .5
			sentpetspellentry.timestart = GetTime()
			table.remove(castpetspell,i)
			table.insert(sentpetspell,sentpetspellentry)
			if table.getn(sentpetspell) == 1 then DoTimerPetDelayFrame:SetScript("OnUpdate",function() DoTimer_DelayPetTimer() end) end
			if table.getn(castpetspell) == 0 then DoTimerPetFrame:SetScript("OnUpdate",nil) end
		end
	end
end

function DoTimer_DelayPetTimer()
	--delays the pet timers .5 seconds to wait for resists or whatever, then sends to finalpetspell
	local time = GetTime()
	for i = table.getn(sentpetspell),1,-1 do
		if time >= sentpetspell[i].timestart + sentpetspell[i].casttime then
			--DoTimer_CreateSpellTimer(SpellSystem_SentSpell[i])
			DoTimer_Debug("passing "..sentpetspell[i].spell.." to finalpetspell")
			local finalpetspellentry = {}
			for index,value in pairs(sentpetspell[i]) do finalpetspellentry[index] = value end
			finalpetspellentry.timestart = GetTime()
			if UnitExists("pettarget") and not (finalpetspellentry.unit == "pettarget") then 
				finalpetspellentry.target = UnitName("pettarget")
				finalpetspellentry.targetsex = UnitSex("pettarget")
				finalpetspellentry.targettype = SpellSystem_ReturnTargetType("pettarget")
				finalpetspellentry.targetlevel = UnitLevel("pettarget")
			end
			table.insert(finalpetspell,finalpetspellentry)
			if table.getn(finalpetspell) == 1 then 
				DoTimerPreTimerFrame:SetScript("OnUpdate",function() DoTimer_CheckPreTimers() end)
				DoTimerPetIconFrame:SetScript("OnUpdate",function() DoTimer_AwaitPetIcon() end) 
			end
			table.remove(sentpetspell,i)
			if table.getn(sentpetspell) == 0 then DoTimerPetDelayFrame:SetScript("OnUpdate",nil) end
		end
	end
end

function DoTimer_AwaitPetIcon() --waiting for the icon to appear onits target before creating the timer
	local units = {"pettarget","target"}
	for index,value in ipairs(units) do
		local debuffs = DoTimer_ListDebuffs(value)
		for i = table.getn(finalpetspell),1,-1 do
			if finalpetspell[i].unit == value  then
				local found
				if not (finalpetspell[i].target == UnitName("target") and finalpetspell[i].targetsex == UnitSex("target") and finalpetspell[i].targetlevel == UnitLevel("target")) then 
					found = 1
				else
					for index,value in ipairs(debuffs) do
						if finalpetspell[i].spell == value then
							found = 1
							break
						end
					end
				end
				if found then
					if UnitExists("pet") then
						DoTimer_Debug("creating a timer for "..finalpetspell[i].spell)
						DoTimer_CreateSpellTimer(finalpetspell[i])
					else
						DoTimer_Debug(finalpetspell[i].spell.." finished, but pet is dead, so cancelling")
					end
					table.remove(finalpetspell,i)
				end
			end
		end
		if table.getn(finalpetspell) == 0 then DoTimerPetIconFrame:SetScript("OnUpdate",nil) end
	end
end

function DoTimer_ReturnPetCastTime(spell)
	local i = 1
	local found
	while GetSpellName(i,BOOKTYPE_PET) do --figuring out which spell it is in spellbook
		local spell,rank = GetSpellName(i,BOOKTYPE_PET)
		if spell == spellname then
			DoTimerScanningFrame:ClearLines() --parsing the cast time
			DoTimerScanningFrame:SetSpell(i,BOOKTYPE_PET)
			local casttime = SpellSystem_ParseString(DoTimerScanningFrameTextLeft3:GetText(),"^(%d[%d%.]*) ")
			return (casttime or 0) --if it couldn't find one, it assumes instant cast
		end
		i = i + 1
	end
	return 0
end

function DoTimer_ReturnPetInfo(spell) ----used to be longer; i used to save the data in tables, but due to the fact that this data sometimes changes and not b/c of talents, im gonna parse it every time
	return DoTimer_ReturnTexture(spell),DoTimer_ReturnDuration(spell),DoTimer_ReturnPetCastTime(spell)
end

function DoTimer_PotentialSpellLock()
	local i = 1
	while GetSpellName(i,BOOKTYPE_PET) do
		local name = GetSpellName(i,BOOKTYPE_PET)
		if DoTimer_ReturnEnglish(name) == "Spell Lock" then
			local start,duration = GetSpellCooldown(i,BOOKTYPE_PET)
			if (duration >= 10) and (math.abs(GetTime() - start) <= .5) then
				DoTimer_Debug(event)
				local unit = "target"
				if UnitExists("pettarget") then unit = "pettarget" end
				if not DoT_OwnSpellOnTarget(name,unit) then 
					DoTimer_Debug("Spell Lock was cast; beginning timer")
					DoTimer_InitiatePetSpellTimer(name)
				end
			end
		end
		i = i + 1
	end
end

function DoTimer_PotentialSeduction()
	local person,spellname = SpellSystem_ParseString(arg1,begincastmsg)
	if spellname then
		DoTimer_Debug(event)
		if arg1 then DoTimer_Debug(arg1) end
		if DoTimer_ReturnEnglish(spellname) == "Seduction" then
			DoTimer_Debug("Seduction was cast; beginning a timer for it")
			DoTimer_InitiatePetSpellTimer(spellname) 
		end
	end
	DoTimer_CheckPetFailure()
end

function DoTimer_UpdatePet()
	DoTimer_Debug(event)
	if arg1 then DoTimer_Debug(arg1) end
	local found = 0
	if UnitExists("pet") then 
		DoTimer_Debug("we have a pet") 
		found = DoTimer_ReturnTargetTable(UnitName("pet"),UnitSex("pet"),UnitLevel("pet"))
		for i = table.getn(finalenslavespell),1,-1 do
			found = i
			DoTimer_Debug("creating a timer for "..finalenslavespell[i].spell)
			finalenslavespell[i].target = UnitName("pet")
			finalenslavespell[i].targettype = "player"
			finalenslavespell[i].targetlevel = UnitLevel("pet")
			finalenslavespell[i].targetsex = UnitSex("pet")
			DoTimer_CreateSpellTimer(finalenslavespell[i])
			table.remove(finalenslavespell,i)
		end
	else 
		DoTimer_Debug("we do not have a pet") 
	end
	for i = table.getn(casted),1,-1 do
		if not (i == found) then
			for id = table.getn(casted[i]),1,-1 do
				if casted[i][id].type == "enslave" then 
					DoTimer_Debug("removing enslave timer; inaccurate")
					DoTimer_RemoveTimer(i,id,1) --removing all enslave timers whenever pet changes
				end
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------
-- ############### MACRO FUNCTIONS ################# --
------------------------------------------------------------------------------------------------------------

function DoT_IsPSpell(spellname,unit) --the function for macros to test for own debuffs on target
	if not unit then unit = "target" end
	DoTimer_Debug("DoT_IsPSpell")
	if not UnitName(unit) then return true end -- sigh
	if DoTimer_ReturnEnglish(spellname) == "Immolate" and (DoTimer_Settings.preventimmol[UnitName(unit)] or preventingimmol) then  --prevents immolate on certain mobs
		DoTimer_Debug("immolate prevented")
		return true 
	end 
	if not DoT_OwnSpellOnTarget(spellname,unit) then 
		CastSpellByName(spellname)
		if SpellIsTargeting() then SpellTargetUnit(unit) end
		return false
	end
	return true
end

function DoT_CastGhostSpell(unit) --the function for macros to test for own debuffs on target
	if not unit then unit = "target" end
	DoTimer_Debug("DoT_CastGhostSpell")
	if not UnitName(unit) then return true end -- sigh
	local found = DoTimer_ReturnTargetTable(UnitName(unit),UnitSex(unit),UnitLevel(unit))
	if found then
		for i = 1,table.getn(casted[found]) do
			if casted[found][i].type == "ghost" then
				CastSpellByName(casted[found][i].spell.."("..casted[found][i].rank..")")
				return false
			end
		end
	end
	return true
end

function DoT_OwnSpellOnTarget(spellname,unit) --do you have that spell on your target?	
	DoTimer_Debug("DoT_OwnSpellOnTarget")
	if not unit then unit = "target" end
	if DoT_SpellInAir(spellname,unit) or (DoT_TimerOnTarget(spellname,unit) and DoT_SpellIconOnTarget(spellname,unit)) then return true end
	return false
end

function DoT_SpellInAir(spellname,unit) --if the spell is in any of the holding tables (cast, but not applied as a timer yet)
	DoTimer_Debug("DoT_SpellInAir")
	if not unit then unit = "target" end
	local found
	for i = table.getn(SpellSystem_IncomingSpell),1,-1 do
		if SpellSystem_IncomingSpell[i].spell == spellname and SpellSystem_IncomingSpell[i].target.name == UnitName(unit) and SpellSystem_IncomingSpell[i].target.level == UnitLevel(unit) and SpellSystem_IncomingSpell[i].target.sex == UnitSex(unit) then 
			DoTimer_Debug(spellname.." was in SpellSystem_IncomingSpell")
			return true
		end
	end
	for i = table.getn(SpellSystem_SentSpell),1,-1 do
		if SpellSystem_SentSpell[i].spell == spellname and SpellSystem_SentSpell[i].target.name == UnitName(unit) and SpellSystem_SentSpell[i].target.level == UnitLevel(unit) and SpellSystem_SentSpell[i].target.sex == UnitSex(unit) then 
			DoTimer_Debug(spellname.." was in SpellSystem_SentSpell")
			return true
		end
	end
	for i = table.getn(finalspell),1,-1 do
		if finalspell[i].spell == spellname and finalspell[i].target == UnitName(unit) and finalspell[i].targetlevel == UnitLevel(unit) and finalspell[i].targetsex == UnitSex(unit) then 
			DoTimer_Debug(spellname.." was in finalspell")
			return true
		end
	end
	for i = table.getn(castpetspell),1,-1 do
		if castpetspell[i].spell == spellname and castpetspell[i].target == UnitName(unit) and castpetspell[i].targetlevel == UnitLevel(unit) and castpetspell[i].targetsex == UnitSex(unit) then 
			DoTimer_Debug(spellname.." was in castpetspell")
			return true 
		end
	end
	for i = table.getn(sentpetspell),1,-1 do
		if sentpetspell[i].spell == spellname and sentpetspell[i].target == UnitName(unit) and sentpetspell[i].targetlevel == UnitLevel(unit) and sentpetspell[i].targetsex == UnitSex(unit) then 
			DoTimer_Debug(spellname.." was in sentpetspell")
			return true 
		end
	end
	for i = table.getn(finalpetspell),1,-1 do
		if finalpetspell[i].spell == spellname and finalpetspell[i].target == UnitName(unit) and finalpetspell[i].targetlevel == UnitLevel(unit) and finalpetspell[i].targetsex == UnitSex(unit) then 
			DoTimer_Debug(spellname.." was in finalpetspell")
			return true 
		end
	end
	for i = table.getn(finalenslavespell),1,-1 do
		if finalenslavespell[i].spell == spellname then 
			DoTimer_Debug(spellname.." was in finalenslavespell")
			return true 
		end
	end
	DoTimer_Debug(spellname.." not in any pre-timer tables")
	return false
end

function DoT_SpellIconOnTarget(spellname,unit) --if that spell is actually on the target
	DoTimer_Debug("DoT_SpellIconOnTarget")
	if not unit then unit = "target" end
	local i = 1
	while UnitDebuff(unit,i) do --scanning each debuff of our target
		DoTimerScanningFrame:ClearLines()
		DoTimerScanningFrame:SetUnitDebuff(unit,i)
		if DoTimerScanningFrameTextLeft1:GetText() == spellname then --it matches the debuff queried
			DoTimer_Debug(spellname.." was a debuff on the target")
			return true
		end
		i = i + 1
	end
	i = 1
	while UnitBuff(unit,i) do --scanning each debuff of our target
		DoTimerScanningFrame:ClearLines()
		DoTimerScanningFrame:SetUnitBuff(unit,i)
		if DoTimerScanningFrameTextLeft1:GetText() == spellname then --it matches the buff queried
			DoTimer_Debug(spellname.. "was a buff on the target")
			return true
		end
		i = i + 1
	end
	DoTimer_Debug(spellname.." not found on target")
	return false
end

function DoT_TimerOnTarget(spellname,unit) --if we currently have a timer for that spell on that unit
	DoTimer_Debug("DoT_TimerOnTarget")
	if not unit then unit = "target" end
	local found = DoTimer_ReturnTargetTable(UnitName(unit),UnitSex(unit),UnitLevel(unit))
	if not found then --there wasn't one
		--DEFAULT_CHAT_FRAME:AddMessage("No debuffs on "..UnitName("target"))
		DoTimer_Debug(spellname.." had no timer table")
		return false
	end
	for i = 1,table.getn(casted[found]) do --oh there was one! is that debuff in the debuff table for that target?
		if casted[found][i].spell == spellname and (DoTimer_TimerIsReal(found,i) or (DoTimer_Settings.probable and casted[found][i].dep)) then --only want real debuffs or heal timers (not ghost or depreciated or fake), but includes dep. if probable setting is on
			--DEFAULT_CHAT_FRAME:AddMessage(spellname.." found on "..UnitName("target"))
			DoTimer_Debug(spellname.." had an associated timer in target's table")
			return found,i  --seems as though it was
		end
	end
	--DEFAULT_CHAT_FRAME:AddMessage("There were debuffs on "..UnitName("target")..", but not "..spellname)
	DoTimer_Debug(spellname.." was not one of the timers on the target")
	return false
end

function DoT_ReturnElapsed(spellname,unit) --returns how long ago spell was cast on unit
	DoTimer_Debug("DoT_ReturnElapsed")
	if not unit then unit = "target" end
	local found,i = DoT_TimerOnTarget(spellname,unit)
	if found and i then return GetTime() - casted[found][i].time end --seems as though it was, return how many seconds ago it was cast 
	return 0 --there were debuffs, but not that spell
end

function DoT_ReturnRemaining(spellname,unit) --returns how much time a spell has left on unit
	DoTimer_Debug("DoT_ReturnRemaining")
	if not unit then unit = "target" end
	local found,i = DoT_TimerOnTarget(spellname,unit)
	if found and i then return casted[found][i].duration - GetTime() + casted[found][i].time end --seems as though it was, return how many seconds it has left 
	return DoTimer_ReturnDuration(spellname,DoTimer_ReturnRank(spellname))  --there were debuffs, but not that spell
end

function DoT_IsSpell(spellname,unit) --the function for macros to test for any occurences of debuffs on target
	if not unit then unit = "target" end
	DoTimer_Debug("DoT_IsSpell")
	if not UnitName(unit) then return true end -- sigh
	if DoTimer_ReturnEnglish(spellname) == "Immolate" and (DoTimer_Settings.preventimmol[UnitName(unit)] or preventingimmol) then  --prevents immolate on certain mobs
		DoTimer_Debug("immolate prevented")
		return true 
	end 
	if not DoT_SpellOnTarget(spellname,unit) then 
		CastSpellByName(spellname)
		if SpellIsTargeting() then SpellTargetUnit(unit) end
		return false
	end
	return true
end 

function DoT_SpellOnTarget(spellname,unit) --is the spell on your target?
	DoTimer_Debug("DoT_SpellOnTarget")
	if not unit then unit = "target" end
	if DoT_SpellInAir(spellname,unit) or DoT_SpellIconOnTarget(spellname,unit) then return true end
	return false
end

function DoT_DetermineSpell(spell1,spell2,unit) --another macro function with some more complicated logic
	if not unit then unit = "target" end
	DoTimer_Debug("DoT_DetermineSpell")
	if not UnitName(unit) then return true end -- sigh
	if not DoT_SpellOnTarget(spell1) then 
		CastSpellByName(spell1) 
		if SpellIsTargeting() then SpellTargetUnit(unit) end
		return false 
	end
	if (not DoT_OwnSpellOnTarget(spell1)) and (not DoT_OwnSpellOnTarget(spell2)) then 
		CastSpellByName(spell2) 
		if SpellIsTargeting() then SpellTargetUnit(unit) end
		return false 
	end
	return true
end

------------------------------------------------------------------------------------------------------------
-- ############## INTERFACE FUNCTIONS ################ --
------------------------------------------------------------------------------------------------------------

function DoTimer_CreateInterface() --defines the major portion of writing to the screen; it is called when something drastic has to happen to the interface (i.e., not just updating a timer)
	DoTimer_Debug("redoing interface to add/remove timers")
	if DoTimer_Settings.visible then
		DoTimer_SortTimers()
		local time = GetTime()
		if table.getn(casted) == 0 then DoTimerFrame:SetScript("OnUpdate",nil) end --to save memory, the OnUpdate function won't be called at all if there are no timers
		if table.getn(casted) == 1 then DoTimerFrame:SetScript("OnUpdate",function() DoTimer_OnUpdate() end) end --restoring that OnUpdate
		local targetindex = DoTimer_ReturnTargetTable(UnitName("target"),UnitSex("target"),UnitLevel("target"))
		for i = 1,table.getn(casted) do --displaying the information onscreen for each target
			if (not DoTimer_Settings.onlytarget) or (i == (targetindex or ((not UnitExists("target")) and i or 0))) then
				getglobal("DoTimerTarget"..i):Show()
				getglobal("DoTimerTarget"..i.."Name").target = casted[i].target
				getglobal("DoTimerTarget"..i.."Name").level = casted[i].level
				for id = 1,table.getn(casted[i]) do --for each debuff on the target
					if DoTimer_Settings.format == "icons" then
						getglobal("DoTimerTarget"..i.."Debuff"..id):Show()
						getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTexture").spell = casted[i][id].spell
						getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTexture").rank = casted[i][id].rank
						getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTexture"):UnlockHighlight()
						getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTextureIcon"):SetTexture(casted[i][id].texture) --setting the icon
						local remaining
						local type = casted[i][id].type
						if type == "ghost" or type == "blank" then
							getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTime"):SetText("")					
						else
							remaining = casted[i][id].duration - time + casted[i][id].time
							getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTime"):SetText(DoTimer_ReturnNewDuration(remaining)) --setting the time remaining
						end
						local displayed = casted[i][id].displayed
						if displayed and (displayed == 5 or displayed == 4) and DoTimer_Settings.expalert then getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTexture"):LockHighlight() end
						local r,g,b
						if type == "ghost" or type == "blank" then r,g,b = COLOR_PURPLE.r,COLOR_PURPLE.g,COLOR_PURPLE.b
						elseif remaining <= 5 and DoTimer_Settings.expalert then r,g,b = COLOR_RED.r,COLOR_RED.g,COLOR_RED.b
						else r,g,b = COLOR_WHITE.r,COLOR_WHITE.g,COLOR_WHITE.b	
						end
						getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTime"):SetTextColor(r,g,b) --setting the color of the time remaining
						local alpha
						if type == "ghost" then alpha = GHOST_ALPHA elseif casted[i][id].type == "blank" then alpha = 0 else alpha = 1 end
						getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTextureIcon"):SetAlpha(alpha) --setting the alpha of the icon
						local scale = 1
						if casted[i][id].dep then scale = DEP_SCALE end
						getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTexture"):SetScale(DoTimer_Settings.buttonscale * scale)
						local enablemouse = DoTimer_Settings.clickable
						if type == "blank" then enablemouse = false end
						getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTexture"):EnableMouse(enablemouse)
					else
						getglobal("DoTimerTarget"..i.."Debuff"..id):Show()
						getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusButton").spell = casted[i][id].spell
						getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusButton").rank = casted[i][id].rank
						getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedIcon").spell = casted[i][id].spell
						getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedIcon").rank = casted[i][id].rank
						getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedIconTexture"):SetTexture(casted[i][id].texture) --setting the icon
						local remaining
						local type = casted[i][id].type
						if type == "ghost" or type == "blank" then
							getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusBarText"):SetText(casted[i][id].spell)
							getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusBar"):SetMinMaxValues(0,1)
							getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusBar"):SetValue(1)
						elseif type == "blank" then
							getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTime"):SetText("")
						else
							remaining = casted[i][id].duration - time + casted[i][id].time
							getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusBar"):SetMinMaxValues(0,casted[i][id].duration)
							getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusBar"):SetValue(remaining)
							getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusBarText"):SetText(DoTimer_ReturnNewDuration(remaining).." - "..casted[i][id].spell) --setting the time remaining
						end
						local r,g,b
						if type == "ghost" or type == "blank" then r,g,b = COLOR_PURPLE.r,COLOR_PURPLE.g,COLOR_PURPLE.b
						elseif remaining <= 5 and DoTimer_Settings.expalert then r,g,b = COLOR_RED.r,COLOR_RED.g,COLOR_RED.b
						elseif (remaining / casted[i][id].duration) <= .5 then r,g,b = COLOR_YELLOW.r, COLOR_YELLOW.g, COLOR_YELLOW.b 
						else r,g,b = COLOR_GREEN.r,COLOR_GREEN.g,COLOR_GREEN.b
						end
						getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusBar"):SetStatusBarColor(r,g,b) --setting the color of the time remaining
						local alpha
						if type == "ghost" then alpha = GHOST_ALPHA elseif casted[i][id].type == "blank" then alpha = 0 else alpha = 1 end
						getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatus"):SetAlpha(alpha) --setting the alpha of the icon
						getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedIcon"):SetAlpha(alpha)
						local scale = 1
						if casted[i][id].dep then scale = DEP_SCALE end
						getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatus"):SetScale(DoTimer_Settings.buttonscale * scale)
						getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedIcon"):SetScale(DoTimer_Settings.buttonscale * scale)
						local enablemouse = DoTimer_Settings.clickable
						if type == "blank" then enablemouse = false end
						getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusButton"):EnableMouse(enablemouse)
					end
				end
			end
		end
		for i = 1,10 do
			if (not casted[i]) or (DoTimer_Settings.onlytarget and not (i == (targetindex or ((not UnitExists("target")) and i or 0)))) then 
				getglobal("DoTimerTarget"..i):Hide() --hiding unused targets
			else
				if DoTimer_Settings.names then --set the target name if you have them on, else hide it
					getglobal("DoTimerTarget"..i.."Name"):Show()
					local targettext
					if DoTimer_Settings.levels then
						targettext = "["..casted[i].level.."] "..string.gsub(casted[i].target," ","\n")
					else
						targettext = string.gsub(casted[i].target," ","\n")
					end
					getglobal("DoTimerTarget"..i.."NameText"):SetText(targettext)
					getglobal("DoTimerTarget"..i.."Name"):SetHeight(getglobal("DoTimerTarget"..i.."NameText"):GetHeight())
					getglobal("DoTimerTarget"..i.."Name"):SetWidth(getglobal("DoTimerTarget"..i.."NameText"):GetWidth())
				else
					getglobal("DoTimerTarget"..i.."Name"):Hide()
				end
				for id = 1,20 do
					if (not casted[i][id]) then getglobal("DoTimerTarget"..i.."Debuff"..id):Hide() end --hiding unused debuffs in used targets
				end
			end
		end
		DoTimer_ResizeInterface()
	end
end

function DoTimer_SortTimers() --separated the timers by their type then arranges by time added or time remaining
	for i = table.getn(casted),1,-1 do
		local regtimers = {} --the 5 different types that timers can be, and a table to catch all blank timers
		local deptimers = {}
		local ghosttimers = {}
		local faketimers = {}
		local enslavetimers = {}
		if DoTimer_Settings.sepghost then --filtering out all blank timers first
			for id = table.getn(casted[i]),1,-1 do
				if casted[i][id].type == "blank" then table.remove(casted[i],id) end
			end
		end
		local total = table.getn(casted[i])
		for id = total,1,-1 do --sorting into correct table
			local intable,type
			type = casted[i][id].type
			if casted[i][id].dep then intable = deptimers
			elseif type == "ghost" then intable = ghosttimers
			elseif type == "fake" then intable = faketimers
			elseif type == "enslave" then intable = enslavetimers
			else intable = regtimers
			end
			table.insert(intable,casted[i][id])
			table.remove(casted[i],id)
		end
		local time = GetTime()
		local tables = {regtimers,deptimers,ghosttimers,faketimers,enslavetimers}
		if DoTimer_Settings.sortbyadded == false then --sorting the temp tables by time added or time remaining
			for index,value in ipairs(tables) do
				table.sort(value,function(a,b) return (a.duration - time + a.time) < (b.duration - time + b.time) end)
			end
		else
			for index,value in ipairs(tables) do
				table.sort(value,function(a,b) return (a.time) < (b.time) end)
			end		
		end
		for id = 1,table.getn(enslavetimers) do table.insert(casted[i],enslavetimers[id]) end --inserting them back into the main table in the order i want them displayed onscreen
		for id = 1,table.getn(regtimers) do table.insert(casted[i],regtimers[id]) end
		for id = 1,table.getn(deptimers) do table.insert(casted[i],deptimers[id]) end
		if DoTimer_Settings.sepghost and (table.getn(casted[i]) > 0) and (total - table.getn(casted[i]) > 0) then DoTimer_InsertBlankTimer(i) end
		for id = 1,table.getn(ghosttimers) do table.insert(casted[i],ghosttimers[id]) end
		for id = 1,table.getn(faketimers) do table.insert(casted[i],faketimers[id]) end
	end
	if DoTimer_Settings.onlytarget and UnitExists("target") then --moving the table for current target to 1st position if necessary
		local targetindex = DoTimer_ReturnTargetTable(UnitName("target"),UnitSex("target"),UnitLevel("target"))
		if targetindex then
			local castedentry = casted[targetindex]
			table.remove(casted,targetindex)
			table.insert(casted,1,castedentry)
		end
	end
end

function DoTimer_TargetClicked(index)
	if IsShiftKeyDown() then
		DoTimer_RemoveTarget(index)
	else
		if not (casted[index].target == UnitName("target") and casted[index].level == UnitLevel("target") and casted[index].sex == UnitSex("target")) then TargetByName(casted[index].target) end
	end
end

function DoTimer_ButtonClicked(index,indexid) --the script for when an icon is clicked
	if IsShiftKeyDown() then --delete it
		DoTimer_RemoveTimer(index,indexid)
	elseif IsControlKeyDown() then --make it a ghost timer
		if DoTimer_TimerIsReal(index,indexid) then DoTimer_CreateGhostTimer(index,indexid) end
	else --target the mob, or, if ghost, target or cast spell
		if casted[index][indexid].type == "ghost" then
			if casted[index].target == UnitName("target") and casted[index].level == UnitLevel("target") and casted[index].sex == UnitSex("target") then 
				local spell = casted[index][indexid].spell
				local rank = casted[index][indexid].rank
				if DoTimer_ReturnEnglish(spell) == "Seduction" then
					PetFollow()
					PetAttack()
				end
				if DoTimer_Settings.conflag then 
					if DoTimer_ReturnEnglish(spell) == "Immolate" and DoT_OwnSpellOnTarget(DoTimer_ToLocale("Immolate")) then
						spell = DoTimer_ToLocale("Conflagrate")
						rank = ""
					elseif DoTimer_ReturnEnglish(spell) == "Rejuvenation" and DoT_SpellOnTarget(DoTimer_ToLocale("Rejuvenation")) then
						spell = DoTimer_ToLocale("Swiftmend")
						rank = ""
					end
				end
				CastSpellByName(spell.."("..rank..")") 
			else 
				TargetByName(casted[index].target) 
			end
		else
			if not (casted[index].target == UnitName("target") and casted[index].level == UnitLevel("target") and casted[index].sex == UnitSex("target")) then TargetByName(casted[index].target) end
		end
	end
end

function DoTimer_AddTimers(numtargets,numdebuffs) --used to view different interface layouts
	DoTimer_DelTimers()
	for i = 1,(numtargets or DoTimer_Settings.maxtargets) do
		getglobal("DoTimerTarget"..i):Show()
		if DoTimer_Settings.names then 
			local targettext
			if DoTimer_Settings.levels then
				targettext = "[60] Target\nName\nNumber "..i
			else
				targettext = "Target\nName\nNumber "..i
			end
			getglobal("DoTimerTarget"..i.."Name"):Show()
			getglobal("DoTimerTarget"..i.."NameText"):SetText(targettext)
			getglobal("DoTimerTarget"..i.."Name"):SetHeight(getglobal("DoTimerTarget"..i.."NameText"):GetHeight())
			getglobal("DoTimerTarget"..i.."Name"):SetWidth(getglobal("DoTimerTarget"..i.."NameText"):GetWidth())
			getglobal("DoTimerTarget"..i.."Name").target = "Target Name Number "..i
			getglobal("DoTimerTarget"..i.."Name").level = 60
		end
		for id = 1,(numdebuffs or DoTimer_Settings.maxdebuffs) do
			getglobal("DoTimerTarget"..i.."Debuff"..id):Show()
			if DoTimer_Settings.format == "icons" then
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTextureIcon"):SetTexture(GetSpellTexture(id,BOOKTYPE_SPELL))
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTime"):SetText("0:00")
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTexture").spell = "Fake Spell"
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTexture").rank = "Fake Rank"
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTime"):SetTextColor(COLOR_WHITE.r,COLOR_WHITE.g,COLOR_WHITE.b)
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTextureIcon"):SetAlpha(1)
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTexture"):SetScale(DoTimer_Settings.buttonscale)
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTexture"):EnableMouse(DoTimer_Settings.clickable)
			else
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusButton").spell = "Fake Spell"
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusButton").rank = "Fake Rank"
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedIcon").spell = "Fake Spell"
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedIcon").rank = "Fake Rank"
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusBar"):SetMinMaxValues(0,1)
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusBar"):SetValue(1)
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusBar"):SetStatusBarColor(COLOR_GREEN.r,COLOR_GREEN.g,COLOR_GREEN.b)
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusBarText"):SetText("0:00 - Fake Spell")
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedIconTexture"):SetTexture(GetSpellTexture(id,BOOKTYPE_SPELL))
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatus"):SetAlpha(1)
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedIcon"):SetAlpha(1)
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatus"):SetScale(DoTimer_Settings.buttonscale)
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedIcon"):SetScale(DoTimer_Settings.buttonscale)
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusButton"):EnableMouse(DoTimer_Settings.clickable)
			end
		end
	end
	DoTimer_ResizeInterface()
end

function DoTimer_DelTimers() --used to hide the "fake" timers created by the above function
	for i = 1,10 do
		getglobal("DoTimerTarget"..i):Hide()
		getglobal("DoTimerTarget"..i.."Name"):Hide()
		for id = 1,20 do
			getglobal("DoTimerTarget"..i.."Debuff"..id):Hide()
		end
	end
end

function DoTimer_DefineInterface(targetsetup,debuffsetup,startup) --the controller behind the 16 different interface layouts
	local oldtargetsetup = DoTimer_Settings.targetlayout
	local olddebuffsetup = DoTimer_Settings.debufflayout
	DoTimer_Settings.targetlayout = targetsetup
	DoTimer_Settings.debufflayout = debuffsetup
	local ref1,ref2,ref3,ref4,ref5,ref6,ref7,ref8,ref9,ref10
	local num1,num2,num3,num4,num5,num6,num7,num8
	--ref1/2: name string to target frame: the name is anchored by (1) to the target's (2)
	--ref3/4: time string to debuff texture: the timer is anchored by (3) to the texture's (4)
	--ref5/6 the anchor corner/its opposite: the 1st target is anchored by (5) to the drag icon's (6)
	--ref7: corner for the other targets: the next target is anchored by (5) to the current's (7)
	--ref8/9: anchors for the debuffs: the next debuff is anchored by its (9) to the previous's (8) (reversed order than usual)
	--ref10: anchor for the 1st debuff; it is connected by its (10) to the target frame's (10)
	--num1/2: dist. between name string and target: you go left (1) and up (2) to go from target to name
	--num3/4: dist. between time string and texture: you go left (3) and up (4) to go from texture to timer
	--num5/6: dist. between debuffs: you go left (5) and up (6) to go from one debuff to the next
	--num7/8: dist. between targets: you go left (7) and up (8) to go from one target to the next
	--num9/10: from main frame to 1st target, for a bit of room: you go left (9) and up (10) to go from main frame to 1st target
	if targetsetup == "up" and debuffsetup == "left" then
		ref1,ref2,ref3,ref4,ref5,ref6,ref7,ref8,ref9,ref10 = "LEFT","RIGHT","TOP","BOTTOM","BOTTOMRIGHT","TOPLEFT","TOPRIGHT","LEFT","RIGHT","BOTTOMRIGHT"
		num1,num2,num3,num4,num5,num6,num7,num8,num9,num10 = 5,0,0,-5,-5,0,0,5,-5,5
	elseif targetsetup == "down" and debuffsetup == "left" then
		ref1,ref2,ref3,ref4,ref5,ref6,ref7,ref8,ref9,ref10 = "LEFT","RIGHT","TOP","BOTTOM","TOPRIGHT","BOTTOMLEFT","BOTTOMRIGHT","LEFT","RIGHT","TOPRIGHT"
		num1,num2,num3,num4,num5,num6,num7,num8,num9,num10 = 5,0,0,-5,-5,0,0,-5,-5,-5
	elseif targetsetup == "left" and debuffsetup == "up" then
		ref1,ref2,ref3,ref4,ref5,ref6,ref7,ref8,ref9,ref10 = "TOP","BOTTOM","LEFT","RIGHT","BOTTOMRIGHT","TOPLEFT","BOTTOMLEFT","TOP","BOTTOM","BOTTOMRIGHT"
		num1,num2,num3,num4,num5,num6,num7,num8,num9,num10 = 0,-5,5,0,0,5,-5,0,-5,5
	elseif targetsetup == "right" and debuffsetup == "up" then
		ref1,ref2,ref3,ref4,ref5,ref6,ref7,ref8,ref9,ref10 = "TOP","BOTTOM","LEFT","RIGHT","BOTTOMLEFT","TOPRIGHT","BOTTOMRIGHT","TOP","BOTTOM","BOTTOMLEFT"
		num1,num2,num3,num4,num5,num6,num7,num8,num9,num10 = 0,-5,5,0,0,5,5,0,5,5
	elseif targetsetup == "up" and debuffsetup == "right" then
		ref1,ref2,ref3,ref4,ref5,ref6,ref7,ref8,ref9,ref10 = "RIGHT","LEFT","TOP","BOTTOM","BOTTOMLEFT","TOPRIGHT","TOPLEFT","RIGHT","LEFT","BOTTOMLEFT"
		num1,num2,num3,num4,num5,num6,num7,num8,num9,num10 = -5,0,0,-5,5,0,0,5,5,5
	elseif targetsetup == "down" and debuffsetup == "right" then
		ref1,ref2,ref3,ref4,ref5,ref6,ref7,ref8,ref9,ref10 = "RIGHT","LEFT","TOP","BOTTOM","TOPLEFT","BOTTOMRIGHT","BOTTOMLEFT","RIGHT","LEFT","TOPLEFT"
		num1,num2,num3,num4,num5,num6,num7,num8,num9,num10 = -5,0,0,-5,5,0,0,-5,5,-5
	elseif targetsetup == "left" and debuffsetup == "down" then --default!
		ref1,ref2,ref3,ref4,ref5,ref6,ref7,ref8,ref9,ref10 = "BOTTOM","TOP","LEFT","RIGHT","TOPRIGHT","BOTTOMLEFT","TOPLEFT","BOTTOM","TOP","TOPRIGHT"
		num1,num2,num3,num4,num5,num6,num7,num8,num9,num10 = 0,5,5,0,0,-5,-5,0,-5,-5
	elseif targetsetup == "right" and debuffsetup == "down" then
		ref1,ref2,ref3,ref4,ref5,ref6,ref7,ref8,ref9,ref10 = "BOTTOM","TOP","LEFT","RIGHT","TOPLEFT","BOTTOMRIGHT","TOPRIGHT","BOTTOM","TOP","TOPLEFT"
		num1,num2,num3,num4,num5,num6,num7,num8,num9,num10 = 0,5,5,0,0,-5,5,0,5,-5
	elseif targetsetup == "right" and debuffsetup == "right" then
		ref1,ref2,ref3,ref4,ref5,ref6,ref7,ref8,ref9,ref10 = "BOTTOMLEFT","TOPLEFT","TOP","BOTTOM","TOPLEFT","BOTTOMRIGHT","TOPRIGHT","RIGHT","LEFT","TOPLEFT"
		num1,num2,num3,num4,num5,num6,num7,num8,num9,num10 = 0,5,0,-5,5,0,5,0,5,-5
	elseif targetsetup == "down" and debuffsetup == "down" then
		ref1,ref2,ref3,ref4,ref5,ref6,ref7,ref8,ref9,ref10 = "TOPRIGHT","TOPLEFT","LEFT","RIGHT","TOPLEFT","BOTTOMRIGHT","BOTTOMLEFT","BOTTOM","TOP","TOPLEFT"
		num1,num2,num3,num4,num5,num6,num7,num8,num9,num10 = -5,0,5,0,0,-5,0,-5,5,-5
	elseif targetsetup == "left" and debuffsetup == "left" then
		ref1,ref2,ref3,ref4,ref5,ref6,ref7,ref8,ref9,ref10 = "BOTTOMRIGHT","TOPRIGHT","TOP","BOTTOM","TOPRIGHT","BOTTOMLEFT","TOPLEFT","LEFT","RIGHT","TOPRIGHT"
		num1,num2,num3,num4,num5,num6,num7,num8,num9,num10 = 0,5,0,-5,-5,0,-5,0,-5,-5
	elseif targetsetup == "up" and debuffsetup == "up" then
		ref1,ref2,ref3,ref4,ref5,ref6,ref7,ref8,ref9,ref10 = "BOTTOMRIGHT","BOTTOMLEFT","LEFT","RIGHT","BOTTOMLEFT","TOPRIGHT","TOPLEFT","TOP","BOTTOM","BOTTOMLEFT"
		num1,num2,num3,num4,num5,num6,num7,num8,num9,num10 = -5,0,5,0,0,5,0,5,5,5
	elseif targetsetup == "up" and debuffsetup == "down" then
		ref1,ref2,ref3,ref4,ref5,ref6,ref7,ref8,ref9,ref10 = "TOPRIGHT","TOPLEFT","LEFT","RIGHT","BOTTOMLEFT","TOPRIGHT","TOPLEFT","BOTTOM","TOP","TOPLEFT"
		num1,num2,num3,num4,num5,num6,num7,num8,num9,num10 = -5,0,5,0,0,-5,0,5,5,5
	elseif targetsetup == "down" and debuffsetup == "up" then
		ref1,ref2,ref3,ref4,ref5,ref6,ref7,ref8,ref9,ref10 = "BOTTOMRIGHT","BOTTOMLEFT","LEFT","RIGHT","TOPLEFT","BOTTOMRIGHT","BOTTOMLEFT","TOP","BOTTOM","BOTTOMLEFT"
		num1,num2,num3,num4,num5,num6,num7,num8,num9,num10 = -5,0,5,0,0,5,0,-5,5,-5
	elseif targetsetup == "left" and debuffsetup == "right" then
		ref1,ref2,ref3,ref4,ref5,ref6,ref7,ref8,ref9,ref10 = "BOTTOMLEFT","TOPLEFT","TOP","BOTTOM","TOPRIGHT","BOTTOMLEFT","TOPLEFT","RIGHT","LEFT","TOPLEFT"
		num1,num2,num3,num4,num5,num6,num7,num8,num9,num10 = 0,5,0,-5,5,0,-5,0,5,-5
	elseif targetsetup == "right" and debuffsetup == "left" then
		ref1,ref2,ref3,ref4,ref5,ref6,ref7,ref8,ref9,ref10 = "BOTTOMRIGHT","TOPRIGHT","TOP","BOTTOM","TOPLEFT","BOTTOMRIGHT","TOPRIGHT","LEFT","RIGHT","TOPRIGHT"
		num1,num2,num3,num4,num5,num6,num7,num8,num9,num10 = 0,5,0,-5,-5,0,5,0,-5,-5
	else
		DoTimer_AddText(DOTIMER_MENU_FAILURE_CHANGE)
		DoTimer_Settings.targetlayout = oldtargetsetup
		DoTimer_Settings.debufflayout = olddebuffsetup
	end
	if (not (DoTimer_Settings.targetlayout == oldtargetsetup)) or (not (DoTimer_Settings.debufflayout == olddebuffsetup)) or (startup) then 
		for i = 1,10 do
			getglobal("DoTimerTarget"..i):ClearAllPoints()
			getglobal("DoTimerTarget"..i.."Name"):ClearAllPoints()
			getglobal("DoTimerTarget"..i.."Name"):SetPoint(ref1,"DoTimerTarget"..i,ref2,num1,num2)
			for id = 1,20 do
				getglobal("DoTimerTarget"..i.."Debuff"..id):ClearAllPoints()
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTime"):ClearAllPoints()
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTime"):SetPoint(ref3,"DoTimerTarget"..i.."Debuff"..id.."DisplayedTexture",ref4,num3,num4)
			end
		end
		for i = 1,10 do
			getglobal("DoTimerTarget"..i.."Debuff1"):SetPoint(ref10,"DoTimerTarget"..i,ref10)
			for id = 2,20 do
				getglobal("DoTimerTarget"..i.."Debuff"..id):SetPoint(ref9,"DoTimerTarget"..i.."Debuff"..(id-1),ref8,num5,num6)
			end
		end
		getglobal("DoTimerTarget1"):SetPoint(ref5,"DoTimerMainFrame",ref6,num9,num10)
		for i = 2,10 do
			getglobal("DoTimerTarget"..i):SetPoint(ref5,"DoTimerTarget"..(i-1),ref7,num7,num8)
		end
		DoTimer_ResizeInterface() 
	end
end

function DoTimer_ResizeInterface() --resizes the frames that hold the debuffs so that they are more tightly compacted on the screen
	local maxwidth,maxheight,otherwidth,otherheight,nameheight,namewidth,targetwidth,targetheight,debuffheight,debuffwidth,timerheight,timerwidth
	local text
	if DoTimer_Settings.levels then 
		text = "[-1] Vaelastrasz\nthe\nCorrupt"
	else
		text = "Vaelastrasz\nthe\nCorrupt"
	end
	DoTimerFontTestText:SetText(text) --the target names will be normalized to this name; as it is exceedingly long
	if DoTimer_Settings.names then nameheight,namewidth = DoTimerFontTestText:GetHeight(),DoTimerFontTestText:GetWidth() else nameheight,namewidth = 0,0 end
	if DoTimer_Settings.format == "icons" then
		debuffheight = DoTimerTarget1Debuff1DisplayedTexture:GetHeight() * DoTimer_Settings.buttonscale
		debuffwidth = DoTimerTarget1Debuff1DisplayedTexture:GetWidth() * DoTimer_Settings.buttonscale
		timerheight = DoTimerTarget1Debuff1DisplayedTime:GetHeight()
		timerwidth = DoTimerTarget1Debuff1DisplayedTime:GetWidth()
	else
		debuffheight = DoTimerTarget1Debuff1DisplayedStatus:GetHeight() * DoTimer_Settings.buttonscale
		debuffwidth = (DoTimerTarget1Debuff1DisplayedStatus:GetWidth() * DoTimer_Settings.buttonscale) + 20
	end
	local d = DoTimer_Settings.debufflayout
	if d == "up" or d == "down" then -- wider than they are tall
		if DoTimer_Settings.format == "icons" then
			maxwidth = math.max(namewidth,debuffwidth + timerwidth + 5)
			maxheight = math.max(debuffheight,timerheight)
			otherwidth = debuffwidth + timerwidth + 5
			otherheight = debuffheight
			targetwidth = maxwidth
			targetheight = math.max(nameheight,maxheight)
		else
			maxwidth = debuffwidth
			maxheight = debuffheight
			otherwidth = debuffwidth
			otherheight = debuffheight
			targetwidth = maxwidth
			targetheight = math.max(nameheight,maxheight)
		end
	else --taller than they are wide
		if DoTimer_Settings.format == "icons" then
			maxwidth = math.max(debuffwidth,timerwidth)
			maxheight = math.max(nameheight,debuffheight + timerheight + 5)
			otherwidth = debuffwidth
			otherheight = debuffheight + timerheight + 5
			targetwidth = math.max(namewidth,maxwidth)
			targetheight = maxheight
		else
			maxwidth = debuffwidth
			maxheight = debuffheight
			otherwidth = debuffwidth
			otherheight = debuffheight
			targetwidth = math.max(maxwidth,namewidth)
			targetheight = maxheight
		end
	end
	for i = 1,10 do
		local num = DoTimer_GetNumDebuffs(i)
		if d == "up" or d == "down" then
			getglobal("DoTimerTarget"..i):SetWidth(targetwidth)
			getglobal("DoTimerTarget"..i):SetHeight(math.max(targetheight,(num * (maxheight + 5)) - 5))
		else
			getglobal("DoTimerTarget"..i):SetWidth(math.max(targetwidth,(num * (maxwidth + 5)) - 5))
			getglobal("DoTimerTarget"..i):SetHeight(targetheight)		
		end
		for id = 1,20 do
			getglobal("DoTimerTarget"..i.."Debuff"..id):SetWidth(maxwidth)
			getglobal("DoTimerTarget"..i.."Debuff"..id):SetHeight(maxheight)
			getglobal("DoTimerTarget"..i.."Debuff"..id.."Displayed"):SetWidth(otherwidth)
			getglobal("DoTimerTarget"..i.."Debuff"..id.."Displayed"):SetHeight(otherheight)
		end
	end
end 

function DoTimer_GetNumDebuffs(i) --returns how many debuff icons for that target are currently being shown
	for id = 20,1,-1 do
		if getglobal("DoTimerTarget"..i.."Debuff"..id):IsVisible() then return id end
	end
	return 0
end

function DoTimer_SimulateTimer(spell,target) --used to make a fake timer, no real reason for it
	local rank = DoTimer_ReturnRank(spell)
	local sex,level,type
	sex = 0
	level = 60
	type = "player"
	local texture = SpellSystem_ReturnSpellTexture(spell,rank)
	local duration = DoTimer_ReturnDuration(spell,rank)
	local spelltable = {spell = spell, rank = rank, texture = texture, duration = duration, target = target, targetsex = sex, targetlevel = level, targettype = type, timertype = "fake"}
	DoTimer_CreateSpellTimer(spelltable)
end

function DoTimer_CreateGhostTimer(found,i) --makes the ghost timer once a spell is control+clicked
	local basedspell = casted[found][i]
	local basedtarget = casted[found]
	local spelltable = {spell = basedspell.spell, rank = basedspell.rank, texture = basedspell.texture, duration = 0, target = basedtarget.target, targetsex = basedtarget.sex, targetlevel = basedtarget.level, targettype = basedtarget.type, timertype = "ghost"}
	DoTimer_CreateSpellTimer(spelltable)
end

function DoTimer_DefineFormat()
	if DoTimer_Settings.format == "icons" then
		for i = 1,10 do
			for id = 1,20 do
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTexture"):Show()
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTime"):Show()
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatus"):Hide()
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedIcon"):Hide()
			end
		end
	else
		for i = 1,10 do
			for id = 1,20 do
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTexture"):Hide()
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedTime"):Hide()
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatus"):Show()
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedIcon"):Show()
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatus"):SetWidth(DoTimer_Settings.barlength + 5)
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusBar"):SetWidth(DoTimer_Settings.barlength)
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusBarText"):SetWidth(DoTimer_Settings.barlength)
				getglobal("DoTimerTarget"..i.."Debuff"..id.."DisplayedStatusButton"):SetWidth(DoTimer_Settings.barlength)
			end
		end	
	end
	DoTimer_ResizeInterface()
end

function DoTimer_InsertBlankTimer(targetindex)
	local list = {spell = "Blank Spot", rank = "", texture = GetSpellTexture(1,BOOKTYPE_SPELL), duration = 0, time = 0, type = "blank"}
	table.insert(casted[targetindex],list)
end

function DoTimer_ReturnNewDuration(time) --modifies the time remaining on the debuff into a format suitable for the screen
	newtime = math.floor(time)
	local minutes = math.floor(newtime / 60)
	local seconds = math.floor(newtime - (60 * minutes))
	if seconds < 10 then seconds = "0"..seconds else seconds = tostring(seconds) end
	return string.format("%d:%s",minutes,seconds)
end 

function DoTimer_PrintUpdates()
	local frames = {
		"DoTimerFrame",
		"DoTimerDelayFrame",
		"DoTimerIconFrame",
		"DoTimerPetFrame",
		"DoTimerPetDelayFrame",
		"DoTimerPetIconFrame",
		"DoTimerCombatFrame",
		"DoTimerPreTimerFrame",
		"DoTimerHealDelayFrame",
		"DoTimerDeathFrame",
	}
	for index,value in ipairs(frames) do
		if getglobal(value):GetScript("OnUpdate") then DoTimer_AddText(value) end
	end
end

------------------------------------------------------------------------------------------------------------
-- ################ MENU FUNCTIONS ################# --
------------------------------------------------------------------------------------------------------------

function DoTimer_Commands(msg,fromgui) --governs the /command
	if msg == "" then DoTimerMenuFrame:Show()
	elseif msg == "on" then 
		DoTimer_Settings.status = "on"
		DoTimer_AddMenuText(DOTIMER_CMD_ON,fromgui)
		DoTimerFrame:SetScript("OnEvent",function() DoTimer_OnEvent(event) end)
		DoTimerFrame:SetScript("OnUpdate",function() DoTimer_OnUpdate() end)
		DoTimerMainFrame:Show()
		DoTimer_Settings.visible = true		
	elseif msg == "off" then
		DoTimer_Settings.status = "off"
		DoTimer_AddMenuText(DOTIMER_CMD_OFF,fromgui)
		DoTimerFrame:SetScript("OnEvent",nil)
		DoTimerFrame:SetScript("OnUpdate",nil)
		DoTimerMainFrame:Hide()
		DoTimer_Settings.visible = false
	elseif msg == "debug off" then
		DoTimer_DebugChannel = nil
		DoTimer_AddMenuText(DOTIMER_CMD_DEBUG_OFF,fromgui)
	elseif msg == "reset" then
		DoTimer_Settings = {}
		DoTimer_Startup()
		DoTimerAnchorFrame:ClearAllPoints()
		DoTimerAnchorFrame:SetPoint("CENTER","UIParent","CENTER")
		DoTimer_AddMenuText(DOTIMER_CMD_RESET,fromgui)
	elseif msg == "set format bars" then
		DoTimer_Settings.format = "bars"
		DoTimer_DefineFormat()
		DoTimer_AddMenuText(DOTIMER_CMD_FORMAT_BARS,fromgui)
	elseif msg == "set format icons" then
		DoTimer_Settings.format = "icons"
		DoTimer_DefineFormat()
		DoTimer_AddMenuText(DOTIMER_CMD_FORMAT_ICONS,fromgui)		
	elseif msg == "reset position" then
		DoTimerAnchorFrame:ClearAllPoints()
		DoTimerAnchorFrame:SetPoint("CENTER","UIParent","CENTER")
		DoTimer_AddMenuText(DOTIMER_CMD_RESET_POSITION,fromgui)		
	elseif msg == "ui off" then
		DoTimer_Settings.visible = false
		DoTimerMainFrame:Hide()
		DoTimer_AddMenuText(DOTIMER_CMD_UI_OFF,fromgui)
	elseif msg == "ui on" then
		DoTimer_Settings.visible = true
		DoTimerMainFrame:Show()
		DoTimer_AddMenuText(DOTIMER_CMD_UI_ON,fromgui)
	elseif msg == "play sounds" then
		DoTimer_Settings.playsound = true
		DoTimer_AddMenuText(DOTIMER_CMD_SOUND_ON,fromgui)
	elseif msg == "do not play sounds" then
		DoTimer_Settings.playsound = false
		DoTimer_AddMenuText(DOTIMER_CMD_SOUND_OFF,fromgui)
	elseif msg == "force conflag" then
		DoTimer_Settings.conflag = true
		DoTimer_AddMenuText(DOTIMER_CMD_FORCE_CONFLAG_ON,fromgui)
	elseif msg == "do not force conflag" then
		DoTimer_Settings.conflag = false
		DoTimer_AddMenuText(DOTIMER_CMD_FORCE_CONFLAG_OFF,fromgui)
	elseif msg == "show only target" then
		DoTimer_Settings.onlytarget = true
		DoTimer_AddMenuText(DOTIMER_CMD_ONLY_TARGET_ON,fromgui)
	elseif msg == "do not show only target" then
		DoTimer_Settings.onlytarget = false
		DoTimer_AddMenuText(DOTIMER_CMD_ONLY_TARGET_OFF,fromgui)
	elseif msg == "names off" then
		DoTimer_Settings.names = false
		DoTimer_AddMenuText(DOTIMER_CMD_NAMES_OFF,fromgui)
		DoTimer_ResizeInterface()
	elseif msg == "names on" then
		DoTimer_Settings.names = true
		DoTimer_AddMenuText(DOTIMER_CMD_NAMES_ON,fromgui)
		DoTimer_ResizeInterface()
	elseif msg == "mana check on" then
		DoTimer_Settings.manacheck = true
		DoTimer_AddMenuText(DOTIMER_CMD_MANA_CHECK_ON,fromgui)
	elseif msg == "mana check off" then
		DoTimer_Settings.manacheck = false
		DoTimer_AddMenuText(DOTIMER_CMD_MANA_CHECK_OFF,fromgui)
	elseif msg == "lock" then
		DoTimer_Settings.locked = true
		DoTimerAnchorFrame:Hide()
		DoTimer_AddMenuText(DOTIMER_CMD_LOCK,fromgui)
	elseif msg == "unlock" then
		DoTimer_Settings.locked = false
		DoTimerAnchorFrame:Show()
		DoTimer_AddMenuText(DOTIMER_CMD_UNLOCK,fromgui)
	elseif msg == "immol" then
		if preventingimmol then
			preventingimmol = nil
			DoTimer_AddMenuText(DOTIMER_CMD_IMMOL_OFF,fromgui)
		else
			preventingimmol = 1
			DoTimer_AddMenuText(DOTIMER_CMD_IMMOL_ON,fromgui)
		end
	elseif msg == "hide" then
		DoTimer_DelTimers()
	elseif msg == "show levels" then
		DoTimer_Settings.levels = true
		DoTimer_AddMenuText(DOTIMER_CMD_LEVELS_ON,fromgui)
	elseif msg == "no levels" then
		DoTimer_Settings.levels = false
		DoTimer_AddMenuText(DOTIMER_CMD_LEVELS_OFF,fromgui)
	elseif msg == "sort by remaining" then
		DoTimer_AddMenuText(DOTIMER_CMD_SORT_REMAINING,fromgui)
		DoTimer_Settings.sortbyadded = false
	elseif msg == "sort by added" then
		DoTimer_AddMenuText(DOTIMER_CMD_SORT_ADDED,fromgui)
		DoTimer_Settings.sortbyadded = true
	elseif msg == "clickable debuffs" then
		DoTimer_Settings.clickable = true
		DoTimer_AddMenuText(DOTIMER_CMD_CLICKABLE_DEBUFFS_ON,fromgui)
	elseif msg == "unclickable debuffs" then
		DoTimer_Settings.clickable = false
		DoTimer_AddMenuText(DOTIMER_CMD_CLICKABLE_DEBUFFS_OFF,fromgui)
	elseif msg == "no expire alert" then
		DoTimer_Settings.expalert = false
		DoTimer_AddMenuText(DOTIMER_CMD_EXPIRE_ALERT_OFF,fromgui)
	elseif msg == "expire alert" then
		DoTimer_Settings.expalert = true
		DoTimer_AddMenuText(DOTIMER_CMD_EXPIRE_ALERT_ON,fromgui)
	elseif msg == "show preventing immols" then
		DoTimer_AddText(DOTIMER_CMD_PREVENTING_IMMOLS)
		for index,value in pairs(DoTimer_Settings.preventimmol) do DoTimer_AddText(index) end
	elseif msg == "old timers" then
		DoTimer_Settings.dep = true
		DoTimer_AddMenuText(DOTIMER_CMD_OLD_TIMERS_ON,fromgui)
	elseif msg == "no old timers" then
		DoTimer_Settings.dep = false
		DoTimer_AddMenuText(DOTIMER_CMD_OLD_TIMERS_OFF,fromgui)
	elseif msg == "do not include probable" then
		DoTimer_Settings.probable = false
		DoTimer_AddMenuText(DOTIMER_CMD_INCLUDE_PROBABLE_OFF,fromgui)
	elseif msg == "include probable" then
		DoTimer_Settings.probable = true
		DoTimer_AddMenuText(DOTIMER_CMD_INCLUDE_PROBABLE_ON,fromgui)
	elseif msg == "all ghost on" then
		DoTimer_Settings.allghost = true
		DoTimer_AddMenuText(DOTIMER_CMD_GHOST_ON,fromgui)
	elseif msg == "all ghost off" then
		DoTimer_Settings.allghost = false
		DoTimer_AddMenuText(DOTIMER_CMD_GHOST_OFF,fromgui)
	elseif msg == "separate ghosts" then
		DoTimer_Settings.sepghost = true
		DoTimer_AddMenuText(DOTIMER_CMD_SEPARATE_GHOST_ON,fromgui)
	elseif msg == "do not separate ghosts" then
		DoTimer_Settings.sepghost = false
		DoTimer_AddMenuText(DOTIMER_CMD_SEPARATE_GHOST_OFF,fromgui)
	elseif msg == "status" then
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG1)
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG2..tostring(DoTimer_Settings.status).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG3..tostring(DoTimer_Settings.scale).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG4..tostring(DoTimer_Settings.visible).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG5..tostring(DoTimer_Settings.names).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG6..tostring(DoTimer_Settings.manacheck).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG7..tostring(DoTimer_Settings.maxtargets).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG8..tostring(DoTimer_Settings.maxdebuffs).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG9..tostring(DoTimer_Settings.locked).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG10..tostring(DoTimer_Settings.targetlayout).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG11..tostring(DoTimer_Settings.debufflayout).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG12..tostring(DoTimer_Settings.sortbyadded).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG13..tostring(DoTimer_Settings.clickable).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG14..tostring(DoTimer_Settings.buttonscale).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG15..tostring(DoTimer_Settings.expalert).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG16..tostring(DoTimer_Settings.dep).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG17..tostring(DoTimer_Settings.probable).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG18..tostring(DoTimer_Settings.lifetaprank).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG19..tostring(DoTimer_Settings.allghost).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG20..tostring(DoTimer_Settings.sepghost).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG21..tostring(DoTimer_Settings.levels).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG22..tostring(DoTimer_Settings.onlytarget).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG23..tostring(DoTimer_Settings.playsound).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG24..tostring(DoTimer_Settings.conflag).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG25..tostring(DoTimer_Settings.format).."|r")
		DoTimer_AddText(DOTIMER_CMD_STATUS_MSG26..tostring(DoTimer_Settings.barlength).."|r")
	elseif string.sub(msg,1,11) == "set layout " then
		local targetlayout,debufflayout = SpellSystem_ParseString(msg,"(%a+)",-2)
		DoTimer_AddMenuText(DOTIMER_CMD_SET_LAYOUT1..(targetlayout or "<cannot parse!>")..DOTIMER_CMD_SET_LAYOUT2..(debufflayout or "<cannot parse!>"),fromgui)
		DoTimer_DefineInterface(targetlayout,debufflayout)
	elseif string.sub(msg,1,4) == "show" then
		local num1,num2 = SpellSystem_ParseString(msg,"(%d+)",2)
		DoTimer_AddTimers(num1,num2)
	elseif string.sub(msg,1,5) == "debug" then
		DoTimer_DebugChannel = SpellSystem_ParseString(msg,"(%d+)")
		if not DoTimer_DebugChannel then DoTimer_DebugChannel = "" end
		DoTimer_AddMenuText(DOTIMER_CMD_DEBUG_ON,fromgui)
	elseif string.sub(msg,1,5) == "scale" then
		local scale = string.sub(msg,7)
		if type(tonumber(scale)) == "number" then
			scale = tonumber(string.format("%.2f",scale))
			DoTimerMainFrame:SetScale(scale)
			DoTimer_Settings.scale = scale
			DoTimer_AddMenuText(DOTIMER_CMD_SCALE..scale,fromgui)
			DoTimer_ResizeInterface()
		end
	elseif string.sub(msg,1,11) == "bar length " then
		local number = tonumber(string.sub(msg,12))
		if type(number) == "number" and number >= 50 and number <= 250 then
			DoTimer_Settings.barlength = number
			DoTimer_DefineFormat()
			DoTimer_AddMenuText(DOTIMER_CMD_BAR_LENGHT..number,fromgui)
		end
	elseif string.sub(msg,1,11) == "max targets" then
		local number = tonumber(string.sub(msg,12))
		if type(number) == "number" and number > 0 and number < 11 then
			DoTimer_Settings.maxtargets = number
			DoTimer_AddMenuText(DOTIMER_CMD_MAX_TARGET..number,fromgui)
		end
	elseif string.sub(msg,1,9) == "simulate " then
		local spell,target = SpellSystem_ParseString(msg,"simulate (.+) on (.+)")
		if spell and target and DoTimer_intable(spell,spells) then DoTimer_SimulateTimer(spell,target) end
	elseif string.sub(msg,1,12) == "max debuffs " then
		local number = tonumber(string.sub(msg,13))
		if type(number) == "number" and number > 0 and number < 21 then
			DoTimer_Settings.maxdebuffs = number
			DoTimer_AddMenuText(DOTIMER_CMD_MAX_DEBUFFS..number,fromgui)
		end
	elseif string.sub(msg,1,13) == "button scale " then
		local scale = string.sub(msg,14)
		if type(tonumber(scale)) == "number" then 
			scale = tonumber(string.format("%.2f",scale))
			DoTimer_Settings.buttonscale = scale
			DoTimer_AddMenuText(DOTIMER_CMD_BUTTON_SCALE..scale,fromgui)
			DoTimer_ResizeInterface()
		end	
	elseif string.sub(msg,1,14) == "life tap rank " then
		local rank = string.sub(msg,15)
		if type(tonumber(rank)) == "number" or rank == "max" then
			DoTimer_Settings.lifetaprank = rank
			DoTimer_AddMenuText(DOTIMER_CMD_LIFE_TAP_RANK..rank,fromgui)
		end
	elseif string.sub(msg,1,17) == "prevent immol on " then
		local target = string.sub(msg,18)
		DoTimer_Settings.preventimmol[target] = 1
		DoTimer_AddMenuText(DOTIMER_CMD_PREVENT_IMMOL_ON..target,fromgui)
	elseif string.sub(msg,1,19) == "unprevent immol on " then
		local target = string.sub(msg,20)
		DoTimer_Settings.preventimmol[target] = nil
		DoTimer_AddMenuText(DOTIMER_CMD_UNPREVENT_IMMOL_ON..target,fromgui)
	elseif string.sub(msg,1,4) == "help" then DoTimer_AddHelpMenu(msg)
	else
		DoTimer_AddMenuText(DOTIMER_CMD_UNKNOWN_CMD,fromgui)
	end
end


function DoTimer_Startup() --called on first login per session, creates the default settings if needed or else just hides the interface and sets the scale
	loaded = 1
	if DoTimer_Settings.status == nil then 
		DoTimer_Settings.status = "on" 
		DoTimerAnchorFrameFirstUse:Show()
		DoTimerAnchorFrameFirstUse:SetText(DOTIMER_CMD_FIRST_USE)
	end
	local _,classname = UnitClass("player")
	class = classname
	spells,petspells,healspells,enslavespells = DoTimer_DefineSpells(class)
	if DoTimer_Settings.scale == nil then DoTimer_Settings.scale = 1 end --setting the default settings
	if DoTimer_Settings.visible == nil then DoTimer_Settings.visible = true end
	if DoTimer_Settings.names == nil then DoTimer_Settings.names = true end
	if DoTimer_Settings.manacheck == nil then DoTimer_Settings.manacheck = false end
	if DoTimer_Settings.maxtargets == nil then DoTimer_Settings.maxtargets = 5 end
	if DoTimer_Settings.maxdebuffs == nil then DoTimer_Settings.maxdebuffs = 8 end
	if DoTimer_Settings.locked == nil then DoTimer_Settings.locked = false end
	if DoTimer_Settings.targetlayout == nil then DoTimer_Settings.targetlayout = "left" end
	if DoTimer_Settings.debufflayout == nil then DoTimer_Settings.debufflayout = "down" end
	if DoTimer_Settings.sortbyadded == nil then DoTimer_Settings.sortbyadded = true end
	if DoTimer_Settings.clickable == nil then DoTimer_Settings.clickable = true end
	if DoTimer_Settings.expalert == nil then DoTimer_Settings.expalert = true end
	if DoTimer_Settings.buttonscale == nil then DoTimer_Settings.buttonscale = 1 end
	if DoTimer_Settings.dep == nil then DoTimer_Settings.dep = true end
	if DoTimer_Settings.probable == nil then DoTimer_Settings.probable = true end
	if DoTimer_Settings.lifetaprank == nil then DoTimer_Settings.lifetaprank = "max" end
	if DoTimer_Settings.allghost == nil then DoTimer_Settings.allghost = false end
	if DoTimer_Settings.sepghost == nil then DoTimer_Settings.sepghost = true end
	if DoTimer_Settings.levels == nil then DoTimer_Settings.levels = true end
	if DoTimer_Settings.onlytarget == nil then DoTimer_Settings.onlytarget = false end
	if DoTimer_Settings.playsound == nil then DoTimer_Settings.playsound = false end
	if DoTimer_Settings.conflag == nil then DoTimer_Settings.conflag = false end
	if DoTimer_Settings.format == nil then DoTimer_Settings.format = "icons" end
	if DoTimer_Settings.barlength == nil then DoTimer_Settings.barlength = 150 end
	if DoTimer_Settings.preventimmol == nil then DoTimer_Settings.preventimmol = { --the ones i can think of off the top of my head
		["Ragnaros"] = 1,
		["Onyxia"] = 1,
		["Nefarian"] = 1,
		["Ebonroc"] = 1,
		["Flamegor"] = 1,
		["Firemaw"] = 1,
		["Baron Geddon"] = 1,
		["Firelord"] = 1,
	} 
	end
	if DoTimer_Settings.visible then DoTimerMainFrame:Show() else DoTimerMainFrame:Hide() end --obeying a couple  settings
	DoTimerMainFrame:SetScale(DoTimer_Settings.scale)
	for i = 1,10 do
		getglobal("DoTimerTarget"..i):Hide()
		for id = 1,20 do
			getglobal("DoTimerTarget"..i.."Debuff"..id):Hide()
		end
	end
	DoTimer_DefineFormat()
	if DoTimer_Settings.locked then DoTimerAnchorFrame:Hide() else DoTimerAnchorFrame:Show() end
	if DoTimer_Settings.status == "off" then DoTimerFrame:SetScript("OnEvent",nil) end
	DoTimer_DefineInterface(DoTimer_Settings.targetlayout,DoTimer_Settings.debufflayout,1)
end

function DoTimer_AddHelpMenu(msg) --the help menu displayed ingame
	if msg == "help general" then
		DoTimer_AddText(DOTIMER_CMD_HELP_GENERAL_MSG1)
		DoTimer_AddText(DOTIMER_CMD_HELP_GENERAL_MSG2)
		DoTimer_AddText(DOTIMER_CMD_HELP_GENERAL_MSG3)
		DoTimer_AddText(DOTIMER_CMD_HELP_GENERAL_MSG4)
		DoTimer_AddText(DOTIMER_CMD_HELP_GENERAL_MSG5)
	elseif msg == "help sizing" then
		DoTimer_AddText(DOTIMER_CMD_HELP_SIZING_MSG1)
		DoTimer_AddText(DOTIMER_CMD_HELP_SIZING_MSG2)
		DoTimer_AddText(DOTIMER_CMD_HELP_SIZING_MSG3)
	elseif msg == "help basic interface" then
		DoTimer_AddText(DOTIMER_CMD_HELP_BASIC_INT_MSG1)
		DoTimer_AddText(DOTIMER_CMD_HELP_BASIC_INT_MSG2)
		DoTimer_AddText(DOTIMER_CMD_HELP_BASIC_INT_MSG3)
		DoTimer_AddText(DOTIMER_CMD_HELP_BASIC_INT_MSG4)
		DoTimer_AddText(DOTIMER_CMD_HELP_BASIC_INT_MSG5)
	elseif msg == "help advanced interface" then
		DoTimer_AddText(DOTIMER_CMD_HELP_ADVANCED_INT_MSG1)
		DoTimer_AddText(DOTIMER_CMD_HELP_ADVANCED_INT_MSG2)
		DoTimer_AddText(DOTIMER_CMD_HELP_ADVANCED_INT_MSG3)
		DoTimer_AddText(DOTIMER_CMD_HELP_ADVANCED_INT_MSG4)
		DoTimer_AddText(DOTIMER_CMD_HELP_ADVANCED_INT_MSG5)
		DoTimer_AddText(DOTIMER_CMD_HELP_ADVANCED_INT_MSG6)
		DoTimer_AddText(DOTIMER_CMD_HELP_ADVANCED_INT_MSG7)
		DoTimer_AddText(DOTIMER_CMD_HELP_ADVANCED_INT_MSG8)
		DoTimer_AddText(DOTIMER_CMD_HELP_ADVANCED_INT_MSG9)
		DoTimer_AddText(DOTIMER_CMD_HELP_ADVANCED_INT_MSG10)
		DoTimer_AddText(DOTIMER_CMD_HELP_ADVANCED_INT_MSG11)
		DoTimer_AddText(DOTIMER_CMD_HELP_ADVANCED_INT_MSG12)
		DoTimer_AddText(DOTIMER_CMD_HELP_ADVANCED_INT_MSG13)
		DoTimer_AddText(DOTIMER_CMD_HELP_ADVANCED_INT_MSG14)
		DoTimer_AddText(DOTIMER_CMD_HELP_ADVANCED_INT_MSG15)
	elseif msg == "help misc" then
		DoTimer_AddText(DOTIMER_CMD_HELP_MISC_MSG1)
		DoTimer_AddText(DOTIMER_CMD_HELP_MISC_MSG2)
		DoTimer_AddText(DOTIMER_CMD_HELP_MISC_MSG3)
		DoTimer_AddText(DOTIMER_CMD_HELP_MISC_MSG4)
		DoTimer_AddText(DOTIMER_CMD_HELP_MISC_MSG5)
		DoTimer_AddText(DOTIMER_CMD_HELP_MISC_MSG6)
		DoTimer_AddText(DOTIMER_CMD_HELP_MISC_MSG7)
		DoTimer_AddText(DOTIMER_CMD_HELP_MISC_MSG8)
		DoTimer_AddText(DOTIMER_CMD_HELP_MISC_MSG9)
		DoTimer_AddText(DOTIMER_CMD_HELP_MISC_MSG10)
		DoTimer_AddText(DOTIMER_CMD_HELP_MISC_MSG11)
	elseif msg == "help resetting" then
		DoTimer_AddText(DOTIMER_CMD_HELP_RESETTING_MSG1)
		DoTimer_AddText(DOTIMER_CMD_HELP_RESETTING_MSG2)
		DoTimer_AddText(DOTIMER_CMD_HELP_RESETTING_MSG3)
	elseif msg == "help version" then
		DoTimer_AddText(DOTIMER_CMD_HELP_VERSION_MSG1)
		DoTimer_AddText(DOTIMER_CMD_HELP_VERSION_MSG2..version)
		DoTimer_AddText(DOTIMER_CMD_HELP_VERSION_MSG3..date_uploaded)
		DoTimer_AddText(DOTIMER_CMD_HELP_VERSION_MSG4)
		DoTimer_AddText(DOTIMER_CMD_HELP_VERSION_MSG5)
	elseif msg == "help info" then
		DoTimer_AddText(DOTIMER_CMD_HELP_INFO_MSG1)
		DoTimer_AddText(DOTIMER_CMD_HELP_INFO_MSG2)
		DoTimer_AddText(DOTIMER_CMD_HELP_INFO_MSG3)
		DoTimer_AddText(DOTIMER_CMD_HELP_INFO_MSG4)
		DoTimer_AddText(DOTIMER_CMD_HELP_INFO_MSG5)
		DoTimer_AddText(DOTIMER_CMD_HELP_INFO_MSG6)
		DoTimer_AddText(DOTIMER_CMD_HELP_INFO_MSG7)
		DoTimer_AddText(DOTIMER_CMD_HELP_INFO_MSG8)
		DoTimer_AddText(DOTIMER_CMD_HELP_INFO_MSG9)
		DoTimer_AddText(DOTIMER_CMD_HELP_INFO_MSG10)
		DoTimer_AddText(DOTIMER_CMD_HELP_INFO_MSG11)
		DoTimer_AddText(DOTIMER_CMD_HELP_INFO_MSG12)
	elseif msg == "help new" then
		DoTimer_AddText(DOTIMER_CMD_HELP_NEW_MSG1)
		DoTimer_AddText(DOTIMER_CMD_HELP_NEW_MSG2)
		DoTimer_AddText(DOTIMER_CMD_HELP_NEW_MSG3)
		DoTimer_AddText(DOTIMER_CMD_HELP_NEW_MSG4)
		DoTimer_AddText(DOTIMER_CMD_HELP_NEW_MSG5)
		DoTimer_AddText(DOTIMER_CMD_HELP_NEW_MSG6)
	elseif msg == "help macros" then
		DoTimer_AddText(DOTIMER_CMD_HELP_MACROS_MSG1)
		DoTimer_AddText(DOTIMER_CMD_HELP_MACROS_MSG2)
		DoTimer_AddText(DOTIMER_CMD_HELP_MACROS_MSG3)
		DoTimer_AddText(DOTIMER_CMD_HELP_MACROS_MSG4)
		DoTimer_AddText(DOTIMER_CMD_HELP_MACROS_MSG5)
		DoTimer_AddText(DOTIMER_CMD_HELP_MACROS_MSG6)
		DoTimer_AddText(DOTIMER_CMD_HELP_MACROS_MSG7)
		DoTimer_AddText(DOTIMER_CMD_HELP_MACROS_MSG8)
	elseif msg == "help other cmds" then
		DoTimer_AddText(DOTIMER_CMD_HELP_OTHER_CMD_MSG1)
		DoTimer_AddText(DOTIMER_CMD_HELP_OTHER_CMD_MSG2)
		DoTimer_AddText(DOTIMER_CMD_HELP_OTHER_CMD_MSG3)
		DoTimer_AddText(DOTIMER_CMD_HELP_OTHER_CMD_MSG4)
		DoTimer_AddText(DOTIMER_CMD_HELP_OTHER_CMD_MSG5)
	else
		DoTimer_AddText(DOTIMER_CMD_HELP_MSG1)
		DoTimer_AddText(DOTIMER_CMD_HELP_MSG2)
		DoTimer_AddText(DOTIMER_CMD_HELP_MSG3)
		DoTimer_AddText(DOTIMER_CMD_HELP_MSG4)
		DoTimer_AddText(DOTIMER_CMD_HELP_MSG5)
		DoTimer_AddText(DOTIMER_CMD_HELP_MSG6)
		DoTimer_AddText(DOTIMER_CMD_HELP_MSG7)
		DoTimer_AddText(DOTIMER_CMD_HELP_MSG8)
		DoTimer_AddText(DOTIMER_CMD_HELP_MSG9)
		DoTimer_AddText(DOTIMER_CMD_HELP_MSG10)
		DoTimer_AddText(DOTIMER_CMD_HELP_MSG11)
	end
end

function DoTimer_FakeInterface() -- used to make the screenshot, yay!
	casted = {
		[1] = {
			["target"] = "Scary Mob",
			["level"] = 63,
			["sex"] = 0,
			["type"] = "mob",
			[1] = {
				["spell"] = "Curse of Agony",
				["rank"] = "Rank 6",
				["duration"] = 24,
				["time"] = GetTime() - 15,
				["texture"] = "Interface\\Icons\\Spell_Shadow_CurseOfSargeras",
				["type"] = "debuff",
				["english"] = "Curse of Agony",
			},
			[2] = {
				["spell"] = "Corruption",
				["rank"] = "Rank 7",
				["duration"] = 18,
				["time"] = GetTime(),
				["texture"] = "Interface\\Icons\\Spell_Shadow_AbominationExplosion",
				["type"] = "debuff",
				["english"] = "Corruption",
			},
			[3] = {
				["spell"] = "Immolate",
				["rank"] = "Rank 8",
				["duration"] = 15,
				["time"] = GetTime() - 11,
				["texture"] = "Interface\\Icons\\Spell_Fire_Immolation",
				["type"] = "debuff",
				["english"] = "Immolate",
				["dep"] = 1,
			},
		},
		[2] = {
			["target"] = "Scary Player",
			["level"] = 60,
			["sex"] = 0,
			["type"] = "player",
			[1] = {
				["spell"] = "Curse of Shadow",
				["rank"] = "Rank 2",
				["duration"] = 300,
				["time"] = GetTime() - 120,
				["texture"] = "Interface\\Icons\\Spell_Shadow_CurseOfAchimonde",
				["type"] = "debuff",
				["english"] = "Curse of Shadow",
			},
			[2] = {
				["spell"] = "Corruption",
				["rank"] = "Rank 7",
				["duration"] = 0,
				["time"] = GetTime(),
				["texture"] = "Interface\\Icons\\Spell_Shadow_AbominationExplosion",
				["type"] = "ghost",
				["english"] = "Corruption",
			},
			[3] = {
				["spell"] = "Spell Lock",
				["rank"] = "",
				["duration"] = 8,
				["time"] = GetTime() - 2,
				["texture"] = "Interface\\Icons\\Spell_Shadow_MindRot",
				["type"] = "pet",
				["english"] = "Spell Lock",
			},
		},
	}
	DoTimer_CreateInterface()
end

function DoTimer_DebugSS()
	local f = CreateFrame("Frame")
	f:SetScript("OnEvent",function()
		DoTimer_Debug(event..": "..arg1)
	end)
	SpellSystem_RegisterEvent(f,"SPELLSYSTEM_TIMEOUT")
	SpellSystem_RegisterEvent(f,"SPELLSYSTEM_NEEDTARGET")
	SpellSystem_RegisterEvent(f,"SPELLSYSTEM_BEGIN")
	SpellSystem_RegisterEvent(f,"SPELLSYSTEM_FAILBEFORE")
	SpellSystem_RegisterEvent(f,"SPELLSYSTEM_STOP")
	SpellSystem_RegisterEvent(f,"SPELLSYSTEM_SUCCESS")
	SpellSystem_RegisterEvent(f,"SPELLSYSTEM_FAILAFTER")
	SpellSystem_RegisterEvent(f,"SPELLSYSTEM_NOTARGET")
end
