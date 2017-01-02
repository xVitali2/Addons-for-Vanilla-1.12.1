-- $Revision: 16894 $
-- $Date: 2006-11-13 15:29:21 -0500 (Mon, 13 Nov 2006) $
if not GarbageFu then return end
------------------------------------------------------------------------------------------------------
-- Vendor Price functions
------------------------------------------------------------------------------------------------------
local L = AceLibrary("AceLocale-2.2"):new("FuBar_GarbageFu")
local dewdrop = AceLibrary("Dewdrop-2.0");

 GarbageFu.vars.vendoraddons = {
	["informant"] = {name="Informant", func="GetInformantVendorPrice", check="Informant" },
	["kc_items"] = {name="KC_Items", func="GetKCIVendorPrice", check="KC_ItemsDB" },
	["wowecon"] = {name="WoWEcon", func="GetWoWEconVendorPrice", check="WOWEcon_Enabled" },
	["itemsync"] = {name="ItemSync", func="GetItemSyncVendorPrice", check="ISync" },
	["pricemaster"] = {name="PriceMaster", func="GetPriceMasterVendorPrice", check="CompletePrices" },
	["ludwig_sellvalue"] = {name="Ludwig_SellValue", func="GetLudwigSellValueVendorPrice", check="Ludwig_SellValues" },
	["colalight"] = {name="ColaLight", func="GetColaLightVendorPrice", check="ColaLight" },
	["-GFP-"] = {name="GarbageFu_Price", func="GetLocalVendorPrice", check="GarbageFu_Prices" },
	["-DNU-"] = {name=L["-- Don't use the addons below --"], func="", check="GarbageFu", stop=true },
};
GarbageFu.vars.vendoraddonsorder = {
	"informant",
	"kc_items",
	"wowecon",
	"itemsync",
	"pricemaster",
	"ludwig_sellvalue",
	"colalight",
	"-GFP-",
	"-DNU-",
};

function GarbageFu:InitVendor()
	if self:IsUsingGarbagePrices() then
		self:LoadGarbagePrices();
	end
	self:InitVendorAddonOrder();
end

-- Get Vendor price
function GarbageFu:GetVendorValue(item)
	if item.id and item.qual then
		item.value, item.pricetype = self:GetUserOverridePrice(item)

		for _,addon in ipairs(self.db.profile.vendoraddonsorder) do
			if item.value then break end
			if self.vars.vendoraddons[addon] then
				if self.vars.vendoraddons[addon].stop then break end
				item.value, item.pricetype = self[self.vars.vendoraddons[addon].func](self, item);
			end
		end

--		if not item.value then item.value, item.pricetype = self:GetKCIVendorPrice(item) end
--		if not item.value then item.value, item.pricetype = self:GetInformantVendorPrice(item) end
--		if not item.value then item.value, item.pricetype = self:GetWoWEconVendorPrice(item) end
--		if not item.value then item.value, item.pricetype = self:GetItemSyncVendorPrice(item) end
--		if not item.value then item.value, item.pricetype = self:GetPriceMasterVendorPrice(item) end
--		if not item.value then item.value, item.pricetype = self:GetLudwigSellValueVendorPrice(item) end
--		if not item.value then item.value, item.pricetype = self:GetLocalVendorPrice(item) end
	end
	
	if item.value then
		item.totvalue = item.value * item.stack;
	else
		item.value = 0; -- No item value know
		item.totvalue = 0; -- No item value know
	end		
end

-- Price Types. First char: U = User, V = Vendor, A = Auction
--              Second char: Addon the price was gotten from.
--						K = KC_Items, W = WoWEcon, I = Informant, P = PriceMaster, L = Ludwig, T = Local table

-- Get item price from the User Override table
function GarbageFu:GetUserOverridePrice(item)
	if self.db.account.overrideprices[item.id] then
		return self.db.account.overrideprices[item.id], "|cffff7700UO|r"
	end
