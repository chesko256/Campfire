Scriptname _Camp_CampfireSitScript extends ObjectReference  

_Camp_ConditionValues property ConditionVars auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		ConditionVars.IsPlayerSittingNearFire = true
		Game.DisablePlayerControls(false, true, true, false, true, false, false, false)
		RegisterForSingleUpdate(0.5)
	endif
EndEvent

Event OnUpdate()
	if self.IsFurnitureInUse()
		RegisterForSingleUpdate(0.5)
	else
		ConditionVars.IsPlayerSittingNearFire = false
		Game.EnablePlayerControls()
	endif
EndEvent