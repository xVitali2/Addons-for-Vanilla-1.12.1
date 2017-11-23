--[[
Backport from later versions by Dorann
https://github.com/xorann/BigWigs

This is a small plugin to show which raid members are in close range. This is useful for encounters like C'Thun.
Boss modules can override the following properties:
module.proximityCheck = function(unit) return CheckInteractDistance(unit, 3) end
module.proximitySilent = true

module.proximityCheck defines the function to use for the range check. The CheckInteractDistance function has four possible input values for different ranges: 1=10(?) yards; 2=11.11 yards; 3=9.9 yards; 4=28 yards
module.proximitySilent allows you to configure whether a warning sound should be played, whenever a raid member is too close
--]]


assert( BigWigs, "BigWigs not found!")

-----------------------------------------------------------------------
--      Are you local?
-----------------------------------------------------------------------

local L = AceLibrary("AceLocale-2.2"):new("BigWigsProximity")

local active = false
local activeModule = nil -- The module we're currently tracking proximity for.
local anchor = nil
local lastplayed = 0 -- When we last played an alarm sound for proximity.
local tooClose = {} -- List of players who are too close.
local hasDebuff = {} -- List of players who have the debuff.
local debuffTexture = nil

local OnOptionToggled = nil -- Function invoked when the proximity option is toggled on a module.

local hexColors = {}

-- Function decToHex (renamed, updated): http://lua-users.org/lists/lua-l/2004-09/msg00054.html
local function decToHex(IN)
	local B,K,OUT,I,D=16,"0123456789ABCDEF","",0
	while IN>0 do
		I=I+1
		IN,D=math.floor(IN/B),math.mod(IN,B)+1
		OUT=string.sub(K,D,D)..OUT
	end
	return OUT
end
-- Function rgbToHex: http://gameon365.net/index.php
local function rgbToHex(r,g,b)
	local output = decToHex(r) .. decToHex(g) .. decToHex(b);
	return output
end

for k, v in pairs(RAID_CLASS_COLORS) do
	--hexColors[k] = "|cff" .. rgbToHex(v.r * 256, v.g * 256, v.b * 256)
	hexColors[k] = string.format("|cff%02x%02x%02x ", v.r * 255, v.g * 255, v.b * 255)
	--BigWigs:Print(hexColors[k] .. k .. " " .. v.r .. " " .. v.g .. " " .. v.b)
	--hexColors[k] = ("|cff%02x%02x%02x"):format(v.r * 255, v.g * 255, v.b * 255)
end

-- Helper table to cache colored player names.
local coloredNames = setmetatable({}, {__index =
	function(self, unit)
		if type(unit) == "nil" then return nil end
		local _, class = UnitClass(unit)
		local name, _ = UnitName(unit)
		if class then
			self[name] = hexColors[class] .. name .. "|r"
			return self[name]
		else
			return name
		end
	end
})

-----------------------------------------------------------------------
--      Localization
-----------------------------------------------------------------------

L:RegisterTranslations("enUS", function() return {
	["Proximity"] = true,
	["Close Players"] = true,
	["Options for the Proximity Display."] = true,
	["|cff777777Nobody|r"] = true,
	["Lock frame"] = true,
	["Lock the proximity frame."] = true,
	["Sound"] = true,
	["Play sound on proximity."] = true,
	["Disabled"] = true,
	["Disable the proximity display for all modules that use it."] = true,
	["The proximity display has been disabled for %s, please use the boss modules options to enable it again."] = true,

	["Has Debuff"] = true,

	proximity = "Proximity display",
	proximity_desc = "Show the proximity window when appropriate for this encounter, listing players who are standing too close to you.",

	font = "Fonts\\FRIZQT__.TTF",

	["Test"] = true,
	["Perform a Proximity test."] = true,

	["Reset position"] = true,
	["Reset the anchor position, moving it to the center of your screen."] = true,
} end)

