scriptname _Seed_HungerSystem extends Quest

import Utility

GlobalVariable property _Seed_VitalitySystemEnabled auto
GlobalVariable property _Seed_AttributeHunger auto
GlobalVariable property _Seed_HungerRate auto
GlobalVariable property _Seed_HungerActionRate auto 
GlobalVariable property _Seed_Setting_VampireBehavior auto
GlobalVariable property _Seed_Setting_Notifications auto
GlobalVariable property _Seed_Setting_MeterDisplay auto
GlobalVariable property _Seed_Setting_NeedsSFX auto
GlobalVariable property _Seed_Setting_NeedsVFX auto
GlobalVariable property _Seed_Setting_NeedsForceFeedback auto
GlobalVariable property _Seed_Setting_NeedsAffectsRegeneration auto

Spell property _Seed_HungerSpell1 auto
Spell property _Seed_HungerSpell2 auto
Spell property _Seed_HungerSpell3 auto
Spell property _Seed_HungerSpell4 auto
Spell property _Seed_HungerSpell5 auto
Spell property _Seed_HungerSpell6 auto
Spell property _Seed_HungerSpell1SkillsOnly auto
Spell property _Seed_HungerSpell2SkillsOnly auto
Spell property _Seed_HungerSpell3SkillsOnly auto
Spell property _Seed_HungerSpell4SkillsOnly auto
Spell property _Seed_HungerSpell5SkillsOnly auto
Spell property _Seed_HungerSpell6SkillsOnly auto

Message property _Seed_HungerLevel1Msg auto
Message property _Seed_HungerLevel2Msg auto
Message property _Seed_HungerLevel3Msg auto
Message property _Seed_HungerLevel4Msg auto
Message property _Seed_HungerLevel5Msg auto
Message property _Seed_HungerLevel6Msg auto

Actor property PlayerRef auto
Keyword property ActorTypeUndead auto
Keyword property ImmuneParalysis auto

float property MAX_HUNGER = 120.0 autoReadOnly
float property MIN_HUNGER = 0.0 autoReadOnly

float property update_interval = 0.5 auto hidden
float property last_update_time auto hidden
bool property was_sleeping = false auto hidden
float last_hunger

Event OnInit()
	Initialize()
EndEvent

function Initialize()
    RegisterForSingleUpdateGameTime(update_interval)
    last_update_time = GetCurrentGameTime() * 24.0
    RegisterForSleep()

    ; Register for weapon swings and bow attacks.
    RegisterForActorAction(0)
    RegisterForActorAction(6)
    RegisterForAnimationEvent(PlayerRef, "SoundPlay.NPCHumanCombatShieldBash")
endFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if asEventName == "SoundPlay.NPCHumanCombatShieldBash"
        debug.trace("[Seed] Player Blocked Attack")
        IncreaseThirst(0.1)
    endif
EndEvent

Event OnUpdateGameTime()
	if _Seed_Setting_VampireBehavior.GetValueInt() == 2 && IsUndead()
		return
	endif

	float rate = _Seed_HungerRate.GetValue()
	float this_time = GetCurrentGameTime() * 24.0
	int cycles = Math.Floor((this_time - last_update_time) * 2)
	float hunger_increase
	if !was_sleeping
		hunger_increase = rate * cycles
	else
		was_sleeping = false
		hunger_increase = (rate * cycles) / 4
	endif

    IncreaseHunger(hunger_increase)
    last_update_time = this_time
    if _Seed_VitalitySystemEnabled.GetValueInt() == 2
        RegisterForSingleUpdateGameTime(update_interval)
    endif
EndEvent

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	was_sleeping = true
EndEvent

Event OnActorAction(int actionType, Actor akActor, Form source, int slot)
	; Increase Hunger when the player attacks.
	IncreaseHunger(_Seed_HungerActionRate.GetValue())
EndEvent

