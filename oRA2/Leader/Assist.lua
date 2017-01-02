assert( oRA, "oRA not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("oRALAssist")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["Assist"] = true,
	["Options for assist."] = true,
	["Leader/Assist"] = true,
	["Tank %s. not available."] = true,
	["You need to have a target to assign it to a tank."] = true,
	["Assigning %s to %s."] = true,
	["No free tanks found."] = true,
	["Assign Target"] = true,
	["Assign a target to a maintank."] = true,
	["Assign Maintank"] = true,
	["First Free"] = true,
	["Assign the first free MainTank."] = true,
	["Request Assist"] = true,
} end )

L:RegisterTranslations("ruRU", function() return {
	["Assist"] = "Помощь",
	["Options for assist."] = "Опции для помощи.",
	["Leader/Assist"] = "Лидер/Помощь",
	["Tank %s. not available."] = "Танк %s недоступен.",
	["You need to have a target to assign it to a tank."] = "Вы должны иметь цель, чтобы назначить ее к танку.",
	["Assigning %s to %s."] = "Назначение %s к %s.",
	["No free tanks found."] = "Свободных танков не найдено.",
	["Assign Target"] = "Назначить цель",
	["Assign a target to a maintank."] = "Назначение цели к главному танку (MT).",
	["Assign Maintank"] = "Назначить MT",
	["First Free"] = "Первый свободный",
	["Assign the first free MainTank."] = "Назначить первого свободного MT.",
	["Request Assist"] = "Запрос помощи",
} end )

L:RegisterTranslations("koKR", function() return {
	["Assist"] = "지원",
	["Options for assist."] = "지원 기능에 대한 설정",
	["Leader/Assist"] = "공격대장/지원",
	["Tank %s. not available."] = "%s 메인탱커를 사용할 수 없습니다.",
	["You need to have a target to assign it to a tank."] = "먼저 탱커로 지정할 대상을 선택해야 합니다.",
	["Assigning %s to %s."] = "%s|1을;를; %s|1로;으로; 지정합니다.",
	["No free tanks found."] = "빈 탱커목록을 찾을 수가 없습니다.",
	["Assign Target"] = "대상 지정",
	["Assign a target to a maintank."] = "대상을 메인탱커로 지정합니다",
	["Assign Maintank"] = "메인탱커 지정",
	["First Free"] = "첫번재 공란",
	["Assign the first free MainTank."] = "메인탱커의 첫번재 공란으로 지정합니다.",
	["Request Assist"] = "지원요청",
} end )

L:RegisterTranslations("zhCN", function() return {
	["Assist"] = "协助MT",
	["Options for assist."] = "协助MT的选项",
	["Leader/Assist"] = "Leader/Assist",
	["Tank %s. not available."] = "MT%s不存在",
	["You need to have a target to assign it to a tank."] = "你必需先选中一个目标然后再分配给MT",
	["Assigning %s to %s."] = "%s分配给%s",
	["No free tanks found."] = "没有空闲的MT",
	["Assign Target"] = "分配目标",
	["Assign a target to a maintank."] = "分配目标给MT",
	["Assign Maintank"] = "分配MT",
	["First Free"] = "第一个空闲",
	["Assign the first free MainTank."] = "分配给第一个空闲的MT",
	["Request Assist"] = "需要协助",
} end )

L:RegisterTranslations("zhTW", function() return {
	["Assist"] = "協助主坦",
	["Options for assist."] = "協助主坦的選項",
	["Leader/Assist"] = "領隊/協助",
	["Tank %s. not available."] = "主坦 %s 不存在",
	["You need to have a target to assign it to a tank."] = "你必需先選中一個目標然後再分配給主坦",
	["Assigning %s to %s."] = "%s 分配給 %s",
	["No free tanks found."] = "沒有空閒的主坦",
	["Assign Target"] = "分配目標",
	["Assign a target to a maintank."] = "分配目標給主坦",
	["Assign Maintank"] = "分配主坦",
	["First Free"] = "第一個空閒",
	["Assign the first free MainTank."] = "分配給第一個空閒的主坦",
	["Request Assist"] = "請求協助",
} end )

