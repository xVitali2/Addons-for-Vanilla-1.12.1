--[[

	CALL OF ELEMENTS
	The All-In-One Shaman Addon
	
	by Wyverex (2006)
	
	
	Totem Module / Logical
	
]]

if( not COE_Totem ) then 
	COE_Totem = {};
end 

--[[ ----------------------------------------------------------------
	stores the original functions hooked by SetupTimerHooks()
-------------------------------------------------------------------]]
COE_Totem["TimerHooks"] = {};


--[[ =============================================================================================

										L O G I C

================================================================================================]]

--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:Rescan
	
	PURPOSE: Scans the totems and totem sets 
-------------------------------------------------------------------]]
function COE_Totem:Rescan()
	COE:ScanTotems();
	COE:InitTotemSets();
	
	-- Reset all active totems
	-- ------------------------
	COE_Totem:DeactivateTimer( COE.ActiveTotems.Earth );
	COE_Totem:DeactivateTimer( COE.ActiveTotems.Fire );
	COE_Totem:DeactivateTimer( COE.ActiveTotems.Water );
	COE_Totem:DeactivateTimer( COE.ActiveTotems.Air );
	COE.ActiveTotems.Earth = nil;
	COE.ActiveTotems.Fire = nil;
	COE.ActiveTotems.Water = nil;
	COE.ActiveTotems.Air = nil;
	
	COE_Totem:UpdateAllFrames();
	COETotemFrame.Reconfigure = true;
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:ThrowTotem
	
	PURPOSE: Throws the totem with the specified named id 
-------------------------------------------------------------------]]
function COE_Totem:ThrowTotem( element, id )

	if( not COE.Initialized ) then
		return;
	end

	-- get associated button
	-- ----------------------
	local button = getglobal( "COETotem" .. element .. id );
	if( button == nil ) then
		COE:Message( "Invalid Totem" );
		return;
	end

	local totem = button.totem;
	if( totem == nil ) then
		COE:Message( COESTR_NOTOTEM );
		return;
	end
	
	-- throw totem
	-- ------------	
	CastSpellByName( totem.SpellName );

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:RankModifierDown
	
	PURPOSE: Returns if the rank 1 modifier is currently pressed 
-------------------------------------------------------------------]]
function COE_Totem:RankModifierDown()

	local overridekey = COE_Config:GetSaved( COEOPT_OVERRIDERANK );
		
	-- check if the override key is down
	-- ----------------------------------
	if( overridekey == COEMODE_OVERRIDESHIFT and IsShiftKeyDown() ) then
		return true;

	elseif( overridekey == COEMODE_OVERRIDEALT and IsAltKeyDown() ) then
		return true;
	
	elseif( overridekey == COEMODE_OVERRIDECTRL and IsControlKeyDown() ) then
		return true;
	end
	
	return false;

end


--[[ ----------------------------------------------------------------
	METHOD: COESched_AdviseTotem
	
	PURPOSE: If the totem warning is still active, a notification
		is displayed and the function rescheduled 
-------------------------------------------------------------------]]
function COESched_AdviseTotem( totem, msg )

	if( COE_Config:GetSaved( COEOPT_ADVISOR ) == 1 and totem.Warn ) then
		-- issue warning
		-- --------------
		COE:Notification( string.format( COESTR_CLEANSINGTOTEM, msg ), COECOL_TOTEMCLEANSING );
		
		-- reschedule
		-- -----------
		Chronos.scheduleByName( "COEAdvise" .. msg, COE.AdvisorWarningInterval, COESched_AdviseTotem, totem, msg );
	end		

end


