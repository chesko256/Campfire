scriptname _Frost_InspectEquipment extends ActiveMagicEffect

import FrostUtil

Actor property PlayerRef auto

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

Message property _Frost_InspectEquipmentMsg_inspectextrashead auto
Message property _Frost_InspectEquipmentMsg_inspectextrasheadconfirm auto
Message property _Frost_InspectEquipmentMsg_inspectextrascloak auto
Message property _Frost_InspectEquipmentMsg_inspectextrascloakconfirm auto

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
	int i = _Frost_InspectEquipmentMsg_defaultall.Show()
	if i == 0
		GetLegacyArmorDatastore().InitializeCustomArrays()

		Armor[] wornForms = GetClothingSystem().WornGearMainForms
		int j = 0
		while j < wornForms.Length
			Armor theArmor = wornForms[j]
			if theArmor
				PlayerRef.UnequipItem(theArmor, abSilent = true)
				Utility.Wait(0.5)
				PlayerRef.EquipItem(theArmor, abSilent = true)
			endif
			j += 1
		endWhile

		_Frost_InspectEquipmentMsg_defaultallconfirm.Show()
	endif
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
		InspectBody(wornForms[0])
	elseif i == 1
		InspectHead(wornForms[1])
	elseif i == 2
		InspectHands(wornForms[2])
	elseif i == 3
		InspectFeet(wornForms[3])
	elseif i == 4
		InspectCloak(wornForms[4])
	elseif i == 5
		rootMenu()
	endif
endFunction

function DefaultSingle(Armor akArmor, int aiGearType)
	int i = _Frost_InspectEquipmentMsg_defaultsingle.Show()
	if i == 0
		GetLegacyArmorDatastore().UnsetArmorData(akArmor, aiGearType)
		PlayerRef.UnequipItem(akArmor, abSilent = true)
		Utility.Wait(0.5)
		PlayerRef.EquipItem(akArmor, abSilent = true)
		_Frost_InspectEquipmentMsg_defaultsingleconfirm.Show()
	endif
endFunction

function InspectBody(Armor akArmor)
	_Frost_ClothingSystem clothing = GetClothingSystem()
	int i = _Frost_InspectEquipmentMsg_body.Show(clothing.WornGearValues[0], clothing.WornGearValues[1])
	if i == 0
		ModifyBody(akArmor, clothing.WornGearValues)
	elseif i == 1
		DefaultSingle(akArmor, 1)
	else
		InspectEquipment()
	endif
endFunction

function InspectHead(Armor akArmor)
	_Frost_ClothingSystem clothing = GetClothingSystem()
	int i = _Frost_InspectEquipmentMsg_head.Show(clothing.WornGearValues[2], clothing.WornGearValues[3])
	if i == 0
		ModifyHead(akArmor, clothing.WornGearValues)
	elseif i == 1
		DefaultSingle(akArmor, 2)
	else
		InspectEquipment()
	endif
endFunction

function InspectHands(Armor akArmor)
	_Frost_ClothingSystem clothing = GetClothingSystem()
	int i = _Frost_InspectEquipmentMsg_hands.Show(clothing.WornGearValues[4], clothing.WornGearValues[5])
	if i == 0
		ModifyHands(akArmor, clothing.WornGearValues)
	elseif i == 1
		DefaultSingle(akArmor, 3)
	else
		InspectEquipment()
	endif
endFunction

function InspectFeet(Armor akArmor)
	_Frost_ClothingSystem clothing = GetClothingSystem()
	int i = _Frost_InspectEquipmentMsg_feet.Show(clothing.WornGearValues[6], clothing.WornGearValues[7])
	if i == 0
		ModifyFeet(akArmor, clothing.WornGearValues)
	elseif i == 1
		DefaultSingle(akArmor, 4)
	else
		InspectEquipment()
	endif
endFunction

