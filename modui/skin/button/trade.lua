

    local modI = function(bu)
        if not bu.skinned then
            modSkin(bu, 18)
            modSkinPadding(bu, 2)
            modSkinColor(bu, .2, .2, .2)
            bu.skinned = true
        end
    end

    local f = CreateFrame'Frame'
    f:SetScript('OnEvent', function()
        for i = 1, 7 do
            local p = _G['TradePlayerItem'..i..'ItemButton']
            local t = _G['TradeRecipientItem'..i..'ItemButton']
            modI(p) modI(t)
        end
    end)
    f:RegisterEvent'TRADE_SHOW' f:RegisterEvent'TRADE_UPDATE'

    --
