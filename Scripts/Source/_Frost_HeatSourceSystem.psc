scriptname _Frost_HeatSourceSystem extends _Frost_BaseSystem

import _FrostInternal

ReferenceAlias property HeatSource auto
GlobalVariable property _Frost_CurrentHeatSourceSize auto
GlobalVariable property _Frost_CurrentHeatSourceDistance auto
GlobalVariable property _Frost_NearFire auto
ObjectReference property _Frost_CurrentHeatSourceMarker auto

Actor property PlayerRef auto
Formlist property _Camp_HeatSources_All auto
Formlist property _Camp_HeatSources_Fire auto
Formlist property _Camp_HeatSources_Fire_Small auto
Formlist property _Camp_HeatSources_Fire_Medium auto
Formlist property _Camp_HeatSources_Fire_Large auto
Formlist property _Camp_HeatSources_Other auto
Keyword property LocTypeInn auto

Quest property _Frost_MainQuest auto

function Update()
    GetHeatSourceData()
endFunction

function GetHeatSourceData()
    ObjectReference current_heat_source = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_HeatSources_All, PlayerRef, 600.0)
    ; Prevent "you are getting warmer" bouncing while running through towns.
    if PlayerRef.IsRunning() || PlayerRef.IsSprinting()
        current_heat_source = none
    endif

    if current_heat_source && current_heat_source.IsEnabled()
        Form heat_source_object = current_heat_source.GetBaseObject()
        float distance_from_heat = PlayerRef.GetDistance(current_heat_source)
        
        int current_heat_size = 0
        if _Camp_HeatSources_Fire_Small.HasForm(heat_source_object) && distance_from_heat <= 300.0
            current_heat_size = SetHeatSourceSize(1)
            
        elseif _Camp_HeatSources_Fire_Medium.HasForm(heat_source_object) && distance_from_heat <= 450.0
            current_heat_size = SetHeatSourceSize(2)
            
        elseif _Camp_HeatSources_Fire_Large.HasForm(heat_source_object)
            current_heat_size = SetHeatSourceSize(3)
            
        elseif _Camp_HeatSources_Other.HasForm(heat_source_object)
            current_heat_size = SetHeatSourceSize(2)
            
        else
            if distance_from_heat <= 450.0
                current_heat_size = SetHeatSourceSize(2)
            else
                current_heat_size = SetHeatSourceSize(0)
            endif
        endif

        bool near_fire
        if current_heat_size > 0 && _Camp_HeatSources_Fire.HasForm(heat_source_object)
            near_fire = SetNearFire(true)
        else
            near_fire = SetNearFire(false)
        endif
        
        float current_heat_distance
        if current_heat_size > 0
            ; We successfully found a heat source.
            HeatSource.ForceRefTo(current_heat_source)
            _Frost_CurrentHeatSourceMarker.MoveTo(current_heat_source)
            current_heat_distance = SetHeatSourceDistance(distance_from_heat)
            
            FrostDebug(1, "%%%% Heat ::: Size " + current_heat_size + ", Distance " + current_heat_distance + ", Fire " + near_fire + ", Ref " + current_heat_source)
            return
        else
            HeatSource.Clear()
        endif
    else
        ; If the player is in an inn, they are warm everywhere inside it.
        ; We check this second because we want the animation system to find a fire first, if nearby.
        HeatSource.Clear()
        Location current_location = PlayerRef.GetCurrentLocation()
        if current_location && current_location.HasKeyword(LocTypeInn)
            FrostDebug(1, "%%%% Heat ::: Inside Inn")
            SetHeatSourceSize(2)
            SetHeatSourceDistance(-1.0)
            SetNearFire(true)
            return
        endif
    endif
    
    ; We didn't find any heat sources.
    SetHeatSourceSize(0)
    SetHeatSourceDistance(-1.0)
    SetNearFire(false)
endFunction

int function SetHeatSourceSize(int size)
    _Frost_CurrentHeatSourceSize.SetValueInt(size)
    return size
endFunction

float function SetHeatSourceDistance(float distance)
    _Frost_CurrentHeatSourceDistance.SetValue(distance)
    return distance
endFunction

bool function SetNearFire(bool near_fire)
    if near_fire
        _Frost_NearFire.SetValueInt(2)
        return true
    else
        _Frost_NearFire.SetValueInt(1)
        return false
    endif
endFunction

; Outstanding questions:
;    ??? if large fire, _DE_FireDistance.SetValue(220.0)    ;Set artificially low so things will trigger