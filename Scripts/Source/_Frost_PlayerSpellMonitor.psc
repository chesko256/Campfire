scriptname _Frost_PlayerSpellMonitor extends ReferenceAlias

import FrostUtil

MagicEffect property AbResistFrost auto
GlobalVariable property _Frost_WetLevel auto
GlobalVariable property _Frost_PerkRank_FrostWarding auto
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
		DecreaseExposureWetnessFireDamage()
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
	wet.ModAttributeWetness(-wet.MAX_WETNESS, wet.MIN_WETNESS)
	if _Frost_WetLevel.GetValueInt() > 0
		SteamFXShader.Play(PlayerRef, 1.5)
		wet.UpdateWetLevel()
	endif
endFunction

bool fire_damage_lock = false
function DecreaseExposureWetnessFireDamage()
	if fire_damage_lock
		return
	endif
	fire_damage_lock = true
	if !PlayerRef.IsSwimming()
		DispelWetness()
	endif
	SendEvent_ForceExposureMeterDisplay()
	ModPlayerExposure(-5.0, 50.0)
	Utility.Wait(2.0)
	fire_damage_lock = false
endFunction

bool frost_damage_lock = false
function IncreaseExposureFrostDamage()
	if frost_damage_lock
		return
	endif
	frost_damage_lock = true
	float frost_ward_rank = _Frost_PerkRank_FrostWarding.GetValue()
	float exposure_increase = 5.0 * (1 - (0.25 * frost_ward_rank))
	SendEvent_ForceExposureMeterDisplay()
	ModPlayerExposure(exposure_increase, 90.0)
	Utility.Wait(2.0)
	frost_damage_lock = false
endFunction

function SendEvent_ForceExposureMeterDisplay()
	int handle = ModEvent.Create("Frost_ForceExposureMeterDisplay")
	if handle
		ModEvent.PushBool(handle, false)
		ModEvent.Send(handle)
	endif
endFunction