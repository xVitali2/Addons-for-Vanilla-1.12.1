
assert( BigWigs, "BigWigs not found!")


------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("BigWigsBars")
local paint = AceLibrary("PaintChips-2.0")
local minscale, maxscale = 0.25, 2
local candybar = AceLibrary("CandyBar-2.1")

local surface = AceLibrary("Surface-1.0")

local count = 1

local new, del
do
	local cache = setmetatable({},{__mode="k"})
	function new()
		local t = next(cache)
		if t then
			cache[t] = nil
			return t
		else
			return {}
		end
	end
	function del(t)
		if not t then return nil end
		for k in pairs(t) do
			t[k] = nil
		end
		cache[t] = true
		return nil
	end
end

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["Bars"] = true,

	["bars"] = true,

	["Options for the timer bars."] = true,
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
	["Emphasize"] = true,
	["Emphasize bars that are close to completion (<10sec). Also note that bars started at less than 15 seconds initially will be emphasized right away."] = true,
	["Enable"] = true,
	["Enables emphasizing bars."] = true,
	["Flash"] = true,
	["Flashes the background red for bars that are emphasized."] = true,
	["Move"] = true,
	["Move bars that are emphasized to a second anchor."] = true,
	["Set the scale for emphasized bars."] = true,
	["Emphasize Bars"] = true,
	["Enable IntervalBars"] = true,
	["Keep timers visible untill the timed event happens"] = true,
} end)

L:RegisterTranslations("deDE", function() return {
	["Bars"] = "Anzeigebalken",

	["bars"] = "balken",

	["Options for the timer bars."] = "Optionen für die Timer Anzeigebalken.",
	["Show the bar anchor frame."] = "Verankerung der Anzeigebalken anzeigen.",
	["Set the bar scale."] = "Skalierung der Anzeigebalken wählen.",
	["Group upwards"] = "Nach oben fortsetzen",
	["Toggle bars grow upwards/downwards from anchor."] = "Anzeigebalken von der Verankerung aus nach oben/unten fortsetzen.",

	["Timer bars"] = "Timer Anzeigebalken",
	["Show anchor"] = "Verankerung anzeigen",
	["Grow bars upwards"] = "Anzeigebalken nach oben fortsetzen",
	["Scale"] = "Skalierung",
	["Bar scale"] = "Anzeigebalken Skalierung",

	["Bars now grow %2$s"] = "Anzeigebalken werden nun fortgesetzt nach: %2$s",
	["Scale is set to %2$s"] = "Skalierung jetzt: %2$s",

	["Up"] = "oben",
	["Down"] = "unten",

	["Test"] = "Test",
	["Close"] = "Schlie\195\159en",

	["Texture"] = "Textur",
	["Set the texture for the timerbars."] = "Textur der Anzeigebalken wählen.",




	["Reset position"] = "Position zurücksetzen",
	["Reset the anchor position, moving it to the center of your screen."] = "Die Verankerungsposition zurücksetzen (bewegt die Balken zur Mitte deines Interfaces).",
	["Reverse"] = "Umkehren",
	["Toggles if bars are reversed (fill up instead of emptying)."] = "Legt fest, ob sich die Anzeigebalken füllen oder leeren sollen.",
	["Emphasize"] = "Hervorheben",
	["Emphasize bars that are close to completion (<10sec). Also note that bars started at less than 15 seconds initially will be emphasized right away."] = "Anzeigebalken hervorheben die kurz vor Abschluss sind (<10sek). Anzeigebalken die mit einem Timer von weniger als 15 Sekunden starten werden von Beginn weg als hervorgehobene Balken dargestellt.",
	["Enable"] = "Aktivieren",
	["Enables emphasizing bars."] = "Aktiviert hervorgehobene Anzeigebalken.",
	["Flash"] = "Blinken",
	["Flashes the background red for bars that are emphasized."] = "Lässt den Hintergrund von hervorgehobenen Anzeigebalken rot blinken.",
	["Move"] = "Bewegen",
	["Move bars that are emphasized to a second anchor."] = "Hervorgehobene Anzeigebalken zu einem zweiten Ankerpunkt bewegen.",
	["Set the scale for emphasized bars."] = "Die Skalierung für hervorgehobene Anzeigebalken festlegen.",
	["Emphasize Bars"] = "Hervorgehobene Balken",
} end)

