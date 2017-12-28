--[[

	MI2B: MobInfo2_Browser
	    Database Browser for the MobInfo2 AddOn
		copyright 2005 by Chester
		adopted and continued by Skeeve
]]

BINDING_HEADER_MI2BROWSER = "MobInfo 2 Browser";
BINDING_NAME_MI2BROWSER = "Open MobInfo 2 Browser";

MI2B_VERSION = " 1.21";
MI2B_TITLE = "MobInfo 2 Browser";
MI2B = {};
MI2B["lv"] = {
		[0] = "|cff7f7f7f",
		[1] = "|cff4ccc4c",
		[2] = "|cffffff00",
		[3] = "|cffff7f4c",
		[4] = "|cffff1919",
	};

function MI2B_AddMessage( text )
	if (not text) then
		return;	
	end
	if (MI2B_Data.debug) then
		if( not ChatFrame3.orgAddMessage ) then
			ChatFrame3:AddMessage(GREEN_FONT_COLOR_CODE..""..text.."");
		else
			ChatFrame3:orgAddMessage(GREEN_FONT_COLOR_CODE..""..text.."");
		end
	end
end


function MobInfo2_Browser_OnLoad()
	this:RegisterEvent("VARIABLES_LOADED");

	SLASH_MI2BROWSER1 = "/mi2b";
	SlashCmdList["MI2BROWSER"] = function(msg)
		MI2B_SlashCommand(msg);
	end

	tinsert(UISpecialFrames,"MI2B_BrowseFrame"); 
end


function MobInfo2_Browser_OnEvent()
	if( event == "VARIABLES_LOADED" ) then

		if( not MI2B_BrowseFrame.orgHide ) then
			MI2B_BrowseFrame.orgHide = MI2B_BrowseFrame.Hide;
			MI2B_BrowseFrame.Hide = MobInfo2_Browser_Hide;
		end
		if( DEFAULT_CHAT_FRAME ) then
			DEFAULT_CHAT_FRAME:AddMessage("|cffffd200"..MI2B_TITLE.." |cffffff00v"..MI2B_VERSION..MI2B_LOADED);
		end
		if (not MI2BSave) then
			MI2BSave = {};	
		end

	end

end


function MI2B_Main_OnShow()
	if (MI2BSave and MI2BSave.framepos_L and MI2BSave.framepos_T) then
		this:SetPoint("TOPLEFT", "UIParent", "BOTTOMLEFT", MI2BSave.framepos_L, MI2BSave.framepos_T);
	end
end


-- this function is called when the frame starts being dragged around
function MI2B_Main_OnMouseDown(arg1)
	if (arg1 == "LeftButton") then
		this:StartMoving();
	end
end


-- this function is called when the frame is stopped being dragged around
function MI2B_Main_OnMouseUp(arg1)
	if (arg1 == "LeftButton") then
		this:StopMovingOrSizing();
		
		-- save the position 
		MI2BSave.framepos_L = this:GetLeft();
		MI2BSave.framepos_T = this:GetTop();

	end
end


function MI2B_SlashCommand(msg)
	if( not msg or msg == "" ) then
		if (MI2B_BrowseFrame:IsVisible()) then
			MI2B_BrowseFrame:Hide();
		else
			MI2B_RefreshBrowseList();
		end
	end

end


function MI2B_GetDifficultyColor(level)
	local levelDiff = level - UnitLevel("player");
	local color, text;
	if ( levelDiff >= 5 ) then
		color = MI2B["lv"][4];
		--text = "Impossible";
	elseif ( levelDiff >= 3 ) then
		color = MI2B["lv"][3];
		--text = "Very Difficult";
	elseif ( levelDiff >= -2 ) then
		color = MI2B["lv"][2];
		--text = "Difficult";
	elseif ( -levelDiff <= GetQuestGreenRange() ) then
		color = MI2B["lv"][1];
		--text = "Standard";
	else
		color = MI2B["lv"][0];
		--text = "Trivial";
	end
	return color;
end


function MI2B_GetTimeOffset(t, format) --format can be minutes, hours or days

	if (not format) then
		format = "m";	
	end
	
	if (format == "m") then
		return t/60;
	elseif (format == "h") then
		return t/60/60;
	elseif (format == "d") then
		return t/24/60/60;
	end
end


--/script MI2B_RefreshBrowseList();
function MI2B_RefreshBrowseList()
	if (not MI2_DB_VERSION or not MobInfoDB) then
		DEFAULT_CHAT_FRAME:AddMessage(RED_FONT_COLOR_CODE..MI2B_TITLE..MI2B_NEEDS_DATA);
		UIErrorsFrame:AddMessage(MI2B_LOADERROR, 1.0, 0.1, 0.1, 1.0, UIERRORS_HOLD_TIME);
		PlaySound("igQuestCancel");	
	end

	ShowUIPanel(MI2B_BrowseFrame, 1);
	MI2BrowseTable = {};
	local iNew = 1;
	local mobDbSize = 0
	for index, value in MobInfoDB do
		local mobInfoB;
		local mobName, mobLevel = MI2_GetIndexComponents( index );
		local mobData = MI2_GetMobData( mobName, mobLevel )
		mobDbSize = mobDbSize + 1

		if(  MI2B_ListFilter_Search( index, mobData ) ) then
			MI2BrowseTable[iNew] = mobData;
			MI2BrowseTable[iNew].nm = mobName;
			MI2BrowseTable[iNew].lv = tonumber(mobLevel);
			local metaLoc = MI2B_MetaMapCheckLoc( index );
			if metaLoc then
				MI2BrowseTable[iNew]["loc"] = MI2BrowseTable[iNew].location;
			end
			iNew = iNew + 1;
		end
	end

	-- count and diplay size of MobInfo database and item database
	local itemDbSize = 0, 0;
	for index in MI2_ItemNameTable do  itemDbSize = itemDbSize + 1  end
	MI2B_TotalMobsTextValue:SetText( (mobDbSize-1) );
	MI2B_TotalMobTextValue:SetText( itemDbSize );

	--first sorts by last seen
	--table.sort(MI2BrowseTable, MI2B_LastSeenComparison);
	MI2BrowseTable.onePastEnd = iNew;
	MI2B_SortByLevel( 1 );
