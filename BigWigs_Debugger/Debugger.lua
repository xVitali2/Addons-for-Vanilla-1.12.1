------------------------------
--      Are you local?      --
------------------------------

local name = "Big Wigs Debugger"

local L = AceLibrary("AceLocale-2.2"):new("BigWigsDebugger")
local tablet = AceLibrary("Tablet-2.0")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["Click to toggle debugging."] = true,
	["Debug"] = true,
	["|cff00ff00On|r"] = true,
	["|cffff0000Off|r"] = true,
	["Debugging set to %s."] = true,

	["Stuff that is bundled with Big Wigs that we can debug."] = true,
	["Builtin stuff"] = true,
	["Bars"] = true,
	["Toggle debugging when bars are started and stopped manually."] = true,
	["Messages"] = true,
	["Toggle debugging when messages are triggered."] = true,
	["Raid icon"] = true,
	["Toggle debugging when a raid icon is set by Big Wigs."] = true,
	["Target spotted"] = true,
	["Toggle debugging when a registered target is spotted."] = true,
	["Version query"] = true,
	["Toggle debugging when recieving version query syncs."] = true,
	["Module handling"] = true,
	["Debug events for BigWigs module handling."] = true,
	["EnableModule"] = true,
	["Toggle debugging of the EnableModule sync."] = true,
	["EnableExternal"] = true,
	["Toggle debugging of the EnableExternal sync."] = true,
	["RebootModule"] = true,
	["Toggle debugging of the RebootModule event."] = true,
	["All syncs"] = true,
	["Toggle debugging on all syncs."] = true,

	["Custom syncs"] = true,
	["Specify your own syncs to watch for."] = true,
	["Add sync"] = true,
	["Adds a sync to the list."] = true,
	["<sync>"] = true,
	["Remove sync"] = true,
	["Remove a sync from the list."] = true,
	["Remove %s."] = true,
	["Toggle debugging %s."] = true,

	["Debug frame set to %s."] = true,
	["Debug frame"] = true,
	["Set debug chatframe."] = true,
	["<frameName>"] = true,

	["|cff00ff00%s|r added to the custom sync list."] = true,
	["|cff00ff00%s|r removed from the custom sync list."] = true,

} end)

L:RegisterTranslations("ruRU", function() return {
	["Click to toggle debugging."] = "Кликните для вкл/выкл. отладки.",
	["Debug"] = "Отладка",
	["|cff00ff00On|r"] = "|cff00ff00Вкл|r",
	["|cffff0000Off|r"] = "|cffff0000Откл|r",
	["Debugging set to %s."] = "Отладка %s.",

	["Stuff that is bundled with Big Wigs that we can debug."] = "Отладка параметров построенных на Big Wigs.",
	["Builtin stuff"] = "Встроенный материал",
	["Bars"] = "Полосы",
	["Toggle debugging when bars are started and stopped manually."] = "Вкл/Выкл отладку, когда полосы запускаются и останавливаются вручную.",
	["Messages"] = "Сообщения",
	["Toggle debugging when messages are triggered."] = "Вкл/Выкл отладки во время тревожных сообщений.",
	["Raid icon"] = "Рейдовые метки",
	["Toggle debugging when a raid icon is set by Big Wigs."] = "Вкл/Выкл отладки, когда рейдовую метку ставит Big Wigs.",
	["Target spotted"] = "Замеченная цели",
	["Toggle debugging when a registered target is spotted."] = "Вкл/Выкл отладки, когда была замечена зарегистрированная цель.",
	["Version query"] = "Запрос версии",
	["Toggle debugging when recieving version query syncs."] = "Вкл/Выкл отладки, когда синхр. запрос получения версии.",
	["Module handling"] = "Модуль обработки",
	["Debug events for BigWigs module handling."] = "Отладка события BigWigs по обработки модуля.",
	["EnableModule"] = "ВключитьМодуль",
	["Toggle debugging of the EnableModule sync."] = "Вкл/Выкл отладку для синхр. ВключитьМодуль.",
	["EnableExternal"] = "ВключитьВнешний",
	["Toggle debugging of the EnableExternal sync."] = "Вкл/Выкл отладку синхр. ВключитьВнешний.",
	["RebootModule"] = "ПерезагрузитьМодуль",
	["Toggle debugging of the RebootModule event."] = "Вкл/Выкл отладку для события ПерезагрузитьМодуль.",
	["All syncs"] = "Синхр. все",
	["Toggle debugging on all syncs."] = "Вкл/Выкл отладку всех синхр.",

	["Custom syncs"] = "Польз. синхр.",
	["Specify your own syncs to watch for."] = "Укажите свою собственную синхр. для наблюдения.",
	["Add sync"] = "Добавить синхр.",
	["Adds a sync to the list."] = "Добавить синхр. в список.",
	["<sync>"] = "<sync>",
	["Remove sync"] = "Удалить синхр.",
	["Remove a sync from the list."] = "Удалить синхр. со списка.",
	["Remove %s."] = "Удалить %s.",
	["Toggle debugging %s."] = "Вкл/Выкл отладку %s.",

	["Debug frame set to %s."] = "Окно отладки установлено на %s.",
	["Debug frame"] = "Окно отладки",
	["Set debug chatframe."] = "Установить отладку в окно чата.",
	["<frameName>"] = "<frameName>",

	["|cff00ff00%s|r added to the custom sync list."] = "|cff00ff00%s|r добавлен в список пользов. синхр.",
	["|cff00ff00%s|r removed from the custom sync list."] = "|cff00ff00%s|r удален из списка пользов. синхр.",

} end)

