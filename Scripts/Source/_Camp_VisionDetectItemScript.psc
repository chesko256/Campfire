Scriptname _Camp_VisionDetectItemScript extends ObjectReference  

MagicEffect property _Camp_SurvivalVisionEffect auto
Actor property PlayerRef auto

Event OnInit()
    RegisterForModEvent("Campfire_VisionPowerFinished", "VisionPowerFinished")
    RegisterForSingleUpdate(Utility.RandomInt(4, 8))
EndEvent

Event OnUpdate()
    ; Fail safe: in case spell doesn't destroy this for some reason
    if PlayerRef.HasMagicEffect(_Camp_SurvivalVisionEffect)
        RegisterForSingleUpdate(5.0)
    else
        Destroy()
    endif
EndEvent

Event VisionPowerFinished()
    Destroy()
endEvent

function Destroy()
    UnregisterForUpdate()
    self.Disable(true)
    self.Delete()
endFunction