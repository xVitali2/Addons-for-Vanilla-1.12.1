local _G, _ = _G or getfenv()

-- todo tankmode messages to send if guid is target, for tankmode highlight
-- todo save TWT_SPEC per sender so it caches from other people's inspects

local __lower = string.lower
local __repeat = string.rep
local __strlen = string.len
local __find = string.find
local __substr = string.sub
local __parseint = tonumber
local __parsestring = tostring
local __getn = table.getn
local __tinsert = table.insert
local __tsort = table.sort
local __pairs = pairs
local __floor = math.floor
local __abs = abs
local __char = string.char

local TWT = CreateFrame("Frame")

TWT.addonVer = '1.2.3'

TWT.threatApi = 'TWTv4=';
TWT.tankModeApi = 'TMTv1=';
TWT.UDTS = 'TWT_UDTSv4';

TWT.showedUpdateNotification = false
TWT.addonName = '|cffabd473TW|cff11cc11 |cffcdfe00Threatmeter'

TWT.prefix = 'TWT'
TWT.channel = 'RAID'

TWT.name = UnitName('player')
local _, cl = UnitClass('player')
TWT.class = __lower(cl)

TWT.lastAggroWarningSoundTime = 0
TWT.lastAggroWarningGlowTime = 0

TWT.AGRO = '-Pull Aggro at-'
TWT.threatsFrames = {}

TWT.threats = {}

TWT.targetName = ''
TWT.relayTo = {}
TWT.shouldRelay = false
TWT.healerMasterTarget = ''

TWT.updateSpeed = 1

TWT.targetFrameVisible = false
TWT.PFUItargetFrameVisible = false

TWT.nameLimit = 30
TWT.windowStartWidth = 300
TWT.windowWidth = 300
TWT.minBars = 5
TWT.maxBars = 11

TWT.roles = {}
TWT.spec = {}

TWT.tankModeThreats = {}

TWT.custom = {
    ['The Prophet Skeram'] = 0
}

TWT.withAddon = 0
TWT.addonStatus = {}

TWT.classColors = {
    ["warrior"] = { r = 0.78, g = 0.61, b = 0.43, c = "|cffc79c6e" },
    ["mage"] = { r = 0.41, g = 0.8, b = 0.94, c = "|cff69ccf0" },
    ["rogue"] = { r = 1, g = 0.96, b = 0.41, c = "|cfffff569" },
    ["druid"] = { r = 1, g = 0.49, b = 0.04, c = "|cffff7d0a" },
    ["hunter"] = { r = 0.67, g = 0.83, b = 0.45, c = "|cffabd473" },
    ["shaman"] = { r = 0.14, g = 0.35, b = 1.0, c = "|cff0070de" },
    ["priest"] = { r = 1, g = 1, b = 1, c = "|cffffffff" },
    ["warlock"] = { r = 0.58, g = 0.51, b = 0.79, c = "|cff9482c9" },
    ["paladin"] = { r = 0.96, g = 0.55, b = 0.73, c = "|cfff58cba" },
    ["agro"] = { r = 0.96, g = 0.1, b = 0.1, c = "|cffff1111" }
}

TWT.classCoords = {
    ["priest"] = { 0.52, 0.73, 0.27, 0.48 },
    ["mage"] = { 0.23, 0.48, 0.02, 0.23 },
    ["warlock"] = { 0.77, 0.98, 0.27, 0.48 },
    ["rogue"] = { 0.48, 0.73, 0.02, 0.23 },
    ["druid"] = { 0.77, 0.98, 0.02, 0.23 },
    ["hunter"] = { 0.02, 0.23, 0.27, 0.48 },
    ["shaman"] = { 0.27, 0.48, 0.27, 0.48 },
    ["warrior"] = { 0.02, 0.23, 0.02, 0.23 },
    ["paladin"] = { 0.02, 0.23, 0.52, 0.73 },
}

TWT.fonts = {
    'BalooBhaina', 'BigNoodleTitling',
    'Expressway', 'Homespun', 'Hooge', 'LondrinaSolid',
    'Myriad-Pro', 'PT-Sans-Narrow-Bold', 'PT-Sans-Narrow-Regular',
    'Roboto', 'Share', 'ShareBold',
    'Sniglet', 'SquadaOne',
}

TWT.updateSpeeds = {
    ['warrior'] = { 0.7, 0.5, 0.5 },
    ['paladin'] = { 1, 0.5, 0.7 },
    ['hunter'] = { 0.7, 0.7, 0.7 },
    ['rogue'] = { 0.5, 0.5, 0.5 },
    ['priest'] = { 1, 1, 0.6 },
    ['shaman'] = { 0.7, 0.5, 1 },
    ['mage'] = { 1, 0.5, 0.7 },
    ['warlock'] = { 0.8, 1, 0.6 },
    ['druid'] = { 0.8, 0.5, 1 },
}

function twtprint(a)
    if a == nil then
        DEFAULT_CHAT_FRAME:AddMessage('[TWT]|cff0070de:' .. GetTime() .. '|cffffffff attempt to print a nil value.')
        return false
    end
    DEFAULT_CHAT_FRAME:AddMessage(TWT.classColors[TWT.class].c .. "[TWT] |cffffffff" .. a)
end

function twtdebug(a)
    local time = GetTime() + 0.0001
    if not TWT_CONFIG.debug then
        return false
    end
    if a == nil then
        twtprint('|cff0070de[TWTDEBUG:' .. time .. ']|cffffffff attempt to print a nil value.')
        return
    end
    if type(a) == 'boolean' then
        if a then
            twtprint('|cff0070de[TWTDEBUG:' .. time .. ']|cffffffff[true]')
        else
            twtprint('|cff0070de[TWTDEBUG:' .. time .. ']|cffffffff[false]')
        end
        return true
    end
    twtprint('|cff0070de[D:' .. time .. ']|cffffffff[' .. a .. ']')
end

SLASH_TWT1 = "/twt"
SlashCmdList["TWT"] = function(cmd)
    if cmd then
        if __substr(cmd, 1, 4) == 'show' then
            _G['TWTMain']:Show()
            TWT_CONFIG.visible = true
            return true
        end
        if __substr(cmd, 1, 8) == 'tankmode' then
            if TWT_CONFIG.tankMode then
                twtprint('Tank Mode is already enabled.')
                return false
            else
                TWT_CONFIG.tankMode = true
                twtprint('Tank Mode enabled.')
            end
            return true
        end
        if __substr(cmd, 1, 6) == 'skeram' then
            if TWT_CONFIG.skeram then
                TWT_CONFIG.skeram = false
                twtprint('Skeram module disabled.')
                return true
            end
            TWT_CONFIG.skeram = true
            twtprint('Skeram module enabled.')
            return true
        end
        if __substr(cmd, 1, 5) == 'debug' then
            if TWT_CONFIG.debug then
                TWT_CONFIG.debug = false
                _G['pps']:Hide()
                twtprint('Debugging disabled')
                return true
            end
            TWT_CONFIG.debug = true
            _G['pps']:Show()
            twtdebug('Debugging enabled')
            return true
        end

        if __substr(cmd, 1, 3) == 'who' then
            TWT.queryWho()
            return true
        end

        twtprint(TWT.addonName .. ' |cffabd473v' .. TWT.addonVer .. '|cffffffff available commands:')
        twtprint('/twt show - shows the main window (also /twtshow)')
    end
end

SLASH_TWTSHOW1 = "/twtshow"
SlashCmdList["TWTSHOW"] = function(cmd)
    if cmd then
        _G['TWTMain']:Show()
        TWT_CONFIG.visible = true
    end
end

SLASH_TWTDEBUG1 = "/twtdebug"
SlashCmdList["TWTDEBUG"] = function(cmd)
    if cmd then
        if TWT_CONFIG.debug then
            TWT_CONFIG.debug = false
            twtprint('Debugging disabled')
            return true
        end
        TWT_CONFIG.debug = true
        twtdebug('Debugging enabled')
        return true
    end
end

TWT:RegisterEvent("ADDON_LOADED")
TWT:RegisterEvent("CHAT_MSG_ADDON")
TWT:RegisterEvent("PLAYER_REGEN_DISABLED")
TWT:RegisterEvent("PLAYER_REGEN_ENABLED")
TWT:RegisterEvent("PLAYER_TARGET_CHANGED")
TWT:RegisterEvent("PLAYER_ENTERING_WORLD")
TWT:RegisterEvent("PARTY_MEMBERS_CHANGED")

TWT.threatQuery = CreateFrame("Frame")
TWT.threatQuery:Hide()

local timeStart = GetTime()
local totalPackets = 0
local totalData = 0
local uiUpdates = 0

TWT:SetScript("OnEvent", function()
    if event then
        if event == 'ADDON_LOADED' and arg1 == 'TWThreat' then
            return TWT.init()
        end
        if event == "PARTY_MEMBERS_CHANGED" then
            return TWT.getClasses()
        end
        if event == "PLAYER_ENTERING_WORLD" then
            TWT.sendMyVersion()
            TWT.combatEnd()
            if UnitAffectingCombat('player') then
                TWT.combatStart()
            end
            return true
        end
        if event == 'CHAT_MSG_ADDON' and __find(arg2, TWT.threatApi, 1, true) then

            totalPackets = totalPackets + 1
            totalData = totalData + __strlen(arg2)

            local threatData = arg2
            if __find(threatData, '#') and __find(threatData, TWT.tankModeApi) then
                local packetEx = __explode(threatData, '#')
                if packetEx[1] and packetEx[2] then
                    threatData = packetEx[1]
                    TWT.handleTankModePacket(packetEx[2])
                end
            end

            return TWT.handleThreatPacket(threatData)
        end
        if event == 'CHAT_MSG_ADDON' and arg1 == TWT.prefix then

            if __substr(arg2, 1, 11) == 'TWTVersion:' and arg4 ~= TWT.name then
                if not TWT.showedUpdateNotification then
                    local verEx = __explode(arg2, ':')
                    if TWT.version(verEx[2]) > TWT.version(TWT.addonVer) then
                        twtprint('New version available ' ..
                                TWT.classColors[TWT.class].c .. 'v' .. verEx[2] .. ' |cffffffff(current version ' ..
                                TWT.classColors['paladin'].c .. 'v' .. TWT.addonVer .. '|cffffffff)')
                        twtprint('Update at ' .. TWT.classColors[TWT.class].c .. 'https://github.com/CosminPOP/TWThreat')
                        TWT.showedUpdateNotification = true
                    end
                end
                return true
            end

            if __substr(arg2, 1, 7) == 'TWT_WHO' then
                TWT.send('TWT_ME:' .. TWT.addonVer)
                return true
            end

            if __substr(arg2, 1, 15) == 'TWTRoleTexture:' then
                local tex = __explode(arg2, ':')[2] or ''
                TWT.roles[arg4] = tex
                return true
            end

            if __substr(arg2, 1, 7) == 'TWT_ME:' then

                if TWT.addonStatus[arg4] then

                    local msg = __explode(arg2, ':')[2]
                    local verColor = ""
                    if TWT.version(msg) == TWT.version(TWT.addonVer) then
                        verColor = TWT.classColors['hunter'].c
                    end
                    if TWT.version(msg) < TWT.version(TWT.addonVer) then
                        verColor = '|cffff1111'
                    end
                    if TWT.version(msg) + 1 == TWT.version(TWT.addonVer) then
                        verColor = '|cffff8810'
                    end

                    TWT.addonStatus[arg4]['v'] = '    ' .. verColor .. msg
                    TWT.withAddon = TWT.withAddon + 1

                    TWT.updateWithAddon()

                    return true
                end

                return false
            end

            return false

        end
        if event == "PLAYER_REGEN_DISABLED" then
            return TWT.combatStart()
        end
        if event == "PLAYER_REGEN_ENABLED" then
            return TWT.combatEnd()
        end
        if event == "PLAYER_TARGET_CHANGED" then

            if not TWT.targetChanged() then
                TWT.hideThreatFrames(true)
            end

            return true

        end
    end
end)

