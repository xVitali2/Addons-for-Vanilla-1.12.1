-------------------------------------------------------------------------------
-- SmartBuff
-- Created by Aeldra (EU-Proudmoore)
--
-- Cast the most important buffs on you or party/raid members/pets.
-------------------------------------------------------------------------------

SMARTBUFF_VERSION       = "V1.12a";
SMARTBUFF_TITLE         = "SmartBuff";
SMARTBUFF_SUBTITLE      = "Supports you in cast buffs";
SMARTBUFF_DESC          = "Cast the most important buffs on you or party/raid members/pets";
SMARTBUFF_VERS_TITLE    = SMARTBUFF_TITLE .. " " .. SMARTBUFF_VERSION;
SMARTBUFF_OPTIONS_TITLE = SMARTBUFF_VERS_TITLE .. " Options";

-- Titan Variables
TITAN_SMARTBUFF_ID =  SMARTBUFF_TITLE;
TITAN_SMARTBUFF_MENU_TEXT = SMARTBUFF_TITLE;
TITAN_SMARTBUFF_BUTTON_LABEL = SMARTBUFF_TITLE;
TITAN_SMARTBUFF_TOOLTIP = SMARTBUFF_VERS_TITLE;
TITAN_SMARTBUFF_ICON_ON = "Interface\\AddOns\\SmartBuff\\Icons\\MiniMapButtonEnabled";
TITAN_SMARTBUFF_ICON_OFF = "Interface\\AddOns\\SmartBuff\\Icons\\MiniMapButtonDisabled";
TITAN_SMARTBUFF_ENABLE = "Enable SmartBuff";
TITAN_SMARTBUFF_BUTTONSHOW = "Show UI Button";
TITAN_SMARTBUFF_BUTTONRESET = "Reset UI Button";
TITAN_SMARTBUFF_TOOLTIP_CONTENTS = "";

BINDING_HEADER_SMARTBUFF = "SmartBuff";
SMARTBUFF_BOOK_TYPE_SPELL = "spell";

local GlobalCd = 1.5;
local maxSkipCoolDown = 3;
local maxRaid = 40;
local maxBuffs = 32;
local maxCheckButtons = 28;
local numBuffs = 0;


local isLoaded = false;
local isPlayer = false;
local isInit = false;
local isCombat = false;
local isChecking = false;
local isSetBuffs = false;
local isSetZone = false;
local isFirstError = false;
local isMounted = false;

local isShapeshifted = false;
local sShapename = "";

local tStart = 0;

local sRealmName = nil;
local sPlayerName = nil;
local sID = nil;
local sPlayerClass = nil;
local iLastSubgroup = 0;
local tLastCheck = 0;
local iGroupSetup = -1;
local cPatterns = nil;
local iLastBuffSetup = -1;
local iLastGroupSetup = -99;
local sLastInstance = "";
local tAutoBuff = 0;
local sMsgWarning = "";
local iCurrentFont = 1;

local cGroups = { };
local cBuffs = { };
local cBuffTimer = { };
local cBlacklist = { };

local cClasses = {"DRUID", "HUNTER", "MAGE", "PALADIN", "PRIEST", "ROGUE", "SHAMAN", "WARLOCK", "WARRIOR", "HPET", "WPET"};
local cFonts = {"NumberFontNormalHuge", "NumberFontNormalLarge", "GameFontNormalLarge", "GameFontNormal", "GameFontHighlightLarge", "GameFontHighlight", "SystemFont"};

local currentUnit = nil;
local currentSpell = nil;
local currentTemplate = nil;

local imgIconOn  = "Interface\\AddOns\\SmartBuff\\Icons\\MiniMapButtonEnabled";
local imgIconOff = "Interface\\AddOns\\SmartBuff\\Icons\\MiniMapButtonDisabled";

local DebugChatFrame = DEFAULT_CHAT_FRAME;

local SMARTBUFF_ZMIx;
local SMARTBUFF_ZMOx;


--Returns a chat color code string
local function BCC(r, g, b)
	return string.format("|cff%02x%02x%02x", (r*255), (g*255), (b*255));
end

local BL  = BCC(0, 0, 1);
local BLD = BCC(0, 0, 0.7);
local BLL = BCC(0.5, 0.8, 1);
local GR  = BCC(0, 1, 0);
local GRD = BCC(0, 0.7, 0);
local GRL = BCC(0.6, 1, 0.6);
local RD  = BCC(1, 0, 0);
local RDD = BCC(0.7, 0, 0);
local RDL = BCC(1, 0.3, 0.3);
local YL  = BCC(1, 1, 0);
local YLD = BCC(0.7, 0.7, 0);
local YLL = BCC(1, 1, 0.5);
local OR  = BCC(1, 0.7, 0);
local ORD = BCC(0.7, 0.5, 0);
local ORL = BCC(1, 0.6, 0.3);
local WH  = BCC(1, 1, 1);
local CY  = BCC(0.5, 1, 1);


-- SMARTBUFF_OnLoad
function SMARTBUFF_OnLoad()
	-- Class-based setup
	_, sPlayerClass = UnitClass("player");
	
	this:RegisterEvent("VARIABLES_LOADED");
  this:RegisterEvent("PLAYER_ENTERING_WORLD");
  this:RegisterEvent("UNIT_NAME_UPDATE");
  
  this:RegisterEvent("PARTY_MEMBERS_CHANGED");
  this:RegisterEvent("RAID_ROSTER_UPDATE");
  this:RegisterEvent("PLAYER_REGEN_ENABLED");
	this:RegisterEvent("PLAYER_REGEN_DISABLED");
	this:RegisterEvent("PLAYER_TARGET_CHANGED");
	
	this:RegisterEvent("LEARNED_SPELL_IN_TAB");
	this:RegisterEvent("ACTIONBAR_HIDEGRID");
	
  this:RegisterEvent("PLAYER_AURAS_CHANGED");
  this:RegisterEvent("CHAT_MSG_ADDON");
  --this:RegisterEvent("UPDATE_MOUSEOVER_UNIT");
	--this:RegisterEvent("CHAT_MSG_CHANNEL");
	--this:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE");
	--this:RegisterEvent("ACTIONBAR_UPDATE_STATE");
    
  this:RegisterEvent("CHAT_MSG_SPELL_FAILED_LOCALPLAYER");
  --this:RegisterEvent("UI_ERROR_MESSAGE");
  this:RegisterEvent("SPELLCAST_STOP");
  
  --One of them allows SmartBuff to be closed with the Escape key
  tinsert(UISpecialFrames, "SmartBuffOptionsFrame");
	UIPanelWindows["SmartBuffOptionsFrame"] = nil;
		
	SlashCmdList["SMARTBUFF"] = SMARTBUFF_command;
	SLASH_SMARTBUFF1 = "/sb";
	SLASH_SMARTBUFF2 = "/smartbuff";

	SlashCmdList["SMARTBUFFMENU"] = SMARTBUFF_OptionsFrame_Toggle;
	SLASH_SMARTBUFFMENU1 = "/sbm";
  
  SMARTBUFF_ZMIx = CameraZoomIn;
  SMARTBUFF_ZMOx = CameraZoomOut;
  CameraZoomIn  = SMARTBUFF_ZMI;
  CameraZoomOut = SMARTBUFF_ZMO;  
	
end
-- END SMARTBUFF_OnLoad


-- SMARTBUFF_OnEvent
function SMARTBUFF_OnEvent(event)
	if ((event == "UNIT_NAME_UPDATE" and arg1 == "player") or event == "PLAYER_ENTERING_WORLD") then
		isPlayer = true;
		if  (event == "PLAYER_ENTERING_WORLD" and isInit and SMARTBUFF_Options.Toggle) then
      isSetZone = true;
		end
  elseif(event == "VARIABLES_LOADED") then
    isLoaded = true;
  end
  
  if (isLoaded and isPlayer and not isInit) then
    if(tStart == 0) then
      tStart = GetTime();
    end
    if (event == "CHAT_MSG_CHANNEL_NOTICE" or GetTime() > (tStart + 2)) then
      SMARTBUFF_Options_Init();
    end
  end
  
  if (not isInit or SMARTBUFF_Options == nil or not SMARTBUFF_Options.Toggle) then
    return;
  end;
  
  if (event == "PLAYER_AURAS_CHANGED" or event == "PLAYER_ENTERING_WORLD") then
    isMounted = SMARTBUFF_IsMounted();
    
  -- **************************************************************************************************************************************
  -- **************************************************************************************************************************************
  elseif (event == "CHAT_MSG_ADDON" and SMARTBUFF_Options.CTRASync) then
    --Fired when the client receives a message from SendAddonMessage 
    --arg1 prefix 
    --arg2 message 
    --arg3 distribution type ("PARTY","RAID","GUILD" or "BATTLEGROUND") 
    --arg4 sender
    
    if (arg1 == "CTRA" and arg3 == "RAID") then
      local msg = arg2;
      local dtype = arg3;
      local sender = arg4;
      --SMARTBUFF_AddMsgD(sender .. ": " .. msg);
      if (string.find(msg, "^RN ") and CT_RAMenu_Options) then
        SMARTBUFF_AddMsgD(sender .. ": " .. msg);

        local bdata = false;
        local unit = nil;
        local subgroup = nil;
        local classeng = nil;
        local uname = nil;
        
        --for n = 1, GetNumRaidMembers(), 1 do
        --  uname, _, subgroup, _, _, classeng, _, _, _ = GetRaidRosterInfo(n);
        --  if (sender == UnitName("raid"..n) and sender == uname) then
        --    unit = "raid"..n;
        --    SMARTBUFF_AddMsgD(sender .. "(" .. unit .. ") data retrived");
        --    bdata = true;
        --    break;
        --  end
        --end
        
        for sg = 1, 8, 1 do
          if (cGroups[sg] ~= nil) then
            for _, un in cGroups[sg] do
              if (un and UnitIsPlayer(un) and UnitName(un) == sender) then
                _, classeng = UnitClass(un);
                subgroup = sg;
                unit = un;
                bdata = true;
                SMARTBUFF_AddMsgD(sender .. "(grp " .. subgroup .. ", " .. unit .. ") data retrived");
                break;                
              end
            end
          end
        end        
        
        if (bdata) then
          if ( string.find(msg, "#") ) then   				
            local arr = CT_RA_Split(msg, "#");
    				for k, v in arr do
              SMARTBUFF_AddMsgD("Split:" .. v);
              msg = v;
              SMARTBUFF_CTRASync(unit, subgroup, classeng, msg);
    				end
          else
            SMARTBUFF_CTRASync(unit, subgroup, classeng, msg);
          end
        end
        
      end
    end
    
  end
  -- **************************************************************************************************************************************
  -- **************************************************************************************************************************************
  
  if (event == "PARTY_MEMBERS_CHANGED" or event == "RAID_ROSTER_UPDATE") then
    SMARTBUFF_SetUnits();
  elseif (event == "PLAYER_REGEN_DISABLED") then
	  --SMARTBUFF_AddMsgD("Enter Combat");
	  SMARTBUFF_Check(1, true);
  elseif (event == "PLAYER_REGEN_ENABLED") then
  	--SMARTBUFF_AddMsgD("Leave Combat");
	  SMARTBUFF_Check(1, true);
	elseif (event == "PLAYER_TARGET_CHANGED") then
	  if (SMARTBUFF_Options.TargetSwitch) then
      if (GetTime() > tAutoBuff + GlobalCd) then
        tAutoBuff = GetTime();
        SMARTBUFF_Check(5);
      end
		end
	elseif (event == "LEARNED_SPELL_IN_TAB" or event == "ACTIONBAR_HIDEGRID") then   
    isSetBuffs = true;
  elseif (event == "CHAT_MSG_SPELL_FAILED_LOCALPLAYER") then    
    if (isChecking and currentUnit ~= nil and (string.find(currentUnit, "party") or string.find(currentUnit, "raid") or (currentUnit == "target" and SMARTBUFF_Options.Debug))) then
      if (UnitName(currentUnit) ~= sPlayerName and SMARTBUFF_Options.BlacklistTimer > 0) then
        cBlacklist[currentUnit] = GetTime();
        SMARTBUFF_AddMsgWarn(UnitName(currentUnit) .. " (" .. currentUnit .. ") blacklisted (" .. SMARTBUFF_Options.BlacklistTimer .. "sec)");
      end
    end   
    isChecking = false;
  elseif (event == "UI_ERROR_MESSAGE") then
    isChecking = false;  
  elseif ((event == "UPDATE_MOUSEOVER_UNIT" or event == "CHAT_MSG_CHANNEL" or event == "PLAYER_AURAS_CHANGED" or event == "ACTIONBAR_UPDATE_STATE") and SMARTBUFF_Options.ToggleAuto) then
    if (SMARTBUFF_Options.AutoSwitchTemplateInst and isSetZone) then
      SMARTBUFF_CheckLocation();
    end
    SMARTBUFF_Check(1);
  elseif (event == "SPELLCAST_STOP") then
    if (isChecking) then
      isChecking = false;
      if (currentUnit and currentSpell and currentUnit ~= "target") then
        local name = UnitName(currentUnit);
        
        if (cBuffTimer[currentUnit] == nil) then
          cBuffTimer[currentUnit] = { };
        end
        --if (not SMARTBUFF_IsPlayer(currentUnit)) then
        cBuffTimer[currentUnit][currentSpell] = GetTime();
        --end
        if (name ~= nil) then SMARTBUFF_AddMsg(name .. ": " .. currentSpell .. " " .. SMARTBUFF_MSG_BUFFED); end
      end
    end
  end

end
-- END SMARTBUFF_OnEvent


function SMARTBUFF_OnUpdate(elapsed)
  if (not isInit) then
    SMARTBUFF_OnEvent("SMARTBUFF_UPDATE");
  else
    SMARTBUFF_Check(1);
  end
end


-- **************************************************************************************************************************************
-- **************************************************************************************************************************************
function SMARTBUFF_CTRASync(unit, subgroup, classeng, msg)
  if (unit == nil or msg == nil) then return; end
  
  local tempOptions = CT_RAMenu_Options["temp"];
  local _, _, val1, val2, val3 = string.find(msg, "^RN ([^%s]+) ([^%s]+) ([^%s]+)$"); -- timeleft(1), id(2), num(3)
  local tleft = tonumber(val1);
  local index = tonumber(val2);
  local num = tonumber(val3);

  local buff;
  for k, v in tempOptions["BuffArray"] do
    if (tonumber(val2) == v["index"]) then
      buff = v;
      break;
    end
  end
  
  if (buff == nil) then return; end
  local bname = buff["name"];
  if (bname == nil) then return; end
  if (type(bname) == "table") then
    if (tonumber(val3)) then
      bname = bname[tonumber(val3)];
    end
  end
  
  if (bname == nil) then return; end

  SMARTBUFF_AddMsgD("Bufftime left (" .. bname .. ") from " .. UnitName(unit) .. " :" .. val1);

  local i = 1;
  local dt = -1;
  while (unit and SMARTBUFF_Options.ToggleGrp[subgroup] and cBuffs[i]) do
    dt = -1;
    if (cBuffs[i].BuffG and cBuffs[i].BuffG == bname) then
      dt = cBuffs[i].DurationG - tleft;
    elseif (cBuffs[i].BuffS and cBuffs[i].BuffS == bname) then
      dt = cBuffs[i].DurationS - tleft;
    end
    
    if (dt > 0) then     
      if (cBuffs[i].BuffG and cBuffs[i].BuffG == bname) then
        if (sPlayerClass == "PALADIN") then
          if (cBuffTimer[classeng] == nil) then
            cBuffTimer[classeng] = { };
          end
          cBuffTimer[classeng][cBuffs[i].BuffG] = GetTime() - dt;
          SMARTBUFF_AddMsgD("Set class " .. classeng .. " timer");
        else
          if (cBuffTimer[subgroup] == nil) then
            cBuffTimer[subgroup] = { };
          end
          cBuffTimer[subgroup][cBuffs[i].BuffG] = GetTime() - dt;
          
          if (cBuffTimer[unit] and cBuffTimer[unit][cBuffs[i].BuffS]) then
            cBuffTimer[unit][cBuffs[i].BuffS] = nil;
          end
          SMARTBUFF_AddMsgD("Set group " .. subgroup .. " timer");
        end
      elseif (cBuffs[i].BuffS and cBuffs[i].BuffS == bname) then
        if (cBuffTimer[unit] == nil) then
          cBuffTimer[unit] = { };
        end
        cBuffTimer[unit][bname] = GetTime() - dt;
        SMARTBUFF_AddMsgD("Set ".. unit .. " timer");
      end		      
      break;
    end
    
    i = i + 1;
  end
