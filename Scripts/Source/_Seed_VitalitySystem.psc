scriptname _Seed_VitalitySystem extends Quest

Actor property PlayerRef auto
GlobalVariable property _Seed_VitalitySystemEnabled auto
GlobalVariable property _Seed_AttributeVitality auto
Spell property _Seed_VitalityEffect6 auto
Spell property _Seed_VitalityEffect5 auto
Spell property _Seed_VitalityEffect4 auto
Spell property _Seed_VitalityEffect3 auto
Spell property _Seed_VitalityEffect2 auto
Spell property _Seed_VitalityEffect1 auto

float property MAX_VITALITY = 120.0 autoReadOnly
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
    if current_value > 100.0
        TryToApplySpell(PlayerRef, _Seed_VitalityEffect6)
    elseif current_value > 80.0
        TryToApplySpell(PlayerRef, _Seed_VitalityEffect5)
    elseif current_value > 60.0
        TryToApplySpell(PlayerRef, _Seed_VitalityEffect4)
    elseif current_value > 40.0
        TryToApplySpell(PlayerRef, _Seed_VitalityEffect3)
    elseif current_value > 20.0
        TryToApplySpell(PlayerRef, _Seed_VitalityEffect2)
    elseif current_value > 0.0
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

bool function ArrayAdd(float[] myArray, float value)
    int index = myArray.Find(None)
    if index >= 0
        myArray[index] = value
        return true
    else
        return false
    endif
endFunction

function ArrayClear(float[] myArray)
    int i = 0
    while i < myArray.Length
        myArray[i] = none
        i += 1
    endWhile
endFunction