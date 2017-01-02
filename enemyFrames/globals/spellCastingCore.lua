
local Cast 			= {} 		local casts 		= {}
local Heal 			= {} 		local heals			= {}
local InstaBuff 	= {} 		local iBuffs 		= {}
local buff 			= {} 		local buffList 		= {}
local dreturns 		= {} 		local dreturnsList 	= {}
local buffQueue		= {}		local buffQueueList = {}
Cast.__index   		= spellCast
Heal.__index   		= Heal
InstaBuff.__index 	= InstaBuff
buff.__index 		= buff
buffQueue.__index	= buffQueue
dreturns.__index	= dreturns

local playerName = UnitName'player'

Cast.create = function(caster, spell, info, timeMod, time, inv)
	local acnt = {}
	setmetatable(acnt, spellCast)
	acnt.caster     = caster
	acnt.spell      = spell
	acnt.icon       = info['icon']
	acnt.timeStart  = time
	acnt.timeEnd    = time + info['casttime']*timeMod
	acnt.tick	    = info['tick'] and info['tick'] or 0 
	acnt.nextTick	= info['tick'] and time + acnt.tick or acnt.timeEnd 
	acnt.inverse    = inv	
	acnt.class		= info['class']
	acnt.school		= info['school'] and RGB_SPELL_SCHOOL_COLORS[info['school']]
	acnt.borderClr	= info['immune'] and {.3, .3, .3} or {.1, .1, .1}
	return acnt
end

Heal.create = function(n, no, crit, time)
   local acnt = {}
   setmetatable(acnt,Heal)
   acnt.target    = n
   acnt.amount    = no
   acnt.crit      = crit
   acnt.timeStart = time
   acnt.timeEnd   = time + 2
   acnt.y         = 0
   return acnt
end

InstaBuff.create = function(c, b, list, time)
   local acnt = {}
   setmetatable(acnt,InstaBuff)
   acnt.caster    	= c
   acnt.spell      	= b
   acnt.timeMod 	= list['mod']
   acnt.spellList 	= list['list']
   acnt.timeStart	= time
   acnt.timeEnd   	= time + 10	--planned obsolescence
   return acnt
end

buff.create = function(tar, t, s, buffType, factor, time)
	local acnt     = {}
	setmetatable(acnt, buff)
	acnt.target    	= tar
	acnt.caster    	= tar	-- facilitate entry removal
	acnt.spell      = t
	acnt.stacks		= s
	acnt.icon      	= buffType['icon']
	acnt.timeStart 	= time
	acnt.timeEnd   	= time + buffType['duration'] * factor
	acnt.prio		= buffType['prio'] and buffType['prio'] or 0
	acnt.border		= buffType['type'] and RGB_BORDER_DEBUFFS_COLOR[buffType['type']] or {.1, .1, .1}	-- border rgb values depending on type of buff/debuff
	acnt.display 	= buffType['display'] == nil and true or buffType['display']
	return acnt
end

buffQueue.create = function(tar, spell, buffType, d, time)
	local acnt     = {}
	setmetatable(acnt, buffQueue)
	acnt.target    	= tar
	acnt.buffName	= spell
	acnt.buffData   = buffType
	--acnt.duration	= 
	buffType['duration'] = buffType['cp'][d]

	acnt.timeStart 	= time
	acnt.timeEnd   	= time + 1 
	return acnt
end

dreturns.create = function(tar, t, tEnd)
	local acnt = {}
	setmetatable(acnt, dreturns)
	acnt.target 	= tar
	acnt.type 		= t
	acnt.factor 	= 1
	acnt.k 			= 15
	acnt.timeEnd 	= tEnd + acnt.k
	return acnt
end

local getAvgLatency = function()	--/script down, up, lagHome, lagWorld = GetNetStats() print(lagHome)
	local _, _, lat = GetNetStats()
	return lat / 1000
end

local getTimeMinusPing = function()
	return GetTime() -- getAvgLatency() --- standby for now
end

local removeExpiredTableEntries = function(time, tab)
	local i = 1
	for k, v in pairs(tab) do
		if time > v.timeEnd then
			table.remove(tab, i)
		end
		i = i + 1
	end
end

