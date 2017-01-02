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


-- Colours
local PURPLE = "|cff999999"; -- grey atm -- removed
local RED = "|cffff0000";
local REDA = "|cffcc6666";
local WHITE = "|cffFFFFFF";
local GREEN = "|cff1eff00";
local GREY = "|cff9F3FFF"; --purple now ^^
local BLUE = "|cff0070dd";
local ORANGE = "|cffff6090"; -- it is pink now
local YELLOW = "|cffffff00";
local BLACK = "|c0000000f";
local DARKGREEN = "|cff008000";
local BLUB = "|cffd45e19";

-- Quest Color
local Grau = "|cff9d9d9d"
local Gruen = "|cff1eff00"
local Orange = "|cffFF8000"
local Rot = "|cffFF0000"
local Gelb = "|cffFFd200"
local Blau = "|cff0070dd"

local AQQuestfarbe


-----------------------------------------------------------------------------
-- Buttons
-----------------------------------------------------------------------------
function AQClearALL()
       AQPageCount:SetText();
       HideUIPanel(AQNextPageButton_Right);
       HideUIPanel(AQNextPageButton_Left);
       QuestName:SetText("");
       QuestLeveltext:SetText("");
       Prequesttext:SetText("");
       QuestAttainLeveltext:SetText("");
       REWARDstext:SetText();
       StoryTEXT:SetText();
       AQFQ_TEXT:SetText();
       HideUIPanel(AQFinishedQuest);
       for b=1, 6 do
          getglobal("AtlasQuestItemframe"..b.."_Icon"):SetTexture();
          getglobal("AtlasQuestItemframe"..b.."_Name"):SetText();
          getglobal("AtlasQuestItemframe"..b.."_Extra"):SetText();
          getglobal("AtlasQuestItemframe"..b):Disable();
       end
end


-----------------------------------------------------------------------------
-- Option button, shows option frame or hides if shown
-----------------------------------------------------------------------------
function AQOPTION1_OnClick()
   if (AtlasQuestOptionFrame:IsVisible()) then
     HideUIPanel(AtlasQuestOptionFrame);
   else
     ShowUIPanel(AtlasQuestOptionFrame);
   end
end


-----------------------------------------------------------------------------
-- upper right button / to show/close panel
-----------------------------------------------------------------------------
function AQCLOSE_OnClick()
      AQ_AtlasOrAlphamap();
      if(AtlasQuestFrame:IsVisible()) then
          HideUIPanel(AtlasQuestFrame);
          HideUIPanel(AtlasQuestInsideFrame);
      else
          ShowUIPanel(AtlasQuestFrame);
      end
      AQUpdateNOW = true;
end


-----------------------------------------------------------------------------
-- upper left button on the panel for closing
-----------------------------------------------------------------------------
function AQCLOSE1_OnClick()
   HideUIPanel(AtlasQuestFrame);
end


-----------------------------------------------------------------------------
-- inside button to close the quest display
-----------------------------------------------------------------------------
function AQCLOSE2_OnClick()
    HideUIPanel(AtlasQuestInsideFrame);
    WHICHBUTTON = 0;
end


-----------------------------------------------------------------------------
-- Checkbox for Alliance
-----------------------------------------------------------------------------
function Alliance_OnClick()
     Allianceorhorde = 1
     AQHCB:SetChecked(false);
     AQACB:SetChecked(true);
     HideUIPanel(AtlasQuestInsideFrame);
     AQUpdateNOW = true;
end


-----------------------------------------------------------------------------
-- Checkbox for Horde
-----------------------------------------------------------------------------
function Horde_OnClick()
     Allianceorhorde = 2
     AQHCB:SetChecked(true);
     AQACB:SetChecked(false);
     HideUIPanel(AtlasQuestInsideFrame);
     AQUpdateNOW = true;
end


-----------------------------------------------------------------------------
-- Story Button
-----------------------------------------------------------------------------
function AQSTORY1_OnClick()
       AQHideAL();
       if (AtlasQuestInsideFrame:IsVisible() == nil) then
           ShowUIPanel(AtlasQuestInsideFrame);
           WHICHBUTTON = STORY;
           AQButtonSTORY_SetText();
       elseif ( WHICHBUTTON == STORY) then
          HideUIPanel(AtlasQuestInsideFrame);
       else
        WHICHBUTTON = STORY;
        AQButtonSTORY_SetText();
       end
