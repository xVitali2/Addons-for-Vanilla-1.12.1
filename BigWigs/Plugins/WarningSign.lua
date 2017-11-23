--[[
by LYQ(Virose / MOUZU)
https://github.com/MOUZU/BigWigs

This is a small plugin which is inspried by ThaddiusArrows and how Sulfuras of Mesmerize (Warsong/Feenix) used it.
I wanted to convert his idea in a more dynamic, flexible and easy to use plugin.

At the current state it is built to only display one Icon at a time, at the moment I can not think of
a situation where it would be needed to display more than one.
--]]

------------------------------
--      Are you local?      --
------------------------------
local name = "WarningSign"
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..name)

local c = {
	-- currently displayed icon
	texture = "",       -- contains the texturePath
	endTime = 0,        -- to hide it appropriately
	force   = false,    -- will prevent it from being overwritten
}


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["WarningSign"] = true, -- console cmd
	["Warning Sign"] = true, -- module name
	["Options for the Warning Sign."] = true,
	["Show anchor"] = true,
	["Show the anchor frame."] = true,
	["Reset"] = true,
	["Reset the frame."] = true,
	["Test"] = true,
	["Close"] = true,

	["Disabled"] = true,
	["Disable the warning signs for all modules that use it."] = true,
	["Scale"] = true,
	["Set the warning sign scale."] = true,
	["Transparency"] = true,
	["Set the warning sign alpha value (0.1 to 1.0: transparent to opaque)."] = true,
} end)

L:RegisterTranslations("esES", function() return {
	--["WarningSign"] = true, -- console cmd
	["Warning Sign"] = "Señal de Advertencia", -- module name
	["Options for the Warning Sign."] = "Opciones para el Señal de Advertencia",
	["Show anchor"] = "Mostrar ancla",
	["Show the anchor frame."] = "Muestra el marco de la ancla",
	["Reset"] = "Restablecer",
	["Reset the frame."] = "Restablece el marco",
	["Test"] = "Probar",
	["Close"] = "Cerrar",

	["Disabled"] = "Desactivado",
	["Disable the warning signs for all modules that use it."] = "Desactiva los señales de advertencia para todos los módulos que lo usan",
	["Scale"] = "Escala",
	["Set the warning sign scale."] = "Define la escala del señal de advertencia",
	["Transparency"] = "Transparencia",
	["Set the warning sign alpha value (0.1 to 1.0: transparent to opaque)."] = "Define el valor alfa del señal de advertencia (0.1 a 1.0: transparente a opaco",
} end)

