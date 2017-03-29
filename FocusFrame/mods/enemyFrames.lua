-- Adds support for portrait debuff timers with enemyFrames addon
Focus_Loader:Register("enemyFrames", function(Focus)
	if not CreateCooldown or not SPELLCASTINGCOREgetPrioBuff then return end

	local getPrioBuff, floor, GetTime = SPELLCASTINGCOREgetPrioBuff, floor, GetTime

	local portraitDebuff = CreateFrame("Frame", "FocusPortraitDebuff", FocusFrame)
	portraitDebuff:SetFrameLevel(0)
	portraitDebuff:SetPoint("TOPLEFT", FocusPortrait, "TOPLEFT", 7, -2)
	portraitDebuff:SetPoint("BOTTOMRIGHT", FocusPortrait, "BOTTOMRIGHT", -5.5, 4)
	portraitDebuff:Hide()

	-- circle texture
	portraitDebuff.bgText = FocusFrame:CreateTexture(nil, "OVERLAY")
	portraitDebuff.bgText:SetPoint("TOPLEFT", FocusPortrait, "TOPLEFT", 3, -4.5)
	portraitDebuff.bgText:SetPoint("BOTTOMRIGHT", FocusPortrait, "BOTTOMRIGHT", -4, 3)
	portraitDebuff.bgText:SetVertexColor(0.3, 0.3, 0.3)
	portraitDebuff.bgText:SetTexture([[Interface\AddOns\enemyFrames\globals\resources\portraitBg.tga]])

	-- debuff texture
	portraitDebuff.debuffText = FocusFrame:CreateTexture()
	portraitDebuff.debuffText:SetPoint("TOPLEFT", FocusPortrait, "TOPLEFT", 7.5, -8)
	portraitDebuff.debuffText:SetPoint("BOTTOMRIGHT", FocusPortrait, "BOTTOMRIGHT", -7.5, 4.5)
	portraitDebuff.debuffText:SetTexCoord(0.12, 0.88, 0.12, 0.88)

	-- duration text
	local portraitDurationFrame = CreateFrame("Frame", nil, FocusFrame)
	portraitDurationFrame:SetAllPoints()
	portraitDurationFrame:SetFrameLevel(2)

	portraitDebuff.duration = portraitDurationFrame:CreateFontString(nil, "OVERLAY")
	portraitDebuff.duration:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")
	portraitDebuff.duration:SetTextColor(0.9, 0.9, 0.2, 1)
	portraitDebuff.duration:SetShadowOffset(1, -1)
	portraitDebuff.duration:SetShadowColor(0, 0, 0)
	portraitDebuff.duration:SetPoint("CENTER", FocusPortrait, "CENTER", 0, -7)

	-- cooldown spiral
	portraitDebuff.cd = CreateCooldown(portraitDebuff, 1.054, true)
	portraitDebuff.cd:SetAlpha(1)

	local function Round(num, idp)
		local mult = 10^(idp or 0)

		return floor(num * mult + 0.5) / mult
	end

	local a, maxa, b, c = 0.002, 0.058, 0, 1
	local function UpdatePortraitDebuff()
		local prioBuff = getPrioBuff(CURR_FOCUS_TARGET, 1)[1]

		if prioBuff ~= nil then
			local d = 1
			if b > maxa then c = -1 end
			if b < 0 then c = 1 end
			b = b + a * c
			d = -b

			local t = prioBuff.timeEnd - GetTime()
			portraitDebuff.debuffText:SetTexture(prioBuff.icon)
			portraitDebuff.duration:SetText(Round(t, t > 3 and 0 or 1))
			portraitDebuff.debuffText:Show()
			portraitDebuff.cd:SetTimers(prioBuff.timeStart, prioBuff.timeEnd)
			portraitDebuff.cd:Show()

			local color = prioBuff.border
			portraitDebuff.bgText:SetVertexColor(color[1], color[2], color[3])
			portraitDebuff.bgText:Show()
			portraitDebuff:Show()
		else
			portraitDebuff:Hide()
			portraitDebuff.cd:Hide()
			portraitDebuff.bgText:Hide()
			portraitDebuff.debuffText:Hide()
			portraitDebuff.duration:SetText(nil)
		end
	end

	local refresh = 0
	local f = CreateFrame("Frame")
	f:SetScript("OnUpdate", function()
		refresh = refresh - arg1
		if refresh < 0 then
			if ENEMYFRAMESPLAYERDATA.targetPortraitDebuff and Focus:FocusExists() then
				UpdatePortraitDebuff()
			else
				--if portraitDebuff:IsVisible() then
					portraitDebuff:Hide()
					portraitDebuff.cd:Hide()
					portraitDebuff.bgText:Hide()
					portraitDebuff.debuffText:Hide()
					portraitDebuff.duration:SetText(nil)
				--end
			end

			refresh = 0.1
		end
	end)
end)
