
assert( BigWigs, "BigWigs not found!")

-----------------------------------------------------------------------
--      Are you local?
-----------------------------------------------------------------------

local L = AceLibrary("AceLocale-2.2"):new("BigWigsFrostBlast")

local anchor = nil
local FrostblastTargets = {}

local hexColors = {}

for k, v in pairs(RAID_CLASS_COLORS) do
	hexColors[k] = string.format("|cff%02x%02x%02x ", v.r * 255, v.g * 255, v.b * 255)
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
	["FrostBlast"] = true,
	["Frost Blast"] = true,
	["Options for the Frost Blast frame."] = true,
	["Lock frame"] = true,
	["Lock the frost blast frame."] = true,

	["Disabled"] = true,
	["Disable the frost blast display."] = true,

	font = "Fonts\\FRIZQT__.TTF",

	["Color Names"] = true,
	["Class colored names."] = true,
	["Color Bars"] = true,
	["Class colored bars."] = true,

	["Test"] = true,
	["Perform a Frost Blast test."] = true,

	["Reset position"] = true,
	["Reset the anchor position, moving it to the center of your screen."] = true,

	["Offline"] = true,
	["Dead"] = true,
} end)

L:RegisterTranslations("esES", function() return {
	["FrostBlast"] = "FrostBlast",
	["Frost Blast"] = "Explosión de Escarcha",
	["Options for the Frost Blast frame."] = "Opciones para el marco para Explosión de Escarcha.",
	["Lock frame"] = "Bloquear el marco",
	["Lock the frost blast frame."] = "Bloquea el marco de Explosión de Escarcha",

	["Disabled"] = "Desactivado",
	["Disable the frost blast display."] = "Desactivar la muestra de Explosión de Escarcha",

	font = "Fonts\\FRIZQT__.TTF",

	["Color Names"] = "Nombres de Colores",
	["Class colored names."] = "Nombres de clases coloreadas",
	["Color Bars"] = "Barras de Color",
	["Class colored bars."] = "Barras de clases coloreadas",

	["Test"] = "Probar",
	["Perform a Frost Blast test."] = "Prueba de Explosión de Escarcha",

	["Reset position"] = "Restablecer posición",
	["Reset the anchor position, moving it to the center of your screen."] = "Restablece la posición de la ancla al centro de la pantalla.",

	["Offline"] = "Desconectado",
	["Dead"] = "Muerto",
} end)
-----------------------------------------------------------------------
--      Module Declaration
-----------------------------------------------------------------------

BigWigsFrostBlast = BigWigs:NewModule("FrostBlast")
BigWigsFrostBlast.revision = 20001
BigWigsFrostBlast.defaultDB = {
	posx = nil,
	posy = nil,
	lock = false,
	disabled = false,
	names = false,
	bars = true,
}
BigWigsFrostBlast.external = true

BigWigsFrostBlast.consoleCmd = L["FrostBlast"]
BigWigsFrostBlast.consoleOptions = {
	type = "group",
	name = L["Frost Blast"],
	desc = L["Options for the Frost Blast frame."],
	args = {
		lock = {
			type = "toggle",
			name = L["Lock frame"],
			desc = L["Lock the frost blast frame."],
			order = 99,
			get = function()
				return BigWigsFrostBlast.db.profile.lock
			end,
			set = function(v)
				BigWigsFrostBlast.db.profile.lock = v
				if v then
					BigWigsFrostBlast:Lock()
				else
					BigWigsFrostBlast:Unlock()
				end
			end,
		},
		reset = {
			type = "execute",
			name = L["Reset position"],
			desc = L["Reset the anchor position, moving it to the center of your screen."],
			order = 100,
			func = function() BigWigsFrostBlast:ResetAnchor() end,
		},
		disabled = {
			type = "toggle",
			name = L["Disabled"],
			desc = L["Disable the frost blast display."],
			order = 101,
			get = function() return BigWigsFrostBlast.db.profile.disabled end,
			set = function(v)
				BigWigsFrostBlast.db.profile.disabled = v
				if BigWigsFrostBlast.db.profile.disabled then
					BigWigsFrostBlast:FBClose()
				end
			end,
		},
		spacer = {
			type = "header",
			name = " ",
			order = 103,
		},
		names = {
			type = "toggle",
			name = L["Color Names"],
			desc = L["Class colored names."],
			order = 104,
			get = function() return BigWigsFrostBlast.db.profile.names end,
			set = function(v) BigWigsFrostBlast.db.profile.names = v end,
		},
		bars = {
			type = "toggle",
			name = L["Color Bars"],
			desc = L["Class colored bars."],
			order = 105,
			get = function() return BigWigsFrostBlast.db.profile.bars end,
			set = function(v) BigWigsFrostBlast.db.profile.bars = v end,
		},
		spacer = {
			type = "header",
			name = " ",
			order = 113,
		},
		[L["Test"]] = {
			type = "execute",
			name = L["Test"],
			desc = L["Perform a Frost Blast test."],
			order = 114,
			handler = BigWigsFrostBlast,
			func = "TestFBFrame",
		},
	}
}

