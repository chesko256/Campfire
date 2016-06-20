Scriptname _Camp_InstinctsGlowScript extends ObjectReference  

MagicEffect property _Camp_SurvivalVisionEffect auto
GlobalVariable property _Camp_PerkRank_KeenSenses auto
Actor property PlayerRef auto
float detection_distance

Event OnInit()
    RegisterForModEvent("Campfire_InstinctsRefreshState", "InstinctsRefreshState")
    RegisterForModEvent("Campfire_InstinctsStopSearch", "InstinctsStopSearch")
    RegisterForSingleUpdate(Utility.RandomInt(4, 8))
    detection_distance = 2048.0 + (_Camp_PerkRank_KeenSenses.GetValueInt() * 1024.0)
EndEvent

Event OnUpdate()
    ; Fail safe: in case spell doesn't destroy this for some reason
    if PlayerRef.HasMagicEffect(_Camp_SurvivalVisionEffect)
        RegisterForSingleUpdate(5.0)
    else
        Destroy()
    endif
EndEvent

Event InstinctsRefreshState()
    float dist = self.GetDistance(PlayerRef)
    if dist <= detection_distance
        self.EnableNoWait()
    else
        self.DisableNoWait()
    endif
endEvent

Event InstinctsStopSearch()
    Destroy()
endEvent

function Destroy()
    UnregisterForUpdate()
    UnregisterForAllModEvents()
    self.Disable(true)
    self.Delete()
endFunction