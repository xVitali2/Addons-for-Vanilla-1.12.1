local L = AceLibrary("AceLocale-2.2"):new("AuditorFu")

Auditor = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceConsole-2.0", "AceHook-2.1", "AceDB-2.0")

Auditor:RegisterDB("AuditorDB")

function Auditor:OnInitialize()
	-- Make sure variables are set right
	auditorMode = ""
	auditorPlayer = UnitName("player")
	auditorFuToonToShow = auditorPlayer
	auditorHDay = { "6days", "5days", "4days", "3days", "2days", "1days", "0days" }
	auditorLogMode = { "loot", "merch", "quest", "trade", "mail", "ah", "train", "taxi", "repairs", "other" }
	auditorTimeframe = { "session", "day", "week", "total" }
	-- Create DB for toon if it doesn't exist
	Auditor:NewToonDB()
	-- Clear out last session's data	
	Auditor:DataReset("session")
end

function Auditor:OnEnable()
	-- Make sure everything is initialised before calling reconciliation functions
	self:RegisterEvent("AceEvent_FullyInitialized","OnFullyInitialized",true)
	-- Repair Hooks
	self:Hook("RepairAllItems")
	self:Hook("CursorHasItem")
	-- AH Mail Hook
	self:Hook("InboxFrame_OnClick")
	-- Register the events we need to choose a logMode
	self:RegisterEvent("MERCHANT_SHOW")
	self:RegisterEvent("MERCHANT_CLOSED")
	self:RegisterEvent("QUEST_COMPLETE")
	self:RegisterEvent("LOOT_OPENED")
	self:RegisterEvent("TAXIMAP_OPENED")
	self:RegisterEvent("TRADE_SHOW")
	self:RegisterEvent("TRADE_CLOSE")
	self:RegisterEvent("MAIL_SHOW")
	self:RegisterEvent("MAIL_CLOSED")
	self:RegisterEvent("TRAINER_SHOW")
	self:RegisterEvent("TRAINER_CLOSED")
	self:RegisterEvent("AUCTION_HOUSE_SHOW")
	self:RegisterEvent("AUCTION_HOUSE_CLOSED")
	self:RegisterEvent("CHAT_MSG_MONEY")
	self:RegisterEvent("PLAYER_MONEY")
	self:RegisterEvent("CONFIRM_TALENT_WIPE")
end

function Auditor:OnFullyInitialized()
	-- Check timeDate differences to see if we need to shuffle data
	Auditor:UpdateTimeFrame()
	-- Check if data needs reconciliation
	Auditor:ReconcileData()
end

function Auditor:DataReset(timeFrame)
	for key,logmode in pairs(auditorLogMode) do
			self.db.realm[auditorPlayer].data[logmode][timeFrame] = {incomings = 0, outgoings = 0}
	end
end

