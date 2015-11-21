Scriptname _Camp_CampfireSitScript extends ObjectReference  

import CampUtil

_Camp_ConditionValues property ConditionVars auto
Quest property CampfireTentSystem auto
Message property _Camp_Help_CampfireActivate auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		ConditionVars.IsPlayerSittingNearFire = true
		CampfireTentSystem.Start()
		Game.DisablePlayerControls(false, true, true, false, true, false, false, false)
		RegisterForSingleUpdate(1.0)
		if GetCompatibilitySystem().isSKSELoaded
			Message.ResetHelpMessage("Activate")
			_Camp_Help_CampfireActivate.ShowAsHelpMessage("Activate", 5, 30, 1)
			GetLastUsedCampfire().RegisterForControl("Jump")
		endif
	endif
EndEvent

Event OnUpdate()
	if self.IsFurnitureInUse()
		RegisterForSingleUpdate(1.0)
	else
		ConditionVars.IsPlayerSittingNearFire = false
		CampfireTentSystem.Stop()
		Game.EnablePlayerControls()
		if GetCompatibilitySystem().isSKSELoaded
			GetLastUsedCampfire().UnregisterForAllControls()
		endif
	endif
EndEvent