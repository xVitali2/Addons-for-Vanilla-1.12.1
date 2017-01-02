--[[
--
-- BigWigs Strategy Module for Thaddius in Naxxramas.
--
-- Adds graphical, textual and sound warnings for what direction
-- you should move in when you get a polarity debuff in phase 2.
--
-- See readme.txt for more info
-- Many thanks to rabbit for all the help.
--
-- TODO
--  - Fix strategy broadcasting across multiple locales.
--
--]]

------------------------------
--      Are you local?      --
------------------------------

local myname = "Thaddius Arrows"
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..myname)
local BZ = AceLibrary("Babble-Zone-2.2")
local boss = AceLibrary("Babble-Boss-2.2")["Thaddius"]
local TL = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)
local feugen = AceLibrary("Babble-Boss-2.2")["Feugen"]
local stalagg = AceLibrary("Babble-Boss-2.2")["Stalagg"]

-- Known strategies, values are the index in the L["strat_validate"] table.
-- Make sure to update the error checks in OnEnable if adding/removing
-- strategies.
local stratCircularLR, stratCircularRL, stratThrough

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "ThaddiusArrows",

	graphic_cmd = "garrows",
	graphic_name = "Graphical Arrows",
	graphic_desc = "Display Graphical Arrows",

	text_cmd = "tarrows",
	text_name = "Text Arrows",
	text_desc = "Display Text Arrows",

	sound_cmd = "sarrows",
	sound_name = "Sound Effects",
	sound_desc = "Play Direction Sound Effects",

	strat_cmd = "strat",
	strat_name = "Strategy",
	strat_desc = "Pick the strategy to use for moving",
	strat_validate = { "Circular, L/R", "Circular, R/L", "Run Through" },

	setstrategy_cmd = "bwtabc",
	setstrategy_name = "Broadcast strategy",
	setstrategy_desc = "Broadcasts your current strategy to the raid",

	["Thaddius strategy is set to "] = true,
	["Make sure everyone in the raid has the same strategy set!"] = true,
	["Invalid Thaddius strategy, resetting to default."] = true,
	["You can run the command /bwtabc to broadcast your strategy and force your raid to use it."] = true,
	["You can't broadcast the strategy if you are not the leader or promoted in the raid group."] = true,
	["Broadcasting strategy ..."] = true,
	["Strategy broadcast detected from %s. Strategy set to %s."] = true,
	["Invalid Thaddius strategy received from %s."] = true,

	soundleft = "Interface\\AddOns\\BigWigs_ThaddiusArrows\\sounds\\GoLeftUS.wav",
	soundright = "Interface\\AddOns\\BigWigs_ThaddiusArrows\\sounds\\GoRightUS.wav",
	soundacross = "Interface\\AddOns\\BigWigs_ThaddiusArrows\\sounds\\SwitchSidesUS.wav",

	warnleft = "<----  GO LEFT  <---- GO LEFT <----",
	warnright = "---->  GO RIGHT  ----> GO RIGHT ---->",
	warnacross = "^^^^ SWITCH SIDES ^^^^ SWITCH SIDES ^^^^",
	
} end )

