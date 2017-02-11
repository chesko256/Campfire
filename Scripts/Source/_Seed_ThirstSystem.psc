scriptname _Seed_ThirstSystem extends _Seed_AttributeSystem

;@TODO: Catch frost spell damage, which reduces stamina
;@TODO: Look for other sources of stamina damage

GlobalVariable property _Seed_ThirstSystemEnabled auto

;@TODO: Is this going to be used?
; GlobalVariable property _Seed_ThirstActionRate auto         ; Default - 0.25

Spell property _Seed_ThirstSpell1 auto
Spell property _Seed_ThirstSpell2 auto
Spell property _Seed_ThirstSpell3 auto
Spell property _Seed_ThirstSpell4 auto
Spell property _Seed_ThirstSpell5 auto
Spell property _Seed_ThirstSpell6 auto

Message property _Seed_ThirstLevel1Msg auto
Message property _Seed_ThirstLevel2Msg auto
Message property _Seed_ThirstLevel3Msg auto
Message property _Seed_ThirstLevel4Msg auto
Message property _Seed_ThirstLevel5Msg auto
Message property _Seed_ThirstLevel6Msg auto

Quest property _Seed_ThirstMeterQuest auto

GlobalVariable property _Seed_ThirstActionRate auto

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
    
    attributeSpells[0] = _Seed_ThirstSpell1
    attributeSpells[1] = _Seed_ThirstSpell2
    attributeSpells[2] = _Seed_ThirstSpell3
    attributeSpells[3] = _Seed_ThirstSpell4
    attributeSpells[4] = _Seed_ThirstSpell5
    attributeSpells[5] = _Seed_ThirstSpell6

    attributeMessages[0] = _Seed_ThirstLevel1Msg
    attributeMessages[1] = _Seed_ThirstLevel2Msg
    attributeMessages[2] = _Seed_ThirstLevel3Msg
    attributeMessages[3] = _Seed_ThirstLevel4Msg
    attributeMessages[4] = _Seed_ThirstLevel5Msg
    attributeMessages[5] = _Seed_ThirstLevel6Msg

    ;@TODO: Sounds

    ;@TODO: ISMs

    ; Register for sprinting and jumping.
    RegisterForControl("Sprint")
    RegisterForAnimationEvent(PlayerRef, "PowerAttackStop")
    RegisterForAnimationEvent(PlayerRef, "00NextClip")

    ; Apply initial condition.
    IncreaseAttribute(attributeValueGlobal, 0.01)
endFunction

;
; Action Detection
;

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if asEventName == "PowerAttackStop" || asEventName == "00NextClip"
        debug.trace("[Seed] (Thirst) Player PowerAttacked")
        IncreaseAttribute(attributeValueGlobal, 0.25)
        int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
        if mode >= 1 && mode <= 3
            (_Seed_ThirstMeterQuest as _Seed_ThirstMeterController).DisplayMeter()
        endif
    endif
EndEvent

function PlayerHit()
        debug.trace("[Seed] (Thirst) Player Blocked Attack")
        IncreaseAttribute(attributeValueGlobal, 0.1)
        int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
        if mode >= 1 && mode <= 2
                (_Seed_ThirstMeterQuest as _Seed_ThirstMeterController).DisplayMeter()
        endif
endFunction

;@TODO: Xbox-incompatible. Reimplement?
Event OnControlDown(string control)
    ; Increase Thirst while sprinting or when jumping.
    debug.trace("[Seed] (Thirst) Player Sprinting")
    RegisterForSingleUpdate(2)
    IncreaseAttribute(attributeValueGlobal, _Seed_ThirstActionRate.GetValue())
    int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
    if mode >= 1 && mode <= 3
        (_Seed_ThirstMeterQuest as _Seed_ThirstMeterController).DisplayMeter()
    endif
EndEvent

;@TODO: Is this the best way to handle this?
Event OnUpdate()
    if PlayerRef.IsSprinting()
		    IncreaseAttribute(attributeValueGlobal, _Seed_ThirstActionRate.GetValue())
        int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
        if mode >= 1 && mode <= 2
		        (_Seed_ThirstMeterQuest as _Seed_ThirstMeterController).DisplayMeter()
        endif
        RegisterForSingleUpdate(2)
    else
		    debug.trace("[Seed] (Thirst) Player Sprinting End")
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