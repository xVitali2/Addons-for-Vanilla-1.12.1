
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Gri'lek", "Zul'Gurub")


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

L:RegisterTranslations("ruRU", function() return { --BY CFM
	avatar_trigger = "Гри\'лек получает эффект \"Аватара\"\.",
	preavatar_warn = "Аватара скоро! Игроки ближнего боя убегайте!",
	avatar_bar = "Аватара",
	avatar_message = "Аватара! Убегайте от босса!",
	avatar_end = "Действие эффекта \"Аватара\", наложенного на Гри\'лек, заканчивается\.",
	avatar_whisper_you = "Гри'лек идет за тобой! Убегай!",
	avatar_whisper = "Гри'лек идет за тобой! Убегай!",
	avatar_watch = "Гри'лек следует за %s!",

	avatar_name = "Оповещение об Аватаре",
	avatar_desc = "Информировать когда босс в Аватаре (фаза берсерка)",

	melee_name = "Предупреждение для игроков ближнего боя",
	melee_desc = "Предупреждает до использования Аватары, так классы ближнего боя могут убежать от босса вовремя.",

	announce_name = "Шепот игрокам",
	announce_desc = "Позволяет игрокам знать что они будут целью босса чтобы они убежали.",

	puticon_name = "Значок рейда на помеченных игроках.",
	puticon_desc = "Устанавливать значок рейда на игрока, являющегося целью босса.\n\n(Требуется помощник или выше)",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Grilek",

	avatar_trigger = "Gri\'lek gana Avatar\.",
	preavatar_warn = "¡Avatar pronto! Retroceden los melee!",
	avatar_bar = "Avatar",
	avatar_message = "¡Avatar! Váyanse del jefe!",
	avatar_end = "Avatar desaparece de Gri\'lek\.",
	avatar_whisper_you = "¡Gri'lek está viniendo hacia ti! Váyate!",
	avatar_whisper = "¡Gri'lek está viniendo hacia ti! Váyate!",
	avatar_watch = "¡Gri'lek está viniendo hacia %s!",

	--avatar_cmd = "avatar",
	avatar_name = "Alerta de Avatar",
	avatar_desc = "Anuncia cuando el jefe tenga Avatar.",

	--melee_cmd = "melee",
	melee_name = "Alerta para melee",
	melee_desc = "Avisa antes de que el jefe lance Avatar para que los melee puedan retroceder del jefe.",

	--announce_cmd = "announce",
	announce_name = "Susurrar a los jugadores",
	announce_desc = "Susurra a los jugadores para que sepan que son el objetivo de Gril'ek.",

	--puticon_cmd = "puticon",
	puticon_name = "Marcar el objetivo de Gri'lek",
	puticon_desc = "Marca con un icono el objetivo de Gri'lek.\n\n(Require asistente o líder)",
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


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"avatar", "melee", "announce", "puticon", "bosskill"}

-- locals
local timer = {
	melee = 10,
	avatar = 15,
}
local icon = {
	avatar = "Ability_Creature_Cursed_05",
}
local syncName = {
	meleeIni = "GrilekMeleeIni"..module.revision,
	melee = "GrilekMelee"..module.revision,
	avatar = "GrilekAvatar"..module.revision,
	avatarOver = "GrilekAvatarStop"..module.revision,
}


------------------------------
--      Initialization      --
------------------------------

--module:RegisterYellEngage(L["start_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")

	self:ThrottleSync(8, syncName.meleeIni)
	self:ThrottleSync(8, syncName.melee)
	self:ThrottleSync(10, syncName.avatar)
	self:ThrottleSync(10, syncName.avatarOver)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = nil
	firstwarn = 0
	nameoftarget = nil
	lasttarget = "randomshitthatwonthappen"
end

-- called after boss is engaged
function module:OnEngage()
	if firstwarn == 0 then
		self:Sync(syncName.meleeIni)
	end
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Events              --
------------------------------

function module:Event(msg)
	if msg == L["avatar_trigger"] then
		self:Sync(syncName.avatar)
	elseif msg == L["avatar_end"] then
		self:Sync(syncName.avatarOver)
		self:Sync(syncName.melee)
	end
end

function module:TargetChangedCheck()
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
			self:Icon(nameoftarget)
		end
		if self.db.profile.announce then
			if nameoftarget == UnitName("player") then
				self:Message(L["avatar_whisper_you"], "Attention", "Alarm")
			else
				self:Message(string.format(L["avatar_watch"], nameoftarget), "Personal")
				self:TriggerEvent("BigWigs_SendTell", nameoftarget, L["avatar_whisper"])
			end
		end
		lasttarget = nameoftarget
	end
end

function module:Avatar()
	self:ScheduleRepeatingEvent("grilektargetchangedcheck", self.TargetChangedCheck, 0.5, self)
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.meleeIni then
		firstwarn = 1
		if self.db.profile.melee then
			self:DelayedMessage(timer.melee, L["preavatar_warn"], "Attention", true, "Alarm")
		end
	elseif sync == syncName.melee then
		if self.db.profile.melee then
			self:DelayedMessage(timer.melee, L["preavatar_warn"], "Attention", true, "Alarm")
		end
	elseif sync == syncName.avatar then
		self:Avatar()
		if self.db.profile.avatar then
			self:Bar(L["avatar_bar"], timer.avatar, icon.avatar)
			self:Message(L["avatar_message"], "Urgent")
		end
	elseif sync == syncName.avatarOver then
		self:CancelScheduledEvent("grilektargetchangedcheck")
		nameoftarget = nil
		if self.db.profile.avatar then
			self:RemoveBar(L["avatar_bar"])
		end
		if self.db.profile.puticon then
			self:RemoveIcon(lasttarget)
		end
		lasttarget = "randomshitthatwonthappen"
	end
end
