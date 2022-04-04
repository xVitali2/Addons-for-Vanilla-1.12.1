--------------------------------------------------------------------------------------------------
-- MasterTradeSkills by DaDaemon Updated By Triadian
--------------------------------------------------------------------------------------------------
-- Global variables
--    Database, inspired by BookOfCrafts
MTS_DATA = {};
	--[[
		.Version                   : Data version


		.Characters                : Indexed table of characters
		   [i]                     : Acces to i-th character
		      .Name                : Character name
		      .Realm               : Character realm
		      .Faction             : Character faction

			.Options               : All configuration options (save per character)


		[tradeskill]               : Contains all known craft objects for "tradeskill" (tailor, alchemy, ...)
		   [crafted_object]        : Data for specific "crafted_object"
		      .LearntBy[i]         : index in ".Characters" of i-th character who knows this tradeskills

	]]--

-- Global settings
MTS_VARIABLES_LOADED = false;
MTS_PLAYER_NAME_KNOWN = false;
MTS_DATA_CHECKED = false;
MTS_REAGENT_DATA = false;
MTS_RECURSE = false;
--------------------------------------------------------------------------------------------------
-- Event functions
--------------------------------------------------------------------------------------------------

-- OnLoad event
function MasterTradeSkills_OnLoad()
	-- Register the events that need to be watched
	this:RegisterEvent("ADDON_LOADED");
	this:RegisterEvent("PLAYER_LOGOUT");
	this:RegisterEvent("TRADE_SKILL_SHOW");
	this:RegisterEvent("TRADE_SKILL_UPDATE");
	this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("UNIT_NAME_UPDATE");
	this:RegisterEvent("PLAYER_ENTERING_WORLD");
	this:RegisterEvent("CRAFT_SHOW");
	this:RegisterEvent("CRAFT_UPDATE");
	
	-- hook into the text link
	MTS_Original_SetItemRef = SetItemRef;
	SetItemRef = MTS_SetItemRef;
	
	if (GetLocale() == "deDE") then
    	MasterTradeSkills_LoadGerman();
    	ReagentData_LoadGerman();
	elseif (GetLocale() == "frFR") then
    	MasterTradeSkills_LoadFrench();
    	ReagentData_LoadFrench();
	elseif (GetLocale() == "ruRU") then
    	MasterTradeSkills_LoadRussian();
    	ReagentData_LoadRussian();
	end
end

-- OnEvent event
function MasterTradeSkills_OnEvent(event)
	-- Check the current event
	if (event == "ADDON_LOADED" and arg1 == MTS_NAME) then
		-- Initialize the addon
		MasterTradeSkills_Initialize();
	elseif (event == "CHAT_MSG_SYSTEM") then
		MasterTradeSkills_Tooltip(arg1);
	elseif (event == "PLAYER_LOGOUT") then
		-- Save the bindings
		-- MasterTradeSkills_SaveBindings();
	elseif (event == "TRADE_SKILL_SHOW" or event == "TRADE_SKILL_UPDATE") then
		MasterTradeSkills_ReadRecipes();
	elseif (event == "CRAFT_SHOW" or event == "CRAFT_UPDATE") then
		MasterTradeSkills_ReadCrafts();
	elseif( event=="VARIABLES_LOADED" ) then
		MTS_VARIABLES_LOADED = true;
		MasterTradeSkills_InitData();
		if (IRR_ItemTypes) then
			LINK_WRANGLER_CALLER['MasterTradeSkills'] = 'MasterTradeSkills_AddStuff';
		end
	elseif( ((event=="UNIT_NAME_UPDATE") and (arg1=="player")) or (event=="PLAYER_ENTERING_WORLD") ) then
		local char_name = UnitName( "player" )
		if((char_name ~= nil) and (char_name ~= "") and (char_name ~= UNKNOWNOBJECT) and (char_name ~= UNKNOWNBEING)) then
			MTS_PLAYER_NAME_KNOWN = true;
			MasterTradeSkills_InitData();
		end
	end
end


--------------------------------------------------------------------------------------------------
-- Initialize functions - Based on myDebug
--------------------------------------------------------------------------------------------------

-- Initialize the addon
function MasterTradeSkills_Initialize()
-- Check if myAddOns is loaded
	if (myAddOnsFrame_Register) then
		local MasterTradeSkillsDetails = {
			name = MTS_NAME,
			version = MTS_VERSION,
			releaseDate = MTS_RELEASE,
			author = "Triadian",
			email = "Triadian@Gmail.com",
			category = MYADDONS_CATEGORY_PROFESSIONS,
			optionsframe = "MTS_OptionsFrame" 
		};
		-- Initialize the addon's help
		local MasterTradeSkillsHelp = 	MTS_MYADDON_HELP;
		-- Register the addon in myAddOns
		myAddOnsFrame_Register(MasterTradeSkillsDetails, MasterTradeSkillsHelp);
	end
