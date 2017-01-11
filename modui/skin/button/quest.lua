

    for i = 1, 10 do                            -- QUEST LOG
        local bu = _G['QuestLogItem'..i]
        local ic = _G['QuestLogItem'..i..'IconTexture']
        if bu then
            local f = CreateFrame('Frame', nil, bu)
            f:SetAllPoints(ic)
            modSkin(f, 18)
            modSkinPadding(f, 2)
            modSkinColor(f, .2, .2, .2)
        end
    end

    for i = 1, 6 do                             -- QUEST DETAIL
        local bu = _G['QuestDetailItem'..i]
        local ic = _G['QuestDetailItem'..i..'IconTexture']
        if bu then
            local f = CreateFrame('Frame', nil, bu)
            f:SetAllPoints(ic)
            modSkin(f, 18)
            modSkinPadding(f, 2)
            modSkinColor(f, .2, .2, .2)
        end
    end

    for i = 1, 6 do                             -- QUEST PROGRESS
        local bu = _G['QuestProgressItem'..i]
        local ic = _G['QuestProgressItem'..i..'IconTexture']
        if bu then
            local f = CreateFrame('Frame', nil, bu)
            f:SetAllPoints(ic)
            modSkin(f, 18)
            modSkinPadding(f, 2)
            modSkinColor(f, .2, .2, .2)
        end
    end

    for i = 1, 6 do                             -- QUEST REWARD
        local bu = _G['QuestRewardItem'..i]
        local ic = _G['QuestRewardItem'..i..'IconTexture']
        if bu then
            local f = CreateFrame('Frame', nil, bu)
            f:SetAllPoints(ic)
            modSkin(f, 18)
            modSkinPadding(f, 2)
            modSkinColor(f, .2, .2, .2)
        end
    end

    local sk  = _G['QuestInfoSkillPointFrame']  -- SKILL POINT
    local ski = _G['QuestInfoSkillPointFrameIconTexture']
    if sk then
        local f = CreateFrame('Frame', nil, sk)
        f:SetAllPoints(ski)
        modSkin(f, 18)
        modSkinPadding(f, 2)
        modSkinColor(f, .2, .2, .2)
    end

    local sp  = _G['QuestInfoRewardSpell']     -- SPELL POINT
    local spi = _G['QuestInfoRewardSpellIconTexture']
    if sp then
    	local f = CreateFrame('Frame', nil, sp)
    	f:SetAllPoints(spi)
        modSkin(f, 18)
        modSkinPadding(f, 2)
        modSkinColor(f, .2, .2, .2)
    end

    local t  = _G['QuestInfoTalentFrame']      -- TALENT POINT
    local ti = _G['QuestInfoTalentFrameIconTexture']
    if t then
        local f = CreateFrame('Frame', nil, t)
        f:SetAllPoints(ti)
        modSkin(f, 18)
        modSkinPadding(f, 2)
        modSkinColor(f, .2, .2, .2)
    end

    --
