	-------------------------------------------------------------------------------	
	-- oUF Smooth Update
	-------------------------------------------------------------------------------	
	local smoothing = {}
	local function Smooth(self, value)
		local _, max = self:GetMinMaxValues()
		if value == self:GetValue() or (self._max and self._max ~= max) then
			smoothing[self] = nil
			self:SetValue_(value)
		else
			smoothing[self] = value
		end
		self._max = max
	end
	-------------------------------------------------------------------------------
	function SmoothBar(bar)
		bar.SetValue_ = bar.SetValue
		bar.SetValue = Smooth
	end
	-------------------------------------------------------------------------------
	local f, min, max = CreateFrame('Frame'), math.min, math.max 
	f:SetScript('OnUpdate', function()
		local limit = 30/GetFramerate()
		for bar, value in pairs(smoothing) do
			local cur = bar:GetValue()
			local new = cur + min((value-cur)/3, max(value-cur, limit))
			if new ~= new then
				-- Mad hax to prevent QNAN.
				new = value
			end
			bar:SetValue_(new)
			if cur == value or abs(new - value) < 2 then
				bar:SetValue_(value)
				smoothing[bar] = nil
			end
		end
	end)
	-------------------------------------------------------------------------------