
------------------------------
--      Are you local?      --
------------------------------

local BZ = AceLibrary("Babble-Zone-2.2")
local BB = AceLibrary("Babble-Boss-2.2")
local L = AceLibrary("AceLocale-2.2"):new("BigWigs")

local surface = AceLibrary("Surface-1.0")

surface:Register("Armory", "Interface\\AddOns\\BigWigs TW\\Textures\\Armory")
surface:Register("Otravi", "Interface\\AddOns\\BigWigs TW\\Textures\\otravi")
surface:Register("Smooth", "Interface\\AddOns\\BigWigs TW\\Textures\\smooth")
surface:Register("Glaze", "Interface\\AddOns\\BigWigs TW\\Textures\\glaze")
surface:Register("Charcoal", "Interface\\AddOns\\BigWigs TW\\Textures\\Charcoal")
surface:Register("BantoBar", "Interface\\AddOns\\BigWigs TW\\Textures\\default")

----------------------------
--    Raid Class Colors   --
----------------------------

RAID_CLASS_COLORS = {
	["HUNTER"] = { r = 0.67, g = 0.83, b = 0.45, colorStr = "ffabd473" },
	["WARLOCK"] = { r = 0.53, g = 0.53, b = 0.93, colorStr = "ff8788ee" },
	["PRIEST"] = { r = 1.0, g = 1.0, b = 1.0, colorStr = "ffffffff" },
	["PALADIN"] = { r = 0.96, g = 0.55, b = 0.73, colorStr = "fff58cba" },
	["MAGE"] = { r = 0.25, g = 0.78, b = 0.92, colorStr = "ff3fc7eb" },
	["ROGUE"] = { r = 1.0, g = 0.96, b = 0.41, colorStr = "fffff569" },
	["DRUID"] = { r = 1.0, g = 0.49, b = 0.04, colorStr = "ffff7d0a" },
	["SHAMAN"] = { r = 0.0, g = 0.44, b = 0.87, colorStr = "ff0070de" },
	["WARRIOR"] = { r = 0.78, g = 0.61, b = 0.43, colorStr = "ffc79c6e" },
}
-- AceConsole zone commands
BIGWIGS_ZONE_NAMES = {
	["Karazhan"] = "1.Kara",
	["Zul'Gurub"] = "2.ZG",
	["Ruins of Ahn'Qiraj"] = "3.AQ20",
	["Molten Core"] = "4.MC",
	["Blackwing Lair"] = "5.BWL",
	["Emerald Sanctum"] = "6.ES",
	["Ahn'Qiraj"] = "7.AQ40",
	["Naxxramas"] = "8.Naxxramas",
	["Onyxia's Lair"] = "Onyxia",
	["Silithus"] = "Silithus",
	["Outdoor Raid Bosses"] = "Outdoor",
	["Outdoor Raid Bosses Zone"] = "Outdoor",
}
----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["%s mod enabled"] = true,
	["Target monitoring enabled"] = true,
	["Target monitoring disabled"] = true,
	["%s engaged!"] = true,
	["%s has been defeated"] = true,     -- "<boss> has been defeated"
	["%s have been defeated"] = true,    -- "<bosses> have been defeated"

	-- AceConsole strings
	["boss"] = true,
	["Bosses"] = true,
	["Options for boss modules."] = true,
	["Options for bosses in %s."] = true, -- "Options for bosses in <zone>"
	["Options for %s (r%s)."] = true,     -- "Options for <boss> (<revision>)"
	["plugin"] = true,
	["Plugins"] = true,
	["Options for plugins."] = true,
	["extra"] = true,
	["Extras"] = true,
	["Options for extras."] = true,
	["toggle"] = true,
	["Active"] = true,
	["Activate or deactivate this module."] = true,
	["reboot"] = true,
	["rebootall"] = true,
	["Reboot"] = true,
	["Reboot All"] = true,
	["Reboot this module."] = true,
	["debug"] = true,
	["Debugging"] = true,
	["Show debug messages."] = true,
	["Forces the module to reset for everyone in the raid.\n\n(Requires assistant or higher)"] = true,
	["%s has requested forced reboot for the %s module."] = true,
	bosskill_cmd = "kill",
	bosskill_name = "Boss death",
	bosskill_desc = "Announce when boss is defeated",

	["Other"] = true,
	["Load"] = true,
	["Load All"] = true,
	["Load all %s modules."] = true,

	-- AceConsole zone commands
	["Karazhan"] = "Kara",
	["Zul'Gurub"] = "ZG",
	["Molten Core"] = "MC",
	["Blackwing Lair"] = "BWL",
	["Ahn'Qiraj"] = "AQ40",
	["Ruins of Ahn'Qiraj"] = "AQ20",
	["Onyxia's Lair"] = "Onyxia",
	["Emerald Sanctum"] = "ES",
	["Naxxramas"] = "Naxxramas",
	["Silithus"] = true,
	["Outdoor Raid Bosses"] = "Outdoor",
	["Outdoor Raid Bosses Zone"] = "Outdoor Raid Bosses", -- DO NOT EVER TRANSLATE untill I find a more elegant option
	
	["Battlegrounds"] = true,
	["Alterac Valley"] = true,
	["Arathi Basin"] = true,
	
	--Name for exception bosses (neutrals that enable modules)
	["Vaelastrasz the Corrupt"] = true,
	["Lord Victor Nefarius"] = true,

	["You have slain %s!"] = true,
} end)

