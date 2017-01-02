--[[
Name: Prat_ChannelNames
Revision: $Revision: 16019 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Inspired by: idChat2_ChannelNames by Industrial
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#ChannelNames
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that adds options and keybindings for all chat channels.
Dependencies: Prat
]]

local L = AceLibrary("AceLocale-2.2"):new("PratChannelNames")

L:RegisterTranslations("enUS", function() return {
    ["ChannelNames"] = true,
    ["Channel name abbreviation options."] = true,
    ["Replace"] = true,
    ["Toggle replacing this channel."] = true,
    ["Off"] = true,
    ["Turn off this channel."] = true,
    ["Set"] = true,
    ["Channel %d"] = true,
    ["Say"] = true,
    ["Whisper"] = true,
	["Incoming Whisper"] = true,
    ["Yell"] = true,
    ["Guild"] = true,
    ["Party"] = true,
    ["Raid"] = true,
    ["Raid Leader"] = true,
    ["Raid Warning"] = true,
    ["Officer"] = true,
    ["Battleground"] = true,
    ["Battleground Leader"] = true,
    ["%s settings."] = true,
    ["Use a custom replacement for the chat %s text."] = true,
    ["Show Space"] = true,
    ["Toggle adding space after channel replacement."] = true,
    ["Show Colon"] = true,
    ["Toggle adding colon after channel replacement."] = true,
    ["Toggle"] = true,
    ["Toggle the module on and off."] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["ChannelNames"] = "ChannelNames",
    ["Channel name abbreviation options."] = "Настройки сокращения названий каналов.",
    ["Replace"] = "Заменить",
    ["Toggle replacing this channel."] = "Включить замену данного канала.",
    ["Off"] = "Выкл",
    ["Turn off this channel."] = "Выключить этот канал.",
    ["Set"] = "Задать",
    ["Channel %d"] = "Канал %d",
    ["Say"] = "Сказать",
    ["Whisper"] = "Шепот",
	["Incoming Whisper"] = "Шепот",
    ["Yell"] = "Крикнуть",
    ["Guild"] = "Гильдия",
    ["Party"] = "Группа",
    ["Raid"] = "Рейд",
    ["Raid Leader"] = "Лидер рейда",
    ["Raid Warning"] = "Объявление рейду",
    ["Officer"] = "Офицер",
    ["Battleground"] = "Поле боя",
    ["Battleground Leader"] = "Лидер поля боя",
    ["%s settings."] = "Настройки канала \"%s\".",
    ["Use a custom replacement for the chat %s text."] = "Использовать заданную замену текста %s канала.",
    ["Show Space"] = "Показывать пробел",
    ["Toggle adding space after channel replacement."] = "Вкл/Выкл добавление пробела после замены канала.",
    ["Show Colon"] = "Показывать двоеточие",
    ["Toggle adding colon after channel replacement."] = "Вкл/Выкл добавление двоеточия после замены канала.",
    ["Toggle"] = "Вкл/Выкл",
    ["Toggle the module on and off."] = "Вкл/Выкл модуль",
} end)

L:RegisterTranslations("zhCN", function() return {
	["ChannelNames"] = "频道名称",
	["Channel name abbreviation options."] = "频道名称缩写选项。",
	["Replace"] = "替换",
	["Toggle replacing this channel."] = "替换频道。",
	["Off"] = "关闭",
	["Turn off this channel."] = "关闭此频道。",
	["Set"] = "设置",
	["Channel %d"] = "频道 %d",
	["Say"] = "说",
	["Whisper"] = "密语",
	["Incoming Whisper"] = "密语回复",
	["Yell"] = "喊",
	["Guild"] = "公会",
	["Party"] = "队伍",
	["Raid"] = "团队",
	["Raid Leader"] = "团队领袖",
	["Raid Warning"] = "团队报警",
	["Officer"] = "官员",
	["Battleground"] = "战场",
	["Battleground Leader"] = "战场领袖",
	["%s settings."] = "%s 设置。",
	["Use a custom replacement for the chat %s text."] = "自定义替换此聊天 %s 文本。",
	["Show Space"] = "显示间隔",
	["Toggle adding space after channel replacement."] = "切换频道替换后增加间隔空间。",
	["Show Colon"] = "显示冒号",
	["Toggle adding colon after channel replacement."] = "切换频道替换后增加冒号。",
	["Toggle"] = "切换",
	["Toggle the module on and off."] = "切换此模块的打开与关闭。",
} end)