function IncreaseHunger(float amount)
	float current_hunger = _Seed_AttributeHunger.GetValue()
	if current_hunger + amount >= MAX_HUNGER
		_Seed_AttributeHunger.SetValue(MAX_HUNGER)
	else
		_Seed_AttributeHunger.SetValue(current_hunger + amount)
	endif
    ApplyHungerEffects()
endFunction

function DecreaseHunger(float amount)
	float current_hunger = _Seed_AttributeHunger.GetValue()
	if current_hunger - amount <= MIN_HUNGER
		_Seed_AttributeHunger.SetValue(MIN_HUNGER)
	else
		_Seed_AttributeHunger.SetValue(current_hunger - amount)
	endif
    ApplyHungerEffects()
endFunction

function ModHunger(float amount)
	float current_hunger = _Seed_AttributeHunger.GetValue()
	if current_hunger + amount >= MAX_HUNGER
		_Seed_AttributeHunger.SetValue(MAX_HUNGER)
	elseif current_hunger + amount <= MIN_HUNGER
		_Seed_AttributeHunger.SetValue(MIN_HUNGER)
	else
		_Seed_AttributeHunger.SetValue(current_hunger + amount)
	endif
    ApplyHungerEffects()
endFunction

bool function IsUndead()
	; Is player humanoid Vampire, undead, or transformed Vampire Lord?
	if PlayerRef.GetRace().HasKeyword(ActorTypeUndead) || PlayerRef.GetRace().HasKeyword(ImmuneParalysis)
		return true
	else
		return false
	endif
endFunction

function ApplyHungerEffects()
    float hunger = _Seed_AttributeHunger.GetValue()
    bool increasing = false
    if hunger > last_hunger
        increasing = true
    endif

    if !(IsBetween(last_hunger, 20.0, 0.0)) && (IsBetween(hunger, 20.0, 0.0))
        ApplyHungerLevel1()
    elseif !(IsBetween(last_hunger, 40.0, 20.0)) && (IsBetween(hunger, 40.0, 20.0))
        ApplyHungerLevel2(increasing)
    elseif !(IsBetween(last_hunger, 60.0, 40.0)) && (IsBetween(hunger, 60.0, 40.0))
        ApplyHungerLevel3()
    elseif !(IsBetween(last_hunger, 80.0, 60.0)) && (IsBetween(hunger, 80.0, 60.0))
        ApplyHungerLevel4()
    elseif !(IsBetween(last_hunger, 100.0, 80.0)) && (IsBetween(hunger, 100.0, 80.0))
        ApplyHungerLevel5()
    elseif !(IsBetween(last_hunger, 120.0, 100.0)) && (IsBetween(hunger, 120.0, 100.0))
        ApplyHungerLevel6()
    endif

    last_hunger = hunger
endFunction

function RemoveAllHungerEffects()
    PlayerRef.RemoveSpell(_Seed_HungerSpell1)
    PlayerRef.RemoveSpell(_Seed_HungerSpell2)
    PlayerRef.RemoveSpell(_Seed_HungerSpell3)
    PlayerRef.RemoveSpell(_Seed_HungerSpell4)
    PlayerRef.RemoveSpell(_Seed_HungerSpell5)
    PlayerRef.RemoveSpell(_Seed_HungerSpell6)
    PlayerRef.RemoveSpell(_Seed_HungerSpell1SkillsOnly)
    PlayerRef.RemoveSpell(_Seed_HungerSpell2SkillsOnly)
    PlayerRef.RemoveSpell(_Seed_HungerSpell3SkillsOnly)
    PlayerRef.RemoveSpell(_Seed_HungerSpell4SkillsOnly)
    PlayerRef.RemoveSpell(_Seed_HungerSpell5SkillsOnly)
    PlayerRef.RemoveSpell(_Seed_HungerSpell6SkillsOnly)
endFunction

