scriptname _Camp_WorkshopScriptEx extends WorkshopScript

Message property _Camp_WorkshopMainMenu auto

Event OnActivate(ObjectReference akActionRef)
	debug.trace("Calling settlement menu")
	int i = _Camp_WorkshopMainMenu.Show()
	if i == 0
		parent.OnActivate(akActionRef)
	elseif i == 2
		; Dissolve
	elseif i == 3
		; Back
	endif
EndEvent