scriptname _Frost_HeatSourceSystem extends _Frost_BaseSystem

import _FrostInternal

int property CurrentHeatSourceSize = 0 auto hidden
float property CurrentHeatSourceDistance = -1.0 auto hidden
bool property NearFire = false auto hidden

Actor property PlayerRef auto
Formlist property _Camp_HeatSources_All auto
Formlist property _Camp_HeatSources_Fire auto
Formlist property _Camp_HeatSources_Fire_Small auto
Formlist property _Camp_HeatSources_Fire_Medium auto
Formlist property _Camp_HeatSources_Fire_Large auto
Keyword property LocTypeInn auto

Quest property _Frost_MainQuest auto

function Update()
    GetHeatSourceData()
endFunction

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
        
        if CurrentHeatSourceSize > 0
            ; We successfully found a heat source.
            CurrentHeatSourceDistance = distance_from_heat
            FrostDebug(1, "%%%% Heat ::: Size " + CurrentHeatSourceSize + ", Distance " + CurrentHeatSourceDistance + ", Fire " + NearFire + ", Ref " + current_heat_source)
            return
        endif
    else
        ; If the player is in an inn, they are warm everywhere inside it.
        Location current_location = PlayerRef.GetCurrentLocation()
        if current_location && current_location.HasKeyword(LocTypeInn)
            CurrentHeatSourceSize = 2
             CurrentHeatSourceDistance = -1.0
            NearFire = true
            return
        endif
    endif
    
    ; We didn't find any heat sources.
    CurrentHeatSourceSize = 0
    CurrentHeatSourceDistance = -1.0
    NearFire = false
endFunction

function SetHeatSourceSize(int size)
    CurrentHeatSourceSize = size
    (_Frost_MainQuest as _Frost_ConditionValues).PlayerHeatSourceSize = size
endFunction

function SetHeatSourceDistance(float distance)
    CurrentHeatSourceDistance = distance
    (_Frost_MainQuest as _Frost_ConditionValues).PlayerHeatSourceDistance = distance
endFunction

function SetNearFire(bool near_fire)
    NearFire = near_fire
    (_Frost_MainQuest as _Frost_ConditionValues).PlayerNearFire = near_fire
endFunction

; Outstanding questions:
;    ??? if large fire, _DE_FireDistance.SetValue(220.0)    ;Set artificially low so things will trigger