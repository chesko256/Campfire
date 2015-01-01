Scriptname _DE_KindleEffectScript extends ActiveMagicEffect  

GlobalVariable property _DE_ExposurePoints auto
GlobalVariable property _DE_BadWeather auto
GlobalVariable property _DE_ShelterState auto
MiscObject property Firewood01 auto
Perk property Regeneration auto
Message property _DE_KindleWeatherError auto
Message property _DE_KindleWoodError auto
Message property _DE_KindleExposureRestored auto
Message property _DE_KindleWarmError auto
EffectShader property HealCircleFXS auto
Sound property MAGFail auto
FormList property _DE_WorldspacesInteriors auto
_DE_ExposureMeterUpdate property ExposureMeter auto

Event OnEffectStart(Actor Target, Actor Caster)

	int iFirewoodCount = Game.GetPlayer().GetItemCount(Firewood01)
	if iFirewoodCount > 0
		if IsPlayerInInterior()
			if _DE_ExposurePoints.GetValue() < 110.0
				RestoreExposure()
			else
				FailAlreadyWarm()
			endif
		else
			int iBadWeather = _DE_BadWeather.GetValueInt() 
			if (_DE_ExposurePoints.GetValue() >= 70.0) && (iBadWeather == 1 || iBadWeather == 2) && _DE_ShelterState.GetValue() == 1.0
				Fail()
			elseif (_DE_ExposurePoints.GetValue() >= 50.0) && (iBadWeather > 2)
				Fail()
			else
				if _DE_ExposurePoints.GetValue() < 115.0
					RestoreExposure()
				else
					FailAlreadyWarm()
				endif
			endif
		endif
	else
		FailNoWood()
	endif
endEvent

function RestoreExposure()
	Game.GetPlayer().RemoveItem(Firewood01, 1, true)
	HealCircleFXS.Play(Game.GetPlayer(), 1.0)
	if Game.GetPlayer().HasPerk(Regeneration)
		_DE_ExposurePoints.SetValue(_DE_ExposurePoints.GetValue() + 30.0)
		ExposureMeter.ForceDisplayAndUpdate()
	else
		_DE_ExposurePoints.SetValue(_DE_ExposurePoints.GetValue() + 20.0)
		ExposureMeter.ForceDisplayAndUpdate()
	endif
	_DE_KindleExposureRestored.Show()
	if !IsPlayerInInterior()
		int iBadWeather = _DE_BadWeather.GetValueInt() 
		if (_DE_ExposurePoints.GetValue() >= 70.0) && (iBadWeather > 0)
			_DE_ExposurePoints.SetValue(70.0)
			ExposureMeter.ForceDisplayAndUpdateFlash()
			_DE_KindleWeatherError.Show()
		elseif (_DE_ExposurePoints.GetValue() >= 50.0) && (iBadWeather > 2)
			_DE_ExposurePoints.SetValue(50.0)
			ExposureMeter.ForceDisplayAndUpdateFlash()
			_DE_KindleWeatherError.Show()
		endif
	endif

	if _DE_ExposurePoints.GetValue() >= 120.0
		_DE_ExposurePoints.SetValue(120.0)
	endif
endFunction

function Fail()
	Game.GetPlayer().RemoveItem(Firewood01, 1)
	HealCircleFXS.Play(Game.GetPlayer(), 1.0)
	_DE_KindleWeatherError.Show()
	ExposureMeter.ForceDisplayAndUpdateFlash()
endFunction

function FailNoWood()
	MAGFail.Play(Game.GetPlayer())
	_DE_KindleWoodError.Show()
endFunction

function FailAlreadyWarm()
	MAGFail.Play(Game.GetPlayer())
	_DE_KindleWarmError.Show()
	ExposureMeter.ForceDisplayAndUpdate()
endFunction

bool function IsPlayerInInterior()
	if Game.GetPlayer().IsInInterior()
		return true
	else
		if _DE_WorldspacesInteriors.HasForm(Game.GetPlayer().GetWorldSpace())
			return true
		else
			return false
		endif
	endif
endFunction