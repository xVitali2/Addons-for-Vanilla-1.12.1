local L = AceLibrary("AceLocale-2.0"):new("MobHealth3")

L:RegisterTranslations("enUS", function() return {
	["Save Data"] = true,
	["Save data across sessions. This is optional, and |cff00ff00not really needed|r. A cache is always kept that has data for every enemy you fought this session. Remember, recalculating an enemy's health is |cff00ff00TRIVIAL|r"] = true,
	["Estimation Precision"] = true,
	["Adjust how accurate you want MobHealth3 to be (A number 2-99). This is how many percent a mob's health needs to to change before we will trust the estimated maximum health and display it. The lower this value is, the quicker you'll see a value and the less accurate it will be. Raiding players may want to turn this down a bit. If you don't care about accuracy and want info ASAP, set this to 1."] = true,	
	["Stable Max"] = true,
	["When turned on, the max HP only updates once your target changes. If data for the target is unknown, MH3 will update once during the battle when the precision percentage is reached"] = true,    
	["Reset Cache/DB"] = true,
	["Reset the session cache and the DB if you have saving turned on"] = true,
	["Cache/Database reset"] = true,
	["Old MobHealth/MobHealth2/MobInfo2 database detected and converted. MH3 has also automatically turned on saving for you to preserve the data"] = true,
} end)

L:RegisterTranslations("ruRU", function() return {
	["Save Data"] = "Сохранить данные",
	["Save data across sessions. This is optional, and |cff00ff00not really needed|r. A cache is always kept that has data for every enemy you fought this session. Remember, recalculating an enemy's health is |cff00ff00TRIVIAL|r"] = "Сохранение данных во время сеанса. Это не обязательно, и |cff00ff00на самом деле не нужно|r. Кэш всегда сохраняется, когда есть данные противников, с которыми вы сражались в этом сеансе. Помните, что перерасчет вражеского здоровья является |cff00ff00ТРИВИАЛЬНЫМ|r",
	["Estimation Precision"] = "Оценка точности",
	["Adjust how accurate you want MobHealth3 to be (A number 2-99). This is how many percent a mob's health needs to to change before we will trust the estimated maximum health and display it. The lower this value is, the quicker you'll see a value and the less accurate it will be. Raiding players may want to turn this down a bit. If you don't care about accuracy and want info ASAP, set this to 1."] = "Отрегулируйте насколько вы хотите, чтобы MobHealth3 был точным (номер 2-99). Это количество процентов здоровья противника нуждающегося в измении, прежде чем мы будем доверять оценкам максимального запаса здоровья и отобразим его.",	
	["Stable Max"] = "Максимальная стабильность",
	["When turned on, the max HP only updates once your target changes. If data for the target is unknown, MH3 will update once during the battle when the precision percentage is reached"] = "Когда включено, максимальное здоровье обновляется только один раз при изменении вашей цели. Если данные для цели неизвестны, MH3 будет обновлен один раз во время битвы, когда процентная точность достигнется",    
	["Reset Cache/DB"] = "Сбросить кэш/БД",
	["Reset the session cache and the DB if you have saving turned on"] = "Сбрасывает кэш сеанса и БД, если вы включили экономию.",
	["Cache/Database reset"] = "Кэш/БД сброшены.",
	["Old MobHealth/MobHealth2/MobInfo2 database detected and converted. MH3 has also automatically turned on saving for you to preserve the data"] = "Обнаружена старая база данных MobHealth/MobHealth2/MobInfo2 и была конвертирована. MH3 также включается автоматически при сохранении для вас, чтобы сохранить данные",
} end)