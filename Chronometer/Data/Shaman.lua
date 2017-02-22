--<< ====================================================================== >>--
-- Setup Timers                                                               --
--<< ====================================================================== >>--
local BS = AceLibrary("Babble-Spell-2.2")
local L = AceLibrary("AceLocale-2.2"):new("Chronometer")

function Chronometer:ShamanSetup()
	local _, eclass = UnitClass("player")
	if eclass ~= "SHAMAN" then return end

	self:AddGroup(1, false, "FOREST")
	self:AddGroup(2, false, "MAROON")
	self:AddGroup(3, false, "CYAN")
	self:AddGroup(4, false, "NAVY")

	self:AddTimer(self.SPELL, BS["Earthbind Totem"],         45, 0,1,0, { gr=1, rc=true })
	self:AddTimer(self.SPELL, BS["Stoneclaw Totem"],         15, 0,1,0, { gr=1, rc=true, h={rt={50,150,220,280,390,480} }})
	self:AddTimer(self.SPELL, BS["Stoneskin Totem"],         120, 0,1,0, { gr=1, rc=true, d={rt={45}} })
	self:AddTimer(self.SPELL, BS["Strength of Earth Totem"], 120, 0,1,0, { gr=1, rc=true })
	self:AddTimer(self.SPELL, BS["Tremor Totem"],            120, 0,1,0, { gr=1, rc=true })

	self:AddTimer(self.SPELL, BS["Fire Nova Totem"],          5, 0,1,0, { gr=2, rc=true, d={tn=L["Improved Fire Totems"], tb=-1}})
	self:AddTimer(self.SPELL, BS["Flametongue Totem"],       120, 0,1,0, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Frost Resistance Totem"],  120, 0,1,0, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Magma Totem"],             20, 0,1,0, { gr=2, rc=true })
	self:AddTimer(self.SPELL, BS["Searing Totem"],           30, 0,1,0, { gr=2, rc=true, d={rs=5} })

	self:AddTimer(self.SPELL, BS["Grace of Air Totem"],      120, 0,1,0, { gr=3, rc=true })
	self:AddTimer(self.SPELL, BS["Grounding Totem"],         45, 0,1,0, { gr=3, rc=true })
	self:AddTimer(self.SPELL, BS["Nature Resistance Totem"], 120, 0,1,0, { gr=3, rc=true })
	self:AddTimer(self.SPELL, BS["Sentry Totem"],           300, 0,1,0, { gr=3, rc=true })
	self:AddTimer(self.SPELL, BS["Tranquil Air Totem"],      120, 0,1,0, { gr=3, rc=true })
	self:AddTimer(self.SPELL, BS["Windfury Totem"],          120, 0,1,0, { gr=3, rc=true })
	self:AddTimer(self.SPELL, BS["Windwall Totem"],          120, 0,1,0, { gr=3, rc=true })

	self:AddTimer(self.SPELL, BS["Disease Cleansing Totem"], 120, 0,1,0, { gr=4, rc=true })
	self:AddTimer(self.SPELL, BS["Enamored Water Spirit"],   24, 0,1,0, { gr=4, rc=true })
	self:AddTimer(self.SPELL, BS["Fire Resistance Totem"],   120, 0,1,0, { gr=4, rc=true })
	self:AddTimer(self.SPELL, BS["Healing Stream Totem"],    60, 0,1,0, { gr=4, rc=true })
	self:AddTimer(self.SPELL, BS["Mana Spring Totem"],       60, 0,1,0, { gr=4, rc=true })
	self:AddTimer(self.SPELL, BS["Mana Tide Totem"],         12, 0,1,0, { gr=4, rc=true })
	self:AddTimer(self.SPELL, BS["Poison Cleansing Totem"],  120, 0,1,0, { gr=4, rc=true })

	self:AddTimer(self.SPELL, BS["Earth Shock"],  2, 1,0,0)
	self:AddTimer(self.SPELL, BS["Flame Shock"], 12, 1,0,0, { rc=true})
	self:AddTimer(self.SPELL, BS["Frost Shock"],  8, 1,0,0, { rc=true})
	self:AddTimer(self.SPELL, BS["Stormstrike"], 12, 0,1,1)

	self:AddTimer(self.SPELL, BS["Healing Wave"],        0, 1,1,0, { ea={[BS["Ancestral Fortitude"]]=1, [BS["Healing Way"]]=1} })
	self:AddTimer(self.SPELL, BS["Lesser Healing Wave"], 0, 1,1,0, { ea={[BS["Ancestral Fortitude"]]=1} })

	self:AddTimer(self.EVENT, BS["Ancestral Fortitude"],  15, 1,1,0, { cr="GREEN", a=1 })
	self:AddTimer(self.EVENT, BS["Clearcasting"],        15, 0,1,1, { cr="GREEN", a=1 })
	self:AddTimer(self.EVENT, BS["Healing Way"],         15, 1,1,0, { cr="GREEN" })
end

table.insert(Chronometer.dataSetup, Chronometer.ShamanSetup)
