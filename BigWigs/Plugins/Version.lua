assert(BigWigs, "BigWigs not found!")

local BWL = nil
local BZ = AceLibrary("Babble-Zone-2.2")
local L = AceLibrary("AceLocale-2.2"):new("BigWigsVersionQuery")
local tablet = AceLibrary("Tablet-2.0")
local dewdrop = AceLibrary("Dewdrop-2.0")

local COLOR_GREEN = "00ff00"
local COLOR_RED = "ff0000"
local COLOR_WHITE = "ffffff"

local isInitialQuery = true

---------------------------------
--      Localization           --
---------------------------------

L:RegisterTranslations("enUS", function() return {
	["versionquery"] = true,
	["Version Query"] = true,
	["Commands for querying the raid for Big Wigs versions."] = true,
	["Query already running, please wait 5 seconds before trying again."] = true,
	["Querying versions for "] = true,
	["Big Wigs Version Query"] = true,
	["Close window"] = true, -- I know, it's really a Tablet.
	["Showing version for "] = true,
	["Green versions are newer than yours, red are older, and white are the same."] = true,
	["Player"] = true,
	["Version"] = true,
	["Current zone"] = true,
	["<zone>"] = true,
	["Version query done."] = true,
	["Runs a version query on your current zone."] = true,
	["Closes the version query window."] = true,
	["current"] = true,
	["Runs a version query on the given zone."] = true,
	["Zone"] = true,
	["zone"] = true,
	["N/A"] = true,
	["BigWigs"] = true,
	["Runs a version query on the BigWigs core."] = true,
	["Nr Replies"] = true,
	["Ancient"] = true,

	["Your version of Big Wigs Elysium is out of date!\nPlease visit https://github.com/Hosq/BigWigs to get the latest version."] = true,
	["Close"] = true,
	["Cancel"] = true,

	["People with outdated BigWigs:"] = true,
	["Notify old versions"] = true,
	["Notify old versions"] = true,
	["List people with old versions to raid chat."] = true,
	["Download newest version from https://github.com/Hosq/BigWigs"] = true,

	["Show popup"] = true,
	["Show popup warning on out of date version"] = true,

} end )

L:RegisterTranslations("esES", function() return {
	--["versionquery"] = true,
	["Version Query"] = "Consulta de Versión",
	["Commands for querying the raid for Big Wigs versions."] = "Comando para consultar la versión de Big Wigs de la banda.",
	["Query already running, please wait 5 seconds before trying again."] = "Ya está consultando, por favor espera 5 segundos antes de probarlo de nuevo.",
	["Querying versions for "] = "Consultando las versiones para ",
	["Big Wigs Version Query"] = "Consulta de Versión de Big Wigs",
	["Close window"] = "Cerrar ventana", -- I know, it's really a Tablet.
	["Showing version for "] = "Mostrando la versión para ",
	["Green versions are newer than yours, red are older, and white are the same."] = "Verde es una versión más nueva que la tuya, si es roja es más antigua, y si es blanca es la última actualizada hasta el momento",
	["Player"] = "Jugador",
	["Version"] = "Versión",
	["Current zone"] = "Zona actual",
	["<zone>"] = "<zona>",
	["Version query done."] = "Consulta de versión completa",
	["Runs a version query on your current zone."] = "Hace una consulta de versión para tu zona actual",
	["Closes the version query window."] = "Cerra la ventana de consulta de versión",
	["current"] = "actual",
	["Runs a version query on the given zone."] = "Hace una consulta de versión en la zona dada",
	["Zone"] = "Zona",
	--["zone"] = true,
	["N/A"] = "N/A",
	["BigWigs"] = "BigWigs",
	["Runs a version query on the BigWigs core."] = "Hace una consulta de versión al núcleo de BigWigs",
	["Nr Replies"] = "Nr repuesta",
	["Ancient"] = "Anciano",

	["Your version of Big Wigs Elysium is out of date!\nPlease visit https://github.com/Hosq/BigWigs to get the latest version."] = "¡Tu versión de Big Wigs es anticuada!\n Por favor visite https://github.com/Hosq/BigWigs para descargar la última versión.",
	["Close"] = "Cerrar",
	["Cancel"] = "Cancelar",

	["People with outdated BigWigs:"] = "Personas con BigWigs anticuado:",
	["Notify old versions"] = "Notificar de versiones anticuadas",
	["List people with old versions to raid chat."] = "Enumera las personas con versiones anticuadas al chat de la banda",
	["Download newest version from https://github.com/Hosq/BigWigs"] = "Descarga la última versión en https://github.com/Hosq/BigWigs",

	["Show popup"] = "Mostrar Ventana Emergente",
	["Show popup warning on out of date version"] = "Muesta la ventana emergente para versiones anticuadas",

} end )

