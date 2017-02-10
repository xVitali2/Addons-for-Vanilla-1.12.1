
local setname, coremajor = "Zul'Gurub Quest", "1"
local vmajor, vminor = "Zul'Gurub Quest 1", tonumber(string.sub("$Revision: 12749 $", 12, -3))


-- Check to see if an update is needed
-- if not then just return out now before we do anything
if not TekLibStub or not PeriodicTableEmbed or not PeriodicTableEmbed:NeedsUpgraded(vmajor, vminor) then return end

local mem = gcinfo()
local t = {
	-- Zul'Gurub items by type
	zulgurubquests = {"zulgurubcoin", "zulgurubbijou", "zulgurubprimal"},
	zulgurubcoin   = "19698 19699 19700 19701 19702 19703 19704 19705 19706",
	zulgurubbijou  = "19707 19708 19709 19710 19711 19712 19713 19714 19715",
	zulgurubprimal = "19716 19717 19718 19719 19720 19721 19722 19723 19724",

	-- Coin trios for repeatable rep quests
	zulgurubcoinrep1 = "19698 19699 19700",
	zulgurubcoinrep2 = "19701 19702 19703",
	zulgurubcoinrep3 = "19704 19705 19706",

	-- Zul'Gurub items by class need
	-- Value = Reputation index of:
	-- {"Hated", "Hostile", "Unfirendly", "Neutral", "Friendly", "Honored", "Revered", "Exalted"}
	zulgurubclasses = {"zulgurubdruid", "zulgurubhunter", "zulgurubmage", "zulgurubpaladin", "zulgurubpriest", "zulgurubrogue", "zulgurubshaman", "zulgurubwarlock", "zulgurubwarrior"},

	zulgurubdruid           = "19720:6 19718:5 19722:7",
	zulgurubhunter          = "19721:6 19716:5 19724:7",
	zulgurubmage            = "19716:5 19723:7 19721:6",
	zulgurubpaladin         = "19721:7 19716:5 19722:6",
	zulgurubpriest          = "19720:6 19718:5 19724:7",
	zulgurubrogue           = "19717:5 19724:7 19719:6",
	zulgurubshaman          = "19719:6 19717:5 19722:7",
	zulgurubwarlock         = "19718:5 19723:7 19720:6",
	zulgurubwarrior         = "19719:6 19717:5 19723:7",
}


local lib = {}


-- Return the library's current version
function lib:GetLibraryVersion()
	return vmajor, vminor
end


-- Activate a new instance of this library
function lib:LibActivate(stub, oldLib, oldList)
	self.dataset = t
	t = nil
	PeriodicTableEmbed:GetInstance(coremajor):AddModule(setname, self.dataset, self.memuse)
end

lib.memuse = gcinfo() - mem


--------------------------------
--      Load this bitch!      --
--------------------------------
PeriodicTableEmbed:Register(lib)
