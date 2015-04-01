Scriptname _Camp_FollowerDetectDebugEffect extends activemagiceffect  

import _CampInternal

Event OnEffectStart(Actor akTarget, Actor akCaster)
    CampDebug(0, "Detect effect started")
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    CampDebug(0, "Detect effect stopped")
EndEvent