scriptname _Frost_WetnessSystem extends Quest

function StartSystem()

endFunction

function StopSystem()

endFunction

bool function IsNearWaterfall()
	ObjectReference waterfall = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Frost_Waterfalls, PlayerRef, 85.0)
	if waterfall && waterfall.IsEnabled()
		return true
	else
		return false
	endif
endFunction

int function GetWetState(bool bNearFire)			;Approved 2.5
	int WetFactor = 0
	int iSwimState = _DE_SwimState.GetValueInt()
	int iWeatherClass = 0
	
	if wMyWeather
		iWeatherClass = GetWeatherClassificationActual(wMyWeather)
	endif
	
	objectreference myWaterfall = Game.FindClosestReferenceOfAnyTypeInListFromRef(_DE_Waterfalls, pPlayer, 85.0)
	if myWaterfall && myWaterfall.IsEnabled()
		pWetPoints = 750.0
	endif
	
	;What is currently happening?
	;#Region DETERMINE SITUATION
	if iSwimState != 1													;The player is not swimming		
		if bInInterior													;In interiors, the player can warm up/dry off completely, and is unaffected by temperature
			ApplyWetConditionGetDrier(bNearFire)
		else
			if iWeatherClass <= 1		;Pleasant, Cloudy				;In pleasant weather, the player can warm up/dry off completely, with and without a tent
				ApplyWetConditionGetDrier(bNearFire)
			elseif iWeatherClass == 2 && Weather.GetOutgoingWeather() == none && !(_DE_WorldspacesExteriorOblivion.HasForm(wsThisWorldSpace))	;Rainy	;In rainy weather, the player can warm up completely in any tent, and dry off completely in leather tents.
				if iIsInTent == 0 && !bTakingShelter					;No Tent, no shelter
					ApplyWetConditionGetWetter()
				elseif iIsInTent == 1									;Hide Tent
					ApplyWetConditionGetWetterConditional(300.0, bNearFire)
				elseif iIsInTent >= 2 || bTakingShelter					;Leather Tent OR Conjured Shelter OR taking shelter
					ApplyWetConditionGetDrier(bNearFire)
				endif
			elseif iWeatherClass == 3	;Snowy							;In snowy weather, the player can warm up completely in hide tents, and dry off completely in any tent.
				ApplyWetConditionGetDrier(bNearFire)
			else
				ApplyWetConditionGetDrier(bNearFire)					;Fall-through condition.
			endif
		endif
	endif
	;#EndRegion
	
	;#Region CLAMP WETNESS POINTS
	;Clamp Wet Points to a range of 0.0 to 900.0
	if pWetPoints > 750.0
		pWetPoints = 750.0
	elseif pWetPoints < 0.0
		pWetPoints = 0.0
	endif
	;#EndRegion
	
	;#Region ACT ON WETNESS POINTS
	;Calculate Wet Factor based on Wet Points, and apply the correct visual spell.
	;The wet state scripts have the responsibility to apply Spell 3; this is just a sanity check.
	if pWetPoints > 700.0
		WetFactor = 16
		if _DE_SwimState.GetValueInt() == 1
			RemoveWetSpells()
		else
			;Remove the wrong shader effects and apply the right one.
			pPlayer.RemoveSpell(_DE_WetState_Spell1)
			pPlayer.RemoveSpell(_DE_WetState_Spell2)
			if pSetting_EffectWetShader
				if !(pPlayer.HasSpell(_DE_WetState_Spell3))
					pPlayer.AddSpell(_DE_WetState_Spell3, false)
					pPlayer.RemoveSpell(_DE_WetState_Spell3NoShader)
					if _DE_Setting_ConditionMsg.GetValueInt() == 2
						if !bIsVampire
							_DE_WetStateMsg_Wet3.Show()
						endif
					endif
				endif
			else
				if !(pPlayer.HasSpell(_DE_WetState_Spell3NoShader))
					pPlayer.AddSpell(_DE_WetState_Spell3NoShader, false)
					pPlayer.RemoveSpell(_DE_WetState_Spell3)
					if _DE_Setting_ConditionMsg.GetValueInt() == 2
						if !bIsVampire
							_DE_WetStateMsg_Wet3.Show()
						endif
					endif
				endif
			endif
			;====HELP TEXT====
			if _DE_HelpDone_Wet.GetValueInt() == 1
				if _DE_Setting_Help.GetValueInt() == 2
					if !bIsVampire
						ShowHelp(3)
					endif
				endif
			endif
			;====HELP TEXT====
		endif
	elseif pWetPoints > 550.0
		Wetfactor = 8
		if _DE_SwimState.GetValueInt() == 1
			RemoveWetSpells()
		else
			;Remove the wrong shader effects and apply the right one.
			pPlayer.RemoveSpell(_DE_WetState_Spell1)
			pPlayer.RemoveSpell(_DE_WetState_Spell3)
			pPlayer.RemoveSpell(_DE_WetState_Spell1NoShader)
			pPlayer.RemoveSpell(_DE_WetState_Spell3NoShader)
			if pSetting_EffectWetShader
				if !(pPlayer.HasSpell(_DE_WetState_Spell2))
					pPlayer.AddSpell(_DE_WetState_Spell2, false)
					pPlayer.RemoveSpell(_DE_WetState_Spell2NoShader)
					if _DE_Setting_ConditionMsg.GetValueInt() == 2
						if !bIsVampire
							_DE_WetStateMsg_Wet2.Show()
						endif
					endif
				endif
			else
				if !(pPlayer.HasSpell(_DE_WetState_Spell2NoShader))
					pPlayer.AddSpell(_DE_WetState_Spell2NoShader, false)
					pPlayer.RemoveSpell(_DE_WetState_Spell2)
					if _DE_Setting_ConditionMsg.GetValueInt() == 2
						if !bIsVampire
							_DE_WetStateMsg_Wet2.Show()
						endif
					endif
				endif
			endif
		endif
	elseif pWetPoints > 200.0
		WetFactor = 4
		if _DE_SwimState.GetValueInt() == 1
			RemoveWetSpells()
		else
			;Remove the wrong shader effects and apply the right one.
			if pPlayer.HasSpell(_DE_WetState_Spell2)
				pPlayer.RemoveSpell(_DE_WetState_Spell2)
				;Generate puddle underneath the player's feet if not moving, sitting, or riding
				;if !pPlayer.IsRunning() && pPlayer.GetSitState() == 0 && pPlayer.IsOnMount() == false
				;	_DE_DecalPuddleSmallREF.MoveTo(pPlayer, afZOffset = 40.0, abMatchRotation = false)
				;endif
			endif
			pPlayer.RemoveSpell(_DE_WetState_Spell3)
			if pSetting_EffectWetShader
				if !(pPlayer.HasSpell(_DE_WetState_Spell1))
					pPlayer.AddSpell(_DE_WetState_Spell1, false)
					pPlayer.RemoveSpell(_DE_WetState_Spell1NoShader)
					if _DE_Setting_ConditionMsg.GetValueInt() == 2
						if !bIsVampire
							_DE_WetStateMsg_Wet1.Show()
						endif
					endif
				endif
			else
				if !(pPlayer.HasSpell(_DE_WetState_Spell1NoShader))
					pPlayer.AddSpell(_DE_WetState_Spell1NoShader, false)
					pPlayer.RemoveSpell(_DE_WetState_Spell1)
					if _DE_Setting_ConditionMsg.GetValueInt() == 2
						if !bIsVampire
							_DE_WetStateMsg_Wet1.Show()
						endif
					endif
				endif
			endif
		endif
	elseif pWetPoints == 0.0
		WetFactor = 0
		;Remove any visual effects and display a message.
		if pPlayer.HasEffectKeyword(_DE_WetStateKeyword)
			RemoveWetSpells()
			if _DE_Setting_ConditionMsg.GetValueInt() == 2
				if !bIsVampire
					_DE_WetStateMsg_Dry.Show()
				endif
			endif
		endif		
	endif
	;#EndRegion
	
	;Less exposure drain in warmer weather.
	int theTemp = _DE_CurrentTemp.GetValueInt()
	if theTemp >= 15
		WetFactor /= 4
	elseif theTemp > 10
		WetFactor /= 2
	endif
	
	return WetFactor
endFunction