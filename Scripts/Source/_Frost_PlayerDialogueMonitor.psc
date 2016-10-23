scriptname _Frost_PlayerDialogueMonitor extends ReferenceAlias

import CampUtil

_Frost_ConditionValues property Conditions auto

function RegisterForMenus()
	;@TODO: Do this without SKSE
	if !GetSKSELoaded()
		return
	endif
	
	RegisterForMenu("Dialogue Menu")
endFunction

Event OnMenuOpen(string menuName)
	if menuName == "Dialogue Menu"
		Conditions.IsInDialogue = true
	endif
EndEvent

Event OnMenuClose(string menuName)
	if menuName == "Dialogue Menu"
		Conditions.IsInDialogue = false
	endif
EndEvent