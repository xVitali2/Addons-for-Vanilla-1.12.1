--[[
--
-- Big Wigs Strategy Module for Loatheb in Naxxramas.
--
-- Adds warning messages, whispers and raid icons for the groups that are next in line to get Spore
--
--	visit us at http://www.caelum.ws
--]]

------------------------------
--      Are you local?      --
------------------------------

local myname = "Loatheb Tactical"
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..myname)
local boss = AceLibrary("Babble-Boss-2.2")["Loatheb"]

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "BigWigsLoathebTactical",
	
	spore_cmd = "spore",
	spore_name = "Do NOT warn groups to get spore (A)",
	spore_desc = "When checked does NOT warn groups to get spore 4 seconds before spore spawn. Requires Assistance (A)",
	
	revsporeseq_cmd = "revsporeseq",
	revsporeseq_name = "Reverses group spore sequence",
	revsporeseq_desc = "When checked counts from group 8 to 1, instead of from group 1 to 8",

	skipsporegroup_cmd = "skipsporegroup",
	skipsporegroup_name = "Skips spore group 1",
	skipsporegroup_desc = "When checked skips group 1 in spore group list",
	
	graphic_cmd = "graphic",
	graphic_name = "Graphical Icons",
	graphic_desc = "When checked shows graphical icons",
	
	sound_cmd = "sound",
	sound_name = "Sound Effects",
	sound_desc = "When checked plays sound effects",
	
	spore_trigger = "Loatheb casts Summon Spore.",
	doomtrigger = "afflicted by Inevitable Doom.",
	
	group_spore_warn = "Group %s get your spore !",
	whisper_spore_warn = "Get your spore now !",	
	
	consumable_cmd = "consumable",
	consumable_name = "Do NOT warn raid to use consumables (A)",
	consumable_desc = "When check does NOT warn raid to use consambles over raidwarn. Requires Assistance (A)",
	
	shadowpot = "-- Drink Shadow Protection Potion ! --",
	bandage = "-- Use your bandages ! --",
	wrtorhs = "-- Healthstone or Whipper Root Tuber ! --",
	shadowpotandbandage = "-- Drink Shadow Protection Potion and Bandage ! --",
	noconsumable = "-- No Consumable at this time ! --",
	
	soundshadowpot = "Interface\\Addons\\BigWigs_LoathebTactical\\sound\\potion.wav",
	soundbandage = "Interface\\Addons\\BigWigs_LoathebTactical\\sound\\bandage.wav",
	soundwrtorhs = "Interface\\Addons\\BigWigs_LoathebTactical\\sound\\healthstone.wav",
	soundshadowpotandbandage = "Interface\\Addons\\BigWigs_LoathebTactical\\sound\\potionandbandage.wav",
	soundgoforbuff = "Interface\\Addons\\BigWigs_LoathebTactical\\sound\\goforbuff.wav",
	
	resetmsg = "Bigwigs Loatheb Tactical Module has reset"

} end )

L:RegisterTranslations("ruRU", function() return {
	cmd = "BigWigsLoathebTactical",
	
	spore_cmd = "spore",
	spore_name = "Не предупреждать группу о споре (А)",
	spore_desc = "Когда проверка не предупреждает группу о заполучении споры, за 4 сек. до её появления. Требуется помощь (А)",
	
	revsporeseq_cmd = "revsporeseq",
	revsporeseq_name = "Изменять группу последовательностью спор",
	revsporeseq_desc = "Когда проверяется счетчик из группы 8 - 1, а не с 1 – 8",

	skipsporegroup_cmd = "skipsporegroup",
	skipsporegroup_name = "Пропуск споры группы 1",
	skipsporegroup_desc = "Проверка пропуска споры группы 1",
	
	graphic_cmd = "graphic",
	graphic_name = "Графические иконки",
	graphic_desc = "Когда проверяется отображение графического значка",
	
	sound_cmd = "sound",
	sound_name = "Звуковые эффекты",
	sound_desc = "Когда проверяются звуковые эффекты",
	
	spore_trigger = "Лотхиб применяет заклинание \"Вызов споры\".",
	doomtrigger = "(.*) Неотвратимый рок.",
	
	group_spore_warn = "Группа %s ваша спора !",
	whisper_spore_warn = "Заберите вашу спору !",	
	
	consumable_cmd = "consumable",
	consumable_name = "Не предупреждать рейд использовать расходные материалы (A)",
	consumable_desc = "Когда проверка не предупреждает рейд использовать расходные материалы. Требуется помощь (A)",
	
	shadowpot = "-- Выпейте зелье защиты от темной магии ! --",
	bandage = "-- Используйте свои бинты ! --",
	wrtorhs = "-- Камень здоровя или Плод кнутокорня ! --",
	shadowpotandbandage = "-- Используйте зелье защиты от темной магии и бинты ! --",
	noconsumable = "-- Не используйте сейчас свои расходные материалы ! --",
	
	soundshadowpot = "Interface\\Addons\\BigWigs_LoathebTactical\\sound\\potion.wav",
	soundbandage = "Interface\\Addons\\BigWigs_LoathebTactical\\sound\\bandage.wav",
	soundwrtorhs = "Interface\\Addons\\BigWigs_LoathebTactical\\sound\\healthstone.wav",
	soundshadowpotandbandage = "Interface\\Addons\\BigWigs_LoathebTactical\\sound\\potionandbandage.wav",
	soundgoforbuff = "Interface\\Addons\\BigWigs_LoathebTactical\\sound\\goforbuff.wav",
	
	resetmsg = "Bigwigs Loatheb тактический модуль сброшен"

} end )

