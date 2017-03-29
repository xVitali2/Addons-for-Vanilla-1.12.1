--[[
	Name: Surface-1.0
	Revision: $Revision: 16890 $
	Author: Haste/Otravi (troeks@gmail.com)
	Website: http://fuxsake.net/f15-SurfaceLib.html
	Documentation: http://fuxsake.net/t18-Documentation.html
	SVN: http://svn.wowace.com/wowace/trunk/SurfaceLib/Surface-1.0/
	Description: Shared handling of StatusBar textures between add ons.
	Dependencies: AceLibrary, AceEvent-2.0
]]

local vmajor, vminor = "Surface-1.0", "$Revision: 16890 $"

if not AceLibrary then error(vmajor .. " requires AceLibrary.") end
if not AceLibrary:IsNewVersion(vmajor, vminor) then return end
if not AceLibrary:HasInstance("AceEvent-2.0") then error(vmajor .. " requires AceEvent-2.0") end

local lib = {}

local function filename(a1)
	local _, _, filename = string.find(a1, "^.+\\(.+)$")
	local ext = string.sub(filename, -4)
	if(ext == ".tga" or ".blp") then filename = string.sub(filename, 1, string.len(filename)-4) end
	return string.lower(filename)
end

function lib:Register(n, t)
	self:argCheck(n, 2, "string")
	self:argCheck(t, 3, "string")
	
	if(self.vars[n]) then return end
	
	for _, v in pairs(self.vars) do
		if(filename(t) == filename(v)) then return end
	end	
	
	self.vars[n] = t
	
	self:TriggerEvent("Surface_Registered")
end

function lib:Fetch(n)
	self:argCheck(n, 2, "string")
	
	return (not self.global and  self.vars[n]) or (self.global and  self.vars[self.global]) or  self.vars.Blizzard
end

function lib:Iterate()
	return self.vars
end

local t
function lib:List()
	t = {}
	for k in pairs(self.vars) do
		table.insert(t, k)
	end
	return t
end

function lib:SetGlobal(n)	
	self.global = (self.vars[n] and n) or nil
	self:TriggerEvent("Surface_SetGlobal", self.global)
end

function lib:Usage()
	t = {}
	for k in pairs(self.vars) do
		table.insert(t, k)
	end
	return "{" .. table.concat(t, " || ") .. "}"
end

function lib:IsValid(a1)
	return (self.vars[a1] and true) or false
end

local function activate(self, oldLib, oldDeactivate)
	if(oldLib) then 
		self.vars = oldLib.vars
	else
		self.vars = {Blizzard = "Interface\\TargetingFrame\\UI-StatusBar"} 
	end
	if(oldDeactivate) then oldDeactivate(oldLib) end
end

local function external(self, major, instance)
	if major == "AceEvent-2.0" then
		AceEvent = instance
		AceEvent:embed(self)
	end
end

AceLibrary:Register(lib, vmajor, vminor, activate, nil, external)
lib = nil