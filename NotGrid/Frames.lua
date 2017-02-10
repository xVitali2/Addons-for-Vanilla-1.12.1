---------------------
-- Creating Frames --
---------------------

function NotGrid:CreateContainerFrame()
	local f = CreateFrame("Frame","NotGridContainer",UIParent)
	f:SetWidth(1)
	f:SetHeight(1)
	f:SetMovable(true)
	--f:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8X8", edgeFile = "Interface\\Buttons\\WHITE8X8", tile = true, tileSize = 16, edgeSize = 10})
	--f:SetPoint("CENTER",40,-40)
	return f
end

function NotGrid:CreateUnitFrame(index)
	local f = CreateFrame("Button","$parentunitframe"..index,self.Container) -- it will be a child of container but the positioning will be relative to the group frames
	f:RegisterForClicks("LeftButtonDown", "RightButtonDown", "MiddleButtonDown", "Button4Down", "Button5Down") -- somehow I recall this not matterign?
	f:RegisterForDrag("LeftButton")
	f:SetScript("OnClick", function()
		if Clique then
			self:CliqueHandle(arg1)
		else
			self:ClickHandle(arg1)
		end
	end)
	f:SetScript("OnDragStart", function()
		if not self.o.locked then 
			self.Container:StartMoving() 
		end
	end)
	f:SetScript("OnDragStop", function() -- on drag of any unit frame will drag the NotGridContainer frame
		if not self.o.locked then
			self.Container:StopMovingOrSizing()
			local point,relativeTo,relativePoint,xOfs,yOfs = self.Container:GetPoint()
			self.o.containerpoint = point
			self.o.containeroffx = xOfs
			self.o.containeroffy = yOfs
			--self:UpdateUnitFrames()
			self:PositionFrames()
		end
	end)
	f:SetScript("OnEnter", function()
		if not UnitAffectingCombat("player") then
			UnitFrame_OnEnter()
		end
	end)
	f:SetScript("OnLeave", function() 
		UnitFrame_OnLeave()
	end)


	f.healthbar = CreateFrame("StatusBar","$parenthealthbar",f)
	f.healthbar.bgtex = f.healthbar:CreateTexture("$parentbgtex","BACKGROUND")

	f.incres = CreateFrame("Frame","$parentresicon",f.healthbar)
	f.incres.bgtex = f.incres:CreateTexture("$parentbgtex","BACKGROUND")

	f.incheal = CreateFrame("Frame","$parenthealcommbar",f.healthbar) -- Was using a statusbar behind the health frame but when the frame's alpha is low this would be seen through it
	
	-- I was having problems with incheal covering up these fontstrings. My soluction is to parent them to the incheal, but set the relative point to the healthbar. And instead of hide/show the incheal I just lower/higher its color opacity
	f.namehealthtext = f.incheal:CreateFontString("$parentnamehealthtext", "OVERLAY")
	f.healcommtext = f.incheal:CreateFontString("$parenthealcommtext", "OVERLAY")

	for i=1,8 do
		f.healthbar["trackingicon"..i] = CreateFrame("Frame","$parenttrackingicon"..i,f.healthbar) -- easier to work with digits than topleft/topright/etc..
	end

	return f
end

--------------------------------
-- Default Config Unit Frames --
--------------------------------