local updateDRtimers = function(time, drtab, bufftab)
	for k, v in pairs(drtab) do
		for i, j in pairs(bufftab) do
			if j.target == v.target and SPELLINFO_BUFFS_TO_TRACK[j.spell]['dr'] then
				if SPELLINFO_BUFFS_TO_TRACK[j.spell]['dr'] == v.type then
					v.timeEnd = time + v.k
				end
			end
		end
	end
end

local tableMaintenance = function(reset)
	if reset then
		casts = {} heals = {} iBuffs = {} buffList = {} dreturnsList = {}
	else
		-- CASTS -- casts have a different removal parameter
		local time = GetTime()
		local i = 1
		for k, v in pairs(casts) do
			if time > v.timeEnd or time > v.nextTick + getAvgLatency() then	-- channeling cast verification
				table.remove(casts, i)
			end
			i = i + 1
		end
		-- HEALS
		removeExpiredTableEntries(time, heals)
		--  CASTING SPEED BUFFS
		removeExpiredTableEntries(time, iBuffs)
		-- BUFFS / DEBUFFS
		removeExpiredTableEntries(time, buffList)
		-- BUFFQUEUE
		removeExpiredTableEntries(time, buffQueueList)
		-- DRS
		updateDRtimers(time, dreturnsList, buffList)
		removeExpiredTableEntries(time, dreturnsList)
	end
end

local removeDoubleCast = function(caster)
	local k = 1
	for i, j in casts do
		if j.caster == caster then table.remove(casts, k) end
		k = k + 1
	end
end

local checkForChannels = function(caster, spell)
	local k = 1
	for i, j in casts do
		if j.caster == caster and j.spell == spell then--and (SPELLINFO_CHANNELED_SPELLCASTS_TO_TRACK[spell] ~= nil or SPELLINFO_CHANNELED_HEALS_SPELLCASTS_TO_TRACK[spell] ~= nil) then 
			j.nextTick = GetTime() + j.tick --GetTime() + j.tick + getAvgLatency()--j.nextTick + j.tick --+ getAvgLatency()
			--print(j.nextTick - j.timeStart)
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
			if j.spellList[1] ~= 'all' then
				local a, lastT = 1, 1		
				for b, c in j.spellList do
					if c == spell then
						if lastT ~= 0 then			-- priority to buffs that proc instant cast
							lastT = j.timeMod
						end
					end
				end
				return lastT
			else
				return j.timeMod
			end
			--return false
		end
		k = k + 1
	end
	return 1
end

local newCast = function(caster, spell, channel)
	local time = getTimeMinusPing()--GetTime() -- getAvgLatency()
	local info = nil
	
	if channel then
		if SPELLINFO_CHANNELED_HEALS_SPELLCASTS_TO_TRACK[spell] ~= nil then info = SPELLINFO_CHANNELED_HEALS_SPELLCASTS_TO_TRACK[spell]
		elseif SPELLINFO_CHANNELED_SPELLCASTS_TO_TRACK[spell] ~= nil then info = SPELLINFO_CHANNELED_SPELLCASTS_TO_TRACK[spell] end
	else
		removeDoubleCast(caster)
		if SPELLINFO_SPELLCASTS_TO_TRACK[spell] ~= nil then info = SPELLINFO_SPELLCASTS_TO_TRACK[spell] end
	end
	
	if SPELLINFO_TRADECASTS_TO_TRACK[spell] ~= nil then info = SPELLINFO_TRADECASTS_TO_TRACK[spell] end
	
	if info ~= nil then
		if not checkForChannels(caster, spell) then
			removeDoubleCast(caster)
			local tMod = checkforCastTimeModBuffs(caster, spell)
			if  tMod > 0 then
				local n = Cast.create(caster, spell, info, tMod, time, channel)
				table.insert(casts, n)
			end
		end
	--else
	--	print(arg1)
	end

end

local newHeal = function(n, no, crit)
	local time = GetTime()
	local h = Heal.create(n, no, crit, time)
	table.insert(heals, h)
end

local newIBuff = function(caster, buff)
	local time = getTimeMinusPing()--GetTime()
	local b = InstaBuff.create(caster, buff, SPELLINFO_TIME_MODIFIER_BUFFS_TO_TRACK[buff], time)
	table.insert(iBuffs, b)
