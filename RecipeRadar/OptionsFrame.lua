
function RecipeRadar_OptionsFrame_OnLoad()

   UIPanelWindows["RecipeRadarOptionsFrame"] = { area = "center" }
   RecipeRadarOptionsFrameHeaderText:SetText(RRS("Recipe Radar"))

end

function RecipeRadar_OptionsFrame_Toggle()

   if (RecipeRadarOptionsFrame:IsVisible()) then
      RecipeRadarOptionsFrame:Hide()
   else
      RecipeRadarOptionsFrame:Show()
   end

end

function RecipeRadar_OptionsFrame_Init()

   RecipeRadarRealmAvailability:SetChecked(
         RecipeRadar_Options.RealmAvailability)

   RecipeRadarShowMinimapButton:SetChecked(
         RecipeRadar_Options.ShowMinimapButton)

   RecipeRadarMinimapButtonPositionSlider:SetValue(
         RecipeRadar_Options.MinimapButtonPosition)

   RecipeRadarAutoSelectRegionButton:SetChecked(
         RecipeRadar_Options.AutoSelectRegion)
   RecipeRadar_OptionsFrame_AutoSelectRegion_OnClick()
   
   RecipeRadarAutoMapVendorsButton:SetChecked(
         RecipeRadar_Options.AutoMapVendors)

end

function RecipeRadar_OptionsFrame_OnShow()

   RecipeRadar_OptionsFrame_Init()
   UIDropDownMenu_Initialize(RecipeRadar_ContinentDropDown,
         RecipeRadar_ContinentDropDown_Init)
   UIDropDownMenu_Initialize(RecipeRadar_RegionDropDown,
         RecipeRadar_RegionDropDown_Init)

end

function RecipeRadar_OptionsFrame_AutoSelectRegion_OnClick()

   if (RecipeRadarAutoSelectRegionButton:GetChecked()) then
   
      PlaySound("igMainMenuOptionCheckBoxOn")
      RecipeRadar_Options.AutoSelectRegion = true
      RecipeRadar_OptionsFrame_DisableDropDown(RecipeRadar_ContinentDropDown)
      RecipeRadar_OptionsFrame_DisableDropDown(RecipeRadar_RegionDropDown)

      -- auto-select the current region
      RecipeRadar_NewRegion(GetRealZoneText())
      UIDropDownMenu_ClearAll(RecipeRadar_ContinentDropDown)
      UIDropDownMenu_Initialize(RecipeRadar_ContinentDropDown,
            RecipeRadar_ContinentDropDown_Init)
      UIDropDownMenu_Initialize(RecipeRadar_RegionDropDown,
            RecipeRadar_RegionDropDown_Init)
      
   else

      PlaySound("igMainMenuOptionCheckBoxOff")
      RecipeRadar_Options.AutoSelectRegion = false
      RecipeRadar_OptionsFrame_EnableDropDown(RecipeRadar_ContinentDropDown)
      RecipeRadar_OptionsFrame_EnableDropDown(RecipeRadar_RegionDropDown)

   end

end

-----------------------------------------------------------------------------
-- Continent/region drop down code
-----------------------------------------------------------------------------

function RecipeRadar_ContinentDropDown_OnLoad()

   UIDropDownMenu_ClearAll(this)
   UIDropDownMenu_SetWidth(140)

end

function RecipeRadar_ContinentDropDown_Init()

   for index, name in RecipeRadar_Continents do

      local item = { }
      
      if ((not RecipeRadar_ContinentDropDown.selectedValue and
            index == RecipeRadar_Options.CurrentContinent) or
            index == RecipeRadar_ContinentDropDown.selectedValue) then
         item.checked = 1
      end
      
      item.text = name
      item.value = index
      item.func = RecipeRadar_ContinentDropDown_OnClick

      UIDropDownMenu_AddButton(item)

   end
   
   if (not RecipeRadar_ContinentDropDown.selectedValue) then
      UIDropDownMenu_SetSelectedValue(RecipeRadar_ContinentDropDown,
            RecipeRadar_Options.CurrentContinent)
   end

end

function RecipeRadar_ContinentDropDown_OnClick()

   UIDropDownMenu_SetSelectedValue(RecipeRadar_ContinentDropDown, this.value)
   UIDropDownMenu_Initialize(RecipeRadar_RegionDropDown,
         RecipeRadar_RegionDropDown_Init)

end

function RecipeRadar_GetContinentIndex(continent)

   for index, name in RecipeRadar_Continents do
      if (name == continent) then
         return index
      end
   end
   return nil

end

function RecipeRadar_RegionDropDown_OnLoad()

   UIDropDownMenu_SetWidth(140)

end

function RecipeRadar_RegionDropDown_Init()

   local cont = UIDropDownMenu_GetSelectedValue(RecipeRadar_ContinentDropDown)
   local regions = { }

   if (cont == 0) then

      -- create sorted list of relevant instances
      table.foreach(RecipeRadar_RegionData,
            function (k, v)
               if (v.Continent == 0) then
                  table.insert(regions, k)
               end
            end)
      table.sort(regions)

   else

      -- otherwise just populate with all the continent's regions
      regions = { GetMapZones(cont) }

   end

   
   for id, region in regions do

      local item = { }
      item.text = region
      item.value = id
      item.func = RecipeRadar_RegionDropDown_OnClick

      UIDropDownMenu_AddButton(item)

   end

   if (cont == RecipeRadar_Options.CurrentContinent) then
      UIDropDownMenu_SetSelectedName(RecipeRadar_RegionDropDown,
            RecipeRadar_Options.CurrentRegion)
   else
      UIDropDownMenu_ClearAll(RecipeRadar_RegionDropDown)
   end

end

function RecipeRadar_RegionDropDown_OnClick()

   UIDropDownMenu_SetSelectedID(RecipeRadar_RegionDropDown, this:GetID())
   RecipeRadar_NewRegion(this:GetText())
   RecipeRadarListScrollFrameScrollBar:SetValue(0)
   RecipeRadar_FrameUpdate()

end

function RecipeRadar_OptionsFrame_DisableDropDown(dropdown)

   getglobal(dropdown:GetName().."Text"):SetVertexColor(
         GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
   getglobal(dropdown:GetName().."Button"):Disable()

end

function RecipeRadar_OptionsFrame_EnableDropDown(dropdown)

   getglobal(dropdown:GetName().."Text"):SetVertexColor(
         HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
   getglobal(dropdown:GetName().."Button"):Enable()

end
