
-- trigger for spore spawn missing

----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Loatheb", "Naxxramas")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Loatheb",

	doom_cmd = "doom",
	doom_name = "Inevitable Doom Alert",
	doom_desc = "Warn for Inevitable Doom",

	curse_cmd = "curse",
	curse_name = "Remove Curse Alert",
	curse_desc = "Warn when curses are removed from Loatheb",

	spore_cmd = "spore",
	spore_name = "Spore Alert",
	spore_desc = "Warn for Spores",

	debuff_cmd = "debuff",
	debuff_name = "Spore Debuff",
	debuff_desc = "Show icon when your spore debuff is running out",

	groups_cmd = "groups",
	groups_name = "Spore groups",
	groups_desc = "Disable to show group numbers on spore timer (7 Group tactic)",

	doombar = "Inevitable Doom %d",
	doomwarn = "Inevitable Doom %d! %d sec to next!",
	doomwarn5sec = "Inevitable Doom %d in 5 sec!",
	doomtrigger = "afflicted by Inevitable Doom.",

	cursewarn = "Curses removed! RENEW CURSES",
	cursebar = "Remove Curse",
	cursetrigger  = "Loatheb's Curse (.+) is removed.",


	doomtimerbar = "Doom every 15sec",
	doomtimerwarn = "Doom timerchange in %s seconds!",
	doomtimerwarnnow = "Inevitable Doom now happens every 15sec!",

	cursetimerbar = "Remove Curse Timer",
	cursetimerwarn = "Curses removed, next in %s seconds!",

	startwarn = "Loatheb engaged, 2 min to Inevitable Doom!",

	--sporewarn = "Spore spawned",
	sporebar = "Next Spore %d",
	sporebar_group = "Next Spore - Group %d",

	you = "You",
	are = "are",
	fungalBloom = "Fungal Bloom",

	--LoathebTactical
	graphic_cmd = "graphic",
	graphic_name = "Graphical Icons",
	graphic_desc = "When checked shows graphical icons",

	sound_cmd = "sound",
	sound_name = "Sound Effects",
	sound_desc = "When checked plays sound effects",

	consumable_cmd = "consumable",
	consumable_name = "Do NOT warn raid to use consumables (A)",
	consumable_desc = "When check does NOT warn raid to use consambles over raidwarn. Requires Assistance (A)",

	shadowpot = "-- Drink Shadow Protection Potion ! --",
	bandage = "-- Use your bandages ! --",
	wrtorhs = "-- Healthstone or Whipper Root Tuber ! --",
	shadowpotandbandage = "-- Drink Shadow Protection Potion and Bandage ! --",
	noconsumable = "-- No Consumable at this time ! --",

	soundshadowpot = "Interface\\Addons\\BigWigs\\Sounds\\potion.wav",
	soundbandage = "Interface\\Addons\\BigWigs\\Sounds\\bandage.wav",
	soundwrtorhs = "Interface\\Addons\\BigWigs\\Sounds\\healthstone.wav",
	soundshadowpotandbandage = "Interface\\Addons\\BigWigs\\Sounds\\potionandbandage.wav",
	soundgoforbuff = "Interface\\Addons\\BigWigs\\Sounds\\goforbuff.wav",

} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Loatheb",

	--doom_cmd = "doom",
	doom_name = "Alerta de Condena inevitable",
	doom_desc = "Avisa para Condena inevitable",

	--curse_cmd = "curse",
	curse_name = "Alerta de Deshacer maldición",
	curse_desc = "Avisa cuando las maldiciones son quitadas de Loatheb",

	--spore_cmd = "spore",
	spore_name = "Alerta de Espora",
	spore_desc = "Avisa para Esporas",

	--debuff_cmd = "debuff",
	debuff_name = "Debuff de Espora",
	debuff_desc = "Muestra cuando casi desaparezca el debuff de espora",

	--groups_cmd = "groups",
	groups_name = "Grupos de Espora",
	groups_desc = "Desactiva para mostrar el número del grupo con temporizadores para esporas (Táctica de 7 grupos)",


	doombar = "Condena inevitable %d",
	doomwarn = "¡Condena inevitable %d! %d segundos hasta la próxima!",
	doomwarn5sec = "¡Condena inevitable %d en 5 segundos!",
	doomtrigger = "sufre de Condena inevitable.",

	cursewarn = "¡Maldiciones quitadas! RENOVA MALDICIÓNES!",
	cursebar = "Deshacer maldición",
	--cursetrigger = "Loatheb's Chains of Ice is removed.",
	cursetrigger  = "Maldición de Loatheb (.+) is removed.",


	doomtimerbar = "Condena cada 15 segundos",
	doomtimerwarn = "¡Cambio del Temporizador de Condena en %s segundos!",
	doomtimerwarnnow = "¡Condena inevitable pasa cada 15sec!",

	cursetimerbar = "Temporizador de Deshacer maldición",
	cursetimerwarn = "¡Maldiciones quitadas, la próxima en %s segundos!",

	startwarn = "Entrando en combate con Loatheb, 2 minutos hasta Condena inevitable!",

	--sporewarn = "Spore spawned",
	sporebar = "Próxima Espora",

	-- Loatheb Tactical

	--graphic_cmd = "graphic",
	graphic_name = "Iconos Gráficos",
	graphic_desc = "Muestra los iconos gráficos cuando esté marcado",

	--sound_cmd = "sound",
	sound_name = "Efectos de Sonido",
	sound_desc = "Reproduce efectos de sonido cuando esté marcado",

	doomtrigger = "afligido por Fatalidad inevitable.",

	--consumable_cmd = "consumable",
	consumable_name = "No avisar la banda de usar consumibles (A)",
	consumable_desc = "No avisa la banda de usar consumibles por Advertencia de la Banda cuando esté marcado. Requiere Asistente (A)",

	shadowpot = "-- ¡ Toma Poción de Protección contra las Sombras ! --",
	bandage = "-- ¡ Usa las vendajes ! --",
	wrtorhs = "-- ¡ Piedra de Salud o Tubérculo de blancoria ! --",
	shadowpotandbandage = "-- ¡ Toma Poción de Protección contra las Sombras y Venda ! --",
	noconsumable = "-- ¡ No usa Consumibles por ahora ! --",


	you = "Tu",
	are = "estás",
} end )