L:RegisterTranslations("ruRU", function() return {
	cmd = "ThaddiusArrows",

	graphic_cmd = "garrows",
	graphic_name = "Графические стрелки",
	graphic_desc = "Показывает графические стрелки",

	text_cmd = "tarrows",
	text_name = "Текстовые стрелки",
	text_desc = "Показывает текстовые стрелки",

	sound_cmd = "sarrows",
	sound_name = "Звуковые эффекты",
	sound_desc = "Play Direction Sound Effects",

	strat_cmd = "strat",
	strat_name = "Стратегия",
	strat_desc = "Выберите стратегию для использования перемещения",
	strat_validate = { "Circular, L/R", "Circular, R/L", "Run Through" },

	setstrategy_cmd = "bwtabc",
	setstrategy_name = "Транслировать стратегию",
	setstrategy_desc = "Сообщить текущую стратегию в рейд",

	["Thaddius strategy is set to "] = "Стратегия на Таддиуса установлена ",
	["Make sure everyone in the raid has the same strategy set!"] = "Убедитесь, что все члены рейда, имеют туже установленную стратегию!",
	["Invalid Thaddius strategy, resetting to default."] = "Неверная стратегия, сброшено на стандартную.",
	["You can run the command /bwtabc to broadcast your strategy and force your raid to use it."] = "Вы можете запустить команду /bwtabc, чтобы транслировать свою стратегию и заставить ваш рейд использовать ее.",
	["You can't broadcast the strategy if you are not the leader or promoted in the raid group."] = "Вы не можете транслировать свою стратегию. Вы не являетесь лидером группы или его помощником.",
	["Broadcasting strategy ..."] = "Трансляция стратегии ...",
	["Strategy broadcast detected from %s. Strategy set to %s."] = "Обнаружена трансляция стратегии от %s. Установка стратегии %s.",
	["Invalid Thaddius strategy received from %s."] = "Получена неверная стратегия от %s.",

	soundleft = "Interface\\AddOns\\BigWigs_ThaddiusArrows\\sounds\\GoLeftUS.wav",
	soundright = "Interface\\AddOns\\BigWigs_ThaddiusArrows\\sounds\\GoRightUS.wav",
	soundacross = "Interface\\AddOns\\BigWigs_ThaddiusArrows\\sounds\\SwitchSidesUS.wav",

	warnleft = "<----  ИДИТЕ НАЛЕВО  <---- ИДИТЕ НАЛЕВО <----",
	warnright = "---->  ИДИТЕ НАПРАВО  ----> ИДИТЕ НАПРАВО ---->",
	warnacross = "^^^^ СМЕНИТЕ СТОРОНУ ^^^^ СМЕНИТЕ СТОРОНУ ^^^^",
	
} end )