L:RegisterTranslations("esES", function() return {
	["Proximity"] = "Proximidad",
	["Close Players"] = "Jugadores cerca",
	["Options for the Proximity Display."] = "Opciones para la Muestra de Proximidad",
	["|cff777777Nobody|r"] = "|cff777777Nadie|r",
	["Lock frame"] = "Bloquear marco",
	["Lock the proximity frame."] = "Bloquea el marco de proximidad",
	["Sound"] = "Sonido",
	["Play sound on proximity."] = "Reproduce sonido en proximidad",
	["Disabled"] = "Desactivado",
	["Disable the proximity display for all modules that use it."] = "Desactiva la muestra de proximidad para todos los módulos que lo usan",
	["The proximity display has been disabled for %s, please use the boss modules options to enable it again."] = "La muestra de proximidad se ha desactivado para %s, por favor usa las opciones de módulos de jefes para activarlo de nuevo",

	["Has Debuff"] = "Tiene Debuff",

	proximity = "Proximity display",
	proximity_desc = "Muestra la ventana de proximidad cuando sea apropriado para la pelea y enumera los jugadores que están demasiado cerano a ti.",

	font = "Fonts\\FRIZQT__.TTF",

	["Test"] = "Probar",
	["Perform a Proximity test."] = "Haz una prueba de Proximidad",

	["Reset position"] = "Restablecer posición",
	["Reset the anchor position, moving it to the center of your screen."] = "Restablece la posición de la ancla y muévela al centro de la pantalla",
} end)

L:RegisterTranslations("deDE", function() return {
	["Proximity"] = "Nähe",
	["Close Players"] = "Zu nahe Spieler",
	["Options for the Proximity Display."] = "Optionen für die Nähe Anzeige.",
	["|cff777777Nobody|r"] = "|cff777777Niemand|r",
	["Sound"] = "Sound",
	["Play sound on proximity."] = "Spielt einen Sound bei Nähe ab.",
	["Disabled"] = "Deaktivieren",
	["Disable the proximity display for all modules that use it."] = "Deaktiviert die Nähe Anzeige für alle Module die sie benutzen.",
	["The proximity display has been disabled for %s, please use the boss modules options to enable it again."] = "Die Nähe Anzeige wurde deaktiviert für %s, bitte benutze die Boss Modul Optionen um sie wieder zu aktivieren.",

	proximity = "Nähe Anzeige",
	proximity_desc = "Zeigt das Nähe Fenster wenn benötigt passsend zu diesem Encounter an, auflistend die Spieler die dir zu Nahe stehn.",

	font = "Fonts\\FRIZQT__.TTF",

	["Test"] = "Test",
	["Perform a Proximity test."] = "Führe einen Nähe Test durch.",

	["Reset position"] = "Position zurücksetzen",
	["Reset the anchor position, moving it to the center of your screen."] = "Die Verankerungsposition zurücksetzen (bewegt das Fenster zur Ursprungsposition).",
} end)

-----------------------------------------------------------------------
--      Module Declaration
-----------------------------------------------------------------------

BigWigsProximity = BigWigs:NewModule("Proximity")
BigWigsProximity.revision = tonumber(string.sub("$Revision: 4744 $", 12, -3))
BigWigsProximity.defaultDB = {
	posx = nil,
	posy = nil,
	sound = true,
	disabled = nil,
	lock = false,
}
--BigWigsProximity.external = true

BigWigsProximity.consoleCmd = L["Proximity"]
BigWigsProximity.consoleOptions = {
	type = "group",
	name = L["Proximity"],
	desc = L["Options for the Proximity Display."],
	--[[handler = BigWigsProximity,
	pass = true,]]
	get = function(key)
		return BigWigsProximity.db.profile[key]
	end,
	set = function(key, value)
		BigWigsProximity.db.profile[key] = value
		if key == "disabled" then
			if value then
				BigWigsProximity:CloseProximity()
			else
				BigWigsProximity:OpenProximity()
			end
		end
	end,
	args = {
		lock = {
			type = "toggle",
			name = L["Lock frame"],
			desc = L["Lock the proximity frame."],
			order = 99,
			get = function()
				return BigWigsProximity.db.profile.lock
			end,
			set = function(v)
				BigWigsProximity.db.profile.lock = v
				if v then
					BigWigsProximity:Lock()
				else
					BigWigsProximity:Unlock()
				end
			end,
		},
		sound = {
			type = "toggle",
			name = L["Sound"],
			desc = L["Play sound on proximity."],
			order = 100,
			get = function() return BigWigsProximity.db.profile.sound end,
			set = function(v) BigWigsProximity.db.profile.sound = v end,
		},
		disabled = {
			type = "toggle",
			name = L["Disabled"],
			desc = L["Disable the proximity display for all modules that use it."],
			order = 101,
			get = function() return BigWigsProximity.db.profile.disabled end,
			set = function(v)
				BigWigsProximity.db.profile.disabled = v
				if BigWigsProximity.db.profile.disabled then
					BigWigsProximity:CloseAndDisableProximity()
				end
			end,
		},
		reset = {
			type = "execute",
			name = L["Reset position"],
			desc = L["Reset the anchor position, moving it to the center of your screen."],
			order = 102,
			func = function() BigWigsProximity:ResetAnchor() end,
		},
		spacer = {
			type = "header",
			name = " ",
			order = 103,
		},
		[L["Test"]] = {
			type = "execute",
			name = L["Test"],
			desc = L["Perform a Proximity test."],
			order = 104,
			handler = BigWigsProximity,
			func = "TestProximity",
		},
	}
}

