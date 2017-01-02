assert( oRA, "oRA not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("oRALMainTank")
local tablet = AceLibrary("Tablet-2.0")
local paintchips = AceLibrary("PaintChips-2.0")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["MainTank"] = true,
	["Options for the maintanks."] = true,
	["Set Maintank"] = true,
	["Set a maintank."]= true,
	["<nr> <name>"] = true,
	["<nr>"] = true,
	["<name>"] = true,
	["Remove Maintank"] = true,
	["Remove a maintank."] = true,
	["Removed maintank: "] = true,
	["Set maintank: "] = true,
	["Leader/MainTank"] = true,
	["Broadcast Maintanks"] = true,
	["Send the raid your maintanks."] = true,

	["free"] = true,
	["Set target on a free mt-slot"] = true,
	["All"] = true,
	["Delete all Maintanks"] = true,
	
	["<Not Assigned>"] = true,

} end )

L:RegisterTranslations("ruRU", function() return {
	["MainTank"] = "Основной танк (MT)",
	["Options for the maintanks."] = "Опции для MT.",
	["Set Maintank"] = "Установить MT",
	["Set a maintank."]= "Установка MT.",
	["<nr> <name>"] = "<nr> <name>",
	["<nr>"] = "<nr>",
	["<name>"] = "<name>",
	["Remove Maintank"] = "Удалить MT",
	["Remove a maintank."] = "Удаление MT.",
	["Removed maintank: "] = "Удален основной танк: ",
	["Set maintank: "] = "Установлен основной танк: ",
	["Leader/MainTank"] = "Лидер/MT",
	["Broadcast Maintanks"] = "Передача списка MT",
	["Send the raid your maintanks."] = "Отправить рейду список танков.",

	["free"] = "На свободную",
	["Set target on a free mt-slot"] = "Назначение цели на свободную mt-ячейку.",
	["All"] = "ВСЕХ",
	["Delete all Maintanks"] = "Удаление всех MT.",
	
	["<Not Assigned>"] = "<Не назначено>",
} end )

L:RegisterTranslations("koKR", function() return {
	["MainTank"] = "메인탱커",
	["Options for the maintanks."] = "메인탱커 설정",
	["Set Maintank"] = "메인탱커 지정",
	["Set a maintank."]= "메인탱커로 지정합니다",
	["<nr> <name>"] = "<번호> <이름>",
	["<nr>"] = "<번호>",
	["<name>"] = "<이름>",
	["Remove Maintank"] = "메인탱커 삭제",
	["Remove a maintank."] = "메인탱커에서 삭제합니다.",
	["Removed maintank: "] = "메인탱커 삭제: ",
	["Set maintank: "] = "메인탱커 설정: ",
	["Leader/MainTank"] = "공격대장/메인탱커",
	["Broadcast Maintanks"] = "메인탱커 알림",
	["Send the raid your maintanks."] = "메인탱커를 공격대에 알립니다.",

	["free"] = "공란",
	["Set target on a free mt-slot"] = "대상을 공란에 지정합니다",
	["All"] = "모두",
	["Delete all Maintanks"] = "모든 메인탱커를 삭제합니다",

	["<Not Assigned>"] = "<미정의됨>",
} end )

L:RegisterTranslations("zhCN", function() return {
	["MainTank"] = "MT目标",
	["Options for the maintanks."] = "MT目标选项",
	["Set Maintank"] = "设定MT",
	["Set a maintank."]= "设定MT",
	["<nr> <name>"] = "<数量> <名字>",
	["<nr>"] = "<数量>",
	["<name>"] = "<名字>",
	["Remove Maintank"] = "移除MT",
	["Remove a maintank."] = "移除MT",
	["Removed maintank: "] = "移除MT：",
	["Set maintank: "] = "设定MT",
	["Leader/MainTank"] = "Leader/MainTank",
	["Broadcast Maintanks"] = "广播MT",
	["Send the raid your maintanks."] = "向团队广播MT",

	["free"] = "空位",
	["Set target on a free mt-slot"] = "设定当前目标为下一个MT位置",
	["All"] = "全部",
	["Delete all Maintanks"] = "移除所有MT",

	["<Not Assigned>"] = "<还未设定>",
} end )

