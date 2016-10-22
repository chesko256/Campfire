Scriptname _Camp_TentSitLayScript extends ObjectReference  

import CampUtil

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		Game.DisablePlayerControls(false, true, true, false, true, false, false, false)
		;/; On Xbox, disable movement controls (interferes with zooming 3rd person camera)
		if GetSKSELoaded()
			Game.DisablePlayerControls(false, true, true, false, true, false, false, false)
		else
			Game.DisablePlayerControls(true, true, true, false, true, false, false, false)
		endif
		/;
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
