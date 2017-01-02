--[[
Name: Prat_Editbox
Revision: $Revision: 16019 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Inspired by: idChat2_Editbox by Industrial
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Editbox
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that adds editbox options.
Dependencies: Prat
]]

local L = AceLibrary("AceLocale-2.2"):new("PratEditbox")

L:RegisterTranslations("enUS", function() return {
    ["Editbox"] = true,
    ["Editbox options."] = true,
    ["Alpha"] = true,
    ["Set the alpha of the editbox."] = true,
    ["Position"] = true,
    ["Set position of editbox."] = true,
    ["Width"] = true,
    ["Set the width of the editbox."] = true,
    ["Locked"] = true,
    ["Lock editbox position is undocked."] = true,
    ["Arrowkeys"] = true,
    ["Toggle using arrowkeys in editbox without the alt key."] = true,
    ["Sticky"] = true,
    ["Toggle text clearing when editbox is closed."] = true,
    ["Toggle"] = true,
    ["Toggle the module on and off."] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["Editbox"] = "Editbox",
    ["Editbox options."] = "Настройки поля ввода.",
    ["Alpha"] = "Альфа",
    ["Set the alpha of the editbox."] = "Установить альфа в поле ввода.",
    ["Position"] = "Позиция",
    ["Set position of editbox."] = "Установить положение поля ввода.",
    ["Width"] = "Ширина",
    ["Set the width of the editbox."] = "Установить ширину поля ввода.",
    ["Locked"] = "Заблокировать",
    ["Lock editbox position is undocked."] = "Поле ввода будет отстыковано.",
    ["Arrowkeys"] = "Стрелки",
    ["Toggle using arrowkeys in editbox without the alt key."] = "Переключение поля ввода с помощью стрелок, без кнопки alt.",
    ["Sticky"] = "Липкий",
    ["Toggle text clearing when editbox is closed."] = "Вкл/Выкл очистку текста когда поле ввода закрыто.",
    ["Toggle"] = "Вкл/Выкл",
    ["Toggle the module on and off."] = "Вкл/Выкл модуль",
} end)

L:RegisterTranslations("zhCN", function() return {
	["Editbox"] = "输入框",
	["Editbox options."] = "输入框选项。",
	["Alpha"] = "透明度",
	["Set the alpha of the editbox."] = "设置输入框透明度。",
	["Position"] = "位置",
	["Set position of editbox."] = "设置输入框位置。",
	["Width"] = "宽度",
	["Set the width of the editbox."] = "设置输入框宽度。",
	["Locked"] = "锁定",
	["Lock editbox position is undocked."] = "锁定输入框位置。",
	["Arrowkeys"] = "方向键",
	["Toggle using arrowkeys in editbox without the alt key."] = "激活输入框使用方向键不带Alt键功能。",
    ["Sticky"] = "粘滞",
    ["Toggle text clearing when editbox is closed."] = "激活当聊天框关闭时清除文本。",
	["Toggle"] = "切换",
	["Toggle the module on and off."] = "切换此模块的打开与关闭",
} end)

L:RegisterTranslations("koKR", function() return {
    ["Editbox"] = "입력창",
    ["Editbox options."] = "입력창 설정입니다.",
    ["Alpha"] = "투명도",
    ["Set the alpha of the editbox."] = "입력창의 투명도를 설정합니다.",
    ["Position"] = "위치",
    ["Set position of editbox."] = "입력창의 위치를 설정합니다.",
    ["Width"] = "넓이",
    ["Set the width of the editbox."] = "입력창의 넓이를 설정합니다.",
    ["Locked"] = "고정",
    ["Lock editbox position is undocked."] = "입력창 위치를 고정시킵니다.",
    ["Arrowkeys"] = "방향키",
    ["Toggle using arrowkeys in editbox without the alt key."] = " ALT키를 누르지 않고 입력창에 방향키 사용을 전환합니다.",
    ["Sticky"] = "고정",
    ["Toggle text clearing when editbox is closed."] = "입력창을 닫았을 때 텍스트 초기화를 전환합니다.",
    ["Toggle"] = "전환",
    ["Toggle the module on and off."] = "모듈 켜고 끄기를 전환합니다.",
} end)

