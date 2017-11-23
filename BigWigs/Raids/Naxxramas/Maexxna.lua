
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Maexxna", "Naxxramas")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Maexxna",

	spray_cmd = "spray",
	spray_name = "Web Spray Alert",
	spray_desc = "Warn for webspray and spiders",

	enrage_cmd = "enrage",
	enrage_name = "Enrage Alert",
	enrage_desc = "Warn for enrage",

	cocoon_cmd = "cocoon",
	cocoon_name = "Cocoon Alert",
	cocoon_desc = "Warn for Cocooned players",

	poison_cmd = "Poison",
	poison_name = "Necrotic Poison Alert",
	poison_desc = "Warn for Necrotic Poison",

	cocoontrigger = "(.*) (.*) afflicted by Web Wrap.",
	webspraytrigger = "afflicted by Web Spray",
	poisontrigger = "afflicted by Necrotic Poison.",
	etrigger1 = "gains Enrage",

	cocoonwarn = "%s Cocooned!",
	poisonwarn = "Necrotic Poison!",
	enragetrigger = "%s becomes enraged.",

	webspraywarn30sec = "Wall Cocoons in 10 seconds",
	webspraywarn20sec = "Wall Cocoons! 15 seconds until Spiders spawn!",
	webspraywarn10sec = "10 seconds until Web Spray!",
	webspraywarn5sec = "AOE - Spiders Spawn - AOE! WEB SPRAY 5 SECONDS!",
	webspraywarn = "Web Spray! 40 seconds until next!",

	enragewarn = "Enrage - SQUISH SQUISH SQUISH!",
	enragesoonwarn = "Enrage Soon - Bug Swatters out!",

	webspraybar = "Web Spray",
	cocoonbar = "Cocoons",
	spiderbar = "Spiders",
	poisonbar = "Necrotic Poison",

	you = "You",
	are = "are",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Maexxna",

	--spray_cmd = "spray",
	spray_name = "Alerta de Pulverizador de tela de araña",
	spray_desc = "Avisa para Pulverizador de tela de araña",

	--enrage_cmd = "enrage",
	enrage_name = "Alerta de Enfurecer",
	enrage_desc = "Avisa para Enfurecer",

	--cocoon_cmd = "cocoon",
	cocoon_name = "Alerta de Capullo",
	cocoon_desc = "Avisa para jugadores en Capullo",

	--poison_cmd = "Poison",
	poison_name = "Alerta de Veneno necrótico",
	poison_desc = "Avisa para Veneno necrótico",

	cocoontrigger = "(.*) (.*) sufre de Trampa arácnida.",
	webspraytrigger = "sufre de Pulverizador de tela de araña",
	poisontrigger = "sufre de Veneno necrótico.",
	etrigger1 = "gana Enfurecer",

	cocoonwarn = "¡%s en Capullo!",
	poisonwarn = "¡Veneno necrótico!",
	enragetrigger = "%s becomes enraged.",

	webspraywarn30sec = "Capullos al muro en 10 segundos",
	webspraywarn20sec = "¡Capullos al muro! 15 segundos hasta aparezcan las arañas!",
	webspraywarn10sec = "¡10 segundos hasta Pulverizador de tela de araña!",
	webspraywarn5sec = "¡AOE - Aparecen las arañas - AOE! PULVERIZADOR DE TELA DE ARAÑA 5 SEGUNDOS!",
	webspraywarn = "¡Pulverizador de tela de araña! 40 segundos hasta el próximo!",

	enragewarn = "¡Enfurecer!",
	enragesoonwarn = "¡Enfurecer pronto!",

	webspraybar = "Pulverizador de tela de araña",
	cocoonbar = "Capullos",
	spiderbar = "Arañás",
	poisonbar = "Veneno necrótico",

	you = "Tu",
	are = "estás",
} end )
---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20011 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"spray", "poison", "cocoon", "enrage", "bosskill"}


-- locals
local timer = {
	poison = {5, 10},
	firstPoison = 15,
	cocoon = 20,
	spider = 30,
	webspray = 40,
}
local icon = {
	spider = "INV_Misc_MonsterSpiderCarapace_01",
	cocoon = "Spell_Nature_Web",
	poison = "Ability_Creature_Poison_03",
	webspray = "Ability_Ensnare",
}
local syncName = {
	webspray = "MaexxnaWebspray"..module.revision,
	poison = "MaexxnaPoison"..module.revision,
	cocoon = "MaexxnaCocoon"..module.revision,
}

