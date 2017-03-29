--[[
	Name: ItemClasses-2.0
	Revision: $Rev: 12179 $
	Author(s): Dreyruugr (dreyruugr@gmail.com)
	Website: http://wiki.wowace.com/index.php/ItemClasses-2.0
	Documentation: http://wiki.wowace.com/index.php/ItemClasses-2.0_API_Documentation
	SVN: http://svn.wowace.com/root/trunk/ItemClassLib/ItemClasses-2.0
	Description: A set of classes used to describe and execute usable items/actions (spells, macros, etc...)
	Dependencies: AceLibrary, AceOO-2.0, AceHook-2.0
]]

local MAJOR_VERSION = "ItemClasses-2.0"
local MINOR_VERSION = "$Revision: 12179 $"
local ITEMDEF_MAJOR_VERSION = "ItemDef-2.0"
local CURSORITEM_MAJOR_VERSION = "CursorItem-2.0"
local SPELLITEM_MAJOR_VERSION = "SpellItem-2.0"
local MACROITEM_MAJOR_VERSION = "MacroItem-2.0"
local ACTIONITEM_MAJOR_VERSION = "ActionItem-2.0"
local USEITEM_MAJOR_VERSION = "UseItem-2.0"
local UNITITEM_MAJOR_VERSION = "UnitItem-2.0"

if not AceLibrary then error( MAJOR_VERSION .. " requires AceLibrary." ) end
if not AceLibrary:IsNewVersion( MAJOR_VERSION, MINOR_VERSION ) then return end

if not AceLibrary:HasInstance("AceOO-2.0") then error( MAJOR_VERSION.." requires AceOO-2.0.") end
if not AceLibrary:HasInstance("AceHook-2.0") then error( MAJOR_VERSION.." requires AceHook-2.0.") end

AceLibrary:Register( {}, MAJOR_VERSION, MINOR_VERSION )

local AceOO = AceLibrary("AceOO-2.0")

-----------------------------------------
-- ItemDef (Class)
-- 
-- Virtual class for usable items
-----------------------------------------
local ItemDef = AceOO.Class()
ItemDef.virtual = true

function ItemDef.prototype:init( type, iconTexture )
	AceLibrary( ITEMDEF_MAJOR_VERSION ).super.prototype.init(self) -- very important. Will fail without this.
	assert( type )
	self.type = type
	self.iconTexture = (iconTexture or "")
end

function ItemDef.prototype:GetType()
	return self.type
end

function ItemDef.prototype:GetIconTexture()
	return self.iconTexture
end

function ItemDef.prototype:GetIconCoord()
	return 0, 1, 0, 1
end

function ItemDef.prototype:SetIconTexture( texture )
	self.iconTexture = texture;
end

function ItemDef.prototype:ToString()
	return string.format("<%s instance: %s>", tostring(self.class), tostring(self.type))
end

AceLibrary:Register( ItemDef, ITEMDEF_MAJOR_VERSION, 1 )
ItemDef = nil


local CursorItem = AceOO.Class("AceHook-2.0")

function CursorItem.prototype:init()
	AceLibrary(CURSORITEM_MAJOR_VERSION).super.prototype.init(self);
	
	self.CursorObject = {};
end

function CursorItem.prototype:GetObjectDef()
	return self.CursorObject
end

function CursorItem.prototype:HasObjectDef()
	return self.CursorObject.type or false
end

function CursorItem.prototype:GetObjectType()
	return self.CursorObject.type
end

function CursorItem.prototype:Enable()
	if ( not self:IsHooked("PickupAction") ) then
		self:Hook("PickupAction");
	end
	if ( not self:IsHooked("PickupSpell") ) then
		self:Hook("PickupSpell");
	end
	if ( not self:IsHooked("PickupMacro") ) then
		self:Hook("PickupMacro");
	end
	if ( not self:IsHooked("PickupContainerItem") ) then
		self:Hook("PickupContainerItem");
	end
	if ( not self:IsHooked("PickupInventoryItem") ) then
		self:Hook("PickupInventoryItem");
	end
	if ( not self:IsHooked("ClearCursor") ) then
		self:Hook("ClearCursor");
	end
	if ( not self:IsHooked("DeleteCursorItem") ) then
		self:Hook("DeleteCursorItem");
	end
	if ( not self:IsHooked("EquipCursorItem") ) then
		self:Hook("EquipCursorItem");
	end
	if ( not self:IsHooked("PlaceAction") ) then
		self:Hook("PlaceAction");
	end
	if ( not self:IsHooked("PutItemInBag") ) then
		self:Hook("PutItemInBag");
	end
	if ( not self:IsHooked("PutItemInBackpack") ) then
		self:Hook("PutItemInBackpack");
	end