Prat_Editbox = Prat:NewModule("editbox")

function Prat_Editbox:OnInitialize()
    self.db = Prat:AcquireDBNamespace("Editbox")
    Prat:RegisterDefaults("Editbox", "profile", {
        on = true,
        alpha = 1,
        position = "TOP",
        width = 400,
        undocked = {point = "CENTER", relativeTo="UIParent", relativePoint = "CENTER", xoff = 0, yoff = 0},
        locked = false,
        sticky = false,
        arrowkeys = true
    })
    Prat.Options.args.editbox = {
        name = L["Editbox"],
        desc = L["Editbox options."],
        type = "group",
        args = {
            alpha = {
                name = L["Alpha"],
                desc = L["Set the alpha of the editbox."],
                type = "range",
                get = function() return self.db.profile.alpha end,
                set = function(v)
                    self.db.profile.alpha = v
                    self:Alpha(v)
                end,
                min = 0,
                max = 1,
                step = 0.05,
                order = 195
            },
            position = {
                name = L["Position"],
                desc = L["Set position of editbox."],
                type = "text",
                get = function() return self.db.profile.position end,
                set = function(v)
                    self.db.profile.position = v
                    self:Position(v)
                end,
                validate = {["TOP"] = "Top", ["BOTTOM"] = "Bottom", ["UNDOCKED"] = "Undocked"},
                order = 196
            },
            width = {
                name = L["Width"],
                desc = L["Set the width of the editbox."],
                type = "range",
                get = function() return self.db.profile.width end,
                set = function(v)
                    self.db.profile.width = v
                    self:Position(self.db.profile.position)
                end,
                min = 267,
                max = 800,
                step = 1,
                disabled = function() if self.db.profile.position == "UNDOCKED" then return false else return true end end,
                order = 197
            },
            locked = {
                name = L["Locked"],
                desc = L["Lock editbox position is undocked."],
                type = "toggle",
                get = function() return self.db.profile.locked end,
                set = function(v)
                    self.db.profile.locked = v
                    self:Position(self.db.profile.position)
                end,
                disabled = function() if self.db.profile.position == "UNDOCKED" then return false else return true end end,
                order = 198
            },
            arrowkeys = {
                name = L["Arrowkeys"],
                desc = L["Toggle using arrowkeys in editbox without the alt key."],
                type = "toggle",
                get = function() return self.db.profile.arrowkeys end,
                set = function(v)
                    self.db.profile.arrowkeys = v
                    self:ArrowKeys(v)
                end,
                order = 199
            },
            sticky = {
                name = L["Sticky"],
                desc = L["Toggle text clearing when editbox is closed."],
                type = "toggle",
                get = function() return self.db.profile.sticky end,
                set = function(v)
                    self.db.profile.sticky = v
                    self:Sticky(v)
                end,
                order = 200
            },
            toggle = {
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                type = "toggle",
                get = function() return self.db.profile.on end,
                set = function() self.db.profile.on = Prat:ToggleModuleActive("editbox") end,
                order = 201
            }
        }
    }
end

function Prat_Editbox:OnEnable()
    self:Position(self.db.profile.position)
    self:Alpha(self.db.profile.alpha)
    self:ArrowKeys(self.db.profile.arrowkeys)
    self:Sticky(self.db.profile.sticky)
end

function Prat_Editbox:OnDisable()
    self:Position("BOTTOM")
    self:Alpha(1)
    self:ArrowKeys(false)
    self:Sticky(false)
end

function Prat_Editbox:Alpha(value)
    local eb = VisorEditbox or ChatFrameEditBox
    for i,v in ipairs({eb:GetRegions()}) do
        if i==6 or i==7 or i==8 then
            v:SetAlpha(value)
        end
    end
end

