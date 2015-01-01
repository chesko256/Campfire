Scriptname _DE_FlyingMountDetectScript extends activemagiceffect  

Quest property _DE_Main_1_6 auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	(_DE_Main_1_6 as _DE_ConditionValues).IsRidingFlyingMount = true
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	(_DE_Main_1_6 as _DE_ConditionValues).IsRidingFlyingMount = false
endEvent