scriptname _Frost_WetnessSystem extends Quest

;@TODO: implement WEATHERCLASS
import FrostUtil
import _FrostInternal

float property MAX_WETNESS = 750.0 autoReadOnly
float property WETNESS_LEVEL_3 = 700.0 autoReadOnly
float property WETNESS_LEVEL_2 = 550.0 autoReadOnly
float property WETNESS_LEVEL_1 = 200.0 autoReadOnly
float property MIN_WETNESS = 0.0 autoReadOnly

GlobalVariable property _Frost_AttributeWetness auto
GlobalVariable property _Frost_WetLevel auto
Message property _Frost_WetStateMsg_Wet3 auto
Message property _Frost_WetStateMsg_Wet2 auto
Message property _Frost_WetStateMsg_Wet1 auto
Message property _Frost_WetStateMsg_Dry auto

int last_wet_level = 0

int CASE_INTERIOR = 1
int CASE_PLEASANT = 2
int CASE_RAINY = 3
int CASE_SNOWY = 4
int CASE_OTHER = 5

function StartSystem()

endFunction

function StopSystem()

endFunction

Event OnUpdate()
	;@TODO: if global is true
		UpdateWetState()
		UpdateWetLevel()
	; endif
EndEvent

int function GetWetFactor()
	int wet_level = _Frost_WetLevel.GetValueInt()
	if wet_level == 3
		return 16
	elseif wet_level == 2
		return 8
	elseif wet_level == 1
		return 4
	elseif wet_level == 0
		return 0
	endif
endFunction

function ModAttributeWetness(float amount)
	float wetness = _Frost_AttributeWetness.GetValue() + amount
	; Clamp
	if wetness > MAX_WETNESS
		wetness = MAX_WETNESS
	elseif wetness < 0.0
		wetness = 0.0
	endif
	_Frost_AttributeWetness.SetValue(wetness)
endFunction

;@TODO: Use a single spell and have the effects apply based on conditions. No spell swapping.
;@TODO: The spell should have 2 effects per wet level: one for the description, and an invisible one for the visual effect, conditioned on the setting global.
;@TODO: Condition visuals against swimming
function UpdateWetLevel()
	float wetness = _Frost_AttributeWetness.GetValue()
	int wet_level = 0

	if wetness > WETNESS_LEVEL_3
		wet_level = 3
		ShowWetStateMessage(3)
	elseif wetness > WETNESS_LEVEL_2
		wet_level = 2
		ShowWetStateMessage(2)
	elseif wetness > WETNESS_LEVEL_1
		wet_level = 1
		ShowWetStateMessage(1)
	elseif wetness == MIN_WETNESS
		wet_level = 0
		ShowWetStateMessage(0)
	endif

	_Frost_WetLevel.SetValueInt(wet_level)
	last_wet_level = _Frost_WetLevel.GetValueInt()
endFunction

function ShowWetStateMessage(int wet_level)
	if _Frost_Setting_ConditionMessages.GetValueInt() == 2 && FrostUtil.IsPlayerVampire() == false
		if wet_level == 3 && last_wet_level != 3
			_Frost_WetStateMsg_Wet3.Show()
		elseif wet_level == 2 && last_wet_level != 2
			_Frost_WetStateMsg_Wet2.Show()
		elseif wet_level == 1 && last_wet_level != 1
			_Frost_WetStateMsg_Wet1.Show()
		elseif wet_level == 0 && last_wet_level != 0
			_Frost_WetStateMsg_Dry.Show()
		endif
	endif
endFunction

bool function IsNearWaterfall()
	ObjectReference waterfall = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Frost_Waterfalls, PlayerRef, 85.0)
	if waterfall && waterfall.IsEnabled()
		return true
	else
		return false
	endif
endFunction

