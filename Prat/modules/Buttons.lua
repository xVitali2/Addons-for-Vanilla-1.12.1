--[[
Name: Prat_Buttons
Revision: $Revision: 16019 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Inspired by: idChat2_Buttons by Industrial
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Buttons
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that toggles the chat menu and chat window buttons on and off (default=off).
Dependencies: Prat
]]

local L = AceLibrary("AceLocale-2.2"):new("PratButtons")

L:RegisterTranslations("enUS", function() return {
    ["Buttons"] = true,
    ["Chat window menu and buttons options."] = true,
    ["ChatMenu"] = true,
    ["Toggles chat menu on and off."] = true,
    ["ChatButtons"] = true,
    ["Toggle chat windows buttons on and off."] = true,
    ["Chat%dButtons"] = true,
    ["Toggles buttons on and off for chat window %d."] = true,
    ["Show Reminder Button"] = true,
    ["Show reminder button when not at bottom of chat window."] = true,
    ["Toggle"] = true,
    ["Toggle the module on and off."] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["Buttons"] = "Кнопки",
    ["Chat window menu and buttons options."] = "Настройки кнопок меню и окна чата.",
    ["ChatMenu"] = "ЧатМеню",
    ["Toggles chat menu on and off."] = "Вкл/выкл кнопки чата.",
    ["ChatButtons"] = "ЧатКнопка",
    ["Toggle chat windows buttons on and off."] = "Вкл/Выкл кнопок окна чата",
    ["Chat%dButtons"] = "ЧатКнопка%d",
    ["Toggles buttons on and off for chat window %d."] = "Вкл/Выкл кнопки окна чата %d.",
    ["Show Reminder Button"] = "Показать кнопку напоминания",
    ["Show reminder button when not at bottom of chat window."] = "Показать кнопку напоминания не в нижней части окна.",
    ["Toggle"] = "Вкл/Выкл",
    ["Toggle the module on and off."] = "Вкл/Выкл модуль",
} end)

L:RegisterTranslations("zhCN", function() return {
	["Buttons"] = "按钮",
	["Chat window menu and buttons options."] = "聊天窗口菜单及按钮选项。",
	["ChatMenu"] = "聊天菜单",
	["Toggles chat menu on and off."] = "显示聊天菜单打开与关闭。",
	["ChatButtons"] = "聊天按钮",
	["Toggle chat windows buttons on and off."] = "切换显示聊天按钮打开与关闭。",
	["Chat%dButtons"] = "聊天%d按钮",
	["Toggles buttons on and off for chat window %d."] = "显示第 %d 聊天窗口按钮。",
    ["Show Reminder Button"] = "显示提示按钮",
    ["Show reminder button when not at bottom of chat window."] = "聊天窗口不在底部时显示提示按钮。",
	["Toggle"] = "切换",
	["Toggle the module on and off."] = "切换此模块打开与关闭。",
} end)

L:RegisterTranslations("koKR", function() return {
    ["Buttons"] = "버튼",
    ["Chat window menu and buttons options."] = "대화창 메뉴와 버튼을 설정합니다.",
    ["ChatMenu"] = "대화 메뉴",
    ["Toggles chat menu on and off."] = "대화 메뉴 켜고 끄기를 전환합니다.",
    ["ChatButtons"] = "대화 버튼",
    ["Toggle chat windows buttons on and off."] = "대화창 버튼 켜고 끄기를 전환합니다.",
    ["Chat%dButtons"] = "대화창%d 버튼",
    ["Toggles buttons on and off for chat window %d."] = "대화창%d에 대한 버튼을 켜고 끄기를 전환합니다.",
    ["Show Reminder Button"] = "Show Reminder Button",
    ["Show reminder button when not at bottom of chat window."] = "Show reminder button when not at bottom of chat window.",
    ["Toggle"] = "전환",
    ["Toggle the module on and off."] = "모듈 켜고 끄기를 전환합니다.",
} end)

Prat_Buttons = Prat:NewModule("buttons")