L:RegisterTranslations("esES", function() return {
	["Bars"] = "Barras",

	["bars"] = "bars",

	["Options for the timer bars."] = "Opciones para las barras temporizadoras",
	["Show the bar anchor frame."] = "Muestra el marco de ancla de la barra",
	["Set the bar scale."] = "Define la escala de la barra",
	["Group upwards"] = "Grupo hacia arriba",
	["Toggle bars grow upwards/downwards from anchor."] = "Alterna que las barras crecen hacia arriba/abajo de la ancla",

	["Timer bars"] = "Barras Temporizadoras",
	["Show anchor"] = "Mostrar Ancla",
	["Grow bars upwards"] = "Crecer las barras hacia arriba",
	["Scale"] = "Escala",
	["Bar scale"] = "Escala de la barra",

	["Bars now grow %2$s"] = "Barras crecen %2$s",
	["Scale is set to %2$s"] = "Escala define a %2$s",

	["Up"] = "Arriba",
	["Down"] = "Abajo",

	["Test"] = "Probar",
	["Close"] = "Cerrar",

	["Texture"] = "Textura",
	["Set the texture for the timerbars."] = "Define la textura para las barras temporizadoras",

	["Reset position"] = "Restablecer posición",
	["Reset the anchor position, moving it to the center of your screen."] = "Restablece la posición de la ancla al centro de la pantalla",
	["Reverse"] = "Revertir",
	["Toggles if bars are reversed (fill up instead of emptying)."] = "Alterna si las barras están revertidas",
	["Emphasize"] = "Alerta",
	["Emphasize bars that are close to completion (<10sec). Also note that bars started at less than 15 seconds initially will be emphasized right away."] = "Barras de alerta que casi están completas (<10seg). También nota que las barras que empiezan a menos que 15 segundos estarán enfatizadas primera",
	["Enable"] = "Activar",
	["Enables emphasizing bars."] = "Activa las barras de alerta",
	["Flash"] = "Brillo",
	["Flashes the background red for bars that are emphasized."] = "Brilla al fondo el color rojo para las barras que están enfatizadas",
	["Move"] = "Mover",
	["Move bars that are emphasized to a second anchor."] = "Mueve las barras que están enfatizadas a la ancla segunda",
	["Set the scale for emphasized bars."] = "Define la escala para las barras de alerta",
	["Emphasize Bars"] = "Barras de Alerta",
	["Enable IntervalBars"] = "Activar las Barras de Intervalo",
	["Keep timers visible untill the timed event happens"] = "Se queda visibles los temporizadores hasta que un evento medido occura",
} end)
----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsBars = BigWigs:NewModule(L["Bars"])
BigWigsBars.revision = tonumber(string.sub("$Revision: 20003 $", 12, -3))
BigWigsBars.defaultDB = {
	growup = false,
	scale = 1.0,
	texture = "BantoBar",

	posx = nil,
	posy = nil,

	emphasize = true,
	emphasizeMove = true,
	emphasizeFlash = true,
	emphasizePosX = nil,
	emphasizePosY = nil,
	emphasizeScale = 1.5,
	emphasizeGrowup = false,

	duration = 0.5,

	width = nil,
	height = nil,
	reverse = nil,
	intervalbar = true,
}
BigWigsBars.consoleCmd = L["bars"]

local function getOption(key)
	if key == "anchor" then
		return BigWigsBars.frames.anchor and BigWigsBars.frames.anchor:IsShown()
	else
		return BigWigsBars.db.profile[key]
	end
end
local function setOption(key, value)
	if key == "anchor" then
		if value then
			BigWigsBars:BigWigs_ShowAnchors()
		else
			BigWigsBars:BigWigs_HideAnchors()
		end
	else
		BigWigsBars.db.profile[key] = value
	end
	if key == "growup" and BigWigsBars.frames.anchor then
		BigWigsBars:SetCandyBarGroupPoint("BigWigsGroup", value and "BOTTOM" or "TOP", BigWigsBars.frames.anchor, value and "TOP" or "BOTTOM", 0, 0)
		BigWigsBars:SetCandyBarGroupGrowth("BigWigsGroup", value)
	elseif key == "emphasizeGrowup" and BigWigsBars.frames.emphasizeAnchor then
		BigWigsBars:SetCandyBarGroupPoint("BigWigsEmphasizedGroup", value and "BOTTOM" or "TOP", BigWigsBars.frames.emphasizeAnchor, value and "TOP" or "BOTTOM", 0, 0)
		BigWigsBars:SetCandyBarGroupGrowth("BigWigsEmphasizedGroup", value)
	end
end
local function shouldDisableEmphasizeOption()
	return not BigWigsBars.db.profile.emphasize
end