end


function MI2B_ScrollBar_Update()
	if (not MI2B_BrowseFrame:IsVisible()) then
		return;	
	end
	local line;
	local lineplusoffset;
	if (not MI2BrowseTable.onePastEnd) then
		MI2BrowseTable.onePastEnd = 20;	
	end
	FauxScrollFrame_Update(MI2B_ListScrollFrame,MI2BrowseTable.onePastEnd, 15, 12);
	-- 50 is max entries, 5 is number of lines, 16 is pixel height of each line

	for line=1, 20, 1 do
		lineplusoffset = line + FauxScrollFrame_GetOffset(MI2B_ListScrollFrame);
		if lineplusoffset < MI2BrowseTable.onePastEnd then
			local color = "";
			local healthMax = MI2BrowseTable[lineplusoffset].healthMax;
			if (not healthMax or healthMax == 100) then
				healthMax = "???";	
			end
			local xp = MI2BrowseTable[lineplusoffset].xp;
			if (not xp or xp == 0) then
				xp = "??";	
				MI2BrowseTable[lineplusoffset].xp = 0;
			end
			local kills = MI2BrowseTable[lineplusoffset].kills;
			if (not kills or kills == 0) then
				kills = "--";	
				MI2BrowseTable[lineplusoffset].kills = 0;
			end	
			--local minDamage = MI2BrowseTable[lineplusoffset].minDamage;
			--if (not minDamage or minDamage == 0) then
			--	minDamage = "?";
			--	MI2BrowseTable[lineplusoffset].minDamage = 0;
			--end	
			local maxDamage = MI2BrowseTable[lineplusoffset].maxDamage;
			if (not maxDamage or maxDamage == 0) then
				maxDamage = "?";
				MI2BrowseTable[lineplusoffset].maxDamage = 0;
			end
			local dps = MI2BrowseTable[lineplusoffset].dps;
			if (not dps or dps == 0) then
				dps = "??";	
				color = "|cff7f6600";
				MI2BrowseTable[lineplusoffset].dps = 0;
			end
			local loots = MI2BrowseTable[lineplusoffset].loots;
			--local emptyLoots = MI2BrowseTable[lineplusoffset].emptyLoots;
			--if (not emptyLoots and not loots) then
			--	emptyLoots = "";
			--elseif (not emptyLoots) then
			--	emptyLoots = "0";
			--end
			local clothCount = MI2BrowseTable[lineplusoffset].clothCount;
			if (MI2BrowseTable[lineplusoffset].clothCount and loots and loots ~= 0) then
				clothCount = ceil((clothCount/loots)*100).."%";
			end
			if (not clothCount or clothCount == 0) then
				clothCount = "";
				MI2BrowseTable[lineplusoffset].clothCount = 0;
			end

			local totalValue = MI2B_GetMobTotalValue( MI2BrowseTable[lineplusoffset] );
			--MI2BrowseTable[lineplusoffset].totalValue = totalValue;
			if (totalValue ~= 0) then
				totalValue = mifontWhite..copper2text(totalValue);
			else
				totalValue = mifontWhite.."0";
			end
			
			

			local mobType = MI2BrowseTable[lineplusoffset].mobType;
			if (not mobType or mobType <= 1) then
				mobType = "";
				MI2BrowseTable[lineplusoffset].mobType = 1;
			elseif (mobType == 2) then
				mobType = "+";
			else
				mobType = "++";
			end
			local info = MI2BrowseTable[lineplusoffset];
			local r2, r3, r4, r5 = "", "", "", "";
			if (loots and loots ~= 0) then
				--skip greys
				--if  info.r1  then
				--	r1 = mifontGray..info.r1.."("..ceil((info.r1/tonumber(loots))*100).."%) ";
				--end
				if  info.r2  then
					r2 = mifontWhite..ceil((info.r2/tonumber(loots))*100).."%";
				end
				if  info.r3  then
					r3 = mifontGreen..ceil((info.r3/tonumber(loots))*100).."%";
				end
				if  info.r4  then
					r4 = mifontBlue..ceil((info.r4/tonumber(loots))*100).."%";
				end
				if  info.r5  then
					r5 = mifontMageta..ceil((info.r5/tonumber(loots))*100).."%";
				end
			end
			local itemrarity = r2.." "..r3.." "..r4.." "..r5;

			--location
			local location = UNKNOWN;
			if (MI2_DB_VERSION and MI2_DB_VERSION >= 6 and (MI2BrowseTable[lineplusoffset].location)) then
				local mi2loc = MI2BrowseTable[lineplusoffset].location;
				local x = floor( (mi2loc.x1 + mi2loc.x2) / 2 )
				local y = floor( (mi2loc.y1 + mi2loc.y2) / 2 )
				if x and y and mi2loc.c and mi2loc.z then
					location = MI2_ZoneTable[mi2loc.c*100+mi2loc.z]
				end
			end

			getglobal("MI2B_List"..line.."Text"):SetText(color..MI2BrowseTable[lineplusoffset].nm);
			getglobal("MI2B_List"..line.."TextLV"):SetText(MI2BrowseTable[lineplusoffset].lv);
			getglobal("MI2B_List"..line.."TextXP"):SetText(xp);
			getglobal("MI2B_List"..line.."TextKL"):SetText(kills);
			getglobal("MI2B_List"..line.."TextHP"):SetText(healthMax);
			--getglobal("MI2B_List"..line.."TextMinD"):SetText(minDamage);
			getglobal("MI2B_List"..line.."TextMaxD"):SetText(maxDamage);
			getglobal("MI2B_List"..line.."TextDPS"):SetText(dps);

			getglobal("MI2B_List"..line.."TextLT"):SetText(loots);
			--getglobal("MI2B_List"..line.."TextELT"):SetText(emptyLoots);
			getglobal("MI2B_List"..line.."TextCTH"):SetText(clothCount);
			--getglobal("MI2B_List"..line.."TextCPR"):SetText(copper);
			getglobal("MI2B_List"..line.."TextMV"):SetText(totalValue);
			getglobal("MI2B_List"..line.."TextMT"):SetText(mobType);
			getglobal("MI2B_List"..line.."TextRARE"):SetText(itemrarity);
			getglobal("MI2B_List"..line.."TextLoc"):SetText(location);

			getglobal("MI2B_List"..line):Show();

		else
			getglobal("MI2B_List"..line):Hide();
		end
	end
	local found = table.getn(MI2BrowseTable);
	local s = "s";
	if (found == 1) then
		s = "";	
	end
	MI2B_TotalPlayersText:SetText(table.getn(MI2BrowseTable)..MI2B_MOB..s.." "..MI2B_FOUND);
