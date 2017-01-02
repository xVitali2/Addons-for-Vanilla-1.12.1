--[[
Name: SEEA-2.0-Events-Only
Revision: $Rev: 15020 $
Author: Tekkub Stoutwrithe (tekkub@gmail.com)
Website: http://wiki.wowace.com/index.php/SpecialEvents_Addon
Documentation: http://wiki.wowace.com/index.php/SpecialEvents-Aura-2.0
SVN: svn://svn.wowace.com/root/trunk/SpecialEventsEmbed/SpecialEvents-Aura-2.0
Description: Special events for Aura's, (de)buffs gained, lost etc.
Dependencies: AceLibrary, AceEvent-2.0, Gratuity-2.0
]]


local vmajor, vminor = "SEEA-2.0-Events-Only", "$Revision: 15020 $"

if not AceLibrary then error(vmajor .. " requires AceLibrary.") end
if not AceLibrary:HasInstance("AceEvent-2.0") then error(vmajor .. " requires AceEvent-2.0.") end
if not AceLibrary:IsNewVersion(vmajor, vminor) then return end

local lib = {}
AceLibrary("AceEvent-2.0"):embed(lib)

local gratuity = AceLibrary("Gratuity-2.0")
local RL
local debuffTextureCache = {}

----------------------------
--      Compost Heap      --
----------------------------

local heap = {}
setmetatable(heap, {__mode = "kv"})


local function acquire(a1,a2,a3,a4,a5)
	local t = next(heap)
	if t then
		heap[t] = nil
		assert(not next(t), "A table in the compost heap has been modified!")
	end
	t = t or {}

	if a1 ~= nil then table.insert(t, a1) end
	if a2 ~= nil then table.insert(t, a2) end
	if a3 ~= nil then table.insert(t, a3) end
	if a4 ~= nil then table.insert(t, a4) end
	if a5 ~= nil then table.insert(t, a5) end
	return t
end


local function reclaim(t, d)
	if type(t) ~= "table" then return end

	if d and d > 0 then
		for i in pairs(t) do
			if type(t[i]) == "table" then reclaim(t[i], d - 1) end
		end
	end

	for i in pairs(t) do t[i] = nil end
	t.reset = 1
	t.reset = nil
	table.setn(t, 0) 

	heap[t] = true
end


----------------------------
--     Initialization     --
----------------------------

local function registerevents(self)
	self:RegisterEvent("PLAYER_LEAVING_WORLD")
	self:RegisterEvent("UNIT_AURA", "AuraScan")
	self:RegisterEvent("UNIT_AURASTATE", "AuraScan")
	self:RegisterEvent("PLAYER_AURAS_CHANGED")
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	self:RegisterEvent("PLAYER_REGEN_ENABLED")
	-- check if RosterLib exists. We need to do that here and not earlier.
	RL = AceLibrary("RosterLib-2.0")
	self:RegisterBucketEvent("RosterLib_UnitChanged",0.2)
end


-- Activate a new instance of this library
function activate(self, oldLib, oldDeactivate)
	if oldLib then
		self.vars = oldLib.vars
		if oldLib:IsEventRegistered("UNIT_AURA") then registerevents(self) end
		if oldlib:IsEventRegistered("RosterLib_UnitChanged") then
			oldLib:UnregisterAllEvents()
		end	
	else self.vars = {debuffs = {}} end

	self:RegisterEvent("PLAYER_ENTERING_WORLD")

	if oldDeactivate then oldDeactivate(oldLib) end
end


function lib:PLAYER_ENTERING_WORLD()
	self:ScanAllAuras()
	registerevents(self)
end

function lib:PLAYER_LEAVING_WORLD()
	self:UnregisterAllEvents()
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
end

--------------------------------
--      Tracking methods      --
--------------------------------

function lib:PLAYER_AURAS_CHANGED()
	self:AuraScan("player")
	if GetNumRaidMembers() > 0 then
		local u
		for i=1,GetNumRaidMembers() do
			if UnitIsUnit("raid"..i, "player") then u = "raid"..i end
		end
		self:AuraScan(u)
	end
