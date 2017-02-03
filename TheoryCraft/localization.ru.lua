if (GetLocale() == "ruRU") then

-- The format of the tooltip is defined below.
-- It looks ghastly complicated at first, but is quite straight forward.

-- show is which checkbox needs to be enabled for the line to show

-- if inverse is true, then the checkbox needs to be unchecked

-- left is what gets added to the left hand side of the toolip
-- right is what gets added to the right hand side of the tooltip

-- If a value is not found, the entire line will be hidden.
-- to avoid this, put it in an if... eg the line:
--       "foo#IFbar lalala $invalidvalue$ no#"
-- will just show the word "foo", as the invalid value will hide the entire
-- if.

-- Where you want one value to be shown, or if that isn't valid to show
-- another, use OR.  Eg on a spell with 1000 minimum damage:
--       "foo#ORthis is invalid$invalidvalue$/bar $mindamage$OR#"
-- will just show foobar 1000, however if the spell is a heal nothing
-- will be shown at all.

-- Format for ORs:
--     "#OR text / more text OR#"
-- Format for IFs:
--     "#IF text IF#"

-----------------------
-----TheoryCraftUI-----
-----------------------
Print_Do_Nothing = "Ничего не делать";
Print_Min_Damage = "Мин. Урон";
Print_Max_Damage = "Макс. Урон";
Print_Average_Damage = "Средний Урон";
Print_Ave_Dam_no_crits = "Сред Урон (без крит)";
Print_Damage_per_sec = "УВС";
Print_With_Dot_DPS = "С ДоТ УВС";
Print_Damage_per_min = "УЗМ";
Print_Total_Damage = "Всего Урона";
Print_Total_Damage_left = "Всего Урона (слева)";
Print_Min_Heal = "Мин. Исцеление";
Print_Max_Heal = "Макс. Исцеление";
Print_Average_Heal = "Среднее Исцеление";
Print_Ave_Heal_no_crits = "Сред Исц (без крит)";
Print_Heal_per_sec = "ИВС";
Print_With_Hot_HPS = "С хот ИВС";
Print_Heal_per_min = "ИЗМ";
Print_Total_Healing = "Всего Исцеления";
Print_Total_Healing_left = "Всего Исц. (слева)";
Print_Spellcasts_remaining = "Остальные закл.";

print_Health = "Здоровье";
print_Mana = "Мана";
print_Attack_Power = "Сила атаки";
print_Ranged_Attack_Power = "Сила атаки дальнего боя";
print_Crit_Chance = "Шанс крита";
print_Ranged_Crit_Chance = "Шанс крита дальнего боя";
print_Agi_per_Crit = "Ловк за крит";
print_Normal_Regen = "Норм восстановление";
print_Regen_Whilst_Casting = "Восст во время прим";
print_Stamina = "Выносливость";
print_Strength = "Сила";
print_Agility = "Ловкость";
print_Intellect = "Интеллект";
print_Spirit = "Дух";
print_Proc_Effect = "Эффект прока";
print_Spell_Crit_Chance = "Шанс крита заклинания";
print_Heal_Crit_Chance = "Шанс крита исцеления";
print_Damage_Spell_Crit_Chance = "Шанс крита урон-заклинания";
print__Crit_Chance = " шанс крита";
print__Damage_and_Healing = "+урон и исцеление";
print__Healing = "+Исцеление";
print__Spell_Damage = "+Урон от заклинания";
print__Damage = " урон";
print__Damage_to_Undead = "+Урон по нежити";
print_Shield_Block_Value = "Показатель блокирование щитом";
print_Hit_Chance = "Шанс попадания";
print_Mana_Per_Five = "Маны за пять";
print_Spirit_In_5_Rule = "Дух в 5";
print_Mana_Restore = "Восстановление маны";
print_Tick = " / Тик";
print_Spell_Hit_Chance = "Шанс попадания закл.";
print_Damage_Spell_Hit_Chance = "Шанс нанести урон закл.";
print__Hit_Chance = " шанс попадания";
print_Spell_Penetration = "Проникновение закл.";
print_Damage_Spell_Penetration = "Проникающий урон закл.";
print__Penetration = " проник.";
-------------------------------------------

TheoryCraft_TooltipOrs = {
	hitorhealhit = "Меткость",
	hitorhealheal = "исцеление",
	damorhealdam = "Урон",
	damorhealheal = "Исцеление",
	damorapap = "САт",
	damorapdam = "+урон",
}


TheoryCraft_TooltipFormat = {
	{show = true, 		left = "#c1,1,1#$spellname$", 		right = "#c0.5,0.5,0.5#Уровень $spellrank$"},
	{show = true, 		left = "#c1,1,1#$wandlineleft2$", 	right = "#c1,1,1#$wandlineright2$"},
	{show = true, 		left = "#c1,1,1#$wandlineleft3$", 	right = "#c1,1,1#$wandlineright3$"},
	{show = "embedstyle1", 	left = "#c1,1,1#$wandlineleft4$", 	right = "Крит: #c0.9,0.9,1#$critchance,1$%#c1,1,1#"},
	{show = "embedstyle1", inverse = true, left = "#c1,1,1#$wandlineleft4$"},
	{show = true, 		left = "Мана: #c1,1,1#$basemanacost$", 	right = "#c1,1,1#$spellrange$"},
	{show = "embedstyle1", 	left = "#c0.9,0.9,1##OR$dps$#c1,1,1# УВС/$hps$#c1,1,1# ИВСOR#", 
			       right = "Крит: #c0.9,0.9,1#$critchance,1$%#c1,1,1#"},
	{show = "embedstyle2", 	left = "#c0.9,0.9,1##OR$dpm,2$#c1,1,1# УЗМ/$hpm,2$#c1,1,1# ИЗМOR#", 
			       right = "Крит: #c0.9,0.9,1#$critchance,1$%#c1,1,1#"},
	{show = "embedstyle3", 	left = "#c0.9,0.9,1##OR$dps$#c1,1,1# УВС/$hpm,2$#c1,1,1# ИЗМOR#",  
			       right = "Крит: #c0.9,0.9,1#$critchance,1$%#c1,1,1#"},
	{show = true, 		left = "#c1,1,1#$basecasttime$", right = "#c1,1,1#$cooldown$"},
	{show = true, 		left = "#c1,1,1#$cooldownremaining$",},
	{show = "embed", 	left = "#c1,0.82745098,0##OR$description$/$basedescription$OR##WRAP#"},
	{show = "embed", inverse = true, left = "#c1,0.82745098,0#$basedescription$#WRAP#"},
	{show = true, 		left = "#c1,0.5,1#$outfitname$"},
	{show = true, 		left = "Восполнение $evocation$ маны."},
	{show = true, 		left = "Без баффов: $sealunbuffed,1$ увс"},
	{show = true, 		left = "С это печатью: $sealbuffed,1$ увс"},
	{show = "titles", 	left = "#c1,1,1##TITLE=Статистика Исцеления#"},
	{show = "embed", inverse = true, left = "Исцеление: $healrange$"},
	{show = "critwithdam", 	left = "Крит: $crithealchance,2$% (на $crithealrange$)"},
	{show = "critwithoutdam", left = "Крит: $crithealchance,2$%"},
	{show = "hps", 		left = "ИВС: $hps,1$#IF, $withhothps,1$IF#"},
	{show = "dpsdam", 	left = "ИВС +исцеление: $hpsdam,1$ ($hpsdampercent,1$%)"},
	{show = "averagedamnocrit", left = "Среднее исцеление: $averagehealnocrit$"},
	{show = "averagedamnocrit", left = "Тики по: $averagehealtick$"},
	{show = "averagedam", 	left = "Среднее исцеление: $averageheal$"},
	{show = "averagedam", 	left = "Тики по: $averagehealtick$"},
	{show = "titles", 	left = "#c1,1,1##TITLE=Статистика Урона#"},
	{show = "embed", inverse = true, left = "Попаданий: $dmgrange$"},
	{show = "critmelee", 	left = "Крит: $critdmgchance,2$% (на $critdmgrange$)"},
	{show = "critwithdam", 	left = "Крит: $critdmgchance,2$% (на $critdmgrange$)"},
	{show = "sepignite", 	left = "С возгоранием: $igniterange$"},
	{show = "critwithoutdam", left = "Крит: $critdmgchance,2$%"},
	{show = "dps", 		left = "УВС: $dps,1$#IF, $withdotdps,1$IF#"},
	{show = "dpsdam", 	left = "УВС +урон: $dpsdam,1$ ($dpsdampercent,1$%)"},
	{show = "averagedamnocrit", left = "Средний урон: $averagedamnocrit$"},
	{show = "averagedamnocrit", left = "Тики по: $averagedamtick$"},
	{show = "averagedam", 	left = "Средний урон: $averagedam$"},
	{show = "averagedam", 	left = "Тики по: $averagedamtick$"},
	{show = "titles", 	left = "#c1,1,1##TITLE=Множители:#"},
	{show = "plusdam", 	left = "Основ. +$damorheal$: $plusdam$"},
	{show = "damcoef", 	left = "+$damorheal$ коэффициент: $damcoef,1$%#IF, $damcoef2,1$%IF#"},
	{show = "dameff", 	left = "+$damorheal$ эффективность: $dameff,1$%"},
	{show = "damtodouble", 	left = "+$damorheal$ двойной: $damtodouble$"},
	{show = "damfinal", 	left = "Итоговый +$damorheal$: $damfinal$#IF, $damfinal2$IF#"},
	{show = "titles", 	left = "#c1,1,1##TITLE=Сопротивления:#"},
	{show = "resists", 	left = "Рейтинг сопротивления ($resistlevel$): $resistrate$%"},
	{show = "resists", 	left = "После уровня сопротивления: $dpsafterresists,1$ УВС"},
	{show = "resists", 	left = "До: $penetration,1$ УВС (проникающий)"},
	{show = "titles", 	left = "#c1,1,1##TITLE=Сравнения:#"},
	{show = "nextcrit", 	left = "1% крита: +$nextcritheal,2$ среднее исцеление (экв: $nextcrithealequive,2$ +исцеление)"},
	{show = "nextstr", 	left = "10 сил: +$nextstrdam,2$ среднее $hitorheal$ (экв: $nextstrdamequive,2$ $damorap$)"},
	{show = "nextagi", 	left = "10 лов: +$nextagidam,2$ среднее $hitorheal$#IF (экв: $nextagidamequive,2$ $damorap$)IF#"},
	{show = "nextcrit", 	left = "1% крита: +$nextcritdam,2$ среднее $hitorheal$#IF (экв: $nextcritdamequive,2$ $damorap$)IF#"},
	{show = "nexthit", 	left = "1% меткости: +$nexthitdam,2$ среднее $hitorheal$#IF (экв: $nexthitdamequive,2$ $damorap$)IF#"},
	{show = "nextpen", 	left = "10 прон: #OR$dontshowupto$/До OR#+$nextpendam,2$ среднее $hitorheal$#IF (экв: $nextpendamequive,2$ $damorap$)IF#"},
	{show = "titles", 	left = "#c1,1,1##TITLE=Вращение:#"},
	{show = true, 		left = "MS рот. ($msrotationlength,1$ sec) увс: $msrotationdps,1$"},
	{show = true, 		left = "AS рот. ($asrotationlength,1$ sec) увс: $asrotationdps,1$"},
	{show = true, 		left = "MS/Arcane рот. увс: $arcrotationdps,1$"},
	{show = "titles", 	left = "#c1,1,1##TITLE=Итоговые сравнения:#"},
	{show = "nextagi", 	left = "10 лов: +$nextagidps,2$ MS рот. увс#IF (экв: $nextagidpsequive,2$ $damorap$)IF#"},
	{show = "nextcrit", 	left = "1% крита: +$nextcritdps,2$ MS рот. увс (экв: $nextcritdpsequive,2$ $damorap$)"},
	{show = "nexthit", 	left = "1% меткости: +$nexthitdps,2$ MS рот. увс (экв: $nexthitdpsequive,2$ $damorap$)"},
	{show = "titles", 	left = "#c1,1,1##TITLE=Эффективность:#"},
	{show = "mana", 	left = "Реальная стоимость маны: $manacost,1$"},
	{show = "dpm", 		left = "УЗМ: $dpm,2$#IF, $withdotdpm,2$IF#"},
	{show = "dpsmana", 	left = "УВС/Мана: $dpsmana,3$"},
	{show = "hpm", 		left = "ИЗМ: $hpm,2$#IF, $withhothpm,2$IF#"},
	{show = "lifetap", 	left = "Жизнеотвод УВЧ: $lifetapdpm,1$"},
	{show = "lifetap", 	left = "Жизнеотвод ИВЧ: $lifetaphpm,1$"},
	{show = "lifetap", 	left = "Жизнеотвод УВС: $lifetapdps,1$"},
	{show = "lifetap", 	left = "Жизнеотвод ИВС: $lifetaphps,1$"},
	{show = "showregenheal", left = "10 сек. восстановление: +$regenheal$ исцеления"},
	{show = "showregenheal", left = "10 сек. восстановление во время применения: +$icregenheal$ исцеления"},
	{show = "showregendam", left = "10 сек. восстановление: +$regendam$ урона"},
	{show = "showregendam", left = "10 сек. восстановление во время применения: +$icregendam$ урона"},
	{show = "max", 		left = "Исцеление до конца маны: $maxoomheal$ ($maxoomhealtime$ сек.)"},
	{show = "max", 		left = "Урон до конца маны: $maxoomdam$ ($maxoomdamtime$ сек.)"},
	{show = "maxevoc", 	left = "Урон до конца маны w/ прилив+агат: $maxevocoomdam$ ($maxevocoomdamtime$ сек.)"},
}