-----------------------------------------------------------------------
--      Initialization
-----------------------------------------------------------------------

function BigWigsProximity:OnRegister()
--BigWigs:RegisterBossOption("proximity", L["proximity"], L["proximity_desc"], OnOptionToggled)
end

function BigWigsProximity:OnEnable()
	self:RegisterEvent("Ace2_AddonDisabled")
	self:RegisterEvent("BigWigs_ShowProximity")
	self:RegisterEvent("BigWigs_HideProximity")
	self:RegisterEvent("BigWigs_StartDebuffTrack")
	self:RegisterEvent("BigWigs_StopDebuffTrack")
end

function BigWigsProximity:OnDisable()
	self:CloseProximity()
end

-----------------------------------------------------------------------
--      Event Handlers
-----------------------------------------------------------------------
function BigWigsProximity:Lock()
	if anchor then
		anchor:EnableMouse(false)
		anchor:SetMovable(false)
	end
end

function BigWigsProximity:Unlock()
	if anchor then
		anchor:EnableMouse(true)
		anchor:SetMovable(true)
	end
end

function BigWigsProximity:BigWigs_ShowProximity(moduleName)
	--[[if active then
	error("The proximity module is already running for another boss module.")
	end]]
	if moduleName and BigWigs:HasModule(moduleName) then
		local module = BigWigs:GetModule(moduleName)
		self:OpenProximity(module)
	else
		self:OpenProximity()
	end
end

function BigWigsProximity:BigWigs_HideProximity()
	self:CloseProximity()
end

function BigWigsProximity:Ace2_AddonDisabled()
	self:BigWigs_HideProximity()
end

function BigWigsProximity:BigWigs_StartDebuffTrack(moduleName, debuff, title)
	if moduleName and debuff and BigWigs:HasModule(moduleName) then
		local module = BigWigs:GetModule(moduleName)
		self:StartDebuffTrack(module, debuff, title)
	end
end

function BigWigsProximity:BigWigs_StopDebuffTrack()
	self:StopDebuffTrack()
end

-----------------------------------------------------------------------
--      Util
-----------------------------------------------------------------------

function BigWigsProximity:CloseAndDisableProximity()
	self:CloseProximity()

	if activeModule then
		activeModule.db.profile.proximity = nil
		BigWigs:Print(string.format(L["The proximity display has been disabled for %s, please use the boss modules options to enable it again."], activeModule:ToString()))
	end
end

function BigWigsProximity:CloseProximity()
	active = false
	if anchor then anchor:Hide() end
	self:CancelScheduledEvent("bwproximityupdate")
end

function BigWigsProximity:OpenProximity(module)
	--if self.db.profile.disabled or not active or type(active.proximityCheck) ~= "function" or not active.db.profile.proximity then return end
	if self.db.profile.disabled then return end
	if module and not module.db.profile.proximity then return end

	active = true

	if module then
		activeModule = module
	end

	self:SetupFrames()

	for k in pairs(tooClose) do tooClose[k] = nil end
	anchor.text:SetText(L["|cff777777Nobody|r"])

	anchor.cheader:SetText(L["Close Players"])
	anchor:Show()
	if not self:IsEventScheduled("bwproximityupdate") then
		self:ScheduleRepeatingEvent("bwproximityupdate", self.UpdateProximity, .1, self)
	end
