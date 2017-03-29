-- Modified version of spellCastingCore by kuuurtz
-- https://github.com/zetone/enemyFrames

if FSPELLCASTINGCOREgetDebuffs then return end

local Cast 			= {} 		local casts 		= {}
local InstaBuff 	= {} 		local iBuffs 		= {}
local buff 			= {} 		local buffList 		= {}
Cast.__index   		= Cast
InstaBuff.__index 	= InstaBuff
buff.__index 		= buff

local Focus
local L = FocusData_Locale
local playerName = UnitName("player")

-- Upvalues
local FOCUS_CHANNELED_SPELLCASTS_TO_TRACK, FOCUS_INSTANT_SPELLCASTS_TO_TRACK =
	  FOCUS_CHANNELED_SPELLCASTS_TO_TRACK, FOCUS_INSTANT_SPELLCASTS_TO_TRACK

local FOCUS_SPELLCASTS_TO_TRACK, FOCUS_TRADECASTS_TO_TRACK =
	  FOCUS_SPELLCASTS_TO_TRACK, FOCUS_TRADECASTS_TO_TRACK

local FOCUS_BUFFS_TO_TRACK, FOCUS_BORDER_DEBUFFS_COLOR =
	  FOCUS_BUFFS_TO_TRACK, FOCUS_BORDER_DEBUFFS_COLOR

local tinsert, tremove, strfind, gsub, ipairs, pairs, GetTime, GetNetStats, setmetatable, tgetn =
	  table.insert, table.remove, string.find, string.gsub, ipairs, pairs, GetTime, GetNetStats, setmetatable, table.getn

Cast.create = function(caster, spell, info, timeMod, time, inv)
	local acnt = {
		caster		= caster,
		spell		= spell,
		icon		= info.icon,
		timeStart	= time,
		timeEnd		= time + info.casttime * timeMod,
		tick		= info.tick or 0,
		inverse		= inv,
		immune		= info.immune
	}

	acnt.nextTick = info.tick and time + acnt.tick or acnt.timeEnd
	setmetatable(acnt, Cast)

	return acnt
end

InstaBuff.create = function(c, b, list, time)
   local acnt = {
	   caster		= c,
	   spell		= b,
	   timeMod		= list.mod,
	   spellList	= list.list,
	   timeStart	= time,
	   timeEnd		= time + 10
   }

   setmetatable(acnt, InstaBuff)

   return acnt
end

buff.create = function(tar, t, s, buffType, factor, time, texture, debuff, magictype, debuffStack)
	if not buffType then
		buffType = {}
	end
	buffType.type = magictype and strlower(magictype) or strlower(buffType.type or "none")

	local acnt = {
		target		= tar,
		caster		= tar,
		spell		= t,
		stacks		= debuffStack or s or 0,
		icon		= texture or buffType.icon,
		timeStart	= time,
		timeEnd		= 0, -- TODO remove
		prio		= buffType.prio or 0,
		border		= FOCUS_BORDER_DEBUFFS_COLOR[buffType.type],
		display		= true,	-- TODO remove
		btype		= debuff,
		debuffType	= buffType.type,
	}

	setmetatable(acnt, buff)

	return acnt
end

local getAvgLatency = function()
	local _, _, lat = GetNetStats()
	return lat / 1000
end

local getTimeMinusPing = function()
	return GetTime() - 0.1 -- getAvgLatency() -- standby for now
end

local removeExpiredTableEntries = function(time, tab)
	local i = 1
	for k, v in pairs(tab) do
		if time > v.timeEnd then
			tremove(tab, i)
		end
		i = i + 1
	end
end

local forceHideTableItem = function(tab, caster, spell, debuffsOnly)
	local i = 1

	for k, v in pairs(tab) do
		if v.caster == caster then
			if not spell then
				-- Remove all debuffs only
				if debuffsOnly then
					if v.btype then
						tremove(tab, i)
					end
				else
					tremove(tab, i)
				end
			else
				if v.spell == spell then
					if debuffsOnly then
						if v.btype then
							tremove(tab, i)
						end
					else
						tremove(tab, i)
					end
				end
			end
		end

		i = i + 1
	end

	--[[if spell == L["Feign Death"] then
		print("clear")
		Focus:ClearData("feignDeath")
	end]]

	if tab == buffList and Focus:UnitIsFocus(caster, true) then
		-- triggers UNIT_AURA for focus
		Focus:SetData("auraUpdate", 1)
	end
