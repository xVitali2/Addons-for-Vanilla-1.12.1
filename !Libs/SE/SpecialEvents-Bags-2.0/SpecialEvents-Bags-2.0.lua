--[[
Name: SpecialEvents-Bags-2.0
Revision: $Rev: 8112 $
Author: Tekkub Stoutwrithe (tekkub@gmail.com)
Website: http://www.wowace.com/
Description: Special events for bag/slot changes
Dependencies: AceLibrary, AceEvent-2.0
]]


local vmajor, vminor = "SpecialEvents-Bags-2.0", "$Revision: 8112 $"

if not AceLibrary then error(vmajor .. " requires AceLibrary.") end
if not AceLibrary:HasInstance("AceEvent-2.0") then error(vmajor .. " requires AceEvent-2.0.") end
if not AceLibrary:IsNewVersion(vmajor, vminor) then return end

local lib = {}
AceLibrary("AceEvent-2.0"):embed(lib)


----------------------------
--     Initializaiton     --
----------------------------

-- Activate a new instance of this library
function activate(self, oldLib, oldDeactivate)
	if oldLib then
		self.vars = oldLib.vars
		if oldLib:IsEventRegistered("BAG_UPDATE") then self:RegisterEvent("BAG_UPDATE") end
		oldLib:UnregisterAllEvents()
	else
		self.vars = {}
		self:InitBagScan()
--~~ 		self:RegisterEvent("BAG_UPDATE")
	end

	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYER_LEAVING_WORLD")

	if oldDeactivate then oldDeactivate(oldLib) end
end


function lib:PLAYER_ENTERING_WORLD()
	self:RegisterEvent("BAG_UPDATE")
end


function lib:PLAYER_LEAVING_WORLD()
	self:UnregisterEvent("BAG_UPDATE")
end


--------------------------------
--      Tracking methods      --
--------------------------------

function lib:InitBagScan()
	self.vars.bags = {}

	for bag=0,4 do
		self.vars.bags[bag] = {}

		for slot=1,GetContainerNumSlots(bag) do
			local itemlink = GetContainerItemLink(bag, slot)
			local _, stack = GetContainerItemInfo(bag, slot)

			self.vars.bags[bag][slot] = {itemlink, stack}
		end
	end
end


function lib:BAG_UPDATE(bag)
	if not bag then self:TriggerEvent("SpecialEvents_WTFNoBag") return end
	if bag < 0 or bag > 4 then return end

	for slot=1,self:GetNumSlots(bag) do
		local itemlink = GetContainerItemLink(bag, slot)
		local _, stack = GetContainerItemInfo(bag, slot)

		if not self.vars.bags[bag] then self.vars.bags[bag] = {} end
		if not self.vars.bags[bag][slot] then self.vars.bags[bag][slot] = {} end
		local oldlink, oldstack = self.vars.bags[bag][slot][1], self.vars.bags[bag][slot][2]

		if oldlink ~= itemlink or oldstack ~= stack then
			self:TriggerEvent("SpecialEvents_BagSlotUpdate", bag, slot, itemlink, stack, oldlink, oldstack)
			self.vars.bags[bag][slot][1], self.vars.bags[bag][slot][2] = itemlink, stack
		end
	end
end


function lib:GetNumSlots(bag)
	if not self.vars.bags[bag] then return GetContainerNumSlots(bag) end

	local n = 0
	for i in pairs(self.vars.bags[bag]) do n = n + 1 end
	return math.max(n, GetContainerNumSlots(bag))
end


--------------------------------
--      Load this bitch!      --
--------------------------------
AceLibrary:Register(lib, vmajor, vminor, activate)