--[[ ----------------------------------------------------------------
	METHOD: COESched_RunAdvisor
	
	PURPOSE: Scans the party/raid for debuffs that are curable by
		totems and shows a notification if it finds such 
-------------------------------------------------------------------]]
function COESched_RunAdvisor()

	-- advisor still activated?
	-- -------------------------
	if( COE_Config:GetSaved( COEOPT_ADVISOR ) == 0 ) then
		return;
	end

	local warnPoison, warnDisease, warnTremor = false, false, false;
	local poison, disease, tremor;
	
	-- scan player first
	-- ------------------
	poison, disease, tremor = COE_Totem:ScanTargetForDebuff( "player" );
	
	warnPoison = warnPoison or poison;
	warnDisease = warnDisease or disease;
	warnTremor = warnTremor or tremor;
	
	-- scan party
	-- -----------
	local i;
	for i = 1, GetNumPartyMembers() do
		if( warnPoison and warnDisease and warnTremor ) then
			break;
		end

		-- scan party member
		-- ------------------
		poison, disease, tremor = COE_Totem:ScanTargetForDebuff( "party" .. i );
		
		warnPoison = warnPoison or poison;
		warnDisease = warnDisease or disease;
		warnTremor = warnTremor or tremor;

		-- scan party member's pet
		-- ------------------------
		if( UnitExists( "partypet" .. i ) ) then
			poison, disease, tremor = COE_Totem:ScanTargetForDebuff( "partypet" .. i );
		
			warnPoison = warnPoison or poison;
			warnDisease = warnDisease or disease;
			warnTremor = warnTremor or tremor;
		end
	end

	-- issue warnings if necessary
	-- ----------------------------
	if( warnTremor and COE.CleansingTotems.Tremor.Totem and
		(COE.ActiveTotems["Earth"] ~= COE.CleansingTotems.Tremor.Totem or
		not COE_Totem:IsTimerActive( COE.ActiveTotems["Earth"] )) ) then
		
		if( not COE.CleansingTotems.Tremor.Warn ) then
			COE.CleansingTotems.Tremor.Warn = true;
			COESched_AdviseTotem( COE.CleansingTotems.Tremor, COESTR_TOTEMTREMOR );
		end
	else
		COE.CleansingTotems.Tremor.Warn = false;
	end

	if( warnDisease and COE.CleansingTotems.Disease.Totem and
		(COE.ActiveTotems["Water"] ~= COE.CleansingTotems.Disease.Totem or
		not COE_Totem:IsTimerActive( COE.ActiveTotems["Water"] )) ) then

		if( not COE.CleansingTotems.Disease.Warn ) then
			COE.CleansingTotems.Disease.Warn = true;
			COESched_AdviseTotem( COE.CleansingTotems.Disease, COESTR_TOTEMDISEASE );
		end
	else
		COE.CleansingTotems.Disease.Warn = false;
	end

	if( warnPoison and COE.CleansingTotems.Poison.Totem and
		(COE.ActiveTotems["Water"] ~= COE.CleansingTotems.Poison.Totem or
		not COE_Totem:IsTimerActive( COE.ActiveTotems["Water"] )) ) then

		if( not COE.CleansingTotems.Poison.Warn ) then
			COE.CleansingTotems.Poison.Warn = true;
			COESched_AdviseTotem( COE.CleansingTotems.Poison, COESTR_TOTEMPOISON );
		end
	else
		COE.CleansingTotems.Poison.Warn = false;
	end
	
	-- reschedule
	-- -----------
	Chronos.scheduleByName( "COEAdvise", COE.AdvisorInterval, COESched_RunAdvisor );
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:ScanTargetForDebuff
	
	PURPOSE: Scans the specified target for debuffs that are 
		curable by totems 
-------------------------------------------------------------------]]
function COE_Totem:ScanTargetForDebuff( target )

	local slot = 1;
	local poison, disease, tremor = false, false, false;

	-- iterate over all possible 16 debuff slots
	-- ------------------------------------------
	COETotemTTTextLeft1:SetText( "" );
	COETotemTTTextRight1:SetText( "" );
	COETotemTT:SetUnitDebuff( target, slot );
	
	local debufftype = COETotemTTTextRight1:GetText();
	local debuffname = COETotemTTTextLeft1:GetText();
	
	while( debuffname and slot <= 16 and not(poison and disease and tremor) ) do
	
		if( debufftype ) then
	
			if( debufftype == COESTR_POISON ) then
				-- it's a poison debuff
				-- ---------------------
				poison = true;
			elseif( debufftype == COESTR_DISEASE ) then
				-- it's a disease debuff
				-- ---------------------
				disease = true;
			else
				-- check if it's a debuff curable
				-- by the tremor totem
				-- -------------------------------
				local debuff;
				for debuff in COESTR_TREMOR do
					if( debuffname == COESTR_TREMOR[debuff] ) then
						tremor = true;
						break
					end
				end
			
			end
		end
	
		slot = slot + 1;
		COETotemTTTextLeft1:SetText( "" );
		COETotemTTTextRight1:SetText( "" );
		COETotemTT:SetUnitDebuff( target, slot );
	
		debufftype = COETotemTTTextRight1:GetText();
		debuffname = COETotemTTTextLeft1:GetText();
	end  

	return poison, disease, tremor;
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:ThrowAdvisedTotem
	
	PURPOSE: If there is an advised totem waiting to be thrown
		is is done here