end
-- **************************************************************************************************************************************
-- **************************************************************************************************************************************


-- Hook Zoom in and out
function SMARTBUFF_ZMI(arg1)
  if (isInit and SMARTBUFF_Options.Toggle and SMARTBUFF_Options.ScrollWheel) then
    if (GetTime() > tAutoBuff + GlobalCd) then
      tAutoBuff = GetTime();
      SMARTBUFF_Check(5);
    end
  end
  SMARTBUFF_ZMIx(arg1);
end
function SMARTBUFF_ZMO(arg1)
  if (isInit and SMARTBUFF_Options.Toggle and SMARTBUFF_Options.ScrollWheel) then
    if (GetTime() > tAutoBuff + GlobalCd) then
      tAutoBuff = GetTime();
      SMARTBUFF_Check(5);
    end
  end
  SMARTBUFF_ZMOx(arg1);
end
-- END Hooks


-- Will dump the value of msg to the default chat window
function SMARTBUFF_AddMsg(msg, force)
  if (DEFAULT_CHAT_FRAME and (force or not SMARTBUFF_Options.ToggleMsgNormal)) then
    DEFAULT_CHAT_FRAME:AddMessage(YLL .. msg .. "|r");
  end
end

function SMARTBUFF_AddMsgErr(msg, force)
  if (DEFAULT_CHAT_FRAME and (force or not SMARTBUFF_Options.ToggleMsgError)) then
    DEFAULT_CHAT_FRAME:AddMessage(RDL .. SMARTBUFF_TITLE .. ": " .. msg .. "|r");
  end
end

function SMARTBUFF_AddMsgWarn(msg, force)
  if (DEFAULT_CHAT_FRAME and (force or not SMARTBUFF_Options.ToggleMsgWarning)) then
    DEFAULT_CHAT_FRAME:AddMessage(CY .. msg .. "|r");
    --DEFAULT_CHAT_FRAME:AddMessage(CY .. " " .. msg);
    --DEFAULT_CHAT_FRAME:AddMessage(msg, 0.5, 1, 1);
  end
end

function SMARTBUFF_AddMsgD(msg, r, g, b)
  if (r == nil) then r = 0.5; end
  if (g == nil) then g = 0.8; end
  if (b == nil) then b = 1; end
  if (DebugChatFrame and SMARTBUFF_Options.Debug) then
    DebugChatFrame:AddMessage(msg, r, g, b);
  end
end


-- Creates an array of units
function SMARTBUFF_SetUnits()
  --if (not isInit or not SMARTBUFF_Options.Toggle) then return; end
  
  local i = 0;
  local n = 0;
  local j = 0;
  local s = nil;
  local psg = 0;
  local b = false;

-- player
-- pet
-- party1-4
-- partypet1-4
-- raid1-40
-- raidpet1-40
 
  iGroupSetup = -1;
  if (GetNumRaidMembers() ~= 0) then
    iGroupSetup = 3;
	elseif (GetNumPartyMembers() ~= 0) then
	  iGroupSetup = 2;
	else
    iGroupSetup = 1;
  end
  
  if (iGroupSetup ~= iLastGroupSetup) then
    iLastGroupSetup = iGroupSetup;
    cBlacklist = nil;
    cBlacklist = { };
    cBuffTimer = nil
    cBuffTimer = { };
    if (SMARTBUFF_TEMPLATES[iGroupSetup] == nil) then
      SMARTBUFF_SetBuffs();
    end
    local tmp = SMARTBUFF_TEMPLATES[iGroupSetup];
    if (SMARTBUFF_Options.AutoSwitchTemplate and currentTemplate ~= tmp) then
      SMARTBUFF_AddMsg(SMARTBUFF_OFT_AUTOSWITCHTMP .. ": " .. currentTemplate .. " -> " .. tmp); 
      currentTemplate = tmp;
      SMARTBUFF_SetBuffs();
    end
    --SMARTBUFF_AddMsgD("Group type changed");
  end  
  
  cGroups = nil;
  cGroups = { };
  -- Raid Setup  
  if (iGroupSetup == 3) then
    local name, rank, subgroup, level, class, classeng, zone, online, isDead;
	  
	  j = 1;
	  for n = 1, GetNumRaidMembers(), 1 do
		  name, rank, subgroup, level, class, classeng, zone, online, isDead = GetRaidRosterInfo(n);
		  
		  if (name == sPlayerName) then
		    psg = subgroup;
		  end
		    		
  		if (SMARTBUFF_Options.ToggleGrp[subgroup]) then
        --if (psg == subsubgroup) then b = true; end
	      for i = 1, maxRaid, 1 do
	        s = "";
	        if (name == UnitName("raid"..i)) then
	          if (cGroups[subgroup] == nil) then
	            cGroups[subgroup] = { };
	          end
            if (name == sPlayerName) then b = true; end
	          cGroups[subgroup][j] = "raid"..i;
	          if (SMARTBUFF_Options.Debug) then s = "Add raid"..i .. ": " .. name .. "(" .. subgroup .. "/" .. class .. "/" .. classeng .. ")"; end
            j = j + 1;
	          if (classeng == "HUNTER" or classeng == "WARLOCK") then
	            cGroups[subgroup][j] = "raidpet"..i;
              if (SMARTBUFF_Options.Debug) then s = s .. ", add raidpet"..i; end
              j = j + 1;
            end
            --SMARTBUFF_AddMsgD(s, 0, 1, 0.5);
	          break
	        end
	      end --end for
	    end
	  end --end for
    if (not b or SMARTBUFF_Buffs[currentTemplate].SelfFirst) then
      SMARTBUFF_AddSoloSetup();
      iLastSubgroup = psg;
      --SMARTBUFF_AddMsgD("Player not in selected groups or buff self first");
    end

		if (iLastSubgroup ~= psg) then
		  SMARTBUFF_AddMsgWarn(SMARTBUFF_TITLE .. ": " .. SMARTBUFF_MSG_SUBGROUP);
		  if (SMARTBUFF_Options.ToggleSubGrpChanged) then
        SMARTBUFF_Options.ToggleGrp[psg] = true;
		    if (SmartBuffOptionsFrame:IsVisible()) then
		      SMARTBUFF_Options_ReloadSubGroups();
		    else
		      SMARTBUFF_OptionsFrame_Open();
		    end
		  end
		  iLastSubgroup = psg;
		end	  
	  --SMARTBUFF_AddMsgD("Raid Unit-Setup finished");
	
	-- Party Setup
	elseif (iGroupSetup == 2) then
	  if (SMARTBUFF_Buffs[currentTemplate].SelfFirst) then
      SMARTBUFF_AddSoloSetup();
      --SMARTBUFF_AddMsgD("Buff self first");
    end
    
    cGroups[1] = { };
    cGroups[1][0] = "player";
	  if (sPlayerClass == "HUNTER" or sPlayerClass == "WARLOCK") then cGroups[1][9] = "pet"; end
    for j = 1, 4, 1 do
      cGroups[1][j] = "party"..j;
      cGroups[1][j + 4] = "partypet"..j;
      --SMARTBUFF_AddMsgD("Add party"..j, 0, 1, 0.5);
    end
    --SMARTBUFF_AddMsgD("Party Unit-Setup finished");
  
  -- Solo Setup
  else    
    SMARTBUFF_AddSoloSetup();
    --SMARTBUFF_AddMsgD("Solo Unit-Setup finished");
  end
  
end

function SMARTBUFF_AddSoloSetup()
  cGroups[0] = { };
  cGroups[0][0] = "player";
  if (sPlayerClass == "HUNTER" or sPlayerClass == "WARLOCK") then cGroups[0][1] = "pet"; end
end

-- END SMARTBUFF_SetUnits


-- Get Spell ID from spellbook
function SMARTBUFF_GetSpellID(spellname)
	if (spellname) then 
	  spellname = string.lower(spellname);
	else
	  return nil;
	end
	
	local i = 0;
	local id = nil;
	local spellN;
	while true do
	  i = i + 1;
   	spellN = GetSpellName(i, SMARTBUFF_BOOK_TYPE_SPELL);
   	--if (spellN) then SMARTBUFF_AddMsgD(spellN .. " found"); end
   	if (not spellN or string.lower(spellN) == spellname) then
   	  break;
   	end   	
	end
	while (spellN ~= nil) do
	  id = i;
	  i = i + 1;
   	spellN = GetSpellName(i, SMARTBUFF_BOOK_TYPE_SPELL);
   	--if (spellN) then SMARTBUFF_AddMsgD(spellname .. " ID = " .. id); end 	
	  if (not spellN or string.lower(spellN) ~= spellname) then 
		  break;
		end
	end	
	return id;
end
-- END SMARTBUFF_GetSpellID


-- Get the action slot of the spell
function SMARTBUFF_GetActionSlot(spellname, spellicon)
	if (spellname and spellicon) then 
	  spellname = string.lower(spellname);
	else
	  return nil;
	end
	
	local slot = 1;
	local icon = nil;
	local name = nil;
	local text = nil;
	while (slot <= 120) do
	  if (HasAction(slot)) then
	    icon = GetActionTexture(slot);
	    --if (icon and GetActionText(slot) == nil) then
      if (icon) then
        SmartBuffTooltip:SetOwner(SmartBuffFrame, "ANCHOR_NONE");
	    	SmartBuffTooltip:ClearLines();
				SmartBuffTooltip:SetAction(slot);
        name = SmartBuffTooltipTextLeft1:GetText();
        text = SmartBuffTooltipTextLeft4:GetText();
		    if (name ~= nil) then
			    name = string.lower(name);
			    if(name == spellname) then
			      SMARTBUFF_AddMsgD(spellname .. " action slot: " .. slot);
			      return slot, text;
			    end
		    end 
		  end
		end
	  slot = slot + 1;
	end	
	return nil, nil;
end
-- END SMARTBUFF_GetActionSlot


-- Set the buff array
function SMARTBUFF_SetBuffs()
  --if (not SMARTBUFF_Options.Toggle) then return; end
  
  local n = 1;
  local buff = nil; 
  local ct = currentTemplate;
  
  if (SMARTBUFF_Buffs[ct] == nil) then
    SMARTBUFF_Buffs[ct] = { };
    SMARTBUFF_Buffs[ct].SelfFirst = false;
  end
  
  cBuffs = nil; 
  cBuffs = { };
  cPatterns = nil;
  numBuffs = 0;  
  
  if (sPlayerClass == "DRUID") then
    for _, buff in SMARTBUFF_DRUID do
      n = SMARTBUFF_SetBuff(buff, n);
    end
    
  elseif (sPlayerClass == "MAGE") then
    for _, buff in SMARTBUFF_MAGE do
      n = SMARTBUFF_SetBuff(buff, n);
    end    
    cPatterns = SMARTBUFF_MAGE_PATTERN;
    
  elseif (sPlayerClass == "PRIEST") then
    for _, buff in SMARTBUFF_PRIEST do
      n = SMARTBUFF_SetBuff(buff, n);
    end
    
  elseif (sPlayerClass == "WARLOCK") then
    for _, buff in SMARTBUFF_WARLOCK do
      n = SMARTBUFF_SetBuff(buff, n);
    end
    cPatterns = SMARTBUFF_WARLOCK_PATTERN;
    
  elseif (sPlayerClass == "HUNTER") then
    for _, buff in SMARTBUFF_HUNTER do
      n = SMARTBUFF_SetBuff(buff, n);
    end     
    cPatterns = SMARTBUFF_HUNTER_PATTERN;
    
  elseif (sPlayerClass == "SHAMAN") then
    for _, buff in SMARTBUFF_SHAMAN  do
      n = SMARTBUFF_SetBuff(buff, n);
    end
    
  elseif (sPlayerClass == "WARRIOR") then
    for _, buff in SMARTBUFF_WARRIOR  do
      n = SMARTBUFF_SetBuff(buff, n);
    end
        
  elseif (sPlayerClass == "ROGUE") then
    for _, buff in SMARTBUFF_ROGUE  do
      n = SMARTBUFF_SetBuff(buff, n);
    end
    
  elseif (sPlayerClass == "PALADIN") then
    for _, buff in SMARTBUFF_PALADIN  do
      n = SMARTBUFF_SetBuff(buff, n);
    end
    cPatterns = SMARTBUFF_PALADIN_PATTERN;
    
  end

  for _, buff in SMARTBUFF_WEAPON do
    n = SMARTBUFF_SetBuff(buff, n);
  end

  for _, buff in SMARTBUFF_RACIAL do
    n = SMARTBUFF_SetBuff(buff, n);
  end
      
  for _, buff in SMARTBUFF_TRACKING do
    n = SMARTBUFF_SetBuff(buff, n);
  end
  
  numBuffs = n - 1;
  isSetBuffs = false;
end

function SMARTBUFF_SetBuff(buff, i)
  if (buff == nil or i > maxCheckButtons) then return i; end
  
  cBuffs[i] = nil;
  cBuffs[i] = { };
  cBuffs[i].BuffS = buff[1];
  cBuffs[i].DurationS = ceil(buff[2] * 60);
  cBuffs[i].Type = buff[3];
  cBuffs[i].CanCharge = false;
  cBuffs[i].IDS = SMARTBUFF_GetSpellID(cBuffs[i].BuffS);
  if (cBuffs[i].IDS == nil and cBuffs[i].Type ~= SMARTBUFF_CONST_INV) then
    cBuffs[i] = nil;
    return i;
  end
  
  if (cBuffs[i].IDS) then
    cBuffs[i].IconS = GetSpellTexture(cBuffs[i].IDS, SMARTBUFF_BOOK_TYPE_SPELL);
    cBuffs[i].ASS, cBuffs[i].TextS = SMARTBUFF_GetActionSlot(cBuffs[i].BuffS, cBuffs[i].IconS);  
  else
    local bag, slot, count, texture = SMARTBUFF_FindReagent(cBuffs[i].BuffS);
    if (count == 0) then
      cBuffs[i] = nil;
      return i;
    end
      
    --local j = 1;
    --for j = 1, GetNumCrafts(), 1 do
    --  local craftName, craftSubSpellName, craftType, numAvailable, isExpanded = GetCraftInfo(j)
    --  if (craftName) then
    --    SMARTBUFF_AddMsgD(j .. ". " .. craftName .. ", " .. craftSubSpellName .. ", " .. craftType);
    --  end
    --end
    
    cBuffs[i].IconS = texture;
    cBuffs[i].ASS = nil;
    cBuffs[i].TextS = "";
  end
  
  if (buff[4] ~= nil) then cBuffs[i].LevelsS = buff[4]; else cBuffs[i].LevelsS = nil; end
  if (buff[5] ~= nil) then cBuffs[i].Exclude = buff[5]; else cBuffs[i].Exclude = "x"; end
  
  local ct = currentTemplate;  
  local name = cBuffs[i].BuffS;
  if (SMARTBUFF_Buffs[ct][name] == nil) then
    SMARTBUFF_Buffs[ct][name] = { };
    SMARTBUFF_Buffs[ct][name].EnableS = false;
    SMARTBUFF_Buffs[ct][name].EnableG = false;
    SMARTBUFF_Buffs[ct][name].SelfOnly = false;
    SMARTBUFF_Buffs[ct][name].CIn = false;
    SMARTBUFF_Buffs[ct][name].COut = true;
    SMARTBUFF_Buffs[ct][name].MH = false;
    SMARTBUFF_Buffs[ct][name].OH = false;
    SMARTBUFF_Buffs[ct][name].Reminder = true;
    SMARTBUFF_Buffs[ct][name].RBTime = 0;
    
    if (cBuffs[i].Type == SMARTBUFF_CONST_GROUP) then
      for n in cClasses do
        if (not string.find(cBuffs[i].Exclude, cClasses[n])) then
          SMARTBUFF_Buffs[ct][name][cClasses[n]] = true;
        else
          SMARTBUFF_Buffs[ct][name][cClasses[n]] = false;
        end
      end
    end
  end  
  
  -- update to 1.10g
  if (SMARTBUFF_Buffs[ct][name].RBTime == nil) then
    SMARTBUFF_Buffs[ct][name].Reminder = true;
    SMARTBUFF_Buffs[ct][name].RBTime = 0;
  end
  
  if (cBuffs[i].ASS == nil and (SMARTBUFF_Buffs[ct][cBuffs[i].BuffS].EnableS and cBuffs[i].Type == SMARTBUFF_CONST_GROUP)) then
    SMARTBUFF_AddMsgErr(cBuffs[i].BuffS .. " " .. SMARTBUFF_MSG_NOACTIONSLOT);
  end
    
  cBuffs[i].BuffG = buff[6];
  cBuffs[i].IDG = SMARTBUFF_GetSpellID(cBuffs[i].BuffG);
  if (cBuffs[i].IDG ~= nil) then 
    cBuffs[i].IconG = GetSpellTexture(cBuffs[i].IDG, SMARTBUFF_BOOK_TYPE_SPELL);
  else
    cBuffs[i].IconG = nil;
  end
  cBuffs[i].ASG, cBuffs[i].TextG = SMARTBUFF_GetActionSlot(cBuffs[i].BuffG, cBuffs[i].IconG);
  if (cBuffs[i].IDG ~= nil and cBuffs[i].ASG == nil and SMARTBUFF_Buffs[ct][cBuffs[i].BuffS].EnableG) then SMARTBUFF_AddMsgErr(cBuffs[i].BuffG .. " " .. SMARTBUFF_MSG_NOACTIONSLOT); end
  if (buff[7] ~= nil) then cBuffs[i].DurationG = ceil(buff[7] * 60); else cBuffs[i].DurationG = nil; end
  if (buff[8] ~= nil) then cBuffs[i].LevelsG = buff[8]; else cBuffs[i].LevelsG = nil; end
  if (buff[9] ~= nil) then cBuffs[i].ReagentG = buff[9]; else cBuffs[i].ReagentG = nil; end
  
  if (SMARTBUFF_Options.Debug) then
    local s = cBuffs[i].BuffS;
    if (cBuffs[i].IDS) then s = s .. " ID = " .. cBuffs[i].IDS .. ", Icon = " .. cBuffs[i].IconS; else s = s .. " ID = nil"; end
    if (cBuffs[i].BuffG ~= nil) then 
      s = s .. " - " .. cBuffs[i].BuffG;
      if (cBuffs[i].IDG) then s = s .. " ID = " .. cBuffs[i].IDG .. ", Icon = " .. cBuffs[i].IconG; else s = s .. " ID = nil"; end
    end
    SMARTBUFF_AddMsgD(s);
  end 
  
  return i + 1;
