scriptname _Seed_VitalitySystem extends _Seed_AttributeSystem

import CampUtil
import SeedUtil
import FrostUtil
import _SeedInternal
import Math

Spell property VitalitySpell1 auto
Spell property VitalitySpell2 auto
Spell property VitalitySpell3 auto
Spell property VitalitySpell4 auto
Spell property VitalitySpell5 auto
Spell property VitalitySpell6 auto
Spell property VitalitySpell7 auto
Spell property VitalitySpell8 auto

Message property VitalityMessage1 auto
Message property VitalityMessage2 auto
Message property VitalityMessage3 auto
Message property VitalityMessage4 auto
Message property VitalityMessage5 auto
Message property VitalityMessage6 auto
Message property VitalityMessage7 auto
Message property VitalityMessage8 auto
Message property _Seed_VitalityDeath auto

ImageSpaceModifier property VitalityISM6 auto
ImageSpaceModifier property VitalityISM7 auto

Static property XMarker auto

float property ATTR_LEVEL_6 = 120.0 auto hidden
float property ATTR_LEVEL_7 = 140.0 auto hidden

float lastVitalityTarget = 0.0
float currentVitalityTarget = 0.0

function StartUp()
    debugSystemName = "Vitality"
    meterUpdateEvent = "LastSeed_UpdateVitalityMeter"
    meterForceEvent = "LastSeed_ForceVitalityMeterDisplay"

    ; Initialize arrays
    attributeSpells = new Spell[8]
    attributeMessages = new Message[8]
    attributeSounds = new Sound[8]
    attributeISMs = new ImageSpaceModifier[8]

    ; Set new MAX value
    ATTR_MAX = 160.0

    ; Populate arrays
    attributeSpells[0] = VitalitySpell1
    attributeSpells[1] = VitalitySpell2
    attributeSpells[2] = VitalitySpell3
    attributeSpells[3] = VitalitySpell4
    attributeSpells[4] = VitalitySpell5
    attributeSpells[5] = VitalitySpell6
    attributeSpells[6] = VitalitySpell7
    attributeSpells[7] = VitalitySpell8

    attributeMessages[0] = VitalityMessage1
    attributeMessages[1] = VitalityMessage2
    attributeMessages[2] = VitalityMessage3
    attributeMessages[3] = VitalityMessage4
    attributeMessages[4] = VitalityMessage5
    attributeMessages[5] = VitalityMessage6
    attributeMessages[6] = VitalityMessage7
    attributeMessages[7] = VitalityMessage8

    attributeISMs[0] = VitalityISM7
    attributeISMs[1] = VitalityISM6
endFunction

; Overrides _Seed_AttributeSystem
function ApplyAttributeEffects()
    float currentAttributeValue = attributeValueGlobal.GetValue()

    bool increasing = false
    if currentAttributeValue > lastAttributeValue
        increasing = true
    endif

    if !(IsUpToAndBetween(lastAttributeValue, ATTR_LEVEL_1, ATTR_MIN)) && (IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_1, ATTR_MIN))
        ApplyAttributeLevel(0, increasing, true, true, 2, lowerIsWorse = true, bypassVitalityTargetUpdate = true)
    
    elseif !(IsUpToAndBetween(lastAttributeValue, ATTR_LEVEL_2, ATTR_LEVEL_1)) && (IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_2, ATTR_LEVEL_1))
        ApplyAttributeLevel(1, increasing, true, true, 1, lowerIsWorse = true, bypassVitalityTargetUpdate = true)
    
    elseif !(IsUpToAndBetween(lastAttributeValue, ATTR_LEVEL_3, ATTR_LEVEL_2)) && (IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_3, ATTR_LEVEL_2))
        ApplyAttributeLevel(2, increasing, true, false, lowerIsWorse = true, bypassVitalityTargetUpdate = true)
    
    elseif !(IsUpToAndBetween(lastAttributeValue, ATTR_LEVEL_4, ATTR_LEVEL_3)) && (IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_4, ATTR_LEVEL_3))
        ApplyAttributeLevel(3, increasing, lowerIsWorse = true, bypassVitalityTargetUpdate = true)
    
    elseif !(IsUpToAndBetween(lastAttributeValue, ATTR_LEVEL_5, ATTR_LEVEL_4)) && (IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_5, ATTR_LEVEL_4))
        ApplyAttributeLevel(4, increasing, lowerIsWorse = true, bypassVitalityTargetUpdate = true)
    
    elseif !(IsUpToAndBetween(lastAttributeValue, ATTR_LEVEL_6, ATTR_LEVEL_5)) && (IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_6, ATTR_LEVEL_5))
        ApplyAttributeLevel(5, increasing, lowerIsWorse = true, bypassVitalityTargetUpdate = true)

    elseif !(IsUpToAndBetween(lastAttributeValue, ATTR_LEVEL_7, ATTR_LEVEL_6)) && (IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_7, ATTR_LEVEL_6))
        ApplyAttributeLevel(6, increasing, lowerIsWorse = true, bypassVitalityTargetUpdate = true)

    elseif !(IsUpToAndBetween(lastAttributeValue, ATTR_MAX, ATTR_LEVEL_7)) && (IsUpToAndBetween(currentAttributeValue, ATTR_MAX, ATTR_LEVEL_7))
        ApplyAttributeLevel(7, increasing, lowerIsWorse = true, bypassVitalityTargetUpdate = true)
    endif

    if currentAttributeValue == ATTR_MIN
        HandleZeroVitality()
    endif

    lastAttributeValue = currentAttributeValue
