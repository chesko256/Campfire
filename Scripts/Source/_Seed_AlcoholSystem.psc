scriptname _Seed_AlcoholSystem extends Quest

import Utility
import CampUtil

GlobalVariable property _Seed_AlcoholSystemEnabled auto
GlobalVariable property _Seed_AttributeDrunk auto
GlobalVariable property _Seed_Setting_DrunkNotifications auto
GlobalVariable property _Seed_Setting_DrunkVFX auto
GlobalVariable property GameHour auto

Spell property _Seed_DrunkSpell1 auto          ; Relaxed
Spell property _Seed_DrunkSpell2 auto          ; Tipsy
Spell property _Seed_DrunkSpell3 auto          ; Drunk
Spell property _Seed_DrunkSpell4 auto          ; Very Drunk (flag Disease)
Spell property _Seed_DrunkSpellHungOver auto   ; Hung Over (after having passed out) (flag Disease)

Location property KynesgroveBraidwoodInnLocation auto
Location property WindhelmCandlehearthHallLocation auto
Location property WindhelmNewGnisisCornerclubLocation auto
Location property FalkreathDeadMansDrinkLocation auto
Location property DragonBridgeFourShieldsTavernLocation auto
Location property SolitudeWinkingSkeeverLocation auto
Location property MorthalMoorsideInnLocation auto
Location property NightgateInnLocation auto
Location property DawnstarWindpeakInnLocation auto
Location property MarkarthSilverBloodInnLocation auto
Location property OldHroldanInnLocation auto
Location property RiftenBeeandBarbLocation auto
Location property IvarsteadVilemyrInnLocation auto
Location property RoriksteadFrostfruitInnLocation auto
Location property RiverwoodSleepingGiantInnLocation auto
Location property WhiterunBanneredMareLocation auto
Location property WhiterunDrunkenHuntsmanLocation auto
Location property WinterholdTheFrozenHearthLocation auto

Actor property PlayerRef auto

float property MAX_DRUNK = 120.0 autoReadOnly
float property MIN_DRUNK = 0.0 autoReadOnly

int DRINKTYPE_ALE = 1
int DRINKTYPE_WINE = 2
int DRINKTYPE_LIQUOR = 3

float ALE_AMOUNT = 12.0
float WINE_AMOUNT = 32.0
float LIQUOR_AMOUNT = 52.0
float AMOUNT_VARIANCE = 10.0

float SOBER_RATE = 10.0

float property update_interval = 0.5 auto hidden
float property last_update_time auto hidden
float last_drunk = 0.0
float last_hangover_time

function AlcoholConsumed(int drinktype)
    if _Seed_Setting_VampireBehavior.GetValueInt() == 2 && IsPlayerUndead()
        return
    endif

    float variance = (RandomFloat(0.0, AMOUNT_VARIANCE) - (AMOUNT_VARIANCE / 2)) ; +/- half of Variance (random)

    if drinktype == DRINKTYPE_ALE
        IncreaseDrunk(ALE_AMOUNT + variance)
    elseif drinktype == DRINKTYPE_WINE
        IncreaseDrunk(WINE_AMOUNT + variance)
    elseif drinktype == DRINKTYPE_LIQUOR
        IncreaseDrunk(LIQUOR_AMOUNT + variance)
    endif
    if _Seed_AttributeDrunk.GetValue() > 20.0
        RegisterForSingleUpdateGameTime(0.5)
    endif
endFunction

Event OnUpdateGameTime()
    float this_time = GetCurrentGameTime() * 24.0
    int cycles = Math.Floor((this_time - last_update_time) * 2)
    float drunk_decrease = (SOBER_RATE * cycles)

    DecreaseDrunk(drunk_decrease)
    last_update_time = this_time

    if _Seed_VitalitySystemEnabled.GetValueInt() == 2 && _Seed_AttributeDrunk.GetValue() > 0.0
        RegisterForSingleUpdateGameTime(update_interval)
    endif
EndEvent

function IncreaseDrunk(float amount)
    float current_drunk = _Seed_AttributeDrunk.GetValue()
    if current_drunk + amount >= MAX_DRUNK
        _Seed_AttributeDrunk.SetValue(MAX_DRUNK)
    else
        _Seed_AttributeDrunk.SetValue(current_drunk + amount)
    endif
    ApplyDrunkEffects()
endFunction

function DecreaseDrunk(float amount)
    float current_drunk = _Seed_AttributeDrunk.GetValue()
    if current_drunk - amount <= MIN_DRUNK
        _Seed_AttributeDrunk.SetValue(MIN_DRUNK)
    else
        _Seed_AttributeDrunk.SetValue(current_drunk - amount)
    endif
    ApplyDrunkEffects()
endFunction

function ModDrunk(float amount)
    float current_drunk = _Seed_AttributeDrunk.GetValue()
    if current_drunk + amount >= MAX_DRUNK
        _Seed_AttributeDrunk.SetValue(MAX_DRUNK)
    elseif current_drunk + amount <= MIN_DRUNK
        _Seed_AttributeDrunk.SetValue(MIN_DRUNK)
    else
        _Seed_AttributeDrunk.SetValue(current_drunk + amount)
    endif
    ApplyDrunkEffects()
endFunction

