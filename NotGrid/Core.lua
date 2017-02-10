local L = AceLibrary("AceLocale-2.0"):new("NotGrid")
NotGrid = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0")
NotGridOptions = {} -- After the addon is fully initialized WoW will fill this up with its saved variables if any

function NotGrid:OnInitialize()
	self.RosterLib = AceLibrary("RosterLib-2.0")
	self.HealComm = AceLibrary("HealComm-1.0")
	self.Banzai = AceLibrary("Banzai-1.0") -- only reports as having aggro if someone with this library is targetting the mob and reporting that the mob is targeting said unit
	self.NPL = AceLibrary("NotProximityLib-1.0")
	self.SEA = AceLibrary("SpecialEvents-Aura-2.0") -- auras are the most difficult thing to deal with
	self.NRL = AceLibrary("NotRosterLib-1.0")
	self.UnitFrames = {}
	self.Container = self:CreateContainerFrame()
	self.PrevTarget = nil -- for target highlighting
end

function NotGrid:OnEnable()
	self.o = NotGridOptions -- Need to wait for addon to be fully initialized and saved variables loaded before I set this
	self:SetDefaultOptions() -- if NotGridOptions is empty(no saved varoables) this will fill it up with defaults
	self:DoDropDown()
	self:RegisterEvent("NotRosterLib_UnitChanged")
	self:RegisterEvent("NotRosterLib_RosterChanged")
    self:RegisterEvent("UNIT_HEALTH")
    self:RegisterEvent("HealComm_Healupdate")
    self:RegisterEvent("HealComm_Ressupdate")
    self:RegisterEvent("SpecialEvents_UnitBuffLost")
	self:RegisterEvent("SpecialEvents_UnitBuffGained")
	self:RegisterEvent("SpecialEvents_UnitDebuffLost")
	self:RegisterEvent("SpecialEvents_UnitDebuffGained")
	--if self.o.tracktarget then
		self:RegisterEvent("PLAYER_TARGET_CHANGED")
	--end
    --if self.o.trackaggro then
		self:RegisterEvent("Banzai_UnitGainedAggro") -- "player" unit aggro? it has an event trigger but I don't know if I need it for the scope of this proj. I suppose ti would be necessary when just in party. But I don't really care then
		self:RegisterEvent("Banzai_UnitLostAggro")
	--end
	--if self.o.trackmana then
		self:RegisterEvent("UNIT_MANA")
	--end
	if 1==1 then
		self:RegisterEvent("NotProximityLib_RangeUpdate", "RangeHandle")
		self:RegisterEvent("NotProximityLib_WorldRangeUpdate", "RangeHandle")
	end
	if Clique then
		self.CliqueProfile = string.format(L["%s of %s"],GetUnitName("player"),GetRealmName())
	end
end

------------------
-- NotRosterLib --
------------------

function NotGrid:NotRosterLib_UnitChanged(unitobj,oldunitobj)
	if unitobj and not oldunitobj and not (unitobj.class == "PET") then
		unitobj.ngframe = self:AssignUnitFrame()
		self:UpdateUnitFrame(unitobj)
	elseif oldunitobj and oldunitobj.ngframe and not unitobj then
		self:ClearUnitFrame(oldunitobj)
	elseif unitobj and unitobj.ngframe then -- was throwing errors in relation to pet saying no unitobj found. Not sure why?
		self:UpdateUnitFrame(unitobj)
	end
		--DEFAULT_CHAT_FRAME:AddMessage("trigger.. but no ngframe?")
	--end
end

function NotGrid:NotRosterLib_RosterChanged() -- All the units have been updated so position the frames
	self:PositionFrames()
end

-----------------
-- UNIT_HEALTH --
-----------------