end

local lastCleared = GetTime()
local tableMaintenance = function(reset)
	if reset then
		casts = {}
		iBuffs = {}
		buffList = {}
		return
	end

	-- CASTS -- casts have a different removal parameter
	local getTime = GetTime()
	local latency = getAvgLatency()
	local i = 1
	for k, v in pairs(casts) do
		if getTime > v.timeEnd or getTime > v.nextTick + latency then -- channeling cast verification
			tremove(casts, i)
		end
		i = i + 1
	end

	removeExpiredTableEntries(getTime, iBuffs) -- casting speed buffs

	-- Remove focus auras if focus is dead
	if CURR_FOCUS_TARGET and Focus:IsDead() then
		-- need to call this in OnUpdate to avoid buffs not being removed due to data
		-- race conditions from events
		forceHideTableItem(buffList, CURR_FOCUS_TARGET)
	end

	if not CURR_FOCUS_TARGET then
		-- Delete ALL buffs every X sec when there is no focus target
		-- This is needed to remove buffs that fail to expire due to no combat event found
		if getTime - lastCleared > 60 then
			if tgetn(buffList) >= 1 then
				if not UnitAffectingCombat("player") then
					buffList = {}
				end
			end
			lastCleared = getTime
		end
	end
end

local removeDoubleCast = function(caster)
	local k = 1
	for i, j in casts do
		if j.caster == caster then tremove(casts, k) end
		k = k + 1
	end
end

local checkForChannels = function(caster, spell)
	local k = 1
	for i, j in casts do
		if j.caster == caster and j.spell == spell then
			j.nextTick = GetTime() + j.tick
			return true
		end
		k = k + 1
	end
	return false
end

local checkforCastTimeModBuffs = function(caster, spell)
	local k = 1
	for i, j in iBuffs do
		if j.caster == caster then
			if j.spellList[1] ~= "all" then
				local a, lastT = 1, 1
				for b, c in j.spellList do
					if c == spell then
						if lastT ~= 0 then -- priority to buffs that proc instant cast
							lastT = j.timeMod
						end
					end
				end
				return lastT
			else
				return j.timeMod
			end
		end
		k = k + 1
	end

	return 1
end

local newCast = function(caster, spell, channel)
	local getTime = getTimeMinusPing()
	local info

	if channel then
		if FOCUS_CHANNELED_SPELLCASTS_TO_TRACK[spell] then
			info = FOCUS_CHANNELED_SPELLCASTS_TO_TRACK[spell]
		end
	else
		removeDoubleCast(caster)
		if FOCUS_SPELLCASTS_TO_TRACK[spell] then
			info = FOCUS_SPELLCASTS_TO_TRACK[spell]
		else
			info = FOCUS_TRADECASTS_TO_TRACK[spell]
		end
	end

	if info then
		if not checkForChannels(caster, spell) then
			removeDoubleCast(caster)
			local tMod = checkforCastTimeModBuffs(caster, spell)
			if tMod > 0 then
				local n = Cast.create(caster, spell, info, tMod, getTime, channel)
				tinsert(casts, n)
			end
		end
	end
end

local newIBuff = function(caster, buff)
	local getTime = getTimeMinusPing()
	local b = InstaBuff.create(caster, buff, FOCUS_TIME_MODIFIER_BUFFS_TO_TRACK[buff], getTime)
	tinsert(iBuffs, b)
end

local function newbuff(tar, b, s, castOn, texture, debuff, magictype, debuffStack, noEvent)
	local getTime = getTimeMinusPing()

	-- remove buff if it exists
	local i = 1
	for k, v in pairs(buffList) do
		if v.caster == tar and v.spell == b then
			-- return?
			-- breaks when diff buffs have same name i.e noggenfogger
			tremove(buffList, i)
			break
		end
		i = i + 1
	end

	local n = buff.create(tar, b, s, FOCUS_BUFFS_TO_TRACK[b], 1, getTime, texture, debuff, magictype, debuffStack)
	tinsert(buffList, n)

	if not noEvent then
		if Focus:UnitIsFocus(tar, true) then
			--[[if texture == "Interface\Icons\Ability_Rogue_FeignDeath" then
				print("set")
				Focus:SetData("feignDeath", 1)
			end]]
			-- triggers UNIT_AURA for focus
			Focus:SetData("auraUpdate", 1)
		end
	end
