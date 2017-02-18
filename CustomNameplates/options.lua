local _G = getfenv(0)

local ADDON = {}
CustomNameplatesDBPC = CustomNameplatesDBPC or {}
ADDON.genSettings = _G.CustomNameplatesSettings and _G.CustomNameplatesSettings.genSettings
  or {["showPets"]=false,["enableAddOn"]=true,["showFriendly"]=false,["combatOnly"]=false,["hbwidth"]=80,["hbheight"]=4,
      ["texture"]="Interface\\AddOns\\CustomNameplates\\barSmall",["refreshRate"]=1/60,["clickThrough"]=true}
ADDON.raidicon = _G.CustomNameplatesSettings and _G.CustomNameplatesSettings.raidicon
  or {["size"]=15,["point"]="BOTTOMLEFT",["anchorpoint"]="BOTTOMLEFT",["xoffs"]=-18,["yoffs"]=-4}
ADDON.debufficon = _G.CustomNameplatesSettings and _G.CustomNameplatesSettings.debufficon
or {["hide"]=false,["sizex"]=12,["sizey"]=12,["point"]="BOTTOMLEFT",["anchorpoint"]="BOTTOMLEFT",["xoffs"]=-25,["yoffs"]=-13,["rowvector"] = 1}
ADDON.classicon = _G.CustomNameplatesSettings and _G.CustomNameplatesSettings.classicon
  or {["hide"]=false,["size"]=12,["point"]="RIGHT",["anchorpoint"]="LEFT",["xoffs"]=-3,["yoffs"]=-1}
ADDON.targetindicator = _G.CustomNameplatesSettings and _G.CustomNameplatesSettings.targetindicator
  or {["hide"]=false,["size"]=25,["point"]="BOTTOM",["anchorpoint"]="TOP",["xoffs"]=0,["yoffs"]=-5}
ADDON.nametext = _G.CustomNameplatesSettings and _G.CustomNameplatesSettings.nametext
  or {["size"]=12,["point"]="BOTTOM",["anchorpoint"]="CENTER",["xoffs"]=0,["yoffs"]=-4,
      ["font"]="Interface\\AddOns\\CustomNameplates\\Fonts\\Ubuntu-C.ttf"}
ADDON.leveltext = _G.CustomNameplatesSettings and _G.CustomNameplatesSettings.leveltext
  or {["hide"]=false,["size"]=11,["point"]="TOPLEFT",["anchorpoint"]="RIGHT",["xoffs"]=3,["yoffs"]=4,
      ["font"]="Interface\\AddOns\\CustomNameplates\\Fonts\\Helvetica_Neue_LT_Com_77_Bold_Condensed.ttf"}
ADDON.combopoints = _G.CustomNameplatesSettings and _G.CustomNameplatesSettings.combopoints
  or {["hide"]=false,["size"]=18,["point"]="TOP",["anchorpoint"]="TOP",["xoffs"]=0,["yoffs"]=-8,
      ["font"]=STANDARD_TEXT_FONT}

local Points = {
	"TOP", "RIGHT", "BOTTOM", "LEFT", "CENTER",
	"TOPRIGHT", "TOPLEFT", "BOTTOMLEFT", "BOTTOMRIGHT",
}

local CopyTable
CopyTable = function(t,copied)
  copied = copied or {}
  local copy = {}
  copied[t] = copy
  for k,v in pairs(t) do
    if type(v) == "table" then
      if copied[v] then
        copy[k] = copied[v]
      else
        copy[k] = CopyTable(v,copied)
      end
    else
      copy[k] = v
    end
  end
  return copy
end

