--------------------------------------------------------------------------------------------------
-- Globals
--------------------------------------------------------------------------------------------------
--**Main frame**
local EW = CreateFrame("Frame", "ewMainFrame", UIParent)
EW.version = "v2.0";
EW.Horde = false;
EW:SetAllPoints()
EW:RegisterEvent("ADDON_LOADED")
EW:RegisterEvent("PLAYER_ENTERING_WORLD")
EW:SetScript("OnEvent", function()
  if event=="ADDON_LOADED" then
	  if arg1=="EasyWho" then
		DEFAULT_CHAT_FRAME:AddMessage("EasyWho " .. EW.version .. " " .. EW_LOADED, 0, 1, 1);
		local frame = getglobal("WhoFrame");
		local show = frame:GetScript("OnShow");
		local hide = frame:GetScript("OnHide");
		frame:SetScript("OnShow", function(self)
			EW:Show();
			if show then show(); end
			end);
		frame:SetScript("OnHide", function(self)
			EW:Hide();
			if hide then hide(); end
			end);
	  end
  elseif event=="PLAYER_ENTERING_WORLD" then
	if not EW.Horde then
		if UnitFactionGroup("player")=="Horde" then EW.Horde=true; end
	end
  end
end)
EW:Hide()
--**
EW.font_default="Fonts\\ARIALN.TTF";
--**
EW.font_size=12;
--**
EW.width=120;
--**
EW.height=20;
--**
EW.backdrop = {
  bgFile = "Interface/Tooltips/UI-Tooltip-Background", tile = true, tileSize = 8,
  edgeFile = "Interface/Tooltips/UI-Tooltip-Border", edgeSize = 8,
  insets = {left = -1, right = -1, top = -1, bottom = -1},
}
function EW.CreateBackdrop(f)
  f:SetBackdrop(EW.backdrop)
  f:SetBackdropColor(.3, 0, 0, 1)
  f:SetBackdropBorderColor(.3, 0, 0 , 1)
end
function EW.SkinButton(button)
  local b = getglobal(button)
  if not b then b = button end
  EW.CreateBackdrop(b)
  b:SetNormalTexture(nil)
  b:SetHighlightTexture(nil)
  b:SetPushedTexture(nil)
  b:SetDisabledTexture(nil)
  local funce = b:GetScript("OnEnter")
  local funcl = b:GetScript("OnLeave")
  b:SetScript("OnEnter", function()
    if funce then funce(); end
    EW.CreateBackdrop(b)
    b:SetBackdropBorderColor(0,1,.5,1)
  end)
  b:SetScript("OnLeave", function()
    if funcl then funcl(); end
    EW.CreateBackdrop(b)
  end)
  b:SetFont(EW.font_default, EW.font_size, "OUTLINE")
