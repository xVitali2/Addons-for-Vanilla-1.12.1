-- Original implementation by:
-- brotherhobbes@gmail.com
-- Adapted further by Ammo

assert(oRA, "oRA not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("oRALLoot")

local lootmethods = {
	["Need before greed"] = "needbeforegreed",
	["Free for all"] = "freeforall",
	["Round robin"] = "roundrobin",
	["Master looter"] = "master",
	["Group loot"] = "group",
}

local lootthresholds = {
	[ITEM_QUALITY2_DESC] = 2,
	[ITEM_QUALITY3_DESC] = 3,
	[ITEM_QUALITY4_DESC] = 4,
	[ITEM_QUALITY5_DESC] = 5,
	[ITEM_QUALITY6_DESC] = 6,
}

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["Loot"] = true,
	["Leader/Loot"] = true,
	["Automatically set the loot method and threshold when forming a raid."] = true,
	["Method"] = true,
	["Threshold"] = true,
	["Set the loot method."] = true,
	["Set the loot threshold."] = true,
	["Free for all"] = true,
	["Round robin"] = true,
	["Master looter"] = true,
	["Group loot"] = true,
	["Need before greed"] = true,
	["<method>"] = true,
	["<threshold>"] = true,
	["Toggle whether or not setting the loot method/threshold is enabled."] = true,
	["Enable"] = true,
} end )

L:RegisterTranslations("ruRU", function() return {
	["Loot"] = "Добыча",
	["Leader/Loot"] = "Лидер/Добыча",
	["Automatically set the loot method and threshold when forming a raid."] = "Автоматически установить метод добычи и величину при формировании рейда",
	["Method"] = "Метод",
	["Threshold"] = "Величина",
	["Set the loot method."] = "Выбрать метод добычи.",
	["Set the loot threshold."] = "Установить величину добычи.",
	["Free for all"] = "каждый за себя",
	["Round robin"] = "по очереди",
	["Master looter"] = "ответственный за добычу",
	["Group loot"] = "Групповая очередь",
	["Need before greed"] = "'Нужно' перед 'Не откажусь'",
	["<method>"] = "<метод>",
	["<threshold>"] = "<величина>",
	["Toggle whether or not setting the loot method/threshold is enabled."] = "Вкл/Выкл любую из двух настроек добычи/велечины включены.",
	["Enable"] = "Включено",
} end )

L:RegisterTranslations("zhCN", function() return {
	["Loot"] = "拾取",
	["Leader/Loot"] = "团长/拾取",
	["Automatically set the loot method and threshold when forming a raid."] = "在团队中自动设定拾取方式与品质。",
	["Method"] = "方式",
	["Threshold"] = "品质",
	["Set the loot method."] = "设定拾取方式。",
	["Set the loot threshold."] = "设定拾取品质。",
	["Free for all"] = "自由拾取",
	["Round robin"] = "轮流拾取",
	["Master looter"] = "队长分配",
	["Group loot"] = "队伍分配",
	["Need before greed"] = "需求优先",
	["<method>"] = "<方式>",
	["<threshold>"] = "<品质>",
	["Toggle whether or not setting the loot method/threshold is enabled."] = "切换是否启用设置拾取方式/品质。",
	["Enable"] = "启用",
} end )

L:RegisterTranslations("zhTW", function() return {
	["Loot"] = "拾取",
	["Leader/Loot"] = "領隊/拾取",
	["Automatically set the loot method and threshold when forming a raid."] = "當團隊組成時自動設定成此拾取方式和品質",
	["Method"] = "拾取方式",
	["Threshold"] = "品質",
	["Set the loot method."] = "設定拾取方式",
	["Set the loot threshold."] = "設定拾取品質",
	["Free for all"] = "自由拾取",
	["Round robin"] = "輪流拾取",
	["Master looter"] = "隊長分配",
	["Group loot"] = "隊伍分配",
	["Need before greed"] = "需求優先",
	["<method>"] = "<拾取方式>",
	["<threshold>"] = "<品質>",
	["Toggle whether or not setting the loot method/threshold is enabled."] = "切换是否啟用設定拾取方式/品質。",
	["Enable"] = "啟用",
} end )

L:RegisterTranslations("frFR", function() return {
	["Loot"] = "Butin",
	["Leader/Loot"] = "Chef/Butin",
	["Automatically set the loot method and threshold when forming a raid."] = "Définit automatiquement la méthode de distribution du butin et son seuil lors de la formation d'un raid.",
	["Method"] = "Méthode",
	["Threshold"] = "Seuil",
	["Set the loot method."] = "Détermine la méthode de distribution du butin.",
	["Set the loot threshold."] = "Détermine le seuil du butin.",
	["Free for all"] = "Accès libre",
	["Round robin"] = "Chacun son tour",
	["Master looter"] = "Maître du butin",
	["Group loot"] = "Butin de groupe",
	["Need before greed"] = "Le besoin avant la cupidité",
	["<method>"] = "<méthode>",
	["<threshold>"] = "<seuil>",
	["Toggle whether or not setting the loot method/threshold is enabled."] = "Active ou non le paramétrage du seuil/de la méthode de butin.",
	["Enable"] = "Activer",
} end )