function QueryWho_OnClick()
    TWT.queryWho()
end

function TWT.queryWho()
    TWT.withAddon = 0
    TWT.addonStatus = {}
    for i = 0, GetNumRaidMembers() do
        if GetRaidRosterInfo(i) then
            local n, _, _, _, _, _, z = GetRaidRosterInfo(i);
            local _, class = UnitClass('raid' .. i)

            TWT.addonStatus[n] = {
                ['class'] = __lower(class),
                ['v'] = '|cff888888   -   '
            }
            if z == 'Offline' then
                TWT.addonStatus[n]['v'] = '|cffff0000offline'
            end
        end
    end
    twtprint('Sending who query...')
    _G['TWTWithAddonList']:Show()
    TWT.send('TWT_WHO')
end

function TWT.updateWithAddon()

    local rosterList = ''
    local i = 0
    for n, data in next, TWT.addonStatus do
        i = i + 1
        rosterList = rosterList .. TWT.classColors[data['class']].c .. n .. __repeat(' ', 12 - __strlen(n)) .. ' ' .. data['v'] .. ' |cff888888'
        if i < 4 then
            rosterList = rosterList .. '| '
        end
        if i == 4 then
            rosterList = rosterList .. '\n'
            i = 0
        end
    end
    _G['TWTWithAddonListText']:SetText(rosterList)
    _G['TWTWithAddonListTitle']:SetText('Addon Raid Status ' .. TWT.withAddon .. '/' .. GetNumRaidMembers())
end

TWT.glowFader = CreateFrame('Frame')
TWT.glowFader:Hide()

TWT.glowFader:SetScript("OnShow", function()
    this.startTime = GetTime() - 1
    this.dir = 10
    _G['TWTFullScreenGlow']:SetAlpha(0.01)
    _G['TWTFullScreenGlow']:Show()
end)
TWT.glowFader:SetScript("OnHide", function()
    this.startTime = GetTime()
end)
TWT.glowFader:SetScript("OnUpdate", function()
    local plus = 0.04
    local gt = GetTime() * 1000
    local st = (this.startTime + plus) * 1000
    if gt >= st then
        this.startTime = GetTime()

        if _G['TWTFullScreenGlow']:GetAlpha() >= 0.6 then
            this.dir = -1
        end

        _G['TWTFullScreenGlow']:SetAlpha(_G['TWTFullScreenGlow']:GetAlpha() + 0.03 * this.dir)

        if _G['TWTFullScreenGlow']:GetAlpha() <= 0 then
            TWT.glowFader:Hide()
        end


    end
end)

function TWT.init()

    if not TWT_CONFIG then
        TWT_CONFIG = {
            visible = true,
            colTPS = true,
            colThreat = true,
            colPerc = true,
            labelRow = true,
        }
    end

    TWT_CONFIG.windowScale = TWT_CONFIG.windowScale or 1
    TWT_CONFIG.glow = TWT_CONFIG.glow or false
    TWT_CONFIG.perc = TWT_CONFIG.perc or false
    TWT_CONFIG.glowPFUI = TWT_CONFIG.glowPFUI or false
    TWT_CONFIG.percPFUI = TWT_CONFIG.percPFUI or false
    TWT_CONFIG.percPFUItop = TWT_CONFIG.percPFUItop or false
    TWT_CONFIG.percPFUIbottom = TWT_CONFIG.percPFUIbottom or false
    TWT_CONFIG.showInCombat = TWT_CONFIG.showInCombat or false
    TWT_CONFIG.hideOOC = TWT_CONFIG.hideOOC or false
    TWT_CONFIG.font = TWT_CONFIG.font or 'Roboto'
    TWT_CONFIG.barHeight = TWT_CONFIG.barHeight or 20
    TWT_CONFIG.visibleBars = TWT_CONFIG.visibleBars or TWT.minBars
    TWT_CONFIG.fullScreenGlow = TWT_CONFIG.fullScreenGlow or false
    TWT_CONFIG.aggroSound = TWT_CONFIG.aggroSound or false
    TWT_CONFIG.aggroThreshold = TWT_CONFIG.aggroThreshold or 85
    TWT_CONFIG.tankMode = TWT_CONFIG.tankMode or false
    TWT_CONFIG.tankModeStick = TWT_CONFIG.tankModeStick or 'Free' -- Top, Right, Left, Right, Free
    TWT_CONFIG.lock = TWT_CONFIG.lock or false
    TWT_CONFIG.visible = TWT_CONFIG.visible or false
    TWT_CONFIG.colTPS = TWT_CONFIG.colTPS or false
    TWT_CONFIG.colThreat = TWT_CONFIG.colThreat or false
    TWT_CONFIG.colPerc = TWT_CONFIG.colPerc or false
    TWT_CONFIG.labelRow = TWT_CONFIG.labelRow or false
    TWT_CONFIG.skeram = TWT_CONFIG.skeram or false

    TWT_CONFIG.combatAlpha = TWT_CONFIG.combatAlpha or 1
    TWT_CONFIG.oocAlpha = TWT_CONFIG.oocAlpha or 1

    if TWT.class ~= 'paladin' and TWT.class ~= 'warrior' and TWT.class ~= 'druid' then
        _G['TWTMainSettingsTankMode']:Disable()
        TWT_CONFIG.tankMode = false
    end

    TWT_CONFIG.debug = TWT_CONFIG.debug or false

    if TWT_CONFIG.visible then
        _G['TWTMain']:Show()
    else
        _G['TWTMain']:Hide()
    end

    if TWT_CONFIG.tankMode then
        _G['TWTMainSettingsFullScreenGlow']:SetChecked(TWT_CONFIG.fullScreenGlow)
        _G['TWTMainSettingsFullScreenGlow']:Disable()
        _G['TWTMainSettingsAggroSound']:SetChecked(TWT_CONFIG.fullScreenGlow)
        _G['TWTMainSettingsAggroSound']:Disable()
    end

    if TWT_CONFIG.lock then
        _G['TWTMainLockButton']:SetNormalTexture('Interface\\addons\\TWThreat\\images\\icon_locked')
    else
        _G['TWTMainLockButton']:SetNormalTexture('Interface\\addons\\TWThreat\\images\\icon_unlocked')
    end

    _G['TWTFullScreenGlowTexture']:SetWidth(GetScreenWidth())
    _G['TWTFullScreenGlowTexture']:SetHeight(GetScreenHeight())

    _G['TWTMain']:SetHeight(TWT_CONFIG.barHeight * TWT_CONFIG.visibleBars + (TWT_CONFIG.labelRow and 40 or 20))

    _G['TWTMainSettingsFrameHeightSlider']:SetValue(TWT_CONFIG.barHeight) -- calls FrameHeightSlider_OnValueChanged()
    _G['TWTMainSettingsWindowScaleSlider']:SetValue(TWT_CONFIG.windowScale) -- calls FrameHeightSlider_OnValueChanged()

    _G['TWTMainSettingsCombatAlphaSlider']:SetValue(TWT_CONFIG.combatAlpha) -- calls CombatOpacitySlider_OnValueChanged()
    _G['TWTMainSettingsOOCAlphaSlider']:SetValue(TWT_CONFIG.oocAlpha) -- calls OOCombatSlider_OnValueChanged()

    _G['TWTMainSettingsAggroThresholdSlider']:SetValue(TWT_CONFIG.aggroThreshold) -- calls AggroThresholdSlider_OnValueChanged()

    _G['TWTMainSettingsFontButton']:SetText(TWT_CONFIG.font)

    _G['TWTMainSettingsTargetFrameGlow']:SetChecked(TWT_CONFIG.glow)
    _G['TWTMainSettingsTargetFrameGlowPFUI']:SetChecked(TWT_CONFIG.glowPFUI)
    _G['TWTMainSettingsPercNumbers']:SetChecked(TWT_CONFIG.perc)
    _G['TWTMainSettingsPercNumbersPFUI']:SetChecked(TWT_CONFIG.percPFUI)
    _G['TWTMainSettingsPercNumbersPFUItop']:SetChecked(TWT_CONFIG.percPFUItop)
    _G['TWTMainSettingsPercNumbersPFUIbottom']:SetChecked(TWT_CONFIG.percPFUIbottom)
    _G['TWTMainSettingsShowInCombat']:SetChecked(TWT_CONFIG.showInCombat)
    _G['TWTMainSettingsHideOOC']:SetChecked(TWT_CONFIG.hideOOC)
    _G['TWTMainSettingsFullScreenGlow']:SetChecked(TWT_CONFIG.fullScreenGlow)
    _G['TWTMainSettingsAggroSound']:SetChecked(TWT_CONFIG.aggroSound)
    _G['TWTMainSettingsTankMode']:SetChecked(TWT_CONFIG.tankMode)

    _G['TWTMainSettingsColumnsTPS']:SetChecked(TWT_CONFIG.colTPS)
    _G['TWTMainSettingsColumnsThreat']:SetChecked(TWT_CONFIG.colThreat)
    _G['TWTMainSettingsColumnsPercent']:SetChecked(TWT_CONFIG.colPerc)

    _G['TWTMainSettingsLabelRow']:SetChecked(TWT_CONFIG.labelRow)

    TWT.setColumnLabels()

    if TWT_CONFIG.labelRow then
        _G['TWTMainBarsBG']:SetPoint('TOPLEFT', 1, -40)
        _G['TWTMainNameLabel']:Show()
    else
        _G['TWTMainBarsBG']:SetPoint('TOPLEFT', 1, -20)
        _G['TWTMainNameLabel']:Hide()
        _G['TWTMainTPSLabel']:Hide()
        _G['TWTMainThreatLabel']:Hide()
        _G['TWTMainPercLabel']:Hide()
    end

    _G['TWTMainSettingsFontButtonNT']:SetVertexColor(0.4, 0.4, 0.4)

    local color = TWT.classColors[TWT.class]

    _G['TWTMainTitleBG']:SetVertexColor(color.r, color.g, color.b)
    _G['TWTMainSettingsTitleBG']:SetVertexColor(color.r, color.g, color.b)
    _G['TWTMainTankModeWindowTitleBG']:SetVertexColor(color.r, color.g, color.b)

    _G['TWThreatDisplayTarget']:SetScale(UIParent:GetScale())

    -- fonts
    local fontFrames = {}

    for i, font in TWT.fonts do
        fontFrames[i] = CreateFrame('Button', 'Font_' .. font, _G['TWTMainSettingsFontList'], 'TWTFontFrameTemplate')

        fontFrames[i]:SetPoint("TOPLEFT", _G["TWTMainSettingsFontList"], "TOPLEFT", 0, 17 - i * 17)

        _G['Font_' .. font]:SetID(i)
        _G['Font_' .. font .. 'Name']:SetFont("Interface\\addons\\TWThreat\\fonts\\" .. font .. ".ttf", 15)
        _G['Font_' .. font .. 'Name']:SetText(font)
        _G['Font_' .. font .. 'HT']:SetVertexColor(1, 1, 1, 0.5)

        fontFrames[i]:Show()
    end

    --UnitPopupButtons["INSPECT_TALENTS"] = { text = 'Inspect Talents', dist = 0 }
    --
    --TWT.addInspectMenu("PARTY")
    --TWT.addInspectMenu("PLAYER")
    --TWT.addInspectMenu("RAID")
    --
    --TWT.hooksecurefunc("UnitPopup_OnClick", function()
    --    local button = this.value
    --    if button == "INSPECT_TALENTS" then
    --
    --        _G['TWTTalentFrame']:Hide()
    --
    --        TWT_SPEC = {
    --            class = UnitClass('target'),
    --            {
    --                name = 'Arms',
    --                iconTexture = 'interface\\icons\\ability_warrior_cleave',
    --                pointsSpent = 27,
    --                numTalents = 18
    --            },
    --            {
    --                name = 'Fury',
    --                iconTexture = 'interface\\icons\\ability_warrior_cleave',
    --                pointsSpent = 24,
    --                numTalents = 17
    --            },
    --            {
    --                name = 'Protection',
    --                iconTexture = 'interface\\icons\\ability_warrior_cleave',
    --                pointsSpent = 0,
    --                numTalents = 17
    --            }
    --        }
    --
    --        TWT.send('TWTShowTalents:' .. UnitName('target'))
    --
    --    end
    --end)
    --
    --UIParentLoadAddOn("Blizzard_TalentUI")

    TWT.updateTitleBarText()
    TWT.updateSettingsTabs(1)

    TWT.checkTargetFrames()

    twtprint(TWT.addonName .. ' |cffabd473v' .. TWT.addonVer .. '|cffffffff loaded.')
    return true
