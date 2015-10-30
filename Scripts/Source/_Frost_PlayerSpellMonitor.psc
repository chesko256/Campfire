scriptname _Frost_PlayerSpellMonitor extends ReferenceAlias

import FrostUtil

MagicEffect property AbResistFrost auto
GlobalVariable property _Frost_WetLevel auto
Keyword property MagicAlchResistFrost auto
Keyword property MagicEnchResistFrost auto
Keyword property MagicDamageFire auto
Keyword property MagicDamageFrost auto
Keyword property _Frost_WetStateKeyword auto
Actor property PlayerRef auto
Spell property _Frost_FrostResistBonusSpell auto
EffectShader property SteamFXShader auto
float old_amount

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	if akEffect == AbResistFrost ||                  \
	   akEffect.HasKeyword(MagicAlchResistFrost) ||  \
	   akEffect.HasKeyword(MagicEnchResistFrost)

	    UpdateFrostResistBonus()
	elseif akEffect.HasKeyword(MagicDamageFire)
		DispelWetness()
		DecreaseExposureFireDamage()
	elseif akEffect.HasKeyword(MagicDamageFrost)
		IncreaseExposureFrostDamage()
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
	_Frost_WetnessSystem wet = GetWetnessSystem()
	if PlayerRef.HasEffectKeyword(_Frost_WetStateKeyword)
		wet.ModAttributeWetness(-wet.MAX_WETNESS, wet.MIN_WETNESS)
		if _Frost_WetLevel.GetValueInt() > 0
			SteamFXShader.Play(PlayerRef, 1.5)
			wet.UpdateWetLevel()
		endif
	endif
endFunction

function DecreaseExposureFireDamage()
	ModPlayerExposure(-5.0, 50.0, true)
endFunction

function IncreaseExposureFrostDamage()
	ModPlayerExposure(5.0, 90.0, true)
endFunction