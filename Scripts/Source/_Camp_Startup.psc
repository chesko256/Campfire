scriptname _Camp_Startup extends Quest

Actor property PlayerRef auto
ReferenceAlias property PlayerAlias auto
_Camp_Compatibility property Compatibility auto
spell property _DE_SurvivalSkillsCombo_Spell auto
spell property _DE_WalkingStickSpell auto

event OnInit()
	if !self.IsRunning()
		self.Start()
	endif

	PlayerAlias.ForceRefTo(PlayerRef)
	Compatibility.RunStartupCheck()

	PlayerRef.AddSpell(_DE_SurvivalSkillsCombo_Spell, false)		;Survival Skills (multi-select)
	PlayerRef.AddSpell(_DE_WalkingStickSpell, false)
endEvent