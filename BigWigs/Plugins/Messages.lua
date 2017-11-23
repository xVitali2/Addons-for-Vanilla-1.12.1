
assert(BigWigs, "BigWigs not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("BigWigsMessages")
local paint = AceLibrary("PaintChips-2.0")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["Messages"] = true,

	["msg"] = true,
	["anchor"] = true,
	["rw"] = true,
	["color"] = true,
	["scale"] = true,

	["Options for the message frame."] = true,
	["Anchor"] = true,
	["Show the message anchor frame."] = true,
	["Use RaidWarning"] = true,
	["Toggle sending messages to the RaidWarnings frame."] = true,
	["Use colors"] = true,
	["Toggles white only messages ignoring coloring."] = true,
	["Message frame scale"] = true,

	["Message frame"] = true,
	["Show anchor"] = true,
	["Send messages to RaidWarning frame"] = true,
	["Set the message frame scale."] = true,
	["Colorize messages"] = true,
	["Scale"] = true,

	["|cffff0000Co|cffff00fflo|cff00ff00r|r"] = true,
	["White"] = true,
	["BigWigs frame"] = true,
	["RaidWarning frame"] = true,
	["Scale is set to %s"] = true,
	["Messages are now sent to the %2$s"] = true,
	["Messages are currently sent to the %2$s"] = true,

	["display"] = true,
	["Display"] = true,
	["Set where messages are displayed."] = true,
	["Display is now set to %2$s"] = true,
	["Display is currently set to %2$s"] = true,

	["Mik's Scrolling Battle Text"] = true,
	["Scrolling Combat Text"] = true,
	["Floating Combat Text"] = true,

	["Test"] = true,
	["Close"] = true,
} end)

L:RegisterTranslations("esES", function() return {
	["Messages"] = "Mensajes",

	["msg"] = "msg",
	["anchor"] = "ancla",
	["rw"] = "rw",
	["color"] = "color",
	["scale"] = "escala",

	["Options for the message frame."] = "Opciones para el marco del mensajes",
	["Anchor"] = "Ancla",
	["Show the message anchor frame."] = "Muestra la ancla del marco del mensaje",
	["Use RaidWarning"] = "Usar Advertencia de la Banda",
	["Toggle sending messages to the RaidWarnings frame."] = "Alterna de enviar mensajes al marco Advertencia de la Banda",
	["Use colors"] = "Usar colores",
	["Toggles white only messages ignoring coloring."] = "Alterna solamente los mensajes blancos y ignora los coloreados.",
	["Message frame scale"] = "Escala del marco del mensaje",

	["Message frame"] = "Marco del mensaje",
	["Show anchor"] = "Mostrar Ancla",
	["Send messages to RaidWarning frame"] = "Envia mensajes al marco de Advertencia de la Banda",
	["Set the message frame scale."] = "Define la escala del marco del mensaje",
	["Colorize messages"] = "Colorea los mensajes",
	["Scale"] = "Escala",

	["|cffff0000Co|cffff00fflo|cff00ff00r|r"] = "|cffff0000Co|cffff00fflo|cff00ff00r|r",
	["White"] = "Blanco",
	["BigWigs frame"] = "Marco de BigWigs",
	["RaidWarning frame"] = "Marco de Advertencia de la Banda",
	["Scale is set to %s"] = "Escala se define a %s",
	["Messages are now sent to the %2$s"] = "Mensajes están enviados al %2$s",
	["Messages are currently sent to the %2$s"] = "Mensajes actuales están enviados al %2$s",

	["display"] = "display",
	["Display"] = "Muestra",
	["Set where messages are displayed."] = "Define donde los mensajes están mostrados",
	["Display is now set to %2$s"] = "Muestra",
	["Display is currently set to %2$s"] = "Muestra actual define a %2$s",

	["Mik's Scrolling Battle Text"] = "Flotación de texto de combate de Mik",
	["Scrolling Combat Text"] = "Flotación de texto de combate",
	["Floating Combat Text"] = "Flotación de texto de combate",

	["Test"] = "Probar",
	["Close"] = "Cerrar",
} end)

