

    for i = 1, 4 do                     -- LOOT
        local bu = _G['LootButton'..i]
        modSkin(bu, 18)
        modSkinPadding(bu, 2)
        modSkinColor(bu, .2, .2, .2)
    end

    for i = 1, 4 do
        local bu = _G['GroupLootFrame'..i..'IconFrame']
        local slot = _G['GroupLootFrame'..i..'SlotTexture']
        bu.f = CreateFrame('Frame', nil, bu)
        bu.f:SetFrameLevel(bu:GetFrameLevel() + 1)
        bu.f:SetPoint('TOPLEFT', bu)
        bu.f:SetPoint('BOTTOMRIGHT', bu)
        bu.f:EnableMouse(false)
        modSkin(bu.f, 18)
        modSkinPadding(bu.f, 2)
        modSkinColor(bu.f, .2, .2, .2)
        slot:SetAlpha(0)
    end

    --
