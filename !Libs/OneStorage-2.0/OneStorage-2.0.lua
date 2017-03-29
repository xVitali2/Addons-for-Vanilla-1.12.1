local MAJOR_VERSION = "OneStorage-2.0"
local MINOR_VERSION = "$Revision: 15560 $"

-- This ensures the code is only executed if the libary doesn't already exist, or is a newer version
if not AceLibrary then error(MAJOR_VERSION .. " requires AceLibrary.") end
if not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION) then return end

if not AceLibrary:HasInstance("AceEvent-2.0") then error(MAJOR_VERSION .. " requires AceEvent-2.0.") end
if not AceLibrary:HasInstance("AceHook-2.0") then error(MAJOR_VERSION .. " requires AceHook-2.0.") end
if not AceLibrary:HasInstance("AceLocale-2.1") then error(MAJOR_VERSION .. " requires AceLocale-2.1.") end
if not AceLibrary:HasInstance("AceDB-2.0") then error(MAJOR_VERSION .. " requires AceDB-2.0.") end

OneStorage = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceHook-2.0")

local AL = AceLibrary("AceLocale-2.1")

AL:RegisterTranslation("OneStorage", "enUS", function() return { ["Quiver"] = true, ["Soul Bag"] = true, ["Container"] = true, ["Bag"] = true, ["Player of Realm"] = "(.+) .* (.+)" } end) -- (.+) of (.+) not working... wtf?!
AL:RegisterTranslation("OneStorage", "zhCN", function() return { ["Quiver"] = "箭袋", ["Soul Bag"] = "灵魂袋", ["Container"] = "背包", ["Bag"] = "包裹", ["Player of Realm"] = "(.+) 的 (.+)" } end)
AL:RegisterTranslation("OneStorage", "deDE", function() return { ["Quiver"] = "K\195\182cher", ["Soul Bag"] = "Seelentasche", ["Container"] = "Beh\195\164lter", ["Bag"] = "Beh\195\164lter", ["Player of Realm"] = "(.+) von (.+)"} end)
AL:RegisterTranslation("OneStorage", "koKR", function() return { ["Quiver"] = "화살통", ["Soul Bag"] = "영혼의 가방", ["Container"] = "가방", ["Bag"] = "가방", ["Player of Realm"] = "(.+) ((.+) 서버)"} end)
AL:RegisterTranslation("OneStorage", "frFR", function() return { ["Quiver"] = "Carquois", ["Soul Bag"] = "Sac d'\195\162me", ["Container"] = "Conteneur", ["Bag"] = "Conteneur", ["Player of Realm"] = "(.+) de (.+)"} end)
AL:RegisterTranslation("OneStorage", "ruRU", function() return { ["Quiver"] = "Колчан", ["Soul Bag"] = "Сумка душ", ["Container"] = "Контейнер", ["Bag"] = "Сумка", ["Player of Realm"] = "(.+) из (.+)" } end)

local L = AL:GetInstance("OneStorage", true)

function OneStorage:OnInitialize()
    local AceDB = AceLibrary("AceDB-2.0")
	self.faction = AceDB.FACTION
	self.charId = AceDB.CHAR_ID
end

function OneStorage:RegisterDB(dbParent)
    if not self.db then self.db = dbParent:AcquireDBNamespace("OneStorage") self.dbParent = dbParent return end
    local cDB = dbParent:AcquireDBNamespace("OneStorage")
    if not self.db.account.updatedAt and cDB.account.updatedAt then self.db = cDB self.dbParent = dbParent return end
    if self.db.account.updatedAt and cDB.account.updatedAt and self.db.account.updatedAt < cDB.account.updatedAt then self.db = cDB self.dbParent = dbParent end
end

function OneStorage:Initialize()
    if self.setupandinitialized then return end
    if not self.db then self:error("You must RegisterDB(db) at least one AceDB object before you call Initialize()", 2) end
    self.dbParent:RegisterDefaults("OneStorage", 'account', { ['*'] = { ['*'] = { } } })
    OneStorage:SetupEventsAndInitialSave()
    self.setupandinitialized = true
end

function OneStorage:SetupEventsAndInitialSave()
    self:RegisterEvent("BAG_UPDATE", 					function() self:SaveBag(arg1) end)
	self:RegisterEvent("BANKFRAME_OPENED", 				function() self.bankOpened = true  self:SaveBag(-1) for i=5,10 do self:SaveBag(i) end end)
	self:RegisterEvent("BANKFRAME_CLOSED", 				function() self.bankOpened = false end)
	self:RegisterEvent("PLAYERBANKSLOTS_CHANGED",	 	function() self:SaveBag(-1) end)
	self:RegisterEvent("PLAYERBANKBAGSLOTS_CHANGED"	, 	function() self:SaveBag(-1) end)
	
	self:RegisterEvent("UNIT_INVENTORY_CHANGED", "SaveEquipment")
	
	self:RegisterEvent("PLAYER_MONEY", "SaveMoney")
	self:SaveEquipment()
	self:SaveMoney()
	
	for bag = 0, 4 do
		self:SaveBag(bag)
	end
    
    self.db.account.updatedAt = time()
end

function OneStorage:SaveMoney()
    self.db.account[self.faction][self.charId]["money"] = GetMoney()
end

