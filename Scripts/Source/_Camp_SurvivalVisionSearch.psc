scriptname _Camp_SurvivalVisionSearch extends ActiveMagicEffect

Actor property PlayerRef auto
EffectShader property _Camp_SurvivalVisionShader auto
FormList property _Camp_SurvivalVision_Targets auto

ObjectReference[] found_targets
bool seeking = false
bool target_found = false
int seek_count = 128


Event OnEffectStart(Actor akTarget, Actor akCaster)
    SeekTargets()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    StopEffects()
EndEvent

function SeekTargets()
    found_targets = new ObjectReference[64]
    seeking = true
    int i = 0
    while seeking && i < seek_count
        ObjectReference ref = Game.FindRandomReferenceOfAnyTypeInListFromRef(_Camp_SurvivalVision_Targets, PlayerRef, 2048.0)
        int idx = found_targets.Find(ref)
        if idx == -1
            target_found = true
            _Camp_SurvivalVisionShader.Play(ref)
            ArrayAddRef(found_targets, ref)
        endif
        i += 1
    endWhile
endFunction

function StopEffects()
    if !target_found || !found_targets
        ; early exit
    else
        int i = 0
        while i < found_targets.Length
            if found_targets[i]
                _Camp_SurvivalVisionShader.Stop(found_targets[i])
            endif
            i += 1
        endWhile
    endif
endFunction

function ArrayAddRef(ObjectReference[] myArray, ObjectReference akValue)
    int index = myArray.Find(None)
    if index >= 0
        myArray[index] = akValue
    endif
endFunction