-- Display a message in the ChatFrame indicating a successful load of the addon

	SLASH_MasterTradeSkills1 = "/MasterTradeSkills";
	SLASH_MasterTradeSkills2 = "/mts"; 
	SlashCmdList["MasterTradeSkills"] = MasterTradeSkills_Command;
	
	if (ReagentData) then
		if ( not ReagentData['crafted']['alchemy']) then
			ReagentData_LoadAlchemy();
		end
		if ( not ReagentData['crafted']['blacksmithing']) then
			ReagentData_LoadBlacksmithing();
		end
		if ( not ReagentData['crafted']['cooking']) then
			ReagentData_LoadCooking();
		end
		if ( not ReagentData['crafted']['enchanting']) then
			ReagentData_LoadEnchanting();
		end
		if ( not ReagentData['crafted']['engineering']) then
			ReagentData_LoadEngineering();
		end
		if ( not ReagentData['crafted']['firstaid']) then
			ReagentData_LoadFirstAid();
		end
		if ( not ReagentData['crafted']['leatherworking']) then
			ReagentData_LoadLeatherworking();
		end
		if ( not ReagentData['crafted']['mining']) then
			ReagentData_LoadMining();
		end
		if ( not ReagentData['crafted']['poisons']) then
			ReagentData_LoadPoisons();
		end
		if ( not ReagentData['crafted']['tailoring']) then
			ReagentData_LoadTailoring();
		end
	end
	
	MasterTradeSkills_Write(MTS_LOADED);
	
end

function MasterTradeSkills_InitData()
	if((MTS_PLAYER_NAME_KNOWN) and (MTS_VARIABLES_LOADED) and (not MTS_DATA_CHECKED) ) then
		MTS_CHAR_NAME    = UnitName( "player" )			-- character name
		MTS_CHAR_REALM   = GetCVar( "realmName" )		-- character realm
		MTS_CHAR_FACTION = UnitFactionGroup( "player" )	-- character faction

		-- Init general data
		if(not MTS_DATA.Version) then
			MTS_DATA.Version = 0;
		end

		if( not MTS_DATA.Characters ) then
			MTS_DATA.Characters = {};
		end

		MTS_DATA.Version = MTS_DATA_VERSION;

		-- Find character name
		local nb_chars = table.getn( MTS_DATA.Characters );
		MTS_CHAR_INDEX = nil;

		for i = 1, nb_chars do
			if((MTS_DATA.Characters[i].Name==MTS_CHAR_NAME) and
			    (MTS_DATA.Characters[i].Realm==MTS_CHAR_REALM) and
			    (MTS_DATA.Characters[i].Faction==MTS_CHAR_FACTION)) then
			    MTS_CHAR_INDEX = i;
			    break
			end
		end

		-- if not found, register new character
		if( MTS_CHAR_INDEX==nil ) then
			MTS_CHAR_INDEX = nb_chars+1;
			MTS_DATA.Characters[MTS_CHAR_INDEX] = {};
			MTS_DATA.Characters[MTS_CHAR_INDEX].Name    = MTS_CHAR_NAME;
			MTS_DATA.Characters[MTS_CHAR_INDEX].Realm   = MTS_CHAR_REALM;
			MTS_DATA.Characters[MTS_CHAR_INDEX].Faction = MTS_CHAR_FACTION;

			if(not MTS_DATA.Characters[MTS_CHAR_INDEX].Options) then
				MTS_DATA.Characters[MTS_CHAR_INDEX].Options = {};
				MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_STATE = 1;
				MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWLEARNED = 1;
				MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWNOTLEARNED = 1;
				MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOW_TRADESKILLS = {};
				MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_NUMTOSHOW = 10;
				MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWREV = 1;
				MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF1 = 1;
				MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF2 = 1;
				MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF3 = 1;
				MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF4 = 1;
				MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF5 = 1;
				for i = 1, table.getn(MTS_TRADESKILLS) do
					MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOW_TRADESKILLS[i] = 1;
				end
				
				MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_RECIPE_MAIN_COLOR = "|cFF00FF11";
				MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_RECIPE_RECIPE_COLOR = "|cFFFFB444";
				MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_RECIPE_SOURCE_COLOR = "|cFF56B59D";
				MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_RECIPE_SKILL_COLOR_LEARNABLE = "|cFF00FF00";
				MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_RECIPE_SKILL_COLOR_UNLEARNABLE = "|cFFFF0000";
				MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_TRADESKILL_SKILLLEVEL_COLOR = {
					[1] = "|cFFA0A0A0";
					[2] = "|cFF40C040";
					[3] = "|cFFFFEE00";
					[4] = "|cFFFF9900";
					[5] = "|cFFFF0000";
				};
				
						
			end
		end
		if (not MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_NUMTOSHOW ) then MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_NUMTOSHOW = 10; end
		if (not MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWREV ) then MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWREV = 1; end
		if (not MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF1 ) then MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF1 = 1; end
		if (not MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF2 ) then MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF2 = 1; end
		if (not MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF3 ) then MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF3 = 1; end
		if (not MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF4 ) then MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF4 = 1; end
		if (not MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF5 ) then MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF5 = 1; end
		if (not MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_UNKNOWNTOBOTTOM ) then MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_UNKNOWNTOBOTTOM = 1; end
		if (not MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_ALTNAME ) then MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_ALTNAME = 1; end
		if (not MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_MOUSEOVER ) then MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_MOUSEOVER = 1; end

		-- Initialize the options panel
		MTS_OptionsFrameCheck_Enabled:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_STATE);
		MTS_OptionsFrameCheck_ShowLearned:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWLEARNED);
		MTS_OptionsFrameCheck_ShowNotLearned:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWNOTLEARNED);
		MTS_OptionsFrameCheck_Show_Dif1:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF1);
		MTS_OptionsFrameCheck_Show_Dif2:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF2);
		MTS_OptionsFrameCheck_Show_Dif3:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF3);
		MTS_OptionsFrameCheck_Show_Dif4:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF4);
		MTS_OptionsFrameCheck_Show_Dif5:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF5);
		MTS_OptionsFrameCheck_ReverseOrder:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWREV);
		MTS_OptionsFrameCheck_UnknownToBot:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_UNKNOWNTOBOTTOM);
		MTS_OptionsFrameCheck_AltName:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_ALTNAME);
		MTS_OptionsFrameCheck_NoMinimap:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_MOUSEOVER);

		
		MTS_OptionsFrameText_ShowNumToShow:SetNumber(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_NUMTOSHOW);
		for i = 1, table.getn(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOW_TRADESKILLS) do
			getglobal("MTS_OptionsFrameCheck_ShowTradeSkills" .. i):SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOW_TRADESKILLS[i]);
		end
		
		-- Make the optionspanel right (fill in the right text)
		for i = 1, table.getn(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOW_TRADESKILLS) do
			getglobal("MTS_OptionsFrameText_ShowTradeSkills" .. i):SetText(MTS_TRADESKILLS[i]);
		end

		-- Data checked
		MTS_DATA_CHECKED = true;
	end
