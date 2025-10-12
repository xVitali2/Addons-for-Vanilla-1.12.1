--
-- Spanish localization for MobInfo2
--
-- original version by an anonymous benefactor
-- updates kindly submitted by FILI
-- updated kindly submitted by AlbertQ

if ( GetLocale() == "esES" ) then

MI_DESCRIPTION = "A\195\177ade informaci\195\179n sobre mobs para el tooltip y a\195\177ade la informaci\195\179n salud/man\195\161 al marco del objetivo";

MI2_SpellSchools = { Arcana="ar", Fuego="fi", Frost="fr", Sombra="sh", Holy="ho", Naturaleza="na" }

MI_PARSE_SPELL_DMG = "(.+) de (.+) te golpea por (%d+)";
MI_PARSE_BOW_DMG = "(.+) de (.+) te golpea por (%d+)";
MI_PARSE_COMBAT_DMG = "(.+) te golpea por (%d+)";
MI_PARSE_SELF_PET = "(.+) golpea (.+) por (%d+)";
MI_PARSE_SELF_PET_CRIT = "(.+) hace critico (.+) por (%d+)";
MI_PARSE_SELF_PET_SPELL = "(.+) de (.+) golpea a (.+) por (%d+)";
MI_PARSE_SELF_PET_SPELL_CRIT = "(.+) de (.+) hace critico a (.+) por (%d+)";
MI_PARSE_SELF_SPELL_PERIODIC = "(.+) sufre (%d+) (.+) de da\195\177o hacia tu (.+)";

MI_TXT_GOLD   = " Oro";
MI_TXT_SILVER = " Plata";
MI_TXT_COPPER = " Bronce";

