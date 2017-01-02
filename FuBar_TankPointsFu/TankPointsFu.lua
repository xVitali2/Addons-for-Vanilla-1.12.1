TankPointsFu = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceDB-2.0", "AceHook-2.0", "AceEvent-2.0", "AceDebug-2.0", "FuBarPlugin-2.0")

local L = AceLibrary("AceLocale-2.2"):new("TankPointsFu")
local tablet = AceLibrary("Tablet-2.0")
local crayon = AceLibrary("Crayon-2.0")
local compost = AceLibrary("Compost-2.0")
local dewdrop = AceLibrary("Dewdrop-2.0")
local status = AceLibrary("SpellStatus-1.0");
local gratuity = AceLibrary("Gratuity-2.0")

local statData = {}

local function print(text)
	DEFAULT_CHAT_FRAME:AddMessage(text)
end

-- Set any constant arrays etc here
local const = {

	TANKPOINTS_EFFECTS = {
		{ effect = "HEALTH",	name = "Max Health",	fmt = "%d",	color = "ffff00",	cat = "PRIMARY" },
		{ effect = "ARMOR",	name = "Armor",	fmt = "%d",	color = "ffff00",	cat = "PRIMARY" },
		{ effect = "DEFENSE",	name = "Defense",	fmt = "%d",	color = "ffff00",	cat = "PRIMARY" },
		{ effect = "DODGE",	name = "Dodge",	fmt = "%0.1f%%",	color = "ffff00",	cat = "AVOID" },
		{ effect = "PARRY",	name = "Parry",	fmt = "%0.1f%%",	color = "ffff00",	cat = "AVOID" },
		{ effect = "BLOCK",	name = "Block Chance",	fmt = "%0.1f%%",	color = "ffff00",	cat = "AVOID" },
		{ effect = "BLOCKV",	name = "Block Value",	fmt = "%d",	color = "ffff00",	cat = "AVOID" },
		{ effect = "BOSSMISS",	name = "Boss Miss Chance",	fmt = "%0.1f%%",	color = "ffff00",	cat = "AVOID" },
		{ effect = "CRIT",	name = "Critical Hit",	fmt = "%d%%",	color = "ff8000",	cat = "COMBAT" },
		{ effect = "HIT",	name = "+Hit",	fmt = "+%d",	color = "ff8000",	cat = "COMBAT" },
		{ effect = "AP",	name = "Attack Power",	fmt = "%d",	color = "ff8000",	cat = "COMBAT" },
		{ effect = "ARMORREDUCTION",	name = "Armour Reduction",	fmt = "%0.1f%%",	color = "ffff00",	cat = "CALCULATED" },
		{ effect = "TANKPOINTS",	name = "Tank Points",	fmt = "%d",	color = "ffff00",	cat = "CALCULATED" },
		{ effect = "TOTALAVOIDANCE",	name = "Total Avoidance",	fmt = "%0.1f%%",	color = "ffff00",	cat = "CALCULATED" },
		{ effect = "RESARCANE",	name = "Arcane Resistance",	fmt = "%d",	color = "80c0ff",	cat = "RESISTANCES" },
		{ effect = "RESFIRE",	name = "Fire Resistance",	fmt = "%d",	color = "ff8080",	cat = "RESISTANCES" },
		{ effect = "RESNATURE",	name = "Nature Resistance",	fmt = "%d",	color = "80ff80",	cat = "RESISTANCES" },
		{ effect = "RESFROST",	name = "Frost Resistance",	fmt = "%d",	color = "8080ff",	cat = "RESISTANCES" },
		{ effect = "RESSHADOW",	name = "Shadow Resistance",	fmt = "%d",	color = "ff80ff",	cat = "RESISTANCES" },
	},	
	TANKPOINTS_CATEGORIES = {
			PRIMARY='Primary Tank Stats',
			AVOID='Melee Avoidance Stats',
			COMBAT='Melee Damage Stats',
			CALCULATED='Calculated Tank Stats',
			RESISTANCES='Resistances'
	},
	INV_SLOTS = {
		"HeadSlot",
		"NeckSlot",
		"ShoulderSlot",
		"BackSlot",
		"ChestSlot",
		"WristSlot",
		"HandsSlot",
		"WaistSlot",
		"LegsSlot",
		"FeetSlot",
		"Finger0Slot",
		"Finger1Slot",
		"Trinket0Slot",
		"Trinket1Slot",
		"MainHandSlot",
		"SecondaryHandSlot",
		"RangedSlot"
	},
	COLOR_LIGHTRED = "ff8080",
	COLOR_LIGHTBLUE = "a0a0ff",
	COLOR_LIGHTGREEN = "80ff80",
	COLOR_LIGHTYELLOW = "ffff40",
}

