	-------------------------------------------------------------------------------
	local OnUpdateAnimation = function()
		if GetTime() < this.timeEnd then
			local finished = (GetTime() - this.timeStart) / (this.timeEnd - this.timeStart)
			if  finished < 1.0  then
				local time = finished * 1000;
				this:SetSequenceTime(0, time)
				return
			end
		else
			this:Hide()
		end
	end
	-------------------------------------------------------------------------------
	local OnUpdateAnimationReverse = function()
		if GetTime() < this.timeEnd then
			local finished = 1 - ((GetTime() - this.timeStart) / (this.timeEnd - this.timeStart))
			if  finished > 0  then
				local time = finished * 1000;
				this:SetSequenceTime(0, time)
				return
			end
		else
			this:Hide()
		end
	end
	-------------------------------------------------------------------------------
	CreateCooldown = function(parentFrame, scale, rev)
		if not parentFrame then print(parentFrame:GetName()..' error:|r This frame does not exist!')	return end
		
		if not parentFrame:IsObjectType'Frame' then
			print(parentFrame:GetName()..' error:|r The entered object \''..parentFrame'\' is not a frame!')
			return
		end
		
		local cd = CreateFrame('Model', parentFrame:GetName()..'Cooldown', parentFrame)--, 'CooldownFrameTemplate')
		cd:SetModel([[Interface\Cooldown\UI-Cooldown-Indicator.mdx]])
		
		cd:SetAllPoints()
		cd:SetScale(scale)

		cd.timeStart = 0
		cd.timeEnd = 0
		
		function cd:SetTimers(s, e)
			self.timeStart = s
			self.timeEnd = e
		end
		
		cd.reverse = rev
		cd:SetScript('OnUpdateModel', function()
			if this.reverse then 
				OnUpdateAnimationReverse()
			else
				OnUpdateAnimation()
			end
		end)
		--cd:SetScript('OnAnimFinished', CooldownFrame_OnAnimFinished)
		return cd	
	end
	-------------------------------------------------------------------------------