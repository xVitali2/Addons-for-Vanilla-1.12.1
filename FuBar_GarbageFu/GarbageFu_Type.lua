-- $Revision: 16894 $
-- $Date: 2006-11-13 15:29:21 -0500 (Mon, 13 Nov 2006) $
if not GarbageFu then return end
------------------------------------------------------------------------------------------------------
-- Item Type functions
------------------------------------------------------------------------------------------------------
local L = AceLibrary("AceLocale-2.2"):new("FuBar_GarbageFu")
local dewdrop = AceLibrary("Dewdrop-2.0");
local gratuity = AceLibrary("Gratuity-2.0");
local compost = AceLibrary("Compost-2.0");

local table_setn
local string_gmatch
local WOW2
do
	local version = GetBuildInfo()
	if string.find(version, "^2%.") then
		-- 2.0.0
		table_setn = function() end
		string_gmatch = string.gmatch
		WOW2 = true;
	else
		table_setn = table.setn
		string_gmatch = string.gfind
		WOW2 = false;
	end
end


GarbageFu.vars.itemtypes = {
	{id="weaponall", s="Weapon", name=L["Weapon"], sub={
		{id="weapondagger", s="Daggers", name=L["Dagger"]}, 
		{id="weaponfist", s="Fist Weapons", name=L["Fist Weapon"]}, 
		{id="weapon1haxe", s="One-Handed Axes", name=L["One-Handed Axe"]}, 
		{id="weapon2hmace", s="One-Handed Maces", name=L["One-Handed Mace"]}, 
		{id="weapon1hsword", s="One-Handed Swords", name=L["One-Handed Sword"]},
		{id="weapon2haxe", s="Two-Handed Axes", name=L["Two-Handed Axe"]}, 
		{id="weapon2hmace", s="Two-Handed Maces", name=L["Two-Handed Mace"]}, 
		{id="weapon2hsword", s="Two-Handed Swords", name=L["Two-Handed Sword"]}, 
		{id="weaponpolearm", s="Polearms", name=L["Polearm"]}, 
		{id="weaponstave", s="Staves", name=L["Stave"]},
		{id="weaponbow", s="Bows", name=L["Bow"]}, 
		{id="weaponcrossbow", s="Crossbows", name=L["Crossbow"]}, 
		{id="weapongun", s="Guns", name=L["Gun"]}, 
		{id="weaponthrown", s="Thrown", name=L["Thrown"]}, 
		{id="weaponwand", s="Wands", name=L["Wand"]},
		{id="weaponpole", s="Fishing Pole", name=L["Fishing Pole"]}, 
		{id="weaponmisc", s="Miscellaneous", name=L["Miscellaneous"]},
	}, },
	{id="armorall", s="Armor", name=L["Armor"], sub={
		{id="armorcloth", s="Cloth", name=L["Cloth"]},
		{id="armorleather", s="Leather", name=L["Leather"]}, 
		{id="armormail", s="Mail", name=L["Mail"]}, 
		{id="armorplate", s="Plate", name=L["Plate"]}, 
		{id="armorshield", s="Shields", name=L["Shields"]}, 
		{id="armoridol", s="Idols", name=L["Idols"]}, 
		{id="armortotem", s="Totems", name=L["Totems"]}, 
		{id="armorlibram", s="Librams", name=L["Librams"]}, 
		{id="armormisc", s="Miscellaneous", name=L["Miscellaneous"]}, 
	}, },
	{id="bag", s="Container", name=L["Bag"]},
	{id="key", s="Key", name=L["Key"]},
	{id="recipeall", s="Recipe", name=L["Recipe"], sub={
		{id="recipealchemy", s="Alchemy", name=L["Alchemy"]},
		{id="recipeblacksmith", s="Blacksmithing", name=L["Blacksmithing"]},
		{id="recipeenchant", s="Enchanting", name=L["Enchanting"]},
		{id="recipeengineer", s="Engineering", name=L["Engineering"]},
		{id="recipeleather", s="Leatherworking", name=L["Leatherworking"]},
		{id="recipetailor", s="Tailoring", name=L["Tailoring"]},
		{id="recipecook", s="Cooking", name=L["Cooking"]},
		{id="recipefirstaid", s="First Aid", name=L["First Aid"]},
		{id="recipebook", s="Book", name=L["Book"]},
	}, },
	{id="ammoall", s="Projectile", name=L["Projectile"], sub={
		{id="ammoarrow", s="Arrow", name=L["Arrow"]},
		{id="ammobullet", s="Bullet", name=L["Bullet"]},
	}, },
	{id="S", name=L["Soulbound"], val=32},
	{id="Q", name=L["Quest Item"], val=64},
	{id="E", name=L["Bind on Equip/Use"], val=128},
	{id="P", name=L["Bind on Pickup"], val=256},
};