function InspectCloak(Armor akArmor)
	_Frost_ClothingSystem clothing = GetClothingSystem()
	int i = _Frost_InspectEquipmentMsg_cloak.Show(clothing.WornGearValues[8], clothing.WornGearValues[9])
	if i == 0
		ModifyCloak(akArmor, clothing.WornGearValues)
	elseif i == 1
		DefaultSingle(akArmor, 5)
	else
		InspectEquipment()
	endif
endFunction

function ModifyBody(Armor akArmor, int[] aiWornGearValues)
	int warmthChoice = 0
	int coverageChoice = 0
	bool hasExtraHead = false
	bool hasExtraCloak = false
	int extraHeadWarmthChoice = 0
	int extraHeadCoverageChoice = 0
	int extraCloakChoice

	warmthChoice = _Frost_InspectEquipmentMsg_inspectwarmth_body.Show(aiWornGearValues[0])
	if warmthChoice == 5
		; Back
		InspectBody(akArmor)
		return
	endif

	coverageChoice = _Frost_InspectEquipmentMsg_inspectcoverage_body.Show(aiWornGearValues[1])
	if coverageChoice == 5
		; Back
		InspectBody(akArmor)
		return
	endif

	if _Frost_InspectEquipmentMsg_inspectextrashead.Show() == 0
		_Frost_InspectEquipmentMsg_inspectextrasheadconfirm.Show()
		extraHeadWarmthChoice = _Frost_InspectEquipmentMsg_inspectwarmth_head.Show(aiWornGearValues[2])
		if extraHeadWarmthChoice == 5
			; Back
			InspectBody(akArmor)
			return
		endif

		extraHeadCoverageChoice = _Frost_InspectEquipmentMsg_inspectcoverage_head.Show(aiWornGearValues[3])
		if extraHeadCoverageChoice == 5
			; Back
			InspectBody(akArmor)
			return
		endif

		hasExtraHead = true
	endif

	if _Frost_InspectEquipmentMsg_inspectextrascloak.Show() == 0
		_Frost_InspectEquipmentMsg_inspectextrascloakconfirm.Show()
		extraCloakChoice = _Frost_InspectEquipmentMsg_inspect_cloak.Show(aiWornGearValues[8], aiWornGearValues[9])
		if extraCloakChoice == 3
			; Back
			InspectBody(akArmor)
			return
		endif

		hasExtraCloak = true
	endif

	warmthChoice += 1
	coverageChoice += 1

	if hasExtraHead
		extraHeadWarmthChoice += 1
		extraHeadCoverageChoice += 1
	endif

	if hasExtraCloak
		extraCloakChoice += 3
	endif

	GetLegacyArmorDatastore().SetArmorData(akArmor, GetClothingDatastoreHandler().GEARTYPE_BODY, warmthChoice, coverageChoice, extraHeadWarmthChoice, extraHeadCoverageChoice, extraCloakChoice)

	PlayerRef.UnequipItem(akArmor, abSilent = true)
	Utility.Wait(0.5)
	PlayerRef.EquipItem(akArmor, abSilent = true)

	_Frost_InspectEquipmentMsg_inspectconfirm.Show()
endFunction

