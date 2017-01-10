-------------------------------------------------------------------------------------
-- Title: Mik's Scrolling Battle Text
-- Author: Mik
-- Maintainer: Athene
-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
-- Public Constants.
-------------------------------------------------------------------------------------

-- Display types for incoming, outgoing, and notification events.
MikSBT.DISPLAYTYPE_INCOMING			= 1;
MikSBT.DISPLAYTYPE_OUTGOING			= 2;
MikSBT.DISPLAYTYPE_NOTIFICATION		= 3;


-------------------------------------------------------------------------------------
-- Public Variables.
-------------------------------------------------------------------------------------

-- Holds the current profile.
MikSBT.CurrentProfile = nil;


-------------------------------------------------------------------------------------
-- Private constants.
-------------------------------------------------------------------------------------

-- cache des icones trouvées par l'algo et des icones qu'il ne trouverait pas
if not ICON_CACHE then
	ICON_CACHE = {}
end
ICON_CACHE["repousser au loin"] =				"Interface\\Icons\\Inv_Gauntlets_05"
ICON_CACHE["rupture du sol"] =					"Interface\\Icons\\Spell_Nature_Earthquake"
ICON_CACHE["rayon de l'oeil"] =					"Interface\\Icons\\Spell_Nature_Callstorm"
ICON_CACHE["salve de traits de l'ombre"] =		"Interface\\Icons\\Spell_Shadow_Shadowbolt"
ICON_CACHE["tempête d'ombre"] =					"Interface\\Icons\\spell_shadow_shadowbolt"
ICON_CACHE["gaz"] =								"Interface\\Icons\\Spell_Nature_Abolishmagic"
ICON_CACHE["décimer"] =							"Interface\\Icons\\Inv_Shield_01"
ICON_CACHE["champ statique"] =					"Interface\\Icons\\Spell_Nature_WispHeal"
ICON_CACHE["horion"] =							"Interface\\Icons\\Spell_Nature_WispHeal"
ICON_CACHE["secousse"] =						"Interface\\Icons\\spell_nature_earthquake"
ICON_CACHE["charge de bouclier"] =				"Interface\\Icons\\ability_warrior_charge"
ICON_CACHE["eclair des arcanes"] =				"Interface\\Icons\\spell_arcane_starfire"
ICON_CACHE["gémissement des âmes"] =			"Interface\\Icons\\spell_nature_lightning"
ICON_CACHE["trait noir"] =						"Interface\\Icons\\spell_shadow_shadowbolt"
ICON_CACHE["infusion de mana"] =				"Interface\\Icons\\inv_trinket_naxxramas01"
ICON_CACHE["afflux"] =							"Interface\\Icons\\Ability_Warrior_Charge"
ICON_CACHE["frappe"] =							"Interface\\Icons\\Ability_Rogue_Ambush"
ICON_CACHE["souffle de lave"] =					"Interface\\Icons\\Spell_Fire_WindsOfWoe"
ICON_CACHE["frappe des ailes"] =				"Interface\\Icons\\Inv_Misc_Monsterscales_14"
ICON_CACHE["lance de flammes"] =				"Interface\\Icons\\Ability_Throw"
ICON_CACHE["horion de l'ombre"] =				"Interface\\Icons\\Spell_Shadow_Shadowbolt"
ICON_CACHE["explosion de lave"] =				"Interface\\Icons\\Spell_Fire_Volcano"
ICON_CACHE["bouclier de lave"] =				"Interface\\Icons\\Spell_Fire_Immolation"
ICON_CACHE["fleur de feu"] =					"Interface\\Icons\\Spell_Fire_Fireball02"
ICON_CACHE["bombe"] =							"Interface\\Icons\\Spell_Fire_Selfdestruct"
ICON_CACHE["explosion"] =						"Interface\\Icons\\Spell_Fire_Selfdestruct"
ICON_CACHE["colère de ragnaros"] =				"Interface\\Icons\\Spell_Fire_Soulburn"
ICON_CACHE["choc"] =							"Interface\\Icons\\Ability_Smash"
ICON_CACHE["secousse violente"] =				"Interface\\Icons\\Ability_Smash"
ICON_CACHE["nova de feu"] =						"Interface\\Icons\\Spell_Fire_SealOfFire"
ICON_CACHE["marque de détonation"] =			"Interface\\Icons\\spell_fire_selfdestruct"
ICON_CACHE["cône de feu"] =						"Interface\\Icons\\Spell_Fire_WindsOfWoe"
ICON_CACHE["volée de boules de feu"] =			"Interface\\Icons\\Spell_Fire_Flamebolt"
ICON_CACHE["vague de foudre"] =					"Interface\\Icons\\Spell_Nature_Chainlightning"
ICON_CACHE["coup de queue"] =					"Interface\\Icons\\Inv_Misc_MonsterScales_05"
ICON_CACHE["exploiter faiblesse"] =				"Interface\\Icons\\ability_backstab"
ICON_CACHE["lancer feu liquide"] =				"Interface\\Icons\\spell_fire_meteorstorm"
ICON_CACHE["poing de force"] =					"Interface\\Icons\\inv_gauntlets_31"
ICON_CACHE["uppercut"] =						"Interface\\Icons\\inv_gauntlets_31"
ICON_CACHE["sangsue"] =							"Interface\\Icons\\ability_racial_cannibalize"
ICON_CACHE["choc de feu"] =						"Interface\\Icons\\spell_fire_immolation"
ICON_CACHE["malédiction du sang"] =				"Interface\\Icons\\spell_shadow_ritualofsacrifice"
ICON_CACHE["brasier"] =							"Interface\\Icons\\spell_fire_incinerate"
ICON_CACHE["météore"] =							"Interface\\Icons\\spell_fire_meteorstorm"
ICON_CACHE["jet de poison"] =					"Interface\\Icons\\spell_nature_corrosivebreath"
ICON_CACHE["explosion d'ombre"] =				"Interface\\Icons\\spell_shadow_antishadow"
ICON_CACHE["voile de l'ombre"] =				"Interface\\Icons\\spell_shadow_gathershadows"
ICON_CACHE["nuée maléfique"] =					"Interface\\Icons\\spell_nature_abolishmagic"
ICON_CACHE["crachat empoisonné"] =				"Interface\\Icons\\spell_nature_corrosivebreath"
ICON_CACHE["piétiner"] =						"Interface\\Icons\\spell_nature_natureswrath"
ICON_CACHE["spores mutées"] =					"Interface\\Icons\\spell_nature_abolishmagic"
ICON_CACHE["heurtoir du vomisseur de bile"] =	"Interface\\Icons\\ability_devour"
ICON_CACHE["eruption"] =						"Interface\\Icons\\spell_fire_volcano"
ICON_CACHE["tempête de mana"] =					"Interface\\Icons\\spell_frost_icestorm"
ICON_CACHE["frappe sacrée"] =					"Interface\\Icons\\ability_thunderbolt"
ICON_CACHE["grondement du tonnerre"] =			"Interface\\Icons\\spell_nature_thunderclap"
ICON_CACHE["déflagration des arcanes"] =		"Interface\\Icons\\spell_shadow_deathpact"
ICON_CACHE["nuage pestilentiel"] =				"Interface\\Icons\\spell_nature_abolishmagic"
ICON_CACHE["régénération de mana"] =			"Interface\\Icons\\spell_nature_manaregentotem"
ICON_CACHE["potion de soins"] =					"Interface\\Icons\\inv_potion_54"
ICON_CACHE["restauration du mana"] =			"Interface\\Icons\\inv_potion_76"
ICON_CACHE["rune démoniaque"] =					"Interface\\Icons\\inv_misc_rune_04"
ICON_CACHE["rune ténébreuse"] =					"Interface\\Icons\\spell_shadow_sealofkings"
ICON_CACHE["absorption de magie"] =				"Interface\\Icons\\spell_nature_astralrecalgroup"
ICON_CACHE["gel"] =								"Interface\\Icons\\spell_frost_glacier"
ICON_CACHE["lésions cérébrales"] =				"Interface\\Icons\\ability_gouge"
ICON_CACHE["décharge électrique"] =				"Interface\\Icons\\spell_lightning_lightningbolt01"
ICON_CACHE["foudre"] =							"Interface\\Icons\\spell_lightning_lightningbolt01"
ICON_CACHE["enchantement flamboyant"] =			"Interface\\Icons\\spell_fire_selfdestruct"
ICON_CACHE["pierre de soins supérieure"] =		"Interface\\Icons\\inv_stone_04"
ICON_CACHE["pierre de soins mineure"] =			"Interface\\Icons\\inv_stone_04"
ICON_CACHE["pierre de soins inférieure"] =		"Interface\\Icons\\inv_stone_04"
ICON_CACHE["pierre de soins majeure"] =			"Interface\\Icons\\inv_stone_04"
ICON_CACHE["pierre de soins"] =					"Interface\\Icons\\inv_stone_04"
ICON_CACHE["capturer un esprit"] =				"Interface\\Icons\\Spell_Shadow_Haunting"
ICON_CACHE["récupération du mana"] =			"Interface\\Icons\\inv_misc_gem_ruby_01"
ICON_CACHE["maître des éléments"] =				"Interface\\Icons\\spell_fire_masterofelements"
ICON_CACHE["tribu zandalar"] =					"Interface\\Icons\\inv_misc_coin_08"
ICON_CACHE["crachat venimeux"] =				"Interface\\Icons\\spell_nature_corrosivebreath"
ICON_CACHE["morsure fatale"] =					"Interface\\Icons\\ability_backstab"
ICON_CACHE["explosion sonore"] =				"Interface\\Icons\\spell_shadow_teleport"
ICON_CACHE["flammes"] =							"Interface\\Icons\\spell_fire_fire"
ICON_CACHE["effet inferno"] =					"Interface\\Icons\\spell_fire_incinerate"


-- Cache des spells dont l'icone n'a pas été trouvée
NO_ICON_CACHE = {}

-- Babble-Spell pour les icones des spells de classe
local BS = AceLibrary("Babble-Spell-2.2")

-- Number of font strings.
local NUM_FONT_STRINGS = 20;

-- Animation values for incoming and outgoing events.
local MIN_VERTICAL_SPACING = 8;

-- How long to wait before showing events so that merges may happen.
local MERGE_DELAY_TIME = 0.3;

-- How long to show stickies before they are faded.
local STICKY_FADE_IN_TIME = 0.15;
local STICKY_DISPLAY_TIME = 2;
local STICKY_FADE_OUT_TIME = 0.5;

-- The animation speed.
local ANIMATION_SPEED = 0.02;

-- Scroll directions
local SCROLL_DIRECTION_UP			= 1;
local SCROLL_DIRECTION_DOWN			= 2;

-- Animation Styles
local ANIMATION_STYLE_STRAIGHT		= 1;
local ANIMATION_STYLE_LEFT_PARABOLA		= 2;
local ANIMATION_STYLE_RIGHT_PARABOLA	= 3;

-- Max number of combo points.
local MAX_COMBO_POINTS = 5;


-------------------------------------------------------------------------------------
-- Private variables.
-------------------------------------------------------------------------------------

-- Holds whether or not debugging is active.
local debugMode = false;


-- Holds the events the mod is interested in.
local listenEvents = {};

-- Holds data for each scroll area.
local scrollAreas = {};

-- Holds arrays of unmerged events, merged events to be displayed and the time since
-- the last merge for incoming and outgoing events.
local animationMergeData = {
 ["Incoming"]	= {["TimeSinceMerge"] = 0, UnmergedEvents={}, MergedEvents={}},
 ["Outgoing"]	= {["TimeSinceMerge"] = 0, UnmergedEvents={}, MergedEvents={}},
};

-- Holds whether or not a merge is still being processed.
local stillMerging = false;

-- Temp arrays for repositioning animation display data to avoid overlaps.
local activeNonStickies = {};
local activeStickies = {};

-- Create a new table recycler object that holds up to 40 table references
-- in primary cache.
local eventsRecycler = MikTRO:NewRecyclerObject(40);


-------------------------------------------------------------------------------------
-- Printing functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Prints out the passed message to the default chat frame.
-- **********************************************************************************
function MikSBT.Print(msg, r, g, b)
 -- Add the message to the default chat frame.
 DEFAULT_CHAT_FRAME:AddMessage("MSBT: " .. msg, r, g, b);
end


-- **********************************************************************************
-- Prints out the passed message to the default chat frame.
-- **********************************************************************************
function MikSBT.PrintDebug(msg, r, g, b)
 -- Check if debugging is active.
 if (debugMode) then
  -- Add the message to the default chat frame.
  DEFAULT_CHAT_FRAME:AddMessage(msg, r, g, b);
 end
end


-------------------------------------------------------------------------------------
-- Core event handlers.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Registers all of the core events the mod is interested in.
-- **********************************************************************************
function MikSBT.RegisterEvents()
 -- Register the events we are interested in receiving for shaman.
 for k, v in listenEvents do
  MSBTEventFrame:RegisterEvent(v);
 end
end


-- **********************************************************************************
-- Unregisters all of the events the mod registered for.
-- **********************************************************************************
function MikSBT.UnregisterEvents()
 for k, v in listenEvents do
  MSBTEventFrame:UnregisterEvent(v);
 end
end


-- **********************************************************************************
-- Called when the mod is loaded.
-- **********************************************************************************
function MikSBT.OnLoad()
 -- Register for the ADDON_LOADED event.
 MSBTEventFrame:RegisterEvent("ADDON_LOADED");
 MSBTEventFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
end

-- **********************************************************************************
-- Called when the events we registered for occur.
-- **********************************************************************************
function MikSBT.OnEvent()
 -- When an addon is loaded.
 if (event == "ADDON_LOADED") then
 
  -- Set Game Damage font
 if MikSBT_Save and MikSBT_Save.Profiles[MikSBT_Save.CurrentProfile].BlizzardFontSettings then
	DAMAGE_TEXT_FONT = MikSBT.AVAILABLE_FONTS[MikSBT_Save.Profiles[MikSBT_Save.CurrentProfile].BlizzardFontSettings.Normal.FontIndex].Path or "Fonts\\FRIZQT__.TTF"
 end
 
  -- Make sure it's this addon.
  if (arg1 == MikSBT.MOD_NAME) then

   -- Register for the events the helper is interested in receiving.
   MikSBT.RegisterEvents();

   -- Initialize the mod.
   MikSBT.Init();
  end

 end
 
 if (event == "PLAYER_ENTERING_WORLD") then
	this:UnregisterEvent("ADDON_LOADED");
	this:UnregisterEvent("PLAYER_ENTERING_WORLD");
 end
end


