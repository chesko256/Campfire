scriptname _Frost_PlayerSpellMonitor extends ReferenceAlias

import FrostUtil
import CampUtil

GlobalVariable property _Frost_WetLevel auto
GlobalVariable property _Frost_PerkRank_FrostWarding auto
Keyword property MagicDamageFire auto
Keyword property MagicDamageFrost auto
Keyword property _Frost_WetStateKeyword auto
Actor property PlayerRef auto
EffectShader property SteamFXShader auto

bool fire_damage_lock = false
bool frost_damage_lock = false

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	if !fire_damage_lock && akEffect.HasKeyword(MagicDamageFire)
		DecreaseExposureWetnessFireDamage()
	elseif !frost_damage_lock && akEffect.HasKeyword(MagicDamageFrost)
		IncreaseExposureFrostDamage()
	endif
EndEvent

function DispelWetness()
	_Frost_WetnessSystem wet = GetWetnessSystem()
	wet.ModAttributeWetness(-wet.MAX_WETNESS, wet.MIN_WETNESS)
	if _Frost_WetLevel.GetValueInt() > 0
		SteamFXShader.Play(PlayerRef, 1.5)
		wet.UpdateWetLevel()
	endif
endFunction

function DecreaseExposureWetnessFireDamage()
	fire_damage_lock = true
	if !PlayerRef.IsSwimming()
		DispelWetness()
	endif
	SendEvent_ForceExposureMeterDisplay()
	ModPlayerExposure(-5.0, 50.0)
	Utility.Wait(4.0)
	fire_damage_lock = false
endFunction

function IncreaseExposureFrostDamage()
	frost_damage_lock = true
	float frost_ward_rank = _Frost_PerkRank_FrostWarding.GetValue()
	float exposure_increase = 5.0 * (1 - (0.25 * frost_ward_rank))
	SendEvent_ForceExposureMeterDisplay()
	ModPlayerExposure(exposure_increase, 90.0)
	Utility.Wait(4.0)
	frost_damage_lock = false
endFunction

;@NOFALLBACK
function SendEvent_ForceExposureMeterDisplay()
	if GetSKSELoaded()
		int handle = ModEvent.Create("Frost_ForceExposureMeterDisplay")
		if handle
			ModEvent.PushBool(handle, false)
			ModEvent.Send(handle)
		endif
	endif
endFunction