L:RegisterTranslations("frFR", function() return {
	["Assist"] = "Aide",
	["Options for assist."] = "Options concernant l'aide.",
	["Leader/Assist"] = "Chef/Aide",
	["Tank %s. not available."] = "Tank %s non disponible.",
	["You need to have a target to assign it to a tank."] = "Vous devez avoir une cible pour l'assigner \195\160 un tank.",
	["Assigning %s to %s."] = "Assignation de %s \195\160 %s.",
	["No free tanks found."] = "Aucun tank libre n'a \195\169t\195\169 trouv\195\169.",
	["Assign Target"] = "Assigner une cible",
	["Assign a target to a maintank."] = "Assigne une cible \195\160 un maintank.",
	["Assign Maintank"] = "Assigner un maintank",
	["First Free"] = "Premier libre",
	["Assign the first free MainTank."] = "Assigne le premier maintank libre.",
	["Request Assist"] = "Demander de l'aide",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

oRALAssist = oRA:NewModule("assistleader")
oRALAssist.defaults = {
}
oRALAssist.leader = true
oRALAssist.name = L["Leader/Assist"]
oRALAssist.consoleCmd = "assist"
oRALAssist.consoleOptions = {
	type = "group", name = L["Assist"], desc = L["Options for assist."],
	args = {
		assign = {
			type = "group", name = L["Assign Target"], desc = L["Assign a target to a maintank."],
			disabled = function() return not oRA:IsModuleActive(oRALAssist) or not oRALAssist:IsValidRequest() end,
			args = {
				["1"] = {
					type = "execute", name = "1.", desc = L["Assign Maintank"].." 1",
					func = function() oRALAssist:AssignNumber("1") end,
					disabled = function() return not oRALAssist.core.maintanktable[1] end,
					order = 1,
				},				
				["2"] = {
					type = "execute", name = "2.", desc = L["Assign Maintank"].." 2",
					func = function() oRALAssist:AssignNumber("2") end,
					disabled = function() return not oRALAssist.core.maintanktable[2] end,
					order = 2,
				},
				["3"] = {
					type = "execute", name = "3.", desc = L["Assign Maintank"].." 3",
					func = function() oRALAssist:AssignNumber("3") end,
					disabled = function() return not oRALAssist.core.maintanktable[3] end,
					order = 3,
				},
				["4"] = {
					type = "execute", name = "4.", desc = L["Assign Maintank"].." 4",
					func = function() oRALAssist:AssignNumber("4") end,
					disabled = function() return not oRALAssist.core.maintanktable[4] end,
					order = 4,
				},
				["5"] = {
					type = "execute", name = "5.", desc = L["Assign Maintank"].." 5",
					func = function() oRALAssist:AssignNumber("5") end,
					disabled = function() return not oRALAssist.core.maintanktable[5] end,
					order = 5,
				},
				["6"] = {
					type = "execute", name = "6.", desc = L["Assign Maintank"].." 6",
					func = function() oRALAssist:AssignNumber("6") end,
					disabled = function() return not oRALAssist.core.maintanktable[6] end,
					order = 6,
				},
				["7"] = {
					type = "execute", name = "7.", desc = L["Assign Maintank"].." 7",
					func = function() oRALAssist:AssignNumber("7") end,
					disabled = function() return not oRALAssist.core.maintanktable[7] end,
					order = 7,
				},
				["8"] = {
					type = "execute", name = "8.", desc = L["Assign Maintank"].." 8",
					func = function() oRALAssist:AssignNumber("8") end,
					disabled = function() return not oRALAssist.core.maintanktable[8] end,
					order = 8,
				},
				["9"] = {
					type = "execute", name = "9.", desc = L["Assign Maintank"].." 9",
					func = function() oRALAssist:AssignNumber("9") end,
					disabled = function() return not oRALAssist.core.maintanktable[9] end,
					order = 9,
				},
				["10"] = {
					type = "execute", name = "10.", desc = L["Assign Maintank"].." 10",
					func = function() oRALAssist:AssignNumber("10") end,
					disabled = function() return not oRALAssist.core.maintanktable[10] end,
					order = 10,
				},
				["free"] = {
					type="execute", name = L["First Free"], desc = L["Assign the first free MainTank."],
					func = function()
						oRALAssist:AssignFree()
					end,
					order = 11,
				}
			}			
		}, 
	}
}

------------------------------
--      Initialization      --
------------------------------

function oRALAssist:OnEnable()
	self:RegisterEvent("oRA_MainTankUpdate")
	self:RegisterEvent("oRA_JoinedRaid", "oRA_MainTankUpdate")
	self:RegisterEvent("RosterLib_RosterChanged", function() self:oRA_MainTankUpdate() end)
end

function oRALAssist:OnDisable()
	self:UnregisterAllEvents()
end

------------------------------
--      Event Handlers      --
------------------------------

function oRALAssist:oRA_MainTankUpdate( maintanktable )
	if not maintanktable then maintanktable = self.core.maintanktable end
	for k = 1, 10, 1 do
				self.core.consoleOptions.args["assist"].args["assign"].args[tostring(k)].name = tostring(k).."."
	end
	for k,v in pairs(maintanktable) do
		if self:IsValidRequest(v,true) then
				self.core.consoleOptions.args["assist"].args["assign"].args[tostring(k)].name = tostring(k)..". "..v
		end
	end
end

------------------------------
--     Command Handlers     --
------------------------------

function oRALAssist:AssignNumber( number )
	if not self:IsPromoted() then return end
	number = tonumber(number)
	if not UnitName("target") then
		self:Print( L["You need to have a target to assign it to a tank."] )
		return
	end
	if not self.core.maintanktable[number] or not self.core.roster:GetUnitIDFromName(self.core.maintanktable[number]) then
		self:Print( string.format( L["Tank %s. not available."], number) )
		return
	end
	self:SendMessage("ASSISTME "..self.core.maintanktable[number] )
	self:Print( string.format( L["Assigning %s to %s."], UnitName("target"), self.core.maintanktable[number] ) )
end

function oRALAssist:AssignFree( )
	if not self:IsPromoted() then return end
	if not UnitName("target") then
		self:Print( L["You need to have a target to assign it to a tank."] )
		return		
	end
	for k,v in pairs(self.core.maintanktable) do
		local unitid = self.core.roster:GetUnitIDFromName(v)
		if unitid and not UnitName( unitid .. "target" ) then
			self:AssignNumber( k )
			return	
		end
	end
	self:Print( L["No free tanks found."] )
end