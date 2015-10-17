Scriptname _Frost_Drink1Script extends ActiveMagicEffect

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	_DE_ExposurePoints.SetValue(_DE_ExposurePoints.GetValue() - 15.0)
	ExposureMeter.ForceDisplayAndUpdate()
endEvent