scriptname _Seed_VitalitySystem extends Quest

Actor property PlayerRef auto
GlobalVariable property _Seed_VitalitySystemEnabled auto
GlobalVariable property _Seed_AttributeVitality auto
Spell property _Seed_VitalityEffect8 auto
Spell property _Seed_VitalityEffect7 auto
Spell property _Seed_VitalityEffect6 auto
Spell property _Seed_VitalityEffect5 auto
Spell property _Seed_VitalityEffect4 auto
Spell property _Seed_VitalityEffect3 auto
Spell property _Seed_VitalityEffect2 auto
Spell property _Seed_VitalityEffect1 auto

float property MAX_VITALITY = 100.0 autoReadOnly
float property VITALITY_LEVEL_8 = 87.5 autoReadOnly
float property VITALITY_LEVEL_7 = 75.0 autoReadOnly
float property VITALITY_LEVEL_6 = 62.5 autoReadOnly
float property VITALITY_LEVEL_5 = 50.0 autoReadOnly
float property VITALITY_LEVEL_4 = 37.5 autoReadOnly
float property VITALITY_LEVEL_3 = 25.0 autoReadOnly
float property VITALITY_LEVEL_2 = 12.5 autoReadOnly
float property VITALITY_LEVEL_1 = 0.0 autoReadOnly
float property MIN_VITALITY = 0.0 autoReadOnly
float property update_interval = 60.0 auto

float[] VitalityChangeQueue

function Initialize()
    VitalityChangeQueue = new float[32]
    RegisterForSingleUpdate(update_interval)
endFunction

Event OnUpdate()
    if _Seed_VitalitySystemEnabled.GetValueInt() == 2
        RegisterForSingleUpdate(update_interval)
    endif
EndEvent

function QueueVitalityChange(float amount)
    ; The way most users should interface with Vitality.
    ; Adds changes to a queue so they can be rolled up periodically.

    if _Seed_VitalitySystemEnabled.GetValueInt() != 2
        return
    endif

    bool success = ArrayAdd(VitalityChangeQueue, amount)
    if !success
        SeedDebug(0, "An error occurred when calling QueueVitalityChange(" + amount + "); queue is full.")
    endif
endFunction

function ModVitality(float amount)
    ; Modifies Vitality immediately and directly. Used only
    ; in special circumstances.

    if _Seed_VitalitySystemEnabled.GetValueInt() != 2
        return
    endif

    float current_value = _Seed_AttributeVitality.GetValue()
    if current_value + amount > MAX_VITALITY
        _Seed_AttributeVitality.SetValue(MAX_VITALITY)
    elseif current_value + amount < MIN_VITALITY
        _Seed_AttributeVitality.SetValue(MIN_VITALITY)
    else
        _Seed_AttributeVitality.SetValue(current_value + amount)
    endif
endFunction

function UpdateVitality()
    ; Roll up Vitality changes pushed to the queue.

    float total_change = 0.0
    int i = 0
    while i < VitalityChangeQueue.Length
        total_change += VitalityChangeQueue[i]
        i += 1
    endWhile
    ArrayClear(VitalityChangeQueue)

    ; Bail here (now that the array is clear) if we are disabled.
    if _Seed_VitalitySystemEnabled.GetValueInt() != 2
        return
    endif

    float current_value = _Seed_AttributeVitality.GetValue()
    if current_value + total_change > MAX_VITALITY
        _Seed_AttributeVitality.SetValue(MAX_VITALITY)
    elseif current_value + total_change < MIN_VITALITY
        _Seed_AttributeVitality.SetValue(MIN_VITALITY)
    else
        _Seed_AttributeVitality.SetValue(current_value + total_change)
    endif

    ApplyVitalityEffects()
endFunction

function ApplyVitalityEffects()
    ; Apply magic effects, SFX, VFX.

    float current_value = _Seed_AttributeVitality.GetValue()
    if current_value > VITALITY_LEVEL_8
        TryToApplySpell(PlayerRef, _Seed_VitalityEffect8)
    elseif current_value > VITALITY_LEVEL_7
        TryToApplySpell(PlayerRef, _Seed_VitalityEffect7)
    elseif current_value > VITALITY_LEVEL_6
        TryToApplySpell(PlayerRef, _Seed_VitalityEffect6)
    elseif current_value > VITALITY_LEVEL_5
        TryToApplySpell(PlayerRef, _Seed_VitalityEffect5)
    elseif current_value > VITALITY_LEVEL_4
        TryToApplySpell(PlayerRef, _Seed_VitalityEffect4)
    elseif current_value > VITALITY_LEVEL_3
        TryToApplySpell(PlayerRef, _Seed_VitalityEffect3)
    elseif current_value > VITALITY_LEVEL_2
        TryToApplySpell(PlayerRef, _Seed_VitalityEffect2)
    elseif current_value > VITALITY_LEVEL_1
        TryToApplySpell(PlayerRef, _Seed_VitalityEffect1)
    else
        ; Death
    endif
endFunction

function TryToApplySpell(Actor akActor, Spell akSpell)
    if !akActor.HasSpell(akSpell)
        akActor.AddSpell(akSpell, false)
    endif
endFunction