end


function CursorItem.prototype:Disable()
	self.CursorObject = {};
	if ( self:IsHooked("PickupAction") ) then
		self:Unhook("PickupAction");
	end
	if ( self:IsHooked("PickupSpell") ) then
		self:Unhook("PickupSpell");
	end
	if ( self:IsHooked("PickupMacro") ) then
		self:Unhook("PickupMacro");
	end
	if ( self:IsHooked("PickupContainerItem") ) then
		self:Unhook("PickupContainerItem");
	end
	if ( self:IsHooked("PickupInventoryItem") ) then
		self:Unhook("PickupInventoryItem");
	end
	if ( self:IsHooked("ClearCursor") ) then
		self:Unhook("ClearCursor");
	end
	if ( self:IsHooked("DeleteCursorItem") ) then
		self:Unhook("DeleteCursorItem");
	end
	if ( self:IsHooked("EquipCursorItem") ) then
		self:Unhook("EquipCursorItem");
	end
	if ( self:IsHooked("PlaceAction") ) then
		self:Unhook("PlaceAction");
	end
	if ( self:IsHooked("PutItemInBag") ) then
		self:Unhook("PutItemInBag");
	end
	if ( self:IsHooked("PutItemInBackpack") ) then
		self:Unhook("PutItemInBackpack");
	end	
end

function CursorItem.prototype:PickupSpell( spellID, bookType )
	local spellRank;
	self.CursorObject = {};
	self.CursorObject.type = "spell";
	self.CursorObject.spellName, spellRank = GetSpellName(spellID, bookType );
	self.CursorObject.iconTexture = GetSpellTexture( spellID, bookType );
	
	self.CursorObject.spellRank = 0;
	if ( spellRank ) then
		for rank in string.gfind( spellRank, "%d+" ) do
			self.CursorObject.spellRank = tonumber(rank);
		end
	end
	
	if ( IsSpellPassive( spellID, bookType ) ) then
		self.CursorObject = {};
	end
	
	self.hooks.PickupSpell.orig( spellID, bookType );
end


function CursorItem.prototype:PickupMacro( index )
	local iconID;
	self.CursorObject = {};
	self.CursorObject.type = "macro";
	self.CursorObject.macroIndex = index;
	self.CursorObject.macroName, self.CursorObject.iconTexture, _, _ = GetMacroInfo( index );
	
	self.hooks.PickupMacro.orig( index );
end


function CursorItem.prototype:PickupContainerItem( bagID, slot )
	self.CursorObject = {};
	local itemLink = GetContainerItemLink( bagID, slot );
	if ( itemLink ) then
		self.CursorObject.type = "item";
		self.CursorObject.itemName = GetItemNameFromLink( itemLink );
		self.CursorObject.iconTexture, _, _, _, _ = GetContainerItemInfo( bagID, slot );
	end
	
	self.hooks.PickupContainerItem.orig( bagID, slot );
end


function CursorItem.prototype:PickupInventoryItem( slotID )
	self.CursorObject = {};
	
	local itemLink = GetInventoryItemLink( "player", slotID );
	if ( itemLink ) then
		self.CursorObject.type = "item";
		self.CursorObject.itemName = GetItemNameFromLink( itemLink );
		self.CursorObject.iconTexture = GetInventoryItemTexture( "player", slotID );
	end
	
	self.hooks.PickupInventoryItem.orig( slotID );
end


