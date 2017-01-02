-- $Revision: 16894 $
-- $Date: 2006-11-13 15:29:21 -0500 (Mon, 13 Nov 2006) $
if not GarbageFu then return end
------------------------------------------------------------------------------------------------------
-- Auction value functions
------------------------------------------------------------------------------------------------------

local L = AceLibrary("AceLocale-2.2"):new("FuBar_GarbageFu")
local dewdrop = AceLibrary("Dewdrop-2.0");
local compost = AceLibrary("Compost-2.0");
local PT = PeriodicTableEmbed:GetInstance("1");

GarbageFu.vars.auctionaddons = {
	["-CA-"] = {name="Cached Auctioneer", func="GetCachedAuctioneerAuctionValue", check="GarbageFu" },
	["auctioneer"] = {name="Auctioneer", func="GetAuctioneerAuctionValue", check="Auctioneer" },
	["kc_items"] = {name="KC_Items", func="GetKCItemsAuctionValue", check="KC_Auction" },
	["wowecon"] = {name="WoWEcon", func="GetWoWEconAuctionValue", check="WOWEcon_Enabled" },
	["-DNU-"] = {name=L["-- Don't use the addons below --"], func="", check="GarbageFu", stop=true },
};
GarbageFu.vars.auctionaddonsorder = {
	"-CA-",
	"auctioneer",
	"kc_items",
	"wowecon",
	"-DNU-",
};

function GarbageFu:InitAuction()
	self:InitAuctionAddonOrder();
	self:MakeAuctionSetsTables();
	self:HookAuctioneer();
	self:HookKCItems();
end

function GarbageFu:GetAuctionThreshold()
	return self.db.profile.auctionThreshold;
end

function GarbageFu:IsAuctionThreshold(value)
	return self.db.profile.auctionThreshold == tonumber(value);
end

function GarbageFu:SetAuctionThreshold(value)
	self.db.profile.auctionThreshold = tonumber(value);
	self:UpdateDisplay();
end

-- Public ask auction price function
function GarbageFu:GetAuctionValue(item)
	if self:IsItemAuctionPrice(item) and not self:IsItemSoulbound(item) then
--		-- Check cache
--		if self.vars.auctioncache[item.id] then
--			item.value = self.vars.auctioncache[item.id].value;
--			item.pricetype = self.vars.auctioncache[item.id].pricetype;
--			item.totvalue = item.value * item.stack;
--			return true
--		end
		
		for _,addon in ipairs(self.db.profile.auctionaddonsorder) do
			if self.vars.auctionaddons[addon] then
				if self.vars.auctionaddons[addon].stop then break end
				item.value, item.pricetype = self[self.vars.auctionaddons[addon].func](self, item);
				if item.value then break end
			end
		end

--		-- Store in cache
		if item.value then 
--			self.vars.auctioncache[item.id] = self.GetTable();
--			self.vars.auctioncache[item.id].value = item.value;
--			self.vars.auctioncache[item.id].pricetype = item.pricetype;
			item.totvalue = item.value * item.stack;
			return true
		end
	end
	return false
end

--------------------
-- Auctioneer cached
function GarbageFu:GetCachedAuctioneerAuctionValue(item)
	if self.db.realm.auctioncache[item.id] then
		return self.db.realm.auctioncache[item.id], "|cff00FF00AC|r";
	end
end

--------------------
-- Auctioneer
function GarbageFu:GetAuctioneerAuctionValue(item)
	if not Auctioneer then return end
	local itemID, randomProp, enchant, uniqID, lame = EnhTooltip.BreakLink(item.link);

	local auctKey = Auctioneer.Util.GetHomeKey();
	local itemKey = itemID..":"..randomProp..":"..enchant;

	local median, medCount = Auctioneer.Statistic.GetUsableMedian(itemKey, auctKey);

	if (median) then
		return median, "|cff00FF00AA|r";
	end
end

--------------------
-- KC_Items
function GarbageFu:GetKCItemsAuctionValue(item)
	if not KC_Auction then return end
	local _, _, _, _, _, _, vs = KC_Auction:GetItemData(item.code)
	if vs and vs ~= "0" and vs ~= 0 then return tonumber(vs), "|cff00FF00AK" end
end

--------------------
-- WoWEcon	
function GarbageFu:GetWoWEconAuctionValue(item)
	if not WOWEcon_Enabled then return end
	local value, num, spec = WOWEcon_GetAuctionPrice_ByLink(item.link);
	if value and value > 0 then 
--		self:MyPrint("GetWoWEconAuctionValue for %s: price %s num %s spec %s", item.name, tostring(value), tostring(num), tostring(spec));
		return value, "|cff00FF00AW";
	end
end

-------------------------------------------------------------------------------------
-- Auctioneer cache functions
-------------------------------------------------------------------------------------

