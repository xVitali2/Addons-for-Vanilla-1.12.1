CreateFrame("Frame", "MPOWA", UIParent)
MPOWA.Build = 29
MPOWA.Cloaded = false
MPOWA.loaded = false
MPOWA.selected = 1
MPOWA.CurEdit = 1
MPOWA.Page = 1

MPOWA.frames = {}
MPOWA.GrowingOut = {}
MPOWA.auras = {}
MPOWA.groupByNames = {}
MPOWA.groupByUnit = {}
MPOWA.NumBuffs = 0
MPOWA.NeedUpdate = {}
MPOWA.RaidGroupMembers = {}
MPOWA.testall = false

MPOWA.active = {}
MPOWA.pushed = {}
MPOWA.activeTimer = {}
MPOWA.mounted = false
MPOWA.party = false
MPOWA.bg = false
MPOWA.instance = false
MPOWA.Zones = {
	[MPOWA_ZONES_MC] = true,
	[MPOWA_ZONES_BWL] = true,
	[MPOWA_ZONES_ONY] = true,
	[MPOWA_ZONES_ZG] = true,
	[MPOWA_ZONES_AQ401] = true,
	[MPOWA_ZONES_AQ20] = true,
	[MPOWA_ZONES_AQ402] = true,
	[MPOWA_ZONES_NAXX] = true,
}

MPOWA.SOUND = {
	[0] = "None",
	[1] = "LEVELUP",
	[2] = "LOOTWINDOWCOINMPOWA:SOUND",
	[3] = "MapPing",
	[4] = "HumanExploration",
	[5] = "QUESTADDED",
	[6] = "QUESTCOMPLETED",
	[7] = "WriteQuest",
	[8] = "Fishing Reel in",
	[9] = "igPVPUpdate",
	[10] = "ReadyCheck",
	[11] = "RaidWarning",
	[12] = "AuctionWindowOpen",
	[13] = "AuctionWindowClose",
	[14] = "TellMessage",
	[15] = "igBackPackOpen",
	[16] = "aggro.ogg",
	[17] = "bam.ogg",
	[18] = "cat2.ogg",
	[19] = "cookie.ogg",
	[20] = "moan.ogg",
	[21] = "phone.ogg",
	[22] = "shot.ogg",
	[23] = "sonar.ogg",
	[24] = "splash.ogg",
	[25] = "wilhelm.ogg",
	[26] = "huh_1.ogg",
	[27] = "bear_polar.ogg",
	[28] = "bigkiss.ogg",
	[29] = "BITE.ogg",
	[30] = "PUNCH.ogg",
	[31] = "burp4.ogg",
	[32] = "chimes.ogg",
	[33] = "Gasp.ogg",
	[34] = "hic3.ogg",
	[35] = "hurricane.ogg",
	[35] = "hyena.ogg",
	[36] = "Squeakypig.ogg",
	[37] = "panther1.ogg",
	[38] = "rainroof.ogg",
	[39] = "snakeatt.ogg",
	[40] = "sneeze.ogg",
	[41] = "thunder.ogg",
	[42] = "wickedmalelaugh1.ogg",
	[43] = "wlaugh.ogg",
	[44] = "wolf5.ogg",
	[45] = "swordecho.ogg",	
	[46] = "throwknife.ogg",
	[47] = "yeehaw.ogg",
	[48] = "Fireball.ogg", 
	[49] = "rocket.ogg", 
	[50] = "Arrow_Swoosh.ogg", 
	[51] = "ESPARK1.ogg", 
	[52] = "chant4.ogg", 
	[53] = "chant2.ogg", 
	[54] = "shipswhistle.ogg", 
	[55] = "kaching.ogg", 
	[56] = "heartbeat.ogg",
	[57] = "Hit1.ogg", -- Thanks to Sillywet!
	[58] = "Hit2.ogg", -- Thanks to Sillywet!
	[59] = "Hit3.ogg", -- Thanks to Sillywet!
	[60] = "Hit4.ogg", -- Thanks to Sillywet!
	[61] = "Hit5.ogg", -- Thanks to Sillywet!
	[62] = "Hit6.ogg", -- Thanks to Sillywet!
	[63] = "Hit7.ogg", -- Thanks to Sillywet!
	[64] = "Hit8.ogg", -- Thanks to Sillywet!
}
MPOWA.ICONARRAY = {
	["MPowa_IconFrame_ButtonContainer_Button"] = 27,
	["MPowa_IconFrame_ButtonContainer_2_Button"] = 22,
	["MPowa_IconFrame_ButtonContainer_3_Button"] = 25,
	["MPowa_IconFrame_ButtonContainer_4_Button"] = 21,
	["MPowa_IconFrame_ButtonContainer_5_Button"] = 35,
	["MPowa_IconFrame_ButtonContainer_6_Button"] = 36,
	["MPowa_IconFrame_ButtonContainer_7_Button"] = 30,
	["MPowa_IconFrame_ButtonContainer_8_Button"] = 36,
	["MPowa_IconFrame_ButtonContainer_9_Button"] = 27,
	["MPowa_IconFrame_ButtonContainer_10_Button"] = 41,
	["MPowa_IconFrame_ButtonContainer_11_Button"] = 42,
	["MPowa_IconFrame_ButtonContainer_12_Button"] = 42,
	["MPowa_IconFrame_ButtonContainer_13_Button"] = 42,
	["MPowa_IconFrame_ButtonContainer_14_Button"] = 42,
	["MPowa_IconFrame_ButtonContainer_15_Button"] = 42,
	["MPowa_IconFrame_ButtonContainer_16_Button"] = 36
}

local stf = strfind
local _G = getglobal
local tinsert = table.insert
local tremove = table.remove
local UN = UnitName
local strform = string.format
local flr = floor
local strgfind = string.gfind
local strfind = string.find
local GT = GetTime
local tnbr = tonumber

local UpdateTime, LastUpdate = 0.05, 0
local SELECTEDICON = "Interface\\Icons\\Ability_Warrior_BattleShout"
local MPowa_BuffFrameUpdateTime = 0
local MPowa_BuffFrameFlashTime = 0
local MPowa_BuffFrameFlashState = 0
local MPowa_BUFF_ALPHA_VALUE = 0

--[[
local castByMe = {}
local oldUseAction = UseAction
UseAction = function(slot, checkCursor, onSelf)
	MPowa_Tooltip:SetOwner(UIParent, "ANCHOR_NONE")
	MPowa_Tooltip:ClearLines()
	MPowa_Tooltip:SetAction(slot)
	castByMe[MPowa_TooltipTextLeft1:GetText()] = GT()
	oldUseAction(slot, checkCursor, onSelf)
end

local oldCastSpellByName = CastSpellByName
CastSpellByName = function(spellName, onSelf)
	castByMe[spellName] = GT()
	oldCastSpellByName(spellName, onSelf)
end

local oldCastSpell = CastSpell
CastSpell = function(spellID, spellbookType)
	local spellName, spellRank = GetSpellName(spellID, spellbookType)
	if MPOWA.auras[spellname] then
		castByMe[spellName] = GT()
	end
	oldCastSpell(spellID, spellbookType)
end
--]]

function MPOWA:OnEvent(event, arg1)
	if event == "UNIT_AURA" then
		if arg1 == "target" or self.groupByUnit[arg1] then
			self:Iterate(arg1)
		end
	elseif event == "PLAYER_TARGET_CHANGED" then
		for c, v in self.auras do
			if v then
				for cat, val in v do
					if self.active[val] or self.frames[val][1]:IsVisible() then
						local p = MPOWA_SAVE[val]
						if p["enemytarget"] or p["friendlytarget"] then
							self.active[val] = false
							self:FHide(val)
							self.frames[val][3]:Hide()
							self.frames[val][1]:SetAlpha(p["alpha"])
						end
					end
				end
			end
		end
		self:Iterate("target")
	elseif event == "RAID_ROSTER_UPDATE" or event == "PARTY_MEMBERS_CHANGED" then
		self:GetGroup()
	elseif event == "PLAYER_AURAS_CHANGED" then
		--self:Print("NEW!")
		self:Iterate("player")
	else
		self:Init()
		self.loaded = true
	end
end

function MPOWA:AddGrowOut(frame, time, toSize, fromSize, key)
	if not self.GrowingOut[key] then
		self.GrowingOut[key] = {frame, time, toSize, fromSize, key, false}
	end
end

function MPOWA:GrowOut(elapsed)
	for cat, val in self.GrowingOut do
		if val then
			if not val[6] or val[6] == 0 then
				val[6] = (val[3]-val[4])/(val[2]/elapsed)
			end
			if val[1]:GetHeight()>=val[3] then
				self.GrowingOut[cat] = false
				self:FHide(cat)
				val[1]:SetHeight(val[4])
				val[1]:SetWidth(val[4])
			else
				val[1]:SetHeight(val[1]:GetHeight()+val[6])
				val[1]:SetWidth(val[1]:GetHeight()+val[6])
			end
		end
	end
end

