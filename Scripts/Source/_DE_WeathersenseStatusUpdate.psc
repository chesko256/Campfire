scriptname _DE_WeathersenseStatusUpdate extends Quest

_DE_WeathersenseStatusWidget property WSWidget auto
_DE_Compatibility property Compatibility auto
_DE_EPMonitor_1_6 property Frostfall auto
GlobalVariable property GameHour auto
GlobalVariable property _DE_CurrentTemp auto
GlobalVariable property _DE_Weathersense_Opacity auto
GlobalVariable property _DE_WeathersenseDisplay_Contextual auto
GlobalVariable property _DE_WeathersenseDisplayTime auto
Formlist property _DE_WorldspacesExteriorOblivion auto
Actor property PlayerRef auto

int iThisTempCat
int iLastTempCat
int iDisplayIterationsRemaining = 0

Event OnInit()
	WSWidget.HAnchor = "center"
	WSWidget.VAnchor = "top"
	WSWidget.X = 640.0
	WSWidget.Y = 0.0
	StartUpdating()
endEvent

Event OnGameReload()
	StartUpdating()
endEvent

Event OnUpdate()
	if Compatibility.isSKYUILoaded
		if Frostfall.pSetting_IsRunning == false || Frostfall.ShutdownState == true
			WSWidget.Alpha = 0.0
		else
			UpdateWidget()
		endif
	endif
	RegisterForSingleUpdate(2)
endEvent

function StartUpdating()
	RegisterForSingleUpdate(2)
endFunction


function UpdateWidget(bool bSkipDisplayHandling = false)

	int iNightFactor = 0
	
	;Day or night?
	if GameHour.GetValue() > 19
		iNightFactor = 5
	elseif GameHour.GetValue() < 7
		iNightFactor = 5
	else
		iNightFactor = 0
	endif
	
	int temp = _DE_CurrentTemp.GetValueInt()
	
	temp -= iNightFactor
		
	if temp >= 18 						;Brilliant Emerald		;The sun is radiant and exhilirating.
		WSWidget.ForcePercent(1.0)
		WSWidget.SetColors(0xFFFF00, 0xCCCC00)
		iThisTempCat = 0
	elseif temp < 18 && temp >= 15		;Bright Green			;The air is warm.
		WSWidget.ForcePercent(1.0)
		WSWidget.SetColors(0xFFFF66, 0xCCCC52)
		iThisTempCat = 1
	elseif temp < 15 && temp > 10		;Faintly Green			;The air is pleasant.
		WSWidget.ForcePercent(1.0)
		WSWidget.SetColors(0xFFFF99, 0xCCCC7A)
		iThisTempCat = 2
	elseif temp == 10					;Crystal Clear			;The air is temperate.
		WSWidget.ForcePercent(1.0)
		WSWidget.SetColors(0xFFFFFF, 0xCCCCCC)
		iThisTempCat = 3
	elseif temp < 10 && temp >= 6		;Faintly Blue			;The air is cool.
		WSWidget.ForcePercent(1.0)
		WSWidget.SetColors(0xA3E0FF, 0x82B3CC)
		iThisTempCat = 4
	elseif temp < 6 && temp >= 1		;Pale Blue				;The air is chilly.
		WSWidget.ForcePercent(1.0)
		WSWidget.SetColors(0x66CCFF, 0x52A3CC)
		iThisTempCat = 5
	elseif temp < 1 && temp >= -4		;Azure Blue				;The air is cold.
		WSWidget.ForcePercent(1.0)
		WSWidget.SetColors(0x3399FF, 0x297ACC)
		iThisTempCat = 6
	elseif temp < -4 && temp >= -9		;Dark Blue				;The air is biting cold.
		WSWidget.ForcePercent(1.0)
		WSWidget.SetColors(0x0066FF, 0x0052CC)
		iThisTempCat = 7
	elseif temp < -9 && temp >= -14		;Midnight Blue			;The air is bone-chilling.
		WSWidget.ForcePercent(1.0)
		WSWidget.SetColors(0x0000FF, 0x0000CC)
		iThisTempCat = 8
	elseif temp < -14					;Pure Black				;The air is frigid and deadly.
		WSWidget.ForcePercent(1.0)
		WSWidget.SetColors(0x0000CC, 0x000000)
		iThisTempCat = 9
	endif

	if Frostfall.bInInterior
		WSWidget.ForcePercent(0.0)
		iThisTempCat = 10
	elseif _DE_WorldspacesExteriorOblivion.HasForm(PlayerRef.GetWorldSpace())
		WSWidget.ForcePercent(0.0)
		iThisTempCat = 11
	endif

	if _DE_WeathersenseDisplay_Contextual.GetValueInt() == 1
		WSWidget.Alpha = _DE_Weathersense_Opacity.GetValue()
	elseif _DE_WeathersenseDisplay_Contextual.GetValueInt() == 2 || bSkipDisplayHandling
		ContextualDisplay(iThisTempCat, bSkipDisplayHandling)
	elseif _DE_WeathersenseDisplay_Contextual.GetValueInt() == 0 && iDisplayIterationsRemaining == 0
		WSWidget.Alpha = 0.0
		return
	endif
	iLastTempCat = iThisTempCat

	if iDisplayIterationsRemaining > 0
		iDisplayIterationsRemaining -= 1
		if iDisplayIterationsRemaining <= 0
			iDisplayIterationsRemaining = 0
			if _DE_WeathersenseDisplay_Contextual.GetValueInt() != 1
				WSWidget.FadeTo(0.0, 3.0)
			endif
		endif
	elseif iDisplayIterationsRemaining == 0
		if WSWidget.Alpha == _DE_Weathersense_Opacity.GetValue()
			if _DE_WeathersenseDisplay_Contextual.GetValueInt() != 1
				WSWidget.FadeTo(0.0, 3.0)
			endif
		endif
	else
		;keep it on
	endif
endFunction

function ContextualDisplay(int iCat, bool bSkipDisplayHandling = false)
	if bSkipDisplayHandling
		iDisplayIterationsRemaining = _DE_WeathersenseDisplayTime.GetValueInt()
		return
	endif
	if iCat != iLastTempCat
		WSWidget.FadeTo(_DE_Weathersense_Opacity.GetValue(), 2.0)
		iDisplayIterationsRemaining = _DE_WeathersenseDisplayTime.GetValueInt()
	endif
endFunction

function ForceDisplayAndUpdate(bool bSkipDisplayHandling = true)
	if Compatibility.isSKYUILoaded
		;Called by spells that change exposure.
		iDisplayIterationsRemaining = _DE_WeathersenseDisplayTime.GetValueInt()
		WSWidget.FadeTo(_DE_Weathersense_Opacity.GetValue(), 1.0)
		UpdateWidget(bSkipDisplayHandling)
	endif
endFunction