end


function MI2B_GetMobTotalValue( table )
	local copper = table.copper;
	local copperAvg;
	local loots = table.loots
	if (copper and copper ~= 0 and loots and loots ~= 0) then
		copperAvg = ceil( copper / loots );
		--copper = (copper2text(copperAvg));
	else 
		copper = 0;
		table.copper = 0;
	end
	if (not loots) then
		loots = 0;
		table.loots = 0;
	end
	local itemValue = table.itemValue;
	local itemValueAvg;
	if (itemValue and itemValue ~= 0 and loots ~= 0) then
		itemValueAvg = ceil( itemValue / loots );
	else
		itemValue = 0;	
		table.itemValue = 0;
	end
	local totalValue = (copperAvg or 0) + (itemValueAvg or 0);
	return totalValue;
end

function MI2B_ListButton_OnClick(arg1)
	--if ( IsControlKeyDown() ) then
		--local name = getglobal(this:GetName().."Text"):GetText();
		--MI2B_BuildTipFromData(name);
		--MI2B.ctrl = 1;
		--MI2B.name = name;
		--SendWho("n-"..name);		
		--return;
	--end
	MI2B.browseropen = 1;
	MI2B_OpenLocationMap();
end

--If MetapMap has loc info, grab it from them
function MI2B_MetaMapCheckLoc( index )
	return nil
end


function MI2B_ListFilter_Search( index, mobData )
	if (string.find(index, "Database.+") or string.find(index, "Locations.+")) then
		return;
	end
	if (not MI2B_ListFilter_PerCharacterCheck( index, mobData )) then
		return;
	end
	if (not MI2B_ListFilter_SearchName( index, mobData )) then
		return;
	end
	if (not MI2B_ListFilter_SearchLevel( index, mobData )) then
		return;
	end
	if (not MI2B_ListFilter_SearchXP( index, mobData )) then
		return;
	end
	if (not MI2B_ListFilter_SearchKills( index, mobData )) then
		return;
	end
	if (not MI2B_ListFilter_SearchMobValue( index, mobData )) then
		return;
	end
	if (not MI2B_ListFilter_SearchItemName( index, mobData )) then
		return;
	end
	if (not MI2B_ListFilter_SearchLocation( index, mobData )) then
		return;
	end

	--[[if (not MI2B_BrowseName or not MI2B_BrowseName:IsVisible() or MI2B_BrowseName:GetText() == "") then
		--default search is < 4 days old
		if(  MI2B_ListFilter_SearchDate( MI2B_Data[MI2B_REALM][index]["dt"], 4, "d" ) ) then
			return 1;
		end	
		return;
	end]]
	--DEFAULT_CHAT_FRAME:AddMessage("--passed");
	return 1;
end


function MI2B_ListFilter_PerCharacterCheck( index, mobData )
	if (not MI2BSave.perchar or MI2BSave.perchar == 0) then
		return 1;	
	end
	if (not mobData or not tonumber(mobData.dps) or tonumber(mobData.dps) <= 0) then
		return;	
	end
	return 1;
end


function MI2B_ListFilter_SearchName( index, mobData )
	if (not MI2B_BrowseName or not MI2B_BrowseName:IsVisible() or MI2B_BrowseName:GetText() == "") then
		return 1;
	end
	local carrot = "";
	if (string.find(MI2B_BrowseName:GetText(), "^%u")) then
		carrot = "^";
	end
	if (string.find(strupper(index), carrot..strupper(MI2B_BrowseName:GetText()))) then
		return 1;
	end
end


function MI2B_ListFilter_SearchLevel( index, mobData )
	local min = MI2B_BrowseMinLevel:GetText();
	local max = MI2B_BrowseMaxLevel:GetText();
	if (not MI2B_BrowseMinLevel or not MI2B_BrowseMinLevel:IsVisible() or min == "") then
		if (not MI2B_BrowseMaxLevel or not MI2B_BrowseMaxLevel:IsVisible() or max == "") then
			return 1;
		end
	end
	local _, mobLevel = MI2_GetIndexComponents( index );
	if (not mobLevel) then
		return;	
	end
	if (min and min ~= "") then
		if (mobLevel < tonumber(min)) then
			return;	
		end	
	end
	if (max and max ~= "") then
		if (mobLevel > tonumber(max)) then
			return;	
		end	
	end
	return 1;
end


