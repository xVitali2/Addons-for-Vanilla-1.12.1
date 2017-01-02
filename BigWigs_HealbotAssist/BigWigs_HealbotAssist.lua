--[[
--
-- BigWigs Strategy Module for Loatheb in Naxxramas.
--
-- Creates a list of the healers and sorts them according
-- to when they should heal.
--
--]]

------------------------------
--      Are you local?      --
------------------------------

local myname = "Healbot Assist"
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..myname)
local boss = AceLibrary("Babble-Boss-2.2")["Loatheb"]
local LL = AceLibrary("AceLocale-2.2"):new("BigWigs"..boss)

local tablet = AceLibrary("Tablet-2.0")
local roster = nil
local healerChannel = nil
local ignoreList = nil

local COLOR_GREEN = "00ff00"
local COLOR_WHITE = "ffffff"
local COLOR_RED = "ff0000"
local COLOR_GREY = "aaaaaa"

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "HealbotAssist",

	bar_cmd = "bar",
	bar_name = "Corrupted Mind Bar",
	bar_desc = "Show bar for your own Corrupted Mind debuff.",

	healnotify_cmd = "notify",
	healnotify_name = "Notify heals",
	healnotify_desc = "Sends a raid warning about who healed and who is next.",
	
	localhealnotify_cmd = "localnotify",
	localhealnotify_name = "Notify when it's your turn to heal",
	localhealnotify_desc = "Will show local messages that alerts you when you are suppose to heal",

	notwhisper_cmd = "notwhisper",
	notwhisper_name = "Do NOT whisper healing rotation",
	notwhisper_desc = "Toggles whispering the next one and the one after him to heal and get ready.",

	spore_cmd = "spore",
	spore_name = "Spore rotation",
	spore_desc = "Whisper spore rotation to the raid members.",
	
	sporeicon_cmd = "sporeicon",
	sporeicon_name = "Spore rotation icons",
	sporeicon_desc = "Place raid icons on the group that is suppose to grab a spore",

	bar_text = "Corrupted Mind",

	slash_cmd = "/bwhba",
	slash_desc = "Options for Big Wigs Healbot Assist.",

	tabletshow_cmd = "show",
	tabletshow_desc = "Shows the list of healers.",
	tablethide_cmd = "hide",
	tablethide_desc = "Hides the list of healers.",
	setchannel_cmd = "channel",
	setchannel_desc = "Sets the channel to spam healing messages in.",

	["Big Wigs Healbot Assist"] = true,
	["Healer"] = true,
	["Timer"] = true,
	["You have received a healer list for Loatheb from %s, accept this list?"] = true,
	["Yes"] = true,
	["No"] = true,
	["Ready"] = true,
	["Next"] = true,
	["Corrupted Mind"] = true,
	["The leader will automatically whisper the next one in line when to heal."] = true,
	["Get ready!"] = true,
	["Heal now!"] = true,
	["[BWHBA] You are the first healer, heal when ready."] = true,
	["[BWHBA] You are the second healer, heal when you get the message."] = true,
	["%s healed - %s is next!"] = true,
	["<channelname>"] = true,
	["You are NOT in a healer channel. Please set one using /bwhba setchannel <channelname>."] = true,
	["Everyone has debuff!"] = true,
	["Your announce channel is set to %s."] = true,
	["Healing rotation is set to: %s - you will get whispers when to heal."] = true,
	["The channel %s was not found, please set a healer channel with /bwhba setchannel <channelname>."] = true,
	["Offline"] = true,
	["Dead"] = true,
	["Healer list not populated yet, please click here to do so now."] = true,
	["Commands"] = true,
	["Print rotation to raidchat"] = true,
	["Re-scan healers"] = true,
	["Ignore target"] = true,
	["Healer list refreshed."] = true,
	["%s will be blocked from healing rotation."] = true,
	["%s can be in healing rotation."] = true,
	["[BWHBA] Healing rotation: %s."] = true,
	["%[BWHBA%] Healing rotation: (.*)."] = true,
	["Healing rotation broadcasted by %s."] = true,
	["Healing rotation not broadcasted yet."] = true,
	["Group %d is next for spore!"] = true,
	["Kill spore!"] = true,
	["Get ready for spore!"] = true,
	["Get ready to heal!"] = true,
	["Your turn to heal!"] = true,
} end )