end
-- END SMARTBUFF_SetBuffs


-- Main Check functions
function SMARTBUFF_PreCheck(mode, force)
  if (not isInit) then return false; end

  if (not SMARTBUFF_Options.Toggle) then
    if (mode == 0) then
      SMARTBUFF_AddMsg(SMARTBUFF_MSG_DISABLED);
    end
    return false;
  end
  
  if (mode == 1 and force == nil and ((GetTime() - tLastCheck) < SMARTBUFF_Options.AutoTimer)) then
    return false;
  else
    tLastCheck = GetTime();
  end

  if ((mode == 1 and not SMARTBUFF_Options.ToggleAuto) or isMounted or LootFrame:IsVisible()
    or UnitOnTaxi("player") or UnitIsDeadOrGhost("player") or UnitIsCorpse("player")
    or (mode == 1 and (SMARTBUFF_Options.ToggleAutoRest and IsResting()) and not UnitIsPVP("player"))
    or (not SMARTBUFF_Options.BuffInCities and IsResting() and not UnitIsPVP("player"))) then
    
    if (UnitIsDeadOrGhost("player")) then
      SMARTBUFF_CheckBuffTimers();
    end
    return false;
  end
   
  if (isSetBuffs) then
    SMARTBUFF_SetBuffs();
  end
    
  if (UnitAffectingCombat("player")) then
    isCombat = true;
    --SMARTBUFF_AddMsgD("In combat");
  else
    isCombat = false;
    --SMARTBUFF_AddMsgD("Out of combat");
  end
  
  sMsgWarning = "";
  isFirstError = true;
	
	return true;
end


-- Bufftimer check functions
function SMARTBUFF_CheckBuffTimers()
  local n = 0;
  for subgroup = 0, 8, 1 do
    n = 0;
    if (cGroups[subgroup] ~= nil) then
      for _, unit in cGroups[subgroup] do
        if (unit) then
          if (SMARTBUFF_CheckUnitBuffTimers(unit)) then
            n = n + 1;
          end
        end
      end
      if (n >= SMARTBUFF_Options.GrpBuffSize and cBuffTimer[subgroup]) then
        cBuffTimer[subgroup] = nil;
        SMARTBUFF_AddMsgD("Group " .. subgroup .. ": group timer reseted");
      end
    end
  end
end
-- END SMARTBUFF_CheckBuffTimers

-- if unit is dead, remove all timers
function SMARTBUFF_CheckUnitBuffTimers(unit)
  if (UnitExists(unit) and UnitIsConnected(unit) and UnitIsFriend("player", unit) and UnitIsPlayer(unit) and UnitIsDeadOrGhost(unit)) then
    local _, uc = UnitClass(unit);
    local fd = nil;
    if (uc == "HUNTER") then
      fd = SMARTBUFF_IsFeignDeath(unit);
    end 
    if (not fd) then
      if (cBuffTimer[unit]) then
        cBuffTimer[unit] = nil;
        SMARTBUFF_AddMsgD(UnitName(unit) .. ": unit timer reseted");
      end
      if (cBuffTimer[uc]) then
        cBuffTimer[uc] = nil;
        SMARTBUFF_AddMsgD(uc .. ": class timer reseted");
      end
      return true;
    end
  end
end
-- END SMARTBUFF_CheckUnitBuffTimers

-- check if the player is shapeshifted
function SMARTBUFF_IsShapeshifted()
	if (sPlayerClass == "DRUID") then
	  local i;
  	for i = 1, GetNumShapeshiftForms() do
  		local icon, name, active = GetShapeshiftFormInfo(i);
  		if (active == 1 and SMARTBUFF_GetSpellID(name) ~= nil) then
        return true, name;
      end
  	end  
  end
  return false, nil;
end
-- END SMARTBUFF_IsShapeshifted

function SMARTBUFF_Check(mode, force)
  if (not SMARTBUFF_PreCheck(mode, force)) then
    return;
  end
  
  local ct = currentTemplate;
  local unit = nil;
  local unitB = nil;
  local unitL = nil;
  local unitU = nil;
  local uLevel = nil;
  local uLevelL = nil;
  local uLevelU = nil;
  local idL = nil;
  local idU = nil;
  local subgroup = 0;
  local i;
  local j;
  local n;
  local m;
  local rc;
  local rank;
  local reagent;
  local nGlobal = 0;
  
  --isChecking = true;
  SMARTBUFF_checkBlacklist();
    
  -- buff target first, if enabled
  if ((mode == 0 or mode == 5) and SMARTBUFF_Options.BuffTarget) then
    i = SMARTBUFF_BuffUnit("target", 0, mode);
    if (i <= 1) then
      if (i == 0) then
        tLastCheck = GetTime() - SMARTBUFF_Options.AutoTimer + GlobalCd;
      end
      return;
    end    
  end
  
  --for subgroup, units in cGroups do
  for subgroup = 0, 8, 1 do
    if (cGroups[subgroup] ~= nil) then
      units = cGroups[subgroup];
      
      -- check group buff
      if (mode == 0 or mode == 5) then
        i = 1;
        local rbTime = 0;
        while (cBuffs[i] and cBuffs[i].BuffS and (iGroupSetup > 1 or SMARTBUFF_Options.Debug)) do
          if (cBuffs[i].BuffG and SMARTBUFF_Buffs[ct][cBuffs[i].BuffS].EnableG and (cBuffs[i].IDG ~= nil or SMARTBUFF_Options.Debug) 
           and ((isCombat and SMARTBUFF_Buffs[ct][cBuffs[i].BuffS].CIn) or (not isCombat and SMARTBUFF_Buffs[ct][cBuffs[i].BuffS].COut))) then          
            n = 0;
            m = 0;
            j = 0;
            uLevelL = 100;
            uLevelU = 0;
            local tmpUnits = { };
            local buffnS = cBuffs[i].BuffS;
            
            rbTime = SMARTBUFF_Buffs[ct][buffnS].RBTime;
            if (rbTime <= 0) then
              rbTime = SMARTBUFF_Options.RebuffTimer;
            end            
            
            for j, unit in units do            
              if (sPlayerClass == "PALADIN") then
                n = n + 1;
                if (UnitExists(unit) and not UnitIsDeadOrGhost(unit) and not UnitIsCorpse(unit) and UnitIsConnected(unit) and UnitIsVisible(unit) and not UnitOnTaxi(unit)) then              
                  local _, uc = UnitClass(unit);
                  local uct = UnitCreatureType(unit);
	                local ucf = UnitCreatureFamily(unit);
	                if (uct == nil) then uct = ""; end
                  if (ucf == nil) then ucf = ""; end
                  
                  --SMARTBUFF_AddMsgD("Checking " .. cBuffs[i].BuffG .. " " .. unit);  
                  if ((SMARTBUFF_Buffs[ct][buffnS][uc] and (uct == SMARTBUFF_HUMANOID or (uc == "DRUID" and uct == SMARTBUFF_BEAST))) or (SMARTBUFF_Buffs[ct][buffnS]["HPET"] and uct == SMARTBUFF_BEAST and uc ~= "DRUID") or (SMARTBUFF_Buffs[ct][buffnS]["WPET"] and uct == SMARTBUFF_DEMON and ucf ~= SMARTBUFF_DEMONTYPE)) then
  	                uLevel = UnitLevel(unit);
  	                if (uLevel < uLevelL) then
  	                  uLevelL = uLevel;
  	                  unitL = unit;
  	                end
  	                if (uLevel > uLevelU) then
  	                  uLevelU = uLevel;
  	                  unitU = unit;
  	                end                
  	                
  	                local ret, idx, buffname = SMARTBUFF_CheckUnitBuffs(unit, cBuffs[i].BuffG, cBuffs[i].IconG, nil, nil);
  	                if (ret ~= nil or (cBuffTimer[uc] ~= nil and cBuffTimer[uc][cBuffs[i].BuffG] ~= nil and rbTime > 0 and rbTime >= (cBuffs[i].DurationG - (GetTime() - cBuffTimer[uc][cBuffs[i].BuffG])))) then
  	                  n = 5;
  	                  m = 5;
  	                  tmpUnits[n] = unit;
                      unitB = unit;
                      --SMARTBUFF_AddMsgD(unit .. " ready for " .. cBuffs[i].BuffG);
  	                  break;
  	                end                  
                  end
                end
              else
                if (unit and (string.find(unit, "raid%d+") or string.find(unit, "party%d") or unit == "player")) then             
                  --SMARTBUFF_AddMsgD("Checking " .. cBuffs[i].BuffG .. " " .. unit);              
                  n = n + 1;	
  	              if (UnitExists(unit) and not UnitIsDeadOrGhost(unit) and not UnitIsCorpse(unit) and UnitIsConnected(unit) and UnitIsVisible(unit) and not UnitOnTaxi(unit) and (not SMARTBUFF_Options.AdvGrpBuffRange or CheckInteractDistance(unit, 4))) then
                    tmpUnits[n] = unit;
  	                uLevel = UnitLevel(unit);
  	                if (uLevel < uLevelL) then
  	                  uLevelL = uLevel;
  	                  unitL = unit;
  	                end
  	                if (uLevel > uLevelU) then
  	                  uLevelU = uLevel;
  	                  unitU = unit;
  	                  unitB = unit;
  	                end
  	                local ret, idx, buffname;
  	                if (SMARTBUFF_Options.AdvGrpBuffCheck) then
  	                  ret, idx, buffname = SMARTBUFF_CheckUnitBuffs(unit, cBuffs[i].BuffS, cBuffs[i].IconS, cBuffs[i].BuffG, cBuffs[i].IconG);
  	                else
  	                  ret, idx, buffname = SMARTBUFF_CheckUnitBuffs(unit, cBuffs[i].BuffG, cBuffs[i].IconG, nil, nil);
  	                end
  	                if (ret ~= nil or (cBuffTimer[subgroup] ~= nil and cBuffTimer[subgroup][cBuffs[i].BuffG] ~= nil and rbTime > 0 and rbTime >= (cBuffs[i].DurationG - (GetTime() - cBuffTimer[subgroup][cBuffs[i].BuffG])))) then
  	                  m = m + 1;
  	                end
  	              end
  	            end
  	          end
  	        end -- end for
            
  	        if (unitL ~= nil and unitU ~=nil and unitB ~= nil and cBuffs[i].IDG ~= nil) then
              idU, rank = SMARTBUFF_CheckUnitLevel(unitU, cBuffs[i].IDG, cBuffs[i].LevelsG);
              idL, rank = SMARTBUFF_CheckUnitLevel(unitL, cBuffs[i].IDG, cBuffs[i].LevelsG);
              
              --SMARTBUFF_AddMsgD(cBuffs[i].BuffG .. " (" .. rank .. ") " .. m .. " of " .. n .. " not buffed, lowest/highest level " .. uLevelL .. "/" .. uLevelU);            
  	          if (idL ~= nil and idU ~= nil and idL == idU and rank > 0 and m >= SMARTBUFF_Options.GrpBuffSize and n >= SMARTBUFF_Options.GrpBuffSize) then
    	        
                reagent = cBuffs[i].ReagentG[rank];
                if (reagent) then
                  rc = SMARTBUFF_CountReagent(reagent);
                  if (rc > 0) then
                    currentUnit = nil;
                    currentSpell = nil;
                    j = SMARTBUFF_doCast(unitB, idU, cBuffs[i].ASG, nil, SMARTBUFF_CONST_GROUP)
                    --SMARTBUFF_AddMsgD("Buffing group (" .. unitB .. ") " .. subgroup .. ", " .. j .. ", " .. cBuffs[i].ASG .. ", ");
 	                  if (j == 0) then
                      SMARTBUFF_AddMsg(SMARTBUFF_MSG_GROUP .. " " .. subgroup .. ": " .. cBuffs[i].BuffG .. " " .. SMARTBUFF_MSG_BUFFED);
                      SMARTBUFF_AddMsg(SMARTBUFF_MSG_STOCK .. " " .. reagent .. " = " .. (rc - 1));
                      --isChecking = false;
                      
                      if (sPlayerClass == "PALADIN") then
                        local _, uc = UnitClass(unitB);
                        if (cBuffTimer[uc] == nil) then
                          cBuffTimer[uc] = { };
                        end
                        cBuffTimer[uc][cBuffs[i].BuffG] = GetTime();                      
                      else
                        if (cBuffTimer[subgroup] == nil) then
                          cBuffTimer[subgroup] = { };
                        end
                        cBuffTimer[subgroup][cBuffs[i].BuffG] = GetTime();
                      end
                      
                      for j, unit in tmpUnits do
                        if (cBuffTimer[unit] == nil) then
                          cBuffTimer[unit] = { };
                        end
                        cBuffTimer[unit][cBuffs[i].BuffS] = nil;
                        --cBuffTimer[unit][cBuffs[i].BuffG] = GetTime();
                      end
                      
                      return;
                    end
  	              else
  	                SMARTBUFF_AddMsgWarn(SMARTBUFF_MSG_NOREAGENT .. " " .. reagent .. "! " .. cBuffs[i].BuffG .. " " .. SMARTBUFF_MSG_DEACTIVATED);
  	                SMARTBUFF_Buffs[ct][cBuffs[i].BuffS].EnableG = false;
  	              end
  	            else
  	              --SMARTBUFF_AddMsgD("Reagent = nil");
  	            end
  	          end
  	        end
  	      end
  	      i = i + 1;
  	    end
  	  end
    	
      -- check single buff
      j = 0;
      for j, unit in units do
        i = SMARTBUFF_BuffUnit(unit, subgroup, mode);
        if (i <= 1) then
          if (i == 0 and (mode == 0 or mode == 5)) then
            tLastCheck = GetTime() - SMARTBUFF_Options.AutoTimer + GlobalCd;
          end
          return;
        end
      end
    
    end
  end -- for groups
  
  if (mode == 0) then 
    if (sMsgWarning == "" or sMsgWarning == " ") then
      SMARTBUFF_AddMsg(SMARTBUFF_MSG_NOTHINGTODO);
    else
      SMARTBUFF_AddMsgWarn(sMsgWarning);
      sMsgWarning = "";
    end
  end
  tLastCheck = GetTime();
  isChecking = false;
  
end
-- END SMARTBUFF_Check


