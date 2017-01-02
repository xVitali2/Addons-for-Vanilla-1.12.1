--[[

	CALL OF ELEMENTS
	The All-In-One Shaman Addon
	
	by Wyverex (2006)

	Healing Module
]]

if( not COE_Heal ) then
	COE_Heal = {};
end


--[[ ----------------------------------------------------------------
	COE_Heal.Thresholds stores different healing thresholds
	
	HealingNeeded - A target is only healed if it has less than
		this health ratio

	OverrideTarget - If a friendly target is active and a heal is
		attempted, this target is only healed if no party/raid
		member is below this health ration threshold
-------------------------------------------------------------------]]
COE_Heal["Thresholds"] = { HealingNeeded = 0.85, OverrideTarget = 0.5 };


--[[ ----------------------------------------------------------------
	METHOD: COE_Heal:Init
	
	PURPOSE: Registers events
-------------------------------------------------------------------]]
function COE_Heal:Init()

	-- addon loaded?
	-- --------------
	if( not COE.Initialized ) then
		return;
	end

	this:RegisterEvent( "PLAYER_ENTERING_WORLD" );

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Heal:OnEvent
	
	PURPOSE: Handles In-Game events
-------------------------------------------------------------------]]
function COE_Heal:OnEvent( event )

	if( event == "PLAYER_ENTERING_WORLD" ) then
		-- load healing spells
		-- --------------------
		COE:ScanHealingSpells();
	end

end

--[[ =============================================================================================

						P U B L I C   H E A L I N G   F U N C T I O N S 

================================================================================================]]

--[[ ----------------------------------------------------------------
	METHOD: COE_Heal:BestHeal
	
	PURPOSE: Determines the party/raid member with the lowest
		health ratio and attempts to heal him with the best
		possible heal spell but still tries to be as mana
		efficient as possible
-------------------------------------------------------------------]]
function COE_Heal:BestHeal()

	COE_Heal:Heal( "best" );
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Heal:BattleHeal
	
	PURPOSE: Determines the party/raid member with the lowest
		health ratio and attempts to heal him with the heal spell 
		that has the shortest possible cast time but still heals
		him a good amount.
		If Nature's Swiftness is active, it uses BestHeal instead 
-------------------------------------------------------------------]]
function COE_Heal:BattleHeal()

	COE_Heal:Heal( "battle" );
		
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Heal:Heal
	
	PURPOSE: Performs the healing logic 
-------------------------------------------------------------------]]
function COE_Heal:Heal( type )

	-- first determine the target to be healed
	-- ----------------------------------------
	local target = COE_Heal:DetermineHealTarget();
	
	if( target.ratio > COE_Heal.Thresholds.HealingNeeded ) then
		-- no healing needed
		-- -------------------
		COE:Message( COESTR_NOHEALING );
		return;
	end

	COE:DebugMessage( "Attempting to heal " .. target.target .. " with health ratio: " .. target.ratio .. 
		" (missing: " .. target.max - target.current .. ")" );

	-- then determine the right spell and rank to use
	-- -----------------------------------------------
	local id, spell, rank;
	if( type == "best" ) then
		id, spell, rank = COE_Heal:DetermineBestSpell( COE.HealData.Sorted, target.max - target.current );
	else
		id, spell, rank = COE_Heal:DetermineBattleSpell( target.max - target.current );
	end
	
	if( not id ) then
		return;
	end
	
	COE:DebugMessage( "Using " .. spell .. " (Rank " .. rank .. ")" );
	
	-- is the spell usable?
	-- ---------------------
	local start, duration = GetSpellCooldown( id, BOOKTYPE_SPELL );
	if( start > 0 or duration > 0 ) then
		COE:Message( spell .. COESTR_HEALCOOLDOWN );
		return;
	end
	
	-- is the target in range?
	-- ------------------------

	-- cast spell
	-- -----------
	COE:Message( string.format( COESTR_HEALING, UnitName( target.target ), spell, rank ) );
	CastSpell( id, BOOKTYPE_SPELL );
	SpellTargetUnit( target.target );


end


--[[ =============================================================================================
		
							H E A L I N G   L O G I C 

================================================================================================]]

