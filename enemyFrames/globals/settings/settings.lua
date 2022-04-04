
_G = getfenv(0)

print = function(m) DEFAULT_CHAT_FRAME:AddMessage(m) end

ENEMYFRAMESVERSION = 1.33
ENEMYFRAMESNEWVERSION = ENEMYFRAMESVERSION
ENEMYFRAMESVERSIONFOUND = false


ENEMYFRAMESPLAYERDATA = 
{
	-- options
	['defaultIcon'] 			= 'rank',
	['scale']					= 1,
	['groupsize']				= 5,
	['layout']					= 'block',
	['frameMovable'] 			= true,
	['enableFrames']			= true,
	-- features
	['mouseOver']				= false,
	['enableOutdoors']			= true,
	['targetFrameCastbar']		= true,
	['integratedTargetFrameCastbar']		= true,
	['playerPortraitDebuff']	= false,
	['targetPortraitDebuff']	= false,
	['targetDebuffTimers']		= false,
	-- bgs
	['incomingSpells']			= false,
	['pvpmapblips']				= false,	
	['efcBGannouncement']		= false,
	-- optionals
	['displayNames']			= true,
	--['displayHealthValues'] = false,
	['displayManabar']			= false,
	['displayOnlyNearby']		= false,
	['castTimers']				= false,		
	['targetCounter']			= false,
	-- nameplates
	['nameplatesClassColor'] 	= true,
	['nameplatesdebuffs'] 		= true,
	['nameplatesCastbar']		= true,
	['plateDebuffSize']			= 1,
	['nameplatesRaidMarks']		= true,
	
	
	['offX']				= 0,
	['offY']				= 0,
}


local L = enemyFrames.L
local playerFaction, insideBG = false
------------ UI ELEMENTS ------------------
local enemyFactionColor
local enemyFramesDisplayShow = false

local settings = CreateFrame('Frame', 'enemyFramesSettings', UIParent)
settings:ClearAllPoints()
settings:SetWidth(320) settings:SetHeight(340)
settings:SetFrameLevel(60)
settings:SetPoint('CENTER', UIParent, -UIParent:GetWidth()/3, 0)
settings:SetBackdrop({bgFile   = [[Interface\Tooltips\UI-Tooltip-Background]],
				  edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]],
				  insets   = {left = 11, right = 12, top = 12, bottom = 11}})
settings:SetBackdropColor(0, 0, 0, 1)
settings:SetBackdropBorderColor(.2, .2, .2)
settings:SetMovable(true) settings:SetUserPlaced(true)
settings:SetClampedToScreen(true)
settings:RegisterForDrag'LeftButton' settings:EnableMouse(true)
settings:SetScript('OnDragStart', function() settings:StartMoving() end)
settings:SetScript('OnDragStop', function() settings:StopMovingOrSizing() end)
tinsert(UISpecialFrames, 'enemyFramesSettings')
settings:Hide()

settings.x = CreateFrame('Button', 'enemyFramesSettingsCloseButton', settings, 'UIPanelCloseButton')
settings.x:SetPoint('TOPRIGHT',  -6, -6)

settings.header = settings:CreateTexture(nil, 'ARTWORK')
settings.header:SetWidth(320) settings.header:SetHeight(64)
settings.header:SetPoint('TOP', settings, 0, 12)
settings.header:SetTexture[[Interface\DialogFrame\UI-DialogBox-Header]]
settings.header:SetVertexColor(.2, .2, .2)

settings.header.t = settings:CreateFontString(nil, 'ARTWORK', 'GameFontNormal')
settings.header.t:SetPoint('TOP', settings.header, 0, -14)
settings.header.t:SetText(L['enemyFrames Settings'])

-- container scrollframe

settings.containerScrollframe = CreateFrame('ScrollFrame', 'enemyFramesSettingsScrollframe', settings, 'UIPanelScrollFrameTemplate')
settings.containerScrollframe:SetFrameLevel(3)
settings.containerScrollframe:SetPoint('TOPLEFT', settings, -7, -36)
settings.containerScrollframe:SetPoint('BOTTOMRIGHT', settings, -37, 18)
settings.containerScrollframe:Raise()
settings.containerScrollframe:SetToplevel()

-- tabs

settings.numTabs = 4
local tabNames = {'general', 'features', 'optionals', 'nameplates'}
local tabElements = {'Left', 'LeftDisabled', 'Middle', 'MiddleDisabled', 'Right', 'RightDisabled'}
settings.tabs = {}
for i = 1, settings.numTabs do
	settings.tabs[i] = CreateFrame('Button', settings:GetName()..'Tab'..i, settings, 'WorldStateScoreFrameTabButtonTemplate')
	settings.tabs[i]:SetText(L[tabNames[i]])
	if i == 1 then
		settings.tabs[i]:SetPoint('TOPLEFT', settings, 'BOTTOMLEFT',0, 3)
	else
		settings.tabs[i]:SetPoint('LEFT', settings.tabs[i-1], 'RIGHT', -12, 0)
	end
	settings.tabs[i].id = i
	for j  = 1, getn(tabElements) do
		_G[settings.tabs[i]:GetName()..tabElements[j]]:SetVertexColor(.2, .2, .2)
	end
	
	settings.tabs[i]:SetScript('OnClick', function()	
		for j = 1, settings.numTabs do	
			if j ~= this.id then
				_G['enemyFramesSettings'..tabNames[j]..'Container']:Hide()
			end
		end
		settings.containerScrollframe.content = _G['enemyFramesSettings'..tabNames[this.id]..'Container']
		settings.containerScrollframe:SetScrollChild(_G['enemyFramesSettings'..tabNames[this.id]..'Container'])
		_G['enemyFramesSettings'..tabNames[this.id]..'Container']:Show()
		
		PanelTemplates_SetTab(settings, this.id)
		--_G[settings:GetName()..'Tab'..this.id..'Text']:SetTextColor(enemyFactionColor['r'], enemyFactionColor['g'], enemyFactionColor['b'])
	end)
