
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Anubisath Guardian", "Ruins of Ahn'Qiraj")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Guardian",

	summon_cmd = "summon",
	summon_name = "Summon Alert",
	summon_desc = "Warn for summoned adds",

	plagueyou_cmd = "plagueyou",
	plagueyou_name = "Plague on you alert",
	plagueyou_desc = "Warn for plague on you",

	plagueother_cmd = "plagueother",
	plagueother_name = "Plague on others alert",
	plagueother_desc = "Warn for plague on others",

	icon_cmd = "icon",
	icon_name = "Place icon",
	icon_desc = "Place raid icon on the last plagued person (requires promoted or higher)",

	explode_cmd = "explode",
	explode_name = "Explode Alert",
	explode_desc = "Warn for incoming explosion",

	enrage_cmd = "enrage",
	enrage_name = "Enrage Alert",
	enrage_desc = "Warn for enrage",

	explodetrigger = "Anubisath Guardian gains Explode.",
	explodewarn = "Exploding!",
	enragetrigger = "Anubisath Guardian gains Enrage.",
	enragewarn = "Enraged!",
	summonguardtrigger = "Anubisath Guardian casts Summon Anubisath Swarmguard.",
	summonguardwarn = "Swarmguard Summoned",
	summonwarriortrigger = "Anubisath Guardian casts Summon Anubisath Warrior.",
	summonwarriorwarn = "Warrior Summoned",
	plaguetrigger = "^([^%s]+) ([^%s]+) afflicted by Plague%.$",
	plaguewarn = " has the Plague!",
	plaguewarnyou = "You have the Plague!",
	plagueyou = "You",
	plagueare = "are",
} end )

L:RegisterTranslations("deDE", function() return {
	summon_name = "Beschw\195\182rung",
	summon_desc = "Warnung, wenn Besch\195\188tzer des Anubisath Schwarmwachen oder Krieger beschw\195\182rt.",

	plagueyou_name = "Du hast die Seuche",
	plagueyou_desc = "Warnung, wenn Du die Seuche hast.",

	plagueother_name = "X hat die Seuche",
	plagueother_desc = "Warnung, wenn andere Spieler die Seuche haben.",

	icon_name = "Symbol",
	icon_desc = "Platziert ein Symbol \195\188ber dem Spieler, der die Seuche hat. (Ben\195\182tigt Anf\195\188hrer oder Bef\195\182rdert Status.)",

	explode_name = "Explosion",
	explode_desc = "Warnung vor Explosion.",

	enrage_name = "Wutanfall",
	enrage_desc = "Warnung vor Wutanfall.",

	explodetrigger = "Besch\195\188tzer des Anubisath bekommt 'Explodieren'.",
	explodewarn = "Explosion!",
	enragetrigger = "Besch\195\188tzer des Anubisath bekommt 'Wutanfall'.",
	enragewarn = "Wutanfall!",
	summonguardtrigger = "Besch\195\188tzer des Anubisath wirkt Schwarmwache des Anubisath beschw\195\182ren.",
	summonguardwarn = "Schwarmwache beschworen!",
	summonwarriortrigger = "Besch\195\188tzer des Anubisath wirkt Krieger des Anubisath beschw\195\182ren.",
	summonwarriorwarn = "Krieger beschworen!",
	plaguetrigger = "^([^%s]+) ([^%s]+) von Seuche betroffen%.$",
	plaguewarn = " hat die Seuche!",
	plaguewarnyou = "Du hast die Seuche!",
	plagueyou = "Ihr",
	plagueare = "seid",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Guardian",

	--summon_cmd = "summon",
	summon_name = "Alerta de Invocación",
	summon_desc = "Avisa para adds invocados",

	--plagueyou_cmd = "plagueyou",
	plagueyou_name = "Alerta personal del Peste",
	plagueyou_desc = "Avisa si tienes el Peste",

	--plagueother_cmd = "plagueother",
	plagueother_name = "Alerta del Peste",
	plagueother_desc = "Avisa si otros jugadores tienen el Peste",

	--icon_cmd = "icon",
	icon_name = "Marcar para Peste",
	icon_desc = "Marca con un icono el jugador con el Peste (require asistente o líder)",

	--explode_cmd = "explode",
	explode_name = "Alerta de Explotar",
	explode_desc = "Avisa para una explosión entrante",

	--enrage_cmd = "enrage",
	enrage_name = "Alerta de Enfurecer",
	enrage_desc = "Avisa para Enfurecer",

	explodetrigger = "Guardián Anubisath gana Explotar.",
	explodewarn = "¡Explota!",
	enragetrigger = "Guardián Anubisath gana Enfurecer.",
	enragewarn = "¡Enfurecido!",
	summonguardtrigger = "Guardián Anubisath lanza Invocar guardaenjambre Anubisath.",
	summonguardwarn = "Guardaenjambre Anubisath invocado",
	summonwarriortrigger = "Guardián Anubisath lanza Invocar guerrero Anubisathr.",
	summonwarriorwarn = "Guerrero invocado",
	plaguetrigger = "^([^%s]+) ([^%s]+) afligido por Peste%.$",
	plaguewarn = " tiene el Peste!",
	plaguewarnyou = "¡Tienes el Peste!",
	plagueyou = "Tu",
	plagueare = "eres",
} end )
---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20006 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"summon", "explode", "enrage", -1, "plagueyou", "plagueother", "icon"--[[, "bosskill"]]}

module.defaultDB = {
	bosskill = false,
}

-- locals
local timer = {}
local icon = {}
local syncName = {}


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckPlague")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CheckPlague")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CheckPlague")
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = false
	berserkannounced = false
end

-- called after boss is engaged
function module:OnEngage()
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

-- override to suppress victory message and sound
function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == string.format(UNITDIESOTHER, boss) then
		self.core:ToggleModuleActive(self, false)
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS( msg )
	if self.db.profile.explode and msg == L["explodetrigger"] then
		self:Message(L["explodewarn"], "Important")
	elseif self.db.profile.enrage and msg == L["enragetrigger"] then
		self:Message(L["enragewarn"], "Important")
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF( msg )
	if self.db.profile.summon and msg == L["summonguardtrigger"] then
		self:Message(L["summonguardwarn"], "Attention")
	elseif self.db.profile.summon and msg == L["summonwarriortrigger"] then
		self:Message(L["summonwarriorwarn"], "Attention")
	end
end

function module:CheckPlague( msg )
	local _,_, player, type = string.find(msg, L["plaguetrigger"])
	if player and type then
		if self.db.profile.plagueyou and player == L["plagueyou"] and type == L["plagueare"] then
			self:Message(L["plaguewarnyou"], "Personal", true)
			self:Message(UnitName("player") .. L["plaguewarn"], "Attention", nil, nil, true )
		elseif self.db.profile.plagueother then
			self:Message(player .. L["plaguewarn"], "Attention")
			self:TriggerEvent("BigWigs_SendTell", player, L["plaguewarnyou"])
		end

		if self.db.profile.icon then
			self:Icon(player)
		end
	end
end
