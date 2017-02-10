
--[[
Name: SpecialEvents-Equipped-2.0
Revision: $Rev: 15013 $
Author: Tekkub Stoutwrithe (tekkub@gmail.com)
Website: http://www.wowace.com/
Description: Special events for equipment changes
Dependencies: AceLibrary, AceEvent-2.0
]]


local vmajor, vminor = "SpecialEvents-Equipped-2.0", "$Revision: 15013 $"

if not AceLibrary then error(vmajor .. " requires AceLibrary.") end
if not AceLibrary:HasInstance("AceEvent-2.0") then error(vmajor .. " requires AceEvent-2.0.") end
if not AceLibrary:IsNewVersion(vmajor, vminor) then return end

local lib = {}
AceLibrary("AceEvent-2.0"):embed(lib)


-- Activate a new instance of this library
function activate(self, oldLib, oldDeactivate)
	if oldLib then
		self.vars = oldLib.vars
		oldLib:UnregisterAllEvents()
	end
	if not self.vars then self.vars = {} end
	if not self.vars.inv then self.vars.inv = {} end
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYER_LEAVING_WORLD")
	if AceLibrary("AceEvent-2.0"):IsFullyInitialized() then self:AceEvent_FullyInitialized()
	else self:RegisterEvent("AceEvent_FullyInitialized") end

	if oldDeactivate then oldDeactivate(oldLib) end
end


------------------------------
--      Event handlers      --
------------------------------

function lib:AceEvent_FullyInitialized()
	for i=0,19 do self.vars.inv[i] = GetInventoryItemLink("player", i) end
	self:RegisterEvent("UNIT_INVENTORY_CHANGED")
end


function lib:PLAYER_ENTERING_WORLD()
	self:RegisterEvent("UNIT_INVENTORY_CHANGED")
end


function lib:PLAYER_LEAVING_WORLD()
	if self:IsEventRegistered("UNIT_INVENTORY_CHANGED") then self:UnregisterEvent("UNIT_INVENTORY_CHANGED") end
end


function lib:UNIT_INVENTORY_CHANGED()
	if arg1 ~= "player" then return end

	for i=0,19 do
		local link = GetInventoryItemLink("player", i)
		if self.vars.inv[i] ~= link then
			self:TriggerEvent("SpecialEvents_EquipmentChanged", i, link, self.vars.inv[i])
			self.vars.inv[i] = link
		end
	end
end


-----------------------------
--      Query methods      --
-----------------------------

-- If slot is passed returns true|false for that slot
-- If no slot is passed returns the index of the first slot that has the item equipped
function lib:ItemIsEquipped(itemlink, slot)
	if slot then return self.vars.inv[slot] == itemlink
	else
		for i,v in pairs(self.vars.inv) do
			if v == itemlink then return i end
		end
	end
end


--------------------------------
--      Load this bitch!      --
--------------------------------
AceLibrary:Register(lib, vmajor, vminor, activate)