L:RegisterTranslations("ruRU", function() return { --by CFM
	["%s mod enabled"] = "%s мод включен",
	["Target monitoring enabled"] = "Мониторинг цели включен",
	["Target monitoring disabled"] = "Мониторинг цели выключен",
	["%s engaged!"] = "%s занят!",
	["%s has been defeated"] = "%s побеждён",     -- "<boss> has been defeated"
	["%s have been defeated"] = "%s побеждены",    -- "<bosses> have been defeated"

	-- AceConsole strings
	["Bosses"] = "Боссы",
	["Options for boss modules."] = "Опции для босс модулей.",
	["Options for bosses in %s."] = "Опции для боссов в %s.",
	["Options for %s (r%s)."] = "Опции для %s (r%d).",
	["Plugins"] = "Плагины",
	["Options for plugins."] = "Опции для плагинов.",
	["Extras"] = "Дополнения",
	["Options for extras."] = "Опции для дополнения.",
	["Active"] = "Активен",
	["Activate or deactivate this module."] = "Активация или деактивация модуля",
	["Reboot"] = "Перезагрузка",
	["Reboot All"] = "Перезагрузить всё",
	["Reboot this module."] = "Перезагрузка данного модуля",
	["Debugging"] = "Отладка",
	["Show debug messages."] = "Показать отладочные сообщения.",
	["Forces the module to reset for everyone in the raid.\n\n(Requires assistant or higher)"] = "Заставить модуль перезагрузить для всех в рейде.\n\n(Требуется ассист или выше)",
	["%s has requested forced reboot for the %s module."] = "%s запрос на перезагрузку %s модуля.",
	--bosskill_cmd = "убит",
	bosskill_name = "Смерть босса",
	bosskill_desc = "Объявлять о смерти босса.",

	["Other"] = "Другое",
	["Load"] = "Загрузить",
	["Load All"] = "Загрузить всё",
	["Load all %s modules."] = "Загрузить все модули %s.",

	-- AceConsole zone commands
	["Zul'Gurub"] = "ЗГ",
	["Molten Core"] = "МК",
	["Blackwing Lair"] = "БВЛ",
	["Ahn'Qiraj"] = "АК40",
	["Ruins of Ahn'Qiraj"] = "АК20",
	["Onyxia's Lair"] = "Ониксия",
	["Naxxramas"] = "Наксрамас",
	["Silithus"] = "Силитус",
	["Outdoor Raid Bosses"] = "Внешние",
	["Outdoor Raid Bosses Zone"] = "ВнешниеБоссы", -- DO NOT EVER TRANSLATE untill I find a more elegant option

	["Battlegrounds"] = "Поля боя",
	["Alterac Valley"] = "Альтеракская долина",
	["Arathi Basin"] = "Низина Арати",

	--Name for exception bosses (neutrals that enable modules)
	["Vaelastrasz the Corrupt"] = "Валестраз Порочный",
	["Lord Victor Nefarius"] = "Лорд Виктор Нефариус",

	["You have slain %s!"] = "Вы убили %s!",
} end)

L:RegisterTranslations("esES", function() return {
	["%s mod enabled"] = "Módulo de %s activado",
	["Target monitoring enabled"] = "Monitorización del objetivo activado",
	["Target monitoring disabled"] = "Monitorización del objetivo desactivado",
	["%s engaged!"] = "¡Entrando en combate con %s!",
	["%s has been defeated"] = "%s fue derrotado",     -- "<boss> has been defeated"
	["%s have been defeated"] = "%s fueron derrotados",    -- "<bosses> have been defeated"

	-- AceConsole strings
	--["boss"] = "jefe",
	["Bosses"] = "Jefes",
	["Options for boss modules."] = "Opciones para módulos del jefe",
	["Options for bosses in %s."] = "Opciones para jefes en %s", -- "Options for bosses in <zone>"
	["Options for %s (r%s)."] = "Opciones para %s (r%s).",     -- "Options for <boss> (<revision>)"
	--["plugin"] = "plugin",
	["Plugins"] = "Plugins",
	["Options for plugins."] = "Opciones para plugins",
	--["extra"] = "extra",
	["Extras"] = "Extras",
	["Options for extras."] = "Opciones para extras",
	--["toggle"] = "alternar",
	["Active"] = "Activo",
	["Activate or deactivate this module."] = "Activa o desactiva este módulo",
	--["reboot"] = "reiniciar",
	--["rebootall"] = "reiniciartodos",
	["Reboot"] = "Reiniciar",
	["Reboot All"] = "Reiniciar Todos",
	["Reboot this module."] = "Reinicia este módulo",
	--["debug"] = "depurar",
	["Debugging"] = "Depurando",
	["Show debug messages."] = "Muestra mensajes de depura",
	["Forces the module to reset for everyone in the raid.\n\n(Requires assistant or higher)"] = "Obliga al módulo que se reinicia para todos en la banda.\n\n(Requiere que seas asistente o líder)",
	["%s has requested forced reboot for the %s module."] = "%s solicita un reinicio para el módulo %s",
	--bosskill_cmd = "kill",
	bosskill_name = "Muerte del Jefe",
	bosskill_desc = "Anuncia cuando sea derrotado el jefe",

	["Other"] = "Otro",
	["Load"] = "Cargar",
	["Load All"] = "Cargar todos",
	["Load all %s modules."] = "Carga todos los módulos %s",

	-- AceConsole zone commands
	["Zul'Gurub"] = "ZG",
	["Molten Core"] = "NM",
	["Blackwing Lair"] = "GAN",
	["Ahn'Qiraj"] = "AQ40",
	["Ruins of Ahn'Qiraj"] = "AQ20",
	["Onyxia's Lair"] = "Onyxia",
	["Naxxramas"] = "Naxxramas",
	["Silithus"] = "Silithus",
	["Outdoor Raid Bosses"] = "Afuera",
	-- ["Outdoor Raid Bosses Zone"] = "Outdoor Raid Bosses", -- DO NOT EVER TRANSLATE untill I find a more elegant option

	--Name for exception bosses (neutrals that enable modules)
	["Vaelastrasz the Corrupt"] = "Vaelastrasz el Corrupto",
	["Lord Victor Nefarius"] = "Lord Victor Nefarius",

	["You have slain %s!"] = "¡Has matado %s!",
} end)

