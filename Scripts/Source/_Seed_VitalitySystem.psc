scriptname _Seed_VitalitySystem extends Quest

GlobalVariable property _Seed_AttributeVitality auto

float property MAX_VITALITY = 120.0 autoReadOnly
float property MIN_VITALITY = 0.0 autoReadOnly

float[] VitalityChangeQueue

function Initialize()
    VitalityChangeQueue = new float[32]
endFunction

function QueueVitalityChange(float amount)
    ; The way most users should interface with Vitality.
    ; Adds changes to a queue so they can be rolled up periodically.

    bool success = ArrayAdd(VitalityChangeQueue, amount)
    if !success
        SeedDebug(0, "An error occurred when calling QueueVitalityChange(" + amount + "); queue is full.")
    endif
endFunction

function ModVitality(float amount)
    ; Modifies Vitality immediately and directly. Used only
    ; in special circumstances.

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