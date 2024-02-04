
local module, L = BigWigs:ModuleDeclaration("Moroes", "Karazhan")

module.revision = 30025
module.enabletrigger = module.translatedName
module.toggleoptions = {"smokebomb", "reflect", "shufflekick", "curse", "dust", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "Moroes",

	smokebomb_cmd = "smokebomb",
	smokebomb_name = "Smoke Bomb Alert",
	smokebomb_desc = "Warn for Smoke Bomb",

	reflect_cmd = "reflect",
	reflect_name = "Spell Reflect Alert",
	reflect_desc = "Warn for Spell Reflect",
	
	shufflekick_cmd = "shufflekick",
	shufflekick_name = "Shuffle Kick Alert",
	shufflekick_desc = "Warns for Shuffle Kick",
	
	curse_cmd = "curse",
	curse_name = "Curse Alert",
	curse_desc = "Warns for Curse",
	
	dust_cmd = "dust",
	dust_name = "Glittering Dust Alert",
	dust_desc = "Warns for Glittering Dust",
	
	
	
	trigger_p1 = "New guests? It has been a while since we have had those. I assume your arrival has taken -some- effort even if you were uninvited!",--CHAT_MSG_MONSTER_YELL
	bar_p1 = "Moroes Phase 1",
	
	trigger_p1End = "Now now, why don't we save such pleasantries for a more, entertaining show. Meet me at the stage, and we shall truly decide the outcome of our engagement.",--CHAT_MSG_MONSTER_YELL
	trigger_p2 = "It is my duty to protect and watch over this tower, as approved by my master. I shall make sure to endulge in your little spectacle. Why don't we put on a show for those in attendance, hmm? Legalbrow, if you would please, play my theme.",--CHAT_MSG_MONSTER_YELL
	bar_p2 = "Moroes Phase 2",
	
	trigger_smokeBombYou = "You are afflicted by Smoke Bomb.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_smokeBombOther = "(.+) is afflicted by Smoke Bomb.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
	trigger_smokeBombFade = "Smoke Bomb fades from (.+).",--CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_SELF
	bar_smokeBomb = "Players Smoke Bombed",
	
	trigger_reflect = "Moroes gains Reflection.",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	trigger_reflectFade = "Reflection fades from Moroes.",--CHAT_MSG_SPELL_AURA_GONE_OTHER
	bar_reflect = "Spell Reflect!",
	msg_reflect = "Spell Reflect!",
	
	trigger_shuffleKickYou = "You are afflicted by Shuffle Kick.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_shuffleKick = "(.+) is afflicted by Shuffle Kick.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
	trigger_shuffleKickFade = "Shuffle Kick fades from (.+).",--CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_SELF
	bar_shuffleKick = " Kicked",
	
	trigger_curse = "afflicted by Moroes Curse.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	msg_curse = "Moroes Curse, Decurse!",
	
	trigger_dustYou = "You are afflicted by Glittering Dust.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_dust = "(.+) is afflicted by Glittering Dust.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
	trigger_dustFade = "Glittering Dust fades from (.+).",--CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_SELF
	bar_dust = " Dusted",
	
	trigger_yellSmt = "Most impressive, it would appear your skills do match your bravery.",-- CHAT_MSG_MONSTER_YELL
} end )