function MPOWA:OnUpdate(elapsed)
	self:GrowOut(elapsed)
	LastUpdate = LastUpdate + elapsed
	if LastUpdate >= UpdateTime then
		for cat, val in self.NeedUpdate do
			if val then
				local path = MPOWA_SAVE[cat]
				if not self.active[cat] and self:TernaryReturn(cat, "alive", self:Reverse(UnitIsDeadOrGhost("player"))) and self:TernaryReturn(cat, "mounted", self.mounted) and self:TernaryReturn(cat, "incombat", UnitAffectingCombat("player")) and self:TernaryReturn(cat, "inparty", self.party) and self:TernaryReturn(cat, "inraid", UnitInRaid("player")) and self:TernaryReturn(cat, "inbattleground", self.bg) and self:TernaryReturn(cat, "inraidinstance", self.instance) then
					self.frames[cat][4]:Hide()
					if path["cooldown"] then
						local duration = self:GetCooldown(path["buffname"]) or 0
						if path["timer"] then
							if duration > 0 then
								if path["hundredth"] then -- check it
									self.frames[cat][3]:SetText(strform("%.2f", duration))
								else
									self.frames[cat][3]:SetText(flr(duration))
								end
								if path["inverse"] then
									self:FHide(cat)
									self.frames[cat][3]:Hide()
								else
									if path["secsleft"] then
										if duration<=path["secsleftdur"] then
											self:FShow(cat)
											self.frames[cat][3]:Show()
										else
											self:FHide(cat)
											self.frames[cat][3]:Hide()
										end
									else
										self:FShow(cat)
										self.frames[cat][3]:Show()
									end
								end
							else
								if path["inverse"] then
									self:FShow(cat)
								else
									self:FHide(cat)
								end
								self.frames[cat][3]:Hide()
							end
						else
							if path["inverse"] then
								if duration > 0 then
									self:FHide(cat)
								else
									self:FShow(cat)
								end
							else
								if path["secsleft"] then
									if duration<=path["secsleftdur"] then
										self:FShow(cat)
									else
										self:FHide(cat)
									end
								else
									if duration > 0 then
										self:FShow(cat)
									else
										self:FHide(cat)
									end
								end
							end
						end
					else
						--self:Print("Show "..path["buffname"].."//"..(self.active[cat] or "NULL"))
						self:FShow(cat)
					end
				else
					if path["inverse"] or path["cooldown"] then
						self:FHide(cat)
					end
				end
			end
		end
		for cat, val in self.active do
			if val then
				local path = MPOWA_SAVE[cat]
				local text, count = "", 0
				--self:Print(path["unit"] or "")
				if (path["unit"] or "player") == "player" then
					count = GetPlayerBuffApplications(val)
					--self:Print("Fired!! "..count)
				else
					if path["isdebuff"] then
						text, count = UnitDebuff(path["unit"], val)
					else
						text, count = UnitBuff(path["unit"], val)
					end
				end
				self:SetTexture(cat, text, val)
				if count then
					if self.pushed[cat] then
						if count<=1 and self.pushed[cat]>1 then
							count = self.pushed[cat];
						end
					end
				end
				if self:IsStacks(count or 0, cat) then
				local duration = self:GetDuration(val, cat)
					--self:Print("Showing: "..MPOWA_SAVE[cat]["buffname"])
					if (count or 0)>1 and not path["hidestacks"] then
						self.frames[cat][4]:SetText(count)
						self.frames[cat][4]:Show()
					else
						self.frames[cat][4]:Hide()
					end
					-- Duration
					if path["timer"] then
						if duration > 0 then
							if path["hundredth"] then -- check it
								self.frames[cat][3]:SetText(strform("%.2f", duration))
							else
								self.frames[cat][3]:SetText(flr(duration))
							end
						else
							self.frames[cat][3]:Hide()
						end
					end
					self:Flash(elapsed, cat, duration)
					if path["inverse"] then
						--self:Print("Hide "..path["buffname"])
						self:FHide(cat)
					else
						if path["secsleft"] then
							if duration<=path["secsleftdur"] then
								self:FShow(cat)
							else
								self:FHide(cat)
							end
						else
							self:FShow(cat)
						end
					end
				else
					--self:Print("Hiding: "..MPOWA_SAVE[cat]["buffname"])
					self:FHide(cat)
				end
			else
				if not self.NeedUpdate[cat] then
					if not self.GrowingOut[cat] then
						self:FHide(cat)
					end
				end
			end
		end
		LastUpdate = 0
	end
end

function MPOWA:SetTexture(key, texture, index)
	local p = MPOWA_SAVE[key]
	if p["texture"] == "Interface\\AddOns\\ModifiedPowerAuras\\images\\dummy.tga" then
		if texture and texture ~= "" then
			p["texture"] = texture
			self.frames[key][2]:SetTexture(texture)
		else
			local t = GetPlayerBuffTexture(index)
			if t and t ~= "" then
				p["texture"] = t
				self.frames[key][2]:SetTexture(t)
			end
		end
	end
end

function MPOWA:GetDuration(index, cat)
	local path = MPOWA_SAVE[cat]
	if not path["raidgroupmember"] then -- check this
		if path["friendlytarget"] or path["enemytarget"] then
			local time = GT()
			if (self.activeTimer[cat]+path["targetduration"]-time)<0 then
				self.activeTimer[cat] = time
			end
			return (self.activeTimer[cat]+path["targetduration"]-time)
		else
			return GetPlayerBuffTimeLeft(index) or 0
		end
	else
		return 0
	end
end

function MPOWA:GetCooldown(buff)
	-- Get Spellcooldown
	local start, duration, enabled = GetSpellCooldown(self:GetSpellSlot(buff), "spell")
	-- Get Inventory Cooldown
	if start == 0 and duration == 0 then
		for i=1, 18 do
			start, duration, enable = GetInventoryItemCooldown("player", i)
			local _,_,name = strfind(GetInventoryItemLink("player",i) or "","^.*%[(.*)%].*$")
			if (name) then
				if strfind(strlower(buff), strlower(name)) then
					if duration>2 then
						return ((start or 0)+(duration or 0))-GT()
					else
						return 0
					end
				elseif i == 18 and start == 0 and duration == 0 then
					-- Get Container Item Cooldown
					for p=0, 4 do
						for u=1, GetContainerNumSlots(p) do
							start, duration, enable = GetContainerItemCooldown(p,u)
							_,_,name=string.find(GetContainerItemLink(p,u) or "","^.*%[(.*)%].*$")
							if (not name) then break end
							if strfind(strlower(buff), strlower(name)) then
								if duration>2 then
									return ((start or 0)+(duration or 0))-GT()
								else
									return 0
								end
							elseif p == 4 and u == GetContainerNumSlots(p) then
								if duration>2 then
									return ((start or 0)+(duration or 0))-GT()
								else
									return 0
								end
							else
								return 0
							end
						end
					end
				end
			end
		end
	else
		if duration>2 then
			return ((start or 0)+(duration or 0))-GT()
		else
			return 0
		end
	end
end

function MPOWA:GetSpellSlot(buff)
	local i = 1
	while true do
		local name, rank = GetSpellName(i, "spell")
		if (not name) or strfind(strlower(buff), strlower(name)) then 
			return i
		end
		i = i + 1
	end
end

function MPOWA:FHide(key)
	local p = MPOWA_SAVE[key]
	if self.frames[key][1]:IsVisible() and ((tnbr(self.frames[key][1]:GetAlpha())<=tnbr(p["alpha"]) and tnbr(self.frames[key][1]:GetAlpha())>=tnbr(p["alpha"])) or tnbr(self.frames[key][1]:GetAlpha())==0) and not self.testall and not p["test"] then
		if p["growout"] then
			if p["fadeout"] then
				self:AddGrowOut(self.frames[key][1], 0.5, 250, 64, key)
				UIFrameFadeOut(self.frames[key][1], 0.5, tnbr(p["alpha"]), 0)
			else
				self:AddGrowOut(self.frames[key][1], 0.5, 250, 64, key)
			end
		else
			if p["fadeout"] then
				UIFrameFadeOut(self.frames[key][1], 0.5, tnbr(p["alpha"]), 0)
			else
				self.frames[key][1]:Hide()
			end
		end
	end
end

function MPOWA:FShow(key)
	local p = MPOWA_SAVE[key]
	if not self.frames[key][1]:IsVisible() and ((tnbr(self.frames[key][1]:GetAlpha())<=tnbr(p["alpha"]) and tnbr(self.frames[key][1]:GetAlpha())>=tnbr(p["alpha"])) or tnbr(self.frames[key][1]:GetAlpha())==0) then
		if p["fadein"] then
			UIFrameFadeIn(self.frames[key][1], 0.5, 0.01, tnbr(p["alpha"]))
		else
			self.frames[key][1]:Show()
		end
	end
end