function Auditor:ReconcileData()
	-- Set current cash
	auditorCurrentMoney = GetMoney()
	auditorLastMoney = auditorCurrentMoney
	self.db.realm.chars[auditorPlayer] = auditorCurrentMoney
	self.db.realm[auditorPlayer].data.totals.incomings = 0
	self.db.realm[auditorPlayer].data.totals.outgoings = 0
	-- Add up total incomings and outgoings according to Auditor
	for key, logmode in pairs(auditorLogMode) do
		self.db.realm[auditorPlayer].data.totals.incomings = self.db.realm[auditorPlayer].data.totals.incomings + self.db.realm[auditorPlayer].data[logmode]["total"].incomings
		self.db.realm[auditorPlayer].data.totals.outgoings = self.db.realm[auditorPlayer].data.totals.outgoings + self.db.realm[auditorPlayer].data[logmode]["total"].outgoings
	end
	self.db.realm[auditorPlayer].data.totals.actual = self.db.realm[auditorPlayer].data.totals.incomings - self.db.realm[auditorPlayer].data.totals.outgoings
	-- Does Auditor's data sync with reality? If not, make it so
	if (auditorFuImportFromAccountant == true) and (self.db.realm[auditorPlayer].data.totals.actual ~= auditorCurrentMoney) then
		local diff = auditorCurrentMoney - self.db.realm[auditorPlayer].data.totals.actual
		if diff > 0 then
			self.db.realm[auditorPlayer].data["other"]["total"].incomings = self.db.realm[auditorPlayer].data["other"]["total"].incomings + diff
			self.db.realm[auditorPlayer].historical[auditorHDay[7]]["other"].incomings = self.db.realm[auditorPlayer].data["other"]["day"].incomings
			self.db.realm[auditorPlayer].data.totals.incomings = self.db.realm[auditorPlayer].data.totals.incomings + diff
		elseif diff < 0 then
			diff = diff * -1;
			self.db.realm[auditorPlayer].data["other"]["total"].outgoings = self.db.realm[auditorPlayer].data["other"]["total"].outgoings + diff
			self.db.realm[auditorPlayer].historical[auditorHDay[7]]["other"].outgoings = self.db.realm[auditorPlayer].data["other"]["day"].outgoings
			self.db.realm[auditorPlayer].data.totals.outgoings = self.db.realm[auditorPlayer].data.totals.outgoings + diff
		end
		self.db.realm[auditorPlayer].data.totals.actual = auditorCurrentMoney
		self:Print("Post-import data reconciliation performed for "..auditorPlayer)
		auditorFuImportFromAccountant = false
	elseif self.db.realm[auditorPlayer].data.totals.actual ~= auditorCurrentMoney then
		local diff = auditorCurrentMoney - self.db.realm[auditorPlayer].data.totals.actual
		if diff > 0 then
			for key,logmode in pairs(auditorTimeframe) do
				self.db.realm[auditorPlayer].data["other"][logmode].incomings = self.db.realm[auditorPlayer].data["other"][logmode].incomings + diff
			end
			self.db.realm[auditorPlayer].historical[auditorHDay[7]]["other"].incomings = self.db.realm[auditorPlayer].data["other"]["day"].incomings
			self.db.realm[auditorPlayer].data.totals.incomings = self.db.realm[auditorPlayer].data.totals.incomings + diff
		elseif diff < 0 then
			diff = diff * -1;
			for key,logmode in pairs(auditorTimeframe) do
				self.db.realm[auditorPlayer].data["other"][logmode].outgoings = self.db.realm[auditorPlayer].data["other"][logmode].outgoings + diff
			end
			self.db.realm[auditorPlayer].historical[auditorHDay[7]]["other"].outgoings = self.db.realm[auditorPlayer].data["other"]["day"].outgoings
			self.db.realm[auditorPlayer].data.totals.outgoings = self.db.realm[auditorPlayer].data.totals.outgoings + diff
		end
		self.db.realm[auditorPlayer].data.totals.actual = auditorCurrentMoney
		self:Print(L["DATA_RECONCILIATION"]..auditorPlayer)
	end	
end

function Auditor:MERCHANT_SHOW()
	auditorMode = "merch"
end

function Auditor:CONFIRM_TALENT_WIPE()
	auditorMode = "train"
end

function Auditor:MERCHANT_CLOSED()
	auditorMode = ""
end

function Auditor:QUEST_COMPLETE()
	auditorMode = "quest"
end

function Auditor:LOOT_OPENED()
	auditorMode = "loot"
end

function Auditor:TAXIMAP_OPENED()
	auditorMode = "taxi"
end

function Auditor:TRADE_SHOW()
	auditorMode = "trade"
end

function Auditor:TRADE_CLOSE()
	auditorMode = ""
end

function Auditor:MAIL_SHOW()
	auditorMode = "mail"
end

function Auditor:MAIL_CLOSED()
	auditorMode = ""
end

function Auditor:TRAINER_SHOW()
	auditorMode = "train"
end

function Auditor:TRAINER_CLOSED()
	auditorMode = ""
end

function Auditor:AUCTION_HOUSE_SHOW()
	auditorMode = "ah"
end

function Auditor:AUCTION_HOUSE_CLOSED()
	auditorMode = ""
end

function Auditor:CHAT_MSG_MONEY()
	Auditor:OnShareMoney(event, arg1)
end

function Auditor:PLAYER_MONEY()
	Auditor:UpdateTimeFrame()
	Auditor:UpdateFigures()
end

