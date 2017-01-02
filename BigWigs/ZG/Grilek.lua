------------------------------
--      Are you local?      --
------------------------------

local boss = AceLibrary("Babble-Boss-2.2")["Gri'lek"]
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Grilek",

	avatar_trigger = "Gri\'lek gains Avatar\.",
	preavatar_warn = "Avatar soon! Melee get out!",
	avatar_bar = "Avatar",
	avatar_message = "Avatar! Run away from the boss!",
	avatar_end = "Avatar fades from Gri\'lek\.",
	avatar_whisper_you = "Gri'lek is coming for you! Run away!",
	avatar_whisper = "Gri'lek is coming for you! Run away!",
	avatar_watch = "Gri'lek is going for %s!",

	avatar_cmd = "avatar",
	avatar_name = "Avatar alert",
	avatar_desc = "Announce when the boss has Avatar (enrage phase).",
	
	melee_cmd = "melee",
	melee_name = "Warnings for melee",
	melee_desc = "Warn before Avatar is cast, so melee classes can get away from the boss in time.",

	announce_cmd = "announce",
	announce_name = "Whisper players",
	announce_desc = "Lets players know that they are being targetted by Gri'lek so they run away.",

	puticon_cmd = "puticon",
	puticon_name = "Place icon",
	puticon_desc = "Place a raid icon on the targetted player.\n\n(Requires assistant or higher)",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Grilek",

	avatar_trigger = "Gri\'lek bekommt \'Avatar\'\.",
	preavatar_warn = "Avatar bald! Nahk\195\164mpfer raus!",
	avatar_bar = "Avatar",
	avatar_message = "Avatar! Geh weg vom Boss!",
	avatar_end = "Avatar schwindet von Gri\'lek\.",
	avatar_whisper_you = "Gri'lek kommt auf dich zu! Lauf weg!",
	avatar_whisper = "Gri'lek kommt auf dich zu! Lauf weg!",
	avatar_watch = "Gri'lek verfolgt %s!",

	avatar_cmd = "avatar",
	avatar_name = "Alarm f\195\188r Avatar",
	avatar_desc = "Ank\195\188ndingen wenn der Boss Avatar ist (Raserei Phase).",
	
	melee_cmd = "melee",
	melee_name = "Warnunken f\195\188r die Nahk\195\164mpfer",
	melee_desc = "Warnt bevor Avatar gewirkt wird, sodass die Nahk\195\164mpfe Zeit haben um sich vom Boss zu entfernen.",

	announce_cmd = "announce",
	announce_name = "Benachrichtigt Spieler",
	announce_desc = "Informiert Spieler, dass Gri\'lek sie verfolgt, sodass sie rechtzeitig weglaufen k\195\182nnen.",

	puticon_cmd = "puticon",
	puticon_name = "Setzt Schlachtzugssymbole",
	puticon_desc = "Setzt ein Schlachtzugssymbol auf den verfolgten Spieler.\n\n(Ben\195\182tigt Schlachtzugleiter oder Assistent)",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsGrilek = BigWigs:NewModule(boss)
BigWigsGrilek.zonename = AceLibrary("Babble-Zone-2.2")["Zul'Gurub"]
BigWigsGrilek.enabletrigger = boss
BigWigsGrilek.toggleoptions = {"avatar", "melee", "announce", "puticon", "bosskill"}
BigWigsGrilek.revision = tonumber(string.sub("$Revision: 11208 $", 12, -3))

------------------------------
--      Initialization      --
------------------------------

function BigWigsGrilek:OnEnable()
	firstwarn = 0
	nameoftarget = nil
	lasttarget = "randomshitthatwonthappen"
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH", "GenericBossDeath")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "CheckForEngage")
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "GrilekMeleeIni", 8)
	self:TriggerEvent("BigWigs_ThrottleSync", "GrilekMelee", 8)
	self:TriggerEvent("BigWigs_ThrottleSync", "GrilekAvatar", 10)
	self:TriggerEvent("BigWigs_ThrottleSync", "GrilekAvatarStop", 10)
end

------------------------------
--      Events              --
------------------------------

function BigWigsGrilek:Event(msg)
	if msg == L["avatar_trigger"] then
		self:TriggerEvent("BigWigs_SendSync", "GrilekAvatar")
	elseif msg == L["avatar_end"] then
		self:TriggerEvent("BigWigs_SendSync", "GrilekAvatarStop")
		self:TriggerEvent("BigWigs_SendSync", "GrilekMelee")
	end
end

function BigWigsGrilek:TargetChangedCheck()
	local num = GetNumRaidMembers()
	for i = 1, num do
		local raidUnit = string.format("raid%starget", i)
		if UnitExists(raidUnit) and UnitName(raidUnit) == "Gri'lek" and UnitExists(raidUnit.."target") then
			nameoftarget = UnitName(raidUnit.."target")
			if not lasttarget then
				lasttarget = nameoftarget
			end
		end
	end
	if nameoftarget ~= lasttarget then
		if self.db.profile.puticon then
			self:TriggerEvent("BigWigs_SetRaidIcon", nameoftarget)
		end
		if self.db.profile.announce then
			if nameoftarget == UnitName("player") then
				self:TriggerEvent("BigWigs_Message", L["avatar_whisper_you"], "Attention", "Alarm")
			else
				self:TriggerEvent("BigWigs_Message", string.format(L["avatar_watch"], nameoftarget), "Personal")
				self:TriggerEvent("BigWigs_SendTell", nameoftarget, L["avatar_whisper"])
			end
		end
		lasttarget = nameoftarget
	end
end

function BigWigsGrilek:Avatar()
	self:ScheduleRepeatingEvent("grilektargetchangedcheck", self.TargetChangedCheck, 0.5, self)
end

function BigWigsGrilek:BigWigs_RecvSync(sync, rest, nick)
	if sync == "BossEngaged" and rest == "Gri'lek" and not started then
		if firstwarn == 0 then
			self:TriggerEvent("BigWigs_SendSync", "GrilekMeleeIni")
		end	
	elseif sync == "GrilekMeleeIni" then
		firstwarn = 1
		if self.db.profile.melee then
			self:ScheduleEvent("BigWigs_Message", 10, L["preavatar_warn"], "Attention", true, "Alarm")
		end
	elseif sync == "GrilekMelee" then
		if self.db.profile.melee then
			self:ScheduleEvent("BigWigs_Message", 10, L["preavatar_warn"], "Attention", true, "Alarm")
		end
	elseif sync == "GrilekAvatar" then
		self:Avatar()
		if self.db.profile.avatar then
			self:TriggerEvent("BigWigs_StartBar", self, L["avatar_bar"], 15, "Interface\\Icons\\Ability_Creature_Cursed_05")
			self:TriggerEvent("BigWigs_Message", L["avatar_message"], "Urgent")
		end
	elseif sync == "GrilekAvatarStop" then
		self:CancelScheduledEvent("grilektargetchangedcheck")
		nameoftarget = nil
		if self.db.profile.avatar then
			self:TriggerEvent("BigWigs_StopBar", self, L["avatar_bar"])
		end
		if self.db.profile.puticon then
			self:TriggerEvent("BigWigs_RemoveRaidIcon", lasttarget)
		end
		lasttarget = "randomshitthatwonthappen"
	end
end
