--[[

	CALL OF ELEMENTS
	The All-In-One Shaman Addon
	
	by Wyverex (2006)
	
	
	Totem Module / Visual
	
]]

if( not COE_Totem ) then 
	COE_Totem = {};
end 

COEUI_BUTTONGAP = 4;

COE_Totem.FlexTime = 0.3;

if( not COEFramePositions ) then 
COEFramePositions = { Earth = { x = 0, y = 0 }, Fire = { x = 0, y = 0 }, 
	Water = { x = 0, y = 0 }, Air = { x = 0, y = 0 } }; 
end

COEDynamic = { n = 7, nil, nil, nil, nil, nil, nil, nil };

--[[ =============================================================================================

										M A I N F R A M E 

================================================================================================]]

--[[ ---------------------------------------------------------------------------------------------

	Each element frame has the following properties:
	
		- AdvisorTime		: <time since the last advisor scan>
		- Reconfigure		: <true if totems have to be reassigned to the buttons>

------------------------------------------------------------------------------------------------]]

--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:InitMainFrame
	
	PURPOSE: Initializes the totem module and registers events
-------------------------------------------------------------------]]
function COE_Totem:InitMainFrame()
	-- addon loaded?
	-- --------------
	if( not COE.Initialized ) then
		return;
	end

	-- init frame properties
	-- ----------------------
	this.AdvisorTime = 0;
	this.Reconfigure = true;
	
	-- setup timer hooks
	-- ------------------
	COE_Totem:SetupTimerHooks();
	
	-- register events
	-- ----------------
	this:RegisterEvent( "PLAYER_ENTERING_WORLD" );
	this:RegisterEvent( "LEARNED_SPELL_IN_TAB" );
	this:RegisterEvent( "PLAYER_TARGET_CHANGED" );
	this:RegisterEvent( "PLAYER_DEAD" );

	this:RegisterEvent( "CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS" );
	this:RegisterEvent( "CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS" );
	this:RegisterEvent( "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE" );
	this:RegisterEvent( "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE" );

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:OnMainFrameEvent
	
	PURPOSE: Handles UI events
-------------------------------------------------------------------]]
function COE_Totem:OnMainFrameEvent( event )
	
	if( event == "PLAYER_ENTERING_WORLD" ) then
		-- fix saved variables
		-- --------------------
		COE:Fix_DisplayedTotems();
	
		-- scan for available totems. do this here instead of inside COE:Init
		-- because spells cannot be retrieved there yet
		-- -------------------------------------------------------------------
		COE_Totem:Rescan();

		-- start advisor schedule
		-- -----------------------
		if( COE_Config:GetSaved( COEOPT_ADVISOR ) == 1 ) then		
			Chronos.scheduleByName( "COEAdvise", COE.AdvisorInterval, COESched_RunAdvisor );
		end
		
		-- get current element frame coordinates
		-- --------------------------------------
		COE_Totem:UpdateFrameCoordinates();
		
	elseif( event == "LEARNED_SPELL_IN_TAB" ) then
		-- learned a new spell. rescan totems
		-- -----------------------------------
		COE_Totem:Rescan();
		
	elseif( event == "PLAYER_TARGET_CHANGED" ) then
	
		if( COE_Config:GetSaved( COEOPT_ENABLETOTEMBAR ) == 0 ) then
			return;
		end

		-- Switch to named set if appropriate
		-- -----------------------------------
		if( not COE_Totem:SwitchNamedSet() ) then
			-- Switch to class set if appropriate
			-- -----------------------------------		
			COE_Totem:SwitchPVPSet();
		end
	
	elseif( event == "PLAYER_DEAD" ) then
	
		-- reset all timers upon death
		-- ----------------------------
		COE_Totem:ResetTimers();
		
	elseif ( event == "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE" or 
			 event == "CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS" or
			 event == "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE" or
			 event == "CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS" ) then

		if( COE_Config:GetSaved( COEOPT_ENABLETOTEMBAR ) == 0 ) then
			return;
		end

		-- Assign totem damage
		-- --------------------		
		COE_Totem:TotemDamage();	
	end
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:ConfigureTotemButtons
	
	PURPOSE: Assigns all totems to the corresponding buttons and
		returns the number of totems per element
-------------------------------------------------------------------]]
function COE_Totem:ConfigureTotemButtons()

	-- reconfiguration necessary?
	-- ---------------------------
	if( not COETotemFrame.Reconfigure ) then
		return;
	end 

	local i;
	local buttons = { Earth = 0, Fire = 0, Water = 0, Air = 0 };
	local indices = { "Earth", "Fire", "Water", "Air" };
	
	local mode = COE_Config:GetSaved( COEOPT_DISPLAYMODE );
	local activeset = COE_Config:GetSaved( COEOPT_ACTIVESET );
	
	-- assign placeholder totem
	-- -------------------------
	for i = 1, 4 do
		local button = getglobal( "COETotem" .. COE_Element[i] .. "None" );
		
		button.totem = COE.NoTotem;
	end
	
	-- clear all buttons or we could get double totems
	-- when switching from customize to another mode
	-- ------------------------------------------------
	for i = 1, 4 do
		for k = 1, COE.MaxTotems[indices[i]] do
			local button = getglobal( "COETotem" .. indices[i] .. k );
			
			button.totem = nil;
		end
	end			
	
	-- assign totems
	-- --------------
	for i = 1, COE.TotemCount do
		local totem = COE.TotemData[i];
		
		-- increase button counter
		-- ------------------------
		if buttons[totem.Element] then
			buttons[totem.Element]= buttons[totem.Element] + 1;
		end
		local order = COE_DisplayedTotems[totem.SpellName].Order;
		local button;		

		--===================================================
		-- find out the button to store the totem in		
		--===================================================		
		if( mode == COEMODE_ALLTOTEMS ) then  
			button = getglobal( "COETotem" .. totem.Element .. order );
			
		elseif( mode == COEMODE_TIMERSONLY ) then
			if( COE.ActiveTotems[totem.Element] ) then
				if( COE.ActiveTotems[totem.Element] == totem ) then 
					-- this totem is/was last active. store at pos 1
					-- ----------------------------------------------
					button = getglobal( "COETotem" .. totem.Element .. "1" );
				
				else
					-- check if this totem's order is before or after
					-- the normal order of this element's active totem
					-- ------------------------------------------------
					local activeorder = COE_DisplayedTotems[COE.ActiveTotems[totem.Element].SpellName].Order;
					if( order < activeorder ) then
						order = order + 1;
					end
					
					button = getglobal( "COETotem" .. totem.Element .. order );
				end
				
			else
				-- there has not been any active totem for this element yet
				-- use the normal ordering
				-- ---------------------------------------------------------			
				button = getglobal( "COETotem" .. totem.Element .. order );
			end		
		
		else
			if( COE.TotemSets[activeset][totem.Element] == totem ) then
				-- this totem is in the active set. store at pos 1
				-- ------------------------------------------------
				button = getglobal( "COETotem" .. totem.Element .. "1" );
	
			elseif( COE.TotemSets[activeset][totem.Element] ) then
				-- check if this totem's order is before or after
				-- the normal order of this set's element totem
				-- -----------------------------------------------
				local activeorder = COE_DisplayedTotems[COE.TotemSets[activeset][totem.Element].SpellName].Order;
				if( order < activeorder ) then
					order = order + 1;
				end
					
				button = getglobal( "COETotem" .. totem.Element .. order );			
			else
				-- there is no totem for this element in the set
				-- use the normal ordering
				-- ----------------------------------------------			
				button = getglobal( "COETotem" .. totem.Element .. order );
			end		
		end
		
		--===================================================
		-- store the totem		
		--===================================================		
		if( button ~= nil ) then
			-- store totem object in button
			-- -----------------------------
			button.totem = totem;
			
			-- assign button for cleansing advisory
			-- -------------------------------------
			if( totem == COE.CleansingTotems.Poison.Totem ) then
				COE.CleansingTotems.Poison.Button = button;
			elseif( totem == COE.CleansingTotems.Disease.Totem ) then
				COE.CleansingTotems.Disease.Button = button;
			elseif( totem == COE.CleansingTotems.Tremor.Totem ) then
				COE.CleansingTotems.Tremor.Button = button;
			end
		end	
	end
	
	-- invalidate all frames
	-- ----------------------
	COE_Totem:Invalidate( COEEarthFrame, true, true, true );
	COE_Totem:Invalidate( COEFireFrame, true, true, true );
	COE_Totem:Invalidate( COEWaterFrame, true, true, true );
	COE_Totem:Invalidate( COEAirFrame, true, true, true );

	-- only reconfigure the next time it is really necessary
	-- ------------------------------------------------------	
	COETotemFrame.Reconfigure = false;

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateAllFrames
	
	PURPOSE: Forces an update of all element frames
