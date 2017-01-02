local tablet = AceLibrary("Tablet-2.0")
local dewdrop = AceLibrary("Dewdrop-2.0")
local abacus = AceLibrary("Abacus-2.0")
local compost = AceLibrary("Compost-2.0")
local L = AceLibrary("AceLocale-2.2"):new("AuditorFu")

AuditorFu = AceLibrary("AceAddon-2.0"):new("FuBarPlugin-2.0", "AceEvent-2.0", "AceConsole-2.0", "AceDB-2.0")

local optionsTable = {
	handler = AuditorFu,
	type = 'group',
	desc = L["DESCRIPTION"],
	args = {
		timeframeDisplay = {
			order = 1,
			type = 'text',
			name = L["TEXT_TIMEFRAME"],
			desc = L["DESC_TIMEFRAME"],
			get = function() return AuditorFu.db.profile.style end,
			set = function(v) AuditorFu.db.profile.style = v; AuditorFu:UpdateTooltip() end,
			validate = {["session"] = L["TEXT_SESSION"], ["day"] = L["TEXT_DAY"], ["week"] = L["TEXT_WEEK"], ["total"] = L["TEXT_TOTAL"]},
		},
		cashFormat = {
			order = 2,
			type = 'group',
			name = L["TEXT_CASHFORMAT"],
			desc = L["DESC_CASHFORMAT"],
			args = {
				barFormat = {
					order = 1,
					type = 'text',
					name = L["TEXT_FUDISPLAY"],
					desc = L["DESC_FUDISPLAY"],
					get = function() return AuditorFu.db.profile.cashFormat.Bar end,
					set = function(v) AuditorFu.db.profile.cashFormat.Bar = v; AuditorFu:UpdateText() end,
					validate = {["Full"] = L["TEXT_FULLSTYLE"], ["Short"] = L["TEXT_SHORTSTYLE"], ["Condensed"] = L["TEXT_CONDSTYLE"], ["Graphical"] = L["TEXT_GRAPHICAL"]},
				},
				tooltipFormat = {
					order = 2,
					type = 'text',
					name = L["TEXT_TIPDISPLAY"],
					desc = L["DESC_TIPDISPLAY"],
					get = function() return AuditorFu.db.profile.cashFormat.toolTip end,
					set = function(v) AuditorFu.db.profile.cashFormat.toolTip = v; AuditorFu:UpdateText() end,
					validate = {["Full"] = L["TEXT_FULLSTYLE"], ["Short"] = L["TEXT_SHORTSTYLE"], ["Condensed"] = L["TEXT_CONDSTYLE"]},
				},
			}
		},
		["-blank1-"] = {
			order = 4,
			type = 'header',
		},
		hideCharTotals = {
			order = 5,
			type = 'toggle',
			name = L["TEXT_HIDETOTALS"],
			desc = L["DESC_HIDETOTALS"],
			get = function() return AuditorFu.db.profile.hideCharTotals end,
			set = function() AuditorFu.db.profile.hideCharTotals = not AuditorFu.db.profile.hideCharTotals end,
		},
		hideCharDetails = {
			order = 5,
			type = 'toggle',
			name = L["TEXT_HIDEDETAILS"],
			desc = L["DESC_HIDEDETAILS"],
			get = function() return AuditorFu.db.profile.hideDetails end,
			set = function() AuditorFu.db.profile.hideDetails = not AuditorFu.db.profile.hideDetails end,
		},
		absurdDetailsView = {
			order = 5,
			type = 'toggle',
			name = L["TEXT_ABSURD"],
			desc = L["DESC_ABSURD"],
			get = function() return AuditorFu.db.profile.absurdDetail end,
			set = function() AuditorFu.db.profile.absurdDetail = not AuditorFu.db.profile.absurdDetail end,
		},
		hideCharSummary = {
			order = 5,
			type = 'toggle',
			name = L["TEXT_HIDESUMMARY"],
			desc = L["DESC_HIDESUMMARY"],
			get = function() return AuditorFu.db.profile.hideSummary end,
			set = function() AuditorFu.db.profile.hideSummary = not AuditorFu.db.profile.hideSummary end,
		},
		toonToShow = {
			order = 3,
			type = 'text',
			name = L["TEXT_CHARSHOW"],
			desc = L["DESC_CHARSHOW"],
			get = function() return auditorFuToonToShow end,
			set = function(v) auditorFuToonToShow = v end,
			validate = {},
		},
		["-blank3-"] = {
			order = 7,
			type = 'header',
		},
		import = {
			order = 8,
            type = 'execute',
			name = L["TEXT_IMPORT"],
            desc = L["DESC_IMPORT"],
			disabled = function()
						if Accountant_SaveData == nil then
							return true
						else
							return false
						end
						end,
			func = function() StaticPopup_Show("ACC_IMPORT_CONF") end,
        },
		purge = {
			order = 9,
			type = 'group',
			name = L["TEXT_PURGE"],
            desc = L["DESC_PURGE"],
		},
		filters = {
			order = 10,
			type = 'group',
			name = L["TEXT_FILTER"],
			desc = L["DESC_FILTER"],
		},
		["-blank4-"] = {
			order = 11,
			type = 'header',
		},
		resetSession = {
			order = 6,
			type = 'execute',
			name = L["TEXT_RSESSION"],
			desc = L["DESC_RSESSION"],
			func = function() Auditor:DataReset("session");	AuditorFu:OpenMenu() end,
		}
	}	
}