L:RegisterTranslations("ruRU", function() return {
	cmd = "HealbotAssist",

	bar_cmd = "bar",
	bar_name = "Испорченный разум",
	bar_desc = "Показывает полосу когда на вас дебаф Испорченный разум.",

	healnotify_cmd = "notify",
	healnotify_name = "Уведомление о лечении",
	healnotify_desc = "Отправляет предупреждение в рейд о том, кто исцеляет сейчас, и кто будет следующим.",
	
	localhealnotify_cmd = "localnotify",
	localhealnotify_name = "Сообщать о вашей очереди исцелять",
	localhealnotify_desc = "Показывает локальное сообщение, которое предупредит вас, когда предположительно вам исцелять.",

	notwhisper_cmd = "notwhisper",
	notwhisper_name = "Не сообщать о ротации исцеления",
	notwhisper_desc = "Вкл/Выкл сообщение шепотом, которое предупреждает следующего и следующего после него о приготовлении к исцелению.",

	spore_cmd = "spore",
	spore_name = "Ротация Спор",
	spore_desc = "Сообщать шепотом о ротации спор участникам рейда.",
	
	sporeicon_cmd = "sporeicon",
	sporeicon_name = "Ротация Спор - Метка",
	sporeicon_desc = "Ставит метку рейда на группу для захвата споры.",

	bar_text = "Испорченный разум",

	slash_cmd = "/bwhba",
	slash_desc = "Big Wigs опции для Healbot Assist.",

	tabletshow_cmd = "show",
	tabletshow_desc = "Показывает список целителей.",
	tablethide_cmd = "hide",
	tablethide_desc = "Скрывает список целителей.",
	setchannel_cmd = "channel",
	setchannel_desc = "Устанавливает канал для спама сообщений целителям.",

	["Big Wigs Healbot Assist"] = "Big Wigs Healbot Assist",
	["Healer"] = "Целитель",
	["Timer"] = "Таймер",
	["You have received a healer list for Loatheb from %s, accept this list?"] = "Вы получили список целителей для Лотхиба от %s, принять данный лист?",
	["Yes"] = "Да",
	["No"] = "Нет",
	["Ready"] = "Готов",
	["Next"] = "След.",
	["Corrupted Mind"] = "Испорченный разум",
	["The leader will automatically whisper the next one in line when to heal."] = "Лидер автоматически шепчет следующему в очереди, когда исцелять.",
	["Get ready!"] = "Приготовьтесь!",
	["Heal now!"] = "Лечите сейчас!",
	["[BWHBA] You are the first healer, heal when ready."] = "[BWHBA] Вы первый целитель, лечите когда будете готовы.",
	["[BWHBA] You are the second healer, heal when you get the message."] = "[BWHBA] Вы второй целитель, начинайте лечить, когда получите личное сообщение.",
	["%s healed - %s is next!"] = "%s лечит - %s следующий!",
	["<channelname>"] = "<channelname>",
	["You are NOT in a healer channel. Please set one using /bwhba setchannel <channelname>."] = "Вы не в канале целителей. Пожалуйста, установите его, используя /bwhba setchannel <channelname>.",
	["Everyone has debuff!"] = "На всех дебаф!",
	["Your announce channel is set to %s."] = "Ваш канал объявлений установлен в %s.",
	["Healing rotation is set to: %s - you will get whispers when to heal."] = "Ротация исцеления устанавливается: %s - вы получите личное сообщение когда нужно лечить.",
	["The channel %s was not found, please set a healer channel with /bwhba setchannel <channelname>."] = "Канал %s не был найден, пожалуйста, установите канал целителей /bwhba setchannel <channelname>.",
	["Offline"] = "Не в сети",
	["Dead"] = "Мертв",
	["Healer list not populated yet, please click here to do so now."] = "Список целителей еще не готов, пожалуйста, нажмите здесь, чтобы сделать это.",
	["Commands"] = "Команды",
	["Print rotation to raidchat"] = "Вывести ротацию в рейд-чат",
	["Re-scan healers"] = "Пере-сканировать целителей",
	["Ignore target"] = "Игнорировать цель",
	["Healer list refreshed."] = "Обновляется список целителей.",
	["%s will be blocked from healing rotation."] = "%s будет заблокировано от ротации целителей.",
	["%s can be in healing rotation."] = "%s может быть в ротации целителей.",
	["[BWHBA] Healing rotation: %s."] = "[BWHBA] Ротация целителей %s.",
	["%[BWHBA%] Healing rotation: (.*)."] = "%[BWHBA%] Ротация целителей: (.*).",
	["Healing rotation broadcasted by %s."] = "Ротация целителей транслируется от %s.",
	["Healing rotation not broadcasted yet."] = "Ротация целителей не транслируется.",
	["Group %d is next for spore!"] = "Группа %d след. на споры!",
	["Kill spore!"] = "Убейте спору!",
	["Get ready for spore!"] = "Приготовьтесь к споре!",
	["Get ready to heal!"] = "Приготовьтесь к лечению!",
	["Your turn to heal!"] = "Ваша очередь исцелять!",
} end )

