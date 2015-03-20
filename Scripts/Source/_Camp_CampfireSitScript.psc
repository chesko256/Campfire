Scriptname _Camp_CampfireSitScript extends ObjectReference  

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		Game.DisablePlayerControls(false, true, true, false, true, false, false, false)
		RegisterForSingleUpdate(0.5)
	endif
EndEvent

Event OnUpdate()
	if self.IsFurnitureInUse()
		RegisterForSingleUpdate(0.5)
	else
		Game.EnablePlayerControls()
	endif
EndEvent