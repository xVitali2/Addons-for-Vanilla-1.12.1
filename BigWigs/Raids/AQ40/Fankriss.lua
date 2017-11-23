
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Fankriss the Unyielding", "Ahn'Qiraj")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Fankriss",
	worm_cmd = "worm",
	worm_name = "Worm Alert",
	worm_desc = "Warn for Incoming Worms",

	wormtrigger = "Fankriss the Unyielding casts Summon Worm.",
	wormwarn = "Incoming Worm! (%d)",
	wormbar = "Sandworm Enrage (%d)",

	entangle_cmd = "entangle",
	entangle_name = "Entangle Alert",
	entangle_desc = "Warn for Entangle and incoming Bugs",
	entangleplayer = "You are afflicted by Entangle.",
	entangleplayerother = "(.*) is afflicted by Entangle.",
	entanglewarn = "Entangle!",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Fankriss",
	--worm_cmd = "worm",
	worm_name = "Alerta de Gusano",
	worm_desc = "Avisa para Gusanos entrantes",

	wormtrigger = "Fankriss el Implacable lanza Invocar gusano.",
	wormwarn = "¡Gusano entrante! (%d)",
	wormbar = "Gusano de arena enfurecido (%d)",

	--entangle_cmd = "entangle",
	entangle_name = "Alerta de Enredar",
	entangle_desc = "Avisa para Enredar y insectos entrantes",
	entangleplayer = "Sufres de Enredar.",
	entangleplayerother = "(.*) sufre de Enredar.",
	entanglewarn = "¡Enredado!",
} end )

L:RegisterTranslations("deDE", function() return {
	worm_name = "Wurm beschw\195\182ren",
	worm_desc = "Warnung, wenn Fankriss einen Wurm beschw\195\182rt.",

	wormtrigger = "Fankriss der Unnachgiebige wirkt Wurm beschw\195\182ren.",
	wormwarn = "Wurm wurde beschworen! (%d)",
	wormbar = "Wurm ist w\195\188tend (%d)",

	entangle_name = "Umschlingen Warnung",
	entangle_desc = "Warnt vor Umschlingen und den Käfern",
	entangleplayer = "Ihr seid von Umschlingen betroffen.",
	entangleplayerother = "(.*) ist von Umschlingen betroffen.",
	entanglewarn = "Umschlingen!",
} end )

---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {--[["worm",]] "entangle", "bosskill"}


-- locals
local timer = {
	--worm = 20,
	}
local icon = {
	--worm = "Spell_Shadow_UnholyFrenzy",
	entangle = "Spell_Nature_Web",
}
local syncName = {
	--worm = "FankrissWormSpawn"..module.revision,
	entangle = "FankrissEntangle"..module.revision,
}

--local worms


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")

	--self:ThrottleSync(.1, syncName.worm)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
--worms = 0
end

-- called after boss is engaged
function module:OnEngage()
	self:KTM_SetTarget(self:ToString())
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers      --
------------------------------

function module:Event(msg)
	if string.find(msg, L["entangleplayer"]) or string.find(msg, L["entangleplayerother"]) then
		self:Sync(syncName.entangle)
	end
end
--[[
function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF(msg)
if msg == L["wormtrigger"] then
self:Sync(syncName.worm .. " " .. tostring(worms + 1) )
end
end
]]
function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.entangle then
		if self.db.profile.entangle then
			self:Message(L["entanglewarn"], "Urgent", true, "Alarm")
			self:WarningSign(icon.entangle, 2)
		end
		--[[elseif sync == syncName.worm then
		if not rest then return end
		rest = tonumber(rest)
		if rest == (worms + 1) then
		-- we accept this worm
		-- Yes, this could go completely wrong when you don't reset your module and the whole raid does after a wipe
		-- or you reset your module and the rest doesn't. Anyway. it'll work a lot better than anything else.
		worms = worms + 1
		if self.db.profile.worm then
		self:Message(string.format(L["wormwarn"], worms), "Urgent")
		self:Bar(string.format(L["wormbar"], worms), timer.worm, icon.worm)
		end
		end]]
	end
end
