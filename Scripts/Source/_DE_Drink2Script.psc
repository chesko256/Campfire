Scriptname _DE_Drink2Script extends ActiveMagicEffect

GlobalVariable property _DE_ExposurePoints auto
_DE_ExposureMeterUpdate property ExposureMeter auto

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	_DE_ExposurePoints.SetValue(_DE_ExposurePoints.GetValue() - 20.0)
	ExposureMeter.ForceDisplayAndUpdate()
endEvent