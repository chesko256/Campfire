Scriptname _Camp_CampfireSitScript extends ObjectReference  

import CampUtil

_Camp_ConditionValues property ConditionVars auto
GlobalVariable property _Camp_WasFirstPersonBeforeUse auto
Quest property CampfireTentSystem auto
Message property _Camp_Help_CampfireActivate auto
Actor property PlayerRef auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == PlayerRef && PlayerRef.GetSitState() <= 2
		ConditionVars.IsPlayerSittingNearFire = true
		CampfireTentSystem.Start()
		Game.DisablePlayerControls(false, true, true, false, true, false, false, false)
		RegisterForSingleUpdate(1.0)
		if GetCompatibilitySystem().isSKSELoaded
			Message.ResetHelpMessage("Activate")
			_Camp_Help_CampfireActivate.ShowAsHelpMessage("Activate", 5, 30, 1)
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

		; Wait for the player to get up completely.
		int i = 0
		while PlayerRef.GetSitState() != 0 && i < 100
			Utility.Wait(0.1)
			i += 1
		endWhile
		Utility.Wait(0.1)

		; Set the previous camera state.
		if _Camp_WasFirstPersonBeforeUse.GetValueInt() == 2
			if !PlayerRef.GetAnimationVariableBool("IsFirstPerson")
				Game.ForceFirstPerson()
			endif
		endif
	endif
EndEvent
