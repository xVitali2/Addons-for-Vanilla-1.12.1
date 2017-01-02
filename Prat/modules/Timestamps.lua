--[[
Name: Prat_Timestamps
Revision: $Revision: 16065 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Inspired by: idChat2_Timestamps by Industrial
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Timestamps
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that adds timestamps to chat windows (default=on).
Dependencies: Prat
]]

local L = AceLibrary("AceLocale-2.2"):new("PratTimestamps")

L:RegisterTranslations("enUS", function() return {
    ["Timestamps"] = true,
    ["Timestamp options."] = true,
    ["ShowMode"] = true,
    ["Choose mode for showing timestamps."] = true,
    ["All"] = true,
    ["Individual"] = true,
    ["Show"] = true,
    ["Toggle showing timestamp settings for each window."] = true,
    ["Chat%dTimestampShow"] = true,
    ["Toggles timestamp on and off for chat window %d."] = true,
    ["ShowAll"] = true,
	["Toggles timestamp on and off for all chat windows."] = true,
    ["FormatMode"] = true,
    ["Choose mode for setting timestamps."] = true,
    ["Format"] = true,
    ["Format the timestamp format for each window."] = true,
    ["Chat%dTimestampFormat"] = true,
    ["Set timestamp format for chat window %d (strftime format)."] = true,
    ["FormatAll"] = true,
    ["Set timestamp format for all chat windows (strftime format)."] = true,
    ["Show Space"] = true,
    ["Toggle adding space after timestamp."] = true,
    ["Color Timestamp"] = true,
    ["Toggle the coloring the timestamp on and off."] = true,
    ["Set Color"] = true,
    ["Change the color of the timestamp."] = true,
	["Use Local Time"] = true,
    ["Toggle using local time on and off."] = true,
    ["Toggle"] = true,
    ["Toggle the module on and off."] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["Timestamps"] = "Timestamps",
    ["Timestamp options."] = "Настройки времени",
    ["ShowMode"] = "Показать режим",
    ["Choose mode for showing timestamps."] = "Выберите режим для показа времени.",
    ["All"] = "Все",
    ["Individual"] = "Индивидуальный ",
    ["Show"] = "Показать",
    ["Toggle showing timestamp settings for each window."] = "Вкл/Выкл показ настроек времени для каждого окна.",
    ["Chat%dTimestampShow"] = "ПоказатьВремяЧата%d",
    ["Toggles timestamp on and off for chat window %d."] = "Вкл/Выкл время для окна чата %d.",
    ["ShowAll"] = "Показать все",
	["Toggles timestamp on and off for all chat windows."] = "Вкл/Выкл время для всех окон чата.",
    ["FormatMode"] = "ФорматРежим",
    ["Choose mode for setting timestamps."] = "Выберите режим для задания времени.",
    ["Format"] = "Формат",
    ["Format the timestamp format for each window."] = "Форматировать формат времени для каждого окна.",
    ["Chat%dTimestampFormat"] = "ФорматВремениЧата%d",
    ["Set timestamp format for chat window %d (strftime format)."] = "Установить формат времени для окна чата %d.",
    ["FormatAll"] = "ФорматВсего",
    ["Set timestamp format for all chat windows (strftime format)."] = "Установить формат времени для всех окон чата.",
    ["Show Space"] = "Показать пробел",
    ["Toggle adding space after timestamp."] = "Вкл/Выкл добавление пробела после времени.",
    ["Color Timestamp"] = "Цвет времени",
    ["Toggle the coloring the timestamp on and off."] = "Вкл/Выкл окраску времени.",
    ["Set Color"] = "Установить цвет",
    ["Change the color of the timestamp."] = "Изменить цвет времени.",
	["Use Local Time"] = "Использовать часовой пояс",
    ["Toggle using local time on and off."] = "Вкл/Выкл использование локального времени.",
    ["Toggle"] = "Вкл/Выкл",
    ["Toggle the module on and off."] = "Вкл/Выкл модуль.",
} end)

