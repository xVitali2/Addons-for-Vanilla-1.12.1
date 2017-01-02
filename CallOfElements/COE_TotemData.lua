--[[

	CALL OF ELEMENTS
	The All-In-One Shaman Addon
	
	by Wyverex (2006)
	
	
	Totem Module Data
	
]]

--[[ ----------------------------------------------------------------
	COE.TotemData contains a list of totem classes that are
	returned by COE:CreateTotem
	For every available totem the player has, one object is
	added to this list
-------------------------------------------------------------------]]
COE["TotemData"] = {};
COE["TotemCount"] = 0;


--[[ ----------------------------------------------------------------
	COE.MaxTotems stores the maximum number of totems per element
	This is taken right from the current game content
-------------------------------------------------------------------]]
COE["MaxTotems"] = { Earth = 5, Fire = 5, Water = 7, Air = 7 };


--[[ ----------------------------------------------------------------
	COE.TotemsAvailable contains the number of totems available
	of each element
-------------------------------------------------------------------]]
COE["TotemsAvailable"] = {};
COE.TotemsAvailable["Earth"] = 0;
COE.TotemsAvailable["Fire"] = 0;
COE.TotemsAvailable["Water"] = 0;
COE.TotemsAvailable["Air"] = 0;


--[[ ----------------------------------------------------------------
	COE.ActiveTotems contains a pointer to the active totem of
	each element

	COE.TotemPending contains a pointer to the last totem spell
	that was initiated but not yet completed. This lets COE check
	whether something went wrong while casting (sitting etc.) by
	activating the timer first when SPELLCAST_STOP is fired
	After the timeout a pending totem timer is automatically removed
	to prevent actions that trigger SPELLCAST_STOP and are not
	hooked from activating the timer accidentally
-------------------------------------------------------------------]]
COE["ActiveTotems"] = { Earth = nil, Fire = nil, Water = nil, Air = nil };
COE["TotemPending"] = { Totem = nil, UseRank = 0, Timeout = 0.75 };


--[[ ----------------------------------------------------------------
	COE.CleansingTotems stores pointers to the buttons and totems
	that are able to cleanse poisons, diseases and sleep, charm
	or fear effects
-------------------------------------------------------------------]]
COE["CleansingTotems"] = { 
Poison = { Totem = nil, Button = nil, Warn = false },
Disease = { Totem = nil, Button = nil, Warn = false },
Tremor = { Totem = nil, Button = nil, Warn = false } };


--[[ ----------------------------------------------------------------
	COE.TotemSets contains the totem pointers for each set and
	element
-------------------------------------------------------------------]]
COE["TotemSetCount"] = 0;
COE["TotemSets"] = { }


--[[ ----------------------------------------------------------------
	COE.SetCycle stores which totem of the active set have
	already been thrown
-------------------------------------------------------------------]]
COE["SetCycle"] = { Earth = false, Fire = false, Water = false, Air = false };


--[[ ----------------------------------------------------------------
	COE.NoTotem is a placeholder for an empty anchor button
-------------------------------------------------------------------]]
COE["NoTotem"] = { SpellName = "", Element = "", Texture = "Interface\\Icons\\INV_Misc_Idol_03.blp",
	ToolPresent = false, Ranks = { SpellID = 0, Mana = 0, Duration = 0, Health = 0, Cooldown = 0 },
	MaxRank = 1, isActive = false, CurDuration = 0, CurHealth = 0, CurCooldown = 0 };


--[[ ----------------------------------------------------------------
	METHOD: COE:CreateTotem
	
	PURPOSE: Returns the totem class for a new totem
-------------------------------------------------------------------]]
function COE:CreateTotem()
	return { SpellName = "", Element = "", Texture = "", 
		ToolPresent = false, Ranks = {}, MaxRank = 0, isActive = false,
		CurDuration = 0, CurHealth = 0, CurCooldown = 0,
		isTrinket = false, TrinketSlot = nil };
end


--[[ ----------------------------------------------------------------
	METHOD: COE:CreateTotemRank
	
	PURPOSE: Returns the class for a new totem rank
-------------------------------------------------------------------]]
function COE:CreateTotemRank()
	return { SpellID = 0, Mana = 0, Duration = 0, Health = 0, Cooldown = 0 };
end


