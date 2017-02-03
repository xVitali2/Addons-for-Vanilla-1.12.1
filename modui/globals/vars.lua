

    local f = CreateFrame('Frame', 'modui_vars', UIParent)

    -- usage:         _G['modui_vars'].db['name']

    -- TODO:    gradually switch from using such a large quantity of SavedVariablesPerCharacter
    --          to this table of vars.
    --          some of this will require substantial rewrites to be accomodated.
    --          i.e: a saved variable currently informs whether an element should be loaded or not at the top of a file
    --          but variables will probably not be unpacked and updated until PLAYER_LOGIN

    local default = {
        -- existing
        ['modAction']             = 0,
        ['modStatus']             = 1,
        ['modValue']              = 1,
        ['modBoth']               = 1,
        ['modGryphon']            = 1,
        ['modEndcap']             = 1,
        ['modTimestamp']          = 0,
        ['modAuraFormat']         = 0,
        ['modOneBag']             = 1,
        ['modChatFormat']         = 1,
        ['modItemLink']           = 1,
        ['modBattleMap']          = 1,
        ['modWorldMap']           = 1,
        ['modDungeonMap']         = 1,
        ['modNameplate']          = 1,
        ['modQuestWatch']         = 1,
        ['modTooltip']            = 1,
        ['modUnitFrame']          = 1,
        ['modPVPTimers']          = 1,
        ['modPVPRank']            = 1,
        ['modStopWatch']          = 1,
        ['modShowTooltipMover']   = 0,
        ['modShowTooltipCursor']  = 0,
        ['modPlayerCastbar']      = 0,
        ['modMoveTargetCastbar']  = 0,
        ['modSCTDMG']             = 0,
        ['modSCTHEAL']            = 0,
        ['modClock']              = 0,
        ['modAllElements']        = 1,
        -- new
        ['modAuraOrientation']    = 0,
        ['modEditBoxOrientation'] = 1,
        ['modWhiteStatusText']    = 0,
        ['modKeyDown']            = 1,
        ['modKeydownSelf']        = 1,
        ['modCDCount']            = 1,
        -- raid
        ['modGridSize']           = 1,
        ['mod40yd']               = 1,
        ['modRaidX']              = 53,
        ['modRaidY']              = 53,
        ['modRaidLeft2Right']     = 1,

    }

    -- this function copies values from one table into another:
    local initDB = function(db, defaults)
		if type(db) ~= 'table' then db = {} end
		if type(defaults) ~= 'table' then return db end
		for k, v in pairs(defaults) do
			if type(v) == 'table' then
				db[k] = initDB(db[k], v)
			elseif type(v) ~= type(db[k]) then
				db[k] = v
			end
		end
		return db
	end

    f:RegisterEvent'PLAYER_LOGIN'
    f:SetScript('OnEvent', function()
        MODUI_VARS = initDB(MODUI_VARS, default)
    	f.db = MODUI_VARS
    end)

    --