TheoryCraft_MeleeComboEnergyConverter = "(.-) дополнительно"
TheoryCraft_MeleeComboReader = "(%d+) очко(.-): (%d+)%-(%d+) урона"
TheoryCraft_MeleeComboReplaceWith = "$points$ point%1: %2%-%3 урона"

TheoryCraft_MeleeMinMaxReader = {
	{ pattern = "(%d+)%% от вашей силы атаки",							-- Bloodthirst
		type={"bloodthirstmult"} },
	{ pattern = "наносящий противнику (%d+) - (%d+) ед. урона (величина зависит от показателя блокирования щита)",				-- Shield Slam
		type={"mindamage", "maxdamage"} },
	{ pattern = "(%d+)%% урона",									-- Shred/Ravage
		type={"backstabmult"} },
	{ pattern = "(%d+)%% урона оружия",								-- Backstab
		type={"backstabmult"} },
	{ pattern = "дополнительно (%d+)",									-- Backstab
		type={"addeddamage"} },
	{ pattern = "друидом на (%d+) ед. больше урона при следующей атаке.",							-- Maul
		type={"addeddamage"} },
	{ pattern = "дополнительно (%d+) ед. урона.",							-- Claw
		type={"addeddamage"} },
	{ pattern = "наносящий (%d+) %- (%d+) ед. урона",							-- Sinister Strike
		type={"addeddamage"} },
	{ pattern = "увеличивающая урон в ближнем бою на (%d+)",							-- Heroic Strike
		type={"addeddamage"} },
	{ pattern = "с нанесением цели увеличенного на (%d+)",							-- Aimed Shot
		type={"addeddamage"} },
	{ pattern = "и наносящих (%d+) %- (%d+) ед. урона.",							-- Multi-Shot
		type={"addeddamage"} },
	{ pattern = "наносящая им (%d+) %- (%d+) ед. урона%.",							-- Swipe
		type={"addeddamage"} },
	{ pattern = "наносящий (%d+) ед. урона,",							-- Mocking Blow
		type={"addeddamage"} },
	{ pattern = "нанося им (%d+) ед. урона.",							-- Thunder Clap
		type={"addeddamage"} },

}

TheoryCraft_MeleeMinMaxReplacer = {
	{ search = " наносящий противнику %d+ - %d+ ед. урона (величина зависит от показателя блокирования щита) ",				-- Shield Slam
	  replacewith = " нанесение противнику $damage$ ед. урона " },
	{ search = " равный %d+%% стандартного урона оружия, и ",							-- Scattershot / Ghostly
	  replacewith = " равный $damage$ стандартного урона оружия, и " },
	{ search = " наносящая противнику урон, равный %d+%% от вашей силы атаки",				-- Bloodthirst
	  replacewith = " нанесение $damage$ урона" },
	{ search = "Нанесение друидом на %d+ ед. больше урона при следующей атаке.",					-- Maul
	  replacewith = "Ваша следующая атака нанесет $damage$ ед. урона" },
	{ search = " противнику дополнительно %d+% ед. урона.",							-- Claw
	  replacewith = " нанесение $damage$ ед. урона" },
	{ search = " наносящий цели %d+%% урона от оружия и дополнительно %d+ единиц урона",				-- Backstab
	  replacewith = " нанесение $damage$ ед. урона" },
	{ search = " нанося ему %d+%% урона плюс %d+",					-- Shred/Ravage
	  replacewith = " нанесение $damage$ ед. урона" },
	{ search = " наносящий %d+ %- %d+ ед. урона сверх базового урона оружия",			-- Sinister Strike
	  replacewith = " нанесение $damage$ ед. урона" },
	{ search = " увеличивающая урон в ближнем бою на %d+",						-- Aimed Shot
	  replacewith = " нанесение $damage$ ед. урона по цели" },
	{ search = " с нанесением цели увеличенного на %d+",							-- Aimed Shot
	  replacewith = " нанесение $damage$ ед. урона по цели" },
	{ search = " и наносящих %d+ %- %d+ ед. урона",							-- Multi-Shot
	  replacewith = " $damage$ ед. урона" },
	{ search = " наносящий противнику урон от оружия, усиленный на %d+ ед., и ",						-- Mortal Strike
	  replacewith = " нанесение $damage$ ед. урона и " },
	{ search = "урон от оружия и дополнительно %d+ ед. ",						-- Cleave
	  replacewith = " нанесение $damage$ ед. урона " },
	{ search = " Наносит обычный урон от оружия плюс %d+",							-- Overpower
	  replacewith = " нанесение $damage$ ед. урона" },
	{ search = " заблокировать атаку противника в ближнем или дальнем бою%.",					-- Block
	  replacewith = " блокирование ближней и дальней атаки, снижение получаемого урона на $blockvalue$." },
	{ search = "Эта атака наносит %d+%% урона от оружия ",						-- Riposte
	  replacewith = "Эта атака наносит $damage$ урона " },
	{ search = "противников, наносящая им (%d+) ед. урона%.",								-- Swipe
	  replacewith = "наносит $damage$ ед. урона." },
	{ search = "наносящий (%d+) ед. урона,",								-- Mocking Blow
	  replacewith = "наносящая $damage$ ед. урона," },
	{ search = "нанося им (%d+) ед. урона",							-- Thunder Clap
	  replacewith = "наносит $damage$ ед. урона" },
	{ search = "  нанося каждому противнику урон ",						-- Whirlwind
	  replacewith = " наносит $damage$ ед. урона " },
}

