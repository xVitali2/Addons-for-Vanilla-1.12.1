

    if tonumber(GetCVar'modWorldMap') == 0 then return end

    if IsAddOnLoaded'!Questie' then
        local bu = _G['Questie_Toggle']
        bu:SetHeight(22)
        bu:ClearAllPoints()
        bu:SetPoint('TOP', -217, -133)
    end

    local tieredDungeons = {
        ['blackwinglair']   = true,
        ['thedeadmines']    = true,
    }

    UIPanelWindows['WorldMapFrame'] = {area = 'center', pushable = 9}

        -- COORDINATES
    local coord = CreateFrame('Frame', nil, WorldMapButton)

    local player = coord:CreateFontString(nil, 'OVERLAY')
    player:SetFont(STANDARD_TEXT_FONT, 18, 'OUTLINE')
    player:SetShadowOffset(0, -0)
    player:SetJustifyH'LEFT'
    player:SetPoint('BOTTOMRIGHT', WorldMapButton, 'BOTTOM', -12, 12)
    player:SetTextColor(1, 1, 1)

    local cursor = coord:CreateFontString(nil, 'OVERLAY')
    cursor:SetFont(STANDARD_TEXT_FONT, 18, 'OUTLINE')
    cursor:SetShadowOffset(0, -0)
    cursor:SetJustifyH'LEFT'
    cursor:SetPoint('LEFT', player, 'RIGHT', 3, 0)
    cursor:SetTextColor(1, 1, 1)

    coord:SetScript('OnUpdate', function(self, elapsed)
        local width  = WorldMapDetailFrame:GetWidth()
        local height = WorldMapDetailFrame:GetHeight()
        local mx, my = WorldMapDetailFrame:GetCenter()
        local px, py = GetPlayerMapPosition'player'
        local cx, cy = GetCursorPosition()

        mx = ((cx/WorldMapDetailFrame:GetEffectiveScale()) - (mx - width/2))/width
        my = ((my + height/2) - (cy/WorldMapDetailFrame:GetEffectiveScale()))/height

        if mx >= 0 and my >= 0 and mx <= 1 and my <= 1 then
            cursor:SetText('•  Mouse'..format(': %.0f / %.0f', mx*100, my*100))
        else
            cursor:SetText''
        end

        if px ~= 0 and py ~= 0 then
            player:SetText(PLAYER..format(': %.0f / %.0f', px*100, py*100))
        else
            player:SetText'X / X'
        end
    end)

        -- INSTANCE MAPS
    local dungeon = CreateFrame('Frame', nil, WorldMapFrame)
    dungeon:SetPoint('TOPLEFT', WorldMapButton) dungeon:SetPoint('BOTTOMRIGHT', WorldMapButton)
    dungeon:SetFrameLevel(2)

    for i = 1, 12 do
        local d12 = dungeon:CreateTexture('moddungeonmap'..i, 'OVERLAY')
        d12:SetWidth(256) d12:SetHeight(256)
        d12:Hide()
    end

    _G['moddungeonmap1']:SetPoint('TOPLEFT',  WorldMapButton, 0, 0)
    _G['moddungeonmap2']:SetPoint('TOPLEFT',  _G['moddungeonmap1'],  'TOPRIGHT')
    _G['moddungeonmap3']:SetPoint('TOPLEFT',  _G['moddungeonmap2'],  'TOPRIGHT')
    _G['moddungeonmap4']:SetPoint('TOPLEFT',  _G['moddungeonmap3'],  'TOPRIGHT')
    _G['moddungeonmap5']:SetPoint('TOPLEFT',  _G['moddungeonmap1'],  'BOTTOMLEFT')
    _G['moddungeonmap6']:SetPoint('TOPLEFT',  _G['moddungeonmap5'],  'TOPRIGHT')
    _G['moddungeonmap7']:SetPoint('TOPLEFT',  _G['moddungeonmap6'],  'TOPRIGHT')
    _G['moddungeonmap8']:SetPoint('TOPLEFT',  _G['moddungeonmap7'],  'TOPRIGHT')
    _G['moddungeonmap9']:SetPoint('TOPLEFT',  _G['moddungeonmap5'],  'BOTTOMLEFT')
    _G['moddungeonmap10']:SetPoint('TOPLEFT', _G['moddungeonmap9'],  'TOPRIGHT')
    _G['moddungeonmap11']:SetPoint('TOPLEFT', _G['moddungeonmap10'], 'TOPRIGHT')
    _G['moddungeonmap12']:SetPoint('TOPLEFT', _G['moddungeonmap11'], 'TOPRIGHT')

    local dungeonblips = function(hide)
        if hide then
            for i = 1, 4 do
                local f = _G['WorldMapParty'..i..'Icon']
                f:SetAlpha(0)
            end
            for i = 1,40 do
                local f = _G['WorldMapRaid'..i..'Icon']
                f:SetAlpha(0)
            end
        else
            for i = 1,12 do _G['moddungeonmap'..i]:Hide() end
            for i = 1, 4 do
                local f = _G['WorldMapParty'..i..'Icon']
                f:SetAlpha(1)
            end
            for i = 1,40 do
                local f = _G['WorldMapRaid'..i..'Icon']
                f:SetAlpha(1)
            end
        end
    end

    local dungeonsubzone = function(z, sz)
        if z == 'blackwinglair' then
            if sz == 'dragonmawgarrison' or sz == 'shadowwinglair' then
                return '1'
            elseif sz == 'hallsofstrife' then
                return '2'
            elseif sz == 'crimsonlaboratories' then
                return '3'
            elseif sz == 'nefarianslair' then
                return '4'
            else
                return ''
            end
        elseif z == 'thedeadmines' then
            if sz == 'ironcladcove' or sz == 'goblinfoundry' then
                return '2'
            else
                return '1'
            end
        end
    end

    local dungeonmap = function(z)
        if tieredDungeons[z] then
            local sz = string.lower(GetSubZoneText())
            sz = string.gsub(sz, '%W', '')
            if sz then
                for i = 1, 12 do
                    local d12 = _G['moddungeonmap'..i]
                    d12:SetTexture('Interface\\AddOns\\modui\\map\\instances\\'..z..'\\'..dungeonsubzone(z, sz)..'\\'..z..i)
                    d12:Show()
                end
            end
        else
            for i = 1, 12 do
                local d12 = _G['moddungeonmap'..i]
                d12:SetTexture('Interface\\AddOns\\modui\\map\\instances\\'..z..'\\'..z..i)
                d12:Show()
            end
        end
    end

    local dungeoncheck = function()
        if tonumber(GetCVar'modDungeonMap') == 1 then
            local x, y = GetPlayerMapPosition'player'
            local z = string.lower(GetZoneText())
            z = string.gsub(z, '%W', '')
            if (x or y) == 0 then
                dungeonblips(true)
                dungeonmap(z)
                for _, v in pairs({WorldMapFrameAreaLabel, WorldMapFrameAreaDescription, coord}) do v:Hide() end
            else
                dungeonblips(false)
                for _, v in pairs({WorldMapFrameAreaLabel, WorldMapFrameAreaDescription, coord}) do v:Show() end
            end
        end
    end


        -- BLIPS
    local groupSize, groupType, frame
    local _, subgroup, class, color

    local modColour = function(icon, unit)
        if not (icon and unit) then return end
        local _, name = UnitClass(unit)
        if not name then return end

        if string.find(unit, 'raid', 1, true) then         -- RAID GROUPS
            local _, _, subgroup = GetRaidRosterInfo(string.sub(unit, 5))
            if not subgroup then return end
            icon:SetTexture(string.format([[Interface\AddOns\modui\map\blips\raid]]..'%d', subgroup))
            icon:GetParent():SetWidth(30)
            icon:GetParent():SetHeight(30)
        end

        local t = RAID_CLASS_COLORS[name]
        if math.ceil(GetTime()) < .5 then
            if UnitAffectingCombat(unit) then       bu:SetVertexColor(.8, 0, 0)
            elseif MapUnit_IsInactive(unit) then    bu:SetVertexColor(1, .8, 0)
            elseif UnitIsDeadOrGhost(unit) then     bu:SetVertexColor(.2, .2, .2)
            end
        elseif t then
             icon:SetVertexColor(t.r, t.g, t.b)
        else icon:SetVertexColor(.8, .8, .8)
        end
    end

    local modUpdate = function()
        local name = this:GetName()..'Icon'
        local texture = _G[name]
        if texture then modColour(texture, this.unit) end
    end

    local modUnit = function(unit, state, isNormal)
        local f = _G[unit]
        local icon = _G[unit..'Icon']
        if state then
            f:SetScript('OnUpdate', modUpdate)
            if isNormal then
                icon:SetTexture[[Interface\AddOns\modui\map\blips\party]]
                icon:GetParent():SetWidth(30)
                icon:GetParent():SetHeight(30)
            end
        else
            f:SetScript('OnUpdate', function() MapUnit_OnUpdate(f) modUpdate(f) end)
            icon:SetTexture[[Interface\\WorldMap\\WorldMapPartyIcon]]
        end
    end

    for i = 1, 4 do modUnit(string.format('WorldMapParty%d', i), true, true) end
    for i = 1,40 do modUnit(string.format('WorldMapRaid%d', i), true) end

    WorldMapFrame:SetScript('OnShow', function()
        this:SetScale(.8) this:EnableKeyboard(false)
        BlackoutWorld:Hide()
        UpdateMicroButtons() SetMapToCurrentZone()
        PlaySound'igQuestLogOpen' CloseDropDownMenus()
        dungeoncheck()
        WorldMapFrame_PingPlayerPosition()
    end)

    --