-------------------------------------------------------------------]]
function COE_Totem:UpdateAllFrames()

	if( COE_Config:GetSaved( COEOPT_ENABLETOTEMBAR ) == 1 ) then
		if( COE.TotemsAvailable.Earth > 0 ) then
			COEEarthFrame:Show();
			COE_Totem:Invalidate( COEEarthFrame, true, true, true );
		else
			COEEarthFrame:Hide();
		end
		if( COE.TotemsAvailable.Fire > 0 ) then
			COEFireFrame:Show();
			COE_Totem:Invalidate( COEFireFrame, true, true, true );
		else
			COEFireFrame:Hide();
		end
		if( COE.TotemsAvailable.Water > 0 ) then
			COEWaterFrame:Show();
			COE_Totem:Invalidate( COEWaterFrame, true, true, true );
		else
			COEWaterFrame:Hide();
		end
		if( COE.TotemsAvailable.Air > 0 ) then
			COEAirFrame:Show();
			COE_Totem:Invalidate( COEAirFrame, true, true, true );
		else
			COEAirFrame:Hide();
		end
	else
		COEEarthFrame:Hide();
		COEFireFrame:Hide();
		COEWaterFrame:Hide();
		COEAirFrame:Hide();
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:ResetFrames
	
	PURPOSE: Resets all element frames positions
-------------------------------------------------------------------]]
function COE_Totem:ResetFrames()

	COEEarthFrame:ClearAllPoints();
	COEEarthFrame:SetPoint( "CENTER", "UIParent", "CENTER", -75, 75 );
	COEFireFrame:ClearAllPoints();
	COEFireFrame:SetPoint( "CENTER", "UIParent", "CENTER", 75, 75 );
	COEWaterFrame:ClearAllPoints();
	COEWaterFrame:SetPoint( "CENTER", "UIParent", "CENTER", -75, -75 );
	COEAirFrame:ClearAllPoints();
	COEAirFrame:SetPoint( "CENTER", "UIParent", "CENTER", 75, -75 );
	
	COE_Totem:UpdateFrameCoordinates();

end


--[[ =============================================================================================

										F R A M E 

================================================================================================]]

--[[ ---------------------------------------------------------------------------------------------

	Each element frame has the following properties:
	
		- Element			: Earth, Fire, Water, Air
		- Direction			: Up, Down, Left, Right
			- Point			: <anchorpoint for the totem buttons>
			- RelPoint		: <relative anchorpoint for the totem buttons>
			- XSpacing		: <amount of horizontal spacing between the totem buttons> 
			- YSpacing		: <amount of vertical spacing between the totem buttons> 
		- Mode				: Open, Closed, Flex
		- FlexCount			: <number of totems to show always when in Flex-Mode>
		- Expanded			: True, False
		- UpdateTime		: <time since the last visual update>
		- AnchorTotem		: <totem button that serves as the frame anchor>
		- IsMoving			: <true if frame is being dragged>
		
		- Updates			: <controls which updates will be run in the next UpdateFrame>
			- Anchor		: true, false <update positioning of the anchor button>
			- Static		: true, false <update alignment of the static buttons>
			- Dynamic		: true, false <update alignment of the dynamic buttons> 

------------------------------------------------------------------------------------------------]]


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:InitFrame
	
	PURPOSE: Initializes the element frame
-------------------------------------------------------------------]]
function COE_Totem:InitFrame()
	-- addon loaded?
	-- --------------
	if( not COE.Initialized ) then
		return;
	end

	-- init update timer
	-- ------------------
	this.UpdateTime = 0;
	
	-- initially update all frame parts
	-- ---------------------------------
	this.Updates = { Anchor = true, Static = true, Dynamic = true };

	-- frame doesn't move initially
	-- -----------------------------	
	this.IsMoving = false;

		-- register events
	-- ----------------
	this:RegisterEvent( "PLAYER_ENTERING_WORLD" );

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:OnFrameEvent
	
	PURPOSE: Handles UI events
-------------------------------------------------------------------]]
function COE_Totem:OnFrameEvent( event )
	if( event == "PLAYER_ENTERING_WORLD" ) then
		-- load frame settings from saved variables 
		-- -----------------------------------------
		COE_Totem:SetFrameDirection( this, COE_TotemBars[this.Element].Direction );
		this.Mode = COE_TotemBars[this.Element].Mode;
		this.FlexCount = COE_TotemBars[this.Element].FlexCount;
		this.MouseHover = false;
		this.Expanded = false;
		this.AnchorTotem = nil; 
		-- -----------------------------------
		-- load saved position
		if (COEFramePositions[this.Element].x~=0 and COEFramePositions[this.Element].y~=0) then
		this:ClearAllPoints();
		this:SetPoint( "TOPLEFT", UIParent, "BOTTOMLEFT", COEFramePositions[this.Element].x, COEFramePositions[this.Element].y);
		end
		-- invalidate part
		COE_Totem:Invalidate( this, true, true, true );
		
	end
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:Invalidate
	
	PURPOSE: Invalidates anchor button, static and/or dynamic 
		buttons if any or all are set to true
