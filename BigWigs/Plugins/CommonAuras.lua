--[[
--
-- BigWigs Strategy Module - Common Auras
--
-- Gives timer bars and raid messages about common
-- buffs and debuffs.
--
--]]

------------------------------
--      Are you local?      --
------------------------------

local name = "Common Auras"
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..name)
local BS = AceLibrary("Babble-Spell-2.2")

local spellStatus = nil
local lastTank = nil

-- Use for detecting instant cast target (Fear Ward)
local spellTarget = nil
local spellCasting = nil

------------------------------
--      Localization        --
------------------------------

L:RegisterTranslations("enUS", function() return {
	fw_cast = "%s fearwarded %s.",
	fw_bar = "%s: FW Cooldown",

	used_cast = "%s used %s.",
	used_bar = "%s: %s",

	portal_cast = "%s opened a portal to %s!",
	portal_regexp = ".*: (.*)",
	-- portal_bar is the spellname

	["Toggle %s display."] = true,
	["Portal"] = true,
	["broadcast"] = true,
	["Broadcast"] = true,
	["Toggle broadcasting the messages to the raidwarning channel."] = true,

	["Gives timer bars and raid messages about common buffs and debuffs."] = true,
	["Common Auras"] = true,
	["commonauras"] = true,
} end )

L:RegisterTranslations("esES", function() return {
	fw_cast = "%s usa Custodia de miedo a %s.",
	fw_bar = "%s: Regeneración de Custodia de miedo",

	used_cast = "%s usa %s.",
	used_bar = "%s: %s",

	portal_cast = "¡%s abre un Portal a %s!",
	portal_regexp = ".*: (.*)",
	-- portal_bar is the spellname

	["Toggle %s display."] = "Alterna la muestra de %s",
	["Portal"] = "Portal",
	--["broadcast"] = "transmitir",
	["Broadcast"] = "Transmitir",
	["Toggle broadcasting the messages to the raidwarning channel."] = "Alterna la transmisión de los mensajes en el canal de advertencia de la banda.",

	["Gives timer bars and raid messages about common buffs and debuffs."] = "Muestra las barras temporizadoras y los mensajes de la banda sobre buffs y debuffs comunes",
	["Common Auras"] = "Auras Comunes",
	--["commonauras"] = "aurascomunes",
} end )

L:RegisterTranslations("koKR", function() return {
	fw_cast = "%s님이 %s에게 공포의 수호물을 시전합니다.", --"%s|1이;가; %s에게 공포의 수호물을 시전합니다.",
	fw_bar = "%s: FW 재사용 대기시간",

	used_cast = "%s님이 %s 사용했습니다.", --"%s|1이;가; %s|1을;를; 사용했습니다.",
	used_bar = "%s: %s",

	portal_cast = "%s님이 %s 차원문을 엽니다!", --"%s|1이;가; %s|1으로;로; 가는 차원문을 엽니다!",
	portal_regexp = ".*: (.*)",
	-- portal_bar is the spellname

	["Toggle %s display."] = "%s 표시를 전환합니다.",
	["Portal"] = "차원문",

	["Broadcast"] = "알림",
	["Toggle broadcasting the messages to the raidwarning channel."] = "공격대 경보 채널에 메세지 알림을 전환합니다.",

	["Gives timer bars and raid messages about common buffs and debuffs."] = "공통 버프와 디버프에 대한 공격대 메세지와 타이머 바를 제공합니다.",
	["Common Auras"] = "공통 버프",
} end )

L:RegisterTranslations("deDE", function() return {
	fw_cast = "%s sch\195\188tzt %s vor Furcht.",
	fw_bar = "%s: FS Cooldown",

	used_cast = "%s benutzt %s.",

	portal_cast = "%s \195\182ffnet ein Portal nach %s!",
	-- portal_bar is the spellname

	["Toggle %s display."] = "Aktiviert oder Deaktiviert die Anzeige von %s.",
	["Portal"] = "Portale",
	["broadcast"] = "broadcasten",
	["Broadcast"] = "Broadcast",
	["Toggle broadcasting the messages to the raidwarning channel."] = "W\195\164hle, ob Warnungen \195\188ber RaidWarning gesendet werden sollen.",

	["Gives timer bars and raid messages about common buffs and debuffs."] = "Zeigt Zeitleisten und Raidnachrichten f? kritische Spr\195\188che.",
} end )