-------------------------------------------------------------------]]
function COE_Totem:ThrowAdvisedTotem()

	if( COE.CleansingTotems.Tremor.Warn and
		(COE.ActiveTotems.Earth ~= COE.CleansingTotems.Tremor.Totem or
		not COE_Totem:IsTimerActive( COE.ActiveTotems["Earth"] )) ) then
		
		CastSpellByName( COE.CleansingTotems.Tremor.Totem.SpellName );
		
	elseif( COE.CleansingTotems.Disease.Warn and
		(COE.ActiveTotems.Water ~= COE.CleansingTotems.Disease.Totem or
		not COE_Totem:IsTimerActive( COE.ActiveTotems["Water"] )) ) then
		
		CastSpellByName( COE.CleansingTotems.Disease.Totem.SpellName );
		
	elseif( COE.CleansingTotems.Poison.Warn and
		(COE.ActiveTotems.Water ~= COE.CleansingTotems.Poison.Totem or
		not COE_Totem:IsTimerActive( COE.ActiveTotems["Water"] )) ) then
		
		CastSpellByName( COE.CleansingTotems.Poison.Totem.SpellName );

	end
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:IsAdvisedTotem
	
	PURPOSE: Returns if the specified totem is an advised totem
-------------------------------------------------------------------]]
function COE_Totem:IsAdvisedTotem( totem )

	if( (COE.CleansingTotems.Tremor.Warn and totem == COE.CleansingTotems.Tremor.Totem) or
		(COE.CleansingTotems.Disease.Warn and totem == COE.CleansingTotems.Disease.Totem) or
		(COE.CleansingTotems.Poison.Warn and totem == COE.CleansingTotems.Poison.Totem) ) then
		return true;
	else
		return false;
	end 

end


--[[ =============================================================================================

								T O T E M   -   S E T S

================================================================================================]]


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:SwitchNamedSet
	
	PURPOSE: If there exists a custom set with the name of the
		playertarget and the target is hostile, switch to this set
-------------------------------------------------------------------]]
function COE_Totem:SwitchNamedSet()

	if( COE_Config:GetSaved( COEOPT_ENABLESETS ) == 1 ) then
	
		if( UnitIsEnemy( "player", "target" ) ) then
		
			-- iterate over all custom sets
			-- -----------------------------
			local i;
			for i = 1, table.getn( COE_CustomTotemSets ) do
				
				if( COE_CustomTotemSets[i].Name == UnitName( "target" ) ) then
					COE_Totem:SwitchToSet( COE_CustomTotemSets[i].Name );
					return true;
				end
			end		
		end		
	end

	return false;
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:SwitchPVPSet
	
	PURPOSE: If the playertarget is a hostile player, activate the
		class totem set, else switch back to the last active set
-------------------------------------------------------------------]]
function COE_Totem:SwitchPVPSet()

	if( COE_Config:GetSaved( COEOPT_ENABLESETS ) == 1 and 
		COE_Config:GetSaved( COEOPT_AUTOSWITCH ) == 1 ) then
			
		if( UnitIsEnemy( "player", "target" ) ) then
			if( UnitIsPlayer( "target" ) ) then
				-- switch to pvp set
				-- ------------------
				local class = UnitClass( "target" );
			
				COE_Totem:SwitchToSet( "[PVP] " .. class );

			elseif( UnitExists( "target" ) ) then
				-- targeted a mob. switch back to the last set
				-- --------------------------------------------
				if( COE.LastActiveSet ~= nil ) then
					COE_Totem:SwitchToSet( COE.LastActiveSet );
				else
					COE_Totem:SwitchToSet( COEUI_DEFAULTSET );
				end;

			end
		end
						
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:SwitchToNextSet
	
	PURPOSE: If a pvp set is activated, the default set is activated
		Otherwise the next custom set is activated
-------------------------------------------------------------------]]
function COE_Totem:SwitchToNextSet()

	if( COE_Config:GetSaved( COEOPT_ENABLESETS ) == 1 ) then
		local activeset = COE_Config:GetSaved( COEOPT_ACTIVESET );
		 
		if( activeset < COESET_DEFAULT ) then
			-- pvp set is active
			-- switch to default set
			-- ----------------------
			COE_Totem:SwitchToSet( COEUI_DEFAULTSET );

		elseif( activeset == COE.TotemSetCount ) then
			-- last custom set is active or none available
			-- switch to default set
			-- --------------------------------------------
			COE_Totem:SwitchToSet( COEUI_DEFAULTSET );

		elseif( activeset == COESET_DEFAULT ) then
			-- default set is active
			-- switch to first custom set
			-- ---------------------------
			COE_Totem:SwitchToSet( COE_CustomTotemSets[1].Name );

		else
			-- switch to next custom set
			-- --------------------------
			COE_Totem:SwitchToSet( COE_CustomTotemSets[activeset - COESET_DEFAULT + 1].Name );
		end
	
	end 
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:SwitchToPriorSet
	
	PURPOSE: If a pvp set is activated, the default set is activated
		Otherwise the next custom set is activated