L:RegisterTranslations("deDE", function() return {
	["%s mod enabled"] = "%s Modul aktiviert",
	["Target monitoring enabled"] = "Zielüberwachung aktiviert",
	["Target monitoring disabled"] = "Zielüberwachung deaktiviert",
	["%s engaged!"] = "%s angegriffen!",
	["%s has been defeated"] = "%s wurde besiegt",     -- "<boss> has been defeated"
	["%s have been defeated"] = "%s wurden besiegt",    -- "<bosses> have been defeated"

	-- AceConsole strings
	-- ["boss"] = true,
	["Bosses"] = "Bosse",
	["Options for boss modules."] = "Optionen für Boss Module.",
	["Options for bosses in %s."] = "Optionen für Bosse in %s.", -- "Options for bosses in <zone>"
	["Options for %s (r%s)."] = "Optionen für %s (r%s).",     -- "Options for <boss> (<revision>)"
	-- ["plugin"] = true,
	["Plugins"] = "Plugins",
	["Options for plugins."] = "Optionen für Plugins.",
	-- ["extra"] = true,
	["Extras"] = "Extras",
	["Options for extras."] = "Optionen für Extras.",
	-- ["toggle"] = true,
	["Active"] = "Aktivieren",
	["Activate or deactivate this module."] = "Aktiviert oder deaktiviert dieses Modul.",
	-- ["reboot"] = true,
	["Reboot"] = "Neustarten",
	["Reboot All"] = "Alles Neustarten",
	["Reboot this module."] = "Startet dieses Modul neu.",
	-- ["debug"] = true,
	["Debugging"] = "Debugging",
	["Show debug messages."] = "Zeige Debug Nachrichten.",
	["Forces the module to reset for everyone in the raid.\n\n(Requires assistant or higher)"] = "Erzwingt dass das Modul für jeden im Raid zurückgesetzt wird.\n\n(Benötigt Schlachtzugleiter oder Assistent)",
	["%s has requested forced reboot for the %s module."] = "%s hat einen Zwangsneustart für das %s-Modul beantragt.",
	-- bosskill_cmd = "kill",
	bosskill_name = "Boss besiegt",
	bosskill_desc = "Melde, wenn ein Boss besiegt wurde.",

	-- AceConsole zone commands
	["Zul'Gurub"] = "ZG",
	["Molten Core"] = "MC",
	["Blackwing Lair"] = "BWL",
	["Ahn'Qiraj"] = "AQ40",
	["Ruins of Ahn'Qiraj"] = "AQ20",
	["Onyxia's Lair"] = "Onyxia",
	["Naxxramas"] = "Naxxramas",
	-- ["Silithus"] = true,
	["Outdoor Raid Bosses"] = "Outdoor",
	-- ["Outdoor Raid Bosses Zone"] = "Outdoor Raid Bosses", -- DO NOT EVER TRANSLATE untill I find a more elegant option

	["You have slain %s!"] = "Ihr habt %s getötet!",
} end)


---------------------------------
--      Addon Declaration      --
---------------------------------

BigWigs = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceDebug-2.0", "AceModuleCore-2.0", "AceConsole-2.0", "AceDB-2.0", "AceHook-2.1")
BigWigs:SetModuleMixins("AceDebug-2.0", "AceEvent-2.0", "CandyBar-2.1")
BigWigs:RegisterDB("BigWigsDB", "BigWigsDBPerChar")
BigWigs.cmdtable = {type = "group", handler = BigWigs, args = {
	[L["boss"]] = {
		type = "group",
		name = L["Bosses"],
		desc = L["Options for boss modules."],
		args = {},
		disabled = function() return not BigWigs:IsActive() end,
	},
	[L["plugin"]] = {
		type = "group",
		name = L["Plugins"],
		desc = L["Options for plugins."],
		args = {},
		disabled = function() return not BigWigs:IsActive() end,
	},
	[L["extra"]] = {
		type = "group",
		name = L["Extras"],
		desc = L["Options for extras."],
		args = {},
		disabled = function() return not BigWigs:IsActive() end,
	},
}}
BigWigs:RegisterChatCommand({"/bw", "/BigWigs"}, BigWigs.cmdtable)
BigWigs.debugFrame = ChatFrame1
BigWigs.revision = 20034


function BigWigs:DebugMessage(msg, module)
	if not msg then msg = "" end
	local prefix = "|cfB34DFFf[BigWigs Debug]|r - ";
	local core = BigWigs
	local debugFrame = DEFAULT_CHAT_FRAME
	if module then
		if module.core then
			core = module.core
		end
		if module.debugFrame then
			debugFrame = self.debugFrame
		end
	end

	if core:IsDebugging() then
		(debugFrame or DEFAULT_CHAT_FRAME):AddMessage(prefix .. msg)
	end
end

------------------------------
--      KLHThreatMeter      --
------------------------------

function BigWigs:KTM_Reset()
	if IsAddOnLoaded("KLHThreatMeter") then
		if IsRaidLeader() or IsRaidOfficer() then
			klhtm.net.clearraidthreat()
		end
	end
end

BigWigs.masterTarget = nil;
BigWigs.forceReset = nil;

function BigWigs:KTM_ClearTarget(forceReset)
	if IsAddOnLoaded("KLHThreatMeter") and (IsRaidLeader() or IsRaidOfficer()) then
		klhtm.net.clearmastertarget()
		if forceReset then
			self:KTM_Reset()
		end
	end
end

function BigWigs:PLAYER_TARGET_CHANGED()
	if IsAddOnLoaded("KLHThreatMeter") and BigWigs.masterTarget and (IsRaidLeader() or IsRaidOfficer()) then
		if klhtm.target.targetismaster(BigWigs.masterTarget) then
			-- the masterTarget was already setup correctly
			BigWigs:UnregisterEvent("PLAYER_TARGET_CHANGED")
			BigWigs.masterTarget   	= nil
			BigWigs.forceReset		= nil
			return
		end

		if UnitName("target") == BigWigs.masterTarget then
			-- our new target is the wanted target, setup masterTarget now
			klhtm.net.sendmessage("target " .. BigWigs.masterTarget)
			if BigWigs.forceReset then
				BigWigs:KTM_Reset()
				BigWigs.forceReset = nil
			end
			BigWigs.masterTarget   = nil
			BigWigs:UnregisterEvent("PLAYER_TARGET_CHANGED")
		end
	else
		BigWigs:UnregisterEvent("PLAYER_TARGET_CHANGED")
	end
end


--------------------------------
--      Module Prototype      --
--------------------------------

-- do not override
BigWigs.modulePrototype.core = BigWigs
BigWigs.modulePrototype.debugFrame = ChatFrame1
BigWigs.modulePrototype.engaged = false
BigWigs.modulePrototype.bossSync = nil -- "Ouro"

-- override
BigWigs.modulePrototype.revision = 1 -- To be overridden by the module!
BigWigs.modulePrototype.started = false
BigWigs.modulePrototype.zonename = nil -- AceLibrary("Babble-Zone-2.2")["Ahn'Qiraj"]
BigWigs.modulePrototype.enabletrigger = nil -- boss
BigWigs.modulePrototype.wipemobs = nil -- adds that will be considered in CheckForEngage
BigWigs.modulePrototype.toggleoptions = nil -- {"sweep", "sandblast", "scarab", -1, "emerge", "submerge", -1, "berserk", "bosskill"}
BigWigs.modulePrototype.proximityCheck = nil -- function(unit) return CheckInteractDistance(unit, 2) end
BigWigs.modulePrototype.proximitySilent = nil -- false