L:RegisterTranslations("deDE", function() return {
	["Loot"] = "Loot",
	["Leader/Loot"] = "Anführer/Loot",
	["Automatically set the loot method and threshold when forming a raid."] = "Legt automatisch die Lootmethode und -schwelle beim Erstellen einer Schlachtgruppe fest.",
	["Method"] = "Methode",
	["Threshold"] = "Schwelle",
	["Set the loot method."] = "Setzt die Lootmethode.",
	["Set the loot threshold."] = "Setzt die Plünderschwelle.",
	["Free for all"] = "Jeder gegen Jeden",
	["Round robin"] = "Reihum",
	["Master looter"] = "Plündermeister",
	["Group loot"] = "Plündern als Gruppe",
	["Need before greed"] = "Bedarf vor Gier",
	["<method>"] = "<methode>",
	["<threshold>"] = "<schwelle>",
	["Toggle whether or not setting the loot method/threshold is enabled."] = "Einstellungen für die Lootmethode und -schwelle aktivieren/deaktivieren.",
	["Enable"] = "Aktivieren",
} end )

L:RegisterTranslations("koKR", function() return {
	["Loot"] = "전리품",
	["Leader/Loot"] = "공격대장/전리품",
	["Automatically set the loot method and threshold when forming a raid."] = "전리품에 대한 설정입니다.",
	["Method"] = "방식",
	["Threshold"] = "품질 제한",
	["Set the loot method."] = "전리품 획득 방식을 설정합니다.",
	["Set the loot threshold."] = "전리품 획득 품질을 설정합니다.",
	["Free for all"] = "자유 획득",
	["Round robin"] = "차례대로 획득",
	["Master looter"] = "담당자가 획득",
	["Group loot"] = "주사위 굴림",
	["Need before greed"] = "주사위 굴림(착용자 우선)",
	["<method>"] = "<방식>",
	["<threshold>"] = "<품질>",
	["Toggle whether or not setting the loot method/threshold is enabled."] = "설정되지 않은 전리품 획득 방식/품질의 활성화 여부를 전환합니다.",
	["Enable"] = "활성화",
} end )

----------------------------------
--      Module Declaration      --
----------------------------------

oRALLoot = oRA:NewModule("lootleader")
oRALLoot.defaults = {
	method = L["Master looter"],
	threshold = ITEM_QUALITY2_DESC,
	master = UnitName("player"),
	enabled = false,
}
oRALLoot.leader = true
oRALLoot.name = L["Leader/Loot"]
oRALLoot.consoleCmd = "loot"
oRALLoot.consoleOptions = {
	type = "group", name = L["Loot"], desc = L["Automatically set the loot method and threshold when forming a raid."],
	args = {
		disable = {
			type = "toggle", name = L["Enable"], desc = L["Toggle whether or not setting the loot method/threshold is enabled."],
			get = function() return oRALLoot.db.profile.enabled end,
			set = function(v) oRALLoot.db.profile.enabled = v end,
		},
		method = {
			type = "text", name = L["Method"], desc = L["Set the loot method."],
			get = function() return oRALLoot.db.profile.method end,
			set = function(v) oRALLoot.db.profile.method = v end,
			validate = {
				L["Free for all"],
				L["Round robin"],
				L["Master looter"],
				L["Group loot"],
				L["Need before greed"],
			},
			usage = L["<method>"],
			disabled = function() return not IsRaidLeader() or not oRALLoot.db.profile.enabled end,
		},
		threshold = {
			type = "text", name = L["Threshold"], desc = L["Set the loot threshold."],
			get = function() return oRALLoot.db.profile.threshold end,
			set = function(v) oRALLoot.db.profile.threshold = v end,
			validate = {
				ITEM_QUALITY2_DESC,
				ITEM_QUALITY3_DESC,
				ITEM_QUALITY4_DESC,
				ITEM_QUALITY5_DESC,
				ITEM_QUALITY6_DESC,
			},
			usage = L["<threshold>"],
			disabled = function() return not IsRaidLeader() or not oRALLoot.db.profile.enabled end,
		},
	},
}

------------------------------
--      Initialization      --
------------------------------

function oRALLoot:OnEnable()
	self:RegisterEvent("oRA_PlayerPromoted")
	if IsRaidLeader() then
		self:oRA_PlayerPromoted()
	end
end

----------------------
-- Event handlers
----------------------

function oRALLoot:oRA_PlayerPromoted()
	if not self.db.profile.enabled then return end

	if not IsRaidLeader() then return end
	
	local method = lootmethods[L:GetReverseTranslation(self.db.profile.method)]
	local threshold = lootthresholds[self.db.profile.threshold]

	-- SetLootMethod("method"[,"masterPlayer" or ,threshold])
	-- method  "group", "freeforall", "master", "neeedbeforegreed", "roundrobin".
	-- threshold  0 poor  1 common  2 uncommon  3 rare  4 epic  5 legendary  6 artifact    
	SetLootMethod(method, self.db.profile.master, threshold)
	if method == "master" or method == "group" then
		self:ScheduleEvent("oralootthreshold", SetLootThreshold, 3, threshold)
	end
end