end

-----------------------------------------------------------------------------
-- Button
-----------------------------------------------------------------------------
function Quest_OnClick(arg1)
   if (ChatFrameEditBox:IsVisible() and IsShiftKeyDown()) then
     AQInsertQuestInformation();
   else
     AQHideAL();
     StoryTEXT:SetText("");
     if (AtlasQuestInsideFrame:IsVisible() == nil) then
         ShowUIPanel(AtlasQuestInsideFrame);
         WHICHBUTTON = AQSHOWNQUEST;
         AQButton_SetText();
     elseif ( WHICHBUTTON == AQSHOWNQUEST) then
         HideUIPanel(AtlasQuestInsideFrame);
         WHICHBUTTON = 0;
     else
       WHICHBUTTON = AQSHOWNQUEST;
       AQButton_SetText();
     end
   end
end


-----------------------------------------------------------------------------
-- Hide the AtlasLoot Frame if available
-----------------------------------------------------------------------------
function AQHideAL()
       if ( AtlasLootItemsFrame ~= nil) then
            AtlasLootItemsFrame:Hide(); -- hide atlasloot
       end
end


-----------------------------------------------------------------------------
-- Insert Quest Information into the chat box
-----------------------------------------------------------------------------
function AQInsertQuestInformation()
local OnlyQuestNameRemovedNumber
local Quest
Quest = AQSHOWNQUEST;
  if (Quest <= 9) then
    if (Allianceorhorde == 1) then
      OnlyQuestNameRemovedNumber = strsub(getglobal("Inst"..AQINSTANZ.."Quest"..Quest), 4)
    elseif (Allianceorhorde == 2) then
      OnlyQuestNameRemovedNumber = strsub(getglobal("Inst"..AQINSTANZ.."Quest"..Quest.."_HORDE"), 4)
    end
  elseif (Quest > 9) then
    if (Allianceorhorde == 1) then
      OnlyQuestNameRemovedNumber = strsub(getglobal("Inst"..AQINSTANZ.."Quest"..Quest), 5)
    elseif (Allianceorhorde == 2) then
      OnlyQuestNameRemovedNumber = strsub(getglobal("Inst"..AQINSTANZ.."Quest"..Quest.."_HORDE"), 5)
    end
  end
  if ( Allianceorhorde == 1) then
    ChatFrameEditBox:Insert("["..OnlyQuestNameRemovedNumber.."] ["..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_Level").."]");
  else
    ChatFrameEditBox:Insert("["..OnlyQuestNameRemovedNumber.."] ["..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE_Level").."]");
  end
end


