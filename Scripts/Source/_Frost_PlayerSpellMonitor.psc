scriptname _Frost_PlayerSpellMonitor extends ReferenceAlias

import FrostUtil

MagicEffect property AbResistFrost auto
Keyword property MagicAlchResistFrost auto
Keyword property MagicEnchResistFrost auto
Keyword property MagicDamageFire auto
Keyword property _Frost_WetStateKeyword auto
Actor property PlayerRef auto
Spell property _Frost_FrostResistBonusSpell auto
float old_amount

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	if akEffect == AbResistFrost ||                  \
	   akEffect.HasKeyword(MagicAlchResistFrost) ||  \
	   akEffect.HasKeyword(MagicEnchResistFrost)

	    UpdateFrostResistBonus()
	elseif akEffect.HasKeyword(MagicDamageFire)
		DispelWetness()
	endif
EndEvent

function UpdateFrostResistBonus()
	float amount = PlayerRef.GetAV("FrostResist") / 2.0
	
	if amount == old_amount
		return
	endif

	if amount > 50.0
		amount = 50.0
	endif

	_Frost_FrostResistBonusSpell.SetNthEffectMagnitude(0, amount)
	PlayerRef.RemoveSpell(_Frost_FrostResistBonusSpell)
	Utility.WaitMenuMode(0.1)
	PlayerRef.AddSpell(_Frost_FrostResistBonusSpell, false)
	old_amount = amount
endFunction

function DispelWetness()
	if PlayerRef.HasEffectKeyword(_Frost_WetStateKeyword)
		GetWetnessSystem().ModAttributeWetness(-750.0, 0.0)
	endif
endFunction