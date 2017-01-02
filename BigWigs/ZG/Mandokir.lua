------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Bloodlord Mandokir"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	ohgan = "Ohgan",
	cmd = "Mandokir",

	watch_trigger = "(.+)! I'm watching you!",
	gaze_trigger = "Bloodlord Mandokir begins to cast Threatening Gaze\.",
	gazeafflictyou = "You are afflicted by Threatening Gaze\.",
	gazeafflictother = "(.+) is afflicted by Threatening Gaze\.",
	gazeendyou = "Threatening Gaze fades from you\.",
	gazeendother = "Threatening Gaze fades from (.+)\.",
	gazewatchedbar = "Threatening Gaze: %s",
	enragegain = "Bloodlord Mandokir gains Enrage\.",
	enragefade = "Enrage fades from Bloodlord Mandokir\.",
	enragebar = "Enrage",
	wwgain = "Bloodlord Mandokir gains Whirlwind\.",
	wwloss = "Whirlwind fades from Bloodlord Mandokir\.",
	ww = "Whirlwind",
	deathyou = "You die\.",
	deathother = "(.+) dies\.",
	you = "you",

	watched_warning = "You are being watched! Stop everything!",
	watched_warning_tell = "You are being watched! Stop everything!",
	watched_warning_other = "%s is being watched!",
	enraged_message = "Ohgan down! Mandokir enraged!",	

	announce_cmd = "whispers",
	announce_name = "Whisper watched players",
	announce_desc = "Warn when boss uses Threatening Gaze.\n\n(Requires assistant or higher)",

	puticon_cmd = "puticon",
	puticon_name = "Raid icon on watched players",
	puticon_desc = "Place a raid icon on the watched person.\n\n(Requires assistant or higher)",
	
	gaze_cmd = "gaze",
	gaze_name = "Threatening Gaze alert",
	gaze_desc = "Shows bars for Threatening Gaze",

	whirlwind_cmd = "whirlwind",
	whirlwind_name = "Whirlwind Alert",
	whirlwind_desc = "Shows Whirlwind bars",

	enraged_cmd = "enraged",
	enraged_name = "Enrage alert",
	enraged_desc = "Announces the boss' Enrage",
} end )