L:RegisterTranslations("zhCN", function() return {
	--spore_name = "不要提醒队伍去吃孢子",
	--spore_desc = "选中后·不·会·在RW，M语或者用团队标记来提醒去吃孢子",

	--revsporeseq_name = "反向吃孢子的队伍顺序",
	--revsporeseq_desc = "选中后将按照队伍1到8的顺序，不选中是队伍8到1的顺序",

	skipsporegroup_name = "吃孢子时忽略队伍1",
	skipsporegroup_desc = "选中后从吃孢子的队伍中去掉队伍1",
	
	spore_trigger = "洛欧塞布施放了召唤孢子。",
	doomtrigger = "受到了必然的厄运效果的影响",
	
	group_spore_warn = "队伍%s去吃孢子！",
	whisper_spore_warn = "立刻去吃孢子！",
	whisper_spore_warn_next = "下一个孢子是你们的！",

	--consumable_name = "不要提醒团队吃药品",
	--consumable_desc = "当选中后·不·会·在RW提醒团队吃药品",
	
	shadowpot = "-- 喝暗防药水！ --",
	bandage = "-- 使用绷带！ --",
	wrtorhs = "-- 用治疗石或者萝卜！ --",
	shadowpotandbandage = "-- 喝暗防药水 + 使用绷带！--",
	noconsumable = "-- 无需使用药品！ --",

	resetmsg = "Bigwigs洛欧塞布战术模块重置了"
} end )

L:RegisterTranslations("koKR", function() return {
	
	--spore_name = "포자 획득 그룹 알림 해제",
	--spore_desc = "체크하면 공격대 경보로 포자를 획득하는 것을 경고하지 않고, 귓속말을 사용하며 아이콘으로 대체됩니다.",
	
	--revsporeseq_name = "그룹 포자 순서 역방향",
	--revsporeseq_desc = "체크하면 그룹 8에서 1까지가 아닌 그룹 1에서 8까지의 순서로 계산합니다.",

	skipsporegroup_name = "포자 1 그룹 건너뛰기",
	skipsporegroup_desc = "체크하면 포자 그룹 목록에서 1 그룹을 건너뜁니다.",
	
	spore_trigger = "로데브|1이;가; 포자 소환|1을;를; 시전합니다.",
	doomtrigger = "피할 수 없는 파멸에 걸렸습니다.",
	
	group_spore_warn = "그룹 %s 포자 획득 !",
	whisper_spore_warn = "지금 포자를 획득하세요 !",
	whisper_spore_warn_next = "다음 포자를 획득하세요.",
	
	--consumable_name = "소비품 사용 공격대 알림 해제",
	--consumable_desc = "체크하면 공격대 경보로 소비품을 사용하는 것을 경고하지 않습니다.",
	
	shadowpot = "-- 암흑 보호 물약을 드세요 ! --",
	bandage = "-- 붕대를 사용하세요 ! --",
	wrtorhs = "-- 생명석 또는 채찍뿌리 줄기를 사용하세요 ! --",
	shadowpotandbandage = "-- 암흑 보호 물약을 드시고 붕대를 사용하세요 ! --",
	noconsumable = "-- 이번 타임에는 소비할 게 없습니다 ! --",
	
	resetmsg = "Bigwigs Loatheb Tactical 모듈을 초기화 합니다."

} end )

