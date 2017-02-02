

    local faction = UnitFactionGroup'player'
    local cities  = {
         'Stormwind City', 'Ironforge', 'Darnassus',
         'Orgrimmar', 'Undercity', 'Thunder Bluff' }

    local enable = function()
        local bu = CreateFrame('Frame', 'modbmap_border', BattlefieldMinimap)
        bu:SetPoint('TOPLEFT', BattlefieldMinimap2, -2, 0)
        bu:SetPoint('BOTTOMRIGHT', BattlefieldMinimap11, 0, 20)

        modSkin(bu, 16)
        modSkinPadding(bu, 2)
        modSkinColor(bu, .2, .2, .2)

        for _, v in pairs ({
            BattlefieldMinimap1, BattlefieldMinimap5, BattlefieldMinimap9,
            BattlefieldMinimap4, BattlefieldMinimap8, BattlefieldMinimap12
        }) do
            v:Hide()
        end

        BattlefieldMinimap:SetScale(1.05)
        BattlefieldMinimap:SetPoint('TOPLEFT', BattlefieldMinimapTab, 'BOTTOMLEFT', -52, 0)
        BattlefieldMinimapCloseButton:SetScale(.8) BattlefieldMinimapCloseButton:SetPoint('TOPRIGHT', BattlefieldMinimap3)
        BattlefieldMinimapCorner:Hide()
        BattlefieldMinimapBackground:Hide()
    end

    local non_pvp = function()
        for i = 1, 12 do _G['BattlefieldMinimap'..i]:Hide() end
        BattlefieldMinimap:SetScale(1.6)
        BattlefieldMinimapCloseButton:SetScale(.7)
        BattlefieldMinimapCloseButton:SetAlpha(0)
        BattlefieldMinimapCloseButton:SetScript('OnEnter', function() this:SetAlpha(1) end)
        BattlefieldMinimapCloseButton:SetScript('OnLeave', function() this:SetAlpha(0) end)
        modSkinHide(_G['modbmap_border'])
    end

    local pvp = function()
        for i = 1, 12 do _G['BattlefieldMinimap'..i]:Show() end
        for _, v in pairs ({
            BattlefieldMinimap1, BattlefieldMinimap5, BattlefieldMinimap9,
            BattlefieldMinimap4, BattlefieldMinimap8, BattlefieldMinimap12
        }) do
            v:Hide()
        end
        BattlefieldMinimap:SetScale(1.05)
        BattlefieldMinimapCloseButton:SetScale(.8)
        BattlefieldMinimapCloseButton:SetAlpha(1)
        BattlefieldMinimapCloseButton:SetScript('OnEnter', nil)
        BattlefieldMinimapCloseButton:SetScript('OnLeave', nil)
        modSkinShow(_G['modbmap_border'])
    end

    local city = function(map)
        local nz = GetRealZoneText()
        for _, v in pairs(cities) do
            if string.find(nz, v) and map:IsVisible() then map:Hide() end
        end
    end

    local toggle = function()
        local map = BattlefieldMinimap
        local z   = GetZoneText()
        if  map:IsVisible() then
    		map:Hide()
    		SHOW_BATTLEFIELD_MINIMAP = '0'
    	else
            if z == 'Silithus' or z == 'Eastern Plaguelands' then
                SHOW_BATTLEFIELD_MINIMAP = '1'
    			map:Show()
                non_pvp()
    		elseif MiniMapBattlefieldFrame.status == 'active' or GetNumWorldStateUI() > 0 then
    			SHOW_BATTLEFIELD_MINIMAP = '1'
    			map:Show()
                pvp()
            else
                SHOW_BATTLEFIELD_MINIMAP = '1'
    			map:Show()
                non_pvp()
    		end
        end
        city(map)
    end

    local logic = function(name, blip, s)
        local alliancePick  = 'The Alliance (.+) was picked up by (.+)!'
        local allianceDrop  = 'The Alliance (.+) was dropped by (.+)!'
        local allianceCap   = 'captured the Alliance (.+)!'
        local hordePick     = 'The Horde (.+) was picked up by (.+)!'
        local hordeDrop     = 'The Horde (.+) was dropped by (.+)!'
        local hordeCap      = '(.+) captured the Horde (.+)!'
        if  string.find(s, alliancePick)
        or  string.find(s, '+ Alliance Flag') then
            local t     = gsub(s, alliancePick, '%2')
            local sub   = gsub(s, '+ (.+) Flag — (.+).', '%2')
            if name and (string.find(name, t) or string.find(name, sub)) then
                if not blip.fc then blip.fc = name end
                return 1
            end
        elseif
            string.find(s, hordePick)
        or  string.find(s, '+ Horde Flag') then
            local t     = gsub(s, hordePick, '%2')
            local sub   = gsub(s, '+ (.+) Flag — (.+).', '%2')
            if name and (string.find(name, t) or string.find(name, sub)) then
                if not blip.fc then blip.fc = name end
                return 1
            end
        elseif
            string.find(s, hordeDrop)
        or  string.find(s, '- Horde Flag —')
        or  string.find(s, hordeCap) then
            local d    = gsub(s, hordeDrop, '%2')
            local c    = gsub(s, hordeCap,  '%1')
            local sub  = gsub(s, '- Horde Flag — (.+).', '%1')
            if name and (string.find(name, d) or string.find(name, c) or string.find(name, sub)) then
                if blip.fc then blip.fc = nil end
                return 0
            end
        elseif
            string.find(s, allianceDrop)
        or  string.find(s, '- Alliance Flag —')
        or  string.find(s, allianceCap) then
            local d    = gsub(s, allianceDrop, '%2')
            local c    = gsub(s, allianceCap,  '%1')
            local sub  = gsub(s, '- Alliance Flag — (.+).', '%1')
            if name and (string.find(name, d) or string.find(name, c) or string.find(name, sub)) then
                if blip.fc then blip.fc = nil end
                return 0
            end
        end
    end

    local zone = function()
        local map = BattlefieldMinimap
        city(map)
        if MiniMapBattlefieldFrame.status == 'active' or GetNumWorldStateUI() > 0 then
             pvp()
        else non_pvp()
        end
        if map:IsVisible() then -- reset map tile
            map:Hide() map:Show()
        end
    end

    local blips = function(s)
        for i = 1, 40 do
            local blip = _G['BattlefieldMinimapRaid'..i]
            local icon = _G['BattlefieldMinimapRaid'..i..'Icon']
            local unit = blip.unit
            local name = blip.name or UnitName(blip.unit)
            if not name then break end

            blip:SetWidth(24) blip:SetHeight(24)

            if string.find(unit, 'raid', 1, true) then
                local _, _, subgroup = GetRaidRosterInfo(string.sub(unit, 5))
                local _, class  = UnitClass(unit)
                local colour = class and RAID_CLASS_COLORS[string.upper(class)] or {r = 1, g = .8, b = 0}
                local x = UnitFactionGroup'player' == 'Alliance' and 'Horde' or 'Alliance' -- reversey
                if s ~= nil then
                    local fc = logic(name, blip, s)
                    if fc == 1 then
                        icon:SetTexture('Interface\\WorldStateFrame\\'..x..'Flag')
                        icon:SetPoint('CENTER', 8, 8)
                        icon:SetVertexColor(1, 1, 1)
                    elseif fc == 0 then
                        icon:SetTexture(string.format([[Interface\AddOns\modui\map\blips\raid]]..'%d', subgroup))
                        icon:SetPoint('CENTER', 0, 0)
                        icon:SetVertexColor(colour.r, colour.g, colour.b)
                    end
                else
                    if  name ~= blip.fc then
                        icon:SetTexture(string.format([[Interface\AddOns\modui\map\blips\raid]]..'%d', subgroup))
                        icon:SetVertexColor(colour.r, colour.g, colour.b)
                    else    -- account for blips resetting with a new joinee?
                        icon:SetTexture('Interface\\WorldStateFrame\\'..x..'Flag')
                        icon:SetPoint('CENTER', 8, 8)
                        icon:SetVertexColor(1, 1, 1)
                    end
                end
            end
        end
    end

    local f = CreateFrame'Frame'
    f:RegisterEvent'ADDON_LOADED'
    f:SetScript('OnEvent', function()
        if f.loaded then
            if event == 'CHAT_MSG_BG_SYSTEM_HORDE'
            or event == 'CHAT_MSG_BG_SYSTEM_ALLIANCE' then
                local s = arg1 blips(s)
            elseif event == 'ZONE_CHANGED_NEW_AREA' then
                zone()
            else
                local s = nil  blips(s)
            end
        end
        if arg1 == 'Blizzard_BattlefieldMinimap' then
            if tonumber(GetCVar'modBattleMap') == 1 then
                local s = nil
                enable() blips(s)
                this:RegisterEvent'CHAT_MSG_BG_SYSTEM_ALLIANCE' this:RegisterEvent'CHAT_MSG_BG_SYSTEM_HORDE'
                this:RegisterEvent'RAID_ROSTER_UPDATE' this:RegisterEvent'ZONE_CHANGED_NEW_AREA'
                this:UnregisterEvent'ADDON_LOADED'
                function BattlefieldMinimap_Toggle() toggle() end
                f.loaded = true
            end
        end
    end)

    --