local times = {}
local enrageannounced = false

------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Enrage")
	self:RegisterEvent("UNIT_HEALTH")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "SprayEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "SprayEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "SprayEvent")

	self:ThrottleSync(8, syncName.webspray)
	self:ThrottleSync(5, syncName.poison)
	self:ThrottleSync(0, syncName.cocoon)
	-- the MaexxnaCocoon sync is left unthrottled, it's throttled inside the module itself
	-- because the web wrap happens to a lot of players at once.
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	enrageannounced = false
	times = {}
end

-- called after boss is engaged
function module:OnEngage()
	self:KTM_SetTarget(self:ToString())
	self:Bar(L["poisonbar"], timer.firstPoison, icon.poison)
	self:Webspray()
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Initialization      --
------------------------------

function module:SprayEvent(msg)
	-- web spray warning
	if string.find(msg, L["webspraytrigger"]) then
		self:Sync(syncName.webspray)
	elseif string.find(msg, L["poisontrigger"]) then
		self:Sync(syncName.poison)
	elseif string.find(msg, L["cocoontrigger"]) then
		local _,_,wplayer,wtype = string.find(msg, L["cocoontrigger"])
		if wplayer and wtype then
			if wplayer == L["you"] and wtype == L["are"] then
				wplayer = UnitName("player")
			end
			local t = GetTime()
			if (not times[wplayer]) or (times[wplayer] and (times[wplayer] + 10) < t) then
				self:Sync(syncName.cocoon .. " " .. wplayer)
			end
		end
	end
end

function module:UNIT_HEALTH( msg )
	if UnitName(msg) == boss then
		local health = UnitHealth(msg)
		if (health > 30 and health <= 33 and not enrageannounced) then
			if self.db.profile.enrage then
				self:Message(L["enragesoonwarn"], "Important")
			end
			enrageannounced = true
		elseif (health > 40 and enrageannounced) then
			enrageannounced = false
		end
	end
end

function module:Enrage( msg )
	if string.find(msg, L["etrigger1"]) then
		if self.db.profile.enrage then
			self:Message(L["enragewarn"], "Important", nil, "Beware")
		end
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest)
	if sync == syncName.webspray then
		self:Webspray()
	elseif sync == syncName.poison then
		self:Poison()
	elseif sync == syncName.cocoon and rest then
		self:Cocoon(rest)
	end
end


------------------------------
--      Sync Handlers	    --
------------------------------

function module:Webspray()
	--self:CancelDelayedMessage(L["webspraywarn30sec"])
	--self:CancelDelayedMessage(L["webspraywarn20sec"])
	--self:CancelDelayedMessage(L["webspraywarn10sec"])
	--self:CancelDelayedMessage(L["webspraywarn5sec"])

	self:Message(L["webspraywarn"], "Important")
	self:Bar(L["cocoonbar"], timer.cocoon, icon.cocoon)
	self:Bar(L["spiderbar"], timer.spider, icon.spider)
	self:Bar(L["webspraybar"], timer.webspray, icon.webspray)

	--self:DelayedMessage(timer.webspray - 30, L["webspraywarn30sec"], "Attention")
	--self:DelayedMessage(timer.webspray - 20, L["webspraywarn20sec"], "Attention")
	--self:DelayedMessage(timer.webspray - 10, L["webspraywarn10sec"], "Attention")
	--self:DelayedMessage(timer.webspray - 5, L["webspraywarn5sec"], "Attention")
end

function module:Poison()
	if self.db.profile.poison then
		self:Message(L["poisonwarn"], "Important")
		self:IntervalBar(L["poisonbar"], timer.poison[1], timer.poison[2], icon.poison)
	end
end

function module:Cocoon(player)
	local t = GetTime()
	if (not times[player]) or (times[player] and (times[player] + 10) < t) then
		if self.db.profile.cocoon then
			self:Message(string.format(L["cocoonwarn"], player), "Urgent")
		end
		times[player] = t
	end
end