TheoryCraft_SpellMinMaxReader = {
	{ pattern = "наносящие заклинателю (%d+) %- (%d+) ед. урона от огня, а его противникам %- (%d+) %- (%d+) ед. урона от огня",	-- Hellfire
		type={"mindamage", "maxdamage", "mindamage", "maxdamage"} },
	{ pattern = "наносящие заклинателю (%d+) ед. урона от огня, а его противникам %- (%d+) ед. урона от огня",			-- Hellfire
		type={"bothdamage", "bothdamage"} },

	{ pattern = "заклинания, получает (%d+) ед. урона от сил природы.",						-- Lightning Shield
		type={"bothdamage"} },

	{ pattern = "и наносящий ему (%d+) ед. урона от сил природы",							-- Insect Swarm
		type={"bothdamage"} },

	{ pattern = "бегству в течение 3 сек. и нанесение ему (%d+) ед. урона от темной магии",					-- Death Coil
		type={"bothdamage"} },

	{ pattern = "(%d+) %- (%d+)(.+)ед. здоровья в момент произнесения заклинания и еще (%d+) %- (%d+)",					-- Generic Hybrid spell
		type={"mindamage", "maxdamage", "tmptext", "dotmindamage", "dotmaxdamage"} },
	{ pattern = "(%d+) %- (%d+)(.+)ед. здоровья в момент произнесения заклинания и еще (%d+)",						-- Generic Hybrid spell
		type={"mindamage", "maxdamage", "tmptext", "dotbothdamage"} },
	{ pattern = "(%d+)(.+)ед. здоровья в момент произнесения заклинания и еще (%d+) %- (%d+)",						-- Generic Hybrid spell
		type={"bothdamage", "tmptext", "dotmindamage", "dotmaxdamage"} },
	{ pattern = "(%d+)(.+)ед. здоровья в момент произнесения заклинания и еще (%d+)",							-- Generic Hybrid spell
		type={"bothdamage", "tmptext", "dotbothdamage"} },

	{ pattern = "(%d+) %- (%d+)(.+)единовременно и (%d+) %- (%d+)",					-- Generic Hybrid spell
		type={"mindamage", "maxdamage", "tmptext", "dotmindamage", "dotmaxdamage"} },
	{ pattern = "(%d+) %- (%d+)(.+)единовременно и (%d+)",						-- Generic Hybrid spell
		type={"mindamage", "maxdamage", "tmptext", "dotbothdamage"} },
	{ pattern = "(%d+)(.+)единовременно и (%d+) %- (%d+)",						-- Generic Hybrid spell
		type={"bothdamage", "tmptext", "dotmindamage", "dotmaxdamage"} },
	{ pattern = "(%d+)(.+)единовременно и %d+)",							-- Generic Hybrid spell
		type={"bothdamage", "tmptext", "dotbothdamage"} },

	{ pattern = "(%d+) %- (%d+)(.+) и (%d+) %- (%d+)",						-- Flame Shock
		type={"mindamage", "maxdamage", "tmptext", "dotmindamage", "dotmaxdamage"} },
	{ pattern = "(%d+) %- (%d+)(.+) и (%d+)",							-- Flame Shock
		type={"mindamage", "maxdamage", "tmptext", "dotbothdamage"} },
	{ pattern = "causing (%d+)(.+) и (%d+) %- (%d+)",						-- Flame Shock
		type={"bothdamage", "tmptext", "dotmindamage", "dotmaxdamage"} },
	{ pattern = "causing (%d+)(.+) и (%d+)",							-- Flame Shock
		type={"bothdamage", "tmptext", "dotbothdamage"} },

	{ pattern = "(%d+) %- (%d+) урона от огня ",							-- Magma totem
		type={"mindamage", "maxdamage"} },
	{ pattern = "(%d+) урона от огня",								-- Magma totem
		type={"bothdamage"} },

	{ pattern = "м. на (%d+) %- (%d+) ед. здоровья раз в ",							-- Healing Stream totem
		type={"mindamage", "maxdamage"} },
	{ pattern = "м. на (%d+) ед. здоровья раз в ",								-- Healing Stream totem
		type={"bothdamage"} },

	{ pattern = "(%d+) %- (%d+)",									-- Generic Normal spell
		type={"mindamage", "maxdamage"} },
	{ pattern = "(%d+)",										-- Generic no damage range spell
		type={"bothdamage"} },
}

TheoryCraft_Dequips = {
	{ type = "all", text="%+(%d+) ко всем характеристикам" },
	{ type = "formattackpower", text="Увеличивает силу атаки на (%d+) ед%. в облике кошки, медведя" },
	{ type = "attackpower", text="%+(%d+) к силе атаки" },
	{ type = "rangedattackpower", text="%+(%d+) к силе атаки дальнего боя" },
	{ type = "rangedattackpower", text="%+(%d+) к силе атаки дальнего боя%/" },
	{ type = "strength", text="%+(%d+) к силе" },
	{ type = "strength", text="%+(%d+) к силе" },
	{ type = "agility", text="%+(%d+) к ловкости" },
	{ type = "agility", text="%+(%d+) к ловкости" },
	{ type = "stamina", text="%+(%d+) к выносливости" },
	{ type = "stamina", text="%+(%d+) к выносливости" },
	{ type = "intellect", text="%+(%d+) к интеллекту" },
	{ type = "intellect", text="%+(%d+) к интеллекту" },
	{ type = "spirit", text="%+(%d+) к духу" },
	{ type = "spirit", text="%+(%d+) к духу" },
	{ type = "totalhealth", text="%+(%d+) к здоровью" },
	{ type = "totalhealth", text="%+(%d+) здоровья" },
	{ type = "meleecritchance", text="Увеличение вероятности нанесения критического урона на (%d+)%%" },
}

