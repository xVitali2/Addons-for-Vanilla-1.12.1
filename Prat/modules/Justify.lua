--[[
Name: Prat_Justify
Revision: $Revision: 16019 $
Author(s): Curney (asml8ed@gmail.com)
Thanks to: Wubin for helping me understand variables better
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Justify
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that sets the justification for chat windows (default=Left).
Dependencies: Prat
]]

local L = AceLibrary("AceLocale-2.2"):new("PratJustify")

L:RegisterTranslations("enUS", function() return {
    ["Justify"] = true,
    ["Chat window justification options."] = true,
    ["Set"] = true,
    ["Set justify for each window."] = true,
    ["Chat%dJustify"] = true,
    ["Sets justification for chat window %d."] = true,
    ["Toggle"] = true,
    ["Toggle the module on and off."] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["Justify"] = "Justify",
    ["Chat window justification options."] = "Опции выравнивания окна чата.",
    ["Set"] = "Установить",
    ["Set justify for each window."] = "Установить выравнивание для каждого окна.",
    ["Chat%dJustify"] = "ВыравниваниеЧата%d",
    ["Sets justification for chat window %d."] = "Установлено выравнивание окна чата %d.",
    ["Toggle"] = "Вкл/Выкл",
    ["Toggle the module on and off."] = "Вкл/Выкл модуль.",
} end)

L:RegisterTranslations("zhCN", function() return {
	["Justify"] = "对齐",
	["Chat window justification options."] = "聊天窗口对齐模式.",
	["Set"] = "设置",
	["Set justify for each window."] = "为每一个聊天窗口设置对齐模式.",
	["Chat%dJustify"] = "窗口%d对齐",
	["Sets justification for chat window %d."] = "设置聊天窗口%d对齐模式.",
	["Toggle"] = "切换",
	["Toggle the module on and off."] = "切换此模块的打开与关闭。",
} end)

L:RegisterTranslations("koKR", function() return {
    ["Justify"] = "정렬",
    ["Chat window justification options."] = "대화창 정렬 설정",
    ["Set"] = "설정",
    ["Set justify for each window."] = "각 창에 대한 정렬 설정",
    ["Chat%dJustify"] = "대화창%d 정렬",
    ["Sets justification for chat window %d."] = "대화창 %d에 대한 정렬을 설정합니다.",
    ["Toggle"] = "전환",
    ["Toggle the module on and off."] = "모듈 켜고 끄기 전환",
} end)

Prat_Justify = Prat:NewModule("justify")

function Prat_Justify:OnInitialize()
    self.db = Prat:AcquireDBNamespace("Justify")
    Prat:RegisterDefaults("Justify", "profile", {
        on = true,
        justification = {"LEFT", "LEFT", "LEFT", "LEFT", "LEFT", "LEFT", "LEFT"}
    })
    Prat.Options.args.justify = {
        name = L["Justify"],
        desc = L["Chat window justification options."],
        type = "group",
        args = {
            set = {
                name = L["Set"],
                desc = L["Set justify for each window."],
                type = "group",
                order = 150,
                args = {
                    chat1 = {
                        name = string.format(L["Chat%dJustify"], 1),
                        desc = string.format(L["Sets justification for chat window %d."], 1),
                        type = "text",
                        get = function() return self.db.profile.justification[1] end,
                        set = function(v) self.db.profile.justification[1] = v; self:SetJustify(1,v) end,
                        validate = {["LEFT"] = "Left", ["RIGHT"] = "Right", ["CENTER"] = "Center"}
                    },
                    chat2 = {
                        name = string.format(L["Chat%dJustify"], 2),
                        desc = string.format(L["Sets justification for chat window %d."], 2),
                        type = "text",
                        get = function() return self.db.profile.justification[2] end,
                        set = function(v) self.db.profile.justification[2] = v; self:SetJustify(2,v) end,
                        validate = {["LEFT"] = "Left", ["RIGHT"] = "Right", ["CENTER"] = "Center"}
                    },
                    chat3 = {
                        name = string.format(L["Chat%dJustify"], 3),
                        desc = string.format(L["Sets justification for chat window %d."], 3),
                        type = "text",
                        get = function() return self.db.profile.justification[3] end,
                        set = function(v) self.db.profile.justification[3] = v; self:SetJustify(3,v) end,
                        validate = {["LEFT"] = "Left", ["RIGHT"] = "Right", ["CENTER"] = "Center"}
                    },
                    chat4 = {
                        name = string.format(L["Chat%dJustify"], 4),
                        desc = string.format(L["Sets justification for chat window %d."], 4),
                        type = "text",
                        get = function() return self.db.profile.justification[4] end,
                        set = function(v) self.db.profile.justification[4] = v; self:SetJustify(4,v) end,
                        validate = {["LEFT"] = "Left", ["RIGHT"] = "Right", ["CENTER"] = "Center"}
                    },
                    chat5 = {
                        name = string.format(L["Chat%dJustify"], 5),
                        desc = string.format(L["Sets justification for chat window %d."], 5),
                        type = "text",
                        get = function() return self.db.profile.justification[5] end,
                        set = function(v) self.db.profile.justification[5] = v; self:SetJustify(5,v) end,
                        validate = {["LEFT"] = "Left", ["RIGHT"] = "Right", ["CENTER"] = "Center"}
                    },
                    chat6 = {
                        name = string.format(L["Chat%dJustify"], 6),
                        desc = string.format(L["Sets justification for chat window %d."], 6),
                        type = "text",
                        get = function() return self.db.profile.justification[6] end,
                        set = function(v) self.db.profile.justification[6] = v; self:SetJustify(6,v) end,
                        validate = {["LEFT"] = "Left", ["RIGHT"] = "Right", ["CENTER"] = "Center"}
                    },
                    chat7 = {
                        name = string.format(L["Chat%dJustify"], 7),
                        desc = string.format(L["Sets justification for chat window %d."], 7),
                        type = "text",
                        get = function() return self.db.profile.justification[7] end,
                        set = function(v) self.db.profile.justification[7] = v; self:SetJustify(7,v) end,
                        validate = {["LEFT"] = "Left", ["RIGHT"] = "Right", ["CENTER"] = "Center"}
                    }
                }
            },
            toggle = {
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                type = "toggle",
                order = 200,
                get = function() return self.db.profile.on end,
                set = function() self.db.profile.on = Prat:ToggleModuleActive("justify") end
            }
        }
    }
end

function Prat_Justify:OnEnable()
    for i=1,NUM_CHAT_WINDOWS do
        self:SetJustify(i,self.db.profile.justification[i])
    end
end

function Prat_Justify:OnDisable()
    for i=1,NUM_CHAT_WINDOWS do
        self:SetJustify(i,"LEFT")
    end
end

function Prat_Justify:SetJustify(id, justification)
    local cf = getglobal("ChatFrame"..id)
    cf:SetJustifyH(justification)
end