local LoathebDebuff = CreateFrame( "GameTooltip", "LoathebDebuff", nil, "GameTooltipTemplate" );
LoathebDebuff:Hide()
LoathebDebuff:SetFrameStrata("TOOLTIP")
LoathebDebuff:SetOwner(WorldFrame, "ANCHOR_NONE")
---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"doom", "curse", "spore", "groups", "debuff", -1, "consumable", "graphic", "sound", "bosskill"}


-- locals
local timer = {
	softEnrage = 300,
	firstDoom = 120,
	doomLong = 30,
	doomShort = 15,
	doom = 0, -- this variable will be changed during the encounter
	spore = 13,
	firstCurse = 5,
	curse = 30,
	getNextSpore = 20,
}
local icon = {
	softEnrage = "Spell_Shadow_UnholyFrenzy",
	doom = "Spell_Shadow_NightOfTheDead",
	spore = "Ability_TheBlackArrow",
	sieni = "Interface\\AddOns\\\BigWigs\\Textures\\sieni",
	curse = "Spell_Holy_RemoveCurse",
}
local syncName = {
	doom = "LoathebDoom"..module.revision,
	spore = "LoathebSporeSpawn"..module.revision,
	curse = "LoathebRemoveCurse"..module.revision,
}
local consumableslist = {L["shadowpot"],L["noconsumable"],L["bandage"],L["wrtorhs"],L["shadowpotandbandage"],L["noconsumable"],L["bandage"],L["noconsumable"],L["wrtorhs"]}
local numSpore = 0 -- how many spores have been spawned
local numDoom = 0 -- how many dooms have been casted


------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_BREAK_AURA", "CurseEvent")

	-- 2: Doom and SporeSpawn versioned up because of the sync including the
	-- doom/spore count now, so we don't hold back the counter.
	self:ThrottleSync(10, syncName.doom)
	self:ThrottleSync(5, syncName.spore)
	self:ThrottleSync(5, syncName.curse)

	self.consumableseq = 0

	self.frameIcon = CreateFrame("Frame",nil,UIParent)

	self.frameIcon:SetFrameStrata("MEDIUM")
	self.frameIcon:SetWidth(100)
	self.frameIcon:SetHeight(100)
	self.frameIcon:SetAlpha(0.6)

	self.frameTexture = self.frameIcon:CreateTexture(nil,"BACKGROUND")

	self.frameTexture:SetTexture(nil)
	self.frameTexture:SetAllPoints(self.frameIcon)

	self.frameIcon:Hide()

	self.frameIcon2 = CreateFrame("Frame",nil,UIParent)

	self.frameIcon2:SetFrameStrata("MEDIUM")
	self.frameIcon2:SetWidth(100)
	self.frameIcon2:SetHeight(100)
	self.frameIcon2:SetAlpha(0.6)

	self.frameTexture2 = self.frameIcon2:CreateTexture(nil,"BACKGROUND")

	self.frameTexture2:SetTexture(nil)
	self.frameTexture2:SetAllPoints(self.frameIcon2)

	self.frameIcon2:Hide()

