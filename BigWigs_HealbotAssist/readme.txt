Big Wigs Healbot Assist
Strategy module for the Loatheb encounter in Naxxramas.

Healbot Assist gives the raid healing leader a list of all the healers in the
raid in a prioritized order inside a tablet display.

Here is how it works:

1. The mod enables, the first and second person will get whispers to just
   heal when they are ready.
2. First healer heals -> second healer gets "Heal now!" whisper, third healer
   gets "Get ready!".
3. Second healer heals -> third healer gets "Heal now!" whisper, fourth
   healer gets "Get ready!".

And so it loops.

If everyone has the debuff, the mod finds who has the least remaining on it and
then tells him to heal next.

The mod wants a healer channel to output messages like "X healed - X is next!"
to. You have to set this channel with /bwhba setchannel <channelname> before the
encounter starts or you will get spammed about it.