function GarbageFu:GetItemType(item)
	-- item.type = 0;
	-- item.subtype = 0;
	-- item.bind = "";
	gratuity:SetBagItem(item.bag,item.slot);
	if gratuity:Find(ITEM_SOULBOUND, 2, 4, false, true, false) then
		item.bind = "S"; -- Soulbound
		gratuity:SetHyperlink("item:"..item.code);
		if gratuity:Find(ITEM_BIND_ON_PICKUP, 2, 4, false, true, false) then
			item.bind = "SP"; -- 288 = BoP + Soulbound
		elseif gratuity:Find(ITEM_BIND_ON_EQUIP, 2, 4, false, true, false) then
			item.bind = "SE"; -- 160 = BoE + Soulbound
		elseif gratuity:Find(ITEM_BIND_ON_USE, 2, 4, false, true, false) then
			item.bind =  "SE"; -- 160 = BoE + Soulbound
		elseif gratuity:Find(ITEM_BIND_QUEST, 2, 4, false, true, false) then
			item.bind = "SQ"; -- 96 = Quest + Soulbound
		end
	elseif gratuity:Find(ITEM_BIND_QUEST, 2, 4, false, true, false) then
		item.bind = "Q"; -- Quest
	elseif gratuity:Find(ITEM_BIND_ON_EQUIP, 2, 4, false, true, false) then
		item.bind = "E"; -- BoE
	elseif gratuity:Find(ITEM_BIND_ON_USE, 2, 4, false, true, false) then
		item.bind = "E"; -- BoE
	end

	local iType, iSubType;
	if WOW2 then
		_, _, item.qual, _, _, iType, iSubType, item.maxstack, _, item.tex = GetItemInfo(item.id);
	else
		_, _, item.qual, _, iType, iSubType, item.maxstack, _, item.tex = GetItemInfo(item.id);
	end
	if iType then
		for i, n in ipairs(self.vars.itemtypes) do
			if not n.val and iType == n.s then
				item.type = i;
				if n.sub then
					for i2, n2 in ipairs(n.sub) do
						if iSubType == n2.s then
							item.subtype = i2;
							break;
						end
					end
				end
				break;
			end
		end
	end
end

function GarbageFu:IsItemSoulbound(item)
	if item.bind then
		if string.find(item.bind,"S") then return true end
		if string.find(item.bind,"Q") then return true end
	end
end

function GarbageFu:IsItemDropType(item)
	return self:IsItemType(item, self.db.profile.droptypes);
end

function GarbageFu:IsItemKeepType(item)
	return self:IsItemType(item, self.db.profile.keeptypes);
end

function GarbageFu:IsDropTypeSelected(i, i2)
	return self:IsTypeSelected(i, i2, self.db.profile.droptypes);
end

function GarbageFu:IsKeepTypeSelected(i, i2)
	return self:IsTypeSelected(i, i2, self.db.profile.keeptypes);
end

function GarbageFu:IsChildDropTypeSelected(i)
	return self:IsChildTypeSelected(i, self.db.profile.droptypes);
end

function GarbageFu:IsChildKeepTypeSelected(i)
	return self:IsChildTypeSelected(i, self.db.profile.keeptypes);
end

function GarbageFu:ToggleDropType(i, i2)
	self:ToggleSets(i, i2, self.vars.itemtypes, self.db.profile.droptypes, self.db.profile.keeptypes);
	self:UpdateDisplay();
end

function GarbageFu:ToggleKeepType(i, i2)
	self:ToggleSets(i, i2, self.vars.itemtypes, self.db.profile.keeptypes, self.db.profile.droptypes);
	self:UpdateDisplay();
end


function GarbageFu:BuildDropTypeMenu(level, value, inTooltip, value2)
	if level == 1 then
		dewdrop:AddLine('text', L["Drop Types"], 'hasArrow', true, 'value', 'droptypes' );
	elseif level == 2 then
		if ( value == 'droptypes' ) then
			-- Drop - Types
			dewdrop:AddLine('text', L["Drop Types"], "isTitle", true );
			for n,i in ipairs(self.vars.itemtypes) do
				local checked = self:IsDropTypeSelected(n);
				local checkIcon = "Interface\\Buttons\\UI-CheckBox-Check" 
				if self:IsChildDropTypeSelected(n) then
					checked = true;
					checkIcon = "Interface\\Buttons\\UI-CheckBox-Check-Disabled"
				end
				dewdrop:AddLine('text', i.name, 
					'checked', checked, 'checkIcon', checkIcon,
					'disabled', self:IsKeepTypeSelected(n),
					'hasArrow', i.sub ~= nil, 'value', n,
					'arg1', self, 'arg2', n, 'func', 'ToggleDropType' );
			end
		end
	elseif level == 3 then
		if ( value2 == 'droptypes' ) then
			dewdrop:AddLine('text', L["Drop Type"].." "..self.vars.itemtypes[value].name, "isTitle", true );
			for n,i in ipairs(self.vars.itemtypes[value].sub) do
				dewdrop:AddLine('text', i.name, 
					'checked', self:IsDropTypeSelected(value,n),
					'disabled',self:IsKeepTypeSelected(value,n),
					'arg1', self, 'arg2', value, 'arg3', n, 'func', 'ToggleDropType' );
			end
		end
	end
