MobHealth3!
    "Man, this mofo lasts forever!" "Dude, it only has 700hp and you're a paladin -_-"

MobHealth3 is a mod that calculates hostile monster and player HP, funnily enough.

Slash command: /mobhealth3 or /mh3 (For the MH3BlizzFrames, /mh3b or /mh3blizz)

Features:

New algorithm! - Faster and cleaner, and has decaying average functionality (It deals with stuff like how a player's max HP varies from battle to battle) - Thanks Mikk!

Saved Variables are OPTIONAL! - It's not really needed because it's trivial to recalculate a target's HP, but the option to save across sessions is there if you want it (MH3 always keeps a cache of things you fight that session)

Lightweight! - Estimated memory usage with no data is roughly 20-25kb (Don't give me Warmup numbers. It's very inaccurate)

No Dependency! - Embedded library technology means no dependency!

Blizzard/Default Unit Frame Support is a separate mod - If you don't use a custom unit frame mod, you should install MobHealth3_BlizzardFrames

Variable precision! - It's as accurate as YOU want it to be!

Fully Backwards-Compatible with MobHealth/MobHealth2/Mobinfo2! - Works with many, many unit frame mods out of the box!

NEW Clean, Developer-Friendly API! - Documentation at http://wiki.wowace.com/index.php/MobHealth3_API_Documentation

No Pet/Player Conflicts! - Ignores player pets, preventin pets with the same name as players from conflicting and causing weird problems!

Smaller Database! - If you choose to save data across sessions

It Just Works! - MH3 works regardless of the order event handlers are executed

FAQ:

Q. What is MobHealth3_BlizzardFrames?
As I explained above, it displays info from MobHealth3 on Blizzard's default unit frames.

Q. Does this convert MobHealth/MobHealth2 data?
A. Yes. MH3 does this automatically.

Q. Does this convert MobInfo-2 data?
A. Yes, but you need to rename your MobInfo2.lua in /WTF/Account/<Your account name>/SavedVariables to MobHealth.lua

Q. What is the precision option?
A. When fighting an enemy MH3 hasn't seen, the precision is how many percents MH3 needs to see the mob lose before it trusts the value it has estimated and allows it to be displayed. The default is 10.
The lower the precision, the earlier you will see the values, but the less accurate the initial value will be
Raiding players may want to turn it down a notch.
If you're really impatient and don't care about accuracy, set it to 1.

Q. Why is it called MobHealth3?
A. It was very, very loosely based on MobHealth2 by Wyv, which is in turn based on Telo's MobHealth. MH3 was rewritten 3 times before release and this latest incarnation has no trace of M2 left, but the name was familliar with my peers already so I say no need to change it.

Q. I'm an addon author. Why should my mod support the new MobHealth3 API when there's compatibility with MH/MH2/MI2?
A. The new API is faster, cleaner and more developer friendly. See the docs for details (http://wiki.wowace.com/index.php/MobHealth3_API_Documentation)

Q. OMGWTF WARMUP NUMBERS HUEG!!!!
A. Warmup is inaccurate. Tekkub, its author, knows this and is currently working on a way to get more accurate info

Q. Are you a monkey?
A. As a human, I'm a technically a subclass of monkey, so yes *rolleyes*

Q. You suck! Go Reproduce!
A. With pleasure:
Neronix = AceOO.Class(Monkey)
while true do Neronix:new() end