-- do not override
function BigWigs.modulePrototype:IsBossModule()
	return self.zonename and self.enabletrigger and true
end
-- do not override
function BigWigs.modulePrototype:DebugMessage(msg)
	self.core:DebugMessage(msg, self)
end
-- do not override
function BigWigs.modulePrototype:OnInitialize()
	-- Unconditionally register, this shouldn't happen from any other place
	-- anyway.
	self.core:RegisterModule(self.name, self)

	-- Notify observers that we have loaded.
	self:TriggerEvent("BigWigs_ModuleLoaded", self.name, self)

	-- workaround to trigger OnSetup if enabled manually
	self:RegisterEvent("Ace2_AddonEnabled")
end
function BigWigs.modulePrototype:Ace2_AddonEnabled(module)
	if module and type(module) == "table" and module:ToString() == self:ToString() and self:IsBossModule() then
		BigWigs:SetupModule(module:ToString())
	end
end


-- override
function BigWigs.modulePrototype:OnSetup()
end
function BigWigs.modulePrototype:OnEngage()
end
function BigWigs.modulePrototype:OnDisengage()
end

-- do not override
function BigWigs.modulePrototype:Engage()
	self:DebugMessage("Engage() " .. self:ToString())

	if not BigWigs:IsModuleActive(self) then
		BigWigs:EnableModule(self:ToString())
	end

	if self.bossSync and not self.engaged then
		self.engaged = true
		self:Message(string.format(L["%s engaged!"], self.translatedName), "Positive")
		BigWigsBossRecords:StartBossfight(self)
		self:KTM_SetTarget(self:ToString())

		self:OnEngage()
	end
end
function BigWigs.modulePrototype:Disengage()
	if BigWigs:IsModuleActive(self) then
		self.engaged = false
		self.started = false

		self:CancelAllScheduledEvents()

		self:KTM_ClearTarget()

		BigWigsAutoReply:EndBossfight()

		self:RemoveIcon()
		self:RemoveWarningSign("", true)
		BigWigsBars:Disable(self)
		BigWigsBars:BigWigs_HideCounterBars()

		self:RemoveProximity()

		self:OnDisengage()
	end
end
function BigWigs.modulePrototype:Victory()
	if self.engaged then
		if self.db.profile.bosskill then
			self:Message(string.format(L["%s has been defeated"], self.translatedName), "Bosskill", nil, "Victory")
		end

		BigWigsBossRecords:EndBossfight(self)

		self:DebugMessage("Boss dead, disabling module ["..self:ToString().."].")
		self.core:DisableModule(self:ToString())
	end
end
function BigWigs.modulePrototype:Disable()
	self:Disengage()
	self.core:ToggleModuleActive(self, false)
end

-- synchronize functions
function BigWigs.modulePrototype:GetEngageSync()
	return "BossEngaged"
end
function BigWigs.modulePrototype:SendEngageSync()
	if self.bossSync then
		--self:TriggerEvent("BigWigs_SendSync", "BossEngaged "..self:ToString())
		self:Sync(self:GetEngageSync() .. " " .. self.bossSync)
	end
end

function BigWigs.modulePrototype:GetWipeSync()
	return "BossWipe"
end
--[[function BigWigs.modulePrototype:SendWipeSync()
if self.bossSync then
--self:TriggerEvent("BigWigs_SendSync", "BossEngaged "..self:ToString())
self:Sync(self:GetWipeSync() .. " " .. self.bossSync)
end
end]]

function BigWigs.modulePrototype:GetBossDeathSync()
	return "BossDeath"
end
function BigWigs.modulePrototype:SendBossDeathSync()
	if self.bossSync then
		--self:TriggerEvent("BigWigs_SendSync", "Bosskill "..self.bossSync)
		self:Sync(self:GetBossDeathSync() .. " " .. self.bossSync)
	end
end

-- event handler
local yellTriggers = {} -- [i] = {yell, bossmod}
function BigWigs.modulePrototype:RegisterYellEngage(yell)
	-- Bosses with Yells as Engagetrigger should go through even when the bossmod isn't active yet.
	tinsert(yellTriggers, {yell, self})
end
function BigWigs:CHAT_MSG_MONSTER_YELL(msg)
	for i=1, table.getn(yellTriggers) do
		local yell  = yellTriggers[i][1]
		local mod   = yellTriggers[i][2]
		if string.find(msg, yell) then
			-- enable and engage
			self:EnableModule(mod:ToString())
			--self:TriggerEvent("BigWigs_SendSync", "BossEngaged "..self:ToString())
			mod:DebugMessage(mod:ToString() .. " CHAT_MSG_MONSTER_YELL Engage")
			mod:SendEngageSync()
		end
	end
end
BigWigs:RegisterEvent("CHAT_MSG_MONSTER_YELL")

function BigWigs:CheckForEngage(module)
	if module and module:IsBossModule() and not module.engaged then
		local function IsBossInCombat()
			local t = module.enabletrigger
			local a = module.wipemobs
			if not t then return false end
			if type(t) == "string" then t = {t} end
			if a then
				if type(a) == "string" then a = {a} end
				for k,v in pairs(a) do table.insert(t, v) end
			end

			if UnitExists("target") and UnitAffectingCombat("target") then
				local target = UnitName("target")
				for _, mob in pairs(t) do
					if target == mob then
						return true
					end
				end
			end

			local num = GetNumRaidMembers()
			for i = 1, num do
				local raidUnit = string.format("raid%starget", i)
				if UnitExists(raidUnit) and UnitAffectingCombat(raidUnit) then
					local target = UnitName(raidUnit)
					for _, mob in pairs(t) do
						if target == mob then
							return true
						end
					end
				end
			end
			return false
		end

		local inCombat = IsBossInCombat()
		local running = module:IsEventScheduled(module:ToString().."_CheckStart")
		if inCombat then
			module:DebugMessage("Scan returned true, engaging ["..module:ToString().."].")
			module:CancelScheduledEvent(module:ToString().."_CheckStart")
			module:Engage()
			module:SendEngageSync()
		elseif not running then
			module:ScheduleRepeatingEvent(module:ToString().."_CheckStart", module.CheckForEngage, .5, module)
		end
	end
end
function BigWigs.modulePrototype:CheckForEngage()
	BigWigs:CheckForEngage(self)
