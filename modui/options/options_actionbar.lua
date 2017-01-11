

    local _, class = UnitClass'player'
    local colour   = RAID_CLASS_COLORS[class]
    local menu     = _G['modui_options']

    RegisterCVar('modAction', 0, true)

    local layout = function(show)
        local bag = _G['modbag_inventory']
        if show then this:SetValue(tonumber(GetCVar'modAction')) end
        if this:GetValue() == 1 then
            SetCVar('modAction', 1, true)
            UIParent_ManageFramePositions()
            if tonumber(GetCVar'modOneBag') == 1 then bag:SetPoint('BOTTOMRIGHT', UIParent, -108, 103) end
            for i = 1, 60 do
                if i > 36 then
                    local bu = _G['modui_actionbutton'..i]
                    bu:ClearAllPoints()
                    bu:SetPoint('TOPRIGHT',
                                                i == 37 and menu or i == 49 and _G['modui_actionbutton'..(i - 12)] or _G['modui_actionbutton'..(i - 1)],
                                                i == 37 and 'TOPRIGHT' or i == 49 and 'TOPLEFT' or 'BOTTOMRIGHT',
                                                i == 37 and -25  or i == 49 and -8 or 0,
                                                i == 37 and -110 or i == 49 and 0 or -6)
                end
            end
        else
            SetCVar('modAction', 0, true)
            UIParent_ManageFramePositions()
            if tonumber(GetCVar'modOneBag') == 1 then bag:SetPoint('BOTTOMRIGHT', UIParent, -108, 153) end
            for i = 1, 60 do
                local bu = _G['modui_actionbutton'..i]
                bu:ClearAllPoints()
                bu:SetPoint('BOTTOMLEFT',
                                      i == 1 and menu or i == 13 and _G['modui_actionbutton'..(i - 12)] or i == 37 and _G['modui_actionbutton'..(i - 24)] or _G['modui_actionbutton'..(i - 1)],
                                     (i == 1 or i == 13 or i == 37) and 'TOPLEFT' or 'BOTTOMRIGHT',
                                      i == 1 and 50 or (i == 13 or i == 37) and 0 or 6,
                                      i == 1 and -250 or i == 13 and 10 or i == 37 and 8 or 0)
            end
        end
    end

    local highlight = function()
        if modSkinned(this) then
            for _, v in pairs({modui_optionsactionbar, modui_display, modui_status, modui_elements, modui_colour, modui_optionsmodraid}) do modSkinColor(v, .2, .2, .2) end
            modSkinColor(this, 1, .8, 0)
        end
    end

    menu.actionbar = CreateFrame('Button', 'modui_optionsactionbar', menu, 'UIPanelButtonTemplate')
    menu.actionbar:SetWidth(100) menu.actionbar:SetHeight(20)
    menu.actionbar:SetText'Actionbar'
    menu.actionbar:SetFont(STANDARD_TEXT_FONT, 10)
    menu.actionbar:SetPoint('LEFT', menu.colour, 'RIGHT', 3, 0)

    menu.actionlayout = CreateFrame('Slider', 'modui_optionsactionlayout', menu, 'OptionsSliderTemplate')
    menu.actionlayout:SetWidth(200) menu.actionlayout:SetHeight(20)
    menu.actionlayout:SetPoint('TOP', menu, 0, -130)
    menu.actionlayout:SetMinMaxValues(0, 1)
    menu.actionlayout:SetValue(0)
    menu.actionlayout:SetValueStep(1)
    menu.actionlayout:Hide()
    _G[menu.actionlayout:GetName()..'Text']:SetText'Positioning of 3rd & 4th Actionbars'
    _G[menu.actionlayout:GetName()..'Low']:SetText'Bottom Row'
    _G[menu.actionlayout:GetName()..'High']:SetText'Default'

    menu.actionlayout.title = menu.actionlayout:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.actionlayout.title:SetTextColor(colour.r, colour.g, colour.b)
    menu.actionlayout.title:SetPoint('TOPLEFT', menu, 30, -90)
    menu.actionlayout.title:SetText'—Button Layout'

    for i = 1, 60 do
        menu.actionbutton = CreateFrame('Button', 'modui_actionbutton'..i, menu)
        menu.actionbutton:SetHeight(5) menu.actionbutton:SetWidth(5)
        menu.actionbutton:SetPoint('BOTTOMLEFT',
                              i == 1 and menu or i == 13 and _G['modui_actionbutton'..(i - 12)] or i == 37 and _G['modui_actionbutton'..(i - 24)] or _G['modui_actionbutton'..(i - 1)],
                              i == 1 and 'BOTTOMLEFT' or (i == 13 or i == 37) and 'TOPLEFT' or 'BOTTOMRIGHT',
                              i == 1 and 50 or (i == 13 or i == 37) and 0 or 6,
                              i == 1 and 28 or i == 13 and 10 or i == 37 and 8 or 0)
        menu.actionbutton:Hide()

        menu.actionbutton.icon = menu.actionbutton:CreateTexture(nil, 'ARTWORK')
        menu.actionbutton.icon:SetAllPoints()
        menu.actionbutton.icon:SetTexture[[Interface\Icons\Spell_frost_frostbolt02]]
        menu.actionbutton.icon:SetTexCoord(.1, .9, .1, .9)
    end

    menu.actionlayout:SetScript('OnShow', function() layout(true) end)
    menu.actionlayout:SetScript('OnValueChanged', function() layout(false) end)

    menu.actionbar:SetScript('OnClick', function()
        highlight()
        for _, v in pairs({menu.intro, menu.uilink, menu.description, menu.whisper, menu.gryphon, menu.endcap, menu.chatstamp, menu.chatformat, menu.itemlink, menu.auraformat, menu.tooltip, menu.castbar, menu.horizontal, menu.value, menu.consolidate, menu.ctDMG, menu.ctHEAL, menu.elements.title, menu.elements.description, menu.elementcontainer, menu.allelement, menu.modraid.apology, menu.modraid.text}) do v:Hide() end
        for i = 1,  2 do _G['modui_optionsaurabutton'..i]:Hide() end
        for i = 1, 11 do _G['modui_element'..i]:Hide() end
        for i = 1, 60 do _G['modui_actionbutton'..i]:Show() end
        menu.actionlayout:Show()
        menu.reload:SetPoint('TOP', menu, 0, -295)
        if menu.reload:IsShown() then
            menu:SetHeight(340)
        else
            menu:SetHeight(280)
        end
    end)

    local f = CreateFrame'Frame'
    f:RegisterEvent'PLAYER_ENTERING_WORLD'
    f:SetScript('OnEvent', function()
        local cv = tonumber(GetCVar'modAction')
        if cv == 1 then menu.actionlayout:SetValue(1) else menu.actionlayout:SetValue(0) end
    end)


    --