-------------------------------------------------------------------]]
function COE_Totem:Invalidate( frame, Anchor, Static, Dynamic )

	-- don't set any flag to false to prevent overwriting
	-- a previous call to Invaldiate with a true parameter
	-- ----------------------------------------------------

	if( Anchor ) then
		frame.Updates.Anchor = true;
	end

	if( Static ) then
		frame.Updates.Static = true;
	end

	if( Dynamic ) then
		frame.Updates.Dynamic = true;
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateFrame
	
	PURPOSE: Configures the totem buttons and adjusts the frame size
-------------------------------------------------------------------]]
function COE_Totem:UpdateFrame( elapsed )

	-- check if visual update is necessary
	-- ------------------------------------
	this.UpdateTime = this.UpdateTime + elapsed;
	if( this.UpdateTime <= COE.UpdateInterval ) then
		return;
	end
	
	-- show frame?
	-- ------------
	if( COE_Config:GetSaved( COEOPT_ENABLETOTEMBAR ) == 1 and
		COE_TotemBars[this.Element].Mode ~= "Hidden" ) then
		this:Show();
	else 
		this:Hide();
		return;
	end
	
	-- set scaling
	-- ------------
	this:SetScale( COE_Config:GetSaved( COEOPT_SCALING ) );
	
	-- invalidate all if moving
	-- -------------------------
	if( this.isMoving ) then
		COE_Totem:Invalidate( this, true, true, true );
	end		
	
	-- configure buttons for this frame
	-- ---------------------------------
	COE_Totem:ConfigureTotemButtons();
	
	-- configure anchor button
	-- ------------------------
	if( this.Updates.Anchor ) then
		COE_Totem:UpdateAnchorButton();
	end
	
	-- only update if at least the anchor
	-- totem button has a totem assigned
	-- -----------------------------------
	if( COE.TotemsAvailable[this.Element] > 0 ) then
		this.AnchorTotem:Show();
		
		-- update the static flex-totems
		-- ------------------------------
		if( this.Updates.Static ) then
			COE_Totem:UpdateStatic();
		end
	
		-- update the dynamic flex-totems
		-- -------------------------------
		if( this.Updates.Dynamic ) then
			COE_Totem:UpdateDynamic();
		end
	else
		this.AnchorTotem:Hide();
	end
	
	-- adjust other frames when dragging
	-- ----------------------------------
	if( this.IsMoving ) then
		COE_Totem:AdjustDraggedFrames();
	end
	
	-- reset invalidation flags
	-- -------------------------
	this.Updates.Anchor = false;
	this.Updates.Static = false;
	this.Updates.Dynamic = false;
	
	-- reset update time
	-- ------------------
	COETotemFrame.UpdateTime = 0;
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateAnchorButton
	
	PURPOSE: Sets the right anchor button depending on the 
		display and bar mode
-------------------------------------------------------------------]]
function COE_Totem:UpdateAnchorButton()

	local mode = COE_Config:GetSaved( COEOPT_DISPLAYMODE );
	local activeset = COE_Config:GetSaved( COEOPT_ACTIVESET );

	if( mode == COEMODE_ALLTOTEMS ) then
		this.AnchorTotem = getglobal( "COETotem" .. this.Element .. "1" );
		
	elseif( mode == COEMODE_TIMERSONLY ) then
		if( COE.ActiveTotems[this.Element] or COE_TotemBars[this.Element].Mode == "Open" ) then
			this.AnchorTotem = getglobal( "COETotem" .. this.Element .. "1" );
		else 
			this.AnchorTotem = getglobal( "COETotem" .. this.Element .. "None" );
			return;
		end

	else
		if( COE.TotemSets[activeset][this.Element] or COE_TotemBars[this.Element].Mode == "Open" ) then
			this.AnchorTotem = getglobal( "COETotem" .. this.Element .. "1" );
		else 
			this.AnchorTotem = getglobal( "COETotem" .. this.Element .. "None" );
			return;
		end
	end
	
	-- hide the no-totem button
	-- -------------------------
	getglobal( "COETotem" .. this.Element .. "None" ):Hide();

	this.AnchorTotem:SetScale( 1 );
	this.AnchorTotem:ClearAllPoints();
	this.AnchorTotem:SetPoint( "TOPLEFT", this, "TOPLEFT" );
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateStatic
	
	PURPOSE: Shows the FlexiCount first totems of this element
-------------------------------------------------------------------]]
function COE_Totem:UpdateStatic()

	local inConfig = COE.ConfigureBarMode or COE.ConfigureOrderMode or COE.ConfigureSetsMode; 

	if( this.Mode == "Closed" and not COE.ConfigureBarMode and 
		not COE.ConfigureOrderMode and not COE.ConfigureSetsMode ) then
		return;
	end

	-- show all buttons in "Open" mode and
	-- FlexCount buttons in "Flex" mode
	-- -------------------------------------		
	local count;
	if( this.Mode == "Open" or inConfig ) then
		count = COE.MaxTotems[this.Element];
	else
		count = this.FlexCount;
	end 
	
	-- align and show buttons
	-- -----------------------
	local i, start, button, lastvisible;
	lastvisible = this.AnchorTotem;
	
	if( this.AnchorTotem.totem == COE.NoTotem ) then
		start = 1;
	else
		start = 2;
	end

	for i = start, count do
		button = getglobal( "COETotem" .. this.Element .. i );
		button:ClearAllPoints();
		button:SetScale( 1 );

		-- only show button if it has a totem
		-- -----------------------------------		
		if( button.totem and (COE_DisplayedTotems[button.totem.SpellName].Visible or inConfig) ) then
			button:SetPoint( this.Point, lastvisible, this.RelPoint, this.XSpacing, this.YSpacing );
			button:Show();
			lastvisible = button;
		else
			button:Hide();
		end
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateDynamic
	
	PURPOSE: Shows the FlexiTotems if "Flex" mode is enabled and 
		the	frame is expanded
