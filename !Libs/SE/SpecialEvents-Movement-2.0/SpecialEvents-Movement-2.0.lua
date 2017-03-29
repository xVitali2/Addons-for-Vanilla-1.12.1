
--[[
	Name: SpecialEvents-Movement-2.0
	Revision: $Rev: 14918 $
	Author: Tekkub Stoutwrithe (tekkub@gmail.com)
	Website: http://www.wowace.com/
	Description: Special events for movement
	Dependencies: AceLibrary, AceEvent-2.0
]]


local vmajor, vminor = "SpecialEvents-Movement-2.0", "$Revision: 14918 $"

if not AceLibrary then error(vmajor .. " requires AceLibrary.") end
if not AceLibrary:HasInstance("AceEvent-2.0") then error(vmajor .. " requires AceEvent-2.0.") end
if not AceLibrary:IsNewVersion(vmajor, vminor) then return end

local lib = {}
AceLibrary("AceEvent-2.0"):embed(lib)


-- Activate a new instance of this library
function activate(self, oldLib, oldDeactivate)
	if oldLib then
		self.vars = oldLib.vars
		oldLib:CancelAllScheduledEvents()
		oldLib:UnregisterAllEvents()
	end
	if not self.vars then self.vars = {} end
	
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA", SetMapToCurrentZone)
	self:ScheduleRepeatingEvent(self.OnTick, 0.2, self)
	
	if oldDeactivate then oldDeactivate(oldLib) end
end


function lib:OnTick()
	local x, y = GetPlayerMapPosition("player")
	if not self.vars.lastx then self.vars.lastx, self.vars.lasty = x, y end
	
	if (not self.vars.moving and (self.vars.lastx ~= x or self.vars.lasty ~= y)) then
		self.vars.moving = true
		self:TriggerEvent("SpecialEvents_PlayerMoving")
	elseif (self.vars.moving and self.vars.lastx == x and self.vars.lasty == y) then
		self.vars.moving = nil
		self:TriggerEvent("SpecialEvents_PlayerStationary")
	end
	
	self.vars.lastx, self.vars.lasty = x, y
end


-----------------------------
--      Query methods      --
-----------------------------

function lib:PlayerMoving()
	return self.vars.moving
end


--------------------------------
--      Load this bitch!      --
--------------------------------
AceLibrary:Register(lib, vmajor, vminor, activate)