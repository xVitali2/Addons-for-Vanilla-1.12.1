if( GetLocale() == "ruRU" ) then
--by CFM
--wsgui.lua
EF_L_GETREADYTOCAP = ' Будьте готовы вернуть!';
EF_L_EFCHASLESSTHAN = 'ВПФ имеет менее чем ';
EF_L_PERCHEALTH = '% здоровья!';
EF_L_CLICKTOTARGET = 'Нажать для цели ';
--spellcastingcore.lua
--Ваше заклинание \"%s\" исцеляет %s на %d ед. здоровья.
EF_L_HEALEDSELFOTHER='Ваше заклинание \"(.+)\" исцеляет (.+) на (.+) ед. здоровья';
--Ваше заклинание \"%s\" исцеляет %s на %d ед. здоровья: критический эффект.
EF_L_HEALEDCRITSELFOTHER='Ваше заклинание (.+) исцеляет (.+) на (.+) ед. здоровья: критический эффект';
--%s получает %d ед. здоровья от вашего заклинания \"%s\".
EF_L_PERIODICAURAHEALSELFOTHER='(.+) получает (.+) ед. здоровья от вашего заклинания \"(.+)\"';
--%s применяет заклинание \"%s\" и исцеляет %s на %d ед. здоровья.
EF_L_HEALEDOTHEROTHER='(.+) применяет заклинание \"(.+)\" и исцеляет (.+) на (.+) ед. здоровья';
--%s применяет заклинание \"%s\" и исцеляет %s на %d ед. здоровья: критический эффект.
EF_L_HEALEDCRITOTHEROTHER='(.+) применяет заклинание \"(.+)\" и исцеляет (.+) на (.+) ед. здоровья: критический эффект';
--%s выполняет действие Исчезновение"
EF_L_SPELLPERFORMGOOTHER='(.+) выполняет действие Исчезновение';
--Вы прервали заклинание \"%2$s\" %1$s.
EF_L_SPELLINTERRUPTSELFOTHER='Вы прервали заклинание \"(.+)\" (.+)';
--%1$s прерывает заклинание \"%3$s\" %2$s.
EF_L_SPELLINTERRUPTOTHEROTHER='(.+) прерывает заклинание \"(.+)\" (.+)';
--%s получает эффект \"%s\".
EF_L_AURAADDEDOTHERHELPFUL='(.+) получает эффект \"(.+)\"';
--Вы получаете эффект \"%s\".
EF_L_AURAADDEDSELFHELPFUL='Вы получаете эффект \"(.+)\"';
--%s находится под воздействием эффекта \"%s\".
EF_L_AURAADDEDOTHERHARMFUL='(.+) находится под воздействием эффекта \"(.+)\".';
--Вы находитесь под воздействием эффекта \"%s\".
EF_L_AURAADDEDSELFHARMFUL='Вы находитесь под воздействием эффекта \"(.+)\".';
--Действие эффекта \"%s\", наложенного на %s, заканчивается.
EF_L_AURAREMOVEDOTHER='Действие эффекта \"(.+)\", наложенного на (.+), заканчивается';
--%s теряет \"%s\".
EF_L_AURADISPELOTHER='(.+) теряет \"(.+)\"';
--Вы теряете \"%s\".
EF_L_AURADISPELSELF='Вы теряете \"(.+)\"';
--\"%2$s\" %1$s наносит %3$s %4$d ед. урона.
EF_L_SPELLLOGOTHEROTHER='\"(.+)\" (.+) наносит (.+) (.+) ед. урона';
--\"%2$s\" %1$s наносит %3$s %4$d ед. урона: критический эффект.
EF_L_SPELLLOGCRITOTHEROTHER='\"(.+)\" (.+) наносит (.+) (.+) ед. урона: критический эффект.';
--%3$s поглощает заклинание \"%2$s\" %1$s
EF_L_SPELLLOGABSORBOTHEROTHER='(.+) поглощает заклинание \"(.+)\" (.+)';
--Ваше заклинание \"%s\" наносит %s %d ед. урона.
EF_L_SPELLLOGSELFOTHER="Ваше заклинание \"(.+)\" наносит (.+) (.+) ед. урона";
--Ваше заклинание \"%s\" наносит %s %d ед. урона: критический эффект.
EF_L_SPELLLOGCRITSELFOTHER='Ваше заклинание \"(.+)\" наносит (.+) (.+) ед. урона: критический эффект.';
--%2$s поглощает ваше заклинание \"%1$s\".
EF_L_SPELLLOGABSORBSELFOTHER='(.+) поглощает ваше заклинание \"(.+)\".';
--%3$s сопротивляется заклинанию \"%2$s\" %1$s.
EF_L_SPELLRESISTOTHEROTHER="(.+) сопротивляется заклинанию \"(.+)\" (.+).";
--Вы сопротивляетесь заклинанию \"%2$s\" %1$s.
EF_L_SPELLRESISTOTHERSELF="Вы сопротивляетесь заклинанию \"(.+)\" (.+).";
--???
EF_L_ATTEMPTSTORUNAWAY='(.+) attempts to run away in fear!';
EF_L_UNITDIESSELF='Вы умерли.';
EF_L_UNITDIESOTHER='(.+) погибает.';
--%2$s убивает %1$s!
EF_L_PARTYKILLOTHER='(.+) убивает (.+).';
EF_L_SELFKILLOTHER='Вы убили (.+).';
--Вы получаете %d ед. здоровья от заклинания \"%s\".
EF_L_PERIODICAURAHEALSELFSELF='Вы получаете (.+) ед. здоровья от заклинания \"(.+)\".';
--Вы получаете %1$d ед. здоровья от заклинания \"%3$s\" %2$s.
EF_L_PERIODICAURAHEALOTHERSELF='Вы получаете (.+) ед. здоровья от заклинания \"(.+)\" (.+).';
--%1$s получает %2$d ед. здоровья от заклинания \"%4$s\" %3$s.
EF_L_PERIODICAURAHEALOTHEROTHER='(.+) получает (.+) ед. здоровья от заклинания \"(.+)\" (.+).';
--\"%2$s\" %1$s отнимает у %5$s %3$d ед. (%4$s).
EF_L_SPELLPOWERDRAINOTHEROTHER='\"(.+)\" (.+) отнимает у (.+) ед. маны';
--Вы получаете %1$d ед. урона (%2$s) от заклинания \"%4$s\" %3$s.
EF_L_PERIODICAURADAMAGEOTHERSELF='Вы получаете (.+) ед. урона ((.+)) от заклинания \"(.+)\" (.+).';
--%s получает %d ед. урона (%s) от вашего заклинания \"%s\".
EF_L_PERIODICAURADAMAGESELFOTHER='(.+) получает (.+) ед. урона ((.+)) от вашего заклинания \"(.+)\".';
--%1$s получает %2$d ед. урона (%3$s) от заклинания \"%5$s\" %4$s.
EF_L_PERIODICAURADAMAGEOTHEROTHER='(.+) получает (.+) ед. урона ((.+)) от заклинания \"(.+)\" (.+).';
--Вы применяете заклинание \"%s\".
EF_L_SPELLTERSE_SELF='Вы применяете заклинание \"(.+)\"';
--%s применяет заклинание \"%s\".
EF_L_SPELLTERSE_OTHER='(.+) применяет заклинание \"(.+)\"';
--%s начинает использовать \"%s\".
EF_L_SPELLCASTOTHERSTART='(.+) начинает использовать \"(.+)\"';
--???
EF_L_CRAFT='(.+) -> (.+).';
--%s выполняет действие \"%s\".
EF_L_SPELLPERFORMGOOTHER2='(.+) выполняет действие \"(.+)\"';
--%s начинает выполнять действие \"%s\".
EF_L_SPELLPERFORMOTHERSTART='(.+) начинает выполнять действие \"(.+)\"' ;
--%s выполняет действие \"%s\" на %s.
EF_L_SPELLPERFORMGOOTHERTARGETTED='(.+) выполняет действие \"(.+)\" на (.+).';
--Вы применяете заклинание \"%s\" на %s.
EF_L_SPELLCASTGOSELFTARGETTED='Вы применяете заклинание \"(.+)\" на (.+).';
--%s применяет заклинание \"%s\" на %s.
EF_L_SPELLCASTGOOTHERTARGETTED='(.+) применяет заклинание \"(.+)\" на (.+).';
EF_L_YOU='Вы';
--buffs.lua
	-- ROGUE
