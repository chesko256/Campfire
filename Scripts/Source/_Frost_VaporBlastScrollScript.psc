Scriptname _Frost_VaporBlastScrollScript extends ActiveMagicEffect

import FrostUtil
import CampUtil

Actor property PlayerRef auto
GlobalVariable property _Frost_WetLevel auto
Message property _Frost_VaporBlastError_Dry auto
Message property _Frost_VaporBlastError_Swimming auto
Spell property _Frost_VaporBlastEffects auto
Sound property FXFireOut auto
Sound property MAGFail auto
EffectShader property SteamFXShader auto
Scroll property myScroll auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if _Frost_WetLevel.GetValueInt() == 0
		_Frost_VaporBlastError_Dry.Show()
		MAGFail.Play(PlayerRef)
		PlayerRef.AddItem(myScroll, 1)
		return
	elseif PlayerRef.IsSwimming()
		_Frost_VaporBlastError_Swimming.Show()
		MAGFail.Play(PlayerRef)
		PlayerRef.AddItem(myScroll, 1)
		return
	endif
	FXFireOut.Play(PlayerRef)
	_Frost_VaporBlastEffects.Cast(PlayerRef)
	SteamFXShader.Play(PlayerRef, 1.5)
	DispelWetness()
EndEvent

function DispelWetness()
	_Frost_WetnessSystem wet = GetWetnessSystem()
	wet.ModAttributeWetness(-wet.MAX_WETNESS, wet.MIN_WETNESS)
	wet.UpdateWetLevel()
	SendEvent_ForceWetnessMeterDisplay()
endFunction

function SendEvent_ForceWetnessMeterDisplay(bool flash = false)
	if GetSKSELoaded()
		int handle = ModEvent.Create("Frost_ForceWetnessMeterDisplay")
		if handle
			ModEvent.PushBool(handle, flash)
			ModEvent.Send(handle)
		endif
	endif
endFunction