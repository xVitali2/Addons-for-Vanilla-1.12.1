local L = AceLibrary("AceLocale-2.2"):new("Automaton_Clam")
Automaton_Clam = Automaton:NewModule("Clam", "AceEvent-2.0", "AceDebug-2.0")
local auto_clams  = {
		5523,  -- Small Barnacled Clam
		5524,  -- Thick-shelled Clam
		7973,  -- Big-mouth Clam
		15874  -- Soft-shelled Clam
}
L:RegisterTranslations("enUS", function() return {
    ["Clam"] = true,
	["Search clam shells in inventory and open them after looting"] = true,
} end)
L:RegisterTranslations("ruRU", function() return {
    ["Clam"] = "Моллюск",
	["Search clam shells in inventory and open them after looting"] = "Находит раковины моллюска в сумке и открывает их",
} end)

Automaton.options.args.clam = {
	type = 'toggle',
	name = L["Clam"],
	desc = L["Search clam shells in inventory and open them after looting"],
	get = function() return Automaton:IsModuleActive("Clam") end,
	set = function(v) Automaton:ToggleModuleActive("Clam", v) end,
}

-- local function print(text)
	-- DEFAULT_CHAT_FRAME:AddMessage(text)
-- end

function Automaton_Clam:OnEnable()
	self:RegisterEvent("LOOT_CLOSED");
	self:RegisterEvent("MAIL_CLOSED");
	self:RegisterEvent("TRADE_CLOSED");
	self:RegisterEvent("BANKFRAME_CLOSED");
	self:RegisterEvent("BAG_UPDATE");
end


function Automaton_Clam:ForbiddenFrame()
	local auctionframe = false;
	if (AuctionFrame and AuctionFrame:IsVisible()) then
		auctionframe = true;
	end
	if (LootFrame:IsVisible() or
	    TradeFrame:IsVisible() or
	    BankFrame:IsVisible() or
	    MailFrame:IsVisible() or
	    auctionframe or
	    MerchantFrame:IsVisible()) then
		return true;
	else
		return false;
	end
end

function Automaton_Clam:ExtractLinkID(link)
		_, _, id = string.find(link, "Hitem:(.+):%d+:%d+:%d+%\124");
		return tonumber(id);
end
function Automaton_Clam:LOOT_CLOSED()
	if (not self:ForbiddenFrame()) then
		self:AutoClam();
	end
end
function Automaton_Clam:MAIL_CLOSED()
	if (not self:ForbiddenFrame()) then
		self:AutoClam();
	end
end
function Automaton_Clam:TRADE_CLOSED()
	if (not self:ForbiddenFrame()) then
		self:AutoClam();
	end
end
function Automaton_Clam:BANKFRAME_CLOSED()
	if (not self:ForbiddenFrame()) then
		self:AutoClam();
	end
end
function Automaton_Clam:BAG_UPDATE()
	if (not self:ForbiddenFrame()) then
		self:AutoClam();
	end
end

function Automaton_Clam:IsClam(link)
		local index;
		for index = 1, table.getn(auto_clams) do
			if (self:ExtractLinkID(link) == auto_clams[index]) then
				return true;
			end
		end
		return false;
end

function Automaton_Clam:CanAutoClam(bag, slot)
		AutoClam_Tooltip:SetBagItem(bag, slot);
		local text2 = AutoClam_TooltipTextLeft2:GetText();
		if (text2 and text2 == ITEM_OPENABLE) then
	--	print("CanAutoClamtrue");
			return true;
		else
	--	print("CanAutoClamfalse");
			return false;
		end
end

function Automaton_Clam:AutoClam()
		local bag, slot;
		for bag = 0, 4 do
			for slot = 1, GetContainerNumSlots(bag) do
				local link = GetContainerItemLink(bag, slot);
				if (link and self:IsClam(link) and self:CanAutoClam(bag, slot)) then
					UseContainerItem(bag, slot);
					return true;
				end
			end
		end
	return false;
end