L:RegisterTranslations("deDE", function() return {
	ohgan = "Ohgan",
	cmd = "Mandokir",

	watch_trigger = "(.+)! I'm watching you!",
	gaze_trigger = "Bloodlord Mandokir beginnt Bedrohlicher Blick zu wirken\.",
	gazeafflictyou = "Ihr seid von Bedrohlicher Blick betroffen\.",
	gazeafflictother = "(.+) ist von Bedrohlicher Blick betroffen\.",
	gazeendyou = "\'Bedrohlicher Blick\' schwindet von Euch\.",
	gazeendother = "Bedrohlicher Blick schwindet von (.+)\.",
	gazewatchedbar = "Bedrohlicher Blick: %s",
	enragegain = "Bloodlord Mandokir bekommt \'Wutanfall\'\.",
	enragefade = "Wutanfall schwindet von Bloodlord Mandokir\.",
	enragebar = "Wutanfall",
	wwgain = "Bloodlord Mandokir bekommt \'Wirbelwind\'\.",
	wwloss = "Wirbelwind schwindet von Bloodlord Mandokir\.",
	ww = "Wirbelwind",
	deathyou = "Du stirbst\.",
	deathother = "(.+) stirbt\.",
	you = "Euch",

	watched_warning = "Du wirst beobachtet! Stoppen Sie alles!",
	watched_warning_tell = "You are being watched! Stop everything!",
	watched_warning_other = "%s wird beobachtet!",
	enraged_message = "Ohgan ist tot! Mandokir w\195\188tend!",	

	announce_cmd = "whispers",
	announce_name = "Warnung, wenn Spieler beobachtet werden",
	announce_desc = "Warnen, wenn Bloodlord Mandokir wirft Bedrohlicher Blick\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",

	puticon_cmd = "puticon",
	puticon_name = "Schlachtzugsymbol auf die beobachtet Spieler",
	puticon_desc = "Versetzt eine Schlachtzugsymbol auf der beobachteten Spieler.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",
	
	gaze_cmd = "gaze",
	gaze_name = "Alarm f\195\188r Bedrohlicher Blick",
	gaze_desc = "Zeigt Balken f\195\188r Bedrohlicher Blick",

	whirlwind_cmd = "whirlwind",
	whirlwind_name = "Alarm f\195\188r Wirbelwind",
	whirlwind_desc = "Zeigt Balken f\195\188r Wirbelwind",

	enraged_cmd = "enraged",
	enraged_name = "Verk\195\188ndet Boss' Raserei",
	enraged_desc = "L\195\164sst dich wissen, wenn Boss h\195\164rter zuschl\195\164gt",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsMandokir = BigWigs:NewModule(boss)
BigWigsMandokir.zonename = AceLibrary("Babble-Zone-2.2")["Zul'Gurub"]
BigWigsMandokir.enabletrigger = boss
BigWigsMandokir.wipemobs = { L["ohgan"] }
BigWigsMandokir.toggleoptions = {"gaze", "announce", "puticon", "whirlwind", "enraged", "bosskill"}
BigWigsMandokir.revision = tonumber(string.sub("$Revision: 11206 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsMandokir:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "MandokirWWStart", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "MandokirWWStop", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "MandokirEnrageStart", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "MandokirEnrageEnd", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "MandokirGazeCast", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "MandokirGazeAfflict", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "MandokirGazeEnd", 5)
end

------------------------------
--      Events              --
------------------------------

function BigWigsMandokir:CHAT_MSG_MONSTER_YELL(msg)
	local gazetime
	local _,_,watchedplayer,_ = string.find(msg, L["watch_trigger"])
	if watchedplayer then
		if self.db.profile.announce then
			if watchedplayer == UnitName("player") then
				self:TriggerEvent("BigWigs_Message", L["watched_warning"], "Personal", true, "Alarm")
			else
				self:TriggerEvent("BigWigs_Message", string.format(L["watched_warning_other"], watchedplayer), "Attention")
				self:TriggerEvent("BigWigs_SendTell", watchedplayer, L["watched_warning_tell"])
			end
		end
		if self.db.profile.puticon then
			self:TriggerEvent("BigWigs_SetRaidIcon", watchedplayer)
		end
	end
end

function BigWigsMandokir:Event(msg)
	local _,_,gazedplayer,_ = string.find(msg, L["gazeafflictother"])
	local _,_,gazedplayerend,_ = string.find(msg, L["gazeendother"])
	local _,_,gazeddeathend,_ = string.find(msg, L["deathother"])
	if msg == L["wwgain"] then
		self:TriggerEvent("BigWigs_SendSync", "MandokirWWStart")
	elseif msg == L["wwloss"] then
		self:TriggerEvent("BigWigs_SendSync", "MandokirWWStop")
	elseif msg == L["enragegain"] then
		self:TriggerEvent("BigWigs_SendSync", "MandokirEnrageStart")
	elseif msg == L["enragefade"] then
		self:TriggerEvent("BigWigs_SendSync", "MandokirEnrageEnd")
	elseif msg == L["gaze_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "MandokirGazeCast")
	elseif msg == L["gazeafflictyou"] then
		gazetime = GetTime()
		self:TriggerEvent("BigWigs_SendSync", "MandokirGazeAfflict "..UnitName("player"))
	elseif gazedplayer then
		gazetime = GetTime()
		self:TriggerEvent("BigWigs_SendSync", "MandokirGazeAfflict "..gazedplayer)
	elseif msg == L["gazeendyou"] then
		self:TriggerEvent("BigWigs_SendSync", "MandokirGazeEnd "..UnitName("player"))
	elseif gazedplayerend and gazedplayerend~=L["you"] then
		self:TriggerEvent("BigWigs_SendSync", "MandokirGazeEnd "..gazedplayerend)
	elseif msg == L["deathyou"] then
		self:TriggerEvent("BigWigs_SendSync", "MandokirGazeEnd "..UnitName("player"))
	elseif gazeddeathend then
		self:TriggerEvent("BigWigs_SendSync", "MandokirGazeEnd "..gazeddeathend)
	end
end

function BigWigsMandokir:BigWigs_RecvSync(sync, rest, nick)
	if sync == "MandokirWWStart" and self.db.profile.whirlwind then
		self:TriggerEvent("BigWigs_StartBar", self, L["ww"], 2, "Interface\\Icons\\Ability_Whirlwind")
	elseif sync == "MandokirWWStop" and self.db.profile.whirlwind then
		self:TriggerEvent("BigWigs_StopBar", self, L["ww"])
	elseif sync == "MandokirEnrageStart" and self.db.profile.enraged then
		self:TriggerEvent("BigWigs_Message", L["enraged_message"], "Urgent")
		self:TriggerEvent("BigWigs_StartBar", self, L["enragebar"], 90, "Interface\\Icons\\Spell_Shadow_UnholyFrenzy")
	elseif sync == "MandokirEnrageEnd" and self.db.profile.enraged then
		self:TriggerEvent("BigWigs_StopBar", self, L["enragebar"])
	elseif sync == "MandokirGazeCast" and self.db.profile.gaze then
		self:TriggerEvent("BigWigs_StartBar", self, L["gazecast"], 2, "Interface\\Icons\\Spell_Shadow_Charm")
	elseif sync == "MandokirGazeAfflict" and self.db.profile.gaze then
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["gazewatchedbar"], rest), 5, "Interface\\Icons\\Spell_Shadow_Charm", true, "Black")
	elseif sync == "MandokirGazeEnd" then
		if self.db.profile.gaze then
			self:TriggerEvent("BigWigs_StopBar", self, string.format(L["gazewatchedbar"], rest))
		end
		if self.db.profile.puticon then
			self:TriggerEvent("BigWigs_RemoveRaidIcon", rest)
		end
	end
end
