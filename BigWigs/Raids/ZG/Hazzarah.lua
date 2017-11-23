
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Hazza'rah", "Zul'Gurub")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Hazzarah",
	nightmaresummon_trigger = "Hazza\'rah casts Summon Nightmare Illusions\.",
	nightmaresummon_message = "Kill the spawns!",

	nightmaresummon_cmd = "spawns",
	nightmaresummon_name = "Spawns alert",
	nightmaresummon_desc = "Shows a warning when the boss summons Nightmare Illusions.",
} end )

L:RegisterTranslations("ruRU", function() return {--BY CFM
	nightmaresummon_trigger = "Хазза'рах применяет заклинание \"Вызов кошмарных иллюзий\"\.", -- не работает на Ligh's hope реализовано через скирпты, а не заклинание
	nightmaresummon_message = "Убейте вызванных существ!",

	nightmaresummon_name = "Оповещение о вызове",
	nightmaresummon_desc = "Показывает предупреждение, когда босс вызывает 3х Кошмарных иллюзий.",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Hazzarah",

	nightmaresummon_trigger = "Hazza\'rah wirkt Alptraumillusionen beschw\195\182ren\.",
	nightmaresummon_message = "T\195\182tet die Adds!",

	nightmaresummon_cmd = "spawns",
	nightmaresummon_name = "Alarm f\195\188r die Adds",
	nightmaresummon_desc = "Zeigt eine Warnung wenn der Boss Alptraumillusionen beschw\195\182rt.",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Hazzarah",
	nightmaresummon_trigger = "Hazza\'rah lanza Invocar ilusiones de pesadilla\.",
	nightmaresummon_message = "¡Matan los Ilusiones!",

	--nightmaresummon_cmd = "spawns",
	nightmaresummon_name = "Alerta de Ilusiones",
	nightmaresummon_desc = "Avisa cuando el jefe Invoque ilusiones de pesadilla",
} end )
---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"nightmaresummon", "bosskill"}


-- locals
local timer = {}
local icon = {}
local syncName = {
	illusions = "HazzarahIllusions"..module.revision,
}

------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")

	self:ThrottleSync(5, syncName.illusions)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	self.started = false
	berserkannounced = false
end

------------------------------
--      Events              --
------------------------------

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF(msg)
	if msg == L["nightmaresummon_trigger"] then
		self:Sync(syncName.illusions)
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.illusions and self.db.profile.nightmaresummon then
		self:Message(L["nightmaresummon_message"], "Important", true, "Alarm")
	end
end