----------------------------------
--      Addon Declaration       --
----------------------------------

BigWigsDebugger = AceLibrary("AceAddon-2.0"):new("FuBarPlugin-2.0", "AceDB-2.0", "AceEvent-2.0", "AceHook-2.1", "AceConsole-2.0")

BigWigsDebugger.debugFrame = ChatFrame5

-- FuBar stuff
BigWigsDebugger.version = "1.0." .. string.sub("$Revision: 14650 $", 12, -3)
BigWigsDebugger.date = string.sub("$Date: 2006-10-21 10:43:52 -0400 (Sat, 21 Oct 2006) $", 8, 17)
BigWigsDebugger.hasIcon = "Interface\\Icons\\Ability_Hunter_BeastCall"
BigWigsDebugger.canHideText = true

BigWigsDebugger:RegisterDB("BigWigsDebuggerDB")
BigWigsDebugger:RegisterDefaults("profile",{
	debugFrame = "ChatFrame5",
	bars = false,
	messages = false,
	raidicon = false,
	versionQuery = false,
	target = false,
	EnableModule = false,
	EnableExternal = false,
	RebootModule = false,
	customSyncList = {
		"BossEngaged",
	},
	customSyncs = {
		["BossEngaged"] = true,
	}
})

local options = {
	type = "group",
	args = {
		debug = {
			type = "toggle",
			name = L["Debug"],
			desc = L["Click to toggle debugging."],
			get = function() return BigWigs:IsDebugging() end,
			set = function(v) BigWigsDebugger:ToggleDebugging(v) end,
			order = 101,
		},
		debugframe = {
			type = "text",
			name = L["Debug frame"],
			desc = L["Set debug chatframe."],
			usage = L["<frameName>"],
			get = false,
			set = function(v) BigWigsDebugger:SetDebugFrame(v) end,
			order = 102,
		},
		spacer = { type = "header", order = 103 },
		modulehandling = {
			type = "group",
			name = L["Module handling"],
			desc = L["Debug events for BigWigs module handling."],
			order = 104,
			args = {
				enablemodule = {
					type = "toggle",
					name = L["EnableModule"],
					desc = L["Toggle debugging of the EnableModule sync."],
					get = function() return BigWigsDebugger.db.profile.EnableModule end,
					set = function(v) BigWigsDebugger.db.profile.EnableModule = v end
				},
				enableexternal = {
					type = "toggle",
					name = L["EnableExternal"],
					desc = L["Toggle debugging of the EnableExternal sync."],
					get = function() return BigWigsDebugger.db.profile.EnableExternal end,
					set = function(v) BigWigsDebugger.db.profile.EnableExternal = v end
				},
				rebootmodule = {
					type = "toggle",
					name = L["RebootModule"],
					desc = L["Toggle debugging of the RebootModule event."],
					get = function() return BigWigsDebugger.db.profile.RebootModule end,
					set = function(v) BigWigsDebugger:ToggleRebootModule(v) end
				},
			},
		},
		builtin = {
			type = "group",
			name = L["Builtin stuff"],
			desc = L["Stuff that is bundled with Big Wigs that we can debug."],
			order = 105,
			args = {
				allsync = {
					type = "toggle",
					name = L["All syncs"],
					desc = L["Toggle debugging on all syncs."],
					get = function() return BigWigsDebugger.db.profile.allSyncs end,
					set = function(v) BigWigsDebugger.db.profile.allSyncs = v end,
				},
				bars = {
					type = "toggle",
					name = L["Bars"],
					desc = L["Toggle debugging when bars are started and stopped manually."],
					get = function() return BigWigsDebugger.db.profile.bars end,
					set = function(v) BigWigsDebugger:ToggleBars(v) end,
					hidden = function() return not BigWigsBars end,
				},
				messages = {
					type = "toggle",
					name = L["Messages"],
					desc = L["Toggle debugging when messages are triggered."],
					get = function() return BigWigsDebugger.db.profile.messages end,
					set = function(v) BigWigsDebugger:ToggleMessages(v) end,
					hidden = function() return not BigWigsMessages end,
				},
				raidicon = {
					type = "toggle",
					name = L["Raid icon"],
					desc = L["Toggle debugging when a raid icon is set by Big Wigs."],
					get = function() return BigWigsDebugger.db.profile.raidicon end,
					set = function(v) BigWigsDebugger:ToggleRaidIcon(v) end,
					hidden = function() return not BigWigsRaidIcon end,
				},
				target = {
					type = "toggle",
					name = L["Target spotted"],
					desc = L["Toggle debugging when a registered target is spotted."],
					get = function() return BigWigsDebugger.db.profile.target end,
					set = function(v) BigWigsDebugger:ToggleTargetSeen(v) end,
					hidden = function() return not BigWigsTargetMonitor end,
				},
				version = {
					type = "toggle",
					name = L["Version query"],
					desc = L["Toggle debugging when recieving version query syncs."],
					get = function() return BigWigsDebugger.db.profile.versionQuery end,
					set = function(v) BigWigsDebugger.db.profile.versionQuery = v end,
					hidden = function() return not BigWigsVersionQuery end,
				},
			},
		},
		custom = {
			type = "group",
			name = L["Custom syncs"],
			desc = L["Specify your own syncs to watch for."],
			order = 106,
			args = {},
		},
	},
}