end

-------------------------------------------


function setupSettings()
	playerFaction = UnitFactionGroup'player'
	if playerFaction == 'Alliance' then 
		enemyFactionColor = RGB_FACTION_COLORS['Horde']
	else 
		enemyFactionColor = RGB_FACTION_COLORS['Alliance']	
	end
	settings.header.t:SetTextColor(enemyFactionColor['r'], enemyFactionColor['g'], enemyFactionColor['b'], .9)

	GENERALSSETTINGSInit(enemyFactionColor)
	FEATURESSETTINGSInit(enemyFactionColor)
	OPTIONALSSETTINGSInit(enemyFactionColor)
	NAMEPLATESSETTINGSInit(enemyFactionColor)
	
	-- general tab by default
	for j = 1, settings.numTabs do
		_G['enemyFramesSettings'..tabNames[j]..'Container']:Hide()
		
		--local disableFont = _G[settings.tabs[j]:GetName()]:CreateFontString(nil, 'ARTWORK', 'GameFontDisable')
		--disableFont:SetTextColor(enemyFactionColor['r'], enemyFactionColor['g'], enemyFactionColor['b'])
		--_G[settings.tabs[j]:GetName()]:SetDisabledFontObject(disableFont)
	end
			
	settings.containerScrollframe.content = _G['enemyFramesSettingsgeneralContainer']
	settings.containerScrollframe:SetScrollChild(_G['enemyFramesSettingsgeneralContainer'])
	_G['enemyFramesSettingsgeneralContainer']:Show()
	PanelTemplates_SetTab(settings, 1)
	
	settings:Show()
	
	if ENEMYFRAMESPLAYERDATA['enableFrames'] then
		if _G['enemyFrameDisplay']:IsShown() then
			enemyFramesDisplayShow = true
		else
			enemyFramesDisplayShow = false
			
			_G['enemyFrameDisplay']:Show()
		end		
		--tinsert(UISpecialFrames, 'enemyFrameDisplay')
	end
	
	ENEMYFRAMESsettings()
	INCOMINGSPELLSsettings(ENEMYFRAMESPLAYERDATA['incomingSpells'])
	TARGETFRAMECASTBARsettings(true)
end

local closeSettings = function()
	--settings:Hide() 
	if not enemyFramesDisplayShow and not insideBG then 
		_G['enemyFrameDisplay']:Hide() 
	end 

	INCOMINGSPELLSsettings(false) TARGETFRAMECASTBARsettings(false)
end
-- x button
settings.x:SetScript('OnClick', function() 
	 --closeSettings()
	 settings:Hide()
end)

local function eventHandler()
	if event == 'PLAYER_LOGIN' then
		playerFaction = UnitFactionGroup'player'
		local tc = playerFaction == 'Alliance' and 'FF1A1A' or '00ADF0'
		print('|cff' ..tc.. format(L['[enemyFrames] v%s loaded. |cffffffff/efs|cff%s for menu settings.'], ENEMYFRAMESVERSION, tc))
		_G['enemyFrameDisplay']:SetScale(ENEMYFRAMESPLAYERDATA['scale'])
		_G['enemyFrameDisplay']:SetPoint('CENTER', UIParent, ENEMYFRAMESPLAYERDATA['offX'], ENEMYFRAMESPLAYERDATA['offY'])
	elseif event == 'PLAYER_LOGOUT' then
		local point, relativeTo, relativePoint, xOfs, yOfs = _G['enemyFrameDisplay']:GetPoint()
		ENEMYFRAMESPLAYERDATA['offX'] = xOfs
		ENEMYFRAMESPLAYERDATA['offY'] = yOfs
	elseif event == 'ZONE_CHANGED_NEW_AREA' then
		insideBG = IsInsideBG()
	end
end

local f = CreateFrame'Frame'
f:RegisterEvent'PLAYER_LOGIN'
f:RegisterEvent'PLAYER_LOGOUT'
f:RegisterEvent'ZONE_CHANGED_NEW_AREA'
f:SetScript('OnEvent', eventHandler)

settings:SetScript('OnHide', closeSettings)


SLASH_ENEMYFRAMESSETTINGS1 = '/efs'
SlashCmdList["ENEMYFRAMESSETTINGS"] = function(msg)
	if settings:IsShown() then
		closeSettings()
	else
		setupSettings()
	end
end