MI_TXT_CONFIG_TITLE		= "Opciones de MobInfo 2 ";
MI_TXT_WELCOME          = "Bienvenido a MobInfo 2";
MI_TXT_OPEN				= "Abrir";
MI_TXT_CLASS			= "Clase ";
MI_TXT_HEALTH			= "Salud ";
MI_TXT_MANA				= "Man\195\161 ";
MI_TXT_XP				= "XP ";
MI_TXT_KILLS			= "Muertes ";
MI_TXT_DAMAGE			= "Da\195\177o + [DPS] ";
MI_TXT_TIMES_LOOTED		= "Saqueado veces ";
MI_TXT_EMPTY_LOOTS		= "Saqueos vacios ";
MI_TXT_TO_LEVEL			= "# para nivel";
MI_TXT_QUALITY			= "Calidad ";
MI_TXT_CLOTH_DROP		= "Tela Dada ";
MI_TXT_COIN_DROP		= "Mejor dinero ";
MI_TEXT_ITEM_VALUE		= "Mejor valor de objeto ";
MI_TXT_MOB_VALUE		= "Valor total de Mob ";
MI_TXT_COMBINED			= "Combinado: ";
MI_TXT_MOB_DB_SIZE		= "Tama\195\177o BD de MobInfo2:  ";
MI_TXT_HEALTH_DB_SIZE	= "Tama\195\177o BD de Salud:  ";
MI_TXT_PLAYER_DB_SIZE	= "Tama\195\177o BD de Salud del Jugador:  ";
MI_TXT_ITEM_DB_SIZE		= "Tama\195\177o BD de objetos:  ";
MI_TXT_CUR_TARGET		= "Objetivo actual:  ";
MI_TXT_MH_DISABLED		= "MobInfo ADVERTENCIA: Encontrado el AddOn MobHealth separado. El MobHealth interno se ha desactivado hasta que se borre el MobHealth separado.";
MI_TXT_MH_DISABLED2		= (MI_TXT_MH_DISABLED.."\n\n No vas a perder tus datos por activar MobHealth.\n\nBeneficios: salud/man\195\161 movibles y adaptados fuente y tama\195\177o");
MI_TXT_CLR_ALL_CONFIRM	= "¿Realmente quieres realizar la siguiente operaci\195\179n de borrado?: ";
MI_TXT_SEARCH_LEVEL		= "Nivel Mob:";
MI_TXT_SEARCH_MOBTYPE	= "Tipo de Mob:";
MI_TXT_SEARCH_LOOTS		= "Saqueo Mob:";
MI_TXT_TRIM_DOWN_CONFIRM = "ADVERTENCIA: esto es un borrado inmediato y permanente. ¿Realmente quieres realizar el borrado?"
MI_TXT_CLAM_MEAT		= "Carne de Almeja"
MI_TXT_SHOWING			= "Muestra lista: "
MI_TXT_DROPPED_BY		= "Saqueado por "
MI_TXT_LOCATION			= "Localizaci\195\179n: "
MI_TXT_WRONG_LOC		= "ERROR : La localizaci\195\179n de la base de datos de MobInfo no es compatible con tu localizaci\195\179n de cliente de WoW. La Base de Datos no se puede usar hasta que se corija."
MI_TXT_STATUS = "Status: "
MI_TXT_STATUS_ALREADY = "Status: <data already imported"
MI_TXT_STATUS_OLD = "Status: <import database too old for import>"
MI_TXT_STATUS_WRONG = "Status: <import database has wrong language (locale)>"
MI_TXT_STATUS_AVAILABLE = " available for import"
MI_TXT_STATUS_NOIMPORT = "Status: <no import data>"
MI_TXT_MOBS = " Mobs"
MI_TXT_MOBS_1 = " Mobs:"
MI_TXT_HP_VALUES = " HP values"
MI_TXT_MANA = " Mana"
MI_TXT_HP = "HP    "
MI_TXT_LEVEL = " L"
MI_TXT_XP = "XP    "
MI_TXT_KTL = " KtL    "
MI_TXT_DMG = "Dmg "
MI_TXT_DPS = " Dps   "
MI_TXT_KILLS = "Kills  "
MI_TXT_LOOTS = " Loots"
MI_TXT_CL = "CL     "
MI_TXT_EL = " EL      "
MI_TXT_VAL = "Val    "
MI_TXT_COINS = " Coins"
MI_TXT_Q = "Q      "
MI_TXT_DEBUG_INFO = "--------------  D e b u g   I n f o  --------------"
MI_TXT_DEBUG_DBG = "[DBG] "
MI_TXT_DEBUG_BI = "bi(basic info)"
MI_TXT_DEBUG_QI = "qi(quality info)"
MI_TXT_DEBUG_ML = "ml(mob location)"
MI_TXT_DEBUG_IL = "il(item list)"
MI_TXT_DEBUG_RE = "re(resists)"
MI_TXT_DEBUG_CHAR_DATA = "(char data)"
MI_TXT_DEBUG_HP = "hp(health data)"
MI_TXT_IMMUN = "Immun:"
MI_TXT_RESIST = "Resist:"
MI_TXT_NEW_CORPSE = "storing new corpse ID"
MI_TXT_LOOT_SLOT = "Loot: slot"
MI_TXT_Q_NAME = "name"
MI_TXT_Q_ID = "id"
MI_TXT_Q_q = "q"
MI_TXT_REC_NEW_DPS = "recording new dps: idx"
MI_TXT_NEW_DPS = "new dps"
MI_TXT_REC_NEW_MIN_DMG = "recording new MIN dmg "
MI_TXT_REC_NEW_DMG_FOR = " for "
MI_TXT_REC_NEW_DMG_OLD = "old"
MI_TXT_REC_NEW_MAX_DMG = "recording new MAX dmg "
MI_TXT_REC_KILL_MOB = "recording kill: mob"
MI_TXT_REC_KILL_MOB_KILLS = "kills"
MI_TXT_REC_KILL_MOB_XP = "XP"
MI_TXT_REC_LOC = "recording location"
MI_TXT_SLASH_VER = "v"
MI_TXT_SLASH_DAT_TARGET = "data for target "
MI_TXT_SLASH_DAT_DEL = " has been deleted"
MI_TXT_SLASH_DAT_DB_DEL = "database deleted: "
MI_TXT_SLASH_DB_IMPORT = " starting external database import ...."
MI_TXT_SLASH_IMPORTED = " imported "
MI_TXT_SLASH_NEW_MOBS = " new Mobs"
MI_TXT_SLASH_NEW_HP_VAL = " new health values"
MI_TXT_SLASH_NEW_ITEMS = " new loot items"
MI_TXT_SLASH_UPD_DATA = " updated data for "
MI_TXT_SLASH_EXS_MOBS = " existing Mobs"
MI_TXT_SLASH_NOT_UPD = " did NOT update data for "
MI_TXT_SLASH_VERSION = " MobInfo-2 Version "
MI_TXT_SLASH_USAGE = " Usage: enter /mobinfo2 or /mi2 to open interface"
MI_TXT_SLASH_HELP = " for AddOn help go to "
MI_TXT_SLASH_OFF = "-OFF-"
MI_TXT_SLASH_ON = "-ON-"
MI_TXT_SEARCH_DEL = "search result deleted : "
MI_TXT_SEARCH_MOBS = " Mobs"
MI_TXT_SEARCH_LVL = "  L"
MI_TXT_EVENTS_NEW_TARGET = "new target: id"
MI_TXT_EVENTS_LAST = "last"
MI_TXT_EVENTS_NON_MOB = "non mob loot event: action"
MI_TXT_EVENTS_TYPE = "type"
MI_TXT_EVENTS_NO_XP = "no XP kill event: mob"
MI_TXT_EVENTS_KILL_XP = "kill event with XP: mob"
MI_TXT_EVENTS_XP = "xp"
MI_TXT_EVENTS_MI_VER = "MobInfo-2  v"
MI_TXT_EVENTS_MI_LOADED = "  Loaded, enter /mi2 or /mobinfo2 for interface"
MI_TXT_CONVDROPRATE_CONVERTER = "DR Converter: "
MI_TXT_CONVDROPRATE_MOBSFOUND = " Mobs found in DropRate data,"
MI_TXT_CONVDROPRATE_NEWMOBSFOUND = " new Mobs added to database,"
MI_TXT_CONVDROPRATE_EXISTINGMOBS = " existing Mobs expanded,"
MI_TXT_CONVDROPRATE_PARTIALMOBS = " Mobs partially converted,"
MI_TXT_CONVDROPRATE_SKIPPEDITEMS = " unknown items skipped,"
MI_TXT_CONVDROPRATE_ADDEDITEMS = " items added to database,"
MI_TXT_CONVDROPRATE_CONVERSTART = "DropRate conversion started ..."
MI_TXT_CONVDROPRATE_NOTFOUND = "DropRate database not found"

