--[[
	Name: Quixote-1.0
	Revision: $Revision: 15999 $
	Author(s): Kemayo (kemayo@gmail.com)
	Website: <http://link.to.recent.version/here>
	Documentation: <http://link.to.documentation/here>
	SVN: http://svn.wowace.com/wowace/trunk/Quixote/
	Description: Abstracts out questlog handling.
	Dependencies: AceLibrary, AceEvent, Deformat, (optional) Compost
]]

local MAJOR_VERSION = "Quixote-1.0"
local MINOR_VERSION = "$Revision: 15999 $"

if not AceLibrary then error(MAJOR_VERSION .. " requires AceLibrary") end
if not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION) then return end

if not AceLibrary:HasInstance("AceEvent-2.0") then error(MAJOR_VERSION .. " requires AceEvent-2.0.") end
if not AceLibrary:HasInstance("Deformat-2.0") then error(MAJOR_VERSION .. " requires Deformat-2.0.") end

local compost, deformat, AceEvent
local Quixote = {}

------------------------------------------------
-- Light localization
------------------------------------------------

local locale = GetLocale()
local TAG_ELITE, TAG_DUNGEON, TAG_PVP, TAG_RAID
TAG_ELITE = ELITE
TAG_PVP = PVP_ENABLED
TAG_RAID = RAID
if locale == 'enUS' then TAG_DUNGEON = "Dungeon"
elseif locale == 'koKR' then TAG_DUNGEON = "던전"
elseif locale == 'zhTW' then TAG_DUNGEON = "地下城"
elseif locale == 'frFR' then TAG_DUNGEON = "Donjon"
elseif locale == 'deDE' then TAG_DUNGEON = "Dungeon"
elseif locale == 'ruRU' then TAG_DUNGEON = "Подземелье"
else TAG_DUNGEON = "Dungeon" end

------------------------------------------------
-- activate, external
------------------------------------------------

local function activate(self, oldLib, oldDeactivate)
	if oldLib then
		self.quests = oldLib.quests
		self.quests_zone = oldLib.quests_zone
		self.quests_level = oldLib.quests_level
		self.mobs = oldLib.mobs
		self.items = oldLib.items
		self.quest_names = oldLib.quest_names
		self.zones = oldLib.zones
		self.numQuests = oldLib.numQuests
		self.numQuestsDone = oldLib.numQuestsDone
		self.firstScanDone = oldLib.firstScanDone
		
		oldLib:UnregisterAllEvents()
		oldLib:CancelAllScheduledEvents()
	end
	
	if not self.quests then self.quests = compost and compost:Acquire() or {} end
	if not self.quests_zone then self.quests_zone = compost and compost:Acquire() or {} end
	if not self.quests_level then self.quests_level = compost and compost:Acquire() or {} end
	if not self.mobs then self.mobs = compost and compost:Acquire() or {} end
	if not self.items then self.items = compost and compost:Acquire() or {} end
	if not self.quest_names then self.quest_names = compost and compost:Acquire() or {} end
	if not self.zones then self.zones = compost and compost:Acquire() or {} end
	if not self.numQuests then self.numQuests = 0 end
	if not self.numQuestsDone then self.numQuestsDone = 0 end
	if not self.firstScanDone then self.firstScanDone = false end
	
	if oldDeactivate then oldDeactivate(oldLib) end
end

local function external(self, major, instance)
	if major == "AceEvent-2.0" then
		AceEvent = instance
		AceEvent:embed(self)
		self:UnregisterAllEvents()
		self:CancelAllScheduledEvents()
		if AceEvent:IsFullyInitialized() then
			self:AceEvent_FullyInitialized()
		else
			self:RegisterEvent("AceEvent_FullyInitialized", "AceEvent_FullyInitialized", true)
		end
	elseif major == "Compost-2.0" then
		compost = instance
	elseif major == "Deformat-2.0" then
		deformat = instance
	end
end

------------------------------------------------
-- Internal functions
------------------------------------------------

function Quixote:AceEvent_FullyInitialized()
	self:TriggerEvent("Quixote_Enabled")
	self:RegisterBucketEvent("QUEST_LOG_UPDATE", 1)
	--We use a bucket event because scanning the quest log can trigger QUEST_LOG_UPDATE once per quest-related item if it has to repopulate the game's itemcache.
	
	self:QUEST_LOG_UPDATE()
end

------------------------------------------------
-- Quest scanning
------------------------------------------------

