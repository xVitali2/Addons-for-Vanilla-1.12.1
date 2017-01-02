assert(oRA, "oRA not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("oRAOGroup")
local groups = {}
local player = UnitName("player")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["Group"] = true,
	["Optional/Group"] = true,
	["Options for group change notifications."] = true,
	["%s has joined your group."] = true,
	["%s has left your group."] = true,
	["You have joined group %d."] = true,
	["Player"] = true,
	["Print a notification when you are changed to another group."] = true,
	["Others"] = true,
	["Print a notification when your group members are changed."] = true,
	["You are now in group %d."] = true,
	["%s has left your group."] = true,
	["%s has joined your group."] = true,
} end )

L:RegisterTranslations("ruRU", function() return {
	["Group"] = "Группа",
	["Optional/Group"] = "Дополнительно/Группа",
	["Options for group change notifications."] = "Опции оповещения о изменениях в группах.",
	["%s has joined your group."] = "%s присоединился в вашу группу.",
	["%s has left your group."] = "%s покинул вашу группу.",
	["You have joined group %d."] = "Вы присоединились к группе %d.",
	["Player"] = "Игрок",
	["Print a notification when you are changed to another group."] = "Оповещать когда вы перемещатесь в другую группу",
	["Others"] = "Другие",
	["Print a notification when your group members are changed."] = "Оповещать когда расположение участников вашей группы изменяются",
	["You are now in group %d."] = "Вы теперь в группе %d.",
	["%s has left your group."] = "%s покинул вашу группу.",
	["%s has joined your group."] = "%s присоединился к вашей группе.",
} end )

L:RegisterTranslations("zhCN", function() return {
	["Group"] = "队伍",
	["Optional/Group"] = "选择/队伍",
	["Options for group change notifications."] = "队伍的选项。",
	["%s has joined your group."] = "%s加入了你的小队。",
	["%s has left your group."] = "%s离开了小队。",
	["You have joined group %d."] = "你加入了第%d小队。",
	["Player"] = "队伍更变",
	["Print a notification when you are changed to another group."] = "提醒队伍更变。",
	["Others"] = "成员更变",
	["Print a notification when your group members are changed."] = "提醒成员更变。",
	["You are now in group %d."] = "你现在是在第%d小队。",
	["%s has left your group."] = "%s离开了小队。",
	["%s has joined your group."] = "%s加入了小队。",
} end )

L:RegisterTranslations("zhTW", function() return {
	["Group"] = "隊伍",
	["Optional/Group"] = "選擇/隊伍",
	["Options for group change notifications."] = "提醒隊伍改變的選項",
	["%s has joined your group."] = "%s加入了小隊",
	["%s has left your group."] = "%s離開了小隊",
	["You have joined group %d."] = "你加入了第%d小隊",
	["Player"] = "成員",
	["Print a notification when you are changed to another group."] = "當你變更隊伍時發出提醒",
	["Others"] = "其他",
	["Print a notification when your group members are changed."] = "當你隊伍成員變更時發出提醒",
	["You are now in group %d."] = "你現在加入了第%d小隊",
	["%s has left your group."] = "%s離開了小隊",
	["%s has joined your group."] = "%s加入了小隊",
} end )

L:RegisterTranslations("koKR", function() return {
	["Group"] = "파티",
	["Optional/Group"] = "부가/파티",
	["Options for group change notifications."] = "파티에 대한 설정입니다.",
	["%s has joined your group."] = "%s|1이;가; 파티에 참가했습니다.",
	["%s has left your group."] = "%s|1이;가; 파티를 떠났습니다.",
	["You have joined group %d."] = "%d 파티에 참가했습니다.",
	["Player"] = "파티 변경",
	["Print a notification when you are changed to another group."] = "파티 변경 사항을 알립니다.",
	["Others"] = "파티원 변경",
	["Print a notification when your group members are changed."] = "파티원 변경 사항을 알립니다.",
	["You are now in group %d."] = "현재 %d 파티 내에 있습니다.",
	["%s has left your group."] = "%s|1이;가; 파티를 떠났습니다.",
	["%s has joined your group."] = "%s|1이;가; 파티에 참가했습니다.",
} end )