end

function MTS_NumToShow()
	MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_NUMTOSHOW = MTS_OptionsFrameText_ShowNumToShow:GetNumber();
end

function MTS_Options_ToggleShowRev()
	MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWREV = MTS_OptionsFrameCheck_ReverseOrder:GetChecked();
end

function MTS_Options_ToggleShowDif(dif)
	 if ( dif == 1 ) then 
		MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF1 = MTS_OptionsFrameCheck_Show_Dif1:GetChecked();
	elseif ( dif == 2 ) then 
		MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF2 = MTS_OptionsFrameCheck_Show_Dif2:GetChecked();
	elseif ( dif == 3 ) then 
		MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF3 = MTS_OptionsFrameCheck_Show_Dif3:GetChecked();
	elseif ( dif == 4 ) then 
		MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF4 = MTS_OptionsFrameCheck_Show_Dif4:GetChecked();
	elseif ( dif == 5 ) then 
		MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF5 = MTS_OptionsFrameCheck_Show_Dif5:GetChecked();
	end
end

-- Slash Commands
function  MasterTradeSkills_Command(msg)
	msg = string.lower(msg)
	if(msg == "help") then
		local MTS_HelpNr = table.getn(MTS_HELP);
		for i=1,MTS_HelpNr do 
			MasterTradeSkills_Write(MTS_HELP[i]);
		end		
	elseif(msg == "off") then
		if (MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_STATE == 1) then
			MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_STATE = 0;
		MTS_OptionsFrameCheck_Enabled:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_STATE);
			MasterTradeSkills_Write(MTS_DISABLED);			
		end
	elseif(msg == "on") then
		if (MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_STATE == 0) then
			MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_STATE = 1;
		MTS_OptionsFrameCheck_Enabled:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_STATE);
			MasterTradeSkills_Write(MTS_ENABLED);
		end
	elseif(msg == "toggle") then
		MTS_Options_Toggle();
	elseif(msg == "") then
		if (MTS_OptionsFrame:IsVisible()) then 
			MTS_OptionsFrame:Hide();
		else 
			MTS_OptionsFrame:Show();
		end
	elseif(msg == "show" ) then
		MTS_RecipeList:SetFont(GameFontNormal:GetFont(), 13, "NORMAL"); 
		MTS_RecipeFrameButtonRecurse:SetFont(GameFontNormal:GetFont(), 10, "NORMAL");
		if (not MTS_RecipeList:GetScript("OnMouseWheel")) then
			MTS_RecipeList:SetScript("OnMouseWheel", 
			function ()
				if (arg1 > 0) then 
					if (IsShiftKeyDown()) then 
						this:ScrollToTop();  
						for i = 1 , 34 do
							this:ScrollDown()
						end
					else 
						this:ScrollUp()
						this:ScrollUp()
						this:ScrollUp() 
					end
				elseif (arg1 < 0) then
					if (IsShiftKeyDown()) then 
						this:ScrollToBottom();
					else 	
						this:ScrollDown() 
						this:ScrollDown() 
						this:ScrollDown() 
					end
				end
			end
			);
		end
		MTS_RecipeList:EnableMouseWheel(1);
		if (MTS_RecipeFrame:IsVisible()) then 
			MTS_RecipeFrame:Hide();
		else 
			MTS_RecipeFrame:Show();
			MTS_RecipeList:ScrollToTop(); 
			for i = 1 , 34 do
				MTS_RecipeList:ScrollDown()
			end
		end
		
		-- Check if ReagentData is loaded
		if (ReagentData ~= nil) then
			MTS_REAGENT_DATA = true;
		end	
	else
		if (MTS_REAGENT_DATA == false) then
			MasterTradeSkills_Write("MasterTradeSkill: ReagentData isn't loaded yet.");
		else
			local professions = ReagentData_GetProfessions(msg);
			if ( professions == nil ) then 
				MasterTradeSkills_Write(MTS_WRONGSLASH)
			else
				MTS_RecipeFrameHeaderText:SetText(msg);
				MasterTradeSkills_CheckTooltipInfo(ItemRefTooltip, name);
			end
		end 
	end
