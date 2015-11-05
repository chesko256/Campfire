scriptname _Frost_PlayerDialogueMonitor extends ReferenceAlias

_Frost_ConditionValues property Conditions auto

function RegisterForMenus()
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