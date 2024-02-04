CALL OF ELEMENTS v2.8
by Wyverex
supported by laytya @ git

This is an All-In-One Shaman class addon for World Of Warcraft.
Currently, it features a complete totem module to simplify totem usage
and increase your efficiency in party and in PVP.
Yet to come are a healing module and some miscellanous options that
help with different tasks.

The totem module provides you with customizable frames that hold all
of your totems separated by element and work just like a standard action bars. 
In addition, each totem has its own timer that displays how long the totem 
will still be active. When there are only 10 or 5 seconds left or when
the totem expires, a notification is shown in the screen center.
Furthermore you are able to create your own totem sets which hold a totem
of each element that can be cast using only one command or button. 
There is also one predefined set for each class that is automatically 
activated in pvp when you target a hostile player of the corresponding class. 

Also in development is the healing module that helps conserving mana
and healing the right group member at the right time more efficiently 
than doing this manually.


CONTACT
================
http://coe.wyverex-cave.net

coe@wyverex-cave.net

"Grimhoof" on "Kult der Verdammten" (German RP-PVP Server)


KNOWN ISSUES
================

Since this addon is still under construction and I am currently testing with
a level 35 shaman, I don't rule out that I have forgotten one or the other
special case that occurs first with higher levels.

At least I know that there is a trinket that also throws a totem.
This trinket will not display a timer or use some other totem bar option
until I have access to it and can test it.

Also, the totem advisor will advise the tremor totem only for few
spell effects yet. See the next section


Things YOU can help me with
==============================
I still need help with the following issues:

- Totem advisor
The tremor totem counters fear, charm and sleep effects but, unfortunately,
I have no complete list of all spells that can be countered. The 
currently very short list known to me is shown below. 
If you come across another effect that can be countered by the tremor totem, 
please contact me.

"Sleep", "Terrify", "Psychic Scream", "Mind Control", "Bellowing Roar", "Fear",
"Intimidating Shout", "Panic", "Terrifying Screech", "Seduction",
"Howl of Terror", "Intimidating Growl", "Crystalline Slumber", "Druid's Slumber"

Furthermore, I need the German translations since I only have the english client.


THINGS YET TO COME
==============================

This is a list of features that came to my mind yet. Presumably
there will come more ;-)

- Healing module
Possibly, the healing module will be enhanced in numerous ways
It's very basic at the moment


INSTALLATION
================

Just unzip the CallOfElements folder and the Chronos folder 
to your Interface\AddOns\ directory and restart WOW. 
It should automatically be loaded when you log into the game.

Note, that COE needs the Chronos addon for all timer functionality and
won't work without it.

Also note, that COE does only really load for shaman classes, since it offers
no use for the other classes. An appropriate message is displayed in this case.


To display the configuration dialog and configure COE, you can either:
- add a key binding or
- use the /coe slash command or



TOTEM MODULE
=================

Totem Bars
------------
There is one totem bar for each totem element you possess which can be Earth, Fire, 
Water and Air. Each totem bar is fully customizable on its own and holds a number of
totem buttons which work just like standard action bar buttons complete with cooldown and 
usability/out-of-mana display. In addition, if totem timers are activated, each
button shows the time left for its totem, if active. 
The bar itself centers around a so-called "anchor button" or "anchor totem". 
Which of your totems is taken as the anchor totem for each element is either your 
choice ("Customize"), the (last) active totem ("Timers Only") or the member of the 
active set ("Active Set").
   
The bar extends from the anchor button in the direction you choose (Up, Down, Left, Right).
Furthermore, with the bar mode you can control whether only the anchor button ("Closed")
or all configured totems ("Open") should be shown. If you choose the "Flex" mode, only
the anchor button is shown until you mouse over it which will temporarily show all
other totems as well and hide them again after a short delay when the mouse leaves.
By setting the static button count to a value of greater than one, you can also have
a mix of the "Open" and the "Flex" mode, showing a number of totems by default and the
rest when mousing over.
Finally, you can also hide the whole element bar by setting "Hidden" as the bar mode.
  
You can customize which totems should actually be displayed, by clicking
on the "Configure Bar" button. While in bar configuration mode,
the totem bar will show all available totems. Just click on a totem to toggle its visibility. 
Visible totems will have a green border around them while in configuration mode.
The anchor totem is always shown, though, thus removing it from the bar while in 
"Configure Bar" mode has no effect as long as it is the anchor totem.
Upon leaving the configuration mode, the last bar mode will be restored. 

Apart from customizing which totems to display, you can also change the ordering of
the totems for each bar separately. Just click on the "Configure Order" button 
and swap two totems of the same element by clicking them one after the other. 
You cannot swap totems of different elements, though.
The configured totem order is retained whenever possible, that is, when a totem becomes the
anchor totem, e.g. by switching the active set in "Active Set" mode, it is now the first
totem in the bar but all other totems retain their relative ordering.

Also note that while in "Flex" or "Closed" mode, active and advised totems and totems
with an active cooldown will be temporarily docked to the bar just as if you were mousing 
over the bar. Those totems will also be shown first in the bar if you mouse over the
bar independent of their actual ordering. This makes re-throwing them easier.

You can also set the tooltip alignment to prevent partially hidden tooltips 
depending on where you position the totem bar on your screen or disable them at all.

If you want to throw the rank 1 totem instead of the maximum rank, you can assign a 
key modifier in the configuration dialog and hold down this modifier while clicking 
the desired button. Note, that this only works when clicking a totem.

While holding down the Shift key you can also pickup a totem and drag it one of your
standard action buttons. When additionally holding down the Ctrl key, you will pickup
the corresponding rank 1 totem.

