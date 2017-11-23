
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Anubisath Defender", "Ahn'Qiraj")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Defender",

	plagueyou_cmd = "plagueyou",
	plagueyou_name = "Plague on you alert",
	plagueyou_desc = "Warn if you got the Plague",

	plagueother_cmd = "plagueother",
	plagueother_name = "Plague on others alert",
	plagueother_desc = "Warn if others got the Plague",

	thunderclap_cmd = "thunderclap",
	thunderclap_name = "Thunderclap Alert",
	thunderclap_desc = "Warn for Thunderclap",

	explode_cmd = "explode",
	explode_name = "Explode Alert",
	explode_desc = "Warn for Explode",

	enrage_cmd = "enrage",
	enrage_name = "Enrage Alert",
	enrage_desc = "Warn for Enrage",

	summon_cmd = "summon",
	summon_name = "Summon Alert",
	summon_desc = "Warn for add summons",

	icon_cmd = "icon",
	icon_name = "Place icon",
	icon_desc = "Place raid icon on the last plagued person (requires promoted or higher)",

	explodetrigger = "Anubisath Defender gains Explode.",
	explodewarn = "Exploding!",
	enragetrigger = "Anubisath Defender gains Enrage.",
	enragewarn = "Enraged!",
	summonguardtrigger = "Anubisath Defender casts Summon Anubisath Swarmguard.",
	summonguardwarn = "Swarmguard Summoned",
	summonwarriortrigger = "Anubisath Defender casts Summon Anubisath Warrior.",
	summonwarriorwarn = "Warrior Summoned",
	plaguetrigger = "^([^%s]+) ([^%s]+) afflicted by Plague%.$",
	plaguewarn = " has the Plague!",
	plagueyouwarn = "You have the plague!",
	plagueyou = "You",
	plagueare = "are",
	thunderclaptrigger = "^Anubisath Defender's Thunderclap hits ([^%s]+) for %d+%.",
	thunderclapwarn = "Thunderclap!",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Defender",

	--plagueyou_cmd = "plagueyou",
	plagueyou_name = "Alerta personal del Peste",
	plagueyou_desc = "Avisa si tienes el Peste",

	--plagueother_cmd = "plagueother",
	plagueother_name = "Alerta del Peste",
	plagueother_desc = "Avisa si otros jugadores tienen el Peste",

	--thunderclap_cmd = "thunderclap",
	thunderclap_name = "Alerta de Trueno",
	thunderclap_desc = "Avisa para Trueno",

	--explode_cmd = "explode",
	explode_name = "Alerta de Explotar",
	explode_desc = "Avisa para Explotar",

	--enrage_cmd = "enrage",
	enrage_name = "Alerta de Enfurecer",
	enrage_desc = "Avisa para Enfurecer",

	--summon_cmd = "summon",
	summon_name = "Alerta de Invocación",
	summon_desc = "Avisa para Guardaenjambres Anubisath invocados",

	--icon_cmd = "icon",
	icon_name = "Marcar con icono",
	icon_desc = "Marca con un icono los jugadores con el Peste (require asistente o líder)",

	explodetrigger = "Defensor Anubisath gana Explotar.",
	explodewarn = "¡Explotando!",
	enragetrigger = "Defensor Anubisath gana Enfurecer.",
	enragewarn = "¡Enfurecido!",
	summonguardtrigger = "Defensor Anubisath lanza Invocar guardaenjambre Anubisath.",
	summonguardwarn = "Guardaenjambre Anubisath Invocado",
	summonwarriortrigger = "Defensor Anubisath lanza Invocar guerrero Anubisath.",
	summonwarriorwarn = "Guerrero Anubisath Invocado",
	plaguetrigger = "^([^%s]+) ([^%s]+) sufre de Peste%.$",
	plaguewarn = " tiene el Peste!",
	plagueyouwarn = "¡Tienes el Peste!",
	plagueyou = "Tu",
	plagueare = "eres",
	thunderclaptrigger = "^Trueno de Defensor Anubisath golpea a ([^%s]+) por %d+%.",
	thunderclapwarn = "¡Trueno!",
} end )