end

local function manageDR(time, tar, b, castOn)
	if not SPELLINFO_BUFFS_TO_TRACK[b]['dr'] then return 1 end
	
	for k, v in pairs(dreturnsList) do
		if v.target == tar and v.type == SPELLINFO_BUFFS_TO_TRACK[b]['dr'] then
			v.factor = v.factor > .25 and v.factor / 2 or 0
			--if v.factor > 0 then
			--	v.timeEnd = time + SPELLINFO_BUFFS_TO_TRACK[b]['duration'] * v.factor + v.k
			--end
			return v.factor
		end
	end
	
	if castOn then return 0 end		-- avoids creating a new DR entry if none was found
	local n = dreturns.create(tar, SPELLINFO_BUFFS_TO_TRACK[b]['dr'], SPELLINFO_BUFFS_TO_TRACK[b]['duration'] + time)
	table.insert(dreturnsList, n)
	return 1
end

local function checkQueueBuff(tar, b)
	for k, v in pairs(buffQueueList) do
		if v.target == tar and v.buffName == b then
			return true
		end
	end
	return false
end

local function newbuff(tar, b, s, castOn)
	local time = getTimeMinusPing()--GetTime()
	
	-- check buff queue
	if checkQueueBuff(tar, b) then return end
	
	local drf = manageDR(time, tar, b, castOn)
	
	if drf > 0 then		
		-- remove buff if it exists
		for k, v in pairs(buffList) do
			if v.caster == tar and v.spell == b then
				table.remove(buffList, k)
			end
		end
		
		local n = buff.create(tar, b, s, SPELLINFO_BUFFS_TO_TRACK[b], drf, time)
		table.insert(buffList, n)
	end
end

local function refreshBuff(tar, b, s)
	-- refresh if it exists
	for i, j in pairs(SPELLINFO_DEBUFF_REFRESHING_SPELLS[b]) do
		for k, v in pairs(buffList) do
			if v.caster == tar and v.spell == j then
				newbuff(tar, j, s, false)
				return
			end
		end
	end
end

local function queueBuff(tar, spell, b, d)
	local time = getTimeMinusPing()--GetTime()
	local bq = buffQueue.create(tar, spell, b, d, time)
	table.insert(buffQueueList, bq) 
end

local function processQueuedBuff(tar, b)
	local time = getTimeMinusPing()--GetTime()
	for k, v in pairs(buffQueueList) do
		if v.target == tar and v.buffName == b then
			local n = buff.create(v.target, v.buffName, 1, v.buffData, 1, time)
			table.insert(buffList, n)
			
			table.remove(buffQueueList, k)
			return 
		end
	end
end
-----handleCast subfunctions-----------------------------------------------
---------------------------------------------------------------------------
local forceHideTableItem = function(tab, caster, spell)
	local time = GetTime()
	for k, v in pairs(tab) do
		if (time < v.timeEnd) and (v.caster == caster) then
			if (spell ~= nil) then if v.spell == spell then	v.timeEnd = time end-- 10000 end 
			else
				v.timeEnd = time -- 10000 -- force hide
			end
		end
	end
end

local CastCraftPerform = function()
	local pcast 	= 'You cast (.+).'							local fpcast = string.find(arg1, pcast)	-- standby for now
	local cast		= '(.+) casts (.+).'						local fcast = string.find(arg1, cast)
	local bcast 	= '(.+) begins to cast (.+).' 				local fbcast = string.find(arg1, bcast)
	local craft 	= '(.+) -> (.+).' 							local fcraft = string.find(arg1, craft)
	local perform 	= '(.+) performs (.+).' 					local fperform = string.find(arg1, perform)
	local bperform 	= '(.+) begins to perform (.+).' 			local fbperform = string.find(arg1, bperform)
	local performOn = '(.+) performs (.+) on (.+).' 			local fperformOn = string.find(arg1, performOn)
	
	local pcastFin 	= 'You cast (.+) on (.+).'					local fpcastFin = string.find(arg1, pcastFin)
	local castFin 	= '(.+) casts (.+) on (.+).'				local fcastFin = string.find(arg1, castFin)
	
	if fbcast or fcraft then
		local m = fbcast and bcast or fcraft and craft or fperform and perform
		local c = gsub(arg1, m, '%1')
		local s = gsub(arg1, m, '%2')
		newCast(c, s, false)
		--print(arg1)
		
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
		if SPELLINFO_SPELLCASTS_TO_TRACK[s] then
			newCast(c, s, false)
		else
			forceHideTableItem(casts, c, nil)
		end
		--on standby
		--[[ finished casts CC(?)	
	elseif fpcastFin or fcastFin then
		local m = fpcastFin and pcastFin or fcastFin and castFin
		local t = fpcastFin and gsub(arg1, m, '%2') or gsub(arg1, m, '%3')
		local s = fpcastFin and gsub(arg1, m, '%1') or gsub(arg1, m, '%2')
		
		if SPELLINFO_BUFFS_TO_TRACK[s] then
			newbuff(t, s, true)
		end]]--
	end
	
	return fcast or fbcast or fpcast or fcraftor or fperform or fbperform or fpcastFin or fcastFin or fperformOn
