

    -- written by kuurtzen (& modernist)

    local Cast = {} 		local casts = {}
    local Heal = {} 		local heals = {}
	local InstaBuff = {} 	local iBuffs = {}
    Cast.__index = modcast
    Heal.__index = Heal
	InstaBuff.__index = InstaBuff

    Cast.create = function(caster, spell, info, timeMod, time, inv)
        local acnt = {}
        setmetatable(acnt, modcast)
        acnt.caster     = caster
        acnt.spell      = spell
        acnt.icon       = info[1]
        acnt.timeStart  = time
        acnt.timeEnd    = time + info[2]*timeMod
		acnt.tick	    = info[3] and info[3] or 0
		acnt.nextTick	= info[3] and time + acnt.tick or acnt.timeEnd
		acnt.inverse    = inv
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
       acnt.buff      	= b
	   acnt.timeMod 	= list[1]
	   acnt.spellList 	= list[2]
       acnt.timeStart	= time
       acnt.timeEnd   	= time + 10	--planned obsolescence
       return acnt
    end

	local tableMaintenance = function(reset)
		if reset then
			casts = {} heals = {} iBuffs = {}
		else
                -- CASTS
			local i = 1
			for k, v in pairs(casts) do
				if GetTime() > v.timeEnd or GetTime() > v.nextTick then
					table.remove(casts, i)
				end
				i = i + 1
			end
                -- HEALS
			i = 1
			for k, v in pairs(heals) do
				if GetTime() > v.timeEnd then
					table.remove(heals, i)
					--else i = i + 1
				end
				i = i + 1
			end
                -- BUFFS
			i = 1
			for k, v in pairs(iBuffs) do
				if GetTime() > v.timeEnd then
					table.remove(iBuffs, i)
				end
				i = i + 1
			end
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
    		if j.caster == caster and j.spell == spell and CNP_CHANNELED_SPELLCASTS_TO_TRACK[spell] ~= nil then
				j.nextTick = j.nextTick + j.tick
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
    	local time = GetTime()
    	local info = nil

		--if not CNP_INSTANT_SPELLCASTS_TO_TRACK[spell] then
			if channel then
				if CNP_CHANNELED_HEALS_SPELLCASTS_TO_TRACK[spell] ~= nil then info = CNP_CHANNELED_HEALS_SPELLCASTS_TO_TRACK[spell]
				elseif CNP_CHANNELED_SPELLCASTS_TO_TRACK[spell] ~= nil then info = CNP_CHANNELED_SPELLCASTS_TO_TRACK[spell] end
			else
				if CNP_SPELLCASTS_TO_TRACK[spell] ~= nil then info = CNP_SPELLCASTS_TO_TRACK[spell] end
			end
			if info ~= nil then
				if not checkForChannels(caster, spell) then
					removeDoubleCast(caster)
					local tMod = checkforCastTimeModBuffs(caster, spell)
					if  tMod > 0 then
						local n = Cast.create(caster, spell, info, tMod, time, channel)
						table.insert(casts, n)
					end
				end
			end
		--else
		--	removeDoubleCast(caster)
		--end
    end

    local newHeal = function(n, no, crit)
        local time = GetTime()
        local h = Heal.create(n, no, crit, time)
        table.insert(heals, h)
    end

	local newIBuff = function(caster, buff)
		local time = GetTime()
        local b = InstaBuff.create(caster, buff, CNP_TIME_MODIFIER_BUFFS_TO_TRACK[buff], time)
        table.insert(iBuffs, b)
	end


