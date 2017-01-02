------------------------------
--      Are you local?      --
------------------------------

local myname = "Nefarian Counter" -- This can be localized manually
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..myname)
local BZ = AceLibrary("Babble-Zone-2.2")

local SYNC1_ID, SYNC1_DELAY, SYNC2_ID, SYNC2_DELAY, SYNCC_ID, SYNCC_DELAY = "NefCount Sync 1", 0.25, "NefCount Sync 2", 0.25, "NefCount Sync Chromatics", 0.125
local HIDE_ID, HIDE_DELAY = "NefCount Hide", 60


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["disabletrigger"] = "Nefarian dies.",
	["hidetrigger"] = "Well done, my minions",
	["resettrigger"] = "Let the games begin!",

	["trigger1"] = "^([%w ]+) dies.",

	["warn1"] = "%d %ss killed.",
	["warn2"] = "%d %ss and %d %ss killed.",
	["warn3"] = "%d drakonids left - Nefarian landing soon!",

	["RED"] = "Red Drakonid",
	["GREEN"] = "Green Drakonid",
	["BLUE"] = "Blue Drakonid",
	["BRONZE"] = "Bronze Drakonid",
	["BLACK"] = "Black Drakonid",
	["CHROMATIC"] = "Chromatic Drakonid",
	["TOTAL"] = "Drakonids total",

	["Nefarian landing! %s kills counted."] = true,
	["%d %s"] = true,
	[", "] = true,
	[" and "] = true,

	-- AceConsole
	["cmd"] = "nefcount",
	["bar_cmd"] = "bar",
	["bar_name"] = "Counter Bar",
	["bar_desc"] = "Show the Drakonid counter bar",
	["sbars_cmd"] = "sbars",
	["sbars_name"] = "Separate Counter Bars",
	["sbars_desc"] = "Show a Drakonid counter bar per colour",
	["warn_cmd"] = "warn",
	["warn_name"] = "Warning Messages",
	["warn_desc"] = "Display Drakonid warning messages at 32 and 37 kills",
	["swarns_cmd"] = "swarns",
	["swarns_name"] = "Separate Warning Messages",
	["swarns_desc"] = "Display warning messages at 10 and 15 Drakonid kills per colour",
	["print_cmd"] = "print",
	["print_name"] = "Print Drakonid counts",
	["print_desc"] = "Print Drakonid counts in the chat window when Nefarian lands",
} end)

L:RegisterTranslations("ruRU", function() return {
	["disabletrigger"] = "Нефариан погибает.",
	["hidetrigger"] = "Браво, слуги мои! Смертные утрачивают мужество! Поглядим же, как они справятся с истинным владыкой Черной горы!!!",
	["resettrigger"] = "Ну что ж, поиграем!",

	["trigger1"] = "^(.+) погибает.",

	["warn1"] = "%d %ss убито.",
	["warn2"] = "%d %ss и %d %ss убито.",
	["warn3"] = "%d дракониды поражены - скоро Нефариан!",

	["RED"] = "Красный драконид",
	["GREEN"] = "Зеленый драконид",
	["BLUE"] = "Синий драконид",
	["BRONZE"] = "Бронзовый драконид",
	["BLACK"] = "Черный драконид",
	["CHROMATIC"] = "Хроматический драконид",
	["TOTAL"] = "Всего драконидов",

	["Nefarian landing! %s kills counted."] = "Нефариан приземляется! Подсчет убийств %s.",
	["%d %s"] = "%d %s",
	[", "] = ", ",
	[" and "] = " и ",

	-- AceConsole
	["cmd"] = "nefcount",
	["bar_cmd"] = "bar",
	["bar_name"] = "Полоса счетчика",
	["bar_desc"] = "Отображает полосу счетчика  драконидов",
	["sbars_cmd"] = "sbars",
	["sbars_name"] = "Отдельная полоса счетчика",
	["sbars_desc"] = "Отображает полосу равную цвету драконида",
	["warn_cmd"] = "warn",
	["warn_name"] = "Предупреждающие сообщения",
	["warn_desc"] = "Дисплей, предупреждающий сообщением на 32 и 37 убийствах драконидов",
	["swarns_cmd"] = "swarns",
	["swarns_name"] = "Отдельное сообщение предупреждения",
	["swarns_desc"] = "Отображает предупреждающее сообщение, когда убито 10 и 15 драконидов каждого цвета",
	["print_cmd"] = "print",
	["print_name"] = "Сообщение подсчета драконидов",
	["print_desc"] = "Выводит сообщение в окне чата, подсчитывающее драконидов, когда Нефариан на земле.",
} end)