L:RegisterTranslations("frFR", function() return {
	fw_cast = "%s prot\195\169g\195\169 par FearWard %s.",
	fw_bar = "%s: FW Cooldown",

	used_cast = "%s a utilis\195\169 %s.",

	portal_cast = "%s ouvre un portail pour %s!",
	-- portal_bar is the spellname

	["Toggle %s display."] = "Activer l'affichage du %s.",
	["Portal"] = "Portail",
	["broadcast"] = "Annonce",
	["Broadcast"] = "Annonce",
	["Toggle broadcasting the messages to the raidwarning channel."] = "Active les annonces de raid.",

	["Gives timer bars and raid messages about common buffs and debuffs."] = "Donne timers et annonces de raid pour les buffs et debuffs classiques.",
} end )

------------------------------
--      Module              --
------------------------------

BigWigsCommonAuras = BigWigs:NewModule(name, "AceHook-2.1")
BigWigsCommonAuras.synctoken = myname
BigWigsCommonAuras.defaultDB = {
	fearward = true,
	shieldwall = true,
	laststand = true,
	lifegivinggem = true,
	challengingshout = true,
	challengingroar = true,
	portal = true,
	broadcast = false,
}

BigWigsCommonAuras.consoleCmd = L["commonauras"]
BigWigsCommonAuras.consoleOptions = {
	type = "group",
	name = L["Common Auras"],
	desc = L["Gives timer bars and raid messages about common buffs and debuffs."],
	args   = {
		["fearward"] = {
			type = "toggle",
			name = BS["Fear Ward"],
			desc = string.format(L["Toggle %s display."], BS["Fear Ward"]),
			get = function() return BigWigsCommonAuras.db.profile.fearward end,
			set = function(v) BigWigsCommonAuras.db.profile.fearward = v end,
		},
		["shieldwall"] = {
			type = "toggle",
			name = BS["Shield Wall"],
			desc = string.format(L["Toggle %s display."], BS["Shield Wall"]),
			get = function() return BigWigsCommonAuras.db.profile.shieldwall end,
			set = function(v) BigWigsCommonAuras.db.profile.shieldwall = v end,
		},
		["laststand"] = {
			type = "toggle",
			name = BS["Last Stand"],
			desc = string.format(L["Toggle %s display."], BS["Last Stand"]),
			get = function() return BigWigsCommonAuras.db.profile.laststand end,
			set = function(v) BigWigsCommonAuras.db.profile.laststand = v end,
		},
		["lifegivinggem"] = {
			type = "toggle",
			name = BS["Lifegiving Gem"],
			desc = string.format(L["Toggle %s display."], BS["Lifegiving Gem"]),
			get = function() return BigWigsCommonAuras.db.profile.lifegivinggem end,
			set = function(v) BigWigsCommonAuras.db.profile.lifegivinggem = v end,
		},
		["challengingshout"] = {
			type = "toggle",
			name = BS["Challenging Shout"],
			desc = string.format(L["Toggle %s display."], BS["Challenging Shout"]),
			get = function() return BigWigsCommonAuras.db.profile.challengingshout end,
			set = function(v) BigWigsCommonAuras.db.profile.challengingshout = v end,
		},
		["challengingroar"] = {
			type = "toggle",
			name = BS["Challenging Roar"],
			desc = string.format(L["Toggle %s display."], BS["Challenging Roar"]),
			get = function() return BigWigsCommonAuras.db.profile.challengingroar end,
			set = function(v) BigWigsCommonAuras.db.profile.challengingroar = v end,
		},
		["portal"] = {
			type = "toggle",
			name = L["Portal"],
			desc = string.format(L["Toggle %s display."], L["Portal"]),
			get = function() return BigWigsCommonAuras.db.profile.portal end,
			set = function(v) BigWigsCommonAuras.db.profile.portal = v end,
		},
		["broadcast"] = {
			type = "toggle",
			name = L["Broadcast"],
			desc = L["Toggle broadcasting the messages to the raidwarning channel."],
			get = function() return BigWigsCommonAuras.db.profile.broadcast end,
			set = function(v) BigWigsCommonAuras.db.profile.broadcast = v end,
		},
	}
}
BigWigsCommonAuras.revision = 20005
BigWigsCommonAuras.external = true