-----------------------------------------------------------------------------
-- set the Quest text
-- executed when you push a button
-----------------------------------------------------------------------------
function AQButton_SetText()
local SHOWNID
local name
local nameDATA
local colour
local itemName, itemQuality



     AQClearALL();
     -- Show the finished button
     ShowUIPanel(AQFinishedQuest);
     AQFQ_TEXT:SetText(BLUE..AQFinishedTEXT);
     --
     if ( Allianceorhorde == 1) then
       AQColourCheck(1); --CC swaped out (see below)
       AQCompareQLtoAQ(Quest)
         QuestName:SetText(AQQuestfarbe..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST));
         QuestLeveltext:SetText(BLUE..AQDiscription_LEVEL..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_Level"));
         QuestAttainLeveltext:SetText(BLUE..AQDiscription_ATTAIN..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_Attain")); 
         Prequesttext:SetText(BLUE..AQDiscription_PREQUEST..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_Prequest").."\n \n"..BLUE..AQDiscription_FOLGEQUEST..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_Folgequest").."\n \n"..BLUE..AQDiscription_START..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_Location").."\n \n"..BLUE..AQDiscription_AIM..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_Aim").."\n \n"..BLUE..AQDiscription_NOTE..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_Note"));

         -----------------------------------------------------------------------------
         -- FOR ALPHAMAP SUPPORT
         -- If there are other descriptions for alphamap and alphamap is shown then show them
         -----------------------------------------------------------------------------

         if ((AtlasORAlphaMap == "AlphaMap") and (getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_Note_AlphaMap") ~= nil)) then
           Prequesttext:SetText(BLUE..AQDiscription_PREQUEST..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_Prequest").."\n \n"..BLUE..AQDiscription_FOLGEQUEST..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_Folgequest").."\n \n"..BLUE..AQDiscription_START..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_Location_AlphaMap").."\n \n"..BLUE..AQDiscription_AIM..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_Aim").."\n \n"..BLUE..AQDiscription_NOTE..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_Note_AlphaMap"));
         end

         for b=1, 6 do
           REWARDstext:SetText(getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."Rewardtext"))
           if ( getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."ID"..b) ~= nil) then

             -----------------------------------------------------------------------------
             -- Yay for AutoQuery. Boo for odd variable names.
             -----------------------------------------------------------------------------

             SHOWNID = getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."ID"..b);

             if(AQAutoQuery ~= nil) then
               colour = getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."ITC"..b);
               nameDATA = getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."name"..b);

               if ( GetItemInfo(SHOWNID) == nil) then
                 GameTooltip:SetHyperlink("item:"..SHOWNID..":0:0:0");
                 if(AQNoQuerySpam == nil) then
                   DEFAULT_CHAT_FRAME:AddMessage(AQSERVERASK.."["..colour..nameDATA..WHITE.."]"..AQSERVERASKAuto);
                 end
               end

             end
			
			local _, _, _, _, _, _, _, _, itemTexture = GetItemInfo(SHOWNID);
             getglobal("AtlasQuestItemframe"..b.."_Icon"):SetTexture(itemTexture);
             getglobal("AtlasQuestItemframe"..b.."_Name"):SetText(AQgetItemInformation(b,"name"));
             getglobal("AtlasQuestItemframe"..b.."_Extra"):SetText(AQgetItemInformation(b,"extra"));
             getglobal("AtlasQuestItemframe"..b):Enable();
           else
             getglobal("AtlasQuestItemframe"..b.."_Icon"):SetTexture();
             getglobal("AtlasQuestItemframe"..b.."_Name"):SetText();
             getglobal("AtlasQuestItemframe"..b.."_Extra"):SetText();
             getglobal("AtlasQuestItemframe"..b):Disable();
           end
         end
     end
     if ( Allianceorhorde == 2) then
      AQColourCheck(0) --CC swaped out (see below)
       QuestName:SetText(AQQuestfarbe..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE"));
       QuestLeveltext:SetText(BLUE..AQDiscription_LEVEL..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE_Level"));
       QuestAttainLeveltext:SetText(BLUE..AQDiscription_ATTAIN..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE_Attain"));       
       Prequesttext:SetText(BLUE..AQDiscription_PREQUEST..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE_Prequest").."\n \n"..BLUE..AQDiscription_FOLGEQUEST..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE_Folgequest").."\n \n"..BLUE..AQDiscription_START..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE_Location").."\n \n"..BLUE..AQDiscription_AIM..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE_Aim").."\n \n"..BLUE..AQDiscription_NOTE..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE_Note"));

       -----------------------------------------------------------------------------
       -- FOR ALPHAMAP SUPPORT
       -- If there are other descriptions for alphamap and alphamap is shown then show them
       -----------------------------------------------------------------------------

       if ((AtlasORAlphaMap == "AlphaMap") and (getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE_Note_AlphaMap") ~= nil)) then
         Prequesttext:SetText(BLUE..AQDiscription_PREQUEST..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE_Prequest").."\n \n"..BLUE..AQDiscription_FOLGEQUEST..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE_Folgequest").."\n \n"..BLUE..AQDiscription_START..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE_Location_AlphaMap").."\n \n"..BLUE..AQDiscription_AIM..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE_Aim").."\n \n"..BLUE..AQDiscription_NOTE..WHITE..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE_Note_AlphaMap"));
       end
       for b=1, 6 do
           REWARDstext:SetText(getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."Rewardtext_HORDE"))
           if ( getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."ID"..b.."_HORDE") ~= nil) then
           
             -----------------------------------------------------------------------------
             -- Yay for AutoQuery. Boo for odd variable names.
             -----------------------------------------------------------------------------

             SHOWNID = getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."ID"..b.."_HORDE");

             if(AQAutoQuery ~= nil) then
               colour = getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."ITC"..b.."_HORDE");
               nameDATA = getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."name"..b.."_HORDE");

               if ( GetItemInfo(SHOWNID) == nil) then
                 GameTooltip:SetHyperlink("item:"..SHOWNID..":0:0:0");
                 if(AQNoQuerySpam == nil) then
                   DEFAULT_CHAT_FRAME:AddMessage(AQSERVERASK.."["..colour..nameDATA..WHITE.."]"..AQSERVERASKAuto);
                 end
               end

             end
           
			local _, _, _, _, _, _, _, _, itemTexture = GetItemInfo(SHOWNID);
             getglobal("AtlasQuestItemframe"..b.."_Icon"):SetTexture(itemTexture);
             getglobal("AtlasQuestItemframe"..b.."_Name"):SetText(AQgetItemInformation(b,"name"));
             getglobal("AtlasQuestItemframe"..b.."_Extra"):SetText(AQgetItemInformation(b,"extra"));
             getglobal("AtlasQuestItemframe"..b):Enable();
           else
             getglobal("AtlasQuestItemframe"..b.."_Icon"):SetTexture();
             getglobal("AtlasQuestItemframe"..b.."_Name"):SetText();
             getglobal("AtlasQuestItemframe"..b.."_Extra"):SetText();
             getglobal("AtlasQuestItemframe"..b):Disable();
           end
         end
     end
     AQQuestFinishedSetChecked();
     AQExtendedPages();
