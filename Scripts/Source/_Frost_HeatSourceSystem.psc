scriptname _Frost_HeatSourceSystem extends Quest

int property CurrentHeatSourceSize = 0 auto hidden
bool property NearFire = false auto hidden

Formlist property _Camp_HeatSources_All auto
Formlist property _Camp_HeatSources_Fire_Small auto
Formlist property _Camp_HeatSources_Fire_Medium auto
Formlist property _Camp_HeatSources_Fire_Large auto
Keyword property LocTypeInn auto

Event OnUpdate()
    GetHeatSourceData()

    ; if Frostfall running,
        RegisterForSingleUpdate(5)
    ;endif
EndEvent

function GetHeatSourceData()
    ObjectReference current_heat_source = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_HeatSources_All, PlayerRef, 600.0)
    if current_heat_source
        Form heat_source_object = current_heat_source.GetBaseObject()
        float distance_from_heat = PlayerRef.GetDistance(current_heat_source)
        
        if _Camp_HeatSources_Fire_Small.HasForm(heat_source_object) && distance_from_heat <= 300.0
            CurrentHeatSourceSize = 1
        elseif _Camp_HeatSources_Fire_Medium.HasForm(heat_source_object) && distance_from_heat <= 450.0
            CurrentHeatSourceSize = 2
        elseif _Camp_HeatSources_Fire_Large.HasForm(heat_source_object)
            CurrentHeatSourceSize = 3
        else
            if distance_from_heat <= 450.0
                CurrentHeatSourceSize = 2
            else
                CurrentHeatSourceSize = 0
            endif
        endif

        if CurrentHeatSourceSize > 0 && _Camp_HeatSources_Fire.HasForm(heat_source_object)
            NearFire = true
        else
            NearFire = false
        endif
        return
    else
        ; If the player is in an inn, they are warm everywhere inside it.
        ;@TODO: Maybe wrap in region / location / position system
        Location current_location = PlayerRef.GetCurrentLocation()
        if current_location && current_location.HasKeyword(LocTypeInn)
            CurrentHeatSourceSize = 2
            NearFire = true
            return
        endif
    endif
    
    ; We didn't see any heat sources.
    CurrentHeatSourceSize = 0
    NearFire = false
endFunction

; Outstanding questions:
;    ??? if large fire, _DE_FireDistance.SetValue(220.0)    ;Set artificially low so things will trigger
;    Also encapsulate GetOtherHeatSource()