end
--------------------------------------------------------------------------------------------------
-- Frame functions
--------------------------------------------------------------------------------------------------
-- Mage button
EW.mage = CreateFrame("Button", "Button_Mage", FriendsFrame, "UIPanelButtonTemplate")
EW.CreateBackdrop(EW.mage)
EW.SkinButton(EW.mage)
EW.mage:SetText(EW_MAGE)
EW.mage:SetPoint('TOPLEFT', FriendsFrame, 'TOPRIGHT', -34, -34)
EW.mage:SetWidth(EW.width)
EW.mage:SetHeight(EW.height)
EW.mage:SetScript("OnClick", function() EW.OnClick(EW_MAGE); end)
EW.mage:Hide()
-- Warlock button
EW.warlock = CreateFrame("Button", "Button_Warlock", FriendsFrame, "UIPanelButtonTemplate")
EW.CreateBackdrop(EW.warlock)
EW.SkinButton(EW.warlock)
EW.warlock:SetText(EW_WARLOCK)
EW.warlock:SetPoint('TOPLEFT', "Button_Mage", 'TOPLEFT', 0, -20)
EW.warlock:SetWidth(EW.width)
EW.warlock:SetHeight(EW.height)
EW.warlock:SetScript("OnClick", function() EW.OnClick(EW_WARLOCK); end)
EW.warlock:Hide()
-- Shaman/Paladin button
EW.shaman = CreateFrame("Button", "Button_Shaman", FriendsFrame, "UIPanelButtonTemplate")
EW.CreateBackdrop(EW.shaman)
EW.SkinButton(EW.shaman)
EW.shaman:SetText(EW_SHAMAN)
EW.shaman:SetPoint('TOPLEFT', "Button_Warlock", 'TOPLEFT', 0, -20)
EW.shaman:SetWidth(EW.width)
EW.shaman:SetHeight(EW.height)
EW.shaman:SetScript("OnClick", function() if EW.Horde then EW.OnClick(EW_SHAMAN);else EW.OnClick(EW_PALADIN);end end)
EW.shaman:Hide()
-- Warrior button
EW.warrior = CreateFrame("Button", "Button_Warrior", FriendsFrame, "UIPanelButtonTemplate")
EW.CreateBackdrop(EW.warrior)
EW.SkinButton(EW.warrior)
EW.warrior:SetText(EW_WARRIOR)
EW.warrior:SetPoint('TOPLEFT', "Button_Shaman", 'TOPLEFT', 0, -20)
EW.warrior:SetWidth(EW.width)
EW.warrior:SetHeight(EW.height)
EW.warrior:SetScript("OnClick", function() EW.OnClick(EW_WARRIOR); end)
EW.warrior:Hide()
-- Hunter button
EW.hunter = CreateFrame("Button", "Button_Hunter", FriendsFrame, "UIPanelButtonTemplate")
EW.CreateBackdrop(EW.hunter)
EW.SkinButton(EW.hunter)
EW.hunter:SetText(EW_HUNTER)
EW.hunter:SetPoint('TOPLEFT', "Button_Warrior", 'TOPLEFT', 0, -20)
EW.hunter:SetWidth(EW.width)
EW.hunter:SetHeight(EW.height)
EW.hunter:SetScript("OnClick", function() EW.OnClick(EW_HUNTER); end)
EW.hunter:Hide()
-- Rogue button
EW.rogue = CreateFrame("Button", "Button_Rogue", FriendsFrame, "UIPanelButtonTemplate")
EW.CreateBackdrop(EW.rogue)
EW.SkinButton(EW.rogue)
EW.rogue:SetText(EW_ROGUE)
EW.rogue:SetPoint('TOPLEFT', "Button_Hunter", 'TOPLEFT', 0, -20)
EW.rogue:SetWidth(EW.width)
EW.rogue:SetHeight(EW.height)
EW.rogue:SetScript("OnClick", function() EW.OnClick(EW_ROGUE); end)
EW.rogue:Hide()
-- Druid button
EW.druid = CreateFrame("Button", "Button_Druid", FriendsFrame, "UIPanelButtonTemplate")
EW.CreateBackdrop(EW.druid)
EW.SkinButton(EW.druid)
EW.druid:SetText(EW_DRUID)
EW.druid:SetPoint('TOPLEFT', "Button_Rogue", 'TOPLEFT', 0, -20)
EW.druid:SetWidth(EW.width)
EW.druid:SetHeight(EW.height)
EW.druid:SetScript("OnClick", function() EW.OnClick(EW_DRUID); end)
EW.druid:Hide()
-- Priest button
EW.priest = CreateFrame("Button", "Button_Priest", FriendsFrame, "UIPanelButtonTemplate")
EW.CreateBackdrop(EW.priest)
EW.SkinButton(EW.priest)
EW.priest:SetText(EW_PRIEST)
EW.priest:SetPoint('TOPLEFT', "Button_Druid", 'TOPLEFT', 0, -20)
EW.priest:SetWidth(EW.width)
EW.priest:SetHeight(EW.height)
EW.priest:SetScript("OnClick", function() EW.OnClick(EW_PRIEST); end)
EW.priest:Hide()
-- Arathi button
EW.arathi = CreateFrame("Button", "Button_Arathi", FriendsFrame, "UIPanelButtonTemplate")
EW.CreateBackdrop(EW.arathi)
EW.SkinButton(EW.arathi)
EW.arathi:SetText(EW_ARATHI)
EW.arathi:SetPoint('TOPLEFT', "Button_Priest", 'TOPLEFT', 0, -30)
EW.arathi:SetWidth(EW.width)
EW.arathi:SetHeight(EW.height)
EW.arathi:SetScript("OnClick", function() EW.OnClick(EW_ARATHI); end)
EW.arathi:Hide()
-- Warsong button
EW.warsong = CreateFrame("Button", "Button_Warsong", FriendsFrame, "UIPanelButtonTemplate")
EW.CreateBackdrop(EW.warsong)
EW.SkinButton(EW.warsong)
EW.warsong:SetText(EW_WARSONG)
EW.warsong:SetPoint('TOPLEFT', "Button_Arathi", 'TOPLEFT', 0, -20)
EW.warsong:SetWidth(EW.width)
EW.warsong:SetHeight(EW.height)
EW.warsong:SetScript("OnClick", function() EW.OnClick(EW_WARSONG); end)
EW.warsong:Hide()
-- Alterac button
EW.alterac = CreateFrame("Button", "Button_Alterac", FriendsFrame, "UIPanelButtonTemplate")
EW.CreateBackdrop(EW.alterac)
EW.SkinButton(EW.alterac)
EW.alterac:SetText(EW_ALTERAC)
EW.alterac:SetPoint('TOPLEFT', "Button_Warsong", 'TOPLEFT', 0, -20)
EW.alterac:SetWidth(EW.width)
EW.alterac:SetHeight(EW.height)
EW.alterac:SetScript("OnClick", function() EW.OnClick(EW_ALTERAC); end)
EW.alterac:Hide()
-- All button
EW.all = CreateFrame("Button", "Button_All", FriendsFrame, "UIPanelButtonTemplate")
EW.CreateBackdrop(EW.all)
EW.SkinButton(EW.all)
EW.all:SetText(EW_ALL)
EW.all:SetPoint('TOPLEFT', "Button_Alterac", 'TOPLEFT', 0, -30)
EW.all:SetWidth(EW.width)
EW.all:SetHeight(EW.height)
EW.all:SetScript("OnClick", function() EW.OnClick(); end)
EW.all:Hide()
-- Check filter checkbutton
EW.framefilter = CreateFrame("Frame", "FilterFrame", FriendsFrame)
EW.CreateBackdrop(EW.framefilter)
EW.framefilter:SetWidth(EW.width)
EW.framefilter:SetHeight(EW.height)
EW.framefilter:SetPoint('TOPLEFT', "Button_All", 'TOPLEFT', 0, -30)
EW.framefilter:Hide()
EW.framefilter.filter = CreateFrame("CheckButton", "CheckButton_Filter", FriendsFrame, "UICheckButtonTemplate")
EW.framefilter.filter:SetWidth(EW.height)
EW.framefilter.filter:SetHeight(EW.height)
EW.framefilter.filter:SetBackdrop(EW.backdrop)
EW.framefilter.filter:SetBackdropColor(0, 0, 0, 0)
EW.framefilter.filter:SetBackdropBorderColor(.5, 1, .5, 1)
EW.framefilter.filter:SetChecked(true)
EW.framefilter.filter:SetNormalTexture(nil)
EW.framefilter.filter:SetPushedTexture(nil)
EW.framefilter.filter:GetHighlightTexture():SetAllPoints()
EW.framefilter.filter:GetHighlightTexture():SetTexture(1, 1, 1, .2)
EW.framefilter.filter:GetCheckedTexture():SetTexCoord(.12, .88, .12, .88)
EW.framefilter.filter:GetHighlightTexture('BLEND')
EW.framefilter.filter:SetPoint('TOPLEFT', "Button_All", 'TOPLEFT', 10, -30)
EW.framefilter.filter:Hide()
EW.framefilter.text = EW.framefilter:CreateFontString("Status", "LOW", "GameFontNormal")
EW.framefilter.text:SetFont(EW.font_default, EW.font_size, "OUTLINE")
EW.framefilter.text:SetAllPoints(EW.framefilter)
EW.framefilter.text:SetFontObject(GameFontYellow)
EW.framefilter.text:SetJustifyH("RIGHT")
EW.framefilter.text:SetText(EW_FILTER)
-- level frame 1
EW.framelevel1 = CreateFrame("Frame", "Level1Frame", FriendsFrame)
EW.CreateBackdrop(EW.framelevel1)
EW.framelevel1:SetWidth(EW.width/2)
EW.framelevel1:SetHeight(EW.height)
EW.framelevel1:SetPoint('TOPLEFT', "FilterFrame", 'TOPLEFT', 0, -20)
EW.framelevel1:Hide()
EW.framelevel1.input = CreateFrame("EditBox", "EditLevel1", EW.framelevel1)
EW.framelevel1.input:SetTextColor(.2,1,.8,1)
EW.framelevel1.input:SetJustifyH("RIGHT")
EW.framelevel1.input:SetWidth(50)
EW.framelevel1.input:SetHeight(20)
EW.framelevel1.input:SetPoint("TOPLEFT", "Level1Frame", "TOPLEFT" , 0, 0)
EW.framelevel1.input:SetFontObject(GameFontNormal)
EW.framelevel1.input:SetAutoFocus(false)
EW.framelevel1.input:SetText("0")
EW.framelevel1.input:SetScript("OnEscapePressed", function(self)
 this:ClearFocus();
end)
EW.framelevel1.input:Hide();
-- level frame 2
EW.framelevel2 = CreateFrame("Frame", "Level2Frame", FriendsFrame)
EW.CreateBackdrop(EW.framelevel2)
EW.framelevel2:SetWidth(EW.width/2)
EW.framelevel2:SetHeight(EW.height)
EW.framelevel2:SetPoint('TOPRIGHT', "FilterFrame", 'TOPRIGHT', 0, -20)
EW.framelevel2:Hide()
EW.framelevel2.input = CreateFrame("EditBox", "EditLevel2", EW.framelevel2)
EW.framelevel2.input:SetTextColor(.2,1,.8,1)
EW.framelevel2.input:SetJustifyH("RIGHT")
EW.framelevel2.input:SetWidth(50)
EW.framelevel2.input:SetHeight(20)
EW.framelevel2.input:SetPoint("TOPRIGHT", "Level2Frame", "TOPRIGHT" , -10, 0)
EW.framelevel2.input:SetFontObject(GameFontNormal)
EW.framelevel2.input:SetAutoFocus(false)
EW.framelevel2.input:SetText("0")
EW.framelevel2.input:SetScript("OnEscapePressed", function(self)
 this:ClearFocus();
end)
EW.framelevel2.input:Hide();
-- Check zone checkbutton
EW.framezone = CreateFrame("Frame", "ZoneFrame", FriendsFrame)
EW.CreateBackdrop(EW.framezone)
EW.framezone:SetWidth(EW.width)
EW.framezone:SetHeight(EW.height)
EW.framezone:SetPoint('TOPLEFT', "EditLevel1", 'TOPLEFT', 0, -21)
EW.framezone:Hide()
EW.framezone.zone = CreateFrame("CheckButton", "CheckButton_Zone", FriendsFrame, "UICheckButtonTemplate")
EW.framezone.zone:SetWidth(EW.height)
EW.framezone.zone:SetHeight(EW.height)
EW.framezone.zone:SetBackdrop(EW.backdrop)
EW.framezone.zone:SetBackdropColor(0, 0, 0, 0)
EW.framezone.zone:SetBackdropBorderColor(.5, 1, .5, 1)
EW.framezone.zone:SetChecked(true)
EW.framezone.zone:SetNormalTexture(nil)
EW.framezone.zone:SetPushedTexture(nil)
EW.framezone.zone:GetHighlightTexture():SetAllPoints()
EW.framezone.zone:GetHighlightTexture():SetTexture(1, 1, 1, .2)
EW.framezone.zone:GetCheckedTexture():SetTexCoord(.12, .88, .12, .88)
EW.framezone.zone:GetHighlightTexture('BLEND')
EW.framezone.zone:SetPoint('TOPLEFT', "EditLevel1", 'TOPLEFT', 10, -21)
EW.framezone.zone:Hide()
EW.framezone.text = EW.framezone:CreateFontString("Status", "LOW", "GameFontNormal")
EW.framezone.text:SetFont(EW.font_default, EW.font_size, "OUTLINE")
EW.framezone.text:SetAllPoints(EW.framezone)
EW.framezone.text:SetFontObject(GameFontYellow)
EW.framezone.text:SetJustifyH("RIGHT")
EW.framezone.text:SetText(EW_ZONE)