--[[ ----------------------------------------------------------------
	METHOD: COE:ElementFromTool
	
	PURPOSE: Returns the element corresponding to a totem tool.
		This is needed for the french version to work. In the
		english and german versions it just returns the input
-------------------------------------------------------------------]]
function COE:ElementFromTool( element )

	if element == COESTR_TOTEMTOOLS_EARTH then
    	return COESTR_ELEMENT_EARTH;
	elseif element == COESTR_TOTEMTOOLS_FIRE then
    	return COESTR_ELEMENT_FIRE;
	elseif element == COESTR_TOTEMTOOLS_WATER then
    	return COESTR_ELEMENT_WATER;
	elseif element == COESTR_TOTEMTOOLS_AIR then
    	return COESTR_ELEMENT_AIR;
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE:LocalizedElement
	
	PURPOSE: Translates a localized element name into english
-------------------------------------------------------------------]]
function COE:LocalizedElement( element )

	if( element == COESTR_ELEMENT_EARTH ) then
		return "Earth";
	elseif( element == COESTR_ELEMENT_FIRE ) then
		return "Fire";
	elseif( element == COESTR_ELEMENT_WATER ) then
		return "Water";
	elseif( element == COESTR_ELEMENT_AIR ) then
		return "Air";
	end
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE:ScanTotems
	
	PURPOSE: Scans the spellbook for available totems and
		populates the COE.TotemData list
