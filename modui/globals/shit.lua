

    local bu = CreateFrame('Button', 'modShit', MerchantFrame)
    bu:SetPoint('TOPLEFT', MerchantFrame, 180, -42)
    bu:SetWidth(24) bu:SetHeight(24)
    bu:SetPushedTexture[[Interface\Buttons\UI-Quickslot-Depress]]
    bu:SetNormalTexture''
    bu.last = 0

    local t = bu:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    t:SetPoint('RIGHT', bu, 'LEFT', -4, 0)
    t:SetText'Sell All Greys'

    local ic = bu:CreateTexture(nil, 'ARTWORK')
    ic:SetTexture[[Interface\ICONS\Inv_feather_12]]
    ic:SetAllPoints()

    local update = function()
        bu.last = bu.last + arg1
        if bu.last > .05 then
            local i = table.getn(bu.junk)
            if i > 0 then
                UseContainerItem(bu.junk[i][1], bu.junk[i][2])
                print('|cff4c8d00-|r'..GetContainerItemLink(bu.junk[i][1], bu.junk[i][2]))
                table.remove(bu.junk, i)
            else
                bu:SetScript('OnUpdate', nil)
                print'|cff4c8d00All trash items have been sold.|r'
            end
        end
    end

    bu:SetScript('OnClick', function()
        bu.junk = {}
        for bag = 0, 4 do
            for slot = 0, GetContainerNumSlots(bag) do
                local link = GetContainerItemLink(bag, slot)
                if link then
                    local _, _, istring = string.find(link, '|H(.+)|h')
                    local _, _, q = GetItemInfo(istring)
                    if q == 0 then table.insert(bu.junk, {bag, slot}) end
                end
            end
        end
        print'|cff4c8d00Selling poor quality or trash items.|r'
        bu:SetScript('OnUpdate', update)
    end)

    bu:SetScript('OnEnter', function()
        GameTooltip:SetOwner(bu, 'ANCHOR_RIGHT')
        GameTooltip:SetText'Sell all grey items held in inventory.'
        GameTooltip:Show()
    end)

    bu:SetScript('OnLeave', function() GameTooltip:Hide() end)

    --