--------------------------------------------------------------------------------------------------
-- Event functions
--------------------------------------------------------------------------------------------------
function EW.OnClick(request)
	local BGrequest = false;
	local BGalterac = false;
	-- Request for Battleground ?
	if (request == EW_ARATHI or request == EW_WARSONG or request == EW_ALTERAC) then
		BGrequest = true;
	end
	-- Is Alterac Valley request?
	if (request == EW_ALTERAC) then
		BGalterac = true;
	end
	-- Request is nil or Battleground ?
	if request then
		if BGrequest then
			request = 'z-"' .. request .. '"';
		else
			request = 'c-"' .. request .. '"';
		end
	else
		request = "";
	end
	-- Current Zone and not Battleground 
	if (CheckButton_Zone:GetChecked() and BGrequest == false) then
		local ZoneName = GetRealZoneText();
		request = request .. ' z-"' .. ZoneName .. '"';
	end
	-- Looking for Player's Level Player
	if (CheckButton_Filter:GetChecked()) then
		local level = UnitLevel("player");
		local minlevel = EW.framelevel1.input:GetNumber();
		local maxlevel = EW.framelevel2.input:GetNumber();
		-- Request for Battleground ?
		if BGrequest then
			-- Is Alterac Valley request?
			if BGalterac then
				if (level < 11) then
					minlevel = 1;
					maxlevel = 10;
				elseif (level < 21) then
					minlevel = 11;
					maxlevel = 20;
				elseif (level < 31) then
					minlevel = 21;
					maxlevel = 30;
				elseif (level < 41) then
					minlevel = 31;
					maxlevel = 40;
				elseif (level < 51) then
					minlevel = 41;
					maxlevel = 50;
				else
					minlevel = 51;
					maxlevel = 60;
				end
			else
				if (level < 10) then
					minlevel = 1;
					maxlevel = 9;
				elseif (level < 20) then
					minlevel = 10;
					maxlevel = 19;
				elseif (level < 30) then
					minlevel = 20;
					maxlevel = 29;
				elseif (level < 40) then
					minlevel = 30;
					maxlevel = 39;
				elseif (level < 50) then
					minlevel = 40;
					maxlevel = 49;
				elseif (level < 60) then
					minlevel = 50;
					maxlevel = 59;
				else
					minlevel = 60;
					maxlevel = 60;
				end
			end
		elseif (CheckButton_Filter:GetChecked()) and minlevel==0 and maxlevel==0 then
			minlevel = (level - 5);
			maxlevel = (level + 5);
		end
		if minlevel<1 or minlevel>60 then minlevel=1;end
		if maxlevel>60 or maxlevel<1 then maxlevel=60;end
		request = request .. " " .. minlevel .. "-" .. maxlevel;
	end
	DEFAULT_CHAT_FRAME:AddMessage("WhoRequest: " .. request, 0, 1, 1);
	SendWho(request);