L:RegisterTranslations("koKR", function() return {
	graphic_name = "시각적인 화살표",
	graphic_desc = "시각적인 화살표를 표시합니다.",

	text_name = "텍스트 방향",
	text_desc = "텍스트로 방향을 표시합니다.",

	sound_name = "효과음",
	sound_desc = "방향 음향 효과를 재생합니다.",

	strat_name = "전략",
	strat_desc = "이동에 사용할 전략을 선택합니다.",
	strat_validate = { "회전, 좌/우", "회전, 우/좌", "가로질러 이동" },

	setstrategy_name = "전략 알림",
	setstrategy_desc = "공격대에 현재 전략을 알립니다.",

	["Thaddius strategy is set to "] = "타디우스 전략 설정 : ",
	["Make sure everyone in the raid has the same strategy set!"] = "공격대원들이 동일한 전략 설정이 되어 있는것을 확인하세요!",
	["Invalid Thaddius strategy, resetting to default."] = "타당하지 않은 타디우스 전략입니다. 기본 설정으로 초기화합니다.",
	["You can run the command /bwtabc to broadcast your strategy and force your raid to use it."] = "전략을 알리고 공격대에 사용하려면 /bwtabc 명령어를 실행하세요.",
	["You can't broadcast the strategy if you are not the leader or promoted in the raid group."] = "공대장 혹은 승급자가 아니면 전략 알림을 사용 할 수 없습니다.",
	["Broadcasting strategy ..."] = "전략을 알립니다...",
	["Strategy broadcast detected from %s. Strategy set to %s."] = "%s|1으로;로; 부터 전략 알림을 받았습니다. %s|1으로;로; 전략이 설정되었습니다.",
	["Invalid Thaddius strategy received from %s."] = "%s|1으로;로; 부터 타당하지 않은 타디우스 전략을 받았습니다.",

	warnleft = "<----  왼쪽으로  <---- 왼쪽으로 <----",
	warnright = "---->  오른쪽으로  ----> 오른쪽으로 ---->",
	warnacross = "^^^^ 방향 전환 ^^^^ 방향 전환 ^^^^",
	
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsThaddiusArrows = BigWigs:NewModule(myname, "AceConsole-2.0")
BigWigsThaddiusArrows.synctoken = myname
BigWigsThaddiusArrows.zonename = BZ["Naxxramas"]
BigWigsThaddiusArrows.enabletrigger = { boss, feugen, stalagg }
BigWigsThaddiusArrows.toggleoptions = { "strat", -1, "graphic", "text", "sound" }
BigWigsThaddiusArrows.revision = tonumber(string.sub("$Revision: 17276 $", 12, -3))
BigWigsThaddiusArrows.external = true

------------------------------
--      Initialization      --
------------------------------

function BigWigsThaddiusArrows:OnRegister()
	self.frameArrow = CreateFrame("Frame", nil, UIParent)
	self.texArrow = self.frameArrow:CreateTexture(nil, "BACKGROUND")
	-- Create the frame we will be using for the Arrow
	self.frameArrow:SetFrameStrata("MEDIUM")
	self.frameArrow:SetWidth(200)  -- Set These to whatever height/width is needed 
	self.frameArrow:SetHeight(200) -- for your Texture
	-- Apply Texture
	self.texArrow:SetTexture("Interface\\AddOns\\BigWigs_ThaddiusArrows\\textures\\arrow")	
	self.texArrow:SetAllPoints(self.frameArrow)
	self.frameArrow:SetAlpha(0.6)
	self.frameArrow:Hide()

	self.framestraightArrow = CreateFrame("Frame", nil, UIParent)
	self.texstraightArrow = self.framestraightArrow:CreateTexture(nil, "BACKGROUND")
	-- Create the frame we will be using for the Arrow
	self.framestraightArrow:SetFrameStrata("MEDIUM")
	self.framestraightArrow:SetWidth(200)  -- Set These to whatever height/width is needed 
	self.framestraightArrow:SetHeight(200) -- for your Texture
	-- Apply Texture
	self.texstraightArrow:SetTexture("Interface\\AddOns\\BigWigs_ThaddiusArrows\\textures\\straightArrow")	
	self.texstraightArrow:SetAllPoints(self.framestraightArrow)
	self.framestraightArrow:SetAlpha(0.6)
	self.framestraightArrow:Hide()

	self:RegisterChatCommand({ "/"..L["setstrategy_cmd"] }, {
		type = "execute",
		name = L["setstrategy_name"],
		desc = L["setstrategy_desc"],
		func = function() self:BroadCastStrategy() end,
	})
end

function BigWigsThaddiusArrows:OnEnable()
	self.previousCharge = nil

	local strategies = L["strat_validate"]
	if not strategies or not type(strategies) == "table" then
		error("Strategy table is not a table in BigWigs_ThaddiusArrows.")
		return
	end
	local count = 0
	for k in pairs(strategies) do
		count = count + 1
	end
	if count ~= 3 then
		error("Strategy table is invalid in BigWigs_ThaddiusArrows.")
		return
	end

	stratCircularLR = strategies[1]
	stratCircularRL = strategies[2]
	stratThrough = strategies[3]

	local found = false
	for k, v in pairs(strategies) do
		if v == self.db.profile.strat then
			found = true
			break
		end
	end
	if not found or not self.db.profile.strat or type(self.db.profile.strat) ~= "string" then
		self:Print(L["Invalid Thaddius strategy, resetting to default."])
		self.db.profile.strat = stratCircularLR
	end

	self:Print(L["Thaddius strategy is set to "]..self.db.profile.strat)
	self:Print(L["Make sure everyone in the raid has the same strategy set!"])
	if IsRaidLeader() or IsRaidOfficer() then
		self:Print(L["You can run the command /bwtabc to broadcast your strategy and force your raid to use it."])
	end

	-- Events
	self:RegisterEvent("PLAYER_REGEN_ENABLED")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("BigWigs_Message")

	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "ThaddiusArrowsStrategy", 2)
end

function BigWigsThaddiusArrows:OnDisable()
	if self.frameArrow then self.frameArrow:Hide() end
	if self.framestraightArrow then self.framestraightArrow:Hide() end
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsThaddiusArrows:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == string.format(UNITDIESOTHER, boss) then
		self.core:ToggleModuleActive(self, false)
	end
end

function BigWigsThaddiusArrows:BroadCastStrategy()
	if not IsRaidLeader() and not IsRaidOfficer() then
		self:Print(L["You can't broadcast the strategy if you are not the leader or promoted in the raid group."])
		return
	end

	-- Find our strategy
	local found = nil
	for i, v in ipairs(L["strat_validate"]) do
		if v == self.db.profile.strat then
			found = i
			break
		end
	end
	if found == nil then return end

	self:Print(L["Broadcasting strategy ..."])
	self:TriggerEvent("BigWigs_SendSync", "ThaddiusArrowsStrategy "..found)
end

function BigWigsThaddiusArrows:BigWigs_RecvSync( sync, rest, nick )
	if sync ~= "ThaddiusArrowsStrategy" or not rest or not nick then return end
	if self.db.profile.strat == rest then return end

	-- Old style broadcast with name of strategy.
	if tonumber(rest) == nil then
		local found = nil
		for i, v in ipairs(L["strat_validate"]) do
			if v == rest then
				found = true
				break
			end
		end
		if found then
			self.db.profile.strat = rest
			self:Print(string.format(L["Strategy broadcast detected from %s. Strategy set to %s."], nick, rest))
			return
		else
			self:Print(string.format(L["Invalid Thaddius strategy received from %s."], nick))
			return
		end
	else
		rest = tonumber(rest)
		local count = 0
		for i, v in ipairs(L["strat_validate"]) do
			count = count + 1
		end
		if rest > count or rest < 1 then
			self:Print(string.format(L["Invalid Thaddius strategy received from %s."], nick))
			return
		else
			self.db.profile.strat = L["strat_validate"][rest]
			self:Print(string.format(L["Strategy broadcast detected from %s. Strategy set to %s."], nick, L["strat_validate"][rest]))
			return
		end
	end
end

function BigWigsThaddiusArrows:PLAYER_REGEN_ENABLED()
	local go = BigWigsThaddius:Scan()
	local running = self:IsEventScheduled("ThaddiusArrows_CheckWipe")
	if not go then
		self:TriggerEvent("BigWigs_RebootModule", self)
	elseif not running then
		self:ScheduleRepeatingEvent("ThaddiusArrows_CheckWipe", self.PLAYER_REGEN_ENABLED, 2, self)
	end
end

function BigWigsThaddiusArrows:Direction( direction )
	if direction == "Left" then -- Left Arrow
		if self.db.profile.graphic then
			self.frameArrow.texture = self.texArrow
			self.texArrow:SetTexCoord(0, 1, 0, 1)
			self.frameArrow:SetPoint("CENTER", -250, 100)
			self.frameArrow:Show()
			self:ScheduleEvent(function() self.frameArrow:Hide() end, 4)
		end
		if self.db.profile.sound then
			PlaySoundFile(L["soundleft"])
		end
		if self.db.profile.text then
			self:TriggerEvent("BigWigs_Message", L["warnleft"], "Red", true)
		end
	elseif direction == "Right" then -- Right Arrow
		if self.db.profile.graphic then
			self.frameArrow.texture = self.texArrow
			self.texArrow:SetTexCoord(1, 0, 0, 1)
			self.frameArrow:SetPoint("CENTER", 250, 100)
			self.frameArrow:Show()
			self:ScheduleEvent(function() self.frameArrow:Hide() end, 4)
		end
		if self.db.profile.sound then
			PlaySoundFile(L["soundright"])
		end
		if self.db.profile.text then
			self:TriggerEvent("BigWigs_Message", L["warnright"], "Red", true)
		end
	elseif direction == "Across" then -- Switch Sides
		if self.db.profile.graphic then
			self.framestraightArrow.texture = self.texstraightArrow
			self.texstraightArrow:SetTexCoord(0, 1, 0, 1)
			self.framestraightArrow:SetPoint("CENTER", 0, 200)
			self.framestraightArrow:Show()
			self:ScheduleEvent(function() self.framestraightArrow:Hide() end, 4)
		end
		if self.db.profile.sound then
			PlaySoundFile(L["soundacross"])
		end
		if self.db.profile.text then
			self:TriggerEvent("BigWigs_Message", L["warnacross"], "Red", true)
		end
	end
end

function BigWigsThaddiusArrows:BigWigs_Message( msg )
	local strat = self.db.profile.strat
	if msg == TL["nochange"] then
		if strat == stratCircularLR then
			self:Direction("Left")
		elseif strat == stratCircularRL then
			self:Direction("Right")
		end
		self.previousCharge = msg
	elseif msg == TL["poswarn"] or msg == TL["negwarn"] then
		if self.previousCharge then
			if strat == stratCircularLR then
				self:Direction("Right")
			elseif strat == stratThrough then
				self:Direction("Across")
			elseif strat == stratCircularRL then
				self:Direction("Left")
			end
		else
			-- First charge
			if msg == TL["poswarn"] then
				if strat == stratCircularLR then
					self:Direction("Left")
				elseif strat == stratCircularRL then
					self:Direction("Right")
				end
			elseif msg == TL["negwarn"] then
				if strat == stratCircularLR then
					self:Direction("Right")
				elseif strat == stratCircularRL then
					self:Direction("Left")
				elseif strat == stratThrough then
					self:Direction("Across")
				end
			end
		end
		self.previousCharge = msg
	end
end