local timer = {
	p1 = 7,
	p2 = 12,
	smokeBomb = 10,
	reflect = 5,
	shuffleKick = 4,
	dust = 10,
}
local icon = {
	p1 = "Inv_Misc_Pocketwatch_01",
	p2 = "Inv_Misc_Pocketwatch_01",
	smokeBomb = "Ability_Vanish",
	reflect = "Spell_Arcane_Blink",
	shuffleKick = "Ability_Kick",
	curse = "Spell_Shadow_GatherShadows",
	dust = "inv_misc_dust_02",--unknown
}
local color = {
	p1 = "White",
	p2 = "White",
	smokeBomb = "Black",
	reflect = "Red",
	shuffleKick = "Blue",
	dust = "Cyan",
}
local syncName = {
	p1 = "MoroesP1"..module.revision,
	smokeBomb2 = "MoroesSmokeBomb2"..module.revision,
	reflect = "MoroesReflect"..module.revision,
	reflectFade = "MoroesReflectFade"..module.revision,
	p1End = "MoroesP1End"..module.revision,
	p2 = "MoroesP2"..module.revision,
	shuffleKick = "MoroesShuffleKick"..module.revision,
	shuffleKickFade = "MoroesShuffleKickFade"..module.revision,
	curse = "MoroesCurse"..module.revision,
	dust = "MoroesDust"..module.revision,
	dustFade = "MoroesDustFade"..module.revision,
}

local bwMoroesPhase = nil

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug
	bwMoroesPhase = nil
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--trigger_smokeBombYou, trigger_agonizingConcussionYou, trigger_curse
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--trigger_smokeBombOther, trigger_agonizingConcussion, trigger_curse
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--trigger_smokeBombOther, trigger_agonizingConcussion, trigger_curse
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")--trigger_smokeBombFade, trigger_reflectFade, trigger_agonizingConcussionFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")--trigger_smokeBombFade, trigger_agonizingConcussionFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")--trigger_smokeBombFade, trigger_agonizingConcussionFade
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")--trigger_reflect
	
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")--trigger_p1, trigger_p2
	
	self:ThrottleSync(10, syncName.p1)
	self:ThrottleSync(10, syncName.p1End)
	self:ThrottleSync(10, syncName.p2)
	self:ThrottleSync(3, syncName.smokeBomb2)
	self:ThrottleSync(5, syncName.reflect)
	self:ThrottleSync(5, syncName.reflectFade)
	self:ThrottleSync(5, syncName.shuffleKick)
	self:ThrottleSync(5, syncName.shuffleKickFade)
	self:ThrottleSync(5, syncName.curse)
	self:ThrottleSync(5, syncName.dust)
	self:ThrottleSync(5, syncName.dustFade)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
end

function module:OnDisengage()
end

function module:CHAT_MSG_MONSTER_YELL(msg, sender)
	if msg == L["trigger_p1"] then
		module:SendEngageSync()
		self:Sync(syncName.p1)
		
	elseif msg == L["trigger_p1End"] then
		self:Sync(syncName.p1End)
		
	elseif msg == L["trigger_p2"] then
		module:SendEngageSync()
		self:Sync(syncName.p2)
	end
end

