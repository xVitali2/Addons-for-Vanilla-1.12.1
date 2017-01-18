# Postal - WoW 1.12 addOn

An extension to the Blizzard mail interface which
- **Automatically opens mail**
- **Mails multiple items at once**

**\<Right Click>** or **\<Left Drag>** to add items to the attachments.<br/>
**\<Right Click>** to add items to the trade frame. (not mail related but GMail had this shortcut and I decided to keep it)

There are two very similar (to eachother) old Vanilla mail addOns commonly found in collections: GMail and CT_MailMod. Both use the same terrible mechanism for automation, unnecessarily making them extremely slow, have a rather ugly send interface and don't  hide the "New Mail"-notifier after Inbox_Opening the last mail automatically.

This addOn solves all those problems, being **super fast**, adapting the **retail send layout** and correctly **hiding the notifier**. (the problem there is actually a bug in the wow client and the notifier will reappear after doing a /reload. This cannot be prevented.)

I started this as a modification of *grennon*'s GMail and named it after GMail's retail version.

Note that due to limitations of the 1.12 API, behind the scenes, the items must be sent in separate mails.<br/>
As a result of this **COD will only apply to the first item** if multiple items are added.

![Alt text](http://i.imgur.com/89yIgi9.png)

![Alt text](http://i.imgur.com/ZDyfMIK.png)
