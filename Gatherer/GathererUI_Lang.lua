--[[
	Contains language specific functions succeptible to contains raw unicode characters
]]--

function GathererUI_FixItemName(itemName)
	local newItemName = itemName;

	if ( GetLocale() == "frFR" ) then
	-- add name correction
		newItemName = string.gsub(itemName , "’", '\'');
		newItemName = string.gsub(newItemName , "argent v\195\169ritable", ORE_TRUESILVER);
		newItemName = string.gsub(newItemName , "vrai argent", ORE_TRUESILVER);
		newItemName = string.gsub(newItemName , "petite veine", "petit filon");
		newItemName = string.gsub(newItemName , "veine", ORE_CLASS_LODE);
		newItemName = string.gsub(newItemName , "pousse de bloodpetal", TREASURE_BLOODPETAL);
		newItemName = string.gsub(newItemName , "bloodpetal", TREASURE_BLOODPETAL);
		newItemName = string.gsub(newItemName , "pi\195\168ge de langouste", TREASURE_SHELLFISHTRAP);
		newItemName = string.gsub(newItemName , "sauge argent\195\169e des montagnes", HERB_MOUNTAINSILVERSAGE);
		newItemName = string.gsub(newItemName , "pi\195\168ge \195\160 langouste", TREASURE_SHELLFISHTRAP);
		newItemName = string.gsub(newItemName , "dark iron", ORE_DARKIRON);

		-- done with list of things to fix, checking if entry is different to add to fixed count
		if ( itemName ~= newItemName ) then
			fixedItemCount = fixedItemCount + 1;
		end
	end
	if ( GetLocale() == "deDE" ) then
		--newItemName = string.gsub(itemName , "’", '\'');
		newItemName = string.gsub(itemName , "dreamfoil", HERB_DREAMFOIL);
		newItemName = string.gsub(itemName , "feuerbl\195\188t", HERB_FIREBLOOM);
		newItemName = string.gsub(itemName , "arthas' tr\195\164nen", HERB_ARTHASTEAR);
		newItemName = string.gsub(itemName , "bloodpetal-spr\195\182ssling", TREASURE_BLOODPETAL_G);
		newItemName = string.gsub(itemName , "bloodpetal", TREASURE_BLOODPETAL);

		-- done with list of things to fix, checking if entry is different to add to fixed count
		if ( itemName ~= newItemName ) then
			fixedItemCount = fixedItemCount + 1;
		end
	end

	return newItemName;
end

function Gatherer_FixGatherName(gatherName)
	local newGather = string.gsub(gatherName , "’", '\'');
	return newGather;
end