L:RegisterTranslations("deDE", function() return {
	plagueyou_name = "Du hast die Seuche",
	plagueyou_desc = "Warnung, wenn Du die Seuche hast.",

	plagueother_name = "X hat die Seuche",
	plagueother_desc = "Warnung, wenn andere Spieler die Seuche haben.",

	thunderclap_name = "Donnerknall",
	thunderclap_desc = "Warnung vor Donnerknall.",

	explode_name = "Explosion",
	explode_desc = "Warnung vor Explosion.",

	enrage_name = "Wutanfall",
	enrage_desc = "Warnung vor Wutanfall.",

	summon_name = "Beschw\195\182rung",
	summon_desc = "Warnung, wenn Verteidiger des Anubisath Schwarmwachen oder Krieger beschw\195\182rt.",

	icon_name = "Symbol",
	icon_desc = "Platziert ein Symbol \195\188ber dem Spieler, der die Seuche hat. (Ben\195\182tigt Anf\195\188hrer oder Bef\195\182rdert Status.)",

	explodetrigger = "Verteidiger des Anubisath bekommt 'Explodieren'.",
	explodewarn = "Explosion!",
	enragetrigger = "Verteidiger des Anubisath bekommt 'Wutanfall'.",
	enragewarn = "Wutanfall!",

	summonguardtrigger = "Verteidiger des Anubisath wirkt Schwarmwache des Anubisath beschw\195\182ren.",
	summonguardwarn = "Schwarmwache beschworen!",
	summonwarriortrigger = "Verteidiger des Anubisath wirkt Krieger des Anubisath beschw\195\182ren.",
	summonwarriorwarn = "Krieger beschworen!",

	plaguetrigger = "^([^%s]+) ([^%s]+) von Seuche betroffen%.$",
	plaguewarn = " hat die Seuche!",
	plagueyouwarn = "Du hast die Seuche!",
	plagueyou = "Ihr",
	plagueare = "seid",

	thunderclaptrigger = "^Verteidiger des Anubisath's Donnerknall trifft ([^%s]+) f\195\188r %d+%.",
	thunderclapwarn = "Donnerknall!",
} end )

---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"plagueyou", "plagueother", "icon", -1, "thunderclap", "explode", "enrage"--[[, "bosskill"]]}

module.defaultDB = {
	enrage = false,
	bosskill = nil,
}

-- locals
local timer = {
	explode = 6,
}
local icon = {
	explode = "",
	plague = "Spell_Shadow_CurseOfTounges",
}
local syncName = {
	enrage = "DefenderEnrage"..module.revision,
	explode = "DefenderExplode"..module.revision,
	thunderclap = "DefenderThunderclap"..module.revision,
}


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckPlague")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CheckPlague")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CheckPlague")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Thunderclap")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Thunderclap")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Thunderclap")

	self:ThrottleSync(10, syncName.enrage)
	self:ThrottleSync(10, syncName.explode)
	self:ThrottleSync(6, syncName.thunderclap)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
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

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.explode and self.db.profile.explode then
		self:Message(L["explodewarn"], "Important", nil, "Beware")
		self:Bar(L["explodewarn"], timer.explode, icon.explode)
	elseif sync == syncName.enrage and self.db.profile.enrage then
		self:Message(L["enragewarn"], "Important")
	elseif sync == syncName.thunderclap and self.db.profile.thunderclap then
		self:Message(L["thunderclapwarn"], "Important")
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if msg == L["explodetrigger"] then
		self:Sync(syncName.explode)
	elseif msg == L["enragetrigger"] then
		self:Sync(syncName.enrage)
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF(msg)
	if not self.db.profile.summon then return end
	if msg == L["summonguardtrigger"] then
		self:Message(L["summonguardwarn"], "Attention")
	elseif msg == L["summonwarriortrigger"] then
		self:Message(L["summonwarriorwarn"], "Attention")
	end
end

function module:CheckPlague(msg)
	local _,_, pplayer, ptype = string.find(msg, L["plaguetrigger"])
	if pplayer then
		if self.db.profile.plagueyou and pplayer == L["plagueyou"] then
			self:Message(L["plagueyouwarn"], "Personal", true, "RunAway")
			self:Message(UnitName("player") .. L["plaguewarn"], "Attention", nil, nil, true)
			self:WarningSign(icon.plague, 5)
		elseif self.db.profile.plagueother then
			self:Message(pplayer .. L["plaguewarn"], "Attention")
			--self:TriggerEvent("BigWigs_SendTell", pplayer, L["plagueyouwarn"]) -- can cause whisper bug on nefarian
		end

		if self.db.profile.icon then
			self:Icon(pplayer)
		end
	end
end

function module:Thunderclap(msg)
	if string.find(msg, L["thunderclaptrigger"]) then
		self:Sync(syncName.thunderclap)
	end
end
