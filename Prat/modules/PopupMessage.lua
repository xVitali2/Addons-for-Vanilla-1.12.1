--[[
Name: Prat_PopupMessage
Revision: $Revision: 16019 $
Author(s): Sylvanaar
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#PopupMessage
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that displays chat with your name in a pop up window
Dependencies: Prat

Credit goes to: CleanChat
]]

local L = AceLibrary("AceLocale-2.2"):new("PopupMessage")

L:RegisterTranslations("enUS", function() return {
    ["PopupMessage"] = true,
    ["Shows messages with your name in a popup."] = true,
    ["Toggle"] = true,
    ["Show"] = true,
    ["ShowAll"] = true,
    ["Toggle the module on and off."] = true,
    ["Toggles popups on and off for chat window %d."] = true,
    ["Toggle showing Popup settings for each window."] = true,
    ["Chat%dPopupShow"] = true,
    ["Toggles Popup on and off for all chat windows."] = true,
    ["Choose mode for showing popups."] = true,
    ["ShowMode"] = true,
    ["All"] = true,
    ["Individual"] = true,
    ["An alternate name to show in popups."] = true,
    ["Nickname"] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["PopupMessage"] = "PopupMessage",
    ["Shows messages with your name in a popup."] = "Отображать сообщение с вашим именем в всплывающем окне.",
    ["Toggle"] = "Вкл/Выкл",
    ["Show"] = "Показать",
    ["ShowAll"] = "Показать все",
    ["Toggle the module on and off."] = "Вкл/Выкл модуль",
    ["Toggles popups on and off for chat window %d."] = "Вкл/Выкл всплывающие окна для окна чата %d.",
    ["Toggle showing Popup settings for each window."] = "Вкл/Выкл всплывающие настройки для каждого окна.",
    ["Chat%dPopupShow"] = "ПоказыватьВысплывающийЧат%d",
    ["Toggles Popup on and off for all chat windows."] = "Вкл/Выкл всплывание для всех окон чата.",
    ["Choose mode for showing popups."] = "Выбрать режим для отображение всплывающих окон.",
    ["ShowMode"] = "ПоказатьРежим",
    ["All"] = "Все",
    ["Individual"] = "Индивидуальный",
    ["An alternate name to show in popups."] = "Альтернативное название чтобы показать всплывающие окна.",
    ["Nickname"] = "Ник",
} end)

L:RegisterTranslations("zhCN", function() return {
    ["PopupMessage"] = "弹出消息",
    ["Shows messages with your name in a popup."] = "在弹出窗口中显示包含自己名字的消息.",
	["Toggle"] = "切换",
	["Toggle the module on and off."] = "切换此模块的打开与关闭。",
    ["Show"] = "显示",
    ["ShowAll"] = "全部显示",
    ["Toggles popups on and off for chat window %d."] = "切换窗口 %d 的弹出消息.",
    ["Toggle showing Popup settings for each window."] = "切换每一窗口的弹出显示设置.",
    ["Chat%dPopupShow"] = "显示窗口 %d 探出消息",
    ["Toggles Popup on and off for all chat windows."] = "切换全部聊天窗口弹出消息.",
    ["Choose mode for showing popups."] = "选择显示弹出消息方式.",
    ["ShowMode"] = "显示模式",
    ["All"] = "全部",
    ["Individual"] = "个别",
    ["An alternate name to show in popups."] = "显示弹出消息的替换名字.",
    ["Nickname"] = "昵称",
} end)

L:RegisterTranslations("koKR", function() return {
    ["PopupMessage"] = "팝업 메세지",
    ["Shows messages with your name in a popup."] = "당신의 이름을 포함한 메세지를 팝업으로 표시합니다.",
    ["Show"] = "표시",
    ["ShowAll"] = "모두 표시",
    ["Toggles popups on and off for chat window %d."] = "대화창 %d에 대한 팝업을 켜거나 끕니다.",
    ["Toggle showing Popup settings for each window."] = "각 창에 대한 팝업 설정을 표시하거나 끕니다.",
    ["Chat%dPopupShow"] = "대화%d 팝업 표시",
    ["Toggles Popup on and off for all chat windows."] = "모든 대화창에 대한 팝업을 켜거나 끕니다.",
    ["Choose mode for showing popups."] = "팝업 표시에 대한 모드를 선택합니다.",
    ["ShowMode"] = "표시모드",
    ["All"] = "모두",
    ["Individual"] = "각각",
    ["An alternate name to show in popups."] = "팝업으로 표시할 다른 이름",
    ["Nickname"] = "별명",
    ["Toggle"] = "전환",
    ["Toggle the module on and off."] = "모듈 켜고 끄기 전환",
} end)

Prat_PopupMessage = Prat:NewModule("PopupMessage")