-------------------------------------------------------------------]]
function COE:ScanTotems()

	COE:DebugMessage( "Scanning Totems..." );
	
	-- delete existing totem objects
	-- ------------------------------
	COE.TotemData = {};
	COE.TotemCount = 0;
	COE.TotemsAvailable.Earth = 0;
	COE.TotemsAvailable.Fire = 0;
	COE.TotemsAvailable.Water = 0;
	COE.TotemsAvailable.Air = 0;

	-- iterate over all spells in the spellbook
	-- -----------------------------------------
	local i, k = 1;
	while true do
	
		local SpellName, SpellRank = GetSpellName( i, BOOKTYPE_SPELL );
		if not SpellName then
			do break end;
		end
		
		-- is this a totem?
		-- -----------------
		if( string.find( SpellName, COESTR_SCANTOTEMS ) ~= nil ) then
		
			local newtotem = true;
			local totem = nil;
			
			-- get the rank value
			-- -------------------
			local _,_,rank = string.find( SpellRank, COESTR_TOTEMRANK );
			if( not rank ) then
				rank = 1;
			else
				rank = tonumber( rank );
			end

			-- =======================================================================			
			-- check if totem already exists with another rank in the list
			-- =======================================================================			
			for k = 1, COE.TotemCount do
				if( SpellName == COE.TotemData[k].SpellName ) then
					-- use existing totem object
					-- --------------------------
					totem = COE.TotemData[k];
					newtotem = false;
					break;
				end
			end

			COETotemTT:SetSpell( i, BOOKTYPE_SPELL );

			-- =======================================================================			
			-- create new totem object if not found
			-- =======================================================================			
			if( not totem ) then
				totem = COE:CreateTotem();
			
				-- set totem spell name
				-- ---------------------
				totem.SpellName = SpellName;
			
				-- get totem school from tooltip
				-- ------------------------------
				local text = COETotemTTTextLeft4;
				if( text and text:GetText() ) then
			
					local _,_, element = string.find( text:GetText(), COESTR_TOTEMTOOLS );
					if( element ) then
					
						-- if element starts with a |, the player does
						-- not possess the needed totem for this spell
						-- extract the color code before using the element
						-- ------------------------------------------------
						if( string.sub( element, 1, 1 ) == "|" ) then
							element = string.sub( element, 11 );
						end
						
						-- get element from tool
						-- ----------------------
						element = COE:ElementFromTool( element );
						
						-- translate element to english
						-- -----------------------------
						element = COE:LocalizedElement( element );
						
						-- valid element?
						-- ---------------
						if( COE.TotemsAvailable[element] ~= nil ) then
							totem.Element = element;
							COE.TotemsAvailable[element] = COE.TotemsAvailable[element] + 1;
						else
							COE:Message( COESTR_INVALIDELEMENT .. SpellName );
						end										
					end
				end
				
				-- get totem texture
				-- ------------------
				totem.Texture = GetSpellTexture( i, BOOKTYPE_SPELL );
			
				-- get tool presence
				-- ------------------
				totem.ToolPresent = COE:IsToolPresent( i );
			end

			-- =======================================================================			
			-- create new totem rank
			-- =======================================================================			
			local totemrank = COE:CreateTotemRank();
			
			-- set totem spell id
			-- -------------------
			totemrank.SpellID = i;
			
			-- get totem mana cost from tooltip
			-- ---------------------------------
			text = COETotemTTTextLeft2;
			if( text and text:GetText() ) then
			
				local _,_, mana = string.find( text:GetText(), COESTR_TOTEMMANA );
				if( mana ) then
					totemrank.Mana = tonumber( mana );
				end
			end
			
			-- get totem duration and health
			-- ------------------------------
			totemrank.Duration, totemrank.Health, totemrank.Cooldown = COE:GetTotemDurationAndHealth( i );
			
			-- store rank in totem
			-- --------------------
			totem.Ranks[rank] = totemrank;
			if( rank > totem.MaxRank ) then
				totem.MaxRank = rank;
			end		
			
			-- is this a new totem?
			-- ---------------------
			if( newtotem ) then
				-- store totem
				-- ------------
				COE.TotemCount = COE.TotemCount + 1;
				COE.TotemData[COE.TotemCount] = totem;

				
				-- check if it's a cleansing totem
				-- --------------------------------
				if( SpellName == COESTR_TOTEMPOISON ) then
					COE.CleansingTotems.Poison.Totem = totem;
				elseif( SpellName == COESTR_TOTEMDISEASE ) then
					COE.CleansingTotems.Disease.Totem = totem;
				elseif( SpellName == COESTR_TOTEMTREMOR ) then
					COE.CleansingTotems.Tremor.Totem = totem;
				end
				
				COE:DebugMessage( "Found totem: " .. SpellName );
			end
			
			-- =======================================================================			
			-- check visibility options
			-- =======================================================================

			if( COE_DisplayedTotems[SpellName] == nil ) then
				-- perhaps a new totem. set it to default visible
				-- and reorder it when the element count is known
				-- -----------------------------------------------
				COE_DisplayedTotems[SpellName] = { Order = 0, Element = totem.Element, Visible = true };
			else
				-- update old saved variables versions by adding the element
				-- ----------------------------------------------------------
				COE_DisplayedTotems[SpellName]["Element"] = totem.Element;
			end
		end
	
		i = i + 1;
	end

	-- ====================================
	-- Trinket support
	-- ====================================
		
	-- create the trinket totem even if the player doesn't have it.
	-- this makes handling it much simpler and the player can choose
	-- to make it invisible anyway
	-- the player needs to have at least one water totem though
	-- --------------------------------------------------------------
	if( COE.TotemsAvailable.Water > 0 ) then
		local trinket = COE:CreateTotem();
		trinket.SpellName = "Trinket";
		trinket.Element = "Water";
		trinket.Texture = "Interface\\Icons\\INV_Wand_01"; 
		trinket.isTrinket = true;
		trinket.ToolPresent, trinket.TrinketSlot = COE:IsTrinketPresent();
		trinket.Ranks[0] = COE:CreateTotemRank();
		trinket.Ranks[0].Duration = 24;
		trinket.Ranks[0].Health = 5;
		trinket.Ranks[0].Cooldown = 180;
	
		-- store totem
		-- ------------
		COE.TotemsAvailable.Water = COE.TotemsAvailable.Water + 1;
		COE.TotemCount = COE.TotemCount + 1;
		COE.TotemData[COE.TotemCount] = trinket;

		if( COE_DisplayedTotems[trinket.SpellName] == nil ) then
			-- perhaps a new totem. set it to default visible
			-- and reorder it when the element count is known
			-- -----------------------------------------------
			COE_DisplayedTotems[trinket.SpellName] = { Order = 0, Visible = true };
		end
	end

	-- ===================================
	-- Finish
	-- ===================================
	
	COE:DebugMessage( "Found " .. COE.TotemCount .. " totems in spellbook" .. 
		"(" .. COE.TotemsAvailable.Earth .. " Earth, " ..
		COE.TotemsAvailable.Fire .. " Fire, " .. COE.TotemsAvailable.Water .. " Water, " ..
		COE.TotemsAvailable.Air .. " Air)" );
	
	-- reorder new totems
	-- -------------------
	COE:ReorderNewTotems();
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE:GetTotemDurationAndHealth
	
	PURPOSE: Extracts the duration of the totem out of the tooltip
		When there is more than one time specification present,
		the one with the longer duration is used since this is the
		totem duration then
		Also the health and the cooldown of the totem are returned