TheoryCraft_Locale = {
	HitMessage	= "Ваше заклинание \"(.+)\" наносит (.+) (%d+)% ед%. урона%.",
	CritMessage	= "Ваше заклинание \"(.+)\" наносит (.+) (%d+)% ед%. урона%: критический эффект%.",
	Absorbed	= "поглощено: (%+)",
	ID_Beast	= "Животное",
	ID_Humanoid	= "Гуманоид",
	ID_Giant	= "Великан",
	ID_Dragonkin	= "Дракон",
	ID_Equip	= "Если на персонаже: ",
	ID_Set		= "Комплект: ",
	ID_Use		= "Использование: ",
	to		= " %- ",
	to_print = " - ",
	Attack		= "Атака",
	InstantCast	= "Мгновенное действие",
	SecCast		= "Применение:  сек%.",
	Mana		= "Мана: ",
	Cooldown	= "Восстановление:  сек%.",
	CooldownRem	= "Времени до восстановления: ",
	Set		= "%(%d+/%d+%)",
	LoadText	= "TheoryCraft вер. "..TheoryCraft_Version..". Введите /tc для открытия меню опций.",
	lifetap		= "Жизнеотвод",
	MinMax  = {
		autoshotbefore = "Выстрел по цели на ",
		autoshotafter = ".",
		shooterror = "Нет жезла для экипировки.",
		crusader = "granting %d+ melee attack power",
	},
	SpellTranslator = {
		["Frostbolt"] = "Ледяная стрела",
		["Frost Nova"] = "Кольцо льда",
		["Cone of Cold"] = "Конус холода",
		["Blizzard"] = "Снежная буря",
		["Arcane Explosion"] = "Чародейский взрыв",
		["Arcane Missiles"] = "Чародейские стрелы",
		["Fire Blast"] = "Огненный взрыв",
		["Fireball"] = "Огненный шар",
		["Pyroblast"] = "Огненная глыба",
		["Scorch"] = "Ожог",
		["Blast Wave"] = "Взрывная волна",
		["Flamestrike"] = "Огненный столб",
		["Ice Barrier"] = "Ледяная преграда",
		["Evocation"] = "Прилив сил",

		["Shadow Bolt"] = "Стрела Тьмы",
		["Soul Fire"] = "Ожог души",
		["Searing Pain"] = "Жгучая боль",
		["Immolate"] = "Жертвенный огонь",
		["Firebolt"] = "Огненная стрела",
		["Lash of Pain"] = "Всплеск боли",
		["Conflagrate"] = "Поджигание",
		["Rain of Fire"] = "Огненный ливень",
		["Hellfire"] = "Адское Пламя",
		["Corruption"] = "Порча",
		["Curse of Agony"] = "Проклятие агонии",
		["Curse of Doom"] = "Проклятие рока",
		["Drain Soul"] = "Похищение души",
		["Siphon Life"] = "Вытягивание жизни",
		["Drain Life"] = "Похищение жизни",
		["Death Coil"] = "Лик смерти",
		["Shadowburn"] = "Ожог Тьмы",
		["Life Tap"] = "Жизнеотвод",

		["Prayer of Healing"] = "Молитва исцеления",
		["Shadow Word: Pain"] = "Слово Тьмы: Боль",
		["Mind Flay"] = "Пытка разума",
		["Mind Blast"] = "Взрыв разума",
		["Smite"] = "Кара",
		["Holy Fire"] = "Священный огонь",
		["Holy Nova"] = "Кольцо света",
		["Power Word: Shield"] = "Слово силы: Щит",
		["Desperate Prayer"] = "Молитва отчаяния",
		["Lesser Heal"] = "Малое исцеление",
		["Heal"] = "Исцеление",
		["Flash Heal"] = "Быстрое исцеление",
		["Greater Heal"] = "Великое исцеление",
		["Devouring Plague"] = "Всепожирающая чума",
		["Renew"] = "Обновление",
		["Starshards"] = "Звездные осколки",

		["Healing Touch"] = "Целительное прикосновение",
		["Tranquility"] = "Спокойствие",
		["Rejuvenation"] = "Омоложение",
		["Regrowth"] = "Восстановление",
		["Starfire"] = "Звездный огонь",
		["Wrath"] = "Гнев",
		["Insect Swarm"] = "Рой насекомых",
		["Entangling Roots"] = "Гнев деревьев",
		["Moonfire"] = "Лунный огонь",
		["Hurricane"] = "Гроза",
		["Ravage"] = "Накинуться",
		["Shred"] = "Полоснуть",
		["Claw"] = "Когти",
		["Maul"] = "Трепка",
		["Ferocious Bite"] = "Свирепый укус",
		["Swipe"] = "Размах",

		["Bloodthirst"] = "Жажда крови",
		["Mortal Strike"] = "Смертельный удар",
		["Overpower"] = "Превосходство",
		["Whirlwind"] = "Вихрь",
		["Heroic Strike"] = "Удар героя",
		["Cleave"] = "Рассекающий удар",
		["Block"] = "Блок",
		["Thunder Clap"] = "Удар грома",
		["Mocking Blow"] = "Дразнящий удар",
		["Shield Slam"] = "Мощный удар щитом",

		["Sinister Strike"] = "Коварный удар",
		["Hemorrhage"] = "Кровоизлияние",
		["Backstab"] = "Удар в спину",
		["Ghostly Strike"] = "Призрачный удар",
		["Ambush"] = "Внезапный удар",
		["Riposte"] = "Ответный удар",
		["Eviscerate"] = "Потрошение",

		["Flash of Light"] = "Вспышка Света",
		["Holy Light"] = "Свет небес",
		["Exorcism"] = "Экзорцизм",
		["Holy Wrath"] = "Гнев небес",
		["Consecration"] = "Освящение",
		["Hammer of Wrath"] = "Молот гнева",
		["Seal of the Crusader"] = "Печать воина Cвета",
		["Seal of Command"] = "Печать повиновения",
		["Seal of Righteousness"] = "Печать праведности",
		["Holy Shock"] = "Шок небес",

		["Chain Lightning"] = "Цепная молния",
		["Lightning Bolt"] = "Молния",
		["Lightning Shield"] = "Щит молний",
		["Lesser Healing Wave"] = "Малая волна исцеления",
		["Healing Wave"] = "Волна исцеления",
		["Chain Heal"] = "Цепное исцеление",
		["Earth Shock"] = "Земной шок",
		["Flame Shock"] = "Огненный шок",
		["Frost Shock"] = "Ледяной шок",
		["Magma Totem"] = "Тотем магмы",
		["Searing Totem"] = "Опаляющий тотем",
		["Healing Stream Totem"] = "Тотем исцеляющего потока",

		["Arcane Shot"] = "Чародейский выстрел",
		["Serpent Sting"] = "Укус змеи",
		["Mend Pet"] = "Лечение питомца",
		["Multi-Shot"] = "Залп",
		["Volley"] = "Град стрел",
		["Aimed Shot"] = "Прицельный выстрел",
		["Scatter Shot"] = "Дезориентирующий выстрел",
		["Raptor Strike"] = "Удар ящера",
		["Auto Shot"] = "Автоматическая стрельба",

		["Attack"] = "Атака",
		["Shoot"] = "Выстрел",
	},
-- Appears on the advanced tab, left side matches spell data (do not translate), right side equals display text
	TalentTranslator = {
-- Warlock
		{ id="suppression", translated="Подавление" },
		{ id="impcorrupt", translated="Порча" },
		{ id="impdrainlife", translated="Похищение жизни" },
		{ id="impcoa", translated="Проклятие агонии" },
		{ id="shadowmastery", translated="Власть над Тенями" },
		{ id="demonicembrace", translated="Демоническое облачение" },
		{ id="impsearing", translated="Жгучая боль" },
		{ id="impimmolate", translated="Жертвенный огонь" },
		{ id="emberstorm", translated="Бушующее пламя" },
		{ id="devastation", translated="Разоритель" },
		{ id="ruin", translated="Разгром" },
-- Mage
		{ id="subtlety", translated="Скрытность" },
		{ id="focus", translated="Средоточие чар" },
		{ id="clearcast", translated="Ясность мысли" },
		{ id="meditation", translated="Медитация" },
		{ id="arcanemind", translated="Чародейский ум" },
		{ id="instab", translated="Нестабильность" },
		{ id="impfire", translated="Огненный шар" },
		{ id="ignite", translated="Возгорание" },
		{ id="incinerate", translated="Испепеление" },
		{ id="impflame", translated="Огненный столб" },
		{ id="critmass", translated="Критическая масса" }, 
		{ id="firepower", translated="Огненная мощь" },
		{ id="impfrost", translated="Ледяная стрела" },
		{ id="shards", translated="Ледяные осколки" },
		{ id="piercice", translated="Пронзающий лед" }, 
		{ id="chanelling", translated="Направленная сила льда" }, 
		{ id="shatter", translated="Обледенение" },
		{ id="impcoc", translated="Конус холода" },
-- Mage2
		{ id="subtlety", translated="Скрытность" },
		{ id="focus", translated="Средоточие чар" },
		{ id="clearcast", translated="Ясность мысли" },
		{ id="impae", translated="Чародейский удар" },
		{ id="meditation", translated="Медитация" },
		{ id="arcanemind", translated="Чародейский ум" },
		{ id="instab", translated="Нестабильность" },
		{ id="impfire", translated="Огненный шар" },
		{ id="ignite", translated="Возгорание" },
		{ id="incinerate", translated="Испепеление" },
		{ id="impflame", translated="Огненный столб" },
		{ id="burnsoul", translated="Пылающая душа" },
		{ id="masterofelements", translated="Повелитель Стихий" },
		{ id="critmass", translated="Критическая масса" },
		{ id="firepower", translated="Огненная мощь" },
		{ id="impfrost", translated="Ледяная стрела" },
		{ id="elemprec", translated="Концентрация стихий" },
		{ id="shards", translated="Ледяные осколки" },
		{ id="piercice", translated="Пронзающий лед" },
		{ id="chanelling", translated="Направленная сила льда" },
		{ id="shatter", translated="Обледенение" },
		{ id="impcoc", translated="Конус холода" },
-- Hunter
		{ id="lethalshots", translated="Стрельба на поражение" },
		{ id="mortalshots", translated="Смертоносные выстрелы" },
		{ id="rws", translated="Специализация на оружии дальнего боя" },
		{ id="barrage", translated="Заградительный огонь" },
		{ id="humanoidslaying", translated="Убийство гуманоидов" },
		{ id="monsterslaying", translated="Убийство монстров" },
		{ id="savagestrikes", translated="Беспощадные удары" },
		{ id="survivalist", translated="Остаться в живых" },
		{ id="killerinstinct", translated="Инстинкт убийцы" },
		{ id="reflexes", translated="Молниеносная реакция" },
-- Priest
		{ id="imppwrword", translated="Слово силы: Щит" },
		{ id="pmeditation", translated="Медитация" },
		{ id="mentalagility", translated="одвижность мысли" },
		{ id="mentalstrength", translated="Сила мысли" },
		{ id="forceofwill", translated="Амулет Сильной Воли" },
		{ id="imprenew", translated="Обновление" },
		{ id="holyspec", translated="Cпециализация на магии Света" },
		{ id="divinefury", translated="Божественное неистовство" },
		{ id="imphealing", translated="Улучшенное исцеление" },
		{ id="searinglight", translated="Опаляющий свет" },
		{ id="guidance", translated="Духовное направление" },
		{ id="imppoh", translated="Улучшенная молитва исцеления" },
		{ id="spiritual", translated="Духовное" },
		{ id="shadowfocus", translated="Средоточие Тьмы" },
		{ id="darkness", translated="Мрак" },
-- Warrior
		{ id="impoverpower", translated="Превосходство" },
		{ id="impale", translated="Прокалывание" },
		{ id="twohandspec", translated="Двуручные" },
		{ id="axespec", translated="Специализация на владении топорами" },
		{ id="polearmspec", translated="Специализация на алебардах" },
		{ id="cruelty", translated="Безжалостность" },
		{ id="onehandspec", translated="Одноручные" },
-- Shaman
		{ id="lightningmast", translated="Покорение молнии" },
		{ id="elemfocus", translated="Концентрация стихий" },
		{ id="convection", translated="Конвекция" },
		{ id="concussion", translated="Сотрясение мозга" },
		{ id="callofthunder", translated="Зов грома" },
		{ id="fury", translated="Неистовство стихий" },
		{ id="impcl", translated="Улучшенная цепная молния" },
		{ id="ancestral", translated="Знания предков" },
		{ id="thundering", translated="Грохочущие удары" },
		{ id="impls", translated="Щит молний" },
		{ id="imphealingwave", translated="Волна исцеления" },
		{ id="tidalfocus", translated="Приливная концентрация" },
		{ id="tidalmastery", translated="Мастерство владения приливами" },
		{ id="purification", translated="Чистота" },
		{ id="natguid", translated="Natures Guid" },
		{ id="weaponmast", translated="Оружие" },
-- Druid
		{ id="impwrath", translated="Улучшенный гнев" },
		{ id="impmoon", translated="Лунный огонь" },
		{ id="vengeance", translated="Отмщение" },
		{ id="impstarfire", translated="Улучшенный звездный огонь" },
		{ id="grace", translated="Благоволение природы" },
		{ id="moonfury", translated="Лунное неистовство" },
		{ id="natweapons", translated="Оружие природы" },
		{ id="claws", translated="Острые когти" },
		{ id="strikes", translated="Коварный удар" },
		{ id="savagefury", translated="Бешеное неистовство" },
		{ id="hotw", translated="Сердце дикой природы" },
		{ id="imptouch", translated="Улучшенное целительное прикосновение" },
		{ id="reflection", translated="Отражение" },
		{ id="tranquil", translated="Спокойствие" },
		{ id="imprejuve", translated="Улучшенное омоложение" },
		{ id="giftofnat", translated="Дар природы" },
		{ id="impregrowth", translated="Улучшенное восстановление" },
-- Paladin
		{ id="divineint", translated="Божественный интеллект" },
		{ id="divinestrength", translated="Божественная сила" },
		{ id="illumination", translated="Свечение" },
		{ id="holypower", translated="Священная сила" },
		{ id="conviction", translated="Приговор" },
-- Rogue
		{ id="malice", translated="Злоба" },
		{ id="lethality", translated="Смертоносность" },
		{ id="impbs", translated="Удар в спину" },
		{ id="daggerspec", translated="Специализация на кинжалах" },
		{ id="fistspec", translated="Специализация на кистевом оружии" },
		{ id="aggression", translated="Агрессивность" },
		{ id="opportunity", translated="Правильный момент" },
		{ id="impambush", translated="Улучшенный внезапный удар" },
	},
-- Needs translating for the predefined sets to have set bonuses
	SetTranslator = {
		{ id="Magisters", translated="Регалии Магистра" },
		{ id="Sorcerers", translated="Регалии чародея" },
		{ id="Arcanist", translated="Регалии Чародея" },
		{ id="Netherwind", translated="Регалия ветра Пустоты" },

		{ id="Dreadmist", translated="Одеяния Багрового Тумана" },
		{ id="Deathmist", translated="Одеяния Тумана смерти" },
		{ id="Felheart", translated="Одеяния Сердца Скверны" },
		{ id="Nemesis", translated="Одеяния возмездия" },

		{ id="Devout", translated="Ризы Благочестия" },
		{ id="Virtuous", translated="Ризы Добродетели" },
		{ id="Prophecy", translated="Ризы Пророчества" },
		{ id="Transcendence", translated="Ризы Превосходства" },

		{ id="Wildheart", translated="Облачение дикого сердца" },
		{ id="Feralheart", translated="Одеяния буйного сердца" },
		{ id="Cenarion", translated="Кенарийские одеяния" },
		{ id="Stormrage", translated="Одеяния Ярости Бури" },

		{ id="Elements", translated="Стихии" },
		{ id="Five Thunders", translated="Пять Громов" },
		{ id="Earthfury", translated="Гнев Земли" },
		{ id="Ten Storms", translated="Десять Бурь" },

		{ id="Lightforge", translated="Доспехи из светостали" },
		{ id="Soulforge", translated="Доспехи Закаленного духа" },
		{ id="Lawbringer", translated="Доспехи Судии" },
		{ id="Judgement", translated="Доспехи Правосудия" },

		{ id="Valor", translated="Броня Доблести" },
		{ id="Heroism", translated="Броня Героизма" },
		{ id="Might", translated="Броня Мощи" },
		{ id="Wrath", translated="Броня Гнева" },

		{ id="Shadowcraft", translated="Доспехи незаметности" },
		{ id="Darkmantle", translated="Доспехи Покрова тьмы" },
		{ id="Nightslayer", translated="Доспехи ночного убийцы" },
		{ id="Bloodfang", translated="Доспехи Кровавых Клыков" },

		{ id="Beaststalker", translated="Доспехи загонщика" },
		{ id="Beastmaster", translated="Доспехи Повелителя зверей" },
		{ id="Giantstalker", translated="Доспехи Истребителя великанов" },
		{ id="Dragonstalker", translated="Доспехи охотника на драконов" },
	},

}
	
