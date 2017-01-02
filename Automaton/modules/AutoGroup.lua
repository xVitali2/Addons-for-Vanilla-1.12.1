local L = AceLibrary("AceLocale-2.2"):new("Automaton_Group")
Automaton_Group = Automaton:NewModule("Group", "AceEvent-2.0", "AceConsole-2.0", "AceDebug-2.0")

L:RegisterTranslations("enUS", function() return {
    ["Group"] = true,
	["Options for accepting or declining group invites."] = true,
	["Enabled"] = true,
    ["Accepts party invites from your friends or guild members automatically."] = true,
    ["Who"] = true,
    ["Perform a /who on incoming party invites from unknown sources."] = true,
    ["Decline"] = true,
    ["Decline party invites from unknown sources."] = true,
    ["Declining party invitation..."] = true,    
} end)
L:RegisterTranslations("ruRU", function() return {
    ["Group"] = "Группа",
	["Options for accepting or declining group invites."] = "Настройки подтверждения или отклонения приглашения в группу.",
	["Enabled"] = "Включить",
    ["Accepts party invites from your friends or guild members automatically."] = "Принимает приглашения в группу от друзей и членов гильдии автоматически.",
    ["Who"] = "Кто",
    ["Perform a /who on incoming party invites from unknown sources."] = "Определяет командой /who неизвестного, который подал приглашение в группу.",
    ["Decline"] = "Отклонить",
    ["Decline party invites from unknown sources."] = "Отклоняет приглашение в группу от неизвестных",
    ["Declining party invitation..."] = "Приглашение в группу отклонено...",   
} end)
L:RegisterTranslations("koKR", function() return {
    ["Group"] = "그룹 초대",
	["Options for accepting or declining group invites."] = "그룹 초대에 관한 옵션을 설정합니다.",
	["Enabled"] = "활성화",
    ["Accepts party invites from your friends or guild members automatically."] = "파티 초대자가 당신의 친구나 길드 멤버일때 자동으로 초대를 수락합니다.",
    ["Who"] = "누구",
    ["Perform a /who on incoming party invites from unknown sources."] = "알수없는 파티 초대가 들어올때 '/누구'를 실행합니다.",
    ["Decline"] = "거절",
    ["Decline party invites from unknown sources."] = "알수없는 파티 초대시 거절합니다.",
    ["Declining party invitation..."] = "파티 초대 거절...",   
} end)


Automaton.options.args.group = {
	type = 'group',
	name = L["Group"],
	desc = L["Options for accepting or declining group invites."],
	args = {
		toggle = {
			type = 'toggle',
			name = L["Enabled"],
			desc = L["Accepts party invites from your friends or guild members automatically."],
			get = function() return Automaton:IsModuleActive("Group") end,
			set = function(v) Automaton:ToggleModuleActive("Group", v) end,
		},
		who = {
			type = 'toggle',
			name = L["Who"],
			desc = L["Perform a /who on incoming party invites from unknown sources."],
			get = function() return Automaton.db.profile.autoGroupWho end,
			set = function(v) Automaton.db.profile.autoGroupWho = v end,
		},
		decline = {
			type = 'toggle',
			name = L["Decline"],
			desc = L["Decline party invites from unknown sources."],
			get = function() return Automaton.db.profile.autoGroupDecline end,
			set = function(v) Automaton.db.profile.autoGroupDecline = v end,
		},
	}
}

function Automaton_Group:OnEnable()
	Automaton_Group:RegisterEvent("PARTY_INVITE_REQUEST")
end

function Automaton_Group:PARTY_INVITE_REQUEST()
	self:Debug("Processing AutoGroup")
	local who = arg1
	local acceptFrom = {}

	for i=1,GetNumGuildMembers() do
		local name = GetGuildRosterInfo(i)
		tinsert(acceptFrom,name)
	end

	for i=1,GetNumFriends() do
		local name = GetFriendInfo(i)
		tinsert(acceptFrom,name)
	end

	if foreachi(acceptFrom, function(i,v) if v==who then return true end end) then
		self:Debug("AutoGroup is accepting an invite from ".. who)
		AcceptGroup()
		StaticPopup_Hide("PARTY_INVITE")
		return
	end
	
	if Automaton.db.profile.autoGroupDecline then
		self:Print(L["Declining party invitation..."])
		DeclineGroup()
		StaticPopup_Hide("PARTY_INVITE")
	elseif Automaton.db.profile.autoGroupWho then
		SendWho("n-\""..who.."\"")
	end
end