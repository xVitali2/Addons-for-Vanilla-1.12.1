--[[
Name: Prat_TellTarget
Revision: $Revision: 16019 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Inspired by: idChat2_TellTarget by Industrial
             ChatFrameExtender by Satrina
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#TellTarget
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that adds a slash command (/tt) to send a message to your target (default=on).
Dependencies: Prat
]]

local L = AceLibrary("AceLocale-2.2"):new("PratTellTarget")

L:RegisterTranslations("enUS", function() return {
    ["TellTarget"] = true,
    ["Adds telltarget slash command (/tt)."] = true,
    ["Toggle"] = true,
    ["Toggle the module on and off."] = true,
    ["Target does not exist."] = true,
    ["Target is not a player."] = true,
    ["No target selected."] = true,
    ["NoTarget"] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["TellTarget"] = "TellTarget",
    ["Adds telltarget slash command (/tt)."] = "Добавляет слеш-команду 'сказать о цели' (/tt).",
    ["Toggle"] = "Вкл/Выкл",
    ["Toggle the module on and off."] = "Вкл/Выкл модуль.",
    ["Target does not exist."] = "Цель не существует.",
    ["Target is not a player."] = "Выбранная цель не является игроком.",
    ["No target selected."] = "Нет выбранной цели.",
    ["NoTarget"] = "Нет цели",
} end)

L:RegisterTranslations("zhCN", function() return {
		["TellTarget"] = "通知目标",
		["Adds telltarget slash command (/tt)."] = "添加通知目标命令(/tt)。",
		["Toggle"] = "切换",
		["Toggle the module on and off."] = "切换此模块的打开与关闭",
		["Target does not exist."] = "目标不存在。",
		["Target is not a player."] = "目标非玩家。",
		["No target selected."] = "无目标选定。",
		["NoTarget"] = "无目标",
} end)

L:RegisterTranslations("koKR", function() return {
    ["TellTarget"] = "대상대화",
    ["Adds telltarget slash command (/tt)."] = "대상대화를 위한 (/tt) 명령 추가",
    ["Toggle"] = "전환",
    ["Toggle the module on and off."] = "모듈 켜고 끄기 전환",
    ["Target does not exist."] = "대상이 없습니다.",
    ["Target is not a player."] = "올바른 대상이 아닙니다.",
    ["No target selected."] = "선택된 대상이 없습니다.",
    ["NoTarget"] = "대상없음",
} end)

Prat_TellTarget = Prat:NewModule("telltarget")

function Prat_TellTarget:OnInitialize()
    self.db = Prat:AcquireDBNamespace("TellTarget")
    Prat:RegisterDefaults("TellTarget", "profile", {
        on = true,
    })
    Prat.Options.args.telltarget = {
        name = L["TellTarget"],
        desc = L["Adds telltarget slash command (/tt)."],
        type = "group",
        args = {
            toggle = {
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                type = "toggle",
                get = function() return self.db.profile.on end,
                set = function() self.db.profile.on = Prat:ToggleModuleActive("telltarget") end
            }
        }
    }
end

function Prat_TellTarget:OnEnable()
    self:Hook("ChatEdit_ExtractTellTarget")
    self:Hook("ChatEdit_ParseText")
end

function Prat_TellTarget:TellTarget(msg)
    if not UnitExists("target") then return end
    if not UnitIsPlayer("target") then Prat:Print(L["Target is not a player."]); return end
    if not UnitName("target") then Prat:Print(L["No target selected."]); return end
    local cf = DEFAULT_CHAT_FRAME
    cf.editBox.chatType = "WHISPER"
    cf.editBox.tellTarget = UnitName("target")
    ChatEdit_UpdateHeader(cf.editBox)
    if not cf.editBox:IsVisible() then
        ChatFrame_OpenChat("", cf)
    end
end

function Prat_TellTarget:ChatEdit_ExtractTellTarget(editBox, msg)
    self.hooks["ChatEdit_ExtractTellTarget"](editBox, msg)
    if (editBox.tellTarget == "%t") then
        editBox.tellTarget = UnitName("target") or L["NoTarget"]
        ChatEdit_UpdateHeader(editBox)
    end
end

function Prat_TellTarget:ChatEdit_ParseText(editBox, send)
    self.hooks["ChatEdit_ParseText"](editBox, send)
    local text = editBox:GetText()
    if not (strsub(text, 1, 1) ~= "/") then
        local command = gsub(text, "/([^%s]+)%s(.*)", "/%1", 1)
        if command == "/tt" then
            editBox.chatType = "WHISPER"
            editBox.tellTarget = UnitName("target") or L["NoTarget"]
            ChatEdit_UpdateHeader(editBox)
            editBox:SetText(strsub(text, strlen(command) + 2))
        end
    end
end