L:RegisterTranslations("koKR", function() return {
    ["ChannelNames"] = "채널명",
    ["Channel name abbreviation options."] = "채널명 생략 설정입니다.",
    ["Replace"] = "대체",
    ["Toggle replacing this channel."] = "해당 채널 대체를 전환합니다.",
    ["Off"] = "끔",
    ["Turn off this channel."] = "해당 채널를 끕니다.",
    ["Set"] = "설정",
    ["Channel %d"] = "채널 %d",
    ["Say"] = "일반",
    ["Whisper"] = "귓속말",
    ["Incoming Whisper"] = "보낸 귓속말",
    ["Yell"] = "외침",
    ["Guild"] = "길드",
    ["Party"] = "파티",
    ["Raid"] = "공격대",
    ["Raid Leader"] = "공격대장",
    ["Raid Warning"] = "공격대 경보",
    ["Officer"] = "오피서",
    ["Battleground"] = "전장",
    ["Battleground Leader"] = "전투대장",
    ["%s settings."] = "%s 설정입니다.",
    ["Use a custom replacement for the chat %s text."] = "%s 대화에 사용자 대체를 사용합니다.",
    ["Show Space"] = "간격 표시",
    ["Toggle adding space after channel replacement."] = "채널 대체후 간격 추가를 전환합니다.",
    ["Show Colon"] = "콜론 표시",
    ["Toggle adding colon after channel replacement."] = "채널 대채 후 콜론 추가를 전환합니다.",
    ["Toggle"] = "전환",
    ["Toggle the module on and off."] = "모듈 켜고 끄기를 전환합니다.",
} end)

local chanSave = {}

Prat_ChannelNames = Prat:NewModule("channelnames")

