

    local TEXTURE   = [[Interface\AddOns\modui\statusbar\texture\sb.tga]]
    local cv        = tonumber(GetCVar'modPlayerCastbar')
    local _, class  = UnitClass'player'
    local orig      = {}

    local overrideIcons = {
        ['Hearthstone']    = [[Interface\Icons\inv_misc_rune_01]],
        ['Herb Gathering'] = [[Interface\Icons\spell_nature_naturetouchgrow]],
        ['Mining']         = [[Interface\Icons\trade_mining]],
        ['Fishing']        = [[Interface\Icons\trade_fishing]],
        ['Aimed Shot']     = [[Interface\Icons\inv_spear_07]]
    }

    orig.UseAction                  = UseAction
    orig.CastingBarFrame_OnEvent    = CastingBarFrame_OnEvent

    CastingBarFrame:SetStatusBarTexture(TEXTURE)

    CastingBarFrame.Icon = CreateFrame('Frame', nil, CastingBarFrame)
    CastingBarFrame.Icon:SetWidth(25)
    CastingBarFrame.Icon:SetHeight(25)
    CastingBarFrame.Icon:SetPoint('RIGHT', CastingBarFrame, 'LEFT', -10, 2.5)

    CastingBarFrame.Icon.Texture = CastingBarFrame.Icon:CreateTexture(nil, 'ARTWORK')
    CastingBarFrame.Icon.Texture:SetAllPoints()

    modSkin(CastingBarFrame, 12)
    modSkinPadding(CastingBarFrame, 2, 2, 2, 2, 2, 3, 2, 3)
    modSkinColor(CastingBarFrame, .2, .2, .2)
    modSkinHide(CastingBarFrame)

    modSkin(CastingBarFrame.Icon, 14)
    modSkinPadding(CastingBarFrame.Icon, 2)
    modSkinColor(CastingBarFrame.Icon, .2, .2, .2)

    CastingBarText:SetFont(STANDARD_TEXT_FONT, 12)
    CastingBarText:SetShadowOffset(1, -1)
    CastingBarText:SetShadowColor(0, 0, 0)

    local PlayerCastingBarFrame = function()
        CastingBarFrame:ClearAllPoints()
        CastingBarFrame:SetPoint('LEFT', PlayerFrame, 75, 0)
        CastingBarFrame:SetPoint('RIGHT', PlayerFrame, -8, 0)
        CastingBarFrame:SetPoint('TOP', PlayerFrame, 'BOTTOM', 0, class == 'SHAMAN'  and -10 or class == 'WARLOCK' and -10 or -2)
        CastingBarFrame.SetPoint = function() end
        CastingBarFrame.ClearAllPoints = function() end
        CastingBarFrame:SetWidth(142)
        CastingBarFrame:SetHeight(10)

        CastingBarBorder:Hide()

        CastingBarSpark:SetTexture''
        CastingBarFlash:SetTexture''

        CastingBarText:ClearAllPoints()
        CastingBarText:SetPoint('TOPLEFT', CastingBarFrame, 'BOTTOMLEFT', 2, -5)
        CastingBarText:SetJustifyH'LEFT'

        CastingBarFrame.Icon:SetPoint('RIGHT', CastingBarFrame, 'LEFT', -10, 1)

        modSkinShow(CastingBarFrame)
    end

    local ToggleIcon = function()
        local t = CastingBarText:GetText()
        if not t or (not CastingBarFrame.hasIcon and not overrideIcons[t]) then
            CastingBarFrame.Icon:Hide()
        else
            CastingBarFrame.Icon:Show()
            if  overrideIcons[t] then
                CastingBarFrame.Icon.Texture:SetTexture(overrideIcons[t])
            end
        end
    end

    local HideIcon = function()
        if  CastingBarFrame.hasIcon then
            CastingBarFrame.hasIcon = false
        end
    end

    UseAction = function(slot, target, button)
        orig.UseAction(slot, target, button)
        if  CastingBarFrame:GetAlpha() < 1 or not CastingBarFrame:IsShown() then
            local icon = GetActionTexture(slot)
            if  icon then
                CastingBarFrame.hasIcon = true
                CastingBarFrame.Icon.Texture:SetTexture(icon)
                CastingBarFrame:SetScript('OnHide', HideIcon)
            end
            ToggleIcon()
        end
    end

    if cv == 1 then
        PlayerCastingBarFrame()
    end

    CastingBarFrame_OnEvent = function()
        orig.CastingBarFrame_OnEvent()
        if  event == 'SPELLCAST_STOP'
        or  event == 'SPELLCAST_CHANNEL_STOP'
        or  event == 'SPELLCAST_FAILED'
        or  event == 'SPELLCAST_INTERRUPTED' then
            HideIcon()
        end
    end

    CastingBarFrame:SetScript('OnShow', ToggleIcon)



    --
