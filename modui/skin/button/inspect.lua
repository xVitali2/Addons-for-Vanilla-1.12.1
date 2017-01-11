

    local orig = {}

    local items = {
    	'Head', 'Neck', 'Shoulder',
    	'Shirt', 'Chest', 'Waist', 'Legs', 'Feet',
    	'Wrist', 'Hands', 'Finger0', 'Finger1',
    	'Trinket0', 'Trinket1',
    	'Back', 'MainHand', 'SecondaryHand', 'Ranged', 'Tabard',}

    local modI = function()
        for i, v in pairs(items) do
            local bu =  _G['Inspect'..v..'Slot']
            if bu then
                modSkin(bu, 18)
                modSkinPadding(bu, 2)
                modSkinColor(bu, .2, .2, .2)
                bu:SetNormalTexture''
            end
        end
    end

    local colourI = function()
        for i, v in pairs(items) do
            local bu =  _G['Inspect'..v..'Slot']
            local link = GetInventoryItemLink("target", i)
            modSkinColor(bu, .2, .2, .2)
            if link then
                local _, _, istring = string.find(link, '|H(.+)|h')
                local _, _, q = GetItemInfo(istring)
                if q and q > 1 then
                    local r, g, b = GetItemQualityColor(q)
                    modSkinColor(bu, r, g, b)
                else
                    modSkinColor(bu, .2, .2, .2)
                end
            end
        end
    end

    local mI = CreateFrame'Frame'
    mI:SetScript('OnEvent', function()
        if arg1 == 'Blizzard_InspectUI' then
            modI() colourI()
            orig.InspectPaperDollItemSlotButton_Update = InspectPaperDollItemSlotButton_Update
            function InspectPaperDollItemSlotButton_Update(button)
                orig.InspectPaperDollItemSlotButton_Update(button)
                colourI()
            end
        end
    end)
    mI:RegisterEvent'ADDON_LOADED'

    --