------------------------------
--      Initialization      --
------------------------------

function BigWigsCommonAuras:OnEnable()
	local _, class = UnitClass("player")
	local _, race = UnitRace("player")

	if class == "WARRIOR" or class == "DRUID" then
		self:RegisterEvent("SpellStatus_SpellCastInstant")
		self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS")
	elseif class == "PRIEST" and race == "Dwarf" then
		self:RegisterEvent("SpellStatus_SpellCastInstant")
		--[[self:Hook("CastSpell")
		self:Hook("CastSpellByName")
		self:Hook("SpellTargetUnit")
		self:Hook("SpellStopTargeting")
		self:Hook("TargetUnit")
		self:Hook("UseAction")
		self:HookScript(WorldFrame,"OnMouseDown","BigWigsCommonAurasOnMouseDown")]]
	elseif class == "MAGE" then
		if not spellStatus then spellStatus = AceLibrary("SpellStatus-1.0") end
		self:RegisterEvent("SpellStatus_SpellCastCastingFinish")
		self:RegisterEvent("SpellStatus_SpellCastFailure")
	end

	self:RegisterEvent("BigWigs_RecvSync")

	-- XXX Lets have a low throttle because you'll get 2 syncs from yourself, so
	-- it results in 2 messages.
	self:TriggerEvent("BigWigs_ThrottleSync", "BWCAFW", .4) -- Fear Ward
	self:TriggerEvent("BigWigs_ThrottleSync", "BWCASW", .4) -- Shield Wall
	self:TriggerEvent("BigWigs_ThrottleSync", "BWCALS", .4) -- Last Stand
	self:TriggerEvent("BigWigs_ThrottleSync", "BWCALG", .4) -- Last Stand
	self:TriggerEvent("BigWigs_ThrottleSync", "BWCACS", .4) -- Challenging Shout
	self:TriggerEvent("BigWigs_ThrottleSync", "BWCACR", .4) -- Challenging Roar
	self:TriggerEvent("BigWigs_ThrottleSync", "BWCAP", .4) -- Portal
end

------------------------------
--      Events              --
------------------------------

