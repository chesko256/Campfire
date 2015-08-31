scriptname _Camp_NextBug extends ObjectReference

ObjectReference property myController auto hidden

Event OnActivate(ObjectReference akActionRef)
    (myController as _Camp_PerkNavController).NextClicked()
EndEvent

function AssignController(ObjectReference akController)
	myController = akController
endFunction