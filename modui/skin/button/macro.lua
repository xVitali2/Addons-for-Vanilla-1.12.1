

    local f = CreateFrame'Frame'
    f:RegisterEvent'ADDON_LOADED'
    f:SetScript('OnEvent', function()
        if arg1 == 'Blizzard_MacroUI' then
            for i = 1, 18 do
                local bu = _G['MacroButton'..i]
                local ic = _G['MacroButton'..i..'Icon']
                local _, slot = bu:GetRegions()
                modSkin(bu, 18)
                modSkinPadding(bu, 3)
                modSkinColor(bu, .2, .2, .2)
                ic:SetTexCoord(.1, .9, .1, .9)
                slot:SetWidth(60) slot:SetHeight(60)
            end

            local bu = _G['MacroFrameSelectedMacroButton']
            local ic = _G['MacroFrameSelectedMacroButtonIcon']
            local bg = _G['MacroFrameSelectedMacroBackground']
            if bu then
                local _, slot = bu:GetRegions()
                modSkin(bu, 18)
                modSkinPadding(bu, 3)
                modSkinColor(bu, .2, .2, .2)
                ic:SetTexCoord(.1, .9, .1, .9)
                slot:SetWidth(60) slot:SetHeight(60)
                bg:SetAlpha(0)
            end

            for i = 1, 20 do
                local bu = _G['MacroPopupButton'..i]
                local ic = _G['MacroPopupButton'..i..'Icon']
                if bu then
                    local _, slot = bu:GetRegions()
                    modSkin(bu, 18)
                    modSkinPadding(bu, 3)
                    modSkinColor(bu, .2, .2, .2)
                    ic:SetTexCoord(.1, .9, .1, .9)
                    slot:SetWidth(60) slot:SetHeight(60)
                    bg:SetAlpha(0)
                end
            end
            this:UnregisterEvent(event)
        end
    end)

    --