BigWigsDebugger.OnMenuRequest = options

----------------------------------
--      Initialization          --
----------------------------------

local originalState = nil
function BigWigsDebugger:OnEnable()
	originalState = BigWigs:IsDebugging()
	if originalState == nil then
		self:ToggleDebugging(false)
	else
		self:ToggleDebugging(originalState)
	end

	self:SetDebugFrame(self.db.profile.debugFrame)

	self:UpdateSyncList()
end

function BigWigsDebugger:OnDisable()
	if BigWigs then BigWigs:SetDebugging(originalState) end
end

function BigWigsDebugger:SafeUnregister( event )
	-- Crappy AceEvent.
	if self:IsEventRegistered(event) then
		self:UnregisterEvent(event)
	end
end

----------------------------------
--      Custom sync handling    --
----------------------------------

function BigWigsDebugger:AddSync( sync )
	if not sync then return end
	sync = string.gsub(sync, " ", "")

	for k, syncName in pairs(self.db.profile.customSyncList) do
		if sync == syncName then return end
	end
	table.insert(self.db.profile.customSyncList, sync)

	self:Print(string.format(L["|cff00ff00%s|r added to the custom sync list."], sync))

	self:UpdateSyncList()
end

function BigWigsDebugger:RemoveSync( sync )
	for k, syncName in pairs(self.db.profile.customSyncList) do
		if sync == syncName then
			table.remove(self.db.profile.customSyncList, k)
			self:Print(string.format(L["|cff00ff00%s|r removed from the custom sync list."], sync))
			break
		end
	end
	self:UpdateSyncList()
end

