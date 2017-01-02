--[[
Name: Prat_Scroll
Revision: $Revision: 16019 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Inspired by: idChat2_PlayerNames by Industrial
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Scroll
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that enables mousewheel scrolling for chat windows (default=on).
Dependencies: Prat
]]

local L = AceLibrary("AceLocale-2.2"):new("PratScrolling")

L:RegisterTranslations("enUS", function() return {
    ["Scroll"] = true,
    ["Chat window scrolling options."] = true,
    ["MouseScroll"] = true,
    ["Toggle mousewheel scrolling in chat windows on and off."] = true,
    ["Chat%dScrolling"] = true,
    ["Toggles mouse scrolling on and off for chat window %d."] = true,
    ["Normal ScrollSpeed"] = true,
    ["Sets number of lines mousewheel will scroll."] = true,
    ["Ctrl ScrollSpeed"] = true,
    ["Sets number of lines mousewheel will scroll when ctrl is pressed."] = true,
    ["Toggle"] = true,
    ["Toggle the module on and off."] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["Scroll"] = "Scroll",
    ["Chat window scrolling options."] = "Настройки прокрутки окна чата.",
    ["MouseScroll"] = "Прокрутка мышкой",
    ["Toggle mousewheel scrolling in chat windows on and off."] = "Вкл/Выкл прокрутку окна чата колесиком мышки.",
    ["Chat%dScrolling"] = "ПрокруткаЧата%d",
    ["Toggles mouse scrolling on and off for chat window %d."] = "Вкл/Выкл прокрутку мышкой окно чата %d.",
    ["Normal ScrollSpeed"] = "Нормальная скорость прокрутки",
    ["Sets number of lines mousewheel will scroll."] = "Установить кол-во строк, которое будет прокручиваться колесиком мышки.",
    ["Ctrl ScrollSpeed"] = "Ctrl скорость прокрутки",
    ["Sets number of lines mousewheel will scroll when ctrl is pressed."] = "Устанавливает кол-во прокрученных строки колесиком мышки при нажатии ctrl.",
    ["Toggle"] = "Вкл/Выкл",
    ["Toggle the module on and off."] = "Вкл/Выкл модуль.",
} end)

L:RegisterTranslations("zhCN", function() return {
	["Scroll"] = "滚动",
	["Chat window scrolling options."] = "聊天窗口滚动选项。",
	["MouseScroll"] = "鼠标滚动",
	["Toggle mousewheel scrolling in chat windows on and off."] = "切换鼠标滚动聊天窗口功能打开与关闭。",
	["Chat%dScrolling"] = "窗口%d滚动",
	["Toggles mouse scrolling on and off for chat window %d."] = "切换聊天窗口 %d 鼠标滚动功能打开与关闭。",
	["Normal ScrollSpeed"] = "滚动速度",
	["Sets number of lines mousewheel will scroll."] = "鼠标滚动时卷动的行数。",
	["Ctrl ScrollSpeed"] = "<Ctrl>滚动速度",
	["Sets number of lines mousewheel will scroll when ctrl is pressed."] = "设置按下<Ctrl>时鼠标滚轮的滚动行数。",
	["Toggle"] = "切换",
	["Toggle the module on and off."] = "切换此模块的打开与关闭",
} end)

L:RegisterTranslations("koKR", function() return {
    ["Scroll"] = "스크롤",
    ["Chat window scrolling options."] = "대화창 스크롤 설정입니다.",
    ["MouseScroll"] = "마우스 스크롤",
    ["Toggle mousewheel scrolling in chat windows on and off."] = "대화창을 마우스횔로 스크롤하는 것을 켜고 끄기를 전환합니다.",
    ["Chat%dScrolling"] = "대화창%d 스크롤",
    ["Toggles mouse scrolling on and off for chat window %d."] = "대화창 %d에 대한 마우스 스크롤을 켜고 끄기를 전환합니다.",
    ["Normal ScrollSpeed"] = "일반 스크롤 속도",
    ["Sets number of lines mousewheel will scroll."] = "설정한 라인 수 만큼 스크롤됩니다.",
    ["Ctrl ScrollSpeed"] = "컨트롤 스크롤 속도",
    ["Sets number of lines mousewheel will scroll when ctrl is pressed."] = "컨트롤키를 눌렀을 때 설정된 라인 수만큼 스크롤됩니다.",
    ["Toggle"] = "전환",
    ["Toggle the module on and off."] = "모듈 켜고 끄기를 전환합니다.",
} end)

Prat_Scroll = Prat:NewModule("scroll")