TheoryCraft_CheckButtons = {
	["embedstyle1"]	= { short = "УВС | Крит", description = "Добавляет дополнительную строку в средине окна описания способности\nс УВС/ИВС слева и шансом критического удара справа.", descriptionmelee="Для милишников будет показан только шанс критического урона\nотображаемого выше описания способности." },
	["embedstyle2"]	= { hide = {"ROGUE", "WARRIOR"}, short = "УЗМ | Крит", description = "Добавляет дополнительную строку в средине окна описания способности\nс УЗМ/ИЗМ слева и шансом критического удара справа." },
	["embedstyle3"]	= { hide = {"ROGUE", "WARRIOR"}, short = "УВС/ИЗМ | Крит", description = "Добавляет дополнительную строку в средине окна описания способности\nс УВС/ИЗМ слева и шансом критического удара справа." },
	["titles"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "Заглавия", description = "Разделяет дополнительную информацию в окне описания способности по категориям." },
	["embed"] 	= { short = "Заменить", description = "Изменяет базовое описание в окне описания вашего заклинания\n с учетом эффекта от снаряжения.", descriptionmelee = "Изменяет базовое описание в окне описания вашей способности\nзаменяя такие термины как \"урон от оружия и дополнительно 160\"\nна реальный урон." },
	["crit"] 	= { short = "Крит", description = "Добавляет запись о шансе крита в окно описания способности.\nУчитывает ваши таланты, снаряжение и базовый крит.", descriptionmelee = "Добавляет запись о шансе и критическом уроне в окно описания способности." },
	["critdam"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "Крит урон", description = "Отображает урон вашего критического удара" },
	["rollignites"]	= { hide = {"ROGUE", "WARRIOR", "WARLOCK", "PRIEST", "DRUID", "PALADIN", "SHAMAN", "HUNTER" }, short = "С возгоранием", description = "Все расчеты, которые включают в себя крит удары\nбудут учитывать возгорание. То есть,\nстаки возгарания так же будет повышать урон." },
	["sepignite"] 	= { hide = {"ROGUE", "WARRIOR", "WARLOCK", "PRIEST", "DRUID", "PALADIN", "SHAMAN", "HUNTER" }, short = "Отдел возгорание", description = "Отделяет стаки возгорания от расчета вашего крит урона." },
	["dps"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "УВС", description = "Добавляет запись о уроне в секунду в окно описания способности.\nДля способности с мгновенным действием\nза продолжительность ее восстановления, берется\nглобаное восстановление способностей, 1.5 сек.", descriptionmelee = "Отображает увеличение увс способности, если вы используете ее по кд." },
	["combinedot"]	= { hide = {"ROGUE", "WARRIOR"}, short = "Объединение ДоТ", description = "Если включено, заклинания которые имеют 2 вида урона, прямой и периодический,\nбудут вычисляться по выражению (УВС+ДоТ) / Время применения\nпосле, ДоТ / Продолжительность." },
	["dotoverct"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "ДоТ более СТ", description = "ДоТы будут высчитывать свой УВС как общий урон / время применения.\nПосле, общий урон / продолжительность ДоТа" },
	["hps"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "ИВС", description = "Вычисляется так же, как и УВС.\nС теми же расширенными опциями." },
	["dpsdam"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "УВС + урон", description = "На сколько зависим ваш УВС/ИВС от вашей +урон экипировки." },
	["averagedam"] 	= {short = "Средний урон", description = "Добавляет запись о среднем уроне в окно описания способности.", descriptionmelee = "Добавляет запись о среднем уроне в окно описания способности." },
	["procs"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "Включить проки", description = "Все проки основных эффектов (Гнев Кенария, Аксессуар Новолуния)\nусредняются, вместо того, чтобы применяться только в то время, когда активен положительный эффект." },
	["mitigation"] 	= { hide = {"STRIPPED"}, short = "Включить Смягчение", description = "Если включено, броня вашей цели будет включена в расчеты ТК.\nВы можете просмотреть броню существ, введя /tc armor 'имя существа' или\nоставить это поле пустым, чтобы пересчитать всех известных существ." },
	["resists"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "Сопротивление", description = "Добавляет категорию сопротивления в окно описания способности.\nВключает в себя рейтинг сопротивления вашей цели и\nваш УВС после расчета основного-уровня сопротивления.\nЕсли у вас есть какие либо проникающие способности от экипировки,\nто, это так же сообщит вам, сколько увс добавляет вам экипировка." },
	["averagethreat"] = { hide = {"ROGUE", "WARRIOR", "SHAMAN", "HUNTER", "DRUID", "WARLOCK", "PRIEST", "MAGE"}, short = "Средняя угроза", description = "Средний показатель угрозы вызванный атакой." },
	["plusdam"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "+Урон", description = "+Урон заклинания до коэффициента +урон." },
	["damcoef"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "Коэффициент +урон", description = "Коэффициент +урон заклинания.\nБудет изменен в соответствии с выбранными талантами." },
	["dameff"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "Эффективность +урон", description = "Система +урона основана на 3,5 +урон = +1увс, до критических ударов.\nЕсли заклинание достигнет этого, то эффективность будет 100%." },
	["damfinal"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "Итоговый +урон", description = "+урон добавлен в заклинание после коэффициента +урон." },
	["healanddamage"] = { hide = {"ROGUE", "WARRIOR", "MAGE", "SHAMAN", "HUNTER", "DRUID"}, short = "Показ компонент исцеления", description = "Если активно, оба компонента заклинания которое наносит урон и исцеляет.\nбудут рассчитаны отдельно.\nОбычно будет отображен только компонент урона." },
	["nextagi"] 	= { hide = {"MAGE", "WARLOCK", "PRIEST", "PALADIN", "SHAMAN" }, short = "+10 к ловкости", description = "", descriptionmelee = "Показывает сколько +10 к ловкости добавит к вашему среднему урону." },
	["nextstr"] 	= { hide = {"MAGE", "WARLOCK", "PRIEST", "PALADIN", "SHAMAN" }, short = "+10 к силе", description = "", descriptionmelee = "Показывает сколько +10 к силе добавит к вашему среднему урону." },
	["nextcrit"] 	= { short = "+1% к криту", description = "Показывает сколько +1% к криту добавит к вашему среднему урону.", descriptionmelee = "Показывает сколько +1% к криту добавит к вашему среднему урону." },
	["nexthit"] 	= { short = "+1% к меткости", description = "Показывает сколько +1% к меткости добавит к вашему среднему урону.", descriptionmelee = "Показывает сколько +1% к меткости добавит к вашему среднему урону." },
	["nextpen"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "+10 к проникающей", description = "Если цель имеет более высший уровень сопротивления, чем  ваш\nпроникающий урон, тогда, ваш урон будет ниже\nчем сообщает вам ТК.\nИмея дополнительные +10 к проникающему урону\nприблизит ваш текущий средний урон к расчетам ТК." },
	["mana"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "Реальная стоимость маны", description = "Добавляет истинную стоимость маны вашего заклинания. Значения не всегда верны." },
	["dpm"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "УЗМ", description = "Средний урон деленный на истинную стоимость маны." },
	["hpm"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "ИЗМ", description = "Среднее исцеление деленное на истинную стоимость маны." },
	["max"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "Макс. до конца маны", description = "Показывает сколько урона/исцеления вы можете произвести до окончания маны." },
	["maxevoc"] 	= { hide = {"ROGUE", "WARRIOR", "WARLOCK", "PRIEST", "DRUID", "PALADIN", "SHAMAN", "HUNTER" }, short = "Макс. окон маны (агат+прил)", description = "Тоже что и \"Макс. до конца маны\", но, включает в себя две способности мага." },
	["lifetap"] 	= { hide = {"ROGUE", "WARRIOR", "MAGE", "SHAMAN", "HUNTER", "DRUID", "PRIEST", "PALADIN"}, short = "Величина жизнеотвода", description = "УВС, УЗМ, ИВС, ИЗМ, если включено\nотобразит дополнительную информацию по использованию жизнеотвода." },
	["buttontext"] 	= { short = "Включить текст на кнопках", description = "TheoryCraft может отображать значения на ваших кнопках действий." },
	["tryfirst"] 	= { short = "Стандартный текст кнопки", description = "Стандартные значения отображаемые на ваших кнопках действия." },
	["trysecond"] 	= { short = "Альт. текст кнопки", description = "Если стандартное значение равно нулю, TheoryCraft\nпопытается вывести это значение." },
	["tryfirstsfg"]	= { short = "Стандартное значение цифр", description = "На сколько следует округлить число.\nЗначение 100 отобразит число 353 как 400." },
	["trysecondsfg"]= { short = "Альт. значение цифр", description = "На сколько следует округлить число.\nЗначение 100 отобразит число 353 как 400." },
	["framebyframe"]= { short = "Кадр за кадром", tooltiptitle = "Кадр за кадром", description = "Вы можете заставить ТК заменять текст на одной кнопке за кадр.\nРекомендуется выставить тем, у кого слабый ПК." },
	["outfit"] 	= { short = " ", tooltiptitle = "Снаряжение", description = "TheoryCraft позволяет тестировать различные комплекты брони.\nЛюбые из 8 - 9 частей классовых комплектов могут быть протестированы.\nВы можете смешивать и сочетать снаряжение по вашему вкусу, выбрав пункт \"Custom\"." },
	["showsimult"] 	= { short = "Режим сравнения", description = "Если отмечено, статистика ваших текущих параметров и снаряжения/талантов будет отображена в сплывающей подсказке." },
	["dontcrit"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "Не включать криты", description = "Если активно, криты не будут входить в расчет значений (УЗМ/ИЗМ/УВС).\n" },
	["dontresist"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "Рас. сопрот", description = "Если активно, базовый-уровень и базовое-сопротивление будут учтены\nдля всех расчетных значений (УЗМ/ИЗМ/УВС)." },
	["useglock"] 	= { hide = {"ROGUE", "WARRIOR"}, short = "Исп. GLOCK", description = "GLOCK - внешний аддон, который вычисляет сопротивления существа из боя.\nЕсли отмечено и включен GLOCK, тогда эти значения могут быть использованы ТК для того,\nчтобы обеспечить наиболее точные статистические данные доступны для вашей цели." },
}

