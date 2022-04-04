	-------------------------------------------------------------------------------
	local _, class = UnitClass'player'
	if class ~= 'ROGUE' then return end
	local L = enemyFrames.L
	-------------------------------------------------------------------------------
	SPELLINFO_UNIQUE_DEBUFFS[L['Rupture']]['display'] = true
	-------------------------------------------------------------------------------
	local processDebuff = function(tar, spell, cp)
		if cp > 0 and UnitExists(tar) and SPELLINFO_UNIQUE_DEBUFFS[spell] then
			local b = SPELLCASTINGCOREqueueBuff(UnitName(tar), spell, cp)
			--if b then 	
				--sendMSG('BF', UnitName(tar)..'/'..spell, cp, IsInsideBG())	
			--end
		end
	end
	-------------------------------------------------------------------------------
	local AHTooltip = CreateFrame("GameTooltip","RAHTooltip",UIParent,"GameTooltipTemplate")
	AHTooltip:SetOwner(UIParent,"ANCHOR_NONE")
	-------------------------------------------------------------------------------
	UseActionAHone = UseAction
	function UseAction( slot, checkFlags, checkSelf )
		AHTooltip:ClearLines()
		AHTooltip:SetAction(slot)
		local spellName = RAHTooltipTextLeft1:GetText()
		
		processDebuff('target', spellName, GetComboPoints())

		UseActionAH( slot, checkFlags, checkSelf )
	end
	-------------------------------------------------------------------------------
	CastSpellByNameRAH = CastSpellByName;
	function CastSpellByName(spellName, onself)
		
		processDebuff('target', spellName, GetComboPoints())
		
		CastSpellByNameRAH(spellName, onself)
	end
	-------------------------------------------------------------------------------
	local eventHandler = function()
	end
	local f = CreateFrame'Frame'
	f:RegisterEvent'SPELLCAST_FAILED'
	f:RegisterEvent'SPELLCAST_INTERRUPTED'
	f:RegisterEvent'SPELLCAST_START'
	f:RegisterEvent'SPELLCAST_STOP'
	f:SetScript('OnEvent', eventHandler)
	-------------------------------------------------------------------------------