scriptname _Seed_AttributeSystem extends _Seed_BaseSystem

import SeedUtil
import CampUtil
import _SeedInternal

Actor property PlayerRef auto
GlobalVariable property _Seed_Setting_VampireBehavior auto
GlobalVariable property _Seed_Setting_Notifications auto
GlobalVariable property _Seed_Setting_NeedsMeterDisplayMode auto
GlobalVariable property _Seed_Setting_NeedsSFX auto
GlobalVariable property _Seed_Setting_NeedsVFX auto
GlobalVariable property _Seed_Setting_NeedsForceFeedback auto

float property ATTR_MAX = 120.0 autoReadOnly
float property ATTR_LEVEL_5 = 100.0 autoReadOnly
float property ATTR_LEVEL_4 = 80.0 autoReadOnly
float property ATTR_LEVEL_3 = 60.0 autoReadOnly
float property ATTR_LEVEL_2 = 40.0 autoReadOnly
float property ATTR_LEVEL_1 = 20.0 autoReadOnly
float property ATTR_MIN = 0.0 autoReadOnly

GlobalVariable property attributeValueGlobal auto
GlobalVariable property attributeRateGlobal auto

int property delayedAttributeIncreaseIntervals = 0 auto hidden
Spell[] property attributeSpells auto hidden
Message[] property attributeMessages auto hidden
Sound[] property attributeSounds auto hidden
ImageSpaceModifier[] property attributeISMs auto hidden
float property lastAttributeValue = 0.0 auto hidden
bool property wasSleeping = false auto hidden
string property meterUpdateEvent auto hidden
string property meterForceEvent auto hidden


function StartSystem()
	parent.StartSystem()

	RegisterForSleep()
endFunction

Event OnUpdateGameTime()
    IncreaseAttributeOverTime(attributeValueGlobal, attributeRateGlobal)
EndEvent

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	wasSleeping = true
EndEvent

function IncreaseAttribute(GlobalVariable attribute, float amount)
	float currentAttributeValue = attribute.GetValue()
	if currentAttributeValue + amount >= ATTR_MAX
		attribute.SetValue(ATTR_MAX)
	else
		attribute.SetValue(currentAttributeValue + amount)
	endif
	SendEvent_UpdateAttributeMeter()
    ApplyAttributeEffects(attribute)
endFunction

function DecreaseAttribute(GlobalVariable attribute, float amount)
	float currentAttributeValue = attribute.GetValue()
	if currentAttributeValue - amount <= ATTR_MIN
		attribute.SetValue(ATTR_MIN)
	else
		attribute.SetValue(currentAttributeValue - amount)
	endif
	SendEvent_UpdateAttributeMeter()
    ApplyAttributeEffects(attribute)
endFunction

function ModAttribute(GlobalVariable attribute, float amount)
	float currentAttributeValue = attribute.GetValue()
	if currentAttributeValue + amount >= ATTR_MAX
		attribute.SetValue(ATTR_MAX)
	elseif currentAttributeValue + amount <= ATTR_MIN
		attribute.SetValue(ATTR_MIN)
	else
		attribute.SetValue(currentAttributeValue + amount)
	endif
    SendEvent_UpdateAttributeMeter()
    ApplyAttributeEffects(attribute)
endFunction

function SetAttribute(GlobalVariable attribute, float value)
	if value >= ATTR_MAX
		attribute.SetValue(ATTR_MAX)
	elseif value <= ATTR_MIN
		attribute.SetValue(ATTR_MIN)
	else
		attribute.SetValue(value)
	endif
    SendEvent_UpdateAttributeMeter()
    ApplyAttributeEffects(attribute)
endFunction

