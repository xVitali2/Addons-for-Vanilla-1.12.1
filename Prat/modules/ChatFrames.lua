--[[
Name: Prat_ChatFrames
Revision: $Revision: 16019 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#ChatFrames
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that adds options for chat window manipulation.
Dependencies: Prat
]]

local L = AceLibrary("AceLocale-2.2"):new("PratChatFrames")

L:RegisterTranslations("enUS", function() return {
    ["ChatFrames"] = true,
    ["ChatFrame manipulation options."] = true,
    ["Toggle"] = true,
    ["Toggle the module on and off."] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["ChatFrames"] = "ChatFrames",
    ["ChatFrame manipulation options."] = "Опции манипуляций с фреймом чата.",
    ["Toggle"] = "Вкл/Выкл",
    ["Toggle the module on and off."] = "Вкл/Выкл модуль",
} end)

L:RegisterTranslations("zhCN", function() return {
		["ChatFrames"] = "聊天框架",
		["ChatFrame manipulation options."] = "聊天框架设置选项。",
		["Toggle"] = "切换",
		["Toggle the module on and off."] = "切换此模块的打开与关闭。",
} end)

L:RegisterTranslations("koKR", function() return {
    ["ChatFrames"] = "대화창",
    ["ChatFrame manipulation options."] = "대화창 조절 설정입니다.",
    ["Toggle"] = "전환",
    ["Toggle the module on and off."] = "모듈 켜고 끄기를 전환합니다.",
} end)

Prat_ChatFrames = Prat:NewModule("chatframes")

function Prat_ChatFrames:OnInitialize()
    self.db = Prat:AcquireDBNamespace("ChatFrames")
    Prat:RegisterDefaults("ChatFrames", "profile", {
        on = true,
    })
    Prat.Options.args.chatframes = {
        name = L["ChatFrames"],
        desc = L["ChatFrame manipulation options."],
        type = "group",
        args = {
            toggle = {
                type = "toggle",
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                order = 200,
                get = function() return self.db.profile.on end,
                set = function(v) self.db.profile.on = Prat:ToggleModuleActive("chatframes") end
            },
        }
    }
end

function Prat_ChatFrames:OnEnable()
end
