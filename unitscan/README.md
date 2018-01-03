# unitscan - WoW 1.12 addOn 

![Alt text](http://i.imgur.com/d7TLkZm.png)

This addOn automatically scans for any targetable units of your choice by name and alerts you upon finding one. Instead of the modern scanning methods which don't work for Vanilla it uses the API function *TargetByName* which was removed with TBC.

The alert is visually and acoustically an exact copy of the famous addOn *_NPCScan* which first appeared during WotLK.

There are two commands:<br/>
**/unitscan** lists the active scan targets<br/>
**/unitscan name** adds/removes **name** to/from the scan targets<br/>
When a target is detected it is removed and has to be readded to continue scanning for it.
