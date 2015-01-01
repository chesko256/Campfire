scriptname _DE_CampCookingPotObject_Shelter extends ObjectReference

import debug

message property _DE_CookingPotError auto
Formlist property _DE_HeatSources_All auto

Event OnInit()
	while !self.Is3DLoaded()
	endWhile
	self.BlockActivation()
	;utility.wait(1.0)
endEvent
	
Event OnActivate(ObjectReference akActionRef)
	GoToState("ActivationLock")
	if !((akActionRef as Actor) == Game.GetPlayer())
		GoToState("")
		return
	endif
	ObjectReference myref = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_HeatSources_All, self, 260.0)
	if myref != none && myref.IsEnabled()
		self.Activate(akActionRef, true)
	else
		_DE_CookingPotError.Show()
	endif
	GoToState("")
endEvent

State ActivationLock
	Event OnActivate(ObjectReference akActionRef)
		;debug.trace("[FROSTFALL] Duplicate activation ignored...")
	endEvent
endState