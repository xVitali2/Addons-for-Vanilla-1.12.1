--[[
Name: Prat_ChatLink
Revision: $Revision: 16019 $
Author(s): Krtek (krtek4@gmail.com)
Inspired by: Cirk's Chatmanager by Cirk
             ChatLink by Yrys
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#ChatLink
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that shows item links in chat channels.
Dependencies: Prat
]]

local L = AceLibrary("AceLocale-2.2"):new("PratChatLink")

L:RegisterTranslations("enUS", function() return {
    ["ChatLink"] = true,
    ["Chat channel item link options."] = true,
    ["ChatManager"] = true,
    ["Toggle sending items in Cirk\" ChatManager format."] = true,
    ["Toggle sending items in ChatLink format."] = true,
    ["Toggle"] = true,
    ["Toggle the module on and off."] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["ChatLink"] = "ChatLink",
    ["Chat channel item link options."] = "Опции ссылки предмета в канале чата.",
    ["ChatManager"] = "ChatManager",
    ["Toggle sending items in Cirk\" ChatManager format."] = "Вкл/Выкл ChatManager формат отправки предмета.",
    ["Toggle sending items in ChatLink format."] = "Вкл/Выкл отправку предмета в ChatLink формат.",
    ["Toggle"] = "Вкл/Выкл",
    ["Toggle the module on and off."] = "Вкл/Выкл модуль",
} end)

L:RegisterTranslations("zhCN", function() return {
	["ChatLink"] = "聊天链接",
	["Chat channel item link options."] = "聊天频道物品链接选项。",
	["ChatManager"] = "聊天管理",
	["Toggle sending items in Cirk\" ChatManager format."] = "切换以 Cirk\" 聊天管理模式发送物品。",
	["Toggle sending items in ChatLink format."] = "切换聊天链接物品发送格式。",
	["Toggle"] = "切换",
	["Toggle the module on and off."] = "切换此功能的打开与关闭。",
} end)


L:RegisterTranslations("koKR", function() return {
    ["ChatLink"] = "대화링크",
    ["Chat channel item link options."] = "대화 채널 아이템 링크 설정입니다.",
--    ["ChatManager"] = true,
    ["Toggle sending items in Cirk\" ChatManager format."] = "Cirk\" Chatmanager 형식으로 아이템 보내기를 전환합니다.",
    ["Toggle sending items in ChatLink format."] = "ChatLink 형식으로 아이템 보내기를 전환합니다.",
    ["Toggle"] = "전환",
    ["Toggle the module on and off."] = "모듈 켜고 끄기를 전환합니다.",
} end)

Prat_ChatLink = Prat:NewModule("chatlink")

function Prat_ChatLink:OnInitialize()
    self.db = Prat:AcquireDBNamespace("ChatLink")
    Prat:RegisterDefaults("ChatLink", "profile", {
        on = true,
        clink = true,
        chatmanager = false,
    })
    Prat.Options.args.chatlink = {
        name = L["ChatLink"],
        desc = L["Chat channel item link options."],
        type = "group",
        args = {
            cm = {
                name = L["ChatManager"],
                desc = L["Toggle sending items in Cirk\" ChatManager format."],
                type = "toggle",
                get = function() return self.db.profile.chatmanager end,
                set = function(v) self.db.profile.clink = not v;  self.db.profile.chatmanager = v end
            },
            clink = {
                name = L["ChatLink"],
                desc = L["Toggle sending items in ChatLink format."],
                type = "toggle",
                get = function() return self.db.profile.clink end,
                set = function(v) self.db.profile.clink = v;  self.db.profile.chatmanager = not v end
            },
            toggle = {
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                type = "toggle",
                order = 200,
                get = function() return self.db.profile.on end,
                set = function(v) self.db.profile.on = Prat:ToggleModuleActive("chatlink") end
            },
        }
    }
end

function Prat_ChatLink:OnEnable()
    for i=1,NUM_CHAT_WINDOWS do
        self:Hook(getglobal("ChatFrame"..i), "AddMessage")
    end

    self:Hook("SendChatMessage")
end