-------------------------------------------------------------------]]
function COE_Totem:UpdateDynamic()

	-- no dynamic buttons in configuration
	-- ------------------------------------
	if( COE.ConfigureBarMode or COE.ConfigureOrderMode or COE.ConfigureSetsMode ) then
		return;
	end

	if( this.Mode == "Flex" ) then
	
		local i, start, lastvisible, idx;
		idx = 1;
		
		if( this.AnchorTotem.totem == COE.NoTotem ) then
			if( this.FlexCount > 1 ) then
				lastvisible = getglobal( "COETotem" .. this.Element .. this.FlexCount - 1 );
			else
				lastvisible = getglobal( "COETotem" .. this.Element .. "None" );
			end
			start = this.FlexCount;
		else
			lastvisible = getglobal( "COETotem" .. this.Element .. this.FlexCount );
			start = this.FlexCount + 1;
		end

		-- we need two passes now. the first one aligns all
		-- "docked" totems and the second pass adds all other totems.
		-- this way, the docked totems are shown first in the expanded bar
		-- ---------------------------------------------------------------- 
				
		for i = start, COE.MaxTotems[this.Element] do
			button = getglobal( "COETotem" .. this.Element .. i );
			button:ClearAllPoints();

			if( button.totem and COE_DisplayedTotems[button.totem.SpellName].Visible ) then
				if( COE.ActiveTotems[this.Element] == button.totem and COE_Totem:IsTimerActive( button.totem ) ) then
					-- show button if it is active
					-- ----------------------------		
					button:SetScale( 0.8 );
					button:SetPoint( this.Point, lastvisible, this.RelPoint, this.XSpacing, this.YSpacing );
					button:Show();
					lastvisible = button;
				
				elseif( COE_Totem:GetCooldownLeft( button.totem ) > 0 ) then
					-- show button if it has a running cooldown
					-- -----------------------------------------		
					button:SetScale( 0.8 );
					button:SetPoint( this.Point, lastvisible, this.RelPoint, this.XSpacing, this.YSpacing );
					button:Show();
					lastvisible = button;

				elseif( COE_Totem:IsAdvisedTotem( button.totem ) ) then
					-- show button if it is advised
					-- -----------------------------		
					button:SetScale( 0.8 );
					button:SetPoint( this.Point, lastvisible, this.RelPoint, this.XSpacing, this.YSpacing );
					button:Show();
					lastvisible = button;
							
				elseif( this.Expanded ) then
					-- process totem in second pass
					-- -----------------------------
					COEDynamic[idx] = button;
					idx = idx + 1;
					
				else
					button:SetScale( 1 );
					button:Hide();
				end
				
			else
				button:SetScale( 1 );
				button:Hide();
			end
		end	
					
		for i = 1, idx - 1 do
			button = COEDynamic[i];
			
			-- show button if it has a totem and the bar is expanded
			-- ------------------------------------------------------		
			button:SetScale( 0.8 );
			button:SetPoint( this.Point, lastvisible, this.RelPoint, this.XSpacing, this.YSpacing );
			button:Show();
			lastvisible = button;
			
			COEDynamic[i] = nil;
		end

	elseif( this.Mode == "Closed" ) then
	
		local i, start, lastvisible;
		lastvisible = this.AnchorTotem;
		
		if( this.AnchorTotem.totem == COE.NoTotem ) then
			start = 1;
		else
			start = 2;
		end

		for i = start, COE.MaxTotems[this.Element] do
			button = getglobal( "COETotem" .. this.Element .. i );
			button:ClearAllPoints();
			
			if( button.totem and COE.ActiveTotems[this.Element] == button.totem and 
					COE_Totem:IsTimerActive( button.totem ) ) then
				-- show button if it is active
				-- ----------------------------		
				button:SetScale( 0.8 );
				button:SetPoint( this.Point, lastvisible, this.RelPoint, this.XSpacing, this.YSpacing );
				button:Show();
				lastvisible = button;
				
			elseif( button.totem and COE_Totem:GetCooldownLeft( button.totem ) > 0 ) then
				-- show button if it has a running cooldown
				-- -----------------------------------------		
				button:SetScale( 0.8 );
				button:SetPoint( this.Point, lastvisible, this.RelPoint, this.XSpacing, this.YSpacing );
				button:Show();
				lastvisible = button;
					
			elseif( COE_Totem:IsAdvisedTotem( button.totem ) ) then
				-- show button if it isa advised
				-- ------------------------------		
				button:SetScale( 0.8 );
				button:SetPoint( this.Point, lastvisible, this.RelPoint, this.XSpacing, this.YSpacing );
				button:Show();
				lastvisible = button;

			else
				button:SetScale( 1 );
				button:Hide();
			end	
		end	
	
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:COESched_HideDynamicButtons
	
	PURPOSE: Set the expanded state to false to hide the dynamic
		buttons of this frame
-------------------------------------------------------------------]]
function COESched_HideDynamicButtons( frame )

	COE_Totem:Invalidate( frame, false, false, true );
	frame.Expanded = false;

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:SetFrameDirection
	
	PURPOSE: Sets the frame parameters responsible for aligning
		the totem buttons in a specific direction
-------------------------------------------------------------------]]
function COE_Totem:SetFrameDirection( frame, direction )

	if( direction == "Up" ) then
		frame.Direction = direction;
		frame.Point = "BOTTOM";
		frame.RelPoint = "TOP";
		frame.XSpacing = 0;
		frame.YSpacing = COEUI_BUTTONGAP;
	
	elseif( direction == "Down" ) then
		frame.Direction = direction;
		frame.Point = "TOP";
		frame.RelPoint = "BOTTOM";
		frame.XSpacing = 0;
		frame.YSpacing = -COEUI_BUTTONGAP;
	
	elseif( direction == "Left" ) then
		frame.Direction = direction;
		frame.Point = "RIGHT";
		frame.RelPoint = "LEFT";
		frame.XSpacing = -COEUI_BUTTONGAP;
		frame.YSpacing = 0;
	
	elseif( direction == "Right" ) then
		frame.Direction = direction;
		frame.Point = "LEFT";
		frame.RelPoint = "RIGHT";
		frame.XSpacing = COEUI_BUTTONGAP;
		frame.YSpacing = 0;
	
	end
	
	-- invalidate static and dynamic buttons
	-- --------------------------------------
	COE_Totem:Invalidate( frame, false, true, true );

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:AdjustDraggedFrames
	
	PURPOSE: If the frames are grouped together and one of them
		is being dragged, the other frames' positions are adjusted
		to retain their relative position 
-------------------------------------------------------------------]]
function COE_Totem:AdjustDraggedFrames()

	if( COE_Config:GetSaved( COEOPT_GROUPBARS ) == 0 ) then
		return;
	end

	local x, y, k, dx, dy;
	
	-- get current frame position
	-- ---------------------------
	x = this:GetLeft();
	y = this:GetTop();

	-- get the offset from the old position
	-- -------------------------------------	
	dx = x - COEFramePositions[this.Element].x;		
	dy = y - COEFramePositions[this.Element].y;		

	-- adjust all other frames' positions
	-- -----------------------------------
	for k = 1, 4 do
		if( this.Element ~= COE_Element[k] ) then
			local frame = getglobal( "COE" .. COE_Element[k] .. "Frame" );
			
			-- calculate the frame's new position by retaining
			-- the relative position to the frame being dragged
			-- -------------------------------------------------
			frame:ClearAllPoints();
			frame:SetPoint( "TOPLEFT", UIParent, "BOTTOMLEFT", COEFramePositions[frame.Element].x + dx, 
				COEFramePositions[frame.Element].y + dy );
			
			-- invalidate all parts
			-- ---------------------
			COE_Totem:Invalidate( frame, true, true, true );
		
		end
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateFrameCoordinates
	
	PURPOSE: Stores the current element frame coordinates 