function GarbageFu:ClearAuctioneerCache()
	self.db.realm.auctioncache = self.GetTable(self.db.realm.auctioncache);
	self:UpdateAllItemValues();
end

local cachedItems = 0;
function GarbageFu:CacheAuctioneer()
	if not Auctioneer then
		self:MyPrint(L["AuctioneerNotLoaded"]);
		return 
	end
	--self.db.realm.auctioncache = self.GetTable(self.db.realm.auctioncache);
	cachedItems = 0;
	for i,_ in pairs(self.db.realm.auctioncache) do  -- First update all prices in the cache already
		self:CacheAuctioneerId(i,true);
	end	
	for i,_ in pairs(self.db.profile.auctionitem) do  -- Then add any items set to use auction price
		self:CacheAuctioneerId(i);
	end
	self:CacheAuctioneerSet(self.vars.auctionsets); -- and all items in the auction sets
	self:UpdateAllItemValues();
	self:MyPrint(L["Updated Cached Auctioneer with prices for %s items."], tostring(cachedItems));
end

function GarbageFu:CacheAuctioneerSet(set)
	if type(set) == "string" then
		local rset = PT:GetSet(set)
		if rset and type(rset) == "string" then
			local t = PT:GetSetTable(set)
			for i,_ in pairs(t) do
				self:CacheAuctioneerId(i);
			end
		elseif type(rset) == "table" then
			for _,s in pairs(rset) do
				self:CacheAuctioneerSet(s)
			end
		end
	elseif type(set) == "table" then
		for _,s in pairs(set) do
			self:CacheAuctioneerSet(s)
		end
	end
end

function GarbageFu:CacheAuctioneerId(id,force)
	if not force and self.db.realm.auctioncache[id] then return end
	local auctKey = Auctioneer.Util.GetHomeKey();
	local itemKey = tostring(id)..":0:0";
	local median = Auctioneer.Statistic.GetUsableMedian(itemKey, auctKey);
	if median then 
		self.db.realm.auctioncache[id] = median;
		cachedItems = cachedItems + 1;
	end
end

-------------------------------------------------------------------------------------------
---- Auction hooks functions
-------------------------------------------------------------------------------------------
function GarbageFu:CheckAuctionAddonLoaded(addon)
	addon = string.lower(addon);
	if ( addon == "auctioneer" ) then 
		self:HookAuctioneer();
	elseif ( addon == "kc_items" ) then 
		self:HookKCItems(); 
	elseif ( addon == "wowecon" ) then
		-- WoWEcon don't have a auction house scan
	else
		return
	end
	if self:InitAuctionAddonOrder() then self:UpdateAllItemValues() end
end

function GarbageFu:HookAuctioneer()
	if Auctioneer and Auctioneer.Event and type(Auctioneer.Event) == "table" then
		if not self:IsHooked(Auctioneer.Event, "StopAuctionScan") then self:Hook(Auctioneer.Event, "StopAuctionScan","AuctioneerStopScan") end
	end
end

function GarbageFu:AuctioneerStopScan(object)
	self:DebugPrint("Auctioneer.Event.StopAuctionScan detected! object=",tostring(object));
	if self:IsCachedAuctioneerUsed() then
		self:CacheAuctioneer();
	else
		self:UpdateAllItemValues();
	end
	return self.hooks[Auctioneer.Event].StopAuctionScan.orig();
end
		
function GarbageFu:HookKCItems()
	if KC_Auction then
		if not self:IsHooked(KC_Auction,"ScanDone") then self:Hook(KC_Auction,"ScanDone","KCItemsFinishedScan") end
		if not self:IsHooked(KC_Auction,"ScanCanceled") then self:Hook(KC_Auction,"ScanCanceled","KCItemsStopScan") end
	end
end

function GarbageFu:KCItemsFinishedScan(object)
	self:DebugPrint("KCItems:ScanDone detected!");
	self:UpdateAllItemValues();
	return self.hooks[object].ScanDone.orig(object);
end

function GarbageFu:KCItemsStopScan(object)
	self:DebugPrint("KCItems:ScanCanceled detected!");
	self:UpdateAllItemValues();
	return self.hooks[object].ScanCanceled.orig(object);
end

-------------------------------------------------------------------------------------------
---- Auction sets functions
-------------------------------------------------------------------------------------------

-- Converts self.db.profile.auctionsets into self.vars.auctionsets
-- Needed because self.db.profile.auctionsets is index by name and self.vars.auctionsets needs to be indexed by number with names as string.
function GarbageFu:MakeAuctionSetsTables()
	self.vars.auctionsets = self:GetTable(self.vars.auctionsets,1);
	for n,_ in pairs(self.db.profile.auctionsets) do
		table.insert(self.vars.auctionsets,n);
	end
