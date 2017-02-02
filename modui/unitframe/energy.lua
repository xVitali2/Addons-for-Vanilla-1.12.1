    if tonumber(GetCVar'modUnitFrame') == 0 then return end

    local _, class = UnitClass('player')
    if not (class == 'ROGUE' or class == 'DRUID') then return end


    local lastEnergyValue       = 0     -- The energy value after the last regen pulse.
    local currentEnergyValue    = 0     -- The current energy value at the time of the current regen pulse.
    local preLastPulseTime      = 2.0   -- Time of the second to last regen pulse.
    local lastPulseTime         = 2.0   -- Time of the last regen pulse.
    local pulseTotal            = 0     -- Total time of all regen pulse gaps > 2.0.
    local pulseCount            = 0     -- Total number of regen pulses > 2.0.
    local syncNextUpdate        = false -- True if a regen pulse just ocurred and energy value will sync next frame.

    local energy = CreateFrame('Statusbar', nil, PlayerFrameManaBar)
    energy:SetWidth(PlayerFrameManaBar:GetWidth())
    energy:SetAllPoints(PlayerFrameManaBar)
    energy:Hide()

    local spark = energy:CreateTexture(nil, 'OVERLAY')
    spark:SetTexture[[Interface\CastingBar\UI-CastingBar-Spark]]
    spark:SetWidth(32) spark:SetHeight(32)
    spark:SetBlendMode('ADD')
    spark:SetAlpha(.4)

    local energy_OnUpdate = function()
        if (syncNextUpdate) then
            local v = mod((GetTime() - lastPulseTime), 2.0)
            spark:SetPoint('CENTER', energy, 'LEFT', (energy:GetWidth() * (v / 2.0)), 0)

            local nextPulseTotalAddition = (lastPulseTime - preLastPulseTime)
            if ((nextPulseTotalAddition > 2.0) and (nextPulseTotalAddition < 2.5)) then
                pulseTotal = pulseTotal + (lastPulseTime - preLastPulseTime)
                pulseCount = (pulseCount + 1)

                -- -- TEST BLOCK ---------------------------
                -- print('Sync update just ocurred')
                -- print('time to be added to total: ' .. (lastPulseTime - preLastPulseTime))
                -- print('pulseTotal: '.. pulseTotal)
                -- print('pulseCount: ' .. pulseCount)
                -- print('pulseAverage: ' .. pulseTotal / pulseCount)
                -- -- END TESTBLOCK ------------------------
            end
            syncNextUpdate = false
        else
            if (pulseCount == 0) then
                local v = mod((GetTime() - lastPulseTime), 2.0)
                spark:SetPoint('CENTER', energy, 'LEFT', (energy:GetWidth() * (v / 2.0)), 0)
            else
                local v = mod((GetTime() - lastPulseTime), (pulseTotal / pulseCount))
                spark:SetPoint('CENTER', energy, 'LEFT', (energy:GetWidth() * (v / (pulseTotal / pulseCount))), 0)

                if ((GetTime() - lastPulseTime) > 120) then
                    energy:Hide()
                end

                -- -- TEST BLOCK ---------------------------
                -- print('running average mode')
                -- print('pulseTotal: '.. pulseTotal)
                -- print('pulseCount: ' .. pulseCount)
                -- print('pulseAverage: ' .. pulseTotal / pulseCount)
                -- -- END TESTBLOCK ------------------------
            end
        end
    end

    energy:SetScript('OnEvent', function()
        if event == 'PLAYER_REGEN_DISABLED' then
            spark:SetAlpha(1)
        elseif event == 'PLAYER_REGEN_ENABLED' then
            spark:SetAlpha(.4)
        elseif event == 'PLAYER_AURAS_CHANGED' then
            local power  = UnitPowerType'player'
            if power == 3 then
                energy:Show()
            else
                energy:Hide()
            end
        else
            if arg1 == 'player' then
                currentEnergyValue = UnitMana('player')
                if  currentEnergyValue == lastEnergyValue + 20 then
                    preLastPulseTime = lastPulseTime
                    lastPulseTime = GetTime()
                    syncNextUpdate = true
                    energy:Show()
                end
                lastEnergyValue = currentEnergyValue
            end
        end
    end)

    energy:SetScript('OnUpdate', energy_OnUpdate)
    energy:RegisterEvent'PLAYER_AURAS_CHANGED'
    energy:RegisterEvent'PLAYER_REGEN_DISABLED'
    energy:RegisterEvent'PLAYER_REGEN_ENABLED'
    energy:RegisterEvent'UNIT_ENERGY'