function CursorItem.prototype:PickupAction( slot )
	CursorItemTooltip:SetOwner( UIParent, "ANCHOR_NONE" );
	CursorItemTooltip:ClearLines()
	CursorItemTooltip:SetAction( slot )
	local actionName = GetActionText( slot )
	local iconTexture = GetActionTexture( slot )
	
	self.hooks.PickupAction.orig( slot );
	
	self.CursorObject = {};
	if ( CursorHasSpell() ) then
		local spellRank;
		
		self.CursorObject.type = "spell";
		self.CursorObject.spellName = CursorItemTooltipTextLeft1:GetText();
		spellRank = CursorItemTooltipTextRight1:GetText();
		self.CursorObject.iconTexture = iconTexture;
		
		self.CursorObject.spellRank = 0;
		if ( spellRank ) then
			for rank in string.gfind( spellRank, "%d+" ) do
				self.CursorObject.spellRank = tonumber( rank )
			end
		end
	elseif ( actionName ~= nil ) then -- Macro
		self.CursorObject.type = "macro";
		self.CursorObject.macroIndex = GetMacroIndexByName( actionName );
		self.CursorObject.macroName, self.CursorObject.iconTexture, _, _ = GetMacroInfo( self.CursorObject.macroIndex );		
	else
		self.CursorObject.type = "item";
		self.CursorObject.itemName = CursorItemTooltipTextLeft1:GetText();
		self.CursorObject.iconTexture = iconTexture;
	end
end


function CursorItem.prototype:ClearCursor()
	self.CursorObject = {};
	self.hooks.ClearCursor.orig();
end

function CursorItem.prototype:DeleteCursorItem()
	self.CursorObject = {};
	self.hooks.DeleteCursorItem.orig();
end

function CursorItem.prototype:EquipCursorItem( invSlot )
	self.CursorObject = {};
	self.hooks.EquipCursorItem.orig( invSlot );
end

function CursorItem.prototype:PlaceAction( slot )
	self.CursorObject = {};
	self.hooks.PlaceAction.orig( slot );
end

function CursorItem.prototype:PutItemInBag( inventoryID )
	self.CursorObject = {};
	self.hooks.PutItemInBag.orig( inventoryID );
end

function CursorItem.prototype:PutItemInBackpack()
	self.CursorObject = {};
	self.hooks.PutItemInBackpack.orig();
end

function CursorItem.prototype:ClearCursor()
	self.CursorObject = {};
	self.hooks.ClearCursor.orig();
end

AceLibrary:Register( CursorItem, CURSORITEM_MAJOR_VERSION, 1 )
CursorItem = nil

-----------------------------------------
-- SpellItem (ItemDef Inherited Class)
-- 
-- Class for an spell marking menu item
-----------------------------------------
local SpellItem = AceOO.Class( AceLibrary(ITEMDEF_MAJOR_VERSION) )

function SpellItem.prototype:init( object )
	AceLibrary(SPELLITEM_MAJOR_VERSION).super.prototype.init(self, "spell", (object.iconTexture or "Interface\\Icons\\INV_Sword_04")) -- very important. Will fail without this.
	
	self.spellName = (object.spellName or "Attack")
	self.spellRank = (object.spellRank or 0)
	if ( object.useOnSelf ~= nil ) then
		self.useOnSelf = object.useOnSelf
	else
		self.useOnSelf = false
	end
end

function SpellItem:Deserialize( spellName, spellRank, useOnSelf, iconTexture )
	local object = {}
	object.spellName = spellName
	object.spellRank = spellRank
	object.useOnSelf = useOnSelf
	object.iconTexture = iconTexture
	return self:new( object )
end

function SpellItem.prototype:Serialize()
	return self.spellName, self.spellRank, self.useOnSelf, self.iconTexture
end

function SpellItem.prototype:IsEnabled()
	return true
end

function SpellItem.prototype:GetTitle()
	return self.spellName
end

function SpellItem.prototype:GetRank()
	return self.spellRank;
end

function SpellItem.prototype:GetRankString()
	if ( self.spellRank > 0 ) then
		return "("..RANK.." "..self.spellRank..")";
	else
		return "(Highest Rank)";
	end
end

function SpellItem.prototype:GetNumSpellRanks()
	return GetNumSpellRanks( self.spellName )
end

function SpellItem.prototype:GetSpellBookInfo()
	return FindSpellInBook( self.spellName )
end

