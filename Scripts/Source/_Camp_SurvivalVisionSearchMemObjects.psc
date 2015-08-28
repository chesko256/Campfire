scriptname _Camp_SurvivalVisionSearchMemObjects extends ActiveMagicEffect

Actor property PlayerRef auto
EffectShader property _Camp_VisionStaticShader auto
FormList property _Camp_VisionObjects_Membrane auto
GlobalVariable property _Camp_PerkRank_KeenSenses auto

ObjectReference[] found_targets
bool seeking = false
bool target_found = false
bool stop_effect = false
int seek_count = 48


Event OnEffectStart(Actor akTarget, Actor akCaster)
    SeekTargets()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    StopEffects()
EndEvent

function SeekTargets()
    found_targets = new ObjectReference[24]
    seeking = true
    int i = 0
    float detection_distance = 2048.0 + (_Camp_PerkRank_KeenSenses.GetValueInt() * 1024.0)
    while seeking && i < seek_count
        if stop_effect
            return
        endif
        ObjectReference ref = Game.FindRandomReferenceOfAnyTypeInListFromRef(_Camp_VisionObjects_Membrane, PlayerRef, 2048.0)
        if ref && ref.IsHarvested()
            ; pass
        else
            int idx = found_targets.Find(ref)
            if idx == -1
                target_found = true
                _Camp_VisionStaticShader.Play(ref)
                ArrayAddRef(found_targets, ref)
            endif
            i += 1
        endif
    endWhile

endFunction

function StopEffects()
    stop_effect = true
    int i = 0
    while i < found_targets.Length
        if found_targets[i]
            _Camp_VisionStaticShader.Stop(found_targets[i])
        endif
        i += 1
    endWhile
endFunction

function ArrayAddRef(ObjectReference[] myArray, ObjectReference akValue)
    int index = myArray.Find(None)
    if index >= 0
        myArray[index] = akValue
    endif
endFunction