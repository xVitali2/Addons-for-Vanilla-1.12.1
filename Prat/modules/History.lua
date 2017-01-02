--[[
Name: Prat_History
Revision: $Revision: 16026 $
Author(s): Krtek (krtek4@gmail.com)
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#History
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that adds chat history options.
Dependencies: Prat
]]

local L = AceLibrary("AceLocale-2.2"):new("PratHistory")

L:RegisterTranslations("enUS", function() return {
    ["History"] = true,
    ["Chat history options."] = true,
    ["Set"] = true,
    ["Set number of History lines for each window."] = true,
    ["Chat%dHistory"] = true,
    ["Sets history for chat window %d."] = true,
    ["Toggle"] = true,
    ["Toggle the module on and off."] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["History"] = "History",
    ["Chat history options."] = "Настройки истории чата.",
    ["Set"] = "Установить",
    ["Set number of History lines for each window."] = "Установить количество строк истории для каждого окна.",
    ["Chat%dHistory"] = "ИсторияЧата%d",
    ["Sets history for chat window %d."] = "Установить историю для окна чата %d.",
    ["Toggle"] = "Вкл/Выкл",
    ["Toggle the module on and off."] = "Вкл/Выкл модуль.",
} end)

L:RegisterTranslations("zhCN", function() return {
	["History"] = "历史",
	["Chat history options."] = "聊天历史选项。",
	["Set"] = "设置",
	["Set number of History lines for each window."] = "为每一聊天窗口设置历史记录行数.",
    ["Chat%dHistory"] = "窗口%d历史",
    ["Sets history for chat window %d."] = "设置聊天窗口%d聊天历史记录",
	["Toggle"] = "切换",
	["Toggle the module on and off."] = "切换此模块的打开与关闭。",
} end)

L:RegisterTranslations("koKR", function() return {
    ["History"] = "이력",
    ["Chat history options."] = "대화 이력 설정입니다.",
    ["Set"] = "설정",
    ["Set number of History lines for each window."] = "각 창에 대한 이력 라인수를 설정합니다.",
    ["Chat%dHistory"] = "대화창%d 이력",
    ["Sets history for chat window %d."] = "대화창 %d에 대한 이력을 설정합니다.",
    ["Toggle"] = "전환",
    ["Toggle the module on and off."] = "모듈 켜고 끄기를 전환합니다.",
} end)

Prat_History = Prat:NewModule("history")

function Prat_History:OnInitialize()
    self.db = Prat:AcquireDBNamespace("History")
    Prat:RegisterDefaults("History", "profile", {
        on = true,
        chatlines = {128, 128, 128, 128, 128, 128, 128, 128},
    })
    Prat.Options.args.history = {
        name = L["History"],
        desc = L["Chat history options."],
        type = "group",
        args = {
            set = {
                name = L["Set"],
                desc = L["Set number of History lines for each window."],
                type = "group",
                args = {
                    chat1 = {
                        name = string.format(L["Chat%dHistory"], 1),
                        desc = string.format(L["Sets history for chat window %d."], 1),
                        type = "range",
                        min = 50,
                        max = 500,
                        step = 1,
                        get = function() return self.db.profile.chatlines[1] end,
                        set = function(v) Prat_History:SetHistory(1, v) end,
                    },
                    chat2 = {
                        name = string.format(L["Chat%dHistory"], 2),
                        desc = string.format(L["Sets history for chat window %d."], 2),
                        type = "range",
                        min = 50,
                        max = 500,
                        step = 1,
                        get = function() return self.db.profile.chatlines[2] end,
                        set = function(v) Prat_History:SetHistory(2, v) end,
                    },
                    chat3 = {
                        name = string.format(L["Chat%dHistory"], 3),
                        desc = string.format(L["Sets history for chat window %d."], 3),
                        type = "range",
                        min = 50,
                        max = 500,
                        step = 1,
                        get = function() return self.db.profile.chatlines[3] end,
                        set = function(v) Prat_History:SetHistory(3, v) end,
                    },
                    chat4 = {
                        name = string.format(L["Chat%dHistory"], 4),
                        desc = string.format(L["Sets history for chat window %d."], 4),
                        type = "range",
                        min = 50,
                        max = 500,
                        step = 1,
                        get = function() return self.db.profile.chatlines[4] end,
                        set = function(v) Prat_History:SetHistory(4, v) end,
                    },
                    chat5 = {
                        name = string.format(L["Chat%dHistory"], 5),
                        desc = string.format(L["Sets history for chat window %d."], 5),
                        type = "range",
                        min = 50,
                        max = 500,
                        step = 1,
                        get = function() return self.db.profile.chatlines[5] end,
                        set = function(v) Prat_History:SetHistory(5, v) end,
                    },
                    chat6 = {
                        name = string.format(L["Chat%dHistory"], 6),
                        desc = string.format(L["Sets history for chat window %d."], 6),
                        type = "range",
                        min = 50,
                        max = 500,
                        step = 1,
                        get = function() return self.db.profile.chatlines[6] end,
                        set = function(v) Prat_History:SetHistory(6, v) end,
                    },
                    chat7 = {
                        name = string.format(L["Chat%dHistory"],7),
                        desc = string.format(L["Sets history for chat window %d."], 7),
                        type = "range",
                        min = 50,
                        max = 500,
                        step = 1,
                        get = function() return self.db.profile.chatlines[7] end,
                        set = function(v) Prat_History:SetHistory(7, v) end,
                    },
                }
            },
            toggle = {
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                type = "toggle",
                order = 200,
                get = function() return self.db.profile.on end,
                set = function(v) self.db.profile.on = Prat:ToggleModuleActive("history") end
            }
        }
    }
end

function Prat_History:OnEnable()
    for i=1,NUM_CHAT_WINDOWS do
        self:SetHistory(i,self.db.profile.chatlines[i])
    end
end

function Prat_History:OnDisable()
    for i=1,NUM_CHAT_WINDOWS do
        self:SetHistory(i,128)
    end
end

function Prat_History:SetHistory(id, lines)
    if lines ~= self.db.profile.chatlines[id] then 
    	getglobal("ChatFrame"..id):SetMaxLines(lines)
		self.db.profile.chatlines[id] = lines
	end
end