end

function TWT.updateSettingsTabs(tab)
    local color = TWT.classColors[TWT.class]
    _G['TWTMainSettingsTabsUnderline']:SetVertexColor(color.r, color.g, color.b)

    for i = 1, 3 do
        _G['TWTMainSettingsTab' .. i]:Hide()
        _G['TWTMainSettingsTab' .. i .. 'ButtonNT']:SetVertexColor(color.r, color.g, color.b, 0.4)
        _G['TWTMainSettingsTab' .. i .. 'ButtonHT']:SetVertexColor(color.r, color.g, color.b, 0.4)
        _G['TWTMainSettingsTab' .. i .. 'ButtonPT']:SetVertexColor(color.r, color.g, color.b, 0.4)
        _G['TWTMainSettingsTab' .. i .. 'ButtonText']:SetTextColor(0.4, 0.4, 0.4)
    end

    _G['TWTMainSettingsTab' .. tab .. 'ButtonNT']:SetVertexColor(color.r, color.g, color.b, 1)
    _G['TWTMainSettingsTab' .. tab .. 'ButtonText']:SetTextColor(1, 1, 1)

    _G['TWTMainSettingsTab' .. tab]:Show()

end

function TWTSettingsTab_OnClick(tab)
    TWT.updateSettingsTabs(tab)
end

function TWTHealerMasterTarget_OnClick()

    TWT.getClasses()

    if not UnitExists('target') or not UnitIsPlayer('target')
            or UnitName('target') == TWT.name then

        if TWT.healerMasterTarget == '' then
            twtprint('Please target a tank.')
        else
            TWT.removeHealerMasterTarget()
        end

        return false
    end

    if UnitName('target') == TWT.healerMasterTarget then
        return TWT.removeHealerMasterTarget()
    end

    TWT.send('TWT_HMT:' .. UnitName('target'))

    local color = TWT.classColors[TWT.getClass(UnitName('target'))]

    twtprint('Trying to set Healer Master Target to ' .. color.c .. UnitName('target'))

end

function TWT.removeHealerMasterTarget()
    TWT.send('TWT_HMT_REM:' .. TWT.healerMasterTarget)

    twtprint('Healer Master Target cleared.')

    TWT.healerMasterTarget = ''
    TWT.targetName = ''

    TWT.threats = TWT.wipe(TWT.threats)

    _G['TWTMainSettingsHealerMasterTargetButton']:SetText('From Target')
    _G['TWTMainSettingsHealerMasterTargetButtonNT']:SetVertexColor(1, 1, 1, 1)

    TWT.updateUI('removeHealerMasterTarget')

    return true
end

function TWT.addInspectMenu(to)
    local found = 0
    for i, j in UnitPopupMenus[to] do
        if j == "TRADE" then
            found = i
        end
    end
    if found ~= 0 then
        UnitPopupMenus[to][__getn(UnitPopupMenus[to]) + 1] = UnitPopupMenus[to][__getn(UnitPopupMenus[to])]
        for i = __getn(UnitPopupMenus[to]) - 1, found, -1 do
            UnitPopupMenus[to][i] = UnitPopupMenus[to][i - 1]
        end
    end
    UnitPopupMenus[to][found] = "INSPECT_TALENTS"
end

TWT.classes = {}

function TWT.getClass(name)
    return TWT.classes[name] or 'priest'
end

function TWT.getClasses()
    if TWT.channel == 'RAID' then
        for i = 0, GetNumRaidMembers() do
            if GetRaidRosterInfo(i) then
                local name = GetRaidRosterInfo(i)
                local _, raidCls = UnitClass('raid' .. i)
                TWT.classes[name] = __lower(raidCls)
            end
        end
    end
    if TWT.channel == 'PARTY' then
        if GetNumPartyMembers() > 0 then
            for i = 1, GetNumPartyMembers() do
                if UnitName('party' .. i) and UnitClass('party' .. i) then
                    local name = UnitName('party' .. i)
                    local _, raidCls = UnitClass('party' .. i)
                    TWT.classes[name] = __lower(raidCls)
                end
            end
        end
    end
    twtdebug('classes saved')
    return true
end

TWT.history = {}

TWT.tankName = ''

function TWT.handleThreatPacket(packet)

    --twtdebug(packet)

    local playersString = __substr(packet, __find(packet, TWT.threatApi) + __strlen(TWT.threatApi), __strlen(packet))

    TWT.threats = TWT.wipe(TWT.threats)
    TWT.tankName = ''

    local players = __explode(playersString, ';')

    for _, tData in players do

        local msgEx = __explode(tData, ':')

        -- udts handling
        if msgEx[1] and msgEx[2] and msgEx[3] and msgEx[4] and msgEx[5] then

            local player = msgEx[1]
            local tank = msgEx[2] == '1'
            local threat = __parseint(msgEx[3])
            local perc = __parseint(msgEx[4])
            local melee = msgEx[5] == '1'

            if UnitName('target') and not UnitIsPlayer('target') and TWT.shouldRelay then
                --relay
                for i, name in TWT.relayTo do
                    twtdebug('relaying to ' .. i .. ' ' .. name)
                end
                TWT.send('TWTRelayV1' ..
                        ':' .. UnitName('target') ..
                        ':' .. player ..
                        ':' .. msgEx[3] ..
                        ':' .. threat ..
                        ':' .. perc ..
                        ':' .. msgEx[6]);
            end

            local time = time()

            if TWT.history[player] then
                TWT.history[player][time] = threat
            else
                TWT.history[player] = {}
            end

            TWT.threats[player] = {
                threat = threat,
                tank = tank,
                perc = perc,
                melee = melee,
                tps = TWT.calcTPS(player),
                class = TWT.getClass(player)
            }

            if tank then
                TWT.tankName = player
            end
        end
    end

    TWT.calcAGROPerc()

    TWT.updateUI()

end

function TWT.handleTankModePacket(packet)

    --twtdebug(msg)

    local playersString = __substr(packet, __find(packet, TWT.tankModeApi) + __strlen(TWT.tankModeApi), __strlen(packet))

    TWT.tankModeThreats = TWT.wipe(TWT.tankModeThreats)

    local players = __explode(playersString, ';')

    for _, tData in players do

        local msgEx = __explode(tData, ':')

        if msgEx[1] and msgEx[2] and msgEx[3] and msgEx[4] then

            local creature = msgEx[1]
            local guid = msgEx[2] --keep it string
            local name = msgEx[3]
            local perc = __parseint(msgEx[4])

            TWT.tankModeThreats[guid] = {
                creature = creature,
                name = name,
                perc = perc
            }

            --TWT.updateUI('handleTMServerMSG')

        end

    end

end

function TWT.calcAGROPerc()

    local tankThreat = 0
    for _, data in next, TWT.threats do
        if data.tank then
            tankThreat = data.threat
            break
        end
    end

    TWT.threats[TWT.AGRO] = {
        class = 'agro',
        threat = 0,
        perc = 100,
        tps = '',
        history = {},
        tank = false,
        melee = false
    }

    if not TWT.threats[TWT.name] then
        twtdebug('threats de name is bad')
        return false
    end

    TWT.threats[TWT.AGRO].threat = tankThreat * (TWT.threats[TWT.name].melee and 1.1 or 1.3)
    if TWT.threats[TWT.AGRO].threat == 0 then
        TWT.threats[TWT.AGRO].threat = 1
    end
    TWT.threats[TWT.AGRO].perc = TWT.threats[TWT.name].melee and 110 or 130

end