-----handleCast subfunctions-----------------------------------------------
---------------------------------------------------------------------------
	local forceHideTableItem = function(tab, caster)
		local time = GetTime()
		for k, v in pairs(tab) do
			if (time < v.timeEnd) and (v.caster == caster) then
				v.timeEnd = time - 10000 -- force hide
			end
		end
	end

	local CastCraftPerform = function(info)
		if info then
			if info.type == "cast" and info.isBegin then
				newCast(info.source, info.skill, false)
				return true
			end
		end
		return false
	--[[
		local cast = '(.+) begins to cast (.+).' 						local fcast = string.find(arg1, cast)
		local craft = '(.+) -> (.+).' 									local fcraft = string.find(arg1, craft)
		local perform = '(.+) begins to perform (.+).' 					local fperform = string.find(arg1, perform)

		if fcast or fcraft or fperform  then
			local m = fcast and cast or fcraft and craft or fperform and perform
			local c = gsub(arg1, m, '%1')
			local s = gsub(arg1, m, '%2')
			newCast(c, s, false)

			--print(arg1)
			return true
		end

		return false
	]]
	end

	local GainFadeAfflict = function(info)
		local gain = '(.+) gains (.+).' 								local fgain = string.find(arg1, gain)
		local fade = '(.+) fades from (.+).'							local ffade = string.find(arg1, fade)
		local afflict = '(.+) is afflicted by (.+).' 					local fafflict = string.find(arg1, afflict)
		local rem = '(.+)\'s (.+) is removed.'							local frem = string.find(arg1, rem)

		-- start channeling based on buffs (evocation, first aid, ..)
	--	if fgain then
	--		local m = gain
	--		local c = gsub(arg1, m, '%1')
	--		local s = gsub(arg1, m, '%2')
		if info and info.type == "buff" then
			if CNP_INTERRUPTS_TO_TRACK[info.skill] then
				forceHideTableItem(casts, info.victim)
			end
			if CNP_CHANNELED_SPELLCASTS_TO_TRACK[info.skill] then
				newCast(info.victim, info.skill, true)
			end
			if CNP_TIME_MODIFIER_BUFFS_TO_TRACK[info.skill] then
				Sea.io.print("tMod "..info.skill)

				newIBuff(info.victim, info.skill)
			end
			if CNP_CHANNELED_HEALS_SPELLCASTS_TO_TRACK[info.skill] then
				newCast(info.victim, info.skill, true)
			end
			

		-- end channeling based on buffs (evocation, first aid, ..)
		--elseif ffade then
		--	local m = fade
		--	local c = gsub(arg1, m, '%2')
		--	local s = gsub(arg1, m, '%1')
		elseif info and info.type == "fade" then
			if CNP_CHANNELED_SPELLCASTS_TO_TRACK[info.skill] then
				forceHideTableItem(casts, info.victim)
			end

			if CNP_TIME_MODIFIER_BUFFS_TO_TRACK[info.skill] then
				forceHideTableItem(iBuffs, info.victim)
			end
			if CNP_CHANNELED_HEALS_SPELLCASTS_TO_TRACK[info.skill] then
				forceHideTableItem(casts, info.victim)
			end
		-- cast-interruting CC
	--	elseif fafflict then
	--		local m = afflict
	--		local c = gsub(arg1, m, '%1')
	--		local s = gsub(arg1, m, '%2')
		elseif info and info.type == "debuff" then
			if CNP_INTERRUPTS_TO_TRACK[info.skill] then
				forceHideTableItem(casts, info.victim)
			end
			if CNP_TIME_MODIFIER_BUFFS_TO_TRACK[info.skill] then
				Sea.io.print("tMod "..info.skill)

				newIBuff(info.victim, info.skill)
			end
			end

--[[		elseif frem then
			local m = rem
			local c = gsub(arg1, m, '%1')
			local s = gsub(arg1, m, '%2')

			if CNP_TIME_MODIFIER_BUFFS_TO_TRACK[s] then
				forceHideTableItem(iBuffs, c)
			end
		end
]]
		return info and (info.type == "debuff" or info.type == "fade" or info.type == "buff")
	end

	local HitsCrits = function(info)
		-- local hits   = '(.+)\'s (.+) hits (.+) for (.+)'      local fhits   = string.find(arg1, hits)
		-- local crits  = '(.+)\'s (.+) crits (.+) for (.+)'     local fcrits  = string.find(arg1, crits)
		-- local absb   = '(.+)\'s (.+) is absorbed by (.+).'    local fabsb   = string.find(arg1, absb)

		-- local phits  = 'Your (.+) hits (.+) for (.+)'         local fphits  = string.find(arg1, phits)
		-- local pcrits = 'Your (.+) crits (.+) for (.+)'        local fpcrits = string.find(arg1, pcrits)
		-- local pabsb  = 'Your (.+) is absorbed by (.+).'       local fpabsb  = string.find(arg1, pabsb)

		--local fails = '(.+)'s (.+) fails.'	                local ffails = string.find(arg1, fails)
            -- other hits/crits
	--	if fhits or fcrits or fabsb then
