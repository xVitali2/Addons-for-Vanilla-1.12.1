--<< ====================================================================== >>--
-- Setup Timers                                                               --
--<< ====================================================================== >>--
local BS = AceLibrary("Babble-Spell-2.2")

function Chronometer:MageSetup()
	local _, eclass = UnitClass("player")
	if eclass ~= "MAGE" then return end

	self:AddGroup(1, true, "MAGENTA")

	self:AddTimer(self.SPELL, BS["Arcane Power"],  15, 0,1,1)
	self:AddTimer(self.SPELL, BS["Blast Wave"],     6, 0,0,0)
	self:AddTimer(self.SPELL, BS["Cone of Cold"],   8, 0,0,0, { rc=true, d={tn=BS["Permafrost"], tb=1} })
	self:AddTimer(self.SPELL, BS["Counterspell"],  10, 1,0,0, { ea={[BS["Counterspell - Silenced"]]=1} })
	self:AddTimer(self.SPELL, BS["Detect Magic"], 120, 1,0,0, { rc=true })
	self:AddTimer(self.SPELL, BS["Fire Ward"],     30, 0,1,1)
	self:AddTimer(self.SPELL, BS["Fireball"],       8, 1,0,0, { d={rt={4,6,6,8}}, ea={[BS["Ignite"]]=1, [BS["Impact"]]=1} })
	self:AddTimer(self.SPELL, BS["Flamestrike"],    8, 0,0,0)
	self:AddTimer(self.SPELL, BS["Frost Nova"],     8, 0,0,0)
	self:AddTimer(self.SPELL, BS["Frost Ward"],    30, 0,1,0)
	self:AddTimer(self.SPELL, BS["Frostbolt"],      9, 1,0,0, { d={rt={6,7,7,8,8,9,9}, tn=BS["Permafrost"], tb=1}, ea={[BS["Winter's Chill"]]=2} })
	self:AddTimer(self.SPELL, BS["Ice Barrier"],   60, 0,1,1)
	self:AddTimer(self.SPELL, BS["Ice Block"],     10, 0,1,1)
	self:AddTimer(self.SPELL, BS["Mana Shield"],   60, 0,1,1, { rc=true })
	self:AddTimer(self.SPELL, BS["Polymorph"],     20, 1,0,0, { gr=1, rc=true, d={rs=10} })
	self:AddTimer(self.SPELL, BS["Polymorph: Pig"],50, 1,0,0, { gr=1, rc=true })
	self:AddTimer(self.SPELL, BS["Polymorph: Turtle"],50, 1,0,0, { gr=1, rc=true })
	self:AddTimer(self.SPELL, BS["Pyroblast"],     12, 1,0,0, { ea={[BS["Ignite"]]=1, [BS["Impact"]]=1} })
	self:AddTimer(self.SPELL, BS["Fire Blast"],     0, 1,0,0, { ea={[BS["Ignite"]]=1, [BS["Impact"]]=1} })
	self:AddTimer(self.SPELL, BS["Scorch"],         0, 1,0,0, { ea={[BS["Fire Vulnerability"]]=1, [BS["Ignite"]]=1, [BS["Impact"]]=1} })

	self:AddTimer(self.EVENT, BS["Clearcasting"],         15, 0,1,1, { cr="GREEN", a=1 })
	self:AddTimer(self.EVENT, BS["Counterspell - Silenced"], 4, 1,0,0, { cr="GREEN", xn=BS["Counterspell"] })
	self:AddTimer(self.EVENT, BS["Fire Vulnerability"],   30, 1,0,0, { cr="GREEN", xn=BS["Scorch"] })
	self:AddTimer(self.EVENT, BS["Frostbite"],             5, 1,0,1, { cr="GREEN", a=1 }) 
	self:AddTimer(self.EVENT, BS["Ignite"],                4, 1,0,1, { cr="GREEN", a=1 })
	self:AddTimer(self.EVENT, BS["Impact"],                2, 1,0,0, { cr="GREEN", a=1 })
	self:AddTimer(self.EVENT, BS["Winter's Chill"],       15, 1,0,0, { cr="GREEN" })
	self:AddTimer(self.EVENT, BS["Chilled"],       		   5, 1,0,0, { cr="GREEN", a=1, d={tn=BS["Permafrost"],tb=1}})
end

table.insert(Chronometer.dataSetup, Chronometer.MageSetup)
