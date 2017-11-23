--[[
This is a plugin to help mages track their fire vulnerability debuff.
--]]

assert( BigWigs, "BigWigs not found!")

-----------------------------------------------------------------------
--      Are you local?
-----------------------------------------------------------------------
local name = "Scorch Timer"
local L = AceLibrary("AceLocale-2.2"):new("BigWigs"..name)
local paint = AceLibrary("PaintChips-2.0")
local minscale, maxscale = 0.25, 2
local candybar = AceLibrary("CandyBar-2.1")
local surface = AceLibrary("Surface-1.0")


local timer = {
	scorch = 30,
}
local syncName = {
	scorch = "ScorchHit",
}


-----------------------------------------------------------------------
--      Localization
-----------------------------------------------------------------------

L:RegisterTranslations("enUS", function() return {
	["Bars"] = true,

	["Gives timer for Scorch Fire Vulnerability."] = true,
	["Enable"] = true,
	["Enable timers."] = true,
	["Target only"] = true,
	["Only show timer for the current target."] = true,
	["Show the bar anchor frame."] = true,
	["Set the bar scale."] = true,
	["Group upwards"] = true,
	["Toggle bars grow upwards/downwards from anchor."] = true,

	["Timer bars"] = true,
	["Show anchor"] = true,
	["Grow bars upwards"] = true,
	["Scale"] = true,
	["Bar scale"] = true,

	["Bars now grow %2$s"] = true,
	["Scale is set to %2$s"] = true,

	["Up"] = true,
	["Down"] = true,

	["Test"] = true,
	["Close"] = true,

	["Texture"] = true,
	["Set the texture for the timerbars."] = true,

	["Reset position"] = true,
	["Reset the anchor position, moving it to the center of your screen."] = true,
	["Reverse"] = true,
	["Toggles if bars are reversed (fill up instead of emptying)."] = true,

	["ScorchTimer"] = true,

	["Scorch Timer"] = true,

	firevuln_test = "(.+) is afflicted by Fire Vulnerability.",
	scorch_test	= "^Your Scorch (%a%a?)\its (.+) for",
	resist_test = "^Your Fire Vulnerability was resisted by (.+).",
} end)

L:RegisterTranslations("esES", function() return {
	["Bars"] = "Barras",

	["Gives timer for Scorch Fire Vulnerability."] = "Temporizador para vulnerabilidad al fuego de Chamuscar",
	["Enable"] = "Activar",
	["Enable timers."] = "Activa los temporizadores",
	["Target only"] = "Solamente objetivo",
	["Only show timer for the current target."] = "Solamente muestra temporizador para el objetivo actual",
	["Show the bar anchor frame."] = "Muestra el marco de ancla de la barra",
	["Set the bar scale."] = "Define la escala de la barra",
	["Group upwards"] = "Crecer hacia arriba",
	["Toggle bars grow upwards/downwards from anchor."] = "Alterna que las barras crecen hacia arriba/abajo de la ancla",

	["Timer bars"] = "Barras temporizadoras",
	["Show anchor"] = "Mostrar ancla",
	["Grow bars upwards"] = "Crecer las barras hacia arriba",
	["Scale"] = "Escala",
	["Bar scale"] = "Escala de las barras",

	["Bars now grow %2$s"] = "Barras se crecen a %2$s",
	["Scale is set to %2$s"] = "Escala se define a %2$s",

	["Up"] = "Arriba",
	["Down"] = "Abajo",

	["Test"] = "Probar",
	["Close"] = "Cerrar",

	["Texture"] = "Textura",
	["Set the texture for the timerbars."] = "Define la textura para las barras del temporizador",

	["Reset position"] = "Restablecer posición",
	["Reset the anchor position, moving it to the center of your screen."] = "Restablece la posición de la ancla al centro de la pantalla",
	["Reverse"] = "Revertir",
	["Toggles if bars are reversed (fill up instead of emptying)."] = "Alterna si las barras están revertidas (llenar en lugar de vaciar)",

	--["ScorchTimer"] = true,

	["Scorch Timer"] = "Temporizador de Chamuscar",

	firevuln_test = "(.+) está afligido por Vulnerabilidad de Fuego.",
	scorch_test	= "^Tu Chamuscar (%a%a?)\su (.+) para",
	resist_test = "^Tu Vulnerabilidad de Fuego fue resistida por (.+).",
} end)

