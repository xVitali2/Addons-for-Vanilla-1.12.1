

    local _, class = UnitClass'player'

    if class ~= 'WARLOCK' then return end
    if tonumber(GetCVar'modUnitFrame') == 0 then return end

    local f = CreateFrame('GameTooltip', 'modShardTooltip', nil, 'GameTooltipTemplate')
    f:SetOwner(WorldFrame, 'ANCHOR_NONE')
    f:AddFontStrings(
        f:CreateFontString("$parentTextLeft1", nil, "GameTooltipText"),
        f:CreateFontString("$parentTextRight1", nil, "GameTooltipText")
    )

    PlayerFrame.shard = CreateFrame('Frame', nil, PlayerFrame)
    PlayerFrame.shard:SetWidth(15) PlayerFrame.shard:SetHeight(15)
    PlayerFrame.shard:SetPoint('TOPLEFT', PlayerFrameTexture, 'BOTTOMLEFT', 61, 25)

    PlayerFrame.shard.icon = PlayerFrame.shard:CreateTexture(nil, 'BACKGROUND')
    PlayerFrame.shard.icon:SetAllPoints()
    SetPortraitToTexture(PlayerFrame.shard.icon, [[Interface\ICONS\Inv_misc_gem_amethyst_02]])

    PlayerFrame.shard.border = PlayerFrame.shard:CreateTexture(nil, 'ARTWORK')
    PlayerFrame.shard.border:SetPoint('TOPLEFT', PlayerFrame.shard, -6, 6)
    PlayerFrame.shard.border:SetPoint('BOTTOMRIGHT', PlayerFrame.shard, 26, -26)
    PlayerFrame.shard.border:SetTexture[[Interface\Minimap\MiniMap-TrackingBorder]]
    table.insert(MODUI_COLOURELEMENTS_FOR_UI, PlayerFrame.shard.border)

    PlayerFrame.shard.text = PlayerFrame.shard:CreateFontString(nil, 'OVERLAY')
    PlayerFrame.shard.text:SetFont(STANDARD_TEXT_FONT, 9, 'OUTLINE')
    PlayerFrame.shard.text:SetJustifyH'CENTER'
    PlayerFrame.shard.text:SetPoint('CENTER', PlayerFrame.shard, 'BOTTOMLEFT')
    PlayerFrame.shard.text:SetTextColor(1, .8, 0)

    local scan = function()
        local total = 0
    	for i = 0, NUM_BAG_SLOTS do
    		for j = 0, GetContainerNumSlots(i) do
    			local link = GetContainerItemLink(i, j)
    			if link then
    				local _, _, name = string.find(link, '^.*%[(.*)%].*$')
    				if name == 'Soul Shard' then
    					local _, stack = GetContainerItemInfo(i, j)
    					total = total + stack
    				end
    			end
    		end
    	end
        if total > 0 then
            PlayerFrame.shard.text:SetText(total)
            PlayerFrame.shard:Show()
        else
            PlayerFrame.shard:Hide()
        end
    end

    PlayerFrame.shard:SetScript('OnEnter', function()
        GameTooltip:ClearLines()
        GameTooltip:SetAnchor(this, 'BOTTOMRIGHT')
        GameTooltip:AddLine'Souls Shards stored.'
        GameTooltip:Show()
    end)
    PlayerFrame.shard:SetScript('OnLeave', function() GameTooltip:Hide() end)

    f:RegisterEvent'BAG_UPDATE' f:RegisterEvent'PLAYER_ENTERING_WORLD'
    f:SetScript('OnEvent', scan)

    --