EF_L_KICK='Пинок';
EF_L_BLIND='Ослепление';
EF_L_CHEAPSHOT='Подлый трюк';
EF_L_GOUGE='Парализующий удар';
EF_L_KIDNEYSHOT='Удар по почкам';
EF_L_KICKSILENCED='Пинок - немота';
EF_L_MINDNUMBINGPOISON='Дурманящий яд';
EF_L_MINDNUMBINGPOISON2='Дурманящий яд II';
EF_L_MINDNUMBINGPOISON3='Дурманящий яд III';
EF_L_BLADEFLURRY='Шквал клинков';
EF_L_ADRENALINERUSH='Выброс адреналина';
EF_L_CRIPPLINGPOISON='Калечащий яд';
EF_L_DEADLYPOISONV='Смертельный яд V';
EF_L_EVASION='Ускользание';
EF_L_EXPOSEARMOR='Ослабление доспеха';
EF_L_GARROTE='Гаррота';
EF_L_GHOSTLYSTRIKE='Призрачный удар';
EF_L_HEMORRHAGE='Кровоизлияние';
EF_L_RIPOSTE='Ответный удар';
EF_L_SAP='Ошеломление';
EF_L_SPRINT='Спринт';
EF_L_WOUNDPOISONIV='Нейтрализующий яд IV';
EF_L_RUPTURE='Рваная рана';
	-- MAGE
EF_L_BLINK='Скачок';
EF_L_COUNTERSPELLSILENCED='Антимагия - немота';
EF_L_FIREWARD='Защита от огня';
EF_L_FROSTARMOR='Морозный доспех';
EF_L_FROSTWARD='Защита от магии льда';
EF_L_ICEBARRIER='Ледяная преграда';
EF_L_ICEARMOR='Ледяной доспех';
EF_L_ICEBLOCK='Ледяная глыба';
EF_L_IMPACT='Сотрясение';
EF_L_MAGEARMOR='Магический доспех';
EF_L_MANASHIELD='Щит маны';
EF_L_POLYMORPH='Превращение';
EF_L_POLYMORPHPIG='Превращение: свинья';
EF_L_POLYMORPHTURTLE='Превращение: черепаха';
EF_L_PRESENCEOFMIND='Величие разума';
EF_L_MINDQUICKENING='Скорость мысли';
EF_L_FIREBALL='Огненный шар';
EF_L_FROSTBOLT='Ледяная стрела';
EF_L_PYROBLAST='Огненная глыба';
EF_L_SCORCH='Ожог';
EF_L_ARCANEPOWER='Мощь тайной магии';
EF_L_BLASTWAVE='Взрывная волна';
EF_L_CLEARCASTING='Ясность мысли';
EF_L_CONEOFCOLD='Конус холода';
EF_L_CHILLED='Окоченение';
EF_L_FROSTBITE='Обморожение';
EF_L_FROSTNOVA='Кольцо льда';
EF_L_SLOWFALL='Замедленное падение';
EF_L_WINTERSCHILL='Зимняя стужа';
EF_L_FIREVULNERABILITY='Уязвимость к огню';
EF_L_AMPLIFYMAGIC='Усиление магии';
EF_L_ARCANEINTELLECT='Чародейский интеллект';
EF_L_DAMPENMAGIC='Ослабление магии';
EF_L_REMOVELESSERCURSE='Снятие малого проклятия';
EF_L_IMPROVEDSCORCH='Улучшенный ожог';
EF_L_BLIZZARD='Снежная буря';
	-- PALADIN