function Auditor:UpdateFigures()
	auditorCurrentMoney = GetMoney()
	self.db.realm[auditorPlayer].data.totals.actual = auditorCurrentMoney
	self.db.realm.chars[auditorPlayer] = auditorCurrentMoney
	local diff = auditorCurrentMoney - auditorLastMoney
	auditorLastMoney = auditorCurrentMoney
	
	if (diff == 0 or diff == nil) then
		return
	end		

	-- Deals with random cash from an obfuscated source. Good word, eh?
	if auditorMode == "" then
		auditorMode = "other"
	end
	
	if diff > 0 then
		-- Prevention of incomings to categories that can't have incomings - not perfect, but better than nothing
		if (auditorMode == "taxi" or auditorMode == "train" or auditorMode == "repairs") then
			auditorMode = "other"
		end
		for key,logmode in pairs(auditorTimeframe) do
			self.db.realm[auditorPlayer].data[auditorMode][logmode].incomings = self.db.realm[auditorPlayer].data[auditorMode][logmode].incomings + diff
		end
		self.db.realm[auditorPlayer].data.totals.incomings = self.db.realm[auditorPlayer].data.totals.incomings + diff
		self.db.realm[auditorPlayer].historical[auditorHDay[7]][auditorMode].incomings = self.db.realm[auditorPlayer].data[auditorMode]["day"].incomings
	elseif diff < 0 then
		-- Prevention of outgoings to categories that can't have outgoings - not perfect, but better than nothing
		if (auditorMode == "loot") then
			auditorMode = "other"
		end
		diff = diff * -1;
		for key,logmode in pairs(auditorTimeframe) do
			self.db.realm[auditorPlayer].data[auditorMode][logmode].outgoings = self.db.realm[auditorPlayer].data[auditorMode][logmode].outgoings + diff
		end
		self.db.realm[auditorPlayer].data.totals.outgoings = self.db.realm[auditorPlayer].data.totals.outgoings + diff
		self.db.realm[auditorPlayer].historical[auditorHDay[7]][auditorMode].outgoings = self.db.realm[auditorPlayer].data[auditorMode]["day"].outgoings
	end

	-- Reset in case we just repaired and are still at a merchant, like
	if auditorMode == "repairs" then
		auditorMode = "merch"
	end
end

function Auditor:UpdateTimeFrame()
	-- Good lordy, is it still the same day? Week? Year!? I hope people like the 7 day's data as opposed to calendar week data
	local timeDiff = time() - self.db.realm[auditorPlayer].timeDate.timeDate
	local daysPassedSinceLogin = math.floor(timeDiff / 86400)
	local dateTable = date("*t")
	
	if daysPassedSinceLogin ~= 0 then
		-- If we haven't logged in for a week, then we need to clear the historical days data and the week data
		if daysPassedSinceLogin > 6 then
			self.db.realm[auditorPlayer].historical = nil
			Auditor:NewToonDB()
			Auditor:DataReset("day")
			Auditor:DataReset("week")
		-- If the last time we logged in was less than a week ago, then we need to start shifting the data from historicalData to historicalData, and make sure the week data is kept up to date too.
		-- Begin the Truffle Shuffle!
		else
			--self:Print("Days since "..auditorPlayer.."'s last login: "..daysPassedSinceLogin.." : Rotating 7day data.")
			Auditor:DataReset("week")
			while daysPassedSinceLogin > 0 do
				for i = 1, 6 do
					for key,logmode in pairs(auditorLogMode) do
						self.db.realm[auditorPlayer].historical[auditorHDay[i]][logmode].incomings = self.db.realm[auditorPlayer].historical[auditorHDay[i+1]][logmode].incomings
						self.db.realm[auditorPlayer].historical[auditorHDay[i]][logmode].outgoings = self.db.realm[auditorPlayer].historical[auditorHDay[i+1]][logmode].outgoings
					end
				end
				for key,logmode in pairs(auditorLogMode) do
					self.db.realm[auditorPlayer].historical[auditorHDay[7]][logmode] = {incomings = 0, outgoings = 0}
				end
				daysPassedSinceLogin = daysPassedSinceLogin - 1
			end
			for k,hday in pairs(auditorHDay) do
				for key,logmode in pairs(auditorLogMode) do
					self.db.realm[auditorPlayer].data[logmode]["week"].incomings = self.db.realm[auditorPlayer].data[logmode]["week"].incomings + self.db.realm[auditorPlayer].historical[hday][logmode].incomings
					self.db.realm[auditorPlayer].data[logmode]["week"].outgoings = self.db.realm[auditorPlayer].data[logmode]["week"].outgoings + self.db.realm[auditorPlayer].historical[hday][logmode].outgoings
				end
			end
		end
		-- Lastly, if the date has changed, obviously we need to clear out the day's data.
		Auditor:DataReset("day")
		self.db.realm[auditorPlayer].timeDate.timeDate = (math.floor( time() / 86400)) * 86400
	end
	self.db.realm[auditorPlayer].timeDate.niceDate = dateTable.month.."/"..dateTable.day.."/"..string.sub(dateTable.year,3,4)
