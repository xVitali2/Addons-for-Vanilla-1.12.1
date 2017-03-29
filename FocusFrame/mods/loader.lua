local Focus = getfenv(0).FocusData

local Loader = CreateFrame("Frame")
Loader.addons = {}

local function debug(str)
	if false then
		DEFAULT_CHAT_FRAME:AddMessage(str)
	end
end

--- Register callback to be ran when ADDON_LOADED event is fired for addonName
-- @tparam string addonName (case sensitive)
-- @tparam func callback
-- @tparam[opt=false] bool - True if addon is loaded on demand, and not instantly on login.
function Loader:Register(addonName, callback, onDemand)
	if type(addonName) ~= "string" or type(callback) ~= "function" then
		return error('Usage: Register("name", callbackFunc, false)')
	end

	self.addons[addonName] = {
		init = callback,
		onDemand = onDemand,
		loaded = false,
		hasRan = false
	}

	debug("registered " .. addonName)

	-- Trigger event ourselves if addon is already loaded
	if IsAddOnLoaded(addonName) then
		self:ADDON_LOADED(addonName)
	end
end

local EventHandler = function()
	if this[event] then
		return this[event](this, arg1)
	end
end

function Loader:FreeLoadedAddons()
	if not next(self.addons) then
		return debug("empty addon list")
	end

	for name, addon in pairs(self.addons) do
		if not addon.onDemand or (addon.hasRan and not addon.loaded) then
			self.addons[name] = nil
			debug("free " .. name)
		end
	end
end

function Loader:ADDON_LOADED(addonName)
	local addon = self.addons[addonName]
	if addon then
		local success = pcall(addon.init, Focus, addonName)
		addon.loaded = success
		addon.hasRan = true

		debug(addonName .. (success and "=1" or "=0"))
	end
end

function Loader:PLAYER_ENTERING_WORLD()
	self:FreeLoadedAddons()

	-- All registered addons loaded, run cleanup
	if not next(self.addons) then
		self:UnregisterEvent("ADDON_LOADED")
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self:SetScript("OnEvent", nil)

		for k, v in pairs(self) do
			self[k] = nil
		end

		debug("all free")
	end
end

Loader:RegisterEvent("ADDON_LOADED")
Loader:RegisterEvent("PLAYER_ENTERING_WORLD")
Loader:SetScript("OnEvent", EventHandler)
Loader:Hide()

-- add to global namespace
Focus_Loader = Loader