end


-- Text in the tooltip
function MasterTradeSkills_CheckTooltipInfo(frame, name)
	-- Check if ReagentData is loaded
	if (ReagentData ~= nil) then
		MTS_REAGENT_DATA = true;
	end	

	if (MTS_REAGENT_DATA == false) then
		MasterTradeSkills_Write("MasterTradeSkill: ReagentData isn't loaded yet.");
	else
		local professions = ReagentData_GetProfessions(name);
		local totalcount = 0;
		-- text will hold the recipes to be written to the frame.
		local textleft = "";
		local prechar = "";
		local textright = "";
		local textline = 1;
		local skill = nil;
		local source = "";
		local MTS_Max = table.getn(MTS_TRADESKILLS);
		local count = {};
		for i=1, MTS_Max do
			count[MTS_TRADESKILLS[i]] = 0;
		end		
		

		local endsource = 0;
		local skilllevel_color = "";
		local Recipes = "";
		local Reagents = "";
		-- Make a new database for the tooltip
		local MTS_TOOLTIP_DB = {};
		local MTS_TOOLTIP_SKILLEVEL = 0;
		local MTS_IS_TRADESKILL = 0;
		if ( professions == nil ) then frame:Show(); return; end  
		-- Loop through the professions and recipes
		for key, value in professions do

			MTS_IS_TRADESKILL = MasterTradeSkill_IsTradeSkill(value);
			if (MTS_IS_TRADESKILL ~= 0 and MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOW_TRADESKILLS[MTS_IS_TRADESKILL] ~= 0) then
				 local MTS_TradeSkill = MTS_TRADESKILLS_NAME[MTS_IS_TRADESKILL];
				
				-- Clear Tooltip Database
				MTS_TOOLTIP_DB = {};
				MTS_LIST_DB = {};
				if ( textleft  == "" ) then MTS_RecipeList:Clear(); MTS_RecipeFrameHeaderText:SetText(name);  end
				for Recipes in ReagentData['crafted'][MTS_TradeSkill] do
					for Reagents in ReagentData['crafted'][MTS_TradeSkill][Recipes]['reagents'] do
						if (name == Reagents) then
							local MTS_SkillLevel = MasterTradeSkills_GetSkillLevel(value);
							textleft = "";
							textright = "";
							-- Get the skill level and source of the recipe
							skill = ReagentData['crafted'][MTS_TradeSkill][Recipes]['skill'];
							source = ReagentData['crafted'][MTS_TradeSkill][Recipes]['source'];
							-- Filter out the source
							endsource = string.find(source, ":");
							if (endsource ~= nil) then
								source = string.sub(source, 1 , endsource -1);
							elseif (source == "") then
								source = "?";
							end
							-- Look if the skill is know, and what color it is
							skilllevel_color = "";
							local AltKnown = 0;
							local AltKnownBy = "";
							local localeRecipes = MTS_RECIPENAME[Recipes];
							-- First check if the data is read
							if (MTS_DATA[value] ~= nil) then
								-- Second check if the recipe is in the MTS database
								if (MTS_DATA[value][localeRecipes] ~= nil) then
									-- Third look if it has been learnt by someone
									if (MTS_DATA[value][localeRecipes].LearntBy ~= nil) then
										-- Fourth check if the current user has learnt it
										AltKnown = 1;
										if (MTS_DATA[value][localeRecipes].LearntBy[MTS_CHAR_INDEX] ~= nil) then
											for i=1,4 do
												if (MTS_DATA[value][localeRecipes].LearntBy[MTS_CHAR_INDEX] == MTS_TRADESKILL_SKILLLEVEL[i]) then
													skilllevel_color = MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_TRADESKILL_SKILLLEVEL_COLOR[i];
													AltKnown = 0
												end
											end
										else 
										local nb_chars = table.getn( MTS_DATA.Characters );
											for i=1, nb_chars do
												if (MTS_DATA[value][localeRecipes].LearntBy[i] ~= nil ) then 
														for q=1,4 do
															if (MTS_DATA[value][localeRecipes].LearntBy[i] == MTS_TRADESKILL_SKILLLEVEL[q]) then
																Altskilllevel_color = MTS_DATA.Characters[i].Options.MTS_TRADESKILL_SKILLLEVEL_COLOR[q];
															end
														end
													if ( MTS_DATA.Characters[i].Realm == MTS_DATA.Characters[MTS_CHAR_INDEX].Realm and MTS_DATA.Characters[i].Faction == MTS_DATA.Characters[MTS_CHAR_INDEX].Faction) then 
													AltKnownBy = AltKnownBy .."  |r" .. Altskilllevel_color .. "[".. MTS_DATA.Characters[i].Name .."]|r";
													end
												end
											end
										end
									end
								end
							end
							if (skilllevel_color == ""  ) then
								if ( AltKnownBy ~= "") then 
									skilllevel_color = MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_RECIPE_SOURCE_COLOR;
								else
									skilllevel_color = MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_TRADESKILL_SKILLLEVEL_COLOR[5];
								end
							end
							-- Make the texts for in the tooltip
							local MTS_ShowTooltip = true;
							-- Options: Show Learned
							if (skilllevel_color ~= MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_TRADESKILL_SKILLLEVEL_COLOR[5] and MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWLEARNED == 0) then
								MTS_ShowTooltip = false;
							end
							-- Options: Show Not Learned
							if (skilllevel_color == MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_TRADESKILL_SKILLLEVEL_COLOR[5] and MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWNOTLEARNED == 0) then
								MTS_ShowTooltip = false;
							end
							-- Options: Show Trivial
							if (skilllevel_color == MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_TRADESKILL_SKILLLEVEL_COLOR[1] and MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF1 == nil ) then
								MTS_ShowTooltip = false;
							end
							-- Options: Show Easy
							if (skilllevel_color == MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_TRADESKILL_SKILLLEVEL_COLOR[2] and MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF2 == nil ) then
								MTS_ShowTooltip = false;
							end
							-- Options: Show Medium
							if (skilllevel_color == MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_TRADESKILL_SKILLLEVEL_COLOR[3] and MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF3 == nil ) then
								MTS_ShowTooltip = false;
							end
							-- Options: Show Optimal
							if (skilllevel_color == MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_TRADESKILL_SKILLLEVEL_COLOR[4] and MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF4 == nil ) then
								MTS_ShowTooltip = false;
							end
							-- Options: Show Too High
							if (skilllevel_color == MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_TRADESKILL_SKILLLEVEL_COLOR[5] and MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWDIF5 == nil ) then
								MTS_ShowTooltip = false;
							end
							
							-- Options: How Many so far Vs Number to show
							if ( totalcount > MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_NUMTOSHOW -1 ) then 
								MTS_ShowTooltip = false;
							end
							
								local localeRecipes = MTS_RECIPENAME[Recipes];
								if (localeRecipes == nil) then 
									localeRecipes = Recipes
									MasterTradeSkills_Write(MTS_UNKNOWN..Recipes);
								end
								
								-- Source Locales
									if ( source == "Vendor") then source = MTS_RVENDOR; 
									elseif ( source == "Trainer") then source = MTS_RTRAINER; 
									elseif ( source == "Drop") then source = MTS_RDROP; 
									elseif ( source == "Unknown") then source = MTS_RUNKNOWN; 
									elseif ( source == "Quest") then source = MTS_RQUEST; 
									end

								isreagent = {};
								isreagent = ReagentData_GetProfessions(localeRecipes);
									prechar = " -";
								if ( isreagent == nil ) then 
								
								else
									for key, value in isreagent do
									prechar = "+";
									end
								end
								textleft = MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_RECIPE_RECIPE_COLOR .. " ".. prechar .."|r" .. skilllevel_color .. localeRecipes .. "|r";
								textright = MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_RECIPE_SOURCE_COLOR .. source .. "|r ";
								RECURSENAME2 = localeRecipes;
								if (skill ~= nil and skill ~= "") then
									if (skill > MTS_SkillLevel) then
										textright = textright .. MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_RECIPE_SKILL_COLOR_UNLEARNABLE .. "(" ..  skill .. ")|r";
									else
										textright = textright .. MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_RECIPE_SKILL_COLOR_LEARNABLE .. "(" ..  skill .. ")|r";
									end
								else
									if (skill == nil or skill == "") then
										skill = "?";
									end
									textright = textright .. MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_RECIPE_SKILL_COLOR_LEARNABLE .. "(" ..  skill .. ")|r";
								end	
								count[value] = count[value] + 1;
								-- If this is the first time a recipe is being added, add a explanation line
								if (count[value] == 1) then 
									if ( MTS_ShowTooltip == true and MTS_RECURSE == false ) then
										frame:AddDoubleLine(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_RECIPE_MAIN_COLOR .. MTS_RECIPES .. "|r", MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_RECIPE_MAIN_COLOR .. value .. " (" .. MTS_SkillLevel .. ")|r");
									end
									MTS_RecipeList:AddMessage(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_RECIPE_MAIN_COLOR .. MTS_RECIPES .. "|r" .. "    ".. MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_RECIPE_MAIN_COLOR .. value .. " (" .. MTS_SkillLevel .. ")|r");
								end
								if (AltKnownBy ~= "" and MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_ALTNAME == 1 ) then 
								   textright =  AltKnownBy;			
								end
								-- Add the tooltip
								--frame:AddDoubleLine(textleft, textright);
								MTS_TOOLTIP_SKILLEVEL = 0;
								for i=1,5 do
									if(skilllevel_color== MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_TRADESKILL_SKILLLEVEL_COLOR[i]) then
										MTS_TOOLTIP_SKILLEVEL = i;
										if ( MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_UNKNOWNTOBOTTOM == 1 ) then 
											if (MTS_TOOLTIP_SKILLEVEL == 5) then MTS_TOOLTIP_SKILLEVEL = 0; end
										end
									end
								end
							if (MTS_ShowTooltip == true) then
								totalcount = totalcount+1
								table.insert(MTS_TOOLTIP_DB, {skilllvl=MTS_TOOLTIP_SKILLEVEL,{name=Recipes, textl=textleft, textr=textright}});
							end
								table.insert(MTS_LIST_DB, {skilllvl=MTS_TOOLTIP_SKILLEVEL,{name=Recipes, textl=textleft, textr=textright}});
								
						end
					end
				end
				table.sort(MTS_TOOLTIP_DB, MTS_CompareSkilllvl);
				for i=1, table.getn(MTS_TOOLTIP_DB) do
					-- TODO: Alas, this extra sort doesn't work
					--table.sort(MTS_TOOLTIP_DB[i], MTS_CompareName);
					if (MTS_RECURSE == false) then 
						for j=1, table.getn(MTS_TOOLTIP_DB[i]) do
							frame:AddDoubleLine(MTS_TOOLTIP_DB[i][j].textl, MTS_TOOLTIP_DB[i][j].textr);
						end
					end
				end
				MTS_TOOLTIP_DB = {};
				table.sort(MTS_LIST_DB, MTS_CompareSkilllvl);
				for i=1, table.getn(MTS_LIST_DB) do
					-- TODO: Alas, this extra sort doesn't work
					--table.sort(MTS_LIST_DB[i], MTS_CompareName);
					for j=1, table.getn(MTS_LIST_DB[i]) do
							MTS_RecipeList:AddMessage(MTS_LIST_DB[i][j].textl .." - ".. MTS_LIST_DB[i][j].textr);			
								if (MTS_RECURSE == true and strsub(MTS_LIST_DB[i][j].textl,12,12) == "+" ) then
									recus = string.find(MTS_LIST_DB[i][j].textl,"|",25)
									RECURSENAME = strsub(MTS_LIST_DB[i][j].textl,25,recus - 1)
									MasterTradeSkills_CheckRecurse(RECURSENAME);
								end
					end
				end
				MTS_LIST_DB = {};
			end
		end
	end
	local RepList = MTS_RecipeList:GetNumMessages()
	if ( RepList < 35 ) then 
		for i = RepList, 35 do
			MTS_RecipeList:AddMessage("   ");
		end
	end
	MTS_RecipeList:ScrollToTop(); 
	for i = 1 , 34 do
		MTS_RecipeList:ScrollDown()
	end
	-- Finally, update the frame
	frame:Show();