end

local function refreshBuff(tar, b, s)
	-- refresh if it exists
	for i, j in pairs(FOCUS_DEBUFF_REFRESHING_SPELLS[b]) do
		for k, v in pairs(buffList) do
			if v.caster == tar and v.spell == j then
				newbuff(tar, j, s, false, v.icon, v.btype, v.debuffType)
				return
			end
		end
	end
end

local CastCraftPerform = function()
	-- TODO loop
	local pcast 	= L['You cast (.+).']
	local cast		= L['(.+) casts (.+).']
	local bcast 	= L['(.+) begins to cast (.+).']
	local craft 	= L['(.+) -> (.+).']
	local perform 	= L['(.+) performs (.+).']
	local bperform 	= L['(.+) begins to perform (.+).']
	local performOn = L['(.+) performs (.+) on (.+).']
	local pcastFin 	= L['You cast (.+) on (.+).']
	local castFin 	= L['(.+) casts (.+) on (.+).']

	local fpcast = strfind(arg1, pcast)
	local fcast = strfind(arg1, cast)
	local fbcast = strfind(arg1, bcast)
	local fcraft = strfind(arg1, craft)
	local fperform = strfind(arg1, perform)
	local fbperform = strfind(arg1, bperform)
	local fperformOn = strfind(arg1, performOn)

	local fpcastFin = strfind(arg1, pcastFin)
	local fcastFin = strfind(arg1, castFin)

	if fbcast or fcraft then
		local m = fbcast and bcast or fcraft and craft or fperform and perform
		local c = gsub(arg1, m, '%1')
		local s = gsub(arg1, m, '%2')

		newCast(c, s, false)

	elseif fperform or fbperform or fperformOn then
		local m = fperform and perform or fbperform and bperform or fperformOn and performOn
		local c = gsub(arg1, m, '%1')
		local s = gsub(arg1, m, '%2')
		newCast(c, s, fperform and true or false)

	-- object spawn casts (totems, traps, etc)
	elseif fcast then
		local m = cast
		local c = gsub(arg1, m, '%1')
		local s = gsub(arg1, m, '%2')

		if FOCUS_SPELLCASTS_TO_TRACK[s] then
			newCast(c, s, false)
		else
			forceHideTableItem(casts, c, nil)
		end
	end

	return fcast or fbcast or fpcast or fperform or fbperform or fpcastFin or fcastFin or fperformOn
end

local processUniqueSpell = function()
	local vanish = L['(.+) performs Vanish']
	local fvanish = strfind(arg1, vanish)

	if fvanish then
		local c = gsub(arg1, vanish, "%1")

		for k, v in pairs(FOCUS_ROOTS_SNARES) do
			forceHideTableItem(buffList, c, k)
		end
	end

	return fvanish
end

local DirectInterrupt = function()
	local pintrr 	= L['You interrupt (.+)\'s (.+).']			local fpintrr  	= strfind(arg1, pintrr)
	local intrr 	= L['(.+) interrupts (.+)\'s (.+).']		local fintrr  	= strfind(arg1, pintrr)

	if fpintrr  or fintrr then
		local m = fpintrr and pintrr or intrr
		local t = fpintrr and gsub(arg1, m, '%1') or gsub(arg1, m, '%2')
		local s = fpintrr and gsub(arg1, m, '%2') or gsub(arg1, m, '%3')

		forceHideTableItem(casts, t, nil)
	end

	return fpintrr  or fintrr
end