L:RegisterTranslations("zhCN", function() return {
	["Timestamps"] = "时间",
	["Timestamp options."] = "聊天时间显示选项。",
	["ShowMode"] = "显示模式",
	["Choose mode for showing timestamps."] = "选择聊天窗口显示时间模式。",
    ["All"] = "全部",
    ["Individual"] = "独立",
    ["Show"] = "显示",
	["Toggle showing timestamp settings for each window."] = "切换每一聊天窗口切换显示时间标签设置。",
	["Chat%dTimestampShow"] = "窗口%d时间显示",
	["Toggles timestamp on and off for chat window %d."] = "切换聊天窗口%d时间显示功能打开与关闭。",
    ["ShowAll"] = "全部显示",
	["Toggles timestamp on and off for all chat windows."] = "切换所有聊天窗口时间显示的打开与关闭。",
	["FormatMode"] = "格式模式",
	["Choose mode for setting timestamps."] = "选择时间标签的格式设置。",
	["Format"] = "格式化",
	["Format the timestamp format for each window."] = "格式化每一窗口的时间显示。",
    ["Chat%dTimestampFormat"] = "窗口%d时间格式",
    ["Set timestamp format for chat window %d (strftime format)."] = "设置窗口%d的时间格式 (strftime格式)。",
    ["FormatAll"] = "全部格式",
    ["Set timestamp format for all chat windows (strftime format)."] = "设置全部窗口的时间格式 (strftime 格式)。",
    ["Show Space"] = "空格",
    ["Toggle adding space after timestamp."] = "切换时间标签后的空格。",
	["Color Timestamp"] = "颜色",
	["Toggle the coloring the timestamp on and off."] = "切换时间标签颜色功能打开与关闭。",
    ["Set Color"] = "设置颜色",
	["Change the color of the timestamp."] = "更改时间标签颜色.",
	["Use Local Time"] = "本地时间",
    ["Toggle using local time on and off."] = "切换服务器时间和本地时间.",
	["Toggle"] = "切换",
	["Toggle the module on and off."] = "切换此模块的打开与关闭。",
} end)

L:RegisterTranslations("koKR", function() return {
    ["Timestamps"] = "타임스탬프",
    ["Timestamp options."] = "타임스탬프 설정입니다.",
    ["ShowMode"] = "표시 모드",
    ["Choose mode for showing timestamps."] = "타임스탬프 표시에 대한 모드를 선택합니다.",
    ["All"] = "모두",
    ["Individual"] = "개별",
    ["Show"] = "표시",
    ["Toggle showing timestamp settings for each window."] = "각 창에 대한 타임스탬프 표시 전환",
    ["Chat%dTimestampShow"] = "대화%d 타임스탬프 표시",
    ["Toggles timestamp on and off for chat window %d."] = "대화창%d에 대한 타임스템프를 켜고 끄기를 전환합니다.",
    ["ShowAll"] = "모두 표시",
	["Toggles timestamp on and off for all chat windows."] = "모든 대화창에 대한 타임스탬프 켜고 끄기를 전환합니다.",
    ["FormatMode"] = "형식 모드",
    ["Choose mode for setting timestamps."] = "타임스탬프 설정에 대한 모드를 선택합니다.",
    ["Format"] = "형식",
    ["Format the timestamp format for each window."] = "각 창에 대한 타임스탬프 형식을 설정합니다.",
    ["Chat%dTimestampFormat"] = "대화%d 타임스탬프 형식",
    ["Set timestamp format for chat window %d (strftime format)."] = "대화창 %d에 대한 타임스탬프 형식을 설정합니다(strftime format).",
    ["FormatAll"] = "모든 형식",
    ["Set timestamp format for all chat windows (strftime format)."] = "모든 대화창에 대한 타임스탬프 형식을 설정합니다(strftime format).",
    ["Show Space"] = "빈칸 표시",
    ["Toggle adding space after timestamp."] = "타임스탬프 다음에 빈 칸 추가를 전환합니다.",
    ["Color Timestamp"] = "타임스탬프 색상",
    ["Toggle the coloring the timestamp on and off."] = "타임스탬프 색상 켜고 끄기를 전환합니다.",
    ["Set Color"] = "색상 설정",
    ["Change the color of the timestamp."] = "타임스탬프의 색상을 변경합니다.",
	["Use Local Time"] = "로컬 시간 사용",
    ["Toggle using local time on and off."] = "로컬 시간 사용 켜고 끄기를 전환합니다.",
    ["Toggle"] = "전환",
    ["Toggle the module on and off."] = "모듈 켜고 끄기를 전환합니다.",
} end)

