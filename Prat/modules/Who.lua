--[[
Name: Prat_Who
Revision: $Revision: 16019 $
Author(s): Krtek (krtek4@gmail.com)
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Who
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that makes it easy to copy URL"s in chat windows.
Dependencies: Prat
]]

PRAT_WHO_FRAME_HEIGHT = 16
LIST_TO_DISPLAY = 20

local L = AceLibrary("AceLocale-2.2"):new("PratWho")

L:RegisterTranslations("enUS", function() return {
    ["Who"] = true,
    ["Adds actions for channels and /chatwho."] = true,
    ["List user(s) on channel."] = true,
    ["<channel name> (see /PRAT who chanlist)"] = true,
    ["Chanlist"] = true,
    ["Channel List."] = true,
    ["Join message"] = true,
    ["Toggle showing of join message."] = true,
    ["Leave message"] = true,
    ["Toggle showing of leave message."] = true,
    ["GUI"] = true,
    ["Toggle showing information in a nice GUI or in default chat window."] = true,
	["Toggle"] = true,
	["Toggle the module on and off."] = true,

	["Channels listing"] = true,
	["Who is on that chan"] = true,
	["Back to channel list"] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["Who"] = "Who",
    ["Adds actions for channels and /chatwho."] = "Добавляет действия для каналов и /chatwho.",
    ["List user(s) on channel."] = "Список пользователей канала.",
    ["<channel name> (see /PRAT who chanlist)"] = "<название канала> (см.  /PRAT who chanlist)",
    ["Chanlist"] = "Chanlist",
    ["Channel List."] = "Список каналов.",
    ["Join message"] = "Сообщение присоединения",
    ["Toggle showing of join message."] = "Вкл/Выкл показ сообщения при присоед.",
    ["Leave message"] = "Сообщение ухода",
    ["Toggle showing of leave message."] = "Вкл/Выкл показ сообщения при уходе.",
    ["GUI"] = "GUI",
    ["Toggle showing information in a nice GUI or in default chat window."] = "Вкл/Выкл показать информации в хорошем GUI или в стандартном окне чата.",
	["Toggle"] = "Вкл/Выкл",
	["Toggle the module on and off."] = "Вкл/Выкл модуль.",

	["Channels listing"] = "Список каналов",
	["Who is on that chan"] = "Кто сейчас в этом канале",
	["Back to channel list"] = "Вернуться к списку каналов",
} end)

L:RegisterTranslations("zhCN", function() return {
	["Who"] = "查询",
	["Adds actions for channels and /chatwho."] = "输入/chatwho列出频道和聊天对象.",
	["List user(s) on channel."] = "列出频道中的用户。",
    ["<channel name> (see /PRAT who chanlist)"] = "<频道名称> (查看 /PRAT who chanlist)",
	["Chanlist"] = "频道列表",
	["Channel List."] = "频道列表。",
	["Join message"] = "加入信息",
	["Toggle showing of join message."] = "显示加入信息。",
	["Leave message"] = "离开信息",
	["Toggle showing of leave message."] = "显示离开信息。",
	["GUI"] = "图形界面",
	["Toggle showing information in a nice GUI or in default chat window."] = "在图形界面或默认聊天窗口显示信息。",
	["Toggle"] = "切换",
	["Toggle the module on and off."] = "切换此模块打开与关闭。",

	["Channels listing"] = "频道列表",
	["Who is on that chan"] = "在此频道查询",
	["Back to channel list"] = "返回频道列表",
} end)

L:RegisterTranslations("koKR", function() return {
	["Who"] = "누구",
	["Adds actions for channels and /chatwho."] = "채널 목록과 /chatwho에 대한 동작을 추가합니다.",
	["List user(s) on channel."] = "채널 사용자 목록입니다.",
	["<channel name> (see /PRAT who chanlist)"] = "<채널명> (명령어: /PRAT who chanlist)",
	["Chanlist"] = "채널목록",
	["Channel List."] = "채널 목록입니다.",
	["Join message"] = "참여 메세지",
	["Toggle showing of join message."] = "참여 메세지 표시를 전환합니다.",
	["Leave message"] = "나감 메세지",
	["Toggle showing of leave message."] = "나감 메세지 표시를 전환합니다.",
	["GUI"] = "GUI",
	["Toggle showing information in a nice GUI or in default chat window."] = "기본대화창이나 GUI 에 정보 표시를 전환합니다.",
	["Toggle"] = "전환",
	["Toggle the module on and off."] = "모듈 켜고 끄기를 전환합니다.",

	["Channels listing"] = "채널 목록",
	["Who is on that chan"] = "채널 접속 목록",
	["Back to channel list"] = "목록으로 돌아가기",
} end)

Prat_Who = Prat:NewModule("who")