local GainAfflict = function()
	local gain 		= L['(.+) gains (.+).']								local fgain = strfind(arg1, gain)
	local pgain 	= L['You gain (.+).']								local fpgain = strfind(arg1, pgain)
	local afflict 	= L['(.+) is afflicted by (.+).'] 					local fafflict = strfind(arg1, afflict)
	local pafflict 	= L['You are afflicted by (.+).'] 					local fpafflict = strfind(arg1, pafflict)

	-- start channeling based on buffs (evocation, first aid, ..)
	if fgain or fpgain then
		local m = fgain and gain or fpgain and pgain
		local c = fgain and gsub(arg1, m, '%1') or fpgain and playerName
		local s = fgain and gsub(arg1, m, '%2') or fpgain and gsub(arg1, m, '%1')

		-- buffs/debuffs to be displayed
		if FOCUS_BUFFS_TO_TRACK[s] then
			newbuff(c, s, 1, false)
		end
		-- self-cast buffs that interrupt cast (blink, ice block ...)
		if FOCUS_INTERRUPT_BUFFS_TO_TRACK[s] then
			forceHideTableItem(casts, c, nil)
		end
		-- specific channeled spells (evocation ...)
		if FOCUS_CHANNELED_SPELLCASTS_TO_TRACK[s] then
			newCast(c, s, true)
		end
		-- buffs that alter spell casting speed
		if FOCUS_TIME_MODIFIER_BUFFS_TO_TRACK[s] then
			newIBuff(c, s)
		end

	-- cast-interruting CC
	elseif fafflict or fpafflict then
		local m = fafflict and afflict or fpafflict and pafflict
		local c = fafflict and gsub(arg1, m, '%1') or fpafflict and playerName
		local s = fafflict and gsub(arg1, m, '%2') or fpafflict and gsub(arg1, m, '%1')

		-- rank & stacks
		local auxS, st = s, 1
		if not FOCUS_BUFFS_TO_TRACK[s] then
			local spellstacks = '(.+) %((.+)%)'
			if strfind(s, spellstacks) then
				s = gsub(s, spellstacks, '%1')
				st = tonumber(gsub(auxS, spellstacks, '%2'), 10)
			end
		end

		-- debuffs to be displayed
		if FOCUS_BUFFS_TO_TRACK[s] then
			--if st > 1 then
			--	refreshBuff(c, s, st)
			--else
				newbuff(c, s, st, false, nil, true)
			--end
		end

		s = auxS

		-- spell interrupting debuffs (stuns, incapacitates ...)
		if FOCUS_INTERRUPT_BUFFS_TO_TRACK[s] then
			forceHideTableItem(casts, c, nil)
		end

		-- debuffs that slow spellcasting speed (tongues ...)
		if FOCUS_TIME_MODIFIER_BUFFS_TO_TRACK[s] then
			newIBuff(c, s)
		end
	end

	return fgain or fpgain or fafflict or fpafflict
end

local FadeRem = function()
	local fade 		= L['(.+) fades from (.+).']						local ffade = strfind(arg1, fade)
	local rem 		= L['(.+)\'s (.+) is removed']						local frem = strfind(arg1, rem)
	local prem 		= L['Your (.+) is removed']							local fprem = strfind(arg1, prem)

	-- end channeling based on buffs (evocation ..)
	if ffade then
		local m = fade
		local c = gsub(arg1, m, '%2')
		local s = gsub(arg1, m, '%1')

		c = c == L['you'] and playerName or c

		-- buffs/debuffs to be displayed
		--if FOCUS_BUFFS_TO_TRACK[s] then
			forceHideTableItem(buffList, c, s)
		--end
		-- buff channeling casts fading
		if FOCUS_CHANNELED_SPELLCASTS_TO_TRACK[s] then
			forceHideTableItem(casts, c, nil)
		end

		if FOCUS_TIME_MODIFIER_BUFFS_TO_TRACK[s] then
			forceHideTableItem(iBuffs, c, s)
		end
	elseif frem or fprem then
		local m = frem and rem or fprem and prem
		local c = frem and gsub(arg1, m, '%1') or fprem and playerName
		local s = frem and gsub(arg1, m, '%2') or fprem and gsub(arg1, m, '%1')

		-- buffs/debuffs to be displayed
		--if FOCUS_BUFFS_TO_TRACK[s] then
			forceHideTableItem(buffList, c, s)
		--end

		if FOCUS_TIME_MODIFIER_BUFFS_TO_TRACK[s] then
			forceHideTableItem(iBuffs, c, s)
		end
	end

	return ffade or frem or fprem
end

--[[local function DelayCastTimer(caster, spell)
	if not caster or not spell then return end
	local pushbackDelay = 0.5
	local getTime = GetTime()

	for k, v in pairs(casts) do
		if v.caster == caster and v.spell == spell then
			v.timeEnd = v.timeEnd + pushbackDelay
		end
	end
end]]