-- Standard vars
TankPointsFu.hasIcon = "Interface\\Icons\\INV_Shield_06.blp"
TankPointsFu.hasNoColor = true
TankPointsFu.isScanning = false


function TankPointsFu:IsOption1()
	return self.db.profile.option1
end

function TankPointsFu:ToggleOption1()
	self.db.profile.option1 = not self.db.profile.option1
end

function TankPointsFu:IsDisplayVarsTankPoints()
	return self.db.profile.DisplayVarsTankPoints
end

function TankPointsFu:ToggleDisplayVarsTankPoints()
	self.db.profile.DisplayVarsTankPoints = not self.db.profile.DisplayVarsTankPoints
	self:UpdateText()
end

function TankPointsFu:IsDisplayVarsArmor()
	return self.db.profile.DisplayVarsArmor
end

function TankPointsFu:ToggleDisplayVarsArmor()
	self.db.profile.DisplayVarsArmor = not self.db.profile.DisplayVarsArmor
	self:UpdateText()
end

function TankPointsFu:IsDisplayVarsDefense()
	return self.db.profile.DisplayVarsDefense
end

function TankPointsFu:ToggleDisplayVarsDefense()
	self.db.profile.DisplayVarsDefense = not self.db.profile.DisplayVarsDefense
	self:UpdateText()
end

function TankPointsFu:IsDisplayVarsAP()
	return self.db.profile.DisplayVarsAP
end

function TankPointsFu:ToggleDisplayVarsAP()
	self.db.profile.DisplayVarsAP = not self.db.profile.DisplayVarsAP
	self:UpdateText()
end

function TankPointsFu:IsDisplayVarsCrit()
	return self.db.profile.DisplayVarsCrit
end

function TankPointsFu:ToggleDisplayVarsCrit()
	self.db.profile.DisplayVarsCrit = not self.db.profile.DisplayVarsCrit
	self:UpdateText()
end

function TankPointsFu:IsDisplayClassic()
	return self.db.profile.DisplayClassic
end

function TankPointsFu:ToggleDisplayClassic()
	self.db.profile.DisplayClassic = not self.db.profile.DisplayClassic
	self:TankPointsRecalculate()
	self:UpdateText()
end

function TankPointsFu:IsCallLastStand()
	return self.db.profile.CallLastStand
end

function TankPointsFu:ToggleCallLastStand()
	self.db.profile.CallLastStand = not self.db.profile.CallLastStand
end

function TankPointsFu:IsCallShieldWall()
	return self.db.profile.CallShieldWall
end

function TankPointsFu:ToggleCallShieldWall()
	self.db.profile.CallShieldWall = not self.db.profile.CallShieldWall
end

function TankPointsFu:IsCallChallengingShout()
	return self.db.profile.CallChallengingShout
end

function TankPointsFu:ToggleCallChallengingShout()
	self.db.profile.CallChallengingShout = not self.db.profile.CallChallengingShout
end

function TankPointsFu:IsCallWithYell()
	return self.db.profile.CallWithYell
end

function TankPointsFu:ToggleCallWithYell()
	self.db.profile.CallWithYell = not self.db.profile.CallWithYell
end

function TankPointsFu:IsCallWithRaid()
	return self.db.profile.CallWithRaid
end

function TankPointsFu:ToggleCallWithRaid()
	self.db.profile.CallWithRaid = not self.db.profile.CallWithRaid
end

function TankPointsFu:IsCallWithRaidW()
	return self.db.profile.CallWithRaidW
end

