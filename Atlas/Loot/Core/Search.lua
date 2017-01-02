local GREY = "|cff999999";
local RED = "|cffff0000";
local WHITE = "|cffFFFFFF";
local GREEN = "|cff1eff00";
local PURPLE = "|cff9F3FFF";
local BLUE = "|cff0070dd";
local ORANGE = "|cffFF8400";

local AL = AceLibrary("AceLocale-2.2"):new("AtlasLoot");
local currentPage = 1;
local SearchResult = nil;

function AtlasLoot:ShowSearchResult()
	AtlasLoot_ShowItemsFrame("SearchResult", "SearchResultPage"..currentPage, string.format((AL["Search Result: %s"]), AtlasLootCharDB.LastSearchedText or ""), pFrame);
end

function AtlasLoot:Search(Text)
	if not Text then return end
	Text = strtrim(Text);
	if Text == "" then return end
	local text = string.lower(Text);
	local search = function(dataSource)
		if dataSource == "AtlasLootFallback" then return end
		local partial = AtlasLootCharDB.PartialMatching;
		for dataID, data in pairs(AtlasLoot_Data[dataSource]) do
			for _, v in ipairs(data) do
				if type(v[1]) == "number" and v[1] > 0 then
					local itemName = GetItemInfo(v[1]);
					if not itemName then itemName = gsub(v[3], "=q%d=", "") end
					local found;
					if partial then
						found = string.find(string.lower(itemName), text);
					else
						found = string.lower(itemName) == text;
					end
					if found then
						local _, _, quality = string.find(v[3], "=q(%d)=");
						if quality then itemName = "=q"..quality.."="..itemName end
						table.insert(AtlasLootCharDB["SearchResult"], { v[1], v[2], itemName, v[4], dataID.."|"..dataSource });
					end
				elseif (v[1] ~= nil) and (v[1] ~= "") and (string.sub(v[1], 1, 1) == "s") then 
					local spellName
					if not spellName then
						if (string.sub(v[3], 1, 2) == "=d") then  
							spellName = gsub(v[3], "=ds=", "");
						else
							spellName = gsub(v[3], "=q%d=", ""); 
						end
					end
					local found;
					if partial then
						found = string.find(string.lower(spellName), text);
					else
						found = string.lower(spellName) == text;
					end
					if found then
						spellName = string.sub(v[3], 1, 4)..spellName;
						table.insert(AtlasLootCharDB["SearchResult"], { v[1], v[2], spellName, v[4], dataID.."|"..dataSource });
					end
				elseif (v[1] ~= nil) and (v[1] ~= "") and (string.sub(v[1], 1, 1) == "e") then 
					local spellName
					if not spellName then
						if (string.sub(v[3], 1, 2) == "=d") then  
							spellName = gsub(v[3], "=ds=", "");
						else
							spellName = gsub(v[3], "=q%d=", ""); 
						end
					end
					local found;
					if partial then
						found = string.find(string.lower(spellName), text);
					else
						found = string.lower(spellName) == text;
					end
					if found then
						spellName = string.sub(v[3], 1, 4)..spellName;
						table.insert(AtlasLootCharDB["SearchResult"], { v[1], v[2], spellName, v[4], dataID.."|"..dataSource });
					end
				end
			end
		end
	end
	
	AtlasLootCharDB["SearchResult"] = {};
	AtlasLootCharDB.LastSearchedText = Text;
	for dataSource in pairs(AtlasLoot_Data) do search(dataSource) end
	
	if getn(AtlasLootCharDB["SearchResult"]) == 0 then
		DEFAULT_CHAT_FRAME:AddMessage(RED..AL["AtlasLoot"]..": "..WHITE..AL["No match found for"].." \""..Text.."\".");
	else
		currentPage = 1;
		SearchResult = AtlasLoot_CategorizeWishList(AtlasLootCharDB["SearchResult"]);
		AtlasLoot_ShowItemsFrame("SearchResult", "SearchResultPage1", string.format((AL["Search Result: %s"]), AtlasLootCharDB.LastSearchedText or ""), pFrame);
	end
end

function AtlasLoot:ShowSearchOptions(button)
	local dewdrop = AceLibrary("Dewdrop-2.0");
	if dewdrop:IsOpen(button) then
		dewdrop:Close(1);
	else
		local setOptions = function()
			dewdrop:AddLine(
				"text", AL["Search options"],
				"isTitle", true,
				"notCheckable", true
			);
			dewdrop:AddLine(
				"text", AL["Partial matching"],
				"checked", AtlasLootCharDB.PartialMatching,
				"tooltipTitle", AL["Partial matching"],
				"tooltipText", AL["If checked, AtlasLoot searches item names for a partial match."],
				"func", function() AtlasLootCharDB.PartialMatching = not AtlasLootCharDB.PartialMatching end
			);
		end;
		dewdrop:Open(button,
			'point', function(parent)
				return "BOTTOMLEFT", "BOTTOMRIGHT";
			end,
			"children", setOptions
		);
	end
end

function AtlasLoot:GetOriginalDataFromSearchResult(itemID)
	for i, v in ipairs(AtlasLootCharDB["SearchResult"]) do
		if v[1] == itemID then return unpack(v) end
	end
end

-- Copied and modified from AtlasLoot_GetWishListPage
function AtlasLoot:GetSearchResultPage(page)
	if not SearchResult then SearchResult = AtlasLoot_CategorizeWishList(AtlasLootCharDB["SearchResult"]) end
	-- Calc for maximal pages
	local pageMax = math.ceil(getn(SearchResult) / 30);
	if page < 1 then page = 1 end
	if page > pageMax then page = pageMax end
	currentPage = page;

	-- Table copy
	local result = {};
	local start = (page - 1) * 30 + 1;
	for i = start, start + 29 do
		if not SearchResult[i] then break end
		table.insert(result, SearchResult[i]);
	end
	return result, pageMax;
end