MI2_CHATMSG_MONSTEREMOTE = "attempts to run away"

BINDING_HEADER_MI2HEADER	= "MobInfo 2"
BINDING_NAME_MI2CONFIG	= "Abrir opciones de MobInfo2"

MI2_FRAME_TEXTS = {};
MI2_FRAME_TEXTS["MI2_FrmTooltipOptions"]	= "Opciones cuadro de texto de Mob";
MI2_FRAME_TEXTS["MI2_FrmHealthOptions"]		= "Opciones de MobHealth";
MI2_FRAME_TEXTS["MI2_FrmDatabaseOptions"]	= "Opciones de Base de Datos";
MI2_FRAME_TEXTS["MI2_FrmHealthValueOptions"]= "Valor de Salud";
MI2_FRAME_TEXTS["MI2_FrmManaValueOptions"]	= "Valor de Man\195\161";
MI2_FRAME_TEXTS["MI2_FrmSearchOptions"]		= "Opciones de b\195\186squeda";
MI2_FRAME_TEXTS["MI2_FrmSearchLevel"]		= "Nivel del Mob";
MI2_FRAME_TEXTS["MI2_FrmItemTooltip"]		= "Opciones Cuadro de Texto de Objeto";
MI2_FRAME_TEXTS["MI2_FrmImportDatabase"]	= "Importa Base de Datos externa de MobInfo"