BigWigsBars.consoleOptions = {
	type = "group",
	name = L["Bars"],
	desc = L["Options for the timer bars."],
	args   = {
		anchor = {
			type = "execute",
			name = L["Show anchor"],
			desc = L["Show the bar anchor frame."],
			order = 1,
			func = function() BigWigsBars:BigWigs_ShowAnchors() end,
		},
		reset = {
			type = "execute",
			name = L["Reset position"],
			desc = L["Reset the anchor position, moving it to the center of your screen."],
			order = 2,
			func = function() BigWigsBars:ResetAnchor() end,
		},
		spacer = {
			type = "header",
			name = " ",
			order = 10,
		},
		intervalbar = {
			type = "toggle",
			name = L["Enable IntervalBars"],
			desc = L["Keep timers visible untill the timed event happens"],
			order = 12,
			get = function() return BigWigsBars.db.profile.intervalbar end,
			set = function(v) BigWigsBars.db.profile.intervalbar = v end,
		},
		growup = {
			type = "toggle",
			name = L["Grow bars upwards"],
			desc = L["Toggle bars grow upwards/downwards from anchor."],
			order = 13,
			get = function() return BigWigsBars.db.profile.growup end,
			set = function(v)
				BigWigsBars.db.profile.growup = v
				BigWigsBars:SetCandyBarGroupPoint("BigWigsGroup", v and "BOTTOM" or "TOP", BigWigsBars.frames.anchor, v and "TOP" or "BOTTOM", 0, 0)
				BigWigsBars:SetCandyBarGroupGrowth("BigWigsGroup", v)
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
			get = function() return BigWigsBars.db.profile.reverse end,
			set = function(v) BigWigsBars.db.profile.reverse = v end,
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
			get = function() return BigWigsBars.db.profile.scale end,
			set = function(v) BigWigsBars.db.profile.scale = v end,
		},
		texture = {
			type = "text",
			name = L["Texture"],
			desc = L["Set the texture for the timerbars."],
			order = 16,
			get = function() return BigWigsBars.db.profile.texture end,
			set = function(v) BigWigsBars.db.profile.texture = v end,
			validate = surface:List(),
		},
		spacer2 = {
			type = "header",
			name = " ",
			order = 20,
		},
		emphasize = {
			type = "group",
			name = L["Emphasize"],
			desc = L["Emphasize bars that are close to completion (<10sec). Also note that bars started at less than 15 seconds initially will be emphasized right away."],
			order = 21,
			args = {
				emphasize = {
					type = "toggle",
					name = L["Enable"],
					desc = L["Enables emphasizing bars."],
					get = function() return BigWigsBars.db.profile.emphasize end,
					set = function(v) BigWigsBars.db.profile.emphasize = v end,
					order = 1,
				},
				growup = {
					type = "toggle",
					name = L["Grow bars upwards"],
					desc = L["Toggle bars grow upwards/downwards from anchor."],
					order = 2,
					get = function() return BigWigsBars.db.profile.emphasizeGrowup end,
					set = function(v)
						BigWigsBars.db.profile.emphasizeGrowup = v
						BigWigsBars:SetCandyBarGroupPoint(BigWigsBars.frames.emphasizeAnchor.candyBarGroupId, v and "BOTTOM" or "TOP", BigWigsBars.frames.emphasizeAnchor, v and "TOP" or "BOTTOM", 0, 0)
						BigWigsBars:SetCandyBarGroupGrowth(BigWigsBars.frames.emphasizeAnchor.candyBarGroupId, v)
					end,
					disabled = shouldDisableEmphasizeOption,
				},
				flash = {
					type = "toggle",
					name = L["Flash"],
					desc = L["Flashes the background red for bars that are emphasized."],
					get = function() return BigWigsBars.db.profile.emphasizeFlash end,
					set = function(v) BigWigsBars.db.profile.emphasizeFlash = v end,
					disabled = shouldDisableEmphasizeOption,
					order = 3,
				},
				move = {
					type = "toggle",
					name = L["Move"],
					desc = L["Move bars that are emphasized to a second anchor."],
					get = function() return BigWigsBars.db.profile.emphasizeMove end,
					set = function(v) BigWigsBars.db.profile.emphasizeMove = v end,
					disabled = shouldDisableEmphasizeOption,
					order = 4,
				},
				scale = {
					type = "range",
					name = L["Bar scale"],
					desc = L["Set the scale for emphasized bars."],
					min = 0.2,
					max = 2.0,
					step = 0.1,
					get = function() return BigWigsBars.db.profile.emphasizeScale end,
					set = function(v) BigWigsBars.db.profile.emphasizeScale = v end,
					disabled = function()
						if not BigWigsBars.db.profile.emphasizeMove then return true end
						return shouldDisableEmphasizeOption()
					end,
					order = 5,
				},
			},
		},
	},
}


------------------------------
--      Initialization      --
------------------------------

function BigWigsBars:OnRegister()
	self.consoleOptions.args.texture.validate = surface:List()
	self:RegisterEvent("Surface_Registered", function()
		self.consoleOptions.args.texture.validate = surface:List()
	end)
end

function BigWigsBars:OnEnable()
	if not surface:Fetch(self.db.profile.texture) then self.db.profile.texture = "BantoBar" end
	self.frames = {}
	self:SetupFrames()
	self:SetupFrames(true)
	self:RegisterEvent("BigWigs_ShowAnchors")
	self:RegisterEvent("BigWigs_HideAnchors")
	self:RegisterEvent("BigWigs_StartBar")
	self:RegisterEvent("BigWigs_StopBar")
	self:RegisterEvent("BigWigs_StartCounterBar")
	self:RegisterEvent("BigWigs_StopCounterBar")
	self:RegisterEvent("BigWigs_SetCounterBar")
	self:RegisterEvent("BigWigs_StartHPBar")
	self:RegisterEvent("BigWigs_StopHPBar")
	self:RegisterEvent("BigWigs_SetHPBar")
	self:RegisterEvent("BigWigs_StartIntervalBar")
	if not self:IsEventRegistered("Surface_Registered") then
		self:RegisterEvent("Surface_Registered", function()
			self.consoleOptions.args[L["Texture"]].validate = surface:List()
		end)
	end

	if self.frames.emphasizeAnchor then
		self.frames.emphasizeAnchor.flashTimers = new()
		self.frames.emphasizeAnchor.emphasizeTimers = new()
		self.frames.emphasizeAnchor.moduleBars = new()
		self.frames.emphasizeAnchor.movingBars = new()
	end
