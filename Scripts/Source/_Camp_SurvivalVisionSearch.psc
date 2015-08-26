scriptname _Camp_SurvivalVisionSearch extends ActiveMagicEffect

Actor property PlayerRef auto
EffectShader property _Camp_VisionStaticShader auto
FormList property _Camp_SurvivalVisionObjects auto
Spell property _Camp_SurvivalVisionPower auto

ObjectReference[] found_targets
bool seeking = false
bool target_found = false
int seek_count = 96


Event OnEffectStart(Actor akTarget, Actor akCaster)
    SeekTargets()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    PlayerRef.DispelSpell(_Camp_SurvivalVisionPower)
    StopEffects()
EndEvent

function SeekTargets()
    found_targets = new ObjectReference[48]
    seeking = true
    int i = 0
    while seeking && i < seek_count
        ObjectReference ref = Game.FindRandomReferenceOfAnyTypeInListFromRef(_Camp_SurvivalVisionObjects, PlayerRef, 1536.0)
        int idx = found_targets.Find(ref)
        if idx == -1
            target_found = true
            _Camp_VisionStaticShader.Play(ref)
            ArrayAddRef(found_targets, ref)
        endif
        i += 1
    endWhile
endFunction

function StopEffects()
    if !target_found || !found_targets
        debug.trace("Early exit")
    else
        int i = 0
        debug.trace("found_targets.Length: " + found_targets.Length)
        while i < found_targets.Length
            if found_targets[i]
                debug.trace("Stopping on " + found_targets[i])
                _Camp_VisionStaticShader.Stop(found_targets[i])
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