function ModifyHead(Armor akArmor, int[] aiWornGearValues)
	int warmthChoice = 0
	int coverageChoice = 0
	bool hasExtraCloak = false
	int extraCloakChoice

	warmthChoice = _Frost_InspectEquipmentMsg_inspectwarmth_head.Show(aiWornGearValues[2])
	if warmthChoice == 5
		; Back
		InspectHead(akArmor)
		return
	endif

	coverageChoice = _Frost_InspectEquipmentMsg_inspectcoverage_head.Show(aiWornGearValues[3])
	if coverageChoice == 5
		; Back
		InspectHead(akArmor)
		return
	endif

	if _Frost_InspectEquipmentMsg_inspectextrascloak.Show() == 0
		_Frost_InspectEquipmentMsg_inspectextrascloakconfirm.Show()
		extraCloakChoice = _Frost_InspectEquipmentMsg_inspect_cloak.Show(aiWornGearValues[8], aiWornGearValues[9])
		if extraCloakChoice == 3
			; Back
			InspectHead(akArmor)
			return
		endif

		hasExtraCloak = true
	endif

	warmthChoice += 1
	coverageChoice += 1

	if hasExtraCloak
		extraCloakChoice += 3
	endif

	GetLegacyArmorDatastore().SetArmorData(akArmor, GetClothingDatastoreHandler().GEARTYPE_HEAD, warmthChoice, coverageChoice, aiExtraType = extraCloakChoice)

	PlayerRef.UnequipItem(akArmor, abSilent = true)
	Utility.Wait(0.5)
	PlayerRef.EquipItem(akArmor, abSilent = true)

	_Frost_InspectEquipmentMsg_inspectconfirm.Show()
endFunction

function ModifyHands(Armor akArmor, int[] aiWornGearValues)
	int warmthChoice = 0
	int coverageChoice = 0

	warmthChoice = _Frost_InspectEquipmentMsg_inspectwarmth_hands.Show(aiWornGearValues[4])
	if warmthChoice == 5
		; Back
		InspectHands(akArmor)
		return
	endif

	coverageChoice = _Frost_InspectEquipmentMsg_inspectcoverage_hands.Show(aiWornGearValues[5])
	if coverageChoice == 5
		; Back
		InspectHands(akArmor)
		return
	endif

	warmthChoice += 1
	coverageChoice += 1

	GetLegacyArmorDatastore().SetArmorData(akArmor, GetClothingDatastoreHandler().GEARTYPE_HANDS, warmthChoice, coverageChoice)

	PlayerRef.UnequipItem(akArmor, abSilent = true)
	Utility.Wait(0.5)
	PlayerRef.EquipItem(akArmor, abSilent = true)

	_Frost_InspectEquipmentMsg_inspectconfirm.Show()
endFunction

function ModifyFeet(Armor akArmor, int[] aiWornGearValues)
	int warmthChoice = 0
	int coverageChoice = 0

	warmthChoice = _Frost_InspectEquipmentMsg_inspectwarmth_feet.Show(aiWornGearValues[6])
	if warmthChoice == 5
		; Back
		InspectFeet(akArmor)
		return
	endif

	coverageChoice = _Frost_InspectEquipmentMsg_inspectwarmth_feet.Show(aiWornGearValues[7])
	if coverageChoice == 5
		; Back
		InspectFeet(akArmor)
		return
	endif

	warmthChoice += 1
	coverageChoice += 1

	GetLegacyArmorDatastore().SetArmorData(akArmor, GetClothingDatastoreHandler().GEARTYPE_FEET, warmthChoice, coverageChoice)

	PlayerRef.UnequipItem(akArmor, abSilent = true)
	Utility.Wait(0.5)
	PlayerRef.EquipItem(akArmor, abSilent = true)

	_Frost_InspectEquipmentMsg_inspectconfirm.Show()
endFunction

function ModifyCloak(Armor akArmor, int[] aiWornGearValues)
	int cloakChoice = 0

	cloakChoice = _Frost_InspectEquipmentMsg_inspect_cloak.Show(aiWornGearValues[8], aiWornGearValues[9])
	if cloakChoice == 3
		; Back
		InspectCloak(akArmor)
		return
	endif

	cloakChoice += 3

	GetLegacyArmorDatastore().SetArmorData(akArmor, GetClothingDatastoreHandler().GEARTYPE_CLOAK, aiExtraType = cloakChoice)

	PlayerRef.UnequipItem(akArmor, abSilent = true)
	Utility.Wait(0.5)
	PlayerRef.EquipItem(akArmor, abSilent = true)

	_Frost_InspectEquipmentMsg_inspectconfirm.Show()
endFunction
