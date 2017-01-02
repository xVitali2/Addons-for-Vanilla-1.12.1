SpamThrottle (Eliminates duplicated messages in chat channels)

	Version:	Vanilla_1.11h
	Date:		29 October 2016
	Author:		Mopar

On many servers the Trade channel is the main LFG channel in use today. On full servers, many people spam the channel to increase the visibility of their messages (or just be a general nuisance) by making macros and repeating the message once every few minutes. And then there’s gold sellers. This means you spend more time reading crap and less time interacting with normal people.

This addon filters the trade channel (and all other numbered channels, i.e. /1 through /99), /y, and optionally /s and /w so that any individual message is only displayed ONCE.  Repeats are filtered out, as long as the text is identical or very close. A message is determined to be 'close' based on some advanced heuristics.  It means you will only see unique LFG messages once. On heavily populated servers for example this may reduce the chat messages by 70% to 80%, and makes the channels readable again.

Any message which is identified to be a duplicate of one sent earlier is "gapped", which means that it is only allowed to be shown once every X seconds - where X is settable by the user.  The default is 600 seconds (10 minutes).

The default is to hide the message entirely so that you never see the repeat.  If you want to see what you are missing, then you can set "color" mode, for which the repeats will be colored dark gray - easy to ignore, and gives you a sense of what is being blocked.  The author recommends using the hide mode under normal circumstances.


Behavior:
	* Spam is filtered from the numbered channels, i.e. /1 to /99 (which includes the trade channel, the worst offender).
	* Spam on /y (yell) is treated the same as a numbered channel, and is filtered similarly.
	* Spam on /w (whisper) is treated the same as well (optionally).
	* Spam on /s (say) is treated the same as well (optionally).
	* There is an option to reply to whispers automatically with a message telling the person their message was blocked.
	* The filter will not affect raid/bg, guild chat and so on.
	* It won't filter your OWN messages AT ALL; they will show up as normal, even if you're committing the spam yourself.
	* It filters by the content of the message itself, looking for repetitive messages.
	* There is a keyword list that you can adjust to filter by keyword.
	* There is a player list that you can adjust to filter by player name.
	* The first time a unique message arrives, it is always shown.
	* It is free-standing and compatible with other spam filters.
	* Repeated messages are allowed every X seconds, where X defaults to 600.  This is user settable.
	* Windfury is in the default keyword list, as well as many common gold selling sites.

Usage:
	/spamthrottle, or /st
	Opens the main configuration GUI. All settings are controllable here.

	/st reset
	Resets the memory to start from scratch - effectively making the program forget all previous messages.

	The settings are remembered account-wide (affects all characters).


Changes (for PRIVATE SERVER 1.12 version):
	Vanilla_1.0 (22/06/2014): Ported to work on Classic Wow 1.12.x. Added code to block join/leave channels spam, and channel ownership spam.
	Note that Vanilla version uses a much older event handling mechanism, so may conflict with other chat related add ons.

	Vanilla_1.2 (24/07/2014): Added configuration GUI, and more features.

	Vanilla_1.3 (04/06/2015): Added more features based on suggestions on Nostalrius.

	Vanilla_1.4 (08/08/2015): Improvements that keep spammers from deliberately bypassing the filters, and performance improvements.

	Vanilla_1.5 (10/08/2015): Added whitelist capability.

	Vanilla_1.6 (26/09/2015): Added yell filter option, keywords

	Vanilla_1.7 (16/04/2016): Intermediate update to try to make more compatible with other addons; a work in progress. Also more keywords.

	Vanilla_1.8 (23/04/2016): Implemented overhook, delaying the chat handler hook for compatibility. This works now.

	Vanilla_1.9 (25/04/2016): Added QQ filtering into the Chinese message filter option. If turned on, filters messages with a QQ address. Also added normalization of some obfuscated letters.

	Vanilla_1.9a (15/06/2016): Additional anti-obfuscation for UTF-8 2-byte characters codes masquerading as english characters. Also added another gold seller site to the default block list.

	Vanilla_1.10 (20/06/2016): Added code to handle multiple windows, written by github’s sipertruk. Thanks mate! Also added some more anti-obfuscation code.

	Vanilla_1.11 (17/08/2016): Added (optional) aggressive gold spam filtering

Acknowledgements:
	This addon was originally inspired by ASSFilter, created by Yewbacca.
	Thanks to Tori of Blackrock for helping with some of the event handler code on the retail version.  Much appreciated!