function SpellItem.prototype:ExecItem()
	local spellID, bookType = FindSpellInBook( self.spellName );
	assert( spellID and bookType )
	
	local start, duration = GetSpellCooldown( spellID, bookType );
	if ( start > 0 and duration > 0.001 ) then
		return false;
	elseif ( SpellIsTargeting() ) then
		return false;
	end
	
	if ( self.spellRank > 0 ) then
		CastSpellByName( self.spellName.."("..RANK.." "..self.spellRank..")", self.useOnSelf );
	else
		CastSpellByName( self.spellName.."()", self.useOnSelf );
	end
	
	return true;
end

AceLibrary:Register( SpellItem, SPELLITEM_MAJOR_VERSION, 1 )
SpellItem = nil


-----------------------------------------
-- MacroItem (ItemDef Inherited Class)
-- 
-- Class for an macro marking menu item
-----------------------------------------
local MacroItem = AceOO.Class( AceLibrary(ITEMDEF_MAJOR_VERSION) )

function MacroItem.prototype:init( object )
	AceLibrary(MACROITEM_MAJOR_VERSION).super.prototype.init(self, "macro", object.iconTexture) -- very important. Will fail without this.
	
	self.type = "macro"
	self.macroIndex = object.macroIndex
	self.macroName = object.macroName
end

function MacroItem:Deserialize( macroIndex, macroName, iconTexture )
	local object = {};
	object.macroIndex = macroIndex
	object.macroName = macroName
	object.iconTexture = iconTexture
	return self:new( object )
end

function MacroItem.prototype:IsEnabled()
	return self:Verify()
end

function MacroItem.prototype:Serialize()
	return self.macroIndex, self.macroName, self.iconTexture
end

function MacroItem.prototype:GetTitle()
	return self.macroName;
end

function MacroItem.prototype:Verify()
	local name, iconTextureID, body, isLocal = GetMacroInfo( self.macroIndex )
	
	if ( name == self.macroName ) then
		return true
	else
		return false
	end
end

function MacroItem.prototype:ExecItem()
	if ( self:Verify() ) then
		local _,_,body,_ = GetMacroInfo( self.macroIndex )
		local bodyLines = splitMacroBody( body )
		
		for k, v in ipairs( bodyLines ) do
			MacroItemEditBox:SetText( v );
			ChatEdit_SendText( MacroItemEditBox );
		end
		return true;
	else
		return false;
	end
end

AceLibrary:Register( MacroItem, MACROITEM_MAJOR_VERSION, 1 );
MacroItem = nil;

-----------------------------------------
-- UnitItem (ItemDef Inherited Class)
-- 
-- Class for an unit marking menu item
-----------------------------------------
local UnitItem = AceOO.Class( AceLibrary(ITEMDEF_MAJOR_VERSION) )

function UnitItem.prototype:init( object )
	AceLibrary(UNITITEM_MAJOR_VERSION).super.prototype.init(self, "unit", (object.iconTexture or "Interface\\CharacterFrame\\TemporaryPortrait")) -- very important. Will fail without this.
	
	self.unitID = (object.unitID or "target")
end

function UnitItem:Deserialize( unitID, iconTexture )
	local object = {}
	object.unitID = unitID
	object.iconTexture = iconTexture
	return self:new( object )
end

function UnitItem.prototype:Serialize()
	return self.unitID, self.iconTexture
end

function UnitItem.prototype:GetTitle()
	return self.unitID;
end

function UnitItem.prototype:IsEnabled()
	if ( UnitExists( self.unitID ) ) then
		return true;
	else
		return false;
	end
end

function UnitItem.prototype:ExecItem()
	--[[
		if ( SpellIsTargeting() ) then
		if ( SpellCanTargetUnit( self.unitID ) ) then
		SpellTargetUnit( self.unitID )
		return true
		end
	else
		TargetUnit( self.unitID )
		end
	]]
	
	TargetUnit( self.unitID )
	return false;
end

AceLibrary:Register( UnitItem, UNITITEM_MAJOR_VERSION, 1 );
UnitItem = nil;

-----------------------------------------
-- UseItem (ItemDef Inherited Class)
-- 
-- Class for an usable item marking menu item
-----------------------------------------
local UseItem = AceOO.Class( AceLibrary(ITEMDEF_MAJOR_VERSION) )

