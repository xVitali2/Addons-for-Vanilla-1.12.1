
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("General Rajaxx", "Ruins of Ahn'Qiraj")
local andorov = AceLibrary("Babble-Boss-2.2")["Lieutenant General Andorov"]


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Rajaxx",

	wave_cmd = "wave",
	wave_name = "Wave Alert",
	wave_desc = "Warn for incoming waves",

	trigger0 = "Remember, Rajaxx, when I said I'd kill you last?",
	trigger1 = "Kill first, ask questions later... Incoming!",
	trigger2 = "?????",  -- There is no callout for wave 2 ><
	trigger3 = "The time of our retribution is at hand! Let darkness reign in the hearts of our enemies!",
	trigger4 = "No longer will we wait behind barred doors and walls of stone! No longer will our vengeance be denied! The dragons themselves will tremble before our wrath!",
	trigger5 = "Fear is for the enemy! Fear and death!",
	trigger6 = "Staghelm will whimper and beg for his life, just as his whelp of a son did! One thousand years of injustice will end this day!",
	trigger7 = "Fandral! Your time has come! Go and hide in the Emerald Dream and pray we never find you!",
	trigger8 = "Impudent fool! I will kill you myself!",
	trigger10 = "I lied...",

	shield_trigger ="gains Shield of Rajaxx",
	shield = "Shield of Rajaxx",
	shield_cd = "Shield of Rajaxx CD",

	trigger2_2 = "Kill ",

	warn0 = "Wave 1/8", -- trigger for starting the event by pulling the first wave instead of talking to andorov
	warn1 = "Wave 1/8",
	warn2 = "Wave 2/8",
	warn3 = "Wave 3/8",
	warn4 = "Wave 4/8",
	warn5 = "Wave 5/8",
	warn6 = "Wave 6/8",
	warn7 = "Wave 7/8",
	warn8 = "Incoming General Rajaxx",


} end )


L:RegisterTranslations("deDE", function() return {
	wave_name = "Wellen",
	wave_desc = "Warnung vor den ankommenden Gegner Wellen.",

	trigger0 = "Erinnerst du dich daran, Rajaxx, wann ich dir das letzte Mal sagte, ich w\195\188rde dich t\195\182ten?",
	trigger1 = "Hier kommen sie. Bleibt am Leben, Welpen.",
	trigger2 = "?????",  -- There is no callout for wave 2 ><
	trigger3 = "Die Zeit der Vergeltung ist gekommen!",
	trigger4 = "Wir werden nicht l\195\164nger hinter verbarrikadierten Toren und Mauern aus Stein ausharren!",
	trigger5 = "Wir kennen keine Furcht!",
	trigger6 = "Staghelm wird winseln und um sein Leben betteln, genau wie sein r\195\164udiger Sohn!",
	trigger7 = "Fandral! Deine Zeit ist gekommen!",
	trigger8 = "Unversch\195\164mter Narr! Ich werde Euch h\195\182chstpers\195\182nlich t\195\182ten!",

	warn0 = "Welle 1/8", -- trigger for starting the event by pulling the first wave instead of talking to andorov
	warn1 = "Welle 1/8",
	warn2 = "Welle 2/8",
	warn3 = "Welle 3/8",
	warn4 = "Welle 4/8",
	warn5 = "Welle 5/8",
	warn6 = "Welle 6/8",
	warn7 = "Welle 7/8",
	warn8 = "General Rajaxx kommt!",
} end )



---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20006 -- To be overridden by the module!
module.enabletrigger = {module.translatedName, andorov} -- string or table {boss, add1, add2}
module.toggleoptions = {--[["wave",]] "bosskill"}


-- locals
local timer = {
	wave = 180,
	yeggethShield = 6,
--yeggethShieldCD = 15,
}
local icon = {
	wave = "Spell_Holy_PrayerOfHealing",
	yeggethShield = "Spell_Holy_SealOfProtection",
}
local syncName = {}

local wave = nil

------------------------------
--      Initialization      --
------------------------------
module:RegisterYellEngage(L["trigger1"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	--self:RegisterEvent("CHAT_MSG_MONSTER_YELL")

	--self.warnsets = {}
	--for i=0,8 do
	--	self.warnsets[L["trigger"..i]] = L["warn"..i]
	--end
	--
	--wave = 0
end

-- called after module is enabled and after each wipe
function module:OnSetup()
end

-- called after boss is engaged
function module:OnEngage()
--wave = 1
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Event Handlers	    --
------------------------------

function module:CheckForWipe()
-- ignore wipe check
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if string.find(msg, L["shield_trigger"])then
		--self:CancelDelayedBar(L["shield_cd"])
		--self:RemoveBar(L["shield_cd"])
		self:Bar(L["shield"], timer.yeggethShield, icon.yeggethShield)
		--self:DelayedBar(timer.yeggethShield, L["shield_cd"], timer.yeggethShieldCD-timer.yeggethShield, icon.yeggethShield)
	end
end