function ApplyDrunkEffects()
    float drunk = _Seed_AttributeDrunk.GetValue()
    bool increasing = false
    if drunk > last_drunk
        increasing = true
    endif

    if !(IsBetween(last_drunk, 10.0, 0.0)) && (IsBetween(drunk, 10.0, 0.0))
        ApplyDrunkLevel1()
    elseif !(IsBetween(last_drunk, 30.0, 10.0)) && (IsBetween(drunk, 30.0, 10.0))
        ApplyDrunkLevel2(increasing)
    elseif !(IsBetween(last_drunk, 50.0, 30.0)) && (IsBetween(drunk, 50.0, 30.0))
        ApplyDrunkLevel3()
    elseif !(IsBetween(last_drunk, 80.0, 50.0)) && (IsBetween(drunk, 80.0, 50.0))
        ApplyDrunkLevel4()
    elseif !(IsBetween(last_drunk, 100.0, 80.0)) && (IsBetween(drunk, 100.0, 80.0))
        ApplyDrunkLevel5()
    elseif !(IsBetween(last_drunk, 120.0, 100.0)) && (IsBetween(drunk, 120.0, 100.0))
        ApplyDrunkLevel6()
    endif

    last_drunk = drunk

    ; For Drinking Contest quest
    SendModEvent_PlayerDrinkAlcohol(_Seed_AttributeDrunk.GetValue())
endFunction

function SendModEvent_PlayerDrinkAlcohol(float afDrunkAmount)
    int handle = ModEvent.Create("LastSeed_PlayerDrinkAlcohol")
    if (handle)
        ModEvent.PushFloat(handle, afDrunkAmount)
        ModEvent.Send(handle)
    endIf
EndFunction

function RemoveAllDrunkEffects()
    PlayerRef.RemoveSpell(_Seed_DrunkSpell1)
    PlayerRef.RemoveSpell(_Seed_DrunkSpell2)
    PlayerRef.RemoveSpell(_Seed_DrunkSpell3)
    PlayerRef.RemoveSpell(_Seed_DrunkSpell4)
endFunction

function ApplyDrunkLevel1()
    RemoveAllDrunkEffects()
    if _Seed_Setting_DrunkNotifications.GetValueInt() == 2
        _Seed_DrunkLevel1Msg.Show()
    endif
    ; clear SFX
    ; clear VFX
endFunction

function ApplyDrunkLevel2(bool increasing)
    RemoveAllDrunkEffects()
    PlayerRef.AddSpell(_Seed_DrunkSpell1, false)
    if _Seed_Setting_DrunkNotifications.GetValueInt() == 2
        _Seed_DrunkLevel2Msg.Show()
    endif
    ; play drunk SFX
    if _Seed_Setting_DrunkVFX.GetValueInt() == 2
        ; play drunk VFX
    endif
endFunction

function ApplyDrunkLevel3()
    RemoveAllDrunkEffects()
    PlayerRef.AddSpell(_Seed_DrunkSpell2, false)
    if _Seed_Setting_DrunkNotifications.GetValueInt() == 2
        _Seed_DrunkLevel3Msg.Show()
    endif
    ; play drunk SFX
    if _Seed_Setting_DrunkVFX.GetValueInt() == 2
        ; play drunk VFX
    endif
endFunction

function ApplyDrunkLevel4()
    RemoveAllDrunkEffects()
    PlayerRef.AddSpell(_Seed_DrunkSpell3, false)
    if _Seed_Setting_DrunkNotifications.GetValueInt() == 2
        _Seed_DrunkLevel4Msg.Show()
    endif
    ; play drunk SFX
    if _Seed_Setting_DrunkVFX.GetValueInt() == 2
        ; play drunk VFX
    endif
endFunction

function ApplyDrunkLevel5()
    RemoveAllDrunkEffects()
    PlayerRef.AddSpell(_Seed_DrunkSpell4, false)
    if _Seed_Setting_DrunkNotifications.GetValueInt() == 2
        _Seed_DrunkLevel5Msg.Show()
    endif
    ; play drunk SFX
    if _Seed_Setting_DrunkVFX.GetValueInt() == 2
        ; play drunk VFX
    endif
endFunction

function ApplyDrunkLevel6()
    RemoveAllDrunkEffects()
    PlayerRef.AddSpell(_Seed_DrunkSpellHungOver, false)

    if _Seed_Setting_DrunkNotifications.GetValueInt() == 2
        _Seed_DrunkLevel6Msg.Show()
    endif
    ; pass out FX
    GameHour.SetValue(GameHour.GetValue() + 6.0)
    if PlayerRef.GetCurrentLocation().HasKeyword(LocTypeInn)
        KickPlayerOutOfInn()
    endif
    ; After time passes...
    last_hungover_time = GetCurrentGameTime()
endFunction

bool function IsBetween(float fValue, float fUpperBound, float fLowerBound)
    if fValue <= fUpperBound && fValue > fLowerBound
        return true
    else
        return false
    endif
endFunction

function KickPlayerOutOfInn()
    ;@TODO: Support Retching Netch
    if loc == KynesgroveBraidwoodInnLocation
    elseif loc == WindhelmCandlehearthHallLocation ; bed
    elseif loc == WindhelmNewGnisisCornerclubLocation ; bed
    elseif loc == FalkreathDeadMansDrinkLocation
    elseif loc == DragonBridgeFourShieldsTavernLocation
    elseif loc == SolitudeWinkingSkeeverLocation ; check OCS support
    elseif loc == MorthalMoorsideInnLocation ; bed
    elseif loc == NightgateInnLocation ; bed
    elseif loc == DawnstarWindpeakInnLocation ; bed
    elseif loc == MarkarthSilverBloodInnLocation ; check OCS support
    elseif loc == OldHroldanInnLocation
    elseif loc == RiftenBeeandBarbLocation ; check OCS support
    elseif loc == IvarsteadVilemyrInnLocation
    elseif loc == RoriksteadFrostfruitInnLocation
    elseif loc == RiverwoodSleepingGiantInnLocation
    elseif loc == WhiterunBanneredMareLocation ; check OCS support
    elseif loc == WhiterunDrunkenHuntsmanLocation ; check OCS support
    elseif loc == WinterholdTheFrozenHearthLocation ; bed
    endif
endFunction