-----------------------------------------------------------------------
--      Module Declaration
-----------------------------------------------------------------------

local _, englishClass = UnitClass("player");
local isMage = false;
if englishClass == "MAGE" then
	isMage = true
end
BigWigsScorchTimer = BigWigs:NewModule(name)
BigWigsScorchTimer.defaultDB = {
	growup = false,
	scale = 1.0,
	texture = "BantoBar",
	currentonly = false,
	enable = isMage and true or false,

	posx = nil,
	posy = nil,

	duration = 0.5,

	width = nil,
	height = nil,
	reverse = nil,
}

BigWigsScorchTimer.consoleCmd = L["ScorchTimer"]
BigWigsScorchTimer.consoleOptions = {
	type = "group",
	name = L["Scorch Timer"],
	desc = L["Gives timer for Scorch Fire Vulnerability."],
	args   = {
		enable = {
			type = "toggle",
			name = L["Enable"],
			desc = L["Enable timers."],
			order = 1,
			get = function() return BigWigsScorchTimer.db.profile.enable end,
			set = function(v) BigWigsScorchTimer.db.profile.enable = v end,
		},
		currentonly = {
			type = "toggle",
			name = L["Target only"],
			desc = L["Only show timer for the current target."],
			order = 2,
			get = function() return BigWigsScorchTimer.db.profile.currentonly end,
			set = function(v) BigWigsScorchTimer.db.profile.currentonly = v end,
		},
		spacer = {
			type = "header",
			name = " ",
			order = 4,
		},
		anchor = {
			type = "execute",
			name = L["Show anchor"],
			desc = L["Show the bar anchor frame."],
			order = 5,
			func = function() BigWigsScorchTimer:ShowAnchors() end,
		},
		reset = {
			type = "execute",
			name = L["Reset position"],
			desc = L["Reset the anchor position, moving it to the center of your screen."],
			order = 6,
			func = function() BigWigsScorchTimer:ResetAnchor() end,
		},
		spacer2 = {
			type = "header",
			name = " ",
			order = 10,
		},
		growup = {
			type = "toggle",
			name = L["Grow bars upwards"],
			desc = L["Toggle bars grow upwards/downwards from anchor."],
			order = 13,
			get = function() return BigWigsScorchTimer.db.profile.growup end,
			set = function(v)
				BigWigsScorchTimer.db.profile.growup = v
				candybar:SetCandyBarGroupPoint("ScorchTimerGroup", v and "BOTTOM" or "TOP", BigWigsScorchTimer.frames.anchor, v and "TOP" or "BOTTOM", 0, 0)
				candybar:SetCandyBarGroupGrowth("ScorchTimerGroup", v)
			end,
			message = L["Bars now grow %2$s"],
			current = L["Bars now grow %2$s"],
			map = {[true] = L["Up"], [false] = L["Down"]},
		},
		reverse = {
			type = "toggle",
			name = L["Reverse"],
			desc = L["Toggles if bars are reversed (fill up instead of emptying)."],
			order = 14,
			get = function() return BigWigsScorchTimer.db.profile.reverse end,
			set = function(v) BigWigsScorchTimer.db.profile.reverse = v end,
		--passValue = "reverse",
		},
		scale = {
			type = "range",
			name = L["Bar scale"],
			desc = L["Set the bar scale."],
			order = 15,
			min = 0.2,
			max = 2.0,
			step = 0.1,
			get = function() return BigWigsScorchTimer.db.profile.scale end,
			set = function(v) BigWigsScorchTimer.db.profile.scale = v end,
		},
		texture = {
			type = "text",
			name = L["Texture"],
			desc = L["Set the texture for the timerbars."],
			order = 16,
			get = function() return BigWigsScorchTimer.db.profile.texture end,
			set = function(v) BigWigsScorchTimer.db.profile.texture = v end,
			validate = surface:List(),
		},
	},
}