function MI2B_ListFilter_SearchXP( index, mobData )
	local xP = MI2B_BrowseXP:GetText();
	if (not MI2B_BrowseXP or not MI2B_BrowseXP:IsVisible() or xP == "") then
		--DEFAULT_CHAT_FRAME:AddMessage("returning on xp");
		return 1;
	end
	if (not tonumber(mobData.xp) or tonumber(mobData.xp) < tonumber(xP)) then
		return;	
	end
	return 1;
end


function MI2B_ListFilter_SearchKills( index, mobData )
	local kill = MI2B_BrowseKills:GetText();
	if (not MI2B_BrowseKills or not MI2B_BrowseKills:IsVisible() or kill == "") then
		--DEFAULT_CHAT_FRAME:AddMessage("returning on kills");
		return 1;
	end
	if (not tonumber(mobData.kills) or tonumber(mobData.kills) < tonumber(kill)) then
		return;	
	end
	return 1;
end


function MI2B_ListFilter_SearchMobValue( index, mobData )
	--if (not MI2B_BrowseMobValueG or not MI2B_BrowseMobValueG:IsVisible()) then
	--	return 1;
	--end
	local gl = MI2B_BrowseMobValueG:GetText();
	local sv = MI2B_BrowseMobValueS:GetText();
	local cp = MI2B_BrowseMobValueC:GetText();
	if (not gl or gl == "" or gl == 0) then
		gl = 0;
	else
		gl = 10000*tonumber(gl);
	end
	if (not sv or sv == "" or sv == 0) then
		sv = 0;
	else
		sv = 100*tonumber(sv);
	end
	if (not cp or cp == "" or cp == 0) then
		cp = 0;
	else
		tonumber(cp);
	end
	local searchLoot = gl+sv+cp;
	if (searchLoot == 0) then
		return 1;
	end

	local totalValue = MI2B_GetMobTotalValue( mobData );
	--DEFAULT_CHAT_FRAME:AddMessage(totalValue.." - "..searchLoot);
	if (totalValue < searchLoot) then
		return;
	end
	return 1;
end


function MI2B_ListFilter_SearchItemName( index, mobData )
	if (not MI2B_BrowseItemName or not MI2B_BrowseItemName:IsVisible() or MI2B_BrowseItemName:GetText() == "") then
		return 1;
	end

	local carrot = "";
	if (string.find(MI2B_BrowseItemName:GetText(), "^%u")) then
		carrot = "^";
	end
	if (not mobData.itemList) then
		return;	
	end

	for itemID, amount in mobData.itemList do
		local itemText = MI2_GetLootItemString(itemID)

		if (itemText and string.find(strupper(itemText), carrot..strupper(MI2B_BrowseItemName:GetText()))) then
			return 1;	
		end
	end
end


function MI2B_ListFilter_SearchLocation( index, mobData )
	local searchText = MI2B_BrowseLocation:GetText()
	if not searchText or searchText == "" then return 1 end

	local mobZone
	local mobLoc = mobData.location
	if mobLoc then
		mobZone = mobLoc.n
	else
		mobZone = UNKNOWN
	end

	if string.find(strupper(mobZone),strupper(searchText)) then
		return 1
	end
end


function MI2B_GenericComparison(elem1, elem2, v)
	--DEFAULT_CHAT_FRAME:AddMessage(elem1[v]);
	local v1 = elem1[v];
	local v2 = elem2[v];
	if( v1 == v2 ) then
		return elem1.nm < elem2.nm;
	end
	if( not v1 ) then
		return 1;
	end
	if( not v2 ) then
		return nil;
	end
	if (not MI2B["sort"]) then
		MI2B["sort"] = {};	
	end
	if( tonumber(v1) and tonumber(v2) ) then
		if (not MI2B["sort"][v]) then
			--DEFAULT_CHAT_FRAME:AddMessage("# "..elem1.nm..v1.."<"..elem2.nm..v2);
			return tonumber(v1) < tonumber(v2);
		else
			--DEFAULT_CHAT_FRAME:AddMessage("# "..elem1.nm..v1..">"..elem2.nm..v2);
			return tonumber(v1) > tonumber(v2);
		end
	end
	if (not MI2B["sort"][v]) then
		--DEFAULT_CHAT_FRAME:AddMessage("# "..elem1.nm..v1.."<"..elem2.nm..v2);
		return v1 < v2;
	else
		--DEFAULT_CHAT_FRAME:AddMessage("# "..elem1.nm..v1..">"..elem2.nm..v2);
		return v1 > v2;
	end
end

function MI2B_DateComparison(elem1, elem2)
	local v;
	
	if( elem1 and elem1.dt and elem2 and elem2.dt ) then
		v = "dt";
	end
	return MI2B_GenericComparison(elem1, elem2, v);
end

function MI2B_NameComparison(elem1, elem2)
	local v;
	
	if( elem1 and elem1.nm and elem2 and elem2.nm ) then
		v = "nm";
	end
	
	return MI2B_GenericComparison(elem1, elem2, v);
end

function MI2B_LevelComparison(elem1, elem2)
	local v;
	
	if( elem1 and elem1.lv and elem2 and elem2.lv ) then
		v = "lv";
	end
	
	return MI2B_GenericComparison(elem1, elem2, v);
end

function MI2B_XPComparison(elem1, elem2)
	local v;
	
	if( elem1 and elem1.xp and elem2 and elem2.xp ) then
		v = "xp";
	end
	
	return MI2B_GenericComparison(elem1, elem2, v);
end

function MI2B_KillsComparison(elem1, elem2)
	local v;
	
	if( elem1 and elem1.kills and elem2 and elem2.kills ) then
		v = "kills";
	end
	
	return MI2B_GenericComparison(elem1, elem2, v);
end