-- timing -------------------2:10-------------2:40------------3:10---------3:40--------------4:10---------------4:40--------------5:10-----------5:25-------------5:40
-- after 5 minutes doom comes every 15seconds
local consumableslist = {L["shadowpot"],L["noconsumable"],L["bandage"],L["wrtorhs"],L["shadowpotandbandage"],L["noconsumable"],L["bandage"],L["noconsumable"],L["wrtorhs"]}

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsLoathebTactical = BigWigs:NewModule(myname)
BigWigsLoathebTactical.synctoken = myname
BigWigsLoathebTactical.zonename = AceLibrary("Babble-Zone-2.2")["Naxxramas"]
BigWigsLoathebTactical.enabletrigger = { boss }
BigWigsLoathebTactical.toggleoptions = { "spore", "consumable", "revsporeseq", "skipsporegroup", "graphic", "sound"}
BigWigsLoathebTactical.revision = tonumber(string.sub("$Rev: 17765 $", 12, -3))
BigWigsLoathebTactical.external = true

------------------------------
--      Initialization      --
------------------------------
function BigWigsLoathebTactical:OnRegister()
	self.frameIcon = CreateFrame("Frame",nil,UIParent)	
	
	self.frameIcon:SetFrameStrata("MEDIUM")
	self.frameIcon:SetWidth(100)
	self.frameIcon:SetHeight(100)
	self.frameIcon:SetAlpha(0.6)
	
	self.frameTexture = self.frameIcon:CreateTexture(nil,"BACKGROUND")
	
	self.frameTexture:SetTexture(nil)
	self.frameTexture:SetAllPoints(self.frameIcon)
	
	self.frameIcon:Hide()
	
	self.frameIcon2 = CreateFrame("Frame",nil,UIParent)	
	
	self.frameIcon2:SetFrameStrata("MEDIUM")
	self.frameIcon2:SetWidth(100)
	self.frameIcon2:SetHeight(100)
	self.frameIcon2:SetAlpha(0.6)
	
	self.frameTexture2 = self.frameIcon2:CreateTexture(nil,"BACKGROUND")
	
	self.frameTexture2:SetTexture(nil)
	self.frameTexture2:SetAllPoints(self.frameIcon2)
	
	self.frameIcon2:Hide()
end

function BigWigsLoathebTactical:OnEnable()
	
	self.sporespawn = 1
	self.consumableseq = 1

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	
	self:RegisterEvent("BigWigs_RecvSync")	
	
	DEFAULT_CHAT_FRAME:AddMessage(L["resetmsg"])
end

------------------------------
--      Utility             --
------------------------------

function BigWigsLoathebTactical:BigWigs_RecvSync( sync, rest, nick )
	if sync == "LoathebDoom2" and rest then		
		rest = tonumber(rest)
		if not rest then return end
		if rest == (self.consumableseq + 1) then
			self:ScheduleEvent("bwloathebconsumable "..tostring(self.consumableseq), self.ConsumableWarning, 11, self)			
		end
	elseif sync == "LoathebSporeSpawn2" and rest then
		if self.db.profile.spore then return end
		rest = tonumber(rest)
		if not rest then return end
		if self.sporespawn == 1 then -- If it is the first group we can't whisper in advance as we don't have an initial spore spawn trigger
			self:GroupWarning()
			--self:ScheduleEvent("bwloathebspore2"..tostring(self.sporespawn), self.GroupWarning, 7, self)
		end
		if rest == self.sporespawn then
			self.sporespawn = self.sporespawn + 1
			self:ScheduleEvent("bwloathebspore2 "..tostring(self.sporespawn), self.GroupWarning, 7, self)
		end		
	end
end

