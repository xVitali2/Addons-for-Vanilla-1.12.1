-- Russian localization by Lichery

if (GetLocale() == "ruRU") then

	-- Version ID
	EQUIPCOMPARE_VERSIONID = "2.9.8";

	-- "Bonus" inventory types
	-- WARNING: these lines must match the text displayed by the client exactly.
	-- Can't use arbitrary phrases. Edit and translate with care.
	EQUIPCOMPARE_INVTYPE_WAND = "Жезл";
	EQUIPCOMPARE_INVTYPE_GUN = "Огнестрельное";
	EQUIPCOMPARE_INVTYPE_GUNPROJECTILE = "Пули";
	EQUIPCOMPARE_INVTYPE_BOWPROJECTILE = "Стрелы";
	EQUIPCOMPARE_INVTYPE_CROSSBOW = "Арбалет";
	EQUIPCOMPARE_INVTYPE_THROWN = "Метательное";

	-- Usage text
	EQUIPCOMPARE_USAGE_TEXT = { "EquipCompare "..EQUIPCOMPARE_VERSIONID.."",
								"Наведите курсор мыши на предметы, чтобы сравнить их с предметами одетыми на персонаже.",
								"Команды:",
--								"/eqc          - Включение/выключение EquipCompare",
								"/eqc [on|off] - Включение/выключение EquipCompare",
								"/eqc control  - Control мод вкл./выкл.",
								"/eqc cv       - Интеграция с CharactersViewer",
								"/eqc alt      - Alt мод вкл./выкл.",
								"/eqc shift    - Выравнивание всплывающих подсказок",
								"/eqc help     - этот текст",
								"(Вы можете использовать /equipcompare вместо /eqc)" }

	-- Feedback text
	EQUIPCOMPARE_HELPTIP = "(Введите /equipcompare для помощи)";
	EQUIPCOMPARE_TOGGLE_ON = "EquipCompare включен.";
	EQUIPCOMPARE_TOGGLE_OFF = "EquipCompare выключен.";
	EQUIPCOMPARE_TOGGLECONTROL_ON = "EquipCompare Ctrl мод включен.";
	EQUIPCOMPARE_TOGGLECONTROL_OFF = "EquipCompare Ctrl мод выключен.";
	EQUIPCOMPARE_TOGGLECV_ON = "EquipCompare интеграция с CharactersViewer включена.";
	EQUIPCOMPARE_TOGGLECV_OFF = "EquipCompare интеграция с CharactersViewer выключена.";
	EQUIPCOMPARE_TOGGLEALT_ON = "EquipCompare Alt мод включен.";
	EQUIPCOMPARE_TOGGLEALT_OFF = "EquipCompare Alt мод выключен.";
	EQUIPCOMPARE_SHIFTUP_ON = "Выравнивание всплывающих подсказок EquipCompare включено.";
	EQUIPCOMPARE_SHIFTUP_OFF = "Выравнивание всплывающих подсказок EquipCompare выключено.";
	
	-- Cosmos configuration texts
	EQUIPCOMPARE_COSMOS_SECTION = "EquipCompare";
	EQUIPCOMPARE_COSMOS_SECTION_INFO = "Опции для всплывающих подсказок.";
	EQUIPCOMPARE_COSMOS_HEADER = "EquipCompare "..EQUIPCOMPARE_VERSIONID;
	EQUIPCOMPARE_COSMOS_HEADER_INFO = "Опции для всплывающих подсказок.";
	EQUIPCOMPARE_COSMOS_ENABLE = "Включение всплывающих подсказок.";
	EQUIPCOMPARE_COSMOS_ENABLE_INFO = "При включении этой опции вы получите дополнительные всплывающие подсказки "..
									  "сравнения выбранного предмета с одетой экипировкой.";
	EQUIPCOMPARE_COSMOS_CONTROLMODE = "Control мод для CharactersViewer";
	EQUIPCOMPARE_COSMOS_CONTROLMODE_INFO = "Если этот параметр включен, вы получите всплывающие подсказки сравнения "..
										"экипировки, только если удерживайте клавишу Ctrl.";
	EQUIPCOMPARE_COSMOS_CVMODE = "Интеграция с CharactersViewer";
	EQUIPCOMPARE_COSMOS_CVMODE_INFO = "Если этот параметр включен, при наведении курсора мыши на одетые предметы, "..
											"в всплывающей подсказке будет отображено сравнение этого предмета, "..
											"с предметами лежащими в инвентаре персонажа.";
	EQUIPCOMPARE_COSMOS_ALTMODE = "Alt мод для CharactersViewer";
	EQUIPCOMPARE_COSMOS_ALTMODE_INFO = "Если этот параметр включен, вы получите всплывающие подсказки сравнения "..
										"экипировки, только если удерживайте клавишу Alt.";
	EQUIPCOMPARE_COSMOS_SHIFTUP = "Выравнивание всплывающие подсказки, если необходимо"
	EQUIPCOMPARE_COSMOS_SHIFTUP_INFO = "Если этот параметр включен, всплывающие подсказки сравнения экипировки"..
											"будут сдвинуты вверх если их нижний край будет ниже, "..
											"чем нижний край всплывающей подсказки предмета.";
	EQUIPCOMPARE_COSMOS_SLASH_DESC = "Позволяет включать и выключать EquipCompare. Введите /equipcompare help для использования."

	-- Misc labels
	EQUIPCOMPARE_EQUIPPED_LABEL = "На персонаже";
	EQUIPCOMPARE_GREETING = "EquipCompare "..EQUIPCOMPARE_VERSIONID.." /eqc";

end
