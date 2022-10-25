# TWThreat v1.2.3
Threat Meter for Turtle WoW
<br>
Requirements: in `party` or `raid`, attacking `elite` creatures or `bosses`.
<br>
## Changes

### v1.2.3
- Fixes for TW patch 16.0

### v1.2.2
- Bar animation fixes.
- TankName bug fix.
- Configurable aggro warning threshold.

### v1.2.1
- Scale TankMode window with main window.

### v1.2.0
- Threat api v4, older versions don't work anymore.
- [pfUI](https://github.com/shagu/pfUI) integration for target frame glow and threat percentage.
- tankMode is back !
- New threat warning sound.
- New icons for settings/lock/close buttons.


### v1.1.0
- Threat api v3, older versions don't work anymore.
- Summoned creatures show the right threat values.
- Settings for in and out of combat frame opacity.


### v1.0.2
- Revamped settings window with tabs.
- New setting: frame scale.
- Enabled bar animation.
- Disabled Tankmode (still buggy).

### v1.0.1
- Faster way to get guid
- Tankmode window is now movable and stickable to top/bottom/left/right of main window.
- Tankmode window has test data in config mode.
- Better colors for Tankmode targets and current target is highlighted.
- Window title is more stable for healers.
- Removed bar animation (maybe only temporary).
- Clear bars if creature dies, for healers.
- Fix potential bug where Pull Agro At bar was not shown.
- Fix tankthreat bug when tank is not top in threat list.

## Features
- Threat, threat to pull aggro, TPS, % Max, % to pull
- Target glow based on threat for default game target frame
- Target threat percent indicator for default game target frame
- Various options including bar height and font style
- Full Screen Glow on high threat percentage
- Aggro Warning Sound on high threat percentage
- Customizable labels for TPS, Threat, Percent Max
- Tankmode !

## Slashcommands
- `/twtshow`
- `/twt show` 
- `/twt tankmode`

## Settings
![settings](https://imgur.com/xBUdh2C.png)
![settings](https://imgur.com/MNdyp7w.png)
![settings](https://imgur.com/IT9wFXp.png)

### Glow
Shows a colored aura ranging from Green/Yellow/Red on the Default UI's unit frame.<br>
The color of the aura is based on your current threat threshold:<br>
- green - yellow for 0% - 49%<Br>
- yellow - red for 50% - 100%<br>

![glow](https://imgur.com/7rZt20N.png)
<br>

### Full Screen Glow
Red glowing screen edges when your threat is above 80%.<Br>
This feature is disabled in Tank Mode.<br>
<br>

### Aggro Warning Sound
Plays a warning sound when you reach 99% threat.<br>
This feature is disabled in Tank Mode.<br>
<br>

### Percentages
Shows threat percentages on the default target frame.<Br>
![percentages](https://imgur.com/jTlY6Gj.png)
<br>

### Combat Show
Automatically shows the window when combat begins.<br>
<br>

### Combat Hide
Automatically hides the window when combat begins.<br>
<br>

### Tank Mode
Shows an additional window with targets that you are currently tanking and the name and threat
percent of the next player in threat list for quick target swap (this mode disables
Full Screen Glow and Aggro Warning Sound).<br><br>
![tankmode](https://imgur.com/3eR28Zp.png)
<br>

### Show Name/TPS/Threat/% Max Label Row
Shows or hides the row above the threat bars.
<br>

### Show TPS Column
Shows or hides the TPS column.
<br>

### Show Threat Column
Shows or hides the Threat column.
<br>

### Show Percent Column
Shows or hides the Percent Max column.
<br>


## Contributors and testers
[Henry](https://armory.turtle-wow.org/#!/character/Henry), [Laughadin](https://armory.turtle-wow.org/#!/character/Laughadin), 
[Faralynn](https://armory.turtle-wow.org/#!/character/Faralynn), [Draxer](https://armory.turtle-wow.org/#!/character/Draxer) <BR><BR>

## Support
If you like my work consider buying me a coffee !<br>
https://ko-fi.com/xerron

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://paypal.me/xerroner)
