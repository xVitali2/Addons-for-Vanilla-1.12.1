	-------------------------------------------------------------------------------
	local paladins 		= {}
	local targetSeals 	= {}
	-------------------------------------------------------------------------------
	local addSeal = function()
		local nSeal = EF_L_SEALOF			local fnSeal 	= string.find(arg1, nSeal)
		
		if fnSeal then
			local c = gsub(arg1, nSeal, '%1')			
			local b = gsub(arg1, nSeal, '%2')			b = b == (EF_L_GAIN or EF_L_GAINS) and true or false
			local s = gsub(arg1, nSeal, '%3')
			
			if b then
				paladins[c] = s
			end
		end
	end
	-------------------------------------------------------------------------------
	local remSeal = function()
		local fSeal = EF_L_SEALOFFADESFROM	local ffSeal 	= string.find(arg1, fSeal)
		
		if ffSeal then
			local c = gsub(arg1, fSeal, '%2')
			
			paladins[c] = nil
		end
	end
	-------------------------------------------------------------------------------
	local judge = function()
		local cJudge = EF_L_JUDGEMENT			local fJudge 	= string.find(arg1, cJudge)
		
		if fJudge then
			local c = gsub(arg1, cJudge, '%1')			
			local b = gsub(arg1, cJudge, '%2')			b = b == EF_L_CAST or EF_L_CASTS and true or false
			
			if b  and paladins[c] then
				targetSeals[c] = EF_L_JUDGEMENTOF..paladins[c]
			end
		end
	end
	-------------------------------------------------------------------------------
	local refreshSealDebuff = function()
		local ph = EF_L_HITFOR			local fph = string.find(arg1, ph)	
		local pc = EF_L_CRITFOR			local fpc = string.find(arg1, pc)
		local oh = EF_L_HITSFOR			local foh = string.find(arg1, oh)
		local oc = EF_L_CRITSFOR		local foc = string.find(arg1, oc)
		
		if fph or fpc or foh or foc then
			local m = fph and ph or fpc and pc or foh and oh or foc and oc
			local c = gsub(arg1, m, '%1')		
			local t = gsub(arg1, m, '%2')

			if targetSeals[c] then
				SPELLCASTINGCORErefreshBuff(t, targetSeals[c], 1)
			end
		end
	end
	-------------------------------------------------------------------------------
	local eventHandler = function()
		local pSpell 	= 'CHAT_MSG_SPELL_PERIODIC_(.+)'		local fpSpell 		= string.find(event, pSpell)
		local breakAura = 'CHAT_MSG_SPELL_BREAK_AURA'			local fbreakAura 	= string.find(event, breakAura)
		local auraGone	= 'CHAT_MSG_SPELL_AURA_GONE_(.+)'		local fauraGone 	= string.find(event, auraGone)
		local dSpell 	= 'CHAT_MSG_SPELL_(.+)'					local fdSpell 		= string.find(event, dSpell)	
		local hits		= 'CHAT_MSG_COMBAT_(.+)_HITS'			local fhits			= string.find(event, hits)
				
		-- periodic damage/buff spells
		if fpSpell then	
			addSeal()
		-- fade/remove buffs
		elseif fbreakAura or fauraGone then
			--remSeal()
		-- direct damage/buff spells
		elseif fdSpell then
			judge()
		elseif fhits then
			refreshSealDebuff()
		end
	end
	-------------------------------------------------------------------------------
	local dummyFrame = CreateFrame'Frame'
	dummyFrame:RegisterEvent'PLAYER_LOGIN'

	dummyFrame:RegisterEvent'PLAYER_AURAS_CHANGED'
	dummyFrame:RegisterEvent'CHAT_MSG_COMBAT_SELF_HITS'
	dummyFrame:RegisterEvent'CHAT_MSG_COMBAT_PARTY_HITS'
	dummyFrame:RegisterEvent'CHAT_MSG_COMBAT_FRIENDLYPLAYER_HITS'
	dummyFrame:RegisterEvent'CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS'
 
	dummyFrame:RegisterEvent'CHAT_MSG_SPELL_SELF_DAMAGE'
	dummyFrame:RegisterEvent'CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE'
	dummyFrame:RegisterEvent'CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE'

	dummyFrame:RegisterEvent'CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS'
	dummyFrame:RegisterEvent'CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS'
	dummyFrame:RegisterEvent'CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS'
	dummyFrame:RegisterEvent'CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS'

	dummyFrame:RegisterEvent'CHAT_MSG_SPELL_BREAK_AURA'
	dummyFrame:RegisterEvent'CHAT_MSG_SPELL_AURA_GONE_SELF'
	dummyFrame:RegisterEvent'CHAT_MSG_SPELL_AURA_GONE_PARTY'
	dummyFrame:RegisterEvent'CHAT_MSG_SPELL_AURA_GONE_OTHER'

	dummyFrame:SetScript('OnEvent', function() 
		if event == 'PLAYER_LOGIN' then
			paladins 		= {}
			targetSeals 	= {}
		else
			eventHandler()
		end
	end)
	-------------------------------------------------------------------------------