function NotGrid:ConfigUnitFrame(f)
	--local f = self.UnitFrames[index]
	local o = self.o
	f:SetWidth(o.unitwidth+o.unitborder*2) -- so here's the jiffy: the way edgefile works is it basically sits on the center of the edge of the frame and expands both inward and outward. So to compensate asthetically for that I ahve to increase the size of my frame double the desired width of the edgefile/border
	f:SetHeight(o.unitheight+o.unitborder*2)
	f:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8X8", edgeFile = "Interface\\Buttons\\WHITE8X8", tile = true, tileSize = 16, edgeSize = o.unitborder})
	f:SetBackdropColor(unpack(o.unitbgcolor))
	f:SetBackdropBorderColor(unpack(o.unitbordercolor))
	--f:SetPoint("CENTER",0,0)
	-- f:Hide() -- hide by default

	f.healthbar:SetWidth(o.unitwidth)
	f.healthbar:SetHeight(o.unitheight)
	f.healthbar:SetOrientation(o.unithealthorientation)
	f.healthbar:SetStatusBarTexture(o.unithealthbartexture)
	f.healthbar:ClearAllPoints()
	f.healthbar:SetPoint("CENTER",0,0)
	f.healthbar:SetStatusBarColor(unpack(o.unithealthbarcolor))
	--sb:SetStatusBarColor(unpack(o.unithealcommbarcolor))
	f.healthbar.bgtex:SetTexture(o.unithealthbartexture)
	f.healthbar.bgtex:SetVertexColor(unpack(o.unithealthbarbgcolor))
	f.healthbar.bgtex:SetAllPoints()

	f.incres:SetWidth(o.unitheight) -- yep, so it stays square under most common sizes. Think of a mathematical way in the future
	f.incres:SetHeight(o.unitheight)
	f.incres:ClearAllPoints()
	f.incres:SetPoint("CENTER",0,0)
	f.incres.bgtex:SetTexture("Interface\\AddOns\\NotGrid\\media\\res")
	f.incres.bgtex:SetAllPoints()
	f.incres:Hide()


	f.incheal:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8X8", edgeFile = "Interface\\Buttons\\WHITE8X8", tile = true, tileSize = 16, edgeSize = 1, insets = { left = 0, right = 0, top = 0, bottom = 0 }})
	f.incheal:SetBackdropColor(0,0,0,0)
	f.incheal:SetBackdropBorderColor(0,0,0,0) -- mostly just so its 0 opacity
	f.incheal:SetWidth(o.unitwidth)
	f.incheal:SetHeight(o.unitheight)

	for _,fsname in {"namehealthtext", "healcommtext"} do
		local fs = f[fsname]
		fs:SetShadowColor(0, 0, 0, 1.0)
		fs:SetShadowOffset(0.80, -0.80)
		fs:ClearAllPoints()
		if fsname == "namehealthtext" then
			if not o.colorunitnamehealthbyclass then
				fs:SetTextColor(unpack(o.unitnamehealthtextcolor))
			end
			fs:SetFont(o.unitfont, o.unitnamehealthtextsize)
			fs:SetPoint("CENTER",f.healthbar,"CENTER",0,0)
		elseif fsname == "healcommtext" then
			fs:SetTextColor(unpack(o.unithealcommtextcolor))
			fs:SetFont(o.unitfont, o.unithealcommtextsize)
			fs:SetPoint("TOP",f.namehealthtext,"BOTTOM",0,o.unithealcommtextoffsety)
		end
	end
	for i,point in {"TOPLEFT", "TOP", "TOPRIGHT", "RIGHT", "BOTTOMRIGHT", "BOTTOM", "BOTTOMLEFT", "LEFT"} do
		local fi = f.healthbar["trackingicon"..i]
		fi:SetWidth(o.unittrackingiconsize)
		fi:SetHeight(o.unittrackingiconsize)
		fi:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8X8", edgeFile = "Interface\\Buttons\\WHITE8X8", tile = true, tileSize = o.unittrackingiconsize, edgeSize = o.unittrackingiconborder})
		fi:SetBackdropBorderColor(o.unittrackingiconbordercolor)
		fi:ClearAllPoints()
		fi:SetPoint(point,0,0)
		fi:Hide()
	end
end

------------------------------
-- Assign/Clear Unit Frames --
------------------------------

function NotGrid:AssignUnitFrame(unitobj)
	local f = nil
	for i=1,40 do
		if not self.UnitFrames[i] then -- if the frame just completely doesn't exist
			self.UnitFrames[i] = self:CreateUnitFrame(i) -- then create it
			f = self.UnitFrames[i]
			self:ConfigUnitFrame(f) --and config it with defaults
		elseif not self.UnitFrames[i].unit then -- if a frame exists but doesn't have a unit/data assigned
			f = self.UnitFrames[i]
		end
		if f then -- if the frame gets set from one of the above checks then we return it
			return f
		end
	end
end

function NotGrid:UpdateUnitFrame(unitobj, name)
	local unitobj = unitobj or self.NRL:GetUnitObjectFromName(name)
	local f = unitobj.ngframe
	local color = RAID_CLASS_COLORS[unitobj.class] or {r=1,g=0,b=1}
	local o = self.o
	f.unit = unitobj.unitid
	f.name = unitobj.name
	f.shortname = string.sub(unitobj.name, 1, o.namelength)
	f.inrange = true -- we'll assume they're in range by default and let it be proven wrong by proximitylib
	f.subgroup = unitobj.subgroup
	if o.colorunithealthbarbyclass then -- I could just do these in ConfigUnitFrame() and send it there every time but that's wasteful outside of the first creation of the frame.
		f.healthbar:SetStatusBarColor(color.r, color.g, color.b)
	end
	if o.colorunitnamehealthbyclass then
		f.namehealthtext:SetTextColor(color.r, color.g, color.b)
	end
	if o.colorunithealthbarbgbyclass then
		f.healcommbar.bgtex:SetVertexColor(color.r-0.5,color.g-0.5,color.b-0.5,0.5)
	end
	self:UNIT_HEALTH(unitobj.unitid)
end

function NotGrid:ClearUnitFrame(unitobj)
	local f = unitobj.ngframe
	if f then
		f.unit = nil
		f.name = nil
		f.shortname = nil
		f.inrange = true -- yeah..
		f.subgroup = nil
		for i=1,8 do
			f.healthbar["trackingicon"..i].active = nil
			f.healthbar["trackingicon"..i]:Hide()
		end
		f.borderstate = nil
		f:SetBackdropBorderColor(unpack(self.o.unitbordercolor)) -- to correct mana or aggro warning sticking.. mostly mana
		f.healcommtext:Hide()
		f:Hide()
	end
end

------------------------
-- Positioning Frames --
------------------------