end
--------------------------------------------------------------------------------------------------
-- UserInterface functions
--------------------------------------------------------------------------------------------------
function EW.Hide()
	EW.mage:Hide();
	EW.warlock:Hide();
	EW.shaman:Hide();
	EW.warrior:Hide();
	EW.hunter:Hide();
	EW.rogue:Hide();
	EW.druid:Hide();
	EW.priest:Hide();
	EW.arathi:Hide();
	EW.warsong:Hide();
	EW.alterac:Hide();
	EW.all:Hide();
	EW.framefilter:Hide();
	EW.framefilter.filter:Hide();
	EW.framezone:Hide();
	EW.framezone.zone:Hide();
	EW.framelevel1:Hide();
	EW.framelevel1.input:Hide();
	EW.framelevel2:Hide();
	EW.framelevel2.input:Hide();
end
function EW.Show()
	EW.mage:Show();
	EW.warlock:Show();
	EW.shaman:Show();
	if EW.Horde then
		EW.shaman:SetText(EW_SHAMAN)
	else
		EW.shaman:SetText(EW_PALADIN)
	end
	EW.warrior:Show();
	EW.hunter:Show();
	EW.rogue:Show();
	EW.druid:Show();
	EW.priest:Show();
	EW.arathi:Show();
	EW.warsong:Show();
	EW.alterac:Show();
	EW.all:Show();
	EW.framefilter:Show();
	EW.framefilter.filter:Show();
	EW.framezone:Show();
	EW.framezone.zone:Show();
	EW.framelevel1:Show();
	EW.framelevel1.input:Show();
	EW.framelevel2:Show();
	EW.framelevel2.input:Show();
end