-- Used for schoolname in the buffs/equips.  Wherever schoolname appears, it'll try each "text" value,
-- and the amount will be added to the "name" value.  "text" should be localised, "name" should not.

TheoryCraft_PrimarySchools = {
	{ name = "Frost", text = "льда" },
	{ name = "Nature", text = "сил природы" },
	{ name = "Fire", text = "огня" },
	{ name = "Arcane", text = "тайной магии" },
	{ name = "Shadow", text = "темной магии," },
	{ name = "Holy", text = "светлой магии" },
}

-- All buffs and equip effects are read from here
-- Variable Name:	Description:
-- text			The text that the buff description or equip line says. If it contains the word schoolname then it tries each
--			school name in that position, eg Frost, and adds it to the appropriate variable. Can not be used for the rare
--			cases of items that only increase crit to one school, as it will only add to the damage component
-- type			The variable to modify when it sees this label, from the following:
--	All/Damage/Frost		Increases damage/healing of all spells in that school
--	Allcritchance/Frostcrithit	Any of their subcategories can be modified too
--	manaperfive			Increases mana per 5 second regen
--	ICPercent			The value that your mana regen is multiplied by to get in-5-second-rule regen
-- amount		The amount to increase the value by. Valid values are:
--	"n/100" 100th of tooltip value
--	"totem" 5/2 of tooltip value (used for totem mana regen)
--	"hl"	for blessing of light, holy light +heal (read from tooltip)
--	"fol"	for blessing of light, flash of light +heal (read from tooltip)
--	any other value will add that amount to the data value
-- me			Mutually exclusive, if this tag is on an increaser then after this line has been found, no other increaser
--			with the me tag will read this line, good for things like Wizard Oil and Lesser Wizard Oil, where you don't want
--			Wizard Oil being picked up in Lesser Wizard Oil. The tag highest up gets spotted first.

-- Checks every buff for these

TheoryCraft_Buffs = {
	{ text="наносимый урон увеличивается на (%d+)%%", type="Damagebaseincrease", amount="n/100" },   							-- General buff in av
	{ text="Игнорирование (%d+) ед%. вражеской брони", type="Sunder" },   							-- Bonereaver's Edge
	{ text="Усиление эффекта \"Волны исцеления\" в размере до (%d+)%%.", type="Healing Wavetalentmod", amount="n/100" },  	-- Healing Way
	{ text="Восполнение (%d+)%% маны раз в 4 сек%.", type="FelEnergy", amount="n/100" },   			-- Fel Energy
	{ text="Наносимый магический урон увеличен.-(%d+)", type="All" },   						-- Very Berry/Eye of Moam
	{ text="Магическое сопротивление целей вашего заклинания снижено на (%d+)", type="Allpenetration" },   		-- Eye of Moam
	{ text="Урон от заклинаний и эффектов исцеляющих заклинаний повышен не более чем на (%d+)% ед.", type="All" },   	-- Elements/Five Thunders
	{ text="Сила атаки в ближнем бою увеличена на (%d+) ед%. Атаки ближнего боя ускорены на %d+%%, но наносят меньше урона%.", type="AttackPowerCrusader" }, -- Seal of the crusader
	{ text="(%d+) ед%. маны каждые", type="manaperfive" },							-- Warchief's blessing
	{ text="Получение (%d+) маны раз в 2 сек%.", type="manaperfive", amount="totem" },				-- Totems
	{ text="Получение (%d+)  дополнительного исцеления от заклинания \"Свет небес\"", type="Holy Light", amount="hl", target = "target"},	-- Blessing of light
	{ text="(%d+) дополнительного исцеления от заклинаний \"Вспышка Света\"%.", type="Flash of Light", amount="fol", target = "target" },	-- Blessing of light
	{ text="\"Шок небес\" повышена на 100%%", type="Holycritchance", amount=100 },				-- Divine Favour
	{ text="\"Шок небес\" повышена на 100%%", type="Holy Shockcritchance", amount=100 },			-- Divine Favour
	{ text="Вероятность нанесения критического урона заклинаниями огня увеличена на (%d+)%%", type="Firecritchance" },		-- Combustion in 1.11
	{ text="Эффект от заклинания увеличен на (%d+) ед%.", type="All" },							-- Spell Blasting
	{ text="Расход маны на следующее заклинание снижен на 100%%%.", type="Holycritchance", amount=25 },		-- Inner Focus
	{ text="Увеличение исцеления, производимого заклинаниями и эффектами на (%d+) ед%. на %d+ сек%.", type="Healing" },		-- Blessed Prayer
	{ text="Урон от темной магии увеличен на (%d+)%%%.", type="Shadowbaseincrease", amount="n/100" },		-- Shadowform
	{ text="Урон увеличен на (%d+)%%%.", type="Allbaseincrease", amount=0.05 },					-- Sayge's fortune
	{ text="Урон увеличен на (%d+)%%%.", type="Meleebaseincrease", amount=0.05 },				-- Sayge's fortune
	{ text="Урон от огня увеличен на (%d+)%%%.", type="Firebaseincrease", amount="n/100" },				-- Burning Wish Demonic Sacrifice Imp
	{ text="Увеличение наносимого урона на (%d+)%%%.", type="Allbaseincrease", amount="n/100" },			-- Master Demonologist Succubus
	{ text="Увеличение урона от темной магии на (%d+)%%%.", type="Shadowbaseincrease", amount="n/100" },			-- Touch of Shadow Demonic Sacrifice Succubus
	{ text="Урон в ближнем бою увеличен на (%d+)%%%.", type="Meleebaseincrease", amount="n/100" },			-- Enrage
	{ text="100%% маны в процессе применения заклинания", type="ICPercent", amount=4 }, 			-- Innervate
	{ text="мана восстанавливается со скоростью, равной (%d+)%% от", type="ICPercent", amount="n/100" },		-- Mage Armor
	{ text="Дополнительный урон от заклинаний вплоть до (%d+)%." },							-- Elixir of frost power
	{ text="Увеличение урона от заклинаний огня до (%d+)%", type="Fire" },						-- Elixir of greater firepower
	{ text="Урон от заклинаний и эффективность исцеления повышены на (%d+)%%%.", type="Allbaseincrease", amount="n/100" },	-- Power Infusion
	{ text="Увеличен урон от заклинаний и расход маны на них%.", type="Damagemodifier", amount=0.35 },		-- Arcane Power
	{ text="(%d+) ед%. маны раз в 5 сек%.", type="manaperfive" }, 						-- Blessing of Wisdom/Nightfin soup
	{ text="Скорость восполнения маны увеличена на (%d+) ед%. раз в 5 сек%.", type="manaperfive" }, 				-- Safefish Well Fed
	{ text="Увеличение урона от заклинаний на (%d+)%.", type="Damage" }, 							-- Flask of Supreme Power / ZHC Damage
	{ text="вероятность критического удара заклинаний на (%d+)", type="Allcritchance" },							-- Moonkin Aura/Fire Festival Fury
	{ text="Наносимый магический урон и исцеляющие эффекты увеличены на (%d+)", type="All" },					-- ToEP
	{ text="Увеличение эффективности лечения на (%d+)%.", type="Healing" },							-- ZHC Healing
	{ text="Кроме этого, и демон, и его хозяин будут наносить на (%d+)%% больше урона%.", type="Allbaseincrease", amount="n/100" },	-- Soul Link
}