endFunction

function HandleZeroVitality()
    if PlayerRef.IsOnMount()
        _Seed_VitalityDeath.Show()
        Utility.Wait(3)
        KnockPlayerOffHorse()
        PlayerRef.Kill()
    else
        _Seed_VitalityDeath.Show()
        Utility.Wait(3)
        PlayerRef.Kill()
    endif
endFunction

bool knocking_off_horse = false
function KnockPlayerOffHorse()
    knocking_off_horse = false
    RegisterForCameraState()
    ObjectReference heading = PlayerRef.PlaceAtMe(XMarker)
    float[] heading_pos = GetOffsets(PlayerRef, 500.0, 90.0)
    heading.MoveTo(PlayerRef, heading_pos[0], heading_pos[1])
    Utility.Wait(0.2)
    heading.PushActorAway(PlayerRef, 5.0)
    Utility.Wait(0.5)
    int i = 0
    while knocking_off_horse && i < 30
        Utility.Wait(0.5)
        i += 1
    endWhile
    UnregisterForCameraState()
    heading.Disable()
    heading.Delete()
endFunction

Event OnPlayerCameraState(int oldState, int newState)
    if newState == 11
        knocking_off_horse = true
    else
        knocking_off_horse = false
    endif
EndEvent

float[] function GetOffsets(Actor akSource, Float afDistance = 100.0, float afOffset = 0.0)
    Float A = akSource.GetAngleZ() + afOffset
    Float YDist = Sin(A)
    Float XDist = Cos(A)

    XDist *= afDistance
    YDist *= afDistance

    Float[] Offsets = New Float[2]
    Offsets[0] = YDist
    Offsets[1] = XDist
    Return Offsets
EndFunction

; Overrides _Seed_AttributeSystem
function ChangeAttributeOverTime(bool suspendWhileSleeping = false)
    SeedDebug(1, "[" + debugSystemName + "]: ChangeAttributeOverTime()")

    ; Skip the first update.
    if lastUpdateTime == 0.0
        lastUpdateTime = Utility.GetCurrentGameTime() * 24.0
        return
    endif

    ; Wait for other needs to finish first.
    Utility.Wait(3)

    float thisTime = Utility.GetCurrentGameTime() * 24.0

    ; Don't process Vitality changes while the player is focused.
    if IsPlayerFocused()
        lastUpdateTime = thisTime
        return
    endif

    float currentAttributeValue = attributeValueGlobal.GetValue()
    float thisRate = attributeRateGlobal.GetValue()
    if wasSleeping
        thisRate *= 3.0
    endif

    UpdateVitalityTarget()

    ; To-do - Vampire stuff?

    int totalCycles = Math.Floor((thisTime - lastUpdateTime) * 2)
    if totalCycles < 1
        totalCycles = 1
    endif
    SeedDebug(1, "[" + debugSystemName + "]: Updating, " + totalCycles + " cycles.")

    ; To-do - Simulate the Vitality change that would occur as needs change over time (i.e. attributeChange should taper)
    float attributeChange = thisRate * totalCycles
    SeedDebug(1, "[" + debugSystemName + "]: Total attribute change: " + attributeChange)
    if currentAttributeValue < currentVitalityTarget
        if wasSleeping || totalCycles > 1
            ; Cap increases during sleeping or waiting to Very Healthy
            IncreaseAttribute(attributeChange, ATTR_LEVEL_5 + 10.0)
        else
            IncreaseAttribute(attributeChange, currentVitalityTarget)
        endif
    elseif currentAttributeValue > currentVitalityTarget
        if wasSleeping
            ; Don't decrease Vitality when sleeping.
        else
            DecreaseAttribute(attributeChange, currentVitalityTarget)
        endif
    endif

    lastVitalityTarget = currentVitalityTarget
    lastUpdateTime = thisTime
    wasSleeping = false

    RegisterForSingleUpdateGameTime(UpdateFrequencyGlobal.GetValue())
