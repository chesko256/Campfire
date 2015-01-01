Scriptname _DE_SwimDetectScript_Dry extends activemagiceffect  

GlobalVariable property _DE_SwimState auto
GlobalVariable property _DE_WetTime auto
_DE_EPMonitor_1_6 property pMainScript auto
GlobalVariable property GameHour auto
Spell property _DE_WetState_Spell3 auto
Spell property _DE_WetState_Spell3NoShader auto
spell property _DE_ColdWater_1 auto
spell property _DE_ColdWater_2 auto
spell property _DE_ColdWater_3 auto
message property _DE_WetStateMsg_Wet auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	
endEvent

event OnEffectFinish(Actor akTarget, Actor akCaster)
	_DE_SwimState.SetValue(1)
endEvent

Event OnUpdate()
	Game.GetPlayer().RemoveSpell(_DE_WetState_Spell3)
	pMainScript.pWetPoints = 0.0
endEvent