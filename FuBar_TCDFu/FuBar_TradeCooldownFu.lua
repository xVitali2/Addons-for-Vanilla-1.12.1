local dewdrop = AceLibrary("Dewdrop-2.0")
local tablet = AceLibrary("Tablet-2.0")
local L = AceLibrary("AceLocale-2.0"):new("TradeCooldownFu")

TradeCooldownFu = AceLibrary("AceAddon-2.0"):new("FuBarPlugin-2.0", "AceEvent-2.0", "AceConsole-2.0", "AceDB-2.0")
TradeCooldownFu.hasIcon = "Interface\\Icons\\Spell_Nature_TimeStop.blp"				-- techys, 아이콘추가

local optionsTable = {
	type = 'group',
	args = {
		notify = {
			order = 1,
			type = 'toggle',
			name = L["NOTIFY_LABEL"],
			desc = L["NOTIFY_LABEL"],
			set = "ToggleNotify",
			get = "IsNotify",
		},
		clearLabel = {
			order = 2,
			type = "execute",
			name = L["CLEAR_LABEL"],
			desc = L["CLEAR_LABEL"],
			func = "ClearConfirm",
		},
		hideLabel = {
			order = 3,
			type = 'toggle',
			name = L["HIDE_LABEL"],
			desc = L["HIDE_LABEL"],
			set = "ToggleHideLabel",
			get = "IsHideLabel",
		},
		manualCD = {
			type = 'group', 
			name = L["MENU_SHOW_TEXT1"],
			desc = L["MENU_SHOW_TEXT1"],
			args = {
				manualDRS = {
					type = "execute",
					name = L["MENU_SHOW_TEXT_MANUALDEEPROCK"],
					desc = L["MENU_SHOW_TEXT_MANUALDEEPROCK"],
					func = "ManualDeeprockSalt",
				},
				manualSB = {
					type = "execute",
					name = L["MENU_SHOW_TEXT_MANUALSNOWBALL"],
					desc = L["MENU_SHOW_TEXT_MANUALSNOWBALL"],
					func = "ManualSnowball",
				},
			}
		}
	}
}

TradeCooldownFu.OnMenuRequest = optionsTable
TradeCooldownFu:RegisterChatCommand( { "/tradecooldownfu" }, optionsTable )

TradeCooldownFu:RegisterDB("FuBar_TradeCooldownDB")
TradeCooldownFu:RegisterDefaults('profile', {
	notify = true,
	hideLabel = true,
})

function TradeCooldownFu:IsHideLabel()
	return self.db.profile.hideLabel;
end
	
function TradeCooldownFu:IsNotify()
	return self.db.profile.notify;
end
	
function TradeCooldownFu:ClearConfirm()
	StaticPopupDialogs["FUBARTRADECOOLDOWN_CLEAR"] = {
		text = TEXT(TRADECOOLDOWNFU_CONFIRM),
		button1 = TEXT(OKAY),
		button2 = TEXT(CANCEL),
		OnAccept = function()
			self:ClearData();
		end,
		timeout = 0,
		exclusive = 1
	};
	StaticPopup_Show("FUBARTRADECOOLDOWN_CLEAR");
end
	
	
function TradeCooldownFu:ToggleHideLabel()
	self.db.profile.hideLabel = not self.db.profile.hideLabel;
	self:Update();
end
	
function TradeCooldownFu:ToggleNotify()
	self.db.profile.notify = not self.db.profile.notify;		
end
	
function TradeCooldownFu:ManualDeeprockSalt()
	local skillName = TRADECOOLDOWNFU_SALTSHAKER;
   if ( FTC_Save[FTC_SaveKey] == nil ) then
   	FTC_Save[FTC_SaveKey] = {};
   end
   if ( FTC_Save[FTC_SaveKey][skillName] == nil ) then
   	FTC_Save[FTC_SaveKey][skillName] = {};
   end
   FTC_Save[FTC_SaveKey][skillName].Cooldown = 259200;
   FTC_Save[FTC_SaveKey][skillName].LastCheck = time();
   FTC_Save[FTC_SaveKey][skillName].IsReady = 0;     
end
	
function TradeCooldownFu:ManualSnowball()
	local skillName = TRADECOOLDOWNFU_SNOWMASTER;
   if ( FTC_Save[FTC_SaveKey] == nil ) then
   	FTC_Save[FTC_SaveKey] = {};
   end
   if ( FTC_Save[FTC_SaveKey][skillName] == nil ) then
   	FTC_Save[FTC_SaveKey][skillName] = {};
   end
   FTC_Save[FTC_SaveKey][skillName].Cooldown = 86400;
   FTC_Save[FTC_SaveKey][skillName].LastCheck = time();
   FTC_Save[FTC_SaveKey][skillName].IsReady = 0;     	
end

