--[[
Name: SpellStatus-AimedShot-1.0
Revision: $Rev: 14285 $
Author(s): Nightdew (denzsolnightdew@gmail.com)
Website: http://www.wowace.com/index.php/SpellStatus-1.0
Documentation: http://www.wowace.com/index.php/SpellStatus-1.0
SVN: http://svn.wowace.com/root/trunk/SpellStatus/SpellStatus-AimedShot-1.0
Description: Addon library for SpellStatus-1.0 to allow support for Hunter's Aimed Shot
Dependencies: AceLibrary, AceDebug-2.0, AceEvent-2.0, Babble-Spell-2.2, SpellCache-1.0, SpellStatus-1.0
]]

local MAJOR_VERSION = "SpellStatus-AimedShot-1.0"
local MINOR_VERSION = "$Revision: 14285 $"

local localizedClass, englishClass = UnitClass("player");
if (englishClass ~= "HUNTER") then
	--DEFAULT_CHAT_FRAME:AddMessage(format("%s %s does not support the %s class.", MAJOR_VERSION, MINOR_VERSION, localizedClass))
	--DEFAULT_CHAT_FRAME:AddMessage(format("%s is not loaded.", MAJOR_VERSION))
	return
end

if (not AceLibrary) then 
	error(MAJOR_VERSION .. " requires AceLibrary.") 
elseif (not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION)) then 
	return 
elseif (not AceLibrary:HasInstance("AceDebug-2.0")) then 
	error(MAJOR_VERSION .. " requires AceDebug-2.0")
elseif (not AceLibrary:HasInstance("AceEvent-2.0")) then 
	error(MAJOR_VERSION .. " requires AceEvent-2.0")
elseif (not AceLibrary:HasInstance("Babble-Spell-2.0") and not AceLibrary:HasInstance("Babble-Spell-2.2")) then 
	error(MAJOR_VERSION .. " requires Babble-Spell-2.0")
elseif (not AceLibrary:HasInstance("SpellCache-1.0")) then 
	error(MAJOR_VERSION .. " requires SpellCache-1.0")
elseif (not AceLibrary:HasInstance("SpellStatus-1.0")) then 
	error(MAJOR_VERSION .. " requires SpellStatus-1.0")
end

local gratuity = AceLibrary("Gratuity-2.0")
local babbleSpell = AceLibrary:HasInstance("Babble-Spell-2.2") and AceLibrary("Babble-Spell-2.2") or AceLibrary("Babble-Spell-2.0")
local spellCache = AceLibrary("SpellCache-1.0")

--
--	SpellStatusAimedShot
--

local SpellStatusAimedShot = {}

AceLibrary("AceDebug-2.0"):embed(SpellStatusAimedShot)
AceLibrary("AceEvent-2.0"):embed(SpellStatusAimedShot)

--
-- Activate method
--

local function InitializeVariables(self)
	self.IdStart = nil
	self.IdStop = nil
	self.Duration = nil

	self:SpellCache_Updated()
end

local function InitializeEventRegisters(self)
	self:RegisterEvent("UNIT_INVENTORY_CHANGED")
	self:RegisterEvent("SpellCache_Updated")
end

local function activate(self, oldLib, oldDeactivate)
	--self:SetDebugging(true)
	--self:SetDebugLevel(3)

	self:LevelDebug(2, "SpellStatusAimedShot - activate")

	if (oldLib) then
		oldLib:UnregisterAllEvents()
	end
	
	--Default code to clean up the oldlib
	if (oldDeactivate) then
		oldDeactivate(oldLib)
	end

	InitializeVariables(self)
	InitializeEventRegisters(self)
end

--
-- SpellStatusAimedShot methods
--

function SpellStatusAimedShot:SpellCache_Updated()
	if (not spellCache:IsInitialized()) then
		return
	end

	self:LevelDebug(2, "SpellStatusAimedShot:SpellCache_Updated")

	self:UNIT_INVENTORY_CHANGED("player")

	local spellName = babbleSpell["Aimed Shot"]
	local _, _, _, _, _, sIdStart, sIdStop = spellCache:GetSpellData(spellName)
	
	self.IdStart = sIdStart
	self.IdStop = sIdStop
	self.Duration = 3000 --nil

	self:LevelDebug(2, "SpellStatusAimedShot:SpellCache_Updated", spellName, sIdStart, sIdStop)
end

function SpellStatusAimedShot:UNIT_INVENTORY_CHANGED(unitId)
	self:LevelDebug(2, "UNIT_INVENTORY_CHANGED", unitId)

	if(unitId ~= "player") then
		return
	end

	local slotId = GetInventorySlotInfo("RangedSlot")
	local rangedWeaponLink = GetInventoryItemLink("player", slotId)
	
	if (not rangedWeaponLink) then
		return
	end
	
	self.RangedWeaponLinks = self.RangedWeaponLinks or {}
	rangedWeaponSpeedData = self.RangedWeaponLinks[rangedWeaponLink] or {}
	self.RangedWeaponLinks[rangedWeaponLink] = rangedWeaponSpeedData

	local speed, lowDmg, hiDmg, posBuff, negBuff, percent = UnitRangedDamage("player");
	
	rangedWeaponSpeedCount = rangedWeaponSpeedData[speed] or 0
	rangedWeaponSpeedData[speed] = rangedWeaponSpeedCount + 1

	rangedWeaponSpeedCount = 0
	for index, value in pairs(rangedWeaponSpeedData) do
		if (rangedWeaponSpeedCount < value) then
			rangedWeaponSpeedCount = value
			self.RangedWeaponSpeed = index
		end
	end
	
	self:LevelDebug(2, "UNIT_INVENTORY_CHANGED", self.RangedWeaponLink, self.RangedWeaponSpeed)
end

-- 
-- Public Methods
--

function SpellStatusAimedShot:Active()
	local result = self.IdStart ~= nil
	self:LevelDebug(2, "SpellStatusAimedShot:Active", result)
	return result
end

function SpellStatusAimedShot:MatchSpellId(spellId)
	if (not spellId) then 
		return
	end
	
	if (self.IdStart and (spellId >= self.IdStart) and (spellId <= self.IdStop)) then
		local speed = UnitRangedDamage("player");
		local duration = self.Duration / (self.RangedWeaponSpeed / speed)
		self:LevelDebug(2, "SpellStatusAimedShot:MatchSpellId", spellId, self.IdStart, self.IdStop, self.RangedWeaponSpeed, speed, duration)
		return spellId, duration
	end
end

--
-- SpellStatusAimedShot registration
--

AceLibrary:Register(SpellStatusAimedShot, MAJOR_VERSION, MINOR_VERSION, activate)
SpellStatusAimedShot = AceLibrary(MAJOR_VERSION)