end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.consumableseq = 0
	numSpore = 0 -- how many spores have been spawned
	numDoom = 0 -- how many dooms have been casted
	timer.doom = timer.firstDoom

	self.frameIcon:Hide()
	self.frameIcon2:Hide()
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.doom then
		self:Bar(L["doomtimerbar"], timer.softEnrage, icon.softEnrage)
		self:DelayedMessage(timer.softEnrage - 60, string.format(L["doomtimerwarn"], 60), "Attention")
		self:DelayedMessage(timer.softEnrage - 30, string.format(L["doomtimerwarn"], 30), "Attention")
		self:DelayedMessage(timer.softEnrage - 10, string.format(L["doomtimerwarn"], 10), "Urgent")
		self:DelayedMessage(timer.softEnrage - 5, string.format(L["doomtimerwarn"], 5), "Important")
		self:DelayedMessage(timer.softEnrage, L["doomtimerwarnnow"], "Important")

		-- soft enrage after 5min: Doom every 15s instead of every 30s
		--self:ScheduleEvent("bwloathebdoomtimerreduce", function() module.doomTime = 15 end, 300)
		self:ScheduleEvent("bwloathebdoomtimerreduce", self.SoftEnrage, timer.softEnrage)
		--self:Message(L["startwarn"], "Red")
		self:Bar(string.format(L["doombar"], numDoom + 1), timer.doom, icon.doom)
		self:DelayedMessage(timer.doom - 5, string.format(L["doomwarn5sec"], numDoom + 1), "Urgent")
		timer.doom = timer.doomLong -- reduce doom timer from 120s to 30s
	end
	self:Bar(L["cursebar"], timer.firstCurse, icon.curse)

	self:Spore()
	self:ScheduleRepeatingEvent("bwloathebspore", self.Spore, timer.spore, self)
	self:ScheduleRepeatingEvent("bwLoathebCheckDebuff", self.CheckDebuff, 0.5, self)
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
	self.frameIcon:Hide()
	self.frameIcon2:Hide()
end


------------------------------
--      Initialization      --
------------------------------

function module:Event( msg )
	if string.find(msg, L["doomtrigger"]) then
		self:Sync(syncName.doom .. " " .. tostring(numDoom + 1))
	end
end

function module:CurseEvent( msg )
	if string.find(msg, L["cursetrigger"]) then
		self:Sync(syncName.curse)
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.doom and rest then
		self:Doom(rest)
		rest = tonumber(rest)
		if rest == (self.consumableseq + 1) then
			self:ScheduleEvent("bwloathebconsumable "..tostring(self.consumableseq), self.ConsumableWarning, 11, self)
			self.consumableseq = self.consumableseq + 1
		end
		elseif sync == syncName.curse then
			self:Curse()
	end
end

------------------------------
--      Sync Handlers	    --
------------------------------

function module:Doom(syncNumDoom)
	syncNumDoom = tonumber(syncNumDoom)
	if syncNumDoom then
		if syncNumDoom == (numDoom + 1) then
			numDoom = numDoom + 1
			if self.db.profile.doom then
				self:Message(string.format(L["doomwarn"], numDoom, timer.doom), "Important")
			end
			if self.db.profile.doom then
				self:Bar(string.format(L["doombar"], numDoom + 1), timer.doom, icon.doom)
				self:DelayedMessage(timer.doom - 5, string.format(L["doomwarn5sec"], numDoom + 1), "Urgent")
			end
		end
	end
end



function module:Curse()
	if self.db.profile.curse then
		self:Message(L["cursewarn"], "Important")
		self:Bar(L["cursebar"], timer.curse, icon.curse)
	end
end


------------------------------
--      Utility	Functions   --
------------------------------