function Prat_ChannelNames:OnInitialize()
    self.db = Prat:AcquireDBNamespace("ChannelNames")
    Prat:RegisterDefaults("ChannelNames", "profile", {
        on = true,
        space = true,
		colon = true,
        replace = {
            say = true,
            whisper = true,
            whisperincome = true,
            yell = true,
            party = true,
            guild = true,
            officer = true,
            raid = true,
            raidleader = true,
            raidwarning = true,
            battleground = true,
            battlegroundleader = true,
            channel1 = true,
            channel2 = true,
            channel3 = true,
            channel4 = true,
            channel5 = true,
            channel6 = true,
            channel7 = true,
            channel8 = true,
            channel9 = true,
            channel10 = true,
        },
        shortnames = {
            say = "[S]",
            whisper = "[W To]",
            whisperincome = "[W From]",
            yell = "[Y]",
            party = "[P]",
            guild = "[G]",
            officer = "[O]",
            raid = "[R]",
            raidleader = "[RL]",
            raidwarning = "[RW]",
            battleground = "[B]",
            battlegroundleader = "[BL]",
            channel1 = "[1]",
            channel2 = "[2]",
            channel3 = "[3]",
            channel4 = "[4]",
            channel5 = "[5]",
            channel6 = "[6]",
            channel7 = "[7]",
            channel8 = "[8]",
            channel9 = "[9]",
            channel10 = "[10]",
        }
    })
    Prat.Options.args.channelnames = {
        name = L["ChannelNames"],
        desc = L["Channel name abbreviation options."],
        type = "group",
        args = {
             say = {
                 name = L["Say"],
                 desc = string.format(L["%s settings."], L["Say"]),
                 type = "group",
                 order = 80,
                 args = {
                     set = {
                         name = L["Say"],
                         desc = string.format(L["Use a custom replacement for the chat %s text."], L["Say"]),
                         type = "text",
                         usage = "<string>",
                         get = function() return self.db.profile.shortnames.say end,
                         set = function(v) self.db.profile.shortnames.say = v end
                     },
                     replace = {
                         name = L["Replace"],
                         desc = L["Toggle replacing this channel."],
                         type = "toggle",
                         order = 175,
                         get = function() return self.db.profile.replace.say end,
                         set = function(v) self.db.profile.replace.say = v end,
                     },
                     off = {
                         name = L["Off"],
                         desc = L["Turn off this channel."],
                         type = "execute",
                         order = 200,
                         func = function() self.db.profile.shortnames.say = "" Prat:Print("Say text now turned off") end
                     }
                 }
             },
             whisper = {
                 name = L["Whisper"],
                 desc = string.format(L["%s settings."], L["Whisper"]),
                 type = "group",
				 order = 90,
                 args = {
                     set = {
                         name = L["Whisper"],
                         desc = string.format(L["Use a custom replacement for the chat %s text."], L["Whisper"]),
                         type = "text",
                         usage = "<string>",
                         get = function() return self.db.profile.shortnames.whisper end,
                         set = function(v) self.db.profile.shortnames.whisper = v end
                     },
                     replace = {
                         name = L["Replace"],
                         desc = L["Toggle replacing this channel."],
                         type = "toggle",
                         order = 175,
                         get = function() return self.db.profile.replace.whisper end,
                         set = function(v) self.db.profile.replace.whisper = v end,
                     },
                     off = {
                         name = L["Off"],
                         desc = L["Turn off this channel."],
                         type = "execute",
                         order = 200,
                         func = function() self.db.profile.shortnames.whisper = "" Prat:Print("Whisper text now turned off") end
                     }
                 }
             },
             whisperincome = {
                 name = L["Incoming Whisper"],
                 desc = string.format(L["%s settings."], L["Incoming Whisper"]),
                 type = "group",
				 order = 100,
                 args = {
                     set = {
                         name = L["Incoming Whisper"],
                         desc = string.format(L["Use a custom replacement for the chat %s text."], L["Incoming Whisper"]),
                         type = "text",
                         usage = "<string>",
                         get = function() return self.db.profile.shortnames.whisperincome end,
                         set = function(v) self.db.profile.shortnames.whisperincome = v end
                     },
                     replace = {
                         name = L["Replace"],
                         desc = L["Toggle replacing this channel."],
                         type = "toggle",
                         order = 175,
                         get = function() return self.db.profile.replace.whisperincome end,
                         set = function(v) self.db.profile.replace.whisperincome = v end,
                     },
                     off = {
                         name = L["Off"],
                         desc = L["Turn off this channel."],
                         type = "execute",
                         order = 200,
                         func = function() self.db.profile.shortnames.whisperincome = "" Prat:Print("Whisper text now turned off") end
                     }
                 }
             },
             yell = {
                 name = L["Yell"],
                 desc = string.format(L["%s settings."], L["Yell"]),
                 type = "group",
                 order = 110,
                 args = {
                     set = {
                         name = L["Yell"],
                         desc = string.format(L["Use a custom replacement for the chat %s text."], L["Yell"]),
                         type = "text",
                         usage = "<string>",
                         get = function() return self.db.profile.shortnames.yell end,
                         set = function(v) self.db.profile.shortnames.yell = v end
                     },
                     replace = {
                         name = L["Replace"],
                         desc = L["Toggle replacing this channel."],
                         type = "toggle",
                         order = 175,
                         get = function() return self.db.profile.replace.yell end,
                         set = function(v) self.db.profile.replace.yell = v end,
                     },
                     off = {
                         name = L["Off"],
                         desc = L["Turn off this channel."],
                         type = "execute",
                         order = 200,
                         func = function() self.db.profile.shortnames.yell = "" Prat:Print("Yell text now turned off") end
                     }
                 }
            },
            guild = {
                name = L["Guild"],
                desc = string.format(L["%s settings."], L["Guild"]),
                type = "group",
                order = 120,
                args = {
                    set = {
                        name = L["Guild"],
                        desc = string.format(L["Use a custom replacement for the chat %s text."], L["Guild"]),
                        type = "text",
                        usage = "<string>",
                        get = function() return self.db.profile.shortnames.guild end,
                        set = function(v) self.db.profile.shortnames.guild = v end
                    },
                    replace = {
                        name = L["Replace"],
                        desc = L["Toggle replacing this channel."],
                        type = "toggle",
                        order = 175,
                        get = function() return self.db.profile.replace.guild end,
                        set = function(v) self.db.profile.replace.guild = v end,
                    },
                    off = {
                        name = L["Off"],
                        desc = L["Turn off this channel."],
                        type = "execute",
                        order = 200,
                        func = function() self.db.profile.shortnames.guild = "" Prat:Print("Guild text now turned off") end
                    }
                }
            },
            party = {
                name = L["Party"],
                desc = string.format(L["%s settings."], L["Party"]),
                type = "group",
                order = 130,
                args = {
                    set = {
                        name = L["Party"],
                        desc = string.format(L["Use a custom replacement for the chat %s text."], L["Party"]),
                        type = "text",
                        usage = "<string>",
                        get = function() return self.db.profile.shortnames.party end,
                        set = function(v) self.db.profile.shortnames.party = v end
                    },
                    replace = {
                        name = L["Replace"],
                        desc = L["Toggle replacing this channel."],
                        type = "toggle",
                        order = 175,
                        get = function() return self.db.profile.replace.party end,
                        set = function(v) self.db.profile.replace.party = v end,
                    },
                    off = {
                        name = L["Off"],
                        desc = L["Turn off this channel."],
                        type = "execute",
                        order = 200,
                        func = function() self.db.profile.shortnames.party = "" Prat:Print("Party text now turned off") end
                    }
                }
            },
            raid = {
                name = L["Raid"],
                desc = string.format(L["%s settings."], L["Raid"]),
                type = "group",
                order = 140,
                args = {
                    set = {
                        name = L["Raid"],
                        desc = string.format(L["Use a custom replacement for the chat %s text."], L["Raid"]),
                        type = "text",
                        usage = "<string>",
                        get = function() return self.db.profile.shortnames.raid end,
                        set = function(v) self.db.profile.shortnames.raid = v end
                    },
                    replace = {
                        name = L["Replace"],
                        desc = L["Toggle replacing this channel."],
                        type = "toggle",
                        order = 175,
                        get = function() return self.db.profile.replace.raid end,
                        set = function(v) self.db.profile.replace.raid = v end,
                    },
                    off = {
                        name = L["Off"],
                        desc = L["Turn off this channel."],
                        type = "execute",
                        order = 200,
                        func = function() self.db.profile.shortnames.raid = "" Prat:Print("Raid text now turned off") end
                    }
                }
            },
            raidleader = {
                name = L["Raid Leader"],
                desc = string.format(L["%s settings."], L["Raid Leader"]),
                type = "group",
                order = 150,
                args = {
                    set = {
                        name = L["Raid Leader"],
                        desc = string.format(L["Use a custom replacement for the chat %s text."], L["Raid Leader"]),
                        type = "text",
                        usage = "<string>",
                        get = function() return self.db.profile.shortnames.raidleader end,
                        set = function(v) self.db.profile.shortnames.raidleader = v end
                    },
                    replace = {
                        name = L["Replace"],
                        desc = L["Toggle replacing this channel."],
                        type = "toggle",
                        order = 175,
                        get = function() return self.db.profile.replace.raidleader end,
                        set = function(v) self.db.profile.replace.raidleader = v end,
                    },
                    off = {
                        name = L["Off"],
                        desc = L["Turn off this channel."],
                        type = "execute",
                        order = 200,
                        func = function() self.db.profile.shortnames.raidleader = "" Prat:Print("Raid Leader text now turned off") end
                    }
                }
            },
            raidwarning = {
                name = L["Raid Warning"],
                desc = string.format(L["%s settings."], L["Raid Warning"]),
                type = "group",
                order = 160,
                args = {
                    set = {
                        name = L["Raid Warning"],
                        desc = string.format(L["Use a custom replacement for the chat %s text."], L["Raid Warning"]),
                        type = "text",
                        usage = "<string>",
                        get = function() return self.db.profile.shortnames.raidwarning end,
                        set = function(v) self.db.profile.shortnames.raidwarning = v end
                    },
                    replace = {
                        name = L["Replace"],
                        desc = L["Toggle replacing this channel."],
                        type = "toggle",
                        order = 175,
                        get = function() return self.db.profile.replace.raidwarning end,
                        set = function(v) self.db.profile.replace.raidwarning = v end,
                    },
                    off = {
                        name = L["Off"],
                        desc = L["Turn off this channel."],
                        type = "execute",
                        order = 200,
                        func = function() self.db.profile.shortnames.raidwarning = "" Prat:Print("Raid Warning text now turned off") end
                    }
                }
            },
            officer = {
                name = L["Officer"],
                desc = string.format(L["%s settings."], L["Officer"]),
                type = "group",
                order = 170,
                args = {
                    set = {
                        name = L["Officer"],
                        desc = string.format(L["Use a custom replacement for the chat %s text."], L["Officer"]),
                        type = "text",
                        usage = "<string>",
                        get = function() return self.db.profile.shortnames.officer end,
                        set = function(v) self.db.profile.shortnames.officer = v end
                    },
                    replace = {
                        name = L["Replace"],
                        desc = L["Toggle replacing this channel."],
                        type = "toggle",
                        order = 175,
                        get = function() return self.db.profile.replace.officer end,
                        set = function(v) self.db.profile.replace.officer = v end,
                    },
                    off = {
                        name = L["Off"],
                        desc = L["Turn off this channel."],
                        type = "execute",
                        order = 200,
                        func = function() self.db.profile.shortnames.officer = "" Prat:Print("Officer text now turned off") end
                    }
                }
            },
            battleground = {
                name = L["Battleground"],
                desc = string.format(L["%s settings."], L["Battleground"]),
                type = "group",
                order = 180,
                args = {
                    set = {
                        name = L["Battleground"],
                        desc = string.format(L["Use a custom replacement for the chat %s text."], L["Battleground"]),
                        type = "text",
                        usage = "<string>",
                        get = function() return self.db.profile.shortnames.battleground end,
                        set = function(v) self.db.profile.shortnames.battleground = v end
                    },
                    replace = {
                        name = L["Replace"],
                        desc = L["Toggle replacing this channel."],
                        type = "toggle",
                        order = 175,
                        get = function() return self.db.profile.replace.battleground end,
                        set = function(v) self.db.profile.replace.battleground = v end,
                    },
                    off = {
                        name = L["Off"],
                        desc = L["Turn off this channel."],
                        type = "execute",
                        order = 200,
                        func = function() self.db.profile.shortnames.battleground = "" Prat:Print("Battleground text now turned off") end
                    }
                }
            },
            battlegroundleader = {
                name = L["Battleground Leader"],
                desc = string.format(L["%s settings."], L["Battleground Leader"]),
                type = "group",
                order = 190,
                args = {
                    set = {
                        name = L["Battleground Leader"],
                        desc = string.format(L["Use a custom replacement for the chat %s text."], L["Battleground Leader"]),
                        type = "text",
                        usage = "<string>",
                        get = function() return self.db.profile.shortnames.battlegroundleader end,
                        set = function(v) self.db.profile.shortnames.battlegroundleader = v end
                    },
                    replace = {
                        name = L["Replace"],
                        desc = L["Toggle replacing this channel."],
                        type = "toggle",
                        order = 175,
                        get = function() return self.db.profile.replace.battlegroundleader end,
                        set = function(v) self.db.profile.replace.battlegroundleader = v end,
                    },
                    off = {
                        name = L["Off"],
                        desc = L["Turn off this channel."],
                        type = "execute",
                        order = 200,
                        func = function() self.db.profile.shortnames.battlegroundleader = "" Prat:Print("Battleground Leader text now turned off") end
                    }
                }
            },
            channel1 = {
                name = string.format(L["Channel %d"], 1),
                desc = string.format(L["%s settings."],string.format(L["Channel %d"], 1)),
                type = "group",
                order = 201,
                args = {
                    set = {
                        name = string.format(L["Channel %d"], 1),
                        desc = string.format(L["Use a custom replacement for the chat %s text."], string.format(L["Channel %d"], 1)),
                        type = "text",
                        usage = "<string>",
                        get = function() return self.db.profile.shortnames.channel1 end,
                        set = function(v) self.db.profile.shortnames.channel1 = v end
                    },
                    replace = {
                        name = L["Replace"],
                        desc = L["Toggle replacing this channel."],
                        type = "toggle",
                        order = 175,
                        get = function() return self.db.profile.replace.channel1 end,
                        set = function(v) self.db.profile.replace.channel1 = v end,
                    },
                    off = {
                        name = L["Off"],
                        desc = L["Turn off this channel."],
                        type = "execute",
                        order = 200,
                        func = function() self.db.profile.shortnames.channel1 = "" Prat:Print("Channel 1 text now turned off") end
                    }
                }
            },
            channel2 = {
                name = string.format(L["Channel %d"], 2),
                desc = string.format(L["%s settings."],string.format(L["Channel %d"], 2)),
                type = "group",
                order = 202,
                args = {
                    set = {
                        name = string.format(L["Channel %d"], 2),
                        desc = string.format(L["Use a custom replacement for the chat %s text."], string.format(L["Channel %d"], 2)),
                        type = "text",
                        usage = "<string>",
                        get = function() return self.db.profile.shortnames.channel2 end,
                        set = function(v) self.db.profile.shortnames.channel2 = v end
                    },
                    replace = {
                        name = L["Replace"],
                        desc = L["Toggle replacing this channel."],
                        type = "toggle",
                        order = 175,
                        get = function() return self.db.profile.replace.channel2 end,
                        set = function(v) self.db.profile.replace.channel2 = v end,
                    },
                    off = {
                        name = L["Off"],
                        desc = L["Turn off this channel."],
                        type = "execute",
                        order = 200,
                        func = function() self.db.profile.shortnames.channel2 = "" Prat:Print("Channel 2 text now turned off") end
                    }
                }
            },
            channel3 = {
                name = string.format(L["Channel %d"], 3),
                desc = string.format(L["%s settings."],string.format(L["Channel %d"], 3)),
                type = "group",
                order = 203,
                args = {
                    set = {
                        name = string.format(L["Channel %d"], 3),
                        desc = string.format(L["Use a custom replacement for the chat %s text."], string.format(L["Channel %d"], 3)),
                        type = "text",
                        usage = "<string>",
                        get = function() return self.db.profile.shortnames.channel3 end,
                        set = function(v) self.db.profile.shortnames.channel3 = v end
                    },
                    replace = {
                        name = L["Replace"],
                        desc = L["Toggle replacing this channel."],
                        type = "toggle",
                        order = 175,
                        get = function() return self.db.profile.replace.channel3 end,
                        set = function(v) self.db.profile.replace.channel3 = v end,
                    },
                    off = {
                        name = L["Off"],
                        desc = L["Turn off this channel."],
                        type = "execute",
                        order = 200,
                        func = function() self.db.profile.shortnames.channel3 = "" Prat:Print("Channel 3 text now turned off") end
                    }
                }
            },
            channel4 = {
                name = string.format(L["Channel %d"], 4),
                desc = string.format(L["%s settings."],string.format(L["Channel %d"], 4)),
                type = "group",
                order = 204,
                args = {
                    set = {
                        name = string.format(L["Channel %d"], 4),
                        desc = string.format(L["Use a custom replacement for the chat %s text."], string.format(L["Channel %d"], 4)),
                        type = "text",
                        usage = "<string>",
                        get = function() return self.db.profile.shortnames.channel4 end,
                        set = function(v) self.db.profile.shortnames.channel4 = v end
                    },
                    replace = {
                        name = L["Replace"],
                        desc = L["Toggle replacing this channel."],
                        type = "toggle",
                        order = 175,
                        get = function() return self.db.profile.replace.channel4 end,
                        set = function(v) self.db.profile.replace.channel4 = v end,
                    },
                    off = {
                        name = L["Off"],
                        desc = L["Turn off this channel."],
                        type = "execute",
                        order = 200,
                        func = function() self.db.profile.shortnames.channel4 = "" Prat:Print("Channel 4 text now turned off") end
                    }
                }
            },
            channel5 = {
                name = string.format(L["Channel %d"], 5),
                desc = string.format(L["%s settings."],string.format(L["Channel %d"], 5)),
                type = "group",
                order = 205,
                args = {
                    set = {
                        name = string.format(L["Channel %d"], 5),
                        desc = string.format(L["Use a custom replacement for the chat %s text."], string.format(L["Channel %d"], 5)),
                        type = "text",
                        usage = "<string>",
                        get = function() return self.db.profile.shortnames.channel5 end,
                        set = function(v) self.db.profile.shortnames.channel5 = v end
                    },
                    replace = {
                        name = L["Replace"],
                        desc = L["Toggle replacing this channel."],
                        type = "toggle",
                        order = 175,
                        get = function() return self.db.profile.replace.channel5 end,
                        set = function(v) self.db.profile.replace.channel5 = v end,
                    },
                    off = {
                        name = L["Off"],
                        desc = L["Turn off this channel."],
                        type = "execute",
                        order = 200,
                        func = function() self.db.profile.shortnames.channel5 = "" Prat:Print("Channel 5 text now turned off") end
                    }
                }
            },
            channel6 = {
                name = string.format(L["Channel %d"], 6),
                desc = string.format(L["%s settings."],string.format(L["Channel %d"], 6)),
                type = "group",
                order = 206,
                args = {
                    set = {
                        name = string.format(L["Channel %d"], 6),
                        desc = string.format(L["Use a custom replacement for the chat %s text."], string.format(L["Channel %d"], 6)),
                        type = "text",
                        usage = "<string>",
                        get = function() return self.db.profile.shortnames.channel6 end,
                        set = function(v) self.db.profile.shortnames.channel6 = v end
                    },
                    replace = {
                        name = L["Replace"],
                        desc = L["Toggle replacing this channel."],
                        type = "toggle",
                        order = 175,
                        get = function() return self.db.profile.replace.channel6 end,
                        set = function(v) self.db.profile.replace.channel6 = v end,
                    },
                    off = {
                        name = L["Off"],
                        desc = L["Turn off this channel."],
                        type = "execute",
                        order = 200,
                        func = function() self.db.profile.shortnames.channel6 = "" Prat:Print("Channel 6 text now turned off") end
                    }
                }
            },
            channel7 = {
                name = string.format(L["Channel %d"], 7),
                desc = string.format(L["%s settings."],string.format(L["Channel %d"], 7)),
                type = "group",
                order = 207,
                args = {
                    set = {
                        name = string.format(L["Channel %d"], 7),
                        desc = string.format(L["Use a custom replacement for the chat %s text."], string.format(L["Channel %d"], 7)),
                        type = "text",
                        usage = "<string>",
                        get = function() return self.db.profile.shortnames.channel7 end,
                        set = function(v) self.db.profile.shortnames.channel7 = v end
                    },
                    replace = {
                        name = L["Replace"],
                        desc = L["Toggle replacing this channel."],
                        type = "toggle",
                        order = 175,
                        get = function() return self.db.profile.replace.channel7 end,
                        set = function(v) self.db.profile.replace.channel7 = v end,
                    },
                    off = {
                        name = L["Off"],
                        desc = L["Turn off this channel."],
                        type = "execute",
                        order = 200,
                        func = function() self.db.profile.shortnames.channel7 = "" Prat:Print("Channel 7 text now turned off") end
                    }
                }
            },
            channel8 = {
                name = string.format(L["Channel %d"], 8),
                desc = string.format(L["%s settings."],string.format(L["Channel %d"], 8)),
                type = "group",
                order = 208,
                args = {
                    set = {
                        name = string.format(L["Channel %d"], 8),
                        desc = string.format(L["Use a custom replacement for the chat %s text."], string.format(L["Channel %d"], 8)),
                        type = "text",
                        usage = "<string>",
                        get = function() return self.db.profile.shortnames.channel8 end,
                        set = function(v) self.db.profile.shortnames.channel8 = v end
                    },
                    replace = {
                        name = L["Replace"],
                        desc = L["Toggle replacing this channel."],
                        type = "toggle",
                        order = 175,
                        get = function() return self.db.profile.replace.channel8 end,
                        set = function(v) self.db.profile.replace.channel8 = v end,
                    },
                    off = {
                        name = L["Off"],
                        desc = L["Turn off this channel."],
                        type = "execute",
                        order = 200,
                        func = function() self.db.profile.shortnames.channel8 = "" Prat:Print("Channel 8 text now turned off") end
                    }
                }
            },
            channel9 = {
                name = string.format(L["Channel %d"], 9),
                desc = string.format(L["%s settings."],string.format(L["Channel %d"], 9)),
                type = "group",
                order = 209,
                args = {
                    set = {
                        name = string.format(L["Channel %d"], 9),
                        desc = string.format(L["Use a custom replacement for the chat %s text."], string.format(L["Channel %d"], 9)),
                        type = "text",
                        usage = "<string>",
                        get = function() return self.db.profile.shortnames.channel9 end,
                        set = function(v) self.db.profile.shortnames.channel9 = v end
                    },
                    replace = {
                        name = L["Replace"],
                        desc = L["Toggle replacing this channel."],
                        type = "toggle",
                        order = 175,
                        get = function() return self.db.profile.replace.channel9 end,
                        set = function(v) self.db.profile.replace.channel9 = v end,
                    },
                    off = {
                        name = L["Off"],
                        desc = L["Turn off this channel."],
                        type = "execute",
                        order = 200,
                        func = function() self.db.profile.shortnames.channel9 = "" Prat:Print("Channel 9 text now turned off") end
                    }
                }
            },
            channel10 = {
                name = string.format(L["Channel %d"], 10),
                desc = string.format(L["%s settings."],string.format(L["Channel %d"], 10)),
                type = "group",
                order = 210,
                args = {
                    set = {
                        name = string.format(L["Channel %d"], 10),
                        desc = string.format(L["Use a custom replacement for the chat %s text."], string.format(L["Channel %d"], 10)),
                        type = "text",
                        usage = "<string>",
                        get = function() return self.db.profile.shortnames.channel10 end,
                        set = function(v) self.db.profile.shortnames.channel10 = v end
                    },
                    replace = {
                        name = L["Replace"],
                        desc = L["Toggle replacing this channel."],
                        type = "toggle",
                        order = 175,
                        get = function() return self.db.profile.replace.channel10 end,
                        set = function(v) self.db.profile.replace.channel10 = v end,
                    },
                    off = {
                        name = L["Off"],
                        desc = L["Turn off this channel."],
                        type = "execute",
                        order = 200,
                        func = function() self.db.profile.shortnames.channel10 = "" Prat:Print("Channel 10 text now turned off") end
                    }
                }
            },
            spacetoggle = {
                name = L["Show Space"],
                desc = L["Toggle adding space after channel replacement."],
                type = "toggle",
                order = 230,
                get = function() return self.db.profile.space end,
                set = function(v) self.db.profile.space = v end,
            },
            colontoggle = {
                name = L["Show Colon"],
                desc = L["Toggle adding colon after channel replacement."],
                type = "toggle",
                order = 240,
                get = function() return self.db.profile.colon end,
                set = function(v) self.db.profile.colon = v end,
            },
            toggle = {
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                type = "toggle",
                order = 250,
                get = function() return self.db.profile.on end,
                set = function(v) self.db.profile.on = Prat:ToggleModuleActive("channelnames"); end,
            },
        }
    }
