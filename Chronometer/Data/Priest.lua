--<< ====================================================================== >>--
-- Setup Timers                                                               --
--<< ====================================================================== >>--
local BS = AceLibrary("Babble-Spell-2.2")

function Chronometer:PriestSetup()
	local _, eclass = UnitClass("player")
	if eclass ~= "PRIEST" then return end

	self:AddTimer(self.SPELL, BS["Abolish Disease"],    20, 1,1,1, { rc=true })
	self:AddTimer(self.SPELL, BS["Devouring Plague"],   24, 1,0,0, { rc=true })
	self:AddTimer(self.SPELL, BS["Elune's Grace"],      15, 0,1,1, { rc=true })
	self:AddTimer(self.SPELL, BS["Fade"],               10, 0,1,1, { rc=true })
	self:AddTimer(self.SPELL, BS["Feedback"],           15, 0,1,1, { rc=true })
	self:AddTimer(self.SPELL, BS["Hex of Weakness"],   120, 1,0,0, { rc=true })
	self:AddTimer(self.SPELL, BS["Holy Fire"],          10, 1,0,0, { rc=true })
	self:AddTimer(self.SPELL, BS["Mind Soothe"],        15, 1,0,0, { rc=true })
	self:AddTimer(self.SPELL, BS["Power Infusion"],     15, 1,1,0, { rc=true })
	self:AddTimer(self.SPELL, BS["Power Word: Shield"],  30, 1,1,1, { ea={[BS["Weakened Soul"]]=1} })
	self:AddTimer(self.SPELL, BS["Psychic Scream"],      8, 0,0,0)
	self:AddTimer(self.SPELL, BS["Renew"],              15, 1,1,1, { rc=true })
	self:AddTimer(self.SPELL, BS["Shackle Undead"],     30, 1,0,0, { rc=true, d={rs=10} })
	self:AddTimer(self.SPELL, BS["Shadow Word: Pain"],   18, 1,0,0, { rc=true, d={tn=BS["Improved Shadow Word: Pain"], tb=3} })
	self:AddTimer(self.SPELL, BS["Silence"],             5, 1,0,0)
	self:AddTimer(self.SPELL, BS["Starshards"],          6, 1,0,0)
	self:AddTimer(self.SPELL, BS["Touch of Weakness"],   120, 0,1,1, { rc=true })
	self:AddTimer(self.SPELL, BS["Vampiric Embrace"],    60, 1,0,0, { rc=true })
	self:AddTimer(self.SPELL, BS["Greater Heal"],        0, 1,0,0, { ea={[BS["Greater Heal"]]=1} })

	self:AddTimer(self.EVENT, BS["Blackout"],              3, 1,0,0, { a=1 })
	self:AddTimer(self.EVENT, BS["Blessed Recovery"],      6, 0,1,1, { a=1 })
	self:AddTimer(self.EVENT, BS["Inspiration"],          15, 1,1,0, { a=1, xn=BS["Shield Specialization"] })
	self:AddTimer(self.EVENT, BS["Shadow Vulnerability"], 15, 1,0,0, { a=1, xn=BS["Shadow Weaving"] })
	self:AddTimer(self.EVENT, BS["Spirit Tap"],           15, 0,1,1, { a=1 })
	self:AddTimer(self.EVENT, BS["Weakened Soul"],        15, 1,0,1 )
	self:AddTimer(self.EVENT, BS["Greater Heal"],              15, 1,1,1)
end

table.insert(Chronometer.dataSetup, Chronometer.PriestSetup)