function BigWigsDebugger:UpdateSyncList()

	options.args.custom.args = {}
	options.args.custom.args["add"] = {}
	options.args.custom.args["add"].type = "text"
	options.args.custom.args["add"].name = L["Add sync"]
	options.args.custom.args["add"].desc = L["Adds a sync to the list."]
	options.args.custom.args["add"].usage = L["<sync>"]
	options.args.custom.args["add"].order = 101
	options.args.custom.args["add"].get = false
	options.args.custom.args["add"].set = function(v) BigWigsDebugger:AddSync(v) end

	options.args.custom.args["remove"] = {}
	options.args.custom.args["remove"].type = "group"
	options.args.custom.args["remove"].name = L["Remove sync"]
	options.args.custom.args["remove"].desc = L["Remove a sync from the list."]
	options.args.custom.args["remove"].order = 102
	options.args.custom.args["remove"].args = {}

	options.args.custom.args["spacer2"] = {}
	options.args.custom.args["spacer2"].type = "header"
	options.args.custom.args["spacer2"].order = 103

	for _, sync in pairs(self.db.profile.customSyncList) do
		local syncName = sync
		if syncName then
			options.args.custom.args["remove"].args[sync] = {}
			options.args.custom.args["remove"].args[sync].type = "execute"
			options.args.custom.args["remove"].args[sync].name = syncName
			options.args.custom.args["remove"].args[sync].desc = string.format(L["Remove %s."], syncName)
			options.args.custom.args["remove"].args[sync].func = function() self:RemoveSync(syncName) end
		end
	end

	local counter = 4
	for _, sync in pairs(self.db.profile.customSyncList) do
		local syncName = sync
		if syncName then
			options.args.custom.args[syncName] = {}
			options.args.custom.args[syncName].type = "toggle"
			options.args.custom.args[syncName].name = syncName
			options.args.custom.args[syncName].desc = string.format(L["Toggle debugging %s."], syncName)
			options.args.custom.args[syncName].order = 100 + counter
			options.args.custom.args[syncName].get = function() return self.db.profile.customSyncs[syncName] end
			options.args.custom.args[syncName].set = function(v)
				self.db.profile.customSyncs[syncName] = not self.db.profile.customSyncs[syncName]
			end
		end
	end
end

----------------------------------
--      Debug toggling          --
----------------------------------

function BigWigsDebugger:ToggleDebugging( debug )
	BigWigs:SetDebugging( debug )
	self:OnTextUpdate()
	if debug and BigWigs:IsDebugging() then
		self:RegisterEvent("BigWigs_RecvSync")
	else
		self:SafeUnregister("BigWigs_RecvSync")
	end

	self:ToggleRebootModule(self.db.profile.RebootModule)
	self:ToggleBars(self.db.profile.bars)
	self:ToggleMessages(self.db.profile.messages)
	self:ToggleRaidIcon(self.db.profile.raidicon)
	self:ToggleTargetSeen(self.db.profile.target)
end

function BigWigsDebugger:ToggleTargetSeen( debug )
	self.db.profile.target = debug
	if debug and BigWigs:IsDebugging() then
		self:RegisterEvent("BigWigs_TargetSeen") -- unitname, unitid
	else
		self:SafeUnregister("BigWigs_TargetSeen")
	end
end

function BigWigsDebugger:ToggleRaidIcon( debug )
	self.db.profile.raidicon = debug
	if debug and BigWigs:IsDebugging() then
		self:RegisterEvent("BigWigs_SetRaidIcon") -- player name
		self:RegisterEvent("BigWigs_RemoveRaidIcon")
	else
		self:SafeUnregister("BigWigs_SetRaidIcon")
		self:SafeUnregister("BigWigs_RemoveRaidIcon")
	end
end

function BigWigsDebugger:ToggleMessages( debug )
	self.db.profile.messages = debug
	if debug and BigWigs:IsDebugging() then
		self:RegisterEvent("BigWigs_Message") -- text, color, noraidsay, sound
	else
		self:SafeUnregister("BigWigs_Message")
	end
end

function BigWigsDebugger:ToggleBars( debug )
	self.db.profile.bars = debug
	if debug and BigWigs:IsDebugging() then
		self:RegisterEvent("BigWigs_StartBar") -- module, text, time, icon
		self:RegisterEvent("BigWigs_StopBar") -- module, text
	else
		self:SafeUnregister("BigWigs_StartBar")
		self:SafeUnregister("BigWigs_StopBar")
	end
end

function BigWigsDebugger:ToggleRebootModule( debug )
	self.db.profile.RebootModule = debug
	if debug and BigWigs:IsDebugging() then
		self:RegisterEvent("BigWigs_RebootModule") -- module
	else
		self:SafeUnregister("BigWigs_RebootModule")
	end
end

----------------------------------
--      Debug printing          --
----------------------------------