-- Buffs a unit
function SMARTBUFF_BuffUnit(unit, subgroup, mode)
  local ct = currentTemplate;
  local buff = nil;
  local buffname = nil;
  local buffnS = nil;
  local uc = nil;
  local un = nil;
  local uct = nil;
  local ucf = nil;
  local r;
  local i;
  local bt = 0;
  local charges = 0;
  local handtype = "";
  local bExpire = false;
  local bExpireOh = false;
  local isPvP = false;
  local bufftarget = nil;
  local rbTime = 0;
  local bUsable = false;
  
  isChecking = true;
  if (UnitIsPVP("player")) then isPvP = true; end
  
  SMARTBUFF_CheckUnitBuffTimers(unit);  
    
  if (UnitExists(unit) and UnitIsFriend("player", unit) and not UnitIsDeadOrGhost(unit) and not UnitIsCorpse(unit)
    and UnitIsConnected(unit) and UnitIsVisible(unit) and not UnitOnTaxi(unit) and cBlacklist[unit] == nil
    and ((UnitIsPVP(unit) == nil and (not isPvP or SMARTBUFF_Options.BuffPvP)) or (UnitIsPVP(unit) and (isPvP or SMARTBUFF_Options.BuffPvP)))) then
    
  	_, uc = UnitClass(unit);
  	un = UnitName(unit);
  	uct = UnitCreatureType(unit);
	  ucf = UnitCreatureFamily(unit);
	  if (uct == nil) then uct = ""; end
    if (ucf == nil) then ucf = ""; end
          
    --if (un) then SMARTBUFF_AddMsgD("Grp " .. subgroup .. " checking " .. un .. " (" .. uct .. "/" .. ucf .. "/".. unit .. ")...", 0, 1, 0.5); end

    i = 1;
    isShapeshifted, sShapename = SMARTBUFF_IsShapeshifted();
    while (cBuffs[i] and cBuffs[i].BuffS) do
      buffnS = cBuffs[i].BuffS;
      bExpire = false;
      bExpireOh = false;
      handtype = "";
      charges = -1;
      bufftarget = nil;
      bUsable = true;
      
      
      if (SMARTBUFF_Buffs[ct][buffnS].EnableS and cBuffs[i].ASS ~= nil and cBuffs[i].Type == SMARTBUFF_CONST_SELF) then
        -- check if you have enough mana/rage/energy to cast
        local isUsable, notEnoughMana = IsUsableAction(cBuffs[i].ASS);
        if (isUsable == nil or notEnoughMana) then
          bUsable = false;
          --SMARTBUFF_AddMsgD("Buff " .. cBuffs[i].BuffS .. " is not usable!");
        end
      end      
      
      
      if (bUsable and SMARTBUFF_Buffs[ct][buffnS].EnableS and (cBuffs[i].IDS ~= nil or cBuffs[i].Type == SMARTBUFF_CONST_INV)
        and ((mode ~= 1 and ((isCombat and SMARTBUFF_Buffs[ct][buffnS].CIn) or (not isCombat and SMARTBUFF_Buffs[ct][buffnS].COut)))
          or (mode == 1 and SMARTBUFF_Buffs[ct][buffnS].Reminder and ((not isCombat and SMARTBUFF_Buffs[ct][buffnS].COut) 
          or (isCombat and (SMARTBUFF_Buffs[ct][buffnS].CIn or SMARTBUFF_Options.ToggleAutoCombat)))))) then
        
        if (not SMARTBUFF_Buffs[ct][buffnS].SelfOnly or (SMARTBUFF_Buffs[ct][buffnS].SelfOnly and SMARTBUFF_IsPlayer(unit))) then
          
          -- check if spell has cooldown
	        local cd = 0;
          if (cBuffs[i].IDS) then _, cd = GetSpellCooldown(cBuffs[i].IDS, SMARTBUFF_BOOK_TYPE_SPELL); end
  	      if (cd == 0) then
            if (cBuffs[i].IDS and sMsgWarning == SMARTBUFF_MSG_CD) then
              sMsgWarning = " ";
            end
            
            rbTime = SMARTBUFF_Buffs[ct][buffnS].RBTime;
            if (rbTime <= 0) then
              rbTime = SMARTBUFF_Options.RebuffTimer;
            end
  	      
            --SMARTBUFF_AddMsgD(uc .. " " .. ct);
            if ((cBuffs[i].Type == SMARTBUFF_CONST_GROUP and ((SMARTBUFF_Buffs[ct][buffnS][uc] and (uct == SMARTBUFF_HUMANOID or (uc == "DRUID" and uct == SMARTBUFF_BEAST))) or (SMARTBUFF_Buffs[ct][buffnS]["HPET"] and uct == SMARTBUFF_BEAST and uc ~= "DRUID") or (SMARTBUFF_Buffs[ct][buffnS]["WPET"] and uct == SMARTBUFF_DEMON and ucf ~= SMARTBUFF_DEMONTYPE)))
              or (cBuffs[i].Type ~= SMARTBUFF_CONST_GROUP and SMARTBUFF_IsPlayer(unit))) then
              buff = nil;
                            
              -- Tracking ability
              if (cBuffs[i].Type == SMARTBUFF_CONST_TRACK) then
                
                local iconTrack = GetTrackingTexture();
                if (iconTrack) then
                  --SMARTBUFF_AddMsgD("Track already enabled: " .. iconTrack);
                else
                  if (sPlayerClass ~= "DRUID" or ((not isShapeshifted and buffnS ~= SMARTBUFF_DRUID_TRACK) or (isShapeshifted and buffnS ~= SMARTBUFF_DRUID_TRACK) or (isShapeshifted and buffnS == SMARTBUFF_DRUID_TRACK and sShapename == SMARTBUFF_DRUID_CAT))) then
                    buff = buffnS;
                  end
                end
                
              -- Weapon buff
              elseif (cBuffs[i].Type == SMARTBUFF_CONST_WEAPON or cBuffs[i].Type == SMARTBUFF_CONST_INV) then
                local bMh = false;
                local bOh = false;
                local tMh = -1;
                local tOh = -1;
                local cMh = -1;
                local cOh = -1;
                
	              SmartBuffTooltip:SetOwner(SmartBuffFrame, "ANCHOR_NONE");
	              SmartBuffTooltip:ClearLines();                  
                local mainH,_,_ = SmartBuffTooltip:SetInventoryItem("player", 16);
                local offH,_,_ = SmartBuffTooltip:SetInventoryItem("player", 17);
                bMh, tMh, cMh, bOh, tOh, cOh = GetWeaponEnchantInfo();
                
                if (SMARTBUFF_Buffs[ct][buffnS].MH or cBuffs[i].Type == SMARTBUFF_CONST_WEAPON) then
                  if (mainH and SMARTBUFF_CanApplyWeaponBuff(buffnS, 16)) then
					          if (bMh) then
					            if (rbTime > 0 and cBuffs[i].DurationS >= 1) then
					              tMh = floor(tMh/1000);
					              charges = cMh;
					              if (charges == nil) then charges = -1; end
					              if (charges > 1) then cBuffs[i].CanCharge = true; end
					              --SMARTBUFF_AddMsgD(un .. " (WMH): " .. buffnS .. string.format(" %.0f sec left", tMh) .. ", " .. charges .. " charges left");
                        if (tMh <= rbTime or (SMARTBUFF_Options.ToggleCheckCharges and cBuffs[i].CanCharge and charges > 0 and charges <= SMARTBUFF_Options.MinCharges)) then
                          buff = buffnS;
                          bt = tMh;
                          bExpire = true;
                        end
						          end
					          else
                      handtype = "main";
					            buff = buffnS;
					          end
					        else
					          --SMARTBUFF_AddMsgD("Weapon Buff cannot be cast, no mainhand weapon equipped or wrong weapon/stone type");
					        end
					      end
                
                if (SMARTBUFF_Buffs[ct][buffnS].OH and not bExpire and handtype == "") then
                  if (offH and SMARTBUFF_CanApplyWeaponBuff(buffnS, 17)) then
					          if (bOh) then
					            if (rbTime > 0 and cBuffs[i].DurationS >= 1) then
					              tOh = floor(tOh/1000);
					              charges = cOh;
					              if (charges == nil) then charges = -1; end
					              if (charges > 1) then cBuffs[i].CanCharge = true; end
					              --SMARTBUFF_AddMsgD(un .. " (WOH): " .. buffnS .. string.format(" %.0f sec left", tOh) .. ", " .. charges .. " charges left");
                        if (tOh <= rbTime or (SMARTBUFF_Options.ToggleCheckCharges and cBuffs[i].CanCharge and charges > 0 and charges <= SMARTBUFF_Options.MinCharges)) then
                          buff = buffnS;
                          bt = tOh;
                          bExpireOh = true;                          
                        end					            
						          end
					          else
                      handtype = "off";
					            buff = buffnS;
					          end
					        else
					          --SMARTBUFF_AddMsgD("Weapon Buff cannot be cast, no offhand weapon equipped or wrong weapon/stone type");
					        end
					      end
                
                if (buff and cBuffs[i].Type == SMARTBUFF_CONST_INV) then
                  local cr = SMARTBUFF_CountReagent(buffnS);
                  if (cr > 0) then
                    --SMARTBUFF_AddMsgD(cr .. " " .. buffnS .. " found");
                  else
                    --SMARTBUFF_AddMsgD("No " .. buffnS .. " found");
                    buff = nil;
                  end
                end                
					      
					    -- Normal buff
              else
                local index = nil;
                
                -- cleanup single timer, if a group buff exists
                if (unit ~= "target" and cBuffs[i].IDG ~= nil) then
                  buff, index, buffname = SMARTBUFF_CheckUnitBuffs(unit, cBuffs[i].BuffG, cBuffs[i].IconG, nil, nil);
                  if (buff == nil and cBuffTimer[unit] ~= nil and cBuffTimer[unit][buffnS] ~= nil) then
                    cBuffTimer[unit][buffnS] = nil;
                    --SMARTBUFF_AddMsgD(un .. " (S): " .. buffnS .. " timer reset");
                  end                 
                end
                
                -- check timer object
                buff, index, buffname = SMARTBUFF_CheckUnitBuffs(unit, buffnS, cBuffs[i].IconS, cBuffs[i].BuffG, cBuffs[i].IconG);
                if (unit ~= "target" and buff == nil and cBuffs[i].DurationS >= 1 and rbTime > 0) then
                  if (SMARTBUFF_IsPlayer(unit)) then
                    bt = GetPlayerBuffTimeLeft(index);
                    charges = GetPlayerBuffApplications(index);
                    if (charges == nil) then charges = -1; end
                    if (charges > 1) then cBuffs[i].CanCharge = true; end
                    bufftarget = nil;
                    --SMARTBUFF_AddMsgD(un .. " (P): " .. index .. ". " .. GetPlayerBuffTexture(index) .. "(" .. charges .. ") - " .. buffnS .. string.format(" %.0f sec left", bt));
                  elseif (cBuffTimer[unit] ~= nil and cBuffTimer[unit][buffnS] ~= nil) then
                    bt = cBuffs[i].DurationS - (GetTime() - cBuffTimer[unit][buffnS]);
                    bufftarget = nil;
                    --SMARTBUFF_AddMsgD(un .. " (S): " .. buffnS .. string.format(" %.0f sec left", bt));                    
                  elseif (cBuffs[i].BuffG ~= nil and cBuffTimer[subgroup] ~= nil and cBuffTimer[subgroup][cBuffs[i].BuffG] ~= nil) then
                    bt = cBuffs[i].DurationG - (GetTime() - cBuffTimer[subgroup][cBuffs[i].BuffG]);
                    bufftarget = SMARTBUFF_MSG_GROUP .. " " .. subgroup;
                    --SMARTBUFF_AddMsgD(bufftarget .. ": " .. cBuffs[i].BuffG .. string.format(" %.0f sec left", bt));                    
                  elseif (cBuffs[i].BuffG ~= nil and cBuffTimer[uc] ~= nil and cBuffTimer[uc][cBuffs[i].BuffG] ~= nil) then
                    bt = cBuffs[i].DurationG - (GetTime() - cBuffTimer[uc][cBuffs[i].BuffG]);
                    bufftarget = SMARTBUFF_MSG_CLASS .. " " .. UnitClass(unit);
                    --SMARTBUFF_AddMsgD(bufftarget .. ": " .. cBuffs[i].BuffG .. string.format(" %.0f sec left", bt));                    
                  else
                    bt = nil;
                  end
                  
                  if ((bt and bt <= rbTime) or (SMARTBUFF_Options.ToggleCheckCharges and cBuffs[i].CanCharge and charges > 0 and charges <= SMARTBUFF_Options.MinCharges)) then
                    if (buffname) then
                      buff = buffname;
                    else
                      buff = buffnS;
                    end
                    bExpire = true;
                  end
                end
                
                -- check if the group buff is active, in this case it is not possible to cast the single buff
                if (buffname and mode ~= 1 and buffname ~= buffnS) then
                  buff = nil;
                  --SMARTBUFF_AddMsgD("Group buff is active, single buff canceled!");
                end

              end

              -- check if shapeshifted and cancel buff if it is not possible to cast it
              if (buff and cBuffs[i].Type ~= SMARTBUFF_CONST_TRACK) then
                --isShapeshifted = true;
                --sShapename = "Moonkingestalt";
                if (isShapeshifted) then
                  if (string.find(cBuffs[i].Exclude, sShapename)) then
                    SMARTBUFF_AddMsgD("Cast " .. buff .. " while shapeshifted");
                  else
                    if(cBuffs[i].Exclude == SMARTBUFF_DRUID_CAT) then
                      buff = nil;
                    end                  
                    if (buff and mode ~= 1) then
                      sMsgWarning = SMARTBUFF_MSG_SHAPESHIFT .. ": " .. sShapename;
                      buff = nil;
                    end
                  end
                else
                  if(cBuffs[i].Exclude == SMARTBUFF_DRUID_CAT) then
                    buff = nil;
                  end
                end
              end
              
              if (buff) then
	              --SMARTBUFF_AddMsgD("Checking " ..i .. " - " .. cBuffs[i].IDS .. " " .. buffnS);              
                if (mode == 0 or mode == 5) then
                  
                  --try to apply weapon buffs on main/off hand
                  if (cBuffs[i].Type == SMARTBUFF_CONST_INV) then
                    local bag, slot, count, _ = SMARTBUFF_FindReagent(buffnS);
                    if (count > 0 and (handtype == "main" or bExpire)) then
                      UseContainerItem(bag, slot);
                      if (SpellIsTargeting()) then
                        PickupInventoryItem(16);                      
                        sMsgWarning = "";
                        return 0;
                      end
                    end
                    if (count > 0 and (handtype == "off" or bExpireOh)) then
                      UseContainerItem(bag, slot);
                      if (SpellIsTargeting()) then
                        PickupInventoryItem(17);
                        sMsgWarning = "";
                        return 0;
                      end
                    end                      
                    r = 50;
                  else
                    -- try to cast buff
                    currentUnit = unit;
                    currentSpell = buffnS;
                    r = SMARTBUFF_doCast(unit, cBuffs[i].IDS, cBuffs[i].ASS, cBuffs[i].LevelsS, cBuffs[i].Type);
                  end
                
                elseif (mode == 1) then
                  currentUnit = nil;
                  currentSpell = nil;
                  if (bufftarget == nil) then bufftarget = un; end
                  
                  if (SMARTBUFF_CheckUnitLevel(unit, cBuffs[i].IDS, cBuffs[i].LevelsS) ~= nil or cBuffs[i].Type == SMARTBUFF_CONST_INV) then
                    -- clean up buff timer, if expired
                    if (bt and bt < 0 and (bExpire or bExpireOh)) then 
                      bt = 0;
                      if (cBuffTimer[unit] ~= nil and cBuffTimer[unit][buffnS] ~= nil) then
                        cBuffTimer[unit][buffnS] = nil;
                        --SMARTBUFF_AddMsgD(un .. " (S): " .. buffnS .. " timer reset");
                      end
                      if (cBuffs[i].IDG ~= nil) then
                        if (cBuffTimer[subgroup] ~= nil and cBuffTimer[subgroup][cBuffs[i].BuffG] ~= nil) then
                          cBuffTimer[subgroup][cBuffs[i].BuffG] = nil;
                          --SMARTBUFF_AddMsgD("Group " .. subgroup .. ": " .. buffnS .. " timer reset");
                        end                  
                        if (cBuffTimer[uc] ~= nil and cBuffTimer[uc][cBuffs[i].BuffG] ~= nil) then
                          cBuffTimer[uc][cBuffs[i].BuffG] = nil;
                          --SMARTBUFF_AddMsgD("Class " .. uc .. ": " .. cBuffs[i].BuffG .. " timer reset");
                        end
                      end
                      
                      isChecking = false;
                      return 0                      
                    end
                    
                    -- show splash buff message
                    if (SMARTBUFF_Options.ToggleAutoSplash and not SmartBuffOptionsFrame:IsVisible()) then
                      if (SMARTBUFF_Options.ToggleCheckCharges and cBuffs[i].CanCharge and charges > 0 and charges <= SMARTBUFF_Options.MinCharges and (bExpire or bExpireOh)) then
                        SmartBuffSplashFrame:AddMessage(bufftarget .. "\n" .. SMARTBUFF_MSG_REBUFF .. " " .. buff .. ": " .. charges .. " " .. SMARTBUFF_MSG_CHARGES .. " " .. SMARTBUFF_MSG_LEFT, 1, 1, 1, 1, 3);
                      elseif (bExpire or bExpireOh) then
                        SmartBuffSplashFrame:AddMessage(bufftarget .. "\n" .. SMARTBUFF_MSG_REBUFF .. " " .. buff .. string.format(": %.0f", bt) .. " sec " .. SMARTBUFF_MSG_LEFT, 1, 1, 1, 1, 3);
                      else
                        SmartBuffSplashFrame:AddMessage(bufftarget .. " " .. SMARTBUFF_MSG_NEEDS .. " " .. buff, 1, 1, 1, 1, 3);
                      end
                    end
                    
                    -- show chat buff message
                    if (SMARTBUFF_Options.ToggleAutoChat) then
                      if (SMARTBUFF_Options.ToggleCheckCharges and cBuffs[i].CanCharge and charges > 0 and charges <= SMARTBUFF_Options.MinCharges and (bExpire or bExpireOh)) then
                        SMARTBUFF_AddMsgWarn(bufftarget .. ": " .. SMARTBUFF_MSG_REBUFF .. " " .. buff .. ", " .. charges .. " " .. SMARTBUFF_MSG_CHARGES .. " " .. SMARTBUFF_MSG_LEFT, true);
                      elseif (bExpire or bExpireOh) then
                        SMARTBUFF_AddMsgWarn(bufftarget .. ": " .. SMARTBUFF_MSG_REBUFF .. " " .. buff .. string.format(", %.0f", bt) .. " sec " .. SMARTBUFF_MSG_LEFT, true);
                      else
                        SMARTBUFF_AddMsgWarn(bufftarget .. " " .. SMARTBUFF_MSG_NEEDS .. " " .. buff, true);
                      end
                    end
                    
                    -- play sound
                    if (SMARTBUFF_Options.ToggleAutoSound) then
                      PlaySound(SMARTBUFF_CONST_AUTOSOUND);
                    end
                    
                    isChecking = false;
                    return 0;
                  end
                end
                
                if (r == 0) then
                  -- target buffed
                  -- Message will printed in the "SPELLCAST_STOP" event
                  sMsgWarning = "";
                  return 0;
                elseif (r == 1) then
                  -- spell cooldown
                  if (mode == 0) then SMARTBUFF_AddMsgWarn(buffnS .. " " .. SMARTBUFF_MSG_CD); end
                  isChecking = false;
                  return 1;
                elseif (r == 2) then
                  -- can not target
                  if (mode == 0 and ucf ~= SMARTBUFF_DEMONTYPE) then SMARTBUFF_AddMsgD("Can not target " .. un); end
                elseif (r == 3) then
                  -- target oor
                  if (mode == 0) then SMARTBUFF_AddMsgWarn(un .. " " .. SMARTBUFF_MSG_OOR); end
                  break;
                elseif (r == 4) then
                  -- spell cooldown > maxSkipCoolDown
                  if (mode == 0) then SMARTBUFF_AddMsgD(buffnS .. " " .. SMARTBUFF_MSG_CD .. " > " .. maxSkipCoolDown); end
                elseif (r == 5) then
                  -- target to low
                  if (mode == 0) then SMARTBUFF_AddMsgD(un .. " is to low to get buffed with " .. buffnS); end
                elseif (r == 6) then
                  -- not enough mana/rage/energy
                  --SMARTBUFF_AddMsgWarn(SMARTBUFF_MSG_OOM);
                  sMsgWarning = SMARTBUFF_MSG_OOM;
                  isChecking = false;
                  --return 1;
                elseif (r == 7) then
                  -- tracking ability is already active
                  if (mode == 0) then SMARTBUFF_AddMsgD(buffnS .. " not used, other ability already active"); end
                elseif (r == 8) then
                  -- actionslot is not defined
                  if (mode == 0) then SMARTBUFF_AddMsgD(buffnS .. " has no actionslot"); end
                elseif (r == 9) then
                  -- spell ID not found
                  if (mode == 0) then SMARTBUFF_AddMsgD(buffnS .. " spellID not found"); end
                elseif (r == 10) then
                  -- target could not buffed
                  if (mode == 0) then SMARTBUFF_AddMsgD(buffnS .. " could not buffed on " .. un); end
                elseif (r == 50) then
                  -- weapon buff could not applied
                  if (mode == 0) then SMARTBUFF_AddMsgD(buffnS .. " could not applied"); end
                else
                  -- no spell selected
				      	  if (mode == 0) then SMARTBUFF_AddMsgD(SMARTBUFF_MSG_CHAT); end
                end
              else
                -- finished
                if (mode == 0) then SMARTBUFF_AddMsgD(un .. " nothing to buff"); end
              end
            else
              -- target has no mana
              if (mode == 0) then SMARTBUFF_AddMsgD(un .. " needs no int buff"); end            
            end
          else
            -- cooldown
            if (sMsgWarning == "") then
              sMsgWarning = SMARTBUFF_MSG_CD;
            end
          end
        end -- group or self
      end
      i = i + 1;
    end -- while buff
      
  end
  isChecking = false;
  return 3;