function module:Event(msg)
	if msg == L["trigger_smokeBombYou"] then
		self:Sync(syncName.smokeBomb2)
	
	elseif string.find(msg, L["trigger_smokeBombOther"]) then
		self:Sync(syncName.smokeBomb2)

	elseif msg == L["trigger_reflect"] then
		self:Sync(syncName.reflect)
	elseif msg == L["trigger_reflectFade"] then
		self:Sync(syncName.reflectFade)

	elseif msg == L["trigger_shuffleKickYou"] then
		self:Sync(syncName.shuffleKick .. " " .. UnitName("Player"))
	
	elseif string.find(msg, L["trigger_shuffleKick"]) then
		local _,_, shuffleKickPlayer, _ = string.find(msg, L["trigger_shuffleKick"])
		self:Sync(syncName.shuffleKick .. " " .. shuffleKickPlayer)
		
	elseif string.find(msg, L["trigger_shuffleKickFade"]) then
		local _,_, shuffleKickFadePlayer, _ = string.find(msg, L["trigger_shuffleKickFade"])
		if shuffleKickFadePlayer == "you" then shuffleKickFadePlayer = UnitName("Player") end
		self:Sync(syncName.shuffleKickFade .. " " .. shuffleKickFadePlayer)
		
		
	elseif string.find(msg, L["trigger_curse"]) then
		self:Sync(syncName.curse)
		
		
	elseif msg == L["trigger_dustYou"] then
		self:Sync(syncName.dust .. " " .. UnitName("Player"))
	
	elseif string.find(msg, L["trigger_dust"]) then
		local _,_, dustPlayer, _ = string.find(msg, L["trigger_dust"])
		self:Sync(syncName.dust .. " " .. dustPlayer)
		
	elseif string.find(msg, L["trigger_dustFade"]) then
		local _,_, dustFadePlayer, _ = string.find(msg, L["trigger_dustFade"])
		if dustFadePlayer == "you" then dustFadePlayer = UnitName("Player") end
		self:Sync(syncName.dustFade .. " " .. dustFadePlayer)
		
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.p1 then
		self:P1()
	elseif sync == syncName.p1End then
		self:P1End()
	elseif sync == syncName.p2 then
		self:P2()
	elseif sync == syncName.smokeBomb2 and self.db.profile.smokebomb then
		self:SmokeBomb()
	elseif sync == syncName.reflect and self.db.profile.reflect then
		self:Reflect()
	elseif sync == syncName.reflectFade and self.db.profile.reflect then
		self:ReflectFade()
	elseif sync == syncName.shuffleKick and rest and self.db.profile.shufflekick then
		self:ShuffleKick(rest)
	elseif sync == syncName.shuffleKickFade and rest and self.db.profile.shufflekick then
		self:ShuffleKickFade(rest)
	elseif sync == syncName.curse and self.db.profile.curse then
		self:Curse()
	elseif sync == syncName.dust and rest and self.db.profile.dust then
		self:Dust(rest)
	elseif sync == syncName.dustFade and rest and self.db.profile.dust then
		self:DustFade(rest)
	end
end


function module:P1()
	bwMoroesPhase = "p1"
	self:Bar(L["bar_p1"], timer.p1, icon.p1, true, color.p1)
end

function module:P1End()
	bwMoroesPhase = "p2"
end

function module:P2()
	bwMoroesPhase = "p2"
	self:Bar(L["bar_p2"], timer.p2, icon.p2, true, color.p2)
end

function module:SmokeBomb()
	self:Bar(L["bar_smokeBomb"], timer.smokeBomb, icon.smokeBomb, true, color.smokeBomb)
	
	if UnitClass("Player") == "Priest" then
		self:WarningSign(icon.smokeBomb, 0.7)
	elseif UnitClass("Player") == "Paladin" then
		self:WarningSign(icon.smokeBomb, 0.7)
	end
end

function module:Reflect()
	self:Bar(L["bar_reflect"], timer.reflect, icon.reflect, true, color.reflect)
	
	if UnitClass("Player") == "Mage" then
		self:WarningSign(icon.reflect, timer.reflect)
	elseif UnitClass("Player") == "Warlock" then
		self:WarningSign(icon.reflect, timer.reflect)
	end
	
	if (UnitClass("Player") ~= "Warrior") and (UnitClass("Player") ~= "Rogue") then
		self:Message(L["msg_reflect"], "Important", false, nil, false)
		self:Sound("Long")
	end
end

function module:ReflectFade()
	self:RemoveBar(L["bar_reflect"])
end

function module:ShuffleKick(rest)
	self:Bar(rest..L["bar_shuffleKick"], timer.shuffleKick, icon.shuffleKick, true, color.shuffleKick)
end

function module:ShuffleKickFade(rest)
	self:RemoveBar(rest..L["bar_shuffleKick"])
end

function module:Curse()
	self:Message(L["msg_curse"], "Urgent", false, nil, false)
	
	if UnitClass("Player") == "Mage" then
		self:WarningSign(icon.curse, 0.7)
	elseif UnitClass("Player") == "Druid" then
		self:WarningSign(icon.curse, 0.7)
	end
end

function module:Dust(rest)
	self:Bar(rest..L["bar_dust"], timer.dust, icon.dust, true, color.dust)
end

function module:DustFade(rest)
	self:RemoveBar(rest..L["bar_dust"])
end
