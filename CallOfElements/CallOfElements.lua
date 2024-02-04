--[[

	CALL OF ELEMENTS
	The All-In-One Shaman Addon
	
	by Wyverex (2006)
        by laytya (2018-2022)

]]

if( not COE ) then 
	COE = {};
end 

COE_VERSION = 2.8

COECOL_TOTEMWARNING = 1;
COECOL_TOTEMDESTROYED = 2;
COECOL_TOTEMCLEANSING = 3;

--[[ ----------------------------------------------------------------
	When DebugMode is set to true, all DebugMessage calls will
	write a debug message into the chat frame
-------------------------------------------------------------------]]
COE["DebugMode"] = false;


--[[ ----------------------------------------------------------------
	These variables control frame updates
	UpdateInterval sets the interval in seconds after which a 
	frame is updated
	ForceUpdate can be used as input into Update handlers to force
	an update regardless of the current timer
-------------------------------------------------------------------]]
COE["UpdateInterval"] = 0.1;
COE["ForceUpdate"] = COE.UpdateInterval * 2; 


--[[ ----------------------------------------------------------------
	The AdvisorInterval controls how often the party/raid is
	scanned for debuffs that are curable by totems
	The AdvisorWarningInterval controls how often the player is
	notified about existing debuffs
-------------------------------------------------------------------]]
COE["AdvisorInterval"] = 1;
COE["AdvisorWarningInterval"] = 7;


--[[ ----------------------------------------------------------------
	METHOD: COE:Init
	
	PURPOSE: Loads submodules and initializes data
-------------------------------------------------------------------]]
function COE:Init()
	
	-- load only for shamans
	-- ----------------------
	local _, EnglishClass = UnitClass( "player" );
	if( EnglishClass ~= "SHAMAN" ) then
		COE:Message(COESTR_NOTASHAMAN);
		COE.Initialized = false;
	else
		COE.Initialized = true;
		COE:Message("Call of Elements v"..COE_VERSION.." mod CFM /coe");
		this:RegisterEvent( "VARIABLES_LOADED" );
	
		-- register shell command
		-- -----------------------
		SlashCmdList["COE"] = COEProcessShellCommand;
    	SLASH_COE1="/coe";
		
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE:OnEvent
	
	PURPOSE: Handles frame events
-------------------------------------------------------------------]]
function COE:OnEvent( event )

	if( event == "VARIABLES_LOADED" ) then
		-- fix saved variables if this update has to do so
		-- ------------------------------------------------
		COE:FixSavedVariables();
	end
end


--[[ ----------------------------------------------------------------
	METHOD: COE:Message
	
	PURPOSE: Adds a message to the default chat frame
-------------------------------------------------------------------]]
function COE:Message( msg )
	DEFAULT_CHAT_FRAME:AddMessage( "[COE] " .. msg, 0.93, 0.83, 0.45 );
end;


--[[ ----------------------------------------------------------------
	METHOD: COE:DebugMessage
	
	PURPOSE: Adds a debug message to the default chat frame if
		debug mode is enabled
-------------------------------------------------------------------]]
function COE:DebugMessage( msg )
	if( COE.DebugMode ) then
		DEFAULT_CHAT_FRAME:AddMessage( "[COE] " .. msg, 0.5, 0.5, 0.5 );
	end
end;


--[[ ----------------------------------------------------------------
	METHOD: COE:Notification
	
	PURPOSE: Adds a message to the error frame in the upper
		screen center
-------------------------------------------------------------------]]
function COE:Notification( msg, color )

	local col;

	-- choose color
	-- -------------
	if( color == COECOL_TOTEMWARNING ) then
		col = { r = 0, g = 0.6, b = 1 };
	elseif( color == COECOL_TOTEMDESTROYED ) then
		col = { r = 1, g = 0.4, b = 0 };
	elseif( color == COECOL_TOTEMCLEANSING ) then
		col = { r = 0, g = 1, b = 0.4 };
	else
		col = { r = 1, g = 1, b = 1 };
	end

	-- add message
	-- ------------
	UIErrorsFrame:AddMessage( msg, col.r, col.g, col.b, 1.0, UIERRORS_HOLD_TIME );
	
end;


--[[ ----------------------------------------------------------------
	METHOD: COE:ToggleConfigFrame
	
	PURPOSE: Toggles the configuration dialog
-------------------------------------------------------------------]]
function COE:ToggleConfigFrame()
	
	if( COE_ConfigFrame:IsVisible() ) then
		COE_Config:CloseDialog()
	else
		COE_ConfigFrame:Show();
	end

	PlaySound( "igMainMenuOption" );

end