function module:SoftEnrage()
	timer.doom = timer.doomShort -- reduce doom timer from 30s to 15s
end

function module:Spore()
	numSpore = numSpore + 1

	if self.db.profile.spore then
		--self:Message(string.format(L["sporewarn"], numSpore), "Important")
		if not self.db.profile.groups then
			self:Bar(string.format(L["sporebar_group"], numSpore), timer.spore, icon.spore)
			if numSpore == 7 then
				numSpore = 0
			end
		else
			self:Bar(string.format(L["sporebar"], numSpore), timer.spore, icon.spore)
		end
	end
end

function module:CheckDebuff()
	if self.db.profile.debuff then
		local debuff = strlower(L["fungalBloom"])
		local tooltip=LoathebDebuff;
		local textleft1=getglobal(tooltip:GetName().."TextLeft1");

		for i=0, 15 do
			local id = GetPlayerBuff(i,"HARMFUL")
			tooltip:SetOwner(UIParent, "ANCHOR_NONE");
			tooltip:SetPlayerBuff(id);
			buffName = textleft1:GetText();
			tooltip:Hide();
			if ( buffName and strfind(strlower(buffName), debuff )) then
				local timeleft = GetPlayerBuffTimeLeft(id)
				if timeleft < timer.getNextSpore then
					self:TriggerEvent("BigWigs_ShowWarningSign", icon.sieni, timer.getNextSpore)
				elseif timeleft > timer.getNextSpore then
					self:TriggerEvent("BigWigs_HideWarningSign", icon.sieni)
				end
			elseif ( buffName==nil ) then
				break;
			end
		end
	end
end

function module:ConsumableWarning()
	if consumableslist[self.consumableseq] then
		if not self.db.profile.consumable then
			SendChatMessage(consumableslist[self.consumableseq], "RAID_WARNING")
			SendChatMessage(consumableslist[self.consumableseq], "SAY")
		end
		if self.db.profile.graphic then
			if consumableslist[self.consumableseq] == L["shadowpot"] then
				self.frameTexture:SetTexture("Interface\\Icons\\INV_Potion_23") --greater shadow protection
				self.frameTexture2:SetTexture(nil)
			elseif consumableslist[self.consumableseq] == L["bandage"] then
				self.frameTexture:SetTexture("Interface\\Icons\\INV_Misc_Bandage_12") -- heavy runecloth
				self.frameTexture2:SetTexture(nil)
			elseif consumableslist[self.consumableseq] == L["wrtorhs"] then
				self.frameTexture:SetTexture("Interface\\Icons\\INV_Stone_04") -- healthstone
				--self.frameTexture2:SetTexture("Interface\\Icons\\INV_Misc_Food_55") -- whipper root
			elseif consumableslist[self.consumableseq] == L["shadowpotandbandage"] then
				self.frameTexture:SetTexture("Interface\\Icons\\INV_Potion_23") --greater shadow protection
				self.frameTexture2:SetTexture("Interface\\Icons\\INV_Misc_Bandage_12") -- heavy runecloth
			elseif consumableslist[self.consumableseq] == L["noconsumable"] then
				self.frameTexture:SetTexture(nil)
				self.frameTexture2:SetTexture(nil)
			end
			self.frameIcon.texture = self.frameTexture
			self.frameTexture:SetTexCoord(0.0,1.0,0.0,1.0)
			self.frameIcon:SetPoint("CENTER",200,100)
			self.frameIcon:Show()

			self.frameIcon2.texture = self.frameTexture2
			self.frameTexture2:SetTexCoord(0.0,1.0,0.0,1.0)
			self.frameIcon2:SetPoint("CENTER",200,0)
			self.frameIcon2:Show()

			self:ScheduleEvent(function()
				self.frameIcon:Hide()
				self.frameIcon2:Hide()
			end, 5)
		end
		if self.db.profile.sound then
			if consumableslist[self.consumableseq] == L["shadowpot"] then
				PlaySoundFile(L["soundshadowpot"])
			elseif consumableslist[self.consumableseq] == L["bandage"] then
				PlaySoundFile(L["soundbandage"])
			elseif consumableslist[self.consumableseq] == L["wrtorhs"] then
				PlaySoundFile(L["soundwrtorhs"])
			elseif consumableslist[self.consumableseq] == L["shadowpotandbandage"] then
				PlaySoundFile(L["soundshadowpotandbandage"])
			end
		end
	end
end
