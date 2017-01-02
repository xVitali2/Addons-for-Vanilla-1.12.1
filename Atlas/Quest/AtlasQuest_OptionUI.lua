--[[

	AtlasQuest, a World of Warcraft addon.
	Email me at mystery8@gmail.com

	This file is part of AtlasQuest.

	AtlasQuest is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	AtlasQuest is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with AtlasQuest; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]


local WHITE = "|cffFFFFFF";
local GREY = "|cff999999"; -- really grey

-----------------------------------------------------------------------------
-- initialises the options panel
-- and sets checks after the variables
-----------------------------------------------------------------------------
function AtlasQuestOptionFrame_OnShow()

    --autoshow
    if (AQAtlasAuto == 2) then
       AQAutoshowOption:SetChecked(false);
    end

    --left/right
    if (AQ_ShownSide == "Left") then
       AQRIGHTOption:SetChecked(false);
       AQLEFTOption:SetChecked(true);
    else
       AQRIGHTOption:SetChecked(true);
       AQLEFTOption:SetChecked(false);
    end

    -- Colour Check
    if (AQNOColourCheck) then
       AQColourOption:SetChecked(false);
    else
       AQColourOption:SetChecked(true);
    end

    --AQCheckQuestlog
    if (AQCheckQuestlog == nil) then
      AQCheckQuestlogButton:SetChecked(true);
    else
      AQCheckQuestlogButton:SetChecked(false);
    end

    -- AutoQuery
    if (AQAutoQuery == nil) then
      AQAutoQueryOption:SetChecked(false);
    else
      AQAutoQueryOption:SetChecked(true);
    end

    -- Suppress Server Query Text
    if (AQNoQuerySpam == nil) then
      AQNoQuerySpamOption:SetChecked(false);
    else
      AQNoQuerySpamOption:SetChecked(true);
    end

    -- ComparisonTooltips
    if (AQCompareTooltip == nil) then
      AQCompareTooltipOption:SetChecked(false);
    else
      AQCompareTooltipOption:SetChecked(true);
    end

end


-----------------------------------------------------------------------------
-- Autoshow option
-----------------------------------------------------------------------------
function AQAutoshowOption_OnClick()
          if (AQAtlasAuto == 1) then
            AQAtlasAuto = 2;
            ChatFrame1:AddMessage(AQAtlasAutoOFF);
            AQAutoshowOption:SetChecked(false);
          else
            AQAtlasAuto = 1;
            ChatFrame1:AddMessage(AQAtlasAutoON);
            AQAutoshowOption:SetChecked(true);
          end
          AtlasQuest_SaveData();
end


-----------------------------------------------------------------------------
-- Right option
-----------------------------------------------------------------------------
function AQRIGHTOption_OnClick()
     if ((AtlasFrame ~= nil) and (AtlasORAlphaMap == "Atlas")) then
       AtlasQuestFrame:ClearAllPoints();
       AtlasQuestFrame:SetPoint("TOP","AtlasFrame", 555, -80);
     elseif (AtlasORAlphaMap == "AlphaMap") then
       AtlasQuestFrame:ClearAllPoints();
       AtlasQuestFrame:SetPoint("TOP","AlphaMapFrame", 400, -107);
     end
     AQRIGHTOption:SetChecked(true);
     AQLEFTOption:SetChecked(false);
     if (AQ_ShownSide ~= "Right") then
       ChatFrame1:AddMessage(AQShowRight);
     end
     AQ_ShownSide = "Right";
     AtlasQuest_SaveData();
end


-----------------------------------------------------------------------------
-- Left option
-----------------------------------------------------------------------------
function AQLEFTOption_OnClick()
    if ((AtlasFrame ~= nil) and (AtlasORAlphaMap == "Atlas") and ( AQ_ShownSide == "Right") ) then
       AtlasQuestFrame:ClearAllPoints();
       AtlasQuestFrame:SetPoint("TOP","AtlasFrame", -545, -80);
     elseif ((AtlasORAlphaMap == "AlphaMap") and ( AQ_ShownSide == "Right") ) then
       AtlasQuestFrame:ClearAllPoints();
       AtlasQuestFrame:SetPoint("TOPLEFT","AlphaMapFrame", -195, -107);
     end
     AQRIGHTOption:SetChecked(false);
     AQLEFTOption:SetChecked(true);
     if (AQ_ShownSide ~= "Left") then
       ChatFrame1:AddMessage(AQShowLeft);
     end
     AQ_ShownSide = "Left";
     AtlasQuest_SaveData();
end


-----------------------------------------------------------------------------
-- Colour Check
-- if AQNOColourCheck = true then NO Colour Check
-----------------------------------------------------------------------------
function AQColourOption_OnClick()
    if (AQNOColourCheck) then
      AQNOColourCheck = nil;
      AQColourOption:SetChecked(true);
      ChatFrame1:AddMessage(AQCCON);
    else
      AQNOColourCheck = true;
      AQColourOption:SetChecked(false);
      ChatFrame1:AddMessage(AQCCOFF);
    end
    AtlasQuest_SaveData();
    AQUpdateNOW = true;
end


-----------------------------------------------------------------------------
-- CheckQuestlog option
-----------------------------------------------------------------------------
function AQCheckQuestlogButton_OnClick()
          if (AQCheckQuestlog == nil) then
            AQCheckQuestlog = "no";
            AQCheckQuestlogButton:SetChecked(false);
          else
            AQCheckQuestlog = nil;
            AQCheckQuestlogButton:SetChecked(true);
          end
          AtlasQuest_SaveData();
          AQUpdateNOW = true;
end


-----------------------------------------------------------------------------
-- AutoQuery Option
-----------------------------------------------------------------------------
function AQAutoQueryOption_OnClick()
 if (AQAutoQuery == nil) then
   AQAutoQuery = "yes";
   AQAutoQueryOption:SetChecked(true);
 else
   AQAutoQuery = nil;
   AQAutoQueryOption:SetChecked(false);
 end
 AtlasQuest_SaveData();
end


-----------------------------------------------------------------------------
-- Suppress AutoQuery Text Option
-----------------------------------------------------------------------------
function AQNoQuerySpamOption_OnClick()
 if (AQNoQuerySpam == nil) then
   AQNoQuerySpam = "yes";
   AQNoQuerySpamOption:SetChecked(true);
 else
   AQNoQuerySpam = nil;
   AQNoQuerySpamOption:SetChecked(false);
 end
 AtlasQuest_SaveData();
end


-----------------------------------------------------------------------------
-- Comparison Tooltips Option
-----------------------------------------------------------------------------
function AQCompareTooltipOption_OnClick()
 if (AQCompareTooltip == nil) then
   AQCompareTooltip = "yes";
   AQCompareTooltipOption:SetChecked(true);
	if IsAddOnLoaded("EquipCompare") then
		EquipCompare_RegisterTooltip(AtlasQuestTooltip);
	end
	if IsAddOnLoaded("EQCompare") then
		EQCompare:RegisterTooltip(AtlasQuestTooltip);
	end
 else
   AQCompareTooltip = nil;
   AQCompareTooltipOption:SetChecked(false);
	if IsAddOnLoaded("EquipCompare") then -- Unregister the AtlasQuest Tooltip with EquipCompare if it's enabled
     EquipCompare_UnregisterTooltip(AtlasQuestTooltip);
   end
	if IsAddOnLoaded("EQCompare") then
		EQCompare:UnRegisterTooltip(AtlasQuestTooltip);
	end
 end
 AtlasQuest_SaveData();
end

