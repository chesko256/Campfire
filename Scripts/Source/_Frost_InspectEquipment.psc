scriptname _Frost_InspectEquipment extends ActiveMagicEffect

import FrostUtil

GlobalVariable property _Frost_InspectHasBody auto
GlobalVariable property _Frost_InspectHasHead auto
GlobalVariable property _Frost_InspectHasHands auto
GlobalVariable property _Frost_InspectHasFeet auto
GlobalVariable property _Frost_InspectHasCloak auto

Message property _Frost_InspectEquipmentMsg_root auto
{
	Exposure Protection
	
	Worn Equipment: X Warmth, X Coverage
	Total (with bonuses): X Warmth, X Coverage

	Modify Equipment 	Restore Defaults	Back

}

Message property _Frost_InspectEquipmentMsg_select auto
{
	Select a piece of currently worn gear you would like to modify.

	Body	Head	Hands	Feet 	Cloak	Back
}

Message property _Frost_InspectEquipmentMsg_body auto
{
	Worn Body Gear

	Current Protection: X Warmth, X Coverage

	Modify	Back
}

Message property _Frost_InspectEquipmentMsg_head auto
{
	Worn Head Gear

	Current Protection: X Warmth, X Coverage

	Modify	Back
}

Message property _Frost_InspectEquipmentMsg_hands auto
{
	Worn Hands Gear

	Current Protection: X Warmth, X Coverage

	Modify	Back
}

Message property _Frost_InspectEquipmentMsg_feet auto
{
	Worn Feet Gear

	Current Protection: X Warmth, X Coverage

	Modify	Back
}

Message property _Frost_InspectEquipmentMsg_cloak auto
{
	Worn Cloak

	Current Protection: X Warmth, X Coverage

	Modify	Back
}

Message property _Frost_InspectEquipmentMsg_accessory auto
{
	Worn Accessory

	Current Protection: X Warmth, X Coverage

	Modify	Back
}

Message property _Frost_InspectEquipmentMsg_inspectwarmth_body auto
Message property _Frost_InspectEquipmentMsg_inspectwarmth_head auto
Message property _Frost_InspectEquipmentMsg_inspectwarmth_hands auto
Message property _Frost_InspectEquipmentMsg_inspectwarmth_feet auto
Message property _Frost_InspectEquipmentMsg_inspect_cloak auto
{
	At first glance, this equipment appears to provide X warmth.

	Checking the lining of the equipment, however, the warmth it really provides is...

	Poor(X)	Fair(X)	Good(X)	Excellent(X)	Max(X) 	Back
}

Message property _Frost_InspectEquipmentMsg_inspectcoverage_body auto
Message property _Frost_InspectEquipmentMsg_inspectcoverage_head auto
Message property _Frost_InspectEquipmentMsg_inspectcoverage_hands auto
Message property _Frost_InspectEquipmentMsg_inspectcoverage_feet auto
{
	At first glance, this equipment appears to provide X coverage.

	After inspecting the fittings and stitching, the coverage it really provides is...

	Poor(X)	Fair(X)	Good(X)	Excellent(X)	Max(X) 	Back
}

Message property _Frost_InspectEquipmentMsg_inspectconfirm auto
{
	The warmth and coverage of this gear has been changed.
}

Message property _Frost_InspectEquipmentMsg_defaultsingle auto
Message property _Frost_InspectEquipmentMsg_defaultsingleconfirm auto
Message property _Frost_InspectEquipmentMsg_defaultall auto
Message property _Frost_InspectEquipmentMsg_defaultallconfirm auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	rootMenu()
EndEvent

function rootMenu()
	int exposure = ((GetPlayerExposure() - 20) as int)
	if exposure < 0
		exposure = 0
	endif
	int wetness = (((GetPlayerWetness() / 750) * 100) as int)

	int i = _Frost_InspectEquipmentMsg_root.Show(exposure, wetness, GetPlayerArmorWarmth(), GetPlayerArmorCoverage(), GetPlayerWarmth(), GetPlayerCoverage())
	if i == 0
		InspectEquipment()
	elseif i == 1
		RestoreAllDefaults()
	elseif i == 2
		; Exit
	endif
endFunction

function RestoreAllDefaults()

endFunction

function InspectEquipment()

	Armor[] wornForms = GetClothingSystem().WornGearMainForms
	if wornForms[0]
		_Frost_InspectHasBody.SetValueInt(2)
	else
		_Frost_InspectHasBody.SetValueInt(1)
	endif
	if wornForms[1]
		_Frost_InspectHasHead.SetValueInt(2)
	else
		_Frost_InspectHasHead.SetValueInt(1)
	endif
	if wornForms[2]
		_Frost_InspectHasHands.SetValueInt(2)
	else
		_Frost_InspectHasHands.SetValueInt(1)
	endif
	if wornForms[3]
		_Frost_InspectHasFeet.SetValueInt(2)
	else
		_Frost_InspectHasFeet.SetValueInt(1)
	endif
	if wornForms[4]
		_Frost_InspectHasCloak.SetValueInt(2)
	else
		_Frost_InspectHasCloak.SetValueInt(1)
	endif

	int i = _Frost_InspectEquipmentMsg_select.Show()
	if i == 0
		InspectBody(wornValues)
	elseif i == 1
		InspectHead(wornValues)
	elseif i == 2
		InspectHands(wornValues)
	elseif i == 3
		InspectFeet(wornValues)
	elseif i == 4
		InspectCloak(wornValues)
	elseif i == 5
		rootMenu()
	endif
endFunction

function DefaultSingle()

endFunction

