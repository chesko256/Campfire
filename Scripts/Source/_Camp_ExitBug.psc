scriptname _Camp_ExitBug extends ObjectReference

ObjectReference property myController auto hidden

Event OnActivate(ObjectReference akActionRef)
    (myController as _Camp_PerkNavController).ExitClicked()
EndEvent

function AssignController(ObjectReference akController)
	myController = akController
endFunction