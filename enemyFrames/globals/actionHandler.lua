	-------------------------------------------------------------------------------
	local function castingChecks(spell)
		if not ENEMYFRAMESPLAYERDATA['mouseOver'] or MOUSEOVERUNINAME == nil			then	return false	end
		
		if SPELLINFO_SINGLE_TARGET_BUFF_SPELLS[spell]	then	return false	end
		
		-- target mouseover unit
		TargetByName(MOUSEOVERUNINAME, true)
		return true
	end
	-------------------------------------------------------------------------------
	local AHTooltip = CreateFrame("GameTooltip","AHTooltip",UIParent,"GameTooltipTemplate")
	AHTooltip:SetOwner(UIParent,"ANCHOR_NONE")

	UseActionAH = UseAction
	function UseAction( slot, checkFlags, checkSelf )
		AHTooltip:ClearLines()
		AHTooltip:SetAction(slot)
		local spellName = AHTooltipTextLeft1:GetText()
		
		local currentTarget = UnitExists'target' and UnitName'target' or nil
		local b = castingChecks(spellName)
		
		UseActionAH( slot, checkFlags, checkSelf )
		
		if b then 
			if currentTarget == nil then	ClearTarget()	
			else	TargetByName(currentTarget, true)	end
		end	
	end
	-------------------------------------------------------------------------------
	CastSpellByNameAH = CastSpellByName;
	function CastSpellByName(spellName, onself)
		
		local currentTarget = UnitExists'target' and UnitName'target' or nil
		local b = castingChecks(spellName)
		
		CastSpellByNameAH(spellName, onself)
		
		if b then 
			if currentTarget == nil then	ClearTarget()	
			else	TargetByName(currentTarget, true)	end
		end	
	end
	-------------------------------------------------------------------------------