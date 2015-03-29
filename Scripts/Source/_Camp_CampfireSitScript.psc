Scriptname _Camp_CampfireSitScript extends ObjectReference  

_Camp_ConditionValues property ConditionVars auto
Quest property CampfireTentSystem auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		ConditionVars.IsPlayerSittingNearFire = true
		CampfireTentSystem.Start()
		Game.DisablePlayerControls(false, true, true, false, true, false, false, false)
		RegisterForSingleUpdate(0.5)
	endif
EndEvent

Event OnUpdate()
	if self.IsFurnitureInUse()
		RegisterForSingleUpdate(0.5)
	else
		ConditionVars.IsPlayerSittingNearFire = false
		CampfireTentSystem.Stop()
		Game.EnablePlayerControls()
	endif
EndEvent