L:RegisterTranslations("deDE", function() return {
	["Messages"] = "Nachrichten",

	["msg"] = "msg",
	["anchor"] = "verankerung",
	["rw"] = "rw",
	["color"] = "farbe",
	["scale"] = "skalierung",

	["Options for the message frame."] = "Optionen f\195\188r das Nachrichtenfenster.",
	["Anchor"] = "Verankerung",
	["Show the message anchor frame."] = "Verankerung des Nachrichtenfensters anzeigen.",
	["Use RaidWarning"] = "RaidWarning benutzen",
	["Toggle sending messages to the RaidWarnings frame."] = "Nachrichten \195\188ber RaidWarning senden.",
	["Use colors"] = "Farben benutzen",
	["Toggles white only messages ignoring coloring."] = "Nachrichten farbig/wei\195\159 anzeigen.",
	["Message frame scale"] = "Nachrichtenfenster Skalierung",

	["Message frame"] = "Nachrichtenfenster",
	["Show anchor"] = "Verankerung anzeigen",
	["Send messages to RaidWarning frame"] = "Nachrichten \195\188ber RaidWarning senden.",
	["Set the message frame scale."] = "Skalierung des Nachrichtenfensters w\195\164hlen.",
	["Colorize messages"] = "Farbige Nachrichten",
	["Scale"] = "Skalierung",

	["|cffff0000Co|cffff00fflo|cff00ff00r|r"] = "|cffff0000Fa|cffff00ffr|cff00ff00be|r",
	["White"] = "Wei\195\159",
	["BigWigs frame"] = "BigWigs",
	["RaidWarning frame"] = "RaidWarning",
	["Scale is set to %s"] = "Skalierung jetzt: %s",
	["Messages are now sent to the %2$s"] = "Nachrichten werden nun gesendet an: %2$s",
	["Messages are currently sent to the %2$s"] = "Nachrichten werden zur Zeit gesendet an: %2$s",

	["display"] = "anzeige",
	["Display"] = "Anzeige",
	["Set where messages are displayed."] = "W\195\164hle, wo Nachrichten angezeigt werden sollen.",
	["Display is now set to %2$s"] = "Anzeige nun \195\188ber: %2$s",
	["Display is currently set to %2$s"] = "Anzeige zur Zeit \195\188ber: %2$s",

	["Mik's Scrolling Battle Text"] = "MSBT",
	["Scrolling Combat Text"] = "SCT",
	["Floating Combat Text"] = "FCT",

	["Test"] = "Test",
	["Close"] = "Schlie\195\159en",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsMessages = BigWigs:NewModule(L["Messages"])
BigWigsMessages.defaultDB = {
	display = L["BigWigs frame"],
	usecolors = true,
	scale = 1.0,
}
BigWigsMessages.consoleCmd = L["msg"]
BigWigsMessages.consoleOptions = {
	type = "group",
	name = L["Messages"],
	desc = L["Options for the message frame."],
	args   = {
		[L["anchor"]] = {
			type = "execute",
			name = L["Anchor"],
			desc = L["Show the message anchor frame."],
			func = function() BigWigsMessages:BigWigs_ShowAnchors() end,
			disabled = function() return (BigWigsMessages.db.profile.display ~= L["BigWigs frame"]) end,
		},
		[L["color"]] = {
			type = "toggle",
			name = L["Use colors"],
			desc = L["Toggles white only messages ignoring coloring."],
			get = function() return BigWigsMessages.db.profile.usecolors end,
			set = function(v) BigWigsMessages.db.profile.usecolors = v end,
			map = {[true] = L["|cffff0000Co|cffff00fflo|cff00ff00r|r"], [false] = L["White"]},
		},
		[L["scale"]] = {
			type = "range",
			name = L["Message frame scale"],
			desc = L["Set the message frame scale."],
			min = 0.2,
			max = 2.0,
			step = 0.1,
			get = function() return BigWigsMessages.db.profile.scale end,
			set = function(v)
				BigWigsMessages.db.profile.scale = v
				if BigWigsMessages.msgframe then BigWigsMessages.msgframe:SetScale(v) end
			end,
			disabled = function() return (BigWigsMessages.db.profile.display ~= L["BigWigs frame"]) end,
		},
		[L["display"]] = {
			type = "text",
			name = L["Display"],
			desc = L["Set where messages are displayed."],
			get = function() return BigWigsMessages.db.profile.display end,
			validate = {L["BigWigs frame"], L["RaidWarning frame"]},
			set = function(v)
				BigWigsMessages.db.profile.display = v
			end,
			message = L["Display is now set to %2$s"],
			current = L["Display is currently set to %2$s"],
		}
	},
}

------------------------------
--   Optional Dependancies  --
------------------------------

if MikSBT then
	table.insert(BigWigsMessages.consoleOptions.args[L["display"]].validate, L["Mik's Scrolling Battle Text"])
end

if SCT_Display_Message or ( SCT and SCT.DisplayMessage ) then
	table.insert(BigWigsMessages.consoleOptions.args[L["display"]].validate, L["Scrolling Combat Text"])
end

if CombatText_AddMessage then
	table.insert(BigWigsMessages.consoleOptions.args[L["display"]].validate, L["Floating Combat Text"])
end

------------------------------
--      Initialization      --
------------------------------

function BigWigsMessages:OnRegister()
	self:SetupFrames()
	self:CreateMsgFrame()
end


function BigWigsMessages:OnEnable()
	self:RegisterEvent("BigWigs_Message")
	self:RegisterEvent("BigWigs_ShowAnchors")
	self:RegisterEvent("BigWigs_HideAnchors")
end


function BigWigsMessages:CreateMsgFrame()
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
end


------------------------------
--      Event Handlers      --
------------------------------

function BigWigsMessages:BigWigs_ShowAnchors()
	self.frames.anchor:Show()
end


function BigWigsMessages:BigWigs_HideAnchors()
	self.frames.anchor:Hide()
end


function BigWigsMessages:BigWigs_Message(text, color, noraidsay, sound, broadcastonly)
	if not text then return end
	if broadcastonly then return end

	local r, g, b
	if color ~= nil and type(color) == "table" and type(color.r) == "number" and type(color.g) == "number" and type(color.b) == "number" then
		r, g, b = color.r, color.g, color.b
	else
		if self.db.profile.usecolors and type(BigWigsColors) == "table" and type(BigWigsColors.MsgColor) == "function" then
			color = BigWigsColors:MsgColor(color)
		end
		_, r, g, b = paint:GetRGBPercent(color or "white")
	end

	if self.db.profile.display == L["RaidWarning frame"] then
		RaidWarningFrame:AddMessage(text, r, g, b, 1, UIERRORS_HOLD_TIME)
	elseif MikSBT and self.db.profile.display == L["Mik's Scrolling Battle Text"] then
		MikSBT.DisplayMessage(text, MikSBT.DISPLAYTYPE_NOTIFICATION, false, r * 255, g * 255, b * 255)
	elseif SCT_Display_Message and self.db.profile.display == L["Scrolling Combat Text"] then -- SCT 4.x
		local colorStruct = {}
		colorStruct.r, colorStruct.g, colorStruct.b = r, g, b
		SCT_Display_Message( text, colorStruct )
	elseif SCT and SCT_MSG_FRAME and self.db.profile.display == L["Scrolling Combat Text"] then -- SCT 5.x
		SCT_MSG_FRAME:AddMessage( text, r, g, b, 1 )
	elseif CombatText_AddMessage and self.db.profile.display == L["Floating Combat Text"] then -- Blizzards FCT
		CombatText_AddMessage(text, COMBAT_TEXT_SCROLL_FUNCTION, r, g, b, "sticky", nil)
	else -- Default BigWigs Frame fallback
		self.msgframe:AddMessage(text, r, g, b, 1, UIERRORS_HOLD_TIME)
	end
end

------------------------------
--    Create the Anchor     --
------------------------------

function BigWigsMessages:SetupFrames()
	local f, t

	f, _, _ = GameFontNormal:GetFont()

	self.frames = {}
	self.frames.anchor = CreateFrame("Frame", "BigWigsMessageAnchor", UIParent)
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
	self.frames.cheader:SetText(L["Messages"])
	self.frames.cheader:SetTextColor(1, .8, 0)
	self.frames.cheader:ClearAllPoints()
	self.frames.cheader:SetPoint("TOP", self.frames.anchor, "TOP", 0, -10)


	self.frames.leftbutton = CreateFrame("Button", nil, self.frames.anchor)
	self.frames.leftbutton.owner = self
	self.frames.leftbutton:SetWidth(40)
	self.frames.leftbutton:SetHeight(25)
	self.frames.leftbutton:SetPoint("RIGHT", self.frames.anchor, "CENTER", -10, -15)
	self.frames.leftbutton:SetScript( "OnClick", function()  self:TriggerEvent("BigWigs_Test") end )

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
	self.frames.rightbutton:SetScript( "OnClick", function() self:BigWigs_HideAnchors() end )

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

	self:RestorePosition()
end


function BigWigsMessages:SavePosition()
	local f = self.frames.anchor
	local s = f:GetEffectiveScale()

	self.db.profile.posx = f:GetLeft() * s
	self.db.profile.posy = f:GetTop() * s
end


function BigWigsMessages:RestorePosition()
	local x = self.db.profile.posx
	local y = self.db.profile.posy

	if not x or not y then return end

	local f = self.frames.anchor
	local s = f:GetEffectiveScale()

	f:ClearAllPoints()
	f:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / s, y / s)
end
