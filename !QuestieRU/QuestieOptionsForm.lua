local QO_FormName = "QuestieOptionsForm"

function Questie:OptionsForm_Init()
    QO_arrowenabled = getglobal(QO_FormName.."ArrowEnabledCheck")
    QO_showobjectives = getglobal(QO_FormName.."AlwaysShowObjectivesCheck")
    QO_boldcolors = getglobal(QO_FormName.."BoldColorsCheck")
    QO_clusterquests = getglobal(QO_FormName.."ClusterQuestsCheck")
    QO_corpsearrow = getglobal(QO_FormName.."CorpseArrowCheck")
    QO_hideminimapicons = getglobal(QO_FormName.."HideMinimapIconsCheck")
    QO_maxlevelfilter = getglobal(QO_FormName.."MaxLevelFilterCheck")
    QO_maxshowlevel = getglobal(QO_FormName.."MaxShowLevelSlider")
    QO_maxshowlevel_current = getglobal(QO_FormName.."MaxShowLevelSlider".."Current")
    QO_minimapbutton = getglobal(QO_FormName.."MinimapButtonCheck")
    QO_minlevelfilter = getglobal(QO_FormName.."MinLevelFilterCheck")
    QO_minshowlevel = getglobal(QO_FormName.."MinShowLevelSlider")
    QO_minshowlevel_current = getglobal(QO_FormName.."MinShowLevelSlider".."Current")
    QO_resizeworldmap = getglobal(QO_FormName.."ResizeWorldmapCheck")
    QO_showmapnotes = getglobal(QO_FormName.."ShowMapNotesCheck")
    QO_showprofessionquests = getglobal(QO_FormName.."ShowProfessionQuestsCheck")
    QO_showtooltips = getglobal(QO_FormName.."ShowToolTipsCheck")
    QO_showtrackerheader = getglobal(QO_FormName.."ShowTrackerHeaderCheck")
    QO_trackerbackground = getglobal(QO_FormName.."TrackerBackgroundCheck")
    QO_trackerenabled = getglobal(QO_FormName.."TrackerEnabledCheck")
    QO_trackerlist = getglobal(QO_FormName.."TrackerListCheck")
    QO_trackerscale = getglobal(QO_FormName.."TrackerScaleSlider")
    QO_trackerscale_current = getglobal(QO_FormName.."TrackerScaleSlider".."Current")
    QO_trackertransparency = getglobal(QO_FormName.."TrackerTransparencySlider")
    QO_trackertransparency_current = getglobal(QO_FormName.."TrackerTransparencySlider".."Current")
    QO_versionlabel = getglobal(QO_FormName.."VersionLabel".."Label")
end

function Questie:OptionsForm_Display()
    Questie:OptionsForm_Init()

    QO_arrowenabled:SetChecked(QuestieConfig["arrowEnabled"])

    QO_showobjectives:SetChecked(QuestieConfig["alwaysShowObjectives"])

    QO_boldcolors:SetChecked(QuestieConfig["boldColors"])

    QO_corpsearrow:SetChecked(QuestieConfig["corpseArrow"])

    QO_clusterquests:SetChecked(QuestieConfig["clusterQuests"])

    QO_hideminimapicons:SetChecked(QuestieConfig["hideMinimapIcons"])

    QO_minimapbutton:SetChecked(QuestieConfig["minimapButton"])

    QO_maxlevelfilter:SetChecked(QuestieConfig["maxLevelFilter"])

    QO_maxshowlevel:SetValue(QuestieConfig["maxShowLevel"])
    QO_maxshowlevel_current:SetText(tostring(QuestieConfig["maxShowLevel"]))

    QO_minlevelfilter:SetChecked(QuestieConfig["minLevelFilter"])

    QO_minshowlevel:SetValue(QuestieConfig["minShowLevel"])
    QO_minshowlevel_current:SetText(tostring(QuestieConfig["minShowLevel"]))

    QO_resizeworldmap:SetChecked(QuestieConfig["resizeWorldmap"])

    QO_showmapnotes:SetChecked(QuestieConfig["showMapNotes"])

    QO_showprofessionquests:SetChecked(QuestieConfig["showProfessionQuests"])

    QO_showtooltips:SetChecked(QuestieConfig["showToolTips"])

    QO_showtrackerheader:SetChecked(QuestieConfig["showTrackerHeader"])

    QO_trackerbackground:SetChecked(QuestieConfig["trackerBackground"])

    QO_trackerenabled:SetChecked(QuestieConfig["trackerEnabled"])

    QO_trackerlist:SetChecked(QuestieConfig["trackerList"])

    QO_trackerscale:SetValue(QuestieConfig["trackerScale"] * 100)
    QO_trackerscale_current:SetText(tostring(QuestieConfig["trackerScale"] * 100).."%")

    QO_trackertransparency:SetValue(100 - QuestieConfig["trackerAlpha"] * 100)
    QO_trackertransparency_current:SetText(tostring(QuestieConfig["trackerAlpha"] * 100).."%")

    QO_versionlabel:SetText("Версия: " .. tostring(QuestieConfig["getVersion"]))

    QuestieOptionsForm:Show()
