local L = AceLibrary("AceLocale-2.2"):new("AutoGossip")
Automaton_Gossip = Automaton:NewModule("Gossip", "AceEvent-2.0", "AceDebug-2.0")

L:RegisterTranslations("enUS", function() return {
    ["Gossip"] = true,
	["Automatically complete quests and skip gossip text"] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
    ["Gossip"] = "Болтовня",
	["Automatically complete quests and skip gossip text"] = "Автоматически завершает задания и пропускает текст болтовни.",
} end)

L:RegisterTranslations("koKR", function() return {
    ["Gossip"] = "잡담 무시",
	["Automatically complete quests and skip gossip text"] = "퀘스트 자동 완료 및 NPC와의 잡담을 무시합니다.",
} end)

Automaton.options.args.gossip = {
	type = 'toggle',
	name = L["Gossip"],
	desc = L["Automatically complete quests and skip gossip text"],
	get = function() return Automaton:IsModuleActive("Gossip") end,
	set = function(v) Automaton:ToggleModuleActive("Gossip", v) end,
}
local autoGossipData = {}
local autoQuestData = {}
function Automaton_Gossip:OnInitialize()
	autoGossipData = Automaton_Gossip:GetGossipData()
	autoQuestData = Automaton_Gossip:GetQuestData()
end

function Automaton_Gossip:OnEnable()
	self:RegisterEvent("GOSSIP_SHOW")
	self:RegisterEvent("QUEST_PROGRESS")
	self:RegisterEvent("QUEST_COMPLETE")
	self:RegisterEvent("QUEST_DETAIL")
end

function Automaton_Gossip:GOSSIP_SHOW()
	if IsShiftKeyDown() then return end

	local g = self:ProcessGossip(GetGossipOptions())

	if table.getn(g) > 1 then
		self:Debug("Too many gossips to pick from, doing nothing.")
		return
	elseif table.getn(g) == 1 then
		local z,_ = GetGossipAvailableQuests()
		local x,_ = GetGossipActiveQuests()
		if (x or z) and not (g[1][2] == "gossip") then
			self:Debug("Not AutoGossiping because there's an available or active quest.")
		else
			self:Debug(g[1][1])
			SelectGossipOption(g[1][3])
			return
		end
	end

	if self:CheckQuests(self:ProcessQuests(GetGossipActiveQuests()), SelectGossipActiveQuest) then
		return
	end
	if self:CheckQuests(self:ProcessQuests(GetGossipAvailableQuests()), SelectGossipAvailableQuest) then
		return
	end
end

function Automaton_Gossip:QUEST_DETAIL()
	local q = GetTitleText()
	if autoQuestData[q] then
		self:Debug("AutoAccepting "..q..".")
		AcceptQuest()
	end
end

function Automaton_Gossip:QUEST_PROGRESS()
	local q = GetTitleText()
	if autoQuestData[q] and IsQuestCompletable() then
		self:Debug("AutoCompleting "..q..".")
		CompleteQuest()
	end
end

function Automaton_Gossip:QUEST_COMPLETE()
	local q = GetTitleText()
	if autoQuestData[q] then
		self:Debug("AutoRewardPicking "..q..".")
		GetQuestReward(0)
	end
end

function Automaton_Gossip:ProcessGossip(...)
	local gossips = {}
	for i = 1, table.getn(arg), 2 do
		local title, type = arg[i], arg[i+1]
		if autoGossipData[type] then
			if table.getn(autoGossipData[type]) == 0 then
				tinsert(gossips, {title, type, (i+1)/2})
			else
				for k,v in autoGossipData[type] do
					if v == title then
						tinsert(gossips, {title, type, (i+1)/2})
					end
				end
			end
		end
	end
	return gossips
end

function Automaton_Gossip:ProcessQuests(...)
	local quests = {}
	for i = 1, table.getn(arg), 2 do
		local title, level = arg[i], arg[i+1]
		if autoQuestData[title] then
			local good = true
			if autoQuestData[title].items then
				for k, v in autoQuestData[title].items do
					if tonumber(self:SearchBagsForQuantity(k)) < v then
						good = false
						break
					end
				end
			end
			if good then
				tinsert(quests, {title, level, (i+1)/2})
			end
		end
	end
	return quests
end

function Automaton_Gossip:CheckQuests(quests, func)
	if table.getn(quests) > 1 then
		local quest, priority = nil, 0
		for k,v in quests do
			self:Debug(k,v)
			if autoQuestData[v[1]].priority and autoQuestData[v[1]].priority > priority then
				priority = autoQuestData[v[1]].priority
				quest = k
			end
		end
		self:Debug("AutoActiveQuest: "..quests[quest][1])
		func(quests[quest][3])
		return true
	elseif table.getn(quests) == 1 then
		self:Debug("AutoActiveQuest: "..quests[1][1])
		func(quests[1][3])
		return true
	end
	return false
end

function Automaton_Gossip:SearchBagsForQuantity(itemname)
	local quantity = 0
	for bag = 0, 4 do
		if GetContainerNumSlots(bag) > 0 then
			for slot = 0, GetContainerNumSlots(bag) do
				if GetContainerItemLink(bag, slot) then
					local _,_,link = string.find(GetContainerItemLink(bag, slot), "(item:%d+:%d+:%d+:%d+)")
					local item = GetItemInfo(link)

					if item == itemname then
						local _,q = GetContainerItemInfo(bag, slot)
						quantity = quantity + q
					end
				end
			end
		end
	end
	return quantity
end