function NotGrid:UNIT_HEALTH(unitid)
	local unitobj = self.NRL:GetUnitObjectFromUnit(unitid)
	if unitobj and unitobj.ngframe then
		local f = unitobj.ngframe
		if UnitIsConnected(unitid) then
			local healamount = self.HealComm:getHeal(f.name) --We have to check healcomm as well cause if the unit takes damage or gains health or something during the heal I have to adjust what the final heal will look like.
			local currhealth = UnitHealth(unitid)
			local maxhealth = UnitHealthMax(unitid)
			local deficit = maxhealth - currhealth
			f.healthbar:SetMinMaxValues(0, maxhealth)
			f.healthbar:SetValue(currhealth)
			if UnitIsDead(unitid) then
				self:UnitHealthZero(f, L["Dead"])
			elseif UnitIsGhost(unitid) or (deficit >= maxhealth) or self.SEA:UnitHasBuff(unitid,L["Spirit of Redemption"]) then -- we can't detect unitisghost if he's not in range so we do the additional conditional. It won't false report for "dead" because that's checked first. Still a lot of false reports. In BGs.
				self:UnitHealthZero(f, L["Ghost"])
			elseif currhealth/maxhealth*100 <= self.o.healththreshhold then
				local deficittext
				if deficit > 999 then
					deficittext = string.format("-%.1fk", deficit/1000.0)
				else
					deficittext = string.format("-%d", deficit)
				end
				f.namehealthtext:SetText(deficittext)
			else
				f.namehealthtext:SetText(f.shortname)
			end
			if healamount and healamount > 0 then
				self:SetIncHealFrame(f, healamount, currhealth, maxhealth)
			else
				f.incheal:SetBackdropColor(0,0,0,0)
				f.healcommtext:Hide() -- should be covered by healcomm triggers but lets have this in too
			end
		else
			self:UnitHealthZero(f, "Offline")
		end
	end
end

function NotGrid:UnitHealthZero(f, state)
	f:SetBackdropBorderColor(unpack(self.o.unitbordercolor))
	f.namehealthtext:SetText(f.shortname.."\n"..state)
	f.incheal:SetBackdropColor(0,0,0,0)
	f.healthbar:SetMinMaxValues(0, 1)
	f.healthbar:SetValue(0)
	f.healcommtext:Hide() -- make sure healcommtext gets hidden too
	-- for i=1,8 do -- we'll see if we need this .. theoritically SEA should be sending buff/debuff lost in this condition
	-- 	f.healthbar["trackingicon"..i].active = nil
	-- 	f.healthbar["trackingicon"..i]:Hide()
	-- end
end

--------------
-- HealComm --
--------------

function NotGrid:HealComm_Healupdate(unitname)
	local unitobj = self.NRL:GetUnitObjectFromName(unitname)
	if unitobj and unitobj.ngframe then
		local f = unitobj.ngframe
		local healamount = self.HealComm:getHeal(unitname)
		local currhealth = UnitHealth(unitobj.unitid) -- Althrough I could use rosterlibs sent unitid
		local maxhealth = UnitHealthMax(unitobj.unitid)
		local healtext
		if healamount > 999 then
			healtext = string.format("+%.1fk", healamount/1000.0)
		else
			healtext = string.format("+%d", healamount)
		end

		if healamount > 0 then
			self:SetIncHealFrame(f, healamount, currhealth, maxhealth)
			if self.o.showhealcommtext then
				f.healcommtext:SetText(healtext)
				f.healcommtext:Show()
			end
		else
			f.incheal:SetBackdropColor(0,1,0,0)
			f.healcommtext:Hide()
		end
	end
end

function NotGrid:HealComm_Ressupdate(unitname)
	local unitobj = self.NRL:GetUnitObjectFromName(unitname)
	if unitobj and unitobj.ngframe then
		if self.HealComm:UnitisResurrecting(unitname) then
			unitobj.ngframe.incres:Show()
		else
			unitobj.ngframe.incres:Hide()
		end
	end
	--DEFAULT_CHAT_FRAME:AddMessage(unitname.." "..resstime)
end

----------------------
-- Target Highlight --
----------------------

function NotGrid:PLAYER_TARGET_CHANGED()
	if not self.o.tracktarget then return end
	local name = UnitName("Target")
	local unitobj = self.NRL:GetUnitObjectFromName(name)

	if self.PrevTarget then
		self:PrevTargetHandle()
	end

	if unitobj and unitobj.ngframe then
		self.PrevTarget = name
		unitobj.ngframe.borderstate = "target"
		unitobj.ngframe:SetBackdropBorderColor(unpack(self.o.targetcolor))
	end
end

function NotGrid:PrevTargetHandle()
	local unitobj = self.NRL:GetUnitObjectFromName(self.PrevTarget)
	if unitobj and unitobj.ngframe then -- if the frame hasn't been cleared by a clear function
		local currmana = UnitMana(unitobj.unitid)
		local maxmana = UnitManaMax(unitobj.unitid)
		if self.o.trackaggro and self.Banzai:GetUnitAggroByUnitName(self.PrevTarget) then
			unitobj.ngframe.borderstate = "aggro"
			unitobj.ngframe:SetBackdropBorderColor(unpack(self.o.aggrowarningcolor))
		elseif self.o.trackmana and currmana/maxmana*100 < self.o.manathreshhold then
			unitobj.ngframe.borderstate = "mana"
			unitobj.ngframe:SetBackdropBorderColor(unpack(self.o.manawarningcolor))
		else
			unitobj.ngframe.borderstate = nil
			unitobj.ngframe:SetBackdropBorderColor(unpack(self.o.unitbordercolor))
		end
	end