L:RegisterTranslations("deDE", function() return {
	["WarningSign"] = "warnzeichen", -- console cmd
	["Warning Sign"] = "Warnzeichen", -- module name
	["Options for the Warning Sign."] = "Optionen für das Warnzeichen.",
	["Show anchor"] = "Verankerung anzeigen",
	["Show the anchor frame."] = "Zeige das Verankerungsfenster des Warnzeichens um dessen Position zu verändern.",
	["Reset"] = "Zurücksetzen",
	["Reset the frame."] = "Die Einstellungen des Warnzeichens zurücksetzen.",
	["Test"] = "Test",
	["Close"] = "Schlie\195\159en",

	["Disabled"] = "Deaktivieren",
	["Disable the warning signs for all modules that use it."] = "Deaktiviert die Anzeige der Warnzeichen für alle Module die sie benutzen.",
	["Scale"] = "Skalierung",
	["Set the warning sign scale."] = "Skalierung des Warnzeichen",
	["Transparency"] = "Transparenz",
	["Set the warning sign alpha value (0.1 to 1.0: transparent to opaque)."] = "Den Alphawert des Warnzeichen definieren (0.1 bis 1.0: transparent bis deckend).",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsWarningSign = BigWigs:NewModule(name)
BigWigsWarningSign.defaultDB = {
	posx = nil,
	posy = nil,
	isVisible = nil,
	disabled = false,
	scale = 1.0,
	alpha = 0.8,
}
BigWigsWarningSign.consoleCmd = L["WarningSign"]
BigWigsWarningSign.consoleOptions = {
	type = "group",
	name = L["Warning Sign"],
	desc = L["Options for the Warning Sign."],
	handler = BigWigsWarningSign,
	pass = true,
	get = function(key)
		return BigWigsWarningSign.db.profile[key]
	end,
	set = function(key, value)
		BigWigsWarningSign.db.profile[key] = value
	end,
	args = {
		show = {
			type = "toggle",
			name = L["Show anchor"],
			desc = L["Show the anchor frame."],
			order = 100,
			get = function() return BigWigsWarningSign.db.profile.isVisible end,
			set = function(v)
				BigWigsWarningSign:ShowAnchor()
			end,
		},
		scale = {
			type = "range",
			name = L["Scale"],
			desc = L["Set the warning sign scale."],
			order = 101,
			min = 0.2,
			max = 2.0,
			step = 0.1,
			get = function() return BigWigsWarningSign.db.profile.scale end,
			set = function(v)
				BigWigsWarningSign.db.profile.scale = v
				if BigWigsWarningSign.frames then
					BigWigsWarningSign.frames.sign:SetScale(v)
				end
			end,
		},
		alpha = {
			type = "range",
			name = L["Transparency"],
			desc = L["Set the warning sign alpha value (0.1 to 1.0: transparent to opaque)."],
			order = 102,
			min = 0.1,
			max = 1.0,
			step = 0.05,
			get = function() return BigWigsWarningSign.db.profile.alpha end,
			set = function(v)
				BigWigsWarningSign.db.profile.alpha = v
				if BigWigsWarningSign.frames then
					BigWigsWarningSign.frames.sign:SetAlpha(v)
				end
			end,
		},
		reset = {
			type = "execute",
			name = L["Reset"],
			desc = L["Reset the frame."],
			order = 103,
			func = function()
				BigWigsWarningSign:ResetPosition()
				BigWigsWarningSign.db.profile.scale = 1.0
				if BigWigsWarningSign.frames then
					BigWigsWarningSign.frames.sign:SetScale(1.0)
				end
				BigWigsWarningSign.db.profile.alpha = 0.8
				if BigWigsWarningSign.frames then
					BigWigsWarningSign.frames.sign:SetAlpha(0.8)
				end
			end,
		},
		disabled = {
			type = "toggle",
			name = L["Disabled"],
			desc = L["Disable the warning signs for all modules that use it."],
			order = 104,
			get = function() return BigWigsWarningSign.db.profile.disabled end,
			set = function(v)
				BigWigsWarningSign.db.profile.disabled = v
				if v then
					BigWigsWarningSign:BigWigs_HideWarningSign("", true)
					BigWigsWarningSign:HideAnchor()
				end
			end,
		},
	--[[spacer = {
	type = "header",
	name = " ",
	order = 103,
	},]]
	}
}

------------------------------
--      Initialization      --
------------------------------

function BigWigsWarningSign:OnEnable()
	self.db.profile.isVisible = false

	self:RegisterEvent("BigWigs_ShowWarningSign")
	self:RegisterEvent("BigWigs_HideWarningSign")
	self:RegisterEvent("PLAYER_DEAD")
end



------------------------------
--      Event Handlers      --
------------------------------

function BigWigsWarningSign:BigWigs_ShowWarningSign(texturePath, duration, force)
	if self.db.profile.disabled then
		return
	end
	if not self.frames or not self.frames.anchor then
		self:SetupFrames()
	end

	-- force will overwrite the current icon shown, else it will do nothing
	if not type(texturePath) == "string" or not type(duration) == "number" then
		return
	end

	-- check if there is currently an icon displayed or if the force flags allow to overwrite
	-- addition: if texturePath is the same as currently displayed then reset the timer to duration
	if c.texture == "" or (force and not c.force) or c.texture == texturePath then
		c.texture   = texturePath;
		c.endTime   = GetTime() + duration;
		c.force     = force;

		self.texture:SetTexture(texturePath)
		self.frames.sign:Show()
		self.db.profile.isVisible = true

		-- initialize the OnUpdate
		self.frames.sign:SetScript('OnUpdate', function()
			if GetTime() > c.endTime then
				c.texture   = "";
				self.frames.sign:Hide()
				self.db.profile.isVisible = false
				self.frames.sign:SetScript('OnUpdate', nil)
			end
		end)
	end
end

function BigWigsWarningSign:BigWigs_HideWarningSign(texturePath, forceHide)
	-- will only work if texturePath is still the icon displayed, this might not be the case when an icon gets forced
	-- forceHide is used upon BossDeath to hide no matter what is being displayed
	if forceHide or c.texture == texturePath then
		c.texture   = "";

		if self.frames and self.frames.sign then
			self.frames.sign:Hide()
			self.db.profile.isVisible = false
			self.frames.sign:SetScript('OnUpdate', nil)
		end
	end
end

function BigWigsWarningSign:PLAYER_DEAD()
	-- this should hide all Icons upon your own death
	self:BigWigs_HideWarningSign("", true)
end

function BigWigsWarningSign:ShowAnchor()
	if not self.frames or not self.frames.anchor then
		self:SetupFrames()
	end
	self.frames.anchor:Show()
end

function BigWigsWarningSign:HideAnchor()
	if not self.frames or not self.frames.anchor then
		self:SetupFrames()
	end
	self.frames.anchor:Hide()
end

------------------------------
--    Create the Frame     --
------------------------------

function BigWigsWarningSign:SetupFrames()
	self:CreateAnchor()
	self:CreateWarningSignFrame()
end

function BigWigsWarningSign:CreateAnchor()
	local f, t

	f, _, _ = GameFontNormal:GetFont()

	self.frames = {}
	self.frames.anchor = CreateFrame("Frame", "BigWigsWarningSignAnchor", UIParent)
	self.frames.anchor.owner = self
	self.frames.anchor:Hide()

	self.frames.anchor:SetWidth(175)
	self.frames.anchor:SetHeight(75)
	self.frames.anchor:SetBackdrop({
		bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", tile = true, tileSize = 16,
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 16,
		insets = {left = 4, right = 4, top = 4, bottom = 4},
	})
	self.frames.anchor:SetBackdropBorderColor(.5, .5, .5)
	self.frames.anchor:SetBackdropColor(0,0,0)
	self.frames.anchor:ClearAllPoints()
	self.frames.anchor:SetPoint("CENTER", UIParent, "CENTER", 0, 100)
	self.frames.anchor:EnableMouse(true)
	self.frames.anchor:RegisterForDrag("LeftButton")
	self.frames.anchor:SetMovable(true)
	self.frames.anchor:SetScript("OnDragStart", function() this:StartMoving() end)
	self.frames.anchor:SetScript("OnDragStop", function() this:StopMovingOrSizing() this.owner:SavePosition() end)


	self.frames.cfade = self.frames.anchor:CreateTexture(nil, "BORDER")
	self.frames.cfade:SetWidth(169)
	self.frames.cfade:SetHeight(25)
	self.frames.cfade:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
	self.frames.cfade:SetPoint("TOP", self.frames.anchor, "TOP", 0, -4)
	self.frames.cfade:SetBlendMode("ADD")
	self.frames.cfade:SetGradientAlpha("VERTICAL", .1, .1, .1, 0, .25, .25, .25, 1)
	self.frames.anchor.Fade = self.frames.fade

	self.frames.cheader = self.frames.anchor:CreateFontString(nil,"OVERLAY")
	self.frames.cheader:SetFont(f, 14)
	self.frames.cheader:SetWidth(150)
	self.frames.cheader:SetText(L["Warning Sign"])
	self.frames.cheader:SetTextColor(1, .8, 0)
	self.frames.cheader:ClearAllPoints()
	self.frames.cheader:SetPoint("TOP", self.frames.anchor, "TOP", 0, -10)

	self.frames.leftbutton = CreateFrame("Button", nil, self.frames.anchor)
	self.frames.leftbutton.owner = self
	self.frames.leftbutton:SetWidth(40)
	self.frames.leftbutton:SetHeight(25)
	self.frames.leftbutton:SetPoint("RIGHT", self.frames.anchor, "CENTER", -10, -15)
	self.frames.leftbutton:SetScript("OnClick", function()  self:TriggerEvent("BigWigs_Test") end)


	t = self.frames.leftbutton:CreateTexture()
	t:SetWidth(50)
	t:SetHeight(32)
	t:SetPoint("CENTER", self.frames.leftbutton, "CENTER")
	t:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
	t:SetTexCoord(0, 0.625, 0, 0.6875)
	self.frames.leftbutton:SetNormalTexture(t)

	t = self.frames.leftbutton:CreateTexture(nil, "BACKGROUND")
	t:SetTexture("Interface\\Buttons\\UI-Panel-Button-Down")
	t:SetTexCoord(0, 0.625, 0, 0.6875)
	t:SetAllPoints(self.frames.leftbutton)
	self.frames.leftbutton:SetPushedTexture(t)

	t = self.frames.leftbutton:CreateTexture()
	t:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
	t:SetTexCoord(0, 0.625, 0, 0.6875)
	t:SetAllPoints(self.frames.leftbutton)
	t:SetBlendMode("ADD")
	self.frames.leftbutton:SetHighlightTexture(t)
	self.frames.leftbuttontext = self.frames.leftbutton:CreateFontString(nil,"OVERLAY")
	self.frames.leftbuttontext:SetFontObject(GameFontHighlight)
	self.frames.leftbuttontext:SetText(L["Test"])
	self.frames.leftbuttontext:SetAllPoints(self.frames.leftbutton)

	self.frames.rightbutton = CreateFrame("Button", nil, self.frames.anchor)
	self.frames.rightbutton.owner = self
	self.frames.rightbutton:SetWidth(40)
	self.frames.rightbutton:SetHeight(25)
	self.frames.rightbutton:SetPoint("LEFT", self.frames.anchor, "CENTER", 10, -15)
	self.frames.rightbutton:SetScript( "OnClick", function() self:HideAnchor() end )


	t = self.frames.rightbutton:CreateTexture()
	t:SetWidth(50)
	t:SetHeight(32)
	t:SetPoint("CENTER", self.frames.rightbutton, "CENTER")
	t:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
	t:SetTexCoord(0, 0.625, 0, 0.6875)
	self.frames.rightbutton:SetNormalTexture(t)

	t = self.frames.rightbutton:CreateTexture(nil, "BACKGROUND")
	t:SetTexture("Interface\\Buttons\\UI-Panel-Button-Down")
	t:SetTexCoord(0, 0.625, 0, 0.6875)
	t:SetAllPoints(self.frames.rightbutton)
	self.frames.rightbutton:SetPushedTexture(t)

	t = self.frames.rightbutton:CreateTexture()
	t:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
	t:SetTexCoord(0, 0.625, 0, 0.6875)
	t:SetAllPoints(self.frames.rightbutton)
	t:SetBlendMode("ADD")
	self.frames.rightbutton:SetHighlightTexture(t)
	self.frames.rightbuttontext = self.frames.rightbutton:CreateFontString(nil,"OVERLAY")
	self.frames.rightbuttontext:SetFontObject(GameFontHighlight)
	self.frames.rightbuttontext:SetText(L["Close"])
	self.frames.rightbuttontext:SetAllPoints(self.frames.rightbutton)

	local x = self.db.profile.posx
	local y = self.db.profile.posy
	if x and y then
		local s = self.frames.anchor:GetEffectiveScale()
		self.frames.anchor:ClearAllPoints()
		self.frames.anchor:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / s, y / s)
	else
		self:ResetPosition()
	end
end

function BigWigsWarningSign:CreateWarningSignFrame()
	--[[
	self.msgframe = CreateFrame("MessageFrame")
	self.msgframe:SetWidth(512)
	self.msgframe:SetHeight(80)

	self.msgframe:SetPoint("TOP", self.frames.anchor, "BOTTOM", 0, 0)
	self.msgframe:SetScale(self.db.profile.scale or 1)
	self.msgframe:SetInsertMode("TOP")
	self.msgframe:SetFrameStrata("HIGH")
	self.msgframe:SetToplevel(true)
	self.msgframe:SetFontObject(GameFontNormalLarge)
	self.msgframe:Show()
	]]


	self.frames.sign = CreateFrame("Frame", "BigWigsWarningSignFrame", UIParent)
	self.frames.sign:Hide()
	self.db.profile.isVisible = false

	self.frames.sign:SetWidth(100)
	self.frames.sign:SetHeight(100)
	self.frames.sign:SetAlpha(self.db.profile.alpha or 0.8)

	self.frames.sign:SetPoint("BOTTOM", self.frames.anchor, "TOP", 0, 0)
	self.frames.sign:SetScale(self.db.profile.scale or 1)
	--self.frames.sign:SetInsertMode("TOP")
	self.frames.sign:SetFrameStrata("HIGH")
	self.frames.sign:SetToplevel(true)

	--self.frames.sign:EnableMouse(true)
	--self.frames.sign:SetClampedToScreen(true)
	--self.frames.sign:RegisterForDrag("LeftButton")
	--self.frames.sign:SetMovable(true)
	--self.frames.sign:SetScript("OnDragStart", function() this:StartMoving() end)
	--[[self.frames.sign:SetScript("OnDragStop", function()
	this:StopMovingOrSizing()
	self:SavePosition()
	end)]]

	self.texture = self.frames.sign:CreateTexture(nil, "BACKGROUND")
	self.texture:SetAllPoints(self.frames.sign)
	self.texture:SetTexCoord(0.08, 0.92, 0.08, 0.92) -- zoom in to hide border

	--[[local x = self.db.profile.posx
	local y = self.db.profile.posy
	if x and y then
	local s = self.frames.sign:GetEffectiveScale()
	self.frames.sign:ClearAllPoints()
	self.frames.sign:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / s, y / s)
	else
	self:ResetPosition()
	end]]
