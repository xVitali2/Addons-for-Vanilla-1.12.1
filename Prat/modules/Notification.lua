--[[
Name: Prat_Notification
Revision: $Revision: 16019 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Notification
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that adds options for chat channel notification.
Dependencies: Prat
]]

local L = AceLibrary("AceLocale-2.2"):new("PratNotification")

L:RegisterTranslations("enUS", function() return {
    ["Notification"] = true,
    ["Chat channel notification options."] = true,
    ["Toggle"] = true,
    ["Toggle the module on and off."] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["Notification"] = "Notification",
    ["Chat channel notification options."] = "Опции уведомления канала чата.",
    ["Toggle"] = "Вкл/Выкл",
    ["Toggle the module on and off."] = "Вкл/Выкл модуль",
} end)

L:RegisterTranslations("zhCN", function() return {
    ["Notification"] = "通告",
    ["Chat channel notification options."] = "聊天频道通告选项。",
	["Toggle"] = "切换",
	["Toggle the module on and off."] = "切换此模块打开与关闭。",
} end)

L:RegisterTranslations("koKR", function() return {
    ["Notification"] = "알림",
    ["Chat channel notification options."] = "대화 채널 알림 설정입니다.",
    ["Toggle"] = "전환",
    ["Toggle the module on and off."] = "모듈 켜고 끄기를 전환합니다.",
} end)

Prat_Notification = Prat:NewModule("notification")

function Prat_Notification:OnInitialize()
    self.db = Prat:AcquireDBNamespace("Notification")
    Prat:RegisterDefaults("Notification", "profile", {
        on = true
    })
    Prat.Options.args.highlight = {
        name = L["Notification"],
		desc = L["Chat channel notification options."],
        type = "group",
        args = {
            toggle = {
                type = "toggle",
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                order = 200,
                get = function() return self.db.profile.on end,
                set = function(v) self.db.profile.on = Prat:ToggleModuleActive("notification") end
            },
        }
    }
end

function Prat_Notification:OnEnable()
end

function Prat_Notification:OnDisable()
end