L:RegisterTranslations("deDE", function() return {
	["versionquery"] = "Versionsabfrage",
	["Version Query"] = "Versionsabfrage",
	["Commands for querying the raid for Big Wigs versions."] = "Kommandos um den Schlachtzug nach verwendeten BigWigs Versionen abzufragen.",
	["Query already running, please wait 5 seconds before trying again."] = "Abfrage l\195\164uft bereits, bitte 5 Sekunden warten bis zum n\195\164chsten Versuch.",
	["Querying versions for "] = "Frage Versionen ab f\195\188r ",
	["Big Wigs Version Query"] = "BigWigs Versionsabfrage",
	["Close window"] = "Schlie\195\159e Fenster", -- I know, it's really a Tablet.
	["Showing version for "] = "Zeige Version f\195\188r ",
	["Green versions are newer than yours, red are older, and white are the same."] = "Gr\195\188ne Versionen sind neuer, rote sind \195\164lter, wei\195\159e sind gleich.",
	["Player"] = "Spieler",
	["Version"] = "Version",
	["Current zone"] = "Momentane Zone",
	["<zone>"] = "<zone>",
	["Version query done."] = "Versionsabfrage beendet.",
	["Runs a version query on your current zone."] = "Versionsabfrage f\195\188r die momentane Zone starten.",
	["Closes the version query window."] = "Schlie\195\159t das Versionsabfrage-Fenster.",
	["current"] = "gegenw\195\164rtig",
	["Runs a version query on the given zone."] = "Versionsabfrage in f\195\188r eine gegebene Zone starten.",
	["Zone"] = "Zone",
	["zone"] = "Zone",
	["N/A"] = "N/A",
	["BigWigs"] = "BigWigs",
	["Runs a version query on the BigWigs core."] = "Versionsabfrage f\195\188r die BigWigs Kernkomponente starten.",
	["Nr Replies"] = "Anzahl der Antworten",
	["Ancient"] = "Alt",

	["Your version of Big Wigs Elysium is out of date!\nPlease visit https://github.com/Hosq/BigWigs to get the latest version."] = "Deine Version von Big Wigs Elysium ist veraltet! Bitte downloade die neuste Version von https://github.com/Hosq/BigWigs",
	["Close"] = "Schliessen",
	["Cancel"] = "Abbrechen",
} end )


---------------------------------
--      Addon Declaration      --
---------------------------------

BigWigsVersionQuery = BigWigs:NewModule("Version Query")

BigWigsVersionQuery.defaultDB = {
	popup = true,
}
BigWigsVersionQuery.consoleCmd = L["versionquery"]
BigWigsVersionQuery.consoleOptions = {
	type = "group",
	name = L["Version Query"],
	desc = L["Commands for querying the raid for Big Wigs versions."],
	args = {
		[L["BigWigs"]] = {
			type = "execute",
			name = L["BigWigs"],
			order = 1,
			desc = L["Runs a version query on the BigWigs core."],
			func = function() BigWigsVersionQuery:QueryVersion("BigWigs") end,
		},
		[L["current"]] = {
			type = "execute",
			name = L["Current zone"],
			order = 2,
			desc = L["Runs a version query on your current zone."],
			func = function() BigWigsVersionQuery:QueryVersion() end,
		},
		[L["zone"]] = {
			type = "text",
			name = L["Zone"],
			order = 3,
			desc = L["Runs a version query on the given zone."],
			usage = L["<zone>"],
			get = false,
			set = function(zone) BigWigsVersionQuery:QueryVersion(zone) end,
		},
		spacer = {
			type = "header",
			name = " ",
			order = 10,
		},
		popup = {
			type = "toggle",
			name = L["Show popup"],
			desc = L["Show popup warning on out of date version"],
			order = 12,
			get = function() return BigWigsVersionQuery.db.profile.popup end,
			set = function(v) BigWigsVersionQuery.db.profile.popup = v end,
		},
	}
}

