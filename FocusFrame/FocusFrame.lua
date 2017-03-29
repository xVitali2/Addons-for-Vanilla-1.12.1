local _G = getfenv(0)
local Focus = _G.FocusData
local AurasUpdate

FocusFrameDB = FocusFrameDB or { unlock = true, scale = 1 }
BINDING_HEADER_FOCUSFRAME_HEADER = "FocusFrame Bindings"
BINDING_NAME_FOCUSFRAME_TOGGLE = "Set FocusFrame"
-- Local functions here can be post-hooked using Focus:OnEvent().
-- See inside Init function in mods/classPortraits.lua for example.

local function OnFocusSat(event, unit)
	FocusName:SetText(UnitName(unit))
	FocusFrame:SetScale(FocusFrameDB.scale or 1)

	FocusFrame:SetScript("OnUpdate", FocusFrame_CastingBarOnUpdate)
	FocusFrame:Show()
end

local function OnFocusIdle()
	if FocusFrameDB.fadeOnIdle then
		FocusFrame:SetAlpha(0.6)
	end
end

local function OnFocusActive()
	FocusFrame:SetAlpha(1)
end

local function HealthUpdate()
	local health, maxHealth = Focus:GetHealth()
	local mana, maxMana = Focus:GetPower()

	FocusFrameHealthBar:SetMinMaxValues(0, maxHealth)
	FocusFrameHealthBar:SetValue(health)
	FocusFrameManaBar:SetMinMaxValues(0, maxMana)
	FocusFrameManaBar:SetValue(mana)

	if FocusFrameManaBar:IsShown() then
		local color = Focus:GetPowerColor()
		FocusFrameManaBar:SetStatusBarColor(color.r, color.g, color.b)
	else
		FocusFrameManaBarText:SetText(nil)
	end

	if Focus:IsDead() then
		FocusDeadText:Show()
	else
		FocusDeadText:Hide()
	end
end

local function RaidTargetIconUpdate()
	local index = Focus:GetData("raidIcon")

	if index then
		SetRaidTargetIconTexture(FocusRaidTargetIcon, index)
		FocusRaidTargetIcon:Show()
	else
		FocusRaidTargetIcon:Hide()
	end
end

function FocusFrame_CastingBarOnUpdate() -- ran every fps
	local cast, value, maxValue, sparkPosition, timer = Focus:GetCast()

	if cast then
		local castbar = FocusFrameCastingBar
		castbar:SetMinMaxValues(0, maxValue)
		castbar:SetValue(value)
		castbar.spark:SetPoint("CENTER", castbar, "LEFT", sparkPosition * castbar:GetWidth(), 0)
		castbar.timer:SetText(timer)

		if cast.immune then
			castbar.shield:Show()
		else
			castbar.shield:Hide()
		end

		if not castbar:IsVisible() or castbar.text:GetText() ~= cast.spell then
			castbar.text:SetText(cast.spell)
			castbar.icon:SetTexture(cast.icon)
			castbar:SetAlpha(castbar:GetAlpha())
			castbar:Show()
		end
	else
		FocusFrameCastingBar:Hide()
	end
end

function FocusFrame_OnShow()
	-- Ran on FOCUS_SET. "target" = focus here
	if UnitIsEnemy("target", "player") then
		PlaySound("igCreatureAggroSelect")
	elseif UnitIsFriend("player", "target") then
		PlaySound("igCharacterNPCSelect")
	else
		PlaySound("igCreatureNeutralSelect")
	end
end

function FocusFrame_OnHide() -- can't be hooked, global due to xml
	if FocusFrame:IsVisible() then -- called by FOCUS_CLEAR instead of OnHide
		FocusFrame:SetScript("OnUpdate", nil)
		FocusFrame:Hide()
	else
		PlaySound("INTERFACESOUND_LOSTTARGETUNIT")
	end
end

function FocusFrame_OnClick(button)
	if button == "RightButton" and SpellIsTargeting() then
		return SpellStopTargeting()
	end

	if button == "LeftButton" then
		if SpellIsTargeting() then
			Focus:Call(SpellTargetUnit)
		elseif CursorHasItem() then
			Focus:Call(DropItemOnUnit)
		else
			Focus:TargetFocus()
		end
	end
end

local function CheckPortrait(event, unit)
	SetPortraitTexture(FocusPortrait, unit)
	FocusPortrait:SetAlpha(1)
end

local function CheckLevel()
	local level, isCorpse = Focus:GetData("unitLevel", "unitIsCorpse")

	if isCorpse == 1 then
		FocusLevelText:Hide()
		FocusHighLevelTexture:Show()
	elseif level > 0 then
		-- Normal level target
		FocusLevelText:SetText(level)

		-- Color level number
		if Focus:GetData("playerCanAttack") == 1 then
			local color = GetDifficultyColor(level)
			FocusLevelText:SetVertexColor(color.r, color.g, color.b)
		else
			FocusLevelText:SetVertexColor(1.0, 0.82, 0.0)
		end

		FocusLevelText:Show()
		FocusHighLevelTexture:Hide()
	else
		-- Target is too high level to tell
		FocusLevelText:Hide()
		FocusHighLevelTexture:Show()
	end