BigWigsScorchTimer.revision = 20001
BigWigsScorchTimer.external = true

BigWigsScorchTimer.target = nil
BigWigsScorchTimer.playerName = nil
BigWigsScorchTimer.impScorch = nil
BigWigsScorchTimer.lastVictim = nil
BigWigsScorchTimer.debuffs = {}
-----------------------------------------------------------------------
--      Initialization
-----------------------------------------------------------------------

function BigWigsScorchTimer:OnRegister()
	self.consoleOptions.args.texture.validate = surface:List()
	self:RegisterEvent("Surface_Registered", function()
		self.consoleOptions.args.texture.validate = surface:List()
	end)
end

function BigWigsScorchTimer:OnEnable()
	self.playerName = UnitName("player")
	if not self.db.profile.texture then self.db.profile.texture = "BantoBar" end
	self.frames = {}
	self:SetupFrames()
	self:RegisterEvent("BigWigs_RecvSync")
	self:RegisterEvent("PLAYER_REGEN_ENABLED")
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	if isMage then
		self:RegisterEvent("CHARACTER_POINTS_CHANGED")
		self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE", "PlayerDamageEvents")
		self:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE", "PlayerDamageEvents")
		self:RegisterEvent("CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF", "PlayerDamageEvents")
		self.impScorch = self:CheckTalents()
	end

	if not self:IsEventRegistered("Surface_Registered") then
		self:RegisterEvent("Surface_Registered", function()
			self.consoleOptions.args[L["Texture"]].validate = surface:List()
		end)
	end

	self.target = UnitName("target")

	self:ThrottleSync(0.2, syncName.scorch)

end

function BigWigsScorchTimer:OnDisable()
	self:HideAnchors()
end

-----------------------------------------------------------------------
--      Event Handlers
-----------------------------------------------------------------------
function BigWigsScorchTimer:PlayerDamageEvents(msg)
	--[[
	local start, ending, victim = string.find(msg, L["firevuln_test"])
	if victim and UnitName("target") == victim then
	--self:DebugMessage("Fire vulne - ".. victim)
	self:StartBar(victim.. " - Fire Vulnerability", 15, "Interface\\Icons\\Spell_Fire_Soulburn")
	return
	end
	]]--
	local start, ending, _, victim = string.find(msg, L["scorch_test"])
	if victim then
		--self:DebugMessage("Scorch - ".. victim)
		self.lastVictim = victim
		self:ScheduleEvent("ScorchTimerDelayedBar", self.DelayedBar, 0.2, self)
	end

	local start, ending, victim = string.find(msg, L["resist_test"])
	if victim then
		--self:DebugMessage("Fire vulne resist - ".. victim)
		if victim == self.lastVictim then
			self:CancelScheduledEvent("ScorchTimerDelayedBar")
		end
	end
end

function BigWigsScorchTimer:DelayedBar()
	if not self.impScorch then
		self.impScorch = self:CheckTalents()
	end
	if self.impScorch then
		self:Sync(syncName.scorch.." "..self.lastVictim)
	end
end

function BigWigsScorchTimer:PLAYER_REGEN_ENABLED()
	self.target = nil
	self:StopAllBars()
	self.debuffs = {}
end

function BigWigsScorchTimer:CHARACTER_POINTS_CHANGED()
	self.impScorch = self:CheckTalents()
end