function Prat_Scroll:OnInitialize()
    self.db = Prat:AcquireDBNamespace("Scrolling")
    Prat:RegisterDefaults("Scrolling", "profile", {
        on = true,
        chatscrolls = {true, true, true, true, true, true, true},
        normscrollspeed = 1,
        ctrlscrollspeed = 3,
    })
    Prat.Options.args.scroll = {
        name = L["Scroll"],
        desc = L["Chat window scrolling options."],
        type = "group",
        args = {
            mousescroll = {
                name = L["MouseScroll"],
                desc = L["Toggle mousewheel scrolling in chat windows on and off."],
                type = "group",
                args = {
                    chat1 = {
                        name = string.format(L["Chat%dScrolling"], 1),
                        desc = string.format(L["Toggles mouse scrolling on and off for chat window %d."], 1),
                        type = "toggle",
                        get = function() return self.db.profile.chatscrolls[1] end,
                        set = function(v) self.db.profile.chatscrolls[1] = v; self:MouseWheel(1,v) end
                    },
                    chat2 = {
                        name = string.format(L["Chat%dScrolling"], 2),
                        desc = string.format(L["Toggles mouse scrolling on and off for chat window %d."], 2),
                        type = "toggle",
                        get = function() return self.db.profile.chatscrolls[2] end,
                        set = function(v) self.db.profile.chatscrolls[2] = v; self:MouseWheel(2,v) end
                    },
                    chat3 = {
                        name = string.format(L["Chat%dScrolling"], 3),
                        desc = string.format(L["Toggles mouse scrolling on and off for chat window %d."], 3),
                        type = "toggle",
                        get = function() return self.db.profile.chatscrolls[3] end,
                        set = function(v) self.db.profile.chatscrolls[3] = v; self:MouseWheel(3,v) end
                    },
                    chat4 = {
                        name = string.format(L["Chat%dScrolling"], 4),
                        desc = string.format(L["Toggles mouse scrolling on and off for chat window %d."], 4),
                        type = "toggle",
                        get = function() return self.db.profile.chatscrolls[4] end,
                        set = function(v) self.db.profile.chatscrolls[4] = v; self:MouseWheel(4,v) end
                    },
                    chat5 = {
                        name = string.format(L["Chat%dScrolling"], 5),
                        desc = string.format(L["Toggles mouse scrolling on and off for chat window %d."], 5),
                        type = "toggle",
                        get = function() return self.db.profile.chatscrolls[5] end,
                        set = function(v) self.db.profile.chatscrolls[5] = v; self:MouseWheel(5,v) end
                    },
                    chat6 = {
                        name = string.format(L["Chat%dScrolling"], 6),
                        desc = string.format(L["Toggles mouse scrolling on and off for chat window %d."], 6),
                        type = "toggle",
                        get = function() return self.db.profile.chatscrolls[6] end,
                        set = function(v) self.db.profile.chatscrolls[6] = v; self:MouseWheel(6,v) end
                    },
                    chat7 = {
                        name = string.format(L["Chat%dScrolling"], 7),
                        desc = string.format(L["Toggles mouse scrolling on and off for chat window %d."], 7),
                        type = "toggle",
                        get = function() return self.db.profile.chatscrolls[7] end,
                        set = function(v) self.db.profile.chatscrolls[7] = v; self:MouseWheel(7,v) end
                    }
                }
            },
            normscrollspeed = {
                name = L["Normal ScrollSpeed"],
                desc = L["Sets number of lines mousewheel will scroll."],
                type = "range",
                get = function() return self.db.profile.normscrollspeed end,
                set = function(v) self.db.profile.normscrollspeed = v end,
                min = 1,
                max = 21,
                step = 1,
                order = 180
            },
            ctrlscrollspeed = {
                name = L["Ctrl ScrollSpeed"],
                desc = L["Sets number of lines mousewheel will scroll when ctrl is pressed."],
                type = "range",
                get = function() return self.db.profile.ctrlscrollspeed end,
                set = function(v) self.db.profile.ctrlscrollspeed = v end,
                min = 3,
                max = 21,
                step = 3,
                order = 190
            },
            toggle = {
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                type = "toggle",
                order = 200,
                get = function() return self.db.profile.on end,
                set = function() self.db.profile.on = Prat:ToggleModuleActive("scroll") end
            }
        }
    }
end

function Prat_Scroll:OnEnable()
    for i = 1,NUM_CHAT_WINDOWS do
        self:MouseWheel(i,self.db.profile.chatscrolls[i])
    end
end

function Prat_Scroll:OnDisable()
    for i = 1,NUM_CHAT_WINDOWS do
        self:MouseWheel(i,false)
    end
end

function Prat_Scroll:MouseWheel(id, enabled)
    local cf = getglobal("ChatFrame"..id)
    if enabled then
        cf:SetScript("OnMouseWheel", function()
            if (arg1 > 0) then
                if IsShiftKeyDown() then
                    cf:ScrollToTop()
                else
                    if IsControlKeyDown() then
                        for i = 1,self.db.profile.ctrlscrollspeed do
                            cf:ScrollUp()
                        end
                    else
                        for i = 1,self.db.profile.normscrollspeed do
                            cf:ScrollUp()
                        end
                    end
                end
            elseif (arg1 < 0) then
                if IsShiftKeyDown() then
                    cf:ScrollToBottom()
                else
                    if IsControlKeyDown() then
                        for i = 1,self.db.profile.ctrlscrollspeed do
                            cf:ScrollDown()
                        end
                    else
                        for i = 1,self.db.profile.normscrollspeed do
                            cf:ScrollDown()
                        end
                    end
                end
            end
        end)
        cf:EnableMouseWheel(true)
    else
        cf:SetScript("OnMouseWheel", nil)
        cf:EnableMouseWheel(false)
    end
end
