--[[--------------------------------------------------
----- VanillaGuide -----
------------------
Display.lua
Authors: mrmr
Version: 1.04.2
------------------------------------------------------
Description: 
		The Display object keeps track of what 
		diplayed in the Main Frame
    1.00
		-- Initial Ace2 release
	1.99a
		-- Ally addition starter version
    1.03
		-- No Changes. Just adjusting "version".
    		1.99x for a beta release was a weird choise.
	1.04.1
		-- This will be the object containing what the 
			MainFrame will display.
			It'll communicate with the GuideTable object
			getting guides and steps from there...hopefully...
	1.04.2
		-- no changes in here for this revision
------------------------------------------------------
Connection:
--]]--------------------------------------------------


--local VGuide = VGuide
Dv(" VGuide Display.lua Start")

objDisplay = {}
objDisplay.__index = objDisplay

function objDisplay:new(oSettings, oGuideTables)
	local obj = {}
    setmetatable(obj, self)

    local tGuideValues = oSettings:GetSettingsGuideValues()

    obj.CurrentStep = tGuideValues.Step
    obj.CurrentGuideID = tGuideValues.GuideID
    obj.CurrentStepCount = nil

    obj.GuideTitle = nil
    obj.StepFrameDisplay = nil
    obj.ScrollFrameDisplay = {}
	obj.StepInfoDisplay = {}

	obj.ScrollFrameDisplayWipe = function(self)
		for k,_ in ipairs(obj.ScrollFrameDisplay) do
			obj.ScrollFrameDisplay[k] = nil
		end
	end

	obj.StepInfoDisplayWipe = function(self)
		for k,_ in ipairs(obj.StepInfoDisplay) do
			obj.StepInfoDisplay[k] = nil
		end
	end

	obj.RetriveData = function(self)
		local t = oGuideTables:GetGuide(obj.CurrentGuideID)
		--Dtprint(t, 4)
		local count = 0
		obj.GuideTitle = t.title
		obj.StepFrameDisplay = t.items[obj.CurrentStep].str
		obj:ScrollFrameDisplayWipe()
		obj:StepInfoDisplayWipe()
		for k,v in ipairs(t.items) do
			count = count + 1
			obj.ScrollFrameDisplay[k] = v.str
			obj.StepInfoDisplay[k] = {}
			obj.StepInfoDisplay[k].x = v.x or nil
			obj.StepInfoDisplay[k].y = v.y or nil
			obj.StepInfoDisplay[k].zone = v.zone or nil
		end
		obj.CurrentStepCount = count
		obj:UpdateGuideValuesSettings()
	end

	obj.RetriveTableDDM = function(self)
		local t = oGuideTables:GetTableDDM()
		return t
	end

	obj.UpdateGuideValuesSettings = function(self)
		tGuideValues.Step = obj.CurrentStep
		tGuideValues.GuideID = obj.CurrentGuideID
		oSettings:SetSettingsGuideValues(tGuideValues)
	end

	obj.GuideByID = function(self, nGuideID)
		local bChange = false
		obj.CurrentGuideID = nGuideID
		obj.CurrentStep = 1
		obj:RetriveData()
		bChange = true

		return bChange
	end

	obj.StepByID = function(self, nStep)
		obj.CurrentStep = nStep
		obj:RetriveData()
	end

	-- bMode tells us if we need to position CurrentStep to the last
	-- step of the guide (in case we used PrevStep)
	obj.PrevGuide = function(self, bPrevStepBackGuide)
		if obj.CurrentGuideID > 1 then
			obj.CurrentGuideID = obj.CurrentGuideID - 1
			obj.CurrentStep = 1
			obj:RetriveData()
			if bPrevStepBackGuide then
				obj.CurrentStep = obj.CurrentStepCount
				obj.StepFrameDisplay = obj.ScrollFrameDisplay[obj.CurrentStep]
			end
		else
			Dv(" -- Already at GuideID 1")
		end
	end

	obj.NextGuide = function(self)
		if obj.CurrentGuideID < oGuideTables.GuideCount then
			obj.CurrentGuideID = obj.CurrentGuideID + 1
			obj.CurrentStep = 1
			obj:RetriveData()
		else
			Dv(" -- Already at last GuideID (" .. oGuideTables.GuideCount .. ")")
		end
	end

	obj.PrevStep = function(self)
		if obj.CurrentStep > 1 then
			obj.CurrentStep = obj.CurrentStep - 1
			obj.StepFrameDisplay = obj.ScrollFrameDisplay[obj.CurrentStep]
			obj:UpdateGuideValuesSettings()
		else
			obj:PrevGuide(true)
		end
	end

	obj.NextStep = function(self)
		if obj.CurrentStep < obj.CurrentStepCount then
			obj.CurrentStep = obj.CurrentStep + 1
			obj.StepFrameDisplay = obj.ScrollFrameDisplay[obj.CurrentStep]
			obj:UpdateGuideValuesSettings()
		else
			obj:NextGuide()
		end
	end

	obj.GetCurrentStep = function(self)
		return obj.CurrentStep
	end
	obj.GetCurrentGuideID = function(self)
		return obj.CurrentGuideID
	end
	obj.GetCurrentStepCount = function(self)
		return obj.CurrentStepCount
	end
	obj.GetCurrentStepInfo = function(self)
		return obj.StepInfoDisplay[obj.CurrentStep]
	end

	obj.GetStepLabel = function(self)
		return obj.StepFrameDisplay
	end
	obj.GetGuideTitle = function(self)
		return obj.GuideTitle
	end

	obj.GetScrollFrameDisplay = function(self)
		return obj.ScrollFrameDisplay
	end
	
	obj:RetriveData()

	return obj
end

Dv(" VGuide Display.lua End")
