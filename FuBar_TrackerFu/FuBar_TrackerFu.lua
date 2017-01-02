local dewdrop = AceLibrary("Dewdrop-2.0")
local tablet = AceLibrary("Tablet-2.0")
local L = AceLibrary("AceLocale-2.0"):new("TrackerFu")

local optionsTable = {
	type = 'group',
	args = {
		showMinimap = {
			order = 10,
			type = 'toggle',
			name = L["TRACKER_SHOW_MINIMAP"],
			desc = L["TRACKER_SHOW_MINIMAP"],
			set = "ToggleShowMiniMap",
			get = "IsShowingMiniMap",
		},		
	}	
}

TrackerFu = AceLibrary("AceAddon-2.0"):new("FuBarPlugin-2.0", "AceEvent-2.0", "AceConsole-2.0", "AceDB-2.0")
TrackerFu.hasIcon = true
TrackerFu.clickableTooltip = true

TrackerFu.OnMenuRequest = optionsTable
TrackerFu:RegisterChatCommand( { "/trackerfu" }, optionsTable )

TrackerFu:RegisterDB("TrackerFuDB")
TrackerFu:RegisterDefaults('profile', {
	showMiniMap = false,
	trackerSpells = {
	[L["TRACKER_SPELL_FIND_HERBS"]] =1,
	[L["TRACKER_SPELL_FIND_MINERALS"]] =1,
	[L["TRACKER_SPELL_FIND_TREASURE"]] =1,
	[L["TRACKER_SPELL_TRACK_BEASTS"]] =1,
	[L["TRACKER_SPELL_TRACK_HUMANOIDS"]] =1,
	[L["TRACKER_SPELL_TRACK_HIDDEN"]] =1,
	[L["TRACKER_SPELL_TRACK_ELEMENTALS"]] =1,
	[L["TRACKER_SPELL_TRACK_UNDEAD"]] =1,
	[L["TRACKER_SPELL_TRACK_DEMONS"]] =1,
	[L["TRACKER_SPELL_TRACK_GIANTS"]] =1,
	[L["TRACKER_SPELL_TRACK_DRAGONKIN"]] =1,
	[L["TRACKER_SPELL_SENSE_UNDEAD"]] =1,
	[L["TRACKER_SPELL_SENSE_DEMONS"]] =1,
	}
})

-- Methods
function TrackerFu:IsShowingMiniMap()
	return self.db.profile.showMiniMap
end
	
function TrackerFu:ToggleShowMiniMap()
	self.db.profile.showMiniMap = not self.db.profile.showMiniMap
	if ( self.db.profile.showMiniMap ) then
		MiniMapTrackingFrame:Show()
	else
		MiniMapTrackingFrame:Hide()
	end
	return self.db.profile.showMiniMap
end

function TrackerFu:Tracker_FindTracking(theTexture)
	--DEFAULT_CHAT_FRAME:AddMessage(theTexture)
	if ( theTexture == L["TRACKER_ICON_FIND_HERBS"] ) then		
		return L["TRACKER_SPELL_FIND_HERBS"]
	elseif ( theTexture == L["TRACKER_ICON_FIND_MINERALS"]) then
		return L["TRACKER_SPELL_FIND_MINERALS"]
	elseif ( theTexture == L["TRACKER_ICON_FIND_TREASURE"] ) then
		return L["TRACKER_SPELL_FIND_TREASURE"]
	elseif ( theTexture == L["TRACKER_ICON_TRACK_BEASTS"] ) then
		return L["TRACKER_SPELL_TRACK_BEASTS"]
	elseif ( theTexture == L["TRACKER_ICON_TRACK_HUMANOIDS"] ) then
		return L["TRACKER_SPELL_TRACK_HUMANOIDS"]
	elseif ( theTexture == L["TRACKER_ICON_TRACK_HIDDEN"] ) then
		return L["TRACKER_SPELL_TRACK_HIDDEN"]
	elseif ( theTexture == L["TRACKER_ICON_TRACK_ELEMENTALS"] ) then
		return L["TRACKER_SPELL_TRACK_ELEMENTALS"]
	elseif ( theTexture == L["TRACKER_ICON_TRACK_UNDEAD"] ) then
		return L["TRACKER_SPELL_TRACK_UNDEAD"]
	elseif ( theTexture == L["TRACKER_ICON_TRACK_DEMONS"] ) then
		return L["TRACKER_SPELL_TRACK_DEMONS"]
	elseif ( theTexture == L["TRACKER_ICON_TRACK_GIANTS"] ) then
		return L["TRACKER_SPELL_TRACK_GIANTS"]
	elseif ( theTexture == L["TRACKER_ICON_TRACK_DRAGONKIN"] ) then 
		return L["TRACKER_SPELL_TRACK_DRAGONKIN"]
	elseif ( theTexture == L["TRACKER_ICON_SENSE_UNDEAD"] ) then
		return L["TRACKER_SPELL_SENSE_UNDEAD"]
	elseif ( theTexture == L["TRACKER_ICON_SENSE_DEMONS"] ) then
		return L["TRACKER_SPELL_SENSE_DEMONS"]
	else
		return L["TRACKER_STOP_TRACKING"]
	end
