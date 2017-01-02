--[[
	Name: LockFu-2.1
Revision: $Rev: 256 $
Author(s): fenlis (fenlis@naver.com)
Inspired By: <Other Project> by <Other Author> (Other Author's email address)
Website: <http://link.to.recent.version/here>
Documentation: <http://link.to.documentation/here>
SVN: <svn://link.to.svn/project/here>
Description: FuBar Lock for Chat & ActionBar
--]]

--~ libraries
local tablet = AceLibrary("Tablet-2.0")
local L = AceLibrary("AceLocale-2.0"):new("LockFu")

LockFu = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceDB-2.0", "AceConsole-2.0", "FuBarPlugin-2.0", "AceHook-2.0")
LockFu:RegisterDB("LockFuDB")
LockFu:RegisterDefaults("profile", {
		playclicksound = true,
		showhint = true,
		isLocked = true,
})

LockFu.hasIcon = "Interface\\AddOns\\FuBar_LockFu\\Textures\\lockfu_icon.tga"
LockFu.defaultPosition = "RIGHT"

function LockFu:IsActionBarLocked()
	return self.db.profile.isLocked;
end

function LockFu:IsChatLocked()
	if CHAT_LOCKED=="1" then
		return true;
	else
		return false;
	end
end

function LockFu:IsPlayClickSound()
	return self.db.profile.playclicksound;
end

function LockFu:IsShowHint()
	return self.db.profile.showhint;
end

local options = {
	type = 'group',
	args = {
		bars = {
			type = 'toggle',
			name = L["lockbars"],
			desc = "Toggle lockbar",
			get = "IsActionBarLocked",
			set = "ToggleBarsLock",
		},
		chat = {
			type = 'toggle',
			name = L["lockchat"],
			desc = "Toggle lockchat",
			get = "IsChatLocked",
			set = "ToggleChatLock",
		},
		sound = {
			type = 'toggle',
			name = L["playclicksoundtext"],
			desc = "Toggle sound",
			get = "IsPlayClickSound",
			set = "ToggleSound",
		},
		hint = {
			type = 'toggle',
			name = L["showhinttext"],
			desc = "Toggle show hint",
			get = "IsShowHint",
			set = "ToggleHint",
		}
	}
}
LockFu:RegisterChatCommand({"/lockfu", "/lock"}, options)
LockFu.OnMenuRequest = options

function LockFu:OnInitialize()
	self.hasNoText = true
end

function LockFu:OnEnable()
	self:barlock(self.db.profile.isLocked)
end

function LockFu:OnDisable()
	self:barlock(false)
end

--~ actionBar Lock function
function LockFu:barlock(toggle)
	if ( toggle == 1 or toggle == true ) then
		self.db.profile.isLocked = true;
		LOCK_ACTIONBAR = 1;
		self:PickupActionHook(true);
	else
		self.db.profile.isLocked = false;
		LOCK_ACTIONBAR = 0;
		self:PickupActionHook(false);
	end
end

--~ Hook functions
function LockFu:LockFu_PickupAction(id)
	if self:ShouldAllowPickupAction() then
		self.save_pickupaction(id);
	end
end

function LockFu:ShouldAllowPickupAction()
	if self:IsActionBarLocked() == false or IsShiftKeyDown() then
		return true;
	else
		return false;
	end
end

--~ Hook
function LockFu:PickupActionHook(toggle)
	if toggle and self:IsHooked("PickupAction") == false then
			self.save_pickupaction = PickupAction
			self:Hook("PickupAction", "LockFu_PickupAction");
	else
		if self:IsHooked("PickupAction") then
			self:Unhook("PickupAction", "LockFu_PickupAction");
			self.save_pickupaction = nil;
		end
	end
end

--~ bars toggle
function LockFu:ToggleBarsLock()
	if Bongos then
		return
	end
	if (self.db.profile.isLocked == true) then
		self.db.profile.isLocked = false
	else 
		self.db.profile.isLocked = true
	end
	self:barlock(self.db.profile.isLocked)
	self:UpdateTooltip()
end

--~ chat toggle
function LockFu:ToggleChatLock()
	if (CHAT_LOCKED=="1") then 
		CHAT_LOCKED="0"
	else 
		CHAT_LOCKED="1"
	end
	self:UpdateTooltip()
end

--~ hint in tooltip toggle
function LockFu:ToggleHint()
	self.db.profile.showhint = not self.db.profile.showhint
end

--~ playclicksoound toggle
function LockFu:ToggleSound()
	self.db.profile.playclicksound = not self.db.profile.playclicksound
end

--~ on click
function LockFu:OnClick()
	if not Bongos then
		self:ToggleBarsLock()
	end
	self:ToggleChatLock()
	
	if self.db.profile.playclicksound
		then PlaySoundFile("Interface\\AddOns\\FuBar_LockFu\\Sounds\\click.mp3")
	end
end

--~ tooltip via TabletLib
function LockFu:OnTooltipUpdate()
	local cat = tablet:AddCategory(
		'columns', 2
	)
	if not Bongos then 
		cat:AddLine(
			'text', L["tipbars"],
			'text2', (self.db.profile.isLocked == true) and L["tiplocked"] or L["tipunlocked"]
		)
	end
	cat:AddLine(
		'text', L["tipchat"],
		'text2', (CHAT_LOCKED=="1") and L["tiplocked"] or L["tipunlocked"]
	)
	if self.db.profile.showhint then
		if Bongos then tablet:SetHint("\n" .. L["hintleftclickalt"] .. "\n" .. L["hintrightclickalt"])
		else tablet:SetHint("\n" .. L["hintleftclick"] .. "\n" .. L["hintrightclick"])
		end
	end
end