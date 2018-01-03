
local HookRefreshUnit = pfUI.uf.RefreshUnit
function pfUI.uf:RefreshUnit(unit, component)
  local unitstr = ( unit.label or "" ) .. ( unit.id or "" )
  if unitstr == "" then return end
  
  local size = unit:GetWidth() / 1.5
  local elite = UnitClassification(unitstr)

  if not unit.dragonTop then
    unit.dragonTop = unit:CreateTexture(nil, "OVERLAY")
    unit.dragonTop:SetWidth(size)
    unit.dragonTop:SetHeight(size)
    unit.dragonTop:SetTexture("Interface\\AddOns\\pfUI-eliteoverlay\\top")
    unit.dragonTop:SetPoint("TOPRIGHT", unit, "TOPRIGHT", size/5, size/7)
    unit.dragonTop:SetParent(unit.hp.bar)
  end

  if not unit.dragonBottom then
    unit.dragonBottom = unit:CreateTexture(nil, "OVERLAY")
    unit.dragonBottom:SetWidth(size)
    unit.dragonBottom:SetHeight(size)
    unit.dragonBottom:SetTexture("Interface\\AddOns\\pfUI-eliteoverlay\\bottom")
    unit.dragonBottom:SetPoint("BOTTOMRIGHT", unit, "BOTTOMRIGHT", size/5.2, -size/2.98)
    unit.dragonBottom:SetParent(unit.hp.bar)
  end

  if elite == "worldboss" then
    unit.dragonTop:Show()
    unit.dragonTop:SetVertexColor(1,.8,0,1)
    unit.dragonBottom:Show()
    unit.dragonBottom:SetVertexColor(1,.8,0,1)
  elseif elite == "rareelite" then
    unit.dragonTop:Show()
    unit.dragonTop:SetVertexColor(1,.8,0,1)
    unit.dragonBottom:Show()
    unit.dragonBottom:SetVertexColor(1,.8,0,1)
  elseif elite == "elite" then
    unit.dragonTop:Show()
    unit.dragonTop:SetVertexColor(1,.9,.2,1)
    unit.dragonBottom:Show()
    unit.dragonBottom:SetVertexColor(1,.9,.2,1)
  elseif elite == "rare" then
    unit.dragonTop:Show()
    unit.dragonTop:SetVertexColor(1,1,1,1)
    unit.dragonBottom:Show()
    unit.dragonBottom:SetVertexColor(1,1,1,1)
  else
    unit.dragonTop:Hide()
    unit.dragonBottom:Hide()
  end

  HookRefreshUnit(this, unit, component)
end
