

    local h = WorldStateAlwaysUpFrame:CreateFontString(nil, 'OVERLAY')
    h:SetFontObject(GameFontNormalSmall)
    h:SetTextColor(0, .8, .5)
    h:SetJustifyH'LEFT'
    h:SetPoint('TOPLEFT', UIParent, 'TOP', 40, -32)
    h:Hide()

    ho = CreateFrame('Button', 'modflag_hordeFC', WorldStateAlwaysUpFrame)
    ho:SetFrameLevel(2)
    ho:SetAllPoints(h)
    ho:EnableMouse(true)
    ho:SetScript('OnMouseDown', function() print'clicked!' target() end)
    ho:Hide()

    local a = WorldStateAlwaysUpFrame:CreateFontString(nil, 'OVERLAY')
    a:SetFontObject(GameFontNormalSmall)
    a:SetTextColor(1, 0, 0)
    a:SetJustifyH'LEFT'
    a:SetPoint('TOPLEFT', UIParent, 'TOP', 40, -55)
    a:Hide()

    al = CreateFrame('Button', 'modflag_allianceFC', WorldStateAlwaysUpFrame)
    al:SetFrameLevel(2)
    al:SetAllPoints(a)
    al:EnableMouse(true)
    al:SetScript('OnMouseDown', function() print'clicked!' target() end)
    al:Hide()

    local OnEnter = function()
        local text = this == ho and h or a
        text:SetTextColor(1, .8, 0)
        GameTooltip:SetOwner(this, 'ANCHOR_TOPRIGHT')
		GameTooltip:SetText'Click to Target'
		GameTooltip:Show()
    end

    local OnLeave = function()
        local text = this == ho and h or a
        local f    = this == a and 'Horde' or 'Alliance'
        GameTooltip:Hide()
        text:SetTextColor(this == a and 1 or 0, this == a and 0 or .8, this == a and 0 or .5)
    end

    local target = function()
        local text = this == ho and h or a
        local t = text:GetText()
        TargetByName(t, true)
    end

    -- ho:SetScript('OnClick', function() print'clicked!' target() end)
    -- al:SetScript('OnClick', function() print'clicked!' target() end)

    local f = CreateFrame'Frame'
    f:RegisterEvent'CHAT_MSG_BG_SYSTEM_ALLIANCE'
    f:RegisterEvent'CHAT_MSG_BG_SYSTEM_HORDE'
    f:RegisterEvent'ZONE_CHANGED_NEW_AREA'
    f:SetScript('OnEvent', function()
        if tonumber(GetCVar'modPVPTimers') then
            local s = arg1
            local alliancePick  = 'The Alliance (.+) was picked up by (.+)!'
            local allianceDrop  = 'The Alliance (.+) was dropped by (.+)!'
            local allianceCap   = 'captured the Alliance (.+)!'
            local hordePick     = 'The Horde (.+) was picked up by (.+)!'
            local hordeDrop     = 'The Horde (.+) was dropped by (.+)!'
            local hordeCap      = 'captured the Horde (.+)!'
            if event == 'ZONE_CHANGED_NEW_AREA' then
                ho:Hide() h:Hide()
                al:Hide() a:Hide()
            else
                if string.find(s, alliancePick)
                or string.find(s, '+ Alliance Flag') then
                    local t = gsub(s, alliancePick, '%2')
                    a:SetText(t)
                    a:Show()
                elseif string.find(s, allianceDrop)
                or string.find(s, allianceCap) then
                    a:Hide()
                elseif string.find(s, hordePick)
                or string.find(s, '+ Horde Flag') then
                    local t = gsub(s, hordePick, '%2')
                    h:SetText(t)
                    h:Show()
                elseif  string.find(s, hordeDrop)
                or string.find(s, hordeCap) then
                    h:Hide()
                end

                ho:SetAllPoints(h) ho:SetHeight(15)
                al:SetAllPoints(a) al:SetHeight(15)

                if a:IsShown() then al:Show() else al:Hide() end
                if h:IsShown() then ho:Show() else ho:Hide() end
            end
        end
    end)

    --
