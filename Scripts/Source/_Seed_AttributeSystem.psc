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

float property ATTR_MAX = 120.0 auto hidden
float property ATTR_LEVEL_5 = 100.0 auto hidden
float property ATTR_LEVEL_4 = 80.0 auto hidden
float property ATTR_LEVEL_3 = 60.0 auto hidden
float property ATTR_LEVEL_2 = 40.0 auto hidden
float property ATTR_LEVEL_1 = 20.0 auto hidden
float property ATTR_MIN = 0.0 auto hidden

GlobalVariable property attributeEnabled auto
GlobalVariable property attributeValueGlobal auto
GlobalVariable property attributeRateGlobal auto
GlobalVariable property attributeLevelGlobal auto
bool property undeadImmunity = false auto

int property delayedAttributeIncreaseIntervals = 0 auto hidden
Spell[] property attributeSpells auto hidden
Message[] property attributeMessages auto hidden
Sound[] property attributeSounds auto hidden
ImageSpaceModifier[] property attributeISMs auto hidden
float property lastAttributeValue = 0.0 auto hidden
bool property wasSleeping = false auto hidden
string property meterUpdateEvent auto hidden
string property meterForceEvent auto hidden
string property debugSystemName auto hidden

float property lastUpdateTime = 0.0 auto hidden


function StartSystem()
	parent.StartSystem()

	; Turn on the Enabled global, if necessary
	if attributeEnabled.GetValueInt() != 2
		attributeEnabled.SetValueInt(2)
	endif

	RegisterForSleep()
	SeedDebug(1, "[" + debugSystemName + "]: Started.")
endFunction

function StopSystem()
	parent.StopSystem()
	SeedDebug(1, "[" + debugSystemName + "]: Stopped.")
endFunction

function Update()
	if attributeEnabled.GetValueInt() == 2
    	ChangeAttributeOverTime()
    endif
endFunction

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	wasSleeping = true
EndEvent

function IncreaseAttribute(float amount, float target = -1.0)
	if undeadImmunity && IsPlayerUndead() && amount > 0.0
		return
	endif
	
	float currentAttributeValue = attributeValueGlobal.GetValue()
	if currentAttributeValue + amount >= ATTR_MAX
		attributeValueGlobal.SetValue(ATTR_MAX)
	else
		attributeValueGlobal.SetValue(currentAttributeValue + amount)
	endif
	SendEvent_UpdateAttributeMeter()
    ApplyAttributeEffects()
endFunction

function DecreaseAttribute(float amount, float target = -1.0)
	float currentAttributeValue = attributeValueGlobal.GetValue()
	if currentAttributeValue - amount <= ATTR_MIN
		attributeValueGlobal.SetValue(ATTR_MIN)
	else
		attributeValueGlobal.SetValue(currentAttributeValue - amount)
	endif
	SendEvent_UpdateAttributeMeter()
    ApplyAttributeEffects()
endFunction

function ModAttribute(float amount)
	if undeadImmunity && IsPlayerUndead() && amount > 0.0
		return
	endif

	float currentAttributeValue = attributeValueGlobal.GetValue()
	if currentAttributeValue + amount >= ATTR_MAX
		attributeValueGlobal.SetValue(ATTR_MAX)
	elseif currentAttributeValue + amount <= ATTR_MIN
		attributeValueGlobal.SetValue(ATTR_MIN)
	else
		attributeValueGlobal.SetValue(currentAttributeValue + amount)
	endif
    SendEvent_UpdateAttributeMeter()
    ApplyAttributeEffects()
endFunction

function SetAttribute(float value)
	if value >= ATTR_MAX
		attributeValueGlobal.SetValue(ATTR_MAX)
	elseif value <= ATTR_MIN
		attributeValueGlobal.SetValue(ATTR_MIN)
	else
		attributeValueGlobal.SetValue(value)
	endif
    SendEvent_UpdateAttributeMeter()
    ApplyAttributeEffects()
