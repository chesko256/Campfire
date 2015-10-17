scriptname _Frost_PlayerFrostResistMonitor extends ReferenceAlias

MagicEffect property AbResistFrost auto
Keyword property MagicAlchResistFrost auto
Keyword property MagicEnchResistFrost auto
Actor property PlayerRef auto
Spell property _Frost_FrostResistBonusSpell auto

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	if akEffect == AbResistFrost ||                  \
	   akEffect.HasKeyword(MagicAlchResistFrost) ||  \
	   akEffect.HasKeyword(MagicEnchResistFrost)

	   UpdateFrostResistBonus()
	endif
EndEvent

function UpdateFrostResistBonus()
	float amount = PlayerRef.GetAV("FrostResist") / 2.0
	if amount > 50.0
		amount = 50.0
	endif
	_Frost_FrostResistBonusSpell.SetNthEffectMagnitude(0, amount)
	PlayerRef.RemoveSpell(_Frost_FrostResistBonusSpell)
	Utility.Wait(0.1)
	PlayerRef.AddSpell(_Frost_FrostResistBonusSpell, false)
endFunction