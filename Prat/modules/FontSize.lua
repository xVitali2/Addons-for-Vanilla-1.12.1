--[[
Name: Prat_FontSize
Revision: $Revision: 16020 $
Author(s): Curney (asml8ed@gmail.com)
Inspired by: ChatFrameExtender by Satrina
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#FontSize
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that sets the font size for chat windows (default=14).
Dependencies: Prat
]]

local L = AceLibrary("AceLocale-2.2"):new("PratFontSize")

L:RegisterTranslations("enUS", function() return {
    ["FontSize"] = true,
    ["Chat window font size options."] = true,
    ["SetMode"] = true,
    ["Choose mode for setting font sizes."] = true,
    ["Set"] = true,
    ["Set the font size for each window."] = true,
    ["Chat%dFontSize"] = true,
    ["Sets font size for chat window %d."] = true,
    ["SetAll"] = true,
    ["Sets font size for all chat windows."] = true,
    ["Toggle"] = true,
    ["Toggle the module on and off."] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["FontSize"] = "FontSize",
    ["Chat window font size options."] = "Опции размера шрифта окна чата.",
    ["SetMode"] = "УстановитьРежим",
    ["Choose mode for setting font sizes."] = "Выберите режим для настройки размера шрифта.",
    ["Set"] = "Установить",
    ["Set the font size for each window."] = "Установить размер шрифта для всех окон.",
    ["Chat%dFontSize"] = "РазмерШрифтаЧата%d",
    ["Sets font size for chat window %d."] = "Установить размер шрифта для окна чата %d.",
    ["SetAll"] = "УстановитьВсе",
    ["Sets font size for all chat windows."] = "Устанавливает размер шрифта для всех окон чата.",
    ["Toggle"] = "Вкл/Выкл",
    ["Toggle the module on and off."] = "Вкл/Выкл модуль",
} end)

L:RegisterTranslations("zhCN", function() return {
	["FontSize"] = "字体尺寸",
	["Chat window font size options."] = "聊天窗口字体尺寸选项。",
	["SetMode"] = "设置模式",
	["Choose mode for setting font sizes."] = "选择设置字体尺寸模式。",
	["Set"] = "设置",
	["Set the font size for each window."] = "为每一聊天窗口设置字体尺寸。",
    ["Chat%dFontSize"] = "窗口 %d 字体尺寸",
    ["Sets font size for chat window %d."] = "设置聊天窗口 %d 字体尺寸。",
	["SetAll"] = "所有尺寸",
	["Sets font size for all chat windows."] = "设置所有聊天窗口字体尺寸。",
	["Toggle"] = "切换",
	["Toggle the module on and off."] = "切换此模块打开与关闭。",
} end)

L:RegisterTranslations("koKR", function() return {
    ["FontSize"] = "글자크기",
    ["Chat window font size options."] = "대화창 글자 크기를 설정합니다.",
    ["SetMode"] = "모드설정",
    ["Choose mode for setting font sizes."] = "글자 크기 설정에 대한 모드를 선택합니다.",
    ["Set"] = "설정",
    ["Set the font size for each window."] = "각 창에 대한 글자 크기를 설정합니다.",
    ["Chat%dFontSize"] = "대화창%d 글자 크기",
    ["Sets font size for chat window %d."] = "대화창 %d에 대한 글자 크기를 설정합니다.",
    ["SetAll"] = "모두 설정",
    ["Sets font size for all chat windows."] = "모든 대화창에 대한 글자 크기를 설정합니다.",
    ["Toggle"] = "전환",
    ["Toggle the module on and off."] = "모듈 켜고 끄기를 전환합니다.",
} end)

Prat_FontSize = Prat:NewModule("fontsize")

