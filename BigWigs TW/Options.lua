
assert(BigWigs, "BigWigs not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("BigWigsOptions")
local tablet = AceLibrary("Tablet-2.0")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["|cff00ff00Module running|r"] = true,
	["|cffeda55fClick|r to reset all running modules. |cffeda55fCtrl+Click|r to force reboot for everyone (Requires assistant or higher). |cffeda55fAlt+Click|r to disable them. |cffeda55fCtrl+Alt+Click|r to disable Big Wigs completely."] = true,
	["|cffeda55fClick|r to enable."] = true,
	["Big Wigs is currently disabled."] = true,
	["Active boss modules"] = true,
	["hidden"] = true,
	["shown"] = true,
	["minimap"] = true,
	["Minimap"] = true,
	["Toggle the minimap button."] = true,
	["All running modules have been reset."] = true,
	["All running modules have been rebooted for all raid members."] = true,
	["All running modules have been disabled."] = true,
	["%s reset."] = true,
	["%s disabled."] = true,
	["%s icon is now %s."] = true,
	["Show it again with /bw plugin minimap."] = true,
	["You need to be an assistant or raid leader to use this function."] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
	["|cff00ff00Module running|r"] = "|cff00ff00Модуль запущен|r",
	["|cffeda55fClick|r to reset all running modules. |cffeda55fCtrl+Click|r to force reboot for everyone (Requires assistant or higher). |cffeda55fAlt+Click|r to disable them. |cffeda55fCtrl+Alt+Click|r to disable Big Wigs completely."] = "|cffeda55fЩёлкните|r, чтобы сбросить все запущенные модули. |cffeda55fCtrl+Левый Клик|r - для принудительной перезагрузки (Требуется  помощник или выше). |cffeda55fAlt+Левый Клик|r - чтобы отключить их. |cffeda55fCtrl+Alt+Левый клик|r - чтобы отключить Big Wigs полностью.",
	["|cffeda55fClick|r to enable."] = "|cffeda55fШёлкните|r, чтобы включить.",
	["Big Wigs is currently disabled."] = "Big Wigs в данный момент отключен",
	["Active boss modules"] = "Активные модули боссов:",
	["hidden"] = "скрыт",
	["shown"] = "отображен",
	["Minimap"] = "Мини-карта",
	["Toggle the minimap button."] = "Вкл/Выкл кнопку у мини-карты",
	["All running modules have been reset."] = "Все запущенные модули сброшены",
	["All running modules have been rebooted for all raid members."] = "Все запущенные модули перезагружены для всех членов рейда.",
	["All running modules have been disabled."] = "Все запущенные модули отключены",
	["%s reset."] = "%s сброшен.",
	["%s disabled."] = "%s отключен.",
	["%s icon is now %s."] = "Значок на %s %s.",
	["Show it again with /bw plugin minimap."] = "Чтобы вновь отобразить кнопку, введите команду /bw plugin minimap",
	["You need to be an assistant or raid leader to use this function."] = "Вам нужно быть помощником или рейд лидером для использования этой возможности.",
} end)

L:RegisterTranslations("esES", function() return {
	["|cff00ff00Module running|r"] = "|cff00ff00Módulo activado|r",
	["|cffeda55fClick|r to reset all running modules. |cffeda55fCtrl+Click|r to force reboot for everyone (Requires assistant or higher). |cffeda55fAlt+Click|r to disable them. |cffeda55fCtrl+Alt+Click|r to disable Big Wigs completely."] = "|cffeda55fHaz Clic|r para reiniciar todos los módulos activos. |cffeda55fCtrl+Clic|r para reiniciar para todos (Requiere asistente o líder). |cffeda55fAlt+Clic|r para desactivarlos. |cffeda55fCtrl+Alt+Clic|r para desactivar Big Wigs.",
	["|cffeda55fClick|r to enable."] = "|cffeda55fHaz Clic|r para activar.",
	["Big Wigs is currently disabled."] = "Big Wigs está desactivo",
	["Active boss modules"] = "Módulos de Jefe Activos",
	--["hidden"] = "oculto",
	--["shown"] = "mostrado",
	--["minimap"] = "minimapa",
	["Minimap"] = "Minimapa",
	["Toggle the minimap button."] = "Alterna el botón del minimapa",
	["All running modules have been reset."] = "Todos los módulos activos fueron reiniciados",
	["All running modules have been rebooted for all raid members."] = "Todos los módulos activos fueros reiniciados para todos los miembros de la banda",
	["All running modules have been disabled."] = "Todos los módulos activos fueron desactivados",
	["%s reset."] = "%s Reiniciado",
	["%s disabled."] = "%s Desactivado",
	["%s icon is now %s."] = "el icono %s ahora es %s.",
	["Show it again with /bw plugin minimap."] = "Mostrar con /bw plugin minimap",
	["You need to be an assistant or raid leader to use this function."] = "Tienes que ser asistente o líder para usar la función",
} end)