end
-- END SMARTBUFF_BuffUnit


-- check if a spell/reagent could applied on a weapon
function SMARTBUFF_CanApplyWeaponBuff(buff, slot)
  local b = false;
  local cWeaponTypes = nil;
  if (string.find(buff, SMARTBUFF_WEAPON_SHARP_PATTERN)) then
    cWeaponTypes = SMARTBUFF_WEAPON_SHARP;
  elseif (string.find(buff, SMARTBUFF_WEAPON_BLUNT_PATTERN)) then
    cWeaponTypes = SMARTBUFF_WEAPON_BLUNT;
  else
    cWeaponTypes = SMARTBUFF_WEAPON_STANDARD;
  end
  
  local itemLink = GetInventoryItemLink("player", slot);
  local _, _, itemCode = string.find(itemLink, "(%d+):");
  local _, _, _, _, itemType, itemSubType = GetItemInfo(itemCode);                

  if (itemType and itemSubType) then
    --SMARTBUFF_AddMsgD("Type: " .. itemType .. ", Subtype: " .. itemSubType);
  end
  
  if (cWeaponTypes) then
    for _, weapon in cWeaponTypes do
      --SMARTBUFF_AddMsgD(weapon);
      if (string.find(itemSubType, weapon)) then
        --SMARTBUFF_AddMsgD("Can apply " .. buff .. " on " .. itemSubType);
        b = true;
        break;
      end
    end
  end                      
  return b;
end
-- END SMARTBUFF_CanApplyWeaponBuff


-- Check the unit blacklist
function SMARTBUFF_checkBlacklist()
  local t = GetTime();
  for unit in cBlacklist do
    if (t > (cBlacklist[unit] + SMARTBUFF_Options.BlacklistTimer)) then
      cBlacklist[unit] = nil;
    end
  end
end
-- END SMARTBUFF_checkBlacklist


-- Casts a spell
function SMARTBUFF_doCast(unit, id, actionSlot, levels, type)
  if (id == nil) then return 9; end
  if (type == SMARTBUFF_CONST_GROUP and actionSlot == nil) then return 8; end
  if (type == SMARTBUFF_CONST_TRACK and GetTrackingTexture()) then 
    local iconTrack = GetTrackingTexture();
    --SMARTBUFF_AddMsgD("Track already enabled: " .. iconTrack);
    return 7; 
  end
  	
	-- check if spell has cooldown
	local _, cd = GetSpellCooldown(id, SMARTBUFF_BOOK_TYPE_SPELL)
	if (not cd) then
	  -- move on
	elseif (cd > maxSkipCoolDown) then
	  return 4;
  elseif (cd > 0) then 
    return 1;
  end
  
  -- Rangecheck, InteractDistance 4 = Follow (28.33 yards)
	if ((not UnitIsVisible(unit)) or (not CheckInteractDistance(unit, 4))) then
		return 3;
	end
	
	-- check if target is to low for this spell
	id = SMARTBUFF_CheckUnitLevel(unit, id, levels);
	if (id == nil) then
	  return 5;
	end
  
  if (actionSlot) then
    -- check if you have enough mana/energy/rage to cast
    local isUsable, notEnoughMana = IsUsableAction(actionSlot);
    if (notEnoughMana) then
      return 6;
    end
  end
  
  local oldTarget = nil;
  local oldTargetWasPlayer = nil;
  if (type == SMARTBUFF_CONST_GROUP) then
    if (not UnitIsUnit("player", unit) and not UnitIsUnit("target", unit) and not UnitIsEnemy("player", "target")) then
    	oldTargetWasPlayer = UnitIsPlayer("target");
    	oldTarget = UnitName("target");
    	SmartBuff_InhibitTargetCasting();
    	ClearTarget();
    	SmartBuff_RestoreTargetCasting();
    end
  end

  local onSelf = nil;
  if (UnitIsUnit("player", unit)) then
  	onSelf = 1;
  end
  
  if (onSelf) then
    local spellN, spellR = GetSpellName(id, SMARTBUFF_BOOK_TYPE_SPELL);
    if (spellN) then
      CastSpellByName(spellN, onSelf);
    end
    --if (actionSlot) then
  	--  UseAction(actionSlot, 0, onSelf);
  	--end
  else
   	CastSpell(id, SMARTBUFF_BOOK_TYPE_SPELL);
  end
  
  if (not onSelf and SpellIsTargeting() and not SpellCanTargetUnit(unit)) then
    SpellStopTargeting();
    SMARTBUFF_RestoreTarget(oldTarget, oldTargetWasPlayer);
    return 10;
  end
  
  if (SpellIsTargeting() and (not onSelf or (onSelf and type == SMARTBUFF_CONST_GROUP))) then
    SpellTargetUnit(unit);
  end
  
  SMARTBUFF_RestoreTarget(oldTarget, oldTargetWasPlayer); 
  return 0;
end

function SMARTBUFF_doCast_OLD(unit, id, actionSlot, levels, type)
  if (id == nil) then return 9; end
  if (type == SMARTBUFF_CONST_GROUP and actionSlot == nil) then return 8; end
  if (type == SMARTBUFF_CONST_TRACK and GetTrackingTexture()) then 
    local iconTrack = GetTrackingTexture();
    --SMARTBUFF_AddMsgD("Track already enabled: " .. iconTrack);
    return 7; 
  end
  	
	-- check if spell has cooldown
	local _, cd = GetSpellCooldown(id, SMARTBUFF_BOOK_TYPE_SPELL)
	if (cd > maxSkipCoolDown) then
	  return 4;
  elseif (cd > 0) then 
    return 1;
  end
  
  local name = UnitName("target");
  if (type == SMARTBUFF_CONST_GROUP or type == SMARTBUFF_CONST_FORCESELF) then
    if (not UnitIsUnit("target", unit)) then
      TargetUnit(unit);
    end
  end
  
  if (type == SMARTBUFF_CONST_GROUP) then
    -- check if target is out of range
    if (not UnitIsUnit("target", unit) or IsActionInRange(actionSlot) ~= 1) then 
      SMARTBUFF_RestoreTarget(unit, name);
      return 3;
    end
    
    id = SMARTBUFF_CheckUnitLevel(unit, id, levels);
    -- check if target is to low for this spell
    if (id == nil) then
      SMARTBUFF_RestoreTarget(unit, name);
      return 5;
    end
  end
  
  if (actionSlot ~= nil) then
    -- check if you have enough mana to cast
    local isUsable, notEnoughMana = IsUsableAction(actionSlot);
    if (notEnoughMana) then
      if (type == SMARTBUFF_CONST_GROUP or type == SMARTBUFF_CONST_FORCESELF) then
        SMARTBUFF_RestoreTarget(unit, name);
      end
      return 6;
    end
  end
  
  CastSpell(id, SMARTBUFF_BOOK_TYPE_SPELL);
  if (type == SMARTBUFF_CONST_GROUP or type == SMARTBUFF_CONST_FORCESELF) then
    SMARTBUFF_RestoreTarget(unit, name);
  end
  if (SpellIsTargeting()) then 
    SpellStopTargeting();
    return 10;
  end
  
  return 0;
end
-- END SMARTBUFF_doCast


-- target management
function SMARTBUFF_RestoreTarget(oldTarget, oldTargetWasPlayer)
  if (oldTarget) then
  	SmartBuff_InhibitTargetCasting();
  	if (oldTargetWasPlayer) then
  		TargetByName(oldTarget, true);
  	else
  		TargetLastTarget();
  	end
	  SmartBuff_RestoreTargetCasting();
  end
end

function SMARTBUFF_RestoreTarget_OLD(unit, name)
  if (unit and unit == "target") then
    TargetUnit(unit);
  elseif (name) then
    TargetUnit("playertarget");
  else
    ClearTarget();
  end
end

function SmartBuff_InhibitTargetCasting()
	if (not SMARTBUFF_Options) then return; end
	
	if (SMARTBUFF_Options.OldTargetSwitch == nil) then
		SMARTBUFF_Options.OldTargetSwitch = SMARTBUFF_Options.TargetSwitch;
	end
end

function SmartBuff_RestoreTargetCasting()
	if (not SMARTBUFF_Options) then return; end
	
	if (SMARTBUFF_Options.OldTargetSwitch ~= nil) then
		SMARTBUFF_Options.TargetSwitch = SMARTBUFF_Options.OldTargetSwitch;
		SMARTBUFF_Options.OldTargetSwitch = nil;
	end
end
-- END target management


-- returns if the unit is the player
function SMARTBUFF_IsPlayer(unit)
  local b = false;
  if (unit and UnitName(unit) == sPlayerName and (UnitCreatureType(unit) == SMARTBUFF_HUMANOID or (sPlayerClass == "DRUID" and UnitCreatureType(unit) == SMARTBUFF_BEAST))) then
    --SMARTBUFF_AddMsgD("is player");
    b = true;
  end
  return b;
end
-- END SMARTBUFF_IsPlayer


-- Will return the name of the buff to cast
function SMARTBUFF_CheckUnitBuffs(unit, buffS, iconS, buffG, iconG) 
  local index = 0;
  local bIndex = 0;
  local buff = nil;
  local icon = nil;
  local s = "";
  local b = false;
  local i = 0;
  local pat = "";
  local pattern = "";
  local isPlayer = false;
  
  if (cPatterns ~= nil) then
    for i, pat in cPatterns do
      if (string.find(buffS, pat)) then
        pattern = pat;
        b = true;
        break;
      end
    end
  end
  
  if (SMARTBUFF_IsPlayer(unit)) then
    isPlayer = true;
    index = 0;
  else
    index = 1;
  end
 
  while (index <= maxBuffs) do
    icon = nil;
    if (isPlayer) then
      bIndex, _ = GetPlayerBuff(index, "HELPFUL|PASSIVE");
      if (bIndex >= 0) then
        icon = GetPlayerBuffTexture(bIndex)
      end
    else
      bIndex = index;
      icon = UnitBuff(unit, bIndex);
    end
      	  
  	if (icon) then
      buff = SMARTBUFF_GetBuffName(unit, bIndex, 1);
      if (buff and buffS) then
        --SMARTBUFF_AddMsgD(UnitName(unit) .. ": " .. bIndex .. ". " .. buff .. " - " .. icon, 0, 1, 0.5);
        
        if (b and string.find(buff, pattern)) then
          return nil, bIndex, buffS;
        end

        --if (string.find(buffS, buff)) then
        if (string.lower(buffS) == string.lower(buff)) then
          -- BuffS found
          return nil, bIndex, buffS;
        --elseif (buffG ~= nil and string.find(buffG, buff)) then
        elseif (buffG ~= nil and string.lower(buffG) == string.lower(buff)) then
          -- BuffG found
          return nil, bIndex, buffG;
        end
      else
        --SMARTBUFF_AddMsgD(UnitName(unit) .. " " .. index .. ". " .. icon, 0, 1, 0.5);
        --if (icon == iconS or icon == iconG) then
          --SMARTBUFF_AddMsgD("Buff found: " .. buff);
          -- Buff found
          --return nil;
        --end      
      end
    end
    index = index + 1;
  end
  -- Buff not found, return default buff
  return buffS, nil, nil;