-----------------------------------------------------------------------
--      Initialization
-----------------------------------------------------------------------

function BigWigsFrostBlast:OnRegister()
end

function BigWigsFrostBlast:OnEnable()
	self:RegisterEvent("Ace2_AddonDisabled")
end

function BigWigsFrostBlast:OnDisable()
	self:FBClose()
end

-----------------------------------------------------------------------
--      Event Handlers
-----------------------------------------------------------------------
function BigWigsFrostBlast:Lock()
	if anchor then
		anchor:EnableMouse(false)
		anchor:SetMovable(false)
	end
end

function BigWigsFrostBlast:Unlock()
	if anchor then
		anchor:EnableMouse(true)
		anchor:SetMovable(true)
	end
end

function BigWigsFrostBlast:Ace2_AddonDisabled()
	self:FBClose()
end

-----------------------------------------------------------------------
--      Util
-----------------------------------------------------------------------

function BigWigsFrostBlast:FBClose()
	if anchor then anchor:Hide() end
	self:StopFrostBlastUpdate()
end

function BigWigsFrostBlast:FBShow()
	if not BigWigsFrostBlast.db.profile.disabled then
		self:SetupFrames()
		if anchor then anchor:Show() end
	end
end

function BigWigsFrostBlast:SavePosition()
	if not anchor then self:SetupFrames() end

	local s = anchor:GetEffectiveScale()
	self.db.profile.posx = anchor:GetLeft() * s
	self.db.profile.posy = anchor:GetTop() * s
end

function BigWigsFrostBlast:TestFBFrame()
	if not anchor then self:SetupFrames() end
	anchor:Show()
	for i=1,4 do
		anchor.bar[i].unit="player"
		anchor.bar[i].status:SetScript("OnUpdate", self.OnUpdate)
		anchor.bar[i]:Show()
	end
	self:ScheduleEvent("bwStopFrostBlastUpdate", self.StopFrostBlastUpdate, 6, self)
end

function BigWigsFrostBlast:FindPlayerUnitByName(name)
	if UnitExists("player") and (UnitName("player")==name) then
		return "player";
	end
	if GetNumRaidMembers()==0 then
		return nil
	end
	for i=1,GetNumRaidMembers() do
		if UnitExists("raid"..i) and (UnitName("raid"..i)==name) then
			return "raid"..i;
		end
	end
	return nil;
end

function BigWigsFrostBlast:AddFrostBlastTarget(name)
	if not BigWigsFrostBlast.db.profile.disabled then
		local check
		for k, v in FrostblastTargets do
			if UnitName(v) == name then
				check = true
			end
		end
		if not check then
			local unit = self:FindPlayerUnitByName(name)
			if unit then
				tinsert(FrostblastTargets,unit);
				self:FrostBlastUpdate()
			end
		end
		self:ScheduleEvent("bwStopFrostBlastUpdate", self.StopFrostBlastUpdate, 6, self)
	end
end

function BigWigsFrostBlast:FrostBlastUpdate()
	if not BigWigsFrostBlast.db.profile.disabled then
		if not anchor then self:SetupFrames() anchor:Show() end
		local numEntries = getn(FrostblastTargets)
		for i=1,4 do
			if i<=numEntries then
				anchor.bar[i].unit=FrostblastTargets[i];
				anchor.bar[i].status:SetScript("OnUpdate", self.OnUpdate)
				anchor.bar[i]:Show()
			else
				anchor.bar[i].unit=nil;
				anchor.bar[i].status:SetScript("OnUpdate", nil)
				anchor.bar[i]:Hide()
			end
		end
	end
end

function BigWigsFrostBlast:StopFrostBlastUpdate()
	if anchor then
		for i=1,4 do
			anchor.bar[i].unit=nil;
			anchor.bar[i].status:SetScript("OnUpdate", nil)
			anchor.bar[i]:Hide()
		end
	end
	FrostblastTargets = {}
end

function BigWigsFrostBlast:OnUpdate()
	local unit = this:GetParent().unit
	if unit then
		if not UnitIsConnected(unit) then
			this:SetValue(0)
			this:GetParent().textVal:SetText(L["Offline"])
		elseif UnitIsDeadOrGhost(unit) then
			this:SetValue(0)
			this:GetParent().textVal:SetText(L["Dead"])
		else
			local percent = UnitHealth(unit) / UnitHealthMax(unit) * 100
			percent = math.floor(percent + 0.5)
			this:SetValue(percent)
			this:GetParent().textVal:SetText(percent)
		end
		if BigWigsFrostBlast.db.profile.names then
			this:GetParent().text:SetText(tostring(coloredNames[unit]))
		else
			this:GetParent().text:SetText(UnitName(unit))
		end
		local _,class = UnitClass(unit)
		if BigWigsFrostBlast.db.profile.bars then
			this:SetStatusBarColor(RAID_CLASS_COLORS[class].r,RAID_CLASS_COLORS[class].g,RAID_CLASS_COLORS[class].b)
		else
			this:SetStatusBarColor(0,1,0)
		end
	end
