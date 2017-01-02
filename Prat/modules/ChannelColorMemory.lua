--[[
Name: Prat_ChannelColorMemory
Revision: $Revision: 16019 $
Author(s): Sylvanaar
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#ChannelColorMemory
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that remembers the colors of channels by channel name
Dependencies: Prat

Credit goes to: ConsisTint By Karl Isenberg (AnduinLothar)
]]

local L = AceLibrary("AceLocale-2.2"):new("ChannelColorMemory")

L:RegisterTranslations("enUS", function() return {
    ["ChannelColorMemory"] = true,
    ["Remembers the colors of channels by channel name."] = true,
    ["(%w+)%s?(.*)"] = true,
    ["Toggle"] = true,
    ["Toggle the module on and off."] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["ChannelColorMemory"] = "ChannelColorMemory",
    ["Remembers the colors of channels by channel name."] = "Запоминает цвета каналов по названию канала.",
    ["(%w+)%s?(.*)"] = "(%w+)%s?(.*)",
    ["Toggle"] = "Вкл/Выкл",
    ["Toggle the module on and off."] = "Вкл/Выкл модуль.",
} end)

L:RegisterTranslations("zhCN", function() return {
	["ChannelColorMemory"] = "频道颜色储存",
    ["Remembers the colors of channels by channel name."] = "还原频道名称的颜色设置",
	["(%w+)%s?(.*)"] = "(%w+)%s?(.*)",
	["Toggle"] = "切换",
	["Toggle the module on and off."] = "切换此模块的打开与关闭。",
} end)

L:RegisterTranslations("koKR", function() return {
    ["ChannelColorMemory"] = "채널 색상 기억",
    ["Remembers the colors of channels by channel name."] = "채널명에 따른 채널의 색상을 기억합니다.",
    ["(%w+)%s?(.*)"] = "(.+)%s?(.*)",
    ["Toggle"] = "전환",
    ["Toggle the module on and off."] = "모듈 켜고 끄기 전환",
} end)

Prat_ChannelColorMemory = Prat:NewModule("ChannelColorMemory")

function Prat_ChannelColorMemory:OnInitialize()
    self.db = Prat:AcquireDBNamespace("ChannelColorMemory")
    Prat:RegisterDefaults("ChannelColorMemory", "profile", {
        on = true,
        colors = {},
    })
    Prat.Options.args.ChannelColorMemory = {
        name = L["ChannelColorMemory"],
        desc = L["Remembers the colors of channels by channel name."],
        type = "group",
        args = {
            Toggle = {
                type = "toggle",
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                get = function() return self.db.profile.on end,
                set = function(v) self.db.profile.on = Prat:ToggleModuleActive("ChannelColorMemory") end
            },
        }
    }
end

function Prat_ChannelColorMemory:OnEnable()
	self:RegisterEvent("UPDATE_CHAT_COLOR")
	self:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE")
end
function Prat_ChannelSeparator:OnDisable()
	self:UnregisterEvent("UPDATE_CHAT_COLOR")
	self:UnregisterEvent("CHAT_MSG_CHANNEL_NOTICE")
end


function Prat_ChannelColorMemory:UPDATE_CHAT_COLOR(ChatType, cr,cg,cb)
	if (ChatType) then
			local number = string.gfind(arg1, "CHANNEL(%d+)")()
			if ( number ) then
				local _, name = GetChannelName(number);
				if ( name ) then
					local name, zoneSuffix = string.gfind(name, L["(%w+)%s?(.*)"])();
					
					local color = self.db.profile.colors[name];
					if (not color) then
						self.db.profile.colors[name] = {r=cr, g=cg, b=cb};
					else
						color.r=cr
						color.g=cg
						color.b=cb
					end
				end
			end
	end
end

function Prat_ChannelColorMemory:CHAT_MSG_CHANNEL_NOTICE(NoticeType,a2,a3,LongName,a5,a6,a7,number, cname)
	if (not strfind(LongName, "%d+%. .*")) then
		return;
	elseif (arg1 == "YOU_JOINED") then
		local name, zoneSuffix = string.gfind(cname, L["(%w+)%s?(.*)"])();
		local color = self.db.profile.colors[name];
		if (color) then
			ChangeChatColor("CHANNEL"..number, color.r, color.g, color.b);
		else
			color = ChatTypeInfo["CHANNEL"..number];
			self.db.profile.colors[name] = {r=color.r, g=color.g, b=color.b};
		end
	end
end