function BigWigsScorchTimer:RecheckTargetChange()
	local target = UnitName("target")
	if target ~= self.target then
		if self.db.profile.currentonly then
			self:StopAllBars()
		end
		self.target = target
		local victim, timeleft = self:GetTargetInfo()
		if victim and timeleft and self.db.profile.enable then
			self:StartBar(victim, timeleft, "Interface\\Icons\\Spell_Fire_Soulburn")
		end
	end
end
-- reset data if you change your target
function BigWigsScorchTimer:PLAYER_TARGET_CHANGED(msg)
	if not self:IsEventScheduled("ScorchTimerReckeckTargetChange") then
		self:ScheduleEvent("ScorchTimerReckeckTargetChange", self.RecheckTargetChange, 0.1, self)
	end
end

function BigWigsScorchTimer:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.scorch then
		self.debuffs[rest] = GetTime()
		if rest == self.target and self.db.profile.enable then
			self:StartBar(rest, timer.scorch-0.2, "Interface\\Icons\\Spell_Fire_Soulburn")
		end
	end
end

-----------------------------------------------------------------------
--      Util
-----------------------------------------------------------------------
function BigWigsScorchTimer:GetTargetInfo()
	for k, v in pairs(self.debuffs) do
		if k == self.target then
			local timeleft = timer.scorch-(GetTime() - v)-0.2
			if timeleft > 0 then
				return k, timeleft
			end
		end
	end
	return false
end

function BigWigsScorchTimer:CheckTalents()
	nameTalent, icon, tier, column, currRank, maxRank= GetTalentInfo(2,10);
	if nameTalent == "Improved Scorch" and currRank == maxRank then
		--self:DebugMessage(nameTalent .. " - "..currRank .."/"..maxRank)
		return true
	end
	return false
end

function BigWigsScorchTimer:Test()
	self:StartBar("Mob 1", timer.scorch, "Interface\\Icons\\Spell_Fire_Soulburn")
	self:StartBar("Mob 2", timer.scorch/2, "Interface\\Icons\\Spell_Fire_Soulburn")
end

------------------------------
--      Slash Handlers      --
------------------------------

function BigWigsScorchTimer:SetScale(msg, supressreport)
	local scale = tonumber(msg)
	if scale and scale >= minscale and scale <= maxscale then
		self.db.profile.scale = scale
		if not supressreport then self.core:Print(L["Scale is set to %s"], scale) end
	end
end

function BigWigsScorchTimer:ToggleUp(supressreport)
	self.db.profile.growup = not self.db.profile.growup
	local t = self.db.profile.growup
	if not supressreport then self.core:Print(L["Bars now grow %s"], (t and L["Up"] or L["Down"])) end
end

------------------------------
--    Create the Frame     --
------------------------------