L:RegisterTranslations("zhTW", function() return {
	["MainTank"] = "主坦",
	["Options for the maintanks."] = "主坦選項",
	["Set Maintank"] = "設定主坦",
	["Set a maintank."]= "設定一位主坦",
	["<nr> <name>"] = "<數量> <名字>",
	["<nr>"] = "<數量>",
	["<name>"] = "<名字>",
	["Remove Maintank"] = "移除主坦",
	["Remove a maintank."] = "移除一位主坦",
	["Removed maintank: "] = "移除主坦",
	["Set maintank: "] = "設定主坦: ",
	["Leader/MainTank"] = "領隊/主坦",
	["Broadcast Maintanks"] = "廣播主坦",
	["Send the raid your maintanks."] = "向團隊廣播主坦",

	["free"] = "空閒",
	["Set target on a free mt-slot"] = "設定目標至空閒主坦位置",
	["All"] = "全部",
	["Delete all Maintanks"] = "移除所有主坦",
	
	["<Not Assigned>"] = "<未設定>",
} end )

L:RegisterTranslations("frFR", function() return {
	["MainTank"] = "MainTank",
	["Options for the maintanks."] = "Options concernant les maintanks.",
	["Set Maintank"] = "Ajouter un maintank",
	["Set a maintank."]= "Ajoute un maintank.",
	["<nr> <name>"] = "<n\194\176> <nom>",
	["<nr>"] = "<n\194\176>",
	["<name>"] = "<nom>",
	["Remove Maintank"] = "Enlever un maintank",
	["Remove a maintank."] = "Enl\195\168ve un maintank.",
	["Removed maintank: "] = "Maintank enlev\195\169 : ",
	["Set maintank: "] = "Maintank ajout\195\169 : ",
	["Leader/MainTank"] = "Chef/MainTank",
	["Broadcast Maintanks"] = "Diffuser les maintanks",
	["Send the raid your maintanks."] = "Envoye vos maintanks au raid.",

	["free"] = "free",
	["Set target on a free mt-slot"] = "Ajouter la cible \195\160 un emplacement libre des MTs",
	["All"] = "Tous",
	["Delete all Maintanks"] = "Supprime tous les maintanks.",

	["<Not Assigned>"] = "<Non assign\195\169>",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

oRALMainTank = oRA:NewModule("maintankleader")
oRALMainTank.defaults = {
}
oRALMainTank.leader = true
oRALMainTank.name = L["Leader/MainTank"]
oRALMainTank.consoleCmd = "mt"
oRALMainTank.consoleOptions = {
	type = "group", name = L["MainTank"], desc = L["Options for the maintanks."],
	args = {
		broadcast = {
			type = "execute", name = L["Broadcast Maintanks"], desc = L["Send the raid your maintanks."],
			func = function() oRALMainTank:Broadcast() end,
			disabled = function() return not oRA:IsModuleActive(oRALMainTank) or not oRALMainTank:IsValidRequest() end,
		},
		set = {
			type = "group", name = L["Set Maintank"], desc = L["Set a maintank."],
			disabled = function() return not oRA:IsModuleActive(oRALMainTank) or not oRALMainTank:IsValidRequest() end,
			args = {
				["1"] = {
					type = "text", name = "1.", desc = L["Set Maintank"].." 1",
					get = function() 
						if oRALMainTank.core.maintanktable[1] then return oRALMainTank.core.maintanktable[1]
						else return "" end
					end,
					set = function(v) oRALMainTank:Set("1 "..v) end,
					validate = function(v) return string.find(v, "^(%S+)$") end,
					usage = L["<name>"],
					order = 1,
				},
				["2"] = {
					type = "text", name = "2.", desc = L["Set Maintank"].." 2",
					get = function() 
						if oRALMainTank.core.maintanktable[2] then return oRALMainTank.core.maintanktable[2]
						else return "" end
					end,
					set = function(v) oRALMainTank:Set("2 "..v) end,
					validate = function(v) return string.find(v, "^(%S+)$") end,
					usage = L["<name>"],
					order = 2,
				},
				["3"] = {
					type = "text", name = "3.", desc = L["Set Maintank"].." 3",
					get = function() 
						if oRALMainTank.core.maintanktable[3] then return oRALMainTank.core.maintanktable[3]
						else return "" end
					end,
					set = function(v) oRALMainTank:Set("3 "..v) end,
					validate = function(v) return string.find(v, "^(%S+)$") end,
					usage = L["<name>"],
					order = 3,
				},
				["4"] = {
					type = "text", name = "4.", desc = L["Set Maintank"].." 4",
					get = function() 
						if oRALMainTank.core.maintanktable[4] then return oRALMainTank.core.maintanktable[4]
						else return "" end
					end,
					set = function(v) oRALMainTank:Set("4 "..v) end,
					validate = function(v) return string.find(v, "^(%S+)$") end,
					usage = L["<name>"],
					order = 4,
				},
				["5"] = {
					type = "text", name = "5.", desc = L["Set Maintank"].." 5",
					get = function() 
						if oRALMainTank.core.maintanktable[5] then return oRALMainTank.core.maintanktable[5]
						else return "" end
					end,
					set = function(v) oRALMainTank:Set("5 "..v) end,
					validate = function(v) return string.find(v, "^(%S+)$") end,
					usage = L["<name>"],
					order = 5,
				},
				["6"] = {
					type = "text", name = "6.", desc = L["Set Maintank"].." 6",
					get = function() 
						if oRALMainTank.core.maintanktable[6] then return oRALMainTank.core.maintanktable[6]
						else return "" end
					end,
					set = function(v) oRALMainTank:Set("6 "..v) end,
					validate = function(v) return string.find(v, "^(%S+)$") end,
					usage = L["<name>"],
					order = 6,
				},
				["7"] = {
					type = "text", name = "7.", desc = L["Set Maintank"].." 7",
					get = function() 
						if oRALMainTank.core.maintanktable[7] then return oRALMainTank.core.maintanktable[7]
						else return "" end
					end,
					set = function(v) oRALMainTank:Set("7 "..v) end,
					validate = function(v) return string.find(v, "^(%S+)$") end,
					usage = L["<name>"],
					order = 7,
				},
				["8"] = {
					type = "text", name = "8.", desc = L["Set Maintank"].." 8",
					get = function() 
						if oRALMainTank.core.maintanktable[8] then return oRALMainTank.core.maintanktable[8]
						else return "" end
					end,
					set = function(v) oRALMainTank:Set("8 "..v) end,
					validate = function(v) return string.find(v, "^(%S+)$") end,
					usage = L["<name>"],
					order = 8,
				},
				["9"] = {
					type = "text", name = "9.", desc = L["Set Maintank"].." 9",
					get = function() 
						if oRALMainTank.core.maintanktable[9] then return oRALMainTank.core.maintanktable[9]
						else return "" end
					end,
					set = function(v) oRALMainTank:Set("9 "..v) end,
					validate = function(v) return string.find(v, "^(%S+)$") end,
					usage = L["<name>"],
					order = 9,
				},
				["10"] = {
					type = "text", name = "10.", desc = L["Set Maintank"].." 10",
					get = function() 
						if oRALMainTank.core.maintanktable[10] then return oRALMainTank.core.maintanktable[10]
						else return "" end
					end,
					set = function(v) oRALMainTank:Set("10 "..v) end,
					validate = function(v) return string.find(v, "^(%S+)$") end,
					usage = L["<name>"],
					order = 10,
				},
				free = {
					type = "execute", name = L["free"], desc = L["Set target on a free mt-slot"],
					func = function()
						if not UnitExists("target") then return end
						if not UnitInRaid("target") then return end
						name = UnitName("target")
						for i=1, 10 do
							if not oRALMainTank.core.maintanktable[i] then
								oRALMainTank:Set(i.." "..name)
								break
							end
						end
					end,
					order = 11,
				}
			}
		},
		remove = {
			type = "group", name = L["Remove Maintank"], desc = L["Remove a maintank."],
			disabled = function() return not oRA:IsModuleActive(oRALMainTank) or not oRALMainTank:IsValidRequest() end,
			args = {
				["1"] = {
					type = "execute", name = "1.", desc = L["Remove Maintank"].." 1",
					func = function() oRALMainTank:Remove("1") end,
					disabled = function() return not oRALMainTank.core.maintanktable[1] end,
					order = 1,
				},				
				["2"] = {
					type = "execute", name = "2.", desc = L["Remove Maintank"].." 2",
					func = function() oRALMainTank:Remove("2") end,
					disabled = function() return not oRALMainTank.core.maintanktable[2] end,
					order = 2,
				},
				["3"] = {
					type = "execute", name = "3.", desc = L["Remove Maintank"].." 3",
					func = function() oRALMainTank:Remove("3") end,
					disabled = function() return not oRALMainTank.core.maintanktable[3] end,
					order = 3,
				},
				["4"] = {
					type = "execute", name = "4.", desc = L["Remove Maintank"].." 4",
					func = function() oRALMainTank:Remove("4") end,
					disabled = function() return not oRALMainTank.core.maintanktable[4] end,
					order = 4,
				},
				["5"] = {
					type = "execute", name = "5.", desc = L["Remove Maintank"].." 5",
					func = function() oRALMainTank:Remove("5") end,
					disabled = function() return not oRALMainTank.core.maintanktable[5] end,
					order = 5,
				},
				["6"] = {
					type = "execute", name = "6.", desc = L["Remove Maintank"].." 6",
					func = function() oRALMainTank:Remove("6") end,
					disabled = function() return not oRALMainTank.core.maintanktable[6] end,
					order = 6,
				},
				["7"] = {
					type = "execute", name = "7.", desc = L["Remove Maintank"].." 7",
					func = function() oRALMainTank:Remove("7") end,
					disabled = function() return not oRALMainTank.core.maintanktable[7] end,
					order = 7,
				},
				["8"] = {
					type = "execute", name = "8.", desc = L["Remove Maintank"].." 8",
					func = function() oRALMainTank:Remove("8") end,
					disabled = function() return not oRALMainTank.core.maintanktable[8] end,
					order = 8,
				},
				["9"] = {
					type = "execute", name = "9.", desc = L["Remove Maintank"].." 9",
					func = function() oRALMainTank:Remove("9") end,
					disabled = function() return not oRALMainTank.core.maintanktable[9] end,
					order = 9,
				},
				["10"] = {
					type = "execute", name = "10.", desc = L["Remove Maintank"].." 10",
					func = function() oRALMainTank:Remove("10") end,
					disabled = function() return not oRALMainTank.core.maintanktable[10] end,
					order = 10,
				},
				["all"] = {
					type="execute", name = L["All"], desc = L["Delete all Maintanks"],
					func = function()
						for i=1, 10 do
							oRALMainTank:Remove(i)
						end
					end,
					order = 10,
				}
			}
		}
	}
}


------------------------------
--      Initialization      --
------------------------------

function oRALMainTank:OnEnable()
	if not self.core.maintanktable then 
		self.core.maintanktable = self.core.db.profile.maintanktable or {}
	end
	self:RegisterEvent("oRA_SendVersion")
	self:RegisterEvent("oRA_MainTankUpdate")
	self:RegisterEvent("oRA_JoinedRaid", "oRA_MainTankUpdate")
	self:RegisterEvent("RosterLib_RosterChanged", function() self:oRA_MainTankUpdate() end)	
end

function oRALMainTank:OnDisable()
	self:UnregisterAllEvents()
end

-------------------------------
--       Event Handlers      --
-------------------------------

function oRALMainTank:oRA_SendVersion()
	if (not IsRaidLeader()) then return end
	self:Broadcast()
end

function oRALMainTank:oRA_MainTankUpdate( maintanktable )
	if not maintanktable then maintanktable = self.core.maintanktable end
	for k = 1, 10, 1 do
				self.core.consoleOptions.args["mt"].args["remove"].args[tostring(k)].name = tostring(k).."."
				self.core.consoleOptions.args["mt"].args["set"].args[tostring(k)].name = tostring(k).."."
	end
	for k,v in pairs(maintanktable) do
		if self:IsValidRequest(v,true) then
				self.core.consoleOptions.args["mt"].args["remove"].args[tostring(k)].name = tostring(k)..". "..v
				self.core.consoleOptions.args["mt"].args["set"].args[tostring(k)].name = tostring(k)..". "..v
		end
	end
end

-------------------------------
--      Command Handlers     --
-------------------------------

function oRALMainTank:Set( text )
	if not self:IsPromoted() then return end
	if not text or text == "" then return end
	local _, _, num, name = string.find(text, "(%S+)%s*(.*)") -- split locals
	if not num then return end

	num = tonumber(num)
	if not name or name == "" then name = UnitName("target") end
	
	-- lower the name and upper the first letter, not for chinese and korean though
	if GetLocale() ~= "zhTW" and GetLocale() ~= "zhCN" and GetLocale() ~= "koKR" then
		local _, len = string.find(name, "[%z\1-\127\194-\244][\128-\191]*")
		name = string.upper(string.sub(name, 1, len)) .. string.lower(string.sub(name, len + 1))
	end

	if not self:IsValidRequest(name, true) then return end
	
	self:SendMessage( "SET " .. num .. " " .. name )
	self:Print(L["Set maintank: "] .. "[".. num .. "] [" .. name .."]")
end

function oRALMainTank:Remove( num )
	if not self:IsPromoted() then return end
	if not num then return end
	num = tonumber(num)
	local name = self.core.maintanktable[num]
	if not name then return end
	self:SendMessage( "R "..name )
	self:Print(L["Removed maintank: "] .. num .." "..name )
end


function oRALMainTank:Broadcast()
	for k,v in pairs(self.core.maintanktable) do
		if self:IsValidRequest(v,true) then self:SendMessage("SET "..k.." "..v) end
	end
end

function oRALMainTank:TooltipClick( num )
	if not num then return end
	num = tonumber(num)
	local name = UnitName("target")
	if self.core.maintanktable[num] then
		if not name then self:Remove(num)
		else self:Set( num .." ".. name ) end	
	else
		if name then self:Set( num .." ".. name ) end
	end
end

------------------------------
--      Tooltip Updating    --
------------------------------

function oRALMainTank:OnTooltipUpdate()
	if not self:IsPromoted() then return end
	local cat = tablet:AddCategory("columns", 2, "text", "#", "justify", "LEFT", "text2", L["MainTank"], "justify2", "LEFT", "child_justify", "LEFT", "child_justify2", "LEFT" )
	local p 
	for k = 1, 10, 1 do
		p = self.core.maintanktable[k]
		if p then
			if self:IsValidRequest( p, true ) then
				local unit = self.core.roster:GetUnitIDFromName(p)
				local _, class = UnitClass( unit )
				cat:AddLine( "text", tostring(k)..". ", "text2", "|cff"..paintchips:GetHex(class) .. p.."|r", "func", self.TooltipClick, "arg1", self, "arg2", k)
			else
				cat:AddLine( "text", tostring(k)..". ", "text2", "|cffcccccc<"..p..">|r", "func", self.TooltipClick, "arg1", self, "arg2", k)
			end
		else
			cat:AddLine( "text", tostring(k)..". ", "text2", "|cffcccccc"..L["<Not Assigned>"].."|r", "func", self.TooltipClick, "arg1", self, "arg2", k)
		end
	end
end