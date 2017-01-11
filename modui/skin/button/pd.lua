

    local items = {                     -- PAPERDOLL
    	[0] = 'Ammo', 'Head', 'Neck', 'Shoulder',
    	'Shirt', 'Chest', 'Waist', 'Legs', 'Feet',
    	'Wrist', 'Hands', 'Finger0', 'Finger1',
    	'Trinket0', 'Trinket1',
    	'Back', 'MainHand', 'SecondaryHand', 'Ranged', 'Tabard',}
    for i,v in pairs(items) do
        local bu =  _G['Character'..v..'Slot']
        modSkin(bu, 18)
        modSkinPadding(bu, 2)
        modSkinColor(bu, .2, .2, .2)
        bu:SetNormalTexture''
    end

    local modpD = function()
        for i,v in pairs(items) do
            local bu =  _G['Character'..v..'Slot']
            local q = GetInventoryItemQuality('player', i)
            if q and q > 1 then
                local r, g, b = GetItemQualityColor(q)
                modSkinColor(bu, r, g, b)
            else
                modSkinColor(bu, .2, .2, .2)
            end
        end
    end

    local pD = CreateFrame'Frame'
    pD:SetParent(CharacterFrame)
    pD:SetScript('OnShow', modpD)
    pD:SetScript('OnEvent', modpD)
    pD:RegisterEvent'UNIT_INVENTORY_CHANGED'

    --
