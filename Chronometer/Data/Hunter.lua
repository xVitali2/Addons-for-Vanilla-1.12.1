--<< ====================================================================== >>--
-- Setup Timers                                                               --
--<< ====================================================================== >>--
local BS = AceLibrary("Babble-Spell-2.2")

function Chronometer:HunterSetup()
	local _, eclass = UnitClass("player")
	if eclass ~= "HUNTER" then return end

	self:AddGroup(1, true,  "MAGENTA")
	self:AddGroup(2, false, "MAROON")

	self:AddTimer(self.SPELL, BS["Bestial Wrath"],           18, 0,1,1)
	self:AddTimer(self.SPELL, BS["Concussive Shot"],          4, 1,0,0, { ea={[BS["Improved Concussive Shot"]]=4} })
	self:AddTimer(self.SPELL, BS["Counterattack"],            5, 1,0,0)
	self:AddTimer(self.SPELL, BS["Deterrence"],              10, 0,1,1)
	self:AddTimer(self.SPELL, BS["Explosive Trap"],          60, 0,0,0, { gr=1, rc=true, ea={[BS["Explosive Trap Effect"]]=60}  })
	self:AddTimer(self.SPELL, BS["Freezing Trap"],           60, 0,0,0, { gr=1, rc=true, ea={[BS["Freezing Trap Effect"]]=60}   })
	self:AddTimer(self.SPELL, BS["Frost Trap"],              60, 0,0,0, { gr=1, rc=true, ea={[BS["Frost Trap Aura"]]=60}      })
	self:AddTimer(self.SPELL, BS["Flare"],                   30, 0,0,0, { rc=true })
	self:AddTimer(self.SPELL, BS["Hunter's Mark"],          120, 1,0,0, { rc=true })
	self:AddTimer(self.SPELL, BS["Immolation Trap"],         60, 0,0,0, { gr=1, ea={[BS["Immolation Trap Effect"]]=60} })
	self:AddTimer(self.SPELL, BS["Rapid Fire"],              15, 0,1,1)
	self:AddTimer(self.SPELL, BS["Scare Beast"],             10, 1,0,0, { rc=true, d={rs=5} })
	self:AddTimer(self.SPELL, BS["Scatter Shot"],             4, 1,0,0)
	self:AddTimer(self.SPELL, BS["Scorpid Sting"],           20, 1,0,0, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Serpent Sting"],           15, 1,0,0, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Viper Sting"],              8, 1,0,0, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Wing Clip"],               10, 1,0,0, { rc=true, ea={[BS["Improved Wing Clip"]]=10} })
	self:AddTimer(self.SPELL, BS["Wyvern Sting"],            12, 1,0,0, { gr=2, rc=true })

	self:AddTimer(self.EVENT, BS["Explosive Trap Effect"],   20, 1,0,1, { gr=1, xn=BS["Explosive Trap"] })
	self:AddTimer(self.EVENT, BS["Freezing Trap Effect"],    10, 1,0,1, { gr=1, d={rs=5, tn=BS["Clever Traps"], tb=0.15, tp=1}, xn=BS["Freezing Trap"] })
	self:AddTimer(self.EVENT, BS["Frost Trap Aura"],       30, 0,0,0, { gr=1, d={tn=BS["Clever Traps"], tb=0.15, tp=1}, xn=BS["Frost Trap"] })
	self:AddTimer(self.EVENT, BS["Immolation Trap Effect"],  15, 1,0,1, { gr=1, xn=BS["Immolation Trap"] })
	self:AddTimer(self.EVENT, BS["Improved Concussive Shot"], 3, 1,0,0, { cr="GREEN", xn=BS["Concussive Shot"] })
	self:AddTimer(self.EVENT, BS["Improved Wing Clip"],       5, 1,0,0, { cr="GREEN", xn=BS["Wing Clip"] } )
	self:AddTimer(self.EVENT, BS["Quick Shots"],             12, 0,1,1, { a=1, cr="GREEN" })

	--self:AddTimer(A.SKILL, C.COUNTERATTACK,            5, 0,1,0, { cr="YELLOW", rc=true })
	--self:AddTimer(A.SKILL, C.MONGOOSE_BITE,            5, 0,1,0, { cr="YELLOW", rc=true })
end

table.insert(Chronometer.dataSetup, Chronometer.HunterSetup)