When pressing the CTRL-key while clicking a totem button, this totem replaces
the anchor totem for this element if it isn't already the anchor totem and
you have the Customize or Active Set mode activated. Furthermore, in Active Set
mode, it will also make the clicked totem part of the current set.


Totem Advisor
----------------
Tired of constantly checking your party member's and pets' debuffs for poison, diseases and
other effects that can be countered by your tremor totem? Then enable the
totem advisor and you will be notified when one of your party members has a
debuff that you are able to cure with one of your totems!
The notification will be displayed in the center of the screen and will be
periodically redisplayed until the debuffs are cured (either by a cure spell/totem
or by timing out). Additionally, the corresponding totem button will flash.

To throw the advised totem you can either use your preferred method of throwing
totems or you can use the "Throw next advised totem" key binding which automatically
figures out if there is any advised totem and throws it.
Or create a macro with the slash command "/coe advised" and drag it onto one of your
action buttons.


Totem Timers
----------------
Each totem button has its own timer that is displayed when the associated totem
is active. The timer shows the time in seconds that the totem remains active if
it isn't destroyed before.
When there are only 10 or 5 seconds left, respectively, a notification is shown in
the screen center, if you chose to enable this option. This helps you to plan
the next totem ahead in time.
When a totem expires or is destroyed by an enemy, there is also a notification.

Totems with a cooldown display it in red digits when their timer is no longer 
active but they are still cooling down. This should give you more exact information 
on when you can cast the totem again than the default cooldown texture.


Totem Sets
----------------
In most situations you throw the same totems over and over again, e.g. Stoneskin
and Healing Stream when facing more than one mob at the same time. So why should
you repeat the same steps all over again if they can be automated? This is why
there are totem sets.
A totem set consists of up to four totems, one of each element, that can be thrown
in any desired order using just one action button or key binding. Just press the
key once for each totem, COE will take care of which totem to throw automatically.
To conserve mana, it will only throw totems that aren't active yet. If the totem that
would be thrown next is still in cooldown, COE will skip to the next totem.

You can restart casting of the active set at any time though.
Either assign a key binding or create a macro with the command "/coe restartset"
or "/coe reset". The latter one also resets the timers.

There are 10 predefined totem sets: one default set and 9 PVP class sets, one for each
available player class. In addition, you can create your own custom named sets for
every situation you can think of.
To configure a set, make it the active set by using the drop down menu in the configuration
dialog and the click the "Configure Set" button. While in set configuration mode,
the totem bars will show all available totems. Just click on a totem to add it to the set
or remove it. Note, that you can only have one totem per element per set.
Upon leaving the configuration mode, the last display mode will be restored. 
Finally, you can adjust the order in which the totems will be thrown for this set.

If you enabled the "Autoswitch sets in PVP" option and target an enemy player,
COE will automatically switch to the set corresponding to this player's class because
you usually use different totems when fighting different classes. This should
improve your PVP efficiency since you don't have to worry much about which totems
to throw if you have them preconfigured and just use the key binding for set throwing.
As soon as you target a PVE mob, it will switch back to the last active non-PVP set again.

If you target a hostile unit, and you have a custom set configured that has exactly the
same name as that unit, COE will activate that set. This makes it possible to create
sets for specific encounters (e.g. a "Nefarian" set). Note, that the test is case-sensitive,
though.

There is also the "Activate next totem set" key binding which switches between the
default set and your custom sets and thus provides a fast method to switch between sets.

Note, that there are also slash commands available to use as macros for your action
bars if you desire:
"/coe throwset" throws the active set
"/coe priorset" switches to the prior set
"/coe nextset" switches to the next set
"/coe set <name>" switches to the set with the specified name. Note that <name> is case-sensitive.
"/coe restartset" restarts the active set


HEALING MODULE
=================

COE also helps you with healing your party and raid. Instead of manually selecting a 
target and the right healing spell, just assign a key binding for the battle and best heal
and press the key.
COE will heal the party or raid member with the lowest health ratio using the most 
appropriate spell. Depending on which healing mode you triggered, the spell selection
will be different: 

Battle Heal
--------------
When hitting the battle heal key, COE will target the party member with the
lowest health ratio and heal him with the most appropriate spell using as 
less casting time as possible (which always results in using the Lesser
Healing Wave actually)
It will only use the rank it really needs and thus helps conserving mana
	
Best Heal
--------------
Works just like battle heal but also uses the Healing Wave if it has a better
mana/effect efficiency. So, outside of combat, use best heal and when in combat
use battle heal if healing must be quick or you are in danger of losing casting time
	

COMPLETE LIST OF COMMANDS
==========================
/coe
/coe config
- shows the config dialog

/coe list
- shows the list of slash commands

/coe priorset
- switches to the prior set

/coe nextset
- switches to the next set

/coe set <name>
- switches to the set with the specified name. Note that <name> is case-sensitive

/coe restartset
- restarts the active set

/coe reset
- resets all timers and the active set

/coe reload
- reloads all totems and sets

/coe resetframes
- returns all element bars to the screen center

/coe resetordering
- resets the ordering of your totem bars

The next commands only work as macros dragged to one of your
action buttons, since Blizzard prevents spells being cast
from the command line:

/coe throwset
- throws the active set

/coe advised
- throws the next advised totem


CREDITS
=================
I would like to thank the authors of the following addons for providing me
with some of my ideas through their own addons. Actually I took their ideas
and refined them into an all-in-one addon and made it smooth at one or the other
edge ;-)

- Totem Timers
- Frowning Circle
- Totem Menu
- Gypsy Mod
- CTRaid
- Healer / Nuker

And a special thanks to the authors of Chronos since COE relies heavily on the
accurate timing functions of Chronos.

Last but certainly not least, I'd like to thank all the people using COE and
giving me feedback. A mod can only evolve and get better when being supported 
by the community. 
Thank You!