end

local handleHeal = function()
	local h   	 = 'Your (.+) heals (.+) for (.+).'					local fh 	  = string.find(arg1, h)
	local c   	 = 'Your (.+) critically heals (.+) for (.+).'		local fc 	  = string.find(arg1, c)
	local hot 	 = '(.+) gains (.+) health from your (.+).'			local fhot 	  = string.find(arg1, hot)
	local oheal  = '(.+)\'s (.+) heals (.+) for (.+).'				local foheal  = string.find(arg1, oheal)
	local ocheal = '(.+)\'s (.+) critically heals (.+) for (.+).'	local focheal = string.find(arg1, ocheal)
	
	if fh or fc then
		local n  = gsub(arg1, h, '%2')
		local no = gsub(arg1, h, '%3')
		newHeal(n, no, fc and 1 or 0)
	elseif fhot then--or string.find(arg1, totemHot)  then
		local m = fhot and hot --or  string.find(arg1, totemHot) and totemHot			
		local n  = gsub(arg1, m, '%1')
		local no = gsub(arg1, m, '%2')
		newHeal(n, no, 0)
		
		-- other's heals (insta heals)
	elseif foheal or focheal then
		local m = foheal and oheal or focheal and ocheal
		local c = gsub(arg1, m, '%1')
		local s = gsub(arg1, m, '%2')
		
		if SPELLINFO_INSTANT_SPELLCASTS_TO_TRACK[s] then
			forceHideTableItem(casts, c, nil)
		end
	end
	
	return fh or fc or fhot or foheal or focheal
end

local processUniqueSpell = function()
	local vanish = '(.+) performs Vanish'		local fvanish = string.find(arg1, vanish)
	
	if fvanish then
		local m = vanish
		local c = gsub(arg1, m, '%1')
		--print(arg1)
		for k, v in pairs(SPELLINFO_ROOTS_SNARES) do
			forceHideTableItem(buffList, c, k)
		end
	end
	
	return fvanish
end

local DirectInterrupt = function()
	local pintrr 	= 'You interrupt (.+)\'s (.+).'			local fpintrr  	= string.find(arg1, pintrr)
	local intrr 	= '(.+) interrupts (.+)\'s (.+).'		local fintrr  	= string.find(arg1, pintrr)

	if fpintrr  or fintrr then
		local m = fpintrr and pintrr or intrr
		local t = fpintrr and gsub(arg1, m, '%1') or gsub(arg1, m, '%2') 
		local s = fpintrr and gsub(arg1, m, '%2') or gsub(arg1, m, '%3') 
		
		forceHideTableItem(casts, t, nil)
	end	
	
	return fpintrr  or fintrr 
end

