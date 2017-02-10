
--[[
Name: SpecialEvents-Keys-2.0
Revision: $Rev: 14863 $
Author: Tekkub Stoutwrithe (tekkub@gmail.com)
Website: http://www.wowace.com/
Description: Special events for modifier (ctrl, alt, shift) keypresses
Dependencies: AceLibrary, AceEvent-2.0, Metrognome-2.0
]]


local vmajor, vminor = "SpecialEvents-Keys-2.0", "$Revision: 14863 $"

if not AceLibrary then error(vmajor .. " requires AceLibrary.") end
if not AceLibrary:HasInstance("AceEvent-2.0") then error(vmajor .. " requires AceEvent-2.0.") end
if not AceLibrary:HasInstance("Metrognome-2.0") then error(vmajor .. " requires Metrognome-2.0.") end
if not AceLibrary:IsNewVersion(vmajor, vminor) then return end

local lib = {}
AceLibrary("AceEvent-2.0"):embed(lib)


-- Activate a new instance of this library
function activate(self, oldLib, oldDeactivate)
	self.metro = AceLibrary("Metrognome-2.0")

	if oldLib then
		self.vars = oldLib.vars or {}
		self.metro:Unregister("SpecialEvents-Keys-2.0")
	else self.vars = {} end

	self.metro:Register("SpecialEvents-Keys-2.0", self.OnTick, nil, self)
	self.metro:Start("SpecialEvents-Keys-2.0")

	if oldDeactivate then oldDeactivate(oldLib) end
end


function lib:OnTick()
	local ctrl, shift, alt = IsControlKeyDown(), IsShiftKeyDown(), IsAltKeyDown()

	if ctrl  and not self.vars.ctrl  then self:TriggerEvent("SpecialEvents_CtrlKeyDown")  end
	if shift and not self.vars.shift then self:TriggerEvent("SpecialEvents_ShiftKeyDown") end
	if alt   and not self.vars.alt   then self:TriggerEvent("SpecialEvents_AltKeyDown")   end

	if not ctrl  and self.vars.ctrl  then self:TriggerEvent("SpecialEvents_CtrlKeyUp")  end
	if not shift and self.vars.shift then self:TriggerEvent("SpecialEvents_ShiftKeyUp") end
	if not alt   and self.vars.alt   then self:TriggerEvent("SpecialEvents_AltKeyUp")   end

	self.vars.ctrl, self.vars.shift, self.vars.alt = ctrl, shift, alt
end


--------------------------------
--      Load this bitch!      --
--------------------------------
AceLibrary:Register(lib, vmajor, vminor, activate)