-------------------------------------------------------------------]]
function COE_Totem:SwitchToPriorSet()

	if( COE_Config:GetSaved( COEOPT_ENABLESETS ) == 1 ) then
		local activeset = COE_Config:GetSaved( COEOPT_ACTIVESET );
		 
		if( activeset < COESET_DEFAULT ) then
			-- pvp set is active
			-- switch to default set
			-- ----------------------
			COE_Totem:SwitchToSet( COEUI_DEFAULTSET );

		elseif( activeset == COESET_DEFAULT ) then
			-- default set is active
			-- switch to last custom set
			-- ---------------------------
			COE_Totem:SwitchToSet( COE_CustomTotemSets[COE.TotemSetCount - COESET_DEFAULT].Name );

		elseif( activeset == COESET_DEFAULT + 1 ) then
			-- first custom set is active
			-- switch to default set
			-- ---------------------------
			COE_Totem:SwitchToSet( COEUI_DEFAULTSET );

		else
			-- switch to prior custom set
			-- ---------------------------
			COE_Totem:SwitchToSet( COE_CustomTotemSets[activeset - COESET_DEFAULT - 1].Name );
		end
	
	end 
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:SwitchToSet
	
	PURPOSE: Activates the specified totem set
-------------------------------------------------------------------]]
function COE_Totem:SwitchToSet( name )

	if( COE_Config:GetSaved( COEOPT_ENABLESETS ) == 0 ) then
		return;
	end

	local pvpset = false;
	
	-- check for pvp sets
	-- -------------------
	local i, set;
	for i = 1, table.getn( COE_SavedTotemSets ) do
		if( COE_SavedTotemSets[i].Name == name ) then
			-- set found
			-- ----------
			set = i;
			pvpset = i ~= COESET_DEFAULT;
			break;
		end
	end

	-- check for custom sets
	-- ----------------------
	if( not set ) then
		for i = 1, table.getn( COE_CustomTotemSets ) do
			if( COE_CustomTotemSets[i].Name == name ) then
				-- set found
				-- ----------
				set = COESET_DEFAULT + i;
				break;
			end
		end
	end
	
	if( not set ) then
		return;
	end

	-- activate set if not already active
	-- chech this to stop notification spamming in a duel
	-- ---------------------------------------------------
	if( COE_Config:GetSaved( COEOPT_ACTIVESET ) ~= set ) then
		COE_Config:ActivateSet( set );
		
		if( not pvpset ) then
			COE.LastActiveSet = name;
		end
		
		-- reset set cycle
		-- ----------------
		COE_Totem:ResetSetCycle();

		-- notify player
		-- --------------
		COE:Message( string.format( COESTR_SWITCHTOSET, name ) );
	end
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:ThrowSet
	
	PURPOSE: Throws the next totem in the active set that is not
		yet thrown
-------------------------------------------------------------------]]
function COE_Totem:ThrowSet()

	if( COE_Config:GetSaved( COEOPT_ENABLESETS ) == 1 ) then
	
		-- =======================================================================			
		-- check which totem to throw
		-- =======================================================================			
		local activeset = COE_Config:GetSaved( COEOPT_ACTIVESET );

		local k;
		for k = 1,4 do
		
			local element = COE:LocalizedElement( COE.TotemSets[activeset].CastOrder[k] );
			local totem = COE.TotemSets[activeset][element]; 
		
			if( COE.SetCycle[element] == false and totem  ) then
				
				if( totem.isTrinket ) then
				
					if( totem.TrinketSlot ) then
						-- first check if the trinket is already usable
						-- ---------------------------------------------
						local start, duration = GetInventoryItemCooldown( "player", totem.TrinketSlot );
							
						if( start == 0 and duration == 0 ) then
							UseInventoryItem( totem.TrinketSlot );
							return;
						end
					end
				
				else
					-- first check if the totem is already usable
					-- -------------------------------------------
					local start, duration = GetSpellCooldown( totem.Ranks[totem.MaxRank].SpellID, BOOKTYPE_SPELL );
					
					if( start == 0 and duration == 0 ) then
						CastSpellByName( COE.TotemSets[activeset][element].SpellName );
						return;
					end
				end
			end
		end
	end
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:ResetSetCycle
	
	PURPOSE: Marks all totems of the current set as not yet thrown
