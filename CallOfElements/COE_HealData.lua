--[[

	CALL OF ELEMENTS
	The All-In-One Shaman Addon
	
	by Wyverex (2006)

	Healing Module Data
]]


--[[ ----------------------------------------------------------------
	COE.HealData contains a list of all heal spells that the 
	player possesses
-------------------------------------------------------------------]]
COE["HealData"] = {};
COE.HealData["Wave"] = { };
COE.HealData["Lesser"] = { };
COE.HealData["Sorted"] = {};


--[[ ----------------------------------------------------------------
	COE.DefClassHealth contains a an estimation of average player
	health by class. Stolen directly from PaladinAssistant :)
	Shaman added with a first estimation
-------------------------------------------------------------------]]
COE["DefClassHealth"] = {
	["WARRIOR"]	= { L1=30,	L60=4100 },
	["SHAMAN"]	= { L1=30,	L60=3500 },
	["ROGUE"]	= { L1=30,	L60=3100 },
	["HUNTER"]	= { L1=30,	L60=3100 },
	["DRUID"]	= { L1=30,	L60=3100 },
	["WARLOCK"]	= { L1=30,	L60=2300 },
	["MAGE"]	= { L1=30,	L60=2200 },
	["PRIEST"]	= { L1=30,	L60=2100 }
	};


--[[ ----------------------------------------------------------------
	METHOD: COE:CreateHealingSpell
	
	PURPOSE: Creates a new healing spell object with default values
-------------------------------------------------------------------]]
function COE:CreateHealingSpell()

	return { SpellID = 0, Type = "", Rank = 0, Mana = 0, MinAmount = 0, 
		MaxAmount = 0, AvgAmount = 0 };

end


--[[ ----------------------------------------------------------------
	METHOD: COE:LocalizedSpell
	
	PURPOSE: Returns the english name for a healing spell 
-------------------------------------------------------------------]]
function COE:LocalizedSpell( spellname )

	if( spellname == COESTR_HEALINGWAVE ) then
		return "Wave";
	elseif( spellname == COESTR_LESSERWAVE ) then
		return "Lesser";
	else
		return spellname;
	end
		
end


--[[ ----------------------------------------------------------------
	METHOD: COEAvgHealComparator
	
	PURPOSE: Comparator for sorting the healing spells for BestHeal
		Spells are sorted by average amount of healing 
-------------------------------------------------------------------]]
function COEAvgHealComparator( x, y )

	return x.AvgAmount < y.AvgAmount;

end


--[[ ----------------------------------------------------------------
	METHOD: COE:ScanHealingSpells
	
	PURPOSE: Scans the spellbook for available healing spells and
		populates the COE.HealData list
-------------------------------------------------------------------]]
function COE:ScanHealingSpells()

	COE:DebugMessage( "Scanning Healing Spells..." );
	
	-- delete existing healing spells
	-- -------------------------------
	COE.HealData = {};
	COE.HealData.Wave = { };
	COE.HealData.Lesser = { };
	COE.HealData.Sorted = {};

	-- iterate over all spells in the spellbook
	-- -----------------------------------------
	local i = 1;
	while true do
	
		local SpellName, SpellRank = GetSpellName( i, BOOKTYPE_SPELL );
		if not SpellName then
			do break end;
		end
		
		-- is this a healing spell?
		-- -------------------------
		if( string.find( SpellName, COESTR_HEALINGWAVE ) ~= nil or
			string.find( SpellName, COESTR_LESSERWAVE ) ~= nil ) then

			local valid = true;			
			local heal = COE:CreateHealingSpell();
			heal.SpellID = i;
			heal.Type = SpellName;

			-- extract mana cost and amount of healing from the tooltip
			-- ---------------------------------------------------------
			COETotemTT:SetSpell( i, BOOKTYPE_SPELL );
					
			local text = COETotemTTTextLeft2:GetText();
			local _,_,value = string.find( text, COESTR_TOTEMMANA );
			if( value ) then
				heal.Mana = tonumber( value );
			else
				valid = false;
			end			
			
			text = COETotemTTTextLeft4:GetText();
			_,_,value = string.find( text, COESTR_MINAMOUNT );
			if( value ) then
				heal.MinAmount = tonumber( value );
			else
				valid = false;
			end

			_,_,value = string.find( text, COESTR_MAXAMOUNT );
			if( value ) then
				heal.MaxAmount = tonumber( value );
			else
				valid = false;
			end
			
			-- valid spell?
			-- -------------
			if( valid ) then
				heal.AvgAmount = heal.MinAmount + (heal.MaxAmount - heal.MinAmount) / 2;
			
				local spell = COE:LocalizedSpell( SpellName );
				table.insert( COE.HealData[spell], heal );
				table.insert( COE.HealData.Sorted, heal );

				heal.Rank = table.getn( COE.HealData[spell] );
				
				COE:DebugMessage( "Found healing spell: " .. SpellName .. " (Rank " .. table.getn( COE.HealData[spell] ) .. ")" );
			end
			
		end

		i = i + 1;

	end
	
	-- sort the list for BestHeal
	-- ---------------------------
	table.sort( COE.HealData.Sorted, COEAvgHealComparator );
	
end