local GainAfflict = function()
	local gain 		= '(.+) gains (.+).' 								local fgain = string.find(arg1, gain)
	local pgain 	= 'You gain (.+).'									local fpgain = string.find(arg1, pgain)	
	local afflict 	= '(.+) is afflicted by (.+).' 						local fafflict = string.find(arg1, afflict)
	local pafflict 	= 'You are afflicted by (.+).' 						local fpafflict = string.find(arg1, pafflict)
	
	-- start channeling based on buffs (evocation, first aid, ..)
	if fgain or fpgain then
		local m = fgain and gain or fpgain and pgain
		local c = fgain and gsub(arg1, m, '%1') or fpgain and playerName
		local s = fgain and gsub(arg1, m, '%2') or fpgain and gsub(arg1, m, '%1')
		
		-- buffs/debuffs to be displayed
		if SPELLINFO_BUFFS_TO_TRACK[s] then
			newbuff(c, s, 1, false)
		end
		-- self-cast buffs that interrupt cast (blink, ice block ...)
		if SPELLINFO_INTERRUPT_BUFFS_TO_TRACK[s] then
			forceHideTableItem(casts, c, nil)
		end
		-- specific channeled spells (evocation ...)
		if SPELLINFO_CHANNELED_SPELLCASTS_TO_TRACK[s] then
			newCast(c, s, true)
		end
		-- buffs that alter spell casting speed
		if SPELLINFO_TIME_MODIFIER_BUFFS_TO_TRACK[s] then
			newIBuff(c, s)
		end
			
	-- cast-interruting CC
	elseif fafflict or fpafflict then
		local m = fafflict and afflict or fpafflict and pafflict
		local c = fafflict and gsub(arg1, m, '%1') or fpafflict and playerName
		local s = fafflict and gsub(arg1, m, '%2') or fpafflict and gsub(arg1, m, '%1')
		
		-- rank & stacks
		local auxS, st = s, 1
		if not SPELLINFO_BUFFS_TO_TRACK[s] then
			--local buffRank = '(.+) (.+)'
			--if string.find(s, buffRank) then print(gsub(s, buffRank, '%1'))	print(gsub(s, buffRank, '%2'))	end
			local spellstacks = '(.+) %((.+)%)'	
			if string.find(s, spellstacks) then s = gsub(s, spellstacks, '%1')	st = tonumber(gsub(auxS, spellstacks, '%2'), 10)	--print(s) print(st)	
			end
		end
		-- debuffs to be displayed
		if SPELLINFO_BUFFS_TO_TRACK[s] then
			--if st > 1 then
			--	refreshBuff(c, s, st)
			--else
				newbuff(c, s, st, false)
			--end		
		end
		
		s = auxS
		
		-- spell interrupting debuffs (stuns, incapacitates ...)
		if SPELLINFO_INTERRUPT_BUFFS_TO_TRACK[s] then
			forceHideTableItem(casts, c, nil)
		end
		
		-- debuffs that slow spellcasting speed (tongues ...)
		if SPELLINFO_TIME_MODIFIER_BUFFS_TO_TRACK[s] then
			newIBuff(c, s)
		end
		
		-- process debuffs in queueBuff
		processQueuedBuff(c, s)
	end
	
	return fgain or fpgain or fafflict or fpafflict
end

local FadeRem = function()
	local fade 		= '(.+) fades from (.+).'							local ffade = string.find(arg1, fade)
	local rem 		= '(.+)\'s (.+) is removed'							local frem = string.find(arg1, rem)
	local prem 		= 'Your (.+) is removed'							local fprem = string.find(arg1, prem)
	
	-- end channeling based on buffs (evocation ..)
	if ffade then
		local m = fade
		local c = gsub(arg1, m, '%2')
		local s = gsub(arg1, m, '%1')
		
		c = c == 'you' and playerName or c
		
		-- buffs/debuffs to be displayed
		if SPELLINFO_BUFFS_TO_TRACK[s] then
			forceHideTableItem(buffList, c, s)
		end
		-- buff channeling casts fading
		if SPELLINFO_CHANNELED_SPELLCASTS_TO_TRACK[s] then
			forceHideTableItem(casts, c, nil)
		end
		
		if SPELLINFO_TIME_MODIFIER_BUFFS_TO_TRACK[s] then
			forceHideTableItem(iBuffs, c, s)
		end
	elseif frem or fprem then
		local m = frem and rem or fprem and prem
		local c = frem and gsub(arg1, m, '%1') or fprem and playerName
		local s = frem and gsub(arg1, m, '%2') or fprem and gsub(arg1, m, '%1')
		
		-- buffs/debuffs to be displayed
		if SPELLINFO_BUFFS_TO_TRACK[s] then
			forceHideTableItem(buffList, c, s)
		end
		
		if SPELLINFO_TIME_MODIFIER_BUFFS_TO_TRACK[s] then
			forceHideTableItem(iBuffs, c, s)
		end
	end
	
	return ffade or frem or fprem