--			local m = fhits and hits or fcrits and crits or fabsb and absb
--			local c = gsub(arg1, m, '%1')
--			local s = gsub(arg1, m, '%2')
--			local t = gsub(arg1, m, '%3')
		if info and info.type == "hit" and info.source ~= ParserLib_SELF then

			-- instant spells that cancel casted ones
			if CNP_INSTANT_SPELLCASTS_TO_TRACK[info.skill] then
				forceHideTableItem(casts, info.source)
			end

			if CNP_CHANNELED_SPELLCASTS_TO_TRACK[info.skill] then
				newCast(info.source, info.skill, true)
			end

			-- interrupt dmg spell
			if CNP_INTERRUPTS_TO_TRACK[info.skill] then
				forceHideTableItem(casts, info.victim)
			end
		end

		-- self hits/crits
		if info and info.type == "hit" and info.source == ParserLib_SELF then
--			local m = fphits and phits or fpcrits and pcrits or fpabsb and pabsb
--			local s = gsub(arg1, m, '%1')
--			local t = gsub(arg1, m, '%2')

			-- interrupt dmg spell
			if CNP_INTERRUPTS_TO_TRACK[info.skill] then
				forceHideTableItem(casts, info.victim)
			end
		end

		return info and info.type == "hit"
	end

	local channelDot = function(info)
		-- local channelDot = "(.+) suffers (.+) from (.+)'s (.+)."		local fchannelDot = string.find(arg1, channelDot)
		-- local pchannelDot = "You suffer (.+) from (.+)'s (.+)."			local fpchannelDot = string.find(arg1, pchannelDot)

		-- local channelDotRes = "(.+)'s (.+) was resisted by (.+)."		local fchannelDotRes = string.find(arg1, channelDotRes)
		-- local pchannelDotRes = "(.+)'s (.+) was resisted."				local fpchannelDotRes = string.find(arg1, pchannelDotRes)

		-- channeling dmg spells on other (mind flay, life drain(?))
		if fchannelDot then
			local m = channelDot
			local c = gsub(arg1, m, '%3')
			local s = gsub(arg1, m, '%4')
			local t = gsub(arg1, m, '%1')

			if CNP_CHANNELED_SPELLCASTS_TO_TRACK[info.skill] then
				newCast(c, s, true)
			end
		end

		-- channeling dmg spells on self (mind flay, life drain(?))
		if fpchannelDot then
			local m = pchannelDot
			local c = gsub(arg1, m, '%2')
			local s = gsub(arg1, m, '%3')

			if CNP_CHANNELED_SPELLCASTS_TO_TRACK[info.skill] then
				newCast(c, s, true)
			end
		end

		-- resisted channeling dmg spells (arcane missiles)
		if fchannelDotRes or fpchannelDotRes then
			local m = fchannelDotRes and channelDotRes or fpchannelDotRes and pchannelDotRes
			local c = gsub(arg1, m, '%1')
			local s = gsub(arg1, m, '%2')

			if CNP_CHANNELED_SPELLCASTS_TO_TRACK[s] then
				newCast(c, s, true)
			end
		end

		return fchannelDot or fpchannelDot or fchannelDotRes or fpchannelDotRes
	end

	local channelHeal = function(info)
--		local hot  = '(.+) gains (.+) health from (.+)\'s (.+).'      local fhot  = string.find(arg1, hot)
--		local phot = 'You gain (.+) health from (.+)\'s (.+).'		  local fphot = string.find(arg1, phot)

		if info.type == "heal" and info.isDOT then