function TradeCooldownFu:OnUpdate(difference)
	DEFAULT_CHAT_FRAME:AddMessage("TCDFUpdate"); 
	if( self:IsNotify() ) then
		for k, v in FTC_Save do
			for skillName, skillTable in v do
				local remaining = ((skillTable.Cooldown + skillTable.LastCheck) - time());
				if (remaining <= TRADECOOLDOWNFU_NOTIFYTIME) then
					if (FTC_Save[k][skillName].IsReady ~= 1) then
        					local _, _, realm, player = string.find(k, "^(.+)\|(.+)$");
        					if (remaining <= 0) then
							DEFAULT_CHAT_FRAME:AddMessage(format(TRADECOOLDOWNFU_READYNOTIFY0, skillName, realm, player)); 
						else
							DEFAULT_CHAT_FRAME:AddMessage(format(TRADECOOLDOWNFU_READYNOTIFY1, skillName, realm, player, floor(remaining+0.9))); 
						end
						PlaySound("AuctionWindowOpen");
						FTC_Save[k][skillName].IsReady = 1;
						self:Update();
					end
				end
			end
		end		
	end
end

function TradeCooldownFu:TRADE_SKILL_UPDATE()
	-- This is when the FTC_Save table is populated
	local numSkills = GetNumTradeSkills();
	for i=1, numSkills do
		local skillName = GetTradeSkillInfo(i);
		local cooldown = GetTradeSkillCooldown(i);

		-- Condense all transmute entries into one, since they share a cooldown
		if ( string.find(skillName, TRADECOOLDOWNFU_TRANSMUTE_MATCH) ) then
			skillName = TRADECOOLDOWNFU_TRANSMUTES;
		end

		if ( skillName == TRADECOOLDOWNFU_TRANSMUTES or skillName == TRADECOOLDOWNFU_MOONCLOTH ) then

			if ( cooldown == nil ) then
				cooldown = 0;
			end

		  if ( FTC_Save[FTC_SaveKey] == nil ) then
    		FTC_Save[FTC_SaveKey] = {};
	    end
      if ( FTC_Save[FTC_SaveKey][skillName] == nil ) then
				FTC_Save[FTC_SaveKey][skillName] = {};
	    end

    	FTC_Save[FTC_SaveKey][skillName].Cooldown = cooldown;
    	FTC_Save[FTC_SaveKey][skillName].LastCheck = time();
    	FTC_Save[FTC_SaveKey][skillName].IsReady = 0; 
  	end
	end
	self:Update();
end

function TradeCooldownFu:CHAT_MSG_LOOT()	
	if ( string.find(arg1, TRADECOOLDOWNFU_ELUNESTONE) ) then
  	local skillName = TRADECOOLDOWNFU_ELUNESLANTERN;
  	if ( FTC_Save[FTC_SaveKey] == nil ) then
    	FTC_Save[FTC_SaveKey] = {};
    end
    if ( FTC_Save[FTC_SaveKey][skillName] == nil ) then
    	FTC_Save[FTC_SaveKey][skillName] = {};
    end
    FTC_Save[FTC_SaveKey][skillName].Cooldown = 86400;
    FTC_Save[FTC_SaveKey][skillName].LastCheck = time();
    FTC_Save[FTC_SaveKey][skillName].IsReady = 0;
  end
	local _, _, created = string.find(arg1, TRADECOOLDOWNFU_CREATESEARCH);
	if (created) then
		--DEFAULT_CHAT_FRAME:AddMessage("Test "..created); 
	else
		--DEFAULT_CHAT_FRAME:AddMessage("Test None"); 
	end
  if ( created and string.find(created, TRADECOOLDOWNFU_SNOWBALL) ) then
  	--DEFAULT_CHAT_FRAME:AddMessage("Test Snow"..created); 
  	local skillName = TRADECOOLDOWNFU_SNOWMASTER;
    if ( FTC_Save[FTC_SaveKey] == nil ) then
    	FTC_Save[FTC_SaveKey] = {};
    end
    if ( FTC_Save[FTC_SaveKey][skillName] == nil ) then
    	FTC_Save[FTC_SaveKey][skillName] = {};
    end
    FTC_Save[FTC_SaveKey][skillName].Cooldown = 86400;
    FTC_Save[FTC_SaveKey][skillName].LastCheck = time();
    FTC_Save[FTC_SaveKey][skillName].IsReady = 0;
  elseif ( created and string.find(created, TRADECOOLDOWNFU_REFINEDSALT) ) then
  	--DEFAULT_CHAT_FRAME:AddMessage("Test SS"..created); 
		local skillName = TRADECOOLDOWNFU_SALTSHAKER;
    if ( FTC_Save[FTC_SaveKey] == nil ) then
    	FTC_Save[FTC_SaveKey] = {};
    end
    if ( FTC_Save[FTC_SaveKey][skillName] == nil ) then
    	FTC_Save[FTC_SaveKey][skillName] = {};
    end
    FTC_Save[FTC_SaveKey][skillName].Cooldown = 259200;
    FTC_Save[FTC_SaveKey][skillName].LastCheck = time();
    FTC_Save[FTC_SaveKey][skillName].IsReady = 0; 
  end
  self:Update();
end

