

    for i = 1, 12 do                            -- ITEMS
        local bu   = _G['MerchantItem'..i..'ItemButton']
        local slot = _G['MerchantItem'..i..'SlotTexture']
        if bu then
            modSkin(bu, 18)
            modSkinPadding(bu, 2)
            modSkinColor(bu, .2, .2, .2)
            slot:Hide()
        end
    end

    local r  = _G['MerchantRepairItemButton']   -- REPAIR
    if r then
        modSkin(r, 18)
        modSkinPadding(r, 2)
        modSkinColor(r, .2, .2, .2)
    end

    local a  = _G['MerchantRepairAllButton']
    if a then
        modSkin(a, 18)
        modSkinPadding(a, 2)
        modSkinColor(a, .2, .2, .2)
    end

    --
