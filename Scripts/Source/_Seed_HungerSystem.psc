scriptname _Seed_HungerSystem extends _Seed_AttributeSystem
;/
    Things that affect hunger:
        Time
        Power Attacks
        Blocks

    Vampire Behavior:
        Mortal: As normal.
        Supernatural: Immune.
        Immune: Immune.
/;

import CampUtil 
import _SeedInternal

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

FormList property _Seed_RecentlyEatenFood auto

float REGEN_HUNGER_RATE = 0.50
float lastHealth = 0.0

function StartUp()
    debugSystemName = "Hunger"
    meterUpdateEvent = "LastSeed_UpdateHungerMeter"
    meterForceEvent = "LastSeed_ForceHungerMeterDisplay"

    ; Initialize arrays
    attributeSpells = new Spell[6]
    attributeMessages = new Message[6]
    attributeSounds = new Sound[6]
    attributeISMs = new ImageSpaceModifier[6]

    ; Populate arrays
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

    RegisterForEvents()

    ; Apply initial condition.
    IncreaseAttribute(0.01)
endFunction

function RegisterForEvents()
    if !self.IsRunning()
        return
    endif
endFunction

function ChangeAttributeOverTime(bool suspendWhileSleeping = false)
    parent.ChangeAttributeOverTime(suspendWhileSleeping)

    ; Every update, clear the recently eaten food list.
    _Seed_RecentlyEatenFood.Revert()
    SeedDebug(0, "Cleared the recently eaten food list.")
endFunction

;
; Actions
;

; Impact the player's hunger if the player is regenerating health.
Event OnUpdate()
    bool regenerating = false
    float thisHealth = PlayerRef.GetActorValue("Health")
    if thisHealth > lastHealth
        regenerating = true
    endif

    if regenerating
        if PlayerRef.IsInCombat()
            IncreaseAttribute(REGEN_HUNGER_RATE * 0.5)
        else
            IncreaseAttribute(REGEN_HUNGER_RATE)
        endif
        SendEvent_ForceAttributeMeterDisplay()
        RegisterForSingleUpdate(2)
    else
        RegisterForSingleUpdate(5)
    endif
    lastHealth = thisHealth
EndEvent