end

------------
-- Banzai --
------------

function NotGrid:Banzai_UnitGainedAggro(unitid) -- this also gets sent banzaitarget(a table). Don't know whats in it. Don't care haha
	if not self.o.trackaggro then return end
	local unitobj = self.NRL:GetUnitObjectFromUnit(unitid)
	if unitobj and unitobj.ngframe and not (unitobj.ngframe.borderstate == "target") then
		unitobj.ngframe.borderstate = "aggro"
		unitobj.ngframe:SetBackdropBorderColor(unpack(self.o.aggrowarningcolor))
	end
end

function NotGrid:Banzai_UnitLostAggro(unitid)
	if not self.o.trackaggro then return end
	local unitobj = self.NRL:GetUnitObjectFromUnit(unitid)
	if unitobj and unitobj.ngframe and not (unitobj.ngframe.borderstate == "target") then
		unitobj.ngframe.borderstate = nil
		unitobj.ngframe:SetBackdropBorderColor(unpack(self.o.unitbordercolor))
	end
end

---------------
-- UNIT_MANA --
---------------

function NotGrid:UNIT_MANA(unitid)
	if not self.o.trackmana then return end
	local unitobj = self.NRL:GetUnitObjectFromUnit(unitid)
	if unitobj and unitobj.ngframe and not (unitobj.ngframe.borderstate == "aggro" or unitobj.ngframe.borderstate == "target") then
		local currmana = UnitMana(unitid)
		local maxmana = UnitManaMax(unitid)
		if currmana/maxmana*100 < self.o.manathreshhold then
			unitobj.ngframe.borderstate = "mana"
			unitobj.ngframe:SetBackdropBorderColor(unpack(self.o.manawarningcolor))
		else
			unitobj.ngframe.borderstate = nil
			unitobj.ngframe:SetBackdropBorderColor(unpack(self.o.unitbordercolor))
		end
	end
end

-------------------------
-- SpecialEvents Auras --
-------------------------

function NotGrid:SpecialEvents_UnitDebuffGained(unitid, buffname, apps, spelltype, texture)
	if not texture then spelltype = "none" end -- need to do this to be applicable with blizz's aura colors
	local unitobj = self.NRL:GetUnitObjectFromUnit(unitid)
	if unitobj and unitobj.ngframe then
		local f = unitobj.ngframe
		for i=1,8 do -- loop through all my tracking icon settings icons and check their values against the incoming debuff
			local oi = self.o["trackingicon"..i]
			local fi = f.healthbar["trackingicon"..i]
			if oi == spelltype then
				self:SetIconFrame(fi, spelltype, spelltype, i)
			end
			if oi == buffname then
				self:SetIconFrame(fi, buffname, spelltype, i)
			end
			-- if oi == "ReducedHealingDebuffs" and self.ReducedHealingDebuffs[buffname] then -- if a corner icon is set to track reducedhealingdebuffs and it has a key in the array
			-- 	self:SetIconFrame(fi, buffname, spelltype, i) -- send it the buffname instead of spelltype in this case
			-- end
		end
	end
end

function NotGrid:SpecialEvents_UnitDebuffLost(unitid, buffname, apps, spelltype, texture)
	if not texture then spelltype = "none" end 
	local unitobj = self.NRL:GetUnitObjectFromUnit(unitid)
	if unitobj and unitobj.ngframe then
		local f = unitobj.ngframe
		for i=1,8 do
			local fi = f.healthbar["trackingicon"..i]
			if fi.active then -- why even check if its active? I suppose to reduce checking whats likely to a majority not active frames. So this is good
				if fi.active == spelltype and not self.SEA:UnitHasDebuffType(unitid, spelltype) then -- if he lost the relative spelltype and he has no other buffs on him of that spelltype
					self:ClearIconFrame(fi)
				end
				if fi.active == buffname then -- for clearing icons that track specific names, not spelltypes
					self:ClearIconFrame(fi)
				end
			end
		end
	end
end