--
-- This section defines all buttons in the options dialog
--   text : the text displayed on the button
--  help : the (short) one line help text for the button
--   info : additional multi line info text for button
--      info is displayed in the help tooltip below the "help" line
--      info is optional and can be omitted if not required
--

MI2_OPTIONS = {};

MI2_OPTIONS["MI2_OptSearchMinLevel"] = 
{ text = "Min"; help = "nivel m\195\173nimo del mob para opciones de b\195\186squeda"; }

MI2_OPTIONS["MI2_OptSearchMaxLevel"] = 
{ text = "Max"; help = "nivel m\195\161ximo del mob para opciones de b\195\186squeda (debe ser < 66)"; }

MI2_OPTIONS["MI2_OptSearchNormal"] = 
{ text = "Normal"; help = "incluye mobs de tipo normal en los resultados de la b\195\186squeda"; }

MI2_OPTIONS["MI2_OptSearchElite"] = 
{ text = "Elite"; help = "incluye mobs de tipo elite en los resultados de la b\195\186squeda"; }

MI2_OPTIONS["MI2_OptSearchBoss"] = 
{ text = "Jefe"; help = "incluye mobs jefe en los resultados de la b\195\186squeda"; }

MI2_OPTIONS["MI2_OptSearchMinLoots"] = 
{ text = "Min"; help = "n\195\186mero m\195\173nimo de veces que se ha saqueado un mob"; }

MI2_OPTIONS["MI2_OptSearchMobName"] = 
{ text = "Nombre Mob"; help = "nombre completo o parcial para buscar";
info = 'Dejalo vac\195\173o para no restringir la b\195\186squeda a objetos espec\195\173ficos\nIntroduciendo "*" selecciona todos los objetos.'; }

MI2_OPTIONS["MI2_OptSearchItemName"] = 
{ text = "Objeto"; help = "nombre completo o parcial del objeto a buscar";
info = 'dejalo vac\195\173o para buscar todos los nombres de objetos'; }

MI2_OPTIONS["MI2_OptSortByValue"] = 
{ text = "Por recompensa"; help = "Clasifica los resultados de b\195\186squeda por recompensa";
info = 'Clasifica los Mobs por el provecho que puedes sacar de ellos mat\195\161ndolos.'; }

MI2_OPTIONS["MI2_OptSortByItem"] = 
{ text = "Por objetos"; help = "Clasifica los resultados de b\195\186squeda por n\195\186mero de veces que se cuenta el objeto";
info = 'Clasifica los Mobs por cuantas veces ha dado el objeto(s) especificado(s).'; }

MI2_OPTIONS["MI2_OptItemTooltip"] = 
{ text = "Mostrar mobs en cuadro de texto"; help = "Muestra los nombres de los que arrojan un objeto en cuadro de texto del objeto";
info = "Muestra el nombre de todos los Mobs que han arrojado multitud de objetos\nen el cuadro di\195\161logo del objeto. Por cada objeto lista la cantidad\narrojada por el Mob con porcentajes." }

MI2_OPTIONS["MI2_OptCompactMode"] = 
{ text = "Compactar Cuadro de Texto"; help = "Activa un cuadro de de texto compacto que dispone de 2 valores por l\195\173nea en el cuadro de texto";
info = "Compactar cuadro de texto usa textos cortos abreviados para las descripciones.\nPara desactivar la l\195\173nea en el cuadro de texto ambas entrades en esta l\195\173nea deben estar desactivadas." }

MI2_OPTIONS["MI2_OptDisableMobInfo"] = 
{ text = "Desactivar info."; help = "Desactiva mostrar Mob info. en el Cuadro de Texto";
info = "Desactivar toda la informaci\195\179n sobre Mobs." }