function UseItem.prototype:init( object )
	AceLibrary(USEITEM_MAJOR_VERSION).super.prototype.init(self, "item", object.iconTexture) -- very important. Will fail without this.
	
	assert( object.itemName and object.iconTexture)
	self.itemName = object.itemName
	if ( object.showCount ~= nil ) then 
		self.showCount = object.showCount
	else
		self.showCount = true
	end
	
	if ( object.useOnSelf ~= nil ) then 
		self.useOnSelf = object.useOnSelf
	else
		self.useOnSelf = false
	end
end

function UseItem:Deserialize( itemName, showCount, useOnSelf, iconTexture )
	local object = {}
	object.itemName = itemName
	object.showCount = showCount
	object.useOnSelf = useOnSelf
	object.iconTexture = iconTexture
	return self:new( object )
end

function UseItem.prototype:Serialize()
	return self.itemName, self.showCount, self.useOnSelf, self.iconTexture
end

function UseItem.prototype:GetItemBagInfo()
	return FindItemInBags( self.itemName )
end

function UseItem.prototype:GetItemInventoryInfo()
	return FindItemInInventory( self.itemName )
end

function UseItem.prototype:IsEnabled()
	local container, slotID = FindItemInBags( self.itemName )
	local invSlotID = FindItemInInventory( self.itemName )
	
	if ( container or slotID or invSlotID ) then
		return true;
	else
		return false;
	end
end

function UseItem.prototype:ExecItem()
	local container, slotID = FindItemInBags( self.itemName )
	local invSlotID = FindItemInInventory( self.itemName )
	
	if ( container ) then
		UseContainerItem( container, slotID, self.useOnSelf )
		return true;
	elseif ( invSlotID ) then
		UseInventoryItem( invSlotID )
		return true;
	end
	return false;
end

function UseItem.prototype:GetTitle()
	return self.itemName
end

local useItemCount

function UseItem.prototype:GetCount()
	useItemCount = GetItemCount( self.itemName )
	if ( useItemCount ) then
		return useItemCount
	else
		return 0;
	end
end

AceLibrary:Register( UseItem, USEITEM_MAJOR_VERSION, 1 )
UseItem = nil

-----------------------------------------
-- ActionItem (ItemDef Inherited Class)
-- 
-- Class for an action slot marking menu item
-----------------------------------------
local ActionItem = AceOO.Class( AceLibrary(ITEMDEF_MAJOR_VERSION) )

function ActionItem.prototype:init( object )
	AceLibrary(ACTIONITEM_MAJOR_VERSION).super.prototype.init(self, "action") -- very important. Will fail without this.
	
	self.slotID = (object.slotID or 1)
	self.barID = (object.barID or 1)
	if ( object.showCount ~= nil ) then 
		self.showCount = object.showCount
	else
		self.showCount = true
	end
	
	if ( object.useOnSelf ~= nil ) then 
		self.useOnSelf = object.useOnSelf
	else
		self.useOnSelf = false
	end
end

function ActionItem:Deserialize( slotID, barID, showCount, useOnSelf )
	local object = {};
	object.slotID = slotID
	object.barID = barID
	object.showCount = showCount
	object.useOnSelf = useOnSelf
	return self:new( object );
end

function ActionItem.prototype:Serialize()
	return self.slotID, self.barID, self.showCount, self.useOnSelf
end

function ActionItem.prototype:IsEnabled()
	return HasAction( self:GetSlotID() )
end

function ActionItem.prototype:GetTitle()
	if ( not HasAction( self:GetSlotID() ) ) then
		return "None";
	end
	
	local actionName = GetActionText( self:GetSlotID() );
	
	if ( not actionName ) then
		ActionItemTooltip:SetOwner( UIParent, "ANCHOR_NONE" );
		ActionItemTooltip:ClearLines()
		ActionItemTooltip:SetAction( self:GetSlotID() )
		actionName = ActionItemTooltipTextLeft1:GetText();
	end
	
	return actionName;
end

function ActionItem.prototype:GetCount()
	if ( IsConsumableAction( self:GetSlotID() ) ) then
		return GetActionCount( self:GetSlotID() );
	else
		return nil;
	end
end

function ActionItem.prototype:GetIconTexture()
	return GetActionTexture( self:GetSlotID() )
end