function InspectBody(int[] aiWornGearValues)
	int i = _Frost_InspectEquipmentMsg_body.Show(aiWornGearValues[0], aiWornGearValues[1])
	if i == 0
		ModifyGearWarmth(1, aiWornGearValues)
	elseif i == 1
		DefaultSingle()
	else
		InspectEquipment()
	endif
endFunction

function InspectHead(int[] aiWornGearValues)
	int i = _Frost_InspectEquipmentMsg_head.Show(aiWornGearValues[2], aiWornGearValues[3])
	if i == 0
		ModifyGearWarmth(2, aiWornGearValues)
	elseif i == 1
		DefaultSingle()
	else
		InspectEquipment()
	endif
endFunction

function InspectHands(int[] aiWornGearValues)
	int i = _Frost_InspectEquipmentMsg_hands.Show(aiWornGearValues[4], aiWornGearValues[5])
	if i == 0
		ModifyGearWarmth(3, aiWornGearValues)
	elseif i == 1
		DefaultSingle()
	else
		InspectEquipment()
	endif
endFunction

function InspectFeet(int[] aiWornGearValues)
	int i = _Frost_InspectEquipmentMsg_feet.Show(aiWornGearValues[6], aiWornGearValues[7])
	if i == 0
		ModifyGearWarmth(4, aiWornGearValues)
	elseif i == 1
		DefaultSingle()
	else
		InspectEquipment()
	endif
endFunction

function InspectCloak(int[] aiWornGearValues)
	int i = _Frost_InspectEquipmentMsg_cloak.Show(aiWornGearValues[8], aiWornGearValues[9])
	if i == 0
		ModifyGearWarmth(5, aiWornGearValues)
	elseif i == 1
		DefaultSingle()
	else
		InspectEquipment()
	endif
endFunction

function ModifyGearWarmth(int aiGearType, int[] aiWornGearValues)
	Message warmthSelectMsg
	int idx = 0
	int jdx = 0
	bool dual_value = false
	int choice_count = 5
	if aiGearType == 1
		warmthSelectMsg = _Frost_InspectEquipmentMsg_inspectwarmth_body
		idx = 0
	elseif aiGearType == 2
		warmthSelectMsg = _Frost_InspectEquipmentMsg_inspectwarmth_head
		idx = 2
	elseif aiGearType == 3
		warmthSelectMsg = _Frost_InspectEquipmentMsg_inspectwarmth_hands
		idx = 4
	elseif aiGearType == 4
		warmthSelectMsg = _Frost_InspectEquipmentMsg_inspectwarmth_feet
		idx = 6
	elseif aiGearType == 5
		warmthSelectMsg = _Frost_InspectEquipmentMsg_inspect_cloak
		idx = 8
		jdx = 9
		choice_count = 3
	endif

	int i
	if dual_value
		i = warmthSelectMsg.Show(aiWornGearValues[idx], aiWornGearValues[jdx])
	else
		i = warmthSelectMsg.Show(aiWornGearValues[idx])
	endif

	if i < choice_count
		ModifyGearCoverage(aiGearType, aiWornGearValues, i)
	elseif i == choice_count
		if aiGearType == 1
			InspectBody(aiWornGearValues)
		elseif aiGearType == 2
			InspectHead(aiWornGearValues)
		elseif aiGearType == 3
			InspectHands(aiWornGearValues)
		elseif aiGearType == 4
			InspectFeet(aiWornGearValues)
		elseif aiGearType == 5
			InspectCloak(aiWornGearValues)
		endif
	endif
endFunction

function ModifyGearCoverage(int aiGearType, int[] aiWornGearValues, int aiWarmthChoice)
	Message coverageSelectMsg
	int idx
	if aiGearType == 1
		coverageSelectMsg = _Frost_InspectEquipmentMsg_inspectcoverage_body
		idx = 0
	elseif aiGearType == 2
		coverageSelectMsg = _Frost_InspectEquipmentMsg_inspectcoverage_head
		idx = 2
	elseif aiGearType == 3
		coverageSelectMsg = _Frost_InspectEquipmentMsg_inspectcoverage_hands
		idx = 4
	elseif aiGearType == 4
		coverageSelectMsg = _Frost_InspectEquipmentMsg_inspectcoverage_feet
		idx = 6
	elseif aiGearType == 5
		; we're done
		CommitModification(aiGearType, aiWarmthChoice, -1)
		return
	endif

	int choice
	int i = coverageSelectMsg.Show(aiWornGearValues[idx + 1])
	if i < 5
		choice = i
		CommitModification(aiGearType, aiWarmthChoice, i)
	elseif i == 5
		if aiGearType == 1
			; ExtraHeadPrompt()
			; ExtraCloakPrompt()
			InspectBody(aiWornGearValues)
		elseif aiGearType == 2
			; ExtraCloakPrompt()
			InspectHead(aiWornGearValues)
		elseif aiGearType == 3
			InspectHands(aiWornGearValues)
		elseif aiGearType == 4
			InspectFeet(aiWornGearValues)
		elseif aiGearType == 5
			InspectCloak(aiWornGearValues)
		endif
	endif
endFunction

function CommitModification(int aiGearType, int aiWarmthChoice, int aiCoverageChoice)
	int idx = aiGearType - 1
	Armor theArmor = GetClothingSystem().WornGearMainForms[idx]
	SetArmorData(theArmor, asPluginName, aiGearType, aiWarmthChoice, aiCoverageChoice)
	; confirmation message
endFunction

function ExtraHeadPrompt()

endFunction

function ExtraCloakPrompt()

endFunction