endFunction

; Overrides _Seed_AttributeSystem
function IncreaseAttribute(float amount, float target = -1.0)
    if target == -1.0
        target = ATTR_MAX
    endif

    ; To-do - Vampire stuff?
    float currentAttributeValue = attributeValueGlobal.GetValue()
    if currentAttributeValue + amount >= target
        attributeValueGlobal.SetValue(target)
    else
        attributeValueGlobal.SetValue(currentAttributeValue + amount)
    endif
    SendEvent_UpdateAttributeMeter()
    ApplyAttributeEffects()
endFunction

function UpdateVitalityTarget()
    float exposureTargetMod = GetExposureTargetMod()
    float hungerTargetMod = GetHungerTargetMod()
    ; float thirstMod = GetThirstTargetMod()
    ; float fatigueMod = GetFatigueTargetMod()
    currentVitalityTarget = ATTR_MAX + exposureTargetMod + hungerTargetMod ; + thirstTargetMod + fatigueTargetMod

    ; Display the vitality meter in contextual mode if the
    ; vitality target changes dramatically.
    SeedDebug(1, "[" + debugSystemName + "]: Last target was " + lastVitalityTarget + ", new target is " + currentVitalityTarget)
    if abs(lastVitalityTarget - currentVitalityTarget) >= 20.0
        SendEvent_ForceAttributeMeterDisplay()
    endif

    ; Update the indicator
    SeedDebug(1, "[" + debugSystemName + "]: Setting target indicator to " + (currentVitalityTarget / 160.0))
    SendEvent_UpdateMeterIndicator(currentVitalityTarget / 160.0)
endFunction

; Overrides _Seed_AttributeSystem
function DecreaseAttribute(float amount, float target = -1.0)
    if target == -1.0
        target = ATTR_MIN
    endif

    float currentAttributeValue = attributeValueGlobal.GetValue()
    if currentAttributeValue - amount <= target
        attributeValueGlobal.SetValue(target)
    else
        attributeValueGlobal.SetValue(currentAttributeValue - amount)
    endif
    SendEvent_UpdateAttributeMeter()
    ApplyAttributeEffects()
endFunction

float function GetHungerTargetMod()
    int hungerLevel = GetPlayerHungerLevel()

    if hungerLevel <= 0
        return 0.0
    elseif hungerLevel == 1
        return -20.0
    elseif hungerLevel == 2
        return -60.0
    elseif hungerLevel == 3
        return -95.0
    elseif hungerLevel == 4
        return -130.0
    elseif hungerLevel >= 5
        return -160.0
    endif
endFunction

float function GetExposureTargetMod()
    _Seed_Compatibility compatibility = SeedUtil.GetCompatibilitySystem()
    if !compatibility.isFrostfallLoaded
        return 0.0
    endif

    int exposureLevel = GetPlayerExposureLevel()

    if exposureLevel <= 1
        return 0.0
    elseif exposureLevel == 2
        return -20.0
    elseif exposureLevel == 3
        return -50.0
    elseif exposureLevel == 4
        return -80.0
    elseif exposureLevel >= 5
        return -110.0
    endif
endFunction

; Overrides _Seed_AttributeSystem
function DisplayCurrentStatus()
    float currentAttributeValue = attributeValueGlobal.GetValue()

    if IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_1, ATTR_MIN)
        attributeMessages[0].Show()
    
    elseif IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_2, ATTR_LEVEL_1)
        attributeMessages[1].Show()
    
    elseif IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_3, ATTR_LEVEL_2)
        attributeMessages[2].Show()
    
    elseif IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_4, ATTR_LEVEL_3)
        attributeMessages[3].Show()
    
    elseif IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_5, ATTR_LEVEL_4)
        attributeMessages[4].Show()
    
    elseif IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_6, ATTR_LEVEL_5)
        attributeMessages[5].Show()

    elseif IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_7, ATTR_LEVEL_6)
        attributeMessages[6].Show()

    elseif IsUpToAndBetween(currentAttributeValue, ATTR_MAX, ATTR_LEVEL_7)
        attributeMessages[7].Show()
    endif

    SendEvent_ForceAttributeMeterDisplay()
endFunction

;@NOFALLBACK
function SendEvent_UpdateMeterIndicator(float percent)
    if GetSKSELoaded()
        int handle = ModEvent.Create("LastSeed_UpdateVitalityMeterIndicator")
        if handle
            ModEvent.PushFloat(handle, percent)
            ModEvent.Send(handle)
        endif
    endif
endFunction