function MI2B_MaxHPComparison(elem1, elem2)
	local v;
	
	if( elem1 and elem1.healthMax and elem2 and elem2.healthMax ) then
		v = "healthMax";
	end
	
	return MI2B_GenericComparison(elem1, elem2, v);
end

function MI2B_MinDComparison(elem1, elem2)
	local v;
	
	if( elem1 and elem1.minDamage and elem2 and elem2.minDamage ) then
		v = "minDamage";
	end
	
	return MI2B_GenericComparison(elem1, elem2, v);
end

function MI2B_MaxDComparison(elem1, elem2)
	local v;
	
	if( elem1 and elem1.maxDamage and elem2 and elem2.maxDamage ) then
		v = "maxDamage";
	end
	
	return MI2B_GenericComparison(elem1, elem2, v);
end

function MI2B_DPSComparison(elem1, elem2)
	local v;
	
	if( elem1 and elem1.dps and elem2 and elem2.dps ) then
		v = "dps";
	end
	
	return MI2B_GenericComparison(elem1, elem2, v);
end

function MI2B_LootsComparison(elem1, elem2)
	local v;
	
	if( elem1 and elem1.loots and elem2 and elem2.loots ) then
		v = "loots";
	end
	
	return MI2B_GenericComparison(elem1, elem2, v);
end

--custom sort funtion because we are looking for percentages
function MI2B_ClothComparison(elem1, elem2)
	local v;
	
	if( elem1 and elem1.clothCount and elem2 and elem2.clothCount ) then
		v = "clothCount";
	end
	--DEFAULT_CHAT_FRAME:AddMessage(elem1[v]);
	local v1, v2;
	if (v and elem1.loots and elem2.loots) then
		--clothCount = ceil((clothCount/loots)*100).."%";
		v1 = ceil((elem1.clothCount/elem1.loots)*100);
		v2 = ceil((elem2.clothCount/elem2.loots)*100);
	end

	if( v1 == v2 ) then
		return elem1.nm < elem2.nm;
	end
	if( not v1 ) then
		return 1;
	end
	if( not v2 ) then
		return nil;
	end
	if (not MI2B["sort"]) then
		MI2B["sort"] = {};	
	end
	if( tonumber(v1) and tonumber(v2) ) then
		if (not MI2B["sort"][v]) then
			--DEFAULT_CHAT_FRAME:AddMessage("#< "..elem1[v]);
			return tonumber(v1) < tonumber(v2);
		else
			--DEFAULT_CHAT_FRAME:AddMessage("#> "..elem1[v]);
			return tonumber(v1) > tonumber(v2);
		end
	end
	if (not MI2B["sort"][v]) then
		--DEFAULT_CHAT_FRAME:AddMessage("< "..elem1[v]);
		return v1 < v2;
	else
		--DEFAULT_CHAT_FRAME:AddMessage("> "..elem1[v]);
		return v1 > v2;
	end
end

function MI2B_CopperComparison(elem1, elem2)
	local v;
	
	if( elem1 and elem1.copper and elem2 and elem2.copper ) then
		v = "copper";
	end
	
	return MI2B_GenericComparison(elem1, elem2, v);
end

function MI2B_MobValueComparison(elem1, elem2)
	local v;
	if (elem1 and elem1.totalValue and elem2 and elem2.totalValue) then
		v = "totalValue";
	--elseif( elem1 and elem1.itemValue and elem2 and elem2.itemValue ) then
	--	v = "itemValue";
	end
	
	local v1 = MI2B_GetMobTotalValue( elem1 );
	local v2 = MI2B_GetMobTotalValue( elem2 );
	--MI2BrowseTable[lineplusoffset].totalValue = totalValue;

	if( v1 == v2 ) then
		return elem1.nm < elem2.nm;
	end
	if( not v1 ) then
		return 1;
	end
	if( not v2 ) then
		return nil;
	end
	if (not MI2B["sort"]) then
		MI2B["sort"] = {};	
	end
	if( tonumber(v1) and tonumber(v2) ) then
		if (not MI2B["sort"][v]) then
			--DEFAULT_CHAT_FRAME:AddMessage("# "..elem1.nm..v1.."<"..elem2.nm..v2);
			return tonumber(v1) < tonumber(v2);
		else
			--DEFAULT_CHAT_FRAME:AddMessage("# "..elem1.nm..v1..">"..elem2.nm..v2);
			return tonumber(v1) > tonumber(v2);
		end
	end
	if (not MI2B["sort"][v]) then
		--DEFAULT_CHAT_FRAME:AddMessage("# "..elem1.nm..v1.."<"..elem2.nm..v2);
		return v1 < v2;
	else
		--DEFAULT_CHAT_FRAME:AddMessage("# "..elem1.nm..v1..">"..elem2.nm..v2);
		return v1 > v2;
	end
end

function MI2B_MobTypeComparison(elem1, elem2)
	local v;
	
	if( elem1 and elem1.mobType and elem2 and elem2.mobType ) then
		v = "mobType";
	end
	
	return MI2B_GenericComparison(elem1, elem2, v);
end

