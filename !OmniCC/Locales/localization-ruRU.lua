-- Version : Russian ( by Maus )

if ( GetLocale() == "ruRU" ) then
	default_settings_loaded = "OmniCC: Загружены настройки по умолчанию."
	updated_to = "OmniCC: Обновлен до";
	saved_font_is_invalid = "OmniCC: Сохраненный шрифт недействителен. Возвращение к стандартному шрифту.";

	Commands = "Команды OmniCC:";
	omnicc_size = "/omnicc size <value> Установить размер шрифта. По умолчанию - 20.";
	omnicc_font = "/omnicc font <value> - Установить шрифт. " .. STANDARD_TEXT_FONT .. " - стандартный.";
	omnicc_color = "/omnicc color <duration> <red> <green> <blue> - Установить цвет, используемый для восстановления. Продолжительность может быть длинной, средней и короткой.";
	omnicc_scale = "/omnicc scale <duration> <value> - Установить масштаб, используемый для отображения  времени восстановления. Продолжительность может быть длинной, средней и короткой.";
	omnicc_min =  "/omnicc min <value> - Установить минимальную продолжительность (секунда) восстановления от которой должен отображаться текст. Значение по умолчанию - 3.";
	omnicc_model = "/omnicc model - Переключение модели восстановления";
	omnicc_shine = "/omnicc shine - Вкл/Выкл вспышку по окончанию восстановления";
	omnicc_shinescale = "/omnicc shinescale <value> - Установить яркость вспышки. Значение по умолчанию - 4.";
	omnicc_reset = "/omnicc reset - Вернуться к настройкам по умолчанию.";

	invalid_font_size = "OmniCC: Неверный размер шрифта.";
	set_font = "OmniCC: Установить шрифт ";
	invalid_font = " недопустимый шрифт. Использование предыдущего выбора.";
	showing_cooldown_models = "OmniCC: Теперь показана модель восстановления.";
	hiding_cooldown_models = "OmniCC: Теперь модель восстановления скрыта.";
	disabled_bright = "OmniCC: Вспышка по восстановлению - отключена.";
	shining_brightly = "OmniCC: Вспышка по восстановлению - включена.";
end