end
-- END SMARTBUFF_CheckUnitBuffs


-- Will return the lower Id of the spell, if the unit level is lower
function SMARTBUFF_CheckUnitLevel(unit, spellId, spellLevels)
  if (spellLevels == nil or spellId == nil) then
    return spellId;
  end
  
  local Id = spellId;
  local uLevel = UnitLevel(unit);
  local spellName, sRank = GetSpellName(Id, SMARTBUFF_BOOK_TYPE_SPELL);
  if (sRank == nil or sRank == "") then 
    sRank = "Rank 1";
  end
  local _, _, spellRank = string.find(sRank, "(%d+)");
  
  spellRank = tonumber(spellRank);
  --SMARTBUFF_AddMsgD(spellName .. sRank .. ":" .. spellRank);
  
  i = spellRank;
  while (i >= 1) do
    if (uLevel >= (spellLevels[i] - 10)) then
      break;
    end
    i = i - 1;
  end
  
  if (i > 0) then
    Id = Id - (spellRank - i);
    --SMARTBUFF_AddMsgD(uLevel .. " " .. spellName .. " Rank " .. i .. " - ID = " .. Id);
  else
    Id = nil;
    --SMARTBUFF_AddMsgD(spellName .. ": no rank available for this level");
  end;
  
  return Id, i;
end
-- END SMARTBUFF_CheckUnitLevel


-- Will return the name/description of the buff 
function SMARTBUFF_GetBuffName(unit, buffIndex, line)
	local i = buffIndex;
	local name = nil;

  if (i < 0 or i > maxBuffs) then
    return nil;
  end	  
	SmartBuffTooltip:SetOwner(SmartBuffFrame, "ANCHOR_NONE");
	SmartBuffTooltip:ClearLines();
  if (SMARTBUFF_IsPlayer(unit)) then
    SmartBuffTooltip:SetPlayerBuff(i);
  else
    SmartBuffTooltip:SetUnitBuff(unit, i);
  end  
	local obj = getglobal("SmartBuffTooltipTextLeft" .. line);
  name = obj:GetText();
	return name;
end
-- END SMARTBUFF_GetBuffName


-- Checks if the player is mounted
function SMARTBUFF_IsMounted()
  local found = false;
  local id = 0;
  local bIndex = nil;
  local buff = nil;
  while (id < 16) do
    bIndex, _ = GetPlayerBuff(id, "HELPFUL|PASSIVE");
    if (bIndex >= 0) then
      icon = GetPlayerBuffTexture(bIndex);
      buff = SMARTBUFF_GetBuffName("player", bIndex, 2);
      --if (buff and icon) then SMARTBUFF_AddMsgD(id .. ". " .. buff .. " - " .. icon); end
      if (buff and icon and string.find(buff, SMARTBUFF_MOUNT)) then
        --SMARTBUFF_AddMsgD("Mounted: " .. buff);
        found = true;
        break;
      end
    end
    id = id + 1;
  end
  return found;
end
-- END Checks if the player is mounted


-- IsFeignDeath(unit)
function SMARTBUFF_IsFeignDeath(unit)
	for i = 1, 20 do
		local buff = UnitBuff(unit, i);
		if (buff) then
			if (strfind(strlower(buff), "feigndeath")) then
				return true;
			end
		else
			break;
		end
	end
end
-- END SMARTBUFF_IsFeignDeath


-- Returns the number of a reagent currently in player's bag
function SMARTBUFF_CountReagent(reagent)
  if (reagent == nil) then return 99; end
	local n = 0;
	local bag = 0;
	local slot = 0;
	for bag = 0, NUM_BAG_FRAMES do
		for slot = 1, GetContainerNumSlots(bag) do
		local itemName = GetContainerItemLink(bag, slot);
			if itemName then
				if string.find(itemName, "%[" .. reagent .. "%]") then
					local texture, count = GetContainerItemInfo(bag, slot);
					n = n + count;
				end
			end
		end
	end
	return n;
end

function SMARTBUFF_FindReagent(reagent)
  if (reagent == nil) then return 99; end
	local n = 0;
	local bag = 0;
	local slot = 0;
	for bag = 0, NUM_BAG_FRAMES do
		for slot = 1, GetContainerNumSlots(bag) do
		local itemName = GetContainerItemLink(bag, slot);
			if itemName then
				if string.find(itemName, "%[" .. reagent .. "%]") then
					local texture, count = GetContainerItemInfo(bag, slot);
          return bag, slot, count, texture;
				end
			end
		end
	end
	return nil, nil, 0, nil;
end
-- END Reagent functions


function SMARTBUFF_CheckLocation()
  local posX, posY = GetPlayerMapPosition("player");
  local zone = "";
  local i = 0;
  local tmp = "";
  
  if (posX == 0 and posY == 0) then
    zone = GetRealZoneText();
    SMARTBUFF_AddMsgD("Current zone: " .. zone .. " - last zone: " .. sLastInstance);
    if (zone ~= sLastInstance) then
      if (SMARTBUFF_Options.AutoSwitchTemplate) then
        i = 1;
        for _ in SMARTBUFF_INSTANCES do
          if (string.find(zone, SMARTBUFF_INSTANCES[i])) then
            break;
          end
          i = i + 1;
        end
        if     (i == 1) then tmp = SMARTBUFF_TEMPLATES[5];
        elseif (i == 2) then tmp = SMARTBUFF_TEMPLATES[6];
        elseif (i == 3) then tmp = SMARTBUFF_TEMPLATES[7];
        elseif (i == 4) then tmp = SMARTBUFF_TEMPLATES[8];
        elseif (i == 5) then tmp = SMARTBUFF_TEMPLATES[9];
        elseif (i == 6 or i == 7 or i == 8) then tmp = SMARTBUFF_TEMPLATES[4];
        else tmp = nil;
        end
        
        if (tmp and currentTemplate ~= tmp) then
          SMARTBUFF_AddMsg(SMARTBUFF_OFT_AUTOSWITCHTMP .. ": " .. currentTemplate .. " -> " .. tmp); 
          currentTemplate = tmp;
          sLastInstance = zone;
          SMARTBUFF_SetBuffs();
        end
      end
    end
  else
    sLastInstance = "";
  end
  isSetZone = false;
end


function SMARTBUFF_ResetBuffTimers(mode)
  if (not isInit) then return; end
  
  local ct = currentTemplate;
  local t = GetTime();
  local rbTime = 0;
  local i = 0;
  local d = 0;
  local buffS = nil;
  
  for unit in cBuffTimer do
    for buff in cBuffTimer[unit] do
      if (unit ~= nil and buff ~= nil and cBuffTimer[unit][buff] ~= nil) then        

        i = 1;
        d = -1;
        buffS = nil;
        while (cBuffs[i] and cBuffs[i].BuffS) do
          if (cBuffs[i].BuffS == buff and cBuffs[i].DurationS > 0) then
            d = cBuffs[i].DurationS;
            buffS = cBuffs[i].BuffS;
            break;
          elseif (cBuffs[i].BuffG == buff and cBuffs[i].DurationG > 0) then
            d = cBuffs[i].DurationG;
            buffS = cBuffs[i].BuffS;
            break;
          end
          i = i + 1;
        end
        
        if (buffS and SMARTBUFF_Buffs[ct][buffS] ~= nil) then
          if (d > 0) then
            rbTime = SMARTBUFF_Buffs[ct][buffS].RBTime;
            if (rbTime <= 0) then
              rbTime = SMARTBUFF_Options.RebuffTimer;
            end          
            SMARTBUFF_AddMsgD("Buff: " .. buff .. ", time left: " .. (t - d) .. ", rebuff time: " .. rbTime);
            --SMARTBUFF_AddMsgD("Buff: " .. buff .. ", time left: " .. cBuffTimer[unit][buff] .. ", rebuff time: " .. rbTime);
            if (mode == 0) then
              cBuffTimer[unit][buff] = t - d + rbTime - 1;
            end
          else
            SMARTBUFF_AddMsgD("Removed: " .. buff);
            cBuffTimer[unit][buff] = nil;
          end
        end
        
      end
    end
  end
  
end


-- Bool helper functions
function SMARTBUFF_toggleBool(b, msg)
  if (not b or b == nil) then
    b = true;
    SMARTBUFF_AddMsg(SMARTBUFF_TITLE .. ": " .. msg .. GR .. "On");
  else
    b = false
    SMARTBUFF_AddMsg(SMARTBUFF_TITLE .. ": " .. msg .. RD .."Off");
  end
  return b;
end

function SMARTBUFF_BoolState(b, msg)
  if (b) then
    SMARTBUFF_AddMsg(SMARTBUFF_TITLE .. ": " .. msg .. GR .. "On");
  else
    SMARTBUFF_AddMsg(SMARTBUFF_TITLE .. ": " .. msg .. RD .."Off");
  end
end
-- END Bool helper functions


-- Sets the correct icon on the minimapbutton
function SMARTBUFF_CheckMiniMapButton()
  if (SMARTBUFF_Options.Toggle) then
    SmartBuffOptionsMiniMapButton:SetNormalTexture(imgIconOn);
	else
    SmartBuffOptionsMiniMapButton:SetNormalTexture(imgIconOff);
	end
	
	if (SMARTBUFF_Options.HideMmButton) then
	  SmartBuffOptionsMiniMapButton:Hide();
	else
	  SmartBuffOptionsMiniMapButton:Show();
	end
end
-- END SMARTBUFF_CheckMiniMapButton


-- Init the SmartBuff variables
function SMARTBUFF_Options_Init()
  if (isInit) then return; end 

	sRealmName = GetCVar("RealmName");
	sPlayerName = UnitName("player");
	sID = sRealmName .. ":" .. sPlayerName;
  
  if (not SMARTBUFF_Buffs) then SMARTBUFF_Buffs = { }; end
  if (not SMARTBUFF_Options) then SMARTBUFF_Options = { }; end
	if (SMARTBUFF_Options.Toggle == nil) then	SMARTBUFF_Options.Toggle = true; end
	if (SMARTBUFF_Options.ToggleAuto == nil) then	SMARTBUFF_Options.ToggleAuto = true; end
	if (SMARTBUFF_Options.AutoTimer == nil) then	SMARTBUFF_Options.AutoTimer = 20; end
	if (SMARTBUFF_Options.BlacklistTimer == nil) then	SMARTBUFF_Options.BlacklistTimer = 15; end
	if (SMARTBUFF_Options.ToggleAutoCombat == nil) then	SMARTBUFF_Options.ToggleAutoCombat = false; end
  if (SMARTBUFF_Options.ToggleAutoChat == nil) then	SMARTBUFF_Options.ToggleAutoChat = false; end
  if (SMARTBUFF_Options.ToggleAutoSplash == nil) then	SMARTBUFF_Options.ToggleAutoSplash = true; end
  if (SMARTBUFF_Options.ToggleAutoSound == nil) then	SMARTBUFF_Options.ToggleAutoSound = false; end
  if (SMARTBUFF_Options.ToggleCheckCharges == nil) then	SMARTBUFF_Options.ToggleCheckCharges = true; end
  if (SMARTBUFF_Options.ToggleAutoRest == nil) then	SMARTBUFF_Options.ToggleAutoRest = true; end
  
	if (SMARTBUFF_Options.BuffTarget == nil) then	SMARTBUFF_Options.BuffTarget = false; end
	if (SMARTBUFF_Options.BuffPvP == nil) then	SMARTBUFF_Options.BuffPvP = false; end
	if (SMARTBUFF_Options.BuffInCities == nil) then	SMARTBUFF_Options.BuffInCities = false; end
	if (SMARTBUFF_Options.AdvGrpBuffCheck == nil) then	SMARTBUFF_Options.AdvGrpBuffCheck = false; end
	if (SMARTBUFF_Options.AdvGrpBuffRange == nil) then	SMARTBUFF_Options.AdvGrpBuffRange = true; end
	if (SMARTBUFF_Options.ScrollWheel == nil) then	SMARTBUFF_Options.ScrollWheel = true; end
	if (SMARTBUFF_Options.TargetSwitch == nil) then	SMARTBUFF_Options.TargetSwitch = true; end
	if (SMARTBUFF_Options.AutoSwitchTemplate == nil) then	SMARTBUFF_Options.AutoSwitchTemplate = false; end
	if (SMARTBUFF_Options.AutoSwitchTemplateInst == nil) then	SMARTBUFF_Options.AutoSwitchTemplateInst = false; end
	
	if (SMARTBUFF_Options.CTRASync == nil) then	SMARTBUFF_Options.CTRASync = true; end
	
	if (SMARTBUFF_Options.ToggleGrp == nil) then	SMARTBUFF_Options.ToggleGrp = {true, false, false, false, false, false, false, false}; end
	if (SMARTBUFF_Options.ToggleSubGrpChanged == nil) then	SMARTBUFF_Options.ToggleSubGrpChanged = false; end
	if (SMARTBUFF_Options.ToggleMsgNormal == nil) then	SMARTBUFF_Options.ToggleMsgNormal = false; end
	if (SMARTBUFF_Options.ToggleMsgWarning == nil) then	SMARTBUFF_Options.ToggleMsgWarning = false; end
	if (SMARTBUFF_Options.ToggleMsgError == nil) then	SMARTBUFF_Options.ToggleMsgError = false; end
	if (SMARTBUFF_Options.HideMmButton == nil) then	SMARTBUFF_Options.HideMmButton = false; end
	if (SMARTBUFF_Options.RebuffTimer == nil) then	SMARTBUFF_Options.RebuffTimer = 20; end
	if (SMARTBUFF_Options.AutoSwitchTemplate == nil) then	SMARTBUFF_Options.AutoSwitchTemplate = false; end
	if (SMARTBUFF_Options.MinCharges == nil) then	SMARTBUFF_Options.MinCharges = 3; end
	if (sPlayerClass == "SHAMAN" or sPlayerClass == "PRIEST") then
	  SMARTBUFF_Options.MinCharges = 1;
	else
	  SMARTBUFF_Options.MinCharges = 3;
	end
	
	if (SMARTBUFF_Options.LastTemplate == nil) then	SMARTBUFF_Options.LastTemplate = SMARTBUFF_TEMPLATES[1]; end
	local i = 1;
	local b = false;
	while (SMARTBUFF_TEMPLATES[i] ~= nil) do
	  if (SMARTBUFF_TEMPLATES[i] == SMARTBUFF_Options.LastTemplate) then
	    b = true;
	    break;
	  end
	  i = i + 1;
	end
  if (not b) then 
    SMARTBUFF_Options.LastTemplate = SMARTBUFF_TEMPLATES[1];
  end
	currentTemplate = SMARTBUFF_Options.LastTemplate;
	
	if (SMARTBUFF_Options.GrpBuffSize == nil) then	SMARTBUFF_Options.GrpBuffSize = 4; end
	
	if (SMARTBUFF_Options.SplashX == nil) then SMARTBUFF_Options.SplashX = 100; end
	if (SMARTBUFF_Options.SplashY == nil) then SMARTBUFF_Options.SplashY = -100; end
	if (SMARTBUFF_Options.CurrentFont == nil) then SMARTBUFF_Options.CurrentFont = 1; end
	iCurrentFont = SMARTBUFF_Options.CurrentFont;
	SMARTBUFF_Splash_ChangeFont(0);
	  
  if (SMARTBUFF_Options.FirstStart == nil) then SMARTBUFF_Options.FirstStart = "V0";	end
  if (SMARTBUFF_Options.Debug == nil) then SMARTBUFF_Options.Debug = false;	end 
  
	
	-- support for Cosmos
	if(Cosmos_RegisterButton) then
		Cosmos_RegisterButton(
			SMARTBUFF_VERS_TITLE,
			SMARTBUFF_SUBTITLE,
			SMARTBUFF_DESC,
			"Interface\\Icons\\Spell_Nature_Purge",
			SMARTBUFF_OptionsFrame_Toggle);
	end	

	-- support for CTMod
	if(CT_RegisterMod) then
		CT_RegisterMod(
			SMARTBUFF_VERS_TITLE,
			SMARTBUFF_SUBTITLE,
			5,
			"Interface\\Icons\\Spell_Nature_Purge",
			SMARTBUFF_DESC,
			"switch",
			"",
			SMARTBUFF_OptionsFrame_Toggle);
	end
	
	SMARTBUFF_CheckMiniMapButton();
	SMARTBUFF_Splash_Hide();
	--SMARTBUFF_Options_OnHide();
	
	SMARTBUFF_AddMsg(SMARTBUFF_VERS_TITLE .. " " .. SMARTBUFF_MSG_LOADED, true);
  SMARTBUFF_AddMsg("/sb menu - " .. SMARTBUFF_OFT_MENU, true);
	isInit = true;
	
	if (SMARTBUFF_Options.FirstStart ~= SMARTBUFF_VERSION) then
	  SMARTBUFF_Options.FirstStart = SMARTBUFF_VERSION;
	  SMARTBUFF_OptionsFrame_Open(true);
	else
	  SMARTBUFF_SetBuffs();
	end
  SMARTBUFF_SetUnits();