-------------------------------------------------------------------]]
function COE_Totem:UpdateFrameCoordinates()

	local k;
	for k = 1, 4 do
		local frame = getglobal( "COE" .. COE_Element[k] .. "Frame" );
			
		COEFramePositions[COE_Element[k]].x = frame:GetLeft();
		COEFramePositions[COE_Element[k]].y = frame:GetTop();

		-- Invalidate all parts
		-- ---------------------
		COE_Totem:Invalidate( frame, true, true, true );
	end	

end


--[[ =============================================================================================

										B U T T O N 

================================================================================================]]

--[[ ---------------------------------------------------------------------------------------------

	Each element frame has the following properties:
	
		- totem				: <totem pointer>
		- UpdateTime		: <time since the last visual update>
		- Flashtime			: <time since the last flash when advised>
		- ElementFrame		: <the parent frame>

------------------------------------------------------------------------------------------------]]

--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:OnTotemButtonLoad
	
	PURPOSE: Registers events for the totem button
-------------------------------------------------------------------]]
function COE_Totem:OnTotemButtonLoad()

	if( not COE.Initialized ) then
		return;
	end

	-- init properties
	-- ----------------
	this.UpdateTime = 0;
	this.Flashtime = 0;
	this.ElementFrame = this:GetParent();

	getglobal(this:GetName() .."TickCooldown"):SetFrameLevel(getglobal(this:GetName() .."TickCooldown"):GetFrameLevel()-1)

	-- register for drag
	-- ------------------
	this:RegisterForDrag( "LeftButton" );
	
	-- register events
	-- ----------------
	this:RegisterEvent( "ACTIONBAR_UPDATE_STATE" );
	this:RegisterEvent( "ACTIONBAR_UPDATE_USABLE" );
	this:RegisterEvent( "ACTIONBAR_UPDATE_COOLDOWN" );
	this:RegisterEvent( "UNIT_MANA" );
	this:RegisterEvent( "UNIT_INVENTORY_CHANGED" );
	this:RegisterEvent( "BAG_UPDATE" );
	this:RegisterEvent( "UPDATE_BINDINGS" );
	this:RegisterEvent( "SPELLCAST_STOP" );

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:OnTotemButtonEvent
	
	PURPOSE: Handles UI events for the totem button
-------------------------------------------------------------------]]
function COE_Totem:OnTotemButtonEvent( event )

	if( event == "ACTIONBAR_UPDATE_STATE" ) then
		if( this.totem ) then
			COE_Totem:UpdateTotemButton( COE.ForceUpdate );
		end
		
	elseif( event == "ACTIONBAR_UPDATE_USABLE" ) then
		if( this.totem ) then
			COE_Totem:UpdateTotemButtonIsUsable();
		end
		
	elseif( event == "ACTIONBAR_UPDATE_COOLDOWN" ) then
		if( this.totem ) then
			COE_Totem:UpdateTotemButtonCooldown();
		end
		
	elseif( event == "UNIT_MANA" and arg1 == "player" ) then
		if( this.totem ) then
			COE_Totem:UpdateTotemButtonIsUsable();
		end
		
	elseif( event == "UNIT_INVENTORY_CHANGED" or event == "BAG_UPDATE" ) then
		-- check for presence of totem tools
		-- ----------------------------------
		local totem = this.totem;
		if( totem and totem ~= COE.NoTotem ) then

			if( totem.isTrinket ) then
				local slot;
				totem.ToolPresent, slot = COE:IsTrinketPresent();
				
				if( slot and slot ~= totem.TrinketSlot and totem.CurCooldown < 30 ) then
					-- trinket has been (re-)equipped
					-- start item cooldown
					-- -------------------------------
					totem.CurCooldown = 30;
					Chronos.startTimer( "COECooldown" .. totem.SpellName );	
					Chronos.scheduleByName( "COECooldownSwitch" .. totem.SpellName, totem.CurCooldown, COESched_CooldownEnd, totem );	
					
				end
				
				totem.TrinketSlot = slot;				
			else
				totem.ToolPresent = COE:IsToolPresent( totem.Ranks[1].SpellID );
			end
		end
		
	elseif( event == "UPDATE_BINDINGS" ) then
		if( this.totem ) then
			COE_Totem:UpdateTotemButtonHotKey();
		end

	elseif( event == "SPELLCAST_STOP" ) then
		-- activate timer if totem is pending
		-- -----------------------------------
		if( COE_Config:GetSaved( COEOPT_ENABLETIMERS ) == 1 and 
			this.totem and this.totem == COE.TotemPending.Totem ) then
				COE_Totem:ActivatePendingTotem( this.totem );
		end
			
	end
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateTotemButton
	
	PURPOSE: Updates the button state
-------------------------------------------------------------------]]
function COE_Totem:UpdateTotemButton( elapsed )

	-- check if visual update is necessary
	-- ------------------------------------
	this.UpdateTime = this.UpdateTime + elapsed;
	if( this.UpdateTime <= COE.UpdateInterval ) then
		return;
	end

	if( this.totem == nil ) then
		this:Hide();
		return;
	end

	-- set the icon
	-- -------------
	icon = getglobal( this:GetName() .. "Icon" );
	icon:SetTexture( this.totem.Texture );

	-- update usability state
	-- -----------------------	
	COE_Totem:UpdateTotemButtonIsUsable();
	
	-- update cooldown
	-- ----------------
	COE_Totem:UpdateTotemButtonCooldown();

	-- update hotkey
	-- --------------
	COE_Totem:UpdateTotemButtonHotKey();
	
	-- flash button if advisor warning is active
	-- ------------------------------------------
	COE_Totem:UpdateTotemButtonFlash( elapsed );
	
	if( this.totem ~= COE.NoTotem ) then
		local border = getglobal( this:GetName() .. "Border" );
		if( COE.ConfigureBarMode ) then
			-- set a green border when this totem 
			-- should be visible and we are in config bar mode
			-- ------------------------------------------------
			if( COE_DisplayedTotems[this.totem.SpellName].Visible ) then
				border:SetVertexColor( 0, 1.0, 0, 0.75 );
				border:Show();
			else
				border:Hide();
			end

		elseif( COE.ConfigureOrderMode ) then
			-- set a blue border when this totem 
			-- is the first totem to be swapped
			-- ----------------------------------
			if( COE_Config.ConfigureOrderTotem == this.totem ) then
				border:SetVertexColor( 1.0, 0, 1.0, 0.75 );
				border:Show();
			else
				border:Hide();
			end

		elseif( COE_Config:GetSaved( COEOPT_ENABLESETS ) == 1 and 
				COE.TotemSets[COE_Config:GetSaved( COEOPT_ACTIVESET )][this.totem.Element] == this.totem ) then
			
			-- set a red border when this totem 
			-- belongs to the current totem set
			-- -----------------------------------
			border:SetVertexColor( 1.0, 0, 0, 0.75 );
			border:Show();
		else
			border:Hide();
		end
	end

	this:SetChecked( false );

	-- update timer text
	-- ------------------
	COE_Totem:SetTimerText();
	
	this.UpdateTime = 0;
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateTotemButtonCooldown
	
	PURPOSE: Updates the cooldown texture of the button