-------------------------------------------------------------------]]
function COE_Totem:ResetSetCycle()

	COE:Message( COESTR_RESTARTINGSET );
	COE.SetCycle = { Earth = false, Fire = false, Water = false, Air = false };

end


--[[ =============================================================================================

								T I M E R   -   L O G I C

================================================================================================]]

--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:SetPendingTotem
	
	PURPOSE: Sets up or clears a pending totem
		The pending totem's timer is activated on the next
		successful SPELLCAST_STOP or removed if it times out first 
-------------------------------------------------------------------]]
function COE_Totem:SetPendingTotem( totem, rank )

	if( totem ) then
		COE:DebugMessage( "Setting pending totem: " .. totem.SpellName .. " with rank: " .. rank );
		COE.TotemPending.Totem = totem;
		COE.TotemPending.UseRank = rank;
		
		-- get the current lag
		-- --------------------
		local _,_,lag = GetNetStats();
		local timeout = lag / 1000 + COE.TotemPending.Timeout;
		
		-- use lag + 0.5 seconds as pending timeout
		-- -----------------------------------------
		COE:DebugMessage( "Setting pending timeout to: " .. timeout .. " msec" ); 
		
		Chronos.scheduleByName( "COE_Pending", timeout, COESched_CheckPendingTotem );
	else
		COE.TotemPending.Totem = nil;
		COE.TotemPending.UseRank = 0; 
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COESched_CheckPendingTotem
	
	PURPOSE: Clears the pending totem if it is still active
-------------------------------------------------------------------]]
function COESched_CheckPendingTotem()
	
	-- if there is still a pending totem it has timed out
	-- ---------------------------------------------------
	if( COE.TotemPending.Totem ) then
		COE:DebugMessage( "Pending totem has timed out: " .. COE.TotemPending.Totem.SpellName );
		COE_Totem:SetPendingTotem( nil );
	end
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:ActivatePendingTotem
	
	PURPOSE: Activates the pending totem timer and deactivates a
		still active timer of the same element 
-------------------------------------------------------------------]]
function COE_Totem:ActivatePendingTotem( totem )
	
	-- deactivate still active totem of the same element
	-- --------------------------------------------------
	local active = COE.ActiveTotems[COE.TotemPending.Totem.Element]; 
	if( active ) then
		COE_Totem:DeactivateTimer( active );
	end

	-- activate timer
	-- ---------------
	Chronos.startTimer( "COE" .. totem.SpellName );
	totem.CurDuration = COE.TotemPending.Totem.Ranks[COE.TotemPending.UseRank].Duration;
	totem.CurHealth = COE.TotemPending.Totem.Ranks[COE.TotemPending.UseRank].Health;

	-- activate cooldown timer if this totem has a cooldown
	-- -----------------------------------------------------
	if( COE.TotemPending.Totem.Ranks[COE.TotemPending.UseRank].Cooldown > 0 ) then
		totem.CurCooldown = COE.TotemPending.Totem.Ranks[COE.TotemPending.UseRank].Cooldown;
		Chronos.startTimer( "COECooldown" .. totem.SpellName );	
		Chronos.scheduleByName( "COECooldownSwitch" .. totem.SpellName, totem.CurCooldown, COESched_CooldownEnd, totem );	
	end

	-- activate warning timers
	-- ------------------------
	if( totem.CurDuration >= 10 ) then
		Chronos.scheduleByName( "COEWarn10" .. totem.SpellName, totem.CurDuration - 10, COESched_ExpirationWarning, 10, totem );
	end
	Chronos.scheduleByName( "COEWarn5" .. totem.SpellName, totem.CurDuration - 5, COESched_ExpirationWarning, 5, totem );
	Chronos.scheduleByName( "COEWarn0" .. totem.SpellName, totem.CurDuration, COESched_ExpirationWarning, 0, totem );

	-- mark totem as active
	-- ---------------------
	COE.ActiveTotems[COE.TotemPending.Totem.Element] = totem;
	totem.isActive = true;
	
	-- set totem in timer frame
	-- -------------------------
	if( COE_Config:GetSaved( COEOPT_TIMERFRAME ) == 1 ) then
		getglobal( "COETimer" .. COE.TotemPending.Totem.Element ).totem = totem;
		COETimerFrame:Show();
	end 
	
	-- mark totem as thrown if in current set
	-- ---------------------------------------
	local activeset = COE_Config:GetSaved( COEOPT_ACTIVESET );
	
	if( COE.TotemSets[activeset][totem.Element] and 
		COE.TotemSets[activeset][totem.Element].SpellName == totem.SpellName ) then
		
		COE:DebugMessage( "Element " .. totem.Element .. " in current cycle: SET" );
		COE.SetCycle[totem.Element] = true;
	end

	-- clear pending totem
	-- --------------------
	COE_Totem:SetPendingTotem( nil );
	
	-- if in timers only mode, reconfigure the totem bar
	-- --------------------------------------------------
	if( COE_Config:GetSaved( COEOPT_DISPLAYMODE ) == COEMODE_TIMERSONLY ) then
		COE_Totem:Invalidate( getglobal( "COE" .. totem.Element .. "Frame" ), true, true, true );
		COETotemFrame.Reconfigure = true;
	else
		-- otherwise just invalidate the dynamic buttons
		-- ----------------------------------------------
		COE_Totem:Invalidate( getglobal( "COE" .. totem.Element .. "Frame" ), false, false, true );
	end
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:DeactivateTimer
	
	PURPOSE: Deactivates an active totem timer 