------------------------------
--      Initialization      --
------------------------------

function BigWigsVersionQuery:Test()
	BigWigsVersionQuery:QueryVersion("BigWigs")
end

function BigWigsVersionQuery:OnEnable()
	self.queryRunning = nil
	self.responseTable = {}
	self.zoneRevisions = nil
	self.currentZone = ""
	self.OutOfDateShown = false
	isInitialQuery = true -- reset after /console reloadui

	BWL = AceLibrary("AceLocale-2.2"):new("BigWigs")

	self:RegisterEvent("BigWigs_RecvSync")
	self:TriggerEvent("BigWigs_ThrottleSync", "BWVQ", 0)
	self:TriggerEvent("BigWigs_ThrottleSync", "BWVR", 0)

	--BigWigsVersionQuery:QueryVersion("BigWigs")
	self:ScheduleEvent("versionquerytest", BigWigsVersionQuery.Test, 1, self) -- check version in 1s
end

function BigWigsVersionQuery:PopulateRevisions()
	self.zoneRevisions = {}
	for name, module in self.core:IterateModules() do
		if module:IsBossModule() and module.zonename and type(module.zonename) == "string" then
			-- Make sure to get the enUS zone name.
			local zone = BZ:HasReverseTranslation(module.zonename) and BZ:GetReverseTranslation(module.zonename) or module.zonename
			-- Get the abbreviated name from BW Core.
			local zoneAbbr = BWL:HasTranslation(zone) and BWL:GetTranslation(zone) or nil
			if not self.zoneRevisions[zone] or module.revision > self.zoneRevisions[zone] then
				self.zoneRevisions[zone] = module.revision
			end
			if zoneAbbr and (not self.zoneRevisions[zoneAbbr] or module.revision > self.zoneRevisions[zoneAbbr]) then
				self.zoneRevisions[zoneAbbr] = module.revision
			end
		end
	end
	self.zoneRevisions["BigWigs"] = self.core.revision
end

------------------------------
--      Event Handlers      --
------------------------------

function BigWigsVersionQuery:UpdateTablet()
	if not tablet:IsRegistered("BigWigs_VersionQuery") then
		tablet:Register("BigWigs_VersionQuery",
			"children", function() tablet:SetTitle(L["Big Wigs Version Query"])
				self:OnTooltipUpdate() end,
			"clickable", true,
			"showTitleWhenDetached", true,
			"showHintWhenDetached", true,
			"cantAttach", true,
			"menu", function()
				dewdrop:AddLine(
					"text", L["BigWigs"],
					"tooltipTitle", L["BigWigs"],
					"tooltipText", L["Runs a version query on the BigWigs core."],
					"func", function() self:QueryVersion("BigWigs") end)
				dewdrop:AddLine(
					"text", L["Current zone"],
					"tooltipTitle", L["Current zone"],
					"tooltipText", L["Runs a version query on your current zone."],
					"func", function() self:QueryVersion() end)
				dewdrop:AddLine(
					"text", L["Notify old versions"],
					"tooltipTitle", L["Notify old versions"],
					"tooltipText", L["List people with old versions to raid chat."],
					"func", function() self:NotifyOldVersions() end)
				dewdrop:AddLine(
					"text", L["Close window"],
					"tooltipTitle", L["Close window"],
					"tooltipText", L["Closes the version query window."],
					"func", function() tablet:Attach("BigWigs_VersionQuery"); dewdrop:Close() end)
			end
		)
	end
	if tablet:IsAttached("BigWigs_VersionQuery") then
		tablet:Detach("BigWigs_VersionQuery")
	else
		tablet:Refresh("BigWigs_VersionQuery")
	end
end

function BigWigsVersionQuery:UpdateVersions()
	for name, version in pairs(self.responseTable) do
		if not self.zoneRevisions then return end
		if version > 20000 and version < 30000 then
			if self.zoneRevisions[self.currentZone] and version > self.zoneRevisions[self.currentZone] then
				self:IsOutOfDate()
			end
		end
	end

	if not isInitialQuery then
		self:UpdateTablet()
	end