-- **********************************************************************************
-- Called when the core events frame is updated.
-- **********************************************************************************
function MikSBT.OnUpdate()

 -- Loop through all of the merge data tables.
 for _, mergeData in animationMergeData do
  -- Add the elapsed time since the last merge.
  mergeData.TimeSinceMerge = mergeData.TimeSinceMerge + arg1;

  -- Once enough time has passed and all previous merges are done.
  if ((mergeData.TimeSinceMerge >= MERGE_DELAY_TIME) and not stillMerging) then
   -- Set the still merging flag.
   stillMerging = true;

   -- Merge like events.
   local numEvents = table.getn(mergeData.UnmergedEvents);
   MikSBT.MergeEvents(mergeData, numEvents);

   -- Add the merged animation events to the animation system.
   for _, animationEvent in mergeData.MergedEvents do
    MikSBT.AddAnimation(animationEvent);
   end

   -- Clear the merged animation events array.
   local numMergedEvents = table.getn(mergeData.MergedEvents);
   for i = 1, numMergedEvents do
    table.remove(mergeData.MergedEvents, 1);
   end


   -- Reset the last merged time.
   mergeData.TimeSinceMerge = 0;

   -- Clear the still merging flag.
   stillMerging = false;
  end
 end
end


-- **********************************************************************************
-- Called when the mod's animation frames are updated.
-- **********************************************************************************
function MikSBT.OnUpdateAnimationFrame(frame)
 local scrollArea;

 -- Get the frame's name.
 local frameName = frame:GetName();
 if (frameName == scrollAreas.Incoming.AssociatedFrame) then
  scrollArea = scrollAreas.Incoming;
 elseif (frameName == scrollAreas.Outgoing.AssociatedFrame) then
  scrollArea = scrollAreas.Outgoing;
 elseif (frameName == scrollAreas.Notification.AssociatedFrame) then
  scrollArea = scrollAreas.Notification;
 end

 -- Flag for whether or not all the animations are inactive.
 local allInactive = true;

 -- Loop through all possible animation display objects for the scroll area.
 for _, animDisplayInfo in scrollArea.AnimationDisplayArray do
  -- Check if the animation is active.
  if (animDisplayInfo.IsActive) then
   -- Do the animation and clear the all inactive flag.
   MikSBT.DoAnimation(animDisplayInfo, scrollArea);
   allInactive = false;
  end
 end

 -- Check if none of the animations are active and the events frame is visible.  If so, hide it so
 -- the OnUpdate events stop firing.  This is done to keep the number of OnUpdate events down to a minimum for
 -- better performance.
 if (allInactive and frame:IsVisible()) then
  frame:Hide();
 end
end


-- **********************************************************************************
-- Called when the mod is fully loaded (variables loaded).
-- **********************************************************************************
function MikSBT.Init()
 -- Register slash commands
 SLASH_MSBT1 = MikSBT.COMMAND;
 SlashCmdList["MSBT"] = function (params)
  MikSBT.CommandHandler(params);
 end

 -- Check if there are no saved variables.
 if (not MikSBT_Save or not MikSBT_Save.Profiles) then
  MikSBT_Save = {};

  MikSBT_Save.UserDisabled = false;
  MikSBT_Save.CurrentProfile = MikSBT.DEFAULT_PROFILE_NAME;
  MikSBT_Save.Profiles = {};
  MikSBT_Save.Profiles[MikSBT_Save.CurrentProfile] = {};

  -- Set all the options to their defaults.
  MikSBT.ResetProfile(MikSBT_Save.CurrentProfile);
 end

 -- Updates profiles created by older versions.
 MikSBT.UpdateProfiles();

 -- Set the current profile.
 MikSBT.CurrentProfile = MikSBT_Save.Profiles[MikSBT_Save.CurrentProfile];

 -- Sets up all of the animation scroll areas.
 MikSBT.SetupAnimationScrollAreas();

 -- Reposition the animation frames to the stored offsets.
 MikSBT.RepositionAnimationFrames();

 -- Register the triggers with the combat event helper.
 MikSBT.RegisterTriggers();

 -- Disable or enable the mod depending on the saved setting.
 MikSBT.SetOptionUserDisabled(MikSBT_Save.UserDisabled)
end


-- **********************************************************************************
-- Sets up all of the animation scroll areas.
-- **********************************************************************************
function MikSBT.SetupAnimationScrollAreas()
 -- Setup a table for data for each scroll area.
 scrollAreas.Incoming = {};
 scrollAreas.Outgoing = {};
 scrollAreas.Notification = {};

 -- Setup the associated frames.
 scrollAreas.Incoming.AssociatedFrame = "MSBTFrameIncoming";
 scrollAreas.Outgoing.AssociatedFrame = "MSBTFrameOutgoing";
 scrollAreas.Notification.AssociatedFrame = "MSBTFrameNotification";

 -- Setup the display settings.
 scrollAreas.Incoming.DisplaySettings = MikSBT.CurrentProfile.DisplaySettings.Incoming;
 scrollAreas.Outgoing.DisplaySettings = MikSBT.CurrentProfile.DisplaySettings.Outgoing;
 scrollAreas.Notification.DisplaySettings = MikSBT.CurrentProfile.DisplaySettings.Notification;


 -- Loop through the scroll areas.
 for _, scrollArea in scrollAreas do
  -- Initialize the next available animation display object.
  scrollArea.NextAnimationDisplay = 1;

  -- Initialize the next available sticky animation display object.
  scrollArea.FirstSticky = 11;
  scrollArea.NextSticky = scrollArea.FirstSticky;

  -- Create arrays for the animation display info.
  scrollArea.AnimationDisplayArray = {};

  -- Associate the appropriate font string object for each animation display object.
  for x = 1, NUM_FONT_STRINGS do
   scrollArea.AnimationDisplayArray[x] = {};
   scrollArea.AnimationDisplayArray[x].FontObject = getglobal(scrollArea.AssociatedFrame .. "Text" .. x);
   scrollArea.AnimationDisplayArray[x].LastUpdated = 0;
  end
 end
end


-- **********************************************************************************
-- Repositions the animation frames based on the stored offsets.
-- **********************************************************************************
function MikSBT.RepositionAnimationFrames()
 -- Loop through each scroll area and reposition its associated frame.
 for _, scrollArea in scrollAreas do
  getglobal(scrollArea.AssociatedFrame):SetPoint("BOTTOM", "UIParent", "CENTER", scrollArea.DisplaySettings.FrameOffsets.x, scrollArea.DisplaySettings.FrameOffsets.y);
 end
end


-- **********************************************************************************
-- Receive combat events from Mik's combat event helper.
-- **********************************************************************************
function MikSBT.CombatEventsHandler(combatEvent)
 -- Get a recycled table from the events recycler object.
 local animationEvent = eventsRecycler:AcquireTable();

 -- Initalize the event type string to the common prefix.
 local eventTypeString = "MSBT_EVENTTYPE_";

 -- Append the appropriate direction type to the event type string.
 if (combatEvent.DirectionType == MikCEH.DIRECTIONTYPE_PLAYER_INCOMING) then
  animationEvent.ScrollArea = scrollAreas.Incoming;
  eventTypeString = eventTypeString .. "INCOMING_";
 elseif (combatEvent.DirectionType == MikCEH.DIRECTIONTYPE_PLAYER_OUTGOING) then
  animationEvent.ScrollArea = scrollAreas.Outgoing;
  eventTypeString = eventTypeString .. "OUTGOING_";
 elseif (combatEvent.DirectionType == MikCEH.DIRECTIONTYPE_PET_OUTGOING) then
  animationEvent.ScrollArea = scrollAreas.Outgoing;
  eventTypeString = eventTypeString .. "OUTGOING_PET_";
 elseif (combatEvent.DirectionType == MikCEH.DIRECTIONTYPE_PET_INCOMING) then
  animationEvent.ScrollArea = scrollAreas.Incoming;
  eventTypeString = eventTypeString .. "INCOMING_PET_";
 end

 -- Check if it's a damage event.
 if (combatEvent.EventType == MikCEH.EVENTTYPE_DAMAGE) then
  -- Check if there is an associated spell/ability name.
  if (combatEvent.EffectName ~= nil) then
   eventTypeString = eventTypeString .. "SPELL_";
  end

  -- Append the appropriate action type to the event type string.
  if (combatEvent.ActionType == MikCEH.ACTIONTYPE_HIT) then
   if (combatEvent.HitType == MikCEH.HITTYPE_OVER_TIME) then
    eventTypeString = eventTypeString .. "DOT";
   else
    eventTypeString = eventTypeString .. "DAMAGE";
   end
  elseif (combatEvent.ActionType == MikCEH.ACTIONTYPE_MISS) then
   eventTypeString = eventTypeString .. "MISS";
  elseif (combatEvent.ActionType == MikCEH.ACTIONTYPE_DODGE) then
   eventTypeString = eventTypeString .. "DODGE";
  elseif (combatEvent.ActionType == MikCEH.ACTIONTYPE_PARRY) then
   eventTypeString = eventTypeString .. "PARRY";
  elseif (combatEvent.ActionType == MikCEH.ACTIONTYPE_BLOCK) then
   eventTypeString = eventTypeString .. "BLOCK";
  elseif (combatEvent.ActionType == MikCEH.ACTIONTYPE_RESIST) then
   eventTypeString = eventTypeString .. "RESIST";
  elseif (combatEvent.ActionType == MikCEH.ACTIONTYPE_ABSORB) then
   eventTypeString = eventTypeString .. "ABSORB";
  elseif (combatEvent.ActionType == MikCEH.ACTIONTYPE_IMMUNE) then
   eventTypeString = eventTypeString .. "IMMUNE";
  elseif (combatEvent.ActionType == MikCEH.ACTIONTYPE_EVADE) then
   eventTypeString = eventTypeString .. "EVADE";
  elseif (combatEvent.ActionType == MikCEH.ACTIONTYPE_REFLECT) then
   eventTypeString = eventTypeString .. "REFLECT";
  elseif (combatEvent.ActionType == MikCEH.ACTIONTYPE_DROWNING) then
   eventTypeString = eventTypeString .. "ENVIRONMENTAL"
   combatEvent.EffectName = MikSBT.MSG_ENVIRONMENTAL_DROWNING;
  elseif (combatEvent.ActionType == MikCEH.ACTIONTYPE_FALLING) then
   eventTypeString = eventTypeString .. "ENVIRONMENTAL"
   combatEvent.EffectName = MikSBT.MSG_ENVIRONMENTAL_FALLING;
  elseif (combatEvent.ActionType == MikCEH.ACTIONTYPE_FATIGUE) then
   eventTypeString = eventTypeString .. "ENVIRONMENTAL"
   combatEvent.EffectName = MikSBT.MSG_ENVIRONMENTAL_FATIGUE;
  elseif (combatEvent.ActionType == MikCEH.ACTIONTYPE_FIRE) then
   eventTypeString = eventTypeString .. "ENVIRONMENTAL"
   combatEvent.EffectName = MikSBT.MSG_ENVIRONMENTAL_FIRE;
  elseif (combatEvent.ActionType == MikCEH.ACTIONTYPE_LAVA) then
   eventTypeString = eventTypeString .. "ENVIRONMENTAL"
   combatEvent.EffectName = MikSBT.MSG_ENVIRONMENTAL_LAVA;
  elseif (combatEvent.ActionType == MikCEH.ACTIONTYPE_SLIME) then
   eventTypeString = eventTypeString .. "ENVIRONMENTAL"
   combatEvent.EffectName = MikSBT.MSG_ENVIRONMENTAL_SLIME;
  end

 -- Heal event.
 elseif (combatEvent.EventType == MikCEH.EVENTTYPE_HEAL) then
   if (combatEvent.HealType == MikCEH.HEALTYPE_NORMAL or combatEvent.HealType == MikCEH.HEALTYPE_CRIT) then
     eventTypeString = eventTypeString .. "HEAL";
   elseif (combatEvent.HealType == MikCEH.HEALTYPE_OVER_TIME) then
    eventTypeString = eventTypeString .. "HOT";
   end
    

 -- Notification event.
 elseif (combatEvent.EventType == MikCEH.EVENTTYPE_NOTIFICATION) then
  animationEvent.ScrollArea = scrollAreas.Notification;
  eventTypeString = eventTypeString .. "NOTIFICATION_";

  -- Append the appropriate notification type to the event type string.
  if (combatEvent.NotificationType == MikCEH.NOTIFICATIONTYPE_DEBUFF) then
   eventTypeString = eventTypeString .. "DEBUFF";
  elseif (combatEvent.NotificationType == MikCEH.NOTIFICATIONTYPE_BUFF) then
   eventTypeString = eventTypeString .. "BUFF";
  elseif (combatEvent.NotificationType == MikCEH.NOTIFICATIONTYPE_ITEM_BUFF) then
   eventTypeString = eventTypeString .. "ITEM_BUFF";
  elseif (combatEvent.NotificationType == MikCEH.NOTIFICATIONTYPE_BUFF_FADE) then
   eventTypeString = eventTypeString .. "BUFF_FADE";
  elseif (combatEvent.NotificationType == MikCEH.NOTIFICATIONTYPE_COMBAT_ENTER) then
   eventTypeString = eventTypeString .. "COMBAT_ENTER";
  elseif (combatEvent.NotificationType == MikCEH.NOTIFICATIONTYPE_COMBAT_LEAVE) then
   eventTypeString = eventTypeString .. "COMBAT_LEAVE";
  elseif (combatEvent.NotificationType == MikCEH.NOTIFICATIONTYPE_POWER_GAIN) then
   eventTypeString = eventTypeString .. "POWER_GAIN";
  elseif (combatEvent.NotificationType == MikCEH.NOTIFICATIONTYPE_POWER_LOSS) then
   eventTypeString = eventTypeString .. "POWER_LOSS";
  elseif (combatEvent.NotificationType == MikCEH.NOTIFICATIONTYPE_CP_GAIN) then
   -- Check if we are at max combo points.
   if (combatEvent.Amount == MAX_COMBO_POINTS) then
    eventTypeString = eventTypeString .. "CP_FULL";
   else
    eventTypeString = eventTypeString .. "CP_GAIN";
   end
  elseif (combatEvent.NotificationType == MikCEH.NOTIFICATIONTYPE_HONOR_GAIN) then
   eventTypeString = eventTypeString .. "HONOR_GAIN";
  elseif (combatEvent.NotificationType == MikCEH.NOTIFICATIONTYPE_REP_GAIN) then
   eventTypeString = eventTypeString .. "REP_GAIN";
  elseif (combatEvent.NotificationType == MikCEH.NOTIFICATIONTYPE_REP_LOSS) then
   eventTypeString = eventTypeString .. "REP_LOSS";
  elseif (combatEvent.NotificationType == MikCEH.NOTIFICATIONTYPE_SKILL_GAIN) then
   eventTypeString = eventTypeString .. "SKILL_GAIN";
  elseif (combatEvent.NotificationType == MikCEH.NOTIFICATIONTYPE_EXPERIENCE_GAIN) then
   eventTypeString = eventTypeString .. "EXPERIENCE_GAIN";
  elseif (combatEvent.NotificationType == MikCEH.NOTIFICATIONTYPE_PC_KILLING_BLOW) then
   eventTypeString = eventTypeString .. "PC_KILLING_BLOW";
  elseif (combatEvent.NotificationType == MikCEH.NOTIFICATIONTYPE_NPC_KILLING_BLOW) then
   eventTypeString = eventTypeString .. "NPC_KILLING_BLOW";
  elseif (combatEvent.NotificationType ~= nil) then
   eventTypeString = eventTypeString .. combatEvent.NotificationType;
  end
 end

 -- Check if the event is a crit and set the crit field appropriately
 if (combatEvent.HitType == MikCEH.HITTYPE_CRIT or combatEvent.HealType == MikCEH.HEALTYPE_CRIT) then
  animationEvent.IsCrit = true;
 end

 -- Copy the amount, effect name, and player/enemy name from the passed combat event data.
 -- if combatEvent.Amount then
 -- animationEvent.Amount = combatEvent.Amount * 420;
 -- else
  animationEvent.Amount = combatEvent.Amount;
 -- end
 animationEvent.EffectName = combatEvent.EffectName;
 animationEvent.Name = combatEvent.Name;

 -- Check if there is a damage type and get the appropriate string.
 if (combatEvent.DamageType ~= nil) then
  animationEvent.DamageType = MikCEH.GetDamageTypeString(combatEvent.DamageType);
 end
 
 -- If there are partial action types set the partial effect text appropriately.
 if (combatEvent.PartialActionType == MikCEH.PARTIALACTIONTYPE_ABSORB) then
  if (ABSORB_TRAILER) then
   animationEvent.PartialEffectText = "\124cffFAFA00\124h"..string.gsub(ABSORB_TRAILER, "%%d", combatEvent.PartialAmount).."\124h\124r";
  end
 elseif (combatEvent.PartialActionType == MikCEH.PARTIALACTIONTYPE_BLOCK) then
  if (BLOCK_TRAILER) then
   animationEvent.PartialEffectText = "\124cff7F00FF\124h"..string.gsub(BLOCK_TRAILER, "%%d", combatEvent.PartialAmount).."\124h\124r";
  end
 elseif (combatEvent.PartialActionType == MikCEH.PARTIALACTIONTYPE_RESIST) then
  if (RESIST_TRAILER) then
   animationEvent.PartialEffectText = " \124cff81007F\124h"..string.gsub(RESIST_TRAILER, "%%d", combatEvent.PartialAmount).."\124h\124r";
  end
 elseif (combatEvent.PartialActionType == MikCEH.PARTIALACTIONTYPE_VULNERABLE) then
  if (MikSBT.MSG_VULERNABLE_TRAILER) then
   animationEvent.PartialEffectText = string.gsub(MikSBT.MSG_VULERNABLE_TRAILER, "%%d", combatEvent.PartialAmount);
  end
 elseif (combatEvent.PartialActionType == MikCEH.PARTIALACTIONTYPE_CRUSHING) then
  if (CRUSHING_TRAILER) then
   animationEvent.PartialEffectText = "\124cff7D0000\124h"..CRUSHING_TRAILER.."\124h\124r";
  end
 elseif (combatEvent.PartialActionType == MikCEH.PARTIALACTIONTYPE_GLANCING) then
  if (GLANCING_TRAILER) then
   animationEvent.PartialEffectText = "\124cffFA0000\124h"..GLANCING_TRAILER.."\124h\124r";
  end
 elseif (combatEvent.PartialActionType == MikCEH.PARTIALACTIONTYPE_OVERHEAL) then
  animationEvent.OverhealAmount = combatEvent.PartialAmount;
 end



 -- Check if there is profile data for the event type.
 if (MikSBT.CurrentProfile.EventSettings[eventTypeString]) then
  -- Set the event type, the settings for it, its unformatted text and dispatch it to the animation system.
  animationEvent.EventType = eventTypeString;
  animationEvent.EventSettings = MikSBT.CurrentProfile.EventSettings[animationEvent.EventType];
  animationEvent.UnformattedText = animationEvent.EventSettings.Message;

  -- Dispatch the event to the animation system.
  MikSBT.DispatchAnimationEvent(animationEvent);
 else
  -- Print an error message and reclaim the animation event table to the table recycler.
  MikSBT.Print("No profile data found for " .. eventTypeString, 1, 0, 0)
  eventsRecycler:ReclaimTable(animationEvent);
 end
