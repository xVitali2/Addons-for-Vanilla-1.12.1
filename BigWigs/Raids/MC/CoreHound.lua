
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Ancient Core Hound", "Molten Core")

module.revision = 20001
module.enabletrigger = module.translatedName
module.toggleoptions = {"bars"--[[, "bosskill"]]}

------------------------------
--      Locals 			    --
------------------------------

local timer = {
	firstDebuff = 12,
	debuff = 14,
}
local icon = {
	debuff = "Spell_Shadow_UnholyFrenzy"
}
local syncName = {
	debuff = "CoreHoundDebuff"..module.revision,
}


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	Debuff = "Debuff",

	trigger1 = "afflicted by %s",
	trigger2 = "%s fail(.+) immune.",
	trigger3 = "%s was resisted",


	-- AceConsole strings
	cmd = "Corehound",

	bars_cmd = "bars",
	bars_name = "Toggle bars",
	bars_desc = "Toggles showing bars for timers.",


} end )

L:RegisterTranslations("esES", function() return {
	Debuff = "Debuff",

	trigger1 = "sufre de %s",
	trigger2 = "(.+) de %s falla inmune.",
	trigger3 = "Resistido %s de Can del Núcleo",


	-- AceConsole strings
	cmd = "Corehound",

	bars_cmd = "bars",
	bars_name = "Alternar barras",
	bars_desc = "Alterna que se muestra las barras temporizadoras.",


} end )

L:RegisterTranslations("deDE", function() return {
	Debuff = "Debuff",

	trigger1 = "afflicted by %s",
	trigger2 = "%s fail(.+) immune.",
	trigger3 = "%s was resisted",


	-- AceConsole strings
	cmd = "Corehound",

	bars_cmd = "bars",
	bars_name = "Toggle bars",
	bars_desc = "Toggles showing bars for timers.",


} end )

local debuffTable = {
	"Ancient Dread",
	"Ancient Despair",
	"Ground Stomp",
	"Cauterizing Flames",
	"Withering Heat",
	"Ancient Hysteria"
}

------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Debuff")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Debuff")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Debuff")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Debuff")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Debuff")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Debuff")


	self:ThrottleSync(2, syncName.debuff)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = false
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.bars then
		self:Bar(L["Debuff"], timer.firstDebuff, icon.debuff)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()

end


------------------------------
--      Event Handlers	    --
------------------------------

function module:Debuff(msg)
	for k,v in pairs(debuffTable) do
		t1 = string.format(L["trigger1"], v)
		t2 = string.format(L["trigger2"], v)
		t3 = string.format(L["trigger3"], v)
		if ((string.find(msg, t1)) or (string.find(msg, t2)) or (string.find(msg, t3))) then
			self:Sync(syncName.debuff)
		end
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync( sync, rest, nick )
	if sync == syncName.debuff then
		if self.db.profile.bars then
			self:Bar(L["Debuff"], timer.debuff, icon.debuff)
		end
	end
end
