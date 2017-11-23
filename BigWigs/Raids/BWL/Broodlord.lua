
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Broodlord Lashlayer", "Blackwing Lair")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Broodlord",

	engage_trigger = "None of your kind should be here",
	ms_trigger = "^(.+) (.+) afflicted by Mortal Strike",
	bw_trigger = "^(.+) (.+) afflicted by Blast Wave",
	deathyou_trigger = "You die\.",
	deathother_trigger = "(.+) dies\.",
	ms_warn_you = "Mortal Strike on you!",
	ms_warn_other = "Mortal Strike on %s!",
	bw_warn = "Blast Wave soon!",
	ms_bar = "Mortal Strike: %s",
	bw_bar = "Blast Wave",
	knock_bar = "Knock Away",

	["First Mortal Strike"] = true,

	you = "You",
	are = "are",

	ms_cmd = "ms",
	ms_name = "Mortal Strike",
	ms_desc = "Warn when someone gets Mortal Strike and starts a clickable bar for easy selection.",

	knock_cmd = "knock",
	knock_name = "Knock Away",
	knock_desc = "Shows a bar with the possible Knock Away cooldown.",

	bw_cmd = "bw",
	bw_name = "Blast Wave",
	bw_desc = "Shows a bar with the possible Blast Wave cooldown.\n\n(Disclaimer: this varies anywhere from 8 to 15 seconds. Chosen shortest interval for safety.)",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Broodlord",

	engage_trigger = "None of your kind should be here",
	ms_trigger = "^(.+) (.+) sufre de Golpe mortal",
	bw_trigger = "^(.+) (.+) sufre de Ola explosiva",
	deathyou_trigger = "Has muerto\.",
	deathother_trigger = "(.+) ha muerto\.",
	ms_warn_you = "¡Golpe mortal a ti!",
	ms_warn_other = "¡Golpe mortal a %s!",
	bw_warn = "¡Ola explosiva pronto!",
	ms_bar = "Golpe mortal: %s",
	bw_bar = "Ola explosiva",
	knock_bar = "Empujar",
	
	["First Mortal Strike"] = "Primer Golpe mortal",

	you = "Tu",
	are = "eres",

	--ms_cmd = "ms",
	ms_name = "Golpe mortal",
	ms_desc = "Avisa cuando alguien reciba Golpe mortal y muestra una barra cliqueable para seleccionarlo fácilmente.",

	--knock_cmd = "knock",
	knock_name = "Empujar",
	knock_desc = "Muestra una barra con regeneración de Empujar posible.",

	--bw_cmd = "bw",
	bw_name = "Ola explosiva",
	bw_desc = "Muestra una barra con regeneración de Ola explosiva posible.\n\n(Descargo de responsabilidad : esto varia 8 a 15 segundos. Elige el intervalo más corto para seguridad.)",
} end )