local BuffExist = {}
function MPOWA:Iterate(unit)
	BuffExist = {}
	--self:Print("New Iterate ------------------------------")
	if unit=="player" then
		self:IsMounted()
		self:InParty()
		self:InBG()
		self:InInstance()
		-- Amount for Holy Strength Hackfix
		--self:Print("Set ZERO!")
	end
	
	for cat, val in self.active do
		if (not MPOWA_SAVE[cat]["unit"] and unit=="player") or (MPOWA_SAVE[cat]["unit"]==unit) then
			self.pushed[cat] = false;
		end
	end
	
	--self:Print("Iterate: "..unit)
	for i=1, 40 do
		local p = i
		local debuff
		MPowa_Tooltip:SetOwner(UIParent, "ANCHOR_NONE")
		MPowa_Tooltip:ClearLines()
		if unit == "player" then
			p = GetPlayerBuff(i-1, "HELPFUL")
			MPowa_Tooltip:SetPlayerBuff(p)
		else
			MPowa_Tooltip:SetUnitBuff(unit, i)
		end
		local buff = MPowa_TooltipTextLeft1:GetText()
		self:Push(buff, unit, p, false, MPowa_TooltipTextLeft2:GetText())
		
		if i<17 then
			MPowa_Tooltip:ClearLines()
			p = i
			if unit == "player" then
				p = GetPlayerBuff(i-1, "HARMFUL")
				MPowa_Tooltip:SetPlayerBuff(p)
			else
				MPowa_Tooltip:SetUnitDebuff(unit, i)
			end
			debuff = MPowa_TooltipTextLeft1:GetText()
			self:Push(debuff, unit, p, true, MPowa_TooltipTextLeft2:GetText())
		end
		MPowa_Tooltip:Hide()
		if not buff and not debuff then break end
		--self:Print("Pushed: "..buff.." Index: "..i.."//"..unit)
	end
	for cat, val in self.active do
		if val then
			if not BuffExist[cat] then
				local p = MPOWA_SAVE[cat]
				if ((p["friendlytarget"] or p["enemytarget"]) and unit=="target") or (not p["raidgroupmember"] and not p["friendlytarget"] and not p["enemytarget"] and unit=="player") or p["raidgroupmember"] then
					self.active[cat] = false
					self.frames[cat][3]:Hide()
					if not p["inverse"] and not p["cooldown"] then
						if p["useendsound"] then
							if p.endsound < 16 then
								PlaySound(self.SOUND[p.endsound], "master")
							else
								PlaySoundFile("Interface\\AddOns\\ModifiedPowerAuras\\Sounds\\"..self.SOUND[p.endsound], "master")
							end
						end
						self.frames[cat][1]:SetAlpha(p["alpha"])
						self:FHide(cat)
					end
				end
			end
		end
	end
end

function MPOWA:Push(aura, unit, i, isdebuff, debuffdesc)
	if self.auras[aura] then
		--self:Print("Attempt to push: "..aura.."/"..unit)
		for cat, val in self.auras[aura] do
			--self:Print(val)
			local path = MPOWA_SAVE[val]
			local bypass = self.active[val]
			--self:Print("Before con "..aura)
			if path["isdebuff"]==isdebuff and ((path["secondspecifier"] and path["secondspecifiertext"]==debuffdesc) or not path["secondspecifier"]) then
				if self:TernaryReturn(val, "alive", self:Reverse(UnitIsDeadOrGhost("player"))) and self:TernaryReturn(val, "mounted", self.mounted) and self:TernaryReturn(val, "incombat", UnitAffectingCombat("player")) and self:TernaryReturn(val, "inparty", self.party) and self:TernaryReturn(val, "inraid", UnitInRaid("player")) and self:TernaryReturn(val, "inbattleground", self.bg) and self:TernaryReturn(val, "inraidinstance", self.instance) and not path["cooldown"] then
					BuffExist[val] = true
					--self:Print("Pushed: "..aura.."//"..val.."//"..cat)
					--self:Print("After con "..aura)
					if path["enemytarget"] and unit == "target" then
						--self:Print("after con 2 "..aura.. " "..i)
						self.active[val] = i
					elseif path["friendlytarget"] and unit == "target" then
						self.active[val] = i
					elseif path["raidgroupmember"] then -- have to check those vars
						self.active[val] = i
					elseif not path["enemytarget"] and not path["friendlytarget"] and not path["raidgroupmember"] and unit == "player" then
						self.active[val] = i
					end
					if self.pushed[val] then
						self.pushed[val] = self.pushed[val] + 1;
					else
						self.pushed[val] = 1;
					end
					--self:Print(path["buffname"].." is active! // "..val)
					if self.active[val] and not bypass then
						self.activeTimer[val] = GT()
						if tnbr(self.frames[val][1]:GetAlpha())<=0.1 then
							self.frames[val][1]:SetAlpha(tnbr(path["alpha"]))
						end
						if path["usebeginsound"] then
							if path.beginsound < 16 then
								PlaySound(self.SOUND[path.beginsound], "master")
							else
								PlaySoundFile("Interface\\AddOns\\ModifiedPowerAuras\\Sounds\\"..self.SOUND[path.beginsound], "master")
							end
						end
						if not path["secsleft"] then
							self:FShow(val)
						end
						--self:Print("Is Visible: "..aura)
						--self:Print("SHown")
						--self:Print("Shown: "..path["buffname"].."/"..self.active[val])
						if path["timer"] then
							self.frames[val][3]:Show()
						end
					end
				end
			end
		end
	end
end

function MPOWA:Reverse(bool)
	if bool then
		return false
	else
		return true
	end
end

function MPOWA:IsMounted()
	MPowa_Tooltip:SetOwner(UIParent, "ANCHOR_NONE")
	for i=0,31 do
		MPowa_Tooltip:ClearLines()
		MPowa_Tooltip:SetPlayerBuff(GetPlayerBuff(i, "HELPFUL|PASSIVE"))
		local desc = MPowa_TooltipTextLeft2:GetText()
		if (not desc) then break end
		if stf(desc, MPOWA_SCRIPT_MOUNT_100) or stf(desc, MPOWA_SCRIPT_MOUNT_60) then
			self.mounted = true
			return
		end
	end
	self.mounted = false
end

function MPOWA:InParty()
	if GetNumPartyMembers() > 0 or UnitInRaid("player") then
		self.party = true
	end
	self.party = false
end

function MPOWA:InBG()
	for i=1, 4 do
		local status = GetBattlefieldStatus(i)
		if status == "active" then
			self.bg = true
			break
		end
	end
	self.bg = false
end

function MPOWA:InInstance()
	local zone = GetRealZoneText()
	if self.Zones[zone] then
		self.instance = true
	end
	self.instance = false
end

function MPOWA:GetGroup()
	local num, type = GetNumPartyMembers(), "party"
	if num <= 0 then
		num = GetNumRaidMembers()
		type = "raid"
	end
	if num > 0 then
		for i=1, num do
			local name = UN(type..i)
			if self.RaidGroupMembers[name] then
				self.groupByNames[name] = type..i
				self.groupByUnit[type..i] = name
			end
		end
	end
end

function MPOWA:TernaryReturn(id, var, real)
	if MPOWA_SAVE[id][var] == 0 then
		return true
	elseif MPOWA_SAVE[id][var] == true and real then
		return true
	elseif MPOWA_SAVE[id][var] == false and (not real) then
		return true
	end
end

function MPOWA:IsStacks(count, id)
	if MPOWA_SAVE[id].stacks ~= "" then
		local con = strsub(MPOWA_SAVE[id].stacks, 1, 2)
		local amount = tonumber(strsub(MPOWA_SAVE[id].stacks, 3))
		if amount ~= nil and con ~= nil then
			--self:Print(con.."/"..amount.."/"..count)
			if con == ">=" and count >= amount then
				return true
			elseif con == "<=" and count <= amount then
				return true
			end
		end
		con = strsub(MPOWA_SAVE[id].stacks, 1, 1)
		amount = tonumber(strsub(MPOWA_SAVE[id].stacks, 2))
		if amount ~= nil and con ~= nil then
			if con == "<" and count < amount then
				return true
			elseif con == ">" and count > amount then
				return true
			elseif con == "=" and count == amount then
				return true
			elseif con == "!" and count ~= amount then
				return true
			end
		end
		con = strfind(MPOWA_SAVE[id].stacks, "-")
		if con then
			local amount1 = tonumber(strsub(MPOWA_SAVE[id].stacks, 1, con-1))
			local amount2 = tonumber(strsub(MPOWA_SAVE[id].stacks, con+1))
			if con and amount1 and amount2 and ((count >= amount1 and count <= amount2) or (count >= amount2 and count <= amount1)) then
				return true
			end
		else
			return false
		end
	end
	return false
end

function MPOWA:Flash(elapsed, cat, timeLeft)
	local s = MPOWA_SAVE[cat]
	if s.flashanim then
		if timeLeft < s.flashanimstart then
			if ( MPowa_BuffFrameUpdateTime > 0 ) then
				MPowa_BuffFrameUpdateTime = MPowa_BuffFrameUpdateTime - elapsed;
			else
				MPowa_BuffFrameUpdateTime = MPowa_BuffFrameUpdateTime + TOOLTIP_UPDATE_TIME;
			end
		 
			MPowa_BuffFrameFlashTime = MPowa_BuffFrameFlashTime - elapsed;
			if ( MPowa_BuffFrameFlashTime < 0 ) then
				local overtime = -BuffFrameFlashTime;
				if ( MPowa_BuffFrameFlashState == 0 ) then
					MPowa_BuffFrameFlashState = 1;
					MPowa_BuffFrameFlashTime = BUFF_FLASH_TIME_ON;
				else
					MPowa_BuffFrameFlashState = 0;
					MPowa_BuffFrameFlashTime = BUFF_FLASH_TIME_OFF;
				end
				if ( overtime < MPowa_BuffFrameFlashTime ) then
					MPowa_BuffFrameFlashTime = MPowa_BuffFrameFlashTime - overtime;
				end
			end
			if ( MPowa_BuffFrameFlashState == 1 ) then
				MPowa_BUFF_ALPHA_VALUE = (BUFF_FLASH_TIME_ON - MPowa_BuffFrameFlashTime) / BUFF_FLASH_TIME_ON;
			else
				MPowa_BUFF_ALPHA_VALUE = MPowa_BuffFrameFlashTime / BUFF_FLASH_TIME_ON;
			end
			MPowa_BUFF_ALPHA_VALUE = (MPowa_BUFF_ALPHA_VALUE * (1 - BUFF_MIN_ALPHA)) + BUFF_MIN_ALPHA;
			
			self.frames[cat][1]:SetAlpha(MPowa_BUFF_ALPHA_VALUE)
		end
	end
