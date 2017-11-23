
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Instructor Razuvious", "Naxxramas")
local understudy = AceLibrary("Babble-Boss-2.2")["Deathknight Understudy"]


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Razuvious",

	shout_cmd = "shout",
	shout_name = "Shout Alert",
	shout_desc = "Warn for disrupting shout",

	unbalance_cmd = "unbalancing",
	unbalance_name = "Unbalancing Strike Alert",
	unbalance_desc = "Warn for Unbalancing Strike",

	shieldwall_cmd = "shieldwall",
	shieldwall_name = "Shield Wall Timer",
	shieldwall_desc = "Show timer for Shield Wall",

	startwarn = "Instructor Razuvious engaged! 15sec to Shout, 30sec to Unbalancing Strike!",

	starttrigger1 = "Stand and fight!",
	starttrigger2 = "Show me what you've got!",
	starttrigger3 = "Hah hah, I'm just getting warmed up!",
	--starttrigger4 = "Stand and fight!",

	--shouttrigger = "Disrupting Shout",
	shouttrigger = "lets loose a triumphant shout.",
	shout7secwarn = "7 sec to Disrupting Shout",
	shout3secwarn = "3 sec to Disrupting Shout!",
	shoutwarn = "Disrupting Shout! Next in 25secs",
	noshoutwarn = "No shout! Next in 20secs",
	shoutbar = "Disrupting Shout",

	unbalance_trigger = "afflicted by Unbalancing Strike",
	unbalancesoonwarn = "Unbalancing Strike coming soon!",
	unbalancewarn = "Unbalancing Strike! Next in ~30sec",
	unbalancebar = "Unbalancing Strike",

	shieldwalltrigger   = "Death Knight Understudy gains Shield Wall.",
	shieldwallbar       = "Shield Wall",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Razuvious",

	--shout_cmd = "shout",
	shout_name = "Alerta de Grito perturbador",
	shout_desc = "Avisa para Grito perturbador",

	--unbalance_cmd = "unbalancing",
	unbalance_name = "Alerta de Golpe desequilibrante",
	unbalance_desc = "Avisa para Golpe desequilibrante",

	--shieldwall_cmd = "shieldwall",
	shieldwall_name = "Temporizador de Muro de escudo",
	shieldwall_desc = "Muestra un temporizador para Muro de escudo",

	startwarn = "¡Entrando en combate con Instructor Razuvious! 15 segundos hasta Grito, 30 segundos hasta Golpe desequilibrante!",

	starttrigger1 = "Stand and fight!",
	starttrigger2 = "Show me what you've got!",
	starttrigger3 = "Hah hah, I'm just getting warmed up!",
	--starttrigger4 = "Stand and fight!",

	shouttrigger = "Grito perturbador",
	shout7secwarn = "7 segundos hasta Grito perturbador",
	shout3secwarn = "¡3 segundos hasta Grito perturbador!",
	shoutwarn = "¡Grito perturbador! El próximo en 25 segundos",
	noshoutwarn = "¡No hay grito! El próximo en 20 segundos",
	shoutbar = "Grito perturbado",

	unbalance_trigger = "sufre de Golpe desequilibrante",
	unbalancesoonwarn = "¡Golpe desequilibrante pronto!",
	unbalancewarn = "¡Golpe desequilibrante! El próximo en ~30 segundos",
	unbalancebar = "Golpe desequilibrante",

	shieldwalltrigger   = "Caballero de la Muerte suplente gana Muro de escudo.",
	shieldwallbar       = "Muro de escudo",
} end )
---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.wipemobs = {understudy} -- adds which will be considered in CheckForEngage
module.toggleoptions = {"shout", "unbalance", "shieldwall", "bosskill"}


