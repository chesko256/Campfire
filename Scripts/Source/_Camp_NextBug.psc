scriptname _Camp_NextBug extends ObjectReference

ObjectReference property myController auto hidden
ImpactDataSet property MAGIllusionNegImpactSet auto

Event OnActivate(ObjectReference akActionRef)
	debug.trace("Next clicked")
	self.PlayImpactEffect(MAGIllusionNegImpactSet)
    (myController as _Camp_PerkNavController).NextClicked()
EndEvent

function AssignController(ObjectReference akController)
	myController = akController
endFunction