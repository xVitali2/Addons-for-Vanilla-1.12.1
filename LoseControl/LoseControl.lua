local L = "LoseControl"
local CC      = "CC"
local Silence = "Silence"
local Disarm  = "Disarm"
local Root    = "Root"
local Snare   = "Snare"
local Immune  = "Immune"
local PvE     = "PvE"

local spellIds = {
	-- Druid
	["Bash"] = CC, -- Bash
	["Feral Charge Efect"] = Root, -- Feral Charge Efect
	["Hibernate"] = CC, -- Hibernate
	["Pounce"] = CC, -- Pounce
	["Entangling Roots"] = Root, -- Entangling Roots	
	-- Hunter
	["Freezing Trap"] = CC, -- Freezing Trap
	["Intimidation"] = CC, -- Intimidation
	["Scare Beast"] = CC, -- Scare Beast
	["Scatter Shot"] = CC, -- Scatter Shot
	["Wyvern Sting"] = CC, -- Wyvern Sting; requires a hack to be removed later
	-- Mage
	["Frost Nova"] = Root, -- Frost Nova
	["Polymorph"] = CC, -- Polymorph
	["Frostbite"] = Root, -- Frostbite
	["Freeze"] = Root, -- Freeze
	["Cone of Cold"] = Snare, -- Cone of Cold	
	["Counterspell - Silenced"] = Silence, -- Counterspell - Silenced
	-- Paladin
	["Hammer of Justice"] = CC, -- Hammer of Justice
	["Repentance"] = CC, -- Repentance
	-- Priest
	["Mind Control"] = CC, -- Mind Control
	["Psychic Scream"] = CC, -- Psychic Scream
	["Silence"] = Silence, -- Silence
	-- Rogue
	["Blind"] = CC, -- Blind
	["Cheap Shot"] = CC, -- Cheap Shot
	["Gouge"] = CC, -- Gouge
	["Kidney Shot"] = CC, -- Kidney shot; the buff is 30621
	["Sap"] = CC, -- Sap
	-- Warlock
	["Death Coil"] = CC, -- Death Coil
	["Fear"] = CC, -- Fear
	["Howl of Terror"] = CC, -- Howl of Terror
	["Seduction"] = CC, -- Seduction
	-- Warrior
	["Charge Stun"] = CC, -- Charge Stun
	["Intercept Stun"] = CC, -- Intercept Stun
	["Intimidating Shout"] = CC, -- Intimidating Shout
	["Piercing Howl"] = Snare, -- Piercing Howl
	
	-- other
	["War Stomp"] = CC, -- War Stomp
	["Ice Blast"] = CC -- Ice Yeti
}

function LCPlayer_OnLoad()	
	this:SetHeight(50)
	this:SetWidth(50)
	this:SetPoint("CENTER", 0, 0)
	this:RegisterEvent("UNIT_AURA")
	this:RegisterEvent("PLAYER_AURAS_CHANGED")

	this.texture = this:CreateTexture(this, "BACKGROUND")
	this.texture:SetAllPoints(this)
	this.cooldown = CreateFrame("Model", "Cooldown", this, "CooldownFrameTemplate")
	this.cooldown:SetAllPoints(this) 
	this.maxExpirationTime = 0
	this:Hide()
end

function LCPlayer_OnEvent()
	local spellFound = false
	for i=1, 16 do -- 16 is enough due to HARMFUL filter
		local texture = UnitDebuff("player", i)
		LCTooltip:ClearLines()
		LCTooltip:SetUnitDebuff("player", i)
		local buffName = LCTooltipTextLeft1:GetText()
		
		if spellIds[buffName] then
			spellFound = true
			for j=0, 31 do
				local buffTexture = GetPlayerBuffTexture(j)
				if texture == buffTexture then
					local expirationTime = GetPlayerBuffTimeLeft(j)
					this:Show()
					this.texture:SetTexture(buffTexture)
					this.cooldown:SetModelScale(1)
					if this.maxExpirationTime <= expirationTime then
						CooldownFrame_SetTimer(this.cooldown, GetTime(), expirationTime, 1)
						this.maxExpirationTime = expirationTime
					end
					return
				end
			end		
		end
	end
	if spellFound == false then
		this.maxExpirationTime = 0
		this:Hide()
	end
end

function LCTarget_OnLoad()
	
end

function LCTarget_OnEvent()
	
end