end

local HitsCrits = function()
	local hits = '(.+)\'s (.+) hits (.+) for (.+)' 					local fhits = string.find(arg1, hits)
	local crits = '(.+)\'s (.+) crits (.+) for (.+)' 				local fcrits = string.find(arg1, crits)
	local absb = '(.+)\'s (.+) is absorbed by (.+).'				local fabsb = string.find(arg1, absb)
	
	local phits = 'Your (.+) hits (.+) for (.+)' 					local fphits = string.find(arg1, phits)
	local pcrits = 'Your (.+) crits (.+) for (.+)' 					local fpcrits = string.find(arg1, pcrits)	
	local pabsb = 'Your (.+) is absorbed by (.+).'					local fpabsb = string.find(arg1, pabsb)
	
	local channelDotRes = "(.+)'s (.+) was resisted by (.+)."		local fchannelDotRes = string.find(arg1, channelDotRes)
	local pchannelDotRes = "(.+)'s (.+) was resisted."				local fpchannelDotRes = string.find(arg1, pchannelDotRes)
	
	-- other hits/crits
	if fhits or fcrits or fabsb then
		local m = fhits and hits or fcrits and crits or fabsb and absb
		local c = gsub(arg1, m, '%1')
		local s = gsub(arg1, m, '%2')
		local t = gsub(arg1, m, '%3')
		
		t = t == 'you' and playerName or t
		
		-- instant spells that cancel casted ones
		if SPELLINFO_INSTANT_SPELLCASTS_TO_TRACK[s] then 
			forceHideTableItem(casts, c, nil)
		end
		
		if SPELLINFO_CHANNELED_SPELLCASTS_TO_TRACK[s] then
			newCast(c, s, true)
		end			
		
		-- interrupt dmg spell
		if SPELLINFO_INTERRUPTS_TO_TRACK[s] then
			forceHideTableItem(casts, t, nil)
		end
		
		-- spells that refresh debuffs
		if SPELLINFO_DEBUFF_REFRESHING_SPELLS[s] then
			refreshBuff(t, s)
		end
	end
	
	-- self hits/crits
	if fphits or fpcrits or fpabsb then
		local m = fphits and phits or fpcrits and pcrits or fpabsb and pabsb
		local s = gsub(arg1, m, '%1')
		local t = gsub(arg1, m, '%2')
		
		-- interrupt dmg spell
		if SPELLINFO_INTERRUPTS_TO_TRACK[s] then
			forceHideTableItem(casts, t, nil)
		end
		
		-- spells that refresh debuffs
		if SPELLINFO_DEBUFF_REFRESHING_SPELLS[s] then
			refreshBuff(t, s)
		end
	end
	
	-- resisted channeling dmg spells (arcane missiles ITS A VERY SPECIAL AND UNIQUE SNOWFLAKE SPELL)
	if fchannelDotRes or fpchannelDotRes then
		local m = fchannelDotRes and channelDotRes or fpchannelDotRes and pchannelDotRes
		local c = gsub(arg1, m, '%1')
		local s = gsub(arg1, m, '%2')
		
		if SPELLINFO_CHANNELED_SPELLCASTS_TO_TRACK[s] then
			newCast(c, s, true)
		end			
	end
	
	return fhits or fcrits or fphits or fpcrits or fabsb or fpabsb --or ffails
end