end

function BigWigs:CheckForWipe(module)
	if module and module:IsBossModule() then
		-- prevent reset from someone outside the instance
		local isInZone = false
		if type(module.zonename) == "string" and module.zonename == GetRealZoneText() then
			isInZone = true
		elseif type(module.zonename) == "table" then
			for _, v in pairs(module.zonename) do
				if v == GetRealZoneText() then
					isInZone = true
					break
				end
			end
		end
		if not isInZone then
			return
		end

		--module:DebugMessage("BigWigs." .. module:ToString() .. ":CheckForWipe()")

		-- start wipe check in regular intervals
		local running = module:IsEventScheduled(module:ToString().."_CheckWipe")
		if not running then
			module:DebugMessage("CheckForWipe not running")
			module:ScheduleRepeatingEvent(module:ToString().."_CheckWipe", module.CheckForWipe, 5, module)
			return
		end

		local function RaidMemberInCombat()
			if UnitAffectingCombat("player") then
				return true
			end

			for i = 1, GetNumRaidMembers() do
				local raidUnit = string.format("raid%s", i)
				if UnitExists(raidUnit) and UnitAffectingCombat(raidUnit) then
					return true
				end
			end
			return false
		end
		local function RaidMemberAlive()
			if not UnitIsDeadOrGhost("player") then
				return true
			end
			
			for i = 1, GetNumRaidMembers() do
				local raidUnit= string.format("raid%s", i)
				if UnitExists(raidUnit) and not UnitIsDeadOrGhost(raidUnit) then
					return true
				end
			end
			return false
		end
		if not RaidMemberAlive() or not RaidMemberInCombat() then
			module:DebugMessage("Wipe detected for module ["..module:ToString().."].")
			module:CancelScheduledEvent(module:ToString().."_CheckWipe")
			self:TriggerEvent("BigWigs_RebootModule", module:ToString())
			--module:SendWipeSync()
		end
	end
end
function BigWigs.modulePrototype:CheckForWipe()
	BigWigs:CheckForWipe(self)
end

function BigWigs:CheckForBossDeath(msg, module)
	if module and module:IsBossModule() then
		if msg == string.format(UNITDIESOTHER, module:ToString()) or msg == string.format(L["You have slain %s!"], module.translatedName) then
			module:SendBossDeathSync()
		end
	end
end
function BigWigs.modulePrototype:CheckForBossDeath(msg)
	BigWigs:CheckForBossDeath(msg, self)
end

-- override
function BigWigs.modulePrototype:BigWigs_RecvSync(sync, rest, nick)
end

-- test function
function BigWigs.modulePrototype:Test()
	BigWigs:Print("No tests defined for module " .. self:ToString())
end

------------------------------
--      Provided API      --
------------------------------

local delayPrefix = "ScheduledEventPrefix"

function BigWigs.modulePrototype:Sync(sync)
	self:TriggerEvent("BigWigs_SendSync", sync)
end
function BigWigs.modulePrototype:DelayedSync(delay, sync)
	self:ScheduleEvent(delayPrefix .. "Sync" .. self:ToString() .. sync, "BigWigs_SendSync", delay, sync)
end
function BigWigs.modulePrototype:CancelDelayedSync(sync)
	self:CancelScheduledEvent(delayPrefix .. "Sync" .. self:ToString() .. sync)
end
function BigWigs.modulePrototype:ThrottleSync(throttle, sync)
	self:TriggerEvent("BigWigs_ThrottleSync", sync, throttle)
end

function BigWigs.modulePrototype:Message(text, priority, noRaidSay, sound, broadcastOnly)
	self:TriggerEvent("BigWigs_Message", text, priority, noRaidSay, sound, broadcastOnly)
end
function BigWigs.modulePrototype:DelayedMessage(delay, text, priority, noRaidSay, sound, broadcastOnly)
	return self:ScheduleEvent(delayPrefix .. "Message" .. self:ToString() .. text, "BigWigs_Message", delay, text, priority, noRaidSay, sound, broadcastOnly)
end
function BigWigs.modulePrototype:CancelDelayedMessage(text)
	self:CancelScheduledEvent(delayPrefix .. "Message" .. self:ToString() .. text)
end

function BigWigs.modulePrototype:Bar(text, time, icon, otherColor, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10)
	self:TriggerEvent("BigWigs_StartBar", self, text, time, "Interface\\Icons\\" .. icon, otherColor, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10)
end
function BigWigs.modulePrototype:RemoveBar(text)
	self:TriggerEvent("BigWigs_StopBar", self, text)
end

function BigWigs.modulePrototype:IntervalBar(text, intervalMin, intervalMax, icon, otherColor, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10)
	self:TriggerEvent("BigWigs_StartIntervalBar", self, text, intervalMin, intervalMax, "Interface\\Icons\\" .. icon, otherColor, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10)
end
function BigWigs.modulePrototype:DelayedIntervalBar(delay, text, intervalMin, intervalMax, icon, otherColor, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10)
	return self:ScheduleEvent(delayPrefix .. "Bar" .. self:ToString() .. text, "BigWigs_StartIntervalBar", delay, self, text, intervalMin, intervalMax, "Interface\\Icons\\" .. icon, otherColor, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10)
end

function BigWigs.modulePrototype:DelayedBar(delay, text, time, icon, otherColor, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10)
	return self:ScheduleEvent(delayPrefix .. "Bar" .. self:ToString() .. text, "BigWigs_StartBar", delay, self, text, time, "Interface\\Icons\\" .. icon, otherColor, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10)
end
function BigWigs.modulePrototype:CancelDelayedBar(text)
	self:CancelScheduledEvent(delayPrefix .. "Bar" .. self:ToString() .. text)
end
function BigWigs.modulePrototype:BarStatus(text)
	local registered, time, elapsed, running = BigWigsBars:GetBarStatus(self, text)
	return registered, time, elapsed, running
end

function BigWigs.modulePrototype:Sound(sound)
	self:TriggerEvent("BigWigs_Sound", sound)
end
function BigWigs.modulePrototype:DelayedSound(delay, sound, id)
	if not id then id = "_" end
	return self:ScheduleEvent(delayPrefix .. "Sound" .. self:ToString() .. sound .. id, "BigWigs_Sound", delay, sound)
end
function BigWigs.modulePrototype:CancelDelayedSound(sound, id)
	if not id then id = "_" end
	self:CancelScheduledEvent(delayPrefix .. "Sound" .. self:ToString() .. sound .. id)