end

function BigWigsBars:OnDisable()
	self:BigWigs_HideAnchors()

	if self.frames.emphasizeAnchor then
		self.frames.emphasizeAnchor.flashTimers = del(self.frames.emphasizeAnchor.flashTimers)
		self.frames.emphasizeAnchor.emphasizeTimers = del(self.frames.emphasizeAnchor.emphasizeTimers)
		self.frames.emphasizeAnchor.moduleBars = del(self.frames.emphasizeAnchor.moduleBars)
		self.frames.emphasizeAnchor.movingBars = del(self.frames.emphasizeAnchor.movingBars)
	end
end


------------------------------
--      Event Handlers      --
------------------------------
local barCache = {
	-- [i] = {text, module}
	}
function BigWigsBars:Disable(module)
	if self.frames.emphasizeAnchor and self.frames.emphasizeAnchor.moduleBars[module] then
		if self.frames.emphasizeAnchor.emphasizeTimers[module] then
			for k, v in pairs(self.frames.emphasizeAnchor.emphasizeTimers[module]) do
				self:CancelScheduledEvent(v)
				self.frames.emphasizeAnchor.emphasizeTimers[module][k] = nil
			end
		end

		if self.frames.emphasizeAnchor.flashTimers[module] then
			for k, v in pairs(self.frames.emphasizeAnchor.flashTimers[module]) do
				self:CancelScheduledEvent(v)
				self.frames.emphasizeAnchor.flashTimers[module][k] = nil
			end
		end

		for k in pairs(self.frames.emphasizeAnchor.moduleBars[module]) do
			if self.frames.emphasizeAnchor.movingBars[k] then
				self.frames.emphasizeAnchor.movingBars[k] = del(self.frames.emphasizeAnchor.movingBars[k])
			end
			self:UnregisterCandyBar(k)
			self.frames.emphasizeAnchor.moduleBars[module][k] = nil
		end

		if not next(self.frames.emphasizeAnchor.movingBars) then
			self:CancelScheduledEvent("BigWigsBarMover")
		end
	else
		for i=1, table.getn(barCache) do
			BigWigsBars:BigWigs_StopBar(barCache[i][2], barCache[i][1])
		end
		barCache = {}
	end
end

function BigWigsBars:Ace2_AddonDisabled(module)
	BigWigsBars:Disable(module)
end

function BigWigsBars:BigWigs_ShowAnchors()
	if not self.frames.anchor then self:SetupFrames() end
	self.frames.anchor:Show()

	if self.db.profile.emphasize and self.db.profile.emphasizeMove then
		if not self.frames.emphasizeAnchor then self:SetupFrames(true) end
		self.frames.emphasizeAnchor:Show()
	end
end


function BigWigsBars:BigWigs_HideAnchors()
	if not self.frames.anchor then return end
	self.frames.anchor:Hide()

	if self.frames.emphasizeAnchor then
		self.frames.emphasizeAnchor:Hide()
	end
end


