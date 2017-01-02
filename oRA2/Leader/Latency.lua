assert(oRA, "oRA not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("oRALLatency")

local compost = AceLibrary:HasInstance("Compost-2.0") and AceLibrary("Compost-2.0")
local function getnewtable() return compost and compost:Acquire() or {} end
local function reclaimtable(t) if compost then compost:Reclaim(t) end end

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["Options for latency checks."] = true,
	["Leader/Latency"] = true,
	["Latency"] = true,
	["Latency checks disabled."] = true,
	["Refresh"] = true,
	["Close"] = true,
	["Name"] = true,
	["Perform latency check"] = true,
	["Check the raid's latencies."] = true,
} end )

L:RegisterTranslations("ruRU", function() return {
	["Options for latency checks."] = "Опции для проверки задержки.",
	["Leader/Latency"] = "Лидер/Задержка",
	["Latency"] = "Задержка",
	["Latency checks disabled."] = "Проверка задержки отключена.",
	["Refresh"] = "Обновить",
	["Close"] = "Закрыть",
	["Name"] = "Имя",
	["Perform latency check"] = "Выполнить проверку задержки",
	["Check the raid's latencies."] = "Проверка задержки (пинга) рейда.",
} end )

L:RegisterTranslations("koKR", function() return {
	["Options for latency checks."] = "지연 시간 확인에 대한 설정입니다.",
	["Leader/Latency"] = "공격대장/지연 시간",
	["Latency"] = "지연 시간",
	["Latency checks disabled."] = "지연 시간 확인을 비활성화 합니다.",
	["Refresh"] = "새로고침",
	["Close"] = "닫기",
	["Name"] = "이름",
	["Perform latency check"] = "지연 시간 확인 실시",
	["Check the raid's latencies."] = "공격대의 지연 시간을 확인합니다.",
} end )

L:RegisterTranslations("zhCN", function() return {
	["Options for latency checks."] = "延迟检查选项。",
	["Leader/Latency"] = "领袖/延迟",
	["Latency"] = "延迟",
	["Latency checks disabled."] = "延迟检查关闭。",
	["Refresh"] = "刷新",
	["Close"] = "关闭",
	["Name"] = "名字",
	["Perform latency check"] = "进行延迟检查",
	["Check the raid's latencies."] = "检查团员的延迟。",
} end )

L:RegisterTranslations("zhTW", function() return {
	["Options for latency checks."] = "延遲檢查選項",
	["Leader/Latency"] = "領隊/延遲",
	["Latency"] = "延遲",
	["Latency checks disabled."] = "關閉延遲檢查",
	["Refresh"] = "更新",
	["Close"] = "關閉",
	["Name"] = "名字",
	["Perform latency check"] = "進行延遲檢查",
	["Check the raid's latencies."] = "檢查團員的延遲",
} end )

L:RegisterTranslations("frFR", function() return {
	["Options for latency checks."] = "Options concernant les vérifications des latences.",
	["Leader/Latency"] = "Chef/Latence",
	["Latency"] = "Latence",
	["Latency checks disabled."] = "Vérifications des latences désactivées.",
	["Refresh"] = "Rafraîchir",
	["Close"] = "Fermer",
	["Name"] = "Nom",
	["Perform latency check"] = "Vérifier les latences",
	["Check the raid's latencies."] = "Vérifie les latences du raid.",
} end )