--custom compare function because we're adding up the item totals
function MI2B_ItemRarityComparison(elem1, elem2)
	local v;
	if( elem1 and elem2 ) then
		v = "r1";
	end
	
	local v1, v2;
	--don't count greys
	--local r1_1 = elem1.r1;
	--if (not r1_1) then	r1_1 = 0;	end
	--r5 = mifontMageta..info.r5.."("..ceil((info.r5/tonumber(loots))*100).."%) ";
	local r2_1 = tonumber(elem1.r2);
	if (not r2_1 or r2_1 < 0) then	r2_1 = 0;	end
	local r3_1 = tonumber(elem1.r3);
	if (not r3_1 or r3_1 < 0) then	r3_1 = 0;	end
	local r4_1 = tonumber(elem1.r4);
	if (not r4_1 or r4_1 < 0) then	r4_1 = 0;	end
	local r5_1 = tonumber(elem1.r5);
	if (not r5_1 or r5_1 < 0) then	r5_1 = 0;	end
	if (elem1.loots and elem1.loots ~= 0) then
		--clothCount = ceil((clothCount/loots)*100).."%";
		r2_1 = r2_1/elem1.loots;
		r3_1 = (r3_1/elem1.loots)*1;
		r4_1 = (r4_1/elem1.loots)*2;
		r5_1 = (r5_1/elem1.loots)*3;
		v1 = r2_1+r3_1+r4_1+r5_1;
	else
		v1 = 0;
	end

	--local r1_2 = elem2.r1;
	--if (not r1_2) then	r1_2 = 0;	end
	local r2_2 = tonumber(elem2.r2);
	if (not r2_2 or r2_2 < 0) then	r2_2 = 0;	end
	local r3_2 = tonumber(elem2.r3);
	if (not r3_2 or r3_2 < 0) then	r3_2 = 0;	end
	local r4_2 = tonumber(elem2.r4);
	if (not r4_2 or r4_2 < 0) then	r4_2 = 0;	end
	local r5_2 = tonumber(elem2.r5);
	if (not r5_2 or r5_2 < 0) then	r5_2 = 0;	end
	if (elem2.loots and elem2.loots ~= 0) then
		--clothCount = ceil((clothCount/loots)*100).."%";
		r2_2 = r2_2/elem2.loots;
		r3_2 = (r3_2/elem2.loots)*1;
		r4_2 = (r4_2/elem2.loots)*2;
		r5_2 = (r5_2/elem2.loots)*3;
		v2 = r2_2+r3_2+r4_2+r5_2;
	else
		v2 = 0;
	end
	
	if( v1 == v2 ) then
		return elem1.nm < elem2.nm;
	end
	if( not v1 ) then
		return 1;
	end
	if( not v2 ) then
		return nil;
	end
	if (not MI2B["sort"]) then
		MI2B["sort"] = {};	
	end
	if( tonumber(v1) and tonumber(v2) ) then
		if (not MI2B["sort"][v]) then
			--DEFAULT_CHAT_FRAME:AddMessage("# "..elem1.nm..v1.."<"..elem2.nm..v2);
			return tonumber(v1) < tonumber(v2);
		else
			--DEFAULT_CHAT_FRAME:AddMessage("# "..elem1.nm..v1..">"..elem2.nm..v2);
			return tonumber(v1) > tonumber(v2);
		end
	end
	if (not MI2B["sort"][v]) then
		--DEFAULT_CHAT_FRAME:AddMessage("# "..elem1.nm..v1.."<"..elem2.nm..v2);
		return v1 < v2;
	else
		--DEFAULT_CHAT_FRAME:AddMessage("# "..elem1.nm..v1..">"..elem2.nm..v2);
		return v1 > v2;
	end
end

function MI2B_LocComparison(elem1, elem2)
	local v = "loc";
	
	local location, v1, v2;	

	if (MI2_DB_VERSION and MI2_DB_VERSION >= 6) then
		if( elem1 and elem1.location) then
			local mi2Loc = elem1.location;
			if mi2Loc.c and mi2Loc.z and (MI2_Zones[mi2Loc.c][mi2Loc.z]) then
				--DEFAULT_CHAT_FRAME:AddMessage(cont1..": "..zone1.." : "..MI2B_Maps[cont1][zone1]);
				v1 = MI2_Zones[mi2Loc.c][mi2Loc.z];
			else
				v1 = "zz";
			end
		else
			v1 = "zz";
		end
		if( elem2 and elem2.location) then
			local mi2Loc = elem2.location;
			if mi2Loc.c and mi2Loc.z and (MI2_Zones[mi2Loc.c][mi2Loc.z]) then
				--DEFAULT_CHAT_FRAME:AddMessage(cont1..": "..zone1.." : "..MI2B_Maps[cont1][zone1]);
				v2 = MI2_Zones[mi2Loc.c][mi2Loc.z];	
			else
				v2 = "zz";
			end
		else
			v2 = "zz";
		end
--[[
	local x = floor( (location.x1 + location.x2) / 2 )
	local y = floor( (location.y1 + location.y2) / 2 )
	GameTooltip:AddLine( mifontGold..MI_TXT_LOCATION..mifontWhite..MI2_Zones[location.c][location.z].." ("..x.."/"..y..")" )
]]
	else
		if( elem1 and elem1["loc"] and elem1["loc"].l ) then

			--DEFAULT_CHAT_FRAME:AddMessage(MI2BrowseTable[lineplusoffset]["loc"].l);
			local _, _, cont1, zone1 = string.find((tostring(elem1["loc"].l)), MI2B_LOCPATTERN);

			cont1 = tonumber(cont1);
			zone1 = tonumber(zone1);
			if (cont1 and zone1 and zone1 < 30) then
				--DEFAULT_CHAT_FRAME:AddMessage(cont1..": "..zone1.." : "..MI2B_Maps[cont1][zone1]);
				v1 = MI2B_Maps[cont1][zone1];	
			else
				v1 = "zz";
			end
		else
			v1 = "zz";
		end
		if( elem2 and elem2["loc"] and elem2["loc"].l ) then
			local _, _, cont2, zone2 = string.find((tostring(elem2["loc"].l)), MI2B_LOCPATTERN);

			cont2 = tonumber(cont2);
			zone2 = tonumber(zone2);
			if (cont2 and zone2 and zone2 < 30) then
				--DEFAULT_CHAT_FRAME:AddMessage(cont2..": "..zone2.." : "..MI2B_Maps[cont2][zone2]);
				v2 = MI2B_Maps[cont2][zone2];	
			else
				v2 = "zz";
			end
		else
			v2 = "zz";
		end
	end

	if( v1 == v2 ) then
		--DEFAULT_CHAT_FRAME:AddMessage("~name");
		return elem1.nm < elem2.nm;
	end
	if( not v1 ) then
		--DEFAULT_CHAT_FRAME:AddMessage("~no v1");
		return 1;
	end
	if( not v2 ) then
		--DEFAULT_CHAT_FRAME:AddMessage("~no v2");
		return nil;
	end
	if (not MI2B["sort"]) then
		MI2B["sort"] = {};	
	end
	if (not MI2B["sort"][v]) then
		--DEFAULT_CHAT_FRAME:AddMessage("# "..elem1.nm..v1.."<"..elem2.nm..v2);
		return v1 < v2;
	else
		--DEFAULT_CHAT_FRAME:AddMessage("# "..elem1.nm..v1..">"..elem2.nm..v2);
		return v1 > v2;
	end