MI2_OPTIONS["MI2_OptShowClass"] = 
{ text = "Mostrar clases"; help = "Muestra la clase del Mob"; }

MI2_OPTIONS["MI2_OptShowHealth"] = 
{ text = "Vida"; help = "Muestra info de la vida del mob (actual/max)"; }

MI2_OPTIONS["MI2_OptShowMana"] = 
{ text = "Man\195\161"; help = "Muestra informaci\195\179n de man\195\161/furia/energ\195\173a del Mob (actual/max)"; }

MI2_OPTIONS["MI2_OptShowXp"] = 
{ text = "Exp"; help = "Muestra el n\195\186mero de puntos de experiencia que obtuviste de este";
info = "Esta es la ultima y actual experiencia que te dio el mob.\n(no se muestran los Mobs que son grises para ti)" }

MI2_OPTIONS["MI2_OptShowNo2lev"] = 
{ text = "N\195\186mero para nivel"; help = "Muestra el n\195\186mero de muertes necesarias para subir un nivel";
info = "Este te indica cuantas veces tienes que matar al\nmismo Mob recien matado para alcanzar el siguiente nivel\n(no se muestran los Mobs que son grises para ti)" }

MI2_OPTIONS["MI2_OptShowDamage"] = 
{ text = "Mostrar Daño / DPS"; help = "Muestra rango de da\195\177o Mob (Min/Max) y DPS (da\195\177o por segundo)"; 
info = "Rango de da\195\177o y DPS es calculado y almacenado separadamente por personaje.\nDPS se actualizan y guardan lentamente despu\195\169s de cada pelea." }

MI2_OPTIONS["MI2_OptShowCombined"] = 
{ text = "Mostrar Info. Combinada"; help = "Muestra en modo mensaje combinado en el Cuadro de Texto";
info = "Muestra un mensaje en el cuadro de texto indicando que este modo combinado\nesta activo y listando todos los niveles de mob que han sido combinados\n en un solo cuadro de texto." }

MI2_OPTIONS["MI2_OptShowKills"] = 
{ text = "Muertes"; help = "Muestra el n\195\186mero de veces que matastaste al Mob";
info = "El conteo de muertes es calculado y almacenado\nseparadamente por personaje." }

MI2_OPTIONS["MI2_OptShowLoots"] = 
{ text = "Total de Saqueos"; help = "Muestra el n\195\186mero de veces que un Mob ha sido saqueado"; }

MI2_OPTIONS["MI2_OptShowCloth"] = 
{ text = "Telas Dadas"; help = "Muestra cuantas veces has obtenido telas en el saqueo"; }

MI2_OPTIONS["MI2_OptShowEmpty"] = 
{ text = "Saqueos vac\195\173os"; help = "Muestra el n\195\186mero de cuerpos vac\195\173os encontrados (n\195\186m/porcentaje)";
info = "Este contador se incrementa cuando abres\n un cuerpo que no tiene nada." }

MI2_OPTIONS["MI2_OptShowTotal"] = 
{ text = "Valor total"; help = "Muestra mayor valor total de Mob";
info = "Esta es la suma del dinero y\nel valor de objetos." }

MI2_OPTIONS["MI2_OptShowCoin"] = 
{ text = "Dinero Arrojado"; help = "Muestra la mejor cantidad de monedas arrojada por un Mob";
info = "El valor total de monedas es acumulado y dividido\npor el contador de saqueos.\n(no se muestra si el valor de moneda es 0)" }

MI2_OPTIONS["MI2_OptShowIV"] = 
{ text = "Mayor valor de objeto"; help = "Muestra el mayor valor de objeto de Mob";
info = "El valor total de objetos es acumulable\npor el contador de saqueo.\n(no se muestra con valor 0)" }

MI2_OPTIONS["MI2_OptShowQuality"] = 
{ text = "Calidad del saqueo"; help = "Muestra la calidad del saqueo y porcentaje";
info = "Esto cuenta cuantos objetos de las 5 categorias de calidad\nte ha dado un Mob al saquearlo. Categorias con 0 arrojado no\nse muestran. El porcentaje es la posibilidad de conseguir\nun objeto de un monstruo de la rareza especifica como saqueo." }