endFunction

function ChangeAttributeOverTime(bool suspendWhileSleeping = false)
	SeedDebug(1, "[" + debugSystemName + "]: ChangeAttributeOverTime()")
	; Skip the first update.
	if lastUpdateTime == 0.0
		lastUpdateTime = Utility.GetCurrentGameTime() * 24.0
		return
	endif

	float thisTime = Utility.GetCurrentGameTime() * 24.0

	if suspendWhileSleeping && wasSleeping
		wasSleeping = false
		lastUpdateTime = thisTime
		return
	endif

	float thisRate = attributeRateGlobal.GetValue()

	if undeadImmunity && IsPlayerUndead() && attributeRateGlobal.GetValue() > 0.0
		return
	endif

	int cycles = Math.Floor((thisTime - lastUpdateTime) * 2)
	if cycles < 1
		cycles = 1
	endif

	if IsPlayerFocused()
		delayedAttributeIncreaseIntervals += cycles
		SeedDebug(1, "[" + debugSystemName + "]: Player is focused. Delaying update. (" + delayedAttributeIncreaseIntervals + " updates delayed)")
		return
	endif

	int totalCycles = cycles + delayedAttributeIncreaseIntervals
	delayedAttributeIncreaseIntervals = 0
	SeedDebug(1, "[" + debugSystemName + "]: Updating, " + totalCycles + " cycles.")

	float attributeIncrease
	if !wasSleeping
		attributeIncrease = thisRate * totalCycles
	else
		wasSleeping = false
		attributeIncrease = (thisRate * totalCycles) / 4
	endif

	SeedDebug(1, "[" + debugSystemName + "]: Total attribute increase: " + attributeIncrease)
	IncreaseAttribute(attributeIncrease)
	lastUpdateTime = thisTime

	RegisterForSingleUpdateGameTime(UpdateFrequencyGlobal.GetValue())
endFunction

function RunDelayedCycles()
	float thisRate = attributeRateGlobal.GetValue()
	int totalCycles = delayedAttributeIncreaseIntervals
	SeedDebug(1, "[" + debugSystemName + "]: Updating, " + totalCycles + " cycles (running delayed updates).")
	delayedAttributeIncreaseIntervals = 0
	float attributeIncrease = thisRate * totalCycles
	SeedDebug(1, "[" + debugSystemName + "]: Total attribute increase: " + attributeIncrease)
	IncreaseAttribute(attributeIncrease)
endFunction

function ApplyAttributeEffects()
	float currentAttributeValue = attributeValueGlobal.GetValue()

	bool increasing = false
	if currentAttributeValue > lastAttributeValue
		increasing = true
	endif

	if !(IsUpToAndBetween(lastAttributeValue, ATTR_LEVEL_1, ATTR_MIN)) && (IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_1, ATTR_MIN))
        ApplyAttributeLevel(0, increasing)
    
    elseif !(IsUpToAndBetween(lastAttributeValue, ATTR_LEVEL_2, ATTR_LEVEL_1)) && (IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_2, ATTR_LEVEL_1))
        ApplyAttributeLevel(1, increasing)
    
    elseif !(IsUpToAndBetween(lastAttributeValue, ATTR_LEVEL_3, ATTR_LEVEL_2)) && (IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_3, ATTR_LEVEL_2))
        ApplyAttributeLevel(2, increasing)
    
    elseif !(IsUpToAndBetween(lastAttributeValue, ATTR_LEVEL_4, ATTR_LEVEL_3)) && (IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_4, ATTR_LEVEL_3))
        ApplyAttributeLevel(3, increasing)
    
    elseif !(IsUpToAndBetween(lastAttributeValue, ATTR_LEVEL_5, ATTR_LEVEL_4)) && (IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_5, ATTR_LEVEL_4))
        ApplyAttributeLevel(4, increasing, true, true, 1)
    
    elseif !(IsUpToAndBetween(lastAttributeValue, ATTR_MAX, ATTR_LEVEL_5)) && (IsUpToAndBetween(currentAttributeValue, ATTR_MAX, ATTR_LEVEL_5))
        ApplyAttributeLevel(5, increasing, true, true, 1)
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

