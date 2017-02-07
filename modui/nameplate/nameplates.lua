

    local TEXTURE  = [[Interface\AddOns\modui\statusbar\texture\name.tga]]
    local BACKDROP = {bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],}
    local _, class = UnitClass'player'
    local p    = {} local t     = {}
    local enabled  = true               -- TOGGLE NAMEPLATES VISIBILITY DEFAULT
    local showpet  = false              -- TOGGLE NON_COMBAT PET VISIBILITY


    local pets = {
        'Orange Tabby', 'Silver Tabby', 'Bombay', 'Cornish Rex', 'Siamese',
        'Hawk Owl', 'Great Horned Owl', 'Cockatiel', 'Senegal', 'Green Wing Macaw', 'Hyacinth Macaw',
        'Black Kingsnake', 'Brown Snake', 'Crimson Snake',
        'Prairie Dog',
        'Cockroach',
        'Ancona Chicken',
        'Worg Pup',
        'Smolderweb Hatchling',
        'Mechanical Chicken', 'Mechanical Squirrel', 'Lifelike Mechanical Toad', 'Pet Bombling', 'Lil\' Smokey',
        'Sprite Darter', 'Tiny Black Whelpling', 'Tiny Emerald Whelpling', 'Tiny Crimson Whelpling',
        'Unconscious Dig Rat', }

    local isPlate = function(frame)     -- GO FISH
        local  overlayRegion = frame:GetRegions()
        if not overlayRegion or overlayRegion:GetObjectType() ~= 'Texture'
        or overlayRegion:GetTexture() ~= [[Interface\Tooltips\Nameplate-Border]] then
            return false
        end
        return true
    end

    local isPet = function(n)
        for _, name in pairs(pets) do
            if n == name then return true end
        end
        return false
    end

    local isPlayer = function(n)
        if not t[n] then
            TargetByName(n, true)
            table.insert(t, n)
            t[n] = 'ok'
            if UnitIsPlayer'target' then
                local _, rankNo = GetPVPRankInfo(UnitPVPRank'target')
                local _, class  = UnitClass'target'
                table.insert(p, n)
                p[n] = {
                    ['class']  = string.upper(class),
                    ['rank']   = rankNo
                }
            end
        end
    end

    local getTimerLeft = function(tEnd)
        local t = tEnd - GetTime()
        if t > 5 then return decimal_round(t, 0) else return decimal_round(t, 1) end
    end

    local modPlate = function(plate)    -- STYLE
        local health = plate:GetChildren()
        local border, glow, name, level, _, raidicon = plate:GetRegions()
        local n = name:GetText()

        plate:SetFrameLevel(1)

        name:SetFont(STANDARD_TEXT_FONT, 12)
        name:ClearAllPoints()
        name:SetPoint('BOTTOMRIGHT', plate, 'TOPRIGHT', -4, -16)
        name:SetJustifyH'RIGHT'

        health:SetStatusBarTexture''
        health:SetFrameLevel(1)

        health.new = CreateFrame('StatusBar', nil, health)
        health.new:SetAllPoints()
        health.new:SetStatusBarTexture(TEXTURE)
        health.new:SetFrameLevel(1)

        border:SetVertexColor(.2, .2, .2)
        border:SetDrawLayer'OVERLAY'

        level:ClearAllPoints()
        level:SetPoint('LEFT', health, 'RIGHT', -2, 0)
        level:SetFont(STANDARD_TEXT_FONT, 11)
        level:SetJustifyH'LEFT'

        plate.bg = plate:CreateTexture(nil, 'BACKGROUND')
        plate.bg:SetPoint('TOPLEFT', plate, 4, -20)
        plate.bg:SetPoint('BOTTOMRIGHT', plate, -4, 4)
        plate.bg:SetTexture[[Interface\Tooltips\UI-Tooltip-Background]]
        plate.bg:SetVertexColor(0, 0, 0, 1)

        plate.cast = CreateFrame('StatusBar', nil, plate)
        plate.cast:SetStatusBarTexture(TEXTURE)
        plate.cast:SetStatusBarColor(1, .4, 0)
        plate.cast:SetBackdrop(BACKDROP)
        plate.cast:SetBackdropColor(0, 0, 0)
        plate.cast:SetHeight(8)
        plate.cast:SetPoint('LEFT', plate, 20, 0)
        plate.cast:SetPoint('RIGHT', plate, -4, 0)
        plate.cast:SetPoint('TOP', health, 'BOTTOM', 0, -8)

        plate.cast.text = plate.cast:CreateFontString(nil, 'OVERLAY')
        plate.cast.text:SetTextColor(1, .8, 0)
        plate.cast.text:SetFont(STANDARD_TEXT_FONT, 11)
        plate.cast.text:SetShadowOffset(1, -1)
        plate.cast.text:SetShadowColor(0, 0, 0)
        plate.cast.text:SetPoint('TOPLEFT', plate.cast, 'BOTTOMLEFT', 0, -2)

        plate.cast.timer = plate.cast:CreateFontString(nil, 'OVERLAY')
        plate.cast.timer:SetTextColor(1, 1, 1)
        plate.cast.timer:SetFont(STANDARD_TEXT_FONT, 9)
        plate.cast.timer:SetPoint('RIGHT', plate.cast)

        plate.cast.icon = plate.cast:CreateTexture(nil, 'OVERLAY', nil, 7)
        plate.cast.icon:SetWidth(16) plate.cast.icon:SetHeight(14)
        plate.cast.icon:SetPoint('RIGHT', plate.cast, 'LEFT', -5, 0)
        plate.cast.icon:SetTexture[[Interface\Icons\Spell_nature_purge]]
        plate.cast.icon:SetTexCoord(.1, .9, .1, .9)

        plate.cast.border = plate.cast:CreateTexture(nil, 'OVERLAY')
        plate.cast.border:SetTexture[[Interface\AddOns\modui\statusbar\texture\Nameplate-Castbar.blp]]
        plate.cast.border:SetHeight(32)
        plate.cast.border:SetPoint('TOPLEFT', plate, 'BOTTOMLEFT', 0, 8)
        plate.cast.border:SetPoint('TOPRIGHT', plate, 'BOTTOMRIGHT', 0, 9)
        plate.cast.border:SetVertexColor(.2, .2, .2)

        plate.heal = plate:CreateFontString(nil, 'OVERLAY')
        plate.heal:SetTextColor(0, .6, 0, .6)
        plate.heal:Hide()

        plate.buffs = {}
        for i = 1, 4 do
            plate.buffs[i] = CreateFrame('Frame', nil, plate)
            plate.buffs[i]:SetWidth(25) plate.buffs[i]:SetHeight(15)
            plate.buffs[i]:SetPoint('BOTTOMLEFT', plate, 'TOPLEFT', (i - 1)*32 + (i - 1)*2 + 5, -8)
            plate.buffs[i]:Hide()

            modSkin(plate.buffs[i], 14.5)
            modSkinPadding(plate.buffs[i], 3)
            modSkinColor(plate.buffs[i], .2, .2, .2)

            plate.buffs[i].icon = plate.buffs[i]:CreateTexture(nil, 'ARTWORK')
            plate.buffs[i].icon:SetAllPoints()
            plate.buffs[i].icon:SetTexCoord(.1, .9, .25, .75)

            plate.buffs[i].duration = plate.buffs[i]:CreateFontString(nil, 'OVERLAY', 'GameFontNormalSmall')
            plate.buffs[i].duration:SetFont(STANDARD_TEXT_FONT, 10)
            plate.buffs[i].duration:SetTextColor(1, 1, 1)
            plate.buffs[i].duration:SetPoint('BOTTOM', plate.buffs[i], 'TOP', 0, 3)
        end

        plate.totem = CreateFrame('Frame', nil, plate)
        plate.totem:SetWidth(26)
        plate.totem:SetHeight(22)
        plate.totem:SetPoint('BOTTOM', plate)

        modSkin(plate.totem, 14.5)
        modSkinPadding(plate.totem, 3)
        modSkinColor(plate.totem, .2, .2, .2)

        plate.totem.icon = plate.totem:CreateTexture(nil, 'ARTWORK')
        plate.totem.icon:SetAllPoints()
        plate.totem.icon:SetTexCoord(.1, .9, .15, .85)

        if class == 'ROGUE' or class == 'DRUID' then
            plate.cp = plate:CreateFontString(nil, 'OVERLAY')
            plate.cp:SetFont(STANDARD_TEXT_FONT, 18, 'OUTLINE')
            plate.cp:SetPoint('LEFT', health)
            plate.cp:Hide()
        end

        plate.pvp = plate:CreateTexture(nil, 'OVERLAY')
        plate.pvp:SetWidth(14)
        plate.pvp:SetHeight(13)
        plate.pvp:SetPoint('RIGHT', name, 'LEFT', -3, 1)
        plate.pvp:Hide()

        if not showpet then if isPet(n) then plate:Hide() end end

        plate.skinned = true
    end

    local addSize = function(plate)
        local health = plate:GetChildren()
        plate:SetWidth(120)
        health:SetWidth(100)
        health.new:SetWidth(100)
    end

    local addValue = function(plate)
        local health = plate:GetChildren()
        local min, max = health:GetMinMaxValues()
        health.new:SetMinMaxValues(min, max)
        health.new:SetValue(health:GetValue())
    end

    local addColour = function(plate)
        local health  = plate:GetChildren()
        local r, g, b = health:GetStatusBarColor()
        health.new:SetStatusBarColor(r, g, b)
    end

    local addClass = function(plate)    -- CLASS COLOUR
        local health = plate:GetChildren()
        local _, _, name = plate:GetRegions()
        local n = name:GetText()
        local r = health:GetStatusBarColor()

        if not p[n] and not UnitName'target'
        and not string.find(n, '%s') and string.len(n) < 13
        and not t[n] then
            isPlayer(n) ClearTarget()
        end

        if  p[n] then
            local colour = RAID_CLASS_COLORS[p[n]['class']]
            health:SetStatusBarColor(colour.r, colour.g, colour.b)
            health.new:SetStatusBarColor(colour.r, colour.g, colour.b)
        end
    end

    local addCP = function(plate)       -- COMBOPOINT
        if plate.cp then
            local health = plate:GetChildren()
            local _, _, name = plate:GetRegions()
            local text   = name:GetText()
            local target = GetUnitName'target'
            local cp 	 = GetComboPoints()
            plate.cp:Hide()
            if target == text and health:GetAlpha() == 1 and cp > 0 then
                plate.cp:Show()
                plate.cp:SetText(string.rep('°', cp))
                plate.cp:SetTextColor(.5*(cp - 1), 2/(cp - 1), .5/(cp - 1))
            end
        end
    end

    local addCast = function(plate)
        if plate.cast then
            local health = plate:GetChildren()
            local _, _, name = plate:GetRegions()
            local text = name:GetText()
            local target = GetUnitName'target'
            plate.cast:Hide()
			if text ~= nil then
				local v = PROCESSCASTINGgetCast(text)
				if v ~= nil then
					if GetTime() < v.timeEnd then
						plate.cast:SetMinMaxValues(0, v.timeEnd - v.timeStart)
						if v.inverse then
							plate.cast:SetValue(mod((v.timeEnd - GetTime()), v.timeEnd - v.timeStart))
						else
							plate.cast:SetValue(mod((GetTime() - v.timeStart), v.timeEnd - v.timeStart))
						end
						plate.cast.text:SetText(v.spell)
						plate.cast.timer:SetText(getTimerLeft(v.timeEnd)..'s')
						plate.cast.icon:SetTexture(v.icon)
						plate.cast:SetAlpha(plate:GetAlpha())
						plate.cast:Show()
					end
				end
			end
        end
    end

    local addHeal = function(plate)
        local _, _, name = plate:GetRegions()
        local text = name:GetText()
    	plate.heal:Hide()
    	local v = PROCESSCASTINGgetHeal(text)
    	if v ~= nil then
    		if GetTime() < v.timeEnd then
    			local y = 14
    			if v.crit == 1 then
    				plate.heal:SetFont(STANDARD_TEXT_FONT, 28, 'OUTLINE')
    			else
    				plate.heal:SetFont(STANDARD_TEXT_FONT, 24, 'OUTLINE')
    				y = y + v.y
    				if y + v.y < y + 20 then v.y = v.y + 1 end
    			end
    			plate.heal:SetPoint('CENTER', plate, 0, y)
    			if (v.timeEnd - GetTime()) < .6 then
    				plate.heal:SetAlpha(mod((v.timeEnd - GetTime()), 1))
    			else
    				plate.heal:SetAlpha(.6)
    			end
    			plate.heal:SetText('+'..v.amount)
    			plate.heal:Show()
    		end
    	end
    end

    local addBuff = function(plate)
        local _, _, name = plate:GetRegions()
        local n = name:GetText()
        local v = PROCESSBUFFSgetBuffs(n)
        for i = 1, 4 do
            plate.buffs[i]:Hide()
            plate.buffs[i].icon:SetTexture''
            plate.buffs[i].duration:SetText''
        end
        if v ~= nil then
            for i, e in pairs(v) do
                if i < 5 then
                    plate.buffs[i]:Show()
                    plate.buffs[i].icon:SetTexture(e.icon)
                    plate.buffs[i].duration:SetText(getTimerLeft(e.timeEnd))
                    modSkinColor(plate.buffs[i], e.border.r, e.border.g, e.border.b)
                end
            end
        end
    end

    local addPvP = function(plate)
        local _, _, name = plate:GetRegions()
        local n = name:GetText()
        plate.pvp:Hide()
        if  p[n] then
            local rank = p[n]['rank']
            if  rank > 0 then
                plate.pvp:Show()
                plate.pvp:SetTexture(format('%s%02d', 'Interface\\PvPRankBadges\\PvPRank', rank))
            end
        end
    end

    local addTotem = function(plate)
        local health = plate:GetChildren()
        local border, glow, name, level, _, raidicon = plate:GetRegions()
        local n = gsub(name:GetText(), '(.+) Totem', '%1')
        if  MODUI_TOTEMS[n] then
            local totem  = MODUI_TOTEMS[n]

            health.new:SetStatusBarTexture''

            for _, v in pairs({plate:GetRegions()}) do
                v:SetAlpha(0)
            end

            name:SetAlpha(1)
            name:ClearAllPoints()
            name:SetPoint('BOTTOM', plate.totem, 'TOP', 0, 6)
            name:SetJustifyH'LEFT'

            plate.totem:Show()
            plate.totem.icon:SetTexture('Interface\\Icons\\'..totem.icon)
        else
            health.new:SetStatusBarTexture(TEXTURE)

            name:ClearAllPoints()
            name:SetPoint('BOTTOMRIGHT', plate, 'TOPRIGHT', -4, -16)
            name:SetJustifyH'RIGHT'

            for _, v in pairs({plate:GetRegions()}) do
                if  v:GetObjectType() == 'Texture'
                and not
                    (v:GetTexture() == [[Interface\TargetingFrame\UI-RaidTargetingIcons]]
                    or
                    string.find(tostring(v:GetTexture()), 'HighLevel'))
                then
                    v:SetAlpha(1)
                end
            end

            plate.totem:Hide()
        end
    end

    local f = CreateFrame'Frame'
    f:SetScript('OnUpdate', function()
        local frames = {WorldFrame:GetChildren()}
        if tonumber(GetCVar'modNameplate') == 1 then
    	    for _, plate in ipairs(frames) do
                if isPlate(plate) and plate:IsVisible() then
                    local _, _, name = plate:GetRegions()
                    if not plate.skinned then modPlate(plate) end
                    addSize(plate) addValue(plate) addColour(plate) addClass(plate) addCP(plate) addCast(plate) addHeal(plate) addBuff(plate) addPvP(plate) addTotem(plate)
                end
            end
        end
    end)

    f:RegisterEvent'PLAYER_ENTERING_WORLD'
    f:SetScript('OnEvent', function()
        if event == 'PLAYER_ENTERING_WORLD' then
             if enabled then ShowNameplates() end
        else handleCast() handleHeal() end
    end)


    --