--			local m = fhot and hot or fphot and phot
--			local c = fhot and gsub(arg1, m, '%3') or fphot and gsub(arg1, m, '%2')
--			local s = fhot and gsub(arg1, m, '%4') or fphot and gsub(arg1, m, '%3')
--			local t = fhot and gsub(arg1, m, '%1') or nil

			if CNP_CHANNELED_HEALS_SPELLCASTS_TO_TRACK[info.skill] then
				
				newCast(info.source, info.skill, true)
			end
		end
		return info.type == "heal" and info.isDOT
	end

	local fear = function()
		local fear = '(.+) attempts to run away in fear!'             local ffear = string.find(arg1, fear)
		if ffear then
			local t = arg2
			forceHideTableItem(casts, t)
		end
		return ffear
	end

	local handleCast = function(info)
		
		
		
		if not CastCraftPerform(info) then
			if not GainFadeAfflict(info) then
				if not HitsCrits(info) then
	--				if not channelDot(info) then
						if not channelHeal(info) then
					--		fear(info)
					end
				--	end
				end
			end
		end
	end

    local handleHeal = function()
 --       local h   = 'Your (.+) heals (.+) for (.+).'
 --       local c   = 'Your (.+) critically heals (.+) for (.+).'
 --       local hot = '(.+) gains (.+) health from your (.+).'
		if info and info.type == "heal" then
			newHeal(info.victim,info.amount,info.isCrit)
        end
	
		-- if string.find(arg1, h) or string.find(arg1, c) then
            -- local n  = gsub(arg1, h, '%2')
            -- local no = gsub(arg1, h, '%3')
            -- newHeal(n, no, string.find(arg1, c) and 1 or 0)
        -- elseif string.find(arg1, hot) then
            -- local n  = gsub(arg1, hot, '%1')
            -- local no = gsub(arg1, hot, '%2')
            -- newHeal(n, no, 0)
        -- end
    end



	-- GLOBAL ACCESS FUNCTIONS
	PROCESSCASTINGgetCast = function(caster)
		if caster == nil then return nil end
		for k, v in pairs(casts) do
			if v.caster == caster then
				return v
			end
		end
		return nil
	end

	PROCESSCASTINGgetHeal = function(target)
		for k, v in pairs(heals) do
			if v.target == target then
				return v
			end
		end
		return nil
	end


    local f = CreateFrame'Frame'
    f:SetScript('OnUpdate', function()
    	tableMaintenance(false)
    end)
	f.parser = ParserLib:GetInstance('1.1')

	PROCESSCASTINGonEvent = function(event, info)
	--	Sea.io.printTable(info)
		handleCast(info) 
		handleHeal(info) 
    end
	
	
	f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS", PROCESSCASTINGonEvent)
    f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_SELF_BUFF", PROCESSCASTINGonEvent)
    f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_SELF_DAMAGE", PROCESSCASTINGonEvent)
    f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE", PROCESSCASTINGonEvent)
    f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_FRIENDLYPLAYER_BUFF", PROCESSCASTINGonEvent)
    f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE", PROCESSCASTINGonEvent)
    f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF", PROCESSCASTINGonEvent)
    f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", PROCESSCASTINGonEvent)
	f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_CREATURE_VS_PARTY_BUFF", PROCESSCASTINGonEvent)
	f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", PROCESSCASTINGonEvent)
	f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_PARTY_BUFF", PROCESSCASTINGonEvent)
    f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_PARTY_DAMAGE", PROCESSCASTINGonEvent)
    f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS", PROCESSCASTINGonEvent)
    f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS", PROCESSCASTINGonEvent)
    f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE", PROCESSCASTINGonEvent)
    f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", PROCESSCASTINGonEvent)
    f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS", PROCESSCASTINGonEvent)
    f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", PROCESSCASTINGonEvent)
	f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS", PROCESSCASTINGonEvent)
    f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", PROCESSCASTINGonEvent)
    f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE", PROCESSCASTINGonEvent)
    f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", PROCESSCASTINGonEvent)

	f.parser:RegisterEvent("CustomNameplates", "CHAT_MSG_SPELL_AURA_GONE_OTHER", PROCESSCASTINGonEvent)

	f:RegisterEvent'PLAYER_ENTERING_WORLD'
    f:SetScript('OnEvent', function()
        if event == 'PLAYER_ENTERING_WORLD' then
			tableMaintenance(true)
		end
    end)

    SLASH_PROCESSCAST1 = '/pct'
    SlashCmdList['PROCESSCAST'] = function(msg)
    	local i = 0
    	for k, v in pairs(casts) do i = i + 1 end
    	print(i)
    	print(tlength(casts))
    end


    --
