

    local _, class = UnitClass'player'
    local colour   = RAID_CLASS_COLORS[class]
    local menu     = _G['modui_options']

    RegisterCVar('modStatus', 1, true)
    RegisterCVar('modBoth', 1, true)
    RegisterCVar('modValue', 1, true)

    local xy = function()
        local hp, hmax = UnitHealth'player', UnitHealthMax'player'
        local pp, pmax = UnitMana'player', UnitManaMax'player'
        menu.horizontal.hp:SetText(true_format(hp))
        menu.horizontal.pp:SetText(true_format(pp))
        menu.horizontal.hp:ClearAllPoints() menu.horizontal.pp:ClearAllPoints()
        if menu.horizontal:GetChecked() == 1 then
            SetCVar('modStatus', 1)
            menu.horizontal.hp:SetPoint('TOP', menu, 0, -125)
            menu.horizontal.pp:SetPoint('TOP', menu.horizontal.hp, 'BOTTOM', 0, -5)
        else
            SetCVar('modStatus', 0)
            menu.horizontal.pp:SetPoint('TOP', menu, -20, -125)
            menu.horizontal.hp:SetPoint('LEFT', menu.horizontal.pp, 'RIGHT', 20, 0)
        end
    end

    local layout = function()
        local hp, max = UnitHealth'player', UnitHealthMax'player'
        local percent = math.floor(hp/max*100)
        _G[menu.value:GetName()..'Low']:SetText('|cffefce4bPercent —|r'..percent..'%')
        _G[menu.value:GetName()..'High']:SetText(true_format(hp)..'|cffefce4b— True Value|r')
    end

    local highlight = function()
        if modSkinned(this) then
            for _, v in pairs({modui_optionsactionbar, modui_display, modui_status, modui_elements, modui_colour, modui_optionsmodraid}) do modSkinColor(v, .2, .2, .2) end
            modSkinColor(this, 1, .8, 0)
        end
    end

    local reload = function()
        if not menu.reload:IsShown() then
            menu.reload:Show()
            menu:SetHeight(menu:GetHeight() + 70)
        end
    end

    -- TOGGLE HORIZONTAL VALUES
    menu.horizontal = CreateFrame('CheckButton', 'modui_statushorizontal', menu, 'UICheckButtonTemplate')
    menu.horizontal:SetHeight(20) menu.horizontal:SetWidth(20)
    menu.horizontal:SetPoint('TOPLEFT', menu, 25, -100)
    menu.horizontal:Hide()
    _G[menu.horizontal:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.horizontal:GetName()..'Text']:SetWidth(270)
    _G[menu.horizontal:GetName()..'Text']:SetPoint('LEFT', menu.horizontal, 'RIGHT', 4, 0)
    _G[menu.horizontal:GetName()..'Text']:SetText'Toggle Horizontally Aligned or Default Status Text Positions on UnitFrames'

    menu.horizontal.hp = menu.horizontal:CreateFontString(nil, 'OVERLAY', 'GameFontNormalSmall')
    menu.horizontal.hp:SetTextColor(1, 1, 1)

    menu.horizontal.pp = menu.horizontal:CreateFontString(nil, 'OVERLAY', 'GameFontNormalSmall')
    menu.horizontal.pp:SetTextColor(1, 1, 1)

    menu.horizontal.warning = menu.horizontal:CreateFontString(nil, 'OVERLAY', 'GameFontNormalSmall')
    menu.horizontal.warning:SetText'Will reload ui!'
    menu.horizontal.warning:SetTextColor(1, .2, 0)
    menu.horizontal.warning:SetPoint('TOPLEFT', menu.horizontal, 'BOTTOMRIGHT', -15, -22)

    menu.horizontal.title = menu.horizontal:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.horizontal.title:SetTextColor(colour.r, colour.g, colour.b)
    menu.horizontal.title:SetPoint('TOPLEFT', menu, 30, -85)
    menu.horizontal.title:SetText'—Positioning'

    -- TOGGLE PERCENT VALUES
    menu.value = CreateFrame('Slider', 'modui_valueslider', menu, 'OptionsSliderTemplate')
    menu.value:SetWidth(200) menu.value:SetHeight(20)
    menu.value:SetPoint('TOP', menu, 0, -190)
    menu.value:SetMinMaxValues(0, 1)
    menu.value:SetValue(0)
    menu.value:SetValueStep(1)
    menu.value:Hide()
    _G[menu.value:GetName()..'Text']:SetText'\% or True Value Text on Statusbars'

    menu.value.title = menu.value:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.value.title:SetTextColor(colour.r, colour.g, colour.b)
    menu.value.title:SetPoint('TOPLEFT', menu, 30, -160)
    menu.value.title:SetText'—Formatting'

    -- CONSOLIDATED VALUE DISPLAY (TRUE + %)
    menu.consolidate = CreateFrame('CheckButton', 'modui_statusconsolidate', menu, 'UICheckButtonTemplate')
    menu.consolidate:SetHeight(20) menu.consolidate:SetWidth(20)
    menu.consolidate:SetPoint('TOPLEFT', menu.horizontal, 'BOTTOMLEFT', 0, -110)
    menu.consolidate:Hide()
    _G[menu.consolidate:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.consolidate:GetName()..'Text']:SetWidth(270)
    _G[menu.consolidate:GetName()..'Text']:SetPoint('LEFT', menu.consolidate, 'RIGHT', 4, 0)
    _G[menu.consolidate:GetName()..'Text']:SetText'Show Both True & \% Values on Statusbars (Disables Slider Option)'

    menu.consolidate.warning = menu.consolidate:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.consolidate.warning:SetFontObject(GameFontNormalSmall)
    menu.consolidate.warning:SetText'Will reload ui!'
    menu.consolidate.warning:SetTextColor(1, .2, 0)
    menu.consolidate.warning:SetPoint('TOPLEFT', menu.consolidate, 'BOTTOMRIGHT', -15, -4)

    menu.white = CreateFrame('CheckButton', 'modui_whitetext', menu, 'UICheckButtonTemplate')
    menu.white:SetHeight(20) menu.white:SetWidth(20)
    menu.white:SetPoint('TOPLEFT', menu.horizontal, 0, -165)
    menu.white:Hide()
    _G[menu.white:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.white:GetName()..'Text']:SetWidth(270)
    _G[menu.white:GetName()..'Text']:SetPoint('LEFT', menu.white, 'RIGHT', 4, 0)
    _G[menu.white:GetName()..'Text']:SetText'White Status Text'

    menu.status = CreateFrame('Button', 'modui_status', menu, 'UIPanelButtonTemplate')
    menu.status:SetWidth(100) menu.status:SetHeight(20)
    menu.status:SetText'Status Text'
    menu.status:SetFont(STANDARD_TEXT_FONT, 10)
    menu.status:SetPoint('LEFT', menu.display, 'RIGHT', 3, 0)

    menu.ctDMG = CreateFrame('CheckButton', 'modui_statusctDMG', menu, 'UICheckButtonTemplate')
    menu.ctDMG:SetHeight(20) menu.ctDMG:SetWidth(20)
    menu.ctDMG:SetPoint('TOPLEFT', menu, 25, -305)
    menu.ctDMG:Hide()
    _G[menu.ctDMG:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.ctDMG:GetName()..'Text']:SetWidth(270)
    _G[menu.ctDMG:GetName()..'Text']:SetPoint('LEFT', menu.ctDMG, 'RIGHT', 4, 0)
    _G[menu.ctDMG:GetName()..'Text']:SetText'Show Outgoing Damage'

    menu.ctHEAL = CreateFrame('CheckButton', 'modui_statusctHEAL', menu, 'UICheckButtonTemplate')
    menu.ctHEAL:SetHeight(20) menu.ctHEAL:SetWidth(20)
    menu.ctHEAL:SetPoint('TOPLEFT', menu, 25, -323)
    menu.ctHEAL:Hide()
    _G[menu.ctHEAL:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.ctHEAL:GetName()..'Text']:SetWidth(270)
    _G[menu.ctHEAL:GetName()..'Text']:SetPoint('LEFT', menu.ctHEAL, 'RIGHT', 4, 0)
    _G[menu.ctHEAL:GetName()..'Text']:SetText'Show Outgoing Healing'

    menu.ctDMG.title = menu.ctDMG:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.ctDMG.title:SetTextColor(colour.r, colour.g, colour.b)
    menu.ctDMG.title:SetPoint('TOPLEFT', menu, 30, -290)
    menu.ctDMG.title:SetText'—Scrolling Combat Text'

    menu.status:SetScript('OnClick', function()
        highlight()
        for _, v in pairs({menu.intro, menu.uilink, menu.description, menu.whisper, menu.gryphon, menu.endcap, menu.chatstamp, menu.chatformat, menu.chateditbox, menu.itemlink, menu.auraformat, menu.targetaura, menu.tooltip, menu.tooltip.cursor, menu.castbar, menu.castbar.target, menu.elements.title, menu.elements.description, menu.elementcontainer, menu.allelement, menu.actionlayout, menu.keydown, menu.keydown.selfcast, menu.modraid.apology, menu.modraid.text, menu.modraid.frame, menu.modraid.frametext}) do v:Hide() end
        for i = 1,  2 do _G['modui_optionsaurabutton'..i]:Hide() end
        for i = 1, 12 do _G['modui_element'..i]:Hide() end
        for i = 1, 60 do _G['modui_actionbutton'..i]:Hide() end
        for _, v in pairs({menu.horizontal, menu.value, menu.consolidate, menu.white, menu.ctDMG, menu.ctHEAL}) do v:Show() end
        menu.reload:SetPoint('TOP', menu, 0, -380)
        if menu.reload:IsShown() then menu:SetHeight(435) else menu:SetHeight(365) end
    end)

    menu.horizontal:SetScript('OnShow', xy)
    menu.horizontal:SetScript('OnClick', function() xy() reload() end)

    menu.value:SetScript('OnShow', layout)
    menu.value:SetScript('OnValueChanged', function()
        local cv = tonumber(GetCVar'modValue')
        layout()
        if this:GetValue() == 1 then SetCVar('modValue', 1) else SetCVar('modValue', 0) end
        if this:GetValue() ~= cv then reload() end
    end)

    menu.consolidate:SetScript('OnClick', function()
        if this:GetChecked() == 1 then
            OptionsFrame_DisableSlider(menu.value)
            SetCVar('modBoth', 1)
            reload()
        else
            OptionsFrame_EnableSlider(menu.value)
            SetCVar('modBoth', 0)
            reload()
        end
    end)

    menu.white:SetScript('OnClick', function()
        if this:GetChecked() == 1 then
            _G['modui_vars'].db['modWhiteStatusText'] = 1
            MODUI_VARS['modWhiteStatusText'] = 1
            reload()
        else
            _G['modui_vars'].db['modWhiteStatusText'] = 0
            MODUI_VARS['modWhiteStatusText'] = 0
            reload()
        end
    end)

    menu.ctDMG:SetScript('OnClick', function()
        if this:GetChecked() == 1 then
            _G['modui_vars'].db['modSCTDMG'] = 1
            MODUI_VARS['modSCTDMG'] = 1
        else
            _G['modui_vars'].db['modSCTDMG'] = 0
            MODUI_VARS['modSCTDMG'] = 0
        end
    end)

    menu.ctHEAL:SetScript('OnClick', function()
        if this:GetChecked() == 1 then
            _G['modui_vars'].db['modSCTHEAL'] = 1
            MODUI_VARS['modSCTHEAL'] = 1
        else
            _G['modui_vars'].db['modSCTHEAL'] = 0
            MODUI_VARS['modSCTHEAL'] = 0
        end
    end)


    local f = CreateFrame'Frame'
    f:RegisterEvent'PLAYER_ENTERING_WORLD'
    f:SetScript('OnEvent', function()
        local cv, t
        cv = tonumber(GetCVar'modStatus')
        if cv == 1 then menu.horizontal:SetChecked(true) xy() else menu.horizontal:SetChecked(false) xy() end
        cv = tonumber(GetCVar'modValue')
        if cv == 1 then menu.value:SetValue(1) else menu.value:SetValue(0) end
        cv = tonumber(GetCVar'modBoth')
        if cv == 1 then
            menu.consolidate:SetChecked(true)
            OptionsFrame_DisableSlider(menu.value)
        else
            menu.consolidate:SetChecked(false)
            OptionsFrame_EnableSlider(menu.value)
        end
        cv = _G['modui_vars'].db['modSCTDMG']
        if cv == 1 then menu.ctDMG:SetChecked(true) else menu.ctDMG:SetChecked(false) end
        cv = _G['modui_vars'].db['modSCTHEAL']
        if cv == 1 then menu.ctHEAL:SetChecked(true) else menu.ctHEAL:SetChecked(false) end
        cv = _G['modui_vars'].db['modWhiteStatusText']
        if  cv == 1 then
            menu.white:SetChecked(true)
        else
            menu.white:SetChecked(false)
        end
    end)

    --