function Quixote:QUEST_LOG_UPDATE()
	local startingQuestLogSelection = GetQuestLogSelection()
	local numEntries, numQuests = GetNumQuestLogEntries()
	local numQuestsDone = 0
	
	local quests = compost and compost:Acquire() or {}
	local quests_level = compost and compost:Acquire() or {}
	local quests_zone = compost and compost:Acquire() or {}
	local items = compost and compost:Acquire() or {}
	local mobs = compost and compost:Acquire() or {}
	local zones = compost and compost:Acquire() or {}
	local quest_names = compost and compost:Acquire() or {}
	local zoneIndex = "Unknown" --The first item in the quest log should always be a header, so this should always be replaced.  But just in case, give it a default value.
	
	if numEntries > 0 then
		local questid
		for questid = 1, numEntries do
			local strQuestLogTitleText, strQuestLevel, strQuestTag, isHeader, isCollapsed, isComplete = GetQuestLogTitle(questid)
			
			if isHeader then
				zoneIndex = strQuestLogTitleText
				table.insert(zones, zoneIndex)
				quests_zone[zoneIndex] = compost and compost:Acquire() or {}
			else
				local q = compost and compost:Acquire() or {}
				local strQuestDescription, strQuestObjectives = GetQuestLogQuestText(questid)
				
				quest_names[strQuestLogTitleText] = questid
				
				q.zone = zoneIndex
				q.id = questid
				q.title = strQuestLogTitleText
				q.level = strQuestLevel
				q.tag = strQuestTag
				q.complete = isComplete
				--q.description = strQuestDescription
				q.objective = strQuestObjectives
				
				if isComplete == 1 then
					numQuestsDone = numQuestsDone + 1
				end
				
				local lb = compost and compost:Acquire() or {}
				if GetNumQuestLeaderBoards(questid) > 0 then
					local ii
					for ii=1, GetNumQuestLeaderBoards(questid) do
						local desc, qtype, done = GetQuestLogLeaderBoard(ii, questid)
						local numNeeded,numItems
						local l = compost and compost:Acquire() or {}
						
						if qtype == 'item' then
							desc,numItems,numNeeded = deformat(desc, QUEST_OBJECTS_FOUND)
							items[desc] = string.format("%s: %d/%d", strQuestLogTitleText, numItems, numNeeded)
						elseif qtype == 'monster' then
							mobName,numItems,numNeeded = deformat(desc, QUEST_MONSTERS_KILLED)
							if mobName == nil or numItems == nil or numNeeded == nil then
								--Sometimes we get objectives like "Find Mankrik's Wife: 0/1", which are listed as "monster".
								mobName, numItems, numNeeded = deformat(desc, QUEST_OBJECTS_FOUND)
							end
							desc = mobName
							mobs[desc] = string.format("%s: %d/%d", strQuestLogTitleText, numItems, numNeeded)
						elseif qtype == 'reputation' then
							desc,numItems,numNeeded = deformat(desc, QUEST_FACTION_NEEDED)
						elseif qtype == 'event' then
							numNeeded = 1
							if done then numItems = 1 else numItems = 0 end
						end
						
						l.description = desc
						l.type = qtype
						l.numGot = numItems
						l.numNeeded = numNeeded
						l.done = done
						
						table.insert(lb, l)
					end
				end
				q.leaderboard = lb
				
				quests[questid] = q
				table.insert(quests_zone[zoneIndex], questid)
				table.insert(quests_level, questid)
			end
		end
	end
	
	local oldquests, oldquest_names = self.quests, self.quest_names
	if compost then compost:ReclaimMulti(self.quests_zone, 1, self.quests_level, 1, self.mobs, 1, self.items, 1, self.zones, 1) end
	self.quests, self.quests_zone, self.quests_level, self.mobs, self.items, self.zones, self.quest_names = nil, nil, nil, nil, nil, nil, nil
	
	self.quests = quests
	self.quests_level = self:SortQuests(quests_level)
	for zone, quests in pairs(quests_zone) do
		quests_zone[zone] = self:SortQuests(quests)
	end
	self.quests_zone = quests_zone
	self.items = items
	self.mobs = mobs
	self.zones = zones
	self.numQuests = numQuests
	self.numEntries = numEntries
	self.numQuestsDone = numQuestsDone
	self.quest_names = quest_names
	
	if self.firstScanDone then
		--have we gained any quests?
		for name,id in pairs(quest_names) do
			if not oldquest_names[name] then
				self:TriggerEvent("Quixote_Quest_Gained", name, id)
			end
		end
		--have we lost any quests?
		for name, id in pairs(oldquest_names) do
			if not quest_names[name] then
				self:TriggerEvent("Quixote_Quest_Lost", name, id)
			end
		end
	end
	
	self.firstScanDone = true
	
	if compost then compost:ReclaimMulti(oldquests, 3, oldquest_names, 1) end
	oldquests, oldquest_names = nil, nil
	
	self:TriggerEvent("Quixote_Update")
