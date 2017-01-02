--[[
--
-- Big Wigs Strategy Module for Instructor Razuvious in Naxxramas.
--
-- Adds timer bars and warning messages for the Understudies
-- Mind Exhaustion debuff, so priests know exactly when they are ready.
--
-- Also adds a timer bar for Taunt.
--
--]]

------------------------------
--      Are you local?      --
------------------------------

local myname = "Razuvious Assistant"
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..myname)
local boss = AceLibrary("Babble-Boss-2.2")["Instructor Razuvious"]
local understudy = AceLibrary("Babble-Boss-2.2")["Deathknight Understudy"]

local times = nil

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "RazAssist",

	debuff_cmd = "debuff",
	debuff_name = "Mind Exhaustion Timer",
	debuff_desc = "Show timer bar for the Mind Exhaustion debuff",

	taunt_cmd = "taunt",
	taunt_name = "Taunt",
	taunt_desc = "Show timer bar for Taunt",

	broadcast_cmd = "broadcast",
	broadcast_name = "Broadcast debuff states",
	broadcast_desc = "Broadcasts the debuff gone in 5 seconds messages to raid warning",

	taunt_bar = "Taunt",
	taunt_trigger = "Deathknight Understudy is afflicted by Taunt%.",

	mindexhaustion_bar = "%s - Exhaustion",
	mindexhaustion = "Mind Exhaustion",
	mindexhaustion_5sec = "%s is ready in 5sec!",

	["rtPath1"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Star",
	["rtPath2"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Circle",
	["rtPath3"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Diamond",
	["rtPath4"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Triangle",
	["rtPath5"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Moon",
	["rtPath6"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Square",
	["rtPath7"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Cross",
	["rtPath8"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Skull",

	["raidIcon0"] = "Unknown",
	["raidIcon1"] = "Star",
	["raidIcon2"] = "Circle",
	["raidIcon3"] = "Diamond",
	["raidIcon4"] = "Triangle",
	["raidIcon5"] = "Moon",
	["raidIcon6"] = "Square",
	["raidIcon7"] = "Cross",
	["raidIcon8"] = "Skull",

	["raidColor0"] = "Red",
	["raidColor1"] = "Yellow",
	["raidColor2"] = "Orange",
	["raidColor3"] = "Purple",
	["raidColor4"] = "Green",
	["raidColor5"] = "White",
	["raidColor6"] = "Blue",
	["raidColor7"] = "Red",
	["raidColor8"] = "White",

} end )

L:RegisterTranslations("ruRU", function() return {
	cmd = "RazAssist",

	debuff_cmd = "debuff",
	debuff_name = "Таймер Изнурение разума",
	debuff_desc = "Отображает полосу времени дебафа Изнурение разума",

	taunt_cmd = "taunt",
	taunt_name = "Провокация",
	taunt_desc = "Отображает полосу времени Провокации",

	broadcast_cmd = "broadcast",
	broadcast_name = "Вещать состояние дебафа",
	broadcast_desc = "Вещание в рейда о исчезновении дебафа",

	taunt_bar = "Провокация",
	taunt_trigger = "Ученик рыцаря смерти терпит урон. Причина - Провокация%.",

	mindexhaustion_bar = "%s - Изнурение",
	mindexhaustion = "Изнурение разума",
	mindexhaustion_5sec = "%s через 5 сек!",

	["rtPath1"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Star",
	["rtPath2"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Circle",
	["rtPath3"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Diamond",
	["rtPath4"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Triangle",
	["rtPath5"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Moon",
	["rtPath6"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Square",
	["rtPath7"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Cross",
	["rtPath8"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Skull",

	["raidIcon0"] = "Неизвестно",
	["raidIcon1"] = "Звезда",
	["raidIcon2"] = "Круг",
	["raidIcon3"] = "Ромб",
	["raidIcon4"] = "Треугольник",
	["raidIcon5"] = "Полумесяц",
	["raidIcon6"] = "Квадрат",
	["raidIcon7"] = "Крест",
	["raidIcon8"] = "Череп",

	["raidColor0"] = "Красный",
	["raidColor1"] = "Желтый",
	["raidColor2"] = "Оранжевый",
	["raidColor3"] = "Розовый",
	["raidColor4"] = "Зеленый",
	["raidColor5"] = "Белый",
	["raidColor6"] = "Синий",
	["raidColor7"] = "Красный",
	["raidColor8"] = "Белый",

} end )

L:RegisterTranslations("zhTW", function() return {
--Bell@尖石 繁體化
	cmd = "講師助手",

	debuff_cmd = "debuff",
	debuff_name = "心靈疲憊計時條",
	debuff_desc = "顯示心靈疲憊DEBUFF計時條",

	taunt_cmd = "嘲諷",
	taunt_name = "嘲諷",
	taunt_desc = "顯示嘲諷計時條",

	broadcast_cmd = "廣播",
	broadcast_name = "廣播debuff狀態",
	broadcast_desc = "向團隊警告頻道警告DEBUFF將在五秒後消失",

	taunt_bar = "嘲諷",
	taunt_trigger = "死亡騎士實席者受到嘲諷的傷害。",

	mindexhaustion_bar = "%s - 心靈疲憊",
	mindexhaustion = "心靈疲憊",
	mindexhaustion_5sec = "%s 五秒後準備！",

	["rtPath1"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Star",
	["rtPath2"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Circle",
	["rtPath3"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Diamond",
	["rtPath4"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Triangle",
	["rtPath5"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Moon",
	["rtPath6"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Square",
	["rtPath7"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Cross",
	["rtPath8"] = "Interface\\AddOns\\BigWigs_RazuviousAssistant\\icons\\Skull",

	["raidIcon0"] = "未知",
	["raidIcon1"] = "Star",
	["raidIcon2"] = "Circle",
	["raidIcon3"] = "Diamond",
	["raidIcon4"] = "Triangle",
	["raidIcon5"] = "Moon",
	["raidIcon6"] = "Square",
	["raidIcon7"] = "Cross",
	["raidIcon8"] = "Skull",

	["raidColor0"] = "Red",
	["raidColor1"] = "Yellow",
	["raidColor2"] = "Orange",
	["raidColor3"] = "Purple",
	["raidColor4"] = "Green",
	["raidColor5"] = "White",
	["raidColor6"] = "Blue",
	["raidColor7"] = "Red",
	["raidColor8"] = "White",

} end )

L:RegisterTranslations("koKR", function() return {
	debuff_name = "피로한 정신 타이머",
	debuff_desc = "피로한 정신 디버프에 대한 타이머바 표시",

	taunt_name = "도발",
	taunt_desc = "도발에 대한 타이머바 표시",

	broadcast_name = "디버프 상태 알림",
	broadcast_desc = "디버프 사라짐 5초전 메세지를 공격대 경보로 알립니다.",

	taunt_bar = "도발",
	taunt_trigger = "죽음의 기사 수습생|1이;가; 도발에 걸렸습니다%.", -- CHECK

	mindexhaustion_bar = "%s - 피로",
	mindexhaustion = "피로한 정신",
	mindexhaustion_5sec = "%s|1은;는; 5초전 준비!",

	["raidIcon0"] = "없음",
	["raidIcon1"] = "별",
	["raidIcon2"] = "원",
	["raidIcon3"] = "마름모",
	["raidIcon4"] = "세모",
	["raidIcon5"] = "달",
	["raidIcon6"] = "네모",
	["raidIcon7"] = "가위표",
	["raidIcon8"] = "해골",

} end )

L:RegisterTranslations("frFR", function() return {
	debuff_name = "Chrono Contr\195\180le mental",
	debuff_desc = "Show timer bar for the Mind Exhaustion debuff",

	taunt_name = "Provocation",
	taunt_desc = "Montre la barre chrono pour Provocation",

	taunt_bar = "Provocation",
	taunt_trigger = "Doublure de chevalier de la mort subit les effets de Provocation%.",

	mindexhaustion_bar = "%s - Mal\195\169diction de fatigue",
	mindexhaustion = "Mal\195\169diction de fatigue",
	mindexhaustion_gone = "%s est pret pour Contr\195\180le mental!",
	mindexhaustion_5sec = "%s est pret dans 5 sec!",

	["raidIcon0"] = "Inconnu",
	["raidIcon1"] = "Etoile",
	["raidIcon2"] = "Cercle",
	["raidIcon3"] = "Diamant",
	["raidIcon4"] = "Triangle",
	["raidIcon5"] = "Lune",
	["raidIcon6"] = "Carre",
	["raidIcon7"] = "Croix",
	["raidIcon8"] = "Crane",

	["raidColor0"] = "Rouge",
	["raidColor1"] = "Jaune",
	["raidColor2"] = "Orange",
	["raidColor3"] = "Violet",
	["raidColor4"] = "Vert",
	["raidColor5"] = "Blanc",
	["raidColor6"] = "Bleu",
	["raidColor7"] = "Rouge",
	["raidColor8"] = "Blanc",
} end)

L:RegisterTranslations("deDE", function() return {
	mindexhaustion = "Gedankenersch\195\182pfung",
	taunt_trigger = "Reservist der Todesritter ist von Spott betroffen%.",
} end)


----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsRazuviousAssistant = BigWigs:NewModule(myname)
BigWigsRazuviousAssistant.synctoken = myname
BigWigsRazuviousAssistant.zonename = AceLibrary("Babble-Zone-2.2")["Naxxramas"]
BigWigsRazuviousAssistant.enabletrigger = { boss }
BigWigsRazuviousAssistant.toggleoptions = { "broadcast", "debuff", "taunt" }
BigWigsRazuviousAssistant.revision = tonumber(string.sub("$Revision: 17256 $", 12, -3))
BigWigsRazuviousAssistant.external = true

------------------------------
--      Initialization      --
------------------------------

function BigWigsRazuviousAssistant:OnEnable()
	times = {}

	self:RegisterEvent("SpecialEvents_UnitDebuffGained")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
end

------------------------------
--      Utility             --
------------------------------

function BigWigsRazuviousAssistant:GetRaidIconName(unitid)
	local iconIndex = GetRaidTargetIndex(unitid)
	if not iconIndex or not UnitExists(unitid) then return L["raidIcon0"], 0 end
	return L["raidIcon"..iconIndex], iconIndex
end

function BigWigsRazuviousAssistant:GetRaidIconColor(raidIconIndex)
	if L:HasTranslation("raidColor"..raidIconIndex) then
		return L["raidColor"..raidIconIndex]
	end
	return "Red"
end

function BigWigsRazuviousAssistant:GetRaidIconPath(raidIconIndex)
	if L:HasTranslation("rtPath"..raidIconIndex) then
		return L["rtPath"..raidIconIndex]
	end
	return "Interface\\Icons\\Spell_Shadow_Teleport"
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsRazuviousAssistant:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == string.format(UNITDIESOTHER, boss) then
		self.core:ToggleModuleActive(self, false)
	end
end

function BigWigsRazuviousAssistant:CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE(msg)
	if not self.db.profile.taunt then return end
	if string.find(msg, L["taunt_trigger"]) then
		self:TriggerEvent("BigWigs_StartBar", self, L["taunt_bar"], 20, "Interface\\Icons\\Spell_Nature_Reincarnation", "Green", "Yellow", "Orange")
	end
end

function BigWigsRazuviousAssistant:SpecialEvents_UnitDebuffGained(unitid, debuffName, applications, debuffType, texture)
	if self.db.profile.debuff and debuffName == L["mindexhaustion"] and UnitName(unitid) == understudy then
		local iconName, iconIndex = self:GetRaidIconName(unitid)

		-- Throttle by iconIndex. We will get many UnitDebuffGained events.
		if not times[iconIndex] or (times[iconIndex] + 5) <= GetTime() then
			self:TriggerEvent("BigWigs_StartBar", self, string.format(L["mindexhaustion_bar"], iconName), 60, self:GetRaidIconPath(iconIndex), self:GetRaidIconColor(iconIndex))
			self:ScheduleEvent("bwrazassmcreadysoon"..iconIndex, "BigWigs_Message", 55, string.format(L["mindexhaustion_5sec"], iconName), "Green", not self.db.profile.broadcast)
			times[iconIndex] = GetTime()
		end
	end
end