end



-- **********************************************************************************
-- Receive trigger events from Mik's trigger helper.
-- **********************************************************************************
function MikSBT.TriggerHandler(triggerEvent)
 -- Get a recycled table from the events recycler object.
 local animationEvent = eventsRecycler:AcquireTable();

 -- Check if the trigger require a stance
 if (MikSBT.CurrentProfile.Triggers[triggerEvent.TriggerKey].TriggerSettings.Stance) then
	local _,_,isActive = GetShapeshiftFormInfo(MikSBT.CurrentProfile.Triggers[triggerEvent.TriggerKey].TriggerSettings.Stance)
	if not isActive then
		-- Reclaim the animation event table to the table recycler.
		eventsRecycler:ReclaimTable(animationEvent);
		return
	end
 end
 
 -- Check if there is profile data for the trigger.
 if (MikSBT.CurrentProfile.Triggers[triggerEvent.TriggerKey].EventSettings) then
  -- Set the scroll area, event settings, and output text.
  animationEvent.ScrollArea = scrollAreas.Notification;
  animationEvent.EventSettings = MikSBT.CurrentProfile.Triggers[triggerEvent.TriggerKey].EventSettings;
  MikSBT.FormatTriggerText(animationEvent, triggerEvent);
  
  if (MikSBT.CurrentProfile.Triggers[triggerEvent.TriggerKey].Texture) then
	 animationEvent.Texture = MikSBT.CurrentProfile.Triggers[triggerEvent.TriggerKey].Texture
  end

  -- Dispatch the event to the animation system.
  MikSBT.DispatchAnimationEvent(animationEvent);
 else
  -- Print an error message and reclaim the animation event table to the table recycler.
  MikSBT.Print("No profile data found for trigger key " .. triggerEvent.TriggerKey, 1, 0, 0);
  eventsRecycler:ReclaimTable(animationEvent);  
 end
end


-------------------------------------------------------------------------------------
-- Utility functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- This function copies a table.
-- **********************************************************************************
function MikSBT.CopyTable(srcTable)
 -- Create a new table.
 local newTable = {};

 -- Loop through all of the entires in the table.
 for key, value in srcTable do
  -- Check if it's a nested table.
  if (type(value) == "table") then
   -- Recursively call the function to copy the nested table.
   value = MikSBT.CopyTable(value);
  end

  -- Make a copy of the value into the new table.
  newTable[key] = value;
 end

 -- Return the new table.
 return newTable;
end


-- **********************************************************************************
-- Merges like animation events.
-- **********************************************************************************
function MikSBT.MergeEvents(mergeData, numEvents)
 -- Hold whether or not the event was merged.
 local eventMerged = false;

 -- Don't attempt to merge any more events than were available when the function was called since
 -- more events may get added while the merge is taking place.
 for x = 1, numEvents do

  -- Loop through all of the events in the merged events array.
  for _, animationEvent in mergeData.MergedEvents do
   -- Check if the event types match and the effect names are the same.
   if ((mergeData.UnmergedEvents[x].EventType == animationEvent.EventType) and
       (mergeData.UnmergedEvents[x].EffectName == animationEvent.EffectName)) then

    -- Check if there is no effect name
    if (mergeData.UnmergedEvents[x].EffectName == nil) then
     -- Check if the affected unit name is the same.
     if ((mergeData.UnmergedEvents[x].Name == animationEvent.Name) and mergeData.UnmergedEvents[x].Name ~= nil) then
      -- Do Merge.
      eventMerged = true;
     end -- Same name.

    -- There is an effect name.
    else
     -- Check if there is a name and replace it with the multiple targets string.
     if (animationEvent.Name ~= nil) then
      animationEvent.Name = MikSBT.MSG_MULTIPLE_TARGETS;
     end

     -- Do Merge.
     eventMerged = true;
    end -- Effect name?
   end -- Event types match and effect names the same.


   -- Check if the event should be merged.
   if (eventMerged) then
    -- Set the event merged flag for the event being merged.
    mergeData.UnmergedEvents[x].EventMerged = true;

    -- If the events have an amount then total them.
    if (animationEvent.Amount ~= nil and mergeData.UnmergedEvents[x].Amount ~= nil) then
	 animationEvent.Amount = tonumber(animationEvent.Amount, 10)
		if animationEvent.Amount and type(animationEvent.Amount) == "number" and mergeData.UnmergedEvents[x].Amount then
			animationEvent.Amount = animationEvent.Amount + mergeData.UnmergedEvents[x].Amount;
		end
     -- animationEvent.Amount = animationEvent.Amount + mergeData.UnmergedEvents[x].Amount;
    end

    -- Check if there is an overheal amount and total it.
    if (mergeData.UnmergedEvents[x].OverhealAmount ~= nil) then
     animationEvent.OverhealAmount = (animationEvent.OverhealAmount or 0) + mergeData.UnmergedEvents[x].OverhealAmount;
    end

    -- Clear any partial effect text.
    animationEvent.PartialEffectText = nil;

    
    -- Increment the number of merged events.
    animationEvent.NumMerged = animationEvent.NumMerged + 1;

    -- Check if the event being merged is a crit and increment the number of crits.
    if (mergeData.UnmergedEvents[x].IsCrit) then
     animationEvent.NumCrits = animationEvent.NumCrits + 1;
    end

    -- Make sure the merged event is not flagged as a crit.
    animationEvent.IsCrit = false;
   end -- Do Merge.
  end -- Loop through all merged events.


  -- If the event wasn't merged add it to the end of the merged events array.
  if (not eventMerged) then
   local animationEvent = mergeData.UnmergedEvents[x];
   animationEvent.NumMerged = 0;

   -- Check if the event is a crit and set the number of crits appropriately.
   if (animationEvent.IsCrit) then
    animationEvent.NumCrits = 1;
   else
    animationEvent.NumCrits = 0;
   end

   -- Add the animation event to the end of the merged events array.
   table.insert(mergeData.MergedEvents, animationEvent);
  end

  -- Reset the event merged flag.
  eventMerged = false;
 end


 -- Loop through each event in the merged events array.
 for _, animationEvent in mergeData.MergedEvents do
  -- Check if there were any events merged.
  if (animationEvent.NumMerged > 0) then
   -- Create trailer text with the number of merged events.
   local trailerText = " [" .. 1 + animationEvent.NumMerged.. " " .. MikSBT.MSG_HITS;

   -- Check if there were any crits merged.
   if (animationEvent.NumCrits > 1) then
    trailerText = trailerText .. ", " .. animationEvent.NumCrits .. " " .. MikSBT.MSG_CRITS;
   elseif (animationEvent.NumCrits == 1) then
    trailerText = trailerText .. ", " .. animationEvent.NumCrits .. " " .. MikSBT.MSG_CRIT;
   end

   -- Close the merge string.
   trailerText = trailerText .. "]";

   -- Set the animation event's merge trailer text field.
   animationEvent.MergeTrailerText = trailerText;
  end
 end


 -- Remove the processed animation events from unmerged events queue.
 for x = 1, numEvents do
  -- Check if the event was merged into a different animation event.
  if (mergeData.UnmergedEvents[1].EventMerged) then
   -- Reclaim the animation event table to the events recycler.
   eventsRecycler:ReclaimTable(mergeData.UnmergedEvents[1]);
  end

  -- Remove the event from the unmerged events array.
  table.remove(mergeData.UnmergedEvents, 1);
 end
end


-- **********************************************************************************
-- This function gets the appropriate font size for an event.
-- **********************************************************************************
function MikSBT.GetFontSize(scrollArea, eventSettings, isCrit)
 -- Holds the font sizes for the event level.
 local eventFontSizeNormal = 0;
 local eventFontSizeCrit = 0;

 -- Check if there are event settings.
 if (eventSettings ~= nil) then
  -- Get the font sizes for the event type.
  eventFontSizeNormal = eventSettings.FontSettings.Normal.FontSize;

  -- Check if there are crit font settings for the event.
  if (eventSettings.FontSettings.Crit ~= nil) then
   eventFontSizeCrit = eventSettings.FontSettings.Crit.FontSize;
  end
 end

  -- Get the font sizes for the scroll area and master.
 local scrollAreaFontSizeNormal = scrollArea.DisplaySettings.FontSettings.Normal.FontSize;
 local scrollAreaFontSizeCrit = scrollArea.DisplaySettings.FontSettings.Crit.FontSize;
 local masterFontSizeNormal = MikSBT.CurrentProfile.MasterFontSettings.Normal.FontSize;
 local masterFontSizeCrit = MikSBT.CurrentProfile.MasterFontSettings.Crit.FontSize;


 -- Get the normal font size for the event.
 local fontSize = eventFontSizeNormal;

 -- Check if the font size is inherited from the scroll area font size.
 if (fontSize == 0) then
  fontSize = scrollAreaFontSizeNormal;
 end

 -- Check if the font size for the scroll area is inherited from the master font size.
 if (fontSize == 0) then
  fontSize = masterFontSizeNormal;
 end


 -- Check if the event is a crit.
 if (isCrit) then
  -- Get the crit font size for the event.
  fontSize = eventFontSizeCrit;

  -- Check if the font size is inherited from the scroll area font size.
  if (fontSize == 0) then
   fontSize = scrollAreaFontSizeCrit;
  end

  -- Check if the font size for the scroll area is inherited from the master font size.
  if (fontSize == 0) then
   fontSize = masterFontSizeCrit;
  end
 end

 -- Return the font size.
 return fontSize;
end