end

function Auditor:ImportAccountant()
	-- Check Accountant exists and if so, destroy and recreate empty Auditor db for this toon
	if Accountant_SaveData ~= nil then
		self.db.realm[auditorPlayer] = nil
		-- Create DB for import
		Auditor:NewToonDB()
	end
	-- Retrieve totals from Accountant Savedata and plonk into Auditor
	if Accountant_SaveData ~= nil and Accountant_Server ~= nil then
		local accountantSeries = L["IMPORT_SERVER"]
		for key,logmode in pairs(auditorLogMode) do
			self.db.realm[auditorPlayer].data[logmode]["total"].incomings = self.db.realm[auditorPlayer].data[logmode]["total"].incomings + Accountant_SaveData[Accountant_Server][auditorPlayer]["data"][string.upper(logmode)]["Total"].In
			self.db.realm[auditorPlayer].data[logmode]["total"].outgoings = self.db.realm[auditorPlayer].data[logmode]["total"].outgoings + Accountant_SaveData[Accountant_Server][auditorPlayer]["data"][string.upper(logmode)]["Total"].Out
			self.db.realm[auditorPlayer].data.totals.incomings = self.db.realm[auditorPlayer].data.totals.incomings + Accountant_SaveData[Accountant_Server][auditorPlayer]["data"][string.upper(logmode)]["Total"].In
			self.db.realm[auditorPlayer].data.totals.outgoings = self.db.realm[auditorPlayer].data.totals.outgoings + Accountant_SaveData[Accountant_Server][auditorPlayer]["data"][string.upper(logmode)]["Total"].Out
		end
		self.db.realm[auditorPlayer].data.totals.actual = self.db.realm[auditorPlayer].data.totals.incomings - self.db.realm[auditorPlayer].data.totals.outgoings
		-- Tell the user what happened
		self:Print(accountantSeries..L["IMPORT_DATAIMPORT"]..auditorPlayer)
		UIErrorsFrame:AddMessage(accountantSeries..L["IMPORT_DATAIMPORT"]..auditorPlayer, 1.0, 1.0, 1.0, 5.0)
		-- Reconcile DB with reality
		auditorFuImportFromAccountant = true
		Auditor:ReconcileData()
	elseif Accountant_SaveData ~= nil and Accountant_Server == nil then
		local accountantSeries = L["IMPORT_NOSERVER"]
		for key,logmode in pairs(auditorLogMode) do
			self.db.realm[auditorPlayer].data[logmode]["total"].incomings = self.db.realm[auditorPlayer].data[logmode]["total"].incomings + Accountant_SaveData[auditorPlayer]["data"][string.upper(logmode)]["Total"].In
			self.db.realm[auditorPlayer].data[logmode]["total"].outgoings = self.db.realm[auditorPlayer].data[logmode]["total"].outgoings + Accountant_SaveData[auditorPlayer]["data"][string.upper(logmode)]["Total"].Out
			self.db.realm[auditorPlayer].data.totals.incomings = self.db.realm[auditorPlayer].data.totals.incomings + Accountant_SaveData[auditorPlayer]["data"][string.upper(logmode)]["Total"].In
			self.db.realm[auditorPlayer].data.totals.outgoings = self.db.realm[auditorPlayer].data.totals.outgoings + Accountant_SaveData[auditorPlayer]["data"][string.upper(logmode)]["Total"].Out
		end
		self.db.realm[auditorPlayer].data.totals.actual = self.db.realm[auditorPlayer].data.totals.incomings - self.db.realm[auditorPlayer].data.totals.outgoings
		-- Tell the user what happened
		self:Print(accountantSeries..L["IMPORT_DATAIMPORT"]..auditorPlayer)
		UIErrorsFrame:AddMessage(accountantSeries..L["IMPORT_DATAIMPORT"]..auditorPlayer, 1.0, 1.0, 1.0, 5.0)
		-- Reconcile DB with reality
		auditorFuImportFromAccountant = true
		Auditor:ReconcileData()
	else
		-- Tell the user what happened
		self:Print(L["IMPORT_ERROR"])
		UIErrorsFrame:AddMessage(L["IMPORT_ERROR"], 1.0, 1.0, 1.0, 5.0)
	end