-------------------------------------------------------------------]]
function COE:GetTotemDurationAndHealth( spellid )

	COETotemTTTextRight3:SetText( nil );
	COETotemTT:SetSpell( spellid, BOOKTYPE_SPELL );
	text = COETotemTTTextLeft5:GetText();
	
	if( not text ) then
		COE:DebugMessage( "nil text with id: " .. spellid );
		return 0, 0;
	end
	
	local duration = 0;
	local health = 0;
	local cooldown = 0;

	-- ===============================================================
	-- 		Duration	
	-- ===============================================================	

	-- first search for a minute specification
	-- if we find one it is surely the totem duration
	-- -----------------------------------------------
	local _,_,minutetext = string.find( text, COESTR_MINUTEDURATION );
	if( minutetext ) then
		-- calculate the duration in seconds
		-- ----------------------------------
		local min = tonumber( string.sub( minutetext, 1, 1 ) );
		local sec = tonumber( string.sub( minutetext, 3, 4 ) ) / 100 * 60;
		
		duration = min * 60 + sec;
	else
		_,_,minutetext = string.find( text, COESTR_MINUTEDURATION_INT );
		if( minutetext ) then
			duration = tonumber( minutetext ) * 60;
		else
			-- now test for a duration in seconds
			-- -----------------------------------
			local _,b,sectext1 = string.find( text, COESTR_SECDURATION );
			if( sectext1 ) then
			
				-- look if there are two second specifications
				-- if so, take the greate one
				-- --------------------------------------------
				local _,_,sectext2 = string.find( string.sub( text, b ), COESTR_SECDURATION ); 
				
				if( sectext2 ) then
					duration = math.max( tonumber( sectext1 ), tonumber( sectext2 ) );
				else
					duration = tonumber( sectext1 );
				end 
			end
		end
	end
	
	-- ===============================================================
	-- 		Health	
	-- ===============================================================	

	for num, regex in COESTR_TOTEMHEALTH do
		local match = { string.gfind( text, regex )() };
		if ( table.getn(match) >= 1 ) then

			health = tonumber( match[1] );
			break;
		end
	end
	
	-- ===============================================================
	-- 		Cooldown	
	-- ===============================================================	

	text = COETotemTTTextRight3:GetText();
	
	if( not text ) then
		cooldown = 0;
	else
		_,_,cooldown = string.find( text, COESTR_SECDURATION );
		if( cooldown ) then
			cooldown = tonumber( cooldown );
		else
			_,_,cooldown = string.find( text, COESTR_MINUTEDURATION_INT );
			if( cooldown ) then
				cooldown = tonumber( cooldown ) * 60;
			else
				cooldown = 0;
			end
		end			
	end	

	return duration, health, cooldown;

end


--[[ ----------------------------------------------------------------
	METHOD: COE:IsToolPresent
	
	PURPOSE: Checks if the player has the totem of the specified
		element in his inventory
		
		This is done by testing the color of the "Tools:" section
		in the totem tooltip
-------------------------------------------------------------------]]
function COE:IsToolPresent( spellid )

	-- get totem tooltip
	-- ------------------
	COETotemTT:SetSpell( spellid, BOOKTYPE_SPELL );

	-- test for presence of the totem tool
	-- ------------------------------------
	local text = COETotemTTTextLeft4;
	if( text and text:GetText() ) then
			
		local _,_, element = string.find( text:GetText(), COESTR_TOTEMTOOLS );
		if( element ) then
					
			-- if element doesn't start with a |, the player
			-- possesses the needed totem for this spell
			-- ------------------------------------------------
			if( string.sub( element, 1, 1 ) ~= "|" ) then
				return true;
			end
		end
	end		

	return false;
end


--[[ ----------------------------------------------------------------
	METHOD: COE:IsTrinketPresent
	
	PURPOSE: Checks if the player has the enamored water spirit 
		trinket equipped and returns the trinket slot
		
	RETURNS: equipped, slot 
-------------------------------------------------------------------]]
function COE:IsTrinketPresent()

	for i = 0, 1 do
		local slot = GetInventorySlotInfo( "Trinket" .. i .. "Slot" );
		local item = GetInventoryItemLink( "player", slot );

		if( item ) then
			local itemname = string.find( item, COESTR_TRINKET );
			if( itemname ) then
				-- trinket is equipped
				-- --------------------
				return true, slot;
			end
		end
	end
	
	return false, nil;	

end


