scriptname _Frost_FrigidWaterSystem extends _Frost_BaseSystem

import CampUtil

Actor property PlayerRef auto
GlobalVariable property GameHour auto
Keyword property _Frost_ColdWaterPotionKW auto
Message property _Frost_WaterTemp1Msg auto
Message property _Frost_WaterTemp2Msg auto
Message property _Frost_WaterTemp3Msg auto
Message property _Frost_WaterTemp4Msg auto

float msg_time_diff
float last_water_message_time

function RegisterForEventsOnLoad()
	RegisterForModEvent("Frostfall_OnPlayerStartSwimming", "OnPlayerStartSwimming")
	RegisterForModEvent("Frostfall_OnPlayerStopSwimming", "OnPlayerStopSwimming")
endFunction

Event OnPlayerStartSwimming()
	HandleSwimming()
endEvent

Event OnPlayerStopSwimming()
	HandleNotSwimming()
endEvent

Event OnUpdate()
	if PlayerRef.IsSwimming() && \
		!IsRefInInterior(PlayerRef) && !PlayerRef.HasEffectKeyword(_Frost_ColdWaterPotionKW)
		ApplyTempEffects()
		RegisterForSingleUpdate(3)
	endif
EndEvent

function HandleSwimming()
	if !IsRefInInterior(PlayerRef) && !PlayerRef.HasEffectKeyword(_Frost_ColdWaterPotionKW)
		ApplyTempEffects()
		RegisterForSingleUpdate(3)
	endif

	if Frostfall.bInInterior == true 						;do not affect the player inside
	elseif Frostfall.pSetting_IsRunning == false			;do not affect the player if Frostfall isn't running
	elseif PlayerRef.HasEffectKeyword(_DE_WaterPotionKW)	;do not affect the player when using the water potion
	elseif Frostfall.bIsVampire == true						;do not affect the player if a vampire
	else
		if Frostfall.pSetting_IsRunning == true && Frostfall.ShutdownState == false
			ApplyTempEffects()
		endif
	endif
	RegisterForSingleUpdate(3)
endfunction

function HandleNotSwimming()
	PlayerRef.RemoveSpell(_DE_ColdWater_1)
	PlayerRef.RemoveSpell(_DE_ColdWater_2)
	PlayerRef.RemoveSpell(_DE_ColdWater_3)
endFunction

function ApplyTempEffects()
	bool bSapStamina = true
	if Compatibility.isSKYRELoaded
		if Game.GetPlayer().HasPerk(Compatibility.GlacialSwimmer)
			bSapStamina = false
		endif
	endif

	;Check temperature and apply effects as needed
	int temp = _Frost_CurrentTemperature.GetValueInt()
	int water_temp = temp + 2		;Tweak to keep worst conditions out of Tundra (Whiterun) areas
	msg_time_diff = (GameHour.GetValue() - last_water_message_time)
	if water_temp > 10
		if msg_time_diff > 1.0
			_Frost_WaterTemp1Msg.Show()
			last_water_message_time = GameHour.GetValue()
		endif
	elseif water_temp <= 10 && water_temp > 5
		if bSapStamina
			ApplyColdWaterSpell(_DE_ColdWater_1, 40.0, _Frost_WaterTemp2Msg)
		else
			ApplyColdWaterSpell(none, 40.0, _Frost_WaterTemp2Msg)
		endif
	elseif water_temp <= 5 && water_temp > 0
		if bSapStamina
			ApplyColdWaterSpell(_DE_ColdWater_2, 60.0, _Frost_WaterTemp3Msg)
		else
			ApplyColdWaterSpell(none, 60.0, _Frost_WaterTemp3Msg)
		endif
	elseif water_temp < 0
		if bSapStamina
			ApplyColdWaterSpell(_DE_ColdWater_3, 80.0, _Frost_WaterTemp4Msg)
		else
			ApplyColdWaterSpell(_DE_ColdWater_3_Perk, 80.0, _Frost_WaterTemp4Msg)
		endif
	endif
endFunction

function ApplyColdWaterSpell(Spell akSpell = none, float fExposureDamage, message akMessage)
	if akSpell && akSpell as Spell
		if PlayerRef.HasSpell(akSpell) == false
			PlayerRef.AddSpell(akSpell, false)
		endif
	endif
	if _DE_ExposurePoints.GetValue() > fExposureDamage				;Damage the player's current EP
		_DE_ExposurePoints.SetValue(fExposureDamage)
	endif
	if msg_time_diff > 1.0
		akMessage.Show()
		last_water_message_time = GameHour.GetValue()
	endif
endFunction