end

function MTS_Recurse()
name = MTS_RecipeFrameHeaderText:GetText();
MTS_RECURSE = true;
MasterTradeSkills_CheckTooltipInfo(GameTooltip, name);
MTS_RECURSE = false;
end

function MasterTradeSkills_CheckRecurse(name)
	local recurseprofessions = ReagentData_GetProfessions(name);
		local recurseRecipes = "";
		local recurseReagents = "";
		local AltKnownBy = "";
		if ( recurseprofessions == nil ) then return; end  
		-- Loop through the professions and recipes
		for key, value in recurseprofessions do

			RECURSEMTS_IS_TRADESKILL = MasterTradeSkill_IsTradeSkill(value);

				if (RECURSEMTS_IS_TRADESKILL ~= 0) then
				 local MTS_RecurseTradeSkill = MTS_TRADESKILLS_NAME[RECURSEMTS_IS_TRADESKILL];

				for recurseRecipes in ReagentData['crafted'][MTS_RecurseTradeSkill] do
					for recurseReagents in ReagentData['crafted'][MTS_RecurseTradeSkill][recurseRecipes]['reagents'] do
						if (key ==1) then 
								table.sort(ReagentData['crafted'][MTS_RecurseTradeSkill][recurseRecipes]['reagents'],  MTS_CompareSkilllvl);
						end
						if (name == recurseReagents) then
						skill = ReagentData['crafted'][MTS_RecurseTradeSkill][recurseRecipes]['skill'];
						source = ReagentData['crafted'][MTS_RecurseTradeSkill][recurseRecipes]['source'];
						
							-- Look if the skill is know, and what color it is
							skilllevel_color = "|cffff0000";
							local AltKnown = 0;
							local AltKnownBy = "";
							local localeRecipes = MTS_RECIPENAME[recurseRecipes];
								if (localeRecipes == nil) then 
									localeRecipes = recurseRecipes
									MasterTradeSkills_Write(MTS_UNKNOWN..recurseRecipes);
								end
							-- First check if the data is read
							if (MTS_DATA[value] ~= nil) then
								-- Second check if the recipe is in the MTS database
								if (MTS_DATA[value][localeRecipes] ~= nil) then
									-- Third look if it has been learnt by someone
									if (MTS_DATA[value][localeRecipes].LearntBy ~= nil) then
										-- Fourth check if the current user has learnt it
										AltKnown = 1;
										if (MTS_DATA[value][localeRecipes].LearntBy[MTS_CHAR_INDEX] ~= nil) then
											for i=1,4 do
												if (MTS_DATA[value][localeRecipes].LearntBy[MTS_CHAR_INDEX] == MTS_TRADESKILL_SKILLLEVEL[i]) then
													skilllevel_color = MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_TRADESKILL_SKILLLEVEL_COLOR[i];
													AltKnown = 0
												end
											end
										else 
										local nb_chars = table.getn( MTS_DATA.Characters );
											for i=1, nb_chars do
												if (MTS_DATA[value][localeRecipes].LearntBy[i] ~= nil ) then 
														for q=1,4 do
															if (MTS_DATA[value][localeRecipes].LearntBy[i] == MTS_TRADESKILL_SKILLLEVEL[q]) then
																Altskilllevel_color = MTS_DATA.Characters[i].Options.MTS_TRADESKILL_SKILLLEVEL_COLOR[q];
															end
														end
													if ( MTS_DATA.Characters[i].Realm == MTS_DATA.Characters[MTS_CHAR_INDEX].Realm and MTS_DATA.Characters[i].Faction == MTS_DATA.Characters[MTS_CHAR_INDEX].Faction) then 
													AltKnownBy = AltKnownBy .."  |r" .. Altskilllevel_color .. "[".. MTS_DATA.Characters[i].Name .."]|r";
													end
												end
											end
										end
									end
								end
							end
							isreagent = {};
								isreagent = ReagentData_GetProfessions(recurseRecipes);
									prechar = " -";
								if ( isreagent == nil ) then 
								
								else
									for key, value in isreagent do
									prechar = "+";
									end
								end
							textr = MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_RECIPE_SOURCE_COLOR .. value.." ("..skill..")";
								if (AltKnownBy ~= "" and MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_ALTNAME == 1 ) then 
								   textr =  AltKnownBy;			
								end
							MTS_RecipeList:AddMessage(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_RECIPE_RECIPE_COLOR .."    "..prechar.."|r"..skilllevel_color..localeRecipes.."   " .. textr .."|r");
						end
					end
				end
			end
		end

