--[[
Name: Prat_StickyChannels
Revision: $Revision: 16019 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Inspired by: idChat2_StickyChannels by Industrial
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#StickyChannels
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that toggles sticky of different chat channel types on and off (default=on).
Dependencies: Prat
]]

local L = AceLibrary("AceLocale-2.2"):new("PratStickyChannels")

L:RegisterTranslations("enUS", function() return {
    ["StickyChannels"] = true,
    ["Chat channel sticky options."] = true,
    ["ChatType"] = true,
    ["Per chat type options."] = true,
    ["Say"] = true,
    ["Whisper"] = true,
    ["Yell"] = true,
    ["Party"] = true,
    ["Guild"] = true,
    ["Officer"] = true,
    ["Raid"] = true,
    ["RaidWarning"] = true,
    ["Battleground"] = true,
    ["Channel"] = true,
    ["Emote"] = true,
    ["%sSticky"] = true,
    ["Toggles sticky on and off for %s."] = true,
    ["Toggle"] = true,
    ["Toggle the module on and off."] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["StickyChannels"] = "StickyChannels",
    ["Chat channel sticky options."] = "Опции прилипания каналов чата.",
    ["ChatType"] = "ТипЧата",
    ["Per chat type options."] = "Опции чат типа.",
    ["Say"] = "Сказать",
    ["Whisper"] = "Шепот",
    ["Yell"] = "Крикнуть",
    ["Party"] = "Группа",
    ["Guild"] = "Гильдия",
    ["Officer"] = "Офицер",
    ["Raid"] = "Рейд",
    ["RaidWarning"] = "Объявление рейду",
    ["Battleground"] = "Поле боя",
    ["Channel"] = "Канал",
    ["Emote"] = "Эмоция",
    ["%sSticky"] = "Липкая \"%s\"",
    ["Toggles sticky on and off for %s."] = "Вкл/Выкл липкие %s.",
    ["Toggle"] = "Вкл/Выкл",
    ["Toggle the module on and off."] = "Вкл/Выкл модуль.",
} end)

L:RegisterTranslations("zhCN", function() return {
	["StickyChannels"] = "固定频道",
	["Chat channel sticky options."] = "固定聊天频道选项。",
	["ChatType"] = "聊天分类",
	["Per chat type options."] = "聊天类型选项。",
	["Say"] = "说",
	["Whisper"] = "密语",
	["Yell"] = "喊",
	["Party"] = "队伍",
	["Guild"] = "公会",
	["Officer"] = "官员",
	["Raid"] = "团队",
	["RaidWarning"] = "团队报警",
	["Battleground"] = "战场",
	["Channel"] = "频道",
	["Emote"] = "表情",
    ["%sSticky"] = "固定%s",
	["Toggles sticky on and off for %s."] = "切换固定%s频道.",
	["Toggle"] = "切换",
	["Toggle the module on and off."] = "切换此模块的打开与关闭。",
} end)

L:RegisterTranslations("koKR", function() return {
    ["StickyChannels"] = "채널 고정",
    ["Chat channel sticky options."] = "대화 채널 고정 설정입니다.",
    ["ChatType"] = "대화 종류",
    ["Per chat type options."] = "대화종류에 따른 설정입니다.",
    ["Say"] = "일반",
    ["Whisper"] = "귓속말",
    ["Yell"] = "외치기",
    ["Party"] = "파티",
    ["Guild"] = "길드",
    ["Officer"] = "오피서",
    ["Raid"] = "공격대",
    ["RaidWarning"] = "공대 경보",
    ["Battleground"] = "전장",
    ["Channel"] = "채널",
    ["Emote"] = "감정표현",
    ["%sSticky"] = "%s 고정",
    ["Toggles sticky on and off for %s."] = "%s에 대한 고정 켜고 끄기를 전환합니다.",
    ["Toggle"] = "전환",
    ["Toggle the module on and off."] = "모듈 켜고 끄기를 전환합니다.",
} end)

Prat_StickyChannels = Prat:NewModule("stickychannels")

