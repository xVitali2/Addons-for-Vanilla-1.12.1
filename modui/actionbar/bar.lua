

    local _, class  = UnitClass'Player'
    local colour    = RAID_CLASS_COLORS[class]

    for i, v in pairs({
        PetActionBarFrameSlidingActionBarTexture0,
        PetActionBarFrameSlidingActionBarTexture1,
    }) do v:SetAlpha(0) end

    for i,v in pairs({MainMenuBarLeftEndCap, MainMenuBarRightEndCap, ExhaustionTick:GetNormalTexture(),}) do
        v:SetDrawLayer('OVERLAY', 7)
    end

    for i, v in pairs({ ShapeshiftBarLeft, ShapeshiftBarMiddle, ShapeshiftBarRight, }) do v:SetTexture'' end

    local icon = CreateFrame('Button', 'modmenu', MainMenuBar)
    icon:SetWidth(16) icon:SetHeight(33)
    icon:SetPoint('LEFT', MainMenuBarPerformanceBarFrameButton, 'RIGHT', 2, -1)
    icon:SetFrameLevel(4)
    icon:Show()

    icon.bd = icon:CreateTexture(nil, 'ARTWORK')
    icon.bd:SetAllPoints()
    icon.bd:SetTexture(0, 0, 0)

    local t = icon:CreateFontString(nil, 'ARTWORK') -- MENU OPTIONS ICON
    t:SetFont(STANDARD_TEXT_FONT, 16, 'OUTLINE')
    t:SetPoint('CENTER', icon, .5, .5)
    t:SetText'M'
    t:SetTextColor(colour.r, colour.g, colour.b)

    --