Prat_Timestamps = Prat:NewModule("timestamps")

function Prat_Timestamps:OnInitialize()
    self.db = Prat:AcquireDBNamespace("Timestamps")
    Prat:RegisterDefaults("Timestamps", "profile", {
        on = true,
        showmode = "ALL",
        show = {true, true, true, true, true, true, true},
        showall = true,
        formatmode = "ALL",
        format = {"%X", "%X", "%X", "%X", "%X", "%X", "%X"},
        formatall = "%X",
        colortimestamp = true,
        color = {
            r = 1,
            g = 1,
            b = 1
        },
        space = true,
        localtime = true
    })
    Prat.Options.args.timestamps = {
        name = L["Timestamps"],
        desc = L["Timestamp options."],
        type = "group",
        args = {
            showmode = {
                name = L["ShowMode"],
                desc = L["Choose mode for showing timestamps."],
                type = "text",
                order = 100,
                get = function() return self.db.profile.showmode end,
                set = function(v) self.db.profile.showmode = v end,
                validate = {["ALL"] = L["All"], ["INDIVIDUAL"] = L["Individual"]}
            },
            show = {
                name = L["Show"],
                desc = L["Toggle showing timestamp settings for each window."],
                type = "group",
                order = 110,
                args = {
                    chat1 = {
                        name = string.format(L["Chat%dTimestampShow"], 1),
                        desc = string.format(L["Toggles timestamp on and off for chat window %d."], 1),
                        type = "toggle",
                        get = function() return self.db.profile.show[1] end,
                        set = function(v) self.db.profile.show[1] = v; self:SetFrameStatus(1) end
                    },
                    chat2 = {
                        name = string.format(L["Chat%dTimestampShow"], 2),
                        desc = string.format(L["Toggles timestamp on and off for chat window %d."], 2),
                        type = "toggle",
                        get = function() return self.db.profile.show[2] end,
                        set = function(v) self.db.profile.show[2] = v; self:SetFrameStatus(2) end
                    },
                    chat3 = {
                        name = string.format(L["Chat%dTimestampShow"], 3),
                        desc = string.format(L["Toggles timestamp on and off for chat window %d."], 3),
                        type = "toggle",
                        get = function() return self.db.profile.show[3] end,
                        set = function(v) self.db.profile.show[3] = v; self:SetFrameStatus(3) end
                    },
                    chat4 = {
                        name = string.format(L["Chat%dTimestampShow"], 4),
                        desc = string.format(L["Toggles timestamp on and off for chat window %d."], 4),
                        type = "toggle",
                        get = function() return self.db.profile.show[4] end,
                        set = function(v) self.db.profile.show[4] = v; self:SetFrameStatus(4) end
                    },
                    chat5 = {
                        name = string.format(L["Chat%dTimestampShow"], 5),
                        desc = string.format(L["Toggles timestamp on and off for chat window %d."], 5),
                        type = "toggle",
                        get = function() return self.db.profile.show[5] end,
                        set = function(v) self.db.profile.show[5] = v; self:SetFrameStatus(5) end
                    },
                    chat6 = {
                        name = string.format(L["Chat%dTimestampShow"], 6),
                        desc = string.format(L["Toggles timestamp on and off for chat window %d."], 6),
                        type = "toggle",
                        get = function() return self.db.profile.show[6] end,
                        set = function(v) self.db.profile.show[6] = v; self:SetFrameStatus(6) end
                    },
                    chat7 = {
                        name = string.format(L["Chat%dTimestampShow"], 7),
                        desc = string.format(L["Toggles timestamp on and off for chat window %d."], 7),
                        type = "toggle",
                        get = function() return self.db.profile.show[7] end,
                        set = function(v) self.db.profile.show[7] = v; self:SetFrameStatus(7) end
                    },
                },
                disabled = function() if self.db.profile.showmode == "ALL" then return true else return false end end,
            },
            showall = {
                name = L["ShowAll"],
                desc = L["Toggles timestamp on and off for all chat windows."],
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
            formatmode = {
                name = L["FormatMode"],
                desc = L["Choose mode for setting timestamps."],
                type = "text",
                order = 130,
                get = function() return self.db.profile.formatmode end,
                set = function(v) self.db.profile.formatmode = v end,
                validate = {["ALL"] = L["All"], ["INDIVIDUAL"] = L["Individual"]}
            },
            format = {
                name = L["Format"],
                desc = L["Format the timestamp format for each window."],
                type = "group",
                order = 140,
                args = {
		            chat1 = {
        		        name = string.format(L["Chat%dTimestampFormat"], 1),
                		desc = string.format(L["Set timestamp format for chat window %d (strftime format)."], 1),
		                type = "text",
        		        order = 150,
                		usage = "<string>",
		                get = function() return self.db.profile.format[1] end,
		                set = function(v) self.db.profile.format[1] = v end
        		    },
		            chat2 = {
        		        name = string.format(L["Chat%dTimestampFormat"], 2),
                		desc = string.format(L["Set timestamp format for chat window %d (strftime format)."], 2),
		                type = "text",
        		        order = 150,
                		usage = "<string>",
		                get = function() return self.db.profile.format[2] end,
        		        set = function(v) self.db.profile.format[2] = v end
        		    },
		            chat3 = {
        		        name = string.format(L["Chat%dTimestampFormat"], 3),
                		desc = string.format(L["Set timestamp format for chat window %d (strftime format)."], 3),
		                type = "text",
        		        order = 150,
                		usage = "<string>",
		                get = function() return self.db.profile.format[3] end,
        		        set = function(v) self.db.profile.format[3] = v end
        		    },
		            chat4 = {
        		        name = string.format(L["Chat%dTimestampFormat"], 4),
                		desc = string.format(L["Set timestamp format for chat window %d (strftime format)."], 4),
		                type = "text",
        		        order = 150,
                		usage = "<string>",
		                get = function() return self.db.profile.format[4] end,
        		        set = function(v) self.db.profile.format[4] = v end
        		    },
		            chat5 = {
        		        name = string.format(L["Chat%dTimestampFormat"], 5),
                		desc = string.format(L["Set timestamp format for chat window %d (strftime format)."], 5),
		                type = "text",
        		        order = 150,
                		usage = "<string>",
		                get = function() return self.db.profile.format[5] end,
        		        set = function(v) self.db.profile.format[5] = v end
        		    },
		            chat6 = {
        		        name = string.format(L["Chat%dTimestampFormat"], 6),
                		desc = string.format(L["Set timestamp format for chat window %d (strftime format)."], 6),
		                type = "text",
        		        order = 150,
                		usage = "<string>",
		                get = function() return self.db.profile.format[6] end,
        		        set = function(v) self.db.profile.format[6] = v end
        		    },
		            chat7 = {
        		        name = string.format(L["Chat%dTimestampFormat"], 7),
                		desc = string.format(L["Set timestamp format for chat window %d (strftime format)."], 7),
		                type = "text",
        		        order = 150,
                		usage = "<string>",
		                get = function() return self.db.profile.format[7] end,
        		        set = function(v) self.db.profile.format[7] = v end
        		    },
                },
                disabled = function() if self.db.profile.formatmode == "ALL" then return true else return false end end,
            },
            formatall = {
                name = L["FormatAll"],
                desc = L["Set timestamp format for all chat windows (strftime format)."],
                type = "text",
                order = 150,
                usage = "<string>",
                get = function() return self.db.profile.formatall end,
                set = function(v)
                    self.db.profile.formatall = v
                    for i=1,NUM_CHAT_WINDOWS do
                        self.db.profile.format[i] = v
                    end
                end,
                disabled = function() if self.db.profile.formatmode == "INDIVIDUAL" then return true else return false end end,
            },
            showspace = {
                name = L["Show Space"],
                desc = L["Toggle adding space after timestamp."],
                type = "toggle",
                order = 160,
                get = function() return self.db.profile.space end,
                set = function(v) self.db.profile.space = v end,
            },
            colortimestamp = {
                name = L["Color Timestamp"],
                desc = L["Toggle the coloring the timestamp on and off."],
                type = "toggle",
                order = 170,
                get = function() return self.db.profile.colortimestamp end,
                set = function(v) self.db.profile.colortimestamp = v end
            },
            setcolor = {
                name = L["Set Color"],
                desc = L["Change the color of the timestamp."],
                type = "color",
                order = 180,
                get = function() return self.db.profile.color.r, self.db.profile.color.g, self.db.profile.color.b end,
                set = function(r, g, b, a) self.db.profile.color.r, self.db.profile.color.g, self.db.profile.color.b = r, g, b end,
                disabled = function() if not self.db.profile.colortimestamp then return true else return false end end,
            },
            localtime = {
	            name = L["Use Local Time"],
                desc = L["Toggle using local time on and off."],
                type = "toggle",
                order = 190,
                get = function() return self.db.profile.localtime end,
                set = function(v) self.db.profile.localtime = v end
            },
            toggle = {
                name = L["Toggle"],
                desc = L["Toggle the module on and off."],
                type = "toggle",
                order = 200,
                get = function() return self.db.profile.on end,
                set = function() self.db.profile.on = Prat:ToggleModuleActive("timestamps") end
            }
        }
    }
end

function Prat_Timestamps:OnEnable()
    for i=1,NUM_CHAT_WINDOWS do
		Prat_Timestamps:SetFrameStatus(i)
    end

  	self.secondsDifference = 0
	_,self.lastMinute = GetGameTime()
end

function Prat_Timestamps:SetFrameStatus(id)
    if self.db.profile.show[id] then
    	if not self:IsHooked(getglobal("ChatFrame"..id), "AddMessage") then self:Hook(getglobal("ChatFrame"..id), "AddMessage", "AddMessage"..id) end
    else
        if self:IsHooked(getglobal("ChatFrame"..id), "AddMessage") then self:Unhook(getglobal("ChatFrame"..id), "AddMessage") end
    end
end

function Prat_Timestamps:AddMessage1(...)
	Prat_Timestamps:AddMessage(1, unpack(arg))
end
function Prat_Timestamps:AddMessage2(...)
	Prat_Timestamps:AddMessage(2, unpack(arg))
end
function Prat_Timestamps:AddMessage3(...)
	Prat_Timestamps:AddMessage(3, unpack(arg))
end
function Prat_Timestamps:AddMessage4(...)
	Prat_Timestamps:AddMessage(4, unpack(arg))
end
function Prat_Timestamps:AddMessage5(...)
	Prat_Timestamps:AddMessage(5, unpack(arg))
end
function Prat_Timestamps:AddMessage6(...)
	Prat_Timestamps:AddMessage(6, unpack(arg))
end
function Prat_Timestamps:AddMessage7(...)
	Prat_Timestamps:AddMessage(7, unpack(arg))
end

function Prat_Timestamps:AddMessage(id, frame, text, ...)
    if text then
		-- get timestamp format
        local dateFormat
       	dateFormat = self.db.profile.format[id]
       	-- get space character useage
        if ( self.db.profile.space ) then space = " " else space = "" end
        -- get color format
        if self.db.profile.colortimestamp then
            local color = string.format("%02x%02x%02x", self.db.profile.color.r*255, self.db.profile.color.g*255, self.db.profile.color.b*255)
            text = string.format("|cff"..color.."%s|r" .. space .. "%s", self:GetTime(dateFormat), text)
        else
            text = string.format("%s".. space .. "%s", self:GetTime(dateFormat), text)
        end
    end
    self.hooks[frame].AddMessage(frame, text, unpack(arg))
end

function Prat_Timestamps:GetTime(format)
	if self.db.profile.localtime then
		return date(format)
	else
		local tempDate = date("*t")
		tempDate["hour"], tempDate["min"] = GetGameTime()
		-- taken from FuBar_ClockFu
		if self.lastMinute ~= tempDate["min"] then
			_,self.lastMinute = GetGameTime()
			self.secondsDifference = mod(time(), 60)
		end
		tempDate["sec"] = mod(time() - self.secondsDifference, 60)
		return date(format, time(tempDate))
	end
end
