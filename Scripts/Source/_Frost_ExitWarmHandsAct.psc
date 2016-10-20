scriptname _Frost_ExitWarmHandsAct extends ObjectReference

Quest property _Frost_System_Heat auto

Event OnActivate(ObjectReference akActionRef)
	(_Frost_System_Heat as _Frost_WarmHandsLogic).WarmHandsEnd()
EndEvent