function BigWigsLoathebTactical:ConsumableWarning()
	if consumableslist[self.consumableseq] then
		if not self.db.profile.consumable then
			if IsRaidLeader() or IsRaidOfficer() then
				SendChatMessage(consumableslist[self.consumableseq], "RAID_WARNING")
			end
		end
		if self.db.profile.graphic then
			if consumableslist[self.consumableseq] == L["shadowpot"] then
				self.frameTexture:SetTexture("Interface\\Icons\\INV_Potion_23") --greater shadow protection
				self.frameTexture2:SetTexture(nil)
			elseif consumableslist[self.consumableseq] == L["bandage"] then
				self.frameTexture:SetTexture("Interface\\Icons\\INV_Misc_Bandage_12") -- heavy runecloth
				self.frameTexture2:SetTexture(nil)
			elseif consumableslist[self.consumableseq] == L["wrtorhs"] then
				self.frameTexture:SetTexture("Interface\\Icons\\INV_Stone_04") -- healthstone
				--self.frameTexture2:SetTexture("Interface\\Icons\\INV_Misc_Food_55") -- whipper root
			elseif consumableslist[self.consumableseq] == L["shadowpotandbandage"] then
				self.frameTexture:SetTexture("Interface\\Icons\\INV_Potion_23") --greater shadow protection
				self.frameTexture2:SetTexture("Interface\\Icons\\INV_Misc_Bandage_12") -- heavy runecloth
			elseif consumableslist[self.consumableseq] == L["noconsumable"] then
				self.frameTexture:SetTexture(nil)
				self.frameTexture2:SetTexture(nil)
			end
			
			self.frameIcon.texture = self.frameTexture
			self.frameTexture:SetTexCoord(0.0,1.0,0.0,1.0)
			self.frameIcon:SetPoint("CENTER",200,100)
			self.frameIcon:Show()
			
			self.frameIcon2.texture = self.frameTexture2
			self.frameTexture2:SetTexCoord(0.0,1.0,0.0,1.0)
			self.frameIcon2:SetPoint("CENTER",200,0)
			self.frameIcon2:Show()
			
			self:ScheduleEvent(function() 
				self.frameIcon:Hide() 
				self.frameIcon2:Hide()
			end, 5)			
		end 
		if self.db.profile.sound then
			if consumableslist[self.consumableseq] == L["shadowpot"] then
				PlaySoundFile(L["soundshadowpot"])
			elseif consumableslist[self.consumableseq] == L["bandage"] then
				PlaySoundFile(L["soundbandage"])
			elseif consumableslist[self.consumableseq] == L["wrtorhs"] then
				PlaySoundFile(L["soundwrtorhs"])
			elseif consumableslist[self.consumableseq] == L["shadowpotandbandage"] then
				PlaySoundFile(L["soundshadowpotandbandage"])
			end
		end
		self.consumableseq = self.consumableseq + 1
	end
end

function BigWigsLoathebTactical:GroupWarning()
	local currentsporespawn = self.sporespawn
	local raidicon = 1
	local playername = UnitName("Player")
	
	local numgroups = 8
	if self.db.profile.skipsporegroup then numgroups = 7 end
	
	local currentsporegroup = mod(currentsporespawn, numgroups)
	
	if currentsporegroup == 0 then --reached end of groups
		currentsporegroup = numgroups 
	end
	if self.db.profile.revsporeseq then --reverse group numbers
		currentsporegroup = self:ReverseGroup(numgroups, currentsporegroup) 
	end
	if self.db.profile.skipsporegroup and not self.db.profile.revsporeseq then 
		currentsporegroup = currentsporegroup + 1 
	end
	
	for i = 1, GetNumRaidMembers(), 1 do
		name, _, subgroup, _, _, _, _, _ = GetRaidRosterInfo(i)
	
		if subgroup == currentsporegroup then						
			if IsRaidLeader() or IsRaidOfficer() then
				SetRaidTarget("raid" .. i, raidicon)
				self:TriggerEvent("BigWigs_SendTell", name, L["whisper_spore_warn"])
				raidicon = raidicon + 1
			end
			if name == playername then
				if self.db.profile.sound then
					PlaySoundFile(L["soundgoforbuff"])
				end	
			end
		end				
	end	
	
	SendChatMessage(string.format( L["group_spore_warn"], currentsporegroup), "RAID_WARNING")
end

function BigWigsLoathebTactical:ReverseGroup(numgroups, currentgroup)
	local endgroup = 9 - numgroups 
	local curgroup = endgroup 
	for i = numgroups, endgroup, -1 do
		if i == currentgroup then 
			return curgroup
		end
		curgroup = curgroup + 1		
	end
	-- safety catch redundant, if we reach this point something messed up
	return curgroup
end
------------------------------
--      Event Handlers      --
------------------------------

function BigWigsLoathebTactical:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == string.format(UNITDIESOTHER, boss) then
		self.core:ToggleModuleActive(self, false)
	end
end
