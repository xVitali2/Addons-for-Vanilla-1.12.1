

    local stat = CreateFrame('Frame', nil, CharacterAttributesFrame)
    stat:SetPoint('TOPLEFT', PlayerStatBackgroundTop)
    stat:SetPoint('BOTTOMRIGHT', PlayerStatBackgroundBottom)

    local melee = CreateFrame('Frame', nil, CharacterAttributesFrame)
    melee:SetPoint('TOPLEFT', MeleeAttackBackgroundTop)
    melee:SetPoint('BOTTOMRIGHT', MeleeAttackBackgroundBottom)

    local ranged = CreateFrame('Frame', nil, CharacterAttributesFrame)
    ranged:SetPoint('TOPLEFT', RangedAttackBackgroundTop)
    ranged:SetPoint('BOTTOMRIGHT', RangedAttackBackgroundBottom)

    for _, v in pairs ({stat, melee, ranged}) do
        modSkin(v, 20)
        modSkinPadding(v, 1)
        modSkinColor(v, .2, .2, .2)
    end

    --