end

--------------- Frames and Funktionallity ---------------

function MPOWA:Init()
	MPowa_Tooltip:SetOwner(UIParent, "ANCHOR_NONE")
	
	SLASH_MPOWA1 = "/mpowa"
	SlashCmdList["MPOWA"] = function(msg)
		if MPowa_MainFrame:IsVisible() then
			MPowa_MainFrame:Hide()
		else
			self:Show()
		end
	end
	
	if MPOWA_SAVE == nil then
		MPOWA_SAVE = {}
		for i=1, 49 do
			self:CreateSave(i)
		end
	end
	
	if MPOWA_SAVE[50] == nil then
		for i=50, 490 do
			self:CreateSave(i)
		end
	end
	
	if MPOWA_PROFILE == nil then
		MPOWA_PROFILE = {}
	end
	
	for cat, val in MPOWA_SAVE do
		if val["used"] or (MPOWA_SAVE[cat+1] and MPOWA_SAVE[cat+1]["used"]) then
			if not self.frames[cat] then
				self.frames[cat] = {}
			end
			
			self:CreateIcon(cat)
			self:ApplyConfig(cat)
			
			if not self.auras[val["buffname"]] then
				self.auras[val["buffname"]] = {}
			end
			tinsert(self.auras[val["buffname"]], cat)
			
			if val["inverse"] or val["cooldown"] then
				self.NeedUpdate[cat] = true
			end
			
			if val["enemytarget"] or val["friendlytarget"] then
				MPOWA_SAVE[cat]["unit"] = "target"
			else
				MPOWA_SAVE[cat]["unit"] = nil
			end
			
			if val["used"] then
				self.NumBuffs = cat
			end
			
			if val["rgmname"] then
				self.RaidGroupMembers[val["rgmname"]] = true
			end
			
			if not val["secsleftdur"] or val["secsleftdur"] == "" then
				MPOWA_SAVE[cat]["secsleftdur"] = 0
			end
			
			if not val["inraidinstance"] then
				MPOWA_SAVE[cat]["inraidinstance"] = 0
			end
			--self:Print(cat.."//"..MPOWA_SAVE[cat]["buffname"])

			if not val["secondspecifiertext"] then
				MPOWA_SAVE[cat]["secondspecifiertext"] = ""
			end
		end
		val["test"] = false
	end
	self.testAll = false
end

function MPOWA:Pager(left)
	if left then
		if self.Page<=1 then
			self.Page = 1
		else
			self.Page = self.Page - 1
		end
	else
		if self.Page >= 10 then
			self.Page = 10
		else
			self.Page = self.Page + 1
		end
	end
	self:UpdatePage()
end

function MPOWA:UpdatePage()
	MPowa_MainFrame_Pages:SetText(self.Page.."/10")
	self:Show()
	self:Reposition()
end

function MPOWA:Print(msg)
	DEFAULT_CHAT_FRAME:AddMessage("MPOWA: "..msg)
end

---------------- Options ------------------------

function MPOWA:CreateSave(i)
	MPOWA_SAVE[i] = {
		texture = "Interface\\AddOns\\ModifiedPowerAuras\\images\\dummy.tga",
		alpha = 1,
		size = 0.75,
		x = 0,
		y = -30,
		buffname = "",
		isdebuff = false,
		timer = false,
		inverse = false,
		used = false,
		test = false,
		cooldown = false,
		enemytarget = false,
		friendlytarget = false,
		stacks = ">=0",
		targetduration = 0,
		alive = 0,
		mounted = 0,
		incombat = 0,
		inparty = 0,
		inraid = 0,
		inbattleground = 0,
		fontalpha = 1,
		fontoffsetx = 0,
		fontoffsety = 0,
		fontsize = 1.5,
		hundredth = false,
		usefontcolor = false,
		fontcolor_r = 1,
		fontcolor_g = 1,
		fontcolor_b = 1,
		usebeginsound = false,
		beginsound = 1,
		useendsound = false,
		endsound = 1,
		raidgroupmember = false,
		exactname = false,
		flashanim = false,
		flashanimstart = 5,
		unit = "player",
		rgmname = "",
		icon_r = 1,
		icon_b = 1,
		icon_g = 1,
		secsleft = false,
		secsleftdur = 0,
		inraidinstance = 0,
		hidestacks = false,
		secondspecifier = false,
		secondspecifiertext = "",
	}
end

function MPOWA:Show()
	local coeff = (self.Page - 1)*49
	local bool = false
	local p = self.NumBuffs-coeff
	if (p<=0) then
		p = self.NumBuffs
		bool = true
	end
	if (not self.Cloaded) then
		for i=1, 49 do
			if i<=self.NumBuffs then
				MPOWA:CreateButton(i)
			end
		end
		self.Cloaded = true
	end
	for i=1, 49 do
		if getglobal("ConfigButton"..i) then
			getglobal("ConfigButton"..i):Hide()
		end
	end
	local e = self.Page * 49
	if e>self.NumBuffs then
		e = self.NumBuffs
	end
	for i=(1+coeff), e do
		MPOWA:ApplyAttributesToButton(i, getglobal("ConfigButton"..(i-coeff)))
	end
	if self.NumBuffs > 0 and self.NumBuffs > coeff then
		getglobal("ConfigButton"..self.selected.."_Border"):Show()
	end
	MPowa_MainFrame:Show()
end

function MPOWA:CreateButton(i)
	local button = CreateFrame("Button", "ConfigButton"..i, MPowa_ButtonContainer, "MPowa_ContainerBuffButtonTemplate")
	MPOWA:ApplyAttributesToButton(i, button)
end

function MPOWA:CreateIcon(i)
	--self:Print("Added: "..i)
	if not self.frames[i] then
		self.frames[i] = {}
	end
	CreateFrame("Frame", "TextureFrame"..i, UIParent, "MPowa_IconTemplate")
	self.frames[i][1] = _G("TextureFrame"..i)
	self.frames[i][2] = _G("TextureFrame"..i.."_Icon")
	self.frames[i][3] = _G("TextureFrame"..i.."_Timer")
	self.frames[i][4] = _G("TextureFrame"..i.."_Count")
	self.frames[i][1]:SetID(i)
	self.frames[i][1]:EnableMouse(0)
	self.frames[i][1]:Hide()
end

function MPOWA:ApplyConfig(i)
	local val = MPOWA_SAVE[i]
	self.frames[i][2]:SetTexture(val["texture"])
	self.frames[i][1]:SetAlpha(val["alpha"])
	self.frames[i][1]:ClearAllPoints()
	self.frames[i][1]:SetPoint("CENTER", UIParent, "CENTER", val["x"], val["y"])
	self.frames[i][1]:SetScale(val["size"])
	self.frames[i][3]:SetFont("Fonts\\FRIZQT__.ttf", val["fontsize"]*12, "OUTLINE")
	self.frames[i][3]:SetAlpha(val["fontalpha"])
	self.frames[i][3]:ClearAllPoints()
	self.frames[i][3]:SetPoint("CENTER", self.frames[i][1], "CENTER", val["fontoffsetx"], val["fontoffsety"])
	self.frames[i][2]:SetVertexColor(val.icon_r or 1, val.icon_g or 1, val.icon_b or 1)
	if val["usefontcolor"] then
		self.frames[i][3]:SetTextColor(val["fontcolor_r"],val["fontcolor_g"],val["fontcolor_b"],val["fontalpha"])
	end
end

function MPOWA:ApplyAttributesToButton(i, button)
	if not button then return end
	local coeff = (self.Page - 1)*49
	local p = (i-coeff)
	local bool = false
	if (p<=0) then
		p = i
		bool = true
	end
	button:ClearAllPoints()
	button:SetPoint("TOPLEFT",MPowa_ButtonContainer,"TOPLEFT",42*(p-1)+6 - floor((p-1)/7)*7*42,-11-floor((p-1)/7)*41)
	button:SetID(i)
	_G("ConfigButton"..p.."_Icon"):SetTexture(MPOWA_SAVE[i]["texture"])
	_G("ConfigButton"..p.."_Count"):SetText(i)
	_G("ConfigButton"..p.."_Border"):Hide()
	if not bool and i<=self.Page*49 then
		button:Show()
	else
		button:Hide()
	end
end

