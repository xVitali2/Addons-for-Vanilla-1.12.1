--[[ The Item Use uility has a dependency on SpellCast.lua and .xml.
	Its responsibility is to record indentifying information about items
	as those items are used.
]]
--[[ Multiple AddOns may include this utility.
	In order to prevent overwritten info, or just wasted cycles,
	the following definitions are only made once.
]]
if ( not ItemUse_Attempt ) then


function ItemUse_Identify(itemLink, slot, bag, castingFunction, ...)
	assert( "ItemUse_Identify", itemLink, castingFunction, slot, bag )
	
	if ( itemLink ) then
		item = {
			name	= string.gsub( itemLink, ".*%[(.*)%].*", "%1" ),
			ID		= string.gsub( itemLink, ".*item:(%d*):.*", "%1" ),
			slot	= slot,
			bag		= bag,
		}
		
		SpellCast_Attempt( item, castingFunction, unpack( arg ) )
		
		return item
	end
	
	castingFunction( unpack( arg ) )
end

ItemUse_UseInventoryItem = UseInventoryItem
function UseInventoryItem(slot)
	ItemUse_Identify(
		GetInventoryItemLink( "player", slot ), slot, nil,
		ItemUse_UseInventoryItem, slot
	)
end		

ItemUse_UseContainerItem = UseContainerItem
function UseContainerItem(bag, slot)
	if ( BankFrame:IsShown() ) then
		ItemUse_UseContainerItem( bag, slot )
		
	else
		ItemUse_Identify(
			GetContainerItemLink( bag, slot ), slot, bag,
			ItemUse_UseContainerItem, bag, slot
		)
	end
end

ItemUse_UseAction = UseAction
function UseAction(actionSlot, checkCursor, onSelf)
	assert( "ItemUse_UseAction", actionSlot, checkCursor, onSelf )
	
	if ( GetActionCount( actionSlot ) ~= 0 ) then
		--[[ An item has been confirmed as the source of the action.
			It is now the AddOn's task to determine what the item's location is.
		]]
		SpellCast_Tooltip:SetOwner( WorldFrame, "ANCHOR_NONE" )
		SpellCast_Tooltip:SetAction( actionSlot )
		local USED_ITEM_PATTERN = "(.*%[" .. SpellCast_TooltipTextLeft1:GetText() .. "%].*)"
		
		--[[ Searching through the inventory (equipped items) is a simple matter.
			Each actionSlot is consulted in an order that in-game data suggests will yield the fastest results.
			Trinkets are checked first, obviously.  Some actionSlots aren't checked at all (e.g. Tabard).
		]]
		if IsEquippedAction( actionSlot ) then
			for _, invSlot in { 13, 14, 17, 16, 1, 5, 6, 8, 15, 11, 12, 10, 7, 2 } do
				for itemLink in string.gfind( GetInventoryItemLink( "player", invSlot ) or "", USED_ITEM_PATTERN ) do
					assert( "ItemUse_UseAction", "found in equipment." )
						
					ItemUse_Identify(
						itemLink, invSlot, nil,
						ItemUse_UseAction, actionSlot, checkCursor, onSelf
					)
					return
				end
			end
		
		--[[ Searching a bag is done through "brute-force" methods.
			It can be hard to predict where a player stores the item (s)he uses -
			I'd be inclined to search the furthest left actionSlots first,
			since people organize their consumables to be separate from incoming items,
			but WoW programming will use from the right first
			in the case of multiple item choices.
		]]	
		else
			for bag = 0, 4 do
				for bagSlot = 1, GetContainerNumSlots( bag ) do
					for itemLink in string.gfind( GetContainerItemLink( bag, bagSlot ) or "", USED_ITEM_PATTERN ) do
						assert( "ItemUse_UseAction", "found in bag." )
						
						ItemUse_Identify(
							itemLink, bagSlot, bag,
							ItemUse_UseAction, actionSlot, checkCursor, onSelf
						)
						return
					end
				end
			end			
		end
	
	else	-- macro or spell
		ItemUse_UseAction( actionSlot, checkCursor, onSelf )
	end
end


end	-- ITEM-USE UTILITY DEFINITION