L:RegisterTranslations("deDE", function() return {
	--cmd = "Broodlord",

	engage_trigger = "Euresgleichen sollte nicht hier sein!",
	ms_trigger = "^(.+) (.+) von T\195\182dlicher Sto\195\159 betroffen",
	bw_trigger = "^(.+) (.+) von Druckwelle betroffen",
	deathyou_trigger = "Ihr sterbt.",
	deathother_trigger = "(.+) stirbt.",
	ms_warn_you = "T\195\182dlicher Sto\195\159 auf Dir!",
	ms_warn_other = "T\195\182dlicher Sto\195\159 auf %s!",
	bw_warn = "Druckwelle bald!",
	ms_bar = "T\195\182dlicher Sto\195\159: %s",
	bw_bar = "Druckwelle",

	you = "Ihr",
	are = "seid",

	--ms_cmd = "ms",
	ms_name = "T\195\182dlicher Sto\195\159",
	ms_desc = "Warnung wenn ein Spieler von Tödlicher Sto\195\159 betroffen ist und startet einen anklickbaren Balken für eine einfache Auswahl.",

	--bw_cmd = "bw",
	bw_name = "Druckwelle",
	bw_desc = "Zeigt einen Balken mit der möglichen Druckwellenabklingzeit.\n\n(Hinweis: Diese variiert von 8 bis 15 Sekunden. Zur Sicherheit wurde der kürzeste Intervall gewählt.)",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"ms", "bw", "knock", "bosskill"}


-- locals
local timer = {
	firstBlastWave = 20,
	earliestBlastWave = 20,
	latestBlastWave = 35,
	mortalStrike = 5,
	firstMortal = 25,
	knockAway = 20
}
local icon = {
	blastWave = "Spell_Holy_Excorcism_02",
	mortalStrike = "Ability_Warrior_SavageBlow",
	knockAway = "INV_Gauntlets_05"
}
local syncName = {}

local lastBlastWave = 0
local lastMS = 0
local MS = ""


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["engage_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	--self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH")
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	lastBlastWave = 0
	lastMS = 0
	MS = ""
end

-- called after boss is engaged
function module:OnEngage()
	self:KTM_SetTarget(self:ToString())
	if self.db.profile.bw then
		self:Bar(L["bw_bar"], timer.firstBlastWave, icon.blastWave, true, "Red")
	end
	if self.db.profile.ms then
		self:Bar(L["First Mortal Strike"], timer.firstMortal, icon.mortalStrike, true, "Black")
	end
	if self.db.profile.knock then
		self:Bar(L["knock_bar"], timer.knockAway, icon.knockAway)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:Event(msg)
	local _, _, name, detect = string.find(msg, L["ms_trigger"])
	if name and detect and self.db.profile.ms then
		MS = name
		lastMS = GetTime()
		if detect == L["are"] then
			self:Message(L["ms_warn_you"], "Core", true, "Beware")
			self:Bar(string.format(L["ms_bar"], UnitName("player")), timer.mortalStrike, icon.mortalStrike, true, "Black")
			self:SetCandyBarOnClick("BigWigsBar "..string.format(L["ms_bar"], UnitName("player")), function(name, button, extra) TargetByName(extra, true) end, UnitName("player"))
			self:WarningSign(icon.mortalStrike, timer.mortalStrike)
		else
			self:Message(string.format(L["ms_warn_other"], name), "Core", true, "Alarm")
			self:Bar(string.format(L["ms_bar"], name), timer.mortalStrike, icon.mortalStrike, true, "Black")
			self:SetCandyBarOnClick("BigWigsBar "..string.format(L["ms_bar"], name), function(name, button, extra) TargetByName(extra, true) end, name)
		end
	elseif string.find(msg, L["bw_trigger"]) and self.db.profile.bw then
		if GetTime() - lastBlastWave > 5 then
			self:IntervalBar(L["bw_bar"], timer.earliestBlastWave, timer.latestBlastWave, icon.blastWave, true, "Red")
			--self:ScheduleEvent("BigWigs_Message", 24, L["bw_warn"], "Urgent", true, "Alert")
		end
		lastBlastWave = GetTime()
	end
end

--[[function module:CHAT_MSG_COMBAT_FRIENDLY_DEATH(msg)
if not self.db.profile.bw then return end
local _, _, deathother = string.find(msg, L["deathother_trigger"])
if msg == L["deathyou_trigger"] then
self:RemoveBar(string.format(L["ms_bar"], UnitName("player")))
elseif deathother then
self:RemoveBar(string.format(L["ms_bar"], deathother))
end
end]]

function module:PLAYER_TARGET_CHANGED()
	if (lastMS + 5) > GetTime() and UnitName("target") == MS then
		if self.db.profile.ms then
			self:WarningSign(icon.mortalStrike, (lastMS + 5) - GetTime())
		end
	else
		self:RemoveWarningSign(icon.mortalStrike)
	end
end