--[[ ----------------------------------------------------------------
	METHOD: COE:ReorderNewTotems
	
	PURPOSE: Assigns each COE_DisplayedTotems entry with a zero
		order a valid order depending on the number of available
		totems in this element
-------------------------------------------------------------------]]
function COE:ReorderNewTotems()

	local nextslot = { Earth = COE.TotemsAvailable.Earth, Fire = COE.TotemsAvailable.Fire,
		Water = COE.TotemsAvailable.Water, Air = COE.TotemsAvailable.Air };
		
	local used = { Earth = {}, Fire = {}, Water = {}, Air = {} };
	local bError = false;  

	local k;
	for k = 1, COE.TotemCount do
		
		local totem = COE.TotemData[k];
		if( COE_DisplayedTotems[totem.SpellName] ~= nil ) then
			if( COE_DisplayedTotems[totem.SpellName].Order == 0 ) then

				-- this totem has just been added				
				-- assign the currently free slot
				-- -------------------------------
				COE_DisplayedTotems[totem.SpellName].Order = nextslot[totem.Element];
				nextslot[totem.Element] = nextslot[totem.Element] - 1;
			end

			-- register that this slot of the element is now in use
			-- mark as error if already in use
			-- -----------------------------------------------------
			if( used[totem.Element][COE_DisplayedTotems[totem.SpellName].Order] == nil ) then
				used[totem.Element][COE_DisplayedTotems[totem.SpellName].Order] = true;
			else
				bError = true;
			end		
		end
	end
	
	-- are there multiple entries for one slot?
	-- -----------------------------------------
	if( bError ) then
		-- there is something wrong with the saved variables
		-- reset all ordering and reassign it
		-- --------------------------------------------------
		for k = 1, COE.TotemCount do

			local totem = COE.TotemData[k];
			if( COE_DisplayedTotems[totem.SpellName] ~= nil ) then
				COE_DisplayedTotems[totem.SpellName].Order = 0;
			end
		end

		COE:ReorderNewTotems();		
		
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE:InitTotemSets
	
	PURPOSE: Fills the COE.TotemSets list with the totem objects
		corresponding to the spell names saved in COEOPT_TOTEMSETS
-------------------------------------------------------------------]]
function COE:InitTotemSets()

	local indices = { "Earth", "Fire", "Water", "Air" };

	COE.TotemSets = {};

	-- for each standard set
	-- ----------------------
	local set;
	for set = 1, table.getn( COE_SavedTotemSets ) do

		COE.TotemSets[set] = { Earth = nil, Fire = nil, Water = nil, Air = nil, 
			CastOrder = COE_SavedTotemSets[set].CastOrder };
	
		-- for each element
		-- -----------------
		local k, totem;
		for k = 1,4 do

			if( COE_SavedTotemSets[set][indices[k]] ~= "" ) then
			
				-- iterate over all totems
				-- ------------------------
				for totem in COE.TotemData do
				
					if( COE.TotemData[totem].SpellName == COE_SavedTotemSets[set][indices[k]] ) then
						COE.TotemSets[set][indices[k]] = COE.TotemData[totem];
					end
				end
			end
		end	
	end

	-- for each custom set
	-- --------------------
	for set = 1, table.getn( COE_CustomTotemSets ) do
	
		COE.TotemSets[COESET_DEFAULT + set] = { Earth = nil, Fire = nil, Water = nil, Air = nil, 
			CastOrder = COE_CustomTotemSets[set].CastOrder };

		-- for each element
		-- -----------------
		local k, totem;
		for k = 1,4 do

			if( COE_CustomTotemSets[set][indices[k]] ~= "" ) then
			
				-- iterate over all totems
				-- ------------------------
				for totem in COE.TotemData do
				
					if( COE.TotemData[totem].SpellName == COE_CustomTotemSets[set][indices[k]] ) then
						COE.TotemSets[COESET_DEFAULT + set][indices[k]] = COE.TotemData[totem];
					end
				end
			end
		end	
	end

	COE.TotemSetCount = table.getn( COE.TotemSets );  
	
end


--[[ =============================================================================================

										F I X E S 

================================================================================================]]

