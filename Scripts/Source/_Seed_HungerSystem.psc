scriptname _Seed_HungerSystem extends _Seed_AttributeSystem
;/
    Levels of Hunger:
        Well Fed
        Satisfied
        Hungry
        Very Hungry
        Ravenous
        Starving

    Things that affect hunger:
        Time
        Power Attacks
        Blocks

    Update frequency: Every 30 in-game minutes

    Vampire Behavior:
        Mortal: As normal.
        Supernatural: Immune.
        Immune: Immune.
/;

import CampUtil

Spell property HungerSpell1 auto
Spell property HungerSpell2 auto
Spell property HungerSpell3 auto
Spell property HungerSpell4 auto
Spell property HungerSpell5 auto
Spell property HungerSpell6 auto

Message property HungerMessage1 auto
Message property HungerMessage2 auto
Message property HungerMessage3 auto
Message property HungerMessage4 auto
Message property HungerMessage5 auto
Message property HungerMessage6 auto

Sound property HungerSound3 auto
Sound property HungerSound4 auto
Sound property HungerSound5 auto
Sound property HungerSound6 auto

ImageSpaceModifier property HungerISM5 auto
ImageSpaceModifier property HungerISM6 auto

Quest property _Seed_HungerMeterQuest auto

float BLOCK_ACTION_HUNGER = 0.1
float POWERATTACK_ACTION_HUNGER = 0.25

;
; Events
;

function StartSystem()
    parent.StartSystem()

    attributeSpells[0] = HungerSpell1
    attributeSpells[1] = HungerSpell2
    attributeSpells[2] = HungerSpell3
    attributeSpells[3] = HungerSpell4
    attributeSpells[4] = HungerSpell5
    attributeSpells[5] = HungerSpell6

    attributeMessages[0] = HungerMessage1
    attributeMessages[1] = HungerMessage2
    attributeMessages[2] = HungerMessage3
    attributeMessages[3] = HungerMessage4
    attributeMessages[4] = HungerMessage5
    attributeMessages[5] = HungerMessage6

    attributeSounds[2] = HungerSound3
    attributeSounds[3] = HungerSound4
    attributeSounds[4] = HungerSound5
    attributeSounds[5] = HungerSound6

    attributeISMs[4] = HungerISM5
    attributeISMs[5] = HungerISM6

    ; Register for power attacks.
    RegisterForAnimationEvent(PlayerRef, "PowerAttackStop")
    RegisterForAnimationEvent(PlayerRef, "00NextClip")

    ; Apply initial condition.
    IncreaseAttribute(attributeValueGlobal, 0.01)
endFunction

function PlayerHit()
    debug.trace("[Seed] (Hunger) Player Blocked Attack")
    IncreaseAttribute(attributeValueGlobal, BLOCK_ACTION_HUNGER)
endFunction

;
; Action Detection
;

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if asEventName == "PowerAttackStop" || asEventName == "00NextClip"
        debug.trace("[Seed] (Hunger) Player PowerAttacked")
        IncreaseAttribute(attributeValueGlobal, POWERATTACK_ACTION_HUNGER)
        int mode = _Seed_Setting_NeedsMeterDisplayMode.GetValueInt()
        if mode >= 1 && mode <= 3
            (_Seed_HungerMeterQuest as _Seed_HungerMeterController).DisplayMeter()
        endif
    endif
EndEvent

function IncreaseAttribute(GlobalVariable attribute, float amount)
    if IsPlayerUndead()
        return
    else
        parent.IncreaseAttribute(attribute, amount)
    endif
endFunction

function DecreaseAttribute(GlobalVariable attribute, float amount)
    parent.DecreaseAttribute(attribute, amount)
endFunction
    
function ChangeAttributeOverTime(GlobalVariable attribute, GlobalVariable rate)
    if IsPlayerUndead() && rate.GetValue() > 0.0
        return
    else
        parent.ChangeAttributeOverTime(attribute, rate)
    endif
endFunction

function ModAttribute(GlobalVariable attribute, float amount)
    if IsPlayerUndead() && amount > 0.0
        return
    else
        parent.ModAttribute(attribute, amount)
    endif
endFunction