-------------------------------------------------------------------]]
function COE_Totem:UpdateTotemButtonCooldown()

	if( this.totem == COE.NoTotem ) then
		return;
	end;

	local cooldown = getglobal( this:GetName() .. "Cooldown" );

	-- don't show the cooldown texture for totems with a real
	-- cooldown to make the cooldown timer more readable
	-- -------------------------------------------------------
	if( this:IsVisible() and this.totem.CurCooldown == 0 ) then
		local start, duration, enable;
		
		if( this.totem.isTrinket ) then
			if( this.totem.ToolPresent ) then
				start, duration, enable = GetInventoryItemCooldown( "player", this.totem.TrinketSlot );
			else
				cooldown:Hide();
				return;
			end
		else
			local SpellID = this.totem.Ranks[this.totem.MaxRank].SpellID;
			start, duration, enable = GetSpellCooldown( SpellID, BOOKTYPE_SPELL );
		end 

		CooldownFrame_SetTimer( cooldown, start, duration, enable );
	else
		cooldown:Hide();	
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateTotemButtonIsUsable
	
	PURPOSE: Since we don't use the totem buttons as "real" action
		buttons in order to be independent on other mods messing 
		around with action bars, we cannot use IsActionUsable() to
		know if the totem is usable or if we have enough mana
-------------------------------------------------------------------]]
function COE_Totem:UpdateTotemButtonIsUsable()

	if( this.totem == COE.NoTotem ) then
		return;
	end;

	local icon = getglobal( this:GetName() .. "Icon" );
	local normalTexture = getglobal( this:GetName() .. "NormalTexture" );

	-- assume the player doesn't have the required tool
	-- -------------------------------------------------
	icon:SetVertexColor( 0.4, 0.4, 0.4 );
	normalTexture:SetVertexColor( 1.0, 1.0, 1.0 );

	-- check if totem tool is present
	-- -------------------------------
	if( this.totem.ToolPresent ) then
		icon:SetVertexColor( 1.0, 1.0, 1.0 );
		normalTexture:SetVertexColor( 1.0, 1.0, 1.0 );
	end

	if( not this.totem.isTrinket ) then
		-- now check for enough mana
		-- --------------------------
		local rank;
		if( COE_Totem:RankModifierDown() ) then
			rank = this.totem.Ranks[1];
		else
			rank = this.totem.Ranks[this.totem.MaxRank];
		end
	
		if( rank.Mana > UnitMana( "player" ) ) then
			icon:SetVertexColor(0.5, 0.5, 1.0);
			normalTexture:SetVertexColor(0.5, 0.5, 1.0);
		end
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateTotemButtonHotKey
	
	PURPOSE: Updates the hot key display
-------------------------------------------------------------------]]
function COE_Totem:UpdateTotemButtonHotKey()

	if( this.totem == COE.NoTotem ) then
		return;
	end;

	-- get the binding name
	-- ---------------------
	local binding = "TOTEM" .. string.upper( this.totem.Element );
	local id = this:GetID() - getglobal( "COETotem" .. this.totem.Element .. "1" ):GetID() + 1;
	binding = binding .. id;	

	-- get the binding text
	-- ---------------------	
	local text = GetBindingText( GetBindingKey( binding ), "KEY_" );	

	-- replace modifiers
	-- ------------------
	text = gsub( text, COEMODIFIER_ALT, COEMODIFIER_ALT_SHORT );
	text = gsub( text, COEMODIFIER_CTRL, COEMODIFIER_CTRL_SHORT );
	text = gsub( text, COEMODIFIER_SHIFT, COEMODIFIER_SHIFT_SHORT );
	text = gsub( text, COEMODIFIER_NUMPAD, COEMODIFIER_NUMPAD_SHORT );

	-- set button text
	-- ----------------
	local hotkey = getglobal( this:GetName() .. "HotKey" );
	hotkey:SetText( text );	

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateTotemButtonFlash
	
	PURPOSE: Updates the button flash if it has a cleansing totem
		and the corresponding warning is active
-------------------------------------------------------------------]]
function COE_Totem:UpdateTotemButtonFlash( elapsed )

	if( (this.totem == COE.NoTotem) or this.totem.isTrinket ) then
		return;
	end;

	if( COE_Config:GetSaved( COEOPT_ADVISOR ) == 1 ) then
		if( (this == COE.CleansingTotems.Tremor.Button and COE.CleansingTotems.Tremor.Warn) or  
			(this == COE.CleansingTotems.Disease.Button and COE.CleansingTotems.Disease.Warn) or
			(this == COE.CleansingTotems.Poison.Button and COE.CleansingTotems.Poison.Warn) ) then

			this.Flashtime = this.Flashtime - elapsed;
			if ( this.Flashtime <= 0 ) then
				local overtime = - this.Flashtime;
				if ( overtime >= ATTACK_BUTTON_FLASH_TIME ) then
					overtime = 0;
				end
				this.Flashtime = ATTACK_BUTTON_FLASH_TIME - overtime;

				local flashTexture = getglobal( this:GetName().."Flash" );
				if ( flashTexture:IsVisible() ) then
					flashTexture:Hide();
				else
					flashTexture:Show();
				end
			end
			
			return;
		end
	end

	getglobal( this:GetName().."Flash" ):Hide();
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:OnEnterTotemButton
	
	PURPOSE: Shows the tooltip and the dynamic buttons of the
		parent frame if in flex mode
-------------------------------------------------------------------]]
function COE_Totem:OnEnterTotemButton()

	-- show tooltip if enabled
	-- ------------------------
	if( COEUI_TTALIGN[COE_Config:GetSaved( COEOPT_TTALIGNMENT )][1] ~= "DISABLED" and
		this.totem ~= COE.NoTotem ) then

		GameTooltip:SetOwner( this, COEUI_TTALIGN[COE_Config:GetSaved( COEOPT_TTALIGNMENT )][1] );
		
		if( this.totem.isTrinket ) then
			-- show item tooltip if equipped
			-- else show name of the item
			-- ------------------------------
			if( this.totem.ToolPresent ) then
				GameTooltip:SetInventoryItem( "player", this.totem.TrinketSlot );
			else
				GameTooltip:SetText( COESTR_TRINKET_TOOLTIP );
			end
		else
			-- show spell tooltip
			-- -------------------
			local SpellID = this.totem.Ranks[this.totem.MaxRank].SpellID;
			GameTooltip:SetSpell( SpellID, BOOKTYPE_SPELL );
		end
	end

	-- show dynamic buttons
	-- ---------------------	
	if( this.ElementFrame.Mode == "Flex" ) then
		this.ElementFrame.Expanded = true;
		COE_Totem:Invalidate( this.ElementFrame, false, false, true );
		Chronos.unscheduleByName( "COEFlex" .. this.ElementFrame.Element );
	end  

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:OnLeaveTotemButton
	
	PURPOSE: Hides the tooltip