end


-----------------------------------------------------------------------------
-- improve the localisation through giving back the right and translated questname
-- sets the description text too
-- adds a error messeage to the description if item not available
-----------------------------------------------------------------------------
function AQgetItemInformation(count,what)
local itemId
local itemtext;
local itemdiscription;
local itemName, itemQuality

if ( Allianceorhorde == 2) then
  itemId = getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."ID"..count.."_HORDE")
  itemdiscription = getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."description"..count.."_HORDE")
  itemTEXTSAVED = getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."ITC"..count.."_HORDE")..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."name"..count.."_HORDE");
else
  itemId = getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."ID"..count)
  itemdiscription = getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."description"..count)
  itemTEXTSAVED = getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."ITC"..count)..getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."name"..count);
end

  if (GetItemInfo(itemId)) then
    itemName, _, itemQuality = GetItemInfo(itemId);
    local r, g, b, hex = GetItemQualityColor(itemQuality);
    itemtext = hex..itemName;
    if (what == "name") then
      return itemtext;
    elseif (what == "extra") then
      return itemdiscription;
    end
  else
    itemtext = itemTEXTSAVED
    if (what == "name") then
      return itemtext;
    elseif (what == "extra") then
      itemdiscription = itemdiscription.." "..RED..AQERRORNOTSHOWN;
      return itemdiscription;
    end
  end

end