-- **********************************************************************************
-- This function gets the appropriate font path for an event.
-- **********************************************************************************
function MikSBT.GetFontPath(scrollArea, eventSettings, isCrit)
 -- Holds the font indices for the event level.
 local eventFontIndexNormal = 0;
 local eventFontIndexCrit = 0;

 -- Check if there are event settings.
 if (eventSettings ~= nil) then
  -- Get the font indices for the event type.
  eventFontIndexNormal = eventSettings.FontSettings.Normal.FontIndex;

  -- Check if there are crit font settings for the event.
  if (eventSettings.FontSettings.Crit ~= nil) then
   eventFontIndexCrit = eventSettings.FontSettings.Crit.FontIndex;
  end
 end

 -- Get the font indices for the scroll area and master.
 local scrollAreaFontIndexNormal = scrollArea.DisplaySettings.FontSettings.Normal.FontIndex;
 local scrollAreaFontIndexCrit = scrollArea.DisplaySettings.FontSettings.Crit.FontIndex;
 local masterFontIndexNormal = MikSBT.CurrentProfile.MasterFontSettings.Normal.FontIndex;
 local masterFontIndexCrit = MikSBT.CurrentProfile.MasterFontSettings.Crit.FontIndex;


 -- Get the normal font index for the event.
 local fontIndex = eventFontIndexNormal;

 -- Check if the font index is inherited from the scroll area font index.
 if (fontIndex == 0) then
  fontIndex = scrollAreaFontIndexNormal;
 end

 -- Check if the font index for the scroll area is inherited from the master font index.
 if (fontIndex == 0) then
  fontIndex = masterFontIndexNormal;
 end


 -- Check if the event is a crit.
 if (isCrit) then
  -- Get the crit font index for the event.
  fontIndex = eventFontIndexCrit;

  -- Check if the font index is inherited from the scroll area font index.
  if (fontIndex == 0) then
   fontIndex = scrollAreaFontIndexCrit;
  end

  -- Check if the font index for the scroll area is inherited from the master font index.
  if (fontIndex == 0) then
   fontIndex = masterFontIndexCrit;
  end
 end

 -- Check if the font index is invalid and set it to the default if it is.
 if (MikSBT.AVAILABLE_FONTS[fontIndex] == nil) then
  fontIndex = 1;
 end

 -- Return the font path.
 return MikSBT.AVAILABLE_FONTS[fontIndex].Path;
end


-- **********************************************************************************
-- This function gets the appropriate font outline style for an event.
-- **********************************************************************************
function MikSBT.GetFontOutline(scrollArea, eventSettings, isCrit)
 -- Holds the outline indices for the event level.
 local eventOutlineIndexNormal = 0;
 local eventOutlineIndexCrit = 0;

 -- Check if there are event settings.
 if (eventSettings ~= nil) then
  -- Get the outline indices for the event type.
  eventOutlineIndexNormal = eventSettings.FontSettings.Normal.OutlineIndex;

  -- Check if there are crit font settings for the event.
  if (eventSettings.FontSettings.Crit ~= nil) then
   eventOutlineIndexCrit = eventSettings.FontSettings.Crit.OutlineIndex;
  end
 end

 -- Get the outline indices for the scroll area and master.
 local scrollAreaOutlineIndexNormal = scrollArea.DisplaySettings.FontSettings.Normal.OutlineIndex;
 local scrollAreaOutlineIndexCrit = scrollArea.DisplaySettings.FontSettings.Crit.OutlineIndex;
 local masterOutlineIndexNormal = MikSBT.CurrentProfile.MasterFontSettings.Normal.OutlineIndex;
 local masterOutlineIndexCrit = MikSBT.CurrentProfile.MasterFontSettings.Crit.OutlineIndex;


 -- Get the normal outline index for the event.
 local outlineIndex = eventOutlineIndexNormal;

 -- Check if the outline index is inherited from the scroll area outline index.
 if (outlineIndex == 0) then
  outlineIndex = scrollAreaOutlineIndexNormal;
 end

 -- Check if the outline index for the scroll area is inherited from the master outline index.
 if (outlineIndex == 0) then
  outlineIndex = masterOutlineIndexNormal;
 end


 -- Check if the event is a crit.
 if (isCrit) then
  -- Get the crit outline index for the event.
  outlineIndex = eventOutlineIndexCrit;

  -- Check if the outline index is inherited from the scroll area outline index.
  if (outlineIndex == 0) then
   outlineIndex = scrollAreaOutlineIndexCrit;
  end

  -- Check if the outline index for the scroll area is inherited from the master outline index.
  if (outlineIndex == 0) then
   outlineIndex = masterOutlineIndexCrit;
  end
 end


 -- Return the outline style.
 return MikSBT.AVAILABLE_OUTLINES[outlineIndex].Style;
end


-- **********************************************************************************
-- This function substitutes the codes in the unformatted text of the passed
-- animation event with the values in its fields.
-- **********************************************************************************
function MikSBT.FormatEventText(animationEvent)
 local outputString = animationEvent.UnformattedText;
 
 -- Print(animationEvent)
 
 -- Check if there is no unformatted text and bail.
 if (outputString == nil) then
  return;
 end

	outputString = string.gsub(outputString, "-%%a", "\124cffff0000\124h-\124h\124r%%a");
	
	if (animationEvent.DamageType ~= nil) then
		if animationEvent.DamageType == SPELL_SCHOOL1_CAP then
			outputString = string.gsub(outputString, "%%a", "\124cffF6F99E\124h%%a\124h\124r");
		elseif animationEvent.DamageType == SPELL_SCHOOL2_CAP then
			outputString = string.gsub(outputString, "%%a", "\124cffFF8080\124h%%a\124h\124r");
		elseif animationEvent.DamageType == SPELL_SCHOOL3_CAP then
			outputString = string.gsub(outputString, "%%a", "\124cff80FF80\124h%%a\124h\124r");
		elseif animationEvent.DamageType == SPELL_SCHOOL4_CAP then
			outputString = string.gsub(outputString, "%%a", "\124cff8080FF\124h%%a\124h\124r");
		elseif animationEvent.DamageType == SPELL_SCHOOL5_CAP then
			outputString = string.gsub(outputString, "%%a", "\124cffA000A0\124h%%a\124h\124r");
		elseif animationEvent.DamageType == SPELL_SCHOOL6_CAP then
			outputString = string.gsub(outputString, "%%a", "\124cffFFB9FF\124h%%a\124h\124r");
		elseif animationEvent.DamageType == "Inconnu" then
			outputString = string.gsub(outputString, "%%a", "\124cffFFB9FF\124h%%a\124h\124r");
			-- DEFAULT_CHAT_FRAME:AddMessage(animationEvent.DamageType)
		end
	end
 
 -- Substitute amount.
 if (animationEvent.Amount ~= nil) then
  -- Check if there is overheal info 
  if (animationEvent.OverhealAmount ~= nil and MikSBT.CurrentProfile.ShowOverheals) then
   local overhealTrailer = string.gsub(MikSBT.MSG_OVERHEAL_TRAILER, "%%d", animationEvent.OverhealAmount);
   outputString = string.gsub(outputString, "%%a", (animationEvent.Amount - animationEvent.OverhealAmount) .. overhealTrailer);
  else 
   outputString = string.gsub(outputString, "%%a", animationEvent.Amount);
  end
 end

 -- Substitute enemy/player names.
 if (animationEvent.Name ~= nil) and (animationEvent.Name ~= UnitName("player")) then
  outputString = string.gsub(outputString, "%%n", animationEvent.Name);
  else
  outputString = string.gsub(outputString, "%(%%n%)", "");
  outputString = string.gsub(outputString, "%%n", "");
 end

 -- Substitute effect names.
 if (animationEvent.EffectName ~= nil) then
  outputString = string.gsub(outputString, "%%s", animationEvent.EffectName);
 end

 -- Substitute damage types.
 if (animationEvent.DamageType ~= nil) then
  outputString = string.gsub(outputString, "%%t", animationEvent.DamageType);
 end

 -- Check if there is partial effect text and the show partial effects flag is on and append it.
 if (animationEvent.PartialEffectText ~= nil and MikSBT.CurrentProfile.ShowPartialEffects) then
  outputString = outputString .. animationEvent.PartialEffectText;
 end


 -- Check if there is merge trailer text and append it.
 if (animationEvent.MergeTrailerText ~= nil) then
  outputString = outputString .. animationEvent.MergeTrailerText;
 end

 -- Set the event's output text.
 animationEvent.Text = outputString;
end


-- **********************************************************************************
-- This function returns the output message for the passed trigger event with all
-- %1-9 codes substituted with captured data.
-- **********************************************************************************
function MikSBT.FormatTriggerText(animationEvent, triggerEvent)
 local outputString = animationEvent.EventSettings.Message;

 -- Check if there is no text and bail.
 if (outputString == nil) then
  return;
 end

 -- Loop through all of the captures in the trigger event.
 for i = 1, triggerEvent.NumCaptures do
  outputString = string.gsub(outputString , "%%" .. i, triggerEvent["CapturedData" .. i]);
 end

 -- Set the event's output text.
 animationEvent.Text = outputString;
end


-- **********************************************************************************
-- Registers the triggers in the current profile with combat event lib.
-- **********************************************************************************
function MikSBT.RegisterTriggers()
 -- Unregister all of the triggers from the combat event helper.
 MikCEH.UnregisterAllTriggers();

 -- Loop through all of the triggers in the current profile.
 for triggerKey, triggerData in MikSBT.CurrentProfile.Triggers do
  -- Make sure the trigger is being shown and register it with the combat event helper.
  if (triggerData.EventSettings.Show) then
   MikCEH.RegisterTrigger(triggerKey, triggerData.TriggerSettings);
  end
 end
end


-------------------------------------------------------------------------------------
-- Profile functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Updates profiles created with older versions.
-- **********************************************************************************
function MikSBT.UpdateProfiles()
 -- Loop through all the profiles.
 for _, profile in MikSBT_Save.Profiles do

  if not profile.CreationVersion then
	-- There is an error in this Profile, we need to reset it.
	MikSBT.ResetProfile(profile);
  end
  
  -- Check if the profile was created prior to version 2.0.
  if (profile.CreationVersion < 2.0) then
   -- Update the profile's structure.
   profile.ShowOverheals = MikSBT.DEFAULT_CONFIG.ShowOverheals;
   profile.ShowGameDamage = MikSBT.DEFAULT_CONFIG.ShowGameDamage;
   profile.UseStickyCrits = MikSBT.DEFAULT_CONFIG.UseStickyCrits;

   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_SPELL_DOT"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_SPELL_DOT"]);
   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_HOT"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_HOT"]);
   profile.EventSettings["MSBT_EVENTTYPE_OUTGOING_SPELL_DOT"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_OUTGOING_SPELL_DOT"]);
   profile.EventSettings["MSBT_EVENTTYPE_OUTGOING_HOT"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_OUTGOING_HOT"]);

   -- Update the creation version to the current version.
   profile.CreationVersion = 2.0;
  end


  -- Check if the profile was created prior to version 2.1.
  if (profile.CreationVersion < 2.1) then
   -- Update the profile's structure.

   -- Loop through all of the event settings.
   for eventTypeName, eventType in profile.EventSettings do
    -- Check for the event types that can't be crits and remove the crit settings table.
    if (string.find(eventTypeName, "MISS") or string.find(eventTypeName, "DODGE") or string.find(eventTypeName, "PARRY") or
        string.find(eventTypeName, "BLOCK") or string.find(eventTypeName, "ABSORB") or string.find(eventTypeName, "IMMUNE") or
        string.find(eventTypeName, "DOT") or string.find(eventTypeName, "RESIST") or string.find(eventTypeName, "HOT") or
        string.find(eventTypeName, "ENVIRONMENTAL") or string.find(eventTypeName, "EVADE") or string.find(eventTypeName, "NOTIFICATION")) then

     -- Remove the crit settings table.
     eventType.FontSettings.Crit = nil;
    end

    -- Check if the event type is a notification and add the IsSticky flag.
    if (string.find(eventTypeName, "NOTIFICATION")) then
     eventType.IsSticky = MikSBT.DEFAULT_CONFIG.EventSettings[eventTypeName].IsSticky;
    end

    -- Add event settings for experience gains.
    profile.EventSettings["MSBT_EVENTTYPE_NOTIFICATION_EXPERIENCE_GAIN"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_NOTIFICATION_EXPERIENCE_GAIN"]);
   end

   -- Update the creation version to the current version.
   profile.CreationVersion = 2.1;
  end


  -- Check if the profile was created prior to version 3.0.
  if (profile.CreationVersion < 3.0) then
   -- Remove the low health, low mana, and execute notification event settings since they are now triggers.
   profile.EventSettings["MSBT_EVENTTYPE_NOTIFICATION_LOW_HEALTH"] = nil;
   profile.EventSettings["MSBT_EVENTTYPE_NOTIFICATION_LOW_MANA"] = nil;
   profile.EventSettings["MSBT_EVENTTYPE_NOTIFICATION_EXECUTE"] = nil;

   -- Remove the low health and low mana warning percentage info since they are now triggers.
   profile.WarningPercentageHealth = nil;
   profile.WarningPercentageMana = nil;


   -- Update the profile's structure with triggers.
   profile.Triggers = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.Triggers);

   -- Add event settings for killing blows.
   profile.EventSettings["MSBT_EVENTTYPE_NOTIFICATION_PC_KILLING_BLOW"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_NOTIFICATION_PC_KILLING_BLOW"]);
   profile.EventSettings["MSBT_EVENTTYPE_NOTIFICATION_NPC_KILLING_BLOW"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_NOTIFICATION_NPC_KILLING_BLOW"]);

   -- Update the profile's structure with suppresions.
   profile.Suppressions = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.Suppressions);

   -- Update the creation version to the current version.
   profile.CreationVersion = 3.0;
  end

  -- Check if the profile was created prior to version 4.0.
  if (profile.CreationVersion < 4.0) then
  
   profile.ShowAllManaGains = false;
   profile.LowHealthSound = true;
   profile.LowManaSound	 = true;
  
   profile.CreationVersion = 4.0;
  end
  
  -- Check if the profile was created prior to version 4.1.
  if (profile.CreationVersion < 4.1) then
  
   if profile.Triggers.MSBT_TRIGGER_WINDFURY then -- Fix Windfury Trigger
	   profile.Triggers.MSBT_TRIGGER_WINDFURY.TriggerSettings.SearchPatterns[1] = string.format(AURAADDEDSELFHELPFUL, string.gsub(BS["Windfury Totem"], "-", "%%-"))
   end
   
   if profile.Triggers.MSBT_TRIGGER_HAND_OF_JUSTICE then -- Delete Hand of Justice Trigger
	   profile.Triggers["MSBT_TRIGGER_HAND_OF_JUSTICE"] = nil;
   end
   
   profile.CreationVersion = 4.1;
  end
  
  if (profile.CreationVersion < 4.3) then
  
  -- The pet update !
   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_DAMAGE"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_DAMAGE"]);
   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_MISS"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_MISS"]);
   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_DODGE"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_DODGE"]);
   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_PARRY"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_PARRY"]);
   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_BLOCK"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_BLOCK"]);
   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_ABSORB"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_ABSORB"]);
   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_IMMUNE"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_IMMUNE"]);
   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_SPELL_DAMAGE"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_SPELL_DAMAGE"]);
   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_SPELL_DOT"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_SPELL_DOT"]);
   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_SPELL_MISS"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_SPELL_MISS"]);
   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_SPELL_DODGE"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_SPELL_DODGE"]);
   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_SPELL_PARRY"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_SPELL_PARRY"]);
   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_SPELL_BLOCK"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_SPELL_BLOCK"]);
   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_SPELL_RESIST"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_SPELL_RESIST"]);
   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_SPELL_ABSORB"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_SPELL_ABSORB"]);
   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_SPELL_IMMUNE"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_SPELL_IMMUNE"]);
   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_HEAL"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_HEAL"]);
   profile.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_HOT"] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.EventSettings["MSBT_EVENTTYPE_INCOMING_PET_HOT"]);
   
   profile.CreationVersion = 4.3;
  end
  
  if (profile.CreationVersion < 4.4) then
  
	 profile.BlizzardFontSettings = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG.BlizzardFontSettings);
	 
  profile.CreationVersion = 4.4;
  end
  
 end