MI2_OPTIONS["MI2_OptShowLocation"] = 
{ text = "Mostrar localizaciones"; help = "Muestra la localizaci\195\179n de donde esta el Mob";
info = "Guardar datos debe ser ACTIVADO para que funcione."; }

MI2_OPTIONS["MI2_OptShowItems"] = 
{ text = "Detalles del saqueo"; help = "Muestra nombre y cantidad de los objetos del saqueo";
info = "Guardar datos de objetos saqueo debe estar ACTIVADO para que funcione"; }

MI2_OPTIONS["MI2_OptShowClothSkin"] = 
{ text = "Saqueo Tela y Pieles"; help = "Muestra nombres y cantidad de saqueos de tela y pieles";
info = "Guardar datos de objetos saqueo debe estar ACTIVADO para que funcione"; }

MI2_OPTIONS["MI2_OptSaveItems"] = 
{ text = "Guardar calidad de objetos del Mob:"; help = "Habilita esto para guardar detalles de objetos de saqueo de Mobs.";
info = "Puedes elegir el nivel de la calidad de objetos para guardar"; }

MI2_OPTIONS["MI2_OptShowBlankLines"] = 
{ text = "Mostrar l\195\173neas blancas"; help = "Muestra l\195\173neas en blanco en el Cuadro de Texto";
info = "Las l\195\173neas en blanco se introducen para mejorar la lectura \ncreando secciones en el Cuadro de Texto" }

MI2_OPTIONS["MI2_OptShowResists"] = 
{ text = "Resistencias e Inmunidades"; help = "Muestra las resistencias e inmunidades en el Cuadro de Texto";
info = "Datos almacenados sobre las resistencias \195\179 inmunidades\nde la escuela de magia elemental del enemigo\nson a\195\177adidos al Cuadro de Texto"}

MI2_OPTIONS["MI2_OptCombinedMode"] = 
{ text = "Combinar mobs iguales"; help = "Combina datos para Mob con el mismo nombre";
info = "Combina de modo que acumulara los datos para Mobs\ncon el mismo nombre pero de diferente nivel. Cuando esta activo un\nindicador se muestra en Cuadro de Texto" }

MI2_OPTIONS["MI2_OptKeypressMode"] = 
{ text = "Presionar ALT para MobInfo"; help = "Solo se muestra MobInfo en Cuadro de Texto cuando pulsas la tecla ALT"; }

MI2_OPTIONS["MI2_OptItemFilter"] = 
{ text = "Filtrar saqueo de Objetos"; help = "Establece filtrado de expresi\195\179n para objetos saqueados en Cuadros de Textos";
info = "Sirve para hacer un filtro. Por ejemplo si pones 'monkey' solo se monstraran objetos en que sale esa palabra. Para mostrar todos dejar vacio." }

MI2_OPTIONS["MI2_OptSavePlayerHp"] = 
{ text = "Guardar base de datos de Salud de pjs permanentemente"; help = "Guarda permanentemente salud de jugador en batallas PvP.";
info = "Normalmente los datos de salud de jugador de batallas PvP son descartadas despues de \nuna sesi\195\179n. Ajustando esta opcion te permite guardar los datos." }

MI2_OPTIONS["MI2_OptAllOn"] = 
{ text = "Todo ON"; help = "Activa todas las opciones MobInfo"; }

MI2_OPTIONS["MI2_OptAllOff"] = 
{ text = "Todo OFF"; help = "Desactiva todas las opciones de MobInfo"; }

MI2_OPTIONS["MI2_OptMinimal"] = 
{ text = "M\195\173nimo"; help = "Pone el MobInfo con las opciones m\195\173nimas"; }

MI2_OPTIONS["MI2_OptDefault"] = 
{ text = "Por defecto"; help = "Establece las opciones por defecto"; }