function IncreaseAttributeOverTime(GlobalVariable attribute, GlobalVariable rate)
	;@TODO: Handle vampire behavior

	if IsPlayerFocused()
		delayedAttributeIncreaseIntervals += 1
		return
	endif

	float thisRate = rate.GetValue()
	float thisTime = GetCurrentGameTime() * 24.0
	int cycles = Math.Floor((thisTime - lastUpdateTime) * 2)

	float attributeIncrease
	if !wasSleeping
		attributeIncrease = rate * cycles
	else
		wasSleeping = false
		attributeIncrease = (rate * cycles) / 4
	endif

	IncreaseAttribute(attribute, attributeIncrease, ATTR_MAX)
	lastUpdateTime = thisTime

	if initialized
		RegisterForSingleUpdateGameTime(UpdateFrequencyGlobal.GetValue())
	endif
endFunction

function ApplyAttributeEffects(GlobalVariable attribute)
	float currentAttributeValue = attribute.GetValue()

	bool increasing = false
	if currentAttributeValue > lastAttributeValue
		increasing = true
	endif

	if !(IsUpToAndBetween(lastAttributeValue, ATTR_LEVEL_1, ATTR_MIN)) && (IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_1, ATTR_MIN))
        ApplyAttributeLevel(0)
    
    elseif !(IsUpToAndBetween(lastAttributeValue, ATTR_LEVEL_2, ATTR_LEVEL_1)) && (IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_2, ATTR_LEVEL_1))
        ApplyAttributeLevel(1)
    
    elseif !(IsUpToAndBetween(lastAttributeValue, ATTR_LEVEL_3, ATTR_LEVEL_2)) && (IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_3, ATTR_LEVEL_2))
        ApplyAttributeLevel(2)
    
    elseif !(IsUpToAndBetween(lastAttributeValue, ATTR_LEVEL_4, ATTR_LEVEL_3)) && (IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_4, ATTR_LEVEL_3))
        ApplyAttributeLevel(3)
    
    elseif !(IsUpToAndBetween(lastAttributeValue, ATTR_LEVEL_5, ATTR_LEVEL_4)) && (IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_5, ATTR_LEVEL_4))
        ApplyAttributeLevel(4, true)
    
    elseif !(IsUpToAndBetween(lastAttributeValue, ATTR_MAX, ATTR_LEVEL_5)) && (IsUpToAndBetween(currentAttributeValue, ATTR_MAX, ATTR_LEVEL_5))
        ApplyAttributeLevel(5, true)
    
    endif

    lastAttributeValue = currentAttributeValue
endFunction

function RemoveAllAttributeSpells()
	int i = 0
	while i < attributeSpells.Length
		PlayerRef.RemoveSpell(attributeSpells[i])
		i += 1
	endWhile
endFunction

function ApplyAttributeLevel(int level, bool forceMeter = false)
	Spell thisSpell = attributeSpells[level]
	Message thisMessage = attributeMessages[level]
	Sound thisSound = attributeSounds[level]
	ImageSpaceModifier thisISM = attributeISMs[level]

	RemoveAllAttributeSpells()
    PlayerRef.AddSpell(thisSpell, false)
    if _Seed_Setting_Notifications.GetValueInt() == 2
        thisMessage.Show()
    endif
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2
        if thisSound
        	int sfxid = thisSound.Play(PlayerRef)
        endif
    endif
    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        if thisISM
        	thisISM.ApplyCrossFade(4.0)
        endif
    endif

    if forceMeter
    	SendEvent_ForceExposureMeterDisplay()
    endif
endFunction

;@NOFALLBACK
function SendEvent_UpdateAttributeMeter()
	if GetSKSELoaded()
		int handle = ModEvent.Create(meterUpdateEvent)
		if handle
			ModEvent.Send(handle)
		endif
	endif
endFunction

;@NOFALLBACK
function SendEvent_ForceAttributeMeterDisplay(bool flash = false)
	if GetSKSELoaded()
		int handle = ModEvent.Create(meterForceEvent)
		if handle
			ModEvent.PushBool(handle, flash)
			ModEvent.Send(handle)
		endif
	endif
endFunction