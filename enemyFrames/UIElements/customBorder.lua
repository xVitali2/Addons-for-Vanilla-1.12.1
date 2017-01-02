	-------------------------------------------------------------------------------
	local borderTexture = [[Interface\AddOns\enemyFrames\globals\resources\border.tga]]
	local BACKDROP 	= {bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],}
		
	local defaultTcut = 1/4.2
	
	local getTextCoords = function(tcutsize)
		local sides = 
		{
			[1] = {0, tcutsize, tcutsize, 1-tcutsize},	[2] = {1-tcutsize, 1, tcutsize, 1-tcutsize}, -- left right	
			[3] = {tcutsize,1-tcutsize, 0, tcutsize},	[4] = {tcutsize, 1-tcutsize, 1-tcutsize, 1}, -- top bottom
		}		
		local corners = 
		{
			[1] = {{0, tcutsize, 0, tcutsize}, 'TOPLEFT'}, 	[2] = {{1-tcutsize, 1, 0, tcutsize}, 'TOPRIGHT'},
			[3] = {{0, tcutsize, 1-tcutsize, 1}, 'BOTTOMLEFT'},	[4] = {{1-tcutsize, 1, 1-tcutsize, 1}, 'BOTTOMRIGHT'},
		}
		
		return corners, sides
	end
	-------------------------------------------------------------------------------
	CreateBorder = function(name, parent, size, tcut)
		local this = CreateFrame('Frame', name, parent)
		this:SetAllPoints()	
		this:SetFrameLevel(parent:GetFrameLevel()+1)		
		
		local tcutsize = tcut and tcut or defaultTcut
		
		local corners, sides = getTextCoords(tcutsize)
		-- corners
		this.c = {}
		for i = 1, 4 do
			this.c[i] = this:CreateTexture(nil, 'OVERLAY')
			this.c[i]:SetHeight(size)		this.c[i]:SetWidth(size)
			
			this.c[i]:SetTexture(borderTexture)
			this.c[i]:SetTexCoord(corners[i][1][1], corners[i][1][2], corners[i][1][3], corners[i][1][4])
			
			local xo, yo = (i == 1 or i == 3) and -1/8 or 1/8, (i == 1 or i == 2) and 1/8 or -1/8
			this.c[i]:SetPoint(corners[i][2],
			this,
			xo*size, yo*size)
		end
		-- sides
		this.s = {}
		for i = 1, 4 do
			this.s[i] = this:CreateTexture(nil, 'OVERLAY')			
			this.s[i]:SetTexture(borderTexture)
			this.s[i]:SetTexCoord(sides[i][1], sides[i][2], sides[i][3], sides[i][4])
		end
		-- left
		this.s[1]:SetPoint('TOPLEFT', this.c[1], 'BOTTOMLEFT')
		this.s[1]:SetPoint('BOTTOMRIGHT', this.c[3], 'TOPRIGHT')
		-- right
		this.s[2]:SetPoint('TOPLEFT', this.c[2], 'BOTTOMLEFT')
		this.s[2]:SetPoint('BOTTOMRIGHT', this.c[4], 'TOPRIGHT')
		-- top
		this.s[3]:SetPoint('TOPLEFT', this.c[1], 'TOPRIGHT')
		this.s[3]:SetPoint('BOTTOMRIGHT', this.c[2], 'BOTTOMLEFT')
		-- bottom
		this.s[4]:SetPoint('TOPLEFT', this.c[3], 'TOPRIGHT')
		this.s[4]:SetPoint('BOTTOMRIGHT', this.c[4], 'BOTTOMLEFT')
			

		function this:SetColor(r, g, b)
			for i = 1, 4 do
				this.c[i]:SetVertexColor(r, g, b)
				this.s[i]:SetVertexColor(r, g, b)
			end
		end				
		this:SetColor(.1, .1, .1)	
		
		function this:SetPadding(x, y)
			local spacingx, spacingy = x, y and y or x
			local x0, x1, y0, y1 = -spacingx, spacingx, -spacingy, spacingy
			for i = 1, 4 do
				local xo, yo = (i == 1 or i == 3) and -1/8 or 1/8, (i == 1 or i == 2) and 1/8 or -1/8
				local x, y = (i == 1 or i == 3) and x0 or x1, (i == 1 or i == 2) and y1 or y0
				this.c[i]:SetPoint(corners[i][2],
				this,
				xo*(size)+x, yo*(size)+y)
			end
		end
				
		return this
	end
	-------------------------------------------------------------------------------
	--[[
	frameTest = CreateFrame('Frame', nil, UIparent)
	frameTest:SetHeight(22)		frameTest:SetWidth(64)	
	frameTest:SetFrameLevel(4)
	frameTest:SetPoint('CENTER', UIParent,0, 200)
	
	frameTest.t = frameTest:CreateTexture(nil, 'BACKGROUND')
	frameTest.t:SetAllPoints()
	frameTest.t:SetTexture(0, 0, 0)
	
	frameTest.bord = CreateBorder(nil, frameTest, 18)
	frameTest.bord:SetColor(1, 0, 1)
	]]--