function MPOWA:AddAura()
	if self.NumBuffs < 490 then
		self.NumBuffs = self.NumBuffs + 1
		local coeff = (self.Page - 1)*49
		local bool = false
		local p = self.NumBuffs-coeff
		if (p<=0) then
			p = self.NumBuffs
			bool = true
		end
		if _G("ConfigButton"..(self.NumBuffs-coeff)) ~= nil then
			self:ApplyAttributesToButton(self.NumBuffs,_G("ConfigButton"..(self.NumBuffs-coeff)))
			if not self.frames[self.NumBuffs] then
				self:CreateIcon(self.NumBuffs)
			end
			self:ApplyConfig(self.NumBuffs)
		else
			self:CreateSave(self.NumBuffs)
			self:CreateIcon(self.NumBuffs)
			self:ApplyConfig(self.NumBuffs)
			self:CreateButton(p)
		end
		MPOWA_SAVE[self.NumBuffs]["used"] = true
		self:DeselectAll()
		if not bool then
			_G("ConfigButton"..p.."_Border"):Show()
		end
		self.selected = p
	end
end

function MPOWA:DeselectAll()
	for i=1, 49 do
		if not _G("ConfigButton"..i) then break end
		_G("ConfigButton"..i.."_Border"):Hide()
	end
end

function MPOWA:GetTablePosition(tab, value)
	for cat, val in tab do
		if val == value then
			return cat
		end
	end
	return false
end

function MPOWA:Remove()
	if ConfigButton1 then
		local coeff = (self.Page - 1)*49
		self.NumBuffs = self.NumBuffs - 1
		if (self.selected+coeff) == self.CurEdit then
			MPowa_ConfigFrame:Hide()
		end
		MPOWA_SAVE[self.selected+coeff]["used"] = false
		self.NeedUpdate[self.selected+coeff] = false
		if self.auras[MPOWA_SAVE[self.selected+coeff]["buffname"]] then
			if self:GetTableLength(self.auras[MPOWA_SAVE[self.selected+coeff]["buffname"]])>1 and self:GetTablePosition(self.auras[MPOWA_SAVE[self.selected+coeff]["buffname"]], self.selected+coeff) then
				tremove(self.auras[MPOWA_SAVE[self.selected+coeff]["buffname"]], self:GetTablePosition(self.auras[MPOWA_SAVE[self.selected+coeff]["buffname"]], self.selected+coeff))
				if self.active[self.selected+coeff] then
					self.active[self.selected+coeff] = false
				end
			else
				for cat, val in self.auras[MPOWA_SAVE[self.selected+coeff]["buffname"]] do
					if self.active[val] then
						self.active[val] = false;
					end
				end
			end
		end
		self:CreateSave(self.selected+coeff)
		self.auras[MPOWA_SAVE[self.selected+coeff]["buffname"]] = false
		self.frames[self.selected+coeff][1]:Hide()
		self.selected = self.NumBuffs-coeff
		if self.selected == 0 then
			self.selected = 1
		end
		self:Reposition()
		_G("ConfigButton"..self.selected.."_Border"):Show()
	end
end

function MPOWA:Reposition()
	local coeff = (self.Page - 1)*49
	for i=(1+coeff), self.NumBuffs +1 do
		if _G("ConfigButton"..(i-coeff)) then
			_G("ConfigButton"..(i-coeff)):Hide()
		end
	end
	local e = self.Page * 49
	if e>self.NumBuffs then
		e = self.NumBuffs
	end
	for i=(1+coeff), e do
		MPOWA:ApplyAttributesToButton(i,_G("ConfigButton"..(i-coeff)))
	end
end

function MPOWA:SelectAura(button)
	local coeff = (self.Page - 1)*49
	self.selected = button:GetID() - coeff
	self:DeselectAll()
	if _G("ConfigButton"..self.selected.."_Border") then
		_G("ConfigButton"..self.selected.."_Border"):Show()
	end
end