function BigWigsBars:BigWigs_StartBar(module, text, time, icon, otherc, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10)
	if not text or not time then return end
	local id = "BigWigsBar "..text
	if not self.frames.anchor then self:SetupFrames() end

	if self.frames.emphasizeAnchor then
		if not self.frames.emphasizeAnchor.moduleBars[module] then
			self.frames.emphasizeAnchor.moduleBars[module] = {}
		end
		self.frames.emphasizeAnchor.moduleBars[module][id] = true
	end

	local bc, balpha, txtc
	if BigWigsColors and type(BigWigsColors) == "table" then
		if type(otherc) ~= "boolean" or not otherc then c1, c2, c3, c4, c5, c6, c7, c8, c9, c10 = BigWigsColors:BarColor(time) end
	end

	local groupId = self.frames.anchor.candyBarGroupId
	local scale = self.db.profile.scale or 1
	if self.frames.emphasizeAnchor and self.db.profile.emphasize and (self.db.profile.emphasizeMove or self.db.profile.emphasizeFlash) then
		-- If the bar is started at more than 15 seconds, it won't be emphasized
		-- right away, but if it's started at 15 or less, it will be.
		if time > 15 then
			if count == 100 then count = 1 end
			if self.db.profile.emphasizeMove then
				if not self.frames.emphasizeAnchor.emphasizeTimers[module] then self.frames.emphasizeAnchor.emphasizeTimers[module] = {} end
				if self.frames.emphasizeAnchor.emphasizeTimers[module][id] then self:CancelScheduledEvent(self.frames.emphasizeAnchor.emphasizeTimers[module][id]) end
				self.frames.emphasizeAnchor.emphasizeTimers[module][id] = string.format("%s%d", "BigWigs-EmphasizeBar-", count)
				count = count + 1
				self:ScheduleEvent(self.frames.emphasizeAnchor.emphasizeTimers[module][id], self.EmphasizeBar, time - 10, self, module, id)
			end
			if self.db.profile.emphasizeFlash then
				if not self.frames.emphasizeAnchor.flashTimers[module] then self.frames.emphasizeAnchor.flashTimers[module] = {} end
				if self.frames.emphasizeAnchor.flashTimers[module][id] then self:CancelScheduledEvent(self.frames.emphasizeAnchor.flashTimers[module][id]) end
				self.frames.emphasizeAnchor.flashTimers[module][id] = string.format("%s%d", "BigWigs-FlashBar-", count)
				count = count + 1
				self:ScheduleEvent(self.frames.emphasizeAnchor.flashTimers[module][id], self.FlashBar, time - 10, self, module, id)
			end
		else
			-- Since it's 15 or less, just start it at the emphasized group
			-- right away.
			if self.db.profile.emphasizeMove then
				groupId = self.frames.emphasizeAnchor.candyBarGroupId
				if not self.frames.emphasizeAnchor then self:SetupFrames(true) end
				scale = self.db.profile.emphasizeScale or 1
			end
			if self.db.profile.emphasizeFlash then
				self:FlashBar(module, id)
			end
		end
	end

	-- When using the emphasize option, custom bar groups from the modules are
	-- not used when the bar reaches 10 seconds left, but moved to the
	-- emphasized group regardless of custom groups.
	if groupId == self.frames.anchor.candyBarGroupId and type(module.GetBarGroupId) == "function" then
		groupId = module:GetBarGroupId(text)
	end

	self:RegisterCandyBar(id, time, text, icon, c1, c2, c3, c4, c5, c6, c8, c9, c10)
	self:RegisterCandyBarWithGroup(id, groupId)
	self:SetCandyBarTexture(id, surface:Fetch(self.db.profile.texture))

	if type(BigWigsColors) == "table" then
		local bg = BigWigsColors.db.profile.bgc
		local bga = BigWigsColors.db.profile.bga
		if bg and bga then
			self:SetCandyBarBackgroundColor(id, bg, bga)
		end
		local txt = BigWigsColors.db.profile.txtc
		if txt then
			self:SetCandyBarTextColor(id, txt)
		end
	end

	if type(self.db.profile.width) == "number" then
		self:SetCandyBarWidth(id, self.db.profile.width)
	end
	if type(self.db.profile.height) == "number" then
		self:SetCandyBarHeight(id, self.db.profile.height)
	end

	self:SetCandyBarFade(id, .5)
	if self.db.profile.reverse then
		self:SetCandyBarReversed(id, self.db.profile.reverse)
	end

	self:SetCandyBarScale(id, scale)

	self:StartCandyBar(id, true)
	tinsert(barCache,{text, module})
	--[[
	local function OnBarClick(id)
	local exists, time, elapsed, running, paused = self:CandyBarStatus(id)
	if exists then
	BigWigs:TriggerEvent("BigWigs_Message", id .. " in " .. time .. "s", "Urgent", false, nil, true)
	end
	end

	self:SetCandyBarOnClick(id, OnBarClick, id)
	]]
end

function BigWigsBars:BigWigs_StopBar(module, text)
	if not text and type(text) ~= "string" then return end
	if self.frames.emphasizeAnchor and self.frames.emphasizeAnchor.moduleBars[module] then
		local id = "BigWigsBar "..text

		if self.frames.emphasizeAnchor.movingBars[id] then
			self.frames.emphasizeAnchor.movingBars[id] = del(self.frames.emphasizeAnchor.movingBars[id])
		end

		if not next(self.frames.emphasizeAnchor.movingBars) then
			self:CancelScheduledEvent("BigWigsBarMover")
		end

		if self.frames.emphasizeAnchor.emphasizeTimers[module] and self.frames.emphasizeAnchor.emphasizeTimers[module][id] then
			self:CancelScheduledEvent(self.frames.emphasizeAnchor.emphasizeTimers[module][id])
			self.frames.emphasizeAnchor.emphasizeTimers[module][id] = nil
		end

		if self.frames.emphasizeAnchor.flashTimers[module] and self.frames.emphasizeAnchor.flashTimers[module][id] then
			self:CancelScheduledEvent(self.frames.emphasizeAnchor.flashTimers[module][id])
			self.frames.emphasizeAnchor.flashTimers[module][id] = nil
		end

		self:UnregisterCandyBar(id)
		self.frames.emphasizeAnchor.moduleBars[module][id] = nil
	end

	module:UnregisterCandyBar("BigWigsBar "..text)
end

function BigWigsBars:GetBarStatus(module, text)
	local id = "BigWigsBar " .. text
	local registered, time, elapsed, running = self:CandyBarStatus(id)
	return registered, time, elapsed, running
