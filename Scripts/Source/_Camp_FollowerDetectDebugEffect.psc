Scriptname _Camp_FollowerDetectDebugEffect extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
    debug.trace("[Campfire] Detect effect started")
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    debug.trace("[Campfire] Detect effect stopped")
EndEvent