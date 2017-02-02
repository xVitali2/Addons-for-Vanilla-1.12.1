
    local orig = {}

    orig.WorldStateScoreFrame_Update = WorldStateScoreFrame_Update

    function WorldStateScoreFrame_Update()
        orig.WorldStateScoreFrame_Update()
        -- class colour names
        local num = GetNumBattlefieldScores()
        local index
        for i = 1, MAX_WORLDSTATE_SCORE_BUTTONS do
            index = FauxScrollFrame_GetOffset(_G['WorldStateScoreScrollFrame']) + i
            if  index <= num then
                local name, _, _, _, _, _, _, _, class = GetBattlefieldScore(index)
                if    name ~= UnitName'player' then
                    local colour = RAID_CLASS_COLORS[string.upper(class)]
                    _G['WorldStateScoreButton'..i..'NameButtonName']:SetVertexColor(colour.r, colour.g, colour.b)
                end
            end
        end
    end

    --
