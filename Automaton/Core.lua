local L = AceLibrary("AceLocale-2.2"):new("Automaton")
Automaton = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceEvent-2.0", "AceDebug-2.0", "AceDB-2.0", "AceModuleCore-2.0")

Automaton.options = {
	type = 'group',
	args = {},
}

Automaton:RegisterChatCommand({"/auto", "/automaton"}, Automaton.options)

Automaton:RegisterDB("AutomatonDB")