TheoryCraft_Debuffs = {
	{ text="Броня ослаблена на (%d+) ед%.", type="Sunder" },   							-- Sunder Armor
	{ text="Броня ослаблена%.", type="DontMitigate", amount=1 },							-- Expose Armor
	{ text="Вероятность критического поражения ледяными заклинаниями повышается на (%d+)%% ", type="Frostcritchance" },   						-- Winter's Chill
	{ text="Сила атаки дальнего боя всех персонажей, атакующих эту цель, увеличена на (%d+)%.", type="huntersmark" },		-- Hunter's Mark
	{ text="Усиление урона от темной магии на (%d+)%%%.", type="Shadowbaseincrease", amount="n/100" },		-- Shadow Weaving
	{ text="Сопротивление огню и магии льда уменьшено на (%d+) ед%.", type="Firepenetration" },				-- Curse of the Elements
	{ text="Сопротивление огню и магии льда уменьшено на (%d+) ед%.", type="Frostpenetration" },				-- Curse of the Elements
	{ text="Получаемый урон от огня и льда увеличен на (%d+)%%%.", type="Firebaseincrease", amount="n/100" },		-- Curse of the Elements
	{ text="Получаемый урон от огня и льда увеличен на (%d+)%%%.", type="Frostbaseincrease", amount="n/100" },	-- Curse of the Elements
	{ text="Получаемый урона от темной магии и тайной магии повышен на (%d+)%%%.", type="Shadowbaseincrease", amount="n/100" },	-- Curse of shadows
	{ text="Получаемый урона от темной магии и тайной магии повышен на (%d+)%%%.", type="Arcanebaseincrease", amount="n/100" },	-- Curse of shadows
	{ text="Сопротивления силам Тьмы и тайной магии снижено на (%d+) ед%.", type="Shadowpenetration" },				-- Curse of Shadows
	{ text="Сопротивления силам Тьмы и тайной магии снижено на (%d+) ед%.", type="Arcanepenetration" },				-- Curse of Shadows
	{ text="Получаемый урон от светлой магии увеличени на (%d+) ед%.", type="Holy" },						-- Judgement of Crusader
	{ text="Заморозка%.", type="doshatter", amount=1 },							-- Frost Nova
	{ text="Заморозка%.", type="doshatter", amount=1 },								-- Freezing Band?
	{ text="Увеличение урона от огня на (%d+)%.", type="Firebaseincrease", amount="n/100" },			-- Improved Scorch
}

-- Dot Duration is read from here

TheoryCraft_DotDurations = {
	{ text=" (%d+) сек.", amount="n" },				-- Shadow Word: Pain, Corruption, Immolate, Renew
	{ text="в секунду в течение (%d+) сек%.", amount="n" },			-- Volley
	{ text=" Время действия %– (%d+) сек%.", amount="n" },			-- Tranquility
	{ text="в секунду в течение (%d+) сек%.", amount="n" },			-- Arcane Missiles
	{ text="Время действия %- (%d+) сек%.", amount="n" },				-- Drain and Siphon Life
	{ text="в течение 1 мин%.", amount="60" },					-- Curse of Doom
}

-- Checks every line for these

TheoryCraft_EquipEveryRight = {
	{ text="^Скорость (%d+%.?%d+)", type="OffhandSpeed", slot="SecondaryHand" },	-- Weapon Damage
	{ text="^Скорость (%d+%.?%d+)", type="MainSpeed", slot="MainHand" },		-- Weapon Damage
	{ text="^Скорость (%d+%.?%d+)", type="RangedSpeed", slot="Ranged" },		-- Weapon Damage
	{ text="^Кинжал", type="MeleeAPMult", amount=-0.7, slot="MainHand" },		-- Weapon Damage
	{ text="^Кинжал", type="DaggerEquipped", amount=1, slot="MainHand" }	,	-- Used for dagger spec
	{ text="^Кистевое", type="FistEquipped", amount=1, slot="MainHand" },	-- Used for fist spec
	{ text="^Топор", type="AxeEquipped", amount=1, slot="MainHand" },			-- Used for Axe Spec
	{ text="^Древковое", type="PolearmEquipped", amount=1, slot="MainHand" },		-- Used for Polearm Spec
	{ text="^Щит", type="ShieldEquipped", amount=1, slot="SecondaryHand" },	-- Used for Block
}

TheoryCraft_EquipEveryLine = {
	{ text=".+%+(%d+) к блокированию", type="BlockValueReport" }, -- Block Value (ZG Enchant)
	{ text="%+(%d+) к силе атаки дальнего боя", type="RangedAttackPowerReport" }, 	-- Hunter Leg/Helm enchant
	{ text="^(%d+) к блокированию", type="BlockValueReport" }, 				-- Block Value (shield)

	{ text="%+(%d+) к силе атаки", type="AttackPowerReport" }, 			-- Attack power

	{ text="(%d+%.?%d+) ед%. урона в сек%.", type="AmmoDPS", slot="Ammo" },	-- Arrows

	{ text="Правая рука", type="MeleeAPMult", amount="2.4", slot="MainHand" },	-- Weapon Damage
	{ text="Одноручное", type="MeleeAPMult", amount="2.4", slot="MainHand" },	-- Weapon Damage
	{ text="Двуручное", type="MeleeAPMult", amount="3.3", slot="MainHand" },	-- Weapon Damage
	{ text="(%d+) %- %d+", type="RangedMin", slot="Ranged" },			-- Weapon Damage
	{ text="%d+ %- (%d+)", type="RangedMax", slot="Ranged" }, 			-- Weapon Damage
	{ text="Прицел %(%+(%d+) к урону)", type="RangedMin", slot="Ranged" },		-- Weapon Damage enchant
	{ text="Прицел %(%+(%d+) к урону)", type="RangedMax", slot="Ranged" },		-- Weapon Damage enchant
	{ text="(%d+) %- %d+", type="MeleeMin", slot="MainHand" },			-- Weapon Damage
	{ text="%d+ %- (%d+)", type="MeleeMax", slot="MainHand" }, 			-- Weapon Damage
	{ text="%+(%d+) к урону оружием", type="MeleeMin", slot="MainHand" },		-- Weapon Damage enchant
	{ text="%+(%d+) к урону оружием", type="MeleeMax", slot="MainHand" },		-- Weapon Damage enchant
	{ text="(%d+) %- %d+", type="OffhandMin", slot="SecondaryHand" },		-- Weapon Damage
	{ text="%d+ %- (%d+)", type="OffhandMax", slot="SecondaryHand" }, 		-- Weapon Damage
	{ text="%+(%d+) к урону оружием", type="OffhandMin", slot="SecondaryHand" },	-- Weapon Damage enchant
	{ text="%+(%d+) к урону оружием", type="OffhandMax", slot="SecondaryHand" },	-- Weapon Damage enchant

	{ text="%+(%d+) к урону от заклинаний schoolname" },					-- of wrath items
	{ text="+(+%d+) к урону от заклинаний schoolname" },						-- AQ Glove enchants
	{ text="%+(%d+) к лечению и урону от заклинаний", type="All", me=1 },			-- zg enchant
	{ text="%+(%d+) к лечению", type="Healing" },					-- of healing items
	{ text="%+(%d+) к лечению и урону от заклинаний", type="All" },			-- of sorcery items
	{ text="%+(%d+) к урону от заклинаний schoolname", me=1 }, 				-- Winter's Might
	{ text="%+(%d+) к урону от заклинаний", type="All", me=1 }, 				-- Spell Damage +30 enchant
	{ text="%+(%d+) к лечению", type="Healing" },				-- zg priest and healing enchant
	{ text="++(%d+) к урону от заклинаний и лечению", type="All" }, 			-- not sure

	{ text="Использование: Восполнение 375 - 625 ед%. маны%.", type="manarestore", amount="500" },    -- Robe of the Archmage

	{ text="%+(%d+)%% к меткости заклинаний", type="Allhitchance" },				-- zg enchant
	{ text="%+(%d+)%% к меткости", type="Meleehitchance" },					-- Hunter Leg/Helm enchant

	{ text="^.(%d+) ед%. маны каждые 5 сек%.", type="manaperfive" },			-- of restoration
	{ text="%+(%d+) к восполнению маны/", type="manaperfive" },				-- zg enchant
	{ text="Восполнение (%d+) ед%. маны каждые 5 сек%.", type="manaperfive" },			-- bracers healing enchant

	{ text="^Сверкающее масло маны", type="manaperfive", amount="12" }, 		-- Enchanting oils
	{ text="^Сверкающее масло маны", type="Healing", amount="25" }, 			-- Enchanting oils
	{ text="^Сверкающее волшебное масло", type="Allcritchance", amount="1" }, 		-- Enchanting oils
	{ text="^Сверкающее волшебное масло", type="Damage", amount="36" }, 			-- Enchanting oils
	{ text="^Слабое масло маны", type="manaperfive", amount="4" }, 			-- Enchanting oils
	{ text="^Малое масло маны", type="manaperfive", amount="8" }, 			-- Enchanting oils
	{ text="^Слабое волшебное масло", type="Damage", amount="8" }, 			-- Enchanting oils
	{ text="^Малое волшебное маслоl", type="Damage", amount="16" }, 			-- Enchanting oils
	{ text="^Волшебное масло", type="Damage", amount="24" }, 				-- Enchanting oils
}