AuditorFu:RegisterChatCommand({"/audfu", "/auditorfu", "/auditor", "/aud"})
AuditorFu.hasIcon = true
AuditorFu.clickableTooltip = true
AuditorFu.frame = AuditorFu:CreateBasicPluginFrame("AuditorFuFrame")

AuditorFu:RegisterDB("Fubar_AuditorDB")
AuditorFu:RegisterDefaults('profile', {
	enabled = 0,
	hideCharTotals = false,
	hideDetails = false,
	hideSummary = false,
	absurdDetail = false,
	absurdStyle = "loot",
	style = "total",
	cashFormat = { Bar = "Full", toolTip = "Full" }
})

function AuditorFu:OnInitialize()
	auditorFuModeTip = { L["TEXT_LOOT"], L["TEXT_VENDORS"], L["TEXT_QUEST"], L["TEXT_TRADE"], L["TEXT_MAIL"], L["TEXT_AH"], L["TEXT_TRAIN"], L["TEXT_TAXI"], L["TEXT_REPAIRS"], L["TEXT_OTHER"] }
	auditorFuToonToShow = UnitName("player")
	auditorFuDetailMode = auditorLogMode
	auditorFuToonToPurge = "NoOne"
	-- Populate character to show and purge options
	AuditorFu:FrameSetup()
end

function AuditorFu:OnEnable()
	-- Confirmation dialogs for data purging and data import
	StaticPopupDialogs["ACC_IMPORT_CONF"] = {
	  text = L["POPUP_IMPORT"],
	  button1 = L["POPUP_YES"],
	  button2 = L["POPUP_NO"],
	  OnAccept = function()
		Auditor:ImportAccountant()
	  end,
	  timeout = 0,
	  whileDead = 1,
	  hideOnEscape = 1
	}
	
	StaticPopupDialogs["AUD_DATA_PURGE"] = {
	  text = "",
	  button1 = L["POPUP_YES"],
	  button2 = L["POPUP_NO"],
	  OnAccept = function()
		Auditor:PurgeData(auditorFuToonToPurge)
	  end,
	  timeout = 0,
	  whileDead = 1,
	  hideOnEscape = 1
	}

	AuditorFuFrameGoldIcon:ClearAllPoints()
	AuditorFuFrameGoldIcon:SetPoint("RIGHT", AuditorFuFrameSilverText, "LEFT", 0, -1)
	AuditorFuFrameSilverIcon:ClearAllPoints()
	AuditorFuFrameSilverIcon:SetPoint("RIGHT", AuditorFuFrameCopperText, "LEFT", 0, -1)
	
	-- Events for Bar Cash Display and also, better check for events if someone has the tooltip detached. Dunno who would, but hey, life's all about choices, right?
	self:RegisterEvent("PLAYER_MONEY", "UpdateDisplay")
	self:RegisterEvent("PLAYER_TRADE_MONEY", "UpdateDisplay")
	self:RegisterEvent("TRADE_MONEY_CHANGED", "UpdateDisplay")
	self:RegisterEvent("SEND_MAIL_MONEY_CHANGED", "UpdateDisplay")
	self:RegisterEvent("SEND_MAIL_COD_CHANGED", "UpdateDisplay")
end