end

-- KC_Items
function GarbageFu:GetKCIVendorPrice(item)
	local kv, vs
	if not KC_ItemsDB then return end
	kv = KC_ItemsDB[item.id]
	if kv then _, _, vs = string.find(kv, ",(%d+),%d+") end
	if (vs and vs ~= "0") then return tonumber(vs), "|cff0077ffVK|r" end
end

-- Auctioneer/Informant
function GarbageFu:GetInformantVendorPrice(item)
	if not Informant then return end
	local itemData = Informant.GetItem(item.id)
	if (itemData and itemData['buy'] and itemData['buy'] ~= 0) then return itemData['sell'], "|cff0077ffVI" end
end

-- WoWEcon
function GarbageFu:GetWoWEconVendorPrice(item)
	if not WOWEcon_Enabled then return end
	local price =	WOWEcon_GetVendorPrice_ByLink(item.link);
	if price and price > 0 then return price, "|cff0077ffVW|r" end
end

-- PriceMaster doesn't have a price asking function, so we have to tap directly in to it's data. Ugly!
function GarbageFu:GetPriceMasterVendorPrice(item)
	if ( CompletePrices and CompletePrices[item.id] and CompletePrices[item.id].p ) then
		return CompletePrices[item.id].p, "|cff0077ffVP|r" 
	end
end

-- Ludwig_SellValue
function GarbageFu:GetLudwigSellValueVendorPrice(item)
	local items = tostring(item.id)
	if ( Ludwig_SellValues and Ludwig_SellValues[items] ) then
		return Ludwig_SellValues[items], "|cff0077ffVL|r"
	end
end

-- ItemSync
function GarbageFu:GetItemSyncVendorPrice(item)
	if (not ISync) then return end;
		local price = tonumber(ISync:FetchDB(ISync:GetCoreID(item.link), "price"));
	if price and price > 0 then return price, "|cff0077ffVS|r" end
end

-- ColaLight
function GarbageFu:GetColaLightVendorPrice(item)
	local items = tostring(item.id)
	if ColaLight and ColaLight.db.account.SellValues[items] then
		return ColaLight.db.account.SellValues[items], "|cff0077ffVC|r"
	end
end

-- Look it up in our own price table
function GarbageFu:GetLocalVendorPrice(item)
	if not self.vars.vendorprices then return end

	if self.vars.pricecache[item.id] then return self.vars.pricecache[item.id], "|cff0077ffVT".."|r" end

	local _, _, price = string.find(self.vars.vendorprices, " "..item.id..":(%d+)")
	if price then
		self.vars.pricecache[item.id] = tonumber(price)
		return self.vars.pricecache[item.id], "|cff0077ffVT|r"
	end
end

-------------------------------------------------------------------------------------------
-- GarbageFu_Prices functions
-------------------------------------------------------------------------------------------

-- Load our own price table.
GarbageFu_Prices = false;
function GarbageFu:LoadGarbagePrices(db)
	if not IsAddOnLoaded("FuBar_GarbageFu_Prices") then
		local res,reason = LoadAddOn("FuBar_GarbageFu_Prices");
	end
	if GarbageFu_PriceDb then		
		self.vars.vendorprices = GarbageFu_PriceDb;
		GarbageFu_Prices = true;
		return true;
	elseif GarbageFu_PriceTbl then
		self.vars.vendorprices = "";
		self.vars.pricecache = GarbageFu_PriceTbl;
		GarbageFu_Prices = true;
		return true;
	else
	 	self:MyPrint(L["Can't load FuBar_GarbageFu_Price. Check that it exists and are enabled"]);
	 	return;
	end
end

function GarbageFu:IsGarbagePricesAvailable()
	local name, title, notes, enabled, loadable, reason = GetAddOnInfo("FuBar_GarbageFu_Prices");
	return not reason;
end

-------------------------------------------------------------------------------------------
-- Drop down menu functions
-------------------------------------------------------------------------------------------

