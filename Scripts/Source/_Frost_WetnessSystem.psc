scriptname _Frost_WetnessSystem extends Quest

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
	; account for coming in to tent already soaking wet
	bool inside_tent = GetCurrentTent()
	bool inside_waterproof_tent = IsCurrentTentWaterproof()
	bool taking_shelter = IsTakingShelter()
	float max
	if inside_tent && !inside_waterproof_tent

	else
		max = MAX_WETNESS
	endif

	if wetness > max
		wetness = max
	elseif wetness < MIN_WETNESS
		wetness = MIN_WETNESS
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

function UpdateWetState()
	int WetFactor = 0
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

	bool wet_conditions = false
	if weather_class == WEATHERCLASS_RAIN && Weather.GetOutgoingWeather() == none && \
	   !IsRefInOblivion(PlayerRef) && !IsRefInInterior(PlayerRef)
		wet_conditions == true
	endif

	bool inside_tent = GetCurrentTent()
	bool inside_waterproof_tent = IsCurrentTentWaterproof()
	bool taking_shelter = IsTakingShelter()
	if wet_conditions && !inside_waterproof_tent && !taking_shelter
		if inside_waterproof_tent || taking_shelter
			DryOff()
		elseif inside_tent && !inside_waterproof_tent
			GetWetterConditional(300.0, bNearFire)
		elseif !inside_tent && !taking_shelter
			GetWetter()
		endif
	else
		DryOff()
	endif
	
	;Less exposure drain in warmer weather.
	;/ int theTemp = _DE_CurrentTemp.GetValueInt()
	if theTemp >= 15
		WetFactor /= 4
	elseif theTemp > 10
		WetFactor /= 2
	endif
	/;
endFunction

;@TODO: Make realtime-independent
function DryOff()
	if IsRefNearFire(PlayerRef)
		float amount = -(37.5 * GetCurrentHeatLevel(PlayerRef))
		ModAttributeWetness(amount)
	else
		ModAttributeWetness(-6.25)
	endif
endFunction

function GetWetter()
	;@TODO: Windbreaker Perk
	;if pPlayer.HasPerk(Compatibility.Windbreaker)
	;	pWetPoints += 27.0 * ( CloakWetRateMod - ( CloakWetRateMod * 0.25  ) )
	
	float amount = 27.0 * CloakWetRateMod
	ModAttributeWetness(amount)
endFunction

function GetWetterConditional(float WPCap, bool bNearFire)								;Approved 2.5
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