--[[ ----------------------------------------------------------------
	METHOD: COEProcessShellCommand
	
	PURPOSE: Executes the entered shell command
-------------------------------------------------------------------]]
function COEProcessShellCommand( msg )

	if( msg == "" or msg == "config" ) then
		COE:ToggleConfigFrame();
		
	elseif( msg == "list" ) then
		COE:DisplayShellCommands();
		
	elseif( msg == "nextset" ) then
		COE_Totem:SwitchToNextSet();
		
	elseif( msg == "priorset" ) then
		COE_Totem:SwitchToPriorSet();

	elseif( msg == "throwset" ) then
		COE_Totem:ThrowSet();
		
	elseif( msg == "restartset" ) then
		COE_Totem:ResetSetCycle();
		
	elseif( msg == "reset" ) then
		COE_Totem:ResetTimers();
		
	elseif( msg == "reload" ) then
		COE_Totem:Rescan();
		
	elseif( msg == "resetframes" ) then
		COE_Totem:ResetFrames();

	elseif( msg == "advised" ) then
		COE_Totem:ThrowAdvisedTotem();
		
	elseif( msg == "resetordering" ) then
		COE_DisplayedTotems = {};
		COE_Totem:Rescan();
		
	elseif( msg == "bestheal" ) then
		COE_Heal:BestHeal();
		
	elseif( msg == "battleheal" ) then
		COE_Heal:BattleHeal();

	else
		local _,_,arg = string.find( msg, "set (.*)" );
		if( arg ) then
			COE_Totem:SwitchToSet( arg );
		end
	end  	

end


--[[ ----------------------------------------------------------------
	METHOD: COE:DisplayShellCommands
	
	PURPOSE: Shows a list of all shell commands
-------------------------------------------------------------------]]
function COE:DisplayShellCommands()

	COE:Message( COESHELL_INTRO );
	COE:Message( COESHELL_CONFIG );
	COE:Message( COESHELL_LIST );
	COE:Message( COESHELL_NEXTSET );
	COE:Message( COESHELL_PRIORSET );
	COE:Message( COESHELL_SET );
	COE:Message( COESHELL_RESTARTSET );
	COE:Message( COESHELL_RESET );
	COE:Message( COESHELL_RESETFRAMES );
	COE:Message( COESHELL_RESETORDERING );
	COE:Message( COESHELL_RELOAD );
	COE:Message( COESHELL_MACRONOTE );
	COE:Message( COESHELL_THROWSET );
	COE:Message( COESHELL_ADVISED );

end


--[[ ----------------------------------------------------------------
	METHOD: COE:FixSavedVariables
	
	PURPOSE: If this addon version is higher than the one in
		the saved variables, check if we have to fix the
		saved variables due to fixed bugs
-------------------------------------------------------------------]]
function COE:FixSavedVariables()

	-- is the version stored in the saved variables?
	-- ----------------------------------------------
	if( not COE_Config:GetSaved( COEOPT_VERSION ) ) then
		-- this is version <= v1.6
		-- ------------------------
		COE_Config:SetOption( COEOPT_VERSION, 1.6 );
	end
	
	local version = COE_Config:GetSaved( COEOPT_VERSION );
	
	if( version == 1.6 ) then
		-- fix localized cast order in 1.7
		-- --------------------------------
		COE:Fix_CastOrderLocalization();
		
		COE:Message( COESTR_UDATEDSAVED .. "1.7" );
		COE_Config:SetOption( COEOPT_VERSION, 1.7 );
		version = COE_Config:GetSaved( COEOPT_VERSION );
	end

	if( version == 1.7 ) then
		-- fix cast order again to due to a typo
		-- --------------------------------------
		COE:Fix_CastOrderLocalization();
	
		COE:Message( COESTR_UDATEDSAVED .. "1.8" );
		COE_Config:SetOption( COEOPT_VERSION, 1.8 );
		version = COE_Config:GetSaved( COEOPT_VERSION );
	end
	
	-- fix totem set element strings
	-- ------------------------------
	COE:Fix_CastOrderLocalization2();

	COE_Config:SetOption( COEOPT_VERSION, 2.1 );
    
	-- Cosmos support
	if(EarthFeature_AddButton) then 
		
		EarthFeature_AddButton(
			{ id = BINDING_HEADER_CALLOFELEMENTS;
			name = BINDING_HEADER_CALLOFELEMENTS;
			subtext = "Version: " .. COE_VERSION; 
			tooltip = "";      
			icon = "Interface\\Icons\\INV_Misc_Idol_03";
			callback = COE.ToggleConfigFrame;
			test = nil;
			} )
	elseif (Cosmos_RegisterButton) then 
		Cosmos_RegisterButton(BINDING_HEADER_CALLOFELEMENTS, BINDING_HEADER_CALLOFELEMENTS, COE_VERSION, "Interface\\Icons\\INV_Misc_Idol_03", COE_ToggleConfigFrame);
	end        
end
