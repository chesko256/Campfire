scriptname _DE_ExposureMeterUpdate extends Quest

_DE_EPMonitor_1_6 property Frostfall auto
_DE_ExposureMeter property ExposureMeter auto
_DE_Compatibility property Compatibility auto
GlobalVariable property _DE_ExposurePoints auto
GlobalVariable property _DE_FireDistance auto
GlobalVariable property _DE_EMColorCold_Light auto
GlobalVariable property _DE_EMColorCold_Dark auto
GlobalVariable property _DE_EMColorWarm_Light auto
GlobalVariable property _DE_EMColorWarm_Dark auto
GlobalVariable property _DE_ExposureMeterDisplay_Contextual auto
GlobalVariable property _DE_ExposureMeter_Opacity auto
GlobalVariable property _DE_MeterDisplayTime auto
FormList property _DE_SleepObjects auto
Actor property PlayerRef auto

float fLastExposureValue
int iDisplayIterationsRemaining

Event OnInit()
	ExposureMeter.HAnchor = "right"
	ExposureMeter.VAnchor = "top"
	ExposureMeter.X = 1219.0
	ExposureMeter.Y = 75.2
	StartUpdating()
endEvent

Event OnGameReload()
	StartUpdating()
endEvent

Event OnUpdate()
	if Compatibility.isSKYUILoaded
		if Frostfall.pSetting_IsRunning == false || Frostfall.ShutdownState == true
			ExposureMeter.Alpha = 0.0
		else
			UpdateMeter()
		endif
	endif
	RegisterForSingleUpdate(2)
endEvent

function StartUpdating()
	RegisterForSingleUpdate(2)
endFunction

function UpdateMeter(bool bSkipDisplayHandling = false)
	float fThisExposureValue = _DE_ExposurePoints.GetValue()
	if fThisExposureValue > 100.0
		UpdateWarm(fThisExposureValue, bSkipDisplayHandling)
	else
		UpdateCold(fThisExposureValue, bSkipDisplayHandling)
	endif
	fLastExposureValue = fThisExposureValue

	if iDisplayIterationsRemaining > 0
		iDisplayIterationsRemaining -= 1
		if iDisplayIterationsRemaining <= 0
			iDisplayIterationsRemaining = 0
			if _DE_ExposureMeterDisplay_Contextual.GetValueInt() != 1
				ExposureMeter.FadeTo(0.0, 3.0)
			endif
		endif
	elseif iDisplayIterationsRemaining == 0
		if ExposureMeter.Alpha == _DE_ExposureMeter_Opacity.GetValue()
			if _DE_ExposureMeterDisplay_Contextual.GetValueInt() != 1
				ExposureMeter.FadeTo(0.0, 3.0)
			endif
		endif
	else
		;keep it on
	endif
endFunction

function UpdateWarm(float fThisExposureValue, bool bSkipDisplayHandling = false)
	if _DE_ExposureMeterDisplay_Contextual.GetValueInt() == 1
		ExposureMeter.Alpha = _DE_ExposureMeter_Opacity.GetValue()
	elseif _DE_ExposureMeterDisplay_Contextual.GetValueInt() == 2 || bSkipDisplayHandling
		ContextualDisplay(fThisExposureValue)
	elseif _DE_ExposureMeterDisplay_Contextual.GetValueInt() == 0 && iDisplayIterationsRemaining == 0
		ExposureMeter.Alpha = 0.0
		return
	endif
	if fLastExposureValue <= 100.0 && fThisExposureValue > 100.0
		ExposureMeter.ForcePercent(0.0)
	endif
	ExposureMeter.SetPercent((fThisExposureValue - 100.0) / 20.0)
	ExposureMeter.SetColors(_DE_EMColorWarm_Light.GetValueInt(), _DE_EMColorWarm_Dark.GetValueInt())
endFunction

function UpdateCold(float fThisExposureValue, bool bSkipDisplayHandling = false)
	if _DE_ExposureMeterDisplay_Contextual.GetValueInt() == 1
		ExposureMeter.Alpha = _DE_ExposureMeter_Opacity.GetValue()
	elseif _DE_ExposureMeterDisplay_Contextual.GetValueInt() == 2 || bSkipDisplayHandling
		ContextualDisplay(fThisExposureValue, bSkipDisplayHandling)
	elseif _DE_ExposureMeterDisplay_Contextual.GetValueInt() == 0 && iDisplayIterationsRemaining == 0
		ExposureMeter.Alpha = 0.0
		return
	endif
	if fLastExposureValue > 100.0 && fThisExposureValue <= 100.0
		ExposureMeter.ForcePercent(0.0)
	endif
	ExposureMeter.SetPercent(1.0 - (fThisExposureValue / 100.0))
	ExposureMeter.SetColors(_DE_EMColorCold_Light.GetValueInt(), _DE_EMColorCold_Dark.GetValueInt())