end

function BigWigs.modulePrototype:Icon(name, iconnumber)
	self:TriggerEvent("BigWigs_SetRaidIcon", name, iconnumber)
end
function BigWigs.modulePrototype:RemoveIcon()
	self:TriggerEvent("BigWigs_RemoveRaidIcon")
end

function BigWigs.modulePrototype:WarningSign(icon, duration, force, text)
	self:TriggerEvent("BigWigs_ShowWarningSign", "Interface\\Icons\\" .. icon, duration, force, text)
end
function BigWigs.modulePrototype:RemoveWarningSign(icon, forceHide)
	self:TriggerEvent("BigWigs_HideWarningSign", "Interface\\Icons\\" .. icon, forceHide)
end
function BigWigs.modulePrototype:DelayedWarningSign(delay, icon, duration, id)
	if not id then id = "_" end
	self:ScheduleEvent(delayPrefix .. "WarningSign" .. self:ToString() .. icon .. id, "BigWigs_ShowWarningSign", delay, "Interface\\Icons\\" .. icon, duration)
end
function BigWigs.modulePrototype:CancelDelayedWarningSign(icon, id)
	if not id then id = "_" end
	self:CancelScheduledEvent(delayPrefix .. "WarningSign" .. self:ToString() .. icon .. id)
end


function BigWigs.modulePrototype:Say(msg)
	SendChatMessage(msg, "SAY")
end

-- proximity
function BigWigs:Proximity(moduleName)
	self:TriggerEvent("BigWigs_ShowProximity", moduleName)
end
function BigWigs.modulePrototype:Proximity()
	BigWigs:Proximity(self:ToString())
end

function BigWigs:RemoveProximity()
	self:TriggerEvent("BigWigs_HideProximity")
end
function BigWigs.modulePrototype:RemoveProximity()
	BigWigs:RemoveProximity()
end

-- doused runes

-- KLHThreatMeter
function BigWigs.modulePrototype:KTM_Reset()
	BigWigs:KTM_Reset()
end
function BigWigs.modulePrototype:KTM_ClearTarget(forceReset)
	BigWigs:KTM_ClearTarget(forceReset)
end
function BigWigs.modulePrototype:KTM_SetTarget(targetName, forceReset)
	if IsAddOnLoaded("KLHThreatMeter") then
		if targetName and type(targetName) == "string" and (IsRaidLeader() or IsRaidOfficer()) then
			if UnitName("target") == targetName then
				if not klhtm.target.targetismaster(targetName) then
					klhtm.net.sendmessage("target " .. targetName)
				end
				if forceReset then
					self:KTM_Reset()
				end
			else
				-- we need to delay the setting mastertarget, as KTM only allows it to work if the person
				-- calling the mastertarget sync has the unit as target
				BigWigs:RegisterEvent("PLAYER_TARGET_CHANGED")
				BigWigs.masterTarget    = targetName
				BigWigs.forceReset      = forceReset
			end
		end
	end
end


------------------------------
--      Initialization      --
------------------------------

function BigWigs:OnInitialize()
	if not self.version then self.version = GetAddOnMetadata("BigWigs", "Version") end
	local rev = self.revision
	for name, module in self:IterateModules() do
		--self:RegisterModule(name,module)
		rev = math.max(rev, module.revision)
	end
	self.version = (self.version or "2.0").. " |cffff8888r"..rev.."|r"
	--self:RegisterEvent("ADDON_LOADED")

	self.loading = true
	-- Activate ourselves, or at least try to. If we were disabled during a reloadUI, OnEnable isn't called,
	-- and self.loading will never be set to something else, resulting in a BigWigs that doesn't enable.
	self:ToggleActive(true)
end


function BigWigs:OnEnable()
	if AceLibrary("AceEvent-2.0"):IsFullyInitialized() then
		self:AceEvent_FullyInitialized()
	else
		self:RegisterEvent("AceEvent_FullyInitialized")
	end
end

function BigWigs:AceEvent_FullyInitialized()
	if GetNumRaidMembers() > 0 or not self.loading then
		-- Enable all disabled modules that are not boss modules.
		for name, module in self:IterateModules() do
			if type(module.IsBossModule) ~= "function" or not module:IsBossModule() then
				self:ToggleModuleActive(module, true)
			end
		end

		if BigWigsLoD then
			self:CreateLoDMenu()
		end

		self:TriggerEvent("BigWigs_CoreEnabled")

		self:RegisterEvent("BigWigs_TargetSeen")
		self:RegisterEvent("BigWigs_RebootModule")

		self:RegisterEvent("BigWigs_RecvSync")

		--self:RegisterEvent("AceEvent_FullyInitialized", function() self:TriggerEvent("BigWigs_ThrottleSync", "BossEngaged", 5) end )

	else
		self:ToggleActive(false)
	end
	self.loading = nil
end


function BigWigs:OnDisable()
	-- Disable all modules
	for name, module in self:IterateModules() do
		self:ToggleModuleActive(module, false)
	end

	self:TriggerEvent("BigWigs_CoreDisabled")
end


-------------------------------
--      Module Handling      --
-------------------------------

function BigWigs:ADDON_LOADED(addon)
	local gname = GetAddOnMetadata(addon, "X-BigWigsModule")
	if not gname then return end

	local g = getglobal(gname)
	if not g or not g.name then return end

	g.external = true

	self:RegisterModule(g.name, g)
end

function BigWigs:ModuleDeclaration(bossName, zoneName)
	translatedName = BB:HasTranslation(bossName) and BB[bossName] or bossName
	local module = BigWigs:NewModule(translatedName)
	local L = AceLibrary("AceLocale-2.2"):new("BigWigs" .. translatedName)
	module.translatedName = translatedName

	local name = string.gsub(bossName, "%s", "") -- untranslated, unique string
	module.bossSync = bossName


	-- zone
	local raidZones = {"Blackwing Lair", "Ruins of Ahn'Qiraj", "Ahn'Qiraj", "Molten Core", "Naxxramas", "Emerald Sanctum", "Karazhan", "Zul'Gurub"}
	local isOutdoorraid = true
	for i, value in ipairs(raidZones) do
		if value == zoneName then
			module.zonename = BZ:HasTranslation(zoneName) and BZ[zoneName] or zoneName
			isOutdoorraid = false
			break
		end
	end
	if isOutdoorraid then
		module.zonename = {
			AceLibrary("AceLocale-2.2"):new("BigWigs")["Outdoor Raid Bosses Zone"],
			BZ:HasTranslation(zoneName) and BZ[zoneName] or zoneName
		}
	end

	return module, L