function Prat_StickyChannels:OnInitialize()
    self.db = Prat:AcquireDBNamespace("StickyChannels")
    Prat:RegisterDefaults("StickyChannels", "profile", {
        on = true,
        say = true,
        whisper = true,
        yell = true,
        party = true,
        guild = true,
        officer = true,
        raid = true,
        raid_warning = true,
        battleground = true,
        channel = true,
        emote = true,
    })
    Prat.Options.args.stickychannels = {
        name = L["StickyChannels"],
        desc = L["Chat channel sticky options."],
        type = "group",
        args = {
            chattype = {
                name = L["ChatType"],
                desc = L["Per chat type options."],
                type = "group",
                args = {
                    say = {
                        name = string.format(L["%sSticky"], L["Say"]),
                        desc = string.format(L["Toggles sticky on and off for %s."], L["Say"]),
                        type = "toggle",
                        order = 101,
                        get = function() return self.db.profile.say end,
                        set = function(v)
                            self.db.profile.say = v
                            self:Stickum("SAY",v)
                        end
                    },
                    whisper = {
                        name = string.format(L["%sSticky"], L["Whisper"]),
                        desc = string.format(L["Toggles sticky on and off for %s."], L["Whisper"]),
                        type = "toggle",
                        order = 102,
                        get = function() return self.db.profile.whisper end,
                        set = function(v)
                            self.db.profile.whisper = v
                            self:Stickum("WHISPER",v)
                        end
                    },
                    yell = {
                        name = string.format(L["%sSticky"], L["Yell"]),
                        desc = string.format(L["Toggles sticky on and off for %s."], L["Yell"]),
                        type = "toggle",
                        order = 103,
                        get = function() return self.db.profile.yell end,
                        set = function(v)
                            self.db.profile.yell = v
                            self:Stickum("YELL",v)
                        end
                    },
                    party = {
                        name = string.format(L["%sSticky"], L["Party"]),
                        desc = string.format(L["Toggles sticky on and off for %s."], L["Party"]),
                        type = "toggle",
                        order = 104,
                        get = function() return self.db.profile.party end,
                        set = function(v)
                            self.db.profile.party = v
                            self:Stickum("PARTY",v)
                        end
                    },
                    guild = {
                        name = string.format(L["%sSticky"], L["Guild"]),
                        desc = string.format(L["Toggles sticky on and off for %s."], L["Guild"]),
                        type = "toggle",
                        order = 105,
                        get = function() return self.db.profile.guild end,
                        set = function(v)
                            self.db.profile.guild = v
                            self:Stickum("GUILD",v)
                        end
                    },
                    officer = {
                        name = string.format(L["%sSticky"], L["Officer"]),
                        desc = string.format(L["Toggles sticky on and off for %s."], L["Officer"]),
                        type = "toggle",
                        order = 106,
                        get = function() return self.db.profile.officer end,
                        set = function(v)
                            self.db.profile.officer = v
                            self:Stickum("OFFICER",v)
                        end
                    },
                    raid = {
                        name = string.format(L["%sSticky"], L["Raid"]),
                        desc = string.format(L["Toggles sticky on and off for %s."], L["Raid"]),
                        type = "toggle",
                        order = 107,
                        get = function() return self.db.profile.raid end,
                        set = function(v)
                            self.db.profile.raid = v
                            self:Stickum("RAID",v)
                        end
                    },
                    raidwarning = {
                        name = string.format(L["%sSticky"], L["RaidWarning"]),
                        desc = string.format(L["Toggles sticky on and off for %s."], L["RaidWarning"]),
                        type = "toggle",
                        order = 108,
                        get = function() return self.db.profile.raid_warning end,
                        set = function(v)
                            self.db.profile.raid_warning = v
                            self:Stickum("RAID_WARNING",v)
                        end
                    },
                    battleground = {
                        name = string.format(L["%sSticky"], L["Battleground"]),
                        desc = string.format(L["Toggles sticky on and off for %s."], L["Battleground"]),
                        type = "toggle",
                        order = 109,
                        get = function() return self.db.profile.battleground end,
                        set = function(v)
                            self.db.profile.battleground = v
                            self:Stickum("BATTLEGROUND",v)
                        end
                    },
                    channel = {
                        name = string.format(L["%sSticky"], L["Channel"]),
                        desc = string.format(L["Toggles sticky on and off for %s."], L["Channel"]),
                        type = "toggle",
                        order = 110,
                        get = function() return self.db.profile.channel end,
                        set = function(v)
                            self.db.profile.channel = v
                            self:Stickum("CHANNEL",v)
                        end
                    },
                    emote = {
                        name = string.format(L["%sSticky"], L["Emote"]),
                        desc = string.format(L["Toggles sticky on and off for %s."], L["Emote"]),
                        type = "toggle",
                        order = 111,
                        get = function() return self.db.profile.emote end,
                        set = function(v)
                            self.db.profile.emote = v
                            self:Stickum("EMOTE",v)
                        end
                    }
                }
            },
            toggle = {
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                type = "toggle",
                order = 200,
                get = function() return self.db.profile.on end,
                set = function() self.db.profile.on = Prat:ToggleModuleActive("stickychannels") end
            }
        }
    }
end

function Prat_StickyChannels:OnEnable()
    self:Stickum("SAY",self.db.profile.say)
    self:Stickum("WHISPER",self.db.profile.whisper)
    self:Stickum("YELL",self.db.profile.yell)
    self:Stickum("PARTY",self.db.profile.party)
    self:Stickum("GUILD",self.db.profile.guild)
    self:Stickum("OFFICER",self.db.profile.officer)
    self:Stickum("RAID",self.db.profile.raid)
    self:Stickum("RAID_WARNING",self.db.profile.raid_warning)
    self:Stickum("BATTLEGROUND",self.db.profile.battleground)
    self:Stickum("CHANNEL",self.db.profile.channel)
    self:Stickum("EMOTE",self.db.profile.emote)
end

function Prat_StickyChannels:OnDisable()
    self:Stickum("SAY",false)
    self:Stickum("WHISPER",false)
    self:Stickum("YELL",false)
    self:Stickum("PARTY",false)
    self:Stickum("GUILD",false)
    self:Stickum("OFFICER",false)
    self:Stickum("RAID",false)
    self:Stickum("RAID_WARNING",false)
    self:Stickum("BATTLEGROUND",false)
    self:Stickum("CHANNEL",false)
    self:Stickum("EMOTE",false)
end

function Prat_StickyChannels:Stickum(channel,stickied)
    if stickied then
        ChatTypeInfo[channel].sticky = 1
    else
        ChatTypeInfo[channel].sticky = 0
    end
end