function OneStorage:SaveBag(bag)
	local size = GetContainerNumSlots(bag) or 0
	
	if (bag > 4 and bag <= 10) and not self.bankOpened then return end
	
	if bag > 0 then
		local link = GetInventoryItemLink("player", bag < 5 and bag + 19 or bag + 59)
		local _, _, code = strfind(link or "", "(item:%d+:%d+:%d+:%d+)")
		local info = code and (code .. "," .. size) or nil
		isAmmo, isSoul, isProf = self:GetBagTypes(bag)
		if info then
			info = format("%s,%s,%s,%s", info, tostring(isAmmo), tostring(isSoul), tostring(isProf))
		end
		self.db.account[self.faction][self.charId][bag .. 0] = info
	elseif(bag == 0) then
		self.db.account[self.faction][self.charId][bag .. 0] = "nil,16,false,false,false"
	elseif(bag == -1) then
		self.db.account[self.faction][self.charId][bag .. 0] = "nil,24,false,false,false"
	end
	
	for slot = 1, size do
		local link = GetContainerItemLink(bag, slot)
		local _, qty = GetContainerItemInfo(bag, slot)
		local _, _, code = strfind(link or "", "(item:%d+:%d+:%d+:%d+)")
		local info = code and (code .. "," .. qty) or nil
		self.db.account[self.faction][self.charId][bag .. slot] = info
	end
end

function OneStorage:SaveEquipment()
	for slot = 0, 19 do
		local link = GetInventoryItemLink("player",slot)
		if (link) then 
			local _, _, code = strfind(link or "", "(item:%d+:%d+:%d+:%d+)")
			self.db.account[self.faction][self.charId]["e" .. slot] = code
		else
			self.db.account[self.faction][self.charId]["e" .. slot] = code
		end
	end
	self.db.account[self.faction][self.charId]["relic"] = UnitHasRelicSlot("player")
end

function OneStorage:Trim(msg)
	if not msg then return end
	local results = string.gsub(msg, "^%s+", "")
	return string.gsub(results, "%s+$", "")
end

function OneStorage:Split(string, sep)
	if (not string or type(string) ~= "string") then error("Bad String was a " .. type(string) .. "value: " .. (string or "nil"), 2)	end
	local x, y = (strfind(string , sep) or 0), (strlen(sep) or 1)
	return (tonumber(strsub(string, 1, x-1)) or strsub(string, 1, x-1)), (tonumber(strsub(string, x+y)) or strsub(string, x+y))
end

function OneStorage:Explode(string, sep)
	if (not string) then return	end
	if (type(string) ~= "string") then error("Bad String was a " .. type(string) .. "value: " .. (string or "nil"), 2)	end
	local a, b = self:Split(string, sep)
	if (not b or b == "") then return a; end
	if (not strfind(b, sep)) then return a, b; end
	return a, self:Explode(b, sep)
end

function OneStorage:SlotInfo(faction, charId, bag, slot)
	local info = self.db.account[faction or self.faction][charId or self.charId][bag .. slot]
	if info then
		return self:Split(info, ",")
	end
end

function OneStorage:BagInfo(faction, charId, bag)
	local info = self.db.account[faction or self.faction][charId or self.charId][bag .. 0]
	if info then
		local itemId, size, isAmmo, isSoul, isProf = self:Explode(info, ",")
		return itemId, size, (isAmmo == "true"), (isSoul == "true"), (isProf == "true")
	end
end

function OneStorage:HasRelic(faction, charId)
	return self.db.account[faction or self.faction][charId or self.charId]["relic"]
end

function OneStorage:EquipmentInfo(faction, charId, slot)
	return self.db.account[faction or self.faction][charId or self.charId]["e" .. slot]
end

function OneStorage:GetMoney(faction, charId)
	return self.db.account[faction or self.faction][charId or self.charId]["money"]
end

function OneStorage:GetBagTypes(bag)
	if( bag <= 0 ) then return end
	
	local _, _, id = strfind(GetInventoryItemLink("player", ContainerIDToInventoryID(bag)) or "", "item:(%d+)");
	if id then 
		local _, _, _, _, itemType, subType = GetItemInfo(id);
		return (itemType == L["Quiver"] or false), (subType == L["Soul Bag"] or false), (( itemType == L["Container"] and not (subType == L["Bag"] or subType == L["Soul Bag"])  ) or false)
	end
end

function OneStorage:GetCharListByServerId()
    local list = {}
    for k, v in OneStorage.db.account do
        if type(v) == "table" then
            for k2, v2 in v do
                local _, _, name, server = string.find(k2, L["Player of Realm"])
                if not server then _, _, name, server = string.find(k2, "(.+) .* (.+)") end -- (.+) of (.+) not working... wtf?!
                serverId = format("%s - %s",  server, k)
                
                
                if not list[serverId] then list[serverId] = {} end
                table.insert(list[serverId], string.format("%s - %s", name, k2) )
                sort(list[serverId])
			end
		end
	end
    return list
end

local function activate(self, oldLib, oldDeactivate)
	OneStorage = self
	
	if oldLib then
		self.db = oldLib.db
        self.faction = oldLib.FACTION
        self.charId = oldLib.CHAR_ID
	end
	
	if oldDeactivate then
		oldDeactivate(oldLib)
	end
end


AceLibrary:Register(OneStorage, MAJOR_VERSION, MINOR_VERSION, activate)