end


function MTS_CompareSkilllvl(a,b)
	if ( MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWREV ) then 
		return a.skilllvl > b.skilllvl;
	else 
		return a.skilllvl < b.skilllvl;
	end
end

function MTS_CompareName(a,b)
	return string.lower(a.name) < string.lower(b.name);
end

function MasterTradeSkills_OnShow()
	if (MTS_PLAYER_NAME_KNOWN and MTS_VARIABLES_LOADED and MTS_DATA_CHECKED and MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_STATE == 1) then
		-- show info in tooltip
		if ( MouseIsOver(MinimapCluster) == 1 and MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_MOUSEOVER == 1 ) then 
			GameTooltip:Show();
		else
			local lbl = getglobal("GameTooltipTextLeft1");
			if lbl  then
				local name = lbl:GetText();
				name = string.gsub(name, "Vein","Ore");
				name = string.gsub(name, "Deposit","Ore");
				if ( strfind(name,"Ore") ~= nil ) then 
					name = string.gsub(name, "Rich ","");
					name = string.gsub(name, "Small ","");
					name = string.gsub(name, "Ooze Covered ","");
				end
				MasterTradeSkills_CheckTooltipInfo(GameTooltip, name);
			end
		end
	else		
		GameTooltip:Show();
	end
end

function MasterTradeSkills_Write(chat_text)
	DEFAULT_CHAT_FRAME:AddMessage(chat_text, 0.0, 1.0, 0.0);	
