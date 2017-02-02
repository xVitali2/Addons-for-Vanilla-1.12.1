
    local orig = {}

    orig.GuildStatus_Update = GuildStatus_Update

    function GuildStatus_Update()
        orig.GuildStatus_Update()
        for i = 1, GUILDMEMBERS_TO_DISPLAY do
            local index = FauxScrollFrame_GetOffset(GuildListScrollFrame) + i
            local _, _, _, _, class, _, _, _, online = GetGuildRosterInfo(index)
            local text = FriendsFrame.playerStatusFrame and _G['GuildFrameButton'..i..'Class'] or _G['GuildFrameGuildStatusButton'..i..'Class']
            if  class then
                local colour = RAID_CLASS_COLORS[strupper(class)]
                if  colour then
                    if online then
                        text:SetTextColor(colour.r, colour.g, colour.b)
                    else
                        text:SetTextColor(colour.r*.7, colour.g*.7, colour.b*.7)
                    end
                end
            else
                if online then
                    text:SetTextColor(1, 1, 1)
                else
                    text:SetTextColor(.5, .5, .5)
                end
            end
        end
    end

    --
