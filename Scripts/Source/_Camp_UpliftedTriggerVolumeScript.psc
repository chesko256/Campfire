scriptname _Camp_UpliftedTriggerVolumeScript extends ObjectReference

Actor property PlayerRef auto
GlobalVariable property _Camp_PerkRank_HighSpirits auto
Spell property _Camp_InspiredSpell1 auto
Spell property _Camp_InspiredSpell1_Perk1 auto
Spell property _Camp_InspiredSpell1_Perk2 auto
Spell property _Camp_InspiredSpell2 auto
Spell property _Camp_InspiredSpell2_Perk1 auto
Spell property _Camp_InspiredSpell2_Perk2 auto
Message property _Camp_Inspired1Message auto
Message property _Camp_Inspired2Message auto
int property bonus_level = 0 auto hidden

bool player_in_trigger = false

Event OnTriggerEnter(ObjectReference akActionRef)
	player_in_trigger = true
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
	Utility.Wait(0.5)
	player_in_trigger = false
	ApplyBonus()
EndEvent

function FireBurnedOut()
	if player_in_trigger
		ApplyBonus()
		bonus_level = 0
	endif
endFunction

function ApplyBonus()
	if bonus_level == 1
		int perk_rank = _Camp_PerkRank_HighSpirits.GetValueInt()
		if perk_rank == 0
			PlayerRef.RemoveSpell(_Camp_InspiredSpell1)
			Utility.Wait(0.2)
			PlayerRef.AddSpell(_Camp_InspiredSpell1, false)
		elseif perk_rank == 1
			PlayerRef.RemoveSpell(_Camp_InspiredSpell1_Perk1)
			Utility.Wait(0.2)
			PlayerRef.AddSpell(_Camp_InspiredSpell1_Perk1, false)
		elseif perk_rank == 2
			PlayerRef.RemoveSpell(_Camp_InspiredSpell1_Perk2)
			Utility.Wait(0.2)
			PlayerRef.AddSpell(_Camp_InspiredSpell1_Perk2, false)
		endif
		_Camp_Inspired1Message.Show()
	elseif bonus_level == 2
        int perk_rank = _Camp_PerkRank_HighSpirits.GetValueInt()
        if perk_rank == 0
        	PlayerRef.RemoveSpell(_Camp_InspiredSpell2)
        	Utility.Wait(0.2)
            PlayerRef.AddSpell(_Camp_InspiredSpell2, false)
        elseif perk_rank == 1
        	PlayerRef.RemoveSpell(_Camp_InspiredSpell2_Perk1)
        	Utility.Wait(0.2)
            PlayerRef.AddSpell(_Camp_InspiredSpell2_Perk1, false)
        elseif perk_rank == 2
        	PlayerRef.RemoveSpell(_Camp_InspiredSpell2_Perk2)
        	Utility.Wait(0.2)
            PlayerRef.AddSpell(_Camp_InspiredSpell2_Perk2, false)
        endif
        _Camp_Inspired2Message.Show()
	endif
endFunction