end


-- **********************************************************************************
-- Returns whether or not the passed profile exists.
-- **********************************************************************************
function MikSBT.ProfileExists(profileName)
 local profileFound = false;

 -- Loop through all of the profiles looking for the passed one.
 for pName in MikSBT_Save.Profiles do
  if (pName == profileName) then
   profileFound = true;   
  end
 end

 -- Return whether or not the profile exists.
 return profileFound;
end


-- **********************************************************************************
-- Resets the passed profile to its defaults.
-- **********************************************************************************
function MikSBT.ResetProfile(profileName, showOutput)
 -- Get whether or not the profile exists.
 local profileExists = MikSBT.ProfileExists(profileName);

 -- Check if the profile exists.
 if (profileExists) then
  -- Reset the profile.
  MikSBT_Save.Profiles[profileName] = MikSBT.CopyTable(MikSBT.DEFAULT_CONFIG);

  -- Check if it's the current profile being reset.
  if (profileName == MikSBT_Save.CurrentProfile) then
   -- Reset the current profile pointer.
   MikSBT.CurrentProfile = MikSBT_Save.Profiles[MikSBT_Save.CurrentProfile];

   -- Reassociate the display settings if the scroll areas have been setup.
   if (scrollAreas.Incoming ~= nil) then
    -- Setup the display settings.
    scrollAreas.Incoming.DisplaySettings = MikSBT.CurrentProfile.DisplaySettings.Incoming;
    scrollAreas.Outgoing.DisplaySettings = MikSBT.CurrentProfile.DisplaySettings.Outgoing;
    scrollAreas.Notification.DisplaySettings = MikSBT.CurrentProfile.DisplaySettings.Notification;
   end

   -- Reposition the animation frames.
   MikSBT.RepositionAnimationFrames();

   -- Register the triggers with the combat event helper.
   MikSBT.RegisterTriggers();
  end

  -- Check if the output text is to be shown.
  if (showOutput) then
   -- Print the profile reset string.
   MikSBT.Print(profileName .. " " .. MikSBT.MSG_PROFILE_RESET, 0, 1, 0);
  end
 end 
end


-- **********************************************************************************
-- Selects the passed profile.
-- **********************************************************************************
function MikSBT.SelectProfile(profileName)
 -- Get whether or not the profile exists.
 local profileExists = MikSBT.ProfileExists(profileName);

 -- Check if the profile exists.
 if (profileExists) then
  -- Set the current profile name to the one being selected.
  MikSBT_Save.CurrentProfile = profileName;

  -- Reset the current profile pointer.
  MikSBT.CurrentProfile = MikSBT_Save.Profiles[MikSBT_Save.CurrentProfile];

  -- Reassociate the display settings if the scroll areas have been setup.
  if (scrollAreas.Incoming ~= nil) then
   -- Setup the display settings.
   scrollAreas.Incoming.DisplaySettings = MikSBT.CurrentProfile.DisplaySettings.Incoming;
   scrollAreas.Outgoing.DisplaySettings = MikSBT.CurrentProfile.DisplaySettings.Outgoing;
   scrollAreas.Notification.DisplaySettings = MikSBT.CurrentProfile.DisplaySettings.Notification;
  end

  -- Reposition the animation frames.
  MikSBT.RepositionAnimationFrames();

  -- Register the triggers with the combat event helper.
  MikSBT.RegisterTriggers();
 end
end


-- **********************************************************************************
-- Creates a profile for the passed name.
-- **********************************************************************************
function MikSBT.CreateProfile(profileName)
 -- Get whether or not the profile exists.
 local profileExists = MikSBT.ProfileExists(profileName);

 -- Make sure a profile name was passed and it doesn't already exist.
 if (not profileExists and profileName ~= nil and profileName ~= "") then
  -- Create an array for the profile.
  MikSBT_Save.Profiles[profileName] = {};
  
  -- Reset the profile.
  MikSBT.ResetProfile(profileName);
 end
end


-- **********************************************************************************
-- Deletes the passed profile.
-- **********************************************************************************
function MikSBT.DeleteProfile(profileName)
 -- Check if the passed profile is the default one.
 if (profileName == MikSBT.DEFAULT_PROFILE_NAME) then
  return;
 end

 -- Get whether or not the profile exists.
 local profileExists = MikSBT.ProfileExists(profileName);

 -- Check if the profile exists.
 if (profileExists) then
  -- Check if the profile being deleted is the current one.
  if (profileName == MikSBT_Save.CurrentProfile) then
   -- Select the default profile.
   MikSBT.SelectProfile(MikSBT.DEFAULT_PROFILE_NAME);
  end

  -- Delete the profile.
  MikSBT_Save.Profiles[profileName] = nil;
 end
end


-------------------------------------------------------------------------------------
-- Option functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Set the user disabled option
-- **********************************************************************************
function MikSBT.SetOptionUserDisabled(isDisabled)
 MikSBT_Save.UserDisabled = isDisabled;

 -- Check if the mod is being set to disabled.
 if (isDisabled) then
  -- Unregister all events.
  MikSBT.UnregisterEvents();
  MikCEH.UnregisterEvents();

  -- Turn on the game's display of outgoing damage.
  SetCVar("CombatDamage", 1);

  -- Turn on Blizzard's default combat text.
  if (SHOW_COMBAT_TEXT ~= nil) then
   SHOW_COMBAT_TEXT = 1;
  end
 else
  -- Reregister events.
  MikSBT.RegisterEvents();
  MikCEH.RegisterEvents();

  -- Turn the game damage display on or off depending on the user setting.
  MikSBT.SetOptionShowGameDamage(MikSBT.CurrentProfile.ShowGameDamage);
  
  -- Turn off Blizzard's default combat text.
  if (SHOW_COMBAT_TEXT ~= nil) then
   SHOW_COMBAT_TEXT = 0;
  end

  -- Make sure that periodic spell effects are reported.
  SetCVar("CombatLogPeriodicSpells", 1);
 end
end


-- **********************************************************************************
-- Set the game damage disabled option
-- **********************************************************************************
function MikSBT.SetOptionShowGameDamage(showDamage)
 MikSBT.CurrentProfile.ShowGameDamage = showDamage;

 -- Check if the game damage is being set to on.
 if (showDamage) then
   -- Turn on the game damage display.
   SetCVar("CombatDamage", 1);
 else
   -- Turn off the game damage display.
   SetCVar("CombatDamage", 0);
 end
end


-- **********************************************************************************
-- This function takes a string version of a variable path
-- and returns its value from the current profile.
-- **********************************************************************************
function MikSBT.GetOptionFromVarPath(varPath)
 -- Set the current table to the current profile.
 local currentTable = MikSBT.CurrentProfile;

 -- Index into each sub table until we reach the actual variable wanted.
 for varName in string.gfind(varPath, "[%w_]+") do
  if (type(currentTable[varName]) == "table") then
   currentTable = currentTable[varName];
  else
   return currentTable[varName];
  end
 end

 return nil;
end


-- **********************************************************************************
-- This function takes a string version of a variable path
-- and sets its value in the current profile to the passed value.
-- **********************************************************************************
function MikSBT.SetOptionFromVarPath(varPath, newValue)
 -- Sets the current table to the current profile.
 local currentTable = MikSBT.CurrentProfile;

 -- Index into each sub table until we reach the actual variable wanted and set it
 -- to the passed value.
 for varName in string.gfind(varPath, "[%w_]+") do
  if (type(currentTable[varName]) == "table") then
   currentTable = currentTable[varName]
  else
   currentTable[varName] = newValue;
  end
 end
end


-------------------------------------------------------------------------------------
-- Animation functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Adds the passed animation event to the animation system for the appropriate scroll
-- area.
--
-- animationEvent Possible Fields:
--  ScrollArea		- The scroll area to use for the event.
--  EventType		- The event type.
--  EventSettings		- The event settings for the event.
--  IsCrit			- Whether or not the event is a crit.
--  UnformattedText	- The unformatted text to display.
--  Amount			- The amount of the attack, heal, gain, loss, etc.
--  EffectName		- The name of the spell, ability, buff, debuff, power type, etc.
--  Name			- The name of the enemy/player.
--  DamageType		- The type of damage.
--  PartialEffectText	- Partial effect text to be appended. (partial resists, absorbs, blocks)
--  OverhealAmount	- The amount overhealed.
--  Text			- The formatted text to display.
-- **********************************************************************************
function MikSBT.DispatchAnimationEvent(animationEvent)
 -- Check if the event is to be shown.
 if (animationEvent.EventSettings.Show and animationEvent.ScrollArea.DisplaySettings.Show) then

  -- If it's an incoming or outgoing event add it to the associated scroll area's events array
  -- for potential merging.
  if (animationEvent.ScrollArea == scrollAreas.Incoming) then
   table.insert(animationMergeData.Incoming.UnmergedEvents, animationEvent);
  elseif (animationEvent.ScrollArea == scrollAreas.Outgoing) then
   table.insert(animationMergeData.Outgoing.UnmergedEvents, animationEvent);

  -- Add the event the animation system.
  else
   MikSBT.AddAnimation(animationEvent);
  end
 end
end