end

function Questie:OptionsForm_CancelOptions()
    QuestieOptionsForm:Hide()
end

function Questie:OptionsForm_ApplyOptions()
    QuestieConfig.alwaysShowObjectives = Questie:toboolean(QO_showobjectives:GetChecked())

    QuestieConfig.arrowEnabled = Questie:toboolean(QO_arrowenabled:GetChecked())

    QuestieConfig.boldColors = Questie:toboolean(QO_boldcolors:GetChecked())

    QuestieConfig.clusterQuests = Questie:toboolean(QO_clusterquests:GetChecked())

    QuestieConfig.corpseArrow = Questie:toboolean(QO_corpsearrow:GetChecked())

    QuestieConfig.hideMinimapIcons = Questie:toboolean(QO_hideminimapicons:GetChecked())

    QuestieConfig.minimapButton = Questie:toboolean(QO_minimapbutton:GetChecked())

    QuestieConfig.maxLevelFilter = Questie:toboolean(QO_maxlevelfilter:GetChecked())

    QuestieConfig.maxShowLevel = QO_maxshowlevel:GetValue()

    QuestieConfig.minLevelFilter = Questie:toboolean(QO_minlevelfilter:GetChecked())

    QuestieConfig.minShowLevel = QO_minshowlevel:GetValue()

    QuestieConfig.showMapNotes = Questie:toboolean(QO_showmapnotes:GetChecked())

    QuestieConfig.showProfessionQuests = Questie:toboolean(QO_showprofessionquests:GetChecked())

    -- Compare opening values and values attempting to be set, if any are different a reload will be needed
    local CachedValues = {
        ["resizeWorldmap"] = QuestieConfig.resizeWorldmap,
        ["showToolTips"] = QuestieConfig.showToolTips,
        ["showTrackerHeader"] = QuestieConfig.showTrackerHeader,
        ["trackerAlpha"] = tonumber(QuestieConfig.trackerAlpha),
        ["trackerBackground"] = QuestieConfig.trackerBackground,
        ["trackerEnabled"] = QuestieConfig.trackerEnabled,
        ["trackerList"] = QuestieConfig.trackerList, -- Changes list direction, true  = bottom>top, false = top>bottom
        ["trackerScale"] = tonumber(QuestieConfig.trackerScale)
    }


    QuestieConfig.resizeWorldmap = Questie:toboolean(QO_resizeworldmap:GetChecked())
    QuestieConfig.showToolTips = Questie:toboolean(QO_showtooltips:GetChecked())
    QuestieConfig.showTrackerHeader = Questie:toboolean(QO_showtrackerheader:GetChecked())
    QuestieConfig.trackerAlpha = tonumber((100 - QO_trackertransparency:GetValue()) / 100)
    QuestieConfig.trackerBackground = Questie:toboolean(QO_trackerbackground:GetChecked())
    QuestieConfig.trackerEnabled = Questie:toboolean(QO_trackerenabled:GetChecked())
    QuestieConfig.trackerList = Questie:toboolean(QO_trackerlist:GetChecked())
    QuestieConfig.trackerScale = tonumber(QO_trackerscale:GetValue() / 100)

    DEFAULT_CHAT_FRAME:AddMessage("QuestieRU: настройки применены", 1, 0.75, 0)

    local bDisplayWarning = false
    local WarningMessage = "|cFFFFFF00Некоторые изменения в настройках требуют перезагрузку интерфейса:|n|n"
    if(QuestieConfig.resizeWorldmap ~= CachedValues.resizeWorldmap) then
        WarningMessage = WarningMessage.."Размер Карты мира|n"
        bDisplayWarning = true
    end
    if(QuestieConfig.showToolTips ~= CachedValues.showToolTips) then
        WarningMessage = WarningMessage.."Показывать подсказки|n"
        bDisplayWarning = true
    end
    if(QuestieConfig.showTrackerHeader ~= CachedValues.showTrackerHeader) then
        WarningMessage = WarningMessage.."Показывать заголовок отслеживания заданий|n"
        bDisplayWarning = true
    end
    if(QuestieConfig.trackerAlpha ~= CachedValues.trackerAlpha) then
        WarningMessage = WarningMessage.."Прозрачность отслеживания заданий|n"
        bDisplayWarning = true
    end
    if(QuestieConfig.trackerBackground ~= CachedValues.trackerBackground) then
        WarningMessage = WarningMessage.."Задний фон отслеживания заданий|n"
        bDisplayWarning = true
    end
    if(QuestieConfig.trackerEnabled ~= CachedValues.trackerEnabled) then
        WarningMessage = WarningMessage.."Включить отслеживание заданий|n"
        bDisplayWarning = true
    end
    if(QuestieConfig.trackerList ~= CachedValues.trackerList) then
        WarningMessage = WarningMessage.."Список отслеживания заданий|n"
        bDisplayWarning = true
    end
    if(QuestieConfig.trackerScale ~= CachedValues.trackerScale) then
        WarningMessage = WarningMessage.."Размер отслеживания заданий|n"
        bDisplayWarning = true
    end
    WarningMessage = WarningMessage.."|nВы хотите перезагрузить сейчас или не изменять настройки?|r"

    if(bDisplayWarning) then
        StaticPopupDialogs["OPTIONS_WARNING_F"] = {
            text = WarningMessage,
            button1 = TEXT("Перезагрузить"),
            button2 = TEXT("Не изменять"),
            OnAccept = function()
                ReloadUI()
            end,
            OnCancel = function()
                -- Reset to cached values since user opted not to reloadui
                QuestieConfig.resizeWorldmap = CachedValues.resizeWorldmap
                QuestieConfig.showToolTips = CachedValues.showToolTips
                QuestieConfig.showTrackerHeader = CachedValues.showTrackerHeader
                QuestieConfig.trackerAlpha = CachedValues.trackerAlpha
                QuestieConfig.trackerBackground = CachedValues.trackerBackground
                QuestieConfig.trackerEnabled = CachedValues.trackerEnabled
                QuestieConfig.trackerList = CachedValues.trackerList
                QuestieConfig.trackerScale = CachedValues.trackerScale
                DEFAULT_CHAT_FRAME:AddMessage("Настройки Questie которые требовали перезагрузку интерфейса не были изменены", 1, 0.75, 0)
            end,
            timeout = 60,
            exclusive = 1,
            hideOnEscape = 1
        }
        StaticPopup_Show("OPTIONS_WARNING_F")
    end

    Questie:Toggle()
    Questie:Toggle()

    QuestieOptionsForm:Hide()