end

function BigWigsProximity:TestProximity()
	--[[self:SetupFrames()

	anchor.text:SetText(L["|cff777777Nobody|r"])
	anchor.cheader:SetText(L["Close Players"])
	anchor:Show()]]
	self:BigWigs_ShowProximity()
end

local function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end
local function proximityCheck(unit)
	return CheckInteractDistance(unit, 3)
end
function BigWigsProximity:UpdateProximity()
	--mod.proximityCheck = function( unit ) return CheckInteractDistance( unit, 3 ) end

	if not active then return end

	for k in pairs(tooClose) do tooClose[k] = nil end
	tooClose = {}

	local num = GetNumRaidMembers()
	local func = function(unit) return CheckInteractDistance(unit, 2) end -- 1=10(?) yards; 2=11.11 yards; 3=9.9 yards; 4=28 yards
	if activeModule and type(activeModule.proximityCheck) == "function" then
		func = activeModule.proximityCheck
	end

	for i = 1, num do
		local name = GetRaidRosterInfo(i)
		local unit = "raid"..i
		if UnitExists(unit) and not UnitIsDeadOrGhost(unit) and not UnitIsUnit(unit, "player") then
			--if CheckInteractDistance(unit, 2) then -- 1=28 yards; 2=11.11 yards; 3=9.9 yards
			if func(unit) then
				table.insert(tooClose, tostring(coloredNames[unit]))
			end
		end
		if tablelength(tooClose) > 4 then break end
	end

	if tablelength(tooClose) == 0 then
		anchor:SetBackdropBorderColor(0.0,1.0,0.0) --- green
		anchor.text:SetText(L["|cff777777Nobody|r"])
	else
		anchor:SetBackdropBorderColor(1.0,0.0,0.0) --- red
		local test = table.concat(tooClose, "\n");
		anchor.text:SetText(table.concat(tooClose, "\n"))
		--for k in pairs(tooClose) do tooClose[k] = nil end
		local t = time()
		if t > lastplayed + 1 then
			lastplayed = t
			if self.db.profile.sound and UnitAffectingCombat("player") then
				if activeModule then
					if not activeModule.proximitySilent then
						self:TriggerEvent("BigWigs_Sound", "Alarm")
					end
				else
					self:TriggerEvent("BigWigs_Sound", "Alarm")
				end
			end
		end
	end
end

------------------------------
--    Create the Anchor     --
------------------------------

function BigWigsProximity:SetupFrames()
	if anchor then return end

	local frame = CreateFrame("Frame", "BigWigsProximityAnchor", UIParent)
	frame:Hide()

	frame:SetWidth(200)
	frame:SetHeight(100)

	frame:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 16,
		edgeFile = "Interface\\AddOns\\BigWigs\\Textures\\otravi-semi-full-border", edgeSize = 32,
		--edgeFile = "", edgeSize = 32,
		insets = {left = 1, right = 1, top = 20, bottom = 1},
	})
	frame:SetBackdropBorderColor(1.0,1.0,1.0)
	frame:SetBackdropColor(24/255, 24/255, 24/255)
	frame:ClearAllPoints()
	frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	frame:EnableMouse(true)
	frame:SetClampedToScreen(true)
	frame:RegisterForDrag("LeftButton")
	frame:SetMovable(true)
	if self.db.profile.lock then
		frame:EnableMouse(false)
		frame:SetMovable(false)
	end
	frame:SetScript("OnDragStart", function() this:StartMoving() end)
	frame:SetScript("OnDragStop", function()
		this:StopMovingOrSizing()
		self:SavePosition()
	end)

	local cheader = frame:CreateFontString(nil, "OVERLAY")
	cheader:ClearAllPoints()
	cheader:SetWidth(190)
	cheader:SetHeight(15)
	cheader:SetPoint("TOP", frame, "TOP", 0, -14)
	cheader:SetFont(L["font"], 12)
	cheader:SetJustifyH("LEFT")
	cheader:SetText(L["Proximity"])
	cheader:SetShadowOffset(.8, -.8)
	cheader:SetShadowColor(0, 0, 0, 1)
	frame.cheader = cheader

	local text = frame:CreateFontString(nil, "OVERLAY")
	text:ClearAllPoints()
	text:SetWidth( 190 )
	text:SetHeight( 80 )
	text:SetPoint( "TOP", frame, "TOP", 0, -35 )
	text:SetJustifyH("CENTER")
	text:SetJustifyV("TOP")
	text:SetFont(L["font"], 12)
	frame.text = text

	local close = frame:CreateTexture(nil, "ARTWORK")
	close:SetTexture("Interface\\AddOns\\BigWigs\\Textures\\otravi-close")
	close:SetTexCoord(0, .625, 0, .9333)

	close:SetWidth(20)
	close:SetHeight(14)
	close:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -7, -15)

	local closebutton = CreateFrame("Button", nil)
	closebutton:SetParent( frame )
	closebutton:SetWidth(20)
	closebutton:SetHeight(14)
	closebutton:SetPoint("CENTER", close, "CENTER")
	closebutton:SetScript( "OnClick", function() self:CloseAndDisableProximity() end )

	anchor = frame

	local x = self.db.profile.posx
	local y = self.db.profile.posy
	if x and y then
		local s = anchor:GetEffectiveScale()
		anchor:ClearAllPoints()
		anchor:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / s, y / s)
	else
		self:ResetAnchor()
	end
