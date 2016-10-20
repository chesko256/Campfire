scriptname _Camp_CombinedActionsScript extends ActiveMagicEffect

Message property _Camp_CombinedActionsMenu auto
Actor property PlayerRef auto
Spell property _Camp_CampfireSpell auto
Spell property _Camp_CreateItemSpell auto
Spell property _Camp_HarvestWoodSpell auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	int i = _Camp_CombinedActionsMenu.Show()
	if i == 0
		_Camp_HarvestWoodSpell.Cast(PlayerRef, PlayerRef)
	elseif i == 1
		_Camp_CampfireSpell.Cast(PlayerRef, PlayerRef)
	elseif i == 2
		_Camp_CreateItemSpell.Cast(PlayerRef, PlayerRef)
	elseif i == 3
		; Exit
	endif
EndEvent