function TankPointsFu:ToggleCallWithRaidW()
	self.db.profile.CallWithRaidW = not self.db.profile.CallWithRaidW
end

function TankPointsFu:testFunction()
	self:Debug(">>> test Function");
end

local options = {
	type = 'group',
	args = {
		checkraid = {
			order = 80,
			type = 'execute',
			name = "Check Tankpoints: RAID",
			desc = "Get the tank stats for all tanks in your current raid",
			func = function() TankPointsFu:checkTanks('RAID') end
		},
		checkguild = {
			order = 82,
			type = 'execute',
			name = "Check Tankpoints: GUILD",
			desc = "Get the tank stats for all tanks in your guild",
			func = function() TankPointsFu:checkTanks('GUILD') end
		},
		doReport = {
			order = 90,
			type = 'group',
			name = "Report Stats",
			desc = "Report your tank stats to a channel",
			args = {
				doReportGuild = {
					order = 91,
					type = 'execute',
					name = "to: GUILD",
					desc = "Reports your stats to the GUILD channel",
					func = function() TankPointsFu:reportMyStats('GUILD') end
				},
				doReportRaid = {
					order = 92,
					type = 'execute',
					name = "to: RAID",
					desc = "Reports your stats to the RAID channel",
					func = function() TankPointsFu:reportMyStats('RAID') end
				},
				doReportParty = {
					order = 93,
					type = 'execute',
					name = "to: PARTY",
					desc = "Reports your stats to your PARTY channel",
					func = function() TankPointsFu:reportMyStats('PARTY') end
				},
				doReportSay = {
					order = 94,
					type = 'execute',
					name = "to: SAY",
					desc = "Reports your stats to SAY",
					func = function() TankPointsFu:reportMyStats('SAY') end
				},
			},
		},
		blank1 = {
			order = 99,
			type = 'header',
		},
		displayVars = {
			order = 100,
			type = 'group',
			name = "Display",
			desc = "Stats to Display",
			args = {
				tankpoints = {
					type = 'toggle',
					name = crayon:White("Tank Points"),
					desc = "Your Tank points",
					get = "IsDisplayVarsTankPoints",
					set = "ToggleDisplayVarsTankPoints",
				},
				armor = {
					type = 'toggle',
					name = crayon:Colorize(const.COLOR_LIGHTGREEN, "Armour"),
					desc = "Your Armour",
					get = "IsDisplayVarsArmor",
					set = "ToggleDisplayVarsArmor",
				},
				defense = {
					type = 'toggle',
					name = crayon:Colorize(const.COLOR_LIGHTBLUE, "Defense"),
					desc = "Your Defense value",
					get = "IsDisplayVarsDefense",
					set = "ToggleDisplayVarsDefense",
				},
				attackpower = {
					type = 'toggle',
					name = crayon:Colorize(const.COLOR_LIGHTYELLOW, "Attack Power"),
					desc = "Your Attack Power",
					get = "IsDisplayVarsAP",
					set = "ToggleDisplayVarsAP",
				},
				crit = {
					type = 'toggle',
					name = crayon:Colorize(const.COLOR_LIGHTRED, "Critical Hit %"),
					desc = "Your melee Critical Hit chance",
					get = "IsDisplayVarsCrit",
					set = "ToggleDisplayVarsCrit",
				},
			}
		},
			calcMethod = {
				type = 'toggle',
				name = crayon:Colorize(const.COLOR_LIGHTGREEN, "Use 'Classic' calculation"),
				desc = "Calculate tank points using the original formula instead",
				get = "IsDisplayClassic",
				set = "ToggleDisplayClassic",
			},
		blank2 = {
			order = 110,
			type = 'header',
		},
		calls = {
			order = 120,
			type = 'group',
			name = "Calls",
			desc = "Automated calls on ability use",
			args = {
				laststand = {
					type = 'toggle',
					name = crayon:White("Last Stand"),
					desc = "Call out when you use Last Stand",
					get = "IsCallLastStand",
					set = "ToggleCallLastStand",
				},
				shieldwall = {
					type = 'toggle',
					name = crayon:White("Shield Wall"),
					desc = "Call out when you use Shield Wall",
					get = "IsCallShieldWall",
					set = "ToggleCallShieldWall",
				},
				challenging = {
					type = 'toggle',
					name = crayon:White("Challenging Shout"),
					desc = "Call out when you use Challenging Shout",
					get = "IsCallChallengingShout",
					set = "ToggleCallChallengingShout",
				},
			},
		},
		callChannel = {
			order = 130,
			type = 'group',
			name = "Call to Channels",
			desc = "Channel(s) to report ability use to",
			args = {
				callwithyell = {
					order = 131,
					type = 'toggle',
					name = crayon:White("Yell"),
					desc = "Use YELL to report ability use",
					get = "IsCallWithYell",
					set = "ToggleCallWithYell",
				},
				callwithraid = {
					order = 132,
					type = 'toggle',
					name = crayon:White("Raid"),
					desc = "Use RAID to report ability use",
					get = "IsCallWithRaid",
					set = "ToggleCallWithRaid",
				},
				callwithraidw = {
					order = 133,
					type = 'toggle',
					name = crayon:White("Raid Warning"),
					desc = "Use RAID WARNING to report ability use",
					get = "IsCallWithRaidW",
					set = "ToggleCallWithRaidW",
				},
			},
		},
	},
	handler = TankPointsFu,
}