function NotGrid:SpecialEvents_UnitBuffGained(unitid, buffname) -- why doesn't it seend me the texture or spelltype or anything? I don't want to loop throguh it myself or I wouldn't use the lib
	local unitobj = self.NRL:GetUnitObjectFromUnit(unitid)
	if unitobj and unitobj.ngframe then
		local f = unitobj.ngframe
		for i=1,8 do -- for each corner frame setting
			if self.o["trackingicon"..i] == buffname then -- if its a buff they're tracking
				self:SetIconFrame(f.healthbar["trackingicon"..i], buffname, nil, i)
			end
		end
	end
end

function NotGrid:SpecialEvents_UnitBuffLost(unitid, buffname)
	local unitobj = self.NRL:GetUnitObjectFromUnit(unitid)
	if unitobj and unitobj.ngframe then
		local f = unitobj.ngframe
		for i=1,8 do
			local fi = f.healthbar["trackingicon"..i]
			if fi.active and fi.active == buffname then
				self:ClearIconFrame(fi)
			end
		end
	end
end

---------------------
-- NotProximityLib --
---------------------

function NotGrid:RangeHandle(unitid, range, lastseen, confirmed) -- ranges that should normally be nil will be 1000 so we don't have to check for the existane or range
	local unitobj = self.NRL:GetUnitObjectFromUnit(unitid)
	if unitobj and unitobj.ngframe then
		local f = unitobj.ngframe
		local time = GetTime()
		if self.o.usemapdistances == true and (self.NPL.v.instance == "none" or self.NPL.v.instance == "pvp") then
			if event == "NotProximityLib_WorldRangeUpdate" then
				self:RangeToggle(f, range)
			end
		elseif event == "NotProximityLib_RangeUpdate" then
			if confirmed then
				self:RangeToggle(f, range)
			elseif not confirmed and f.inrange and self.o.proximityleeway < time-lastseen then -- if he's not already set as oor and the last seen time is < than leeway
				self:RangeToggle(f, 100) -- send 100 dummy data in this case to toggle it off
			end
		end
	end
end

-------------------
-- On Unit Click --
-------------------

function NotGrid:ClickHandle(button)
	if button == "RightButton" and SpellIsTargeting() then
		SpellStopTargeting()
		return
	end
	if button == "LeftButton" then
		if SpellIsTargeting() then
			SpellTargetUnit(this.unit)
		elseif CursorHasItem() then
			DropItemOnUnit(this.unit)
		else
			TargetUnit(this.unit)
		end
	else --Thanks Luna :^)
		local name = UnitName(this.unit)
		local id = string.sub(this.unit,5)
		local unit = this.unit
		local menuFrame = FriendsDropDown
		menuFrame.displayMode = "MENU"
		menuFrame.initialize = function() UnitPopup_ShowMenu(getglobal(UIDROPDOWNMENU_OPEN_MENU), "PARTY", unit, name, id) end
		ToggleDropDownMenu(1, nil, FriendsDropDown, "cursor")
	end
end

function NotGrid:CliqueHandle(button) -- if/else for Clique handling is done in the frames.lua when creating the frame
	local a,c,s = IsAltKeyDown() or 0, IsControlKeyDown() or 0, IsShiftKeyDown() or 0
	local modifiers = a*1+c*2+s*4
	local foundspell = nil
	for _,value in CliqueDB["chars"][self.CliqueProfile][L["Default Friendly"]] do
		if value["button"] == button and value["modifiers"] == modifiers then
			if value["rank"] then
				foundspell = value["name"]..L["(Rank "]..value["rank"]..")" -- wew
			else
				foundspell = value["name"]
			end
			break
		end
	end
	if foundspell then
		local LastTarget = UnitName("target") -- I use this as a boolean because targetting by name can be erronous
		ClearTarget()
		CastSpellByName(foundspell) -- then cast it, but note that because we've cleared target to cast it we're just "spelltargeting"
		self.NPL:UpdateSpellCanTarget() -- Send ourselves off to NPL to run through the roster and check/update ranges
		if SpellIsTargeting() and SpellCanTargetUnit(this.unit) then -- then come back to our own func and see if they can cast on the unit they wanted to cast on
			SpellTargetUnit(this.unit) -- if they can, cast on them
		elseif SpellIsTargeting() then
			SpellStopTargeting() -- otherwise stop targetting
		end
		if LastTarget then -- remember, use it as a boolean.
			TargetLastTarget() -- and finally, if they actually had an old target, then target it
		end
	else
		self:ClickHandle(button) -- if it failed to find anything in clique then we send it to the regular handler
	end
end