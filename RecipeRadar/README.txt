
Recipe Radar

(by Jay Miller [jnmiller@cryptofreak.org])

http://www.cryptofreak.org/projects/reciperadar

$Id: README.txt 299 2006-04-24 17:34:12Z jnmiller $


Installation
~~~~~~~~~~~~
You've probably already installed the addon.  In case you're not sure how
to do it, unzip the archive to your

   ... \World of Warcraft\Interface\AddOns

directory.  A new directory called 'RecipeRadar' should appear.  That should
be all you need to do to use Recipe Radar.

When you get in game, you may want to map a key to toggle Recipe Radar.
You should be able to find the option to do this in your Key Bindings menu,
all the way at the bottom.


Bugs
~~~~
If you spot a bug in this software, *please let me know!*  The best way
to do so is to hit the bug tracker at

   http://sourceforge.net/tracker/?group_id=165127

and leave a short report on what was happening at the time.

Also in the bugs category are misplaced vendors.  The location information
for all of the vendors in the Recipe Radar database was retrieved in a 
mostly automated way, so some coordinates are incorrect.  If you come upon
a vendor whose mapped location does not match their actual location, please
let me know!  The most helpful thing you can do is this quick process:

   1) Unmap all but the problematic vendor.
   2) Move your toon exactly on top of the vendor.
   3) Type '/rr debug vendor'.
   4) Record the text you see.  It should resemble this:
   
      Debugging Drac Roughcut
      Database Coords: 0.356, 0.491
      Player Coords: 0.35588067770004, 0.48890501260757
   
   5) File a bug report and include this text.

Thank you very much for your help!


Acknowledgements
~~~~~~~~~~~~~~~~
- I'd like to thank Nimrah for passing on Technetium's TGAtoBLP2 code.
  It dropped the almost 50 maps from 343k each to 130k each!
- I stole the clean, simple minimap button code from Atlas, as well
  as the nice version display idea.
- The minimap mapping methods and constants are all from the original
  MapNotes - awesome work, it was.


Thanks for trying Recipe Radar!  Enjoy!