-- locals
local timer = {
	firstShout = 15,
	shout = 25,
	--noShoutDelay = 5,
	unbalance = 30,
	shieldwall = 20,
}
local icon = {
	shout = "Ability_Warrior_WarCry",
	unbalance = "Ability_Warrior_DecisiveStrike",
	shieldwall = "Ability_Warrior_ShieldWall",
}
local syncName = {
	shout = "RazuviousShout"..module.revision,
	shieldwall = "RazuviousShieldwall"..module.revision,
}


------------------------------
--      Initialization      --
------------------------------

module:RegisterYellEngage(L["starttrigger1"])
module:RegisterYellEngage(L["starttrigger2"])
module:RegisterYellEngage(L["starttrigger3"])

-- called after module is enabled
function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "CheckForShout")
	--self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "CheckForShout")
	--self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "CheckForShout")

	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "CheckForShout")
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE", "CheckForShout")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CheckForUnbalance")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CheckForUnbalance")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckForUnbalance")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE", "CheckForUnbalance")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS", "CheckForShieldwall")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS", "CheckForShieldwall")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS", "CheckForShieldwall")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "CheckForShieldwall")

	self:ThrottleSync(5, syncName.shout)
	self:ThrottleSync(5, syncName.shieldwall)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.shout then
		self:Message(L["startwarn"], "Attention", nil, "Urgent")
		self:DelayedMessage(timer.firstShout - 7, L["shout7secwarn"], "Urgent")
		self:DelayedMessage(timer.firstShout - 3, L["shout3secwarn"], "Urgent")
		self:Bar(L["shoutbar"], timer.firstShout, icon.shout)
	end
	--self:ScheduleEvent("bwrazuviousnoshout", self.NoShout, timer.shout + timer.noShoutDelay, self) -- praeda first no shout fix
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Initialization      --
------------------------------

function module:CheckForShieldwall(msg)
	if string.find(msg, L["shieldwalltrigger"]) then
		self:Sync(syncName.shieldwall)
	end
end

function module:CheckForShout(msg)
	if string.find(msg, L["shouttrigger"]) then
		self:Sync(syncName.shout)
	end
end

-- 5s after expected shout
--[[
function module:NoShout()
self:CancelScheduledEvent("bwrazuviousnoshout")
self:ScheduleEvent("bwrazuviousnoshout", self.NoShout, timer.shout + timer.noShoutDelay, self)
if self.db.profile.shout then
self:Message(L["noshoutwarn"], "Attention") -- is this message useful?
self:Bar(L["shoutbar"], timer.shout - timer.noShoutDelay, icon.shout)
self:DelayedMessage(timer.shout - timer.noShoutDelay - 7, L["shout7secwarn"], "Urgent")
self:DelayedMessage(timer.shout - timer.noShoutDelay - 3, L["shout3secwarn"], "Urgent")
end
end
]]
function module:CheckForUnbalance(msg)
	if string.find(msg, L["unbalance_trigger"]) then
		self:Message(L["unbalancewarn"], "Urgent")
		self:DelayedMessage(timer.unbalance - 5, L["unbalancesoonwarn"], "Urgent")
		self:Bar(L["unbalancebar"], timer.unbalance, icon.unbalance)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.shout then
		self:Shout()
	elseif sync == syncName.shieldwall then
		self:Shieldwall()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Shout()
	--self:CancelScheduledEvent("bwrazuviousnoshout")
	--self:ScheduleEvent("bwrazuviousnoshout", self.NoShout, timer.shout + timer.noShoutDelay, self)

	if self.db.profile.shout then
		self:Message(L["shoutwarn"], "Attention", nil, "Alarm")
		self:DelayedMessage(timer.shout - 7, L["shout7secwarn"], "Urgent")
		self:DelayedMessage(timer.shout - 3, L["shout3secwarn"], "Urgent")
		self:Bar(L["shoutbar"], timer.shout, icon.shout)
	end
end

function module:Shieldwall()
	if self.db.profile.shieldwall then
		self:Bar(L["shieldwallbar"], timer.shieldwall, icon.shieldwall)
	end
end