end

function BigWigs:RegisterModule(name, module)
	--[[if module:IsRegistered() then
	error(string.format("%q is already registered.", name))
	return
	end]]

	if module:IsBossModule() then self:ToggleModuleActive(module, false) end

	-- Set up DB
	local opts
	if module:IsBossModule() and module.toggleoptions then
		opts = {}
		for _,v in pairs(module.toggleoptions) do
			if v ~= -1 then opts[v] = true end
			if module.defaultDB and module.defaultDB[v] ~= nil then
				opts[v] = module.defaultDB[v]
			end
		end
	end

	if module.db and module.RegisterDefaults and type(module.RegisterDefaults) == "function" then
		module:RegisterDefaults("profile", opts or module.defaultDB or {})
	else
		self:RegisterDefaults(name, "profile", opts or module.defaultDB or {})
	end

	if not module.db then module.db = self:AcquireDBNamespace(name) end

	-- Set up AceConsole
	if module:IsBossModule() then
		local cons
		local revision = type(module.revision) == "number" and module.revision or -1
		--self:Print(name .. " " .. module.bossSync .. " " .. module:ToString())
		local L2 = AceLibrary("AceLocale-2.2"):new("BigWigs"..name)
		if module.toggleoptions then
			local m = module
			cons = {
				type = "group",
				name = name,
				desc = string.format(L["Options for %s (r%s)."], name, revision),
				args = {
					[L["toggle"]] = {
						type = "toggle",
						name = L["Active"],
						order = 1,
						desc = L["Activate or deactivate this module."],
						get = function() return m.core:IsModuleActive(m) end,
						set = function() m.core:ToggleModuleActive(m) end,
					},
					[L["reboot"]] = {
						type = "execute",
						name = L["Reboot"],
						order = 2,
						desc = L["Reboot this module."],
						func = function() m.core:TriggerEvent("BigWigs_RebootModule", m:ToString()) end,
						hidden = function() return not m.core:IsModuleActive(m) end,
					},
					[L["rebootall"]] = {
						type = "execute",
						name = L["Reboot All"],
						desc = L["Forces the module to reset for everyone in the raid.\n\n(Requires assistant or higher)"],
						order = 3,
						func = function() if (IsRaidLeader() or IsRaidOfficer()) then m.core:TriggerEvent("BigWigs_SendSync", "RebootModule "..tostring(module)) end end,
						hidden = function() return not m.core:IsModuleActive(m) end,
					},
					[L["debug"]] = {
						type = "toggle",
						name = L["Debugging"],
						desc = L["Show debug messages."],
						order = 4,
						get = function() return m:IsDebugging() end,
						set = function(v) m:SetDebugging(v) end,
						hidden = function() return not m:IsDebugging() and not BigWigs:IsDebugging() end,
					},
				},
			}
			local x = 10
			for _,v in pairs(module.toggleoptions) do
				local val = v
				x = x + 1
				if x == 11 and v ~= "bosskill" then
					cons.args["headerblankspotthingy"] = {
						type = "header",
						order = 4,
					}
				end
				if v == -1 then
					cons.args["blankspacer"..x] = {
						type = "header",
						order = x,
					}
				else
					local l = v == "bosskill" and L or L2
					if l:HasTranslation(v.."_validate") then
						cons.args[l[v.."_cmd"]] = {
							type = "text",
							order = v == "bosskill" and -1 or x,
							name = l[v.."_name"],
							desc = l[v.."_desc"],
							get = function() return m.db.profile[val] end,
							set = function(v) m.db.profile[val] = v end,
							validate = l[v.."_validate"],
						}
					else
						cons.args[l[v.."_cmd"]] = {
							type = "toggle",
							order = v == "bosskill" and -1 or x,
							name = l[v.."_name"],
							desc = l[v.."_desc"],
							get = function() return m.db.profile[val] end,
							set = function(v) m.db.profile[val] = v end,
						}
					end
				end
			end
		end

		if cons or module.consoleOptions then
			local zonename = type(module.zonename) == "table" and module.zonename[1] or module.zonename
			local zone = zonename
			if BZ:HasReverseTranslation(zonename) and L:HasTranslation(BZ:GetReverseTranslation(zonename)) then
				zone = L[BZ:GetReverseTranslation(zonename)]
			elseif L:HasTranslation(zonename) then
				zone = L[zonename]
			end
			if not self.cmdtable.args[L["boss"]].args[zone] then
				self.cmdtable.args[L["boss"]].args[zone] = {
					type = "group",
					name = BIGWIGS_ZONE_NAMES[zonename],
					desc = string.format(L["Options for bosses in %s."], zonename),
					args = {
						trash = {
							type = "group",
							name = "Trash",
							order = -1,
							desc = string.format("Options for trash in %s.", zonename),
							args = {},
						},
					},
				}
			end
			if module.external then
				self.cmdtable.args[L["extra"]].args[L2["cmd"]] = cons or module.consoleOptions
			elseif module.trashMod then
				self.cmdtable.args[L["boss"]].args[zone].args["trash"].args[L2["cmd"]] = cons or module.consoleOptions
			else
				self.cmdtable.args[L["boss"]].args[zone].args[L2["cmd"]] = cons or module.consoleOptions
			end
		end
	elseif module.consoleOptions then
		if module.external then
			self.cmdtable.args[L["extra"]].args[module.consoleCmd or name] = cons or module.consoleOptions
		else
			self.cmdtable.args[L["plugin"]].args[module.consoleCmd or name] = cons or module.consoleOptions
		end
	end

	module.registered = true
	if module.OnRegister and type(module.OnRegister) == "function" then
		module:OnRegister()
	end

	-- Set up target monitoring, in case the monitor module has already initialized
	--if module.zonename and module.enabletrigger then
	self:TriggerEvent("BigWigs_RegisterForTargetting", module.zonename, module.enabletrigger)
	--end
end

