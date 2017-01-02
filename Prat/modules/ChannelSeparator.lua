--[[
Name: Prat_ChannelSeparator
Revision: $Revision: 16019 $
Author(s): Krtek (krtek4@gmail.com)
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#ChannelSeparator
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that separates chat channels in the chat setting menu.
Dependencies: Prat
]]

local L = AceLibrary("AceLocale-2.2"):new("PratChannelSeparator")

L:RegisterTranslations("enUS", function() return {
    ["ChannelSeparator"] = true,
    ["Separates chat channels in chat setting menu."] = true,
    ["Toggle"] = true,
    ["Toggle the module on and off."] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["ChannelSeparator"] = "ChannelSeparator",
    ["Separates chat channels in chat setting menu."] = "Разделять каналы чата в меню настроек чата.",
    ["Toggle"] = "Вкл/Выкл",
    ["Toggle the module on and off."] = "Вкл/Выкл модуль.",
} end)

L:RegisterTranslations("zhCN", function() return {
	["ChannelSeparator"] = "频道分离",
	["Separates chat channels in chat setting menu."] = "分离聊天频道设置菜单。",
	["Toggle"] = "切换",
	["Toggle the module on and off."] = "切换此模块的打开与关闭。",
} end)

L:RegisterTranslations("koKR", function() return {
    ["ChannelSeparator"] = "채널구분",
    ["Separates chat channels in chat setting menu."] = "대화 설정 메뉴에 대화 채널을 구분합니다.",
    ["Toggle"] = "전환",
    ["Toggle the module on and off."] = "모듈 켜고 끄기 전환",
} end)

Prat_ChannelSeparator = Prat:NewModule("channelseparator")

function Prat_ChannelSeparator:OnInitialize()
    self.OriginalChatTypeGroup = {}
    self.OriginalChannelMenuChatTypeGroups = {}
    self.db = Prat:AcquireDBNamespace("ChannelSeparator")
    Prat:RegisterDefaults("ChannelSeparator", "profile", {
        on = true,
    })
    Prat.Options.args.channelseparator = {
        name = L["ChannelSeparator"],
        desc = L["Separates chat channels in chat setting menu."],
        type = "group",
        args = {
            Toggle = {
                type = "toggle",
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                get = function() return self.db.profile.on end,
                set = function(v) self.db.profile.on = Prat:ToggleModuleActive("channelseparator") end
            },
        }
    }
end

function Prat_ChannelSeparator:OnEnable()
    self.OriginalChatTypeGroup = ChatTypeGroup
    ChatTypeGroup["GUILD"] = {
        "CHAT_MSG_GUILD",
        "GUILD_MOTD",
    };
    ChatTypeGroup["OFFICER"] = {
        "CHAT_MSG_OFFICER",
    };
    ChatTypeGroup["PARTY"] = {
        "CHAT_MSG_PARTY",
    };
    ChatTypeGroup["RAID"] = {
        "CHAT_MSG_RAID",
        "CHAT_MSG_RAID_LEADER",
        "CHAT_MSG_RAID_WARNING",
    };
    ChatTypeGroup["BATTLEGROUND"] = {
        "CHAT_MSG_BATTLEGROUND",
        "CHAT_MSG_BATTLEGROUND_LEADER",
    };
    self.OriginalChannelMenuChatTypeGroups = ChannelMenuChatTypeGroups
    ChannelMenuChatTypeGroups = {};
    ChannelMenuChatTypeGroups[1] = "SAY";
    ChannelMenuChatTypeGroups[2] = "YELL";
    ChannelMenuChatTypeGroups[3] = "GUILD";
    ChannelMenuChatTypeGroups[4] = "OFFICER";
    ChannelMenuChatTypeGroups[5] = "WHISPER";
    ChannelMenuChatTypeGroups[6] = "PARTY";
    ChannelMenuChatTypeGroups[7] = "RAID";
    ChannelMenuChatTypeGroups[8] = "BATTLEGROUND";
end

function Prat_ChannelSeparator:OnDisable()
    ChatTypeGroup = {}
    ChatTypeGroup = self.OriginalChatTypeGroup
    ChannelMenuChatTypeGroups = {}
    ChannelMenuChatTypeGroups = self.OriginalChannelMenuChatTypeGroups
end