end

function Auditor:PurgeData(name)
	auditorFuToonToShow = auditorPlayer
	self.db.realm[name] = nil
	self.db.realm.chars[name] = nil
	if auditorPlayer == name then
		-- Create DB for Toon
		Auditor:NewToonDB()
		-- Reconcile DB with reality
		Auditor:ReconcileData()
	end
	AuditorFu.cached_options = nil
	AuditorFu:OpenMenu()
end

function Auditor:NewToonDB()
	-- Create DB structure for new toon
	if not self.db.realm[auditorPlayer] then
		self.db.realm[auditorPlayer] = {}
		self.db.realm[auditorPlayer].data = {}
		self.db.realm[auditorPlayer].data.totals = {incomings = 0, outgoings = 0, actual = 0}
		local dateTable = date("*t")
		self.db.realm[auditorPlayer].timeDate = {niceDate = dateTable.month.."/"..dateTable.day.."/"..string.sub(dateTable.year,3,4), timeDate = (math.floor( time() / 86400)) * 86400}
		for key,logmode in pairs(auditorLogMode) do
			self.db.realm[auditorPlayer].data[logmode] = {}
		end
		for key,logmode in pairs(auditorLogMode) do
			for key,timeframe in pairs(auditorTimeframe) do
				self.db.realm[auditorPlayer].data[logmode][timeframe] = {incomings = 0, outgoings = 0}
			end
		end
	end	
	-- Historical data setup
	if not self.db.realm[auditorPlayer].historical then
		self.db.realm[auditorPlayer].historical = {}
		for key,hday in pairs(auditorHDay) do
			self.db.realm[auditorPlayer].historical[hday] = {}
		end
		for key,hday in pairs(auditorHDay) do
			for key,logmode in pairs(auditorLogMode) do
				self.db.realm[auditorPlayer].historical[hday][logmode] = {incomings = 0, outgoings = 0}
			end
		end
	end
	if not self.db.realm.chars then
		self.db.realm.chars = {}
	end
	if not self.db.realm.chars[auditorPlayer] then
		self.db.realm.chars[auditorPlayer] = 0
	end
end

-- Shared money function almost entirely lifted. Thanks DSanai/Sabaki/Shadowbind/Rophy!
function Auditor:OnShareMoney(event, arg1) 
	local gold, silver, copper, money, oldMode 

	-- Parse the message for money gained. 
	_, _, gold = string.find(arg1, "(%d+) " .. GOLD) 
	_, _, silver = string.find(arg1, "(%d+) " .. SILVER)
	_, _, copper = string.find(arg1, "(%d+) " .. COPPER) 
	if gold then gold = tonumber(gold) else gold = 0 end 
	if silver then silver = tonumber(silver) else silver = 0 end 
	if copper then copper = tonumber(copper) else copper = 0 end 
	money = copper + silver * 100 + gold * 10000

	oldMode = auditorMode 
	if not auditorLastMoney then auditorLastMoney = 0 end 

	-- This will force a money update with calculated amount. 
	auditorLastMoney = auditorLastMoney - money 
	auditorMode = "loot" 
	Auditor:UpdateFigures() 
	auditorMode = oldMode 

	-- This will suppress the incoming PLAYER_MONEY event. 
	auditorLastMoney = auditorLastMoney + money
end

-- Repair hooking functions using AceHook
function Auditor:RepairAllItems()
	auditorMode = "repairs"
	self.hooks.RepairAllItems()
end

function Auditor:CursorHasItem()
	if InRepairMode() then
		auditorMode = "repairs"
	end
	return self.hooks.CursorHasItem()
end

-- AH Mail hooking functions
function Auditor:InboxFrame_OnClick(mailIndex)
	local _, _, sender, subject, money, CODAmount, _, hasItem, _, _, _, _= GetInboxHeaderInfo(mailIndex)
	if sender ~= nil then
		if strfind(sender, "Auction House") then
			auditorMode = "ah"
		else
			auditorMode = "mail"
		end
	else
		auditorMode = "mail"
	end
	return self.hooks.InboxFrame_OnClick(mailIndex)
end