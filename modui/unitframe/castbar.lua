

    if tonumber(GetCVar'modUnitFrame') == 0 then return end

    local TEXTURE = [[Interface\AddOns\modui\statusbar\texture\sb.tga]]
    local BACKDROP = {bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],}
    local f = CreateFrame'Frame'

    local parent = CreateFrame('Frame', 'modCastbarParent', UIParent)
    parent:SetWidth(142)
    parent:SetHeight(8)
    parent:SetPoint('TOP', TargetFrame, 'BOTTOM', -38, -22)
    parent:SetMovable(true)
    parent:EnableMouse(true)
    parent:RegisterForDrag'LeftButton'
    parent:SetBackdrop({bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],
							 insets = {left = -1, right = -1, top = -1, bottom = -1}})
    parent:SetBackdropColor(0, 0, 0, 0)

    TargetFrame.cast = CreateFrame('StatusBar', 'TargetFrame_modCastbar', parent)
    TargetFrame.cast:SetStatusBarTexture(TEXTURE)
    TargetFrame.cast:SetStatusBarColor(1, .4, 0)
    TargetFrame.cast:SetBackdrop(BACKDROP)
    TargetFrame.cast:SetBackdropColor(0, 0, 0)
    TargetFrame.cast:SetHeight(8)
    TargetFrame.cast:SetAllPoints(parent)
    TargetFrame.cast:SetValue(0)
    TargetFrame.cast:Hide()

    TargetFrame.cast.text = TargetFrame.cast:CreateFontString(nil, 'OVERLAY')
    TargetFrame.cast.text:SetTextColor(1, 1, 1)
    TargetFrame.cast.text:SetFont(STANDARD_TEXT_FONT, 12)
    TargetFrame.cast.text:SetShadowOffset(1, -1)
    TargetFrame.cast.text:SetShadowColor(0, 0, 0)
    TargetFrame.cast.text:SetPoint('TOPLEFT', TargetFrame.cast, 'BOTTOMLEFT', 2, -5)

    TargetFrame.cast.timer = TargetFrame.cast:CreateFontString(nil, 'OVERLAY')
    TargetFrame.cast.timer:SetTextColor(1, 1, 1)
    TargetFrame.cast.timer:SetFont(STANDARD_TEXT_FONT, 9)
    TargetFrame.cast.timer:SetShadowOffset(1, -1)
    TargetFrame.cast.timer:SetShadowColor(0, 0, 0)
    TargetFrame.cast.timer:SetPoint('RIGHT', TargetFrame.cast, -1, 1)

    TargetFrame.cast.icon = TargetFrame.cast:CreateTexture(nil, 'OVERLAY', nil, 7)
    TargetFrame.cast.icon:SetWidth(18) TargetFrame.cast.icon:SetHeight(18)
    TargetFrame.cast.icon:SetPoint('RIGHT', TargetFrame.cast, 'LEFT', -8, 0)
    TargetFrame.cast.icon:SetTexCoord(.1, .9, .1, .9)

    local ic = CreateFrame('Frame', nil, TargetFrame.cast)
    ic:SetAllPoints(TargetFrame.cast.icon)

    modSkin(TargetFrame.cast, 12)
    modSkinPadding(TargetFrame.cast, 2, 2, 2, 2, 2, 3, 2, 3)
    modSkinColor(TargetFrame.cast, .2, .2, .2)

    modSkin(ic, 13.5)
    modSkinPadding(ic, 3)
    modSkinColor(ic, .2, .2, .2)

    local getTimerLeft = function(tEnd)
        local t = tEnd - GetTime()
        if t > 5 then return decimal_round(t, 0) else return decimal_round(t, 1) end
    end

    local checkAuras = function()
        local n = 0
        for i = 1,  5 do
            local b = UnitBuff('target', i)
            if b then n = n + 1 end
        end
        for i = 1, 16 do
            local d = UnitDebuff('target', i)
            if d then n = n + 1 end
        end
        return n
    end

    local position = function()
        local aura = checkAuras()
        if TargetofTargetFrame:IsShown() then
            if aura < 11 then
                TargetFrame.cast:SetPoint('TOP', TargetFrame, 'BOTTOM', 0, -35)
            elseif aura < 16 then
                TargetFrame.cast:SetPoint('TOP', TargetFrame, 'BOTTOM', 0, -50)
            else
                TargetFrame.cast:SetPoint('TOP', TargetFrame, 'BOTTOM', 0, -95)
            end
        else
            if aura < 7 then
                TargetFrame.cast:SetPoint('TOP', TargetFrame, 'BOTTOM', 0, -2)
            elseif aura < 13 then
                TargetFrame.cast:SetPoint('TOP', TargetFrame, 'BOTTOM', 0, -25)
            elseif aura < 19 then
                TargetFrame.cast:SetPoint('TOP', TargetFrame, 'BOTTOM', 0, -50)
            else
                --TargetFrame.cast:SetPoint('TOP', TargetFrame, 'BOTTOM', 0, -75)
                TargetFrame.cast:SetPoint('TOP', TargetFrame, 'BOTTOM', 0, -100)
            end
        end
    end

    local showCast = function()
        local target = GetUnitName'target'
        TargetFrame.cast:Hide()
        if target ~= nil or cv == 1 then
            local v = PROCESSCASTINGgetCast(target)
            if v ~= nil then
                if  GetTime() < v.timeEnd then
                    TargetFrame.cast:SetMinMaxValues(0, v.timeEnd - v.timeStart)
                    if v.inverse then
                        TargetFrame.cast:SetValue(mod((v.timeEnd - GetTime()), v.timeEnd - v.timeStart))
                    else
                        TargetFrame.cast:SetValue(mod((GetTime() - v.timeStart), v.timeEnd - v.timeStart))
                    end

                    TargetFrame.cast.text:SetText(v.spell)
                    TargetFrame.cast.timer:SetText(getTimerLeft(v.timeEnd)..'s')
                    TargetFrame.cast.icon:SetTexture(v.icon)
                    TargetFrame.cast:Show()
                    position()
                end
            elseif _G['modui_castbarTarget']:GetChecked() == 1 then
                    TargetFrame.cast:Show()
                    TargetFrame.cast:SetMinMaxValues(0, 1)
                    TargetFrame.cast:SetValue(1)
                    TargetFrame.cast.text:SetText'Frostbolt'
                    TargetFrame.cast.timer:SetText'0s'
                    TargetFrame.cast.icon:SetTexture[[Interface\ICONS\spell_frost_frostbolt02]]
            end
        end
    end

    f:SetScript('OnUpdate', showCast)

    --
