 BigWigs Strategy Module for Thaddius in Naxxramas.

BigWigs_ThaddiusArrows is a separate module for BigWigs because it involves
strategy and tells the player directly what to do, instead of simply providing
information on what happens in the encounter.

It supports 3 strategies; Circular with both left and right as first direction
based on what debuff you get, and "run through" where the raid is split in 2
groups on either side of him according to their debuff.

Currently it can announce the direction to move in 3 ways:
 * Displaying huge arrows on-screen.
 * A BigWigs text message with directional text arrows like "<---", etc.
 * A female voice that says "Go right", etc.

BW_TA assumes that your raid is bunched up at the start of phase 2. After the
first Polarity Shift it will tell you which direction you should move based on
the selected strategy.

Strategies:
 * Circular R/L
 * Circular L/R
   Both strategies involve everyone in the raid rotating 90 degrees when a
   Polarity Shift occurs. If your debuff changed, you move in one direction,
   and if it didn't, you move in another.
   The only difference between these two is the starting direction based on
   debuff; R/L goes right for Positive on the first charge and left for
   Negative on the first charge and then right if you did not change and left
   if you did.

 * Run Through
   Simply running through Thaddius to your charges camp. Typically Positive
   charged people will stand on the initial tank spot and Negative charged
   people will move to his back.

You should make *absolutely sure* that everyone uses the same tactic, or you
will wipe for sure.

