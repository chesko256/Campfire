Scriptname _Camp_InstinctsGlowScript extends ObjectReference  

import CampUtil
import _CampInternal

MagicEffect property _Camp_SurvivalVisionEffect auto
Actor property PlayerRef auto

bool eligibleForDeletion = false

Event OnInit()
    FallbackEventEmitter emitter = GetEventEmitter_InstinctsStopSearch()
    emitter.RegisterFormForModEventWithFallback("Campfire_InstinctsStopSearch", "InstinctsStopSearch", self)
    RegisterForSingleUpdate(5.0)
EndEvent

Event OnUpdate()
    ; Destroy if player stops using the ability.
    if eligibleForDeletion
        Destroy()
    endif

    if PlayerRef.HasMagicEffect(_Camp_SurvivalVisionEffect)
        RegisterForSingleUpdate(5.0)
    else
        eligibleForDeletion = true
    endif
EndEvent

Event InstinctsStopSearch()
    eligibleForDeletion = true
    RegisterForSingleUpdate(3.0)
endEvent

function Destroy()
    UnregisterForUpdate()
    FallbackEventEmitter emitter = GetEventEmitter_InstinctsStopSearch()
    emitter.UnregisterFormForModEventWithFallback("Campfire_InstinctsStopSearch", self)
    self.Disable(true)
    self.Delete()
endFunction