-- **********************************************************************************
-- Add the event to the appropriate scroll area's animation display array.
-- **********************************************************************************
function MikSBT.AddAnimation(animationEvent)
 -- Format the animation event's output text.
 MikSBT.FormatEventText(animationEvent);

 -- Loop through all of the suppression entries and look for a match.
 for _, suppressionSettings in MikSBT.CurrentProfile.Suppressions do
  -- Check if the suppression's search pattern is a match.
  if (suppressionSettings.Enabled and (string.find(animationEvent.Text, suppressionSettings.SearchPattern))) then
   -- Reclaim the animation event table to the events recycler and leave the function.
   eventsRecycler:ReclaimTable(animationEvent);
   return;
  elseif (suppressionSettings.Enabled and animationEvent.EffectName and string.find(animationEvent.EffectName, suppressionSettings.SearchPattern)) then
   -- Reclaim the animation event table to the events recycler and leave the function.
   eventsRecycler:ReclaimTable(animationEvent);
   return;
  end
 end
 
 if animationEvent.EventType == "MSBT_EVENTTYPE_NOTIFICATION_POWER_GAIN" and animationEvent.EffectName ~= 0 and MikSBT.CurrentProfile.ShowAllManaGains then
	return
 end


 -- Check if the animation event is to be displayed sticky style.
 if (animationEvent.EventSettings ~= nil and animationEvent.EventSettings.IsSticky) then
  animationEvent.IsSticky = true;
 end

 -- Color UnitName by class
 local UnitID = MikCEH.GetUnitIDFromName(animationEvent.Name)
 if UnitID then
	local _, Class = UnitClass(UnitID)
	if Class and Class == "PALADIN" then
		animationEvent.Text = string.gsub(animationEvent.Text, animationEvent.Name, "|cffF58CBA|h"..animationEvent.Name.."|h|r")
	elseif Class and Class == "DRUID" then
		animationEvent.Text = string.gsub(animationEvent.Text, animationEvent.Name, "|cffFF7D0A|h"..animationEvent.Name.."|h|r")
	elseif Class and Class == "HUNTER" then
		animationEvent.Text = string.gsub(animationEvent.Text, animationEvent.Name, "|cffABD473|h"..animationEvent.Name.."|h|r")
	elseif Class and Class == "MAGE" then
		animationEvent.Text = string.gsub(animationEvent.Text, animationEvent.Name, "|cff69CCF0|h"..animationEvent.Name.."|h|r")
	elseif Class and Class == "PRIEST" then
		animationEvent.Text = string.gsub(animationEvent.Text, animationEvent.Name, "|cffFFFFFF|h"..animationEvent.Name.."|h|r")
	elseif Class and Class == "ROGUE" then
		animationEvent.Text = string.gsub(animationEvent.Text, animationEvent.Name, "|cffFFF569|h"..animationEvent.Name.."|h|r")
	elseif Class and Class == "SHAMAN" then
		animationEvent.Text = string.gsub(animationEvent.Text, animationEvent.Name, "|cff0070DE|h"..animationEvent.Name.."|h|r")
	elseif Class and Class == "WARLOCK" then
		animationEvent.Text = string.gsub(animationEvent.Text, animationEvent.Name, "|cff9482C9|h"..animationEvent.Name.."|h|r")
	elseif Class and Class == "WARRIOR" then
		animationEvent.Text = string.gsub(animationEvent.Text, animationEvent.Name, "|cffC79C6E|h"..animationEvent.Name.."|h|r")
	end
 end

 -- Get the next available animation display info object for the scroll area.
 local animDisplayInfo = MikSBT.GetNextAnimationDisplayInfo(animationEvent);

 -- Get the scroll function to use.
 animDisplayInfo.ScrollFunction = MikSBT.GetScrollFunction(animationEvent);

 -- Get the starting X and Y positions.
 animDisplayInfo.PositionX, animDisplayInfo.PositionY = MikSBT.GetAnimationStartingPosition(animationEvent)


 -- Check if the animation event has event settings associated with it.
 if (animationEvent.EventSettings ~= nil) then
  -- Get the font size for the event.
  animDisplayInfo.FontSize = MikSBT.GetFontSize(animationEvent.ScrollArea, animationEvent.EventSettings, animationEvent.IsCrit);

  -- Get the font path for the event.
  animDisplayInfo.FontPath = MikSBT.GetFontPath(animationEvent.ScrollArea, animationEvent.EventSettings, animationEvent.IsCrit);

  -- Get the font outline style for the event.
  animDisplayInfo.FontOutline = MikSBT.GetFontOutline(animationEvent.ScrollArea, animationEvent.EventSettings, animationEvent.IsCrit);

  -- Set the r, g, and b color for the animation display object.
  animDisplayInfo.ColorR = animationEvent.EventSettings.FontSettings.Color.r;
  animDisplayInfo.ColorG = animationEvent.EventSettings.FontSettings.Color.g;
  animDisplayInfo.ColorB = animationEvent.EventSettings.FontSettings.Color.b;

 -- No event type associated with the event so get the display info from the animation event itself.
 else
  -- Get the font size for the event.
  animDisplayInfo.FontSize = animationEvent.FontSize;

  -- Get the font path for the event.
  animDisplayInfo.FontPath = animationEvent.FontPath;

  -- Get the font outline style for the event.
  animDisplayInfo.FontOutline = animationEvent.FontOutline;

  -- Set the r, g, and b color for the animation display object.
  animDisplayInfo.ColorR = animationEvent.ColorR;
  animDisplayInfo.ColorG = animationEvent.ColorG;
  animDisplayInfo.ColorB = animationEvent.ColorB;
 end


 -- Set the animation display alpha, anchor point, crit flag, and sticky flag.
 animDisplayInfo.Alpha = 0;
 animDisplayInfo.AnchorPoint = MikSBT.AVAILABLE_TEXT_ALIGNS[animationEvent.ScrollArea.DisplaySettings.FontSettings.TextAlignIndex].AnchorPoint;
 animDisplayInfo.IsCrit = animationEvent.IsCrit;
 animDisplayInfo.IsSticky = animationEvent.IsSticky;

 -- Set the font object properties.
 animDisplayInfo.FontObject:ClearAllPoints();
 animDisplayInfo.FontObject:SetFont(animDisplayInfo.FontPath, animDisplayInfo.FontSize, animDisplayInfo.FontOutline);
 animDisplayInfo.FontObject:SetTextColor(animDisplayInfo.ColorR, animDisplayInfo.ColorG, animDisplayInfo.ColorB);
 animDisplayInfo.FontObject:SetText(animationEvent.Text);
 animDisplayInfo.FontObject:SetAlpha(animDisplayInfo.Alpha);
 animDisplayInfo.FontObject:SetPoint(animDisplayInfo.AnchorPoint, animDisplayInfo.PositionX, animDisplayInfo.PositionY);
 
 -- Athene Edit - Spell Icon
 local texture
 if animationEvent.Texture then texture = animationEvent.Texture end
 if animationEvent.EffectName then
	 local name = string.gsub(animationEvent.EffectName, " %(%d+%)", "")
	 -- DEFAULT_CHAT_FRAME:AddMessage(animationEvent.EffectName)
	 -- DEFAULT_CHAT_FRAME:AddMessage(name)
	 -- texture = BS:GetSpellIcon(name)
	 if ICON_CACHE[strlower(name)] then
		texture = ICON_CACHE[strlower(name)]
	 elseif not texture and MikSBT.FindBuff(name) then
		local bufftype,index,_ = MikSBT.FindBuff(name)
		local icon
		if bufftype == "buff" then
			icon = UnitBuff("player", index)
			ICON_CACHE[strlower(name)] = icon
			texture = icon
		elseif bufftype == "debuff" then
			icon = UnitDebuff("player", index)
			ICON_CACHE[strlower(name)] = icon
			texture = icon
		else
			texture = nil
			NO_ICON_CACHE[strlower(name)] = 1
		end
	 elseif not texture and BS:GetSpellIcon(name) then
		texture = BS:GetSpellIcon(name)
	 elseif not texture and MikSBT.FindItemIcon(name) then
		texture = MikSBT.FindItemIcon(name)
		ICON_CACHE[strlower(name)] = MikSBT.FindItemIcon(name)
	 elseif not texture then
		texture = nil
		NO_ICON_CACHE[strlower(name)] = 1
	 end
 end
 
 if texture then
  -- local frame
  if not animDisplayInfo.Texture then
	-- on creer une nouvelle texture
	animDisplayInfo.Texture = getglobal(animationEvent.ScrollArea.AssociatedFrame):CreateTexture(nil, "ARTWORK")
  end
	-- on réutilise une texture existante
  animDisplayInfo.Texture:ClearAllPoints();
  animDisplayInfo.Texture:SetTexture(nil);
  animDisplayInfo.Texture:SetTexture(texture);
  animDisplayInfo.Texture:SetWidth(animDisplayInfo.FontSize);
  animDisplayInfo.Texture:SetHeight(animDisplayInfo.FontSize);
  animDisplayInfo.Texture:SetTexCoord(0.125, 0.875, 0.125, 0.875)
  animDisplayInfo.Texture:SetPoint("RIGHT", animDisplayInfo.FontObject, "LEFT", -4, 0);
  animDisplayInfo.Texture:SetDrawLayer(animDisplayInfo.IsSticky and "OVERLAY" or animDisplayInfo.IsCrit and "OVERLAY" or "ARTWORK");
 elseif animDisplayInfo.Texture then
	animDisplayInfo.Texture:SetTexture(nil);
 end
 

 -- Set the last update to the current time.
 animDisplayInfo.LastUpdated = GetTime();

 -- Set the active flag.
 animDisplayInfo.IsActive = true;


 -- Check if the scroll area's display frame is not visible and make it visible so the OnUpdate events start firing.
 -- This is done to keep the number of OnUpdate events down to a minimum for better performance.
 if (not getglobal(animationEvent.ScrollArea.AssociatedFrame):IsVisible()) then
  getglobal(animationEvent.ScrollArea.AssociatedFrame):Show();
 end

 -- Check if it's a sticky or a crit and sticky crits are enabled.
 if (animDisplayInfo.IsSticky or (animDisplayInfo.IsCrit and MikSBT.CurrentProfile.UseStickyCrits)) then
  -- Make sure the stickies don't overlap.
  MikSBT.RepositionStickyAnimDisplayInfo(animationEvent.ScrollArea);
 else
  -- Make sure there are no overlaps in the scrolling text.
  MikSBT.RepositionAnimDisplayInfo(animationEvent.ScrollArea);
 end

 -- Reclaim the animation event table to the events recycler.
 eventsRecycler:ReclaimTable(animationEvent);
end

-- **********************************************************************************
-- This function return the buff texture based on
-- it's name.
-- **********************************************************************************
function ItemLinkToName(link)
	return gsub(link,"^.*%[(.*)%].*$","%1");
end

function MikSBT.FindItemIcon(item)
	if ( not item ) then return; end
	item = string.lower(item);
	local link;
	for i = 1,23 do
		link = GetInventoryItemLink("player",i);
		if ( link ) then
			if ( item == string.lower(ItemLinkToName(link)) )then
				return i, nil, GetInventoryItemTexture('player', i), GetInventoryItemCount('player', i);
			end
		end
	end
	local count, bag, slot, texture;
	for i = 0,NUM_BAG_FRAMES do
		for j = 1,MAX_CONTAINER_ITEMS do
			link = GetContainerItemLink(i,j);
			if ( link ) then
				if ( item == string.lower(ItemLinkToName(link))) then
					bag, slot = i, j;
					texture, count = GetContainerItemInfo(i,j);
				end
			end
		end
	end
	return texture;
end

-- **********************************************************************************
-- This function return the buff texture based on
-- it's name.
-- **********************************************************************************
function MikSBT.FindBuff( obuff, unit, item)
	local buff=strlower(obuff);
	local tooltip=MSBT_Tooltip;
	local textleft1=getglobal(tooltip:GetName().."TextLeft1");
	if ( not unit ) then
		unit ='player';
	end
	local my, me, mc, oy, oe, oc = GetWeaponEnchantInfo();
	if ( my ) then
		tooltip:SetOwner(UIParent, "ANCHOR_NONE");
		tooltip:SetInventoryItem( unit, 16);
		for i=1, 23 do
			local text = getglobal("MSBT_TooltipTextLeft"..i):GetText();
			if ( not text ) then
				break;
			elseif (text and strlower(text) == buff) then
				tooltip:Hide();
				return "main",me, mc;
			end
		end
		tooltip:Hide();
	elseif ( oy ) then
		tooltip:SetOwner(UIParent, "ANCHOR_NONE");
		tooltip:SetInventoryItem( unit, 17);
		for i=1, 23 do
			local text = getglobal("MSBT_TooltipTextLeft"..i):GetText();
			if ( not text ) then
				break;
			elseif (text and strlower(text) == buff) then
				tooltip:Hide();
				return "off", oe, oc;
			end
		end
		tooltip:Hide();
	end
	if ( item ) then return end
	tooltip:SetOwner(UIParent, "ANCHOR_NONE");
	tooltip:SetTrackingSpell();
	local b = textleft1:GetText();
	if ( b and strlower(b) == buff ) then
		tooltip:Hide();
		return "track",b;
	end
	local c=nil;
	for i=1, 32 do
		tooltip:SetOwner(UIParent, "ANCHOR_NONE");
		tooltip:SetUnitBuff(unit, i);
		b = textleft1:GetText();
		tooltip:Hide();
		if ( b and strlower(b) == buff ) then
			return "buff", i, b;
		elseif ( c==b ) then
			break;
		end
		--c = b;
	end
	c=nil;
	for i=1, 16 do
		tooltip:SetOwner(UIParent, "ANCHOR_NONE");
		tooltip:SetUnitDebuff(unit, i);
		b = textleft1:GetText();
		tooltip:Hide();
		if ( b and strlower(b) == buff ) then
			return "debuff", i, b;
		elseif ( c==b) then
			break;
		end
		--c = b;
	end
	tooltip:Hide();
end

-- **********************************************************************************
-- This function return some debug stuff
-- for real.
-- **********************************************************************************

local depth = 0

local function dump(...)
	local out = "";
	for i = 1, arg.n, 1 do
		if depth > 30 then
			out = out .. "|cffffd800... Too many things here!|r"
			return out;
		end
		local d = arg[i];
		local t = type(d);
		if (t == "table") then
			out = out .. "{ |cff9f9f9f--[[" .. tostring(arg[i]) .. "]]|r\n";
			local first = true;
			if (d) then
				for k, v in pairs(d) do
					if (not first) then out = out .. ", \n"; end
					first = false;
					depth = depth + 1
					out = out .. "  " .. dump(k);
					out = out .. " = ";
					out = out .. dump(v);
				end
			end
			out = out .. "\n}, |cff9f9f9f--[[" .. tostring(arg[i]) .. "]]|r\n";
		elseif (t == "nil") then
			out = out .. "|cffff7f7fnil|r";
		elseif (t == "number") then
			out = out .. "|cffff7fff" .. d .. "|r";
		elseif (t == "string") then
			out = out .. '"|cff7fd5ff' .. d .. '|r"';
		elseif (t == "boolean") then
			if (d) then
				out = out .. "|cffff9100true|r";
			else
				out = out .. "|cffff9100false|r";
			end
		elseif (t == "function") then
			out = out .. "|cff7fd5ff" .. tostring(d) .. "|r";
		elseif (t == "userdata") then
			out = out .. string.format("|cffffea00<%s:%s>|r", t, getmetatable(d) or "(anon)")
		else
			out = out .. string.upper(t) .. "??";
		end

		if (i < arg.n) then out = out .. ", "; end
	end
	return out;
end

function MikSBT.debugPrint(...)
	local debugWin = 0;
	local name, shown;
	for i=1, NUM_CHAT_WINDOWS do
		name,_,_,_,_,_,shown = GetChatWindowInfo(i);
		if (string.lower(name) == "debug") then debugWin = i; break; end
	end
	if (debugWin == 0) then return end
	local out = "";
	depth = 0
	for i = 1, arg.n, 1 do
		if (i > 1) then out = out .. ", "; end
		out = arg[i].." = "
		arg[i] = getglobal(arg[i])
		local t = type(arg[i]);
		if (t == "string") then
			out = out .. '"|cff7fd5ff'..arg[i]..'|r"';
		elseif (t == "number") then
			out = out .. "|cffff7fff" .. arg[i] .. "|r";
		elseif (t == "boolean") then
			out = out .. "|cffff9100" .. arg[i] .. "|r";
		elseif (t == nil) then
			out = out .. "|cffff7f7f" .. arg[i] .. "|r";
		else
			out = out .. dump(arg[i]);
		end
	end
	local start = GetTime()
	getglobal("ChatFrame"..debugWin):AddMessage("|cffffd800<|r\n" .. out, 1.0, 1.0, 1.0);
	getglobal("ChatFrame"..debugWin):AddMessage("|cffffd800> displayed in:|r "..string.format( "%.4f",GetTime()-start).."|cffffd800s|r", 1.0, 1.0, 1.0);
end

SLASH_MSBTDUMPCMD1 = "/bump"
SlashCmdList["MSBTDUMPCMD"] = MikSBT.debugPrint


-- **********************************************************************************
-- This function gets the next animation display info object for the correct
-- scroll area.
-- **********************************************************************************
function MikSBT.GetNextAnimationDisplayInfo(animationEvent)
 -- Holds the next animation display info object.
 local animDisplayInfo;

 -- Check if it's a sticky or it's a crit and sticky crits are enabled.
 if (animationEvent.IsSticky or (animationEvent.IsCrit and MikSBT.CurrentProfile.UseStickyCrits)) then
  -- Get the next available animation display object for stickies.
  -- This is done so that stickies use the last set of font strings to avoid normal hits
  -- overlapping them.
  animDisplayInfo = animationEvent.ScrollArea.AnimationDisplayArray[animationEvent.ScrollArea.NextSticky];

  -- Increment to the next sticky animation display object.
  animationEvent.ScrollArea.NextSticky = animationEvent.ScrollArea.NextSticky + 1;
 
  -- Loop back around to the first sticky animation display object.
  if (animationEvent.ScrollArea.NextSticky > NUM_FONT_STRINGS) then
   animationEvent.ScrollArea.NextSticky = animationEvent.ScrollArea.FirstSticky;
  end

 -- Not a sticky.
 else
  -- Get the next available animation display object.
  animDisplayInfo = animationEvent.ScrollArea.AnimationDisplayArray[animationEvent.ScrollArea.NextAnimationDisplay];

  -- Increment to the next animation display object.
  animationEvent.ScrollArea.NextAnimationDisplay = animationEvent.ScrollArea.NextAnimationDisplay + 1;
 
  -- Loop back around to the first animation display object.
  if (animationEvent.ScrollArea.NextAnimationDisplay > (animationEvent.ScrollArea.FirstSticky - 1)) then
   animationEvent.ScrollArea.NextAnimationDisplay = 1;
  end
 end

 -- Return the animation display info object.
 return animDisplayInfo;
end


