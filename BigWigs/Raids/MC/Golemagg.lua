
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Golemagg the Incinerator", "Molten Core")

module.revision = 20003 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"earthquake", "enraged", "bosskill"}

---------------------------------
--      Module specific Locals --
---------------------------------

local timer = {}
local icon = {}
local syncName = {
	earthquake = "GolemaggEarthquake",
	enrage = "GolemaggEnrage",
}

local earthquakeon = nil

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	corerager_name = "Core Rager",
	earthquakesoonwarn = "Earthquake soon",
	golemaggenrage = "Golemagg the Incinerator gains Enrage",
	enragewarn = "Boss is enraged!",

	cmd = "Golemagg",

	enraged_cmd = "enraged",
	enraged_name = "Announce boss Enrage",
	enraged_desc = "Lets you know when boss hits harder",

	earthquake_cmd = "earthquake",
	earthquake_name = "Earthquake announce",
	earthquake_desc = "Announces when it's time for melees to back off",
} end)

L:RegisterTranslations("esES", function() return {
	corerager_name = "Furibundo del Núcleo",
	earthquakesoonwarn = "Terremoto pronto",
	golemaggenrage = "Golemagg el Incinerador gana Enfurecer",
	enragewarn = "¡Golemagg está enfurecido!",

	--cmd = "Golemagg",

	--enraged_cmd = "enraged",
	enraged_name = "Anuncia de Enfurecer",
	enraged_desc = "Te avisa cuando se enfurezca Golemagg",

	--earthquake_cmd = "earthquake",
	earthquake_name = "Anuncia de Terremoto",
	earthquake_desc = "Anuncia cuando los melee tienen que retroceder",
} end)

L:RegisterTranslations("deDE", function() return {
	corerager_name = "Kernw\195\188terich",
	earthquakesoonwarn = "Erdbeben bald",
	golemaggenrage = "Golemagg der Verbrenner bekommt \'Wutanfall",
	enragewarn = "Boss ist in Raserei!",

	--cmd = "Golemagg",

	--enraged_cmd = "enraged",
	enraged_name = "Verk\195\188ndet Boss' Raserei",
	enraged_desc = "L\195\164sst dich wissen, wenn Boss h\195\164rter zuschl\195\164gt",

	--earthquake_cmd = "earthquake",
	earthquake_name = "Verk\195\188ndet erdbeben",
	earthquake_desc = "Sagt an, wenn es f\195\188r die Melees zeit ist, weg zu gehen",
} end)


------------------------------
--      Initialization      --
------------------------------

module.wipemobs = { L["corerager_name"] }

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("UNIT_HEALTH")

	self:ThrottleSync(10, syncName.earthquake)
	self:ThrottleSync(10, syncName.enrage)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	earthquakeon = nil
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

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if string.find(msg, L["golemaggenrage"]) then
		self:Sync(syncName.enrage)
	end
end

function module:UNIT_HEALTH(arg1)
	if UnitName(arg1) == module.translatedName then
		local health = UnitHealth(arg1)
		if health > 15 and health <= 20 and not earthquakeon then
			self:Sync(syncName.earthquake)
			earthquakeon = true
		elseif health > 20 and earthquakeon then
			earthquakeon = nil
		end
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.earthquake and self.db.profile.earthquake then
		self:Message(L["earthquakesoonwarn"], "Attention", "Alarm")
	elseif sync == syncName.enrage and self.db.profile.enraged then
		self:Message(L["enragewarn"], "Attention", true, "Beware")
	end
end
