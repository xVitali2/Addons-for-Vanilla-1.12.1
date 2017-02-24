--[[
	WARNING: This is a generated file.
	If you wish to perform or update localizations, please go to our Localizer website at:
	http://norganna.org/localizer/index.php

	AddOn: Informant
	Revision: $Id: InfStrings.lua 1000 2006-09-12 02:19:20Z mentalpower $
	Version: 3.9.0.1000 (Kangaroo)

	License:
		This program is free software; you can redistribute it and/or
		modify it under the terms of the GNU General Public License
		as published by the Free Software Foundation; either version 2
		of the License, or (at your option) any later version.

		This program is distributed in the hope that it will be useful,
		but WITHOUT ANY WARRANTY; without even the implied warranty of
		MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
		GNU General Public License for more details.

		You should have received a copy of the GNU General Public License
		along with this program(see GPL.txt); if not, write to the Free Software
		Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
]]

InformantLocalizations = {

	csCZ = {


		-- Section: Commands
		CmdClearAll	= "vse";
		CmdDefault	= "vychozi";
		CmdDisable	= "vypnout";
		CmdEmbed	= "vlozit";
		CmdHelp	= "napoveda";
		CmdLocale	= "jazyk";
		CmdOff	= "off";
		CmdOn	= "on";
		CmdToggle	= "prepnout";
		OptLocale	= "<jazyk>";
		ShowIcon	= "ukaz-ikonu";
		ShowMerchant	= "zobraz-obchodnika";
		ShowQuest	= "zobraz-quest";
		ShowStack	= "zobraz-sadu";
		ShowUsage	= "zobraz-vyuziti";
		ShowVendor	= "zobraz-vendora";
		ShowVendorBuy	= "zobraz-vendor-koupi";
		ShowVendorSell	= "zobraz-vendor-prodej";


		-- Section: Generic Messages
		MesgNotLoaded	= "Informant neni nahran. zadej /informant pro vice infromaci.";
		StatOff	= "Nezobrazuji zadne informace o vecech";
		StatOn	= "Zobrazuji upravene informace o vecech";
		Welcome	= "|c40ff50ffVitej v informantu|r Protoze toto je poprve kdy pouzivas Informant, zobrazuje se tato zprava jako upozorneni ze musis v sekci \"|cffffffffKeybindings|r\" v \"|cffffffffGame Menu|r\" nastavit klavesu kterou budes zozrazovat toto okno. K zobrazeni dodatecnych informaci pote staci najet mysi na predmet ktery te zajima a stisknout nastavenou klavesu. Zobrazi se toto okno s informacemi o vybranem predmetu. Dalsim stisknutim nastavene klavesy nebo kliknutim na krizek okno zavres. Nyni klikni na krizek.";


		-- Section: Help Text
		GuiDefaultAll	= "Obnov vsechna vychozi Informant nastaveni";
		GuiDefaultAllButton	= "Obnov vse";
		GuiDefaultAllHelp	= "KLikni zde pro navrat vsech Informant nastaveni na default. POZOR: Nelze vratit!";
		GuiDefaultOption	= "Obnov toto nastaveni";
		GuiEmbed	= "Informace vlozeny do napoved";
		GuiEmbedHeader	= "Vlozeno";
		GuiInfoHeader	= "Dalsi informace";
		GuiInfoHelp	= "Ovlada jake dalsi informace jsou zobrazeny v napovede";
		GuiInfoIcon	= "Zobraz ikonu inventare";
		GuiInfoMerchant	= "Zobraz obchodniky";
		GuiInfoQuest	= "Zobraz informace o Questu";
		GuiInfoStack	= "Zobraz informaci sady";
		GuiInfoUsage	= "Zobraz informace o vyuziti";
		GuiLocale	= "Nastav jazyk";
		GuiMainEnable	= "Zapnout Informant";
		GuiMainHelp	= "Obsahuje nastaveni pro Informant, AddOn ktery zobrazuje detailni informace o predmetech";
		GuiOtherHeader	= "Jina nastaveni";
		GuiOtherHelp	= "Ruzna Informant nastaveni";
		GuiReloadui	= "Znovu nahraj Uzivatelske Rozhrani";
		GuiReloaduiButton	= "NahrajUR";
		GuiReloaduiFeedback	= "Nyni nahravam WoW UR";
		GuiReloaduiHelp	= "Klikni zde pro nove nahrani WoW Uziv. Rozhrani po zmene jazyka tak aby se informace v tomto okne zobrazila ve zvolenem jazyce. POZOR: Muze trvat i nekolik minut!";
		GuiVendor	= "Zobraz NPC-Vendor Ceny";
		GuiVendorBuy	= "Zobraz cenu u Vendora - BUY";
		GuiVendorHeader	= "Vendor ceny";
		GuiVendorHelp	= "Nastaveni vztazene k NPC nakup/prodej ceny.";
		GuiVendorSell	= "Zobraz Vendor prodejni cenu";
		HelpDefault	= "Nastav informant option na zakladni hodnotu. Muzes take zadat specialni klicove slovo \"all\" pro nastaveni vseho na default.";
		HelpDisable	= "Informant se automaticky nenahraje od prostiho logu.";
		HelpEmbed	= "Vlozit text do originalniho herniho tooltipu (pozn: urcite vlastnosti se vypnou)";
		HelpIcon	= "Vyber jestli se ma ukazovat ikona inventare";
		HelpLocale	= "Zmenit lokalitu pouzivanou pro zobrazovani zprav od Informantu";
		HelpMerchant	= "Vyber jestli zobrazit obchodniky co dodavaji veci";
		HelpOnoff	= "Prepina zobrazovani informacnich dat on/off";
		HelpQuest	= "Vyber jestli zobrazit vyuziti questovych veci";
		HelpStack	= "Vyber jestli ukazat stackovatelnost itemu";
		HelpUsage	= "Vyber jestli ukazat pouzitelnost tradeskill itemu";
		HelpVendor	= "Vyber jestli zobrazit oceneni itemu u vendora";
		HelpVendorBuy	= "Vyber jestli zobrazit vykupni cenu veci u vendora (req show-vendor=on)";
		HelpVendorSell	= "Vyber jestli zobrazit prodejni cenu veci u vendora (req show-vendor=on)";


		-- Section: Keybinding Text
		BindingHeader	= "Informant";
		BindingTitle	= "Prepinac okna informantu";


		-- Section: Tooltip Messages
		FrameTitle	= "Informace veci ";
		FrmtActDefault	= "Informantovo %s moznosti byly restartovany na defaultni nastaveni";
		FrmtActDefaultall	= "Vsechny moznosti byly restartovany na defaultni hodnoty.";
		FrmtActDisable	= "Nezobrazuji data veci %s";
		FrmtActEnable	= "Zobrazuji data veci %s";
		FrmtActEnabledOn	= "Zobrazuji vecny %s na %s;";
		FrmtActSet	= "Nastavit %s na \"%s\"";
		FrmtActUnknown	= "Nezname klicove slovo: '%s'";
		FrmtInfoBuy	= "Koupit od vendora";
		FrmtInfoBuymult	= "Kup $d (%s ks)";
		FrmtInfoClass	= "Trida: %s";
		FrmtInfoMerchants	= "Prodavano %d obchodniky";
		FrmtInfoQuest	= "Quest item v %d questech";
		FrmtInfoSell	= "Prodat vendoru";
		FrmtInfoSellmult	= "Prodej %d (%s ks)";
		FrmtInfoStx	= "Stackuje v balenich po $d";
		FrmtInfoUse	= "Pouziva se pro: %s";
		FrmtUnknownLocale	= "Zadana lokalita ('%s') je neznama. Platne lokace jsou:";
		FrmtWelcome	= "Informant v%s nahran";
		InfoHeader	= "Informace na |cff%s%s|r";
		InfoNoItem	= "Nejprve prejedte mzsi pres item, pak stisknete aktivacni klavesu";
		InfoPlayerMade	= "Udelano levelem %d %s";
		InfoQuestHeader	= "Vyu\195\133\194\190ito v %d questech:";
		InfoQuestName	= "  %d for \"%s\" (level %d)";
		InfoQuestSource	= "Quest data dodana od";
		InfoVendorHeader	= "Dostupn\195\131\194\169 od %d obchodn\195\131\194\173k\195\133\194\175:";
		InfoVendorName	= "%s";


		-- Section: Type Messages
		AdditAlcohol	= "Alkohol";
		AdditBuff	= "Buff";
		AdditDrink	= "Piti";
		AdditFirework	= "Ohnostroj";
		AdditFood	= "Jidlo";
		AdditGiftwrap	= "Darkove baleni";
		AdditLure	= "Lakadlo";
		AdditPoison	= "Jed";
		AdditPotion	= "Napoj";
		AdditRestorative	= "Posilnujici";
		AdditScroll	= "Svitek";
		SkillAlchemy	= "Alchymie";
		SkillBlacksmithing	= "Kovarstvi";
		SkillCooking	= "Vareni";
		SkillDruid	= "Druidska kouzla";
		SkillEnchanting	= "Zaklinani";
		SkillEngineering	= "Inzenyrstvi";
		SkillFirstAid	= "Prvni pomoc";
		SkillLeatherworking	= "Kozesnictvi";
		SkillMage	= "Carodejova kouzla";
		SkillMining	= "Tezeni";
		SkillPaladin	= "Paladinova kouzla";
		SkillPriest	= "Knezska kouzla";
		SkillRogue	= "Roguovy dovednosti";
		SkillShaman	= "Shamanova kouzla";
		SkillTailoring	= "Krejcovstvi";
		SkillWarlock	= "Warlockova kouzla";

	};

	daDK = {


		-- Section: Commands
		CmdClearAll	= "alle";
		CmdDefault	= "Standard";
		CmdDisable	= "deaktiver";
		CmdEmbed	= "indkapsle";
		CmdHelp	= "hj\195\166lp";
		CmdLocale	= "sprog";
		CmdOff	= "fra";
		CmdOn	= "til";
		CmdToggle	= "skift";
		OptLocale	= "<sprog>";
		ShowIcon	= "vis-ikon";
		ShowMerchant	= "vis-handlende";
		ShowQuest	= "vis-opgave";
		ShowStack	= "vis-stak";
		ShowUsage	= "vis-brug";
		ShowVendor	= "vis-koebmand";
		ShowVendorBuy	= "vis-koebmand-koeb";
		ShowVendorSell	= "vis-koebmand-salg";


		-- Section: Generic Messages
		MesgNotLoaded	= "Informant er ikke indl\195\166st. Skriv /informant for mere info.";
		StatOff	= "Viser ikke item informationer";
		StatOn	= "Viser konfigurerede informationer om items";
		Welcome	= "|c40ff50ffVelkommen til Informant|r Da det er f\195\184rste gang du bruger Informant, f\195\165r du denne besked for at fort\195\166lle at du b\195\184r lave en tastaturgenvej i |cffffffffKeybindings|r sektionen i |cffffffffGame Menu|rFra det \195\184jeblik kan du vise udvidet information om dine ting, ved at pege musen p\195\165 tingen og derefter trykke p\195\165 den valgte tast. S\195\165 vil dette vindue komme frem med alle mulige informationer som er v\195\166rd at vide. For at fjerne vinduet trykker du p\195\165 tasten igen eller klikker p\195\165 Close knappen.";


		-- Section: Help Text
		GuiDefaultAll	= "Nulstil alle Informant valg";
		GuiDefaultAllButton	= "Nulstil Alt";
		GuiDefaultAllHelp	= "Klik her for at saette alle Informants valg til deres standard vaerdi. ADVARSEL. Dette valg kan ikke fortrydes.";
		GuiDefaultOption	= "Nulstil dette valg";
		GuiEmbed	= "Integrer information i spillets tooltip.";
		GuiEmbedHeader	= "Integrer";
		GuiInfoHeader	= "Yderlig information";
		GuiInfoHelp	= "Bestem hvilken yderlig information der skal vises i tooltip";
		GuiInfoIcon	= "Vis inventar ikon";
		GuiInfoMerchant	= "Vis handlende";
		GuiInfoQuest	= "Vis opgave (quest) information";
		GuiInfoStack	= "Vis stak antal";
		GuiInfoUsage	= "Vis brugs information";
		GuiLocale	= "Saet sprog til";
		GuiMainEnable	= "Aktiver Informant";
		GuiMainHelp	= "Indeholder valg for Informant et Add-On der viser detaljerede information om ting";
		GuiOtherHeader	= "Andre valg";
		GuiOtherHelp	= "Yderligere Informat valg";
		GuiReloadui	= "Genindlaes bruger interface";
		GuiReloaduiButton	= "Genindlaes";
		GuiReloaduiFeedback	= "Genindlaeser WoW bruger interface";
		GuiReloaduiHelp	= "Klik her for at genindlaese WoW bruger interfacet efter at have aendret sproget, saa sproget i disse konfigurationsvinduer passer med det du har valgt. Bemaerk: Dette kan tage nogle minutter.";
		GuiVendor	= "Vis handlendes priser";
		GuiVendorBuy	= "Vis handlendes koebspriser";
		GuiVendorHeader	= "Handlendes priser";
		GuiVendorHelp	= "Valg omkring NPC koeb/salg priser";
		GuiVendorSell	= "Vis handlendes salgs priser";
		HelpDefault	= "Saet et Informant valg til dets standard vaerdi. Du kan ogsaa angive alt for at saette alle Informant valg til deres standard vaerdi.";
		HelpDisable	= "Goer at Informant ikke indlaeses automatisk naeste gang du logger ind";
		HelpEmbed	= "Integrerer teksten i spillets egen tooltip (Bemaerk: Visse valg er umulige naar dette er aktiveret).";
		HelpIcon	= "V\195\166lg at vise objektets ikon";
		HelpLocale	= "Aendrer sproget som bruges til at visse Informant beskeder.";
		HelpMerchant	= "Vaelg om det skal vises hvilke handlende som saelger tingen.";
		HelpOnoff	= "Vaelg om Informant viser data eller ej.";
		HelpQuest	= "Vaelg om brug i opgaver skal vises";
		HelpStack	= "Vaelg om der skal vises hvor mange der kan vaere i hver stak.";
		HelpUsage	= "Vaelg om der skal vises hvilke professioner som bruger denne ting";
		HelpVendor	= "Vaelg om handlendes priser skal vises";
		HelpVendorBuy	= "Vaelg om handlendes koebs priser skal vises (kraever handlendes priser er slaaet til)";
		HelpVendorSell	= "Vaelg om handlendes slags priser skal vises (kraever handlendes priser er slaaet til)";


		-- Section: Keybinding Text
		BindingHeader	= "Informant";
		BindingTitle	= "Skift Information vindue til/fra.";


		-- Section: Tooltip Messages
		FrameTitle	= "Informant information";
		FrmtActDefault	= "Informant's %s valg er blevet sat til sin standard vaerdi.";
		FrmtActDefaultall	= "Alle Informant valg er blevet sat til deres standard vaerdi.";
		FrmtActDisable	= "Viser ikke oplysninger om %s";
		FrmtActEnable	= "Viser oplysninger om %s";
		FrmtActEnabledOn	= "Viser oplysninger om %s paa %s";
		FrmtActSet	= "Saet %s til '%s'";
		FrmtActUnknown	= "Ukendt kommando noegleord: '%s'";
		FrmtInfoBuy	= "Koeb fra handlende";
		FrmtInfoBuymult	= "Koeb %d (%s hver)";
		FrmtInfoClass	= "Klasse: %s";
		FrmtInfoMerchants	= "Saelges af %d handlende";
		FrmtInfoQuest	= "Opgave ting i %d opgaver";
		FrmtInfoSell	= "Saelg til handlende";
		FrmtInfoSellmult	= "Salg %d (%s hver)";
		FrmtInfoStx	= "%d pr stak";
		FrmtInfoUse	= "Bruges til: %s";
		FrmtUnknownLocale	= "Sproget du har angivet ('%s') findes ikke. Kendte sprog er:";
		FrmtWelcome	= "Informant v%s laest ind";
		InfoHeader	= "Information om |cff%s%s|r";
		InfoNoItem	= "Du skal have musen over en ting, foer du trykker paa informations tasten.";
		InfoPlayerMade	= "Laves af level %d %s";
		InfoQuestHeader	= "Bruges i %d opgaver:";
		InfoQuestName	= "  %d for \"%s\" (level %d)";
		InfoQuestSource	= "Quest data suppleret af";
		InfoVendorHeader	= "Kan koebes hos %d handlende";
		InfoVendorName	= "%s";


		-- Section: Type Messages
		AdditAlcohol	= "Alkohol";
		AdditBuff	= "Buff";
		AdditDrink	= "Drikkevare";
		AdditFirework	= "Fyrvaerkeri";
		AdditFood	= "Mad";
		AdditGiftwrap	= "Gavepapir";
		AdditLure	= "Madding";
		AdditPoison	= "Gift";
		AdditPotion	= "Potion";
		AdditRestorative	= "Genoprettende";
		AdditScroll	= "Skriftrulle";
		SkillAlchemy	= "Alkemy";
		SkillBlacksmithing	= "Smedekunnen";
		SkillCooking	= "Madlavning";
		SkillDruid	= "Druide formular";
		SkillEnchanting	= "Enchanting";
		SkillEngineering	= "Maskinkunnen";
		SkillFirstAid	= "Foerstehjaelp";
		SkillLeatherworking	= "Laederforarbejdning";
		SkillMage	= "Troldmands formular";
		SkillMining	= "Mine kunnen";
		SkillPaladin	= "Paladin formular";
		SkillPriest	= "Praeste formular";
		SkillRogue	= "Rogue kunnen";
		SkillShaman	= "Shaman formular";
		SkillTailoring	= "Syning";
		SkillWarlock	= "Warlock formular";

	};

	deDE = {


		-- Section: Commands
		CmdClearAll	= "all";
		CmdDefault	= "default";
		CmdDisable	= "disable";
		CmdEmbed	= "embed";
		CmdHelp	= "help";
		CmdLocale	= "locale";
		CmdOff	= "off";
		CmdOn	= "on";
		CmdToggle	= "toggle";
		OptLocale	= "<Sprache>";
		ShowIcon	= "show-icon";
		ShowMerchant	= "show-merchant";
		ShowQuest	= "show-quest";
		ShowStack	= "show-stack";
		ShowUsage	= "show-usage";
		ShowVendor	= "show-vendor";
		ShowVendorBuy	= "show-vendor-buy";
		ShowVendorSell	= "show-vendor-sell";


		-- Section: Generic Messages
		MesgNotLoaded	= "Informant ist nicht geladen. Geben Sie /informant ein um mehr Informationen zu erhalten.";
		StatOff	= "Informationen zu Gegenst\195\164nden werden nicht angezeigt";
		StatOn	= "Informationen zu Gegenst\195\164nden werden angezeigt";
		Welcome	= "|c40ff50ffWillkommen bei Informant|r Da Sie Informant das erste Mal nutzen erscheint diese Nachricht, um Ihnen mitzuteilen, dass sie eine Taste belegen m\195\188ssen, um dieses Fenster innerhalb der |cffffffffTastaturbelegung|r Sektion des |cffffffffHauptmen\195\188|r anzeigen zu lassen. Um erweiterte Informationen \195\188ber Gegenst\195\164nde in ihrem Inventar zu erhalten, m\195\188ssen sie die Maus \195\188ber den gew\195\188nschten Gegenstand bewegen und die von Ihnen gew\195\164hlte Taste dr\195\188cken und es erscheint ein Fenster mit Informationen \195\188ber diesen Gegenstand. Zum Schliessen des Fensters bet\195\164tigen sie die Taste erneut oder sie dr\195\188cken den Schliessen Button dieses Fensters. Zum Fortfahren dr\195\188cken sie bitte den Schliessen-Button.";


		-- Section: Help Text
		GuiDefaultAll	= "Alle Einstellungen zur\195\188cksetzen";
		GuiDefaultAllButton	= "Alles zur\195\188cksetzen";
		GuiDefaultAllHelp	= "Hier klicken um alle Informant-Optionen auf ihren Standardwert zu setzen.\nWARNUNG: Dieser Vorgang kann NICHT r\195\188ckg\195\164ngig gemacht werden.";
		GuiDefaultOption	= "Diese Einstellung zur\195\188cksetzen";
		GuiEmbed	= "In-Game Tooltip zur Anzeige verwenden";
		GuiEmbedHeader	= "Art der Anzeige";
		GuiInfoHeader	= "Zus\195\164tzliche Informationen";
		GuiInfoHelp	= "Steuert welche zus\195\164tzlichen Informationen angezeigt werden";
		GuiInfoIcon	= "Zeige Symbol an";
		GuiInfoMerchant	= "Zeige H\195\164ndler";
		GuiInfoQuest	= "Zeige die Verwendung bei Quests an";
		GuiInfoStack	= "Zeige die Stapelgr\195\182\195\159e an";
		GuiInfoUsage	= "Zeige den Verwendungszweck an";
		GuiLocale	= "Setze das Gebietsschema auf";
		GuiMainEnable	= "Informant aktivieren";
		GuiMainHelp	= "Einstellungen f\195\188r Informant, einem AddOn das detaillierte Informationen \195\188ber einen Gegenstand (H\195\164ndlerpreise, Verwendungszweck etc.) anzeigt.";
		GuiOtherHeader	= "Sonstige Optionen";
		GuiOtherHelp	= "Sonstige Informant-Optionen";
		GuiReloadui	= "Benutzeroberfl\195\164che neu laden";
		GuiReloaduiButton	= "Neu laden";
		GuiReloaduiFeedback	= "WoW-Benutzeroberfl\195\164che wird neu geladen";
		GuiReloaduiHelp	= "Hier klicken um die WoW-Benutzeroberfl\195\164che nach einer \n\195\132nderung des Gebietsschemas neu zu laden, so dass die Sprache des Konfigurationsmen\195\188s diesem entspricht. Hinweis: Dieser Vorgang kann einige Minuten dauern.";
		GuiVendor	= "Zeige H\195\164ndlerpreise";
		GuiVendorBuy	= "Zeige H\195\164ndler-Einkaufspreise";
		GuiVendorHeader	= "H\195\164ndlerpreise";
		GuiVendorHelp	= "Einstellungen im Zusammenhang mit Verkaufs-/Einkaufspreisen von NPCs.";
		GuiVendorSell	= "Zeige H\195\164ndler-Verkaufspreise";
		HelpDefault	= "Setzt die angegebene Informant-Option auf ihren Standardwert zur\195\188ck. Mit dem Schl\195\188sselwort \"all\" werden alle Informant-Optionen zur\195\188ckgesetzt.";
		HelpDisable	= "Verhindert das automatische Laden von Informant beim Login";
		HelpEmbed	= "Zeigt den Text im In-Game Tooltip \n(Hinweis: Einige Funktionen stehen dann nicht zur Verf\195\188gung).";
		HelpIcon	= "Schaltet die Anzeige des Inventarsymbols eines Gegenstands ein/aus.";
		HelpLocale	= "\195\132ndert das Gebietsschema das zur Anzeige von Informant-Meldungen verwendet wird.";
		HelpMerchant	= "Schaltet die Anzeige von H\195\164ndlern die den Gegenstand anbieten ein/aus.";
		HelpOnoff	= "Schaltet die Anzeige der Auktions-Informationen ein/aus.";
		HelpQuest	= "Schaltet die Anzeige des Verwendungszwecks f\195\188r Quests ein/aus.";
		HelpStack	= "Schaltet die Anzeige der Stapelgr\195\182\195\159e ein/aus.";
		HelpUsage	= "Schaltet die Anzeige des Verwendungszwecks f\195\188r Handwerkswaren ein/aus.";
		HelpVendor	= "Schaltet die Anzeige der H\195\164ndlerpreise ein/aus.";
		HelpVendorBuy	= "Schaltet die Anzeige der H\195\164ndlereinkaufspreise ein/aus (show-vendor muss eingeschaltet sein).";
		HelpVendorSell	= "Schaltet die Anzeige der H\195\164ndlerverkaufspreise ein/aus (show-vendor muss eingeschaltet sein).";


		-- Section: Keybinding Text
		BindingHeader	= "Informant";
		BindingTitle	= "Informationsfenster ein-/ausschalten";


		-- Section: Tooltip Messages
		FrameTitle	= "Informant-Informationen zum Gegenstand";
		FrmtActDefault	= "Die Informant-Option %s wurde auf den Standardwert zur\195\188ckgesetzt.";
		FrmtActDefaultall	= "Alle Informant-Optionen wurden auf Standardwerte zur\195\188ckgesetzt.";
		FrmtActDisable	= "%s wird nicht angezeigt";
		FrmtActEnable	= "%s wird angezeigt";
		FrmtActEnabledOn	= "Zeige %s auf %s";
		FrmtActSet	= "Setze %s auf '%s'";
		FrmtActUnknown	= "Unbekannter Befehl: '%s'";
		FrmtInfoBuy	= "Einkauf beim H\195\164ndler";
		FrmtInfoBuymult	= "Einkauf f\195\188r %d (%s pro St\195\188ck)";
		FrmtInfoClass	= "Klasse: %s";
		FrmtInfoMerchants	= "Wird von %d H\195\164ndler(n) verkauft";
		FrmtInfoQuest	= "Questgegenstand von %d Quest(s)";
		FrmtInfoSell	= "Verkauf beim H\195\164ndler";
		FrmtInfoSellmult	= "Verkauf f\195\188r %d (%s pro St\195\188ck)";
		FrmtInfoStx	= "%d pro Stapel";
		FrmtInfoUse	= "Benutzt f\195\188r: %s";
		FrmtUnknownLocale	= "Das angegebene Gebietsschema ('%s') ist unbekannt. G\195\188ltige Gebietsschemen sind:";
		FrmtWelcome	= "Informant v%s geladen";
		InfoHeader	= "Informationen \195\188ber |cff%s%s|r";
		InfoNoItem	= "Bevor die Aktivierungstaste gedr\195\188ckt wird, mu\195\159 die Maus \195\188ber einen Gegenstand bewegt werden";
		InfoPlayerMade	= "Herstellbar mit Level %d %s";
		InfoQuestHeader	= "Ben\195\182tigt f\195\188r %d Quest(s):";
		InfoQuestName	= "%d f\195\188r \"%s\" (Level %d)";
		InfoQuestSource	= "Questdaten bezogen von";
		InfoVendorHeader	= "Erh\195\164ltlich bei %d H\195\164ndler(n):";
		InfoVendorName	= "%s";


		-- Section: Type Messages
		AdditAlcohol	= "Alkohol";
		AdditBuff	= "Buff";
		AdditDrink	= "Getr\195\164nk";
		AdditFirework	= "Feuerwerk";
		AdditFood	= "Nahrung";
		AdditGiftwrap	= "Geschenkpapier";
		AdditLure	= "K\195\182der";
		AdditPoison	= "Gift";
		AdditPotion	= "Trank";
		AdditRestorative	= "St\195\164rkungstrank";
		AdditScroll	= "Zauberspruchrolle";
		SkillAlchemy	= "Alchemie";
		SkillBlacksmithing	= "Schmieden";
		SkillCooking	= "Kochen";
		SkillDruid	= "Druidenzauber";
		SkillEnchanting	= "Verzauberungen";
		SkillEngineering	= "Ingenieurskunst";
		SkillFirstAid	= "Erste Hilfe";
		SkillLeatherworking	= "Lederverarbeitung";
		SkillMage	= "Magierzauber";
		SkillMining	= "Bergbau";
		SkillPaladin	= "Paladinzauber";
		SkillPriest	= "Priesterzauber";
		SkillRogue	= "Schurkenfertigkeit";
		SkillShaman	= "Schamanenzauber";
		SkillTailoring	= "Schneiderei";
		SkillWarlock	= "Hexerzauber";

	};

	enUS = {


		-- Section: Commands
		CmdClearAll	= "all";
		CmdDefault	= "default";
		CmdDisable	= "disable";
		CmdEmbed	= "embed";
		CmdHelp	= "help";
		CmdLocale	= "locale";
		CmdOff	= "off";
		CmdOn	= "on";
		CmdToggle	= "toggle";
		OptLocale	= "<locale>";
		ShowIcon	= "show-icon";
		ShowMerchant	= "show-merchant";
		ShowQuest	= "show-quest";
		ShowStack	= "show-stack";
		ShowUsage	= "show-usage";
		ShowVendor	= "show-vendor";
		ShowVendorBuy	= "show-vendor-buy";
		ShowVendorSell	= "show-vendor-sell";


		-- Section: Generic Messages
		MesgNotLoaded	= "Informant is not loaded. Type /informant for more info.";
		StatOff	= "Not displaying any item informations";
		StatOn	= "Displaying configured item informations";
		Welcome	= "|c40ff50ffWelcome to Informant|r\n\nSince this is the first time you are using Informant, this message appears to let you know that you must set a key to show this window from within the |cffffffffKeybindings|r section of the |cffffffffGame Menu|r.\n\nFrom then on to view advanced information about items in your inventory, simply move your mouse over the item you want to see information about and press the key that you bound, and this window will popup, filled with information about that item.\n\nAt that point, simply press the key again, or click the close button on this frame.\n\nClick the close button now to continue.";


		-- Section: Help Text
		GuiDefaultAll	= "Reset All Informant Options";
		GuiDefaultAllButton	= "Reset All";
		GuiDefaultAllHelp	= "Click here to set all Informant options to their default values.\nWARNING: This action is NOT undoable.";
		GuiDefaultOption	= "Reset this setting";
		GuiEmbed	= "Embed info in in-game tooltip";
		GuiEmbedHeader	= "Embed";
		GuiInfoHeader	= "Additional information";
		GuiInfoHelp	= "Controls what additional information is shown in tooltips";
		GuiInfoIcon	= "Show inventory icon";
		GuiInfoMerchant	= "Show merchants";
		GuiInfoQuest	= "Show quest information";
		GuiInfoStack	= "Show stack sizes";
		GuiInfoUsage	= "Show usage information";
		GuiLocale	= "Set locale to";
		GuiMainEnable	= "Enable Informant";
		GuiMainHelp	= "Contains settings for Informant \nan AddOn that displays detailed item information";
		GuiOtherHeader	= "Other Options";
		GuiOtherHelp	= "Miscellaneous Informant Options";
		GuiReloadui	= "Reload User Interface";
		GuiReloaduiButton	= "ReloadUI";
		GuiReloaduiFeedback	= "Now Reloading the WoW UI";
		GuiReloaduiHelp	= "Click here to reload the WoW User Interface after changing the locale so that the language in this configuration screen matches the one you selected.\nNote: This operation may take a few minutes.";
		GuiVendor	= "Show Vendor Prices";
		GuiVendorBuy	= "Show Vendor Buy Prices";
		GuiVendorHeader	= "Vendor Prices";
		GuiVendorHelp	= "Options related to NPC buy/sell prices.";
		GuiVendorSell	= "Show Vendor Sell Prices";
		HelpDefault	= "Set an informant option to it's default value. You may also specify the special keyword \"all\" to set all informant options to their default values.";
		HelpDisable	= "Stops Informant from automatically loading next time you log in";
		HelpEmbed	= "Embed the text in the original game tooltip (note: certain features are disabled when this is selected)";
		HelpIcon	= "Select whether to show the item's inventory icon";
		HelpLocale	= "Change the locale that is used to display informant messages";
		HelpMerchant	= "Select whether to show merchants who supply items";
		HelpOnoff	= "Turns the information data display on and off";
		HelpQuest	= "Select whether to show quests items' usage";
		HelpStack	= "Select whether to show the item's stackable size";
		HelpUsage	= "Select whether to show tradeskill items' usage";
		HelpVendor	= "Select whether to show item's vendor pricing";
		HelpVendorBuy	= "Select whether to show item's vendor buy pricing (req show-vendor=on)";
		HelpVendorSell	= "Select whether to show item's vendor sell pricing (req show-vendor=on)";


		-- Section: Keybinding Text
		BindingHeader	= "Informant";
		BindingTitle	= "Toggle Information Window";


		-- Section: Tooltip Messages
		FrameTitle	= "Informant Item Information";
		FrmtActDefault	= "Informant's %s option has been reset to its default setting";
		FrmtActDefaultall	= "All informant options have been reset to default settings.";
		FrmtActDisable	= "Not displaying item's %s data";
		FrmtActEnable	= "Displaying item's %s data";
		FrmtActEnabledOn	= "Displaying item's %s on %s";
		FrmtActSet	= "Set %s to '%s'";
		FrmtActUnknown	= "Unknown command keyword: '%s'";
		FrmtInfoBuy	= "Buy from vendor";
		FrmtInfoBuymult	= "Buy %d (%s each)";
		FrmtInfoClass	= "Class: %s";
		FrmtInfoMerchants	= "Sold by %d merchants";
		FrmtInfoQuest	= "Quest item in %d quests";
		FrmtInfoSell	= "Sell to vendor";
		FrmtInfoSellmult	= "Sell %d (%s each)";
		FrmtInfoStx	= "Stacks in lots of %d";
		FrmtInfoUse	= "Used for: %s";
		FrmtUnknownLocale	= "The locale you specified ('%s') is unknown. Valid locales are:";
		FrmtWelcome	= "Informant v%s loaded /inf";
		InfoHeader	= "Information on |cff%s%s|r";
		InfoNoItem	= "You must first move over an item, then press the activation key";
		InfoPlayerMade	= "Made by level %d %s";
		InfoQuestHeader	= "Used in %d quests:";
		InfoQuestName	= "  %d for \"%s\" (level %d)";
		InfoQuestSource	= "Quest data supplied by";
		InfoVendorHeader	= "Available from %d merchants:";
		InfoVendorName	= "  %s";


		-- Section: Type Messages
		AdditAlcohol	= "Alcohol";
		AdditBuff	= "Buff";
		AdditDrink	= "Drink";
		AdditFirework	= "Firework";
		AdditFood	= "Food";
		AdditGiftwrap	= "Giftwrap";
		AdditLure	= "Lure";
		AdditPoison	= "Poison";
		AdditPotion	= "Potion";
		AdditRestorative	= "Restorative";
		AdditScroll	= "Scroll";
		SkillAlchemy	= "Alchemy";
		SkillBlacksmithing	= "Smithing";
		SkillCooking	= "Cooking";
		SkillDruid	= "Druid spells";
		SkillEnchanting	= "Enchanting";
		SkillEngineering	= "Engineering";
		SkillFirstAid	= "First Aid";
		SkillLeatherworking	= "Leatherworking";
		SkillMage	= "Mage spells";
		SkillMining	= "Mining";
		SkillPaladin	= "Paladin spells";
		SkillPriest	= "Priest spells";
		SkillRogue	= "Rogue skills";
		SkillShaman	= "Shaman spells";
		SkillTailoring	= "Tailoring";
		SkillWarlock	= "Warlock spells";

	};

	esES = {


		-- Section: Commands
		CmdClearAll	= "todo";
		CmdDefault	= "por defecto";
		CmdDisable	= "deshabilitar";
		CmdEmbed	= "integrado";
		CmdHelp	= "ayuda";
		CmdLocale	= "localidad";
		CmdOff	= "apagado";
		CmdOn	= "prendido";
		CmdToggle	= "invertir";
		OptLocale	= "<localidad>";
		ShowIcon	= "ver-icono";
		ShowMerchant	= "ver-mercader";
		ShowQuest	= "ver-b\195\186squeda";
		ShowStack	= "ver-paquete";
		ShowUsage	= "ver-uso";
		ShowVendor	= "ver-vendedor";
		ShowVendorBuy	= "ver-vendedor-compra";
		ShowVendorSell	= "ver-vendedor-venta";


		-- Section: Generic Messages
		MesgNotLoaded	= "Informant no esta cargado. Escriba /informant para mas informaci\195\179n.";
		StatOff	= "Ocultando informaci\195\179n para art\195\173\194\173culos";
		StatOn	= "Mostrando informaci\195\179n configurada para art\195\173\194\173culos";
		Welcome	= "|c40ff50ffBienvenido a Informant|r\n\nYa que esta es la primera vez que usted usa\n\nInformant, este mansaje aparece para dejarle saber que usted debe de designar una tecla desde dentro de la secci\195\179n de \"|cffffffffKeybindings|r\" del \"|cffffffffGame Menu|r\" del juego para hacer aparecer esta ventana.\n\nDesde ese punto en adelante, para ver informaci\195\179n avanzada de los art\195\173\194\173culos en su inventario, simplememnte mueva su mouse sobre el art\195\173\194\173culo del cual quiera ver la informaci\195\179n y oprima la tecla que usted escogio, y esta ventana aparecer\195\161, llena con informaci\195\179n sobre ese art\195\173\194\173culo.\n\nCuando quiera cerrar la ventana, simplemente oprime la tecla de nuevo o presione el bot\195\179n de \"Close\" para cerrarla.\n\nPresione el bot\195\179n de \"Close\" para continuar.";


		-- Section: Help Text
		GuiDefaultAll	= "Revertir todas las opciones de Auctioneer";
		GuiDefaultAllButton	= "Revertir Todo";
		GuiDefaultAllHelp	= "Seleccione aqui para revertir todas las opciones de Informant a sus configuraciones de f\195\161brica.\nADVERTENCIA: Esta acci\195\179n NO es reversible.";
		GuiDefaultOption	= "Revertir esta opci\195\179n";
		GuiEmbed	= "Integrar informaci\195\179n en la caja de ayuda";
		GuiEmbedHeader	= "Integraci\195\179n";
		GuiInfoHeader	= "Informaci\195\179n Adicional";
		GuiInfoHelp	= "Controla que informaci\195\179n Intormant muestra en las cajas de ayuda";
		GuiInfoIcon	= "Ver \195\173cono de inventario";
		GuiInfoMerchant	= "Ver mercaderes";
		GuiInfoQuest	= "Ver informaci\195\179n de busquedas";
		GuiInfoStack	= "Ver tama\195\177o de paquete";
		GuiInfoUsage	= "Ver informaci\195\179n de uso";
		GuiLocale	= "Ajustar localidad a";
		GuiMainEnable	= "Encender Informant";
		GuiMainHelp	= "Contiene ajustes para Informant \nun aditamento que muestra informaci\195\179n detallada de los art\195\173\194\173culos";
		GuiOtherHeader	= "Otras Opciones";
		GuiOtherHelp	= "Opciones miscel\195\161neas de Informant";
		GuiReloadui	= "Recargar Interf\195\161z";
		GuiReloaduiButton	= "Recargar";
		GuiReloaduiFeedback	= "Recargando el Interf\195\161z de WoW";
		GuiReloaduiHelp	= "Presione aqui para recargar el interf\195\161z de WoW luego de haber seleccionado una localidad diferente. Esto es para que el lenguaje de configuraci\195\179n sea el mismo que el de Auctioneer.\nNota: Esta operaci\195\179n puede tomar unos minutos.";
		GuiVendor	= "Mostrar Precios a Vendedores";
		GuiVendorBuy	= "Mostrar precios de compra a vendedores";
		GuiVendorHeader	= "Precio del Vendedor";
		GuiVendorHelp	= "Opciones relacionadas con los precios de compraventa de personajes no-jugadores.";
		GuiVendorSell	= "Mostrar precios de venta a vendedores";
		HelpDefault	= "Revertir una opci\195\179n de Auctioneer a su configuraci\195\179n de f\195\161brica. Tambi\195\169n puede especificar la palabra clave \"todo\" pata revertir todas las opciones de Auctioneer a sus configuraciones de f\195\161brica.";
		HelpDisable	= "Impide que Informant se carge automaticamente la proxima vez que usted entre al juego";
		HelpEmbed	= "Insertar el texto en la caja de ayuda original del juego (nota: Algunas funciones se desabilitan cuando esta opci\195\179n es seleccionada)";
		HelpIcon	= "Selecciona para mostrar el \195\173cono de inventario del art\195\173culo";
		HelpLocale	= "Cambiar la localidad que Informant usa para sus mensajes";
		HelpMerchant	= "Selecciona para mostrar los mercaderes que venden el art\195\173\194\173culo";
		HelpOnoff	= "Enciande o apaga la informacion sobre los art\195\173\194\173culos";
		HelpQuest	= "Selecciona para mostrar informaci\195\179n sobre art\195\173\194\173culos de b\195\186squedas";
		HelpStack	= "Selecciona para mostrar tama\195\177o maximo del paquete";
		HelpUsage	= "Selecciona para mostrar uso del art\195\173\194\173culo en profesiones";
		HelpVendor	= "Selecciona para mostrar precios de vendedor para el art\195\173\194\173culo";
		HelpVendorBuy	= "Selecciona para mostrar precio de compra del vendedor (requiere ver-vendedor prendido)";
		HelpVendorSell	= "Selecciona para mostrar precio de venta del vendedor (requiere ver-vendedor prendido)";


		-- Section: Keybinding Text
		BindingHeader	= "Informant";
		BindingTitle	= "Invert\195\173\194\173r la ventana de Informant";


		-- Section: Tooltip Messages
		FrameTitle	= "Informaci\195\179n de Informant del Art\195\173\194\173culo.";
		FrmtActDefault	= "La opci\195\179n %s de Informant ha sido revertida a su configuraci\195\179n de f\195\161brica.";
		FrmtActDefaultall	= "Todas las opciones de Informant han sido revertidas a sus configuraciones de f\195\161brica.";
		FrmtActDisable	= "Ocultando informaci\195\179n de art\195\173\194\173culo: %s ";
		FrmtActEnable	= "Mostrando informaci\195\179n del art\195\173\194\173culo: %s ";
		FrmtActEnabledOn	= "Mostrando %s de los art\195\173\194\173culos usando %s";
		FrmtActSet	= "%s ajustado(a) a '%s'";
		FrmtActUnknown	= "Comando o palabra clave desconocida: '%s'";
		FrmtInfoBuy	= "Compra del vendedor";
		FrmtInfoBuymult	= "Compra %d (%s c/u)";
		FrmtInfoClass	= "Clase: %s";
		FrmtInfoMerchants	= "Vendido por %d mercaderes";
		FrmtInfoQuest	= "Art\195\173\194\173culo usado en %d busquedas";
		FrmtInfoSell	= "Vende al vendedor";
		FrmtInfoSellmult	= "Vende %d (%s c/u)";
		FrmtInfoStx	= "Amontonable en lotes de %d art\195\173\194\173culos por paquete";
		FrmtInfoUse	= "Usado para: %s";
		FrmtUnknownLocale	= "La localizaci\195\179n que usted especific\195\179 ('%s') no es valida. Locales v\195\161lidos son:";
		FrmtWelcome	= "Informant versi\195\179n %s cargado";
		InfoHeader	= "Informaci\195\179n en |cff%s%s|r";
		InfoNoItem	= "Debe de pasar por encima de un art\195\173\194\173culo, y luego apretar la tecla de activaci\195\179n";
		InfoPlayerMade	= "Hecho por %s nivel %d";
		InfoQuestHeader	= "Art\195\173\194\173culo usado en %d busquedas";
		InfoQuestName	= "  %d for \"%s\" (level %d)";
		InfoQuestSource	= "Informaci\195\179n de b\195\186squedas suministrada por";
		InfoVendorHeader	= "Disponible a trav\195\169z de %d mercaderes:";
		InfoVendorName	= "%s";


		-- Section: Type Messages
		AdditAlcohol	= "Alcoh\195\179l";
		AdditBuff	= "Mejora";
		AdditDrink	= "Bebida";
		AdditFirework	= "Fuegos Artificiales";
		AdditFood	= "Comida";
		AdditGiftwrap	= "Envoltura";
		AdditLure	= "Se\195\177uelo";
		AdditPoison	= "Veneno";
		AdditPotion	= "Poci\195\179n";
		AdditRestorative	= "Restaurativo";
		AdditScroll	= "Voluta";
		SkillAlchemy	= "Alqu\195\173\194\173mia";
		SkillBlacksmithing	= "Herrer\195\173\194\173a";
		SkillCooking	= "Cocinar";
		SkillDruid	= "Magias de Druidas";
		SkillEnchanting	= "Encantar";
		SkillEngineering	= "Ingenier\195\173\194\173a";
		SkillFirstAid	= "Primeros Auxilios";
		SkillLeatherworking	= "Peleter\195\173\194\173a";
		SkillMage	= "Magias de Magos";
		SkillMining	= "Miner\195\173\194\173a";
		SkillPaladin	= "Magias de Paladines";
		SkillPriest	= "Magias de Sacerdotes";
		SkillRogue	= "Habilidades de P\195\173\194\173caros";
		SkillShaman	= "Magias de Chamanes";
		SkillTailoring	= "Sastrer\195\173\194\173a";
		SkillWarlock	= "Magias de Brujos";

	};

	frFR = {


		-- Section: Commands
		CmdClearAll	= "tout";
		CmdDefault	= "par d\195\169faut";
		CmdDisable	= "desactive";
		CmdEmbed	= "integrer";
		CmdHelp	= "aide";
		CmdLocale	= "langue";
		CmdOff	= "arr\195\170t";
		CmdOn	= "marche";
		CmdToggle	= "changer";
		OptLocale	= "<langue>";
		ShowIcon	= "voir-icone";
		ShowMerchant	= "voir-marchand";
		ShowQuest	= "voir-quete";
		ShowStack	= "voir-pile";
		ShowUsage	= "voir-utilisation";
		ShowVendor	= "voir-vendeur";
		ShowVendorBuy	= "voir-vendeur-achat";
		ShowVendorSell	= "voir-vendeur-vente";


		-- Section: Generic Messages
		MesgNotLoaded	= "Informant n'est pas charg\195\169. Tapez /informant pour plus d'informations.";
		StatOff	= "Ne montrer aucune information d'objet";
		StatOn	= "Montrer les informations configur\195\169es";
		Welcome	= "|c40ff50ffBienvenue dans Informant|r Comme c'est la premi\195\168re fois que vous utilisez Informant, ce message appara\195\174t pour vous faire savoir qu'il est n\195\169cessaire d'attribuer une touche pour afficher cette fen\195\170tre. Ceci se fait dans le menu |cffffffffRaccourcis|r du |cffffffffMenu g\195\169n\195\169ral|r. Ceci fait, pour voir les informations d\195\169taill\195\169es des objets de votre inventaire, il suffit de placer votre curseur souris sur un objet qui vous int\195\169resse et d'appuyer sur la touche que vous avez attribu\195\169e, cette fen\195\170tre appara\195\174tra alors avec les informations souhait\195\169es. Pour fermer la fen\195\170tre, appuyer sur la touche de nouveau, ou cliquer sur le bouton de fermeture de la fen\195\170tre. Cliquer sur le bouton de fermeture maintenant pour continuer.";


		-- Section: Help Text
		GuiDefaultAll	= "R\195\169initialiser toutes les options d'Informant";
		GuiDefaultAllButton	= "Tout r\195\169initialiser";
		GuiDefaultAllHelp	= "Cliquer ici pour r\195\169initialiser toutes les options d'Informant \195\160 leurs valeurs par d\195\169faut. ATTENTION : cette op\195\169ration est irr\195\169versible.";
		GuiDefaultOption	= "R\195\169initialiser cette configuration";
		GuiEmbed	= "Int\195\169grer les informations dans les infobulles originales";
		GuiEmbedHeader	= "Int\195\169gr\195\169";
		GuiInfoHeader	= "Informations compl\195\169mentaires";
		GuiInfoHelp	= "Contr\195\180le quelles informations seront affich\195\169es dans les infobulles";
		GuiInfoIcon	= "Afficher l'ic\195\180ne d'inventaire";
		GuiInfoMerchant	= "Afficher les marchands";
		GuiInfoQuest	= "Afficher les informations de qu\195\170te";
		GuiInfoStack	= "Afficher la taille des piles";
		GuiInfoUsage	= "Afficher le mode d'emploi";
		GuiLocale	= "Changer la langue active pour ";
		GuiMainEnable	= "Activer Informant";
		GuiMainHelp	= "Contient les r\195\169glages d'Informant, un AddOn permettant d'afficher des informations d\195\169taill\195\169es sur les objets.";
		GuiOtherHeader	= "Autres options";
		GuiOtherHelp	= "Options diverses d'Informant";
		GuiReloadui	= "Recharger l'Interface Utilisateur";
		GuiReloaduiButton	= "RechargerIU";
		GuiReloaduiFeedback	= "Rechargement de l'IU de WoW";
		GuiReloaduiHelp	= "Cliquez ici pour recharger l'UI apr\195\168s avoir chang\195\169 la langue pour que les informations affich\195\169es refl\195\168tent votre choix. Note: Cette op\195\169ration peut prendre quelques minutes.";
		GuiVendor	= "Afficher les prix des marchands";
		GuiVendorBuy	= "Afficher les prix d'achat des marchands";
		GuiVendorHeader	= "Prix des marchands";
		GuiVendorHelp	= "Options relatives au prix d'achat/vente des NPCs";
		GuiVendorSell	= "Afficher les prix de vente des marchands";
		HelpDefault	= "R\195\169initialiser une option d'Informant. Vous pouvez \195\169galement sp\195\169cifier le mot-clef \"tout\" afin de r\195\169initialiser toutes les options d'Informant.";
		HelpDisable	= "Emp\195\170cher le chargement d'Informant lors de votre prochaine connexion";
		HelpEmbed	= "Ins\195\168re le texte dans la tooltip originale (note: certaines fonctions ne seront pas fonctionnelles si activ\195\169)";
		HelpIcon	= "Selectionner si l'ic\195\180ne d'inventaire de l'article s'affiche";
		HelpLocale	= "Changer la langue utilis\195\169e par les messages d'Informant";
		HelpMerchant	= "Choisir si l'affichage des marchands qui vendent ces objets doit \195\170tre activ\195\169";
		HelpOnoff	= "Active/d\195\169sactive l'affichage des informations";
		HelpQuest	= "Choisir d'afficher si l'objet est un objet de qu\195\170te";
		HelpStack	= "Choisir si l'affichage du nombre maximum par pile d'objet doit \195\170tre activ\195\169";
		HelpUsage	= "Choisir d'afficher les utilisations de l'objet dans les m\195\169tiers";
		HelpVendor	= "Choisir d'afficher les prix de l'objet des PNJ";
		HelpVendorBuy	= "Choisir si l'affichage du prix d'achat par les marchands doit \195\170tre activ\195\169 (requiert voir-vendeur=marche)";
		HelpVendorSell	= "Choisir si l'affichage du prix de vente par les marchands doit \195\170tre activ\195\169 (requiert voir-vendeur=marche)";


		-- Section: Keybinding Text
		BindingHeader	= "Informant";
		BindingTitle	= "Afficher/Masquer la fen\195\170tre d'information";


		-- Section: Tooltip Messages
		FrameTitle	= "Informations sur l'objet d'Informant";
		FrmtActDefault	= "L'option %s d'Informant a \195\169t\195\169 r\195\169initialis\195\169e \195\160 sa valeur par d\195\169faut";
		FrmtActDefaultall	= "Toutes les options d'Informant ont \195\169t\195\169 r\195\169initialis\195\169es \195\160 leurs valeurs par d\195\169faut";
		FrmtActDisable	= "N'affiche pas les donn\195\169es de l'objet %s";
		FrmtActEnable	= "Affiche les donn\195\169es de l'objet %s";
		FrmtActEnabledOn	= "Affiche l'objet %s sur %s";
		FrmtActSet	= "%s r\195\169gl\195\169 \195\160 '%s'";
		FrmtActUnknown	= "Mot-clef de commande inconnu : '%s'";
		FrmtInfoBuy	= "Achat au marchand";
		FrmtInfoBuymult	= "Achat des %d (%s l'unit\195\169)";
		FrmtInfoClass	= "Classe : %s";
		FrmtInfoMerchants	= "Vendu par %d marchand(s)";
		FrmtInfoQuest	= "Objet de qu\195\170te intervenant dans %d qu\195\170te(s)";
		FrmtInfoSell	= "Vente au marchand";
		FrmtInfoSellmult	= "Vente des %d (%s l'unit\195\169)";
		FrmtInfoStx	= "S'empile en lot de %d";
		FrmtInfoUse	= "Utilis\195\169 pour : %s";
		FrmtUnknownLocale	= "La langue que vous avez sp\195\169cifi\195\169e ('%s') est inconnue. Les langues valides sont :";
		FrmtWelcome	= "Informant v%s charg\195\169";
		InfoHeader	= "Information sur |cff%s%s|r";
		InfoNoItem	= "Vous devez d'abord placer votre curseur sur l'objet, puis appuyer sur la touche d'activation.";
		InfoPlayerMade	= "Fait par un %s niveau %d ";
		InfoQuestHeader	= "Utilis\195\169 dans %d qu\195\170tes :";
		InfoQuestName	= "  %d for \"%s\" (level %d)";
		InfoQuestSource	= "Donn\195\169es de qu\195\170te fournies par";
		InfoVendorHeader	= "Disponible aupr\195\168s de %d marchand(s) :";
		InfoVendorName	= "%s";


		-- Section: Type Messages
		AdditAlcohol	= "Alcool";
		AdditBuff	= "Am\195\169lioration";
		AdditDrink	= "Boisson";
		AdditFirework	= "Feu d'artifice";
		AdditFood	= "Nourriture";
		AdditGiftwrap	= "Papier-cadeau";
		AdditLure	= "Leurre";
		AdditPoison	= "Poison";
		AdditPotion	= "Potion";
		AdditRestorative	= "Fortifiant";
		AdditScroll	= "Parchemin";
		SkillAlchemy	= "Alchimie";
		SkillBlacksmithing	= "Forge";
		SkillCooking	= "Cuisine";
		SkillDruid	= "Sorts de Druide";
		SkillEnchanting	= "Enchantement";
		SkillEngineering	= "Ing\195\169nierie";
		SkillFirstAid	= "Premiers Soins";
		SkillLeatherworking	= "Travail du Cuir";
		SkillMage	= "Sorts de Mage";
		SkillMining	= "Minage";
		SkillPaladin	= "Sorts de Paladin";
		SkillPriest	= "Sorts de Pr\195\170tre";
		SkillRogue	= "Comp\195\169tences de Voleur";
		SkillShaman	= "Sorts de Chaman";
		SkillTailoring	= "Couture";
		SkillWarlock	= "Sorts de D\195\169moniste";

	};

	itIT = {


		-- Section: Commands
		CmdClearAll	= "tutti";
		CmdDefault	= "default";
		CmdDisable	= "disabilitare";
		CmdEmbed	= "integrato";
		CmdHelp	= "aiuto";
		CmdLocale	= "localizzazione";
		CmdOff	= "spento";
		CmdOn	= "acceso";
		CmdToggle	= "toggle(on/off)";
		OptLocale	= "<localizzazione>";
		ShowIcon	= "mostra-icona";
		ShowMerchant	= "mostra-mercante";
		ShowQuest	= "mostra-quest";
		ShowStack	= "mostra-pila";
		ShowUsage	= "mostra-uso";
		ShowVendor	= "mostra-venditore";
		ShowVendorBuy	= "mostra-venditore-acquisto";
		ShowVendorSell	= "mostra-venditore-vendita";


		-- Section: Generic Messages
		MesgNotLoaded	= "Informant non e' caricato. Digita /informant per maggiori informazioni.";
		StatOff	= "Nascondere le informazioni degli oggetti";
		StatOn	= "Mostrare le informazioni configurate degli oggetti";
		Welcome	= "|c4Off5OffBenvenuto su Informant|r Questa e' la prima volta che usi Informant, devi quindi bindare un tasto in |cffffffffKeybindings|r del |cffffffffGame Menu|r. Da questo punto in poi per vedere le informazioni supplementari di un oggetto, muovi il mouse su di esso e primi il tasto che hai 'bindato'; questa finestra apparira' con le informazioni aggiuntive. Premi il tasto di nuovo per chiudere la finestra.";


		-- Section: Help Text
		GuiDefaultAll	= "Resetta tutte le opzioni di Informant";
		GuiDefaultAllButton	= "Reset generale";
		GuiDefaultAllHelp	= "Clickare qui per settare tutte le opzioni di Informant ai valori di default. ATTENZIONE: Questa azione NON e' reversibile.";
		GuiDefaultOption	= "Resetta questa opzione";
		GuiEmbed	= "Informazione integrata nel Tooltip di gioco";
		GuiEmbedHeader	= "Integrazione";
		GuiInfoHeader	= "Informazione aggiuntiva";
		GuiInfoHelp	= "Controlla quale informazione aggiuntiva e' mostrata nel tooltip";
		GuiInfoIcon	= "Mostra icona inventario";
		GuiInfoMerchant	= "Mostra mercanti";
		GuiInfoQuest	= "Mostra le informazioni della quest";
		GuiInfoStack	= "Mostra il prezzo della pila";
		GuiInfoUsage	= "Mostra le informazioni d'uso";
		GuiLocale	= "Imposta la localizzazione in";
		GuiMainEnable	= "Abilita Informant";
		GuiMainHelp	= "Contiene i settaggi di Informant, un AddOn che mostra informazioni dettagliate degli oggetti";
		GuiOtherHeader	= "Altre Opzioni";
		GuiOtherHelp	= "Opzioni Varie di Informant";
		GuiReloadui	= "Ricarica la User Interface";
		GuiReloaduiButton	= "ReloadUI";
		GuiReloaduiFeedback	= "Caricamento della WoW UI";
		GuiReloaduiHelp	= "Clicca qui per ricaricare la WoW UI dopo aver cambiato la localizzazione, cosi' che la lingua di questo schermo coincida con quella che hai selezionato. Nota: Questa operazione puo' durare qualche minuto.";
		GuiVendor	= "Mostra i Prezzi dei Venditori";
		GuiVendorBuy	= "Mostra i Prezzi d'Acquisto dei Venditori";
		GuiVendorHeader	= "Prezzi dei Venditori";
		GuiVendorHelp	= "Opzioni sui prezzi di acquisto/vendita degli NPC.";
		GuiVendorSell	= "Mostra i Prezzi di Vendita dei Venditori";
		HelpDefault	= "Modifica una opzione di Informant al suo valore di default. Puoi inoltre specificare la parola speciale \"all\" per modificare tutte le opzioni di Informant ai valori di default.";
		HelpDisable	= "Arresta il caricamento automatico di Informant al prossimo log in";
		HelpEmbed	= "Inserire il testo nel tooltip di gioco originale (nota: alcune funzioni vengono disabilitate con questa opzione)";
		HelpIcon	= "Seleziona se mostrare l'icona di inventario dell'articolo ";
		HelpLocale	= "Cambia la localizzazione usata per mostrare i messaggi di Informant";
		HelpMerchant	= "Seleziona per mostrare i mercanti che vendono l'oggetto";
		HelpOnoff	= "Cambia il display di Informant tra on/off";
		HelpQuest	= "Seleziona se mostrare informazioni sugli oggetti di quest";
		HelpStack	= "Seleziona se mostrare la dimensione degli oggetti impilabili";
		HelpUsage	= "Seleziona se mostrare la tradeskill d'impiego dell'oggetto";
		HelpVendor	= "Seleziona se mostrare i prezzi dei venditori per l'oggetto";
		HelpVendorBuy	= "Seleziona se mostrare il prezzo d'acquisto dei venditori per l'oggetto (richiede mostra-venditori=on)";
		HelpVendorSell	= "Seleziona se mostrare il prezzo di vendita dei venditori per l'oggetto (richiede mostra-venditori=on)";


		-- Section: Keybinding Text
		BindingHeader	= "Informant";
		BindingTitle	= "Toggle(on/off) la finestra delle informazioni";


		-- Section: Tooltip Messages
		FrameTitle	= "Informazioni sull'oggetto di Informant";
		FrmtActDefault	= "L'opzione %s di Informant e' stata modificata al valore di default";
		FrmtActDefaultall	= "Tutte le opzioni di Informant sono state modificata al valore di default";
		FrmtActDisable	= "Non mostrare le informazioni sull'oggetto %s";
		FrmtActEnable	= "Mostra le informazioni sull'oggetto %s";
		FrmtActEnabledOn	= "Mostra le informazioni dell'oggetto %s di %s";
		FrmtActSet	= "Regola da %s a '%s'";
		FrmtActUnknown	= "Comando sconosciuto: '%s'";
		FrmtInfoBuy	= "Compra dal vendor";
		FrmtInfoBuymult	= "Compra %d (%s cad.)";
		FrmtInfoClass	= "Classe: %s";
		FrmtInfoMerchants	= "Venduto da %d mercanti";
		FrmtInfoQuest	= "Oggetto usato in %d quest";
		FrmtInfoSell	= "Vendere al vendor";
		FrmtInfoSellmult	= "Vende %d (%s cad.)";
		FrmtInfoStx	= "Stack di %d pezzi";
		FrmtInfoUse	= "Usato per: %s";
		FrmtUnknownLocale	= "La localizzazione specificata ('%s') e' sconosciuta. Le localizzazioni valide sono:";
		FrmtWelcome	= "Informant v%s caricato";
		InfoHeader	= "Informazione su |cff%s%s|r";
		InfoNoItem	= "Devi prima muoverti sopra un oggetto, poi premere il tasto d'attivazione";
		InfoPlayerMade	= "Fatto da livello %d %s";
		InfoQuestHeader	= "Usato in %d quest:";
		InfoQuestName	= "  %d for \"%s\" (level %d)";
		InfoQuestSource	= "Dati quest forniti da";
		InfoVendorHeader	= "Disponibile da %d mercanti:";
		InfoVendorName	= "%s";


		-- Section: Type Messages
		AdditAlcohol	= "Alcool";
		AdditBuff	= "Buff";
		AdditDrink	= "Bevanda";
		AdditFirework	= "Fuoco d'artificio";
		AdditFood	= "Cibo";
		AdditGiftwrap	= "Regalo";
		AdditLure	= "Lure";
		AdditPoison	= "Veleno";
		AdditPotion	= "Pozione";
		AdditRestorative	= "Ristorativo";
		AdditScroll	= "Pergamena";
		SkillAlchemy	= "Alchemy";
		SkillBlacksmithing	= "Smithing";
		SkillCooking	= "Cooking";
		SkillDruid	= "Magie del Druido";
		SkillEnchanting	= "Enchanting";
		SkillEngineering	= "Engineering";
		SkillFirstAid	= "First Aid";
		SkillLeatherworking	= "Leatherworking";
		SkillMage	= "Magie del Mago";
		SkillMining	= "Mining";
		SkillPaladin	= "Magie del Paladino";
		SkillPriest	= "Magie del Prete";
		SkillRogue	= "Abilita' del Ladro";
		SkillShaman	= "Magie dello Sciamano";
		SkillTailoring	= "Tailoring";
		SkillWarlock	= "Magie del Warlock";

	};

	koKR = {


		-- Section: Commands
		CmdClearAll	= "\235\170\168\235\145\144";
		CmdDefault	= "\236\180\136\234\184\176\237\153\148";
		CmdDisable	= "\235\185\132\237\153\156\236\132\177\237\153\148";
		CmdEmbed	= "\235\130\180\236\158\165";
		CmdHelp	= "\235\143\132\236\155\128\235\167\144";
		CmdLocale	= "\236\167\128\236\151\173";
		CmdOff	= "\235\129\148";
		CmdOn	= "\236\188\172";
		CmdToggle	= "\236\160\132\237\153\152";
		OptLocale	= "<\236\167\128\236\151\173>";
		ShowIcon	= "\236\149\132\236\157\180\236\189\152 \235\179\180\234\184\176";
		ShowMerchant	= "\237\140\144\235\167\164\236\131\129\236\157\184";
		ShowQuest	= "\237\128\152\236\138\164\237\138\184";
		ShowStack	= "\234\178\185\236\185\168";
		ShowUsage	= "\236\130\172\236\154\169";
		ShowVendor	= "\236\131\129\236\160\144\234\176\128";
		ShowVendorBuy	= "\236\131\129\236\160\144\237\140\144\235\167\164\234\176\128";
		ShowVendorSell	= "\236\131\129\236\160\144\235\167\164\236\158\133\234\176\128";


		-- Section: Generic Messages
		MesgNotLoaded	= "Informant\234\176\128 \235\161\156\235\147\156\235\144\152\236\167\128 \236\149\138\236\149\152\236\138\181\235\139\136\235\139\164. \"/informant\" \235\165\188 \236\158\133\235\160\165\237\149\152\236\151\172 \235\141\148 \235\167\142\236\157\128 \236\160\149\235\179\180\235\165\188 \236\150\187\236\157\132 \236\136\152 \236\158\136\236\138\181\235\139\136\235\139\164.";
		StatOff	= "\236\149\132\236\157\180\237\133\156 \236\160\149\235\179\180\235\165\188 \237\145\156\236\139\156\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164.";
		StatOn	= "\236\132\164\236\160\149\235\144\156 \236\149\132\236\157\180\237\133\156 \236\160\149\235\179\180\235\165\188 \237\145\156\236\139\156\237\149\169\235\139\136\235\139\164.";
		Welcome	= "|c40ff50ff\237\153\152\236\152\129\237\149\169\235\139\136\235\139\164!|r\n\n\236\150\180\235\160\164\235\182\132\236\157\180 Informant\235\165\188 \236\178\152\236\157\140 \236\130\172\236\154\169\237\149\152\234\178\140\235\144\152\235\169\180, \236\157\180 \235\169\148\236\132\184\236\167\128\234\176\128 |cffffffff\234\178\140\236\158\132 \235\169\148\235\137\180|r\236\157\152 |cffffffff\235\139\168\236\182\149\237\130\164 \236\132\164\236\160\149|r\236\151\144\236\132\156 \236\157\180 \236\176\189\236\157\132 \235\179\180\234\184\176\236\156\132\237\149\180 \237\130\164\235\165\188 \236\132\164\236\160\149\237\149\180\236\149\188\237\149\156\235\139\164\235\138\148 \234\178\131\236\157\132 \236\149\140\235\160\164\236\164\141\235\139\136\235\139\164.\n\n\236\151\172\235\159\172\235\182\132\236\157\152 \236\134\140\236\167\128\237\146\136\236\151\144\236\132\156 \236\149\132\236\157\180\237\133\156\236\151\144 \234\180\128\237\149\156 \236\158\144\236\132\184\237\149\156 \236\160\149\235\179\180\235\165\188 \236\149\140\234\179\160\236\139\182\235\139\164\235\169\180, \235\139\168\236\136\156\237\158\136 \236\149\132\236\157\180\237\133\156 \236\156\132\236\151\144 \235\167\136\236\154\176\236\138\164\235\165\188 \234\176\128\236\160\184\234\176\132 \237\155\132 \236\132\164\236\160\149\235\144\156 \235\139\168\236\182\149\237\130\164\235\165\188 \235\136\132\235\165\180\235\169\180, \236\149\132\236\157\180\237\133\156\236\151\144 \234\180\128\237\149\156 \236\160\149\235\179\180\234\176\128 \236\177\132\236\155\140\236\167\132 \236\157\180 \236\176\189\236\157\180 \237\140\157\236\151\133\235\144\160 \234\178\131\236\158\133\235\139\136\235\139\164.\n\n\235\139\168\236\182\149\237\130\164\235\165\188 \235\139\164\236\139\156 \235\136\132\235\165\180\234\177\176\235\130\152 \236\157\180 \236\176\189\236\157\152 \235\139\171\234\184\176 \235\178\132\237\138\188\236\157\132 \235\136\132\235\165\180\235\169\180 \236\176\189\236\157\180 \235\139\171\237\158\153\235\139\136\235\139\164.\n\n\234\179\132\236\134\141\237\149\152\236\139\156\235\160\164\235\169\180 \235\139\171\234\184\176 \235\178\132\237\138\188\236\157\132 \235\136\132\235\165\180\236\139\173\236\139\156\236\152\164.";


		-- Section: Help Text
		GuiDefaultAll	= "\235\170\168\235\147\160 Informant \236\132\164\236\160\149 \236\180\136\234\184\176\237\153\148";
		GuiDefaultAllButton	= "\235\170\168\235\145\144 \236\180\136\234\184\176\237\153\148";
		GuiDefaultAllHelp	= "\235\170\168\235\147\160 Informant \236\132\164\236\160\149\236\157\132 \236\180\136\234\184\176\237\153\148\237\149\152\234\184\176\236\156\132\237\149\180 \236\157\180\234\179\179\236\157\132 \237\129\180\235\166\173\237\149\152\236\139\156\236\152\164.\n\236\163\188\236\157\152: \235\144\152\235\143\140\235\166\180\236\136\152 \236\151\134\236\157\140";
		GuiDefaultOption	= "\236\157\180 \236\132\164\236\160\149\236\157\132 \236\180\136\234\184\176\237\153\148";
		GuiEmbed	= "\234\178\140\236\158\132 \237\136\180\237\140\129\236\151\144 \236\160\149\235\179\180 \237\143\172\237\149\168";
		GuiEmbedHeader	= "\237\143\172\237\149\168";
		GuiInfoHeader	= "\236\182\148\234\176\128 \236\160\149\235\179\180";
		GuiInfoHelp	= "\237\136\180\237\140\129\236\151\144 \236\182\148\234\176\128 \236\160\149\235\179\180 \237\145\156\236\139\156 \236\132\164\236\160\149";
		GuiInfoIcon	= "\234\176\128\235\176\169 \236\149\132\236\157\180\236\189\152 \237\145\156\236\139\156";
		GuiInfoMerchant	= "\237\140\144\235\167\164\236\131\129\236\157\184 \237\145\156\236\139\156";
		GuiInfoQuest	= "\237\128\152\236\138\164\237\138\184 \236\160\149\235\179\180 \237\145\156\236\139\156";
		GuiInfoStack	= "\234\178\185\236\179\144\235\134\147\236\157\132 \236\136\152 \236\158\136\235\138\148 \236\181\156\235\140\128 \234\176\156\236\136\152 \237\145\156\236\139\156";
		GuiInfoUsage	= "\236\130\172\236\154\169 \236\160\149\235\179\180 \237\145\156\236\139\156";
		GuiLocale	= "\236\167\128\236\151\173 \236\132\164\236\160\149:";
		GuiMainEnable	= "Informant \237\153\156\236\132\177\237\153\148";
		GuiMainHelp	= "\236\158\144\236\132\184\237\149\156 \236\149\132\236\157\180\237\133\156 \236\160\149\235\179\180\235\165\188 \237\145\156\236\139\156\237\149\160\234\178\131\236\157\132 Informant \236\132\164\236\160\149\236\151\144 \237\143\172\237\149\168\237\149\169\235\139\136\235\139\164.";
		GuiOtherHeader	= "\234\184\176\237\131\128 \236\132\164\236\160\149";
		GuiOtherHelp	= "\234\184\176\237\131\128 \236\160\149\235\179\180 \236\132\164\236\160\149";
		GuiReloadui	= "\236\156\160\236\160\128 \236\157\184\237\132\176\237\142\152\236\157\180\236\138\164 \235\166\172\235\161\156\235\147\156";
		GuiReloaduiButton	= "UI \235\166\172\235\161\156\235\147\156";
		GuiReloaduiFeedback	= "WoW UI\235\165\188 \235\166\172\235\161\156\235\148\169\237\149\169\235\139\136\235\139\164.";
		GuiReloaduiHelp	= "\234\181\173\234\176\128 \236\132\164\236\160\149\236\157\132 \235\179\128\234\178\189\237\149\152\236\151\172 \236\157\180 \237\153\152\234\178\176\236\132\177\236\160\149 \236\176\189\234\179\188 \236\157\188\236\185\152\236\139\156\237\130\164\234\184\176 \236\156\132\237\149\180 WOW UI\235\165\188 \236\158\172\236\139\156\236\158\145 \237\149\152\235\160\164\235\169\180 \237\129\180\235\166\173\237\149\152\236\132\184\236\154\148.(\236\157\180 \236\158\145\236\151\133\236\157\128 \235\170\135\235\182\132 \236\160\149\235\143\132 \234\177\184\235\166\189\235\139\136\235\139\164.)";
		GuiVendor	= "\236\131\129\236\160\144\234\176\128 \237\145\156\236\139\156";
		GuiVendorBuy	= "\236\131\129\236\160\144\237\140\144\235\167\164\234\176\128 \237\145\156\236\139\156";
		GuiVendorHeader	= "\236\131\129\236\160\144\234\176\128";
		GuiVendorHelp	= "NPC \234\181\172\236\158\133/\237\140\144\235\167\164 \234\176\128\234\178\169\236\151\144 \234\180\128\235\160\168\235\144\156 \236\132\164\236\160\149.";
		GuiVendorSell	= "\236\131\129\236\160\144\235\167\164\236\158\133\234\176\128 \237\145\156\236\139\156";
		HelpDefault	= "Informant\236\157\152 \236\132\164\236\160\149\236\157\132 \236\180\136\234\184\176\234\176\146\236\156\188\235\161\156 \235\144\152\235\143\140\235\166\189\235\139\136\235\139\164. \"\235\170\168\235\145\144\" \235\157\188\235\138\148 \236\157\184\236\136\152\235\165\188 \236\163\188\235\169\180 Informant\236\157\152 \235\170\168\235\147\160 \236\132\164\236\160\149\236\157\132 \236\180\136\234\184\176\237\153\148 \237\149\169\235\139\136\235\139\164.";
		HelpDisable	= "\235\139\164\236\157\140 \235\161\156\234\183\184\236\157\184 \235\182\128\237\132\176\235\138\148 Informant\235\165\188 \236\158\144\235\143\153 \235\161\156\235\148\169 \237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164.";
		HelpEmbed	= "\237\133\141\236\138\164\237\138\184\235\165\188 \234\184\176\235\179\184 \234\178\140\236\158\132 \237\136\180\237\140\129\236\151\144 \237\143\172\237\149\168 (\236\157\180 \236\132\164\236\160\149\236\157\180 \236\132\164\237\131\157\235\144\152\235\169\180 \236\157\188\235\182\128 \234\184\176\235\138\165\236\157\180 \236\130\172\236\154\169\235\182\136\234\176\128\235\138\165 \237\149\169\235\139\136\235\139\164.)";
		HelpIcon	= "\236\149\132\236\157\180\237\133\156\236\157\152 \236\149\132\236\157\180\236\189\152\236\157\132 \237\145\156\236\139\156\236\151\172\235\182\128\235\165\188 \236\132\164\236\160\149";
		HelpLocale	= "Informant \235\169\148\236\132\184\236\167\128\236\157\152 \236\150\184\236\150\180\235\165\188 \235\179\128\234\178\189\237\149\169\235\139\136\235\139\164.";
		HelpMerchant	= "\236\132\160\237\131\157\235\144\156 \236\149\132\236\157\180\237\133\156\236\157\132 \237\140\144\235\167\164\237\149\152\235\138\148 \236\131\129\236\157\184 \237\145\156\236\139\156 \236\151\172\235\182\128\235\165\188 \236\132\164\236\160\149\237\149\169\235\139\136\235\139\164.";
		HelpOnoff	= "Informant\236\157\152 \235\141\176\236\157\180\237\132\176 \237\145\156\236\139\156 \236\151\172\235\182\128\235\165\188 \236\132\164\236\160\149\237\149\169\235\139\136\235\139\164.";
		HelpQuest	= "\236\132\160\237\131\157\235\144\156 \236\149\132\236\157\180\237\133\156\236\157\152 \237\128\152\236\138\164\237\138\184 \236\130\172\236\154\169 \236\160\149\235\179\180 \237\145\156\236\139\156 \236\151\172\235\182\128\235\165\188 \236\132\164\236\160\149\237\149\169\235\139\136\235\139\164.";
		HelpStack	= "\236\132\160\237\131\157\235\144\156 \236\149\132\236\157\180\237\133\156\236\157\152 \234\178\185\236\179\144 \235\134\147\236\157\132 \236\136\152 \236\158\136\235\138\148 \234\176\156\236\136\152 \237\145\156\236\139\156 \236\151\172\235\182\128\235\165\188 \236\132\164\236\160\149\237\149\169\235\139\136\235\139\164.";
		HelpUsage	= "\236\132\160\237\131\157\235\144\156 \236\149\132\236\157\180\237\133\156\236\157\180 \236\130\172\236\154\169\235\144\152\235\138\148 \236\160\132\235\172\184 \234\184\176\236\136\160 \237\145\156\236\139\156 \236\151\172\235\182\128\235\165\188 \236\132\164\236\160\149\237\149\169\235\139\136\235\139\164.";
		HelpVendor	= "\236\132\160\237\131\157\235\144\156 \236\149\132\236\157\180\237\133\156\236\157\152 \236\131\129\236\160\144\234\176\128 \237\145\156\236\139\156 \236\151\172\235\182\128\235\165\188 \236\132\164\236\160\149\237\149\169\235\139\136\235\139\164.";
		HelpVendorBuy	= "\236\132\160\237\131\157\235\144\156 \236\149\132\236\157\180\237\133\156\236\157\152 \236\131\129\236\160\144 \237\140\144\235\167\164\234\176\128\235\165\188 \237\145\156\236\139\156\237\149\169\235\139\136\235\139\164. (\236\131\129\236\160\144\234\176\128 \237\145\156\236\139\156 \236\132\164\236\160\149\236\157\180 \236\188\156\236\160\184\236\158\136\236\150\180\236\149\188 \237\149\169\235\139\136\235\139\164.)";
		HelpVendorSell	= "\236\132\160\237\131\157\235\144\156 \236\149\132\236\157\180\237\133\156\236\157\152 \236\131\129\236\160\144 \235\167\164\236\158\133\234\176\128\235\165\188 \237\145\156\236\139\156\237\149\169\235\139\136\235\139\164. (\236\131\129\236\160\144\234\176\128 \237\145\156\236\139\156 \236\132\164\236\160\149\236\157\180 \236\188\156\236\160\184\236\158\136\236\150\180\236\149\188 \237\149\169\235\139\136\235\139\164.)";


		-- Section: Keybinding Text
		BindingHeader	= "Informant";
		BindingTitle	= "\236\160\149\235\179\180 \236\176\189 \236\151\180\234\184\176/\235\139\171\234\184\176";


		-- Section: Tooltip Messages
		FrameTitle	= "Informant \236\149\132\236\157\180\237\133\156 \236\160\149\235\179\180";
		FrmtActDefault	= "Informant\236\157\152 %s \236\132\164\236\160\149\236\157\180 \236\180\136\234\184\176\237\153\148 \235\144\152\236\151\136\236\138\181\235\139\136\235\139\164.";
		FrmtActDefaultall	= "\235\170\168\235\147\160 Informant \236\132\164\236\160\149\236\157\180 \236\180\136\234\184\176\237\153\148 \235\144\152\236\151\136\236\138\181\235\139\136\235\139\164.";
		FrmtActDisable	= "\236\149\132\236\157\180\237\133\156\236\157\152 %s \235\141\176\236\157\180\237\132\176\235\165\188 \237\145\156\236\139\156\237\149\152\236\167\128 \236\149\138\236\138\181\235\139\136\235\139\164.";
		FrmtActEnable	= "\236\149\132\236\157\180\237\133\156\236\157\152 %s \235\141\176\236\157\180\237\132\176\235\165\188 \237\145\156\236\139\156\237\149\169\235\139\136\235\139\164.";
		FrmtActEnabledOn	= "\236\149\132\236\157\180\237\133\156\236\157\152 %s|1\236\157\132;\235\165\188; %s\236\151\144 \237\145\156\236\139\156\237\149\169\235\139\136\235\139\164.";
		FrmtActSet	= "%s|1\236\157\132;\235\165\188; '%s'|1;\236\156\188\235\161\156;\235\161\156 \236\132\164\236\160\149\237\149\169\235\139\136\235\139\164.";
		FrmtActUnknown	= "\236\149\140 \236\136\152 \236\151\134\235\138\148 \235\170\133\235\160\185\236\150\180: '%s'";
		FrmtInfoBuy	= "\236\131\129\236\160\144 \237\140\144\235\167\164\234\176\128";
		FrmtInfoBuymult	= "\236\131\129\236\160\144 \237\140\144\235\167\164\234\176\128 %d (\234\176\156\235\139\185 %s)";
		FrmtInfoClass	= "\235\182\132\235\165\152: %s";
		FrmtInfoMerchants	= "%d\235\170\133\236\157\152 \236\131\129\236\157\184\236\157\180 \237\140\144\235\167\164\236\164\145";
		FrmtInfoQuest	= "%d\234\176\156 \237\128\152\236\138\164\237\138\184\236\157\152 \237\128\152\236\138\164\237\138\184 \236\149\132\236\157\180\237\133\156";
		FrmtInfoSell	= "\236\131\129\236\160\144 \235\167\164\236\158\133\234\176\128";
		FrmtInfoSellmult	= "\236\131\129\236\160\144 \235\167\164\236\158\133\234\176\128 %d (\234\176\156\235\139\185 %s)";
		FrmtInfoStx	= "\236\181\156\235\140\128 %d\234\176\156 \234\185\140\236\167\128 \234\178\185\236\179\144\236\167\144";
		FrmtInfoUse	= "\236\130\172\236\154\169: %s";
		FrmtUnknownLocale	= "('%s') \236\157\128 \236\149\140 \236\136\152 \236\151\134\236\138\181\235\139\136\235\139\164. \236\152\172\235\176\148\235\165\184 \236\167\128\236\151\173 \236\132\164\236\160\149\236\157\128 \235\139\164\236\157\140\234\179\188 \234\176\153\236\138\181\235\139\136\235\139\164.:";
		FrmtWelcome	= "Informant v%s \235\161\156\235\147\156\235\144\168.";
		InfoHeader	= "Information on |cff%s%s|r";
		InfoNoItem	= "\235\168\188\236\160\128 \236\149\132\236\157\180\237\133\156\236\151\144 \235\167\136\236\154\176\236\138\164 \236\187\164\236\132\156\235\165\188 \236\152\172\235\166\176 \237\155\132 \237\130\164\235\165\188 \235\136\132\235\165\180\236\132\184\236\154\148.";
		InfoPlayerMade	= "%d %s\235\160\136\235\178\168 \236\151\144\236\132\156 \235\167\140\235\147\164\236\150\180\236\167\145\235\139\136\235\139\164.";
		InfoQuestHeader	= "%d \234\176\156\236\157\152 \237\128\152\236\138\164\237\138\184\236\151\144 \236\130\172\236\154\169\235\144\168:";
		InfoQuestName	= "\"%s\"\236\157\152 %d (\235\160\136\235\178\168 %d)";
		InfoQuestSource	= "\237\128\152\236\138\164\237\138\184 \236\158\144\235\163\140\234\176\128 \236\160\156\234\179\181\235\144\152\235\138\148 \234\179\179:";
		InfoVendorHeader	= "%d\235\170\133\236\157\152 \234\176\128\235\138\165\237\149\156 \236\131\129\236\157\184:";
		InfoVendorName	= "%s";


		-- Section: Type Messages
		AdditAlcohol	= "\236\136\160";
		AdditBuff	= "\235\178\132\237\148\132";
		AdditDrink	= "\236\157\140\235\163\140\236\136\152";
		AdditFirework	= "\235\182\136\234\189\131";
		AdditFood	= "\236\157\140\236\139\157";
		AdditGiftwrap	= "\237\143\172\236\158\165\236\167\128";
		AdditLure	= "\237\152\132\237\152\185";
		AdditPoison	= "\235\143\133";
		AdditPotion	= "\235\172\188\236\149\189";
		AdditRestorative	= "\237\154\140\235\179\181";
		AdditScroll	= "\235\145\144\235\163\168\235\167\136\235\166\172";
		SkillAlchemy	= "\236\151\176\234\184\136\236\136\160";
		SkillBlacksmithing	= "\235\140\128\236\158\165\234\184\176\236\136\160";
		SkillCooking	= "\236\154\148\235\166\172";
		SkillDruid	= "\235\147\156\235\163\168\236\157\180\235\147\156 \235\167\136\235\178\149";
		SkillEnchanting	= "\235\167\136\235\178\149\235\182\128\236\151\172";
		SkillEngineering	= "\234\184\176\234\179\132 \234\179\181\237\149\153";
		SkillFirstAid	= "\236\157\145\234\184\137\236\185\152\235\163\140";
		SkillLeatherworking	= "\234\176\128\236\163\189\236\132\184\234\179\181";
		SkillMage	= "\235\167\136\235\178\149\236\130\172 \235\167\136\235\178\149";
		SkillMining	= "\236\177\132\234\180\145";
		SkillPaladin	= "\236\132\177\234\184\176\236\130\172 \235\167\136\235\178\149";
		SkillPriest	= "\236\130\172\236\160\156 \235\167\136\235\178\149";
		SkillRogue	= "\235\143\132\236\160\129 \236\138\164\237\130\172";
		SkillShaman	= "\236\163\188\236\136\160\236\130\172 \235\167\136\235\178\149";
		SkillTailoring	= "\236\158\172\235\180\137\236\136\160";
		SkillWarlock	= "\237\157\145\235\167\136\235\178\149\236\130\172 \235\167\136\235\178\149";

	};

	ptPT = {


		-- Section: Commands
		CmdClearAll	= "todos";
		CmdDefault	= "padrao";
		CmdDisable	= "desactivar";
		CmdEmbed	= "integrar";
		CmdHelp	= "ajuda";
		CmdLocale	= "local";
		CmdOff	= "desligado";
		CmdOn	= "ligado";
		CmdToggle	= "mudar";
		OptLocale	= "<local>";
		ShowIcon	= "mostrar-\195\173cone";
		ShowMerchant	= "mostrar-comerciante";
		ShowQuest	= "mostrar-aventura";
		ShowStack	= "mostra-pilha";
		ShowUsage	= "mostrar-uso";
		ShowVendor	= "mostrar-vendedor";
		ShowVendorBuy	= "mostrar-vendedor-compra";
		ShowVendorSell	= "mostrar-vendedor-venda";


		-- Section: Generic Messages
		MesgNotLoaded	= "O Informant n\195\163o est\195\161 carregado. Escreva /informant para mais info. ";
		StatOff	= "N\195\163o exibindo qualquer informa\195\167\195\181es de item";
		StatOn	= "Exibindo informa\195\167\195\181es configuradas de item";
		Welcome	= "|C40ff50ffBemvindo ao Informant|r Dado que \195\169 a primeira vez que est\195\161 a usar o Informant, esta mensagem aparece para deix\195\161-lo saber que deve p\195\180r uma para tecla mostrar esta janela na sec\195\167\195\163o de |cffffffffkeybindings |r do |cffffffffGameMenu|r. A partir da\195\173, para ver informa\195\167\195\181es avan\195\167adas no seu invent\195\161rio, simplesmente mova o seu cursor por cima do item sobre o qual quer ver informa\195\167\195\163o e pressione a tecla que configurou, e esta janela vai aparecer com a informa\195\167\195\163o sobre esse item. Nesse ponto, simplesmente pressione a tecla outra vez, ou clique o bot\195\163o de fechar esta janela. Clique o bot\195\163o de fechar agora para continuar. ";


		-- Section: Help Text
		GuiDefaultAll	= "Restaurar todas as op\195\167\195\181es do Informant aos valores padr\195\163o";
		GuiDefaultAllButton	= "Restaurar todas";
		GuiDefaultAllHelp	= "Clique aqui para p\195\180r todas as op\195\167\195\181es do Informant nos seus valores padr\195\163o. AVISO: Esta ac\195\167\195\163o N\195\131O \195\169 revers\195\173vel. ";
		GuiDefaultOption	= "Restaurar este valor";
		GuiEmbed	= "Integrar a informa\195\167\195\163o na tooltip do jogo";
		GuiEmbedHeader	= "Integrar";
		GuiInfoHeader	= "Informa\195\167\195\163o adicional";
		GuiInfoHelp	= "Controla que informa\195\167\195\163o adicional \195\169 mostrada nos tooltips";
		GuiInfoIcon	= "Mostrar \195\173cones do invent\195\161rio";
		GuiInfoMerchant	= "Mostrar comerciantes";
		GuiInfoQuest	= "Mostrar informa\195\167\195\163o de miss\195\163o";
		GuiInfoStack	= "Mostrar tamanhos de pilha";
		GuiInfoUsage	= "Mostrar informa\195\167\195\163o de uso";
		GuiLocale	= "Fixar localiza\195\167\195\163o para";
		GuiMainEnable	= "Ligar Informant";
		GuiMainHelp	= "Cont\195\170m op\195\167\195\181es para o Informant um AddOn que mostra informa\195\167\195\163o detalhada dos objectos";
		GuiOtherHeader	= "Outras Op\195\167\195\181es";
		GuiOtherHelp	= "Op\195\167\195\181es Alheias do Informant";
		GuiReloadui	= "Recarregar Interface de Utilizador";
		GuiReloaduiButton	= "RecarregarUI";
		GuiReloaduiFeedback	= "Agora a Recarregar UI do WoW";
		GuiReloaduiHelp	= "Carregar aqui para recarregar a Interface de Utilizador do WoW depois de mudar a localiza\195\167\195\163o para que a linguagem neste ecr\195\163 de configura\195\167ao coincida com o que seleccionou.\nNota: esta opera\195\167\195\163o poder\195\161 demorar alguns minutos.";
		GuiVendor	= "Mostrar Pre\195\167os de Vendedor";
		GuiVendorBuy	= "Mostrar Pre\195\167os de Comprador";
		GuiVendorHeader	= "Pre\195\167os de Vendedor";
		GuiVendorHelp	= "Op\195\167\195\181es relaccionadas com os pre\195\167os de compra/venda dos NPCs.";
		GuiVendorSell	= "Mostrar Pre\195\167os de Venda dos Vendedores";
		HelpDefault	= "Ajustar o Informant para a sua op\195\167\195\163o de defeito. Voc\195\170 pode tamb\195\169m especificar o keyword especial \226\128\156tudo\226\128\157 para ajustar todas as op\195\167\195\181es do Informant a seus valores de defeito.";
		HelpDisable	= "Proibe o Informant de se ligar autom\195\161ticamente da pr\195\179xima vez que entrar";
		HelpEmbed	= "Encaixar o texto no tooltip original do jogo (nota: determinadas caracter\195\173sticas s\195\163o desligadas quando esta for selecionada)";
		HelpIcon	= "Selecionar se ir\195\161 mostrar o \195\173cone do objecto no invent\195\161rio";
		HelpLocale	= "Muda a localiza\195\167\195\163o que \195\169 usada para mostrar as mensagens do Informant";
		HelpMerchant	= "Seleccionar se quer ver vendedores que fornecem objectos";
		HelpOnoff	= "Liga e Desliga a exibi\195\167\195\163o da informa\195\167\195\163o";
		HelpQuest	= "Seleccionar se quer ver em quantas quests se usam os objectos";
		HelpStack	= "Seleccionar se quer ver o tamanha m\195\161ximo da pilha do objecto";
		HelpUsage	= "Sleccionar se quer ver em que profis\195\181es se usam o objecto";
		HelpVendor	= "Seleccionar se quer ver o pre\195\167o de venda dos items no vendedor";
		HelpVendorBuy	= "Seleccionar se quer ver o pre\195\167o de compra do vendedor (req mostrar-vendedor=ligado)";
		HelpVendorSell	= "Seleccionar se quer ver o pre\195\167o de venda do vendedor (req mostrar-vendedor=ligado)";


		-- Section: Keybinding Text
		BindingHeader	= "Informant";
		BindingTitle	= "Mostrar Janela de Informa\195\167\195\163o";


		-- Section: Tooltip Messages
		FrameTitle	= "Informa\195\167\195\163o do objecto do Informant";
		FrmtActDefault	= "%s op\195\167\195\163o do Informant for mudada para Padr\195\163o";
		FrmtActDefaultall	= "Todas as informa\195\167\195\181es do Informant voltaram a Padr\195\163o.";
		FrmtActDisable	= "N\195\163o mostrando a %s de data do objecto";
		FrmtActEnable	= "Mostrando a %s data do objecto";
		FrmtActEnabledOn	= "Mostrando objecto %s no %s";
		FrmtActSet	= "Aplicar %s para '%s'";
		FrmtActUnknown	= "Comando desconhecido: '%s'";
		FrmtInfoBuy	= "Comprar pelo vendedor";
		FrmtInfoBuymult	= "Comprar %d (%s cada)";
		FrmtInfoClass	= "Classe: %s";
		FrmtInfoMerchants	= "Vendido por %d vendedores";
		FrmtInfoQuest	= "Objecto de Quest em %d Quests";
		FrmtInfoSell	= "Vender ao vendedor";
		FrmtInfoSellmult	= "Vender %d (%s cada)";
		FrmtInfoStx	= "Mete-se em Pilhas de %d";
		FrmtInfoUse	= "Usado para: %s";
		FrmtUnknownLocale	= "A Localiza\195\167\195\163o que especif\195\173cou ('%s') \195\169 desconhecida. Localiza\195\167\195\181es v\195\161lidas s\195\163o:";
		FrmtWelcome	= "Informant v%s carregado";
		InfoHeader	= "Informant Ligado |cff%s%s|r";
		InfoNoItem	= "Primeiro tem de mover sobre um item e s\195\179 depois carregar na tecla de activa\195\167\195\163o";
		InfoPlayerMade	= "Feito por n\195\173vel %d %s";
		InfoQuestHeader	= "Usado em %d Quests";
		InfoQuestName	= "%d for \"%s\" (N\195\173vel %d)";
		InfoQuestSource	= "Data de Quest fornecida por";
		InfoVendorHeader	= "Dispon\195\173vel de %d vendedores";
		InfoVendorName	= "%s";


		-- Section: Type Messages
		AdditAlcohol	= "Alcohol";
		AdditBuff	= "Buff";
		AdditDrink	= "Beber";
		AdditFirework	= "Fogo de Artificio";
		AdditFood	= "Comida";
		AdditGiftwrap	= "Papel de Embrulho";
		AdditLure	= "Isco";
		AdditPoison	= "Veneno";
		AdditPotion	= "Po\195\167\195\163o";
		AdditRestorative	= "Restorativo";
		AdditScroll	= "C\195\179dice";
		SkillAlchemy	= "Alchimia";
		SkillBlacksmithing	= "Smeltar";
		SkillCooking	= "Cozinhar";
		SkillDruid	= "Feiti\195\167os de Druid";
		SkillEnchanting	= "Encantos";
		SkillEngineering	= "Engenharia";
		SkillFirstAid	= "Primeiros Socorros";
		SkillLeatherworking	= "Trabalhos em Pele";
		SkillMage	= "Feiti\195\167os de Mage";
		SkillMining	= "Minar";
		SkillPaladin	= "Feiti\195\167os de Paladin";
		SkillPriest	= "Feiti\195\167os de Priest";
		SkillRogue	= "Habilidades de Rogue";
		SkillShaman	= "Feiti\195\167os de Shaman";
		SkillTailoring	= "Alfaiate";
		SkillWarlock	= "Feiti\195\167os de Warlock";

	};

	ruRU = {


		-- Section: Commands
		CmdClearAll	= "all";
		CmdDefault	= "default";
		CmdDisable	= "disable";
		CmdEmbed	= "embed";
		CmdHelp	= "help";
		CmdLocale	= "locale";
		CmdOff	= "off";
		CmdOn	= "on";
		CmdToggle	= "toggle";
		OptLocale	= "<locale> ";
		ShowIcon	= "show-icon";
		ShowMerchant	= "show-merchant\n";
		ShowQuest	= "show-quest";
		ShowStack	= "show-stack\n";
		ShowUsage	= "show-usage";
		ShowVendor	= "show-vendor\n";
		ShowVendorBuy	= "show-vendor-buy";
		ShowVendorSell	= "show-vendor-sell";


		-- Section: Generic Messages
		MesgNotLoaded	= "\208\152\208\189\209\132\208\190\209\128\208\188\208\176\208\189\209\130 \208\189\208\181 \208\183\208\176\208\179\209\128\209\131\208\182\208\181\208\189. \208\146\208\178\208\181\208\180\208\184\209\130\208\181 /informant \208\180\208\187\209\143 \208\191\208\190\208\180\209\128\208\190\208\177\208\189\208\190\208\185 \208\184\208\189\209\132\208\190\209\128\208\188\208\176\209\134\208\184\208\184.";
		StatOff	= "\208\152\208\189\209\132\208\190\209\128\208\188\208\176\209\134\208\184\209\143 \208\191\208\190 \208\191\209\128\208\181\208\180\208\188\208\181\209\130\208\176\208\188 \208\189\208\181 \208\191\208\190\208\186\208\176\208\183\209\139\208\178\208\176\208\181\209\130\209\129\209\143";
		StatOn	= "\208\159\208\190\208\186\208\176\208\183\209\139\208\178\208\176\208\181\209\130\209\129\209\143 \208\183\208\176\208\180\208\176\208\189\208\189\208\176\209\143 \208\184\208\189\209\132\208\190\209\128\208\188\208\176\209\134\208\184\209\143 \208\191\208\190 \208\191\209\128\208\181\208\180\208\188\208\181\209\130\208\176\208\188";
		Welcome	= "|c40ff50ff\208\148\208\177\209\128\208\190 \208\191\208\190\208\182\208\176\208\187\208\190\208\178\208\176\209\130\209\140 \208\178 \208\152\208\189\209\132\208\190\209\128\208\188\208\176\208\189\209\130|r \208\173\209\130\208\190 \209\129\208\190\208\190\208\177\209\137\208\181\208\189\208\184\208\181 \208\191\208\190\208\186\208\176\208\183\209\139\208\178\208\176\208\181\209\130\209\129\209\143 \208\191\208\190\209\130\208\190\208\188\209\131 \209\135\209\130\208\190 \208\146\209\139 \208\183\208\176\208\191\209\131\209\129\209\130\208\184\208\187\208\184 \208\152\208\189\209\132\208\190\209\128\208\188\208\176\208\189\209\130 \208\178 \208\191\208\181\209\128\208\178\209\139\208\185 \209\128\208\176\208\183. \208\167\209\130\208\190 \208\177\209\139 \208\178\209\139\208\183\208\178\208\176\209\130\209\140 \209\141\209\130\208\190 \208\190\208\186\208\189\208\190 \208\178 \208\180\208\176\208\187\209\140\208\189\208\181\208\185\209\136\208\181\208\188, \208\146\209\139 \208\180\208\190\208\187\208\182\208\189\209\139 \208\191\209\128\208\184\208\178\209\143\208\183\208\176\209\130\209\140 \208\186 \208\189\208\181\208\188\209\131 \208\186\208\187\208\176\208\178\208\184\209\136\209\131 \208\178 |cffffffffGame Menu|r, \208\178 \209\128\208\176\208\183\208\180\208\181\208\187\208\181 |cffffffffKeybindings|r. \208\159\208\190\209\129\208\187\208\181 \209\141\209\130\208\190\208\179\208\190, \209\135\209\130\208\190 \208\177\209\139 \209\131\208\178\208\184\208\180\208\181\209\130\209\140 \209\128\208\176\209\129\209\136\208\184\209\128\208\181\208\189\208\189\209\131\209\142 \208\184\208\189\209\132\208\190\209\128\208\188\208\176\209\134\208\184\209\142 \208\190 \208\191\209\128\208\181\208\180\208\188\208\181\209\130\208\181 \208\184\208\183 \208\190\208\180\208\189\208\190\208\179\208\190 \208\184\208\183 \208\188\208\181\209\136\208\186\208\190\208\178, \208\191\209\128\208\190\209\129\209\130\208\190 \209\131\209\129\209\130\208\176\208\189\208\190\208\178\208\184\209\130\208\181 \208\186\209\131\209\128\209\129\208\190\209\128 \208\188\209\139\209\136\208\186\208\184 \208\189\208\176\208\180 \208\184\208\189\209\130\208\181\209\128\208\181\209\129\209\131\209\142\209\137\208\184\208\188 \208\146\208\176\209\129 \208\191\209\128\208\181\208\180\208\188\208\181\209\130\208\190\208\188 \208\184 \208\189\208\176\208\182\208\188\208\184\209\130\208\181 \208\186\208\187\208\176\208\178\208\184\209\136\209\131, \208\186\208\190\209\130\208\190\209\128\209\131\209\142 \208\146\209\139 \208\191\209\128\208\184\208\178\209\143\208\183\208\176\208\187\208\184. \208\161\208\181\208\185\209\135\208\176\209\129 \208\146\209\139 \208\188\208\190\208\182\208\181\209\130\208\181 \208\183\208\176\208\186\209\128\209\139\209\130\209\140 \209\141\209\130\208\190 \208\190\208\186\208\189\208\190.";


		-- Section: Help Text
		GuiDefaultAll	= "\208\161\208\177\209\128\208\190\209\129\208\184\209\130\209\140 \208\178\209\129\208\181 \208\189\208\176\209\129\209\130\209\128\208\190\208\185\208\186\208\184 \208\152\208\189\209\132\208\190\209\128\208\188\208\176\208\189\209\130\208\176";
		GuiDefaultAllButton	= "\208\161\208\177\209\128\208\190\209\129\208\184\209\130\209\140 \208\178\209\129\209\145";
		GuiDefaultAllHelp	= "\208\169\208\181\208\187\208\186\208\189\208\184\209\130\208\181 \209\130\209\131\209\130 \208\180\208\187\209\143 \209\130\208\190\208\179\208\190 \209\135\209\130\208\190\208\177\209\139 \209\131\209\129\209\130\208\176\208\189\208\190\208\178\208\184\209\130\209\140 \208\178\209\129\208\181 \208\189\208\176\209\129\209\130\209\128\208\190\208\185\208\186\208\184 \208\152\208\189\209\132\208\190\209\128\208\188\208\176\208\189\209\130\208\176 \208\186 \208\184\209\133 \208\183\208\189\208\176\209\135\208\181\208\189\208\184\209\143\208\188 \208\191\208\190 \209\131\208\188\208\190\208\187\209\135\208\176\208\189\208\184\209\142. \208\146\208\157\208\152\208\156\208\144\208\157\208\152\208\149: \208\173\209\130\208\190 \208\180\208\181\208\185\209\129\209\130\208\178\208\184\208\181 \208\189\208\181\208\187\209\140\208\183\209\143 \208\190\209\130\208\188\208\181\208\189\208\184\209\130\209\140, \208\181\209\129\208\187\208\184 \208\146\209\139 \208\191\208\181\209\128\208\181\208\180\209\131\208\188\208\176\208\181\209\130\208\181.";
		GuiDefaultOption	= "\208\161\208\177\209\128\208\190\209\129\208\184\209\130\209\140 \209\141\209\130\208\190 \208\189\208\176\209\129\209\130\209\128\208\190\208\185\208\186\209\131";
		GuiEmbed	= "\208\146\209\129\209\130\208\176\208\178\208\187\209\143\209\130\209\140 \208\184\208\189\209\132\208\190\209\128\208\188\208\176\209\134\208\184\209\142 \208\178 \209\129\209\130\208\176\208\189\208\180\208\176\209\128\209\130\208\189\209\131\209\142 \208\178\209\129\208\191\208\187\209\139\208\178\208\176\209\142\209\137\209\131\209\142 \208\191\208\190\208\180\209\129\208\186\208\176\208\183\208\186\209\131";
		GuiEmbedHeader	= "\208\146\209\129\209\130\208\176\208\178\208\187\209\143\209\130\209\140";
		GuiInfoHeader	= "\208\148\208\190\208\191\208\190\208\187\208\189\208\184\209\130\208\181\208\187\209\140\208\189\208\176\209\143\208\176 \208\184\208\189\209\132\208\190\209\128\208\188\208\176\209\134\208\184\209\143\n";
		GuiInfoHelp	= "\208\158\208\191\209\128\208\181\208\180\208\181\208\187\209\143\208\181\209\130 \208\186\208\176\208\186\209\131\209\142 \208\180\208\190\208\191\208\190\208\187\208\189\208\184\209\130\208\181\208\187\209\140\208\189\209\131\209\142 \208\184\208\189\209\132\208\190\209\128\208\188\208\176\209\134\208\184\209\142 \208\191\208\190\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140 \208\178\208\190 \208\178\209\129\208\191\208\187\209\139\208\178\208\176\209\142\209\137\208\184\209\133 \208\191\208\190\208\180\209\129\208\186\208\176\208\183\208\186\208\176\209\133";
		GuiInfoIcon	= "\208\159\208\190\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140 \208\183\208\189\208\176\209\135\208\190\208\186 \208\191\209\128\208\181\208\180\208\188\208\181\209\130\208\176 \208\178\208\190 \208\178\209\129\208\191\208\187\209\139\208\178\208\176\209\142\209\137\208\181\208\185 \208\191\208\190\208\180\209\129\208\186\208\176\208\183\208\186\208\181";
		GuiInfoMerchant	= "\208\159\208\190\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140 \208\191\209\128\208\190\208\180\208\176\208\178\209\134\208\190\208\178";
		GuiInfoQuest	= "\208\159\208\190\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140 \208\184\208\189\209\132\208\190\209\128\208\188\208\176\209\134\208\184\209\142 \208\190 \208\183\208\176\208\180\208\176\208\189\208\184\209\143\209\133";
		GuiInfoStack	= "\208\159\208\190\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140 \209\129\208\186\208\190\208\187\209\140\208\186\208\190 \209\130\208\176\208\186\208\184\209\133 \208\191\209\128\208\181\208\180\208\188\208\181\209\130\208\190\208\178 \208\191\208\190\208\188\208\181\209\137\208\176\209\142\209\130\209\129\209\143 \208\189\208\176 \208\190\208\180\208\189\208\190 \208\188\208\181\209\129\209\130\208\190";
		GuiInfoUsage	= "\208\159\208\190\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140 \208\179\208\180\208\181 \209\130\208\176\208\186\208\184\208\181 \208\191\209\128\208\181\208\180\208\188\208\181\209\130\209\139 \208\184\209\129\208\191\208\190\208\187\209\140\208\183\209\131\209\142\209\130\209\129\209\143";
		GuiLocale	= "\208\159\208\190\208\188\208\181\208\189\209\143\209\130\209\140 \209\143\208\183\209\139\208\186 \208\189\208\176\n";
		GuiMainEnable	= "\208\146\208\186\208\187\209\142\209\135\208\184\209\130\209\140 \208\152\208\189\209\132\208\190\209\128\208\188\208\176\208\189\209\130";
		GuiMainHelp	= "\208\161\208\190\208\180\208\181\209\128\208\182\208\184\209\130 \208\189\208\176\209\129\209\130\209\128\208\190\208\185\208\186\208\184 \208\180\208\187\209\143 \208\152\208\189\209\132\208\190\209\128\208\188\208\176\208\189\209\130\208\176 - AddOn'a, \208\186\208\190\209\130\208\190\209\128\209\139\208\185 \208\191\208\190\208\186\208\176\208\183\209\139\208\178\208\176\208\181\209\130 \209\128\208\176\209\129\209\136\208\184\209\128\208\181\208\189\208\189\209\139\208\181 \208\180\208\176\208\189\208\189\209\139\208\181 \208\191\208\190 \208\191\209\128\208\181\208\180\208\188\208\181\209\130\208\176\208\188\n";
		GuiOtherHeader	= "\208\148\209\128\209\131\208\179\208\184\208\181 \208\189\208\176\209\129\209\130\209\128\208\190\208\185\208\186\208\184\n";
		GuiOtherHelp	= "\208\158\209\129\209\130\208\176\208\187\209\140\208\189\209\139\208\181 \208\189\208\176\209\129\209\130\209\128\208\190\208\185\208\186\208\184 \208\152\208\189\209\132\208\190\209\128\208\188\208\176\208\189\209\130\208\176";
		GuiReloadui	= "\208\159\208\181\209\128\208\181\208\183\208\176\208\179\209\128\209\131\208\183\208\184\209\130\209\140 \208\191\208\190\208\187\209\140\208\183\208\190\208\178\208\176\209\130\208\181\208\187\209\140\209\129\208\186\208\184\208\185 \208\184\208\189\209\130\208\181\209\128\209\132\208\181\208\185\209\129";
		GuiReloaduiButton	= "ReloadUI";
		GuiReloaduiFeedback	= "\208\159\208\190\208\187\209\140\208\183\208\190\208\178\208\176\209\130\208\181\208\187\209\140\209\129\208\186\208\184\208\185 \208\184\208\189\209\130\208\181\209\128\209\132\208\181\208\185\209\129 WoW \208\191\208\181\209\128\208\181\208\183\208\176\208\179\209\128\209\131\208\182\208\176\208\181\209\130\209\129\209\143\n";
		GuiReloaduiHelp	= "\208\169\209\145\208\187\208\186\208\189\208\184\209\130\208\181 \209\130\209\131\209\130, \209\135\209\130\208\190 \208\177\209\139 \208\191\208\181\209\128\208\181\208\183\208\176\208\179\209\128\209\131\208\183\208\184\209\130\209\140 \208\191\208\190\208\187\209\140\208\183\208\190\208\178\208\176\209\130\208\181\208\187\209\140\209\129\208\186\208\184\208\185 \208\184\208\189\209\130\208\181\209\128\209\132\208\181\208\185\209\129 WoW, \209\141\209\130\208\190 \208\189\208\181\208\190\208\177\209\133\208\190\208\180\208\184\208\188\208\190 \208\180\208\187\209\143 \209\130\208\190\208\179\208\190 \209\135\209\130\208\190 \208\177\209\139 \208\183\208\176\208\179\209\128\209\131\208\183\208\184\209\130\209\140 \208\178\209\139\208\177\209\128\208\176\208\189\208\189\209\139\208\185 \209\143\208\183\209\139\208\186. \208\159\209\128\208\184\208\188\208\181\209\135\208\176\208\189\208\184\208\181: \208\173\209\130\208\176 \208\190\208\191\208\181\209\128\208\176\209\134\208\184\209\143 \208\188\208\190\208\182\208\181\209\130 \208\183\208\176\208\189\209\143\209\130\209\140 \208\189\208\181\209\129\208\186\208\190\208\187\209\140\208\186\208\190 \208\188\208\184\208\189\209\131\209\130.";
		GuiVendor	= "\208\159\208\190\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140 \209\134\208\181\208\189\209\131 \209\130\208\190\209\128\208\179\208\190\208\178\209\134\208\181\208\178\n";
		GuiVendorBuy	= "\208\159\208\190\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140 \209\134\208\181\208\189\209\131 \208\191\208\190\208\186\209\131\208\191\208\186\208\184 \209\131 \209\130\208\190\209\128\208\179\208\190\208\178\209\134\208\181\208\178";
		GuiVendorHeader	= "\208\166\208\181\208\189\209\139 \209\130\208\190\209\128\208\179\208\190\208\178\209\134\208\181\208\178\n";
		GuiVendorHelp	= "\208\157\208\176\209\129\209\130\209\128\208\190\208\185\208\186\208\184 \208\190\209\130\208\189\208\190\209\129\209\143\209\137\208\184\208\181\209\129\209\143 \208\186 \209\134\208\181\208\189\208\176\208\188 \208\191\208\190\208\186\209\131\208\191\208\186\208\184/\208\191\209\128\208\190\208\180\208\176\208\182\208\184 \209\131 \209\130\208\190\209\128\208\179\208\190\208\178\209\134\208\181\208\178.";
		GuiVendorSell	= "\208\159\208\190\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140 \209\134\208\181\208\189\209\139 \208\191\209\128\208\190\208\180\208\176\208\182\208\184 \209\131 \209\130\208\190\209\128\208\179\208\190\208\178\209\134\208\181\208\178";
		HelpDefault	= "\208\163\209\129\209\130\208\176\208\189\208\190\208\178\208\184\209\130\209\140 \208\189\208\176\209\129\209\130\209\128\208\190\208\185\208\186\209\131 \208\186 \208\181\209\145 \208\183\208\189\208\176\209\135\208\181\208\189\208\184\209\142 \208\191\208\190 \209\131\208\188\208\190\208\187\209\135\208\176\208\189\208\184\209\142. \208\146\209\139 \208\188\208\190\208\182\208\181\209\130\208\181 \209\131\208\186\208\176\208\183\208\176\209\130\209\140 'all' \209\135\209\130\208\190 \208\177\209\139 \209\131\209\129\209\130\208\176\208\189\208\190\208\178\208\184\209\130\209\140 \208\178\209\129\208\181 \208\189\208\176\209\129\209\130\209\128\208\190\208\185\208\186\208\184 \208\186 \208\184\209\133 \208\183\208\189\208\176\209\135\208\181\208\189\208\184\209\142 \208\191\208\190 \209\131\208\188\208\190\208\187\209\135\208\176\208\189\208\184\209\142.\n";
		HelpDisable	= "\208\157\208\181 \208\183\208\176\208\179\209\128\209\131\208\182\208\176\209\130\209\140 \208\152\208\189\209\132\208\190\209\128\208\188\208\176\208\189\209\130 \208\176\208\178\209\130\208\190\208\188\208\176\209\130\208\184\209\135\208\181\209\129\208\186\208\184 \209\129\208\187\208\181\208\180\209\131\209\142\209\137\208\184\208\185 \209\128\208\176\208\183 \208\191\209\128\208\184 \208\183\208\176\208\179\209\128\209\131\208\183\208\186\208\181 \208\184\208\179\209\128\209\139";
		HelpEmbed	= "\208\146\209\129\209\130\208\176\208\178\208\187\209\143\209\130\209\140 \209\130\208\181\208\186\209\129\209\130 \208\178 \209\129\209\130\208\176\208\189\208\180\208\176\209\128\209\130\209\131\209\142 \208\178\209\129\208\191\208\187\209\139\208\178\208\176\209\142\209\137\209\131\209\142 \208\191\208\190\208\180\209\129\208\186\208\176\208\183\208\186\209\131 \208\184\208\179\209\128\209\139. (\208\159\209\128\208\184\208\188\208\181\209\135\208\176\208\189\208\184\208\181: \208\189\208\181\208\186\208\190\209\130\208\190\209\128\209\139\208\181 \208\178\208\190\208\183\208\188\208\190\208\182\208\189\208\190\209\129\209\130\208\184 \208\189\208\181\208\180\208\190\209\129\209\130\209\131\208\191\208\189\209\139, \208\186\208\190\208\179\208\180\208\176 \209\141\209\130\208\190\209\130 \209\128\208\181\208\182\208\184\208\188 \209\128\208\176\208\183\209\128\208\181\209\136\209\145\208\189)";
		HelpIcon	= "\208\146\209\139\208\177\209\128\208\176\209\130\209\140 \208\191\208\190\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140 \208\187\208\184 \208\183\208\189\208\176\209\135\209\145\208\186 \208\191\209\128\208\181\208\180\208\188\208\181\209\130\208\176 \208\178\208\190 \208\178\209\129\208\191\208\187\209\139\208\178\208\176\209\142\209\137\208\181\208\185 \208\191\208\190\208\180\209\129\208\186\208\176\208\183\208\186\208\181";
		HelpLocale	= "\208\159\208\190\208\188\208\181\208\189\209\143\209\130\209\140 \209\143\208\183\209\139\208\186 \209\129\208\190\208\190\208\177\209\137\208\181\208\189\208\184\208\185 \208\152\208\189\209\132\208\190\209\128\208\188\208\176\208\189\209\130\208\176";
		HelpMerchant	= "\208\146\209\139\208\177\209\128\208\176\209\130\209\140 \208\191\208\190\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140 \208\187\208\184 \209\130\208\190\209\128\208\179\208\190\208\178\209\134\208\181\208\178 \208\186\208\190\209\130\208\190\209\128\209\139\208\181 \208\191\209\128\208\190\208\180\208\176\209\142\209\130 \208\180\208\176\208\189\208\189\209\139\208\185 \208\191\209\128\208\181\208\180\208\188\208\181\209\130";
		HelpOnoff	= "\208\146\208\186\208\187\209\142\209\135\208\184\209\130\209\140/\208\190\209\130\208\186\208\187\209\142\209\135\208\184\209\130\209\140 \208\190\209\130\208\190\208\177\209\128\208\176\208\182\208\181\208\189\208\184\208\181 \208\184\208\189\209\132\208\190\209\128\208\188\208\176\209\134\208\184\208\190\208\189\208\189\209\139\209\133 \208\180\208\176\208\189\208\189\209\139\209\133";
		HelpQuest	= "\208\146\209\139\208\177\208\181\209\128\208\184\209\130\208\181 \208\187\208\184 \208\191\208\190\208\186\208\176\208\183\208\176\209\130\209\140 \208\184\209\129\208\191\208\190\208\187\209\140\208\183\208\190\208\178\208\176\208\189\208\184\208\181 \208\180\208\181\209\130\208\176\208\187\208\181\208\185 quests\n";
		HelpStack	= "\208\146\209\139\208\177\208\181\209\128\208\184\209\130\208\181 \208\187\208\184 \208\191\208\190\208\186\208\176\208\183\208\176\209\130\209\140 \209\128\208\176\208\183\208\188\208\181\209\128 \208\180\208\181\209\130\208\176\208\187\209\143 stackable\n";
		HelpUsage	= "\208\146\209\139\208\177\209\128\208\176\209\130\209\140 \208\191\208\190\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140 \208\187\208\184 \208\178 \208\186\208\176\208\186\208\184\209\133 \209\128\208\181\208\188\209\145\209\129\208\187\208\176\209\133 \208\184\209\129\208\191\208\190\208\187\209\140\208\183\209\131\208\181\209\130\209\129\209\143 \208\180\208\176\208\189\208\189\209\139\208\185 \208\191\209\128\208\181\208\180\208\188\208\181\209\130";
		HelpVendor	= "\208\146\209\139\208\177\209\128\208\176\209\130\209\140 \208\191\208\190\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140\209\129\209\143 \208\187\208\184 \209\129\208\186\208\190\208\187\209\140\208\186\208\190 \209\129\209\130\208\190\208\184\209\130 \208\180\208\176\208\189\208\189\209\139\208\185 \208\191\209\128\208\181\208\180\208\188\208\181\209\130 \209\131 \209\130\208\190\209\128\208\179\208\190\208\178\209\134\208\176";
		HelpVendorBuy	= "\208\146\209\139\208\177\209\128\208\176\209\130\209\140 \208\191\208\190\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140 \208\187\208\184 \209\134\208\181\208\189\209\131 \208\191\208\190\208\186\209\131\208\191\208\186\208\184 \208\180\208\176\208\189\208\189\208\190\208\179\208\190 \208\191\209\128\208\181\208\180\208\188\208\181\209\130\208\176 \209\131 \209\130\208\190\209\128\208\179\208\190\208\178\209\134\208\176. \208\157\208\176\209\129\209\130\209\128\208\190\208\185\208\186\208\176 show-vendor \208\191\209\128\208\184 \209\141\209\130\208\190\208\188 \208\180\208\190\208\187\208\182\208\189\208\176 \208\177\209\139\209\130\209\140 \209\130\208\190\208\182\208\181 \209\131\209\129\209\130\208\176\208\189\208\190\208\178\208\187\208\181\208\189\208\176 \208\178 on.\n";
		HelpVendorSell	= "\208\146\209\139\208\177\209\128\208\176\209\130\209\140 \208\191\208\190\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140 \208\187\208\184 \209\134\208\181\208\189\209\131 \208\191\209\128\208\190\208\180\208\176\208\182\208\184 \208\180\208\176\208\189\208\189\208\190\208\179\208\190 \208\191\209\128\208\181\208\180\208\188\208\181\209\130\208\176 \209\131 \209\130\208\190\209\128\208\179\208\190\208\178\209\134\208\176. \208\157\208\176\209\129\209\130\209\128\208\190\208\185\208\186\208\176 show-vendor \208\191\209\128\208\184 \209\141\209\130\208\190\208\188 \208\180\208\190\208\187\208\182\208\189\208\176 \208\177\209\139\209\130\209\140 \209\130\208\190\208\182\208\181 \209\131\209\129\209\130\208\176\208\189\208\190\208\178\208\187\208\181\208\189\208\176 \208\178 on.\n";


		-- Section: Keybinding Text
		BindingHeader	= "\208\152\208\189\209\132\208\190\209\128\208\188\208\176\208\189\209\130";
		BindingTitle	= "\208\159\208\190\208\186\208\176\208\183\208\176\209\130\209\140/\209\129\208\186\209\128\209\139\209\130\209\140 \208\184\208\189\209\132\208\190\209\128\208\188\208\176\209\134\208\184\208\190\208\189\208\189\208\190\208\181 \208\190\208\186\208\189\208\190.\n";


		-- Section: Tooltip Messages
		FrameTitle	= "\208\152\208\189\209\132\208\190\209\128\208\188\208\176\208\189\209\130: \208\148\208\176\208\189\208\189\209\139\208\181 \208\191\208\190 \208\191\209\128\208\181\208\180\208\188\208\181\209\130\209\131";
		FrmtActDefault	= "\208\157\208\176\209\129\209\130\209\128\208\190\208\185\208\186\208\176 %s \208\152\208\189\209\132\208\190\209\128\208\188\208\176\208\189\209\130\208\176 \208\177\209\139\208\187\208\176 \209\129\208\177\209\128\208\190\209\136\208\181\208\189\208\176 \208\186 \208\183\208\189\208\176\209\135\208\181\208\189\208\184\209\142 \208\191\208\190 \209\131\208\188\208\190\208\187\209\135\208\176\208\189\208\184\209\142\n";
		FrmtActDefaultall	= "\208\146\209\129\208\181 \208\189\208\176\209\129\209\130\209\128\208\190\208\185\208\186\208\184 \208\152\208\189\209\132\208\190\209\128\208\188\208\176\208\189\209\130\208\176 \208\177\209\139\208\187\208\184 \209\129\208\177\209\128\208\190\209\136\208\181\208\189\209\139 \208\186 \208\183\208\189\208\176\209\135\208\181\208\189\208\184\209\143\208\188 \208\191\208\190 \209\131\208\188\208\190\208\187\209\135\208\176\208\189\208\184\209\142\n";
		FrmtActDisable	= "%s \208\191\208\190\208\186\208\176\208\183\209\139\208\178\208\176\208\181\209\130\209\129\209\143";
		FrmtActEnable	= "%s \208\189\208\181 \208\191\208\190\208\186\208\176\208\183\209\139\208\178\208\176\208\181\209\130\209\129\209\143";
		FrmtActEnabledOn	= "Displaying item's %s on %s\n";
		FrmtActSet	= "%s \209\131\209\129\209\130\208\176\208\189\208\190\208\178\208\187\208\181\208\189\208\190 \208\178 '%s'";
		FrmtActUnknown	= "\208\157\208\181\208\183\208\178\208\181\209\129\209\130\208\189\208\190\208\181 \208\186\208\187\209\142\209\135\208\181\208\178\208\190\208\181 \209\129\208\187\208\190\208\178\208\190: '%s'  ";
		FrmtInfoBuy	= "\208\154\209\131\208\191\208\184\209\130\209\140 \209\131 \209\130\208\190\209\128\208\179\208\190\208\178\209\134\208\176";
		FrmtInfoBuymult	= "\208\154\209\131\208\191\208\184\209\130\209\140 %d (%s \208\186\208\176\208\182\208\180\208\190\208\181)";
		FrmtInfoClass	= "\208\154\208\187\208\176\209\129\209\129: %s";
		FrmtInfoMerchants	= "\208\159\209\128\208\190\208\180\208\176\209\145\209\130\209\129\209\143 %d \209\130\208\190\208\179\208\190\208\178\209\134\208\181\208\188(\208\176\208\188\208\184)\n";
		FrmtInfoQuest	= "Предмет задания, в %d заданиях";
		FrmtInfoSell	= "\208\159\209\128\208\190\208\180\208\176\209\130\209\140 \209\130\208\190\209\128\208\179\208\190\208\178\209\134\209\131";
		FrmtInfoSellmult	= "Продать %d (%s каждое)";
		FrmtInfoStx	= "\208\165\209\128\208\176\208\189\208\184\209\130\209\129\209\143 \208\178 \208\191\208\176\209\135\208\186\208\176\209\133 \208\191\208\190 %d\n";
		FrmtInfoUse	= "\208\152\209\129\208\191\208\190\208\187\209\140\208\183\209\131\208\181\209\130\209\129\209\143 \208\180\208\187\209\143: %s";
		FrmtUnknownLocale	= "\208\175\208\183\209\139\208\186, \208\186\208\190\209\130\208\190\209\128\209\139\208\185 \208\146\209\139 \208\183\208\176\208\180\208\176\208\187\208\184 (' %s') \208\189\208\181\208\184\208\183\208\178\208\181\209\129\209\130\208\181\208\189. \208\152\208\183\208\178\208\181\209\129\209\130\208\189\209\139 \209\129\208\187\208\181\208\180\209\131\209\142\209\137\208\184\208\181 \209\143\208\183\209\139\208\186\208\184:\n";
		FrmtWelcome	= "Informant v%s загружен /inf";
		InfoHeader	= "\208\152\208\189\209\132\208\190\209\128\208\188\208\176\209\134\208\184\209\143 \208\189\208\176 |cff%s%s|r\n";
		InfoNoItem	= "\208\161\208\189\208\176\209\135\208\176\208\187\208\176 \208\189\208\176\208\178\208\181\208\180\208\184\209\130\208\181 \208\186\209\131\209\128\209\129\208\190\209\128 \208\188\209\139\209\136\208\186\208\184 \208\189\208\176 \208\191\209\128\208\181\208\180\208\188\208\181\209\130, \208\191\208\190\209\130\208\190\208\188 \208\189\208\176\208\182\208\188\208\184\209\130\208\181 \208\186\208\187\208\176\208\178\208\184\209\136\209\131 \208\176\208\186\209\130\208\184\208\178\208\176\209\134\208\184\208\184";
		InfoPlayerMade	= "\208\148\208\187\209\143 \208\184\208\183\208\179\208\190\209\130\208\190\208\178\208\187\208\181\208\189\208\184\208\181 \209\130\209\128\208\181\208\177\209\131\208\181\209\130\209\129\209\143 %s \209\131\209\128\208\190\208\178\208\181\208\189\209\140 %d\n";
		InfoQuestHeader	= "\208\152\209\129\208\191\208\190\208\187\209\140\208\183\209\131\208\181\209\130\209\129\209\143 \208\178 %d \208\183\208\176\208\180\208\176\208\189\208\184\209\143\209\133:";
		InfoQuestName	= "%d \208\180\208\187\209\143 \"%s\" (\209\131\209\128\208\190\208\178\208\181\208\189\209\140 %d)";
		InfoQuestSource	= "\208\148\208\176\208\189\208\189\209\139\208\181 \208\191\208\190 \208\183\208\176\208\180\208\176\208\189\208\184\209\142 \208\191\209\128\208\181\208\180\208\190\209\129\209\130\208\176\208\178\208\187\208\181\208\189\209\139:";
		InfoVendorHeader	= "\208\159\209\128\208\190\208\180\208\176\209\145\209\130\209\129\209\143 %d \209\130\208\190\209\128\208\179\208\190\208\178\209\134\208\181\208\188(\208\176\208\188\208\184):\n";
		InfoVendorName	= "%s";


		-- Section: Type Messages
		AdditAlcohol	= "\208\144\208\187\208\186\208\190\208\179\208\190\208\187\209\140";
		AdditBuff	= "Buff ";
		AdditDrink	= "\208\159\208\184\209\130\209\140\208\181\n";
		AdditFirework	= "\208\164\208\181\208\185\208\181\209\128\208\178\208\181\209\128\208\186\n";
		AdditFood	= "\208\149\208\180\208\176";
		AdditGiftwrap	= "\208\159\208\190\208\180\208\176\209\128\208\190\209\135\208\189\208\176\209\143 \209\131\208\191\208\176\208\186\208\190\208\178\208\186\208\176\n";
		AdditLure	= "\208\159\209\128\208\184\208\188\208\176\208\189\208\186\208\176";
		AdditPoison	= "\208\175\208\180";
		AdditPotion	= "\208\151\208\181\208\187\209\140\208\181\n";
		AdditRestorative	= "\208\146\208\190\209\129\209\129\209\130\208\176\208\189\208\176\208\178\208\187\208\184\208\178\208\176\209\142\209\137\208\181\208\181\n";
		AdditScroll	= "\208\161\208\178\208\184\209\130\208\190\208\186\n";
		SkillAlchemy	= "\208\144\208\187\209\133\208\184\208\188\208\184\209\143";
		SkillBlacksmithing	= "\208\154\209\131\208\183\208\189\208\181\209\135\208\189\208\190\208\181 \208\180\208\181\208\187\208\190";
		SkillCooking	= "\208\159\208\190\208\178\208\176\209\128\209\129\208\186\208\190\208\181 \208\180\208\181\208\187\208\190";
		SkillDruid	= "\208\151\208\176\208\186\208\187\208\184\208\189\208\176\208\189\208\184\209\143 \208\148\209\128\209\131\208\184\208\180\208\176(Druid)";
		SkillEnchanting	= "\208\151\208\176\209\135\208\176\209\128\208\190\208\178\208\176\208\189\208\184\208\181";
		SkillEngineering	= "\208\152\208\189\208\182\208\181\208\189\208\181\209\128\208\189\208\190\208\181 \208\180\208\181\208\187\208\190";
		SkillFirstAid	= "\208\159\208\181\209\128\208\178\208\176\209\143 \208\191\208\190\208\188\208\190\209\137\209\140";
		SkillLeatherworking	= "\208\146\209\139\208\180\208\181\208\187\208\186\208\176 \208\186\208\190\208\182\208\184";
		SkillMage	= "\208\151\208\176\208\186\208\187\208\184\208\189\208\176\208\189\208\184\209\143 \208\156\208\176\208\179\208\176(Mage)";
		SkillMining	= "\208\147\208\190\209\128\208\189\208\190\208\181 \208\180\208\181\208\187\208\190";
		SkillPaladin	= "\208\151\208\176\208\186\208\187\208\184\208\189\208\176\208\189\208\184\209\143 \208\159\208\176\208\187\208\176\208\180\208\184\208\189\208\176(Paladin)";
		SkillPriest	= "\208\151\208\176\208\186\208\187\208\184\208\189\208\176\208\189\208\184\209\143 \208\150\209\128\208\181\209\134\208\176(Priest)";
		SkillRogue	= "\208\151\208\176\208\186\208\187\208\184\208\189\208\176\208\189\208\184\209\143 \208\160\208\176\208\183\208\177\208\190\208\185\208\189\208\184\208\186\208\176(Rogue)";
		SkillShaman	= "\208\151\208\176\208\186\208\187\208\184\208\189\208\176\208\189\208\184\209\143 \208\168\208\176\208\188\208\176\208\189\208\176(Shaman)";
		SkillTailoring	= "\208\168\208\184\209\130\209\140\209\145";
		SkillWarlock	= "\208\151\208\176\208\186\208\187\208\184\208\189\208\176\208\189\208\184\209\143 \208\154\208\190\208\187\208\180\209\131\208\189\208\176(Warlock)";

	};

	trTR = {


		-- Section: Commands
		CmdClearAll	= "tum";
		CmdDefault	= "varsayilan";
		CmdDisable	= "iptal";
		CmdEmbed	= "ekle";
		CmdLocale	= "bolge";
		CmdOff	= "kapat";
		CmdOn	= "ac";
		CmdToggle	= "degistir";
		ShowMerchant	= "goster-tuccar";
		ShowQuest	= "goster-gorev";
		ShowStack	= "goster-grup";
		ShowUsage	= "goster-kullanim";
		ShowVendor	= "goster-satici";
		ShowVendorBuy	= "goster-satici-alis";
		ShowVendorSell	= "goster-satici-satis";


		-- Section: Generic Messages
		MesgNotLoaded	= "Informant y\195\131\194\188kl\195\131\194\188 de\195\132\197\184il. Daha fazla bilgi i\195\131\194\167in /informant yaz\195\132\194\177n\195\132\194\177z\195\131\194\167";
		Welcome	= "|c40ff50ffInformant'a ho\195\133\197\184geldiniz|r Informant'\195\132\194\177 bu ilk kullan\195\132\194\177\195\133\197\184\195\132\194\177n\195\132\194\177z oldu\195\132\197\184u i\195\131\194\167in, bu mesaj bu pencereyi g\195\131\194\182sterecek tu\195\133\197\184u |cffffffffGame Menu|r s\195\131\194\188n\195\131\194\188n |cffffffffKeybindings|r b\195\131\194\182lum\195\131\194\188nden se\195\131\194\167meniz gerekti\195\132\197\184ini bildirmek i\195\131\194\167in g\195\131\194\182z\195\131\194\188kmekte. Bunu tamamlaman\195\132\194\177zdan sonra \195\131\194\167antan\195\132\194\177zdaki cisimler hakk\195\132\194\177nda detayl\195\132\194\177 bilgi g\195\131\194\182rmek i\195\131\194\167in farenizi istedi\195\132\197\184iniz cismin \195\131\194\188zerine getirin ve belirlediginiz tu\195\133\197\184a bas\195\132\194\177n, o zaman bilgileri i\195\131\194\167eren bu pencere belirecek. O anda tu\195\133\197\184a tekrar bas\195\132\194\177n ya da \195\131\194\167er\195\131\194\167evenin kapa d\195\131\194\188\195\132\197\184mesine t\195\132\194\177klay\195\132\194\177n. Devam etmek i\195\131\194\167in \195\133\197\184imdi kapa d\195\131\194\188\195\132\197\184mesine t\195\132\194\177klay\195\132\194\177n\195\132\194\177z. ";


		-- Section: Tooltip Messages
		InfoQuestName	= "  %d for \"%s\" (level %d)";

	};

	zhCN = {


		-- Section: Commands
		CmdClearAll	= "all\229\133\168\233\131\168";
		CmdDefault	= "default\233\187\152\232\174\164";
		CmdDisable	= "disable\231\166\129\231\148\168";
		CmdEmbed	= "embed\229\181\140\229\133\165";
		CmdHelp	= "help\229\184\174\229\138\169";
		CmdLocale	= "locale\229\156\176\229\159\159\228\187\163\231\160\129";
		CmdOff	= "off\229\133\179";
		CmdOn	= "on\229\188\128";
		CmdToggle	= "toggle\229\188\128\229\133\179\232\189\172\230\141\162";
		OptLocale	= "<\229\156\176\229\159\159\228\187\163\231\160\129>";
		ShowIcon	= "show-icon\230\152\190\231\164\186\229\155\190\230\160\135";
		ShowMerchant	= "show-merchant\230\152\190\231\164\186\232\180\167\229\149\134";
		ShowQuest	= "show-quest\230\152\190\231\164\186\228\187\187\229\138\161";
		ShowStack	= "show-stack\230\152\190\231\164\186\229\160\134\229\143\160";
		ShowUsage	= "show-usage\230\152\190\231\164\186\231\148\168\233\128\148";
		ShowVendor	= "show-vendor\230\152\190\231\164\186\229\149\134\232\180\169";
		ShowVendorBuy	= "show-vendor-buy\230\152\190\231\164\186\229\149\134\232\180\169\230\148\182\232\180\173";
		ShowVendorSell	= "show-vendor-sell\230\152\190\231\164\186\229\149\134\232\180\169\229\135\186\229\148\174";


		-- Section: Generic Messages
		MesgNotLoaded	= "Informant\230\156\170\229\138\160\232\189\189\227\128\130\233\148\174\229\133\165/informant\230\156\137\230\155\180\229\164\154\228\191\161\230\129\175\227\128\130";
		StatOff	= "\228\184\141\230\152\190\231\164\186\228\187\187\228\189\149\231\137\169\229\147\129\228\191\161\230\129\175\227\128\130";
		StatOn	= "\230\152\190\231\164\186\232\174\190\229\174\154\231\154\132\231\137\169\229\147\129\228\191\161\230\129\175\227\128\130";
		Welcome	= "|c40ff50ff\230\172\162\232\191\142\228\189\191\231\148\168Informant|r \229\155\160\228\184\186\232\191\153\230\152\175\230\130\168\231\172\172\228\184\128\230\172\161\228\189\191\231\148\168Informant\239\188\140\232\191\153\228\184\170\228\191\161\230\129\175\232\174\169\230\130\168\231\159\165\233\129\147\229\191\133\233\161\187\229\156\168|cffffffff\230\184\184\230\136\143\232\143\156\229\141\149|r\231\154\132|cffffffff\230\140\137\233\148\174\232\174\190\231\189\174|r\229\140\186\229\159\159\232\174\190\231\189\174\228\184\128\228\184\170\229\191\171\230\141\183\233\148\174\230\157\165\230\152\190\231\164\186\232\191\153\228\184\170\231\170\151\229\143\163\239\188\140\231\132\182\229\144\142\230\130\168\229\176\177\232\131\189\233\128\154\232\191\135\231\167\187\229\138\168\233\188\160\230\160\135\229\136\176\231\137\169\229\147\129\228\184\138\230\157\165\230\159\165\231\156\139\231\137\169\229\147\129\231\154\132\233\171\152\231\186\167\228\191\161\230\129\175\239\188\140\230\140\137\230\130\168\232\174\190\231\189\174\231\154\132\229\191\171\230\141\183\233\148\174\239\188\140\232\191\153\228\184\170\231\170\151\229\143\163\229\176\134\228\188\154\230\152\190\231\164\186\231\137\169\229\147\129\228\191\161\230\129\175\227\128\130\229\134\141\230\140\137\228\184\128\230\172\161\229\191\171\230\141\183\233\148\174\230\136\150\230\140\137\229\133\179\233\151\173\230\140\137\233\146\174\229\176\134\228\188\154\229\133\179\233\151\173\232\191\153\228\184\170\231\170\151\229\143\163\227\128\130\230\140\137\229\133\179\233\151\173\230\140\137\233\146\174\231\187\167\231\187\173\227\128\130";


		-- Section: Help Text
		GuiDefaultAll	= "\233\135\141\231\189\174\229\133\168\233\131\168Informant\233\128\137\233\161\185\227\128\130";
		GuiDefaultAllButton	= "\233\135\141\231\189\174\229\133\168\233\131\168";
		GuiDefaultAllHelp	= "\231\130\185\230\173\164\233\135\141\231\189\174\229\133\168\233\131\168Informant\233\128\137\233\161\185\229\136\176\229\133\182\233\187\152\232\174\164\229\128\188\227\128\130\232\173\166\229\145\138\239\188\154\230\173\164\230\147\141\228\189\156\228\184\141\229\143\175\230\129\162\229\164\141\227\128\130";
		GuiDefaultOption	= "\233\135\141\231\189\174\230\173\164\232\174\190\231\189\174\227\128\130";
		GuiEmbed	= "\229\181\140\229\133\165\228\191\161\230\129\175\229\136\176\230\184\184\230\136\143\229\134\133\230\143\144\231\164\186\228\184\173\227\128\130";
		GuiEmbedHeader	= "\229\181\140\229\133\165";
		GuiInfoHeader	= "\232\161\165\229\133\133\228\191\161\230\129\175";
		GuiInfoHelp	= "\230\142\167\229\136\182\228\189\149\231\167\141\232\161\165\229\133\133\228\191\161\230\129\175\230\152\190\231\164\186\229\156\168\230\143\144\231\164\186\228\184\173\227\128\130";
		GuiInfoIcon	= "\230\152\190\231\164\186\232\180\162\231\155\174\229\155\190\230\160\135\227\128\130";
		GuiInfoMerchant	= "\230\152\190\231\164\186\232\180\167\229\149\134\227\128\130";
		GuiInfoQuest	= "\230\152\190\231\164\186\228\187\187\229\138\161\228\191\161\230\129\175\227\128\130";
		GuiInfoStack	= "\230\152\190\231\164\186\229\160\134\229\143\160\230\149\176\233\135\143\227\128\130";
		GuiInfoUsage	= "\230\152\190\231\164\186\231\148\168\233\128\148\228\191\161\230\129\175\227\128\130";
		GuiLocale	= "\232\174\190\231\189\174\229\156\176\229\159\159\228\187\163\231\160\129\228\184\186";
		GuiMainEnable	= "\229\144\175\231\148\168Informant\227\128\130";
		GuiMainHelp	= "\229\140\133\229\144\171\230\143\146\228\187\182 - Informant\231\154\132\232\174\190\231\189\174\227\128\130\229\174\131\231\148\168\228\186\142\230\152\190\231\164\186\232\175\166\231\187\134\231\137\169\229\147\129\228\191\161\230\129\175\227\128\130";
		GuiOtherHeader	= "\229\133\182\228\187\150\233\128\137\233\161\185";
		GuiOtherHelp	= "Informant\230\157\130\233\161\185";
		GuiReloadui	= "\233\135\141\230\150\176\229\138\160\232\189\189\231\148\168\230\136\183\231\149\140\233\157\162\227\128\130";
		GuiReloaduiButton	= "\233\135\141\232\189\189UI";
		GuiReloaduiFeedback	= "\231\142\176\229\156\168\230\173\163\233\135\141\230\150\176\229\138\160\232\189\189\233\173\148\229\133\189\231\148\168\230\136\183\231\149\140\233\157\162\227\128\130";
		GuiReloaduiHelp	= "\229\156\168\230\148\185\229\143\152\229\156\176\229\159\159\228\187\163\231\160\129\229\144\142\231\130\185\230\173\164\233\135\141\230\150\176\229\138\160\232\189\189\233\173\148\229\133\189\231\148\168\230\136\183\231\149\140\233\157\162\228\189\191\230\173\164\233\133\141\231\189\174\229\177\143\229\185\149\228\184\173\231\154\132\232\175\173\232\168\128\229\140\185\233\133\141\233\128\137\230\139\169\227\128\130\230\179\168\230\132\143\239\188\154\230\173\164\230\147\141\228\189\156\229\143\175\232\131\189\232\128\151\230\151\182\229\135\160\229\136\134\233\146\159\227\128\130";
		GuiVendor	= "\230\152\190\231\164\186\229\149\134\232\180\169\228\187\183\230\160\188\227\128\130";
		GuiVendorBuy	= "\230\152\190\231\164\186\229\149\134\232\180\169\230\148\182\232\180\173\228\187\183\227\128\130";
		GuiVendorHeader	= "\229\149\134\232\180\169\228\187\183\230\160\188\227\128\130";
		GuiVendorHelp	= "\229\133\179\228\186\142\233\157\158\231\142\169\229\174\182\232\167\146\232\137\178\228\185\176\229\141\150\228\187\183\230\160\188\231\154\132\233\128\137\233\161\185\227\128\130";
		GuiVendorSell	= "\230\152\190\231\164\186\229\149\134\232\180\169\229\135\186\229\148\174\228\187\183\227\128\130";
		HelpDefault	= "\233\135\141\231\189\174\228\184\128\228\184\170Informant\233\128\137\233\161\185\228\184\186\229\133\182\233\187\152\232\174\164\229\128\188\239\188\140\228\189\160\228\185\159\229\143\175\228\187\165\228\189\191\231\148\168\"all\"\230\157\165\233\135\141\231\189\174\230\137\128\230\156\137\233\128\137\233\161\185\228\184\186\229\133\182\233\187\152\232\174\164\229\128\188\227\128\130";
		HelpDisable	= "\233\152\187\230\173\162Informant\229\156\168\228\184\139\230\172\161\231\153\187\229\189\149\230\151\182\232\135\170\229\138\168\229\138\160\232\189\189\227\128\130";
		HelpEmbed	= "\229\181\140\229\133\165\230\150\135\229\173\151\232\135\179\229\142\159\229\167\139\230\184\184\230\136\143\230\143\144\231\164\186(\230\179\168\230\132\143\239\188\154\230\173\164\233\161\185\233\128\137\230\139\169\230\151\182\230\159\144\228\186\155\229\138\159\232\131\189\232\162\171\231\166\129\231\148\168)\227\128\130";
		HelpIcon	= "\233\128\137\230\139\169\230\152\175\229\144\166\230\152\190\231\164\186\231\137\169\229\147\129\231\154\132\232\180\162\231\155\174\229\155\190\230\160\135\227\128\130";
		HelpLocale	= "\230\148\185\229\143\152\231\148\168\228\186\142\230\152\190\231\164\186Informant\232\174\175\230\129\175\231\154\132\229\156\176\229\159\159\228\187\163\231\160\129\227\128\130";
		HelpMerchant	= "\233\128\137\230\139\169\230\152\175\229\144\166\230\152\190\231\164\186\228\190\155\229\186\148\231\137\169\229\147\129\231\154\132\232\180\167\229\149\134\227\128\130";
		HelpOnoff	= "\230\137\147\229\188\128/\229\133\179\233\151\173\228\191\161\230\129\175\230\149\176\230\141\174\230\152\190\231\164\186\227\128\130";
		HelpQuest	= "\233\128\137\230\139\169\230\152\175\229\144\166\230\152\190\231\164\186\228\187\187\229\138\161\231\137\169\229\147\129\231\154\132\231\148\168\233\128\148\227\128\130";
		HelpStack	= "\233\128\137\230\139\169\230\152\175\229\144\166\230\152\190\231\164\186\229\143\175\229\160\134\229\143\160\230\149\176\233\135\143\227\128\130";
		HelpUsage	= "\233\128\137\230\139\169\230\152\175\229\144\166\230\152\190\231\164\186\229\149\134\228\184\154\230\138\128\232\131\189\231\137\169\229\147\129\231\154\132\231\148\168\233\128\148\227\128\130";
		HelpVendor	= "\233\128\137\230\139\169\230\152\175\229\144\166\230\152\190\231\164\186\229\149\134\232\180\169\228\187\183\230\160\188\227\128\130";
		HelpVendorBuy	= "\233\128\137\230\139\169\230\152\175\229\144\166\230\152\190\231\164\186\229\149\134\232\180\169\230\148\182\232\180\173\228\187\183\230\160\188(\233\156\128\232\166\129show-vendor=on)\227\128\130";
		HelpVendorSell	= "\233\128\137\230\139\169\230\152\175\229\144\166\230\152\190\231\164\186\229\149\134\232\180\169\233\148\128\229\148\174\228\187\183\230\160\188(\233\156\128\232\166\129show-vendor=on)\227\128\130";


		-- Section: Keybinding Text
		BindingHeader	= "Informant";
		BindingTitle	= "\229\188\128\229\133\179\232\189\172\230\141\162\228\191\161\230\129\175\231\170\151\229\143\163";


		-- Section: Tooltip Messages
		FrameTitle	= "Informant\231\137\169\229\147\129\228\191\161\230\129\175";
		FrmtActDefault	= "Informant\231\154\132%s\233\128\137\233\161\185\232\162\171\233\135\141\231\189\174\228\184\186\229\133\182\233\187\152\232\174\164\229\128\188\227\128\130";
		FrmtActDefaultall	= "\230\137\128\230\156\137Informant\233\128\137\233\161\185\232\162\171\233\135\141\231\189\174\228\184\186\233\187\152\232\174\164\229\128\188\227\128\130";
		FrmtActDisable	= "\228\184\141\230\152\190\231\164\186\231\137\169\229\147\129\231\154\132%s\230\149\176\230\141\174\227\128\130";
		FrmtActEnable	= "\230\152\190\231\164\186\231\137\169\229\147\129\231\154\132%s\230\149\176\230\141\174\227\128\130";
		FrmtActEnabledOn	= "\230\152\190\231\164\186\231\137\169\229\147\129\231\154\132%s\228\186\142%s\227\128\130";
		FrmtActSet	= "\232\174\190\231\189\174%s\228\184\186'%s'\227\128\130";
		FrmtActUnknown	= "\230\156\170\231\159\165\229\145\189\228\187\164\239\188\154'%s'\227\128\130";
		FrmtInfoBuy	= "\232\180\173\228\186\142\229\149\134\232\180\169";
		FrmtInfoBuymult	= "\228\185\176\229\133\165%d\228\187\182(\230\175\143\228\187\182%s)";
		FrmtInfoClass	= "\231\177\187\229\158\139:%s";
		FrmtInfoMerchants	= "\230\156\137%d\228\184\170\232\180\167\229\149\134\229\135\186\229\148\174";
		FrmtInfoQuest	= "%d\228\184\170\228\187\187\229\138\161\228\189\191\231\148\168\231\154\132\228\187\187\229\138\161\231\137\169\229\147\129";
		FrmtInfoSell	= "\229\148\174\228\186\142\229\149\134\232\180\169";
		FrmtInfoSellmult	= "\229\141\150\229\135\186%d\228\187\182(\230\175\143\228\187\182%s)";
		FrmtInfoStx	= "\230\175\143\231\187\132\229\160\134\229\143\160%d";
		FrmtInfoUse	= "\231\148\168\233\128\148:%s";
		FrmtUnknownLocale	= "\230\140\135\229\174\154\229\156\176\229\159\159\228\187\163\231\160\129('%s')\230\156\170\231\159\165\227\128\130\230\156\137\230\149\136\231\154\132\229\156\176\229\159\159\228\187\163\231\160\129\228\184\186\239\188\154";
		FrmtWelcome	= "Informant v%s \229\183\178\229\138\160\232\189\189\239\188\129";
		InfoHeader	= "|cff%s%s|r\231\154\132\228\191\161\230\129\175";
		InfoNoItem	= "\229\191\133\233\161\187\229\133\136\231\167\187\229\136\176\228\184\128\228\184\170\231\137\169\229\147\129\228\184\138\239\188\140\231\132\182\229\144\142\230\140\137\230\191\128\230\180\187\233\148\174\227\128\130";
		InfoPlayerMade	= "\231\148\177\231\173\137\231\186\167%d\231\154\132%s\229\136\182\228\189\156\227\128\130";
		InfoQuestHeader	= "\229\156\168%d\228\184\170\228\187\187\229\138\161\228\184\173\228\189\191\231\148\168\239\188\154";
		InfoQuestName	= "%d\228\184\186\"%s\"(\231\173\137\231\186\167%d)";
		InfoQuestSource	= "\228\187\187\229\138\161\230\149\176\230\141\174\230\143\144\228\190\155\232\128\133\230\152\175";
		InfoVendorHeader	= "%d\228\184\170\232\180\167\229\149\134\229\135\186\229\148\174\239\188\154";
		InfoVendorName	= "%s";


		-- Section: Type Messages
		AdditAlcohol	= "\233\133\146\231\178\190\233\165\174\230\150\153";
		AdditBuff	= "\229\162\158\231\155\138";
		AdditDrink	= "\233\165\174\230\150\153";
		AdditFirework	= "\231\132\176\231\129\171";
		AdditFood	= "\233\163\159\231\137\169";
		AdditGiftwrap	= "\231\164\188\229\147\129\229\140\133\232\163\133\231\186\184";
		AdditLure	= "\232\175\177\233\165\181";
		AdditPoison	= "\230\175\146\232\141\175";
		AdditPotion	= "\232\141\175\230\176\180";
		AdditRestorative	= "\230\187\139\232\161\165\229\137\130";
		AdditScroll	= "\229\141\183\232\189\180";
		SkillAlchemy	= "\231\130\188\233\135\145\230\156\175";
		SkillBlacksmithing	= "\233\148\187\233\128\160";
		SkillCooking	= "\231\131\185\233\165\170";
		SkillDruid	= "\229\190\183\233\178\129\228\188\138\233\173\148\230\179\149";
		SkillEnchanting	= "\233\153\132\233\173\148";
		SkillEngineering	= "\229\183\165\231\168\139\229\173\166";
		SkillFirstAid	= "\230\128\165\230\149\145";
		SkillLeatherworking	= "\229\136\182\231\154\174";
		SkillMage	= "\230\179\149\229\184\136\233\173\148\230\179\149";
		SkillMining	= "\233\135\135\231\159\191";
		SkillPaladin	= "\229\156\163\233\170\145\229\163\171\233\173\148\230\179\149";
		SkillPriest	= "\231\137\167\229\184\136\233\173\148\230\179\149";
		SkillRogue	= "\231\155\151\232\180\188\230\138\128\232\131\189";
		SkillShaman	= "\232\144\168\230\187\161\231\165\173\229\143\184\233\173\148\230\179\149";
		SkillTailoring	= "\232\163\129\231\188\157";
		SkillWarlock	= "\230\156\175\229\163\171\233\173\148\230\179\149";

	};

	zhTW = {


		-- Section: Commands
		CmdClearAll	= "all";
		CmdDefault	= "default";
		CmdDisable	= "disable";
		CmdEmbed	= "embed";
		CmdHelp	= "help";
		CmdLocale	= "locale";
		CmdOff	= "off";
		CmdOn	= "on";
		CmdToggle	= "toggle";
		OptLocale	= "<\232\170\158\232\168\128>";
		ShowIcon	= "show-icon";
		ShowMerchant	= "show-merchant";
		ShowQuest	= "show-quest";
		ShowStack	= "show-stack";
		ShowUsage	= "show-usage";
		ShowVendor	= "show-vendor";
		ShowVendorBuy	= "show-vendor-buy";
		ShowVendorSell	= "show-vendor-sell";


		-- Section: Generic Messages
		MesgNotLoaded	= "Informant \229\176\154\230\156\170\232\188\137\229\133\165\227\128\130\232\171\139\232\188\184\229\133\165 /informant \229\143\150\229\190\151\232\170\170\230\152\142\227\128\130";
		StatOff	= "\228\184\141\233\161\175\231\164\186\228\187\187\228\189\149\231\137\169\229\147\129\232\179\135\232\168\138";
		StatOn	= "\233\161\175\231\164\186\232\168\173\229\174\154\229\165\189\231\154\132\231\137\169\229\147\129\232\179\135\232\168\138";
		Welcome	= "|c40ff50ff\230\173\161\232\191\142\228\189\191\231\148\168Informant|r \233\128\153\230\152\175\228\189\160\231\172\172\228\184\128\230\172\161\228\189\191\231\148\168Informant\239\188\140\228\189\160\229\191\133\233\160\136\229\156\168|cffffffff\233\129\138\230\136\178\233\129\184\233\160\133|r \228\184\173\231\154\132|cffffffff\230\140\137\233\141\181\232\168\173\229\174\154|r\232\163\161\232\168\173\229\174\154\228\184\128\229\128\139\231\134\177\233\141\181\230\137\141\232\131\189\229\134\141\230\172\161\233\161\175\231\164\186\230\156\172\232\168\173\229\174\154\232\166\150\231\170\151\227\128\130 \231\143\190\229\156\168\233\150\139\229\167\139\239\188\140Informant\230\156\131\229\156\168\228\189\160\230\138\138\230\187\145\233\188\160\230\140\135\229\136\176\228\187\187\228\189\149\228\184\128\229\128\139\231\137\169\229\147\129\228\184\138\230\153\130\239\188\140\230\138\138\232\169\178\231\137\169\229\147\129\231\154\132\233\128\178\233\154\142\232\179\135\232\168\138\233\161\175\231\164\186\229\135\186\228\190\134\227\128\130 \232\139\165\228\189\160\230\131\179\232\166\129\232\169\179\231\180\176\230\170\162\232\166\150\232\169\178\231\137\169\229\147\129\231\154\132\230\137\128\230\156\137\233\128\178\233\154\142\232\179\135\232\168\138\239\188\140\229\143\170\232\166\129\229\144\140\230\153\130\230\140\137\228\184\139\228\189\160\229\156\168|cffffffff\230\140\137\233\141\181\232\168\173\229\174\154|r\232\163\161\232\168\173\229\174\154\231\154\132\231\134\177\233\141\181\229\141\179\229\143\175\227\128\130 \233\187\158\230\147\138\227\128\140\233\151\156\233\150\137\227\128\141\228\187\165\233\151\156\233\150\137\230\156\172\232\166\150\231\170\151\228\184\166\231\185\188\231\186\140\233\129\138\230\136\178\227\128\130";


		-- Section: Help Text
		GuiDefaultAll	= "\233\135\141\232\168\173\230\137\128\230\156\137Informant\233\129\184\233\160\133";
		GuiDefaultAllButton	= "\233\135\141\232\168\173\229\133\168\233\131\168";
		GuiDefaultAllHelp	= "\233\187\158\233\128\153\232\163\161\230\138\138\230\137\128\230\156\137informant\233\129\184\233\160\133\230\148\185\229\155\158\233\160\144\232\168\173\229\128\188\227\128\130\232\173\166\229\145\138: \230\173\164\230\147\141\228\189\156\228\184\141\232\131\189\229\190\169\229\142\159\239\188\129";
		GuiDefaultOption	= "\233\135\141\232\168\173\233\128\153\229\128\139\232\168\173\229\174\154";
		GuiEmbed	= "\230\138\138\232\179\135\230\150\153\229\181\140\229\133\165\233\129\138\230\136\178\229\133\167\231\154\132\232\179\135\232\168\138\231\170\151";
		GuiEmbedHeader	= "\229\181\140\229\133\165";
		GuiInfoHeader	= "\233\161\141\229\164\150\232\179\135\232\168\138";
		GuiInfoHelp	= "\230\142\167\229\136\182\229\147\170\229\128\139\233\161\141\229\164\150\231\154\132\232\179\135\232\168\138\232\166\129\233\161\175\231\164\186\229\156\168\230\143\144\231\164\186\232\168\138\230\129\175\228\184\138";
		GuiInfoIcon	= "\233\161\175\231\164\186\229\173\152\232\178\168\229\131\143 ";
		GuiInfoMerchant	= "\233\161\175\231\164\186\229\149\134\228\186\186";
		GuiInfoQuest	= "\233\161\175\231\164\186\228\187\187\229\139\153\232\179\135\232\168\138";
		GuiInfoStack	= "\233\161\175\231\164\186\229\150\174\230\160\188\229\174\185\231\180\141\230\149\184\233\135\143";
		GuiInfoUsage	= "\233\161\175\231\164\186\228\189\191\231\148\168\232\179\135\232\168\138";
		GuiLocale	= "\232\168\173\229\174\154\232\170\158\232\168\128\231\130\186";
		GuiMainEnable	= "\229\149\159\231\148\168Informant";
		GuiMainHelp	= "\229\140\133\230\139\172Informant\231\154\132\232\168\173\229\174\154\239\188\140Informant\230\152\175\228\184\128\229\128\139\229\143\175\228\187\165\233\161\175\231\164\186\231\137\169\229\147\129\233\128\178\233\154\142\232\179\135\232\168\138\231\154\132AddOn\227\128\130";
		GuiOtherHeader	= "\229\133\182\228\187\150\233\129\184\233\160\133";
		GuiOtherHelp	= "Informant\233\155\156\233\160\133";
		GuiReloadui	= "\233\135\141\230\150\176\232\188\137\229\133\165\231\148\168\230\136\182\231\149\140\233\157\162";
		GuiReloaduiButton	= "\233\135\141\230\150\176\232\188\137\229\133\165\230\143\146\228\187\182";
		GuiReloaduiFeedback	= "\230\173\163\229\156\168\232\188\137\229\133\165WoW UI";
		GuiReloaduiHelp	= "\228\189\160\229\143\175\228\187\165\229\156\168\230\148\185\232\174\138\232\170\158\231\179\187\229\190\140\233\187\158\230\147\138\233\128\153\232\163\161\239\188\140\233\135\141\230\150\176\232\188\137\229\133\165WOW UI\227\128\130\233\128\153\229\143\175\232\131\189\230\156\131\232\166\129\229\164\154\232\138\177\228\184\128\233\187\158\230\153\130\233\150\147\227\128\130";
		GuiVendor	= "\233\161\175\231\164\186\229\149\134\229\186\151\229\131\185\230\160\188";
		GuiVendorBuy	= "\233\161\175\231\164\186\229\149\134\229\186\151\232\179\188\232\178\183\229\131\185";
		GuiVendorHeader	= "\229\149\134\229\186\151\229\131\185\230\160\188";
		GuiVendorHelp	= "\229\149\134\229\186\151\232\179\188\232\178\183/\229\148\174\229\135\186\231\154\132\229\131\185\230\160\188\233\129\184\233\160\133\227\128\130";
		GuiVendorSell	= "\233\161\175\231\164\186\229\149\134\229\186\151\232\179\163\229\135\186\229\131\185";
		HelpDefault	= "\232\168\173\229\174\154\230\159\144\229\128\139informant\233\129\184\233\160\133\229\155\158\233\160\144\232\168\173\229\128\188\227\128\130\231\148\168\"all\"\228\190\134\233\135\141\231\189\174\229\133\168\233\131\168\233\129\184\233\160\133\227\128\130";
		HelpDisable	= "\228\189\191informant\228\184\141\229\134\141\232\135\170\229\139\149\230\150\188\231\153\187\229\133\165\230\153\130\232\188\137\229\133\165";
		HelpEmbed	= "\229\176\135\230\150\135\229\173\151\229\181\140\229\133\165\229\156\168\233\129\138\230\136\178\229\159\186\230\156\172\230\143\144\231\164\186\230\161\134\228\184\173(\230\179\168\230\132\143\239\188\154\233\128\153\230\156\131\228\189\191\230\159\144\228\186\155\229\138\159\232\131\189\231\132\161\230\179\149\228\189\191\231\148\168)";
		HelpIcon	= "\233\129\184\230\147\135\230\152\175\229\144\166\233\161\175\231\164\186\233\160\133\231\155\174\231\154\132\229\173\152\232\178\168\229\131\143\n";
		HelpLocale	= "\230\148\185\232\174\138\233\161\175\231\164\186Informant\232\168\138\230\129\175\231\154\132\232\170\158\231\179\187";
		HelpMerchant	= "\233\129\184\230\147\135\230\152\175\229\144\166\233\161\175\231\164\186\232\179\163\233\128\153\233\160\133\231\137\169\229\147\129\231\154\132\229\149\134\228\186\186";
		HelpOnoff	= "\233\161\175\231\164\186\233\128\153\229\128\139\232\179\135\232\168\138on/off";
		HelpQuest	= "\233\129\184\230\147\135\230\152\175\229\144\166\233\161\175\231\164\186\228\187\187\229\139\153\231\137\169\229\147\129";
		HelpStack	= "\233\129\184\230\147\135\230\152\175\229\144\166\233\161\175\231\164\186\230\173\164\231\137\169\229\147\129\230\156\128\229\164\167\229\174\185\231\180\141\230\149\184\233\135\143";
		HelpUsage	= "\233\129\184\230\147\135\230\152\175\229\144\166\233\161\175\231\164\186\228\186\164\230\152\147\230\138\128\232\131\189\231\154\132\231\137\169\229\147\129";
		HelpVendor	= "\233\129\184\230\147\135\230\152\175\229\144\166\232\166\129\233\161\175\231\164\186\231\137\169\229\147\129\229\131\185\230\160\188";
		HelpVendorBuy	= "\233\129\184\230\147\135\230\152\175\229\144\166\233\161\175\231\164\186\231\137\169\229\147\129\229\156\168\229\149\134\229\186\151\229\148\174\229\135\186\231\154\132\229\131\185\230\160\188 (\233\156\128\232\166\129\233\150\139\229\149\159\233\161\175\231\164\186\231\137\169\229\147\129\229\131\185\230\160\188) ";
		HelpVendorSell	= "\233\129\184\230\147\135\230\152\175\229\144\166\233\161\175\231\164\186\231\137\169\229\147\129\229\156\168\229\149\134\229\186\151\230\148\182\232\179\188\231\154\132\229\131\185\230\160\188 (\233\156\128\232\166\129\233\150\139\229\149\159\233\161\175\231\164\186\231\137\169\229\147\129\229\131\185\230\160\188)";


		-- Section: Keybinding Text
		BindingHeader	= "\231\137\169\229\147\129\229\138\169\230\137\139";
		BindingTitle	= "\232\168\173\231\189\174\228\191\161\230\129\175\231\170\151\229\143\163\233\161\175\231\164\186\231\134\177\233\141\181";


		-- Section: Tooltip Messages
		FrameTitle	= "Informant \231\137\169\229\147\129\232\179\135\230\150\153";
		FrmtActDefault	= "%s \233\160\133\232\168\173\231\189\174\232\162\171\229\155\158\232\166\134\230\136\144\233\160\144\232\168\173\229\128\188";
		FrmtActDefaultall	= "\230\137\128\230\156\137informant\233\129\184\233\160\133\229\183\178\229\155\158\232\166\134\230\136\144\233\160\144\232\168\173\229\128\188";
		FrmtActDisable	= "\228\184\141\229\134\141\233\161\175\231\164\186\231\137\169\229\147\129\231\154\132%s\232\179\135\232\168\138";
		FrmtActEnable	= "\233\161\175\231\164\186\231\137\169\229\147\129\231\154\132%s\232\179\135\232\168\138";
		FrmtActEnabledOn	= "\233\161\175\231\164\186\231\137\169\229\147\129\231\154\132%s on %s";
		FrmtActSet	= "\232\168\173\231\189\174 %s \231\130\186 '%s'";
		FrmtActUnknown	= "\230\156\170\231\159\165\231\154\132\230\140\135\228\187\164: '%s'";
		FrmtInfoBuy	= "\229\149\134\229\186\151\229\148\174\229\135\186\229\131\185";
		FrmtInfoBuymult	= "\232\178\183\229\133\165 %d (\229\150\174\229\131\185 %s)";
		FrmtInfoClass	= "\233\161\158\229\136\165: %s";
		FrmtInfoMerchants	= "\230\173\164\231\137\169\229\147\129\229\156\168 %d \229\128\139\229\149\134\229\186\151\233\138\183\229\148\174";
		FrmtInfoQuest	= "%d \228\187\187\229\139\153\231\154\132\228\187\187\229\139\153\231\137\169\229\147\129";
		FrmtInfoSell	= "\229\149\134\229\186\151\230\148\182\232\179\188\229\131\185";
		FrmtInfoSellmult	= "\232\179\163\229\135\186 %d (\229\150\174\229\131\185 %s)";
		FrmtInfoStx	= "\229\150\174\230\160\188\229\174\185\231\180\141%d\229\128\139";
		FrmtInfoUse	= "\231\148\168\230\150\188: %s";
		FrmtUnknownLocale	= "\228\189\160\230\140\135\229\174\154\231\154\132\232\170\158\231\179\187 ('%s') \231\132\161\230\149\136. \229\143\175\231\148\168\231\154\132\232\170\158\231\179\187\231\130\186:";
		FrmtWelcome	= "Informant v%s \229\183\178\232\188\137\229\133\165";
		InfoHeader	= "|cff%s%s|r \231\154\132\232\169\179\231\180\176\228\191\161\230\129\175";
		InfoNoItem	= "\228\189\160\229\191\133\233\160\136\229\133\136\230\138\138\230\184\184\230\168\153\231\167\187\229\136\176\230\159\144\229\128\139\231\137\169\229\147\129\228\184\138\233\157\162\239\188\140\231\132\182\229\190\140\228\189\191\231\148\168\232\169\178\233\160\133\231\137\169\229\147\129";
		InfoPlayerMade	= "\231\148\177\231\173\137\231\180\154%d\231\154\132%s\232\163\189\233\128\160";
		InfoQuestHeader	= "%d\233\160\133\228\187\187\229\139\153\228\184\173\228\189\191\231\148\168:";
		InfoQuestName	= "  %d for \"%s\" (level %d)";
		InfoQuestSource	= "\228\187\187\229\139\153\232\179\135\230\150\153\230\143\144\228\190\155\232\128\133";
		InfoVendorHeader	= "\230\156\137%d\229\128\139\229\149\134\228\186\186\232\178\169\229\148\174:";
		InfoVendorName	= "%s";


		-- Section: Type Messages
		AdditAlcohol	= "\233\133\146";
		AdditBuff	= "\229\162\158\231\155\138";
		AdditDrink	= "\233\163\178\230\150\153";
		AdditFirework	= "\231\133\153\231\129\171";
		AdditFood	= "\233\163\159\231\137\169";
		AdditGiftwrap	= "\231\166\174\229\147\129\229\140\133\232\163\157\231\180\153";
		AdditLure	= "\233\173\154\233\164\140";
		AdditPoison	= "\230\175\146\232\151\165";
		AdditPotion	= "\232\151\165\230\176\180";
		AdditRestorative	= "\230\187\139\232\163\156\229\138\145";
		AdditScroll	= "\230\141\178\232\187\184";
		SkillAlchemy	= "\231\133\137\233\135\145";
		SkillBlacksmithing	= "\233\141\155\233\128\160";
		SkillCooking	= "\231\131\185\233\163\170";
		SkillDruid	= "\229\190\183\233\173\175\228\188\138\230\179\149\232\161\147";
		SkillEnchanting	= "\233\153\132\233\173\148";
		SkillEngineering	= "\229\183\165\231\168\139\229\173\184";
		SkillFirstAid	= "\230\128\165\230\149\145";
		SkillLeatherworking	= "\232\163\189\231\154\174";
		SkillMage	= "\230\179\149\229\184\171\230\179\149\232\161\147";
		SkillMining	= "\230\142\161\231\164\166";
		SkillPaladin	= "\232\129\150\233\168\142\230\179\149\232\161\147";
		SkillPriest	= "\231\137\167\229\184\171\230\179\149\232\161\147";
		SkillRogue	= "\231\155\156\232\179\138\230\138\128\232\131\189";
		SkillShaman	= "\232\150\169\230\187\191\230\179\149\232\161\147";
		SkillTailoring	= "\232\163\129\231\184\171";
		SkillWarlock	= "\232\161\147\229\163\171\230\179\149\232\161\147";

	};

	nlNL = {


		-- Section: Commands
		OptLocale	= "<taal>";


		-- Section: Generic Messages
		MesgNotLoaded	= "Informant is niet geladen. Type /informant voor meer info.";
		StatOff	= "Item informatie wordt niet meer weergegeven";
		StatOn	= "Ingestelde item informatie worden weergegeven";
		Welcome	= "|c40ff50ffWelkom bij Informant|r Aangezien dit de eerste keer is dat Informant gebruikt wordt, verschijnt deze melding om te laten weten dat er een toets ingesteld moet worden in het |cffffffffKeybinding-sectie|r van het |cffffffffGame Menu|r voor dit scherm. Vanaf dat moment dient, om uitgebreide informatie over je items in je inventaris te zien, de muis bewogen te worden over het item waarover informatie benodigd is en wanneer dan op de ingestelde toets gedrukt wordt zal een scherm verschijnen met informatie over dat item. Op dat moment, druk de toets nogmaals, of klik op Close. Klik op op de Close-toets om verder te gaan. ";


		-- Section: Help Text
		GuiDefaultAll	= "Herstel alle Informant opties";
		GuiDefaultAllButton	= "Herstel alles";
		GuiDefaultAllHelp	= "Klik hier om alle Informant opties terug te zetten op hun standaard waarden. WAARSCHUWING: Deze aktie is onomkeerbaar!";
		GuiDefaultOption	= "Herstel deze instelling";
		GuiEmbed	= "Integreer gegevens in de in-game tooltip";
		GuiEmbedHeader	= "Integreer";
		GuiInfoHeader	= "Extra informatie";
		GuiInfoHelp	= "Controleert welke extra informatie getoond wordt in tooltips";
		GuiInfoIcon	= "Toon inventaris ikoon";
		GuiInfoMerchant	= "Toon verkopers";
		GuiInfoQuest	= "Toon quest informatie";
		GuiInfoStack	= "Toon stapelgroottes";
		GuiInfoUsage	= "Toon gebruiksinformatie";
		GuiLocale	= "Zet taal op";
		GuiMainEnable	= "Zet Informant aan";
		GuiMainHelp	= "Bevat instellingen voor Informant, een AddOn die gedetailleerde item informatie toont";
		GuiOtherHeader	= "Andere Opties";
		GuiOtherHelp	= "Overige Informant Opties";
		GuiReloadui	= "Herlaad de gebruikersinterface";
		GuiReloaduiButton	= "Herlaad";
		GuiReloaduiFeedback	= "WoW interface wordt herladen";
		GuiReloaduiHelp	= "Klik hier om de WoW gebruikersinterface te herladen na de taal te hebben gewijzigd, zodat de taal in dit configuratiemenu op de gekozen taal wordt gezet. Let op: Dit kan enkele minuten duren.";
		GuiVendor	= "Toon winkelprijzen";
		GuiVendorBuy	= "Toon winkel koopprijzen";
		GuiVendorHeader	= "Winkel Prijzen";
		GuiVendorHelp	= "Opties die te maken hebben met NPC koop/verkoop prijzen.";
		GuiVendorSell	= "Toon winkel verkoopprijzen";
		HelpDefault	= "Herstel een Informant optie naar zijn standaardwaarde. Je kunt ook het sleutelwoord \"all\" opgeven om alle instellingen te herstellen.";
		HelpDisable	= "Stopt het automatisch laden van Informant wanneer je de volgende keer inlogd";
		HelpEmbed	= "Integreer de tekst in de originele spel tooltip. (Let op: sommige opties zijn uitgeschakeld wanneer dit geselecteerd is)";


		-- Section: Keybinding Text
		BindingHeader	= "Informant";
		BindingTitle	= "Schakel Informatie Scherm";


		-- Section: Tooltip Messages
		FrameTitle	= "Informant Item Informatie";
		FrmtActDefault	= "Informant's %s optie is ingesteld op standaard instellingen";
		FrmtActDefaultall	= "Alle informatie opties zijn teruggezet op de standaard instellingen.";
		FrmtActDisable	= "Gegevens van items %s niet weergegeven";
		FrmtActEnable	= "Item's %s gegevens weergegeven";
		FrmtActEnabledOn	= "Weergeven item's %s op %s";
		FrmtActSet	= "Stel %s naar '%s' in";
		FrmtActUnknown	= "Onbekend opdracht: '%s'";
		FrmtInfoBuy	= "Koop van winkelier";
		FrmtInfoBuymult	= "Koop %d (%s ieder)";
		FrmtInfoClass	= "Klasse: %s";
		FrmtInfoMerchants	= "Verkocht door %d verkopers";
		FrmtInfoQuest	= "Quest item in %d quests";
		FrmtInfoSell	= "Verkoop aan winkelier";
		FrmtInfoSellmult	= "Verkoop %d (%s ieder)";
		FrmtInfoStx	= "Stapels in hoeveelheden van %d";
		FrmtInfoUse	= "Gebruikt voor: %s";
		FrmtUnknownLocale	= "De taal die u heeft gekozen ('%s') is onbekend. Geldige talen zijn:";
		FrmtWelcome	= "Informant v%s geladen";
		InfoHeader	= "Informatie over |cff%s%s|r";
		InfoNoItem	= "Eerst bewegen over een item, dan de activatie toets indrukken";
		InfoPlayerMade	= "Gemaakt door level %d %s";
		InfoQuestHeader	= "Gebruikt in %d quests:";
		InfoQuestName	= "%d voor \"%s\" (level %d)";
		InfoQuestSource	= "Quest gegevens aangeleverd door";
		InfoVendorHeader	= "Verkrijgbaar bij %d verkopers:";
		InfoVendorName	= "%s";


		-- Section: Type Messages
		AdditAlcohol	= "Alcohol";
		AdditBuff	= "Buff";
		AdditDrink	= "Drankje";
		AdditFirework	= "Vuurwerk";
		AdditFood	= "Etenswaar";
		AdditGiftwrap	= "Cadeauverpakking";
		AdditLure	= "Lokkertje";
		AdditPoison	= "Vergif";
		AdditPotion	= "Drankje";
		AdditRestorative	= "Versterkend";
		AdditScroll	= "Boekrol";
		SkillAlchemy	= "Alchemie";
		SkillBlacksmithing	= "Smeden";
		SkillCooking	= "Koken";
		SkillDruid	= "Dru\195\175de spreuken";
		SkillEnchanting	= "Betoveren";
		SkillEngineering	= "Produceren";
		SkillFirstAid	= "Eerste Hulp";
		SkillLeatherworking	= "Leerbewerking";
		SkillMage	= "Tovenaar spreuken";
		SkillMining	= "Mijnwerken";
		SkillPaladin	= "Paladijn spreuken";
		SkillPriest	= "Priester spreuken";
		SkillRogue	= "Rogue vaardigheden";
		SkillShaman	= "Shaman spreuken";
		SkillTailoring	= "Kleermaker";
		SkillWarlock	= "Warlock spreuken";

	};
}