function Prat_Buttons:OnInitialize()
    self.db = Prat:AcquireDBNamespace("Buttons")
    Prat:RegisterDefaults("Buttons", "profile", {
        on = true,
        chatmenu = false,
        chatbutton = {false, false, false, false, false, false, false},
        showreminder = false
    })
    Prat.Options.args.buttons = {
        name = L["Buttons"],
        desc = L["Chat window menu and buttons options."],
        type = "group",
        args = {
            chatmenu = {
                name = L["ChatMenu"],
                desc = L["Toggles chat menu on and off."],
                type = "toggle",
                order = 150,
                get = function() return self.db.profile.chatmenu end,
                set = function(v)
                    self.db.profile.chatmenu = v
                    self:ChatMenu(v)
                end
            },
            chatbuttons = {
                name = L["ChatButtons"],
                desc = L["Toggle chat windows buttons on and off."],
                type = "group",
                order = 180,
                args = {
                    chat1 = {
                        name = string.format(L["Chat%dButtons"], 1),
                        desc = string.format(L["Toggles buttons on and off for chat window %d."], 1),
                        type = "toggle",
                        get = function() return self.db.profile.chatbutton[1] end,
                        set = function(v)
                            self.db.profile.chatbutton[1] = v
                            self:ChatButton(1,v)
                        end
                    },
                    chat2 = {
                        name = string.format(L["Chat%dButtons"], 2),
                        desc = string.format(L["Toggles buttons on and off for chat window %d."], 2),
                        type = "toggle",
                        get = function() return self.db.profile.chatbutton[2] end,
                        set = function(v)
                            self.db.profile.chatbutton[2] = v
                            self:ChatButton(2,v)
                        end
                    },
                    chat3 = {
                        name = string.format(L["Chat%dButtons"], 3),
                        desc = string.format(L["Toggles buttons on and off for chat window %d."], 3),
                        type = "toggle",
                        get = function() return self.db.profile.chatbutton[3] end,
                        set = function(v)
                            self.db.profile.chatbutton[3] = v
                            self:ChatButton(3,v)
                        end
                    },
                    chat4 = {
                        name = string.format(L["Chat%dButtons"], 4),
                        desc = string.format(L["Toggles buttons on and off for chat window %d."], 4),
                        type = "toggle",
                        get = function() return self.db.profile.chatbutton[4] end,
                        set = function(v)
                            self.db.profile.chatbutton[4] = v
                            self:ChatButton(4,v)
                        end
                    },
                    chat5 = {
                        name = string.format(L["Chat%dButtons"], 5),
                        desc = string.format(L["Toggles buttons on and off for chat window %d."], 5),
                        type = "toggle",
                        get = function() return self.db.profile.chatbutton[5] end,
                        set = function(v)
                            self.db.profile.chatbutton[5] = v
                            self:ChatButton(5,v)
                        end
                    },
                    chat6 = {
                        name = string.format(L["Chat%dButtons"], 6),
                        desc = string.format(L["Toggles buttons on and off for chat window %d."], 6),
                        type = "toggle",
                        get = function() return self.db.profile.chatbutton[6] end,
                        set = function(v)
                            self.db.profile.chatbutton[6] = v
                            self:ChatButton(6,v)
                        end
                    },
                    chat7 = {
                        name = string.format(L["Chat%dButtons"], 7),
                        desc = string.format(L["Toggles buttons on and off for chat window %d."], 7),
                        type = "toggle",
                        get = function() return self.db.profile.chatbutton[7] end,
                        set = function(v)
                            self.db.profile.chatbutton[7] = v
                            self:ChatButton(7,v)
                        end
                    }
                },
            },
            showreminder = {
                name = L["Show Reminder Button"],
                desc = L["Show reminder button when not at bottom of chat window."],
                type = "toggle",
                order = 190,
                get = function() return self.db.profile.showreminder end,
                set = function(v) self.db.profile.showreminder = v end,
            },
            toggle = {
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                type = "toggle",
                order = 200,
                get = function() return self.db.profile.on end,
                set = function() self.db.profile.on = Prat:ToggleModuleActive("buttons") end
            }
        }
    }
    -- create reminder buttons
    for i = 1,NUM_CHAT_WINDOWS do
        self:MakeReminder(i)
    end
end

function Prat_Buttons:OnEnable()
    self:Hook("ChatFrame_OnUpdate")
end

function Prat_Buttons:OnDisable()
    self:ChatMenu(true)
    for i = 1,NUM_CHAT_WINDOWS do
        self:ChatButton(i,true)
    end
end

function Prat_Buttons:ChatFrame_OnUpdate(elapsed)
    self.hooks["ChatFrame_OnUpdate"](elapsed)
    self:ChatMenu(self.db.profile.chatmenu)
    for i = 1,NUM_CHAT_WINDOWS do
        self:ChatButton(i,self.db.profile.chatbutton[i])
    end
end

function Prat_Buttons:ChatMenu(visible)
    if visible then
        ChatFrameMenuButton:Show()
    else
        ChatFrameMenuButton:Hide()
    end
end

function Prat_Buttons:ChatButton(id,visible)
    local cf = getglobal("ChatFrame"..id)
    local cfup = getglobal("ChatFrame"..id.."UpButton")
    local cfdown = getglobal("ChatFrame"..id.."DownButton")
    local cfbottom = getglobal("ChatFrame"..id.."BottomButton")
    local cfreminder = getglobal("ChatFrame"..id.."ScrollDownReminder")
    if visible then
    	cfup:Show()
    	cfdown:Show()
    	cfbottom:Show()
    else
    	cfup:Hide()
    	cfdown:Hide()
   		cfbottom:Hide()
    	if ( (not cf:AtBottom() ) and self.db.profile.showreminder) then
    		cfreminder:Show()
    	else
    		cfreminder:Hide()
    	end
    end
end

function Prat_Buttons:MakeReminder(id)
    local cf = getglobal("ChatFrame"..id)
    local b = CreateFrame("Button","ChatFrame"..id.."ScrollDownReminder",cf)
    b:SetFrameStrata("BACKGROUND")
    b:SetWidth(24)
    b:SetHeight(24)
    b:SetNormalTexture("Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Up")
    b:SetPushedTexture("Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Down")
    b:SetHighlightTexture("Interface\\PaperDollInfoFrame\\UI-Character-Tab-Highlight")
    b:SetPoint("RIGHT", cf, "RIGHT", 0, 0)
	b:SetPoint("LEFT", cf, "RIGHT", -32, 0)
	b:SetPoint("TOP", cf, "BOTTOM", 0, 28)
	b:SetPoint("BOTTOM", cf, "BOTTOM", 0, 0)
	b:SetScript("OnClick", function() this:GetParent():ScrollToBottom() end)
    b:Hide()
end