L:RegisterTranslations("deDE", function() return {
	["Options for latency checks."] = "Optionen für Latenz-Checks",
	["Leader/Latency"] = "Anführer/Latenz",
	["Latency"] = "Latenz",
	["Latency checks disabled."] = "Latenz-Checks deaktiviert.",
	["Refresh"] = "Erneuern",
	["Close"] = "Schließen",
	["Name"] = "Name",
	["Perform latency check"] = "Starte einen Latenz-Check",
	["Check the raid's latencies."] = "Überprüft die Latenzen des Schlachtzugs.",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

oRALLatency = oRA:NewModule("latencyleader")
oRALLatency.defaults = {
}
oRALLatency.leader = true
oRALLatency.name = L["Leader/Latency"]
oRALLatency.consoleCmd = "latency"
oRALLatency.consoleOptions = {
	type = "group", name = L["Latency"], desc = L["Options for latency checks."],
	args = {
		check = {
			type = "execute", name = L["Perform latency check"], desc = L["Check the raid's latencies."],
			func = function() oRALLatency:PerformLatencyCheck() end,
			disabled = function() return not oRA:IsModuleActive(oRALLatency) or not oRALLatency:IsPromoted() end,
		},
	}
}


------------------------------
--      Initialization      --
------------------------------

function oRALLatency:OnEnable()
	self.latency = getnewtable()
	self.sorting = getnewtable()
	
	self.sorting[1] = L["Name"]
	self.sorting[2] = L["Latency"]
	
	self:SetupFrames()
	self:RegisterCheck("LAT", "oRA_LatencyResponse")
	
	self:RegisterShorthand("ralatency", function() self:PerformLatencyCheck() end )
end

function oRALLatency:OnDisable()
	self:UnregisterAllEvents()
	
	self:UnregisterCheck("LAT")
	
	self:UnregisterShorthand("ralatency")
	
	reclaimtable(self.latency)
	self.latency = nil
	reclaimtable(self.sorting)
	self.sorting = nil
end


--------------------
-- Event Handlers --
--------------------

function oRALLatency:oRA_LatencyResponse(msg, author)
	msg = self:CleanMessage(msg)
	local _,_,requestby = string.find(msg, "^LAT %-1 ([^%s]+)$")
	if requestby and requestby == UnitName("player") then
		self:Print( author .. " " .. L["Latency checks disabled."])
	else
		local _,_,latency,requestby = string.find(msg, "^LAT (%d+) ([^%s]+)$")
		if latency and requestby and requestby == UnitName("player") then
			table.insert(self.latency, {author, latency.." ms"})
			self:UpdateScrollBar()
		end
	end
end

----------------------
-- Command handlers --
----------------------

function oRALLatency:PerformLatencyCheck()
	if not self:IsPromoted() then return end
	
	reclaimtable(self.latency)
	self.latency = nil
	self.latency = getnewtable()
	
	self:SendMessage("LATC")
	
self.frames.main:Show()
self:UpdateScrollBar()
end

-----------------------
-- Utility Functions --
-----------------------

function oRALLatency:SetupFrames()
	local f, t, sframe, i, j
	
	f, _, _ = GameFontNormal:GetFont()
	
	self.frames = {}
	
	self.frames.main = CreateFrame("Frame", "oRAZoneReportFrame", UIParent)
	self.frames.main:Hide()
	self.frames.main:SetWidth(325)
	self.frames.main:SetHeight(350)
	self.frames.main:EnableMouse(true)
	self.frames.main:SetMovable(true)
	self.frames.main:RegisterForDrag("LeftButton")
	self.frames.main:SetScript("OnDragStart", function() this:StartMoving() end)
	self.frames.main:SetScript("OnDragStop", function() this:StopMovingOrSizing() end)
	self.frames.main:SetBackdrop({
		bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", tile = true, tileSize = 16,
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 16,
		insets = {left = 4, right = 4, top = 4, bottom = 4},
	})
	self.frames.main:SetBackdropBorderColor(.5, .5, .5)
	self.frames.main:SetBackdropColor(0,0,0)
	self.frames.main:ClearAllPoints()
	self.frames.main:SetPoint("CENTER", WorldFrame, "CENTER", 0, 0)
	
	self.frames.fade = self.frames.main:CreateTexture(nil, "BORDER")
	self.frames.fade:SetWidth(319)
	self.frames.fade:SetHeight(25)
	self.frames.fade:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
	self.frames.fade:SetPoint("TOP", self.frames.main, "TOP", 0, -4)
	self.frames.fade:SetBlendMode("ADD")
	self.frames.fade:SetGradientAlpha("VERTICAL", .1, .1, .1, 0, .25, .25, .25, 1)
	self.frames.main.Fade = self.frames.fade
	
	self.frames.header = self.frames.main:CreateFontString(nil,"OVERLAY")
	self.frames.header:SetFont(f, 14)
	self.frames.header:SetWidth(300)
	self.frames.header:SetText(L["Latency"])
	self.frames.header:SetTextColor(1, .8, 0)
	self.frames.header:ClearAllPoints()
	self.frames.header:SetPoint("TOP", self.frames.main, "TOP", 0, -10)
	
	self.frames.headername = CreateFrame("Button", nil, self.frames.main)
	self.frames.headername.owner = self
	self.frames.headername:SetWidth(165)
	self.frames.headername:SetHeight(16)
	self.frames.headername:SetPoint("TOPLEFT", self.frames.main, "TOPLEFT", 10, -35)
	self.frames.headername:SetScript("OnClick",
		function()
			this.owner:Sort(self.latency, 1)
			this.owner:UpdateScrollBar()
		end)
		
		self.frames.headernamehigh = self.frames.headername:CreateTexture(nil, "BORDER")
		self.frames.headernamehigh:SetWidth(125)
		self.frames.headernamehigh:SetHeight(16)
		self.frames.headernamehigh:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
		self.frames.headernamehigh:SetAllPoints(self.frames.headername)
		self.frames.headernamehigh:SetBlendMode("ADD")
		self.frames.headernamehigh:SetGradientAlpha("VERTICAL", .1, .08, 0, 0, .2, .16, 0, 1)
		self.frames.headername:SetHighlightTexture(self.frames.headernamehigh)
		
		self.frames.headernametext = self.frames.headername:CreateFontString(nil,"OVERLAY")
		self.frames.headernametext.owner = self
		self.frames.headernametext:SetFont(f, 14)
		self.frames.headernametext:SetWidth(125)
		self.frames.headernametext:SetText(L["Name"])
		self.frames.headernametext:SetTextColor(1, .8, 0)
		self.frames.headernametext:ClearAllPoints()
		self.frames.headernametext:SetJustifyH("LEFT")
		self.frames.headernametext:SetAllPoints(self.frames.headername)
		
		self.frames.headerlatency = CreateFrame("Button", nil, self.frames.main)
		self.frames.headerlatency.owner = self
		self.frames.headerlatency:SetWidth(115)
		self.frames.headerlatency:SetHeight(16)
		self.frames.headerlatency:SetPoint("LEFT", self.frames.headername, "RIGHT")
		self.frames.headerlatency:SetScript("OnClick",
			function()
				this.owner:Sort(self.latency, 2)
				this.owner:UpdateScrollBar()
			end)
			
			self.frames.headerlatencyhigh = self.frames.headerlatency:CreateTexture(nil, "BORDER")
			self.frames.headerlatencyhigh:SetWidth(155)
			self.frames.headerlatencyhigh:SetHeight(16)
			self.frames.headerlatencyhigh:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
			self.frames.headerlatencyhigh:SetAllPoints(self.frames.headerlatency)
			self.frames.headerlatencyhigh:SetBlendMode("ADD")
			self.frames.headerlatencyhigh:SetGradientAlpha("VERTICAL", .1, .08, 0, 0, .2, .16, 0, 1)
			self.frames.headerlatency:SetHighlightTexture(self.frames.headerlatencyhigh)
			
			
			self.frames.headerlatencytext = self.frames.main:CreateFontString(nil,"OVERLAY")
			self.frames.headerlatencytext:SetFont(f, 14)
			self.frames.headerlatencytext:SetWidth(155)
			self.frames.headerlatencytext:SetText(L["Latency"])
			self.frames.headerlatencytext:SetTextColor(1, .8, 0)
			self.frames.headerlatencytext:ClearAllPoints()
			self.frames.headerlatencytext:SetJustifyH("LEFT")
			self.frames.headerlatencytext:SetAllPoints(self.frames.headerlatency)
			
			self.frames.leftbutton = CreateFrame("Button", nil, self.frames.main)
			self.frames.leftbutton.owner = self
			self.frames.leftbutton:SetWidth(125)
			self.frames.leftbutton:SetHeight(32)
			self.frames.leftbutton:SetPoint("BOTTOMRIGHT", self.frames.main, "BOTTOM", -10, 10)
			
			t = self.frames.leftbutton:CreateTexture()
			t:SetWidth(125)
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
			self.frames.leftbuttontext:SetText(L["Refresh"])
			self.frames.leftbuttontext:SetAllPoints(self.frames.leftbutton)
			
			self.frames.leftbutton:SetScript("OnClick",
				function()
					this.owner:PerformLatencyCheck()
				end)
				
				self.frames.rightbutton = CreateFrame("Button", nil, self.frames.main)
				self.frames.rightbutton.owner = self
				self.frames.rightbutton:SetWidth(125)
				self.frames.rightbutton:SetHeight(32)
				self.frames.rightbutton:SetPoint("BOTTOMLEFT", self.frames.main, "BOTTOM", 10, 10)
				
				t = self.frames.rightbutton:CreateTexture()
				t:SetWidth(125)
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
				
				self.frames.rightbutton:SetScript("OnClick",
					function()
						this.owner.frames.main:Hide()
					end)
					
					
					self.frames.entry = {}
					self.frames.entry[1] = self:ScrollEntryFrame(1)
					self.frames.entry[1]:SetPoint("TOPLEFT", self.frames.main, "TOPLEFT", 10, -55 )
					
					for i=2, 15 do
						j = i - 1
						self.frames.entry[i] = self:ScrollEntryFrame()
						self.frames.entry[i]:SetPoint("TOPLEFT", self.frames.entry[j], "BOTTOMLEFT")
					end
					
					
					self.frames.sframe = CreateFrame("ScrollFrame", "oRAOZoneScrollFrame", self.frames.main, "FauxScrollFrameTemplate")
					self.frames.sframe.owner = self
					self.frames.sframe:SetWidth(285)
					self.frames.sframe:SetHeight(240)
					self.frames.sframe:SetPoint("TOPLEFT", self.frames.main, "TOPLEFT", 5, -55)
					
					self.frames.sframe:SetScript("OnVerticalScroll",
						function()
							FauxScrollFrame_OnVerticalScroll(16, function() this.owner:UpdateScrollBar() end)
						end )
						
end

function oRALLatency:ScrollEntryFrame()
	local f = CreateFrame("Button", nil, self.frames.main )
	f:SetWidth(240)
	f:SetHeight(16)
	
	f.textname = f:CreateFontString(nil,"ARTWORK")
	f.textname:SetFontObject(GameFontHighlight)
	f.textname:SetWidth(150)
	f.textname:SetHeight(16)
	f.textname:SetJustifyH("LEFT")
	f.textname:SetNonSpaceWrap(false)
	f.textname:ClearAllPoints()
	f.textname:SetPoint( "LEFT", f, "LEFT")
	f.textname:SetTextColor(1,1,1)
	f.textname:SetText("Name")
	
	f.textlatency = f:CreateFontString(nil,"ARTWORK")
	f.textlatency:SetFontObject(GameFontHighlight)
	f.textlatency:SetWidth(60)
	f.textlatency:SetHeight(16)
	f.textlatency:SetJustifyH("RIGHT")
	f.textlatency:SetNonSpaceWrap(false)
	f.textlatency:ClearAllPoints()
	f.textlatency:SetPoint("LEFT", f.textname, "RIGHT")
	f.textlatency:SetTextColor(1,1,1)
	f.textlatency:SetText("3")
	
	return f
end

function oRALLatency:UpdateScrollBar()
	local i,j
	local entries = table.getn(self.latency)
	FauxScrollFrame_Update(self.frames.sframe, entries, 15, 16)
	
	for i = 1, 15 do
		j = i + FauxScrollFrame_GetOffset(self.frames.sframe)
		
		if j <= entries then
			self.frames.entry[i].textname:SetText(self.latency[j][1])
			self.frames.entry[i].textlatency:SetText(self.latency[j][2])
			self.frames.entry[i]:Show()
			else
			self.frames.entry[i]:Hide()
		end
	end
	
end

function oRALLatency:Sort(tbl, sortBy)
	if( sortBy == 2 or sortBy == 1 ) then
		table.sort(tbl,
			function(t1, t2)
				if (t1[sortBy] == t2[sortBy] ) then
					return t1[1] < t2[1]
					else
					return t1[sortBy] > t2[sortBy]
				end
			end
		)
	end	
end