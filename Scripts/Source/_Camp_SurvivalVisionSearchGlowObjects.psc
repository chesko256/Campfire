scriptname _Camp_SurvivalVisionSearchGlowObjects extends ActiveMagicEffect
{Handles playing glow shader vision effects, and maintains overall power state.}

import _CampInternal
import CampUtil
import math

Actor property PlayerRef auto
Activator property _Camp_VisionDetectItemFX auto
FormList property _Camp_VisionObjects_Glow auto
Spell property _Camp_SurvivalVisionPower auto
Spell property _Camp_SurvivalVisionPowerDetectSpell auto
Message property _Camp_VisionPowerErrorIndoors auto
GlobalVariable property _Camp_PerkRank_KeenSenses auto

ObjectReference[] found_targets
bool seeking = false
bool target_found = false
bool stop_effect = false
bool updating = false
int seek_count = 8

Event OnEffectStart(Actor akTarget, Actor akCaster)
    if IsRefInInterior(PlayerRef)
        _Camp_VisionPowerErrorIndoors.Show()
        PlayerRef.DispelSpell(_Camp_SurvivalVisionPower)
        return
    endif
    RegisterForAnimationEvent(PlayerRef, "FootLeft")
    RegisterForModEvent("Campfire_PlayerHit", "PlayerHit")
    RegisterForMenu("Dialogue Menu")
    found_targets = new ObjectReference[24]
    _Camp_SurvivalVisionPowerDetectSpell.Cast(PlayerRef)
    RegisterForSingleUpdate(4)
    SendEvent_VisionPowerStart()
    SeekTargets()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    StopEffects()
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if akSource == PlayerRef && asEventName == "FootLeft"
        if _Camp_PerkRank_KeenSenses.GetValueInt() == 0
            CancelEffect_Movement()
        elseif !PlayerRef.IsSneaking()
            CancelEffect_Movement()
        endif
    endif
EndEvent

Event OnUpdate()
    updating = true
    if self.GetTargetActor()
        if IsRefInInterior(PlayerRef)
            ; Player transitioned cells most likely. Kill the ability silently.
            PlayerRef.DispelSpell(_Camp_SurvivalVisionPower)
            return
        endif
        ; Keep the detection effects alive
        _Camp_SurvivalVisionPowerDetectSpell.Cast(PlayerRef)

        ; Refresh objects if necessary
        RefreshObjects()

        RegisterForSingleUpdate(4)
    else
        CampDebug(0, "Instincts: self.GetTargetActor() no longer resolving, so stop updating.")
    endif
    updating = false
EndEvent

function CancelEffect_Movement()
    ; The effect is being cancelled because the player moved.

    ; Wait until an update cycle isn't running, or else we could remove the effect
    ; from the actor and then try to register for an update with no native object bound.
    int i = 0
    while updating && i < 50
        utility.wait(0.1)
        i += 1
    endWhile

    UnregisterForUpdate()
    PlayerRef.DispelSpell(_Camp_SurvivalVisionPower)
endFunction

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

Event PlayerHit(Form akAggressor, Form akSource, Form akProjectile)
    Dispel()
endEvent

Event OnMenuOpen(string menuName)
    if menuName == "Dialogue Menu"
        Dispel()
    endif
EndEvent

function SeekTargets()
    CampDebug(0, "Instincts Glow shader searching for new targets.")
    seeking = true
    int i = 0
    float detection_distance = 2048.0 + (_Camp_PerkRank_KeenSenses.GetValueInt() * 1024.0)
    while seeking && i < seek_count
        if stop_effect
            return
        endif
        ObjectReference ref = Game.FindRandomReferenceOfAnyTypeInListFromRef(_Camp_VisionObjects_Glow, PlayerRef, detection_distance)
        if ref && (ref.IsHarvested() || !ref.Is3DLoaded())
            ; pass
        else
            int idx = found_targets.Find(ref)
            if idx == -1
                target_found = true
                CampDebug(0, "Found " + ref)
                ObjectReference fx = ref.PlaceAtMe(_Camp_VisionDetectItemFX, abInitiallyDisabled = true)
                fx.SetPosition(fx.GetPositionX(), fx.GetPositionY(), fx.GetPositionZ() + 16.0)
                fx.EnableNoWait(true)
                
                ArrayAddRef(found_targets, ref)
            endif
        endif
        i += 1
    endWhile
    seeking = false
    CampDebug(0, "Instincts Glow shader searching for new targets. ...done.")
endFunction

function StopEffects()
    stop_effect = true
    SendEvent_VisionPowerFinished()
endFunction

function SendEvent_VisionPowerStart()
    CampDebug(0, "Sending event Campfire_VisionPowerStart")
    int handle = ModEvent.Create("Campfire_VisionPowerStart")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

function SendEvent_VisionPowerFinished()
    CampDebug(0, "Sending event Campfire_VisionPowerFinished")
    int handle = ModEvent.Create("Campfire_VisionPowerFinished")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

function ArrayAddRef(ObjectReference[] myArray, ObjectReference akValue)
    int index = myArray.Find(None)
    if index >= 0
        myArray[index] = akValue
    endif
endFunction