end
-- END SMARTBUFF_Options_Init


-- SmartBuff commandline menu
function SMARTBUFF_command(msg)
  if(msg == "toggle" or msg == "t") then
    SMARTBUFF_OToggle();
    SMARTBUFF_SetUnits();
  elseif (msg == "menu") then
    SMARTBUFF_OptionsFrame_Toggle();
  elseif (msg == "rbt") then
    SMARTBUFF_ResetBuffTimers(0);
  elseif (msg == "sbt") then
    SMARTBUFF_ResetBuffTimers(1);
  elseif (msg == "target") then
    if (SMARTBUFF_PreCheck(0)) then
      SMARTBUFF_checkBlacklist();
      SMARTBUFF_BuffUnit("target", 0, 0);
    end     
  elseif (msg == "help" or msg == "?") then
    SMARTBUFF_AddMsg(SMARTBUFF_VERS_TITLE, true);
    SMARTBUFF_AddMsg("Syntax: /sb [command] or /smartbuff [command]", true);
    SMARTBUFF_AddMsg("toggle  -  " .. SMARTBUFF_OFT, true);
    SMARTBUFF_AddMsg("menu     -  " .. SMARTBUFF_OFT_MENU, true);
    SMARTBUFF_AddMsg("target  -  " .. SMARTBUFF_OFT_TARGET, true);
    SMARTBUFF_AddMsg("rbt      -  " .. "Reset buff timers", true);
  
  elseif (msg == "debug") then
    SMARTBUFF_Options.Debug = SMARTBUFF_toggleBool(SMARTBUFF_Options.Debug, "Debug active = ");  
  elseif (msg == "open") then
    SMARTBUFF_OptionsFrame_Open(true);
  elseif (msg == "reload") then
    SMARTBUFF_Options_ReloadSubGroups();
  else
    SMARTBUFF_Check(0);
  end
end
-- END SMARTBUFF_command


-- SmartBuff options toggle
function SMARTBUFF_OToggle()
  SMARTBUFF_Options.Toggle = SMARTBUFF_toggleBool(SMARTBUFF_Options.Toggle, "Active = ");
  SMARTBUFF_CheckMiniMapButton();
  if (SMARTBUFF_Options.Toggle) then
    SMARTBUFF_SetUnits();
  end
end

function SMARTBUFF_OToggleAuto()
  SMARTBUFF_Options.ToggleAuto = not SMARTBUFF_Options.ToggleAuto;
end
function SMARTBUFF_OToggleAutoCombat()
  SMARTBUFF_Options.ToggleAutoCombat = not SMARTBUFF_Options.ToggleAutoCombat;
end
function SMARTBUFF_OToggleAutoChat()
  SMARTBUFF_Options.ToggleAutoChat = not SMARTBUFF_Options.ToggleAutoChat;
end
function SMARTBUFF_OToggleAutoSplash()
  SMARTBUFF_Options.ToggleAutoSplash = not SMARTBUFF_Options.ToggleAutoSplash;
end
function SMARTBUFF_OToggleAutoSound()
  SMARTBUFF_Options.ToggleAutoSound = not SMARTBUFF_Options.ToggleAutoSound;
end
function SMARTBUFF_OToggleCheckCharges()
  SMARTBUFF_Options.ToggleCheckCharges = not SMARTBUFF_Options.ToggleCheckCharges;
end
function SMARTBUFF_OToggleAutoRest()
  SMARTBUFF_Options.ToggleAutoRest = not SMARTBUFF_Options.ToggleAutoRest;
end

function SMARTBUFF_OAutoSwitchTmp()
  SMARTBUFF_Options.AutoSwitchTemplate = not SMARTBUFF_Options.AutoSwitchTemplate;
end
function SMARTBUFF_OAutoSwitchTmpInst()
  SMARTBUFF_Options.AutoSwitchTemplateInst = not SMARTBUFF_Options.AutoSwitchTemplateInst;
end

function SMARTBUFF_OBuffTarget()
  SMARTBUFF_Options.BuffTarget = not SMARTBUFF_Options.BuffTarget;
end

function SMARTBUFF_OBuffPvP()
  SMARTBUFF_Options.BuffPvP = not SMARTBUFF_Options.BuffPvP;
end

function SMARTBUFF_OBuffInCities()
  SMARTBUFF_Options.BuffInCities = not SMARTBUFF_Options.BuffInCities;
end

function SMARTBUFF_OAdvGrpBuffCheck()
  SMARTBUFF_Options.AdvGrpBuffCheck = not SMARTBUFF_Options.AdvGrpBuffCheck;
end
function SMARTBUFF_OAdvGrpBuffRange()
  SMARTBUFF_Options.AdvGrpBuffRange = not SMARTBUFF_Options.AdvGrpBuffRange;
end

function SMARTBUFF_OScrollWheel()
  SMARTBUFF_Options.ScrollWheel = not SMARTBUFF_Options.ScrollWheel;
end
function SMARTBUFF_OTargetSwitch()
  SMARTBUFF_Options.TargetSwitch = not SMARTBUFF_Options.TargetSwitch;
end

function SMARTBUFF_OToggleGrp(i)
  SMARTBUFF_Options.ToggleGrp[i] = not SMARTBUFF_Options.ToggleGrp[i];
end

function SMARTBUFF_OToggleSubGrpChanged()
  SMARTBUFF_Options.ToggleSubGrpChanged = not SMARTBUFF_Options.ToggleSubGrpChanged;
end

function SMARTBUFF_OToggleMsgNormal()
  SMARTBUFF_Options.ToggleMsgNormal = not SMARTBUFF_Options.ToggleMsgNormal;
end
function SMARTBUFF_OToggleMsgWarning()
  SMARTBUFF_Options.ToggleMsgWarning = not SMARTBUFF_Options.ToggleMsgWarning;
end
function SMARTBUFF_OToggleMsgError()
  SMARTBUFF_Options.ToggleMsgError = not SMARTBUFF_Options.ToggleMsgError;
end

function SMARTBUFF_OHideMmButton()
  SMARTBUFF_Options.HideMmButton = not SMARTBUFF_Options.HideMmButton;
  SMARTBUFF_CheckMiniMapButton();
end

function SMARTBUFF_OToggleCTRASync()
  SMARTBUFF_Options.CTRASync = not SMARTBUFF_Options.CTRASync;
end

function SMARTBUFF_OSelfFirst()
  SMARTBUFF_Buffs[currentTemplate].SelfFirst = not SMARTBUFF_Buffs[currentTemplate].SelfFirst;
end

function SMARTBUFF_OToggleBuff(s, i)
  local name = cBuffs[i].BuffS;  
  if (name == nil) then
    return;
  end
  
  if (s == "S") then
    SMARTBUFF_Buffs[currentTemplate][name].EnableS = not SMARTBUFF_Buffs[currentTemplate][name].EnableS;
    if (SMARTBUFF_Buffs[currentTemplate][name].EnableS) then
      SmartBuff_BuffSetup_Show(i);
    else
      SmartBuff_BuffSetup:Hide();
      iLastBuffSetup = -1;
    end
  elseif (s == "G") then
    SMARTBUFF_Buffs[currentTemplate][name].EnableG = not SMARTBUFF_Buffs[currentTemplate][name].EnableG;
  end
  
end

function SMARTBUFF_OToggleDebug()
  SMARTBUFF_Options.Debug = not SMARTBUFF_Options.Debug;
end

function SMARTBUFF_OptionsFrame_Toggle()
  if (not isInit) then return; end
	if(SmartBuffOptionsFrame:IsVisible()) then
    if(iLastBuffSetup > 0) then
      SmartBuff_BuffSetup:Hide();
      iLastBuffSetup = -1;
    end	
		SmartBuffOptionsFrame:Hide();
	else
		SmartBuffOptionsFrame:Show();
	end
end

function SMARTBUFF_OptionsFrame_Open(force)
  if (not isInit) then return; end
	if(not SmartBuffOptionsFrame:IsVisible() or force) then
		SmartBuffOptionsFrame:Show();
	end
end

function SmartBuff_BuffSetup_Show(i)
  local icon1 = cBuffs[i].IconS;
  local icon2 = cBuffs[i].IconG;
  local name = cBuffs[i].BuffS;
  local text = cBuffs[i].TextS;
  local btype = cBuffs[i].Type;
  local hidden = true;
  local n = 0;

  if (name == nil or btype == SMARTBUFF_CONST_TRACK) then
    SmartBuff_BuffSetup:Hide();
    iLastBuffSetup = -1;
    return;
  end
  
	if(SmartBuff_BuffSetup:IsVisible() and i == iLastBuffSetup) then
		SmartBuff_BuffSetup:Hide();
		iLastBuffSetup = -1;
		return;
	else	
	  if (btype == SMARTBUFF_CONST_GROUP) then
      hidden = false;
    end
    
    if (icon2 and SMARTBUFF_Buffs[currentTemplate][name].EnableG) then
      SmartBuff_BuffSetup_BuffIcon2:SetNormalTexture(icon2);
      SmartBuff_BuffSetup_BuffIcon2:Show();
    else
      SmartBuff_BuffSetup_BuffIcon2:Hide();
    end
    if (icon1) then
      SmartBuff_BuffSetup_BuffIcon1:SetNormalTexture(icon1);
      if (icon2 and SMARTBUFF_Buffs[currentTemplate][name].EnableG) then
        SmartBuff_BuffSetup_BuffIcon1:SetPoint("TOPLEFT", 44, -30);
      else
        SmartBuff_BuffSetup_BuffIcon1:SetPoint("TOPLEFT", 64, -30);
      end
      SmartBuff_BuffSetup_BuffIcon1:Show();
    else
      SmartBuff_BuffSetup_BuffIcon1:SetPoint("TOPLEFT", 24, -30);
      SmartBuff_BuffSetup_BuffIcon1:Hide();
    end
    
    local obj = getglobal(SmartBuff_BuffSetup_BuffText:GetName().."Text");
    if (name and text) then
      obj:SetText(name);
      SMARTBUFF_BUFFTEXT = name .. "\n" .. text;
      --SMARTBUFF_AddMsgD(name .. "\n" .. text);
    elseif (name) then
      obj:SetText(name);
      SMARTBUFF_BUFFTEXT = name;
      --SMARTBUFF_AddMsgD(name);
    else
      obj:SetText("");
      SMARTBUFF_BUFFTEXT = " ";
    end
    
		SmartBuff_BuffSetup_cbSelf:SetChecked(SMARTBUFF_Buffs[currentTemplate][name].SelfOnly);
		SmartBuff_BuffSetup_cbCombatIn:SetChecked(SMARTBUFF_Buffs[currentTemplate][name].CIn);
		SmartBuff_BuffSetup_cbCombatOut:SetChecked(SMARTBUFF_Buffs[currentTemplate][name].COut);
		SmartBuff_BuffSetup_cbMH:SetChecked(SMARTBUFF_Buffs[currentTemplate][name].MH);
		SmartBuff_BuffSetup_cbOH:SetChecked(SMARTBUFF_Buffs[currentTemplate][name].OH);
		SmartBuff_BuffSetup_cbReminder:SetChecked(SMARTBUFF_Buffs[currentTemplate][name].Reminder);
    
    --SMARTBUFF_AddMsgD("Test Buff setup show 1");
		
		SmartBuff_BuffSetup_RBTime:SetValue(SMARTBUFF_Buffs[currentTemplate][name].RBTime);
		if (cBuffs[i].DurationS > 0) then
		  SmartBuff_BuffSetup_RBTime:SetMinMaxValues(0, cBuffs[i].DurationS);
      getglobal(SmartBuff_BuffSetup_RBTime:GetName().."High"):SetText(cBuffs[i].DurationS);
		  if (cBuffs[i].DurationS <= 60) then
		    SmartBuff_BuffSetup_RBTime:SetValueStep(1);
      elseif (cBuffs[i].DurationS <= 180) then
        SmartBuff_BuffSetup_RBTime:SetValueStep(5);
      elseif (cBuffs[i].DurationS <= 600) then
        SmartBuff_BuffSetup_RBTime:SetValueStep(10);
		  else
		    SmartBuff_BuffSetup_RBTime:SetValueStep(30);
		  end
		  getglobal(SmartBuff_BuffSetup_RBTime:GetName().."Text"):SetText(SMARTBUFF_Buffs[currentTemplate][name].RBTime .. "\nsec");
		  SmartBuff_BuffSetup_RBTime:Show();
		else
		  SmartBuff_BuffSetup_RBTime:Hide();
		end
    --SMARTBUFF_AddMsgD("Test Buff setup show 2");
		
		if (cBuffs[i].Type == SMARTBUFF_CONST_INV) then
      SmartBuff_BuffSetup_cbMH:Show();
      SmartBuff_BuffSetup_cbOH:Show();
    else
      SmartBuff_BuffSetup_cbMH:Hide();
      SmartBuff_BuffSetup_cbOH:Hide();
    end
    
    if (cBuffs[i].Type == SMARTBUFF_CONST_GROUP) then
      SmartBuff_BuffSetup_cbSelf:Show();
    else
      SmartBuff_BuffSetup_cbSelf:Hide();
    end
  
    local cb = nil;
		local btn = nil;
		n = 1;
		for _ in cClasses do
		  cb = getglobal("SmartBuff_BuffSetup_cbClass"..n);
		  btn = getglobal("SmartBuff_BuffSetup_ClassIcon"..n);
		  if (hidden) then 
		    cb:Hide();
		    btn:Hide();
		  else
		    cb:SetChecked(SMARTBUFF_Buffs[currentTemplate][name][cClasses[n]]);
		    cb:Show();
		    btn:Show();
		  end
		  n = n + 1;
		end
    iLastBuffSetup = i;
    --SMARTBUFF_AddMsgD("Test Buff setup show 3");
 		SmartBuff_BuffSetup:Show();
	end  
end

function SmartBuff_BuffSetup_OnClick()
  local i = iLastBuffSetup;
  local ct = currentTemplate;
  if (i <= 0) then
    return;
  end
  local name = cBuffs[i].BuffS;  
 
	SMARTBUFF_Buffs[ct][name].SelfOnly = SmartBuff_BuffSetup_cbSelf:GetChecked();
	SMARTBUFF_Buffs[ct][name].CIn  = SmartBuff_BuffSetup_cbCombatIn:GetChecked();
	SMARTBUFF_Buffs[ct][name].COut = SmartBuff_BuffSetup_cbCombatOut:GetChecked();
	SMARTBUFF_Buffs[ct][name].MH = SmartBuff_BuffSetup_cbMH:GetChecked();
	SMARTBUFF_Buffs[ct][name].OH = SmartBuff_BuffSetup_cbOH:GetChecked();
	SMARTBUFF_Buffs[ct][name].Reminder = SmartBuff_BuffSetup_cbReminder:GetChecked();
	
	SMARTBUFF_Buffs[ct][name].RBTime = SmartBuff_BuffSetup_RBTime:GetValue();
	getglobal(SmartBuff_BuffSetup_RBTime:GetName().."Text"):SetText(SMARTBUFF_Buffs[ct][name].RBTime .. "\nsec");
  
	if (cBuffs[i].Type == SMARTBUFF_CONST_GROUP) then
	  local n = 1;
	  local cb = nil;
	  for _ in cClasses do
		  cb = getglobal("SmartBuff_BuffSetup_cbClass"..n);
		  SMARTBUFF_Buffs[ct][name][cClasses[n]] = cb:GetChecked();
		  n = n + 1;
	  end
	end
  --SMARTBUFF_AddMsgD("Buff setup saved");