local channelDot = function()
	local channelDot 	= "(.+) suffers (.+) from (.+)'s (.+)."		local fchannelDot = string.find(arg1, channelDot)
	local channelpDot 	= '(.+) suffers (.+) from your (.+).'		local fchannelpDot	= string.find(arg1, channelpDot)
	local pchannelDot 	= "You suffer (.+) from (.+)'s (.+)."		local fpchannelDot = string.find(arg1, pchannelDot)
				
	local MDrain = '(.+)\'s (.+) drains (.+) Mana from' 			local fMDrain = string.find(arg1, MDrain)
	
	-- channeling dmg spells on other (mind flay, life drain(?))
	if fchannelDot then
		local m = channelDot
		local c = gsub(arg1, m, '%3')
		local s = gsub(arg1, m, '%4')
		local t = gsub(arg1, m, '%1')
		
		if SPELLINFO_CHANNELED_SPELLCASTS_TO_TRACK[s] then
			newCast(c, s, true)
		end			
	end
	
	-- channeling dmg spells on self (mind flay, life drain(?))
	if fpchannelDot then
		local m = pchannelDot
		local c = gsub(arg1, m, '%2')
		local s = gsub(arg1, m, '%3')
		
		if SPELLINFO_CHANNELED_SPELLCASTS_TO_TRACK[s] then
			newCast(c, s, true)
		end			
	end
		
	-- drain mana 
	if fMDrain then
		local m = MDrain
		local c = gsub(arg1, m, '%1')
		local s = gsub(arg1, m, '%2')
		
		if SPELLINFO_CHANNELED_SPELLCASTS_TO_TRACK[s] then
			--print(arg1)
			newCast(c, s, true)
		end	
	end
	return fchannelDot or fpchannelDot or fchannelpDot or fMDrain
end

local channelHeal = function()
	local hot  = '(.+) gains (.+) health from (.+)\'s (.+).'		local fhot = string.find(arg1, hot)
	local phot = 'You gain (.+) health from (.+)\'s (.+).'			local fphot = string.find(arg1, phot)
	local shot = 'You gain (.+) health from (.+).'					local fshot = string.find(arg1, shot)	
	
	if fhot or fphot then
		local m = fhot and hot or fphot and phot
		local c = fhot and gsub(arg1, m, '%3') or fphot and gsub(arg1, m, '%2')
		local s = fhot and gsub(arg1, m, '%4') or fphot and gsub(arg1, m, '%3')
		--local t = fhot and gsub(arg1, m, '%1') or nil
		
		if SPELLINFO_CHANNELED_HEALS_SPELLCASTS_TO_TRACK[s] then
			newCast(c, s, true)
		end	
	elseif fshot then
		local m = shot
		local c = playerName
		local s = gsub(arg1, m, '%2')
		
		if SPELLINFO_CHANNELED_HEALS_SPELLCASTS_TO_TRACK[s] then
			newCast(c, s, true)
		end
	end
	
	return fhot or fphot or fshot
end

local playerDeath = function()
	local pdie 		= 'You die.'					local fpdie		= string.find(arg1, pdie)
	local dies		= '(.+) dies.'					local fdies		= string.find(arg1, dies)
	local slain 	= '(.+) is slain by (.+).'		local fslain 	= string.find(arg1, slain)
	local pslain 	= 'You have slain (.+).'		local fpslain 	= string.find(arg1, pslain)
	
	if fpdie or fdies or fslain or fpslain then
		local m = fdies and dies or fslain and slain or fpslain and pslain
		local c = fpdie and playerName or gsub(arg1, m, '%1')
		
		forceHideTableItem(casts, c, nil)
		forceHideTableItem(buffList, c, nil)
		
		-- send dead player data
		ENEMYFRAMECORESetPlayersData({[c] = {['name'] = c, ['health']  = 0}})
	end
	
	return fpdie or fdies or fslain or fpslain
end

local fear = function()
	local fear = '(.+) attempts to run away in fear!' 				local ffear = string.find(arg1, fear)
	
	if ffear then
		local t = arg2			
		forceHideTableItem(casts, t)	
	end
	
	return ffear
end

----------------------------------------------------------------------------
local singleEventdebug = function()
	local v = '(.+) performs Vanish'
	
	if string.find(arg1, v) then
		print(event)
		print(arg1)
	end
end

local parsingCheck = function(out, display)
	if (not out) and display then
		print('Parsing failed:')
		print(event)
		print(arg1)
	end
end