end

-- Sorts a table of quests by level, with quests of the same level ordered
-- by elite, dungeon or raid tags, i.e. normal < elite < dungeon < raid.
-- Quests of the same level and tag are sorted alphabetically by title.
-- Returns a new table of the sorted quests. Original table is unchanged.
local mySort
function Quixote:SortQuests(quests)
	if not mySort then
		mySort = function(a,b)
			local q = self.quests
			local aa = q[a].level*4
			local bb = q[b].level*4
			if q[a].tag == TAG_ELITE then aa = aa+1
			elseif q[a].tag == TAG_DUNGEON then aa = aa+2
		elseif q[a].tag == TAG_RAID then aa = aa+3 end
			if q[b].tag == TAG_ELITE then bb = bb+1
			elseif q[b].tag == TAG_DUNGEON then bb = bb+2
		elseif q[b].tag == TAG_RAID then bb = bb+3 end
			if aa == bb then
				return q[a].title < q[b].title
			end
			return aa < bb;
		end
	end
	table.sort(quests, mySort)
	
	return quests
end

local function questIter(questList, i)
	i = i + 1
	v = questList[i]
	if v then
		return i, v
	end
end

------------------------------------------------
-- API
------------------------------------------------

function Quixote:IsQuestMob(mobname)
	if self.mobs and self.mobs[mobname] then
		local _, _, i, n = string.find(self.mobs[mobname], "(%d+)/(%d+)")
		return self.mobs[mobname], i, n
	end
end

function Quixote:IsQuestItem(itemname)
	if self.items[itemname] then
		local _, _, i, n = string.find(self.items[itemname], "(%d+)/(%d+)")
		return self.items[itemname], i, n
	end
end

function Quixote:IterZones()
	return questIter, self.zones, 0
end

function Quixote:QuestsByZone(zone)
	return questIter, self.quests_zone[zone], 0
end

function Quixote:QuestsByLevel()
	return questIter, self.quests_level, 0
end

function Quixote:GetQuest(q)
	if type(q)=='number' then return self:GetQuestById(q)
else return self:GetQuestByName(q) end
end

function Quixote:GetQuestById(q)
	local q = self.quests[q]
	if q then
		return q.title, q.level, q.tag, q.objective, q.complete, table.getn(q.leaderboard), q.zone, q.id
	end
end

function Quixote:GetQuestByName(q)
	return self:GetQuestById(self.quest_names[q])
end

function Quixote:GetNumQuests()
	return self.numQuests, self.numQuestsDone
end

function Quixote:GetQuestStatusById(q, i)
	if self.quests[q] and self.quests[q].leaderboard[i] then 
		local l = self.quests[q].leaderboard[i]
		return l.description, l.type, l.numGot, l.numNeeded, l.done
	end
end

function Quixote:GetReactionLevel(leveltext)
	-- Returns a numeric-equivalent for faction standings.
	if leveltext == FACTION_STANDING_LABEL1 then --Hated
		return 1
	elseif leveltext == FACTION_STANDING_LABEL2 then --Hostile
		return 2
	elseif leveltext == FACTION_STANDING_LABEL3 then --Unfriendly
		return 3
	elseif leveltext == FACTION_STANDING_LABEL4 then --Neutral
		return 4
	elseif leveltext == FACTION_STANDING_LABEL5 then --Friendly
		return 5
	elseif leveltext == FACTION_STANDING_LABEL6 then --Honored
		return 6
	elseif leveltext == FACTION_STANDING_LABEL7 then --Revered
		return 7
	elseif leveltext == FACTION_STANDING_LABEL8 then --Exalted
		return 8
	end
end

------------------------------------------------
-- Register!
------------------------------------------------

AceLibrary:Register(Quixote, MAJOR_VERSION, MINOR_VERSION, activate, nil, external)