function RemoveAllISMs()
	int i = 0
	while i < attributeISMs.Length
		if attributeISMs[i]
			attributeISMs[i].Remove()
		endif
		i += 1
	endWhile
endFunction

function ApplyAttributeLevel(int level, bool isIncreasing, bool forceMeter = false, bool flashMeter = false, int rumbleLevel = 0, bool lowerIsWorse = false, bool bypassVitalityTargetUpdate = false)
	SeedDebug(0, "[" + debugSystemName + "] level " + level + ", isIncreasing " + isIncreasing + ", forceMeter " + forceMeter + ", rumbleLevel " + rumbleLevel)

	attributeLevelGlobal.SetValueInt(level)

	Spell thisSpell = attributeSpells[level]
	Message thisMessage = attributeMessages[level]
	Sound thisSound = attributeSounds[level]
	ImageSpaceModifier thisISM = attributeISMs[level]

	RemoveAllAttributeSpells()
    PlayerRef.AddSpell(thisSpell, false)

    if _Seed_Setting_Notifications.GetValueInt() == 2
    	SeedDebug(0, "[" + debugSystemName + "]: Showing message.")
        thisMessage.Show()
    endif
    
    if _Seed_Setting_NeedsSFX.GetValueInt() == 2 && ((!lowerIsWorse && isIncreasing) || (lowerIsWorse && !isIncreasing))
        if thisSound
        	SeedDebug(0, "[" + debugSystemName + "]: Playing sound.")
        	int sfxid = thisSound.Play(PlayerRef)
        endif
    endif

    if _Seed_Setting_NeedsVFX.GetValueInt() == 2
        if thisISM
        	SeedDebug(0, "[" + debugSystemName + "]: Applying crossfade ISM.")
        	thisISM.ApplyCrossFade(4.0)
        else
        	RemoveAllISMs()
        endif
    endif

    if forceMeter
    	SeedDebug(0, "[" + debugSystemName + "]: Forcing meter display.")
    	SendEvent_ForceAttributeMeterDisplay(flashMeter)
    endif

    if rumbleLevel > 0 && ((!lowerIsWorse && isIncreasing) || (lowerIsWorse && !isIncreasing))
    	if rumbleLevel == 1
    		SeedDebug(0, "[" + debugSystemName + "]: Playing rumble level 1.")
    		Game.ShakeController(0.6, 0.2, 1.0)
    	elseif rumbleLevel == 2
    		SeedDebug(0, "[" + debugSystemName + "]: Playing rumble level 2.")
    		Game.ShakeController(0.2, 0.4, 2.0)
    	endif
    endif

    if !bypassVitalityTargetUpdate
    	GetVitalitySystem().UpdateVitalityTarget()
    endif
endFunction

function DisplayCurrentStatus()
	float currentAttributeValue = attributeValueGlobal.GetValue()

	if IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_1, ATTR_MIN)
		attributeMessages[0].Show()
    
    elseif IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_2, ATTR_LEVEL_1)
        attributeMessages[1].Show()
    
    elseif IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_3, ATTR_LEVEL_2)
        attributeMessages[2].Show()
    
    elseif IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_4, ATTR_LEVEL_3)
        attributeMessages[3].Show()
    
    elseif IsUpToAndBetween(currentAttributeValue, ATTR_LEVEL_5, ATTR_LEVEL_4)
        attributeMessages[4].Show()
    
    elseif IsUpToAndBetween(currentAttributeValue, ATTR_MAX, ATTR_LEVEL_5)
        attributeMessages[5].Show()
    endif

    SendEvent_ForceAttributeMeterDisplay()
endFunction

function RegisterForEvents()
	; Extend
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