function BigWigsCommonAuras:BigWigs_RecvSync( sync, rest, nick )
	if not nick then nick = UnitName("player") end
	if self.db.profile.fearward and sync == "BWCAFW" and rest then
		self:TriggerEvent("BigWigs_Message", string.format(L["fw_cast"], nick, rest), "Blue", not self.db.profile.broadcast, false)
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["fw_bar"], nick), 30, BS:GetSpellIcon("Fear Ward"), "Blue")
	elseif self.db.profile.shieldwall and sync == "BWCASW" then
		local swTime = tonumber(rest)
		if not swTime then swTime = 10 end -- If the tank uses an old BWCA, just assume 10 seconds.
		local spell = BS["Shield Wall"]
		self:TriggerEvent("BigWigs_Message", string.format(L["used_cast"], nick, spell), "Yellow", not self.db.profile.broadcast, false)
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["used_bar"], spell, nick), swTime, BS:GetSpellIcon(spell), "Yellow")
		self:SetCandyBarOnClick("BigWigsBar "..string.format(L["used_bar"], spell, nick), function(name, button, extra) TargetByName(extra, true) end, nick )
	elseif self.db.profile.laststand and sync == "BWCALS" then
		local spell = BS["Last Stand"]
		self:TriggerEvent("BigWigs_Message", string.format(L["used_cast"], nick, spell), "Yellow", not self.db.profile.broadcast, false)
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["used_bar"], spell, nick), 20, BS:GetSpellIcon(spell), "Yellow")
		self:SetCandyBarOnClick("BigWigsBar "..string.format(L["used_bar"], spell, nick), function(name, button, extra) TargetByName(extra, true) end, nick )
	elseif self.db.profile.lifegivinggem and sync == "BWCALG" then
		local spell = BS["Gift of Life"]
		self:TriggerEvent("BigWigs_Message", string.format(L["used_cast"], nick, BS["Lifegiving Gem"]), "Yellow", not self.db.profile.broadcast, false)
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["used_bar"], BS["Lifegiving Gem"], nick), 20, BS:GetSpellIcon(spell), "Yellow")
		self:SetCandyBarOnClick("BigWigsBar "..string.format(L["used_bar"], BS["Lifegiving Gem"], nick), function(name, button, extra) TargetByName(extra, true) end, nick )
	elseif self.db.profile.challengingshout and sync == "BWCACS" then
		local spell = BS["Challenging Shout"]
		self:TriggerEvent("BigWigs_Message", string.format(L["used_cast"], nick, spell), "Yellow", not self.db.profile.broadcast, false)
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["used_bar"], spell, nick), 6, BS:GetSpellIcon(spell), "Yellow")
		self:SetCandyBarOnClick("BigWigsBar "..string.format(L["used_bar"], spell, nick), function(name, button, extra) TargetByName(extra, true) end, nick )
		lastTank = nick
	elseif self.db.profile.challengingroar and sync == "BWCACR" then
		local spell = BS["Challenging Roar"]
		self:TriggerEvent("BigWigs_Message", string.format(L["used_cast"], nick, spell), "Yellow", not self.db.profile.broadcast, false)
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["used_bar"], spell, nick), 6, BS:GetSpellIcon(spell), "Yellow")
		self:SetCandyBarOnClick("BigWigsBar "..string.format(L["used_bar"], spell, nick), function(name, button, extra) TargetByName(extra, true) end, nick )
		lastTank = nick
	elseif self.db.profile.portal and sync == "BWCAP" and rest then
		rest = BS:HasTranslation(rest) and BS:GetTranslation(rest) or rest
		local _, _, zone = string.find(rest, L["portal_regexp"])
		if zone then
			self:TriggerEvent("BigWigs_Message", string.format(L["portal_cast"], nick, zone), "Blue", not self.db.profile.broadcast, false)
			self:TriggerEvent("BigWigs_StartBar", self, rest, 60, BS:GetSpellIcon(rest), "Blue")
			--self:SetCandyBarOnClick("BigWigsBar "..string.format(L["portal_cast"], spell, nick), function(name, button, extra) TargetByName(extra, true) end, nick )
		end
	end
end

function BigWigsCommonAuras:SpellStatus_SpellCastInstant(sId, sName, sRank, sFullName, sCastTime)
	if sName == BS["Fear Ward"] then
		local targetName = nil
		if spellTarget then
			targetName = spellTarget
			spellCasting = nil
			spellTarget = nil
		else
			if UnitExists("target") and UnitIsPlayer("target") and not UnitIsEnemy("target", "player") then
				targetName = UnitName("target")
			else
				targetName = UnitName("player")
			end
		end
		self:TriggerEvent("BigWigs_SendSync", "BWCAFW "..targetName)
	elseif sName == BS["Shield Wall"] then
		local shieldWallDuration
		local talentName, _, _, _, currentRank, _, _, _ = GetTalentInfo(3, 13)
		if currentRank == 0 then
			shieldWallDuration = 10
		elseif currentRank == 1 then
			shieldWallDuration = 13
		else
			shieldWallDuration = 15
		end
		self:TriggerEvent("BigWigs_SendSync", "BWCASW "..tostring(shieldWallDuration))
	elseif sName == BS["Last Stand"] then
		self:TriggerEvent("BigWigs_SendSync", "BWCALS")
	elseif sName == BS["Challenging Shout"] then
		self:TriggerEvent("BigWigs_SendSync", "BWCACS")
	elseif sName == BS["Challenging Roar"] then
		self:TriggerEvent("BigWigs_SendSync", "BWCACR")
	end
