

    local _, class = UnitClass'player'
    local colour   = RAID_CLASS_COLORS[class]
    local menu     = _G['modui_options']

    local highlight = function()
        if modSkinned(this) then
            for _, v in pairs({modui_optionsactionbar, modui_display, modui_status, modui_elements, modui_colour, modui_optionsmodraid}) do modSkinColor(v, .2, .2, .2) end
            modSkinColor(this, 1, .8, 0)
        end
    end

    menu.modraid = CreateFrame('Button', 'modui_optionsmodraid', menu, 'UIPanelButtonTemplate')
    menu.modraid:SetWidth(100) menu.modraid:SetHeight(20)
    menu.modraid:SetText'Raid Frames'
    menu.modraid:SetFont(STANDARD_TEXT_FONT, 10)
    menu.modraid:SetPoint('LEFT', menu.actionbar, 'RIGHT', 3, 0)

    menu.modraid.apology = menu.modraid:CreateFontString(nil, 'OVERLAY', 'GameFontNormalLarge')
    menu.modraid.apology:SetPoint('TOP', menu, 0, -150)
    menu.modraid.apology:SetText'Options Coming Soon!'
    menu.modraid.apology:Hide()

    menu.modraid.text = menu.modraid:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.modraid.text:SetPoint('TOP', menu, 0, -180)
    menu.modraid.text:SetWidth(160)
    menu.modraid.text:SetText'Click the |cff2cfa44+|r that appears under the Minimap in a Raid to show your group frames.'
    menu.modraid.text:Hide()

    menu.modraid:SetScript('OnClick', function()
        highlight()
        for _, v in pairs({modui_optionsactionlayout, menu.intro, menu.uilink, menu.description, menu.whisper, menu.gryphon, menu.endcap, menu.chatstamp, menu.chatformat, menu.chateditbox, menu.itemlink, menu.auraformat, menu.targetaura, menu.tooltip, menu.tooltip.cursor, menu.castbar, menu.castbar.target, menu.horizontal, menu.value, menu.consolidate, menu.white, menu.ctDMG, menu.ctHEAL, menu.elements.title, menu.elements.description, menu.elementcontainer, menu.allelement, menu.actionlayout, menu.keydown, menu.keydown.selfcast}) do v:Hide() end
        for i = 1,  2 do _G['modui_optionsaurabutton'..i]:Hide() end
        for i = 1, 12 do _G['modui_element'..i]:Hide() end
        for i = 1, 60 do _G['modui_actionbutton'..i]:Hide() end
        menu.modraid.apology:Show()
        menu.modraid.text:Show()
        menu.reload:SetPoint('TOP', menu, 0, -295)
        if menu.reload:IsShown() then menu:SetHeight(340) else menu:SetHeight(280) end
    end)

    --
