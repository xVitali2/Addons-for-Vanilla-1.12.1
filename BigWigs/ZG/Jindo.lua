------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Jin'do the Hexxer"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	triggerbrainwash = "afflicted by Brain Wash.$", -- Jin'do the Hexxer casts Summon Brain Wash Totem. stupid workaround
	triggerhealing = "Jin'do the Hexxer casts Powerful Healing Ward.", -- NOTHING to detect this totem spawn in combatlog. Not even mana usage from the boss.
	curseself_trigger = "You are afflicted by Delusions of Jin'do.",
	curseother_trigger = "(.+) is afflicted by Delusions of Jin'do.",
	hexself_trigger = "You are afflicted by Hex.",
	hexother_trigger = "(.+) is afflicted by Hex.",
	hexselfend_trigger = "Hex fades from you.",
	hexotherend_trigger = "Hex fades from (.+).",
	warnbrainwash = "Brain Wash Totem!",
	warnhealing = "Healing Totem!",
	jindo_death = "Jin'do the Hexxer dies.",
	brainwash_death = "Brain Wash Totem dies.",
	healing_death = "Powerful Healing Ward dies.",
	brainwash_bar = "Brain Wash Totem",
	healing_bar = "Powerful Healing Ward",
	hex_bar = "Hex: %s",
	cursewarn_message = "You are cursed! Kill the Shades!",
	cursewarn_warning = "%s is cursed!",
	hexwarn_warning = "%s has Hex! Dispel it!",
	
	cmd = "Jindo",

	brainwash_cmd = "brainwash",
	brainwash_name = "Brain Wash Totem Alert",
	brainwash_desc = "Warn when Jin'do summons Brain Wash Totems.",

	healingward_cmd = "healingward",
	healingward_name = "Healing Totem Alert",
	healingward_desc = "Warn when Jin'do summons Powerful Healing Wards.",

	curse_cmd = "curse",
	curse_name = "Curse Alert",
	curse_desc = "Warn when players get Delusions of Jin'do.",
	
	hex_cmd = "hex",
	hex_name = "Hex Alert",
	hex_desc = "Warn when players get Hex.",

	puticon_cmd = "puticon",
	puticon_name = "Raid icon on cursed players",
	puticon_desc = "Place a raid icon on the player with Delusions of Jin'do.\n\n(Requires assistant or higher)",
} end )