function AuditorFu:OnDisable()
end

function AuditorFu:OnTextUpdate()
	if self.db.profile.cashFormat.Bar == "Graphical" then
		if self:IsIconShown() then
			self.db.profile.iconVisible = true
			self:HideIcon()
		end
		self.hasIcon = false
		AuditorFuFrameIcon:Hide()
		AuditorFuFrameText:Hide()
		local copper = GetMoney()
		local gold = floor(copper / 10000)
		local silver = mod(floor(copper / 100), 100)
		copper = mod(copper, 100)
		local width = 0
		if gold == 0 then
			AuditorFuFrameGoldIcon:Hide()
			AuditorFuFrameGoldText:Hide()
		else
			AuditorFuFrameGoldIcon:Show()
			AuditorFuFrameGoldText:Show()
			AuditorFuFrameGoldText:SetWidth(0)
			AuditorFuFrameGoldText:SetText(gold)
			width = width + AuditorFuFrameGoldIcon:GetWidth() + AuditorFuFrameGoldText:GetWidth()
		end
		if gold == 0 and silver == 0 then
			AuditorFuFrameSilverIcon:Hide()
			AuditorFuFrameSilverText:Hide()
		else
			AuditorFuFrameSilverIcon:Show()
			AuditorFuFrameSilverText:Show()
			AuditorFuFrameSilverText:SetWidth(0)
			AuditorFuFrameSilverText:SetText(silver)
			width = width + AuditorFuFrameSilverIcon:GetWidth() + AuditorFuFrameSilverText:GetWidth()
		end
		AuditorFuFrameCopperIcon:Show()
		AuditorFuFrameCopperText:Show()
		AuditorFuFrameCopperText:SetWidth(0)
		AuditorFuFrameCopperText:SetText(copper)
		width = width + AuditorFuFrameCopperIcon:GetWidth() + AuditorFuFrameCopperText:GetWidth()
		self.frame:SetWidth(width)
	else
		if not self.hasIcon then
			self.hasIcon = true
			if self.db.profile.iconVisible then
				self:ShowIcon()
			end
		end
		self.db.profile.iconVisible = false
		AuditorFuFrameGoldIcon:Hide()
		AuditorFuFrameSilverIcon:Hide()
		AuditorFuFrameCopperIcon:Hide()
		AuditorFuFrameGoldText:Hide()
		AuditorFuFrameSilverText:Hide()
		AuditorFuFrameCopperText:Hide()
		if AuditorFu:IsTextShown() == true then
			AuditorFuFrameText:Show()
		else
			AuditorFuFrameText:Hide()
		end
		if self.db.profile.cashFormat.Bar == "Full" then
			self:SetText(abacus:FormatMoneyFull(GetMoney(), true))
		elseif self.db.profile.cashFormat.Bar == "Short" then
			self:SetText(abacus:FormatMoneyShort(GetMoney(), true))
		else
			self:SetText(abacus:FormatMoneyCondensed(GetMoney(), true))
		end
		self:CheckWidth(true)
	end
end