end

function Questie:OptionsForm_SettingOnEnter(SettingsName)
    QuestieOptionsToolTip:SetOwner(this, "ANCHOR_RIGHT", -(this:GetWidth() / 2), 10)

    if(SettingsName == "ArrowEnabled") then
        QuestieOptionsToolTip:AddLine("Стрелка заданий (по умолчанию=выбрано)", 1, 1, 0)

    elseif(SettingsName == "AlwaysShowObjectives") then
        QuestieOptionsToolTip:AddLine("Всегда отображать задания и цели (по умолчанию=выбрано)", 1, 1, 0)

    elseif(SettingsName == "BoldColors") then
        QuestieOptionsToolTip:AddLine("Другие цвета для отслеживания заданий (по умолчанию=не выбрано)", 1, 1, 0)

    elseif(SettingsName == "ClusterQuests") then
        QuestieOptionsToolTip:AddLine("Объединять задания находящиеся рядом (по умолчанию=выбрано)", 1, 1, 0)

    elseif(SettingsName == "CorpseArrow") then
        QuestieOptionsToolTip:AddLine("Отображать стрелку до своего тела (по умолчанию=выбрано)", 1, 1, 0)

    elseif(SettingsName == "HideMinimapIcons") then
        QuestieOptionsToolTip:AddLine("Скрывать значки на миникарте (по умолчанию=не выбрано)", 1, 1, 0)

    elseif(SettingsName == "MaxLevelFilter") then
        QuestieOptionsToolTip:AddLine("Фильтр максимального уровня (по умолчанию=не выбрано)", 1, 1, 0)

    elseif(SettingsName == "MaxShowLevel") then
        QuestieOptionsToolTip:AddLine("Скрывать задания выше уровня игрока на Х (по умолчанию=7)", 1, 1, 0)

    elseif(SettingsName == "MinimapButton") then
        QuestieOptionsToolTip:AddLine("Показывать кнопку Questie на миникарте (по умолчанию=выбрано)", 1, 1, 0)

    elseif(SettingsName == "MinLevelFilter") then
        QuestieOptionsToolTip:AddLine("Фильтр минимального уровня (по умолчанию=не выбрано)", 1, 1, 0)

    elseif(SettingsName == "MinShowLevel") then
        QuestieOptionsToolTip:AddLine("Скрывать задания ниже уровня игрока на Х (по умолчанию=4)", 1, 1, 0)

    elseif(SettingsName == "ResizeWorldmap") then
        QuestieOptionsToolTip:AddLine("Изменять размер карты мира (по умолчанию=не выбрано)", 1, 1, 0)
        QuestieOptionsToolTip:AddLine("Требуется перезагрузка интерфейса", 1, 0, 0)

    elseif(SettingsName == "ShowMapNotes") then
        QuestieOptionsToolTip:AddLine("Значки на карте мира/миникарте (по умолчанию=выбрано)", 1, 1, 0)

    elseif(SettingsName == "ShowProfessionQuests") then
        QuestieOptionsToolTip:AddLine("Задания профессий (по умолчанию=не выбрано)", 1, 1, 0)

    elseif(SettingsName == "ShowToolTips") then
        QuestieOptionsToolTip:AddLine("Всегда отображать подсказки задания и целей (по умолчанию=выбрано)", 1, 1, 0)
        QuestieOptionsToolTip:AddLine("Требуется перезагрузка интерфейса", 1, 0, 0)

    elseif(SettingsName == "ShowTrackerHeader") then
        QuestieOptionsToolTip:AddLine("Отображать заголовок над отслеживанием заданий (по умолчанию=не выбрано)", 1, 1, 0)
        QuestieOptionsToolTip:AddLine("Требуется перезагрузка интерфейса", 1, 0, 0)

    elseif(SettingsName == "TrackerBackground") then
        QuestieOptionsToolTip:AddLine("Рамка и задний фон отслеживания заданий, будет всегда отображаться (по умолчанию=не выбрано)", 1, 1, 0)
        QuestieOptionsToolTip:AddLine("Требуется перезагрузка интерфейса", 1, 0, 0)

    elseif(SettingsName == "TrackerEnabled") then
        QuestieOptionsToolTip:AddLine("Отслеживание заданий (по умолчанию=выбрано)", 1, 1, 0)
        QuestieOptionsToolTip:AddLine("Требуется перезагрузка интерфейса", 1, 0, 0)

    elseif(SettingsName == "TrackerList") then
        QuestieOptionsToolTip:AddLine("Список заданий [Выбрано] = Снизу вверх, [Не выбрано] = Сверху вниз (по умолчанию=не выбрано)", 1, 1, 0)
        QuestieOptionsToolTip:AddLine("Требуется перезагрузка интерфейса", 1, 0, 0)

    elseif(SettingsName == "TrackerScale") then
        QuestieOptionsToolTip:AddLine("Размер отслеживания заданий (по умолчанию=100%)", 1, 1, 0)
        QuestieOptionsToolTip:AddLine("Требуется перезагрузка интерфейса", 1, 0, 0)

    elseif(SettingsName == "TrackerTransparency") then
        QuestieOptionsToolTip:AddLine("Уровень прозрачности заднего фона отслеживания заданий(по умолчанию=40%)", 1, 1, 0)
        QuestieOptionsToolTip:AddLine("Требуется перезагрузка интерфейса", 1, 0, 0)
    end

    QuestieOptionsToolTip:Show()
end

function Questie:OptionsForm_SettingOnLeave()
    QuestieOptionsToolTip:Hide()
end

function Questie:OptionsForm_SettingOnValueChanged()
    if(this:GetName() == QO_FormName.."MaxShowLevelSlider") then
        if(QO_maxshowlevel_current ~= nil) then
            QO_maxshowlevel_current:SetText(tostring(this:GetValue()))
        end
    elseif(this:GetName() == QO_FormName.."MinShowLevelSlider") then
        if(QO_minshowlevel_current ~= nil) then
            QO_minshowlevel_current:SetText(tostring(this:GetValue()))
        end
    elseif(this:GetName() == QO_FormName.."TrackerTransparencySlider") then
        if(QO_trackertransparency_current ~= nil) then
            QO_trackertransparency_current:SetText(tostring(100 - this:GetValue()).."%")
        end
    elseif(this:GetName() == QO_FormName.."TrackerScaleSlider") then
        if(QO_trackerscale_current ~= nil) then
            QO_trackerscale_current:SetText(tostring(this:GetValue()).."%")
        end
    end
end