function BigWigsScorchTimer:SetupFrames()
	if self.frames.anchor then return end

	local f, t

	f, _, _ = GameFontNormal:GetFont()

	--self.frames = {}

	local frame = CreateFrame("Frame", "ScorchTimerBarAnchor", UIParent)

	--DEFAULT_CHAT_FRAME:AddMessage(frame:GetAttribute("name"))

	frame.owner = self
	frame:Hide()

	frame:SetWidth(175)
	frame:SetHeight(75)
	frame:SetBackdrop({
		bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", tile = true, tileSize = 16,
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 16,
		insets = {left = 4, right = 4, top = 4, bottom = 4},
	})
	frame:SetBackdropBorderColor(.5, .5, .5)
	frame:SetBackdropColor(0,0,0)
	frame:ClearAllPoints()
	frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	frame:EnableMouse(true)
	frame:RegisterForDrag("LeftButton")
	frame:SetMovable(true)
	frame:SetScript("OnDragStart", function() this:StartMoving() end)
	frame:SetScript("OnDragStop", function() this:StopMovingOrSizing() this.owner:SavePosition() end)


	local cfade = frame:CreateTexture(nil, "BORDER")
	cfade:SetWidth(169)
	cfade:SetHeight(25)
	cfade:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
	cfade:SetPoint("TOP", frame, "TOP", 0, -4)
	cfade:SetBlendMode("ADD")
	cfade:SetGradientAlpha("VERTICAL", .1, .1, .1, 0, .25, .25, .25, 1)
	frame.cfade = cfade

	local cheader = frame:CreateFontString(nil,"OVERLAY")
	cheader:SetFont(f, 14)
	cheader:SetWidth(150)
	cheader:SetText(L["Bars"])
	cheader:SetTextColor(1, .8, 0)
	cheader:ClearAllPoints()
	cheader:SetPoint("TOP", frame, "TOP", 0, -10)

	frame.cheader = cheader

	local leftbutton = CreateFrame("Button", nil, frame)
	leftbutton.owner = self
	leftbutton:SetWidth(40)
	leftbutton:SetHeight(25)
	leftbutton:SetPoint("RIGHT", frame, "CENTER", -10, -15)
	leftbutton:SetScript("OnClick", function()  self:Test() end )


	t = leftbutton:CreateTexture()
	t:SetWidth(50)
	t:SetHeight(32)
	t:SetPoint("CENTER", leftbutton, "CENTER")
	t:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
	t:SetTexCoord(0, 0.625, 0, 0.6875)
	leftbutton:SetNormalTexture(t)

	t = leftbutton:CreateTexture(nil, "BACKGROUND")
	t:SetTexture("Interface\\Buttons\\UI-Panel-Button-Down")
	t:SetTexCoord(0, 0.625, 0, 0.6875)
	t:SetAllPoints(leftbutton)
	leftbutton:SetPushedTexture(t)

	t = leftbutton:CreateTexture()
	t:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
	t:SetTexCoord(0, 0.625, 0, 0.6875)
	t:SetAllPoints(leftbutton)
	t:SetBlendMode("ADD")
	leftbutton:SetHighlightTexture(t)
	leftbuttontext = leftbutton:CreateFontString(nil,"OVERLAY")
	leftbuttontext:SetFontObject(GameFontHighlight)
	leftbuttontext:SetText(L["Test"])
	leftbuttontext:SetAllPoints(leftbutton)

	frame.leftbutton = leftbutton

	local rightbutton = CreateFrame("Button", nil, frame)
	rightbutton.owner = self
	rightbutton:SetWidth(40)
	rightbutton:SetHeight(25)
	rightbutton:SetPoint("LEFT", frame, "CENTER", 10, -15)
	rightbutton:SetScript( "OnClick", function() self:HideAnchors() end )


	t = rightbutton:CreateTexture()
	t:SetWidth(50)
	t:SetHeight(32)
	t:SetPoint("CENTER", rightbutton, "CENTER")
	t:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
	t:SetTexCoord(0, 0.625, 0, 0.6875)
	rightbutton:SetNormalTexture(t)

	t = rightbutton:CreateTexture(nil, "BACKGROUND")
	t:SetTexture("Interface\\Buttons\\UI-Panel-Button-Down")
	t:SetTexCoord(0, 0.625, 0, 0.6875)
	t:SetAllPoints(rightbutton)
	rightbutton:SetPushedTexture(t)

	t = rightbutton:CreateTexture()
	t:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
	t:SetTexCoord(0, 0.625, 0, 0.6875)
	t:SetAllPoints(rightbutton)
	t:SetBlendMode("ADD")
	rightbutton:SetHighlightTexture(t)
	rightbuttontext = rightbutton:CreateFontString(nil,"OVERLAY")
	rightbuttontext:SetFontObject(GameFontHighlight)
	rightbuttontext:SetText(L["Close"])
	rightbuttontext:SetAllPoints(rightbutton)

	frame.rightbutton = rightbutton

	self.frames.anchor = frame

	local x = self.db.profile.posx
	local y = self.db.profile.posy
	if x and y then
		local s = self.frames.anchor:GetEffectiveScale()
		self.frames.anchor:ClearAllPoints()
		self.frames.anchor:SetPoint("TOP", UIParent, "TOP", 0, 0)--self.frames.anchor:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / s, y / s)
	else
		self:ResetAnchor("normal")
	end

	local value = self.db.profile.growup or false
	self.frames.anchor.candyBarGroupId = "ScorchTimerGroup"
	candybar:RegisterCandyBarGroup(self.frames.anchor.candyBarGroupId)
	candybar:SetCandyBarGroupPoint(self.frames.anchor.candyBarGroupId, value and "BOTTOM" or "TOP", self.frames.anchor, value and "TOP" or "BOTTOM", 0, 0)
	candybar:SetCandyBarGroupGrowth(self.frames.anchor.candyBarGroupId, value)

	self:RestorePosition()