function AuditorFu:OnTooltipUpdate()
	Auditor:UpdateTimeFrame()
	
	-- Retrieve Cash Data
	local style = self.db.profile.style
	local absurdStyle = self.db.profile.absurdStyle
	local allTotal = 0
	local netIn = 0
	local netOut = 0
	local netTotal = 0
	if (cashIn) then
		compost:Reclaim(cashIn)
		compost:Reclaim(cashOut)
	end
	cashIn = compost:Acquire()
	cashOut = compost:Acquire()
	local categoryDisplay = ""
	local absurdCategoryDisplay = ""
			
	for i = 1, 10 do
		cashIn[i] = Auditor.db.realm[auditorFuToonToShow].data[auditorLogMode[i]][style].incomings
		cashOut[i] = Auditor.db.realm[auditorFuToonToShow].data[auditorLogMode[i]][style].outgoings
		netIn = netIn + Auditor.db.realm[auditorFuToonToShow].data[auditorLogMode[i]][style].incomings
		netOut = netOut + Auditor.db.realm[auditorFuToonToShow].data[auditorLogMode[i]][style].outgoings
		netTotal = netTotal + Auditor.db.realm[auditorFuToonToShow].data[auditorLogMode[i]][style].incomings - Auditor.db.realm[auditorFuToonToShow].data[auditorLogMode[i]][style].outgoings
	end
	
	-- Set Tooltip Display Prefs
	-- Timeframe
	if style == "session" then
		categoryDisplay = L["TEXT_SESSION"]
	elseif style == "day" then
		categoryDisplay = L["TEXT_DAY"]
	elseif style == "week" then
		categoryDisplay = L["TEXT_WEEK"]
	else
		categoryDisplay = L["TEXT_TOTAL"]
	end
	--AbsurdCategory
	if absurdStyle == "loot" then
		absurdCategoryDisplay = L["TEXT_LOOT"]
	elseif absurdStyle == "merch" then
		absurdCategoryDisplay = L["TEXT_VENDORS"]
	elseif absurdStyle == "quest" then
		absurdCategoryDisplay = L["TEXT_QUEST"]
	elseif absurdStyle == "trade" then
		absurdCategoryDisplay = L["TEXT_TRADE"]
	elseif absurdStyle == "mail" then
		absurdCategoryDisplay = L["TEXT_MAIL"]
	elseif absurdStyle == "ah" then
		absurdCategoryDisplay = L["TEXT_AH"]
	elseif absurdStyle == "train" then
		absurdCategoryDisplay = L["TEXT_TRAIN"]
	elseif absurdStyle == "taxi" then
		absurdCategoryDisplay = L["TEXT_TAXI"]
	elseif absurdStyle == "repairs" then
		absurdCategoryDisplay = L["TEXT_REPAIRS"]
	elseif absurdStyle == "other" then
		absurdCategoryDisplay = L["TEXT_OTHER"]
	end
			
	-- Construct Tooltip Display
	if self.db.profile.absurdDetail == false then
		if auditorFuToonToShow == auditorPlayer then
			local cat = tablet:AddCategory(
		        'text', auditorFuToonToShow,
				'textR', 1,	'textG', 1,	'textB', 0,
				'justify', "CENTER",
				'font', GameTooltipHeaderText
			)
			cat:AddLine()
		else
			local subbedDate = string.sub(Auditor.db.realm[auditorFuToonToShow].timeDate.niceDate,4,5).." "..L["DATE_"..string.sub(Auditor.db.realm[auditorFuToonToShow].timeDate.niceDate,1,2)].." '"..string.sub(Auditor.db.realm[auditorFuToonToShow].timeDate.niceDate,7,8)
			local cat = tablet:AddCategory(
		        'text', auditorFuToonToShow.." :: "..subbedDate,
				'textR', 1,	'textG', 1,	'textB', 0,
				'justify', "CENTER",
				'font', GameTooltipHeaderText
			)
			cat:AddLine()
		end
			
		local cat = tablet:AddCategory(
	        'text', L["TEXT_TIMEFRAME"],
			'text2', categoryDisplay,
			'textR', 0,	'textG', 1,	'textB', 0,
			'text2R', 1, 'text2G', 1, 'text2B', 0,
			'columns', 2,
			'func', function() -- Allow click to cycle through timeframe
						if style == "session" then
							style = "day"
							categoryDisplay = L["TEXT_DAY"]
						elseif style == "day" then
							style = "week"
							categoryDisplay = L["TEXT_WEEK"]
						elseif style == "week" then
							style = "total"
							categoryDisplay = L["TEXT_TOTAL"]
						elseif style == "total" then
							style = "session"
							categoryDisplay = L["TEXT_SESSION"]
						end
						self.db.profile.style = style
					end,
			'hasCheck', true,
			'checked', true,
			'checkIcon', "Interface\\Buttons\\UI-PlusButton-Up"
	    )
		
		cat:AddLine()
		
		local cat = tablet:AddCategory(
	        'text', L["TEXT_CASHFLOW"],
			'textR', 0,	'textG', 1,	'textB', 0,
			'columns', 3,
			'child_textR', 1, 'child_textG', 1, 'child_textB', 0,
			'child_text2R', 1, 'child_text2G', 1, 'child_text2B', 1,
			'child_text3R', 1, 'child_text3G', 1, 'child_text3B', 1,
			'func', function() AuditorFu.db.profile.hideDetails = not AuditorFu.db.profile.hideDetails end,
			'hasCheck', true,
			'checked', true,
			'checkIcon', AuditorFu.db.profile.hideDetails and "Interface\\Buttons\\UI-PlusButton-Up" or "Interface\\Buttons\\UI-MinusButton-Up"
		)
		
	    if AuditorFu.db.profile.hideDetails == false then
			cat:AddLine(
				'text', L["TEXT_SOURCE"],
				'textR', 1,	'textG', 1,	'textB', 1,
		        'text2', L["TEXT_INCOMINGS"],
		        'text3', L["TEXT_OUTGOINGS"]
		    )
				
			-- Sources, incomings, outgoings
			for i = 1, 10 do
				cat:AddLine(
				'text', auditorFuModeTip[i],
				'text2', AuditorFu:AbacusStyle(cashIn[i]),
				'text3', AuditorFu:AbacusStyle(cashOut[i])
				)
			end
		else
			cat:AddLine()
		end

		local cat = tablet:AddCategory(
			'text', L["TEXT_SUMMARY"],
			'textR', 0,
			'textG', 1,
			'textB', 0,
			'columns', 2,
			'child_textR', 1, 'child_textG', 1,	'child_textB', 0,
			'child_text2R', 1, 'child_text2G', 1, 'child_text2B', 1,
			'func', function() AuditorFu.db.profile.hideSummary = not AuditorFu.db.profile.hideSummary end,
			'hasCheck', true,
			'checked', true,
			'checkIcon', AuditorFu.db.profile.hideSummary and "Interface\\Buttons\\UI-PlusButton-Up" or "Interface\\Buttons\\UI-MinusButton-Up"
			)
			
		if AuditorFu.db.profile.hideSummary == false then
			cat:AddLine(
				'text', L["TEXT_INCOMINGS"],
				'text2', AuditorFu:AbacusStyle(netIn, true)
			)
				
			cat:AddLine(
				'text', L["TEXT_OUTGOINGS"],
				'text2', string.gsub((AuditorFu:AbacusStyle((netOut * -1), true)), "-", "")
			)
				
			if netTotal >= 0 then
				cat:AddLine(
					'text', L["TEXT_NETPROFIT"],
					'text2', AuditorFu:AbacusStyle(netTotal, true)
				)
			else
				cat:AddLine(
					'text', L["TEXT_NETLOSS"],
					'text2', string.gsub((AuditorFu:AbacusStyle(netTotal, true)), "-", "")
				)
			end
		else
			cat:AddLine()
		end
	else
		if auditorFuToonToShow == auditorPlayer then
			local cat = tablet:AddCategory(
		        'text', auditorFuToonToShow,
				'textR', 1,	'textG', 1,	'textB', 0,
				'justify', "CENTER",
				'font', GameTooltipHeaderText
			)
			cat:AddLine()
		else
			local subbedDate = string.sub(Auditor.db.realm[auditorFuToonToShow].timeDate.niceDate,4,5).." "..L["DATE_"..string.sub(Auditor.db.realm[auditorFuToonToShow].timeDate.niceDate,1,2)].." '"..string.sub(Auditor.db.realm[auditorFuToonToShow].timeDate.niceDate,7,8)
			local cat = tablet:AddCategory(
		        'text', auditorFuToonToShow.." :: "..subbedDate,
				'textR', 1,	'textG', 1,	'textB', 0,
				'justify', "CENTER",
				'font', GameTooltipHeaderText
			)
			cat:AddLine()
		end
			
		local cat = tablet:AddCategory(
	        'text', L["TEXT_SOURCE"],
			'text2', absurdCategoryDisplay,
			'textR', 0,	'textG', 1,	'textB', 0,
			'text2R', 1, 'text2G', 1, 'text2B', 0,
			'columns', 2,
			'func', function() -- Allow click to cycle through sources
						if absurdStyle == "loot" then
							absurdStyle = "merch"
							absurdCategoryDisplay = L["TEXT_VENDORS"]
						elseif absurdStyle == "merch" then
							absurdStyle = "quest"
							absurdCategoryDisplay = L["TEXT_QUEST"]
						elseif absurdStyle == "quest" then
							absurdStyle = "trade"
							absurdCategoryDisplay = L["TEXT_TRADE"]
						elseif absurdStyle == "trade" then
							absurdStyle = "mail"
							absurdCategoryDisplay = L["TEXT_MAIL"]
						elseif absurdStyle == "mail" then
							absurdStyle = "ah"
							absurdCategoryDisplay = L["TEXT_AH"]
						elseif absurdStyle == "ah" then
							absurdStyle = "train"
							absurdCategoryDisplay = L["TEXT_TRAIN"]
						elseif absurdStyle == "train" then
							absurdStyle = "taxi"
							absurdCategoryDisplay = L["TEXT_TAXI"]
						elseif absurdStyle == "taxi" then
							absurdStyle = "repairs"
							absurdCategoryDisplay = L["TEXT_REPAIRS"]
						elseif absurdStyle == "repairs" then
							absurdStyle = "other"
							absurdCategoryDisplay = L["TEXT_OTHER"]
						elseif absurdStyle == "other" then
							absurdStyle = "loot"
							absurdCategoryDisplay = L["TEXT_LOOT"]
						end
						self.db.profile.absurdStyle = absurdStyle
					end,
			'hasCheck', true,
			'checked', true,
			'checkIcon', "Interface\\Buttons\\UI-PlusButton-Up"
	    )
		cat:AddLine()
		
		local cat = tablet:AddCategory(
	        'text', L["TEXT_ABSURD"],
			'textR', 0,	'textG', 1,	'textB', 0,
			'columns', 3,
			'child_textR', 1, 'child_textG', 1, 'child_textB', 0,
			'child_text2R', 1, 'child_text2G', 1, 'child_text2B', 1,
			'child_text3R', 1, 'child_text3G', 1, 'child_text3B', 1,
			'func', function() AuditorFu.db.profile.hideDetails = not AuditorFu.db.profile.hideDetails end,
			'hasCheck', true,
			'checked', true,
			'checkIcon', AuditorFu.db.profile.hideDetails and "Interface\\Buttons\\UI-PlusButton-Up" or "Interface\\Buttons\\UI-MinusButton-Up"
		)
		
		if AuditorFu.db.profile.hideDetails == false then
			cat:AddLine(
				'text', L["TEXT_TIMEFRAME"],
				'textR', 1,	'textG', 1,	'textB', 1,
		        'text2', L["TEXT_INCOMINGS"],
		        'text3', L["TEXT_OUTGOINGS"]
		    )
			
			cat:AddLine(
				'text', L["ABSD_SESSION"],
				'text2', AuditorFu:AbacusStyle(Auditor.db.realm[auditorFuToonToShow].data[absurdStyle]["session"].incomings),
				'text3', AuditorFu:AbacusStyle(Auditor.db.realm[auditorFuToonToShow].data[absurdStyle]["session"].outgoings)
			)
			
			-- Historical Days, incomings, outgoings
			for i = 1, 7 do
				cat:AddLine(
				'text', L["ABSD_"..i],
				'text2', AuditorFu:AbacusStyle(Auditor.db.realm[auditorFuToonToShow].historical[auditorHDay[(8-i)]][absurdStyle].incomings),
				'text3', AuditorFu:AbacusStyle(Auditor.db.realm[auditorFuToonToShow].historical[auditorHDay[(8-i)]][absurdStyle].outgoings)
				)
			end
			
			cat:AddLine(
				'text', L["ABSD_WEEK"],
				'text2', AuditorFu:AbacusStyle(Auditor.db.realm[auditorFuToonToShow].data[absurdStyle]["week"].incomings),
				'text3', AuditorFu:AbacusStyle(Auditor.db.realm[auditorFuToonToShow].data[absurdStyle]["week"].outgoings)
			)
			
			cat:AddLine(
				'text', L["ABSD_TOTAL"],
				'text2', AuditorFu:AbacusStyle(Auditor.db.realm[auditorFuToonToShow].data[absurdStyle]["total"].incomings),
				'text3', AuditorFu:AbacusStyle(Auditor.db.realm[auditorFuToonToShow].data[absurdStyle]["total"].outgoings)
			)
		else
			cat:AddLine()
		end
	end
	
	local cat = tablet:AddCategory(
					'text', L["TEXT_CHARACTERS"],
					'textR', 0,
					'textG', 1,
					'textB', 0,
					'columns', 3,
					'child_textR', 1, 'child_textG', 1,	'child_textB', 0,
					'child_text2R', 1, 'child_text2G', 1, 'child_text2B', 0,				
					'func', function() AuditorFu.db.profile.hideCharTotals = not AuditorFu.db.profile.hideCharTotals end,
					'hasCheck', true,
					'checked', true,
					'checkIcon', AuditorFu.db.profile.hideCharTotals and "Interface\\Buttons\\UI-PlusButton-Up" or "Interface\\Buttons\\UI-MinusButton-Up"
				)
	
	-- Character Totals, ordered by wealth
	if AuditorFu.db.profile.hideCharTotals == false then
		local total = 0
		local addedCat = false
		if next(Auditor.db.realm.chars) ~= UnitName("player") or next(Auditor.db.realm.chars, UnitName("player")) then
			local t = compost:Acquire()
			for name in pairs(Auditor.db.realm.chars) do
				table.insert(t, name)
			end
			if not self.sort_func then
				self.sort_func = function(alpha, bravo)
					return Auditor.db.realm.chars[alpha] < Auditor.db.realm.chars[bravo]
				end
			end
			table.sort(t, self.sort_func)
			for _,name in pairs(t) do
				if not AuditorFu:IsFiltered(name) == true then
					local value = Auditor.db.realm.chars[name]
					local subbedDate = string.sub(Auditor.db.realm[name].timeDate.niceDate,4,5).." "..L["DATE_"..string.sub(Auditor.db.realm[name].timeDate.niceDate,1,2)].." '"..string.sub(Auditor.db.realm[name].timeDate.niceDate,7,8)
					if name == UnitName("player") then
						cat:AddLine(
							'textR', 1,	'textG', 0,	'textB', 0,
							'text', name,
							'text2', subbedDate,
							'text3', AuditorFu:AbacusStyle(value),
							'arg1', name,
							'func', function(name) auditorFuToonToShow = name end
						)
					else
						cat:AddLine(
							'text', name,
							'text2', subbedDate,
							'text3', AuditorFu:AbacusStyle(value),
							'arg1', name,
							'func', function(name) auditorFuToonToShow = name end
						)
					end
					total = total + value
				end
			end
		else
			total = GetMoney()
		end
		local cat = tablet:AddCategory(
		'textR', 0,
		'textG', 1,
		'textB', 0,
		'columns', 2,
		'child_textR', 1, 'child_textG', 1,	'child_textB', 0,
		'child_text2R', 1, 'child_text2G', 1, 'child_text2B', 1
		)
		cat:AddLine(
			'text', L["TEXT_NETTOTAL"],
			'text2', AuditorFu:AbacusStyle(total)
		)
	else
	cat:AddLine()
	end
