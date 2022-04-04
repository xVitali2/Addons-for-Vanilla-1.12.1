	-------------------------------------------------------------------------------
	local L = enemyFrames.L
	local paladins 		= {}
	local targetSeals 	= {}
	local playerName = UnitName'player'
	-------------------------------------------------------------------------------
	local addSeal = function()
		local pnSeal = AURAADDEDSELFHELPFUL			local fpnSeal 	= string.find(arg1, enemyFrames:SanitizePattern(pnSeal))
		local onSeal = AURAADDEDOTHERHELPFUL			local fonSeal 	= string.find(arg1, enemyFrames:SanitizePattern(onSeal))
		
		if string.find(arg1, L['Seal of']) and (fpnSeal or fonSeal) then
			local m = fpnSeal and pnSeal or fonSeal and onSeal
			local first, second = enemyFrames:cmatch(arg1, m)
			local c = m == pnSeal and playerName or first
			local s = m == pnSeal and first or second
			
			if c and s then
				paladins[c] = s
			end
		end
	end
	-------------------------------------------------------------------------------
	local remSeal = function()
		local pfSeal = AURAREMOVEDSELF	local fpfSeal 	= string.find(arg1, enemyFrames:SanitizePattern(pfSeal))
		local ofSeal = AURAREMOVEDOTHER	local fofSeal 	= string.find(arg1, enemyFrames:SanitizePattern(ofSeal))
		
		if string.find(arg1, L['Seal of']) and (fpfSeal or fofSeal) then
			local m = fpfSeal and pfSeal or fofSeal and ofSeal
			local first, second = enemyFrames:cmatch(arg1, m)
			local s = first
			local c = m == pfSeal and playerName or second
			
			if s and c then
				paladins[c] = nil
			end
		end
	end
	-------------------------------------------------------------------------------
	local judge = function()
		local pHitsJudge = SPELLLOGSCHOOLSELFOTHER			local fpHitsJudge 	= string.find(arg1, enemyFrames:SanitizePattern(pHitsJudge))
		local pCritsJudge = SPELLLOGCRITSCHOOLSELFOTHER			local fpCritsJudge 	= string.find(arg1, enemyFrames:SanitizePattern(pCritsJudge))
		local oHitsJudge = SPELLLOGSCHOOLOTHEROTHER			local fHitsJudge 	= string.find(arg1, enemyFrames:SanitizePattern(oHitsJudge))
		local oCritsJudge = SPELLLOGCRITSCHOOLOTHEROTHER			local fCritsJudge 	= string.find(arg1, enemyFrames:SanitizePattern(oCritsJudge))
		
		if string.find(arg1, L['Judgement of']) and (fpHitsJudge or fpCritsJudge or fHitsJudge or fCritsJudge) then
			local m = fpHitsJudge and pHitsJudge or fpCritsJudge and pCritsJudge or fHitsJudge and oHitsJudge or fCritsJudge and oCritsJudge
			local first = enemyFrames:cmatch(arg1, m)
			local c = (fpHitsJudge or fpCritsJudge) and playerName or first
			
			if c and paladins[c] then
				targetSeals[c] = L['Judgement of']..' '..paladins[c]
			end
		end
	end
	-------------------------------------------------------------------------------
	local refreshSealDebuff = function()
		local ph = COMBATHITSELFOTHER			local fph = string.find(arg1, enemyFrames:SanitizePattern(ph))	
		local pc = COMBATHITCRITSELFOTHER			local fpc = string.find(arg1, enemyFrames:SanitizePattern(pc))
		local oh = COMBATHITOTHEROTHER			local foh = string.find(arg1, enemyFrames:SanitizePattern(oh))
		local oc = COMBATHITCRITOTHEROTHER			local foc = string.find(arg1, enemyFrames:SanitizePattern(oc))

		if fph or fpc or foh or foc then
			local m = fph and ph or fpc and pc or foh and oh or foc and oc
			local first, second = enemyFrames:cmatch(arg1, m)
			local c = (m == ph or m == pc) and playerName or first
			local t = (m == ph or m == pc) and first or second

			if targetSeals[c] then
				SPELLCASTINGCORErefreshBuff(t, targetSeals[c], 1) --print(c)
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