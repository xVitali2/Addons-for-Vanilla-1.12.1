--[[
Name: Prat_Fading
Revision: $Revision: 16019 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Inspired by: idChat2_DisableFade by Industrial
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Fading
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that adds text fading options for chat windows.
Dependencies: Prat
]]

local L = AceLibrary("AceLocale-2.2"):new("PratFading")

L:RegisterTranslations("enUS", function() return {
    ["Fading"] = true,
    ["Chat window text fading options."] = true,
    ["TextFade"] = true,
    ["Set text fading in chat windows on and off."] = true,
    ["Chat%dFading"] = true,
    ["Toggles fading on and off for chat window %d."] = true,
    ["FadeDuration"] = true,
    ["Set duration to show text before fading."] = true,
    ["Toggle"] = true,
    ["Toggle the module on and off."] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["Fading"] = "Fading",
    ["Chat window text fading options."] = "Настройки затухания текста в окне чата.",
    ["TextFade"] = "ЗатуханиеТекста",
    ["Set text fading in chat windows on and off."] = "Вкл/Выкл затухание текста в окне чата.",
    ["Chat%dFading"] = "ЗатуханиеТекста%d",
    ["Toggles fading on and off for chat window %d."] = "Вкл/Выкл затухание в окне чата %d.",
    ["FadeDuration"] = "ПродолжительностьЗатухания",
    ["Set duration to show text before fading."] = "Установить продолжительность отображение текста, прежде чем они исчезнет.",
    ["Toggle"] = "Вкл/Выкл",
    ["Toggle the module on and off."] = "Вкл/Выкл модуль",
} end)

L:RegisterTranslations("zhCN", function() return {
	["Fading"] = "淡出",
	["Chat window text fading options."] = "聊天窗口文本淡入淡出选项。",
	["TextFade"] = "文本淡出",
	["Set text fading in chat windows on and off."] = "设置聊天窗口是否使用文本淡出。",
    ["Chat%dFading"] = "窗口 %d 淡出",
    ["Toggles fading on and off for chat window %d."] = "切换聊天窗口 %d 文本淡出打开与关闭。",
    ["FadeDuration"] = "时间",
    ["Set duration to show text before fading."] = "设置聊天窗口淡出时间。",
	["Toggle"] = "切换",
	["Toggle the module on and off."] = "切换此模块打开与关闭。",
} end)

L:RegisterTranslations("koKR", function() return {
    ["Fading"] = "사라짐",
    ["Chat window text fading options."] = "대화창 글자 사라짐 설정입니다.",
    ["TextFade"] = "글자 사라짐",
    ["Set text fading in chat windows on and off."] = "대화창에 글자가 사라지는 것을 켜고 끄기를 전환합니다.",
    ["Chat%dFading"] = "대화창%d 사라짐",
    ["Toggles fading on and off for chat window %d."] = "대화창 %d에 대한 사라짐 켜고 끄기를 전환합니다.",
    ["FadeDuration"] = "사라짐 시간",
    ["Set duration to show text before fading."] = "사라지기 전까지 글자를 표시할 시간을 설정합니다.",
    ["Toggle"] = "전환",
    ["Toggle the module on and off."] = "모듈 켜고 끄기를 전환합니다.",
} end)

Prat_Fading = Prat:NewModule("fading")

function Prat_Fading:OnInitialize()
    self.db = Prat:AcquireDBNamespace("Fading")
    Prat:RegisterDefaults("Fading", "profile", {
        on = true,
        normal = true,
        textfade = {false, false, false, false, false, false, false},
        duration = 5
    })
    Prat.Options.args.fading = {
        name = L["Fading"],
        desc = L["Chat window text fading options."],
        type = "group",
        args = {
            textfade = {
                name = L["TextFade"],
                desc = L["Set text fading in chat windows on and off."],
                type = "group",
                args = {
                    chat1 = {
                        name = string.format(L["Chat%dFading"], 1),
                        desc = string.format(L["Toggles fading on and off for chat window %d."], 1),
                        type = "toggle",
                        get = function() return self.db.profile.textfade[1] end,
                        set = function(v) self.db.profile.textfade[1] = v; self:Fade(1,v) end
                    },
                    chat2 = {
                        name = string.format(L["Chat%dFading"], 1),
                        desc = string.format(L["Toggles fading on and off for chat window %d."], 1),
                        type = "toggle",
                        get = function() return self.db.profile.textfade[2] end,
                        set = function(v) self.db.profile.textfade[2] = v; self:Fade(2,v) end
                    },
                    chat3 = {
                        name = string.format(L["Chat%dFading"], 1),
                        desc = string.format(L["Toggles fading on and off for chat window %d."], 1),
                        type = "toggle",
                        get = function() return self.db.profile.textfade[3] end,
                        set = function(v) self.db.profile.textfade[3] = v; self:Fade(3,v) end
                    },
                    chat4 = {
                        name = string.format(L["Chat%dFading"], 1),
                        desc = string.format(L["Toggles fading on and off for chat window %d."], 1),
                        type = "toggle",
                        get = function() return self.db.profile.textfade[4] end,
                        set = function(v) self.db.profile.textfade[4] = v; self:Fade(4,v) end
                    },
                    chat5 = {
                        name = string.format(L["Chat%dFading"], 1),
                        desc = string.format(L["Toggles fading on and off for chat window %d."], 1),
                        type = "toggle",
                        get = function() return self.db.profile.textfade[5] end,
                        set = function(v) self.db.profile.textfade[5] = v; self:Fade(5,v) end
                    },
                    chat6 = {
                        name = string.format(L["Chat%dFading"], 1),
                        desc = string.format(L["Toggles fading on and off for chat window %d."], 1),
                        type = "toggle",
                        get = function() return self.db.profile.textfade[6] end,
                        set = function(v) self.db.profile.textfade[6] = v; self:Fade(6,v) end
                    },
                    chat7 = {
                        name = string.format(L["Chat%dFading"], 1),
                        desc = string.format(L["Toggles fading on and off for chat window %d."], 1),
                        type = "toggle",
                        get = function() return self.db.profile.textfade[7] end,
                        set = function(v) self.db.profile.textfade[7] = v; self:Fade(7,v) end
                    }
                }
            },
            fadeduration = {
                name = L["FadeDuration"],
                desc = L["Set duration to show text before fading."],
                type = "range",
                order = 190,
                get = function() return self.db.profile.duration end,
                set = function(v) self.db.profile.duration = v end,
                min = 1,
                max = 60,
                step = 1
            },
            toggle = {
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                type = "toggle",
                order = 200,
                get = function() return self.db.profile.on end,
                set = function() self.db.profile.on = Prat:ToggleModuleActive("fading") end
            }
        }
    }
end

function Prat_Fading:OnEnable()
    for i=1,NUM_CHAT_WINDOWS do
        self:Fade(i,self.db.profile.textfade[i])
    end
end

function Prat_Fading:OnDisable()
    for i=1,7 do
        self:Fade(i,self.db.profile.normal)
    end
end

function Prat_Fading:Fade(id,textfade)
    local cf = getglobal("ChatFrame"..id)
    if textfade then
        cf:SetFading(1)
        cf:SetFadeDuration(self.db.profile.duration)
    else
        cf:SetFading(nil)
    end
end
