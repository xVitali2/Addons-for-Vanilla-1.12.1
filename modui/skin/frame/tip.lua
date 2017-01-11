

    local f = { GameTooltip,                -- TIPS
                ItemRefTooltip,
                ItemRefShoppingTooltip1,
                ItemRefShoppingTooltip2,
                ItemRefShoppingTooltip3,
                ShoppingTooltip1,
                ShoppingTooltip2,
                ShoppingTooltip3,
                WorldMapTooltip,
                WorldMapCompareTooltip1,
                WorldMapCompareTooltip2,
                WorldMapCompareTooltip3,
                FriendsTooltip,
                DropDownList1MenuBackdrop,  -- DROPDOWN
                DropDownList2MenuBackdrop,
                DropDownList3MenuBackdrop,
                ChatMenu,
                EmoteMenu,
                LanguageMenu, }

    for i, v in pairs (f) do
        modSkin(v, 18)
        modSkinPadding(v, -1)
        modSkinColor(v, .15, .15, .15)
    end

    --
