
--self:SetBackdrop({
--  bgFile = "Interface\\AddOns\\KLHThreatMeter\\Images\\bg", tile = true, tileSize = 8,
--  edgeFile = "Interface\\AddOns\\KLHThreatMeter\\Images\\border", edgeSize = 8,
--  insets = {left = 0, right = 0, top = 0, bottom = 0},
--})
--self:SetBackdropColor(0,0,0,0.75)

KLHTM_Frame:SetBackdrop({
  bgFile = "Interface\\AddOns\\KLHThreatMeter\\Images\\bg", tile = true, tileSize = 8,
  edgeFile = "Interface\\AddOns\\KLHThreatMeter\\Images\\border", edgeSize = 8,
  insets = {left = 0, right = 0, top = 0, bottom = 0},
})
--KLHTM_Frame:SetBackdropColor(0,0,0,0.5)

-- title Frame
getglobal("KLHTM_TitleFrame".."LongTitle".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
getglobal("KLHTM_TitleFrame".."ShortTitle".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
KLHTM_TitleFrame:SetBackdropColor(0,0,0,0)

-- raidframe
getglobal("KLHTM_RaidFrame".."HeaderName".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
getglobal("KLHTM_RaidFrame".."HeaderThreat".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
getglobal("KLHTM_RaidFrame".."HeaderPercentThreat".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")

for i=1,20 do
	getglobal("KLHTM_RaidFrame".."Row"..i.."Name".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
	getglobal("KLHTM_RaidFrame".."Row"..i.."Threat".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
	getglobal("KLHTM_RaidFrame".."Row"..i.."PercentThreat".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
	getglobal("KLHTM_RaidFrame".."Row"..i.."Bar"):SetTexture("Interface\\AddOns\\KLHThreatMeter\\Images\\bar")
end

getglobal("KLHTM_RaidFrame".."Bottom".."ThreatDefecit".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
getglobal("KLHTM_RaidFrame".."Bottom".."MasterTarget".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")

--self frame
getglobal("KLHTM_SelfFrame".."HeaderName".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
getglobal("KLHTM_SelfFrame".."HeaderHits".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
getglobal("KLHTM_SelfFrame".."HeaderRage".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
getglobal("KLHTM_SelfFrame".."HeaderDamage".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
getglobal("KLHTM_SelfFrame".."HeaderThreat".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
getglobal("KLHTM_SelfFrame".."HeaderPercentThreat".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")

for i=1,15 do
	getglobal("KLHTM_SelfFrame".."Row"..i.."Name".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
	getglobal("KLHTM_SelfFrame".."Row"..i.."Hits".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
	getglobal("KLHTM_SelfFrame".."Row"..i.."Rage".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
	getglobal("KLHTM_SelfFrame".."Row"..i.."Damage".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
	getglobal("KLHTM_SelfFrame".."Row"..i.."Threat".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
	getglobal("KLHTM_SelfFrame".."Row"..i.."PercentThreat".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
	getglobal("KLHTM_SelfFrame".."Row"..i.."Bar"):SetTexture("Interface\\AddOns\\KLHThreatMeter\\Images\\bar")
end

getglobal("KLHTM_SelfFrame".."Bottom".."Name".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
getglobal("KLHTM_SelfFrame".."Bottom".."Hits".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
getglobal("KLHTM_SelfFrame".."Bottom".."Rage".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
getglobal("KLHTM_SelfFrame".."Bottom".."Damage".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
getglobal("KLHTM_SelfFrame".."Bottom".."Threat".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")
getglobal("KLHTM_SelfFrame".."Bottom".."PercentThreat".."Text"):SetFont("Interface\\AddOns\\KLHThreatMeter\\Images\\arial.ttf", 10, "OUTLINE")