function BigWigs:EnableModule(moduleName, nosync)
	local m = self:GetModule(moduleName)
	if m and not self:IsModuleActive(moduleName) then
		self:ToggleModuleActive(moduleName, true)
		if m:IsBossModule() then
			if not m.translatedName then
				m.translatedName = m:ToString()
				self:DebugMessage("translatedName for module " .. m:ToString() .. " missing")
			end
			self:TriggerEvent("BigWigs_Message", string.format(L["%s mod enabled"], m.translatedName or "??"), "Core", true)
		end

		if not nosync then
			local syncToken = m.synctoken or BB:HasReverseTranslation(moduleName) and BB:GetReverseTranslation(moduleName) or moduleName
			self:TriggerEvent("BigWigs_SendSync", (m.external and "EnableExternal " or "EnableModule ") .. syncToken)
		end

		self:SetupModule(moduleName)
	end
end

-- registers generic events
function BigWigs:SetupModule(moduleName)
	local m = self:GetModule(moduleName)
	if m and m:IsBossModule() then

		m:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage") -- addition
		m:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
		m:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH", "CheckForWipe")
		m:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "CheckForBossDeath") -- addition

		m:RegisterEvent("BigWigs_RecvSync")

		m.engaged = false

		m:OnSetup()
	end
end

function BigWigs:DisableModule(moduleName)
	local m = self:GetModule(moduleName)
	if m then
		if m:IsBossModule() then
			m:Disengage()
		end
		self:ToggleModuleActive(m, false)
	end
end

-- event handler
function BigWigs:BigWigs_RebootModule(moduleName)
	local moduleName = BB:HasTranslation(moduleName) and BB[moduleName] or moduleName
	local m = self:GetModule(moduleName)
	if m and m:IsBossModule() then
		self:DebugMessage("BigWigs:BigWigs_RebootModule(): " .. m:ToString())
		m:Disengage()
		self:SetupModule(moduleName)
	end
end


-------------------------------
--      Event Handler        --
-------------------------------

function BigWigs:BigWigs_RecvSync(sync, moduleName, nick)
	local s, m, n, playername = "-", "-", "-", UnitName("player")
	if sync then
		if type(sync) == "string" then
			s = sync
		else
			s = type(sync)
		end
	end
	if moduleName then
		if type(moduleName) == "string" then
			m = moduleName
		else
			m = type(moduleName)
		end
	end
	if nick then
		if type(nick) == "string" then
			if nick == playername then
				n = "you"
			else
				n = nick
			end
		else
			n = type(nick)
		end
	end
	self:DebugMessage("sync: " .. s .. " rest: " .. m .. " nick: " .. n)


	local moduleName = BB:HasTranslation(moduleName) and BB[moduleName] or moduleName
	local module = nil
	if self:HasModule(moduleName) then
		module = self:GetModule(moduleName)
	end

	if module and sync == "EnableModule" then
		moduleName = BB:HasTranslation(moduleName) and BB[moduleName] or moduleName

		local isInZone = false
		if type(module.zonename) == "string" and module.zonename == GetRealZoneText() then
			isInZone = true
		elseif type(module.zonename) == "table" then
			for _, v in pairs(module.zonename) do
				if v == GetRealZoneText() then
					isInZone = true
					break
				end
			end
		end

		if isInZone then self:EnableModule(moduleName, true) end
	elseif module and sync == "EnableExternal" then
		if module.zonename == GetRealZoneText() then
			self:EnableModule(moduleName, true)
		end
	elseif sync == "RebootModule" and moduleName then
		if nick ~= UnitName("player") then
			self:Print(string.format(L["%s has requested forced reboot for the %s module."], nick, moduleName))
		end
		self:TriggerEvent("BigWigs_RebootModule", moduleName)
	elseif module and sync == module:GetEngageSync() then
		if module:IsBossModule() then
			module:Engage()
		end
		--[[elseif module and sync == module:GetWipeSync() then
		if module:IsBossModule() and BigWigs:IsModuleActive(module) then
		self:TriggerEvent("BigWigs_RebootModule", moduleName)
		end]]
	elseif module and sync == module:GetBossDeathSync() then
		if module:IsBossModule() and BigWigs:IsModuleActive(module) then
			module:Victory()
		end
	end
end

function BigWigs:BigWigs_TargetSeen(mobname, unit)
	for name,module in self:IterateModules() do
		if module:IsBossModule() and self:ZoneIsTrigger(module, GetRealZoneText()) and self:MobIsTrigger(module, mobname)
			and (not module.VerifyEnable or module:VerifyEnable(unit)) then
			self:EnableModule(name)

			--[[if UnitExists(unit.."target") then
			-- if this is true the boss is apparantely already in combat!
			-- this situation can happen on bosses which spawn the same time they enter combat (Arlokk/Mandokir) or when a player without BigWigs engages the boss
			module:SendEngageSync()
			end]]
		end
	end
end

-------------------------------
--      	Utility		     --
-------------------------------

function BigWigs:ZoneIsTrigger(module, zone)
	local t = module.zonename
	if type(t) == "string" then return zone == t
	elseif type(t) == "table" then
		for _,mzone in pairs(t) do if mzone == zone then return true end end
	end
end


function BigWigs:MobIsTrigger(module, name)
	local t = module.enabletrigger
	if type(t) == "string" then
		return name == t
	elseif type(t) == "table" then
		for _,mob in pairs(t) do
			if mob == name then
				return true
			end
		end
	end
end


function BigWigs:CreateLoDMenu()
	local zonelist = BigWigsLoD:GetZones()
	for k,v in pairs( zonelist ) do
		if type(v) ~= "table" then
			self:AddLoDMenu( k )
		else
			self:AddLoDMenu( L["Other"] )
		end
	end
end


function BigWigs:AddLoDMenu( zonename )
	local zone = nil
	if L:HasTranslation(zonename) then
		zone = L[zonename]
	else
		zone = L["Other"]
	end
	if zone then
		if BZ:HasReverseTranslation(zonename) and L:HasTranslation(BZ:GetReverseTranslation(zonename)) then
			zone = L[BZ:GetReverseTranslation(zonename)]
		elseif L:HasTranslation(zonename) then
			zone = L[zonename]
		end

		if not self.cmdtable.args[L["boss"]].args[zone] then
			self.cmdtable.args[L["boss"]].args[zone] = {
				type = "group",
				name = BIGWIGS_ZONE_NAMES[zonename],
				desc = string.format(L["Options for bosses in %s."], zonename),
				args = {
					trash = {
						type = "group",
						name = "Trash",
						order = -1,
						desc = string.format("Options for trash in %s.", zonename),
						args = {},
					},
				},
			}
		end
	end
end