-----------------------------------------------------------------------------
-- set the Questcolour
-- swaped out to get the code clear
-----------------------------------------------------------------------------
function AQColourCheck(arg1)
 local AQQuestlevelf
       if (arg1 == 1) then
         AQQuestlevelf = tonumber(getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_Level"));
         --DEFAULT_CHAT_FRAME:AddMessage("BLA");
       else
         AQQuestlevelf = tonumber(getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE_Level"));
         --DEFAULT_CHAT_FRAME:AddMessage("BLUB");
       end
       if ( AQQuestlevelf ~= nil or AQQuestlevelf ~= 0 or AQQuestlevelf ~= "") then
          if ( AQQuestlevelf == UnitLevel("player") or AQQuestlevelf == UnitLevel("player") + 2 or AQQuestlevelf  == UnitLevel("player") - 2 or AQQuestlevelf == UnitLevel("player") + 1 or AQQuestlevelf  == UnitLevel("player") - 1) then
             AQQuestfarbe = Gelb;
          elseif ( AQQuestlevelf > UnitLevel("player") + 2 and AQQuestlevelf <= UnitLevel("player") + 4) then
             AQQuestfarbe = Orange;
          elseif ( AQQuestlevelf >= UnitLevel("player") + 5 and AQQuestlevelf ~= 100) then
             AQQuestfarbe = Rot;
          elseif ( AQQuestlevelf < UnitLevel("player") - 7) then
             AQQuestfarbe = Grau;
          elseif ( AQQuestlevelf >= UnitLevel("player") - 7 and AQQuestlevelf < UnitLevel("player") - 2) then
             AQQuestfarbe = Gruen;
          end
          if (AQNOColourCheck) then
             AQQuestfarbe = Gelb;
          end
          if ( AQQuestlevelf == 100 or AQCompareQLtoAQ()) then
             AQQuestfarbe = Blau;
          end
          if (arg1 == 1) then
            if ( AQ[ "AQFinishedQuest_Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST ] == 1) then
              AQQuestfarbe = WHITE;
            end
          else
            if ( AQ[ "AQFinishedQuest_Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE" ] == 1) then
              AQQuestfarbe = WHITE;
            end
          end
       end
end


-----------------------------------------------------------------------------
-- set the checkbox for the finished quest check
-- swaped out to get the code clear
-----------------------------------------------------------------------------
function AQQuestFinishedSetChecked()
  if ( Allianceorhorde == 1) then
    if ( AQ[ "AQFinishedQuest_Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST ] == 1) then
      AQFinishedQuest:SetChecked(true);
    else
      AQFinishedQuest:SetChecked(false);
    end
  else
    if ( AQ[ "AQFinishedQuest_Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE" ] == 1) then
      AQFinishedQuest:SetChecked(true);
    else
      AQFinishedQuest:SetChecked(false);
    end
  end
end


-----------------------------------------------------------------------------
-- Allow pages
-- InstXXQuestXX_Page = number of pages
-- HideUIPanel(AQNextPageButton_Left); AQPageCount:SetText();
-----------------------------------------------------------------------------
function AQExtendedPages()
local SHIT
-- SHIT is added to make the code smaller it give back the right link for horde or alliance
if ( Allianceorhorde == 1) then --Alliance
  SHIT = getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_Page")
else
  SHIT = getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE_Page")
end

  if (type(SHIT) == "table") then
      if (type(SHIT[1]) == "number") then
        ShowUIPanel(AQNextPageButton_Right);
        AQ_NextPageCount = "Quest";
        AQ_CurrentSide = 1;
        AQPageCount:SetText(AQ_CurrentSide.."/"..SHIT[1]);
      end
  end
end


-----------------------------------------------------------------------------
-- Set Story Text
-----------------------------------------------------------------------------
function AQButtonSTORY_SetText()
       -- first clear display
       AQClearALL();

       -- show right story text
       if (getglobal("Inst"..AQINSTANZ.."Story") ~= nil) then
         QuestName:SetText(BLUE..getglobal("Inst"..AQINSTANZ.."Caption"));
         if (type(getglobal("Inst"..AQINSTANZ.."Story")) == "table") then
           StoryTEXT:SetText(WHITE..getglobal("Inst"..AQINSTANZ.."Story")["Page1"]);
           -- Show Next side button if next site is avaiable
           if (getglobal("Inst"..AQINSTANZ.."Story")["Page2"] ~= nil) then
             ShowUIPanel(AQNextPageButton_Right);
             AQ_CurrentSide = 1;
             -- shows total amount of pages
             AQPageCount:SetText(AQ_CurrentSide.."/"..getglobal("Inst"..AQINSTANZ.."Story")["MaxPages"])
             -- count to make a diffrent between story and normal text
             AQ_NextPageCount = "Story";
           end
         elseif (type(getglobal("Inst"..AQINSTANZ.."Story")) == "string") then
           StoryTEXT:SetText(WHITE..getglobal("Inst"..AQINSTANZ.."Story"));
         end
       -- added to work with future versions of atlas (before i update e.g. before you dl the update)
       elseif (getglobal("Inst"..AQINSTANZ.."Story") == nil) then
         QuestName:SetText("not available");
         StoryTEXT:SetText("not available");
       end
end


-----------------------------------------------------------------------------
-- shows the next side
-----------------------------------------------------------------------------
function AQNextPageR_OnClick()
local SideAfterThis = 0;
local SHIT
  SideAfterThis = AQ_CurrentSide + 2;
  AQ_CurrentSide = AQ_CurrentSide + 1;

  -- first clear display
  AQClearALL();

  -- it is a story text
  if (AQ_NextPageCount == "Story" ) then
    StoryTEXT:SetText(WHITE..getglobal("Inst"..AQINSTANZ.."Story")["Page"..AQ_CurrentSide]);
    AQPageCount:SetText(AQ_CurrentSide.."/"..getglobal("Inst"..AQINSTANZ.."Story")["MaxPages"])
    if (getglobal("Inst"..AQINSTANZ.."Caption"..AQ_CurrentSide) ~= nil) then
      QuestName:SetText(BLUE..getglobal("Inst"..AQINSTANZ.."Caption"..AQ_CurrentSide));
    else
      QuestName:SetText(BLUE..getglobal("Inst"..AQINSTANZ.."Caption"));
    end
    -- hide button if no next side
    if (getglobal("Inst"..AQINSTANZ.."Story")["Page"..SideAfterThis] == nil) then
      HideUIPanel(AQNextPageButton_Right);
    else
      ShowUIPanel(AQNextPageButton_Right);
    end
  end

  -- it is a quest text
  if (AQ_NextPageCount == "Quest" ) then
    -- SHIT is added to make the code smaller it give back the right link for horde or alliance
    if ( Allianceorhorde == 1) then --Alliance
      SHIT = getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_Page")
    else
      SHIT = getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE_Page")
    end
    StoryTEXT:SetText(WHITE..SHIT[AQ_CurrentSide])
    AQPageCount:SetText(AQ_CurrentSide.."/"..SHIT[1])
    -- hide button if no next side
    if (SHIT[SideAfterThis] == nil) then
      HideUIPanel(AQNextPageButton_Right);
    else
      ShowUIPanel(AQNextPageButton_Right);
    end
  end

  -- it is a boss text
  if (AQ_NextPageCount == "Boss" ) then
    QuestName:SetText(BLUE..getglobal("Inst"..AQINSTANZ.."General")[AQ_CurrentSide][1]);
    StoryTEXT:SetText(WHITE..getglobal("Inst"..AQINSTANZ.."General")[AQ_CurrentSide][2].."\n \n"..getglobal("Inst"..AQINSTANZ.."General")[AQ_CurrentSide][3]);
    -- Show Next side button if next site is avaiable
    if (getglobal("Inst"..AQINSTANZ.."General")[SideAfterThis] ~= nil) then
      ShowUIPanel(AQNextPageButton_Right);
    end
    -- shows total amount of pages
    AQPageCount:SetText(AQ_CurrentSide.."/"..getn(getglobal("Inst"..AQINSTANZ.."General")))
  end

  -- Show backwards button
  ShowUIPanel(AQNextPageButton_Left);
end


-----------------------------------------------------------------------------
-- shows the side before this side
-----------------------------------------------------------------------------
function AQNextPageL_OnClick()
local SHIT
  AQ_CurrentSide = AQ_CurrentSide - 1;

  -- it is a story text
  if (AQ_NextPageCount == "Story" ) then
    StoryTEXT:SetText(WHITE..getglobal("Inst"..AQINSTANZ.."Story")["Page"..AQ_CurrentSide]);
    AQPageCount:SetText(AQ_CurrentSide.."/"..getglobal("Inst"..AQINSTANZ.."Story")["MaxPages"])
    if (getglobal("Inst"..AQINSTANZ.."Caption"..AQ_CurrentSide) ~= nil) then
      QuestName:SetText(BLUE..getglobal("Inst"..AQINSTANZ.."Caption"..AQ_CurrentSide));
    else
      QuestName:SetText(BLUE..getglobal("Inst"..AQINSTANZ.."Caption"));
    end
    -- hide button if first side
    if (AQ_CurrentSide == 1) then
      HideUIPanel(AQNextPageButton_Left);
    end
  end

  -- it is a quest text 
  if (AQ_NextPageCount == "Quest" ) then
    -- SHIT is added to make the code smaller it give back the right link for horde or alliance
    if ( Allianceorhorde == 1) then --Alliance
      SHIT = getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_Page")
    else
      SHIT = getglobal("Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE_Page")
    end
    if (AQ_CurrentSide == 1) then
      AQButton_SetText()
    else
      StoryTEXT:SetText(WHITE..SHIT[AQ_CurrentSide])
    end
    AQPageCount:SetText(AQ_CurrentSide.."/"..SHIT[1])
  end
  
  -- it is a boss text
  if (AQ_NextPageCount == "Boss" ) then
    QuestName:SetText(BLUE..getglobal("Inst"..AQINSTANZ.."General")[AQ_CurrentSide][1]);
    StoryTEXT:SetText(WHITE..getglobal("Inst"..AQINSTANZ.."General")[AQ_CurrentSide][2].."\n \n"..getglobal("Inst"..AQINSTANZ.."General")[AQ_CurrentSide][3]);
    -- Show Next side button if next site is avaiable
    if (AQ_CurrentSide == 1) then
      HideUIPanel(AQNextPageButton_Left);
    end
    -- shows total amount of pages
    AQPageCount:SetText(AQ_CurrentSide.."/"..getn(getglobal("Inst"..AQINSTANZ.."General")))
  end

  ShowUIPanel(AQNextPageButton_Right);
end


-----------------------------------------------------------------------------
-- Checkbox for the finished quest option
-----------------------------------------------------------------------------
function AQFinishedQuest_OnClick()
  if (AQFinishedQuest:GetChecked() and Allianceorhorde == 1) then
    AQ[ "AQFinishedQuest_Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST ] = 1;
    setglobal("AQFinishedQuest_Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST , 1);
  elseif (AQFinishedQuest:GetChecked() and Allianceorhorde == 2) then
    AQ[ "AQFinishedQuest_Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE" ] = 1;
  elseif ((not AQFinishedQuest:GetChecked()) and (Allianceorhorde == 1)) then
    AQ[ "AQFinishedQuest_Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST ] = nil;
  elseif ((not AQFinishedQuest:GetChecked()) and (Allianceorhorde == 2)) then
    AQ[ "AQFinishedQuest_Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE" ] = nil;
  end
  --save everything
  if (Allianceorhorde == 1) then
    AtlasQuest_Options[UnitName("player")]["AQFinishedQuest_Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST] = AQ[ "AQFinishedQuest_Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST ]
  elseif (Allianceorhorde == 2) then
    AtlasQuest_Options[UnitName("player")]["AQFinishedQuest_Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE"] = AQ[ "AQFinishedQuest_Inst"..AQINSTANZ.."Quest"..AQSHOWNQUEST.."_HORDE" ]
  end

  AtlasQuestSetTextandButtons()
  AQButton_SetText()
end


-----------------------------------------------------------------------------
-- General Information for the Instance
-----------------------------------------------------------------------------
function AQGeneral_OnClick(arg1)
  -- first clear display
  AQClearALL();
  AQHideAL();
  if(AtlasQuestInsideFrame:IsVisible()) then
    HideUIPanel(AtlasQuestInsideFrame);
  else
    ShowUIPanel(AtlasQuestInsideFrame);
  end

  --
  if (getglobal("Inst"..AQINSTANZ.."General") ~= nil) then
    QuestName:SetText(BLUE..getglobal("Inst"..AQINSTANZ.."General")[1][1]);
    StoryTEXT:SetText(WHITE..getglobal("Inst"..AQINSTANZ.."General")[1][2].."\n \n"..getglobal("Inst"..AQINSTANZ.."General")[1][3]);
    -- Show Next side button if next site is avaiable
    AQ_NextPageCount = "Boss";
    if (getglobal("Inst"..AQINSTANZ.."General")[2] ~= nil) then
      ShowUIPanel(AQNextPageButton_Right);
      AQ_CurrentSide = 1;
      -- shows total amount of pages
      AQPageCount:SetText(AQ_CurrentSide.."/"..getn(getglobal("Inst"..AQINSTANZ.."General")))
    end
  end
end

