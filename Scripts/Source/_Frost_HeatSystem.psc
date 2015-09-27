scriptname _Frost_HeatSystem extends _Frost_BaseSystem

import _FrostInternal

function Update()
	float this_update_time = Game.GetRealHoursPassed()

	UpdateHeatState()

	FrostDebug(0, "%%%% Heat update finished in " + ((Game.GetRealHoursPassed() - this_update_time) * 3600.0) + " seconds.")
endFunction

function UpdateHeatState()

endFunction



bool function GetFireState()						;Approved 2.5
	;Find out if the player is standing near a heat source
	bool bNearFire = false

	if bNearFire == false
		objectreference myFire = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_HeatSources, pPlayer, 300.0)
		if myFire != None
			if !(myFire.IsDisabled())	;Don't warm up near disabled fires
				bNearFire = true
				NearestCampfire.ForceRefTo(myFire)
				_DE_FireDistance.SetValue(pPlayer.GetDistance(myFire))
				if _DE_SmallFires.HasForm(myFire.GetBaseObject())
					if myFire.GetPositionZ() - pPlayer.GetPositionZ() >= 85.0
						;The small fire is high up
						_DE_NearSmallFire.SetValue(1)
						FrostfallDebug(3, "I am near a small fire but it's too high, _DE_HeatSources")
					else
						_DE_NearSmallFire.SetValue(2)
						FrostfallDebug(3, "I am near a small fire, _DE_HeatSources")
					endif
				else
					_DE_NearSmallFire.SetValue(1)
					FrostfallDebug(3, "I am not near a small fire, _DE_HeatSources")
				endif
			endif
		endif
	endif
	
	if bNearFire == false
		objectreference myMedFire = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_HeatSources_Med, pPlayer,  450.0)
		if myMedFire != None
			if !(myMedFire.IsDisabled())
				bNearFire = true
				NearestCampfire.ForceRefTo(myMedFire)
				_DE_FireDistance.SetValue(pPlayer.GetDistance(myMedFire))
				if _DE_SmallFires.HasForm(myMedFire.GetBaseObject())
					_DE_NearSmallFire.SetValue(2)
					FrostfallDebug(3, "I am near a small fire, _DE_HeatSources_Med")
				else
					_DE_NearSmallFire.SetValue(1)
					FrostfallDebug(3, "I am not near a small fire, _DE_HeatSources_Med")
				endif
			endif
		endif
	endif
	
	if bNearFire == false
		objectreference myBigFire = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_HeatSources_Big, pPlayer,  600.0)
		if myBigFire != none
			if !(myBigFire.IsDisabled())
				bNearFire = true
				NearestCampfire.ForceRefTo(myBigFire)
				_DE_FireDistance.SetValue(220.0)	;Set artificially low so things will trigger
				_DE_NearSmallFire.SetValue(1)
			endif
		endif
	endif
	
	if bNearFire == false
		_DE_FireDistance.SetValue(-1)
	endif
	
	;If the player is in an inn, they are warm everywhere inside it.
	Location myLocation = pPlayer.GetCurrentLocation()
	if myLocation != none && myLocation.HasKeyword(LocTypeInn)
		bNearFire = true
	endif

	if bNearFire == true
		if iFireMessageLock <= 2
			if !bIsVampire
				if _DE_ExposurePoints.GetValue() <= 100.0
					int myWeatherClass = GetWeatherClassificationActual(wMyWeather)
					bool bInSnowNoTent = ( _DE_ExposurePoints.GetValue() >= 50.0 && iIsInTent == 0 && myWeatherClass == 3 )
					bool bInRainNoTent = ( _DE_ExposurePoints.GetValue() >= 70.0 && iIsInTent == 0 && myWeatherClass == 2 )
					
					if (( bInSnowNoTent ) || ( bInRainNoTent )) && !bInInterior && !bTakingShelter
						if iFireMessageLock == 2
							_DE_Tent_Needed.Show()
						endif
					else
						if _DE_Setting_ConditionMsg.GetValueInt() == 2 && iFireMessageLock == 1
							_DE_WarmUp.Show()
						endif
					endif
					iFireMessageLock += 1
				else
					iFireMessageLock = 2
				endif
			endif
		endif
		return bNearFire
	else
		_DE_FireDistance.SetValue(-1)
		iFireMessageLock = 0
		return bNearFire
	endif
endFunction