function Prat_Who:OnInitialize()
    self.db = Prat:AcquireDBNamespace("Who")
    Prat:RegisterDefaults("Who", "profile", {
		on = true,
        join = false,
		leave = false,
		gui = true,
    })
	PratWhoFrame:RegisterForDrag("LeftButton");
    self.wantInfo = false;
    self.info = "";
    self.lastChannel = "";
    self.List = {};
    self.selectedInList = 1;
    Prat.Options.args.who = {
		name = L["Who"],
        desc = L["Adds actions for channels and /chatwho."],
		type = "group",
        args = {
	        who = {
		        name = L["Who"],
      	        desc = L["List user(s) on channel."],
       	        type = "text",
		        usage = L["<channel name> (see /PRAT who chanlist)"],
    			get = false,
	            set = function(v) Prat_Who:Who(v); end,
       			validate = function(v) return self:CheckChan(v); end,
	          	error = "%s is not a valid channel (see /PRAT who chanlist)",
    		},
		    chanlist = {
    			name = L["Chanlist"],
    		    desc = L["Channel List."],
          	 	type = "execute",
    	      	func = function(v) Prat_Who:ChannelList(v); end,
    	    },
		    join = {
    			name = L["Join message"],
    			desc = L["Toggle showing of join message."],
    			type = "toggle",
                get = function() return self.db.profile.join end,
                set = function(v)self.db.profile.join = v end,
    	    },
		    leave = {
    			name = L["Leave message"],
    			desc = L["Toggle showing of leave message."],
    			type = "toggle",
                get = function() return self.db.profile.leave end,
                set = function(v)self.db.profile.leave = v end,
    		},
		    gui = {
    			name = L["GUI"],
    			desc = L["Toggle showing information in a nice GUI or in default chat window."],
    			type = "toggle",
                get = function() return self.db.profile.gui end,
                set = function(v)self.db.profile.gui = v end,
    		},
            toggle = {
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                type = "toggle",
                order = 200,
                get = function() return self.db.profile.on end,
                set = function() self.db.profile.on = Prat:ToggleModuleActive("who") end
            }
 		}
    }
end

function Prat_Who:OnEnable()
    self:Hook("ChatFrame_OnEvent")
end

function Prat_Who:Who(channel)
	self.wantInfo = true;
	self.List = {};
	self.lastChannel = channel;

	ListChannelByName(channel);
end

function Prat_Who:ShowWho()
	for name in string.gfind(self.info, "([%S]+)[%s]*") do
      	table.insert(self.List, Prat_Who:BeautifyName(name))
   	end

	local function whoSort(a, b)
		local aWeight = 100
		if string.find(a, ".+%(owner%)") then aWeight = 0
		elseif string.find(a, ".+%(moderator%)") then aWeight = 50
		elseif string.find(a, ".+%(muted%)") then aWeight = 200
		end

		local bWeight = 100
		if string.find(b, ".+%(owner%)") then bWeight = 0
		elseif string.find(b, ".+%(moderator%)") then bWeight = 50
		elseif string.find(b, ".+%(muted%)") then bWeight = 200
		end

		if ( aWeight == bWeight ) then return a < b
		else return aWeight < bWeight
		end
	end

	table.sort(self.List, whoSort)

	if ( self.db.profile.gui ) then
		Prat_Who:UpdateFrame()
	else
		local text = ""
		for i,name in self.List do
	   		text = text .. name .. " "
		end
		text = "This feature is buggy for time, please use the GUI mode :D"
		Prat_Who:NotGuiShow(text)
	end
end

function Prat_Who:ChannelList()
	local chanList = self:GetChannelList();

	self.List = {}
	for number, name in chanList do
		table.insert(self.List, number .. ". " .. name);
	end

	if ( self.db.profile.gui ) then
		Prat_Who:UpdateFrame()
	else
		local text = ""
		for i,name in self.List do
   			text = text .. name .. " "
		end
		Prat_Who:NotGuiShow(text)
	end
end

function Prat_Who:GetChannelList()
	self.lastChannel = "";
	local chanList = {};

	local id, name
   	for i=1, 10 do
   		id, name = GetChannelName(i)
   		if ( id > 0 and name ) then table.insert(chanList, id, name) end
   	end

	return chanList
end

function Prat_Who:CheckChan(channel)
	local id, name = GetChannelName(channel)
   	if ( id > 0 and name ) then return true
   	else return false end
end

-- The Hooking method isn"t good if some other addons need the information that are kept :(
function Prat_Who:ChatFrame_OnEvent(event)
	if ( ( event == "CHAT_MSG_CHANNEL_LIST" ) and self.wantInfo) then
		self.info = arg1

		if not ( strsub(self.info,1,1) == "[" ) then
			self:ShowWho()
		end

		return;
	end;

	if ( event == "CHAT_MSG_CHANNEL_JOIN" and self.db.profile.join and not self.db.profile.leave ) then
		return;
	end

	if ( event == "CHAT_MSG_CHANNEL_LEAVE"  and self.db.profile.leave ) then
		return;
	end

	self.hooks.ChatFrame_OnEvent(event);
