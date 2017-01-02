
How many times have you wanted to know what you could craft when taking into account the inventory in your bank?  Well now you can!  The standard TradeSkill screen (Alchemy, First Aid, Cooking, etc.) has been enhanced to not only include what you can craft from your current inventory (current behaviour), but also what you can craft if make a trip to the vendor, what you can craft if you include your bank contents, and what you can craft if you include the contents of your inventory and bank and make a trip to the vendor.  Additionally you can filter out information that you don't want to see (items that you can't make due to missing ingredients, items that don't provide a skill up, etc.).

The information on the top pane of the trade skill screen has been changed from:

	SkillName [INV]
to:
	SkillName [TOT/TOTVEN]

where:
   INV is the standard count of items you can craft based upon your inventory (normal WOW)
   TOT is what you can craft using your inventory and bank items
   TOTVEN is what you can craft using you inventory and bank, and a trip to the vendor

there is also two optional figures [ INV / INVVEN/ TOT/TOTVEN]
  INVVEN is what you can craft with your inventory and a trip to the vendor

For example:

       Healing Potion [7/20]
                 or
       Healing Potion [4/4/7/20]

means that you have sufficient items in your inventory to make 4 healing potions, if you went to a vendor that sold vials you could still make 4, if you include the items in your bank you can make 7 healing potions, and you include a trip to the vendor you could make 20 healing potions.

If you see '-' for a column value that means you've got a weird case where everything to craft the item is buyable, you have some, but not all of those items.  Not quite sure what to display for the case where all is buyable... conceivably you could create an infinite number of those items...

Additionally, in the bottom pane in the trade skill screen the reagent name now has additional information about the total available to the user.  For example:

      Plaguebloom [22]

means that you have 22 plaguebloom herbs in your inventory and bank (the number is your inventory is still displayed in the reagent icon next to the number needed for the item). This allows you to very quickly see what reagents you may still need to get for an item.


Filtering the Display:

[note: you can now use /etsconfig to bring up a GUI to do this]

Many users don't want to see items that they can not make due to missing ingredients or items that will not provide a skill up when they are crafted.  You can control what is filtered out with the /etsfilter command.  The format is:

	/etsfilter name true/false

Where:
	name is inv, inv+, total, total+  (inventory, inventory plus vendor, total, total plus vendor), trival, easy, medium, or optimal

For example:
	/etsfilter total+ true
	will filter out all items where you don't have the necessary ingredients when taking into account your inventory, bank, and what you can buy from a vendor (this is what I use)
	
	/etsfilter trivial true
	will filter out all 'gray' items (useful if you're trying to raise your skill level)


Changing the Display:

[note: you can now use /etsconfig to bring up a GUI to do this]

Many users don't want to see all 4 numbers, but a subset.  You can control this with the /etsdisplay command.  The format is:

	/etsdisplay column true/false
	
Where:
	column is inv, inv+, total, total+


The command /etsreset will remove all filters and display settings


Dumping the contents of your inventory and bank:

If you're like me, you also want to see how many of X I have.  Since this addon has to keep that information around, I added a command to do just that...

    /ets string

will tell you the number of items that match 'string' you have in your bank and inventory (no argument will dump the entire inventory and bank).  The match is done in lower case to simplify things and deal with accidentally having CAPS LOCK on.  For example, if you have 5x Sungrass in your bags and 10x in your bank,

    /ets Sungrass	 (or /ets sungrass /ets Sun or /ets ngras)

will output:

    Sungrass: 15 = 5 inventory + 10 bank

Typing:
    /ets Vial

might output:
    Crystal Vial: 10 = 0 inventory + 10 bank
    Empty Vial: 4 = 4 inventory + 0 bank
    Leaded Vial: 12 = 6 inventory + 6 bank

Since the AddOn keeps the count of everything in your inventory and bank (not just reagents), you can use this as a rudimentary BankStatement or ReagentList.

    /ets Healing

might output:
    Healing Potion: 5 = 2 inventory + 3 bank
    Superior Healing Potion: 10 = 7 inventory + 3 bank

Notes:
- You have to visit the bank at least once after you install this AddOn to tell it about the bank contents
- It's not always clear what to display when all of the ingredients for an item can be bought from a vendor.  I try and generally it's okay, but in the situation where you don't have any of the items or you have some but not all...

Thanks:
- To Blizzard for the base TradeSkillsFrame
- To Raseri for the ReagentList
- To CapnBry for the information on how to get item names
- To the other AddOn authors whose code I reviewed to better understand the WOW API (especially how to properly scan the bank)
- To SAD for your configuration screen - I hacked and slashed it for mine :)


Notes from Romualdo:
--------------------

Since i liked this addon very much an there seemed to be no further support from the original author pinky i did it myself and made this addon working again.
The first version from me was 1.13 and I will try to keep it working with every oncoming patch. If you find any bugs feel free to contact me at RomualdoNi@gmx.de

The original addon by Pinky can be found at: http://www.curse-gaming.com/mod.php?addid=259

Notes from Triadian:
-------------------------

No idea why this mod slipped into non-existance, so i dragged it back kicking and screaming - if you wanna flame me for doing you will be ignored at Triadian@Gmail.com i will only be updating
at http://ui.worldofwar.net/ui.php?id=1471 and http://www.curse-gaming.com/en/wow/addons-2329-1-enhanced-trade-skills-continued.html- so if you write a comment elsewhere i might not see it.

any nice suggestions or improvements let me know and i'll try and implement them but my knowledge of UI isn't that brilliant.