function MPOWA:Edit()
	if ConfigButton1 then
		local coeff = (self.Page - 1)*49
		self.CurEdit = self.selected+coeff
		for i=1, self.NumBuffs do
			if self.frames[i] then
				self.frames[i][1]:EnableMouse(false)
			end
		end
		if self.frames[self.CurEdit] then
			self.frames[self.CurEdit][1]:EnableMouse(1)
		end
		MPowa_ConfigFrame:Hide()
		MPowa_ConfigFrame_Container_1_Icon_Texture:SetTexture(MPOWA_SAVE[self.CurEdit].texture)
		MPowa_ConfigFrame_Container_1_Slider_Opacity:SetValue(MPOWA_SAVE[self.CurEdit].alpha)
		MPowa_ConfigFrame_Container_1_Slider_OpacityText:SetText(MPOWA_SLIDER_OPACITY.." "..MPOWA_SAVE[self.CurEdit].alpha)
		
		MPowa_ConfigFrame_Container_1_Slider_PosX:SetMinMaxValues(MPOWA:GetMinValues(MPOWA_SAVE[self.CurEdit].x),MPOWA:GetMaxValues(MPOWA_SAVE[self.CurEdit].x))
		MPowa_ConfigFrame_Container_1_Slider_PosX:SetValue(MPOWA_SAVE[self.CurEdit].x)
		MPowa_ConfigFrame_Container_1_Slider_PosXText:SetText(MPOWA_SLIDER_POSX.." "..MPOWA_SAVE[self.CurEdit].x)
		MPowa_ConfigFrame_Container_1_Slider_PosXLow:SetText(MPOWA:GetMinValues(MPOWA_SAVE[self.CurEdit].x))
		MPowa_ConfigFrame_Container_1_Slider_PosXHigh:SetText(MPOWA:GetMaxValues(MPOWA_SAVE[self.CurEdit].x))
		
		MPowa_ConfigFrame_Container_1_Slider_PosY:SetMinMaxValues(MPOWA:GetMinValues(MPOWA_SAVE[self.CurEdit].y),MPOWA:GetMaxValues(MPOWA_SAVE[self.CurEdit].y))
		MPowa_ConfigFrame_Container_1_Slider_PosY:SetValue(MPOWA_SAVE[self.CurEdit].y)
		MPowa_ConfigFrame_Container_1_Slider_PosYText:SetText(MPOWA_SLIDER_POSY.." "..MPOWA_SAVE[self.CurEdit].y)
		MPowa_ConfigFrame_Container_1_Slider_PosYLow:SetText(MPOWA:GetMinValues(MPOWA_SAVE[self.CurEdit].y))
		MPowa_ConfigFrame_Container_1_Slider_PosYHigh:SetText(MPOWA:GetMaxValues(MPOWA_SAVE[self.CurEdit].y))
		
		MPowa_ConfigFrame_Container_2_Slider_PosX:SetMinMaxValues(MPOWA:GetMinValues(MPOWA_SAVE[self.CurEdit].fontoffsetx),MPOWA:GetMaxValues(MPOWA_SAVE[self.CurEdit].fontoffsetx))
		MPowa_ConfigFrame_Container_2_Slider_PosX:SetValue(MPOWA_SAVE[self.CurEdit].fontoffsetx)
		MPowa_ConfigFrame_Container_2_Slider_PosXText:SetText(MPOWA_SLIDER_POSX.." "..MPOWA_SAVE[self.CurEdit].fontoffsetx)
		MPowa_ConfigFrame_Container_2_Slider_PosXLow:SetText(MPOWA:GetMinValues(MPOWA_SAVE[self.CurEdit].fontoffsetx))
		MPowa_ConfigFrame_Container_2_Slider_PosXHigh:SetText(MPOWA:GetMaxValues(MPOWA_SAVE[self.CurEdit].fontoffsetx))
		
		MPowa_ConfigFrame_Container_2_Slider_PosY:SetMinMaxValues(MPOWA:GetMinValues(MPOWA_SAVE[self.CurEdit].fontoffsety),MPOWA:GetMaxValues(MPOWA_SAVE[self.CurEdit].fontoffsety))
		MPowa_ConfigFrame_Container_2_Slider_PosY:SetValue(MPOWA_SAVE[self.CurEdit].fontoffsety)
		MPowa_ConfigFrame_Container_2_Slider_PosYText:SetText(MPOWA_SLIDER_POSY.." "..MPOWA_SAVE[self.CurEdit].fontoffsety)
		MPowa_ConfigFrame_Container_2_Slider_PosYLow:SetText(MPOWA:GetMinValues(MPOWA_SAVE[self.CurEdit].fontoffsety))
		MPowa_ConfigFrame_Container_2_Slider_PosYHigh:SetText(MPOWA:GetMaxValues(MPOWA_SAVE[self.CurEdit].fontoffsety))
		
		MPowa_ConfigFrame_Container_1_Slider_Size:SetValue(tonumber(MPOWA_SAVE[self.CurEdit].size))
		MPowa_ConfigFrame_Container_1_Slider_SizeText:SetText(MPOWA_SLIDER_SIZE.." "..MPOWA_SAVE[self.CurEdit].size)
		MPowa_ConfigFrame_Container_1_ColorpickerNormalTexture:SetVertexColor(MPOWA_SAVE[self.CurEdit].icon_r or 1, MPOWA_SAVE[self.CurEdit].icon_g or 1, MPOWA_SAVE[self.CurEdit].icon_b or 1)
		MPowa_ConfigFrame_Container_1_Colorpicker_SwatchBg.r = MPOWA_SAVE[self.CurEdit].icon_r or 1
		MPowa_ConfigFrame_Container_1_Colorpicker_SwatchBg.g = MPOWA_SAVE[self.CurEdit].icon_g or 1
		MPowa_ConfigFrame_Container_1_Colorpicker_SwatchBg.b = MPOWA_SAVE[self.CurEdit].icon_b or 1
		MPowa_ConfigFrame_Container_1_Icon_Texture:SetVertexColor(MPOWA_SAVE[self.CurEdit].icon_r or 1, MPOWA_SAVE[self.CurEdit].icon_g or 1, MPOWA_SAVE[self.CurEdit].icon_b or 1)
		MPowa_ConfigFrame_Container_2_Slider_Size:SetValue(tonumber(MPOWA_SAVE[self.CurEdit].fontsize))
		MPowa_ConfigFrame_Container_2_Slider_SizeText:SetText(MPOWA_SLIDER_SIZE.." "..MPOWA_SAVE[self.CurEdit].fontsize)
		MPowa_ConfigFrame_Container_2_Slider_Opacity:SetValue(tonumber(MPOWA_SAVE[self.CurEdit].fontalpha))
		MPowa_ConfigFrame_Container_2_Slider_OpacityText:SetText(MPOWA_SLIDER_OPACITY.." "..MPOWA_SAVE[self.CurEdit].fontalpha)
		MPowa_ConfigFrame_Container_1_2_Editbox:SetText(MPOWA_SAVE[self.CurEdit].buffname)
		MPowa_ConfigFrame_Container_1_2_Editbox_Stacks:SetText(MPOWA_SAVE[self.CurEdit].stacks)
		MPowa_ConfigFrame_Container_1_2_Editbox_Player:SetText(MPOWA_SAVE[self.CurEdit].rgmname or "")
		MPowa_ConfigFrame_Container_1_2_Editbox_DebuffDuration:SetText(MPOWA_SAVE[self.CurEdit].targetduration)
		MPowa_ConfigFrame_Container_1_2_Editbox_SECLEFT:SetText(MPOWA_SAVE[self.CurEdit].secsleftdur or "")
		MPowa_ConfigFrame_Container_1_2_Checkbutton_Debuff:SetChecked(MPOWA_SAVE[self.CurEdit].isdebuff)
		MPowa_ConfigFrame_Container_1_2_Checkbutton_ShowIfNotActive:SetChecked(MPOWA_SAVE[self.CurEdit].inverse)
		MPowa_ConfigFrame_Container_2_2_Checkbutton_Timer:SetChecked(MPOWA_SAVE[self.CurEdit].timer)
		MPowa_ConfigFrame_Container_1_2_Checkbutton_ShowCooldowns:SetChecked(MPOWA_SAVE[self.CurEdit].cooldown)
		MPowa_ConfigFrame_Container_1_2_Checkbutton_EnemyTarget:SetChecked(MPOWA_SAVE[self.CurEdit].enemytarget)
		MPowa_ConfigFrame_Container_1_2_Checkbutton_FriendlyTarget:SetChecked(MPOWA_SAVE[self.CurEdit].friendlytarget)
		MPowa_ConfigFrame_Container_1_2_Checkbutton_RaidMember:SetChecked(MPOWA_SAVE[self.CurEdit].raidgroupmember)
		MPowa_ConfigFrame_Container_1_2_Checkbutton_XSecsRemaining:SetChecked(MPOWA_SAVE[self.CurEdit].secsleft)
		MPowa_ConfigFrame_Container_1_2_Checkbutton_HideStacks:SetChecked(MPOWA_SAVE[self.CurEdit].hidestacks)
		MPowa_ConfigFrame_Container_2_2_Checkbutton_Hundreds:SetChecked(MPOWA_SAVE[self.CurEdit].hundredth)
		MPowa_ConfigFrame_Container_2_2_Checkbutton_FlashAnim:SetChecked(MPOWA_SAVE[self.CurEdit].flashanim)
		MPowa_ConfigFrame_Container_2_2_Editbox_FlashAnim:SetText(MPOWA_SAVE[self.CurEdit].flashanimstart)
		MPowa_ConfigFrame_Container_2_2_Checkbutton_Color:SetChecked(MPOWA_SAVE[self.CurEdit].usefontcolor)
		MPowa_ConfigFrame_Container_2_2_ColorpickerNormalTexture:SetVertexColor(MPOWA_SAVE[self.CurEdit].fontcolor_r, MPOWA_SAVE[self.CurEdit].fontcolor_g, MPOWA_SAVE[self.CurEdit].fontcolor_b)
		MPowa_ConfigFrame_Container_2_2_Colorpicker_SwatchBg.r = MPOWA_SAVE[self.CurEdit].fontcolor_r
		MPowa_ConfigFrame_Container_2_2_Colorpicker_SwatchBg.g = MPOWA_SAVE[self.CurEdit].fontcolor_g
		MPowa_ConfigFrame_Container_2_2_Colorpicker_SwatchBg.b = MPOWA_SAVE[self.CurEdit].fontcolor_b
		MPowa_ConfigFrame_Container_3_Slider_BeginSound:SetValue(MPOWA_SAVE[self.CurEdit].beginsound)
		MPowa_ConfigFrame_Container_3_Slider_BeginSoundText:SetText(MPOWA_SLIDER_BEGINSOUND..MPOWA.SOUND[MPOWA_SAVE[self.CurEdit].beginsound])
		MPowa_ConfigFrame_Container_3_Slider_EndSound:SetValue(MPOWA_SAVE[self.CurEdit].endsound)
		MPowa_ConfigFrame_Container_3_Slider_EndSoundText:SetText(MPOWA_SLIDER_BEGINSOUND..MPOWA.SOUND[MPOWA_SAVE[self.CurEdit].endsound])
		MPowa_ConfigFrame_Container_3_Checkbutton_BeginSound:SetChecked(MPOWA_SAVE[self.CurEdit].usebeginsound)
		MPowa_ConfigFrame_Container_3_Checkbutton_EndSound:SetChecked(MPOWA_SAVE[self.CurEdit].useendsound)
		MPowa_ConfigFrame_Container_5_FadeIn:SetChecked(MPOWA_SAVE[self.CurEdit].fadein)
		MPowa_ConfigFrame_Container_5_FadeOut:SetChecked(MPOWA_SAVE[self.CurEdit].fadeout)
		MPowa_ConfigFrame_Container_5_GrowOut:SetChecked(MPOWA_SAVE[self.CurEdit].growout)
		if MPOWA_SAVE[self.CurEdit].enemytarget or MPOWA_SAVE[self.CurEdit].friendlytarget then
			MPowa_ConfigFrame_Container_1_2_Editbox_DebuffDuration:Show()
		else
			MPowa_ConfigFrame_Container_1_2_Editbox_DebuffDuration:Hide()
		end
		if MPOWA_SAVE[self.CurEdit].flashanim then
			MPowa_ConfigFrame_Container_2_2_Editbox_FlashAnim:Show()
		else
			MPowa_ConfigFrame_Container_2_2_Editbox_FlashAnim:Hide()
		end
		if MPOWA_SAVE[self.CurEdit]["raidgroupmember"] then
			MPowa_ConfigFrame_Container_1_2_Editbox_Player:Show()
		else
			MPowa_ConfigFrame_Container_1_2_Editbox_Player:Hide()
		end
		if MPOWA_SAVE[self.CurEdit]["secsleft"] then
			MPowa_ConfigFrame_Container_1_2_Editbox_SECLEFT:Show()
		else
			MPowa_ConfigFrame_Container_1_2_Editbox_SECLEFT:Hide()
		end
		MPowa_ConfigFrame_Container_1_2_Checkbutton_SecondSpecifier:SetChecked(MPOWA_SAVE[self.CurEdit].secondspecifier)
		MPowa_ConfigFrame_Container_1_2_Editbox_SecondSpecifier:SetText(MPOWA_SAVE[self.CurEdit].secondspecifiertext)
		if MPOWA_SAVE[MPOWA.CurEdit]["secondspecifier"] then
			MPowa_ConfigFrame_Container_1_2_Editbox:SetWidth(135)
			MPowa_ConfigFrame_Container_1_2_Editbox:ClearAllPoints()
			MPowa_ConfigFrame_Container_1_2_Editbox:SetPoint("TOP", MPowa_ConfigFrame_Container_1_2, "TOP", -67.5, -20)
			MPowa_ConfigFrame_Container_1_2_Editbox_SecondSpecifier:Show()
		else
			MPowa_ConfigFrame_Container_1_2_Editbox:SetWidth(270)
			MPowa_ConfigFrame_Container_1_2_Editbox:ClearAllPoints()
			MPowa_ConfigFrame_Container_1_2_Editbox:SetPoint("TOP", MPowa_ConfigFrame_Container_1_2, "TOP", 0, -20)
			MPowa_ConfigFrame_Container_1_2_Editbox_SecondSpecifier:Hide()
		end
		MPOWA:TernarySetState(MPowa_ConfigFrame_Container_1_2_Checkbutton_Alive, MPOWA_SAVE[self.CurEdit].alive)
		MPOWA:TernarySetState(MPowa_ConfigFrame_Container_1_2_Checkbutton_Mounted, MPOWA_SAVE[self.CurEdit].mounted)
		MPOWA:TernarySetState(MPowa_ConfigFrame_Container_1_2_Checkbutton_InCombat, MPOWA_SAVE[self.CurEdit].incombat)
		MPOWA:TernarySetState(MPowa_ConfigFrame_Container_1_2_Checkbutton_InParty, MPOWA_SAVE[self.CurEdit].inparty)
		MPOWA:TernarySetState(MPowa_ConfigFrame_Container_1_2_Checkbutton_InRaid, MPOWA_SAVE[self.CurEdit].inraid)
		MPOWA:TernarySetState(MPowa_ConfigFrame_Container_1_2_Checkbutton_InBattleground, MPOWA_SAVE[self.CurEdit].inbattleground)
		MPOWA:TernarySetState(MPowa_ConfigFrame_Container_1_2_Checkbutton_InRaidInstance, MPOWA_SAVE[self.CurEdit].inraidinstance)
		MPowa_ConfigFrame:Show()
	end