L:RegisterTranslations("frFR", function() return {
	["Group"] = "Groupe",
	["Optional/Group"] = "Optionnel/Groupe",
	["Options for group change notifications."] = "Options concernant les notifications de changement de groupe.",
	["%s has joined your group."] = "%s a rejoint votre groupe.",
	["%s has left your group."] = "%s a quitté votre groupe.",
	["You have joined group %d."] = "Vous avez rejoint le groupe %d.",
	["Player"] = "Joueur",
	["Print a notification when you are changed to another group."] = "Prévient quand vous êtes changé de groupe.",
	["Others"] = "Autres",
	["Print a notification when your group members are changed."] = "Prévient quand la composition de votre groupe a changé.",
	["You are now in group %d."] = "Vous êtes maintenant dans le groupe %d.",
	["%s has left your group."] = "%s a quitté votre groupe.",
	["%s has joined your group."] = "%s a rejoint votre groupe.",
} end )

L:RegisterTranslations("deDE", function() return {
	["Group"] = "Gruppenänderung",
	["Optional/Group"] = "Wahlweise/Gruppe",
	["Options for group change notifications."] = "Optionen für Benachrichtigungen bei Gruppenänderungen.",
	["%s has joined your group."] = "%s ist Deiner Gruppe beigetreten.",
	["%s has left your group."] = "%s hat Deine Gruppe verlassen.",
	["You have joined group %d."] = "Du bist der Gruppe %d beigetreten.",
	["Player"] = "Spieler",
	["Print a notification when you are changed to another group."] = "Benachrichtigung, wenn Du in eine andere Gruppe verschoben wurdest.",
	["Others"] = "Andere",
	["Print a notification when your group members are changed."] = "Benachrichtigung, wenn ein Mitglied Deiner Gruppe verschoben wurde.",
	["You are now in group %d."] = "Du bist nun in Gruppe %d.",
	["%s has left your group."] = "%s hat Deine Gruppe verlassen.",
	["%s has joined your group."] = "%s ist Deiner Gruppe beigetreten.",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

oRAOGroup = oRA:NewModule("OptionalGroup")
oRAOGroup.defaults = {
	change = true,
	members = nil,
}
oRAOGroup.optional = true
oRAOGroup.name = L["Optional/Group"]
oRAOGroup.consoleCmd = "group"
oRAOGroup.consoleOptions = {
	type = "group", name = L["Group"], desc = L["Options for group change notifications."],
	disabled = function() return not oRA:IsActive() end,
	args = {
		["change"] = {
			type = "toggle", name = L["Player"], desc = L["Print a notification when you are changed to another group."],
			get = function() return oRAOGroup.db.profile.change end,
			set = function(v) oRAOGroup.db.profile.change = v end,
		},
		["members"] = {
			type = "toggle", name = L["Others"], desc = L["Print a notification when your group members are changed."],
			get = function() return oRAOGroup.db.profile.members end,
			set = function(v) oRAOGroup.db.profile.members = v end,
		},
	}
}

------------------------------
--      Initialization      --
------------------------------

function oRAOGroup:OnEnable()
	self:RegisterEvent("oRA_JoinedRaid")
end

function oRAOGroup:OnDisable()
	for k in pairs(groups) do groups[k] = nil end
end

------------------------
--   Event Handlers   --
------------------------

function oRAOGroup:oRA_JoinedRaid()
	for i = 1, GetNumRaidMembers() do
		local n, _, group = GetRaidRosterInfo(i)
		groups[n] = group
	end
	self:RegisterBucketEvent("RAID_ROSTER_UPDATE", 2)
end

function oRAOGroup:RAID_ROSTER_UPDATE()
	local oldPlayerGroup = groups[player]
	for i = 1, GetNumRaidMembers() do
		local n, _, group = GetRaidRosterInfo(i)
		if UnitExists(n) and groups[n] ~= group then
			if UnitIsUnit("player", n) then
				if self.db.profile.change then
					self:Print(L["You are now in group %d."]:format(group))
				end
			elseif self.db.profile.members then
				if groups[n] == oldPlayerGroup then
					self:Print(L["%s has left your group."]:format(n))
				elseif group == oldPlayerGroup then
					self:Print(L["%s has joined your group."]:format(n))
				end
			end
			groups[n] = group
		end
	end
end