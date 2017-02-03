

    local _, class = UnitClass'player'
    local colour   = RAID_CLASS_COLORS[class]
    local menu     = _G['modui_options']
    local orig     = {}

    RegisterCVar('modGryphon',              1, true)
    RegisterCVar('modEndcap',               1, true)
    RegisterCVar('modTimestamp',            0, true)
    RegisterCVar('modChatFormat',           1, true)
    RegisterCVar('modItemLink',             1, true)
    RegisterCVar('modAuraFormat',           0, true)
    RegisterCVar('modShowTooltipCursor',    0, true)
    RegisterCVar('modPlayerCastbar',        0, true)

    orig.SetPoint       = CastingBarFrame.SetPoint
    orig.ClearAllPoints = CastingBarFrame.ClearAllPoints

    local highlight = function()
        if modSkinned(this) then
            for _, v in pairs({modui_optionsactionbar, modui_display, modui_status, modui_elements, modui_colour, modui_optionsmodraid}) do modSkinColor(v, .2, .2, .2) end
            modSkinColor(this, 1, .8, 0)
        end
    end

    local reload = function()
        if not menu.reload:IsShown() then
            menu.reload:Show()
            menu:SetHeight(menu:GetHeight() + 50)
        end
    end

    local gryphon = function()
        if this:GetValue() == 1 then
            SetCVar('modGryphon', 1)
            for _, v in pairs({MainMenuBarLeftEndCap, MainMenuBarRightEndCap}) do
                v:SetTexture[[Interface\MainMenuBar\UI-MainMenuBar-EndCap-Human]]
            end
        else
            SetCVar('modGryphon', 0)
            for _, v in pairs({MainMenuBarLeftEndCap, MainMenuBarRightEndCap}) do
                v:SetTexture[[Interface\MainMenuBar\UI-MainMenuBar-EndCap-Dwarf]]
            end
        end
    end

    local auraformat = function()
        if this:GetValue() == 1 then SetCVar('modAuraFormat', 1, true) else SetCVar('modAuraFormat', 0, true) end
    end

    local timer = function(t, i)
        local time  = GetTime()
        local count = math.floor((t + i) - time)
        local mins  = floor(mod(count, 3600)/60 + 1)
        local f  = _G['modui_optionsaurabutton2text']
        if count <= 0 then count = 0 end
        _G['modui_optionsaurabutton1text']:SetText('|cffffffff'..mins..'|rm')
        _G['modui_optionsaurabutton2text']:SetText(SecondsToTimeAbbrev(count, true))
    end

    local aura = function()
        if not this:IsShown() then this:SetScript('OnUpdate', nil) return end
        local t = GetTime()
        local i = 1800
        this:SetScript('OnUpdate', function() timer(t, i) end)
    end

    menu.gryphon = CreateFrame('Slider', 'modui_gryphon', menu, 'OptionsSliderTemplate')
    menu.gryphon:SetWidth(200) menu.gryphon:SetHeight(20)
    menu.gryphon:SetPoint('TOP', menu, 0, -115)
    menu.gryphon:SetMinMaxValues(0, 1)
    menu.gryphon:SetValue(0)
    menu.gryphon:SetValueStep(1)
    menu.gryphon:SetScript('OnValueChanged', gryphon)
    menu.gryphon:Hide()
    _G[menu.gryphon:GetName()..'Low']:SetText'Gryphon'
    _G[menu.gryphon:GetName()..'High']:SetText'Lion'
    _G[menu.gryphon:GetName()..'Text']:SetText'Switch End Cap Textures'

    menu.gryphon.title = menu.gryphon:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.gryphon.title:SetTextColor(colour.r, colour.g, colour.b)
    menu.gryphon.title:SetPoint('TOPLEFT', menu, 30, -85)
    menu.gryphon.title:SetText'—MainBar Gryphon Options'

    menu.endcap = CreateFrame('CheckButton', 'modui_endcap', menu, 'UICheckButtonTemplate')
    menu.endcap:SetHeight(20) menu.endcap:SetWidth(20)
    menu.endcap:SetPoint('TOPLEFT', menu, 25, -145)
    menu.endcap:Hide()
    _G[menu.endcap:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.endcap:GetName()..'Text']:SetWidth(270)
    _G[menu.endcap:GetName()..'Text']:SetPoint('LEFT', menu.endcap, 'RIGHT', 4, 0)
    _G[menu.endcap:GetName()..'Text']:SetText'Toggle Display of MainMenu End Cap Textures'

    menu.chatstamp = CreateFrame('CheckButton', 'modui_chatstamp', menu, 'UICheckButtonTemplate')
    menu.chatstamp:SetHeight(20) menu.chatstamp:SetWidth(20)
    menu.chatstamp:SetPoint('TOPLEFT', menu, 25, -185)
    menu.chatstamp:Hide()
    _G[menu.chatstamp:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.chatstamp:GetName()..'Text']:SetWidth(270)
    _G[menu.chatstamp:GetName()..'Text']:SetPoint('LEFT', menu.chatstamp, 'RIGHT', 4, 0)
    _G[menu.chatstamp:GetName()..'Text']:SetText'Toggle Timestamps on Chat Messages'

    menu.chatstamp.title = menu.chatstamp:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.chatstamp.title:SetTextColor(colour.r, colour.g, colour.b)
    menu.chatstamp.title:SetPoint('TOPLEFT', menu, 30, -170)
    menu.chatstamp.title:SetText'—Chat Messages'

    menu.chatformat = CreateFrame('CheckButton', 'modui_chatformat', menu, 'UICheckButtonTemplate')
    menu.chatformat:SetHeight(20) menu.chatformat:SetWidth(20)
    menu.chatformat:SetPoint('TOPLEFT', menu, 25, -205)
    menu.chatformat:Hide()
    _G[menu.chatformat:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.chatformat:GetName()..'Text']:SetWidth(270)
    _G[menu.chatformat:GetName()..'Text']:SetPoint('LEFT', menu.chatformat, 'RIGHT', 4, 0)
    _G[menu.chatformat:GetName()..'Text']:SetText'Toggle Custom Chat Channel Formatting.'

    menu.itemlink = CreateFrame('CheckButton', 'modui_itemlink', menu, 'UICheckButtonTemplate')
    menu.itemlink:SetHeight(20) menu.itemlink:SetWidth(20)
    menu.itemlink:SetPoint('TOPLEFT', menu, 25, -225)
    menu.itemlink:Hide()
    _G[menu.itemlink:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.itemlink:GetName()..'Text']:SetWidth(270)
    _G[menu.itemlink:GetName()..'Text']:SetPoint('LEFT', menu.itemlink, 'RIGHT', 4, 0)
    _G[menu.itemlink:GetName()..'Text']:SetText'Toggle |cffc600ff[Brackets]|r on Item Links.'

    menu.chateditbox = CreateFrame('CheckButton', 'modui_chateditbox', menu, 'UICheckButtonTemplate')
    menu.chateditbox:SetHeight(20) menu.chateditbox:SetWidth(20)
    menu.chateditbox:SetPoint('TOPLEFT', menu, 25, -245)
    menu.chateditbox:Hide()
    _G[menu.chateditbox:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.chateditbox:GetName()..'Text']:SetWidth(270)
    _G[menu.chateditbox:GetName()..'Text']:SetPoint('LEFT', menu.chateditbox, 'RIGHT', 4, 0)
    _G[menu.chateditbox:GetName()..'Text']:SetText'Position Edit Box Above Chat Frame.'

    menu.auraformat = CreateFrame('Slider', 'modui_optionsauraformat', menu, 'OptionsSliderTemplate')
    menu.auraformat:SetWidth(200) menu.auraformat:SetHeight(20)
    menu.auraformat:SetPoint('TOP', menu, 0, -295)
    menu.auraformat:SetMinMaxValues(0, 1)
    menu.auraformat:SetValue(0)
    menu.auraformat:SetValueStep(1)
    menu.auraformat:SetScript('OnValueChanged', auraformat)
    menu.auraformat:Hide()
    _G[menu.auraformat:GetName()..'Low']:SetText'Round Numbers'
    _G[menu.auraformat:GetName()..'High']:SetText'H:M:S'
    _G[menu.auraformat:GetName()..'Text']:SetText'Aura Duration Formatting'

    menu.auraformat.title = menu.auraformat:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.auraformat.title:SetTextColor(colour.r, colour.g, colour.b)
    menu.auraformat.title:SetPoint('TOPLEFT', menu, 30, -270)
    menu.auraformat.title:SetText'—Auras'

    for i = 1, 2 do
        menu.aurabutton = CreateFrame('CheckButton', 'modui_optionsaurabutton'..i, menu)
        menu.aurabutton:SetHeight(28) menu.aurabutton:SetWidth(28)
        menu.aurabutton:SetPoint(i == 1 and 'TOPRIGHT' or 'TOPLEFT',
                                 i == 1 and _G[menu.auraformat:GetName()..'Low'] or _G[menu.auraformat:GetName()..'High'],
                                 i == 1 and 'BOTTOMLEFT' or 'BOTTOMRIGHT',
                                 i == 1 and -15 or 15,
                                 15)
        menu.aurabutton:Hide()

        menu.aurabutton.icon = menu.aurabutton:CreateTexture(nil, 'ARTWORK')
        menu.aurabutton.icon:SetAllPoints()
        menu.aurabutton.icon:SetTexture[[Interface\Icons\Spell_holy_magicalsentry]]
        menu.aurabutton.icon:SetTexCoord(.1, .9, .1, .9)

        menu.aurabutton.duration = menu.aurabutton:CreateFontString('modui_optionsaurabutton'..i..'text', 'OVERLAY', 'GameFontNormalSmall')
        menu.aurabutton.duration:SetPoint('TOP', menu.aurabutton, 'BOTTOM', 2, -6)
        menu.aurabutton.duration:SetText'|cffffffff30|rm'
    end

    menu.targetaura = CreateFrame('CheckButton', 'modui_targetauraorientation', menu, 'UICheckButtonTemplate')
    menu.targetaura:SetHeight(20) menu.targetaura:SetWidth(20)
    menu.targetaura:SetPoint('TOPLEFT', menu, 25, -355)
    menu.targetaura:Hide()
    _G[menu.targetaura:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.targetaura:GetName()..'Text']:SetWidth(270)
    _G[menu.targetaura:GetName()..'Text']:SetPoint('LEFT', menu.targetaura, 'RIGHT', 4, 0)
    _G[menu.targetaura:GetName()..'Text']:SetText'Target Auras Above Frame'

    menu.tooltip = CreateFrame('CheckButton', 'modui_tooltip', menu, 'UICheckButtonTemplate')
    menu.tooltip:SetHeight(20) menu.tooltip:SetWidth(20)
    menu.tooltip:SetPoint('TOPLEFT', menu, 25, -395)
    menu.tooltip:Hide()
    _G[menu.tooltip:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.tooltip:GetName()..'Text']:SetWidth(270)
    _G[menu.tooltip:GetName()..'Text']:SetPoint('LEFT', menu.tooltip, 'RIGHT', 4, 0)
    _G[menu.tooltip:GetName()..'Text']:SetText'Toggle Tooltip Mover Frame'

    menu.tooltip.cursor = CreateFrame('CheckButton', 'modui_tooltipcursor', menu, 'UICheckButtonTemplate')
    menu.tooltip.cursor:SetHeight(20) menu.tooltip.cursor:SetWidth(20)
    menu.tooltip.cursor:SetPoint('TOPLEFT', menu, 25, -415)
    menu.tooltip.cursor:Hide()
    _G[menu.tooltip.cursor:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.tooltip.cursor:GetName()..'Text']:SetWidth(270)
    _G[menu.tooltip.cursor:GetName()..'Text']:SetPoint('LEFT', menu.tooltip.cursor, 'RIGHT', 4, 0)
    _G[menu.tooltip.cursor:GetName()..'Text']:SetText'Attach Tooltip To Cursor'

    menu.tooltip.title = menu.tooltip:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.tooltip.title:SetTextColor(colour.r, colour.g, colour.b)
    menu.tooltip.title:SetPoint('TOPLEFT', menu, 30, -380)
    menu.tooltip.title:SetText'—Tooltip'

    menu.castbar = CreateFrame('CheckButton', 'modui_castbar', menu, 'UICheckButtonTemplate')
    menu.castbar:SetHeight(20) menu.castbar:SetWidth(20)
    menu.castbar:SetPoint('TOPLEFT', menu, 25, -455)
    menu.castbar:Hide()
    _G[menu.castbar:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.castbar:GetName()..'Text']:SetWidth(270)
    _G[menu.castbar:GetName()..'Text']:SetPoint('LEFT', menu.castbar, 'RIGHT', 4, 0)
    _G[menu.castbar:GetName()..'Text']:SetText'Show Castbar Under PlayerFrame'

    menu.castbar.target = CreateFrame('CheckButton', 'modui_castbarTarget', menu, 'UICheckButtonTemplate')
    menu.castbar.target:SetHeight(20) menu.castbar.target:SetWidth(20)
    menu.castbar.target:SetPoint('TOPLEFT', menu, 25, -475)
    menu.castbar.target:Hide()
    _G[menu.castbar.target:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.castbar.target:GetName()..'Text']:SetWidth(270)
    _G[menu.castbar.target:GetName()..'Text']:SetPoint('LEFT', menu.castbar.target, 'RIGHT', 4, 0)
    _G[menu.castbar.target:GetName()..'Text']:SetText'Toggle Target Castbar Mover Frame'

    menu.castbar.title = menu.castbar:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.castbar.title:SetTextColor(colour.r, colour.g, colour.b)
    menu.castbar.title:SetPoint('TOPLEFT', menu, 30, -440)
    menu.castbar.title:SetText'—Castbar'

    menu.display = CreateFrame('Button', 'modui_display', menu, 'UIPanelButtonTemplate')
    menu.display:SetWidth(100) menu.display:SetHeight(20)
    menu.display:SetText'Display'
    menu.display:SetFont(STANDARD_TEXT_FONT, 10)
    menu.display:SetPoint('TOPLEFT', menu, 25, -30)

    menu.display:SetScript('OnClick', function()
        highlight()
        for _, v in pairs({menu.intro, menu.uilink, menu.description, menu.whisper, menu.horizontal, menu.value, menu.consolidate, menu.white, menu.ctDMG, menu.ctHEAL, menu.elements.title, menu.elements.description, menu.elementcontainer, menu.allelement, menu.actionlayout, menu.keydown, menu.keydown.selfcast, menu.modraid.apology, menu.modraid.text, menu.modraid.frame, menu.modraid.frametext}) do v:Hide() end
        for i = 1, 12 do _G['modui_element'..i]:Hide() end
        for i = 1, 60 do _G['modui_actionbutton'..i]:Hide() end
        for _, v in pairs({menu.gryphon, menu.endcap, menu.chatstamp, menu.chatformat, menu.chateditbox, menu.itemlink, menu.auraformat, menu.tooltip, menu.tooltip.cursor, menu.castbar, menu.castbar.target, menu.targetaura}) do v:Show() end
        for i = 1,  2 do _G['modui_optionsaurabutton'..i]:Show() end
        menu.reload:SetPoint('TOP', menu, 0, -540)
        if menu.reload:IsShown() then
            menu:SetHeight(590)
        else
            menu:SetHeight(520)
        end
    end)

    menu.gryphon:SetScript('OnValueChanged', gryphon)

    menu.endcap:SetScript('OnClick', function()
        if this:GetChecked() == 1 then
            SetCVar('modEndcap', 1)
            OptionsFrame_EnableSlider(menu.gryphon)
            for _, v in pairs({MainMenuBarLeftEndCap, MainMenuBarRightEndCap}) do v:Show() end
        else
            SetCVar('modEndcap', 0)
            OptionsFrame_DisableSlider(menu.gryphon)
            for _, v in pairs({MainMenuBarLeftEndCap, MainMenuBarRightEndCap}) do v:Hide() end
         end
    end)

    menu.chatstamp:SetScript('OnClick', function()
        if this:GetChecked() == 1 then SetCVar('modTimestamp', 1) else SetCVar('modTimestamp', 0) end
    end)

    menu.chatformat:SetScript('OnClick', function()
        if this:GetChecked() == 1 then SetCVar('modChatFormat', 1) reload() else SetCVar('modChatFormat', 0) reload() end
    end)

    menu.chateditbox:SetScript('OnClick', function()
        ChatFrameEditBox:ClearAllPoints()
        if  this:GetChecked() == 1 then
            _G['modui_vars'].db['modEditBoxOrientation'] = 1
            MODUI_VARS['modEditBoxOrientation'] = 1
            ChatFrameEditBox:SetPoint('BOTTOMLEFT', ChatFrame1, 'TOPLEFT', -2, 18)
            ChatFrameEditBox:SetPoint('BOTTOMRIGHT', ChatFrame1, 'TOPRIGHT',  2, 18)
        else
            _G['modui_vars'].db['modEditBoxOrientation'] = 0
            MODUI_VARS['modEditBoxOrientation'] = 0
            ChatFrameEditBox:SetPoint('TOPLEFT', ChatFrame1, 'BOTTOMLEFT', -2, -18)
            ChatFrameEditBox:SetPoint('TOPRIGHT', ChatFrame1, 'BOTTOMRIGHT',  2, -18)
        end
    end)

    menu.itemlink:SetScript('OnClick', function()
        if this:GetChecked() == 1 then SetCVar('modItemLink', 1) else SetCVar('modItemLink', 0) end
    end)

    menu.aurabutton:SetScript('OnShow', aura)
    menu.aurabutton:SetScript('OnHide', aura)

    menu.tooltip:SetScript('OnClick', function()
        local parent = _G['modTooltipParent']
        if  this:GetChecked() == 1 then
            parent:EnableMouse(true)
        	parent:SetBackdropColor(0, 1, 0, 1)
            parent:SetScript('OnDragStart', function() this:StartMoving() end)
            parent:SetScript('OnDragStop',  function() this:StopMovingOrSizing() end)
        else
            parent:EnableMouse(false)
        	parent:SetBackdropColor(0, 0, 0, 0)
            parent:SetScript('OnDragStart', nil)
            parent:SetScript('OnDragStop',  nil)
        end
    end)

    menu.tooltip.cursor:SetScript('OnClick', function()
        if  this:GetChecked() == 1 then
            OptionsFrame_DisableCheckBox(menu.tooltip)
            SetCVar('modShowTooltipCursor', 1)
        else
            OptionsFrame_EnableCheckBox(menu.tooltip)
            SetCVar('modShowTooltipCursor', 0)
        end
    end)

    menu.castbar:SetScript('OnClick', function()
        if  this:GetChecked() == 1 then
            SetCVar('modPlayerCastbar', 1)
            CastingBarFrame:ClearAllPoints()
            CastingBarFrame:SetPoint('LEFT', PlayerFrame, 75, 0)
            CastingBarFrame:SetPoint('RIGHT', PlayerFrame, -8, 0)
            CastingBarFrame:SetPoint('TOP', PlayerFrame, 'BOTTOM', 0, -2)
            CastingBarFrame.SetPoint = function() end
            CastingBarFrame.ClearAllPoints = function() end
            CastingBarFrame:SetWidth(142)
            CastingBarFrame:SetHeight(8)

            CastingBarBorder:Hide()

            CastingBarSpark:SetTexture''
            CastingBarFlash:SetTexture''

            CastingBarText:ClearAllPoints()
            CastingBarText:SetPoint('TOPLEFT', CastingBarFrame, 'BOTTOMLEFT', 2, -5)
            CastingBarText:SetJustifyH'LEFT'

            CastingBarFrame.Icon:SetPoint('RIGHT', CastingBarFrame, 'LEFT', -10, 1)
            modSkinShow(CastingBarFrame)
        else
            SetCVar('modPlayerCastbar', 0)
            CastingBarFrame.SetPoint = orig.SetPoint
            CastingBarFrame.ClearAllPoints = orig.ClearAllPoints
            CastingBarFrame:ClearAllPoints()
            CastingBarFrame:SetPoint('BOTTOM', UIParent, 0, 180)
            CastingBarFrame:SetWidth(195)
            CastingBarFrame:SetHeight(13)

            CastingBarBorder:Show()

            CastingBarSpark:SetTexture[[Interface\CastingBar\UI-CastingBar-Spark]]
            CastingBarFlash:SetTexture[[Interface\CastingBar\UI-CastingBar-Flash]]

            CastingBarText:ClearAllPoints()
            CastingBarText:SetPoint('TOP', 0, 5)
            CastingBarText:SetJustifyH'CENTER'

            CastingBarFrame.Icon:SetPoint('RIGHT', CastingBarFrame, 'LEFT', -10, 2.5)
            modSkinHide(CastingBarFrame)
        end
    end)

    menu.castbar.target:SetScript('OnClick', function()
        local parent = _G['modCastbarParent']
        if  this:GetChecked() == 1 then
            parent:EnableMouse(true)
        	parent:SetBackdropColor(0, 1, 0, 1)
            parent:SetScript('OnDragStart', function() this:StartMoving() end)
            parent:SetScript('OnDragStop',  function() this:StopMovingOrSizing() end)
            TargetFrame.cast:Show()
            TargetFrame.cast:SetValue(1)
            TargetFrame.cast.text:SetText'Frostbolt'
            TargetFrame.cast.timer:SetText'2.5s'
            TargetFrame.cast.icon:SetTexture[[Interface\ICONS\spell_frost_frostbolt02]]
        else
            parent:EnableMouse(false)
        	parent:SetBackdropColor(0, 0, 0, 0)
            parent:SetScript('OnDragStart', nil)
            parent:SetScript('OnDragStop',  nil)
        end
    end)

    menu.targetaura:SetScript('OnClick', function()
        if  _G['modui_vars'].db['modAuraOrientation'] == 0 then
            _G['modui_vars'].db['modAuraOrientation'] = 1
            MODUI_VARS['modAuraOrientation'] = 1
            TargetDebuffButton_Update()
        else
            _G['modui_vars'].db['modAuraOrientation'] = 0
            MODUI_VARS['modAuraOrientation'] = 0
            TargetDebuffButton_Update()
        end
    end)

    local f = CreateFrame'Frame'
    f:RegisterEvent'PLAYER_ENTERING_WORLD'
    f:SetScript('OnEvent', function()
        local cv = tonumber(GetCVar'modGryphon')
        if cv == 1 then
            menu.gryphon:SetValue(1)
            for _, v in pairs({MainMenuBarLeftEndCap, MainMenuBarRightEndCap}) do
                v:SetTexture[[Interface\MainMenuBar\UI-MainMenuBar-EndCap-Human]]
            end
        else
            menu.gryphon:SetValue(0)
            for _, v in pairs({MainMenuBarLeftEndCap, MainMenuBarRightEndCap}) do
                v:SetTexture[[Interface\MainMenuBar\UI-MainMenuBar-EndCap-Dwarf]]
            end
        end
        local cv = tonumber(GetCVar'modEndcap')
        if cv == 1 then
            menu.endcap:SetChecked(true)
            OptionsFrame_EnableSlider(menu.gryphon)
            for _, v in pairs({MainMenuBarLeftEndCap, MainMenuBarRightEndCap}) do v:Show() end
        else
            menu.endcap:SetChecked(false)
            OptionsFrame_DisableSlider(menu.gryphon)
            for _, v in pairs({MainMenuBarLeftEndCap, MainMenuBarRightEndCap}) do v:Hide() end
        end
        local cv = tonumber(GetCVar'modTimestamp')
        if cv == 1 then menu.chatstamp:SetChecked(true) else menu.chatstamp:SetChecked(false) end
        local cv = tonumber(GetCVar'modChatFormat')
        if cv == 1 then menu.chatformat:SetChecked(true) else menu.chatstamp:SetChecked(false) end
        local cv = tonumber(GetCVar'modItemLink')
        if cv == 1 then menu.itemlink:SetChecked(true) else menu.itemlink:SetChecked(false) end
        local cv = tonumber(GetCVar'modAuraFormat')
        if cv == 1 then menu.auraformat:SetValue(1) else menu.auraformat:SetValue(0) end
        menu.tooltip:SetChecked(false)
        local cv = tonumber(GetCVar'modShowTooltipCursor')
        if cv == 1 then
            menu.tooltip.cursor:SetChecked(true)
            OptionsFrame_DisableCheckBox(menu.tooltip)
        else
            menu.tooltip.cursor:SetChecked(false)
        end
        local cv = tonumber(GetCVar'modPlayerCastbar')
        if cv == 1 then menu.castbar:SetChecked(true) else menu.castbar:SetChecked(false) end
        menu.castbar.target:SetChecked(false)
        local cv = _G['modui_vars'].db['modAuraOrientation']
        if  cv == 1 then menu.targetaura:SetChecked(true) else menu.targetaura:SetChecked(false) end
    end)

    --
