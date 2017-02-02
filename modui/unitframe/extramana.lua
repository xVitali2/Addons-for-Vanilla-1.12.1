

    if tonumber(GetCVar'modUnitFrame') == 0 then return end

    local _, class = UnitClass'player'
    if class ~= 'DRUID' then return end

    local TEXTURE       = [[Interface\AddOns\modui\statusbar\texture\sb.tga]]
    local BACKDROP      = {bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],}
    local DruidManaLib  = AceLibrary'DruidManaLib-1.0'

    local f = CreateFrame'Frame'

    PlayerFrame.ExtraManaBar = CreateFrame('StatusBar', 'ExtraManaBar', PlayerFrame)
    PlayerFrame.ExtraManaBar:SetWidth(100)
    PlayerFrame.ExtraManaBar:SetHeight(10)
    PlayerFrame.ExtraManaBar:SetPoint('TOP', PlayerFrame, 'BOTTOM', 50, 35)
    PlayerFrame.ExtraManaBar:SetStatusBarTexture(TEXTURE)
    PlayerFrame.ExtraManaBar:SetStatusBarColor(ManaBarColor[0].r, ManaBarColor[0].g, ManaBarColor[0].b)
    PlayerFrame.ExtraManaBar:SetBackdrop(BACKDROP)
    PlayerFrame.ExtraManaBar:SetBackdropColor(0, 0, 0)

    PlayerFrame.ExtraManaBar.Text = PlayerFrame.ExtraManaBar:CreateFontString('ExtraManaBarText', 'OVERLAY', 'TextStatusBarText')
    PlayerFrame.ExtraManaBar.Text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
    PlayerFrame.ExtraManaBar.Text:SetPoint('TOP', PlayerFrame.ExtraManaBar, 'BOTTOM', 0, 9)
    PlayerFrame.ExtraManaBar.Text:SetTextColor(.6, .65, 1)

    PlayerFrame.ExtraManaBar:SetScript('OnMouseUp', function(bu)
        PlayerFrame:Click(bu)
    end)

    modSkin(PlayerFrame.ExtraManaBar, 12)
    modSkinPadding(PlayerFrame.ExtraManaBar, 2, 2, 2, 2, 2, 2, 2, 2)
    modSkinColor(PlayerFrame.ExtraManaBar, .2, .2, .2)

    local OnUpdate = function()
        DruidManaLib:MaxManaScript()
        local v, max = DruidManaLib:GetMana()
        PlayerFrame.ExtraManaBar:SetMinMaxValues(0, max)
        PlayerFrame.ExtraManaBar:SetValue(v)
        PlayerFrame.ExtraManaBar.Text:SetText(true_format(v))
    end

    local OnEvent = function()
        if event == 'PLAYER_AURAS_CHANGED' then
            if not PlayerFrame.ExtraManaBar:IsShown() then return end
        end
        if  f.loaded and UnitPowerType'player' ~= 0 then
            PlayerFrame.ExtraManaBar:Show()
        else
            PlayerFrame.ExtraManaBar:Hide()
            f.loaded = true
        end
    end

    f:RegisterEvent'UNIT_DISPLAYPOWER'
    f:RegisterEvent'PLAYER_AURAS_CHANGED'

    f:SetScript('OnUpdate', OnUpdate)
    f:SetScript('OnEvent', OnEvent)

    --