local HitsCrits = function()
	local hits = L['(.+)\'s (.+) hits (.+) for (.+)'] 					local fhits = strfind(arg1, hits)
	local crits = L['(.+)\'s (.+) crits (.+) for (.+)'] 				local fcrits = strfind(arg1, crits)
	local absb = L['(.+)\'s (.+) is absorbed by (.+).']					local fabsb = strfind(arg1, absb)

	local phits = L['Your (.+) hits (.+) for (.+)'] 					local fphits = strfind(arg1, phits)
	local pcrits = L['Your (.+) crits (.+) for (.+)'] 					local fpcrits = strfind(arg1, pcrits)
	local pabsb = L['Your (.+) is absorbed by (.+).']					local fpabsb = strfind(arg1, pabsb)
	--local yphits = 'You hit (.+) for (.+).'							local fyphits = strfind(arg1, yphits)

	local channelDotRes = L["(.+)'s (.+) was resisted by (.+)."]		local fchannelDotRes = strfind(arg1, channelDotRes)
	local pchannelDotRes = L["(.+)'s (.+) was resisted."]				local fpchannelDotRes = strfind(arg1, pchannelDotRes)

	-- other hits/crits
	if fhits or fcrits or fabsb then
		local m = fhits and hits or fcrits and crits or fabsb and absb
		local c = gsub(arg1, m, '%1')
		local s = gsub(arg1, m, '%2')
		local t = gsub(arg1, m, '%3')

		t = t == L['you'] and playerName or t

		-- instant spells that cancel casted ones
		if FOCUS_INSTANT_SPELLCASTS_TO_TRACK[s] then
			forceHideTableItem(casts, c, nil)
		end

		--[[if not fabsb then
			DelayCastTimer(t, s)
		end]]
		if FOCUS_SPELLCASTS_TO_TRACK[s] then
			removeDoubleCast(c)
		end

		local channelSpell = FOCUS_CHANNELED_SPELLCASTS_TO_TRACK[s]
		if channelSpell and channelSpell.tick then
			newCast(c, s, true)
		end

		-- interrupt dmg spell
		if FOCUS_INTERRUPTS_TO_TRACK[s] then
			forceHideTableItem(casts, t, nil)
		end

		-- spells that refresh debuffs
		--[[if FOCUS_DEBUFF_REFRESHING_SPELLS[s] then
			refreshBuff(t, s)
		end]]
	end

	-- self hits/crits
	if fphits or fpcrits or fpabsb then
		local m = fphits and phits or fpcrits and pcrits or fpabsb and pabsb
		local s = gsub(arg1, m, '%1')
		local t = gsub(arg1, m, '%2')

		-- interrupt dmg spell
		if FOCUS_INTERRUPTS_TO_TRACK[s] then
			forceHideTableItem(casts, t, nil)
		--elseif not fpabsb then
		--	DelayCastTimer(t, s)
		end

		-- spells that refresh debuffs
		--[[if FOCUS_DEBUFF_REFRESHING_SPELLS[s] then
			refreshBuff(t, s)
		end]]
	end

	return fhits or fcrits or fphits or fpcrits or fabsb or fpabsb --or ffails
end

--[[local function IsArcaneMissiles(spell)
	local name = FOCUS_CHANNELED_SPELLCASTS_TO_TRACK[spell]
	if name == "Arcane Missile" or name == "Arcane Missiles" then
		return true
	end

	return false
end]]

local channelDot = function()
	local channelDot 	= L["(.+) suffers (.+) from (.+)'s (.+)."]		local fchannelDot = strfind(arg1, channelDot)
	local channelpDot 	= L['(.+) suffers (.+) from your (.+).']		local fchannelpDot	= strfind(arg1, channelpDot)
	local pchannelDot 	= L["You suffer (.+) from (.+)'s (.+)."]		local fpchannelDot = strfind(arg1, pchannelDot)

	local MDrain = L['(.+)\'s (.+) drains (.+) Mana from (.+)'] 			local fMDrain = strfind(arg1, MDrain)

	-- channeling dmg spells on other (mind flay, life drain(?))
	if fchannelDot then
		local m = channelDot
		local c = gsub(arg1, m, '%3')
		local s = gsub(arg1, m, '%4')
		local t = gsub(arg1, m, '%1')

		if FOCUS_CHANNELED_SPELLCASTS_TO_TRACK[s] then
			-- caster
			newCast(c, s, true)
		end

		-- target
		--[[if IsArcaneMissiles(s) then
			DelayCastTimer(t, s)
		end]]
	end

	-- channeling dmg spells on self (mind flay, life drain(?))
	if fpchannelDot then
		local m = pchannelDot
		local c = gsub(arg1, m, '%2')
		local s = gsub(arg1, m, '%3')

		if FOCUS_CHANNELED_SPELLCASTS_TO_TRACK[s] then
			newCast(c, s, true)
		end

		--[[if IsArcaneMissiles(s) then
			DelayCastTimer(t, s)
		end]]
	end

	-- drain mana
	if fMDrain then
		local m = MDrain
		local c = gsub(arg1, m, '%1')
		local s = gsub(arg1, m, '%2')

		if FOCUS_CHANNELED_SPELLCASTS_TO_TRACK[s] then
			--print(arg1)
			newCast(c, s, true)
		end
	end

	return fchannelDot or fpchannelDot or fchannelpDot or fMDrain