TankPointsFu:RegisterChatCommand(L["AceConsole-Commands"], options)
TankPointsFu.OnMenuRequest = options


function TankPointsFu:OnInitialize()
	self:RegisterDB("FuBar_TankPointsDB")
	TankPointsFu:RegisterDefaults('profile', {
		DisplayVarsTankPoints = true,
		DisplayVarsArmor = false,
		DisplayVarsDefense = false,
		DisplayVarsAP = false,
		DisplayVarsCrit = false,
		DisplayClassic = false,
		CallLastStand = true,
		CallShieldWall = true,
		CallChallengingShout = true,
		CallWithYell = true,
		CallWithRaid = true,
		CallWithRaidW = false,
	})
end

function TankPointsFu:OnEnable()
	self:Debug(">>> Event registered");
	self:RegisterEvent("UNIT_AURA") -- simple use of :RegisterEvent()
	self:RegisterEvent("UNIT_INVENTORY_CHANGED", "onGenericTrigger") -- simple use of :RegisterEvent()
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "onGenericTrigger")
	self:RegisterEvent("CHAT_MSG_ADDON")
	self:RegisterEvent("SpellStatus_SpellCastInstant") -- Spell Status mixin
end

function TankPointsFu:OnDisable()
end

function TankPointsFu:UpdateData()
	self:Debug("Updating Data")
end

-- Request stats from tanks
-- TODO: Only raidleader and (A) can initiate this function.
-- TODO: Create some sort of GUI frame that displays the feedback info and can be sorted
function TankPointsFu:checkTanks(channel)
	SendAddonMessage("TANKPOINTSFU", "check", channel)
end

function TankPointsFu:CHAT_MSG_ADDON(msgPrefix,msgFunction,msgChannel,msgSender)
	local lc,ec = UnitClass("player");
	local playerName = UnitName("player")
	--self:Debug("CHAT_MSG_ADDON channel received a request: "..msgPrefix.." : "..msgFunction.." : "..msgChannel.." : "..msgSender)
	if (msgPrefix == "TANKPOINTSFU") then
		if (msgFunction == "check" and ec == "WARRIOR") then -- Only report if you are a warrior.
			self:ReportToChannel(msgChannel)
		elseif (msgFunction == "salute" and ec == "WARRIOR" and msgChannel == "RAID") then
			-- SendAddonMessage("TANKPOINTSFU", "salute", "RAID")
			if (playerName == msgSender) then
				SendChatMessage("Attention! Report in Soldiers!","YELL", nil)
			else
				DoEmote("SALUTE", msgSender)
				SendChatMessage("Sir! Yes Sir!","YELL", nil)
			end
		end
	end
end