end

local function CheckFaction()
	if Focus:GetData("unitPlayerControlled") == 1 then
		local r, g, b = Focus:GetReactionColors()
		FocusFrameNameBackground:SetVertexColor(r, g, b)
		FocusPortrait:SetVertexColor(1.0, 1.0, 1.0)
	elseif Focus:GetData("unitIsTapped") == 1 and Focus:GetData("unitIsTappedByPlayer") ~= 1 then
		FocusFrameNameBackground:SetVertexColor(0.5, 0.5, 0.5)
		FocusPortrait:SetVertexColor(0.5, 0.5, 0.5)
	elseif Focus:GetData("unitIsCivilian") == 1 then
		FocusFrameNameBackground:SetVertexColor(1.0, 1.0, 1.0)
		FocusPortrait:SetVertexColor(1.0, 1.0, 1.0)
	else
		local reaction = Focus:GetData("unitReaction")
		if reaction then
			local color = UnitReactionColor[reaction]
			FocusFrameNameBackground:SetVertexColor(color.r, color.g, color.b)
		else
			FocusFrameNameBackground:SetVertexColor(0, 0, 1.0)
		end

		FocusPortrait:SetVertexColor(1.0, 1.0, 1.0)
	end

	-- PvP Icon
	local factionGroup = Focus:GetData("unitFactionGroup")
	if Focus:GetData("unitIsPVPFreeForAll") == 1 then
		FocusPVPIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-FFA")
		FocusPVPIcon:Show()
	elseif factionGroup and Focus:GetData("unitIsPVP") == 1 then
		FocusPVPIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-" .. factionGroup)
		FocusPVPIcon:Show()
	else
		FocusPVPIcon:Hide()
	end
end

local function CheckClassification()
	local classification = Focus:GetData("unitClassification")

	if classification == "worldboss" or classification == "rareelite" or classification == "elite" then
		FocusFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite")
	elseif classification == "rare" then
		FocusFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare")
	else
		FocusFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame")
	end
end

local function CheckLeader()
	if Focus:GetData("unitIsPartyLeader") == 1 then
		FocusLeaderIcon:Show()
	else
		FocusLeaderIcon:Hide()
	end
end

