
local module, L = BigWigs:ModuleDeclaration("Erennius", "Emerald Sanctum")

module.revision = 30020
module.enabletrigger = module.translatedName
module.toggleoptions = {"wailoferennius", "howloferennius", "volley", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "Erennius",

	wailoferennius_cmd = "wailoferennius",
	wailoferennius_name = "Wail Of Erennius Alert",
	wailoferennius_desc = "Warn for Wail Of Erennius",

	howloferennius_cmd = "howloferennius",
	howloferennius_name = "Howl Of Erennius Alert",
	howloferennius_desc = "Warns for Howl Of Erennius",
	
	volley_cmd = "volley",
	volley_name = "Poison Volley Alert",
	volley_desc = "Warns for Poison Volley",
	
	--Erennius vv
	trigger_wailOfErenniusCast = "Erennius begins to cast Wail of Erennius.",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	bar_wailOfErenniusCast = "Wail Casting",
	bar_wailOfErenniusAfflicted = "Wail Afflicted",
	bar_wailOfErenniusCd = "Wail of Erennius CD",
	
	trigger_howlOfErennius = "afflicted by Howl of Erennius",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_howlOfErenniusResist = "Howl of Erennius was resisted",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE
	bar_howlOfErenniusCD = "Silence CD",
	bar_howlOfErenniusAfflicted = "Silenced!",
	
	trigger_volley = "afflicted by Poison Bolt Volley",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	bar_volley = "Poison Bolt Volley",
	--Erennius ^^
	
	trigger_someYell = "Your efforts...",
} end )

local timer = {
	wailOfErenniusCast = 6,
	wailOfErenniusAfflicted = 3,
	wailOfErenniusCd = 26,
	howlOfErenniusCd = {22,38},--saw 30, saw 46, minus the 8 afflicted -> 25,38
	howlOfErenniusAfflicted = 8,
	volley = 12,
}
local icon = {
	wailOfErenniusCast = "Spell_Shadow_ShadeTruesight",
	wailOfErenniusAfflicted = "Spell_Shadow_ShadeTruesight",
	wailOfErenniusCd = "Spell_Shadow_ShadeTruesight",
	howlOfErennius = "Spell_Shadow_AuraOfDarkness",
	volley = "Spell_Nature_CorrosiveBreath",
}
local color = {
	wailOfErenniusCast = "Purple",
	wailOfErenniusAfflicted = "Purple",
	wailOfErenniusCd = "Purple",
	howlOfErennius = "Red",
	volley = "Green",
}
local syncName = {
	wailOfErenniusCast = "ErenniusWailOfErenniusCast"..module.revision,
	howlOfErennius = "ErenniusHowlOfErennius"..module.revision,
	volley = "ErenniusVolley"..module.revision,
}

--module:RegisterYellEngage(L["trigger_engage"])

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")--trigger_wailOfErennius, trigger_howlOfErenniusResist
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--trigger_howlOfErennius, trigger_volley
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--trigger_howlOfErennius, trigger_volley
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--trigger_howlOfErennius, trigger_volley
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")--trigger_howlOfErenniusResist

	self:ThrottleSync(10, syncName.wailOfErenniusCast)
	self:ThrottleSync(10, syncName.howlOfErennius)
	self:ThrottleSync(8, syncName.volley)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
end

function module:OnDisengage()
end

function module:Event(msg)
	if msg == L["trigger_wailOfErenniusCast"] then
		self:Sync(syncName.wailOfErenniusCast)
	
	elseif string.find(msg, L["trigger_howlOfErennius"]) or string.find(msg, L["trigger_howlOfErenniusResist"]) then
		self:Sync(syncName.howlOfErennius)
		
	elseif string.find(msg, L["trigger_volley"]) then
		self:Sync(syncName.volley)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.wailOfErenniusCast and self.db.profile.wailoferennius then
		self:WailOfErenniusCast()
	elseif sync == syncName.howlOfErennius and self.db.profile.howloferennius then
		self:HowlOfErennius()
	elseif sync == syncName.volley and self.db.profile.volley then
		self:Volley()
	end
end


function module:WailOfErenniusCast()
	self:RemoveBar(L["bar_wailOfErenniusCd"])
	self:Bar(L["bar_wailOfErenniusCast"], timer.wailOfErenniusCast, icon.wailOfErenniusCast, true, color.wailOfErenniusCast)
	self:DelayedBar(timer.wailOfErenniusCast, L["bar_wailOfErenniusAfflicted"], timer.wailOfErenniusAfflicted, icon.wailOfErenniusAfflicted, true, color.wailOfErenniusAfflicted)
	self:DelayedBar(9, L["bar_wailOfErenniusCd"], timer.wailOfErenniusCd, icon.wailOfErenniusCd, true, color.wailOfErenniusCd)
end

function module:HowlOfErennius()
	self:RemoveBar(L["bar_howlOfErenniusCD"])
	self:Bar(L["bar_howlOfErenniusAfflicted"], timer.howlOfErenniusAfflicted, icon.howlOfErennius, true, color.howlOfErennius)
	self:DelayedIntervalBar(timer.howlOfErenniusAfflicted, L["bar_howlOfErenniusCD"], timer.howlOfErenniusCd[1], timer.howlOfErenniusCd[2], icon.howlOfErennius, true, color.howlOfErennius)
end

function module:Volley()
	self:Bar(L["bar_volley"], timer.volley, icon.volley, true, color.volley)
	
	if UnitClass("Player") == "Shaman" then
		self:WarningSign(icon.volley, 0.7)
	end
end
