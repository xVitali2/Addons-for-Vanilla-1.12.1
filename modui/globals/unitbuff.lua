

    -- written by kuurtzen (& modernist)

    local buff = {} local buffList = {}
    buff.__index = buff

    buff.create = function(tar, t, buffType, time)
        local acnt     = {}
        setmetatable(acnt, buff)
        acnt.target    = tar
        acnt.type      = t
        acnt.icon      = buffType[1]
        acnt.timeStart = time
        acnt.timeEnd   = time + buffType[2]
        acnt.border	   = buffType[3] and DebuffTypeColor[buffType[3]] or {r = .2, g = .2,  b = .2}
        return acnt
    end

    local tableMaintenance = function(reset)
		if reset then
			buffList = {}
		else
			local i = 1
			for k, v in pairs(buffList) do
				if GetTime() > v.timeEnd then table.remove(buffList, i) end
				i = i + 1
			end
        end
	end

    local function newbuff(tar, t)
        local time = GetTime()
        if MODUI_BUFFS_TO_TRACK[t] ~= nil then
            local n = buff.create(tar, t, MODUI_BUFFS_TO_TRACK[t], time)
            table.insert(buffList, n)
        end
    end

    local function newdebuff(tar, t)
        local time = GetTime()
        if MODUI_DEBUFFS_TO_TRACK[t] ~= nil then
            local n = buff.create(tar, t, MODUI_DEBUFFS_TO_TRACK[t], time)
            table.insert(buffList, n)
        end
    end

    local function rembuff(tar, t)
        local i = 1
        for j, e in pairs(buffList) do
            if e.target == tar and e.type == t then
                table.remove(buffList, i)
            end
            i = i + 1
        end
    end

    PROCESSBUFFSgetBuffs = function(name)
        local list = {}
        for j, e in ipairs(buffList) do
            if e.target == name then
                table.insert(list, e)
            end
        end
        return list
    end

    local function eventHandler()
        local on = '(.+) gains (.+).'
        local off = '(.+) fades from (.+).'
        local aff = '(.+) is afflicted by (.+).'
        local rem = '(.+)\'s (.+) is removed'
        if string.find(arg1, on) then
            local tar  = gsub(arg1, on, '%1')
            local t = gsub(arg1, on, '%2')
            newbuff(tar, t)
        end
        if string.find(arg1, aff) then
            local tar  = gsub(arg1, aff, '%1')
            local t = gsub(arg1, aff, '%2')
            newdebuff(tar, t)
        end
        if string.find(arg1, off) then
            local t  = gsub(arg1, off, '%1')
            local tar = gsub(arg1, off, '%2')
            rembuff(tar, t)
        end
        if string.find(arg1, rem) then
            local t  = gsub(arg1, rem, '%1')
            local tar = gsub(arg1, rem, '%2')
            rembuff(tar, t)
        end
    end

    SLASH_DISPLAYBUFF1 = '/dbf'
    SlashCmdList["DISPLAYBUFF"] = function(msg) print'teste' end

    local f = CreateFrame'Frame'
    f:SetScript('OnUpdate', function()
        tableMaintenance(false)
    end)

    f:RegisterEvent'PLAYER_ENTERING_WORLD'
    f:RegisterEvent'CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS'
    f:RegisterEvent'CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS'
    f:RegisterEvent'CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_BUFFS'
    f:RegisterEvent'CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF'
    f:RegisterEvent'CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF'
    f:RegisterEvent'CHAT_MSG_SPELL_AURA_GONE_OTHER'
    f:RegisterEvent'CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE'
    f:RegisterEvent'CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE'

    f:SetScript('OnEvent', function()
        if event == 'PLAYER_ENTERING_WORLD' then
            tableMaintenance(true)
        else
            eventHandler()
        end
    end)

    --