end

function MasterTradeSkills_ReadRecipes()
	local tradeskill, trade_rank = GetTradeSkillLine();
	if (MasterTradeSkill_IsTradeSkill(tradeskill)) then
		for i=1, GetNumTradeSkills() do
			local crafted_object, skill_type = GetTradeSkillInfo(i);
			if (MTS_DATA[tradeskill] == nil) then
				MTS_DATA[tradeskill] = {};
			end
			if crafted_object and skill_type then
				if (MTS_DATA[tradeskill][crafted_object] == nil) then
					MTS_DATA[tradeskill][crafted_object] = {};
					MTS_DATA[tradeskill][crafted_object].LearntBy = {};
					MTS_DATA[tradeskill][crafted_object].LearntBy[MTS_CHAR_INDEX] = skill_type;
				else
					--MTS_Write(crafted_object .. " - " .. skill_type);
					MTS_DATA[tradeskill][crafted_object].LearntBy[MTS_CHAR_INDEX] = skill_type;
				end
			end
		end
	end
end

function MasterTradeSkills_ReadCrafts()
	local tradeskill, trade_rank = GetCraftDisplaySkillLine();
	if (tradeskill and MasterTradeSkill_IsTradeSkill(tradeskill)) then
		for i=1, GetNumCrafts() do
			local crafted_object, craftSubSpellName, skill_type = GetCraftInfo(i);

			if (MTS_DATA[tradeskill] == nil) then
				MTS_DATA[tradeskill] = {};
			end
			if (MTS_DATA[tradeskill][crafted_object] == nil) then
				MTS_DATA[tradeskill][crafted_object] = {};
				MTS_DATA[tradeskill][crafted_object].LearntBy = {};
				MTS_DATA[tradeskill][crafted_object].LearntBy[MTS_CHAR_INDEX] = skill_type;
			else
				--MTS_Write(crafted_object .. " - " .. skill_type);
				MTS_DATA[tradeskill][crafted_object].LearntBy[MTS_CHAR_INDEX] = skill_type;
			end
		end
	end
