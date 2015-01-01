Scriptname _DE_PowerScript extends ActiveMagicEffect

; #SUMMARY# =====================================================================================================================
; Name ...................: _DE_PowerScript
; Attached To (EditorID)..: 
; Description ............: Drives the Weathersense ability messages.
; Author .................: Chesko
; Last Approved (version) : 2.6
; Status .................: Complete
; Remarks ................: 
; ===============================================================================================================================

GlobalVariable property GameHour auto
GlobalVariable property _DE_CurrentTemp auto
GlobalVariable property _DE_ExposurePoints auto
GlobalVariable property _DE_Setting_EPValueMsg auto
Formlist property _DE_WorldspacesExteriorOblivion auto
Message property _DE_Power12 auto
Message property _DE_Power11 auto
Message property _DE_Power10 auto
Message property _DE_Power9 auto
Message property _DE_Power8 auto
Message property _DE_Power7 auto
Message property _DE_Power6 auto
Message property _DE_Power5 auto
Message property _DE_Power4 auto
Message property _DE_Power3 auto
Message property _DE_Power2 auto
Message property _DE_Power1 auto
Message property _DE_Power12_Positive auto
Message property _DE_Power11_Positive auto
Message property _DE_Power10_Positive auto
Message property _DE_Power9_Positive auto
Message property _DE_Power8_Positive auto
Message property _DE_Power7_Positive auto
Message property _DE_Power6_Positive auto
Message property _DE_Power5_Positive auto
Message property _DE_Power4_Positive auto
Message property _DE_Power3_Positive auto
Message property _DE_Power2_Positive auto
Message property _DE_Power1_Positive auto
Message property _DE_Power12_NoStatus auto
Message property _DE_Power11_NoStatus auto
Message property _DE_Power10_NoStatus auto
Message property _DE_Power9_NoStatus auto
Message property _DE_Power8_NoStatus auto
Message property _DE_Power7_NoStatus auto
Message property _DE_Power6_NoStatus auto
Message property _DE_Power5_NoStatus auto
Message property _DE_Power4_NoStatus auto
Message property _DE_Power3_NoStatus auto
Message property _DE_Power2_NoStatus auto
Message property _DE_Power1_NoStatus auto
_DE_EPMonitor_1_6 property Frostfall auto
_DE_Compatibility property Compatibility auto
Actor property PlayerRef auto
GlobalVariable property _DE_WeathersensePowerMode auto
_DE_ExposureMeterUpdate property ExposureMeter auto
_DE_WetMeterUpdate property WetMeter auto
_DE_WeathersenseStatusUpdate property WSWidget auto

Event OnInit()
	DisplayPowerMessage()
endEvent