L:RegisterTranslations("koKR", function() return {
	bar_name = "부패한 정신 바",
	bar_desc = "부패한 정신 디버프에 대한 바를 표시합니다.",

	healnotify_name = "치유 알림",
	healnotify_desc = "치유한 사람과 다음 사람에 대해 공격대 경고로 알립니다.",
	
	localhealnotify_name = "당신 순번 알림",
	localhealnotify_desc = "당신이 치유할 순서에 로컬 메세지를 표시합니다.",

	notwhisper_name = "치유 순번 귓말 미사용",
	notwhisper_desc = "치유 순번을 귓속말로 알리는 기능을 켜거나 끄는 것을 전환합니다.",

	spore_name = "포자 회전",
	spore_desc = "공대원에게 포자 회전에 대한 귓속말을 보냅니다.",
	bar_text = "부패한 정신",

	slash_desc = "BigWigs Healbot Assist에 대한 설정.",

	tabletshow_desc = "힐러 목록을 표시합니다.",
	tablethide_desc = "힐러 목록을 숨깁니다.",
	setchannel_desc = "치유 메세지 채널을 설정합니다.",

	["Healer"] = "힐러",
	["Timer"] = "타이머",
	["You have received a healer list for Loatheb from %s, accept this list?"] = "%s|1으로;로; 부터 로데브에 대한 힐러 목록을 받았습니다. 이 목록을 수락하시겠습니까?",
	["Yes"] = "예",
	["No"] = "아니오",
	["Ready"] = "준비",
	["Next"] = "다음",
	["Corrupted Mind"] = "부패한 정신",
	["The leader will automatically whisper the next one in line when to heal."] = "공대장은 다음 치유할 사람에게 자동으로 귓속말을 보냅니다.",
	["Get ready!"] = "준비하세요!",
	["Heal now!"] = "지금 치유!",
	["[BWHBA] You are the first healer, heal when ready."] = "[BWHBA] 당신은 첫 힐러 입니다. 준비되면 치유하세요.",
	["[BWHBA] You are the second healer, heal when you get the message."] = "[BWHBA] 당신은 다음 힐러입니다. 메세지를 받으면 힐하세요.",
	["%s healed - %s is next!"] = "%s|1이;가; 치유 - 다음 %s!",
	["<channelname>"] = "<채널명>",
	["You are NOT in a healer channel. Please set one using /bwhba setchannel <channelname>."] = "당신은 힐러 채널에 없습니다. 채널 설정 : /bwhba setchannel <채널명>",
	["Everyone has debuff!"] = "모두 디버프에 걸림!",
	["Your announce channel is set to %s."] = "알림 채널이 %s|1으로;로; 설정되었습니다.",
	["Healing rotation is set to: %s - you will get whispers when to heal."] = "치유 순번 설정: %s - 귓속말을 받으면 힐하세요.",
	["The channel %s was not found, please set a healer channel with /bwhba setchannel <channelname>."] = "%s 채널을 찾을 수 없습니다. 힐러 채널 설정 : /bwhba setchannel <채널명>.",
	["Offline"] = "오프라인",
	["Dead"] = "죽음",
	["Healer list not populated yet, please click here to do so now."] = "힐러 목록이 아직 준비되지 않았습니다. 등록하세요.",
	["Commands"] = "명령어",
	["Print rotation to raidchat"] = "공격대 대화로 순번을 출력합니다.",
	["Re-scan healers"] = "힐러 재설정",
	["Ignore target"] = "대상 무시",
	["Healer list refreshed."] = "힐러 목록이 갱신되었습니다.",
	["%s will be blocked from healing rotation."] = "%s|1은;는; 치유 순번에서 차단될 것 입니다.",
	["%s can be in healing rotation."] = "%s|1은;는; 치유 순번에 있습니다.",
	["[BWHBA] Healing rotation: %s."] = "[BWHBA] 힐 순번: %s.",
	["%[BWHBA%] Healing rotation: (.*)."] = "%[BWHBA%] 치유 순번: (.*).",
	["Healing rotation broadcasted by %s."] = "%s에 의해 치유 순번이 알려졌습니다.",
	["Healing rotation not broadcasted yet."] = "아직 치유 순번이 알려지지 않았습니다.",
	["Group %d is next for spore!"] = "%d 파티는 다음번 포자!",
	["Kill spore!"] = "포자 처리!",
	["Get ready for spore!"] = "포자 처리 준비!",
	["Get ready to heal!"] = "치유 준비!",
	["Your turn to heal!"] = "당신 순서!",
} end )