--[[ ----------------------------------------------------------------
	METHOD: COE_Heal:DetermineHealTarget
	
	PURPOSE: Determines the party/raid member with 
		the lowest health ratio which can also be the player himself
		If a friendly non-party/non-raid target is active, 
		it will return this target instead, if no party/raid 
		member falls below the OverrideTarget threshold 
-------------------------------------------------------------------]]
function COE_Heal:DetermineHealTarget()
	
	local toBeHealed = { target = nil, ratio = 1.0, current = 0, max = 0 };
	
	-- first check the player
	-- -----------------------
	local curHealth = UnitHealth( "player" );
	local maxHealth = UnitHealthMax( "player" ) 
	local curRatio =  curHealth / maxHealth;
	
	toBeHealed.target = "player";
	toBeHealed.ratio = curRatio;
	toBeHealed.current = curHealth;
	toBeHealed.max = maxHealth;	
	
	-- then check the party
	-- ---------------------
	local i;
	for i = 1, GetNumPartyMembers() do
		curHealth = UnitHealth( "party" .. i );
		maxHealth = UnitHealthMax( "party" .. i ) 
		curRatio =  curHealth / maxHealth;
		
		if( curRatio < toBeHealed.ratio and curHealth ~= 0 ) then
			toBeHealed.target = "party" .. i;
			toBeHealed.ratio = curRatio;
			toBeHealed.current = curHealth;
			toBeHealed.max = maxHealth;	
		end 
	end
	
	-- finally check the raid
	-- -----------------------
	for i = 1, GetNumRaidMembers() do
		curHealth = UnitHealth( "raid" .. i );
		maxHealth = UnitHealthMax( "raid" .. i ) 
		curRatio =  curHealth / maxHealth;
		
		if( curRatio < toBeHealed.ratio and curHealth ~= 0 ) then
			toBeHealed.target = "raid" .. i;
			toBeHealed.ratio = curRatio;
			toBeHealed.current = curHealth;
			toBeHealed.max = maxHealth;	
		end 
	end
	
	-- do we have a friendly target?
	-- ------------------------------
	if( UnitExists( "target" ) and UnitIsFriend( "player", "target" ) ) then
		local _,class = UnitClass( "target" );
		local scale = ( COE.DefClassHealth[class].L60 - COE.DefClassHealth[class].L1 ) / 59;

		if( UnitInParty( "target" ) or UnitInRaid( "target" ) ) then
			curHealth = UnitHealth( "target" );
			maxHealth = UnitHealthMax( "target" );
		else
			-- estimate the target's real health
			-- ----------------------------------
			maxHealth = scale * UnitLevel( "target" ) + COE.DefClassHealth[class].L1;
			curHealth =  maxHealth * UnitHealth( "target" ) / 100;
			COE:DebugMessage( curHealth .. " / " .. maxHealth );
		end
		curRatio = curHealth / maxHealth;
		
		if( curRatio < toBeHealed.ratio and curHealth ~= 0 ) then
			-- if target is party or raid member heal it 
			-- and don't care about the override threshold.
			-- the player supposedly knows what he's doing
			-- ---------------------------------------------
			if( UnitInParty( "target" ) or UnitInRaid( "target" ) ) then
				toBeHealed.target = "target";
				toBeHealed.ratio = curRatio;
				toBeHealed.current = curHealth;
				toBeHealed.max = maxHealth;
			
			else
				-- only heal the target if no party or raid member
				-- is below the override threshold
				-- ------------------------------------------------
				if( toBeHealed.ratio > COE_Heal.Thresholds.OverrideTarget ) then
					COE:DebugMessage( curHealth .. "/" .. maxHealth );
					toBeHealed.target = "target";
					toBeHealed.ratio = curRatio;
					toBeHealed.current = curHealth;
					toBeHealed.max = maxHealth;
				else
					COE:DebugMessage( "Overriding target due to OverrideTarget threshold" );
				end				
			end	
		
		end
	
	end

	-- round ratio to 2 digits
	-- ------------------------
	toBeHealed.ratio = math.floor( toBeHealed.ratio * 100 ) / 100;
	
	return toBeHealed;

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Heal:DetermineBestSpell
	
	PURPOSE: Determines the the spell to be used to heal possibly
		healmount of health but uses least possible mana
-------------------------------------------------------------------]]
function COE_Heal:DetermineBestSpell( spelltable, healamount )

	local lowerRank = false;
	local i, spell;
	for i = table.getn( spelltable ), 1, -1 do
		spell = spelltable[i];
		local avg = spell.AvgAmount;
		
		if( avg <= healamount ) then
			-- found a suitable spell
			-- do we have enough mana?
			-- ------------------------
			if( UnitMana( "player" ) < spell.Mana ) then
				lowerRank = true;
			else
				if( lowerRank ) then
					COE:Message( string.format( COESTR_HEALLOWERRANK, spell.Rank ) );
				end
				return spell.SpellID, spell.Type, spell.Rank;
			end
			
		end
	
	end
	
	if( lowerRank ) then
		-- out of mana
		-- ------------
		COE:Message( COESTR_HEALOOM );
		return nil;
	end

	-- if we got here, the target is below threshold but misses 
	-- less health than our rank 1 spell can heal at minimum
	-- use rank 1 explicitly, we want to heal after all...
	-- ---------------------------------------------------------
	spell = spelltable[1];

	if( UnitMana( "player" ) < spell.Mana ) then
		-- out of mana
		-- ------------
		COE:Message( COESTR_HEALOOM );
		return nil;
	else
		return spell.SpellID, spell.Type, 1;
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Heal:DetermineBattleSpell
	
	PURPOSE: Determines the the spell to be used to heal possibly
		healmount of health but uses the least casting time
		possible. That is, we use Lesser Healing Wave whenever
		possible
		If Nature's Swiftness is active, switch to 
		DetermineBestSpell instead to receive most out of our heal 
-------------------------------------------------------------------]]
function COE_Heal:DetermineBattleSpell( healamount )

	-- do we possess the lesser wave?
	-- -------------------------------
	if( table.getn( COE.HealData.Lesser ) == 0 ) then
		return COE_Heal:DetermineBestSpell( COE.HealData.Sorted, healamount );
	end

	-- check for nature's swiftness
	-- -----------------------------
	
	-- use lesser healing wave
	-- ------------------------
	return COE_Heal:DetermineBestSpell( COE.HealData.Lesser, healamount );

end