end

function GarbageFu:BuildKeepTypeMenu(level, value, inTooltip, value2)
	if level == 1 then
		dewdrop:AddLine('text', L["Keep Types"], 'hasArrow', true, 'value', 'keeptypes' );
	elseif level == 2 then
		if ( value == 'keeptypes' ) then
			-- Keep - Types
			dewdrop:AddLine('text', L["Keep Types"], "isTitle", true );
			for n,i in ipairs(self.vars.itemtypes) do
				local checked = self:IsKeepTypeSelected(n);
				local checkIcon = "Interface\\Buttons\\UI-CheckBox-Check" 
				if self:IsChildKeepTypeSelected(n) then
					checked = true;
					checkIcon = "Interface\\Buttons\\UI-CheckBox-Check-Disabled"
				end
				dewdrop:AddLine('text', i.name, 
					'checked', checked, 'checkIcon', checkIcon,
					'disabled', self:IsDropTypeSelected(n),
					'hasArrow', i.sub ~= nil, 'value', n,
					'arg1', self, 'arg2', n, 'func', 'ToggleKeepType' );
			end
		end
	elseif level == 3 then
		if ( value2 == 'keeptypes' ) then
			dewdrop:AddLine('text', L["Keep Type"].." "..self.vars.itemtypes[value].name, "isTitle", true );
			for n,i in ipairs(self.vars.itemtypes[value].sub) do
				dewdrop:AddLine('text', i.name, 
					'checked', self:IsKeepTypeSelected(value,n),
					'disabled', self:IsDropTypeSelected(value,n),
					'arg1', self, 'arg2', value, 'arg3', n, 'func', 'ToggleKeepType' );
			end
		end
	end
end

function GarbageFu:IsItemType(item, typestbl)
	if item.type then
		if typestbl[self.vars.itemtypes[item.type].id] then 
			return true
		elseif item.subtype then
			if typestbl[self.vars.itemtypes[item.type].sub[item.subtype].id] then
				return true
			end
		end
	end
	if item.bind then
		for i=1, string.len(item.bind) do
			if typestbl[string.sub(item.bind, i, i)] then
				return true
			end
		end
	end	
end

function GarbageFu:IsTypeSelected(i, i2, typestbl)
	local typeid = self.vars.itemtypes[i].id;
	if i2 then
		local subtypeid = self.vars.itemtypes[i].sub[i2].id;
		return typestbl[typeid] or typestbl[subtypeid];
	end
	return typestbl[typeid];
end

function GarbageFu:IsChildTypeSelected(i,typestbl)
	if self.vars.itemtypes[i].sub then
		for _,s in ipairs(self.vars.itemtypes[i].sub) do
			if typestbl[s.id] then
				return true;
			end
		end
	end
end

--[[
function GarbageFu:ToggleType(i, i2, typestbl1, typestbl2)
	self:DebugPrint("ToggleType(type, subtype) set="..tostring(i).." subset="..tostring(i2));
	local typeid = self.vars.itemtypes[i].id;
	if i2 then																	-- Clicked a child
		local subtypeid = self.vars.itemtypes[i].sub[i2].id;
		if typestbl1[typeid] then  												-- Check if parent is set
			typestbl1[typeid] = nil; 													-- Clear parent
			for _,s in ipairs(self.vars.itemtypes[i].sub) do
				typestbl1[s.id] = true; 												-- Set all children
			end
		end
		if typestbl1[subtypeid] then											-- Reverse child
			typestbl1[subtypeid] = nil;
		else	
			typestbl1[subtypeid] = true;
		end
		local allset = true;
		for _,s in ipairs(self.vars.itemtypes[i].sub) do
			if not typestbl1[s.id] then 										-- Check if all children are set
				allset = false;
				break;
			end
		end
		if allset then																		-- All children are set
			typestbl1[typeid] = true; 												-- set parent
			for i,s in ipairs(self.vars.itemtypes[i].sub) do
				typestbl1[s.id] = nil;	  											-- And clear all children
			end
		end
	else																						-- Clicked a parent or a single
		if typestbl1[typeid] then													-- Reverse it
			typestbl1[typeid] = nil;
		else
			typestbl1[typeid] = true;
			if self.vars.itemtypes[i].sub then								-- If it is a parent
				for _,s in ipairs(self.vars.itemtypes[i].sub) do					-- Clear all children for both typestbl1 and typestbl2
					typestbl1[s.id] = nil;
					if typestbl2 then typestbl2[s.id] = nil end
				end
			end
		end
	end
end
]]