EF_L_DIVINEINTERVENTION='Божественное вмешательство';
EF_L_DIVINEPROTECTION='Божественная защита';
EF_L_DIVINESHIELD='Божественный щит';
EF_L_HAMMEROFJUSTICE='Молот правосудия';
EF_L_SEALOFTHECRUSADER='Печать воина Света';
EF_L_SEALOFRIGHTEOUSNESS='Печать праведности';
EF_L_STUN='Оглушение';
EF_L_BLESSINGOFSACRIFICE='Благословение жертвенности';
EF_L_BLESSINGOFPROTECTION='Благословение защиты';
EF_L_BLESSINGOFFREEDOM='Благословение свободы';
EF_L_BLESSINGOFKINGS='Благословение королей';
EF_L_FORBEARANCE='Воздержанность';
EF_L_JUDGEMENTOFTHECRUSADER='Правосудие воина света';
EF_L_JUDGEMENTOFJUSTICE='Правосудие справедливости';
EF_L_JUDJEMENTOFLIGHT='Правосудие света';
EF_L_JUDGEMENTOFWISDOM='Правосудие мудрости';
EF_L_REPENTANCE='Покаяние';
EF_L_SEALOFCOMMAND='Печать повиновения';
EF_L_SEALOFJUSTICE='Печать справедливости';
EF_L_SEALOFLIGHT='Печать Света';
EF_L_SEALOFWISDOM='Печать мудрости';
EF_L_VENGEANCE='Отмщение';
EF_L_VINDICATION='Оправдание';
EF_L_BLESSINGOFMIGHT='Благословение могущества';
EF_L_BLESSINGOFSANCTUARY='Благословение неприкосновенности';
EF_L_BLESSINGOFWISDOM='Благословение мудрости';
EF_L_CLEANSE='Очищение';
EF_L_FLASHOFLIGHT='Вспышка Света';
EF_L_HOLYLIGHT='Свет небес';
EF_L_LAYOFHANDS='Возложение рук';
EF_L_PURIFY='Омовение';
	-- PRIEST
EF_L_BLACKOUT='Затмение';
EF_L_INNERFIRE='Внутренний огонь';
EF_L_PSYCHICSCREAM='Ментальный крик';
EF_L_SILENCE='Безмолвие';
EF_L_ABOLISHDISEASE='Устранение болезни';
EF_L_DEVOURINGPLAGUE='Всепожирающая чума';
EF_L_LIGHTWELLRENEW='Обновление колодца Света';
EF_L_MINDFLAY='Пытка разума';
EF_L_POWERWORDSHIELD='Слово силы: Щит';
EF_L_POWERINFUSION='Придание сил';
EF_L_SHADOWVULNERABILITY='Уязвимость к Тьме';
EF_L_SHADOWWORDPAIN='Слово Тьмы: Боль';
EF_L_RENEW='Обновление';
EF_L_WEAKENEDSOUL='Ослабленная душа';
EF_L_HEAL='Исцеление';
EF_L_CUREDISEASE='Излечение болезни';
EF_L_DIVINESPIRIT='Божественный дух';
EF_L_LESSERHEAL='Малое исцеление';
EF_L_GREATERHEAL='Великое исцеление';
EF_L_SHADOWPROTECTION='Защита от темной магии';
EF_L_FEARWARD='Защита от страха';
EF_L_FLASHHEAL='Быстрое исцеление';
EF_L_POWERWORDFORTITUDE='Слово силы: Стойкость';
EF_L_MINDBLAST='Взрыв разума';
	-- SHAMAN
EF_L_EARTHSHOCK='Земной шок';
EF_L_ELEMENTALMASTERY='Покорение стихий';
EF_L_GHOSTWOLF='Призрачный волк';
EF_L_LIGHTNINGSHIELD='Щит молний';
EF_L_CHAINHEAL='Цепное исцеление';
EF_L_CHAINLIGHTNING='Цепная молния';
EF_L_FARSIGHT='Дальнее зрение';
EF_L_HEALINGWAVE='Волна исцеления';
EF_L_LESSERHEALINGWAVE='Малая волна исцеления';
EF_L_LIGHTNINGBOLT='Молния';
EF_L_EARTHBIND='Оковы земли';
EF_L_FLAMESHOCK='Огненный шок';
EF_L_FOCUSEDCASTING='Средоточие заклинаний';
EF_L_FROSTSHOCK='Ледяной шок';
EF_L_GROUNDINGTOTEMEFFECT='Эффект Тотема заземления';
EF_L_HEALINGWAY='Путь исцеления';
EF_L_MANATIDETOTEM='Тотем прилива маны';
EF_L_STORMSTRIKE='Удар бури';
	-- WARLOCK