-------------------------------------------------------------------]]
function COE_Totem:OnLeaveTotemButton()

	-- hide tooltip if enabled
	-- ------------------------
	if( COEUI_TTALIGN[COE_Config:GetSaved( COEOPT_TTALIGNMENT )][1] ~= "DISABLED" ) then
	    GameTooltip:Hide();
	end

	-- schedule hiding of the dynamic buttons
	-- ---------------------------------------	
	if( this.ElementFrame.Mode == "Flex" ) then
		Chronos.scheduleByName( "COEFlex" .. this.ElementFrame.Element, COE_Totem.FlexTime, COESched_HideDynamicButtons, this.ElementFrame ); 
	end  
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:OnTotemButtonClick
	
	PURPOSE: Throws the associated totem if possible or activates
		the totem for the current totem set if in set config mode
-------------------------------------------------------------------]]
function COE_Totem:OnTotemButtonClick()

	if( this.totem == COE.NoTotem ) then
		return;
	end;

	if( COE.ConfigureBarMode ) then
		
		-- toggle totem visibility
		-- ------------------------ 
		if( COE_DisplayedTotems[this.totem.SpellName].Visible ) then
			COE_DisplayedTotems[this.totem.SpellName].Visible = false;
		else
			COE_DisplayedTotems[this.totem.SpellName].Visible = true;
		end

	elseif( COE.ConfigureOrderMode ) then

		if( COE_Config.ConfigureOrderTotem == nil or 
			COE_Config.ConfigureOrderTotem.Element ~= this.totem.Element ) then

			-- set first totem to be swapped
			-- ------------------------------
			COE_Config.ConfigureOrderTotem = this.totem;
			
		elseif( COE_Config.ConfigureOrderTotem == this.totem ) then
			-- unset first totem
			-- ------------------
			COE_Config.ConfigureOrderTotem = nil;
			
		else
			-- swap this totem with the first one
			-- -----------------------------------
			local swap = COE_DisplayedTotems[COE_Config.ConfigureOrderTotem.SpellName].Order;
			COE_DisplayedTotems[COE_Config.ConfigureOrderTotem.SpellName].Order = COE_DisplayedTotems[this.totem.SpellName].Order;
			COE_DisplayedTotems[this.totem.SpellName].Order = swap;
			
			COE_Config.ConfigureOrderTotem = nil;
		
		end;
		
		-- reconfigure totem bar
		-- ----------------------
		COETotemFrame.Reconfigure = true;		

	elseif( COE.ConfigureSetsMode ) then
		local activeset = COE_Config:GetSaved( COEOPT_ACTIVESET );
		
		if( COE.TotemSets[activeset][this.totem.Element] == this.totem ) then
			-- already in the set, remove
			-- ---------------------------
			COE.TotemSets[activeset][this.totem.Element] = nil;
			if( activeset <= COESET_DEFAULT ) then 
				COE_SavedTotemSets[activeset][this.totem.Element] = "";
			else
				COE_CustomTotemSets[activeset - COESET_DEFAULT][this.totem.Element] = "";
			end
		else
			-- store in set
			-- -------------
			COE.TotemSets[activeset][this.totem.Element] = this.totem;
			if( activeset <= COESET_DEFAULT ) then 
				COE_SavedTotemSets[activeset][this.totem.Element] = this.totem.SpellName;
			else
				COE_CustomTotemSets[activeset - COESET_DEFAULT][this.totem.Element] = this.totem.SpellName;
			end
		end
		
		-- reconfigure totem bar
		-- ----------------------
		COETotemFrame.Reconfigure = true;

	else
	
		-- if the ctrl key is down, make this totem the anchor totem
		-- ----------------------------------------------------------
		if( IsControlKeyDown() ) then
			COE_Totem:MakeAnchorTotem( this );
		end

		if( this.totem.isTrinket ) then
			
			if( this.totem.TrinketSlot ) then
				UseInventoryItem( this.totem.TrinketSlot );
			end 
		
		else
			local spellid = this.totem.Ranks[this.totem.MaxRank].SpellID;
		
			-- check if the override key is down
			-- ----------------------------------
			if( COE_Totem:RankModifierDown() ) then
				spellid = this.totem.Ranks[1].SpellID;
			end
		
			-- throw totem
			-- ------------
			CastSpell( spellid, BOOKTYPE_SPELL );
		end
	
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:ButtonStartDrag
	
	PURPOSE: Starts dragging of all or one parent frames
-------------------------------------------------------------------]]
function COE_Totem:ButtonStartDrag()

	if( this:GetParent() == COETimerFrame ) then
		this:GetParent():StartMoving();
		
	-- When the Shift key is held, pickup the spell instead. 
	-- Additionally holding the control key while doing so 
	-- picks up Rank 1.
	---------------------------------------------------------
	elseif( (this.totem ~= COE.NoTotem) and (not this.totem.isTrinket) and IsShiftKeyDown() ) then
		local rank;
		if( IsControlKeyDown() ) then 
			rank = 1;
		else
			rank = this.totem.MaxRank;
		end
		
		local SpellID = this.totem.Ranks[rank].SpellID;
		PickupSpell( SpellID, BOOKTYPE_SPELL );
		
	elseif( COE_Config:GetSaved( COEOPT_FIXBAR ) == 0 and this == this.ElementFrame.AnchorTotem ) then
		this:GetParent():StartMoving();
		this:GetParent().IsMoving = true;
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:ButtonStopDrag
	
	PURPOSE: Stops dragging of all or one parent frames
-------------------------------------------------------------------]]
function COE_Totem:ButtonStopDrag()

	this:GetParent():StopMovingOrSizing();

	if( this:GetParent() ~= COETimerFrame ) then
		this:GetParent().IsMoving = false;
		COE_Totem:UpdateFrameCoordinates();
	end
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:MakeAnchorTotem
	
	PURPOSE: If the totem is currently shown as a dynamic button,
		it is made the anchor totem if we are in Active Set or
		Customize mode. In Active Set mode, it is also replaces
		the element totem in the current set