function TWT.combatStart()

    TWT.updateTargetFrameThreatIndicators(-1, '')
    timeStart = GetTime()
    totalPackets = 0
    totalData = 0

    --twtdebug('wipe threats combatstart')
    --TWT.threats = TWT.wipe(TWT.threats)
    --TWT.tankModeThreats = TWT.wipe(TWT.tankModeThreats)
    TWT.hideThreatFrames(true)
    TWT.shouldRelay = TWT.checkRelay()

    if GetNumRaidMembers() == 0 and GetNumPartyMembers() == 0 then
        return false
    end

    if TWT_CONFIG.showInCombat then
        _G['TWTMain']:Show()
    end

    TWT.spec = {}
    for t = 1, GetNumTalentTabs() do
        TWT.spec[t] = {
            talents = 0,
            texture = ''
        }
        for i = 1, GetNumTalents(t) do
            local _, _, _, _, currRank = GetTalentInfo(t, i);
            TWT.spec[t].talents = TWT.spec[t].talents + currRank
        end
    end

    local specIndex = 1
    for i = 2, 4 do
        local name, texture = GetSpellTabInfo(i);
        if name and texture then
            TWT.spec[specIndex].name = name
            texture = __explode(texture, '\\')
            texture = texture[__getn(texture)]
            TWT.spec[specIndex].texture = texture
            specIndex = specIndex + 1
        end
    end

    local sendTex = TWT.spec[1].texture
    TWT.updateSpeed = TWT.updateSpeeds[TWT.class][1]
    if TWT.spec[2].talents > TWT.spec[1].talents and TWT.spec[2].talents > TWT.spec[3].talents then
        sendTex = TWT.spec[2].texture
        TWT.updateSpeed = TWT.updateSpeeds[TWT.class][2]
    end
    if TWT.spec[3].talents > TWT.spec[1].talents and TWT.spec[3].talents > TWT.spec[2].talents then
        sendTex = TWT.spec[3].texture
        TWT.updateSpeed = TWT.updateSpeeds[TWT.class][3]
    end

    if TWT.class == 'warrior' and __lower(sendTex) == 'ability_rogue_eviscerate' then
        sendTex = 'ability_warrior_savageblow' --ms
    end

    TWT.send('TWTRoleTexture:' .. sendTex)

    TWT.getClasses()

    TWT.updateUI('combatStart')

    TWT.threatQuery:Show()
    TWT.barAnimator:Show()

    TWTTankModeWindowChangeStick_OnClick()

    _G['TWTMain']:SetAlpha(TWT_CONFIG.combatAlpha)

    return true
end

function TWT.combatEnd()

    TWT.updateTargetFrameThreatIndicators(-1, '')

    twtdebug('time = ' .. (TWT.round(GetTime() - timeStart)) .. 's packets = ' .. totalPackets .. ' ' ..
            totalPackets / (GetTime() - timeStart) .. ' packets/s')

    timeStart = GetTime()
    totalPackets = 0
    totalData = 0

    twtdebug('wipe threats combat end')

    TWT.threats = TWT.wipe(TWT.threats)
    TWT.tankModeThreats = TWT.wipe(TWT.tankModeThreats)
    TWT.history = TWT.wipe(TWT.history)

    if TWT_CONFIG.hideOOC then
        _G['TWTMain']:Hide()
    end

    TWT.updateUI('combatEnd')

    TWT.threatQuery:Hide()
    TWT.barAnimator:Hide()

    if TWT_CONFIG.tankMode then
        _G['TWTMainTankModeWindow']:Hide()
    end

    _G['TWTWarning']:Hide()

    TWT.updateTitleBarText()

    _G['TWTMain']:SetAlpha(TWT_CONFIG.oocAlpha)

    TWT.hideThreatFrames(true)

    return true

end

function TWT.checkRelay()

    if GetNumRaidMembers() == 0 and GetNumPartyMembers() == 0 then
        return false
    end

    if __getn(TWT.relayTo) == 0 then
        return false
    end

    -- in raid
    if TWT.channel == 'RAID' and GetNumRaidMembers() > 0 then
        for index, name in TWT.relayTo do
            local found = false
            for i = 0, GetNumRaidMembers() do
                if GetRaidRosterInfo(i) and UnitName('raid' .. i) == name then
                    found = true
                end
            end
            if not found then
                TWT.relayTo[index] = nil
                twtdebug(name .. ' removed from relay')
            end
        end
    end
    if TWT.channel == 'PARTY' and GetNumPartyMembers() > 0 then
        for index, name in TWT.relayTo do
            local found = false
            for i = 1, GetNumPartyMembers() do
                if UnitName('party' .. i) == name then
                    found = true
                end
            end
            if not found then
                TWT.relayTo[index] = nil
                twtdebug(name .. ' removed from relay')
            end
        end
    end

    if __getn(TWT.relayTo) == 0 then
        return false
    end

    return true
end

function TWT.checkTargetFrames()
    if _G['TargetFrame']:IsVisible() ~= nil then
        TWT.targetFrameVisible = true
    else
        TWT.targetFrameVisible = false
    end

    if _G['pfTarget'] and _G['pfTarget']:IsVisible() ~= nil then
        TWT.PFUItargetFrameVisible = true
    else
        TWT.PFUItargetFrameVisible = false
    end
end

function TWT.hideThreatFrames(force)
    if TWT.tableSize(TWT.threats) > 0 or force then
        for name in next, TWT.threatsFrames do
            TWT.threatsFrames[name]:Hide()
        end
    end
end

function TWT.targetChanged()

    if not UnitAffectingCombat('player') and _G['TWTMainSettings']:IsVisible() == 1 then
        return true
    end

    TWT.channel = (GetNumRaidMembers() > 0) and 'RAID' or 'PARTY'

    if UIParent:GetScale() ~= _G['TWThreatDisplayTarget']:GetScale() then
        _G['TWThreatDisplayTarget']:SetScale(UIParent:GetScale())
    end

    if TWT.healerMasterTarget ~= '' then
        return true
    end

    TWT.targetName = ''
    TWT.updateTargetFrameThreatIndicators(-1)

    -- lost target
    if not UnitExists('target') then
        return false
    end

    -- target is dead, dont show anything
    if UnitIsDead('target') then
        return false
    end

    -- dont show anything
    if UnitIsPlayer('target') then
        return false
    end

    -- non interesting target
    if UnitClassification('target') ~= 'worldboss' and UnitClassification('target') ~= 'elite' then
        return false
    end

    -- no raid or party
    if GetNumRaidMembers() == 0 and GetNumPartyMembers() == 0 then
        return false
    end

    -- not in combat
    if not UnitAffectingCombat('player') or not UnitAffectingCombat('target') then
        return false
    end

    twtdebug('wipe target changed')
    TWT.threats = TWT.wipe(TWT.threats)
    TWT.history = TWT.wipe(TWT.history)

    if TWT_CONFIG.skeram then
        -- skeram hax
        --The Prophet Skeram
        --_G['TWTWarning']:Hide()
        --if UnitAffectingCombat('player') then
        --    if UnitName('target') == 'The Prophet Skeram' and TWT.custom['The Prophet Skeram'] ~= 0 then

        --            _G['TWTWarningText']:SetText("|cff00ff00- REAL -");
        --            _G['TWTWarning']:Show()
        --        else
        --            _G['TWTWarningText']:SetText("- CLONE -");
        --            _G['TWTWarning']:Show()
        --        end
        --    end
        --end
    end

    TWT.targetName = TWT.unitNameForTitle(UnitName('target'))

    TWT.updateTitleBarText(TWT.targetName)

    return true
end

function TWT.send(msg)
    SendAddonMessage(TWT.prefix, msg, TWT.channel)
end

function TWT.UnitDetailedThreatSituation(limit)
    SendAddonMessage(TWT.UDTS .. (TWT_CONFIG.tankMode and '_TM' or ''), "limit=" .. limit, TWT.channel)
end