local combatlogParser = function()	
	local pSpell 	= 'CHAT_MSG_SPELL_PERIODIC_(.+)'		local fpSpell 		= string.find(event, pSpell)
	local breakAura = 'CHAT_MSG_SPELL_BREAK_AURA'			local fbreakAura 	= string.find(event, breakAura)
	local auraGone	= 'CHAT_MSG_SPELL_AURA_GONE_(.+)'		local fauraGone 	= string.find(event, auraGone)
	local dSpell 	= 'CHAT_MSG_SPELL_(.+)'					local fdSpell 		= string.find(event, dSpell)	
	local death		= 'CHAT_MSG_COMBAT_(.+)_DEATH'			local fdeath 		= string.find(event, death)
	local mEmote	= 'CHAT_MSG_MONSTER_EMOTE'				local fmEmote		= string.find(event, mEmote)
	
	--if arg1 then singleEventdebug() end -- testing
	
	-- periodic damage/buff spells
	if fpSpell then	
		parsingCheck(channelDot() or channelHeal() or GainAfflict() or handleHeal(), false)
	-- fade/remove buffs
	elseif fbreakAura or fauraGone then
		parsingCheck(FadeRem(), false)
	-- direct damage/buff spells
	elseif fdSpell then
		parsingCheck(processUniqueSpell() or CastCraftPerform() or handleHeal() or DirectInterrupt() or HitsCrits(), false)
	-- player death
	elseif fdeath then
		parsingCheck(playerDeath(), false)
	-- creature runs in fear
	elseif fmEmote then
		parsingCheck(fear(), false)
	else
		--unparsed event!
		--print('untreated event')
		--parsingCheck(false, true)
	end
end

-- GLOBAL ACCESS FUNCTIONS
SPELLCASTINGCOREgetCast = function(caster)
	if caster == nil then return nil end
	for k, v in pairs(casts) do
		if v.caster == caster then
			return v
		end
	end
	return nil
end

SPELLCASTINGCOREgetHeal = function(target)
	for k, v in pairs(heals) do
		if v.target == target then
			return v
		end
	end
	return nil
end

local function sortPriobuff(tab, b)
	for k, v in pairs(tab) do
		if b.prio > v.prio then	
			table.insert(tab, k, b)
			return tab
		end
	end
	table.insert(tab, b)
	return tab
end

SPELLCASTINGCOREgetPrioBuff = function(name, n)
	local b = {}
	for j, e in pairs(buffList) do
		if e.target == name and e.display then
			b = sortPriobuff(b, e)
		end
	end
	
	local l = {}
	for k, v in pairs(b) do
		table.insert(l, v)
		if k == n then return l end
	end
	return l
end

SPELLCASTINGCOREgetBuffs = function(name)
	local list = {}
	for j, e in ipairs(buffList) do
		if e.target == name then
			table.insert(list, e)
		end
	end
	return list
end

SPELLCASTINGCORErefreshBuff = function(t, b, s)
	if SPELLINFO_DEBUFF_REFRESHING_SPELLS[b] then
		refreshBuff(t, b, s)
	end
end

SPELLCASTINGCOREqueueBuff = function(t, b, d)
	if SPELLINFO_UNIQUE_DEBUFFS[b] then	
		queueBuff(t, b, SPELLINFO_UNIQUE_DEBUFFS[b], d)
		return true
	end
	return false
end
------------------------------------

local f = CreateFrame('Frame', 'spellCastingCore', UIParent)
f:SetScript('OnUpdate', function()
	tableMaintenance(false)
end)

f:RegisterEvent'PLAYER_ENTERING_WORLD'
f:RegisterEvent'CHAT_MSG_MONSTER_EMOTE'--[[
f:RegisterEvent'CHAT_MSG_COMBAT_SELF_HITS'
f:RegisterEvent'CHAT_MSG_COMBAT_SELF_MISSES'
f:RegisterEvent'CHAT_MSG_COMBAT_PARTY_HITS'
f:RegisterEvent'CHAT_MSG_COMBAT_PARTY_MISSES'
f:RegisterEvent'CHAT_MSG_COMBAT_FRIENDLYPLAYER_HITS'
f:RegisterEvent'CHAT_MSG_COMBAT_FRIENDLYPLAYER_MISSES'
f:RegisterEvent'CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS'
f:RegisterEvent'CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES'
f:RegisterEvent'CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS']]--
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

--f:RegisterAllEvents()

f:SetScript('OnEvent', function()
	if event == 'PLAYER_ENTERING_WORLD' then
		tableMaintenance(true)
	else 
		combatlogParser()  
	end
end)

--
	
SLASH_PROCESSCAST1 = '/pct'
SlashCmdList["PROCESSCAST"] = function(msg)

end