end

function BigWigsScorchTimer:ResetAnchor(specific)
	if not specific or specific == "reset" or specific == "normal" then
		if not self.frames.anchor then self:SetupFrames() end
		self.frames.anchor:ClearAllPoints()
		self.frames.anchor:SetPoint("CENTER", UIParent, "CENTER")
		self.db.profile.posx = nil
		self.db.profile.posy = nil
	end
end

function BigWigsScorchTimer:SavePosition()
	if not self.frames.anchor then self:SetupFrames() end

	local s = self.frames.anchor:GetEffectiveScale()
	self.db.profile.posx = self.frames.anchor:GetLeft() * s
	self.db.profile.posy = self.frames.anchor:GetTop() * s

end

function BigWigsScorchTimer:RestorePosition()
	local x = self.db.profile.posx
	local y = self.db.profile.posy

	if not x or not y then return end

	local f = self.frames.anchor
	local s = f:GetEffectiveScale()

	f:ClearAllPoints()
	f:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / s, y / s)
end

function BigWigsScorchTimer:Disable()
	self:StopAllBars()
end

function BigWigsScorchTimer:ShowAnchors()
	if not self.frames.anchor then self:SetupFrames() end
	self.frames.anchor:Show()
end

function BigWigsScorchTimer:HideAnchors()
	if not self.frames.anchor then return end
	self.frames.anchor:Hide()
end

local barCache = {
	-- [i] = {text}
	}

function BigWigsScorchTimer:StartBar(text, time, icon)
	if not text or not time then return end
	local id = "ScorchTimerBar "..text
	if not self.frames.anchor then self:SetupFrames() end


	local groupId = self.frames.anchor.candyBarGroupId
	local scale = self.db.profile.scale or 1
	candybar:RegisterCandyBar(id, time, text, icon)
	candybar:RegisterCandyBarWithGroup(id, groupId)
	candybar:SetCandyBarTexture(id, surface:Fetch(self.db.profile.texture))

	if type(colorModule) == "table" then
		local bg = colorModule.db.profile.barBackground
		candybar:SetCandyBarBackgroundColor(id, bg.r, bg.g, bg.b, bg.a)
		local txt = colorModule.db.profile.barTextColor
		candybar:SetCandyBarTextColor(id, txt.r, txt.g, txt.b, txt.a)
	end

	if type(self.db.profile.width) == "number" then
		candybar:SetCandyBarWidth(id, self.db.profile.width)
	end
	if type(self.db.profile.height) == "number" then
		candybar:SetCandyBarHeight(id, self.db.profile.height)
	end

	candybar:SetCandyBarFade(id, .5)
	if self.db.profile.reverse then
		candybar:SetCandyBarReversed(id, self.db.profile.reverse)
	end

	candybar:SetCandyBarScale(id, scale)

	candybar:StartCandyBar(id, true)
	tinsert(barCache,text)
end

function BigWigsScorchTimer:StopBar(text)
	if not text and type(text) ~= "string" then return end
	candybar:UnregisterCandyBar("ScorchTimerBar "..text)
end

function BigWigsScorchTimer:StopAllBars()
	for i=1, table.getn(barCache) do
		BigWigsScorchTimer:StopBar(barCache[i])
	end
	barCache = {}
end