-------------------------------------------------------------------]]
function COE_Totem:MakeAnchorTotem( button )

	local mode = COE_Config:GetSaved( COEOPT_DISPLAYMODE );
	local totem = button.totem;
	local anchor = button:GetParent().AnchorTotem.totem;
	
	if( totem ~= anchor ) then		
		if( mode == COEMODE_ALLTOTEMS ) then
			-- swap this totem with the anchor totem
			-- --------------------------------------
			local swap = COE_DisplayedTotems[anchor.SpellName].Order;
			COE_DisplayedTotems[anchor.SpellName].Order = COE_DisplayedTotems[totem.SpellName].Order;
			COE_DisplayedTotems[totem.SpellName].Order = swap;
		
		elseif( mode == COEMODE_ACTIVESET ) then
			-- replace the set totem with this one
			-- ------------------------------------
			COE.TotemSets[COE_Config:GetSaved( COEOPT_ACTIVESET )][totem.Element] = totem;
		end
		
		COE_Totem:Invalidate( button.ElementFrame, true, true, true );
		COETotemFrame.Reconfigure = true;	
	end	

end

function COE_Totem_StartTotemTicks(name,ticktimer,Tick)
	
	CooldownFrame_SetTimer(getglobal(ticktimer),GetTime(),Tick,1);
	
	Chronos.scheduleByName(name,Tick,COE_Totem_StartTotemTicks,name,ticktimer,Tick)
end;

--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:SetTimerText
	
	PURPOSE: Updates the timer text shown in the button if the
		associated totem has an active timer
-------------------------------------------------------------------]]
function COE_Totem:SetTimerText()

	if( this.totem == COE.NoTotem ) then
		return;
	end;
	
	local timertext = getglobal( this:GetName() .. "Text" );
	local overlaytex = getglobal( this:GetName().. "OverlayTex" );  
	local ticktimer = getglobal(this:GetName() .. "TickCooldown");

	-- show timers only in timerframe and this is a bar button?
	-- ---------------------------------------------------------
	if( COE_Config:GetSaved( COEOPT_FRAMETIMERSONLY ) == 1 and
		this:GetParent() ~= COETimerFrame ) then
		timertext:Hide();
		overlaytex:Hide();
		return;
	end;

	if( COE_Config:GetSaved( COEOPT_ENABLETIMERS ) == 1 ) then
		if( COE_Totem:IsTimerActive( this.totem ) ) then
			-- format text
			-- ------------
			local time = COE_Totem:GetTimeLeft( this.totem );
			local min = math.floor( time / 60 );
			local sec = math.mod( math.floor( time ), 60 );
			local text;
		
			if( min > 0 ) then
				text = string.format( "%d:%02d", min, sec );
			else
				text = sec;
			end
	
			-- set text
			-- ---------
			timertext:SetText( text );
		
			-- set the color 
			-- --------------	
			overlaytex:SetVertexColor( 0.1, 0.1, 0.1, 0.75 );
			timertext:SetVertexColor( 1, 1, 1, 1 );

			-- show text and overlay
			-- ----------------------
			timertext:Show();
			overlaytex:Show();
			
			
			-- activate ticks
			-- --------------
			
			if ( this.totem.ticks == false and this.totem.Tick) then
				
				this.totem.ticks = true
				if not ticktimer:IsVisible() then ticktimer:Show(); end
				
				COE_Totem_StartTotemTicks(this:GetName() .. "TickTimer",this:GetName() .. "TickCooldown",this.totem.Tick)
				
			end

			
		elseif( this.totem.CurCooldown > 0 ) then
		
			-- format text
			-- ------------
			local time = COE_Totem:GetCooldownLeft( this.totem );
			local min = math.floor( time / 60 );
			local sec = math.mod( math.floor( time ), 60 );
			local text;
		
			if( min > 0 ) then
				text = string.format( "%d:%02d", min, sec );
			else
				text = sec;
			end

			-- set text
			-- ---------
			timertext:SetText( text );
		
			-- set the color 
			-- --------------	
			overlaytex:SetVertexColor( 1, 1, 1, 1 );
			timertext:SetVertexColor( 1, 0, 0, 1 );

			-- show text and overlay
			-- ----------------------
			timertext:Show();
			overlaytex:Show();
			
			Chronos.unscheduleByName(this:GetName() .. "TickTimer");
			ticktimer:Hide();
			this.totem.ticks = false;
			
		else
			-- if timer has just expired, deactivate it
			-- if it isn't active anyway, the call doesn't hurt
			-- -------------------------------------------------
			COE_Totem:DeactivateTimer( this.totem );

			Chronos.unscheduleByName(this:GetName() .. "TickTimer");
			ticktimer:Hide();
			if this.totem then this.totem.ticks = false end;
			
			timertext:Hide();
			overlaytex:Hide();
		end
	else
		timertext:Hide();
		overlaytex:Hide();
	end

end


--[[ =============================================================================================

										T I M E R F R A M E 

================================================================================================]]

--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:InitTimerFrame
	
	PURPOSE: Initializes the timer frame
-------------------------------------------------------------------]]
function COE_Totem:InitTimerFrame()
	-- addon loaded?
	-- --------------
	if( not COE.Initialized ) then
		return;
	end
	
	this.UpdateTime = 0;

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateTimerFrame
	
	PURPOSE: Updates the timer frame
-------------------------------------------------------------------]]
function COE_Totem:UpdateTimerFrame( elapsed )

	-- check if visual update is necessary
	-- ------------------------------------
	this.UpdateTime = this.UpdateTime + elapsed;
	if( this.UpdateTime <= COE.UpdateInterval ) then
		return;
	end

	-- set scaling
	-- ------------
	this:SetScale( COE_Config:GetSaved( COEOPT_SCALING ) );
	

	local k;
	local lastbutton = nil;
	local count = 0;
	
	for k = 1,4 do
		local button = getglobal( "COETimer" .. COE_Element[k] ); 

		if( button.totem ) then
			button:ClearAllPoints();
				
			if( lastbutton ) then
				if( COE_Config:GetSaved( COEOPT_DISPLAYALIGN ) == COEMODE_BOX ) then
					if( count == 2 ) then
						button:SetPoint( "TOPRIGHT", lastbutton:GetName(), "BOTTOMLEFT", -COEUI_BUTTONGAP, -COEUI_BUTTONGAP );
						lastbutton = button;
					else
						button:SetPoint( "TOPLEFT", lastbutton:GetName(), "TOPRIGHT", COEUI_BUTTONGAP, 0 );
						lastbutton = button;
					end
				elseif( COE_Config:GetSaved( COEOPT_DISPLAYALIGN ) == COEMODE_VERTICAL ) then 
					button:SetPoint( "TOPLEFT", lastbutton:GetName(), "BOTTOMLEFT", 0, -COEUI_BUTTONGAP );
					lastbutton = button;
				else
					button:SetPoint( "TOPLEFT", lastbutton:GetName(), "TOPRIGHT", COEUI_BUTTONGAP, 0 );
					lastbutton = button;
				end
			else
				button:SetPoint( "TOPLEFT", 0, 0 );
				lastbutton = button;
			end
				
			button:Show();
			count = count + 1;
		else
			-- button is not active
			-- ---------------------
			button:Hide();
		end
	end

end

