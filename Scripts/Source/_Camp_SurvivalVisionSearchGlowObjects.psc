scriptname _Camp_SurvivalVisionSearchGlowObjects extends ActiveMagicEffect

Actor property PlayerRef auto
Activator property _Camp_VisionDetectItemFX auto
FormList property _Camp_VisionObjects_Glow auto
Spell property _Camp_SurvivalVisionPower auto
Spell property _Camp_SurvivalVisionPowerDetectSpell auto
GlobalVariable property _Camp_PerkRank_KeenSenses auto

ObjectReference[] found_targets
bool seeking = false
bool target_found = false
bool stop_effect = false
int seek_count = 48


Event OnEffectStart(Actor akTarget, Actor akCaster)
    RegisterForModEvent("Campfire_PlayerHit", "PlayerHit")
    RegisterForMenu("Dialogue Menu")
    _Camp_SurvivalVisionPowerDetectSpell.Cast(PlayerRef)
    RegisterForSingleUpdate(4)
    SendEvent_VisionPowerStart()
    SeekTargets()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    PlayerRef.DispelSpell(_Camp_SurvivalVisionPower)
    StopEffects()
EndEvent

Event OnUpdate()
    ; Keep the detection effects alive
    _Camp_SurvivalVisionPowerDetectSpell.Cast(PlayerRef)
    RegisterForSingleUpdate(4)
EndEvent

Event PlayerHit(Form akAggressor, Form akSource, Form akProjectile)
    Dispel()
endEvent

Event OnMenuOpen(string menuName)
    if menuName == "Dialogue Menu"
        Dispel()
    endif
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
        ObjectReference ref = Game.FindRandomReferenceOfAnyTypeInListFromRef(_Camp_VisionObjects_Glow, PlayerRef, detection_distance)
        if ref && ref.IsHarvested()
            ; pass
        else
            int idx = found_targets.Find(ref)
            if idx == -1
                target_found = true
                ObjectReference fx = ref.PlaceAtMe(_Camp_VisionDetectItemFX, abInitiallyDisabled = true)
                fx.SetPosition(fx.GetPositionX(), fx.GetPositionY(), fx.GetPositionZ() + 16.0)
                fx.EnableNoWait(true)
                
                ArrayAddRef(found_targets, ref)
            endif
            i += 1
        endif
    endWhile
endFunction

function StopEffects()
    stop_effect = true
    SendEvent_VisionPowerFinished()
endFunction

function SendEvent_VisionPowerStart()
    int handle = ModEvent.Create("Campfire_VisionPowerStart")
    if handle
        ModEvent.Send(handle)
    endif
endFunction

function SendEvent_VisionPowerFinished()
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