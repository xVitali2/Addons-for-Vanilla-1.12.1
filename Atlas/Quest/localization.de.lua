--[[

	AtlasQuest, a World of Warcraft addon.
	Email me at mystery8@gmail.com

	This file is part of AtlasQuest.

	AtlasQuest is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	AtlasQuest is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with AtlasQuest; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]


-- German localisation by Asurn
-- updated by Telchar (ICQ:  391632535)
-- updated by Nalumis


if ( GetLocale() == "deDE" ) then


---------------
--- COLOURS ---
---------------

local GREY = "|cff999999";
local RED = "|cffff0000";
local REDA = "|cffcc6666";
local WHITE = "|cffFFFFFF";
local GREEN = "|cff1eff00";
local PURPLE = "|cff9F3FFF";
local BLUE = "|cff0070dd";
local ORANGE = "|cffFF8400";
local YELLOW = "|cffFFd200";   -- Ingame Yellow


---------------
--- OPTIONS ---
---------------

AQHelpText = ""..WHITE.."Gib /aq oder atlasquest "..YELLOW.."[command]"..WHITE.." ein\ncommands: help; option/config; show/hide; left/right; colour; autoshow"..RED.."(nur Atlas)"
--
AQOptionsCaptionTEXT = "AtlasQuest-Optionen";
AQ_OK = "OK"

-- Autoshow
AQOptionsAutoshowTEXT = ""..WHITE.."AtlasQuest-Panel mit "..RED.."Atlas"..WHITE.." anzeigen.";
AQAtlasAutoON = "Das AtlasQuest-Panel wird jetzt automatisch mit Atlas angezeigt "..GREEN.."(Standard)"
AQAtlasAutoOFF = "Das AtlasQuest-Panel wird jetzt "..RED.."nicht"..WHITE.." mehr beim Öffnen von Atlas angezeigt"

-- Right/Left
AQOptionsLEFTTEXT = ""..WHITE.."AtlasQuest-Panel "..RED.."links"..WHITE.." anzeigen.";
AQOptionsRIGHTTEXT = ""..WHITE.."AtlasQuest-Panel "..RED.."rechts"..WHITE.." anzeigen.";
AQShowRight = "Das AtlasQuest-Panel wird nun auf der "..RED.."rechten"..WHITE.." Seite angezeigt";
AQShowLeft = "Das AtlasQuest-Panel wird nun auf der "..RED.."linken"..WHITE.." Seite angezeigt "..GREEN.."(Standard)";

-- Colour Check
AQOptionsCCTEXT = ""..WHITE.."Die Quests nach dem Questlevel färben."
AQCCON = "Die Quests werden jetzt nach dem Questlevel gefärbt."
AQCCOFF = "Die Quests werden jetzt "..RED.."nicht"..WHITE.." mehr nach dem Questlevel gefärbt."

-- QuestLog Colour Check
AQQLColourChange = ""..WHITE.."Alle Quests, die in deinem Questlog sind "..BLUE.."blau"..WHITE.." färben."

-- AutoQuery Quest Rewards
AQOptionsAutoQueryTEXT = ""..WHITE.."Den Server automatisch nach den Gegenständen abfragen, die man noch nicht gesehen hat."

-- Suppress Server Query text
AQOptionsNoQuerySpamTEXT = ""..WHITE.."Die Textmeldungen bei der Serverabfrage unterdrücken."

-- Use Comparison Tooltips
AQOptionsCompareTooltipTEXT = ""..WHITE.."Die Belohnungen mit den derzeit angelegten Gegenständen vergleichen."


AQAbilities = BLUE .. "Fähigkeiten:" .. WHITE;
AQSERVERASKInformation = " Bitte rechtsklicken bis der Gegenstand angezeigt wird."
AQSERVERASKAuto = " Versuche den Mauszeiger in einer Sekunde über den Gegenstand zu bewegen."
AQSERVERASK = "AtlasQuest frägt den Server nach folgendem Gegenstand ab: "
AQERRORNOTSHOWN = "Dieser Gegenstand ist nicht sicher!"
AQERRORASKSERVER = "Klicke rechts um den Server nach \ndiesem Gegenstand abzufragen. Es kann passieren, dass die Verbindung unterbrochen wird."
AQOptionB = "Optionen"
AQStoryB = "Geschichte"
AQNoReward = ""..BLUE.." Keine Belohnung"
AQDiscription_OR = ""..GREY.." oder "..WHITE..""
AQDiscription_AND = ""..GREY.." und "..WHITE..""
AQDiscription_REWARD = ""..BLUE.." Belohnung: "
AQDiscription_ATTAIN = "Benötigte Stufe: "
AQDiscription_LEVEL = "Stufe: "
AQDiscription_START = "Beginnt bei/in: \n"
AQDiscription_AIM = "Ziel: \n"
AQDiscription_NOTE = "Informationen: \n"
AQDiscription_PREQUEST = "Vorquest: "
AQDiscription_FOLGEQUEST = "Folgequest: "
AQFinishedTEXT = "Quest abgeschlossen: ";


------------------
--- ITEM TYPES ---
------------------

AQITEM_DAGGER = " Dolch"
AQITEM_POLEARM = " Stangenwaffe"
AQITEM_SWORD = " Schwert"
AQITEM_AXE = " Axt"
AQITEM_WAND = "Zauberstab"
AQITEM_STAFF = "Stab"
AQITEM_MACE = " Streitkolben"
AQITEM_SHIELD = "Schild"
AQITEM_GUN = "Schusswaffe"
AQITEM_BOW = "Bogen"
AQITEM_CROSSBOW = "Armbrust"
AQITEM_THROWN = "Wurfwaffe"

AQITEM_WAIST = "Taille,"
AQITEM_SHOULDER = "Schultern,"
AQITEM_CHEST = "Brust,"
AQITEM_LEGS = "Beine,"
AQITEM_HANDS = "Hände,"
AQITEM_FEET = "Füße,"
AQITEM_WRIST = "Handgelenke,"
AQITEM_HEAD = "Kopf,"
AQITEM_BACK = "Rücken"
AQITEM_TABARD = "Wappenrock"

AQITEM_CLOTH = " Stoff"
AQITEM_LEATHER = " Leder"
AQITEM_MAIL = " Schwere Rüstung"
AQITEM_PLATE = " Platte"

AQITEM_OFFHAND = "Nebenhand"
AQITEM_MAINHAND = "Waffenhand,"
AQITEM_ONEHAND = "Einhändig,"
AQITEM_TWOHAND = "Zweihändig,"

AQITEM_ITEM = "Gegenstand"
AQITEM_TRINKET = "Schmuck"
AQITEM_RELIC = "Relikt"
AQITEM_POTION = "Trank"
AQITEM_OFFHAND = "In Schildhand geführt"
AQITEM_NECK = "Hals"
AQITEM_PATTERN = "Muster"
AQITEM_BAG = "Behälter"
AQITEM_RING = "Ring"
AQITEM_KEY = "Schlüssel"
AQITEM_GEM = "Edelstein"
AQITEM_QUIVER = "Köcher"
AQITEM_AMMOPOUCH = "Munitionsbeutel"
AQITEM_ENCHANT = "Verzauberung"



----------------------------------------------
---------------- DUNGEONS --------------------
----------------------------------------------



--------------- INST1 - Deadmines (VC) ---------------

Inst1Story = "Die Todesminen, einst die wichtigste Goldquelle der Menschen, wurden aufgegeben, als die Horde Sturmwind während des Ersten Krieges in Schutt und Asche legte. Nun hat sich die Defias-Bruderschaft in den verlassenen Minen niedergelassen und die dunklen Schächte in ihre eigene unterirdische Festung verwandelt. Gerüchten zufolge sollen die Diebe die gewitzten Goblins angeheuert haben, um tief in den Minen etwas Fürchterliches zu konstruieren, doch welche Teufelei dies konkret sein soll, ist nicht bekannt. Der Zugang zu den Todesminen liegt inmitten des ruhigen, unscheinbaren Dorfes Mondbruch."
Inst1Caption = "Die Todesminen"
Inst1QAA = "7 Quests"
Inst1QAH = "keine Quests"

--Quest 1 Alliance
Inst1Quest1 = "1. Rote Seidenkopftücher"
Inst1Quest1_Level = "17"
Inst1Quest1_Attain = "14"
Inst1Quest1_Aim = "Späherin Riell am Turm auf der Späherkuppe möchte, dass Ihr ihr 10 rote Seidenkopftücher bringt."
Inst1Quest1_Location = "Späherin Riell (Westfall - Späherkuppe; "..YELLOW.."56,47"..WHITE..")"
Inst1Quest1_Note = "Man bekommt die Kopftücher von den Arbeitern in den Todesminen und kurz vor dem Eingang. Die Quest wird verfügbar, sobald du die Defias-Bruderschaft-Questreihe soweit beendet hast, dass du Edwin van Cleef töten musst."
Inst1Quest1_Prequest = "Ja (siehe Information)"
Inst1Quest1_Folgequest = "Nein"
Inst1Quest1PreQuest = "true"
--
Inst1Quest1name1 = "Robuste Kurzklinge"
Inst1Quest1name2 = "Kunstvoll geschnitzter Dolch"
Inst1Quest1name3 = "Durchstechende Axt"

--Quest 2 Alliance
Inst1Quest2 = "2. Die Suche nach Andenken"
Inst1Quest2_Level = "18"
Inst1Quest2_Attain = "14"
Inst1Quest2_Aim = "Beschafft 4 Gewerkschaftsausweise und bringt sie nach Sturmwind zu Wilder Distelklette."
Inst1Quest2_Location = "Wilder Distelklette (Sturmwind - Zwergendistrikt; "..YELLOW.."65,21"..WHITE..")"
Inst1Quest2_Note = "Die Ausweise gibt es von den Untoten vor der Instanz in der Nähe von "..YELLOW.."[3]"..WHITE.." auf der Eingangskarte."
Inst1Quest2_Prequest = "Nein"
Inst1Quest2_Folgequest = "Nein"
--
Inst1Quest2name1 = "Stiefel des Tunnelgräbers"
Inst1Quest2name2 = "Verstaubte Bergbauhandschuhe"

--Quest 3 Alliance
Inst1Quest3 = "3. Oh Bruder..."
Inst1Quest3_Level = "20"
Inst1Quest3_Attain = "15"
Inst1Quest3_Aim = "Bringt Großknecht Distelklettes Abzeichen der Forscherliga nach Sturmwind zu Wilder Distelklette."
Inst1Quest3_Location = "Wilder Distelklette (Sturmwind - Zwergendistrikt; "..YELLOW.."65,21"..WHITE..")"
Inst1Quest3_Note = "Großknecht Distelklette befindet sich vor der Instanz in der Nähe von "..YELLOW.."[3]"..WHITE.." auf der Eingangskarte."
Inst1Quest3_Prequest = "Nein"
Inst1Quest3_Folgequest = "Nein"
--
Inst1Quest3name1 = "Rächer des Minenarbeiters"

--Quest 4 Alliance
Inst1Quest4 = "4. Unterirdischer Angriff"
Inst1Quest4_Level = "20"
Inst1Quest4_Attain = "15"
Inst1Quest4_Aim = "Holt das Gnoamsprenkelspross aus den Todesminen und bringt es Shoni der Schtillen in Sturmwind."
Inst1Quest4_Location = "Shoni die Schtille (Sturmwind - Zwergendistrikt; "..YELLOW.."55,12"..WHITE..")"
Inst1Quest4_Note = "Das Vorquest bekommt man von Gnoarn (Eisenschmiede - Tüftlerstadt; "..YELLOW.."69,50"..WHITE..").\nSneeds Schredder dropt das Gnoamsprenkelspross "..YELLOW.."[3]"..WHITE.."."
Inst1Quest4_Prequest = "Ja, Sprecht mit Shoni"
Inst1Quest4_Folgequest = "Nein"
Inst1Quest4PreQuest = "true"
--
Inst1Quest4name1 = "Polarstulpen"
Inst1Quest4name2 = "Düsterer Zauberstab"

--Quest 5 Alliance
Inst1Quest5 = "5. Die Bruderschaft der Defias"
Inst1Quest5_Level = "22"
Inst1Quest5_Attain = "14"
Inst1Quest5_Aim = "Tötet Edwin van Cleef und bringt seinen Kopf zu Gryan Starkmantel."
Inst1Quest5_Location = "Gryan Starkmantel (Westfall - Späherkuppe; "..YELLOW.."56,47"..WHITE..")"
Inst1Quest5_Note = "Diese Questreihe beginnt bei Gryan Starkmantel (Westfall; 56,47).\nEdwin van Cleef ist der Endboss in den Todesminen. Man findet ihn oben auf seinem Schiff "..YELLOW.."[6]"..WHITE.."."
Inst1Quest5_Prequest = "Ja, Die Bruderschaft der Defias"
Inst1Quest5_Folgequest = "Ja, Der nie verschickte Brief"
Inst1Quest5PreQuest = "true"
--
Inst1Quest5name1 = "Galoschen von Westfall"
Inst1Quest5name2 = "Tunika von Westfall"
Inst1Quest5name3 = "Stab von Westfall"

--Quest 6 Alliance
Inst1Quest6 = "6. Die Prüfung der Rechtschaffenheit (Paladin)"
Inst1Quest6_Level = "22"
Inst1Quest6_Attain = "20"
Inst1Quest6_Aim = "Sucht mit Jordans Waffennotizen etwas Weißsteineichenholz, Bailors aufbereitete Erzlieferung, Jordans Schmiedehammer und einen Koredelstein und bringt alles zusammen zu Jordan Stillbrunn in Eisenschmiede."
Inst1Quest6_Location = "Jordan Stillbrunn (Dun Morogh - Eisenschmiede Eingang; "..YELLOW.."52,36"..WHITE..")"
Inst1Quest6_Note = "Um die Notizen zu dieser Quest zu betrachten, klicke auf "..YELLOW.."[Informationen zur Prüfung der Rechtschaffenheit]"..WHITE.."."
Inst1Quest6_Page = {2, "Nur Paladine können dieses Quest erhalten!\n\n1. Das Weißsteineichenholz bekommt man von Goblinholzschnitzer in den "..YELLOW.."[Todesminen]"..WHITE.." nahe "..YELLOW.."[3]"..WHITE..".\n\n2. Um Bailors aufbereitete Erzlieferung zu bekommen, muss man mit Bailor Steinhand (Loch Modan - Thelsamar; "..YELLOW.."35,44"..WHITE..") reden. Er gibt einem das Quest 'Bailors Erzlieferung'. Für dieses Quest muss man Jordans Erzlieferung finden. Sie ist hinter einem Baum bei "..YELLOW.."71,21"..WHITE.."\n\n3. Jordans Schmiedehammer bekommt man in "..YELLOW.."[Burg Schattenfang]"..WHITE.." bei "..YELLOW.."[3]"..WHITE..".\n\n4. Den Koredelstein bekommt man von Thundris Windwirker (Dunkelküste - Auberdine; "..YELLOW.."37,40"..WHITE.."), wenn man das Quest 'Suche nach dem Koredelstein' macht. Für dieses Quest muss man vor der "..YELLOW.."[Tiefschwarzen Grotte]"..WHITE.." Orakel oder Gezeitenpriesterinnen der Tiefschwarzen Grotte töten. Diese droppen den Verderbten Koredelstein, welchen Thundris Windwirker reinigt.", };
Inst1Quest6_Prequest = "Ja, Der Foliant der Ehre -> Die Prüfung der Rechtschaffenheit"
Inst1Quest6_Folgequest = "Ja, Die Prüfung der Rechtschaffenheit"
Inst1Quest6PreQuest = "true"
--
Inst1Quest6name1 = "Verigans Faust"

--Quest 7 Alliance
Inst1Quest7 = "7. Der nie verschickte Brief"
Inst1Quest7_Level = "22"
Inst1Quest7_Attain = "16"
Inst1Quest7_Aim = "Bringt den Brief nach Sturmwind zum Stadtarchitekten Baros Alexston."
Inst1Quest7_Location = "Ein nie abgeschickter Brief (droppt von Edwin van Cleef "..YELLOW.."[6]"..WHITE..")"
Inst1Quest7_Note = "Baros Alexston befindet sich in Sturmwind, neben der Kathedrale des Lichts bei "..YELLOW.."49,30"..WHITE.."."
Inst1Quest7_Prequest = "Nein"
Inst1Quest7_Folgequest = "Ja, Bazil Thredd"
-- No Rewards for this quest



--------------- INST2 - Wailing Caverns (WC) ---------------

Inst2Story = "Vor nicht allzu langer Zeit entdeckte ein nachtelfischer Druide namens Naralex eine Reihe unterirdischer Kavernen im Herzen des Brachlands. Er gab den Höhlen des Wehklagens ihren Namen, da sich dort viele Risse im Boden befinden, durch die in regelmäßigen Abständen heißer Dampf entweicht, wobei ein lang gezogenes, wehleidig klingenendes Heulen ertönt. Naralex glaubte, die unterirdischen Quellen der Kavernen dazu nutzen zu können, das Brachland wieder grün und fruchtbar zu machen. Um seinen mutigen Plan in die Tat umzusetzen, musste er zuerst die Energien des sagenumwobenen Smaragdgrünen Traums anzapfen. Sobald er sich in den Traum versetzte, geschah jedoch das Unfassbare: Seine Vision verwandelte sich in einen Alptraum! Kurz darauf fingen auch die Höhlen des Wehklagens an, sich zu verändern. Das einst reine Quellwasser wurde faulig, und die zahmen Kreaturen vollzogen eine perverse Metamorphose, aus der sie als blutrünstige Monster hervorgingen. Man sagt, Naralex hielte sich immer noch in den Höhlen auf, gefangen in seinem eigenen Smaragdgrünen Alptraum. Sogar die Gefolgsleute von Naralex wurden durch das Versagen ihres Meisters korrumpiert und in die grausamen Druiden des Fangzahns verwandelt."
Inst2Caption = "Höhlen des Wehklagens"
Inst2QAA = "5 Quests"
Inst2QAH = "7 Quests"

--Quest 1 Alliance
Inst2Quest1 = "1. Deviatbälge"
Inst2Quest1_Level = "17"
Inst2Quest1_Attain = "13"
Inst2Quest1_Aim = "Nalpak in den Höhlen des Wehklagens möchte 20 Deviatbälge."
Inst2Quest1_Location = "Nalpak (Brachland - Die Höhlen des Wehklagens; "..YELLOW.."47,36"..WHITE..")"
Inst2Quest1_Note = "Man bekommt die Bälge von allen Deviatgegnern vor und in der Instanz.\nNalpak befindet sich dirket über dem Eingang in einer versteckten Höhle. Am einfachsten erreicht man ihn, wenn man den Hügel hinter dem Eingang hinaufläuft und den kleinen Vorsprung über dem Eingang hinunterspringt."
Inst2Quest1_Prequest = "Nein"
Inst2Quest1_Folgequest = "Nein"
--
Inst2Quest1name1 = "Clevere Deviatgamaschen"
Inst2Quest1name2 = "Deviathautpack"

--Quest 2 Alliance
Inst2Quest2 = "2. Ärger auf den Docks"
Inst2Quest2_Level = "18"
Inst2Quest2_Attain = "14"
Inst2Quest2_Aim = "Kranführer Moppelfuzz in Ratschet möchte, dass Ihr Zausel dem Verrückten, der sich in den Höhlen des Wehklagens versteckt, die Flasche mit 99-jährigem Portwein wieder abnehmt."
Inst2Quest2_Location = "Kranführer Moppelfuzz (Brachland - Ratschet; "..YELLOW.."63,37"..WHITE..")"
Inst2Quest2_Note = "Den Portwein gibt es vor der Instanz von Zausel dem Verrückten. Zausel ist schwer zu finden da er recht klein ist und getarnt ist. Er befindet sich vom Eingang aus rechts gesehen bei "..YELLOW.."[2] auf der Eingangskarte"..WHITE.."."
Inst2Quest2_Prequest = "Nein"
Inst2Quest2_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 3 Alliance
Inst2Quest3 = "3. Klugheitstränke"
Inst2Quest3_Level = "18"
Inst2Quest3_Attain = "14"
Inst2Quest3_Aim = "Bringt 6 Portionen Klageessenz zu Mebok Mizzyrix in Ratschet."
Inst2Quest3_Location = "Mebok Mizzyrix (Brachland - Ratschet; "..YELLOW.."62,37"..WHITE..")"
Inst2Quest3_Note = "Das Vorquest bekommt man auch von Mebok Mizzyrix.\nAlle Ektoplasmagegener vor und in der Instanz droppen Klageessenzen."
Inst2Quest3_Prequest = "Ja, Raptorhörner"
Inst2Quest3_Folgequest = "Nein"
Inst2Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst2Quest4 = "4. Ausrottung der Deviat"
Inst2Quest4_Level = "21"
Inst2Quest4_Attain = "15"
Inst2Quest4_Aim = "Ebru in den Höhlen des Wehklagens möchte, dass Ihr 7 Deviatverheerer, 7 Deviatvipern, 7 Deviatschlurfer und 7 Deviatschreckensfange tötet."
Inst2Quest4_Location = "Ebru (Brachland - Die Höhlen des Wehklagens; "..YELLOW.."47,36"..WHITE..")"
Inst2Quest4_Note = "Die gesuchten Gegner befinden sich alle innerhalb der Instanz. Nalpak befindet sich dirket über dem Eingang in einer versteckten Höhle. Am einfachsten erreicht man ihn, wenn man den Hügel hinter dem Eingang hinaufläuft und den kleinen Vorsprung über dem Eingang hinunterspringt."
Inst2Quest4_Prequest = "Nein"
Inst2Quest4_Folgequest = "Nein"
--
Inst2Quest4name1 = "Muster: Deviatschuppengürtel"
Inst2Quest4name2 = "Schmorstecken"
Inst2Quest4name3 = "Moorlandstulpen"

--Quest 5 Alliance
Inst2Quest5 = "5. Der leuchtende Splitter"
Inst2Quest5_Level = "25"
Inst2Quest5_Attain = "21"
Inst2Quest5_Aim = "Begebt Euch nach Ratschet, um jemanden zu finden, der Euch mehr über den leuchtenden Splitter sagen kann. Liefert dann den Splitter ab, wie Ihr angewiesen wurdet."
Inst2Quest5_Location = "Der leuchtende Splitter (droppt von Mutanus der Verschlinger "..YELLOW.."[9]"..WHITE..")"
Inst2Quest5_Note = "Mutanus der Verschlinger erscheint nur, wenn man alle 4 Druiden getötet und den Tauren Druiden am Eingang eskortiert hat.\nSobald man den Splitter hat, muss man ihn nach Ratschet vor die Bank bringen und danach wieder zurück zu dem Hügel oberhalb der Höhlen des Wehklagens zu Falla Weisenwind."
Inst2Quest5_Prequest = "Nein"
Inst2Quest5_Folgequest = "Ja, Alptraum"
--
Inst2Quest5name1 = "Talbar-Mantel"
Inst2Quest5name2 = "Morastgaloschen"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst2Quest1_HORDE = Inst2Quest1
Inst2Quest1_HORDE_Level = Inst2Quest1_Level
Inst2Quest1_HORDE_Attain = Inst2Quest1_Attain
Inst2Quest1_HORDE_Aim = Inst2Quest1_Aim
Inst2Quest1_HORDE_Location = Inst2Quest1_Location
Inst2Quest1_HORDE_Note = Inst2Quest1_Note
Inst2Quest1_HORDE_Prequest = Inst2Quest1_Prequest
Inst2Quest1_HORDE_Folgequest = Inst2Quest1_Folgequest
--
Inst2Quest1name1_HORDE = Inst2Quest1name1
Inst2Quest1name2_HORDE = Inst2Quest1name2

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst2Quest2_HORDE = Inst2Quest2
Inst2Quest2_HORDE_Level = Inst2Quest2_Level
Inst2Quest2_HORDE_Attain = Inst2Quest2_Attain
Inst2Quest2_HORDE_Aim = Inst2Quest2_Aim
Inst2Quest2_HORDE_Location = Inst2Quest2_Location
Inst2Quest2_HORDE_Note = Inst2Quest2_Note
Inst2Quest2_HORDE_Prequest = Inst2Quest2_Prequest
Inst2Quest2_HORDE_Folgequest = Inst2Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde
Inst2Quest3_HORDE = "3. Schlangenflaum"
Inst2Quest3_HORDE_Level = "18"
Inst2Quest3_HORDE_Attain = "14"
Inst2Quest3_HORDE_Aim = "Die Apothekerin Zamah in Donnerfels möchte, dass Ihr zehn Schlangenflaum für sie sammelt."
Inst2Quest3_HORDE_Location = "Apothekerin Zamah (Donnerfels - Anhöhe der Geister; "..YELLOW.."22,20"..WHITE..")"
Inst2Quest3_HORDE_Note = "Apothekerin Zamah befindet sich in einer Höhle unter der Anhöhe der Geister. Das Vorquest bekommt man von Apotheker Helbrim (Brachland - Wegekreuz; "..YELLOW.."51,30"..WHITE..").\nDer Schlangenflaum kann vor und in der Instanz gefunden werden. Characktere, die der Kräuterkunde mächtig sind, können die Pflanzen auf der Minimap sehen."
Inst2Quest3_HORDE_Prequest = "Ja, Pilzsporen -> Apothekerin Zamah"
Inst2Quest3_HORDE_Folgequest = "Nein"
Inst2Quest3PreQuest_HORDE = "true"
--
Inst2Quest3name1_HORDE = "Apotheker-Handschuhe"

--Quest 4 Horde  (same as Quest 3 Alliance)
Inst2Quest4_HORDE = "4. Klugheitstränke"
Inst2Quest4_HORDE_Level = Inst2Quest3_Level
Inst2Quest4_HORDE_Attain = Inst2Quest3_Attain
Inst2Quest4_HORDE_Aim = Inst2Quest3_Aim
Inst2Quest4_HORDE_Location = Inst2Quest3_Location
Inst2Quest4_HORDE_Note = Inst2Quest3_Note
Inst2Quest4_HORDE_Prequest = Inst2Quest3_Prequest
Inst2Quest4_HORDE_Folgequest = Inst2Quest3_Folgequest
Inst2Quest4PreQuest_HORDE = Inst2Quest3PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 4 Alliance)
Inst2Quest5_HORDE = "5. Ausrottung der Deviat"
Inst2Quest5_HORDE_Level = Inst2Quest4_Level
Inst2Quest5_HORDE_Attain = Inst2Quest4_Attain
Inst2Quest5_HORDE_Aim = Inst2Quest4_Aim
Inst2Quest5_HORDE_Location = Inst2Quest4_Location
Inst2Quest5_HORDE_Note = Inst2Quest4_Note
Inst2Quest5_HORDE_Prequest = Inst2Quest4_Prequest
Inst2Quest5_HORDE_Folgequest = Inst2Quest4_Folgequest
--
Inst2Quest5name1_HORDE = Inst2Quest4name1
Inst2Quest5name2_HORDE = Inst2Quest4name2
Inst2Quest5name3_HORDE = Inst2Quest4name3

--Quest 6 Horde
Inst2Quest6_HORDE = "6. Anführer der Giftzähne"
Inst2Quest6_HORDE_Level = "22"
Inst2Quest6_HORDE_Attain = "18"
Inst2Quest6_HORDE_Aim = "Bringt die Edelsteine von Kobrahn, Anacondra, Pythas und Serpentis nach Donnerfels zu Nara Wildmähne."
Inst2Quest6_HORDE_Location = "Nara Wildmähne (Donnerfels - Anhöhe der Ältesten; "..YELLOW.."75,31"..WHITE..")"
Inst2Quest6_HORDE_Note = "Die Questreihe fängt bei Erzdruide Hamuul Runentotem (Donnerfels - Anhöhe der Ältesten; "..YELLOW.."78,28"..WHITE..") an.\nDie Edelsteine werden von den 4 Druiden  "..YELLOW.."[2]"..WHITE..","..YELLOW.."[3]"..WHITE..","..YELLOW.."[5]"..WHITE..","..YELLOW.."[7]"..WHITE.." gedroppt"
Inst2Quest6_HORDE_Prequest = "Ja, Die Oasen des Brachlandes -> Nara Wildmähne"
Inst2Quest6_HORDE_Folgequest = "Nein"
Inst2Quest6PreQuest_HORDE = "true"
--
Inst2Quest6name1_HORDE = "Mondsichelstab"
Inst2Quest6name2_HORDE = "Flügelklinge"

--Quest 7 Horde  (same as Quest 5 Alliance)
Inst2Quest7_HORDE = "7. Der leuchtende Splitter"
Inst2Quest7_HORDE_Level = Inst2Quest5_Level
Inst2Quest7_HORDE_Attain = Inst2Quest5_Attain
Inst2Quest7_HORDE_Aim = Inst2Quest5_Aim
Inst2Quest7_HORDE_Location = Inst2Quest5_Location
Inst2Quest7_HORDE_Note = Inst2Quest5_Note
Inst2Quest7_HORDE_Prequest = Inst2Quest5_Prequest
Inst2Quest7_HORDE_Folgequest = Inst2Quest5_Folgequest
--
Inst2Quest7name1_HORDE = Inst2Quest5name1
Inst2Quest7name2_HORDE = Inst2Quest5name2



--------------- INST3 - Ragefire Chasm (RFC) ---------------

Inst3Story = "Der Flammenschlund besteht aus einer Reihe vulkanischer Höhlen, die unter Orgrimmar verlaufen, der neuen Hauptstadt der Orcs. Vor nicht allzulanger Zeit soll sich in den feurigen Tiefen ein Kult eingenistet haben, der dem dämonischen Schattenrat nahe steht. Dieser Kult, der sich selbst die Brennende Klinge nennt, stellt eine direkte Bedrohung der Unabhängigkeit von Orgrimmar dar. Viele glauben, dass Kriegshäuptling Thrall die Brennende Klinge nur deshalb nicht sofort auslöscht, weil er sich erhofft, dass sie ihn direkt zu seinem wahren Feind führen werden, dem mysteriösen Schattenrat selbst. Dennoch könnten die dunklen Mächte, die sich im Flammenschlund sammeln, alles zerstören, was die Orcs mit so viel Blut und Leid erkämpft haben."
Inst3Caption = "Der Flammenschlund"
Inst3QAA = "keine Quests"
Inst3QAH = "5 Quests"

--Quest 1 Horde
Inst3Quest1_HORDE = "1. Die Kraft des Feindes wird auf die Probe gestellt"
Inst3Quest1_HORDE_Level = "15"
Inst3Quest1_HORDE_Attain = "9"
Inst3Quest1_HORDE_Aim = "Sucht in Orgrimmar nach dem Flammenschlund, tötet dann 8 Flammenschlundtroggs und 8 Schamanen der Flammenschlundtroggs und kehrt anschließend zu Rahauro in Donnerfels zurück."
Inst3Quest1_HORDE_Location = "Rahauro (Donnerfels - Anhöhe der Ältesten; "..YELLOW.."70,29"..WHITE..")"
Inst3Quest1_HORDE_Note = "Die Troggs findet man am Anfang der Instanz."
Inst3Quest1_HORDE_Prequest = "Nein"
Inst3Quest1_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 2 Horde
Inst3Quest2_HORDE = "2. Die Macht der Zerstörung..."
Inst3Quest2_HORDE_Level = "16"
Inst3Quest2_HORDE_Attain = "9"
Inst3Quest2_HORDE_Aim = "Bringt die Bücher 'Schattenzauber' und 'Zauberformeln aus dem Nether' zu Varimathras nach Unterstadt."
Inst3Quest2_HORDE_Location = "Varimathras (Unterstadt - Königliches Viertel; "..YELLOW.."56,92"..WHITE..")"
Inst3Quest2_HORDE_Note = "Die Kultisten und die Hexenmeister der Sengenden Klinge droppen die Bücher"
Inst3Quest2_HORDE_Prequest = "Nein"
Inst3Quest2_HORDE_Folgequest = "Nein"
--
Inst3Quest2name1_HORDE = "Garstige Beinkleider"
Inst3Quest2name2_HORDE = "Gamaschen des Sumpfgräbers"
Inst3Quest2name3_HORDE = "Gargoylegamaschen"

--Quest 3 Horde
Inst3Quest3_HORDE = "3. Die Suche nach dem verloren gegangenen Ranzen"
Inst3Quest3_HORDE_Level = "16"
Inst3Quest3_HORDE_Attain = "9"
Inst3Quest3_HORDE_Aim = "Sucht im Flammenschlund nach Maur Grimmtotems Leiche und durchsucht sie nach interessanten Gegenständen."
Inst3Quest3_HORDE_Location = "Rahauro (Donnerfels - Anhöhe der Ältesten; "..YELLOW.."70,29"..WHITE..")"
Inst3Quest3_HORDE_Note = "Maur Grimmtotem kann man bei "..YELLOW.."[1]"..WHITE.." finden. Danach muss man den Ranzen zurück zu Rahauro in Donnerfels bringen."
Inst3Quest3_HORDE_Prequest = "Nein"
Inst3Quest3_HORDE_Folgequest = "Ja, Wiederbeschaffung des verloren gegangenen Ranzens"
--
Inst3Quest3name1_HORDE = "Federleichte Armschienen"
Inst3Quest3name2_HORDE = "Savannenarmschienen"

--Quest 4 Horde
Inst3Quest4_HORDE = "4. Verborgene Feinde"
Inst3Quest4_HORDE_Level = "16"
Inst3Quest4_HORDE_Attain = "9"
Inst3Quest4_HORDE_Aim = "Tötet Bazzalan und Jergosh den Herbeirufer, bevor Ihr zu Thrall nach Orgrimmar zurückkehrt."
Inst3Quest4_HORDE_Location = "Thrall (Orgrimmar; "..YELLOW.."31,37"..WHITE..")"
Inst3Quest4_HORDE_Note = "Bazzalan findet man bei "..YELLOW.."[4]"..WHITE.." und Jergosh bei "..YELLOW.."[3]"..WHITE..". Die Questline startet bei Thrall in Ogrimmar."
Inst3Quest4_HORDE_Prequest = "Ja, Verborgene Feinde"
Inst3Quest4_HORDE_Folgequest = "Ja, Verborgene Feinde"
Inst3Quest4PreQuest_HORDE = "true"
--
Inst3Quest4name1_HORDE = "Kris von Orgrimmar"
Inst3Quest4name2_HORDE = "Hammer von Orgrimmar"
Inst3Quest4name3_HORDE = "Axt von Orgrimmar"
Inst3Quest4name4_HORDE = "Stab von Orgrimmar"

--Quest 5 Horde
Inst3Quest5_HORDE = "5. Vernichtung der Bestie"
Inst3Quest5_HORDE_Level = "16"
Inst3Quest5_HORDE_Attain = "9"
Inst3Quest5_HORDE_Aim = "Begebt Euch in den Flammenschlund und erschlagt Taragaman den Hungerleider. Bringt anschließend dessen Herz zu Neeru Feuerklinge nach Orgrimmar."
Inst3Quest5_HORDE_Location = "Neeru Feuerklinge (Orgrimmar - Kluft der Schatten; "..YELLOW.."49,50"..WHITE..")"
Inst3Quest5_HORDE_Note = "Taragaman findet man bei "..YELLOW.."[2]"..WHITE.."."
Inst3Quest5_HORDE_Prequest = "Nein"
Inst3Quest5_HORDE_Folgequest = "Nein"
-- No Rewards for this quest



--------------- INST4 - Uldaman (Ulda) ---------------

Inst4Story = "Uldaman ist ein uraltes titanisches Verlies, das seit der Zeit der Titanen tief unter der Erde verborgen lag. Vor Kurzem stießen die Zwerge bei ihren Ausgrabungen auf die vergessene Stadt, wobei sie die missglückten ersten Schöpfungen der Titanen entfesselten: Die Troggs. Der Legende nach erschufen die Titanen die Troggs aus Stein. Als sie sahen, dass ihre Schöpfung ein Fehlschlag war, verbannten sie die Troggs nach Uldaman und begannen von vorne. Das Ergebnis dieses zweiten Versuchs waren die Urahnen der heutigen Zwerge. Das Geheimnis der Entstehung der Zwerge ist auf den sagenumwobenen Scheiben von Norgannon festgehalten, gewaltigen titanischen Artefakten, die im Allerheiligsten der vergessenen Stadt Uldaman aufbewahrt werden. Die Zwerge des Düstereisenklans haben damit begonnen, nach Uldaman vorzudringen, um die Scheiben für ihren Meister zu stehlen, den Feuerfürsten Ragnaros. Die Stadt und die Scheiben werden jedoch von mehreren Wächtern beschützt, riesigen Geschöpfen aus lebendem Stein, die jeden unglücklichen Eindringling zerquetschen, der ihnen über den Weg läuft. Die Scheiben selbst werden von einem gewaltigen Steinwächter namens Archaedas bewacht, und einige, die aus Uldaman zurückgekehrt sind, berichten von Begegnungen mit seltsamen Wesen, bei denen es sich aller Wahrscheinlichkeit um die steinhäutigen Vorfahren der Zwerge handelt, die lange verloren geglaubten Irdenen."
Inst4Caption = "Uldaman"
Inst4QAA = "16 Quests"
Inst4QAH = "10 Quests"

--Quest 1 Alliance
Inst4Quest1 = "1. Ein Hoffnungsschimmer"
Inst4Quest1_Level = "35"
Inst4Quest1_Attain = "35"
Inst4Quest1_Aim = "Sucht in Uldaman nach Hammerzeh Grez."
Inst4Quest1_Location = "Ausgrabungsleiter Roggendol (Das Ödland; "..YELLOW.."53,43"..WHITE..")"
Inst4Quest1_Note = "Das Vorquest startet bei der zerknüllten Notiz (Das Ödland; "..YELLOW.."53,33"..WHITE..").\nHammerzeh Grez befindet sich noch vor der Instanz, bei "..YELLOW.."[1]"..WHITE.." auf der Eingangskarte."
Inst4Quest1_Prequest = "Ja, Ein Hoffnungsschimmer"
Inst4Quest1_Folgequest = "Ja, Amulett der Geheimnisse"
Inst4Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst4Quest2 = "2. Amulett der Geheimnisse"
Inst4Quest2_Level = "40"
Inst4Quest2_Attain = "36"
Inst4Quest2_Aim = "Sucht Hammerzehs Amulett und bringt es ihm nach Uldaman."
Inst4Quest2_Location = "Hammerzeh Grez (Uldaman - "..YELLOW.."[1] auf der Eingangskarte"..WHITE..")."
Inst4Quest2_Note = "Das Amulett droppt von Magregan Grubenschatten, bei "..YELLOW.."[2] auf der Eingangskarte"..WHITE.."."
Inst4Quest2_Prequest = "Ja, Ein Hoffnungsschimmer"
Inst4Quest2_Folgequest = "Ja, Ein Funken Hoffnung"
Inst4Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst4Quest3 = "3. Die verlorene Tafel des Willens"
Inst4Quest3_Level = "45"
Inst4Quest3_Attain = "38"
Inst4Quest3_Aim = "Sucht die Tafel des Willens und bringt sie zu Berater Belgrum in Eisenschmiede."
Inst4Quest3_Location = "Berater Belgrum (Eisenschmiede - Halle der Forscher; "..YELLOW.."77,10"..WHITE..")"
Inst4Quest3_Note = "Die Tafel ist bei "..YELLOW.."[8]"..WHITE.."."
Inst4Quest3_Prequest = "Ja, Amulett der Geheimnisse -> Ein Botschafter des Bösen"
Inst4Quest3_Folgequest = "Nein"
Inst4Quest3FQuest = "true"
--
Inst4Quest3name1 = "Medaille des Mutes"

--Quest 4 Alliance
Inst4Quest4 = "4. Kraftsteine"
Inst4Quest4_Level = "36"
Inst4Quest4_Attain = "31"
Inst4Quest4_Aim = "Bringt Riggelfuzz im Ödland 8 Kraftsteine aus Dentrium und 8 Kraftsteine aus An'Alleum."
Inst4Quest4_Location = "Riggelfuzz (Das Ödland; "..YELLOW.."42,52"..WHITE..")"
Inst4Quest4_Note = "Die Kraftsteine findet man bei allen Schattenschmiedegegnern vor und innerhalb der Instanz."
Inst4Quest4_Prequest = "Nein"
Inst4Quest4_Folgequest = "Nein"
--
Inst4Quest4name1 = "Energiegeladener Steinkreis"
Inst4Quest4name2 = "Duracin-Armschienen"
Inst4Quest4name3 = "Ewige Stiefel"

--Quest 5 Alliance
Inst4Quest5 = "5. Agmonds Schicksal"
Inst4Quest5_Level = "38"
Inst4Quest5_Attain = "33"
Inst4Quest5_Aim = "Bringt Ausgrabungsleiter Eisenband am Loch Modan 4 verzierte Steinurnen."
Inst4Quest5_Location = "Ausgrabungsleiter Eisenband (Loch Modan - Eisenbands Ausgrabungsstätte; "..YELLOW.."65,65"..WHITE..")"
Inst4Quest5_Note = "Das Vorquest startet bei Ausgrabungsleiter Sturmlanze (Eisenschmiede - Halle der Forscher; "..YELLOW.."74,12"..WHITE..").\nDie Urnen findet man überall in der Höhle vor der Instanz."
Inst4Quest5_Prequest = "Ja, Ironband sucht Euch! -> Murdaloc"
Inst4Quest5_Folgequest = "Nein"
Inst4Quest5PreQuest = "true"
--
Inst4Quest5name1 = "Ausgrabungsleiter-Handschuhe"

--Quest 6 Alliance
Inst4Quest6 = "6. Lösung der Verdammnis"
Inst4Quest6_Level = "40"
Inst4Quest6_Attain = "32"
Inst4Quest6_Aim = "Bringt Theldurin dem Verirrten die Schrifttafel von Ryun'eh."
Inst4Quest6_Location = "Theldurin der Verirrte (Das Ödland; "..YELLOW.."51,76"..WHITE..")"
Inst4Quest6_Note = "Die Schrifttafel befindet sich vor der Instanz. Um zu ihr zu gelangen muss man, nördlich des Instanztors, dem östlichen Gang bis zum Ende folgen. Auf der Eingangskarte ist sie bei "..YELLOW.."[3]"..WHITE.."."
Inst4Quest6_Prequest = "Nein"
Inst4Quest6_Folgequest = "Ja, Auf nach Eisenschmiede zu 'Yagyins Zusammenstellung'"
--
Inst4Quest6name1 = "Verdammnisverkünder-Robe"

--Quest 7 Alliance
Inst4Quest7 = "7. Die verschollenen Zwerge"
Inst4Quest7_Level = "40"
Inst4Quest7_Attain = "35"
Inst4Quest7_Aim = "Sucht in Uldaman nach Baelog."
Inst4Quest7_Location = "Ausgrabungsleiter Sturmlanze (Eisenschmiede - Halle der Forscher; "..YELLOW.."74,12"..WHITE..")"
Inst4Quest7_Note = "Bealog findet man bei "..YELLOW.."[1]"..WHITE.."."
Inst4Quest7_Prequest = "Nein"
Inst4Quest7_Folgequest = "Ja, Die geheime Kammer"
-- No Rewards for this quest

--Quest 8 Alliance
Inst4Quest8 = "8. Die geheime Kammer"
Inst4Quest8_Level = "40"
Inst4Quest8_Attain = "35"
Inst4Quest8_Aim = "Lest Baelogs Tagebuch, erforscht die geheime Kammer und erstattet dann Ausgrabungsleiter Sturmlanze Bericht."
Inst4Quest8_Location = "Bealog (Uldaman; "..YELLOW.."[1]"..WHITE..")"
Inst4Quest8_Note = "Die geheime Kammer ist bei "..YELLOW.."[4]"..WHITE..". Um die geheime Kammer öffnen zu können, braucht man den Schaft von Tsol von Revelosh "..YELLOW.."[3]"..WHITE.." und das Medaillon von Gni'kiv von Baelogs Truhe "..YELLOW.."[1]"..WHITE..". Kombiniere diese beiden Gegenstände um den Stab der Prähistorie herzustellen. Der Stab wird im Kartenraum zwischen "..YELLOW.."[3] and [4]"..WHITE.." benutzt, um Ironaya zu beschwören. Nachdem sie getötet wurde, läuft man in den Raum aus dem sie kam, um das Quest abzuschließen."
Inst4Quest8_Prequest = "Ja, Die verschollenen Zwerge"
Inst4Quest8_Folgequest = "Nein"
Inst4Quest8FQuest = "true"
--
Inst4Quest8name1 = "Zwergenstürmer"
Inst4Quest8name2 = "Forscherliga-Erzaderstern"

--Quest 9 Alliance
Inst4Quest9 = "9. Die zerrissene Halskette"
Inst4Quest9_Level = "41"
Inst4Quest9_Attain = "37"
Inst4Quest9_Aim = "Sucht nach dem Erschaffer der zerrissenen Halskette, um etwas über ihren möglichen Wert zu erfahren."
Inst4Quest9_Location = "Zerrissene Halskette (Zufälliger Dropp in Uldaman)"
Inst4Quest9_Note = "Man muss die Kette zu Talvash del Kissel (Eisenschmiede - Mystikerviertel; "..YELLOW.."36,3"..WHITE..") bringen."
Inst4Quest9_Prequest = "Nein"
Inst4Quest9_Folgequest = "Ja, Lehren haben ihren Preis"
-- No Rewards for this quest

--Quest 10 Alliance
Inst4Quest10 = "10. Rückkehr nach Uldaman"
Inst4Quest10_Level = "42"
Inst4Quest10_Attain = "37"
Inst4Quest10_Aim = "Sucht in Uldaman nach Hinweisen auf den momentanen Zustand von Talvashs Halskette. Der getötete Paladin, den Talvash erwähnte, hatte die Kette zuletzt."
Inst4Quest10_Location = "Talvash del Kissel (Eisenschmiede - Mystikerviertel; "..YELLOW.."36,3 "..WHITE..")"
Inst4Quest10_Note = "Der Paladin befindet sich bei "..YELLOW.."[2]"..WHITE.."."
Inst4Quest10_Prequest = "Ja, Lehren haben ihren Preis"
Inst4Quest10_Folgequest = "Ja, Suche nach den Edelsteinen"
-- No Rewards for this quest

--Quest 11 Alliance
Inst4Quest11 = "11. Suche nach den Edelsteinen"
Inst4Quest11_Level = "43"
Inst4Quest11_Attain = "38"
Inst4Quest11_Aim = "Findet den Rubin, den Saphir und den Topas, die in ganz Uldaman verstreut sind. Wenn Ihr sie habt, wendet Euch aus der Ferne an Talvash del Kissel, indem Ihr die Wahrsagephiole nutzt, die er Euch zuvor gegeben hat."
Inst4Quest11_Location = "Überreste eines Paladins (Uldaman; "..YELLOW.."[2]"..WHITE..")"
Inst4Quest11_Note = "Die Edelsteine befinden sich bei "..YELLOW.."[1]"..WHITE.." in einer Verdächtigen Urne, "..YELLOW.."[8]"..WHITE.." aus dem Schattenschmiedecache, und "..YELLOW.."[9]"..WHITE.." von Grimlok. Wenn der Schattenschmiedecache geöffnet wird, wird man von einigen Gegnern angegriffen.\nBenutze Talvashs Wahrsagephiole, um das Quest abzuschließen und das nächste zu erhalten."
Inst4Quest11_Prequest = "Ja, Rückkehr nach Uldaman"
Inst4Quest11_Folgequest = "Ja, Restaurierung der Halskette"
Inst4Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst4Quest12 = "12. Restaurierung der Halskette"
Inst4Quest12_Level = "44"
Inst4Quest12_Attain = "38"
Inst4Quest12_Aim = "Besorgt Euch eine Kraftquelle vom mächtigsten Konstrukt, das Ihr in Uldaman finden könnt, und liefert sie bei Talvash del Kissel in Eisenschmiede ab"
Inst4Quest12_Location = "Talvashs Wahrsageschale"
Inst4Quest12_Note = "Die Kraftquelle findet man beim Endboss Archaedas "..YELLOW.."[10]"..WHITE.."."
Inst4Quest12_Prequest = "Ja, Suche nach den Edelsteinen"
Inst4Quest12_Folgequest = "Nein"
Inst4Quest12FQuest = "true"
--
Inst4Quest12name1 = "Talvashs verstärkende Halskette"

--Quest 13 Alliance
Inst4Quest13 = "13. Reagenzsuche in Uldaman"
Inst4Quest13_Level = "42"
Inst4Quest13_Attain = "38"
Inst4Quest13_Aim = "Bringt zwölf magenta Funguskappen nach Thelsamar zu Ghak Heilsegen."
Inst4Quest13_Location = "Ghak Heilsegen (Loch Modan - Thelsamar; "..YELLOW.."37,49"..WHITE..")"
Inst4Quest13_Note = "Die Pilze wachsen überall in Uldaman. Spieler, die der Kräuterkunde mächtig sind können sie auf der Minimap sehen, wenn sie das Quest haben."
Inst4Quest13_Prequest = "Ja, Reagenziensuche im Ödland"
Inst4Quest13_Folgequest = "Nein"
Inst4Quest13PreQuest = "true"
--
Inst4Quest13name1 = "Regenerationstrank"

--Quest 14 Alliance
Inst4Quest14 = "14. Wiederbeschaffte Schätze"
Inst4Quest14_Level = "43"
Inst4Quest14_Attain = "33"
Inst4Quest14_Aim = "Holt Krom Starkarms wertvollen Besitz aus seiner Truhe in der nördlichen Bankenhalle von Uldaman und bringt den Schatz zu ihm nach Eisenschmiede."
Inst4Quest14_Location = "Krom Starkarm (Eisenschmiede - Halle der Forscher; "..YELLOW.."74,9"..WHITE..")"
Inst4Quest14_Note = "Der Schatz befindet sich vor der Instanz. Um zu ihm zu gelangen läuft man nördlich des Instanztors in den östlichen Gang und nimmt die südöstliche Abzweigung. Auf der Eingangskarte ist er bei "..YELLOW.."[4]"..WHITE.."."
Inst4Quest14_Prequest = "Nein"
Inst4Quest14_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 15 Alliance
Inst4Quest15 = "15. Die Platinscheiben"
Inst4Quest15_Level = "47"
Inst4Quest15_Attain = "40"
Inst4Quest15_Aim = "Sprecht mit dem Steinbehüter und findet heraus, welche uralten Lehren er aufbewahrt. Sobald Ihr alles erfahren habt, was er weiß, aktiviert die Scheiben von Norgannon. -> Bringt die Miniaturausgabe der Scheiben von Norgannon zur Forscherliga nach Eisenschmiede."
Inst4Quest15_Location = "Die Scheiben von Norgannon (Uldaman; "..YELLOW.."[11]"..WHITE..")"
Inst4Quest15_Note = "Nachdem ihr das Quest erhalten habt, müsst ihr mit dem Steinbehüter links von der Scheibe sprechen. Danach benutzt ihr nochmal die Platinscheibe und bekommt eine Miniaturscheibe die ihr zu Hochforscher Magellas in Eisenschmiede - Halle der Forscher ("..YELLOW.."69,18"..WHITE..") bringen sollt. Es gibt noch ein anderes Folgequest namens 'Mal sehen, was passiert...', dass bei Historiker Karnik in Eisenschmiede - Halle der Forscher startet."
Inst4Quest15_Prequest = "Nein"
Inst4Quest15_Folgequest = "Nein"
--
Inst4Quest15name1 = "Taupelzsack"
Inst4Quest15name2 = "Überragender Heiltrank"
Inst4Quest15name3 = "Großer Manatrank"

--Quest 16 Alliance
Inst4Quest16 = "16. Macht in Uldaman (Magier)"
Inst4Quest16_Level = "40"
Inst4Quest16_Attain = "35"
Inst4Quest16_Aim = "Beschafft Euch eine Obsidiankraftquelle und bringt sie in die Düstermarschen zu Tabetha."
Inst4Quest16_Location = "Tabetha (Düstermarschen; "..YELLOW.."46,57"..WHITE..")"
Inst4Quest16_Note = "Dieses Quest ist nur für Magier verfügbar.\nDie Obsidiankraftquelle wird von der  Obsidian-Schildwache bei "..YELLOW.."[5]"..WHITE.." gedroppt."
Inst4Quest16_Prequest = "Ja, Die Austreibung"
Inst4Quest16_Folgequest = "Ja, Manawogen"
Inst4Quest16PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 4 Alliance)
Inst4Quest1_HORDE = "1. Kraftsteine"
Inst4Quest1_HORDE_Level = Inst4Quest4_Level
Inst4Quest1_HORDE_Attain = Inst4Quest4_Attain
Inst4Quest1_HORDE_Aim = Inst4Quest4_Aim
Inst4Quest1_HORDE_Location = Inst4Quest4_Location
Inst4Quest1_HORDE_Note = Inst4Quest4_Note
Inst4Quest1_HORDE_Prequest = Inst4Quest4_Prequest
Inst4Quest1_HORDE_Folgequest = Inst4Quest4_Folgequest
--
Inst4Quest1name1_HORDE = Inst4Quest4name1
Inst4Quest1name2_HORDE = Inst4Quest4name2
Inst4Quest1name3_HORDE = Inst4Quest4name3

--Quest 2 Horde  (same as Quest 6 Alliance - different followup)
Inst4Quest2_HORDE = "2. Lösung der Verdammnis"
Inst4Quest2_HORDE_Level = Inst4Quest6_Level
Inst4Quest2_HORDE_Attain = Inst4Quest6_Attain
Inst4Quest2_HORDE_Aim = Inst4Quest6_Aim
Inst4Quest2_HORDE_Location = Inst4Quest6_Location
Inst4Quest2_HORDE_Note = Inst4Quest6_Note
Inst4Quest2_HORDE_Prequest = Inst4Quest6_Prequest
Inst4Quest2_HORDE_Folgequest = "Ja, Auf nach Unterstadt zu 'Yagyins Zusammenstellung'"
--
Inst4Quest2name1_HORDE = Inst4Quest6name1

--Quest 3 Horde
Inst4Quest3_HORDE = "3. Wiederbeschaffung der Halskette"
Inst4Quest3_HORDE_Level = "41"
Inst4Quest3_HORDE_Attain = "37"
Inst4Quest3_HORDE_Aim = "Sucht in der Grabungsstätte von Uldaman nach einer wertvollen Halskette und bringt sie nach Orgrimmar zu Dran Droffers. Die Halskette ist vielleicht beschädigt."
Inst4Quest3_HORDE_Location = "Dran Droffers (Orgrimmar - Die Gasse; "..YELLOW.."59,36"..WHITE..")"
Inst4Quest3_HORDE_Note = "Die Halskette ist ein Zufälliger Dropp innerhalb der Instanz."
Inst4Quest3_HORDE_Prequest = "Nein"
Inst4Quest3_HORDE_Folgequest = "Ja, Wiederbeschaffung der Halskette, Teil 2"
-- No Rewards for this quest

--Quest 4 Horde
Inst4Quest4_HORDE = "4. Wiederbeschaffung der Halskette, Teil 2"
Inst4Quest4_HORDE_Level = "41"
Inst4Quest4_HORDE_Attain = "37"
Inst4Quest4_HORDE_Aim = "Sucht in den Tiefen von Uldaman nach einem Hinweis auf den Verbleib der Edelsteine."
Inst4Quest4_HORDE_Location = "Dran Droffers (Orgrimmar - Die Gasse; "..YELLOW.."59,36"..WHITE..")"
Inst4Quest4_HORDE_Note = "Der Paladin befindet sich bei "..YELLOW.."[2]"..WHITE.."."
Inst4Quest4_HORDE_Prequest = "Ja, Wiederbeschaffung der Halskette"
Inst4Quest4_HORDE_Folgequest = "Ja, Übersetzung des Tagebuchs"
Inst4Quest4FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 5 Horde
Inst4Quest5_HORDE = "5. Übersetzung des Tagebuchs"
Inst4Quest5_HORDE_Level = "42"
Inst4Quest5_HORDE_Attain = "39"
Inst4Quest5_HORDE_Aim = "Sucht jemanden, der das Tagebuch des Paladins übersetzen kann. Der nächstgelegene Ort, wo Ihr so jemanden finden könntet, ist Kargath im Ödland."
Inst4Quest5_HORDE_Location = "Überreste eines Paladins (Uldaman; "..YELLOW.."[2]"..WHITE..")"
Inst4Quest5_HORDE_Note = "Der Übersetzer Jarkal Moosblut befindet sich in Kargath (Das Ödland; "..YELLOW.."2,46"..WHITE..")."
Inst4Quest5_HORDE_Prequest = "Ja, Wiederbeschaffung der Halskette, Teil 2"
Inst4Quest5_HORDE_Folgequest = "Ja, Findet die Edelsteine und die Kraftquelle"
Inst4Quest5FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 6 Horde
Inst4Quest6_HORDE = "6. Findet die Edelsteine und die Kraftquelle"
Inst4Quest6_HORDE_Level = "44"
Inst4Quest6_HORDE_Attain = "37"
Inst4Quest6_HORDE_Aim = "Beschafft in Uldaman alle drei Edelsteine sowie eine Kraftquelle für die Halskette und bringt sie anschließend zu Jarkal Moosblut nach Kargath. Jarkal glaubt, dass sich eine Kraftquelle vielleicht im stärksten Konstrukt in Uldaman findet."
Inst4Quest6_HORDE_Location = "Jarkal Moosblut (Das Ödland - Kargath; "..YELLOW.."2,46"..WHITE..")"
Inst4Quest6_HORDE_Note = "Die Edelsteine befinden sich bei "..YELLOW.."[1]"..WHITE.." in einer Verdächtigen Urne, "..YELLOW.."[8]"..WHITE.." aus dem Schattenschmiedecache, und "..YELLOW.."[9]"..WHITE.." von Grimlok. Wenn der Schattenschmiedecache geöffnet wird, wird man von einigen Gegnern angegriffen. Die Kraftquelle droppt vom Endboss Archaedas "..YELLOW.."[10]"..WHITE.."."
Inst4Quest6_HORDE_Prequest = "Ja, Übersetzung des Tagebuchs"
Inst4Quest6_HORDE_Folgequest = "Ja, Ablieferung der Edelsteine"
Inst4Quest6FQuest_HORDE = "true"
--
Inst4Quest6name1_HORDE = "Jarkals intensivierende Halskette"

--Quest 7 Horde
Inst4Quest7_HORDE = "7. Reagenzsuche in Uldaman"
Inst4Quest7_HORDE_Level = "42"
Inst4Quest7_HORDE_Attain = "36"
Inst4Quest7_HORDE_Aim = "Bringt 12 magenta Funguskappen nach Kargath zu Jarkal Moosblut."
Inst4Quest7_HORDE_Location = "Jarkal Moosblut (Das Ödland - Kargath; "..YELLOW.."2,69"..WHITE..")"
Inst4Quest7_HORDE_Note = "Das Vorquest bekommt man auch von Jarkal Moosblut.\nDie Pilze wachsen überall in Uldaman. Spieler, die der Kräuterkunde mächtig sind, können sie auf ihrer Minimap sehen."
Inst4Quest7_HORDE_Prequest = "Ja, Reagenzien-Suche im Ödland"
Inst4Quest7_HORDE_Folgequest = "Ja, Reagenzien-Suche im Ödland II"
Inst4Quest7PreQuest_HORDE = "true"
--
Inst4Quest7name1_HORDE = "Regenerationstrank"

--Quest 8 Horde
Inst4Quest8_HORDE = "8. Wiederbeschaffte Schätze"
Inst4Quest8_HORDE_Level = "43"
Inst4Quest8_HORDE_Attain = "33"
Inst4Quest8_HORDE_Aim = "Holt Patrick Garretts Familienschatz aus der Truhe der Familie in der südlichen Bankenhalle von Uldaman und bringt diesen zu ihm nach Unterstadt."
Inst4Quest8_HORDE_Location = "Patrick Garrett (Unterstadt; "..YELLOW.."72,48"..WHITE..")"
Inst4Quest8_HORDE_Note = "Der Schatz befindet sich vor der Instanz. Um zu ihm zu gelangen muss man dem Gang südlich des Instanztors, bis zum Ende folgen. Auf der Eingangskarte befindet er sich bei "..YELLOW.."[5]"..WHITE.."."
Inst4Quest8_HORDE_Prequest = "Nein"
Inst4Quest8_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 9 Horde
Inst4Quest9_HORDE = "9. Die Platinscheiben"
Inst4Quest9_HORDE_Level = "47"
Inst4Quest9_HORDE_Attain = "40"
Inst4Quest9_HORDE_Aim = "Sprecht mit dem Steinbehüter und findet heraus, welche uralten Lehren er aufbewahrt. Sobald Ihr alles erfahren habt, was er weiß, aktiviert die Scheiben von Norgannon. -> Bringt die Miniaturausgabe der Scheiben von Norgannon zu einem der Weisen von Donnerfels."
Inst4Quest9_HORDE_Location = "Die Scheiben von Norgannon (Uldaman; "..YELLOW.."[11]"..WHITE..")"
Inst4Quest9_HORDE_Note = "Nachdem ihr das Quest erhalten habt müsst ihr mit dem Steinbehüter links von der Scheibe sprechen. Danach benutzt ihr nochmal die Platinscheibe und bekommt eine Miniaturscheibe die ihr zu Weiser Wahrspruch in Donnerfels ("..YELLOW.."34,46"..WHITE..") bringt."
Inst4Quest9_HORDE_Prequest = "Nein"
Inst4Quest9_HORDE_Folgequest = "Ja, Die Platinscheiben"
--
Inst4Quest9name1_HORDE = "Taupelzsack"
Inst4Quest9name2_HORDE = "Überragender Heiltrank"
Inst4Quest9name3_HORDE = "Großer Manatrank"

--Quest 10 Horde  (same as Quest 4 Alliance)
Inst4Quest10_HORDE = "10. Macht in Uldaman (Magier)"
Inst4Quest10_HORDE_Level = Inst4Quest16_Level
Inst4Quest10_HORDE_Attain = Inst4Quest16_Attain
Inst4Quest10_HORDE_Aim = Inst4Quest16_Aim
Inst4Quest10_HORDE_Location = Inst4Quest16_Location
Inst4Quest10_HORDE_Note = Inst4Quest16_Note
Inst4Quest10_HORDE_Prequest = Inst4Quest16_Prequest
Inst4Quest10_HORDE_Folgequest = Inst4Quest16_Folgequest
Inst4Quest10PreQuest_HORDE = Inst4Quest16PreQuest
-- No Rewards for this quest



--------------- INST5 - Blackrock Depths (BRD) ---------------

Inst5Story = "In dem vulkanischen Labyrinth, das von der einstigen Hauptstadt der Zwerge des Düstereisenklans übriggeblieben ist, herrscht nun Ragnaros der Feuerfürst über die Abgründe des Schwarzfels. Ragnaros ist es gelungen, das Geheimnis zu lüften, wie Leben aus Stein erschaffen werden kann. Nun plant er, sein neu gewonnenes Wissen dazu einzusetzen, eine Armee unaufhaltsamer Golems zu schaffen, die ihm bei der Eroberung des Schwarzfels helfen sollen. Vollkommen besessen von dem Gedanken daran, Nefarian endlich zu vernichten, wird Ragnaros alles tun, um seinen Konkurrenten aus dem Weg zu räumen."
Inst5Caption = "Die Schwarzfelstiefen"
Inst5QAA = "18 Quests"
Inst5QAH = "18 Quests"

--Quest 1 Alliance
Inst5Quest1 = "1. Dunkeleisenerbe"
Inst5Quest1_Level = "52"
Inst5Quest1_Attain = "48"
Inst5Quest1_Aim = "Erschlagt Fineous Dunkelader und bergt den großen Hammer Eisenhölle. Bringt Eisenhölle zum Schrein von Thaurissan und legt ihn auf die Statue von Franclorn Schmiedevater."
Inst5Quest1_Location = "Franclorn Schmiedevater (Der Schwarzfels; "..YELLOW.."[3] auf der Eingangskarte"..WHITE..")"
Inst5Quest1_Note = "Franclorn findet man in der Mitte des Schwarzfels, auf seinem Steinsarg. Man kann ihn nur sehen, wenn man tot ist! Um das Quest zu starten müsst ihr zweimal mit ihm sprechen.\nFineous Dunkelader findet man bei "..YELLOW.."[9]"..WHITE..". Der Schrein ist rechts neben der Arena"..YELLOW.."[7]"..WHITE.."."
Inst5Quest1_Prequest = "Nein"
Inst5Quest1_Folgequest = "Nein"
--
Inst5Quest1name1 = "Schlüssel zur Schattenschmiede"

--Quest 2 Alliance
Inst5Quest2 = "2. Ribbly Schraubstutz"
Inst5Quest2_Level = "53"
Inst5Quest2_Attain = "48"
Inst5Quest2_Aim = "Bringt Yuka Schraubstutz in der brennenden Steppe Ribblys Kopf."
Inst5Quest2_Location = "Yuka Schraubstutz (Brennende Steppe - Flammenkamm; "..YELLOW.."65,22"..WHITE..")"
Inst5Quest2_Note = "Das Vorquest bekommt man von Yorba Schraubstutz (Tanaris - Dampfdruckpier; "..YELLOW.."67,23"..WHITE..").\nRibbly findet man bei "..YELLOW.."[15]"..WHITE.."."
Inst5Quest2_Prequest = "Ja, Yuka Schraubstutz"
Inst5Quest2_Folgequest = "Nein"
Inst5Quest2PreQuest = "true"
--
Inst5Quest2name1 = "Groll-Stiefel"
Inst5Quest2name2 = "Bußwerk-Schiftung"
Inst5Quest2name3 = "Stahlschienenrüstung"

--Quest 3 Alliance
Inst5Quest3 = "3. Der Liebestrank"
Inst5Quest3_Level = "54"
Inst5Quest3_Attain = "50"
Inst5Quest3_Aim = "Bringt 4 Gromsblut-Kräuter, 10 Riesensilbervenen und Nagmaras gefüllte Phiole zu Herrin Nagmara in den Schwarzfelstiefen."
Inst5Quest3_Location = "Herrin Nagmara (Schwarzfelstiefen; "..YELLOW.."[15]"..WHITE..")"
Inst5Quest3_Note = "Die Riesensilbervenen bekommt man von Riesen in Azshara. Gromsblut kann man von Kräuterkundignen oder im Auktionshaus bekommen. Die Phiole kann man beim Go-Lakka Krater (Un'Goro Krater; "..YELLOW.."31,50"..WHITE..") auffüllen.\nWenn man das Quest abgeschloßen hat, muss man nicht zwingend Phalanx töten, man kann auch durch die Hintertür verschwinden."
Inst5Quest3_Prequest = "Nein"
Inst5Quest3_Folgequest = "Nein"
--
Inst5Quest3name1 = "Handfessel-Manschetten"
Inst5Quest3name2 = "Nagmaras Peitschen-Gürtel"

--Quest 4 Alliance
Inst5Quest4 = "4. Hurley Pestatem"
Inst5Quest4_Level = "55"
Inst5Quest4_Attain = "50"
Inst5Quest4_Aim = "Bringt Ragnar Donnerbräu in Kharanos das gestohlene Donnerbräurezept."
Inst5Quest4_Location = "Ragnar Donnerbräu  (Dun Morogh - Kharanos; "..YELLOW.."46,52"..WHITE..")"
Inst5Quest4_Note = "Das Vorquest gibt es bei Enohar Donnerbräu (Verwüstete Lande - Nethergarde; "..YELLOW.."61,18"..WHITE..").\nDas Rezept gibt es von einer der Wachen die erscheinen, wenn ihr Fässer in der Taverne "..YELLOW.."[15]"..WHITE.." zerstört."
Inst5Quest4_Prequest = "Ja, Ragnar Donnerbräu"
Inst5Quest4_Folgequest = "Nein"
Inst5Quest4PreQuest = "true"
--
Inst5Quest4name1 = "Dunkles zwergisches Lagerbier"
Inst5Quest4name2 = "Hurtigschlagknüppel"
Inst5Quest4name3 = "Gliedmaßenspaltbeil"

--Quest 5 Alliance  
Inst5Quest5 = "5. Übermeister Pyron"
Inst5Quest5_Level = "52"
Inst5Quest5_Attain = "48"
Inst5Quest5_Aim = "Erschlagt Übermeister Pyron und kehrt dann zu Jalinda Sprig zurück."
Inst5Quest5_Location = "Jalinda Sprig (Brennende Steppe - Morgans Wacht; "..YELLOW.."85,69"..WHITE..")"
Inst5Quest5_Note = "Übermeister Pyron ist ein Feuerelementar außerhalb der Instanz. Er befindet sich bei "..YELLOW.."[24]"..WHITE.." auf der Schwarzfelstiefenkarte und bei "..YELLOW.."[1]"..WHITE.." auf der Schwarzfels-Eingangskarte."
Inst5Quest5_Prequest = "Nein"
Inst5Quest5_Folgequest = "Ja, Incendius!"
-- No Rewards for this quest

--Quest 6 Alliance
Inst5Quest6 = "6. Incendius!"
Inst5Quest6_Level = "56"
Inst5Quest6_Attain = "48"
Inst5Quest6_Aim = "Sucht Lord Incendius in den Schwarzfelstiefen und vernichtet ihn!"
Inst5Quest6_Location = "Jalinda Sprig (Brennende Steppe - Morgans Wacht; "..YELLOW.."85,69"..WHITE..")"
Inst5Quest6_Note = "Das Vorquest bekommt man auch von Jalinda Sprig. Lord Incendius befindet sich bei "..YELLOW.."[10]"..WHITE.."."
Inst5Quest6_Prequest = "Ja, Übermeister Pyron"
Inst5Quest6_Folgequest = "Nein"
Inst5Quest6FQuest = "true"
--
Inst5Quest6name1 = "Sonnentuchcape"
Inst5Quest6name2 = "Nachtlauerhandschuhe"
Inst5Quest6name3 = "Gruftdämonen-Armschienen"
Inst5Quest6name4 = "Wackere Umklammerung"

--Quest 7 Alliance
Inst5Quest7 = "7. Das Herz des Berges"
Inst5Quest7_Level = "55"
Inst5Quest7_Attain = "50"
Inst5Quest7_Aim = "Bringt das 'Herz des Berges' zu Maxwort Funkelglanz in der brennenden Steppe."
Inst5Quest7_Location = "Maxwort Funkelglanz (Brennende Steppe - Flammenkamm; "..YELLOW.."65,23"..WHITE..")"
Inst5Quest7_Note = "Das Herz des Berges befindet sich bei "..YELLOW.."[8]"..WHITE.." in einem Safe. Den Schlüssel für den Safe bekommt man von Wachmann Stahlgriff, der erscheint wenn man alle kleinen Safes geöffnet hat."
Inst5Quest7_Prequest = "Nein"
Inst5Quest7_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 8 Alliance
Inst5Quest8 = "8. Feine Sachen"
Inst5Quest8_Level = "56"
Inst5Quest8_Attain = "50"
Inst5Quest8_Aim = "Reist in die Schwarzfelstiefen und holt 20 Dunkeleisengürteltaschen. Kehrt zu Oralius zurück, sobald die Aufgabe erledigt ist. Ihr nehmt an, dass die Dunkeleisenzwerge in den Schwarzfelstiefen diese 'Gürteltaschen'-Dinger tragen."
Inst5Quest8_Location = "Oralius (Brennende Steppe - Morgans Wacht; "..YELLOW.."84,68"..WHITE..")"
Inst5Quest8_Note = "Alle Zwergen können die Taschen droppen."
Inst5Quest8_Prequest = "Nein"
Inst5Quest8_Folgequest = "Nein"
--
Inst5Quest8name1 = "Eine schmuddelige Gürteltasche"

--Quest 9 Alliance
Inst5Quest9 = "9. Marschall Windsor"
Inst5Quest9_Level = "54"
Inst5Quest9_Attain = "48"
Inst5Quest9_Aim = "Reist zum Schwarzfels im Nordwesten und dann weiter zu den Schwarzfelstiefen. Findet heraus, was aus Marschall Windsor geworden ist.\nIhr erinnert Euch daran, dass der struppige John sagte, man hätte Windsor in ein Gefängnis verschleppt."
Inst5Quest9_Location = "Marshall Maxwell (Brennende Steppe - Morgans Wacht; "..YELLOW.."84,68"..WHITE..")"
Inst5Quest9_Note = "Dieses Quest ist Teil der Onyxia Zugangsquestreihe. Sie beginnt bei Helendis Flusshorn (Brennende Steppe - Morgans Wacht; "..YELLOW.."85,68"..WHITE..").\nMarshall Windsor befindet sich bei "..YELLOW.."[4]"..WHITE..". Für das Folgequest müsst ihr zu Maxwell zurückkehren."
Inst5Quest9_Prequest = "Ja, Drachkin-Bedrohung -> Die wahren Meister"
Inst5Quest9_Folgequest = "Ja, Verlorene Hoffnung -> Eine zusammengeknüllte Notiz"
Inst5Quest9PreQuest = "true"
--
Inst5Quest9name1 = "Konservator-Helm"
Inst5Quest9name2 = "Schildplattensabatons"
Inst5Quest9name3 = "Scherwindgamaschen"

--Quest 10 Alliance
Inst5Quest10 = "10. Eine zusammengeknüllte Notiz"
Inst5Quest10_Level = "58"
Inst5Quest10_Attain = "50"
Inst5Quest10_Aim = "Soeben seid Ihr auf etwas gestoßen, das Marschall Windsor mit Sicherheit sehr interessiert. Vielleicht besteht ja doch noch Hoffnung."
Inst5Quest10_Location = "Eine zusammengeknüllte Notiz (Zufälliger Dropp in den Schwarzfelstiefen)"
Inst5Quest10_Note = "Dieses Quest ist Teil der Onyxia Zugangsquestreihe. Marshall Windsor befindet sich bei "..YELLOW.."[4]"..WHITE..". Die besten Chancen auf einen Dropp scheint man bei den Dunkeleisen Mobs um den Steinbruch zu haben."
Inst5Quest10_Prequest = "Ja, Marshall Windsor"
Inst5Quest10_Folgequest = "Ja, Ein Funken Hoffnung"
Inst5Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst5Quest11 = "11. Ein Funken Hoffnung"
Inst5Quest11_Level = "58"
Inst5Quest11_Attain = "52"
Inst5Quest11_Aim = "Holt Marshall Windsors verloren gegangene Informationen zurück.\nMarshall Windsor glaubt, dass sich die Informationen in den Händen des Golemlords Argelmach und des Generals Zornesschmied befinden."
Inst5Quest11_Location = "Marshall Windsor (Schwarzfelstiefen; "..YELLOW.."[4]"..WHITE..")"
Inst5Quest11_Note = "Dieses Quest ist Teil der Onyxia Zugangsquestreihe. Marshall Windsor befindet sich bei "..YELLOW.."[4]"..WHITE..".\nGolemlord Argelmach befindet sich bei "..YELLOW.."[14]"..WHITE..", General Zornesschmied bei "..YELLOW.."[13]"..WHITE.."."
Inst5Quest11_Prequest = "Ja, Eine zusammengeknüllte Notiz"
Inst5Quest11_Folgequest = "Ja, Gefängnisausbruch!"
Inst5Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst5Quest12 = "12. Gefängnisausbruch!"
Inst5Quest12_Level = "58"
Inst5Quest12_Attain = "52"
Inst5Quest12_Aim = "Helft Marshall Windsor, seine Ausrüstung zurückzuholen und seine Freunde zu befreien. Kehrt zu Marshall Windsor zurück, wenn Ihr Erfolg hattet."
Inst5Quest12_Location = "Marshall Windsor (Schwarzfelstiefen; "..YELLOW.."[4]"..WHITE..")"
Inst5Quest12_Note = "Dieses Quest ist Teil der Onyxia Zugangsquestreihe. Marshall Windsor befindet sich bei "..YELLOW.."[4]"..WHITE..".\nDas Quest ist wesentlich leichter, wenn der Ring des Gesetzes ("..YELLOW.."[6]"..WHITE..") und der Weg zum Eingang vor Beginn von Gegnern befreit wurde. Man findet Marshall Maxwell in der Brennende Steppe - Morgans Wacht ("..YELLOW.."84,68"..WHITE..")"
Inst5Quest12_Prequest = "Ja, Ein Funken Hoffnung"
Inst5Quest12_Folgequest = "Ja, Treffen in Sturmwind"
Inst5Quest12FQuest = "true"
--
Inst5Quest12name1 = "Barriere der Elemente"
Inst5Quest12name2 = "Klinge der Abrechnung"
Inst5Quest12name3 = "Geschickte Kampfklinge"

--Quest 13 Alliance
Inst5Quest13 = "13. Eine Kostprobe der Flamme"
Inst5Quest13_Level = "58"
Inst5Quest13_Attain = "52"
Inst5Quest13_Aim = "Begebt Euch in die Schwarzfelstiefen und tötet Bael'Gar. "..YELLOW.."[...]"..WHITE.." Bringt die eingeschlossene feurige Essenz zu Cyrus Therepentous zurück."
Inst5Quest13_Location = "Cyrus Therepentous (Brennende Steppe; "..YELLOW.."94,31"..WHITE..")"
Inst5Quest13_Note = "Die Questreihe startet bei Kalaran Windklinge (Sengende Schlucht; "..YELLOW.."39,38"..WHITE..").\nBael'Gar befindet sich bei "..YELLOW.."[11]"..WHITE.."."
Inst5Quest13_Prequest = "Ja, Die fehlerlose Flamme -> Eine Kostprobe der Flamme"
Inst5Quest13_Folgequest = "Nein"
Inst5Quest13PreQuest = "true"
--
Inst5Quest13name1 = "Schieferhautcape"
Inst5Quest13name2 = "Wyrmbalg-Schiftung"
Inst5Quest13name3 = "Valconische Schärpe"

--Quest 14 Alliance
Inst5Quest14 = "14. Kharan Hammermacht"
Inst5Quest14_Level = "59"
Inst5Quest14_Attain = "50"
Inst5Quest14_Aim = "Begebt Euch in die Schwarzfelstiefen und findet Kharan Hammermacht.\nDer König erwähnte, dass Kharan dort gefangen sei - vielleicht solltet Ihr nach einem Gefängnis Ausschau halten."
Inst5Quest14_Location = "König Magni Bronzebart (Eisenschmiede; "..YELLOW.."39,55"..WHITE..")"
Inst5Quest14_Note = "Das Vorquest startet bei Königliche Historikerin Archesonus (Eisenschmiede; "..YELLOW.."38,55"..WHITE.."). Kharan Hammermacht befindet sich bei "..YELLOW.."[2]"..WHITE.."."
Inst5Quest14_Prequest = "Ja, Die glimmenden Ruinen von Thaurissan"
Inst5Quest14_Folgequest = "Ja, Der Überbringer schlechter Botschaften"
Inst5Quest14PreQuest = "true"
-- No Rewards for this quest

--Quest 15 Alliance
Inst5Quest15 = "15. Das Schicksal des Königreichs"
Inst5Quest15_Level = "59"
Inst5Quest15_Attain = "51"
Inst5Quest15_Aim = "Kehrt in die Schwarzfelstiefen zurück und rettet Prinzessin Moira Bronzebart aus den Fängen des bösen Imperators Dagran Thaurissan."
Inst5Quest15_Location = "König Magni Bronzebart (Eisenschmiede; "..YELLOW.."39,55"..WHITE..")"
Inst5Quest15_Note = "Prinzessin Moira Bronzebart befindet sich bei "..YELLOW.."[21]"..WHITE..". Während des Kampfs versucht sie Dagran zu heilen. Versucht ihre Zauber so oft wie möglich zu unterbrechen. Aber Beeilung, sie darf auf keinen Fall sterben, sonst könnt ihr das Quest nicht abschließen! Sobald ihr mit ihr geredet habt kehrt zu Magni Bronzebart zurück."
Inst5Quest15_Prequest = "Ja, Der Überbringer schlechter Botschaften"
Inst5Quest15_Folgequest = "Ja, Die Überraschung der Prinzessin"
Inst5Quest15FQuest = "true"
--
Inst5Quest15name1 = "Magnis Wille"
Inst5Quest15name2 = "Liedstein von Eisenschmiede"

--Quest 16 Alliance
Inst5Quest16 = "16. Abstimmung mit dem Kern"
Inst5Quest16_Level = "60"
Inst5Quest16_Attain = "55"
Inst5Quest16_Aim = "Begebt Euch zum Portal in den Schwarzfelstiefen, das in den geschmolzenen Kern führt, und findet ein Kernfragment. Kehrt mit dem Fragment zu Lothos Felsspalter am Schwarzfels zurück."
Inst5Quest16_Location = "Lothos Felsspalter (Der Schwarzfels; "..YELLOW.."[2] auf der Eingangskarte"..WHITE..")"
Inst5Quest16_Note = "Wenn man diese Quest abgeschlossen hat, kann man den Stein neben Lothos Felsspalter benutzen um den Geschmolzenen Kern zu betreten.\nDas Kernfragment findet man vor dem Portal zum gescmolzenen Kern bei "..YELLOW.."[23]"..WHITE.."."
Inst5Quest16_Prequest = "Nein"
Inst5Quest16_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 17 Alliance
Inst5Quest17 = "17. Die Herausforderung"
Inst5Quest17_Level = "60"
Inst5Quest17_Attain = "60"
Inst5Quest17_Aim = "Reist zum Ring des Gesetzes der Schwarzfelstiefen und errichtet das Banner der Provokation in dessen Mitte, während Ihr von Oberrichter Grimmstein verurteilt werdet. Tötet Theldren und seine Gladiatoren und kehrt dann mit dem ersten Stück von Lord Valthalaks Amulett zu Anthion Harmon in den östlichen Pestländern zurück."
Inst5Quest17_Location = "Falrin Rankenweber (Düsterbruch West; "..YELLOW.."[1] Bücherei"..WHITE..")"
Inst5Quest17_Note = "Das Folgequest ist für alle Klassen unterschiedlich."
Inst5Quest17_Prequest = "Nein"
Inst5Quest17_Folgequest = "Ja, (Klassen Quests)"
-- No Rewards for this quest

--Quest 18 Alliance
Inst5Quest18 = "18. Der spektrale Kelch"
Inst5Quest18_Level = "55"
Inst5Quest18_Attain = "55"
Inst5Quest18_Aim = "Lege die Materialien, die Dunk'rel möchte in den spektralen Kelch."
Inst5Quest18_Location = "Dunk'rel (Schwarzfelstiefen; "..YELLOW.."[18]"..WHITE..")"
Inst5Quest18_Note = "Nur Bergbauer mit Skill 230 oder höher können diese Quest annehmen, um das Schmelzen von Dunkeleisenerz zu lernen. Materialien für den Kelch: 2 [Sternrubin], 20 [Goldbarren], 10 [Echtsilberbarren]. Nachher, wenn man ein [Dunkeleisenerz] habt, kann man es zur schwarzen Schmiede bei "..YELLOW.."[22]"..WHITE.." bringen und es schmelzen."
Inst5Quest18_Prequest = "Nein"
Inst5Quest18_Folgequest = "Nein"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst5Quest1_HORDE = Inst5Quest1
Inst5Quest1_HORDE_Level = Inst5Quest1_Level
Inst5Quest1_HORDE_Attain = Inst5Quest1_Attain
Inst5Quest1_HORDE_Aim = Inst5Quest1_Aim
Inst5Quest1_HORDE_Location = Inst5Quest1_Location
Inst5Quest1_HORDE_Note = Inst5Quest1_Note
Inst5Quest1_HORDE_Prequest = Inst5Quest1_Prequest
Inst5Quest1_HORDE_Folgequest = Inst5Quest1_Folgequest
--
Inst5Quest1name1_HORDE = Inst5Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst5Quest2_HORDE = Inst5Quest2
Inst5Quest2_HORDE_Level = Inst5Quest2_Level
Inst5Quest2_HORDE_Attain = Inst5Quest2_Attain
Inst5Quest2_HORDE_Aim = Inst5Quest2_Aim
Inst5Quest2_HORDE_Location = Inst5Quest2_Location
Inst5Quest2_HORDE_Note = Inst5Quest2_Note
Inst5Quest2_HORDE_Prequest = Inst5Quest2_Prequest
Inst5Quest2_HORDE_Folgequest = Inst5Quest2_Folgequest
Inst5Quest2PreQuest_HORDE = Inst5Quest2PreQuest
--
Inst5Quest2name1_HORDE = Inst5Quest2name1
Inst5Quest2name2_HORDE = Inst5Quest2name2
Inst5Quest2name3_HORDE = Inst5Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst5Quest3_HORDE = Inst5Quest3
Inst5Quest3_HORDE_Level = Inst5Quest3_Level
Inst5Quest3_HORDE_Attain = Inst5Quest3_Attain
Inst5Quest3_HORDE_Aim = Inst5Quest3_Aim
Inst5Quest3_HORDE_Location = Inst5Quest3_Location
Inst5Quest3_HORDE_Note = Inst5Quest3_Note
Inst5Quest3_HORDE_Prequest = Inst5Quest3_Prequest
Inst5Quest3_HORDE_Folgequest = Inst5Quest3_Folgequest
--
Inst5Quest3name1_HORDE = Inst5Quest3name1
Inst5Quest3name2_HORDE = Inst5Quest3name2

--Quest 4 Horde
Inst5Quest4_HORDE = "4. Verlorenes Donnerbräurezept"
Inst5Quest4_HORDE_Level = "55"
Inst5Quest4_HORDE_Attain = "50"
Inst5Quest4_HORDE_Aim = "Bringt Vivian Lagrave in Kargath das gestohlene Donnerbräurezept."
Inst5Quest4_HORDE_Location = "Schattenmagierin Vivian Lagrave (Ödland - Kargath; "..YELLOW.."2,47"..WHITE..")"
Inst5Quest4_HORDE_Note = "Das Vorquest bekommt man bei Apothekerin Zinge in Unterstadt - Das Apothekarium ("..YELLOW.."50,68"..WHITE..").\nDas Rezept gibt es bei einem der Wachen die erscheinen, wenn ihr die Fässer in der Taverne "..YELLOW.."[15]"..WHITE.." zerstört."
Inst5Quest4_HORDE_Prequest = "Ja, Vivian Lagrave"
Inst5Quest4_HORDE_Folgequest = "Nein"
Inst5Quest4PreQuest_HORDE = "true"
--
Inst5Quest4name1_HORDE = "Überragender Heiltrank"
Inst5Quest4name2_HORDE = "Großer Manatrank"
Inst5Quest4name3_HORDE = "Hurtigschlagknüppel"
Inst5Quest4name4_HORDE = "Gliedmaßenspaltbeil"

--Quest 5 Horde  (same as Quest 6 Alliance)
Inst5Quest5_HORDE = "5. Das Herz des Berges"
Inst5Quest5_HORDE_Level = Inst5Quest6_Level
Inst5Quest5_HORDE_Attain = Inst5Quest6_Attain
Inst5Quest5_HORDE_Aim = Inst5Quest6_Aim
Inst5Quest5_HORDE_Location = Inst5Quest6_Location
Inst5Quest5_HORDE_Note = Inst5Quest6_Note
Inst5Quest5_HORDE_Prequest = Inst5Quest6_Prequest
Inst5Quest5_HORDE_Folgequest = Inst5Quest6_Folgequest
-- No Rewards for this quest

--Quest 6 Horde
Inst5Quest6_HORDE = "6. SOFORT TÖTEN: Dunkeleisenzwerge"
Inst5Quest6_HORDE_Level = "52"
Inst5Quest6_HORDE_Attain = "48"
Inst5Quest6_HORDE_Aim = "Kriegsherr Bluthauer möchte, dass Ihr 15 Gardisten der Zorneshämmer, 10 Aufseher der Zorneshämmer und 5 Fußsoldaten der Zorneshämmer tötet. Kehrt zu ihm zurück, sobald Ihr die Aufgabe erfüllt habt."
Inst5Quest6_HORDE_Location = "'GESUCHT'-Schild (Ödland - Kargath; "..YELLOW.."3,47"..WHITE..")"
Inst5Quest6_HORDE_Note = "Man findet die Zwerge im ersten Abschnitt der Schwarzfelstiefen.\nKriegsherr Bluthauer befindet sich in Kargath auf dem Turm (Ödland, "..YELLOW.."5,47"..WHITE..")."
Inst5Quest6_HORDE_Prequest = "Nein"
Inst5Quest6_HORDE_Folgequest = "Ja, SOFORT TÖTEN: Hochrangige Führungskräfte der Dunkeleisenzwerge"
-- No Rewards for this quest

--Quest 7 Horde
Inst5Quest7_HORDE = "7. SOFORT TÖTEN: Hochrangige Führungskräfte der Dunkeleisenzwerge"
Inst5Quest7_HORDE_Level = "54"
Inst5Quest7_HORDE_Attain = "49"
Inst5Quest7_HORDE_Aim = "Kriegsherr Bluthauer möchte, dass Ihr 10 Sanitäter der Zorneshämmer, 10 Soldaten der Zorneshämmer und 10 Offiziere der Zorneshämmer tötet. Kehrt zu ihm zurück, sobald Ihr die Aufgabe erfüllt habt."
Inst5Quest7_HORDE_Location = "'GESUCHT'-Schild (Ödland - Kargath; "..YELLOW.."3,47"..WHITE..")"
Inst5Quest7_HORDE_Note = "Man findet die Zwerge in der Nähe von Bael'Gar "..YELLOW.."[11]"..WHITE..". Kriegsherr Bluthauer befindet sich in Kargath auf dem Turm (Ödland, "..YELLOW.."5,47"..WHITE..").\nDas Folgequest beginnt bei Lexlort (Ödland - Kargath; "..YELLOW.."5,47"..WHITE.."). Grark Lorkrub findet man in der Brennenden Steppe ("..YELLOW.."38,35"..WHITE.."). Nachdem man ihn auf 50% seiner Lebenspunkte gebracht hat, startet er ein Eskortquest."
Inst5Quest7_HORDE_Prequest = "Ja, SOFORT TÖTEN: Dunkeleisenzwerge"
Inst5Quest7_HORDE_Folgequest = "Ja, Grark Lorkrub -> Gefährliche Zwickmühle (Eskortquest)"
Inst5Quest7FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 8 Horde
Inst5Quest8_HORDE = "8. Operation: Tod dem Zornesschmied"
Inst5Quest8_HORDE_Level = "58"
Inst5Quest8_HORDE_Attain = "54"
Inst5Quest8_HORDE_Aim = "Begebt Euch zu den Schwarzfelstiefen und eliminiert General Zornesschmied! Kehrt zum Kriegsherrn Bluthauer zurück, sobald Ihr diese Aufgabe erledigt habt."
Inst5Quest8_HORDE_Location = "Kriegsherr Bluthauer (Ödland - Kargath; "..YELLOW.."5,47"..WHITE..")"
Inst5Quest8_HORDE_Note = "Man findet General Zornesschmied bei "..YELLOW.."[13]"..WHITE..". Wenn er bei ca. 30% ist ruft er nach Verstärkung!"
Inst5Quest8_HORDE_Prequest = "Ja, Gefährliche Zwickmühle"
Inst5Quest8_HORDE_Folgequest = "Nein"
Inst5Quest8FQuest_HORDE = "true"
--
Inst5Quest8name1_HORDE = "Medaillon des Eroberers"

--Quest 9 Horde
Inst5Quest9_HORDE = "9. Aufstieg der Maschinen"
Inst5Quest9_HORDE_Level = "58"
Inst5Quest9_HORDE_Attain = "52"
Inst5Quest9_HORDE_Aim = "Sucht und tötet Golemlord Argelmach. Bringt Lotwil seinen Kopf. Außerdem müsst Ihr 10 intakte Elementarkerne von den Wuthäschergolems und Kriegshetzerkonstrukten, die Argelmach beschützen, beschaffen."
Inst5Quest9_HORDE_Location = "Lotwil Veriatus (Ödland; "..YELLOW.."25,44"..WHITE..")"
Inst5Quest9_HORDE_Note = "Das Vorquest bekommt man bei Hierophantin Theodora Mulvadania (Ödland - Kargath; "..YELLOW.."3,47"..WHITE..").\nMan findet Argelmach bei "..YELLOW.."[14]"..WHITE.."."
Inst5Quest9_HORDE_Prequest = "Ja, Aufstieg der Maschinen"
Inst5Quest9_HORDE_Folgequest = "Nein"
Inst5Quest9PreQuest_HORDE = "true"
--
Inst5Quest9name1_HORDE = "Azurblaue Mondamicia"
Inst5Quest9name2_HORDE = "Regenzauberer-Tuch"
Inst5Quest9name3_HORDE = "Basaltschuppenrüstung"
Inst5Quest9name4_HORDE = "Lavaplattenstulpen"

--Quest 10 Horde  (same as Quest 12 Alliance)
Inst5Quest10_HORDE = "10. Eine Kostprobe der Flamme"
Inst5Quest10_HORDE_Level = Inst5Quest12_Level
Inst5Quest10_HORDE_Attain = Inst5Quest12_Attain
Inst5Quest10_HORDE_Aim = Inst5Quest12_Aim
Inst5Quest10_HORDE_Location = Inst5Quest12_Location
Inst5Quest10_HORDE_Note = Inst5Quest12_Note
Inst5Quest10_HORDE_Prequest = Inst5Quest12_Prequest
Inst5Quest10_HORDE_Folgequest = Inst5Quest12_Folgequest
Inst5Quest10PreQuest_HORDE = Inst5Quest12PreQuest
--
Inst5Quest10name1_HORDE = Inst5Quest12name1
Inst5Quest10name2_HORDE = Inst5Quest12name2
Inst5Quest10name3_HORDE = Inst5Quest12name3

--Quest 11 Horde
Inst5Quest11_HORDE = "11. Disharmonie der Flamme"
Inst5Quest11_HORDE_Level = "52"
Inst5Quest11_HORDE_Attain = "48"
Inst5Quest11_HORDE_Aim = "Reist zum Steinbruch am Schwarzfels und tötet Übermeister Pyron. Kehrt zu Donnerherz zurück, sobald Ihr den Auftrag erledigt habt."
Inst5Quest11_HORDE_Location = "Donnerherz (Ödland - Kargath; "..YELLOW.."3,48"..WHITE..")"
Inst5Quest11_HORDE_Note = "Übermeister Pyron ist ein Feuer Elementar außerhalb der Instanz. Er befindet sich bei "..YELLOW.."[24]"..WHITE.." auf der Schwarzfelstiefenkarte und bei "..YELLOW.."[1]"..WHITE.." auf der Schwarzfels Eingangskarte."
Inst5Quest11_HORDE_Prequest = "Nein"
Inst5Quest11_HORDE_Folgequest = "Ja, Disharmonie des Feuers"
-- No Rewards for this quest

--Quest 12 Horde
Inst5Quest12_HORDE = "12. Disharmonie des Feuers"
Inst5Quest12_HORDE_Level = "56"
Inst5Quest12_HORDE_Attain = "48"
Inst5Quest12_HORDE_Aim = "Betretet die Schwarzfelstiefen und spürt Lord Incendius auf. Tötet ihn und bringt jegliche Informationsquelle, die Ihr finden könnt, zu Donnerherz."
Inst5Quest12_HORDE_Location = "Donnerherz (Ödland - Kargath; "..YELLOW.."3,48"..WHITE..")"
Inst5Quest12_HORDE_Note = "Das Vorquest bekommt man auch von Donnerherz.\nLord Incendius befindet sich bei "..YELLOW.."[10]"..WHITE.."."
Inst5Quest12_HORDE_Prequest = "Ja, Disharmonie der Flamme"
Inst5Quest12_HORDE_Folgequest = "Nein"
Inst5Quest12FQuest_HORDE = "true"
--
Inst5Quest12name1_HORDE = "Sonnentuchcape"
Inst5Quest12name2_HORDE = "Nachtlauerhandschuhe"
Inst5Quest12name3_HORDE = "Gruftdämonen-Armschienen"
Inst5Quest12name4_HORDE = "Wackere Umklammerung"

--Quest 13 Horde
Inst5Quest13_HORDE = "13. Das letzte Element"
Inst5Quest13_HORDE_Level = "54"
Inst5Quest13_HORDE_Attain = "48"
Inst5Quest13_HORDE_Aim = "Begebt Euch in die Schwarzfelstiefen und beschafft 10 Essenzen der Elemente. Euer erster Gedanke ist, die Golems und die Schöpfer der Golems zu suchen. Doch Ihr erinnert Euch, dass Vivian Lagrave auch etwas von Elementaren vor sich hingemurmelt hat."
Inst5Quest13_HORDE_Location = "Schattenmagierin Vivian Lagrave (Ödland - Kargath; "..YELLOW.."2,47"..WHITE..")"
Inst5Quest13_HORDE_Note = "Das Vorquest bekommt man von Donnerherz (Ödland - Kargath; "..YELLOW.."3,48"..WHITE..").\nAlle Elementare droppen die Essenzen."
Inst5Quest13_HORDE_Prequest = "Ja, Disharmonie der Flamme"
Inst5Quest13_HORDE_Folgequest = "Nein"
Inst5Quest13PreQuest_HORDE = "true"
--
Inst5Quest13name1_HORDE = "Lagraves Siegel"

--Quest 14 Horde
Inst5Quest14_HORDE = "14. Kommandant Gor'shak"
Inst5Quest14_HORDE_Level = "52"
Inst5Quest14_HORDE_Attain = "48"
Inst5Quest14_HORDE_Aim = "Sucht Kommandant Gor'shak in den Schwarzfelstiefen.\nIhr erinnert Euch, dass auf dem primitiv gezeichneten Bild des Orcs auch Gitter vor dem Gesicht zu sehen waren. Vielleicht solltet Ihr nach einer Art Gefängnis suchen."
Inst5Quest14_HORDE_Location = "Galamav der Schütze (Ödland - Kargath; "..YELLOW.."5,47"..WHITE..")"
Inst5Quest14_HORDE_Note = "Das Vorquest bekommt man von Donnerherz (Ödland - Kargath; "..YELLOW.."3,48"..WHITE..").\nKommandant Gor'shak befindet sich bei "..YELLOW.."[3]"..WHITE..". Der Schlüssel, um die Zelle zu öffnen droppt von Verhörmeisterin Gerstahn "..YELLOW.."[5]"..WHITE..". Wenn man das Folgequest startet spawnen mehrere Gegner."
Inst5Quest14_HORDE_Prequest = "Ja, Disharmonie der Flamme"
Inst5Quest14_HORDE_Folgequest = "Ja, Was ist los?"
Inst5Quest14PreQuest_HORDE = "true"

--Quest 15 Horde
Inst5Quest15_HORDE = "15. Die königliche Rettung"
Inst5Quest15_HORDE_Level = "59"
Inst5Quest15_HORDE_Attain = "50"
Inst5Quest15_HORDE_Aim = "Tötet Imperator Dagran Thaurissan und befreit Prinzessin Moira Bronzebart von seinem bösen Zauber."
Inst5Quest15_HORDE_Location = "Thrall (Orgrimmar; "..YELLOW.."31,37"..WHITE..")"
Inst5Quest15_HORDE_Note = "Nachdem man mit Kharan Hammermacht und Thrall geredet hat bekommt man diese Quest.\nMan findet Imperator Dagran Thaurissan bei "..YELLOW.."[21]"..WHITE..". Die Prinzessin heilt Dagran während des Kampfs, sie darf aber auf keinen Fall sterben, sonst kann man das Quest nicht abschließen! Versucht ihre Heilungzauber zu unterbrechen. (Die Belohungen sind für 'Ist die Prinzessin gerettet?')"
Inst5Quest15_HORDE_Prequest = "Ja, Kommandant Gor'shak"
Inst5Quest15_HORDE_Folgequest = "Ja, Ist die Prinzessin gerettet?"
Inst5Quest15FQuest_HORDE = "true"
--
Inst5Quest15name1_HORDE = "Thralls Entschlossenheit"
Inst5Quest15name2_HORDE = "Auge von Orgrimmar"

--Quest 16 Horde  (same as Quest 16 Alliance)
Inst5Quest16_HORDE = Inst5Quest16
Inst5Quest16_HORDE_Level = Inst5Quest16_Level
Inst5Quest16_HORDE_Attain = Inst5Quest16_Attain
Inst5Quest16_HORDE_Aim = Inst5Quest16_Aim
Inst5Quest16_HORDE_Location = Inst5Quest16_Location
Inst5Quest16_HORDE_Note = Inst5Quest16_Note
Inst5Quest16_HORDE_Prequest = Inst5Quest16_Prequest
Inst5Quest16_HORDE_Folgequest = Inst5Quest16_Folgequest
-- No Rewards for this quest

--Quest 17 Horde  (same as Quest 17 Alliance)
Inst5Quest17_HORDE = Inst5Quest17
Inst5Quest17_HORDE_Level = Inst5Quest17_Level
Inst5Quest17_HORDE_Attain = Inst5Quest17_Attain
Inst5Quest17_HORDE_Aim = Inst5Quest17_Aim
Inst5Quest17_HORDE_Location = Inst5Quest17_Location
Inst5Quest17_HORDE_Note = Inst5Quest17_Note
Inst5Quest17_HORDE_Prequest = Inst5Quest17_Prequest
Inst5Quest17_HORDE_Folgequest = Inst5Quest17_Folgequest
-- No Rewards for this quest

--Quest 18 Horde  (same as Quest 18 Alliance)
Inst5Quest18_HORDE = Inst5Quest18
Inst5Quest18_HORDE_Level = Inst5Quest18_Level
Inst5Quest18_HORDE_Attain = Inst5Quest18_Attain
Inst5Quest18_HORDE_Aim = Inst5Quest18_Aim
Inst5Quest18_HORDE_Location = Inst5Quest18_Location
Inst5Quest18_HORDE_Note = Inst5Quest18_Note
Inst5Quest18_HORDE_Prequest = Inst5Quest18_Prequest
Inst5Quest18_HORDE_Folgequest = Inst5Quest18_Folgequest
-- No Rewards for this quest



--------------- INST6 - Blackwing Lair (BWL) ---------------

Inst6Story = {
  ["Page1"] = "Nefarians Heiligtum, der Pechschwingenhort, befindet sich am höchsten Punkt der Zitadelle des Schwarzfels. Dort, in den finsteren Nischen der zerklüfteten Bergspitze, setzt Nefarian nun die letzten Schritte seines teuflischen Plans in Gang, um Ragnaros ein für allemal zu vernichten und mit seiner Armee die Herrschaft über alle Völker Azeroths an sich zu reißen.",
  ["Page2"] = "Die mächtige Festung, die aus der feurigen Flanke des Schwarzfels herausgeschnitten wurde, geht auf Entwürfe des zwergischen Meistersteinmetzes Franclorn Schmiedevater zurück. Jahrhunderte lang war die Zitadelle das Symbol der Macht des Dunkeleisen-Clans, das von den Zwergen mit äußerstem Ingrimm verteidigt wurde. Allerdings gab es jemanden, der andere Ziele verfolgte: Nefarian, der listige Sohn des Drachen Todesschwinge, stieg eines Tages mit Flamme und Klaue auf den oberen Teil der Zitadelle hinab und trug zusammen mit seinen drachischen Untergebenen den Kampf bis zu den Stellungen der Zwerge tief unten, bei den vulkanischen Abgründen unter dem Berg, wo Ragnaros der Feuerfürst herrscht. Ragnaros ist es gelungen, das Geheimnis zu lüften, wie Leben aus Stein erschaffen werden kann. Nun plant er, sein neu gewonnenes Wissen dazu einzusetzen, eine Armee unaufhaltsamer Golems zu schaffen, die ihm bei der Eroberung des Schwarzfels helfen sollen.",
  ["Page3"] = "Nefarian will Ragnaros um jeden Preis vernichten. Zu diesem Zweck hat er vor kurzem damit begonnen, seine Macht auszuweiten, so wie sein Vater Todesschwinge es bereits vor langer Zeit versucht hat. Der berechnende Nefarian scheint allerdings dort Erfolg zu haben, wo sein Vater einst versagte. Nefarians krankes Dürsten nach Überlegenheit hat inzwischen auch den Zorn des roten Drachenschwarms auf sich gezogen, der gefährlichsten Feinde des schwarzen Drachenschwarms. Obwohl Nefarians Absichten bekannt sind, bleibt seine Vorgehensweise jedoch ein Geheimnis. Man sagt, dass Nefarian mit dem Blut aller Drachenschwärme experimentiert, um unaufhaltsame Krieger zu erschaffen.\n \nNefarians Heiligtum, der Pechschwingenhort, befindet sich am höchsten Punkt der Zitadelle des Schwarzfels. Dort, in den finsteren Nischen der zerklüfteten Bergspitze, setzt Nefarian nun die letzten Schritte seines teuflischen Plans in Gang, um Ragnaros ein für allemal zu vernichten und mit seiner Armee die Herrschaft über alle Völker Azeroths an sich zu reißen.",
  ["MaxPages"] = "3",
};
Inst6Caption = "Der Pechschwingenhort"
Inst6Caption2 = "Der Pechschwingenhort (Geschichte Teil 1)"
Inst6Caption3 = "Der Pechschwingenhort (Geschichte Teil 2)"

Inst6QAA = "3 Quests"
Inst6QAH = "3 Quests"

--Quest 1 Alliance
Inst6Quest1 = "1. Nefarius' Verderbnis"
Inst6Quest1_Level = "60"
Inst6Quest1_Attain = "60"
Inst6Quest1_Aim = "Tötet Nefarian und bringt den roten Szeptersplitter wieder in Euren Besitz. Bringt den roten Szeptersplitter zu Anachronos in den Höhlen der Zeit in Tanaris. Euch bleiben 5 Stunden, um diese Aufgabe zu erfüllen."
Inst6Quest1_Location = "Vaelastrasz der Verdorbene (Pechschwingenhort; "..YELLOW.."[2]"..WHITE..")"
Inst6Quest1_Note = "Nur eine Person kann den Splitter looten. Anachronos (Tanaris - Höhlen der Zeit; "..YELLOW.."65,49"..WHITE..")"
Inst6Quest1_Prequest = "Nein"
Inst6Quest1_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 2 Alliance
Inst6Quest2 = "2. Der Herrscher des Schwarzfels"
Inst6Quest2_Level = "60"
Inst6Quest2_Attain = "60"
Inst6Quest2_Aim = "Bringt Hochlord Bolvar Drachenwill in Sturmwind den Kopf von Nefarian."
Inst6Quest2_Location = "Kopf von Nefarian (droppt von Nefarian; "..YELLOW.."[9]"..WHITE..")"
Inst6Quest2_Note = "Hochlord Bolvar Drachenwill befindet sich in (Sturmwind - Burg Sturmwind; "..YELLOW.."78,20"..WHITE.."). Das Folgequest schickt euch zu Feldmarschall Afrasiabi (Sturmwind - Tal der Helden; "..YELLOW.."67,72"..WHITE..") für die Belohnung."
Inst6Quest2_Prequest = "Nein"
Inst6Quest2_Folgequest = "Ja, Der Herrscher des Schwarzfels"
--
Inst6Quest2name1 = "Medallion des Meisterdrachentöters"
Inst6Quest2name2 = "Kugel des Meisterdrachentöters"
Inst6Quest2name3 = "Ring des Meisterdrachentöters"

--Quest 3 Alliance
Inst6Quest3 = "3. Nur einer kann sich erheben"
Inst6Quest3_Level = "60"
Inst6Quest3_Attain = "60"
Inst6Quest3_Aim = "Bringt Brutwächter Dreschbringers Kopf zu Baristolth der Sandstürme in die Burg Cenarius in Silithus."
Inst6Quest3_Location = "Kopf des Brutwächters Dreschbringer (droppt von Brutwächter Dreschbringer "..YELLOW.."[3]"..WHITE..")"
Inst6Quest3_Note = "Nur eine Person kann den Kopf looten."
Inst6Quest3_Prequest = "Nein"
Inst6Quest3_Folgequest = "Ja, Der Pfad des Gerechten"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst6Quest1_HORDE = Inst6Quest1
Inst6Quest1_HORDE_Level = Inst6Quest1_Level
Inst6Quest1_HORDE_Attain = Inst6Quest1_Attain
Inst6Quest1_HORDE_Aim = Inst6Quest1_Aim
Inst6Quest1_HORDE_Location = Inst6Quest1_Location
Inst6Quest1_HORDE_Note = Inst6Quest1_Note
Inst6Quest1_HORDE_Prequest = Inst6Quest1_Prequest
Inst6Quest1_HORDE_Folgequest = Inst6Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde
Inst6Quest2_HORDE = "2. Der Herrscher des Schwarzfels"
Inst6Quest2_HORDE_Level = "60"
Inst6Quest2_HORDE_Attain = "60"
Inst6Quest2_HORDE_Aim = "Bringt Thrall in Orgrimmar den Kopf von Nefarian."
Inst6Quest2_HORDE_Location = "Kopf von Nefarian (droppt von Nefarian; "..YELLOW.."[9]"..WHITE..")"
Inst6Quest2_HORDE_Note = "Das Folgequest schickt euch zu Hochfürst Saurfang (Orgrimmar - Tal der Stärke; "..YELLOW.."51,76"..WHITE..") für die Belohnung."
Inst6Quest2_HORDE_Prequest = "Nein"
Inst6Quest2_HORDE_Folgequest = "Ja, Der Herrscher des Schwarzfels"
--
Inst6Quest2name1_HORDE = "Medallion des Meisterdrachentöters"
Inst6Quest2name2_HORDE = "Kugel des Meisterdrachentöters"
Inst6Quest2name3_HORDE = "Ring des Meisterdrachentöters"

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst6Quest3_HORDE = Inst6Quest3
Inst6Quest3_HORDE_Level = Inst6Quest3_Level
Inst6Quest3_HORDE_Attain = Inst6Quest3_Attain
Inst6Quest3_HORDE_Aim = Inst6Quest3_Aim
Inst6Quest3_HORDE_Location = Inst6Quest3_Location
Inst6Quest3_HORDE_Note = Inst6Quest3_Note
Inst6Quest3_HORDE_Prequest = Inst6Quest3_Prequest
Inst6Quest3_HORDE_Folgequest = Inst6Quest3_Folgequest
-- No Rewards for this quest



--------------- INST7 - Blackfathom Deeps (BFD) ---------------

Inst7Story = "Die Tiefschwarze Grotte in der Nähe des Zoramstrandes im Eschental war vor langer Zeit ein Tempel, den die Nachtelfen zu Ehren ihrer Mondgöttin Elune erbaut hatten. Doch als die Welt gespalten wurde versank der Tempel in den Fluten des verhüllten Meeres. Dort ruhte er lange Zeit ungestört, bis eines Tages die Naga und Satyrn auftauchten, angezogen von seiner uralten Kraft, um die Geheimnisse des Tempels zu ergründen. Legenden zufolge soll das uralte Wesen Aku'mai sich ebenfalls in den Ruinen niedergelassen haben. Das liebste Schoßtier der urzeitlichen Götter ist schon oft auf Beutezügen in der Gegend gesichtet worden. Die Gegenwart von Aku'mai hat auch einen Kult mit Namen Schattenhammer angezogen, der sich die bösen Mächte der Alten Götter zunutze machen will."
Inst7Caption = "Die Tiefschwarze Grotte"
Inst7QAA = "6 Quests"
Inst7QAH = "5 Quests"

--Quest 1 Alliance
Inst7Quest1 = "1. Wissen in der Tiefe"
Inst7Quest1_Level = "23"
Inst7Quest1_Attain = "10"
Inst7Quest1_Aim = "Bringt das 'Lorgalismanuskript' zu Gerrig Knochengriff in Eisenschmiede."
Inst7Quest1_Location = "Gerrig Knochengriff (Eisenschmiede - Das Düstere Viertel; "..YELLOW.."50,5"..WHITE..")"
Inst7Quest1_Note = "Das Manuskript befindet sich bei "..YELLOW.."[2]"..WHITE.." im Wasser."
Inst7Quest1_Prequest = "Nein"
Inst7Quest1_Folgequest = "Nein"
--
Inst7Quest1name1 = "Erhaltender Ring"

--Quest 2 Alliance
Inst7Quest2 = "2. Erforschung der Verderbnis"
Inst7Quest2_Level = "24"
Inst7Quest2_Attain = "18"
Inst7Quest2_Aim = "Gershala Nachtraunen in Auberdine möchte 8 verderbte Hirnstämme."
Inst7Quest2_Location = "Gershala Nachtraunen (Dunkelküste - Auberdine; "..YELLOW.."38,43"..WHITE..")"
Inst7Quest2_Note = "Das Vorquest ist optional. Man bekommt es von Argos Nachtraunen (Sturmwind - Der Park; "..YELLOW.."21,55"..WHITE..").\n\nDie Gehirnstämme werden von den Nagas vor und in der Instanz gedroppt."
Inst7Quest2_Prequest = "Ja, Verderbnis in der Fremde"
Inst7Quest2_Folgequest = "Nein"
Inst7Quest2PreQuest = "true"
--
Inst7Quest2name1 = "Käferschnallen"
Inst7Quest2name2 = "Prälaturencape"

--Quest 3 Alliance
Inst7Quest3 = "3. Auf der Suche nach Thaelrid"
Inst7Quest3_Level = "24"
Inst7Quest3_Attain = "18"
Inst7Quest3_Aim = "Sucht Argentumwache Thaelrid in der Tiefschwarzen Grotte auf."
Inst7Quest3_Location = "Dämmerungsbehüter Shaedlass (Darnassus - Terrasse der Handwerker; "..YELLOW.."55,24"..WHITE..")"
Inst7Quest3_Note = "Argentumwache Thaelrid findet man bei "..YELLOW.."[4]"..WHITE.."."
Inst7Quest3_Prequest = "Nein"
Inst7Quest3_Folgequest = "Ja, Schurkerei in der Tiefschwarzen Grotte"
-- No Rewards for this quest

--Quest 4 Alliance
Inst7Quest4 = "4. Schurkerei in der Tiefschwarzen Grotte"
Inst7Quest4_Level = "27"
Inst7Quest4_Attain = "18"
Inst7Quest4_Aim = "Bringt den Kopf von Lord des Schattenhammers Kelris zu Dämmerungsbehüter Selgorm in Darnassus."
Inst7Quest4_Location = "Argentumwache Thaelrid (Tiefschwarze Grotte; "..YELLOW.."[4]"..WHITE..")"
Inst7Quest4_Note = "Der Lord des Schattenhammers Kelris befindet sich bei "..YELLOW.."[8]"..WHITE..". Dämmerungsbehüter Selgorm findet man in Darnassus - Terrasse der Handwerker ("..YELLOW.."55,24"..WHITE..").\n\nVORSICHT! Wenn man die Feuerschalen bei Lord Kelris entzündet, erscheinen mehrere Gegner."
Inst7Quest4_Prequest = "Ja, Auf der Suche nach Thaelrid"
Inst7Quest4_Folgequest = "Nein"
Inst7Quest4FQuest = "true"
--
Inst7Quest4name1 = "Grabsteinszepter"
Inst7Quest4name2 = "Arktischer Rundschild"

--Quest 5 Alliance
Inst7Quest5 = "5. Schatten des Hammers"
Inst7Quest5_Level = "25"
Inst7Quest5_Attain = "20"
Inst7Quest5_Aim = "Bringt 10 Anhänger des Schattenhammerklans zu Argentumwache Manados in Darnassus."
Inst7Quest5_Location = "Argentumwache Manados (Darnassus - Terrasse der Handwerker; "..YELLOW.."55,23"..WHITE..")"
Inst7Quest5_Note = "Alle Schattenhammergegner droppen die Anhänger."
Inst7Quest5_Prequest = "Nein"
Inst7Quest5_Folgequest = "Nein"
--
Inst7Quest5name1 = "Nimbusstiefel"
Inst7Quest5name2 = "Herzholzgurt"

--Quest 6 Alliance
Inst7Quest6 = "6. Die Kugel von Soran'ruk (Hexenmeister)"
Inst7Quest6_Level = "25"
Inst7Quest6_Attain = "20"
Inst7Quest6_Aim = "Sucht 3 Fragmente von Soran'ruk und 1 großes Fragment von Soran'ruk und bringt sie zu Doan Karhan im Brachland."
Inst7Quest6_Location = "Doan Karhan (Brachland; "..YELLOW.."49,57"..WHITE..")"
Inst7Quest6_Note = "Dieses Quest kann nur von Hexenmeistern angenommen werden! Die 3 Fragmente von Soran'ruk werden von den Akolyten des Schattenhammers in der "..YELLOW.."[Tiefschwarzen Grotte]"..WHITE.." gedroppt. Das große Fragment von Soran'ruk bekommt man in "..YELLOW.."[Burg Schattenfang]"..WHITE.." von Dunkelseelen der Schattenfänge."
Inst7Quest6_Prequest = "Nein"
Inst7Quest6_Folgequest = "Nein"
--
Inst7Quest6name1 = "Kugel von Soran'ruk"
Inst7Quest6name2 = "Stab von Soran'ruk"


--Quest 1 Horde
Inst7Quest1_HORDE = "1. Die Essenz von Aku'mai"
Inst7Quest1_HORDE_Level = "22"
Inst7Quest1_HORDE_Attain = "17"
Inst7Quest1_HORDE_Aim = "Bringt 20 Saphire von Aku'mai zu Je'neu Sancrea im Eschental."
Inst7Quest1_HORDE_Location = "Je'neu Sancrea (Eschental - Außenposten von Zoram'gar; "..YELLOW.."11,33"..WHITE..")"
Inst7Quest1_HORDE_Note = "Das Vorquest 'Ärger in der Tiefe' bekommt man von Tsunaman (Steinkrallengebirge - Sonnenfels; "..YELLOW.."47,64"..WHITE.."). Die Saphire findet man in den Tunneln vor der Instanz."
Inst7Quest1_HORDE_Prequest = "Ja, Ärger in der Tiefe"
Inst7Quest1_HORDE_Folgequest = "Nein"
Inst7Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst7Quest2_HORDE = "2. Treue zu den Alten Göttern"
Inst7Quest2_HORDE_Level = "26"
Inst7Quest2_HORDE_Attain = "18"
Inst7Quest2_HORDE_Aim = "Bringt die durchfeuchtete Notiz zu Je'neu Sancrea im Eschental. -> Tötet Lorgus Jett in der Tiefschwarzen Grotte und kehrt dann zu Je'neu Sancrea ins Eschental zurück."
Inst7Quest2_HORDE_Location = "Feuchte Notiz (Dropp - siehe Information)"
Inst7Quest2_HORDE_Note = "Die feuchte Notiz findet man bei Gezeitenpriesterinnen der Tiefschwarzen Grotte (5% Dropprate). Danach bringt sie zu Je'neu Sancrea (Eschental - Außenposten von Zoram'gar; "..YELLOW.."11,33"..WHITE.."). Lorgus Jett findet man bei "..YELLOW.."[6]"..WHITE.."."
Inst7Quest2_HORDE_Prequest = "Nein"
Inst7Quest2_HORDE_Folgequest = "Nein"
--
Inst7Quest2name1_HORDE = "Band der Faust"
Inst7Quest2name2_HORDE = "Kastanienbrauner Mantel"

--Quest 3 Horde
Inst7Quest3_HORDE = "3. Inmitten der Ruinen"
Inst7Quest3_HORDE_Level = "27"
Inst7Quest3_HORDE_Attain = "21"
Inst7Quest3_HORDE_Aim = "Bringt den Tiefenkern zu Je'neu Sancrea beim Außenposten von Zoram'gar im Eschental."
Inst7Quest3_HORDE_Location = "Je'neu Sancrea (Eschental - Außenposten von Zoram'gar; "..YELLOW.."11,33"..WHITE..")"
Inst7Quest3_HORDE_Note = "Den Tiefenkern findet man bei "..YELLOW.."[7]"..WHITE.." im Wasser. Sobald man ihn aufnimmt erscheint Lord Aquanis. Lord Aquanis droppt einen Questgegenstand, welchen man zu Je'neu Sancrea bringen muss."
Inst7Quest3_HORDE_Prequest = "Nein"
Inst7Quest3_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Horde
Inst7Quest4_HORDE = "4. Schurkerei in der Tiefschwarzen Grotte"
Inst7Quest4_HORDE_Level = "27"
Inst7Quest4_HORDE_Attain = "19"
Inst7Quest4_HORDE_Aim = "Bringt den Kopf von Lord des Schattenhammers Kelris zu Bashana Runentotem in Donnerfels."
Inst7Quest4_HORDE_Location = "Argentumwache Thaelrid (Tiefschwarze Grotte; "..YELLOW.."[4]"..WHITE..")"
Inst7Quest4_HORDE_Note = "Der Lord des Schattenhammers Kelris befindet sich bei "..YELLOW.."[8]"..WHITE..". Bashana Runentotem findet man in Donnerfels - Anhöhe der Ältesten ("..YELLOW.."70,33"..WHITE..").\n\nVORSICHT! Wenn man die Feuerschalen bei Lord Kelris entzündet, erscheinen mehrere Gegner."
Inst7Quest4_HORDE_Prequest = "Nein"
Inst7Quest4_HORDE_Folgequest = "Nein"
--
Inst7Quest4name1_HORDE = "Grabsteinszepter"
Inst7Quest4name2_HORDE = "Arktischer Rundschild"

--Quest 5 Horde  (same as Quest 6 Alliance)
Inst7Quest5_HORDE = "5. Die Kugel von Soran'ruk (Hexenmeister)"
Inst7Quest5_HORDE_Level = Inst7Quest6_Level
Inst7Quest5_HORDE_Attain = Inst7Quest6_Attain
Inst7Quest5_HORDE_Aim = Inst7Quest6_Aim
Inst7Quest5_HORDE_Location = Inst7Quest6_Location
Inst7Quest5_HORDE_Note = Inst7Quest6_Note
Inst7Quest5_HORDE_Prequest = Inst7Quest6_Prequest
Inst7Quest5_HORDE_Folgequest = Inst7Quest6_Folgequest
--
Inst7Quest5name1_HORDE = Inst7Quest6name1
Inst7Quest5name2_HORDE = Inst7Quest6name2



--------------- INST8 - Lower Blackrock Spire (LBRS) ---------------

Inst8Story = "Die mächtige Festung, die aus der feurigen Flanke des Schwarzfels herausgeschnitten wurde, geht auf Entwürfe des zwergischen Meistersteinmetzes Franclorn Schmiedevater zurück. Jahrhunderte lang war die Zitadelle ein Symbol der Macht des Dunkeleisenklans, das von den Zwergen mit äußerstem Ingrimm verteidigt wurde. Allerdings gab es jemanden, der andere Pläne für die Zitadelle hatte: Nefarian, der listige Sohn des Drachen Deathwing, stieg eines Tages mit Flamme und Klaue auf den oberen Teil der Zitadelle hinab und trug zusammen mit seinen drachischen Untergebenen den Kampf bis zu den Stellungen der Zwerge tief unten, bei den vulkanischen Abgründen unter dem Berg. Dort erkannte der Drache, dass der Anführer der Zwerge kein geringerer als der Feuerfürst Ragnaros höchstpersönlich war. Nachdem sein Vordringen gestoppt worden war, schwor sich Nefarian, seine Feinde endgültig zu vernichten und somit die Herrschaft über den Schwarzfels an sich zu reißen."
Inst8Caption = "Schwarzfelsspitze (Unten)"
Inst8QAA = "14 Quests"
Inst8QAH = "14 Quests"

--Quest 1 Alliance
Inst8Quest1 = "1. Die letzten Schrifttafeln"
Inst8Quest1_Level = "58"
Inst8Quest1_Attain = "55"
Inst8Quest1_Aim = "Bringt Ausgrabungsleiter Eisenschuh in Tanaris die fünfte und sechste Schrifttafel von Mosh'aru."
Inst8Quest1_Location = "Ausgrabungsleiter Eisenschuh (Tanaris - Dampfdruckpier; "..YELLOW.."66,23"..WHITE..")"
Inst8Quest1_Note = "Die Tafeln findet man bei "..YELLOW.."[7]"..WHITE.." und "..YELLOW.."[9]"..WHITE..".\nDie Belohnungen gehören zum Folgequest 'Konfrontiert Yeh'kinya'. Yeh'kinya findet man nahe bei Ausgrabungsleiter Eisenschuh."
Inst8Quest1_Prequest = "Ja, Die verlorenen Schrifttafeln von Mosh'aru"
Inst8Quest1_Folgequest = "Ja, Konfrontiert Yeh'kinya"
Inst8Quest1PreQuest = "true"
--
Inst8Quest1name1 = "Ausgeblichener Hakkariumhang"
Inst8Quest1name2 = "Zerlumptes Hakkaricape"

--Quest 2 Alliance
Inst8Quest2 = "2. Kiblers Exotische Tiere"
Inst8Quest2_Level = "59"
Inst8Quest2_Attain = "55"
Inst8Quest2_Aim = "Begebt Euch zur Schwarzfelsspitze und sucht Worgwelpen der Blutäxte. Benutzt den Käfig, um die wilden kleinen Bestien zu transportieren. Bringt einen eingesperrten Worgwelpen zu Kibler."
Inst8Quest2_Location = "Kibler (Brennende Steppe - Flammenkamm; "..YELLOW.."65,22"..WHITE..")"
Inst8Quest2_Note = "Die Worgwelpen findet man bei "..YELLOW.."[17]"..WHITE.."."
Inst8Quest2_Prequest = "Nein"
Inst8Quest2_Folgequest = "Nein"
--
Inst8Quest2name1 = "Worgtransportkorb"

--Quest 3 Alliance
Inst8Quest3 = "3. Be-Öh-Es-Eh"
Inst8Quest3_Level = "59"
Inst8Quest3_Attain = "55"
Inst8Quest3_Aim = "Reist zur Schwarzfelsspitze und sammelt 15 Spitzenspinneneier für Kibler."
Inst8Quest3_Location = "Kibler (Brennende Steppe - Flammenkamm; "..YELLOW.."65,22"..WHITE..")"
Inst8Quest3_Note = "Die Spinneneier findet man bei "..YELLOW.."[13]"..WHITE.."."
Inst8Quest3_Prequest = "Nein"
Inst8Quest3_Folgequest = "Nein"
--
Inst8Quest3name1 = "Glimmernetztransportkorb"

--Quest 4 Alliance
Inst8Quest4 = "4. Muttermilch"
Inst8Quest4_Level = "60"
Inst8Quest4_Attain = "55"
Inst8Quest4_Aim = "Ihr findet Mutter Glimmernetz im Herzen der Schwarzfelsspitze. Kämpft mit ihr und bringt sie dazu, Euch zu vergiften. Es kann gut sein, dass Ihr sie sogar töten müsst. Kehrt zum struppigen John zurück, sobald Ihr vergiftet seid, damit er Euch 'melken' kann."
Inst8Quest4_Location = "Struppiger John (Brennende Steppe - Flammenkamm; "..YELLOW.."65,23"..WHITE..")"
Inst8Quest4_Note = "Mutter Glimmernetz findet man bei "..YELLOW.."[13]"..WHITE..". Der Effekt des Giftes wird auch auf alle anderen Spieler in der Nähe übertragen. Das Gift darf nicht entfernt werden, sonst ist das Quest fehlgeschlagen."
Inst8Quest4_Prequest = "Nein"
Inst8Quest4_Folgequest = "Nein"
--
Inst8Quest4name1 = "Der immervolle Becher des struppigen John"

--Quest 5 Alliance
Inst8Quest5 = "5. Stellt sie ab"
Inst8Quest5_Level = "59"
Inst8Quest5_Attain = "55"
Inst8Quest5_Aim = "Begebt Euch zur Schwarzfelsspitze und vernichtet die Quelle der Bedrohung durch die Worgs. Als Ihr Helendis verlasst, ruft er Euch noch einen Namen hinterher: Halycon. Darauf beziehen sich die Orcs im Zusammenhang mit den Worgs."
Inst8Quest5_Location = "Helendis Flusshorn (Brennende Steppe - Morgans Wacht; "..YELLOW.."5,47"..WHITE..")"
Inst8Quest5_Note = "Halycon findet man bei "..YELLOW.."[17]"..WHITE.."."
Inst8Quest5_Prequest = "Nein"
Inst8Quest5_Folgequest = "Nein"
--
Inst8Quest5name1 = "Astoriaroben"
Inst8Quest5name2 = "Fallenstellerwams"
Inst8Quest5name3 = "Jadeschuppenbrustplatte"

--Quest 6 Alliance
Inst8Quest6 = "6. Urok Schreckensbote"
Inst8Quest6_Level = "60"
Inst8Quest6_Attain = "55"
Inst8Quest6_Aim = "Lest Waroshs Rolle. Bringt Waroshs Mojo zu Warosh."
Inst8Quest6_Location = "Warosh (Schwarzfelsspitze; "..YELLOW.."[2]"..WHITE..")"
Inst8Quest6_Note = "Waroshs Mojo bekommt man von Urok Schreckensbote, den man bei "..YELLOW.."[15]"..WHITE.." beschwören kann. Dafür benötigt man eine Lanze, die es bei "..YELLOW.."[3]"..WHITE.." gibt und Hochlord Omokks Kopf "..YELLOW.."[5]"..WHITE..". Bei der Beschwörung erscheinen mehrere Wellen von Ogern die man besiegen muss, bevor Urok Schreckensbote erscheint. Man kann die Lanze während des Kampfes benutzen, um den Ogern Schaden zuzufügen."
Inst8Quest6_Prequest = "Nein"
Inst8Quest6_Folgequest = "Nein"
--
Inst8Quest6name1 = "Prismatalisman"

--Quest 7 Alliance
Inst8Quest7 = "7. Bijous Habseligkeiten"
Inst8Quest7_Level = "59"
Inst8Quest7_Attain = "55"
Inst8Quest7_Aim = "Sucht Bijous Habseligkeiten und bringt sie ihr. Viel Glück!"
Inst8Quest7_Location = "Bijou (Schwarzfelsspitze; "..YELLOW.."[3]"..WHITE..")"
Inst8Quest7_Note = "Bijous Habseligkeiten kann man auf dem Weg zu Mutter Glimmernetz, die sich bei "..YELLOW.."[13]"..WHITE.." befindet, finden.\nMaxwell findet man in der Brennenden Steppe - Morgans Wacht ("..YELLOW.."84,58"..WHITE..")."
Inst8Quest7_Prequest = "Nein"
Inst8Quest7_Folgequest = "Ja, Nachricht an Maxwell"
-- No Rewards for this quest

--Quest 8 Alliance
Inst8Quest8 = "8. Maxwells Mission"
Inst8Quest8_Level = "59"
Inst8Quest8_Attain = "57"
Inst8Quest8_Aim = "Reist zur Schwarzfelsspitze und schaltet Kriegsmeister Voone, Hochlord Omokk und Oberanführer Wyrmthalak aus. Kehrt zu Marschall Maxwell zurück, wenn Eure Aufgabe erledigt ist."
Inst8Quest8_Location = "Marschall Maxwell (Brennende Steppe - Morgans Wacht; "..YELLOW.."84,58"..WHITE..")"
Inst8Quest8_Note = "Kriegsmeister Voone findet man bei "..YELLOW.."[9]"..WHITE..", Hochlord Omokk bei "..YELLOW.."[5]"..WHITE.." und Oberanführer Wyrmthalak bei "..YELLOW.."[19]"..WHITE.."."
Inst8Quest8_Prequest = "Ja, Nachricht an Maxwell"
Inst8Quest8_Folgequest = "Nein"
Inst8Quest8FQuest = "true"
--
Inst8Quest8name1 = "Wyrmthalaks Fesseln"
Inst8Quest8name2 = "Omokks Umfangbändiger"
Inst8Quest8name3 = "Halycons Maulkorb"
Inst8Quest8name4 = "Vosh'gajins Strang"
Inst8Quest8name5 = "Voones Zwingenhandschutz"

--Quest 9 Alliance
Inst8Quest9 = "9. Siegel des Aufstiegs"
Inst8Quest9_Level = "60"
Inst8Quest9_Attain = "57"
Inst8Quest9_Aim = "Sucht die drei Edelsteine der Befehlsgewalt: den Edelstein der Gluthauer, den Edelstein der Felsspitzoger und den Edelstein der Blutäxte. Bringt sie zusammen mit dem unverzierten Siegel des Aufstiegs zu Vaelan zurück."
Inst8Quest9_Location = "Vaelan (Schwarzfelsspitze; "..YELLOW.."[1]"..WHITE..")"
Inst8Quest9_Note = "Den Edelstein der Felsspitzoger bekommt man von Hochlord Omokk bei "..YELLOW.."[3]"..WHITE..", den Edelstein der Gluthauer von Kriegsmeister Voone bei "..YELLOW.."[9]"..WHITE.." und den Edelstein der Blutäxte von Oberanführer Wyrmthalak bei "..YELLOW.."[19]"..WHITE..". Das Unverziertes Siegel des Aufstiegs kann von fast allen Gegnern in der Unteren Schwarzfelsspitze droppen. Wenn man diese Questreihe beendet, bekommt man den Schlüssel für die Obere Schwarzfelsspitze als Belohnung."
Inst8Quest9_Prequest = "Nein"
Inst8Quest9_Folgequest = "Ja, Siegel des Aufstiegs"
-- No Rewards for this quest

--Quest 10 Alliance
Inst8Quest10 = "10. General Drakkisaths Befehl"
Inst8Quest10_Attain = "55"
Inst8Quest10_Level = "60"
Inst8Quest10_Aim = "Bringt den Befehl von General Drakkisath zu Marschall Maxwell in der brennenden Steppe."
Inst8Quest10_Location = "General Drakkisaths Befehl (droppt von Oberanführer Wyrmthalak; "..YELLOW.."[19]"..WHITE..")"
Inst8Quest10_Note = "Marschall Maxwell befindet sich in der Brennenden Steppe - Morgans Wacht; ("..YELLOW.."84,58"..WHITE..")."
Inst8Quest10_Prequest = "Nein"
Inst8Quest10_Folgequest = "Ja, General Drakkisaths Niedergang ("..YELLOW.."Obere Schwarzfelsspitze"..WHITE..")"
-- No Rewards for this quest

--Quest 11 Alliance
Inst8Quest11 = "11. Das linke Stück von Lord Valthalaks Amulett"
Inst8Quest11_Level = "60"
Inst8Quest11_Attain = "60"
Inst8Quest11_Aim = "Benutzt das Räuchergefäß der Beschwörung, um den Geist von Mor Grauhuf zu beschwören und zu vernichten. Kehrt dann mit dem linken Stück von Lord Valthalaks Amulett und dem Räuchergefäß der Beschwörung zu Bodley im Schwarzfels zurück."
Inst8Quest11_Location = "Bodley (Schwarzfels; "..YELLOW.."[D] auf der Eingangskarte"..WHITE..")"
Inst8Quest11_Note = "Der Extradimensionaler Geisterdetektor wird benötigt, um Bodley zu sehen. Man erhält ihn beim Quest 'Suche nach Anthion'.\n\nMor Grauhuf kann man bei "..YELLOW.."[9]"..WHITE.." beschwören."
Inst8Quest11_Prequest = "Ja, Mehr Komponenten von großer Wichtigkeit"
Inst8Quest11_Folgequest = "Ja, Ich sehe die Insel Alcaz in Eurer Zukunft"
Inst8Quest11PreQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst8Quest12 = "12. Das rechte Stück von Lord Valthalaks Amulett"
Inst8Quest12_Level = "60"
Inst8Quest12_Attain = "60"
Inst8Quest12_Aim = "Benutzt das Räuchergefäß der Beschwörung, um den Geist von Mor Grauhuf zu beschwören und zu vernichten. Kehrt dann mit Lord Valthalaks zusammengesetzten Amulett und dem Räuchergefäß der Beschwörung zu Bodley im Schwarzfels zurück."
Inst8Quest12_Location = "Bodley (Schwarzfels; "..YELLOW.."[D] auf der Eingangskarte"..WHITE..")"
Inst8Quest12_Note = "Der Extradimensionaler Geisterdetektor wird benötigt, um Bodley zu sehen. Man erhält ihn beim Quest 'Suche nach Anthion'.\n\nMor Grauhuf kann man bei "..YELLOW.."[9]"..WHITE.." beschwören."
Inst8Quest12_Prequest = "Ja, Mehr Komponenten von großer Wichtigkeit"
Inst8Quest12_Folgequest = "Ja, Letzte Vorbereitungen ("..YELLOW.."Obere Schwarzfelsspitze"..WHITE..")"
Inst8Quest12PreQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst8Quest13 = "13. Schlangenstein der Schattenjägerin"
Inst8Quest13_Level = "60"
Inst8Quest13_Attain = "51"
Inst8Quest13_Aim = "Begebt Euch zur Schwarzfelsspitze und erschlagt Schattenjägerin Vosh'gajin. Holt Vosh'gajins Schlangenstein und kehrt zu Kilram zurück."
Inst8Quest13_Location = "Kilram (Winterquell - Ewige Warte; "..YELLOW.."61,37"..WHITE..")"
Inst8Quest13_Note = "Schmiedekunst Quest. Schattenjägerin Vosh'gajin befindet sich bei "..YELLOW.."[7]"..WHITE.."."
Inst8Quest13_Prequest = "Nein"
Inst8Quest13_Folgequest = "Nein"
--
Inst8Quest13name1 = "Pläne: Dämmerungsschneide"

--Quest 14 Alliance
Inst8Quest14 = "14. Heißer, feuriger Tod"
Inst8Quest14_Level = "60"
Inst8Quest14_Attain = "58"
Inst8Quest14_Aim = "Jemand auf dieser Welt muss doch wissen, was mit diesen Stulpen zu tun ist. Viel Glück!"
Inst8Quest14_Location = "Menschliche Überreste (Untere Schwarzfelsspitze; "..YELLOW.."[9]"..WHITE..")"
Inst8Quest14_Note = "Schmiedekunst Quest. Man muss die Ungebrannte Plattenstulpen nahe der Menschlichen Überreste bei "..YELLOW.."[11]"..WHITE.." einsammeln. Danach wird es bei Malyfous Düsterhammer (Winterquell - Ewige Warte; "..YELLOW.."61,39"..WHITE..") abgegeben. Die Belohnungen sind für das Folgequest."
Inst8Quest14_Prequest = "Nein"
Inst8Quest14_Folgequest = "Ja, Feurige Plattenstulpen"
--
Inst8Quest14name1 = "Pläne: Feurige Plattenstulpen"
Inst8Quest14name2 = "Feurige Plattenstulpen"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst8Quest1_HORDE = Inst8Quest1
Inst8Quest1_HORDE_Level = Inst8Quest1_Level
Inst8Quest1_HORDE_Attain = Inst8Quest1_Attain
Inst8Quest1_HORDE_Aim = Inst8Quest1_Aim
Inst8Quest1_HORDE_Location = Inst8Quest1_Location
Inst8Quest1_HORDE_Note = Inst8Quest1_Note
Inst8Quest1_HORDE_Prequest = Inst8Quest1_Prequest
Inst8Quest1_HORDE_Folgequest = Inst8Quest1_Folgequest
Inst8Quest1PreQuest_HORDE = Inst8Quest1PreQuest
--
Inst8Quest1name1_HORDE = Inst8Quest1name1
Inst8Quest1name2_HORDE = Inst8Quest1name2

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst8Quest2_HORDE = Inst8Quest2
Inst8Quest2_HORDE_Level = Inst8Quest2_Level
Inst8Quest2_HORDE_Attain = Inst8Quest2_Attain
Inst8Quest2_HORDE_Aim = Inst8Quest2_Aim
Inst8Quest2_HORDE_Location = Inst8Quest2_Location
Inst8Quest2_HORDE_Note = Inst8Quest2_Note
Inst8Quest2_HORDE_Prequest = Inst8Quest2_Prequest
Inst8Quest2_HORDE_Folgequest = Inst8Quest2_Folgequest
--
Inst8Quest2name1_HORDE = Inst8Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst8Quest3_HORDE = Inst8Quest3
Inst8Quest3_HORDE_Level = Inst8Quest3_Level
Inst8Quest3_HORDE_Attain = Inst8Quest3_Attain
Inst8Quest3_HORDE_Aim = Inst8Quest3_Aim
Inst8Quest3_HORDE_Location = Inst8Quest3_Location
Inst8Quest3_HORDE_Note = Inst8Quest3_Note
Inst8Quest3_HORDE_Prequest = Inst8Quest3_Prequest
Inst8Quest3_HORDE_Folgequest = Inst8Quest3_Folgequest
--
Inst8Quest3name1_HORDE = Inst8Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst8Quest4_HORDE = Inst8Quest4
Inst8Quest4_HORDE_Level = Inst8Quest4_Level
Inst8Quest4_HORDE_Attain = Inst8Quest4_Attain
Inst8Quest4_HORDE_Aim = Inst8Quest4_Aim
Inst8Quest4_HORDE_Location = Inst8Quest4_Location
Inst8Quest4_HORDE_Note = Inst8Quest4_Note
Inst8Quest4_HORDE_Prequest = Inst8Quest4_Prequest
Inst8Quest4_HORDE_Folgequest = Inst8Quest4_Folgequest
--
Inst8Quest4name1_HORDE = Inst8Quest4name1

--Quest 5 Horde
Inst8Quest5_HORDE = "5. Die Herrin der Meute"
Inst8Quest5_HORDE_Level = "59"
Inst8Quest5_HORDE_Attain = "55"
Inst8Quest5_HORDE_Aim = "Erschlagt Halycon, die Rudelführerin der Worgs der Blutäxte."
Inst8Quest5_HORDE_Location = "Galamav der Schütze (Ödland - Kargath; "..YELLOW.."5,47"..WHITE..")"
Inst8Quest5_HORDE_Note = "Halycon findet man bei "..YELLOW.."[17]"..WHITE.."."
Inst8Quest5_HORDE_Prequest = "Nein"
Inst8Quest5_HORDE_Folgequest = "Nein"
--
Inst8Quest5name1_HORDE = "Astoriaroben"
Inst8Quest5name2_HORDE = "Fallenstellerwams"
Inst8Quest5name3_HORDE = "Jadeschuppenbrustplatte"

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst8Quest6_HORDE = Inst8Quest6
Inst8Quest6_HORDE_Level = Inst8Quest6_Level
Inst8Quest6_HORDE_Attain = Inst8Quest6_Attain
Inst8Quest6_HORDE_Aim = Inst8Quest6_Aim
Inst8Quest6_HORDE_Location = Inst8Quest6_Location
Inst8Quest6_HORDE_Note = Inst8Quest6_Note
Inst8Quest6_HORDE_Prequest = Inst8Quest6_Prequest
Inst8Quest6_HORDE_Folgequest = Inst8Quest6_Folgequest
--
Inst8Quest6name1_HORDE = Inst8Quest6name1

--Quest 7 Horde
Inst8Quest7_HORDE = "7. Agentin Bijou"
Inst8Quest7_HORDE_Level = "59"
Inst8Quest7_HORDE_Attain = "55"
Inst8Quest7_HORDE_Aim = "Begebt Euch zur Schwarzfelsspitze und findet heraus, was aus Bijou geworden ist."
Inst8Quest7_HORDE_Location = "Lexlort (Ödland - Kargath; "..YELLOW.."5,47"..WHITE..")"
Inst8Quest7_HORDE_Note = "Bijou findet man bei "..YELLOW.."[8]"..WHITE.."."
Inst8Quest7_HORDE_Prequest = "Nein"
Inst8Quest7_HORDE_Folgequest = "Ja, Bijous Habseligkeiten"
-- No Rewards for this quest

--Quest 8 Horde
Inst8Quest8_HORDE = "8. Bijous Habseligkeiten"
Inst8Quest8_HORDE_Level = "59"
Inst8Quest8_HORDE_Attain = "55"
Inst8Quest8_HORDE_Aim = "Sucht Bijous Habseligkeiten und bringt sie ihr. Ihr erinnert Euch daran, dass sie erwähnte, ihre Sachen auf der untersten Ebene der Stadt versteckt zu haben."
Inst8Quest8_HORDE_Location = "Bijou (Schwarzfelsspitze; "..YELLOW.."[3]"..WHITE..")"
Inst8Quest8_HORDE_Note = "Bijous Habseligkeiten kann man auf dem Weg zu Mutter Glimmernetz, die sich bei "..YELLOW.."[13]"..WHITE.." befindet, finden.\nDie Belohungen sind für 'Bijous Aufklärungsbericht'."
Inst8Quest8_HORDE_Prequest = "Ja, Agentin Bijou"
Inst8Quest8_HORDE_Folgequest = "Ja, Bijous Aufklärungsbericht"
Inst8Quest8FQuest_HORDE = "true"
--
Inst8Quest8name1_HORDE = "Freiwindhandschuhe"
Inst8Quest8name2_HORDE = "Seepostengurt"

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst8Quest9_HORDE = Inst8Quest9
Inst8Quest9_HORDE_Level = Inst8Quest9_Level
Inst8Quest9_HORDE_Attain = Inst8Quest9_Attain
Inst8Quest9_HORDE_Aim = Inst8Quest9_Aim
Inst8Quest9_HORDE_Location = Inst8Quest9_Location
Inst8Quest9_HORDE_Note = Inst8Quest9_Note
Inst8Quest9_HORDE_Prequest = Inst8Quest9_Prequest
Inst8Quest9_HORDE_Folgequest = Inst8Quest9_Folgequest
-- No Rewards for this quest

--Quest 10 Horde
Inst8Quest10_HORDE = "10. Befehl des Kriegsherrn"
Inst8Quest10_HORDE_Level = "60"
Inst8Quest10_HORDE_Attain = "55"
Inst8Quest10_HORDE_Aim = "Tötet Hochlord Omokk, Kriegsmeister Voone und Oberanführer Wyrmthalak. Findet die wichtigen Schwarzfelsdokumente. Kehrt zum Kriegsherrn Bluthauer nach Kargath zurück, sobald Ihr diese Mission erledigt habt."
Inst8Quest10_HORDE_Location = "Kriegsherr Bluthauer (Ödland - Kargath; "..YELLOW.."65,22"..WHITE..")"
Inst8Quest10_HORDE_Note = "Qnyxia Prequest.\nHochlord Omokk findet man bei "..YELLOW.."[5]"..WHITE..", Kriegsmeister Voone bei "..YELLOW.."[9]"..WHITE.." und Oberanführer Wyrmthalak bei "..YELLOW.."[19]"..WHITE..". Die Schwarzfelsdokumente können bei einem der drei Bosse liegen."
Inst8Quest10_HORDE_Prequest = "Nein"
Inst8Quest10_HORDE_Folgequest = "Ja, Eitriggs Weisheit -> Für die Horde!("..YELLOW.."Obere Schwarzfelsspitze"..WHITE..")"
--
Inst8Quest10name1_HORDE = "Wyrmthalaks Fesseln"
Inst8Quest10name2_HORDE = "Omokks Umfangbändiger"
Inst8Quest10name3_HORDE = "Halycons Maulkorb"
Inst8Quest10name4_HORDE = "Vosh'gajins Strang"
Inst8Quest10name5_HORDE = "Voones Zwingenhandschutz"

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst8Quest11_HORDE = Inst8Quest11
Inst8Quest11_HORDE_Level = Inst8Quest11_Level
Inst8Quest11_HORDE_Attain = Inst8Quest11_Attain
Inst8Quest11_HORDE_Aim = Inst8Quest11_Aim
Inst8Quest11_HORDE_Location = Inst8Quest11_Location
Inst8Quest11_HORDE_Note = Inst8Quest11_Note
Inst8Quest11_HORDE_Prequest = Inst8Quest11_Prequest
Inst8Quest11_HORDE_Folgequest = Inst8Quest11_Folgequest
Inst8Quest11PreQuest_HORDE = Inst8Quest11PreQuest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst8Quest12_HORDE = Inst8Quest12
Inst8Quest12_HORDE_Level = Inst8Quest12_Level
Inst8Quest12_HORDE_Attain = Inst8Quest12_Attain
Inst8Quest12_HORDE_Aim = Inst8Quest12_Aim
Inst8Quest12_HORDE_Location = Inst8Quest12_Location
Inst8Quest12_HORDE_Note = Inst8Quest12_Note
Inst8Quest12_HORDE_Prequest = Inst8Quest12_Prequest
Inst8Quest12_HORDE_Folgequest = Inst8Quest12_Folgequest
Inst8Quest12PreQuest_HORDE = Inst8Quest12PreQuest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst8Quest13_HORDE = Inst8Quest13
Inst8Quest13_HORDE_Level = Inst8Quest13_Level
Inst8Quest13_HORDE_Attain = Inst8Quest13_Attain
Inst8Quest13_HORDE_Aim = Inst8Quest13_Aim
Inst8Quest13_HORDE_Location = Inst8Quest13_Location
Inst8Quest13_HORDE_Note = Inst8Quest13_Note
Inst8Quest13_HORDE_Prequest = Inst8Quest13_Prequest
Inst8Quest13_HORDE_Folgequest = Inst8Quest13_Folgequest
--
Inst8Quest13name1_HORDE = Inst8Quest13name1

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst8Quest14_HORDE = Inst8Quest14
Inst8Quest14_HORDE_Level = Inst8Quest14_Level
Inst8Quest14_HORDE_Attain = Inst8Quest14_Attain
Inst8Quest14_HORDE_Aim = Inst8Quest14_Aim
Inst8Quest14_HORDE_Location = Inst8Quest14_Location
Inst8Quest14_HORDE_Note = Inst8Quest14_Note
Inst8Quest14_HORDE_Prequest = Inst8Quest14_Prequest
Inst8Quest14_HORDE_Folgequest = Inst8Quest14_Folgequest
--
Inst8Quest14name1_HORDE = Inst8Quest14name1
Inst8Quest14name2_HORDE = Inst8Quest14name2



--------------- INST9 - Upper Blackrock Spire (UBRS) ---------------

Inst9Story = "Die mächtige Festung, die aus der feurigen Flanke des Schwarzfels herausgeschnitten wurde, geht auf Entwürfe des zwergischen Meistersteinmetzes Franclorn Schmiedevater zurück. Jahrhunderte lang war die Zitadelle ein Symbol der Macht des Dunkeleisenklans, das von den Zwergen mit äußerstem Ingrimm verteidigt wurde. Allerdings gab es jemanden, der andere Pläne für die Zitadelle hatte: Nefarian, der listige Sohn des Drachen Deathwing, stieg eines Tages mit Flamme und Klaue auf den oberen Teil der Zitadelle hinab und trug zusammen mit seinen drachischen Untergebenen den Kampf bis zu den Stellungen der Zwerge tief unten, bei den vulkanischen Abgründen unter dem Berg. Dort erkannte der Drache, dass der Anführer der Zwerge kein geringerer als der Feuerfürst Ragnaros höchstpersönlich war. Nachdem sein Vordringen gestoppt worden war, schwor sich Nefarian, seine Feinde endgültig zu vernichten und somit die Herrschaft über den Schwarzfels an sich zu reißen."
Inst9Caption = "Schwarzfelsspitze (Oben)"
Inst9QAA = "11 Quests"
Inst9QAH = "12 Quests"

--Quest 1 Alliance
Inst9Quest1 = "1. Die oberste Beschützerin"
Inst9Quest1_Level = "60"
Inst9Quest1_Attain = "57"
Inst9Quest1_Aim = "Begebt Euch nach Winterquell und sucht Haleh. Gebt ihr Awbees Schuppe."
Inst9Quest1_Location = "Awbee (Schwarzfelsspitze; "..YELLOW.."[7]"..WHITE..")"
Inst9Quest1_Note = "Awbee findet man in dem Raum gleich hinter der Arena bei "..YELLOW.."[7]"..WHITE..". Sie steht auf einem Felvorsprung.\nHaleh findet man in Winterquell ("..YELLOW.."54,51"..WHITE.."). Man gelangt zu ihr, indem man sich am Ende der Höhle auf den Portalkreis stellt."
Inst9Quest1_Prequest = "Nein"
Inst9Quest1_Folgequest = "Ja, Der Zorn des blauen Drachenschwarms"
-- No Rewards for this quest

--Quest 2 Alliance
Inst9Quest2 = "2. Finkle Einhorn, zu Euren Diensten!"
Inst9Quest2_Level = "60"
Inst9Quest2_Attain = "58"
Inst9Quest2_Aim = "Sprecht mit Malyfous Düsterhammer in der Ewigen Warte."
Inst9Quest2_Location = "Finkle Einhorn (Schwarzfelsspitze; "..YELLOW.."[8]"..WHITE..")"
Inst9Quest2_Note = "Finkle Einhorn spawnt manchmal, wenn man die Bestie häutet. Malyfous findet man in (Winterquell - Ewige Warte; "..YELLOW.."61,38"..WHITE..")."
Inst9Quest2_Prequest = "Nein"
Inst9Quest2_Folgequest = "Ja, Gamaschen von Arcana, Kappe des scharlachroten Wissenden, Brustplatte des Blutdurstes"
-- No Rewards for this quest

--Quest 3 Alliance
Inst9Quest3 = "3. Ei-Frosten"
Inst9Quest3_Level = "60"
Inst9Quest3_Attain = "57"
Inst9Quest3_Aim = "Benutzt den Prototyp des Eiszilloskops an einem Ei im Horst."
Inst9Quest3_Location = "Tinkee Kesseldampf (Brennende Steppe - Flammenkamm; "..YELLOW.."65,24"..WHITE..")"
Inst9Quest3_Note = "Man findet die Eier im Raum von Vater Flamme bei "..YELLOW.."[2]"..WHITE.."."
Inst9Quest3_Prequest = "Ja, Brutlingessenz -> Tinkee Kesseldampf"
Inst9Quest3_Folgequest = "Ja, Leonidas Bartholomäus -> Dämmerungstrickfalle ("..YELLOW.."Scholomance"..WHITE..")"
Inst9Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst9Quest4 = "4. Auge des Glutsehers"
Inst9Quest4_Level = "60"
Inst9Quest4_Attain = "55"
Inst9Quest4_Aim = "Bringt das Auge des Glutsehers zu Fürst Hydraxis in Azshara."
Inst9Quest4_Location = "Fürst Hydraxis (Azshara; "..YELLOW.."79,73"..WHITE..")"
Inst9Quest4_Note = "Das Auge bekommt man von Feuerwache Glutseher bei "..YELLOW.."[1]"..WHITE.."."
Inst9Quest4_Prequest = "Ja, Vergiftetes Wasser"
Inst9Quest4_Folgequest = "Ja, Der geschmolzene Kern"
Inst9Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst9Quest5 = "5. General Drakkisaths Niedergang"
Inst9Quest5_Level = "60"
Inst9Quest5_Attain = "55"
Inst9Quest5_Aim = "Begebt Euch zur Schwarzfelsspitze und schaltet General Drakkisath aus. Kehrt zu Marschall Maxwell zurück, wenn Eure Aufgabe erledigt ist."
Inst9Quest5_Location = "Marschall Maxwell (Brennende Steppe - Morgans Wacht; "..YELLOW.."82,68"..WHITE..")"
Inst9Quest5_Note = "General Drakkisath findet man bei "..YELLOW.."[9]"..WHITE.."."
Inst9Quest5_Prequest = "Ja, General Drakkisaths Befehl ("..YELLOW.."Untere Schwarzfelsspitze"..WHITE..")"
Inst9Quest5_Folgequest = "Nein"
Inst9Quest5PreQuest = "true"
--
Inst9Quest5name1 = "Mal der Tyrannei"
Inst9Quest5name2 = "Auge der Bestie"
Inst9Quest5name3 = "Schwarzfausts Breite"

--Quest 6 Alliance
Inst9Quest6 = "6. Doomriggers Schnalle"
Inst9Quest6_Level = "60"
Inst9Quest6_Attain = "57"
Inst9Quest6_Aim = "Bringt Mayara Wolkenglanz in der brennenden Steppe Doomriggers Schnalle."
Inst9Quest6_Location = "Mayara Wolkenglanz (Brennende Steppe - Morgans Wacht; "..YELLOW.."84,69"..WHITE..")"
Inst9Quest6_Note = "Das Vorquest bekommt man von Graf Remington Kronenbrunn (Sturmwind - Burg Sturmwind; "..YELLOW.."74,30"..WHITE..").\n\nDie Schnalle befindet sich bei "..YELLOW.."[3]"..WHITE.." in einer Truhe."
Inst9Quest6_Prequest = "Ja, Mayara Wolkenglanz"
Inst9Quest6_Folgequest = "Ja, Lieferung an Kronenbrunn"
Inst9Quest6PreQuest = "true"
--
Inst9Quest6name1 = "Treter des flinken Fußes"
Inst9Quest6name2 = "Armschützer des flinken Schlags"

--Quest 7 Alliance
Inst9Quest7 = "7. Drachenfeueramulett"
Inst9Quest7_Level = "60"
Inst9Quest7_Attain = "52"
Inst9Quest7_Aim = "Ihr müsst das Blut des schwarzen Drachenhelden von General Drakkisath bekommen. Ihr findet Drakkisath in seinem Thronsaal hinter den Hallen des Aufstiegs auf der Schwarzfelsspitze."
Inst9Quest7_Location = "Haleh (Winterquell; "..YELLOW.."54,51"..WHITE..")"
Inst9Quest7_Note = "Letzter Teil der Onyxia Questreihe für die Allianz. General Drakkisath findet man bei "..YELLOW.."[9]"..WHITE.."."
Inst9Quest7_Prequest = "Ja, Das Großdrachenauge"
Inst9Quest7_Folgequest = "Nein"
Inst9Quest7PreQuest = "true"
--
Inst9Quest7name1 = "Drachenfeueramulett"

--Quest 8 Alliance
Inst9Quest8 = "8. Schwarzfausts Befehl"
Inst9Quest8_Level = "60"
Inst9Quest8_Attain = "55"
Inst9Quest8_Aim = "Dem Brief zufolge, wird das Brandzeichen von General Drakkisath bewacht. Vielleicht solltet Ihr diesem Hinweis nachgehen."
Inst9Quest8_Location = "Schwarzfausts Befehl (droppt vom Rüstmeister der Schmetterschilde; "..YELLOW.."[7] auf der Eingangskarte"..WHITE..")"
Inst9Quest8_Note = "Pechschwingenhort Vorquest. Den Rüstmeister der Schmetterschilde findet man, wenn man vor dem Eingang von LBRS/UBRS rechts den Gang entlang geht.\n\nGeneral Drakkisath findet man bei "..YELLOW.."[9]"..WHITE..". Das Brandzeichen befindet sich genau hinter ihm."
Inst9Quest8_Prequest = "Nein"
Inst9Quest8_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 9 Alliance
Inst9Quest9 = "9. Letzte Vorbereitungen"
Inst9Quest9_Level = "60"
Inst9Quest9_Attain = "60"
Inst9Quest9_Aim = "Bringt Bodley im Schwarzfels 40 Schwarzfelsarmschienen und ein Fläschchen der obersten Macht."
Inst9Quest9_Location = "Bodley (Schwarzfels; "..YELLOW.."[D] auf der Eingangskarte"..WHITE..")"
Inst9Quest9_Note = "Der Extradimensionaler Geisterdetektor wird benötigt, um Bodley zu sehen. Man erhält ihn beim Quest 'Suche nach Anthion'. Schwarzfelsarmschienen droppen von Gegnern mit 'Schwarzfaust' im Namen. Fläschchen der obersten Macht wird von einem Alchemisten hergestellt."
Inst9Quest9_Prequest = "Ja, Das rechte Stück von Lord Valthalaks Amulett ("..YELLOW.."Obere Schwarzfelsspitze"..WHITE..")"
Inst9Quest9_Folgequest = "Ja, Mea Culpa, Lord Valthalak"
Inst9Quest9PreQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst9Quest10 = "10. Mea Culpa, Lord Valthalak"
Inst9Quest10_Level = "60"
Inst9Quest10_Attain = "60"
Inst9Quest10_Aim = "Benutzt das Räuchergefäß der Beschwörung, um Lord Valthalak zu beschwören. Macht ihn unschädlich und benutzt dann Lord Valthalaks Amulett bei seiner Leiche. Danach werdet Ihr dem Geist von Lord Valthalak sein Amulett zurückgeben müssen."
Inst9Quest10_Location = "Bodley (Schwarzfels; "..YELLOW.."[D] auf der Eingangskarte"..WHITE..")"
Inst9Quest10_Note = "Der Extradimensionaler Geisterdetektor wird benötigt, um Bodley zu sehen. Man erhält ihn beim Quest 'Suche nach Anthion'. Lord Valthalak kann bei "..YELLOW.."[8]"..WHITE.." beschwört werden. Die Belohnungen sind für 'Rückkehr zu Bodley'."
Inst9Quest10_Prequest = "Ja, Letzte Vorbereitungen"
Inst9Quest10_Folgequest = "Ja, Rückkehr zu Bodley"
Inst9Quest10FQuest = "true"
--
Inst9Quest10name1 = "Räuchergefäß der Anrufung"
Inst9Quest10name2 = "Handbuch: Räuchergefäß der Anrufung"

--Quest 11 Alliance
Inst9Quest11 = "11. Die Dämonenschmiede"
Inst9Quest11_Level = "60"
Inst9Quest11_Attain = "58"
Inst9Quest11_Aim = "Begebt Euch zur Schwarzfelsspitze und sucht Goraluk Hammerbruch. Erschlagt ihn und wendet dann die blutbefleckte Pike auf seine Leiche an. Nachdem seine Seele abgesaugt wurde, wird die Pike seelenbefleckt sein. Ihr müsst außerdem die ungeschmiedete runenbedeckte Brustplatte finden. Bringt die seelenbefleckte Pike und die ungeschmiedete runenbedeckte Brustplate zu Lorax in Winterquell."
Inst9Quest11_Location = "Lorax (Winterquell; "..YELLOW.."64,74"..WHITE..")"
Inst9Quest11_Note = "Schmiedekunst Quest. Goraluk Hammerbruch befindet sich bei "..YELLOW.."[5]"..WHITE.."."
Inst9Quest11_Prequest = "Nein"
Inst9Quest11_Folgequest = "Nein"
--
Inst9Quest11name1 = "Pläne: Dämonengeschmiedete Brustplatte"
Inst9Quest11name2 = "Elixier des Dämonentötens"
Inst9Quest11name3 = "Dämonengeküsster Sack"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst9Quest1_HORDE = Inst9Quest1
Inst9Quest1_HORDE_Level = Inst9Quest1_Level
Inst9Quest1_HORDE_Attain = Inst9Quest1_Attain
Inst9Quest1_HORDE_Aim = Inst9Quest1_Aim
Inst9Quest1_HORDE_Location = Inst9Quest1_Location
Inst9Quest1_HORDE_Note = Inst9Quest1_Note
Inst9Quest1_HORDE_Prequest = Inst9Quest1_Prequest
Inst9Quest1_HORDE_Folgequest = Inst9Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst9Quest2_HORDE = Inst9Quest2
Inst9Quest2_HORDE_Level = Inst9Quest2_Level
Inst9Quest2_HORDE_Attain = Inst9Quest2_Attain
Inst9Quest2_HORDE_Aim = Inst9Quest2_Aim
Inst9Quest2_HORDE_Location = Inst9Quest2_Location
Inst9Quest2_HORDE_Note = Inst9Quest2_Note
Inst9Quest2_HORDE_Prequest = Inst9Quest2_Prequest
Inst9Quest2_HORDE_Folgequest = Inst9Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst9Quest3_HORDE = Inst9Quest3
Inst9Quest3_HORDE_Level = Inst9Quest3_Level
Inst9Quest3_HORDE_Attain = Inst9Quest3_Attain
Inst9Quest3_HORDE_Aim = Inst9Quest3_Aim
Inst9Quest3_HORDE_Location = Inst9Quest3_Location
Inst9Quest3_HORDE_Note = Inst9Quest3_Note
Inst9Quest3_HORDE_Prequest = Inst9Quest3_Prequest
Inst9Quest3_HORDE_Folgequest = Inst9Quest3_Folgequest
Inst9Quest3PreQuest_HORDE = Inst9Quest3PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst9Quest4_HORDE = Inst9Quest4
Inst9Quest4_HORDE_Level = Inst9Quest4_Level
Inst9Quest4_HORDE_Attain = Inst9Quest4_Attain
Inst9Quest4_HORDE_Aim = Inst9Quest4_Aim
Inst9Quest4_HORDE_Location = Inst9Quest4_Location
Inst9Quest4_HORDE_Note = Inst9Quest4_Note
Inst9Quest4_HORDE_Prequest = Inst9Quest4_Prequest
Inst9Quest4_HORDE_Folgequest = Inst9Quest4_Folgequest
Inst9Quest4PreQuest_HORDE = Inst9Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde
Inst9Quest5_HORDE = "5. Die Dunkelsteinschrifttafel"
Inst9Quest5_HORDE_Level = "60"
Inst9Quest5_HORDE_Attain = "57"
Inst9Quest5_HORDE_Aim = "Bringt der Schattenmagierin Vivian Lagrave in Kargath die Dunkelsteinschrifttafel."
Inst9Quest5_HORDE_Location = "Vivian Lagrave (Ödland - Kargath; "..YELLOW.."2,47"..WHITE..")"
Inst9Quest5_HORDE_Note = "Das Vorquest bekommt man von Apothekerin Zinge in Unterstadt - Das Apothekarium ("..YELLOW.."50,68"..WHITE..").\nDie Dunkelsteinschrifttafel findet man bei "..YELLOW.."[3]"..WHITE.." in einer Truhe."
Inst9Quest5_HORDE_Prequest = "Ja, Vivian Lagrave und die Dunkelsteinschrifttafel"
Inst9Quest5_HORDE_Folgequest = "Nein"
Inst9Quest5PreQuest_HORDE = "true"
--
Inst9Quest5name1_HORDE = "Treter des flinken Fußes"
Inst9Quest5name2_HORDE = "Armschützer des flinken Schlags"

--Quest 6 Horde
Inst9Quest6_HORDE = "6. Für die Horde!"
Inst9Quest6_HORDE_Level = "60"
Inst9Quest6_HORDE_Attain = "55"
Inst9Quest6_HORDE_Aim = "Begebt Euch zur Schwarzfelsspitze und tötet den Kriegshäuptling Rend Schwarzfaust. Nehmt seinen Kopf und kehrt nach Orgrimmar zurück."
Inst9Quest6_HORDE_Location = "Thrall (Orgrimmar; "..YELLOW.."31,38"..WHITE..")"
Inst9Quest6_HORDE_Note = "Qnyxia Vorquest. Kriegshäuptling Rend Schwarzfaust findet man bei "..YELLOW.."[6]"..WHITE.."."
Inst9Quest6_HORDE_Prequest = "Ja, Befehl des Kriegsherrn -> Etriggs Weisheit"
Inst9Quest6_HORDE_Folgequest = "Ja, Was der Wind erzählt"
Inst9Quest6PreQuest_HORDE = "true"
--
Inst9Quest6name1_HORDE = "Mal der Tyrannei"
Inst9Quest6name2_HORDE = "Auge der Bestie"
Inst9Quest6name3_HORDE = "Schwarzfausts Breite"

--Quest 7 Horde
Inst9Quest7_HORDE = "7. Oculus-Illusionen"
Inst9Quest7_HORDE_Level = "60"
Inst9Quest7_HORDE_Attain = "57"
Inst9Quest7_HORDE_Aim = "Reist zur Schwarzfelsspitze und sammelt 20 schwarze Drachenbrutaugen. Kehrt zu Myranda der Vettel zurück, sobald Ihr die Aufgabe erfüllt habt."
Inst9Quest7_HORDE_Location = "Myranda die Vettel (Westliche Pestländer; "..YELLOW.."50,77"..WHITE..")"
Inst9Quest7_HORDE_Note = "Alle Drachen droppen die Augen."
Inst9Quest7_HORDE_Prequest = "Ja, Was der Wind erzählt -> Meisterin der Illusionen"
Inst9Quest7_HORDE_Folgequest = "Ja, Aschenschwinge"
Inst9Quest7FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 8 Horde
Inst9Quest8_HORDE = "8. Blut des schwarzen Großdrachenhelden"
Inst9Quest8_HORDE_Level = "60"
Inst9Quest8_HORDE_Attain = "56"
Inst9Quest8_HORDE_Aim = "Begebt Euch zur Schwarzfelsspitze und tötet General Drakkisath. Sammelt sein Blut und bringt es zu Rokaro."
Inst9Quest8_HORDE_Location = "Rokaro (Desolace - Schattenflucht; "..YELLOW.."25,71"..WHITE..")"
Inst9Quest8_HORDE_Note = "Letzter Teil der Onyxia Vorquestreihe. Man findet General Drakkisath bei "..YELLOW.."[9]"..WHITE.."."
Inst9Quest8_HORDE_Prequest = "Ja, Aschenschwinge -> Aufstieg..."
Inst9Quest8_HORDE_Folgequest = "Nein"
Inst9Quest8FQuest_HORDE = "true"
--
Inst9Quest8name1_HORDE = "Drachenfeueramulett"

--Quest 9 Horde  (same as Quest 8 Alliance)
Inst9Quest9_HORDE = "9. Schwarzfausts Befehl"
Inst9Quest9_HORDE_Level = Inst9Quest8_Level
Inst9Quest9_HORDE_Attain = Inst9Quest8_Attain
Inst9Quest9_HORDE_Aim = Inst9Quest8_Aim
Inst9Quest9_HORDE_Location = Inst9Quest8_Location
Inst9Quest9_HORDE_Note = Inst9Quest8_Note
Inst9Quest9_HORDE_Prequest = Inst9Quest8_Prequest
Inst9Quest9_HORDE_Folgequest = Inst9Quest8_Folgequest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 9 Alliance)
Inst9Quest10_HORDE = "10. Letzte Vorbereitungen"
Inst9Quest10_HORDE_Level = Inst9Quest9_Level
Inst9Quest10_HORDE_Attain = Inst9Quest9_Attain
Inst9Quest10_HORDE_Aim = Inst9Quest9_Aim
Inst9Quest10_HORDE_Location = Inst9Quest9_Location
Inst9Quest10_HORDE_Note = Inst9Quest9_Note
Inst9Quest10_HORDE_Prequest = Inst9Quest9_Prequest
Inst9Quest10_HORDE_Folgequest = Inst9Quest9_Folgequest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 10 Alliance)
Inst9Quest11_HORDE = "11. Mea Culpa, Lord Valthalak"
Inst9Quest11_HORDE_Level = Inst9Quest10_Level
Inst9Quest11_HORDE_Attain = Inst9Quest10_Attain
Inst9Quest11_HORDE_Aim = Inst9Quest10_Aim
Inst9Quest11_HORDE_Location = Inst9Quest10_Location
Inst9Quest11_HORDE_Note = Inst9Quest10_Note
Inst9Quest11_HORDE_Prequest = Inst9Quest10_Prequest
Inst9Quest11_HORDE_Folgequest = Inst9Quest10_Folgequest
--
Inst9Quest11name1_HORDE = Inst9Quest10name1
Inst9Quest11name2_HORDE = Inst9Quest10name2

--Quest 12 Horde  (same as Quest 11 Alliance)
Inst9Quest12_HORDE = "12. Die Dämonenschmiede"
Inst9Quest12_HORDE_Level = Inst9Quest11_Level
Inst9Quest12_HORDE_Attain = Inst9Quest11_Attain
Inst9Quest12_HORDE_Aim = Inst9Quest11_Aim
Inst9Quest12_HORDE_Location = Inst9Quest11_Location
Inst9Quest12_HORDE_Note = Inst9Quest11_Note
Inst9Quest12_HORDE_Prequest = Inst9Quest11_Prequest
Inst9Quest12_HORDE_Folgequest = Inst9Quest11_Folgequest
--
Inst9Quest12name1_HORDE = Inst9Quest11name1
Inst9Quest12name2_HORDE = Inst9Quest11name2
Inst9Quest12name3_HORDE = Inst9Quest11name3



--------------- INST10 - Dire Maul East (DM) ---------------

Inst10Story = "Vor fast zwölftausend Jahren errichtete eine geheime Sekte nachtelfischer Zauberer die uralte Stadt Eldre'Thalas, um die wertvollsten Geheimnisse von Königin Azshara zu schützen. Selbst die Ruinen der Stadt, die während der Spaltung der Welt verwüstet wurde, sind immer noch äußerst beeindruckend und ehrfurchtgebietend. In den drei Flügeln der Stadt, die heute nur noch als der Düsterbruch bekannt ist, haben sich inzwischen die seltsamsten Kreaturen niedergelassen - besonders die spektralen Hochgeborenen, die hinterhältigen Satyrn und die brutalen Oger. Nur die mutigsten Abenteurer sollten sich dieser verfluchten Ruine nähern und die unglaublichen Schrecken herausfordern, die hinter den verfallenen Mauern lauern."
Inst10Caption = "Düsterbruch (Ost)"
Inst10QAA = "6 Quests"
Inst10QAH = "6 Quests"

--Quest 1 Alliance
Inst10Quest1 = "1. Pusillin und der Älteste Azj'Tordin"
Inst10Quest1_Level = "58"
Inst10Quest1_Attain = "54"
Inst10Quest1_Aim = "Reist nach Düsterbruch und macht den Dämonen Pusillin ausfindig. Überzeugt ihn mit allen Mitteln davon, Euch Azj'Tordin's Buch der Zauberformeln zu geben.\nKehrt mit dem Buch zu Az'Tordin, an Lariss' Pavillon in Feralas, zurück."
Inst10Quest1_Location = "Azj'Tordin (Feralas - Lariss' Pavillon; "..YELLOW.."76,37"..WHITE..")"
Inst10Quest1_Note = "Pusillin findet man in Düsterbruch "..YELLOW.."Ost"..WHITE.." bei "..YELLOW.."[1]"..WHITE..". Sobald man ihn anspricht läuft er weg. Wenn man ihn bis "..YELLOW.."[2]"..WHITE.." verfolgt, stellt er sich dem Kampf. Er droppt den Mondsichelschlüssel, den man für den Nord- und Westteil benötigt."
Inst10Quest1_Prequest = "Nein"
Inst10Quest1_Folgequest = "Nein"
--
Inst10Quest1name1 = "Flotte Stiefel"
Inst10Quest1name2 = "Sprinterschwert"

--Quest 2 Alliance
Inst10Quest2 = "2. Lethtendris' Netz"
Inst10Quest2_Level = "57"
Inst10Quest2_Attain = "54"
Inst10Quest2_Aim = "Bringt Lethtendris' Netz zu Latronicus Mondspeer in der Mondfederfeste in Feralas."
Inst10Quest2_Location = "Latronicus Mondspeer (Feralas - Mondfederfeste; "..YELLOW.."30,46"..WHITE..")"
Inst10Quest2_Note = "Lethtendris findet man in Düsterbruch "..YELLOW.."Ost"..WHITE.." bei "..YELLOW.."[3]"..WHITE..". Das Vorquest erhält man bei Kurier Hammerfall in Eisenschmiede. Er wandert in der ganzen Stadt umher."
Inst10Quest2_Prequest = "Ja, Die Mondfederfeste"
Inst10Quest2_Folgequest = "Nein"
Inst10Quest2PreQuest = "true"
--
Inst10Quest2name1 = "Lehrenspinner"

--Quest 3 Alliance
Inst10Quest3 = "3. Die Splitter der Teufelsranke"
Inst10Quest3_Level = "60"
Inst10Quest3_Attain = "59"
Inst10Quest3_Aim = "Sucht die Teufelsranke in Düsterbruch und nehmt einen Teufelsrankensplitter mit Euch. Aller Wahrscheinlichkeit nach, werdet Ihr Alzzin den Wildformer töten müssen, um an die Teufelsranke zu gelangen. Benutzt das Requiliar der Reinheit, um darin den Splitter sicher zu versiegeln und bringt das versiegelte Reliquiar zu Rabine Saturna in Nachthafen, Mondlichtung."
Inst10Quest3_Location = "Rabine Saturna (Mondlichtung - Nachthafen; "..YELLOW.."51,44"..WHITE..")"
Inst10Quest3_Note = "Alliz den Wildformer findet man in Düsterbruch "..YELLOW.."Ost"..WHITE.." bei "..YELLOW.."[5]"..WHITE..". Das Relikt findet man in Silithius bei "..YELLOW.."62,54"..WHITE..". Das Vorquest bekommt man auch von Rabine Saturna."
Inst10Quest3_Prequest = "Ja, Ein Reliquiar der Reinheit"
Inst10Quest3_Folgequest = "Nein"
Inst10Quest3PreQuest = "true"
--
Inst10Quest3name1 = "Millis Schild"
Inst10Quest3name2 = "Millis Lexikon"

--Quest 4 Alliance
Inst10Quest4 = "4. The Left Piece of Lord Valthalak's Amulet"
Inst10Quest4_Level = "60"
Inst10Quest4_Attain = "60"
Inst10Quest4_Aim = "Benutzt das Räuchergefäß der Beschwörung, um den Geist von Isalien zu beschwören und zu vernichten. Kehrt dann mit dem linken Stück von Lord Valthalaks Amulett und dem Räuchergefäß der Beschwörung zu Bodley im Schwarzfels zurück."
Inst10Quest4_Location = "Bodley (Schwarzfels; "..YELLOW.."[D] auf der Einangs-Karte"..WHITE..")"
Inst10Quest4_Note = "Der Extradimensionale Geisterdetektor wird benötigt um Bodley zu sehen. Man erhält ihn beim Quest 'Suche nach Anthion'.\n\nIsalien wird bei "..YELLOW.."[5]"..WHITE.." beschworen."
Inst10Quest4_Prequest = "Ja, Komponenten von großer Wichtigkeit"
Inst10Quest4_Folgequest = "Ja, Ich sehe die Insel Alcaz in Eurer Zukunft"
Inst10Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst10Quest5 = "5. Das rechte Stück von Lord Valthalaks Amulett"
Inst10Quest5_Level = "60"
Inst10Quest5_Attain = "60"
Inst10Quest5_Aim = "Benutzt das Räuchergefäß der Beschwörung, um den Geist von Isalien zu beschwören und zu vernichten. Kehrt dann mit Lord Valthalaks zusammengesetzten Amulett und dem Räuchergefäß der Beschwörung zu Bodley im Schwarzfels zurück."
Inst10Quest5_Location = "Bodley (Schwarzfels; "..YELLOW.."[D] auf der Einangs-Karte"..WHITE..")"
Inst10Quest5_Note = "Der Extradimensionale Geisterdetektor wird benötigt um Bodley zu sehen. Man erhält ihn beim Quest 'Suche nach Anthion'.\n\nIsalien wird bei "..YELLOW.."[5]"..WHITE.." beschworen."
Inst10Quest5_Prequest = "Ja, Mehr Komponenten von großer Wichtigkeit"
Inst10Quest5_Folgequest = "Ja, Letzte Vorbereitungen ("..YELLOW.."Obere Schwarzfelsspitze"..WHITE..")"
Inst10Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst10Quest6 = "6. Das Fundament des Gefängnisses (Hexenmeister)"
Inst10Quest6_Level = "60"
Inst10Quest6_Attain = "60"
Inst10Quest6_Aim = "Reist nach Düsterbruch in Feralas und holt Euch das Blut von 15 Satyrn der Wildhufe, die im Wucherborkenviertel ansässig sind. Kehrt anschließend zu Daio in der faulenden Narbe zurück."
Inst10Quest6_Location = "Daio der Klapprige (Verwüstete Lande - Die faulende Narbe; "..YELLOW.."34,50"..WHITE..")"
Inst10Quest6_Note = "Dieses und ein weiteres Quest von Daio dem Klapprigen sind Hexenmeisterquests für das Ritual der Verdammnis. Der einfachste Weg, um zu Satyr dem Wildhufe zu gelangen, ist Düsterbruch Ost durch die 'Hintertür' in Feralas "..YELLOW.."77,37"..WHITE.." zu betreten. Dazu benötigt man den Mondsichelschlüssel."
Inst10Quest6_Prequest = "Nein"
Inst10Quest6_Folgequest = "Nein"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst10Quest1_HORDE = Inst10Quest1
Inst10Quest1_HORDE_Level = Inst10Quest1_Level
Inst10Quest1_HORDE_Attain = Inst10Quest1_Attain
Inst10Quest1_HORDE_Aim = Inst10Quest1_Aim
Inst10Quest1_HORDE_Location = Inst10Quest1_Location
Inst10Quest1_HORDE_Note = Inst10Quest1_Note
Inst10Quest1_HORDE_Prequest = Inst10Quest1_Prequest
Inst10Quest1_HORDE_Folgequest = Inst10Quest1_Folgequest
--
Inst10Quest1name1_HORDE = Inst10Quest1name1
Inst10Quest1name2_HORDE = Inst10Quest1name2

--Quest 2 Horde
Inst10Quest2_HORDE = "2. Lethtendris' Netz"
Inst10Quest2_HORDE_Level = "57"
Inst10Quest2_HORDE_Attain = "54"
Inst10Quest2_HORDE_Aim = "Bringt Lethtendris' Netz zu Talo Dornhuf im Camp Mojache in Feralas."
Inst10Quest2_HORDE_Location = "Talo Dornhuf (Feralas - Camp Mojache; "..YELLOW.."76,43"..WHITE..")"
Inst10Quest2_HORDE_Note = "Lethtendris findet man in Düsterbruch "..YELLOW.."Ost"..WHITE.." bei "..YELLOW.."[3]"..WHITE..". Das Vorquest erhält man von Kriegsrufer Gorlach in Orgrimmar. Er wandert in der ganzen Stadt umher."
Inst10Quest2_HORDE_Prequest = "Ja, Camp Mojache"
Inst10Quest2_HORDE_Folgequest = "Nein"
Inst10Quest2PreQuest_HORDE = "true"
--
Inst10Quest2name1_HORDE = "Lehrenspinner"

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst10Quest3_HORDE = Inst10Quest3
Inst10Quest3_HORDE_Level = Inst10Quest3_Level
Inst10Quest3_HORDE_Attain = Inst10Quest3_Attain
Inst10Quest3_HORDE_Aim = Inst10Quest3_Aim
Inst10Quest3_HORDE_Location = Inst10Quest3_Location
Inst10Quest3_HORDE_Note = Inst10Quest3_Note
Inst10Quest3_HORDE_Prequest = Inst10Quest3_Prequest
Inst10Quest3_HORDE_Folgequest = Inst10Quest3_Folgequest
--
Inst10Quest3name1_HORDE = Inst10Quest3name1
Inst10Quest3name2_HORDE = Inst10Quest3name2

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst10Quest4_HORDE = Inst10Quest4
Inst10Quest4_HORDE_Level = Inst10Quest4_Level
Inst10Quest4_HORDE_Attain = Inst10Quest4_Attain
Inst10Quest4_HORDE_Aim = Inst10Quest4_Aim
Inst10Quest4_HORDE_Location = Inst10Quest4_Location
Inst10Quest4_HORDE_Note = Inst10Quest4_Note
Inst10Quest4_HORDE_Prequest = Inst10Quest4_Prequest
Inst10Quest4_HORDE_Folgequest = Inst10Quest4_Folgequest
Inst10Quest4PreQuest_HORDE = Inst10Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst10Quest5_HORDE = Inst10Quest5
Inst10Quest5_HORDE_Level = Inst10Quest5_Level
Inst10Quest5_HORDE_Attain = Inst10Quest5_Attain
Inst10Quest5_HORDE_Aim = Inst10Quest5_Aim
Inst10Quest5_HORDE_Location = Inst10Quest5_Location
Inst10Quest5_HORDE_Note = Inst10Quest5_Note
Inst10Quest5_HORDE_Prequest = Inst10Quest5_Prequest
Inst10Quest5_HORDE_Folgequest = Inst10Quest5_Folgequest
Inst10Quest5PreQuest_HORDE = Inst10Quest5PreQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst10Quest6_HORDE = Inst10Quest6
Inst10Quest6_HORDE_Level = Inst10Quest6_Level
Inst10Quest6_HORDE_Attain = Inst10Quest6_Attain
Inst10Quest6_HORDE_Aim = Inst10Quest6_Aim
Inst10Quest6_HORDE_Location = Inst10Quest6_Location
Inst10Quest6_HORDE_Note = Inst10Quest6_Note
Inst10Quest6_HORDE_Prequest = Inst10Quest6_Prequest
Inst10Quest6_HORDE_Folgequest = Inst10Quest6_Folgequest
-- No Rewards for this quest



--------------- INST11 - Dire Maul North (DM) ---------------

Inst11Story = "Vor fast zwölftausend Jahren errichtete eine geheime Sekte nachtelfischer Zauberer die uralte Stadt Eldre'Thalas, um die wertvollsten Geheimnisse von Königin Azshara zu schützen. Selbst die Ruinen der Stadt, die während der Spaltung der Welt verwüstet wurde, sind immer noch äußerst beeindruckend und ehrfurchtgebietend. In den drei Flügeln der Stadt, die heute nur noch als der Düsterbruch bekannt ist, haben sich inzwischen die seltsamsten Kreaturen niedergelassen - besonders die spektralen Hochgeborenen, die hinterhältigen Satyrn und die brutalen Oger. Nur die mutigsten Abenteurer sollten sich dieser verfluchten Ruine nähern und die unglaublichen Schrecken herausfordern, die hinter den verfallenen Mauern lauern."
Inst11Caption = "Düsterbruch (Nord)"
Inst11QAA = "4 Quests"
Inst11QAH = "4 Quests"

--Quest 1 Alliance
Inst11Quest1 = "1. Die beschädigte Falle"
Inst11Quest1_Level = "60"
Inst11Quest1_Attain = "60"
Inst11Quest1_Aim = "Repariere die Falle."
Inst11Quest1_Location = "Die beschädigte Falle (Düsterbruch; "..YELLOW.."Nord"..WHITE..")"
Inst11Quest1_Note = "Wiederholbares Quest. Um die Falle zu reparieren wird ein [Thoriumapparat] und ein [Frostöl] benötigt."
Inst11Quest1_Prequest = "Nein"
Inst11Quest1_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 2 Alliance
Inst11Quest2 = "2. Der Ogeranzug der Gordok"
Inst11Quest2_Level = "60"
Inst11Quest2_Attain = "57"
Inst11Quest2_Aim = "Bringt 4 Runenstoffballen, 8 Stücke unverwüstliches Leder, 2 Runenfaden und etwas Ogergerbemittel zu Knot Zwingschraub. Momentan ist er im Gordokflügel von Düsterbruch angekettet."
Inst11Quest2_Location = "Knot Zwingschraub (Düsterbruch; "..YELLOW.."Nord, [4]"..WHITE..")"
Inst11Quest2_Note = "Wiederholbares Quest. Das Ogergerbemittel findet man nahe "..YELLOW.."[4] (oben)"..WHITE.."."
Inst11Quest2_Prequest = "Nein"
Inst11Quest2_Folgequest = "Nein"
--
Inst11Quest2name1 = "Ogeranzug der Gordok"

--Quest 3 Alliance
Inst11Quest3 = "3. Befreit Knot!"
Inst11Quest3_Level = "60"
Inst11Quest3_Attain = "60"
Inst11Quest3_Aim = "Besorgt einen Gordokfesselschlüssel für Knot Zwingschraub."
Inst11Quest3_Location = "Knot Zwingschraub (Düsterbruch; "..YELLOW.."Nord, [4]"..WHITE..")"
Inst11Quest3_Note = "Wiederholbares Quest. Jede Wache kann den Schlüssel droppen."
Inst11Quest3_Prequest = "Nein"
Inst11Quest3_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Alliance
Inst11Quest4 = "4. Die offene Rechnung der Gordok"
Inst11Quest4_Level = "60"
Inst11Quest4_Attain = "56"
Inst11Quest4_Aim = "Findet die Stulpen der Gordokmacht und bringt sie zu Hauptmann Krombruch in Düsterbruch.\nKrombruch zufolge sagen die 'Alte Zeit Geschichten', dass Tortheldrin - ein 'gruseliger' Elf, der sich selbst als Prinz bezeichnet - sie einem der Gordokkönige gestohlen hat."
Inst11Quest4_Location = "Hauptmann Krombruch (Düsterbruch; "..YELLOW.."Nord, [5]"..WHITE..")"
Inst11Quest4_Note = "Den Prinzen findet man in Düsterbruch "..YELLOW.."West"..WHITE.." bei "..YELLOW.."[7]"..WHITE..". Die Stulpen befinden sich in einer Truhe in seiner Nähe. Man kann diese Quest nur nach einem Tribut Run annehmen, wenn man den 'König'-Buff auf sich hat!"
Inst11Quest4_Prequest = "Nein"
Inst11Quest4_Folgequest = "Nein"
--
Inst11Quest4name1 = "Gordoks Handlappen"
Inst11Quest4name2 = "Gordoks Handschuhe"
Inst11Quest4name3 = "Gordoks Stulpen"
Inst11Quest4name4 = "Gordoks Handschützer"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst11Quest1_HORDE = Inst11Quest1
Inst11Quest1_HORDE_Level = Inst11Quest1_Level
Inst11Quest1_HORDE_Attain = Inst11Quest1_Attain
Inst11Quest1_HORDE_Aim = Inst11Quest1_Aim
Inst11Quest1_HORDE_Location = Inst11Quest1_Location
Inst11Quest1_HORDE_Note = Inst11Quest1_Note
Inst11Quest1_HORDE_Prequest = Inst11Quest1_Prequest
Inst11Quest1_HORDE_Folgequest = Inst11Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst11Quest2_HORDE = Inst11Quest2
Inst11Quest2_HORDE_Level = Inst11Quest2_Level
Inst11Quest2_HORDE_Attain = Inst11Quest2_Attain
Inst11Quest2_HORDE_Aim = Inst11Quest2_Aim
Inst11Quest2_HORDE_Location = Inst11Quest2_Location
Inst11Quest2_HORDE_Note = Inst11Quest2_Note
Inst11Quest2_HORDE_Prequest = Inst11Quest2_Prequest
Inst11Quest2_HORDE_Folgequest = Inst11Quest2_Folgequest
--
Inst11Quest2name1_HORDE = Inst11Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst11Quest3_HORDE = Inst11Quest3
Inst11Quest3_HORDE_Level = Inst11Quest3_Level
Inst11Quest3_HORDE_Attain = Inst11Quest3_Attain
Inst11Quest3_HORDE_Aim = Inst11Quest3_Aim
Inst11Quest3_HORDE_Location = Inst11Quest3_Location
Inst11Quest3_HORDE_Note = Inst11Quest3_Note
Inst11Quest3_HORDE_Prequest = Inst11Quest3_Prequest
Inst11Quest3_HORDE_Folgequest = Inst11Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst11Quest4_HORDE = Inst11Quest4
Inst11Quest4_HORDE_Level = Inst11Quest4_Level
Inst11Quest4_HORDE_Attain = Inst11Quest4_Attain
Inst11Quest4_HORDE_Aim = Inst11Quest4_Aim
Inst11Quest4_HORDE_Location = Inst11Quest4_Location
Inst11Quest4_HORDE_Note = Inst11Quest4_Note
Inst11Quest4_HORDE_Prequest = Inst11Quest4_Prequest
Inst11Quest4_HORDE_Folgequest = Inst11Quest4_Folgequest
--
Inst11Quest4name1_HORDE = Inst11Quest4name1
Inst11Quest4name2_HORDE = Inst11Quest4name2
Inst11Quest4name3_HORDE = Inst11Quest4name3
Inst11Quest4name4_HORDE = Inst11Quest4name4



--------------- INST12 - Dire Maul West (DM) ---------------

Inst12Story = "Vor fast zwölftausend Jahren errichtete eine geheime Sekte nachtelfischer Zauberer die uralte Stadt Eldre'Thalas, um die wertvollsten Geheimnisse von Königin Azshara zu schützen. Selbst die Ruinen der Stadt, die während der Spaltung der Welt verwüstet wurde, sind immer noch äußerst beeindruckend und ehrfurchtgebietend. In den drei Flügeln der Stadt, die heute nur noch als der Düsterbruch bekannt ist, haben sich inzwischen die seltsamsten Kreaturen niedergelassen - besonders die spektralen Hochgeborenen, die hinterhältigen Satyrn und die brutalen Oger. Nur die mutigsten Abenteurer sollten sich dieser verfluchten Ruine nähern und die unglaublichen Schrecken herausfordern, die hinter den verfallenen Mauern lauern."
Inst12Caption = "Düsterbruch (West)"
Inst12QAA = "17 Quests"
Inst12QAH = "17 Quests"

--Quest 1 Alliance
Inst12Quest1 = "1. Elfische Legenden"
Inst12Quest1_Level = "60"
Inst12Quest1_Attain = "54"
Inst12Quest1_Aim = "Sucht in Düsterbruch nach Kariel Winthalus. Meldet Euch anschließend bei der Gelehrten Runendorn in der Mondfederfeste."
Inst12Quest1_Location = "Gelehrten Runendorn (Feralas - Mondfederfeste; "..YELLOW.."31,43"..WHITE..")"
Inst12Quest1_Note = "Kariel Winthalus findet man in der "..YELLOW.."Bücherrei (West)"..WHITE.."."
Inst12Quest1_Prequest = "Nein"
Inst12Quest1_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 2 Alliance
Inst12Quest2 = "2. Der innere Wahnsinn"
Inst12Quest2_Level = "60"
Inst12Quest2_Attain = "56"
Inst12Quest2_Aim = "Zerstört alle Wächter, die um die 5 Pylonen herumstehen, welche Immol'thars Gefängnis mit Energie versorgen. Sobald die Pylone deaktiviert wurden, wird sich das Kraftfeld, das Immol'thar umgibt, auflösen.\nBetretet Immol'thars Gefängnis und vernichtet den verdorbenen Dämonen. Anschließend müsst Ihr Prinz Tortheldrin im Athenaeum entgegentreten."
Inst12Quest2_Location = "Uralte Shen'dralar (Düsterbruch; "..YELLOW.."West, [1] (oben)"..WHITE..")"
Inst12Quest2_Note = "Die Pylone sind als "..BLUE.."[B]"..WHITE.." auf der Karte gekennzeichnet. Immol'thar befindet sich bei "..YELLOW.."[6]"..WHITE..", Prinz Tortheldrin bei "..YELLOW.."[7]"..WHITE.."."
Inst12Quest2_Prequest = "Nein"
Inst12Quest2_Folgequest = "Ja, Der Schatz der Shen'dralar"
-- No Rewards for this quest

--Quest 3 Alliance
Inst12Quest3 = "3. Der Schatz der Shen'dralar"
Inst12Quest3_Level = "60"
Inst12Quest3_Attain = "57"
Inst12Quest3_Aim = "Kehrt in das Athenaeum zurück und sucht den Schatz der Shen'dralar. Nehmt Euch Eure Belohnung!"
Inst12Quest3_Location = "Uralte Shen'dralar (Düsterbruch; "..YELLOW.."West, [1]"..WHITE..")"
Inst12Quest3_Note = "Der Schatz befindet sich unterhalb der Treppe "..YELLOW.."[7]"..WHITE.."."
Inst12Quest3_Prequest = "Ja, Der innere Wahnsinn"
Inst12Quest3_Folgequest = "Nein"
Inst12Quest3FQuest = "true"
--
Inst12Quest3name1 = "Seggenstiefel"
Inst12Quest3name2 = "Hinterwaldhelm"
Inst12Quest3name3 = "Knochenzermalmer"

--Quest 4 Alliance
Inst12Quest4 = "4. Schreckensross von Xoroth (Hexenmeister)"
Inst12Quest4_Level = "60"
Inst12Quest4_Attain = "60"
Inst12Quest4_Aim = "Lest Morzuls Anweisungen. Beschwört ein xorothianisches Schreckensross, besiegt es und bindet seinen Geist an Euch."
Inst12Quest4_Location = "Mor'zul Blutbringer (Brennende Steppe; "..YELLOW.."12,31"..WHITE..")"
Inst12Quest4_Note = "Das ist das letzte Quest in der Hexenmeister Questreihe für das epische Reittier. Zuerst muss man alle Pylonen, die mit "..BLUE.."[B]"..WHITE.." gekennzeichnet sind, abschalten und anschließend Immol'thar bei "..YELLOW.."[6]"..WHITE.." töten. Danach kann man mit dem Beschwörungs Ritual beginnen. Man sollte mindestens 20 Seelensplitter bei sich haben und einen Hexenmeister speziell darauf ansetzen, die Glocke, die Kerze und das Rad aufrecht zu erhalten. Die Verdammniswachen können versklavt werden. Wenn es vorüber ist, muss man mit dem Geist des Schreckensross sprechen, um das Quest abzuschließen."
Inst12Quest4_Prequest = "Ja, Wichtellieferung ("..YELLOW.."Scholomance"..WHITE..")"
Inst12Quest4_Folgequest = "Nein"
Inst12Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst12Quest5 = "5. Der Smaragdgrüne Traum (Druide)"
Inst12Quest5_Level = "60"
Inst12Quest5_Attain = "59"
Inst12Quest5_Aim = "Bringt das Buch seinen rechtmäßigen Besitzern zurück."
Inst12Quest5_Location = "Der Smaragdgrüne Traum (droppt von einem zufälligen Boss in allen Düsterbruchflügeln)"
Inst12Quest5_Note = "Die Belohnung ist für Druiden. Das Buch gibt man in der "..YELLOW.."1' Bücherrei"..WHITE.." bei Hüter des Wissens Javon ab."
Inst12Quest5_Prequest = "Nein"
Inst12Quest5_Folgequest = "Nein"
--
Inst12Quest5name1 = "Königliches Siegel von Eldre'Thalas"

--Quest 6 Alliance
Inst12Quest6 = "6. Das größte Volk von Jägern (Jäger)"
Inst12Quest6_Level = "60"
Inst12Quest6_Attain = "54"
Inst12Quest6_Aim = "Bringt das Buch seinen rechtmäßigen Besitzern zurück."
Inst12Quest6_Location = "Das größte Volk von Jägern (droppt von einem zufälligen Boss in allen Düsterbruchflügeln)"
Inst12Quest6_Note = "Die Belohnung ist für Jäger. Das Buch gibt man in der "..YELLOW.."1' Bücherrei"..WHITE.." bei Hüterin des Wissens Mykos ab."
Inst12Quest6_Prequest = "Nein"
Inst12Quest6_Folgequest = "Nein"
--
Inst12Quest6name1 = "Königliches Siegel von Eldre'Thalas"

--Quest 7 Alliance
Inst12Quest7 = "7. Das Arkanistenkochbuch (Magier)"
Inst12Quest7_Level = "60"
Inst12Quest7_Attain = "54"
Inst12Quest7_Aim = "Bringt das Buch seinen rechtmäßigen Besitzern zurück."
Inst12Quest7_Location = "Das Arkanistenkochbuch (droppt von einem zufälligen Boss in allen Düsterbruchflügeln)"
Inst12Quest7_Note = "Die Belohnung ist für Magier. Das Buch gibt man in der "..YELLOW.."1' Bücherrei"..WHITE.." bei Hüter des Wissens Kildrath ab."
Inst12Quest7_Prequest = "Nein"
Inst12Quest7_Folgequest = "Nein"
--
Inst12Quest7name1 = "Königliches Siegel von Eldre'Thalas"

--Quest 8 Alliance
Inst12Quest8 = "8. Vom Licht und wie man es schwingt (Paladin)"
Inst12Quest8_Level = "60"
Inst12Quest8_Attain = "54"
Inst12Quest8_Aim = "Bringt das Buch seinen rechtmäßigen Besitzern zurück."
Inst12Quest8_Location = "Vom Licht und wie man es schwingt (droppt von einem zufälligen Boss in allen Düsterbruchflügeln)"
Inst12Quest8_Note = "Die Belohnung ist für Paladine. Das Buch gibt man in der "..YELLOW.."1' Bücherrei"..WHITE.." bei Hüterin des Wissens Mykos ab."
Inst12Quest8_Prequest = "Nein"
Inst12Quest8_Folgequest = "Nein"
--
Inst12Quest8name1 = "Königliches Siegel von Eldre'Thalas"

--Quest 9 Alliance
Inst12Quest9 = "9. Heiliger Fleischklops: Was das Licht Dir nicht erzählt (Priester)"
Inst12Quest9_Level = "60"
Inst12Quest9_Attain = "56"
Inst12Quest9_Aim = "Bringt das Buch seinen rechtmäßigen Besitzern zurück."
Inst12Quest9_Location = "Heiliger Fleischklops: Was das Licht Dir nicht erzählt (droppt von einem zufälligen Boss in allen Düsterbruchflügeln)"
Inst12Quest9_Note = "Die Belohnung ist für Priester. Das Buch gibt man in der "..YELLOW.."1' Bücherrei"..WHITE.." bei Hüter des Wissens Javon ab."
Inst12Quest9_Prequest = "Nein"
Inst12Quest9_Folgequest = "Nein"
--
Inst12Quest9name1 = "Königliches Siegel von Eldre'Thalas"

--Quest 10 Alliance
Inst12Quest10 = "10. Garona: Eine Studie über Heimlichkeit und Verrat (Schurke)"
Inst12Quest10_Level = "60"
Inst12Quest10_Attain = "54"
Inst12Quest10_Aim = "Bringt das Buch seinen rechtmäßigen Besitzern zurück."
Inst12Quest10_Location = "Garona: Eine Studie über Heimlichkeit und Verrat (droppt von einem zufälligen Boss in allen Düsterbruchflügeln)"
Inst12Quest10_Note = "Die Belohnung ist für Schurken. Das Buch gibt man in der "..YELLOW.."1' Bücherrei"..WHITE.." bei Hüter des Wissens Kildrath ab."
Inst12Quest10_Prequest = "Nein"
Inst12Quest10_Folgequest = "Nein"
--
Inst12Quest10name1 = "Königliches Siegel von Eldre'Thalas"

--Quest 11 Alliance
Inst12Quest11 = "11. Frostschock und Du (Schamane)"
Inst12Quest11_Level = "60"
Inst12Quest11_Attain = "59"
Inst12Quest11_Aim = "Bringt das Buch seinen rechtmäßigen Besitzern zurück."
Inst12Quest11_Location = "Frostschock und Du (droppt von einem zufälligen Boss in allen Düsterbruchflügeln)"
Inst12Quest11_Note = "Die Belohnung ist für Schamanen. Das Buch gibt man in der "..YELLOW.."1' Bücherrei"..WHITE.." bei Hüter des Wissens Javon ab."
Inst12Quest11_Prequest = "Nein"
Inst12Quest11_Folgequest = "Nein"
--
Inst12Quest11name1 = "Königliches Siegel von Eldre'Thalas"

--Quest 12 Alliance
Inst12Quest12 = "12. Schatten einspannen (Hexenmeister)"
Inst12Quest12_Level = "60"
Inst12Quest12_Attain = "54"
Inst12Quest12_Aim = "Bringt das Buch seinen rechtmäßigen Besitzern zurück."
Inst12Quest12_Location = "Schatten einspannen (droppt von einem zufälligen Boss in allen Düsterbruchflügeln)"
Inst12Quest12_Note = "Die Belohnung ist für Hexenmeister. Das Buch gibt man in der "..YELLOW.."1' Bücherrei"..WHITE.." bei Hüterin des Wissens Mykos ab."
Inst12Quest12_Prequest = "Nein"
Inst12Quest12_Folgequest = "Nein"
--
Inst12Quest12name1 = "Königliches Siegel von Eldre'Thalas"

--Quest 13 Alliance
Inst12Quest13 = "13. Kodex der Verteidigung (Krieger)"
Inst12Quest13_Level = "60"
Inst12Quest13_Attain = "57"
Inst12Quest13_Aim = "Bringt das Buch seinen rechtmäßigen Besitzern zurück."
Inst12Quest13_Location = "Kodex der Verteidigung (droppt von einem zufälligen Boss in allen Düsterbruchflügeln)"
Inst12Quest13_Note = "Die Belohnung ist für Krieger. Das Buch gibt man in der "..YELLOW.."1' Bücherrei"..WHITE.." bei Hüter des Wissens Kildrath ab."
Inst12Quest13_Prequest = "Nein"
Inst12Quest13_Folgequest = "Nein"
--
Inst12Quest13name1 = "Königliches Siegel von Eldre'Thalas"

--Quest 14 Alliance
Inst12Quest14 = "14. Buchband des Fokus"
Inst12Quest14_Level = "60"
Inst12Quest14_Attain = "60"
Inst12Quest14_Aim = "Bringt ein Buchband des Fokus, 1 makellosen schwarzen Diamanten, 4 große glänzende Splitter und 2 mal Schattenhaut, zum Hüter des Wissens Lydros in Düsterbruch, um ein Arkanum des Fokus zu erhalten."
Inst12Quest14_Location = "Hüter des Wissens Lydros (Düsterbruch West; "..YELLOW.."[1'] Bücherrei"..WHITE..")"
Inst12Quest14_Note = "Es ist nicht das Vorquest, aber Elfische Legenden muss abgeschlossen sein, bevor dieses Quest beginnen kann.\n\nDas Buch ist ein zufälliger Dropp in Düsterbruch und man kann damit Handeln, also könnte man es auch im Auktionshaus finden. Schattenhaut wird beim Aufheben gebunden und kann von einigen Bossen, Auferstandenen Konstrukten und Auferstandenen Knochenwärtern in "..YELLOW.."Scholomance"..WHITE.." droppen."
Inst12Quest14_Prequest = "Nein"
Inst12Quest14_Folgequest = "Nein"
--
Inst12Quest14name1 = "Arkanum des Fokus"

--Quest 15 Alliance
Inst12Quest15 = "15. Buchband des Schutzes"
Inst12Quest15_Level = "60"
Inst12Quest15_Attain = "60"
Inst12Quest15_Aim = "Bringt ein Buchband des Schutzes, 1 makellosen schwarzen Diamanten, 2 große glänzende Splitter und 1 ausgefranste Monstrositätenstickerei zum Hüter des Wissens Lydros in Düsterbruch, um ein Arkanum des Schutzes zu erhalten."
Inst12Quest15_Location = "Hüter des Wissens Lydros (Düsterbruch West; "..YELLOW.."[1'] Bücherrei"..WHITE..")"
Inst12Quest15_Note = "Es ist nicht das Vorquest, aber Elfische Legenden muss abgeschlossen sein, bevor dieses Quest beginnen kann.\n\nDas Buch ist ein zufälliger Dropp in Düsterbruch und man kann damit Handeln, also könnte man es auch im Auktionshaus finden. Ausgefranste Monstrositätenstickerei wird beim Aufheben gebunden und kann von Ramstein dem Verschlinger, Giftrülpsern, Gallspuckern und Flickwerkschrecken in "..YELLOW.."Stratholme"..WHITE.." droppen."
Inst12Quest15_Prequest = "No"
Inst12Quest15_Folgequest = "No"
--
Inst12Quest15name1 = "Arkanum des Schutzes"

--Quest 16 Alliance
Inst12Quest16 = "16. Buchband der Schnelligkeit"
Inst12Quest16_Level = "60"
Inst12Quest16_Attain = "60"
Inst12Quest16_Aim = "Bringt ein Buchband der Schnelligkeit, 1 makellosen schwarzen Diamanten, 2 große glänzende Splitter und 2 mal das Blut von Helden, zum Hüter des Wissens Lydros in Düsterbruch, um ein Arkanum der Schnelligkeit zu erhalten."
Inst12Quest16_Location = "Hüter des Wissens Lydros (Düsterbruch West; "..YELLOW.."[1'] Bücherrei"..WHITE..")"
Inst12Quest16_Note = "Es ist nicht das Vorquest, aber Elfische Legenden muss abgeschlossen sein, bevor dieses Quest beginnen kann.\n\nDas Buch ist ein zufälliger Dropp in Düsterbruch und man kann damit Handeln, also könnte man es auch im Auktionshaus finden. Blut von Helden wird beim Aufheben gebunden und kann an verschiedenen Plätzen in den Westlichen und Östlichen Pestländern auf dem Boden gefunden werden."
Inst12Quest16_Prequest = "Nein"
Inst12Quest16_Folgequest = "Nein"
--
Inst12Quest16name1 = "Arkanum der Schnelligkeit"

--Quest 17 Alliance
Inst12Quest17 = "17. Forors Kompendium (Krieger, Paladin)"
Inst12Quest17_Level = "60"
Inst12Quest17_Attain = "60"
Inst12Quest17_Aim = "Bringt Forors Kompendium des Drachentötens zurück in das Athenaeum."
Inst12Quest17_Location = "Forors Kompendium des Drachentötens (zufälliger Boss Dropp in "..YELLOW.."Düsterbruch"..WHITE..")"
Inst12Quest17_Note = "Krieger oder Paladin Quest. Man gibt das Buch bei Hüter des Wissens Lydros (Düsterbruch West; "..YELLOW.."[1'] Bücherrei"..WHITE..") ab. Wenn das Quest abgeschlossen ist kann man mit dem Quest für Quel'Serrar beginnen."
Inst12Quest17_Prequest = "Nein"
Inst12Quest17_Folgequest = "Ja, Das Schmieden von Quel'Serrar"
-- No Rewards for this quest


--Quest 1 Horde
Inst12Quest1_HORDE = "1. Elfische Legenden"
Inst12Quest1_HORDE_Level = "60"
Inst12Quest1_HORDE_Attain = "54"
Inst12Quest1_HORDE_Aim = "Sucht in Düsterbruch nach Kariel Winthalus. Meldet Euch anschließend bei dem Weisen Korolusk in Camp Mojache."
Inst12Quest1_HORDE_Location = "Weiser Korolusk (Feralas - Camp Mojache; "..YELLOW.."74,43"..WHITE..")"
Inst12Quest1_HORDE_Note = "Kariel Winthalus findet man in der "..YELLOW.."Bücherrei (West)"..WHITE.."."
Inst12Quest1_HORDE_Prequest = "Nein"
Inst12Quest1_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst12Quest2_HORDE = Inst12Quest2
Inst12Quest2_HORDE_Level = Inst12Quest2_Level
Inst12Quest2_HORDE_Attain = Inst12Quest2_Attain
Inst12Quest2_HORDE_Aim = Inst12Quest2_Aim
Inst12Quest2_HORDE_Location = Inst12Quest2_Location
Inst12Quest2_HORDE_Note = Inst12Quest2_Note
Inst12Quest2_HORDE_Prequest = Inst12Quest2_Prequest
Inst12Quest2_HORDE_Folgequest = Inst12Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst12Quest3_HORDE = Inst12Quest3
Inst12Quest3_HORDE_Level = Inst12Quest3_Level
Inst12Quest3_HORDE_Attain = Inst12Quest3_Attain
Inst12Quest3_HORDE_Aim = Inst12Quest3_Aim
Inst12Quest3_HORDE_Location = Inst12Quest3_Location
Inst12Quest3_HORDE_Note = Inst12Quest3_Note
Inst12Quest3_HORDE_Prequest = Inst12Quest3_Prequest
Inst12Quest3_HORDE_Folgequest = Inst12Quest3_Folgequest
Inst12Quest3FQuest_HORDE = "true"
--
Inst12Quest3name1_HORDE = Inst12Quest3name1
Inst12Quest3name2_HORDE = Inst12Quest3name2
Inst12Quest3name3_HORDE = Inst12Quest3name3

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst12Quest4_HORDE = Inst12Quest4
Inst12Quest4_HORDE_Level = Inst12Quest4_Level
Inst12Quest4_HORDE_Attain = Inst12Quest4_Attain
Inst12Quest4_HORDE_Aim = Inst12Quest4_Aim
Inst12Quest4_HORDE_Location = Inst12Quest4_Location
Inst12Quest4_HORDE_Note = Inst12Quest4_Note
Inst12Quest4_HORDE_Prequest = Inst12Quest4_Prequest
Inst12Quest4_HORDE_Folgequest = Inst12Quest4_Folgequest
Inst12Quest4PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst12Quest5_HORDE = Inst12Quest5
Inst12Quest5_HORDE_Level = Inst12Quest5_Level
Inst12Quest5_HORDE_Attain = Inst12Quest5_Attain
Inst12Quest5_HORDE_Aim = Inst12Quest5_Aim
Inst12Quest5_HORDE_Location = Inst12Quest5_Location
Inst12Quest5_HORDE_Note = Inst12Quest5_Note
Inst12Quest5_HORDE_Prequest = Inst12Quest5_Prequest
Inst12Quest5_HORDE_Folgequest = Inst12Quest5_Folgequest
--
Inst12Quest5name1_HORDE = Inst12Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst12Quest6_HORDE = Inst12Quest6
Inst12Quest6_HORDE_Level = Inst12Quest6_Level
Inst12Quest6_HORDE_Attain = Inst12Quest6_Attain
Inst12Quest6_HORDE_Aim = Inst12Quest6_Aim
Inst12Quest6_HORDE_Location = Inst12Quest6_Location
Inst12Quest6_HORDE_Note = Inst12Quest6_Note
Inst12Quest6_HORDE_Prequest = Inst12Quest6_Prequest
Inst12Quest6_HORDE_Folgequest = Inst12Quest6_Folgequest
--
Inst12Quest6name1_HORDE = Inst12Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst12Quest7_HORDE = Inst12Quest7
Inst12Quest7_HORDE_Level = Inst12Quest7_Level
Inst12Quest7_HORDE_Attain = Inst12Quest7_Attain
Inst12Quest7_HORDE_Aim = Inst12Quest7_Aim
Inst12Quest7_HORDE_Location = Inst12Quest7_Location
Inst12Quest7_HORDE_Note = Inst12Quest7_Note
Inst12Quest7_HORDE_Prequest = Inst12Quest7_Prequest
Inst12Quest7_HORDE_Folgequest = Inst12Quest7_Folgequest
--
Inst12Quest7name1_HORDE = Inst12Quest7name1

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst12Quest8_HORDE = Inst12Quest8
Inst12Quest8_HORDE_Level = Inst12Quest8_Level
Inst12Quest8_HORDE_Attain = Inst12Quest8_Attain
Inst12Quest8_HORDE_Aim = Inst12Quest8_Aim
Inst12Quest8_HORDE_Location = Inst12Quest8_Location
Inst12Quest8_HORDE_Note = Inst12Quest8_Note
Inst12Quest8_HORDE_Prequest = Inst12Quest8_Prequest
Inst12Quest8_HORDE_Folgequest = Inst12Quest8_Folgequest
--
Inst12Quest8name1_HORDE = Inst12Quest8name1

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst12Quest9_HORDE = Inst12Quest9
Inst12Quest9_HORDE_Level = Inst12Quest9_Level
Inst12Quest9_HORDE_Attain = Inst12Quest9_Attain
Inst12Quest9_HORDE_Aim = Inst12Quest9_Aim
Inst12Quest9_HORDE_Location = Inst12Quest9_Location
Inst12Quest9_HORDE_Note = Inst12Quest9_Note
Inst12Quest9_HORDE_Prequest = Inst12Quest9_Prequest
Inst12Quest9_HORDE_Folgequest = Inst12Quest9_Folgequest
--
Inst12Quest9name1_HORDE = Inst12Quest9name1

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst12Quest10_HORDE = Inst12Quest10
Inst12Quest10_HORDE_Level = Inst12Quest10_Level
Inst12Quest10_HORDE_Attain = Inst12Quest10_Attain
Inst12Quest10_HORDE_Aim = Inst12Quest10_Aim
Inst12Quest10_HORDE_Location = Inst12Quest10_Location
Inst12Quest10_HORDE_Note = Inst12Quest10_Note
Inst12Quest10_HORDE_Prequest = Inst12Quest10_Prequest
Inst12Quest10_HORDE_Folgequest = Inst12Quest10_Folgequest
--
Inst12Quest10name1_HORDE = Inst12Quest10name1

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst12Quest11_HORDE = Inst12Quest11
Inst12Quest11_HORDE_Level = Inst12Quest11_Level
Inst12Quest11_HORDE_Attain = Inst12Quest11_Attain
Inst12Quest11_HORDE_Aim = Inst12Quest11_Aim
Inst12Quest11_HORDE_Location = Inst12Quest11_Location
Inst12Quest11_HORDE_Note = Inst12Quest11_Note
Inst12Quest11_HORDE_Prequest = Inst12Quest11_Prequest
Inst12Quest11_HORDE_Folgequest = Inst12Quest11_Folgequest
--
Inst12Quest11name1_HORDE = Inst12Quest11name1

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst12Quest12_HORDE = Inst12Quest12
Inst12Quest12_HORDE_Level = Inst12Quest12_Level
Inst12Quest12_HORDE_Attain = Inst12Quest12_Attain
Inst12Quest12_HORDE_Aim = Inst12Quest12_Aim
Inst12Quest12_HORDE_Location = Inst12Quest12_Location
Inst12Quest12_HORDE_Note = Inst12Quest12_Note
Inst12Quest12_HORDE_Prequest = Inst12Quest12_Prequest
Inst12Quest12_HORDE_Folgequest = Inst12Quest12_Folgequest
--
Inst12Quest12name1_HORDE = Inst12Quest12name1

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst12Quest13_HORDE = Inst12Quest13
Inst12Quest13_HORDE_Level = Inst12Quest13_Level
Inst12Quest13_HORDE_Attain = Inst12Quest13_Attain
Inst12Quest13_HORDE_Aim = Inst12Quest13_Aim
Inst12Quest13_HORDE_Location = Inst12Quest13_Location
Inst12Quest13_HORDE_Note = Inst12Quest13_Note
Inst12Quest13_HORDE_Prequest = Inst12Quest13_Prequest
Inst12Quest13_HORDE_Folgequest = Inst12Quest13_Folgequest
--
Inst12Quest13name1_HORDE = Inst12Quest13name1

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst12Quest14_HORDE = Inst12Quest14
Inst12Quest14_HORDE_Level = Inst12Quest14_Level
Inst12Quest14_HORDE_Attain = Inst12Quest14_Attain
Inst12Quest14_HORDE_Aim = Inst12Quest14_Aim
Inst12Quest14_HORDE_Location = Inst12Quest14_Location
Inst12Quest14_HORDE_Note = Inst12Quest14_Note
Inst12Quest14_HORDE_Prequest = Inst12Quest14_Prequest
Inst12Quest14_HORDE_Folgequest = Inst12Quest14_Folgequest
--
Inst12Quest14name1_HORDE = Inst12Quest14name1

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst12Quest15_HORDE = Inst12Quest15
Inst12Quest15_HORDE_Level = Inst12Quest15_Level
Inst12Quest15_HORDE_Attain = Inst12Quest15_Attain
Inst12Quest15_HORDE_Aim = Inst12Quest15_Aim
Inst12Quest15_HORDE_Location = Inst12Quest15_Location
Inst12Quest15_HORDE_Note = Inst12Quest15_Note
Inst12Quest15_HORDE_Prequest = Inst12Quest15_Prequest
Inst12Quest15_HORDE_Folgequest = Inst12Quest15_Folgequest
--
Inst12Quest15name1_HORDE = Inst12Quest15name1

--Quest 16 Horde  (same as Quest 16 Alliance)
Inst12Quest16_HORDE = Inst12Quest16
Inst12Quest16_HORDE_Level = Inst12Quest16_Level
Inst12Quest16_HORDE_Attain = Inst12Quest16_Attain
Inst12Quest16_HORDE_Aim = Inst12Quest16_Aim
Inst12Quest16_HORDE_Location = Inst12Quest16_Location
Inst12Quest16_HORDE_Note = Inst12Quest16_Note
Inst12Quest16_HORDE_Prequest = Inst12Quest16_Prequest
Inst12Quest16_HORDE_Folgequest = Inst12Quest16_Folgequest
--
Inst12Quest16name1_HORDE = Inst12Quest16name1

--Quest 17 Horde  (same as Quest 17 Alliance)
Inst12Quest17_HORDE = Inst12Quest17
Inst12Quest17_HORDE_Level = Inst12Quest17_Level
Inst12Quest17_HORDE_Attain = Inst12Quest17_Attain
Inst12Quest17_HORDE_Aim = Inst12Quest17_Aim
Inst12Quest17_HORDE_Location = Inst12Quest17_Location
Inst12Quest17_HORDE_Note = Inst12Quest17_Note
Inst12Quest17_HORDE_Prequest = Inst12Quest17_Prequest
Inst12Quest17_HORDE_Folgequest = Inst12Quest17_Folgequest
-- No Rewards for this quest



--------------- INST13 - Maraudon (Mara) ---------------

Inst13Story = "Maraudon, eine der heiligsten Stätten in Desolace, wird von den wilden Maraudinezentauren beschützt. Der große Tempel ist die letzte Ruhestätte von Zaetar, einem der zwei unsterblichen Söhne des Halbgottes Cenarius. Die Legende besagt, dass Zaetar zusammen mit Theradras, der Prinzessin der Erdelementare, das missgestaltete Volk der Zentauren in die Welt setzte. Man sagt, dass die barbarischen Zentauren, als sie sich ihrer abscheulichen Gestalt gewahr wurden, sich von wildem Zorn beseelt auf ihren Vater stürzten und ihn ermordeten. Einige glauben, dass Theradras in ihrer Trauer den Geist von Zaetar in den gewundenen Höhlen von Maraudon einfing und seine Energien für einen bösartigen Zweck missbrauchte. Die Tunnel des Heligtums sind nun das Zuhause der finsteren Geister längst verstorbener Zentauren und Theradras eigener elementarer Diener."
Inst13Caption = "Maraudon"
Inst13QAA = "8 Quests"
Inst13QAH = "8 Quests"

--Quest 1 Alliance
Inst13Quest1 = "1. Schattensplitter"
Inst13Quest1_Level = "42"
Inst13Quest1_Attain = "39"
Inst13Quest1_Aim = "Sammelt 10 Schattensplitter in Maraudon und bringt sie zu Erzmagier Tervosh in den Düstermarschen."
Inst13Quest1_Location = "Erzmagier Tervosh (Düstermarschen - Insel Theramore; "..YELLOW.."66,49"..WHITE..")"
Inst13Quest1_Note = "Die Schattensplitter bekommt man von 'Schattensteinrumplern' oder 'Schattensteinzerkracher' außerhalb der Instanz auf der lila Seite."
Inst13Quest1_Prequest = "Nein"
Inst13Quest1_Folgequest = "Nein"
--
Inst13Quest1name1 = "Schattensplitteranhänger des Eifers"
Inst13Quest1name2 = "Vorwarnender Schattensplitteranhänger"

--Quest 2 Alliance
Inst13Quest2 = "2. Schlangenzunges Verderbnis"
Inst13Quest2_Level = "47"
Inst13Quest2_Attain = "41"
Inst13Quest2_Aim = "Füllt die beschichtete himmelblaue Phiole am orangefarbenen Kristallteich in Maraudon.\nBenutzt die gefüllte himmelblaue Phiole mit den Schlangenstrunkranken, damit der verderbte Noxxiousspross herausgezwungen wird.\nHeilt 8 Pflanzen, indem Ihr diesen Noxxiousspross tötet und kehrt dann zu Talendria an der Nijelspitze zurück."
Inst13Quest2_Location = "Talendria (Desolace - Nijelspitze; "..YELLOW.."68,8"..WHITE..")"
Inst13Quest2_Note = "Die Phiole kann bei allen Teichen im orangen Bereich außerhalb der Instanz aufgefüllt werden. Die Pflanzen findet man im orangen und lila Bereich in der Instanz."
Inst13Quest2_Prequest = "Nein"
Inst13Quest2_Folgequest = "Nein"
--
Inst13Quest2name1 = "Ring der Waldsaat"
Inst13Quest2name2 = "Weisenblattgurt"
Inst13Quest2name3 = "Astkrallenstulpen"

--Quest 3 Alliance
Inst13Quest3 = "3. Dunkles Böses"
Inst13Quest3_Level = "47"
Inst13Quest3_Attain = "41"
Inst13Quest3_Aim = "Sammelt 15 theradrische Kristallschnitzereien für Trista in Desolace."
Inst13Quest3_Location = "Trista (Desolace; "..YELLOW.."62,39"..WHITE..")"
Inst13Quest3_Note = "Die meisten Gegner in Maraudon können die Schnitzereien droppen."
Inst13Quest3_Prequest = "Nein"
Inst13Quest3_Folgequest = "Nein"
--
Inst13Quest3name1 = "Scharfsinn-Roben"
Inst13Quest3name2 = "Rüstringhelm"
Inst13Quest3name3 = "Unerbittliche Kette"
Inst13Quest3name4 = "Schulterstücke des Steinkolosses"

--Quest 4 Alliance
Inst13Quest4 = "4. Die Anweisungen des Pariahs"
Inst13Quest4_Level = "48"
Inst13Quest4_Attain = "39"
Inst13Quest4_Aim = "Lest die Anweisungen des Pariahs. Beschafft Euch danach das Amulett der Vereinigung von Maraudon und bringt es dem Zentaurenpariah im südlichen Desolace."
Inst13Quest4_Location = "Zentaurenpariah (Desolace; "..YELLOW.."45,86"..WHITE..")"
Inst13Quest4_Note = "Die 5 Khans (Beschreibung zu Die Anweisungen des Pariahs)"
Inst13Quest4_Page = {2, "Der Zentaurenpariah wandert im Süden von Desolace zwischen "..YELLOW.."44,85"..WHITE.." und "..YELLOW.."50,87"..WHITE.." umher.\nZuerst muss man den 'Namenlosen Propheten' töten ("..YELLOW.."[A] auf der Eingangskarte"..WHITE.."). Er befindet sich vor der Instanz vor der Abzweigung zwischen lilanem und orangem Eingang. Danach muss man die 5 Khans töten. Den ersten findet man, wenn man dem mittleren Gang bei der Abzweigung folgt ("..YELLOW.."[1] auf der Eingangskarte"..WHITE.."). Der zweite Khan ist im lilanen Abschnitt vor der Instanz ("..YELLOW.."[2] auf der Eingangskarte"..WHITE.."). Der dritte Khan ist im orangenen Abschnitt vor der Instanz ("..YELLOW.."[3] auf der Eingangskarte"..WHITE.."). Der vierte Khan ist nahe bei "..YELLOW.."[4]"..WHITE.." und der fünfte ist nahe bei "..YELLOW.."[1]"..WHITE..".", };
Inst13Quest4_Prequest = "Nein"
Inst13Quest4_Folgequest = "Nein"
--
Inst13Quest4name1 = "Mal der Auserwählten"

--Quest 5 Alliance
Inst13Quest5 = "5. Legenden von Maraudon"
Inst13Quest5_Level = "49"
Inst13Quest5_Attain = "41"
Inst13Quest5_Aim = "Beschafft die beiden Teile des Szepters von Celebras: den Celebriangriff und den Celebriandiamanten.\nFindet einen Weg, um mit Celebras zu sprechen."
Inst13Quest5_Location = "Cavindra (Desolace - Maraudon; "..YELLOW.."[4] auf der Eingangskarte"..WHITE..")"
Inst13Quest5_Note = "Cavindra findet man am Anfang des orangenen Abschnitts vor der Instanz.\nDen Celebriangriff bekommt man von Noxxion bei "..YELLOW.."[2]"..WHITE..", den Celebriandiamanten von Lord Schlangenzunge bei "..YELLOW.."[5]"..WHITE..". Celebras ist bei "..YELLOW.."[7]"..WHITE..". Man muss ihn besiegen um mit ihm sprechen zu können."
Inst13Quest5_Prequest = "Nein"
Inst13Quest5_Folgequest = "Ja, Das Szepter von Celebras"
-- No Rewards for this quest

--Quest 6 Alliance
Inst13Quest6 = "6. Das Szepter von Celebras"
Inst13Quest6_Level = "49"
Inst13Quest6_Attain = "41"
Inst13Quest6_Aim = "Helft Celebras dem Erlösten, während er das Szepter von Celebras herstellt.\nSprecht mit ihm, nachdem das Ritual vollendet ist."
Inst13Quest6_Location = "Celebras der Erlöste (Maraudon; "..YELLOW.."[7]"..WHITE..")"
Inst13Quest6_Note = "Celebras stellt das Szepter her. Sprecht mit ihm wenn er fertig ist."
Inst13Quest6_Prequest = "Ja, Legenden von Maraudon"
Inst13Quest6_Folgequest = "Nein"
Inst13Quest6FQuest = "true"
--
Inst13Quest6name1 = "Szepter von Celebras"

--Quest 7 Alliance
Inst13Quest7 = "7. Verderbnis von Erde und Samenkorn"
Inst13Quest7_Level = "51"
Inst13Quest7_Attain = "45"
Inst13Quest7_Aim = "Erschlagt Prinzessin Theradras und kehrt zum Bewahrer Marandis an der Nijelspitze in Desolace zurück."
Inst13Quest7_Location = "Bewahrer Marandis (Desolace - Nijelspitze; "..YELLOW.."63,10"..WHITE..")"
Inst13Quest7_Note = "Prinzessin Theradras findet man bei "..YELLOW.."[11]"..WHITE.."."
Inst13Quest7_Prequest = "Nein"
Inst13Quest7_Folgequest = "Ja, Samenkorn des Lebens"
--
Inst13Quest7name1 = "Hauklinge"
Inst13Quest7name2 = "Rute der Wiederauferstehung"
Inst13Quest7name3 = "Ziel des tiefgrünen Bewahrers"

--Quest 8 Alliance
Inst13Quest8 = "8. Samenkorn des Lebens"
Inst13Quest8_Level = "51"
Inst13Quest8_Attain = "39"
Inst13Quest8_Aim = "Sucht Remulos bei der Mondlichtung auf und gebt ihm das Samenkorn des Lebens."
Inst13Quest8_Location = "Zaetars Geist (Maraudon; "..YELLOW.."[11]"..WHITE..")"
Inst13Quest8_Note = "Zaetars Geist erscheint sobald Prinzessin Theradras ("..YELLOW.."[11]"..WHITE..") tot ist.\nBewahrer Remulos findet man in (Mondlichtung - Der Schrein von Remulos; "..YELLOW.."36,41"..WHITE..")."
Inst13Quest8_Prequest = "Ja, Verderbnis von Erde und Samenkorn"
Inst13Quest8_Folgequest = "Nein"
Inst13Quest8FQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde
Inst13Quest1_HORDE = "1. Schattensplitter"
Inst13Quest1_HORDE_Level = "42"
Inst13Quest1_HORDE_Attain = "39"
Inst13Quest1_HORDE_Aim = "Sammelt 10 Schattensplitter aus Maraudon und bringt sie zu Uthel'nay nach Orgrimmar."
Inst13Quest1_HORDE_Location = "Uthel'nay (Orgrimmar - Das Tal der Geister; "..YELLOW.."39,86"..WHITE..")"
Inst13Quest1_HORDE_Note = "Die Schattensplitter bekommt man von 'Schattensteinrumplern' oder 'Schattensteinzerkracher' außerhalb der Instanz auf der lila Seite."
Inst13Quest1_HORDE_Prequest = "Nein"
Inst13Quest1_HORDE_Folgequest = "Nein"
--
Inst13Quest1name1_HORDE = "Schattensplitteranhänger des Eifers"
Inst13Quest1name2_HORDE = "Vorwarnender Schattensplitteranhänger"

--Quest 2 Horde
Inst13Quest2_HORDE = "2. Schlangenzunges Verderbnis"
Inst13Quest2_HORDE_Level = "47"
Inst13Quest2_HORDE_Attain = "41"
Inst13Quest2_HORDE_Aim = "Füllt die beschichtete himmelblaue Phiole am orangefarbenen Kristallteich in Maraudon.\nBenutzt die gefüllte himmelblaue Phiole mit den Schlangenstrunkranken, damit der verderbte Noxxiousspross herausgezwungen wird.\nHeilt 8 Pflanzen, indem Ihr diesen Noxxiousspross tötet und kehrt dann zu Vark Schlachtnarbe in Schattenflucht zurück."
Inst13Quest2_HORDE_Location = "Vark Schlachtnarbe (Desolace - Schattenflucht; "..YELLOW.."23,70"..WHITE..")"
Inst13Quest2_HORDE_Note = "Die Phiole kann bei allen Teichen im orangen Bereich außerhalb der Instanz aufgefüllt werden. Die Pflanzen findet man im orangen und lila Bereich in der Instanz."
Inst13Quest2_HORDE_Prequest = "Nein"
Inst13Quest2_HORDE_Folgequest = "Nein"
--
Inst13Quest2name1_HORDE = "Ring der Waldsaat"
Inst13Quest2name2_HORDE = "Weisenblattgurt"
Inst13Quest2name3_HORDE = "Astkrallenstulpen"

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst13Quest3_HORDE = Inst13Quest3
Inst13Quest3_HORDE_Level = Inst13Quest3_Level
Inst13Quest3_HORDE_Attain = Inst13Quest3_Attain
Inst13Quest3_HORDE_Aim = Inst13Quest3_Aim
Inst13Quest3_HORDE_Location = Inst13Quest3_Location
Inst13Quest3_HORDE_Note = Inst13Quest3_Note
Inst13Quest3_HORDE_Prequest = Inst13Quest3_Prequest
Inst13Quest3_HORDE_Folgequest = Inst13Quest3_Folgequest
--
Inst13Quest3name1_HORDE = Inst13Quest3name1
Inst13Quest3name2_HORDE = Inst13Quest3name2
Inst13Quest3name3_HORDE = Inst13Quest3name3
Inst13Quest3name4_HORDE = Inst13Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst13Quest4_HORDE = Inst13Quest4
Inst13Quest4_HORDE_Level = Inst13Quest4_Level
Inst13Quest4_HORDE_Attain = Inst13Quest4_Attain
Inst13Quest4_HORDE_Aim = Inst13Quest4_Aim
Inst13Quest4_HORDE_Location = Inst13Quest4_Location
Inst13Quest4_HORDE_Note = Inst13Quest4_Note
Inst13Quest4_HORDE_Page = Inst13Quest4_Page
Inst13Quest4_HORDE_Prequest = Inst13Quest4_Prequest
Inst13Quest4_HORDE_Folgequest = Inst13Quest4_Folgequest
--
Inst13Quest4name1_HORDE = Inst13Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst13Quest5_HORDE = Inst13Quest5
Inst13Quest5_HORDE_Level = Inst13Quest5_Level
Inst13Quest5_HORDE_Attain = Inst13Quest5_Attain
Inst13Quest5_HORDE_Aim = Inst13Quest5_Aim
Inst13Quest5_HORDE_Location = Inst13Quest5_Location
Inst13Quest5_HORDE_Note = Inst13Quest5_Note
Inst13Quest5_HORDE_Prequest = Inst13Quest5_Prequest
Inst13Quest5_HORDE_Folgequest = Inst13Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst13Quest6_HORDE = Inst13Quest6
Inst13Quest6_HORDE_Level = Inst13Quest6_Level
Inst13Quest6_HORDE_Attain = Inst13Quest6_Attain
Inst13Quest6_HORDE_Aim = Inst13Quest6_Aim
Inst13Quest6_HORDE_Location = Inst13Quest6_Location
Inst13Quest6_HORDE_Note = Inst13Quest6_Note
Inst13Quest6_HORDE_Prequest = Inst13Quest6_Prequest
Inst13Quest6_HORDE_Folgequest = Inst13Quest6_Folgequest
Inst13Quest6FQuest_HORDE = Inst13Quest6FQuest
--
Inst13Quest6name1_HORDE = Inst13Quest6name1

--Quest 7 Horde
Inst13Quest7_HORDE = "7. Verderbnis von Erde und Samenkorn"
Inst13Quest7_HORDE_Level = "51"
Inst13Quest7_HORDE_Attain = "45"
Inst13Quest7_HORDE_Aim = "Tötet Prinzessin Theradras und kehrt zu Selendra in der Nähe von Schattenflucht in Desolace zurück."
Inst13Quest7_HORDE_Location = "Selendra (Desolace; "..YELLOW.."27,77"..WHITE..")"
Inst13Quest7_HORDE_Note = "Prinzessin Theradras findet man bei "..YELLOW.."[11]"..WHITE..""
Inst13Quest7_HORDE_Prequest = "Nein"
Inst13Quest7_HORDE_Folgequest = "Ja, Samenkorn des Lebens"
--
Inst13Quest7name1_HORDE = "Hauklinge"
Inst13Quest7name2_HORDE = "Rute der Wiederauferstehung"
Inst13Quest7name3_HORDE = "Ziel des tiefgrünen Bewahrers"

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst13Quest8_HORDE = Inst13Quest8
Inst13Quest8_HORDE_Level = Inst13Quest8_Level
Inst13Quest8_HORDE_Attain = Inst13Quest8_Attain
Inst13Quest8_HORDE_Aim = Inst13Quest8_Aim
Inst13Quest8_HORDE_Location = Inst13Quest8_Location
Inst13Quest8_HORDE_Note = Inst13Quest8_Note
Inst13Quest8_HORDE_Prequest = Inst13Quest8_Prequest
Inst13Quest8_HORDE_Folgequest = Inst13Quest8_Folgequest
Inst13Quest8FQuest_HORDE = Inst13Quest8FQuest
-- No Rewards for this quest



--------------- INST14 - Molten Core (MC) ---------------

Inst14Story = "Der geschmolzene Kern befindet sich am tiefsten Punkt des Schwarzfels. Genau hier, im Herzen des Berges, beschwor Imperator Thaurissan vor langer Zeit in einem Akt der Verzweiflung den elementaren Feuerfürsten Ragnaros, um seinen gescheiterten Putsch gegen die Zwerge von Eisenschmiede doch noch in einen Sieg zu verwandeln. Obwohl der Feuerfürst immer in der Nähe des feurigen Kerns bleiben muss, treiben seine Offiziere die Dunkeleisenzwerge gnadenlos dazu an, ihm eine Armee aus lebendem Gestein zu erschaffen. Der See aus Magma, in dem Ragnaros schläft, ist in Wirklichkeit ein interplanarer Riss, durch den bösartige Feuerelementare von der Ebene des Feuers nach Azeroth gelangen. Der höchstrangige von Ragnaros' Untergebenen ist Majordomus Exekutus, der als einziger in der Lage ist, den schlafenden Feuerfürsten zu wecken."
Inst14Caption = "Geschmolzener Kern"
Inst14QAA = "5 Quests"
Inst14QAH = "5 Quests"

--Quest 1 Alliance
Inst14Quest1 = "1. Der geschmolzene Kern"
Inst14Quest1_Level = "60"
Inst14Quest1_Attain = "58"
Inst14Quest1_Aim = "Tötet 1 Feuerlord, 1 geschmolzenen Riesen, 1 uralten Kernhund sowie 1 Lavawoger und kehrt dann zu Fürst Hydraxis in Azshara zurück."
Inst14Quest1_Location = "Fürst Hydraxis (Azshara; "..YELLOW.."79,73"..WHITE..")"
Inst14Quest1_Note = "Es handelt sich um Nicht-Boss Gegner."
Inst14Quest1_Prequest = "Ja, Auge des Glutsehers ("..YELLOW.."Obere Schwarzfelsspitze"..WHITE..")"
Inst14Quest1_Folgequest = "Ja, Agent von Hydraxis"
Inst14Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst14Quest2 = "2. Hände des Feindes"
Inst14Quest2_Level = "60"
Inst14Quest2_Attain = "60"
Inst14Quest2_Aim = "Bringt die Hände von Lucifron, Sulfuron, Gehennas und Shazzrah zu Fürst Hydraxis in Azshara."
Inst14Quest2_Location = "Fürst Hydraxis (Azshara; "..YELLOW.."79,73"..WHITE..")"
Inst14Quest2_Note = "Lucifron befindet sich bei "..YELLOW.."[1]"..WHITE..", Sulfuron bei "..YELLOW.."[8]"..WHITE..", Gehennas bei "..YELLOW.."[3]"..WHITE.." und Shazzrah bei "..YELLOW.."[5]"..WHITE.."."
Inst14Quest2_Prequest = "Ja, Agent von Hydraxis"
Inst14Quest2_Folgequest = "Ja, Die Belohnung eines Helden"
Inst14Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst14Quest3 = "3. Donneraan der Windsucher"
Inst14Quest3_Level = "60"
Inst14Quest3_Attain = "60"
Inst14Quest3_Aim = "Um Donneraan den Windsucher aus seiner Gefangenschaft zu befreien, müsst Ihr Hochlord Demitrian die rechten und linken Hälften der Fesseln des Windsuchers, 10 Elementiumbarren und die Essenz des Feuerfürsten bringen."
Inst14Quest3_Location = "Hochlord Demitrian (Silithus; "..YELLOW.."22,9"..WHITE..")"
Inst14Quest3_Note = "Teil der Donnerzorn, Gesegnete Klinge des Windsuchers Questreihe. Sie beginnt nachdem man entweder die linken oder die rechten Fesseln des Windsuchers von Garr bei "..YELLOW.."[4]"..WHITE.." oder von Baron Geddon bei "..YELLOW.."[6]"..WHITE.." erbeutet. Danach spricht man mit Hochlord Demitrian um die Questreihe zu starten. Essenz des Feuerfürsten droppt von Ragnaros bei "..YELLOW.."[10]"..WHITE..". Nachdem dieser Teil abgeschlossen wurde, muss man Prinz Donneraan beschwören und ihn töten. Es handelt sich um einen 40-Mann Schlachtzug Boss."
Inst14Quest3_Prequest = "Ja, Untersuchung des Gefäßes"
Inst14Quest3_Folgequest = "Ja, Donnerzorn erwache!"
Inst14Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst14Quest4 = "4. Ein verbindlicher Vertrag"
Inst14Quest4_Level = "60"
Inst14Quest4_Attain = "60"
Inst14Quest4_Aim = "Bringt den Vertrag der Thoriumbruderschaft zu Lokhtos Düsterfeilsch, wenn Ihr die Pläne für das Sulfuron erhalten möchtet."
Inst14Quest4_Location = "Lokhtos Düsterfeilsch (Schwarzfelstiefen; "..YELLOW.."[15]"..WHITE..")"
Inst14Quest4_Note = "Man benötigt einen Sulfuronblock, um den Vertrag von Lokhtos zu bekommen. Diese droppen von Golemagg dem Verbrenner im Geschmolzenen Kern bei "..YELLOW.."[7]"..WHITE.."."
Inst14Quest4_Prequest = "Nein"
Inst14Quest4_Folgequest = "Nein"
--
Inst14Quest4name1 = "Pläne: Sulfuronhammer"

--Quest 5 Alliance
Inst14Quest5 = "5. Das uralte Blatt"
Inst14Quest5_Level = "60"
Inst14Quest5_Attain = "60"
Inst14Quest5_Aim = "Findet den Besitzer des uralten, versteinerten Blatts."
Inst14Quest5_Location = "Uraltes versteinertes Blatt (droppt vom Behälter des Feuerfürsten; "..YELLOW.."[9]"..WHITE..")"
Inst14Quest5_Note = "Abzugeben bei Vartrus dem Uralten in (Teufelswald - Der Eisenwald; "..YELLOW.."49,24"..WHITE..")."
Inst14Quest5_Prequest = "Nein"
Inst14Quest5_Folgequest = "Ja, Uraltes in Sehnen eingewickeltes Laminablatt ("..YELLOW.."Azuregos"..WHITE..")"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst14Quest1_HORDE = Inst14Quest1
Inst14Quest1_HORDE_Level = Inst14Quest1_Level
Inst14Quest1_HORDE_Attain = Inst14Quest1_Attain
Inst14Quest1_HORDE_Aim = Inst14Quest1_Aim
Inst14Quest1_HORDE_Location = Inst14Quest1_Location
Inst14Quest1_HORDE_Note = Inst14Quest1_Note
Inst14Quest1_HORDE_Prequest = Inst14Quest1_Prequest
Inst14Quest1_HORDE_Folgequest = Inst14Quest1_Folgequest
Inst14Quest1PreQuest_HORDE = Inst14Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst14Quest2_HORDE = Inst14Quest2
Inst14Quest2_HORDE_Level = Inst14Quest2_Level
Inst14Quest2_HORDE_Attain = Inst14Quest2_Attain
Inst14Quest2_HORDE_Aim = Inst14Quest2_Aim
Inst14Quest2_HORDE_Location = Inst14Quest2_Location
Inst14Quest2_HORDE_Note = Inst14Quest2_Note
Inst14Quest2_HORDE_Prequest = Inst14Quest2_Prequest
Inst14Quest2_HORDE_Folgequest = Inst14Quest2_Folgequest
Inst14Quest2FQuest_HORDE = Inst14Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst14Quest3_HORDE = Inst14Quest3
Inst14Quest3_HORDE_Level = Inst14Quest3_Level
Inst14Quest3_HORDE_Attain = Inst14Quest3_Attain
Inst14Quest3_HORDE_Aim = Inst14Quest3_Aim
Inst14Quest3_HORDE_Location = Inst14Quest3_Location
Inst14Quest3_HORDE_Note = Inst14Quest3_Note
Inst14Quest3_HORDE_Prequest = Inst14Quest3_Prequest
Inst14Quest3_HORDE_Folgequest = Inst14Quest3_Folgequest
Inst14Quest3PreQuest_HORDE = Inst14Quest3PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst14Quest4_HORDE = Inst14Quest4
Inst14Quest4_HORDE_Level = Inst14Quest4_Level
Inst14Quest4_HORDE_Attain = Inst14Quest4_Attain
Inst14Quest4_HORDE_Aim = Inst14Quest4_Aim
Inst14Quest4_HORDE_Location = Inst14Quest4_Location
Inst14Quest4_HORDE_Note = Inst14Quest4_Note
Inst14Quest4_HORDE_Prequest = Inst14Quest4_Prequest
Inst14Quest4_HORDE_Folgequest = Inst14Quest4_Folgequest
--
Inst14Quest4name1_HORDE = Inst14Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst14Quest5_HORDE = Inst14Quest5
Inst14Quest5_HORDE_Level = Inst14Quest5_Level
Inst14Quest5_HORDE_Attain = Inst14Quest5_Attain
Inst14Quest5_HORDE_Aim = Inst14Quest5_Aim
Inst14Quest5_HORDE_Location = Inst14Quest5_Location
Inst14Quest5_HORDE_Note = Inst14Quest5_Note
Inst14Quest5_HORDE_Prequest = Inst14Quest5_Prequest
Inst14Quest5_HORDE_Folgequest = Inst14Quest5_Folgequest
-- No Rewards for this quest



--------------- INST15 - Naxxramas (Naxx) ---------------

Inst15Story = "Hoch über den Pestländern schwebt die Nekropole Naxxramas, die Kel'Thuzad, einem der mächtigsten Offiziere des Lichkönigs, als Heimstatt dient. Schrecken der Vergangenheit und noch unbekannte Grauen warten darauf, auf die Welt losgelassen zu werden, während sich die Diener der Geißel auf ihren Ansturm vorbereiten. Bald wird die Geißel erneut marschieren..."
Inst15Caption = "Naxxramas"
Inst15QAA = "5 Quests"
Inst15QAH = "5 Quests"

--Quest 1 Alliance
Inst15Quest1 = "1. Der Niedergang Kel'Thuzads"
Inst15Quest1_Level = "60"
Inst15Quest1_Attain = "60"
Inst15Quest1_Aim = "Bringt Kel'Thuzads Phylakterium zur Kapelle des hoffnungsvollen Lichts in den Östlichen Pestländern."
Inst15Quest1_Location = "Kel'Thuzad (Naxxramas; "..YELLOW.."Grüne 2"..WHITE..")"
Inst15Quest1_Note = "Vater Inigo Montoy (Östliche Pestländer - Kapelle des hoffnungsvollen Lichts; "..YELLOW.."81,58"..WHITE..")"
Inst15Quest1_Prequest = "Nein"
Inst15Quest1_Folgequest = "Nein"
--
Inst15Quest1name1 = "Mal des Helden"
Inst15Quest1name2 = "Mal des Helden"

--Quest 2 Alliance
Inst15Quest2 = "2. Das Einzige, das ich kann..."
Inst15Quest2_Level = "60"
Inst15Quest2_Attain = "60"
Inst15Quest2_Aim = "Handwerker Wilhelm in der Kapelle des hoffnungsvollen Lichts möchte, dass Ihr ihm 2 gefrorene Runen, 2 Essenzen des Wassers, 2 blaue Saphire und 30 Goldstücke bringt."
Inst15Quest2_Location = "Handwerker Wilhelm (Östliche Pestländer - Kapelle des hoffnungsvollen Lichts; "..YELLOW.."81,60"..WHITE..")"
Inst15Quest2_Note = "Gefrorene Runen gibt es von Unheiligen Äxten in Naxxramas."
Inst15Quest2_Prequest = "Nein"
Inst15Quest2_Folgequest = "Nein"
--
Inst15Quest2name1 = "Gletschergamaschen"
Inst15Quest2name2 = "Eisfluchgamaschen"
Inst15Quest2name3 = "Eisschuppengamaschen"
Inst15Quest2name4 = "Polargamaschen"

--Quest 3 Alliance
Inst15Quest3 = "3. Echo des Krieges"
Inst15Quest3_Level = "60"
Inst15Quest3_Attain = "60"
Inst15Quest3_Aim = "Kommandant Eligor Morgenbringer bei der Kapelle des hoffnungsvollen Lichts in den östlichen Pestländern möchte, dass Ihr 5 lebende Monstrositäten, 5 Steinhautgargoyles, 8 Hauptmänner der Todesritter und 3 Giftpirscher tötet."
Inst15Quest3_Location = "Kommandant Eligor Morgenbringer (Östliche Pestländer - Kapelle des hoffnungsvollen Lichts; "..YELLOW.."82,58"..WHITE..")"
Inst15Quest3_Note = "Die Gegner, die von diesem Quest betroffen sind, befinden sich am Anfang von jedem Flügel in Naxxramas. Dieses Quest ist erforderlich für die Tier 3 Rüstungs Quests."
Inst15Quest3_Prequest = "Nein"
Inst15Quest3_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Alliance
Inst15Quest4 = "4. Ramaladnis Schicksal"
Inst15Quest4_Level = "60"
Inst15Quest4_Attain = "60"
Inst15Quest4_Aim = "Betretet Naxxramas und bringt Ramaladnis Schicksal in Erfahrung."
Inst15Quest4_Location = "Korfax der Held des Lichts (Östliche Pestländer - Kapelle des hoffnungsvollen Lichts; "..YELLOW.."82,58"..WHITE..")"
Inst15Quest4_Note = "Der Ring für dieses Quest ist ein zufälliger Dropp in Naxxramas. Jeder der das Quest hat, kann ihn an sich nehmen."
Inst15Quest4_Prequest = "Nein"
Inst15Quest4_Folgequest = "Ja, Ramaladnis eisiger Griff"
-- No Rewards for this quest

--Quest 5 Alliance
Inst15Quest5 = "5. Ramaladnis eisiger Griff"
Inst15Quest5_Level = "60"
Inst15Quest5_Attain = "60"
Inst15Quest5_Aim = "Korfax in der Kapelle des hoffnungsvollen Lichtes möchte, dass Ihr ihm 1 gefrorene Rune, 1 blauen Saphir und 1 Arkanitbarren bringt."
Inst15Quest5_Location = "Korfax der Held des Lichts (Östliche Pestländer - Kapelle des hoffnungsvollen Lichts; "..YELLOW.."82,58"..WHITE..")"
Inst15Quest5_Note = "Gefrorene Runen gibt es von Unheiligen Äxten in Naxxramas."
Inst15Quest5_Prequest = "Ja, Ramaladnis Schicksal"
Inst15Quest5_Folgequest = "Nein"
Inst15Quest5FQuest = "true"
--
Inst15Quest5name1 = "Ramaladnis eisiger Griff"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst15Quest1_HORDE = Inst15Quest1
Inst15Quest1_HORDE_Level = Inst15Quest1_Level
Inst15Quest1_HORDE_Attain = Inst15Quest1_Attain
Inst15Quest1_HORDE_Aim = Inst15Quest1_Aim
Inst15Quest1_HORDE_Location = Inst15Quest1_Location
Inst15Quest1_HORDE_Note = Inst15Quest1_Note
Inst15Quest1_HORDE_Prequest = Inst15Quest1_Prequest
Inst15Quest1_HORDE_Folgequest = Inst15Quest1_Folgequest
--
Inst15Quest1name1_HORDE = Inst15Quest1name1
Inst15Quest1name2_HORDE = Inst15Quest1name2
Inst15Quest1name3_HORDE = Inst15Quest1name3

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst15Quest2_HORDE = Inst15Quest2
Inst15Quest2_HORDE_Level = Inst15Quest2_Level
Inst15Quest2_HORDE_Attain = Inst15Quest2_Attain
Inst15Quest2_HORDE_Aim = Inst15Quest2_Aim
Inst15Quest2_HORDE_Location = Inst15Quest2_Location
Inst15Quest2_HORDE_Note = Inst15Quest2_Note
Inst15Quest2_HORDE_Prequest = Inst15Quest2_Prequest
Inst15Quest2_HORDE_Folgequest = Inst15Quest2_Folgequest
--
Inst15Quest2name1_HORDE = Inst15Quest2name1
Inst15Quest2name2_HORDE = Inst15Quest2name2
Inst15Quest2name3_HORDE = Inst15Quest2name3
Inst15Quest2name4_HORDE = Inst15Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst15Quest3_HORDE = Inst15Quest3
Inst15Quest3_HORDE_Level = Inst15Quest3_Level
Inst15Quest3_HORDE_Attain = Inst15Quest3_Attain
Inst15Quest3_HORDE_Aim = Inst15Quest3_Aim
Inst15Quest3_HORDE_Location = Inst15Quest3_Location
Inst15Quest3_HORDE_Note = Inst15Quest3_Note
Inst15Quest3_HORDE_Prequest = Inst15Quest3_Prequest
Inst15Quest3_HORDE_Folgequest = Inst15Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst15Quest4_HORDE = Inst15Quest4
Inst15Quest4_HORDE_Level = Inst15Quest4_Level
Inst15Quest4_HORDE_Attain = Inst15Quest4_Attain
Inst15Quest4_HORDE_Aim = Inst15Quest4_Aim
Inst15Quest4_HORDE_Location = Inst15Quest4_Location
Inst15Quest4_HORDE_Note = Inst15Quest4_Note
Inst15Quest4_HORDE_Prequest = Inst15Quest4_Prequest
Inst15Quest4_HORDE_Folgequest = Inst15Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst15Quest5_HORDE = Inst15Quest5
Inst15Quest5_HORDE_Level = Inst15Quest5_Level
Inst15Quest5_HORDE_Attain = Inst15Quest5_Attain
Inst15Quest5_HORDE_Aim = Inst15Quest5_Aim
Inst15Quest5_HORDE_Location = Inst15Quest5_Location
Inst15Quest5_HORDE_Note = Inst15Quest5_Note
Inst15Quest5_HORDE_Prequest = Inst15Quest5_Prequest
Inst15Quest5_HORDE_Folgequest = Inst15Quest5_Folgequest
Inst15Quest5FQuest_HORDE = Inst15Quest5FQuest
--
Inst15Quest5name1_HORDE = Inst15Quest5name1



--------------- INST16 - Onyxia's Lair (Ony) ---------------

Inst16Story = "Onyxia ist die Tochter des mächtigen Drachen Todesschwinge und die Schwester des gerissenen Nefarian, dem Fürsten des Schwarzfels. Selbst für einen Drachen ist Onyxia äußerst intelligent, und sie nimmt gerne die Form einer Sterblichen an, um sich heimlich in die politischen Angelegenheiten der sterblichen Völker einzumischen. Obwohl sie für einen schwarzen Drachen ihres Alters recht klein ist, verfügt sie dennoch über die gleichen Kräfte und Fähigkeiten wie der Rest ihres fürchterlichen Schwarms. Manche sagen, Onyxia habe sogar eine Tarnidentität ihres Vaters übernommen - den Titel des königlichen Hauses Prestor. Wenn sie sich nicht in den Angelegenheiten der Sterblichen einmischt, ruht Onyxia in einer feurigen Höhle unterhalb des Drachensumpfes, einer unwirtlichen Gegend der Düstermarschen. Dort wird sie von ihren Gefolgsleuten bewacht, den verbleibenden Mitgliedern des grausamen schwarzen Drachenschwarms"
Inst16Caption = "Onyxias Hort"
Inst16QAA = "2 Quests"
Inst16QAH = "2 Quests"

--Quest 1 Alliance
Inst16Quest1 = "1. Das Schmieden von Quel'Serrar"
Inst16Quest1_Level = "60"
Inst16Quest1_Attain = "60"
Inst16Quest1_Aim = "Bringt Onyxia dazu, ihren Feueratem auf die noch unerhitzte Klinge zu benutzen. Sobald dies geschehen ist, hebt die erhitzte Klinge wieder auf. Doch seid gewarnt, die erhitzte Klinge wird nicht auf ewig erhitzt bleiben - behaltet also die Zeit im Auge."
Inst16Quest1_Location = "Hüter des Wissens Lydros (Düsterbruch West; "..YELLOW.."[1'] Bücherrei"..WHITE..")"
Inst16Quest1_Note = "Lasst das Schwert vor Onyxia fallen, wenn sie bei 10% bis 15% ihrer Lebenspunkte ist. Sie wird Feuer darauf spucken und es damit erhitzen. Wenn Onyxia stirbt, nimmt man das Schwert wieder auf und benutzt es mit ihrem toten Körper. Danach kann man das Quest abgeben."
Inst16Quest1_Prequest = "Ja, Forors Kompendium ("..YELLOW.."Düsterbruch West"..WHITE..") -> Das Schmieden von Quel'Serrar"
Inst16Quest1_Folgequest = "Nein"
Inst16Quest1PreQuest = "true"
--
Inst16Quest1name1 = "Quel'Serrar"

--Quest 2 Alliance
Inst16Quest2 = "2. Sieg für die Allianz"
Inst16Quest2_Level = "60"
Inst16Quest2_Attain = "60"
Inst16Quest2_Aim = "Bringt Onyxias Kopf zu Hochlord Bolvar Drachenwill in Sturmwind."
Inst16Quest2_Location = "Onyxias Kopf (droppt von Onyxia; "..YELLOW.."[3]"..WHITE..")"
Inst16Quest2_Note = "Hochlord Bolvar Drachenwill befindet sich in (Sturmwind - Burg Sturmwind; "..YELLOW.."78,20"..WHITE.."). Nur eine Person im Schlachtzug kann den Kopf an sich nehmen und das Quest kann nur einmal abgeschlossen werden.\n\nDie Belohnungen sind für das Folgequest."
Inst16Quest2_Prequest = "Nein"
Inst16Quest2_Folgequest = "Ja, Gute Zeiten feiern"
--
Inst16Quest2name1 = "Talisman mit Onyxiablut"
Inst16Quest2name2 = "Drachentötersignet"
Inst16Quest2name3 = "Zahn Onyxias"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst16Quest1_HORDE = Inst16Quest1
Inst16Quest1_HORDE_Attain = Inst16Quest1_Attain
Inst16Quest1_HORDE_Level = Inst16Quest1_Level
Inst16Quest1_HORDE_Aim = Inst16Quest1_Aim
Inst16Quest1_HORDE_Location = Inst16Quest1_Location
Inst16Quest1_HORDE_Note = Inst16Quest1_Note
Inst16Quest1_HORDE_Prequest = Inst16Quest1_Prequest
Inst16Quest1_HORDE_Folgequest = Inst16Quest1_Folgequest
Inst16Quest1PreQuest_HORDE = Inst16Quest1PreQuest
--
Inst16Quest1name1_HORDE = Inst16Quest1name1

--Quest 2 Horde
Inst16Quest2_HORDE = "2. Sieg für die Horde"
Inst16Quest2_HORDE_Level = "60"
Inst16Quest2_HORDE_Attain = "60"
Inst16Quest2_HORDE_Aim = "Bringt Onyxias Kopf zu Thrall in Orgrimmar."
Inst16Quest2_HORDE_Location = "Onyxias Kopf (droppt von Onyxia; "..YELLOW.."[3]"..WHITE..")"
Inst16Quest2_HORDE_Note = "Thrall befindet sich in (Orgrimmar - Das Tal der Weisheit; "..YELLOW.."31,37"..WHITE.."). Nur eine Person im Schlachtzug kann den Kopf an sich nehmen und das Quest kann nur einmal abgeschlossen werden.\n\nDie Belohnungen sind für das Folgequest."
Inst16Quest2_HORDE_Prequest = "Nein"
Inst16Quest2_HORDE_Folgequest = "Ja, Für alle sichtbar"
--
Inst16Quest2name1_HORDE = "Talisman mit Onyxiablut"
Inst16Quest2name2_HORDE = "Drachentötersignet"
Inst16Quest2name3_HORDE = "Zahn Onyxias"



--------------- INST17 - Razorfen Downs (RFD) ---------------

Inst17Story = "Die Hügel der Klingenhauer, die von den selben dornigen Ranken wie der Kral der Klingenhauer dominiert werden, beherbergen seit jeher die Hauptstadt des Volks der Stacheleber. In dem weitläufigen, dornenverseuchten Labyrinth hält sich eine riesige Armee wilder Stacheleberkrieger auf, die ihr Leben darauf geschworen haben, ihre Hohepriester - die Mitglieder des Totenkopfstammes - um jeden Preis zu beschützen. Vor Kurzem hat sich jedoch ein unheilbringender Schatten über den kruden Bau gelegt. Abgesandte der untoten Geißel unter der Führung des Lichs Amnennar der Kältebringer haben die Kontrolle über das Volk der Stacheleber übernommen und das Labyrinth der Dornen in eine vorgeschobene Bastion untoter Macht verwandelt. Nun kämpfen die Stacheleber einen verzweifelten Kampf gegen die Zeit, denn Amnennars Einfluss dehnt sich jeden Tag weiter aus. Wenn er nicht aufgehalten wird, ist es nur eine Frage der Zeit, bis das Banner der Geißel über dem Brachland wehen wird."
Inst17Caption = "Hügel der Klingenhauer"
Inst17QAA = "3 Quests"
Inst17QAH = "4 Quests"

--Quest 1 Alliance
Inst17Quest1 = "1. Ein Hort des Bösen"
Inst17Quest1_Level = "35"
Inst17Quest1_Attain = "28"
Inst17Quest1_Aim = "Tötet 8 Schlachtwachen der Klingenhauer, 8 Dornenwirker der Klingenhauer und 8 Kultistinnen der Totenköpfe und kehrt dann zu Myriam Mondsang nahe dem Eingang zu den Hügeln der Klingenhauer zurück."
Inst17Quest1_Location = "Myriam Mondsang (Das Brachland; "..YELLOW.."49,94 "..WHITE..")"
Inst17Quest1_Note = "Die Gegner und der Questgeber befinden sich außerhalb der Instanz."
Inst17Quest1_Prequest = "Nein"
Inst17Quest1_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 2 Alliance
Inst17Quest2 = "2. Ausschalten des Götzen"
Inst17Quest2_Level = "37"
Inst17Quest2_Attain = "34"
Inst17Quest2_Aim = "Begleitet Belnistrasz zum Götzen der Stacheleber in den Hügeln der Klingenhauer. Beschützt Belnistrasz, während er das Ritual durchführt, um den Götzen auszuschalten."
Inst17Quest2_Location = "Belnistrasz (Hügel der Klingenhauer; "..YELLOW.."[2]"..WHITE..")"
Inst17Quest2_Note = "Beim Vorquest muss man sich nur dazu bereit erklären ihm zu helfen. Einige Gegner erscheinen und greifen Belnistrasz an, während er versucht den Götzen auszuschalten. Wenn man das Quest beendet hat, kann man es direkt vor dem Götzen abgeben."
Inst17Quest2_Prequest = "Ja, Geißel der Niederungen"
Inst17Quest2_Folgequest = "Nein"
Inst17Quest2PreQuest = "true"
--
Inst17Quest2name1 = "Drachenklauenring"

--Quest 3 Alliance
Inst17Quest3 = "3. Das Licht bringen"
Inst17Quest3_Level = "42"
Inst17Quest3_Attain = "39"
Inst17Quest3_Aim = "Erzbischof Benedictus will, dass Ihr Amnennar den Kältebringer in den Hügeln der Klingenhauer tötet."
Inst17Quest3_Location = "Erzbischof Benedictus (Sturmwind - Kathedrale des Lichts; "..YELLOW.."39,27 "..WHITE..")"
Inst17Quest3_Note = "Amnennar der Kältebringer ist der Endgegner der Hügel der Klingenhauer und befindet sich bei "..YELLOW.."[6]"..WHITE.."."
Inst17Quest3_Prequest = "Nein"
Inst17Quest3_Folgequest = "Nein"
--
Inst17Quest3name1 = "Bezwingerschwert"
Inst17Quest3name2 = "Bernsteingluttalisman"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst17Quest1_HORDE = Inst17Quest1
Inst17Quest1_HORDE_Level = Inst17Quest1_Level
Inst17Quest1_HORDE_Attain = Inst17Quest1_Attain
Inst17Quest1_HORDE_Aim = Inst17Quest1_Aim
Inst17Quest1_HORDE_Location = Inst17Quest1_Location
Inst17Quest1_HORDE_Note = Inst17Quest1_Note
Inst17Quest1_HORDE_Prequest = Inst17Quest1_Prequest
Inst17Quest1_HORDE_Folgequest = Inst17Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde
Inst17Quest2_HORDE = "2. Eine unheilige Allianz"
Inst17Quest2_HORDE_Level = "36"
Inst17Quest2_HORDE_Attain = "28"
Inst17Quest2_HORDE_Aim = "Bringt den Kopf von Botschafter Malcin zu Varimathras nach Unterstadt."
Inst17Quest2_HORDE_Location = "Varimathras (Unterstadt - Königliches Viertel; "..YELLOW.."56,92 "..WHITE..")"
Inst17Quest2_HORDE_Note = "Das Vorquest erhält man vom Endgegner des Krals der Klingenhauer. Malcin findet man außerhalb der Instanz (Das Brachland; "..YELLOW.."48,92"..WHITE..")."
Inst17Quest2_HORDE_Prequest = "Ja, Eine unheilige Allianz"
Inst17Quest2_HORDE_Folgequest = "Nein"
Inst17Quest2PreQuest_HORDE = "true"
--
Inst17Quest2name1_HORDE = "Schädelbrecher"
Inst17Quest2name2_HORDE = "Nagelspeier"
Inst17Quest2name3_HORDE = "Zelotenrobe"

--Quest 3 Horde  (same as Quest 2 Alliance)
Inst17Quest3_HORDE = "3. Ausschalten des Götzen"
Inst17Quest3_HORDE_Level = Inst17Quest2_Level
Inst17Quest3_HORDE_Attain = Inst17Quest2_Attain
Inst17Quest3_HORDE_Aim = Inst17Quest2_Aim
Inst17Quest3_HORDE_Location = Inst17Quest2_Location
Inst17Quest3_HORDE_Note = Inst17Quest2_Note
Inst17Quest3_HORDE_Prequest = Inst17Quest2_Prequest
Inst17Quest3_HORDE_Folgequest = Inst17Quest2_Folgequest
Inst17Quest3PreQuest_HORDE = Inst17Quest2PreQuest
--
Inst17Quest3name1_HORDE = Inst17Quest2name1

--Quest 4 Horde
Inst17Quest4_HORDE = "4. Das Ende bringen"
Inst17Quest4_HORDE_Level = "42"
Inst17Quest4_HORDE_Attain = "37"
Inst17Quest4_HORDE_Aim = "Andrew Braunell will, dass Ihr Amnennar den Kältebringer tötet und ihm dessen Schädel bringt."
Inst17Quest4_HORDE_Location = "Andrew Braunell (Unterstadt - Das Magieviertle; "..YELLOW.."72,32 "..WHITE..")"
Inst17Quest4_HORDE_Note = "Amnennar der Kältebringer ist der Endgegner der Hügel der Klingenhauer und befindet sich bei "..YELLOW.."[6]"..WHITE.."."
Inst17Quest4_HORDE_Prequest = "Nein"
Inst17Quest4_HORDE_Folgequest = "Nein"
--
Inst17Quest4name1_HORDE = "Bezwingerschwert"
Inst17Quest4name2_HORDE = "Bernsteingluttalisman"



--------------- INST18 - Razorfen Kraul (RFK) ---------------

Inst18Story = "Vor zehntausend Jahren, zum Höhepunkt des Kriegs der Uralten, betrat der mächtige Halbgott Agamaggan das Schlachtfeld, um sich der Brennenden Legion entgegenzustellen. Seinen Beitrag zur Rettung Azeroths vor dem sicheren Untergang musste der stolze Eber jedoch mit seinem Leben bezahlen. Im Lauf der Zeit sprossen dort, wo die Tropfen seines Blutes auf die Erde gefallen waren, gewaltige Dornenranken. Die Stacheleber, die sterblichen Nachkommen des mächtigen Gottes, siedelten sich dort an und betrachten den Kral bis zum heutigen Tag als ihr höchstes Heiligtum, dessen Herz der Klingenhauer genannt wird. Heute wird der größte Teil des Krals der Klingenhauer von der alten Stammesfürstin Charlga Klingenflanke und ihrem Stamm kontrolliert. Unter ihrer Führung greifen die schamanistischen Stacheleber regelmäßig sowohl die feindlichen Stämme als auch nahegelegene Siedlungen der Orcs und Tauren an. In jüngster Zeit gab es Hinweise, die auf einen möglichen Pakt zwischen Charlga und den Agenten der untoten Geißel hindeuten. Kann es tatsächlich sein, dass die Uralte ihren nichtsahnenden Stamm zu irgendeinem finsteren Zweck direkt in die Arme der Untoten treibt?"
Inst18Caption = "Kral der Klingenhauer"
Inst18QAA = "5 Quests"
Inst18QAH = "5 Quests"

--Quest 1 Alliance
Inst18Quest1 = "1. Blaulaubknollen"
Inst18Quest1_Level = "26"
Inst18Quest1_Attain = "20"
Inst18Quest1_Aim = "Benutzt im Kral der Klingenhauer die Kiste mit Löchern, um ein Schnüffelnasenziesel zu beschwören, und benutzt den Leitstecken bei dem Ziesel, damit es nach Knollen sucht. Bringt 6 Blaulaubknollen, den Schnüffelnasenleitstecken und die Kiste mit Löchern zu Mebok Mizzyrix in Ratschet."
Inst18Quest1_Location = "Mebok Mizzyrix (Das Brachland - Ratschet; "..YELLOW.."62,37"..WHITE..")"
Inst18Quest1_Note = "Die Kiste, der Leitstecken und das Handbuch befinden sich in der Nähe des Questgebers."
Inst18Quest1_Prequest = "Nein"
Inst18Quest1_Folgequest = "Nein"
--
Inst18Quest1name1 = "Ein kleiner Behälter mit Edelsteinen"

--Quest 2 Alliance
Inst18Quest2 = "2. Die Sterblichkeit schwindet"
Inst18Quest2_Level = "30"
Inst18Quest2_Attain = "27"
Inst18Quest2_Aim = "Sucht und bringt Treshalas Anhänger zu Treshala Bachquell in Darnassus."
Inst18Quest2_Location = "Heralath Bachquell (Kral der Klingenhauer; "..YELLOW.."[8]"..WHITE..")"
Inst18Quest2_Note = "Die Kette ist ein zufälliger Dropp. Sobald du sie bekommen hast, musst du sie zu Treshala Bachquell in Darnassus - Terrasse der Händler ("..YELLOW.."69,67"..WHITE..") bringen."
Inst18Quest2_Prequest = "Nein"
Inst18Quest2_Folgequest = "Nein"
--
Inst18Quest2name1 = "Trauerschal"
Inst18Quest2name2 = "Lancierstiefel"

--Quest 3 Alliance
Inst18Quest3 = "3. Willix der Importeur"
Inst18Quest3_Level = "30"
Inst18Quest3_Attain = "22"
Inst18Quest3_Aim = "Führt Willix den Importeur aus dem Kral der Klingenhauer hinaus."
Inst18Quest3_Location = "Willix der Importeur (Kral der Klingenhauer; "..YELLOW.."[8]"..WHITE..")"
Inst18Quest3_Note = "Willix der Importeur muss zum Eingang der Instanz begleitet werden. Danach gibt man das Quest bei ihm ab."
Inst18Quest3_Prequest = "Nein"
Inst18Quest3_Folgequest = "Nein"
--
Inst18Quest3name1 = "Affenring"
Inst18Quest3name2 = "Natternreifen"
Inst18Quest3name3 = "Tigerband"

--Quest 4 Alliance
Inst18Quest4 = "4. Die Greisin des Krals"
Inst18Quest4_Level = "34"
Inst18Quest4_Attain = "29"
Inst18Quest4_Aim = "Bringt Falfindel Wegeshut in Thalanaar Klingenflankes Medaillon."
Inst18Quest4_Location = "Falfindel Wegeshut (Feralas - Thalanaar; "..YELLOW.."89,46"..WHITE..")"
Inst18Quest4_Note = "Das Medaillon wird von Charlga Klingenflanke bei "..YELLOW.."[7]"..WHITE.." gedroppt."
Inst18Quest4_Prequest = "Ja, Einbraues Tagebuch"
Inst18Quest4_Folgequest = "Nein"
Inst18Quest4PreQuest = "true"
--
Inst18Quest4name1 = "Falfindels Blaster"
Inst18Quest4name2 = "Beryllpolster"
Inst18Quest4name3 = "Steinfaustgurt"
Inst18Quest4name4 = "Marmorierter Rundschild"

--Quest 5 Alliance
Inst18Quest5 = "5. Feuergehärteter Panzer (Krieger)"
Inst18Quest5_Level = "28"
Inst18Quest5_Attain = "20"
Inst18Quest5_Aim = "Sammelt die Materialien, die Furen Langbart benötigt, und bringt sie zu ihm nach Sturmwind."
Inst18Quest5_Location = "Furen Langbart (Sturmwind - Zwergendistrikt; "..YELLOW.."57,16"..WHITE..")"
Inst18Quest5_Note = "Dieses Quest kann nur von Kriegern angenommen werden. Die Phiole mit Phlogiston bekommt man von Roogug bei "..YELLOW.."[1]"..WHITE..".\n\nDas Folgequest ist für jede Rasse unterschiedlich. Brennendes Blut für Menschen, Eisenkoralle für Zwerge und Gnome und Sonnenverbrannte Schalen für Nachtelfen."
Inst18Quest5_Prequest = "Ja, Der Schildschmied"
Inst18Quest5_Folgequest = "Ja, (siehe Information)"
Inst18Quest5PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst18Quest1_HORDE = Inst18Quest1
Inst18Quest1_HORDE_Level = Inst18Quest1_Level
Inst18Quest1_HORDE_Attain = Inst18Quest1_Attain
Inst18Quest1_HORDE_Aim = Inst18Quest1_Aim
Inst18Quest1_HORDE_Location = Inst18Quest1_Location
Inst18Quest1_HORDE_Note = Inst18Quest1_Note
Inst18Quest1_HORDE_Prequest = Inst18Quest1_Prequest
Inst18Quest1_HORDE_Folgequest = Inst18Quest1_Folgequest
--
Inst18Quest1name1_HORDE = Inst18Quest1name1

--Quest 2 Horde  (same as Quest 3 Alliance)
Inst18Quest2_HORDE = "2. Willix der Importeur"
Inst18Quest2_HORDE_Level = Inst18Quest3_Level
Inst18Quest2_HORDE_Attain = Inst18Quest3_Attain
Inst18Quest2_HORDE_Aim = Inst18Quest3_Aim
Inst18Quest2_HORDE_Location = Inst18Quest3_Location
Inst18Quest2_HORDE_Note = Inst18Quest3_Note
Inst18Quest2_HORDE_Prequest = Inst18Quest3_Prequest
Inst18Quest2_HORDE_Folgequest = Inst18Quest3_Folgequest
--
Inst18Quest2name1_HORDE = Inst18Quest3name1
Inst18Quest2name2_HORDE = Inst18Quest3name2
Inst18Quest2name3_HORDE = Inst18Quest3name3

-- Quest 3 Horde
Inst18Quest3_HORDE = "3. Go, Go, Guano!"
Inst18Quest3_HORDE_Level = "33"
Inst18Quest3_HORDE_Attain = "30"
Inst18Quest3_HORDE_Aim = "Bringt dem Apothekermeister Faranell in Unterstadt 1 Häufchen Kralguano."
Inst18Quest3_HORDE_Location = "Apothekermeister Faranell (Unterstadt - Das Apothekarium; "..YELLOW.."48,69 "..WHITE..")"
Inst18Quest3_HORDE_Note = "Das Kralguano droppen alle Fledermäuse im Kral."
Inst18Quest3_HORDE_Prequest = "Nein"
Inst18Quest3_HORDE_Folgequest = "Ja, Herzen des Eifers ("..YELLOW.."[Das Scharlachrote Kloster]"..WHITE..")"
-- No Rewards for this quest

--Quest 4 Horde
Inst18Quest4_HORDE = "4. Ein schreckliches Schicksal"
Inst18Quest4_HORDE_Level = "34"
Inst18Quest4_HORDE_Attain = "29"
Inst18Quest4_HORDE_Aim = "Bringt Auld Steinkeil in Donnerfels Klingenflankes Herz."
Inst18Quest4_HORDE_Location = "Auld Steinkeil (Donnerfels; "..YELLOW.."36,59"..WHITE..")"
Inst18Quest4_HORDE_Note = "Charlga Klingenflanke findet man bei "..YELLOW.."[7]"..WHITE.."."
Inst18Quest4_HORDE_Prequest = "Nein"
Inst18Quest4_HORDE_Folgequest = "Nein"
--
Inst18Quest4name1_HORDE = "Beryllpolster"
Inst18Quest4name2_HORDE = "Steinfaustgurt"
Inst18Quest4name3_HORDE = "Marmorierter Rundschild"

--Quest 5 Horde
Inst18Quest5_HORDE = "5. Brutale Rüstung (Krieger)"
Inst18Quest5_HORDE_Level = "30"
Inst18Quest5_HORDE_Attain = "20"
Inst18Quest5_HORDE_Aim = "Bringt Thun'grim Brandblick 15 rauchige Eisenblöcke, 10 pulverisierte Azurite, 10 Eisenbarren und 1 Phiole Phlogiston."
Inst18Quest5_HORDE_Location = "Thun'grim Brandblick (Das Brachland; "..YELLOW.."57,30"..WHITE..")"
Inst18Quest5_HORDE_Note = "Dieses Quest kann nur von Kriegern angenommen werden. Die Phiole mit Phlogiston bekommt man von Roogug bei "..YELLOW.."[1]"..WHITE..".\n\nWenn man dieses Quest abschließt, erhält man die Möglichkeit vier neue Folgequests von dem selben NPC anzunehmen."
Inst18Quest5_HORDE_Prequest = "Ja, Gespräch mit Thun'grim"
Inst18Quest5_HORDE_Folgequest = "Ja, (siehe Information)"
Inst18Quest5PreQuest_HORDE = "true"
-- No Rewards for this quest



--------------- INST19 - SM: Library (SM Lib) ---------------

Inst19Story = "Das Kloster war einst der ganze Stolz der Priesterschaft von Lordaeron, ein Ort der Studien und der Erleuchtung. Doch seit dem Auftauchen der untoten Geißel während des Dritten Krieges wurde das friedliche Kloster in eine Festung des fanatischen Scharlachroten Kreuzzuges verwandelt. Die Kreuzritter zeigen gegenüber allen nichtmenschlichen Völkern nicht den geringsten Funken von Toleranz oder Achtung, egal auf welcher Seite sie stehen mögen. Sie glauben, dass alle Außenseiter potentielle Überträger der Seuche des Untodes sind und deswegen vernichtet werden müssen. Berichten Überlebender zufolge müssen sich Eindringlinge darauf gefasst machen, dem Scharlachroten Kommandanten Mograine entgegenzutreten, der zudem über eine große Streitmacht ihm fanatisch ergebener Krieger gebietet. Der wahre Herr über das Scharlachrote Kloster ist jedoch Hochinquisitorin Weißsträhne - eine furchteinflößende Priesterin, die über die einzigartige Gabe verfügt, gefallene Kämpfer in ihrem Namen ins Kampfgeschehen zurückholen zu können."
Inst19Caption = "SK: Bibliothek"
Inst19QAA = "3 Quests"
Inst19QAH = "5 Quests"

--Quest 1 Alliance
Inst19Quest1 = "1. Mythologie der Titanen"
Inst19Quest1_Level = "38"
Inst19Quest1_Attain = "28"
Inst19Quest1_Aim = "Holt die 'Mythologie der Titanen' aus dem Kloster und bringt die der Bibliothekarin Mae Bleichstaub in Eisenschmiede."
Inst19Quest1_Location = "Bilbliothekarin Mae Bleichstaub (Eisenschmiede - Halle der Forscher; "..YELLOW.."74,12 "..WHITE..")"
Inst19Quest1_Note = "Das Buch findet man auf der linken Seite eines der Korridore, die zu Arkanist Doan ("..YELLOW.."[2]"..WHITE..") führen, auf dem Boden."
Inst19Quest1_Prequest = "Nein"
Inst19Quest1_Folgequest = "Nein"
--
Inst19Quest1name1 = "Forscherligaempfehlung"

--Quest 2 Alliance
Inst19Quest2 = "2. Rituale der Macht (Magier)"
Inst19Quest2_Level = "40"
Inst19Quest2_Attain = "30"
Inst19Quest2_Aim = "Bringt das Buch 'Rituale der Macht' zu Tabetha in den Düstermarschen."
Inst19Quest2_Location = "Tabetha (Düstermarschen; "..YELLOW.."43,57"..WHITE..")"
Inst19Quest2_Note = "Dieses Quest kann nur von Magiern angenommen werden. Das Buch findet man im letzten Korridor, der zu Arkanist Doan ("..YELLOW.."[2]"..WHITE..") führt."
Inst19Quest2_Prequest = "Ja, Der Knüller schlechthin"
Inst19Quest2_Folgequest = "Ja, Der Zauberstab des Magiers"
Inst19Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst19Quest3 = "3. Im Namen des Lichts"
Inst19Quest3_Level = "40"
Inst19Quest3_Attain = "34"
Inst19Quest3_Aim = "Tötet Hochinquisitorin Weißsträhne, den scharlachroten Kommandant Mograine, Herod, den scharlachroten Helden sowie den Hundemeister Loksey und meldet Euch dann wieder bei Raleigh dem Andächtigen in Süderstade."
Inst19Quest3_Location = "Raleigh der Andächtige (Vorgebirge des Hügellands - Süderstade; "..YELLOW.."51,58"..WHITE..")"
Inst19Quest3_Note = "Diese Questreihe beginnt bei Bruder Crowley in Sturmwind - Kathedrale des Lichts ("..YELLOW.."42,24"..WHITE..").\nHochinquisitorin Weißsträhne und Kommandant Mograine findet man bei "..YELLOW.."SK: Kathedrale [2]"..WHITE..", Herod bei "..YELLOW.."SK: Waffenkammer [1]"..WHITE.." und Hundemeister Loksey bei "..YELLOW.."SK: Bibliothek [1]"..WHITE.."."
Inst19Quest3_Prequest = "Ja, Bruder Anton -> Auf dem scharlachroten Pfad"
Inst19Quest3_Folgequest = "Nein"
Inst19Quest3PreQuest = "true"
--
Inst19Quest3name1 = "Schwert der Beschaulichkeit"
Inst19Quest3name2 = "Knochenbeißer"
Inst19Quest3name3 = "Schwarze Bedrohung"
Inst19Quest3name4 = "Kugel von Lorica"


--Quest 1 Horde
Inst19Quest1_HORDE = "1. Herzen des Eifers"
Inst19Quest1_HORDE_Level = "33"
Inst19Quest1_HORDE_Attain = "30"
Inst19Quest1_HORDE_Aim = "Apothekermeister Faranell in Unterstadt möchte 20 Herzen des Eifers."
Inst19Quest1_HORDE_Location = "Apothekermeister Faranell (Unterstadt - Das Apothekarium; "..YELLOW.."48,69"..WHITE..")"
Inst19Quest1_HORDE_Note = "Die Herzen des Eifers werden von allen Gegnern im Kloster gedroppt."
Inst19Quest1_HORDE_Prequest = "Ja, Go, Go, Guano! ("..YELLOW.."[Kral der Klingenhauer]"..WHITE..")"
Inst19Quest1_HORDE_Folgequest = "Nein"
Inst19Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst19Quest2_HORDE = "2. Test der Lehre"
Inst19Quest2_HORDE_Level = "36"
Inst19Quest2_HORDE_Attain = "26"
Inst19Quest2_HORDE_Aim = "Sucht Die Anfänge der Bedrohung durch die Untoten und bringt es zu Parqual Fintallas in Unterstadt."
Inst19Quest2_HORDE_Location = "Parqual Fintallas (Unterstadt - Das Apothekarium; "..YELLOW.."57,65"..WHITE..")"
Inst19Quest2_HORDE_Note = "Die Questreihe beginnt bei Dorn Ebenenpirscher (Tausend Nadeln; "..YELLOW.."53,41"..WHITE.."). Das Buch findet man im Bibliotheksteil des Klosters."
Inst19Quest2_HORDE_Prequest = "Ja, Test der Glaubens -> Test der Lehre"
Inst19Quest2_HORDE_Folgequest = "Ja, Test der Lehre"
Inst19Quest2PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 3 Horde
Inst19Quest3_HORDE = "3. Kompendium der Gefallenen"
Inst19Quest3_HORDE_Level = "38"
Inst19Quest3_HORDE_Attain = "28"
Inst19Quest3_HORDE_Aim = "Holt das 'Kompendium der Gefallenen' aus dem Kloster in Tirisfal und bringt es zu dem Weisen Wahrspruch in Donnerfels."
Inst19Quest3_HORDE_Location = "Weiser Wahrspruch (Donnerfels; "..YELLOW.."34,47"..WHITE..")"
Inst19Quest3_HORDE_Note = "Das Buch findet man im Bibliotheksteil des Klosters."
Inst19Quest3_HORDE_Prequest = "Nein"
Inst19Quest3_HORDE_Folgequest = "Nein"
--
Inst19Quest3name1_HORDE = "Grässlicher Beschützer"
Inst19Quest3name2_HORDE = "Zwingsteinrundschild"
Inst19Quest3name3_HORDE = "Omegakugel"

--Quest 4 Horde  (same as Quest 2 Alliance)
Inst19Quest4_HORDE = "4. Rituale der Macht (Magier)"
Inst19Quest4_HORDE_Level = Inst19Quest2_Level
Inst19Quest4_HORDE_Attain = Inst19Quest2_Attain
Inst19Quest4_HORDE_Aim = Inst19Quest2_Aim
Inst19Quest4_HORDE_Location = Inst19Quest2_Location
Inst19Quest4_HORDE_Note = Inst19Quest2_Note
Inst19Quest4_HORDE_Prequest = Inst19Quest2_Prequest
Inst19Quest4_HORDE_Folgequest = Inst19Quest2_Folgequest
Inst19Quest4PreQuest_HORDE = Inst19Quest2_PreQuest
-- No Rewards for this quest

--Quest 5 Horde
Inst19Quest5_HORDE = "5. In das Scharlachrote Kloster"
Inst19Quest5_HORDE_Level = "42"
Inst19Quest5_HORDE_Attain = "33"
Inst19Quest5_HORDE_Aim = "Tötet Hochinquisitorin Weißsträhne, den scharlachroten Kommandant Mograine, Herod, den scharlachroten Helden sowie den Hundemeister Loksey und meldet Euch dann wieder bei Varimathras in Unterstadt."
Inst19Quest5_HORDE_Location = "Varimathras (Unterstadt - Königliches Viertel; "..YELLOW.."56,92"..WHITE..")"
Inst19Quest5_HORDE_Note = "Hochinquisitorin Weißsträhne und Kommandant Mograine findet man bei "..YELLOW.."SK: Kathedrale [2]"..WHITE..", Herod bei "..YELLOW.."SK: Waffenkammer [1]"..WHITE.." und Hundemeister Loksey bei "..YELLOW.."SK: Bibliothek [1]"..WHITE.."."
Inst19Quest5_HORDE_Prequest = "Nein"
Inst19Quest5_HORDE_Folgequest = "Nein"
--
Inst19Quest5name1_HORDE = "Schwert des Omens"
Inst19Quest5name2_HORDE = "Stock des Propheten"
Inst19Quest5name3_HORDE = "Drachenbluthalskette"



--------------- INST20 - Scholomance (Scholo) ---------------

Inst20Story = "Scholomance ist ein weitläufiges Netzwerk unterirdischer Krypten, das sich unter der verfallenen Burg Darrowehr erstreckt. Darrowehr war früher im Besitz der Barovs, einer alten Adelsfamilie, doch während des Zweiten Krieges verfiel die Burg und wurde zu einer Ruine. Eine gängige Methode, mit der Kel'thuzad neue Anhänger für seinen Kult der Verdammten warb, war es, potentiellen Neuzugängen im Austausch gegen ihre Dienste für den Lichkönig die Unsterblichkeit zu versprechen. Die Barovs fielen auf Kel'thuzads charismatischen Schwindel herein und überließen die Burg und die dazugehörigen Krypten der Geißel. Im Gegenzug töteten die Kultisten die Barovs und machten aus den uralten Gewölben eine Schule der Nekromantie, die sie Scholomance tauften. Auch wenn Kel'thuzad schon lange nicht mehr in den Krypten weilt, verbleiben dennoch viele Kultisten und Lehrmeister in Scholomance. Der mächtige Lich Ras Frostraunen verteidigt Scholomance im Namen der Geißel gegen alle, die unbefugterweise einen Fuß über ihre Schwelle setzen, während Dunkelmeister Gandling als der hinterhältige Direktor der Schule für Ordnung unter den Lernenden sorgt."
Inst20Caption = "Scholomance"
Inst20QAA = "10 Quests"
Inst20QAH = "10 Quests"

--Quest 1 Alliance
Inst20Quest1 = "1. Verseuchte Jungtiere"
Inst20Quest1_Level = "58"
Inst20Quest1_Attain = "55"
Inst20Quest1_Aim = "Tötet 20 verseuchte Jungtiere und kehrt dann zu Betina Moppelzink bei der Kapelle des hoffnungsvollen Lichts zurück."
Inst20Quest1_Location = "Betina Moppelzink (Östliche Pestländer - Kapelle des hoffnungsvollen Lichts; "..YELLOW.."81,59"..WHITE..")"
Inst20Quest1_Note = "Die verseuchten Jungtiere befinden sich auf dem Weg zu Blutrippe in einem großen Raum."
Inst20Quest1_Prequest = "Nein"
Inst20Quest1_Folgequest = "Ja, Gesunde Großdrachenschuppe"
-- No Rewards for this quest

--Quest 2 Alliance
Inst20Quest2 = "2. Gesunde Großdrachenschuppe"
Inst20Quest2_Level = "58"
Inst20Quest2_Attain = "56"
Inst20Quest2_Aim = "Bringt die gesunde Großdrachenschuppe zu Betina Moppelzink bei der Kapelle des hoffnungsvollen Lichts in den östlichen Pestländern."
Inst20Quest2_Location = "Gesunde Großdrachenschuppe (Zufälliger Dropp in Scholomance)"
Inst20Quest2_Note = "Die Gesunde Großdrachenschuppe droppt von den Verseuchten Jungtiere (8% Droppchance). Betina Moppelzink befindet sich in den Östlichen Pestländer - Kapelle des hoffnungsvollen Lichts ("..YELLOW.."81,59"..WHITE..")."
Inst20Quest2_Prequest = "Ja, Verseuchte Jungtiere"
Inst20Quest2_Folgequest = "Nein"
Inst20Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst20Quest3 = "3. Doktor Theolen Krastinov, der Schlächter"
Inst20Quest3_Level = "60"
Inst20Quest3_Attain = "55"
Inst20Quest3_Aim = "Sucht Doktor Theolen Krastinov in der Scholomance. Vernichtet ihn, verbrennt dann die Überreste von Eva Sarkhoff und die Überreste von Lucien Sarkhoff. Kehrt zu Eva Sarkhoff zurück, sobald Ihr die Aufgabe erfüllt habt."
Inst20Quest3_Location = "Eva Sarkhoff (Westliche Pestländer - Darrowehr; "..YELLOW.."70,73"..WHITE..")"
Inst20Quest3_Note = "Doktor Theolen Krastinov, die Überreste von Eva Sarkhoff und die Überreste von Lucien Sarkhoff befinden sich bei "..YELLOW.."[9]"..WHITE.."."
Inst20Quest3_Prequest = "Nein"
Inst20Quest3_Folgequest = "Ja, Krastinovs Tasche der Schrecken"
-- No Rewards for this quest

--Quest 4 Alliance
Inst20Quest4 = "4. Krastinovs Tasche der Schrecken"
Inst20Quest4_Level = "60"
Inst20Quest4_Attain = "55"
Inst20Quest4_Aim = "Sucht nach Jandice Barov in der Scholomance und vernichtet sie. Entnehmt ihrer Leiche Krastinovs Tasche der Schrecken. Bringt die Tasche zu Eva Sarkhoff."
Inst20Quest4_Location = "Eva Sarkhoff (Westliche Pestländer - Darrowehr; "..YELLOW.."70,73"..WHITE..")"
Inst20Quest4_Note = "Man findet Jandice Barov bei "..YELLOW.."[3]"..WHITE.."."
Inst20Quest4_Prequest = "Ja, Doktor Theolen Krastinov, der Schlächter"
Inst20Quest4_Folgequest = "Ja, Kirtonos der Herold"
Inst20Quest4FQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst20Quest5 = "5. Kirtonos der Herold"
Inst20Quest5_Level = "60"
Inst20Quest5_Attain = "55"
Inst20Quest5_Aim = "Kehrt mit dem Blut Unschuldiger zur Scholomance zurück. Sucht die Veranda und legt das Blut der Unschuldigen in die Kohlenpfanne. Kirtonos wird kommen, um sich von Eurer Seele zu nähren. Kämpft tapfer, gebt keinen Fußbreit nach! Vernichtet Kirtonos und kehrt zu Eva Sarkhoff zurück."
Inst20Quest5_Location = "Eva Sarkhoff (Westliche Pestländer - Darrowehr; "..YELLOW.."70,73"..WHITE..")"
Inst20Quest5_Note = "Die Veranda findet man bei "..YELLOW.."[2]"..WHITE.."."
Inst20Quest5_Prequest = "Ja, Krastinovs Tasche der Schrecken"
Inst20Quest5_Folgequest = "Ja, Der Mensch Ras Frostraunen"
Inst20Quest5FQuest = "true"
--
Inst20Quest5name1 = "Spektrale Essenz"
Inst20Quest5name2 = "Penelopes Rose"
Inst20Quest5name3 = "Mirahs Lied"

--Quest 6 Alliance
Inst20Quest6 = "6. Der Lich Ras Frostraunen"
Inst20Quest6_Level = "60"
Inst20Quest6_Attain = "59"
Inst20Quest6_Aim = "Sucht Ras Frostraunen in der Scholomance. Wenn Ihr ihn gefunden habt, wendet das seelengebundene Andenken auf sein untotes Antlitz an. Solltet Ihr ihn erfolgreich in einen Sterblichen zurückverwandeln können, dann schlagt ihn nieder und nehmt den menschlichen Kopf von Ras Frostraunen an Euch. Bringt den Kopf zu Magistrat Marduk."
Inst20Quest6_Location = "Magistrat Marduk (Westliche Pestländer - Darrowehr; "..YELLOW.."70,73"..WHITE..")"
Inst20Quest6_Note = "Ras Frostraunen findet man bei "..YELLOW.."[7]"..WHITE.."."
Inst20Quest6_Prequest = "Ja, Der Mensch Ras Frostraunen -> Seelengebundenes Andenken"
Inst20Quest6_Folgequest = "Nein"
Inst20Quest6PreQuest = "true"
--
Inst20Quest6name1 = "Starkwache von Darroheim"
Inst20Quest6name2 = "Kriegsklinge von Darrowehr"
Inst20Quest6name3 = "Krone von Darrowehr"
Inst20Quest6name4 = "Froststachel"

--Quest 7 Alliance
Inst20Quest7 = "7. Das Familienvermögen der Barovs"
Inst20Quest7_Level = "60"
Inst20Quest7_Attain = "52"
Inst20Quest7_Aim = "Begebt Euch zur Scholomance und holt das Familienvermögen der Barovs zurück. Dieses Vermögen besteht aus vier Besitzurkunden: Es sind die Besitzurkunde für Darrowehr, die Besitzurkunde für Brill, die Besitzurkunde für Tarrens Mühle und die Besitzurkunde für Süderstade. Kehrt zu Weldon Barov zurück, sobald die Aufgabe erledigt ist."
Inst20Quest7_Location = "Weldon Barov (Westliche Pestländer - Zugwindlager; "..YELLOW.."43,83"..WHITE..")"
Inst20Quest7_Note = "Die Besitzurkunde für Darrowehr findet man bei "..YELLOW.."[12]"..WHITE..", die Besitzurkunde für Brill bei "..YELLOW.."[7]"..WHITE..", die Besitzurkunde für Tarrens Mühle bei "..YELLOW.."[4]"..WHITE.." und die Besitzurkunde für Süderstade bei "..YELLOW.."[1]"..WHITE.."."
Inst20Quest7_Prequest = "Nein"
Inst20Quest7_Folgequest = "Ja, Der letzte Barov"
-- No Rewards for this quest

--Quest 8 Alliance
Inst20Quest8 = "8. Dämmerungstrickfalle"
Inst20Quest8_Level = "60"
Inst20Quest8_Attain = "58"
Inst20Quest8_Aim = "Legt die Dämmerungstrickfalle in den Vorführraum von Scholomance. Besiegt Vectus und kehrt dann zu Betina Moppelzink zurück."
Inst20Quest8_Location = "Betina Moppelzink (Östliche Pestländer - Kapelle des hoffnungsvollen Lichts; "..YELLOW.."81,59"..WHITE..")"
Inst20Quest8_Note = "Die Questreihe beginnt mit Brutlingessenz bei Tinkee Kesseldampf (Brennende Steppe - Flammenkamm; "..YELLOW.."65,23"..WHITE.."). Der Vorführraum ist bei "..YELLOW.."[6]"..WHITE.."."
Inst20Quest8_Prequest = "Ja, Brutlingessenz -> Betina Moppelzink"
Inst20Quest8_Folgequest = "Nein"
Inst20Quest8PreQuest = "true"
--
Inst20Quest8name1 = "Windschnitter"
Inst20Quest8name2 = "Tanzender Span"

--Quest 9 Alliance
Inst20Quest9 = "9. Wichtellieferung (Hexenmeister)"
Inst20Quest9_Level = "60"
Inst20Quest9_Attain = "60"
Inst20Quest9_Aim = "Bringt den Wichtel im Gefäß in das Alchimielabor in der Scholomance. Bringt nach der Herstellung des Pergaments, dass Gefäß zurück zu Gorzeeki Wildaug."
Inst20Quest9_Location = "Gorzeeki Wildaug (Brennende Steppe; "..YELLOW.."12,31"..WHITE..")"
Inst20Quest9_Note = "Dieses Quest kann nur von Hexenmeistern angenommen werden! Das Alchimielabor befindet sich bei "..YELLOW.."[7]"..WHITE.."."
Inst20Quest9_Prequest = "Ja, Mor'zul Blutbringer -> Xorothianischer Sternenstaub"
Inst20Quest9_Folgequest = "Ja, Schreckensross von Xoroth ("..YELLOW.."Düsterbruch West"..WHITE..")"
Inst20Quest9PreQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst20Quest10 = "10. Das linke Stück von Lord Valthalaks Amulett"
Inst20Quest10_Level = "60"
Inst20Quest10_Attain = "60"
Inst20Quest10_Aim = "Benutzt das Räuchergefäß der Beschwörung, um den Geist von Kormok zu beschwören und zu vernichten. Kehrt dann mit dem linken Stück von Lord Valthalaks Amulett und dem Räuchergefäß der Beschwörung zu Bodley im Schwarzfels zurück."
Inst20Quest10_Location = "Bodley (Schwarzfels; "..YELLOW.."[D] auf der Eingangskarte"..WHITE..")"
Inst20Quest10_Note = "Der Extradimensionale Geisterdetektor wird benötigt um Bodley zu sehen. Man erhält ihn beim Quest 'Suche nach Anthion'.\n\nKormok wird bei "..YELLOW.."[7]"..WHITE.." beschworen."
Inst20Quest10_Prequest = "Ja, Komponenten von großer Wichtigkeit"
Inst20Quest10_Folgequest = "Ja, Ich sehe die Insel Alcaz in Eurer Zukunft"
Inst20Quest10PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst20Quest1_HORDE = Inst20Quest1
Inst20Quest1_HORDE_Level = Inst20Quest1_Level
Inst20Quest1_HORDE_Attain = Inst20Quest1_Attain
Inst20Quest1_HORDE_Aim = Inst20Quest1_Aim
Inst20Quest1_HORDE_Location = Inst20Quest1_Location
Inst20Quest1_HORDE_Note = Inst20Quest1_Note
Inst20Quest1_HORDE_Prequest = Inst20Quest1_Prequest
Inst20Quest1_HORDE_Folgequest = Inst20Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst20Quest2_HORDE = Inst20Quest2
Inst20Quest2_HORDE_Level = Inst20Quest2_Level
Inst20Quest2_HORDE_Attain = Inst20Quest2_Attain
Inst20Quest2_HORDE_Aim = Inst20Quest2_Aim
Inst20Quest2_HORDE_Location = Inst20Quest2_Location
Inst20Quest2_HORDE_Note = Inst20Quest2_Note
Inst20Quest2_HORDE_Prequest = Inst20Quest2_Prequest
Inst20Quest2_HORDE_Folgequest = Inst20Quest2_Folgequest
Inst20Quest2FQuest_HORDE = Inst20Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst20Quest3_HORDE = Inst20Quest3
Inst20Quest3_HORDE_Level = Inst20Quest3_Level
Inst20Quest3_HORDE_Attain = Inst20Quest3_Attain
Inst20Quest3_HORDE_Aim = Inst20Quest3_Aim
Inst20Quest3_HORDE_Location = Inst20Quest3_Location
Inst20Quest3_HORDE_Note = Inst20Quest3_Note
Inst20Quest3_HORDE_Prequest = Inst20Quest3_Prequest
Inst20Quest3_HORDE_Folgequest = Inst20Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst20Quest4_HORDE = Inst20Quest4
Inst20Quest4_HORDE_Level = Inst20Quest4_Level
Inst20Quest4_HORDE_Attain = Inst20Quest4_Attain
Inst20Quest4_HORDE_Aim = Inst20Quest4_Aim
Inst20Quest4_HORDE_Location = Inst20Quest4_Location
Inst20Quest4_HORDE_Note = Inst20Quest4_Note
Inst20Quest4_HORDE_Prequest = Inst20Quest4_Prequest
Inst20Quest4_HORDE_Folgequest = Inst20Quest4_Folgequest
Inst20Quest4FQuest_HORDE = Inst20Quest4FQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst20Quest5_HORDE = Inst20Quest5
Inst20Quest5_HORDE_Level = Inst20Quest5_Level
Inst20Quest5_HORDE_Attain = Inst20Quest5_Attain
Inst20Quest5_HORDE_Aim = Inst20Quest5_Aim
Inst20Quest5_HORDE_Location = Inst20Quest5_Location
Inst20Quest5_HORDE_Note = Inst20Quest5_Note
Inst20Quest5_HORDE_Prequest = Inst20Quest5_Prequest
Inst20Quest5_HORDE_Folgequest = Inst20Quest5_Folgequest
Inst20Quest5FQuest_HORDE = Inst20Quest5FQuest
--
Inst20Quest5name1_HORDE = Inst20Quest5name1
Inst20Quest5name2_HORDE = Inst20Quest5name2
Inst20Quest5name3_HORDE = Inst20Quest5name3

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst20Quest6_HORDE = Inst20Quest6
Inst20Quest6_HORDE_Level = Inst20Quest6_Level
Inst20Quest6_HORDE_Attain = Inst20Quest6_Attain
Inst20Quest6_HORDE_Aim = Inst20Quest6_Aim
Inst20Quest6_HORDE_Location = Inst20Quest6_Location
Inst20Quest6_HORDE_Note = Inst20Quest6_Note
Inst20Quest6_HORDE_Prequest = Inst20Quest6_Prequest
Inst20Quest6_HORDE_Folgequest = Inst20Quest6_Folgequest
Inst20Quest6PreQuest_HORDE = Inst20Quest6PreQuest
--
Inst20Quest6name1_HORDE = Inst20Quest6name1
Inst20Quest6name2_HORDE = Inst20Quest6name2
Inst20Quest6name3_HORDE = Inst20Quest6name3
Inst20Quest6name4_HORDE = Inst20Quest6name4

--Quest 7 Horde
Inst20Quest7_HORDE = "7. Das Familienvermögen der Barovs"
Inst20Quest7_HORDE_Level = "60"
Inst20Quest7_HORDE_Attain = "52"
Inst20Quest7_HORDE_Aim = "Begebt Euch zur Scholomance und holt das Familienvermögen der Barovs zurück. Dieses Vermögen besteht aus vier Besitzurkunden: Es sind die Besitzurkunde für Caer Darrow, die Besitzurkunde für Brill, die Besitzurkunde für Tarrens Mühle und die Besitzurkunde für Southshore. Kehrt zu Alexi Barov zurück, sobald die Aufgabe erledigt ist."
Inst20Quest7_HORDE_Location = "Alexi Barov (Tirisfal - Bollwerk; "..YELLOW.."80,73"..WHITE..")"
Inst20Quest7_HORDE_Note = "Die Besitzurkunde für Darrowehr findet man bei "..YELLOW.."[12]"..WHITE..", die Besitzurkunde für Brill bei "..YELLOW.."[7]"..WHITE..", die Besitzurkunde für Tarrens Mühle bei "..YELLOW.."[4]"..WHITE.." und die Besitzurkunde für Süderstade bei "..YELLOW.."[1]"..WHITE.."."
Inst20Quest7_HORDE_Prequest = "Nein"
Inst20Quest7_HORDE_Folgequest = "Ja, Der letzte Barov"
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst20Quest8_HORDE = Inst20Quest8
Inst20Quest8_HORDE_Level = Inst20Quest8_Level
Inst20Quest8_HORDE_Attain = Inst20Quest8_Attain
Inst20Quest8_HORDE_Aim = Inst20Quest8_Aim
Inst20Quest8_HORDE_Location = Inst20Quest8_Location
Inst20Quest8_HORDE_Note = Inst20Quest8_Note
Inst20Quest8_HORDE_Prequest = Inst20Quest8_Prequest
Inst20Quest8_HORDE_Folgequest = Inst20Quest8_Folgequest
Inst20Quest8PreQuest_HORDE = Inst20Quest8PreQuest
--
Inst20Quest8name1_HORDE = Inst20Quest8name1
Inst20Quest8name2_HORDE = Inst20Quest8name2

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst20Quest9_HORDE = Inst20Quest9
Inst20Quest9_HORDE_Level = Inst20Quest9_Level
Inst20Quest9_HORDE_Attain = Inst20Quest9_Attain
Inst20Quest9_HORDE_Aim = Inst20Quest9_Aim
Inst20Quest9_HORDE_Location = Inst20Quest9_Location
Inst20Quest9_HORDE_Note = Inst20Quest9_Note
Inst20Quest9_HORDE_Prequest = Inst20Quest9_Prequest
Inst20Quest9_HORDE_Folgequest = Inst20Quest9_Folgequest
Inst20Quest9PreQuest_HORDE = Inst20Quest9PreQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst20Quest10_HORDE = Inst20Quest10
Inst20Quest10_HORDE_Level = Inst20Quest10_Level
Inst20Quest10_HORDE_Attain = Inst20Quest10_Attain
Inst20Quest10_HORDE_Aim = Inst20Quest10_Aim
Inst20Quest10_HORDE_Location = Inst20Quest10_Location
Inst20Quest10_HORDE_Note = Inst20Quest10_Note
Inst20Quest10_HORDE_Prequest = Inst20Quest10_Prequest
Inst20Quest10_HORDE_Folgequest = Inst20Quest10_Folgequest
Inst20Quest10PreQuest_HORDE = Inst20Quest10PreQuest
-- No Rewards for this quest



--------------- INST21 - Shadowfang Keep (SFK) ---------------

Inst21Story = "Während des Dritten Krieges kämpften die Hexer der Kirin Tor gegen die untoten Armeen der Geißel. Mit jedem Hexer, der im Kampf fiel, stand kurze Zeit später bereits ein weiterer Untoter auf Seiten der Geißel seinen einstmaligen Mitstreitern als Feind gegenüber. Frustriert über den aussichtslosen Kampf beschloss der Erzmagier Arugal gegen den Willen seiner Kollegen, Wesen aus einer fremden Dimension zu Hilfe zu rufen um die schwindenden Reihen der Hexer zu stärken. Arugals Beschwörung brachte die gefräßigen Worgs nach Azeroth. Zwar machten die unaufhaltsamen Werwölfe kurzen Prozess mit allem, was die Geißel ihnen entgegenstellte, doch nach kurzer Zeit wandten sie sich auch gegen die Magier, denen sie eigentlich dienen sollten. So kam es, dass die Worgs die Burg des adligen Barons Silberlein jenseits des unscheinbaren Dörfchens Lohenscheit angriffen. Von Schuldgefühlen halb wahnsinnig adoptierte Arugal die Worgs als seine Kinder und zog sich in die inzwischen verfallene Burgruine zurück. Dort soll er immer noch hausen, unter dem immer wachsamen Auge seines gewaltigen Schoßhundes Fenrus, heimgesucht von dem rastlosen Geist von Baron Silberlein."
Inst21Caption = "Burg Schattenfang"
Inst21QAA = "2 Quests"
Inst21QAH = "4 Quests"

--Quest 1 Alliance
Inst21Quest1 = "1. Die Prüfung der Rechtschaffenheit"
Inst21Quest1_Level = "22"
Inst21Quest1_Attain = "20"
Inst21Quest1_Aim = "Sucht mit Jordans Waffennotizen etwas Weißsteineichenholz, Bailors aufbereitete Erzlieferung, Jordans Schmiedehammer und einen Koredelstein und bringt alles zusammen zu Jordan Stillbrunn in Eisenschmiede."
Inst21Quest1_Location = "Jordan Stillbrunn (Dun Morogh - Eisenschmiede Eingang; "..YELLOW.."52,36"..WHITE..")"
Inst21Quest1_Note = "Paladin: Um die Notizen zu dieser Quest zu betrachten, klicke auf "..YELLOW.."[Informationen zur Prüfung der Rechtschaffenheit]"..WHITE.."."
Inst21Quest1_Page = {2, "Nur Paladine können dieses Quest erhalten!\n\n1. Das Weißsteineichenholz bekommt man von Goblinholzschnitzer in den "..YELLOW.."[Todesminen]"..WHITE..".\n\n2. Um Bailors aufbereitete Erzlieferung zu bekommen, muss man mit Bailor Steinhand (Loch Modan - Thelsamar; "..YELLOW.."35,44"..WHITE..") reden. Er gibt einem das Quest 'Bailors Erzlieferung'. Für dieses Quest muss man Jordans Erzlieferung finden. Sie ist hinter einem Baum bei "..YELLOW.."71,21"..WHITE.."\n\n3. Jordans Schmiedehammer bekommt man in "..YELLOW.."[Burg Schattenfang]"..WHITE.." bei "..YELLOW.."[3]"..WHITE..".\n\n4. Den Koredelstein bekommt man von Thundris Windwirker (Dunkelküste - Auberdine; "..YELLOW.."37,40"..WHITE.."), wenn man das Quest 'Suche nach dem Koredelstein' macht. Für dieses Quest muss man vor der "..YELLOW.."[Tiefschwarzen Grotte]"..WHITE.." Orakel oder Gezeitenpriesterinnen der Tiefschwarzen Grotte töten. Diese droppen den Verderbten Koredelstein, welchen Thundris Windwirker reinigt.", };
Inst21Quest1_Prequest = "Ja, Der Foliant der Ehre -> Die Prüfung der Rechtschaffenheit"
Inst21Quest1_Folgequest = "Ja, Die Prüfung der Rechtschaffenheit"
Inst21Quest1PreQuest = "true"
--
Inst21Quest1name1 = "Verigans Faust"

--Quest 2 Alliance
Inst21Quest3 = "2. Die Kugel von Soran'ruk"
Inst21Quest3_Level = "25"
Inst21Quest3_Attain = "20"
Inst21Quest3_Aim = "Sucht 3 Fragmente von Soran'ruk und 1 großes Fragment von Soran'ruk und bringt sie zu Doan Karhan im Brachland."
Inst21Quest3_Location = "Doan Karhan (Brachland; "..YELLOW.."49,57"..WHITE..")"
Inst21Quest3_Note = "Hexenmeister: Die drei Fragmente von Soran'ruk werden von den Akolyten des Schattenhammers in der "..YELLOW.."[Tiefschwarze Grotte]"..WHITE.." gedroppt. Das große Fragment von Soran'ruk bekommt man in "..YELLOW.."[Burg Schattenfang]"..WHITE.." von Dunkelseele der Schattenfänge."
Inst21Quest3_Prequest = "Nein"
Inst21Quest3_Folgequest = "Nein"
--
Inst21Quest3name1 = "Kugel von Soran'ruk"
Inst21Quest3name2 = "Stab von Soran'ruk"


--Quest 1 Horde
Inst21Quest1_HORDE = "1. Todespirscher in Burg Schattenfang"
Inst21Quest1_HORDE_Level = "25"
Inst21Quest1_HORDE_Attain = "18"
Inst21Quest1_HORDE_Aim = "Sucht die Todespirscher Adamant und Vincent."
Inst21Quest1_HORDE_Location = "Hochexekutor Hadrec (Silberwald - Das Grabmal; "..YELLOW.."43,40"..WHITE..")"
Inst21Quest1_HORDE_Note = "Man findet Todespirscher Adamant bei "..YELLOW.."[1]"..WHITE..". Todespirscher Vincet befindet sich auf der rechten Seite, wenn man den Innenhof betritt, bei "..YELLOW.."[2]"..WHITE.."."
Inst21Quest1_HORDE_Prequest = "Nein"
Inst21Quest1_HORDE_Folgequest = "Nein"
--
Inst21Quest1name1_HORDE = "Geisterhafter Mantel"

--Quest 2 Horde
Inst21Quest2_HORDE = "2. Das Buch von Ur"
Inst21Quest2_HORDE_Level = "26"
Inst21Quest2_HORDE_Attain = "16"
Inst21Quest2_HORDE_Aim = "Bringt dem Bewahrer Bel'dugur im Apothekarium in Unterstadt das Buch von Ur."
Inst21Quest2_HORDE_Location = "Bewahrer Bel'dugur (Unterstadt - Das Apothekarium; "..YELLOW.."53,54"..WHITE..")"
Inst21Quest2_HORDE_Note = "Man findet das Buch bei "..YELLOW.."[8]"..WHITE.." auf der linken Seite, wenn man den Raum betritt."
Inst21Quest2_HORDE_Prequest = "Nein"
Inst21Quest2_HORDE_Folgequest = "Nein"
--
Inst21Quest2name1_HORDE = "Ergraute Stiefel"
Inst21Quest2name2_HORDE = "Stahlschnallenarmschienen"

--Quest 3 Horde
Inst21Quest3_HORDE = "3. Arugal muss sterben"
Inst21Quest3_HORDE_Level = "27"
Inst21Quest3_HORDE_Attain = "18"
Inst21Quest3_HORDE_Aim = "Tötet Arugal und bringt Dalar Morgenweber in dem Grabmal seinen Kopf."
Inst21Quest3_HORDE_Location = "Dalar Morgenweber (Silberwald - Das Grabmal; "..YELLOW.."44,39"..WHITE..")"
Inst21Quest3_HORDE_Note = "Man findet Argual bei "..YELLOW.."[10]"..WHITE.."."
Inst21Quest3_HORDE_Prequest = "Nein"
Inst21Quest3_HORDE_Folgequest = "Nein"
--
Inst21Quest3name1_HORDE = "Siegel von Sylvanas"

--Quest 4 Horde  (same as Quest 2 Alliance)
Inst21Quest4_HORDE = "4. Die Kugel von Soran'ruk (Hexenmeister)"
Inst21Quest4_HORDE_Level = Inst21Quest2_Level
Inst21Quest4_HORDE_Attain = Inst21Quest2_Attain
Inst21Quest4_HORDE_Aim = Inst21Quest2_Aim
Inst21Quest4_HORDE_Location = Inst21Quest2_Location
Inst21Quest4_HORDE_Note = Inst21Quest2_Note
Inst21Quest4_HORDE_Prequest = Inst21Quest2_Prequest
Inst21Quest4_HORDE_Folgequest = Inst21Quest2_Folgequest
--
Inst21Quest4name1_HORDE = Inst21Quest2name1
Inst21Quest4name2_HORDE = Inst21Quest2name1



--------------- INST22 - Stratholme (Strat) ---------------

Inst22Story = "Einst war Stratholme das Juwel von Lordaeron, aber es ist schon lange her, dass jemand die Stadt bei diesem Namen genannt hat. Hier, an genau diesem Ort, vollzog sich der Anfang des Untergangs von Lordaeron, als sich Arthas gegen seinen Mentor Uther Lichtbringer wandte und hunderte treu ergebener Untertanen, die angeblich mit der Seuche des Untodes in Berührung gekommen waren, ohne jegliches Erbarmen zur Schlachtbank führte. Dies war der erste Schritt auf Arthas langer Reise abwärts in die finstersten Abgründe der menschlichen Seele, die ihn schließlich in die offenen Arme des Lichkönigs trieb. Stratholme ist nun unter der Verwaltung des mächtigen Lichs Kel'thuzad eine Festung der untoten Geißel. Ein Teil der Ruinen wird mit dem Mut der Verzweiflung von einem Kontingent Scharlachroter Kreuzritter gehalten, die von dem Obersten Kreuzzügler Dathrohan angeführt werden. Beide Seiten sind in einem erbitterten Straßenkampf gefangen. Abenteurer, die mutig (oder töricht) genug sind, Stratholme zu betreten, werden sich früher oder später mit beiden Seiten auseinandersetzen müssen. Man sagt, die Stadt werde von drei gewaltigen Wachtürmen, mächtigen Totenbeschwörern, Banshees und Monstrositäten bewacht. Es gibt auch Berichte von einem unheimlichen Todesritter, der auf seinem untoten Ross durch die Straßen reitet, und jeden heimsucht, der es wagt, in das Reich der Geißel vorzudringen."
Inst22Caption = "Stratholme"
Inst22QAA = "18 Quests"
Inst22QAH = "19 Quests"

--Quest 1 Alliance
Inst22Quest1 = "1. Das Fleisch lügt nicht"
Inst22Quest1_Level = "60"
Inst22Quest1_Attain = "55"
Inst22Quest1_Aim = "Sammelt 10 verseuchte Fleischproben in Stratholme und bringt sie zu Betina Moppelzink zurück. Ihr vermutet, dass Ihr besagte Fleischproben bei jeder Kreatur in Stratholme finden könnt."
Inst22Quest1_Location = "Betina Moppelzink (Östliche Pestländer - Kapelle des hoffnungsvollen Lichts; "..YELLOW.."81,59"..WHITE..")"
Inst22Quest1_Note = "Das Fleisch kann bei fast allen Gegnern in Stratholme droppen, aber die Rate ist recht niedrig."
Inst22Quest1_Prequest = "Nein"
Inst22Quest1_Folgequest = "Ja, Der aktive Wirkstoff"
-- No Rewards for this quest

--Quest 2 Alliance
Inst22Quest2 = "2. Der aktive Wirkstoff"
Inst22Quest2_Level = "60"
Inst22Quest2_Attain = "55"
Inst22Quest2_Aim = "Reist nach Stratholme und durchsucht die Ziggurats. Sucht neue Geißeldaten und bringt sie zu Betina Moppelzink zurück."
Inst22Quest2_Location = "Betina Moppelzink (Östliche Pestländer - Kapelle des hoffnungsvollen Lichts; "..YELLOW.."81,59"..WHITE..")"
Inst22Quest2_Note = "Die Daten sind in einem der drei Türme, die man nahe "..YELLOW.."[15]"..WHITE..", "..YELLOW.."[16]"..WHITE.." und "..YELLOW.."[17]"..WHITE.." findet."
Inst22Quest2_Prequest = "Ja, Das Fleisch lügt nicht"
Inst22Quest2_Folgequest = "Nein"
Inst22Quest2FQuest = "true"
--
Inst22Quest2name1 = "Siegel der Dämmerung"
Inst22Quest2name2 = "Rune der Dämmerung"

--Quest 3 Alliance
Inst22Quest3 = "3. Häuser der Heiligen"
Inst22Quest3_Level = "60"
Inst22Quest3_Attain = "55"
Inst22Quest3_Aim = "Begebt Euch nach Stratholme im Norden. Durchsucht die Vorratskisten, die über die Stadt verstreut sind, und holt 5 Einheiten Weihwasser von Stratholme. Kehrt zu Leonidas Bartholomäus dem Geachteten zurück, wenn Ihr genug der gesegneten Flüssigkeit gesammelt habt."
Inst22Quest3_Location = "Leonidas Bartholomäus der Geachtete (Östliche Pestländer - Kapelle des hoffnungsvollen Lichts; "..YELLOW.."80,58"..WHITE..")"
Inst22Quest3_Note = "Das Weihwasser findet man in Vorratskisten, die überall in der Stadt verteilt sind. Wenn man die Kisten öffnet kann es passieren, dass Käfer erscheinen und angreifen."
Inst22Quest3_Prequest = "Nein"
Inst22Quest3_Folgequest = "Nein"
--
Inst22Quest3name1 = "Überragender Heiltrank"
Inst22Quest3name2 = "Großer Manatrank"
Inst22Quest3name3 = "Krone des reuigen Sünders"
Inst22Quest3name4 = "Band des reuigen Sünders"

--Quest 4 Alliance
Inst22Quest4 = "4. Der große Fras Siabi"
Inst22Quest4_Level = "60"
Inst22Quest4_Attain = "55"
Inst22Quest4_Aim = "Sucht Fras Siabis Raucherladen in Stratholme und bergt einen Kasten von Siabis Tollem Tabak. Kehrt zu Smokey LaRue zurück, wenn Eure Aufgabe erledigt ist."
Inst22Quest4_Location = "Smokey LaRue (Östliche Pestländer - Kapelle des hoffnungsvollen Lichts; "..YELLOW.."80,58"..WHITE..")"
Inst22Quest4_Note = "Den Raucherladen findet man bei "..YELLOW.."[1]"..WHITE..". Fras Siabi erscheint, wenn man den Kasten öffnet."
Inst22Quest4_Prequest = "Nein"
Inst22Quest4_Folgequest = "Nein"
--
Inst22Quest4name1 = "Smokeys Feuerzeug"

--Quest 5 Alliance
Inst22Quest5 = "5. Die ruhelosen Seelen"
Inst22Quest5_Attain = "55"
Inst22Quest5_Level = "60"
Inst22Quest5_Aim = "Wendet Egans Blaster auf die geisterhaften und spektralen Bürger von Stratholme an. Wenn die ruhelosen Geister ihre geisterhaften Hüllen sprengen, wendet den Blaster erneut an - dann sind sie endlich frei!\nBefreit 15 ruhelose Seelen und kehrt zu Egan zurück."
Inst22Quest5_Location = "Egan (Östliche Pestländer; "..YELLOW.."14,33"..WHITE..")"
Inst22Quest5_Note = "Das Vorquest bekommt man von Verwalter Alen (Östliche Pestländer - Kapelle des hoffnungsvollen Lichts; "..YELLOW.."79,63"..WHITE.."). Die Spektralen Bürger laufen überall in Stratholme herum."
Inst22Quest5_Prequest = "Ja, Die ruhelosen Seelen"
Inst22Quest5_Folgequest = "Nein"
Inst22Quest5PreQuest = "true"
--
Inst22Quest5name1 = "Testament der Hoffnung"

--Quest 6 Alliance
Inst22Quest6 = "6. Von Liebe und Familie"
Inst22Quest6_Level = "60"
Inst22Quest6_Attain = "52"
Inst22Quest6_Aim = "Begebt Euch nach Stratholme im nördlichen Teil der Pestländer. In der scharlachroten Bastion findet Ihr das Gemälde 'Von Liebe und Familie', das zwischen anderen Gemälden versteckt ist und auf dem die Zwillingsmonde unserer Welt abgebildet sind.\nBringt das Gemälde zu Tirion Fordring."
Inst22Quest6_Location = "Künstlerin Renfray (Westliche Pestländer - Darrowehr; "..YELLOW.."65,75"..WHITE..")"
Inst22Quest6_Note = "Das Vorquest bekommt man von Tirion Fordring (Westliche Pestländer; "..YELLOW.."7,43"..WHITE.."). Das Bild findet man bei "..YELLOW.."[10]"..WHITE.."."
Inst22Quest6_Prequest = "Ja, Erlösung - > Von Liebe und Familie"
Inst22Quest6_Folgequest = "Ja, Myranda suchen"
Inst22Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst22Quest7 = "7. Menethils Geschenk"
Inst22Quest7_Level = "60"
Inst22Quest7_Attain = "57"
Inst22Quest7_Aim = "Begebt Euch nach Stratholme und sucht Menethils Geschenk. Platziert das Andenken der Erinnerung auf dem unheiligen Boden."
Inst22Quest7_Location = "Leonidas Bartholomäus der Geachtete (Östliche Pestländer - Kapelle des hoffnungsvollen Lichts; "..YELLOW.."80,58"..WHITE..")"
Inst22Quest7_Note = "Das Vorquest bekommt man von Magistrat Marduk (Westliche Pestländer - Darrowehr; "..YELLOW.."70,73"..WHITE.."). Das Pentagramm befindet sich bei "..YELLOW.."[19]"..WHITE..". Siehe auch: "..YELLOW.."[Der Lich Ras Frostraunen]"..WHITE.." in Scholomance."
Inst22Quest7_Prequest = "Ja, Der Mensch Ras Frostraunen - > Der Sterbende Ras Frostraunen"
Inst22Quest7_Folgequest = "Ja, Menethils Geschenk"
Inst22Quest7PreQuest = "true"
-- No Rewards for this quest

--Quest 8 Alliance
Inst22Quest8 = "8. Aurius' Abrechnung"
Inst22Quest8_Level = "60"
Inst22Quest8_Attain = "55"
Inst22Quest8_Aim = "Tötet den Baron."
Inst22Quest8_Location = "Aurius (Stratholme; "..YELLOW.."[13]"..WHITE..")"
Inst22Quest8_Note = "Um das Quest zu starten muss man [Das Medaillon des Glaubens] bei Aurius abgeben. Das Medaillon findet man in einer Kiste (Malors Geldkassette "..YELLOW.."[7]"..WHITE..") in der ersten Kammer der Bastion (bevor sich der Weg teilt). Wenn man das Medaillon abgegeben hat hilft Aurius beim Kampf gegen den Baron "..YELLOW.."[19]"..WHITE..". Sobald dieser besiegt ist muss man Aurius nochmal ansprechen, um die Questbelohnung zu erhalten."
Inst22Quest8_Prequest = "Nein"
Inst22Quest8_Folgequest = "Nein"
--
Inst22Quest8name1 = "Wille des Märtyrers"
Inst22Quest8name2 = "Blut des Märtyrers"

--Quest 9 Alliance
Inst22Quest9 = "9. Der Archivar"
Inst22Quest9_Level = "60"
Inst22Quest9_Attain = "55"
Inst22Quest9_Aim = "Reist nach Stratholme und sucht Archivar Galford vom Scharlachroten Kreuzzug. Vernichtet ihn und verbrennt das Scharlachrote Archiv."
Inst22Quest9_Location = "Fürst Nicholas Zverenhoff (Östliche Pestländer - Kapelle des hoffnungsvollen Lichts; "..YELLOW.."81,59"..WHITE..")"
Inst22Quest9_Note = "Das Archiv und den Archivar findet man bei "..YELLOW.."[10]"..WHITE.."."
Inst22Quest9_Prequest = "Nein"
Inst22Quest9_Folgequest = "Ja, Die Wahrheit zeigt sich mit Macht"
-- No Rewards for this quest

--Quest 10 Alliance
Inst22Quest10 = "10. Die Wahrheit zeigt sich mit Macht"
Inst22Quest10_Level = "60"
Inst22Quest10_Attain = "55"
Inst22Quest10_Aim = "Bringt den Kopf von Balnazzar zu Fürst Nicholas Zverenhoff in den östlichen Pestländern."
Inst22Quest10_Location = "Balnazzar (Stratholme; "..YELLOW.."[11]"..WHITE..")"
Inst22Quest10_Note = "Fürst Nicholas Zverenhoff findet man in den Östlichen Pestländern - Kapelle des hoffnungsvollen Lichts ("..YELLOW.."81,59"..WHITE..")."
Inst22Quest10_Prequest = "Ja, Der Archivar"
Inst22Quest10_Folgequest = "Ja, Übertroffen"
Inst22Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst22Quest11 = "11. Übertroffen"
Inst22Quest11_Level = "60"
Inst22Quest11_Attain = "55"
Inst22Quest11_Aim = "Zieht nach Stratholme und vernichtet Baron Totenschwur. Nehmt seinen Kopf und kehrt zu Fürst Nicholas Zverenhoff zurück."
Inst22Quest11_Location = "Fürst Nicholas Zverenhoff (Östliche Pestländer - Kapelle des hoffnungsvollen Lichts; "..YELLOW.."81,59"..WHITE..")"
Inst22Quest11_Note = "Den Baron findet man bei "..YELLOW.."[19]"..WHITE.."."
Inst22Quest11_Prequest = "Ja, Die Wahrheit zeigt sich mit Macht"
Inst22Quest11_Folgequest = "Nein"
Inst22Quest11FQuest = "true"
--
Inst22Quest11name1 = "Argentumverteidiger"
Inst22Quest11name2 = "Argentumkreuzfahrer"
Inst22Quest11name3 = "Argentumrächer"

--Quest 12 Alliance
Inst22Quest12 = "12. Die letzte Bitte eines toten Mannes"
Inst22Quest12_Level = "60"
Inst22Quest12_Attain = "58"
Inst22Quest12_Aim = "Geht nach Stratholme und befreit Ysida Harmon aus den Fängen von Baron Totenschwur."
Inst22Quest12_Location = "Anthion Harmon (Östliche Pestländer - Stratholme)"
Inst22Quest12_Note = "Anthion steht vor dem Stratholme Eingangsportal. Man benötigt den Extradimensionalen Geisterdetektor, um ihn sehen zu können. Diesen erhält man beim Vorquest. Die Questreihe beginnt mit Die angemessene Entlohnung. Deliana in Eisenschmiede ("..YELLOW.."43,52"..WHITE..") für Allianz, Mokvar in Orgrimmar ("..YELLOW.."38,37"..WHITE..") für Horde.\nDas ist der berüchtigte '45 Minuten' Baron-Run."
Inst22Quest12_Prequest = "Ja, Suche nach Anthion"
Inst22Quest12_Folgequest = "Ja, Lebensbeweis"
Inst22Quest12PreQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst22Quest13 = "13. Das linke Stück von Lord Valthalaks Amulett"
Inst22Quest13_Level = "60"
Inst22Quest13_Attain = "60"
Inst22Quest13_Aim = "Benutzt das Räuchergefäß der Beschwörung, um die Geister von Jarien und Sothos zu beschwören und zu vernichten. Kehrt dann mit dem linken Stück von Lord Valthalaks Amulett und dem Räuchergefäß der Beschwörung zu Bodley im Schwarzfels zurück."
Inst22Quest13_Location = "Bodley (Schwarzfels; "..YELLOW.."[D] auf der Eingangskarte"..WHITE..")"
Inst22Quest13_Note = "Der Extradimensionale Geisterdetektor wird benötigt um Bodley zu sehen. Man erhält ihn beim Quest 'Suche nach Anthion'.\n\nJarien und Sothos werden bei "..YELLOW.."[11]"..WHITE.." beschworen."
Inst22Quest13_Prequest = "Ja, Komponenten von großer Wichtigkeit"
Inst22Quest13_Folgequest = "Ja, Ich sehe die Insel Alcaz in Eurer Zukunft"
Inst22Quest13PreQuest = "true"
-- No Rewards for this quest

--Quest 14 Alliance
Inst22Quest14 = "14. Das rechte Stück von Lord Valthalaks Amulett"
Inst22Quest14_Level = "60"
Inst22Quest14_Attain = "60"
Inst22Quest14_Aim = "UBenutzt das Räuchergefäß der Beschwörung, um die Geister von Jarien und Sothos zu beschwören und zu vernichten. Kehrt dann mit Lord Valthalaks zusammengesetzten Amulett und dem Räuchergefäß der Beschwörung zu Bodley im Schwarzfels zurück."
Inst22Quest14_Location = "Bodley (Schwarzfels; "..YELLOW.."[D] auf der Eingangskarte"..WHITE..")"
Inst22Quest14_Note = "Der Extradimensionale Geisterdetektor wird benötigt um Bodley zu sehen. Man erhält ihn beim Quest 'Suche nach Anthion'.\n\nJarien und Sothos werden bei "..YELLOW.."[11]"..WHITE.." beschworen."
Inst22Quest14_Prequest = "Ja, Mehr Komponenten von großer Wichtigkeit"
Inst22Quest14_Folgequest = "Ja, Letzte Vorbereitungen ("..YELLOW.."Obere Schwarzfelsspitze"..WHITE..")"
Inst22Quest14PreQuest = "true"
-- No Rewards for this quest

--Quest 15 Alliance
Inst22Quest15 = "15. Atiesh, Hohestab des Wächters"
Inst22Quest15_Level = "60"
Inst22Quest15_Attain = "60"
Inst22Quest15_Aim = "Anachronos in den Höhlen der Zeit in Tanaris möchte, dass Ihr Atiesh, den Hohestab des Wächters, nach Stratholme bringt und dort auf dem geheiligten Boden platziert. Bezwingt das Wesen, das aus dem Stab getrieben wurde, und kehrt danach wieder zu ihm zurück."
Inst22Quest15_Location = "Anachronos (Tanaris - Höhlen der Zeit; "..YELLOW.."65,49"..WHITE..")"
Inst22Quest15_Note = "Atiesh wird bei "..YELLOW.."[2]"..WHITE.." beschworen."
Inst22Quest15_Prequest = "Ja"
Inst22Quest15_Folgequest = "Nein"
--
Inst22Quest15name1 = "Atiesh, Hohestab des Wächters"
Inst22Quest15name2 = "Atiesh, Hohestab des Wächters"
Inst22Quest15name3 = "Atiesh, Hohestab des Wächters"
Inst22Quest15name4 = "Atiesh, Hohestab des Wächters"

--Quest 16 Alliance
Inst22Quest16 = "16. Verderbnis (Schmiedekunst)"
Inst22Quest16_Level = "60"
Inst22Quest16_Attain = "50"
Inst22Quest16_Aim = "Findet den Schwertschmied der schwarzen Wache in Stratholme und vernichtet ihn. Holt die Insignien der schwarzen Wache und kehrt zu Seril Geißelbann zurück."
Inst22Quest16_Location = "Seril Geißelbann (Winterquell - Ewige Warte; "..YELLOW.."61,37"..WHITE..")"
Inst22Quest16_Note = "Der Schwertschmied der schwarzen Wache wird nahe bei "..YELLOW.."[15]"..WHITE.." beschworen."
Inst22Quest16_Prequest = "Nein"
Inst22Quest16_Folgequest = "Nein"
--
Inst22Quest16name1 = "Pläne: Loderflammenrapier"

--Quest 17 Alliance
Inst22Quest17 = "17. Süße Beschaulichkeit (Schmiedekunst)"
Inst22Quest17_Level = "60"
Inst22Quest17_Attain = "51"
Inst22Quest17_Aim = "Begebt Euch nach Stratholme und tötet den purpurroten Hammerschmied. Nehmt die Schürze des purpurroten Hammerschmiedes und kehrt zu Lilith zurück."
Inst22Quest17_Location = "Lilith die Liebliche (Winterquell - Ewige Warte; "..YELLOW.."61,37"..WHITE..")"
Inst22Quest17_Note = "Der purpurrote Hammerschmied wird bei "..YELLOW.."[8]"..WHITE.." beschworen."
Inst22Quest17_Prequest = "Nein"
Inst22Quest17_Folgequest = "Nein"
--
Inst22Quest17name1 = "Pläne: Verzauberter Kampfhammer"

--Quest 18 Alliance
Inst22Quest18 = "18. Die Waage von Licht und Schatten (Priester)"
Inst22Quest18_Level = "60"
Inst22Quest18_Attain = "60"
Inst22Quest18_Aim = "Rettet 50 Arbeiter bevor 15 getötet wurden. Sprecht mit Eris Himmelsfeuer, falls Ihr diesen Auftrag erfolgreich zu Ende bringen solltet."
Inst22Quest18_Location = "Eris Himmelsfeuer (Östliche Pestländer; "..YELLOW.."21,18"..WHITE..")"
Inst22Quest18_Note = "Um Eris Himmelsfeuer sehen zu können und dieses Quest zu erhalten benötigt man entweder das Auge der Offenbarung (erhält man aus dem Behälter des Feuerfürsten im "..YELLOW.."[Geschmolzenen Kern]"..WHITE..") oder Spektrale Essenz (Belohnung für "..YELLOW.."[Scholomance]"..WHITE.." Quest 'Kirtonos der Herold').\n\nDie Belohnung für dieses Quest bildet zusammen mit dem Auge der Offenbarung und dem Auge der Schatten (droppt von "..YELLOW.."[Hochlord Kruul]"..WHITE..") Segnung, einen epischen Priesterstab."
Inst22Quest18_Prequest = "Nein"
Inst22Quest18_Folgequest = "Nein"
--
Inst22Quest18name1 = "Splitter von Nordrassil"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst22Quest1_HORDE = Inst22Quest1
Inst22Quest1_HORDE_Level = Inst22Quest1_Level
Inst22Quest1_HORDE_Attain = Inst22Quest1_Attain
Inst22Quest1_HORDE_Aim = Inst22Quest1_Aim
Inst22Quest1_HORDE_Location = Inst22Quest1_Location
Inst22Quest1_HORDE_Note = Inst22Quest1_Note
Inst22Quest1_HORDE_Prequest = Inst22Quest1_Prequest
Inst22Quest1_HORDE_Folgequest = Inst22Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst22Quest2_HORDE = Inst22Quest2
Inst22Quest2_HORDE_Level = Inst22Quest2_Level
Inst22Quest2_HORDE_Attain = Inst22Quest2_Attain
Inst22Quest2_HORDE_Aim = Inst22Quest2_Aim
Inst22Quest2_HORDE_Location = Inst22Quest2_Location
Inst22Quest2_HORDE_Note = Inst22Quest2_Note
Inst22Quest2_HORDE_Prequest = Inst22Quest2_Prequest
Inst22Quest2_HORDE_Folgequest = Inst22Quest2_Folgequest
Inst22Quest2FQuest_HORDE = Inst22Quest2FQuest
--
Inst22Quest2name1_HORDE = Inst22Quest2name1
Inst22Quest2name2_HORDE = Inst22Quest2name2

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst22Quest3_HORDE = Inst22Quest3
Inst22Quest3_HORDE_Level = Inst22Quest3_Level
Inst22Quest3_HORDE_Attain = Inst22Quest3_Attain
Inst22Quest3_HORDE_Aim = Inst22Quest3_Aim
Inst22Quest3_HORDE_Location = Inst22Quest3_Location
Inst22Quest3_HORDE_Note = Inst22Quest3_Note
Inst22Quest3_HORDE_Prequest = Inst22Quest3_Prequest
Inst22Quest3_HORDE_Folgequest = Inst22Quest3_Folgequest
--
Inst22Quest3name1_HORDE = Inst22Quest3name1
Inst22Quest3name2_HORDE = Inst22Quest3name2
Inst22Quest3name3_HORDE = Inst22Quest3name3
Inst22Quest3name4_HORDE = Inst22Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst22Quest4_HORDE = Inst22Quest4
Inst22Quest4_HORDE_Level = Inst22Quest4_Level
Inst22Quest4_HORDE_Attain = Inst22Quest4_Attain
Inst22Quest4_HORDE_Aim = Inst22Quest4_Aim
Inst22Quest4_HORDE_Location = Inst22Quest4_Location
Inst22Quest4_HORDE_Note = Inst22Quest4_Note
Inst22Quest4_HORDE_Prequest = Inst22Quest4_Prequest
Inst22Quest4_HORDE_Folgequest = Inst22Quest4_Folgequest
--
Inst22Quest4name1_HORDE = Inst22Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst22Quest5_HORDE = Inst22Quest5
Inst22Quest5_HORDE_Level = Inst22Quest5_Level
Inst22Quest5_HORDE_Attain = Inst22Quest5_Attain
Inst22Quest5_HORDE_Aim = Inst22Quest5_Aim
Inst22Quest5_HORDE_Location = Inst22Quest5_Location
Inst22Quest5_HORDE_Note = Inst22Quest5_Note
Inst22Quest5_HORDE_Prequest = Inst22Quest5_Prequest
Inst22Quest5_HORDE_Folgequest = Inst22Quest5_Folgequest
Inst22Quest5PreQuest_HORDE = Inst22Quest5PreQuest
--
Inst22Quest5name1_HORDE = Inst22Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst22Quest6_HORDE = Inst22Quest6
Inst22Quest6_HORDE_Level = Inst22Quest6_Level
Inst22Quest6_HORDE_Attain = Inst22Quest6_Attain
Inst22Quest6_HORDE_Aim = Inst22Quest6_Aim
Inst22Quest6_HORDE_Location = Inst22Quest6_Location
Inst22Quest6_HORDE_Note = Inst22Quest6_Note
Inst22Quest6_HORDE_Prequest = Inst22Quest6_Prequest
Inst22Quest6_HORDE_Folgequest = Inst22Quest6_Folgequest
Inst22Quest6PreQuest_HORDE = Inst22Quest6PreQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst22Quest7_HORDE = Inst22Quest7
Inst22Quest7_HORDE_Level = Inst22Quest7_Level
Inst22Quest7_HORDE_Attain = Inst22Quest7_Attain
Inst22Quest7_HORDE_Aim = Inst22Quest7_Aim
Inst22Quest7_HORDE_Location = Inst22Quest7_Location
Inst22Quest7_HORDE_Note = Inst22Quest7_Note
Inst22Quest7_HORDE_Prequest = Inst22Quest7_Prequest
Inst22Quest7_HORDE_Folgequest = Inst22Quest7_Folgequest
Inst22Quest7PreQuest_HORDE = Inst22Quest7PreQuest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst22Quest8_HORDE = Inst22Quest8
Inst22Quest8_HORDE_Level = Inst22Quest8_Level
Inst22Quest8_HORDE_Attain = Inst22Quest8_Attain
Inst22Quest8_HORDE_Aim = Inst22Quest8_Aim
Inst22Quest8_HORDE_Location = Inst22Quest8_Location
Inst22Quest8_HORDE_Note = Inst22Quest8_Note
Inst22Quest8_HORDE_Prequest = Inst22Quest8_Prequest
Inst22Quest8_HORDE_Folgequest = Inst22Quest8_Folgequest
--
Inst22Quest8name1_HORDE = Inst22Quest8name1
Inst22Quest8name2_HORDE = Inst22Quest8name2

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst22Quest9_HORDE = Inst22Quest9
Inst22Quest9_HORDE_Level = Inst22Quest9_Level
Inst22Quest9_HORDE_Attain = Inst22Quest9_Attain
Inst22Quest9_HORDE_Aim = Inst22Quest9_Aim
Inst22Quest9_HORDE_Location = Inst22Quest9_Location
Inst22Quest9_HORDE_Note = Inst22Quest9_Note
Inst22Quest9_HORDE_Prequest = Inst22Quest9_Prequest
Inst22Quest9_HORDE_Folgequest = Inst22Quest9_Folgequest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst22Quest10_HORDE = Inst22Quest10
Inst22Quest10_HORDE_Level = Inst22Quest10_Level
Inst22Quest10_HORDE_Attain = Inst22Quest10_Attain
Inst22Quest10_HORDE_Aim = Inst22Quest10_Aim
Inst22Quest10_HORDE_Location = Inst22Quest10_Location
Inst22Quest10_HORDE_Note = Inst22Quest10_Note
Inst22Quest10_HORDE_Prequest = Inst22Quest10_Prequest
Inst22Quest10_HORDE_Folgequest = Inst22Quest10_Folgequest
Inst22Quest10FQuest_HORDE = Inst22Quest10FQuest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst22Quest11_HORDE = Inst22Quest11
Inst22Quest11_HORDE_Level = Inst22Quest11_Level
Inst22Quest11_HORDE_Attain = Inst22Quest11_Attain
Inst22Quest11_HORDE_Aim = Inst22Quest11_Aim
Inst22Quest11_HORDE_Location = Inst22Quest11_Location
Inst22Quest11_HORDE_Note = Inst22Quest11_Note
Inst22Quest11_HORDE_Prequest = Inst22Quest11_Prequest
Inst22Quest11_HORDE_Folgequest = Inst22Quest11_Folgequest
Inst22Quest11FQuest_HORDE = Inst22Quest11FQuest
--
Inst22Quest11name1_HORDE = Inst22Quest11name1
Inst22Quest11name2_HORDE = Inst22Quest11name2
Inst22Quest11name3_HORDE = Inst22Quest11name3

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst22Quest12_HORDE = Inst22Quest12
Inst22Quest12_HORDE_Level = Inst22Quest12_Level
Inst22Quest12_HORDE_Attain = Inst22Quest12_Attain
Inst22Quest12_HORDE_Aim = Inst22Quest12_Aim
Inst22Quest12_HORDE_Location = Inst22Quest12_Location
Inst22Quest12_HORDE_Note = Inst22Quest12_Note
Inst22Quest12_HORDE_Prequest = Inst22Quest12_Prequest
Inst22Quest12_HORDE_Folgequest = Inst22Quest12_Folgequest
Inst22Quest12PreQuest_HORDE = Inst22Quest12PreQuest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst22Quest13_HORDE = Inst22Quest13
Inst22Quest13_HORDE_Level = Inst22Quest13_Level
Inst22Quest13_HORDE_Attain = Inst22Quest13_Attain
Inst22Quest13_HORDE_Aim = Inst22Quest13_Aim
Inst22Quest13_HORDE_Location = Inst22Quest13_Location
Inst22Quest13_HORDE_Note = Inst22Quest13_Note
Inst22Quest13_HORDE_Prequest = Inst22Quest13_Prequest
Inst22Quest13_HORDE_Folgequest = Inst22Quest13_Folgequest
Inst22Quest13PreQuest_HORDE = Inst22Quest13PreQuest
-- No Rewards for this quest

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst22Quest14_HORDE = Inst22Quest14
Inst22Quest14_HORDE_Level = Inst22Quest14_Level
Inst22Quest14_HORDE_Attain = Inst22Quest14_Attain
Inst22Quest14_HORDE_Aim = Inst22Quest14_Aim
Inst22Quest14_HORDE_Location = Inst22Quest14_Location
Inst22Quest14_HORDE_Note = Inst22Quest14_Note
Inst22Quest14_HORDE_Prequest = Inst22Quest14_Prequest
Inst22Quest14_HORDE_Folgequest = Inst22Quest14_Folgequest
Inst22Quest14PreQuest_HORDE = Inst22Quest14PreQuest
-- No Rewards for this quest

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst22Quest15_HORDE = Inst22Quest15
Inst22Quest15_HORDE_Level = Inst22Quest15_Level
Inst22Quest15_HORDE_Attain = Inst22Quest15_Attain
Inst22Quest15_HORDE_Aim = Inst22Quest15_Aim
Inst22Quest15_HORDE_Location = Inst22Quest15_Location
Inst22Quest15_HORDE_Note = Inst22Quest15_Note
Inst22Quest15_HORDE_Prequest = Inst22Quest15_Prequest
Inst22Quest15_HORDE_Folgequest = Inst22Quest15_Folgequest
Inst22Quest15PreQuest_HORDE = Inst22Quest15PreQuest
--
Inst22Quest15name1_HORDE = Inst22Quest15name1
Inst22Quest15name2_HORDE = Inst22Quest15name2
Inst22Quest15name3_HORDE = Inst22Quest15name3
Inst22Quest15name4_HORDE = Inst22Quest15name4

--Quest 16 Horde  (same as Quest 16 Alliance)
Inst22Quest16_HORDE = Inst22Quest16
Inst22Quest16_HORDE_Level = Inst22Quest16_Level
Inst22Quest16_HORDE_Attain = Inst22Quest16_Attain
Inst22Quest16_HORDE_Aim = Inst22Quest16_Aim
Inst22Quest16_HORDE_Location = Inst22Quest16_Location
Inst22Quest16_HORDE_Note = Inst22Quest16_Note
Inst22Quest16_HORDE_Prequest = Inst22Quest16_Prequest
Inst22Quest16_HORDE_Folgequest = Inst22Quest16_Folgequest
--
Inst22Quest16name1_HORDE = Inst22Quest16name1

--Quest 17 Horde  (same as Quest 17 Alliance)
Inst22Quest17_HORDE = Inst22Quest17
Inst22Quest17_HORDE_Level = Inst22Quest17_Level
Inst22Quest17_HORDE_Attain = Inst22Quest17_Attain
Inst22Quest17_HORDE_Aim = Inst22Quest17_Aim
Inst22Quest17_HORDE_Location = Inst22Quest17_Location
Inst22Quest17_HORDE_Note = Inst22Quest17_Note
Inst22Quest17_HORDE_Prequest = Inst22Quest17_Prequest
Inst22Quest17_HORDE_Folgequest = Inst22Quest17_Folgequest
--
Inst22Quest17name1_HORDE = Inst22Quest17name1

--Quest 18 Horde
Inst22Quest18_HORDE = "18. Ramstein"
Inst22Quest18_HORDE_Level = "60"
Inst22Quest18_HORDE_Attain = "56"
Inst22Quest18_HORDE_Aim = "Reist nach Stratholme und tötet Ramstein den Würger. Bringt seinen Kopf als Souvenir zu Nathanos."
Inst22Quest18_HORDE_Location = "Nathanos Pestrufer (Östliche Pestländer; "..YELLOW.."26,74"..WHITE..")"
Inst22Quest18_HORDE_Note = "Das Vorquest erhält man auch von Nathanos Pestrufer. Ramstein findet man bei "..YELLOW.."[18]"..WHITE.."."
Inst22Quest18_HORDE_Prequest = "Ja, Das Ersuchen des Waldläuferlords -> Dämmerschwinge, oh, wie ich Euch hasse..."
Inst22Quest18_HORDE_Folgequest = "Nein"
Inst22Quest18PreQuest_HORDE = "true"
--
Inst22Quest18name1_HORDE = "Königliches Siegel von Alexis"
Inst22Quest18name2_HORDE = "Elementarkreis"

--Quest 19 Horde  (same as Quest 18 Alliance)
Inst22Quest19_HORDE = "19. Die Waage von Licht und Schatten (Priester)"
Inst22Quest19_HORDE_Level = Inst22Quest18_Level
Inst22Quest19_HORDE_Attain = Inst22Quest18_Attain
Inst22Quest19_HORDE_Aim = Inst22Quest18_Aim
Inst22Quest19_HORDE_Location = Inst22Quest18_Location
Inst22Quest19_HORDE_Note = Inst22Quest18_Note
Inst22Quest19_HORDE_Prequest = Inst22Quest18_Prequest
Inst22Quest19_HORDE_Folgequest = Inst22Quest18_Folgequest
--
Inst22Quest19name1_HORDE = Inst22Quest18name1



--------------- INST23 - The Ruins of Ahn'Qiraj (AQ20) ---------------

Inst23Story = "In den letzten Stunden des Krieges gegen die Silithiden trugen die Nachtelfen und die vier Drachenschwärme die Schlacht in das Herz des Qiraji Reichs zurück: in die Festung von Ahn'Qiraj. An den Toren der Stadt stießen sie auf ein Aufgebot von Kriegsdrohnen, gewaltiger als es je zuvor gesehen wurde. Die Silithiden und ihre Qiraji Herren konnten nicht besiegt werden und wurden stattdessen innerhalb einer magischen Barriere eingeschlossen; der Krieg hinterließ die verfluchte Stadt in Ruinen. Tausend Jahre sind seitdem vergangen - Jahre, in denen die Qiraji nicht untätig waren. Eine neue und schreckliche Streitmacht ist in den Stöcken ausgebrütet worden und die Ruinen von Ahn'Qiraj wurden erneut von Silithidenschwärmen und Qiraji bevölkert. Diese Bedrohung gilt es zu meistern, ansonsten wird Azeroth der schrecklichen Macht dieser neuen Qiraji Streitkraft zum Opfer fallen."
Inst23Caption = "Ruinen von Ahn'Qiraj"
Inst23QAA = "2 Quests"
Inst23QAH = "2 Quests"

--Quest 1 Alliance
Inst23Quest1 = "1. Der Untergang von Ossirian"
Inst23Quest1_Level = "60"
Inst23Quest1_Attain = "60"
Inst23Quest1_Aim = "Bringt den Kopf von Ossirian dem Narbenlosen zu Kommandant Mar'alith auf Burg Cenarius in Silithus."
Inst23Quest1_Location = "Kopf von Ossirian dem Narbenlosen (droppt von Ossirian dem Narbenlosen; "..YELLOW.."[6]"..WHITE..")"
Inst23Quest1_Note = "Kommandant Mar'alith (Silithus - Burg Cenarius; "..YELLOW.."49,34"..WHITE..")"
Inst23Quest1_Prequest = "Nein"
Inst23Quest1_Folgequest = "Nein"
--
Inst23Quest1name1 = "Glücksbringer der Sandstürme"
Inst23Quest1name2 = "Amulett der Sandstürme"
Inst23Quest1name3 = "Halsschmuck der Sandstürme"
Inst23Quest1name4 = "Anhänger der Sandstürme"

--Quest 2 Alliance
Inst23Quest2 = "2. Das perfekte Gift"
Inst23Quest2_Level = "60"
Inst23Quest2_Attain = "60"
Inst23Quest2_Aim = "Dirk Donnerholz in der Burg Cenarius will, dass Ihr ihm Venoxis' Giftbeutel und Kurinnaxx' Giftbeutel bringt."
Inst23Quest2_Location = "Dirk Donnerholz (Silithus - Burg Cenarius; "..YELLOW.."52,39"..WHITE..")"
Inst23Quest2_Note = "Venoxis' Giftbeutel droppt von Hohepriester Venoxis in "..YELLOW.."Zul'Gurub"..WHITE..". Kurinnaxx' Giftbeutel droppt in den "..YELLOW.."Ruinen von Ahn'Qiraj"..WHITE.." bei "..YELLOW.."[1]"..WHITE.."."
Inst23Quest2_Prequest = "Nein"
Inst23Quest2_Folgequest = "Nein"
--
Inst23Quest2name1 = "Rabenholdtschnitzler"
Inst23Quest2name2 = "Messerritzels Messer"
Inst23Quest2name3 = "Donnerholzschüreisen"
Inst23Quest2name4 = "Schicksalsbringer"
Inst23Quest2name5 = "Fahrads selbstladende Repetierarmbrust"
Inst23Quest2name6 = "Simones Hammer der Kultivierung"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst23Quest1_HORDE = Inst23Quest1
Inst23Quest1_HORDE_Level = Inst23Quest1_Level
Inst23Quest1_HORDE_Attain = Inst23Quest1_Attain
Inst23Quest1_HORDE_Aim = Inst23Quest1_Aim
Inst23Quest1_HORDE_Location = Inst23Quest1_Location
Inst23Quest1_HORDE_Note = Inst23Quest1_Note
Inst23Quest1_HORDE_Prequest = Inst23Quest1_Prequest
Inst23Quest1_HORDE_Folgequest = Inst23Quest1_Folgequest
--
Inst23Quest1name1_HORDE = Inst23Quest1name1
Inst23Quest1name2_HORDE = Inst23Quest1name2
Inst23Quest1name3_HORDE = Inst23Quest1name3
Inst23Quest1name4_HORDE = Inst23Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst23Quest2_HORDE = Inst23Quest2
Inst23Quest2_HORDE_Level = Inst23Quest2_Level
Inst23Quest2_HORDE_Attain = Inst23Quest2_Attain
Inst23Quest2_HORDE_Aim = Inst23Quest2_Aim
Inst23Quest2_HORDE_Location = Inst23Quest2_Location
Inst23Quest2_HORDE_Note = Inst23Quest2_Note
Inst23Quest2_HORDE_Prequest = Inst23Quest2_Prequest
Inst23Quest2_HORDE_Folgequest = Inst23Quest2_Folgequest
--
Inst23Quest2name1_HORDE = Inst23Quest2name1
Inst23Quest2name2_HORDE = Inst23Quest2name2
Inst23Quest2name3_HORDE = Inst23Quest2name3
Inst23Quest2name4_HORDE = Inst23Quest2name4
Inst23Quest2name5_HORDE = Inst23Quest2name5
Inst23Quest2name6_HORDE = Inst23Quest2name6



--------------- INST24 - The Stockade (Stocks) ---------------

Inst24Story = "Das Verlies ist ein Hochsicherheitsgefängnis, das unter dem Kanalbezirk von Sturmwind verborgen liegt. Unter der Führung von Aufseher Thelwasser sammelten sich im Verlies mit der Zeit ein bunter Haufen simpler Gauner, politischer Aufrührer, Mörder, Diebe, Halsabschneider und einiger der gefährlichsten Kriminellen des Landes an. Vor kurzem gab es einen Aufstand der Gefangenen, der im Verlies für Chaos sorgte - die Wachen sind geflohen und die Gefangenen haben das Gefängnis übernommen. Thelwasser konnte knapp entkommen und sucht momentan nach tapferen Abenteurern, um den Anführer der Revolte auszuschalten, den gerissenen Meisterverbrecher Bazil Thredd."
Inst24Caption = "Das Verlies"
Inst24QAA = "6 Quests"
Inst24QAH = "Keine Quests"

--Quest 1 Alliance
Inst24Quest1 = "1. Verbrechen lohnt sich nicht"
Inst24Quest1_Level = "25"
Inst24Quest1_Attain = "22"
Inst24Quest1_Aim = "Bringt Wache Berton in Seenhain den Kopf von Targorr dem Schrecklichen."
Inst24Quest1_Location = "Wache Berton (Rotkammgebirge - Seehain; "..YELLOW.."26,46"..WHITE..")"
Inst24Quest1_Note = "Targorr findet man bei "..YELLOW.."[1]"..WHITE.."."
Inst24Quest1_Prequest = "Nein"
Inst24Quest1_Folgequest = "Nein"
--
Inst24Quest1name1 = "Lucinenlangschwert"
Inst24Quest1name2 = "Gehärteter Wurzelstab"

--Quest 2 Alliance
Inst24Quest2 = "2. Verbrechen und Strafe"
Inst24Quest2_Level = "26"
Inst24Quest2_Attain = "22"
Inst24Quest2_Aim = "Ratsherr Mühlenstein von Dunkelhain will, dass Ihr ihm die Hand von Dextren Ward bringt."
Inst24Quest2_Location = "Ratsherr Mühlenstein (Dämmerwald - Dunkelhain; "..YELLOW.."72,47"..WHITE..")"
Inst24Quest2_Note = "Dextren findet man bei "..YELLOW.."[5]"..WHITE.."."
Inst24Quest2_Prequest = "Nein"
Inst24Quest2_Folgequest = "Nein"
--
Inst24Quest2name1 = "Botschafterstiefel"
Inst24Quest2name2 = "Panzergamaschen von Dunkelhain"

--Quest 3 Alliance
Inst24Quest3 = "3. Niederschlagung des Aufstandes"
Inst24Quest3_Level = "26"
Inst24Quest3_Attain = "22"
Inst24Quest3_Aim = "Aufseher Thelwasser aus Sturmwind will, dass Ihr im Verlies 10 gefangene Defias, 8 eingekerkerte Defias und 8 Aufrührer der Defias tötet."
Inst24Quest3_Location = "Aufseher Thelwasser (Sturmwind - Das Verlies; "..YELLOW.."41,58"..WHITE..")"
Inst24Quest3_Note = ""
Inst24Quest3_Prequest = "Nein"
Inst24Quest3_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Alliance
Inst24Quest4 = "4. Die Farbe von Blut"
Inst24Quest4_Level = "26"
Inst24Quest4_Attain = "22"
Inst24Quest4_Aim = "Nikova Raskol von Sturmwind will, dass Ihr 10 rote Wollkopftücher für sie sammelt."
Inst24Quest4_Location = "Nikova Raskol (Sturmwind - Die Altstadt; "..YELLOW.."73,46"..WHITE..")"
Inst24Quest4_Note = "Alle Gegner innerhalb der Instanz droppen die Wollkopftücher."
Inst24Quest4_Prequest = "Nein"
Inst24Quest4_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Alliance
Inst24Quest5 = "5. Tief empfundener Zorn"
Inst24Quest5_Level = "27"
Inst24Quest5_Attain = "25"
Inst24Quest5_Aim = "Motley Garmason in Dun Modr verlangt Kam Tiefenzorns Kopf."
Inst24Quest5_Location = "Motley Garmason (Sumpfland - Dun Modr; "..YELLOW.."49,18"..WHITE..")"
Inst24Quest5_Note = "Das Vorquest bekommt man auch von Motley. Man findet Kam Tiefenzorn bei "..YELLOW.."[2]"..WHITE.."."
Inst24Quest5_Prequest = "Ja, Der Dunkeleisenkrieg"
Inst24Quest5_Folgequest = "Nein"
Inst24Quest5PreQuest = "true"
--
Inst24Quest5name1 = "Gürtel der Rechtfertigung"
Inst24Quest5name2 = "Kopfberster"

--Quest 6 Alliance
Inst24Quest6 = "6. Aufstand im Verlies"
Inst24Quest6_Level = "29"
Inst24Quest6_Attain = "16"
Inst24Quest6_Aim = "Tötet Bazil Thredd und bringt seinen Kopf mit zurück zu Aufseher Thelwasser im Verlies."
Inst24Quest6_Location = "Aufseher Thelwasser (Sturmwind - Das Verlies; "..YELLOW.."41,58"..WHITE..")"
Inst24Quest6_Note = "Bei "..YELLOW.."[Todesminen, Die Bruderschaft der Defias]"..WHITE.." findet man genauere Informationen über das Vorquest.\nMan findet Bazil Thredd bei "..YELLOW.."[4]"..WHITE.."."
Inst24Quest6_Prequest = "Ja, Die Bruderschaft der Defias -> Bazil Thredd"
Inst24Quest6_Folgequest = "Ja, Der seltsame Besucher"
Inst24Quest6PreQuest = "true"
-- No Rewards for this quest



--------------- INST25 - Sunken Temple (ST) ---------------

Inst25Story = "Vor mehr als tausend Jahren wurde das mächtige Reich der Gurubashi von einem gewaltigen Bürgerkrieg auseinandergerissen. Eine einflussreiche Gruppe trollischer Priester, die als die Atal'ai bekannt waren, wagten den Versuch, einen uralten Blutgott namens Hakkar der Seelenschinder zu beschwören. Obwohl ihr Plan vereitelt und die Priester letztenendes verbannt wurden zerbrach das Reich und kollabierte, da der Krieg sämtlichen inneren Zusammenhalt zwischen den Klans zerstört hatte. Die verbannten Priester flohen weit in den Norden zu den Sümpfen des Elends. Dort bauten sie Hakkar einen großen Tempel, wo sie erneut seine Rückkehr in die Welt vorbereiten wollten. Als der große Drachenaspekt Ysera von den Plänen der Atal'ai erfuhr gab es nichts, was den Zorn des Drachen zurückhalten konnte, und so zerschmetterte sie den Tempel und ließ ihn in den Marschen versinken. Bis zum heutigen Tag werden die Ruinen des Tempels von grünen Drachen bewacht, so dass niemand hinein oder hinaus kann. Allerdings sollen einige der verfluchten Atal'ai überlebt haben und immer noch an der Vollendung ihrer finsteren Pläne arbeiten."
Inst25Caption = "Der versunkene Tempel"
Inst25QAA = "17 Quests"
Inst25QAH = "17 Quests"

--Quest 1 Alliance
Inst25Quest1 = "1. Im Tempel von Atal'Hakkar"
Inst25Quest1_Level = "50"
Inst25Quest1_Attain = "41"
Inst25Quest1_Aim = "Sammelt 10 Schrifttafeln der Atal'ai für Brohann Fassbauch in Sturmwind."
Inst25Quest1_Location = "Brohann Fassbauch (Sturmwind - Zwergendistrikt; "..YELLOW.."64,20"..WHITE..")"
Inst25Quest1_Note = "Die Questreihe davor erhält man vom selben NPC.\n\nMan findet die Tafeln überall im Tempel, außerhalb und innerhalb der Instanz."
Inst25Quest1_Prequest = "Ja, Auf der Suche nach dem Tempel -> Rhapsodies Geschichte"
Inst25Quest1_Folgequest = "Nein"
Inst25Quest1PreQuest = "true"
--
Inst25Quest1name1 = "Wächtertalisman"

--Quest 2 Alliance
Inst25Quest2 = "2. Der Versunkene Tempel"
Inst25Quest2_Level = "51"
Inst25Quest2_Attain = "46"
Inst25Quest2_Aim = "Sucht Marvon Nietensucher in Tanaris."
Inst25Quest2_Location = "Angelas Mondhauch (Feralas - Mondfederfeste; "..YELLOW.."31,45"..WHITE..")"
Inst25Quest2_Note = "Marvon Nietensucher findet man bei "..YELLOW.."52,45"..WHITE.."."
Inst25Quest2_Prequest = "Nein"
Inst25Quest2_Folgequest = "Ja, Der runde Stein"
-- No Rewards for this quest

--Quest 3 Alliance
Inst25Quest3 = "3. In die Tiefen"
Inst25Quest3_Level = "51"
Inst25Quest3_Attain = "46"
Inst25Quest3_Aim = "Sucht den Altar von Hakkar im Versunkenen Tempel in den Sümpfen des Elends."
Inst25Quest3_Location = "Marvon Nietensucher (Tanaris; "..YELLOW.."52,45"..WHITE..")"
Inst25Quest3_Note = "Der Altar befindet sich bei "..YELLOW.."[1]"..WHITE.."."
Inst25Quest3_Prequest = "Ja, Der runde Stein"
Inst25Quest3_Folgequest = "Nein"
Inst25Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst25Quest4 = "4. Das Geheimnis des Kreises"
Inst25Quest4_Level = "51"
Inst25Quest4_Attain = "46"
Inst25Quest4_Aim = "Reist zum Versunkenen Tempel und enthüllt das Geheimnis, das sich in dem Kreis der Statuen verbirgt."
Inst25Quest4_Location = "Marvon Nietensucher (Tanaris; "..YELLOW.."52,45"..WHITE..")"
Inst25Quest4_Note = "Man findet die Statuen bei "..YELLOW.."[1]"..WHITE..". Schaut auf die Karte für die Aktivierungsreihenfolge."
Inst25Quest4_Prequest = "Ja, Der runde Stein"
Inst25Quest4_Folgequest = "Nein"
Inst25Quest4FQuest = "true"
--
Inst25Quest4name1 = "Urne der Hakkari"

--Quest 5 Alliance
Inst25Quest5 = "5. Der Dunst des Bösen"
Inst25Quest5_Level = "52"
Inst25Quest5_Attain = "47"
Inst25Quest5_Aim = "Sammelt 5 Proben Dunst der Atal'ai und bringt sie Muigin im Krater von Un'Goro."
Inst25Quest5_Location = "Gregan Hopfenspei (Feralas; "..YELLOW.."45,25"..WHITE..")"
Inst25Quest5_Note = "Das Vorquest 'Muigin und Larion' bekommt man von Muigin (Krater von Un'Goro - Marschalls Zuflucht; "..YELLOW.."42,9"..WHITE.."). Den Dunst bekommt man von Tiefenlauerern, Düsterwürmern oder Brühschlammern im Tempel."
Inst25Quest5_Prequest = "Ja, Muigin und Larion -> Ein Besuch bei Gregan"
Inst25Quest5_Folgequest = "Nein"
Inst25Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst25Quest6 = "6. Der Gott Hakkar"
Inst25Quest6_Level = "53"
Inst25Quest6_Attain = "42"
Inst25Quest6_Aim = "Bringt das gefüllte Ei von Hakkar zu Yeh'kinya nach Tanaris."
Inst25Quest6_Location = "Yeh'kinya (Tanaris - Dampfdruckpier; "..YELLOW.."66,22"..WHITE..")"
Inst25Quest6_Note = "Die Questreihe beginnt mit 'Kreischergeister' beim selbem NPC (Siehe "..YELLOW.."[Zul'Farrak]"..WHITE..").\nDas Ei muss man bei "..YELLOW.."[3]"..WHITE.." benutzen. Sobald man es aktiviert, erscheinen Wellen von Gegnern und greifen an. Einige der Mobs droppen das Blut von Hakkar, mit dem man eine der vier brennenden Schalen in den Ecken löschen kann. Sobald alle Schalen gelöscht sind erscheint der Avatar von Hakkar. Dieser droppt die 'Essenz von Hakkar', mit der man das Ei füllt."
Inst25Quest6_Prequest = "Ja, Kreischergeister -> Das uralte Ei"
Inst25Quest6_Folgequest = "Nein"
Inst25Quest6PreQuest = "true"
--
Inst25Quest6name1 = "Avenwachthelm"
Inst25Quest6name2 = "Langdolch der Lebenskraft"
Inst25Quest6name3 = "Edelsteinbesetzter Reif"

--Quest 7 Alliance
Inst25Quest7 = "7. Jammal'an der Prophet"
Inst25Quest7_Level = "53"
Inst25Quest7_Attain = "38"
Inst25Quest7_Aim = "Der Verbannte der Atal'ai im Hinterland möchte den Kopf von Jammal'an."
Inst25Quest7_Location = "Der Verbannte der Atal'ai (Das Hinterland; "..YELLOW.."33,75"..WHITE..")"
Inst25Quest7_Note = "Jammal'an findet man bei "..YELLOW.."[4]"..WHITE.."."
Inst25Quest7_Prequest = "Nein"
Inst25Quest7_Folgequest = "Nein"
--
Inst25Quest7name1 = "Regenschreitergamaschen"
Inst25Quest7name2 = "Helm des Banns"

--Quest 8 Alliance
Inst25Quest8 = "8. Die Essenz des Eranikus"
Inst25Quest8_Level = "55"
Inst25Quest8_Attain = "48"
Inst25Quest8_Aim = "Legt die Essenz von Eranikus in den Essenzborn, der sich in dem Versunkenen Tempel in seinem Unterschlupf befindet."
Inst25Quest8_Location = "Die Essenz des Eranikus (droppt von Eranikus' Schemen; "..YELLOW.."[6]"..WHITE..")"
Inst25Quest8_Note = "Der Essenzborn befindet sich gleich neben Eranikus' Schemen bei "..YELLOW.."[6]"..WHITE.."."
Inst25Quest8_Prequest = "Nein"
Inst25Quest8_Folgequest = "Nein"
--
Inst25Quest8name1 = "Gebundene Essenz des Eranikus"

--Quest 9 Alliance
Inst25Quest9 = "9. Federn von Trollen (Hexenmeister)"
Inst25Quest9_Level = "52"
Inst25Quest9_Attain = "50"
Inst25Quest9_Aim = "Bringt 6 Voodoofedern von den Trollen aus dem Versunkenen Tempel."
Inst25Quest9_Location = "Impsy (Teufelswald; "..YELLOW.."42,45"..WHITE..")"
Inst25Quest9_Note = "Hexenmeister-Quest. Je 1 Feder droppt von den Trollen, die sich auf den Balkonen über dem großen Raum mit dem Loch in der Mitte befinden."
Inst25Quest9_Prequest = "Ja, Die Bitte eines Wichtels -> Das richtige Zeug"
Inst25Quest9_Folgequest = "Nein"
Inst25Quest9PreQuest = "true"
--
Inst25Quest9name1 = "Seelenernter"
Inst25Quest9name2 = "Abysssplitter"
Inst25Quest9name3 = "Roben der Knechtschaft"

--Quest 10 Alliance
Inst25Quest10 = "10. Voodoofedern (Krieger)"
Inst25Quest10_Level = "52"
Inst25Quest10_Attain = "50"
Inst25Quest10_Aim = "Bringt die Voodoofedern der Trolle im Versunkenen Tempel zu dem gefallenen Helden der Horde."
Inst25Quest10_Location = "Gefallener Held der Horde (Sümpfe des Elends; "..YELLOW.."34,66"..WHITE..")"
Inst25Quest10_Note = "Krieger-Quest. Je 1 Feder droppt von den Trollen, die sich auf den Balkonen über dem großen Raum mit dem Loch in der Mitte befinden."
Inst25Quest10_Prequest = "Ja, Ein geplagter Geist -> Krieg den Schattenanbetern"
Inst25Quest10_Folgequest = "Nein"
Inst25Quest10PreQuest = "true"
--
Inst25Quest10name1 = "Visier des Zorns"
Inst25Quest10name2 = "Diamantenfläschchen"
Inst25Quest10name3 = "Klingenstahlschultern"

--Quest 11 Alliance
Inst25Quest11 = "11. Die Macht des Voodoos (Schamane)"
Inst25Quest11_Level = "52"
Inst25Quest11_Attain = "50"
Inst25Quest11_Aim = "Bringt Bath'rah dem Windbehüter die Voodoofedern."
Inst25Quest11_Location = "Bath'rah der Windbehüter (Alteracgebirge; "..YELLOW.."80,67"..WHITE..")"
Inst25Quest11_Note = "Schamanen-Quest. Je 1 Feder droppt von den Trollen, die sich auf den Balkonen über dem großen Raum mit dem Loch in der Mitte befinden."
Inst25Quest11_Prequest = "Ja, Geistertotem"
Inst25Quest11_Folgequest = "Nein"
Inst25Quest11PreQuest = "true"
--
Inst25Quest11name1 = "Azuritfäuste"
Inst25Quest11name2 = "Entzückter Wassergeist"
Inst25Quest11name3 = "Wildstab"

--Quest 12 Alliance
Inst25Quest12 = "12. Eine bessere Zutat (Druide)"
Inst25Quest12_Level = "52"
Inst25Quest12_Attain = "50"
Inst25Quest12_Aim = "Beschafft Euch eine Fäulnisranke von dem Wächter auf dem Grund des Versunkenen Tempels und kehrt zu Torwa Pfadfinder zurück."
Inst25Quest12_Location = "Torwa Pfadfinder (Krater von Un'Goro; "..YELLOW.."72,76"..WHITE..")"
Inst25Quest12_Note = "Druiden-Quest. Die Fäulnisranke droppt von Atal'alarion, der bei "..YELLOW.."[1]"..WHITE.." beschworen wird, indem man die Statuen in der Reihenfolge aktiviert, wie es auf der Karte steht."
Inst25Quest12_Prequest = "Ja, Torwa Pfadfinder -> Giftexperiment"
Inst25Quest12_Folgequest = "Nein"
Inst25Quest12PreQuest = "true"
--
Inst25Quest12name1 = "Ergrauter Pelz"
Inst25Quest12name2 = "Umarmung des Waldes"
Inst25Quest12name3 = "Mondschattenstock"

--Quest 13 Alliance
Inst25Quest13 = "13. Der grüne Drache (Jäger)"
Inst25Quest13_Level = "52"
Inst25Quest13_Attain = "50"
Inst25Quest13_Aim = "Bringt Morphaz' Zahn zu Ogtinc in Azshara. Ogtinc wohnt oberhalb des Kliffs, nordöstlich der Ruinen von Eldarath."
Inst25Quest13_Location = "Ogtinc (Azshara; "..YELLOW.."42,43"..WHITE..")"
Inst25Quest13_Note = "Jäger-Quest. Morphaz befindet sich bei "..YELLOW.."[5]"..WHITE.."."
Inst25Quest13_Prequest = "Ja, Der Talisman des Jägers -> Wellenjagd"
Inst25Quest13_Folgequest = "Nein"
Inst25Quest13PreQuest = "true"
--
Inst25Quest13name1 = "Jagdspeer"
Inst25Quest13name2 = "Auge eines Teufelssauriers"
Inst25Quest13name3 = "Zahn eines Teufelssauriers"

--Quest 14 Alliance
Inst25Quest14 = "14. Vernichtet Morphaz (Magier)"
Inst25Quest14_Level = "52"
Inst25Quest14_Attain = "50"
Inst25Quest14_Aim = "Beschafft den arkanen Splitter von Morphaz' Leichnam und kehrt mit ihm zu Erzmagier Xylem zurück."
Inst25Quest14_Location = "Erzmagier Xylem (Azshara; "..YELLOW.."29,40"..WHITE..")"
Inst25Quest14_Note = "Magier-Quest. Morphaz befindet sich bei "..YELLOW.."[5]"..WHITE.."."
Inst25Quest14_Prequest = "Ja, Magischer Staub -> Die Koralle der Sirenen"
Inst25Quest14_Folgequest = "Nein"
Inst25Quest14PreQuest = "true"
--
Inst25Quest14name1 = "Gletscherstachel"
Inst25Quest14name2 = "Arkankristallanhänger"
Inst25Quest14name3 = "Feuerrubin"

--Quest 15 Alliance
Inst25Quest15 = "15. Morphaz' Blut (Priester)"
Inst25Quest15_Level = "52"
Inst25Quest15_Attain = "50"
Inst25Quest15_Aim = "Tötet Morphaz im Versunkenen Tempel von Atal'Hakkar und bringt Greta Mooshuf im Teufelswald sein Blut. Der Eingang zum Versunkenen Tempel liegt in den Sümpfen des Elends."
Inst25Quest15_Location = "Ogtinc (Azshara; "..YELLOW.."42,43"..WHITE..")"
Inst25Quest15_Note = "Priester-Quest. Morphaz befindet sich bei "..YELLOW.."[5]"..WHITE..". Greta Mooshuf befindet sich im Teufelswald - Smaragdrefugium ("..YELLOW.."51,82"..WHITE..")."
Inst25Quest15_Prequest = "Ja, Cenarische Hilfe -> Sekret des Untodes"
Inst25Quest15_Folgequest = "Nein"
Inst25Quest15PreQuest = "true"
--
Inst25Quest15name1 = "Gesegnete Gebetsperlen"
Inst25Quest15name2 = "Stab des Leidens"
Inst25Quest15name3 = "Reif der Hoffnung"

--Quest 16 Alliance
Inst25Quest16 = "16. Der azurblaue Schlüssel (Schurke)"
Inst25Quest16_Level = "52"
Inst25Quest16_Attain = "50"
Inst25Quest16_Aim = "Bringt den azurblauen Schlüssel zu Lord Jorach Rabenholdt."
Inst25Quest16_Location = "Erzmagier Xylem (Azshara; "..YELLOW.."29,40"..WHITE..")"
Inst25Quest16_Note = "Schurken-Quest. Der azurblaue Schlüssel droppt von Morphaz bei "..YELLOW.."[5]"..WHITE..". Lord Jorach Rabenholdt befindet sich im Alteracgebirge - Rabenholdt ("..YELLOW.."86,79"..WHITE..")."
Inst25Quest16_Prequest = "Ja, Ein simples Anliegen -> Verschlüsselte Fragmente"
Inst25Quest16_Folgequest = "Nein"
Inst25Quest16PreQuest = "true"
--
Inst25Quest16name1 = "Ebenholzmaske"
Inst25Quest16name2 = "Leisetreter"
Inst25Quest16name3 = "Nachtsaugertuch"

--Quest 17 Alliance
Inst25Quest17 = "17. Erschaffung des Steins der Macht (Paladin)"
Inst25Quest17_Level = "52"
Inst25Quest17_Attain = "50"
Inst25Quest17_Aim = "Bringt die Voodoofedern zu Ashlam Ehrenschlag."
Inst25Quest17_Location = "Kommandant Ashlam Ehrenschlag (Westliche Pestländer - Zugwindlager; "..YELLOW.."43,85"..WHITE..")"
Inst25Quest17_Note = "Paladin-Quest. Je 1 Feder droppt von den Trollen, die sich auf den Balkonen über dem großen Raum mit dem Loch in der Mitte befinden."
Inst25Quest17_Prequest = "Ja, Gereinigte Geißelsteine"
Inst25Quest17_Folgequest = "Nein"
Inst25Quest17PreQuest = "true"
--
Inst25Quest17name1 = "Heiliger Stein der Macht"
Inst25Quest17name2 = "Lichtgeschmiedete Klinge"
Inst25Quest17name3 = "Geweihte Kugel"
Inst25Quest17name4 = "Siegelring der Ritterlichkeit"


--Quest 1 Horde
Inst25Quest1_HORDE = "1. Der Tempel von Atal'Hakkar"
Inst25Quest1_HORDE_Level = "50"
Inst25Quest1_HORDE_Attain = "38"
Inst25Quest1_HORDE_Aim = "Sammelt 20 Fetische von Hakkar und bringt sie zu Fel'Zerul in Steinard."
Inst25Quest1_HORDE_Location = "Fel'Zerul (Sümpfe des Elends - Steinard; "..YELLOW.."47,54"..WHITE..")"
Inst25Quest1_HORDE_Note = "Alle Gegner im Tempel droppen die Fetische."
Inst25Quest1_HORDE_Prequest = "Ja, Tränenteich -> Rückkehr zu Fel'Zerul"
Inst25Quest1_HORDE_Folgequest = "Nein"
Inst25Quest1PreQuest_HORDE = "true"
--
Inst25Quest1name1_HORDE = "Wächtertalisman"

--Quest 2 Horde
Inst25Quest2_HORDE = "2. Der versunkene Tempel"
Inst25Quest2_HORDE_Level = "51"
Inst25Quest2_HORDE_Attain = "46"
Inst25Quest2_HORDE_Aim = "Sucht Marvon Nietensucher in Tanaris."
Inst25Quest2_HORDE_Location = "Hexendoktor Uzer'i (Feralas; "..YELLOW.."74,43"..WHITE..")"
Inst25Quest2_HORDE_Note = "Marvon Nietensucher findet man bei "..YELLOW.."52,45"..WHITE.."."
Inst25Quest2_HORDE_Prequest = "Nein"
Inst25Quest2_HORDE_Folgequest = "Ja, Der runde Stein"

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst25Quest3_HORDE = Inst25Quest3
Inst25Quest3_HORDE_Level = Inst25Quest3_Level
Inst25Quest3_HORDE_Attain = Inst25Quest3_Attain
Inst25Quest3_HORDE_Aim = Inst25Quest3_Aim
Inst25Quest3_HORDE_Location = Inst25Quest3_Location
Inst25Quest3_HORDE_Note = Inst25Quest3_Note
Inst25Quest3_HORDE_Prequest = Inst25Quest3_Prequest
Inst25Quest3_HORDE_Folgequest = Inst25Quest3_Folgequest
Inst25Quest3FQuest_HORDE = Inst25Quest3FQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst25Quest4_HORDE = Inst25Quest4
Inst25Quest4_HORDE_Level = Inst25Quest4_Level
Inst25Quest4_HORDE_Attain = Inst25Quest4_Attain
Inst25Quest4_HORDE_Aim = Inst25Quest4_Aim
Inst25Quest4_HORDE_Location = Inst25Quest4_Location
Inst25Quest4_HORDE_Note = Inst25Quest4_Note
Inst25Quest4_HORDE_Prequest = Inst25Quest4_Prequest
Inst25Quest4_HORDE_Folgequest = Inst25Quest4_Folgequest
Inst25Quest4FQuest_HORDE = Inst25Quest4FQuest
--
Inst25Quest4name1_HORDE = Inst25Quest4name1

--Quest 5 Horde
Inst25Quest5_HORDE = "5. Schrumpftreibstoff"
Inst25Quest5_HORDE_Level = "52"
Inst25Quest5_HORDE_Attain = "50"
Inst25Quest5_HORDE_Aim = "Bringt Larion in Marschalls Zuflucht den ungeladenen Schrumpfer und 5 Proben Dunst der Atal'ai."
Inst25Quest5_HORDE_Location = "Liv Ritzelflick (Bachland; "..YELLOW.."62,38"..WHITE..")"
Inst25Quest5_HORDE_Note = "Das Vorquest 'Larion und Muigin' startet bei Larion (Krater von Un'Goro; "..YELLOW.."45,8"..WHITE.."). Man bekommt den Dunst von Tiefenlauerern, Düsterwürmern oder Brühschlammern im Tempel."
Inst25Quest5_HORDE_Prequest = "Ja, Larion und Muigin -> Marvons Werkstatt"
Inst25Quest5_HORDE_Folgequest = "Nein"
Inst25Quest5PreQuest_HORDE = "true"

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst25Quest6_HORDE = Inst25Quest6
Inst25Quest6_HORDE_Level = Inst25Quest6_Level
Inst25Quest6_HORDE_Attain = Inst25Quest6_Attain
Inst25Quest6_HORDE_Aim = Inst25Quest6_Aim
Inst25Quest6_HORDE_Location = Inst25Quest6_Location
Inst25Quest6_HORDE_Note = Inst25Quest6_Note
Inst25Quest6_HORDE_Prequest = Inst25Quest6_Prequest
Inst25Quest6_HORDE_Folgequest = Inst25Quest6_Folgequest
Inst25Quest6PreQuest_HORDE = Inst25Quest6PreQuest
--
Inst25Quest6name1_HORDE = Inst25Quest6name1
Inst25Quest6name2_HORDE = Inst25Quest6name2
Inst25Quest6name3_HORDE = Inst25Quest6name3

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst25Quest7_HORDE = Inst25Quest7
Inst25Quest7_HORDE_Level = Inst25Quest7_Level
Inst25Quest7_HORDE_Attain = Inst25Quest7_Attain
Inst25Quest7_HORDE_Aim = Inst25Quest7_Aim
Inst25Quest7_HORDE_Location = Inst25Quest7_Location
Inst25Quest7_HORDE_Note = Inst25Quest7_Note
Inst25Quest7_HORDE_Prequest = Inst25Quest7_Prequest
Inst25Quest7_HORDE_Folgequest = Inst25Quest7_Folgequest
--
Inst25Quest7name1_HORDE = Inst25Quest7name1
Inst25Quest7name2_HORDE = Inst25Quest7name2

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst25Quest8_HORDE = Inst25Quest8
Inst25Quest8_HORDE_Level = Inst25Quest8_Level
Inst25Quest8_HORDE_Attain = Inst25Quest8_Attain
Inst25Quest8_HORDE_Aim = Inst25Quest8_Aim
Inst25Quest8_HORDE_Location = Inst25Quest8_Location
Inst25Quest8_HORDE_Note = Inst25Quest8_Note
Inst25Quest8_HORDE_Prequest = Inst25Quest8_Prequest
Inst25Quest8_HORDE_Folgequest = Inst25Quest8_Folgequest
--
Inst25Quest8name1_HORDE = Inst25Quest8name1

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst25Quest9_HORDE = Inst25Quest9
Inst25Quest9_HORDE_Level = Inst25Quest9_Level
Inst25Quest9_HORDE_Attain = Inst25Quest9_Attain
Inst25Quest9_HORDE_Aim = Inst25Quest9_Aim
Inst25Quest9_HORDE_Location = Inst25Quest9_Location
Inst25Quest9_HORDE_Note = Inst25Quest9_Note
Inst25Quest9_HORDE_Prequest = Inst25Quest9_Prequest
Inst25Quest9_HORDE_Folgequest = Inst25Quest9_Folgequest
Inst25Quest9PreQuest_HORDE = Inst25Quest9PreQuest
--
Inst25Quest9name1_HORDE = Inst25Quest9name1
Inst25Quest9name2_HORDE = Inst25Quest9name2
Inst25Quest9name3_HORDE = Inst25Quest9name3

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst25Quest10_HORDE = Inst25Quest10
Inst25Quest10_HORDE_Level = Inst25Quest10_Level
Inst25Quest10_HORDE_Attain = Inst25Quest10_Attain
Inst25Quest10_HORDE_Aim = Inst25Quest10_Aim
Inst25Quest10_HORDE_Location = Inst25Quest10_Location
Inst25Quest10_HORDE_Note = Inst25Quest10_Note
Inst25Quest10_HORDE_Prequest = Inst25Quest10_Prequest
Inst25Quest10_HORDE_Folgequest = Inst25Quest10_Folgequest
Inst25Quest10PreQuest_HORDE = Inst25Quest10PreQuest
--
Inst25Quest10name1_HORDE = Inst25Quest10name1
Inst25Quest10name2_HORDE = Inst25Quest10name2
Inst25Quest10name3_HORDE = Inst25Quest10name3

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst25Quest11_HORDE = Inst25Quest11
Inst25Quest11_HORDE_Level = Inst25Quest11_Level
Inst25Quest11_HORDE_Attain = Inst25Quest11_Attain
Inst25Quest11_HORDE_Aim = Inst25Quest11_Aim
Inst25Quest11_HORDE_Location = Inst25Quest11_Location
Inst25Quest11_HORDE_Note = Inst25Quest11_Note
Inst25Quest11_HORDE_Prequest = Inst25Quest11_Prequest
Inst25Quest11_HORDE_Folgequest = Inst25Quest11_Folgequest
Inst25Quest11PreQuest_HORDE = Inst25Quest11PreQuest
--
Inst25Quest11name1_HORDE = Inst25Quest11name1
Inst25Quest11name2_HORDE = Inst25Quest11name2
Inst25Quest11name3_HORDE = Inst25Quest11name3

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst25Quest12_HORDE = Inst25Quest12
Inst25Quest12_HORDE_Level = Inst25Quest12_Level
Inst25Quest12_HORDE_Attain = Inst25Quest12_Attain
Inst25Quest12_HORDE_Aim = Inst25Quest12_Aim
Inst25Quest12_HORDE_Location = Inst25Quest12_Location
Inst25Quest12_HORDE_Note = Inst25Quest12_Note
Inst25Quest12_HORDE_Prequest = Inst25Quest12_Prequest
Inst25Quest12_HORDE_Folgequest = Inst25Quest12_Folgequest
Inst25Quest12PreQuest_HORDE = Inst25Quest12PreQuest
--
Inst25Quest12name1_HORDE = Inst25Quest12name1
Inst25Quest12name2_HORDE = Inst25Quest12name2
Inst25Quest12name3_HORDE = Inst25Quest12name3

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst25Quest13_HORDE = Inst25Quest13
Inst25Quest13_HORDE_Level = Inst25Quest13_Level
Inst25Quest13_HORDE_Attain = Inst25Quest13_Attain
Inst25Quest13_HORDE_Aim = Inst25Quest13_Aim
Inst25Quest13_HORDE_Location = Inst25Quest13_Location
Inst25Quest13_HORDE_Note = Inst25Quest13_Note
Inst25Quest13_HORDE_Prequest = Inst25Quest13_Prequest
Inst25Quest13_HORDE_Folgequest = Inst25Quest13_Folgequest
Inst25Quest13PreQuest_HORDE = Inst25Quest13PreQuest
--
Inst25Quest13name1_HORDE = Inst25Quest13name1
Inst25Quest13name2_HORDE = Inst25Quest13name2
Inst25Quest13name3_HORDE = Inst25Quest13name3

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst25Quest14_HORDE = Inst25Quest14
Inst25Quest14_HORDE_Level = Inst25Quest14_Level
Inst25Quest14_HORDE_Attain = Inst25Quest14_Attain
Inst25Quest14_HORDE_Aim = Inst25Quest14_Aim
Inst25Quest14_HORDE_Location = Inst25Quest14_Location
Inst25Quest14_HORDE_Note = Inst25Quest14_Note
Inst25Quest14_HORDE_Prequest = Inst25Quest14_Prequest
Inst25Quest14_HORDE_Folgequest = Inst25Quest14_Folgequest
Inst25Quest14PreQuest_HORDE = Inst25Quest14PreQuest
--
Inst25Quest14name1_HORDE = Inst25Quest14name1
Inst25Quest14name2_HORDE = Inst25Quest14name2
Inst25Quest14name3_HORDE = Inst25Quest14name3

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst25Quest15_HORDE = Inst25Quest15
Inst25Quest15_HORDE_Level = Inst25Quest15_Level
Inst25Quest15_HORDE_Attain = Inst25Quest15_Attain
Inst25Quest15_HORDE_Aim = Inst25Quest15_Aim
Inst25Quest15_HORDE_Location = Inst25Quest15_Location
Inst25Quest15_HORDE_Note = Inst25Quest15_Note
Inst25Quest15_HORDE_Prequest = Inst25Quest15_Prequest
Inst25Quest15_HORDE_Folgequest = Inst25Quest15_Folgequest
Inst25Quest15PreQuest_HORDE = Inst25Quest15PreQuest
--
Inst25Quest15name1_HORDE = Inst25Quest15name1
Inst25Quest15name2_HORDE = Inst25Quest15name2
Inst25Quest15name3_HORDE = Inst25Quest15name3

--Quest 16 Horde  (same as Quest 16 Alliance)
Inst25Quest16_HORDE = Inst25Quest16
Inst25Quest16_HORDE_Level = Inst25Quest16_Level
Inst25Quest16_HORDE_Attain = Inst25Quest16_Attain
Inst25Quest16_HORDE_Aim = Inst25Quest16_Aim
Inst25Quest16_HORDE_Location = Inst25Quest16_Location
Inst25Quest16_HORDE_Note = Inst25Quest16_Note
Inst25Quest16_HORDE_Prequest = Inst25Quest16_Prequest
Inst25Quest16_HORDE_Folgequest = Inst25Quest16_Folgequest
Inst25Quest16PreQuest_HORDE = Inst25Quest16PreQuest
--
Inst25Quest16name1_HORDE = Inst25Quest16name1
Inst25Quest16name2_HORDE = Inst25Quest16name2
Inst25Quest16name3_HORDE = Inst25Quest16name3

--Quest 17 Horde
Inst25Quest17_HORDE = "17. Das uralte Böse"
Inst25Quest17_HORDE_Level = "52"
Inst25Quest17_HORDE_Attain = "50"
Inst25Quest17_HORDE_Aim = "Lüftet die Geheimnisse des Versunkenen Tempels und befreit Atal'alarion. Tötet ihn und schneidet die Fäulnisranke aus seinem Fleisch. Kehrt danach zu Mehlar beim Bollwerk zurück."
Inst25Quest17_HORDE_Location = "Fürstin Sylvanas Windläufer (Unterstadt - Königliches Viertel; "..YELLOW.."59,94"..WHITE..")"
Inst25Quest17_HORDE_Note = "Paladin: Die Fäulnisranke droppt von Atal'alarion, der bei "..YELLOW.."[1]"..WHITE.." beschworen wird, indem man die Statuen in der Reihenfolge aktiviert, wie es auf der Karte steht. Mehlar befindet sich in Tirisfal - Das Bollwerk ("..YELLOW.."83,71"..WHITE..")."
Inst25Quest17_HORDE_Prequest = "Ja, Zum Bollwerk -> Die Weisheit der Bansheekönigin"
Inst25Quest17_HORDE_Folgequest = "Nein"
Inst25Quest17PreQuest_HORDE = "true"
--
Inst25Quest17name1_HORDE = "Geißelbann"



--------------- INST26 - The Temple of Ahn'Qiraj (AQ40) ---------------

Inst26Story = "Im Herzen Ahn'Qiraj liegt ein uralter Tempelkomplex. Vor Beginn der Zeitrechnung erbaut, ist es ein Monument scheußlicher Gottheiten und die gewaltige Brutstätte der Qiraji Streitmacht. Seit der Krieg der wehenden Sande vor tausend Jahren endete, waren die Zwilingsimperatoren von Ahn'Qiraj, Vek'nilash und Vek'lor, in ihrem Tempel gefangen. Die magische Barriere des bronzenen Drachen Anachronos und der Nachtelfen hielt sie in ihrem Bann. Doch nun, da das Szepter der Sandstürme wieder vereint und das Siegel gebrochen ist, steht der Weg in das Heiligtum Ahn'Qirajs erneut offen. Hinter dem krabbelnden Wahnsinn des Schwarmbaus, unter dem Tempel von Ahn'Qiraj, bereiten sich Heerscharen der Qiraji auf den Einmarsch vor. Nun gilt es, sie um jeden Preis aufzuhalten bevor sie ihre unersättlichen, insektenartigen Armeen erneut auf auf Kalimdor loslassen und ein zweiter Krieg der Silithiden beginnt!"
Inst26Caption = "Tempel von Ahn'Qiraj"
Inst26QAA = "3 Quests"
Inst26QAH = "3 Quests"

--Quest 1 Alliance
Inst26Quest1 = "1. C'Thuns Vermächnis"
Inst26Quest1_Level = "60"
Inst26Quest1_Attain = "60"
Inst26Quest1_Aim = "Bringt Caelastrasz im Tempel von Ahn'Qiraj das Auge von C'Thun."
Inst26Quest1_Location = "Auge von C'Thun (droppt von C'Thun; "..YELLOW.."[9]"..WHITE..")"
Inst26Quest1_Note = "Caelestrasz (Tempel von Ahn'Qiraj; "..YELLOW.."2'"..WHITE..")"
Inst26Quest1_Prequest = "Nein"
Inst26Quest1_Folgequest = "Ja, Der Retter von Kalimdor"
-- No Rewards for this quest

--Quest 2 Alliance
Inst26Quest2 = "2. Der Retter von Kalimdor"
Inst26Quest2_Level = "60"
Inst26Quest2_Attain = "60"
Inst26Quest2_Aim = "Bringt Anachronos in den Höhlen der Zeit das Auge von C'Thun."
Inst26Quest2_Location = "Auge von C'Thun (droppt von C'Thun; "..YELLOW.."[9]"..WHITE..")"
Inst26Quest2_Note = "Anachronos (Tanaris - Höhlen der Zeit; "..YELLOW.."65,49"..WHITE..")"
Inst26Quest2_Prequest = "Ja, C'Thuns Vermächnis"
Inst26Quest2_Folgequest = "Nein"
Inst26Quest2FQuest = "true"
--
Inst26Quest2name1 = "Amulett des gefallenen Gottes"
Inst26Quest2name2 = "Umhang des gefallenen Gottes"
Inst26Quest2name3 = "Ring des gefallenen Gottes"

--Quest 3 Alliance
Inst26Quest3 = "3. Geheimnisse der Qiraji"
Inst26Quest3_Level = "60"
Inst26Quest3_Attain = "60"
Inst26Quest3_Aim = "Bringt das uralte Qirajiartefakt zu den Drachen, die sich nahe des Tempeleingangs versteckt halten."
Inst26Quest3_Location = "Uraltes Qirajiartefakt (Zufälliger Dropp im Tempel von Ahn'Qiraj)"
Inst26Quest3_Note = "Wird bei Andorgos (Tempel von Ahn'Qiraj; "..YELLOW.."1'"..WHITE..") abgegeben."
Inst26Quest3_Prequest = "Nein"
Inst26Quest3_Folgequest = "Nein"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst26Quest1_HORDE = Inst26Quest1
Inst26Quest1_HORDE_Level = Inst26Quest1_Level
Inst26Quest1_HORDE_Attain = Inst26Quest1_Attain
Inst26Quest1_HORDE_Aim = Inst26Quest1_Aim
Inst26Quest1_HORDE_Location = Inst26Quest1_Location
Inst26Quest1_HORDE_Note = Inst26Quest1_Note
Inst26Quest1_HORDE_Prequest = Inst26Quest1_Prequest
Inst26Quest1_HORDE_Folgequest = Inst26Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst26Quest2_HORDE = Inst26Quest2
Inst26Quest2_HORDE_Level = Inst26Quest2_Level
Inst26Quest2_HORDE_Attain = Inst26Quest2_Attain
Inst26Quest2_HORDE_Aim = Inst26Quest2_Aim
Inst26Quest2_HORDE_Location = Inst26Quest2_Location
Inst26Quest2_HORDE_Note = Inst26Quest2_Note
Inst26Quest2_HORDE_Prequest = Inst26Quest2_Prequest
Inst26Quest2_HORDE_Folgequest = Inst26Quest2_Folgequest
Inst26Quest2FQuest_HORDE = Inst26Quest2FQuest
--
Inst26Quest2name1_HORDE = Inst26Quest2name1
Inst26Quest2name2_HORDE = Inst26Quest2name2
Inst26Quest2name3_HORDE = Inst26Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst26Quest3_HORDE = Inst26Quest3
Inst26Quest3_HORDE_Level = Inst26Quest3_Level
Inst26Quest3_HORDE_Attain = Inst26Quest3_Attain
Inst26Quest3_HORDE_Aim = Inst26Quest3_Aim
Inst26Quest3_HORDE_Location = Inst26Quest3_Location
Inst26Quest3_HORDE_Note = Inst26Quest3_Note
Inst26Quest3_HORDE_Prequest = Inst26Quest3_Prequest
Inst26Quest3_HORDE_Folgequest = Inst26Quest3_Folgequest
-- No Rewards for this quest



--------------- INST27 - Zul'Farrak (ZF) ---------------

Inst27Story = "Unter der brennenden Sonne von Tanaris liegt die Hauptstadt der Trolle des Sandwüterklans, die wegen ihrer Ruchlosigkeit und Grausamkeit gefürchtet sind. Die Legenden der Trolle erzählen von einem mächtigen Schwert namens Sul'thraze dem Peitscher, einer Waffe, die selbst den gefährlichsten Gegner mit Angst und Schrecken erfüllen kann. Vor langer Zeit wurde die Waffe in zwei Teile gespalten, doch es halten sich hartnäckige Gerüchte, dass sich beide Hälften irgendwo in Zul'Farrak befinden. Es gibt Berichte, dass eine Gruppe von Söldnern, die aus Gadgetzan fliehen mussten, die Stadt betraten und plötzlich dort gefangen waren. Über ihr Schicksal ist nichts weiter bekannt. Doch noch viel bedenkniserregender erscheinen die nur unter vorgehaltener Hand überlieferten Erzählungen von einer uralten Kreatur, die in den heiligen Wassern im Herzen der Stadt schlummern soll - ein mächtiger Halbgott, der jeden vernichten wird, der töricht genug ist, ihn aus seinem Schlaf zu wecken."
Inst27Caption = "Zul'Farrak"
Inst27QAA = "7 Quests"
Inst27QAH = "7 Quests"

--Quest 1 Alliance
Inst27Quest1 = "1. Trollaushärter"
Inst27Quest1_Level = "45"
Inst27Quest1_Attain = "40"
Inst27Quest1_Aim = "Bringt 20 Phiolen Trollaushärter zu Trenton Lichthammer in Gadgetzan."
Inst27Quest1_Location = "Trenton Lichthammer (Tanaris - Gadgetzan; "..YELLOW.."51,28"..WHITE..")"
Inst27Quest1_Note = "Alle Trolle droppen die Trollaushärter."
Inst27Quest1_Prequest = "Nein"
Inst27Quest1_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 2 Alliance
Inst27Quest2 = "2. Skarabäuspanzerschalen"
Inst27Quest2_Level = "45"
Inst27Quest2_Attain = "40"
Inst27Quest2_Aim = "Bringt Tran'rek in Gadgetzan 5 unbeschädigte Skarabäuspanzerschalen."
Inst27Quest2_Location = "Tran'rek (Tanaris - Gadgetzan; "..YELLOW.."51,26"..WHITE..")"
Inst27Quest2_Note = "Das Vorquest startet bei Krazek (Schlingendorntal - Beutebucht; "..YELLOW.."25,77"..WHITE..").\nAlle Skarabäuskäfer droppen die Schalen. Besonders viele Käfer befinden sich bei "..YELLOW.."[2]"..WHITE.."."
Inst27Quest2_Prequest = "Ja, Tran'rek"
Inst27Quest2_Folgequest = "Nein"
Inst27Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst27Quest3 = "3. Tiara der Tiefen"
Inst27Quest3_Level = "46"
Inst27Quest3_Attain = "40"
Inst27Quest3_Aim = "Bringt die Tiara der Tiefen zu Tabetha in den Düstermarschen."
Inst27Quest3_Location = "Tabetha (Düstermarschen; "..YELLOW.."46,57"..WHITE..")"
Inst27Quest3_Note = "Das Vorquest bekommt man von Bink (Eisenschmiede; "..YELLOW.."25,8"..WHITE..").\nWasserbeschwörerin Velratha droppt die Tiara der Tiefen bei "..YELLOW.."[6]"..WHITE.."."
Inst27Quest3_Prequest = "Ja, Tabethas Aufgabe"
Inst27Quest3_Folgequest = "Nein"
Inst27Quest3PreQuest = "true"
--
Inst27Quest3name1 = "Zauberformerrute"
Inst27Quest3name2 = "Schulterstücke aus Edelsteinschiefer"

--Quest 4 Alliance
Inst27Quest4 = "4. Nekrums Medaillon"
Inst27Quest4_Level = "47"
Inst27Quest4_Attain = "40"
Inst27Quest4_Aim = "Bringt Thadius Grimmschatten in den verwüsteten Landen Nekrums Medaillon."
Inst27Quest4_Location = "Thadius Grimmschatten (Die Verwüsteten Lande; "..YELLOW.."66,19"..WHITE..")"
Inst27Quest4_Note = "Die Questreihe startet bei Greifenmeister Krallenaxt (Hinterland - Nistgipfel; "..YELLOW.."9,44"..WHITE..").\nNekrum erscheint bei "..YELLOW.."[4]"..WHITE.." am Ende des Tempelevents."
Inst27Quest4_Prequest = "Ja, Käfige der Bleichborken -> Thadius Grimmschatten"
Inst27Quest4_Folgequest = "Ja, Der Rutengang"
Inst27Quest4PreQuest = "true"
-- No Rewards for this quest

--QUEST 5 Allianz
Inst27Quest5 = "5. Die Prophezeiung von Mosh'aru"
Inst27Quest5_Level = "47"
Inst27Quest5_Attain = "40"
Inst27Quest5_Aim = "Bringt die erste und die zweite Schrifttafel von Mosh'aru zu Yeh'kinya nach Tanaris."
Inst27Quest5_Location = "Yeh'kinya (Tanaris - Dampfdruckpier; "..YELLOW.."66,22"..WHITE..")"
Inst27Quest5_Note = "Das Vorquest erhält man beim selben NPC.\nDie Schrifttafeln droppen von Theka dem Märtyrer bei "..YELLOW.."[2]"..WHITE.." und von Wasserbeschwörerin Velratha bei "..YELLOW.."[6]"..WHITE.."."
Inst27Quest5_Prequest = "Ja, Kreischergeister"
Inst27Quest5_Folgequest = "Ja, Das uralte Ei"
Inst27Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst27Quest6 = "6. Wünschel-mato-Rute"
Inst27Quest6_Level = "47"
Inst27Quest6_Attain = "40"
Inst27Quest6_Aim = "Bringt die Wünschel-mato-Rute nach Gadgetzan zu Chefingenieur Bilgenritzel."
Inst27Quest6_Location = "Chefingenieur Bilgenritzel (Tanaris - Gadgetzan; "..YELLOW.."52,28"..WHITE..")"
Inst27Quest6_Note = "Man erhält die Rute von Unteroffizier Bly, der sich nach dem Tempelevent bei "..YELLOW.."[4]"..WHITE.." aufhält."
Inst27Quest6_Prequest = "Nein"
Inst27Quest6_Folgequest = "Nein"
--
Inst27Quest6name1 = "Ring der Maurerbruderschaft"
Inst27Quest6name2 = "Ingenieursgildenkopfstück"

--Quest 7 Alliance
Inst27Quest7 = "7. Gahz'rilla"
Inst27Quest7_Level = "50"
Inst27Quest7_Attain = "40"
Inst27Quest7_Aim = "Bringt Wizzel Kupferbolz in der schimmernden Ebene Gahz'rillas energiegeladene Schuppe."
Inst27Quest7_Location = "Wizzel Kupferbolz (Tausend Nadeln - Schimmernde Ebene; "..YELLOW.."78,77"..WHITE..")"
Inst27Quest7_Note = "Das Vorquest erhält man von Klockmort Spannersplint (Eisenschmiede - Tüftlerstadt; "..YELLOW.."68,46"..WHITE.."). Es ist allerdings nicht nötig das Vorquest abzuschließen, um dieses Quest zu erhalten.\nGahz'rilla kann man bei "..YELLOW.."[6]"..WHITE.." mit dem Schlaghammer von Zul'Farrak beschwören.\nDen Hochheiligen Schlaghammer erhält man von Qiaga der Bewahrerin (Hinterland - Der Altar von Zul; "..YELLOW.."49,70"..WHITE.."). Diesen muss man zum Altar in Jinta'Alor bei "..YELLOW.."59,77"..WHITE.." bringen, bevor man ihn in Zul'Farrak benutzen kann."
Inst27Quest7_Prequest = "Ja, Die Brüder Kupferbolz"
Inst27Quest7_Folgequest = "Nein"
Inst27Quest7PreQuest = "true"
--
Inst27Quest7name1 = "Karotte am Stiel"


--Quest 1 Horde
Inst27Quest1_HORDE = "1. Der Spinnengott"
Inst27Quest1_HORDE_Level = "45"
Inst27Quest1_HORDE_Attain = "40"
Inst27Quest1_HORDE_Aim = "Lest von der Schrifttafel des Theka, um den Namen des Spinnengottes der Bleichborken zu erfahren, und kehrt dann zu Meister Gadrin zurück."
Inst27Quest1_HORDE_Location = "Meister Gadrin (Durotar - Sen'Jin; "..YELLOW.."55,74"..WHITE..")"
Inst27Quest1_HORDE_Note = "Die Questreihe beginnt bei einer Giftflaschen, die man in den Trolldörfern im Hinterland finden kann.\nDie Schrifttaffel findet man bei "..YELLOW.."[2]"..WHITE.."."
Inst27Quest1_HORDE_Prequest = "Ja, Giftflaschen -> Konsultiert Meister Gadrin"
Inst27Quest1_HORDE_Folgequest = "Ja, Die Beschwörung von Shadra"
Inst27Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 1 Alliance)
Inst27Quest2_HORDE = "2. Trollaushärter"
Inst27Quest2_HORDE_Level = Inst27Quest1_Level
Inst27Quest2_HORDE_Attain = Inst27Quest1_Attain
Inst27Quest2_HORDE_Aim = Inst27Quest1_Aim
Inst27Quest2_HORDE_Location = Inst27Quest1_Location
Inst27Quest2_HORDE_Note = Inst27Quest1_Note
Inst27Quest2_HORDE_Prequest = Inst27Quest1_Prequest
Inst27Quest2_HORDE_Folgequest = Inst27Quest1_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 2 Alliance)
Inst27Quest3_HORDE = "3. Skarabäuspanzerschalen"
Inst27Quest3_HORDE_Level = Inst27Quest2_Level
Inst27Quest3_HORDE_Attain = Inst27Quest2_Attain
Inst27Quest3_HORDE_Aim = Inst27Quest2_Aim
Inst27Quest3_HORDE_Location = Inst27Quest2_Location
Inst27Quest3_HORDE_Note = Inst27Quest2_Note
Inst27Quest3_HORDE_Prequest = Inst27Quest2_Prequest
Inst27Quest3_HORDE_Folgequest = Inst27Quest2_Folgequest
Inst27Quest3PreQuest_HORDE = Inst27Quest2PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 3 Alliance - no prequest)
Inst27Quest4_HORDE = "4. Tiara der Tiefen"
Inst27Quest4_HORDE_Level = Inst27Quest3_Level
Inst27Quest4_HORDE_Attain = Inst27Quest3_Attain
Inst27Quest4_HORDE_Aim = Inst27Quest3_Aim
Inst27Quest4_HORDE_Location = Inst27Quest3_Location
Inst27Quest4_HORDE_Note = "Wasserbeschwörerin Velratha droppt die Tiara der Tiefen bei "..YELLOW.."[6]"..WHITE.."."
Inst27Quest4_HORDE_Prequest = "Nein"
Inst27Quest4_HORDE_Folgequest = Inst27Quest3_Folgequest
--
Inst27Quest4name1_HORDE = Inst27Quest3name1
Inst27Quest4name2_HORDE = Inst27Quest3name2

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst27Quest5_HORDE = Inst27Quest5
Inst27Quest5_HORDE_Level = Inst27Quest5_Level
Inst27Quest5_HORDE_Attain = Inst27Quest5_Attain
Inst27Quest5_HORDE_Aim = Inst27Quest5_Aim
Inst27Quest5_HORDE_Location = Inst27Quest5_Location
Inst27Quest5_HORDE_Note = Inst27Quest5_Note
Inst27Quest5_HORDE_Prequest = Inst27Quest5_Prequest
Inst27Quest5_HORDE_Folgequest = Inst27Quest5_Folgequest
Inst27Quest5PreQuest_HORDE = Inst27Quest5Prequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst27Quest6_HORDE = Inst27Quest6
Inst27Quest6_HORDE_Level = Inst27Quest6_Level
Inst27Quest6_HORDE_Attain = Inst27Quest6_Attain
Inst27Quest6_HORDE_Aim = Inst27Quest6_Aim
Inst27Quest6_HORDE_Location = Inst27Quest6_Location
Inst27Quest6_HORDE_Note = Inst27Quest6_Note
Inst27Quest6_HORDE_Prequest = Inst27Quest6_Prequest
Inst27Quest6_HORDE_Folgequest = Inst27Quest6_Folgequest
--
Inst27Quest6name1_HORDE = Inst27Quest6name1
Inst27Quest6name2_HORDE = Inst27Quest6name2

--Quest 7 Horde  (same as Quest 7 Alliance - no prequest)
Inst27Quest7_HORDE = Inst27Quest7
Inst27Quest7_HORDE_Level = Inst27Quest7_Level
Inst27Quest7_HORDE_Attain = Inst27Quest7_Attain
Inst27Quest7_HORDE_Aim = Inst27Quest7_Aim
Inst27Quest7_HORDE_Location = Inst27Quest7_Location
Inst27Quest7_HORDE_Note = "Gahz'rilla kann man bei "..YELLOW.."[6]"..WHITE.." mit dem Schlaghammer von Zul'Farrak beschwören.\nDen Hochheiligen Schlaghammer erhält man von Qiaga der Bewahrerin (Hinterland - Der Altar von Zul; "..YELLOW.."49,70"..WHITE.."). Diesen muss man zum Altar in Jinta'Alor bei "..YELLOW.."59,77"..WHITE.." bringen, bevor man ihn in Zul'Farrak benutzen kann."
Inst27Quest7_HORDE_Prequest = "Nein"
Inst27Quest7_HORDE_Folgequest = Inst27Quest7_Folgequest
--
Inst27Quest7name1_HORDE = Inst27Quest7name1



--------------- INST28 - Zul'Gurub (ZG) ---------------

Inst28Story = {
  ["Page1"] = "Vor mehr als tausend Jahren wurde das mächtige Reich der Gurubashi von einem gewaltigen Bürgerkrieg in Stücke gerissen. Eine einflussreiche Gruppe trollischer Priester, die als die Atal'ai bekannt waren, beschworen damals den Avatar des uralten und fürchterlichen Blutgottes, Hakkar, der Seelenschinder. Obwohl die Priester besiegt und ins Exil geschickt wurden, brach das ehemals glorreiche Reich der Trolle zusammen. Die Reise ins Exil führte die verbannten Priester weit nach Norden, bis in die Sümpfe des Elends, wo sie ihrem Gott Hakkar einen Tempel errichteten, um seine Rückkehr in die Welt der Sterblichen vorzubereiten.",
  ["Page2"] = "Im Lauf der Zeit erkannten die Atal'ai, dass Hakkars physische Gestalt nur in Zul'Gurub, der uralten Tempelstadt, der Hauptstadt des Reichs der Gurubashi, beschworen werden konnte. Erschreckenderweise hatten die Priester vor Kurzem einen Durchbruch bei ihren Bemühungen, Hakkar herbeizurufen - Berichten zufolge thront der Seelenschinder erneut über den lang verlorenen Ruinen der Gurubaschi.\n\nUm den Blutgott zu stoppen, haben sich die Trolle des Landes zusammengeschlossen und eine Gruppe trollischer Hohepriester in die uralte Stadt entsandt, jeder Priester ein mächtiger Diener der ursprünglichen Götter - Fledermaus, Panther, Tiger, Spinne und Schlange. Doch trotz ihrer Mühen wurden auch die Hohepriester von Hakkar verführt. Nun nähren die Hohepriester und die Aspekte ihrer ursprünglichen Götter die ohnehin schon überwältigende Kraft des Seelenschinders. Abenteurer, die mutig genug sind, sich in die unheilsvollen Ruinen vorzuwagen, müssen sich zuerst den Hohepriestern stellen, wenn sie auch nur die geringste Chance gegen den mächtigen Blutgott selbst haben wollen.",
  ["MaxPages"] = "2",
};
Inst28Caption = "Zul'Gurub"
Inst28QAA = "4 Quests"
Inst28QAH = "4 Quests"

--Quest 1 Alliance
Inst28Quest1 = "1. Die Schädelsammlung"
Inst28Quest1_Level = "60"
Inst28Quest1_Attain = "58"
Inst28Quest1_Aim = "Reiht die Köpfe der 5 Kanalisierer auf der heiligen Kordel aneinander. Bringt dann die Trollschädelsammlung zu Exzhal auf der Insel Yojamba."
Inst28Quest1_Location = "Exzhal (Schlingendorntal - Insel Yojamba; "..YELLOW.."15,15"..WHITE..")"
Inst28Quest1_Note = "Vergesst nicht alle Priester zu plündern."
Inst28Quest1_Prequest = "Nein"
Inst28Quest1_Folgequest = "Nein"
--
Inst28Quest1name1 = "Gürtel mit Schrumpfköpfen"
Inst28Quest1name2 = "Gürtel mit Schrumpelköpfen"
Inst28Quest1name3 = "Gürtel mit konservierten Köpfen"
Inst28Quest1name4 = "Gürtel mit winzigen Köpfen"

--Quest 2 Alliance
Inst28Quest2 = "2. Das Herz von Hakkar"
Inst28Quest2_Level = "60"
Inst28Quest2_Attain = "58"
Inst28Quest2_Aim = "Bringt das Herz von Hakkar zu Molthor auf die Insel Yojamba."
Inst28Quest2_Location = "Herz von Hakkar (droppt von Hakkar; "..YELLOW.."[11]"..WHITE..")"
Inst28Quest2_Note = "Molthor (Schlingendorntal - Insel Yojamba; "..YELLOW.."15,15"..WHITE..")"
Inst28Quest2_Prequest = "Nein"
Inst28Quest2_Folgequest = "Nein"
--
Inst28Quest2name1 = "Zandalarianisches Heldenabzeichen"
Inst28Quest2name2 = "Zandalarianisches Heldenamulett"
Inst28Quest2name3 = "Zandalarianisches Heldenmedallion"

--Quest 3 Alliance
Inst28Quest3 = "3. Nats Maßband"
Inst28Quest3_Level = "60"
Inst28Quest3_Attain = "59"
Inst28Quest3_Aim = "Bringt Nats Maßband zu Nat Pagle in den Düstermarschen zurück."
Inst28Quest3_Location = "Ramponierter Ausrüstungskasten (Zul'Gurub - Nordöstlich am Wasser von Hakkars Insel)"
Inst28Quest3_Note = "Nat Pagle befindet sich in den Düstermarschen ("..YELLOW.."59,60"..WHITE.."). Wenn man das Quest abgegeben hat, kann man Matschstinkerköder von Nat Pagle kaufen, die man benötigt, um Gahz'ranka in Zul'Gurub zu beschwören."
Inst28Quest3_Prequest = "Nein"
Inst28Quest3_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Alliance
Inst28Quest4 = "4. Das perfekte Gift"
Inst28Quest4_Level = "60"
Inst28Quest4_Attain = "60"
Inst28Quest4_Aim = "Dirk Donnerholz in der Burg Cenarius will, dass Ihr ihm Venoxis' Giftbeutel und Kurinnaxx' Giftbeutel bringt."
Inst28Quest4_Location = "Dirk Donnerholz (Silithus - Burg Cenarius; "..YELLOW.."52,39"..WHITE..")"
Inst28Quest4_Note = "Venoxis' Giftbeutel droppt von Hohepriester Venoxis in "..YELLOW.."Zul'Gurub"..WHITE..". Kurinnaxx' Giftbeutel droppt in den "..YELLOW.."Ruinen von Ahn'Qiraj"..WHITE.." bei "..YELLOW.."[1]"..WHITE.."."
Inst28Quest4_Prequest = "Nein"
Inst28Quest4_Folgequest = "Nein"
--
Inst28Quest4name1 = "Rabenholdtschnitzler"
Inst28Quest4name2 = "Messerritzels Messer"
Inst28Quest4name3 = "Donnerholzschüreisen"
Inst28Quest4name4 = "Schicksalsbringer"
Inst28Quest4name5 = "Fahrads selbstladende Repetierarmbrust"
Inst28Quest4name6 = "Simones Hammer der Kultivierung"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst28Quest1_HORDE = Inst28Quest1
Inst28Quest1_HORDE_Level = Inst28Quest1_Level
Inst28Quest1_HORDE_Attain = Inst28Quest1_Attain
Inst28Quest1_HORDE_Aim = Inst28Quest1_Aim
Inst28Quest1_HORDE_Location = Inst28Quest1_Location
Inst28Quest1_HORDE_Note = Inst28Quest1_Note
Inst28Quest1_HORDE_Prequest = Inst28Quest1_Prequest
Inst28Quest1_HORDE_Folgequest = Inst28Quest1_Folgequest
--
Inst28Quest1name1_HORDE = Inst28Quest1name1
Inst28Quest1name2_HORDE = Inst28Quest1name2
Inst28Quest1name3_HORDE = Inst28Quest1name3
Inst28Quest1name4_HORDE = Inst28Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst28Quest2_HORDE = Inst28Quest2
Inst28Quest2_HORDE_Level = Inst28Quest2_Level
Inst28Quest2_HORDE_Attain = Inst28Quest2_Attain
Inst28Quest2_HORDE_Aim = Inst28Quest2_Aim
Inst28Quest2_HORDE_Location = Inst28Quest2_Location
Inst28Quest2_HORDE_Note = Inst28Quest2_Note
Inst28Quest2_HORDE_Prequest = Inst28Quest2_Prequest
Inst28Quest2_HORDE_Folgequest = Inst28Quest2_Folgequest
--
Inst28Quest2name1_HORDE = Inst28Quest2name1
Inst28Quest2name2_HORDE = Inst28Quest2name2
Inst28Quest2name3_HORDE = Inst28Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst28Quest3_HORDE = Inst28Quest3
Inst28Quest3_HORDE_Level = Inst28Quest3_Level
Inst28Quest3_HORDE_Attain = Inst28Quest3_Attain
Inst28Quest3_HORDE_Aim = Inst28Quest3_Aim
Inst28Quest3_HORDE_Location = Inst28Quest3_Location
Inst28Quest3_HORDE_Note = Inst28Quest3_Note
Inst28Quest3_HORDE_Prequest = Inst28Quest3_Prequest
Inst28Quest3_HORDE_Folgequest = Inst28Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst28Quest4_HORDE = Inst28Quest4
Inst28Quest4_HORDE_Level = Inst28Quest4_Level
Inst28Quest4_HORDE_Attain = Inst28Quest4_Attain
Inst28Quest4_HORDE_Aim = Inst28Quest4_Aim
Inst28Quest4_HORDE_Location = Inst28Quest4_Location
Inst28Quest4_HORDE_Note = Inst28Quest4_Note
Inst28Quest4_HORDE_Prequest = Inst28Quest4_Prequest
Inst28Quest4_HORDE_Folgequest = Inst28Quest4_Folgequest
--
Inst28Quest4name1_HORDE = Inst28Quest4name1
Inst28Quest4name2_HORDE = Inst28Quest4name2
Inst28Quest4name3_HORDE = Inst28Quest4name3
Inst28Quest4name4_HORDE = Inst28Quest4name4
Inst28Quest4name5_HORDE = Inst28Quest4name5
Inst28Quest4name6_HORDE = Inst28Quest4name6



--------------- INST29 - Gnomeregan (Gnomer) ---------------

Inst29Story = "Gnomeregan war seit ungezählten Generationen die Hauptstadt der Gnome, eine Stadt, wie es sie davor noch nie in Azeroth gegeben hatte, wo selbst die kühnsten Träume der gnomischen Tüftler wahr wurden. Die Wellen der jüngsten Invasion der mutierten Troggs in Dun Morogh erreichten schließlich auch die Wunderwelt der Gnome. In einem Akt der Verzweiflung befahl Hochtüftler Mekkadrill, die Tanks für den radioaktiven Abfall der Stadt nach Gnomeregan zu entleeren und so die Troggs zu vernichten. Viele Gnome brachten sich vor den radioaktiven Dämpfen und dem Giftmüll in Sicherheit und warteten darauf, dass die Troggs entweder starben oder flohen. Doch statt zu sterben oder zu fliehen, verwandelten sich die mutierten, brutalen Troggs in mutierte, brutale und radioaktive Troggs, die nun obendrein noch wütender waren als zuvor (sofern das überhaupt möglich war). Die Gnome, die nicht von der Radioaktivität oder den Toxinen getötet wurden, mussten fliehen und in der nahegelegenen Stadt Eisenschmiede Schutz suchen. Dort ist Hochtüftler Mekkadrill momentan dabei, tapfere Helden für die Zurückeroberung der gnomischen Hauptstadt zu suchen. Gerüchten zufolge soll Mekkadrills ehemaliger Berater, der Robogenieur Thermadraht, sein Volk verraten haben, indem er die Invasion geschehen lies. Der wahnsinnige Gnom ist in Gnomeregan zurückgeblieben, wo der Technofürst nun neue sinistre Pläne austüftelt."
Inst29Caption = "Gnomeregan"
Inst29QAA = "10 Quests"
Inst29QAH = "5 Quests"

--Quest 1 Alliance
Inst29Quest1 = "1. Rettet Techbots Hirn!"
Inst29Quest1_Level = "26"
Inst29Quest1_Attain = "20"
Inst29Quest1_Aim = "Bringt Techbots Speicherkern zu Tüftlermeister Oberfunks nach Eisenschmiede."
Inst29Quest1_Location = "Tüftlermeister Oberfunks (Eisenschmiede - Tüftlerstadt; "..YELLOW.."69,50"..WHITE..")"
Inst29Quest1_Note = "Das Vorquest erhält man bei Bruder Sarno (Sturmwind - Kathedralenplatz; "..YELLOW.."40,30"..WHITE..").\nTechbot findet man außerhalb der Instanz nahe dem Hintereingang bei "..YELLOW.."[4] auf der Eingangskarte"..WHITE.."."
Inst29Quest1_Prequest = "Ja, Tüftlermeister Oberfunks"
Inst29Quest1_Folgequest = "Nein"
Inst29Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst29Quest2 = "2. Gnogaine"
Inst29Quest2_Level = "27"
Inst29Quest2_Attain = "20"
Inst29Quest2_Aim = "Sammelt mit der leeren bleiernen Sammelphiole radioaktive Ablagerungen bestrahlter Eindringlinge oder Plünderer. Sobald sie voll ist, bringt Ihr sie zu Ozzie Wechselvolt nach Kharanos zurück."
Inst29Quest2_Location = "Ozzie Wechselvolt (Dun Morogh - Kharanos; "..YELLOW.."45,49"..WHITE..")"
Inst29Quest2_Note = "Das Vorquest bekommt man von Gnoarn (Eisenschmiede - Tüftlerstadt; "..YELLOW.."69,50"..WHITE..").\nUm die Ablagerungen zu bekommen muss man die Phiole auf "..RED.."lebende"..WHITE.." bestrahlte Eindringlinge oder bestrahlte Plünderer anwenden."
Inst29Quest2_Prequest = "Ja, Der Tag danach"
Inst29Quest2_Folgequest = "Ja, Das einzige Heilmittel ist mehr grünes Leuchten"
Inst29Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst29Quest3 = "3. Das einzige Heilmittel ist mehr grünes Leuchten"
Inst29Quest3_Level = "30"
Inst29Quest3_Attain = "23"
Inst29Quest3_Aim = "Reist nach Gnomeregan und bringt etwas von der hoch konzentrierten radioaktiven Ablagerung zurück. Seid gewarnt, die Ablagerung ist instabil und wird ziemlich schnell zerfallen.\nOzzie wird außerdem Eure schwere bleierne Phiole benötigen, nachdem die Aufgabe erledigt ist."
Inst29Quest3_Location = "Ozzie Wechselvolt (Dun Morogh - Kharanos; "..YELLOW.."45,49"..WHITE..")"
Inst29Quest3_Note = "Um die Ablagerungen zu bekommen muss man die Phiole auf "..RED.."lebende"..WHITE.." bestrahlte Brühschleimer oder Schrecken anwenden."
Inst29Quest3_Prequest = "Ja, Gnogaine"
Inst29Quest3_Folgequest = "Nein"
Inst29Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst29Quest4 = "4. Gyrobohrmatische Exkavation"
Inst29Quest4_Level = "30"
Inst29Quest4_Attain = "20"
Inst29Quest4_Aim = "Bringt 24 robomechanische Innereien zu Shoni nach Sturmwind."
Inst29Quest4_Location = "Shoni die Schtille (Sturmwind - Zwergendistrikt; "..YELLOW.."55,12"..WHITE..")"
Inst29Quest4_Note = "Alle Roboter können die robomechanischen Innereien droppen."
Inst29Quest4_Prequest = "Nein"
Inst29Quest4_Folgequest = "Nein"
--
Inst29Quest4name1 = "Shonis Entwaffnungswerkzeug"
Inst29Quest4name2 = "Fäustlinge der Entschlossenheit"

--Quest 5 Alliance
Inst29Quest5 = "5. Grundlegende Artifixe"
Inst29Quest5_Level = "30"
Inst29Quest5_Attain = "24"
Inst29Quest5_Aim = "Bringt Klockmort Spannsplint in Eisenschmiede 12 grundlegende Artifixe."
Inst29Quest5_Location = "Klockmort Spannsplint (Eisenschmiede - Tüftlerstadt; "..YELLOW.."68,46"..WHITE..")"
Inst29Quest5_Note = "Das Vorquest bekommt man von Mathiel (Darnassus - Terrasse der Krieger; "..YELLOW.."59,45"..WHITE.."). Es ist jedoch nicht nötig das Vorquest abzuschließen, um dieses Quest zu erhalten.\nDie Grundlegenden Artifixe droppen von Maschinen, die in der ganzen Instanz verteilt sind."
Inst29Quest5_Prequest = "Ja, Klockmorts Grundlagen"
Inst29Quest5_Folgequest = "Nein"
Inst29Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst29Quest6 = "6. Datenrettung"
Inst29Quest6_Level = "30"
Inst29Quest6_Attain = "25"
Inst29Quest6_Aim = "Bringt Mechanikermeister Gussmuff in Eisenschmiede eine Prismalochkarte."
Inst29Quest6_Location = "Mechanikermeister Gussmuff (Eisenschmiede - Tüftlerstadt; "..YELLOW.."69,48"..WHITE..")"
Inst29Quest6_Note = "Das Vorquest bekommt man von Gaxim Rostknirsch (Steinkrallengebirge; "..YELLOW.."59,67"..WHITE.."). Es ist jedoch nicht nötig das Vorquest abzuschließen, um dieses Quest zu erhalten.\nDie weiße Lochkarte ist ein zufälliger Dropp. Der erste Terminal befindet sich außerhalb der Instanz nahe des Hintereingangs bei "..YELLOW.."[3] auf der Eingangskarte"..WHITE..". Der 3005-B befindet sich bei "..YELLOW.."[3]"..WHITE..", der 3005-C bei "..YELLOW.."[5]"..WHITE.." und der 3005-D bei "..YELLOW.."[6]"..WHITE.."."
Inst29Quest6_Prequest = "Ja, Gussmuffs Auftrag"
Inst29Quest6_Folgequest = "Nein"
Inst29Quest6PreQuest = "true"
--
Inst29Quest6name1 = "Schlossercape"
Inst29Quest6name2 = "Mechanikerrohrhammer"

--Quest 7 Alliance
Inst29Quest7 = "7. Eine schöne Bescherung"
Inst29Quest7_Level = "30"
Inst29Quest7_Attain = "22"
Inst29Quest7_Aim = "Begleitet Kernobee zur Uhrwerkgasse und meldet Euch dann wieder bei Scooty in Beutebucht."
Inst29Quest7_Location = "Kernobee (Gnomeregan; "..YELLOW.."[3]"..WHITE..")"
Inst29Quest7_Note = "Eskort-Quest! Scooty findet man im Schlingendorntal - Beutebucht ("..YELLOW.."27,77"..WHITE..")."
Inst29Quest7_Prequest = "Nein"
Inst29Quest7_Folgequest = "Nein"
--
Inst29Quest7name1 = "Feuergeschmiedete Armschienen"
Inst29Quest7name2 = "Feenflügelmantel"

--Quest 8 Alliance
Inst29Quest8 = "8. Der große Verrat"
Inst29Quest8_Level = "35"
Inst29Quest8_Attain = "25"
Inst29Quest8_Aim = "Reist nach Gnomeregan und tötet Robogenieur Thermadraht. Kehrt zu Hochtüftler Mekkadrill zurück, wenn der Auftrag ausgeführt ist."
Inst29Quest8_Location = "Hochtüftler Mekkadrill (Eisenschmiede - Tüftlerstadt; "..YELLOW.."68,48"..WHITE..")"
Inst29Quest8_Note = "Thermadraht findet man bei "..YELLOW.."[8]"..WHITE..". Er ist der Endgegner von Gnomeregan.\nWährend des Kampfes müssen die Säulen an der Seite deaktiviert werden, indem man die Knöpfe an der Seite betätigt."
Inst29Quest8_Prequest = "Nein"
Inst29Quest8_Folgequest = "Nein"
--
Inst29Quest8name1 = "Civinadroben"
Inst29Quest8name2 = "Latzhose des Stolperläufers"
Inst29Quest8name3 = "Zweifach verstärkte Gamaschen"

--Quest 9 Alliance
Inst29Quest9 = "9. Schmutzverkrusteter Ring"
Inst29Quest9_Level = "34"
Inst29Quest9_Attain = "28"
Inst29Quest9_Aim = "Findet einen Weg, den schmutzverkrusteten Ring zu säubern."
Inst29Quest9_Location = "Schmutzverkrusteter Ring (Zufälliger Dropp in Gnomeregan)"
Inst29Quest9_Note = "Der Ring kann mit dem Funkelmat 5200 bei "..YELLOW.."[2]"..WHITE.." gereinigt werden."
Inst29Quest9_Prequest = "Nein"
Inst29Quest9_Folgequest = "Ja, Die Rückkehr des Rings"
-- No Rewards for this quest

--Quest 10 Alliance
Inst29Quest10 = "10. Die Rückkehr des Rings"
Inst29Quest10_Level = "34"
Inst29Quest10_Attain = "28"
Inst29Quest10_Aim = "Ihr könnt den Ring entweder behalten oder die Person finden, die für die Prägung und Gravuren auf der Innenseite des Rings verantwortlich ist."
Inst29Quest10_Location = "Blitzender Goldring (erhällt man beim Quest Schmutzverkrusteter Ring)"
Inst29Quest10_Note = "Kann bei Talvash del Kissel (Eisenschmiede - Mystikerviertel; "..YELLOW.."36,3"..WHITE..") abgegeben werden. Das Folgequest, um den Ring zu verbessern, ist optional."
Inst29Quest10_Prequest = "Ja, Schmutzverkrusteter Ring"
Inst29Quest10_Folgequest = "Ja, Gnomenverbesserungen"
Inst29Quest10FQuest = "true"
--
Inst29Quest10name1 = "Blitzender Goldring"


--Quest 1 Horde
Inst29Quest1_HORDE = "1. Gnomer-weeeeg!"
Inst29Quest1_HORDE_Level = "35"
Inst29Quest1_HORDE_Attain = "25"
Inst29Quest1_HORDE_Aim = "Wartet, bis Scooty den Goblintransponder kalibriert hat."
Inst29Quest1_HORDE_Location = "Scooty (Schlingendorntal - Beutebucht; "..YELLOW.."27,77"..WHITE..")"
Inst29Quest1_HORDE_Note = "Das Vorquest erhält man von Sovik (Orgrimmar - Tal der Ehre; "..YELLOW.."75,25"..WHITE..").\nWenn man diesen Quest abgeschloßen hat kann man den Teleporter in Beutebucht benutzen."
Inst29Quest1_HORDE_Prequest = "Ja, Chefingenieur Scooty"
Inst29Quest1_HORDE_Folgequest = "Nein"
Inst29Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 7 Alliance)
Inst29Quest2_HORDE = "2. Eine schöne Bescherung"
Inst29Quest2_HORDE_Level = Inst29Quest7_Level
Inst29Quest2_HORDE_Attain = Inst29Quest7_Attain
Inst29Quest2_HORDE_Aim = Inst29Quest7_Aim
Inst29Quest2_HORDE_Location = Inst29Quest7_Location
Inst29Quest2_HORDE_Note = Inst29Quest7_Note
Inst29Quest2_HORDE_Prequest = Inst29Quest7_Prequest
Inst29Quest2_HORDE_Folgequest = Inst29Quest7_Folgequest
--
Inst29Quest2name1_HORDE = Inst29Quest7name1
Inst29Quest2name2_HORDE = Inst29Quest7name2

--Quest 3 Horde
Inst29Quest3_HORDE = "3. Maschinenkriege"
Inst29Quest3_HORDE_Level = "35"
Inst29Quest3_HORDE_Attain = "25"
Inst29Quest3_HORDE_Aim = "Besorgt die Maschinenblaupausen und Thermadrahts Safekombination aus Gnomeregan und bringt sie zu Nogg nach Orgrimmar."
Inst29Quest3_HORDE_Location = "Nogg (Orgrimmar - Tal der Ehre; "..YELLOW.."75,25"..WHITE..")"
Inst29Quest3_HORDE_Note = "Thermadraht findet man bei "..YELLOW.."[8]"..WHITE..". Er ist der Endgegner von Gnomeregan.\nWährend des Kampfes müssen die Säulen an der Seite deaktiviert werden, indem man die Knöpfe an der Seite betätigt."
Inst29Quest3_HORDE_Prequest = "Nein"
Inst29Quest3_HORDE_Folgequest = "Nein"
--
Inst29Quest3name1_HORDE = "Civinadroben"
Inst29Quest3name2_HORDE = "Latzhose des Stolperläufers"
Inst29Quest3name3_HORDE = "Zweifach verstärkte Gamaschen"

--Quest 4 Horde  (same as Quest 9 Alliance)
Inst29Quest4_HORDE = "4. Schmutzverkrusteter Ring"
Inst29Quest4_HORDE_Level = Inst29Quest9_Level
Inst29Quest4_HORDE_Attain = Inst29Quest9_Attain
Inst29Quest4_HORDE_Aim = Inst29Quest9_Aim
Inst29Quest4_HORDE_Location = Inst29Quest9_Location
Inst29Quest4_HORDE_Note = Inst29Quest9_Note
Inst29Quest4_HORDE_Prequest = Inst29Quest9_Prequest
Inst29Quest4_HORDE_Folgequest = Inst29Quest9_Folgequest
-- No Rewards for this quest

--Quest 5 Horde
Inst29Quest5_HORDE = "5. Die Rückkehr des Rings"
Inst29Quest5_HORDE_Level = "34"
Inst29Quest5_HORDE_Attain = "28"
Inst29Quest5_HORDE_Aim = "Ihr könnt den Ring entweder behalten oder die Person finden, die für die Prägung und Gravuren auf der Innenseite des Rings verantwortlich ist."
Inst29Quest5_HORDE_Location = "Blitzender Goldring (erhällt man beim Quest Schmutzverkrusteter Ring)"
Inst29Quest5_HORDE_Note = "Kann bei Nogg (Orgrimmar - The Valley of Honor; "..YELLOW.."75,25"..WHITE..") abgegeben werden. Das Folgequest, um den Ring zu verbessern, ist optional."
Inst29Quest5_HORDE_Prequest = "Ja, Schmutzverkrusteter Ring"
Inst29Quest5_HORDE_Folgequest = "Nein"
Inst29Quest5FQuest = "true"
--
Inst29Quest5name1_HORDE = "Blitzender Goldring"



--------------- INST37 - HFC: Ramparts (Ramp) ---------------

Inst37Story = {
  ["Page1"] = "In der verwüsteten Weite der Scherbenwelt, tief im Herzen der Höllenfeuerhalbinsel, steht die Zitadelle des Höllenfeuers: Eine fast uneinnehmbare Festung, die der Horde als Ausgangspunkt für ihre Feldzüge während des Ersten und des Zweiten Krieges diente. Lange Jahre schien es, als sei diese gigantische Festung verlassen...\n \nBis vor kurzem.\n \nObwohl der rücksichtslose Ner'zhul große Bereiche Draenors zerschmetterte, blieb die Zitadelle des Höllenfeuers intakt - und wird nun von marodierenden Banden roter, wütender Höllenorcs bewohnt. Obwohl die Anwesenheit dieser neuen, wilden Brut an sich bereits ein Rätsel darstellt, ist es noch weitaus beunruhigender, dass die Anzahl der Höllenorcs stetig zu wachsen scheint.\n \nTrotz Thralls und Grom Höllschreis erfolgreicher Bemühungen, der Korruption der Horde Einhalt zu gebieten, indem sie Mannoroth töteten, scheint es, als hätten die barbarischen Orcs der Zitadelle des Höllenfeuers eine neue Quelle entdeckt, die ihre primitive Gier nach Blut stillt.",
  ["Page2"] = "Wessen Befehl diese Orcs unterstehen, ist nicht bekannt, allerdings überwiegt die Meinung, dass sie nicht für die Brennende Legion arbeiten.\n \nDie vielleicht beunruhigendste Nachricht aus der Scherbenwelt sind allerdings die Berichte über erschütternde, wilde Schreie aus den Tiefen unterhalb der Zitadelle. Möglicherweise stehen diese unheimlichen Ausbrüche in Zusammenhang mit den Höllenorcs und ihrer wachsenden Zahl. Bedauerlicherweise müssen diese Fragen unbeantwortet bleiben.\n \nZumindest vorerst.",
  ["MaxPages"] = "2",
};
Inst37Caption = "HZ: Höllenfeuerbollwerk"
Inst37QAA = "3 Quests"
Inst37QAH = "3 Quests"
Inst37General = {
    {
    "Wachhabender Gargolmar",
    "Er hat 2 Adds. Beide sind kontrollierbar und sollten kontrolliert oder getötet werden, bevor Gargolmar selbst getötet wird. Gargolmar selbst richtet wenig Nahkampfschaden an.",
    RED .. "Tödliche Wunde:" .. WHITE .. " Gargolmar gibt dem Maintank manchmal einen stapelbaren Debuff, der erhaltene Heilung 10 % pro Stack reduziert. Offtanking ist nicht nötig, weil der Debuff normalerweise nicht über 40 % stackt (er stirbt zu schnell).",
    },

    {
    "Omor der Narbenlose",
    "Omor hat ein starke magischen Fernkampfangriff, aber schwache Nahkampfangriffe. Er benutzt seine Magie nur, wenn der Aggrohalter nicht in Nahkampfreichweite ist.",
    RED .. "Hund beschwören" .. WHITE .. ": Alle paar Sekunden beschwört Omor einen 'Dämonischen Hund'. Diese Hunde schlagen hart zu und saugen Mana (gerne vom Heiler), haben aber wenig HP. Sie sollten sofort getötet werden.",
    },

    {
    "Vazruden der Herold und Nazan",
    "Vazruden landet, wenn die 2 Wachen vor der Plattform getötet werden. Wenn Varzurden bei 20 % Leben ist, landet Nazan und greift an. Nazan ist sehr stark und der schwierigste Kampf im Höllenfeuerbollwerk.",
    "Vazruden(): Nichts\n" .. RED .. "Nazan(Drachenatem)" .. WHITE .. ": Nazan verursacht starken Feuerschaden in dem Bereich vor ihm. Der Tank muss den Drachen von der Gruppe wegdrehen.\n" .. RED .. "Nazan(Flammenwerfen)" .. WHITE .. ": Nazan wirft Feuerbälle auf die Spieler, die einigen Schaden (~2k) anrichten und den Boden verbrennen (~600 Feuerschaden/sec). Jeder muss aus dem Feuer laufen!",
    },
};

--Quest 1 Alliance
Inst37Quest1 = "1. Die Bollwerke schwächen"
Inst37Quest1_Level = "62"
Inst37Quest1_Attain = "59"
Inst37Quest1_Aim = "Tötet den Wachhabenden Gargolmar, Omor den Narbenlosen und Nazan, den Drachen. Bringt Gargolmars Hand, Omors Huf und Nazans Kopf zu Gunny in der Ehrenfeste auf der Höllenfeuerhalbinsel."
Inst37Quest1_Location = "Leutnant Chadwick (Höllenfeuerhalbinsel - Ehrenfeste; "..YELLOW.."57,66"..WHITE..")"
Inst37Quest1_Note = "Gargolmar befindet sich bei "..YELLOW.."[1]"..WHITE..", Omor ist bei "..YELLOW.."[2]"..WHITE..", und Nazan ist bei "..YELLOW.."[3]"..WHITE..". Gunny befindet sich bei (Höllenfeuerhalbinsel - Ehrenfeste; "..YELLOW.."56,67"..WHITE.."). \n\nUm diese Quest zu erhalten, muss Schwarze Magie absolviert sein, welche mit Den Feind kennen von Truppenkommandant Danath Trollbann (Höllenfeuerhalbinsel - Ehrenfeste; "..YELLOW.."57,67"..WHITE..") startet."
Inst37Quest1_Prequest = "Ja, Den Feind kennen -> Schwarze Magie"
Inst37Quest1_Folgequest = "Ja, Im Herzen des Hasses"
Inst37Quest1PreQuest = "true"
--
Inst37Quest1name1 = "Handschützer der Präzision"
Inst37Quest1name2 = "Jadeschulterstücke des Kriegers"
Inst37Quest1name3 = "Mantelung der Magiemacht"
Inst37Quest1name4 = "Stiefel des sicheren Schritts"

--Quest 2 Alliance
Inst37Quest2 = "2. Düstere Neuigkeiten"
Inst37Quest2_Level = "62"
Inst37Quest2_Attain = "59"
Inst37Quest2_Aim = "Bringt den unheilvollen Brief zu Truppenkommandant Danath Trollbann in der Ehrenfeste auf der Höllenfeuerhalbinsel."
Inst37Quest2_Location = "Unheilvoller Brief (droppt von Vazruden dem Herold; "..YELLOW.."[3]"..WHITE..")"
Inst37Quest2_Note = "Truppenkommandant Danath Trollbann findet man bei "..YELLOW.."57,67"..WHITE.." in der Ehrenfeste."
Inst37Quest2_Prequest = "Nein"
Inst37Quest2_Folgequest = "Ja, Blut bedeutet Leben ("..YELLOW.."HZ: Der Blutkessel"..WHITE..")"
Inst37Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst37Quest3 = "3. Gesucht: Nazans Reitgerte (Heroische Tagesquest)"
Inst37Quest3_Level = "70"
Inst37Quest3_Attain = "70"
Inst37Quest3_Aim = "Windhändler Zhareem hat Euch darum gebeten, ihm Nazans Reitgerte zu beschaffen. Bringt sie zu ihm ins untere Viertel in Shattrath, um Eure Belohnung zu erhalten."
Inst37Quest3_Location = "Windhändler Zhareem (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst37Quest3_Note = "Diese Aufgabe kann nur auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden.\n\nNazan findet man bei "..YELLOW.."[3]"..WHITE.."."
Inst37Quest3_Prequest = "Nein"
Inst37Quest3_Folgequest = "Nein"
--
Inst37Quest3name1 = "Abzeichen der Gerechtigkeit"


--Quest 1 Horde  (same as Quest 1 Alliance - different NPCs and pre-quest)
Inst37Quest1_HORDE = Inst37Quest1
Inst37Quest1_HORDE_Level = Inst37Quest1_Level
Inst37Quest1_HORDE_Attain = Inst37Quest1_Attain
Inst37Quest1_HORDE_Aim = "Tötet den Wachhabenden Gargolmar, Omor den Narbenlosen und Nazan, den Drachen. Bringt Gargolmars Hand, Omors Huf und Nazans Kopf zu Caza'rez in Thrallmar auf der Höllenfeuerhalbinsel."
Inst37Quest1_HORDE_Location = "Steinwache Stok'ton (Höllenfeuerhalbinsel - Thrallmar; "..YELLOW.."55,36"..WHITE..")"
Inst37Quest1_HORDE_Note = "Gargolmar befindet sich bei "..YELLOW.."[1]"..WHITE..", Omor befindet sich bei "..YELLOW.."[2]"..WHITE..", und Nazan befindet sich bei "..YELLOW.."[3]"..WHITE..". Caza'rez befindet sich bei (Höllenfeuerhalbinsel - Thrallmar; "..YELLOW.."55,36"..WHITE.."). \n\nUm diese Quest zu erhalten, muss Vorposten: Häschersturz absolviert sein, welche mit Durch das Dunkle Portal startet in den verwüsteten Landen startet."
Inst37Quest1_HORDE_Prequest = "Ja, Durch das Dunkle Portal -> Vorposten: Häschersturz"
Inst37Quest1_HORDE_Folgequest = Inst37Quest1_Folgequest
Inst37Quest1PreQuest_HORDE = Inst37Quest1PreQuest
--
Inst37Quest1name1_HORDE = Inst37Quest1name1
Inst37Quest1name2_HORDE = Inst37Quest1name2
Inst37Quest1name3_HORDE = Inst37Quest1name3
Inst37Quest1name4_HORDE = Inst37Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance - different NPC to turn in)
Inst37Quest2_HORDE = Inst37Quest2
Inst37Quest2_HORDE_Level = Inst37Quest2_Level
Inst37Quest2_HORDE_Attain = Inst37Quest2_Attain
Inst37Quest2_HORDE_Aim = "Bringt den unheilvollen Brief zu Nazgrel in Thrallmar auf der Höllenfeuerhalbinsel."
Inst37Quest2_HORDE_Location = Inst37Quest2_Location
Inst37Quest2_HORDE_Note = "Nazgrel befindet sich bei "..YELLOW.."55,36"..WHITE.." in Thrallmar."
Inst37Quest2_HORDE_Prequest = Inst37Quest2_Prequest
Inst37Quest2_HORDE_Folgequest = Inst37Quest2_Folgequest
Inst37Quest2FQuest_HORDE = Inst37Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst37Quest3_HORDE = Inst37Quest3
Inst37Quest3_HORDE_Level = Inst37Quest3_Level
Inst37Quest3_HORDE_Attain = Inst37Quest3_Attain
Inst37Quest3_HORDE_Aim = Inst37Quest3_Aim
Inst37Quest3_HORDE_Location = Inst37Quest3_Location
Inst37Quest3_HORDE_Note = Inst37Quest3_Note
Inst37Quest3_HORDE_Prequest = Inst37Quest3_Prequest
Inst37Quest3_HORDE_Folgequest = Inst37Quest3_Folgequest
--
Inst37Quest3name1_HORDE = Inst37Quest3name1



--------------- INST38 - HFC: Blood Furnace (BF) ---------------

Inst38Story = {
  ["Page1"] = "In der verwüsteten Weite der Scherbenwelt, tief im Herzen der Höllenfeuerhalbinsel, steht die Zitadelle des Höllenfeuers: Eine fast uneinnehmbare Festung, die der Horde als Ausgangspunkt für ihre Feldzüge während des Ersten und des Zweiten Krieges diente. Lange Jahre schien es, als sei diese gigantische Festung verlassen...\n \nBis vor kurzem.\n \nObwohl der rücksichtslose Ner'zhul große Bereiche Draenors zerschmetterte, blieb die Zitadelle des Höllenfeuers intakt - und wird nun von marodierenden Banden roter, wütender Höllenorcs bewohnt. Obwohl die Anwesenheit dieser neuen, wilden Brut an sich bereits ein Rätsel darstellt, ist es noch weitaus beunruhigender, dass die Anzahl der Höllenorcs stetig zu wachsen scheint.\n \nTrotz Thralls und Grom Höllschreis erfolgreicher Bemühungen, der Korruption der Horde Einhalt zu gebieten, indem sie Mannoroth töteten, scheint es, als hätten die barbarischen Orcs der Zitadelle des Höllenfeuers eine neue Quelle entdeckt, die ihre primitive Gier nach Blut stillt.",
  ["Page2"] = "Wessen Befehl diese Orcs unterstehen, ist nicht bekannt, allerdings überwiegt die Meinung, dass sie nicht für die Brennende Legion arbeiten.\n \nDie vielleicht beunruhigendste Nachricht aus der Scherbenwelt sind allerdings die Berichte über erschütternde, wilde Schreie aus den Tiefen unterhalb der Zitadelle. Möglicherweise stehen diese unheimlichen Ausbrüche in Zusammenhang mit den Höllenorcs und ihrer wachsenden Zahl. Bedauerlicherweise müssen diese Fragen unbeantwortet bleiben.\n \nZumindest vorerst.",
  ["MaxPages"] = "2",
};
Inst38Caption = "HZ: Der Blutkessel"
Inst38QAA = "3 Quests"
Inst38QAH = "3 Quests"
Inst38General = {
    {
    "Der Schöpfer",
    "Einfacher Kampf. Er teilt sehr wenig Nahkampfschaden aus. Einfach tanken und töten.",
    RED .. "Rückstoß" .. WHITE .. " Er wirft jeden in die Luft (Aggroreset oder Aggroreduzierung).\n" .. RED .. "Gedankenkontrolle" .. WHITE .. ": Er kontrolliert einen zufälligen Spieler und erhöht seinen Schaden.",
    },

    {
    "Broggok",
    "Schwieriger Kampf. Das Ereignis startet, wenn man Hebel in seinem Raum betätigt. Bevor der Boss selbst kommt, muss man 4 Gegnerwellen bekämpfen. Zwischen den Wellen kann man nicht trinken, daher sollte man einen Gegner der letzten Welle kontrollieren, um genug Mana für den Bosskampf zu regenerieren.",
   RED .. "4 Wellen:" .. WHITE .. " Die erste Gruppe besteht aus 4 normalen Gegnern, die zweite aus 3 normalen und einem Elitegegner, die dritte aus 2 normalen und 2 Elite-Gegnern und die letzte aus einem normalen und 3 Elitegegnern.\n" .. RED .. "Giftatem:" .. WHITE .. " Schaden auf alle Spieler vor ihm.\n" .. RED .. "Giftbombe:" .. WHITE .. " Er wirft zufällig eine Bombe auf einen Spieler. Die Bombe verursacht wenig Schaden, aber an der Einschlagstelle entsteht ein Giftkreis, der jedem Schaden (~650/sec) zufügt, der drinsteht.",
    },

    {
    "Keli'dan der Zerstörer",
    "Endboss und nicht wirklich schwierig. Der Kampf startet, wenn man einen der Kanalisierer neben ihm angreift. Wenn alle Kanalisierer tot sind, kreift Keli'dan an.",
   RED .. "Die Adds:" .. WHITE .. " Sie zaubern Schattenblitz und verteilen einen Magie-Debuff, der erhaltenen Schattenschaten um 1000 erhöht. Sollte so schnell wie möglich entfernt werden.\n" .. RED .. "Schattenblitzsalve:" .. WHITE .. " 3 Schattenblitze, nicht viel Schaden ohne den Debuff.\n" .. RED .. "Feuernova:" .. WHITE .. " Alle paar Sekunden ruft Keli'dan 'Näher, kommt näher, und verbrennt!' und hört auf, anzugreifen. Nach etwa 5 Sekunden wirkt er eine starke Feuernova mit großem Radius. Daher sollte jeder wegrennen, sobald Keli'dan diesen Satz schreit.",
    },
};

--Quest 1 Alliance
Inst38Quest1 = "1. Blut bedeutet Leben"
Inst38Quest1_Level = "63"
Inst38Quest1_Attain = "59"
Inst38Quest1_Aim = "Sammelt 10 Phiolen mit Höllenorcblut und bringt sie zu Gunny in der Ehrenfeste auf der Höllenfeuerhalbinsel."
Inst38Quest1_Location = "Gunny (Höllenfeuerhalbinsel - Ehrenfeste; "..YELLOW.."56,67"..WHITE..")"
Inst38Quest1_Note = "Alle Orks im Blutkessel können die Phiolen droppen."
Inst38Quest1_Prequest = "Ja, Düstere Neuigkeiten ("..YELLOW.."HZ: Höllenfeuerbollwerk"..WHITE..")"
Inst38Quest1_Folgequest = "Nein"
Inst38Quest1PreQuest = "true"
--
Inst38Quest1name1 = "Brustplatte der Vergeltung"
Inst38Quest1name2 = "Gamaschen des Todestunnlers"
Inst38Quest1name3 = "Mondkinkopfputz"
Inst38Quest1name4 = "Schuppenbeinlinge der Zerstörung"

--Quest 2 Alliance
Inst38Quest2 = "2. Im Herzen des Hasses"
Inst38Quest2_Level = "63"
Inst38Quest2_Attain = "59"
Inst38Quest2_Aim = "Untersucht das gesamte Areal des Blutkessels und meldet Euch anschließend bei Truppenkommandant Danath Trollbann in der Ehrenfeste auf der Höllenfeuerhalbinsel."
Inst38Quest2_Location = "Gunny (Höllenfeuerhalbinsel - Ehrenfeste; "..YELLOW.."56,67"..WHITE..")."
Inst38Quest2_Note = "Die Quest schließt ab, wenn man den Raum mit dem Endboss betrifft. Truppenkommandant Danath Trollbann befindet sich bei "..YELLOW.."57,67"..WHITE.." in der Ehrenfeste."
Inst38Quest2_Prequest = "Ja, Die Bollwerke schwächen ("..YELLOW.."HZ: Höllenfeuerbollwerk"..WHITE..")"
Inst38Quest2_Folgequest = "Nein"
Inst38Quest2PreQuest = "true"
--
Inst38Quest2name1 = "Purpurroter Anhänger der Klarsicht"
Inst38Quest2name2 = "Heiliges Band der Heilung"
Inst38Quest2name3 = "Perfekt ausbalanciertes Cape"

--Quest 3 Alliance
Inst38Quest3 = "3. Gesucht: Keli'dans gefiederter Stab (Heroisches Tagesquest)"
Inst38Quest3_Level = "70"
Inst38Quest3_Attain = "70"
Inst38Quest3_Aim = "Windhändler Zhareem hat Euch darum gebeten, ihm Keli'dans gefiederten Stab zu beschaffen. Bringt ihn zu ihm ins untere Viertel in Shattrath, um Eure Belohnung zu erhalten."
Inst38Quest3_Location = "Windhändler Zhareem (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst38Quest3_Note = "Diese Aufgabe kann nur auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden.\n\nKeli'dan der Zerstörer befindet sich bei "..YELLOW.."[3]"..WHITE.."."
Inst38Quest3_Prequest = "Nein"
Inst38Quest3_Folgequest = "Nein"
--
Inst38Quest3name1 = "Badge of Justice"


--Quest 1 Horde  (same as Quest 1 Alliance - different NPC to turn in)
Inst38Quest1_HORDE = Inst38Quest1
Inst38Quest1_HORDE_Level = Inst38Quest1_Level
Inst38Quest1_HORDE_Attain = Inst38Quest1_Attain
Inst38Quest1_HORDE_Aim = "Sammelt 10 Phiolen mit Höllenorcblut und bringt sie zu Zenturio Caza'rez in Thrallmar auf der Höllenfeuerhalbinsel."
Inst38Quest1_HORDE_Location = "Caza'rez (Höllenfeuerhalbinsel - Thrallmar; "..YELLOW.."55,36"..WHITE..")"
Inst38Quest1_HORDE_Note = Inst38Quest1_Note
Inst38Quest1_HORDE_Prequest = Inst38Quest1_Prequest
Inst38Quest1_HORDE_Folgequest = Inst38Quest1_Folgequest
Inst38Quest1PreQuest_HORDE = Inst38Quest1PreQuest
--
Inst38Quest1name1_HORDE = Inst38Quest1name1
Inst38Quest1name2_HORDE = Inst38Quest1name2
Inst38Quest1name3_HORDE = Inst38Quest1name3
Inst38Quest1name4_HORDE = Inst38Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance - different NPC to turn in)
Inst38Quest2_HORDE = Inst38Quest2
Inst38Quest2_HORDE_Level = Inst38Quest2_Level
Inst38Quest2_HORDE_Attain = Inst38Quest2_Attain
Inst38Quest2_HORDE_Aim = "Untersucht das gesamte Areal des Blutkessels und meldet Euch anschließend bei Nazgrel in Thrallmar auf der Höllenfeuerhalbinsel."
Inst38Quest2_HORDE_Location = "Caza'rez (Höllenfeuerhalbinsel - Thrallmar; "..YELLOW.."55,36"..WHITE..")"
Inst38Quest2_HORDE_Note = "Die Quest schließt ab, wenn man den Raum mit dem Endboss betrifft. Nazgrel befindet sich bei "..YELLOW.."55,36"..WHITE.." in Thrallmar."
Inst38Quest2_HORDE_Prequest = Inst38Quest2_Prequest
Inst38Quest2_HORDE_Folgequest = Inst38Quest2_Folgequest
Inst38Quest2PreQuest_HORDE = Inst38Quest2PreQuest
--
Inst38Quest2name1_HORDE = Inst38Quest2name1
Inst38Quest2name2_HORDE = Inst38Quest2name2
Inst38Quest2name3_HORDE = Inst38Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst38Quest3_HORDE = Inst38Quest3
Inst38Quest3_HORDE_Level = Inst38Quest3_Level
Inst38Quest3_HORDE_Attain = Inst38Quest3_Attain
Inst38Quest3_HORDE_Aim = Inst38Quest3_Aim
Inst38Quest3_HORDE_Location = Inst38Quest3_Location
Inst38Quest3_HORDE_Note = Inst38Quest3_Note
Inst38Quest3_HORDE_Prequest = Inst38Quest3_Prequest
Inst38Quest3_HORDE_Folgequest = Inst38Quest3_Folgequest
--
Inst38Quest3name1_HORDE = Inst38Quest3name1



--------------- INST39 - HFC: Shattered Halls (SH) ---------------

Inst39Story = {
  ["Page1"] = "In der verwüsteten Weite der Scherbenwelt, tief im Herzen der Höllenfeuerhalbinsel, steht die Zitadelle des Höllenfeuers: Eine fast uneinnehmbare Festung, die der Horde als Ausgangspunkt für ihre Feldzüge während des Ersten und des Zweiten Krieges diente. Lange Jahre schien es, als sei diese gigantische Festung verlassen...\n \nBis vor kurzem.\n \nObwohl der rücksichtslose Ner'zhul große Bereiche Draenors zerschmetterte, blieb die Zitadelle des Höllenfeuers intakt - und wird nun von marodierenden Banden roter, wütender Höllenorcs bewohnt. Obwohl die Anwesenheit dieser neuen, wilden Brut an sich bereits ein Rätsel darstellt, ist es noch weitaus beunruhigender, dass die Anzahl der Höllenorcs stetig zu wachsen scheint.\n \nTrotz Thralls und Grom Höllschreis erfolgreicher Bemühungen, der Korruption der Horde Einhalt zu gebieten, indem sie Mannoroth töteten, scheint es, als hätten die barbarischen Orcs der Zitadelle des Höllenfeuers eine neue Quelle entdeckt, die ihre primitive Gier nach Blut stillt.",
  ["Page2"] = "Wessen Befehl diese Orcs unterstehen, ist nicht bekannt, allerdings überwiegt die Meinung, dass sie nicht für die Brennende Legion arbeiten.\n \nDie vielleicht beunruhigendste Nachricht aus der Scherbenwelt sind allerdings die Berichte über erschütternde, wilde Schreie aus den Tiefen unterhalb der Zitadelle. Möglicherweise stehen diese unheimlichen Ausbrüche in Zusammenhang mit den Höllenorcs und ihrer wachsenden Zahl. Bedauerlicherweise müssen diese Fragen unbeantwortet bleiben.\n \nZumindest vorerst.",
  ["MaxPages"] = "2",
};
Inst39Caption = "HZ: Die zerschmetterten Hallen"
Inst39QAA = "10 Quests"
Inst39QAH = "9 Quests"

--Quest 1 Alliance
Inst39Quest1 = "1. Teufelsglut"
Inst39Quest1_Level = "70"
Inst39Quest1_Attain = "67"
Inst39Quest1_Aim = "Magus Zabraxis in der Ehrenfeste möchte, dass Ihr ihr ein Stück Teufelsglut bringt."
Inst39Quest1_Location = "Magus Zabraxis (Höllenfeuerhalbinsel - Ehrenfeste; "..YELLOW.."54,66"..WHITE..")"
Inst39Quest1_Note = "Nachdem Großhexenmeister Nethekurse bei "..YELLOW.."[2]"..WHITE.." getötet wurde, droppt er ein Amulett. Das Amulett muss bei einer der Kohlenpfannen in der Nähe seines Throns benutzt werden, um die Teufelsglut zu erhalten."
Inst39Quest1_Prequest = "Nein"
Inst39Quest1_Folgequest = "Nein"
--
Inst39Quest1name1 = "Stiefel des Kurat"
Inst39Quest1name2 = "Gravierter Runengürtel"
Inst39Quest1name3 = "Handschuhe der Bewahrung"
Inst39Quest1name4 = "Späherschulterklappen der Expedition"
Inst39Quest1name5 = "Unerschrockene Handschützer"

--Quest 2 Alliance
Inst39Quest2 = "2. Pride of the Fel Horde"
Inst39Quest2_Level = "70"
Inst39Quest2_Attain = "66"
Inst39Quest2_Aim = "Feldkommandant Romus in der Ehrenfeste möchte, dass Ihr 8 Legionäre der Zerschmetterten Hand, 4 Zenturios der Zerschmetterten Hand und 4 Champions der Zerschmetterten Hand tötet."
Inst39Quest2_Location = "Feldkommandant Romus (Höllenfeuerhalbinsel - Ehrenfeste; "..YELLOW.."57,63"..WHITE..")"
Inst39Quest2_Note = "Die Zenturios sind in der Trainingshalle zu finden."
Inst39Quest2_Prequest = "Nein"
Inst39Quest2_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 3 Alliance
Inst39Quest3 = "3. Das Schicksal wenden"
Inst39Quest3_Level = "70"
Inst39Quest3_Attain = "67"
Inst39Quest3_Aim = "Bringt Kriegshäuptling Kargaths Faust zu Truppenkommandant Danath Trollbann in der Ehrenfeste."
Inst39Quest3_Location = "Truppenkommandant Danath Trollbann (Höllenfeuerhalbinsel - Ehrenfeste; "..YELLOW.."57,67"..WHITE..")"
Inst39Quest3_Note = "Kriegshäuptling Kargath Messerfaust befindet sich bei "..YELLOW.."[5]"..WHITE.."."
Inst39Quest3_Prequest = "Nein"
Inst39Quest3_Folgequest = "Nein"
--
Inst39Quest3name1 = "Nethekurses Rute der Qualen"
Inst39Quest3name2 = "Mantel der Belebung"
Inst39Quest3name3 = "Nalikos Rache"
Inst39Quest3name4 = "Medaillon des tapferen Wächters"

--Quest 4 Alliance
Inst39Quest4 = "4. Gefangene der Zitadelle (Heroisch)"
Inst39Quest4_Level = "70"
Inst39Quest4_Attain = "70"
Inst39Quest4_Aim = "Rettet Hauptmann Alina aus der Höllenfeuerzitadelle, bevor sie hingerichtet wird."
Inst39Quest4_Location = "Randy Sauseritzel (Die zerschmetterten Hallen; "..YELLOW.."Heroisch [1]"..WHITE..")"
Inst39Quest4_Note = "Um diese Aufgabe zu beenden, müsst Ihr den Dungeon auf dem Schwierigkeitsgrad 'Heroisch' betreten.\n\nHauptmann Alina befindet sich bei "..YELLOW.."[5]"..WHITE..". Der Timer von 50 Minuten startet am Anfang des Bogenschützen-Events."
Inst39Quest4_Prequest = "Nein"
Inst39Quest4_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 5 Alliance
Inst39Quest5 = "5. Die Prüfung der Naaru: Erbarmen (Heroisch)"
Inst39Quest5_Level = "70"
Inst39Quest5_Attain = "70"
Inst39Quest5_Aim = "A'dal in Shattrath möchte, dass Ihr die unbenutzte Axt des Henkers aus den zerschmetterten Hallen der Höllenfeuerzitadelle besorgt."
Inst39Quest5_Location = "A'dal (Shattrath - Terrasse des Lichts; "..YELLOW.."53,43"..WHITE..")"
Inst39Quest5_Note = "Diese Aufgabe muss auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden.\n\nDiese Quest wurde benötigt, um die Festung der Stürme zu betreten, ist aber nicht mehr nötig."
Inst39Quest5_Prequest = "Nein"
Inst39Quest5_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 6 Alliance
Inst39Quest6 = "6. Träne der Erdenmutter"
Inst39Quest6_Level = "70"
Inst39Quest6_Attain = "70"
Inst39Quest6_Aim = "Besorgt die Träne der Erdenmutter von Kriegshetzer O'mrogg und bringt sie zu David Wayne in Waynes Zuflucht."
Inst39Quest6_Location = "David Wayne (Wälder von Terokkar - Waynes Zuflucht; "..YELLOW.."78,39"..WHITE..")."
Inst39Quest6_Note = "Kriegshetzer O'mrogg befindet sich bei "..YELLOW.."[4]"..WHITE..".\n\nDer Gegenstand wird im heroischen Modus nicht droppen."
Inst39Quest6_Prequest = "Ja, Frisch von der Mechanar ("..YELLOW.."FdS: Die Mechanar"..WHITE..") & Encyclopaedia Daemonica ("..YELLOW.."Auch: Schattenlabyrinth"..WHITE..")"
Inst39Quest6_Folgequest = "Ja, Bann der Illidari"
Inst39Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst39Quest7 = "7. Kalynnas Bitte (Heroisch)"
Inst39Quest7_Level = "70"
Inst39Quest7_Attain = "70"
Inst39Quest7_Aim = "Kalynna Lathred möchte, dass Ihr den Dämmerfolianten vom Großhexenmeister Nethekurse in den zerschmetterten Hallen der Höllenfeuerzitadelle und das Buch der vergessenen Namen von Dunkelwirker Syth in den Sethekkhallen in Auchindoun besorgt."
Inst39Quest7_Location = "Kalynna Lathred (Nethersturm - Area 52; "..YELLOW.."32,63"..WHITE..")"
Inst39Quest7_Note = "Ihr müsst diese Quest auf dem Schwierigkeitsgrad 'Heroisch' abschließen.\n\nGroßhexenmeister Nethekurse befindet sich bei "..YELLOW.."[2]"..WHITE..". Das Buch der vergessenen Namen droppt in den Sethekkhallen."
Inst39Quest7_Prequest = "Ja, Hilfe unter Kollegen ("..YELLOW.."Karazhan"..WHITE..")"
Inst39Quest7_Folgequest = "Ja, Schrecken der Nacht ("..YELLOW.."Karazhan"..WHITE..")"
Inst39Quest7PreQuest = "true"
-- No Rewards for this quest

--Quest 8 Alliance
Inst39Quest8 = "8. Gesucht: Messerfausts Siegel (Heroisches Tagesquest)"
Inst39Quest8_Level = "70"
Inst39Quest8_Attain = "70"
Inst39Quest8_Aim = "Windhändler Zhareem hat Euch darum gebeten, ihm Messerfausts Siegel zu beschaffen. Bringt es zu ihm ins untere Viertel in Shattrath, um Eure Belohnung zu erhalten."
Inst39Quest8_Location = "Windhändler Zhareem (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst39Quest8_Note = "Diese Aufgabe kann nur auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden.\n\nKriegshäuptling Kargath Messerfaust befindet sich bei "..YELLOW.."[5]"..WHITE.."."
Inst39Quest8_Prequest = "Nein"
Inst39Quest8_Folgequest = "Nein"
--
Inst39Quest8name1 = "Abzeichen der Gerechtigkeit"

--Quest 9 Alliance
Inst39Quest9 = "9. Gesucht: Zenturionen der Zerschmetterten Hand (Tagesquest)"
Inst39Quest9_Level = "70"
Inst39Quest9_Attain = "70"
Inst39Quest9_Aim = "Netherpirscher Mah'duun hat Euch damit beauftragt, 4 Zenturionen der Zerschmetterten Hand zu töten. Kehrt erst zu ihm in das untere Viertel in Shattrath zurück, wenn sie alle dem Tod überantwortet wurden."
Inst39Quest9_Location = "Netherpirscher Mah'duun (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst39Quest9_Note = "Die Zenturios sind in der Trainingshalle zu finden."
Inst39Quest9_Prequest = "Nein"
Inst39Quest9_Folgequest = "Nein"
--
Inst39Quest9name1 = "Gefängnisschlüssel des Astraleums"

--Quest 10 Alliance
Inst39Quest10 = "10. Zugang zur Zitadelle"
Inst39Quest10_Level = "70"
Inst39Quest10_Attain = "68"
Inst39Quest10_Aim = "Bringt die präparierte Schlüsselform zu Truppenkommandant Danath in der Ehrenfeste auf der Höllenfeuerhalbinsel."
Inst39Quest10_Location = "Präparierte Schlüsselform (droppt von Schmied Gorlunk im Schattenmondtal - Terrasse von Ata'mal; "..YELLOW.."68,36"..WHITE..")"
Inst39Quest10_Note = "Der Schmied, der die Präparierte Schlüsselform droppt ist leicht mit einem Flugtier zu erreichen und es ist nicht schwierig ihn alleine zu töten.\n\nTruppenkommandant Danath befindet sich bei (Höllenfeuerhalbinsel - Ehrenfeste; "..YELLOW.."57,67"..WHITE.."). Er schickt euch zu Großmeister Dumphry bei (Höllenfeuerhalbinsel - Ehrenfeste; "..YELLOW.."51,60"..WHITE..") für den nächsten Teil des Quests..."
Inst39Quest10_Page = {2, "Großmeister Dumphry will 4 x [Teufelseisenbarren], 2 x [Arkaner Staub] and 4 x [Feuerpartikel] von euch.\n\nNachdem ihr die Materialien abgegeben habt müsst ihr die Verkohlte Schlüsselform, die er euch gibt, mit dem Körper eines toten Teufelshäscher benutzen. Ihr müsst den Teufelshäscher nicht selbst getötet haben, damit es funktioniert.\n\nKehrt zu Großmeister Dumphry bei (Höllenfeuerhalbinsel - Ehrenfeste; "..YELLOW.."51,60"..WHITE..") zurück, um eure Belohnung abzuholen.", };
Inst39Quest10_Prequest = "Nein"
Inst39Quest10_Folgequest = "Ja, Großmeister Dumphry -> Heißer als die Hölle"
--
Inst39Quest10name1 = "Schlüssel der zerschmetterten Hallen"


--Quest 1 Horde  (same as Quest 2 Alliance - different NPC to turn in)
Inst39Quest1_HORDE = "1. Der Stolz der Höllenhorde"
Inst39Quest1_HORDE_Level = Inst39Quest2_Level
Inst39Quest1_HORDE_Attain = Inst39Quest2_Attain
Inst39Quest1_HORDE_Aim = "Schattenjäger Ty'jin in Thrallmar möchte, dass Ihr 8 Legionäre der Zerschmetterten Hand, 4 Zenturios der Zerschmetterten Hand und 4 Champions der Zerschmetterten Hand tötet."
Inst39Quest1_HORDE_Location = "Schattenjäger Ty'jin (Höllenfeuerhalbinsel - Thrallmar; "..YELLOW.."55,36"..WHITE..")"
Inst39Quest1_HORDE_Note = Inst39Quest2_Note
Inst39Quest1_HORDE_Prequest = Inst39Quest2_Prequest
Inst39Quest1_HORDE_Folgequest = Inst39Quest2_Folgequest
-- No Rewards for this quest

--Quest 2 Horde
Inst39Quest2_HORDE = "2. Der Wille des Kriegshäuptlings"
Inst39Quest2_HORDE_Level = "70"
Inst39Quest2_HORDE_Attain = "67"
Inst39Quest2_HORDE_Aim = "Bringt Kriegshäuptling Kargaths Faust zu Nazgrel in Thrallmar."
Inst39Quest2_HORDE_Location = "Nazgrel (Höllenfeuerhalbinsel - Thrallmar; "..YELLOW.."55,36"..WHITE..")"
Inst39Quest2_HORDE_Note = "Kriegshäuptling Kargath Messerfaust befindet sich bei "..YELLOW.."[5]"..WHITE.."."
Inst39Quest2_HORDE_Prequest = "Nein"
Inst39Quest2_HORDE_Folgequest = "Nein"
--
Inst39Quest2name1_HORDE = "Rute der finsteren Schatten"
Inst39Quest2name2_HORDE = "Vikarsumhang"
Inst39Quest2name3_HORDE = "Band des Eroberers"
Inst39Quest2name4_HORDE = "Stümmelfausts Halsschmuck"

--Quest 3 Horde
Inst39Quest3_HORDE = "3. Gefangene der Zitadelle (Heroisch)"
Inst39Quest3_HORDE_Level = "70"
Inst39Quest3_HORDE_Attain = "70"
Inst39Quest3_HORDE_Aim = "Rettet Hauptmann Knochenbrecher aus der Höllenfeuerzitadelle, bevor er hingerichtet wird."
Inst39Quest3_HORDE_Location = "Drisella (Die zerschmetterten Hallen; "..YELLOW.."Heroisch [1]"..WHITE..")"
Inst39Quest3_HORDE_Note = "Um diese Aufgabe zu beenden, müsst Ihr den Dungeon auf dem Schwierigkeitsgrad 'Heroisch' betreten.\n\nDrisella befindet sich bei "..YELLOW.."[5]"..WHITE..". Der Timer von 55 Minuten startet am Anfang des Bogenschützen-Events."
Inst39Quest3_HORDE_Prequest = "Nein"
Inst39Quest3_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 5 Alliance)
Inst39Quest4_HORDE = "4. Die Prüfung der Naaru: Erbarmen (Heroisch)"
Inst39Quest4_HORDE_Level = Inst39Quest5_Level
Inst39Quest4_HORDE_Attain = Inst39Quest5_Attain
Inst39Quest4_HORDE_Aim = Inst39Quest5_Aim
Inst39Quest4_HORDE_Location = Inst39Quest5_Location
Inst39Quest4_HORDE_Note = Inst39Quest5_Note
Inst39Quest4_HORDE_Prequest = Inst39Quest5_Prequest
Inst39Quest4_HORDE_Folgequest = Inst39Quest5_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 6 Alliance)
Inst39Quest5_HORDE = "5. Träne der Erdenmutter"
Inst39Quest5_HORDE_Level = Inst39Quest6_Level
Inst39Quest5_HORDE_Attain = Inst39Quest6_Attain
Inst39Quest5_HORDE_Aim = Inst39Quest6_Aim
Inst39Quest5_HORDE_Location = Inst39Quest6_Location
Inst39Quest5_HORDE_Note = Inst39Quest6_Note
Inst39Quest5_HORDE_Prequest = Inst39Quest6_Prequest
Inst39Quest5_HORDE_Folgequest = Inst39Quest6_Folgequest
Inst39Quest5PreQuest_HORDE = Inst39Quest6Prequest
-- No Rewards for this quest

--Quest 6 Alliance  (same as Quest 7 Alliance)
Inst39Quest6_HORDE = "6. Kalynnas Bitte (Heroisch)"
Inst39Quest6_HORDE_Level = Inst39Quest7_Level
Inst39Quest6_HORDE_Attain = Inst39Quest7_Attain
Inst39Quest6_HORDE_Aim = Inst39Quest7_Aim
Inst39Quest6_HORDE_Location = Inst39Quest7_Location
Inst39Quest6_HORDE_Note = Inst39Quest7_Note
Inst39Quest6_HORDE_Prequest = Inst39Quest7_Prequest
Inst39Quest6_HORDE_Folgequest = Inst39Quest7_Folgequest
Inst39Quest6PreQuest_HORDE = Inst39Quest7PreQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 8 Alliance)
Inst39Quest7_HORDE = "7. Gesucht: Messerfausts Siegel (Heroisches Tagesquest)"
Inst39Quest7_HORDE_Level = Inst39Quest8_Level
Inst39Quest7_HORDE_Attain = Inst39Quest8_Attain
Inst39Quest7_HORDE_Aim = Inst39Quest8_Aim
Inst39Quest7_HORDE_Location = Inst39Quest8_Location
Inst39Quest7_HORDE_Note = Inst39Quest8_Note
Inst39Quest7_HORDE_Prequest = Inst39Quest8_Prequest
Inst39Quest7_HORDE_Folgequest = Inst39Quest8_Folgequest
--
Inst39Quest7name1_HORDE = Inst39Quest8name1

--Quest 8 Horde  (same as Quest 9 Alliance)
Inst39Quest8_HORDE = "8. Gesucht: Zenturionen der Zerschmetterten Hand (Tagesquest)"
Inst39Quest8_HORDE_Level = Inst39Quest9_Level
Inst39Quest8_HORDE_Attain = Inst39Quest9_Attain
Inst39Quest8_HORDE_Aim = Inst39Quest9_Aim
Inst39Quest8_HORDE_Location = Inst39Quest9_Location
Inst39Quest8_HORDE_Note = Inst39Quest9_Note
Inst39Quest8_HORDE_Prequest = Inst39Quest9_Prequest
Inst39Quest8_HORDE_Folgequest = Inst39Quest9_Folgequest
--
Inst39Quest8name1_HORDE = Inst39Quest9name1

--Quest 9 Horde
Inst39Quest9_HORDE = "9. Zugang zur Zitadelle"
Inst39Quest9_HORDE_Level = "70"
Inst39Quest9_HORDE_Attain = "68"
Inst39Quest9_HORDE_Aim = "Bringt die präparierte Schlüsselform zu Truppenkommandant Nazgrel in Thrallmar auf der Höllenfeuerhalbinsel."
Inst39Quest9_HORDE_Location = "Präparierte Schlüsselform (droppt von Schmied Gorlunk im Schattenmondtal - Terrasse von Ata'mal; "..YELLOW.."68,36"..WHITE..")"
Inst39Quest9_HORDE_Note = "Der Schmied, der die Präparierte Schlüsselform droppt ist leicht mit einem Flugtier zu erreichen und es ist nicht schwierig ihn alleine zu töten.\n\nNazgrel befindet sich bei (Höllenfeuerhalbinsel - Thrallmar; "..YELLOW.."55,36"..WHITE.."). Er schickt euch zu Großmeister Rohok bei (Höllenfeuerhalbinsel - Thrallmar; "..YELLOW.."53,38"..WHITE..") für den nächsten Teil des Quests..."
Inst39Quest9_HORDE_Page = {2, "Großmeister Rohok will 4 x [Teufelseisenbarren], 2 x [Arkaner Staub] and 4 x [Feuerpartikel] von euch.\n\nNachdem ihr die Materialien abgegeben habt müsst ihr die Verkohlte Schlüsselform, die er euch gibt, mit dem Körper eines toten Teufelshäscher benutzen. Ihr müsst den Teufelshäscher nicht selbst getötet haben, damit es funktioniert.\n\nKehrt zu Großmeister Rohok bei (Höllenfeuerhalbinsel - Thrallmar; "..YELLOW.."53,38"..WHITE..") zurück, um eure Belohnung abzuholen.", };
Inst39Quest9_HORDE_Prequest = "Nein"
Inst39Quest9_HORDE_Folgequest = "Ja, Großmeister Rohok -> Heißer als die Hölle"
--
Inst39Quest9name1_HORDE = "Schlüssel der zerschmetterten Hallen"



--------------- INST40 - HFC: Magtheridon's Lair ---------------

Inst40Story = {
  ["Page1"] = "In der verwüsteten Weite der Scherbenwelt, tief im Herzen der Höllenfeuerhalbinsel, steht die Zitadelle des Höllenfeuers: Eine fast uneinnehmbare Festung, die der Horde als Ausgangspunkt für ihre Feldzüge während des Ersten und des Zweiten Krieges diente. Lange Jahre schien es, als sei diese gigantische Festung verlassen...\n \nBis vor kurzem.\n \nObwohl der rücksichtslose Ner'zhul große Bereiche Draenors zerschmetterte, blieb die Zitadelle des Höllenfeuers intakt - und wird nun von marodierenden Banden roter, wütender Höllenorcs bewohnt. Obwohl die Anwesenheit dieser neuen, wilden Brut an sich bereits ein Rätsel darstellt, ist es noch weitaus beunruhigender, dass die Anzahl der Höllenorcs stetig zu wachsen scheint.\n \nTrotz Thralls und Grom Höllschreis erfolgreicher Bemühungen, der Korruption der Horde Einhalt zu gebieten, indem sie Mannoroth töteten, scheint es, als hätten die barbarischen Orcs der Zitadelle des Höllenfeuers eine neue Quelle entdeckt, die ihre primitive Gier nach Blut stillt.",
  ["Page2"] = "Wessen Befehl diese Orcs unterstehen, ist nicht bekannt, allerdings überwiegt die Meinung, dass sie nicht für die Brennende Legion arbeiten.\n \nDie vielleicht beunruhigendste Nachricht aus der Scherbenwelt sind allerdings die Berichte über erschütternde, wilde Schreie aus den Tiefen unterhalb der Zitadelle. Möglicherweise stehen diese unheimlichen Ausbrüche in Zusammenhang mit den Höllenorcs und ihrer wachsenden Zahl. Bedauerlicherweise müssen diese Fragen unbeantwortet bleiben.\n \nZumindest vorerst.",
  ["MaxPages"] = "2",
};
Inst40Caption = "HZ: Magtheridons Kammer"
Inst40QAA = "2 Quests"
Inst40QAH = "2 Quests"

--Quest 1 Alliance
Inst40Quest1 = "1. Die Prüfung der Naaru: Magtheridon"
Inst40Quest1_Level = "70"
Inst40Quest1_Attain = "70"
Inst40Quest1_Aim = "A'dal in Shattrath möchte, dass Ihr Magtheridon vernichtet."
Inst40Quest1_Location = "A'dal (Shattrath - Terrasse des Lichts; "..YELLOW.."53,43"..WHITE..")"
Inst40Quest1_Note = "Die drei anderen Prüfungen der Naaru, die es von A'dal gibt, müssen absolviert sein.\n\nDiese Quest wurde benötigt, um die Festung der Stürme zu betreten, ist aber nicht mehr nötig."
Inst40Quest1_Prequest = "Ja, Die Prüfung der Naaru: Zuverlässigkeit, Erbarmen und Stärke"
Inst40Quest1_Folgequest = "Nein"
Inst40Quest1PreQuest = "true"
--
Inst40Quest1name1 = "Band des Phönixfeuers"

--Quest 2 Alliance
Inst40Quest2 = "2. Magtheridons Untergang"
Inst40Quest2_Level = "70"
Inst40Quest2_Attain = "70"
Inst40Quest2_Aim = "Bringt Magtheridons Kopf zu Truppenkommandant Danath Trollbann in der Ehrenfeste auf der Höllenfeuerhalbinsel zurück."
Inst40Quest2_Location = "Magtheridons Kopf (droppt von Magtheridon; "..YELLOW.."[1]"..WHITE..")"
Inst40Quest2_Note = "Nur eine Person im Schlachtzug kann den Kopf erhalten, um die Quest zu starten. Truppenkommandant Danath Trollbann befindet sich bei "..YELLOW.."57,67"..WHITE.."."
Inst40Quest2_Prequest = "Nein"
Inst40Quest2_Folgequest = "Nein"
--
Inst40Quest2name1 = "A'dals Siegel der Verteidigung"
Inst40Quest2name2 = "Band des purpurroten Furors"
Inst40Quest2name3 = "Lichtwächterband der Naaru"
Inst40Quest2name4 = "Ring des Aufsässigen"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst40Quest1_HORDE = Inst40Quest1
Inst40Quest1_HORDE_Level = Inst40Quest1_Level
Inst40Quest1_HORDE_Attain = Inst40Quest1_Attain
Inst40Quest1_HORDE_Aim = Inst40Quest1_Aim
Inst40Quest1_HORDE_Location = Inst40Quest1_Location
Inst40Quest1_HORDE_Note = Inst40Quest1_Note
Inst40Quest1_HORDE_Prequest = Inst40Quest1_Prequest
Inst40Quest1_HORDE_Folgequest = Inst40Quest1_Folgequest
Inst40Quest1PreQuest_HORDE = Inst40Quest1PreQuest
--
Inst40Quest1name1_HORDE = Inst40Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance - different NPC to turn in)
Inst40Quest2_HORDE = Inst40Quest2
Inst40Quest2_HORDE_Level = Inst40Quest2_Level
Inst40Quest2_HORDE_Attain = Inst40Quest2_Attain
Inst40Quest2_HORDE_Aim = "Bringt Magtheridons Kopf zu Nazgrel in Thrallmar auf der Höllenfeuerhalbinsel."
Inst40Quest2_HORDE_Location = Inst40Quest2_Location
Inst40Quest2_HORDE_Note = "Nur eine Person im Schlachtzug kann den Kopf erhalten, um die Quest zu starten. Nazgrel befindet sich bei "..YELLOW.."55,36"..WHITE.."."
Inst40Quest2_HORDE_Prequest = Inst40Quest2_Prequest
Inst40Quest2_HORDE_Folgequest = Inst40Quest2_Folgequest
--
Inst40Quest2name1_HORDE = Inst40Quest2name1
Inst40Quest2name2_HORDE = Inst40Quest2name2
Inst40Quest2name3_HORDE = Inst40Quest2name3
Inst40Quest2name4_HORDE = Inst40Quest2name4



--------------- INST41 - CR: The Slave Pens (SP) ---------------

Inst41Story = "Die empfindliche Ökologie der Zangarmarschen wurde aus dem Gleichgewicht geworfen.\n\nUnnatürliche Phänomene beschädigen und zerstören die natürliche Pflanzen- und Tierwelt der Marschen.\n\nEiniges deutet darauf hin, dass diese Störungen ihren Ursprung im Echsenkessel haben.\n\nMan munkelt, dass der Anführer dieses mysteriösen Gebäudes niemand anders ist als die berüchtigte Lady Vashj.\n\nNur du kannst ihre ruchlosen Pläne entdecken und sie aufhalten, bevor es zu spät ist.\n\nDer Echsenkessel ist in vier Bereiche aufgeteilt, von denen drei Fünf-Spieler-Instanzen sind (die Sklavenunterkünfte, der Tiefensumpf, die Dampfkammer), dazu kommt die 25-Spieler-Instanz Höhle des Schlangenschreins. "
Inst41Caption = "EK: Die Sklavenunterkünfte"
Inst41QAA = "7 Quests"
Inst41QAH = "7 Quests"

--Quest 1 Alliance
Inst41Quest1 = "1. Bei der Arbeit verschollen"
Inst41Quest1_Level = "65"
Inst41Quest1_Attain = "62"
Inst41Quest1_Aim = "Findet heraus, was mit Erdbinder Rayge, Naturalist Biss, Jäter Gründaum und Windrufer Klaue geschehen ist. Kehrt dann zu Behüterin Jhang im Echsenkessel in den Zangarmarschen zurück."
Inst41Quest1_Location = "Behüterin Jhang (Echsenkessel; "..YELLOW.."52,36"..WHITE..")"
Inst41Quest1_Note = "Behüterin Jhang befindet sich in der Unterwasserhöhle am Versammlungsstein. Jäter Gründaum befindet sich bei "..YELLOW.."[3]"..WHITE.." und Naturalist Biss bei "..YELLOW.."[6]"..WHITE..". Das Quest wird im Tiefensumpf vortgeführt. Die Vorquests sind optional."
Inst41Quest1_Prequest = "Ja, Kanalisationspläne -> Fehlgeschlagene Operation"
Inst41Quest1_Folgequest = "Nein"
Inst41Quest1PreQuest = "true"
--
Inst41Quest1name1 = "Cenarischer Ring des Zauberwirkens"
Inst41Quest1name2 = "Goldrankenwickeltücher"
Inst41Quest1name3 = "Dunkler Umhang der Marschen"

--Quest 2 Alliance
Inst41Quest2 = "2. Gesucht: Das Herz von Quagmirran (Heroisches Tagesquest)"
Inst41Quest2_Level = "70"
Inst41Quest2_Attain = "70"
Inst41Quest2_Aim = "Windhändler Zhareem hat Euch darum gebeten, ihm das Herz von Quagmirran zu beschaffen. Bringt es zu ihm ins untere Viertel in Shattrath, um Eure Belohnung zu erhalten."
Inst41Quest2_Location = "Windhändler Zhareem (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst41Quest2_Note = "Diese Aufgabe kann nur auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden.\n\nQuagmirran befindet sich bei "..YELLOW.."[7]"..WHITE.."."
Inst41Quest2_Prequest = "Nein"
Inst41Quest2_Folgequest = "Nein"
--
Inst41Quest2name1 = "Abzeichen der Gerechtigkeit"

--Quest 3 Alliance
Inst41Quest3 = "3. Der Knüppel von Kar'desh (Heroisch)"
Inst41Quest3_Level = "70"
Inst41Quest3_Attain = "70"
Inst41Quest3_Aim = "Nar'biss der Ketzer in den heroischen Sklavenunterkünften des Echsenkessels möchte, dass Ihr ihm das Erdensiegel und das Flammensiegel bringt."
Inst41Quest3_Location = "Nar'biss der Ketzer (Sklavenunterkünfte; "..YELLOW.."Heroisch [4]"..WHITE..")"
Inst41Quest3_Note = "Das Erdensiegel droppt von Gruul in "..YELLOW.."Gruuls Unterschlupf"..WHITE.." und das Flammensiegel droppt von Schrecken der Nacht in "..YELLOW.."Karazhan"..WHITE..".\n\nDiese Quest wurde benötigt, um die Höhle des Schlangenschreins zu betreten, ist aber nicht mehr nötig."
Inst41Quest3_Prequest = "Nein"
Inst41Quest3_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Alliance
Inst41Quest4 = "4. Ahune der Frostfürst (Saisonbedingt)"
Inst41Quest4_Level = "70"
Inst41Quest4_Attain = "65"
Inst41Quest4_Aim = "Begebt Euch in die Sklavenunterkünfte im Echsenkessel in den Zangarmarschen und sprecht mit Numa Wolkenschwester."
Inst41Quest4_Location = "Urahne des Irdenen Rings (Bei den Freudenfeuern des Sonnenwendfests in allen großen Städten)"
Inst41Quest4_Note = "Numa Wolkenschwester befindet sich kurz nach dem Eingang der Sklavenunterkünfte. Dieses Quest wird nicht benötigt, um Ahune zu beschwören. Wenn man die Instanz auf Stufe 65 oder höher betritt, ohne auch nur eins dieser Quest abgeschlossen zu haben, kann man ihn trotzdem beschwören."
Inst41Quest4_Prequest = "Ja, Ungewöhnliche Aktivitäten -> Den Urahnen benachrichtigen"
Inst41Quest4_Folgequest = "Ja, Ahune ist hier!"
Inst41Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst41Quest5 = "5. Ahune ist hier! (Saisonbedingt)"
Inst41Quest5_Level = "70"
Inst41Quest5_Attain = "65"
Inst41Quest5_Aim = "Findet Luma Himmelsmutter in den Sklavenunterkünften."
Inst41Quest5_Location = "Numa Wolkenschwester (Die Sklavenunterkünfte; "..YELLOW.."Kurz nach dem Portal"..WHITE..")"
Inst41Quest5_Note = "Luma Himmelsmutter befindet sich in der Nähe von "..YELLOW.."[1]"..WHITE..". Man muss keines der anderen saisonbedingten Quests abschließen, um dieses Quest zu erhalten. Das Vorquest ist optional."
Inst41Quest5_Prequest = "Ja, Ahune der Frostfürst (Optional)"
Inst41Quest5_Folgequest = "Ja, Beschwört Ahune"
Inst41Quest5FQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst41Quest6 = "6. Beschwört Ahune (Tagesquest - Saisonbedingt)"
Inst41Quest6_Level = "70"
Inst41Quest6_Attain = "65"
Inst41Quest6_Aim = "Bringt dieses Magmatotem des Irdenen Rings zum Eisbrocken."
Inst41Quest6_Location = "Luma Himmelsmutter (Die Sklavenunterkünfte; "..YELLOW.."Nahe bei [1]"..WHITE..")"
Inst41Quest6_Note = "Der Eisbrocken befindet sich nur ein kurzes Stück von Luma Himmelsmutter entfernt. Durch Abschließen dieses Quests wird Ahune bei "..YELLOW.."[1]"..WHITE.." beschworen. Es kann einmal pro Tag pro Charakter abgeschlossen werden."
Inst41Quest6_Prequest = "Ja, Ahune ist hier!"
Inst41Quest6_Folgequest = "Nein"
Inst41Quest6FQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst41Quest7 = "7. Splitter von Ahune (Saisonbedingt)"
Inst41Quest7_Level = "70"
Inst41Quest7_Attain = "65"
Inst41Quest7_Aim = "Bringt die Eissplitter zu Luma Himmelsmutter."
Inst41Quest7_Location = "Splitter von Ahune (befinden sich in der Eiskiste nachdem Ahune getötet wurde)"
Inst41Quest7_Note = "Luma Himmelsmutter befindet sich in (Die Sklavenunterkünfte; "..YELLOW.."Nahe bei [1]"..WHITE.."). Dieser Gegenstand wird nur einmal pro Jahr pro Charakter droppen."
Inst41Quest7_Prequest = "Nein"
Inst41Quest7_Folgequest = "Nein"
--
Inst41Quest7name1 = "Wappenrock der sommerlichen Himmel"
Inst41Quest7name2 = "Wappenrock der Sommerflammen"
Inst41Quest7name3 = "Brandblüte"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst41Quest1_HORDE = Inst41Quest1
Inst41Quest1_HORDE_Level = Inst41Quest1_Level
Inst41Quest1_HORDE_Attain = Inst41Quest1_Attain
Inst41Quest1_HORDE_Aim = Inst41Quest1_Aim
Inst41Quest1_HORDE_Location = Inst41Quest1_Location
Inst41Quest1_HORDE_Note = Inst41Quest1_Note
Inst41Quest1_HORDE_Prequest = Inst41Quest1_Prequest
Inst41Quest1_HORDE_Folgequest = Inst41Quest1_Folgequest
Inst41Quest1PreQuest_HORDE = Inst41Quest1PreQuest
--
Inst41Quest1name1_HORDE = Inst41Quest1name1
Inst41Quest1name2_HORDE = Inst41Quest1name2
Inst41Quest1name3_HORDE = Inst41Quest1name3

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst41Quest2_HORDE = Inst41Quest2
Inst41Quest2_HORDE_Level = Inst41Quest2_Level
Inst41Quest2_HORDE_Attain = Inst41Quest2_Attain
Inst41Quest2_HORDE_Aim = Inst41Quest2_Aim
Inst41Quest2_HORDE_Location = Inst41Quest2_Location
Inst41Quest2_HORDE_Note = Inst41Quest2_Note
Inst41Quest2_HORDE_Prequest = Inst41Quest2_Prequest
Inst41Quest2_HORDE_Folgequest = Inst41Quest2_Folgequest
--
Inst41Quest2name1_HORDE = Inst41Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst41Quest3_HORDE = Inst41Quest3
Inst41Quest3_HORDE_Level = Inst41Quest3_Level
Inst41Quest3_HORDE_Attain = Inst41Quest3_Attain
Inst41Quest3_HORDE_Aim = Inst41Quest3_Aim
Inst41Quest3_HORDE_Location = Inst41Quest3_Location
Inst41Quest3_HORDE_Note = Inst41Quest3_Note
Inst41Quest3_HORDE_Prequest = Inst41Quest3_Prequest
Inst41Quest3_HORDE_Folgequest = Inst41Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst41Quest4_HORDE = Inst41Quest4
Inst41Quest4_HORDE_Level = Inst41Quest4_Level
Inst41Quest4_HORDE_Attain = Inst41Quest4_Attain
Inst41Quest4_HORDE_Aim = Inst41Quest4_Aim
Inst41Quest4_HORDE_Location = Inst41Quest4_Location
Inst41Quest4_HORDE_Note = Inst41Quest4_Note
Inst41Quest4_HORDE_Prequest = Inst41Quest4_Prequest
Inst41Quest4_HORDE_Folgequest = Inst41Quest4_Folgequest
Inst41Quest4PreQuest_HORDE = Inst41Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst41Quest5_HORDE = Inst41Quest5
Inst41Quest5_HORDE_Level = Inst41Quest5_Level
Inst41Quest5_HORDE_Attain = Inst41Quest5_Attain
Inst41Quest5_HORDE_Aim = Inst41Quest5_Aim
Inst41Quest5_HORDE_Location = Inst41Quest5_Location
Inst41Quest5_HORDE_Note = Inst41Quest5_Note
Inst41Quest5_HORDE_Prequest = Inst41Quest5_Prequest
Inst41Quest5_HORDE_Folgequest = Inst41Quest5_Folgequest
Inst41Quest5FQuest_HORDE = Inst41Quest5FQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst41Quest6_HORDE = Inst41Quest6
Inst41Quest6_HORDE_Level = Inst41Quest6_Level
Inst41Quest6_HORDE_Attain = Inst41Quest6_Attain
Inst41Quest6_HORDE_Aim = Inst41Quest6_Aim
Inst41Quest6_HORDE_Location = Inst41Quest6_Location
Inst41Quest6_HORDE_Note = Inst41Quest6_Note
Inst41Quest6_HORDE_Prequest = Inst41Quest6_Prequest
Inst41Quest6_HORDE_Folgequest = Inst41Quest6_Folgequest
Inst41Quest6FQuest_HORDE = Inst41Quest6FQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst41Quest7_HORDE = Inst41Quest7
Inst41Quest7_HORDE_Level = Inst41Quest7_Level
Inst41Quest7_HORDE_Attain = Inst41Quest7_Attain
Inst41Quest7_HORDE_Aim = Inst41Quest7_Aim
Inst41Quest7_HORDE_Location = Inst41Quest7_Location
Inst41Quest7_HORDE_Note = Inst41Quest7_Note
Inst41Quest7_HORDE_Prequest = Inst41Quest7_Prequest
Inst41Quest7_HORDE_Folgequest = Inst41Quest7_Folgequest
--
Inst41Quest7name1_HORDE = Inst41Quest7name1
Inst41Quest7name2_HORDE = Inst41Quest7name2
Inst41Quest7name3_HORDE = Inst41Quest7name3



--------------- INST42 - CR: The Steamvault (SV) ---------------

Inst42Story = "Die empfindliche Ökologie der Zangarmarschen wurde aus dem Gleichgewicht geworfen.\n\nUnnatürliche Phänomene beschädigen und zerstören die natürliche Pflanzen- und Tierwelt der Marschen.\n\nEiniges deutet darauf hin, dass diese Störungen ihren Ursprung im Echsenkessel haben.\n\nMan munkelt, dass der Anführer dieses mysteriösen Gebäudes niemand anders ist als die berüchtigte Lady Vashj.\n\nNur du kannst ihre ruchlosen Pläne entdecken und sie aufhalten, bevor es zu spät ist.\n\nDer Echsenkessel ist in vier Bereiche aufgeteilt, von denen drei Fünf-Spieler-Instanzen sind (die Sklavenunterkünfte, der Tiefensumpf, die Dampfkammer), dazu kommt die 25-Spieler-Instanz Höhle des Schlangenschreins. "
Inst42Caption = "EK: Die Dampfkammer"
Inst42QAA = "7 Quests"
Inst42QAH = "7 Quests"

--Quest 1 Alliance
Inst42Quest1 = "1. Das Versteck des Kriegsherren"
Inst42Quest1_Level = "70"
Inst42Quest1_Attain = "67"
Inst42Quest1_Aim = "Behüterin Jhang möchte, dass Ihr Kriegsherr Kalithresh im Echsenkessel findet und tötet."
Inst42Quest1_Location = "Behüterin Jhang (Echsenkessel; "..YELLOW.."52,36"..WHITE..")"
Inst42Quest1_Note = "Behüterin Jhang ist in der Unterwasserhöhle am Versammlungsstein. Kriegsherr Kalithresh befindet sich bei "..YELLOW.."[4]"..WHITE..". Denkt dran, die Tanks zu zerstören, wenn Kalithresh sie benutzt."
Inst42Quest1_Prequest = "Nein"
Inst42Quest1_Folgequest = "Nein"
--
Inst42Quest1name1 = "Kopfband des Wasserbeschwörers"
Inst42Quest1name2 = "Helm der Klaue"
Inst42Quest1name3 = "Kappe des Erdenwächters"
Inst42Quest1name4 = "Myrmidonenkopfputz"

--Quest 2 Alliance
Inst42Quest2 = "2. Befehle von Lady Vashj"
Inst42Quest2_Level = "70"
Inst42Quest2_Attain = "67"
Inst42Quest2_Aim = "Bringt die Befehle von Lady Vashj zu Ysiel Windsänger in der Zuflucht des Cenarius in den Zangarmarschen."
Inst42Quest2_Location = "Befehle von Lady Vashj (zufälliger Drop in der Dampfkammer)"
Inst42Quest2_Note = "Ysiel Windsänger befindet sich in den Zangarmarschen - Cenarion Refuge; ("..YELLOW.."78,62"..WHITE.."). Das Folgequest ermöglicht es, Waffen des Echsenkessels für Ruf bei der Expedition des Cenarius abzugeben. Waffen des Echsenkessels sind zufällige Dropps in der Dampfkammer und in der Höhle des Schlangenschreins und können gesammelt werden (ohne sie abgeben zu können), bevor man diese Quest hat. Sie sind nicht gebunden, also kann man mit ihnen handeln und sie von anderen Spielern erwerben."
Inst42Quest2_Prequest = "Nein"
Inst42Quest2_Folgequest = "Ja, Kriegsvorbereitungen"
-- No Rewards for this quest

--Quest 3 Alliance
Inst42Quest3 = "3. Die Prüfung der Naaru: Stärke (Heroisch)"
Inst42Quest3_Level = "70"
Inst42Quest3_Attain = "70"
Inst42Quest3_Aim = "A'dal in Shattrath möchte, dass Ihr Kalithreshs Dreizack und Murmurs Essenz besorgt."
Inst42Quest3_Location = "A'dal (Shattrath - Terrasse des Lichts; "..YELLOW.."53,43"..WHITE..")"
Inst42Quest3_Note = "Diese Aufgabe muss auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden. Kriegsherr Kalithresh befindet sich bei "..YELLOW.."[4]"..WHITE..". Murmurs Essenz droppt im Schattenlabyrinth.\n\nDiese Quest wurde benötigt, um die Festung der Stürme zu betreten, ist aber nicht mehr nötig."
Inst42Quest3_Prequest = "Nein"
Inst42Quest3_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Alliance
Inst42Quest4 = "4. Unterweltlehm"
Inst42Quest4_Level = "70"
Inst42Quest4_Attain = "70"
Inst42Quest4_Aim = "Beschafft Euch ein Gefäß mit Unterweltlehm von Hydromant Thespia und bringt es zu David Wayne in Waynes Zuflucht."
Inst42Quest4_Location = "David Wayne (Wälder von Terokkar - Waynes Zuflucht; "..YELLOW.."78,39"..WHITE..")"
Inst42Quest4_Note = "Hydromant Thespia befindet sich bei "..YELLOW.."[1]"..WHITE..".\n\nDer Gegenstand wird im heroischen Modus nicht droppen."
Inst42Quest4_Prequest = "Ja, Frisch von der Mechanar ("..YELLOW.."FdS: Die Mechanar"..WHITE..") & Encyclopaedia Daemonica ("..YELLOW.."Auch: Schattenlabyrinth"..WHITE..")"
Inst42Quest4_Folgequest = "Ja, Bann der Illidari"
Inst42Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst42Quest5 = "5. Das zweite und das dritte Fragment"
Inst42Quest5_Level = "70"
Inst42Quest5_Attain = "68"
Inst42Quest5_Aim = "Besorgt das zweite Schlüsselfragment aus einem arkanen Behälter im Echsenkessel und das dritte Schlüsselfragment aus einem arkanen Behälter in der Festung der Stürme. Kehrt dann zu Khadgar in Shattrath zurück."
Inst42Quest5_Location = "Khadgar (Shattrath - Terrasse des Lichts; "..YELLOW.."54,44"..WHITE..")"
Inst42Quest5_Note = "Teil der Karazhan-Vorquestreihe. Der arkane Behälter befindet sich bei "..YELLOW.."[2]"..WHITE.." auf dem Grund des Wassers. Wenn man ihn öffnet, erscheint ein Elementar, der getötet werden muss, um das Fragment zu erhalten. Das dritte Schlüsselfragment befindet sich in der Arkatraz."
Inst42Quest5_Prequest = "Ja, Nach Karazhan ("..YELLOW.."Auch: Schattenlabyrinth"..WHITE..")"
Inst42Quest5_Folgequest = "Ja, Die Berührung des Meisters ("..YELLOW.."HdZ: Der schwarze Morast"..WHITE..")"
Inst42Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst42Quest6 = "6. Gesucht: Myrmidonen des Echsenkessels (Tagesquest)"
Inst42Quest6_Level = "70"
Inst42Quest6_Attain = "70"
Inst42Quest6_Aim = "Netherpirscher Mah'duun hat Euch damit beauftragt, 14 Myrmidonen des Echsenkessels zu töten. Kehrt erst zu ihm in das untere Viertel in Shattrath zurück, wenn sie alle dem Tod überantwortet wurden."
Inst42Quest6_Location = "Netherpirscher Mah'duun (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst42Quest6_Note = "Dies ist ein Tagesquest."
Inst42Quest6_Prequest = "Nein"
Inst42Quest6_Folgequest = "Nein"
--
Inst42Quest6name1 = "Gefängnisschlüssel des Astraleums"

--Quest 7 Alliance
Inst42Quest7 = "7. Gesucht: Die Aufzeichnungen des Kriegsherren (Heroic Daily)"
Inst42Quest7_Level = "70"
Inst42Quest7_Attain = "70"
Inst42Quest7_Aim = "Windhändler Zhareem hat Euch darum gebeten, ihm die Aufzeichnungen des Kriegsherren zu beschaffen. Bringt sie zu ihm ins untere Viertel in Shattrath, um Eure Belohnung zu erhalten."
Inst42Quest7_Location = "Windhändler Zhareem (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst42Quest7_Note = "Diese Aufgabe muss auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden.\n\nKriegsherr Kalithresh befindet sich bei "..YELLOW.."[4]"..WHITE.."."
Inst42Quest7_Prequest = "Nein"
Inst42Quest7_Folgequest = "Nein"
--
Inst42Quest7name1 = "Abzeichen der Gerechtigkeit"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst42Quest1_HORDE = Inst42Quest1
Inst42Quest1_HORDE_Level = Inst42Quest1_Level
Inst42Quest1_HORDE_Attain = Inst42Quest1_Attain
Inst42Quest1_HORDE_Aim = Inst42Quest1_Aim
Inst42Quest1_HORDE_Location = Inst42Quest1_Location
Inst42Quest1_HORDE_Note = Inst42Quest1_Note
Inst42Quest1_HORDE_Prequest = Inst42Quest1_Prequest
Inst42Quest1_HORDE_Folgequest = Inst42Quest1_Folgequest
--
Inst42Quest1name1_HORDE = Inst42Quest1name1
Inst42Quest1name2_HORDE = Inst42Quest1name2
Inst42Quest1name3_HORDE = Inst42Quest1name3
Inst42Quest1name4_HORDE = Inst42Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst42Quest2_HORDE = Inst42Quest2
Inst42Quest2_HORDE_Level = Inst42Quest2_Level
Inst42Quest2_HORDE_Attain = Inst42Quest2_Attain
Inst42Quest2_HORDE_Aim = Inst42Quest2_Aim
Inst42Quest2_HORDE_Location = Inst42Quest2_Location
Inst42Quest2_HORDE_Note = Inst42Quest2_Note
Inst42Quest2_HORDE_Prequest = Inst42Quest2_Prequest
Inst42Quest2_HORDE_Folgequest = Inst42Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst42Quest3_HORDE = Inst42Quest3
Inst42Quest3_HORDE_Level = Inst42Quest3_Level
Inst42Quest3_HORDE_Attain = Inst42Quest3_Attain
Inst42Quest3_HORDE_Aim = Inst42Quest3_Aim
Inst42Quest3_HORDE_Location = Inst42Quest3_Location
Inst42Quest3_HORDE_Note = Inst42Quest3_Note
Inst42Quest3_HORDE_Prequest = Inst42Quest3_Prequest
Inst42Quest3_HORDE_Folgequest = Inst42Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst42Quest4_HORDE = Inst42Quest4
Inst42Quest4_HORDE_Level = Inst42Quest4_Level
Inst42Quest4_HORDE_Attain = Inst42Quest4_Attain
Inst42Quest4_HORDE_Aim = Inst42Quest4_Aim
Inst42Quest4_HORDE_Location = Inst42Quest4_Location
Inst42Quest4_HORDE_Note = Inst42Quest4_Note
Inst42Quest4_HORDE_Prequest = Inst42Quest4_Prequest
Inst42Quest4_HORDE_Folgequest = Inst42Quest4_Folgequest
Inst42Quest4PreQuest_HORDE = Inst42Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst42Quest5_HORDE = Inst42Quest5
Inst42Quest5_HORDE_Level = Inst42Quest5_Level
Inst42Quest5_HORDE_Attain = Inst42Quest5_Attain
Inst42Quest5_HORDE_Aim = Inst42Quest5_Aim
Inst42Quest5_HORDE_Location = Inst42Quest5_Location
Inst42Quest5_HORDE_Note = Inst42Quest5_Note
Inst42Quest5_HORDE_Prequest = Inst42Quest5_Prequest
Inst42Quest5_HORDE_Folgequest = Inst42Quest5_Folgequest
Inst42Quest5PreQuest_HORDE = Inst42Quest5PreQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst42Quest6_HORDE = Inst42Quest6
Inst42Quest6_HORDE_Level = Inst42Quest6_Level
Inst42Quest6_HORDE_Attain = Inst42Quest6_Attain
Inst42Quest6_HORDE_Aim = Inst42Quest6_Aim
Inst42Quest6_HORDE_Location = Inst42Quest6_Location
Inst42Quest6_HORDE_Note = Inst42Quest6_Note
Inst42Quest6_HORDE_Prequest = Inst42Quest6_Prequest
Inst42Quest6_HORDE_Folgequest = Inst42Quest6_Folgequest
--
Inst42Quest6name1_HORDE = Inst42Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst42Quest7_HORDE = Inst42Quest7
Inst42Quest7_HORDE_Level = Inst42Quest7_Level
Inst42Quest7_HORDE_Attain = Inst42Quest7_Attain
Inst42Quest7_HORDE_Aim = Inst42Quest7_Aim
Inst42Quest7_HORDE_Location = Inst42Quest7_Location
Inst42Quest7_HORDE_Note = Inst42Quest7_Note
Inst42Quest7_HORDE_Prequest = Inst42Quest7_Prequest
Inst42Quest7_HORDE_Folgequest = Inst42Quest7_Folgequest
--
Inst42Quest7name1_HORDE = Inst42Quest7name1



--------------- INST43 - CR: The Underbog (UB) ---------------

Inst43Story = "Die empfindliche Ökologie der Zangarmarschen wurde aus dem Gleichgewicht geworfen.\n\nUnnatürliche Phänomene beschädigen und zerstören die natürliche Pflanzen- und Tierwelt der Marschen.\n\nEiniges deutet darauf hin, dass diese Störungen ihren Ursprung im Echsenkessel haben.\n\nMan munkelt, dass der Anführer dieses mysteriösen Gebäudes niemand anders ist als die berüchtigte Lady Vashj.\n\nNur du kannst ihre ruchlosen Pläne entdecken und sie aufhalten, bevor es zu spät ist.\n\nDer Echsenkessel ist in vier Bereiche aufgeteilt, von denen drei Fünf-Spieler-Instanzen sind (die Sklavenunterkünfte, der Tiefensumpf, die Dampfkammer), dazu kommt die 25-Spieler-Instanz Höhle des Schlangenschreins. "
Inst43Caption = "EK: Der Tiefensumpf"
Inst43QAA = "5 Quests"
Inst43QAH = "5 Quests"

--Quest 1 Alliance
Inst43Quest1 = "1. Bei der Arbeit verschollen"
Inst43Quest1_Level = "65"
Inst43Quest1_Attain = "62"
Inst43Quest1_Aim = "Findet heraus, was mit Erdbinder Rayge, Naturalist Biss, Jäter Gründaum und Windrufer Klaue geschehen ist. Kehrt dann zu Behüterin Jhang im Echsenkessel in den Zangarmarschen zurück."
Inst43Quest1_Location = "Behüterin Jhang (Echsenkessel; "..YELLOW.."52,36"..WHITE..")"
Inst43Quest1_Note = "Behüterin Jhang ist in der Unterwasserhöhle am Versammlungsstein. Erdbinder Rayge befindet sich bei "..YELLOW.."[3]"..WHITE..", Windrufer Klaue befindet sich bei "..YELLOW.."[4]"..WHITE..", die anderen beiden in den Sklavenunterkünften. Die Vorquests scheinen nicht nötig zu sein, um diese Quest zu erhalten."
Inst43Quest1_Prequest = "Ja, Kanalisationspläne -> Fehlgeschlagene Operation"
Inst43Quest1_Folgequest = "Nein"
Inst43Quest1PreQuest = "true"
--
Inst43Quest1name1 = "Cenarischer Ring des Zauberwirkens"
Inst43Quest1name2 = "Goldrankenwickeltücher"
Inst43Quest1name3 = "Dunkler Umhang der Marschen"

--Quest 2 Alliance
Inst43Quest2 = "2. Los geht's!"
Inst43Quest2_Level = "65"
Inst43Quest2_Attain = "63"
Inst43Quest2_Aim = "Besorgt einen Tiefensporendorn und bringt ihn zu T'shu in Sporeggar in den Zangarmarschen."
Inst43Quest2_Location = "T'shu (Zangarmarschen - Sporeggar; "..YELLOW.."19,49"..WHITE..")"
Inst43Quest2_Note = "Du musst neutral bei den Sporeggar sein, um diese Quest zu erhalten. Der Tiefensporndorn befindet sich direkt hinter Hungarfenn bei "..YELLOW.."[1]"..WHITE.."."
Inst43Quest2_Prequest = "Nein"
Inst43Quest2_Folgequest = "Nein"
--
Inst43Quest2name1 = "Unvergänglicher Tiefensporenfarn"

--Quest 3 Alliance
Inst43Quest3 = "3. Tötet die Mutter"
Inst43Quest3_Level = "65"
Inst43Quest3_Attain = "63"
Inst43Quest3_Aim = "Bringt das Gehirn der Schattenmutter zu Khn'nix in Sporeggar in den Zangarmarschen."
Inst43Quest3_Location = "Khn'nix (Zangarmarschen - Sporeggar; "..YELLOW.."19,49"..WHITE..")"
Inst43Quest3_Note = "Du musst neutral bei den Sporeggar sein, um diese Quest zu erhalten. Die Schattenmutter befindet sich bei "..YELLOW.."[5]"..WHITE.."."
Inst43Quest3_Prequest = "Nein"
Inst43Quest3_Folgequest = "Nein"
--
Inst43Quest3name1 = "Mit Essenz erfüllter Pilz"
Inst43Quest3name2 = "Mit Macht erfüllter Pilz"

--Quest 4 Alliance
Inst43Quest4 = "4. Gesucht: Ei der Schattenmutter (Heroisches Tagesquest)"
Inst43Quest4_Level = "70"
Inst43Quest4_Attain = "70"
Inst43Quest4_Aim = "Windhändler Zhareem hat Euch darum gebeten, ihm ein Ei der Schattenmutter zu beschaffen. Bringt es zu ihm ins untere Viertel in Shattrath, um Eure Belohnung zu erhalten."
Inst43Quest4_Location = "Windhändler Zhareem (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst43Quest4_Note = "Diese Aufgabe muss auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden.\n\nDie Schattenmutter befindet sich bei "..YELLOW.."[5]"..WHITE.."."
Inst43Quest4_Prequest = "Nein"
Inst43Quest4_Folgequest = "Nein"
--
Inst43Quest4name1 = "Abzeichen der Gerechtigkeit"

--Quest 5 Alliance
Inst43Quest5 = "5. Bringt mir ein Gebüsch!"
Inst43Quest5_Level = "65"
Inst43Quest5_Attain = "63"
Inst43Quest5_Aim = "Sammelt 5 Stück Bluthibiskus und bringt sie zu Gzhun'tt in Sporeggar in den Zangarmarschen."
Inst43Quest5_Location = "Gzhun'tt (Zangarmarschen - Sporeggar; "..YELLOW.."19,50"..WHITE..")"
Inst43Quest5_Note = "Man muss neutral zu Sporeggar sein, um dieses Quest annehmen zu können. Das Folgequest ist wiederholbar und gibt jedes mal 750 Sporeggar Rufpunkte. Die Bluthibiskusse sind in der Instanz in der Nähe von Pflanzen verteilt und droppen auch von Sumpf Gegnern, auch von denen in der Dampfkammer. Sie können aber eventuell auch im Auktionshaus gefunden werden."
Inst43Quest5_Prequest = "Nein"
Inst43Quest5_Folgequest = "Ja, Bringt mir ein weiteres Gebüsch!"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst43Quest1_HORDE = Inst43Quest1
Inst43Quest1_HORDE_Level = Inst43Quest1_Level
Inst43Quest1_HORDE_Attain = Inst43Quest1_Attain
Inst43Quest1_HORDE_Aim = Inst43Quest1_Aim
Inst43Quest1_HORDE_Location = Inst43Quest1_Location
Inst43Quest1_HORDE_Note = Inst43Quest1_Note
Inst43Quest1_HORDE_Prequest = Inst43Quest1_Prequest
Inst43Quest1_HORDE_Folgequest = Inst43Quest1_Folgequest
Inst43Quest1PreQuest_HORDE = Inst43Quest1PreQuest
--
Inst43Quest1name1_HORDE = Inst43Quest1name1
Inst43Quest1name2_HORDE = Inst43Quest1name2
Inst43Quest1name3_HORDE = Inst43Quest1name3

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst43Quest2_HORDE = Inst43Quest2
Inst43Quest2_HORDE_Level = Inst43Quest2_Level
Inst43Quest2_HORDE_Attain = Inst43Quest2_Attain
Inst43Quest2_HORDE_Aim = Inst43Quest2_Aim
Inst43Quest2_HORDE_Location = Inst43Quest2_Location
Inst43Quest2_HORDE_Note = Inst43Quest2_Note
Inst43Quest2_HORDE_Prequest = Inst43Quest2_Prequest
Inst43Quest2_HORDE_Folgequest = Inst43Quest2_Folgequest
--
Inst43Quest2name1_HORDE = Inst43Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst43Quest3_HORDE = Inst43Quest3
Inst43Quest3_HORDE_Level = Inst43Quest3_Level
Inst43Quest3_HORDE_Attain = Inst43Quest3_Attain
Inst43Quest3_HORDE_Aim = Inst43Quest3_Aim
Inst43Quest3_HORDE_Location = Inst43Quest3_Location
Inst43Quest3_HORDE_Note = Inst43Quest3_Note
Inst43Quest3_HORDE_Prequest = Inst43Quest3_Prequest
Inst43Quest3_HORDE_Folgequest = Inst43Quest3_Folgequest
--
Inst43Quest3name1_HORDE = Inst43Quest3name1
Inst43Quest3name2_HORDE = Inst43Quest3name2

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst43Quest4_HORDE = Inst43Quest4
Inst43Quest4_HORDE_Level = Inst43Quest4_Level
Inst43Quest4_HORDE_Attain = Inst43Quest4_Attain
Inst43Quest4_HORDE_Aim = Inst43Quest4_Aim
Inst43Quest4_HORDE_Location = Inst43Quest4_Location
Inst43Quest4_HORDE_Note = Inst43Quest4_Note
Inst43Quest4_HORDE_Prequest = Inst43Quest4_Prequest
Inst43Quest4_HORDE_Folgequest = Inst43Quest4_Folgequest
--
Inst43Quest4name1_HORDE = Inst43Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst43Quest5_HORDE = Inst43Quest5
Inst43Quest5_HORDE_Level = Inst43Quest5_Level
Inst43Quest5_HORDE_Attain = Inst43Quest5_Attain
Inst43Quest5_HORDE_Aim = Inst43Quest5_Aim
Inst43Quest5_HORDE_Location = Inst43Quest5_Location
Inst43Quest5_HORDE_Note = Inst43Quest5_Note
Inst43Quest5_HORDE_Prequest = Inst43Quest5_Prequest
Inst43Quest5_HORDE_Folgequest = Inst43Quest5_Folgequest
-- No Rewards for this quest



--------------- INST44 - Auchindoun: Auchenai Crypts (AC) ---------------

Inst44Story = "Seit Tausenden von Jahren haben die Draenei ihre Toten in Auchindoun, ihrem heiligsten Tempel, begraben.\n\nDoch Agenten des Schattenrats sind in ihn eingedrungen, dazu entschlossen, eine entsetzliche Kreatur von gewaltigem Übel zu beschwören.\n\nIhre abscheulichen magischen Taten führten zu einer gewaltigen Explosion, die den Tempel auseinandergerissen und die Umgebung in ein verkohltes Ödland verwandelt hat.\n\nDie Druckwelle verursachte zusätzlich einen Riss im Nether selbst, so dass jenseitige Astrale in die Scherbenwelt gelockt wurden.\n\nDie begrabenen Draenei durchwandern nun die Ruinen als ruhelose Geister.\n\nUnterdessen droht das vom Schattenrat beschworene entsetzliche Gebilde, ihre Bemühungen, es im Zaum zu halten, zu übermannen.\n\nDu musst dieses Böse davon abhalten, auf dieser ahnungslosen Welt freigesetzt zu werden.\n\nAuchindoun ist in vier Flügel aufgeteilt und für Gruppen von fünf Spielern der Stufen 64-70 vorgesehen."
Inst44Caption = "Auch: Auchenaikrypta"
Inst44QAA = "2 Quest"
Inst44QAH = "4 Quests"

--Quest 1 Alliance
Inst44Quest1 = "1. Alles wird gut"
Inst44Quest1_Level = "67"
Inst44Quest1_Attain = "64"
Inst44Quest1_Aim = "Großvater Aldrimus außerhalb der Auchenaikrypta von Auchindoun möchte, dass Ihr in die Auchenaikrypta geht und Exarch Maladaar vernichtet."
Inst44Quest1_Location = "Großvater Aldrimus (Wälder von Terokkar; "..YELLOW.."35,65"..WHITE..")"
Inst44Quest1_Note = "Exarch Maladarr befindet sich bei "..YELLOW.."[2]"..WHITE..". Die Vorquestreihe startet bei Ha'lei (Wälder von Terokkar - Auchindoun; "..YELLOW.."35,65"..WHITE..")."
Inst44Quest1_Prequest = "Ja, Ich sehe tote Draenei -> Levixus der Seelenrufer"
Inst44Quest1_Folgequest = "Nein"
Inst44Quest1PreQuest = "true"
--
Inst44Quest1name1 = "Anachoretenrobe der Auchenai"
Inst44Quest1name2 = "Mönchstunika der Auchenai"
Inst44Quest1name3 = "Fährtenleserhalsberge der Auchenai"
Inst44Quest1name4 = "Schutz des Exarchen"

--Quest 2 Alliance
Inst44Quest2 = "2. Gesucht: Der Seelenedelstein des Exarchen (Heroisches Tagesquest)"
Inst44Quest2_Level = "70"
Inst44Quest2_Attain = "70"
Inst44Quest2_Aim = "Windhändler Zhareem hat Euch darum gebeten, ihm den Seelenedelstein des Exarchen zu beschaffen. Bringt diesen zu ihm ins untere Viertel in Shattrath, um Eure Belohnung zu erhalten."
Inst44Quest2_Location = "Windhändler Zhareem (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst44Quest2_Note = "Diese Aufgabe muss auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden.\n\nExarch Maladaar befindet sich bei "..YELLOW.."[2]"..WHITE.."."
Inst44Quest2_Prequest = "Nein"
Inst44Quest2_Folgequest = "Nein"
--
Inst44Quest2name1 = "Abzeichen der Gerechtigkeit"


--Quest 1 Horde
Inst44Quest1_HORDE = "1. Auchindoun..."
Inst44Quest1_HORDE_Level = "68"
Inst44Quest1_HORDE_Attain = "66"
Inst44Quest1_HORDE_Aim = "Reist zur Auchenaikrypta in der Knochenwüste der Wälder von Terokkar und tötet Exarch Maladaar um den Geist von D'ore zu befreien."
Inst44Quest1_HORDE_Location = "A'dal (Shattrath - Terrasse des Lichts; "..YELLOW.."53,43"..WHITE..")"
Inst44Quest1_HORDE_Note = "Exarch Maladarr befindet sich bei "..YELLOW.."[2]"..WHITE..". D'ore erscheint, wenn Exarch Maladarr getötet wurde."
Inst44Quest1_HORDE_Prequest = "Ja, Ein Besuch bei der Großmutter -> Ein gelüftetes Geheimnis"
Inst44Quest1_HORDE_Folgequest = "Ja, Was die Seele sieht"
Inst44Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst44Quest2_HORDE = "2. Was die Seele sieht"
Inst44Quest2_HORDE_Level = "68"
Inst44Quest2_HORDE_Attain = "66"
Inst44Quest2_HORDE_Aim = "Sucht einen Seelenspiegel in der Auchenaikrypta und benutzt ihn, um einen getrübten Geist eines uralten Orcahnen zu rufen. Zerstört 15 getrübte Geister, damit die Ahnen in Frieden ruhen können."
Inst44Quest2_HORDE_Location = "D'ore (Auchenaikrypta; "..YELLOW.."[2]"..WHITE..")."
Inst44Quest2_HORDE_Note = "D'ore erscheint, wenn Exarch Maladarr getötet wurde. Mutter Kashur befindet sich bei (Nagrand; "..YELLOW.."26,61"..WHITE.."). Man sollte in einer Gruppe aus 3 oder mehr Spielern sein, bevor man die getrübten Geister anspricht."
Inst44Quest2_HORDE_Prequest = "Ja, Auchindoun..."
Inst44Quest2_HORDE_Folgequest = "Ja, Rückkehr zur Großmutter"
Inst44Quest2FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 1 Alliance)
Inst44Quest3_HORDE = "3. Alles wird gut"
Inst44Quest3_HORDE_Level = Inst44Quest1_Level
Inst44Quest3_HORDE_Attain = Inst44Quest1_Attain
Inst44Quest3_HORDE_Aim = Inst44Quest1_Aim
Inst44Quest3_HORDE_Location = Inst44Quest1_Location
Inst44Quest3_HORDE_Note = Inst44Quest1_Note
Inst44Quest3_HORDE_Prequest = Inst44Quest1_Prequest
Inst44Quest3_HORDE_Folgequest = Inst44Quest1_Folgequest
Inst44Quest3PreQuest_HORDE = Inst44Quest1PreQuest
--
Inst44Quest3name1_HORDE = Inst44Quest1name1
Inst44Quest3name2_HORDE = Inst44Quest1name2
Inst44Quest3name3_HORDE = Inst44Quest1name3
Inst44Quest3name4_HORDE = Inst44Quest1name4

--Quest 4 Horde  (same as Quest 2 Alliance)
Inst44Quest4_HORDE = "4. Gesucht: Der Seelenedelstein des Exarchen (Heroisches Tagesquest)"
Inst44Quest4_HORDE_Level = Inst44Quest2_Level
Inst44Quest4_HORDE_Attain = Inst44Quest2_Attain
Inst44Quest4_HORDE_Aim = Inst44Quest2_Aim
Inst44Quest4_HORDE_Location = Inst44Quest2_Location
Inst44Quest4_HORDE_Note = Inst44Quest2_Note
Inst44Quest4_HORDE_Prequest = Inst44Quest2_Prequest
Inst44Quest4_HORDE_Folgequest = Inst44Quest2_Folgequest
--
Inst44Quest4name1_HORDE = Inst44Quest2name1



--------------- INST45 - Auchindoun: Mana Tombs (MT) ---------------

Inst45Story = "Seit Tausenden von Jahren haben die Draenei ihre Toten in Auchindoun, ihrem heiligsten Tempel, begraben.\n\nDoch Agenten des Schattenrats sind in ihn eingedrungen, dazu entschlossen, eine entsetzliche Kreatur von gewaltigem Übel zu beschwören.\n\nIhre abscheulichen magischen Taten führten zu einer gewaltigen Explosion, die den Tempel auseinandergerissen und die Umgebung in ein verkohltes Ödland verwandelt hat.\n\nDie Druckwelle verursachte zusätzlich einen Riss im Nether selbst, so dass jenseitige Astrale in die Scherbenwelt gelockt wurden.\n\nDie begrabenen Draenei durchwandern nun die Ruinen als ruhelose Geister.\n\nUnterdessen droht das vom Schattenrat beschworene entsetzliche Gebilde, ihre Bemühungen, es im Zaum zu halten, zu übermannen.\n\nDu musst dieses Böse davon abhalten, auf dieser ahnungslosen Welt freigesetzt zu werden.\n\nAuchindoun ist in vier Flügel aufgeteilt und für Gruppen von fünf Spielern der Stufen 64-70 vorgesehen."
Inst45Caption = "Auch: Managruft"
Inst45QAA = "5 Quests"
Inst45QAH = "5 Quests"

--Quest 1 Alliance
Inst45Quest1 = "1. Sicherheit geht vor"
Inst45Quest1_Level = "66"
Inst45Quest1_Attain = "64"
Inst45Quest1_Aim = "Konstrukteur Morphalius möchte, dass Ihr 10 astrale Grufträuber, 5 astrale Zauberer, 5 Nexuswandler und 5 astrale Zauberbinder tötet."
Inst45Quest1_Location = "Konstrukteur Morphalius (Wälder von Terokkar - Auchindoun; "..YELLOW.."39,58"..WHITE..")"
Inst45Quest1_Note = "Das Bedienfeld des astralen Transporters befindet sich bei "..YELLOW.."[4]"..WHITE.."."
Inst45Quest1_Prequest = "Nein"
Inst45Quest1_Folgequest = "Ja, Jemandes Arbeit zahlt sich aus"
-- No Rewards for this quest

--Quest 2 Alliance
Inst45Quest2 = "2. Jemandes Arbeit zahlt sich aus"
Inst45Quest2_Level = "66"
Inst45Quest2_Attain = "64"
Inst45Quest2_Aim = "Begleitet Kryoingenieur Sha'heen sicher durch die Managruft, damit er die Astralmaterie aus Shaffars Astralsammlern entnehmen kann."
Inst45Quest2_Location = "Kryoingenieur Sha'heen (Managruft; "..YELLOW.."[4]"..WHITE..")"
Inst45Quest2_Note = "Um Kryoingenieur Sha'heen zu beschwören, muss das Bedienfeld des astralen Transporters bei "..YELLOW.."[4]"..WHITE.." aktiviert werden. Er wird zusammen mit einigen anderen freundlichen Konsortium-NPCs erscheinen. Die komplette Instanz sollte vorher gesäubert worden sein. Lass nichts am Leben. Die Begleitquest kann nur einmal pro Instanz gestartet werden."
Inst45Quest2_Prequest = "Ja, Sicherheit geht vor"
Inst45Quest2_Folgequest = "Nein"
Inst45Quest2FQuest = "true"
--
Inst45Quest2name1 = "Wickeltuch des Konsortiumprinzen"
Inst45Quest2name2 = "Kryohandschuhe"
Inst45Quest2name3 = "Konsortiummantelung der Phasen"
Inst45Quest2name4 = "Metallschienbeinschützer der Fleischbestie"

--Quest 3 Alliance
Inst45Quest3 = "3. Die Konkurrenz untergraben"
Inst45Quest3_Level = "66"
Inst45Quest3_Attain = "64"
Inst45Quest3_Aim = "Nexusprinz Haramad außerhalb der Managruft möchte, dass Ihr Nexusprinz Shaffar tötet und ihm Shaffars Bandagen bringt."
Inst45Quest3_Location = "Nexusprinz Haramad (Wälder von Terokkar - Auchindoun; "..YELLOW.."39,58"..WHITE..")."
Inst45Quest3_Note = "Nexusprinz Shaffar befindet sich bei "..YELLOW.."[5]"..WHITE.."."
Inst45Quest3_Prequest = "No"
Inst45Quest3_Folgequest = "No"
--
Inst45Quest3name1 = "Haramads Gamaschen der dritten Münze"
Inst45Quest3name2 = "Plattenbeinschützer des Konsortiums"
Inst45Quest3name3 = "Haramads Beinwickel"
Inst45Quest3name4 = "Haramads gekettelte Pantalons"

--Quest 4 Alliance
Inst45Quest4 = "4. Stasiskammern der Managruft (Heroisch)"
Inst45Quest4_Level = "70"
Inst45Quest4_Attain = "70"
Inst45Quest4_Aim = "Das Bild von Kommandant Ameer beim Landeplatz von Bash'ir im Schergrat möchte, dass Ihr den Stasiskammerschlüssel der Managruft verwendet, um die Stasiskammer in der Managruft Auchindouns zu öffnen."
Inst45Quest4_Location = "Bild von Kommandant Ameer (Schergrat - Landeplatz von Bash'ir; "..YELLOW.."52,15"..WHITE..")."
Inst45Quest4_Note = "Diese Aufgabe kann nur auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden. Es gibt zwei Stasiskammern. Die erste befindet sich direkt hinter Pandemonius "..YELLOW.."[1]"..WHITE..", die zweite im Raum von Nexusprinz Shaffar "..YELLOW.."[5]"..WHITE..". Für beide wird ein Abzeichen des Nexuskönigs benötigt."
Inst45Quest4_Prequest = "Ja, Das Abzeichen des Nexuskönigs"
Inst45Quest4_Folgequest = "Nein"
Inst45Quest4PreQuest = "true"
--
Inst45Quest4name1 = "Abzeichen der Gerechtigkeit"

--Quest 5 Alliance
Inst45Quest5 = "5. Gesucht: Shaffars wundersames Amulett (Heroisches Tagesquest)"
Inst45Quest5_Level = "70"
Inst45Quest5_Attain = "70"
Inst45Quest5_Aim = "Windhändler Zhareem hat Euch darum gebeten, ihm Shaffars wundersames Amulett zu beschaffen. Bringt es zu ihm ins untere Viertel in Shattrath, um Eure Belohnung zu erhalten."
Inst45Quest5_Location = "Windhändler Zhareem (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst45Quest5_Note = "Diese Aufgabe muss auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden.\n\nNexusprinz Shaffar befindet sich bei "..YELLOW.."[5]"..WHITE.."."
Inst45Quest5_Prequest = "Nein"
Inst45Quest5_Folgequest = "Nein"
--
Inst45Quest5name1 = "Abzeichen der Gerechtigkeit"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst45Quest1_HORDE = Inst45Quest1
Inst45Quest1_HORDE_Level = Inst45Quest1_Level
Inst45Quest1_HORDE_Attain = Inst45Quest1_Attain
Inst45Quest1_HORDE_Aim = Inst45Quest1_Aim
Inst45Quest1_HORDE_Location = Inst45Quest1_Location
Inst45Quest1_HORDE_Note = Inst45Quest1_Note
Inst45Quest1_HORDE_Prequest = Inst45Quest1_Prequest
Inst45Quest1_HORDE_Folgequest = Inst45Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst45Quest2_HORDE = Inst45Quest2
Inst45Quest2_HORDE_Level = Inst45Quest2_Level
Inst45Quest2_HORDE_Attain = Inst45Quest2_Attain
Inst45Quest2_HORDE_Aim = Inst45Quest2_Aim
Inst45Quest2_HORDE_Location = Inst45Quest2_Location
Inst45Quest2_HORDE_Note = Inst45Quest2_Note
Inst45Quest2_HORDE_Prequest = Inst45Quest2_Prequest
Inst45Quest2_HORDE_Folgequest = Inst45Quest2_Folgequest
Inst45Quest2FQuest_HORDE = Inst45Quest2FQuest
--
Inst45Quest2name1_HORDE = Inst45Quest2name1
Inst45Quest2name2_HORDE = Inst45Quest2name2
Inst45Quest2name3_HORDE = Inst45Quest2name3
Inst45Quest2name4_HORDE = Inst45Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst45Quest3_HORDE = Inst45Quest3
Inst45Quest3_HORDE_Level = Inst45Quest3_Level
Inst45Quest3_HORDE_Attain = Inst45Quest3_Attain
Inst45Quest3_HORDE_Aim = Inst45Quest3_Aim
Inst45Quest3_HORDE_Location = Inst45Quest3_Location
Inst45Quest3_HORDE_Note = Inst45Quest3_Note
Inst45Quest3_HORDE_Prequest = Inst45Quest3_Prequest
Inst45Quest3_HORDE_Folgequest = Inst45Quest3_Folgequest
--
Inst45Quest3name1_HORDE = Inst45Quest3name1
Inst45Quest3name2_HORDE = Inst45Quest3name2
Inst45Quest3name3_HORDE = Inst45Quest3name3
Inst45Quest3name4_HORDE = Inst45Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst45Quest4_HORDE = Inst45Quest4
Inst45Quest4_HORDE_Level = Inst45Quest4_Level
Inst45Quest4_HORDE_Attain = Inst45Quest4_Attain
Inst45Quest4_HORDE_Aim = Inst45Quest4_Aim
Inst45Quest4_HORDE_Location = Inst45Quest4_Location
Inst45Quest4_HORDE_Note = Inst45Quest4_Note
Inst45Quest4_HORDE_Prequest = Inst45Quest4_Prequest
Inst45Quest4_HORDE_Folgequest = Inst45Quest4_Folgequest
Inst45Quest4PreQuest_HORDE = Inst45Quest4PreQuest
--
Inst45Quest4name1_HORDE = Inst45Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst45Quest5_HORDE = Inst45Quest5
Inst45Quest5_HORDE_Level = Inst45Quest5_Level
Inst45Quest5_HORDE_Attain = Inst45Quest5_Attain
Inst45Quest5_HORDE_Aim = Inst45Quest5_Aim
Inst45Quest5_HORDE_Location = Inst45Quest5_Location
Inst45Quest5_HORDE_Note = Inst45Quest5_Note
Inst45Quest5_HORDE_Prequest = Inst45Quest5_Prequest
Inst45Quest5_HORDE_Folgequest = Inst45Quest5_Folgequest
--
Inst45Quest5name1_HORDE = Inst45Quest5name1



--------------- INST46 - Auchindoun: Sethekk Halls (Seth) ---------------

Inst46Story = "Seit Tausenden von Jahren haben die Draenei ihre Toten in Auchindoun, ihrem heiligsten Tempel, begraben.\n\nDoch Agenten des Schattenrats sind in ihn eingedrungen, dazu entschlossen, eine entsetzliche Kreatur von gewaltigem Übel zu beschwören.\n\nIhre abscheulichen magischen Taten führten zu einer gewaltigen Explosion, die den Tempel auseinandergerissen und die Umgebung in ein verkohltes Ödland verwandelt hat.\n\nDie Druckwelle verursachte zusätzlich einen Riss im Nether selbst, so dass jenseitige Astrale in die Scherbenwelt gelockt wurden.\n\nDie begrabenen Draenei durchwandern nun die Ruinen als ruhelose Geister.\n\nUnterdessen droht das vom Schattenrat beschworene entsetzliche Gebilde, ihre Bemühungen, es im Zaum zu halten, zu übermannen.\n\nDu musst dieses Böse davon abhalten, auf dieser ahnungslosen Welt freigesetzt zu werden.\n\nAuchindoun ist in vier Flügel aufgeteilt und für Gruppen von fünf Spielern der Stufen 64-70 vorgesehen."
Inst46Caption = "Auch: Sethekkhallen"
Inst46QAA = "5 Quests"
Inst46QAH = "5 Quests"

--Quest 1 Alliance
Inst46Quest1 = "1. Bruder gegen Bruder"
Inst46Quest1_Level = "69"
Inst46Quest1_Attain = "65"
Inst46Quest1_Aim = "Tötet Dunkelwirker Syth in den Sethekkhallen und befreit Lakka. Kehrt zu Isfar außerhalb der Sethekkhallen zurück, wenn Ihr die Aufgabe abgeschlossen habt."
Inst46Quest1_Location = "Isfar (Wälder von Terokkar - Auchindoun; "..YELLOW.."44,65"..WHITE..")"
Inst46Quest1_Note = "Dunkelwirker Syth befindet sich bei "..YELLOW.."[1]"..WHITE..". Lakka ist in einem Käfig in demselben Raum. Wenn man ihren Käfig öffnet, erscheinen keine Gegner."
Inst46Quest1_Prequest = "Nein"
Inst46Quest1_Folgequest = "Nein"
--
Inst46Quest1name1 = "Prophetenhalsring der Sethekk"
Inst46Quest1name2 = "Orakelfokus der Sethekk"
Inst46Quest1name3 = "Halsband des Klauenlords"
Inst46Quest1name4 = "Mal des Rabenwächters"

--Quest 2 Alliance
Inst46Quest2 = "2. Terokks Erbe"
Inst46Quest2_Level = "69"
Inst46Quest2_Attain = "65"
Inst46Quest2_Aim = "Bringt Terokks Maske, Terokks Federkiel und die Sage von Terokk zu Isfar außerhalb der Sethekkhallen."
Inst46Quest2_Location = "Isfar (Wälder von Terokkar - Auchindoun; "..YELLOW.."44,65"..WHITE..")"
Inst46Quest2_Note = "Terokks Maske droppt von Dunkelwirker Syth bei "..YELLOW.."[1]"..WHITE..", die Sage von Terokk findet man bei "..YELLOW.."[2]"..WHITE..", und Terokks Federkiel droppt von Klauenkönig Ikiss bei "..YELLOW.."[3]"..WHITE.."."
Inst46Quest2_Prequest = "Nein"
Inst46Quest2_Folgequest = "Nein"
--
Inst46Quest2name1 = "Die Sage von Terokk"
Inst46Quest2name2 = "Terokks Maske"
Inst46Quest2name3 = "Terokks Federkiel"

--Quest 3 Alliance
Inst46Quest3 = "3. Vernichtet den Rabengott (Druide - Heroisch)"
Inst46Quest3_Level = "70"
Inst46Quest3_Attain = "70"
Inst46Quest3_Aim = "Tötet den Rabengott und kehrt dann zu Morthis Flügelraunen bei der Zuflucht des Cenarius zurück."
Inst46Quest3_Location = "Morthis Flügelraunen (Zangarmarschen - Zuflucht des Cenarius; "..YELLOW.."80,65"..WHITE..")"
Inst46Quest3_Note = "Diese Aufgabe muss auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden. Dies ist die letzte Quest der Questreihe für die schnelle Flugform. Rabengott Anzu wird bei "..YELLOW.."[2]"..WHITE.." mit den Materialen beschworen, die man vom Questgeber erhalten hat."
Inst46Quest3_Prequest = "Ja, Die Essenz des Adlers -> Auf der Jagd nach dem Mondstein"
Inst46Quest3_Folgequest = "Nein"
Inst46Quest3PreQuest = "true"
--
Inst46Quest3name1 = "Götze der Rabengöttin"

--Quest 4 Alliance
Inst46Quest4 = "4. Kalynnas Bitte (Heroisch)"
Inst46Quest4_Level = "70"
Inst46Quest4_Attain = "70"
Inst46Quest4_Aim = "Kalynna Lathred möchte, dass Ihr den Dämmerfolianten vom Großhexenmeister Nethekurse in den zerschmetterten Hallen der Höllenfeuerzitadelle und das Buch der vergessenen Namen von Dunkelwirker Syth in den Sethekkhallen in Auchindoun besorgt."
Inst46Quest4_Location = "Kalynna Lathred (Nethersturm - Area 52; "..YELLOW.."32,63"..WHITE..")"
Inst46Quest4_Note = "Ihr müsst diese Quest auf dem Schwierigkeitsgrad 'Heroisch' abschließen.\n\nDunkelwirker Syth befindet sich bei "..YELLOW.."[1]"..WHITE..". Der Dämmerfoliant droppt in den zerschmetterten Hallen."
Inst46Quest4_Prequest = "Ja, Hilfe unter Kollegen ("..YELLOW.."Karazhan"..WHITE..")"
Inst46Quest4_Folgequest = "Ja, Schrecken der Nacht ("..YELLOW.."Karazhan"..WHITE..")"
Inst46Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst46Quest5 = "5. Gesucht: Die Kopfschmuckfedern von Ikiss (Heroisches Tagesquest)"
Inst46Quest5_Level = "70"
Inst46Quest5_Attain = "70"
Inst46Quest5_Aim = "Windhändler Zhareem hat Euch darum gebeten, ihm die Kopfschmuckfedern von Ikiss zu beschaffen. Bringt sie zu ihm ins untere Viertel in Shattrath, um Eure Belohnung zu erhalten."
Inst46Quest5_Location = "Windhändler Zhareem (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst46Quest5_Note = "Diese Aufgabe muss auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden.\n\nKlauenkönig Ikiss befindet sich bei "..YELLOW.."[3]"..WHITE.."."
Inst46Quest5_Prequest = "Nein"
Inst46Quest5_Folgequest = "Nein"
--
Inst46Quest5name1 = "Abzeichen der Gerechtigkeit"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst46Quest1_HORDE = Inst46Quest1
Inst46Quest1_HORDE_Level = Inst46Quest1_Level
Inst46Quest1_HORDE_Attain = Inst46Quest1_Attain
Inst46Quest1_HORDE_Aim = Inst46Quest1_Aim
Inst46Quest1_HORDE_Location = Inst46Quest1_Location
Inst46Quest1_HORDE_Note = Inst46Quest1_Note
Inst46Quest1_HORDE_Prequest = Inst46Quest1_Prequest
Inst46Quest1_HORDE_Folgequest = Inst46Quest1_Folgequest
--
Inst46Quest1name1_HORDE = Inst46Quest1name1
Inst46Quest1name2_HORDE = Inst46Quest1name2
Inst46Quest1name3_HORDE = Inst46Quest1name3
Inst46Quest1name4_HORDE = Inst46Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst46Quest2_HORDE = Inst46Quest2
Inst46Quest2_HORDE_Level = Inst46Quest2_Level
Inst46Quest2_HORDE_Attain = Inst46Quest2_Attain
Inst46Quest2_HORDE_Aim = Inst46Quest2_Aim
Inst46Quest2_HORDE_Location = Inst46Quest2_Location
Inst46Quest2_HORDE_Note = Inst46Quest2_Note
Inst46Quest2_HORDE_Prequest = Inst46Quest2_Prequest
Inst46Quest2_HORDE_Folgequest = Inst46Quest2_Folgequest
--
Inst46Quest2name1_HORDE = Inst46Quest2name1
Inst46Quest2name2_HORDE = Inst46Quest2name2
Inst46Quest2name3_HORDE = Inst46Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst46Quest3_HORDE = Inst46Quest3
Inst46Quest3_HORDE_Level = Inst46Quest3_Level
Inst46Quest3_HORDE_Attain = Inst46Quest3_Attain
Inst46Quest3_HORDE_Aim = Inst46Quest3_Aim
Inst46Quest3_HORDE_Location = Inst46Quest3_Location
Inst46Quest3_HORDE_Note = Inst46Quest3_Note
Inst46Quest3_HORDE_Prequest = Inst46Quest3_Prequest
Inst46Quest3_HORDE_Folgequest = Inst46Quest3_Folgequest
Inst46Quest3PreQuest_HORDE = Inst46Quest3PreQuest
--
Inst46Quest3name1_HORDE = Inst46Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst46Quest4_HORDE = Inst46Quest4
Inst46Quest4_HORDE_Level = Inst46Quest4_Level
Inst46Quest4_HORDE_Attain = Inst46Quest4_Attain
Inst46Quest4_HORDE_Aim = Inst46Quest4_Aim
Inst46Quest4_HORDE_Location = Inst46Quest4_Location
Inst46Quest4_HORDE_Note = Inst46Quest4_Note
Inst46Quest4_HORDE_Prequest = Inst46Quest4_Prequest
Inst46Quest4_HORDE_Folgequest = Inst46Quest4_Folgequest
Inst46Quest4PreQuest_HORDE = Inst46Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst46Quest5_HORDE = Inst46Quest5
Inst46Quest5_HORDE_Level = Inst46Quest5_Level
Inst46Quest5_HORDE_Attain = Inst46Quest5_Attain
Inst46Quest5_HORDE_Aim = Inst46Quest5_Aim
Inst46Quest5_HORDE_Location = Inst46Quest5_Location
Inst46Quest5_HORDE_Note = Inst46Quest5_Note
Inst46Quest5_HORDE_Prequest = Inst46Quest5_Prequest
Inst46Quest5_HORDE_Folgequest = Inst46Quest5_Folgequest
--
Inst46Quest5name1_HORDE = Inst46Quest5name1



--------------- INST47 - Auchindoun: Shadow Labyrinth (SLabs) ---------------

Inst47Story = "Seit Tausenden von Jahren haben die Draenei ihre Toten in Auchindoun, ihrem heiligsten Tempel, begraben.\n\nDoch Agenten des Schattenrats sind in ihn eingedrungen, dazu entschlossen, eine entsetzliche Kreatur von gewaltigem Übel zu beschwören.\n\nIhre abscheulichen magischen Taten führten zu einer gewaltigen Explosion, die den Tempel auseinandergerissen und die Umgebung in ein verkohltes Ödland verwandelt hat.\n\nDie Druckwelle verursachte zusätzlich einen Riss im Nether selbst, so dass jenseitige Astrale in die Scherbenwelt gelockt wurden.\n\nDie begrabenen Draenei durchwandern nun die Ruinen als ruhelose Geister.\n\nUnterdessen droht das vom Schattenrat beschworene entsetzliche Gebilde, ihre Bemühungen, es im Zaum zu halten, zu übermannen.\n\nDu musst dieses Böse davon abhalten, auf dieser ahnungslosen Welt freigesetzt zu werden.\n\nAuchindoun ist in vier Flügel aufgeteilt und für Gruppen von fünf Spielern der Stufen 64-70 vorgesehen."
Inst47Caption = "Auch: Schattenlabyrinth"
Inst47QAA = "11 Quests"
Inst47QAH = "11 Quests"

--Quest 1 Alliance
Inst47Quest1 = "1. Findet Spion To'gun"
Inst47Quest1_Level = "70"
Inst47Quest1_Attain = "68"
Inst47Quest1_Aim = "Findet Spion To'gun im Schattenlabyrinth von Auchindoun."
Inst47Quest1_Location = "Spionin Grik'tha (Wälder von Terokkar - Auchindoun; "..YELLOW.."40,72"..WHITE..")"
Inst47Quest1_Note = "To'gun befindet sich bei "..YELLOW.."[1]"..WHITE..", wird auch auf der Minimap angezeigt."
Inst47Quest1_Prequest = "Nein"
Inst47Quest1_Folgequest = "Ja, Seeleninstrumente"
-- No Rewards for this quest

--Quest 2 Alliance
Inst47Quest2 = "2. Seeleninstrumente"
Inst47Quest2_Level = "70"
Inst47Quest2_Attain = "68"
Inst47Quest2_Aim = "Stehlt 5 Seeleninstrumente und bringt sie zu Spionagemeisterin Mehlisah Hochkrone auf der Terrasse des Lichts in Shattrath."
Inst47Quest2_Location = "Spion To'gun (Schattenlabyrinth; "..YELLOW.."[1]"..WHITE..")"
Inst47Quest2_Note = "Seeleninstrumente sind die dunkelvioletten Kugeln, die in der Instanz verteilt zu finden sind. Spionagemeisterin Mehlisah Hochkrone befindet sich in (Shattrath - Terrasse des Lichts; "..YELLOW.."51,45"..WHITE..")"
Inst47Quest2_Prequest = "Ja, Findet Spion To'gun"
Inst47Quest2_Folgequest = "Nein"
Inst47Quest2FQuest = "true"
--
Inst47Quest2name1 = "Wickeltücher von Shattrath"
Inst47Quest2name2 = "Handgelenksschutz der Spionagemeisterin"
Inst47Quest2name3 = "Armschienen der Auchenai"
Inst47Quest2name4 = "Eiserne Armschützer der Sha'tari"

--Quest 3 Alliance
Inst47Quest3 = "3. Das Buch der teuflischen Namen"
Inst47Quest3_Level = "70"
Inst47Quest3_Attain = "68"
Inst47Quest3_Aim = "Reist in das Schattenlabyrinth von Auchindoun und besorgt das Buch der teuflischen Namen von Schwarzherz dem Hetzer. Kehrt danach zu Altruis in Nagrand zurück."
Inst47Quest3_Location = "Altruis der Leider (Nagrand; "..YELLOW.."27,43"..WHITE..")"
Inst47Quest3_Note = "Schwarzherz der Hetzer befindet sich bei "..YELLOW.."[3]"..WHITE..". Dies ist der letzte Teil einer Questreihe, die im Schattenmondtal bei "..YELLOW.."61,28"..WHITE.." für Aldor und bei "..YELLOW.."55,58"..WHITE.." für Seher startet."
Inst47Quest3_Prequest = "Ja, Illidans Schüler"
Inst47Quest3_Folgequest = "Ja, Rückkehr zu den Aldor oder Rückkehr zu den Sehern"
-- No Rewards for this quest

--Quest 4 Alliance
Inst47Quest4 = "4. Ärger in Auchindoun"
Inst47Quest4_Level = "70"
Inst47Quest4_Attain = "68"
Inst47Quest4_Aim = "Meldet Euch bei Feldkommandeur Mahfuun beim Eingang zum Schattenlabyrinth in Auchindoun in den Wäldern von Terokkar."
Inst47Quest4_Location = "Spionagemeisterin Mehlisah Hochkrone (Shattrath - Terrasse des Lichts; "..YELLOW.."51,45"..WHITE..")"
Inst47Quest4_Note = "Feldkommandeur Mahfuun befindet sich bei (Wälder von Terokkar - Auchindoun; "..YELLOW.."40,72"..WHITE.."), direkt vor dem Eingang zum Schattenlabyrinth."
Inst47Quest4_Prequest = "Nein"
Inst47Quest4_Folgequest = "Ja, Der Kodex des Blutes"
-- No Rewards for this quest

--Quest 5 Alliance
Inst47Quest5 = "5. Der Kodex des Blutes"
Inst47Quest5_Level = "70"
Inst47Quest5_Attain = "68"
Inst47Quest5_Aim = "Lest den Kodex des Blutes im Schattenlabyrinth von Auchindoun."
Inst47Quest5_Location = "Feldkommandeur Mahfuun (Wälder von Terokkar - Auchindoun; "..YELLOW.."40,72"..WHITE..")"
Inst47Quest5_Note = "Der Kodex des Blutes befindet sich direkt vor Großmeister Vorpil bei "..YELLOW.."[4]"..WHITE.."."
Inst47Quest5_Prequest = "Ja, Ärger in Auchindoun"
Inst47Quest5_Folgequest = "Ja, In das Herz des Labyrinths"
Inst47Quest5FQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst47Quest6 = "6. In das Herz des Labyrinths"
Inst47Quest6_Level = "70"
Inst47Quest6_Attain = "68"
Inst47Quest6_Aim = "Vernichtet Murmur und informiert danach Spionagemeisterin Mehlisah Sonnenkrone auf der Terrasse des Lichts in Shattrath über die Geschehnisse im Schattenlabyrinth."
Inst47Quest6_Location = "Kodex des Blutes (Schattenlabyrinth; "..YELLOW.."[4]"..WHITE..")"
Inst47Quest6_Note = "Murmur befindet sich bei "..YELLOW.."[5]"..WHITE..". Spionagemeisterin Mehlisah Sonnenkrone befindet sich in (Shattrath - Terrasse des Lichts; "..YELLOW.."51,45"..WHITE..")"
Inst47Quest6_Prequest = "Ja, Der Kodex des Blutes"
Inst47Quest6_Folgequest = "Nein"
Inst47Quest6FQuest = "true"
--
Inst47Quest6name1 = "Stofftreter von Shattrath"
Inst47Quest6name2 = "Stiefel der Spionagemeisterin"
Inst47Quest6name3 = "Stiefel der Auchenai"
Inst47Quest6name4 = "Eiserne Schienbeinschützer der Sha'tari"

--Quest 7 Alliance
Inst47Quest7 = "7. Die Prüfung der Naaru: Stärke (Heroisch)"
Inst47Quest7_Level = "70"
Inst47Quest7_Attain = "70"
Inst47Quest7_Aim = "A'dal in Shattrath möchte, dass Ihr Kalithreshs Dreizack und Murmurs Essenz besorgt."
Inst47Quest7_Location = "A'dal (Shattrath - Terrasse des Lichts; "..YELLOW.."53,43"..WHITE..")"
Inst47Quest7_Note = "Diese Aufgabe muss auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden. Murmur befindet sich bei "..YELLOW.."[5]"..WHITE..". Kalithreshs Dreizack droppt in der Dampfkammer.\n\nDiese Quest wurde benötigt, um die Festung der Stürme zu betreten, ist aber nicht mehr nötig."
Inst47Quest7_Prequest = "Nein"
Inst47Quest7_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 8 Alliance
Inst47Quest8 = "8. Nach Karazhan"
Inst47Quest8_Level = "70"
Inst47Quest8_Attain = "68"
Inst47Quest8_Aim = "Khadgar möchte, dass Ihr das Schattenlabyrinth von Auchindoun betretet und das erste Schlüsselfragment aus einem versteckten arkanen Behälter besorgt."
Inst47Quest8_Location = "Khadgar (Shattrath - Terrasse des Lichts; "..YELLOW.."54,44"..WHITE..")"
Inst47Quest8_Note = "Teil der Karazhan-Vorquestreihe. Der arkane Behälter befindet sich neben Murmur bei "..YELLOW.."[5]"..WHITE..". Wenn man ihn öffnet, erscheint ein Elementar, den man töten muss, um das Fragment zu erhalten."
Inst47Quest8_Prequest = "Ja, Khadgar"
Inst47Quest8_Folgequest = "Ja, Das zweite und das dritte Fragment"
Inst47Quest8PreQuest = "true"
-- No Rewards for this quest

--Quest 9 Alliance
Inst47Quest9 = "9. Encyclopaedia Daemonica"
Inst47Quest9_Level = "69"
Inst47Quest9_Attain = "67"
Inst47Quest9_Aim = "Beschafft die Encyclopaedia Daemonica von Großmeister Vorpil und bringt sie zu David Wayne in Waynes Zuflucht."
Inst47Quest9_Location = "David Wayne (Wälder von Terokkar - Waynes Zuflucht; "..YELLOW.."78,39"..WHITE..")."
Inst47Quest9_Note = "Großmeister Vorpil befindet sich bei "..YELLOW.."[4]"..WHITE..". Wenn man diese Quest und Frisch von der Mechanar ("..YELLOW.."FdS: Die Mechanar"..WHITE..") abschließt, erhält man zwei neue Quests von David Wayne.\n\nDer Gegenstand wird im heroischen Modus nicht droppen."
Inst47Quest9_Prequest = "Ja, Zusätzliche Materialien"
Inst47Quest9_Folgequest = "Nein"
Inst47Quest9PreQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst47Quest10 = "10. Gesucht: Murmurs Flüstern (Heroisches Tagesquest)"
Inst47Quest10_Level = "70"
Inst47Quest10_Attain = "70"
Inst47Quest10_Aim = "Windhändler Zhareem hat Euch darum gebeten, ihm Murmurs Flüstern zu beschaffen. Bringt es zu ihm ins untere Viertel in Shattrath, um Eure Belohnung zu erhalten."
Inst47Quest10_Location = "Windhändler Zhareem (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst47Quest10_Note = "Diese Aufgabe muss auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden.\n\nMurmur befindet sich bei "..YELLOW.."[5]"..WHITE.."."
Inst47Quest10_Prequest = "Nein"
Inst47Quest10_Folgequest = "Nein"
--
Inst47Quest10name1 = "Abzeichen der Gerechtigkeit"

--Quest 11 Alliance
Inst47Quest11 = "11. Gesucht: Bösartige Ausbilderinnen (Tagesquest)"
Inst47Quest11_Level = "70"
Inst47Quest11_Attain = "70"
Inst47Quest11_Aim = "Netherpirscher Mah'duun hat Euch damit beauftragt, 3 bösartige Ausbilderinnen zu töten. Kehrt erst zu ihm in das untere Viertel in Shattrath zurück, wenn sie alle dem Tod überantwortet wurden."
Inst47Quest11_Location = "Netherpirscher Mah'duun (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst47Quest11_Note = "Dies ist ein Tagesquest."
Inst47Quest11_Prequest = "Nein"
Inst47Quest11_Folgequest = "Nein"
--
Inst47Quest11name1 = "Gefängnisschlüssel des Astraleums"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst47Quest1_HORDE = Inst47Quest1
Inst47Quest1_HORDE_Level = Inst47Quest1_Level
Inst47Quest1_HORDE_Attain = Inst47Quest1_Attain
Inst47Quest1_HORDE_Aim = Inst47Quest1_Aim
Inst47Quest1_HORDE_Location = Inst47Quest1_Location
Inst47Quest1_HORDE_Note = Inst47Quest1_Note
Inst47Quest1_HORDE_Prequest = Inst47Quest1_Prequest
Inst47Quest1_HORDE_Folgequest = Inst47Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst47Quest2_HORDE = Inst47Quest2
Inst47Quest2_HORDE_Level = Inst47Quest2_Level
Inst47Quest2_HORDE_Attain = Inst47Quest2_Attain
Inst47Quest2_HORDE_Aim = Inst47Quest2_Aim
Inst47Quest2_HORDE_Location = Inst47Quest2_Location
Inst47Quest2_HORDE_Note = Inst47Quest2_Note
Inst47Quest2_HORDE_Prequest = Inst47Quest2_Prequest
Inst47Quest2_HORDE_Folgequest = Inst47Quest2_Folgequest
Inst47Quest2FQuest_HORDE = Inst47Quest2FQuest
--
Inst47Quest2name1_HORDE = Inst47Quest2name1
Inst47Quest2name2_HORDE = Inst47Quest2name2
Inst47Quest2name3_HORDE = Inst47Quest2name3
Inst47Quest2name4_HORDE = Inst47Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst47Quest3_HORDE = Inst47Quest3
Inst47Quest3_HORDE_Level = Inst47Quest3_Level
Inst47Quest3_HORDE_Attain = Inst47Quest3_Attain
Inst47Quest3_HORDE_Aim = Inst47Quest3_Aim
Inst47Quest3_HORDE_Location = Inst47Quest3_Location
Inst47Quest3_HORDE_Note = Inst47Quest3_Note
Inst47Quest3_HORDE_Prequest = Inst47Quest3_Prequest
Inst47Quest3_HORDE_Folgequest = Inst47Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst47Quest4_HORDE = Inst47Quest4
Inst47Quest4_HORDE_Level = Inst47Quest4_Level
Inst47Quest4_HORDE_Attain = Inst47Quest4_Attain
Inst47Quest4_HORDE_Aim = Inst47Quest4_Aim
Inst47Quest4_HORDE_Location = Inst47Quest4_Location
Inst47Quest4_HORDE_Note = Inst47Quest4_Note
Inst47Quest4_HORDE_Prequest = Inst47Quest4_Prequest
Inst47Quest4_HORDE_Folgequest = Inst47Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst47Quest5_HORDE = Inst47Quest5
Inst47Quest5_HORDE_Level = Inst47Quest5_Level
Inst47Quest5_HORDE_Attain = Inst47Quest5_Attain
Inst47Quest5_HORDE_Aim = Inst47Quest5_Aim
Inst47Quest5_HORDE_Location = Inst47Quest5_Location
Inst47Quest5_HORDE_Note = Inst47Quest5_Note
Inst47Quest5_HORDE_Prequest = Inst47Quest5_Prequest
Inst47Quest5_HORDE_Folgequest = Inst47Quest5_Folgequest
Inst47Quest5FQuest_HORDE = Inst47Quest5FQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst47Quest6_HORDE = Inst47Quest6
Inst47Quest6_HORDE_Level = Inst47Quest6_Level
Inst47Quest6_HORDE_Attain = Inst47Quest6_Attain
Inst47Quest6_HORDE_Aim = Inst47Quest6_Aim
Inst47Quest6_HORDE_Location = Inst47Quest6_Location
Inst47Quest6_HORDE_Note = Inst47Quest6_Note
Inst47Quest6_HORDE_Prequest = Inst47Quest6_Prequest
Inst47Quest6_HORDE_Folgequest = Inst47Quest6_Folgequest
Inst47Quest6FQuest_HORDE = Inst47Quest6FQuest
--
Inst47Quest6name1_HORDE = Inst47Quest6name1
Inst47Quest6name2_HORDE = Inst47Quest6name2
Inst47Quest6name3_HORDE = Inst47Quest6name3
Inst47Quest6name4_HORDE = Inst47Quest6name4

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst47Quest7_HORDE = Inst47Quest7
Inst47Quest7_HORDE_Level = Inst47Quest7_Level
Inst47Quest7_HORDE_Attain = Inst47Quest7_Attain
Inst47Quest7_HORDE_Aim = Inst47Quest7_Aim
Inst47Quest7_HORDE_Location = Inst47Quest7_Location
Inst47Quest7_HORDE_Note = Inst47Quest7_Note
Inst47Quest7_HORDE_Prequest = Inst47Quest7_Prequest
Inst47Quest7_HORDE_Folgequest = Inst47Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst47Quest8_HORDE = Inst47Quest8
Inst47Quest8_HORDE_Level = Inst47Quest8_Level
Inst47Quest8_HORDE_Attain = Inst47Quest8_Attain
Inst47Quest8_HORDE_Aim = Inst47Quest8_Aim
Inst47Quest8_HORDE_Location = Inst47Quest8_Location
Inst47Quest8_HORDE_Note = Inst47Quest8_Note
Inst47Quest8_HORDE_Prequest = Inst47Quest8_Prequest
Inst47Quest8_HORDE_Folgequest = Inst47Quest8_Folgequest
Inst47Quest8PreQuest_HORDE = Inst47Quest8PreQuest
-- No Rewards for this quest

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst47Quest9_HORDE = Inst47Quest9
Inst47Quest9_HORDE_Level = Inst47Quest9_Level
Inst47Quest9_HORDE_Attain = Inst47Quest9_Attain
Inst47Quest9_HORDE_Aim = Inst47Quest9_Aim
Inst47Quest9_HORDE_Location = Inst47Quest9_Location
Inst47Quest9_HORDE_Note = Inst47Quest9_Note
Inst47Quest9_HORDE_Prequest = Inst47Quest9_Prequest
Inst47Quest9_HORDE_Folgequest = Inst47Quest9_Folgequest
Inst47Quest9PreQuest_HORDE = Inst47Quest8PreQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst47Quest10_HORDE = Inst47Quest10
Inst47Quest10_HORDE_Level = Inst47Quest10_Level
Inst47Quest10_HORDE_Attain = Inst47Quest10_Attain
Inst47Quest10_HORDE_Aim = Inst47Quest10_Aim
Inst47Quest10_HORDE_Location = Inst47Quest10_Location
Inst47Quest10_HORDE_Note = Inst47Quest10_Note
Inst47Quest10_HORDE_Prequest = Inst47Quest10_Prequest
Inst47Quest10_HORDE_Folgequest = Inst47Quest10_Folgequest
--
Inst47Quest10name1_HORDE = Inst47Quest10name1

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst47Quest11_HORDE = Inst47Quest11
Inst47Quest11_HORDE_Level = Inst47Quest11_Level
Inst47Quest11_HORDE_Attain = Inst47Quest11_Attain
Inst47Quest11_HORDE_Aim = Inst47Quest11_Aim
Inst47Quest11_HORDE_Location = Inst47Quest11_Location
Inst47Quest11_HORDE_Note = Inst47Quest11_Note
Inst47Quest11_HORDE_Prequest = Inst47Quest11_Prequest
Inst47Quest11_HORDE_Folgequest = Inst47Quest11_Folgequest
--
Inst47Quest11name1_HORDE = Inst47Quest11name1



--------------- INST48 - CR: Serpentshrine Cavern (SSC) ---------------

Inst48Story = "Die empfindliche Ökologie der Zangarmarschen wurde aus dem Gleichgewicht geworfen.\n\nUnnatürliche Phänomene beschädigen und zerstören die natürliche Pflanzen- und Tierwelt der Marschen.\n\nEiniges deutet darauf hin, dass diese Störungen ihren Ursprung im Echsenkessel haben.\n\nMan munkelt, dass der Anführer dieses mysteriösen Gebäudes niemand anders ist als die berüchtigte Lady Vashj.\n\nNur du kannst ihre ruchlosen Pläne entdecken und sie aufhalten, bevor es zu spät ist.\n\nDer Echsenkessel ist in vier Bereiche aufgeteilt, von denen drei Fünf-Spieler-Instanzen sind (die Sklavenunterkünfte, der Tiefensumpf, die Dampfkammer), dazu kommt die 25-Spieler-Instanz Höhle des Schlangenschreins. "
Inst48Caption = "EK: Höhle des Schlangenschreins"
Inst48QAA = "2 Quests"
Inst48QAH = "2 Quests"

--Quest 1 Alliance
Inst48Quest1 = "1. Die Phiolen der Ewigkeit"
Inst48Quest1_Level = "70"
Inst48Quest1_Attain = "70"
Inst48Quest1_Aim = "Soridormi in den Höhlen der Zeit möchte, dass Ihr die Überreste von Vashjs Phiole im Echsenkessel und die Überreste von Kaels Phiole von Kael'thas Sonnenwanderer in der Festung der Stürme besorgt."
Inst48Quest1_Location = "Soridormi (Tanaris - Höhlen der Zeit; "..YELLOW.."58,57"..WHITE.."). Der NPC läuft in dem Bereich umher."
Inst48Quest1_Note = "Dies ist die Vorquest für die Schlacht um den Berg Hyjal. Lady Vashj befindet sich bei "..YELLOW.."[6]"..WHITE.."."
Inst48Quest1_Prequest = "Nein"
Inst48Quest1_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 2 Alliance
Inst48Quest2 = "2. Das gefährdete Geheimnis"
Inst48Quest2_Level = "70"
Inst48Quest2_Attain = "70"
Inst48Quest2_Aim = "Reist zum Kerker des Wächters im Schattenmondtal und sprecht mit Akama."
Inst48Quest2_Location = "Seher Olum (Höhle des Schlangenschreins; "..YELLOW.."[4]"..WHITE..")"
Inst48Quest2_Note = "Akama befindet sich bei (Schattenmondtal - Kerker des Wächters; "..YELLOW.."58,48"..WHITE..").\n\nDieses Quest ist Teil der Zugangsquestreihe des Schwarzen Tempels, die bei Anachoret Ceyla (Schattenmondtal - Altar der Sha'tar; "..YELLOW.."62,38"..WHITE..") für die Aldor und Arkanist Thelis (Schattenmondtal - Sanktum der Sterne; "..YELLOW.."56,59"..WHITE..") für die Seher startet."
Inst48Quest2_Prequest = "Ja, Schrifttafeln von Baa'ri -> Akamas Versprechen"
Inst48Quest2_Folgequest = "Ja, Die List der Aschenzungen ("..YELLOW.."FdS: Festung der Stürme"..WHITE..")"
Inst48Quest2PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst48Quest1_HORDE = Inst48Quest1
Inst48Quest1_HORDE_Level = Inst48Quest1_Level
Inst48Quest1_HORDE_Attain = Inst48Quest1_Attain
Inst48Quest1_HORDE_Aim = Inst48Quest1_Aim
Inst48Quest1_HORDE_Location = Inst48Quest1_Location
Inst48Quest1_HORDE_Note = Inst48Quest1_Note
Inst48Quest1_HORDE_Prequest = Inst48Quest1_Prequest
Inst48Quest1_HORDE_Folgequest = Inst48Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst48Quest2_HORDE = Inst48Quest2
Inst48Quest2_HORDE_Level = Inst48Quest2_Level
Inst48Quest2_HORDE_Attain = Inst48Quest2_Attain
Inst48Quest2_HORDE_Aim = Inst48Quest2_Aim
Inst48Quest2_HORDE_Location = Inst48Quest2_Location
Inst48Quest2_HORDE_Note = Inst48Quest2_Note
Inst48Quest2_HORDE_Prequest = Inst48Quest2_Prequest
Inst48Quest2_HORDE_Folgequest = Inst48Quest2_Folgequest
Inst48Quest2PreQuest_HORDE = Inst48Quest2PreQuest
-- No Rewards for this quest



--------------- INST49 - CoT: Black Morass (BM) ---------------

Inst49Story = "Medivh, der letzte der magischen Beschützer von Tirisfal, war von Geburt an vom bösen Titanen Sargeras besessen.\n\nMedivh war es, der als erstes Kontakt zu dem korrupten Orkhexenmeister Gul'dan aufnahm, der ebenfalls im Dienst der Brennenden Legion stand.\n\nZusammen wollten sie die Dimensionslücke zwischen Azeroth und Draenor, der Heimatwelt der Orks, überbrücken, um die Zerstörung Azeroths zu ermöglichen.\n\nAm verabredeten Tag konzentrierten sowohl Medivh als auch Gul'dan ihre ansehnlichen magischen Energien, um die Dimensionssperre zusammenbrechen zu lassen.\n\nDer Schauplatz dieses Ereignisses ist der schwarze Morast, heute bekannt als die verwüsteten Lande.\n\nDie Spieler verteidigen Medivh, während er das Portal öffnet."
Inst49Caption = "HdZ: Der schwarze Morast"
Inst49QAA = "7 Quests"
Inst49QAH = "7 Quests"

--Quest 1 Alliance
Inst49Quest1 = "1. Der schwarze Morast"
Inst49Quest1_Level = "70"
Inst49Quest1_Attain = "66"
Inst49Quest1_Aim = "Reist durch die Höhlen der Zeit in den schwarzen Morast während der Öffnung des Dunklen Portals und sprecht mit Sa'at."
Inst49Quest1_Location = "Andormu (Tanaris - Höhlen der Zeit; "..YELLOW.."58,54"..WHITE..")"
Inst49Quest1_Note = "Die Flucht von der Burg Durnholde muss abgeschlossen sein, bevor man den schwarzen Morast betreten kann. Sa'at befindet sich kurz hinter dem Eingang der Instanz."
Inst49Quest1_Prequest = "Nein"
Inst49Quest1_Folgequest = "Ja, Die Öffnung des Dunklen Portals"
-- No Rewards for this quest

--Quest 2 Alliance
Inst49Quest2 = "2. Die Öffnung des Dunklen Portals"
Inst49Quest2_Level = "70"
Inst49Quest2_Attain = "66"
Inst49Quest2_Aim = "Sa'at im schwarzen Morast der Höhlen der Zeit möchte, dass Ihr Medivh verteidigt, bis er das Dunkle Portal geöffnet hat."
Inst49Quest2_Location = "Sa'at (Der schwarze Morast; "..YELLOW.."Eingang"..WHITE..")"
Inst49Quest2_Note = "Wenn die Quest missglückt, muss das Ereignis von vorne gestartet werden."
Inst49Quest2_Prequest = "Ja, Der schwarze Morast"
Inst49Quest2_Folgequest = "Ja, Held des Schwarms"
Inst49Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst49Quest3 = "3. Held des Schwarms"
Inst49Quest3_Level = "70"
Inst49Quest3_Attain = "66"
Inst49Quest3_Aim = "Kehrt zum Kind, Andormu, in den Höhlen der Zeit in Tanaris zurück."
Inst49Quest3_Location = "Andormu (Tanaris - Höhlen der Zeit; "..YELLOW.."58,54"..WHITE..")"
Inst49Quest3_Note = ""
Inst49Quest3_Prequest = "Ja, Die Öffnung des Dunklen Portals"
Inst49Quest3_Folgequest = "Nein"
Inst49Quest3FQuest = "true"
--
Inst49Quest3name1 = "Band des Wächters"
Inst49Quest3name2 = "Bewahrerring der Frömmigkeit"
Inst49Quest3name3 = "Edelstein der Zeitkrümmung"
Inst49Quest3name4 = "Andormus Träne"

--Quest 4 Alliance
Inst49Quest4 = "4. Die Berührung des Meisters"
Inst49Quest4_Level = "70"
Inst49Quest4_Attain = "69"
Inst49Quest4_Aim = "Geht in die Höhlen der Zeit und überzeugt Medivh davon, den wiederhergestellten Schlüssel des Lehrlings zu aktivieren."
Inst49Quest4_Location = "Khadgar (Shattrath - Terrasse des Lichts; "..YELLOW.."54,44"..WHITE..")"
Inst49Quest4_Note = "Teil der Karazhan-Vorquestreihe. Du musst dich in der Instanz befinden, wenn Aeonus stirbt, um mit Medivh reden zu können."
Inst49Quest4_Prequest = "Ja, Das zweite und das dritte Fragment"
Inst49Quest4_Folgequest = "Ja, Rückkehr zu Khadgar"
Inst49Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst49Quest5 = "5. Meister der Elixiere (Alchimie)"
Inst49Quest5_Level = "70"
Inst49Quest5_Attain = "68"
Inst49Quest5_Aim = "Begebt Euch in den Schwarzen Morast in den Höhlen der Zeit und besorgt 10 Essenzen der Unendlichkeit von den Fürsten der Zeitenrisse und den Bewahrerinnen der Zeitenrisse. Bringt die Essenzen zusammen mit 5 Elixieren der erheblichen Verteidigung, 5 Elixieren des Meisters und 5 Elixieren der erheblichen Beweglichkeit zu Lorokeem im unteren Viertel von Shattrath."
Inst49Quest5_Location = "Lorokeem (Shattrath - Unteres Viertel; "..YELLOW.."46,23"..WHITE..")"
Inst49Quest5_Note = "Alchimie-Quest. Lorokeem wandert bei den angegebenen Koordinaten umher."
Inst49Quest5_Prequest = "Ja, Meister der Elixiere"
Inst49Quest5_Folgequest = "Nein"
Inst49Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst49Quest6 = "6. Gesucht: Aeonus' Stundenglas (Heroisches Tagesquest)"
Inst49Quest6_Level = "70"
Inst49Quest6_Attain = "70"
Inst49Quest6_Aim = "Windhändler Zhareem hat Euch darum gebeten, ihm Aeonus' Stundenglas zu beschaffen. Bringt es zu ihm ins untere Viertel in Shattrath, um Eure Belohnung zu erhalten."
Inst49Quest6_Location = "Windhändler Zhareem (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst49Quest6_Note = "Diese Aufgabe muss auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden.\n\nAeonus erscheint mit der letzten Welle."
Inst49Quest6_Prequest = "Nein"
Inst49Quest6_Folgequest = "Nein"
--
Inst49Quest6name1 = "Abzeichen der Gerechtigkeit"

--Quest 7 Alliance
Inst49Quest7 = "7. Gesucht: Fürsten der Zeitenrisse (Tagesquest)"
Inst49Quest7_Level = "70"
Inst49Quest7_Attain = "70"
Inst49Quest7_Aim = "Netherpirscher Mah'duun hat Euch damit beauftragt, 4 Fürsten der Zeitenrisse zu töten. Kehrt erst zu ihm in das untere Viertel in Shattrath zurück, wenn sie alle dem Tod überantwortet wurden."
Inst49Quest7_Location = "Netherpirscher Mah'duun (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst49Quest7_Note = "Dies ist ein Tagesquest."
Inst49Quest7_Prequest = "Nein"
Inst49Quest7_Folgequest = "Nein"
--
Inst49Quest7name1 = "Gefängnisschlüssel des Astraleums"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst49Quest1_HORDE = Inst49Quest1
Inst49Quest1_HORDE_Level = Inst49Quest1_Level
Inst49Quest1_HORDE_Attain = Inst49Quest1_Attain
Inst49Quest1_HORDE_Aim = Inst49Quest1_Aim
Inst49Quest1_HORDE_Location = Inst49Quest1_Location
Inst49Quest1_HORDE_Note = Inst49Quest1_Note
Inst49Quest1_HORDE_Prequest = Inst49Quest1_Prequest
Inst49Quest1_HORDE_Folgequest = Inst49Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst49Quest2_HORDE = Inst49Quest2
Inst49Quest2_HORDE_Level = Inst49Quest2_Level
Inst49Quest2_HORDE_Attain = Inst49Quest2_Attain
Inst49Quest2_HORDE_Aim = Inst49Quest2_Aim
Inst49Quest2_HORDE_Location = Inst49Quest2_Location
Inst49Quest2_HORDE_Note = Inst49Quest2_Note
Inst49Quest2_HORDE_Prequest = Inst49Quest2_Prequest
Inst49Quest2_HORDE_Folgequest = Inst49Quest2_Folgequest
Inst49Quest2FQuest_HORDE = Inst49Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst49Quest3_HORDE = Inst49Quest3
Inst49Quest3_HORDE_Level = Inst49Quest3_Level
Inst49Quest3_HORDE_Attain = Inst49Quest3_Attain
Inst49Quest3_HORDE_Aim = Inst49Quest3_Aim
Inst49Quest3_HORDE_Location = Inst49Quest3_Location
Inst49Quest3_HORDE_Note = Inst49Quest3_Note
Inst49Quest3_HORDE_Prequest = Inst49Quest3_Prequest
Inst49Quest3_HORDE_Folgequest = Inst49Quest3_Folgequest
Inst49Quest3FQuest_HORDE = Inst49Quest3FQuest
--
Inst49Quest3name1_HORDE = Inst49Quest3name1
Inst49Quest3name2_HORDE = Inst49Quest3name2
Inst49Quest3name3_HORDE = Inst49Quest3name3
Inst49Quest3name4_HORDE = Inst49Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst49Quest4_HORDE = Inst49Quest4
Inst49Quest4_HORDE_Level = Inst49Quest4_Level
Inst49Quest4_HORDE_Attain = Inst49Quest4_Attain
Inst49Quest4_HORDE_Aim = Inst49Quest4_Aim
Inst49Quest4_HORDE_Location = Inst49Quest4_Location
Inst49Quest4_HORDE_Note = Inst49Quest4_Note
Inst49Quest4_HORDE_Prequest = Inst49Quest4_Prequest
Inst49Quest4_HORDE_Folgequest = Inst49Quest4_Folgequest
Inst49Quest4PreQuest_HORDE = Inst49Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst49Quest5_HORDE = Inst49Quest5
Inst49Quest5_HORDE_Level = Inst49Quest5_Level
Inst49Quest5_HORDE_Attain = Inst49Quest5_Attain
Inst49Quest5_HORDE_Aim = Inst49Quest5_Aim
Inst49Quest5_HORDE_Location = Inst49Quest5_Location
Inst49Quest5_HORDE_Note = Inst49Quest5_Note
Inst49Quest5_HORDE_Prequest = Inst49Quest5_Prequest
Inst49Quest5_HORDE_Folgequest = Inst49Quest5_Folgequest
Inst49Quest5PreQuest_HORDE = Inst49Quest5PreQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst49Quest6_HORDE = Inst49Quest6
Inst49Quest6_HORDE_Level = Inst49Quest6_Level
Inst49Quest6_HORDE_Attain = Inst49Quest6_Attain
Inst49Quest6_HORDE_Aim = Inst49Quest6_Aim
Inst49Quest6_HORDE_Location = Inst49Quest6_Location
Inst49Quest6_HORDE_Note = Inst49Quest6_Note
Inst49Quest6_HORDE_Prequest = Inst49Quest6_Prequest
Inst49Quest6_HORDE_Folgequest = Inst49Quest6_Folgequest
--
Inst49Quest6name1_HORDE = Inst49Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst49Quest7_HORDE = Inst49Quest7
Inst49Quest7_HORDE_Level = Inst49Quest7_Level
Inst49Quest7_HORDE_Attain = Inst49Quest7_Attain
Inst49Quest7_HORDE_Aim = Inst49Quest7_Aim
Inst49Quest7_HORDE_Location = Inst49Quest7_Location
Inst49Quest7_HORDE_Note = Inst49Quest7_Note
Inst49Quest7_HORDE_Prequest = Inst49Quest7_Prequest
Inst49Quest7_HORDE_Folgequest = Inst49Quest7_Folgequest
--
Inst49Quest7name1_HORDE = Inst49Quest7name1



--------------- INST50 - CoT: Battle of Mount Hyjal ---------------

Inst50Story = "Auf dem Höhepunkt des Zweiten Krieges gegen die Brennende Legion war den Rassen von Azeroth klar, dass es der einzige Weg, den Sieg zu erzielen, war, ihre Einheiten zu vereinen; ein verzweifelter Vorstoß zum Sieg.\n\nDieser Kampf fand auf dem Gipfel des Bergs Hyjal statt, am Fuße von Nordrassil, dem Weltenbaum.\n\nDie Nachtelfen, angeführt von Malfurion Sturmgrimm und Tyrande Wisperwind, die neue Horde, angeführt von Thrall und Cairne Bluthuf, und der Rest der Allianz von Lordaeron, angeführt von Jaina Prachtmeer, vereinten ihre Einheiten gegen Archimonde und die dämonischen Truppen der Brennenden Legion in einer gewaltigen, epischen Schlacht, um Azeroth zu verteidigen.\n\nDer Sieg wurde mit Mühe erreicht, obgleich Archimonde den Weltenbaum erreichte und versuchte, ihn wegen seiner Energie anzuzapfen."
Inst50Caption = "HdZ: Hyjalgipfel"
Inst50QAA = "1 Quest"
Inst50QAH = "1 Quest"

--Quest 1 Alliance
Inst50Quest1 = "1. Ein Artefakt aus der Vergangenheit"
Inst50Quest1_Level = "70"
Inst50Quest1_Attain = "70"
Inst50Quest1_Aim = "Reist zu den Höhlen der Zeit in Tanaris und verschafft Euch Zugang zur Schlacht um den Berg Hyjal. Habt Ihr dies geschafft, so bezwingt Furor Winterfrost und bringt das befristete Phylakterium zu Akama im Schattenmondtal."
Inst50Quest1_Location = "Akama (Schattenmondtal - Kammer des Wächters; "..YELLOW.."58,48"..WHITE..")"
Inst50Quest1_Note = "Teil der Vorquestreihe zum Schwarzen Tempel. Furor Winterfrost befindet sich bei "..YELLOW.."[1]"..WHITE.."."
Inst50Quest1_Prequest = "Ja, Die List der Aschenzungen ("..YELLOW.."FdS: Festung der Stürme"..WHITE..")"
Inst50Quest1_Folgequest = "Ja, Die Seelengeisel"
Inst50Quest1PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst50Quest1_HORDE = Inst50Quest1
Inst50Quest1_HORDE_Level = Inst50Quest1_Level
Inst50Quest1_HORDE_Attain = Inst50Quest1_Attain
Inst50Quest1_HORDE_Aim = Inst50Quest1_Aim
Inst50Quest1_HORDE_Location = Inst50Quest1_Location
Inst50Quest1_HORDE_Note = Inst50Quest1_Note
Inst50Quest1_HORDE_Prequest = Inst50Quest1_Prequest
Inst50Quest1_HORDE_Folgequest = Inst50Quest1_Folgequest
Inst50Quest1PreQuest_HORDE = Inst50Quest1PreQuest
-- No Rewards for this quest



--------------- INST51 - CoT: Old Hillsbrad ---------------

Inst51Story = "Burg Durnholde war der Hauptsitz der orkischen Internierungslager im südlichen Lordaeron nach der Niederlage der Horde im Zweiten Krieg.\n\nZu dieser Zeit war Thrall ein 19 Jahre alter Sklave des menschlichen Offiziers Aedelas Schwarzmoor, der Thrall als Kriegshäuptlingsmarionette benutzen wollte, um die orkische Horde zu kontrollieren und daraus Macht über seine Mitmenschen zu erhalten.\n\nAber Thrall wusste, dass er für mehr ausersehnt war, und so floh er aus Durnholde, um andere seiner Art zu finden und schließlich den Frostwolfklan und seinen Platz als Kriegshäuptling zu entdecken.\n\nDiese Instanz enthält das komplette Hügelland-Gebiet, wie es vor 7 Jahren war, bevor die Horde Durnholde zerstört hat und Tarrens Mühle an die Untoten verfallen ist."
Inst51Caption = "HdZ: Vorgebirge des alten Hügellands"
Inst51QAA = "5 Quests"
Inst51QAH = "5 Quests"

--Quest 1 Alliance
Inst51Quest1 = "1. Das alte Hügelland"
Inst51Quest1_Level = "68"
Inst51Quest1_Attain = "66"
Inst51Quest1_Aim = "Andormu in den Höhlen der Zeit bittet Euch, ins Alte Hügelland zu reisen und mit Erozion zu sprechen."
Inst51Quest1_Location = "Andormu (Tanaris - Höhlen der Zeit; "..YELLOW.."58,54"..WHITE..")"
Inst51Quest1_Note = "Die Vorquest, die bei dem Drachen am Eingang der Höhlen der Zeit startet, muss absolviert sein."
Inst51Quest1_Prequest = "Ja, Die Höhlen der Zeit"
Inst51Quest1_Folgequest = "Ja, Tarethas Ablenkungsmanöver"
Inst51Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst51Quest2 = "2. Tarethas Ablenkungsmanöver"
Inst51Quest2_Level = "68"
Inst51Quest2_Attain = "66"
Inst51Quest2_Aim = "Reist zur Burg Durnholde und platziert mit Hilfe des Bündels mit Brandbomben, das Ihr von Erozion erhalten habt, 5 Brandsätze auf den Fässern in jeder Internierungsbaracke. Sprecht mit Thrall im Kellergefängnis der Burg Durnholde, wenn Ihr die Internierungsbaracken angezündet habt."
Inst51Quest2_Location = "Erozion (Vorgebirge des alten Hügellands; "..YELLOW.."Eingang"..WHITE..")"
Inst51Quest2_Note = "Thrall befindet sich bei "..YELLOW.."[2]"..WHITE..". Reise nach Süderstade, um dir die Geschichte des Aschenbringers anzuhören und einige Leute mit bekannten Namen wie Kel'Thuzad und Herod der Tyrann zu treffen."
Inst51Quest2_Prequest = "Ja, Das alte Hügelland"
Inst51Quest2_Folgequest = "Ja, Flucht aus Durnholde"
Inst51Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst51Quest3 = "3. Flucht aus Durnholde"
Inst51Quest3_Level = "68"
Inst51Quest3_Attain = "66"
Inst51Quest3_Aim = "Gebt Thrall Bescheid, wenn Ihr bereit seid. Folgt Thrall aus der Burg Durnholde und helft ihm, Taretha zu befreien und sein Schicksal zu erfüllen. Sprecht mit Ezorion im Alten Hügelland, wenn Ihr diese Aufgabe erfüllt habt."
Inst51Quest3_Location = "Thrall (Vorgebirge des alten Hügellands; "..YELLOW.."[2]"..WHITE..")"
Inst51Quest3_Note = "Stell sicher, dass jeder die Quest angenommen hat, bevor jemand Thrall ansprecht, um die Flucht zu starten. Angeblich kann die Quest trotzdem geteilt und erfolgreich abgeschlossen werden. Du hast 20 Versuche, Thrall zu retten, danach musst du die Instanz zurücksetzen, und du kannst den letzten Boss nicht ohne Thrall töten, da Thrall den letzten Schritt tun muss."
Inst51Quest3_Prequest = "Ja, Tarethas Ablenkungsmanöver"
Inst51Quest3_Folgequest = "Ja, Rückkehr zu Andormu"
Inst51Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst51Quest4 = "4. Rückkehr zu Andormu"
Inst51Quest4_Level = "68"
Inst51Quest4_Attain = "66"
Inst51Quest4_Aim = "Kehrt zu dem jungen Andormu in den Höhlen der Zeit in Tanaris zurück."
Inst51Quest4_Location = "Erozion (Vorgebirge des alten Hügellands; "..YELLOW.."Eingang"..WHITE..")"
Inst51Quest4_Note = "Andormu befindet sich bei (Tanaris - Höhlen der Zeit; "..YELLOW.."58,54"..WHITE.."). Mit dem Abschluss dieser Quest kann man den schwarzen Morast betreten."
Inst51Quest4_Prequest = "Ja, Flucht aus Durnholde"
Inst51Quest4_Folgequest = "Nein"
Inst51Quest4FQuest = "true"
--
Inst51Quest4name1 = "Berührung des Sturms"
Inst51Quest4name2 = "Süderstader Schuhe"
Inst51Quest4name3 = "Verteidigergurt von Tarrens Mühle"
Inst51Quest4name4 = "Mantelung des Kriegshäuptlings"

--Quest 5 Alliance
Inst51Quest5 = "5. Gesucht: Der Kopf des Epochenjägers (Heroisches Tagesquest)"
Inst51Quest5_Level = "70"
Inst51Quest5_Attain = "70"
Inst51Quest5_Aim = "Windhändler Zhareem hat Euch darum gebeten, ihm den Kopf des Epochenjägers zu beschaffen. Bringt diesen zu ihm ins untere Viertel in Shattrath, um Eure Belohnung zu erhalten."
Inst51Quest5_Location = "Windhändler Zhareem (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst51Quest5_Note = "Diese Aufgabe muss auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden.\n\nEpochenjäger befindet sich bei "..YELLOW.."[5]"..WHITE.."."
Inst51Quest5_Prequest = "Nein"
Inst51Quest5_Folgequest = "Nein"
--
Inst51Quest5name1 = "Abzeichen der Gerechtigkeit"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst51Quest1_HORDE = Inst51Quest1
Inst51Quest1_HORDE_Level = Inst51Quest1_Level
Inst51Quest1_HORDE_Attain = Inst51Quest1_Attain
Inst51Quest1_HORDE_Aim = Inst51Quest1_Aim
Inst51Quest1_HORDE_Location = Inst51Quest1_Location
Inst51Quest1_HORDE_Note = Inst51Quest1_Note
Inst51Quest1_HORDE_Prequest = Inst51Quest1_Prequest
Inst51Quest1_HORDE_Folgequest = Inst51Quest1_Folgequest
Inst51Quest1PreQuest_HORDE = Inst51Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst51Quest2_HORDE = Inst51Quest2
Inst51Quest2_HORDE_Level = Inst51Quest2_Level
Inst51Quest2_HORDE_Attain = Inst51Quest2_Attain
Inst51Quest2_HORDE_Aim = Inst51Quest2_Aim
Inst51Quest2_HORDE_Location = Inst51Quest2_Location
Inst51Quest2_HORDE_Note = Inst51Quest2_Note
Inst51Quest2_HORDE_Prequest = Inst51Quest2_Prequest
Inst51Quest2_HORDE_Folgequest = Inst51Quest2_Folgequest
Inst51Quest2FQuest_HORDE = Inst51Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst51Quest3_HORDE = Inst51Quest3
Inst51Quest3_HORDE_Level = Inst51Quest3_Level
Inst51Quest3_HORDE_Attain = Inst51Quest3_Attain
Inst51Quest3_HORDE_Aim = Inst51Quest3_Aim
Inst51Quest3_HORDE_Location = Inst51Quest3_Location
Inst51Quest3_HORDE_Note = Inst51Quest3_Note
Inst51Quest3_HORDE_Prequest = Inst51Quest3_Prequest
Inst51Quest3_HORDE_Folgequest = Inst51Quest3_Folgequest
Inst51Quest3FQuest_HORDE = Inst51Quest3FQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst51Quest4_HORDE = Inst51Quest4
Inst51Quest4_HORDE_Level = Inst51Quest4_Level
Inst51Quest4_HORDE_Attain = Inst51Quest4_Attain
Inst51Quest4_HORDE_Aim = Inst51Quest4_Aim
Inst51Quest4_HORDE_Location = Inst51Quest4_Location
Inst51Quest4_HORDE_Note = Inst51Quest4_Note
Inst51Quest4_HORDE_Prequest = Inst51Quest4_Prequest
Inst51Quest4_HORDE_Folgequest = Inst51Quest4_Folgequest
Inst51Quest4FQuest_HORDE = Inst51Quest4FQuest
--
Inst51Quest4name1_HORDE = Inst51Quest4name1
Inst51Quest4name2_HORDE = Inst51Quest4name2
Inst51Quest4name3_HORDE = Inst51Quest4name3
Inst51Quest4name4_HORDE = Inst51Quest4name4

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst51Quest5_HORDE = Inst51Quest5
Inst51Quest5_HORDE_Level = Inst51Quest5_Level
Inst51Quest5_HORDE_Attain = Inst51Quest5_Attain
Inst51Quest5_HORDE_Aim = Inst51Quest5_Aim
Inst51Quest5_HORDE_Location = Inst51Quest5_Location
Inst51Quest5_HORDE_Note = Inst51Quest5_Note
Inst51Quest5_HORDE_Prequest = Inst51Quest5_Prequest
Inst51Quest5_HORDE_Folgequest = Inst51Quest5_Folgequest
--
Inst51Quest5name1_HORDE = Inst51Quest5name1



--------------- INST52 - Gruul's Lair (GL) ---------------

Inst52Story = "Gruul der Drachenschlächter ist, wie sein Name vermuten lässt, ein bedeutender drachentötender Gronn, ebenso wie der Endboss der Schlachtzugsinstanz Gruuls Unterschlupf im Schergrat.\n\nEr droppt die Tier-4-Bein-Gutscheine.\n\nEr ist der Vater von 7 Gronns, darunter Goc, Gorgrom der Drachenfresser, Grulloc, Maggoc und Durn der Nimmersatte.\n\nZusammenfassung des Kampfes: Steine fallen herunter. Leute sterben."
Inst52Caption = "Gruuls Unterschlupf"
Inst52QAA = "1 Quest"
Inst52QAH = "1 Quest"

--Quest 1 Alliance
Inst52Quest1 = "1. Der Knüppel von Kar'desh"
Inst52Quest1_Level = "70"
Inst52Quest1_Attain = "70"
Inst52Quest1_Aim = "Nar'biss der Ketzer in den heroischen Sklavenunterkünften des Echsenkessels möchte, dass Ihr ihm das Erdensiegel und das Flammensiegel bringt."
Inst52Quest1_Location = "Nar'biss der Ketzer (Sklavenunterkünfte; "..YELLOW.."Heroisch [3]"..WHITE..")"
Inst52Quest1_Note = "Das Erdensiegel droppt von Gruul bei "..YELLOW.."[2]"..WHITE..", und das Flammensiegel droppt von Schrecken der Nacht in "..YELLOW.."Karazhan"..WHITE..".\n\nDiese Quest wurde benötigt, um die Höhle des Schlangenschreins zu betreten, ist aber nicht mehr nötig."
Inst52Quest1_Prequest = "Nein"
Inst52Quest1_Folgequest = "Nein"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst52Quest1_HORDE = Inst52Quest1
Inst52Quest1_HORDE_Level = Inst52Quest1_Level
Inst52Quest1_HORDE_Attain = Inst52Quest1_Attain
Inst52Quest1_HORDE_Aim = Inst52Quest1_Aim
Inst52Quest1_HORDE_Location = Inst52Quest1_Location
Inst52Quest1_HORDE_Note = Inst52Quest1_Note
Inst52Quest1_HORDE_Prequest = Inst52Quest1_Prequest
Inst52Quest1_HORDE_Folgequest = Inst52Quest1_Folgequest
-- No Rewards for this quest



--------------- INST53 - Karazhan (Kara) ---------------

Inst53Story = "Der baufällige Turm von Karazhan beheimatete einst einen der größten Mächte, die Azeroth jemals gekannt hat: den Zauberer Medivh.\n\nSeit seinem Tod liegt ein schrecklicher Flucht über dem Turms und das ihn umgebende Land.\n\nDie Geister von Adeligen aus dem naheliegenden Dunkelhain streifen angeblich durch seine Hallen und ertragen aufgrund ihrer Neugier ein Schicksal, das schlimmer ist als der Tod.\n\nGefährlichere Geister warten in Medivhs Arbeitszimmer, da er es war, der die dämonischen Einheiten beschworen hat, damit sie nach seiner Pfeife tanzen.\n\nTrotzdem zieht es die Mutigen und die Törichten weiter schonungslos nach Karazhan, verleitet von Gerüchten über unaussprechliche Geheimnisse und mächtige Schätze.\n\nBilde eine Gruppe von zehn treuen Helden und reise in den Turm im Gebirgspass der Totenwinde - aber sei gewarnt, dass nur solche, die Stufe 70 erreicht haben, eintreten dürfen."
Inst53Caption = "Karazhan"
Inst53QAA = "14 Quests"
Inst53QAH = "14 Quests"

--Quest 1 Alliance
Inst53Quest1 = "1. Einschätzung der Situation"
Inst53Quest1_Level = "70"
Inst53Quest1_Attain = "69"
Inst53Quest1_Aim = "Findet Koren in Karazhan."
Inst53Quest1_Location = "Erzmagier Alturus (Gebirgspass der Totenwinde - Karazhan; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest1_Note = "Koren befindet sich in Karazhan hinter Attumen dem Jäger bei "..YELLOW.."[6]"..WHITE.."."
Inst53Quest1_Prequest = "Ja, Arkane Störungen -> Das Violette Auge"
Inst53Quest1_Folgequest = "Ja, Keannas Aufzeichnungen"
Inst53Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst53Quest2 = "2. Keannas Aufzeichnungen"
Inst53Quest2_Level = "70"
Inst53Quest2_Attain = "70"
Inst53Quest2_Aim = "Durchsucht die Gästezimmer in Karazhan nach Keannas Aufzeichnungen und bringt sie zu Erzmagier Alturus außerhalb von Karazhan."
Inst53Quest2_Location = "Koren (Karazhan; "..YELLOW.."[6]"..WHITE..")"
Inst53Quest2_Note = "Die Aufzeichnungen befindet sich in dem zweiten Raum des Gangs, der zur Tugendhaften Maid bei "..YELLOW.."[10]"..WHITE.." führt, auf einem Tisch. Erzmagier Alturus befindet sich bei (Gebirgspass der Totenwinde - Karazhan; "..YELLOW.."47,75"..WHITE..")."
Inst53Quest2_Prequest = "Ja, Einschätzung der Situation"
Inst53Quest2_Folgequest = "Ja, Eine dämonische Präsenz"
Inst53Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst53Quest3 = "3. Eine dämonische Präsenz"
Inst53Quest3_Level = "70"
Inst53Quest3_Attain = "70"
Inst53Quest3_Aim = "Erzmagier Alturus möchte, dass Ihr die dämonische Präsenz an der Turmspitze von Karazhan zerstört."
Inst53Quest3_Location = "Erzmagier Alturus (Gebirgspass der Totenwinde - Karazhan; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest3_Note = "Prinz Malchezaar befindet sich bei "..YELLOW.."[26]"..WHITE.."."
Inst53Quest3_Prequest = "Ja, Keannas Aufzeichnungen"
Inst53Quest3_Folgequest = "Ja, Neue Anweisungen"
Inst53Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst53Quest4 = "4. Neue Anweisungen"
Inst53Quest4_Level = "70"
Inst53Quest4_Attain = "70"
Inst53Quest4_Aim = "Sprecht mit Erzmagier Cedric am Rande von Dalaran."
Inst53Quest4_Location = "Erzmagier Alturus (Gebirgspass der Totenwinde - Karazhan; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest4_Note = "Erzmagier Cedric befindet sich bei (Alteracgebirge - Dalaran; "..YELLOW.."15,54"..WHITE..")"
Inst53Quest4_Prequest = "Ja, Eine dämonische Präsenz"
Inst53Quest4_Folgequest = "Nein"
Inst53Quest4FQuest = "true"
--
Inst53Quest4name1 = "Violettes Abzeichen"

--Quest 5 Alliance
Inst53Quest5 = "5. Medivhs Tagebuch"
Inst53Quest5_Level = "70"
Inst53Quest5_Attain = "70"
Inst53Quest5_Aim = "Erzmagier Alturus am Gebirgspass der Totenwinde möchte, dass Ihr nach Karazhan geht und mit Wravien sprecht."
Inst53Quest5_Location = "Erzmagier Alturus (Gebirgspass der Totenwinde - Karazhan; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest5_Note = "Benötigt Wohlwollend beim Violetten Auge. Wravien befindet sich in der Bibliothek der Wächter hinter dem Kurator bei "..YELLOW.."[17]"..WHITE.."."
Inst53Quest5_Prequest = "Nein"
Inst53Quest5_Folgequest = "Ja, In guten Händen"
-- No Rewards for this quest

--Quest 6 Alliance
Inst53Quest6 = "6. In guten Händen"
Inst53Quest6_Level = "70"
Inst53Quest6_Attain = "70"
Inst53Quest6_Aim = "Sprecht mit Gradav in der Bibliothek des Wächters in Karazhan."
Inst53Quest6_Location = "Wravien (Karazhan; "..YELLOW.."[17]"..WHITE..")"
Inst53Quest6_Note = "Gradav befindet sich im gleichen Raum wie Wravien bei "..YELLOW.."[18]"..WHITE.."."
Inst53Quest6_Prequest = "Ja, Medivhs Tagebuch"
Inst53Quest6_Folgequest = "Ja, Kamsis"
Inst53Quest6FQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst53Quest7 = "7. Kamsis"
Inst53Quest7_Level = "70"
Inst53Quest7_Attain = "70"
Inst53Quest7_Aim = "Sprecht mit Kamsis in der Bibliothek des Wächters in Karazhan."
Inst53Quest7_Location = "Gradav (Karazhan; "..YELLOW.."[18]"..WHITE..")"
Inst53Quest7_Note = "Kamsis befindet sich im gleichen Raum wie Gradav bei "..YELLOW.."[19]"..WHITE.."."
Inst53Quest7_Prequest = "Ja, In guten Händen"
Inst53Quest7_Folgequest = "Ja, Arans Schemen"
Inst53Quest7FQuest = "true"
-- No Rewards for this quest

--Quest 8 Alliance
Inst53Quest8 = "8. Arans Schemen"
Inst53Quest8_Level = "70"
Inst53Quest8_Attain = "70"
Inst53Quest8_Aim = "Beschafft Medivhs Tagebuch und kehrt zu Kamsis in der Bibliothek des Wächters in Karazhan zurück."
Inst53Quest8_Location = "Kamsis (Karazhan; "..YELLOW.."[19]"..WHITE..")"
Inst53Quest8_Note = "Arans Schemen bei "..YELLOW.."[21]"..WHITE.." droppt das Tagebuch."
Inst53Quest8_Prequest = "Ja, Kamsis"
Inst53Quest8_Folgequest = "Ja, Die Terrasse des Meisters"
Inst53Quest8FQuest = "true"
-- No Rewards for this quest

--Quest 9 Alliance
Inst53Quest9 = "9. Die Terrasse des Meisters"
Inst53Quest9_Level = "70"
Inst53Quest9_Attain = "70"
Inst53Quest9_Aim = "Geht zur Terrasse des Meisters in Karazhan und lest Medivhs Tagebuch. Kehrt danach mit Medivhs Tagebuch zu Erzmagier Alturus zurück."
Inst53Quest9_Location = "Kamsis (Karazhan; "..YELLOW.."[19]"..WHITE..")"
Inst53Quest9_Note = "Erzmagier Alturus befindet sich bei (Gebirgspass der Totenwinde; "..YELLOW.."47,75"..WHITE.."). Führt zu keinem Kampf. Genieß die Darbietung."
Inst53Quest9_Prequest = "Ja, Arans Schemen"
Inst53Quest9_Folgequest = "Ja, Die Vergangenheit aufwühlen"
Inst53Quest9FQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst53Quest10 = "10. Die Vergangenheit aufwühlen"
Inst53Quest10_Level = "70"
Inst53Quest10_Attain = "70"
Inst53Quest10_Aim = "Erzmagier Alturus möchte, dass Ihr zu den Bergen südlich von Karazhan im Gebirgspass der Totenwinde geht und ein verkohltes Knochenfragment besorgt."
Inst53Quest10_Location = "Erzmagier Alturus (Gebirgspass der Totenwinde - Karazhan; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest10_Note = "Das verkohlte Knochenfragment befindet sich bei "..YELLOW.."44,78"..WHITE.." im Gebirgspass der Totenwinde."
Inst53Quest10_Prequest = "Ja, Die Terrasse des Meisters"
Inst53Quest10_Folgequest = "Ja, Hilfe unter Kollegen"
Inst53Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst53Quest11 = "11. Hilfe unter Kollegen"
Inst53Quest11_Level = "70"
Inst53Quest11_Attain = "70"
Inst53Quest11_Aim = "Bringt das verkohlte Knochenfragment zu Kalynna Lathred in Area 52 im Nethersturm."
Inst53Quest11_Location = "Erzmagier Alturus (Gebirgspass der Totenwinde - Karazhan; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest11_Note = "Kalynna Lathred befindet sich bei (Nethersturm - Area 52; "..YELLOW.."32,63"..WHITE..")."
Inst53Quest11_Prequest = "Ja, Die Vergangenheit aufwühlen"
Inst53Quest11_Folgequest = "Ja, Kalynnas Bitte"
Inst53Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst53Quest12 = "12. Kalynnas Bitte"
Inst53Quest12_Level = "70"
Inst53Quest12_Attain = "70"
Inst53Quest12_Aim = "Kalynna Lathred möchte, dass Ihr den Dämmerfolianten vom Großhexenmeister Nethekurse in den zerschmetterten Hallen der Höllenfeuerzitadelle und das Buch der vergessenen Namen von Dunkelwirker Syth in den Sethekkhallen in Auchindoun besorgt."
Inst53Quest12_Location = "Kalynna Lathred (Nethersturm - Area 52; "..YELLOW.."32,63"..WHITE..")"
Inst53Quest12_Note = "Ihr müsst in die Zerschmetterten Hallen und die Sethekkhallen auf dem Schwierigkeitsgrad 'Heroisch' reisen."
Inst53Quest12_Prequest = "Ja, Hilfe unter Kollegen"
Inst53Quest12_Folgequest = "Ja, Schrecken der Nacht"
Inst53Quest12FQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst53Quest13 = "13. Schrecken der Nacht"
Inst53Quest13_Level = "70"
Inst53Quest13_Attain = "70"
Inst53Quest13_Aim = "Geht zur Terrasse des Meisters in Karazhan und benutzt Kalynnas Urne, um den Schrecken der Nacht zu rufen. Entzieht dem Körper des Schreckens die schwache arkane Essenz und bringt sie zu Erzmagier Alturus."
Inst53Quest13_Location = "Kalynna Lathred (Nethersturm - Area 52; "..YELLOW.."32,63"..WHITE..")"
Inst53Quest13_Note = "Schrecken der Nacht wird bei "..YELLOW.."[15]"..WHITE.." beschworen. Kehre zu Erzmagier Alturus bei (Gebirgspass der Totenwinde - Karazhan; "..YELLOW.."47,75"..WHITE..") zurück, um die Quest abzugeben."
Inst53Quest13_Prequest = "Ja, Kalynnas Bitte"
Inst53Quest13_Folgequest = "Nein"
Inst53Quest13FQuest = "true"
--
Inst53Quest13name1 = "Pulsierender Amethyst"
Inst53Quest13name2 = "Beruhigender Amethyst"
Inst53Quest13name3 = "Energieerfüllter Amethyst"

--Quest 14 Alliance
Inst53Quest14 = "14. Der Knüppel von Kar'desh"
Inst53Quest14_Level = "70"
Inst53Quest14_Attain = "70"
Inst53Quest14_Aim = "Nar'biss der Ketzer in den heroischen Sklavenunterkünften des Echsenkessels möchte, dass Ihr ihm das Erdensiegel und das Flammensiegel bringt."
Inst53Quest14_Location = "Nar'biss der Ketzer (Sklavenunterkünfte; "..YELLOW.."Heroisch [3]"..WHITE..")"
Inst53Quest14_Note = "Das Erdensiegel droppt von Gruul bei "..YELLOW.."[2]"..WHITE..", und das Flammensiegel droppt von Schrecken der Nacht in "..YELLOW.."Karazhan"..WHITE..".\n\nDiese Quest wurde benötigt, um die Höhle des Schlangenschreins zu betreten, ist aber nicht mehr nötig."
Inst53Quest14_Prequest = "Nein"
Inst53Quest14_Folgequest = "Nein"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst53Quest1_HORDE = Inst53Quest1
Inst53Quest1_HORDE_Level = Inst53Quest1_Level
Inst53Quest1_HORDE_Attain = Inst53Quest1_Attain
Inst53Quest1_HORDE_Aim = Inst53Quest1_Aim
Inst53Quest1_HORDE_Location = Inst53Quest1_Location
Inst53Quest1_HORDE_Note = Inst53Quest1_Note
Inst53Quest1_HORDE_Prequest = Inst53Quest1_Prequest
Inst53Quest1_HORDE_Folgequest = Inst53Quest1_Folgequest
Inst53Quest1PreQuest_HORDE = Inst53Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst53Quest2_HORDE = Inst53Quest2
Inst53Quest2_HORDE_Level = Inst53Quest2_Level
Inst53Quest2_HORDE_Attain = Inst53Quest2_Attain
Inst53Quest2_HORDE_Aim = Inst53Quest2_Aim
Inst53Quest2_HORDE_Location = Inst53Quest2_Location
Inst53Quest2_HORDE_Note = Inst53Quest2_Note
Inst53Quest2_HORDE_Prequest = Inst53Quest2_Prequest
Inst53Quest2_HORDE_Folgequest = Inst53Quest2_Folgequest
Inst53Quest2FQuest_HORDE = Inst53Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst53Quest3_HORDE = Inst53Quest3
Inst53Quest3_HORDE_Level = Inst53Quest3_Level
Inst53Quest3_HORDE_Attain = Inst53Quest3_Attain
Inst53Quest3_HORDE_Aim = Inst53Quest3_Aim
Inst53Quest3_HORDE_Location = Inst53Quest3_Location
Inst53Quest3_HORDE_Note = Inst53Quest3_Note
Inst53Quest3_HORDE_Prequest = Inst53Quest3_Prequest
Inst53Quest3_HORDE_Folgequest = Inst53Quest3_Folgequest
Inst53Quest3FQuest_HORDE = Inst53Quest3FQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst53Quest4_HORDE = Inst53Quest4
Inst53Quest4_HORDE_Level = Inst53Quest4_Level
Inst53Quest4_HORDE_Attain = Inst53Quest4_Attain
Inst53Quest4_HORDE_Aim = Inst53Quest4_Aim
Inst53Quest4_HORDE_Location = Inst53Quest4_Location
Inst53Quest4_HORDE_Note = Inst53Quest4_Note
Inst53Quest4_HORDE_Prequest = Inst53Quest4_Prequest
Inst53Quest4_HORDE_Folgequest = Inst53Quest4_Folgequest
Inst53Quest4FQuest_HORDE = Inst53Quest4FQuest
--
Inst53Quest4name1_HORDE = Inst53Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst53Quest5_HORDE = Inst53Quest5
Inst53Quest5_HORDE_Level = Inst53Quest5_Level
Inst53Quest5_HORDE_Attain = Inst53Quest5_Attain
Inst53Quest5_HORDE_Aim = Inst53Quest5_Aim
Inst53Quest5_HORDE_Location = Inst53Quest5_Location
Inst53Quest5_HORDE_Note = Inst53Quest5_Note
Inst53Quest5_HORDE_Prequest = Inst53Quest5_Prequest
Inst53Quest5_HORDE_Folgequest = Inst53Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst53Quest6_HORDE = Inst53Quest6
Inst53Quest6_HORDE_Level = Inst53Quest6_Level
Inst53Quest6_HORDE_Attain = Inst53Quest6_Attain
Inst53Quest6_HORDE_Aim = Inst53Quest6_Aim
Inst53Quest6_HORDE_Location = Inst53Quest6_Location
Inst53Quest6_HORDE_Note = Inst53Quest6_Note
Inst53Quest6_HORDE_Prequest = Inst53Quest6_Prequest
Inst53Quest6_HORDE_Folgequest = Inst53Quest6_Folgequest
Inst53Quest6FQuest_HORDE = Inst53Quest6FQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst53Quest7_HORDE = Inst53Quest7
Inst53Quest7_HORDE_Level = Inst53Quest7_Level
Inst53Quest7_HORDE_Attain = Inst53Quest7_Attain
Inst53Quest7_HORDE_Aim = Inst53Quest7_Aim
Inst53Quest7_HORDE_Location = Inst53Quest7_Location
Inst53Quest7_HORDE_Note = Inst53Quest7_Note
Inst53Quest7_HORDE_Prequest = Inst53Quest7_Prequest
Inst53Quest7_HORDE_Folgequest = Inst53Quest7_Folgequest
Inst53Quest7FQuest_HORDE = Inst53Quest7FQuest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst53Quest8_HORDE = Inst53Quest8
Inst53Quest8_HORDE_Level = Inst53Quest8_Level
Inst53Quest8_HORDE_Attain = Inst53Quest8_Attain
Inst53Quest8_HORDE_Aim = Inst53Quest8_Aim
Inst53Quest8_HORDE_Location = Inst53Quest8_Location
Inst53Quest8_HORDE_Note = Inst53Quest8_Note
Inst53Quest8_HORDE_Prequest = Inst53Quest8_Prequest
Inst53Quest8_HORDE_Folgequest = Inst53Quest8_Folgequest
Inst53Quest8FQuest_HORDE = Inst53Quest8FQuest
-- No Rewards for this quest

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst53Quest9_HORDE = Inst53Quest9
Inst53Quest9_HORDE_Level = Inst53Quest9_Level
Inst53Quest9_HORDE_Attain = Inst53Quest9_Attain
Inst53Quest9_HORDE_Aim = Inst53Quest9_Aim
Inst53Quest9_HORDE_Location = Inst53Quest9_Location
Inst53Quest9_HORDE_Note = Inst53Quest9_Note
Inst53Quest9_HORDE_Prequest = Inst53Quest9_Prequest
Inst53Quest9_HORDE_Folgequest = Inst53Quest9_Folgequest
Inst53Quest9FQuest_HORDE = Inst53Quest9FQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst53Quest10_HORDE = Inst53Quest10
Inst53Quest10_HORDE_Level = Inst53Quest10_Level
Inst53Quest10_HORDE_Attain = Inst53Quest10_Attain
Inst53Quest10_HORDE_Aim = Inst53Quest10_Aim
Inst53Quest10_HORDE_Location = Inst53Quest10_Location
Inst53Quest10_HORDE_Note = Inst53Quest10_Note
Inst53Quest10_HORDE_Prequest = Inst53Quest10_Prequest
Inst53Quest10_HORDE_Folgequest = Inst53Quest10_Folgequest
Inst53Quest10FQuest_HORDE = Inst53Quest10FQuest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst53Quest11_HORDE = Inst53Quest11
Inst53Quest11_HORDE_Level = Inst53Quest11_Level
Inst53Quest11_HORDE_Attain = Inst53Quest11_Attain
Inst53Quest11_HORDE_Aim = Inst53Quest11_Aim
Inst53Quest11_HORDE_Location = Inst53Quest11_Location
Inst53Quest11_HORDE_Note = Inst53Quest11_Note
Inst53Quest11_HORDE_Prequest = Inst53Quest11_Prequest
Inst53Quest11_HORDE_Folgequest = Inst53Quest11_Folgequest
Inst53Quest11FQuest_HORDE = Inst53Quest11FQuest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst53Quest12_HORDE = Inst53Quest12
Inst53Quest12_HORDE_Level = Inst53Quest12_Level
Inst53Quest12_HORDE_Attain = Inst53Quest12_Attain
Inst53Quest12_HORDE_Aim = Inst53Quest12_Aim
Inst53Quest12_HORDE_Location = Inst53Quest12_Location
Inst53Quest12_HORDE_Note = Inst53Quest12_Note
Inst53Quest12_HORDE_Prequest = Inst53Quest12_Prequest
Inst53Quest12_HORDE_Folgequest = Inst53Quest12_Folgequest
Inst53Quest12FQuest_HORDE = Inst53Quest12FQuest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst53Quest13_HORDE = Inst53Quest13
Inst53Quest13_HORDE_Level = Inst53Quest13_Level
Inst53Quest13_HORDE_Attain = Inst53Quest13_Attain
Inst53Quest13_HORDE_Aim = Inst53Quest13_Aim
Inst53Quest13_HORDE_Location = Inst53Quest13_Location
Inst53Quest13_HORDE_Note = Inst53Quest13_Note
Inst53Quest13_HORDE_Prequest = Inst53Quest13_Prequest
Inst53Quest13_HORDE_Folgequest = Inst53Quest13_Folgequest
Inst53Quest13FQuest_HORDE = Inst53Quest13FQuest
--
Inst53Quest13name1_HORDE = Inst53Quest13name1
Inst53Quest13name2_HORDE = Inst53Quest13name2
Inst53Quest13name3_HORDE = Inst53Quest13name3

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst53Quest14_HORDE = Inst53Quest14
Inst53Quest14_HORDE_Level = Inst53Quest14_Level
Inst53Quest14_HORDE_Attain = Inst53Quest14_Attain
Inst53Quest14_HORDE_Aim = Inst53Quest14_Aim
Inst53Quest14_HORDE_Location = Inst53Quest14_Location
Inst53Quest14_HORDE_Note = Inst53Quest14_Note
Inst53Quest14_HORDE_Prequest = Inst53Quest14_Prequest
Inst53Quest14_HORDE_Folgequest = Inst53Quest14_Folgequest
-- No Rewards for this quest



--------------- INST54 - TK: Arcatraz (Arc) ---------------

Inst54Story = "Die Festung der Stürme ist eine ehemalige Festung der Naaru im Nethersturm in der Scherbenwelt.\n\nDiese kristallene Festung wird nun von Kael'thas Sonnenwanderer regiert, dem Herren der Blutelfen, und wird dominiert von den Kerben seiner Brüder.\n\nDie Struktur ist in drei Flügel eingeteilt - Satelliten gigantischen Ausmaßes - mit dem viertel Flügel, der Exodar, nun in the Welt von Azeroth als Hauptstadt der Draenei.\n\nDie Arkatraz ist der dritte Flügel der Festung der Stürme.\n\nDie Arkatraz ist entweder zugänglich über eine lange Questreihe für den Schlüssel, bei der man die Mechanar und die Botanika durchspielen muss und die mit einer Quest (Ein Hügel voll Astraler) von Netherpirscher Khay'ji in Area 52 beginnt, oder kann von einem Stufe-70-Schurken mit 350 Punkten in Schlossknacken geöffnet werden.\n\nNur ein Mitglied der Gruppe muss den Schlüssel haben. Das Eingangsportal ist hoch über den anderen Instanzen der Festung der Stürme.\n\nEin voller Durchlauf gewährt ungefähr 1750 Rufpunkte bei den Sha'tar."
Inst54Caption = "FdS: Die Arkatraz"
Inst54QAA = "6 Quests"
Inst54QAH = "6 Quests"

--Quest 1 Alliance
Inst54Quest1 = "1. Herold der Verdammnis"
Inst54Quest1_Level = "70"
Inst54Quest1_Attain = "70"
Inst54Quest1_Aim = "Ihr wurdet beauftragt, zur Arkatraz in der Festung der Stürme zu reisen und Herold Horizontiss zu töten. Kehrt danach zu A'dal auf der Terrasse des Lichts in Shattrath zurück."
Inst54Quest1_Location = "A'dal (Shattrath - Terrasse des Lichts; "..YELLOW.."53,43"..WHITE..")"
Inst54Quest1_Note = "Dies ist Teil der Schlüsselquestreihe, die im Nethersturm bei Netherpirscher Khay'ji bei (Nethersturm - Area 52; "..YELLOW.."32,64"..WHITE..") startet."
Inst54Quest1_Prequest = "Ja, Sphärenräuber Nesaad -> Wie man in Arkatraz einbricht"
Inst54Quest1_Folgequest = "Nein"
Inst54Quest1PreQuest = "true"
--
Inst54Quest1name1 = "Mächtiger Anhänger der Sha'tari"
Inst54Quest1name2 = "A'dals Halskette der Erholung"
Inst54Quest1name3 = "Machtvoller Halsschmuck von Shattrath"

--Quest 2 Alliance
Inst54Quest2 = "2. Seher Udalo"
Inst54Quest2_Level = "70"
Inst54Quest2_Attain = "68"
Inst54Quest2_Aim = "Sucht Seher Udalo in der Arkatraz in der Festung der Stürme."
Inst54Quest2_Location = "Akama (Schattenmondtal - Kammer des Wächters; "..YELLOW.."58,48"..WHITE..")"
Inst54Quest2_Note = "Seher Udalo befindet sich bei "..YELLOW.."[5]"..WHITE..", kurz vor dem Raum mit dem Endgegner.\n\nDieses Quest ist Teil der Zugangsquestreihe des Schwarzen Tempels, die bei Anachoret Ceyla (Schattenmondtal - Altar der Sha'tar; "..YELLOW.."62,38"..WHITE..") für die Aldor und Arkanist Thelis (Schattenmondtal - Sanktum der Sterne; "..YELLOW.."56,59"..WHITE..") für die Seher startet."
Inst54Quest2_Prequest = "Ja, Schrifttafeln von Baa'ri -> Akama"
Inst54Quest2_Folgequest = "Ja, Ein mysteriöses Omen"
Inst54Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst54Quest3 = "3. Die Prüfung der Naaru: Zuverlässigkeit (Heroisch)"
Inst54Quest3_Level = "70"
Inst54Quest3_Attain = "70"
Inst54Quest3_Aim = "A'dal in Shattrath möchte, dass Ihr Millhaus Manasturm aus der Arkatraz in der Festung der Stürme rettet."
Inst54Quest3_Location = "A'dal (Shattrath - Terrasse des Lichts; "..YELLOW.."53,43"..WHITE..")"
Inst54Quest3_Note = "Diese Aufgabe muss auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden. Millhaus Manasturm ist in dem Raum mit Aufseher Mellichar bei "..YELLOW.."[6]"..WHITE..".\n\nDiese Quest wurde benötigt, um die Festung der Stürme zu betreten, ist aber nicht mehr nötig."
Inst54Quest3_Prequest = "Nein"
Inst54Quest3_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Alliance
Inst54Quest4 = "4. Das zweite und das dritte Fragment"
Inst54Quest4_Level = "70"
Inst54Quest4_Attain = "68"
Inst54Quest4_Aim = "Besorgt das zweite Schlüsselfragment aus einem arkanen Behälter im Echsenkessel und das dritte Schlüsselfragment aus einem arkanen Behälter in der Festung der Stürme. Kehrt dann zu Khadgar in Shattrath zurück."
Inst54Quest4_Location = "Khadgar (Shattrath - Terrasse des Lichts; "..YELLOW.."54,44"..WHITE..")"
Inst54Quest4_Note = "Teil der Karazhan-Vorquestreihe. Der arkane Behälter befindet sich bei "..YELLOW.."[2]"..WHITE..". Wenn man ihn öffnet, erscheint ein Elementar, der getötet werden muss, um das Fragment zu erhalten. Das zweite Schlüsselfragment befindet sich in der Dampfkammer."
Inst54Quest4_Prequest = "Ja, Nach Karazhan ("..YELLOW.."Auch: Schattenlabyrinth"..WHITE..")"
Inst54Quest4_Folgequest = "Ja, Die Berührung des Meisters ("..YELLOW.."HdZ: Der schwarze Morast"..WHITE..")"
Inst54Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst54Quest5 = "5. Gesucht: Horizontiss' Schriftrolle (Heroisches Tagesquest)"
Inst54Quest5_Level = "70"
Inst54Quest5_Attain = "70"
Inst54Quest5_Aim = "Windhändler Zhareem hat Euch darum gebeten, ihm Horizontiss' Schriftrolle zu beschaffen. Bringt sie zu ihm ins untere Viertel in Shattrath, um Eure Belohnung zu erhalten."
Inst54Quest5_Location = "Windhändler Zhareem (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst54Quest5_Note = "Diese Aufgabe muss auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden.\n\nHerold Horizontiss befindet sich bei "..YELLOW.."[6]"..WHITE.."."
Inst54Quest5_Prequest = "Nein"
Inst54Quest5_Folgequest = "Nein"
--
Inst54Quest5name1 = "Abzeichen der Gerechtigkeit"

--Quest 6 Alliance
Inst54Quest6 = "6. Gesucht: Schildwachen der Arkatraz (Tagesquest)"
Inst54Quest6_Level = "70"
Inst54Quest6_Attain = "70"
Inst54Quest6_Aim = "Netherpirscher Mah'duun hat Euch damit beauftragt, 5 Schildwachen der Arkatraz zu töten. Kehrt erst zu ihm in das untere Viertel in Shattrath zurück, wenn sie alle dem Tod überantwortet wurden."
Inst54Quest6_Location = "Netherpirscher Mah'duun (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst54Quest6_Note = "Dies ist ein Tagesquest."
Inst54Quest6_Prequest = "Nein"
Inst54Quest6_Folgequest = "Nein"
--
Inst54Quest6name1 = "Gefängnisschlüssel des Astraleums"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst54Quest1_HORDE = Inst54Quest1
Inst54Quest1_HORDE_Level = Inst54Quest1_Level
Inst54Quest1_HORDE_Attain = Inst54Quest1_Attain
Inst54Quest1_HORDE_Aim = Inst54Quest1_Aim
Inst54Quest1_HORDE_Location = Inst54Quest1_Location
Inst54Quest1_HORDE_Note = Inst54Quest1_Note
Inst54Quest1_HORDE_Prequest = Inst54Quest1_Prequest
Inst54Quest1_HORDE_Folgequest = Inst54Quest1_Folgequest
Inst54Quest1PreQuest_HORDE = Inst54Quest1PreQuest
--
Inst54Quest1name1_HORDE = Inst54Quest1name1
Inst54Quest1name2_HORDE = Inst54Quest1name2
Inst54Quest1name3_HORDE = Inst54Quest1name3

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst54Quest2_HORDE = Inst54Quest2
Inst54Quest2_HORDE_Level = Inst54Quest2_Level
Inst54Quest2_HORDE_Attain = Inst54Quest2_Attain
Inst54Quest2_HORDE_Aim = Inst54Quest2_Aim
Inst54Quest2_HORDE_Location = Inst54Quest2_Location
Inst54Quest2_HORDE_Note = Inst54Quest2_Note
Inst54Quest2_HORDE_Prequest = Inst54Quest2_Prequest
Inst54Quest2_HORDE_Folgequest = Inst54Quest2_Folgequest
Inst54Quest2PreQuest_HORDE = Inst54Quest2PreQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst54Quest3_HORDE = Inst54Quest3
Inst54Quest3_HORDE_Level = Inst54Quest3_Level
Inst54Quest3_HORDE_Attain = Inst54Quest3_Attain
Inst54Quest3_HORDE_Aim = Inst54Quest3_Aim
Inst54Quest3_HORDE_Location = Inst54Quest3_Location
Inst54Quest3_HORDE_Note = Inst54Quest3_Note
Inst54Quest3_HORDE_Prequest = Inst54Quest3_Prequest
Inst54Quest3_HORDE_Folgequest = Inst54Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst54Quest4_HORDE = Inst54Quest4
Inst54Quest4_HORDE_Level = Inst54Quest4_Level
Inst54Quest4_HORDE_Attain = Inst54Quest4_Attain
Inst54Quest4_HORDE_Aim = Inst54Quest4_Aim
Inst54Quest4_HORDE_Location = Inst54Quest4_Location
Inst54Quest4_HORDE_Note = Inst54Quest4_Note
Inst54Quest4_HORDE_Prequest = Inst54Quest4_Prequest
Inst54Quest4_HORDE_Folgequest = Inst54Quest4_Folgequest
Inst54Quest4PreQuest_HORDE = Inst54Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst54Quest5_HORDE = Inst54Quest5
Inst54Quest5_HORDE_Level = Inst54Quest5_Level
Inst54Quest5_HORDE_Attain = Inst54Quest5_Attain
Inst54Quest5_HORDE_Aim = Inst54Quest5_Aim
Inst54Quest5_HORDE_Location = Inst54Quest5_Location
Inst54Quest5_HORDE_Note = Inst54Quest5_Note
Inst54Quest5_HORDE_Prequest = Inst54Quest5_Prequest
Inst54Quest5_HORDE_Folgequest = Inst54Quest5_Folgequest
--
Inst54Quest5name1_HORDE = Inst54Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst54Quest6_HORDE = Inst54Quest6
Inst54Quest6_HORDE_Level = Inst54Quest6_Level
Inst54Quest6_HORDE_Attain = Inst54Quest6_Attain
Inst54Quest6_HORDE_Aim = Inst54Quest6_Aim
Inst54Quest6_HORDE_Location = Inst54Quest6_Location
Inst54Quest6_HORDE_Note = Inst54Quest6_Note
Inst54Quest6_HORDE_Prequest = Inst54Quest6_Prequest
Inst54Quest6_HORDE_Folgequest = Inst54Quest6_Folgequest
--
Inst54Quest6name1_HORDE = Inst54Quest6name1



--------------- INST55 - TK: Botanica (Bot) ---------------

Inst55Story = "Die Festung der Stürme ist eine ehemalige Festung der Naaru im Nethersturm in der Scherbenwelt.\n\nDiese kristallene Festung wird nun von Kael'thas Sonnenwanderer regiert, dem Herren der Blutelfen, und wird dominiert von den Kerben seiner Brüder.\n\nDie Struktur ist in drei Flügel eingeteilt - Satelliten gigantischen Ausmaßes - mit dem viertel Flügel, der Exodar, nun in the Welt von Azeroth als Hauptstadt der Draenei.\n\nDie Botanika ist der zweite Flügel der Festung der Stürme und liegt direkt nördlich vom Hauptpalast (dem blauen kristallenen Gebäude).\n\nDies ist auch der Sitz des Kael'thas-Kommandanten: Kommandant Sarannis."
Inst55Caption = "FdS: Die Botanika"
Inst55QAA = "5 Quests"
Inst55QAH = "5 Quests"

--Quest 1 Alliance
Inst55Quest1 = "1. Wie man in Arkatraz einbricht"
Inst55Quest1_Level = "70"
Inst55Quest1_Attain = "67"
Inst55Quest1_Aim = "A'dal bittet Euch, das obere und das untere Fragment des Schlüssels zur Arkatraz zu besorgen. Bringt beide Fragmente zu ihm zurück, damit er sie für Euch zum Schlüssel zur Arkatraz zusammenfügen kann."
Inst55Quest1_Location = "A'dal (Shattrath - Terrasse des Lichts; "..YELLOW.."53,43"..WHITE..")"
Inst55Quest1_Note = "Das untere Schlüsselfragment droppt von Warpzweig bei "..YELLOW.."[5]"..WHITE..". Das obere Fragment droppt in der Mechanar."
Inst55Quest1_Prequest = "Ja, Sphärenräuber Nesaad -> Sonderlieferung nach Shattrath"
Inst55Quest1_Folgequest = "Ja, Herold der Verdammnis ("..YELLOW.."FdS: Die Arkatraz"..WHITE..")"
Inst55Quest1PreQuest = "true"
--
Inst55Quest1name1 = "Anachoretenumhang der Sha'tari"
Inst55Quest1name2 = "A'dals Gabe"
Inst55Quest1name3 = "Präzisionsgürtel der Naaru"
Inst55Quest1name4 = "Championgürtel von Shattrath"
Inst55Quest1name5 = "Verteidigertaillenschutz der Sha'tari*"
Inst55Quest1name6 = "Schlüssel zur Arkatraz"

--Quest 2 Alliance
Inst55Quest2 = "2. Den Schlüsselstein erobern"
Inst55Quest2_Level = "70"
Inst55Quest2_Attain = "67"
Inst55Quest2_Aim = "Reist zur Botanika der Festung der Stürme und besorgt Euch den Schlüsselstein von Kommandant Sarannis. Bringt ihn danach zu Erzmagier Vargoth im violetten Turm."
Inst55Quest2_Location = "Erzmagier Vargoth (Nethersturm - Dorf Kirin'Var; "..YELLOW.."58,86"..WHITE..")"
Inst55Quest2_Note = "Kommandant Sarannis befindet sich bei "..YELLOW.."[1]"..WHITE..". Angeblich droppt der Schlüsselstein nicht im heroischen Modus."
Inst55Quest2_Prequest = "Ja, Den Schlüsselmeister finden"
Inst55Quest2_Folgequest = "Nein"
Inst55Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst55Quest3 = "3. Meister der Tränke (Alchimie)"
Inst55Quest3_Level = "70"
Inst55Quest3_Attain = "68"
Inst55Quest3_Aim = "Lauranna Thar'well möchte, dass Ihr die Botanika der Festung der Stürme betretet und den Naturführer der Botanika von Botaniker Freywinn besorgt. Zusätzlich möchte sie, dass Ihr ihr 5 erstklassige Heiltränke, 5 erstklassige Manatränke und 5 erhebliche Tränke des traumlosen Schlafs bringt."
Inst55Quest3_Location = "Lauranna Thar'well (Zangarmarschen - Zuflucht des Cenarius; "..YELLOW.."80,64"..WHITE..")"
Inst55Quest3_Note = "Alchimie-Quest. Hochbotaniker Freywinn befindet sich bei "..YELLOW.."[2]"..WHITE.."."
Inst55Quest3_Prequest = "Ja, Meister der Tränke"
Inst55Quest3_Folgequest = "Nein"
Inst55Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst55Quest4 = "4. Gesucht: Warpzweigsplitter (Heroisches Tagesquest)"
Inst55Quest4_Level = "70"
Inst55Quest4_Attain = "70"
Inst55Quest4_Aim = "Windhändler Zhareem hat Euch darum gebeten, ihm einen Warpzweigsplitter zu beschaffen. Bringt diesen zu ihm ins untere Viertel in Shattrath, um Eure Belohnung zu erhalten."
Inst55Quest4_Location = "Windhändler Zhareem (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst55Quest4_Note = "Diese Aufgabe muss auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden.\n\nWarpzweig befindet sich bei "..YELLOW.."[5]"..WHITE.."."
Inst55Quest4_Prequest = "Nein"
Inst55Quest4_Folgequest = "Nein"
--
Inst55Quest4name1 = "Abzeichen der Gerechtigkeit"

--Quest 5 Alliance
Inst55Quest5 = "5. Gesucht: Kanalisierer der Sonnensucher (Tagesquest)"
Inst55Quest5_Level = "70"
Inst55Quest5_Attain = "70"
Inst55Quest5_Aim = "Netherpirscher Mah'duun hat Euch damit beauftragt, 6 Kanalisierer der Sonnensucher zu töten. Kehrt erst zu ihm in das untere Viertel in Shattrath zurück, wenn sie alle dem Tod überantwortet wurden."
Inst55Quest5_Location = "Netherpirscher Mah'duun (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst55Quest5_Note = "Dies ist ein Tagesquest."
Inst55Quest5_Prequest = "Nein"
Inst55Quest5_Folgequest = "Nein"
--
Inst55Quest5name1 = "Gefängnisschlüssel des Astraleums"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst55Quest1_HORDE = Inst55Quest1
Inst55Quest1_HORDE_Level = Inst55Quest1_Level
Inst55Quest1_HORDE_Attain = Inst55Quest1_Attain
Inst55Quest1_HORDE_Aim = Inst55Quest1_Aim
Inst55Quest1_HORDE_Location = Inst55Quest1_Location
Inst55Quest1_HORDE_Note = Inst55Quest1_Note
Inst55Quest1_HORDE_Prequest = Inst55Quest1_Prequest
Inst55Quest1_HORDE_Folgequest = Inst55Quest1_Folgequest
Inst55Quest1PreQuest_HORDE = Inst55Quest1PreQuest
--
Inst55Quest1name1_HORDE = Inst55Quest1name1
Inst55Quest1name2_HORDE = Inst55Quest1name2
Inst55Quest1name3_HORDE = Inst55Quest1name3
Inst55Quest1name4_HORDE = Inst55Quest1name4
Inst55Quest1name5_HORDE = Inst55Quest1name5
Inst55Quest1name6_HORDE = Inst55Quest1name6

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst55Quest2_HORDE = Inst55Quest2
Inst55Quest2_HORDE_Level = Inst55Quest2_Level
Inst55Quest2_HORDE_Attain = Inst55Quest2_Attain
Inst55Quest2_HORDE_Aim = Inst55Quest2_Aim
Inst55Quest2_HORDE_Location = Inst55Quest2_Location
Inst55Quest2_HORDE_Note = Inst55Quest2_Note
Inst55Quest2_HORDE_Prequest = Inst55Quest2_Prequest
Inst55Quest2_HORDE_Folgequest = Inst55Quest2_Folgequest
Inst55Quest2PreQuest_HORDE = Inst55Quest2PreQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst55Quest3_HORDE = Inst55Quest3
Inst55Quest3_HORDE_Level = Inst55Quest3_Level
Inst55Quest3_HORDE_Attain = Inst55Quest3_Attain
Inst55Quest3_HORDE_Aim = Inst55Quest3_Aim
Inst55Quest3_HORDE_Location = Inst55Quest3_Location
Inst55Quest3_HORDE_Note = Inst55Quest3_Note
Inst55Quest3_HORDE_Prequest = Inst55Quest3_Prequest
Inst55Quest3_HORDE_Folgequest = Inst55Quest3_Folgequest
Inst55Quest3PreQuest_HORDE = Inst55Quest3PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst55Quest4_HORDE = Inst55Quest4
Inst55Quest4_HORDE_Level = Inst55Quest4_Level
Inst55Quest4_HORDE_Attain = Inst55Quest4_Attain
Inst55Quest4_HORDE_Aim = Inst55Quest4_Aim
Inst55Quest4_HORDE_Location = Inst55Quest4_Location
Inst55Quest4_HORDE_Note = Inst55Quest4_Note
Inst55Quest4_HORDE_Prequest = Inst55Quest4_Prequest
Inst55Quest4_HORDE_Folgequest = Inst55Quest4_Folgequest
--
Inst55Quest4name1_HORDE = Inst55Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst55Quest5_HORDE = Inst55Quest5
Inst55Quest5_HORDE_Level = Inst55Quest5_Level
Inst55Quest5_HORDE_Attain = Inst55Quest5_Attain
Inst55Quest5_HORDE_Aim = Inst55Quest5_Aim
Inst55Quest5_HORDE_Location = Inst55Quest5_Location
Inst55Quest5_HORDE_Note = Inst55Quest5_Note
Inst55Quest5_HORDE_Prequest = Inst55Quest5_Prequest
Inst55Quest5_HORDE_Folgequest = Inst55Quest5_Folgequest
--
Inst55Quest5name1_HORDE = Inst55Quest5name1



--------------- INST56 - TK: Mechanar (Mech) ---------------

Inst56Story = "Die Festung der Stürme ist eine ehemalige Festung der Naaru im Nethersturm in der Scherbenwelt.\n\nDiese kristallene Festung wird nun von Kael'thas Sonnenwanderer regiert, dem Herren der Blutelfen, und wird dominiert von den Kerben seiner Brüder.\n\nDie Struktur ist in drei Flügel eingeteilt - Satelliten gigantischen Ausmaßes - mit dem viertel Flügel, der Exodar, nun in the Welt von Azeroth als Hauptstadt der Draenei.\n\nDie Mechanar ist der erste Flügel der Festung der Stürme.\n\nEs ist das violette Kristallgebäude südlich des Hauptpalastes.\n\nDie empfohlene Stufe ist 70. Ein voller Durchlauf gewährt ungefähr 1500 Rufpunkte bei den Sha'tar."
Inst56Caption = "FdS: Die Mechanar"
Inst56QAA = "4 Quests"
Inst56QAH = "4 Quests"

--Quest 1 Alliance
Inst56Quest1 = "1. Wie man in Arkatraz einbricht"
Inst56Quest1_Level = "70"
Inst56Quest1_Attain = "67"
Inst56Quest1_Aim = "A'dal bittet Euch, das obere und das untere Fragment des Schlüssels zur Arkatraz zu besorgen. Bringt beide Fragmente zu ihm zurück, damit er sie für Euch zum Schlüssel zur Arkatraz zusammenfügen kann."
Inst56Quest1_Location = "A'dal (Shattrath - Terrasse des Lichts; "..YELLOW.."53,43"..WHITE..")"
Inst56Quest1_Note = "Das obere Schlüsselfragment droppt von Pathaleon dem Kalkulator bei "..YELLOW.."[5]"..WHITE..". Das untere Fragment droppt in der Botanika."
Inst56Quest1_Prequest = "Ja, Sphärenräuber Nesaad -> Sonderlieferung nach Shattrath"
Inst56Quest1_Folgequest = "Ja, Herold der Verdammnis ("..YELLOW.."FdS: Die Arkatraz"..WHITE..")"
Inst56Quest1PreQuest = "true"
--
Inst56Quest1name1 = "Anachoretenumhang der Sha'tari"
Inst56Quest1name2 = "A'dals Gabe"
Inst56Quest1name3 = "Präzisionsgürtel der Naaru"
Inst56Quest1name4 = "Championgürtel von Shattrath"
Inst56Quest1name5 = "Verteidigertaillenschutz der Sha'tari*"
Inst56Quest1name6 = "Schlüssel zur Arkatraz"

--Quest 2 Alliance
Inst56Quest2 = "2. Frisch von der Mechanar"
Inst56Quest2_Level = "69"
Inst56Quest2_Attain = "67"
Inst56Quest2_Aim = "David Wayne bei Waynes Zuflucht möchte, dass Ihr ihm eine überladene Manazelle bringt."
Inst56Quest2_Location = "David Wayne (Wälder von Terokkar - Waynes Zuflucht; "..YELLOW.."78,39"..WHITE..")."
Inst56Quest2_Note = "Die Zelle befindet sich vor Mechanolord Kapazitus bei "..YELLOW.."[3]"..WHITE.." in einer Kiste in der Nähe der Mauer.\n\nWenn man diese Quest und Encyclopaedia Daemonica ("..YELLOW.."Auch: Schattenlabyrinth"..WHITE..") abschließt, erhält man zwei neue Quests von David Wayne.\n\nDer Gegenstand wird im heroischen Modus nicht droppen."
Inst56Quest2_Prequest = "Ja, Zusätzliche Materialien"
Inst56Quest2_Folgequest = "Nein"
Inst56Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst56Quest3 = "3. Gesucht: Pathaleons Projektionsgerät (Heroisches Tagesquest)"
Inst56Quest3_Level = "70"
Inst56Quest3_Attain = "70"
Inst56Quest3_Aim = "Windhändler Zhareem hat Euch darum gebeten, ihm Pathaleons Projektionsgerät zu beschaffen. Bringt es zu ihm ins untere Viertel in Shattrath, um Eure Belohnung zu erhalten."
Inst56Quest3_Location = "Windhändler Zhareem (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst56Quest3_Note = "Diese Aufgabe muss auf dem Schwierigkeitsgrad 'Heroisch' abgeschlossen werden.\n\nPathaleon der Kalkulator befindet sich bei "..YELLOW.."[5]"..WHITE.."."
Inst56Quest3_Prequest = "Nein"
Inst56Quest3_Folgequest = "Nein"
--
Inst56Quest3name1 = "Abzeichen der Gerechtigkeit"

--Quest 4 Alliance
Inst56Quest4 = "4. Gesucht: Zerstörer der Sturmschmiede (Tagesquest)"
Inst56Quest4_Level = "70"
Inst56Quest4_Attain = "70"
Inst56Quest4_Aim = "Netherpirscher Mah'duun hat Euch damit beauftragt, 5 Zerstörer der Sturmschmiede zu töten. Kehrt erst zu ihm in das untere Viertel in Shattrath zurück, wenn sie alle vernichtet wurden."
Inst56Quest4_Location = "Netherpirscher Mah'duun (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst56Quest4_Note = "Dies ist ein Tagesquest."
Inst56Quest4_Prequest = "Nein"
Inst56Quest4_Folgequest = "Nein"
--
Inst56Quest4name1 = "Gefängnisschlüssel des Astraleums"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst56Quest1_HORDE = Inst56Quest1
Inst56Quest1_HORDE_Level = Inst56Quest1_Level
Inst56Quest1_HORDE_Attain = Inst56Quest1_Attain
Inst56Quest1_HORDE_Aim = Inst56Quest1_Aim
Inst56Quest1_HORDE_Location = Inst56Quest1_Location
Inst56Quest1_HORDE_Note = Inst56Quest1_Note
Inst56Quest1_HORDE_Prequest = Inst56Quest1_Prequest
Inst56Quest1_HORDE_Folgequest = Inst56Quest1_Folgequest
Inst56Quest1PreQuest_HORDE = Inst56Quest1PreQuest
--
Inst56Quest1name1_HORDE = Inst56Quest1name1
Inst56Quest1name2_HORDE = Inst56Quest1name2
Inst56Quest1name3_HORDE = Inst56Quest1name3
Inst56Quest1name4_HORDE = Inst56Quest1name4
Inst56Quest1name5_HORDE = Inst56Quest1name5
Inst56Quest1name6_HORDE = Inst56Quest1name6

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst56Quest2_HORDE = Inst56Quest2
Inst56Quest2_HORDE_Level = Inst56Quest2_Level
Inst56Quest2_HORDE_Attain = Inst56Quest2_Attain
Inst56Quest2_HORDE_Aim = Inst56Quest2_Aim
Inst56Quest2_HORDE_Location = Inst56Quest2_Location
Inst56Quest2_HORDE_Note = Inst56Quest2_Note
Inst56Quest2_HORDE_Prequest = Inst56Quest2_Prequest
Inst56Quest2_HORDE_Folgequest = Inst56Quest2_Folgequest
Inst56Quest2PreQuest_HORDE = Inst56Quest2PreQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst56Quest3_HORDE = Inst56Quest3
Inst56Quest3_HORDE_Level = Inst56Quest3_Level
Inst56Quest3_HORDE_Attain = Inst56Quest3_Attain
Inst56Quest3_HORDE_Aim = Inst56Quest3_Aim
Inst56Quest3_HORDE_Location = Inst56Quest3_Location
Inst56Quest3_HORDE_Note = Inst56Quest3_Note
Inst56Quest3_HORDE_Prequest = Inst56Quest3_Prequest
Inst56Quest3_HORDE_Folgequest = Inst56Quest3_Folgequest
--
Inst56Quest3name1_HORDE = Inst56Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst56Quest4_HORDE = Inst56Quest4
Inst56Quest4_HORDE_Level = Inst56Quest4_Level
Inst56Quest4_HORDE_Attain = Inst56Quest4_Attain
Inst56Quest4_HORDE_Aim = Inst56Quest4_Aim
Inst56Quest4_HORDE_Location = Inst56Quest4_Location
Inst56Quest4_HORDE_Note = Inst56Quest4_Note
Inst56Quest4_HORDE_Prequest = Inst56Quest4_Prequest
Inst56Quest4_HORDE_Folgequest = Inst56Quest4_Folgequest
--
Inst56Quest4name1_HORDE = Inst56Quest4name1



--------------- INST57 - SM: Armory (SM Arm) ---------------

Inst57Story = "Das Kloster war einst der ganze Stolz der Priesterschaft von Lordaeron, ein Ort der Studien und der Erleuchtung. Doch seit dem Auftauchen der untoten Geißel während des Dritten Krieges wurde das friedliche Kloster in eine Festung des fanatischen Scharlachroten Kreuzzuges verwandelt. Die Kreuzritter zeigen gegenüber allen nichtmenschlichen Völkern nicht den geringsten Funken von Toleranz oder Achtung, egal auf welcher Seite sie stehen mögen. Sie glauben, dass alle Außenseiter potentielle Überträger der Seuche des Untodes sind und deswegen vernichtet werden müssen. Berichten Überlebender zufolge müssen sich Eindringlinge darauf gefasst machen, dem Scharlachroten Kommandanten Mograine entgegenzutreten, der zudem über eine große Streitmacht ihm fanatisch ergebener Krieger gebietet. Der wahre Herr über das Scharlachrote Kloster ist jedoch Hochinquisitorin Weißsträhne - eine furchteinflößende Priesterin, die über die einzigartige Gabe verfügt, gefallene Kämpfer in ihrem Namen ins Kampfgeschehen zurückholen zu können."
Inst57Caption = "SK: Waffenkammer"
Inst57QAA = "1 Quest"
Inst57QAH = "2 Quests"

--Quest 1 Alliance
Inst57Quest1 = "1. Im Namen des Lichts"
Inst57Quest1_Level = "40"
Inst57Quest1_Attain = "34"
Inst57Quest1_Aim = "Tötet Hochinquisitorin Weißsträhne, den scharlachroten Kommandant Mograine, Herod, den scharlachroten Helden sowie den Hundemeister Loksey und meldet Euch dann wieder bei Raleigh dem Andächtigen in Süderstade."
Inst57Quest1_Location = "Raleigh der Andächtige (Vorgebirge des Hügellands - Süderstade; "..YELLOW.."51,58"..WHITE..")"
Inst57Quest1_Note = "Diese Questreihe beginnt bei Bruder Crowley in Sturmwind - Kathedrale des Lichts ("..YELLOW.."42,24"..WHITE..").\nHochinquisitorin Weißsträhne und Kommandant Mograine findet man bei "..YELLOW.."SK: Kathedrale [2]"..WHITE..", Herod bei "..YELLOW.."SK: Waffenkammer [1]"..WHITE.." und Hundemeister Loksey bei "..YELLOW.."SK: Bibliothek [1]"..WHITE.."."
Inst57Quest1_Prequest = "Ja, Bruder Anton -> Auf dem scharlachroten Pfad"
Inst57Quest1_Folgequest = "Nein"
Inst57Quest1PreQuest = "true"
--
Inst57Quest1name1 = "Schwert der Beschaulichkeit"
Inst57Quest1name2 = "Knochenbeißer"
Inst57Quest1name3 = "Schwarze Bedrohung"
Inst57Quest1name4 = "Kugel von Lorica"


--Quest 1 Horde
Inst57Quest1_HORDE = "1. Herzen des Eifers"
Inst57Quest1_HORDE_Level = "33"
Inst57Quest1_HORDE_Attain = "30"
Inst57Quest1_HORDE_Aim = "Apothekermeister Faranell in Unterstadt möchte 20 Herzen des Eifers."
Inst57Quest1_HORDE_Location = "Apothekermeister Faranell (Unterstadt - Das Apothekarium; "..YELLOW.."48,69"..WHITE..")"
Inst57Quest1_HORDE_Note = "Die Herzen des Eifers werden von allen Gegnern im Kloster gedroppt."
Inst57Quest1_HORDE_Prequest = "Ja, Go, Go, Guano! ("..YELLOW.."[Kral der Klingenhauer]"..WHITE..")"
Inst57Quest1_HORDE_Folgequest = "Nein"
Inst57Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst57Quest2_HORDE = "2. In das Scharlachrote Kloster"
Inst57Quest2_HORDE_Level = "42"
Inst57Quest2_HORDE_Attain = "33"
Inst57Quest2_HORDE_Aim = "Tötet Hochinquisitorin Weißsträhne, den scharlachroten Kommandant Mograine, Herod, den scharlachroten Helden sowie den Hundemeister Loksey und meldet Euch dann wieder bei Varimathras in Unterstadt."
Inst57Quest2_HORDE_Location = "Varimathras (Unterstadt - Königliches Viertel; "..YELLOW.."56,92"..WHITE..")"
Inst57Quest2_HORDE_Note = "Hochinquisitorin Weißsträhne und Kommandant Mograine findet man bei "..YELLOW.."SK: Kathedrale [2]"..WHITE..", Herod bei "..YELLOW.."SK: Waffenkammer [1]"..WHITE.." und Hundemeister Loksey bei "..YELLOW.."SK: Bibliothek [1]"..WHITE.."."
Inst57Quest2_HORDE_Prequest = "Nein"
Inst57Quest2_HORDE_Folgequest = "Nein"
--
Inst57Quest2name1_HORDE = "Schwert des Omens"
Inst57Quest2name2_HORDE = "Stock des Propheten"
Inst57Quest2name3_HORDE = "Drachenbluthalskette"



--------------- INST58 - SM: Cathedral (SM Cath) ---------------

Inst58Story = "Das Kloster war einst der ganze Stolz der Priesterschaft von Lordaeron, ein Ort der Studien und der Erleuchtung. Doch seit dem Auftauchen der untoten Geißel während des Dritten Krieges wurde das friedliche Kloster in eine Festung des fanatischen Scharlachroten Kreuzzuges verwandelt. Die Kreuzritter zeigen gegenüber allen nichtmenschlichen Völkern nicht den geringsten Funken von Toleranz oder Achtung, egal auf welcher Seite sie stehen mögen. Sie glauben, dass alle Außenseiter potentielle Überträger der Seuche des Untodes sind und deswegen vernichtet werden müssen. Berichten Überlebender zufolge müssen sich Eindringlinge darauf gefasst machen, dem Scharlachroten Kommandanten Mograine entgegenzutreten, der zudem über eine große Streitmacht ihm fanatisch ergebener Krieger gebietet. Der wahre Herr über das Scharlachrote Kloster ist jedoch Hochinquisitorin Weißsträhne - eine furchteinflößende Priesterin, die über die einzigartige Gabe verfügt, gefallene Kämpfer in ihrem Namen ins Kampfgeschehen zurückholen zu können."
Inst58Caption = "SK: Kathedrale"
Inst58QAA = "1 Quest"
Inst58QAH = "2 Quests"

--Quest 1 Alliance
Inst58Quest1 = "1. Im Namen des Lichts"
Inst58Quest1_Level = "40"
Inst58Quest1_Attain = "34"
Inst58Quest1_Aim = "Tötet Hochinquisitorin Weißsträhne, den scharlachroten Kommandant Mograine, Herod, den scharlachroten Helden sowie den Hundemeister Loksey und meldet Euch dann wieder bei Raleigh dem Andächtigen in Süderstade."
Inst58Quest1_Location = "Raleigh der Andächtige (Vorgebirge des Hügellands - Süderstade; "..YELLOW.."51,58"..WHITE..")"
Inst58Quest1_Note = "Diese Questreihe beginnt bei Bruder Crowley in Sturmwind - Kathedrale des Lichts ("..YELLOW.."42,24"..WHITE..").\nHochinquisitorin Weißsträhne und Kommandant Mograine findet man bei "..YELLOW.."SK: Kathedrale [2]"..WHITE..", Herod bei "..YELLOW.."SK: Waffenkammer [1]"..WHITE.." und Hundemeister Loksey bei "..YELLOW.."SK: Bibliothek [1]"..WHITE.."."
Inst58Quest1_Prequest = "Ja, Bruder Anton -> Auf dem scharlachroten Pfad"
Inst58Quest1_Folgequest = "Nein"
Inst58Quest1PreQuest = "true"
--
Inst58Quest1name1 = "Schwert der Beschaulichkeit"
Inst58Quest1name2 = "Knochenbeißer"
Inst58Quest1name3 = "Schwarze Bedrohung"
Inst58Quest1name4 = "Kugel von Lorica"


--Quest 1 Horde
Inst58Quest1_HORDE = "1. Herzen des Eifers"
Inst58Quest1_HORDE_Level = "33"
Inst58Quest1_HORDE_Attain = "30"
Inst58Quest1_HORDE_Aim = "Apothekermeister Faranell in Unterstadt möchte 20 Herzen des Eifers."
Inst58Quest1_HORDE_Location = "Apothekermeister Faranell (Unterstadt - Das Apothekarium; "..YELLOW.."48,69"..WHITE..")"
Inst58Quest1_HORDE_Note = "Die Herzen des Eifers werden von allen Gegnern im Kloster gedroppt."
Inst58Quest1_HORDE_Prequest = "Ja, Go, Go, Guano! ("..YELLOW.."[Kral der Klingenhauer]"..WHITE..")"
Inst58Quest1_HORDE_Folgequest = "Nein"
Inst58Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst58Quest2_HORDE = "2. In das Scharlachrote Kloster"
Inst58Quest2_HORDE_Level = "42"
Inst58Quest2_HORDE_Attain = "33"
Inst58Quest2_HORDE_Aim = "Tötet Hochinquisitorin Weißsträhne, den scharlachroten Kommandant Mograine, Herod, den scharlachroten Helden sowie den Hundemeister Loksey und meldet Euch dann wieder bei Varimathras in Unterstadt."
Inst58Quest2_HORDE_Location = "Varimathras (Unterstadt - Königliches Viertel; "..YELLOW.."56,92"..WHITE..")"
Inst58Quest2_HORDE_Note = "Hochinquisitorin Weißsträhne und Kommandant Mograine findet man bei "..YELLOW.."SK: Kathedrale [2]"..WHITE..", Herod bei "..YELLOW.."SK: Waffenkammer [1]"..WHITE.." und Hundemeister Loksey bei "..YELLOW.."SK: Bibliothek [1]"..WHITE.."."
Inst58Quest2_HORDE_Prequest = "Nein"
Inst58Quest2_HORDE_Folgequest = "Nein"
--
Inst58Quest2name1_HORDE = "Schwert des Omens"
Inst58Quest2name2_HORDE = "Stock des Propheten"
Inst58Quest2name3_HORDE = "Drachenbluthalskette"



--------------- INST59 - SM: Graveyard (SM GY) ---------------

Inst59Story = "Das Kloster war einst der ganze Stolz der Priesterschaft von Lordaeron, ein Ort der Studien und der Erleuchtung. Doch seit dem Auftauchen der untoten Geißel während des Dritten Krieges wurde das friedliche Kloster in eine Festung des fanatischen Scharlachroten Kreuzzuges verwandelt. Die Kreuzritter zeigen gegenüber allen nichtmenschlichen Völkern nicht den geringsten Funken von Toleranz oder Achtung, egal auf welcher Seite sie stehen mögen. Sie glauben, dass alle Außenseiter potentielle Überträger der Seuche des Untodes sind und deswegen vernichtet werden müssen. Berichten Überlebender zufolge müssen sich Eindringlinge darauf gefasst machen, dem Scharlachroten Kommandanten Mograine entgegenzutreten, der zudem über eine große Streitmacht ihm fanatisch ergebener Krieger gebietet. Der wahre Herr über das Scharlachrote Kloster ist jedoch Hochinquisitorin Weißsträhne - eine furchteinflößende Priesterin, die über die einzigartige Gabe verfügt, gefallene Kämpfer in ihrem Namen ins Kampfgeschehen zurückholen zu können."
Inst59Caption = "SK: Friedhof"
Inst59QAA = "1 Quest"
Inst59QAH = "3 Quests"

--Quest 1 Alliance
Inst59Quest1 = "1. Ruft den kopflosen Reiter (Tagesquest - Saisonbedingt)"
Inst59Quest1_Level = "70"
Inst59Quest1_Attain = "70"
Inst59Quest1_Aim = "Bringt eine düstere Kerze zur leicht aufgewühlten Erde."
Inst59Quest1_Location = "Kürbisschrein (Scharlachrotes Kloster - Friedhof; "..YELLOW.."[2]"..WHITE..")"
Inst59Quest1_Note = "Die Erde befindet sich nur ein paar Schritte vom Kürbisschrein entfernt. Dieses Quest ist nur während der Schlotternächte erhältlich und kann nur einmal täglich pro Spieler angenommen werden.\n\nWenn man das Quest abschließt, erscheint der kopflose Reiter, ein Stufe 70 Boss."
Inst59Quest1_Prequest = "Nein"
Inst59Quest1_Folgequest = "Nein"
-- No Rewards for this quest


--Quest 1 Horde
Inst59Quest1_HORDE = "1. Vorrels Rache"
Inst59Quest1_HORDE_Level = "33"
Inst59Quest1_HORDE_Attain = "25"
Inst59Quest1_HORDE_Aim = "Bringt Monika Sengutz in Tarrens Mühle den Ehering von Vorrel Sengutz."
Inst59Quest1_HORDE_Location = "Vorrel Sengutz (Das Scharlachrote Kloster - Friedhof; "..YELLOW.."[1]"..WHITE..")"
Inst59Quest1_HORDE_Note = "Vorrel Sengutz befindet sich am Anfang des Friedhofs vom Scharlachroten Kloster. Nancy Vishas, die den Ring droppt, der für dieses Quest benötigt wird, befindet sich in einem Haus im Alteracgebirge ("..YELLOW.."31,32"..WHITE..")."
Inst59Quest1_HORDE_Prequest = "Nein"
Inst59Quest1_HORDE_Folgequest = "Nein"
--
Inst59Quest1name1_HORDE = "Vorrels Stiefel"
Inst59Quest1name2_HORDE = "Mantel des Jammers"
Inst59Quest1name3_HORDE = "Grimmstahlcape"

--Quest 2 Horde
Inst59Quest2_HORDE = "2. Herzen des Eifers"
Inst59Quest2_HORDE_Level = "33"
Inst59Quest2_HORDE_Attain = "30"
Inst59Quest2_HORDE_Aim = "Apothekermeister Faranell in Unterstadt möchte 20 Herzen des Eifers."
Inst59Quest2_HORDE_Location = "Apothekermeister Faranell (Unterstadt - Das Apothekarium; "..YELLOW.."48,69"..WHITE..")"
Inst59Quest2_HORDE_Note = "Die Herzen des Eifers werden von allen Gegnern im Kloster gedroppt."
Inst59Quest2_HORDE_Prequest = "Ja, Go, Go, Guano! ("..YELLOW.."[Kral der Klingenhauer]"..WHITE..")"
Inst59Quest2_HORDE_Folgequest = "Nein"
Inst59Quest2PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 1 Alliance)
Inst59Quest3_HORDE = "3. Ruft den kopflosen Reiter (Tagesquest - Saisonbedingt)"
Inst59Quest3_HORDE_Level = Inst59Quest1_Level
Inst59Quest3_HORDE_Attain = Inst59Quest1_Attain
Inst59Quest3_HORDE_Aim = Inst59Quest1_Aim
Inst59Quest3_HORDE_Location = Inst59Quest1_Location
Inst59Quest3_HORDE_Note = Inst59Quest1_Note
Inst59Quest3_HORDE_Prequest = Inst59Quest1_Prequest
Inst59Quest3_HORDE_Folgequest = Inst59Quest1_Folgequest
-- No Rewards for this quest



--------------- INST61 - TK: The Eye ---------------

Inst61Story = "Die Festung der Stürme ist eine ehemalige Festung der Naaru im Nethersturm in der Scherbenwelt.\n\nDiese kristallene Festung wird nun von Kael'thas Sonnenwanderer regiert, dem Herren der Blutelfen, und wird dominiert von Horden seiner Brüder.\n\nDie Struktur ist in drei Flügel eingeteilt - Satelliten gigantischen Ausmaßes - mit dem viertel Flügel, der Exodar, nun in the Welt von Azeroth als Hauptstadt der Draenei."
Inst61Caption = "FdS: Festung der Stürme"
Inst61QAA = "3 Quests"
Inst61QAH = "3 Quests"

--Quest 1 Alliance
Inst61Quest1 = "1. Die List der Aschenzungen"
Inst61Quest1_Level = "70"
Inst61Quest1_Attain = "70"
Inst61Quest1_Aim = "Reist in die Festung der Stürme und tötet Al'ar, während Ihr die Gugel der Aschenzungen tragt. Kehrt nach Abschluß der Aufgabe zu Akama ins Schattenmondtal zurück."
Inst61Quest1_Location = "Akama (Schattenmondtal - Kammer des Wächters; "..YELLOW.."58,48"..WHITE..")"
Inst61Quest1_Note = "Teil der Vorquestreihe zum Schwarzen Tempel."
Inst61Quest1_Prequest = "Ja, Das gefährdete Geheimnis ("..YELLOW.."Höhle des Schlangenschreins"..WHITE..")"
Inst61Quest1_Folgequest = "Ja, Ein Artefakt aus der Vergangenheit ("..YELLOW.."Hyjalgipfel"..WHITE..")"
Inst61Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst61Quest2 = "2. Kael'thas und die tiefgrüne Sphäre"
Inst61Quest2_Level = "70"
Inst61Quest2_Attain = "70"
Inst61Quest2_Aim = "Bringt die tiefgrüne Sphäre zu A'dal in Shattrath."
Inst61Quest2_Location = "Tiefgrüne Sphäre (droppt von Kael'thas Sonnenwanderer bei "..YELLOW.."[4]"..WHITE..")"
Inst61Quest2_Note = "A'dal befindet sich in (Shattrath - Terrasse des Lichts; "..YELLOW.."53,43"..WHITE..")."
Inst61Quest2_Prequest = "Nein"
Inst61Quest2_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 3 Alliance
Inst61Quest3 = "3. Die Phiolen der Ewigkeit"
Inst61Quest3_Level = "70"
Inst61Quest3_Attain = "70"
Inst61Quest3_Aim = "Soridormi in den Höhlen der Zeit möchte, dass Ihr die Überreste von Vashjs Phiole im Echsenkessel und die Überreste von Kaels Phiole von Kael'thas Sonnenwanderer in der Festung der Stürme besorgt."
Inst61Quest3_Location = "Soridormi (Tanaris - Höhlen der Zeit; "..YELLOW.."58,57"..WHITE.."). Der NPC läuft in dem Bereich umher."
Inst61Quest3_Note = "Dies ist die Vorquest für die Schlacht um den Berg Hyjal. Kael'thas Sunstrider befindet sich bei "..YELLOW.."[4]"..WHITE.."."
Inst61Quest3_Prequest = "Nein"
Inst61Quest3_Folgequest = "Nein"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst61Quest1_HORDE = Inst61Quest1
Inst61Quest1_HORDE_Level = Inst61Quest1_Level
Inst61Quest1_HORDE_Attain = Inst61Quest1_Attain
Inst61Quest1_HORDE_Aim = Inst61Quest1_Aim
Inst61Quest1_HORDE_Location = Inst61Quest1_Location
Inst61Quest1_HORDE_Note = Inst61Quest1_Note
Inst61Quest1_HORDE_Prequest = Inst61Quest1_Prequest
Inst61Quest1_HORDE_Folgequest = Inst61Quest1_Folgequest
Inst61Quest1PreQuest_HORDE = Inst61Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst61Quest2_HORDE = Inst61Quest2
Inst61Quest2_HORDE_Level = Inst61Quest2_Level
Inst61Quest2_HORDE_Attain = Inst61Quest2_Attain
Inst61Quest2_HORDE_Aim = Inst61Quest2_Aim
Inst61Quest2_HORDE_Location = Inst61Quest2_Location
Inst61Quest2_HORDE_Note = Inst61Quest2_Note
Inst61Quest2_HORDE_Prequest = Inst61Quest2_Prequest
Inst61Quest2_HORDE_Folgequest = Inst61Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst61Quest3_HORDE = Inst61Quest3
Inst61Quest3_HORDE_Level = Inst61Quest3_Level
Inst61Quest3_HORDE_Attain = Inst61Quest3_Attain
Inst61Quest3_HORDE_Aim = Inst61Quest3_Aim
Inst61Quest3_HORDE_Location = Inst61Quest3_Location
Inst61Quest3_HORDE_Note = Inst61Quest3_Note
Inst61Quest3_HORDE_Prequest = Inst61Quest3_Prequest
Inst61Quest3_HORDE_Folgequest = Inst61Quest3_Folgequest
-- No Rewards for this quest



--------------- INST62 - Black Temple (BT) ---------------

Inst62Story = {
  ["Page1"] = "Vor langer Zeit, als die Scherbenwelt noch als Draenor bekannt war, diente der Tempel von Karabor als Zentrum der religiösen Praktiken der Draenei. Die hingebungsvollen Priester aber, die einst in seinen Hallen beteten, sind schon lange tot, hingemetzelt von umherziehenden, dämonischen Orcs. Als das Schlachten geendet hatte, besetzten die Hexenmeister des Schattenrates das Gebäude und belegten es mit seinem neuen, unheilverkündenden Namen: der Schwarze Tempel.\n\nViele Jahre lang verdarb der Schattenrat den Tempel mit seinen grausamen und dämonischen Ritualen, nach dem Zweiten Krieg jedoch fielen die dunklen Zauberer unter der unaufhaltsamen Invasion der Allianz in Draenor. Als der Schamane Ner’zhul in der verzweifelten Hoffnung auf ein Entkommen hastig mehrere Dimensionsportale öffnete, zerrissen die freigesetzten magischen Kräfte die Welt. Nachdem Draenor so zu einer wortwörtlichen Scherbenwelt geworden war, stellten Ner’zhuls Portale einen strategischen Gewinn dar, den sich der Dämonengeneral Magtheridon sofort sicherte, indem er den Schwarzen Tempel besetzte und zu seinem Sitz als Herrscher über diese Welt machte.",
  ["Page2"] = "Magtheridon konnte über viele der auf der Scherbenwelt verbliebenen Orcs befehlen und durch die Portale strömten unablässig weitere Dämonenkrieger zu seiner Unterstützung. So blieb die Macht des Grubenlords unbestritten, bis Illidan der Verräter beschloss, den Schwarzen Tempel für sich selbst in Beschlag zu nehmen. Illidan und Magtheridon fochten einen gnadenlosen Kampf in den Mauern des Tempels, doch am Ende musste sich der Grubenlord dem Träger der Zwillingsklingen von Azzinoth geschlagen geben. Illidan zerschmetterte ihn, doch der Triumph des Sieges währte nur kurz...",
  ["MaxPages"] = "2",
};
Inst62Caption = "Der Schwarze Tempel"
Inst62QAA = "3 Quests"
Inst62QAH = "3 Quests"

--Quest 1 Alliance
Inst62Quest1 = "1. Sucht die Aschenzungen auf"
Inst62Quest1_Level = "70"
Inst62Quest1_Attain = "70"
Inst62Quest1_Aim = "Sucht Akamas Todeshörige im Schwarzen Tempel."
Inst62Quest1_Location = "Xi'ri (Schattenmondtal; "..YELLOW.."65,44"..WHITE..")."
Inst62Quest1_Note = "Der Geist von Olum befindet sich hinter dem Eingang des Schwarzen Tempels rauf und dann links bei "..YELLOW.."[1]"..WHITE..". Er teleportiert dich zu Seher Kanai, sobald du den Obersten Kriegsfürst Naj'entus bei "..YELLOW.."[2]"..WHITE.." und Supremus bei "..YELLOW.."[3]"..WHITE.." getötet hast."
Inst62Quest1_Prequest = "Ja, Das gefährdete Geheimnis -> Ein Ablenkungsmanöver für Akama"
Inst62Quest1_Folgequest = "Ja, Die Erlösung der Aschenzungen"
Inst62Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst62Quest2 = "2. Die Erlösung der Aschenzungen"
Inst62Quest2_Level = "70"
Inst62Quest2_Attain = "70"
Inst62Quest2_Aim = "Helft Akama die Kontrolle über seine Seele wieder zu erlangen, indem Ihr Akamas Schemen im Schwarzen Tempel besiegt. Kehrt anschließend zu Seher Kanai zurück."
Inst62Quest2_Location = "Seher Kanai (Der Schwarze Tempel; "..YELLOW.."[5]"..WHITE..")."
Inst62Quest2_Note = "Akamas Schemen befindet sich bei "..YELLOW.."[4]"..WHITE.."."
Inst62Quest2_Prequest = "Ja, Sucht die Aschenzungen auf"
Inst62Quest2_Folgequest = "Ja, Der Sturz des Verräters"
Inst62Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst62Quest3 = "3. Der Sturz des Verräters"
Inst62Quest3_Level = "70"
Inst62Quest3_Attain = "70"
Inst62Quest3_Aim = "Seher Kanai möchte, dass Ihr Illidan im Schwarzen Tempel besiegt."
Inst62Quest3_Location = "Seher Kanai (Der Schwarze Tempel; "..YELLOW.."[5]"..WHITE..")."
Inst62Quest3_Note = "Illidan Sturmgrimm befindet sich bei "..YELLOW.."[11]"..WHITE.."."
Inst62Quest3_Prequest = "Ja, Die Erlösung der Aschenzungen"
Inst62Quest3_Folgequest = "Nein"
Inst62Quest3FQuest = "true"
--
Inst62Quest3name1 = "Gesegnetes Medaillon von Karabor"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst62Quest1_HORDE = Inst62Quest1
Inst62Quest1_HORDE_Level = Inst62Quest1_Level
Inst62Quest1_HORDE_Attain = Inst62Quest1_Attain
Inst62Quest1_HORDE_Aim = Inst62Quest1_Aim
Inst62Quest1_HORDE_Location = Inst62Quest1_Location
Inst62Quest1_HORDE_Note = Inst62Quest1_Note
Inst62Quest1_HORDE_Prequest = Inst62Quest1_Prequest
Inst62Quest1_HORDE_Folgequest = Inst62Quest1_Folgequest
Inst62Quest1PreQuest_HORDE = Inst62Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst62Quest2_HORDE = Inst62Quest2
Inst62Quest2_HORDE_Level = Inst62Quest2_Level
Inst62Quest2_HORDE_Attain = Inst62Quest2_Attain
Inst62Quest2_HORDE_Aim = Inst62Quest2_Aim
Inst62Quest2_HORDE_Location = Inst62Quest2_Location
Inst62Quest2_HORDE_Note = Inst62Quest2_Note
Inst62Quest2_HORDE_Prequest = Inst62Quest2_Prequest
Inst62Quest2_HORDE_Folgequest = Inst62Quest2_Folgequest
Inst62Quest2FQuest_HORDE = Inst62Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst62Quest3_HORDE = Inst62Quest3
Inst62Quest3_HORDE_Level = Inst62Quest3_Level
Inst62Quest3_HORDE_Attain = Inst62Quest3_Attain
Inst62Quest3_HORDE_Aim = Inst62Quest3_Aim
Inst62Quest3_HORDE_Location = Inst62Quest3_Location
Inst62Quest3_HORDE_Note = Inst62Quest3_Note
Inst62Quest3_HORDE_Prequest = Inst62Quest3_Prequest
Inst62Quest3_HORDE_Folgequest = Inst62Quest3_Folgequest
Inst62Quest3FQuest_HORDE = Inst62Quest3FQuest
--
Inst62Quest3name1_HORDE = Inst62Quest3name1



--------------- INST63 - Zul'Aman (ZA) ---------------

Inst63Story = "Die Festung von Zul'Aman hat Jahrtausende als der Sitz der Macht der Amani-Trolle und der Bastion des furchtlosen, listigen Kriegsherren Zul'jin bestanden.\n\nZul'jin hat einige Jahre damit verbracht, hinter den Mauern von Zul'Aman zu planen. Erbost über die Horde, dass sie ihren verhassten Feinden, den Blutelfen, erlaubt haben, sich ihnen anzuschließen, begrüßte er eifrig einen Entwurf, den Hexendoktor Malacrass neulich vorgeschlagen hat: die Macht der Tiergötter in den Körpern der stärksten Krieger der Amani zu besiegeln.\n\nDie Armee von Zul'Aman wird nun von Tag zu Tag stärker, sie ist hungrig auf scharfe Rache im Namen ihres furchtlosen Anführers, Zul'jin."
Inst63Caption = "Zul'Aman"
Inst63QAA = "8 Quests"
Inst63QAH = "8 Quests"

--Quest 1 Alliance
Inst63Quest1 = "1. Versprechen, Versprechen..."
Inst63Quest1_Level = "70"
Inst63Quest1_Attain = "70"
Inst63Quest1_Aim = "Budd Winterhäldler in den Axthügeln möchte, dass Ihr bei Hohepriester Nalorakks Terrasse in Zul'Aman nach seiner Karte sucht."
Inst63Quest1_Location = "Budd Winterhäldler (Geisterlande - Axthügel; "..YELLOW.."70,67"..WHITE..")"
Inst63Quest1_Note = "Die Karte liegt auf der rechten Rampe neben Hohepriester Nalorakk bei "..YELLOW.."[1]"..WHITE..". Die Vorquest ist optional und startet bei Gaunah in (Shattrath - Unteres Viertel; "..YELLOW.."65,69"..WHITE..")."
Inst63Quest1_Prequest = "Ja, Oh, es glitzert!"
Inst63Quest1_Folgequest = "Ja, Das X markiert Euren Untergang!"
Inst63Quest1PreQuest = "true"
--
Inst63Quest1name1 = "Zerlumpter Beutel aus Hexerstoff"

--Quest 2 Alliance
Inst63Quest2 = "2. Das X markiert Euren Untergang!"
Inst63Quest2_Level = "70"
Inst63Quest2_Attain = "70"
Inst63Quest2_Aim = "Betretet Zul'Aman und erkundet Halazzis Kammer, Jan'alais Plateau und Akil'zons Plateau. Berichtet Budd bei seinem Lager in den Geisterlanden von den Details dieser Bereiche."
Inst63Quest2_Location = "Budd Winterhäldler (Geisterlande - Axthügel; "..YELLOW.."70,67"..WHITE..")"
Inst63Quest2_Note = "Halazzis Kammer ist bei "..YELLOW.."[4]"..WHITE..", Jan'alais Plattform bei "..YELLOW.."[3]"..WHITE..", und Akil'zons Plattform ist bei "..YELLOW.."[2]"..WHITE..".\n\nDie Bosse müssen nicht bekämpft werden, um die Quest abzuschließen. Einfach in die Nähe gehen, ohne Aggro zu ziehen."
Inst63Quest2_Prequest = "Ja, Versprechen, Versprechen..."
Inst63Quest2_Folgequest = "Ja, Hexlord? Pah!"
Inst63Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst63Quest3 = "3. Hexlord? Pah!"
Inst63Quest3_Level = "70"
Inst63Quest3_Attain = "70"
Inst63Quest3_Aim = "Budd Winterhäldler in den Axthügeln möchte, dass Ihr Hexlord Malacrass in Zul'Aman tötet."
Inst63Quest3_Location = "Budd Winterhäldler (Geisterlande - Axthügel; "..YELLOW.."70,67"..WHITE..")"
Inst63Quest3_Note = "Hexlord Malacrass befindet sich bei "..YELLOW.."[6]"..WHITE.."."
Inst63Quest3_Prequest = "Ja, Das X markiert Euren Untergang!"
Inst63Quest3_Folgequest = "Nein"
Inst63Quest3FQuest = "true"
--
Inst63Quest3name1 = "Abzeichen der Gerechtigkeit"

--Quest 4 Alliance
Inst63Quest4 = "4. Jäger der verlorenen Hauer"
Inst63Quest4_Level = "70"
Inst63Quest4_Attain = "70"
Inst63Quest4_Aim = "Prigmon möchte, dass Ihr 10 Hauer eines Waldtrolls von Trollen in Zul'Aman einsammelt. Bringt sie zu ihm bei Budds Lager in den Geisterlanden."
Inst63Quest4_Location = "Prigmon (Geisterlande - Axthügel; "..YELLOW.."71,68"..WHITE..")"
Inst63Quest4_Note = "Der Waldtrollhauer droppen von den Gegnern der Amani in Zul'Aman."
Inst63Quest4_Prequest = "Nein"
Inst63Quest4_Folgequest = "Ja, Ein Troll unter Trollen"
-- No Rewards for this quest

--Quest 5 Alliance
Inst63Quest5 = "5. Ein Troll unter Trollen"
Inst63Quest5_Level = "70"
Inst63Quest5_Attain = "70"
Inst63Quest5_Aim = "Prigmon möchte, dass Ihr seinen Vetter Zungam in Zul'Aman ausfindig macht und ihm zur Seite steht."
Inst63Quest5_Location = "Prigmon (Geisterlande - Axthügel; "..YELLOW.."71,68"..WHITE..")"
Inst63Quest5_Note = "Zungam befindet sich in einer Hütte bei "..YELLOW.."[5]"..WHITE.." befindet. Nachdem du ihn befreit hast, gibt er dir die Folgequest."
Inst63Quest5_Prequest = "Ja, Jäger der verlorenen Hauer"
Inst63Quest5_Folgequest = "Ja, Das Spiel mit der Puppe"
Inst63Quest5FQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst63Quest6 = "6. Das Spiel mit der Puppe"
Inst63Quest6_Level = "70"
Inst63Quest6_Attain = "70"
Inst63Quest6_Aim = "Bringt die zerlumpte Voodoopuppe zu Gaunah in Shattrath."
Inst63Quest6_Location = "Zungam (Zul'Aman; "..YELLOW.."[5]"..WHITE..")"
Inst63Quest6_Note = "Gaunah befindet sich in (Shattrath - Unteres Viertel; "..YELLOW.."65,69"..WHITE..")."
Inst63Quest6_Prequest = "Ja, Ein Troll unter Trollen"
Inst63Quest6_Folgequest = "Nein"
Inst63Quest6FQuest = "true"
--
Inst63Quest6name1 = "Bezaubertes Juwel der Amani"

--Quest 7 Alliance
Inst63Quest7 = "7. Blut des Kriegsherren"
Inst63Quest7_Level = "70"
Inst63Quest7_Attain = "70"
Inst63Quest7_Aim = "Bringt Zul'jins Blut zu Budd bei seinem Lager in den Geisterlanden, direkt außerhalb von Zul'Aman."
Inst63Quest7_Location = "Zul'jins Blut (droppt von Zul'jin; "..YELLOW.."[7]"..WHITE..")"
Inst63Quest7_Note = "Nur eine Person im Schlachtzug kann das Blut erhalten, um die Quest zu starten, und die Quest kann nur einmal ausgeführt werden."
Inst63Quest7_Prequest = "Nein"
Inst63Quest7_Folgequest = "Ja, Agentin mit Herz"
-- No Rewards for this quest

--Quest 8 Alliance
Inst63Quest8 = "8. Agentin mit Herz"
Inst63Quest8_Level = "70"
Inst63Quest8_Attain = "70"
Inst63Quest8_Aim = "Meldet Euch bei Donna Brascoe, um eine Belohnung für Euer Heldentum in Zul'Aman zu erhalten. Donna hält sich momentan in den Geisterlanden, direkt außerhalb von Zul'Aman auf."
Inst63Quest8_Location = "Donna Brascoe (Geisterlande - Axthügel; "..YELLOW.."70,68"..WHITE..")"
Inst63Quest8_Note = ""
Inst63Quest8_Prequest = "Ja, Blut des Kriegsherren"
Inst63Quest8_Folgequest = "Nein"
Inst63Quest8FQuest = "true"
--
Inst63Quest8name1 = "Abzeichen der Gerechtigkeit"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst63Quest1_HORDE = Inst63Quest1
Inst63Quest1_HORDE_Level = Inst63Quest1_Level
Inst63Quest1_HORDE_Attain = Inst63Quest1_Attain
Inst63Quest1_HORDE_Aim = Inst63Quest1_Aim
Inst63Quest1_HORDE_Location = Inst63Quest1_Location
Inst63Quest1_HORDE_Note = Inst63Quest1_Note
Inst63Quest1_HORDE_Prequest = Inst63Quest1_Prequest
Inst63Quest1_HORDE_Folgequest = Inst63Quest1_Folgequest
Inst63Quest1PreQuest_HORDE = Inst63Quest1PreQuest
--
Inst63Quest1name1_HORDE = Inst63Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst63Quest2_HORDE = Inst63Quest2
Inst63Quest2_HORDE_Level = Inst63Quest2_Level
Inst63Quest2_HORDE_Attain = Inst63Quest2_Attain
Inst63Quest2_HORDE_Aim = Inst63Quest2_Aim
Inst63Quest2_HORDE_Location = Inst63Quest2_Location
Inst63Quest2_HORDE_Note = Inst63Quest2_Note
Inst63Quest2_HORDE_Prequest = Inst63Quest2_Prequest
Inst63Quest2_HORDE_Folgequest = Inst63Quest2_Folgequest
Inst63Quest2FQuest_HORDE = Inst63Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst63Quest3_HORDE = Inst63Quest3
Inst63Quest3_HORDE_Level = Inst63Quest3_Level
Inst63Quest3_HORDE_Attain = Inst63Quest3_Attain
Inst63Quest3_HORDE_Aim = Inst63Quest3_Aim
Inst63Quest3_HORDE_Location = Inst63Quest3_Location
Inst63Quest3_HORDE_Note = Inst63Quest3_Note
Inst63Quest3_HORDE_Prequest = Inst63Quest3_Prequest
Inst63Quest3_HORDE_Folgequest = Inst63Quest3_Folgequest
Inst63Quest3FQuest_HORDE = Inst63Quest3FQuest
--
Inst63Quest3name1_HORDE = Inst63Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst63Quest4_HORDE = Inst63Quest4
Inst63Quest4_HORDE_Level = Inst63Quest4_Level
Inst63Quest4_HORDE_Attain = Inst63Quest4_Attain
Inst63Quest4_HORDE_Aim = Inst63Quest4_Aim
Inst63Quest4_HORDE_Location = Inst63Quest4_Location
Inst63Quest4_HORDE_Note = Inst63Quest4_Note
Inst63Quest4_HORDE_Prequest = Inst63Quest4_Prequest
Inst63Quest4_HORDE_Folgequest = Inst63Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst63Quest5_HORDE = Inst63Quest5
Inst63Quest5_HORDE_Level = Inst63Quest5_Level
Inst63Quest5_HORDE_Attain = Inst63Quest5_Attain
Inst63Quest5_HORDE_Aim = Inst63Quest5_Aim
Inst63Quest5_HORDE_Location = Inst63Quest5_Location
Inst63Quest5_HORDE_Note = Inst63Quest5_Note
Inst63Quest5_HORDE_Prequest = Inst63Quest5_Prequest
Inst63Quest5_HORDE_Folgequest = Inst63Quest5_Folgequest
Inst63Quest5FQuest_HORDE = Inst63Quest5FQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst63Quest6_HORDE = Inst63Quest6
Inst63Quest6_HORDE_Level = Inst63Quest6_Level
Inst63Quest6_HORDE_Attain = Inst63Quest6_Attain
Inst63Quest6_HORDE_Aim = Inst63Quest6_Aim
Inst63Quest6_HORDE_Location = Inst63Quest6_Location
Inst63Quest6_HORDE_Note = Inst63Quest6_Note
Inst63Quest6_HORDE_Prequest = Inst63Quest6_Prequest
Inst63Quest6_HORDE_Folgequest = Inst63Quest6_Folgequest
Inst63Quest6FQuest_HORDE = Inst63Quest6FQuest
--
Inst63Quest6name1_HORDE = Inst63Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst63Quest7_HORDE = Inst63Quest7
Inst63Quest7_HORDE_Level = Inst63Quest7_Level
Inst63Quest7_HORDE_Attain = Inst63Quest7_Attain
Inst63Quest7_HORDE_Aim = Inst63Quest7_Aim
Inst63Quest7_HORDE_Location = Inst63Quest7_Location
Inst63Quest7_HORDE_Note = Inst63Quest7_Note
Inst63Quest7_HORDE_Prequest = Inst63Quest7_Prequest
Inst63Quest7_HORDE_Folgequest = Inst63Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst63Quest8_HORDE = Inst63Quest8
Inst63Quest8_HORDE_Level = Inst63Quest8_Level
Inst63Quest8_HORDE_Attain = Inst63Quest8_Attain
Inst63Quest8_HORDE_Aim = Inst63Quest8_Aim
Inst63Quest8_HORDE_Location = Inst63Quest8_Location
Inst63Quest8_HORDE_Note = Inst63Quest8_Note
Inst63Quest8_HORDE_Prequest = Inst63Quest8_Prequest
Inst63Quest8_HORDE_Folgequest = Inst63Quest8_Folgequest
Inst63Quest8FQuest_HORDE = Inst63Quest8FQuest
--
Inst63Quest8name1_HORDE = Inst63Quest8name1



--------------- INST67 - Magisters' Terrace ---------------

Inst67Story = "Die Terrasse der Magister ist eine 5-Mann Instanz, die sich in der nord-östlichen Ecke der Insel von Quel'Danas befindet, die mit Patch 2.4.0 veröffentlicht wird. Die Instanz beinhalted hauptsächlich Außenareale, ist in der selben Architektur wie Silbermond gehalten und hat ein Observatorium, mit dem Spieler Sterne und den Sonnenbrunnen betrachten können, um zu überprüfen, ob alles nach Plan gelaufen ist.\n\nDer Endgegner ist niemand Geringerer als Kael'thas Sonnenwanderer,  der seine Prüfung in der Festung der Stürme überlebt hat. Auch wenn manche glauben er wäre wirklich gestorben, aber von einer größeren Macht wieder zum Leben erweckt worden, was auch den grünen Kristall in seiner Brust erklären würde.\n\nBei der Hälfte der Instanz erhält der Spieler die Möglichkeit mit der Seherkugel einen Blick in das Sonnenbrunnenplateau zu werfen. Danach trift der Spieler auf Kalec, den halb-elfischen Avatar des blauen Drachen Kalecgos."
Inst67Caption = "Terrasse der Magister"
Inst67QAA = "5 Quests"
Inst67QAH = "5 Quests"

--Quest 1 Alliance
Inst67Quest1 = "1. Gesucht: Schwestern der Qual (Tagesquest)"
Inst67Quest1_Level = "70"
Inst67Quest1_Attain = "70"
Inst67Quest1_Aim = "Netherpirscher Mah'duun möchte, dass Ihr 4 Schwestern der Qual erschlagt. Kehrt zu ihm in das untere Viertel in Shattrath zurück, sobald Ihr sie getötet habt, um das Kopfgeld einzufordern."
Inst67Quest1_Location = "Netherpirscher Mah'duun (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst67Quest1_Note = "Es handelt sich um ein Tagesquest."
Inst67Quest1_Prequest = "Nein"
Inst67Quest1_Folgequest = "Nein"
--
Inst67Quest1name1 = "Gefängnisschlüssel des Astraleums"

--Quest 2 Alliance
Inst67Quest2 = "2. Gesucht: Der Siegelring von Prinz Kael'thas (Heroisches Tagesquest)"
Inst67Quest2_Level = "70"
Inst67Quest2_Attain = "70"
Inst67Quest2_Aim = "Windhändler Zhareem hat Euch darum gebeten, ihm den Siegelring von Prinz Kael'thas zu beschaffen. Bringt diesen zu ihm ins untere Viertel in Shattrath, um Eure Belohnung zu erhalten."
Inst67Quest2_Location = "Windhändler Zhareem (Shattrath - Unteres Viertel; "..YELLOW.."74,35"..WHITE..")"
Inst67Quest2_Note = "Dieses Tagesquest kann nur im heroischen Modus abgeschlossen werden.\n\nPrinz Kael'thas Sonnenwanderer befindet sich bei "..YELLOW.."[6]"..WHITE.."."
Inst67Quest2_Prequest = "Nein"
Inst67Quest2_Folgequest = "Nein"
--
Inst67Quest2name1 = "Abzeichen der Gerechtigkeit"

--Quest 3 Alliance
Inst67Quest3 = "3. Terrasse der Magister"
Inst67Quest3_Level = "70"
Inst67Quest3_Attain = "70"
Inst67Quest3_Aim = "Exarch Larethor beim Sammelpunkt der Zerschmetterten Sonne möchte, dass Ihr die Terrasse der Magister absucht und einen Blutelfenspion namens Tyrith findet."
Inst67Quest3_Location = "Exarch Larethor (Insel von Quel'Danas - Sammelpunkt der Zerschmetterten Sonne; "..YELLOW.."47,31"..WHITE..")"
Inst67Quest3_Note = "Tyrith befindet sich innerhalb der Instanz bei "..YELLOW.."[2]"..WHITE..". Diese Questreihe schaltet den Heroischen Modus frei.\n\nDas Vorquest gibt es entweder von Adyen dem Lichtwächter (Shattrath - Aldorhöhe; "..YELLOW.."35,36"..WHITE..") oder Dathris Sonnensturm (Shattrath - Sehertreppe; "..YELLOW.."55,80"..WHITE..")."
Inst67Quest3_Prequest = "Ja, Krise am Sonnenbrunnen oder Pflicht ruft"
Inst67Quest3_Folgequest = "Ja, Der Seher der Seher"
Inst67Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst67Quest4 = "4. Der Seher der Seher"
Inst67Quest4_Level = "70"
Inst67Quest4_Attain = "70"
Inst67Quest4_Aim = "Tyrith möchte, dass Ihr die Kugel auf dem Balkon auf der Terrasse der Magister benutzt."
Inst67Quest4_Location = "Tyrith (Terrasse der Magister; "..YELLOW.."[2]"..WHITE..")"
Inst67Quest4_Note = "Die Seherkugel befindet sich bei "..YELLOW.."[4]"..WHITE..". Nach der Sequenz erscheint Kalecgos, um das nächste Quest zu starten."
Inst67Quest4_Prequest = "Ja, Terrasse der Magister"
Inst67Quest4_Folgequest = "Ja, Nicht totzukriegen"
Inst67Quest4FQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst67Quest5 = "5. Nicht totzukriegen"
Inst67Quest5_Level = "70"
Inst67Quest5_Attain = "70"
Inst67Quest5_Aim = "Kalecgos hat Euch damit beauftragt, Kael'thas auf der Terrasse der Magister zu bezwingen. Ihr sollt Euch mit Kaels Kopf bei Larethor am Sammelpunkt der Zerschmetterten Sonne treffen."
Inst67Quest5_Location = "Kalecgos (Terrasse der Magister; "..YELLOW.."[4]"..WHITE..")"
Inst67Quest5_Note = "Prinz Kael'thas Sonnenwanderer befindet sich bei "..YELLOW.."[6]"..WHITE..". Nach Abschluss des Quests ist es möglich die Instanz im heroischen Modus zu absolvieren.\n\nLarethor befindet sich bei (Insel von Quel'Danas - Sammelpunkt der Zerschmetterten Sonne; "..YELLOW.."47,31"..WHITE..")."
Inst67Quest5_Prequest = "Ja, Der Seher der Seher"
Inst67Quest5_Folgequest = "Nein"
Inst67Quest5FQuest = "true"
--
Inst67Quest5name1 = "Heller Purpurspinell"
Inst67Quest5name2 = "Runenverzierter Purpurspinell"
Inst67Quest5name3 = "Tränenförmiger Purpurspinell"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst67Quest1_HORDE = Inst67Quest1
Inst67Quest1_HORDE_Level = Inst67Quest1_Level
Inst67Quest1_HORDE_Attain = Inst67Quest1_Attain
Inst67Quest1_HORDE_Aim = Inst67Quest1_Aim
Inst67Quest1_HORDE_Location = Inst67Quest1_Location
Inst67Quest1_HORDE_Note = Inst67Quest1_Note
Inst67Quest1_HORDE_Prequest = Inst67Quest1_Prequest
Inst67Quest1_HORDE_Folgequest = Inst67Quest1_Folgequest
--
Inst67Quest1name1_HORDE = Inst67Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst67Quest2_HORDE = Inst67Quest2
Inst67Quest2_HORDE_Level = Inst67Quest2_Level
Inst67Quest2_HORDE_Attain = Inst67Quest2_Attain
Inst67Quest2_HORDE_Aim = Inst67Quest2_Aim
Inst67Quest2_HORDE_Location = Inst67Quest2_Location
Inst67Quest2_HORDE_Note = Inst67Quest2_Note
Inst67Quest2_HORDE_Prequest = Inst67Quest2_Prequest
Inst67Quest2_HORDE_Folgequest = Inst67Quest2_Folgequest
--
Inst67Quest2name1_HORDE = Inst67Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst67Quest3_HORDE = Inst67Quest3
Inst67Quest3_HORDE_Level = Inst67Quest3_Level
Inst67Quest3_HORDE_Attain = Inst67Quest3_Attain
Inst67Quest3_HORDE_Aim = Inst67Quest3_Aim
Inst67Quest3_HORDE_Location = Inst67Quest3_Location
Inst67Quest3_HORDE_Note = Inst67Quest3_Note
Inst67Quest3_HORDE_Prequest = Inst67Quest3_Prequest
Inst67Quest3_HORDE_Folgequest = Inst67Quest3_Folgequest
Inst67Quest3PreQuest_HORDE = Inst67Quest3PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst67Quest4_HORDE = Inst67Quest4
Inst67Quest4_HORDE_Level = Inst67Quest4_Level
Inst67Quest4_HORDE_Attain = Inst67Quest4_Attain
Inst67Quest4_HORDE_Aim = Inst67Quest4_Aim
Inst67Quest4_HORDE_Location = Inst67Quest4_Location
Inst67Quest4_HORDE_Note = Inst67Quest4_Note
Inst67Quest4_HORDE_Prequest = Inst67Quest4_Prequest
Inst67Quest4_HORDE_Folgequest = Inst67Quest4_Folgequest
Inst67Quest4FQuest_HORDE = Inst67Quest4FQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst67Quest5_HORDE = Inst67Quest5
Inst67Quest5_HORDE_Level = Inst67Quest5_Level
Inst67Quest5_HORDE_Attain = Inst67Quest5_Attain
Inst67Quest5_HORDE_Aim = Inst67Quest5_Aim
Inst67Quest5_HORDE_Location = Inst67Quest5_Location
Inst67Quest5_HORDE_Note = Inst67Quest5_Note
Inst67Quest5_HORDE_Prequest = Inst67Quest5_Prequest
Inst67Quest5_HORDE_Folgequest = Inst67Quest5_Folgequest
Inst67Quest5FQuest_HORDE = Inst67Quest5FQuest
--
Inst67Quest5name1_HORDE = Inst67Quest5name1
Inst67Quest5name2_HORDE = Inst67Quest5name2
Inst67Quest5name3_HORDE = Inst67Quest5name3



--------------- INST68 - Sunwell Plateau ---------------

Inst68Story = "Das Sonnenbrunnenplateau ist eine Schlachtzugsinstanz, die sich auf der Insel von Quel'Danas nördlich von Silbermond befindet. Blizzard plant es zur schwersten Instanz bis zum Erscheinen von Wrath of the Lich King zu machen. Das Sonnenbrunnenplateau ist für Spieler mit T6 Ausrüstung gedacht und dort werden die übrigen T6 Gegenstände (Schuhe, Gürtel und Armschienen), und andere epische Gegenstände droppen. \n\nDie Instanz beinhaltet Innen- und Außenareale, in denen die Spieler gefangene Naaru finden können, die die größte Energiequelle der Stadt sind, und innerhalb des letzten Gebäudes findet man den Sonnenbrunnen selbst.\n\nDas Sonnenbrunnenplateau ist in der selben Architektur wie Silbermond gehalten."
Inst68Caption = "Sonnenbrunnenplateau"
Inst68QAA = "Keine Quests"
Inst68QAH = "Keine Quests"



---------------------------------------------------
---------------- BATTLEGROUNDS --------------------
---------------------------------------------------



--------------- INST33 - Alterac Valley (AV) ---------------

Inst33Story = "Vor langer Zeit schickte der Hexenmeister Guldan einen Klan der Orcs ins Exil, weil es dieser Klan gewagt hatte, sich der schleichenden Korruption der Orcs durch die Brennende Legion entgegenzustellen. Der Frostwolfklan zog sich in ein abgelegenes Tal des Alteracgebirges zurück, wo sie sich vor Guldans Rache versteckten. Im unwirtlichen Alteractal fristeten die Orcs ein von der Welt abgeschiedenes, karges Dasein... bis Thrall kam.\nNach Thralls triumphaler Vereinigung der Klans entschlossen sich die Frostwölfe unter der Führung des Schamanen Drek'Thar, in dem Tal zu bleiben, das so lange ihre Heimat gewesen war. In jüngster Zeit wurde der Frieden des Frostwolfklans jedoch durch die Ankunft der zwergischen Sturmlanzen-Expedition gestört.\nDie Sturmlanzen haben sich auf der Suche nach Rohstoffen und Relikten aus der zwergischen Vorgeschichte im Tal angesiedelt. Trotz ihrer friedlichen Absichten hat die Ankunft der Zwerge einen erbitterten Streit mit dem Frostwolfklan entfacht, in dem inzwischen beide Seiten um die alleinige Kontrolle über das Tal kämpfen. "
Inst33Caption = "Alteractal"
Inst33QAA = "1 Quest"
Inst33QAH = "1 Quest"

--Quest 1 Alliance
Inst33Quest1 = "1. Ruf zu den Waffen: Alteractal (Tagesquest)"
Inst33Quest1_Level = "51"
Inst33Quest1_Attain = "51"
Inst33Quest1_Aim = "Gewinnt eine Schlacht im Alteractal und meldet Euch anschließend bei einem Brigadegeneral der Allianz in einer der Hauptstädte oder in Shattrath."
Inst33Quest1_Location = "Brigadegeneral der Allianz:\n   Shattrath: Unteres Viertel - "..YELLOW.."67,34"..WHITE.."\n   Sturmwind: Burg Sturmwind - "..YELLOW.."83,14"..WHITE.."\n   Eisenschmiede: Militär Viertel - "..YELLOW.."70,91"..WHITE.."\n   Darnassus: Terrasse der Krieger - "..YELLOW.."59,36"..WHITE.."\n   Exodar: Die Halle des Lichts - "..YELLOW.."25,55"
Inst33Quest1_Note = "Dieses Quest kann einmal täglich absolviert werden, sobald man Stufe 51 erreicht hat. Man erhält unterschiedliche Mengen an Erfahrung und Gold, abhängig von der jeweiligen Stufe."
Inst33Quest1_Prequest = "Nein"
Inst33Quest1_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 1 Horde
Inst33Quest1_HORDE = "1. Ruf zu den Waffen: Alteractal (Tagesquest)"
Inst33Quest1_HORDE_Level = "51"
Inst33Quest1_HORDE_Attain = "51"
Inst33Quest1_HORDE_Aim = "Gewinnt eine Schlacht im Alteractal und meldet Euch anschließend bei einem Kriegshetzer der Horde in einer der Hauptstädte oder in Shattrath."
Inst33Quest1_HORDE_Location = "Kriegshetzer der Horde:\n   Shattrath: Unteres Viertel - "..YELLOW.."67,57"..WHITE.."\n   Orgrimmar: Tal der Ehre - "..YELLOW.."80,30"..WHITE.."\n   Donnerfels: Die Anhöhe der Jäger - "..YELLOW.."56,77"..WHITE.."\n   Unterstadt: Das königliche Viertel - "..YELLOW.."61,88"..WHITE.."\n   Silbermond: Platz der Weltenwanderer - "..YELLOW.."97,38"
Inst33Quest1_HORDE_Note = "Dieses Quest kann einmal täglich absolviert werden, sobald man Stufe 51 erreicht hat. Man erhält unterschiedliche Mengen an Erfahrung und Gold, abhängig von der jeweiligen Stufe."
Inst33Quest1_HORDE_Prequest = "Nein"
Inst33Quest1_HORDE_Folgequest = "Nein"
-- No Rewards for this quest



--------------- INST34 - Arathi Basin (AB) ---------------

Inst34Story = "Das Arathibecken im Arathihochland ist ein dynamisches und spannendes Schlachtfeld. Das Talbecken selbst verfügt über wertvolle Rohstoffe, um die die Allianz und die Horde erbitterte Schlachten austragen. Die Verlassenen Entweihten und der Bund von Arathor sind im Talbecken, um die Rohstoffe des Talbeckens für ihre Seite zu sichern und ihrem Gegner eine empfindliche Niederlage beizubringen."
Inst34Caption = "Arathibecken"
Inst34QAA = "4 Quests"
Inst34QAH = "4 Quests"

--Quest 1 Alliance
Inst34Quest1 = "1. Ruf zu den Waffen: Arathibecken (Tagesquest)"
Inst34Quest1_Level = "20"
Inst34Quest1_Attain = "20"
Inst34Quest1_Aim = "Gewinnt eine Schlacht im Arathibecken und meldet Euch anschließend bei einem Brigadegeneral der Allianz in einer der Hauptstädte oder in Shattrath."
Inst34Quest1_Location = "Brigadegeneral der Allianz:\n   Shattrath: Unteres Viertel - "..YELLOW.."67,34"..WHITE.."\n   Sturmwind: Burg Sturmwind - "..YELLOW.."83,14"..WHITE.."\n   Eisenschmiede: Militär Viertel - "..YELLOW.."70,91"..WHITE.."\n   Darnassus: Terrasse der Krieger - "..YELLOW.."59,36"..WHITE.."\n   Exodar: Die Halle des Lichts - "..YELLOW.."25,55"
Inst34Quest1_Note = "Dieses Quest kann einmal täglich absolviert werden, sobald man Stufe 20 erreicht hat. Man erhält unterschiedliche Mengen an Erfahrung und Gold, abhängig von der jeweiligen Stufe."
Inst34Quest1_Prequest = "Nein"
Inst34Quest1_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 2 Alliance
Inst34Quest2 = "2. Die Schlacht um das Arathibecken!"
Inst34Quest2_Level = "25"
Inst34Quest2_Attain = "25"
Inst34Quest2_Aim = "Erobert die Mine, das Sägewerk, die Schmiede und die Farm und meldet Euch anschließend bei Feldmarschall Lichtmark in der Zuflucht."
Inst34Quest2_Location = "Feldmarschall Lichtmark (Arathihochland - Zuflucht; "..YELLOW.."46,45"..WHITE..")"
Inst34Quest2_Note = "Die Orte die man erobern muss, sind auf der Karte mit 2 bis 5 markiert."
Inst34Quest2_Prequest = "Nein"
Inst34Quest2_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 3 Alliance
Inst34Quest3 = "3. Kontrolliert vier Stützpunkte"
Inst34Quest3_Level = "60"
Inst34Quest3_Attain = "60"
Inst34Quest3_Aim = "Betretet das Arathibecken, erobert und kontrolliert gleichzeitig vier Stützpunkte im Arathibecken und kehrt danach zu Feldmarschall Lichtmark in der Zuflucht zurück."
Inst34Quest3_Location = "Feldmarschall Lichtmark (Arathihochland - Zuflucht; "..YELLOW.."46,45"..WHITE..")"
Inst34Quest3_Note = "Man muss freundlichen Ruf mit dem Bund von Arathor haben, um dieses Quest annehmen zu können."
Inst34Quest3_Prequest = "Nein"
Inst34Quest3_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Alliance
Inst34Quest4 = "4. Kontrolliert fünf Stützpunkte"
Inst34Quest4_Level = "60"
Inst34Quest4_Attain = "60"
Inst34Quest4_Aim = "Kontrolliert gleichzeitig fünf Stützpunkte im Arathibecken und kehrt danach zu Feldmarschall Lichtmark in der Zuflucht zurück."
Inst34Quest4_Location = "Feldmarschall Lichtmark (Arathihochland - Zuflucht; "..YELLOW.."46,45"..WHITE..")"
Inst34Quest4_Note = "Man muss ehrfürchtigen Ruf mit dem Bund von Arathor haben, um dieses Quest annehmen zu können."
Inst34Quest4_Prequest = "Nein"
Inst34Quest4_Folgequest = "Nein"
--
Inst34Quest4name1 = "Wappenrock der Arathor"


--Quest 1 Horde
Inst34Quest1_HORDE = "1. Ruf zu den Waffen: Arathibecken (Tagesquest)"
Inst34Quest1_HORDE_Level = "20"
Inst34Quest1_HORDE_Attain = "20"
Inst34Quest1_HORDE_Aim = "Gewinnt eine Schlacht im Arathibecken und meldet Euch anschließend bei einem Kriegshetzer der Horde in einer der Hauptstädte oder in Shattrath."
Inst34Quest1_HORDE_Location = "Kriegshetzer der Horde:\n   Shattrath: Unteres Viertel - "..YELLOW.."67,57"..WHITE.."\n   Orgrimmar: Tal der Ehre - "..YELLOW.."80,30"..WHITE.."\n   Donnerfels: Die Anhöhe der Jäger - "..YELLOW.."56,77"..WHITE.."\n   Unterstadt: Das königliche Viertel - "..YELLOW.."61,88"..WHITE.."\n   Silbermond: Platz der Weltenwanderer - "..YELLOW.."97,38"
Inst34Quest1_HORDE_Note = "Dieses Quest kann einmal täglich absolviert werden, sobald man Stufe 20 erreicht hat. Man erhält unterschiedliche Mengen an Erfahrung und Gold, abhängig von der jeweiligen Stufe."
Inst34Quest1_HORDE_Prequest = "Nein"
Inst34Quest1_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 2 Horde
Inst34Quest2_HORDE = "2. Die Schlacht um das Arathibecken!"
Inst34Quest2_HORDE_Level = "25"
Inst34Quest2_HORDE_Attain = "25"
Inst34Quest2_HORDE_Aim = "Erobert die Mine, das Sägewerk, die Schmiede, die Farm und die Ställe und kehrt dann zu Todesmeister Dunkels in Hammerfall zurück."
Inst34Quest2_HORDE_Location = "Todesmeister Dunkels (Arathihochland - Hammerfall; "..YELLOW.."74,35"..WHITE..")"
Inst34Quest2_HORDE_Note = "Die Orte die man erobern muss, sind auf der Karte mit 1 bis 4 markiert."
Inst34Quest2_HORDE_Prequest = "Nein"
Inst34Quest2_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 3 Horde
Inst34Quest3_HORDE = "3. Erobert vier Stützpunkte"
Inst34Quest3_HORDE_Level = "60"
Inst34Quest3_HORDE_Attain = "60"
Inst34Quest3_HORDE_Aim = "Haltet vier Stützpunkte zur selben Zeit im Arathibecken und kehrt danach zu Todesmeister Dunkels nach Hammerfall zurück."
Inst34Quest3_HORDE_Location = "Todesmeister Dunkels (Arathihochland - Hammerfall; "..YELLOW.."74,35"..WHITE..")"
Inst34Quest3_HORDE_Note = "Man muss freundlichen Ruf mit den Entweihten haben, um dieses Quest annehmen zu können."
Inst34Quest3_HORDE_Prequest = "Nein"
Inst34Quest3_HORDE_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Horde
Inst34Quest4_HORDE = "4. Erobert fünf Stützpunkte"
Inst34Quest4_HORDE_Level = "60"
Inst34Quest4_HORDE_Attain = "60"
Inst34Quest4_HORDE_Aim = "Haltet fünf Stützpunkte zur selben Zeit im Arathibecken und kehrt danach zu Todesmeister Dunkels nach Hammerfall zurück."
Inst34Quest4_HORDE_Location = "Todesmeister Dunkels (Arathihochland - Hammerfall; "..YELLOW.."74,35"..WHITE..")"
Inst34Quest4_HORDE_Note = "Man muss ehrfürchtigen Ruf mit den Entweihten haben, um dieses Quest annehmen zu können."
Inst34Quest4_HORDE_Prequest = "Nein"
Inst34Quest4_HORDE_Folgequest = "Nein"
--
Inst34Quest4name1_HORDE = "Wappenrock der Entweihten"



--------------- INST35 - Warsong Gulch (WSG) ---------------

Inst35Story = "Eingebetted in das südliche Eschental ist die Warsongschlucht nahe dem Gebiet, in dem Grom Höllschrei und seine Orks während des 3. Krieges große Teile des Waldes rodeten. Einige Orks blieben in der Nähe und setzten die Arbeit fort um bei der Erweiterung der Gebiete der Horde zu helfen. Sie nennen sich selber Kriegshymnenvorhut.\nDie Nachtelfen, die eine starke Offensive begonnen haben um den Eschentalwald zurück zuerobern, konzentrieren sich jetzt darauf die Kriegshymnenvorhut für immer zu vertreiben. Die Silberschwingen-Schildwachen haben geschworen, dass sie nicht aufhören werden bis der letzte Ork besiegt ist und aus der Kriegshymnenschlucht entfernt wurde."
Inst35Caption = "Kriegshymnenschlucht"
Inst35QAA = "1 Quest"
Inst35QAH = "1 Quest"

--Quest 1 Alliance
Inst35Quest1 = "1. Ruf zu den Waffen: Kriegshymnenschlucht (Tagesquest)"
Inst35Quest1_Level = "10"
Inst35Quest1_Attain = "10"
Inst35Quest1_Aim = "Gewinnt eine Schlacht in der Kriegshymnenschlucht und meldet Euch anschließend bei einem Brigadegeneral der Allianz in einer der Hauptstädte oder in Shattrath."
Inst35Quest1_Location = "Brigadegeneral der Allianz:\n   Shattrath: Unteres Viertel - "..YELLOW.."67,34"..WHITE.."\n   Sturmwind: Burg Sturmwind - "..YELLOW.."83,14"..WHITE.."\n   Eisenschmiede: Militär Viertel - "..YELLOW.."70,91"..WHITE.."\n   Darnassus: Terrasse der Krieger - "..YELLOW.."59,36"..WHITE.."\n   Exodar: Die Halle des Lichts - "..YELLOW.."25,55"
Inst35Quest1_Note = "Dieses Quest kann einmal täglich absolviert werden, sobald man Stufe 10 erreicht hat. Man erhält unterschiedliche Mengen an Erfahrung und Gold, abhängig von der jeweiligen Stufe."
Inst35Quest1_Prequest = "Nein"
Inst35Quest1_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 1 Horde
Inst35Quest1_HORDE = "1. Ruf zu den Waffen: Kriegshymnenschlucht (Tagesquest)"
Inst35Quest1_HORDE_Level = "10"
Inst35Quest1_HORDE_Attain = "10"
Inst35Quest1_HORDE_Aim = "Gewinnt eine Schlacht in der Kriegshymnenschlucht und meldet Euch anschließend bei einem Kriegshetzer der Horde in einer der Hauptstädte oder in Shattrath."
Inst35Quest1_HORDE_Location = "Kriegshetzer der Horde:\n   Shattrath: Unteres Viertel - "..YELLOW.."67,57"..WHITE.."\n   Orgrimmar: Tal der Ehre - "..YELLOW.."80,30"..WHITE.."\n   Donnerfels: Die Anhöhe der Jäger - "..YELLOW.."56,77"..WHITE.."\n   Unterstadt: Das königliche Viertel - "..YELLOW.."61,88"..WHITE.."\n   Silbermond: Platz der Weltenwanderer - "..YELLOW.."97,38"
Inst35Quest1_HORDE_Note = "Dieses Quest kann einmal täglich absolviert werden, sobald man Stufe 10 erreicht hat. Man erhält unterschiedliche Mengen an Erfahrung und Gold, abhängig von der jeweiligen Stufe."
Inst35Quest1_HORDE_Prequest = "Nein"
Inst35Quest1_HORDE_Folgequest = "Nein"
-- No Rewards for this quest



--------------- INST60 - Eye of the Storm ---------------

Inst60Story = "Weit über der verwüsteten Landschaft des Nethersturms schwebt die Insel, die als Auge des Sturms bekannt ist. Dieses Schlachtfeld ist von den Blutelfen wegen seiner reichen Energieablagerungen begehrt - und die Draenei versuchen es wegen ihres mysteriösen Schiffs einzufordern - Festung der Stürme."
Inst60Caption = "Auge des Sturms"
Inst60QAA = "1 Quest"
Inst60QAH = "1 Quest"

--Quest 1 Alliance
Inst60Quest1 = "1. Ruf zu den Waffen: Auge des Sturms (Tagesquest)"
Inst60Quest1_Level = "61"
Inst60Quest1_Attain = "61"
Inst60Quest1_Aim = "Gewinnt eine Schlacht im Auge des Sturms und meldet Euch anschließend bei einem Brigadegeneral der Allianz in einer der Hauptstädte oder in Shattrath."
Inst60Quest1_Location = "Brigadegeneral der Allianz:\n   Shattrath: Unteres Viertel - "..YELLOW.."67,34"..WHITE.."\n   Sturmwind: Burg Sturmwind - "..YELLOW.."83,14"..WHITE.."\n   Eisenschmiede: Militär Viertel - "..YELLOW.."70,91"..WHITE.."\n   Darnassus: Terrasse der Krieger - "..YELLOW.."59,36"..WHITE.."\n   Exodar: Die Halle des Lichts - "..YELLOW.."25,55"
Inst60Quest1_Note = "Dieses Quest kann einmal täglich absolviert werden, sobald man Stufe 61 erreicht hat. Man erhält unterschiedliche Mengen an Erfahrung und Gold, abhängig von der jeweiligen Stufe."
Inst60Quest1_Prequest = "Nein"
Inst60Quest1_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 1 Horde
Inst60Quest1_HORDE = "1. Ruf zu den Waffen: Auge des Sturms (Tagesquest)"
Inst60Quest1_HORDE_Level = "61"
Inst60Quest1_HORDE_Attain = "61"
Inst60Quest1_HORDE_Aim = "Gewinnt eine Schlacht im Auge des Sturms und meldet Euch anschließend bei einem Kriegshetzer der Horde in einer der Hauptstädte oder in Shattrath."
Inst60Quest1_HORDE_Location = "Kriegshetzer der Horde:\n   Shattrath: Unteres Viertel - "..YELLOW.."67,57"..WHITE.."\n   Orgrimmar: Tal der Ehre - "..YELLOW.."80,30"..WHITE.."\n   Donnerfels: Die Anhöhe der Jäger - "..YELLOW.."56,77"..WHITE.."\n   Unterstadt: Das königliche Viertel - "..YELLOW.."61,88"..WHITE.."\n   Silbermond: Platz der Weltenwanderer - "..YELLOW.."97,38"
Inst60Quest1_HORDE_Note = "Dieses Quest kann einmal täglich absolviert werden, sobald man Stufe 61 erreicht hat. Man erhält unterschiedliche Mengen an Erfahrung und Gold, abhängig von der jeweiligen Stufe."
Inst60Quest1_HORDE_Prequest = "Nein"
Inst60Quest1_HORDE_Folgequest = "Nein"
-- No Rewards for this quest



---------------------------------------------------
---------------- OUTDOOR RAIDS --------------------
---------------------------------------------------



--------------- INST30 - Dragons of Nightmare ---------------

Inst30Story = {
  ["Page1"] = "Ein rauer Wind weht durch die Kronen der Großen Bäume. Etwas Unheimliches hat sich fernab der wachsamen Augen der Beschützer Azeroths eingeschlichen und bedroht nun Eschental, den Dämmerwald, Feralas und das Hinterland. Vier der mächtigen Wächter des grünen Drachenschwarms sind aus dem smaragdgrünen Traum zurückgekehrt, doch die einstmals stolzen Beschützer verbreiten nun nichts als Tod und Zerstörung. Azeroth braucht tapfere Abenteurer mehr denn je, die das Land gegen diese düsteren Vorboten verteidigen.",
  ["Page2"] = "Ysera, der große Drachenaspekt der Träume, führt den geheimnisvollen grünen Drachenschwarm an. Ihr Reich sind die fantastischen, mystischen Weiten des smaragdgrünen Traums, und man erzählt sich, dass sie von dort aus die Evolution allen Lebens beeinflusst. Sie ist die Beschützerin der Natur und der Phantasie; ihr und ihrem Drachenschwarm wurde die Ehre zuteil, die Großen Bäume zu bewachen, durch die allein die Druiden in den Traum hinüberwechseln können. Vor kurzem wurden Yseras treueste Diener von einer dunklen neuen Macht besudelt, die sich im smaragdgrünen Traum ausbreitet. Nun sind die abtrünnigen Wächter durch die Großen Bäume nach Azeroth zurückgekehrt, um Angst und Schrecken in den Ländern der Sterblichen zu verbreiten. Selbst die mächtigsten Abenteurer sollten sich den Drachen nicht alleine entgegenstellen, um nicht die volle Gewalt ihres entfesselten Zornes zu spüren zu bekommen.",
  ["Page3"] = "Als Lethon der Anomalie innerhalb des smaragdgrünen Traums ausgesetzt wurde, verdunkelte sich nicht nur die Tönung seiner Schuppen... der Drache erhielt auch die Fähigkeit, bösartige Schemen aus seinen Feinden aufzusaugen. Sobald diese mit ihrem Meister verschmelzen, heilt ihn die Energie der Schemen. So ist es keine Überraschung, das Lethon einer der Furcht erregendsten Abtrünnigen ist.",
  ["Page4"] = "Eine mysteriöse, dunkle Macht innerhalb des smaragdgrünen Traums hat die einst majestätische Emeriss in eine verwesende, faulige Monstrosität verwandelt. Die wenigen, die eine Begegnung mit dem Drachen überlebt haben, erzählen Ekel erregende Geschichten von eitrigen Pilzen, die aus den Leichen gefallener Kämpfer sprießen. Ob diese Geschichten wahr oder nur die Ausgeburten geistig Verstörter sind, lässt sich wohl nur herausfinden, indem man der scheußlichen Bestie entgegentritt.",
  ["Page5"] = "Von all jenen, die mit der Anomalie in Kontakt gekommen sind, hat Taerar wohl am meisten gelitten. Sie hat nicht bloß seinen Verstand, sondern auch seine körperliche Gestalt gespalten. Der Drache existiert nun als Phantom, das sich in mehrere Splittergestalten aufteilen kann, die über vernichtende magische Kräfte verfügen. Taerar ist ein gerissener und erbarmungsloser Gegner, der den Wahnsinn seiner eigenen Existenz für die Bewohner Azeroths zu einer grausamen Wirklichkeit machen will.",
  ["Page6"] = "Ysondre, einst eine von Yseras vertrautesten Anhängerinnen, hat sich den Abtrünnigen angeschlossen und verbreitet nun Chaos und Terror in Azeroth. Ihre ehemals segensreichen Heilkräfte haben sich zu dunkler Magie gewandelt, mit der sie sengende Blitze verschleudern und fehlgeleitete Druiden zu Hilfe rufen kann. Ysondre und die ihren können ihre Gegner auch einschlafen lassen, wodurch ihre hilflosen Opfer in das Reich der schrecklichsten Alpträume geschickt werden.",
  ["MaxPages"] = "6",
};

Inst30Caption = "Alptraumdrachen"
Inst30Caption2 = "Ysera und der grüne Drachenschwarm"
Inst30Caption3 = "Lethon"
Inst30Caption4 = "Emeriss"
Inst30Caption5 = "Taerar"
Inst30Caption6 = "Ysondre"
Inst30QAA = "1 Quest"
Inst30QAH = "1 Quest"

--Quest 1 Alliance
Inst30Quest1 = "1. Eingehüllt in Alpträume"
Inst30Quest1_Level = "60"
Inst30Quest1_Attain = "60"
Inst30Quest1_Aim = "Sucht nach jemandem, der die Bedeutung des in Alpträume gehüllten Gegenstands entschlüsseln kann.\n\nVielleicht kann Euch ein Druide von großer Macht weiterhelfen."
Inst30Quest1_Location = "In Alpträume gehüllter Gegenstand (droppt von Emeriss, Taerar, Lethon oder Ysondre)"
Inst30Quest1_Note = "Die Quest wird bei Bewahrer Remulos bei (Mondlichtung - Schrein von Remulos; "..YELLOW.."36,41"..WHITE..") abgegeben. Die aufgeführte Questbelohnung gibt es beim Folgequest."
Inst30Quest1_Prequest = "Nein"
Inst30Quest1_Folgequest = "Ja, Legenden erwachen"
--
Inst30Quest1name1 = "Malfurions Siegelring"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst30Quest1_HORDE = Inst30Quest1
Inst30Quest1_HORDE_Level = Inst30Quest1_Level
Inst30Quest1_HORDE_Attain = Inst30Quest1_Attain
Inst30Quest1_HORDE_Aim = Inst30Quest1_Aim
Inst30Quest1_HORDE_Location = Inst30Quest1_Location
Inst30Quest1_HORDE_Note = Inst30Quest1_Note
Inst30Quest1_HORDE_Prequest = Inst30Quest1_Prequest
Inst30Quest1_HORDE_Folgequest = Inst30Quest1_Folgequest
--
Inst30Quest1name1_HORDE = Inst30Quest1name1



--------------- INST31 - Azuregos ---------------

Inst31Story = "Vor der Spaltung der Welt blühte die elfische Stadt Eldarath in den Landen, die nunmehr Azshara genannt werden. Manche sagen, dass unter den Ruinen der Stadt immer noch zahllose Artefakte der Hochgeborenen schlummern. Seit ungezählten Generationen wacht der blaue Drachenschwarm über mächtige Artefakte und magisches Wissen, damit nichts davon in die falschen Hände fällt. Die Anwesenheit von Azuregos, dem blauen Drachen, scheint darauf hinzuweisen, dass in der Wildnis von Azshara extrem seltene Gegenstände schlummern, vielleicht sogar die Phiolen der Ewigkeit. Doch egal was der Drache sucht, eins ist sicher - er wird bis zum letzten Kämpfen, um diese Schätze zu verteidigen!"
Inst31Caption = "Azuregos"
Inst31QAA = "1 Quest"
Inst31QAH = "1 Quest"

--Quest 1 Alliance
Inst31Quest1 = "1. Uraltes in Sehnen eingewickeltes Laminablatt (Jäger)"
Inst31Quest1_Level = "60"
Inst31Quest1_Attain = "60"
Inst31Quest1_Aim = "Hastat der Uralte hat Euch um die Beschaffung einer Sehne eines ausgewachsenen, blauen Drachen gebeten. Solltet Ihr diese Sehne finden, kehrt zu Hastat im Teufelswald zurück."
Inst31Quest1_Location = "Hastat der Uralte (Teufelswald - Der Eisenwald; "..YELLOW.."48,24"..WHITE..")"
Inst31Quest1_Note = "Töte Azuregos, um die Sehne eines ausgewachsenen blauen Drachen zu erhalten. Er wandert in der Mitte der südlichen Halbinsel Azsharas um "..YELLOW.."[1]"..WHITE.." umher."
Inst31Quest1_Prequest = "Ja, Das uralte Blatt ("..YELLOW.."Geschmolzener Kern"..WHITE..")"
Inst31Quest1_Folgequest = "Nein"
Inst31Quest1PreQuest = "true"
--
Inst31Quest1name1 = "Uraltes in Sehnen eingewickeltes Laminablatt"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst31Quest1_HORDE = Inst31Quest1
Inst31Quest1_HORDE_Level = Inst31Quest1_Level
Inst31Quest1_HORDE_Attain = Inst31Quest1_Attain
Inst31Quest1_HORDE_Aim = Inst31Quest1_Aim
Inst31Quest1_HORDE_Location = Inst31Quest1_Location
Inst31Quest1_HORDE_Note = Inst31Quest1_Note
Inst31Quest1_HORDE_Prequest = Inst31Quest1_Prequest
Inst31Quest1_HORDE_Folgequest = Inst31Quest1_Folgequest
Inst31Quest1PreQuest_HORDE = Inst31Quest1PreQuest
--
Inst31Quest1name1_HORDE = Inst31Quest1name1



--------------- INST32 - Highlord Kruul ---------------

Inst32Story = "Hochlord Kruul ist ein Verdammniswachenboss, der während des Öffnungsevents des Dunklen Portals in verschiedenen Teilen Azeroths erschien (Patch 2.0.3). Nachdem das Dunkle Portal geöffnet wurde, hat er offiziell Fürst Kazzak ersetzt (jetzt Verdammnislord Kazzak in der Höllenfeuerhalbinsel der Scherbenwelt als Feldkommandant der Brennen Legion in Azeroth)."
Inst32Caption = "Hochlord Kruul"
Inst32QAA = "Keine Quests"
Inst32QAH = "Keine Quests"



--------------- INST64 - Doom Lord Kazzak ---------------

Inst64Story = {
  ["Page1"] = "Kazzak der Oberste, Kil'jaeden's rechte Hand, den meisten bekannt als Dämonenfürst Kazzak, 'Herr der Verdammniswachendämonen', war einer von Archimondes Leutnants während des Dritten Krieges.\n\nNach der Niederlage seines Meisters hat Kazzak sich zurückgezogen. Er und seine Truppen haben ein verdorbenes Gebiet in den Verwüsteten Landen besetzt, bekannt als die Faulende Narbe. Er lebte in einem Turm, der im giftigen Nebel versteckt lag. Kazzak war ein gewaltiger Dämon mit großer Macht, aber ihm mangelte an unabhängiger Initiative. Gefangen in der Faulenden Narbe war er komplett vom Kontakt mit anderen dämonischen Truppen auf Azeroth abgeschnitten. Auch wenn solche Persönlichkeiten wie Balnazzar sich seiner Präsenz bewusst wurden, vermieden sie den Kontakt zu ihm aus Angst vor Kazzaks Macht.",
  ["Page2"] = "Zwei Jahre nach der Gründung von Durotar mit einer ungewissen Zukunft kam ein Relikt aus der Vergangenheit, das erneuerte Energie ausstrahlte, zum Vorschein. Das Relikt hat Fürst Kazzak ermöglicht, das Dunkle Portal zu aktivieren, wodurch das Tor zum zerschlagenen Reich der Scherbenwelt wieder geöffnet wurde. Nachdem das Portal geöffnet wurde, wurde Fürst Kazzak gesehen, wie er die Welt durch das Dunkle Portal verlies. An seiner Stelle hinterließ er seinen Lakai Hochlord Kruul, um Angst und Verwirrung über die Verteidiger zu säen. Kruul wurde zusammen mit einem Heer von Höllenbestien in der Nähe einiger großen Städte in Azeroth gesehen.\n\nSobald Fürst Kazzak in der Scherbenwelt angekommen ist, wurde er zum Verdammnislord befördert und auf den Tron von Kil'jaeden gesetzt, einem Berg in der Höllenfeuerhalbinsel, welchen er bis heute beschützt.",
  ["Page3"] = "Im Gegensatz zu vielen Dämonenanführern, die dazu neigen, hinter den Linien zu stehen und ihre Günstlinge auf einen Feind zu hetzen, liebt Kazzak nichts mehr als direkt in der Hitze einer Schlacht zu waten. Dort zerschlägt er Formationen mit seiner Schattensturmfähigkeit, während er mit seinem gewaltigen Großschwert Verfall über einzelne Helden bringt. Wenn die Schlacht ihre kritischste Phase erreicht, verfällt er in Rage und feiert eine Orgie der Zerstörung.",
  ["MaxPages"] = "3",
};
Inst64Caption = "Verdammnislord Kazzak"
Inst64QAA = "Keine Quests"
Inst64QAH = "Keine Quests"



--------------- INST65 - Doomwalker ---------------

Inst65Story = "Verdammniswandler ist ein mächtiger Teufelshäscher, der von Kil'jaeden ausgesendet wurde, um die Tore des Schwarzen Tempels im Schattenmondtal zu überfallen.\n\nEr ist ein ?? Elite (Boss) und hat genau die gleichen Fähigkeiten wie ein normaler Teufelshäscher, abgesehen von seiner Fähigkeit 'Überrennen'. Er ist allerdings wesentlich stärker und haut fester zu."
Inst65Caption = "Verdammniswandler"
Inst65QAA = "Keine Quests"
Inst65QAH = "Keine Quests"



--------------- INST66 - Skettis ---------------

Inst66Story = "Die Himmelswache besteht aus den Kriegern der Sha'tari, die sich auf die Sicherung der Himmel über Shattrath spezialisiert haben. Und dieses Mal tragen sie den Kampf direkt zur Hauptstadt der Arakkoa, nach Skettis. Versteckt in den hohen Bergen von Terokkar und nur mit einem fliegenden Reittier erreichbar bietet Skettis neue und aufregende Inhalte für einzelne Spieler und kleine Gruppen der Stufe 70. Brandneue Quests, Endgegner für Fünfergruppen, seltene und epische Gegenstände und ein neues fliegendes Reittier erwarten alle, die sich mit Schwert oder Stab in die Schlacht wagen."
Inst66Caption = "Skettis"
Inst66QAA = "13 Quests"
Inst66QAH = "13 Quests"

--Quest 1 Alliance
Inst66Quest1 = "1. Nach Skettis!"
Inst66Quest1_Level = "70"
Inst66Quest1_Attain = "70"
Inst66Quest1_Aim = "Bringt das Paket mit Sprengladungen zu Himmelsoffizier Doryn beim Schattenwindlager außerhalb von Skettis."
Inst66Quest1_Location = "Yuula (Shattrath; "..YELLOW.."65,42"..WHITE..")"
Inst66Quest1_Note = "Das Vorquest erhält man vom selben NPC. Das Schattenwindlager befindet sich bei "..YELLOW.."[1]"..WHITE.."."
Inst66Quest1_Prequest = "Ja, Bedrohung von oben"
Inst66Quest1_Folgequest = "Ja, Feuer über Skettis"
Inst66Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst66Quest2 = "2. Feuer über Skettis (Tagesquest)"
Inst66Quest2_Level = "70"
Inst66Quest2_Attain = "70"
Inst66Quest2_Aim = "Haltet nach monströsen Kalirieiern oben in den Siedlungen von Skettis Ausschau und benutzt die Sprengladungen der Himmelswache, um sie in die Luft zu sprengen. Kehrt danach zu Himmelsoffizier Doryn zurück."
Inst66Quest2_Location = "Himmelsoffizier Doryn (Wälder von Terokkar - Schattenwindlager; "..YELLOW.."65,66"..WHITE..")"
Inst66Quest2_Note = "Dieses Quest kann einmal täglich absolviert werden. Die Eier kann man während dem Fliegen mit dem Flugtier aus der Luft bombadieren. Achtet auf die Monströsen Kaliri Vögel, die herumfliegen, da sie euch vom Flugtier schmeißen, wenn ihr zu nahe kommt. Das Quest kann als Gruppe erledigt werden."
Inst66Quest2_Prequest = "Ja, Nach Skettis!"
Inst66Quest2_Folgequest = "Nein"
Inst66Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst66Quest3 = "3. Flucht aus Skettis (Tagesquest)"
Inst66Quest3_Level = "70"
Inst66Quest3_Attain = "70"
Inst66Quest3_Aim = "Begleitet die gefangene Himmelswache in Sicherheit und meldet Euch anschließend bei Himmelsoffizier Doryn."
Inst66Quest3_Location = "Gefangene Himmelswache (Wälder von Terokkar - Skettis; "..YELLOW.."[4]"..WHITE..")"
Inst66Quest3_Note = "Dieses Quest kann einmal täglich absolviert werden und ist erhältlich, sobald 'Nach Skettis!' abgeschlossen ist.\nDie Gefangene Himmelswache erscheint zufällig an einem der drei Punkte, die mit "..YELLOW.."[4]"..WHITE.." markiert sind.  Das Quest kann als Gruppe erledigt werden."
Inst66Quest3_Prequest = "Nein"
Inst66Quest3_Folgequest = "Nein"
-- No Rewards for this quest

--Quest 4 Alliance
Inst66Quest4 = "4. Hungrige Netherrochen"
Inst66Quest4_Level = "70"
Inst66Quest4_Attain = "70"
Inst66Quest4_Aim = "Benutzt den Netherrochenkäfig in den Wäldern südlich des Schattenwindlagers und erlegt in der Nähe des hungrigen Netherrochens einige Schattenwindhetzer. Kehrt anschließend zu Deesak dem Tierführer der Himmelswache zurück."
Inst66Quest4_Location = "Deesak der Tierführer der Himmelswache (Wälder von Terokkar - Schattenwindlager; "..YELLOW.."63,66"..WHITE..")"
Inst66Quest4_Note = "Die Schattenwindhetzer (achtet darauf Hetzer zu töten, keine Jäger) können entlang des südlichen Endes von Skettis gefunden werden. Der hungrige Netherrochen muss in der Nähe des Hetzers sein, wenn man ihn tötet. Nicht weitergehen bis angezeigt wird, dass das Quest abgeschlossen ist, es dauert normalerweise ein paar Sekunden."
Inst66Quest4_Prequest = "Nein"
Inst66Quest4_Folgequest = "Nein"
--
Inst66Quest4name1 = "Elixier der erheblichen Beweglichkeit"
Inst66Quest4name2 = "Elixier des Adepten"

--Quest 5 Alliance
Inst66Quest5 = "5. Schattenwelt"
Inst66Quest5_Level = "70"
Inst66Quest5_Attain = "70"
Inst66Quest5_Aim = "Severin möchte, dass Ihr nach Skettis reist und 6 Einheiten Schattenstaub von den dort lebenden Arakkoa sammelt."
Inst66Quest5_Location = "Severin (Wälder von Terokkar - Schattenwindlager; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest5_Note = "Dieses Quest kann wiederholt werden. Der Schattenstaub kann von allen Arakkoa gedroppt werden."
Inst66Quest5_Prequest = "Nein"
Inst66Quest5_Folgequest = "Nein"
--
Inst66Quest5name1 = "Elixier der Schatten"

--Quest 6 Alliance
Inst66Quest6 = "6. Die Geheimnisse der Krallenpriester"
Inst66Quest6_Level = "70"
Inst66Quest6_Attain = "70"
Inst66Quest6_Aim = "Beschafft Euch von Severin ein Elixier der Schatten und verwendet es, um Krallenpriester Ishaal, Krallenpriester Skizzik und Krallenpriester Zellek in Skettis ausfindig zu machen und sie zu töten. Kehrt nach Abschluss Eurer Aufgabe zu Kommandant Adaris zurück."
Inst66Quest6_Location = "Himmelskommandant Adaris (Wälder von Terokkar - Schattenwindlager; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest6_Note = "Man muss Schattenwelt abgeschlossen haben, um das Elixier der Schatten zu erhalten, bevor man dieses Quest absolvieren kann.\n\nKrallenpriester Ishaal befindet sich bei "..YELLOW.."[5]"..WHITE..", Krallenpriester Skizzik befindet sich bei "..YELLOW.."[6]"..WHITE.." und Krallenpriester Zellek befindet sich bei "..YELLOW.."[7]"..WHITE.."."
Inst66Quest6_Prequest = "Ja, Schattenwelt"
Inst66Quest6_Folgequest = "Nein"
Inst66Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst66Quest7 = "7. Ishaals Almanach"
Inst66Quest7_Level = "70"
Inst66Quest7_Attain = "70"
Inst66Quest7_Aim = "Bringt Ishaals Almanach zu Himmelskommandant Adaris im Norden von Skettis."
Inst66Quest7_Location = "Ishaals Almanach (droppt von Krallenpriester Ishaal; "..YELLOW.."[5]"..WHITE..")"
Inst66Quest7_Note = "Himmelskommandant Adaris befindet sich in den Wäldern von Terokkar - Schattenwindlager ("..YELLOW.."64,66"..WHITE..")."
Inst66Quest7_Prequest = "Nein"
Inst66Quest7_Folgequest = "Ja, Ein Verbündeter im unteren Viertel"
-- No Rewards for this quest

--Quest 8 Alliance
Inst66Quest8 = "8. Ein Verbündeter im unteren Viertel"
Inst66Quest8_Level = "70"
Inst66Quest8_Attain = "70"
Inst66Quest8_Aim = "Bringt Ishaals Almanach zu Rilak dem Erlösten im unteren Viertel in Shattrath."
Inst66Quest8_Location = "Himmelskommandant Adaris (Wälder von Terokkar - Schattenwindlager; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest8_Note = "Rilak der Erlöste befindet sich in Shattrath - Unteres Viertel ("..YELLOW.."52,20"..WHITE..")."
Inst66Quest8_Prequest = "Ja, Ishaals Almanach"
Inst66Quest8_Folgequest = "Ja, Countdown des Schicksals"
Inst66Quest8FQuest = "true"
-- No Rewards for this quest

--Quest 9 Alliance
Inst66Quest9 = "9. Countdown des Schicksals"
Inst66Quest9_Level = "70"
Inst66Quest9_Attain = "70"
Inst66Quest9_Aim = "Kehrt zu Himmelskommandant Adaris zurück und berichtet ihm von den Neuigkeiten über Terokks Rückkehr."
Inst66Quest9_Location = "Rilak der Erlöste (Shattrath - Unteres Viertel; "..YELLOW.."52,20"..WHITE..")"
Inst66Quest9_Note = "Himmelskommandant Adaris befindet sich in den Wäldern von Terokkar - Schattenwindlager ("..YELLOW.."64,66"..WHITE.."). Hazzik, der sich in der Nähe befindet, gibt euch das Folgequest."
Inst66Quest9_Prequest = "Ja, Ein Verbündeter im unteren Viertel"
Inst66Quest9_Folgequest = "Ja, Hazziks Handel"
Inst66Quest9FQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst66Quest10 = "10. Hazziks Handel"
Inst66Quest10_Level = "70"
Inst66Quest10_Attain = "70"
Inst66Quest10_Aim = "Sucht nach Hazziks Päckchen bei seiner Behausung im östlichen Skettis und kehrt damit zu ihm zurück."
Inst66Quest10_Location = "Hazzik (Wälder von Terokkar - Schattenwindlager; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest10_Note = "Hazziks Päckchen befindet sich in einer Hütte bei "..YELLOW.."[8]"..WHITE.."."
Inst66Quest10_Prequest = "Ja, Countdown des Schicksals"
Inst66Quest10_Folgequest = "Ja, Eine schäbige Verkleidung"
Inst66Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst66Quest11 = "11. Eine schäbige Verkleidung"
Inst66Quest11_Level = "70"
Inst66Quest11_Attain = "70"
Inst66Quest11_Aim = "Verwendet die schäbige Arakkoaverkleidung, um den Stammbaum der Feinde von Sahakk zu beschaffen. Kehrt anschließend zu Hazzik zurück."
Inst66Quest11_Location = "Hazzik (Wälder von Terokkar - Schattenwindlager; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest11_Note = "Sahaak befindet sich bei "..YELLOW.."[3]"..WHITE..". Falls irgendein Arakkoa außer Sahaak euch in der Verkleidung sieht, wird er angreifen."
Inst66Quest11_Prequest = "Ja, Hazziks Handel"
Inst66Quest11_Folgequest = "Ja, Feindesblut"
Inst66Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst66Quest12 = "12. Feindesblut"
Inst66Quest12_Level = "70"
Inst66Quest12_Attain = "70"
Inst66Quest12_Aim = "Findet die Schädelhaufen innerhalb der Beschwörungskreise in Skettis. Beschwört und bezwingt die Nachfahren, indem Ihr 10 zeitverlorene Schriftrollen beim Schädelhaufen benutzt. Kehrt anschließend mit einem Gegenstand von jedem der Nachfahren zu Hazzik beim Schattenwindlager zurück."
Inst66Quest12_Location = "Hazzik (Wälder von Terokkar - Schattenwindlager; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest12_Note = "Die Schädelhaufen befinden sich bei "..GREEN.."[1']"..WHITE..". Es droppt nur ein Questgegenstand pro Gruppe für jeden getöteten Nachfahren. Also benötigt jedes Gruppenmitglied, das das Quest abschließen will, 10 Schriftrollen, um die Nachfahren für den Gegenstad zu beschwören. Die Qualität des Questgegenstands ist grün, also muss darum gewürftelt werden, wenn Plündern als Gruppe aktiviert ist. Dieses Quest kann wiederholt werden."
Inst66Quest12_Prequest = "Ja, Eine schäbige Verkleidung"
Inst66Quest12_Folgequest = "Nein"
Inst66Quest12FQuest = "true"
--
Inst66Quest12name1 = "Zeitverlorene Opfergabe"

--Quest 13 Alliance
Inst66Quest13 = "13. Terokks Fall"
Inst66Quest13_Level = "70"
Inst66Quest13_Attain = "70"
Inst66Quest13_Aim = "Bringt die Zeitverlorene Opfergabe, die Hazzik angefertigt hat, zu dem Schädelhaufen im Zentrum von Skettis. Beschwört Terokk und bezwingt ihn. Habt Ihr Eure Aufgabe erfüllt, kehrt zu Himmelskommandant Adaris zurück."
Inst66Quest13_Location = "Himmelskommandant Adaris (Wälder von Terokkar - Schattenwindlager; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest13_Note = "Terokk wird bei "..YELLOW.."[2]"..WHITE.." beschworen. Ein Tipp von fissi0nx auf Wowhead:\nBei 20% wird Terokk immun gegen alle Angriffe, und kurz danach sieht man eine blaue Flamme shortly, wo eine Bombe herabfällt. Zieht Terokk ins Feuer, um seien Schild zu brechen. Er verfällt zwar in Raserei, aber es ist wieder möglich ihn zu töten."
Inst66Quest13_Prequest = "Ja, Feindesblut"
Inst66Quest13_Folgequest = "Nein"
Inst66Quest13PreQuest = "true"
--
Inst66Quest13name1 = "Juwelenbesetzte Rute"
Inst66Quest13name2 = "Wurfmesser des Spähers"
Inst66Quest13name3 = "Severins Stock"
Inst66Quest13name4 = "Windstürmerlanze"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst66Quest1_HORDE = Inst66Quest1
Inst66Quest1_HORDE_Level = Inst66Quest1_Level
Inst66Quest1_HORDE_Attain = Inst66Quest1_Attain
Inst66Quest1_HORDE_Aim = Inst66Quest1_Aim
Inst66Quest1_HORDE_Location = Inst66Quest1_Location
Inst66Quest1_HORDE_Note = Inst66Quest1_Note
Inst66Quest1_HORDE_Prequest = Inst66Quest1_Prequest
Inst66Quest1_HORDE_Folgequest = Inst66Quest1_Folgequest
Inst66Quest1PreQuest_HORDE = Inst66Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst66Quest2_HORDE = Inst66Quest2
Inst66Quest2_HORDE_Level = Inst66Quest2_Level
Inst66Quest2_HORDE_Attain = Inst66Quest2_Attain
Inst66Quest2_HORDE_Aim = Inst66Quest2_Aim
Inst66Quest2_HORDE_Location = Inst66Quest2_Location
Inst66Quest2_HORDE_Note = Inst66Quest2_Note
Inst66Quest2_HORDE_Prequest = Inst66Quest2_Prequest
Inst66Quest2_HORDE_Folgequest = Inst66Quest2_Folgequest
Inst66Quest2PreQuest_HORDE = Inst66Quest2PreQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst66Quest3_HORDE = Inst66Quest3
Inst66Quest3_HORDE_Level = Inst66Quest3_Level
Inst66Quest3_HORDE_Attain = Inst66Quest3_Attain
Inst66Quest3_HORDE_Aim = Inst66Quest3_Aim
Inst66Quest3_HORDE_Location = Inst66Quest3_Location
Inst66Quest3_HORDE_Note = Inst66Quest3_Note
Inst66Quest3_HORDE_Prequest = Inst66Quest3_Prequest
Inst66Quest3_HORDE_Folgequest = Inst66Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst66Quest4_HORDE = Inst66Quest4
Inst66Quest4_HORDE_Level = Inst66Quest4_Level
Inst66Quest4_HORDE_Attain = Inst66Quest4_Attain
Inst66Quest4_HORDE_Aim = Inst66Quest4_Aim
Inst66Quest4_HORDE_Location = Inst66Quest4_Location
Inst66Quest4_HORDE_Note = Inst66Quest4_Note
Inst66Quest4_HORDE_Prequest = Inst66Quest4_Prequest
Inst66Quest4_HORDE_Folgequest = Inst66Quest4_Folgequest
--
Inst66Quest4name1_HORDE = Inst66Quest4name1
Inst66Quest4name2_HORDE = Inst66Quest4name2

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst66Quest5_HORDE = Inst66Quest5
Inst66Quest5_HORDE_Level = Inst66Quest5_Level
Inst66Quest5_HORDE_Attain = Inst66Quest5_Attain
Inst66Quest5_HORDE_Aim = Inst66Quest5_Aim
Inst66Quest5_HORDE_Location = Inst66Quest5_Location
Inst66Quest5_HORDE_Note = Inst66Quest5_Note
Inst66Quest5_HORDE_Prequest = Inst66Quest5_Prequest
Inst66Quest5_HORDE_Folgequest = Inst66Quest5_Folgequest
--
Inst66Quest5name1_HORDE = Inst66Quest5name1
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst66Quest6_HORDE = Inst66Quest6
Inst66Quest6_HORDE_Level = Inst66Quest6_Level
Inst66Quest6_HORDE_Attain = Inst66Quest6_Attain
Inst66Quest6_HORDE_Aim = Inst66Quest6_Aim
Inst66Quest6_HORDE_Location = Inst66Quest6_Location
Inst66Quest6_HORDE_Note = Inst66Quest6_Note
Inst66Quest6_HORDE_Prequest = Inst66Quest6_Prequest
Inst66Quest6_HORDE_Folgequest = Inst66Quest6_Folgequest
Inst66Quest6PreQuest_HORDE = Inst66Quest6PreQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst66Quest7_HORDE = Inst66Quest7
Inst66Quest7_HORDE_Level = Inst66Quest7_Level
Inst66Quest7_HORDE_Attain = Inst66Quest7_Attain
Inst66Quest7_HORDE_Aim = Inst66Quest7_Aim
Inst66Quest7_HORDE_Location = Inst66Quest7_Location
Inst66Quest7_HORDE_Note = Inst66Quest7_Note
Inst66Quest7_HORDE_Prequest = Inst66Quest7_Prequest
Inst66Quest7_HORDE_Folgequest = Inst66Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst66Quest8_HORDE = Inst66Quest8
Inst66Quest8_HORDE_Level = Inst66Quest8_Level
Inst66Quest8_HORDE_Attain = Inst66Quest8_Attain
Inst66Quest8_HORDE_Aim = Inst66Quest8_Aim
Inst66Quest8_HORDE_Location = Inst66Quest8_Location
Inst66Quest8_HORDE_Note = Inst66Quest8_Note
Inst66Quest8_HORDE_Prequest = Inst66Quest8_Prequest
Inst66Quest8_HORDE_Folgequest = Inst66Quest8_Folgequest
Inst66Quest8FQuest_HORDE = Inst66Quest8FQuest
-- No Rewards for this quest

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst66Quest9_HORDE = Inst66Quest9
Inst66Quest9_HORDE_Level = Inst66Quest9_Level
Inst66Quest9_HORDE_Attain = Inst66Quest9_Attain
Inst66Quest9_HORDE_Aim = Inst66Quest9_Aim
Inst66Quest9_HORDE_Location = Inst66Quest9_Location
Inst66Quest9_HORDE_Note = Inst66Quest9_Note
Inst66Quest9_HORDE_Prequest = Inst66Quest9_Prequest
Inst66Quest9_HORDE_Folgequest = Inst66Quest9_Folgequest
Inst66Quest9FQuest_HORDE = Inst66Quest9FQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst66Quest10_HORDE = Inst66Quest10
Inst66Quest10_HORDE_Level = Inst66Quest10_Level
Inst66Quest10_HORDE_Attain = Inst66Quest10_Attain
Inst66Quest10_HORDE_Aim = Inst66Quest10_Aim
Inst66Quest10_HORDE_Location = Inst66Quest10_Location
Inst66Quest10_HORDE_Note = Inst66Quest10_Note
Inst66Quest10_HORDE_Prequest = Inst66Quest10_Prequest
Inst66Quest10_HORDE_Folgequest = Inst66Quest10_Folgequest
Inst66Quest10FQuest_HORDE = Inst66Quest10FQuest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst66Quest11_HORDE = Inst66Quest11
Inst66Quest11_HORDE_Level = Inst66Quest11_Level
Inst66Quest11_HORDE_Attain = Inst66Quest11_Attain
Inst66Quest11_HORDE_Aim = Inst66Quest11_Aim
Inst66Quest11_HORDE_Location = Inst66Quest11_Location
Inst66Quest11_HORDE_Note = Inst66Quest11_Note
Inst66Quest11_HORDE_Prequest = Inst66Quest11_Prequest
Inst66Quest11_HORDE_Folgequest = Inst66Quest11_Folgequest
Inst66Quest11FQuest_HORDE = Inst66Quest11FQuest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst66Quest12_HORDE = Inst66Quest12
Inst66Quest12_HORDE_Level = Inst66Quest12_Level
Inst66Quest12_HORDE_Attain = Inst66Quest12_Attain
Inst66Quest12_HORDE_Aim = Inst66Quest12_Aim
Inst66Quest12_HORDE_Location = Inst66Quest12_Location
Inst66Quest12_HORDE_Note = Inst66Quest12_Note
Inst66Quest12_HORDE_Prequest = Inst66Quest12_Prequest
Inst66Quest12_HORDE_Folgequest = Inst66Quest12_Folgequest
Inst66Quest12FQuest_HORDE = Inst66Quest12FQuest
--
Inst66Quest12name1_HORDE = Inst66Quest12name1

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst66Quest13_HORDE = Inst66Quest13
Inst66Quest13_HORDE_Level = Inst66Quest13_Level
Inst66Quest13_HORDE_Attain = Inst66Quest13_Attain
Inst66Quest13_HORDE_Aim = Inst66Quest13_Aim
Inst66Quest13_HORDE_Location = Inst66Quest13_Location
Inst66Quest13_HORDE_Note = Inst66Quest13_Note
Inst66Quest13_HORDE_Prequest = Inst66Quest13_Prequest
Inst66Quest13_HORDE_Folgequest = Inst66Quest13_Folgequest
Inst66Quest13PreQuest_HORDE = Inst66Quest13PreQuest
Inst66Quest13FQuest_HORDE = Inst66Quest13FQuest
--
Inst66Quest13name1_HORDE = Inst66Quest13name1
Inst66Quest13name2_HORDE = Inst66Quest13name2
Inst66Quest13name3_HORDE = Inst66Quest13name3
Inst66Quest13name4_HORDE = Inst66Quest13name4



----
end
----



---------------------------
--- AQ Instance Numbers ---
---------------------------

-- 1  = Deadmines (VC)
-- 2  = Wailing Caverns (WC)
-- 3  = Ragefire Chasm (RFC)
-- 4  = Uldaman (ULD)
-- 5  = Blackrock Depths (BRD)
-- 6  = Blackwing Lair (BWL)
-- 7  = Blackfathom Deeps (BFD)
-- 8  = Lower Blackrock Spire (LBRS)
-- 9  = Upper Blackrock Spire (UBRS)
-- 10 = Dire Maul East (DM)
-- 11 = Dire Maul North (DM)
-- 12 = Dire Maul West (DM)
-- 13 = Maraudon (Mara)
-- 14 = Molten Core (MC)
-- 15 = Naxxramas (Naxx)
-- 16 = Onyxia's Lair (Ony)
-- 17 = Razorfen Downs (RFD)
-- 18 = Razorfen Kraul (RFK)
-- 19 = SM: Library (SM Lib)
-- 20 = Scholomance (Scholo)
-- 21 = Shadowfang Keep (SFK)
-- 22 = Stratholme (Strat)
-- 23 = The Ruins of Ahn'Qiraj (AQ20)
-- 24 = The Stockade (Stocks)
-- 25 = Sunken Temple (ST)
-- 26 = The Temple of Ahn'Qiraj (AQ40)
-- 27 = Zul'Farrak (ZF)
-- 28 = Zul'Gurub (ZG)
-- 29 = Gnomeregan (Gnomer)
-- 30 = Four Dragons
-- 31 = Azuregos
-- 32 = Highlord Kruul
-- 33 = Alterac Valley (AV)
-- 34 = Arathi Basin (AB)
-- 35 = Warsong Gulch (WSG)
-- 36 =  default "rest"
-- 37 = HFC: Ramparts (Ramp)
-- 38 = HFC: Blood Furnace (BF)
-- 39 = HFC: Shattered Halls (SH)
-- 40 = HFC: Magtheridon's Lair
-- 41 = CR: The Slave Pens (SP)
-- 42 = CR: The Steamvault (SV)
-- 43 = CR: The Underbog (UB)
-- 44 = Auchindoun: Auchenai Crypts (AC)
-- 45 = Auchindoun: Mana Tombs (MT)
-- 46 = Auchindoun: Sethekk Halls (Seth)
-- 47 = Auchindoun: Shadow Labyrinth (SLabs)
-- 48 = CR: Serpentshrine Cavern (SSC)
-- 49 = CoT: Black Morass (BM)
-- 50 = CoT: Battle of Mount Hyjal
-- 51 = CoT: Old Hillsbrad
-- 52 = Gruul's Lair (GL)
-- 53 = Karazhan (Kara)
-- 54 = TK: Arcatraz (Arc)
-- 55 = TK: Botanica (Bot)
-- 56 = TK: Mechanar (Mech)
-- 57 = SM: Armory (SM Arm)
-- 58 = SM: Cathedral (SM Cath)
-- 59 = SM: Graveyard (SM GY)
-- 60 = Eye of the Storm
-- 61 = TK: The Eye
-- 62 = Black Temple (BT)
-- 63 = Zul'Aman (ZA)
-- 64 = Doom Lord Kazzak
-- 65 = Doomwalker
-- 66 = Skettis
-- 67 = Magisters' Terrace
-- 68 = Sunwell Plateau
