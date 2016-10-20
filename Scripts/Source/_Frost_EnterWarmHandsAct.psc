scriptname _Frost_EnterWarmHandsAct extends ObjectReference

Quest property _Frost_System_Heat auto

Event OnActivate(ObjectReference akActionRef)
	(_Frost_System_Heat as _Frost_WarmHandsLogic).WarmHandsStart()
EndEvent