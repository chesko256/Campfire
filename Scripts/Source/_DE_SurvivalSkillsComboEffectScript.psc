scriptname _DE_SurvivalSkillsComboEffectScript extends ActiveMagicEffect

Actor property PlayerRef auto
message property _DE_SurvivalSkillsComboMsg auto
spell property _DE_Campfire2Spell auto
spell property _Camp_SurvivalSkills_CreateItem auto
spell property _DE_HarvestWood auto
Race property WerewolfBeastRace auto
Keyword property Vampire auto
Keyword property ActorTypeCreature auto
Keyword property ImmuneParalysis auto 

Event OnInit()
	if PlayerRef.GetRace().HasKeyword(ActorTypeCreature) || PlayerRef.GetRace().HasKeyword(ImmuneParalysis)
		;@TODO: Error message
	else
		int i = _DE_SurvivalSkillsComboMsg.Show()
		if i == 0
			_DE_Campfire2Spell.Cast(PlayerRef)
		elseif i == 1
			_Camp_SurvivalSkills_CreateItem.Cast(PlayerRef)
		elseif i == 2
			_DE_HarvestWood.Cast(PlayerRef)
		endif
	endif
endEvent