-- **********************************************************************************
-- This function gets the scroll function to use for the event.
-- **********************************************************************************
function MikSBT.GetScrollFunction(animationEvent)
 -- Straight animation style.
 if (animationEvent.ScrollArea.DisplaySettings.AnimationStyle == ANIMATION_STYLE_STRAIGHT) then
  -- Text is scrolling down.
  if (animationEvent.ScrollArea.DisplaySettings.ScrollDirection == SCROLL_DIRECTION_DOWN) then
   -- Return the appropriate animation function.
   return MikSBT.ScrollStraightDown;
  -- Text is scrolling up.
  else
   -- Return the appropriate animation function.
   return MikSBT.ScrollStraightUp;
  end

 -- Left parabola animation style.
 elseif (animationEvent.ScrollArea.DisplaySettings.AnimationStyle == ANIMATION_STYLE_LEFT_PARABOLA) then
  -- Text is scrolling down.
  if (animationEvent.ScrollArea.DisplaySettings.ScrollDirection == SCROLL_DIRECTION_DOWN) then
   -- Return the appropriate animation function.
   return MikSBT.ScrollLeftParabolaDown;
  -- Text is scrolling up.
  else
   -- Return the appropriate animation function.
   return MikSBT.ScrollLeftParabolaUp;
  end

 -- Right parabola animation style.
 elseif (animationEvent.ScrollArea.DisplaySettings.AnimationStyle == ANIMATION_STYLE_RIGHT_PARABOLA) then
  -- Text is scrolling down.
  if (animationEvent.ScrollArea.DisplaySettings.ScrollDirection == SCROLL_DIRECTION_DOWN) then
   -- Return the appropriate animation function.
   return MikSBT.ScrollRightParabolaDown;
  -- Text is scrolling up.
  else
   -- Return the appropriate animation function.
   return MikSBT.ScrollRightParabolaUp;
  end

 end

 -- Default to the straight up animation style although the function should never get
 -- to this point.
 return MikSBT.ScrollStraightUp;
end


-- **********************************************************************************
-- This function gets the starting animation x and and y position.
-- **********************************************************************************
function MikSBT.GetAnimationStartingPosition(animationEvent)
 -- Holds where to start the animation at.
 local startPositionX, startPositionY;

 -- Check which animation style is selected for the scroll area.
 if (animationEvent.ScrollArea.DisplaySettings.AnimationStyle == ANIMATION_STYLE_STRAIGHT or
     animationEvent.ScrollArea.DisplaySettings.AnimationStyle == ANIMATION_STYLE_LEFT_PARABOLA or
     animationEvent.ScrollArea.DisplaySettings.AnimationStyle == ANIMATION_STYLE_RIGHT_PARABOLA) then

  -- Check if the text is scrolling down.
  if (animationEvent.ScrollArea.DisplaySettings.ScrollDirection == SCROLL_DIRECTION_DOWN) then
   -- Set the starting X and Y positions.
   startPositionX = 0;
   startPositionY = animationEvent.ScrollArea.DisplaySettings.ScrollHeight;
  -- Text is scrolling up.
  else
   -- Set the starting X and Y positions.
   startPositionX = 0;
   startPositionY = 0;
  end

  -- Check if it's a sticky or a crit and sticky crits are enabled.
  if (animationEvent.IsSticky or (animationEvent.IsCrit and MikSBT.CurrentProfile.UseStickyCrits)) then
   -- Set the sticky to the center.
   startPositionY = ceil(animationEvent.ScrollArea.DisplaySettings.ScrollHeight / 2);
  end
 end

 -- Return the x and y starting positions.
 return startPositionX, startPositionY;
end


-- **********************************************************************************
-- This function makes sure there is no overlapping text.
-- **********************************************************************************
function MikSBT.RepositionAnimDisplayInfo(scrollArea)
 -- Construct a table with the non sticky animation display info in the same order the events were added.
 for x = scrollArea.NextAnimationDisplay, scrollArea.FirstSticky-1 do
  local animDisplayInfo = scrollArea.AnimationDisplayArray[x];
  if (animDisplayInfo.IsActive) then
   table.insert(activeNonStickies, animDisplayInfo);
  end
 end

 for x = 1, scrollArea.NextAnimationDisplay-1 do
  local animDisplayInfo = scrollArea.AnimationDisplayArray[x];
  if (animDisplayInfo.IsActive) then
   table.insert(activeNonStickies, animDisplayInfo);
  end
 end

 -- Get the number of active non sticky data objects.
 local numNonStickies = table.getn(activeNonStickies);

 -- Animation style straight, left parabola, or right parabola.
 if (scrollArea.DisplaySettings.AnimationStyle == ANIMATION_STYLE_STRAIGHT or 
     scrollArea.DisplaySettings.AnimationStyle == ANIMATION_STYLE_LEFT_PARABOLA or 
     scrollArea.DisplaySettings.AnimationStyle == ANIMATION_STYLE_RIGHT_PARABOLA) then

  -- Scrolling down.
  if (scrollArea.DisplaySettings.ScrollDirection == SCROLL_DIRECTION_DOWN) then

   -- Check if there is more than 1 active non sticky animation.
   if (numNonStickies > 1) then
    -- Loop backwards through the active non sticky animation display objects and move the ones that are colliding.
    for x = numNonStickies, 2, -1 do
     local bottomPointCurrent = activeNonStickies[x].PositionY;
     local topPointNext = activeNonStickies[x-1].PositionY + activeNonStickies[x-1].FontSize + MIN_VERTICAL_SPACING;
     if (topPointNext > bottomPointCurrent) then
      activeNonStickies[x-1].PositionY = bottomPointCurrent - activeNonStickies[x-1].FontSize - MIN_VERTICAL_SPACING;
     end
    end
   end

  -- Scrolling up.
  else

   -- Check if there is more than 1 active non sticky animation.
   if (numNonStickies > 1) then
    -- Loop backwards through the active non sticky animation display objects and move the ones that are colliding.
    for x = numNonStickies, 2, -1 do
     local topPointCurrent = activeNonStickies[x].PositionY + activeNonStickies[x].FontSize + MIN_VERTICAL_SPACING;
     local bottomPointNext = activeNonStickies[x-1].PositionY;
     if (bottomPointNext < topPointCurrent) then
      activeNonStickies[x-1].PositionY = topPointCurrent;
     end
    end
   end

  end -- Scrolling Direction
 end -- Animation Style

 -- Clear the temp non stickies table.
 for x = 1, numNonStickies do
  table.remove(activeNonStickies, 1);
 end
end


-- **********************************************************************************
-- This function makes sure stickies don't overlap.
-- **********************************************************************************
function MikSBT.RepositionStickyAnimDisplayInfo(scrollArea)
 -- Construct a table with the sticky animation display info in the same order the events were added.
 for x = scrollArea.NextSticky, NUM_FONT_STRINGS do
  local animDisplayInfo = scrollArea.AnimationDisplayArray[x];
  if (animDisplayInfo.IsActive) then
   table.insert(activeStickies, animDisplayInfo);
  end
 end

 for x = scrollArea.FirstSticky, scrollArea.NextSticky-1 do
  local animDisplayInfo = scrollArea.AnimationDisplayArray[x];
  if (animDisplayInfo.IsActive) then
   table.insert(activeStickies, animDisplayInfo);
  end
 end

 -- Get the number of active stickies.
 local numStickies = table.getn(activeStickies);


 -- Animation style straight, left parabola, or right parabola.
 if (scrollArea.DisplaySettings.AnimationStyle == ANIMATION_STYLE_STRAIGHT or 
     scrollArea.DisplaySettings.AnimationStyle == ANIMATION_STYLE_LEFT_PARABOLA or 
     scrollArea.DisplaySettings.AnimationStyle == ANIMATION_STYLE_RIGHT_PARABOLA) then

  -- Scrolling down.
  if (scrollArea.DisplaySettings.ScrollDirection == SCROLL_DIRECTION_DOWN) then

   -- Check if there is more than 1 active sticky animation.
   if (numStickies > 1) then
    -- Get the middle active sticky.
    local middleSticky = floor((numStickies + 1) / 2);

    -- Set the middle sticky to the center of the scroll area.
    activeStickies[middleSticky].PositionY = scrollArea.DisplaySettings.ScrollHeight / 2;

    -- Loop backwards from the middle sticky.
    for x = middleSticky - 1, 1, -1 do
     activeStickies[x].PositionY = activeStickies[x+1].PositionY - activeStickies[x].FontSize - MIN_VERTICAL_SPACING;
    end

    -- Loop forwards from the middle sticky.
    for x = middleSticky + 1, numStickies do
     activeStickies[x].PositionY = activeStickies[x-1].PositionY + activeStickies[x-1].FontSize + MIN_VERTICAL_SPACING;
    end
   end

  -- Scrolling up.
  else

   -- Check if there is more than 1 active sticky animation.
   if (numStickies > 1) then
    -- Get the middle active sticky.
    local middleSticky = ceil((numStickies + 1) / 2);

    -- Set the middle sticky to the center of the scroll area.
    activeStickies[middleSticky].PositionY = scrollArea.DisplaySettings.ScrollHeight / 2;
   
    -- Loop backwards from the middle sticky.
    for x = middleSticky - 1, 1, -1 do
     activeStickies[x].PositionY = activeStickies[x+1].PositionY + activeStickies[x+1].FontSize + MIN_VERTICAL_SPACING;
    end

    -- Loop forwards from the middle sticky.
    for x = middleSticky + 1, numStickies do
     activeStickies[x].PositionY = activeStickies[x-1].PositionY - activeStickies[x].FontSize - MIN_VERTICAL_SPACING;
    end
   end

  end -- Scrolling Direction
 end -- Animation Style

 -- Clear the temp stickies table.
 for x = 1, numStickies do
  table.remove(activeStickies, 1);
 end
end


-- **********************************************************************************
-- Animates the passed animation display data.
-- **********************************************************************************
function MikSBT.DoAnimation(animDisplayInfo, scrollArea)

 -- Get the current and elapsed times since the last update.
 local currentTime = GetTime();
 local elapsedTime = currentTime - animDisplayInfo.LastUpdated;

 -- Check if it's a sticky or a crit and sticky crits are enabled.
 if (animDisplayInfo.IsSticky or (animDisplayInfo.IsCrit and MikSBT.CurrentProfile.UseStickyCrits)) then
  -- Move the sticky in case it was repositioned.
  animDisplayInfo.FontObject:SetPoint(animDisplayInfo.AnchorPoint, animDisplayInfo.PositionX, animDisplayInfo.PositionY);

  if (elapsedTime <= STICKY_FADE_IN_TIME) then
   local textDelta = animDisplayInfo.FontSize * (1 - (elapsedTime / STICKY_FADE_IN_TIME));
   animDisplayInfo.FontObject:SetTextHeight(animDisplayInfo.FontSize + textDelta);
   animDisplayInfo.FontObject:SetAlpha(1);
   if animDisplayInfo.Texture then
	animDisplayInfo.Texture:SetAlpha(1);
	animDisplayInfo.Texture:SetWidth(animDisplayInfo.FontSize + textDelta);
    animDisplayInfo.Texture:SetHeight(animDisplayInfo.FontSize + textDelta);
  end
   return;
  elseif (elapsedTime <= (STICKY_DISPLAY_TIME + STICKY_FADE_IN_TIME)) then
   animDisplayInfo.FontObject:SetTextHeight(animDisplayInfo.FontSize);
   if animDisplayInfo.Texture then
	animDisplayInfo.Texture:SetWidth(animDisplayInfo.FontSize);
    animDisplayInfo.Texture:SetHeight(animDisplayInfo.FontSize);
  end
     if animDisplayInfo.IsCrit then
	  if not animDisplayInfo.timeLastJiggled then
			animDisplayInfo.originalPositionX = animDisplayInfo.PositionX
			animDisplayInfo.originalPositionY = animDisplayInfo.PositionY
			animDisplayInfo.DecalageX = 0
			animDisplayInfo.DecalageY = 0
			animDisplayInfo.timeLastJiggled = 0
	   end
	   if animDisplayInfo.PositionY ~= (animDisplayInfo.originalPositionY + animDisplayInfo.DecalageY) then
			animDisplayInfo.originalPositionX = animDisplayInfo.PositionX
			animDisplayInfo.originalPositionY = animDisplayInfo.PositionY
	   end
	   if (elapsedTime - animDisplayInfo.timeLastJiggled > 0.05) then
	   animDisplayInfo.DecalageX = math.ceil(math.random(-1, 1));
	   animDisplayInfo.DecalageY = math.ceil(math.random(-1, 1));
	   animDisplayInfo.PositionX = animDisplayInfo.originalPositionX + animDisplayInfo.DecalageX;
	   animDisplayInfo.PositionY = animDisplayInfo.originalPositionY + animDisplayInfo.DecalageY;
	   animDisplayInfo.timeLastJiggled = elapsedTime;
	   animDisplayInfo.FontObject:SetPoint(animDisplayInfo.AnchorPoint, animDisplayInfo.PositionX, animDisplayInfo.PositionY);
	  end
  end
   return;
  elseif (elapsedTime <= (STICKY_DISPLAY_TIME + STICKY_FADE_IN_TIME + STICKY_FADE_OUT_TIME)) then
   local alpha = 1 - ((elapsedTime - STICKY_DISPLAY_TIME - STICKY_FADE_IN_TIME) / STICKY_FADE_OUT_TIME);
   animDisplayInfo.timeLastJiggled = nil
   animDisplayInfo.FontObject:SetAlpha(alpha);
   if animDisplayInfo.Texture then
	animDisplayInfo.Texture:SetAlpha(alpha);
  end
   return;
  end

  -- Deactivate the animation.
  animDisplayInfo.FontObject:SetAlpha(0);
  if animDisplayInfo.Texture then
	animDisplayInfo.Texture:SetAlpha(0);
  end
  animDisplayInfo.IsActive = false;

  return;
 end


 -- Check if it's time to update.
 if (elapsedTime > ANIMATION_SPEED) then
  -- Scroll the text and set its alpha appropriately.
  local animationComplete = animDisplayInfo.ScrollFunction(animDisplayInfo, scrollArea);


  -- Check if the animation is complete.
  if (animationComplete) then
   -- Set the font object's alpha.
   animDisplayInfo.FontObject:SetAlpha(0);
   if animDisplayInfo.Texture then
	animDisplayInfo.Texture:SetAlpha(0);
   end

   -- Deactive the animation.
   animDisplayInfo.IsActive = false;
  else
   -- Move the font object and set its alpha.
   animDisplayInfo.FontObject:SetPoint(animDisplayInfo.AnchorPoint, animDisplayInfo.PositionX, animDisplayInfo.PositionY);
   animDisplayInfo.FontObject:SetAlpha(animDisplayInfo.Alpha);
   if animDisplayInfo.Texture then
	animDisplayInfo.Texture:SetAlpha(animDisplayInfo.Alpha);
   end
  end

  -- Set the last update to the current time.
  animDisplayInfo.LastUpdated = currentTime;
 end -- Time for update.
end


-- **********************************************************************************
-- Moves the passed animation display info upward and fades the alpha correctly.
-- Returns true when the animation is complete.
-- **********************************************************************************
function MikSBT.ScrollUp(animDisplayInfo, scrollArea)
 -- Calculate the animation midpoint.
 local animationMidPoint = scrollArea.DisplaySettings.ScrollHeight / 2;

 -- Increment the Y position by the step.
 animDisplayInfo.PositionY = animDisplayInfo.PositionY + MikSBT.CurrentProfile.AnimationStep;

 -- Start fading out the text on the upper half.
 if (animDisplayInfo.PositionY >= animationMidPoint) then
  animDisplayInfo.Alpha = 1 - ((animDisplayInfo.PositionY - animationMidPoint) / animationMidPoint);
 else
  animDisplayInfo.Alpha = 1;
 end

 -- Check if the animation is complete.
 if (animDisplayInfo.PositionY >= scrollArea.DisplaySettings.ScrollHeight) then
  -- Return true to indicated the animation is complete.
  return true;
 end

 -- Return false to indicate the animation is NOT complete.
 return false;