function ActionItem.prototype:GetSlotID()
	if ( self.barID == 0 ) then
		return ( self.slotID + (12 * (CURRENT_ACTIONBAR_PAGE - 1)) )
	else
		return ( self.slotID + (12 * (self.barID - 1)) )
	end
end

function ActionItem.prototype:ExecItem()
	if ( not HasAction( self:GetSlotID() ) or not IsUsableAction( self:GetSlotID() ) ) then
		return false;
	end
	-- redundant with the "IsUsableAction" above?
	local start, duration, enable = GetActionCooldown( self:GetSlotID() )
	if ( start > 0 and duration > 0 and enable > 0 ) then
		return false
	end
	
	-- AddOn's hooking "UseAction" might assume that 'this' is an actual ActionButton
	ActionItemVirtualButton:SetID( self.slotID );
	local tempThis = this
	this = ActionItemVirtualButton
	UseAction( self:GetSlotID(), 0, self.useOnSelf )
	this = tempThis
	
	return true
end

AceLibrary:Register( ActionItem, ACTIONITEM_MAJOR_VERSION, 1 );
ActionItem = nil;

local bagItemName
local invItemName
local itemCount
local thisCount
local itemLink
local container
local slot

function FindItemInBags( itemName )
	for container = 0, 4 do
		for slot = 1, GetContainerNumSlots( container ) do
			itemLink = GetContainerItemLink( container, slot )
			
			if ( itemLink ) then
				bagItemName = GetItemNameFromLink( itemLink )
				if ( bagItemName == itemName ) then
					return container, slot;
				end
			end
		end
	end
end


function GetItemCount( itemName )
	itemCount = nil
	for container = 0, 4 do
		for slot = 1, GetContainerNumSlots( container ) do
			itemLink = GetContainerItemLink( container, slot )
			
			if ( itemLink ) then
				if ( GetItemNameFromLink( itemLink ) == itemName ) then
					_, thisCount, _, _, _ = GetContainerItemInfo( container, slot )
					if ( not itemCount ) then
						itemCount = 0
					end
					itemCount = itemCount + thisCount
				end
			end
		end
	end
	for slot = 0, 19 do
		itemLink = GetInventoryItemLink( "player", slot )
		
		if ( itemLink ) then
			if ( GetItemNameFromLink( itemLink ) == itemName ) then
				if ( not itemCount ) then
					itemCount = 0
				end
				itemCount = itemCount + GetInventoryItemCount( "player", slot )
			end
		end
	end
	
	return itemCount
end


function FindItemInInventory( itemName )
	for slot = 0, 19 do
		itemLink = GetInventoryItemLink( "player", slot )
		
		if ( itemLink ) then
			invItemName = GetItemNameFromLink( itemLink )
			
			if ( invItemName == itemName ) then
				return slot;
			end
		end
	end
end


function FindSpellInBook( spellName )
	for tabIndex = 1, MAX_SKILLLINE_TABS do
		local _, _, offset, numSpells = GetSpellTabInfo( tabIndex );
		for spellIndex = (1 + offset), (numSpells + offset) do
			if ( GetSpellName( spellIndex, BOOKTYPE_SPELL ) == spellName ) then
				return spellIndex, BOOKTYPE_SPELL;
			end
		end
	end
end


function GetNumSpellRanks( spellName )
	local highestRank = 0;
	for tabIndex = 1, MAX_SKILLLINE_TABS do
		local _, _, offset, numSpells = GetSpellTabInfo( tabIndex );
		for spellIndex = (1 + offset), (numSpells + offset) do
			local bookSpellName, bookSpellRank = GetSpellName( spellIndex, BOOKTYPE_SPELL );
			if ( bookSpellName == spellName ) then
				for rank in string.gfind( bookSpellRank, "%d+" ) do
					if ( tonumber(rank) > highestRank ) then
						highestRank = tonumber(rank);
					end
				end
			end
		end
	end
	return highestRank;
end


local itemLinkName
function GetItemNameFromLink( itemLink )
	_,_,itemLinkName = string.find( itemLink, "|c%x+|Hitem:%d+:%d+:%d+:%d+|h%[(.-)%]|h|r" )
	return itemLinkName
end

