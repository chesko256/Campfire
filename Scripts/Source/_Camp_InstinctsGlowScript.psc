Scriptname _Camp_InstinctsGlowScript extends ObjectReference  

MagicEffect property _Camp_SurvivalVisionEffect auto
Actor property PlayerRef auto

Event OnInit()
    RegisterForModEvent("Campfire_InstinctsStopSearch", "InstinctsStopSearch")
    RegisterForSingleUpdate(Utility.RandomInt(4, 8))
EndEvent

Event OnUpdate()
    ; Destroy if player stops using the ability.
    if PlayerRef.HasMagicEffect(_Camp_SurvivalVisionEffect)
        RegisterForSingleUpdate(5.0)
    else
        Destroy()
    endif
EndEvent

Event InstinctsStopSearch()
    Destroy()
endEvent

function Destroy()
    UnregisterForUpdate()
    UnregisterForAllModEvents()
    self.Disable(true)
    self.Delete()
endFunction