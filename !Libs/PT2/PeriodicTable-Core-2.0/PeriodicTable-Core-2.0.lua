
--[[
Name: PeriodicTable-Core-2.0
Revision: $Rev: 15147 $
Author: Tekkub Stoutwrithe (tekkub@gmail.com)
Website: http://www.wowace.com/
Description: Optomized itemid database
Dependencies: AceLibrary
]]


local vmajor, vminor = "PeriodicTable-Core-2.0", "$Revision: 15147 $"

if not AceLibrary then error(vmajor .. " requires AceLibrary.") end
if not AceLibrary:IsNewVersion(vmajor, vminor) then return end

-- lua 5.1 check
if(not loadstring("return function(...) return ... end")  and true or false) then
	string.gmatch = string.gfind;
end

local lib = {}


-- Activate a new instance of this library
function activate(self, oldLib, oldDeactivate)
	if oldLib then
		self.vars, self.k = oldLib.vars, oldLib.k
	else
		self.vars, self.k = {numcustoms = 0}, {}
	end
	self.compost = AceLibrary:HasInstance("Compost-2.0") and AceLibrary("Compost-2.0")

	if oldDeactivate then oldDeactivate(oldLib) end
end


-----------------------------
--      Module Loadup      --
-----------------------------

function lib:AddModule(name, table)
	assert(name, "No module name passed")
	assert(table, "No module dataset passed")

	if self.k[name] and self.compost then self.compost:Reclaim(self.k[name]) end
	self.k[name] = table
	self.vars.cache = {}
end


--------------------------------
--      Internal Methods      --
--------------------------------

function lib:CacheSet(set)
	if not set then return end

	local rset = self:GetSet(set)
	if not rset or type(rset) ~= "string" then return end

	if not self.vars.cache then self.vars.cache = {} end
	if not self.vars.cache[set] then
		self.vars.cache[set] = {}
		for word in string.gmatch(rset, "%S+") do
			local _, _, id, val = string.find(word, "(%d+):(%d+)")
			id, val = tonumber(id) or tonumber(word), tonumber(val) or 0
			self.vars.cache[set][id] = val
		end
	end

	return true
end


function lib:GetID(item)
	if type(item) == "number" then return item
	elseif type(item) == "string" then
		local _, _, id = string.find(item, "item:(%d+):%d+:%d+:%d+")
		if id then return tonumber(id) end
	end
end


function lib:GetSet(set)
	if not set then return end
	for i,vals in pairs(self.k) do if vals[set] then return vals[set] end end
end


function lib:GetSetModule(set)
	if not set then return end
	for i,vals in pairs(self.k) do if vals[set] then return i end end
end


function lib:GetSetString(set)
	if type(set) == "string" then
		return
	elseif type(set) == "table" then
		local retval
		for i,val in pairs(set) do
			if type(i) == "number" then
				local valstr = (val > 0) and string.format("%s:%s", i, val) or tostring(i)
				retval = retval and string.format("%s %s", retval, valstr) or valstr
			end
		end

		return retval
	end
end


---------------------------
--      API Methods      --
---------------------------

function lib:ItemInSet(item, set)
	local item = self:GetID(item)
	if not item then return end

	if type(set) == "string" then
		local rset = self:GetSet(set)
		if rset and type(rset) == "string" then
			local t = self:GetSetTable(set)
			if t and t[item] then return t[item], set, set end
		elseif type(rset) == "table" then
			for _,s in rset do
				local retval, _, atom = self:ItemInSet(item, s)
				if retval then return retval, s, atom end
			end
		end
	elseif type(set) == "table" then
		for i,s in pairs(set) do
			local retval, _, atom = self:ItemInSet(item, s)
			if retval then return retval, s, atom end
		end
	end
end


function lib:ItemInSets(item, sets)
	local item = self:GetID(item)
	if not item then return end

	if type(sets) == "string" then
		local rset = self:GetSet(sets)
		if type(rset) == "string" then
			local inset = self:ItemInSet(item, sets)
			if inset then return self.compost and self.compost:Acquire(sets) or {sets} end
		elseif type(rset) == "table" then
			return self:ItemInSets(item, rset)
		end
	elseif type(sets) == "table" then
		local founds

		for i,s in pairs(sets) do
			if self:ItemInSet(item, s) then
				if not founds then founds = self.compost and self.compost:Acquire() or {} end
				table.insert(founds, s)
			end
		end

		return founds
	end
end


local iterbag, iterslot, iterset, iterself
local function iter()
	if iterslot > GetContainerNumSlots(iterbag) then iterbag, iterslot = iterbag + 1, 1 end
	if iterbag > 4 then return end

	for b=iterbag,4 do
		for s=iterslot,GetContainerNumSlots(b) do
			iterslot = s + 1

			local link = GetContainerItemLink(b,s)
			local val = link and iterself:ItemInSet(link, iterset)
			if val then return b, s, val end
		end

		iterbag, iterslot = b+1, 1
	end
end


function lib:BagIter(set)
	if not set then return end

	iterself, iterbag, iterslot, iterset = self, 0, 1, set
	return iter
end


local defaultcomparefunc = function(abag, aslot, aval, bbag, bslot, bval) return aval > bval end
local defaultvalidatefunc = function(bag, slot, val) return true end
function lib:GetBest(set, comparefunc, validatefunc)
	comparefunc = comparefunc or defaultcomparefunc
	validatefunc = validatefunc or defaultvalidatefunc
	local ibag, islot, ival

	for bag,slot,val in self:BagIter(set) do
		if validatefunc(bag,slot,val) and (not ival or comparefunc(bag, slot, val, ibag, islot, ival)) then
				ibag, islot, ival = bag, slot, val
		end
	end
	return ibag, islot, ival
end


function lib:GetSetTable(set)
	if self:CacheSet(set) then return self.vars.cache[set] end
end


function lib:RegisterCustomSet(setcode, name)
	local setname = name or "customset"..self.vars.numcustoms
	if not setcode then return end
	if self:GetSetModule(setname) then return end

	self.k.customsets = self.k.customsets or {}
	self.k.customsets[setname] = setcode
	if not name then self.vars.numcustoms = self.vars.numcustoms + 1 end
	return setname
end


--------------------------------
--      Load this bitch!      --
--------------------------------
AceLibrary:Register(lib, vmajor, vminor, activate)
