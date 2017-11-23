
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Ayamiss the Hunter", "Ruins of Ahn'Qiraj")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Ayamiss",
	sacrifice_cmd = "sacrifice",
	sacrifice_name = "Sacrifice Alert",
	sacrifice_desc = "Warn for Sacrifice",

	sacrificetrigger = "^([^%s]+) ([^%s]+) afflicted by Paralyze",
	sacrificewarn = " is being Sacrificed!",
	you = "You",
	are = "are",
} end )

L:RegisterTranslations("deDE", function() return {
	sacrifice_name = "Opferung",
	sacrifice_desc = "Warnung, wenn ein Spieler geopfert wird.",

	sacrificetrigger = "^([^%s]+) ([^%s]+) von Paralisieren betroffen.",
	sacrificewarn = " wird geopfert!",
	you = "Ihr",
	are = "seid",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Ayamiss",
	--sacrifice_cmd = "sacrifice",
	sacrifice_name = "Alerta de Sacrificio",
	sacrifice_desc = "Avisa para Sacrificio",

	sacrificetrigger = "^([^%s]+) ([^%s]+) sufre de Paralizar",
	sacrificewarn = " está siendo sacrificado!",
	you = "Tu",
	are = "eres",
} end )
---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"sacrifice", "bosskill"}

-- locals
local timer = {}
local icon = {}
local syncName = {}


------------------------------
--      Initialization      --
------------------------------

--module:RegisterYellEngage(L["start_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "CheckSacrifice")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "CheckSacrifice")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "CheckSacrifice")
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
--      Event Handlers	    --
------------------------------

function module:CheckSacrifice( msg )
	local _, _, player, type = string.find(msg, L["sacrificetrigger"])
	if (player and type) then
		if (player == L["you"] and type == L["are"]) then
			player = UnitName("player")
		end

		if self.db.profile.sacrifice then
			self:Message(player .. L["sacrificewarn"], "Important")
		end
	end
end
