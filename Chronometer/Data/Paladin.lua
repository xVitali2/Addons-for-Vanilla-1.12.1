--<< ====================================================================== >>--
-- Setup Timers                                                               --
--<< ====================================================================== >>--
local BS = AceLibrary("Babble-Spell-2.2")

function Chronometer:PaladinSetup()
	local _, eclass = UnitClass("player")
	if eclass ~= "PALADIN" then return end

	self:AddGroup(1, false, "CYAN")
	self:AddGroup(2, true,  "NAVY")
	self:AddGroup(3, true,  "MAGENTA")

	self:AddTimer(self.SPELL, BS["Blessing of Freedom"],    10, 1,1,1, { gr=1, d={tn=BS["Guardian's Favor"], tb=3} })
	self:AddTimer(self.SPELL, BS["Blessing of Kings"],     300, 1,1,1, { gr=1, rc=true })
	self:AddTimer(self.SPELL, BS["Blessing of Light"],     300, 1,1,1, { gr=1, rc=true })
	self:AddTimer(self.SPELL, BS["Blessing of Might"],     300, 1,1,1, { gr=1, rc=true })
	self:AddTimer(self.SPELL, BS["Blessing of Protection"],  6, 1,1,1, { gr=1, d={rs=2}, ea={[BS["Forbearance"]]=1} })
	self:AddTimer(self.SPELL, BS["Blessing of Sacrifice"],  30, 1,1,1, { gr=1, rc=true })
	self:AddTimer(self.SPELL, BS["Blessing of Salvation"], 300, 1,1,1, { gr=1, rc=true })
	self:AddTimer(self.SPELL, BS["Blessing of Sanctuary"], 300, 1,1,1, { gr=1, rc=true })
	self:AddTimer(self.SPELL, BS["Blessing of Wisdom"],    300, 1,1,1, { gr=1, rc=true })
	self:AddTimer(self.SPELL, BS["Consecration"],            8, 0,0,0)
	self:AddTimer(self.SPELL, BS["Divine Protection"],       6, 0,1,1, { cr="BLUE", d={rs=2}, ea={[BS["Forbearance"]]=1} })
	self:AddTimer(self.SPELL, BS["Divine Shield"],          10, 0,1,1, { cr="BLUE", d={rs=2}, ea={[BS["Forbearance"]]=1} })
	self:AddTimer(self.SPELL, BS["Hammer of Justice"],       6, 1,0,0)
	self:AddTimer(self.SPELL, BS["Holy Shield"],            10, 1,0,0)
	self:AddTimer(self.SPELL, BS["Judgement"],               0, 1,0,0, { gr=2, ea={[BS["Judgement of Justice"]]=1, [BS["Judgement of Light"]]=1, [BS["Judgement of Wisdom"]]=1, [BS["Judgement of the Crusader"]]=1} })
	self:AddTimer(self.SPELL, BS["Lay on Hands"],            0, 1,1,1, { ea={[BS["Lay on Hands"]]=2} })
	self:AddTimer(self.SPELL, BS["Repentance"],              6, 1,0,0)
	self:AddTimer(self.SPELL, BS["Seal of Command"],        30, 0,1,1, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Seal of Justice"],        30, 0,1,1, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Seal of Light"],          30, 0,1,1, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Seal of Righteousness"],  30, 0,1,1, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Seal of the Crusader"],   30, 0,1,1, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Seal of Wisdom"],         30, 0,1,1, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Turn Undead"],            10, 1,0,0, { gr=3, d={rs=5} })

	self:AddTimer(self.EVENT, BS["Forbearance"],               60, 1,0,1 )
	self:AddTimer(self.EVENT, BS["Judgement of Justice"],      10, 1,0,0, { cr="RED", xn=BS["Seal of Justice"], rom=true })
	self:AddTimer(self.EVENT, BS["Judgement of Light"],        10, 1,0,0, { cr="RED", xn=BS["Seal of Light"],  d={tn=BS["Lasting Judgement"], tb=10}, rom=true })
	self:AddTimer(self.EVENT, BS["Judgement of Wisdom"],       10, 1,0,0, { cr="RED", xn=BS["Seal of Wisdom"], d={tn=BS["Lasting Judgement"], tb=10}, rom=true })
	self:AddTimer(self.EVENT, BS["Judgement of the Crusader"], 10, 1,0,0, { cr="RED", xn=BS["Seal of the Crusader"], rom=true })
	self:AddTimer(self.EVENT, BS["Lay on Hands"],             120, 1,1,1, { cr="BLUE" })
	self:AddTimer(self.EVENT, BS["Redoubt"],                   10, 0,1,1, { cr="GREEN", a=1 })
	self:AddTimer(self.EVENT, BS["Vengeance"],                  8, 0,1,1, { cr="GREEN", a=1 })
	self:AddTimer(self.EVENT, BS["Vindication"],                8, 1,0,0, { cr="RED",  a=1 })

	-- self:AddTimer(A.SKILL, C.HAMMER_OF_WRATH,            5, 0,1,1, { cr="YELLOW" })
end

table.insert(Chronometer.dataSetup, Chronometer.PaladinSetup)