function TWT.updateUI(from)

    --twtdebug('update ui call from [' .. (from or '') .. ']')

    TWT.checkTargetFrames()

    if TWT_CONFIG.debug then
        _G['pps']:SetText('Traffic: ' .. TWT.round((totalPackets / (GetTime() - timeStart)) * 10) / 10
                .. 'packets/s (' .. TWT.round(totalData / (GetTime() - timeStart)) .. ' cps)'
                .. TWT.round(uiUpdates / (GetTime() - timeStart)) .. ' ups ')
        _G['pps']:Show()
    else
        _G['pps']:Hide()
    end

    uiUpdates = uiUpdates + 1

    if not TWT.barAnimator:IsVisible() then
        TWT.barAnimator:Show()
    end

    TWT.hideThreatFrames()

    if not UnitAffectingCombat('player') and not _G['TWTMainSettings']:IsVisible() then
        TWT.updateTargetFrameThreatIndicators(-1)
        return false
    end

    if TWT.targetName == '' then
        return false
    end

    if _G['TWTMainSettings']:IsVisible() and not UnitAffectingCombat('player') then
        TWT.tankName = 'Tenk'
    end

    local index = 0

    for name, data in TWT.ohShitHereWeSortAgain(TWT.threats, true) do

        if data and TWT.threats[TWT.name] and index < TWT_CONFIG.visibleBars then

            index = index + 1
            if not TWT.threatsFrames[index] then
                TWT.threatsFrames[index] = CreateFrame('Frame', 'TWThreat' .. index, _G["TWTMain"], 'TWThreat')
            end

            _G['TWThreat' .. index]:SetAlpha(TWT_CONFIG.combatAlpha)
            _G['TWThreat' .. index]:SetWidth(TWT.windowWidth - 2)

            _G['TWThreat' .. index .. 'Name']:SetFont("Interface\\addons\\TWThreat\\fonts\\" .. TWT_CONFIG.font .. ".ttf", 15, "OUTLINE")
            _G['TWThreat' .. index .. 'TPS']:SetFont("Interface\\addons\\TWThreat\\fonts\\" .. TWT_CONFIG.font .. ".ttf", 15, "OUTLINE")
            _G['TWThreat' .. index .. 'Threat']:SetFont("Interface\\addons\\TWThreat\\fonts\\" .. TWT_CONFIG.font .. ".ttf", 15, "OUTLINE")
            _G['TWThreat' .. index .. 'Perc']:SetFont("Interface\\addons\\TWThreat\\fonts\\" .. TWT_CONFIG.font .. ".ttf", 15, "OUTLINE")

            _G['TWThreat' .. index]:SetHeight(TWT_CONFIG.barHeight - 1)
            _G['TWThreat' .. index .. 'BG']:SetHeight(TWT_CONFIG.barHeight - 2)

            TWT.threatsFrames[index]:ClearAllPoints()
            TWT.threatsFrames[index]:SetPoint("TOPLEFT", _G["TWTMain"], "TOPLEFT", 0,
                    (TWT_CONFIG.labelRow and -40 or -20) +
                            TWT_CONFIG.barHeight - 1 - index * TWT_CONFIG.barHeight)


            -- icons
            _G['TWThreat' .. index .. 'AGRO']:Hide()
            _G['TWThreat' .. index .. 'Role']:Show()
            if name ~= TWT.AGRO then

                _G['TWThreat' .. index .. 'Role']:SetWidth(TWT_CONFIG.barHeight - 2)
                _G['TWThreat' .. index .. 'Role']:SetHeight(TWT_CONFIG.barHeight - 2)
                _G['TWThreat' .. index .. 'Name']:SetPoint('LEFT', _G['TWThreat' .. index .. 'Role'], 'RIGHT', 1 + (TWT_CONFIG.barHeight / 15), -1)
                if TWT.roles[name] then
                    _G['TWThreat' .. index .. 'Role']:SetTexture('Interface\\Icons\\' .. TWT.roles[name])
                    _G['TWThreat' .. index .. 'Role']:SetTexCoord(0.08, 0.92, 0.08, 0.92)
                    _G['TWThreat' .. index .. 'Role']:Show()
                else
                    _G['TWThreat' .. index .. 'Role']:SetTexture('Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes')
                    _G['TWThreat' .. index .. 'Role']:SetTexCoord(unpack(TWT.classCoords[data.class]))
                end

            else
                _G['TWThreat' .. index .. 'AGRO']:Show()
                _G['TWThreat' .. index .. 'Role']:Hide()
            end


            -- tps
            _G['TWThreat' .. index .. 'TPS']:SetText(data.tps)

            -- labels
            TWT.setBarLabels(_G['TWThreat' .. index .. 'Perc'], _G['TWThreat' .. index .. 'Threat'], _G['TWThreat' .. index .. 'TPS'])

            -- perc
            _G['TWThreat' .. index .. 'Perc']:SetText(TWT.round(data.perc) .. '%')

            if TWT.name ~= TWT.tankName and name == TWT.AGRO then
                _G['TWThreat' .. index .. 'Perc']:SetText(100 - TWT.round(TWT.threats[TWT.name].perc) .. '%')
            end

            -- name
            _G['TWThreat' .. index .. 'Name']:SetText(TWT.classColors['priest'].c .. name)

            -- bar width and color
            local color = TWT.classColors[data.class]

            if name == TWT.name then

                if UnitName('target') ~= 'The Prophet Skeram' then
                    if name == __char(77) .. __lower(__char(79, 77, 79)) and data.perc >= 95 then
                        _G['TWTWarningText']:SetText("- STOP DPS " .. __char(77) .. __lower(__char(79, 77, 79)) .. " -");
                        _G['TWTWarning']:Show()
                    else
                        _G['TWTWarning']:Hide()
                    end
                end

                if TWT_CONFIG.aggroSound and data.perc >= TWT_CONFIG.aggroThreshold and time() - TWT.lastAggroWarningSoundTime > 5
                        and not TWT_CONFIG.fullScreenGlow then
                    PlaySoundFile('Interface\\addons\\TWThreat\\sounds\\warn.ogg')
                    TWT.lastAggroWarningSoundTime = time()
                end

                if TWT_CONFIG.fullScreenGlow and data.perc >= TWT_CONFIG.aggroThreshold and time() - TWT.lastAggroWarningGlowTime > 5 then
                    TWT.glowFader:Show()
                    TWT.lastAggroWarningGlowTime = time()
                    if TWT_CONFIG.aggroSound then
                        PlaySoundFile('Interface\\addons\\TWThreat\\sounds\\warn.ogg')
                    end
                end

                TWT.updateTitleBarText(TWT.targetName .. ' (' .. TWT.round(data.perc) .. '%)')

                _G['TWThreat' .. index .. 'Threat']:SetText(TWT.formatNumber(data.threat))

                TWT.barAnimator:animateTo(index, data.perc)

            elseif name == TWT.AGRO then

                TWT.barAnimator:animateTo(index, nil)

                _G['TWThreat' .. index .. 'BG']:SetWidth(TWT.windowWidth - 2)
                _G['TWThreat' .. index .. 'Threat']:SetText('+' .. TWT.formatNumber(data.threat - TWT.threats[TWT.name].threat))

                local colorLimit = 50

                if TWT.threats[TWT.name].perc >= 0 and TWT.threats[TWT.name].perc < colorLimit then
                    _G['TWThreat' .. index .. 'BG']:SetVertexColor(TWT.threats[TWT.name].perc / colorLimit, 1, 0, 0.9)
                elseif TWT.threats[TWT.name].perc >= colorLimit then
                    _G['TWThreat' .. index .. 'BG']:SetVertexColor(1, 1 - (TWT.threats[TWT.name].perc - colorLimit) / colorLimit, 0, 0.9)
                end

                if TWT.tankName == TWT.name then
                    _G['TWThreat' .. index .. 'BG']:SetVertexColor(1, 0, 0, 1)
                    _G['TWThreat' .. index .. 'Perc']:SetText('')
                end

            else

                TWT.barAnimator:animateTo(index, data.perc)

                _G['TWThreat' .. index .. 'Threat']:SetText(TWT.formatNumber(data.threat))
                _G['TWThreat' .. index .. 'BG']:SetVertexColor(color.r, color.g, color.b, 0.9)
            end

            if data.tank then

                TWT.barAnimator:animateTo(index, 100, true)

            end

            if name == TWT.name then
                _G['TWThreat' .. index .. 'BG']:SetVertexColor(1, 0.2, 0.2, 1)
                TWT.updateTargetFrameThreatIndicators(data.perc)
            end

            TWT.threatsFrames[index]:Show()

        end

    end

    if TWT_CONFIG.tankMode then

        _G['TMEF1']:Hide()
        _G['TMEF2']:Hide()
        _G['TMEF3']:Hide()
        _G['TMEF4']:Hide()
        _G['TMEF5']:Hide()

        _G['TWTMainTankModeWindow']:SetHeight(0)

        if TWT.tableSize(TWT.tankModeThreats) > 1 then

            local i = 0
            for guid, data in next, TWT.tankModeThreats do

                i = i + 1
                if i > 5 then
                    break
                end
                _G['TWTMainTankModeWindow']:SetHeight(i * 25 + 23)

                _G['TMEF' .. i .. 'Target']:SetText(data.creature)
                _G['TMEF' .. i .. 'Player']:SetText(TWT.classColors[TWT.getClass(data.name)].c .. data.name)
                _G['TMEF' .. i .. 'Perc']:SetText(TWT.round(data.perc) .. '%')
                _G['TMEF' .. i .. 'TargetButton']:SetID(guid)
                _G['TMEF' .. i]:SetPoint("TOPLEFT", _G["TWTMainTankModeWindow"], "TOPLEFT", 0, -21 + 24 - i * 25)

                _G['TMEF' .. i .. 'RaidTargetIcon']:Hide()

                if data.perc >= 0 and data.perc < 50 then
                    _G['TMEF' .. i .. 'BG']:SetVertexColor(data.perc / 50, 1, 0, 0.5)
                else
                    _G['TMEF' .. i .. 'BG']:SetVertexColor(1, 1 - (data.perc - 50) / 50, 0, 0.5)
                end

                _G['TMEF' .. i]:Show()

                _G['TWTMainTankModeWindow']:Show()

            end

        else
            _G['TWTMainTankModeWindow']:Hide()
        end
    else
        _G['TWTMainTankModeWindow']:Hide()
    end

end

TWT.barAnimator = CreateFrame('Frame')
TWT.barAnimator:Hide()
TWT.barAnimator.frames = {}

function TWT.barAnimator:animateTo(index, perc, instant)

    if perc == nil then
        TWT.barAnimator.frames['TWThreat' .. index .. 'BG'] = perc
        return false
    end

    perc = TWT.round(perc)
    perc = perc > 100 and 100 or perc

    local width = TWT.round((TWT.windowWidth - 2) * perc / 100)
    if instant then
        _G['TWThreat' .. index .. 'BG']:SetWidth(width)
        return true
    end
    TWT.barAnimator.frames['TWThreat' .. index .. 'BG'] = width
end

TWT.barAnimator:SetScript("OnShow", function()
    this.startTime = GetTime()
    TWT.barAnimator.frames = {}
end)
TWT.barAnimator:SetScript("OnUpdate", function()
    local currentW, step, diff
    for frame, w in TWT.barAnimator.frames do
        currentW = TWT.round(_G[frame]:GetWidth())

        diff = currentW - w

        if diff ~= 0 then

            step = 12
            --if __abs(diff) > 50 then
            --    step = 9
            --elseif __abs(diff) > 100 then
            --    step = 12
            --elseif __abs(diff) > 200 then
            --    step = 15
            --end

            -- grow
            if diff < 0 then
                if __abs(diff) < step then
                    step = __abs(diff)
                end
                _G[frame]:SetWidth(currentW + step)
            else
                if diff < step then
                    step = diff
                end
                _G[frame]:SetWidth(currentW - step)
            end
        end
    end
end)

TWT.threatQuery:SetScript("OnShow", function()
    this.startTime = GetTime()
end)
TWT.threatQuery:SetScript("OnHide", function()
end)
TWT.threatQuery:SetScript("OnUpdate", function()
    local plus = TWT.updateSpeed
    local gt = GetTime() * 1000
    local st = (this.startTime + plus) * 1000
    if gt >= st then
        this.startTime = GetTime()
        if GetNumRaidMembers() == 0 and GetNumPartyMembers() == 0 then
            return false
        end
        if UnitAffectingCombat('player') and UnitAffectingCombat('target') then

            if TWT.targetName == '' then
                twtdebug('threatQuery target = blank ')
                -- try to re-get target
                TWT.targetChanged()
                return false
            end

            if TWT_CONFIG.glow or TWT_CONFIG.perc or
                    TWT_CONFIG.glowPFUI or TWT_CONFIG.percPFUI or
                    TWT_CONFIG.fullScreenGlow or TWT_CONFIG.tankmode or
                    TWT_CONFIG.visible then
                if TWT.healerMasterTarget == '' then
                    TWT.UnitDetailedThreatSituation(TWT_CONFIG.visibleBars - 1)
                end
            else
                twtdebug('not asking threat situation')
            end

        end
    end
end)

function TWT.calcTPS(name)

    local data = TWT.history[name]

    if not data then
        return 0
    end

    local older = time()
    for t in next, data do
        if t < older then
            older = t
        end
    end

    if TWT.tableSize(data) > 10 then
        TWT.history[name][older] = nil
    end

    local tps = 0
    local mean = 0

    local time = time()

    for i = 0, TWT.tableSize(data) - 1 do
        if TWT.history[name][time - i] and TWT.history[name][time - i - 1] then
            tps = tps + TWT.history[name][time - i] - TWT.history[name][time - i - 1]
            mean = mean + 1
        end
    end

    if mean > 0 and tps > 0 then
        return TWT.round(tps / mean)
    end

    return 0

end

