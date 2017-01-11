

    local _, class = UnitClass'player'
    local colour   = RAID_CLASS_COLORS[class]
    local menu     = _G['modui_options']
    local orig = {}

    orig.GroupLootFrame_OnShow = GroupLootFrame_OnShow


    local highlight = function()
        if  modSkinned(this) then
            for _, v in pairs({modui_optionsactionbar, modui_display, modui_status, modui_elements, modui_colour, modui_optionsmodraid}) do modSkinColor(v, .2, .2, .2) end
            modSkinColor(this, 1, .8, 0)
        end
    end

    local showColourPicker = function(r, g, b, a, callback)
        ColorPickerFrame:SetColorRGB(r, g, b)
        ColorPickerFrame.hasOpacity = false
        ColorPickerFrame.func = callback
        ColorPickerFrame:Hide()
        ColorPickerFrame.modui = true
        ColorPickerFrame:Show()
        ColorPickerFrame:SetPoint('TOP', _G['modui_options'], 0, 25)
    end

    local f = CreateFrame'Frame'
    f.recolourTexture = function(colour, cancel)
        if  colour then
            if cancel then
                MODUI_COLOUR_FOR_UI.colour.r, MODUI_COLOUR_FOR_UI.colour.g, MODUI_COLOUR_FOR_UI.colour.b = MODUI_PREVCOLOUR_FOR_UI.colour.r, MODUI_PREVCOLOUR_FOR_UI.colour.g, MODUI_PREVCOLOUR_FOR_UI.colour.b
            else
                MODUI_COLOUR_FOR_UI.colour.r, MODUI_COLOUR_FOR_UI.colour.g, MODUI_COLOUR_FOR_UI.colour.b = colour.r, colour.b, colour.g
            end
        else
            MODUI_COLOUR_FOR_UI.colour.r, MODUI_COLOUR_FOR_UI.colour.g, MODUI_COLOUR_FOR_UI.colour.b = ColorPickerFrame:GetColorRGB()
        end
        for _, v in pairs(MODUI_COLOURELEMENTS_FOR_UI) do
            v:SetVertexColor(
                            MODUI_COLOUR_FOR_UI.colour.r,
                            MODUI_COLOUR_FOR_UI.colour.g,
                            MODUI_COLOUR_FOR_UI.colour.b,
                            MODUI_COLOUR_FOR_UI.colour.a
                            )
        end
        for _, v in pairs(MODUI_COLOURELEMENTS_BORDER_FOR_UI) do
            v:SetBackdropBorderColor(
                            MODUI_COLOUR_FOR_UI.colour.r,
                            MODUI_COLOUR_FOR_UI.colour.g,
                            MODUI_COLOUR_FOR_UI.colour.b,
                            MODUI_COLOUR_FOR_UI.colour.a
                            )
        end
    end

    ColorPickerFrame.classcolour = CreateFrame('Button', 'ColorPickerFrameClassColour', ColorPickerFrame, 'GameMenuButtonTemplate')
    ColorPickerFrame.classcolour:SetWidth(144) ColorPickerFrame.classcolour:SetHeight(24)
    ColorPickerFrame.classcolour:SetText('|cff'..HEX_CLASS_COLORS[class]..'Class Colour UI|r')
    ColorPickerFrame.classcolour:SetPoint('BOTTOMRIGHT', ColorPickerCancelButton, 0, 22)
    ColorPickerFrame.classcolour:Hide()

    ColorPickerFrame.reset = CreateFrame('Button', 'ColorPickerFrameReset', ColorPickerFrame, 'GameMenuButtonTemplate')
    ColorPickerFrame.reset:SetWidth(144) ColorPickerFrame.reset:SetHeight(24)
    ColorPickerFrame.reset:SetText'Reset to Default'
    ColorPickerFrame.reset:SetPoint('BOTTOMLEFT', ColorPickerOkayButton, 0, 22)
    ColorPickerFrame.reset:Hide()

    menu.colour = CreateFrame('Button', 'modui_colour', menu, 'UIPanelButtonTemplate')
    menu.colour:SetWidth(100) menu.colour:SetHeight(20)
    menu.colour:SetText'UI Colour'
    menu.colour:SetFont(STANDARD_TEXT_FONT, 10)
    menu.colour:SetPoint('TOPLEFT', menu.display, 'BOTTOMLEFT', 0, -4)

    ColorPickerFrame:SetScript('OnShow', function()
        MODUI_PREVCOLOUR_FOR_UI.colour.r, MODUI_PREVCOLOUR_FOR_UI.colour.g, MODUI_PREVCOLOUR_FOR_UI.colour.b = MODUI_COLOUR_FOR_UI.colour.r, MODUI_COLOUR_FOR_UI.colour.g, MODUI_COLOUR_FOR_UI.colour.b
        if  this.hasOpacity then
            OpacitySliderFrame:Show()
            OpacitySliderFrame:SetValue(this.opacity)
            this:SetWidth(365)
        else
            OpacitySliderFrame:Hide()
            this:SetWidth(305)
        end
        if ColorPickerFrame.modui then
            this:SetHeight(220)
            ColorPickerFrame.reset:Show()
            ColorPickerFrame.classcolour:Show()
        end
    end)

    ColorPickerFrame:SetScript('OnHide', function()
        ColorPickerFrame.reset:Hide()
        ColorPickerFrame.classcolour:Hide()
        ColorPickerFrame.modui = false
    end)

    ColorPickerFrame:SetScript('OnKeyDown', function()
        if  arg1 == 'ESCAPE' then
            HideUIPanel(this)
            f.recolourTexture(MODUI_PREVCOLOUR_FOR_UI, true)
        end
    end)

    ColorPickerCancelButton:SetScript('OnClick', function()
        HideUIPanel(this:GetParent())
		f.recolourTexture(MODUI_PREVCOLOUR_FOR_UI, true)
    end)

    ColorPickerFrame.classcolour:SetScript('OnClick', function()
        local colour = RAID_CLASS_COLORS[class]
        MODUI_COLOUR_FOR_UI.colour.r, MODUI_COLOUR_FOR_UI.colour.g, MODUI_COLOUR_FOR_UI.colour.b = colour.r, colour.g, colour.b
        ColorPickerFrame:SetColorRGB(colour.r, colour.g, colour.b)
        for _, v in pairs(MODUI_COLOURELEMENTS_FOR_UI) do v:SetVertexColor(MODUI_COLOUR_FOR_UI.colour.r, MODUI_COLOUR_FOR_UI.colour.g, MODUI_COLOUR_FOR_UI.colour.b) end
        for _, v in pairs(MODUI_COLOURELEMENTS_BORDER_FOR_UI) do v:SetBackdropBorderColor(MODUI_COLOUR_FOR_UI.colour.r, MODUI_COLOUR_FOR_UI.colour.g, MODUI_COLOUR_FOR_UI.colour.b) end
    end)

    ColorPickerFrame.reset:SetScript('OnClick', function()
        MODUI_COLOUR_FOR_UI.colour.r, MODUI_COLOUR_FOR_UI.colour.g, MODUI_COLOUR_FOR_UI.colour.b = .2, .2, .2
        ColorPickerFrame:SetColorRGB(.2, .2, .2)
        for _, v in pairs(MODUI_COLOURELEMENTS_FOR_UI) do v:SetVertexColor(MODUI_COLOUR_FOR_UI.colour.r, MODUI_COLOUR_FOR_UI.colour.g, MODUI_COLOUR_FOR_UI.colour.b) end
        for _, v in pairs(MODUI_COLOURELEMENTS_BORDER_FOR_UI) do v:SetBackdropBorderColor(MODUI_COLOUR_FOR_UI.colour.r, MODUI_COLOUR_FOR_UI.colour.g, MODUI_COLOUR_FOR_UI.colour.b) end
    end)

    menu.colour:SetScript('OnClick', function()
        local r, g, b, a = MODUI_COLOUR_FOR_UI.colour.r, MODUI_COLOUR_FOR_UI.colour.g, MODUI_COLOUR_FOR_UI.colour.b, 1
        showColourPicker(r, g, b, a, f.recolourTexture)
    end)

    function GroupLootFrame_OnShow()
        orig.GroupLootFrame_OnShow()
        for _, v in pairs({_G[this:GetName()..'Corner'], _G[this:GetName()..'Decoration']}) do
            v:SetVertexColor(MODUI_COLOUR_FOR_UI.colour.r, MODUI_COLOUR_FOR_UI.colour.g, MODUI_COLOUR_FOR_UI.colour.b)
        end
        this:SetBackdropBorderColor(MODUI_COLOUR_FOR_UI.colour.r, MODUI_COLOUR_FOR_UI.colour.g, MODUI_COLOUR_FOR_UI.colour.b)
    end

    f:RegisterEvent'VARIABLES_LOADED' f:RegisterEvent'ADDON_LOADED'
    f:SetScript('OnEvent', function()
        if not MODUI_COLOUR_FOR_UI.colour then
            MODUI_COLOUR_FOR_UI.colour = MODUI_UICOLOR_DEFAULT
        end
        if not MODUI_PREVCOLOUR_FOR_UI.colour then
            MODUI_PREVCOLOUR_FOR_UI.colour = MODUI_UICOLOR_DEFAULT
        end
        for _, v in pairs(MODUI_COLOURELEMENTS_FOR_UI) do
            v:SetVertexColor(MODUI_COLOUR_FOR_UI.colour.r,
                             MODUI_COLOUR_FOR_UI.colour.g,
                             MODUI_COLOUR_FOR_UI.colour.b)
        end
        for _, v in pairs(MODUI_COLOURELEMENTS_BORDER_FOR_UI) do
            v:SetBackdropBorderColor(MODUI_COLOUR_FOR_UI.colour.r,
                                     MODUI_COLOUR_FOR_UI.colour.g,
                                     MODUI_COLOUR_FOR_UI.colour.b)
        end
    end)

    -- menu.colour:Disable()

    --