end

function TrackerFu:OnTrackClick(val)
	CastSpell(val, 0)
				
	if ( self.db.profile.showMiniMap ) then
		MiniMapTrackingFrame:Show()
	else
		MiniMapTrackingFrame:Hide()
	end			
end

function TrackerFu:Tracker_CancelTrackingBuff()
	CancelTrackingBuff()
end

function TrackerFu:OnInitialize()
	self.db.profile.currTexture = GetTrackingTexture()	
end
	
function TrackerFu:OnEnable()
	self:RegisterEvent("SPELLS_CHANGED")
	self:RegisterEvent("LEARNED_SPELL_IN_TAB")
	self:RegisterEvent("PLAYER_AURAS_CHANGED")
end

function TrackerFu:SPELLS_CHANGED()
	self.db.profile.currTexture = GetTrackingTexture()	
	self:Update()
end

function TrackerFu:LEARNED_SPELL_IN_TAB()
	self.db.profile.currTexture = GetTrackingTexture()	
	self:Update()
end

function TrackerFu:PLAYER_AURAS_CHANGED()
	self.db.profile.currTexture = GetTrackingTexture()	
	self:Update()
end

function TrackerFu:OnDisable()
	-- you do not need to unregister the event here, all events/hooks are unregistered on disable implicitly.
end
	
function TrackerFu:OnTextUpdate()
	if ( self.db.profile.currTexture ~= nil ) then
		self:SetIcon(self.db.profile.currTexture)
		--self:SetText(self:Tracker_FindTracking(self.db.profile.currTexture))
	else
		self:SetIcon(L["DEFAULT_ICON"])
		--self:SetText(L["TRACKER_OFF_TEXT"])
	end
	self:SetText("")
	if ( self.db.profile.showMiniMap ) then
		MiniMapTrackingFrame:Show()
	else
		MiniMapTrackingFrame:Hide()
	end	
end

function TrackerFu:OnTooltipUpdate()
	
	local cat = tablet:AddCategory(
		'columns', 3,
		'child_textR', 1,
		'child_textG', 1,
		'child_textB', 1
	)
	
	cat:AddLine(
		'text', ""
	)	
	
	cat:AddLine(
		'text', ""
	)		
	
	local pTrack = self:Tracker_FindTracking(GetTrackingTexture());
	
	--DEFAULT_CHAT_FRAME:AddMessage("Searching Spells")
	
	local menuLookUp = {}
	local numTrack = 0

	local i = 1
	local spellName, spellRank = GetSpellName(i, BOOKTYPE_SPELL)
		
	while spellName do
		--DEFAULT_CHAT_FRAME:AddMessage(spellName)
		if self.db.profile.trackerSpells[spellName] then
			menuLookUp[spellName] = i - 1
			--DEFAULT_CHAT_FRAME:AddMessage("Found Spell : "..spellName.." - "..i-1)
		end
		
		spellName, spellRank = GetSpellName(i, BOOKTYPE_SPELL)
		i = i + 1
	end	
	
	--DEFAULT_CHAT_FRAME:AddMessage("Populating Tooltip ")

	for spellName in menuLookUp do
		if menuLookUp[spellName] > 0 then
			numTrack = numTrack + 1
			--DEFAULT_CHAT_FRAME:AddMessage("Adding : "..spellName)
			
			local line = {};	
			
			--line['text'] = ""
			line['justify'] = "LEFT"
			line['text'] = spellName				
			--line['justify2'] = "LEFT"
			line['func'] = 'OnTrackClick'
			line['arg1'] = self			
			line['arg2'] = menuLookUp[spellName]
			line['hasCheck'] = true							
			if pTrack and spellName == pTrack then				
				line['checked'] = true				
			else
				line['checked'] = false
			end
	-- 'checkIcon', self.factions[i].isCollapsed and "Interface\\Buttons\\UI-PlusButton-Up" or "Interface\\Buttons\\UI-MinusButton-Up",
			--end
			
			cat:AddLine(line)			
		end
	end	

	if ( numTrack == 0 ) then
		cat:AddLine(
			'text', L["TRACKER_NOTHING_TEXT"]
		)
	else
		cat:AddLine()
		
		local line = {};	
			
		line['text'] = L["TRACKER_STOP_TRACKING"]
		line['textR'] = 1
		line['textG'] = 1
		line['textB'] = 0		
		line['func'] = 'Tracker_CancelTrackingBuff'
		line['arg1'] = self			
		line['hasCheck'] = true
		if pTrack and L["TRACKER_STOP_TRACKING"] == pTrack then				
			line['checked'] = true
		else
			line['checked'] = false
		end
		
		cat:AddLine(line)					
	end	
end
	
function TrackerFu:OnClick()
	-- do something
end