-------------------------------------------------------------------]]
function COE_Totem:DeactivateTimer( totem )

	if( totem and totem.isActive ) then
	
		COE:DebugMessage( "Deactivating totem: " .. totem.SpellName );
		
		-- end timers
		-- -----------	
		Chronos.endTimer( "COE" .. totem.SpellName );
		Chronos.unscheduleByName( "COEWarn10" ..totem.SpellName ); 
		Chronos.unscheduleByName( "COEWarn5" ..totem.SpellName ); 
		Chronos.unscheduleByName( "COEWarn0" ..totem.SpellName ); 

		-- reset totem data
		-- ------------------
		totem.CurDuration = 0;
		totem.CurHealth = 0;
		totem.isActive = false;
	
		-- unset totem in timerframe
		-- --------------------------
		local timer = getglobal( "COETimer" .. totem.Element ); 
		timer.totem = nil;
		COETimerFrame:StopMovingOrSizing();

		-- mark totem as unthrown if in current set
		-- -----------------------------------------
		local activeset = COE_Config:GetSaved( COEOPT_ACTIVESET );
	
		if( COE.TotemSets[activeset][totem.Element] and 
			COE.TotemSets[activeset][totem.Element].SpellName == totem.SpellName ) then
		
			COE:DebugMessage( "Element " .. totem.Element .. " in current cycle: UNSET" );
			COE.SetCycle[totem.Element] = false;
		end
		
		-- invalidate dynamic buttons
		-- ---------------------------
		COE_Totem:Invalidate( getglobal( "COE" .. totem.Element .. "Frame" ), false, false, true );
		
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:IsTimerActive
	
	PURPOSE: Returns if the specified totem timer is active  
-------------------------------------------------------------------]]
function COE_Totem:IsTimerActive( totem )

	if( not totem ) then
		return false;
	end
	
	return (totem.CurDuration > 0) and 
		   (totem.CurDuration - Chronos.getTimer( "COE" .. totem.SpellName ) > 0);

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:GetTimeLeft
	
	PURPOSE: Returns the amount of seconds left on the totem timer  
-------------------------------------------------------------------]]
function COE_Totem:GetTimeLeft( totem )

	if( totem.CurDuration == 0 ) then
		return 0;
	else
		return totem.CurDuration - Chronos.getTimer( "COE" .. totem.SpellName );
	end  

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:GetCooldownLeft
	
	PURPOSE: Returns the amount of seconds left on the totem cooldown  
-------------------------------------------------------------------]]
function COE_Totem:GetCooldownLeft( totem )

	if( totem.CurCooldown == 0 ) then
		return 0;
	else
		return totem.CurCooldown - Chronos.getTimer( "COECooldown" .. totem.SpellName );
	end  

end


--[[ ----------------------------------------------------------------
	METHOD: COESched_ExpirationWarning
	
	PURPOSE: Issues an expiration warning for the specified totem  
-------------------------------------------------------------------]]
function COESched_ExpirationWarning( timemark, totem )

	if( COE_Config:GetSaved( COEOPT_ENABLETOTEMBAR ) == 1 and
		COE_Config:GetSaved( COEOPT_ENABLETIMERS ) == 1 and 
		COE_Config:GetSaved( COEOPT_TIMERNOTIFICATIONS ) == 1 ) then
		
		local text;
		if( totem.isTrinket ) then
			text = COESTR_TRINKET_TOTEM;
		else
			text = totem.SpellName;
		end
		
		if( timemark > 0 ) then
			COE:Notification( string.format( COESTR_TOTEMWARNING, text, timemark ), COECOL_TOTEMWARNING );
		else
			COE:Notification( string.format( COESTR_TOTEMEXPIRED, text ), COECOL_TOTEMDESTROYED );
			COE_Totem:DeactivateTimer( totem );
		end
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COESched_CooldownEnd
	
	PURPOSE: Stops the cooldown timer of the totem when the 
		cooldown has ended  