function GarbageFu:IsUsingGarbagePrices()
	return self.db.profile.garbageprices;
end

function GarbageFu:ToggleUseGarbagePrices()
	if ( not self.db.profile.garbageprices ) then
		self.db.profile.garbageprices = self:LoadGarbagePrices();
		if self.db.profile.garbageprices then 
			self:InitVendorAddonOrder()
			self:UpdateAllItemValues();
		end
	else
		self.db.profile.garbageprices = false;
		GarbageFu_Prices = false;
		self.vars.vendorprices = nil;
		self.vars.pricecache = self:GetTable(self.vars.pricecache);
		self:InitVendorAddonOrder()
		self:UpdateAllItemValues();
	end
end

function GarbageFu:ReorderVendorAddon( index )
	if ( index == 1 ) then -- move down
		local aname = table.remove(self.db.profile.vendoraddonsorder, index);
		table.insert(self.db.profile.vendoraddonsorder, index+1, aname);
	else -- move up 
		local aname = table.remove(self.db.profile.vendoraddonsorder, index);
		table.insert(self.db.profile.vendoraddonsorder, index-1, aname);
	end
	self:UpdateAllItemValues();
end

-------------------------------------------------------------------------------------------
-- Vendor init functions
-------------------------------------------------------------------------------------------

function GarbageFu:CheckVendorAddonLoaded(addon)
	addon = string.lower(addon);
	if self.vars.vendoraddons[addon] then
		if self:InitVendorAddonOrder() then self:UpdateAllItemValues() end
	end
end

-------------------------------------------------------------------------------------------
-- Vendor init functions
-------------------------------------------------------------------------------------------

function GarbageFu:InitVendorAddonOrder()
	local changed = false;
	for _,addon in pairs(self.vars.vendoraddonsorder) do
		local found = false;
		for i,order in ipairs(self.db.profile.vendoraddonsorder) do
			if order == addon then 
				local checkname = getglobal(self.vars.vendoraddons[addon].check);
				if not checkname then
					table.remove(self.db.profile.vendoraddonsorder,i); -- Remove addons not loaded
					changed = true;
				end
				found = true;
				break;
			end
		end
		if not found then
			local checkname = getglobal(self.vars.vendoraddons[addon].check);
			if checkname then
				local idx=1;
				for i2,a in ipairs(self.db.profile.vendoraddonsorder) do
					if self.vars.vendoraddons[a].stop then 
						idx = i2;
						break 
					end
					idx=i2 + 1;
				end
				table.insert(self.db.profile.vendoraddonsorder,idx,addon);  -- Add addon that are loaded
				changed = true;
			end
		end
	end
	return changed;
end

-------------------------------------------------------------------------------------------
-- Vendor menu functions
-------------------------------------------------------------------------------------------

function GarbageFu:BuildVendorOptionMenu(level, value, inTooltip, value2)
	if ( level == 1 ) then
		dewdrop:AddLine('text', L["Use GarbageFu Prices"], 'checked', self:IsUsingGarbagePrices(), 
			'arg1', self, 'func', 'ToggleUseGarbagePrices',
			'disabled', not self:IsGarbagePricesAvailable(),
			'tooltipTitle', L["Use GarbageFu Prices"], 'tooltipText', L["GarbageFu_Prices ToltipText"]);
		dewdrop:AddLine('text', L["Vendor price addon order"], 'hasArrow', true, 'value', 'vendororder' );
	elseif ( level == 2 ) then
		if ( value == "vendororder" ) then
			dewdrop:AddLine('text', L["Vendor price addon order"], "isTitle", true );
			for i,a in ipairs(self.db.profile.vendoraddonsorder) do
				dewdrop:AddLine('text', tostring(i)..". "..self.vars.vendoraddons[a].name, 
				'arg1', self, 'arg2', i, 'func', 'ReorderVendorAddon' );
			end
		end
	end
end