end

local playerDeath = function()
	local pdie 		= L.YOU_DIE						local fpdie		= strfind(arg1, pdie)
	local dies		= L['(.+) dies.']				local fdies		= strfind(arg1, dies)
	local slain 	= L['(.+) is slain by (.+).']	local fslain 	= strfind(arg1, slain)
	local pslain 	= L['You have slain (.+).']		local fpslain 	= strfind(arg1, pslain)

	if fpdie or fdies or fslain or fpslain then
		local m = fdies and dies or fslain and slain or fpslain and pslain
		local c = fpdie and playerName or gsub(arg1, m, '%1')

		if fpdie then
			--tableMaintenance(true) -- cleared on RELEASE_SPIRIT instead
		else
			forceHideTableItem(casts, c, nil)
			if Focus:GetName() ~= c then -- buffList is cleared in OnUpdate for focus
				forceHideTableItem(buffList, c, nil)
			end
		end
	end

	return fpdie or fdies or fslain or fpslain
end

local fear = function()
	local fear = strfind(arg1, L["(.+) attempts to run away in fear!"])

	if fear then
		local target = arg2
		forceHideTableItem(casts, target)
	end

	return fear
end

----------------------------------------------------------------------------

local parsingCheck = function(out, display)
	if (not out) and display then
		print('Parsing failed:')
		print(event)
		print(arg1)
	end
end

local combatlogParser = function()
	local pSpell 	= 'CHAT_MSG_SPELL_PERIODIC_(.+)'		local fpSpell 		= strfind(event, pSpell)
	local breakAura = 'CHAT_MSG_SPELL_BREAK_AURA'			local fbreakAura 	= strfind(event, breakAura)
	local auraGone	= 'CHAT_MSG_SPELL_AURA_GONE_(.+)'		local fauraGone 	= strfind(event, auraGone)
	local dSpell 	= 'CHAT_MSG_SPELL_(.+)'					local fdSpell 		= strfind(event, dSpell)
	local death		= 'CHAT_MSG_COMBAT_(.+)_DEATH'			local fdeath 		= strfind(event, death)
	local mEmote	= 'CHAT_MSG_MONSTER_EMOTE'				local fmEmote		= strfind(event, mEmote)

	-- periodic damage/buff spells
	if fpSpell then
		parsingCheck(channelDot() or GainAfflict(), false)
	-- fade/remove buffs
	elseif fbreakAura or fauraGone then
		parsingCheck(FadeRem(), false)
	-- direct damage/buff spells
	elseif fdSpell then
		parsingCheck(processUniqueSpell() or CastCraftPerform() or DirectInterrupt() or HitsCrits(), false)
	-- player death
	elseif fdeath then
		parsingCheck(playerDeath(), false)
	-- creature runs in fear
	elseif fmEmote then
		parsingCheck(fear(), false)
	else
		--print(event)
		--print(arg1)
	end
end

-- GLOBAL ACCESS FUNCTIONS

function FSPELLCASTINGCORENewBuff(tar, b, texture, debuff, magictype, debuffStack)
	newbuff(tar, b, 1, false, texture, debuff, magictype, debuffStack, true)
end

function FSPELLCASTINGCOREClearBuffs(caster, debuffsOnly)
	forceHideTableItem(buffList, caster, nil, debuffsOnly)
end

--[[function FSPELLCASTINGCOREGetLastBuffInfo(caster)
	local texture
	local i = 0

	for k, v in ipairs(buffList) do
		if v.target == caster then
			texture = v.icon
			i = i + 1
		end
	end

	return i, texture
end]]

FSPELLCASTINGCOREgetCast = function(caster)
	if caster then
		for k, v in pairs(casts) do
			if v.caster == caster then
				return v
			end
		end
	end

	return nil
