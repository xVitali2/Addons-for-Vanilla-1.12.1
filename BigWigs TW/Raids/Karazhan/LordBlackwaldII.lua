
local module, L = BigWigs:ModuleDeclaration("Lord Blackwald II", "Karazhan")

module.revision = 30027
module.enabletrigger = module.translatedName
module.toggleoptions = {"reaverstorm", "boon", "empoweredsoul", "summon", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "LordBlackwaldII",

	reaverstorm_cmd = "reaverstorm",
	reaverstorm_name = "Reaver Storm Alert",
	reaverstorm_desc = "Warn for Reaver Storm",

	boon_cmd = "boon",
	boon_name = "Blackwalds Boon Alert",
	boon_desc = "Warn for Blackwalds Boon",
	
	empoweredsoul_cmd = "empoweredsoul",
	empoweredsoul_name = "Empowered Soul Alert",
	empoweredsoul_desc = "Warns for Empowered Soul",
	
	summon_cmd = "summon",
	summon_name = "Summon Alert",
	summon_desc = "Warns for Summon",
	
	
	
	trigger_reaverstorm = "Lord Blackwald II begins to perform Reaver Storm.",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	bar_reaverstormCd = "Reaver Storm CD",
	bar_reaverstormCast = "Reaver Storm Cast",
	
	trigger_boonYou = "You are afflicted by Blackwalds Boon.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_boonOther = "(.+) is afflicted by Blackwalds Boon.",--CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_boonFade = "Blackwalds Boon fades from (.+).",--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
	bar_boon = "Boon on ",
	
	trigger_empoweredSoulYou = "You are afflicted by Empowered Soul.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_empoweredSoulOther = "(.+) is afflicted by Empowered Soul.",--CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	bar_empoweredSoul = " Empowered",

	trigger_yellSummon = "I call upon the Scythe of Elune, grant me your power!",--CHAT_MSG_MONSTER_YELL
	bar_summon = "Summons add",
	msg_yellSummon = "Shadowbane Ragefang Summonned!",
	
	trigger_engage = "You dare disturb the Dark Rider Lord?",--CHAT_MSG_MONSTER_YELL
} end )

local timer = {
	reaverstormCd = 5.5,
	reaverstormCast = 1.5,
	boon = 15,--timer TBD
	empoweredSoul = 10,
	firstSummon = 30,
	summon = 60,--unknown, is more than 40sec
}
local icon = {
	reaverstorm = "Ability_Whirlwind",
	boon = "Spell_Shadow_ChillTouch",
	empoweredSoul = "Spell_Shadow_Haunting",
	summon = "inv_misc_bone_orcskull_01",
}
local color = {
	reaverstormCd = "White",
	reaverstormCast = "Red",
	boon = "Blue",
	empoweredSoul = "Black",
	summon = "Cyan"
}
local syncName = {
	reaverstorm = "LordBlackwaldIIReaverstorm"..module.revision,
	boon = "LordBlackwaldIIBoon"..module.revision,
	boonFade = "LordBlackwaldIIBoonFade"..module.revision,
	empoweredSoul = "LordBlackwaldIIEmpoweredSoul"..module.revision,
	summon = "LordBlackwaldIISummon"..module.revision,
}

--module:RegisterYellEngage(L["trigger_engage"])

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")--trigger_reaverstorm
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--trigger_boonYou, trigger_empoweredSoulYou
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--trigger_boonOther, trigger_empoweredSoulOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--trigger_boonOther, trigger_empoweredSoulOther
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")--trigger_boonFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")--trigger_boonFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")--trigger_boonFade
	
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")--trigger_yellSummon
	
	self:ThrottleSync(5, syncName.reaverstorm)
	self:ThrottleSync(5, syncName.boon)
	self:ThrottleSync(5, syncName.boonFade)
	self:ThrottleSync(5, syncName.empoweredSoul)
	self:ThrottleSync(5, syncName.summon)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
	self:Bar(L["bar_summon"], timer.firstSummon, icon.summon, true, color.summon)
