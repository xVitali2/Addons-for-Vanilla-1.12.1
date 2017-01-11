

    for i = 1, 5 do
        local node = CreateFrame('Button', 'modnode_ab'..i, WorldStateAlwaysUpFrame)
        node:SetWidth(10) node:SetHeight(10)
        node:EnableMouse(true) node:RegisterForClicks(true)
        node:Hide()

        node.text = node:CreateFontString(nil, 'OVERLAY', 'GameFontNormalSmall')
        node.text:SetPoint('LEFT', node)
        node.text:SetJustifyH'LEFT'
        node.text:SetTextColor(1, .8, 0)

        node.faction = node:CreateFontString(nil, 'OVERLAY', 'GameFontNormalSmall')
        node.faction:SetPoint('RIGHT', node.text, 'LEFT')
        node.faction:SetJustifyH'RIGHT'
    end

    local reposition = function()
        local i = 1
        for j = 1, 5 do
            local node = _G['modnode_ab'..j]
            node:SetPoint('TOPLEFT',
                          i == 1 and UIParent or _G['modnode_ab'..(j - 1)],
                          i == 1 and 'TOP' or 'BOTTOMLEFT',
                          i == 1 and 30 or 0,
                          i == 1 and -80 or -5)
            if node:IsShown() then i = i + 1 end
        end
    end

    local nodeUpdate = function(text, faction, o, t)
        local time = math.floor(this.max - GetTime())
        text:SetText(' — '..t..', '..AVAB_round(time))
        faction:SetText(o)
    end

    local nodeShow = function(node, o, t)
        node.name = t
        t = gsub(t, '^%l', string.upper)
        node.max = GetTime() + 61
        node:Show()
        node:SetScript('OnUpdate', function() nodeUpdate(node.text, node.faction, o, t) end)
        reposition()
    end

    local nodeHide = function(node)
        node:Hide() node.text:SetText'' node.faction:SetText''
        node:SetScript('OnUpdate', nil)
        node.name = false
        reposition()
    end

    local f = CreateFrame'Frame'
    f:RegisterEvent'CHAT_MSG_BG_SYSTEM_ALLIANCE' f:RegisterEvent'CHAT_MSG_BG_SYSTEM_HORDE'
    f:RegisterEvent'CHAT_MSG_BG_SYSTEM_NEUTRAL'  f:RegisterEvent'ZONE_CHANGED_NEW_AREA'
    f:SetScript('OnEvent', function()
        if tonumber(GetCVar'modPVPTimers') == 1 then
            local s = arg1
            local p, o, t

            if  event == 'ZONE_CHANGED_NEW_AREA' then
                for i = 1, 5 do
                    local node = _G['modnode_ab'..i]
                    nodeHide(node)
                end
            else
                if event == 'CHAT_MSG_BG_SYSTEM_HORDE' then
                    p = 'Horde'
                    o = '|cffff0e0eHorde|r'
                else
                    p = 'Alliance'
                    o = '|cff0df1ceAlliance|r'
                end

                if  string.find(s, 'claims the (.+)') then
                    t = gsub(s, '(.+) claims the (.+)! If left unchallenged, the (.+) will control it in 1 minute!', '%2')
                elseif string.find(s, 'has assaulted the (.+)') then
                    t = gsub(s, '(.+) has assaulted the (.+)', '%2')
                end

                for i = 1, 5 do
                    local node = _G['modnode_ab'..i]

                    if
                        node.name
                    and (
                            string.find(s, 'has taken the (.+)') or string.find(s, 'has defended the (.+)')
                        or
                            string.find(s, 'The (.+) wins')
                        or
                            string.find(s, 'claims the (.+)')
                        )
                    then
                        local defend = gsub(s, '(.+) has defended the (.+)', '%2')
                        local taken  = gsub(s, '(.+) has taken the (.+)', '%2')
                        local claim  = gsub(s, '(.+) claims the (.+)', '%2')
                        local name   = node.name
                        if string.find(name, defend) or string.find(name, taken)
                        or string.find(name, claim)  or string.find(s, 'The (.+) wins')
                        then
                            nodeHide(node)
                        end
                    end

                    if t ~= nil and not node.name then
                        nodeShow(node, o, t)
                        break
                    end
                end
            end
        end
    end)

    --
