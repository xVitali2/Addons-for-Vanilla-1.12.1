--<< ====================================================================== >>--
-- Setup Timers                                                               --
--<< ====================================================================== >>--
local BS = AceLibrary("Babble-Spell-2.2")
local L = AceLibrary("AceLocale-2.2"):new("Chronometer")

function Chronometer:WarlockSetup()
	local _, eclass = UnitClass("player")
	if eclass ~= "WARLOCK" then return end

	self:AddGroup(1, true,  "MAGENTA")
	self:AddGroup(2, false, "MAROON")
	self:AddGroup(3, true,  "RED")

	self:AddTimer(self.SPELL, BS["Amplify Curse"],          30, 0,1,1)
	self:AddTimer(self.SPELL, BS["Banish"],                 20, 1,0,0, { gr=1, rc=true, d={rs=10} })
	self:AddTimer(self.SPELL, BS["Corruption"],             18, 1,0,0, { rc=true, d={rt={12,15}} })
	self:AddTimer(self.SPELL, BS["Curse of Agony"],         24, 1,0,0, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Curse of Doom"],          60, 1,0,0, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Curse of Exhaustion"],    12, 1,0,0, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Curse of Recklessness"], 120, 1,0,0, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Curse of Shadow"],       300, 1,0,0, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Curse of Tongues"],       30, 1,0,0, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Curse of Weakness"],     120, 1,0,0, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Curse of the Elements"], 300, 1,0,0, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Death Coil"],              3, 1,0,0)
	self:AddTimer(self.SPELL, BS["Fear"],                   10, 1,0,0, { gr=3, rc=true, d={rs=5} })
	self:AddTimer(self.SPELL, BS["Fel Domination"],         15, 0,1,1)
	self:AddTimer(self.SPELL, BS["Howl of Terror"],         10, 0,0,0, { d={rs=5} })
	self:AddTimer(self.SPELL, BS["Immolate"],               15, 1,0,0, { rc=true, mc=BS["Conflagrate"] })
	self:AddTimer(self.SPELL, BS["Shadow Bolt"],             0, 1,0,0, { ea={[BS["Shadow Vulnerability"]]=2} })
	self:AddTimer(self.SPELL, BS["Shadow Ward"],            30, 0,1,1)
	self:AddTimer(self.SPELL, BS["Shadowburn"],              5, 1,0,0)
	self:AddTimer(self.SPELL, BS["Siphon Life"],            30, 1,0,0, { rc=true })

	self:AddTimer(self.EVENT, BS["Aftermath"],               5, 0,1,1, { cr="GREEN", a=1 })
	self:AddTimer(self.EVENT, BS["Enslave Demon"],         300, 1,0,0, { cr="BLUE", a=1 })
	self:AddTimer(self.EVENT, BS["Pyroclasm"],               3, 0,1,1, { cr="GREEN", a=1 })
	self:AddTimer(self.EVENT, BS["Sacrifice"],              30, 0,1,1, { cr="GREEN", a=1 })
	self:AddTimer(self.EVENT, BS["Seduction"],              15, 1,0,1, { cr="RED" })
	self:AddTimer(self.EVENT, BS["Shadow Vulnerability"],   12, 1,0,0, { cr="GREEN", xn=BS["Shadow Bolt"] })
	self:AddTimer(self.EVENT, BS["Shadow Trance"],          10, 0,1,1, { cr="GREEN", a=1, xn=BS["Nightfall"] })
	self:AddTimer(self.EVENT, BS["Soul Siphon"],            10, 0,1,1, { cr="GREEN", a=1, xn=BS["Drain Soul"] })
end

table.insert(Chronometer.dataSetup, Chronometer.WarlockSetup)
