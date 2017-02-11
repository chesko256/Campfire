scriptname _Seed_HungerSystem extends _Seed_AttributeSystem

;@TODO: Look for other sources of health damage

; Update frequency = 0.5

GlobalVariable property _Seed_Setting_HungerSystemEnabled auto

;@TODO: Is this going to be used?
; GlobalVariable property _Seed_HungerActionRate auto

Spell property _Seed_HungerSpell1 auto
Spell property _Seed_HungerSpell2 auto
Spell property _Seed_HungerSpell3 auto
Spell property _Seed_HungerSpell4 auto
Spell property _Seed_HungerSpell5 auto
Spell property _Seed_HungerSpell6 auto

Message property _Seed_HungerLevel1Msg auto
Message property _Seed_HungerLevel2Msg auto
Message property _Seed_HungerLevel3Msg auto
Message property _Seed_HungerLevel4Msg auto
Message property _Seed_HungerLevel5Msg auto
Message property _Seed_HungerLevel6Msg auto

Quest property _Seed_HungerMeterQuest auto

;
; Events
;

function StartSystem()
    parent.StartSystem()

    ; Initialize arrays
    attributeSpells = new Spell[6]
    attributeMessages = new Message[6]
    attributeSounds = new Sound[6]
    attributeISMs = new ImageSpaceModifier[6]

    attributeSpells[0] = _Seed_HungerSpell1
    attributeSpells[1] = _Seed_HungerSpell2
    attributeSpells[2] = _Seed_HungerSpell3
    attributeSpells[3] = _Seed_HungerSpell4
    attributeSpells[4] = _Seed_HungerSpell5
    attributeSpells[5] = _Seed_HungerSpell6

    attributeMessages[0] = _Seed_HungerLevel1Msg
    attributeMessages[1] = _Seed_HungerLevel2Msg
    attributeMessages[2] = _Seed_HungerLevel3Msg
    attributeMessages[3] = _Seed_HungerLevel4Msg
    attributeMessages[4] = _Seed_HungerLevel5Msg
    attributeMessages[5] = _Seed_HungerLevel6Msg

    ;@TODO: Sounds

    ;@TODO: ISMs

    ; Register for power attacks and bow attacks.
    RegisterForActorAction(6)
    RegisterForAnimationEvent(PlayerRef, "PowerAttackStop")
    RegisterForAnimationEvent(PlayerRef, "00NextClip")

    ; Apply initial condition.
    IncreaseAttribute(attributeValueGlobal, 0.01)
endFunction

function PlayerHit()
    debug.trace("[Seed] (Hunger) Player Blocked Attack")
    IncreaseAttribute(attributeValueGlobal, 0.1)
endFunction

;
; Action Detection
;

Event OnActorAction(int actionType, Actor akActor, Form source, int slot)
    int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
	; Increase Hunger when the player attacks.
    if akActor == PlayerRef
        if actionType == 6
            debug.trace("[Seed] (Hunger) Archery Attack " + akActor)
            IncreaseAttribute(attributeValueGlobal, 0.1)
            if mode >= 1 && mode <= 2
                (_Seed_HungerMeterQuest as _Seed_HungerMeterController).DisplayMeter()
            endif
        endif
    endif
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if asEventName == "PowerAttackStop" || asEventName == "00NextClip"
        debug.trace("[Seed] (Hunger) Player PowerAttacked")
        IncreaseAttribute(attributeValueGlobal, 0.25)
        int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
        if mode >= 1 && mode <= 3
            (_Seed_HungerMeterQuest as _Seed_HungerMeterController).DisplayMeter()
        endif
    endif
EndEvent

function IncreaseAttribute(GlobalVariable attribute, float amount)
    ;@TODO: Handle vampire state
    ;else,
    parent.IncreaseAttribute(attribute, amount)
endFunction

function DecreaseAttribute(GlobalVariable attribute, float amount)
    ;@TODO: Handle vampire state
    ;else,
    parent.DecreaseAttribute(attribute, amount)
endFunction
    
function IncreaseAttributeOverTime(GlobalVariable attribute, GlobalVariable rate)
    ;@TODO: Handle vampire state
    ;else,
    parent.IncreaseAttributeOverTime(attribute, rate)
endFunction

function ModAttribute(GlobalVariable attribute, float amount)
    ;@TODO: Handle vampire state
    ;else,
    parent.ModAttribute(attribute, amount)
endFunction