function UpdateWetState(bool bNearFire)			;Approved 2.5
	int WetFactor = 0
	int iSwimState = _DE_SwimState.GetValueInt()
	int iWeatherClass = 0

	if PlayerRef.IsSwimming()
		ModAttributeWetness(MAX_WETNESS)
		return
	endif
	
	bool near_waterfall = IsNearWaterfall()
	if near_waterfall
		ModAttributeWetness(MAX_WETNESS)
		return
	endif

	if wMyWeather
		weather_class = GetWeatherClassificationActual(wMyWeather)
	endif
	
	;What is currently happening?
	;#Region DETERMINE SITUATION
	int case = 0
	if CampUtil.IsRefInInterior(PlayerRef)
		case = CASE_INTERIOR
	else
		if weather_class <= WEATHERCLASS_CLEAR
			case = CASE_PLEASANT
		elseif weather_class == WEATHERCLASS_RAIN && Weather.GetOutgoingWeather() == none && !IsRefInOblivion(PlayerRef)
			case = CASE_RAINY
		elseif weather_class == WEATHERCLASS_SNOW
			case = CASE_SNOWY
		else
			case = CASE_OTHER
		endif
	endif

	if case == CASE_INTERIOR
		ApplyWetConditionGetDrier(bNearFire)
	elseif case == CASE_PLEASANT
		ApplyWetConditionGetDrier(bNearFire)
	elseif case == CASE_RAINY
		if iIsInTent == 0 && !bTakingShelter					;No Tent, no shelter
			ApplyWetConditionGetWetter()
		elseif iIsInTent == 1									;Hide Tent
			ApplyWetConditionGetWetterConditional(300.0, bNearFire)
		elseif iIsInTent >= 2 || bTakingShelter					;Leather Tent OR Conjured Shelter OR taking shelter
			ApplyWetConditionGetDrier(bNearFire)
		endif
	elseif case == CASE_SNOWY
		ApplyWetConditionGetDrier(bNearFire)
	elseif case == CASE_OTHER
		ApplyWetConditionGetDrier(bNearFire)
	endif
	;#EndRegion
	
	;Less exposure drain in warmer weather.
	;/ int theTemp = _DE_CurrentTemp.GetValueInt()
	if theTemp >= 15
		WetFactor /= 4
	elseif theTemp > 10
		WetFactor /= 2
	endif
	/;
endFunction

function ApplyWetConditionGetDrier(bool bNearFire)	;Approved 2.5
	if bNearFire
		pWetPoints -= 150.0 * CloakDryRateMod
	else
		pWetPoints -= 6.25 * CloakDryRateMod
	endif
endFunction

function ApplyWetConditionGetWetter()				;Approved 2.5
	if pPlayer.HasPerk(Compatibility.Windbreaker)
		pWetPoints += 27.0 * ( CloakWetRateMod - ( CloakWetRateMod * 0.25  ) )
	else
		pWetPoints += 27.0 * CloakWetRateMod
	endif
endFunction

function ApplyWetConditionGetWetterConditional(float WPCap, bool bNearFire)								;Approved 2.5
	if bNearFire
		if ( pWetPoints <= WPCap && pWetPoints >= WPCap - 50.0 )
			if ( pWetPoints < WPCap )
				;Catch the bounce to show the player that they are completely dry
				if WPCap == 0.0
					if !bIsVampire
						_DE_WetStateMsg_Dry.Show()
					endif
				else
					if !bIsVampire
						_DE_Tent_LeakingWater.Show()
					endif
				endif
			endif
			pWetPoints = WPCap
		elseif pWetPoints < WPCap - 50.0
			;Get wetter normally
			pWetPoints += 27.0 * CloakWetRateMod
		else
			;Get dryer
			if bIsVampire
				pWetPoints -= 250.0
			else
				pWetPoints -= 37.0 * CloakDryRateMod
			endif
		endif
	else
		if ( pWetPoints <= WPCap && pWetPoints >= WPCap - 50.0 )
			if ( pWetPoints < WPCap )
				;Catch the bounce to show the player that they are completely dry
				if WPCap == 0.0
					if !bIsVampire
						_DE_WetStateMsg_Dry.Show()
					endif
				else
					if !bIsVampire
						_DE_Tent_LeakingWater.Show()
					endif
				endif
			endif
			pWetPoints = WPCap
		elseif pWetPoints < WPCap - 50.0
			;Get wetter normally
			pWetPoints += 6.75 * CloakWetRateMod
		else
			;Get dryer
			if bIsVampire
				pWetPoints -= 250.0
			else
				pWetPoints -= 6.25 * CloakDryRateMod
			endif
		endif
	endif
endfunction