

    if tonumber(GetCVar'modUnitFrame') == 0 then return end

    for i = 1, 4 do
        local f = CreateFrame('Frame', 'modBossFrame'..i, UIParent)
        f:SetWidth(128) f:SetHeight(53) f:SetScale(.85)
        f:SetHitRectInsets(85, 7, 6, 7)
        f:EnableMouse(true)
        f:Hide()

        if i == 1 then
            f:SetPoint('TOPRIGHT', Minimap, 'BOTTOMRIGHT', -20, -75)
        else
            f:SetPoint('TOPLEFT', _G['modBossFrame'..(i - 1)], 'BOTTOMLEFT', 0, -10)
        end

        f.portrait = f:CreateTexture(nil, 'BACKGROUND')
        f.portrait:SetWidth(37) f.portrait:SetHeight(37)
        f.portrait:SetPoint('TOPRIGHT', -7, -6)

        f.bg = f:CreateTexture(nil, 'BACKGROUND')
        f.bg:SetWidth(70) f.bg:SetHeight(16)
        f.bg:SetTexture(0, 0, 0, .5)
        f.bg:SetPoint('TOPLEFT', 12, -12)

        f.border = f:CreateTexture(nil, 'OVERLAY')
        f.border:SetWidth(128) f.border:SetHeight(64)
        f.border:SetPoint('TOPLEFT', 0, -2)
        f.border:SetTexture[[Interface\TargetingFrame\UI-PartyFrame]]
        f.border:SetTexCoord(1, 0, 0, 1)
        table.insert(MODUI_COLOURELEMENTS_FOR_UI, f.border)

        f.name = f:CreateFontString(nil, 'OVERLAY', 'GameFontNormalSmall')
        f.name:SetWidth(85) f.name:SetHeight(10)
        f.name:SetJustifyH'RIGHT'
        f.name:SetPoint('TOPRIGHT', -40, 0)

        f.health = CreateFrame('StatusBar', f:GetName()..'HealthBar', f, 'TextStatusBar')
        f.health:SetWidth(70) f.health:SetHeight(8)
        f.health:SetStatusBarTexture[[Interface\TargetingFrame\UI-StatusBar]]
        f.health:SetPoint('TOPLEFT', f, 12, -12)
        f.health:SetMinMaxValues(0, 100)
        f.health:SetValue(100)
        f.health:SetFrameLevel(1)
        f.health:SetStatusBarColor(0, .9, 0)
        f.health:SetScript('OnValueChanged', function() UnitFrameHealthBar_OnValueChanged(arg1) end)
        
        f.mana = CreateFrame('StatusBar', f:GetName()..'ManaBar', f, 'TextStatusBar')
        f.mana:SetWidth(70) f.mana:SetHeight(8)
        f.mana:SetStatusBarTexture[[Interface\TargetingFrame\UI-StatusBar]]
        f.mana:SetPoint('TOPLEFT', f.health, 'BOTTOMLEFT', 0, -4)
        f.mana:SetMinMaxValues(0, 100)
        f.mana:SetValue(100)
        f.mana:SetFrameLevel(1)
        f.mana:SetStatusBarColor(0, 0, 1)
    end

    --