end

function BigWigsVersionQuery:IsOutOfDate()
	if not self.OutOfDateShown then
		self.OutOfDateShown = true
		BigWigs:Print(L["Your version of Big Wigs Elysium is out of date!\nPlease visit https://github.com/Hosq/BigWigs to get the latest version."])

		if self.db.profile.popup then
			local dialog = nil
			StaticPopupDialogs["BigWigsOutOfDateDialog"] = {
				text = L["Your version of Big Wigs Elysium is out of date!\nPlease visit https://github.com/Hosq/BigWigs to get the latest version."],
				button1 = L["Close"],
				button2 = L["Cancel"],
				OnAccept = function()
					StaticPopup_Hide ("BigWigsOutOfDateDialog")
				end,
				OnCancel = function()
					StaticPopup_Hide ("BigWigsOutOfDateDialog")
				end,
				OnShow = function (self, data)
					local editbox = getglobal(this:GetName().."WideEditBox")
					editbox:SetText("https://github.com/Hosq/BigWigs")
					editbox:SetWidth(250)
					editbox:ClearFocus()
					editbox:HighlightText()
					--self.editBox:SetText("Some text goes here")
					getglobal(this:GetName().."Button2"):Hide()
				end,
				hasEditBox = true,
				hasWideEditBox = true,
				maxLetters = 42,
				--EditBox:setText("Text"),
				timeout = 0,
				whileDead = true,
				hideOnEscape = true,
				preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
			}
			local dialog = StaticPopup_Show ("BigWigsOutOfDateDialog")
		end
	end
end

function BigWigsVersionQuery:NotifyOldVersions()
	local line = ""
	for name, version in pairs(self.responseTable) do
		if self.zoneRevisions[self.currentZone] and version < self.zoneRevisions[self.currentZone] then
			if line == "" then
				line = name
			else
				line = line.." "..name
			end
		end
	end
	SendChatMessage(L["People with outdated BigWigs:"],"RAID")
	SendChatMessage(line,"RAID")
	SendChatMessage(L["Download newest version from https://github.com/Hosq/BigWigs"], "RAID")
end

function BigWigsVersionQuery:OnTooltipUpdate()
	local zoneCat = tablet:AddCategory(
		"columns", 1,
		"text", L["Zone"],
		"child_justify1", "LEFT"
	)
	zoneCat:AddLine("text", self.currentZone)
	local playerscat = tablet:AddCategory(
		"columns", 1,
		"text", L["Nr Replies"],
		"child_justify1", "LEFT"
	)
	playerscat:AddLine("text", self.responses)
	local cat = tablet:AddCategory(
		"columns", 2,
		"text", L["Player"],
		"text2", L["Version"],
		"child_justify1", "LEFT",
		"child_justify2", "RIGHT"
	)
	for name, version in pairs(self.responseTable) do
		if version == -1 then
			cat:AddLine("text", name, "text2", "|cff"..COLOR_RED..L["N/A"].."|r")
		else
			if not self.zoneRevisions then self:PopulateRevisions() end
			local color = COLOR_WHITE
			if self.zoneRevisions[self.currentZone] and version > self.zoneRevisions[self.currentZone] then
				color = COLOR_RED
				if version > 20000 and version < 30000 then
					self:IsOutOfDate()
					color = COLOR_GREEN
				end
			elseif self.zoneRevisions[self.currentZone] and version < self.zoneRevisions[self.currentZone] then
				color = COLOR_RED
			end
			cat:AddLine("text", name, "text2", "|cff"..color..version.."|r")
		end
	end

	tablet:SetHint(L["Green versions are newer than yours, red are older, and white are the same."])
end

function BigWigsVersionQuery:QueryVersionAndShowWindow(zone)
	self:QueryVersion(zone)
	self:UpdateVersions()
