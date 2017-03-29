--[[
	Name: SpecialEvents-Mount-2.0
	Revision: $Rev: 15360 $
	Author: Tekkub Stoutwrithe (tekkub@gmail.com)
	Website: http://www.wowace.com/
	Description: Special events for mounting
	Dependencies: AceLibrary, AceEvent-2.0, Gratuity-2.0, SpecialEvents-Aura-2.0
]]


local vmajor, vminor = "SpecialEvents-Mount-2.0", "$Revision: 15360 $"

if not AceLibrary then error(vmajor .. " requires AceLibrary.") end
if not AceLibrary:HasInstance("AceEvent-2.0") then error(vmajor .. " requires AceEvent-2.0.") end
if not AceLibrary:HasInstance("Gratuity-2.0") then error(vmajor .. " requires Gratuity-2.0.") end
if not AceLibrary:IsNewVersion(vmajor, vminor) then return end

local lib = {}
AceLibrary("AceEvent-2.0"):embed(lib)

local gratuity = AceLibrary("Gratuity-2.0")
local tooltipfind = GetLocale() == "deDE" and "Erh\195\182\ht Tempo um (.+)%%"
or GetLocale() == "koKR" and "이동 속도 ([60|100]*)%%만큼 증가"
or GetLocale() == "frFR" and "Augmente la vitesse de (.+)%%"
or GetLocale() == "ruRU" and "Скорость повышена на (%d+)%%."
or "Increases speed by (.+)%%"


-- Activate a new instance of this library
function activate(self, oldLib, oldDeactivate)
	if oldLib then
		self.vars = oldLib.vars
		oldLib:UnregisterAllEvents()
	else
		self.vars = {}
		for buff,i in AceLibrary("SpecialEvents-Aura-2.0"):BuffIter("player") do
			self:SpecialEvents_PlayerBuffGained(buff, i)
		end
	end
	self:RegisterEvent("SpecialEvents_PlayerBuffGained")
	self:RegisterEvent("SpecialEvents_PlayerBuffLost")
	
	if oldDeactivate then oldDeactivate(oldLib) end
end


function lib:SpecialEvents_PlayerBuffGained(buff, i)
	if UnitOnTaxi("player") then return end
	
	gratuity:SetPlayerBuff(GetPlayerBuff(i, "HELPFUL"))
	local txt, speed = gratuity:GetLine(2)
	if txt then _, _, speed = string.find(txt, tooltipfind) end
	
	if speed and not self.vars.mounted then
		self.vars.mounted, self.vars.mountspeed = buff, speed
		self:TriggerEvent("SpecialEvents_Mounted", buff, speed, i)
	end
end


function lib:SpecialEvents_PlayerBuffLost(buff)
	if buff == self.vars.mounted then
		local s = self.vars.mountspeed
		self.vars.mounted, self.vars.mountspeed = nil, nil
		self:TriggerEvent("SpecialEvents_Dismounted", buff, s)
	end
end


-----------------------------
--      Query Methods      --
-----------------------------

function lib:PlayerMounted()
	return self.vars.mounted, self.vars.mountspeed
end


--------------------------------
--      Load this bitch!      --
--------------------------------
AceLibrary:Register(lib, vmajor, vminor, activate)