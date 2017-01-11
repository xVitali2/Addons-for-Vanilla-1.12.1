

    local BACKDROP = {  bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],
                        edgeFile = nil,
                        edgeSize = 0,
                        insets = {left = 2, right = 2, top = 2, bottom = 2},}
    local events = {    CHAT_MSG_SAY = 'chatBubbles',
                        CHAT_MSG_YELL = 'chatBubbles',
                        CHAT_MSG_PARTY = 'chatBubblesParty',
                        CHAT_MSG_PARTY_LEADER = 'chatBubblesParty',
                        CHAT_MSG_MONSTER_SAY = 'chatBubbles',
                        CHAT_MSG_MONSTER_YELL = 'chatBubbles',
                        CHAT_MSG_MONSTER_PARTY = 'chatBubblesParty',}


    local style = function(f)
        local r = {f:GetRegions()}
        for _, v in pairs(r) do
            if  v:GetObjectType() == 'Texture' then
                v:SetDrawLayer'OVERLAY'
                if  v:GetTexture() == [[Interface\Tooltips\ChatBubble-Background]]
                or  v:GetTexture() == [[Interface\Tooltips\ChatBubble-Backdrop]] then
                    v:SetTexture''
                end
            elseif  v:GetObjectType() == 'FontString' then
                f.textstring = v
            end
        end
        if not f.skinned then
            modSkin(f, 18)
            modSkinColor(f, .2, .2, .2)
            f:SetBackdrop(BACKDROP)
            f:SetBackdropColor(0, 0, 0, .8)
            f.textstring:SetFont(STANDARD_TEXT_FONT, 13)
            f.skinned = true
        end
    end

    local isBalloon = function(f)
        if f:GetName() then return end
        if not f:GetRegions() then return end
        return f:GetRegions():GetTexture() == [[Interface\Tooltips\ChatBubble-Background]]
    end


    local bubbleHook = CreateFrame'Frame'
    for event, cvar in pairs(events) do bubbleHook:RegisterEvent(event) end

    bubbleHook:SetScript('OnEvent', function() -- FISH & GO
        local numKids = 0
        local time = math.ceil(GetTime())
        bubbleHook:SetScript('OnUpdate', function(self)
            if math.ceil(GetTime()) == time + 1 then bubbleHook:SetScript('OnUpdate', nil) end
            local newNumKids = WorldFrame:GetNumChildren()
            if newNumKids ~= numKids then
                local f = {WorldFrame:GetChildren()}
                for _, v in pairs(f) do
                    if isBalloon(v) then style(v) end
                end
                numKids = newNumKids
            end
        end)
    end)

    --