--[[ ----------------------------------------------------------------
	METHOD: COE:Fix_CastOrderLocalization
	
	PURPOSE: Correctly localizes the element names in the 
		cast order in COE_SavedTotemSets
-------------------------------------------------------------------]]
function COE:Fix_CastOrderLocalization()

	-- for each standard set
	-- ----------------------
	local set, k;
	for set = 1, table.getn( COE_SavedTotemSets ) do
		
		for k = 1, 4 do
			if( COE_SavedTotemSets[set].CastOrder[k] == "Earth" ) then
				COE_SavedTotemSets[set].CastOrder[k] = COESTR_ELEMENT_EARTH;
					 
			elseif( COE_SavedTotemSets[set].CastOrder[k] == "Fire" ) then
				COE_SavedTotemSets[set].CastOrder[k] = COESTR_ELEMENT_FIRE;
					 
			elseif( COE_SavedTotemSets[set].CastOrder[k] == "Water" ) then
				COE_SavedTotemSets[set].CastOrder[k] = COESTR_ELEMENT_WATER;
					 
			elseif( COE_SavedTotemSets[set].CastOrder[k] == "Air" ) then
				COE_SavedTotemSets[set].CastOrder[k] = COESTR_ELEMENT_AIR;
			end
		end
	end

	-- notify user
	-- ------------
	COE:Message( COESTR_FIXEDSETS );
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE:Fix_DisplayedTotems
	
	PURPOSE: Fixes errors in the COE_DisplayedTotems array
-------------------------------------------------------------------]]
function COE:Fix_DisplayedTotems()

	local i;
	local fixed = false;
	foreach( COE_DisplayedTotems, function( index, value ) 

		-- is this an old-style entry?
		-- ----------------------------
		if( type( value ) == "boolean" ) then
			COE_DisplayedTotems[index] = { Order = 0, Visible = value };
			fixed = true;
			
		elseif( type( value ) == "table" ) then
			if( COE_DisplayedTotems[index].Visible == nil ) then
				COE_DisplayedTotems[index].Visible = true;
				fixed = true;
			end
			
			if( COE_DisplayedTotems[index].Order == nil ) then
				COE_DisplayedTotems[index].Order = 0;
				fixed = true;
			end
		
		else
			COE_DisplayedTotems[index] = { Order = 0, Visible = value };
			fixed = true;
		end 
	
	end  );

	-- notify user
	-- ------------
	if( fixed ) then
		COE:Message( COESTR_FIXEDDISPLAY );
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE:Fix_CastOrderLocalization2
	
	PURPOSE: Correctly localizes the element names in the 
		cast order in COE_SavedTotemSets
-------------------------------------------------------------------]]
function COE:Fix_CastOrderLocalization2()

	-- for each standard set
	-- ----------------------
	local set, k;
	for set = 1, table.getn( COE_SavedTotemSets ) do
		
		for k = 1, 4 do
			if( COE_SavedTotemSets[set].CastOrder[k] == COESTR_TOTEMTOOLS_EARTH ) then
				COE_SavedTotemSets[set].CastOrder[k] = COESTR_ELEMENT_EARTH;
					 
			elseif( COE_SavedTotemSets[set].CastOrder[k] == COESTR_TOTEMTOOLS_FIRE ) then
				COE_SavedTotemSets[set].CastOrder[k] = COESTR_ELEMENT_FIRE;
					 
			elseif( COE_SavedTotemSets[set].CastOrder[k] == COESTR_TOTEMTOOLS_WATER ) then
				COE_SavedTotemSets[set].CastOrder[k] = COESTR_ELEMENT_WATER;
					 
			elseif( COE_SavedTotemSets[set].CastOrder[k] == COESTR_TOTEMTOOLS_AIR ) then
				COE_SavedTotemSets[set].CastOrder[k] = COESTR_ELEMENT_AIR;
			end
		end
	end

	-- for each custom set
	-- --------------------
	for set = 1, table.getn( COE_CustomTotemSets ) do
		
		for k = 1, 4 do
			if( COE_CustomTotemSets[set].CastOrder[k] == COESTR_TOTEMTOOLS_EARTH ) then
				COE_CustomTotemSets[set].CastOrder[k] = COESTR_ELEMENT_EARTH;
					 
			elseif( COE_CustomTotemSets[set].CastOrder[k] == COESTR_TOTEMTOOLS_FIRE ) then
				COE_CustomTotemSets[set].CastOrder[k] = COESTR_ELEMENT_FIRE;
					 
			elseif( COE_CustomTotemSets[set].CastOrder[k] == COESTR_TOTEMTOOLS_WATER ) then
				COE_CustomTotemSets[set].CastOrder[k] = COESTR_ELEMENT_WATER;
					 
			elseif( COE_CustomTotemSets[set].CastOrder[k] == COESTR_TOTEMTOOLS_AIR ) then
				COE_CustomTotemSets[set].CastOrder[k] = COESTR_ELEMENT_AIR;
			end
		end
	end

end