do
	-- Aura handling
	-- Works the same as in blizz TargetFrame.lua,
	-- but without TargetOfTarget wrap

	local function AdjustAuras(numDebuffs, numBuffs)
		local unitIsFriend = Focus:GetData("unitIsFriend")
		local debuffSize, debuffFrameSize
		local debuffWrap = 6

		if numDebuffs >= debuffWrap then
			debuffSize = 17
			debuffFrameSize = 19
		else
			debuffSize = 21
			debuffFrameSize = 23
		end

		if unitIsFriend == 1 then
			FocusFrameBuff1:SetPoint("TOPLEFT", "FocusFrame", "BOTTOMLEFT", 5, 32)
			FocusFrameDebuff1:SetPoint("TOPLEFT", "FocusFrameBuff1", "BOTTOMLEFT", 0, -2)
		else
			FocusFrameDebuff1:SetPoint("TOPLEFT", "FocusFrame", "BOTTOMLEFT", 5, 32)
			FocusFrameBuff1:SetPoint("TOPLEFT", "FocusFrameDebuff7", "BOTTOMLEFT", 0, -2)
		end

		-- resize Buffs
		for i = 1, 5 do
			local button = _G["FocusFrameBuff" .. i]
			if button then
				button:SetWidth(debuffSize)
				button:SetHeight(debuffSize)
			end
		end

		-- resize Debuffs
		for i = 1, 6 do
			local button = _G["FocusFrameDebuff" .. i]
			local debuffFrame = _G["FocusFrameDebuff" .. i .. "Border"]

			if debuffFrame then
				debuffFrame:SetWidth(debuffFrameSize)
				debuffFrame:SetHeight(debuffFrameSize)
			end

			button:SetWidth(debuffSize)
			button:SetHeight(debuffSize)
		end

		-- Reset anchors for debuff wrapping
		_G["FocusFrameDebuff"..debuffWrap]:ClearAllPoints()
		_G["FocusFrameDebuff"..debuffWrap]:SetPoint("LEFT", _G["FocusFrameDebuff"..(debuffWrap - 1)], "RIGHT", 3, 0)
		_G["FocusFrameDebuff"..(debuffWrap + 1)]:ClearAllPoints()
		_G["FocusFrameDebuff"..(debuffWrap + 1)]:SetPoint("TOPLEFT", "FocusFrameDebuff1", "BOTTOMLEFT", 0, -2)
		_G["FocusFrameDebuff"..(debuffWrap + 2)]:ClearAllPoints()
		_G["FocusFrameDebuff"..(debuffWrap + 2)]:SetPoint("LEFT", _G["FocusFrameDebuff"..(debuffWrap + 1)], "RIGHT", 3, 0)
		FocusFrameDebuff11:ClearAllPoints()
		FocusFrameDebuff11:SetPoint("LEFT", "FocusFrameDebuff10", "RIGHT", 3, 0)

		-- Move castbar based on amount of auras shown
		local y = (numBuffs + numDebuffs) > 7 and -70 or -35
		if unitIsFriend ~= 1 and numBuffs >= 1 then
			FocusFrameCastingBar:SetPoint("BOTTOMLEFT", _G["FocusFrameBuff1"], 0, -35)
		else
			FocusFrameCastingBar:SetPoint("BOTTOMLEFT", FocusFrame, 20, y)
		end
	end

	function AurasUpdate() -- local, ran very frequent
		local buffData = Focus:GetBuffs()
		local buffs = buffData.buffs
		local debuffs = buffData.debuffs
		local numBuffs = 0
		local numDebuffs = 0

		-- Set buffs shown
		for i = 1, 5 do
			local buff = buffs[i]
			local button = _G["FocusFrameBuff" .. i]

			if buff then
				_G["FocusFrameBuff" .. i .. "Icon"]:SetTexture(buff.icon)
				button:Show()
				button.id = i
				numBuffs = numBuffs + 1
			else
				button:Hide()
			end
		end

		-- Set debuffs shown
		for i = 1, 16 do
			local button = _G["FocusFrameDebuff" .. i]
			local debuff = debuffs[i]

			if debuff then
				local debuffCount = _G["FocusFrameDebuff" .. i .. "Count"]
				local debuffBorder = _G["FocusFrameDebuff" .. i .. "Border"]

				local color = debuff.border
				local debuffStack = debuff.stacks
				_G["FocusFrameDebuff" .. i .. "Icon"]:SetTexture(debuff.icon)

				if debuffStack and debuffStack > 1 then
					debuffCount:SetText(debuffStack)
					debuffCount:Show()
				else
					debuffCount:Hide()
				end

				debuffBorder:SetVertexColor(color[1], color[2], color[3], color[4])
				button:Show()
				numDebuffs = numDebuffs + 1
			else
				button:Hide()
			end

			button.id = i
		end

		AdjustAuras(numDebuffs, numBuffs)
	end
end

-- Create castbar
-- TODO add to xml
FocusFrame.cast = CreateFrame("StatusBar", "FocusFrameCastingBar", FocusFrame)
FocusFrame.cast:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
FocusFrame.cast:SetStatusBarColor(0.4, 1, 0)
FocusFrame.cast:SetHeight(13)
FocusFrame.cast:SetWidth(151)
FocusFrame.cast:SetPoint("BOTTOMLEFT", FocusFrame, 15, -35)
FocusFrame.cast:SetValue(0)
FocusFrame.cast:Hide()

FocusFrame.cast.spark = FocusFrame.cast:CreateTexture(nil, "OVERLAY")
FocusFrame.cast.spark:SetTexture([[Interface\CastingBar\UI-CastingBar-Spark]])
FocusFrame.cast.spark:SetHeight(26)	
FocusFrame.cast.spark:SetWidth(26)
FocusFrame.cast.spark:SetBlendMode("ADD")

FocusFrame.cast.border = FocusFrame.cast:CreateTexture(nil, "OVERLAY")
FocusFrame.cast.border:SetPoint("TOPLEFT", -23, 20)
FocusFrame.cast.border:SetPoint("TOPRIGHT", 23, 20)
FocusFrame.cast.border:SetHeight(50)
FocusFrame.cast.border:SetTexture("Interface\\AddOns\\FocusFrame\\media\\UI-CastingBar-Border-Small.blp")

FocusFrame.cast.text = FocusFrame.cast:CreateFontString(nil, "OVERLAY")
FocusFrame.cast.text:SetTextColor(1, 1, 1)
FocusFrame.cast.text:SetFont(STANDARD_TEXT_FONT, 10)
FocusFrame.cast.text:SetShadowColor(0, 0, 0)
FocusFrame.cast.text:SetPoint("CENTER", FocusFrame.cast, 0, 2)
FocusFrame.cast.text:SetText("Drain Life")