function Prat_Editbox:ArrowKeys(enabled)
    local eb = VisorEditBox or ChatFrameEditBox
    if enabled then eb:SetAltArrowKeyMode(false) else eb:SetAltArrowKeyMode(true) end
end

function Prat_Editbox:Position(option)
    local eb = VisorEditBox or ChatFrameEditBox
    eb:ClearAllPoints()
    if option == "TOP" then
        eb:SetPoint("BOTTOMLEFT",  "ChatFrame1", "TOPLEFT",  -5, 0)
        eb:SetPoint("BOTTOMRIGHT", "ChatFrame1", "TOPRIGHT", 5, 0)
    end
    if option == "BOTTOM" then
        eb:SetPoint("TOPLEFT",  "ChatFrame1", "BOTTOMLEFT",  -5, 0)
        eb:SetPoint("TOPRIGHT", "ChatFrame1", "BOTTOMRIGHT", 5, 0)
    end
    if option == "UNDOCKED" then
        eb:SetMovable(true)
        eb:EnableMouse(true)
        eb:RegisterForDrag("LeftButton")
        eb:SetScript("OnDragStart", function() if not self.db.profile.locked then eb:StartMoving() end end)
        eb:SetScript("OnDragStop", function()
            eb:StopMovingOrSizing()
            local point, relativeTo, relativePoint, xoff, yoff = eb:GetPoint()
            self.db.profile.undocked.point = point
            -- self.db.profile.undocked.relativeTo = relativeTo:GetName() -- this causes game crash, keep commented out
            self.db.profile.undocked.relativePoint = relativePoint
            self.db.profile.undocked.xoff = xoff
            self.db.profile.undocked.yoff = yoff
        end)
        eb:SetPoint(self.db.profile.undocked.point, self.db.profile.undocked.relativeTo, self.db.profile.undocked.relativePoint, self.db.profile.undocked.xoff, self.db.profile.undocked.yoff)
        eb:SetWidth(self.db.profile.width)
    end
end

function Prat_Editbox:Sticky(enabled)
    if not enabled then
        DEFAULT_CHAT_FRAME.editBox:SetScript("OnEscapePressed", 
            function() ChatEdit_OnEscapePressed(this) end
        )
		DEFAULT_CHAT_FRAME.editBox:SetScript("OnEnterPressed",
			function() ChatEdit_OnEnterPressed() end
		)
        self:UnhookAll()
    else
        DEFAULT_CHAT_FRAME.editBox:SetScript("OnEscapePressed", 
            function()
                this.oldText = this:GetText()
                this.oldChatType = this.chatType
                ChatEdit_OnEscapePressed(this)
            end
        )
        DEFAULT_CHAT_FRAME.editBox:SetScript("OnEnterPressed",
            function()
                this.oldText = nil
                this.oldChatType = nil
                ChatEdit_OnEnterPressed()
            end
        )
        self:Hook("ChatFrame_OpenChat",
            function(text, chatFrame)
                local editBox =  DEFAULT_CHAT_FRAME.editBox
                if (not chatFrame or chatFrame == DEFAULT_CHAT_FRAME) and text == "" and 
                        editBox.oldText and editBox.oldText ~= "" then
                    editBox:SetText(editBox.oldText)
                    editBox.chatType = editBox.oldChatType
                    editBox:Show()
                else
                    self.hooks["ChatFrame_OpenChat"](text, chatFrame)
                end
            end
        )
        self:Hook("ChatFrame_ReplyTell",
            function(chatFrame)
                if ( not chatFrame ) then
		            chatFrame = DEFAULT_CHAT_FRAME;
                end
                chatFrame.editBox.oldText = nil
                self.hooks["ChatFrame_ReplyTell"](chatFrame)
            end
        )
        self:Hook("ChatFrame_ReplyTell2",
            function(chatFrame)
                if ( not chatFrame ) then
		            chatFrame = DEFAULT_CHAT_FRAME;
                end
                chatFrame.editBox.oldText = nil
                self.hooks["ChatFrame_ReplyTell2"](chatFrame)
            end
        ) 
    end
end