end

--    mobData.xp         :  experience value
--    mobData.kills      :  number of times current player has killed this mob
--    mobData.healthMax  :  health maximum
--    mobData.minDamage  :  minimum damage done by mob
--    mobData.maxDamage  :  maximum damage done by mob
--    mobData.dps        :  dps of Mon against current player
--    mobData.loots      :  number of times this mob has been looted
--    mobData.emptyLoots :  number of times this mob gave empty loot
--    mobData.clothCount :  number of times this mob gave cloth loot
--    mobData.copper     :  total money loot of this mob as copper amount
--    mobData.itemValue  :  total item value loot of this mob as copper amount
--    mobData.mobType    :  mob type for special mobs: 1=normal, 2=rare/elite, 3=boss
--    mobData.r1         :  number of rarity 1 loot items (grey)
--    mobData.r2         :  number of rarity 2 loot items (white)
--    mobData.r3         :  number of rarity 3 loot items (green)
--    mobData.r4         :  number of rarity 4 loot items (blue)
--    mobData.r5         :  number of rarity 5 loot items (purple)

function MI2B_SortByName( noflip )
	MI2B_SortToggleOperator("nm", noflip);
	table.sort(MI2BrowseTable, MI2B_NameComparison);
	ShowUIPanel(MI2B_BrowseFrame, 1);
	MI2B_ScrollBar_Update();
end

function MI2B_SortByLevel( noflip )
	MI2B_SortToggleOperator("lv", noflip);
	table.sort(MI2BrowseTable, MI2B_LevelComparison);
	ShowUIPanel(MI2B_BrowseFrame, 1);
	MI2B_ScrollBar_Update();
end

function MI2B_SortByXP( noflip )
	MI2B_SortToggleOperator("xp", noflip);
	table.sort(MI2BrowseTable, MI2B_XPComparison);
	ShowUIPanel(MI2B_BrowseFrame, 1);
	MI2B_ScrollBar_Update();
end

function MI2B_SortByKills( noflip )
	MI2B_SortToggleOperator("kills", noflip);
	table.sort(MI2BrowseTable, MI2B_KillsComparison);
	ShowUIPanel(MI2B_BrowseFrame, 1);
	MI2B_ScrollBar_Update();
end

function MI2B_SortByMaxHP( noflip )
	MI2B_SortToggleOperator("healthMax", noflip);
	table.sort(MI2BrowseTable, MI2B_MaxHPComparison);
	ShowUIPanel(MI2B_BrowseFrame, 1);
	MI2B_ScrollBar_Update();
end

function MI2B_SortByMinD( noflip )
	MI2B_SortToggleOperator("minDamage", noflip);
	table.sort(MI2BrowseTable, MI2B_MinDComparison);
	ShowUIPanel(MI2B_BrowseFrame, 1);
	MI2B_ScrollBar_Update();
end

function MI2B_SortByMaxD( noflip )
	MI2B_SortToggleOperator("maxDamage", noflip);
	table.sort(MI2BrowseTable, MI2B_MaxDComparison);
	ShowUIPanel(MI2B_BrowseFrame, 1);
	MI2B_ScrollBar_Update();
end

function MI2B_SortByDPS( noflip )
	MI2B_SortToggleOperator("dps", noflip);
	table.sort(MI2BrowseTable, MI2B_DPSComparison);
	ShowUIPanel(MI2B_BrowseFrame, 1);
	MI2B_ScrollBar_Update();
end

function MI2B_SortByLoots( noflip )
	MI2B_SortToggleOperator("loots", noflip);
	table.sort(MI2BrowseTable, MI2B_LootsComparison);
	ShowUIPanel(MI2B_BrowseFrame, 1);
	MI2B_ScrollBar_Update();
end

function MI2B_SortByCloth( noflip )
	MI2B_SortToggleOperator("clothCount", noflip);
	table.sort(MI2BrowseTable, MI2B_ClothComparison);
	ShowUIPanel(MI2B_BrowseFrame, 1);
	MI2B_ScrollBar_Update();
end

function MI2B_SortByCopper( noflip )
	MI2B_SortToggleOperator("copper", noflip);
	table.sort(MI2BrowseTable, MI2B_CopperComparison);
	ShowUIPanel(MI2B_BrowseFrame, 1);
	MI2B_ScrollBar_Update();
end

function MI2B_SortByMobValue( noflip )
	MI2B_SortToggleOperator("totalValue", noflip);
	table.sort(MI2BrowseTable, MI2B_MobValueComparison);
	ShowUIPanel(MI2B_BrowseFrame, 1);
	MI2B_ScrollBar_Update();
end

function MI2B_SortByMobType( noflip )
	MI2B_SortToggleOperator("mobType", noflip);
	table.sort(MI2BrowseTable, MI2B_MobTypeComparison);
	ShowUIPanel(MI2B_BrowseFrame, 1);
	MI2B_ScrollBar_Update();