-- Won't check any lines containing the following words (for speed)

TheoryCraft_IgnoreLines = {
	"^Прочность", "^Персональный предмет", "^Классы%:", "^Требуется", "^Броня: %d+", "^Голова", "^Шея", "^Плечо",
	"^Спина", "^Грудь", "^Запястья", "^Кисти рук", "^Пояс", "^Ноги", "^Ступни", "^Палец", "^Аксессуар",
	"^Жезл", "^Левая рука", "Сопротивление?$", "^%+%d+ к выносливости", "^%+%d+ к интеллекту",
	"^%+%d+ к духу", "^%+%d+ к ловкости", "^%+%d+ к силе"
}

-- These are handled specially

TheoryCraft_SetsDequipOnly= {
	{ text="Уменьшает расход маны на заклинания темной магии на %d+%%%.", type="Shadowmanacost", amount=-0.15 }, 			-- Felheart 8 piece bonus
}

-- Checks every line beginning Set: for these

TheoryCraft_Sets = {
	{ text="Во время произнесения заклинаний мана восполняется со скоростью, равной (%d+)%% от обычной", type="ICPercent", amount="n/100" }, 	     	-- Stormrage/Trans
	{ text="При обычной атаке в дальнем бою у вас есть 4%% шанса на восполнение 200 ед%. маны%.", type="Beastmanarestore", amount=200 },	-- Beaststalker/Beastmaster
	{ text="Повышение на 15%% величины восполняемого здоровья или маны при использовании заклинаний \"Похищение жизни\" и \"Похищение маны\"%.", type="Drain Lifeillum", amount=0.15 },	-- Felheart 3 piece bonus
	{ text="10%%%-я вероятность того, что после наложения вами заклинаний \"Чародейские снаряды\", \"Огненный шар\" или \"Ледяная стрела\", следующее заклинание, время наложения которого менее 10, будет наложено моментально%.", type="FrostboltNetherwind", amount=1 },	    -- Netherwind
	{ text="10%%%-я вероятность того, что после наложения вами заклинаний \"Чародейские снаряды\", \"Огненный шар\" или \"Ледяная стрела\", следующее заклинание, время наложения которого менее 10, будет наложено моментально.%.", type="FireballNetherwind", amount=1 },	    -- Netherwind
	{ text="Увеличения на (%d+)%% шанса на критический эффект заклинания \"Молитва исцеления\"%.", type="Prayer of Healingcritchance" },	-- Prophecy 8 piece
	{ text="Повышает вероятность нанести критический удар заклинаниями категории \"Шок\" на (%d+)%%%.", type="Shockcritchance" }, 	-- Shaman Legionnaire set bonus
	{ text="Увеличение вероятности критического эффекта заклинаний Природы на (%d+)%%%.", type="Naturecritchance" }, 	-- ten storms set bonus
	{ text="После произнесения заклинаний \"Волны исцеления\" или \"Малой волны исцеления\", заклинатель с вероятностью 25%% восстанавливает 35%% маны от базового расхода на заклинание%.", type="EarthfuryBonusmanacost", amount=-0.0875 },   -- earth fury set bonus
	{ text="Увеличение урона от способностей \"Залп\" и \"Град стрел\" на (%d+)%%%.", type="Barragemodifier", amount="n/100"},   	-- giantstalker set bonus
	{ text="Увеличение вероятности критического эффекта ваших заклинаний светлой магии на (%d+)%%%.", type="Holycritchance" },		-- Prophecy
	{ text="Шанс при наложении заклинания увеличить наносимый вами урон и приносимое вами исцеление на 95 ед%. на 10 сек%.", type="All", amount=95, duration=9.9, proc=0.04, exact=1 }, 	     	-- Elements
}

-- Checks every line beginning with Equip: or Set: for these

TheoryCraft_Equips = {
	{ text="нежити магическими эффектами и заклинаниями%, на (%d+) ед%.", type="Undead" }, 	    	    	    -- Rune of the Dawn
	{ text="Повышение эффекта заклинания Малая волна исцеления не более чем на (%d+) ед%.", type="Lesser Healing Wave" }, 	    -- Totem of Life
	{ text="^(%d+) к блокированию", type="BlockValueReport" }, 							    -- Block Value
	{ text=".+показатель блокирования вашего щита на (%d+) ед%.", type="BlockValueReport" }, 				    -- Block Value
	{ text="Увеличение меткости на (%d+)%%%.", type="Meleehitchance" }, 				    -- Generic Hit
	{ text="Увеличение вероятности нанесения критического урона на (%d+)%%%.", type="CritReport" }, 		    -- Generic Crit
	{ text="Увеличивает силу атаки на (%d+) %.", type="AttackPowerReport" }, 						    -- Attack power
	{ text="Увеличение силы атаки в дальнем бою на (%d+) %.", type="RangedAttackPowerReport" }, 				    -- Hunter's Royal seal of eldre'thalas
	{ text="Увеличение критического эффекта заклинаний на (%d+)%%%.", type="Allcritchance" },    -- Generic spell crit
	{ text="Снижение сопротивления магии у ваших целей на (%d+) ед%.", type="Allpenetration" },	    -- Penetration
	{ text="Повышение на (%d+)%% меткости заклинаний%.", type="Allhitchance" },		    	    -- ZG drops
	{ text="Увеличение вероятности критического эффекта ваших заклинаний светлой магии на (%d+)%%%.", type="Holycritchance" },    -- Benediction
	{ text="Увеличение урона и целительного действия магических заклинаний и эффектов не более чем на (%d+) ед%.", type="All" },    -- Standard +dam
	{ text="Увеличение исцеляющих заклинаний и эффектов на (%d+) ед%.", type="Healing" },		    -- Standard +heal
	{ text="Увеличение урона, наносимого заклинаниями и .+ schoolname%, на (%d+) ед%." },			    -- Single school +dam
	{ text="Восполнение (%d+) ед%. маны раз в 5 сек%.", type="manaperfive" },					            -- mana per five
	{ text="При успешной атаке вашим боевым заклинанием вы получаете шанс увеличить урон ото всех заклинаний и эффектов на 132 ед%. на 10 сек%.", type="All", amount=132, duration=9.9, proc=0.05, exact=1 },		    -- Wrath of Cenarius
	{ text="2%% шанс того%, что успешно прочитанное заклинание позволит 100%% вашего восполнения маны продолжаться и во время чтения заклинаний в течение 15 сек%.", type="ICPercent", amount=1, duration=15, proc=0.02, exact=0 },	    -- Darkmoon Trinket
}

TheoryCraft_WeaponSkillOther = "Рукопашный бой"

-- Used for calcuting real crit chance, off attack skill of your current weapon.
-- English must not be translated. ltext is the text that will be to the left of the weapon type
-- Skill is what skill it matches. (eg Two-Handed Axes)

TheoryCraft_WeaponSkills = {
	{ english="Axe", text="Топор", ltext="Двуручное", skill="Двуручные топоры" },
	{ english="Sword", text="Меч", ltext="Двуручное", skill="Двуручные мечи" },
	{ english="Mace", text="Дробящее", ltext="Двуручное", skill="Двуручное дробящее оружие" },
	{ english="Staff", text="Посох", skill="Посохи" },
	{ english="Axe", text="Топор", skill="Топоры" },
	{ english="Sword", text="Меч", skill="Мечи" },
	{ english="Mace", text="Дробящее", skill="Дробящее оружие" },
	{ english="Polearm", text="Древковое", skill="Древковое оружие" },
	{ english="Dagger", text="Кинжал", skill="Кинжалы" },
	{ english="", text="Удочка", skill="Рыбная ловля" },
}

-- Slot is the text that appears on the custom form, text needs to be translated. Realslot needs to stay as is.

TheoryCraft_SlotNames = {
	{ realslot="Head", slot="Head", text="Голова" },
	{ realslot="Neck", slot="Neck", text="Шея" },
	{ realslot="Shoulder", slot="Shoulder", text="Плечи" },
	{ realslot="Back", slot="Back", text="Спина" },
	{ realslot="Chest", slot="Chest", text="Грудь" },
	{ realslot="Shirt", slot="Shirt", text="Рубашка" },
	{ realslot="Tabard", slot="Tabard", text="Гербовая накидка" },
	{ realslot="Wrist", slot="Wrist", text="Запястья" },
	{ realslot="Hands", slot="Hands", text="Кисти рук" },
	{ realslot="Waist", slot="Waist", text="Пояс" },
	{ realslot="Legs", slot="Legs", text="Ноги" },
	{ realslot="Feet", slot="Feet", text="Ступни" },
	{ realslot="Finger0", slot="Finger0", text="Палец" },
	{ realslot="Finger1", slot="Finger1", text="Палец" },
	{ realslot="Trinket0", slot="Trinket0", text="Аксессуар" },
	{ realslot="Trinket1", slot="Trinket1", text="Аксессуар" },
	{ realslot="MainHand", slot="Main", text="Правая рука" },
	{ realslot="MainHand", slot="Main", text="Одноручное" },
	{ realslot="MainHand", slot="Main", text="Двуручное", both=true },
	{ realslot="SecondaryHand", slot="Off Hand", text="Левая рука" },
	{ realslot="SecondaryHand", slot="Off Hand", text="Левая рука" },
	{ realslot="SecondaryHand", slot="Off Hand", text="Левая рука" },
	{ realslot="Ranged", slot="Ranged", text="Жезл" },
	{ realslot="Ranged", slot="Ranged", text="Лук" },
	{ realslot="Ranged", slot="Ranged", text="Ружье" },
	{ realslot="Ranged", slot="Ranged", text="Арбалет" },
	{ realslot="Ranged", slot="Ranged", text="Оружии дальнего боя" },
	{ realslot="Ranged", slot="Ranged", text="Метательное" },
}
end