end

local counterBarCache = {
	-- [i] = {text, module}
	}
function BigWigsBars:BigWigs_StartCounterBar(module, text, max, icon, bar, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10)
	if not text then return end
	local id = "BigWigsBar "..text
	BigWigsBars:BigWigs_StartBar(module, text, max, icon, bar, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10)
	module:PauseCandyBar(id)
	module:SetCandyBarTimeFormat(id, function(t) return string.format("%d", t) end)
	tinsert(counterBarCache,{text, module})
end

function BigWigsBars:BigWigs_StopCounterBar(module, text)
	if not text then return end
	BigWigsBars:BigWigs_StopBar(module, text)
end

function BigWigsBars:BigWigs_SetCounterBar(module, text, value)
	if (not text) or (value == nil) or (value < 0) then return end
	local id = "BigWigsBar "..text
	local bar = candybar.var.handlers[id]
	if not bar then return end
	bar.elapsed = value
	candybar:Update(id)
	if bar.time <= value then
		BigWigsBars:BigWigs_StopBar(module, text)
	end
end

function BigWigsBars:BigWigs_HideCounterBars()
	-- forces to hide all counter bars cached, used on bosskills
	for i=1, table.getn(counterBarCache) do
		BigWigsBars:BigWigs_StopCounterBar(counterBarCache[i][2], counterBarCache[i][1])
	end

	counterBarCache = {}
end

function BigWigsBars:BigWigs_StartHPBar(module, text, max, bar, icon, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10)
	if not text then return end
	local id = "BigWigsBar "..text
	BigWigsBars:BigWigs_StartBar(module, text, max, bar, icon, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10)
	module:PauseCandyBar(id)
	module:SetCandyBarTimeFormat(id, function(t) local timetext if t == 100 then timetext = "100" elseif t == 0 then timetext = "0%%" else timetext = string.format("%d", t) end return timetext end)
end

function BigWigsBars:BigWigs_StopHPBar(module, text)
	if not text then return end
	BigWigsBars:BigWigs_StopBar(module, text)
end


function BigWigsBars:BigWigs_SetHPBar(module, text, value)
	if (not text) or (value == nil) or (value < 0) then return end
	local id = "BigWigsBar "..text
	local bar = candybar.var.handlers[id]
	if not bar then return end
	bar.elapsed = value
	candybar:Update(id)
	if bar.time <= value then
		BigWigsBars:BigWigs_StopBar(module, text)
	end
end

function BigWigsBars:BigWigs_StartIntervalBar(module, text, intervalMin, intervalMax, icon, otherColor, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10)
	self:TriggerEvent("BigWigs_StartBar", self, text, intervalMin, icon, otherColor, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10)
	if self.db.profile.intervalbar then
		self:SetCandyBarFade("BigWigsBar "..text, intervalMax-intervalMin)
	end
end

-----------------------------------------------------------------------
--    Emphasized Background Flashing
-----------------------------------------------------------------------
local flashColors
local generateColors
do
	local function ColorGradient(perc, r1,g1,b1, r2,g2,b2)
		if perc >= 1 then
			return r2,g2,b2
		elseif perc <= 0 then
			return r1,g1,b1
		end
		return r1 + (r2-r1)*perc, g1 + (g2-g1)*perc, b1 + (b2-b1)*perc
	end
	generateColors = function()
		flashColors = {}
		for i = 0.1, 1, 0.1 do
			local r, g, b = ColorGradient(i, 1,0,0, 0,0,0)
			table.insert(flashColors, {r, g, b, 0.5})
		end
	end
end

local flashBarUp, flashBarDown

local currentColor = {}
local function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end
flashBarUp = function(id)
	--self:SetCandyBarBackgroundColor(id, bg.r, bg.g, bg.b, bg.a)
	local r, g, b, a = unpack(flashColors[currentColor[id]])
	--BigWigsBars:SetCandyBarBackgroundColor(id, unpack(flashColors[currentColor[id]]))
	BigWigsBars:SetCandyBarBackgroundColorRGB(id, r, g, b, a)
	--if currentColor[id] == #flashColors then
	if currentColor[id] == tablelength(flashColors) then
		BigWigsBars:ScheduleRepeatingEvent(id, flashBarDown, 0.1, id)
		return
	end
	currentColor[id] = currentColor[id] + 1
end
flashBarDown = function(id)
	local r, g, b, a = unpack(flashColors[currentColor[id]])
	--BigWigsBars:SetCandyBarBackgroundColor(id, unpack(flashColors[currentColor[id]]))
	BigWigsBars:SetCandyBarBackgroundColorRGB(id, r, g, b, a)
	if currentColor[id] == 1 then
		BigWigsBars:ScheduleRepeatingEvent(id, flashBarUp, 0.1, id)
		return
	end
	currentColor[id] = currentColor[id] - 1
end