-- Do the report
function TankPointsFu:ReportToChannel(msgChannel)
	self:CalculateBaseBlockValue()
	self:TankPointsRecalculate()
	local reportString = format("Health:%d Armour:%d Avoidance:%d%% Def:%d",statData["HEALTH"],statData["ARMOR"],statData["TOTALAVOIDANCE"],statData["DEFENSE"])
	SendChatMessage(reportString,msgChannel,nil)
end

function TankPointsFu:reportMyStats(msgChannel)
	self:CalculateBaseBlockValue()
	self:TankPointsRecalculate()
	local reportString = format("Health:%d Armour:%d Avoidance:%d%% Def:%d",statData["HEALTH"],statData["ARMOR"],statData["TOTALAVOIDANCE"],statData["DEFENSE"])
	SendChatMessage(reportString,msgChannel,nil)
end

function TankPointsFu:UNIT_AURA(person) -- called whenever the event is fired.
	if ( person == 'player' ) then
		self:Debug("UNIT_AURA: It's you!")
		self:TankPointsRecalculate()
		self:UpdateText()
	end
end

-- Called on enter world and when inventory changes
function TankPointsFu:onGenericTrigger()
	self:Debug("Generic Trigger!")
	-- Calculate block value here
	self:CalculateBaseBlockValue()
	self:TankPointsRecalculate()
	self:UpdateText()
end

-- Bonus Scanner functions
-- Version 1.0.0 - added +hit to logic.
function TankPointsFu:CalculateBaseBlockValue()
	local slotName, slotId, slotChecked, blockValue, hasItem, i, toHit
	if ( self.isScanning ) then
		self:Debug("Aborting new scan due to currently scanning")
		return
	else
		self.isScanning = true
		statData["BASEBLOCKVALUE"] = 0
		statData["HIT"] = 0
		-- Get base block value from shield
		slotName = "SecondaryHandSlot"
		slotId = GetInventorySlotInfo(slotName)
		hasItem,_,_ = gratuity:SetInventoryItem("player", slotId)
		blockValue = gratuity:FindDeformat("%d Block")
		if (blockValue) then
			statData["BASEBLOCKVALUE"] = blockValue
		end
		self:Debug("... scanning inventory")
		-- Now cycle through all equipped items looking for +block value
		for i, slotName in const.INV_SLOTS do
			slotId = GetInventorySlotInfo(slotName)
			hasItem,_,_ = gratuity:SetInventoryItem("player", slotId)
			-- Logic to check for +hit
			toHit = gratuity:FindDeformat("Equip: Improves your chance to hit by %d%.")
			if (toHit) then
				statData["HIT"] = statData["HIT"] + toHit
			end
			-- Logic to check for +blockvalue
			if (statData["BASEBLOCKVALUE"] > 0) then
				blockValue = gratuity:FindDeformat("Equip: Increases the block value of your shield by %d.")
				if (blockValue) then
					statData["BASEBLOCKVALUE"] = statData["BASEBLOCKVALUE"] + blockValue
				end
				-- Additional check for ZG enchantment
				if ( slotName == "HeadSlot" or slotName == "LegsSlot" ) then
					_,_,blockValue = gratuity:FindDeformat("Defense +%d/Stamina +%d/Block Value +%d")
--					self:Debug(slotName," : ",blockValue)
					if (blockValue) then
						statData["BASEBLOCKVALUE"] = statData["BASEBLOCKVALUE"] + blockValue
					end
				end
			end
		end
		self:Debug("Total Block Value:",statData["BASEBLOCKVALUE"])
		self:Debug("Total +Hit:",statData["HIT"])
		self.isScanning = false
	end
end

-- Any ability used will be trapped by this function.
function TankPointsFu:SpellStatus_SpellCastInstant(sId, sName, sRank, sFullName, sCastTime)
  self:Debug("SpellStatus_SpellCastInstant",sId,sName,sRank,sFullName,sCastTime)
  local reportMsg
  if ( sName == L["Last Stand"] and self.db.profile.CallLastStand == true ) then
  	reportMsg = ">>> LAST STAND USED <<<"
  elseif ( sName == L["Shield Wall"] and self.db.profile.CallShieldWall == true ) then
  	reportMsg = "*** SHIELD WALL USED ***"
  elseif ( sName == L["Challenging Shout"] and self.db.profile.CallChallengingShout == true ) then
  	reportMsg = "^^^ MASS TAUNT ^^^"
	end
	if (reportMsg) then
		if ( self.db.profile.CallWithYell ) then
			SendChatMessage(reportMsg,"YELL",nil)
		end
		if ( self.db.profile.CallWithRaid ) then
			SendChatMessage(reportMsg,"RAID",nil)
		end
		if ( self.db.profile.CallWithRaidW ) then
			SendChatMessage(reportMsg,"RAID_WARNING",nil)
		end
	end
