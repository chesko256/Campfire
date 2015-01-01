scriptname _DE_WEARExamineEffectScript extends ActiveMagicEffect

GlobalVariable property _DE_InspectEffectOn auto
Message property _DE_WearSelectMenu0Error auto
Message property _DE_WearSelectPrompt auto
Message property _DE_WearCanceled auto
_DE_ClothingMonitor_1_7 property ClothingScriptRef auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if ClothingScriptRef.pSetting_Armor
		ExamineMenu()
	else
		_DE_WearSelectMenu0Error.Show()
	endif
endEvent

Function ExamineMenu()
	ClothingScriptRef.pInspectEffectOn = true
	_DE_WearSelectPrompt.Show()
	utility.wait(30)
	if ClothingScriptRef.pInspectEffectOn == true
		_DE_WearCanceled.Show()
		ClothingScriptRef.pInspectEffectOn = false
	endif
endFunction

GlobalVariable property _DE_Setting_Armor auto hidden
{Deprecated Frostfall 2.0.}