local function Options()
  if not next(CustomNameplatesDBPC) then
    CustomNameplatesDBPC = CopyTable(ADDON)
  end
  if CustomNameplatesOptionsFrame then return CustomNameplatesOptionsFrame end
  local optionsFrame = CreateFrame("Frame","CustomNameplatesOptionsFrame",UIParent)
  optionsFrame:SetWidth(460)
  optionsFrame:SetHeight(31)
  optionsFrame:SetPoint("CENTER",UIParent, "CENTER",0,0)
  optionsFrame:EnableMouse(1)
  optionsFrame:SetMovable(1)

  tinsert(UISpecialFrames,"CustomNameplatesOptionsFrame")

  optionsFrame:SetBackdrop({
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 16,
    insets = { left = 5, right = 3, top = 3, bottom = 5 }
    })
  optionsFrame:SetBackdropBorderColor(0.4, 0.4, 0.4)
  optionsFrame:SetBackdropColor(0.15, 0.15, 0.15)

  optionsFrame.titleregion = optionsFrame:CreateTitleRegion(optionsFrame)
  optionsFrame.titleregion:SetAllPoints(optionsFrame)

  optionsFrame.title = optionsFrame:CreateFontString(nil,"ARTWORK","GameFontHighlight")
  optionsFrame.title:SetText("CustomNameplates 2.0")
  optionsFrame.title:SetPoint("TOPLEFT",optionsFrame,"TOPLEFT",8,-8)

  optionsFrame.close = CreateFrame("BUTTON",nil,optionsFrame,"UIPanelCloseButton")
  optionsFrame.close:SetPoint("TOPRIGHT",optionsFrame,"TOPRIGHT")

  optionsFrame.options = CreateFrame("FRAME",nil,optionsFrame)
  optionsFrame.options:SetWidth(272)
  optionsFrame.options:SetHeight(348)
  optionsFrame.options:SetPoint("TOPLEFT",optionsFrame,"BOTTOMLEFT")
  optionsFrame.options:EnableMouse(1)
  optionsFrame.options:SetBackdrop({
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 16,
    insets = { left = 5, right = 3, top = 3, bottom = 5 }
    })
  optionsFrame.options:SetBackdropBorderColor(0.4, 0.4, 0.4)
  optionsFrame.options:SetBackdropColor(0.15, 0.15, 0.15)

  optionsFrame.options.genSettings = CreateFrame("FRAME",nil,optionsFrame.options)
  optionsFrame.options.genSettings:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT", 8, -20)
  optionsFrame.options.genSettings:SetPoint("BOTTOMRIGHT",optionsFrame.options,"TOPRIGHT", -8, -155)
  optionsFrame.options.genSettings:SetBackdrop({
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true, tileSize = 8, edgeSize = 8,
    insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
  optionsFrame.options.genSettings:SetBackdropBorderColor(0, 0, 0)
  optionsFrame.options.genSettings:SetBackdropColor(0.1, 0.1, 0.1)

  optionsFrame.gentext = optionsFrame.options:CreateFontString(nil,"ARTWORK","GameFontHighlightSmall")
  optionsFrame.gentext:SetText("General Settings")
  optionsFrame.gentext:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT",18,-8)

  optionsFrame.enableAddOn = CreateFrame("CheckButton","CustomNameplatescb3",optionsFrame.options.genSettings,"UIOptionsCheckButtonTemplate")
  optionsFrame.enableAddOn:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT",16,-22)
  optionsFrame.enableAddOn:SetHitRectInsets(0,-30,5,5)
  optionsFrame.enableAddOn.option = {"genSettings","enableAddOn"}
  CustomNameplatescb3Text:SetText("Enemy")

  optionsFrame.showFriendly = CreateFrame("CheckButton","CustomNameplatescb1",optionsFrame.options.genSettings,"UIOptionsCheckButtonTemplate")
  optionsFrame.showFriendly:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT",80,-22)
  optionsFrame.showFriendly:SetHitRectInsets(0,-30,5,5)
  optionsFrame.showFriendly.option = {"genSettings","showFriendly"}
  CustomNameplatescb1Text:SetText("Friendly")

  optionsFrame.combatOnly = CreateFrame("CheckButton","CustomNameplatescb2",optionsFrame.options.genSettings,"UIOptionsCheckButtonTemplate")
  optionsFrame.combatOnly:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT",144,-22)
  optionsFrame.combatOnly:SetHitRectInsets(0,-30,5,5)
  optionsFrame.combatOnly.option = {"genSettings","combatOnly"}
  CustomNameplatescb2Text:SetText("Combat-Only")

  optionsFrame.showPets = CreateFrame("CheckButton","CustomNameplatescb4",optionsFrame.options.genSettings,"UIOptionsCheckButtonTemplate")
  optionsFrame.showPets:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT",16,-46)
  optionsFrame.showPets:SetHitRectInsets(0,-30,5,5)
  optionsFrame.showPets.option = {"genSettings","showPets"}
  CustomNameplatescb4Text:SetText("Pets")

  optionsFrame.clickThrough = CreateFrame("CheckButton","CustomNameplatescb5",optionsFrame.options.genSettings,"UIOptionsCheckButtonTemplate")
  optionsFrame.clickThrough:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT",80,-46)
  optionsFrame.clickThrough:SetHitRectInsets(0,-30,5,5)
  optionsFrame.clickThrough.option = {"genSettings","clickThrough"}
  CustomNameplatescb5Text:SetText("Click-Through")

  optionsFrame.texture = CreateFrame("EditBox","CustomNameplateseb1",optionsFrame.options.genSettings,"InputBoxTemplate")
  optionsFrame.texture:SetWidth(135)
  optionsFrame.texture:SetHeight(12)
  optionsFrame.texture.text = optionsFrame.texture:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
  optionsFrame.texture.text:SetText("Healthbar Texture")
  optionsFrame.texture.text:SetPoint("RIGHT",optionsFrame.texture,"LEFT",-5,0)
  optionsFrame.texture:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT",115,-72)
  optionsFrame.texture.option = {"genSettings","texture"}

  optionsFrame.hbwidth = CreateFrame("EditBox","CustomNameplateseb2",optionsFrame.options.genSettings,"InputBoxTemplate")
  optionsFrame.hbwidth:SetWidth(25)
  optionsFrame.hbwidth:SetHeight(12)
  optionsFrame.hbwidth.text = optionsFrame.hbwidth:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
  optionsFrame.hbwidth.text:SetText("Width")
  optionsFrame.hbwidth.text:SetPoint("RIGHT",optionsFrame.hbwidth,"LEFT",-5,0)
  optionsFrame.hbwidth:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT",55,-96)
  optionsFrame.hbwidth.option = {"genSettings","hbwidth"}

  optionsFrame.hbheight = CreateFrame("EditBox","CustomNameplateseb3",optionsFrame.options.genSettings,"InputBoxTemplate")
  optionsFrame.hbheight:SetWidth(25)
  optionsFrame.hbheight:SetHeight(12)
  optionsFrame.hbheight.text = optionsFrame.hbheight:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
  optionsFrame.hbheight.text:SetText("Height")
  optionsFrame.hbheight.text:SetPoint("RIGHT",optionsFrame.hbheight,"LEFT",-5,0)
  optionsFrame.hbheight:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT",150,-96)
  optionsFrame.hbheight.option = {"genSettings","hbheight"}  

  optionsFrame.refreshRate = CreateFrame("Slider","CustomNameplatesslider1",optionsFrame.options.genSettings,"OptionsSliderTemplate")
  optionsFrame.refreshRate:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT",18,-125)
  optionsFrame.refreshRate:SetPoint("TOPRIGHT",optionsFrame.options,"TOPRIGHT",-18,-125)
  optionsFrame.refreshRate:SetMinMaxValues(30,120)
  optionsFrame.refreshRate:SetValueStep(5)
  optionsFrame.refreshRate.option = {"genSettings","refreshRate"}
  CustomNameplatesslider1Low:SetText("30")
  CustomNameplatesslider1High:SetText("120")

  optionsFrame.options.iconSettings = CreateFrame("FRAME",nil,optionsFrame.options)
  optionsFrame.options.iconSettings:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT", 8, -165)
  optionsFrame.options.iconSettings:SetPoint("BOTTOMRIGHT",optionsFrame.options,"TOPRIGHT", -8, -224)
  optionsFrame.options.iconSettings:SetBackdrop({
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true, tileSize = 8, edgeSize = 8,
    insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
  optionsFrame.options.iconSettings:SetBackdropBorderColor(0, 0, 0)
  optionsFrame.options.iconSettings:SetBackdropColor(0.1, 0.1, 0.1)

  optionsFrame.icontext = optionsFrame.options:CreateFontString(nil,"ARTWORK","GameFontHighlightSmall")
  optionsFrame.icontext:SetText("Icon Settings")
  optionsFrame.icontext:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT",18,-155)

  optionsFrame.doublecb = CreateFrame("CheckButton","CustomNameplatescb6",optionsFrame.options.iconSettings,"UIOptionsCheckButtonTemplate")
  optionsFrame.doublecb:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT",16,-165)
  optionsFrame.doublecb:SetHitRectInsets(0,-30,5,5)
  CustomNameplatescb6Text:SetText("Placeholder6")

  optionsFrame.doublehover = CreateFrame("CheckButton","CustomNameplatescb7",optionsFrame.options.iconSettings,"UIOptionsCheckButtonTemplate")
  optionsFrame.doublehover:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT",110,-165)
  optionsFrame.doublehover:SetHitRectInsets(0,-30,5,5)
  optionsFrame.doublehover.option = "doublehover"
  CustomNameplatescb7Text:SetText("Placeholder7")

  optionsFrame.options.bindingframe = CreateFrame("FRAME",nil,optionsFrame.options)
  optionsFrame.options.bindingframe:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT", 8, -213)
  optionsFrame.options.bindingframe:SetPoint("BOTTOMRIGHT",optionsFrame.options,"TOPRIGHT", -8, -296)
  optionsFrame.options.bindingframe:SetBackdrop({
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true, tileSize = 8, edgeSize = 8,
    insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
  optionsFrame.options.bindingframe:SetBackdropBorderColor(0, 0, 0)
  optionsFrame.options.bindingframe:SetBackdropColor(0.1, 0.1, 0.1)

  optionsFrame.bindingtext = optionsFrame.options:CreateFontString(nil,"ARTWORK","GameFontHighlightSmall")
  optionsFrame.bindingtext:SetText("Nameplate Keybinds")
  optionsFrame.bindingtext:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT",18,-201)

  optionsFrame.bindingkey1 = CreateFrame("Button","CustomNameplateskb1",optionsFrame.options.bindingframe,"UIPanelButtonTemplate2")
  optionsFrame.bindingkey1:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT",16,-219)
  optionsFrame.bindingkey1:SetWidth(220)
  optionsFrame.bindingkey1:SetTextFontObject(GameFontHighlightSmall)
  optionsFrame.bindingkey1:SetHighlightFontObject(GameFontHighlightSmall)
  optionsFrame.bindingkey1:SetScript("OnClick",function() srti.SetKeyBinding(arg1,"NAMEPLATES",1) end)

  optionsFrame.unbindingkey1 = CreateFrame("Button",nil,optionsFrame.options.bindingframe)
  optionsFrame.unbindingkey1:SetPoint("LEFT",optionsFrame.bindingkey1,"RIGHT",-6,-1.5)
  optionsFrame.unbindingkey1:SetWidth(32)
  optionsFrame.unbindingkey1:SetHeight(32)
  optionsFrame.unbindingkey1:SetNormalTexture("Interface\\Buttons\\CancelButton-Up")
  optionsFrame.unbindingkey1:SetPushedTexture("Interface\\Buttons\\CancelButton-Down")
  local h = optionsFrame.unbindingkey1:CreateTexture(nil,"HIGHLIGHT")
  h:SetTexture("Interface\\Buttons\\CancelButton-Highlight")
  h:SetAllPoints()
  h:SetBlendMode("ADD")
  optionsFrame.unbindingkey1:SetHighlightTexture(h)
  optionsFrame.unbindingkey1:SetScript("OnClick",function() srti.SetKeyBinding(arg1,"NAMEPLATES",1,1) end)

  optionsFrame.bindingkey2 = CreateFrame("Button","CustomNameplateskb2",optionsFrame.options.bindingframe,"UIPanelButtonTemplate2")
  optionsFrame.bindingkey2:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT",16,-242)
  optionsFrame.bindingkey2:SetWidth(220)
  optionsFrame.bindingkey2:SetTextFontObject(GameFontHighlightSmall)
  optionsFrame.bindingkey2:SetHighlightFontObject(GameFontHighlightSmall)
  optionsFrame.bindingkey2:SetScript("OnClick",function() srti.SetKeyBinding(arg1,"FRIENDNAMEPLATES",2) end)

  optionsFrame.unbindingkey2 = CreateFrame("Button",nil,optionsFrame.options.bindingframe)
  optionsFrame.unbindingkey2:SetPoint("LEFT",optionsFrame.bindingkey2,"RIGHT",-6,-1.5)
  optionsFrame.unbindingkey2:SetWidth(32)
  optionsFrame.unbindingkey2:SetHeight(32)
  optionsFrame.unbindingkey2:SetNormalTexture("Interface\\Buttons\\CancelButton-Up")
  optionsFrame.unbindingkey2:SetPushedTexture("Interface\\Buttons\\CancelButton-Down")
  h = optionsFrame.unbindingkey2:CreateTexture(nil,"HIGHLIGHT")
  h:SetTexture("Interface\\Buttons\\CancelButton-Highlight")
  h:SetAllPoints()
  h:SetBlendMode("ADD")
  optionsFrame.unbindingkey2:SetHighlightTexture(h)
  optionsFrame.unbindingkey2:SetScript("OnClick",function() srti.SetKeyBinding(arg1,"FRIENDNAMEPLATES",2,1) end)

  optionsFrame.bindinghover = CreateFrame("CheckButton","CustomNameplatescb8",optionsFrame.options.bindingframe,"UIOptionsCheckButtonTemplate")
  optionsFrame.bindinghover:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT",16,-268)
  optionsFrame.bindinghover:SetHitRectInsets(0,-130,5,5)
  optionsFrame.bindinghover.option = "bindinghover"
  CustomNameplatescb7Text:SetText("Placeholder11")


  optionsFrame.options.hoverframe = CreateFrame("FRAME",nil,optionsFrame.options)
  optionsFrame.options.hoverframe:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT", 8, -298)
  optionsFrame.options.hoverframe:SetPoint("BOTTOMRIGHT",optionsFrame.options,"TOPRIGHT", -8, -342)
  optionsFrame.options.hoverframe:SetBackdrop({
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true, tileSize = 8, edgeSize = 8,
    insets = { left = 2, right = 2, top = 2, bottom = 2 }
    })
  optionsFrame.options.hoverframe:SetBackdropBorderColor(0, 0, 0)
  optionsFrame.options.hoverframe:SetBackdropColor(0.1, 0.1, 0.1)

  optionsFrame.hovertime = CreateFrame("Slider","CustomNameplatesslider2",optionsFrame.options,"OptionsSliderTemplate")
  optionsFrame.hovertime:SetPoint("TOPLEFT",optionsFrame.options,"TOPLEFT",18,-312)
  optionsFrame.hovertime:SetPoint("TOPRIGHT",optionsFrame.options,"TOPRIGHT",-18,-312)
  optionsFrame.hovertime:SetMinMaxValues(0.0,0.5)
  optionsFrame.hovertime:SetValueStep(0.05)
  optionsFrame.hovertime.option = "hovertime"
  CustomNameplatesslider2Low:SetText("Placeholder12")
  CustomNameplatesslider2High:SetText("Placeholder13")

  optionsFrame.preview = CreateFrame("FRAME",nil,optionsFrame)
  optionsFrame.preview:EnableMouse(1)
  optionsFrame.preview:SetMovable(1)
  optionsFrame.preview:SetBackdrop({
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 16,
    insets = { left = 5, right = 3, top = 3, bottom = 5 }
    })
  optionsFrame.preview:SetBackdropBorderColor(0.4, 0.4, 0.4)
  optionsFrame.preview:SetBackdropColor(0.15, 0.15, 0.15)
  optionsFrame.preview:SetPoint("TOPRIGHT",optionsFrame,"BOTTOMRIGHT",0,0)
  optionsFrame.preview:SetPoint("BOTTOMLEFT",optionsFrame.options,"BOTTOMRIGHT",0,0)

  optionsFrame.preview.model = CreateFrame("PLAYERMODEL",nil,optionsFrame.preview)
  optionsFrame.preview.model:SetPoint("TOPRIGHT",optionsFrame.preview,"TOPRIGHT",0,-48)
  optionsFrame.preview.model:SetPoint("BOTTOMLEFT",optionsFrame.preview,"BOTTOMLEFT",0,0)
  optionsFrame.preview.model:RegisterEvent("DISPLAY_SIZE_CHANGED")
  optionsFrame.preview.model:SetRotation(0.61)
  optionsFrame.preview.model:SetUnit("player")
  optionsFrame.preview.model:SetScript("OnEvent", function() this:RefreshUnit() end )

  optionsFrame.preview.nameplate = CreateFrame("Frame",nil,optionsFrame.preview)
  optionsFrame.preview.nameplate:SetPoint("BOTTOM",optionsFrame.preview.model,"TOP",0,-30)
  optionsFrame.preview.nameplate.hbar = CreateFrame("StatusBar",nil,optionsFrame.preview.nameplate)
  optionsFrame.preview.nameplate.hbar.bg = optionsFrame.preview.nameplate.hbar:CreateTexture(nil, "BORDER")
  optionsFrame.preview.nameplate.hbar.bg:SetTexture(0,0,0,0.85)
  optionsFrame.preview.nameplate.nt = optionsFrame.preview.nameplate:CreateFontString(nil,"ARTWORK","GameFontNormal")
  optionsFrame.preview.nameplate.nt:SetTextColor(1,1,1,0.85)
  optionsFrame.preview.nameplate.lt = optionsFrame.preview.nameplate:CreateFontString(nil,"ARTWORK","GameFontNormal")
  optionsFrame.preview.nameplate.lt:SetTextColor(1,0.4,0.2,0.85)
  optionsFrame.preview.nameplate.rt = optionsFrame.preview.nameplate:CreateTexture(nil, "BORDER")
  optionsFrame.preview.nameplate.rt:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcons")
  optionsFrame.preview.nameplate.ti = optionsFrame.preview.nameplate:CreateTexture(nil, "OVERLAY")
  optionsFrame.preview.nameplate.ti:SetTexture("Interface\\AddOns\\CustomNameplates\\Reticule")
  optionsFrame.preview.nameplate.ci = optionsFrame.preview.nameplate:CreateTexture(nil, "BORDER")
  optionsFrame.preview.nameplate.ci:SetTexture("Interface\\AddOns\\CustomNameplates\\Class\\ClassIcon_Hunter")
  optionsFrame.preview.nameplate.ci:SetTexCoord(.078, .92, .079, .937)
  optionsFrame.preview.nameplate.ci:SetAlpha(0.9)
  optionsFrame.preview.nameplate.cib = optionsFrame.preview.nameplate:CreateTexture(nil, "BACKGROUND")
  optionsFrame.preview.nameplate.cib:SetTexture(0,0,0,0.9)
  optionsFrame.preview.nameplate.cib:SetPoint("CENTER", optionsFrame.preview.nameplate.ci, "CENTER", 0, 0)
  optionsFrame.preview.nameplate.cib:Hide()
  optionsFrame.preview.nameplate.di = {}
  for i=1,16,1 do
    if i<=8 then --first row
      optionsFrame.preview.nameplate.di[i] = optionsFrame.preview.nameplate:CreateTexture(nil, "BORDER")
      optionsFrame.preview.nameplate.di[i]:SetTexture("Interface\\Icons\\Temp")
    elseif i>8 then --second row
      optionsFrame.preview.nameplate.di[i] = optionsFrame.preview.nameplate:CreateTexture(nil, "BORDER")
      optionsFrame.preview.nameplate.di[i]:SetTexture("Interface\\Icons\\Temp")
    end
  end
  optionsFrame.preview.nameplate.UpdatePreview = function()
	  optionsFrame.preview.nameplate:SetWidth(100)
	  optionsFrame.preview.nameplate:SetHeight(6)
	  optionsFrame.preview.nameplate:Show()
	  optionsFrame.preview.nameplate.hbar:SetStatusBarTexture("Interface\\AddOns\\CustomNameplates\\barSmall")
  	  optionsFrame.preview.nameplate.hbar:SetAllPoints()
  	  optionsFrame.preview.nameplate.hbar.bg:ClearAllPoints()
      optionsFrame.preview.nameplate.hbar.bg:SetPoint("CENTER", optionsFrame.preview.nameplate.hbar, "CENTER", 0, 0)
      optionsFrame.preview.nameplate.hbar.bg:SetWidth(optionsFrame.preview.nameplate.hbar:GetWidth() + 1.5)
      optionsFrame.preview.nameplate.hbar.bg:SetHeight(optionsFrame.preview.nameplate.hbar:GetHeight() + 1.5)
      optionsFrame.preview.nameplate.hbar:SetStatusBarColor(1,0,0,0.9)
      optionsFrame.preview.nameplate.nt:SetFont("Interface\\AddOns\\CustomNameplates\\Fonts\\Ubuntu-C.ttf",12)
      optionsFrame.preview.nameplate.nt:SetPoint("BOTTOM",optionsFrame.preview.nameplate,"CENTER",0,6) -- y + 10
      optionsFrame.preview.nameplate.nt:SetText((UnitName("player")))
      optionsFrame.preview.nameplate.lt:SetFont("Interface\\AddOns\\CustomNameplates\\Fonts\\Helvetica_Neue_LT_Com_77_Bold_Condensed.ttf",11)
      optionsFrame.preview.nameplate.lt:SetPoint("TOPLEFT",optionsFrame.preview.nameplate.nt,"RIGHT",3,4)
      optionsFrame.preview.nameplate.lt:SetText("59")
      optionsFrame.preview.nameplate.rt:SetWidth(15)
      optionsFrame.preview.nameplate.rt:SetHeight(15)
      optionsFrame.preview.nameplate.rt:SetPoint("BOTTOMLEFT",optionsFrame.preview.nameplate,"BOTTOMLEFT",-18,-4)
      SetRaidTargetIconTexture(optionsFrame.preview.nameplate.rt,8)
      optionsFrame.preview.nameplate.ti:SetWidth(25)
      optionsFrame.preview.nameplate.ti:SetHeight(25)
      optionsFrame.preview.nameplate.ti:ClearAllPoints()
      optionsFrame.preview.nameplate.ti:SetPoint("BOTTOM",optionsFrame.preview.nameplate,"TOP",0,15) -- y + 10
      optionsFrame.preview.nameplate.ci:ClearAllPoints()
      optionsFrame.preview.nameplate.ci:SetPoint("RIGHT", optionsFrame.preview.nameplate.nt, "LEFT", -3, -1)
      optionsFrame.preview.nameplate.ci:SetWidth(12)
      optionsFrame.preview.nameplate.ci:SetHeight(12)
      optionsFrame.preview.nameplate.cib:SetWidth(12 + 1.5)
      optionsFrame.preview.nameplate.cib:SetHeight(12 + 1.5)
      for i=1,16,1 do
        if i<=8 then --first row
          optionsFrame.preview.nameplate.di[i]:ClearAllPoints()
          optionsFrame.preview.nameplate.di[i]:SetPoint("BOTTOMLEFT", optionsFrame.preview.nameplate, "BOTTOMLEFT", (i-1) * 12, -13)
          optionsFrame.preview.nameplate.di[i]:SetWidth(12) 
          optionsFrame.preview.nameplate.di[i]:SetHeight(12) 
        elseif i>8 then --second row
          optionsFrame.preview.nameplate.di[i]:ClearAllPoints()
          optionsFrame.preview.nameplate.di[i]:SetPoint("BOTTOMLEFT", optionsFrame.preview.nameplate, "BOTTOMLEFT", (i-9) * 12, -25)
          optionsFrame.preview.nameplate.di[i]:SetWidth(12)
          optionsFrame.preview.nameplate.di[i]:SetHeight(12)
        end
      end
  end
  optionsFrame.preview.nameplate.UpdatePreview()
--[[ADDON.raidicon = _G.CustomNameplatesSettings and _G.CustomNameplatesSettings.raidicon
  or {["size"]=15,["point"]="BOTTOMLEFT",["anchorpoint"]="BOTTOMLEFT",["xoffs"]=-18,["yoffs"]=-4}
ADDON.debufficon = _G.CustomNameplatesSettings and _G.CustomNameplatesSettings.debufficon
  or {["hide"]=false,["size"]=12,["point"]="BOTTOMLEFT",["anchorpoint"]="BOTTOMLEFT",["row1yoffs"]=-13,["row2yoffs"]=-25}
ADDON.classicon = _G.CustomNameplatesSettings and _G.CustomNameplatesSettings.classicon
  or {["hide"]=false,["size"]=12,["point"]="RIGHT",["anchorpoint"]="LEFT",["xoffs"]=-3,["yoffs"]=-1}
ADDON.targetindicator = _G.CustomNameplatesSettings and _G.CustomNameplatesSettings.targetindicator
  or {["hide"]=false,["size"]=25,["point"]="BOTTOM",["anchorpoint"]="TOP",["xoffs"]=0,["yoffs"]=-5}]]

--[[ADDON.nametext = _G.CustomNameplatesSettings and _G.CustomNameplatesSettings.nametext
  or {["size"]=12,["point"]="BOTTOM",["anchorpoint"]="CENTER",["xoffs"]=0,["yoffs"]=-4,
      ["font"]="Interface\\AddOns\\CustomNameplates\\Fonts\\Ubuntu-C.ttf"}
ADDON.leveltext = _G.CustomNameplatesSettings and _G.CustomNameplatesSettings.leveltext
  or {["hide"]=false,["size"]=11,["point"]="TOPLEFT",["anchorpoint"]="RIGHT",["xoffs"]=3,["yoffs"]=4,
      ["font"]="Interface\\AddOns\\CustomNameplates\\Fonts\\Helvetica_Neue_LT_Com_77_Bold_Condensed.ttf"}]]

  optionsFrame.preview.help = optionsFrame.preview:CreateFontString(nil,"ARTWORK","GameFontDisable")
  optionsFrame.preview.help:SetText("Nameplate Preview")
  optionsFrame.preview.help:SetPoint("BOTTOM",optionsFrame.preview,"BOTTOM",0,8)
  optionsFrame.preview.help:SetPoint("LEFT",optionsFrame.preview,"LEFT",0,8)
  optionsFrame.preview.help:SetPoint("RIGHT",optionsFrame.preview,"RIGHT",0,-8)

  optionsFrame.ModiferCB = function()
    local section, option
    if type(this.option) == "table" then
      section,option = this.option[1],this.option[2]
    else
      option = this.option
    end
    if section then
      CustomNameplatesDBPC[section][option] = this:GetChecked() == 1
    else
      CustomNameplatesDBPC[option] = this:GetChecked() == 1
    end
  end

  optionsFrame.DoubleCB = function()
    CustomNameplatesDBPC.double = this:GetChecked() == 1
  end

  optionsFrame.UpdateSlider = function()
    CustomNameplatesslider1Text:SetText(string.format("Refresh: %d FPS",math.ceil(1/CustomNameplatesDBPC.genSettings.refreshRate) or 60))
    --CustomNameplatesslider2Text:SetText(string.format(CustomNameplates_OPTIONS_HOVER_TIME,string.sub(CustomNameplatesDBPC.hovertime,1,4) or 0.2))
  end

  optionsFrame.DoubleSlider = function()
  	local section, option
    if type(this.option) == "table" then
      section,option = this.option[1],this.option[2]
    else
      option = this.option
    end
    local val = tonumber(this:GetValue())
    if section then
      CustomNameplatesDBPC[section][option] = 1/val
    else
      CustomNameplatesDBPC[option] = 1/val
    end 
    optionsFrame.UpdateSlider()
  end

  optionsFrame.enableAddOn:SetScript("OnClick",optionsFrame.ModiferCB)
  optionsFrame.showFriendly:SetScript("OnClick",optionsFrame.ModiferCB)
  optionsFrame.combatOnly:SetScript("OnClick",optionsFrame.ModiferCB)
  optionsFrame.showPets:SetScript("OnClick",optionsFrame.ModiferCB)
  optionsFrame.clickThrough:SetScript("OnClick",optionsFrame.ModiferCB)

  optionsFrame.doublecb:SetScript("OnClick",optionsFrame.DoubleCB)
  optionsFrame.refreshRate:SetScript("OnValueChanged",optionsFrame.DoubleSlider)
  optionsFrame.hovertime:SetScript("OnValueChanged",optionsFrame.DoubleSlider)
  optionsFrame.doublehover:SetScript("OnClick",optionsFrame.ModiferCB)

  optionsFrame.bindinghover:SetScript("OnClick",optionsFrame.ModiferCB)

  optionsFrame.UpdateBindings = function()
    local binding1, _ = GetBindingKey("NAMEPLATES")
    local binding2, _ = GetBindingKey("FRIENDNAMEPLATES")
    if ( binding1 ) then
      optionsFrame.bindingkey1:SetText(GetBindingText(binding1, "KEY_"))
      optionsFrame.bindingkey1:SetAlpha(1)
    else
      optionsFrame.bindingkey1:SetText(NORMAL_FONT_COLOR_CODE..NOT_BOUND..FONT_COLOR_CODE_CLOSE)
      optionsFrame.bindingkey1:SetAlpha(0.8)
    end
    if ( binding2 ) then
      optionsFrame.bindingkey2:SetText(GetBindingText(binding2, "KEY_"))
      optionsFrame.bindingkey2:SetAlpha(1)
    else
      optionsFrame.bindingkey2:SetText(NORMAL_FONT_COLOR_CODE..NOT_BOUND..FONT_COLOR_CODE_CLOSE)
      optionsFrame.bindingkey2:SetAlpha(0.8)
    end
  end

  optionsFrame.Update = function()
    optionsFrame.enableAddOn:SetChecked(CustomNameplatesDBPC.genSettings.enableAddOn and 1 or 0)
    optionsFrame.showFriendly:SetChecked(CustomNameplatesDBPC.genSettings.showFriendly and 1 or 0)
    optionsFrame.combatOnly:SetChecked(CustomNameplatesDBPC.genSettings.combatOnly and 1 or 0)
    optionsFrame.showPets:SetChecked(CustomNameplatesDBPC.genSettings.showPets and 1 or 0)
    optionsFrame.clickThrough:SetChecked(CustomNameplatesDBPC.genSettings.clickThrough and 1 or 0)
    local refreshRateVal = tonumber(math.ceil(1/CustomNameplatesDBPC.genSettings.refreshRate))
    optionsFrame.refreshRate:SetValue(refreshRateVal or 60)
    optionsFrame.hovertime:SetValue(CustomNameplatesDBPC.hovertime or 0.2)
    optionsFrame.doublecb:SetChecked(CustomNameplatesDBPC.double or 0)
    optionsFrame.doublehover:SetChecked(CustomNameplatesDBPC.doublehover or 0)

    optionsFrame.UpdateSlider()
    optionsFrame.UpdateBindings()
  end

  optionsFrame:SetScript("OnShow", optionsFrame.Update)

  optionsFrame.Update()
  optionsFrame:Hide()
  return optionsFrame

end

_G["CustomNameplatesOptions"] = Options