end

do
	local list = { buffs = {}, debuffs = {} }

	FSPELLCASTINGCOREgetBuffs = function(caster) -- ran frequent
		if not caster then return end
		list.buffs = {} -- memory inefficient but much faster than wiping table
		list.debuffs = {}

		for k, v in ipairs(buffList) do
			if v.target == caster then
				if not v.btype then
					tinsert(list.buffs, v)
				else
					tinsert(list.debuffs, v)
				end
			end
		end

		return list
	end
end

------------------------------------

do
	local refresh, interval = 0, 0.39

	local function OnUpdate()
		refresh = refresh - arg1
		if refresh < 0 then
			tableMaintenance(false)
			refresh = interval
		end
	end

	local events = CreateFrame("Frame")
	local f = CreateFrame("Frame")
	events:RegisterEvent("VARIABLES_LOADED")
	events:SetScript("OnEvent", function()
		if event == "VARIABLES_LOADED" then
			Focus = getglobal("FocusData")
			events:UnregisterEvent("VARIABLES_LOADED")
			events:RegisterEvent("PLAYER_ENTERING_WORLD")
			events:RegisterEvent("PLAYER_ALIVE") -- Releases from death to a graveyard
			events:SetScript("OnUpdate", OnUpdate)
			f:SetScript("OnEvent", combatlogParser)
		else
			tableMaintenance(true)
		end
	end)

	f:RegisterEvent'CHAT_MSG_MONSTER_EMOTE'
	--[[f:RegisterEvent'CHAT_MSG_COMBAT_SELF_HITS'
	f:RegisterEvent'CHAT_MSG_COMBAT_SELF_MISSES'
	f:RegisterEvent'CHAT_MSG_COMBAT_PARTY_HITS'
	f:RegisterEvent'CHAT_MSG_COMBAT_PARTY_MISSES'
	f:RegisterEvent'CHAT_MSG_COMBAT_FRIENDLYPLAYER_HITS'
	f:RegisterEvent'CHAT_MSG_COMBAT_FRIENDLYPLAYER_MISSES'
	f:RegisterEvent'CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS'
	f:RegisterEvent'CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES'
	f:RegisterEvent'CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS']]
	f:RegisterEvent'CHAT_MSG_SPELL_SELF_BUFF'
	f:RegisterEvent'CHAT_MSG_SPELL_SELF_DAMAGE'
	f:RegisterEvent'CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE'
	f:RegisterEvent'CHAT_MSG_SPELL_FRIENDLYPLAYER_BUFF'
	f:RegisterEvent'CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE'
	f:RegisterEvent'CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF'
	f:RegisterEvent'CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF'
	f:RegisterEvent'CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE'
	f:RegisterEvent'CHAT_MSG_SPELL_CREATURE_VS_PARTY_BUFF'
	f:RegisterEvent'CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE'
	f:RegisterEvent'CHAT_MSG_SPELL_CREATURE_VS_SELF_BUFF'
	f:RegisterEvent'CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE'
	f:RegisterEvent'CHAT_MSG_SPELL_PARTY_BUFF'
	f:RegisterEvent'CHAT_MSG_SPELL_PARTY_DAMAGE'
	f:RegisterEvent'CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS'
	f:RegisterEvent'CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS'
	f:RegisterEvent'CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE'
	f:RegisterEvent'CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE'
	f:RegisterEvent'CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS'
	f:RegisterEvent'CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE'
	f:RegisterEvent'CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS'
	f:RegisterEvent'CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE'
	f:RegisterEvent'CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE'
	f:RegisterEvent'CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS'
	f:RegisterEvent'CHAT_MSG_SPELL_BREAK_AURA'
	f:RegisterEvent'CHAT_MSG_SPELL_AURA_GONE_SELF'
	f:RegisterEvent'CHAT_MSG_SPELL_AURA_GONE_PARTY'
	f:RegisterEvent'CHAT_MSG_SPELL_AURA_GONE_OTHER'
	f:RegisterEvent'CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF'
	f:RegisterEvent'CHAT_MSG_SPELL_DAMAGESHIELDS_ON_OTHERS'
	f:RegisterEvent'CHAT_MSG_COMBAT_HOSTILE_DEATH'
	f:RegisterEvent'CHAT_MSG_COMBAT_FRIENDLY_DEATH'
	f:Hide()
end
