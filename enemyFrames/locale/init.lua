local f = CreateFrame('Frame', 'enemyFrames')

f.L = setmetatable({}, {__index = function(t, k)
	local v = tostring(k)
	rawset(t, k, v)
	return v
end})

-- [ GetCaptures ]
-- Returns the indexes of a given regex pattern
-- 'pat'        [string]         unformatted pattern
-- returns:     [numbers]        capture indexes
local capture_cache = {}
function f:GetCaptures(pat)
  local r = capture_cache
  if not r[pat] then
    for a, b, c, d, e, f, g, h, i in string.gfind(gsub(pat, "%((.+)%)", "%1"), gsub(pat, "%d%$", "%%(.-)$")) do
      r[pat] = { a, b, c, d, e, f, g, h, i}
    end
  end

  if not r[pat] then return nil, nil, nil, nil, nil, nil, nil, nil, nil end
  return r[pat][1], r[pat][2], r[pat][3], r[pat][4], r[pat][5], r[pat][6], r[pat][7], r[pat][8], r[pat][9]
end

-- [ SanitizePattern ]
-- Sanitizes and convert patterns into gfind compatible ones.
-- 'pattern'    [string]         unformatted pattern
-- returns:     [string]         simplified gfind compatible pattern
local sanitize_cache = {}
function f:SanitizePattern(pattern)
  if not sanitize_cache[pattern] then
    local ret = pattern
    -- escape brackets
    ret = gsub(ret, "%((.+)%)", "%%(%1%%)")
    -- remove capture indexes
    ret = gsub(ret, "%d%$","")
    -- catch all characters
    ret = gsub(ret, "%%%a","(.+)")
    sanitize_cache[pattern] = ret
  end
  return sanitize_cache[pattern]
end

-- [ cmatch ]
-- Same as string.match but aware of capture indexes (up to 5)
-- 'str'        [string]         input string that should be matched
-- 'pat'        [string]         unformatted pattern
-- returns:     [strings]        matched string in capture order
function f:cmatch(str, pat)
  -- read capture indexes
  local a,b,c,d,e,f,g,h,i = self:GetCaptures(pat)

  for va, vb, vc, vd, ve, vf, vg, vh, vi in string.gfind(str, self:SanitizePattern(pat)) do
    -- initialize return values
    local ra, rb, rc, rd, re, rf, rg, rh, ri

    -- put entries into the proper return values
    ra = i == "1" and vi or h == "1" and vh or g == "1" and vg or f == "1" and vf or e == "1" and ve or d == "1" and vd or c == "1" and vc or b == "1" and vb or va
    rb = i == "2" and vi or h == "2" and vh or g == "2" and vg or f == "2" and vf or e == "2" and ve or d == "2" and vd or c == "2" and vc or a == "2" and va or vb
    rc = i == "3" and vi or h == "3" and vh or g == "3" and vg or f == "3" and vf or e == "3" and ve or d == "3" and vd or a == "3" and va or b == "3" and vb or vc
    rd = i == "4" and vi or h == "4" and vh or g == "4" and vg or f == "4" and vf or e == "4" and ve or a == "4" and va or b == "4" and vb or c == "4" and vc or vd
    re = i == "5" and vi or h == "5" and vh or g == "5" and vg or f == "5" and vf or a == "5" and va or b == "5" and vb or c == "5" and vc or d == "5" and vd or ve
    rf = i == "6" and vi or h == "6" and vh or g == "6" and vg or a == "6" and va or b == "6" and vb or c == "6" and vc or d == "6" and vd or e == "6" and ve or vf
    rg = i == "7" and vi or h == "7" and vh or a == "7" and va or b == "7" and vb or c == "7" and vc or d == "7" and vd or e == "7" and ve or f == "7" and vf or vg
    rh = i == "8" and vi or a == "8" and va or b == "8" and vb or c == "8" and vc or d == "8" and vd or e == "8" and ve or f == "8" and vf or g == "8" and vg or vh
    ri = a == "9" and va or b == "9" and vb or c == "9" and vc or d == "9" and vd or e == "9" and ve or f == "9" and vf or g == "9" and vg or h == "9" and vh or vi
    return ra, rb, rc, rd, re, rf, rg, rh, ri
  end
end

local LOCALIZED_CLASS = {
	-- [enUS] = {ruRU, deDE, frFR, zhCN, zhTW, koKR, esES}
	["Warlock"] = {"Чернокнижник", "Hexenmeister", "Démoniste", "术士", "術士", "흑마법사", "Brujo"},
	["Warrior"] = {"Воин", "Krieger", "Guerrier", "战士", "戰士", "전사", "Guerrero"},
	["Hunter"] = {"Охотник", "Jäger", "Chasseur", "猎人", "獵人", "사냥꾼", "Cazador"},
	["Mage"] = {"Маг", "Magier", "Mage", "法师", "法師", "마법사", "Mago"},
	["Priest"] = {"Жрец", "Priester", "Prêtre", "牧师", "牧師", "사제", "Sacerdote"},
	["Druid"] = {"Друид", "Druide", "Druide", "德鲁伊", "德魯伊", "드루이드", "Druida"},
	["Paladin"] = {"Паладин", "Paladin", "Paladin", "圣骑士", "聖騎士", "성기사", "Paladín"},
	["Shaman"] = {"Шаман", "Schamane", "Chaman", "萨满祭司", "薩滿", "주술사", "Chamán"},
	["Rogue"] = {"Разбойник", "Schurke", "Voleur", "盗贼", "盜賊", "도적", "Pícaro"}
}

function f:GetEnglishClass(class)
	if GetLocale() == 'enUS' or GetLocale() == 'enGB' then return string.upper(class) end
	
	for eng_class, classes in pairs(LOCALIZED_CLASS) do
		for _, loc_class in pairs(classes) do
			if class == loc_class then
				return string.upper(eng_class)
			end
		end	
	end
	return
end

local LOCALIZED_RACE = {
	-- [enUS] = {ruRU, deDE, frFR, zhCN, zhTW, koKR, esES}
	["Human"] = {"Человек", "Mensch", "Humain", "人类", "人類", "인간", "Humano"},
	["NightElf"] = {"Ночной эльф", "Nachtelf", "Elfe de la nuit", "暗夜精灵", "夜精靈", "나이트 엘프", "Elfo de la noche"},
	["Dwarf"] = {"Дворф", "Zwerg", "Nain", "矮人", "矮人", "드워프", "Enano"},
	["Gnome"] = {"Гном", "Gnom", "Gnome", "侏儒", "地精", "노움", "Gnomo"},
	["Orc"] = {"Орк", "Orc", "Orc", "兽人", "獸人", "오크", "Orco"},
	["Tauren"] = {"Таурен", "Tauren", "Tauren", "牛头人", "牛頭人", "타우렌", "Tauren"},
	["Troll"] = {"Тролль", "Troll", "Troll", "巨魔", "食人妖", "트롤", "Trol"},
	["Scourge"] = {"Нежить", "Untoter", "Mort-vivant", "亡灵", "不死族", "언데드", "No-muerto"},
}

function f:GetEnglishRace(race)
	if GetLocale() == 'enUS' or GetLocale() == 'enGB' then race = race == 'Night Elf' and 'NightElf' or race return race end

	for eng_race, races in pairs(LOCALIZED_RACE) do
		for _, loc_race in pairs(races) do
			if race == loc_race then
				return eng_race
			end
		end	
	end
	return
end