end

function GarbageFu:IsItemAuctionPrice(item)
	if self.db.profile.auctionitem[item.id] then return true end
	if self:IsItemInSet(item.id,self.vars.auctionsets) then return true end
	if item.qual >= self.db.profile.auctionThreshold then return true end
end

function GarbageFu:IsItemInAuctionSets(itemid)
	return self:IsItemInSet(itemid,self.vars.auctionsets);
end

function GarbageFu:IsAuctionSetSelected(set, subset)
	return self:IsSetSelected(set, subset, self.db.profile.auctionsets);
end

function GarbageFu:IsChildAuctionSetSelected(set)
	return self:IsChildSetSelected(set, self.db.profile.auctionsets);
end

function GarbageFu:ToggleAuctionSet(set,subset)
	self:ToggleSets(set, subset, self.vars.sets, self.db.profile.auctionsets);
	self:MakeAuctionSetsTables();
	self:UpdateAllItemValues();
end

-------------------------------------------------------------------------------------------
---- Drop down functions
-------------------------------------------------------------------------------------------

function GarbageFu:IsAuctionItem(itemid)
	if (self.db.profile.auctionitem[itemid]) then return true end
end

function GarbageFu:ToggleAuctionItem(itemid)
	if self.db.profile.auctionitem[itemid] then
		self.db.profile.auctionitem[itemid] = nil;
	else
		self.db.profile.auctionitem[itemid] = true;
	end
	self:UpdateItemValue(itemid);
end

function GarbageFu:GetAuctionItemTable()
	self.vars.temptbl = self:GetTable(self.vars.temptbl, 2);
	local tbl2 = self:GetTable();
	-- Start with itemid's listed as auction
	for i,_ in pairs(self.db.profile.auctionitem) do
		local item = self:GetTable();
		item.id = i;
		item.name,_,item.qual = GetItemInfo(i);
		if item.name then
			table.insert(self.vars.temptbl,item);
			tbl2[i] = true;
		else
			compost:Reclaim(item,1);
			item = nil;
		end
	end
	-- Add items in inventory not in keepsets, keeptype or keepitem. Not poor quality or soulbound items.
	for _,i in ipairs(self.vars.items) do
		if ( not i.notseen and i.qual > 0 and not tbl2[i.id] and not self:IsItemKeepItem(i.id) and
				 not self:IsItemInAuctionSets(i.id) and not self:IsItemInKeepSets(i.id) and
				 not self:IsItemKeepType(i) and not self:IsItemSoulbound(i) and
				 i.qual < self.db.profile.auctionThreshold) then
			local item = self:GetTable();
			item.id = i.id;
			item.name = i.name;
			item.qual = i.qual;
			table.insert(self.vars.temptbl,item);
			tbl2[i.id] = true;
		end
	end
	compost:Reclaim(tbl2,2);
	tbl2 = nil;
	table.sort(self.vars.temptbl,function(a,b) return a.name<b.name end);
	return self.vars.temptbl
end

function GarbageFu:ReorderAuctionAddon( index )
	if ( index == 1 ) then -- move down
		local aname = table.remove(self.db.profile.auctionaddonsorder, index);
		table.insert(self.db.profile.auctionaddonsorder, index+1, aname);
	else -- move up 
		local aname = table.remove(self.db.profile.auctionaddonsorder, index);
		table.insert(self.db.profile.auctionaddonsorder, index-1, aname);
	end
	--self.vars.auctioncache = self:GetTable(self.vars.auctioncache,2); -- Clear the auction cache
	self:UpdateAllItemValues();
end

function GarbageFu:IsCachedAuctioneerUsed()
	return next(self.db.realm.auctioncache) ~= nil;
end
-------------------------------------------------------------------------------------------
-- Auction init functions
-------------------------------------------------------------------------------------------

function GarbageFu:InitAuctionAddonOrder()
	local changed = false;
	for _,addon in pairs(self.vars.auctionaddonsorder) do
		local found = false;
		for i,order in ipairs(self.db.profile.auctionaddonsorder) do
			if order == addon then 
				local checkname = getglobal(self.vars.auctionaddons[addon].check);
				if not checkname then
					table.remove(self.db.profile.auctionaddonsorder,i); -- Remove addons not loaded
					changed = true;
				end
				found = true;
				break;
			end
		end
		if not found then
			local checkname = getglobal(self.vars.auctionaddons[addon].check);
			if checkname then
				local idx=1;
				for i2,a in ipairs(self.db.profile.auctionaddonsorder) do
					if self.vars.auctionaddons[a].stop then 
						idx = i2;
						break 
					end
					idx=i2 + 1;
				end
				table.insert(self.db.profile.auctionaddonsorder,idx,addon); -- Add addon that are loaded
				changed = true;
			end
		end
	end
	return changed;