end

function MPOWA:GetMaxValues(val)
	val = tonumber(val)
	return ceil(val)+50
end

function MPOWA:GetMinValues(val)
	val = tonumber(val)
	return ceil(val)-50
end

function MPOWA:TernarySetState(button, value)
	local label = _G(button:GetName().."Text")
	button:Enable()
	label:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)

	if value==0 then
		button:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
		button:SetChecked(0)
	elseif value==false then
		button:SetCheckedTexture("Interface\\Buttons\\UI-GroupLoot-Pass-Up")
		button:SetChecked(1)
	elseif value==true then
		button:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
		button:SetChecked(1)
	end
end

function MPOWA:Ternary_OnClick(obj, var)
	if (MPOWA_SAVE[self.CurEdit][var]==0) then
		MPOWA_SAVE[self.CurEdit][var] = true -- Ignore => On
	elseif (MPOWA_SAVE[self.CurEdit][var]==true) then
		MPOWA_SAVE[self.CurEdit][var] = false -- On => Off
	else
		MPOWA_SAVE[self.CurEdit][var] = 0 -- Off => Ignore
	end	

	self:TernarySetState(obj, MPOWA_SAVE[self.CurEdit][var])
	if MPOWA_SAVE[self.CurEdit]["test"] or self.testAll then
		_G("TextureFrame"..self.CurEdit):Hide()
		_G("TextureFrame"..self.CurEdit):Show()
	else
		self:Iterate("player")
		self:Iterate("target")
	end
end

function MPOWA:SliderChange(var, obj, text)
	MPOWA_SAVE[self.CurEdit][var] = tonumber(strform("%.2f", obj:GetValue()))
	_G(obj:GetName().."Text"):SetText(text.." "..MPOWA_SAVE[self.CurEdit][var])
	self:ApplyConfig(self.CurEdit)
end

function MPOWA:SoundSliderChange(obj, var)
	local oldvar = MPOWA_SAVE[self.CurEdit][var]
	MPOWA_SAVE[self.CurEdit][var] = obj:GetValue()
	_G(obj:GetName().."Text"):SetText(MPOWA_SLIDER_BEGINSOUND..self.SOUND[MPOWA_SAVE[self.CurEdit][var]])
	if MPOWA_SAVE[self.CurEdit][var] ~= oldvar then
		if MPOWA_SAVE[self.CurEdit][var] < 16 then
			PlaySound(self.SOUND[MPOWA_SAVE[self.CurEdit][var]], "master")
		else
			PlaySoundFile("Interface\\AddOns\\ModifiedPowerAuras\\Sounds\\"..self.SOUND[MPOWA_SAVE[self.CurEdit][var]], "master")
		end
	end
end

function MPOWA:Checkbutton(var)
	if MPOWA_SAVE[self.CurEdit][var] then
		MPOWA_SAVE[self.CurEdit][var] = false
	else
		MPOWA_SAVE[self.CurEdit][var] = true
	end
	
	if MPOWA_SAVE[self.CurEdit]["test"] or self.testAll then
		_G("TextureFrame"..self.CurEdit):Hide()
		_G("TextureFrame"..self.CurEdit):Show()
	else
		self:Iterate("player")
		self:Iterate("target")
	end
end

function MPOWA:Checkbutton_FlashAnim()
	if MPOWA_SAVE[self.CurEdit]["flashanim"] then
		MPOWA_SAVE[self.CurEdit]["flashanim"] = false
		MPowa_ConfigFrame_Container_2_2_Editbox_FlashAnim:Hide()
	else
		MPOWA_SAVE[self.CurEdit]["flashanim"] = true
		MPowa_ConfigFrame_Container_2_2_Editbox_FlashAnim:Show()
	end
end

function MPOWA:Checkbutton_USEFONTCOLOR()
	if MPOWA_SAVE[self.CurEdit].usefontcolor then
		MPOWA_SAVE[self.CurEdit].usefontcolor = false
		_G("TextureFrame"..self.CurEdit.."_Timer"):SetTextColor(1,1,1,MPOWA_SAVE[self.CurEdit].usefontcolor)
	else
		MPOWA_SAVE[self.CurEdit].usefontcolor = true
		_G("TextureFrame"..self.CurEdit.."_Timer"):SetTextColor(MPOWA_SAVE[self.CurEdit].fontcolor_r,MPOWA_SAVE[self.CurEdit].fontcolor_g,MPOWA_SAVE[self.CurEdit].fontcolor_b,MPOWA_SAVE[self.CurEdit].usefontcolor)
	end
end

local name = ""
function MPOWA:OpenColorPicker(n)
	CloseMenus()
	name = n
	
	button = MPowa_ConfigFrame_Container_2_2_Colorpicker_SwatchBg

	ColorPickerFrame.func = MPOWA.OptionsFrame_SetColor -- button.swatchFunc
	ColorPickerFrame:SetColorRGB(button.r, button.g, button.b)
	ColorPickerFrame.previousValues = {r = button.r, g = button.g, b = button.b, opacity = button.opacity}
	ColorPickerFrame.cancelFunc = MPOWA.OptionsFrame_CancelColor
	
	ColorPickerFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	
	ColorPickerFrame:SetMovable()
	ColorPickerFrame:EnableMouse()
	ColorPickerFrame:SetScript("OnMouseDown", function() ColorPickerFrame:StartMoving() end)
	ColorPickerFrame:SetScript("OnMouseUp", function() ColorPickerFrame:StopMovingOrSizing() end)
	
	ColorPickerFrame:Show()
end

function MPOWA:OptionsFrame_SetColor()
	local r,g,b = ColorPickerFrame:GetColorRGB()
	local swatch,frame
	swatch = MPowa_ConfigFrame_Container_2_2_ColorpickerNormalTexture
	frame = MPowa_ConfigFrame_Container_2_2_Colorpicker_SwatchBg
	swatch:SetVertexColor(r,g,b)
	frame.r = r
	frame.g = g
	frame.b = b

	MPOWA_SAVE[MPOWA.CurEdit][name.."_r"] = r
	MPOWA_SAVE[MPOWA.CurEdit][name.."_g"] = g
	MPOWA_SAVE[MPOWA.CurEdit][name.."_b"] = b
	
	if name == "fontcolor" then
		if MPOWA_SAVE[MPOWA.CurEdit].usefontcolor then
			_G("TextureFrame"..MPOWA.CurEdit.."_Timer"):SetTextColor(r,g,b,MPOWA_SAVE[MPOWA.CurEdit].fontalpha)
		else
			_G("TextureFrame"..MPOWA.CurEdit.."_Timer"):SetTextColor(1,1,1,MPOWA_SAVE[MPOWA.CurEdit].fontalpha)
		end
	elseif name == "icon" then
		MPowa_ConfigFrame_Container_1_Icon_Texture:SetVertexColor(r,g,b)
		MPOWA.frames[MPOWA.CurEdit][2]:SetVertexColor(r,g,b)
	end
end

function MPOWA:OptionsFrame_CancelColor()
	local r = ColorPickerFrame.previousValues.r
	local g = ColorPickerFrame.previousValues.g
	local b = ColorPickerFrame.previousValues.b
	local swatch,frame
	swatch = MPowa_ConfigFrame_Container_2_2_ColorpickerNormalTexture
	frame = MPowa_ConfigFrame_Container_2_2_Colorpicker_SwatchBg
	swatch:SetVertexColor(r,g,b)
	frame.r = r
	frame.g = g
	frame.b = b
	
	if name == "fontcolor" then
		if MPOWA_SAVE[MPOWA.CurEdit].usefontcolor then
			_G("TextureFrame"..MPOWA.CurEdit.."_Timer"):SetTextColor(r,g,b,MPOWA_SAVE[MPOWA.CurEdit].fontalpha)
		else
			_G("TextureFrame"..MPOWA.CurEdit.."_Timer"):SetTextColor(1,1,1,MPOWA_SAVE[MPOWA.CurEdit].fontalpha)
		end
	elseif name == "icon" then
		MPowa_ConfigFrame_Container_1_Icon_Texture:SetVertexColor(r,g,b)
		MPOWA.frames[MPOWA.CurEdit][2]:SetVertexColor(r,g,b)
	end
end

function MPOWA:Editbox_Duration(obj)
	if tonumber(obj:GetText()) ~= nil then
		MPOWA_SAVE[self.CurEdit]["targetduration"] = tonumber(obj:GetText())
		self:Iterate("target")
	end
end