end

function Prat_ChannelNames:OnEnable()
    for i=1,NUM_CHAT_WINDOWS do
        self:Hook(getglobal("ChatFrame"..i), "AddMessage")
    end
	self:saveChanName()
    self:doReplacement()
end

function Prat_ChannelNames:saveChanName()
	chanSave["guild"] = CHAT_GUILD_GET
	chanSave["officer"] = CHAT_OFFICER_GET
	chanSave["party"] = CHAT_PARTY_GET
	chanSave["raid"] = CHAT_RAID_GET
	chanSave["raidleader"] = CHAT_RAID_LEADER_GET
	chanSave["raidwarning"] = CHAT_RAID_WARNING_GET
	chanSave["battleground"] = CHAT_BATTLEGROUND_GET
	chanSave["battlegroundleader"] = CHAT_BATTLEGROUND_LEADER_GET
	chanSave["say"] = CHAT_SAY_GET
	chanSave["whisperincome"] = CHAT_WHISPER_GET
	chanSave["whisper"] = CHAT_WHISPER_INFORM_GET
	chanSave["yell"] = CHAT_YELL_GET
end

function Prat_ChannelNames:doReplacement()
	local replace = self.db.profile.replace
	local shortnames = self.db.profile.shortnames
	local space = self.db.profile.space and " " or ""
	local colon = self.db.profile.colon and ":" or ""
	local default = space .. "%s" .. colon .. "\32"

	CHAT_CHANNEL_GET = "%s" .. colon .. "\32";

	CHAT_GUILD_GET = replace["guild"] and (shortnames["guild"] .. default) or chanSave["guild"];
	CHAT_OFFICER_GET = replace["officer"] and (shortnames["officer"] .. default) or chanSave["officer"]

	CHAT_PARTY_GET = replace["party"] and (shortnames["party"] .. default) or chanSave["party"]
	CHAT_RAID_GET = replace["raid"] and (shortnames["raid"] .. default) or chanSave["raid"]
	CHAT_RAID_LEADER_GET = replace["raidleader"] and (shortnames["raidleader"] .. default) or chanSave["raidleader"]
	CHAT_RAID_WARNING_GET = replace["raidwarning"] and (shortnames["raidwarning"] .. default) or chanSave["raidwarning"]
	CHAT_BATTLEGROUND_GET = replace["battleground"] and (shortnames["battleground"] .. default) or chanSave["battleground"]
	CHAT_BATTLEGROUND_LEADER_GET = replace["battlegroundleader"] and (shortnames["battlegroundleader"] .. default) or chanSave["battlegroundleader"]

	CHAT_SAY_GET = replace["say"] and (shortnames["say"] .. default) or chanSave["say"]
	CHAT_WHISPER_GET = replace["whisperincome"] and (shortnames["whisperincome"] .. default) or chanSave["whisperincome"]
	CHAT_WHISPER_INFORM_GET = replace["whisper"] and (shortnames["whisper"] .. default) or chanSave["whisper"]
	CHAT_YELL_GET = replace["yell"] and (shortnames["yell"] .. default) or chanSave["yell"]