end

function module:OnDisengage()
end

function module:CHAT_MSG_MONSTER_YELL(msg, sender)
	if msg == L["trigger_engage"] then
		module:SendEngageSync()
	
	elseif msg == L["trigger_yellSummon"] then
		self:Sync(syncName.summon)
	end
end

function module:Event(msg)
	if msg == L["trigger_reaverstorm"] then
		self:Sync(syncName.reaverstorm)
	
	
	elseif msg == L["trigger_boonYou"] then
		self:Sync(syncName.boon .. " " .. UnitName("Player"))
	
	elseif string.find(msg, L["trigger_boonOther"]) then
		local _,_, boonPlayer, _ = string.find(msg, L["trigger_boonOther"])
		self:Sync(syncName.boon .. " " .. boonPlayer)
	
	elseif string.find(msg, L["trigger_boonFade"]) then
		local _,_, boonFadePlayer, _ = string.find(msg, L["trigger_boonFade"])
		if boonFadePlayer == "you" then boonFadePlayer = UnitName("Player") end
		self:Sync(syncName.boonFade .. " " .. boonFadePlayer)


	elseif msg == L["trigger_empoweredSoulYou"] then
		self:Sync(syncName.empoweredSoul .. " " .. UnitName("Player"))
		
	elseif string.find(msg, L["trigger_empoweredSoulOther"]) then
		local _,_, empoweredSoulPlayer, _ = string.find(msg, L["trigger_empoweredSoulOther"])
		self:Sync(syncName.empoweredSoul .. " " .. empoweredSoulPlayer)
		
	--elseif msg == L["trigger_yellSummon"] then
	--	self:Sync(syncName.summon)
		
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.reaverstorm and self.db.profile.reaverstorm then
		self:Reaverstorm()
	elseif sync == syncName.boon and rest and self.db.profile.boon then
		self:Boon(rest)
	elseif sync == syncName.boonFade and rest and self.db.profile.boon then
		self:BoonFade(rest)
	elseif sync == syncName.empoweredSoul and rest and self.db.profile.empoweredsoul then
		self:EmpoweredSoul(rest)
	elseif sync == syncName.summon and self.db.profile.summon then
		self:Summon()
	end
end


function module:Reaverstorm()
	self:RemoveBar(L["bar_reaverstormCd"])
	self:Bar(L["bar_reaverstormCast"], timer.reaverstormCast, icon.reaverstorm, true, color.reaverstormCast)
	self:DelayedBar(timer.reaverstormCast, L["bar_reaverstormCd"], timer.reaverstormCd, icon.reaverstorm, true, color.reaverstormCd)
end

function module:Boon(rest)
	self:Bar(L["bar_boon"]..rest, timer.boon, icon.boon, true, color.boon)
	
	if UnitClass("Player") == "Mage" then
		self:WarningSign(icon.boon, 0.7)
	elseif UnitClass("Player") == "Druid" then
		self:WarningSign(icon.boon, 0.7)
	end
end

function module:BoonFade(rest)
	self:RemoveBar(L["bar_boon"]..rest)
end

function module:EmpoweredSoul(rest)
	for i=1,GetNumRaidMembers() do
		if UnitName("raid"..i) == rest then
			SetRaidTarget("raid"..i, 8)
		end
	end
	
	self:Bar(rest..L["bar_empoweredSoul"].. " >Click Me<", timer.empoweredSoul, icon.empoweredSoul, true, color.empoweredSoul)
	self:SetCandyBarOnClick("BigWigsBar "..rest..L["bar_empoweredSoul"].. " >Click Me<", function(name, button, extra) TargetByName(extra, true) end, rest)
end

function module:Summon()
	self:Message(L["msg_yellSummon"], "Urgent", false, nil, false)
	self:Bar(L["bar_summon"], timer.summon, icon.summon, true, color.summon)
end