L:RegisterTranslations("deDE", function() return {
	["|cff00ff00Module running|r"] = "|cff00ff00Modul aktiviert|r",
	["|cffeda55fClick|r to reset all running modules. |cffeda55fCtrl+Click|r to force reboot for everyone (Requires assistant or higher). |cffeda55fAlt+Click|r to disable them. |cffeda55fCtrl+Alt+Click|r to disable Big Wigs completely."] = "|cffeda55fKlicken|r, um alle laufenden Module zurückzusetzen. |cffeda55fStrg+Klick|r um Reset für jedermann zu erzwingen (Benötigt Assistent oder höher). |cffeda55fAlt+Klick|r um alle laufenden Module zu beenden. |cffeda55fStrg+Shift+Klick|r um BigWigs komplett zu beenden.",
	["|cffeda55fClick|r to enable."] = "|cffeda55fKlicken|r um zu aktivieren.",
	["Big Wigs is currently disabled."] = "Big Wigs ist momentan deaktiviert.",
	["Active boss modules"] = "Aktive Boss Module",
	["hidden"] = "versteckt",
	["shown"] = "angezeigt",
	-- ["minimap"] = true,
	["Minimap"] = "Minimap",
	["Toggle the minimap button."] = "Minimap Button anzeigen.",
	["All running modules have been reset."] = "Alle laufenden Module wurden zurückgesetzt.",
	["All running modules have been rebooted for all raid members."] = "Alle laufenden Module wurden für alle Schlachtzugsmitglieder neu gestartet.",
	["All running modules have been disabled."] = "Alle laufenden Module wurden beendet.",
	["%s reset."] = "%s zurückgesetzt.",
	["%s disabled."] = "%s beendet.",
	["%s icon is now %s."] = "%s Icon ist jetzt %s.",
	["You need to be an assistant or raid leader to use this function."] = "Du musst Schlachtzugsleiter oder Assistent sein, um diese Funktion zu benutzen.",
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

local deuce = BigWigs:NewModule("Options Menu")
deuce.hasFuBar = IsAddOnLoaded("FuBar") and FuBar
deuce.consoleCmd = not deuce.hasFuBar and L["minimap"]
deuce.consoleOptions = not deuce.hasFuBar and {
	type = "toggle",
	name = L["Minimap"],
	desc = L["Toggle the minimap button."],
	get = function() return BigWigsOptions.minimapFrame and BigWigsOptions.minimapFrame:IsVisible() or false end,
	set = function(v)
		if v then
			BigWigsOptions:Show()
		else
			BigWigsOptions:Hide()
			BigWigs:Print(L["Show it again with /bw plugin minimap."])
		end
	end,
	map = {[false] = L["hidden"], [true] = L["shown"]},
	message = L["%s icon is now %s."],
	hidden = function() return deuce.hasFuBar end,
}

----------------------------
--      FuBar Plugin      --
----------------------------

BigWigsOptions = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceConsole-2.0", "AceDB-2.0", "FuBarPlugin-2.0")
BigWigsOptions.name = "FuBar - BigWigs"
BigWigsOptions:RegisterDB("BigWigsFubarDB")

BigWigsOptions.hasNoColor = true
BigWigsOptions.hasIcon = "Interface\\AddOns\\BigWigs TW\\Icons\\core-enabled"
BigWigsOptions.defaultMinimapPosition = 180
BigWigsOptions.clickableTooltip = true
BigWigsOptions.hideWithoutStandby = true
--BigWigsOptions.hasNoText = true

-- XXX total hack
BigWigsOptions.OnMenuRequest = deuce.core.cmdtable
local args = AceLibrary("FuBarPlugin-2.0"):GetAceOptionsDataTable(BigWigsOptions)
for k,v in pairs(args) do
	if BigWigsOptions.OnMenuRequest.args[k] == nil then
		BigWigsOptions.OnMenuRequest.args[k] = v
	end
end
-- XXX end hack

-----------------------------
--      Icon Handling      --
-----------------------------

function BigWigsOptions:OnEnable()
	self:RegisterEvent("BigWigs_CoreEnabled", "CoreState")
	self:RegisterEvent("BigWigs_CoreDisabled", "CoreState")

	self:CoreState()
end

function BigWigsOptions:CoreState()
	if BigWigs:IsActive() then
		self:SetIcon("Interface\\AddOns\\BigWigs TW\\Icons\\core-enabled")
	else
		self:SetIcon("Interface\\AddOns\\BigWigs TW\\Icons\\core-disabled")
	end

	self:UpdateTooltip()
end

-----------------------------
--      FuBar Methods      --
-----------------------------

function BigWigsOptions:ModuleAction(module)
	if IsAltKeyDown() then
		deuce.core:ToggleModuleActive(module, false)
		self:Print(string.format(L["%s disabled."], module:ToString()))
	else
		deuce.core:BigWigs_RebootModule(module:ToString())
		self:Print(string.format(L["%s reset."], module:ToString()))
	end
	self:UpdateTooltip()
end

function BigWigsOptions:OnTooltipUpdate()
	if BigWigs:IsActive() then
		local cat = tablet:AddCategory("text", L["Active boss modules"])
		for name, module in deuce.core:IterateModules() do
			if module:IsBossModule() and deuce.core:IsModuleActive(module) then
				cat:AddLine("text", name, "func", function(mod) BigWigsOptions:ModuleAction(mod) end, "arg1", module)
			end
		end
		tablet:SetHint(L["|cffeda55fClick|r to reset all running modules. |cffeda55fCtrl+Click|r to force reboot for everyone (Requires assistant or higher). |cffeda55fAlt+Click|r to disable them. |cffeda55fCtrl+Alt+Click|r to disable Big Wigs completely."])
	else
		-- use a text line for this, since the hint is not shown when we are
		-- detached.
		local cat = tablet:AddCategory("colums", 1)
		cat:AddLine("text", L["Big Wigs is currently disabled."], "func", function() BigWigsOptions:OnClick() end)
		tablet:SetHint(L["|cffeda55fClick|r to enable."])
	end
end

function BigWigsOptions:OnClick()
	if BigWigs:IsActive() then
		if IsAltKeyDown() then
			if IsControlKeyDown() then
				BigWigs:ToggleActive(false)
				self:UpdateTooltip()
			else
				for name, module in deuce.core:IterateModules() do
					if module:IsBossModule() and deuce.core:IsModuleActive(module) then
						deuce.core:ToggleModuleActive(module, false)
					end
				end
				self:Print(L["All running modules have been disabled."])
			end
		elseif IsControlKeyDown() then
			for name, module in deuce.core:IterateModules() do
				if module:IsBossModule() and deuce.core:IsModuleActive(module) then
					if (IsRaidLeader() or IsRaidOfficer()) then
						deuce.core:TriggerEvent("BigWigs_SendSync", "RebootModule "..tostring(module))
					end
				end
			end
			if (IsRaidLeader() or IsRaidOfficer()) then
				self:Print(L["All running modules have been rebooted for all raid members."])
			else
				self:Print(L["You need to be an assistant or raid leader to use this function."])
			end
		else
			for name, module in deuce.core:IterateModules() do
				if module:IsBossModule() and deuce.core:IsModuleActive(module) then
					deuce.core:BigWigs_RebootModule(name)
				end
			end
			self:Print(L["All running modules have been reset."])
		end
	else
		BigWigs:ToggleActive(true)
	end

	self:UpdateTooltip()
end