L:RegisterTranslations("deDE", function() return {
	["disabletrigger"] = "Nefarian stirbt.",
	["hidetrigger"] = "Sehr gut, meine Diener.",
	["resettrigger"] = "Lasst die Spiele beginnen!",

	["trigger1"] = "^([%w ]+) stirbt.",

	["RED"] = "Roter Drakonid",
	["GREEN"] = "Gr�ner Drakonid",
	["BLUE"] = "Blauer Drakonid",
	["BRONZE"] = "Bronzener Drakonid",
	["BLACK"] = "Schwarzer Drakonid",
	["CHROMATIC"] = "Prismatischer Drakonid",
	["TOTAL"] = "Drakonide gesamt",
} end)

L:RegisterTranslations("frFR", function() return {
	["disabletrigger"] = "Nefarian meurt.",
	["hidetrigger"] = "Beau travail",
	["resettrigger"] = "Que les jeux commencent !",

	["trigger1"] = "^([%w ]+) meurt.",

	["warn1"] = "%d %ss tuer.",
	["warn2"] = "%d %ss et %d %ss tuer.",
	
	["RED"] = "Drak\195\180nide rouge",
	["GREEN"] = "Drak\195\180nide vert",
	["BLUE"] = "Drak\195\180nide bleu",
	["BRONZE"] = "Drak\195\180nide bronze",
	["BLACK"] = "Drak\195\180nide noir",
	["CHROMATIC"] = "Drak\195\180nide chromatique",
	["TOTAL"] = "Drak\195\180nide total",
} end)

L:RegisterTranslations("zhCN", function() return {
	["disabletrigger"] = "奈法利安死了。",
	["hidetrigger"] = "干得好，我的手下。",
	["resettrigger"] = "比赛开始！",

	["trigger1"] = "^(.+)死了。",

	["warn1"] = "%d %ss 已杀。",
	["warn2"] = "%d %ss 与 %d %ss 已杀。",
	["warn3"] = "%d 龙兽离开 - 耐法利安将要降落！",

	["RED"] = "红色龙兽",
	["GREEN"] = "绿色龙兽",
	["BLUE"] = "蓝色龙兽",
	["BRONZE"] = "青铜龙兽",
	["BLACK"] = "黑色龙兽",
	["CHROMATIC"] = "多彩龙兽",
	["TOTAL"] = "龙兽总数",

	["Nefarian landing! %s kills counted."] = "耐法利安已降落！ %s 已被杀死。",
	["%d %s"] = "%d %s",
	[", "] = "， ",
	[" and "] = "和",

	-- AceConsole
	["cmd"] = "nefcount",
	["bar_cmd"] = "bar",
	["bar_name"] = "计数条",
	["bar_desc"] = "显示龙兽计数条",
	["sbars_cmd"] = "sbars",
	["sbars_name"] = "每种龙兽计数列表",
	["sbars_desc"] = "分别显示每种颜色龙兽被杀的计数条",
	["warn_cmd"] = "warn",
	["warn_name"] = "警报信息",
	["warn_desc"] = "分别再杀死32与37龙兽时，显示警报信息",
	["swarns_cmd"] = "swarns",
	["swarns_name"] = "每种龙兽详细警报",
	["swarns_desc"] = "分别在杀死每种颜色龙兽10与15个时，显示警报信息。",
	["print_cmd"] = "print",
	["print_name"] = "显示龙兽计数",
	["print_desc"] = "当耐法利安降落时，将龙兽已杀数目输出到聊天窗口。",
} end)
----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsNefCount = BigWigs:NewModule(myname, "AceConsole-2.0")
BigWigsNefCount.synctoken = myname
BigWigsNefCount.zonename = BZ["Blackwing Lair"]
BigWigsNefCount.enabletrigger = {L["RED"], L["GREEN"], L["BLUE"], L["BRONZE"], L["BLACK"], L["CHROMATIC"]}
BigWigsNefCount.toggleoptions = {"bar", "sbars", "warn", "swarns", "print"}
BigWigsNefCount.revision = tonumber(string.sub("$Rev: 17263 $", 7, -3))
BigWigsNefCount.external = true