L:RegisterTranslations("deDE", function() return {
	triggerbrainwash = "von Gehirnw\195\164sche betroffen", -- Jin'do the Hexxer casts Summon Brain Wash Totem. stupid workaround
	triggerhealing = "Jin'do the Hexxer wirkt M\195\164chtiger Heilungszauberschutz.", -- NOTHING to detect this totem spawn in combatlog. Not even mana usage from the boss.
	curseself_trigger = "Ihr seid von Irrbilder von Jin'do betroffen.",
	curseother_trigger = "(.+) ist von Irrbilder von Jin'do betroffen.",
	hexself_trigger = "Ihr seid von Verhexung betroffen.",
	hexother_trigger = "(.+) ist von Verhexung betroffen.",
	hexselfend_trigger = "'Verhexung' schwindet von Euch.",
	hexotherend_trigger = "Verhexung schwindet von (.+).",
	warnbrainwash = "Gehirnw\195\164schetotem!",
	warnhealing = "M\195\164chtiger Heilungszauberschutz!",
	jindo_death = "Jin'do the Hexxer stirbt.",
	brainwash_death = "Brain Wash Totem stirbt.",
	healing_death = "Powerful Healing Ward stirbt.",
	brainwash_bar = "Gehirnw\195\164schetotem",
	healing_bar = "M\195\164chtiger Heilungszauberschutz",
	hex_bar = "Verhexung: %s",
	cursewarn_message = "Du bist verflucht! T\195\182te die Schemengestalten!",
	cursewarn_warning = "%s ist verflucht!",
	hexwarn_warning = "%s ist verhext! Entfernt es!",
	
	cmd = "Jindo",

	brainwash_cmd = "brainwash",
	brainwash_name = "Alarm f\195\188r Gehirnw\195\164schetotem",
	brainwash_desc = "Warnung, wenn Jin'do Gehirnw\195\164schetotem beschw\195\182rt.",

	healingward_cmd = "healingward",
	healingward_name = "Alarm f\195\188r Heiltotem",
	healingward_desc = "Warnung, wenn Jin'do Heiltotem beschw\195\182rt.",

	curse_cmd = "curse",
	curse_name = "Alarm f\195\188r Fluch",
	curse_desc = "Warnung, wenn Spieler Irrbilder von Jin'do bekommen.",
	
	hex_cmd = "hex",
	hex_name = "Alarm f\195\188r Verhexung",
	hex_desc = "Warnung, wenn Spieler Verhexung bekommen.",

	puticon_cmd = "puticon",
	puticon_name = "Schlachtzugsymbol auf die Spieler",
	puticon_desc = "Versetzt eine Schlachtzugsymbol auf der Spieler, der verflucht ist.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsJindo = BigWigs:NewModule(boss)
BigWigsJindo.zonename = AceLibrary("Babble-Zone-2.2")["Zul'Gurub"]
BigWigsJindo.enabletrigger = boss
BigWigsJindo.toggleoptions = {"curse", "hex", "brainwash", "healingward", "puticon", "bosskill"}
BigWigsJindo.revision = tonumber(string.sub("$Revision: 11206 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsJindo:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "FadeFrom")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "FadeFrom")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE", "Event")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "JindoCurse", 5)
	self:TriggerEvent("BigWigs_ThrottleSync", "JindoHexStart", 4)
	self:TriggerEvent("BigWigs_ThrottleSync", "JindoHexStop", 4)
end

------------------------------
--      Events              --
------------------------------

function BigWigsJindo:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF(msg)
	--[[if self.db.profile.brainwash and string.find(msg, L["triggerbrainwash"]) then -------------- seriously WTB fix for combat log events
		self:TriggerEvent("BigWigs_Message", L["warnbrainwash"], "Urgent")
	else]]if self.db.profile.healingward and msg == L["triggerhealing"] then -------------- seriously WTB fix for combat log events. #RIP healing totem trigger
		self:TriggerEvent("BigWigs_Message", L["warnhealing"], "Attention", true, "Alarm")
		self:TriggerEvent("BigWigs_StartBar", self, L["healing_bar"], 240, "Interface\\Icons\\Spell_Holy_LayOnHands", true, "Yellow")
	end
end

function BigWigsJindo:BigWigs_RecvSync(sync, rest, nick)
	if sync == "JindoCurse" then
		if self.db.profile.curse then
			if rest == UnitName("player") then
				self:TriggerEvent("BigWigs_Message", L["cursewarn_message"], "Attention")
			else
				self:TriggerEvent("BigWigs_Message", string.format(L["cursewarn_warning"], rest), "Urgent")
				self:TriggerEvent("BigWigs_SendTell", rest, L["cursewarn_message"])
			end
		end
		if self.db.profile.puticon then 
			self:TriggerEvent("BigWigs_SetRaidIcon", rest)
		end
	elseif sync == "JindoHexStart" and self.db.profile.hex then
		self:TriggerEvent("BigWigs_Message", string.format(L["hexwarn_warning"], rest), "Important")
		self:TriggerEvent("BigWigs_StartBar", self, string.format(L["hex_bar"], rest), 5, "Interface\\Icons\\Spell_Nature_Polymorph", true, "White")
	elseif sync == "JindoHexStop" and self.db.profile.hex then
		self:TriggerEvent("BigWigs_StopBar", self, string.format(L["hex_bar"], rest))
	end
end

function BigWigsJindo:Event(msg)
	local _, _, curseother_name = string.find(msg, L["curseother_trigger"])
	local _, _, hexother_name= string.find(msg, L["hexother_trigger"])
	if curseother_name then
		self:TriggerEvent("BigWigs_SendSync", "JindoCurse "..curseother_name)
	elseif hexother_name then
		self:TriggerEvent("BigWigs_SendSync", "JindoHexStart "..hexother_name)
	elseif msg == L["curseself_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "JindoCurse "..UnitName("player"))
	elseif msg == L["hexself_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "JindoHexStart "..UnitName("player"))
	elseif self.db.profile.brainwash and string.find(msg, L["triggerbrainwash"]) then
		self:TriggerEvent("BigWigs_Message", L["warnbrainwash"], "Attention", true, "Alarm")
		self:TriggerEvent("BigWigs_StartBar", self, L["brainwash_bar"], 240, "Interface\\Icons\\Spell_Totem_WardOfDraining", true, "Black")
	end
end

function BigWigsJindo:CHAT_MSG_SPELL_AURA_GONE_SELF(msg)
	if msg == L["hexselfend_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "JindoHexStop "..UnitName("player"))
	end
end

function BigWigsJindo:FadeFrom(msg)
	local _, _, hexotherend_name = string.find(msg, L["hexotherend_trigger"])
	if hexotherend_name then
		self:TriggerEvent("BigWigs_SendSync", "JindoHexStop "..hexotherend_name)
	end
end

function BigWigsJindo:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == L["brainwash_death"] then
		self:TriggerEvent("BigWigs_StopBar", self, L["brainwash_bar"])
	elseif msg == L["healing_death"] then
		self:TriggerEvent("BigWigs_StopBar", self, L["healing_bar"])
	elseif msg == L["jindo_death"] then
		if self.db.profile.bosskill then self:TriggerEvent("BigWigs_Message", string.format(AceLibrary("AceLocale-2.2"):new("BigWigs")["%s has been defeated"], self:ToString()), "Bosskill", nil, "Victory") end
		self:TriggerEvent("BigWigs_RemoveRaidIcon")
		self.core:ToggleModuleActive(self, false)
	end
end
