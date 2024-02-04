
local module, L = BigWigs:ModuleDeclaration("Brood Queen Araxxna", "Karazhan")

module.revision = 30036
module.enabletrigger = module.translatedName
module.toggleoptions = {"volley", "leechingbite", "egg", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "BroodQueenAraxxna",

	volley_cmd = "volley",
	volley_name = "Brood Venom Volley Alert",
	volley_desc = "Warn for Brood Venom Volley",

	leechingbite_cmd = "leechingbite",
	leechingbite_name = "Leeching Bite Alert",
	leechingbite_desc = "Warn for Leeching Bite",
	
	egg_cmd = "egg",
	egg_name = "Egg Spawn Alert",
	egg_desc = "Warns for Egg Spawn",
	
	
	
	trigger_volley = "Brood Queen Araxxna's Brood Venom Volley hits",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
	bar_volley = "Brood Venom Volley",
	
	trigger_leechingBiteYou = "You are afflicted by Leeching Bite.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_leechingBiteOther = "(.+) is afflicted by Leeching Bite.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
	trigger_leechingBiteFade = "Leeching Bite fades from (.+).",--CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_SELF
	bar_leechingBite = " Leeching Bite",

	trigger_eggSpawn = "My minions shall consume you!",--CHAT_MSG_MONSTER_YELL
	bar_eggHatch = "Skitterweb Egg Hatch",
	msg_eggSpawn = "2 Eggs Spawned!",
	
	trigger_engage = "What goes there, new prey to be entangled?",--CHAT_MSG_MONSTER_YELL
} end )

local timer = {
	volley = 8,
	leechingBite = 10,
	eggHatch = 20,
}
local icon = {
	volley = "Spell_Nature_InsectSwarm",
	leechingBite = "ability_poisonsting",
	eggHatch = "inv_egg_02",
}
local color = {
	volley = "Green",
	leechingBite = "Blue",
	eggHatch = "Red",
}
local syncName = {
	volley = "BroodQueenAraxxnaVolley"..module.revision,
	leechingBite = "BroodQueenAraxxnaLeechingBite"..module.revision,
	leechingBiteFade = "BroodQueenAraxxnaLeechingBiteFade"..module.revision,
	eggSpawn = "BroodQueenAraxxnaEggSpawn"..module.revision,
}

--module:RegisterYellEngage(L["trigger_engage"])

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--trigger_leechingBiteYou
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--trigger_leechingBiteOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--trigger_leechingBiteOther
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")--trigger_leechingBiteFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")--trigger_leechingBiteFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")--trigger_leechingBiteFade
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")--trigger_volley
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")--trigger_volley
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")--trigger_volley
	
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")--trigger_eggSpawn
	
	self:ThrottleSync(5, syncName.volley)
	self:ThrottleSync(5, syncName.leechingBite)
	self:ThrottleSync(0, syncName.leechingBiteFade)
	self:ThrottleSync(5, syncName.eggSpawn)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
	if self.db.profile.volley then
		self:Bar(L["bar_volley"], timer.volley, icon.volley, true, color.volley)
	end
end

function module:OnDisengage()
end

function module:CHAT_MSG_MONSTER_YELL(msg, sender)
	if msg == L["trigger_engage"] then
		module:SendEngageSync()
	elseif msg == L["trigger_eggSpawn"] then
		self:Sync(syncName.eggSpawn)
	end
end

function module:Event(msg)
	if string.find(msg, L["trigger_volley"]) then
		self:Sync(syncName.volley)
	
	elseif msg == L["trigger_leechingBiteYou"] then
		self:Sync(syncName.leechingBite .. " " .. UnitName("Player"))
	
	elseif string.find(msg, L["trigger_leechingBiteOther"]) then
		local _,_, leechingBiteTarget, _ = string.find(msg, L["trigger_leechingBiteOther"])
		self:Sync(syncName.leechingBite .. " " .. leechingBiteTarget)
		
	elseif string.find(msg, L["trigger_leechingBiteFade"]) then
		local _,_, leechingBiteFadeTarget, _ = string.find(msg, L["trigger_leechingBiteFade"])
		if leechingBiteFadeTarget == "you" then leechingBiteFadeTarget = UnitName("Player") end
		self:Sync(syncName.leechingBiteFade .. " " .. leechingBiteFadeTarget)
		
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.volley and self.db.profile.volley then
		self:Volley()
	elseif sync == syncName.leechingBite and rest and self.db.profile.leechingbite then
		self:LeechingBite(rest)
	elseif sync == syncName.leechingBiteFade and rest and self.db.profile.leechingbite then
		self:LeechingBiteFade(rest)
	elseif sync == syncName.eggSpawn and self.db.profile.egg then
		self:EggSpawn()
	end
end


function module:Volley()
	self:Bar(L["bar_volley"], timer.volley, icon.volley, true, color.volley)
	
	if UnitClass("Player") == "Shaman" then
		self:WarningSign(icon.volley, 0.7)
	end
end

function module:LeechingBite(rest)
	self:Bar(rest..L["bar_leechingBite"], timer.leechingBite, icon.leechingBite, true, color.leechingBite)
end

function module:LeechingBiteFade(rest)
	self:RemoveBar(rest..L["bar_leechingBite"])
end

function module:EggSpawn()
	bwPlayerIsAttacking = nil
	if IsRaidLeader() or IsRaidOfficer() then
		if UnitClass("Player") ~= "Rogue" and UnitClass("Player") ~= "Druid" then
			if PlayerFrame.inCombat then
				bwPlayerIsAttacking = true
			end
			
			TargetByName("Skitterweb Egg",true)
			SetRaidTarget("target",8)
			TargetLastTarget()
			if bwPlayerIsAttacking then
				AttackTarget()
			end
		end
	end
	
	self:Bar(L["bar_eggHatch"], timer.eggHatch, icon.eggHatch, true, color.eggHatch)
	self:Message(L["msg_eggSpawn"], "Urgent", false, nil, false)
end