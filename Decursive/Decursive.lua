--[[
 Decursive add-on for World of Warcraft UI
 Copyright (C) 2006 Archarodim ( http://www.2072productions.com/?to=decursive-continued.txt )
 This is the continued work of the original Decursive (v1.9.9) by Quu
 Decursive 1.9.9 is in public domain ( www.quutar.com )
 
 License:
	This program is free software; you can redistribute it and/or
	modify it under the terms of the GNU General Public License
	as published by the Free Software Foundation; either version 2
	of the License, or (at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
 
	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
--]]
-------------------------------------------------------------------------------

-- this will spam... really only use it for testing
local Dcr_Print_Spell_Found = false;
-- how many seconds... can be fractional... needs to be more than 0.4... 1.0 is optimal
local Dcr_SpellCombatDelay = 1.0;
-- print out a fuckload of info
Dcr_Print_DEBUG = false;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- and any internal HARD settings for decursive
DCR_MAX_LIVE_SLOTS = 15;
local DCR_TEXT_LIFETIME = 4.0;
-------------------------------------------------------------------------------


-- this is something I use for remote debugging
DCR_REMOTE_DEBUG = { };

-------------------------------------------------------------------------------
-- variables {{{
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- The stored variables {{{
-------------------------------------------------------------------------------
Dcr_Saved = {
    -- this is the items that are stored...

    Dcr_Print_DEBUG_bis = false;

    -- this is the priority list of people to cure
    PriorityList = { };

    -- this is the people to skip
    SkipList = { };

    -- this is wether or not to show the "live" list	
    Hide_LiveList = false;

    -- This will turn on and off the sending of messages to the default chat frame
    Print_ChatFrame = false;

    -- this will send the messages to a custom frame that is moveable	
    Print_CustomFrame = true;

    -- this will disable error messages
    Print_Error = true;

    -- check for abolish before curing poison or disease
    Check_For_Abolish = true;

    -- this is "fix" for the fact that rank 1 of dispell magic does not always remove
    -- the high level debuffs properly. This carrys over to other things.
    AlwaysUseBestSpell = true;

    -- should we do the orders randomly?
    Random_Order = false;

    -- should we scan pets
    Scan_Pets = true;

    -- should we ignore stealthed units
    Ingore_Stealthed = false;

    -- how many to show in the livelist
    Amount_Of_Afflicted = 5;

    -- how many seconds to "black list" someone with a failed spell
    CureBlacklist	= 5.0;

    -- how often to poll for afflictions in seconds
    ScanTime = 0.2;

    -- Are prio list members protected from blacklisting?
    DoNot_Blacklist_Prio_List = false;

    -- Play a sound when there is something to decurse
    PlaySound = true;

    -- Hide the buttons
    HideButtons = false;

    -- Cure magic if possible
    CureMagic	= true;
    -- Cure Poison if possible
    CurePoison	= true;
    -- Cure Disease if possible
    CureDisease	= true;
    -- Cure Curse if possible
    CureCurse	= true;

    -- Display text above in the custom frame
    CustomeFrameInsertBottom = false;

    -- Disable tooltips in affliction list
    AfflictionTooltips = true;

    -- Reverse LiveList Display
    ReverseLiveDisplay = false;

    -- Hide everything but the livelist
    Hidden = false;

    -- if true then the live list will show only if the main window is shown
    LiveListTied = false;
    
    -- allow to changes the default output window
    Dcr_OutputWindow = DEFAULT_CHAT_FRAME;

    -- cure order list
    CureOrderList = {
	[1] = DCR_MAGIC,
	[2] = DCR_CURSE,
	[3] = DCR_POISON,
	[4] = DCR_DISEASE
    }


}; -- // }}}
-------------------------------------------------------------------------------


-- This array avoid to test someone we've just blackisted twice.
local DCR_ThisCleanBlaclisted = { };

local Dcr_CuringAction_Icons = { };

-- the new spellbook (made it simpler due to localization problems)
local DCR_HAS_SPELLS		= false;

local DCR_SPELL_MAGIC_1		= {0,"", ""};
local DCR_SPELL_MAGIC_2		= {0,"", ""};
 DCR_CAN_CURE_MAGIC	= false;

local DCR_SPELL_ENEMY_MAGIC_1	= {0,"", ""};
local DCR_SPELL_ENEMY_MAGIC_2	= {0,"", ""};
 DCR_CAN_CURE_ENEMY_MAGIC	= false;

local DCR_SPELL_DISEASE_1	= {0,"", ""};
local DCR_SPELL_DISEASE_2	= {0,"", ""};
 DCR_CAN_CURE_DISEASE	= false;

local DCR_SPELL_POISON_1	= {0,"", ""};
local DCR_SPELL_POISON_2	= {0,"", ""};
 DCR_CAN_CURE_POISON	= false;

local DCR_SPELL_CURSE		= {0,"", ""};
 DCR_CAN_CURE_CURSE	= false;

local DCR_SPELL_COOLDOWN_CHECK	= {0,"", ""};

-- for the blacklist
local Dcr_Casting_Spell_On = nil;
local Dcr_Blacklist_Array = { };

local DEBUFF_CACHE_LIFE = 30.0;
local Dcr_Debuff_Texture_to_name_cache = {};
local Dcr_Debuff_Texture_to_name_cache_life = 0.0;

local Dcr_Buff_Texture_to_name_cache = {};
local Dcr_Buff_Texture_to_name_cache_life = 0.0;

local Dcr_CheckingPET = false;
local Dcr_DelayedReconf = false;

Dcr_Groups_datas_are_invalid = false; -- not local because changed from the xml file when clicking on random cure

local InternalPrioList	    = { };
local InternalSkipList	    = { };
local Dcr_Unit_Array	    = { };
local Dcr_Unit_ArrayByName  = { };
local target_added = false;

local SortingTable = {};

local Dcr_CheckPet_Delay	= 2;
local Dcr_DelayedReconf_delay	= 1;

local Dcr_DelayedReconf_timer	= 0;
local Dcr_CheckPet_Timer	= 0;
local Dcr_Delay_Timer		= 0;

local last_DemonType = nil;
local curr_DemonType = nil;

local Dcr_AlreadyCleanning = false;
local Dcr_RestoreTarget = true;

local Dcr_SoundPlayed = false;

local Dcr_CombatMode = false;

local Dcr_timeLeft = 0;

Dcr_PlayerClass = "";

-- The rotatibg cure table functions array
local Curing_functions = {};

Dcr_CureTypeCheckBoxes = {};

local RestorSelfAutoCastTimeOut = 1;
local RestorSelfAutoCast = false;

-- // }}}
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- The UI functions {{{
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- The printing functions {{{
-------------------------------------------------------------------------------
function Dcr_debug( Message) --{{{
    if (Dcr_Print_DEBUG) then
	table.insert(DCR_REMOTE_DEBUG, Message);
	Dcr_Saved.Dcr_OutputWindow:AddMessage(Message, 0.1, 0.1, 1);
    end
    return true;
end --}}}

function Dcr_debug_bis( Message) --{{{
    if (Dcr_Saved.Dcr_Print_DEBUG_bis) then
	table.insert(DCR_REMOTE_DEBUG, Message);
	Dcr_Saved.Dcr_OutputWindow:AddMessage(Message, 0.1, 0.1, 1);
    end
    return true;
end --}}}

function Dcr_Toggle_debug_bis() --{{{
    if (Dcr_Saved.Dcr_Print_DEBUG_bis) then
	Dcr_debug_bis("Debug: Disabled");
	Dcr_Saved.Dcr_Print_DEBUG_bis = false;
	DCR_REMOTE_DEBUG = {};
    else
	Dcr_Saved.Dcr_Print_DEBUG_bis = true;
	Dcr_debug_bis("Debug: Enabled");
    end
end --}}}

function MakePlayerName (name) --{{{
    return "|cFFFFAA22|Hplayer:" .. name .. "|h" .. string.upper(name) .. "|h|r";
end --}}}

function MakeAfflictionName (name) --{{{
    if (name) then
	return "|cFFFF6622" .. DCR_LOC_AF_TYPE[name] .. "|r";
    else
	return "";
    end
end --}}}

function Dcr_println( Message) --{{{

    if (Dcr_Saved.Print_ChatFrame) then
	if (Dcr_Saved.Dcr_OutputWindow) then -- this FUCKING variable find the fucking way of being fucking NIL for some players.... *spitting on LUA language*
	    Dcr_Saved.Dcr_OutputWindow:AddMessage(Message, 1, 1, 1);
	else
	    DEFAULT_CHAT_FRAME:AddMessage(Message, 1, 1, 1);
	end
    end
    if (Dcr_Saved.Print_CustomFrame) then
	DecursiveTextFrame:AddMessage(Message, 1, 1, 1, 0.9);
    end
end --}}}

function Dcr_errln( Message) --{{{
    if (Dcr_Saved.Print_Error) then
	if (Dcr_Saved.Print_ChatFrame) then
	    if (Dcr_Saved.Dcr_OutputWindow) then -- this FUCKING variable find the fucking way of being fucking NIL for some players.... *spitting on LUA language*
		Dcr_Saved.Dcr_OutputWindow:AddMessage(Message, 1, 0.1, 0.1);
	    else
		DEFAULT_CHAT_FRAME:AddMessage(Message, 1, 0.1, 0.1);
	    end
	end
	if (Dcr_Saved.Print_CustomFrame) then
	    DecursiveTextFrame:AddMessage(Message, 1, 0.1, 0.1, 0.9);
	end
    end
end --}}}

function Dcr_PrintPriorityList() --{{{
    for id, name in Dcr_Saved.PriorityList do
	Dcr_println( id.." - "..name);
    end
end --}}}

function TMP_pr() --{{{
    for index, unit in Dcr_Unit_Array do
	Dcr_println( unit.." - "..MakePlayerName((UnitName(unit))) .. " Index: "..index);
    end
end --}}}

-- }}}
-------------------------------------------------------------------------------

-- Show Hide FUNCTIONS -- {{{

function Dcr_ShowHideAfflictedListUI()  --{{{-- here for compatibility -- deprecated
    Dcr_Hide(false);
end --}}}

function Dcr_ShowHideLiveList(hide) --{{{
    -- if hide is requested or if hide is not set and the live-list is shown
    if (hide==1 or (not hide and DecursiveAfflictedListFrame:IsVisible())) then
	Dcr_Saved.Hide_LiveList = true;
	DecursiveAfflictedListFrame:Hide();
    else
	Dcr_Saved.Hide_LiveList = false;
	DecursiveAfflictedListFrame:ClearAllPoints();
	DecursiveAfflictedListFrame:SetPoint("TOPLEFT", "DecursiveMainBar", "BOTTOMLEFT");
	DecursiveAfflictedListFrame:Show();
    end

    if (Dcr_Saved.Hide_LiveList) then
	DcrOptionsFrameHideLL:SetChecked(1);
    else
	DcrOptionsFrameHideLL:SetChecked(0);
    end

end --}}}

function Dcr_Hide(hide) --{{{

    if (hide==1 or (not hide and DecursiveMainBar:IsVisible())) then
	if (Dcr_Saved.LiveListTied) then
	    Dcr_ShowHideLiveList(1);
	end
	Dcr_Saved.Hidden = true;
	DecursiveMainBar:Hide();
    else
	if (Dcr_Saved.LiveListTied) then
	    Dcr_ShowHideLiveList(0);
	end
	Dcr_Saved.Hidden = false;
	DecursiveMainBar:Show();
    end

    if DecursiveMainBar:IsVisible() and DecursiveAfflictedListFrame:IsVisible() then
	DecursiveAfflictedListFrame:ClearAllPoints();
	DecursiveAfflictedListFrame:SetPoint("TOPLEFT", "DecursiveMainBar", "BOTTOMLEFT");
    else
	Dcr_Saved.Dcr_OutputWindow:AddMessage(DCR_SHOW_MSG, 0.3, 0.5, 1);
    end
end --}}}

function Dcr_ShowHidePriorityListUI() --{{{
    if (DecursivePriorityListFrame:IsVisible()) then
	DecursivePriorityListFrame:Hide();
    else
	DecursivePriorityListFrame:Show();
    end
end --}}}

-- skip list stuff
function Dcr_ShowHideSkipListUI() --{{{
    if (DecursiveSkipListFrame:IsVisible()) then
	DecursiveSkipListFrame:Hide();
    else
	DecursiveSkipListFrame:Show();
    end
end --}}}

function Dcr_ShowHideOptionsUI() --{{{
    if (DcrOptionsFrame:IsVisible()) then
	DcrOptionsFrame:Hide();
    else
	DcrOptionsFrame:Show();
	DcrOptionsFrame2:ClearAllPoints();
	DcrOptionsFrame2:SetPoint("TOPLEFT", "DcrOptionsFrame", "TOPRIGHT");
    end
end --}}}

function Dcr_ShowHideTextAnchor() --{{{
    if (DecursiveAnchor:IsVisible()) then
	DecursiveAnchor:Hide();
    else
	DecursiveAnchor:Show();
    end
end --}}}

function Dcr_ShowHideButtons(UseCurrentValue) --{{{

    local DecrFrame = "DecursiveMainBar";
    local buttons = {
	DecrFrame .. "Priority",
	DecrFrame .. "Skip",
	DecrFrame .. "Options",
	DecrFrame .. "Hide",
    }

    DCRframeObject = getglobal(DecrFrame);

    if (not UseCurrentValue) then
	Dcr_Saved.HideButtons = (not Dcr_Saved.HideButtons);
    end

    for _, ButtonName in buttons do
	Button = getglobal(ButtonName);

	if (Dcr_Saved.HideButtons) then
	    Button:Hide();
	    DCRframeObject.isLocked = 1;
	else
	    Button:Show();
	    DCRframeObject.isLocked = 0;
	end

    end



end --}}}

-- }}}

-- OPTION RELATED FUNCTIONS {{{

function Dcr_ChangeTextFrameDirection(bottom) --{{{
    buton = DecursiveAnchorDirection;
    if (bottom) then
	DecursiveTextFrame:SetInsertMode("BOTTOM");
	buton:SetText("v");
    else
	DecursiveTextFrame:SetInsertMode("TOP");
	buton:SetText("^");
    end
end --}}}


function Dcr_AmountOfAfflictedSlider_OnShow() --{{{
    getglobal(this:GetName().."High"):SetText("15");
    getglobal(this:GetName().."Low"):SetText("5");

    getglobal(this:GetName() .. "Text"):SetText(DCR_AMOUNT_AFFLIC .. Dcr_Saved.Amount_Of_Afflicted);

    this:SetMinMaxValues(1, 15);
    this:SetValueStep(1);
    this:SetValue(Dcr_Saved.Amount_Of_Afflicted);
end --}}}

function Dcr_AmountOfAfflictedSlider_OnValueChanged() --{{{
    Dcr_Saved.Amount_Of_Afflicted = this:GetValue();
    getglobal(this:GetName() .. "Text"):SetText(DCR_AMOUNT_AFFLIC .. Dcr_Saved.Amount_Of_Afflicted);
end --}}}

function Dcr_ScanTimeSlider_OnShow() --{{{
    getglobal(this:GetName().."High"):SetText("1");
    getglobal(this:GetName().."Low"):SetText("0.1");

    getglobal(this:GetName() .. "Text"):SetText(DCR_SCAN_LENGTH .. Dcr_Saved.ScanTime);

    this:SetMinMaxValues(0.1, 1);
    this:SetValueStep(0.1);
    this:SetValue(Dcr_Saved.ScanTime);
end --}}}

function Dcr_ScanTimeSlider_OnValueChanged() --{{{
    Dcr_Saved.ScanTime = this:GetValue() * 10;
    if (Dcr_Saved.ScanTime < 0) then
	Dcr_Saved.ScanTime = ceil(Dcr_Saved.ScanTime - 0.5)
    else
	Dcr_Saved.ScanTime = floor(Dcr_Saved.ScanTime + 0.5)
    end
    Dcr_Saved.ScanTime = Dcr_Saved.ScanTime / 10;
    getglobal(this:GetName() .. "Text"):SetText(DCR_SCAN_LENGTH .. Dcr_Saved.ScanTime);
end --}}}

function Dcr_CureBlacklistSlider_OnShow() --{{{
    getglobal(this:GetName().."High"):SetText("20");
    getglobal(this:GetName().."Low"):SetText("1");

    getglobal(this:GetName() .. "Text"):SetText(DCR_BLACK_LENGTH .. Dcr_Saved.CureBlacklist);

    this:SetMinMaxValues(1, 20);
    this:SetValueStep(0.1);
    this:SetValue(Dcr_Saved.CureBlacklist);
end --}}}

function Dcr_CureBlacklistSlider_OnValueChanged() --{{{
    Dcr_Saved.CureBlacklist = this:GetValue() * 10;
    if (Dcr_Saved.CureBlacklist < 0) then
	Dcr_Saved.CureBlacklist = ceil(Dcr_Saved.CureBlacklist - 0.5)
    else
	Dcr_Saved.CureBlacklist = floor(Dcr_Saved.CureBlacklist + 0.5)
    end
    Dcr_Saved.CureBlacklist = Dcr_Saved.CureBlacklist / 10;
    getglobal(this:GetName() .. "Text"):SetText(DCR_BLACK_LENGTH .. Dcr_Saved.CureBlacklist);
end --}}}



function Dcr_On_CureOrderCheckBox_Update (CheckBox) -- {{{

    --Dcr_debug_bis(CheckBox.CureType .. " cb called");
    -- if it's unchecked
    if (CheckBox.CurePos ~= 0 and not CheckBox:GetChecked()) then
	Dcr_debug_bis("===> UN checked");
	-- remove its position in the cure order list
	CheckBox.CurePos = 0;

	-- remove the debuff type from the saved ordered list
	Dcr_tremovebyval(Dcr_Saved.CureOrderList, CheckBox.CureType);

	-- remove the green number before the checkbox text
	getglobal(CheckBox:GetName().."LText"):SetText("");

	-- if done here then update the actual cure order list
	Dcr_SetCureOrderList ();
    elseif ( CheckBox.CurePos == 0 and CheckBox:GetChecked()) then -- it seems that (not CheckBox.CurePos) is not the same than (CheckBox.CurePos == false) in LUA so we forgot booleans................
	Dcr_debug_bis("===> CHECKED");

	-- set the object position
	CheckBox.CurePos = table.getn(Dcr_Saved.CureOrderList) + 1;

	-- register its type in the saved list
	Dcr_Saved.CureOrderList[CheckBox.CurePos] = CheckBox.CureType;

	-- if done here then update the actual cure order list
	Dcr_SetCureOrderList ();
    end

end -- }}}

function Dcr_SetCureOrderList () -- {{{
    -- Dcr_debug_bis("Dcr_SetCureOrderList called");
    local i;
    local j = 0;
    local CheckBox;
    local temp_table = {};

    -- clear curing functions
    Curing_functions = {};
    for i=1, 4 do
	if (Dcr_Saved.CureOrderList[i]) then
	    -- set a shortcut to our checkbox object
	    CheckBox =  Dcr_CureTypeCheckBoxes[Dcr_Saved.CureOrderList[i]];

	    -- re-index Dcr_Saved.CureOrderList
	    j = j + 1;
	    temp_table[j] = Dcr_Saved.CureOrderList[i];

	    -- register the curing function
	    Curing_functions[j] = CheckBox.CureFunction;
	    CheckBox.CurePos = j;

	    -- set a green number before the checkbox text
	    getglobal(CheckBox:GetName().."LText"):SetText("|cFF00FF00"..j.."|r ");
	end
    end

    -- save our reordered Dcr_Saved.CureOrderList
    Dcr_Saved.CureOrderList = temp_table;

end -- }}}

function VerifyOrderList ()

    local TempTable = {};
    local i;

    Dcr_debug_bis("Verifying CureOrderList...");
    -- take the 4 first value of the Dcr_Saved.CureOrderList table
    for i=1, 4 do
	-- add it only if not already listed
	if ( Dcr_Saved.CureOrderList[i] and not Dcr_tcheckforval(TempTable, Dcr_Saved.CureOrderList[i])) then
	    TempTable[i] = Dcr_Saved.CureOrderList[i];
	    Dcr_debug_bis("Already in list: "..TempTable[i]);
	end
    end

    if (Dcr_Saved.CureMagic	and	not Dcr_tcheckforval(TempTable,   DCR_MAGIC	)) then 
	table.insert(TempTable, DCR_MAGIC);
	Dcr_debug_bis("Adding " .. DCR_MAGIC);
    end

    if (Dcr_Saved.CureCurse	and	not Dcr_tcheckforval(TempTable,   DCR_CURSE	)) then 
	table.insert(TempTable, DCR_CURSE);
	Dcr_debug_bis("Adding " .. DCR_CURSE);
    end

    if (Dcr_Saved.CurePoison    and	not Dcr_tcheckforval(TempTable,   DCR_POISON	)) then
	table.insert(TempTable, DCR_POISON);
	Dcr_debug_bis("Adding " .. DCR_POISON);
    end

    if (Dcr_Saved.CureDisease   and	not Dcr_tcheckforval(TempTable,   DCR_DISEASE	)) then 
	table.insert(TempTable, DCR_DISEASE);
	Dcr_debug_bis("Adding " .. DCR_DISEASE);
    end

    Dcr_Saved.CureOrderList = TempTable;

end

function Dcr_tremovebyval(tab, val) -- {{{
    local k;
    local v;
    for k,v in tab do
	if(v==val) then
	    table.remove(tab, k);
	    return true;
	end
    end
    return false;
end -- }}}

function Dcr_tcheckforval(tab, val) -- {{{
    local k;
    local v;
    for k,v in tab do
	if(v==val) then
	    return true;
	end
    end
    return false;
end -- }}}

-- // }}}

-- this resets the location of the windows
function Dcr_ResetWindow() --{{{


    DecursiveMainBar:ClearAllPoints();
    DecursiveMainBar:SetPoint("CENTER", "UIParent");
    DecursiveMainBar:Show();

    DecursiveAfflictedListFrame:ClearAllPoints();
    DecursiveAfflictedListFrame:SetPoint("TOPLEFT", "DecursiveMainBar", "BOTTOMLEFT");
    DecursiveAfflictedListFrame:Show();

    DecursivePriorityListFrame:ClearAllPoints();
    DecursivePriorityListFrame:SetPoint("CENTER", "UIParent");

    DecursiveSkipListFrame:ClearAllPoints();
    DecursiveSkipListFrame:SetPoint("CENTER", "UIParent");

    DecursivePopulateListFrame:ClearAllPoints();
    DecursivePopulateListFrame:SetPoint("CENTER", "UIParent");

    DcrOptionsFrame:ClearAllPoints();
    DcrOptionsFrame:SetPoint("CENTER", "UIParent");

    DcrOptionsFrame2:ClearAllPoints();
    DcrOptionsFrame2:SetPoint("TOPLEFT", "DcrOptionsFrame", "TOPRIGHT");
end --}}}

function Dcr_ThisSetText(text) --{{{
    getglobal(this:GetName().."Text"):SetText(text);
end --}}}

function Dcr_DisplayTooltip(Message, RelativeTo) --{{{
    DcrDisplay_Tooltip:SetOwner(RelativeTo, "ANCHOR_TOPRIGHT");
    DcrDisplay_Tooltip:ClearLines();
    DcrDisplay_Tooltip:SetText(Message);
    DcrDisplay_Tooltip:Show();
end --}}}

function Dcr_DebuffTemplate_OnEnter() --{{{
    if (Dcr_Saved.AfflictionTooltips) then
	DcrDisplay_Tooltip:SetOwner(this, "ANCHOR_CURSOR");
	DcrDisplay_Tooltip:ClearLines();
	DcrDisplay_Tooltip:SetUnitDebuff(this.unit,this.debuff); -- OK
	DcrDisplay_Tooltip:Show();
    end
end --}}}

-- Prio and skip list LIST {{{
function Dcr_PriorityListEntryTemplate_OnClick() --{{{
    local id = this:GetID();
    if (id) then
	if (this.Priority) then
	    Dcr_RemoveIDFromPriorityList(id);
	else
	    Dcr_RemoveIDFromSkipList(id);
	end
    end
    this.UpdateYourself = true;

end --}}}

function Dcr_PriorityListEntryTemplate_OnUpdate() --{{{
    if (this.UpdateYourself) then
	this.UpdateYourself = false;
	local baseName = this:GetName();
	local NameText = getglobal(baseName.."Name");

	local id = this:GetID();
	if (id) then
	    local name
	    if (this.Priority) then
		name = Dcr_Saved.PriorityList[id];
	    else
		name = Dcr_Saved.SkipList[id];
	    end
	    if (name) then
		NameText:SetText(id.." - "..name);
	    else
		NameText:SetText("Error - ID Invalid!");
	    end
	else
	    NameText:SetText("Error - No ID!");
	end
    end
end --}}}

function Dcr_PriorityListFrame_OnUpdate() --{{{
    if (this.UpdateYourself) then
	this.UpdateYourself = false;
	Dcr_Groups_datas_are_invalid = true;
	local baseName = this:GetName();
	local up = getglobal(baseName.."Up");
	local down = getglobal(baseName.."Down");


	local size = table.getn(Dcr_Saved.PriorityList);

	if (size < 11 ) then
	    this.Offset = 0;
	    up:Hide();
	    down:Hide();
	else
	    if (this.Offset <= 0) then
		this.Offset = 0;
		up:Hide();
		down:Show();
	    elseif (this.Offset >= (size - 10)) then
		this.Offset = (size - 10);
		up:Show();
		down:Hide();
	    else
		up:Show();
		down:Show();
	    end
	end

	local i;
	for i = 1, 10 do
	    local id = ""..i;
	    if (i < 10) then
		id = "0"..i;
	    end
	    local btn = getglobal(baseName.."Index"..id);

	    btn:SetID( i + this.Offset);
	    btn.UpdateYourself = true;

	    if (i <= size) then
		btn:Show();
	    else
		btn:Hide();
	    end
	end
    end

end --}}}

function Dcr_SkipListFrame_OnUpdate() --{{{
    if (this.UpdateYourself) then
	this.UpdateYourself = false;
	Dcr_Groups_datas_are_invalid = true;
	local baseName = this:GetName();
	local up = getglobal(baseName.."Up");
	local down = getglobal(baseName.."Down");


	local size = table.getn(Dcr_Saved.SkipList);

	if (size < 11 ) then
	    this.Offset = 0;
	    up:Hide();
	    down:Hide();
	else
	    if (this.Offset <= 0) then
		this.Offset = 0;
		up:Hide();
		down:Show();
	    elseif (this.Offset >= (size - 10)) then
		this.Offset = (size - 10);
		up:Show();
		down:Hide();
	    else
		up:Show();
		down:Show();
	    end
	end

	local i;
	for i = 1, 10 do
	    local id = ""..i;
	    if (i < 10) then
		id = "0"..i;
	    end
	    local btn = getglobal(baseName.."Index"..id);

	    btn:SetID( i + this.Offset);
	    btn.UpdateYourself = true;

	    if (i <= size) then
		btn:Show();
	    else
		btn:Hide();
	    end
	end
    end

end --}}}

function Dcr_PopulateButtonPress() --{{{
    local addFunction = this:GetParent().addFunction;

    if (this.ClassType) then
	-- for the class type stuff... we do party

	local _, pclass = UnitClass("player");
	if (pclass == this.ClassType) then
	    addFunction("player");
	end

	_, pclass = UnitClass("party1");
	if (pclass == this.ClassType) then
	    addFunction("party1");
	end
	_, pclass = UnitClass("party2");
	if (pclass == this.ClassType) then
	    addFunction("party2");
	end
	_, pclass = UnitClass("party3");
	if (pclass == this.ClassType) then
	    addFunction("party3");
	end
	_, pclass = UnitClass("party4");
	if (pclass == this.ClassType) then
	    addFunction("party4");
	end
    end

    local max = GetNumRaidMembers();
    local i;
    if (max > 0) then
	for i = 1, max do
	    local _, _, pgroup, _, _, pclass = GetRaidRosterInfo(i);

	    if (this.ClassType) then
		if (pclass == this.ClassType) then
		    addFunction("raid"..i);
		end
	    end
	    if (this.GroupNumber) then
		if (pgroup == this.GroupNumber) then
		    addFunction("raid"..i);
		end
	    end
	end
    end

end --}}}



-- }}}

function Dcr_PlaySound () --{{{
    if (Dcr_Saved.PlaySound and not Dcr_SoundPlayed) then
	-- good sounds: Sound\\Doodad\\BellTollTribal.wav
	--		Sound\\interface\\AuctionWindowOpen.wav
	PlaySoundFile("Sound\\Doodad\\BellTollTribal.wav");
	Dcr_SoundPlayed = true;
    end
end --}}}


-- LIVE DISPLAY functions {{{

function Dcr_AfflictedListFrame_OnUpdate(elapsed) --{{{


    -- XXX find the use of this block
    if Dcr_Saved.Amount_Of_Afflicted < 1 then
	Dcr_Saved.Amount_Of_Afflicted = 1;
    elseif Dcr_Saved.Amount_Of_Afflicted > DCR_MAX_LIVE_SLOTS then
	Dcr_Saved.Amount_Of_Afflicted = DCR_MAX_LIVE_SLOTS;
    end

    Dcr_timeLeft = Dcr_timeLeft - elapsed;
    if (Dcr_timeLeft <= 0) then
	Dcr_timeLeft = Dcr_Saved.ScanTime;
	local Dcr_Unit_Array = Dcr_Unit_Array;
	local index = 1;
	local targetexists = false;
	Dcr_GetUnitArray();

	-- First scan the current target
	if (UnitExists("target") and UnitIsFriend("target", "player")) then
	    if (UnitIsVisible("target")) then
		targetexists = true;
		if (Dcr_ScanUnit("target", index)) then
		    if (index == 1) then
			Dcr_PlaySound();
		    end
		    index = index + 1;
		end
	    end
	end

	if (DCR_CAN_CURE_ENEMY_MAGIC) then
	    for _, unit in Dcr_Unit_Array do
		if (index > Dcr_Saved.Amount_Of_Afflicted) then
		    break;
		end
		if (UnitIsVisible(unit) and not (targetexists and UnitIsUnit(unit, "target"))) then
		    -- if the unit is even close by
		    if (UnitIsCharmed(unit)) then
			-- if the unit is mind controlled
			if (Dcr_ScanUnit(unit, index)) then
			    if (index == 1) then
				Dcr_PlaySound();
			    end
			    index = index + 1;
			end
		    end
		end
	    end
	end

	-- Dcr_debug(" normal loop");
	for _, unit in Dcr_Unit_Array do
	    if (index > Dcr_Saved.Amount_Of_Afflicted) then
		break;
	    end
	    if (UnitIsVisible(unit) and not (targetexists and UnitIsUnit(unit, "target"))) then
		if (not UnitIsCharmed(unit)) then
		    -- if the unit is even close by
		    if (Dcr_ScanUnit(unit, index)) then
			if (index == 1) then
			    Dcr_PlaySound();
			end
			index = index + 1;
		    end
		end
	    end
	end

	-- clear livelist
	local i;
	for i = index, DCR_MAX_LIVE_SLOTS do
	    if i == 1 then
		Dcr_SoundPlayed = false;
	    end
	    local Index = i;
	    if (Dcr_Saved.ReverseLiveDisplay and not (i > Dcr_Saved.Amount_Of_Afflicted)) then
		Index = Dcr_Saved.Amount_Of_Afflicted + -1 * (Index - 1);
	    end
	    local item = getglobal("DecursiveAfflictedListFrameListItem"..Index);
	    item.unit = "player";
	    item.debuff = 0;
	    item:Hide();
	end

	-- for testing only		
	-- Dcr_UpdateLiveDisplay( 1, "player", 1)

    end
end --}}}

function Dcr_ScanUnit( Unit, Index) --{{{
    local AllUnitDebuffs = {};

    AllUnitDebuffs = Dcr_GetUnitDebuffAll(Unit);

    for debuff_name, debuff_params in AllUnitDebuffs do
	-- test if we have to ignore this debuf  {{{ --
	if (DCR_IGNORELIST[debuff_name]) then
	    -- these are the BAD ones... the ones that make the target immune... abort the user
	    -- Dcr_debug( string.gsub( string.gsub(DCR_IGNORE_STRING, "$t", (UnitName(Unit))), "$a", debuff_name));
	    return false;
	end

	if (DCR_SKIP_LIST[debuff_name]) then
	    -- these are just ones you don't care about
	    -- Dcr_debug( string.gsub( string.gsub(DCR_IGNORE_STRING, "$t", (UnitName(Unit))), "$a", debuff_name));
	    break;
	end

	if (UnitAffectingCombat("player")) then
	    if (DCR_SKIP_BY_CLASS_LIST[UClass]) then
		if (DCR_SKIP_BY_CLASS_LIST[UClass][debuff_name]) then
		    -- these are just ones you don't care about by class
		    -- Dcr_debug( string.gsub( string.gsub(DCR_IGNORE_STRING, "$t", (UnitName(Unit))), "$a", debuff_name));
		    break;
		end
	    end
	end
	-- }}}

	if (debuff_params.debuff_type and debuff_params.debuff_type ~= "") then -- debuff_type can be an empty string
	    -- // {{{ --
	    if (debuff_params.debuff_type == DCR_MAGIC and Dcr_Saved.CureMagic) then
		if (UnitIsCharmed(Unit)) then
		    if (DCR_CAN_CURE_ENEMY_MAGIC) then
			Dcr_UpdateLiveDisplay(Index, Unit, debuff_params);
			return true;
		    end
		else
		    if (DCR_CAN_CURE_MAGIC) then
			Dcr_UpdateLiveDisplay(Index, Unit, debuff_params);
			return true;
		    end
		end
	    elseif (debuff_params.debuff_type == DCR_DISEASE and Dcr_Saved.CureDisease) then
		if (DCR_CAN_CURE_DISEASE) then
		    Dcr_UpdateLiveDisplay(Index, Unit, debuff_params);
		    return true;
		end
	    elseif (debuff_params.debuff_type == DCR_POISON and Dcr_Saved.CurePoison) then
		if (DCR_CAN_CURE_POISON) then
		    Dcr_UpdateLiveDisplay(Index, Unit, debuff_params);
		    return true;
		end
	    elseif (debuff_params.debuff_type == DCR_CURSE and Dcr_Saved.CureCurse) then
		if (DCR_CAN_CURE_CURSE) then
		    -- Dcr_debug_bis("updating for curse");
		    Dcr_UpdateLiveDisplay(Index, Unit, debuff_params);
		    return true;
		end
	    end
	    -- // }}}
	end
    end
    return false;
end --}}}

function Dcr_UpdateLiveDisplay( Index, Unit, debuff_params) --{{{

    if (Dcr_Saved.ReverseLiveDisplay) then
	Index = Dcr_Saved.Amount_Of_Afflicted + -1 * (Index - 1);
    end

    local baseFrame = "DecursiveAfflictedListFrameListItem";

    local item = getglobal(baseFrame..Index);
    if (item.debuff == debuff_params.index and item.debuff_name == debuff_params.debuff_name and item.unit == Unit and item.DebuffApps == debuff_params.debuffApplications) then
	-- it's already displayed...
	return
    end
    Dcr_debug_bis("Updating: "..baseFrame.. Index);

    item.unit = Unit;
    item.debuff_name = debuff_params.debuff_name;
    item.debuff = debuff_params.index;
    item.DebuffApps = debuff_params.debuffApplications;

    getglobal(baseFrame..Index.."DebuffIcon"):SetTexture(debuff_params.DebuffTexture);

    if (debuff_params.debuffApplications > 0) then
	getglobal(baseFrame..Index.."DebuffCount"):SetText(debuff_params.debuffApplications);
    else
	getglobal(baseFrame..Index.."DebuffCount"):SetText("");
    end

    getglobal(baseFrame..Index.."Name"):SetText(MakePlayerName((UnitName(Unit))));

    getglobal(baseFrame..Index.."Type"):SetText(MakeAfflictionName(debuff_params.debuff_type));

    getglobal(baseFrame..Index.."Affliction"):SetText(debuff_params.debuff_name);
    --
    --
    -- item.UpdateMe = true;
    item:Show();

    item = getglobal(baseFrame..Index.."Debuff");
    item.unit = Unit;
    item.debuff = debuff_params.index;

    item = getglobal(baseFrame..Index.."ClickMe");
    item.unit = Unit;
    item.debuff = debuff_params.index;
end --}}}

    
-- }}}

-- // }}}
-------------------------------------------------------------------------------
-- TODO see how to implement a conditional rescan (use RAID_ROSTER_UPDATE)
-------------------------------------------------------------------------------
-- the priority and skip list function... stuff to manage the lists // {{{
-------------------------------------------------------------------------------

function Dcr_AddTargetToPriorityList() --{{{
    Dcr_debug( "Adding the target to the priority list");
    DcrAddUnitToPriorityList("target");
end --}}}

function DcrAddUnitToPriorityList( unit) --{{{
    if (UnitExists(unit)) then
	if (UnitIsPlayer(unit)) then
	    local name = (UnitName( unit));
	    for _, pname in Dcr_Saved.PriorityList do
		if (name == pname) then
		    return;
		end
	    end
	    table.insert(Dcr_Saved.PriorityList,name);
	end
	DecursivePriorityListFrame.UpdateYourself = true;
    end
end --}}}

function Dcr_RemoveIDFromPriorityList(id) --{{{
    table.remove( Dcr_Saved.PriorityList,id);
    DecursivePriorityListFrame.UpdateYourself = true;
end --}}}

function Dcr_ClearPriorityList() --{{{
    Dcr_Saved.PriorityList = {};
    
    DecursivePriorityListFrame.UpdateYourself = true;
end --}}}

function Dcr_AddTargetToSkipList() --{{{
    Dcr_debug( "Adding the target to the Skip list");
    DcrAddUnitToSkipList("target");
end --}}}

function DcrAddUnitToSkipList( unit) --{{{
    if (UnitExists(unit)) then
	if (UnitIsPlayer(unit)) then
	    local name = (UnitName( unit));
	    for _, pname in Dcr_Saved.SkipList do
		if (name == pname) then
		    return;
		end
	    end
	    table.insert(Dcr_Saved.SkipList,name);
	    DecursiveSkipListFrame.UpdateYourself = true;
	end
    end
end --}}}

function Dcr_RemoveIDFromSkipList(id) --{{{
    table.remove( Dcr_Saved.SkipList,id);
    DecursiveSkipListFrame.UpdateYourself = true;
end --}}}

function Dcr_ClearSkipList() --{{{
    local i;

    Dcr_Saved.SkipList = { };
    --[[
    local max = table.getn(Dcr_Saved.SkipList);
    for i = 1, max do
	table.remove( Dcr_Saved.SkipList);
    end
    ]]
    DecursiveSkipListFrame.UpdateYourself = true;
end --}}}

function Dcr_PrintSkipList() --{{{
    for id, name in Dcr_Saved.SkipList do
	Dcr_println( id.." - "..name);
    end
end --}}}

function Dcr_IsInPriorList (name) --{{{
    for _, PriorName in Dcr_Saved.PriorityList do
	if (PriorName == name) then
	    return true;
	end
    end
    return false;
end --}}}

function Dcr_IsInSkipList (name) --{{{
    for _, SkipName in Dcr_Saved.SkipList do
	if (SkipName == name) then
	    return true;
	end
    end
    return false
end --}}}

function Dcr_IsInSkipOrPriorList( name )  --{{{-- used internally
    if (InternalSkipList[name]) then
	return true;
    end

    if (InternalPrioList[name]) then
	return true;
    end
    return false;


end --}}}
-- }}}
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- init functions and configuration functions {{{
-------------------------------------------------------------------------------
StaticPopupDialogs["DCR_DISABLE_AUTOSELFCAST"] = {
  text = DCR_DISABLE_AUTOSELFCAST,
  button1 = TEXT(ACCEPT),
  button2 = TEXT(CANCEL),
  OnAccept = function()
      SetCVar("autoSelfCast", "0");
  end,
  timeout = 0,
  whileDead = 1,
  hideOnEscape = 1,
  ShowAlert = 1,
};

function Dcr_CheckAuSelfCastStaus ()
    if (GetCVar("autoSelfCast") == "1") then
	StaticPopup_Show ("DCR_DISABLE_AUTOSELFCAST", AUTO_SELF_CAST_TEXT);
    end

end


function Dcr_Init() --{{{

    -- I don't know for you but I personally hate Dcr_Saved.Dcr_OutputWindow...
    if (Dcr_Saved.Dcr_OutputWindow == nil or not Dcr_Saved.Dcr_OutputWindow) then
	Dcr_Saved.Dcr_OutputWindow = DEFAULT_CHAT_FRAME;
    end

    Dcr_println(DCR_VERSION_STRING);

    Dcr_debug_bis( "Decursive Initialization started!");
    -- Dcr_CheckAuSelfCastStaus ();

    -- Register the / cmds {{{
    Dcr_debug( "Registering the slash commands");
    SLASH_DECURSIVE1 = DCR_MACRO_COMMAND;
    SlashCmdList["DECURSIVE"] = function(msg)
	Dcr_Clean();
    end

    SLASH_DECURSIVEPRADD1 = DCR_MACRO_PRADD;
    SlashCmdList["DECURSIVEPRADD"] = function(msg)
	Dcr_AddTargetToPriorityList();
    end
    SLASH_DECURSIVEPRCLEAR1 = DCR_MACRO_PRCLEAR;
    SlashCmdList["DECURSIVEPRCLEAR"] = function(msg)
	Dcr_ClearPriorityList();
    end
    SLASH_DECURSIVEPRLIST1 = DCR_MACRO_PRLIST;
    SlashCmdList["DECURSIVEPRLIST"] = function(msg)
	Dcr_PrintPriorityList();
    end
    SLASH_DECURSIVEPRSHOW1 = DCR_MACRO_PRSHOW;
    SlashCmdList["DECURSIVEPRSHOW"] = function(msg)
	Dcr_ShowHidePriorityListUI();
    end

    SLASH_DECURSIVESKADD1 = DCR_MACRO_SKADD;
    SlashCmdList["DECURSIVESKADD"] = function(msg)
	Dcr_AddTargetToSkipList();
    end
    SLASH_DECURSIVESKCLEAR1 = DCR_MACRO_SKCLEAR;
    SlashCmdList["DECURSIVESKCLEAR"] = function(msg)
	Dcr_ClearSkipList();
    end
    SLASH_DECURSIVESKLIST1 = DCR_MACRO_SKLIST;
    SlashCmdList["DECURSIVESKLIST"] = function(msg)
	Dcr_PrintSkipList();
    end
    SLASH_DECURSIVESKSHOW1 = DCR_MACRO_SKSHOW;
    SlashCmdList["DECURSIVESKSHOW"] = function(msg)
	Dcr_ShowHideSkipListUI();
    end

    SLASH_DECURSIVESHOW1 = DCR_MACRO_SHOW;
    SlashCmdList["DECURSIVESHOW"] = function(msg)
	Dcr_Hide(0);
    end

    SLASH_DECURSIVERESET1 = DCR_MACRO_RESET;
    SlashCmdList["DECURSIVERESET"] = function(msg)
	Dcr_ResetWindow();
    end

    SLASH_DECURSIVEHIDE1 = DCR_MACRO_HIDE;
    SlashCmdList["DECURSIVEHIDE"] = function(msg)
	Dcr_Hide(1);
    end

    SLASH_DECURSIVEOPTION1 = DCR_MACRO_OPTION;
    SlashCmdList["DECURSIVEOPTION"] = function(msg)
	Dcr_ShowHideOptionsUI();
    end

    SLASH_DECURSIVEDBGBISTOG1 = DCR_MACRO_DEBUG
    SlashCmdList["DECURSIVEDBGBISTOG"] = function(msg)
	Dcr_Toggle_debug_bis();
    end

    -- }}}

    if (Dcr_Saved.Hide_LiveList) then
	DecursiveAfflictedListFrame:Hide();
    else
	DecursiveAfflictedListFrame:ClearAllPoints();
	DecursiveAfflictedListFrame:SetPoint("TOPLEFT", "DecursiveMainBar", "BOTTOMLEFT");
	DecursiveAfflictedListFrame:Show();
    end

    if (Dcr_Saved.Hidden) then
	DecursiveMainBar:Hide();
    else
	DecursiveMainBar:Show();
    end

    if (Dcr_Saved.AlwaysUseBestSpell == nil) then
	Dcr_Saved.AlwaysUseBestSpell = true;
    end

    if (Dcr_Saved.HideButtons == nil) then
	Dcr_Saved.HideButtons = false;
    end

    if (Dcr_Saved.CureMagic == nil) then
	Dcr_Saved.CureMagic = true;
    end

    if (Dcr_Saved.CurePoison == nil) then
	Dcr_Saved.CurePoison = true;
    end

    if (Dcr_Saved.CureDisease == nil) then
	Dcr_Saved.CureDisease = true;
    end

    if (Dcr_Saved.CureCurse == nil) then
	Dcr_Saved.CureCurse = true;
    end

    if (Dcr_Saved.AfflictionTooltips == nil) then
	Dcr_Saved.AfflictionTooltips = true;
    end
    

    if (Dcr_Saved.CureOrderList == nil) then
	Dcr_Saved.CureOrderList = {
	    [1] = DCR_MAGIC,
	    [2] = DCR_CURSE,
	    [3] = DCR_POISON,
	    [4] = DCR_DISEASE
	}
    end


    Dcr_ShowHideButtons(true);

    Dcr_ChangeTextFrameDirection(Dcr_Saved.CustomeFrameInsertBottom);

    if (Dcr_Saved.Print_CustomFrame) then
	DcrOptionsFrameAnchor:Enable();
    else
	DcrOptionsFrameAnchor:Disable();
    end
    -- check the spellbook once
    Dcr_Configure();
    Dcr_Saved.Dcr_OutputWindow:AddMessage(DCR_VERSION_STRING.." "..DCR_SHOW_MSG, 0.3, 0.5, 1);

    DecursiveTextFrame:SetFading(true);
    DecursiveTextFrame:SetFadeDuration(DCR_TEXT_LIFETIME / 3);
    DecursiveTextFrame:SetTimeVisible(DCR_TEXT_LIFETIME);
    
    -- add support Earth panel
    if(EarthFeature_AddButton) then
	EarthFeature_AddButton(
	{
	    id = "Decursive";
	    name = BINDING_HEADER_DECURSIVE;
	    subtext = DCR_SKIP_OPT_STR;
	    tooltip = BINDING_NAME_DCRSHOW;
	    icon = "Interface\\Icons\\Spell_Nature_RemoveCurse";
	    callback = Dcr_ShowHidePriorityListUI;
	}
        );
    end




end --}}}

function Dcr_ReConfigure() --{{{

    if not DCR_HAS_SPELLS then
	return;
    end

    Dcr_debug_bis("Dcr_ReConfigure was called!");

    local DoNotReconfigure = true;

    DoNotReconfigure = Dcr_CheckSpellName(DCR_SPELL_MAGIC_1[1], DCR_SPELL_MAGIC_1[2], DCR_SPELL_MAGIC_1[3]);
    DoNotReconfigure = Dcr_CheckSpellName(DCR_SPELL_MAGIC_2[1], DCR_SPELL_MAGIC_2[2], DCR_SPELL_MAGIC_2[3]);

    DoNotReconfigure = Dcr_CheckSpellName(DCR_SPELL_ENEMY_MAGIC_1[1], DCR_SPELL_ENEMY_MAGIC_1[2], DCR_SPELL_ENEMY_MAGIC_1[3]);
    DoNotReconfigure = Dcr_CheckSpellName(DCR_SPELL_ENEMY_MAGIC_2[1], DCR_SPELL_ENEMY_MAGIC_2[2], DCR_SPELL_ENEMY_MAGIC_2[3]);

    DoNotReconfigure = Dcr_CheckSpellName(DCR_SPELL_DISEASE_1[1], DCR_SPELL_DISEASE_1[2], DCR_SPELL_DISEASE_1[3]);
    DoNotReconfigure = Dcr_CheckSpellName(DCR_SPELL_DISEASE_2[1], DCR_SPELL_DISEASE_2[2], DCR_SPELL_DISEASE_2[3]);

    DoNotReconfigure = Dcr_CheckSpellName(DCR_SPELL_POISON_1[1], DCR_SPELL_POISON_1[2], DCR_SPELL_POISON_1[3]);
    DoNotReconfigure = Dcr_CheckSpellName(DCR_SPELL_POISON_2[1], DCR_SPELL_POISON_2[2], DCR_SPELL_POISON_2[3]);

    DoNotReconfigure = Dcr_CheckSpellName(DCR_SPELL_CURSE[1], DCR_SPELL_CURSE[2], DCR_SPELL_CURSE[3]);

    if DoNotReconfigure == false then
	Dcr_debug_bis("Dcr_ReConfigure RECONFIGURATION!");
	Dcr_Configure();
	return;
    end
    Dcr_debug_bis("Dcr_ReConfigure No reconfiguration required!");

end --}}}

function Dcr_Configure() --{{{

    -- first empty out the old "spellbook"
    DCR_HAS_SPELLS = false;
    DCR_SPELL_MAGIC_1 = {0,"", ""};
    DCR_SPELL_MAGIC_2 = {0,"", ""};
    DCR_CAN_CURE_MAGIC = false;
    DCR_SPELL_ENEMY_MAGIC_1 = {0,"", ""};
    DCR_SPELL_ENEMY_MAGIC_2 = {0,"", ""};
    DCR_CAN_CURE_ENEMY_MAGIC = false;
    DCR_SPELL_DISEASE_1 = {0,"", ""};
    DCR_SPELL_DISEASE_2 = {0,"", ""};
    DCR_CAN_CURE_DISEASE = false;
    DCR_SPELL_POISON_1 = {0,"", ""};
    DCR_SPELL_POISON_2 = {0,"", ""};
    DCR_CAN_CURE_POISON = false;
    DCR_SPELL_CURSE = {0,"", ""};
    DCR_CAN_CURE_CURSE = false;


    Dcr_debug_bis("Configuring Decursive...");
    -- parse through the entire library...
    -- look for known cleaning spells...
    -- this will be called everytime the spellbook changes

    -- this is just used to make things simpler in the checking
    local Dcr_Name_Array = {
	[DCR_SPELL_CURE_DISEASE] = true,
	[DCR_SPELL_ABOLISH_DISEASE] = true,
	[DCR_SPELL_PURIFY] = true,
	[DCR_SPELL_CLEANSE] = true,
	[DCR_SPELL_DISPELL_MAGIC] = true,
	[DCR_SPELL_CURE_POISON] = true,
	[DCR_SPELL_ABOLISH_POISON] = true,
	[DCR_SPELL_REMOVE_LESSER_CURSE] = true,
	[DCR_SPELL_REMOVE_CURSE] = true,
	[DCR_SPELL_PURGE] = true,
	[DCR_PET_FEL_CAST] = true,
	[DCR_PET_DOOM_CAST] = true,
    }

    local i = 1;

    local BookType = BOOKTYPE_SPELL;
    local break_flag = false
    while not break_flag  do
	while (true) do -- I wish there was a continue statement in LUA...
	    local spellName, spellRank = GetSpellName(i, BookType);
	    if (not spellName) then
		if (BookType == BOOKTYPE_PET) then
		    break_flag = true;
		    break;
		end
		BookType = BOOKTYPE_PET;
		i = 1;
		break;

	    end

	    Dcr_debug( "Checking spell - "..spellName);

	    if (Dcr_Name_Array[spellName]) then
		Dcr_debug( "Its one we care about");
		DCR_HAS_SPELLS = true;

		-- any of them will work for the cooldown... we store the last
		DCR_SPELL_COOLDOWN_CHECK[1] = i; DCR_SPELL_COOLDOWN_CHECK[2] = BookType;

		-- put it in the range icon array
		--local icon = GetSpellTexture(i, BookType)
		--Dcr_CuringAction_Icons[icon] = spellName;

		-- print out the spell
		Dcr_debug( string.gsub(DCR_SPELL_FOUND, "$s", spellName));
		if (Dcr_Print_Spell_Found) then
		    Dcr_println( string.gsub(DCR_SPELL_FOUND, "$s", spellName));
		end

		-- big ass if statement... due to the way that the different localizations work
		-- I used to do this more elegantly... but the german WoW broke it

		if ((spellName == DCR_SPELL_CURE_DISEASE) or (spellName == DCR_SPELL_ABOLISH_DISEASE) or
		    (spellName == DCR_SPELL_PURIFY) or (spellName == DCR_SPELL_CLEANSE)) then
		    DCR_CAN_CURE_DISEASE = true;
		    if ((spellName == DCR_SPELL_CURE_DISEASE) or (spellName == DCR_SPELL_PURIFY)) then
			Dcr_debug_bis( "Adding to disease 1");
			DCR_SPELL_DISEASE_1[1] = i; DCR_SPELL_DISEASE_1[2] = BookType; DCR_SPELL_DISEASE_1[3] = spellName;
		    else
			Dcr_debug_bis( "Adding to disease 2");
			DCR_SPELL_DISEASE_2[1] = i; DCR_SPELL_DISEASE_2[2] = BookType; DCR_SPELL_DISEASE_2[3] = spellName;
		    end
		end

		if ((spellName == DCR_SPELL_CURE_POISON) or (spellName == DCR_SPELL_ABOLISH_POISON) or
		    (spellName == DCR_SPELL_PURIFY) or (spellName == DCR_SPELL_CLEANSE)) then
		    DCR_CAN_CURE_POISON = true;
		    if ((spellName == DCR_SPELL_CURE_POISON) or (spellName == DCR_SPELL_PURIFY)) then
			Dcr_debug_bis( "Adding to poison 1");
			DCR_SPELL_POISON_1[1] = i; DCR_SPELL_POISON_1[2] = BookType; DCR_SPELL_POISON_1[3] = spellName;
		    else
			Dcr_debug_bis( "Adding to poison 2");
			DCR_SPELL_POISON_2[1] = i; DCR_SPELL_POISON_2[2] = BookType; DCR_SPELL_POISON_2[3] = spellName;
		    end
		end

		if ((spellName == DCR_SPELL_REMOVE_CURSE) or (spellName == DCR_SPELL_REMOVE_LESSER_CURSE)) then
		    Dcr_debug_bis( "Adding to curse");
		    DCR_CAN_CURE_CURSE = true;
		    DCR_SPELL_CURSE[1] = i; DCR_SPELL_CURSE[2] =  BookType; DCR_SPELL_CURSE[3] = spellName;
		end

		if ((spellName == DCR_SPELL_DISPELL_MAGIC) or (spellName == DCR_SPELL_CLEANSE) or (spellName == DCR_PET_FEL_CAST) or (spellName == DCR_PET_DOOM_CAST)) then
		    DCR_CAN_CURE_MAGIC = true;
		    if (spellName == DCR_SPELL_CLEANSE) then
			Dcr_debug_bis( "Adding to magic 1");
			DCR_SPELL_MAGIC_1[1] = i; DCR_SPELL_MAGIC_1[2] = BookType; DCR_SPELL_MAGIC_1[3] = spellName;
		    else
			if (spellRank == DCR_SPELL_RANK_1) then
			    Dcr_debug_bis( "Adding to magic 1");
			    DCR_SPELL_MAGIC_1[1] = i; DCR_SPELL_MAGIC_1[2] = BookType; DCR_SPELL_MAGIC_1[3] = spellName;
			else
			    Dcr_debug( "adding to magic 2");
			    Dcr_debug_bis( "Adding to magic 2");
			    DCR_SPELL_MAGIC_2[1] = i; DCR_SPELL_MAGIC_2[2] = BookType; DCR_SPELL_MAGIC_2[3] = spellName;
			end
		    end
		end

		if ((spellName == DCR_SPELL_DISPELL_MAGIC) or (spellName == DCR_SPELL_PURGE) or (spellName == DCR_PET_FEL_CAST) or (spellName == DCR_PET_DOOM_CAST)) then
		    DCR_CAN_CURE_ENEMY_MAGIC = true;
		    if (spellRank == DCR_SPELL_RANK_1) then
			Dcr_debug_bis( "Adding to enemy magic 1");
			DCR_SPELL_ENEMY_MAGIC_1[1] = i; DCR_SPELL_ENEMY_MAGIC_1[2] = BookType; DCR_SPELL_ENEMY_MAGIC_1[3] = spellName;
		    else
			Dcr_debug_bis( "Adding to enemy magic 2");
			DCR_SPELL_ENEMY_MAGIC_2[1] = i; DCR_SPELL_ENEMY_MAGIC_2[2] = BookType; DCR_SPELL_ENEMY_MAGIC_2[3] = spellName;
		    end
		end

	    end

	    i = i + 1
	end
    end

    local _, PlayerClass = UnitClass("player");

    Dcr_PlayerClass = PlayerClass;

    -- verify OrderList consistency
    VerifyOrderList();
    -- configure the cure order list
    Dcr_SetCureOrderList ();

end --}}}

function Dcr_CheckSpellName (id, booktype, spellname) --{{{

    if id ~= 0  then
	Dcr_debug_bis("testing spell for name changes: id="..id);
	local found_spellname, spellrank = GetSpellName(id, booktype);

	if spellname ~= found_spellname then
	    return false;
	end
    end

    return true;
end --}}}


--[[
function Dcr_DecurseChoose (button, )
end
--]]

-- }}}
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- EVENT AND MAIN ONUPDATE FUNCTIONS {{{
-------------------------------------------------------------------------------
function Dcr_OnLoad (Frame) --{{{
   Frame:RegisterEvent("PLAYER_LOGIN");
end --}}}

function Dcr_OnEvent (event) --{{{
    local Frame = this;

     -- Dcr_debug_bis ("Event was catch: " .. event);

    if (event == "UNIT_PET" ) then
	if (UnitInRaid(arg1) or UnitInParty(arg1)) then
	    Dcr_Groups_datas_are_invalid = true;
	end
	if ( arg1 == "player" and not Dcr_CheckingPET) then
	    Dcr_CheckingPET = true;
	    Dcr_debug_bis ("PLAYER pet detected! Poll in 2 seconds");
	end
	return;
    elseif (event == "PLAYER_ENTER_COMBAT") then
	Dcr_EnterCombat();
	return;
    elseif (event == "PLAYER_LEAVE_COMBAT") then
	Dcr_LeaveCombat();
	return;
    elseif (event == "UI_ERROR_MESSAGE") then

	if (arg1 == SPELL_FAILED_LINE_OF_SIGHT or arg1 == SPELL_FAILED_BAD_TARGETS) then
	    Dcr_SpellCastFailed();

	    -- Throw an error if WE were casting something
	    if (Dcr_Casting_Spell_On and arg1 == SPELL_FAILED_LINE_OF_SIGHT) then
		Dcr_errln("Out of sight!");
	    end

	end

	return;

    elseif (event == "SPELLCAST_STOP") then
	Dcr_SpellWasCast();
	return;
    elseif (not Dcr_DelayedReconf and event == "SPELLS_CHANGED" and arg1==nil) then
	Dcr_DelayedReconf = true;
	return;
    elseif (event == "PARTY_MEMBERS_CHANGED" or event == "PARTY_LEADER_CHANGED") then
	Dcr_Groups_datas_are_invalid = true; 
	Dcr_debug_bis("Groups changed");
	return;
    elseif (event == "LEARNED_SPELL_IN_TAB") then
	Dcr_Configure();
	return;
    end

    if (event == "PLAYER_LOGIN") then
	Frame:RegisterEvent("PLAYER_ENTERING_WORLD");
	Frame:RegisterEvent("PLAYER_LEAVING_WORLD");
	Dcr_Init();
	return;
    end

    if (
	(event == "PLAYER_ENTERING_WORLD")
	) then
	Dcr_Groups_datas_are_invalid = true;
	Frame:RegisterEvent("PLAYER_ENTER_COMBAT");
	Frame:RegisterEvent("PLAYER_LEAVE_COMBAT");
	-- Frame:RegisterEvent("SPELLCAST_FAILED");
	-- Frame:RegisterEvent("SPELLCAST_INTERRUPTED");
	Frame:RegisterEvent("SPELLCAST_STOP");
	Frame:RegisterEvent("UNIT_PET");
	Frame:RegisterEvent("SPELLS_CHANGED");
	Frame:RegisterEvent("LEARNED_SPELL_IN_TAB");
	Frame:RegisterEvent("UI_ERROR_MESSAGE");
	
	Frame:RegisterEvent("PARTY_MEMBERS_CHANGED");
	Frame:RegisterEvent("PARTY_LEADER_CHANGED");

    elseif (event == "PLAYER_LEAVING_WORLD") then

	Frame:UnregisterEvent("PLAYER_ENTER_COMBAT");
	Frame:UnregisterEvent("PLAYER_LEAVE_COMBAT");
	-- Frame:UnregisterEvent("SPELLCAST_FAILED");
	-- Frame:UnregisterEvent("SPELLCAST_INTERRUPTED");
	Frame:UnregisterEvent("SPELLCAST_STOP");
	Frame:UnregisterEvent("UNIT_PET");
	Frame:UnregisterEvent("SPELLS_CHANGED");
	Frame:UnregisterEvent("LEARNED_SPELL_IN_TAB");
	Frame:UnregisterEvent("UI_ERROR_MESSAGE");
	
	Frame:UnregisterEvent("PARTY_MEMBERS_CHANGED");
	Frame:UnregisterEvent("PARTY_LEADER_CHANGED");
    end

end --}}}

-- This function update Decursive states :
--   - Reconf if needed
--   - check for a pet
--   - clear the black list
--   - clear cached buff and debuffs
function Dcr_OnUpdate(arg1) --{{{


    --checkinfgfor reconf need
    if Dcr_DelayedReconf then
	Dcr_DelayedReconf_timer = Dcr_DelayedReconf_timer + arg1;
	if (Dcr_DelayedReconf_timer >= Dcr_DelayedReconf_delay) then
	    Dcr_DelayedReconf_timer = 0;

	    Dcr_ReConfigure();
	    Dcr_DelayedReconf = false;
	    return;
	end
    end

    -- checking for pet
    if (Dcr_CheckingPET) then
	Dcr_CheckPet_Timer = Dcr_CheckPet_Timer + arg1;

	if (Dcr_CheckPet_Timer >= Dcr_CheckPet_Delay) then
	    Dcr_CheckPet_Timer = 0;

	    curr_DemonType = UnitCreatureFamily("pet");

	    if (curr_DemonType) then Dcr_debug_bis ("Pet Type: " .. curr_DemonType);  end;

	    if (last_DemonType ~= curr_DemonType) then
		if (curr_DemonType) then Dcr_debug_bis ("Pet name changed: " .. curr_DemonType); else  Dcr_debug_bis ("No more pet!"); end;

		last_DemonType = curr_DemonType;
		Dcr_Configure();
	    end

	    Dcr_CheckingPET = false;
	    return;
	end

    end

    -- clean up the blacklist
    for unit in Dcr_Blacklist_Array do
	Dcr_Blacklist_Array[unit] = Dcr_Blacklist_Array[unit] - arg1;
	if (Dcr_Blacklist_Array[unit] < 0) then
	    Dcr_Blacklist_Array[unit] = nil;
	end
    end

    -- wow the next command SPAMS alot
    -- Dcr_debug("got update "..arg1);

    -- this is the fix for the AttackTarget() bug
    if (Dcr_Delay_Timer > 0) then
	Dcr_Delay_Timer = Dcr_Delay_Timer - arg1;
	if (Dcr_Delay_Timer <= 0) then
	    if (not Dcr_CombatMode) then
		Dcr_debug("trying to reset the combat mode");
		AttackTarget();
	    else
		Dcr_debug("already in combat mode");
	    end
	end;
    end

    -- clear Debuffs and Buffs caches
    if (Dcr_Debuff_Texture_to_name_cache_life ~= 0) then
	Dcr_Debuff_Texture_to_name_cache_life = Dcr_Debuff_Texture_to_name_cache_life - arg1;

	if (Dcr_Debuff_Texture_to_name_cache_life < 0) then
	    Dcr_Debuff_Texture_to_name_cache_life = 0;
	    Dcr_Debuff_Texture_to_name_cache = {};
	    Dcr_debug_bis("Debuff cache cleared!");
	end
    end

    if (Dcr_Buff_Texture_to_name_cache_life ~= 0) then
	Dcr_Buff_Texture_to_name_cache_life = Dcr_Buff_Texture_to_name_cache_life - arg1;

	if (Dcr_Buff_Texture_to_name_cache_life < 0) then
	    Dcr_Buff_Texture_to_name_cache_life = 0;
	    Dcr_Buff_Texture_to_name_cache = {};
	    Dcr_debug_bis("Buff cache cleared!");
	end
    end

    if (RestorSelfAutoCast) then
	RestorSelfAutoCastTimeOut = RestorSelfAutoCastTimeOut - arg1;
	if (RestorSelfAutoCastTimeOut < 0) then
	    RestorSelfAutoCast = false;
	    SetCVar("autoSelfCast", "1");

	    Dcr_debug_bis("autoSelfCast restored!");
	end
    end

end --}}}

-- the combat saver functions and events. These keep us in combat mode // {{{
-------------------------------------------------------------------------------
function Dcr_EnterCombat() --{{{
    Dcr_debug("Entering combat");
    Dcr_CombatMode = true;
end --}}}

function Dcr_LeaveCombat() --{{{
    Dcr_debug("Leaving combat");
    Dcr_CombatMode = false;
end --}}}
-- }}}

function Dcr_SpellCastFailed() --{{{
    if (
	Dcr_Casting_Spell_On	    -- a cast failed and we were casting on someone
	and not (
	UnitIsUnit(Dcr_Casting_Spell_On, "player")   -- we do not blacklist ourself
	or
	(
	-- we do not blacklist people in the priority list
	Dcr_Saved.DoNot_Blacklist_Prio_List and Dcr_IsInPriorList ( (UnitName(Dcr_Casting_Spell_On)) )
	)
	)
	) then

	Dcr_Blacklist_Array[Dcr_Casting_Spell_On] = nil;
	Dcr_Blacklist_Array[Dcr_Casting_Spell_On] = Dcr_Saved.CureBlacklist;
	DCR_ThisCleanBlaclisted[Dcr_Casting_Spell_On] = true;
    end
end --}}}

function Dcr_SpellWasCast() --{{{
    Dcr_Casting_Spell_On = nil;
end --}}}
-- }}}
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Scanning functionalties {{{
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- GROUP STATUS UPDATE, these functions update the UNIT table to scan {{{
-------------------------------------------------------------------------------

-- this gets an array of units for us to check
function Dcr_GetUnitArray() --{{{

    -- if the groups composition did not changed
    if (not Dcr_Groups_datas_are_invalid) then
	return;
    end

    Dcr_debug_bis ("|cFFFF44FF-->|r Updating Units Array");

    local pname;
    local raidnum = GetNumRaidMembers();
    local MyName = (UnitName( "player"));

    local SortIndex = 1;

    -- clear all the arrays
    InternalPrioList = { };
    InternalSkipList = { };
    Dcr_Unit_Array   = { };
    SortingTable     = { };

    -- First sort the prioritylist (remove missing units) and add its content to the main list
    for _, pname in Dcr_Saved.PriorityList do
	local unit = Dcr_NameToUnit( pname );
	if (unit) then
	    InternalPrioList[pname] = unit;
	    -- use this loop to add prio characters to the main list
	    Dcr_Unit_Array[pname] = unit;
	    Dcr_AddToSort(unit, SortIndex); SortIndex = SortIndex + 1;
	end
    end

    -- The same with the skip list
    for _, pname in Dcr_Saved.SkipList do
	local unit = Dcr_NameToUnit( pname );
	if (unit) then
	    InternalSkipList[pname] = unit;
	end
    end

    -- Add the player to the main list if needed
    if (not Dcr_IsInSkipOrPriorList(MyName)) then
	Dcr_Unit_Array[MyName] = "player";
	Dcr_AddToSort( "player", SortIndex); SortIndex = SortIndex + 1;
    end

    -- add the party members... if they exist
    for i = 1, 4 do
	if (UnitExists("party"..i)) then
	    pname = (UnitName("party"..i));
	    if (not pname) then -- at logon sometimes pname is nil...
		pname = "party"..i;
	    end
	    -- check the name to see if we skip
	    if (not Dcr_IsInSkipOrPriorList(pname)) then
		-- we don't skip him
		Dcr_Unit_Array[pname] = "party"..i;
		Dcr_AddToSort("party"..i, SortIndex); SortIndex = SortIndex + 1;
	    end
	end
    end


    if ( raidnum > 0 ) then -- if we are in a raid
	local temp_raid_table = {}; -- used to avoid the repeated call of GetRaidRosterInfo
	local currentGroup = 0;

	-- Cache the raid roster info eliminating useless info and already listed members
	for i = 1, raidnum do
	    local rName, _, rGroup = GetRaidRosterInfo(i);

	    -- find our group (a whole iteration is required, raid info are not ordered)
	    if ( currentGroup==0 and rName == MyName) then
		currentGroup = rGroup;
	    end

	    -- add all except: our own group and member to skip
	    if (currentGroup ~= rGroup and not Dcr_IsInSkipOrPriorList(rName)) then
		temp_raid_table[i] = {};
		if (not rName) then -- at logon sometimes rName is nil...
		    rName = rGroup.."unknown"..i;
		end
		temp_raid_table[i].rName    = rName;
		temp_raid_table[i].rGroup   = rGroup;
		temp_raid_table[i].rIndex   = i; -- I can't trust lua, the manual is not clear at all about table behavior...

		
	    end

	end

	for _, raidMember in temp_raid_table do

	    if (raidMember.rGroup > currentGroup) then
		    Dcr_Unit_Array[raidMember.rName] = "raid" .. raidMember.rIndex;
		    -- add first the groups that are after ours
		    Dcr_AddToSort("raid" .. raidMember.rIndex, raidMember.rGroup * 100 + SortIndex); SortIndex =  SortIndex + 1;
		end

		if (raidMember.rGroup < currentGroup) then
		    Dcr_Unit_Array[raidMember.rName] = "raid" .. raidMember.rIndex;
		    -- add then the groups that are before ours
		    Dcr_AddToSort("raid" .. raidMember.rIndex, raidMember.rGroup * 100 + 1000 + SortIndex); SortIndex = SortIndex + 1;
		end

	end

	SortIndex = SortIndex + 8 * 100 + 1000 + 1;

    end -- END if we are in a raid

    -- Exit if we don't have to scan pets...
    if ( Dcr_Saved.Scan_Pets) then

	-- add our own pet
	if (UnitExists("pet")) then
	    Dcr_Unit_Array[(UnitName("pet"))] = "pet";
	    Dcr_AddToSort("pet", SortIndex); SortIndex = SortIndex + 1;
	end

	-- the parties pets if they have them
	for i = 1, 4 do
	    if (UnitExists("partypet"..i)) then
		pname = (UnitName("partypet"..i));
		if (not pname) then -- at logon sometimes pname is nil...
		    pname = "partypet"..i;
		end
		Dcr_Unit_Array[pname] = "partypet"..i;
		Dcr_AddToSort("partypet"..i, SortIndex); SortIndex = SortIndex + 1;
	    end
	end

	-- and then the raid pets if they are out
	if (raidnum > 0) then
	    for i = 1, raidnum do
		if (UnitExists("raidpet"..i)) then
		    pname = (UnitName("raidpet"..i));
		    if (not pname) then -- at logon sometimes pname is nil...
			pname = "raidpet"..i;
		    end
		    -- add it only of not already in
		    if (not Dcr_Unit_Array[pname]) then
			Dcr_Unit_Array[pname] = "raidpet"..i;
			Dcr_AddToSort("raidpet"..i, SortIndex); SortIndex = SortIndex + 1;
		    end
		end
	    end
	end
    end

    local Lua_Table_Library_Is_Really_A_Piece_Of_Shit = {};
    for _, value in Dcr_Unit_Array do
	table.insert(Lua_Table_Library_Is_Really_A_Piece_Of_Shit, value);
    end
    Dcr_Unit_ArrayByName = Dcr_Unit_Array;
    Dcr_Unit_Array = Lua_Table_Library_Is_Really_A_Piece_Of_Shit;

    table.sort(Dcr_Unit_Array, function (a,b) return SortingTable[a] < SortingTable[b] end);

    target_added = false;
    Dcr_Groups_datas_are_invalid = false;
    return;
end --}}}

function Dcr_AddToSort (unit, index) -- // {{{
    if (Dcr_Saved.Random_Order and (not InternalPrioList[(UnitName(unit))]) and not UnitIsUnit(unit,"player")) then
	index = random (1, 3000);
    end
    SortingTable[unit] = index;
    -- Dcr_debug_bis(unit.." - "..index.."   ");
end --}}}

-- Raid/Party Name Check Function (a terrible function, need optimising)
-- this returns the UnitID that the Name points to
-- this does not check "target" or "mouseover"
function Dcr_NameToUnit( Name) --{{{
    if (not Name) then
	return false;
    elseif (Name == (UnitName("player"))) then
	return "player";
    elseif (Name == (UnitName("pet"))) then
	return "pet";
    elseif (Name == (UnitName("party1"))) then
	return "party1";
    elseif (Name == (UnitName("party2"))) then
	return "party2";
    elseif (Name == (UnitName("party3"))) then
	return "party3";
    elseif (Name == (UnitName("party4"))) then
	return "party4";
    elseif (Name == (UnitName("partypet1"))) then
	return "partypet1";
    elseif (Name == (UnitName("partypet2"))) then
	return "partypet2";
    elseif (Name == (UnitName("partypet3"))) then
	return "partypet3";
    elseif (Name == (UnitName("partypet4"))) then
	return "partypet4";
    else
	local numRaidMembers = GetNumRaidMembers();
	if (numRaidMembers > 0) then
	    -- we are in a raid
	    local i;
	    for i=1, numRaidMembers do
		local RaidName = GetRaidRosterInfo(i);
		if ( Name == RaidName) then
		    return "raid"..i;
		end
		if ( Name == (UnitName("raidpet"..i))) then
		    return "raidpet"..i;
		end
	    end
	end
    end
    return false;
end --}}}
-- }}}
-------------------------------------------------------------------------------

function Dcr_Clean(UseThisTarget, SwitchToTarget) --{{{
    -----------------------------------------------------------------------
    -- first we do the setup, make sure we can cast the spells
    -----------------------------------------------------------------------

    -- reset autoSelfCast restor timeout while you're spamming...
    RestorSelfAutoCastTimeOut = 1;

    if (GetCVar("autoSelfCast") == "1") then
	RestorSelfAutoCast = true;
	Dcr_debug_bis("autoSelfCast is active... Temp disabling");
	SetCVar("autoSelfCast", "0");
    end

    -- Dcr_CheckAuSelfCastStaus ();

    if (not DCR_HAS_SPELLS) then
	-- check the spellbook again... (mod by Archarodim)
	Dcr_errln(DCR_NO_SPELLS);
	Dcr_Configure();
	if (not DCR_HAS_SPELLS) then
	    Dcr_errln(DCR_NO_SPELLS);
	    return false;
	end
    end


    Dcr_RestoreTarget = true;
    if (UseThisTarget and SwitchToTarget) then
	TargetUnit(UseThisTarget);
	Dcr_RestoreTarget = false;
    end

    if (Dcr_AlreadyCleanning) then
	Dcr_debug_bis("I'm already cleaning!!!!"); -- seems to be useless
	return false;
    end

    Dcr_AlreadyCleanning = true;

    -- will cancel anyspell upon Decursive call, may be dangerous...
    SpellStopTargeting();
    -- always cancel current spell
    SpellStopCasting();

    local _, cooldown = GetSpellCooldown(DCR_SPELL_COOLDOWN_CHECK[1], DCR_SPELL_COOLDOWN_CHECK[2]);
    if (cooldown ~= 0) then
	-- this used to be an errline... changed it to debugg
	Dcr_debug_bis(DCR_NO_SPELLS_RDY);
	Dcr_AlreadyCleanning = false;
	return false;
    end


    -- reset blaclisted people in this clean session
    DCR_ThisCleanBlaclisted = { };
    -- reset the number of out of ranged units for this clean session
    DCR_ThisNumberOoRUnits  = 0;


    -----------------------------------------------------------------------
    -----------------------------------------------------------------------
    -- then we see what our target looks like, if freindly, check them
    -----------------------------------------------------------------------

    local targetEnemy = false;
    local targetName = nil; -- if friendly
    local cleaned = false;
    local resetCombatMode = false;
    Dcr_Casting_Spell_On = nil;



    if (UnitExists("target")) then
	Dcr_debug("We have a target");
	-- if we are currently targeting something
	-- ###
	-- This block is here to know what the current target is, so we can clean it, restor it
	-- or clear the target at the end of this function
	-- ###

	if (Dcr_CombatMode) then
	    Dcr_debug("when done scanning... if switched target reset the mode!");
	    resetCombatMode = true;
	end

	if (
	    ( UnitIsFriend("target", "player") ) -- unit is a friend ie: not FriendLY just a friend that could be MC :/
	    and 
	    (not UnitIsCharmed("target")) -- and is not mind controlled
	    ) then
	    Dcr_debug(" It is friendly");
	    -- try cleaning the current target first
	    -- if we are not asked to clean a specific target
	    -- or if we already switched to the target to clean
	    if (not UseThisTarget or SwitchToTarget) then 
		cleaned = Dcr_CureUnit("target");
	    end

	    -- we are targeting a player that is not MC, save the name to switch back later
	    targetName = (UnitName("target"));

	else -- unit is aggressiv or is charmed
	    Dcr_debug(" It is not friendly");
	    -- we are targeting an enemy... switch back when done
	    targetEnemy = true;

	    if ( UnitIsCharmed("target")) then
		Dcr_debug( "Unit is enemey... and charmed... so its a mind controlled friendly");
		-- try cleaning mind controlled person first
		if (not UseThisTarget or SwitchToTarget) then 
		    cleaned = Dcr_CureUnit("target");
		end
	    end
	end
    end

    if (UseThisTarget and not SwitchToTarget and not cleaned) then
	Dcr_debug( "A target to clean was specifyed");
	if (UnitIsVisible(UseThisTarget)) then
	    -- if the unit is even close by


	    if (DCR_CAN_CURE_ENEMY_MAGIC and UnitIsCharmed(UseThisTarget)) then
		-- if the unit is mind controlled and we can cure it
		if (Dcr_CureUnit(UseThisTarget)) then
		    cleaned = true;
		end

	    else -- we can't cure magic on enemies or the unit is not charmed
		if (not Dcr_CheckUnitStealth(UseThisTarget)) then
		    -- we are either not ignoring the stealthed people,
		    -- or it's not stealthed
		    if (Dcr_CureUnit(UseThisTarget)) then
			cleaned = true;
		    end
		end
	    end
	end
    end

    if (not cleaned) then

	-----------------------------------------------------------------------
	-----------------------------------------------------------------------
	-- now we check the partys (raid and local)
	-----------------------------------------------------------------------
	Dcr_debug( "Checking the arrays");

	-- this is the cleaning loops...
	Dcr_GetUnitArray();
	-- the order is player, party1-4, raid, pet, partypet1-4, raidpet1-40
	-- the raid is current party + 1 to 8... then 1 to current party - 1

	-- mind control first
	if( not cleaned) then
	    Dcr_debug(" looking for mind controll");
	    if (DCR_CAN_CURE_ENEMY_MAGIC) then
		for _, unit in Dcr_Unit_Array do
		    -- all of the units...
		    if (not Dcr_Blacklist_Array[unit]) then
			-- if the unit is not black listed
			if (UnitIsVisible(unit)) then
			    -- if the unit is even close by
			    if (UnitIsCharmed(unit)) then
				-- if the unit is mind controlled
				if (Dcr_CureUnit(unit)) then
				    cleaned = true;
				    break;
				end
			    end
			end
		    end
		end
	    end
	end

	-- normal cleaning
	if( not cleaned) then
	    -- Dcr_debug(" normal loop");
	    for _, unit in Dcr_Unit_Array do
		-- all of the units...
		if (not Dcr_Blacklist_Array[unit]) then
		    -- if the unit is not black listed
		    if (UnitIsVisible(unit)) then
			-- if the unit is even close by
			if (not UnitIsCharmed(unit)) then
			    -- we can't cure mind controlled people
			    if (not Dcr_CheckUnitStealth(unit)) then
				-- we are either not ignoring the stealthed people,
				-- or it's not stealthed
				if (Dcr_CureUnit(unit)) then
				    cleaned = true;
				    break;
				end
			    end
			end
		    end
		end
	    end
	end

	if ( not cleaned) then
	    Dcr_debug(" double check the black list");
	    for unit in Dcr_Blacklist_Array do
		-- now... all of the black listed units
		if (not DCR_ThisCleanBlaclisted[unit]) then
		    -- we do not re-check unit that have been blaclisted just before
		    if (UnitExists(unit)) then
			-- if the unit still exists
			if (UnitIsVisible(unit)) then
			    -- if the unit is even close by
			    if (not Dcr_CheckUnitStealth(unit)) then
				-- we are either not ignoring the stealthed people,
				-- or it's not stealthed
				if (Dcr_CureUnit(unit)) then
				    -- hey... we cleaned it... remove from the black list
				    Dcr_Blacklist_Array[unit] = nil;
				    cleaned = true;
				    break;
				end
			    end
			end
		    end
		end
	    end
	end
    end
    -----------------------------------------------------------------------
    -----------------------------------------------------------------------
    -- ok... done with the cleaning... lets try to clean this up
    -- basically switch targets back if they were changed
    -----------------------------------------------------------------------

    if (not SwitchToTarget) then -- if not explicitly ask to switch to the target
	if (targetEnemy) then
	    -- we had somethign "bad" targeted
	    if (not UnitIsEnemy("target", "player")) then
		-- and we tested for range, cast dispell magic, or some how broke target... switch back
		Dcr_debug("targeting enemy");
		TargetUnit("playertarget"); -- XXX to test
		if (resetCombatMode) then
		    -- resetCombatMode is the fix for "auto attack"
		    Dcr_Delay_Timer = Dcr_SpellCombatDelay;
		    Dcr_debug("done... now we wait for the leave combat event");
		end
	    end
	elseif (targetName) then
	    -- we had a friendly targeted... switch back if not still targeted
	    if ( targetName ~= (UnitName("target")) ) then
		TargetByName(targetName)
	    end
	else
	    -- we had nobody targeted originally
	    if (UnitExists("target")) then
		-- we checked for range
		ClearTarget();
	    end
	end
    end

    if (not cleaned) then
	Dcr_println( DCR_NOT_CLEANED);
    end

    Dcr_AlreadyCleanning = false;
    return cleaned;
end --}}}

-- Buff and debuffs scanning functions {{{
function Dcr_GetUnitBuff (Unit, i) --{{{
    Dcr_ScanningTooltipTextLeft1:SetText("");

    Dcr_ScanningTooltip:SetUnitBuff(Unit, i); -- fill this fake thing with buff info

    return Dcr_ScanningTooltipTextLeft1:GetText(); -- get the buff name

end --}}}

function Dcr_GetUnitDebuff  (Unit, i) --{{{
    local DebuffTexture, debuffApplications, debuff_type;

    DebuffTexture, debuffApplications, debuff_type = UnitDebuff(Unit, i);

    if (DebuffTexture) then

	debuff_name = Dcr_GetUnitDebuffName(Unit, i, DebuffTexture);

	return debuff_name, debuff_type, debuffApplications, DebuffTexture;
    else
	return false, false, false, false;
    end
end --}}}

function Dcr_GetUnitDebuffName  (Unit, i, DebuffTexture) --{{{
    local debuff_name;

    if (not Dcr_Debuff_Texture_to_name_cache[DebuffTexture]) then

	Dcr_ScanningTooltipTextLeft1:SetText(""); -- clean

	Dcr_ScanningTooltip:SetUnitDebuff(Unit, i); -- fill this fake thing with Debuff info

	debuff_name = Dcr_ScanningTooltipTextLeft1:GetText(); -- get the debuff name from the tooltip

	if (debuff_name == nil) then
	    -- this should only happen when things are "broke"
	    Dcr_errln("%$#@*& !!! Impossible to get debuff info from tooltip :'(, if this error continues to show up, type /console reloadui");
	    Dcr_debug( "Debuff name not found!");
	elseif (debuff_name ~= "") then
	    -- reset cache lifetime
	    Dcr_Debuff_Texture_to_name_cache_life = DEBUFF_CACHE_LIFE;
	    Dcr_debug_bis("Debuff cache lifetime RESET (assignement) !");
	    -- save the name to cache for faster access
	    Dcr_Debuff_Texture_to_name_cache[DebuffTexture] = debuff_name;
	    Dcr_debug_bis(debuff_name .. " put in cache ( " .. DebuffTexture .. " )");
	end

    else
	debuff_name = Dcr_Debuff_Texture_to_name_cache[DebuffTexture];
    end

    -- reset cache lifetime
    -- Dcr_debug_bis("Debuff cache lifetime RESET (normal) !");
    Dcr_Debuff_Texture_to_name_cache_life = DEBUFF_CACHE_LIFE;

    return debuff_name;
end --}}}

function Dcr_GetUnitDebuffAll (unit) --{{{
    local DebuffTexture, debuffApplications, debuff_type, debuff_name, i;
    local ThisUnitDebuffs = {};

    i = 1;
    while (true) do
	debuff_name, debuff_type, debuffApplications, DebuffTexture = Dcr_GetUnitDebuff(unit, i);

	if (not debuff_name) then
	    break;
	end
	ThisUnitDebuffs[debuff_name] = {};
	ThisUnitDebuffs[debuff_name].DebuffTexture	= DebuffTexture;
	ThisUnitDebuffs[debuff_name].debuffApplications = debuffApplications;
	ThisUnitDebuffs[debuff_name].debuff_type	= debuff_type;
	ThisUnitDebuffs[debuff_name].debuff_name	= debuff_name;
	ThisUnitDebuffs[debuff_name].index		= i;

	i = i + 1;
    end


    return ThisUnitDebuffs;
end --}}}


function Dcr_CheckUnitForBuff(Unit, BuffNameToCheck) --{{{
    local i = 1, texture, found_buff_name;

    while (true) do
	texture = UnitBuff (Unit, i);

	if (not texture) then
	    break;
	end

	if (not Dcr_Buff_Texture_to_name_cache[texture]) then
	    found_buff_name = Dcr_GetUnitBuff(Unit, i);

	    if (found_buff_name == nil) then
		-- this should only happen when things are "broke"
		Dcr_errln("%$#@*& !!! Impossible to get buff info from tooltip :'(, if this error continues to show up, type /console reloadui");
		Dcr_debug( "Buff name not found!");
	    elseif (found_buff_name ~= "") then

		-- reset cache lifetime
		Dcr_Buff_Texture_to_name_cache_life = DEBUFF_CACHE_LIFE;
		-- save the name to cache for faster access
		Dcr_Buff_Texture_to_name_cache[texture] = found_buff_name;
		Dcr_debug_bis(found_buff_name .. " put in cache ( " .. texture .. " )");
	    end
	else
	    found_buff_name = Dcr_Buff_Texture_to_name_cache[texture];
	end

	if (i > 1) then 
	    -- reset cache lifetime
	    Dcr_Buff_Texture_to_name_cache_life = DEBUFF_CACHE_LIFE;
	end

	if (found_buff_name == BuffNameToCheck) then
	    return true;
	end

	i = i + 1;
    end
    return false;
end --}}}

function Dcr_CheckUnitStealth(Unit) --{{{
    if (Dcr_Saved.Ingore_Stealthed) then
	for BuffName in DCR_INVISIBLE_LIST do
	    if Dcr_CheckUnitForBuff(Unit, BuffName) then
		return true;
	    end
	end
    end
    return false;
end --}}}
-- }}}

function Dcr_UnitInRange(Unit) --{{{
    if (CheckInteractDistance(Unit, 4)) then
	return true;
    end
    return false;
end --}}}
-- }}}

-------------------------------------------------------------------------------
-- Curring functions {{{
-------------------------------------------------------------------------------
function Dcr_CureUnit(Unit)  --{{{
    Dcr_debug( "Scanning to cure unit - "..Unit);

    local Magic_Count	= 0;
    local Disease_Count = 0;
    local Poison_Count	= 0;
    local Curse_Count	= 0;

    local TClass, UClass = UnitClass(Unit);

    local AllUnitDebuffs = {};

    AllUnitDebuffs = Dcr_GetUnitDebuffAll(Unit);

    local Go_On;

    for debuff_name, debuff_params in AllUnitDebuffs do
	-- the "break" was not working all that well, so we stor a go on variable
	Go_On = true;

	Dcr_debug( debuff_name.." found!");

	-- test if we have to ignore this debuff {{{ --
	-- Ignore the ones that make the target immune... abort the user
	if (DCR_IGNORELIST[debuff_name]) then
	    Dcr_errln( string.gsub( string.gsub(DCR_IGNORE_STRING, "$t", (UnitName(Unit))), "$a", debuff_name));
	    return false;
	end


	-- Ignore debuffs that are in fact buffs
	if (DCR_SKIP_LIST[debuff_name]) then
	    Dcr_errln( string.gsub( string.gsub(DCR_IGNORE_STRING, "$t", (UnitName(Unit))), "$a", debuff_name));
	    Go_On = false; -- == continue
	end

	-- If we are in combat lets see if there is any debuffs we can afford to not remove until ths fight is over
	if (UnitAffectingCombat("player")) then
	    if (DCR_SKIP_BY_CLASS_LIST[UClass]) then
		if (DCR_SKIP_BY_CLASS_LIST[UClass][debuff_name]) then
		    -- these are just ones you don't care about by class
		    Dcr_errln( string.gsub( string.gsub(DCR_IGNORE_STRING, "$t", (UnitName(Unit))), "$a", debuff_name));
		    Go_On = false; -- == continue
		end
	    end
	end
	-- }}}

	if (Go_On) then
	    -- it is one we "care" about... lets catalog it -- {{{ --
	    if (debuff_params.debuff_type and debuff_params.debuff_type ~= "") then
		if (debuff_params.debuff_type == DCR_MAGIC) then
		    Dcr_debug( "it's magic");
		    Magic_Count = Magic_Count + debuff_params.debuffApplications + 1;
		elseif (debuff_params.debuff_type == DCR_DISEASE) then
		    Dcr_debug( "it's disease");
		    Disease_Count = Disease_Count + debuff_params.debuffApplications + 1;
		elseif (debuff_params.debuff_type == DCR_POISON) then
		    Dcr_debug( "it's poison");
		    Poison_Count = Poison_Count + debuff_params.debuffApplications + 1;
		elseif (debuff_params.debuff_type == DCR_CURSE) then
		    Dcr_debug( "it's curse");
		    Curse_Count = Curse_Count + debuff_params.debuffApplications + 1
		else
		    Dcr_debug( "it's unknown - "..debuff_params.debuff_type);
		end
	    else
		Dcr_debug( "it's untyped");
	    end
	    -- }}}
	end

    end

    local res = false;
    local counts = {};
    counts.Magic_Count = Magic_Count;
    counts.Curse_Count = Curse_Count;
    counts.Poison_Count = Poison_Count;
    counts.Disease_Count = Disease_Count;


    local i;
    for i = 1, 4 do
	if Curing_functions[i] then
	    res = Curing_functions[i](counts, Unit);
	    if res then
		break;
	    end
	end
    end

    -- order these in the way you find most important 
    --[[
    if (not res) then
	res = Dcr_Cure_Magic( counts, Unit);
    end
    if (not res) then
	res = Dcr_Cure_Curse( counts, Unit);
    end
    if (not res) then
	res = Dcr_Cure_Poison( counts, Unit);
    end
    if (not res) then
	res = Dcr_Cure_Disease( counts, Unit);
    end
    --]]

    return res;
end -- // }}}

function Dcr_Cure_Magic(counts, Unit)  --{{{
    Dcr_debug( "magic count "..counts.Magic_Count);
    if (DCR_CAN_CURE_MAGIC) then
	Dcr_debug( "Can cure magic");
    end
    if (DCR_CAN_CURE_ENEMY_MAGIC) then
	Dcr_debug( "Can cure enemy magic");
    end

    if ( (not (DCR_CAN_CURE_MAGIC or DCR_CAN_CURE_ENEMY_MAGIC)) or (counts.Magic_Count == 0) or not Dcr_Saved.CureMagic) then
	-- here is no magical effects... or
	-- we can't cure magic don't bother going forward
	Dcr_debug( "no magic");
	return false;
    end
    Dcr_debug( "curing magic");

    if ( DCR_CAN_CURE_ENEMY_MAGIC and UnitIsCharmed(Unit) and UnitCanAttack("player", Unit) ) then
	-- unit is charmed... and has magic debuffs on them... and we CAN attack it
	-- there is a good chance that it is the mind controll type spell
	-- the checking for the UnitCanAttack is due to the mind controlled pets and other enslaves
	if (DCR_SPELL_ENEMY_MAGIC_2[1] ~= 0 ) and (Dcr_Saved.AlwaysUseBestSpell or (counts.Magic_Count > 1) or (DCR_SPELL_MAGIC_1[1] == 0)) then
	    return Dcr_Cast_CureSpell( DCR_SPELL_ENEMY_MAGIC_2	, Unit, DCR_CHARMED, true);
	else
	    return Dcr_Cast_CureSpell( DCR_SPELL_ENEMY_MAGIC_1	, Unit, DCR_CHARMED, true);
	end
    elseif (DCR_CAN_CURE_MAGIC and (not UnitCanAttack("player", Unit))) then
	-- we can cure magic... and the unit is NOT hostile to us (we can't cast on those)
	if (DCR_SPELL_MAGIC_2[1] ~= 0 ) and (Dcr_Saved.AlwaysUseBestSpell or (counts.Magic_Count > 1) or (DCR_SPELL_MAGIC_1[1] == 0)) then
	    return Dcr_Cast_CureSpell( DCR_SPELL_MAGIC_2	, Unit, DCR_MAGIC, DCR_CAN_CURE_ENEMY_MAGIC);
	else
	    return Dcr_Cast_CureSpell( DCR_SPELL_MAGIC_1, Unit, DCR_MAGIC, DCR_CAN_CURE_ENEMY_MAGIC);
	end
	-- else
	-- what it means:
	-- not (DCR_CAN_CURE_ENEMY_MAGIC and UnitIsCharmed(Unit) and UnitCanAttack("player", Unit)
	-- not (DCR_CAN_CURE_MAGIC and (not UnitCanAttack("player", Unit)))
	--
	-- !DCR_CAN_CURE_ENEMY_MAGIC or !UnitIsCharmed(Unit) or !UnitCanAttack("player", Unit)   =====> not MC or we can't attack it
	-- AND
	-- !DCR_CAN_CURE_MAGIC UnitCanAttack("player", Unit)
	--
	-- we can't cure enemy magic
	-- Dcr_errln("Something strange happened :/ Dcr_Cure_Magic() did nothing :-o");
    end
    return false;
end -- // }}}

function Dcr_Cure_Curse( counts, Unit)  -- {{{
    if ( (not DCR_CAN_CURE_CURSE) or (counts.Curse_Count == 0) or not Dcr_Saved.CureCurse) then
	-- no curses or no curse curing spells
	Dcr_debug( "no curse");
	return false;
    end
    Dcr_debug( "curing curse");

    if (UnitIsCharmed(Unit)) then
	-- we can not cure a mind contorolled player
	return;
    end

    if (DCR_SPELL_CURSE ~= 0) then
	return Dcr_Cast_CureSpell(DCR_SPELL_CURSE, Unit, DCR_CURSE, false);
    end
    return false;
end -- // }}}

function Dcr_Cure_Poison(counts, Unit)  -- {{{
    if ( (not DCR_CAN_CURE_POISON) or (counts.Poison_Count == 0) or not Dcr_Saved.CurePoison) then
	-- here is no magical effects... or
	-- we can't cure magic don't bother going forward
	Dcr_debug( "no poison");
	return false;
    end
    Dcr_debug( "curing poison");

    if (UnitIsCharmed(Unit)) then
	-- we can not cure a mind contorolled player
	return;
    end

    if (Dcr_Saved.Check_For_Abolish and Dcr_CheckUnitForBuff(Unit, DCR_SPELL_ABOLISH_POISON)) then
	return false;
    end

    if (DCR_SPELL_POISON_2[1] ~= 0 ) and (Dcr_Saved.AlwaysUseBestSpell or (counts.Poison_Count > 1)) then
	return Dcr_Cast_CureSpell( DCR_SPELL_POISON_2, Unit, DCR_POISON, false);
    else
	return Dcr_Cast_CureSpell( DCR_SPELL_POISON_1, Unit, DCR_POISON, false);
    end
end -- // }}}

function Dcr_Cure_Disease(counts, Unit) --{{{
    if ( (not DCR_CAN_CURE_DISEASE) or (counts.Disease_Count == 0) or not Dcr_Saved.CureDisease) then
	-- here is no magical effects... or
	-- we can't cure magic don't bother going forward
	Dcr_debug( "no disease");
	return false;
    end
    Dcr_debug( "curing disease");

    if (UnitIsCharmed(Unit)) then
	-- we can not cure a mind contorolled player
	return;
    end

    if (Dcr_Saved.Check_For_Abolish and Dcr_CheckUnitForBuff(Unit, DCR_SPELL_ABOLISH_DISEASE)) then
	return false;
    end

    if (DCR_SPELL_DISEASE_2[1] ~= 0 ) and (Dcr_Saved.AlwaysUseBestSpell or (counts.Disease_Count > 1)) then
	return Dcr_Cast_CureSpell( DCR_SPELL_DISEASE_2, Unit, DCR_DISEASE, false);
    else
	return Dcr_Cast_CureSpell( DCR_SPELL_DISEASE_1, Unit, DCR_DISEASE, false);
    end
end --}}}

function Dcr_Cast_CureSpell( spellID, Unit, AfflictionType, ClearCurrentTarget) --{{{
    local name = (UnitName(Unit));


    if (spellID[1] == 0) then
	Dcr_errln("Stupid call to Dcr_Cast_CureSpell() with a null spellID!!!");
	return false;
    end

    -- check to see if we are in range
    if (
	(spellID[2] ~= BOOKTYPE_PET) and
	(not Dcr_UnitInRange(Unit))
	) then

	-- XXX We do not blacklist out of range people any more, they don't prevent anything from hapenning
	-- it will just spam a bit if there are a lot of them...

	-- Dcr_Blacklist_Array[Unit] = nil; -- attempt to remove it
	-- Dcr_Blacklist_Array[Unit] = Dcr_Saved.CureBlacklist; -- add it to the blacklist, hopefully at the end

	-- DCR_ThisCleanBlaclisted[Unit] = true;

	Dcr_errln( string.gsub( string.gsub(DCR_OUT_OF_RANGE, "$t", MakePlayerName(name)), "$a", MakeAfflictionName(AfflictionType)));
	-- DCR_ThisNumberOoRUnits = DCR_ThisNumberOoRUnits + 1;
	return false;
    end

    Dcr_debug_bis( "try to cast: "..spellID[1] .." - ".. spellID[2]);
    local spellName = GetSpellName(spellID[1], spellID[2]);
    Dcr_debug( "casting - "..spellName);

    -- clear the target if it will interfear
    if (ClearCurrentTarget) then
	-- it can target enemys... do don't target ANYTHING else
	if ( not UnitIsUnit( "target", Unit) ) then
	    ClearTarget();
	end
    elseif ( UnitIsFriend( "player", "target") ) then
	-- we can accedenally cure friendly targets...
	if ( not UnitIsUnit( "target", Unit) ) then
	    -- and we want to cure someone else who is not targeted
	    ClearTarget();
	end
    end

    Dcr_println( string.gsub( string.gsub(DCR_CLEAN_STRING, "$t", MakePlayerName(name)), "$a", MakeAfflictionName(AfflictionType)));
    Dcr_debug_bis( "casting on " .. (UnitName(Unit)) .. " -- " .. Unit);
    if (spellID[2] == BOOKTYPE_PET or spellID[3] == DCR_SPELL_PURGE) then
	TargetUnit(Unit);
    end

    -- if a spell is awaiting for a target, cancel it
    -- if ( SpellIsTargeting()) then
    --	SpellStopTargeting();
    -- always cancel current spell
    --	SpellStopCasting();

    -- end

    -- cast the spell
    Dcr_Casting_Spell_On = Unit;
    CastSpell(spellID[1],  spellID[2]);

    -- if the spell doesn't need a target
    if (Dcr_RestoreTarget and (spellID[2] == BOOKTYPE_PET or spellID[3] == DCR_SPELL_PURGE)) then
	TargetUnit("playertarget"); -- restore previous target 
    else
	-- if the cast succeeded
	if (SpellIsTargeting()) then
	    SpellTargetUnit(Unit);
	end
    end

    -- if the targeting failed (still waiting for a target), cancel the cast
    if ( SpellIsTargeting()) then
	SpellStopTargeting();
    end

    return true;
end --}}}
-- }}}
-------------------------------------------------------------------------------


