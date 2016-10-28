Scriptname _Frost_KindleEffectScript extends ActiveMagicEffect  

import FrostUtil
import CampUtil

Actor property PlayerRef auto
MiscObject property Firewood01 auto
Perk property Regeneration auto
Message property _Frost_KindleWoodError auto
EffectShader property HealCircleFXS auto
Sound property MAGFail auto

Event OnEffectStart(Actor Target, Actor Caster)
	int firewood_count = PlayerRef.GetItemCount(Firewood01)
	if firewood_count > 0
		RestoreExposure()
	else
		FailNoWood()
	endif
endEvent

function RestoreExposure()
	PlayerRef.RemoveItem(Firewood01, 1)
	HealCircleFXS.Play(PlayerRef, 1.0)
	if PlayerRef.HasPerk(Regeneration)
		ModPlayerExposure(-30.0, 0.0)
	else
		ModPlayerExposure(-20.0, 0.0)
	endif
	SendEvent_ForceExposureMeterDisplay()
endFunction

function FailNoWood()
	MAGFail.Play(PlayerRef)
	_Frost_KindleWoodError.Show()
endFunction

;@NOFALLBACK
function SendEvent_ForceExposureMeterDisplay(bool flash = false)
	if GetSKSELoaded()
		int handle = ModEvent.Create("Frost_ForceExposureMeterDisplay")
		if handle
			ModEvent.PushBool(handle, flash)
			ModEvent.Send(handle)
		endif
	endif
endFunction