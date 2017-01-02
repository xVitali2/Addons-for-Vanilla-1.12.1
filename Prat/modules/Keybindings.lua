--[[
Name: Prat_KeyBindings
Revision: $Revision: 16019 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#KeyBindings
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that adds keybindings for modules.
Dependencies: Prat
]]

local L = AceLibrary("AceLocale-2.2"):new("PratKeyBindings")

L:RegisterTranslations("enUS", function() return {
    ["Prat ChannelNames"] = true,
    ["Officer Channel"] = true,
	["Guild Channel"] = true,
	["Party Channel"] = true,
	["Raid Channel"] = true,
    ["Raid Warning Channel"] = true,
    ["Battleground Channel"] = true,
    ["Say"] = true,
    ["Yell"] = true,
    ["Whisper"] = true,
    ["Channel %d"] = true,
	["Prat TellTarget"] = true,
    ["TellTarget"] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["Prat ChannelNames"] = "Prat ChannelNames",
    ["Officer Channel"] = "Офицерский Канал",
	["Guild Channel"] = "Канал Гильдии",
	["Party Channel"] = "Канал Группы",
	["Raid Channel"] = "Канал Рейда",
    ["Raid Warning Channel"] = "Канал объявлений рейду",
    ["Battleground Channel"] = "Канал поля боя",
    ["Say"] = "Сказать",
    ["Yell"] = "Крикнуть",
    ["Whisper"] = "Шепнуть",
    ["Channel %d"] = "Канал %d",
	["Prat TellTarget"] = "Prat Сказать цели",
    ["TellTarget"] = "Сказать цели",
} end)

L:RegisterTranslations("zhCN", function() return {
	["Prat ChannelNames"] = "Prat 频道名称",
	["Officer Channel"] = "官员频道",
	["Guild Channel"] = "公会频道",
	["Party Channel"] = "队伍频道",
	["Raid Channel"] = "团队频道",
	["Raid Warning Channel"] = "团队警报频道",
	["Battleground Channel"] = "战场频道",
	["Say"] = "说",
	["Yell"] = "喊",
	["Whisper"] = "密语",
	["Channel %d"] = "频道 %d",
	["Prat TellTarget"] = "Prat 通知目标",
	["TellTarget"] = "通知目标",
} end)

L:RegisterTranslations("koKR", function() return {
    ["Prat ChannelNames"] = "Prat 채널명",
    ["Officer Channel"] = "오피서 채널",
	["Guild Channel"] = "길드 채널",
	["Party Channel"] = "파티 채널",
	["Raid Channel"] = "공격대 채널",
    ["Raid Warning Channel"] = "공격대경보 채널",
    ["Battleground Channel"] = "전장 채널",
    ["Say"] = "일반대화",
    ["Yell"] = "외치기",
    ["Whisper"] = "귓속말",
    ["Channel %d"] = "채널 %d",
	["Prat TellTarget"] = "Prat 대상대화",
	["TellTarget"] = "대상대화",
} end)

Prat_Keybindings = Prat:NewModule("keybindings")

function Prat_Keybindings:OnInitialize()
	BINDING_HEADER_Prat_ChannelNames = L["Prat ChannelNames"]
	BINDING_NAME_officer = L["Officer Channel"]
	BINDING_NAME_guild = L["Guild Channel"]
	BINDING_NAME_party = L["Party Channel"]
	BINDING_NAME_raid = L["Raid Channel"]
	BINDING_NAME_raidwarn = L["Raid Warning Channel"]
	BINDING_NAME_battleground = L["Battleground Channel"]
	BINDING_NAME_say = L["Say"]
	BINDING_NAME_yell = L["Yell"]
	BINDING_NAME_whisper = L["Whisper"]
	BINDING_NAME_one = string.format(L["Channel %d"], 1)
	BINDING_NAME_two = string.format(L["Channel %d"], 2)
	BINDING_NAME_three = string.format(L["Channel %d"], 3)
	BINDING_NAME_four = string.format(L["Channel %d"], 4)
	BINDING_NAME_five = string.format(L["Channel %d"], 5)
	BINDING_NAME_six = string.format(L["Channel %d"], 6)
	BINDING_NAME_seven = string.format(L["Channel %d"], 7)
	BINDING_NAME_eight = string.format(L["Channel %d"], 8)
	BINDING_NAME_nine = string.format(L["Channel %d"], 9)
	BINDING_NAME_ten = string.format(L["Channel %d"], 10)
    BINDING_HEADER_Prat_TellTarget = L["Prat TellTarget"]
    BINDING_NAME_TellTarget = L["TellTarget"]
end
