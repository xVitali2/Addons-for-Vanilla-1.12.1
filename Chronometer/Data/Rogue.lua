--<< ====================================================================== >>--
-- Setup Timers                                                               --
--<< ====================================================================== >>--
local BS = AceLibrary("Babble-Spell-2.2")

function Chronometer:RogueSetup()
	local _, eclass = UnitClass("player")
	if eclass ~= "ROGUE" then return end

	self:AddTimer(self.SPELL, BS["Adrenaline Rush"], 15, 0,1,1)
	self:AddTimer(self.SPELL, BS["Blind"],           10, 1,0,0)
	self:AddTimer(self.SPELL, BS["Blade Flurry"],    15, 0,1,1)
	self:AddTimer(self.SPELL, BS["Cheap Shot"],       4, 1,0,0)
	self:AddTimer(self.SPELL, BS["Distract"],        10, 0,0,0)
	self:AddTimer(self.SPELL, BS["Evasion"],         15, 0,1,1)
	self:AddTimer(self.SPELL, BS["Expose Armor"],    30, 1,0,0)
	self:AddTimer(self.SPELL, BS["Garrote"],         18, 1,0,0)
	self:AddTimer(self.SPELL, BS["Gouge"],            4, 1,0,0, { d={tn=BS["Improved Gouge"],   tb=0.5} })
	self:AddTimer(self.SPELL, BS["Hemorrhage"],      15, 1,0,0)
	self:AddTimer(self.SPELL, BS["Kick"],             5, 1,0,0, { ea={[BS["Kick - Silenced"]]=1} })
	self:AddTimer(self.SPELL, BS["Kidney Shot"],      1, 1,0,0, { d={rs=1, cp=1} })
	self:AddTimer(self.SPELL, BS["Riposte"],          6, 1,0,0)
	self:AddTimer(self.SPELL, BS["Rupture"],          8, 1,0,0, { d={cp=2} })
	self:AddTimer(self.SPELL, BS["Sap"],             25, 1,0,0, { d={rs=10} })
	self:AddTimer(self.SPELL, BS["Slice and Dice"],   9, 0,1,1, { d={cp=3, tn=BS["Improved Slice and Dice"], tb=15, tp=1} })
	self:AddTimer(self.SPELL, BS["Sprint"],          15, 0,1,1)
	self:AddTimer(self.SPELL, BS["Vanish"],          10, 0,1,1)

	self:AddTimer(self.EVENT, BS["Kick - Silenced"],    2, 1,0,0, { cr="GREEN" })
	self:AddTimer(self.EVENT, BS["Mace Stun Effect"], 3, 1,0,0, { cr="GREEN", a=1, xn=BS["Mace Specialization"] })
	self:AddTimer(self.EVENT, BS["Remorseless"],     20, 0,1,1, { cr="GREEN", a=1 })

	--self:AddTimer(A.SKILL, C.RIPOSTE,          5, 0,1,1, { cr="YELLOW" })
end

table.insert(Chronometer.dataSetup, Chronometer.RogueSetup)