function Prat_FontSize:OnInitialize()
    self.db = Prat:AcquireDBNamespace("FontSize")
    Prat:RegisterDefaults("FontSize", "profile", {
        on = true,
        sizemode = "INDIVIDUAL",
        size = {14, 14, 14, 14, 14, 14, 14},
        sizeall = 14
    })
    Prat.Options.args.fontsize = {
        name = L["FontSize"],
        desc = L["Chat window font size options."],
        type = "group",
        args = {
            setmode = {
                name = L["SetMode"],
                desc = L["Choose mode for setting font sizes."],
                type = "text",
                get = function() return self.db.profile.sizemode end,
                set = function(v) self.db.profile.sizemode = v end,
                validate = {["ALL"] = "All", ["INDIVIDUAL"] = "Individual"},
                order = 197
            },
            set = {
                name = L["Set"],
                desc = L["Set the font size for each window."],
                type = "group",
                args = {
                    chat1 = {
                        name = string.format(L["Chat%dFontSize"], 1),
                        desc = string.format(L["Sets font size for chat window %d."], 1),
                        type = "range",
                        get = function() return self.db.profile.size[1] end,
                        set = function(v) self.db.profile.size[1] = v; self:SetSize(1,v) end,
                        min = 4,
                        max = 22,
                        step = 1
                    },
                    chat2 = {
                        name = string.format(L["Chat%dFontSize"], 2),
                        desc = string.format(L["Sets font size for chat window %d."], 2),
                        type = "range",
                        get = function() return self.db.profile.size[2] end,
                        set = function(v) self.db.profile.size[2] = v; self:SetSize(2,v) end,
                        min = 4,
                        max = 22,
                        step = 1
                    },
                    chat3 = {
                        name = string.format(L["Chat%dFontSize"], 3),
                        desc = string.format(L["Sets font size for chat window %d."], 3),
                        type = "range",
                        get = function() return self.db.profile.size[3] end,
                        set = function(v) self.db.profile.size[3] = v; self:SetSize(3,v) end,
                        min = 4,
                        max = 22,
                        step = 1
                    },
                    chat4 = {
                        name = string.format(L["Chat%dFontSize"], 4),
                        desc = string.format(L["Sets font size for chat window %d."], 4),
                        type = "range",
                        get = function() return self.db.profile.size[4] end,
                        set = function(v) self.db.profile.size[4] = v; self:SetSize(4,v) end,
                        min = 4,
                        max = 22,
                        step = 1
                    },
                    chat5 = {
                        name = string.format(L["Chat%dFontSize"], 5),
                        desc = string.format(L["Sets font size for chat window %d."], 5),
                        type = "range",
                        get = function() return self.db.profile.size[5] end,
                        set = function(v) self.db.profile.size[5] = v; self:SetSize(5,v) end,
                        min = 4,
                        max = 22,
                        step = 1
                    },
                    chat6 = {
                        name = string.format(L["Chat%dFontSize"], 6),
                        desc = string.format(L["Sets font size for chat window %d."], 6),
                        type = "range",
                        get = function() return self.db.profile.size[6] end,
                        set = function(v) self.db.profile.size[6] = v; self:SetSize(6,v) end,
                        min = 4,
                        max = 22,
                        step = 1
                    },
                    chat7 = {
                        name = string.format(L["Chat%dFontSize"], 7),
                        desc = string.format(L["Sets font size for chat window %d."], 7),
                        type = "range",
                        get = function() return self.db.profile.size[7] end,
                        set = function(v) self.db.profile.size[7] = v; self:SetSize(7,v) end,
                        min = 4,
                        max = 22,
                        step = 1
                    }
                },
                disabled = function() if self.db.profile.sizemode == "ALL" then return true else return false end end,
                order = 198
            },
            setall = {
                name = L["SetAll"],
                desc = L["Sets font size for all chat windows."],
                type = "range",
                get = function() return self.db.profile.sizeall end,
                set = function(v)
                    self.db.profile.sizeall = v
                    for i=1,NUM_CHAT_WINDOWS do
                        self.db.profile.size[i] = v
                        self:SetSize(i,self.db.profile.size[i])
                    end
                end,
                min = 4,
                max = 22,
                step = 1,
                disabled = function() if self.db.profile.sizemode == "INDIVIDUAL" then return true else return false end end,
                order = 199
            },
            toggle = {
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                type = "toggle",
                get = function() return self.db.profile.on end,
                set = function() self.db.profile.on = Prat:ToggleModuleActive("fontsize") end,
                order = 200
            }
        }
    }
end

function Prat_FontSize:OnEnable()
    for i=1,NUM_CHAT_WINDOWS do
        self:SetSize(i,self.db.profile.size[i])
    end
end

function Prat_FontSize:OnDisable()
    for i=1,NUM_CHAT_WINDOWS do
        self:SetSize(i,12)
    end
end

function Prat_FontSize:SetSize(id, size)
    local font = getglobal("ChatFrame"..id):GetFont();
    getglobal("ChatFrame"..id):SetFont(font,size)
end