end
function BigWigsVersionQuery:QueryVersion(zone)
	if self.queryRunning then
		self.core:Print(L["Query already running, please wait 5 seconds before trying again."])
		return
	end
	if not zone or zone == "" or type(zone) ~= "string" then zone = GetRealZoneText() end
	-- If this is a shorthand zone, convert it to enUS full.
	-- Also, if this is a shorthand, we can't really know if the user is enUS or not.

	if not BWL then BWL = AceLibrary("AceLocale-2.2"):new("BigWigs") end
	if BWL ~= nil and zone ~= nil and type(zone) == "string" and BWL:HasReverseTranslation(zone) then
		zone = BWL:GetReverseTranslation(zone)
		-- If there is a translation for this to GetLocale(), get it, so we can
		-- print the zone name in the correct locale.
		if BZ:HasTranslation(zone) then
			zone = BZ:GetTranslation(zone)
		end
	end

	if not zone then
		error("The given zone is invalid.")
		return
	end

	-- ZZZ |zone| should be translated here.
	if not isInitialQuery then
		self.core:Print(L["Querying versions for "].."|cff"..COLOR_GREEN..zone.."|r.")
	end

	-- If this is a non-enUS zone, convert it to enUS.
	if BZ:HasReverseTranslation(zone) then zone = BZ:GetReverseTranslation(zone) end

	self.currentZone = zone

	self.queryRunning = true
	self:ScheduleEvent(	function()
		self.queryRunning = nil
		if not isInitialQuery then
			self.core:Print(L["Version query done."])
		end
		isInitialQuery = false
	end, 5)

	self.responseTable = {}

	if not self.zoneRevisions then self:PopulateRevisions() end
	if not self.zoneRevisions[zone] then
		self.responseTable[UnitName("player")] = -1
	else
		self.responseTable[UnitName("player")] = self.zoneRevisions[zone]
	end
	self.responses = 1
	self:TriggerEvent("BigWigs_SendSync", "BWVQ "..zone)
end

--[[ Parses the new style reply, which is "1111 <nick>" ]]
function BigWigsVersionQuery:ParseReply2(reply)
	-- If there's no space, it's just a version number we got.
	local first, last = string.find(reply, " ")
	if not first or not last then return reply, nil end

	local rev = string.sub(reply, 1, first)
	local nick = string.sub(reply, last + 1, string.len(reply))

	-- We need to check if rev or nick contains ':' - if it does, this is an old
	-- style reply.
	if tonumber(rev) == nil or string.find(rev, ":") or string.find(nick, ":") then
		return self:ParseReply(reply), nil
	end
	return tonumber(rev), nick
end

--[[ Parses the old style reply, which was MC:REV BWL:REV, etc. ]]
function BigWigsVersionQuery:ParseReply(reply)
	if not string.find(reply, ":") then return -1 end
	local zone = BWL:HasTranslation(self.currentZone) and BWL:GetTranslation(self.currentZone) or self.currentZone

	local zoneIndex, zoneEnd = string.find(reply, zone)
	if not zoneIndex then return -1 end

	local revision = string.sub(reply, zoneEnd + 2, zoneEnd + 6)
	local convertedRev = tonumber(revision)
	if revision and convertedRev ~= nil then return convertedRev end

	return -1
end

--[[
-- Version reply syntax history:
--  Old Style:           MC:REV BWL:REV ZG:REV
--  First Working Style: REV
--  New Style:           REV QuereeNick
--]]

function BigWigsVersionQuery:BigWigs_RecvSync(sync, rest, nick)
	if sync == "BWVQ" and nick ~= UnitName("player") and rest then
		if not self.zoneRevisions then
			self:PopulateRevisions()
		end
		if not self.zoneRevisions[rest] then
			self:TriggerEvent("BigWigs_SendSync", "BWVR -1 "..nick)
		else
			self:TriggerEvent("BigWigs_SendSync", "BWVR " .. self.zoneRevisions[rest] .. " " .. nick)
		end
	elseif sync == "BWVR" and self.queryRunning and nick and rest then
		-- Means it's either a old style or new style reply.
		-- The "working style" is just the number, which was the second type of
		-- version reply we had.
		local revision, queryNick = nil, nil
		if tonumber(rest) == nil then
			revision, queryNick = self:ParseReply2(rest)
		else
			revision = tonumber(rest)
		end
		if queryNick == nil or queryNick == UnitName("player") then
			self.responseTable[nick] = tonumber(revision)
			self.responses = self.responses + 1
			self:UpdateVersions()
		end
	end
end