end

function BigWigsWarningSign:ResetPosition()
	--[[if not BigWigsWarningSign.frame then
	self:SetupFrames()
	end
	BigWigsWarningSign.frame:ClearAllPoints()
	--frame:SetPoint("CENTER", UIParent, "CENTER")
	--BigWigsWarningSign.frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", 1000, 500)
	BigWigsWarningSign.frame:SetPoint("CENTER", 0, 150)
	self.db.profile.posx = nil
	self.db.profile.posy = nil]]

	if not self.frames or not self.frames.anchor then
		self:SetupFrames()
	end
	self.frames.anchor:ClearAllPoints()
	--frame:SetPoint("CENTER", UIParent, "CENTER")
	--BigWigsWarningSign.frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", 1000, 500)
	self.frames.anchor:SetPoint("CENTER", UIParent, "CENTER", 0, 100) --self.frames.anchor:SetPoint("CENTER", 0, 150)
	self.db.profile.posx = nil
	self.db.profile.posy = nil
end

function BigWigsWarningSign:SavePosition()
	--[[if not BigWigsWarningSign.frame then
	self:SetupFrames()
	end

	local s = BigWigsWarningSign.frame:GetEffectiveScale()
	self.db.profile.posx = BigWigsWarningSign.frame:GetLeft() * s
	self.db.profile.posy = BigWigsWarningSign.frame:GetTop() * s]]

	if not BigWigsWarningSign.frames.anchor then
		self:SetupFrames()
	end

	local s = BigWigsWarningSign.frames.anchor:GetEffectiveScale()
	self.db.profile.posx = BigWigsWarningSign.frames.anchor:GetLeft() * s
	self.db.profile.posy = BigWigsWarningSign.frames.anchor:GetTop() * s
end