--	CHAT_AFK_GET = replace[""] and (shortnames["] .. "%s is Away From Keyboard" .. colon .. "\32";

--	CHAT_CHANNEL_JOIN_GET = replace[""] and (shortnames["] .. "%s joined channel."; -- another player joined
--	CHAT_CHANNEL_LEAVE_GET = replace[""] and (shortnames["] .. "%s left channel."; -- another player left
--	CHAT_CHANNEL_LIST_GET = replace[""] and (shortnames["] .. "[%s]\32"; -- Channel user list, user list is the "message", this is the channel name.

--	CHAT_CHANNEL_SEND = "[%d. %s]" .. colon .. "\32";

--	CHAT_GUILD_SEND = "Guild" .. colon .. "\32"; -- Chat message to your guild
--	CHAT_OFFICER_SEND = "Officer" .. colon .. "\32"; -- Chat message to officers in your guild
--	CHAT_PARTY_SEND = "Party" .. colon .. "\32"; -- Chat message to your party
--	CHAT_RAID_SEND = "Raid" .. colon .. "\32"; -- Chat message to your raid
--	CHAT_RAID_WARNING_SEND = "Raid Warning" .. colon .. "\32";
--	CHAT_BATTLEGROUND_SEND = "Battleground" .. colon .. "\32";

--	CHAT_SAY_SEND = "Say" .. colon .. "\32"; -- Normal chat message
--	CHAT_WHISPER_SEND = "Tell %s" .. colon .. "\32"; -- Whisper to a particular player
--	CHAT_YELL_SEND = "Yell" .. colon .. "\32"; -- Yell a message
end

function Prat_ChannelNames:AddMessage(frame, text, ...)
	self:doReplacement()
    if text then
        local pattern = "%]%s+(.*|Hplayer)"
        local channel = string.gsub(text, ".*%[(.-)" .. pattern ..".+", "%1")
        if string.find(channel, "%d+%. ") then
            channel = string.gsub(channel, "(%d+)%..*", "channel%1")
            pattern = "%[%d+%..-" .. pattern
		end
        if ( self.db.profile.replace[channel] ) then
            local replacement = self.db.profile.shortnames[channel]
            if replacement  then
                if ( (not(replacement == "")) and self.db.profile.space ) then replacement = replacement .. " " end
                text = string.gsub(text, pattern, replacement .. "%1")
            end
        end
    end
    self.hooks[frame].AddMessage(frame, text, unpack(arg))
end