-- Hook
function Prat_ChatLink:AddMessage(frame, text, ...)
    text = Prat_ChatLink:ProcessText (text)
    self.hooks[frame].AddMessage(frame, text, unpack(arg))
end

function Prat_ChatLink:SendChatMessage(msg, chatType, language, channel)
    if msg and (chatType == "CHANNEL") then
        local _, chanName = GetChannelName(channel)
        if chanName and
            not string.find (chanName, "General - ") and
            not string.find (chanName, "Trade - ") and
            not string.find (chanName, "LookingForGroup") and
            not string.find (chanName, "LocaleDefense - ") and
            not string.find (chanName, "WorldDefense")
        then
            msg = Prat_ChatLink:CreateLink(msg);
        end
    end
    self.hooks.SendChatMessage(msg, chatType, language, channel)
end

-- Utility Function
function Prat_ChatLink:ProcessText(text)
    if text then
        -- Chatmanager [Thick Furry Mane]{4583:0:0:0}
        text = Prat_ChatLink:DecomposeCMLink(text, "%[([^%[^%]]-)%]{(%d+):(%d+):(%d+):(%d+)}(\b*)")
        -- CLINK {CLINK:ff9d9d9d:4583:0:0:0:Thick Furry Mane}
        text = string.gsub (text, "{CLINK:(%x+):(%d-):(%d-):(%d-):(%d-):([^}]-)}", "|c%1|Hitem:%2:%3:%4:%5|h[%6]|h|r")
    end
    return text
end

function Prat_ChatLink:CreateLink(link)
    local pattern = "|c(%x+)|Hitem:(%d+):(%d+):(%d+):(%d+)|h%[(.-)%]|h|r"
    if (self.db.profile.clink) then return string.gsub(link, pattern, "{CLINK:%1:%2:%3:%4:%5:%6}")
    elseif (self.db.profile.chatmanager) then return Prat_ChatLink:CreateCMLink(link, pattern)
    else return link end
end

-- Inspired from Cirk"s Chatmanager
local _rarityConvertToColor = {}
local _rarityLookupByColor = {}

for rarity = 0, 6 do
    local _, _, _, itemColor = GetItemQualityColor(rarity);
    if (itemColor) then
        _rarityConvertToColor[rarity] = itemColor;
        _rarityLookupByColor[string.sub(itemColor, 3)] = rarity;
    end
end

function Prat_ChatLink:DecomposeCMLink(link, pattern)
    local function gsubDecomposeCMLink(name, i1, i2, i3, i4, rS)
        local itemString = "item:"..i1..":"..i2..":"..i3..":"..i4;
        local itemName, itemLink, itemRarity = GetItemInfo(itemString);
        if (itemName and itemLink and itemRarity) then
            local itemColor = _rarityConvertToColor[tonumber(itemRarity)];
            if (not itemColor) then
                itemColor = "";
            end
            return itemColor.."|H"..itemLink.."|h["..itemName.."]|h|r";
        end
        itemRarity = string.len(rS) - 1;
        if (itemRarity >= 0) then
            local itemColor = _rarityConvertToColor[tonumber(itemRarity)];
            if (not itemColor) then
                itemColor = "";
            end
            return itemColor.."|H"..itemString.."|h["..name.."]|h|r";
        end
        return "|H"..itemString.."|h["..name.."]|h|r";
    end
    return string.gsub(link, pattern, gsubDecomposeCMLink)
end

function Prat_ChatLink:CreateCMLink(link, pattern)
    local function gsubCMLink(cS, i1, i2, i3, i4, name)
        local itemString = "item:"..i1..":"..i2..":"..i3..":"..i4;
        local _, _, itemRarity = GetItemInfo(itemString);
        if (not itemRarity) then
            -- Perform reverse color lookup to get rarity instead
            itemRarity = _rarityLookupByColor[cS];
        end
        if (itemRarity) then
            return "["..name.."]{"..i1..":"..i2..":"..i3..":"..i4.."}"..string.rep("\b", tonumber(itemRarity) + 1);
        end
        return "["..name.."]{"..i1..":"..i2..":"..i3..":"..i4.."}";
    end
    return string.gsub(link, pattern, gsubCMLink)
end