L:RegisterTranslations("zhCN", function() return {
--	cmd = "HealbotAssist",

--	bar_cmd = "bar",
	bar_name = "堕落心灵",
	bar_desc = "显示你中堕落心灵debuff的计时条。",

--	healnotify_cmd = "notify",
	healnotify_name = "治疗通知",
	healnotify_desc = "通过团队警报发送谁已治疗及下一个治疗。",

--	notwhisper_cmd = "notwhisper",
	notwhisper_name = "不要密语治疗链",
	notwhisper_desc = "选择密语下一个和下下个需要治疗以及准备治疗的玩家。",

--	spore_cmd = "spore",
	spore_name = "孢子警报",
	spore_desc = "密语通知团队成员。",

	bar_text = "堕落心灵",

	slash_cmd = "/bwhba",
	slash_desc = "设置BigWigs洛欧塞布治疗助手",

--	tabletshow_cmd = "show",
	tabletshow_desc = "显示治疗者清单",
--	tablethide_cmd = "hide",
	tablethide_desc = "隐藏治疗者清单",
--	setchannel_cmd = "channel",
	setchannel_desc = "设置一个发送治疗信息的频道。",

	["Big Wigs Healbot Assist"] = "BigWigs洛欧塞布治疗助手",
	["Healer"] = "治疗者",
	["Timer"] = "计时器",
	["You have received a healer list for Loatheb from %s, accept this list?"] = "你是否接受从%S发送的治疗链清单?",
	["Yes"] = "是",
	["No"] = "否",
	["Ready"] = "准备",
	["Next"] = "下个",
	["Corrupted Mind"] = "堕落心灵",
	["The leader will automatically whisper the next one in line when to heal."] = "团长将会自动密语下个需要治疗的在线玩家。",
	["Get ready!"] = "准备！- 注意！",
	["Heal now!"] = "立刻治疗！",
	["[BWHBA] You are the first healer, heal when ready."] = "[BWHBA]你是第一个治疗，做好准备开始治疗。",
	["[BWHBA] You are the second healer, heal when you get the message."] = "[BWHBA]你是第二个治疗，你收到命令后开始治疗！",
	["%s healed - %s is next!"] = "%s已治疗 - %s准备！",
	["<channelname>"] = "<频道名>",
	["You are NOT in a healer channel. Please set one using /bwhba setchannel <channelname>."] = "你不在治疗频道！请输入/bwhba setchannel设置<频道名>。",
	["Everyone has debuff!"] = "所有人都无法治疗",
	["Your announce channel is set to %s."] = "你的通告频道被设置为%s。",
	["Healing rotation is set to: %s - you will get whispers when to heal."] = "治疗链设置为：%s－当收到密语通知，你开始治疗。",
	["The channel %s was not found, please set a healer channel with /bwhba setchannel <channelname>."] = "频道%s没有找到，请重新输入/bwhba setchannel设置<频道名>。",
	["Offline"] = "离线",
	["Dead"] = "死亡",
	["Healer list not populated yet, please click here to do so now."] = "治疗清单未被添加，请按这里进行添加。",
	["Commands"] = "参数",
	["Print rotation to raidchat"] = "在团队频道中显示治疗链",
	["Re-scan healers"] = "重新搜索治疗名单",
	["Ignore target"] = "忽略目标",
	["Healer list refreshed."] = "刷新治疗清单。",
	["%s will be blocked from healing rotation."] = "%s将从治疗链中忽视",
	["%s can be in healing rotation."] = "%s加入治疗链。",
	["[BWHBA] Healing rotation: %s."] = "[BWHBA]治疗链：%s。",
	["%[BWHBA%] Healing rotation: (.*)."] = "%[BWHBA%] 治疗链: (.*)。",
	["Healing rotation broadcasted by %s."] = "治疗链广播通告%s。",
	["Healing rotation not broadcasted yet."] = "治疗链没用广播通告。",
	["Group %d is next for spore!"] = "下个%s小队将出现袍子！",
	["Kill spore!"] = "快杀袍子！",
	["Get ready for spore!"] = "准备，袍子出现！",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsHealbotAssist = BigWigs:NewModule(myname, "AceConsole-2.0")
BigWigsHealbotAssist.synctoken = myname
BigWigsHealbotAssist.zonename = AceLibrary("Babble-Zone-2.2")["Naxxramas"]
BigWigsHealbotAssist.enabletrigger = { boss }
BigWigsHealbotAssist.toggleoptions = { "healnotify", "notwhisper", "spore", "sporeicon", -1, "localhealnotify", "bar" }
BigWigsHealbotAssist.revision = tonumber(string.sub("$Revision: 17267 $", 12, -3))
BigWigsHealbotAssist.external = true

------------------------------
--      Initialization      --
------------------------------

function BigWigsHealbotAssist:OnRegister()
	self:RegisterChatCommand({ L["slash_cmd"] }, {
		type = "group",
		args = {
			show = {
				type = "execute", name = L["tabletshow_cmd"],
				desc = L["tabletshow_desc"],
				func = function() self:ShowTablet() end,
			},
			hide = {
				type = "execute", name = L["tablethide_cmd"],
				desc = L["tablethide_desc"],
				func = function() self:HideTablet() end,
			},
			setchannel = {
				type = "text", name = L["setchannel_cmd"],
				desc = L["setchannel_desc"],
				set = function(v) self:SetChannel(v) end,
				get = false,
				usage = L["<channelname>"],
			},
			--[[ignore = {
				type = "text", name = L["ignore_cmd"],
				desc = L["ignore_desc"],
				set = function(v) self:IgnoreCmd(v) end,
				get = function() self:PrintIgnore() end
				usage = 
			}]]
		},
	})
end

function BigWigsHealbotAssist:OnEnable()
	if not roster then roster = AceLibrary("RosterLib-2.0") end
	if not healerChannel then healerChannel = self.db.profile.healerChannel end

	if not healerChannel then
		self:Print(L["You are NOT in a healer channel. Please set one using /bwhba setchannel <channelname>."])
	else
		self:Print(string.format(L["Your announce channel is set to %s."], healerChannel))
	end

	self.playerName = UnitName("player")
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	self:RegisterEvent("SEEAEO_UnitDebuffLost")
	self:RegisterEvent("SEEAEO_UnitDebuffGained")
	self:RegisterEvent("CHAT_MSG_RAID")
	self:RegisterEvent("CHAT_MSG_RAID_LEADER", "CHAT_MSG_RAID")

	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "HealBotGetReady", 2)
	self:TriggerEvent("BigWigs_ThrottleSync", "HealBotYourTurn", 2)

	-- XXX self.healerList
	-- XXX broadcast with
	-- ["Healing rotation is set to: %s - you will get whispers when to heal."]

	self:ShowTablet()
end

function BigWigsHealbotAssist:OnDisable()
	roster = nil

	self:HideTablet()
end

------------------------------
--      Events              --
------------------------------

-- Ninjaed from lua-users.org
local function strsplit(delimiter, text)
	local list = {}
	local pos = 1
	if strfind("", delimiter, 1) then -- this would result in endless loops
		self.error("delimiter matches empty string!")
	end
	while 1 do
		local first, last = strfind(text, delimiter, pos)
		if first then -- found?
			tinsert(list, strsub(text, pos, first-1))
			pos = last+1
		else
			tinsert(list, strsub(text, pos))
			break
		end
	end
	return list
end

function BigWigsHealbotAssist:CHAT_MSG_RAID(msg, author)
	local _,_,rotation = string.find(msg, L["%[BWHBA%] Healing rotation: (.*)."])
	if rotation then
		local unit = roster:GetUnitObjectFromName(author)
		if unit.name ~= self.playerName and unit.rank > 0 then
			self:Print(string.format(L["Healing rotation broadcasted by %s."], author))
			local healers = strsplit(",%s*", rotation)
			self:CreateHealerList(healers)
		end
	end
end



function BigWigsHealbotAssist:BigWigs_RecvSync( sync, rest, nick )
	if sync == "HealBotGetReady" and rest and self.db.profile.localhealnotify then
		local player = rest
		if player == self.playerName then
			self:TriggerEvent("BigWigs_Message", L["Get ready to heal!"], "Attention", true)
		end
	elseif sync == "HealBotYourTurn" and rest and self.db.profile.localhealnotify then
		local player = rest
		if player == self.playerName then
			self:TriggerEvent("BigWigs_Message", L["Your turn to heal!"], "Urgent", true, "Alert")
		end
	elseif sync == "LoathebSporeSpawn2" and rest then
		if not self.db.profile.spore then return end
		local numGroups = 8 -- Change to 7 if you don't want group 8 to get the spores (MT group)
		rest = tonumber(rest)
		if not rest then return end
		
		local currentSpore = rest-1

		local group = mod(currentSpore, numGroups)
		if group == 0 then group = numGroups end
		
		local nextGroup = mod(currentSpore+1, numGroups)
		if nextGroup == 0 then nextGroup = numGroups end

		self:TriggerEvent("BigWigs_Message", string.format(L["Group %d is next for spore!"], nextGroup), "Attention")
		
		-- Whisper all the people in the group to go, and put a raid mark on the group members
		local raidicon = 1;
		for k, u in pairs(roster.roster) do
			if u and u.name and u.class ~= "PET" and u.subgroup ~= nil then
				if u.subgroup == group then
					if self.db.profile.sporeicon then
						SetRaidTarget(u.unitid, raidicon)
						raidicon = raidicon + 1
					end
					self:TriggerEvent("BigWigs_SendTell", u.name, L["Kill spore!"])
				elseif u.subgroup == nextGroup then
					self:TriggerEvent("BigWigs_SendTell", u.name, L["Get ready for spore!"])
				end
			end
		end
	end
end

function BigWigsHealbotAssist:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == string.format(UNITDIESOTHER, boss) then
		self.core:ToggleModuleActive(self, false)
	end
end

------------------------------
--      Tablet              --
------------------------------

function BigWigsHealbotAssist:OnTooltipUpdate()
	if not tablet:IsRegistered("BigWigs_HealbotAssist") then return end

	local cat = tablet:AddCategory(
		"columns", 3,
		"text", "#",
		"text2", L["Healer"],
		"text3", L["Timer"],
		"child_justify1", "LEFT",
		"child_justify2", "LEFT",
		"child_justify3", "RIGHT"
	)
	local counter = 1

	-- Find the first unit.
	-- XXX Use self.healerList
	local unit = nil
	local firstUnit = nil
	for n, u in pairs(roster.roster) do
		if u and u.name and u.class ~= "PET" and u.inHealbotRotation and u.isFirstInRotation then
			firstUnit = u
			break
		end
	end
	unit = firstUnit

	local addMore = true
	while addMore and unit do
		local unitName = unit.name
		local statusLine = nil
		-- This overwrites the rgb values given in addline, and green is not
		-- used by any healer class.
		if unitName == self.playerName then unitName = "|cff"..COLOR_RED.."<<<"..unitName..">>>|r" end
		if UnitIsDeadOrGhost(unit.unitid) then
			statusLine = "|cff"..COLOR_GREY..L["Dead"].."|r"
		elseif not UnitIsConnected(unit.unitid) then
			statusLine = "|cff"..COLOR_GREY..L["Offline"].."|r"
		elseif unit.healbotDebuffTimer then
			statusLine = "|cff"..COLOR_RED..unit.healbotDebuffTimer.."|r"
		else
			statusLine = "|cff"..COLOR_GREEN..L["Ready"].."|r"
		end
		cat:AddLine("text", "|cff"..COLOR_WHITE..tostring(counter).."|r",
					"text2", unitName,
					"text2R", RAID_CLASS_COLORS[unit.class].r,
					"text2G", RAID_CLASS_COLORS[unit.class].g,
					"text2B", RAID_CLASS_COLORS[unit.class].b,
					"text3", statusLine)
		counter = counter + 1
		if firstUnit.name == unit.nextInRotation or counter == 40 then
			addMore = false
			break
		else
			unit = roster:GetUnitObjectFromName(unit.nextInRotation)
		end
	end

	if IsRaidOfficer() or IsRaidLeader() then
		if counter == 1 then
			local cat = tablet:AddCategory("columns", 1)
			cat:AddLine("text", L["Healer list not populated yet, please click here to do so now."],
						"func", function() self:CreateHealerList() end)
		end
		local cat2 = tablet:AddCategory("columns", 1, "text", L["Commands"], "child_justify1", "CENTER")

		cat2:AddLine(
				"text", L["Print rotation to raidchat"],
				"func", function() self:PrintRotation() end)
		cat2:AddLine(
				"text", L["Re-scan healers"],
				"func", function() self:CreateHealerList() end)
		cat2:AddLine(
				"text", L["Ignore target"],
				"func", function() self:IgnoreTarget() end)
	elseif counter == 1 then
		local cat = tablet:AddCategory("columns", 1)
		cat:AddLine("text", L["Healing rotation not broadcasted yet."])
	end

	tablet:SetHint(L["The leader will automatically whisper the next one in line when to heal."])
end

function BigWigsHealbotAssist:ShowTablet()
	if not tablet:IsRegistered("BigWigs_HealbotAssist") then
		tablet:Register("BigWigs_HealbotAssist",
			"children",
				function()
					tablet:SetTitle(L["Big Wigs Healbot Assist"])
					self:OnTooltipUpdate()
				end,
			"clickable", true,
			"showTitleWhenDetached", true,
			"showHintWhenDetached", true,
			"cantAttach", true
		)
	end

	if not self:IsEventScheduled("bwhbaupdate") then
		self:ScheduleRepeatingEvent("bwhbaupdate", function() tablet:Refresh("BigWigs_HealbotAssist") end, 1)
	end

	if tablet:IsAttached("BigWigs_HealbotAssist") then
		tablet:Detach("BigWigs_HealbotAssist")
	end
end

function BigWigsHealbotAssist:HideTablet()
	if not tablet:IsRegistered("BigWigs_HealbotAssist") then return end

	self:CancelScheduledEvent("bwhbaupdate")

	tablet:Attach("BigWigs_HealbotAssist")
end

------------------------------
--      Roster              --
------------------------------

function BigWigsHealbotAssist:IgnoreTarget()
	if not UnitExists("target") then return end
	if not IsRaidLeader() and not IsRaidOfficer() then return end
	local unit = roster:GetUnitObjectFromName(UnitName("target"))
	if not unit then return end
	if unit.bwhbaIgnore then
		unit.bwhbaIgnore = nil
		self:Print(string.format(L["%s can be in healing rotation."], unit.name))
	else
		unit.bwhbaIgnore = true
		self:Print(string.format(L["%s will be blocked from healing rotation."], unit.name))
	end	
end

function BigWigsHealbotAssist:CreateHealerList(table)
	local firstunit = nil
	local lastunit = nil

	for n, u in pairs(roster.roster) do
		u.healbotDebuffTimer = nil
		u.nextInRotation = nil
		u.inHealbotRotation = nil
	end

	if not table then table = roster.roster end

	for n, u in pairs(table) do
		if type(u) == "string" then u = roster:GetUnitObjectFromName(u) end
		if u and u.name and u.class ~= "PET" then
			if (u.class == "PRIEST" or u.class == "DRUID" or u.class == "SHAMAN" or u.class == "PALADIN") and not u.bwhbaIgnore then
				u.inHealbotRotation = true
				if lastunit then
					lastunit.nextInRotation = u.name
				else
					-- this is the first unit.
					if not self.db.profile.notwhisper then
						self:TriggerEvent("BigWigs_SendTell", u.name, L["[BWHBA] You are the first healer, heal when ready."])
					end
					firstunit = u
					u.isFirstInRotation = true
				end
				lastunit = u
			else
				u.inHealbotRotation = nil
			end
			u.healbotDebuffTimer = nil
		end
	end
	if firstunit and lastunit then
		lastunit.nextInRotation = firstunit.name
		if not self.db.profile.notwhisper then
			self:TriggerEvent("BigWigs_SendTell", lastunit.name, L["[BWHBA] You are the second healer, heal when you get the message."])
		end
	end

	if tablet:IsRegistered("BigWigs_HealbotAssist") then
		tablet:Refresh("BigWigs_HealbotAssist")
	end

	self:Print(L["Healer list refreshed."])
	-- XXX Populate self.healerList
end

------------------------------
--      Messages            --
------------------------------

function BigWigsHealbotAssist:PrintRotation()
	if not IsRaidLeader() and not IsRaidOfficer() then return end

	local healers = nil
	local counter = 1
	local unit = nil
	local firstUnit = nil
	for n, u in pairs(roster.roster) do
		if u and u.name and u.class ~= "PET" and u.inHealbotRotation and u.isFirstInRotation then
			firstUnit = u
			break
		end
	end
	unit = firstUnit

	local more = true
	while more and unit do
		if not healers then
			healers = unit.name
		else
			healers = healers..", "..unit.name
		end
		counter = counter + 1
		if firstUnit.name == unit.nextInRotation or counter == 40 then
			more = false
			break
		else
			unit = roster:GetUnitObjectFromName(unit.nextInRotation)
		end
	end

	if not healers then return end
	SendChatMessage(string.format(L["[BWHBA] Healing rotation: %s."], healers), "RAID", nil, nil)
end

function BigWigsHealbotAssist:SetChannel(channelName)
	self.db.profile.healerChannel = channelName
	healerChannel = channelName
end

-- Finds the next healer with the least remaining on his debuff
-- in case everyone has debuff.
function BigWigsHealbotAssist:FindLowestDebuffTimer()
	local readySoon = 60
	local unit = nil
	for n, u in pairs(roster.roster) do
		if u.inHealbotRotation and UnitIsConnected(u.unitid) and not UnitIsDeadOrGhost(u.unitid) then
			if u.healbotDebuffTimer then
				if u.healbotDebuffTimer < readySoon then
					unit = u
					readySoon = u.healbotDebuffTimer
				end
			else
				unit = u
				break
			end
		end
	end
	return unit
end

function BigWigsHealbotAssist:FindNextUnit(aUnit)
	-- Traverse the nextInRotation chain until we find someone that is ready to
	-- heal.
	local unit = aUnit
	while not unit.inHealbotRotation or unit.healbotDebuffTimer or UnitIsDeadOrGhost(unit.unitid) or not UnitIsConnected(unit.unitid) do
		-- the current unit can not be in rotation for some reason, which is
		-- also true for the first unit object we get in.
		unit = roster:GetUnitObjectFromName(unit.nextInRotation)
		if unit and unit.unitid == aUnit.unitid then break end
	end
	-- If we're back at the original unit we got in, try to find the one with
	-- the lowest debuff.
	if unit.unitid == aUnit.unitid then
		-- Heh, this is the same unit that we got in at first,
		-- apparently there's noone left to heal. Get more healers!
		--self:TriggerEvent("BigWigs_Message", L["Everyone has debuff!"], "Red")
		unit = self:FindLowestDebuffTimer()
	end
	return unit
end

function BigWigsHealbotAssist:Whisper(unit)
	if not IsRaidLeader() and not IsRaidOfficer() then return end

	-- unit is the unit that just got the debuff.
	local firstUnitName = unit.name
	local nextUnit = self:FindNextUnit(unit)
	local getReadyUnit = roster:GetUnitObjectFromName(nextUnit.nextInRotation)
	if UnitIsDeadOrGhost(getReadyUnit.unitid) or not UnitIsConnected(getReadyUnit.unitid) then
		getReadyUnit = self:FindNextUnit(getReadyUnit)
	end
	
	self:TriggerEvent("BigWigs_SendSync", "HealBotGetReady ".. getReadyUnit.name)
	self:TriggerEvent("BigWigs_SendSync", "HealBotYourTurn ".. nextUnit.name)
		
	if not self.db.profile.notwhisper then
		-- ZZZ unit here should be someone that can heal.
		-- ZZZ nextHealer is the one scheduled to go next after that one.
		self:TriggerEvent("BigWigs_SendTell", nextUnit.name, L["Heal now!"])
		self:TriggerEvent("BigWigs_SendTell", getReadyUnit.name, L["Get ready!"])
	end
	

	if self.db.profile.healnotify and healerChannel then
		local id, name = GetChannelName(healerChannel)
		if name then
			SendChatMessage(string.format(L["%s healed - %s is next!"], firstUnitName, nextUnit.name), "CHANNEL", nil, id)
		else
			-- yeah this will spam. Good luck without a healer channel.
			self:Print(string.format(L["The channel %s was not found, please set a healer channel with /bwhba setchannel <channelname>."], healerChannel))
		end
	end
end

------------------------------
--      Buff handling       --
------------------------------

function BigWigsHealbotAssist:DecrementCounter(unit)
	if unit.healbotDebuffTimer == nil or tonumber(unit.healbotDebuffTimer) == nil then return end
	unit.healbotDebuffTimer = unit.healbotDebuffTimer - 1
end

function BigWigsHealbotAssist:SEEAEO_UnitDebuffGained(unitid, debuffName, applications, debuffType, texture)
	if debuffName == L["Corrupted Mind"] and texture == "Interface\\Icons\\Spell_Shadow_AuraOfDarkness" then
		local unit = roster:GetUnitObjectFromUnit(unitid)
		if unit and unit.inHealbotRotation and not unit.healbotDebuffTimer then
			if UnitIsUnit("player", unitid) and self.db.profile.bar then
				self:TriggerEvent("BigWigs_StartBar", self, L["bar_text"], 60, texture, "Red")
			end
			unit.healbotDebuffTimer = 60
			self:ScheduleRepeatingEvent("bwhbaunitdebuff"..unit.name, self.DecrementCounter, 1, self, unit)
			self:Whisper(unit)
		end
	end
end

function BigWigsHealbotAssist:SEEAEO_UnitDebuffLost(unitid, debuffName)
	if debuffName == L["Corrupted Mind"] and string.find(unitid, "raid%d+$") then
		local unit = roster:GetUnitObjectFromUnit(unitid)
		if unit and unit.inHealbotRotation and unit.healbotDebuffTimer then
			unit.healbotDebuffTimer = nil
			self:CancelScheduledEvent("bwhbaunitdebuff"..unit.name)
		end
	end
end

