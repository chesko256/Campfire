Scriptname _Camp_InstinctsGlowScript extends ObjectReference  

MagicEffect property _Camp_SurvivalVisionEffect auto
Actor property PlayerRef auto

bool eligibleForDeletion = false

Event OnInit()
    RegisterForModEvent("Campfire_InstinctsStopSearch", "InstinctsStopSearch")
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
    UnregisterForAllModEvents()
    self.Disable(true)
    self.Delete()
endFunction