

    local f = CreateFrame'Frame'
    f:RegisterEvent'ADDON_LOADED'
    f:SetScript('OnEvent', function()
        if event == 'Blizzard_AuctionUI' then
            -- browse buttons
            for i = 1, 8 do
                local bu = _G['BrowseButton'..i..'Item']
                local c  = _G['BrowseButton'..i..'Item'..'Count']
                modSkin(bu, 18)
                modSkinPadding(bu, 2)
                modSkinColor(bu, .2, .2, .2)
                bu:SetNormalTexture''
                c:SetDrawLayer'OVERLAY'
            end
            for i = 1, 9 do
                for _, v in pairs({_G['BidButton'..i..'Item'], _G['AuctionsButton'..i..'Item']}) do
                    modSkin(v, 18)
                    modSkinPadding(v, 2)
                    modSkinColor(v, .2, .2, .2)
                    v:SetNormalTexture''
                end
                for _, v in pairs({_G['BidButton'..i..'ItemCount'], _G['AuctionsButton'..i..'ItemCount']}) do
                    v:SetDrawLayer'OVERLAY'
                end
            end
            local bu = _G['AuctionsItemButton']
            local c  = _G['AuctionsItemButton'..'Count']
            modSkin(bu, 18)
            modSkinPadding(bu, 2)
            modSkinColor(bu, .2, .2, .2)
            c:SetDrawLayer'OVERLAY'
        end
    end)

    --
