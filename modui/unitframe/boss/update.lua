

    if tonumber(GetCVar'modUnitFrame') == 0 then return end

    local f = CreateFrame'Frame'
    local bossInterval, bossRefresh = 3, 0
    local bossList = {}

    local UnitStored = function(unit)
        for i, v in pairs(bossList) do
            if i == UnitName(unit) then return true end
        end
    end

    local verifyUnitInfo = function(unit, index)
    	if UnitExists(unit) and not UnitIsPlayer(unit) and not UnitStored(unit) then
            local n = UnitName(unit)
            local c = UnitClassification(unit)
            local hp, pp = UnitHealth(unit), UnitMana(unit)
            if c == 'worldboss' and hp > 0 then
                bossList[n] = {
                    ['unit']    = unit,
                    ['health']  = hp,
                    ['mana']    = pp,
                }
            end
            return true
        elseif UnitStored(unit) then
            for i, v in pairs(bossList) do
                if i == UnitName(unit) then
                    v['health']  = UnitHealth(unit)
                    v['mana']    = UnitMana(unit)
                end
            end
            return true
    	end
        return false
    end

    local populate = function()
        local fetch = false
        local index = 1
        for i = 1, GetNumRaidMembers() do
            if verifyUnitInfo('raid'..i..'target', index) then
                index = index + 1
            end
        end
        fetch = true
        return fetch
    end

    local enable = function()
        local index = 1
        for i, v in pairs(bossList) do
            local boss = _G['modBossFrame'..index]
            if boss and not boss.used then    -- hard limit of 4
                local reaction = UnitReaction(v['unit'], 'player')
                local info = ManaBarColor[UnitPowerType(v['unit'])]
                local r, g, b
                boss:Show()
                boss.name:SetText(i)
                boss.health:SetValue(v['health'])
                boss.mana:SetValue(v['mana'])
                boss.mana:SetStatusBarColor(info.r, info.g, info.b)
                boss.name:SetTextColor(reaction and UnitReactionColor[reaction].r or 0,
                                       reaction and UnitReactionColor[reaction].g or 0,
                                       reaction and UnitReactionColor[reaction].b or 1)
                SetPortraitTexture(boss.portrait, v['unit'])
                boss.unit = v['unit']
                boss.used = true
                boss:SetScript('OnEnter', function() UnitFrame_OnEnter() GameTooltipStatusBar:Hide() end)
                boss:SetScript('OnLeave',  UnitFrame_OnLeave)
                boss:SetScript('OnMouseUp', function() TargetUnit(this.unit) end)
            elseif boss and boss.name:GetText() == i then
                boss.health:SetValue(v['health'])
                if v['health'] == 0 then
                    boss:SetScript('OnMouseUp', nil)
                    boss:Hide()
                    boss.used = false
                end
            end
            for j = 1, 4 do     -- discontinue any duplicates
                local bosses = _G['modBossFrame'..j]
                if bosses and bosses.name:GetText() == i and bosses ~= boss then
                    bosses:Hide()
                    bosses.unit = nil
                    bosses.used = false
                end
            end
            index = index + 1
        end
    end

    local disable = function()
        for i = 1, 4 do
            local boss = _G['modBossFrame'..i]
            boss:Hide()
            boss.unit = nil
            boss.used = false
        end
    end

    local handler = function()
    	if event == 'PLAYER_ENTERING_WORLD' or event == 'ZONE_CHANGED_NEW_AREA' then
            local _, type = IsInInstance()
            if type == 'raid' then
                if UnitAffectingCombat'player' then
                    f:SetScript('OnUpdate', function()
                        local t = GetTime()
                        if t > bossRefresh then         -- populate
                            if populate() then
                                bossRefresh = t + bossInterval
                                enable()
                            end
                        end
                    end)
                end
                f:RegisterEvent'PLAYER_REGEN_DISABLED'
                f:RegisterEvent'PLAYER_REGEN_ENABLED'
            else
                f:UnregisterEvent'PLAYER_REGEN_DISABLED'
                f:UnregisterEvent'PLAYER_REGEN_ENABLED'
                f:SetScript('OnUpdate', nil)
                disable()
            end
    	elseif event == 'PLAYER_REGEN_DISABLED' then
            bossList = {}
            f:SetScript('OnUpdate', function()
                local t = GetTime()
                if t > bossRefresh then         -- populate
                    if populate() then
                        bossRefresh = t + bossInterval
                        enable()
                    end
                end
            end)
        elseif event == 'PLAYER_REGEN_ENABLED' then
            -- wipe & hide
            -- todo: but only after raid has wiped or boss reaches 0% hp?
            bossList = {}
            f:SetScript('OnUpdate', nil)
            disable()
    	end
    end

    f:RegisterEvent'PLAYER_ENTERING_WORLD'
    f:RegisterEvent'ZONE_CHANGED_NEW_AREA'
    f:SetScript('OnEvent', handler)

    --