-------------------------------------------------------------------]]
function COESched_CooldownEnd( totem )

	Chronos.endTimer( "COECooldown" .. totem.SpellName );
	totem.CurCooldown = 0;

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:TotemDamage
	
	PURPOSE: Assigns damage to the totem being hit and triggers
		a notification if the totem is destroyed  
-------------------------------------------------------------------]]
function COE_Totem:TotemDamage()

	local num, regex, i;
	for num, regex in COESTR_TOTEMDAMAGE do
		local match = { string.gfind( arg1, regex )() };
		if ( table.getn(match) >= 1 ) then
				
			-- find totem
			-- -----------
			for i = 1, COE.TotemCount do
				if( COE.TotemData[i].SpellName == match[1] ) then
					-- subtract damage
					-- ----------------
					COE.TotemData[i].CurHealth = COE.TotemData[i].CurHealth - tonumber( match[2] );
						
					-- totem destroyed?
					-- -----------------
					if( COE_Config:GetSaved( COEOPT_ENABLETIMERS ) == 1 ) then
						if( COE.TotemData[i].CurHealth <= 0 ) then
							COE:DebugMessage( match[1] .. " destroyed" );

							if( COE_Config:GetSaved( COEOPT_TIMERNOTIFICATIONS ) == 1 ) then							
						  		COE:Notification( string.format( COESTR_TOTEMDESTROYED, COE.TotemData[i].SpellName ), 
									COECOL_TOTEMDESTROYED );
							end

							COE_Totem:DeactivateTimer( COE.TotemData[i] );
						else							
							COE:DebugMessage( match[1] .. " took " .. match[2] .. " damage. " .. 
								COE.TotemData[i].CurHealth .. " health left" );
						end
					end
					break;
				end
			end
			
			break;
		end
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:ResetTimers
	
	PURPOSE: Resets all active timers to zero 
-------------------------------------------------------------------]]
function COE_Totem:ResetTimers()

	local k;
	for k = 1, 4 do
		if( COE.ActiveTotems[COE_Element[k]] ) then
			COE_Totem:DeactivateTimer( COE.ActiveTotems[COE_Element[k]] );
		end
	end

	COE:Message( COESTR_RESET );
	
end


--[[ =============================================================================================

								T I M E R   -   H O O K S 

================================================================================================]]

--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:SetupTimerHooks
	
	PURPOSE: Stores the CastSpell, CastSpellByName, UseAction
		and UseInventoryItem functions and replaces them with
		a call to the corresponding hook functions and the
		original function afterwards 
-------------------------------------------------------------------]]
function COE_Totem:SetupTimerHooks()

	COE_Totem.TimerHooks["UseAction"] = UseAction;
	UseAction = function( id, book, onself ) 
		COE_Totem:HookUseAction( id, book ); 
		COE_Totem.TimerHooks["UseAction"]( id, book, onself ); 
	end;

	COE_Totem.TimerHooks["CastSpell"] = CastSpell;
	CastSpell = function( id, book ) 
		COE_Totem:HookCastSpell( id, book ); 
		COE_Totem.TimerHooks["CastSpell"]( id, book ); 
	end;

	COE_Totem.TimerHooks["CastSpellByName"] = CastSpellByName;
	CastSpellByName = function( SpellName )
		COE_Totem:HookCastSpellByName( SpellName );
		COE_Totem.TimerHooks["CastSpellByName"]( SpellName );
	end;

	COE_Totem.TimerHooks["UseInventoryItem"] = UseInventoryItem;
	UseInventoryItem = function( slotid )
		COE_Totem:HookUseInventoryItem( slotid );
		COE_Totem.TimerHooks["UseInventoryItem"]( slotid );
	end;

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:HookUseAction
	
	PURPOSE: Setup the totem timer if the action triggered
		a totem  
