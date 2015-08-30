scriptname _Camp_SurvivalVisionSearchMemObjects extends ActiveMagicEffect
{Handles playing membrane shader vision effects.}

import math

Actor property PlayerRef auto
EffectShader property _Camp_VisionStaticShader auto
FormList property _Camp_VisionObjects_Membrane auto
GlobalVariable property _Camp_PerkRank_KeenSenses auto

ObjectReference[] found_targets
bool seeking = false
bool target_found = false
bool stop_effect = false
int seek_count = 8

Event OnEffectStart(Actor akTarget, Actor akCaster)
    found_targets = new ObjectReference[24]
    SeekTargets()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    StopEffects()
EndEvent

function RefreshObjects()
    if found_targets.Find(None) == -1
        ; The array is full, purge and start again.
        StopEffects()
        found_targets = new ObjectReference[24]
        stop_effect = false
    endif

    if !seeking
        SeekTargets()
    endif
endFunction

function SeekTargets()
    debug.trace("[Campfire] Seeking new targets")
    seeking = true
    int i = 0
    float detection_distance = 2048.0 + (_Camp_PerkRank_KeenSenses.GetValueInt() * 1024.0)
    while seeking && i < seek_count
        if stop_effect
            return
        endif
        ObjectReference ref = Game.FindRandomReferenceOfAnyTypeInListFromRef(_Camp_VisionObjects_Membrane, PlayerRef, detection_distance)
        if ref && (ref.IsHarvested() || !ref.Is3DLoaded())
            ; pass
        else
            int idx = found_targets.Find(ref)
            if idx == -1
                debug.trace("[Campfire] Found " + ref)
                target_found = true
                _Camp_VisionStaticShader.Play(ref)
                ArrayAddRef(found_targets, ref)
            endif
        endif
        i += 1
    endWhile
    seeking = false
    debug.trace("[Campfire] seek targets...done")
endFunction

; Registered on _Camp_SurvivalVisionSearchGlowObjects.psc
Event OnUpdate()
    RefreshObjects()
EndEvent

function StopEffects()
    debug.trace("[Campfire] Stopping all membrane shaders.")
    stop_effect = true
    int i = 0
    while i < found_targets.Length
        if found_targets[i]
            _Camp_VisionStaticShader.Stop(found_targets[i])
        endif
        i += 1
    endWhile
    debug.trace("[Campfire] stopping...done")
endFunction

function ArrayAddRef(ObjectReference[] myArray, ObjectReference akValue)
    int index = myArray.Find(None)
    if index >= 0
        myArray[index] = akValue
    endif
endFunction