------------------------------
--      Initialization      --
------------------------------

function BigWigsNefCount:OnRegister()
	self.drakonids = {{}, {}, {}}
end

function BigWigsNefCount:OnEnable()
	-- reset counter values
	local d
	d = self.drakonids[1]
		d.kind = nil
		d.name = nil
		d.max = 19
		d.kills = 0
		d.bar = nil
		d.reported = 0
	d = self.drakonids[2]
		d.kind = nil
		d.name = nil
		d.max = 19
		d.kills = 0
		d.bar = nil
		d.reported = 0
	d = self.drakonids[3]
		d.kind = "CHROMATIC"
		d.kills = 0
	d = self.drakonids
		d.kind = "TOTAL"
		d.name = L["TOTAL"]
		d.max = 42
		d.kills = 0
		d.bar = nil
		d.reported = 0
	self.nefarian = nil

	-- combat events
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")

	-- synchronisation
	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "Drakonids", 0)
end


----------------------------
--      UI functions      --
----------------------------

function BigWigsNefCount:UpdateBar(_d)
	local d = _d and self.drakonids[_d] or self.drakonids

	if not d.bar and (d.kills > 0) and (d.kills < d.max) then
		self:TriggerEvent("BigWigs_StartCounterBar", self, d.name, d.max, "Interface\\Icons\\Spell_Shadow_Charm")
		d.bar = 0
	end

	if (d.bar ~= nil) and (d.kills > d.bar) then
		self:TriggerEvent("BigWigs_SetCounterBar", self, d.name, d.kills)
		d.bar = d.kills
	end
end

function BigWigsNefCount:HideBar(_d)
	local d = _d and self.drakonids[_d] or self.drakonids

	self:TriggerEvent("BigWigs_StopCounterBar", self, d.name)
	d.bar = nil
end

function BigWigsNefCount:HideBars()
	self:HideBar()
	self:HideBar(1)
	self:HideBar(2)
end

function BigWigsNefCount:Warn()
	local d, d1, d2 = self.drakonids, self.drakonids[1], self.drakonids[2]

	if	self.db.profile.warn and
		(	((d.reported) < 32 and d.kills >= 32) or
			((d.reported) < 37 and d.kills >= 37)	) then
		self:TriggerEvent("BigWigs_Message", string.format(L["warn3"], d.max - d.kills), "Important", nil, "Alarm")
	elseif	self.db.profile.swarns and
			(	(d1.reported < 10 and d1.kills >= 10) or
				(d1.reported < 15 and d1.kills >= 15) or
				(d2.reported < 10 and d2.kills >= 10) or
				(d2.reported < 15 and d2.kills >= 15)		) then
		local warn
		if (d1.kills >= 15) and (d2.kills >= 15) then
			warn = "Urgent"
		elseif (d1.kills >= 10) and (d2.kills >= 10) then
			warn = "Attention"
		end

		-- display the message
		if warn then
			local message
			if not d2.kind then
				message = string.format(L["warn1"], d1.kills, d1.name)
			else
				message = string.format(L["warn2"], d1.kills, d1.name, d2.kills, d2.name)
			end
			self:TriggerEvent("BigWigs_Message", message, warn, true, "Alert")
		end
	end

	d1.reported = d1.kills
	d2.reported = d2.kills
	d.reported = d.kills