end


function MasterTradeSkills_GetSkillLevel(skill)
	local tradeSkillsNum = GetNumSkillLines();
	local MTS_GetSkillLevel = 0;

	for i=1,tradeSkillsNum do
		local skillName, header, isExpanded, skillRank, numTempPoints, skillModifier, skillMaxRank, isAbandonable, stepCost, rankCost, minLevel, skillCostType, skillDescription = GetSkillLineInfo(i);
		if (skillName == skill) then
			MTS_GetSkillLevel = skillRank;
		end
	end

	return MTS_GetSkillLevel;
end

function MasterTradeSkill_IsTradeSkill(skill)
	local MTS_IsTradeSkill = 0;
	local MTS_Max = table.getn(MTS_TRADESKILLS);
	for i=1, MTS_Max do
		if (skill == MTS_TRADESKILLS[i]) then
			MTS_IsTradeSkill = i;
		end
	end
	return MTS_IsTradeSkill
end

function MTS_Options_Toggle()
	if (MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_STATE == 1) then
		MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_STATE = 0;
	else 
		MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_STATE = 1;
	end
	MTS_OptionsFrameCheck_Enabled:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_STATE);
end

function MTS_Options_ToggleShowLearned()
	if (MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWLEARNED == 1) then
		MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWLEARNED = 0;
	else
		MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWLEARNED = 1;	
	end
	MTS_OptionsFrameCheck_ShowLearned:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWLEARNED);
end

function MTS_Options_ToggleShowNotLearned()
	if (MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWNOTLEARNED == 1) then
		MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWNOTLEARNED = 0;
	else
		MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWNOTLEARNED = 1;	
	end
	MTS_OptionsFrameCheck_ShowNotLearned:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOWNOTLEARNED);
end

function MTS_Options_ToggleUnknown()
	if (MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_UNKNOWNTOBOTTOM == 1) then
		MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_UNKNOWNTOBOTTOM = 0;
	else
		MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_UNKNOWNTOBOTTOM = 1;	
	end
	MTS_OptionsFrameCheck_UnknownToBot:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_UNKNOWNTOBOTTOM);
end

function MTS_Options_ToggleAltName()
	if (MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_ALTNAME == 1) then
		MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_ALTNAME = 0;
	else
		MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_ALTNAME = 1;	
	end
	MTS_OptionsFrameCheck_AltName:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_ALTNAME);
end

function MTS_Options_ToggleMinimap()
	if (MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_MOUSEOVER == 1) then
		MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_MOUSEOVER = 0;
	else
		MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_MOUSEOVER = 1;	
	end
	MTS_OptionsFrameCheck_NoMinimap:SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_MOUSEOVER);
end

function MTS_Options_ToggleShowTradeSkills(arg1, arg2)
	if (MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOW_TRADESKILLS[arg2] == 1) then
		MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOW_TRADESKILLS[arg2] = 0;
		--MasterTradeSkills_Write(arg1 .. " = 0");
	else
		MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOW_TRADESKILLS[arg2] = 1;
		--MasterTradeSkills_Write(arg1 .. " = 1");
	end
	getglobal("MTS_OptionsFrameCheck_ShowTradeSkills" .. arg2):SetChecked(MTS_DATA.Characters[MTS_CHAR_INDEX].Options.MTS_SHOW_TRADESKILLS[arg2]);
end

function MTS_SetItemRef(arg1,arg2,arg3)
	if ( strsub(arg1, 1, 4) == "item" ) then
		ShowUIPanel(ItemRefTooltip);
		if ( not ItemRefTooltip:IsVisible() ) then
			ItemRefTooltip:SetOwner(UIParent, "ANCHOR_PRESERVE");
		end
		ItemRefTooltip:SetHyperlink(arg1);
		if ( HealPoints ) then		
			HealPoints:DrawTooltip(ItemRefTooltip, arg1);
		end
		local name, ilink, quality = GetItemInfo( arg1 );
		MasterTradeSkills_CheckTooltipInfo(ItemRefTooltip, name);
	else
		return MTS_Original_SetItemRef(arg1,arg2,arg3);
	end
end

function MasterTradeSkills_AddStuff(frame,link)
	local name, ilink, quality = GetItemInfo( link );
	MasterTradeSkills_CheckTooltipInfo(frame, name);
	return ;
end