end

function BigWigsCommonAuras:CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS(msg)
	if string.find(msg, BS["Gift of Life"]) then
		self:TriggerEvent("BigWigs_SendSync", "BWCALG")
	end
end

function BigWigsCommonAuras:SpellStatus_SpellCastCastingFinish(sId, sName, sRank, sFullName, sCastTime)
	if not string.find(sName, L["Portal"]) then return end
	local name = BS:HasReverseTranslation(sName) and BS:GetReverseTranslation(sName) or sName
	self:ScheduleEvent("bwcaspellcast", self.SpellCast, 0.3, self, name)
end

function BigWigsCommonAuras:SpellStatus_SpellCastFailure(sId, sName, sRank, sFullName, isActiveSpell, UIEM_Message, CMSFLP_SpellName, CMSFLP_Message)
	-- do nothing if we are casting a spell but the error doesn't consern that spell, thanks Iceroth.
	if (spellStatus:IsCastingOrChanneling() and not spellStatus:IsActiveSpell(sId, sName)) then
		return
	end
	if self:IsEventScheduled("bwcaspellcast") then
		self:CancelScheduledEvent("bwcaspellcast")
	end
end

function BigWigsCommonAuras:SpellCast(sName)
	self:TriggerEvent("BigWigs_SendSync", "BWCAP "..sName)
end


------------------------------
--      Hooks               --
------------------------------
--[[
function BigWigsCommonAuras:UseAction(a1, a2, a3)
self.hooks["UseAction"](a1, a2, a3)
if GetActionText(a1) then return end
if SpellIsTargeting() then return
elseif a3 then
spellTarget = UnitName("player")
elseif UnitExists("target") then
spellTarget = UnitName("target")
end
end

function BigWigsCommonAuras:BigWigsCommonAurasOnMouseDown()
if UnitName("mouseover") then
spellTarget = UnitName("mouseover")
elseif GameTooltipTextLeft1:IsVisible() then
local _, _, name = string.find(GameTooltipTextLeft1:GetText(), "^Corpse of (.+)$")
if name then
spellTarget = name
end
end
self.hooks[WorldFrame]["OnMouseDown"]()
end

function BigWigsCommonAuras:CastSpell(spellId, spellbookTabNum)
self.hooks["CastSpell"](spellId, spellbookTabNum)
if UnitExists("target") then
spellTarget = UnitName("target")
end
spellCasting = true
end

function BigWigsCommonAuras:CastSpellByName(a1, a2)
self.hooks["CastSpellByName"](a1, a2)
if a1 then
spellCasting = true
if not SpellIsTargeting() then
spellTarget = UnitName("target")
end
end
end

function BigWigsCommonAuras:SpellTargetUnit(a1)
local shallTargetUnit
if SpellIsTargeting() then
shallTargetUnit = true
end
self.hooks["SpellTargetUnit"](a1)
if shallTargetUnit and spellCasting and not SpellIsTargeting() then
spellTarget = UnitName(a1)
end
end


function BigWigsCommonAuras:SpellStopTargeting()
self.hooks["SpellStopTargeting"]()
spellCasting = nil
spellTarget = nil
end

function BigWigsCommonAuras:TargetUnit(a1)
self.hooks["TargetUnit"](a1)
if spellCasting and UnitExists(a1) then
spellTarget = UnitName(a1)
end
end]]

------------------------------
--      Macro               --
------------------------------

function BWCATargetLastTank()
	if not lastTank then return end
	TargetByName(lastTank, true)
end