end

function MI2B_SortByItemRarity( noflip )
	MI2B_SortToggleOperator("r1", noflip);
	table.sort(MI2BrowseTable, MI2B_ItemRarityComparison);
	ShowUIPanel(MI2B_BrowseFrame, 1);
	MI2B_ScrollBar_Update();
end

function MI2B_SortByLocation( noflip )
	MI2B_SortToggleOperator("loc", noflip);
	table.sort(MI2BrowseTable, MI2B_LocComparison);	
	ShowUIPanel(MI2B_BrowseFrame, 1);
	MI2B_ScrollBar_Update();
end


function MI2B_SortToggleOperator(v, noflip)
	if (noflip) then
		return;	
	end
	--DEFAULT_CHAT_FRAME:AddMessage("flipping!!!!");
	if (not MI2B["sort"]) then
		MI2B["sort"] = {};
	end
	if (not MI2B["sort"][v]) then
		MI2B["sort"][v] = 1;
	else
		MI2B["sort"][v] = nil;
	end
end


-----------------------------------------------------------------------------
-- MI2B_CreateBrowseTooltip()
-----------------------------------------------------------------------------
function MI2B_CreateBrowseTooltip(mobDataB, tooltip)
	local mobName, mobLevel = mobDataB.nm, mobDataB.lv
	local mobCaption = mobName.."  L"..mobLevel

	if mobDataB.mobType and mobDataB.mobType > 1 then
		mobCaption = mobCaption.."+"
	end

	-- create Mob data tooltip with full location info
	GameTooltip_SetDefaultAnchor( GameTooltip, UIParent )
	GameTooltip:SetText( mobCaption )
	MI2_BuildMobInfoTooltip( mobName, mobLevel, 1 )
	GameTooltip:Show()
end


function MI2B_OpenLocationMap()
	local index = this:GetID() + FauxScrollFrame_GetOffset(MI2B_ListScrollFrame);
	local mobData = MI2BrowseTable[index];
	if not mobData or not mobData.location then return end

	local x, y, cont, zone;
	local mi2Loc = mobData.location
	cont = mi2Loc.c;
	zone = mi2Loc.z;
	x = floor( (mi2Loc.x1 + mi2Loc.x2) / 2 ) * 0.01;
	y = floor( (mi2Loc.y1 + mi2Loc.y2) / 2 ) * 0.01;
	
	ShowUIPanel(WorldMapFrame);
	if cont and zone then
		SetMapZoom(cont, zone);
	end

	x = x * WorldMapDetailFrame:GetWidth();
	y = -y * WorldMapDetailFrame:GetHeight();
	MI2B_MobLocationIcon:SetPoint("CENTER", "WorldMapDetailFrame", "TOPLEFT", x, y);
	MI2B_MobLocationIconText:SetText(mobData.nm.."\n"..LEVEL.." "..mobData.lv);
	MI2B_MobLocationIcon:Show();
end


function MI2B_MobLocationIcon_OnEvent()
	if (event == "WORLD_MAP_UPDATE") then
		if (WorldMapFrame:IsVisible()) then
			local mapContinent = GetCurrentMapContinent();
			local mapZone = GetCurrentMapZone();
			if (this["info"] and this["info"].cont == mapContinent and this["info"].zone == mapZone) then
				local x, y = this["info"]["loc"].x, this["info"]["loc"].y;
				x = x * WorldMapDetailFrame:GetWidth();
				y = -y * WorldMapDetailFrame:GetHeight();
				this:SetPoint("CENTER", "WorldMapDetailFrame", "TOPLEFT", x, y);
				getglobal(this:GetName().."Text"):SetText(this["info"].nm.."\n"..LEVEL.." "..this["info"].lv);
				this:Show();	
			--DEFAULT_CHAT_FRAME:AddMessage("mycont: "..this["info"].cont.." zone: "..this["info"].zone.."  :  ".."cont: "..mapContinent.." zone: "..mapZone);

			else
				this:Hide();
			end
		else
			--this:Hide();
			this["info"] = {};
		end
	end

end


--[[
--special code to show the Browser after the map is closed if the map was opened by the browser
--the special code here is due to metamap making the WorldMapFrame the 'center' frame which 
--runs different closing code than if it were a 'full' screen frame
--hook
local originalHideUIPanel;
originalHideUIPanel = HideUIPanel;
function HideUIPanel(frame)
	if ( not frame ) then
		return;
	end
	local centerFrame = GetCenterFrame();

	-- If we're hiding the full-screen frame, just hide it
	if ( frame:GetName() == "WorldMapFrame" ) then
		if (MI2B.browseropen) then
			MI2B_RefreshBrowseList();
			if (centerFrame and centerFrame:GetName() == "WorldMapFrame") then
				MI2B.mapclosed = 1;
			end
			--ShowUIPanel(MI2B_BrowseFrame, 1);	
		end
	end
	originalHideUIPanel(frame);
end
]]
function MobInfo2_Browser_Hide()
	if (MI2B.browseropen and MI2B.mapclosed) then
		MI2B.browseropen = nil;	
		MI2B.mapclosed = nil;
		return;
	end	
	MI2B_BrowseFrame:orgHide();
end

--hook options frame so the button shows up
local orgMI2_OptionsFrameOnShow;
orgMI2_OptionsFrameOnShow = MI2_OptionsFrameOnShow;
function MI2_OptionsFrameOnShow()
	orgMI2_OptionsFrameOnShow();
	MI2B_OpenBrowserButton:SetPoint("BOTTOMRIGHT", "MI2_MainOptionsFrame", "BOTTOMRIGHT", -8, -30);
	MI2B_OpenBrowserButton:Show();

end