MI2_OPTIONS["MI2_OptBtnDone"] = 
{ text = "Hecho"; help = "Cierra MobInfo"; }

MI2_OPTIONS["MI2_OptStableMax"] = 
{ text = "Muestra vida m\195\161xima estable"; help = "Muestra un m\195\161ximo de saludo estable en el marco del objetivo";
info = "Cuando lo actives la salud m\195\161xima no variara en la\nventana del objetivo durante la batalla.\nEl valor actualizado se muestra cuando empieza la siguiente batalla."; }

MI2_OPTIONS["MI2_OptTargetHealth"] = 
{ text = "Mostrar valor de Vida"; help = "Muestra el valor de la vida en el marco del objetivo"; }

MI2_OPTIONS["MI2_OptTargetMana"] = 
{ text = "Mostrar valor de Man\195\161"; help = "Muestra el valor de man\195\161 en el marco del objetivo"; }

MI2_OPTIONS["MI2_OptHealthPercent"] = 
{ text = "Mostrar porcentaje"; help = "Agrega un porcentaje de la vida en el marco del objetivo"; }

MI2_OPTIONS["MI2_OptManaPercent"] = 
{ text = "Mostrar porcentaje"; help = "Agrega un porcentaje de man\195\161 en el marco del objetivo"; }

MI2_OPTIONS["MI2_OptHealthPosX"] = 
{ text = "Posici\195\179n Horizontal"; help = "Ajusta la posici\195\179n horizontal de la vida en el marco del objetivo"; }

MI2_OPTIONS["MI2_OptHealthPosY"] = 
{ text = "Posici\195\179n Vertical"; help = "Ajusta la posici\195\179n vertical de la vida en el marco del objetivo"; }

MI2_OPTIONS["MI2_OptManaPosX"] = 
{ text = "Posici\195\179n Horizontal"; help = "Ajusta la posici\195\179n horizontal del man\195\161 en el marco del objetivo"; }

MI2_OPTIONS["MI2_OptManaPosY"] = 
{ text = "Posici\195\179n Vertical"; help = "Ajusta la posici\195\179n horizontal del man\195\161 en el marco del objetivo"; }

MI2_OPTIONS["MI2_OptTargetFont"] = 
{ text = "Fuente"; help = "Establece la letra de los valores vida/man\195\161";
choice1= "Fuente N\195\186meros"; choice2="Fuente Juego"; choice3="Fuente Texto" }

MI2_OPTIONS["MI2_OptTargetFontSize"] = 
{ text = "Tama\195\177o de Fuente"; help = "Fija el tama\195\177o de la letra en los valores vida/man\195\161"; }

MI2_OPTIONS["MI2_OptClearTarget"] = 
{ text = "Borrar datos de Objetivo"; help = "Borra los datos del objetivo actual de la Base de Datos."; }

MI2_OPTIONS["MI2_OptClearMobDb"] = 
{ text = "Purgar base de datos"; help = "Borra los datos completos de mobs de la Base de Datos."; }

MI2_OPTIONS["MI2_OptClearHealthDb"] = 
{ text = "Purgar base de datos"; help = "Borra los datos de la vida de la Base de Datos."; }

MI2_OPTIONS["MI2_OptClearPlayerDb"] = 
{ text = "Purgar base de datos"; help = "Borrar datos de la vida de los jugadores."; }

MI2_OPTIONS["MI2_OptSaveBasicInfo"] = 
{ text = "Guardar Info. b\195\161sica Mob"; help = "Guarda un grupo de informaci\195\179n b\195\161sica del mob.";
info = "Info. b\195\161sica Mob incluye: exp, tipo mob, contadores para: saqueos, saqueos vac\195\173os, telas, dinero, valor de los objetos"; }

