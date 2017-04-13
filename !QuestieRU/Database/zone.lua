-- mapID, BCContinent, BCZone, VanillaC, VanillaZ
QuestieZones = {
  ["WorldMap"] = {1337, 1337, 0, 0},
  ["Azeroth"] = {-1, -1, -1, 2, 0},
  ["Kalimdor"] = {-1, -1, -1, 1, 0},
  ["Hinterlands"] = {42, 2, 24, 2, 5}, 
  ["Moonglade"] = {20, 1, 12, 1, 8},
  ["ThousandNeedles"] = {14, 1, 21, 1, 19},
  ["Winterspring"] = {19, 1, 24, 1, 5},
  ["Arathi"] = {39, 2, 2, 2, 13},
  ["EversongWoods"] = {41, 2, 11, -1, -1},
  ["Dustwallow"] = {10, 1, 9, 1, 13},
  ["Badlands"] = {27, 2, 3, 2, 2},
  ["Darkshore"] = {16, 1, 5, 1, 18},
  ["Ogrimmar"] = {1, 1, 14, 1, 10},
  ["Undercity"] = {45, 2, 26, 2, 15},
  ["Desolace"] = {4, 1, 7, 1, 12},
  ["Barrens"] = {11, 1, 19, 1, 15},
  ["Tanaris"] = {8, 1, 17, 1, 16},
  ["Stormwind"] = {36, 2, 21, 2, 24},
  ["Durotar"] = {7, 1, 8, 1, 4},
  ["Silithus"] = {5, 1, 15, 1, 14},
  ["SwampOfSorrows"] = {46, 2, 23, 2, 4},
  ["Darnassis"] = {21, 1, 6, 1, 3},
  ["Elwynn"] = {37, 2, 10, 2, 25},
  ["Stranglethorn"] = {38, 2, 22, 2, 21},
  ["EasternPlaguelands"] = {34, 2, 9, 2, 6},
  ["Duskwood"] = {31, 2, 8, 2, 20},
  ["WesternPlaguelands"] = {50, 2, 27, 2, 9},
  ["Westfall"] = {49, 2, 28, 2, 10},
  ["Ashenvale"] = {2, 1, 1, 1, 21},
  ["Teldrassil"] = {24, 1, 18, 1, 17},
  ["Redridge"] = {30, 2, 17, 2, 11},
  ["UngoroCrater"] = {18, 1, 23, 1, 7},
  ["Mulgore"] = {22, 1, 13, 1, 9},
  ["Ironforge"] = {25, 2, 14, 2, 19},
  ["Felwood"] = {13, 1, 10, 1, 11},
  ["Hilsbrad"] = {48, 2, 13, 2, 16},
  ["DeadwindPass"] = {47, 2, 6, 2, 14},
  ["BurningSteppes"] = {40, 2, 5, 2, 17},
  ["Tirisfal"] = {43, 2, 25, 2, 22},
  ["Wetlands"] = {51, 2, 29, 2, 3},
  ["SearingGorge"] = {32, 2, 18, 2, 23},
  ["BlastedLands"] = {33, 2, 4, 2, 7},
  ["Silverpine"] = {35, 2, 20, 2, 18},
  ["LochModan"] = {29, 2, 16, 2, 12},
  ["Feralas"] = {17, 1, 11, 1, 20},
  ["DunMorogh"] = {28, 2, 7, 2, 8},
  ["Alterac"] = {26, 2, 1, 2, 1},
  ["ThunderBluff"] = {23, 1, 22, 1, 2},
  ["Aszhara"] = {15, 1, 2, 1, 1},
  ["StonetalonMountains"] = {6, 1, 16, 1, 6},
  ["Kalimdor"] = {61, 1, 0, 1, 0},
  ["Azeroth"] = {62, 2, 0, 2, 0},
}
QuestieZoneIDLookup = {};
for k,v in pairs(QuestieZones) do
  -- must be non-linear array
  QuestieZoneIDLookup[v[1]] = v;
end
QuestieCZLookup = {};
for k,v in pairs(QuestieZones) do
	QuestieCZLookup[v[2] * 100 + v[3]] = v[1];
end
