scriptname _Seed_FatigueSystem extends _Seed_AttributeSystem

;@TODO: Catch shock spell damage, which reduces magicka
;@TODO: Look for other sources of magicka damage

;@TODO: Is this going to be used?
; GlobalVariable property _Seed_FatigueActionRateMasterSpells auto 		; Default - 10.0
; GlobalVariable property _Seed_FatigueActionRateExpertSpells auto 		; Default - 2.0
; GlobalVariable property _Seed_FatigueActionRateAdeptSpells auto 		; Default - 1.0
; GlobalVariable property _Seed_FatigueActionRateApprenticeSpells auto 	; Default - 0.5

Spell property _Seed_FatigueSpell1 auto
Spell property _Seed_FatigueSpell2 auto
Spell property _Seed_FatigueSpell3 auto
Spell property _Seed_FatigueSpell4 auto
Spell property _Seed_FatigueSpell5 auto
Spell property _Seed_FatigueSpell6 auto

Message property _Seed_FatigueLevel1Msg auto
Message property _Seed_FatigueLevel2Msg auto
Message property _Seed_FatigueLevel3Msg auto
Message property _Seed_FatigueLevel4Msg auto
Message property _Seed_FatigueLevel5Msg auto
Message property _Seed_FatigueLevel6Msg auto

Quest property _Seed_FatigueMeterQuest auto

float property lastSleepDuration = 0.0 auto hidden

;@TODO
float SLEEP_RESTORE_RATE = 0.0

;@TODO: ????
int locksPicked

function StartSystem()
    parent.StartSystem()

    attributeSpells[0] = _Seed_FatigueSpell1
    attributeSpells[1] = _Seed_FatigueSpell2
    attributeSpells[2] = _Seed_FatigueSpell3
    attributeSpells[3] = _Seed_FatigueSpell4
    attributeSpells[4] = _Seed_FatigueSpell5
    attributeSpells[5] = _Seed_FatigueSpell6

    attributeMessages[0] = _Seed_FatigueLevel1Msg
    attributeMessages[1] = _Seed_FatigueLevel2Msg
    attributeMessages[2] = _Seed_FatigueLevel3Msg
    attributeMessages[3] = _Seed_FatigueLevel4Msg
    attributeMessages[4] = _Seed_FatigueLevel5Msg
    attributeMessages[5] = _Seed_FatigueLevel6Msg

    ;@TODO: Sounds

    ;@TODO: ISMs

    RegisterForEvents()

    ; Apply initial condition.
    IncreaseAttribute(0.01)
endFunction

function RegisterForEvents()
    if !self.IsRunning()
        return
    endif

    ; Register for archery attacks and lockpicking.
    RegisterForTrackedStatsEvent()
    RegisterForActorAction(6)
endFunction

;
; Action Detection
;

Event OnTrackedStatsEvent(string arStatName, int aiStatValue)
	if arStatName == "Locks Picked" && aiStatValue > locksPicked
		debug.trace("[Seed] (Fatigue) Lock Picked")
		locksPicked = aiStatValue
		IncreaseAttribute(1.0)
		int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
		if mode >= 1 && mode <= 2
        	(_Seed_FatigueMeterQuest as _Seed_FatigueMeterController).DisplayMeter()
    	endif
	endif
EndEvent

Event OnActorAction(int actionType, Actor akActor, Form source, int slot)
	if akActor == PlayerRef
		debug.trace("[Seed] (Fatigue) Archery Attack")
		IncreaseAttribute(0.2)
		int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
		if mode >= 1 && mode <= 2
        	(_Seed_FatigueMeterQuest as _Seed_FatigueMeterController).DisplayMeter()
    	endif
	endif
EndEvent

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
    wasSleeping = true

    ;@TODO: Does this work when we transition to the next day?
	lastSleepDuration = (afDesiredSleepEndTime - afSleepStartTime) * 24.0
EndEvent

Event OnSleepStop(bool abInterrupted)
    ; if not interrupted...
	;@TODO: Modify by current hunger and thirst.
	float fatigue_decrease = lastSleepDuration * SLEEP_RESTORE_RATE
	DecreaseAttribute(fatigue_decrease)
EndEvent

;/ @TODO Requires SKSE
function SpellCast(Spell akSpell)
	;@TODO: Increase Fatigue during concentration spell cast
	if akSpell
		int mag_level = (akSpell.GetNthEffectMagicEffect(akSpell.GetCostliestEffectIndex())).GetSkillLevel()
		if mag_level >= 100
			IncreaseFatigue(_Seed_FatigueActionRateMasterSpells.GetValue())
		elseif mag_level >= 75
			IncreaseFatigue(_Seed_FatigueActionRateExpertSpells.GetValue())
		elseif mag_level >= 50
			IncreaseFatigue(_Seed_FatigueActionRateAdeptSpells.GetValue())
		elseif mag_level >= 25
			IncreaseFatigue(_Seed_FatigueActionRateApprenticeSpells.GetValue())
		elseif mag_level < 25
			IncreaseFatigue(_Seed_FatigueActionRateNoviceSpells.GetValue())
		endif
		int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
		if mode >= 1 && mode <= 3
        	(_Seed_FatigueMeterQuest as _Seed_FatigueMeterController).DisplayMeter()
    	endif
	endif
endFunction
/;
