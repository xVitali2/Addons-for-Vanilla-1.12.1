--[[
Name: Prat_Highlight
Revision: $Revision: 16019 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Highlight
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that adds options for highlighting text in chat windows.
Dependencies: Prat
]]

local L = AceLibrary("AceLocale-2.2"):new("PratHighlight")

L:RegisterTranslations("enUS", function() return {
    ["Highlight"] = true,
    ["Text highlighting options."] = true,
    ["Toggle"] = true,
    ["Toggle the module on and off."] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["Highlight"] = "Highlight",
    ["Text highlighting options."] = "Опции подсветки текста.",
    ["Toggle"] = "Вкл/Выкл",
    ["Toggle the module on and off."] = "Вкл/Выкл модуль",
} end)

L:RegisterTranslations("zhCN", function() return {
	["Highlight"] = "高亮",
	["Text highlighting options."] = "文本高亮选项。",
	["Toggle"] = "切换",
	["Toggle the module on and off."] = "切换此模块的打开与关闭。",
} end)

L:RegisterTranslations("koKR", function() return {
    ["Highlight"] = "강조",
    ["Text highlighting options."] = "텍스트 강조 설정입니다.",
    ["Toggle"] = "전환",
    ["Toggle the module on and off."] = "모듈 켜고 끄기를 전환합니다.",
} end)

Prat_Highlight = Prat:NewModule("highlight")

function Prat_Highlight:OnInitialize()
    self.db = Prat:AcquireDBNamespace("Highlight")
    Prat:RegisterDefaults("Highlight", "profile", {
        on = true
    })
    Prat.Options.args.highlight = {
        name = L["Highlight"],
		desc = L["Text highlighting options."],
        type = "group",
        args = {
            toggle = {
                type = "toggle",
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                order = 200,
                get = function() return self.db.profile.on end,
                set = function(v) self.db.profile.on = Prat:ToggleModuleActive("highlight") end
            },
        }
    }
end


function Prat_Highlight:OnEnable()
    for i=1,NUM_CHAT_WINDOWS do
        self:Hook(getglobal("ChatFrame"..i), "AddMessage")
    end
end

-- Hook
function Prat_Highlight:AddMessage(frame, text, ...)
    if text then
        text = Prat_Highlight:ProcessText (text)
    end
    self.hooks[frame].AddMessage(frame, text, unpack(arg))
end

-- Utility Function
function Prat_Highlight:ProcessText(text)
    return text
end