function BigWigsDebugger:SetDebugFrame( frameName )
	if not getglobal(frameName) or getglobal(frameName):GetObjectType() ~= "ScrollingMessageFrame" then
		frameName = "ChatFrame5"
	end
	self:Print(string.format(L["Debug frame set to %s."], frameName))
	self.debugFrame = getglobal(frameName)
	BigWigs.debugFrame = getglobal(frameName)
end

function BigWigsDebugger:PrintDebug( message, sender )
	self:CustomPrint(1, 1, 1, self.debugFrame, nil, " ", date("%H:%M:%S").." ["..sender.."]: "..message)
end

----------------------------------
--      Big Wigs Events         --
----------------------------------

function BigWigsDebugger:BigWigs_TargetSeen( unitName, unitId )
	self:PrintDebug("Target ["..unitName.."] ("..unitId..") spotted.", "Global")
end

function BigWigsDebugger:BigWigs_SetRaidIcon( player )
	self:PrintDebug("Setting raid icon on ["..player.."].", "Global")
end

function BigWigsDebugger:BigWigs_RemoveRaidIcon()
	self:PrintDebug("Clearing raid icon.", "Global")
end

function BigWigsDebugger:BigWigs_Message( text, color, noraidsay, sound )
	self:PrintDebug("Message ["..text.."]", "Global")
end

function BigWigsDebugger:BigWigs_StartBar( module, text, time, icon )
	self:PrintDebug("Starting bar ["..text..":"..time.."].", module:ToString())
end

function BigWigsDebugger:BigWigs_StopBar( module, text )
	self:PrintDebug("Stopping bar ["..text.."].", module:ToString())
end

function BigWigsDebugger:BigWigs_RebootModule( module )
	self:PrintDebug("Reboot "..module:ToString(), "Global")
end

BigWigsDebugger.syncHandlers = {}
-- Version query: BWVQ <zone>, BWVR <rev>
BigWigsDebugger.syncHandlers["BWVQ"] = function( sync, rest, nick )
	if not BigWigsDebugger.db.profile.versionQuery then return end
	BigWigsDebugger:PrintDebug("Version query on zone ["..rest.."].", nick)
end
BigWigsDebugger.syncHandlers["BWVR"] = function( sync, rest, nick )
	if not BigWigsDebugger.db.profile.versionQuery then return end
	BigWigsDebugger:PrintDebug("Version response ["..rest.."].", nick)
end
-- EnableModule/EnableExternal <modulename>
BigWigsDebugger.syncHandlers["EnableModule"] = function( sync, rest, nick )
	if not BigWigsDebugger.db.profile.EnableModule then return end
	BigWigsDebugger:PrintDebug("Module ["..rest.."] enable sync.", nick)
end
BigWigsDebugger.syncHandlers["EnableExternal"] = function( sync, rest, nick )
	if not BigWigsDebugger.db.profile.EnableExternal then return end
	BigWigsDebugger:PrintDebug("External ["..rest.."] enable sync.", nick)
end

-- Custom syncs
BigWigsDebugger.syncHandlers["BossEngaged"] = function( sync, rest, nick )
	BigWigsDebugger:PrintDebug("Boss ["..rest.."] engaged.", nick)
end

function BigWigsDebugger:BigWigs_RecvSync( sync, rest, nick )
	if self.syncHandlers[sync] then
		self.syncHandlers[sync](sync, rest, nick)
	elseif self.db.profile.allSyncs or self.db.profile.customSyncs[sync] then
		self:PrintDebug(sync..": "..rest, nick)
	end
end

----------------------------------
--      FuBar Methods           --
----------------------------------

function BigWigsDebugger:OnTooltipUpdate()
	local cat = tablet:AddCategory("text", L["Debug"])
	cat:AddLine("text", BigWigs:IsDebugging() and L["|cff00ff00On|r"] or L["|cffff0000Off|r"])
	tablet:SetHint(L["Click to toggle debugging."])
end

function BigWigsDebugger:OnClick()
	BigWigs:SetDebugging(not BigWigs:IsDebugging())

	self:ToggleDebugging(BigWigs:IsDebugging())

	self:Print(string.format(L["Debugging set to %s."], BigWigs:IsDebugging() and L["|cff00ff00On|r"] or L["|cffff0000Off|r"]))
end

function BigWigsDebugger:OnTextUpdate()
	self:SetText(BigWigs:IsDebugging() and L["|cff00ff00On|r"] or L["|cffff0000Off|r"])
end