function TradeCooldownFu:OnInitialize()
	--metro:Register(self.name, self.OnUpdate, TradeCooldownFuLocals.FREQUENCY, self)
	--metro:Start(self.name)

  -- Events
  self:RegisterEvent("TRADE_SKILL_UPDATE");
  --self:RegisterEvent("CHAT_MSG_SPELL_TRADESKILLS");
  --self:RegisterEvent("CHAT_MSG_SAY"); -- for debug purpose
  --self:RegisterEvent("CHAT_MSG_CHANNEL"); -- for debug purpose
  self:RegisterEvent("CHAT_MSG_LOOT");
  
  -- Variables
  FTC_SaveKey = GetCVar("realmName") .. "|" .. UnitName("player");	
  
	self.vars = {
	}
    
  --DEFAULT_CHAT_FRAME:AddMessage(TradeCooldownFuLocals.NAME..": Running");	
end

function TradeCooldownFu:Disable()
	--metro:Unregister(self.name);
end

function TradeCooldownFu:OnTextUpdate()
	local retval = "";

  local totalCount = 0;
  local readyCount = 0;

    -- Increment the total number of cooldowns, and the number of "Ready" cooldowns
  for k, v in FTC_Save do
  	for skillName, skillTable in v do
	    local remaining = ((skillTable.Cooldown + skillTable.LastCheck) - time());

  	  totalCount = totalCount + 1;

	    if ( remaining <= 0 ) then
  	  	readyCount = readyCount + 1;
    	end
  	end
  end

  -- Color the counts for the label text
  local colorCode = TRADECOOLDOWNFU_READY_COLOR;
  if ( readyCount == 0 ) then
  	colorCode = TRADECOOLDOWNFU_NOTREADY_COLOR;
  end

  retval = format(colorCode .. TRADECOOLDOWNFU_FORMAT .. FONT_COLOR_CODE_CLOSE, readyCount, totalCount);

	if (not self:IsHideLabel()) then
		retval = TRADECOOLDOWNFU_BUTTON_LABEL..retval;
	end
    
  self:SetText(retval);
end

function TradeCooldownFu:OnTooltipUpdate()

	local cat = tablet:AddCategory(
		'columns', 2,
		'child_textR', 1,
		'child_textG', 1,
		'child_textB', 0
	)
	
	cat:AddLine(
		'text', ""
	)


  for k, v in FTC_Save do
		local _, _, realm, player = string.find(k, "^(.+)\|(.+)$");
		local retval = realm .. ": " .. player .. "\n";

		--local r, g, b = FuBarUtils.GetThresholdColor(AggroVars.tempTargets[i][1] / 60);
		cat:AddLine(
			'text', retval
		)	

    for skillName, skillTable in v do
    	local remaining = ((skillTable.Cooldown + skillTable.LastCheck) - time());
    	
    	local v1 = "     "..skillName..":";
    	local v2 = "";

      if ( remaining <= 0 ) then
      	v2 = TRADECOOLDOWNFU_READY_COLOR .. TRADECOOLDOWNFU_READY;
      else
      	local timeTable = self:RemainingTime(remaining);
        local timeString = string.format("%dd %dh %dm %ds", timeTable.d, timeTable.h, timeTable.m, timeTable.s);
        if ( (timeTable.d == 0) and (timeTable.h == 0) ) then
        	v2 = TRADECOOLDOWNFU_ALMOSTREADY_COLOR .. timeString;
        else
        	v2 = TRADECOOLDOWNFU_NOTREADY_COLOR .. timeString;
        end
      end
      
			--local r, g, b = FuBarUtils.GetThresholdColor(AggroVars.tempTargets[i][1] / 60);
			cat:AddLine(
				'text', v1,
				'text2', v2
			)	
      
    end
  end 
end

function TradeCooldownFu:OnClick()
--	if ((IsAltKeyDown() or IsControlKeyDown()) and AggroVars.LastSavedTarget) then
	--	TargetByName(AggroVars.LastSavedTarget);
--	elseif UnitName("targettarget") then
	--	if ( CursorHasItem() ) then
		--	DropItemOnUnit("targettarget");
--		else
	---		AggroVars.LastSavedTarget = UnitName("target");
			--TargetUnit("targettarget");
--		end
	--end
end

function TradeCooldownFu:RemainingTime(timestamp)

    local retval = {};
    retval.d = 0;
    retval.h = 0;
    retval.m = 0;
    retval.s = 0;

    -- 1 day: 86,400 seconds
    if ( timestamp >= 86400 ) then
        retval.d = floor(timestamp / 86400);

        timestamp = (timestamp - (retval.d * 86400));
    end
        
    -- 1 hour: 3,600 seconds
    if ( timestamp >= 3600 ) then
        retval.h = floor(timestamp / 3600);

        timestamp = (timestamp - (retval.h * 3600));
    end

    -- 1 minute: 60 seconds
    if ( timestamp >= 60 ) then
        retval.m = floor(timestamp / 60);

        timestamp = (timestamp - (retval.m * 60));
    end

    retval.s = timestamp;

    return retval;
end

function TradeCooldownFu:ClearData()
	FTC_Save = {};
	self:Update();
end