function NotGrid:PositionFrames() -- I'm not going for efficiency on this. I'm going for coolness. Will add other positioning options in future
	local partycount = GetNumPartyMembers() -- these are done by notrosterlib, I should integrate them somehow
    local raidcount = GetNumRaidMembers()

	local SubGroupCounts = {0,0,0,0,0,0,0,0,0,0} -- reset it every time
	local TotalGroups = 0
	local o = self.o

	for i=1,10 do -- for every subgroup
		for key,f in self.UnitFrames do -- loop through every unitframe and try to match it up with the subgorup
			if f.subgroup == i then
				f:ClearAllPoints()
				if o.growrighttoleft then
					f:SetPoint("CENTER",-(o.unitwidth+o.unitborder*2+o.unitpadding)*TotalGroups,-(o.unitheight+o.unitborder*2+o.unitpadding)*SubGroupCounts[i]) -- i do subgroup -1 so group 1 will be 0 and be at 0 offset
				else
					f:SetPoint("CENTER",(o.unitwidth+o.unitborder*2+o.unitpadding)*TotalGroups,-(o.unitheight+o.unitborder*2+o.unitpadding)*SubGroupCounts[i])
				end
				f:Show()
				SubGroupCounts[i] = SubGroupCounts[i]+1 -- add it after to the first member is treated as 0, same with the frist group being treated as 0
			end
		end
		if SubGroupCounts[i] > 0 then -- after looping through the frames if I found a unit inside the sub then set that sub as the prevsub
			TotalGroups = TotalGroups+1
		end
	end

	self.Container:ClearAllPoints()
	if o.smartcenter == true then
		if o.growrighttoleft then
			self.Container:SetPoint(o.containerpoint,o.containeroffx+(o.unitwidth+o.unitborder*2+o.unitpadding)/2*(TotalGroups-1),o.containeroffy)
		else
		self.Container:SetPoint(o.containerpoint,o.containeroffx-(o.unitwidth+o.unitborder*2+o.unitpadding)/2*(TotalGroups-1),o.containeroffy)
		end
	else
		self.Container:SetPoint(o.containerpoint,o.containeroffx,o.containeroffy)
	end

	if (partycount == 0 and raidcount == 0 and not self.o.showwhilesolo) or (partycount > 0 and raidcount == 0 and not self.o.showinparty) then
		self.Container:Hide()
	else
		self.Container:Show()
	end

	--hide blizz frames or not
	for i=1,partycount do -- this isn't perfect because, for example, if partycount were at 0 it just wouldn't run and wouldn't hide any remaining frames. But blizz's code handles hiding it natively on member leave so I won't worry about it.
		if o.showblizzframes then
			getglobal("PartyMemberFrame"..i):Show();
		else
			getglobal("PartyMemberFrame"..i):Hide();
		end
	end

end

-----------------------------
-- Buff/Debuff Icon Frames --
-----------------------------

function NotGrid:SetIconFrame(f, activeval, spelltype, i) -- don't need spelltype after we're just using user specified colors
	f:SetBackdropColor(unpack(self.o["trackingicon"..i.."color"]))
	f.active = activeval
	f:Show()
end

function NotGrid:ClearIconFrame(f)
	f.active = nil
	f:Hide()
end

---------------------
-- Healcomm Handle --
---------------------

function NotGrid:SetIncHealFrame(f, healamount, currhealth, maxhealth) -- well this was easier than I was expecting it to be
	local o = self.o
	if o.unithealthorientation == "VERTICAL" then -- I could rewrite these so its less copy paste but leaving it for now
		local modifier = maxhealth/o.unitheight -- get the modifer to convert health amounts to pixels based on set height
		local healheight = healamount/modifier
		local currheight = currhealth/modifier
		local maxheight = o.unitheight-currheight
		if maxheight == 0 then return end -- if the max height would equal to be 0 then SetHeight() function won't work so I jsut stop this function now
		if healheight >= maxheight then healheight = maxheight end
		f.incheal:SetHeight(healheight)
		f.incheal:ClearAllPoints()
		f.incheal:SetPoint("BOTTOM",0,currheight)
	elseif o.unithealthorientation == "HORIZONTAL" then
		local modifier = maxhealth/o.unitwidth
		local healwidth = healamount/modifier
		local currwidth = currhealth/modifier
		local maxwidth = o.unitwidth-currwidth
		if healwidth > maxwidth then healwidth = maxwidth end
		f.incheal:SetWidth(healwidth)
		f.incheal:ClearAllPoints()
		f.incheal:SetPoint("LEFT",currwidth,0)
	end
	local color = o.unithealcommbarcolor
	f.incheal:SetBackdropColor(color[1],color[2],color[3],1) -- instead of hide/show I set opacity. Note that I can't use SetAlpha cause it will hide the child elements
end

--------------------
-- Range Toggling --
--------------------

function NotGrid:RangeToggle(f, range)
	if not f.inrange and range <= 40 then
		f.inrange = true
		f:SetAlpha(1)
	elseif f.inrange and range > 40 then
		f.inrange = false
		f:SetAlpha(self.o.ooralpha)
	end
end
