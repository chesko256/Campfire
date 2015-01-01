Scriptname _DE_SwimDetectScript_Wet extends activemagiceffect  

GlobalVariable property _DE_SwimState auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	;Player is swimming
	_DE_SwimState.SetValue(1)
endEvent

event OnEffectFinish(Actor akTarget, Actor akCaster)
	_DE_SwimState.SetValue(0)
endEvent

;Deprecated
_DE_Compatibility property Compatibility auto
_DE_EPMonitor_1_6 property pMainScript auto
GlobalVariable property _DE_CurrentTemp auto
GlobalVariable property _DE_LastWaterMsgTime auto
GlobalVariable property GameHour auto
GlobalVariable property _DE_ExposurePoints auto
Spell property _DE_ColdWater_1 auto
Spell property _DE_ColdWater_2 auto
Spell property _DE_ColdWater_3 auto
spell property _DE_WetState_Spell1 auto
spell property _DE_WetState_Spell2 auto
spell property _DE_WetState_Spell3 auto
spell property _DE_ColdWater_3_Perk auto
magiceffect property FireCloakFFSelf auto
PlayerVampireQuestScript property VampireQuestRef auto
message property _DE_WaterTemp1 auto
message property _DE_WaterTemp2 auto
message property _DE_WaterTemp3 auto
message property _DE_WaterTemp4 auto
keyword property _DE_WaterPotionKW auto

float msgTimeDiff