function BigWigsBars:FlashBar(module, id)
	if not flashColors then generateColors() end
	if self.frames.emphasizeAnchor and self.frames.emphasizeAnchor.flashTimers[module] then self.frames.emphasizeAnchor.flashTimers[module][id] = nil end
	-- Start flashing the bar
	currentColor[id] = 1
	self:ScheduleRepeatingEvent(id, flashBarUp, 0.1, id)
	self:ScheduleEvent(self.CancelScheduledEvent, 10, self, id)
end

-----------------------------------------------------------------------
--    Smooth Moving of Emphasized Bars
-----------------------------------------------------------------------

-- copied from PitBull_BarFader
local function CosineInterpolate(y1, y2, mu)
	local mu2 = (1-math.cos(mu*math.pi))/2
	return y1*(1-mu2)+y2*mu2
end

function BigWigsBars:UpdateBars()
	local now, count = GetTime(), 0

	if self.frames.emphasizeAnchor then
		for bar, opt in pairs(self.frames.emphasizeAnchor.movingBars) do
			local stop, scale = opt.stop
			count = count + 1
			if stop < now then
				self.frames.emphasizeAnchor.movingBars[bar] = del(self.frames.emphasizeAnchor.movingBars[bar])
				self:RegisterCandyBarWithGroup(bar, self.frames.emphasizeAnchor.candyBarGroupId)
				self:SetCandyBarScale(bar, self.db.profile.emphasizeScale or 1)
				return
			end

			local centerX, centerY = self:GetCandyBarCenter(bar)
			if type(centerX) == "number" and type(centerY) == "number" then
				local effscale = self:GetCandyBarEffectiveScale(bar)
				local tempX, tempY = centerX*effscale, centerY*effscale

				tempX = CosineInterpolate(tempX, opt.targetX, 1 - ((stop - now) / self.db.profile.duration) )
				tempY = CosineInterpolate(tempY, opt.targetY, 1 - ((stop - now) / self.db.profile.duration) )
				scale = (opt.stopScale - opt.startScale) * (1 - ((stop - now) / self.db.profile.duration))

				self:SetCandyBarScale(bar, scale + opt.startScale)
				effscale = self:GetCandyBarEffectiveScale(bar)

				local point, rframe, rpoint = self:GetCandyBarPoint(bar)
				self:SetCandyBarPoint(bar, point, rframe, rpoint, tempX/effscale, tempY/effscale)
			end
		end
	end

	if count == 0 then
		self:CancelScheduledEvent("BigWigsBarMover")
	end
end

function BigWigsBars:EmphasizeBar(module, id)
	local centerX, centerY = self:GetCandyBarCenter(id)
	if type(centerX) ~= "number" or type(centerY) ~= "number" then return end

	if self.frames.emphasizeAnchor and self.frames.emphasizeAnchor.emphasizeTimers[module] then
		self.frames.emphasizeAnchor.emphasizeTimers[module][id] = nil
	end

	if not self.frames.emphasizeAnchor then self:SetupFrames(true) end

	if not self:IsEventScheduled("BigWigsBarMover") then
		self:ScheduleRepeatingEvent("BigWigsBarMover", self.UpdateBars, 0, self)
	end

	self:UnregisterCandyBarWithGroup(id, self.frames.anchor.candyBarGroupId)
	self:SetCandyBarPoint(id, "CENTER", "UIParent", "BOTTOMLEFT", centerX, centerY)

	local targetX, targetY = self:GetCandyBarNextBarPointInGroup(self.frames.emphasizeAnchor.candyBarGroupId)

	local db = self.db.profile
	local u = db.emphasizeGrowup

	local _, offsetTop, offsetBottom = self:GetCandyBarOffsets(id)
	local offsetY = u and centerY - offsetBottom or centerY - offsetTop

	local frameX = self.frames.emphasizeAnchor:GetCenter()
	local frameY = u and self.frames.emphasizeAnchor:GetTop() or self.frames.emphasizeAnchor:GetBottom()
	local frameScale = self.frames.emphasizeAnchor:GetEffectiveScale()

	self.frames.emphasizeAnchor.movingBars[id] = new()
	self.frames.emphasizeAnchor.movingBars[id].stop = GetTime() + self.db.profile.duration
	self.frames.emphasizeAnchor.movingBars[id].targetX = (targetX * (UIParent:GetEffectiveScale() * db.emphasizeScale or 1)) + (frameX * frameScale)
	self.frames.emphasizeAnchor.movingBars[id].targetY = (targetY * (UIParent:GetEffectiveScale() * db.emphasizeScale or 1)) + ((frameY + offsetY) * frameScale)
	self.frames.emphasizeAnchor.movingBars[id].startScale = db.scale or 1
	self.frames.emphasizeAnchor.movingBars[id].stopScale = db.emphasizeScale or 1
end

------------------------------
--      Slash Handlers      --
------------------------------

function BigWigsBars:SetScale(msg, supressreport)
	local scale = tonumber(msg)
	if scale and scale >= minscale and scale <= maxscale then
		self.db.profile.scale = scale
		if not supressreport then self.core:Print(L["Scale is set to %s"], scale) end
	end
end