end

-- Main calculation function
function TankPointsFu:TankPointsRecalculate()
	local tmp1, tmp2, tmp3
	local playerLevel = UnitLevel('player')
	tmp1, tmp2 = UnitArmor('player')
	statData["ARMOR"] = tmp2
	statData["HEALTH"] = UnitHealthMax('player')
	tmp1, tmp2 = UnitDefense('player')
	statData["DEFENSE"] = tmp1 + tmp2
	statData["DODGE"] = GetDodgeChance()
	statData["PARRY"] = GetParryChance()
	statData["BLOCK"] = GetBlockChance()
	statData["BOSSMISS"] = 5 + ((statData["DEFENSE"] - 315) * 0.04)	-- 315 assumes a level 63 boss
	statData["CRIT"] = self:GetCritChance()
	tmp1, tmp2, tmp3 = UnitAttackPower('player')
	statData["AP"] = tmp1 + tmp2 + tmp3
	tmp1 = statData["ARMOR"]/((85 * playerLevel) + 400);
	statData["ARMORREDUCTION"] = 100 * (tmp1/(tmp1 + 1))

	local stanceModifier = 1;
	local currentStance = "Default";
	for i = 1, GetNumShapeshiftForms(), 1 do
		local icon, name, isActive = GetShapeshiftFormInfo(i);
		if isActive then
			currentStance = name;
		end
	end
	if (currentStance == L["Defensive Stance"]) then
		stanceModifier = 0.9;
	elseif (currentStance == L["Berserker Stance"]) then
		stanceModifier = 1.1;
	end
	statData["STANCENAME"] = currentStance

	statData["BLOCKV"] = 0
	local block = 0
	self:Debug("Base block:",statData["BASEBLOCKVALUE"])
	if (statData["BASEBLOCKVALUE"] > 0) then	-- only factor in, if we have a shield equipped.
		_,tmp1 = UnitStat("player",1) -- Strength .... hopefully
		statData["BLOCKV"] = statData["BASEBLOCKVALUE"] + math.floor(tmp1 / 22)
		block = statData["BLOCKV"] * ((1 + 0.02*statData["BLOCK"])/3) / 1500
	end
	--self:Debug("block: ",block)
	
	self:Debug("Calculating tank points")
	local CritReduction = ( statData["DEFENSE"] - playerLevel * 5 ) * 0.04 * 0.01
	--self:Debug("Crit Reduction: "..CritReduction)
	local mobCrit = math.max(0,0.05 - CritReduction)
	--self:Debug("Mob Crit: "..mobCrit)
	local mobCrush = 0.15 * (1 - statData["BLOCK"] * 0.01) * 0.5
	--self:Debug("Mob Crush: "..mobCrush)
	local mobMiss = statData["BOSSMISS"] * 0.01
	--self:Debug("Boss miss: "..mobMiss)
	local dodge = statData["DODGE"] * 0.01
	local parry = statData["PARRY"] * 0.01
	local ArmorReduction = statData["ARMORREDUCTION"] * 0.01


	local TotalReduction = 0
	if ( self.db.profile.DisplayClassic ) then
		mobMiss = (5 + ((statData["DEFENSE"] - 300) * 0.04)) * 0.01
		TotalReduction = 1 - (mobCrit * 2 + (1 - mobCrit - mobMiss - dodge - parry)) * (1 - ArmorReduction) * stanceModifier
		statData["TANKPOINTSCLASSIC"] = statData["HEALTH"] / (1-TotalReduction)
		statData["TANKPOINTS"] = statData["TANKPOINTSCLASSIC"]
	else
		TotalReduction = 1 - ( (1+mobCrit+mobCrush-block) * (1-mobMiss-dodge-parry) * (1-ArmorReduction) * stanceModifier )
		statData["TANKPOINTSNEW"] = statData["HEALTH"] / (1-TotalReduction)
		statData["TANKPOINTS"] = statData["TANKPOINTSNEW"]
	end
	statData["TOTALAVOIDANCE"] = statData["DODGE"] + statData["PARRY"] + statData["BOSSMISS"]
	
	tmp1, statData["RESARCANE"] = UnitResistance("player",6)
	tmp1, statData["RESFIRE"] = UnitResistance("player",2)
	tmp1, statData["RESNATURE"] = UnitResistance("player",3)
	tmp1, statData["RESFROST"] = UnitResistance("player",4)
	tmp1, statData["RESSHADOW"] = UnitResistance("player",5)