FocusFrame.cast.timer = FocusFrame.cast:CreateFontString(nil, "OVERLAY")
FocusFrame.cast.timer:SetTextColor(1, 1, 1)
FocusFrame.cast.timer:SetFont(STANDARD_TEXT_FONT, 9)
FocusFrame.cast.timer:SetShadowColor(0, 0, 0)
FocusFrame.cast.timer:SetPoint("RIGHT", FocusFrame.cast, 28, 2)
FocusFrame.cast.timer:SetText("2.0")

FocusFrame.cast.icon = FocusFrame.cast:CreateTexture(nil, "OVERLAY", nil, 7)
FocusFrame.cast.icon:SetWidth(20)
FocusFrame.cast.icon:SetHeight(20)
FocusFrame.cast.icon:SetPoint("LEFT", FocusFrame.cast, -23, 1)
FocusFrame.cast.icon:SetTexture("Interface\\Icons\\Spell_shadow_lifedrain02")

FocusFrame.cast.shield = FocusFrame.cast:CreateTexture(nil, "OVERLAY")
FocusFrame.cast.shield:SetPoint("TOPLEFT", -28, 20)
FocusFrame.cast.shield:SetPoint("TOPRIGHT", 18, 20)
FocusFrame.cast.shield:SetHeight(50)
FocusFrame.cast.shield:SetTexture("Interface\\AddOns\\FocusFrame\\media\\UI-CastingBar-Small-Shield.blp")
FocusFrame.cast.shield:Hide()

-- Register events
Focus:OnEvent("FOCUS_SET", OnFocusSat)
Focus:OnEvent("FOCUS_CLEAR", FocusFrame_OnHide)
Focus:OnEvent("RAID_TARGET_UPDATE", RaidTargetIconUpdate)
Focus:OnEvent("PLAYER_FLAGS_CHANGED", CheckLeader)
Focus:OnEvent("PARTY_LEADER_CHANGED", CheckLeader)
Focus:OnEvent("UNIT_HEALTH_OR_POWER", HealthUpdate)
Focus:OnEvent("UNIT_AURA", AurasUpdate)
Focus:OnEvent("UNIT_LEVEL", CheckLevel)
Focus:OnEvent("UNIT_FACTION", CheckFaction)
Focus:OnEvent("UNIT_CLASSIFICATION_CHANGED", CheckClassification)
Focus:OnEvent("UNIT_PORTRAIT_UPDATE", CheckPortrait)
Focus:OnEvent("FOCUS_UNITID_EXISTS", CheckPortrait) -- update on retarget/mouseover aswell
--Focus:OnEvent("FOCUS_CHANGED", function() print("ran2") end)
Focus:OnEvent("FOCUS_ACTIVE", OnFocusActive)
Focus:OnEvent("FOCUS_INACTIVE", OnFocusIdle)

-- Chat options
SLASH_FOCUSOPTIONS1 = "/foption"
SlashCmdList.FOCUSOPTIONS = function(msg)
	local space = strfind(msg or "", " ")
	local cmd = strsub(msg, 1, space and (space-1))
	local value = tonumber(strsub(msg, space or -1))

	local print = function(a, b, c) DEFAULT_CHAT_FRAME:AddMessage(string.format(a, b, c)) end

	if cmd == "scale" and value then
		local x = value > 0.1 and value <= 2 and value or 1
		FocusFrame:SetScale(x)
		FocusFrameDB.scale = x
		print("Scale set to %f", x)
	elseif cmd == "lock" then
		FocusFrameDB.unlock = not FocusFrameDB.unlock
		print("Frame is now %slocked.", FocusFrameDB.unlock and "un" or "")
	elseif cmd == "nohide" then
		FocusFrameDB.alwaysShow = not FocusFrameDB.alwaysShow
		local s = FocusFrameDB.alwaysShow
		print("Frame is now %s after loading screens/death.", s and "still shown" or "hidden")
	elseif cmd == "fade" then
		FocusFrameDB.fadeOnIdle = not FocusFrameDB.fadeOnIdle
		print("Fade on inactive %s (requires retarget on focus)", FocusFrameDB.fadeOnIdle and "enabled" or "disabled")
	elseif cmd == "reset" then
		FocusFrameDB.scale = 1
		FocusFrameDB.unlock = true
		FocusFrameDB.alwaysShow = false
		FocusFrameDB.fadeOnIdle = false
		FocusFrame:SetScale(1)
		FocusFrame:SetPoint("TOPLEFT", 250, -300)
		FocusFrame:StopMovingOrSizing() -- trigger db save
		print("Frame has been reset.")
	else
		print("Valid commands are:")
		print("/foption scale 1 - Change frame size (0.2 - 2)")
		print("/foption lock - Toggle dragging of frame")
		print("/foption nohide - Toggle hiding of frame on loading screens/release spirit.")
		print("/foption fade - Toggle fading of frame when focus hasn't been updated for ~10s.")
		print("/foption reset - Reset to default settings.")
	end
end