end

function AuditorFu:AbacusStyle(formattedCash, coloured)
	if self.db.profile.cashFormat.toolTip == "Full" then
		return abacus:FormatMoneyFull(formattedCash, true, coloured)
	elseif self.db.profile.cashFormat.toolTip == "Short" then
		return abacus:FormatMoneyShort(formattedCash, true, coloured)
	else
		return abacus:FormatMoneyCondensed(formattedCash, true, coloured)
	end
end

function AuditorFu:FrameSetup()
	local frame = self.frame
	local icon = frame:CreateTexture("AuditorFuFrameIcon", "ARTWORK")
	icon:SetWidth(16)
	icon:SetHeight(16)
	icon:SetPoint("LEFT", frame, "LEFT")
	self.iconFrame = icon

	local text = frame:CreateFontString("AuditorFuFrameText", "OVERLAY")
	text:SetJustifyH("RIGHT")
	text:SetPoint("RIGHT", frame, "RIGHT", 0, 1)
	text:SetFontObject(GameFontNormal)
	self.textFrame = text

	self:SetIcon(true)

	local goldIcon = frame:CreateTexture("AuditorFuFrameGoldIcon", "ARTWORK")
	goldIcon:SetWidth(16)
	goldIcon:SetHeight(16)
	goldIcon:SetTexture("Interface\\MoneyFrame\\UI-MoneyIcons")
	goldIcon:SetTexCoord(0, 0.25, 0, 1)

	local silverIcon = frame:CreateTexture("AuditorFuFrameSilverIcon", "ARTWORK")
	silverIcon:SetWidth(16)
	silverIcon:SetHeight(16)
	silverIcon:SetTexture("Interface\\MoneyFrame\\UI-MoneyIcons")
	silverIcon:SetTexCoord(0.25, 0.5, 0, 1)

	local copperIcon = frame:CreateTexture("AuditorFuFrameCopperIcon", "ARTWORK")
	copperIcon:SetWidth(16)
	copperIcon:SetHeight(16)
	copperIcon:SetTexture("Interface\\MoneyFrame\\UI-MoneyIcons")
	copperIcon:SetTexCoord(0.5, 0.75, 0, 1)

	local goldText = frame:CreateFontString("AuditorFuFrameGoldText", "OVERLAY")
	goldText:SetJustifyH("RIGHT")
	goldText:SetPoint("RIGHT", goldIcon, "LEFT", 0, 1)
	goldText:SetFontObject(GameFontNormal)

	local silverText = frame:CreateFontString("AuditorFuFrameSilverText", "OVERLAY")
	silverText:SetJustifyH("RIGHT")
	silverText:SetPoint("RIGHT", silverIcon, "LEFT", 0, 1)
	silverText:SetFontObject(GameFontNormal)

	local copperText = frame:CreateFontString("AuditorFuFrameCopperText", "OVERLAY")
	copperText:SetJustifyH("RIGHT")
	copperText:SetPoint("RIGHT", copperIcon, "LEFT", 0, 1)
	copperText:SetFontObject(GameFontNormal)

	copperIcon:SetPoint("RIGHT", frame, "RIGHT")
	silverIcon:SetPoint("RIGHT", copperText, "LEFT")
	goldIcon:SetPoint("RIGHT", silverText, "LEFT")