end


-- **********************************************************************************
-- Moves the passed animation display info downward and fades the alpha correctly.
-- Returns true when the animation is complete.
-- **********************************************************************************
function MikSBT.ScrollDown(animDisplayInfo, scrollArea)
 -- Calculate the animation midpoint.
 local animationMidPoint = scrollArea.DisplaySettings.ScrollHeight / 2;

 -- Decrement the Y position by the step.
 animDisplayInfo.PositionY = animDisplayInfo.PositionY - MikSBT.CurrentProfile.AnimationStep;

 -- Start fading out the text on the bottom half.
 if (animDisplayInfo.PositionY < animationMidPoint) then
  animDisplayInfo.Alpha = 1 - ((animationMidPoint - animDisplayInfo.PositionY) / animationMidPoint);
 else
  animDisplayInfo.Alpha = 1;
 end

 -- Check if the animation is complete.
 if (animDisplayInfo.PositionY <= 0) then
  -- Return true to indicated the animation is complete.
  return true;
 end

 -- Return false to indicate the animation is NOT complete.
 return false;
end


-- **********************************************************************************
-- Moves the passed animation display info straight up. Returns true when the
-- animation is complete.
-- **********************************************************************************
function MikSBT.ScrollStraightUp(animDisplayInfo, scrollArea)
 -- Returns the result of the scroll up function.
 return MikSBT.ScrollUp(animDisplayInfo, scrollArea);
end


-- **********************************************************************************
-- Moves the passed animation display info straight down.  Returns true when the
-- animation is complete.
-- **********************************************************************************
function MikSBT.ScrollStraightDown(animDisplayInfo, scrollArea)
 -- Returns the result of the scroll down function.
 return MikSBT.ScrollDown(animDisplayInfo, scrollArea);
end


-- **********************************************************************************
-- Moves the passed animation display info in a left parabolic shape going upwards.
-- Returns true when the animation is complete.
-- **********************************************************************************
function MikSBT.ScrollLeftParabolaUp(animDisplayInfo, scrollArea)
 -- Scroll the animation display info straight up and set the alpha correctly.
 local animationComplete = MikSBT.ScrollUp(animDisplayInfo, scrollArea);

 -- Calculate the animation midpoint.
 local animationMidPoint = scrollArea.DisplaySettings.ScrollHeight / 2;

 -- Calculate the new x position based on equation of a parabola.
 -- Equation of a parabola at vertex 0,0: x = y^2 / 4a
 local parabolaMaxX = ceil((animationMidPoint * animationMidPoint) / (4 * animationMidPoint));
 local parabolaY = animDisplayInfo.PositionY - animationMidPoint;
 local newX = parabolaMaxX - ceil((parabolaY * parabolaY) / (4 * animationMidPoint));

 -- Set the new x position.
 animDisplayInfo.PositionX = newX * -1;

 -- Return whether or not the animation is complete.
 return animationComplete;
end


-- **********************************************************************************
-- Moves the passed animation display info in a left parabolic shape going downwards.
-- Returns true when the animation is complete.
-- **********************************************************************************
function MikSBT.ScrollLeftParabolaDown(animDisplayInfo, scrollArea)
 -- Scroll the animation display info straight up and set the alpha correctly.
 local animationComplete = MikSBT.ScrollDown(animDisplayInfo, scrollArea);

 -- Calculate the animation midpoint.
 local animationMidPoint = scrollArea.DisplaySettings.ScrollHeight / 2;

 -- Calculate the new x position based on equation of a parabola.
 -- Equation of a parabola at vertex 0,0: x = y^2 / 4a
 local parabolaMaxX = ceil((animationMidPoint * animationMidPoint) / (4 * animationMidPoint));
 local parabolaY = animDisplayInfo.PositionY - animationMidPoint;
 local newX = parabolaMaxX - ceil((parabolaY * parabolaY) / (4 * animationMidPoint));

 -- Set the new x position.
 animDisplayInfo.PositionX = newX * -1;

 -- Return whether or not the animation is complete.
 return animationComplete;
end


-- **********************************************************************************
-- Moves the passed animation display info in a right parabolic shape going upwards.
-- Returns true when the animation is complete.
-- **********************************************************************************
function MikSBT.ScrollRightParabolaUp(animDisplayInfo, scrollArea)
 -- Scroll the animation display info straight up and set the alpha correctly.
 local animationComplete = MikSBT.ScrollUp(animDisplayInfo, scrollArea);

 -- Calculate the animation midpoint.
 local animationMidPoint = scrollArea.DisplaySettings.ScrollHeight / 2;

 -- Calculate the new x position based on equation of a parabola.
 -- Equation of a parabola at vertex 0,0: x = y^2 / 4a
 local parabolaMaxX = ceil((animationMidPoint * animationMidPoint) / (4 * animationMidPoint));
 local parabolaY = animDisplayInfo.PositionY - animationMidPoint;
 local newX = parabolaMaxX - ceil((parabolaY * parabolaY) / (4 * animationMidPoint));

 -- Set the new x position.
 animDisplayInfo.PositionX = newX;

 -- Return whether or not the animation is complete.
 return animationComplete;
end


-- **********************************************************************************
-- Moves the passed animation display info in a right parabolic shape going downwards.
-- Returns true when the animation is complete.
-- **********************************************************************************
function MikSBT.ScrollRightParabolaDown(animDisplayInfo, scrollArea)
 -- Scroll the animation display info straight up and set the alpha correctly.
 local animationComplete = MikSBT.ScrollDown(animDisplayInfo, scrollArea);

 -- Calculate the animation midpoint.
 local animationMidPoint = scrollArea.DisplaySettings.ScrollHeight / 2;

 -- Calculate the new x position based on equation of a parabola.
 -- Equation of a parabola at vertex 0,0: x = y^2 / 4a
 local parabolaMaxX = ceil((animationMidPoint * animationMidPoint) / (4 * animationMidPoint));
 local parabolaY = animDisplayInfo.PositionY - animationMidPoint;
 local newX = parabolaMaxX - ceil((parabolaY * parabolaY) / (4 * animationMidPoint));

 -- Set the new x position.
 animDisplayInfo.PositionX = newX;

 -- Return whether or not the animation is complete.
 return animationComplete;
end


-------------------------------------------------------------------------------------
-- Command handler functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Returns the current and remaining parameters from the passed string.
-- **********************************************************************************
function MikSBT.GetNextParameter(paramString)
 local remainingParams;
 local currentParam = paramString;

 -- Look for a space.
 local idx = string.find(paramString, " ");

 if (idx) then
  -- Get the current and remaing parameters.
  currentParam = string.sub(paramString, 1, idx-1);
  remainingParams = string.sub(paramString, idx+1);
 end

 -- Return the current parameter and the remaining ones.
 return currentParam, remainingParams;
end


-- **********************************************************************************
-- Called to handle commands.
-- **********************************************************************************
function MikSBT.CommandHandler(params)
 -- Get the parameter.
 local currentParam;
 local remainingParams;
 currentParam, remainingParams = MikSBT.GetNextParameter(params);

 -- Flag for whether or not to show usage info.
 local showUsage = true;

 -- Make sure there is a current parameter and lower case it.
 if (currentParam) then
  currentParam = string.lower(currentParam);
 end

 -- Look for the recognized parameters.
 if (currentParam == "") then
  -- Check if the load on demand options are not loaded.
  if (not IsAddOnLoaded(MikSBT.MOD_NAME .. "Options")) then
   -- Load the on demand options.
   UIParentLoadAddOn(MikSBT.MOD_NAME .. "Options");
  end

  -- Make sure the on demand options actually loaded.
  if (IsAddOnLoaded(MikSBT.MOD_NAME .. "Options")) then
   -- Make sure the scroll area mover control frame is not shown.
   if (not MSBTScrollAreaMoverControlFrame:IsShown()) then
    -- Show the options interface.
    MSBTFrameOptions:Show();
   end
  end

  -- Don't show the usage info.
  showUsage = false;

 elseif (currentParam == MikSBT.COMMAND_RESET) then
  -- Reset the current profile.
  MikSBT.ResetProfile(MikSBT_Save.CurrentProfile, true);

  -- Don't show the usage info.
  showUsage = false;

 elseif (currentParam == MikSBT.COMMAND_DISABLE) then
  -- Set the user disabled option.
  MikSBT.SetOptionUserDisabled(true);

  -- Output an informative message.
  MikSBT.Print(MikSBT.MSG_DISABLE, 1,1,1);

  -- Don't show the usage info.
  showUsage = false;

 elseif (currentParam == MikSBT.COMMAND_ENABLE) then
  -- Unset the user disabled option.
  MikSBT.SetOptionUserDisabled(false);

  -- Output an informative message.
  MikSBT.Print(MikSBT.MSG_ENABLE, 1,1,1);

  -- Don't show the usage info.
  showUsage = false;

 elseif (currentParam == MikSBT.COMMAND_SHOWVER) then
  -- Output the current version number.
  MikSBT.Print(MikSBT.VERSION_STRING, 1,1,1);

  -- Don't show the usage info.
  showUsage = false;

 elseif (currentParam == MikSBT.COMMAND_STATS) then
  -- Print out stats about the event recycler.
  eventsRecycler:PrintStats();

  -- Don't show the usage info.
  showUsage = false;

 elseif (currentParam == MikSBT.COMMAND_SEARCH) then
  -- Check if there is any filter text
  if (remainingParams and remainingParams ~= "") then
   -- Turn on event searching mode.
   MikCEH.EnableEventSearching(remainingParams);
   MikSBT.Print(MikSBT.MSG_SEARCH_ENABLE .. remainingParams, 1, 1, 1);
  else
   -- Turn off event searching mode.
   MikCEH.DisableEventSearching();
   MikSBT.Print(MikSBT.MSG_SEARCH_DISABLE, 1, 1, 1);
  end

  -- Don't show the usage info.
  showUsage = false;

 elseif (currentParam == MikSBT.COMMAND_DEBUG) then
  -- Toggle the debug mode option.
  debugMode = not debugMode;

  -- Check if debug mode was enabled or disabled and output the appropriate message.
  if (debugMode) then
   MikSBT.Print(MikSBT.MSG_DEBUG_ENABLE, 1,1,1);
  else
   MikSBT.Print(MikSBT.MSG_DEBUG_DISABLE, 1,1,1);
  end  

  -- Don't show the usage info.
  showUsage = false;

 end

 -- Check if the usage information should be shown.
 if (showUsage) then
  MikSBT.PrintUsage();
 end
end


-- **********************************************************************************
-- Prints out the usage information.
-- **********************************************************************************
function MikSBT.PrintUsage()
 -- Loop through all of the entries in the command usage list.
 for _, msg in MikSBT.COMMAND_USAGE do
  MikSBT.Print(msg, 1, 1, 1);
 end
end



-------------------------------------------------------------------------------------
-- Public Access functions.
-------------------------------------------------------------------------------------

-- **********************************************************************************
-- Displays the passed message in the passed scroll area with the passed parameters.
-- This function is for easy displaying of messages from external sources.
-- **********************************************************************************
function MikSBT.DisplayMessage(message, displayType, isSticky, colorR, colorG, colorB, fontSize, fontIndex, outlineIndex, Texture)
 -- Check if no message was passed and do nothing.
 if (message == nil) then
  return;
 end

 -- Check if the passed display type is invalid..
 if (displayType ~= MikSBT.DISPLAYTYPE_INCOMING and displayType ~= MikSBT.DISPLAYTYPE_OUTGOING and
     displayType ~= MikSBT.DISPLAYTYPE_NOTIFICATION) then

  -- Set the display type to the default.
  displayType = MikSBT.DISPLAYTYPE_NOTIFICATION;
 end

 -- Get the correct scroll area for the event.
 local scrollArea;
 if (displayType == MikSBT.DISPLAYTYPE_INCOMING) then
  scrollArea = scrollAreas.Incoming;  
 elseif (displayType == MikSBT.DISPLAYTYPE_OUTGOING) then
  scrollArea = scrollAreas.Outgoing;
 elseif (displayType == MikSBT.DISPLAYTYPE_NOTIFICATION) then
  scrollArea = scrollAreas.Notification;
 end

 -- Check if the scroll area is hiding events.
 if (not scrollArea.DisplaySettings.Show) then
  return;
 end

 -- Check if the red color value is invalid.
 if (colorR == nil or colorR < 0 or colorR > 255) then
  -- Set the red color value to the default.
  colorR = 255;
 end

 -- Check if the green color value is invalid.
 if (colorG == nil or colorG < 0 or  colorG > 255) then
  -- Set the green color value to the default.
  colorG = 255;
 end

 -- Check if the blue color value is invalid.
 if (colorB == nil or colorB < 0 or  colorB > 255) then
  -- Set the blue color value to the default.
  colorB = 255;
 end

 -- Check if the font size is invalid.
 if (fontSize == nil or fontSize < 12 or fontSize > 32) then
  fontSize = MikSBT.GetFontSize(scrollArea, nil, false);
 end

 local fontPath;
 -- Check if the font index in invalid.
 if (fontIndex == nil or MikSBT.AVAILABLE_FONTS[fontIndex] == nil) then
  fontPath = MikSBT.GetFontPath(scrollArea, nil, false);
 -- Font index is valid.
 else
  fontPath = MikSBT.AVAILABLE_FONTS[fontIndex].Path;
 end

 local fontOutline;
 -- Check if the outline index in invalid.
 if (outlineIndex == nil or MikSBT.AVAILABLE_OUTLINES[outlineIndex] == nil) then
  fontOutline = MikSBT.GetFontOutline(scrollArea, nil, false);
 else
  fontOutline = MikSBT.AVAILABLE_OUTLINES[outlineIndex].Style;
 end


 -- Get a recycled table from the events recycler object.
 local animationEvent = eventsRecycler:AcquireTable();

 -- Populate the animation event data.
 animationEvent.ScrollArea = scrollArea;
 animationEvent.IsCrit = false;
 animationEvent.IsSticky = isSticky;
 animationEvent.Text = message;
 animationEvent.FontSize = fontSize;
 animationEvent.FontPath = fontPath;
 animationEvent.FontOutline = fontOutline;
 animationEvent.ColorR = colorR;
 animationEvent.ColorG = colorG;
 animationEvent.ColorB = colorB;
 animationEvent.Texture = Texture;


 -- Add the event to the animation system.
 MikSBT.AddAnimation(animationEvent);
end