end

------------------------------
--    Create the Anchor     --
------------------------------

function BigWigsFrostBlast:SetupFrames()
	if anchor then return end

	local frame = CreateFrame("Frame", "BigWigsFrostBlastAnchor", UIParent)
	frame:Hide()

	frame:SetWidth(200)
	frame:SetHeight(120)

	frame:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 16,
		edgeFile = "Interface\\AddOns\\BigWigs\\Textures\\otravi-semi-full-border", edgeSize = 32,
		--edgeFile = "", edgeSize = 32,
		insets = {left = 1, right = 1, top = 20, bottom = 1},
	})
	frame:SetBackdropBorderColor(1.0,1.0,1.0)
	frame:SetBackdropColor(24/255, 24/255, 24/255)
	frame:ClearAllPoints()
	frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", 300, 500)
	frame:EnableMouse(true)
	frame:SetClampedToScreen(true)
	frame:RegisterForDrag("LeftButton")
	frame:SetMovable(true)
	frame:SetFrameStrata("BACKGROUND")
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
	cheader:SetText("Frost Blast")
	cheader:SetShadowOffset(.8, -.8)
	cheader:SetShadowColor(0, 0, 0, 1)
	frame.cheader = cheader

	--Bar1
	frame.bar = {}
	for i=1, 4 do
		local bar = CreateFrame("Button", "FBTargetBar_"..i, UIParent)
		bar:ClearAllPoints()
		if i==1 then
			bar:SetPoint( "TOP", frame.cheader, "BOTTOM", 0, -2)
		else
			bar:SetPoint("TOP", frame.bar[i-1], "BOTTOM", 0, -2)
		end
		bar:SetFrameStrata("LOW")
		bar:SetWidth(198)
		bar:SetHeight(20)
		bar:SetToplevel(true)
		bar.unit = nil
		bar:RegisterForClicks("LeftButtonUp", "RightButtonUp", "MiddleButtonUp", "Button4Up", "Button5Up")
		bar:SetScript("OnClick", function() if this.unit then TargetUnit(this.unit) end end)
		bar.status = CreateFrame("StatusBar",nil, bar)
		bar.status:ClearAllPoints()
		bar.status:SetPoint("CENTER", bar)
		bar.status:SetStatusBarTexture("Interface\\AddOns\\BigWigs\\textures\\smooth")
		bar.status:SetMinMaxValues(0, 100)
		bar.status:SetValue(100)
		bar.status:SetWidth(196)
		bar.status:SetHeight(20)
		bar.status:SetStatusBarColor(0,1,0)
		bar.status:SetScript("OnUpdate", nil)
		bar.text = bar.status:CreateFontString(nil, "OVERLAY")
		bar.text:ClearAllPoints()
		bar.text:SetPoint("LEFT", bar, "LEFT",4,0)
		bar.text:SetShadowOffset(1, -1)
		bar.text:SetShadowColor(0, 0, 0)
		bar.text:SetTextColor(1, 1, 1, 0.9)
		bar.text:SetJustifyH("LEFT")
		bar.text:SetFont(L["font"], 12)
		bar.text:SetText("None")
		bar.textVal = bar.status:CreateFontString(nil, "OVERLAY")
		bar.textVal:ClearAllPoints()
		bar.textVal:SetPoint("RIGHT", bar, "RIGHT",-4,0)
		bar.textVal:SetShadowOffset(1, -1)
		bar.textVal:SetShadowColor(0, 0, 0)
		bar.textVal:SetTextColor(1, 1, 1, 0.9)
		bar.textVal:SetJustifyH("RIGHT")
		bar.textVal:SetFont(L["font"], 12)
		bar.textVal:SetText(100)
		bar.bg = CreateFrame("Frame",nil, bar)
		bar.bg:ClearAllPoints()
		bar.bg:SetPoint("CENTER", bar, "CENTER")
		bar.bg:SetWidth(198)
		bar.bg:SetHeight(22)
		bar.bg:SetBackdrop({
			bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 16,
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Background", edgeSize = 1,
			insets = {left = -1, right = -1, top = -1, bottom = -1},
		})
		bar.bg:SetBackdropColor(87/255, 24/255, 24/255)
		bar.bg:SetFrameLevel(bar.bg:GetFrameLevel() - 1)
		bar.bg:SetBackdropBorderColor(0.9, 0.9, 0.9, 0.6)
		bar.bg:SetBackdropColor(0.3, 0.3, 0.3, 0.6)


		frame.bar[i] = bar
		frame.bar[i]:Hide()
	end

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
	closebutton:SetScript( "OnClick", function() self:FBClose() end )

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

function BigWigsFrostBlast:ResetAnchor()
	if not anchor then self:SetupFrames() end
	anchor:ClearAllPoints()
	anchor:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", 300, 500)
	self.db.profile.posx = nil
	self.db.profile.posy = nil
end