function TWT.updateTargetFrameThreatIndicators(perc)

    if TWT_CONFIG.fullScreenGlow then
        _G['TWTFullScreenGlow']:Show()
    else
        _G['TWTFullScreenGlow']:Hide()
    end

    if perc == -1 then
        TWT.updateTitleBarText()
        _G['TWThreatDisplayTarget']:Hide()
        _G['TWThreatDisplayTargetPFUI']:Hide()

        --TWT.hideThreatFrames()

        return false
    end

    if not TWT_CONFIG.glow and not TWT_CONFIG.perc and not TWT.targetFrameVisible then
        _G['TWThreatDisplayTarget']:Hide()
    end

    if not TWT_CONFIG.glowPFUI and not TWT_CONFIG.percPFUI and not TWT.PFUItargetFrameVisible then
        _G['TWThreatDisplayTargetPFUI']:Hide()
    end

    if not TWT.targetFrameVisible and not TWT.PFUItargetFrameVisible then
        return false
    end

    if TWT.targetFrameVisible then
        _G['TWThreatDisplayTarget']:Show()
    end
    if TWT.PFUItargetFrameVisible then
        _G['TWThreatDisplayTargetPFUI']:Show()
    end

    perc = TWT.round(perc)

    if TWT_CONFIG.glow then

        local unitClassification = UnitClassification('target')
        if unitClassification == 'worldboss' then
            unitClassification = 'elite'
        end

        _G['TWThreatDisplayTargetGlow']:SetTexture('Interface\\addons\\TWThreat\\images\\' .. unitClassification)

        if perc >= 0 and perc < 50 then
            _G['TWThreatDisplayTargetGlow']:SetVertexColor(perc / 50, 1, 0, perc / 50)
        elseif perc >= 50 then
            _G['TWThreatDisplayTargetGlow']:SetVertexColor(1, 1 - (perc - 50) / 50, 0, 1)
        end

        _G['TWThreatDisplayTargetGlow']:Show()
    else
        _G['TWThreatDisplayTargetGlow']:Hide()
    end

    if TWT_CONFIG.glowPFUI and _G['pfTarget'] then

        if perc >= 0 and perc < 50 then
            _G['TWThreatDisplayTargetPFUIGlow']:SetVertexColor(perc / 50, 1, 0, perc / 50)
        elseif perc >= 50 then
            _G['TWThreatDisplayTargetPFUIGlow']:SetVertexColor(1, 1 - (perc - 50) / 50, 0, 1)
        end

        _G['TWThreatDisplayTargetPFUIGlow']:Show()
    else
        _G['TWThreatDisplayTargetPFUIGlow']:Hide()
    end

    if TWT_CONFIG.perc then

        if TWT_CONFIG.tankMode then
            _G['TWThreatDisplayTargetNumericBG']:SetPoint('TOPLEFT', 24, -7)
            _G['TWThreatDisplayTargetNumericBG']:SetWidth(79)
            _G['TWThreatDisplayTargetNumericBorder']:SetPoint('TOPLEFT', 20, -3)
            _G['TWThreatDisplayTargetNumericBorder']:SetWidth(128)
            _G['TWThreatDisplayTargetNumericBorder']:SetTexture('Interface\\addons\\TWThreat\\images\\numericthreatborder_wide')
            _G['TWThreatDisplayTargetNumericPerc']:SetPoint('TOPLEFT', -1, 3)
            _G['TWThreatDisplayTargetNumericPerc']:SetWidth(128)
        else
            _G['TWThreatDisplayTargetNumericBG']:SetPoint('TOPLEFT', 44, -7)
            _G['TWThreatDisplayTargetNumericBG']:SetWidth(36)
            _G['TWThreatDisplayTargetNumericBorder']:SetPoint('TOPLEFT', 38, -3)
            _G['TWThreatDisplayTargetNumericBorder']:SetWidth(64)
            _G['TWThreatDisplayTargetNumericBorder']:SetTexture('Interface\\addons\\TWThreat\\images\\numericthreatborder')
            _G['TWThreatDisplayTargetNumericPerc']:SetPoint('TOPLEFT', 31, 3)
            _G['TWThreatDisplayTargetNumericPerc']:SetWidth(64)
        end

        local tankModePerc = 0

        if TWT_CONFIG.tankMode then
            local second = ''
            local index = 0
            for name, data in TWT.ohShitHereWeSortAgain(TWT.threats, true) do
                index = index + 1
                if index == 3 then
                    tankModePerc = TWT.round(data.perc)
                    second = TWT.unitNameForTitle(name, 6) .. ' ' .. tankModePerc .. '%'
                    break
                    --TWT.classColors[TWT.getClass(name)].c ..
                end
            end
            if second ~= '' then
                _G['TWThreatDisplayTargetNumericPerc']:SetText(second)
            else
                _G['TWThreatDisplayTargetNumericPerc']:SetText(perc .. '%')
            end
        else
            _G['TWThreatDisplayTargetNumericPerc']:SetText(perc .. '%')
        end

        if tankModePerc ~= 0 then
            perc = tankModePerc
        end

        if perc >= 0 and perc < 50 then
            _G['TWThreatDisplayTargetNumericBG']:SetVertexColor(perc / 50, 1, 0, 1)
        elseif perc >= 50 then
            _G['TWThreatDisplayTargetNumericBG']:SetVertexColor(1, 1 - (perc - 50) / 50, 0)
        end

        _G['TWThreatDisplayTargetNumericPerc']:Show()
        _G['TWThreatDisplayTargetNumericBG']:Show()
        _G['TWThreatDisplayTargetNumericBorder']:Show()
    else
        _G['TWThreatDisplayTargetNumericPerc']:Hide()
        _G['TWThreatDisplayTargetNumericBG']:Hide()
        _G['TWThreatDisplayTargetNumericBorder']:Hide()
    end

    if TWT_CONFIG.percPFUI and _G['pfTarget'] then

        local offset = 0
        if TWT_CONFIG.percPFUIbottom then
            offset = -_G['pfTarget']:GetHeight() - 32 / 2
        end

        if TWT_CONFIG.tankMode then
            _G['TWThreatDisplayTargetPFUINumericBG']:SetPoint('TOPLEFT', 0, 18 + offset)
            _G['TWThreatDisplayTargetPFUINumericBG']:SetWidth(76)
            _G['TWThreatDisplayTargetPFUINumericBorder']:SetPoint('TOPLEFT', -6, 19 + offset)
            _G['TWThreatDisplayTargetPFUINumericBorder']:SetTexture('Interface\\addons\\TWThreat\\images\\numericthreatborder_pfui_wide')
            _G['TWThreatDisplayTargetPFUINumericPerc']:SetPoint('TOPLEFT', -26, 25 + offset)
            _G['TWThreatDisplayTargetPFUINumericPerc']:SetWidth(128)
        else
            _G['TWThreatDisplayTargetPFUINumericBG']:SetPoint('TOPLEFT', 0, 18 + offset)
            _G['TWThreatDisplayTargetPFUINumericBG']:SetWidth(37)
            _G['TWThreatDisplayTargetPFUINumericBorder']:SetPoint('TOPLEFT', -6, 19 + offset)
            _G['TWThreatDisplayTargetPFUINumericBorder']:SetTexture('Interface\\addons\\TWThreat\\images\\numericthreatborder_pfui')
            _G['TWThreatDisplayTargetPFUINumericPerc']:SetPoint('TOPLEFT', -12, 25 + offset)
            _G['TWThreatDisplayTargetPFUINumericPerc']:SetWidth(64)
        end

        local tankModePerc = 0

        if TWT_CONFIG.tankMode then
            local second = ''
            local index = 0
            for name, data in TWT.ohShitHereWeSortAgain(TWT.threats, true) do
                index = index + 1
                if index == 3 then
                    tankModePerc = TWT.round(data.perc)
                    second = TWT.unitNameForTitle(name, 6) .. ' ' .. tankModePerc .. '%'
                    break
                end
            end
            if second ~= '' then
                _G['TWThreatDisplayTargetPFUINumericPerc']:SetText(second)
            else
                _G['TWThreatDisplayTargetPFUINumericPerc']:SetText(perc .. '%')
            end
        else
            _G['TWThreatDisplayTargetPFUINumericPerc']:SetText(perc .. '%')
        end

        if tankModePerc ~= 0 then
            perc = tankModePerc
        end

        if perc >= 0 and perc < 50 then
            _G['TWThreatDisplayTargetPFUINumericBG']:SetVertexColor(perc / 50, 1, 0, 1)
        elseif perc >= 50 then
            _G['TWThreatDisplayTargetPFUINumericBG']:SetVertexColor(1, 1 - (perc - 50) / 50, 0)
        end

        _G['TWThreatDisplayTargetPFUINumericPerc']:Show()
        _G['TWThreatDisplayTargetPFUINumericBG']:Show()
        _G['TWThreatDisplayTargetPFUINumericBorder']:Show()
    else
        _G['TWThreatDisplayTargetPFUINumericPerc']:Hide()
        _G['TWThreatDisplayTargetPFUINumericBG']:Hide()
        _G['TWThreatDisplayTargetPFUINumericBorder']:Hide()
    end

end

function TWTMainWindow_Resizing()
    _G['TWTMain']:SetAlpha(0.4)
end

function TWTMainMainWindow_Resized()
    _G['TWTMain']:SetAlpha(UnitAffectingCombat('player') and TWT_CONFIG.combatAlpha or TWT_CONFIG.oocAlpha)

    TWT_CONFIG.visibleBars = TWT.round((_G['TWTMain']:GetHeight() - (TWT_CONFIG.labelRow and 40 or 20)) / TWT_CONFIG.barHeight)
    TWT_CONFIG.visibleBars = TWT_CONFIG.visibleBars < 4 and 4 or TWT_CONFIG.visibleBars

    FrameHeightSlider_OnValueChanged()
end

function FrameHeightSlider_OnValueChanged()
    TWT_CONFIG.barHeight = _G['TWTMainSettingsFrameHeightSlider']:GetValue()

    _G['TWTMain']:SetHeight(TWT_CONFIG.barHeight * TWT_CONFIG.visibleBars + (TWT_CONFIG.labelRow and 40 or 20))

    TWT.setMinMaxResize()
    TWT.updateUI('FrameHeightSlider_OnValueChanged')
end

