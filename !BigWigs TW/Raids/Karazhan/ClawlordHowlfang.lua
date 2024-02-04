
local module, L = BigWigs:ModuleDeclaration("Clawlord Howlfang", "Karazhan")

module.revision = 30036
module.enabletrigger = module.translatedName
module.toggleoptions = {"terrifyingpresence", "curse", "enrage", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "ClawlordHowlfang",

	terrifyingpresence_cmd = "terrifyingpresence",
	terrifyingpresence_name = "Terrifying Presence Alert",
	terrifyingpresence_desc = "Warn for Terrifying Presence",

	curse_cmd = "curse",
	curse_name = "Curse Alert",
	curse_desc = "Warn for Curse",
	
	enrage_cmd = "enrage",
	enrage_name = "Enrage Alert",
	enrage_desc = "Warns for Enrage",
	
	
	
	trigger_terrifyingPresenceSelf = "You are afflicted by Terrifying Presence %((.+)%).",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	--trigger_terrifyingPresence = "(.+) is afflicted by Terrifying Presence %((.+)%).",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
	bar_terrifyingPresence = "% reduced",
	
	trigger_curse = "afflicted by Shadowbane Curse.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	msg_curse = "Shadowbane Curse, Decurse!",
	
	trigger_yellEnrage = "My pack shall tear you apart, bone by bone!",--CHAT_MSG_MONSTER_YELL
	msg_enrage = "Enrage!",
	
	trigger_engage = "So it was you I smelled! Such a foul taint.",--CHAT_MSG_MONSTER_YELL
} end )

local timer = {
	terrifyingPresence = 10,
}
local icon = {
	terrifyingPresence = "Spell_Shadow_VampiricAura",
	curse = "Spell_Shadow_GatherShadows",
	enrage = "Spell_Shadow_UnholyFrenzy",
}
local color = {
	terrifyingPresence = "White",
	curse = "Black",
}
local syncName = {
	terrifyingPresence2 = "ClawlordHowlfangTerrifyingPresence2"..module.revision,
	curse = "ClawlordHowlfangCurse"..module.revision,
	enrage = "ClawlordHowlfangEnrage"..module.revision,
}

--module:RegisterYellEngage(L["trigger_engage"])

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--trigger_terrifyingPresenceSelf, trigger_curse
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--trigger_terrifyingPresence, trigger_curse
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--trigger_terrifyingPresence, trigger_curse
	
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")--trigger_engage, trigger_yellEnrage
	
	self:ThrottleSync(0.5, syncName.terrifyingPresence2)
	self:ThrottleSync(10, syncName.curse)
	self:ThrottleSync(10, syncName.enrage)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
end

function module:OnDisengage()
end

function module:CHAT_MSG_MONSTER_YELL(msg, sender)
	if msg == L["trigger_engage"] then
		module:SendEngageSync()
		
	elseif string.find(msg, L["trigger_yellEnrage"]) then
		self:Sync(syncName.enrage)
	end
end

function module:Event(msg)
	if string.find(msg, L["trigger_terrifyingPresenceSelf"]) then
		local _,_, tpQty, _ = string.find(msg, L["trigger_terrifyingPresenceSelf"])
		if UnitName("target") ~= nil and UnitName("targettarget") ~= nil then
			if UnitName("target") == "Clawlord Howlfang" and UnitName("targettarget") == UnitName("Player") then
				local tpPlayerAndQty = UnitName("Player") .. " " .. tpQty
				self:Sync(syncName.terrifyingPresence2 .. " " .. tpPlayerAndQty)
			end
		end
		
	elseif string.find(msg, L["trigger_curse"]) then
		self:Sync(syncName.curse)

	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.terrifyingPresence2 and rest and self.db.profile.terrifyingpresence then
		self:TerrifyingPresence(rest)
	elseif sync == syncName.curse and self.db.profile.curse then
		self:Curse()
	elseif sync == syncName.enrage and self.db.profile.enrage then
		self:Enrage()
	end
end


function module:TerrifyingPresence(rest)

	local tpPlayer = strsub(rest,0,strfind(rest," ") - 1)
	local tpQty = tonumber(strsub(rest,strfind(rest," "),strlen(rest)))
	local currentReduction = tpQty * 5
	
	for i = 5, 245, 5 do
		self:RemoveBar(tpPlayer.." "..i..L["bar_terrifyingPresence"])
	end
	
	self:Bar(tpPlayer.." "..currentReduction..L["bar_terrifyingPresence"], timer.terrifyingPresence, icon.terrifyingPresence, true, color.terrifyingPresence)
end

function module:Curse()
	self:Message(L["msg_curse"], "Urgent", false, nil, false)
	
	if UnitClass("Player") == "Mage" then
		self:WarningSign(icon.curse, 0.7)
	elseif UnitClass("Player") == "Druid" then
		self:WarningSign(icon.curse, 0.7)
	end
end

function module:Enrage()
	self:Message(L["msg_enrage"], "Attention", false, nil, false)
	self:WarningSign(icon.enrage, 0.7)
end