EF_L_DEATHCOIL='Лик смерти';
EF_L_FEAR='Страх';
EF_L_SHADOWWARD='Защита от темной магии';
EF_L_SPELLLOCK='Запрет чар';
EF_L_CURSEOFTONGUES='Проклятие косноязычия';
EF_L_CURSEOFTHEEYE='Проклятие ока';
EF_L_SHADOWTRANCE='Теневой транс';
EF_L_SHADOWBOLT='Стрела Тьмы';
EF_L_FELDOMINATION='Господство Скверны';
EF_L_SUMFELHUNTER='Призыв охотника Скверны';
EF_L_SUMIMP='Призыв беса';
EF_L_SUMSUCCUBUS='Призыв суккуба';
EF_L_SUMVOIDWALKER='Призыв демона Бездны';
EF_L_CORRUPTION='Порча';
EF_L_CURSEOFAGONY='Проклятие агонии';
EF_L_CURSEOFEXHAUSTION='Проклятие изнеможения';
EF_L_SIPHONLIFE='Вытягивание жизни';
EF_L_SHADOWBURN='Ожог Тьмы';
EF_L_SEDUCTION='Соблазн';
EF_L_IMMOLATE='Жертвенный огонь';
EF_L_HEALTHFUNNEL='Канал здоровья';
EF_L_DRAINSOUL='Похищение души';
EF_L_DRAINMANA='Похищение маны';
EF_L_DRAINLIFE='Похищение жизни';
	-- WARRIOR
EF_L_PUMMEL='Зуботычина';
EF_L_SHIELDBASH='Удар щитом';
EF_L_CHARGESTUN='Атака-оглушение';
EF_L_CONCUSSIONBLOW='Оглушающий удар';
EF_L_INTERCEPTSTUN='Перехват оглушение';
EF_L_INTIMIDATINGSHOUT='Устрашающий крик';
EF_L_MACESTUNEFFECT='Эффект оглушения дробящего оружия';
EF_L_REVENGESTUN='Реванш - оглушение';
EF_L_SHIELDBASHSILENCED='Удар щитом - немота';
EF_L_BERSERKERRAGE='Ярость берсерка';
EF_L_BLOODRAGE='Кровавая ярость';
EF_L_BLOODTHIRST='Кровожадность';
EF_L_CHALLENGINGSHOUT='Вызывающий крик';
EF_L_CHARGE='Рывок';
EF_L_DEATHWISH='Жажда смерти';
EF_L_DEEPWOUNDS='Глубокие раны';
EF_L_DEMORALIZINGSHOUT='Деморализующий крик';
EF_L_DISARM='Разоружение';
EF_L_HAMSTRING='Подрезать сухожилия';
EF_L_IMPROVEDHAMSTRING='Улучшенное подрезание сухожилий';
EF_L_LASTSTAND='Ни шагу назад';
EF_L_MORTALSTRIKE='Смертельный удар';
EF_L_REND='Кровопускание';
EF_L_RETALIATION='Возмездие';
EF_L_SHIELDBLOCK='Блок щитом';
EF_L_SHIELDWALL='Глухая оборона';
EF_L_SWEEPINGSTRIKES='Размашистые удары';
EF_L_THUNDERCLAP='Удар грома';
EF_L_ENRAGE='Бешенство';
	-- DRUID
EF_L_BASH='Оглушить';
EF_L_BEARFORM='Облик медведя';
EF_L_CATFORM='Облик кошки';
EF_L_DIREBEARFORM='Облик лютого медведя';
EF_L_FERALCHARGEEFFECT='Звериная атака - эффект';
EF_L_MOONKINFORM='Облик лунного совуха';
EF_L_NATURESWIFTNESS='Природная стремительность';
EF_L_POUNCE='Наскок';
EF_L_TRAVELFORM='Походный облик';
EF_L_STARFIRESTUN='Звездный огонь - оглушение';
EF_L_WRATH='Гнев';
EF_L_SOOTHEANIMAL='Умиротворение животного';
EF_L_REGROWTH='Восстановление';
EF_L_REBIRTH='Возрождение';
EF_L_HIBERNATE='Спячка';
EF_L_HEALINGTOUCH='Целительное прикосновение';
EF_L_ENTANGLINGROOTS='Гнев деревьев';
EF_L_BARKSKIN='Дубовая кожа';
EF_L_ABOLISHPOISON='Устранение яда';
EF_L_DASH='Порыв';
EF_L_DEMORALIZINGROAR='Устрашающий рев';
EF_L_ENRAGED='Исступление';
EF_L_FRENZIEDREGENERATION='Неистовое восстановление';
EF_L_GROWL='Рык';
EF_L_INNERVATE='Озарение';
EF_L_INSECTSWARM='Рой насекомых';
EF_L_NATURESGRACE='Благоволение природы';
EF_L_NATURESGRASP='Хватка природы';
EF_L_RAKE='Глубокая рана';
EF_L_MOONFIRE='Лунный огонь';
EF_L_RIP='Разорвать';
EF_L_TIGERSFURY='Тигриное неистовство';
EF_L_REJUVENATION='Омоложение';
EF_L_CUREPOISON='Выведение яда';
EF_L_MARKOFTHEWILD='Знак дикой природы';
EF_L_REMOVECURSE='Снятие проклятия';
	-- HUNTER