function WindowScaleSlider_OnValueChanged()
    TWT_CONFIG.windowScale = _G['TWTMainSettingsWindowScaleSlider']:GetValue()

    local x, y = _G['TWTMain']:GetLeft(), _G['TWTMain']:GetTop()
    local sx, sy = _G['TWTMainTankModeWindow']:GetLeft(), _G['TWTMainTankModeWindow']:GetTop()
    local s = _G['TWTMain']:GetEffectiveScale()
    local ss = _G['TWTMainTankModeWindow']:GetEffectiveScale()
    local posX, posY
    local sposX, sposY

    if x and y and s then
        x, y = x * s, y * s
        posX = x
        posY = y
    end
    if sx and sy and ss then
        sx, sy = sx * ss, sy * ss
        sposX = sx
        sposY = sy
    end

    _G['TWTMain']:SetScale(TWT_CONFIG.windowScale)
    _G['TWTMainTankModeWindow']:SetScale(TWT_CONFIG.windowScale)

    s = _G['TWTMain']:GetEffectiveScale()
    ss = _G['TWTMainTankModeWindow']:GetEffectiveScale()
    posX, posY = posX / s, posY / s
    sposX, sposY = sposX / ss, sposY / ss
    _G['TWTMain']:ClearAllPoints()
    _G['TWTMainTankModeWindow']:ClearAllPoints()
    _G['TWTMain']:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", posX, posY)
    _G['TWTMainTankModeWindow']:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", sposX, sposY)

    if TWT_CONFIG.tankModeStick ~= 'Free' then
        TWTTankModeWindowChangeStick_OnClick(TWT_CONFIG.tankModeStick)
    end
end

function CombatOpacitySlider_OnValueChanged()
    TWT_CONFIG.combatAlpha = _G['TWTMainSettingsCombatAlphaSlider']:GetValue()
    _G['TWTMain']:SetAlpha(UnitAffectingCombat('player') and TWT_CONFIG.combatAlpha or TWT_CONFIG.oocAlpha)
end

function OOCombatSlider_OnValueChanged()
    TWT_CONFIG.oocAlpha = _G['TWTMainSettingsOOCAlphaSlider']:GetValue()
    _G['TWTMain']:SetAlpha(UnitAffectingCombat('player') and TWT_CONFIG.combatAlpha or TWT_CONFIG.oocAlpha)
end

function AggroThresholdSlider_OnValueChanged()
    TWT_CONFIG.aggroThreshold = _G['TWTMainSettingsAggroThresholdSlider']:GetValue()
end

function TWTChangeSetting_OnClick(checked, code)
    if code == 'lock' then
        checked = not TWT_CONFIG[code]
        if checked then
            _G['TWTMainLockButton']:SetNormalTexture('Interface\\addons\\TWThreat\\images\\icon_locked')
        else
            _G['TWTMainLockButton']:SetNormalTexture('Interface\\addons\\TWThreat\\images\\icon_unlocked')
        end
    end
    TWT_CONFIG[code] = checked
    if code == 'tankMode' then
        if checked then
            TWT.testBars(true)
            TWT_CONFIG.fullScreenGlow = false
            TWT_CONFIG.aggroSound = false
            _G['TWTMainSettingsFullScreenGlow']:SetChecked(TWT_CONFIG.fullScreenGlow)
            _G['TWTMainSettingsFullScreenGlow']:Disable()
            _G['TWTMainSettingsAggroSound']:SetChecked(TWT_CONFIG.fullScreenGlow)
            _G['TWTMainSettingsAggroSound']:Disable()

            _G['TWTMainTankModeWindowStickTopButton']:Show()
            _G['TWTMainTankModeWindowStickRightButton']:Show()
            _G['TWTMainTankModeWindowStickBottomButton']:Show()
            _G['TWTMainTankModeWindowStickLeftButton']:Show()

            _G['TWTMainTankModeWindow']:Show()
        else
            _G['TWTMainSettingsFullScreenGlow']:Enable()
            _G['TWTMainSettingsAggroSound']:Enable()
            _G['TWTMainTankModeWindow']:Hide()
        end
    end
    if code == 'aggroSound' and checked and not UnitAffectingCombat('player') then
        PlaySoundFile('Interface\\addons\\TWThreat\\sounds\\warn.ogg')
    end

    if code == 'fullScreenGlow' and checked and not UnitAffectingCombat('player') then
        TWT.glowFader:Show()
    end

    if code == 'percPFUItop' then
        TWT_CONFIG.percPFUIbottom = false
        _G['TWTMainSettingsPercNumbersPFUIbottom']:SetChecked(TWT_CONFIG.percPFUIbottom)
    end
    if code == 'percPFUIbottom' then
        TWT_CONFIG.percPFUItop = false
        _G['TWTMainSettingsPercNumbersPFUItop']:SetChecked(TWT_CONFIG.percPFUItop)
    end

    TWT.setColumnLabels()

    if TWT_CONFIG.labelRow then
        _G['TWTMainBarsBG']:SetPoint('TOPLEFT', 1, -40)
        _G['TWTMainNameLabel']:Show()
    else
        _G['TWTMainBarsBG']:SetPoint('TOPLEFT', 1, -20)
        _G['TWTMainNameLabel']:Hide()
        _G['TWTMainTPSLabel']:Hide()
        _G['TWTMainThreatLabel']:Hide()
        _G['TWTMainPercLabel']:Hide()
    end

    FrameHeightSlider_OnValueChanged()

    TWT.updateUI('TWTChangeSetting_OnClick')
end

function TWT.setColumnLabels()
    _G['TWTMain']:SetWidth(TWT.windowStartWidth - 70 - 70 - 70)

    TWT.nameLimit = 5

    if TWT_CONFIG.colPerc then
        _G['TWTMainPercLabel']:Show()
        _G['TWTMain']:SetWidth(_G['TWTMain']:GetWidth() + 70)
        TWT.nameLimit = TWT.nameLimit + 8
    else
        _G['TWTMainPercLabel']:Hide()
    end

    if TWT_CONFIG.colThreat then
        _G['TWTMain']:SetWidth(_G['TWTMain']:GetWidth() + 70)
        TWT.nameLimit = TWT.nameLimit + 8

        if TWT_CONFIG.colPerc then
            _G['TWTMainThreatLabel']:SetPoint('TOPRIGHT', _G['TWTMain'], -10 - 70 - 5, -21)
        else
            _G['TWTMainThreatLabel']:SetPoint('TOPRIGHT', _G['TWTMain'], -10, -21)
        end

        _G['TWTMainThreatLabel']:Show()
    else
        _G['TWTMainThreatLabel']:Hide()
    end

    if TWT_CONFIG.colTPS then
        _G['TWTMain']:SetWidth(_G['TWTMain']:GetWidth() + 70)
        TWT.nameLimit = TWT.nameLimit + 8

        if TWT_CONFIG.colThreat then
            if TWT_CONFIG.colPerc then
                _G['TWTMainTPSLabel']:SetPoint('TOPRIGHT', _G['TWTMain'], -10 - 70 - 70, -21)
            else
                _G['TWTMainTPSLabel']:SetPoint('TOPRIGHT', _G['TWTMain'], -10 - 70, -21)
            end
        elseif TWT_CONFIG.colPerc then
            _G['TWTMainTPSLabel']:SetPoint('TOPRIGHT', _G['TWTMain'], -10 - 70, -21)
        else
            _G['TWTMainTPSLabel']:SetPoint('TOPRIGHT', _G['TWTMain'], 'TOPRIGHT', -10, -21)
        end

        _G['TWTMainTPSLabel']:Show()
    else
        _G['TWTMainTPSLabel']:Hide()
    end

    if TWT.nameLimit < 14 then
        TWT.nameLimit = 14
    end

    if _G['TWTMain']:GetWidth() < 190 then
        _G['TWTMain']:SetWidth(190)
    end

    TWT.windowWidth = _G['TWTMain']:GetWidth()

    TWT.setMinMaxResize()
end

function TWT.setMinMaxResize()
    _G['TWTMain']:SetMinResize(TWT.windowWidth, TWT_CONFIG.barHeight * TWT.minBars + (TWT_CONFIG.labelRow and 40 or 20))
    _G['TWTMain']:SetMaxResize(TWT.windowWidth, TWT_CONFIG.barHeight * TWT.maxBars + (TWT_CONFIG.labelRow and 40 or 20))
end

function TWT.setBarLabels(perc, threat, tps)

    if TWT_CONFIG.colPerc then
        perc:Show()
    else
        perc:Hide()
    end

    if TWT_CONFIG.colThreat then

        if TWT_CONFIG.colPerc then
            threat:SetPoint('RIGHT', -10 - 70 + 4, 0)
        else
            threat:SetPoint('RIGHT', -10 + 4, 0)
        end

        threat:Show()
    else
        threat:Hide()
    end

    if TWT_CONFIG.colTPS then

        if TWT_CONFIG.colThreat then
            if TWT_CONFIG.colPerc then
                tps:SetPoint('RIGHT', -10 - 70 - 70 + 4, 0)
            else
                tps:SetPoint('RIGHT', -10 - 70 + 4, 0)
            end
        elseif TWT_CONFIG.colPerc then
            tps:SetPoint('RIGHT', -10 - 70 + 4, 0)
        else
            tps:SetPoint('RIGHT', -10 + 4, 0)
        end

        tps:Show()
    else
        tps:Hide()
    end

end

function TWT.testBars(show)

    if UnitAffectingCombat('player') then
        return false
    end

    if show then
        TWT.roles['Tenk'] = 'ability_warrior_defensivestance'
        TWT.roles['Chad'] = 'spell_holy_auraoflight'
        TWT.roles[TWT.name] = 'ability_hunter_pet_turtle'
        TWT.roles['Olaf'] = 'ability_racial_bearform'
        TWT.roles['Jimmy'] = 'ability_backstab'
        TWT.roles['Miranda'] = 'spell_shadow_shadowwordpain'
        TWT.roles['Karen'] = 'spell_holy_powerinfusion'
        TWT.roles['Felix'] = 'spell_fire_sealoffire'
        TWT.roles['Tom'] = 'spell_shadow_shadowbolt'
        TWT.roles['Bill'] = 'ability_marksmanship'
        TWT.threats = {
            [TWT.AGRO] = {
                class = 'agro', threat = 1100, perc = 110, tps = '',
                history = {}, melee = true, tank = false
            },
            ['Tenk'] = {
                class = 'warrior', threat = 1000, perc = 100, tps = 100,
                history = {}, melee = true, tank = true },
            ['Chad'] = {
                class = 'paladin', threat = 990, perc = 99, tps = 99,
                history = {}, melee = true, tank = false },
            [TWT.name] = {
                class = TWT.class, threat = 750, perc = 75, tps = 75,
                history = {}, melee = false, tank = false
            },
            ['Olaf'] = {
                class = 'druid', threat = 700, perc = 70, tps = 70,
                history = {}, melee = true, tank = false
            },
            ['Jimmy'] = {
                class = 'rogue', threat = 500, perc = 50, tps = 50,
                history = {}, melee = true, tank = false
            },
            ['Miranda'] = {
                class = 'priest', threat = 450, perc = 45, tps = 45,
                history = {}, melee = false, tank = false
            },
            ['Karen'] = {
                class = 'priest', threat = 400, perc = 40, tps = 40,
                history = {}, melee = true, tank = false
            },
            ['Felix'] = {
                class = 'mage', threat = 350, perc = 35, tps = 35,
                history = {}, melee = false, tank = false
            },
            ['Tom'] = {
                class = 'warlock', threat = 250, perc = 25, tps = 25,
                history = {}, melee = false, tank = false
            },
            ['Bill'] = {
                class = 'hunter', threat = 100, perc = 10, tps = 10,
                history = {}, melee = false, tank = false
            }
        }

        TWT.tankModeThreats = {
            [1] = {
                creature = 'Infectious Ghoul',
                name = 'Bob',
                perc = 78
            },
            [2] = {
                creature = 'Venom Stalker',
                name = 'Alice',
                perc = 95
            },
            [3] = {
                creature = 'Living Monstrosity',
                name = 'Chad',
                perc = 52
            },
            [4] = {
                creature = 'Deathknight Captain',
                name = 'Olaf',
                perc = 81
            },
            [5] = {
                creature = 'Patchwerk TEST',
                name = 'Jimmy',
                perc = 12
            },
        }

        TWT.targetChanged()

        TWT.targetName = "Patchwerk TEST"

        TWT.updateUI('testBars')
    else
        TWT.combatEnd()
    end
