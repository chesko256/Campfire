scriptname _Seed_FatigueSystem extends Quest

GlobalVariable property _Seed_VitalitySystemEnabled auto
GlobalVariable property _Seed_AttributeFatigue auto

float property MAX_FATIGUE = 120.0 autoReadOnly
float property MIN_FATIGUE = 0.0 autoReadOnly

float property update_interval = 30.0 auto

function Initialize()
    RegisterForSingleUpdate(update_interval)
endFunction

Event OnUpdate()
    
    if _Seed_VitalitySystemEnabled.GetValueInt() == 2
        RegisterForSingleUpdate(update_interval)
    endif
EndEvent

function ModFatigue(float amount)

endFunction