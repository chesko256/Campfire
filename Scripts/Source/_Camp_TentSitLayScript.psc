Scriptname _Camp_TentSitLayScript extends ObjectReference  

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		Game.DisablePlayerControls(false, true, true, false, true, false, false, false)
		RegisterForSingleUpdate(1.0)
	endif
EndEvent

Event OnUpdate()
	if self.IsFurnitureInUse()
		RegisterForSingleUpdate(1.0)
	else
		Game.EnablePlayerControls()
	endif
EndEvent