endFunction

function ForceDisplayAndUpdate(bool bSkipDisplayHandling = true)
	if Compatibility.isSKYUILoaded
		;Called by spells that change exposure.
		iDisplayIterationsRemaining = _DE_MeterDisplayTime.GetValueInt()
		ExposureMeter.FadeTo(_DE_ExposureMeter_Opacity.GetValue(), 1.0)
		UpdateMeter(bSkipDisplayHandling)
	endif
endFunction

function ForceDisplayAndUpdateFlash(bool bSkipDisplayHandling = true)
	if Compatibility.isSKYUILoaded
		;Called by spells that change exposure.
		iDisplayIterationsRemaining = _DE_MeterDisplayTime.GetValueInt()
		ExposureMeter.FadeTo(_DE_ExposureMeter_Opacity.GetValue(), 1.0)
		ExposureMeter.ForceFlash()
		UpdateMeter(bSkipDisplayHandling)
	endif
endFunction


function ContextualDisplay(float fThisExposureValue, bool bSkipDisplayHandling = false)
	;debug.trace("[Frostfall] " + fThisExposureValue + " " + fLastExposureValue + " " + iDisplayIterationsRemaining)

	if bSkipDisplayHandling
		iDisplayIterationsRemaining = _DE_MeterDisplayTime.GetValueInt()
		return
	endif

	bool GoingDown = fLastExposureValue > fThisExposureValue
	if GoingDown && fLastExposureValue >= 111 && fThisExposureValue < 111
		;warm, show
		ExposureMeter.FadeTo(_DE_ExposureMeter_Opacity.GetValue(), 2.0)
		iDisplayIterationsRemaining = _DE_MeterDisplayTime.GetValueInt()
	elseif GoingDown && fLastExposureValue >= 101 && fThisExposureValue < 101
		;comfortable, show
		ExposureMeter.FadeTo(_DE_ExposureMeter_Opacity.GetValue(), 2.0)
		iDisplayIterationsRemaining = _DE_MeterDisplayTime.GetValueInt()
	elseif GoingDown && fLastExposureValue >= 81 && fThisExposureValue < 81
		;chilly, show
		ExposureMeter.FadeTo(_DE_ExposureMeter_Opacity.GetValue(), 2.0)
		iDisplayIterationsRemaining = _DE_MeterDisplayTime.GetValueInt()
	elseif GoingDown && fLastExposureValue >= 61 && fThisExposureValue < 61
		;very cold, show
		ExposureMeter.FadeTo(_DE_ExposureMeter_Opacity.GetValue(), 2.0)
		iDisplayIterationsRemaining = _DE_MeterDisplayTime.GetValueInt()
	elseif GoingDown && fLastExposureValue >= 41 && fThisExposureValue < 41
		;freezing, show, flash
		ExposureMeter.FadeTo(_DE_ExposureMeter_Opacity.GetValue(), 2.0)
		ExposureMeter.StartFlash()
		iDisplayIterationsRemaining = -1
	elseif fThisExposureValue < 21
		;freezing to death, show, flash
		ExposureMeter.FadeTo(_DE_ExposureMeter_Opacity.GetValue(), 2.0)
		ExposureMeter.StartFlash()
		iDisplayIterationsRemaining = -1
	elseif !GoingDown && fLastExposureValue != fThisExposureValue && fThisExposureValue < 120.0 && (_DE_FireDistance.GetValue() != -1 || Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_SleepObjects, PlayerRef,  600.0) != None)
		;going up, show
		ExposureMeter.FadeTo(_DE_ExposureMeter_Opacity.GetValue(), 2.0)
		iDisplayIterationsRemaining = -1
	elseif (fLastExposureValue < 120.0 && fThisExposureValue >= 120.0) || (_DE_FireDistance.GetValue() == -1 && fThisExposureValue >= 41)
		if iDisplayIterationsRemaining == -1
			iDisplayIterationsRemaining = _DE_MeterDisplayTime.GetValueInt()
		endif
	endif

endFunction