end

function BigWigsProximity:ResetAnchor()
	if not anchor then self:SetupFrames() end
	anchor:ClearAllPoints()
	--anchor:SetPoint("CENTER", UIParent, "CENTER")
	anchor:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", 300, 500)
	self.db.profile.posx = nil
	self.db.profile.posy = nil
end

function BigWigsProximity:SavePosition()
	if not anchor then self:SetupFrames() end

	local s = anchor:GetEffectiveScale()
	self.db.profile.posx = anchor:GetLeft() * s
	self.db.profile.posy = anchor:GetTop() * s
end

function BigWigsProximity:StopDebuffTrack()
	debuffActive = false
	debuffTexture = nil
	if anchor then anchor:Hide() end
	self:CancelScheduledEvent("bwdebuffupdate")
end

function BigWigsProximity:StartDebuffTrack(module, debuff, title)
	if self.db.profile.disabled then return end
	if module and not module.db.profile.proximity then return end

	if module then
		activeModule = module
	end

	if not title then title = L["Has Debuff"] end

	active = false
	debuffActive = true
	debuffTexture = debuff
	self:CancelScheduledEvent("bwproximityupdate")

	self:SetupFrames()

	for k in pairs(hasDebuff) do hasDebuff[k] = nil end
	anchor.text:SetText(L["|cff777777Nobody|r"])

	anchor.cheader:SetText(title)
	anchor:SetBackdropBorderColor(1.0,1.0,1.0)
	anchor:Show()



	if not self:IsEventScheduled("bwdebuffupdate") then
		self:ScheduleRepeatingEvent("bwdebuffupdate", self.UpdateDebuff, .1, self)
	end
end

function BigWigsProximity:UpdateDebuff()
	--mod.proximityCheck = function( unit ) return CheckInteractDistance( unit, 3 ) end

	if not debuffActive then return end

	for k in pairs(hasDebuff) do hasDebuff[k] = nil end
	hasDebuff = {}

	local num = GetNumRaidMembers()

	for i = 1, num do
		local name = GetRaidRosterInfo(i)
		local unit = "raid"..i
		if UnitExists(unit) and not UnitIsDeadOrGhost(unit) and not UnitIsUnit(unit, "player") then
			for a=1,16 do
				local t,c = UnitDebuff(unit,a);
				if(t == nil) then break; end;
				if(t == debuffTexture)
				then
					table.insert(hasDebuff, tostring(coloredNames[unit]))
					break;
				end
			end
		end
		if tablelength(hasDebuff) > 4 then break end
	end

	if tablelength(hasDebuff) == 0 then
		anchor.text:SetText(L["|cff777777Nobody|r"])
	else
		local test = table.concat(hasDebuff, "\n");
		anchor.text:SetText(table.concat(hasDebuff, "\n"))
		local t = time()
	end
end