function ApplyHungerLevel1()
    RemoveAllHungerEffects()
    if _Seed_Setting_NeedsAffectsRegeneration.GetValueInt() == 2
        PlayerRef.AddSpell(_Seed_HungerSpell1, false)
    else
        PlayerRef.AddSpell(_Seed_HungerSpell1SkillsOnly, false)
    endif
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_HungerLevel1Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play needs SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play needs VFX
    endif
    if _Seed_Setting_MeterDisplay.GetValueInt() == 2
        ; update meter and show
    endif
endFunction

function ApplyHungerLevel2(bool increasing)
    RemoveAllHungerEffects()
    if _Seed_Setting_NeedsAffectsRegeneration.GetValueInt() == 2
        PlayerRef.AddSpell(_Seed_HungerSpell2, false)
    else
        PlayerRef.AddSpell(_Seed_HungerSpell2SkillsOnly, false)
    endif
    ; suppress this message if hunger is increasing
    if _Seed_Setting_Notifications.GetValueInt() == 2 && increasing
        _Seed_HungerLevel2Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play needs SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play needs VFX
    endif
    if _Seed_Setting_MeterDisplay.GetValueInt() == 2
        ; update meter and show
    endif
endFunction

function ApplyHungerLevel3()
    RemoveAllHungerEffects()
    if _Seed_Setting_NeedsAffectsRegeneration.GetValueInt() == 2
        PlayerRef.AddSpell(_Seed_HungerSpell3, false)
    else
        PlayerRef.AddSpell(_Seed_HungerSpell3SkillsOnly, false)
    endif
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_HungerLevel3Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play needs SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play needs VFX
    endif
    if _Seed_Setting_NeedsForceFeedback.GetValueInt() == 2
        ; play force feedback
    endif
    if _Seed_Setting_MeterDisplay.GetValueInt() == 2
        ; update meter and show
    endif
endFunction

function ApplyHungerLevel4()
    RemoveAllHungerEffects()
    if _Seed_Setting_NeedsAffectsRegeneration.GetValueInt() == 2
        PlayerRef.AddSpell(_Seed_HungerSpell4, false)
    else
        PlayerRef.AddSpell(_Seed_HungerSpell1SkillsOnly, false)
    endif
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_HungerLevel4Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play needs SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play needs VFX
    endif
    if _Seed_Setting_NeedsForceFeedback.GetValueInt() == 2
        ; play force feedback
    endif
    if _Seed_Setting_MeterDisplay.GetValueInt() == 2
        ; update meter and show
    endif
endFunction

function ApplyHungerLevel5()
    RemoveAllHungerEffects()
    if _Seed_Setting_NeedsAffectsRegeneration.GetValueInt() == 2
        PlayerRef.AddSpell(_Seed_HungerSpell5, false)
    else
        PlayerRef.AddSpell(_Seed_HungerSpell1SkillsOnly, false)
    endif
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_HungerLevel5Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play needs SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play needs VFX
    endif
    if _Seed_Setting_NeedsForceFeedback.GetValueInt() == 2
        ; play force feedback
    endif
    if _Seed_Setting_MeterDisplay.GetValueInt() == 2
        ; update meter and show
    endif
endFunction

function ApplyHungerLevel6()
    RemoveAllHungerEffects()
    if _Seed_Setting_NeedsAffectsRegeneration.GetValueInt() == 2
        PlayerRef.AddSpell(_Seed_HungerSpell6, false)
    else
        PlayerRef.AddSpell(_Seed_HungerSpell1SkillsOnly, false)
    endif
    if _Seed_Setting_Notifications.GetValueInt() == 2
        _Seed_HungerLevel6Msg.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        ; play needs SFX
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        ; play needs VFX
    endif
    if _Seed_Setting_NeedsForceFeedback.GetValueInt() == 2
        ; play force feedback
    endif
    if _Seed_Setting_MeterDisplay.GetValueInt() == 2
        ; update meter and show
    endif
endFunction


bool function IsBetween(float fValue, float fUpperBound, float fLowerBound)
    if fValue <= fUpperBound && fValue > fLowerBound
        return true
    else
        return false
    endif
endFunction