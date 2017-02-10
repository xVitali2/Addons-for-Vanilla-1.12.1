--[[
Name: SpecialEvents-Breath-2.0
Revision: $Rev: 14940 $
Author: Tekkub Stoutwrithe (tekkub@gmail.com)
Website: http://www.wowace.com/
Description: Special events for player holding breath (swimming)
Dependencies: AceLibrary, AceEvent-2.0
]]


local vmajor, vminor = "SpecialEvents-Breath-2.0", "$Revision: 14940 $"

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
		oldLib:UnregisterAllEvents()
	else
		self.vars = {}
	end
	self:RegisterEvent("MIRROR_TIMER_START")

	if oldDeactivate then oldDeactivate(oldLib) end
end


function lib:MIRROR_TIMER_START(timer, a2, a3, rate)
	if timer ~= "BREATH" then return end

	if rate == -1 then
		self.vars.holdbreath = true
		self:TriggerEvent("SpecialEvents_PlayerHoldingBreath")
	elseif rate == 10 then
		self.vars.holdbreath = nil
		self:TriggerEvent("SpecialEvents_PlayerNotHoldingBreath")
	end
end


-----------------------------
--      Query methods      --
-----------------------------

function lib:PlayerHoldingBreath()
	return self.vars.holdbreath
end


--------------------------------
--      Load this bitch!      --
--------------------------------
AceLibrary:Register(lib, vmajor, vminor, activate)


