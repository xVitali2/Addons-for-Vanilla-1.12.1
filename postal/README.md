# postal - WoW 1.12 addOn

An extension to the Blizzard mail interface which
- **Automatically opens mail, very rapidly**
- **Mails multiple items at once, very rapidly**
- **Autocompletes names including alts in a dropdown**

**\<Right Click>** On inbox items to loot the gold, loot the item and destroy the letter, in that order, if any.<br/>
**\<Right Click>** or **\<Left Drag>** to add inventory items to the attachments.<br/>
**\<Right Click>** to add inventory items to the trade frame.

The name postal was based on the retail namesake because this was originally started as a modification of GMail which was that addOn's predecessor.
Most of the code is however devoted to the send tab and would most accurately be described as a partial backport of the retail blizzard interface.

Note that due to limitations of the 1.12 API, behind the scenes, the items must be sent in separate mails.<br/>
As a result of this **COD will only apply to the first item** if multiple items are added.

Also note that COD is always ignored when opening, both when fully automatic as well as by **\<Right Click>**.

![Alt text](http://i.imgur.com/H0MUmXd.png)

![Alt text](http://i.imgur.com/ZDyfMIK.png)
