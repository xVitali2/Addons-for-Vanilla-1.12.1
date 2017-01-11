

    local orig = {}

    for i = 1, 28 do                    -- BANK
        local bu = _G['BankFrameItem'..i]
        if bu then
            modSkin(bu, 22)
            modSkinPadding(bu, 2)
            modSkinColor(bu, .2, .2, .2)
        end
    end

    for i = 1, 7 do                     -- BANK BAG
        local bu = _G['BankFrameBag'..i]
        if bu then
            modSkin(bu, 22)
            modSkinPadding(bu, 2)
            modSkinColor(bu, .2, .2, .2)
        end
    end

    local modBank = function()
        for i = 1, 28 do
            local bu = _G['BankFrameItem'..i]
		    local link = GetContainerItemLink(-1, i)
            if bu then
            modSkinColor(bu, .2, .2, .2)
                if link then
                    local _, _, istring = string.find(link, '|H(.+)|h')
                    local _, _, q = GetItemInfo(istring)
                    if q and q > 1 then
                        local r, g, b = GetItemQualityColor(q)
                        modSkinColor(bu, r, g, b)
                    end
                end
            end
        end
    end

    local cF = CreateFrame'Frame'
    cF:SetParent(BankFrame)
    cF:SetScript('OnShow', modBank)
    cF:SetScript('OnEvent', modBank)
    cF:RegisterEvent'PLAYERBANKSLOTS_CHANGED'

    --