EF_L_ASPECTOFTHECHEETAH='Дух гепарда';
EF_L_ASPECTOFTHEHAWK='Дух ястреба';
EF_L_ASPECTOFTHEMONKEY='Дух обезьяны';
EF_L_FREEZINGTRAPEFFECT='Эффект замораживающей ловушки';
EF_L_IMPROVEDCONCUSSIVESHOT='Улучшенный контузящий выстрел';
EF_L_INTIMIDATION='Устрашение';
EF_L_SCATTERSHOT='Дезориентирующий выстрел';
EF_L_WYVERNSTING='Укус виверны';
EF_L_RAPIDFIRE='Быстрая стрельба';
EF_L_AIMEDSHOT='Прицельный выстрел';
EF_L_BESTIALWRATH='Звериный гнев';
EF_L_CONCUSSIVESHOT='Контузящий выстрел';
EF_L_COUNTERATTACK='Контратака';
EF_L_DETERRENCE='Сдерживание';
EF_L_IMMOLATIONTRAPEFFECT='Эффект обжигающей ловушки';
EF_L_IMPROVEDWINGCLIP='Безжалостно подрезать крылья';
EF_L_QUICKSHOTS='Скорострельность';
EF_L_SCAREBEAST='Отпугивание зверя';
EF_L_SCORPIDSTING='Укус скорпида';
EF_L_SERPENTSTING='Укус змеи';
EF_L_VIPERSTING='Укус гадюки';
EF_L_WINGCLIP='Захват крылом';
	-- MISC