end

function SmartBuff_BuffSetup_ToolTip(mode)
  local i = iLastBuffSetup;
  if (i <= 0) then
    return;
  end
  local ids = cBuffs[i].IDS;
  local idg = cBuffs[i].IDG;
  local btype = cBuffs[i].Type
  
  GameTooltip:ClearLines();
  if (btype == SMARTBUFF_CONST_INV) then
    local bag, slot, count, texture = SMARTBUFF_FindReagent(cBuffs[i].BuffS);
    if (bag and slot) then
      GameTooltip:SetBagItem(bag, slot);
    end
  else
    if (mode == 1 and ids) then
	    GameTooltip:SetSpell(ids, 1);
	  elseif (mode == 2 and idg) then
	    GameTooltip:SetSpell(idg, 1);
	  end
	end
	GameTooltip:Show();
end


-- END SmartBuff options toggle


-- Options Frame events
function SMARTBUFF_Options_OnLoad()
end

function SMARTBUFF_Options_OnShow()
  SmartBuffOptionsFrame_cbSB:SetChecked(SMARTBUFF_Options.Toggle);
  SmartBuffOptionsFrame_cbAuto:SetChecked(SMARTBUFF_Options.ToggleAuto);
  SmartBuffOptionsFrameAutoTimer:SetValue(SMARTBUFF_Options.AutoTimer);
  getglobal(SmartBuffOptionsFrameAutoTimer:GetName().."Text"):SetText(SMARTBUFF_OFT_AUTOTIMER.." "..SMARTBUFF_Options.AutoTimer.." sec");
  SmartBuffOptionsFrame_cbAutoCombat:SetChecked(SMARTBUFF_Options.ToggleAutoCombat);
  SmartBuffOptionsFrame_cbAutoChat:SetChecked(SMARTBUFF_Options.ToggleAutoChat);
  SmartBuffOptionsFrame_cbAutoSplash:SetChecked(SMARTBUFF_Options.ToggleAutoSplash);
  SmartBuffOptionsFrame_cbAutoSound:SetChecked(SMARTBUFF_Options.ToggleAutoSound);
  SmartBuffOptionsFrame_cbCheckCharges:SetChecked(SMARTBUFF_Options.ToggleCheckCharges);
  SmartBuffOptionsFrame_cbAutoRest:SetChecked(SMARTBUFF_Options.ToggleAutoRest);
  SmartBuffOptionsFrame_cbAutoSwitchTmp:SetChecked(SMARTBUFF_Options.AutoSwitchTemplate);
  SmartBuffOptionsFrame_cbAutoSwitchTmpInst:SetChecked(SMARTBUFF_Options.AutoSwitchTemplateInst);
  SmartBuffOptionsFrame_cbBuffPvP:SetChecked(SMARTBUFF_Options.BuffPvP);
  SmartBuffOptionsFrame_cbBuffTarget:SetChecked(SMARTBUFF_Options.BuffTarget);
  SmartBuffOptionsFrame_cbBuffInCities:SetChecked(SMARTBUFF_Options.BuffInCities);
  SmartBuffOptionsFrame_cbAdvancedGrpBuffCheck:SetChecked(SMARTBUFF_Options.AdvGrpBuffCheck);
  SmartBuffOptionsFrame_cbAdvancedGrpBuffRange:SetChecked(SMARTBUFF_Options.AdvGrpBuffRange);
  SmartBuffOptionsFrame_cbScrollWheel:SetChecked(SMARTBUFF_Options.ScrollWheel);
  SmartBuffOptionsFrame_cbTargetSwitch:SetChecked(SMARTBUFF_Options.TargetSwitch);
  SmartBuffOptionsFrame_cbSubGrpChanged:SetChecked(SMARTBUFF_Options.ToggleSubGrpChanged);
  SmartBuffOptionsFrame_cbMsgNormal:SetChecked(SMARTBUFF_Options.ToggleMsgNormal);
  SmartBuffOptionsFrame_cbMsgWarning:SetChecked(SMARTBUFF_Options.ToggleMsgWarning);
  SmartBuffOptionsFrame_cbMsgError:SetChecked(SMARTBUFF_Options.ToggleMsgError);
  SmartBuffOptionsFrame_cbHideMmButton:SetChecked(SMARTBUFF_Options.HideMmButton);
  SmartBuffOptionsFrame_cbCTRASync:SetChecked(SMARTBUFF_Options.CTRASync);
  
  SmartBuffOptionsFrameGrpBuffSize:SetValue(SMARTBUFF_Options.GrpBuffSize);
  getglobal(SmartBuffOptionsFrameGrpBuffSize:GetName().."Text"):SetText(SMARTBUFF_OFT_GRPBUFFSIZE.." "..SMARTBUFF_Options.GrpBuffSize);
  if (sPlayerClass == "PALADIN") then
    SmartBuffOptionsFrame_cbAdvancedGrpBuffCheck:Hide();
    SmartBuffOptionsFrameGrpBuffSize:Hide();
  end
  
  SmartBuffOptionsFrameRebuffTimer:SetValue(SMARTBUFF_Options.RebuffTimer);
  getglobal(SmartBuffOptionsFrameRebuffTimer:GetName().."Text"):SetText(SMARTBUFF_OFT_REBUFFTIMER.." "..SMARTBUFF_Options.RebuffTimer.." sec");

  SmartBuffOptionsFrameBLDuration:SetValue(SMARTBUFF_Options.BlacklistTimer);
  getglobal(SmartBuffOptionsFrameBLDuration:GetName().."Text"):SetText(SMARTBUFF_OFT_BLDURATION.." "..SMARTBUFF_Options.BlacklistTimer.." sec");

  SMARTBUFF_Options_ReloadSubGroups();
  SMARTBUFF_SetCheckButtonBuffs();
  
  SmartBuffOptionsFrame_cbSelfFirst:SetChecked(SMARTBUFF_Buffs[currentTemplate].SelfFirst);
  
  SMARTBUFF_Splash_Show();
  
  SMARTBUFF_AddMsgD("Option frame updated: " .. currentTemplate);
end

function SMARTBUFF_Options_ReloadSubGroups()
  SmartBuffOptionsFrame_cbGrp1:SetChecked(SMARTBUFF_Options.ToggleGrp[1]);
  SmartBuffOptionsFrame_cbGrp2:SetChecked(SMARTBUFF_Options.ToggleGrp[2]);
  SmartBuffOptionsFrame_cbGrp3:SetChecked(SMARTBUFF_Options.ToggleGrp[3]);
  SmartBuffOptionsFrame_cbGrp4:SetChecked(SMARTBUFF_Options.ToggleGrp[4]);
  SmartBuffOptionsFrame_cbGrp5:SetChecked(SMARTBUFF_Options.ToggleGrp[5]);
  SmartBuffOptionsFrame_cbGrp6:SetChecked(SMARTBUFF_Options.ToggleGrp[6]);
  SmartBuffOptionsFrame_cbGrp7:SetChecked(SMARTBUFF_Options.ToggleGrp[7]);
  SmartBuffOptionsFrame_cbGrp8:SetChecked(SMARTBUFF_Options.ToggleGrp[8]);
end

function SMARTBUFF_Options_OnHide()
  SmartBuff_BuffSetup:Hide();
  SMARTBUFF_SetUnits();
  SMARTBUFF_Splash_Hide();
end

function SmartBuffOptionsFrameSlider_OnLoad(low, high, step)
  if (this:GetOrientation() ~= "VERTICAL") then
    getglobal(this:GetName().."Low"):SetText(low);
  else
    getglobal(this:GetName().."Low"):SetText("");
  end
  getglobal(this:GetName().."High"):SetText(high);
	this:SetMinMaxValues(low, high);
	this:SetValueStep(step);
end

function SmartBuffOptionsFrameAutoTimer_OnValueChanged()
	SMARTBUFF_Options.AutoTimer = this:GetValue();
	getglobal(this:GetName().."Text"):SetText(SMARTBUFF_OFT_AUTOTIMER.." "..SMARTBUFF_Options.AutoTimer.." sec");
end

function SmartBuffOptionsFrameGrpBuffSize_OnValueChanged()
	SMARTBUFF_Options.GrpBuffSize = this:GetValue();
	getglobal(this:GetName().."Text"):SetText(SMARTBUFF_OFT_GRPBUFFSIZE.." "..SMARTBUFF_Options.GrpBuffSize);
end

function SmartBuffOptionsFrameRebuffTimer_OnValueChanged()
	SMARTBUFF_Options.RebuffTimer = this:GetValue();
	getglobal(this:GetName().."Text"):SetText(SMARTBUFF_OFT_REBUFFTIMER.." "..SMARTBUFF_Options.RebuffTimer.." sec");
end

function SmartBuff_BuffSetup_RBTime_OnValueChanged()
  getglobal(SmartBuff_BuffSetup_RBTime:GetName().."Text"):SetText(this:GetValue() .. "\nsec");
end

function SmartBuffOptionsFrameBLDuration_OnValueChanged()
	SMARTBUFF_Options.BlacklistTimer = this:GetValue();
	getglobal(this:GetName().."Text"):SetText(SMARTBUFF_OFT_BLDURATION.." "..SMARTBUFF_Options.BlacklistTimer.." sec");
end

function SMARTBUFF_SetCheckButtonBuffs() 
	local objS;
	local objG;
	local i = 1;
	
	SMARTBUFF_SetBuffs();
	while (i <= maxCheckButtons) do
    objS = getglobal("SmartBuffOptionsFrame_cbBuffS"..i);
    objG = getglobal("SmartBuffOptionsFrame_cbBuffG"..i);
	  if (cBuffs[i] and (cBuffs[i].IDS ~= nil or cBuffs[i].Type == SMARTBUFF_CONST_INV)) then
	    if (cBuffs[i].IDG ~= nil and objG ~= nil) then
	      getglobal(objS:GetName().."Text"):SetText("");
	      --getglobal(objG:GetName().."Text"):SetText(cBuffs[i].BuffS .. "\n" .. cBuffs[i].BuffG);
        getglobal(objG:GetName().."Text"):SetText(cBuffs[i].BuffS .. " / " .. SMARTBUFF_MSG_GROUP);
        
	      objG:SetChecked(SMARTBUFF_Buffs[currentTemplate][cBuffs[i].BuffS].EnableG);
	      objG:Show();
	    else
	      if (objG) then objG:Hide(); end
	      getglobal(objS:GetName().."Text"):SetText(cBuffs[i].BuffS);
	    end
      objS:SetChecked(SMARTBUFF_Buffs[currentTemplate][cBuffs[i].BuffS].EnableS);
      objS:Show();
	  else
	    if (objS) then objS:Hide(); end
	    if (objG) then objG:Hide(); end
	  end
	  i = i + 1;
	end
end


function SMARTBUFF_DropDownTemplate_OnShow()
  local i = 1;
	for _, tmp in SMARTBUFF_TEMPLATES do
    --SMARTBUFF_AddMsgD(i .. "." .. tmp);
	  if (tmp == currentTemplate) then
	    break;
	  end
    i = i + 1;
	end
	UIDropDownMenu_Initialize(this, SMARTBUFF_DropDownTemplate_Initialize);
	UIDropDownMenu_SetSelectedID(SmartBuffOptionsFrame_ddTemplates, i);
  UIDropDownMenu_SetWidth(135);
end

function SMARTBUFF_DropDownTemplate_Initialize()
	for k, v in SMARTBUFF_TEMPLATES do
		local info = {};
		info.text = SMARTBUFF_TEMPLATES[k];
		info.func = SMARTBUFF_DropDownTemplate_OnClick;
		UIDropDownMenu_AddButton(info);
	end
end

function SMARTBUFF_DropDownTemplate_OnClick()
  local i = this:GetID();
  local tmp = nil;
	UIDropDownMenu_SetSelectedID(SmartBuffOptionsFrame_ddTemplates, i);
	tmp = SMARTBUFF_TEMPLATES[i];
	--SMARTBUFF_AddMsgD("Selected/Current Buff-Template: " .. tmp .. "/" .. currentTemplate);
	if (currentTemplate ~= tmp) then
    SmartBuff_BuffSetup:Hide();
    iLastBuffSetup = -1;
    
	  currentTemplate = tmp;
	  SMARTBUFF_Options_OnShow();
	  SMARTBUFF_Options.LastTemplate = currentTemplate;
	end
end
-- END Options Frame events


-- Splash screen events
function SMARTBUFF_Splash_Show()
  SmartBuffSplashFrame:RegisterEvent("CURSOR_UPDATE");
  SMARTBUFF_Splash_ChangeFont(1);
  -- "Interface/DialogFrame/UI-DialogBox-Background"
  -- "Interface/Tooltips/UI-Tooltip-Background"
  SmartBuffSplashFrame:SetBackdrop({bgFile = "Interface/DialogFrame/UI-DialogBox-Background"});
  SmartBuffSplashFrame:EnableMouse(true);
  SmartBuffSplashFrame:Show();
end

function SMARTBUFF_Splash_Hide()
  SMARTBUFF_Splash_Clear();
  SMARTBUFF_Splash_ChangePos();
  SmartBuffSplashFrame:SetBackdrop(nil);
  SmartBuffSplashFrame:EnableMouse(false);
  SmartBuffSplashFrame:UnregisterEvent("CURSOR_UPDATE");
end

function SMARTBUFF_Splash_Clear()
  local i;
  for i = 1, 8, 1 do
    SmartBuffSplashFrame:AddMessage(" ", 1, 1, 1, 1, 1);
  end
end

function SMARTBUFF_Splash_ChangePos()
  local _,_,_, x, y = SmartBuffSplashFrame:GetPoint("CENTER");
  if (SMARTBUFF_Options) then
    SMARTBUFF_Options.SplashX = x;
    SMARTBUFF_Options.SplashY = y;
  end
end

function SMARTBUFF_Splash_ChangeFont(mode)
  if (mode > 1) then
    SMARTBUFF_Splash_ChangePos();    
    iCurrentFont = iCurrentFont + 1;
  end
  if (cFonts[iCurrentFont] == nil) then
    iCurrentFont = 1;
  end
  SMARTBUFF_Options.CurrentFont = iCurrentFont;
  SmartBuffSplashFrame:ClearAllPoints();
  SmartBuffSplashFrame:SetPoint("TOPLEFT", SMARTBUFF_Options.SplashX, SMARTBUFF_Options.SplashY);
  SmartBuffSplashFrame:SetFontObject(getglobal(cFonts[iCurrentFont]));
  if (mode > 0) then
    SMARTBUFF_Splash_Clear();
    SmartBuffSplashFrame:AddMessage("Demo Text Font: " .. cFonts[iCurrentFont] .. "\ndrag'n'drop = move, click ouside = font change", 1, 1, 1, 1, 300);
  end
end
-- END Splash screen events


--****************************************************************************************

--[[
function TitanPanelSmartBuffRightButton_OnLoad()
	this.registry = { 
		id = TITAN_SMARTBUFF_ID,
		menuText = TITAN_SMARTBUFF_MENU_TEXT,
		buttonTextFunction = TitanPanelSmartBuffButton_GetButtonText,
		tooltipTitle = TITAN_SMARTBUFF_TOOLTIP,
		tooltipTextFunction = "TitanPanelSmartBuffButton_GetTooltipText",
		icon = TITAN_SMARTBUFF_ICON_ON,
		iconWidth = 16,
		savedVariables = {
			ShowIcon = 1,
			ShowLabelText = 1,
		}    
	}; 
end

function TitanPanelSmartBuffRightButton_OnClick()
	if (arg1=="LeftButton") then
		SMARTBUFF_OptionsFrame_Toggle();
	elseif (arg1=="RightButton") then
	  SMARTBUFF_OToggle();
    if (SMARTBUFF_Options.Toggle) then
      this.registry[icon] = TITAN_SMARTBUFF_ICON_ON;
	  else
      this.registry[icon] = TITAN_SMARTBUFF_ICON_OFF;
	  end	  
	end
end

function TitanPanelSmartBuffButton_OnEvent()
end

function TitanPanelSmartBuffButton_GetButtonText(id)
  return "SmartBuff", "";
end

function TitanPanelSmartBuffButton_GetTooltipText()
  return "SmartBuff";
end
]]--
