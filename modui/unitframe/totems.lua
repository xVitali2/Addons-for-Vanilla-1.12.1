

    local _, class = UnitClass'player'
    local orig = {}

    if class ~= 'SHAMAN' then return end
    if tonumber(GetCVar'modUnitFrame') == 0 then return end

    orig.UseAction = UseAction
    orig.CastSpell = CastSpell
    orig.CastSpellByName = CastSpellByName
    orig.UseIventoryItem = UseIventoryItem

    -- TODO:
    --      reset positions based on # of totems shown
    --      localisations

    local earth = CreateFrame('Button', 'modTotemEarth', PlayerFrame)
    earth:SetWidth(24)
    earth:SetHeight(20)
    earth:SetPoint('TOPLEFT', PlayerFrame, 'BOTTOMLEFT', 110, 28)
    earth:Hide()

    local fire = CreateFrame('Button', 'modTotemFire', PlayerFrame)
    fire:SetWidth(24)
    fire:SetHeight(20)
    fire:SetPoint('LEFT', earth, 'RIGHT', 6, 0)
    fire:Hide()

    local air = CreateFrame('Button', 'modTotemAir', PlayerFrame)
    air:SetWidth(24)
    air:SetHeight(20)
    air:SetPoint('LEFT', fire, 'RIGHT', 6, 0)
    air:Hide()

    local water = CreateFrame('Button', 'modTotemWater', PlayerFrame)
    water:SetWidth(24)
    water:SetHeight(20)
    water:SetPoint('LEFT', air, 'RIGHT', 6, 0)
    water:Hide()

    local tooltip = CreateFrame('GameTooltip', 'modTotemTooltip', nil, 'GameTooltipTemplate')
    tooltip:SetOwner(WorldFrame, 'ANCHOR_NONE')

    for i, v in pairs({earth, fire, air, water}) do
        modSkin(v, 16)
        modSkinPadding(v, 2)
        modSkinColor(v, .2, .2, .2)

        v.icon = v:CreateTexture(nil, 'ARTWORK')
        v.icon:SetAllPoints()
        v.icon:SetTexCoord(.1, .9, .2, .8)

        v.timer = v:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightSmall')
        v.timer:SetPoint('TOP', v, 'BOTTOM', 1, -2)
        v.timer:SetJustifyH'CENTER'
    end

    local UpdateTotem = function(totem)
        local time = GetTime()
        if time < this.finish and not totem.dead then
            this.timer:SetText(SecondsToTimeAbbrev(this.finish - time))
        else
            this:SetScript('OnUpdate', nil)
            this:Hide()
            this.icon:SetTexture''
            this.timer:SetText''
            this.hp = 0
            this.dead = false
            this.shown = false
        end
    end

    local AddTotem = function(totem, n, i)
        local bu = _G['modTotem'..totem.type]
        local i  = 1

        bu:Show()
        bu.shown = true

        if  n == 'Searing Totem' then
            totem.hp = 5
        elseif n == 'Stoneclaw Totem' then
            local _, _, _, _, rank = GetTalentInfo(1, 3)
            totem.hp = totem.rank[i]
            if  rank == 1 then
                totem.hp = totem.hp + (totem.hp*.25)
            elseif
                rank == 2 then
                totem.hp = totem.hp + (totem.hp*.5)
            end
        elseif n == 'Fire Nova' then
            local _, _, _, _, rank = GetTalentInfo(1, 9)
            totem.hp = 5
            if  rank == 1 then
                totem.time = totem.time - 1
            elseif rank == 2 then
                totem.time = totem.time - 2
            end
        else
            totem.hp = 5
        end

        bu.icon:SetTexture('Interface\\Icons\\'..totem.icon)

        bu.start  = GetTime()
        bu.finish = bu.start + totem.time

        bu:SetScript('OnEnter',  function()
            local colour = RAID_CLASS_COLORS[class]
            GameTooltip:SetOwner(bu, 'ANCHOR_RIGHT')
            GameTooltip:AddLine(n..' Totem', colour.r, colour.g, colour.b)
            GameTooltip:Show()
        end)

        bu:SetScript('OnLeave',  function() GameTooltip:Hide() end)

        bu:SetScript('OnUpdate', function()
            UpdateTotem(totem)
        end)

        for _, v in pairs({earth, fire, air, water}) do
            if  v.shown then
                v:ClearAllPoints()
                if i == 1 then
                    v:SetPoint('TOPLEFT', PlayerFrame, 'BOTTOMLEFT', 110, 28)
                else
                    v:SetPoint('TOPLEFT', PlayerFrame, 'BOTTOMLEFT', 110 + (29*(i - 1)), 28)
                end
                i = i + 1
            end
        end
    end

    local DamageTotem = function(n, dmg)
        local totem = MODUI_TOTEMS[n]
        totem.dmg = totem.dmg + dmg
        if  totem.dmg >= totem.hits then
            totem.dead = true
        end
    end

    --[[local OnEvent = function(event)
        if  string.find(arg1, 'You cast (.+) Totem.') then
            local n = gsub(arg1, 'You cast (.+) Totem.', '%1')
            if MODUI_TOTEMS[n] then AddTotem(MODUI_TOTEMS[n], n) end
        end
    end]]

    local OnEvent = function(event)
        local match = {}
        if event == 'CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE'
        or event == 'CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS'
        or event == 'CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE'
        or event == 'CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS' then
            for num, regex in {'.+ [crh]+its (.+) Totem ?(%a*) for (%d+).*'} do
                match = {string.find(arg1, regex)()}
                if table.getn(match) >= 1 then
                    -- match[1] = ProcessAlias(match[1])
                    DamageTotem(match[1], match[3])
                    break
                end
            end
        end
    end

    local GetSpellID = function(n)
        local i, done, name, id, rank, srank = 1, false
        local _, _, srank = string.find(n, '%((Rank %d+)%)')
        n = string.gsub(n,'%(Rank %d+%)', '')
        if not srank then
            n = string.gsub(n, '%(%)', '')
        end
        while not done do
            name, rank = GetSpellName(i, BOOKTYPE_SPELL)
            if not name then
                done = true
            elseif (name == n and not srank) or (name == n and rank == srank) then
                id = i
            end
            i = i + 1
        end
        return id
    end

    local AddUseAction = function(id, book)
        local start, duration, enable = GetActionCooldown(id)
	    local isUsable, notEnoughMana = IsUsableAction(id)
        if isUsable and not notEnoughMana then
            tooltip:SetAction(id)
            local t = _G['modTotemTooltipTextLeft1']:GetText()
            local n
            if  t then
                n = gsub(t, '(.+) Totem', '%1')
                i = gsub(t, 'Rank (%d+)', '%1')
                if not i then i = 0 end
                i = tonumber(i)
                if MODUI_TOTEMS[n] then AddTotem(MODUI_TOTEMS[n], n, i) end
            end
        end
    end

    local AddCastSpell = function(id, book)
        local start, duration, enable = GetSpellCooldown(id, book)
        local n, i = GetSpellName(id, book) -- i is rank
        n = gsub(n, '(.+) Totem', '%1')
        i = gsub(i, 'Rank (%d+)', '%1')
        if not i then i = 0 end
        i = tonumber(i)
        if MODUI_TOTEMS[n] then AddTotem(MODUI_TOTEMS[n], n, i) end
    end

    local AddCastSpellByName = function(n)
        local id = GetSpellID(n)
        if id then
            AddCastSpell(id, BOOKTYPE_SPELL)
        end
    end

    local AddUseInventoryItem = function(slot)
        if slot == 13 or slot == 14 then
            local link = GetInventoryItemLink('player', slot)
            if  link then
                local _, _, t = string.find(link, '^.*%[(.*)%].*$')
                local n = gsub(t, TT_TRINKET_REGEX, '%1')
                if  n == 'Enamored Water' then
                    n = 'Ancient Mana Spring'
                    i = 0
                    AddTotem(MODUI_TOTEMS[n], n, i)
                end
            end
        end
    end

    UseAction = function(id, book)
        AddUseAction(id, book)
        orig.UseAction(id, book)
    end

    CastSpell = function(id, book)
        AddCastSpell(id, book)
        orig.CastSpell(id, book)
    end

    CastSpellByName = function(n, onSelf)
        AddCastSpellByName(n)
        orig.CastSpellByName(n, onSelf)
    end

    UseIventoryItem = function(id)
        AddUseInventoryItem(id)
        orig.UseIventoryItem(id)
    end



    --