EF_L_INFERNOEFFECT='Эффект инфернала';
EF_L_IRONGRENADE='Железная граната';
EF_L_RECKLESSCHARGE='Безрассудная атака';
EF_L_TIDALCHARM='Приливное подчинение';
EF_L_THORIUMGRENADE='Ториевая граната';
EF_L_FANGOFTHECRYSTALSPIDER='Клык Хрустального Паука';
EF_L_WARSTOMP='Громовая поступь';
EF_L_FIRSTAID='Первая помощь';
EF_L_FLEE='Бегство';
EF_L_FREEACTION='Свободное действие';
EF_L_INVULNERABILITY='Неуязвимость';
EF_L_LIVINGFREEACTION='Живая свобода';
EF_L_NETOMATIC='Сетестрел';
EF_L_PERCEPTION='Внимательность';
EF_L_RECENTLYBANDAGED='Недавняя перевязка';
EF_L_SLEEP='Сон';
EF_L_STONEFORM='Каменная форма';
EF_L_WARDOFTHEEYE='Оберег от сглаза';
EF_L_WILLOFTHEFORSAKEN='Воля Отрекшихся';
EF_L_FLASHBOMB='Световая бомба';
EF_L_FIREREFLECTOR='Отражатель пламени';
EF_L_FROSTREFLECTOR='Зеркало Льда';
EF_L_SHADOWREFLECTOR='Отражатель теней';
EF_L_CONTROLLEDSTUN='Контролируемое оглушение';
EF_L_CONTROLLEDROOT='Контролируемые корни';
EF_L_DISORIENT='Дезориентация';
--spells.lua
EF_L_FISHING='Рыбная ловля';
EF_L_GREATERHEALINGPOTION='Средний флакон с лечебным зельем';
EF_L_GREATERFIREPROTECTIONPOTION='Сильное зелье защиты от огня';
EF_L_MAGEBLOODPOTION='Эликсир крови волшебника';
EF_L_MAJORHEALINGPOTION='Огромный флакон с лечебным зельем';
EF_L_MAJORMANAPOTION='Огромный флакон с зельем маны';
EF_L_MANAPOTION='Зелье маны';
EF_L_SWIFTNESSPOTION='Зелье скорости';
EF_L_TRANSMUTEARCANITE='Трансмутация: арканит';
EF_L_ROUGHSHARPENINGSTONE='Грубое точило';
EF_L_ROUGHWEIGHTSTONE='Грубое грузило';
EF_L_COARSESHARPENINGSTONE='Зернистое точило';
EF_L_COARSEWEIGHTSTONE='Зернистое грузило';
EF_L_HEAVYSHARPENINGSTONE='Тяжелое точило';
EF_L_HEAVYWEIGHTSTONE='Тяжелое грузило';
EF_L_SOLIDSHARPENINGSTONE='Твердое точило';
EF_L_SOLIDWEIGHTSTONE='Твердое грузило';
EF_L_DENSESHARPENINGSTONE='Массивное точило';
EF_L_DENSEWEIGHTSTONE='Массивное грузило';
EF_L_SMOKEDSAGEFISH='Копченый шалфокунь';
EF_L_SAVORYDEVIATEDELIGHT='Загадочное острое лакомство';
EF_L_THISTLETEA='Артишоковый чай';
EF_L_ENCHANTCHESTMINORMANA='Чары для нагрудника - мана I';
EF_L_ENCHANTEDLEATHER='Зачарованная кожа';
EF_L_ROUGHBLASTINGPOWDER='Грубое взрывчатое вещество';
EF_L_COARSEBLASTINGPOWDER='Низкосортное взрывчатое вещество';
EF_L_HEAVYBLASTINGPOWDER='Тяжелое взрывчатое вещество';
EF_L_SOLIDBLASTINGPOWDER='Твердое взрывчатое вещество';
EF_L_DENSEBLASTINGPOWDER='Концентрированное взрывчатое вещество';
EF_L_ARCLIGHTSPANNER='Тангенциальный вращатель';
EF_L_COPPERMODULATOR='Медный регулятор';
EF_L_HANDFULOFCOPPERBOLTS='Горсть медных винтов';
EF_L_LINENBANDAGE='Льняные бинты';
EF_L_HEAVYLINENBANDAGE='Плотные льняные бинты';
EF_L_WOOLBANDAGE='Шерстяные бинты';
EF_L_HEAVYWOOLBANDAGE='Плотные шерстяные бинты';
EF_L_SILKBANDAGE='Шелковые бинты';
EF_L_HEAVYSILKBANDAGE='Плотные шелковые бинты';
EF_L_MAGEWEAVEBANDAGE='Бинты из магической ткани';
EF_L_HEAVYMAGEWEAVEBANDAGE='Плотные бинты из магической ткани';
EF_L_RUNECLOTHBANDAGE='Бинты из рунической ткани';
EF_L_HEAVYRUNECLOTHBANDAGE='Плотные бинты из рунической ткани';
EF_L_SKINNING='Снятие шкур';
EF_L_SMELTCOPPER='Выплавка меди';
EF_L_COPPERBAR='Медная руда';
EF_L_SMELTTIN='Выплавка олова';
EF_L_SMELTBRONZE='Выплавка бронзы';
EF_L_SMELTSILVER='Выплавка серебра';
EF_L_SMELTGOLD='Выплавка золота';
EF_L_SMELTIRON='Выплавка железа';
EF_L_SMELTMITHRIL='Выплавка мифрила';
EF_L_SMELTTRUESILVER='Выплавка истинного серебра';
EF_L_SMELTTHORIUM='Выплавка тория';
EF_L_THORIUMBAR='Ториевая руда';
EF_L_BOLTOFLINENCLOTH='Рулон льняной ткани';
EF_L_BOLTOFWOOLENCLOTH='Рулон шерсти';
EF_L_BOLTOFSILKCLOTH='Рулон шелка';
EF_L_BOLTOFMAGEWEAVE='Рулон магической ткани';
EF_L_BOLTOFRUNECLOTH='Рулон рунической ткани';
EF_L_EXPLODE='Взрывание';
EF_L_SHADOWFLAME='Теневое пламя';
EF_L_WINGBUFFET='Взмах крылом';
EF_L_BELLOWINGROAR='Раскатистый рев';
EF_L_FLAMEBUFFET='Удар пламенем';
EF_L_BREATH='Дыхание';
EF_L_DARKMENDING='Исцеление тьмой';
EF_L_DOMINATEMIND='Господство над разумом';
EF_L_ELEMENTALFIRE='Первородный огонь';
EF_L_MAGMABLAST='Вспышка магмы';
EF_L_SUMMONRAGNAROS='Призвание Рагнароса';
EF_L_ARCANEBOLT='Чародейская стрела';
EF_L_BANSHEEWAIL='Вой банши';
EF_L_VENOMSPIT='Отравляющий плевок';
EF_L_ESCAPEARTIST='Мастер побега';
EF_L_HEARTHSTONE='Камень возвращения';
--!!!!!!!!!!!!!!!!!!!!!
EF_L_MAGICDUST='Волшебная пыль';
EF_L_ROUGHCOPPERBOMB='Грубая медная бомба';
EF_L_LARGECOPPERBOMB='Большая медная бомба';
EF_L_SMALLBRONZEBOMB='Небольшая бронзовая бомба';
EF_L_BIGBRONZEBOMB='Большая бронзовая бомба';
EF_L_BIGIRONBOMB='Большая железная бомба';
EF_L_MITHRILFRAGBOMB='Мифриловая осколочная бомба';
EF_L_HIEXPLOSIVEBOMB='Фугасная бомба';
EF_L_DARKIRONBOMB='Бомба из черного железа';
EF_L_ARCANEBOMB='Чародейская бомба';
EF_L_ACIDSPIT='Кислотный плевок';
EF_L_BOMB='Бомба';
EF_L_BLACKSLUDGE='Черная слизь';
EF_L_BOULDER='Валун';
EF_L_CHAINEDBOLT='Звенья молний';
EF_L_CHAINSOFICE='Ледяные оковы';
EF_L_CLONE='Двойник';
EF_L_CREEPINGMOLD='Ползучая плесень';
EF_L_CRIPPLE='Увечье';
EF_L_CRYSTALFLASH='Хрустальная вспышка';
EF_L_CRYSTALGAZE='Хрустальный взгляд';
EF_L_CRYSTALLINESLUMBER='Хрустальный сон';
EF_L_CULTIVATEPACKETOFSEEDS='Посадка пакетов семян';
EF_L_CURSEOFMENDING='Проклятие восстановления';
EF_L_CURSEOFTHEDEADWOOD='Проклятие Мертвого Леса';
EF_L_CURSEOFTHEFALLENMAGRAM='Проклятье павших Маграм';
EF_L_DARKSLUDGE='Темная жижа';
EF_L_DIREGROWL='Лютый рык';
EF_L_FEVEREDFATIQUE='Болезненная усталость';
EF_L_FIRESHIELD2='Огненный щит II';
EF_L_FLAMESPIKE='Пламенный шип';
EF_L_FLAMESPIT='Огненный плевок';
EF_L_FREEZESOLID='Полная заморозка';
EF_L_FURBOLGFORM='Образ фурболга';
EF_L_DISEASEDSLIME='Заразная слизь';
EF_L_DISENCHANT='Распыление';
EF_L_DRINKMINORPOTION='Глоток малого зелья';
EF_L_DYNAMITE='Динамит';
EF_L_EARTHGRABTOTEM='Тотем хватки Земли';
EF_L_EXPLODINGSHOT='Взрывной выстрел';
EF_L_ICICLE='Сосулька';
EF_L_INKSPRAY='Чернильные брызги';
EF_L_HEALINGWARD='Исцеляющий древень';
EF_L_HOLYSMITE='Божественная кара';
EF_L_LIZARDBOLT='Ящеричья молния';
EF_L_PLAGUECLOUD='Чумное облако';
EF_L_PLAGUEMIND='Мысленная чума';
EF_L_POISONEDSHOT='Ядовитый выстрел';
EF_L_QUICKFLAMEWARD='Быстрый оберег от пламени';
EF_L_SHRINK='Уменьшение';
EF_L_SILITHIDPOX='Silithid Pox';
EF_L_SLOWINGPOISON='Slowing Poison';
EF_L_TOXICSPIT='Toxic Spit';
EF_L_TRALANESFREEZINGTOUCH='Trelane\'s Freezing Touch';
EF_L_WANDERINGPLAGUE='Wandering Plague';
EF_L_WEAKFROSTBOLT='Weak Frostbolt';
EF_L_WITHERTOUCH='Wither Touch';
EF_L_SLAM='Мощный удар';
EF_L_SHOOT='Выстрел';
EF_L_ARCANEEXPLOSION='Чародейский взрыв';
EF_L_FIREBLAST='Огненный взрыв';
EF_L_HOLYSHOCK='Шок небес';
EF_L_HOLYNOVA='Кольцо света';
EF_L_TRANQUILITY='Спокойствие';
EF_L_RAINOFFIRE='Огненный ливень';
EF_L_MINDVISION='Внутреннее зрение';
EF_L_EVOCATION='Прилив сил';
EF_L_ARCANEMISSILES='Чародейские стрелы';
EF_L_ARCANEMISSILE='Чародейский снаряд';
EF_L_EYESOFTHEBEAST='Звериный глаз';
EF_L_EAGLEEYE='Орлиный глаз';
EF_L_HURRICANE='Гроза';
EF_L_GNOMISHDEATHRAY='Смертоносный луч гномов';
EF_L_SUMMONFELSTEED='Призывание коня Скверны';
EF_L_SUMMONDREADSTEED='Призыв коня погибели';
EF_L_SOULSTONERESURRECTION='Воскрешение камнем души';
EF_L_SOULFIRE='Ожог души';
EF_L_SEARINGPAIN='Жгучая боль';
EF_L_RITUALOFSUMMONING='Ритуал призыва';
EF_L_RITUALOFDOOM='Ритуал Рока';
EF_L_INFERNO='Инфернал';
EF_L_HOWLOFTERROR='Вой ужаса';
EF_L_ENSLAVEDEMON='Порабощение демона';
EF_L_CREATESOULSTONEMAJOR='Создание камня души (крупного)';
EF_L_CREATESPELLSTONE='Создание камня чар';
EF_L_CREATEHEALSTONEMAJOR='Создание камня здоровья (крупного)';
EF_L_CREATEFIRESTONE='Создание камня огня';
EF_L_BANISH='Изгнание';
EF_L_ASTRALRECALL='Астральное возвращение';
EF_L_ANCESTRALSPIRIT='Дух предков';
EF_L_PICKLOCK='Взлом замка';
EF_L_DEADLYPOISONIV='Смертельный яд IV';
EF_L_DEADLYPOISONIII='Смертельный яд III';
EF_L_DEADLYPOISONII='Смертельный яд II';
EF_L_DEADLYPOISON='Смертельный яд';
EF_L_INSTANTPOISONVI='Быстродействующий яд VI';
EF_L_INSTANTPOISONV='Быстродействующий яд V';
EF_L_INSTANTPOISONIV='Быстродействующий яд IV';
EF_L_INSTANTPOISONIII='Быстродействующий яд III';
EF_L_INSTANTPOISONII='Быстродействующий яд II';
EF_L_INSTANTPOISON='Быстродействующий яд';
EF_L_DISARMTRAP='Обезвреживание ловушки';
EF_L_SMITE='Кара';
EF_L_SHACKLEUNDEAD='Сковывание нежити';
EF_L_RESURRECTION='Воскрешение';
EF_L_PRAYEROFHEALING='Молитва исцеления';
EF_L_MINDCONTROL='Контроль над разумом';
EF_L_MANABURN='Сожжение маны';
EF_L_HOLYFIRE='Священный огонь';
EF_L_TURNUNDEAD='Изгнание нежити';
EF_L_SUMMONCHARGER='Призыв скакуна';
EF_L_SUMMONWARHORSE='Вызов боевого коня';
EF_L_REDEMPTION='Искупление';
EF_L_HOLYWRATH='Гнев небес';
EF_L_HAMMEROFWRATH='Молот гнева';
EF_L_FLAMESTRIKE='Огненный столб';
EF_L_TELEPORTUNDERCITY='Телепортация: Подгород';
EF_L_TELEPORTSTORMWIND='Телепортация: Штормград';
EF_L_TELEPORTORGRIMMAR='Телепортация: Оргриммар';
EF_L_TELEPORTIRONFORGE='Телепортация: Стальгорн';
EF_L_TELEPORTTHUNDERBLUFF='Телепортация: Громовой Утес';
EF_L_TELEPORTDARNASSUS='Телепортация: Дарнас';
EF_L_PORTALUNDERCITY='Портал в Подгород';
EF_L_PORTALSTORMWIND='Портал в Штормград';
EF_L_PORTALORGRIMMAR='Портал в Оргриммар';
EF_L_PORTALIRONFORGE='Портал в Стальгорн';
EF_L_PORTALTHUNDERBLUFF='Портал в Громовой Утес';
EF_L_PORTALDARNASSUS='Портал: Дарнас';
EF_L_CONJUREMANARUBY='Сотворение рубина маны';
EF_L_CONJUREMANAJADE='Сотворение нефрита маны';
EF_L_CONJUREMANACITRINE='Сотворение цитрина маны';
EF_L_CONJUREMANAAGATE='Сотворение агата маны';
EF_L_CONJUREWATER='Сотворение воды';
EF_L_CONJUREFOOD='Сотворение пищи';
EF_L_REVIVEPET='Воскрешение питомца';
EF_L_MULTISHOT='Залп';
EF_L_DISMISSPET='Прогнать питомца';
EF_L_TELEPORTMOONGLADE='Телепортация: Лунная поляна';
EF_L_STARFIRE='Звездный огонь';
--BindingsHandler.lua
EF_L_ENEMYFRAMESKEYBINDS="Enemy Frames клавишы";
EF_L_ASSIGNSKULLTOTARGET="Назначить Череп на цель";
EF_L_TARGETSKULL="Цель Череп";
EF_L_ASSIGNSTARTOTARGET="Назначить Звезду на цель";
EF_L_ASSIGNMOONTOTARGET="Назначить Луну на цель";
EF_L_ASSIGNSQUARETOTARGET="Назначить Квадрат на цель";
EF_L_ASSIGNDIAMONDTOTARGET="Назначить Ромб на цель";
EF_L_ASSIGNCROSSTOTARGET="Назначить Перекрестие на цель";
EF_L_ASSIGNCIRCLETOTARGET="Назначить Круг на цель";
EF_L_ASSIGNTRIANGLETOTARGET="Назначить Треугольник на цель";
--incomingspells
EF_L_INCOMINGSPELLS='входящие заклинания';
--targetframe
EF_L_3_5s='3.5c';
--nameplateshandler
EF_L_S='c';
--wsgui.lua
EF_L_ALLIANCE='альянс';
EF_L_HORDE='орда';
--enemyFrames.lua
EF_L_SETTINGSMENU='меню настроек';
EF_L_PLAYER='Игрок';
EF_L_H='О ';
EF_L_A='А ';
EF_L_HORDE2='Орда';
EF_L_ALLIANCE2='Альянс';
EF_L_S2='С';
--wsghandler.lua
EF_L_THEWASPICKEDUPBY='The (.+) (.+) was picked up by (.+)!';
EF_L_THEWASDROPPEDBY='The (.+) (.+) was dropped by (.+)!';
EF_L_CAPTUREDTHE='captured the (.+) (.+)!';
--paladin.lua
EF_L_SEALOF='(.+) (.+) \"Печать (.+)\".';
EF_L_GAIN='получаете';
EF_L_GAINS='получает';
EF_L_SEALOFFADESFROM='\"Печать (.+)\", наложенного на (.+), заканчивается.';
EF_L_JUDGEMENT='(.+) (.+) \"Правосудие\".';
EF_L_CAST='применяете';
EF_L_CASTS='применяет';
EF_L_JUDGEMENTOF='\"Правосудие ';
EF_L_HITFOR='(.+) наносите (.+) (.+) ед. урона.';
EF_L_CRITFOR='(.+) наносите (.+) (.+) ед. урона: критический удар.';
EF_L_HITSFOR='(.+) наносит (.+) (.+) ед. урона.';
EF_L_CRITSFOR='(.+) наносит (.+) (.+) ед. урона: критический удар.';
--UIelementstemplate
EF_L_YOU2='Вы';
--features.lua
EF_L_ENABLEOUTSIDEOFBATTLEGROUNS='Включить вне полей боя';
EF_L_MOUSEOVERCASTONFRAMES='Произн. закл. наведением мыши на фреймы';
EF_L_MOVEABLETARGETCASTBAR='Перемещаемая полоса произн. закл. цели';
EF_L_INTEGRATEDTARGETCASTBAR='Интегрированная полоса произн. закл. цели';
EF_L_PRIODEBUFFONTARGETPORTRAIT='Приоритет отриц. эфф. на портрете цели';
EF_L_PRIODEBUFFONPLAYERPORTRAIT='Приоритет отриц. эфф. на портрете игрока';
EF_L_DEBUFFTIMERSONTARGET='Таймеры отриц. эффектов на цели';
EF_L_INCOMINGSPELLSBGSONLY='Входящие заклинания (только ПБ)';
EF_L_CLASSCOLOREDMAPBLIPS='Цвета классов на карте';
EF_L_LOWHEALTHEFCANN='Оповещение о низком здоровье ВПФ';
EF_L_FEATURES='Особенности';
EF_L_BATTLEGROUNDS='Поля боя';
--general.lua
EF_L_SHOWENEMYFRAMES='Показывать enemyFrames';
EF_L_SCALE='масштаб';
EF_L_LAYOUT='слой';
EF_L_ENEMYFRAMESBYKUURTS='enemyFrames от kuurtz \nвер. - |cffffff00';
EF_L_VER='( !ver ';
EF_L_AVAILABLE=' доступна! )';
--nameplates.lua
EF_L_NAMEPLATES='Полосы над именем';
EF_L_CLASSCOLORONENEMYNAMEPLATES='Цвет класса вражеских персонажей';
EF_L_ENABLENAMEPLATECASTBAR='Включить полосу произн. закл.';
EF_L_SHOWRAIDMARKS='Показывать маркеры рейда';
EF_L_ENABLENAMEPLATEDEBUFFS='Включить отрицательные эффекты';
--optionals.lua
EF_L_DISPLAYNAMES='Показывать имена';
EF_L_DISPLAYMANABAR='Показывать полосу маны';
EF_L_DISPLAYCASTTIMERS='Показывать время произн. закл.';
EF_L_DISPLAYNEARBYUNITSONLY='Показывать только близлежащих';
EF_L_DISPLAYTARGETCOUNTER='Показывать счетчик цели';
EF_L_OPTIONAL='Опциональные';
--settings.lua
EF_L_EFLOADED='[enemyFrames] загружен. |cffffffff/efs|cff';
EF_L_FORMENUSETTINGS=' для меню настроек.';
EF_L_ENEMYFRAMESSETTINGS='Настройки enemyFrames';
end