-------------------------------------------------------------------]]
function COE_Totem:HookUseAction( id, book )

	-- use only when timers are enabled
	-- ---------------------------------
	if( COE_Config:GetSaved( COEOPT_ENABLETIMERS ) == 0 ) then
		return;
	end
	
	-- get action tooltip
	-- -------------------
	COETotemTT:SetAction( id );
	
	-- check if this triggered a totem
	-- --------------------------------
	local text = COETotemTTTextLeft1:GetText();
	local i, rank, ranktext, trinket;

	-- check if this triggered the trinket
	-- ------------------------------------
	trinket = text == COESTR_TRINKET_TOOLTIP;

	for i = 1, COE.TotemCount do
		if( (trinket and COE.TotemData[i].isTrinket) or COE.TotemData[i].SpellName == text ) then
			
			if( COE.TotemData[i].isTrinket ) then
				rank = 0;
			
			else
				-- get rank information
				-- Since WOW doesn't seem to clear the rank information
				-- when setting a tooltip for an action that doesn't
				-- have such, we need to test if the rank info is 
				-- actually shown first
				-- -----------------------------------------------------
				if( COETotemTTTextRight1:IsShown() ) then 
					ranktext = COETotemTTTextRight1:GetText();
				end
				if( ranktext ) then
					_,_,rank = string.find( ranktext, COESTR_TOTEMRANK );
					rank = tonumber( rank );
				else
					rank = COE.TotemData[i].MaxRank;
				end
			end 
		
			-- set pending totem
			-- ------------------
			COE_Totem:SetPendingTotem( COE.TotemData[i], rank );
			
			return;
		end
	
	end
	

	-- no totem spell. remove pending totem if set
	-- --------------------------------------------
	COE_Totem:SetPendingTotem( nil );

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:HookCastSpell
	
	PURPOSE: Setup the totem timer if the spell triggered
		a totem  
-------------------------------------------------------------------]]
function COE_Totem:HookCastSpell( id, book )

	-- use only when timers are enabled
	-- ---------------------------------
	if( COE_Config:GetSaved( COEOPT_ENABLETIMERS ) == 0 ) then
		return;
	end
	
	-- get the associated totem object
	-- --------------------------------
	local i, k, totem;
	for i = 1, COE.TotemCount do
		for k = 1, COE.TotemData[i].MaxRank do
			if( COE.TotemData[i].Ranks[k].SpellID == id ) then
				-- totem found. mark it as pending
				-- --------------------------------
				COE_Totem:SetPendingTotem( COE.TotemData[i], k );
				
				return;
			end
		end
	end

	-- no totem spell. remove pending totem if set
	-- --------------------------------------------
	COE_Totem:SetPendingTotem( nil );
	
end

 
--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:HookCastSpellByName
	
	PURPOSE: Setup the totem timer if the spell triggered
		a totem  
-------------------------------------------------------------------]]
function COE_Totem:HookCastSpellByName( SpellName )

	-- use only when timers are enabled
	-- ---------------------------------
	if( COE_Config:GetSaved( COEOPT_ENABLETIMERS ) == 0 ) then
		return;
	end
	
	-- extract rank information
	-- -------------------------
	local _,_,rank = string.find( SpellName, COESTR_CASTBYNAME );
	local spell = string.gsub( SpellName, COESTR_CASTBYNAME, "" );
	
	-- get the associated totem object
	-- --------------------------------
	local i, k, totem;
	for i = 1, COE.TotemCount do
		if( COE.TotemData[i].SpellName == spell ) then
			if( rank ) then
				rank = tonumber( rank );
			else
				rank = COE.TotemData[i].MaxRank;
			end
			
			-- totem found. mark it as pending
			-- --------------------------------
			COE_Totem:SetPendingTotem( COE.TotemData[i], rank );
			
			return;
		end
	end

	-- no totem spell. remove pending totem if set
	-- --------------------------------------------
	COE_Totem:SetPendingTotem( nil );
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:HookUseInventoryItem
	
	PURPOSE: Setup the totem timer if the item triggered
		a totem  
-------------------------------------------------------------------]]
function COE_Totem:HookUseInventoryItem( slotid )

	-- use only when timers are enabled
	-- ---------------------------------
	if( COE_Config:GetSaved( COEOPT_ENABLETIMERS ) == 0 ) then
		return;
	end
	
	-- only use for trinket slots
	-- ---------------------------
	if( slotid ~= GetInventorySlotInfo( "Trinket0Slot" ) and slotid ~= GetInventorySlotInfo( "Trinket1Slot" ) ) then
		return;	
	end	
	
	-- iterate through out totems and find the trinket totem
	-- ------------------------------------------------------
	local i;
	for i = 1, COE.TotemCount do
		if( COE.TotemData[i].isTrinket ) then
			-- does the totem have the same slot id?
			-- --------------------------------------
			if( COE.TotemData[i].TrinketSlot == slotid ) then
				-- our trinket totem was cast
				-- ---------------------------
				COE_Totem:SetPendingTotem( COE.TotemData[i], 0 );
		
				return;		
			end
		end
	end

	-- no totem spell. remove pending totem if set
	-- --------------------------------------------
	COE_Totem:SetPendingTotem( nil );
	
end
 

