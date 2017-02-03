

    local _, class = UnitClass'player'
    local colour   = RAID_CLASS_COLORS[class]
    local menu     = _G['modui_options']
    local sb = [[Interface\AddOns\modui\statusbar\texture\sb.tga]]
    local bg = {bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],}
    local db

    local highlight = function()
        if modSkinned(this) then
            for _, v in pairs({modui_optionsactionbar, modui_display, modui_status, modui_elements, modui_colour, modui_optionsmodraid}) do modSkinColor(v, .2, .2, .2) end
            modSkinColor(this, 1, .8, 0)
        end
    end

    local AddDescriptionPadding = function()
        local x = _G['modui_vars'].db['modRaidX']
        if x >= 80 then
            menu.modraid.frametext:SetWidth(110 - (x/5))
        else
            menu.modraid.frametext:SetWidth(100)
        end
    end

    local PLAYER_LOGIN = function()
        local db = _G['modui_vars'].db
        menu.modraid.frame:SetWidth(db['modRaidX'] and db['modRaidX'] or 53)
        menu.modraid.frame:SetHeight(db['modRaidY'] and db['modRaidY'] or 24)
        AddDescriptionPadding()
    end

    local UpdateSize = function()
        for i = 1, 40 do
            local bu = _G['modraid'..i]
            local db = _G['modui_vars'].db
            if 	bu then
                local x, y = this:GetParent():GetWidth(), this:GetParent():GetHeight()
                bu:SetWidth(x)
                bu:SetHeight(y)
                db['modRaidX'], db['modRaidY'] = x, y	-- save as cvar
            end
        end
    end

    menu.modraid = CreateFrame('Button', 'modui_optionsmodraid', menu, 'UIPanelButtonTemplate')
    menu.modraid:SetWidth(100) menu.modraid:SetHeight(20)
    menu.modraid:SetText'Raid Frames'
    menu.modraid:SetFont(STANDARD_TEXT_FONT, 10)
    menu.modraid:SetPoint('LEFT', menu.actionbar, 'RIGHT', 3, 0)

    menu.modraid.text = menu.modraid:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.modraid.text:SetPoint('TOP', menu, 0, -95)
    menu.modraid.text:SetWidth(250)
    menu.modraid.text:SetText'Click the |cff2cfa44+|r that appears under the Minimap in a Raid to show your group frames.'
    menu.modraid.text:Hide()

    menu.modraid.frame = CreateFrame('Frame', 'modui_optionsraidframe', menu)
    menu.modraid.frame:SetResizable(true)
    menu.modraid.frame:SetMinResize(40, 20)
    menu.modraid.frame:SetMaxResize(110, 80)
    menu.modraid.frame:SetBackdrop(bg)
    menu.modraid.frame:SetBackdropColor(0, 0, 0, 1)
    menu.modraid.frame:SetPoint('TOP', menu, 0, -170)
    menu.modraid.frame:Hide()

    menu.modraid.frame.hp = CreateFrame('StatusBar', nil, menu.modraid.frame)
    menu.modraid.frame.hp:SetMinMaxValues(0, 100)
    menu.modraid.frame.hp:SetValue(100)
    menu.modraid.frame.hp:SetStatusBarTexture(sb)
    menu.modraid.frame.hp:SetStatusBarColor(colour.r, colour.g, colour.b)
    menu.modraid.frame.hp:SetPoint('TOPLEFT', menu.modraid.frame, 1, -1)
    menu.modraid.frame.hp:SetPoint('BOTTOMRIGHT', menu.modraid.frame, -1, 8)

    menu.modraid.frame.mana = CreateFrame('StatusBar', nil, menu.modraid.frame)
    menu.modraid.frame.mana:SetHeight(7)
    menu.modraid.frame.mana:SetMinMaxValues(0, 100)
    menu.modraid.frame.mana:SetValue(100)
    menu.modraid.frame.mana:SetStatusBarTexture(sb)
    menu.modraid.frame.mana:SetStatusBarColor(ManaBarColor[0].r, ManaBarColor[0].g, ManaBarColor[0].b)
    menu.modraid.frame.mana:SetPoint('TOPLEFT', menu.modraid.frame.hp, 'BOTTOMLEFT', 0, -1)
    menu.modraid.frame.mana:SetPoint('TOPRIGHT', menu.modraid.frame.hp, 'BOTTOMRIGHT', 0, -1)

    menu.modraid.frame.name = menu.modraid.frame.hp:CreateFontString(nil, 'OVERLAY', 'GameFontNormalSmall')
    menu.modraid.frame.name:SetPoint('TOP', menu.modraid.frame.hp, 0, -3)
    menu.modraid.frame.name:SetJustifyH'CENTER'
    menu.modraid.frame.name:SetText(UnitName'player')
    menu.modraid.frame.name:SetTextColor(colour.r, colour.g, colour.b)

    menu.modraid.frametext = menu.modraid:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.modraid.frametext:SetPoint('TOPLEFT', menu, 25, -160)
    menu.modraid.frametext:SetWidth(110)
    menu.modraid.frametext:SetJustifyH'RIGHT'
    menu.modraid.frametext:SetText'Drag The Bottom-Right Corner of this Frame to Resize Raid Units.'
    menu.modraid.frametext:Hide()

    menu.modraid.frame.sizer = CreateFrame('Button', nil, menu.modraid.frame.hp)
    menu.modraid.frame.sizer:SetWidth(16)
    menu.modraid.frame.sizer:SetHeight(16)
    menu.modraid.frame.sizer:SetPoint('BOTTOMRIGHT', menu.modraid.frame, -1, 1)
    menu.modraid.frame.sizer:SetNormalTexture[[Interface\Addons\modui\raid\sizer.tga]]
    menu.modraid.frame.sizer:SetPushedTexture''
    menu.modraid.frame.sizer:SetHighlightTexture''
    menu.modraid.frame.sizer:RegisterForClicks'AnyUp'

    menu.modraid.frame.sizer:SetScript('OnMouseDown', function(self)
        this:SetButtonState('PUSHED', true)
        this:GetHighlightTexture():Hide()
        menu.modraid.frame:StartSizing'BOTTOMRIGHT'
        this:SetScript('OnUpdate', UpdateSize)
    end)
    menu.modraid.frame.sizer:SetScript('OnMouseUp', function(self)
        this:SetButtonState('NORMAL', false)
        this:GetHighlightTexture():Show()
        this:SetScript('OnUpdate', nil)

        menu.modraid.frame:StopMovingOrSizing()
        menu.modraid.frame:ClearAllPoints()
        menu.modraid.frame:SetPoint('TOP', menu, 0, -170)

        AddDescriptionPadding()
    end)

    menu.modraid:SetScript('OnClick', function()
        highlight()
        for _, v in pairs({modui_optionsactionlayout, menu.intro, menu.uilink, menu.description, menu.whisper, menu.gryphon, menu.endcap, menu.chatstamp, menu.chatformat, menu.chateditbox, menu.itemlink, menu.auraformat, menu.targetaura, menu.tooltip, menu.tooltip.cursor, menu.castbar, menu.castbar.target, menu.horizontal, menu.value, menu.consolidate, menu.white, menu.ctDMG, menu.ctHEAL, menu.elements.title, menu.elements.description, menu.elementcontainer, menu.allelement, menu.actionlayout, menu.keydown, menu.keydown.selfcast}) do v:Hide() end
        for i = 1,  2 do _G['modui_optionsaurabutton'..i]:Hide() end
        for i = 1, 12 do _G['modui_element'..i]:Hide() end
        for i = 1, 60 do _G['modui_actionbutton'..i]:Hide() end
        for _, v in pairs({menu.modraid.text, menu.modraid.frame, menu.modraid.frametext}) do
            v:Show()
        end
        menu.reload:SetPoint('TOP', menu, 0, -295)
        if menu.reload:IsShown() then menu:SetHeight(340) else menu:SetHeight(280) end
    end)

    local e = CreateFrame'Frame'
    e:RegisterEvent'PLAYER_LOGIN'
    e:SetScript('OnEvent', PLAYER_LOGIN)

    --