end

-- This is the bit where we display the actual tank points
function TankPointsFu:UpdateText()
	self:Debug("Updating Text")
	local displayText = ""
	if ( not statData["TANKPOINTS"] ) then
		statData["TANKPOINTS"] = 0
	end
	if ( self.db.profile.DisplayVarsTankPoints ) then
		displayText = displayText..crayon:White(format("%d",statData["TANKPOINTS"])).."  "
	end
	if ( self.db.profile.DisplayVarsArmor ) then
		displayText = displayText..crayon:Colorize(const.COLOR_LIGHTGREEN, statData["ARMOR"]).."  "
	end
	if ( self.db.profile.DisplayVarsDefense ) then
		displayText = displayText..crayon:Colorize(const.COLOR_LIGHTBLUE, statData["DEFENSE"]).."  "
	end
	if ( self.db.profile.DisplayVarsAP ) then
		displayText = displayText..crayon:Colorize(const.COLOR_LIGHTYELLOW, statData["AP"]).."  "
	end
	if ( self.db.profile.DisplayVarsCrit ) then
		displayText = displayText..crayon:Colorize(const.COLOR_LIGHTRED, statData["CRIT"].."%").."  "
	end
	self:SetText(displayText)
end

function TankPointsFu:OnTooltipUpdate()
	self:Debug("Updating Tooltip")
	local TabCat = compost:Acquire()
	for i,statcat in pairs(const.TANKPOINTS_CATEGORIES) do
		TabCat[i] = tablet:AddCategory(
			'text', L[statcat],
			'columns', 2,
			'textR', 1,
			'textG', 1,
			'textB', 1,
			'child_textR', 1,
			'child_textG', 1,
			'child_textB', 0,
			'child_text2R', 0.4,
			'child_text2G', 1,
			'child_text2B', 0.4
		)
	end
	for i,e in pairs(const.TANKPOINTS_EFFECTS) do
		TabCat[e.cat]:AddLine(
			'text', crayon:Colorize(e.color,e.name),
			'text2', format(e.fmt,statData[e.effect])
		)
	end
	compost:Reclaim(TabCat)
end

function TankPointsFu:GetCritChance()
	local critChance, iCritInfo, critNum;
	local id = 1;
	-- This may vary depending on WoW localizations.
	local atkName = L["Attack"];
	local attackSpell = GetSpellName(id,BOOKTYPE_SPELL);
	if (attackSpell ~= atkName) then
		name, texture, offset, numSpells = GetSpellTabInfo(1);
		for i=1, numSpells do
			if (GetSpellName(i,BOOKTYPE_SPELL) == atkName) then
				id = i;
			end
		end
	end
	GameTooltip:SetOwner(WorldFrame,"ANCHOR_NONE");
	GameTooltip:SetSpell(id, BOOKTYPE_SPELL);
	local spellName  = GameTooltipTextLeft2:GetText();
	GameTooltip:Hide();
	if (GetLocale()=="ruRU") then
		critNum = string.sub(spellName,-6,-2);
		critChance = math.ceil(critNum);
	else
		iCritInfo = string.find(spellName, "%s");
		critNum = string.sub(spellName,0,(iCritInfo -2));
		critChance = math.ceil(critNum);
	end
	return critChance;
end