end

-------------------------------------------------------------------------------------------
-- Auction menu functions
-------------------------------------------------------------------------------------------

function GarbageFu:BuildAuctionMenu(level, value, inTooltip, value2)
	if ( level == 1 ) then	
		dewdrop:AddLine('text', L["Use Auction price"], 'hasArrow', true, 'value', 'auction' );
	elseif ( level == 2 ) then
		if ( value == 'auction' ) then
			-- Use Auction price
			dewdrop:AddLine('text', L["Use Auction price"], "isTitle", true );
			dewdrop:AddLine('text', L["Auction Threshold"], 'hasArrow', true, 'value', 'auctionthreshold' );
			dewdrop:AddLine('text', L["Auction Sets"], 'hasArrow', true, 'value', 'auctionsets' );
			dewdrop:AddLine('text', L["Auction Items"], 'hasArrow', true, 'value', 'auctionitem' );
		end
	elseif ( level == 3 ) then
		if ( value2 == 'auction' ) then
			if ( value == 'auctionthreshold' ) then
				dewdrop:AddLine('text', L["Auction Threshold"], "isTitle", true );
				for a=1,6 do
					dewdrop:AddLine('text', self.vars.colors[a].hex..self.vars.colors[a].desc.."|r",
						'checked', a == self:GetAuctionThreshold(),
						'arg1', self, 'arg2', a, 'isRadio', true, 
						'func', 'SetAuctionThreshold' );
				end
				dewdrop:AddLine('text', 'None',
					'checked', 7 == self:GetAuctionThreshold(),
					'arg1', self, 'arg2', 7, 'isRadio', true, 
					'func', 'SetAuctionThreshold' );
			elseif ( value == 'auctionsets' ) then
				-- Auction - Sets
				dewdrop:AddLine('text', L["Auction Sets"], "isTitle", true );
				for n,i in ipairs(self.vars.sets) do
					local checked = self:IsAuctionSetSelected(n);
					local checkIcon = "Interface\\Buttons\\UI-CheckBox-Check" 
					if self:IsChildAuctionSetSelected(n) then
						checked = true;
						checkIcon = "Interface\\Buttons\\UI-CheckBox-Check-Disabled"
					end
					dewdrop:AddLine('text', i.name, 
						'checked', checked, 'checkIcon', checkIcon,
						'hasArrow', i.sub ~= nil, 'value', n,
						'arg1', self, 'arg2', n, 'func', 'ToggleAuctionSet' );
				end
			elseif ( value == 'auctionitem' ) then
				-- Auction - Items
				dewdrop:AddLine('text', L["Auction Items"], "isTitle", true );
				local tbl = self:GetAuctionItemTable();
				for _,i in ipairs(tbl) do
					dewdrop:AddLine('text', self.vars.colors[i.qual].hex .. i.name, 
						'checked', self:IsAuctionItem(i.id),
						'arg1', self, 'arg2', i.id, 'func', 'ToggleAuctionItem');
				end
			end
		end
	elseif ( level == 4 ) then
		if ( value2 == 'auctionsets' ) then
			dewdrop:AddLine('text', L["Auction Set"].." "..self.vars.sets[value].name, "isTitle", true );
			for n,i in ipairs(self.vars.sets[value].sub) do
				dewdrop:AddLine('text', i.name, 
					'checked', self:IsAuctionSetSelected(value,n),
					'arg1', self, 'arg2', value, 'arg3', n, 'func', 'ToggleAuctionSet' );
			end
		end
	end
end

function GarbageFu:BuildAuctionOptionMenu(level, value, inTooltip, value2)
	if ( level == 1 ) then
		dewdrop:AddLine('text', L["Auction addon order"], 'hasArrow', true, 'value', 'auctionorder' );
		dewdrop:AddLine('text', L["Cache Auctioneer"], 'checked', self:IsCachedAuctioneerUsed(),
			'arg1', self, 'func', 'CacheAuctioneer', 
			'tooltipTitle', L["Cache Auctioneer"], 'tooltipText', L["CacheAuctioneerDesc"] );
		if self:IsCachedAuctioneerUsed() then
			dewdrop:AddLine('text', L["Clear Auctioneer cache"], 
				'arg1', self, 'func', 'ClearAuctioneerCache' );
		end
	elseif ( level == 2 ) then
		if ( value == "auctionorder" ) then
			dewdrop:AddLine('text', L["Auction addon order"], "isTitle", true );
			for i,a in ipairs(self.db.profile.auctionaddonsorder) do
				dewdrop:AddLine('text', tostring(i)..". "..self.vars.auctionaddons[a].name, 
				'arg1', self, 'arg2', i, 'func', 'ReorderAuctionAddon' );
			end
		end
	end
end