function BigWigsBars:ToggleUp(supressreport)
	self.db.profile.growup = not self.db.profile.growup
	local t = self.db.profile.growup
	if not supressreport then self.core:Print(L["Bars now grow %s"], (t and L["Up"] or L["Down"])) end
end


------------------------------
--    Create the Anchor     --
------------------------------

function BigWigsBars:SetupFrames(emphasize)
	if not self.db.profile.emphasize and self.frames.anchor then return end
	if self.db.profile.emphasize and self.frames.emphasizeAnchor then return end

	local f, t

	f, _, _ = GameFontNormal:GetFont()

	--self.frames = {}

	local frame = CreateFrame("Frame", emphasize and "BigWigsEmphasizedBarAnchor" or "BigWigsBarAnchor", UIParent)

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
	leftbutton:SetScript("OnClick", function()  self:TriggerEvent("BigWigs_Test") end )


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
	rightbutton:SetScript( "OnClick", function() self:BigWigs_HideAnchors() end )


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

	if emphasize then
		self.frames.emphasizeAnchor = frame
		self.frames.emphasizeAnchor.cheader:SetText(L["Emphasize Bars"])

		local x = self.db.profile.emphasizePosX
		local y = self.db.profile.emphasizePosY
		if x and y then
			local scale = self.frames.emphasizeAnchor:GetEffectiveScale()
			self.frames.emphasizeAnchor:ClearAllPoints()
			self.frames.emphasizeAnchor:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / scale, y / scale)
		else
			self:ResetAnchor("emphasize")
		end

		local value = self.db.profile.emphasizeGrowup
		self.frames.emphasizeAnchor.candyBarGroupId = "BigWigsEmphasizedGroup"
		self:RegisterCandyBarGroup(self.frames.emphasizeAnchor.candyBarGroupId)
		self:SetCandyBarGroupPoint(self.frames.emphasizeAnchor.candyBarGroupId, value and "BOTTOM" or "TOP", self.frames.emphasizeAnchor, value and "TOP" or "BOTTOM", 0, 0)
		self:SetCandyBarGroupGrowth(self.frames.emphasizeAnchor.candyBarGroupId, value)

		self.frames.emphasizeAnchor.flashTimers = new()
		self.frames.emphasizeAnchor.emphasizeTimers = new()
		self.frames.emphasizeAnchor.moduleBars = new()
		self.frames.emphasizeAnchor.movingBars = new()
	else
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

		local value = self.db.profile.growup
		self.frames.anchor.candyBarGroupId = "BigWigsGroup"
		self:RegisterCandyBarGroup(self.frames.anchor.candyBarGroupId)
		self:SetCandyBarGroupPoint(self.frames.anchor.candyBarGroupId, value and "BOTTOM" or "TOP", self.frames.anchor, value and "TOP" or "BOTTOM", 0, 0)
		self:SetCandyBarGroupGrowth(self.frames.anchor.candyBarGroupId, value)
	end

	self:RestorePosition()
end

function BigWigsBars:ResetAnchor(specific)
	if not specific or specific == "reset" or specific == "normal" then
		if not self.frames.anchor then self:SetupFrames() end
		self.frames.anchor:ClearAllPoints()
		if self.db.profile.emphasize and self.db.profile.emphasizeMove then
			self.frames.anchor:SetPoint("TOP", UIParent, "TOP", 0, 0)
		else
			self.frames.anchor:SetPoint("CENTER", UIParent, "CENTER")
		end
		self.db.profile.posx = nil
		self.db.profile.posy = nil
	end

	if (not specific or specific == "reset" or specific == "emphasize") and self.db.profile.emphasize and self.db.profile.emphasizeMove then
		if not self.frames.emphasizeAnchor then self:SetupFrames(true) end
		self.frames.emphasizeAnchor:ClearAllPoints()
		self.frames.emphasizeAnchor:SetPoint("CENTER", UIParent, "CENTER")
		self.db.profile.emphasizePosX = nil
		self.db.profile.emphasizePosY = nil
	end
end

function BigWigsBars:SavePosition()
	if not self.frames.anchor then self:SetupFrames() end

	local s = self.frames.anchor:GetEffectiveScale()
	self.db.profile.posx = self.frames.anchor:GetLeft() * s
	self.db.profile.posy = self.frames.anchor:GetTop() * s

	if self.db.profile.emphasize and self.db.profile.emphasizeMove then
		if not self.frames.emphasizeAnchor then self:SetupFrames(true) end
		s = self.frames.emphasizeAnchor:GetEffectiveScale()
		self.db.profile.emphasizePosX = self.frames.emphasizeAnchor:GetLeft() * s
		self.db.profile.emphasizePosY = self.frames.emphasizeAnchor:GetTop() * s
	end
end


function BigWigsBars:RestorePosition()
	local x = self.db.profile.posx
	local y = self.db.profile.posy

	if not x or not y then return end

	local f = self.frames.anchor
	local s = f:GetEffectiveScale()

	f:ClearAllPoints()
	f:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x / s, y / s)
end