end

function BigWigsNefCount:PrintCounts()
	msg = "|cfff5f530" .. string.format(L["%d %s"], self.drakonids[3].kills, L["CHROMATIC"]) .. "|r"
	if self.drakonids[1].kind then
		msg = msg .. L[", "] .. "|cfff5f530" .. string.format(L["%d %s"], self.drakonids[1].kills, self.drakonids[1].name) .. "|r"
	end
	if self.drakonids[2].kind then
		msg = msg .. L[" and "] .. "|cfff5f530" .. string.format(L["%d %s"], self.drakonids[2].kills, self.drakonids[2].name) .. "|r"
	end

	self:Print(L["Nefarian landing! %s kills counted."], msg)
end


------------------------------
--      event handlers      --
------------------------------

function BigWigsNefCount:UpdateKills(_d, sync, sync_delay, kind, kills)
	local d = self.drakonids[_d]

	if not d.kind then
		d.kind = kind
		d.name = L[kind]
	elseif d.kind ~= kind then
		return
	end

	if kills ~= nil then
		if d.kills <= kills then
			d.kills = kills

			self:CancelScheduledEvent(sync)
		end
	else
		d.kills = d.kills + 1

		self:ScheduleEvent(sync, "BigWigs_SendSync", sync_delay, "Drakonids "..d.kind.." "..d.kills)
	end
	return true
end

function BigWigsNefCount:OnKill(kind, kills)
	if (	-- we always get chromatics - check them first
			self:UpdateKills(3, SYNCC_ID, SYNCC_DELAY, kind, kills) or
			-- now the unknown colours...
			self:UpdateKills(1, SYNC1_ID, SYNC1_DELAY, kind, kills) or
			self:UpdateKills(2, SYNC2_ID, SYNC2_DELAY, kind, kills)		) and not self.nefarian then
		-- reset the hide event
		self:ScheduleEvent(HIDE_ID, self.HideBars, HIDE_DELAY, self)

		-- update total count
		self.drakonids.kills = self.drakonids[1].kills + self.drakonids[2].kills + self.drakonids[3].kills

		-- update bars (and show warning messages)
		if self.db.profile.bar then
			self:UpdateBar()
		elseif self.drakonids.bar then
			self:HideBar()
		end
		if self.db.profile.sbars then
			self:UpdateBar(1)
			self:UpdateBar(2)
		elseif self.drakonids[1].bar then
			-- the bars have been disabled - remove them!
			self:HideBar(1)
			self:HideBar(2)
		end

		-- show warning messages
		self:Warn()
	end
end


function BigWigsNefCount:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if string.find(msg, L["disabletrigger"]) then
		self.core:ToggleModuleActive(self, false)
	else
		local _, _, drakonid = string.find(msg, L["trigger1"])
		if drakonid and L:HasReverseTranslation(drakonid) then
			self:OnKill(L:GetReverseTranslation(drakonid))
		end
	end
end

function BigWigsNefCount:BigWigs_RecvSync(sync, message, nick)
	if sync == "Drakonids" then
		local _, _, kind, kills = string.find(message, "([%w]+) ([%d]+)")

		if kind and L[kind] and kills then
			self:Debug("Sync from %s: %s %s", nick, kind, kills)
			self:OnKill(kind, tonumber(kills))
		end
	end
end


function BigWigsNefCount:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["resettrigger"]) then
		self:TriggerEvent("BigWigs_RebootModule", self)

	elseif string.find(msg, L["hidetrigger"]) then
		self:HideBar()
		self:HideBar(1)
		self:HideBar(2)

		if self.db.profile.print then self:PrintCounts() end

		self.nefarian = true
	end
end