end

-- Utility function
local beautifyTable = {
	{ pattern = "%*(.+)", replacement = "%1 (owner)", patternB = "(.+) %(owner%)", replacementB = "%1" },
	{ pattern = "@(.+)", replacement = "%1 (moderator)", patternB = "(.+) %(moderator%)", replacementB = "%1" },
	{ pattern = "#(.+)", replacement = "%1 (muted)", patternB = "(.+) %(muted%)", replacementB = "%1" },
}

function Prat_Who:BeautifyName(name)
-- * channel owner, @ channel moderator, # muted/unvoiced.
	name = string.gsub(name, ",", "");

	for id, option in beautifyTable do
		name = string.gsub(name, option["pattern"], option["replacement"]);
	end
	
	return name
end

function Prat_Who:DebeautifyName(name)
	for id, option in beautifyTable do
		name = string.gsub(name, option["patternB"] , option["replacementB"]);
	end

	return name
end

function Prat_Who:Invite()
	InviteByName(Prat_Who:DebeautifyName(self.List[self.selectedInList]));
end

function Prat_Who:Whisper()
	local name = Prat_Who:DebeautifyName(self.List[self.selectedInList]);
	if ( not ChatFrameEditBox:IsVisible() ) then
		ChatFrame_OpenChat("/w "..name.." ");
	else
		ChatFrameEditBox:SetText("/w "..name.." ");
	end
	ChatEdit_ParseText(ChatFrame1.editBox, 0);
end

-- Frame function
function Prat_Who:NotGuiShow(text)
	Prat:Print(tostring(text))
end

function Prat_Who:HideFrame()
	PratWhoFrame:Hide();
	Prat_Who.wantInfo = false;
end

function Prat_Who:UpdateFrame()
	local listLength = table.getn(self.List)
	local listOffset = FauxScrollFrame_GetOffset(PratWhoScrollFrame);
	local listIndex;
	local listButton;

	if ( not PratWhoFrame:IsVisible() ) then
		PratWhoFrame:Show();
		self.selectedInList = 1;
	end

	if ( self.lastChannel == "" ) then
		PratWhoTitle:SetText(L["Channels listing"]);
		PratWhoInviteButton:Hide();
		PratWhoWhisperButton:Hide();
		PratWhoToggleButton:SetText(L["Who is on that chan"]);
	else
		local id, name = GetChannelName(self.lastChannel)
		PratWhoTitle:SetText(listLength .. " users on " .. id .. ". " .. name);
		PratWhoInviteButton:Show();
		PratWhoWhisperButton:Show();
		PratWhoToggleButton:SetText(L["Back to channel list"]);
	end

	for i=1, LIST_TO_DISPLAY, 1 do
		listIndex = i + listOffset

		listButton = getglobal("PratWhoButton"..i);

		if ( listIndex > listLength ) then
			listButton:Hide();
		else
			listButton:SetID(listIndex);

			if ( listIndex == self.selectedInList ) then
				listButton:LockHighlight();
			else
				listButton:UnlockHighlight();
			end

			local name = self.List[listIndex]

			if Prat_PlayerNames then
				local nameBis = string.gsub(name, "(.+) %(.+%)", "%1")
				local nameColored = Prat_PlayerNames:addInfo(nameBis)
				name = string.gsub(name, nameBis, nameColored)
			end

			getglobal("PratWhoButton"..i.."ButtonTextName"):SetText(name);
			listButton:Show();
		end

	end

	FauxScrollFrame_Update(PratWhoScrollFrame, listLength, LIST_TO_DISPLAY, PRAT_WHO_FRAME_HEIGHT );
end

function Prat_Who:RefreshFrame()
	if ( self.lastChannel == "" ) then
		Prat_Who:ChannelList();
	else
		Prat_Who:Who(self.lastChannel);
	end
end

function Prat_Who:Button_OnClick()
	self.selectedInList = this:GetID();
	Prat_Who:UpdateFrame()
end

function Prat_Who_UpdateFrame() -- FauxScrollFrame_OnVerticalScroll() seems to doesn"t accept member function, so I have to declare this one
	Prat_Who:UpdateFrame()
end

function Prat_Who:ToggleChanListWho()
	if ( self.lastChannel ~= "" ) then
		self.lastChannel = ""
	else
		self.lastChannel = string.gsub(self.List[self.selectedInList], "(%d+)%..+", "%1")
	end

	Prat_Who:RefreshFrame()
end