end

function AuditorFu:SetFontSize(size)
	if AuditorFuFrameGoldIcon == nil then
		self.fontSize = size
		return
	end
	AuditorFuFrameGoldIcon:SetWidth(size)
	AuditorFuFrameGoldIcon:SetHeight(size)
	AuditorFuFrameSilverIcon:SetWidth(size)
	AuditorFuFrameSilverIcon:SetHeight(size)
	AuditorFuFrameCopperIcon:SetWidth(size)
	AuditorFuFrameCopperIcon:SetHeight(size)
	self.iconFrame:SetWidth(16)
	self.iconFrame:SetHeight(16)
	local font,_,flags = AuditorFuFrameGoldText:GetFont()
	if font ~= nil then
		AuditorFuFrameGoldText:SetFont(font, size, flags)
		AuditorFuFrameSilverText:SetFont(font, size, flags)
		AuditorFuFrameCopperText:SetFont(font, size, flags)
		self.textFrame:SetFont(font, size)
	end
	self:UpdateText()
end

function AuditorFu:OnMenuRequest()
	if (not self.cached_options) then 
		-- Purge/Filter/ToonToShow settings
		local showTable = optionsTable.args.toonToShow.validate
		local filterTable = optionsTable.args.filters.args
		local purgeTable = optionsTable.args.purge.args
		compost:Reclaim(showTable)
		compost:Reclaim(filterTable)
		compost:Reclaim(purgeTable)
		showTable = compost:Acquire()
		filterTable = compost:Acquire()
		purgeTable = compost:Acquire()
		optionsTable.args.toonToShow.validate = showTable
		optionsTable.args.filters.args = filterTable
		optionsTable.args.purge.args = purgeTable

		for name in pairs(Auditor.db.realm.chars) do
			local name = name
			showTable[name] = name
			
			filterTable[name] = {}
			filterTable[name].type = 'toggle'
			filterTable[name].name = name
			filterTable[name].desc = L["TEXT_FILTER"]..L["TEXT_FOR"]..name..L["TEXT_FROMTOTALS"]
			filterTable[name].set  = function() AuditorFu:ToggleFiltered(name) end
			filterTable[name].get  = function() return AuditorFu:IsFiltered(name) end
			
			purgeTable[name] = {}
			purgeTable[name].type = 'execute'
			purgeTable[name].name = name
			purgeTable[name].desc = L["TEXT_PURGE"]..L["TEXT_FOR"]..name
			purgeTable[name].func = function() auditorFuToonToPurge = name; StaticPopupDialogs["AUD_DATA_PURGE"].text = L["POPUP_PURGE"]..name..L["POPUP_PURGE2"]..name.."."; StaticPopup_Show("AUD_DATA_PURGE") end
		end
		self.cached_options = optionsTable
	end
	dewdrop:FeedAceOptionsTable(self.cached_options)
end

function AuditorFu:IsFiltered(name)
	return Auditor.db.realm[name].hidden
end

function AuditorFu:ToggleFiltered(name)
	Auditor.db.realm[name].hidden = not Auditor.db.realm[name].hidden
end