
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Stoneskin Gargoyle", "Naxxramas")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Stoneskin",

	stoneskin_cmd = "stoneskin",
	stoneskin_name = "Stoneskin Alert",
	stoneskin_desc = "Warn for Stoneskin",

	stoneskintrigger = "%s emits a strange noise.",
	stoneskinwarn = "Casting Stoneskin!",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Defender",

	stoneskin_cmd = "stoneskin",
	stoneskin_name = "Stoneskin Alert",
	stoneskin_desc = "Warn for Stoneskin",

	stoneskintrigger = "Stoneskin Gargoyle emits a strange noise.",
	stoneskinwarn = "Casting Stoneskin!",
} end )

L:RegisterTranslations("deDE", function() return {
	stoneskin_cmd = "stoneskin",
	stoneskin_name = "Stoneskin Alert",
	stoneskin_desc = "Warn for Stoneskin",

	stoneskintrigger = "Stoneskin Gargoyle emits a strange noise.",
	stoneskinwarn = "Casting Stoneskin!",
} end )

---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = { "Stoneskin Gargoyle", "Plagued Gargoyle" }
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"stoneskin"}
module.trashMod = true

module.defaultDB = {
	bosskill = nil,
}

-- locals
local timer = {
	stoneskin = 6,
}
local icon = {
	stoneskin = "spell_nature_enchantarmor",
}
local syncName = {
	stoneskin = "StoneskinGargoyleStoneskin"..module.revision,
}


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "checkStoneskin")

	self:ThrottleSync(6, syncName.stoneskin)
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
	if sync == syncName.stoneskin then
		self:Message(L["stoneskinwarn"], "Important", nil, "Beware")
		self:Bar(L["stoneskinwarn"], timer.stoneskin, icon.stoneskin)
	end
end

function module:checkStoneskin(msg)
	if msg == L["stoneskintrigger"] then
		self:Sync(syncName.stoneskin)
	end
end