function DisplayPowerMessage()

	if _DE_WeathersensePowerMode.GetValue() >= 1 && _DE_WeathersensePowerMode.GetValue() < 6 && _DE_WeathersensePowerMode.GetValue() != 3
		WSWidget.ForceDisplayAndUpdate()
	endif

	if _DE_WeathersensePowerMode.GetValue() == 2 || _DE_WeathersensePowerMode.GetValue() == 3 || _DE_WeathersensePowerMode.GetValue() == 4 || _DE_WeathersensePowerMode.GetValue() == 6
		ExposureMeter.ForceDisplayAndUpdate()
		WetMeter.ForceDisplayAndUpdate()
	endif

	if _DE_WeathersensePowerMode.GetValue() > 3
		return
	endif
	
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
	
	int myEP = 100
	
	if _DE_ExposurePoints.GetValueInt() > 120.0				;Don't show the player that it is greater than 120 - will self-correct next cycle
		myEP = 120
	else
		myEP = _DE_ExposurePoints.GetValueInt()
	endif
	
	if Frostfall.bInInterior
		if _DE_Setting_EPValueMsg.GetValueInt() == 2
			_DE_Power11.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
		else
			_DE_Power11_NoStatus.Show(myEP - 100)
		endif
		return
	elseif _DE_WorldspacesExteriorOblivion.HasForm(PlayerRef.GetWorldSpace())
		if _DE_Setting_EPValueMsg.GetValueInt() == 2
			_DE_Power12.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
		else
			_DE_Power12_NoStatus.Show(myEP - 100)
		endif
		return
	endif
	
	if _DE_Setting_EPValueMsg.GetValueInt() == 2
		if myEP > 100
			if temp >= 18 						;Brilliant Emerald		;The sun is radiant and exhilirating.
				_DE_Power10_Positive.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
			elseif temp < 18 && temp >= 15		;Bright Green			;The air is warm.
				_DE_Power9_Positive.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
			elseif temp < 15 && temp > 10		;Faintly Green			;The air is pleasant.
				_DE_Power8_Positive.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
			elseif temp == 10					;Crystal Clear			;The air is temperate.
				_DE_Power7_Positive.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
			elseif temp < 10 && temp >= 6		;Faintly Blue			;The air is cool.
				_DE_Power6_Positive.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
			elseif temp < 6 && temp >= 1		;Pale Blue				;The air is chilly.
				_DE_Power5_Positive.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
			elseif temp < 1 && temp >= -4		;Azure Blue				;The air is cold.
				_DE_Power4_Positive.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
			elseif temp < -4 && temp >= -9		;Dark Blue				;The air is biting cold.
				_DE_Power3_Positive.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
			elseif temp < -9 && temp >= -14		;Midnight Blue			;The air is bone-chilling.
				_DE_Power2_Positive.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
			elseif temp < -14					;Pure Black				;The air is frigid and deadly.
				_DE_Power1_Positive.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)			
			endif
		else
			if temp >= 18 						;Brilliant Emerald		;The sun is radiant and exhilirating.
				_DE_Power10.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
			elseif temp < 18 && temp >= 15		;Bright Green			;The air is warm.
				_DE_Power9.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
			elseif temp < 15 && temp > 10		;Faintly Green			;The air is pleasant.
				_DE_Power8.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
			elseif temp == 10					;Crystal Clear			;The air is temperate.
				_DE_Power7.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
			elseif temp < 10 && temp >= 6		;Faintly Blue			;The air is cool.
				_DE_Power6.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
			elseif temp < 6 && temp >= 1		;Pale Blue				;The air is chilly.
				_DE_Power5.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
			elseif temp < 1 && temp >= -4		;Azure Blue				;The air is cold.
				_DE_Power4.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
			elseif temp < -4 && temp >= -9		;Dark Blue				;The air is biting cold.
				_DE_Power3.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
			elseif temp < -9 && temp >= -14		;Midnight Blue			;The air is bone-chilling.
				_DE_Power2.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)
			elseif temp < -14					;Pure Black				;The air is frigid and deadly.
				_DE_Power1.Show(myEP - 100, (Frostfall.pWetPoints/750) * 100)			
			endif
		endif
	else
		if temp >= 18 						;Brilliant Emerald		;The sun is radiant and exhilirating.
			_DE_Power10_NoStatus.Show(myEP - 100)
		elseif temp < 18 && temp >= 15		;Bright Green			;The air is warm.
			_DE_Power9_NoStatus.Show(myEP - 100)
		elseif temp < 15 && temp > 10		;Faintly Green			;The air is pleasant.
			_DE_Power8_NoStatus.Show(myEP - 100)
		elseif temp == 10					;Crystal Clear			;The air is temperate.
			_DE_Power7_NoStatus.Show(myEP - 100)
		elseif temp < 10 && temp >= 6		;Faintly Blue			;The air is cool.
			_DE_Power6_NoStatus.Show(myEP - 100)
		elseif temp < 6 && temp >= 1		;Pale Blue				;The air is chilly.
			_DE_Power5_NoStatus.Show(myEP - 100)
		elseif temp < 1 && temp >= -4		;Azure Blue				;The air is cold.
			_DE_Power4_NoStatus.Show(myEP - 100)
		elseif temp < -4 && temp >= -9		;Dark Blue				;The air is biting cold.
			_DE_Power3_NoStatus.Show(myEP - 100)
		elseif temp < -9 && temp >= -14		;Midnight Blue			;The air is bone-chilling.
			_DE_Power2_NoStatus.Show(myEP - 100)
		elseif temp < -14					;Pure Black				;The air is frigid and deadly.
			_DE_Power1_NoStatus.Show(myEP - 100)			
		endif
	endif
endFunction