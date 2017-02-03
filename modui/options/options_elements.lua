

    -- DISPLAY
    --  timestamps
    --  gryphons
    --

    local _, class = UnitClass'player'
    local colour = RAID_CLASS_COLORS[class]
    local menu = _G['modui_options']

    RegisterCVar('modOneBag',      1, true)
    RegisterCVar('modBattleMap',   1, true)
    RegisterCVar('modWorldMap',    1, true)
    RegisterCVar('modDungeonMap',  1, true)
    RegisterCVar('modNameplate',   1, true)
    RegisterCVar('modQuestWatch',  1, true)
    RegisterCVar('modTooltip',     1, true)
    RegisterCVar('modUnitFrame',   1, true)
    RegisterCVar('modPVPTimers',   1, true)
    RegisterCVar('modPVPRank',     1, true)
    RegisterCVar('modStopWatch',   1, true)
    RegisterCVar('modAllElements', 1, true)

    local check = function(load)
        local cv, t
        cv = tonumber(GetCVar'modOneBag')       t = _G['modui_element1']
        if cv == 1 then t:SetChecked(true) else t:SetChecked(false) end
        cv = tonumber(GetCVar'modBattleMap')    t = _G['modui_element2']
        if cv == 1 then t:SetChecked(true) else t:SetChecked(false) end
        cv = tonumber(GetCVar'modWorldMap')     t = _G['modui_element3']
        if cv == 1 then t:SetChecked(true) else t:SetChecked(false) end
        cv = tonumber(GetCVar'modDungeonMap')   t = _G['modui_element4']
        if cv == 1 then t:SetChecked(true) else t:SetChecked(false) end
        cv = tonumber(GetCVar'modNameplate')    t = _G['modui_element5']
        if cv == 1 then t:SetChecked(true) else t:SetChecked(false) end
        cv = tonumber(GetCVar'modQuestWatch')   t = _G['modui_element6']
        if cv == 1 then t:SetChecked(true) else t:SetChecked(false) end
        cv = tonumber(GetCVar'modTooltip')      t = _G['modui_element7']
        if cv == 1 then t:SetChecked(true) else t:SetChecked(false) end
        cv = tonumber(GetCVar'modUnitFrame')    t = _G['modui_element8']
        if cv == 1 then t:SetChecked(true) else t:SetChecked(false) end
        cv = tonumber(GetCVar'modPVPTimers')    t = _G['modui_element9']
        if cv == 1 then t:SetChecked(true) else t:SetChecked(false) end
        cv = tonumber(GetCVar'modPVPRank')      t = _G['modui_element10']
        if cv == 1 then t:SetChecked(true) else t:SetChecked(false) end
        cv = tonumber(GetCVar'modStopWatch')    t = _G['modui_element11']
        if cv == 1 then t:SetChecked(true) else t:SetChecked(false) end
        cv = _G['modui_vars'].db['modCDCount']  t = _G['modui_element12']
        if cv == 1 then t:SetChecked(true) else t:SetChecked(false) end
        if load then
            cv = tonumber(GetCVar'modAllElements')
            if cv == 1 then menu.allelement:SetChecked(true) else menu.allelement:SetChecked(false) end
        end
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

    menu.elementcontainer = CreateFrame('Frame', 'modui_elementscontainer', menu)
    menu.elementcontainer:SetWidth(275) menu.elementcontainer:SetHeight(120)
    menu.elementcontainer:SetPoint('TOP', menu, 0, -140)
    menu.elementcontainer:Hide()

    menu.elementscrollframe = CreateFrame('ScrollFrame', 'modui_elementscrollframe', menu.elementcontainer, 'UIPanelScrollFrameTemplate')
	menu.elementscrollframe:SetFrameLevel(3)
	menu.elementscrollframe:SetPoint('TOPLEFT', menu.elementcontainer, 7, -7)
	menu.elementscrollframe:SetPoint('BOTTOMRIGHT', menu.elementcontainer, -35, 7)
    menu.elementscrollframe:Raise()
    menu.elementscrollframe:SetToplevel()

    menu.inner = CreateFrame('Frame', nil, menu.elementscrollframe)
	menu.inner:SetWidth(250) menu.inner:SetHeight(230)
	menu.inner:EnableMouse(true)
	menu.inner:EnableMouseWheel(true)

    for i = 1, 12 do
        menu.element = CreateFrame('CheckButton', 'modui_element'..i, menu.inner, 'UICheckButtonTemplate')
        menu.element:SetHeight(20) menu.element:SetWidth(20)
        menu.element:SetPoint('TOPLEFT',
                              i == 1 and menu.inner or _G['modui_element'..(i - 1)],
                              i == 1 and 'TOPLEFT' or 'BOTTOMLEFT',
                              i == 1 and 5 or 0,
                              i == 1 and -5 or 0)
        menu.element:Hide()
        _G[menu.element:GetName()..'Text']:SetJustifyH'LEFT'
        _G[menu.element:GetName()..'Text']:SetWidth(270)
        _G[menu.element:GetName()..'Text']:SetPoint('LEFT', menu.element, 'RIGHT', 4, 0)
    end

    menu.allelement = CreateFrame('CheckButton', 'modui_allelement', menu, 'UICheckButtonTemplate')
    menu.allelement:SetHeight(24) menu.allelement:SetWidth(24)
    menu.allelement:SetPoint('TOPLEFT', menu.elementcontainer, 'BOTTOMLEFT', 50, -10)
    menu.allelement:Hide()
    _G[menu.allelement:GetName()..'Text']:SetJustifyH'LEFT'
    _G[menu.allelement:GetName()..'Text']:SetWidth(270)
    _G[menu.allelement:GetName()..'Text']:SetPoint('LEFT', menu.allelement, 'RIGHT', 4, 0)
    _G[menu.allelement:GetName()..'Text']:SetText'Toggle All Elements On/Off'

    _G['modui_element1Text']:SetText'One Bag'
    _G['modui_element2Text']:SetText'Modified Map (Battleground)'
    _G['modui_element3Text']:SetText'Modified Map (World)'
    _G['modui_element4Text']:SetText'Maps for Dungeons'
    _G['modui_element5Text']:SetText'Modified Nameplates'
    _G['modui_element6Text']:SetText'Modified Objective Tracker'
    _G['modui_element7Text']:SetText'Modified Tooltip'
    _G['modui_element8Text']:SetText'Modified Unitframes'
    _G['modui_element9Text']:SetText'PvP Battleground Timers'
    _G['modui_element10Text']:SetText'PvP Rank Tracking'
    _G['modui_element11Text']:SetText'Stopwatch'
    _G['modui_element12Text']:SetText'Cooldown Count'

    menu.elementscrollframe.content = menu.inner
	menu.elementscrollframe:SetScrollChild(menu.inner)

    menu.elements = CreateFrame('Button', 'modui_elements', menu, 'UIPanelButtonTemplate')
    menu.elements:SetWidth(100) menu.elements:SetHeight(20)
    menu.elements:SetText'Elements'
    menu.elements:SetFont(STANDARD_TEXT_FONT, 10)
    menu.elements:SetPoint('LEFT', menu.status, 'RIGHT', 3, 0)

    menu.elements.title = menu.elements:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.elements.title:SetTextColor(colour.r, colour.g, colour.b)
    menu.elements.title:SetPoint('TOPLEFT', menu, 30, -85)
    menu.elements.title:SetText'—Elements'
    menu.elements.title:Hide()

    menu.elements.description = menu.elements:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    menu.elements.description:SetPoint('TOP', menu, 0, -105)
    menu.elements.description:SetWidth(200)
    menu.elements.description:SetText'Toggle individual components of modui on or off on demand.'
    menu.elements.description:Hide()

    menu.elements:SetScript('OnClick', function()
        highlight()
        for _, v in pairs({menu.intro, menu.uilink, menu.description, menu.whisper, menu.gryphon, menu.endcap, menu.chatstamp, menu.chatformat, menu.chateditbox, menu.itemlink, menu.auraformat, menu.targetaura, menu.tooltip, menu.tooltip.cursor, menu.castbar, menu.castbar.target, menu.horizontal, menu.value, menu.consolidate, menu.white, menu.ctDMG, menu.ctHEAL, menu.actionlayout, menu.keydown, menu.keydown.selfcast, menu.modraid.apology, menu.modraid.text, menu.modraid.frame, menu.modraid.frametext}) do v:Hide() end
        for i = 1, 60 do _G['modui_actionbutton'..i]:Hide() end
        menu.elements.title:Show()
        menu.elementcontainer:Show()
        menu.elements.description:Show()
        menu.allelement:Show()
        for i = 1,  2 do _G['modui_optionsaurabutton'..i]:Hide() end
        for i = 1, 12 do _G['modui_element'..i]:Show() end
        menu.reload:SetPoint('TOP', menu, 0, -340)
        if menu.reload:IsShown() then menu:SetHeight(385) else menu:SetHeight(315) end
    end)

    _G['modui_element1']:SetScript('OnClick', function()
        if this:GetChecked() == 1 then SetCVar('modOneBag', 1) reload() else SetCVar('modOneBag', 0) reload() end
    end)
    _G['modui_element2']:SetScript('OnClick', function()
        if this:GetChecked() == 1 then SetCVar('modBattleMap', 1) reload() else SetCVar('modBattleMap', 0) reload() end
    end)
    _G['modui_element3']:SetScript('OnClick', function()
        if this:GetChecked() == 1 then SetCVar('modWorldMap', 1) reload() else SetCVar('modWorldMap', 0) reload() end
    end)
    _G['modui_element4']:SetScript('OnClick', function()
        if this:GetChecked() == 1 then SetCVar('modDungeonMap', 1) else SetCVar('modDungeonMap', 0) end
    end)
    _G['modui_element5']:SetScript('OnClick', function()
        if this:GetChecked() == 1 then SetCVar('modNameplate', 1) else SetCVar('modNameplate', 0) end
    end)
    _G['modui_element6']:SetScript('OnClick', function()
        if this:GetChecked() == 1 then SetCVar('modQuestWatch', 1) reload() else SetCVar('modQuestWatch', 0) reload() end
    end)
    _G['modui_element7']:SetScript('OnClick', function()
        if this:GetChecked() == 1 then SetCVar('modTooltip', 1) reload() else SetCVar('modTooltip', 0) reload() end
    end)
    _G['modui_element8']:SetScript('OnClick', function()
        if this:GetChecked() == 1 then SetCVar('modUnitFrame', 1) reload() else SetCVar('modUnitFrame', 0) reload() end
    end)
    _G['modui_element9']:SetScript('OnClick', function()
        if this:GetChecked() == 1 then SetCVar('modPVPTimers', 1) reload() else SetCVar('modPVPTimers', 0) reload() end
    end)
    _G['modui_element10']:SetScript('OnClick', function()
        if this:GetChecked() == 1 then SetCVar('modPVPRank', 1) else SetCVar('modPVPRank', 0) end
    end)
    _G['modui_element11']:SetScript('OnClick', function()
        if this:GetChecked() == 1 then SetCVar('modStopWatch', 1) else SetCVar('modStopWatch', 0) end
    end)
    _G['modui_element12']:SetScript('OnClick', function()
        if this:GetChecked() == 1 then
            _G['modui_vars'].db['modCDCount'] = 1
        else
            _G['modui_vars'].db['modCDCount'] = 0
        end
    end)

    menu.allelement:SetScript('OnClick', function()
        if this:GetChecked() == 1 then
            SetCVar('modOneBag',     1) SetCVar('modBattleMap', 1) SetCVar('modWorldMap',      1)
            SetCVar('modDungeonMap', 1) SetCVar('modNameplate', 1) SetCVar('modQuestWatch',    1)
            SetCVar('modTooltip',    1) SetCVar('modUnitFrame', 1) SetCVar('modPVPTimers',     1)
            SetCVar('modPVPRank',    1) SetCVar('modStopWatch', 1)
            _G['modui_vars'].db['modCDCount'] = 1
            MODUI_VARS['modCDCount'] = 1
            SetCVar('modAllElements', 1)
            check(false) reload()
        else
            SetCVar('modOneBag',     0) SetCVar('modBattleMap', 0) SetCVar('modWorldMap',      0)
            SetCVar('modDungeonMap', 0) SetCVar('modNameplate', 0) SetCVar('modQuestWatch',    0)
            SetCVar('modTooltip',    0) SetCVar('modUnitFrame', 0) SetCVar('modPVPTimers',     0)
            SetCVar('modPVPRank',    0) SetCVar('modStopWatch', 0)
            _G['modui_vars'].db['modCDCount'] = 0
            MODUI_VARS['modCDCount'] = 0
            SetCVar('modAllElements', 0)
            check(false) reload()
        end
    end)


    local f = CreateFrame'Frame'
    f:RegisterEvent'PLAYER_ENTERING_WORLD'
    f:SetScript('OnEvent', function() check(true) end)

    --