MI2_OPTIONS["MI2_OptSaveCharData"] = 
{ text = "Guardar datos de un pj espec\195\173fico"; help = "Guarda todos los datos de Mob que son espec\195\173ficos para cada personaje.";
info = "Con esto activas o desactivas el guardado de los siguientes datos:\nnñumero de muertes, daño m\195\173n/m\195\161x, DPS (daño por seg.)\n\nEstos datos son salvados separadamente para cada personaje. Salvar solo puede\nactivarse/desactivarse para cada grupo completo de 4 valores"; }

MI2_OPTIONS["MI2_OptSaveLocation"] = 
{ text = "Guardar datos de localizaci\195\179n de Mobs"; help = "Recuerda las areas y coordenadas donde encontrar los Mobs." }

MI2_OPTIONS["MI2_OptSaveResist"] = 
{ text = "Guarda datos Resistencias e Inmunidades"; help = "Guarda datos sobre las resistencias e inmunidades de los Enemigos a las escuelas de magia.";
info = "MobInfo guarda para las escuelas de magia cuantos hechizos por escuela\nhan impactado con \195\169xito contra cuantos han sido resistidos."; }

MI2_OPTIONS["MI2_OptItemsQuality"] = 
{ text = "Guardar calidad"; help = "Guarda detalles de calidad del objeto con la calidad seleccionada o mejor.";
choice1 = "Gris y mejor"; choice2="Blanco y mejor"; choice3="Verde y mejor" }

MI2_OPTIONS["MI2_OptTrimDownMobData"] = 
{ text = "Reducir tama\195\177o de base de datos"; help = "Reduce el tama\195\177o de la Base de Datos de Mobs borrando datos sin importancia";
info = "Datos sin importancia son todos los datos\nque no marcas para guardarse."; }

MI2_OPTIONS["MI2_OptImportMobData"] = 
{ text = "Comienza la Importaci\195\179n"; help = "Importa una Base de Datos de Mobs externa en tu Base de Datos";
info = "IMPORTANTE: ¡ por favor lee las instrucciones de importaci\195\179n !\n¡ SIEMPRE haz una copia de seguridad de Base de Datos ANTES de importar !"; }

MI2_OPTIONS["MI2_OptDeleteSearch"] = 
{ text = "BORRAR"; help = "Borra todos los Mobs en la lista resultado de la b\195\186squeda de la Base de Datos de MobInfo.";
info = "ADVERTENCIA: esta operaci\195\179n no se puede deshacer.\n¡ Por favor usa con cuidado !\nPuedes querer hacer una copia de seguridad de base de datos de MobInfo antes de borrar los Mobs."; }

MI2_OPTIONS["MI2_OptImportOnlyNew"] = 
{ text = "Importa solo Mobs Desconocidos"; help = "Importa solo los Mobs que no existen en tu base de datos";
info = "Activando esta opci\195\179n previene que la informaci\195\179n de los Mobs existentes\nsea modificada. Solo Mobs desconocidos (ej. nuevo) seran importados. Esto\npermite importar sobreponiendo parcialmente la base de datos\nsin causar problemas de consitencia."; }

MI2_OPTIONS["MI2_MainOptionsFrameTab1"] = 
{ text = "Cuadro de Texto"; help = "Fija las opciones para mostrar MobInfo en el Cuadro de Texto"; }

MI2_OPTIONS["MI2_MainOptionsFrameTab2"] = 
{ text = "Salud/Man\195\161"; help = "Fija opciones para mostrar vida/man\195\161 en el marco objetivo"; }

MI2_OPTIONS["MI2_MainOptionsFrameTab3"] = 
{ text = "Base de Datos"; help = "Opciones de Base de Datos"; }

MI2_OPTIONS["MI2_MainOptionsFrameTab4"] = 
{ text = "Buscar"; help = "Busca en la base de datos"; }

MI2_OPTIONS["MI2_SearchResultFrameTab1"] = 
{ text = "Lista Mobs"; help = "Muestra la lista de Mobs"; }

MI2_OPTIONS["MI2_SearchResultFrameTab2"] = 
{ text = "Lista Objetos"; help = "Muestra la lista de objetos"; }

end