function Prat_PopupMessage:OnInitialize()
    self.db = Prat:AcquireDBNamespace("PopupMessage")
    Prat:RegisterDefaults("PopupMessage", "profile", {
        on = true,
		showmode = "INDIVIDUAL",
        show = {true, false, false, false, false, false, false},
        showall = false,
        nickname = "",
    })
    Prat.Options.args.PopupMessage = {
        name = L["PopupMessage"],
        desc = L["Shows messages with your name in a popup."],
        type = "group",
        args = {
            Toggle = {
                type = "toggle",
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                get = function() return self.db.profile.on end,
                set = function(v) self.db.profile.on = Prat:ToggleModuleActive("PopupMessage") end
            },     
            showmode = {
                name = L["ShowMode"],
                desc = L["Choose mode for showing popups."],
                type = "text",
                order = 100,
                get = function() return self.db.profile.showmode end,
                set = function(v) self.db.profile.showmode = v end,
                validate = {["ALL"] = L["All"], ["INDIVIDUAL"] = L["Individual"]}
            },
            show = {
                name = L["Show"],
                desc = L["Toggle showing Popup settings for each window."],
                type = "group",
                order = 110,
                args = {
                    chat1 = {
                        name = string.format(L["Chat%dPopupShow"], 1),
                        desc = string.format(L["Toggles popups on and off for chat window %d."], 1),
                        type = "toggle",
                        get = function() return self.db.profile.show[1] end,
                        set = function(v) self.db.profile.show[1] = v; self:SetFrameStatus(1) end
                    },
                    chat2 = {
                        name = string.format(L["Chat%dPopupShow"], 2),
                        desc = string.format(L["Toggles popups on and off for chat window %d."], 2),
                        type = "toggle",
                        get = function() return self.db.profile.show[2] end,
                        set = function(v) self.db.profile.show[2] = v; self:SetFrameStatus(2) end
                    },
                    chat3 = {
                        name = string.format(L["Chat%dPopupShow"], 3),
                        desc = string.format(L["Toggles popups on and off for chat window %d."], 3),
                        type = "toggle",
                        get = function() return self.db.profile.show[3] end,
                        set = function(v) self.db.profile.show[3] = v; self:SetFrameStatus(3) end
                    },
                    chat4 = {
                        name = string.format(L["Chat%dPopupShow"], 4),
                        desc = string.format(L["Toggles popups on and off for chat window %d."], 4),
                        type = "toggle",
                        get = function() return self.db.profile.show[4] end,
                        set = function(v) self.db.profile.show[4] = v; self:SetFrameStatus(4) end
                    },
                    chat5 = {
                        name = string.format(L["Chat%dPopupShow"], 5),
                        desc = string.format(L["Toggles popups on and off for chat window %d."], 5),
                        type = "toggle",
                        get = function() return self.db.profile.show[5] end,
                        set = function(v) self.db.profile.show[5] = v; self:SetFrameStatus(5) end
                    },
                    chat6 = {
                        name = string.format(L["Chat%dPopupShow"], 6),
                        desc = string.format(L["Toggles popups on and off for chat window %d."], 6),
                        type = "toggle",
                        get = function() return self.db.profile.show[6] end,
                        set = function(v) self.db.profile.show[6] = v; self:SetFrameStatus(6) end
                    },
                    chat7 = {
                        name = string.format(L["Chat%dPopupShow"], 7),
                        desc = string.format(L["Toggles popups on and off for chat window %d."], 7),
                        type = "toggle",
                        get = function() return self.db.profile.show[7] end,
                        set = function(v) self.db.profile.show[7] = v; self:SetFrameStatus(7) end
                    },
                },
                disabled = function() if self.db.profile.showmode == "ALL" then return true else return false end end,
            },
            showall = {
                name = L["ShowAll"],
                desc = L["Toggles Popup on and off for all chat windows."],
                type = "toggle",
                order = 120,
                get = function() return self.db.profile.showall end,
                set = function(v)
                    self.db.profile.showall = v
                    for i=1,NUM_CHAT_WINDOWS do
                        self.db.profile.show[i] = v       
                        self:SetFrameStatus(i)                                     
                    end
                end,
                disabled = function() if self.db.profile.showmode == "INDIVIDUAL" then return true else return false end end,
            },
            
             nick = {
                 order = 130,
                 name = L["Nickname"],
                 desc = L["An alternate name to show in popups."],
                 type = "text",
                 usage = "<string>",
                 get = function() return self.db.profile.nickname end,
                 set = function(v) self.db.profile.nickname = v end,
                 hidden = function() return true end,
             },
        },        
    }
end

function Prat_PopupMessage:OnEnable()
    for i=1,NUM_CHAT_WINDOWS do
		self:SetFrameStatus(i)
    end
    
    self.playerName = UnitName("player");
end
function Prat_PopupMessage:OnDisable()

end

function Prat_PopupMessage:SetFrameStatus(id)
	local frame = getglobal("ChatFrame"..id)

    if self.db.profile.show[id] then
    	if not self:IsHooked(frame, "AddMessage") then self:SecureHook(frame, "AddMessage") end
    else
        if self:IsHooked(frame, "AddMessage") then self:Unhook(frame, "AddMessage") end
    end
end


function Prat_PopupMessage:AddMessage(frame, text, r, g, b, id)
      
    local Name = string.gsub(text, ".*|Hplayer:(.-)|h.*", "%1")
    
    if Name ~= self.playerName then 
        local textL = string.lower(text)    
        local playerL = string.lower(self.playerName)
--        local nicknameL = string.lower(self.db.profile.nickname)

--        if string.find(textL, playerL) or string.find(textL, nicknameL) then
        if string.find(textL, playerL) then
            Prat_PopupFrame.fadeOut = 10;
            Prat_PopupFrame:SetAlpha(1);
            Prat_PopupFrameText:SetText(text);
            Prat_PopupFrame:Show();
            PlaySound("FriendJoinGame");
        end
    end
    
	-- SecureHook no need to call original
end    


function Prat_PopupMessage:PopupUpdated(elapsed)
  Prat_PopupFrame.fadeOut = Prat_PopupFrame.fadeOut - elapsed;
  if Prat_PopupFrame.fadeOut < -1 then
    Prat_PopupFrame:Hide();
  elseif Prat_PopupFrame.fadeOut < 0 then
    Prat_PopupFrame:SetAlpha(1 + Prat_PopupFrame.fadeOut);
  end
end