end


function lib:PLAYER_TARGET_CHANGED()
	self:AuraScan("target")
end


function lib:RosterLib_UnitChanged(units)
	for unit in pairs(units) do
		if unit and UnitExists(unit) then
			self:AuraScan(unit)
		end
	end
end

function lib:PLAYER_REGEN_ENABLED()
	reclaim(debuffTextureCache)
	debuffTextureCache = acquire()
end

function lib:ScanAllAuras()
	if UnitExists("player") then self:AuraScan("player") end
	if UnitExists("pet") then self:AuraScan("pet") end

	for i=1,4 do
		if UnitExists("party"..i) then self:AuraScan("party"..i) end
		if UnitExists("partypet"..i) then self:AuraScan("partypet"..i) end
	end

	for i=1,40 do
		if UnitExists("raid"..i) then self:AuraScan("raid"..i) end
		if UnitExists("raidpet"..i) then self:AuraScan("raidpet"..i) end
	end

	if UnitExists("target") then self:AuraScan("target") end
end


function lib:AuraScan(targ)
	local maxdebuffs, t = 16, targ or arg1
	local oldd = self.vars.debuffs[t]
	local newd = acquire()

	if t == "player" then
		for i=0,(maxdebuffs-1) do
			local didx = GetPlayerBuff(i, "HARMFUL")
			if didx and didx ~= -1 then
				gratuity:SetPlayerBuff(didx)
				local txt, txtr = gratuity:GetLine(1)

				local apps = GetPlayerBuffApplications(didx)
				local texture = GetPlayerBuffTexture(didx)
				local dbtype = GetPlayerBuffDispelType(didx)

				if txt then
					local txtindex = txt
					if texture then txtindex = txtindex..texture end
					if not apps or apps == 0 then apps = 1 end
					if not dbtype then dbtype = "" end
					newd[txtindex] = acquire(i, txt, apps, dbtype, texture)
				end
			end
		end
	else
		for i=1,maxdebuffs do
			local txt
			local texture, apps, dbtype = UnitDebuff (t, i)
			if texture then
				if not debuffTextureCache[texture] then
					gratuity:SetUnitDebuff(t,i)
					txt = gratuity:GetLine(1)
					debuffTextureCache[texture] = txt
				else
					txt = debuffTextureCache[texture]
				end
				if txt then
					local txtindex = txt .. texture
					reclaim(newd[txtindex]) -- Sometimes we get the same debuff twice, SEAura doesn't distinguish multiples of the same debuff unless it stacks
					if not apps or apps == 0 then apps = 1 end
					if not dbtype then dbtype = "" end
					newd[txtindex] = acquire(i, txt, apps, dbtype, texture)
				end
			end
		end
	end

	self.vars.debuffs[t] = newd

	if oldd then
		for d,i in pairs(oldd) do
			if type(i) ~= "table" then
				local t = ""
				for d,i in pairs(oldd) do t = t.." "..d.."="..i end
				error(string.format("Debuff error! Unit: %s, Table dump:%s", targ, t))
			elseif not newd[d] then
				self:TriggerEvent("SEEAEO_UnitDebuffLost", t, i[2], i[3], i[4], i[5])
			end
		end
	end

	for d,i in pairs(newd) do
		assert(type(i) == "table", string.format("Debuff: %s - Value not a table: %s", d, type(i) == "table" and "table" or i or "nil"))

		local o2 = oldd and type(oldd[d]) == "table" and oldd[d][2]
		if not o2 or o2 ~= i[2] then
			self:TriggerEvent("SEEAEO_UnitDebuffGained", t, i[2], i[3], i[4], i[5])
		end
	end

	reclaim(oldd, 1)
end

--------------------------------
--      Load this bitch!      --
--------------------------------
AceLibrary:Register(lib, vmajor, vminor, activate)