function splitStringBy(str, pat)
	local t = {n = 0}
	local fpat = "(.-)"..pat
	local last_end = 1
	local s,e,cap = string.find(str, fpat, 1)
	while s ~= nil do
		if s~=1 or cap~="" then
			table.insert(t,cap)
		end
		last_end = e+1
		s,e,cap = string.find(str, fpat, last_end)
	end
	if last_end<=string.len(str) then
		cap = string.sub(str,last_end)
		table.insert(t,cap)
	end
	return t
end

function splitMacroBody( str )
	local bodyLines = splitStringBy(str,'[\n]+')
	return bodyLines
end

function ExecSlashCommand( text )
	
	if ( strlen(text) <= 0 ) then
		return false;
	end
	
	if ( strsub(text, 1, 1) ~= "/" ) then
		return false;
	end
	
	-- If the string is in the format "/cmd blah", command will be "cmd"
	local command = gsub(text, "/([^%s]+)%s(.*)", "/%1", 1);
	local msg = "";
	
	if ( command ~= text ) then
		msg = strsub(text, strlen(command) + 2);
	end
	
	command = gsub(command, "%s+", "");
	command = strupper(command);
	
	local channel = gsub(command, "/([0-9]+)", "%1");
	
	if( strlen(channel) > 0 and channel >= "0" and channel <= "9" ) then
		local channelNum, channelName = GetChannelName(channel);
		if ( channelNum > 0 ) then
			return false;
		end
	else
		for index, value in ChatTypeInfo do
			local i = 1;
			local cmdString = TEXT(getglobal("SLASH_"..index..i));
			while ( cmdString ) do
				cmdString = strupper(cmdString);
				if ( cmdString == command ) then
					return false;
				end
				i = i + 1;
				cmdString = TEXT(getglobal("SLASH_"..index..i));
			end
		end
	end
	
	for index, value in SlashCmdList do
		local i = 1;
		local cmdString = TEXT(getglobal("SLASH_"..index..i));
		while ( cmdString ) do
			cmdString = strupper(cmdString);
			if ( cmdString == command ) then
				value(msg);
				return true;
			end
			i = i + 1;
			cmdString = TEXT(getglobal("SLASH_"..index..i));
		end
	end
	
	local i = 1;
	local j = 1;
	local cmdString = TEXT(getglobal("EMOTE"..i.."_CMD"..j));
	while ( cmdString ) do
		if ( strupper(cmdString) == command ) then
			local token = getglobal("EMOTE"..i.."_TOKEN");
			if ( token ) then
				DoEmote(token, msg);
			end
			return true;
		end
		j = j + 1;
		cmdString = TEXT(getglobal("EMOTE"..i.."_CMD"..j));
		if ( not cmdString ) then
			i = i + 1;
			j = 1;
			cmdString = TEXT(getglobal("EMOTE"..i.."_CMD"..j));
		end
	end
	
	return false;
end

if ( not CursorItemTooltip ) then
	cursorTooltip = CreateFrame( "GameTooltip", "CursorItemTooltip", UIParent, "GameTooltipTemplate" );
	cursorTooltip:SetOwner( CursorItemTooltip, "ANCHOR_NONE" );
	cursorTooltip:Hide()
end


if ( not ActionItemTooltip ) then
	actionTooltip = CreateFrame( "GameTooltip", "ActionItemTooltip", UIParent, "GameTooltipTemplate" );
	actionTooltip:SetOwner( ActionItemTooltip, "ANCHOR_NONE");
	actionTooltip:Hide()
end

if ( not ActionItemVirtualButton ) then
	virtualButton = CreateFrame( "CheckButton", "ActionItemVirtualButton", UIParent, "ActionButtonTemplate" );
	virtualButton:Hide()
end

if ( not MacroItemEditBox ) then
	chatFrame = CreateFrame( "EditBox", "MacroItemEditBox", UIParent )
	chatFrame:SetHistoryLines( 1 )
	chatFrame:Hide()
	chatFrame:SetAlpha( 0 )
	chatFrame:SetMaxLetters( 255 )
	chatFrame.chatType = "SAY"
	chatFrame.stickyType = "SAY"
	chatFrame.chatLanguage = GetDefaultLanguage()
	chatFrame.lastTell = {}
	for i = 1, NUM_REMEMBERED_TELLS, 1 do
		chatFrame.lastTell[i] = ""
	end
end