--[[
Name: Prat_UrlCopy
Revision: $Revision: 16019 $
Author(s): Krtek (krtek4@gmail.com)
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#UrlCopy
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that makes it easy to copy URL"s in chat windows.
Dependencies: Prat
]]

local L = AceLibrary("AceLocale-2.2"):new("PratUrlCopy")

L:RegisterTranslations("enUS", function() return {
    ["UrlCopy"] = true,
    ["URL formating options."] = true,
    ["Show Brackets"] = true,
    ["Toggle showing brackets on and off."] = true,
    ["Use Popup"] = true,
    ["Use popup window to show URL."] = true,
    ["Color URL"] = true,
    ["Toggle the URL color on and off."] = true,
    ["Set Color"] = true,
    ["Change the color of the URL."] = true,
    ["Toggle"] = true,
    ["Toggle the module on and off."] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["UrlCopy"] = "UrlCopy",
    ["URL formating options."] = "Настройки формата URL-адреса.",
    ["Show Brackets"] = "Показывать скобки",
    ["Toggle showing brackets on and off."] = "Вкл/Выкл отображение скобок.",
    ["Use Popup"] = "Всплывающее окно",
    ["Use popup window to show URL."] = "Использовать всплывающее окно для отображение ссылки.",
    ["Color URL"] = "Цвет ссылки",
    ["Toggle the URL color on and off."] = "Вкл/Выкл окраску ссылок.",
    ["Set Color"] = "Цвет",
    ["Change the color of the URL."] = "Изменение цвета ссылок.",
    ["Toggle"] = "Вкл/Выкл",
    ["Toggle the module on and off."] = "Вкл/Выкл модуль.",
} end)

L:RegisterTranslations("zhCN", function() return {
	["UrlCopy"] = "复制超链接",
	["URL formating options."] = "超链接格式选项。",
	["Show Brackets"] = "显示括号",
	["Toggle showing brackets on and off."] = "切换显示括号功能打开与关闭。",
	["Use Popup"] = "弹出",
	["Use popup window to show URL."] = "用弹出窗口显示超链接。",
	["Color URL"] = "颜色",
	["Toggle the URL color on and off."] = "切换超链接颜色打开与关闭。",
	["Set Color"] = "设置颜色",
	["Change the color of the URL."] = "更改超链接颜色。",
	["Toggle"] = "切换",
	["Toggle the module on and off."] = "切换此模块的打开与关闭。",
} end)


L:RegisterTranslations("koKR", function() return {
    ["UrlCopy"] = "URL 복사",
    ["URL formating options."] = "URL 형식 설정입니다.",
    ["Show Brackets"] = "괄호 표시",
    ["Toggle showing brackets on and off."] = "괄호 표시 켜고 끄기를 전환합니다.",
    ["Use Popup"] = "팝업 사용",
    ["Use popup window to show URL."] = "URL 표시를 위한 팝업창을 사용합니다.",
    ["Color URL"] = "색상 URL",
    ["Toggle the URL color on and off."] = "URL 색상 켜고 끄기를 전환합니다.",
    ["Set Color"] = "색상 설정",
    ["Change the color of the URL."] = "URL의 색상을 변경합니다.",
    ["Toggle"] = "전환",
    ["Toggle the module on and off."] = "모듈 켜고 끄기를 전환합니다.",
} end)

Prat_UrlCopy = Prat:NewModule("urlcopy")

function Prat_UrlCopy:OnInitialize()
    self.db = Prat:AcquireDBNamespace("UrlCopy")
    Prat:RegisterDefaults("UrlCopy", "profile", {
        on = true,
        bracket = true,
        popup = true,
        colorurl = true,
        color = {
            r = 1,
            g = 1,
            b = 1,
        },
    })
    Prat.Options.args.urlcopy = {
        name = L["UrlCopy"],
        desc = L["URL formating options."],
        type = "group",
        args = {
            bracket = {
                name = L["Show Brackets"],
                desc = L["Toggle showing brackets on and off."],
                type = "toggle",
                order = 160,
                get = function() return self.db.profile.bracket end,
                set = function(v) self.db.profile.bracket = v end,
            },
            popup = {
                name = L["Use Popup"],
                desc = L["Use popup window to show URL."],
                type = "toggle",
                order = 170,
                get = function() return self.db.profile.popup end,
                set = function(v) self.db.profile.popup = v end,
            },
            colorurl = {
                name = L["Color URL"],
                desc = L["Toggle the URL color on and off."],
                type = "toggle",
                order = 180,
                get = function() return self.db.profile.colorurl end,
                set = function(v) self.db.profile.colorurl = v end
            },
            setcolor = {
                name = L["Set Color"],
                desc = L["Change the color of the URL."],
                type = "color",
                order = 190,
                get = function() return self.db.profile.color.r, self.db.profile.color.g, self.db.profile.color.b end,
                set = function(r, g, b, a) self.db.profile.color.r, self.db.profile.color.g, self.db.profile.color.b = r, g, b end,
                disabled = function() if not self.db.profile.colorurl then return true else return false end end,
            },
            toggle = {
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                type = "toggle",
                order = 200,
                get = function() return self.db.profile.on end,
                set = function(v) self.db.profile.on = Prat:ToggleModuleActive("urlcopy") end
            },
        }
    }