end
function TWTCloseButton_OnClick()
    _G['TWTMain']:Hide()
    twtprint('Window closed. Type |cff69ccf0/twt show|cffffffff or |cff69ccf0/twtshow|cffffffff to restore it.')
    TWT_CONFIG.visible = false
end

function TWTTankModeWindowCloseButton_OnClick()
    twtprint('Tank Mode disabled. Type |cff69ccf0/twt tankmode|cffffffff to enable it or go into settings.')
    TWTChangeSetting_OnClick(false, 'tankMode')
    _G['TWTMainSettingsTankMode']:SetChecked(false)
end

function TWTTankModeWindowChangeStick_OnClick(to)
    if to then
        TWT_CONFIG.tankModeStick = to
    end
    if TWT_CONFIG.tankModeStick == 'Top' then
        _G['TWTMainTankModeWindow']:ClearAllPoints()
        _G['TWTMainTankModeWindow']:SetPoint('BOTTOMLEFT', _G['TWTMain'], 'TOPLEFT', 0, 1)
    elseif TWT_CONFIG.tankModeStick == 'Right' then
        _G['TWTMainTankModeWindow']:ClearAllPoints()
        _G['TWTMainTankModeWindow']:SetPoint('TOPLEFT', _G['TWTMain'], 'TOPRIGHT', 1, 0)
    elseif TWT_CONFIG.tankModeStick == 'Bottom' then
        _G['TWTMainTankModeWindow']:ClearAllPoints()
        _G['TWTMainTankModeWindow']:SetPoint('TOPLEFT', _G['TWTMain'], 'BOTTOMLEFT', 0, -1)
    elseif TWT_CONFIG.tankModeStick == 'Left' then
        _G['TWTMainTankModeWindow']:ClearAllPoints()
        _G['TWTMainTankModeWindow']:SetPoint('TOPRIGHT', _G['TWTMain'], 'TOPLEFT', -1, 0)
    end
end

function TWTSettingsToggle_OnClick()
    if _G['TWTMainSettings']:IsVisible() == 1 then
        _G['TWTMainSettings']:Hide()
        TWT.testBars(false)

        _G['TWTMainTankModeWindowStickTopButton']:Hide()
        _G['TWTMainTankModeWindowStickRightButton']:Hide()
        _G['TWTMainTankModeWindowStickBottomButton']:Hide()
        _G['TWTMainTankModeWindowStickLeftButton']:Hide()

    else
        _G['TWTMainSettings']:Show()

        if TWT_CONFIG.tankMode then
            TWTTankModeWindowChangeStick_OnClick()
            _G['TWTMainTankModeWindowStickTopButton']:Show()
            _G['TWTMainTankModeWindowStickRightButton']:Show()
            _G['TWTMainTankModeWindowStickBottomButton']:Show()
            _G['TWTMainTankModeWindowStickLeftButton']:Show()
        end

        TWT.testBars(true)
    end
end

function TWTFontButton_OnClick()
    if _G['TWTMainSettingsFontList']:IsVisible() then
        _G['TWTMainSettingsFontList']:Hide()
    else
        _G['TWTMainSettingsFontList']:Show()
    end
end

function TWTFontSelect(id)
    TWT_CONFIG.font = TWT.fonts[id]
    _G['TWTMainSettingsFontButton']:SetText(TWT_CONFIG.font)
    TWT.updateUI('TWTFontSelect')
end

function TWTTargetButton_OnClick(index)

    if TWT.tankModeThreats[__parsestring(index)] then
        AssistByName(TWT.tankModeThreats[__parsestring(index)].name)
        return true
    end

    twtprint('Cannot target tankmode target.')

    return false
end

function __explode(str, delimiter)
    local result = {}
    local from = 1
    local delim_from, delim_to = __find(str, delimiter, from, 1, true)
    while delim_from do
        __tinsert(result, __substr(str, from, delim_from - 1))
        from = delim_to + 1
        delim_from, delim_to = __find(str, delimiter, from, true)
    end
    __tinsert(result, __substr(str, from))
    return result
end

function TWT.ohShitHereWeSortAgain(t, reverse)
    local a = {}
    for n, l in __pairs(t) do
        __tinsert(a, { ['threat'] = l.threat, ['perc'] = l.perc, ['tps'] = l.tps, ['name'] = n })
    end
    if reverse then
        __tsort(a, function(b, c)
            return b['perc'] > c['perc']
        end)
    else
        __tsort(a, function(b, c)
            return b['perc'] < c['perc']
        end)
    end

    local i = 0 -- iterator variable
    local iter = function()
        -- iterator function
        i = i + 1
        if a[i] == nil then
            return nil
        else
            return a[i]['name'], t[a[i]['name']]
        end
    end
    return iter
end

function TWT.formatNumber(n)

    if n < 0 then
        n = 0
    end

    if n < 999 then
        return TWT.round(n)
    end
    if n < 999999 then
        return TWT.round(n / 10) / 100 .. 'K' or 0
    end
    --1,000,000
    return TWT.round(n / 10000) / 100 .. 'M' or 0
end

function TWT.tableSize(t)
    local size = 0
    for _, _ in next, t do
        size = size + 1
    end
    return size
end

function TWT.targetFromName(name)
    if name == TWT.name then
        return 'target'
    end
    if TWT.channel == 'RAID' then
        for i = 0, GetNumRaidMembers() do
            if GetRaidRosterInfo(i) then
                local n = GetRaidRosterInfo(i)
                if n == name then
                    return 'raid' .. i
                end
            end
        end
    end
    if TWT.channel == 'PARTY' then
        if GetNumPartyMembers() > 0 then
            for i = 1, GetNumPartyMembers() do
                if UnitName('party' .. i) then
                    if name == UnitName('party' .. i) then
                        return 'party' .. i
                    end
                end
            end
        end
    end

    return 'target'
end

function TWT.unitNameForTitle(name, limit)
    limit = limit or TWT.nameLimit
    if __strlen(name) > limit then
        return __substr(name, 1, limit) .. ' '
    end
    return name
end

function TWT.targetRaidIcon(iconIndex)

    for i = 1, GetNumRaidMembers() do
        if TWT.targetRaidSymbolFromUnit("raid" .. i, iconIndex) then
            return true
        end
    end
    for i = 1, GetNumPartyMembers() do
        if TWT.targetRaidSymbolFromUnit("party" .. i, iconIndex) then
            return true
        end
    end
    if TWT.targetRaidSymbolFromUnit("player", iconIndex) then
        return true
    end
    return false
end

function TWT.updateTitleBarText(text)
    if not text then
        _G['TWTMainTitle']:SetText(TWT.addonName .. ' |cffabd473v' .. TWT.addonVer)
        return true
    end
    _G['TWTMainTitle']:SetText(text)
end


-- https://github.com/shagu/pfUI/blob/master/api/api.lua#L596
function TWT.wipe(src)
    -- notes: table.insert, table.remove will have undefined behavior
    -- when used on tables emptied this way because Lua removes nil
    -- entries from tables after an indeterminate time.
    -- Instead of table.insert(t,v) use t[table.getn(t)+1]=v as table.getn collapses nil entries.
    -- There are no issues with hash tables, t[k]=v where k is not a number behaves as expected.
    local mt = getmetatable(src) or {}
    if mt.__mode == nil or mt.__mode ~= "kv" then
        mt.__mode = "kv"
        src = setmetatable(src, mt)
    end
    for k in __pairs(src) do
        src[k] = nil
    end
    return src
end

TWT.hooks = {}
--https://github.com/shagu/pfUI/blob/master/compat/vanilla.lua#L37
function TWT.hooksecurefunc(name, func, append)
    if not _G[name] then
        return
    end

    TWT.hooks[__parsestring(func)] = {}
    TWT.hooks[__parsestring(func)]["old"] = _G[name]
    TWT.hooks[__parsestring(func)]["new"] = func

    if append then
        TWT.hooks[__parsestring(func)]["function"] = function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
            TWT.hooks[__parsestring(func)]["old"](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
            TWT.hooks[__parsestring(func)]["new"](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
        end
    else
        TWT.hooks[__parsestring(func)]["function"] = function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
            TWT.hooks[__parsestring(func)]["new"](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
            TWT.hooks[__parsestring(func)]["old"](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
        end
    end

    _G[name] = TWT.hooks[__parsestring(func)]["function"]
end

function TWT.pairsByKeys(t, f)
    local a = {}
    for n in __pairs(t) do
        __tinsert(a, n)
    end
    __tsort(a, function(a, b)
        return a < b
    end)
    local i = 0 -- iterator variable
    local iter = function()
        -- iterator function
        i = i + 1
        if a[i] == nil then
            return nil
        else
            return a[i], t[a[i]]
        end
    end
    return iter
end

function TWT.round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return __floor(num * mult + 0.5) / mult
end

function TWT.version(ver)
    local verEx = __explode(ver, '.')

    if verEx[3] then
        -- new versioning with 3 numbers
        return __parseint(verEx[1]) * 100 +
                __parseint(verEx[2]) * 10 +
                __parseint(verEx[3]) * 1
    end

    -- old versioning
    return __parseint(verEx[1]) * 10 +
            __parseint(verEx[2]) * 1

end

function TWT.sendMyVersion()
    SendAddonMessage(TWT.prefix, "TWTVersion:" .. TWT.addonVer, "PARTY")
    SendAddonMessage(TWT.prefix, "TWTVersion:" .. TWT.addonVer, "GUILD")
    SendAddonMessage(TWT.prefix, "TWTVersion:" .. TWT.addonVer, "RAID")
    SendAddonMessage(TWT.prefix, "TWTVersion:" .. TWT.addonVer, "BATTLEGROUND")
end