function MPOWA:Editbox_SECSLEFT(obj)
	if tonumber(obj:GetText()) ~= nil then
		MPOWA_SAVE[self.CurEdit]["secsleftdur"] = tonumber(obj:GetText())
		if MPOWA_SAVE[self.CurEdit]["test"] or self.testAll then
			_G("TextureFrame"..self.CurEdit):Hide()
			_G("TextureFrame"..self.CurEdit):Show()
		else
			self:Iterate("target")
			self:Iterate("player")
		end
	end
end

function MPOWA:Editbox_Name(obj)
	local oldname = MPOWA_SAVE[self.CurEdit].buffname
	MPOWA_SAVE[self.CurEdit].buffname = obj:GetText()

	if oldname ~= MPOWA_SAVE[self.CurEdit].buffname then
		MPOWA_SAVE[self.CurEdit].texture = "Interface\\AddOns\\ModifiedPowerAuras\\images\\dummy.tga"
		MPowa_ConfigFrame_Container_1_Icon_Texture:SetTexture(MPOWA_SAVE[self.CurEdit].texture)
		_G("ConfigButton"..self.CurEdit.."_Icon"):SetTexture(MPOWA_SAVE[self.CurEdit].texture)
		_G("TextureFrame"..self.CurEdit.."_Icon"):SetTexture(MPOWA_SAVE[self.CurEdit].texture)
	end
	
	if not self.auras[MPOWA_SAVE[self.CurEdit].buffname] then
		self.auras[MPOWA_SAVE[self.CurEdit].buffname] = {}
	end
	if not self:GetTablePosition(self.auras[MPOWA_SAVE[self.CurEdit].buffname], self.CurEdit) then
		tinsert(self.auras[MPOWA_SAVE[self.CurEdit].buffname], self.CurEdit)
	end
	--self:Print(self.CurEdit)
	
	if MPOWA_SAVE[self.CurEdit].test or self.testAll then
		_G("TextureFrame"..self.CurEdit):Hide()
		_G("TextureFrame"..self.CurEdit):Show()
	else
		self:Iterate("player")
		self:Iterate("target")
	end
end

function MPOWA:Editbox_SecondSpecifier(obj)
	local oldname = MPOWA_SAVE[self.CurEdit].secondspecifiertext
	MPOWA_SAVE[self.CurEdit].secondspecifiertext = obj:GetText()

	if oldname ~= MPOWA_SAVE[self.CurEdit].secondspecifiertext then
		MPOWA_SAVE[self.CurEdit].texture = "Interface\\AddOns\\ModifiedPowerAuras\\images\\dummy.tga"
		MPowa_ConfigFrame_Container_1_Icon_Texture:SetTexture(MPOWA_SAVE[self.CurEdit].texture)
		_G("ConfigButton"..self.CurEdit.."_Icon"):SetTexture(MPOWA_SAVE[self.CurEdit].texture)
		_G("TextureFrame"..self.CurEdit.."_Icon"):SetTexture(MPOWA_SAVE[self.CurEdit].texture)
	end
	
	if MPOWA_SAVE[self.CurEdit].test or self.testAll then
		_G("TextureFrame"..self.CurEdit):Hide()
		_G("TextureFrame"..self.CurEdit):Show()
	else
		self:Iterate("player")
		self:Iterate("target")
	end
end

function MPOWA:Editbox_Stacks(obj)
	local oldcon = MPOWA_SAVE[self.CurEdit].stacks
	MPOWA_SAVE[self.CurEdit].stacks = obj:GetText()
	if oldcon ~= MPOWA_SAVE[self.CurEdit].stacks then
		if MPOWA_SAVE[self.CurEdit]["test"] or self.testAll then
			_G("TextureFrame"..self.CurEdit):Hide()
			_G("TextureFrame"..self.CurEdit):Show()
		else
			self:Iterate("player")
			self:Iterate("target")
		end
	end
end

function MPOWA:Editbox_FlashAnimStart(obj)
	local oldcon = MPOWA_SAVE[self.CurEdit].flashanimstart
	if tonumber(obj:GetText()) ~= nil then
		MPOWA_SAVE[self.CurEdit].flashanimstart = tonumber(obj:GetText())
	end
	if oldcon ~= MPOWA_SAVE[self.CurEdit].flashanimstart then
		if MPOWA_SAVE[self.CurEdit]["test"] or self.testAll then
			_G("TextureFrame"..self.CurEdit):Hide()
			_G("TextureFrame"..self.CurEdit):Show()
		else
			self:Iterate("player")
			self:Iterate("target")
		end
	end
end

function MPOWA:Editbox_Player(obj)
	local oldcon = MPOWA_SAVE[self.CurEdit]["rgmname"]
	if obj:GetText() ~= nil and obj:GetText() ~= "" then
		MPOWA_SAVE[self.CurEdit]["rgmname"] = obj:GetText()
		self.RaidGroupMembers[MPOWA_SAVE[self.CurEdit]["rgmname"]] = true
		self:GetGroup()
	end
end

function MPOWA:TestAll()
	if ConfigButton1 then
		if self.testAll then
			self.testAll = false
			for i=1, self.NumBuffs do
				if not self.active[i] then
					_G("TextureFrame"..i):Hide()
				end
				MPOWA_SAVE[i]["test"] = false
			end
		else
			self.testAll = true
			for i=1, self.NumBuffs do
				_G("TextureFrame"..i):Show()
			end
		end
	end
end

function MPOWA:Test()
	if ConfigButton1 then
		if MPOWA_SAVE[self.selected].test then
			MPOWA_SAVE[self.selected].test = false
			if not self.active[i] then
				_G("TextureFrame"..self.selected):Hide()
			end
		else
			MPOWA_SAVE[self.selected].test = true
			_G("TextureFrame"..self.selected):Show()
		end
	end
end

function MPOWA:ProfileSave()
	tinsert(MPOWA_PROFILE, MPOWA_SAVE[self.selected])
	self:ScrollFrame_Update()
end

function MPOWA:ProfileRemove()
	if MPOWA_PROFILE[MPOWA_PROFILE_SELECTED] ~= nil then
		tremove(MPOWA_PROFILE, MPOWA_PROFILE_SELECTED)
		MPOWA_PROFILE_SELECTED = 1
		self:ScrollFrame_Update()
	end
end

function MPOWA:Import()
	if MPOWA_PROFILE[MPOWA_PROFILE_SELECTED] ~= nil then
		tremove(MPOWA_SAVE, self.NumBuffs +1)
		tinsert(MPOWA_SAVE, self.NumBuffs +1, MPOWA_PROFILE[MPOWA_PROFILE_SELECTED])
		self:AddAura()
	end
end

function MPOWA:GetTableLength(T)
	local count = 0
	for _ in T do 
		count = count + 1 
	end 
	return count
end

function MPOWA:ScrollFrame_Update()
	local line -- 1 through 5 of our window to scroll
	local lineplusoffset -- an index into our data calculated from the scroll offset
	local FRAME = MPowa_ProfileFrame_ScrollFrame
	FauxScrollFrame_Update(FRAME,self:GetTableLength(MPOWA_PROFILE),7,40)
	for line=1,7 do
		lineplusoffset = line + FauxScrollFrame_GetOffset(FRAME)
		if MPOWA_PROFILE[lineplusoffset] ~= nil then
			_G("MPowa_ProfileFrame_ScrollFrame_Button"..line.."_Name"):SetText(MPOWA_PROFILE[lineplusoffset].buffname)
			_G("MPowa_ProfileFrame_ScrollFrame_Button"..line.."_Icon"):SetTexture(MPOWA_PROFILE[lineplusoffset].texture)
			_G("MPowa_ProfileFrame_ScrollFrame_Button"..line).line = lineplusoffset
			_G("MPowa_ProfileFrame_ScrollFrame_Button"..line):Show()
		else
			_G("MPowa_ProfileFrame_ScrollFrame_Button"..line):Hide()
		end
	end
end

function MPOWA:SelectIcon(obj)
	SELECTEDICON = _G(obj:GetName().."_Icon"):GetTexture()
	for cat, p in self.ICONARRAY do
		for i=1,p do
			if _G(cat..i.."_Border") then
				_G(cat..i.."_Border"):Hide()
			end
		end
	end
	_G(obj:GetName().."_Border"):Show()
end

function MPOWA:IconFrameOkay()
	MPowa_ConfigFrame_Container_1_Icon_Texture:SetTexture(SELECTEDICON)
	_G("ConfigButton"..self.CurEdit.."_Icon"):SetTexture(SELECTEDICON)
	_G("TextureFrame"..self.CurEdit.."_Icon"):SetTexture(SELECTEDICON)
	MPOWA_SAVE[self.CurEdit].texture = SELECTEDICON
	MPowa_IconFrame:Hide()
end

--------------- Post Init --------------------------

MPOWA:SetScript("OnUpdate", function() MPOWA:OnUpdate(arg1) end)
MPOWA:SetScript("OnEvent", function() MPOWA:OnEvent(event, arg1) end)
MPOWA:RegisterEvent("VARIABLES_LOADED")
MPOWA:RegisterEvent("UNIT_AURA")
MPOWA:RegisterEvent("PLAYER_TARGET_CHANGED")
MPOWA:RegisterEvent("RAID_ROSTER_UPDATE")
MPOWA:RegisterEvent("PARTY_MEMBERS_CHANGED")
MPOWA:RegisterEvent("PLAYER_AURAS_CHANGED")