end


function Prat_UrlCopy:OnEnable()
    for i=1,NUM_CHAT_WINDOWS do
        self:Hook(getglobal("ChatFrame"..i), "AddMessage")
    end

    self:Hook("SetItemRef")
end

-- Hook
function Prat_UrlCopy:AddMessage(frame, text, ...)
    if text then
        text = Prat_UrlCopy:ProcessText (text)
    end
    self.hooks[frame].AddMessage(frame, text, unpack(arg))
end

function Prat_UrlCopy:SetItemRef(link, text, button)
    if ( strsub(link, 1, 3) == "url" ) then
        Prat_UrlCopy:ShowUrl(link)
    else
        self.hooks.SetItemRef(link, text, button);
    end
end

-- Utility Function
function Prat_UrlCopy:Link (link)
    local returnedLink = " "

    if self.db.profile.colorurl then
        local color = string.format("%02x%02x%02x", self.db.profile.color.r*255, self.db.profile.color.g*255, self.db.profile.color.b*255)
        returnedLink = " |cff" .. color
    end

    returnedLink = returnedLink .. "|Hurl:" .. link .. "|h"

    if ( self.db.profile.bracket ) then
        returnedLink = returnedLink .. "[" .. link .. "]"
    else
        returnedLink = returnedLink .. link
    end

    returnedLink = returnedLink .. "|h|r "

    return returnedLink
end

function Prat_UrlCopy:ProcessText(text)
    text = Prat_UrlCopy:Decompose(text)

    return text
end

function Prat_UrlCopy:Decompose (chatstring)
    if chatstring ~= nil then
        -- www.X.Y url
        chatstring = string.gsub (chatstring, " www%.([_A-Za-z0-9-]+)%.(%S+)%s?", Prat_UrlCopy:Link ("www.%1.%2"))

        -- X://Y url
        chatstring = string.gsub (chatstring, " (%a+)://(%S+)%s?", Prat_UrlCopy:Link ("%1://%2"))

        -- X@X.Y url (---> email)
        chatstring = string.gsub (chatstring, " ([_A-Za-z0-9-%.]+)@([_A-Za-z0-9-]+)%.([_A-Za-z0-9-%.]+)%s?", Prat_UrlCopy:Link ("%1@%2.%3"))

        -- XXX.YYY.ZZZ.WWW:VVVV url (IP of ts server for example)
        chatstring = string.gsub (chatstring, " (%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?):(%d%d?%d?%d?%d?)%s?", Prat_UrlCopy:Link ("%1.%2.%3.%4:%5"))

        -- XXX.YYY.ZZZ.WWW url (---> IP)
        chatstring = string.gsub (chatstring, " (%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%s?", Prat_UrlCopy:Link ("%1.%2.%3.%4"))

        -- X.Y.Z url
        chatstring = string.gsub (chatstring, " ([_A-Za-z0-9-]+)%.([_A-Za-z0-9-]+)%.(%S+)%s?", Prat_UrlCopy:Link ("%1.%2.%3"))

        -- X.Y.Z:WWWW url  (ts server for example)
        chatstring = string.gsub (chatstring, " ([_A-Za-z0-9-]+)%.([_A-Za-z0-9-]+)%.(%S+)%:([_0-9-]+)%s?", Prat_UrlCopy:Link ("%1.%2.%3:%4"))

    end
    return chatstring
end

function Prat_UrlCopy:StaticPopupUrl(link)
    StaticPopupDialogs["SHOW_URL"] = {
        text = "URL : %s",
        button2 = TEXT(ACCEPT),
        hasEditBox = 1,
        hasWideEditBox = 1,
        showAlert = 1, -- HACK : it"s the only way I found to make de StaticPopup have sufficient width to show WideEditBox :(

        OnShow = function()
            local editBox = getglobal(this:GetName().."WideEditBox");
            editBox:SetText(format(link));
            editBox:SetFocus();
            editBox:HighlightText(0);

            local button = getglobal(this:GetName().."Button2");
            button:ClearAllPoints();
            button:SetWidth(200);
            button:SetPoint("CENTER", editBox, "CENTER", 0, -30);

            getglobal(this:GetName().."AlertIcon"):Hide();  -- HACK : we hide the false AlertIcon
        end,

        OnHide = function() end,
        OnAccept = function() end,
        OnCancel = function() end,
        EditBoxOnEscapePressed = function() this:GetParent():Hide(); end,
        timeout = 0,
        whileDead = 1,
        hideOnEscape = 1
    };

    StaticPopup_Show ("SHOW_URL", link);
end

function Prat_UrlCopy:EditBoxUrl(link)
    if (not ChatFrameEditBox:IsShown()) then
        ChatFrame_OpenChat(link, DEFAULT_CHAT_FRAME);
    else
        ChatFrameEditBox:Insert(link);
    end
end

function Prat_UrlCopy:ShowUrl(link)
    link = strsub(link, 5)
    if ( self.db.profile.popup ) then
        Prat_UrlCopy:StaticPopupUrl(link)
    else
        Prat_UrlCopy:EditBoxUrl(link)
    end
end
