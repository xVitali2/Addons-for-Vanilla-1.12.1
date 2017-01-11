

    local orig = {}

    function isNAN(v) return v ~= v end    -- NAN RECOGNITION

    function SecondsToTimeAbbrev(time, f)  -- AURA DURATION SUB
        local cv = tonumber(GetCVar'modAuraFormat')
        local h, m, s, text
        if time <= 0 then
            text = ''
        elseif time < 3600 and time > 60 then
            h = floor(time/3600)
            m = (cv == 1 or f ~= nil) and floor(mod(time, 3600)/60) or floor(mod(time, 3600)/60 + 1)
            s = mod(time, 60)
            text = (cv == 1 or f ~= nil) and format('|cffffffff%d|r:|cffffffff%02d|r', m, s) or format('|cffffffff%d|rm', m)
        elseif time < 60 then
            m = floor(time/60)
            s = mod(time, 60)
            text = m == 0 and format('|cffffffff%d|rs', s)
        else
            h = floor(time/3600 + 1)
            text = format('|cffffffff%d|rh', h)
        end
        return text
     end

     function AVAB_round(time)
         local m, s, text
         if time <= 0 then
             text = ''
         elseif time < 3600 and time > 60 then
             m = floor(mod(time, 3600)/60)
             s = mod(time, 60)
             text = s == 0 and format('|cffffffff%d|rm', m) or format('|cffffffff%d|rm |cffffffff%d|rs', m, s)
         else
             s = mod(time, 60)
             text = format('|cffffffff%d|rs', s)
         end
         return text
     end

     function decimal_round(n, dp)      -- ROUND TO 1 DECIMAL PLACE
         local shift = 10^(dp or 0)
         return math.floor(n*shift + .5)/shift
     end

     function true_format(v)            -- STATUS TEXT FORMATTING ie 1.5k, 2.3m
         if v > 1E7 then return (math.floor(v/1E6))..'m'
         elseif v > 1E6 then return (math.floor((v/1E6)*10)/10)..'m'
         elseif v > 1E4 then return (math.floor(v/1E3))..'k'
         elseif v > 1E3 then return (math.floor((v/1E3)*10)/10)..'k'
         else return v end
     end


    --
