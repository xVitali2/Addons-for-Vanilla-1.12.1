--<< ====================================================================== >>--
-- Setup Timers                                                               --
--<< ====================================================================== >>--
local BS = AceLibrary("Babble-Spell-2.2")
local L = AceLibrary("AceLocale-2.2"):new("Chronometer")

function Chronometer:WarriorSetup()
	local _, eclass = UnitClass("player")
	if eclass ~= "WARRIOR" then return end

	self:AddTimer(self.SPELL, BS["Battle Shout"],       120, 0,1,0, { rc=true, d={tn=BS["Booming Voice"], tp=true, tb=10} })
	self:AddTimer(self.SPELL, BS["Berserker Rage"],      10, 0,1,1)
	self:AddTimer(self.SPELL, BS["Bloodrage"],           10, 0,1,1)
	self:AddTimer(self.SPELL, BS["Bloodthirst"],          0, 1,0,0, { ea={[BS["Bloodthirst"]]=1} }) 
	self:AddTimer(self.SPELL, BS["Challenging Shout"],    6, 0,0,0)
	self:AddTimer(self.SPELL, BS["Charge"],               0, 1,0,0, { ea={[BS["Charge Stun"]]=1} })
	self:AddTimer(self.SPELL, BS["Concussion Blow"],      5, 1,0,0)
	self:AddTimer(self.SPELL, BS["Death Wish"],          30, 0,0,1)
	self:AddTimer(self.SPELL, BS["Demoralizing Shout"],  30, 0,0,0, { rc=true, d={tn=BS["Booming Voice"], tp=true, tb=10} })
	self:AddTimer(self.SPELL, BS["Disarm"],              10, 1,0,0, { rc=true, d={tn=BS["Improved Disarm"], tb=1} })
	self:AddTimer(self.SPELL, BS["Hamstring"],           15, 1,0,0, { rc=true })
	self:AddTimer(self.SPELL, BS["Intercept"],            0, 1,0,0, { ea={[BS["Intercept Stun"]]=1} })
	self:AddTimer(self.SPELL, BS["Intimidating Shout"],   8, 0,0,0)
	self:AddTimer(self.SPELL, BS["Last Stand"],          20, 0,1,1)
	self:AddTimer(self.SPELL, BS["Mocking Blow"],         6, 1,0,0)
	self:AddTimer(self.SPELL, BS["Mortal Strike"],       10, 1,0,0)
	self:AddTimer(self.SPELL, BS["Piercing Howl"],        6, 0,0,0)
	self:AddTimer(self.SPELL, BS["Pummel"],               4, 1,0,0)
	self:AddTimer(self.SPELL, BS["Recklessness"],        15, 0,1,1)
	self:AddTimer(self.SPELL, BS["Rend"],                21, 1,0,0, { d={rt={9,12,15,18}} })
	self:AddTimer(self.SPELL, BS["Retaliation"],         15, 0,1,1)
	self:AddTimer(self.SPELL, BS["Revenge"],              0, 1,0,0, { ea={[BS["Revenge Stun"]]=2} })
	self:AddTimer(self.SPELL, BS["Shield Bash"],          6, 1,0,0, { ea={[BS["Shield Bash - Silenced"]]=1} })
	self:AddTimer(self.SPELL, BS["Shield Block"],         5, 0,1,1, { d={tn=BS["Improved Shield Block"], tt={0.5, 1, 2}} })
	self:AddTimer(self.SPELL, BS["Shield Wall"],         10, 0,1,1, { d={tn=BS["Improved Shield Wall"], tb=3, ts=2} })
	self:AddTimer(self.SPELL, BS["Sunder Armor"],        30, 1,0,0, { rc=true } )
	self:AddTimer(self.SPELL, BS["Sweeping Strikes"],    20, 0,1,1)
	self:AddTimer(self.SPELL, BS["Taunt"],                3, 1,0,0)
	self:AddTimer(self.SPELL, BS["Thunder Clap"],        10, 0,0,0, { rc=true, d={rs=4} })

	self:AddTimer(self.EVENT, BS["Blood Craze"],          6, 0,1,1, { a=1, cr="GREEN" })
	self:AddTimer(self.EVENT, BS["Bloodthirst"],          8, 0,1,1)
	self:AddTimer(self.EVENT, BS["Charge Stun"],          1, 1,0,0) --, { xn=BS["Charge"] })
	self:AddTimer(self.EVENT, BS["Deep Wounds"],         12, 1,0,0, { a=1, cr="GREEN" })
	self:AddTimer(self.EVENT, BS["Enrage"],              12, 0,1,1, { a=1, cr="GREEN" })
	self:AddTimer(self.EVENT, BS["Improved Hamstring"],   5, 1,0,0, { cr="GREEN" })
	self:AddTimer(self.EVENT, BS["Intercept Stun"],       3, 1,0,0) --, { xn=BS["Intercept"] })
	self:AddTimer(self.EVENT, BS["Mace Stun Effect"],     3, 1,0,0, { cr="GREEN", a=1, xn=BS["Mace Specialization"] })
	self:AddTimer(self.EVENT, BS["Revenge Stun"],         3, 1,0,0, { cr="GREEN", xn=BS["Revenge"] })
	self:AddTimer(self.EVENT, BS["Shield Bash - Silenced"], 3, 1,0,0, { cr="GREEN", xn=BS["Shield Bash"] })

	--self:AddTimer(A.SKILL, C.EXECUTE,              5, 0,1,1, { cr="YELLOW", rc=true }) -- Only usable on enemies that have 20% or less health.
	--self:AddTimer(A.SKILL, C.OVERPOWER,            5, 0,1,1, { cr="YELLOW", rc=true }) -- Only useable after the target dodges.
	--self:AddTimer(A.SKILL, C.REVENGE,              5, 0,1,1, { cr="YELLOW", rc=true }) -- Revenge must follow a block, dodge or parry.
end

table.insert(Chronometer.dataSetup, Chronometer.WarriorSetup)
