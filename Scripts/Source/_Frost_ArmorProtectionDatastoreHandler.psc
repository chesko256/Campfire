scriptname _Frost_ArmorProtectionDatastoreHandler extends _Frost_APDatastoreDefaultData

import StorageUtil
import StringUtil
import _FrostInternal

Keyword property _FrostData_ArmorBody auto
Keyword property _FrostData_ArmorHead auto
Keyword property _FrostData_ArmorHands auto
Keyword property _FrostData_ArmorFeet auto
Keyword property _FrostData_ArmorCloak auto

Keyword property ClothingCirclet auto

Event OnInit()
	if !self.IsRunning()
		self.Start()
		return
	endif
	RevertDatastore()
EndEvent

int[] function GetArmorProtectionData(Armor akArmor, int aiGearType)
	int[] result = new int[2]
	string ds_key = GetDatastoreKeyFromForm(akArmor)
	Keyword Datastore
	if aiGearType == 1
		Datastore = _FrostData_ArmorBody
	elseif aiGearType == 2
		Datastore = _FrostData_ArmorHands
	elseif aiGearType == 3
		Datastore = _FrostData_ArmorHead
	elseif aiGearType == 4
		Datastore = _FrostData_ArmorFeet
	elseif aiGearType == 7
		Datastore = _FrostData_ArmorCloak
	endif

	; Subtract 1 to return a falsey -1 on failure
	result[0] = (IntListGet(Datastore, ds_key, 0) - 1)
	result[1] = (IntListGet(Datastore, ds_key, 1) - 1)

	if result[0] == -1 || result[1] == -1
		; Try to set sane default values
		if aiGearType == 1
			result[0] = 110
			result[1] = 10
		elseif aiGearType == 2
			result[0] = 12
			result[1] = 2
		elseif aiGearType == 3
			if akArmor.HasKeyword(ClothingCirclet)
				result[0] = 0
				result[1] = 0
			elseif StringUtil.Find(akArmor.GetName(), "hood") != -1
				result[0] = 25
				result[1] = 12
			else
				result[0] = 30
				result[1] = 4
			endif
		elseif aiGearType == 4
			result[0] = 12
			result[1] = 4
		endif
	endif
	return result
endFunction

string function GetDatastoreKeyFromForm(Armor akArmor)
	int form_id = akArmor.GetFormID()
	int mod_index = form_id/16777216
	if mod_index < 0
		mod_index = 0
	endif

	return (form_id % 16777216) + "___" + Game.GetModName(mod_index)
endFunction

string function GetDatastoreKeyFromID(int aiFormID)
	int mod_index = aiFormID/16777216
	if mod_index < 0
		mod_index = 0
	endif
	return (aiFormID % 16777216) + "___" + Game.GetModName(mod_index)
endFunction

function AddDatastoreEntryByKey(string asKey, int aiGearType, int aiExposureProtection, int aiRainProtection)
	Keyword Datastore
	if aiGearType == 1
		Datastore = _FrostData_ArmorBody
	elseif aiGearType == 2
		Datastore = _FrostData_ArmorHands
	elseif aiGearType == 3
		Datastore = _FrostData_ArmorHead
	elseif aiGearType == 4
		Datastore = _FrostData_ArmorFeet
	elseif aiGearType == 7
		Datastore = _FrostData_ArmorCloak
	endif

	; Do we know if the entry exists already? Assume 'yes, we know it doesn't' for now.
	; Add 1 so we can return a falsey -1 on failure later
	IntListAdd(Datastore, asKey, aiExposureProtection + 1)
	IntListAdd(Datastore, asKey, aiRainProtection + 1)
endFunction

function AddDatastoreEntryByForm(Armor akArmor, int aiGearType, int aiExposureProtection, int aiRainProtection)
	string ds_key = GetDatastoreKeyFromForm(akArmor)
	Keyword Datastore
	if aiGearType == 1
		Datastore = _FrostData_ArmorBody
	elseif aiGearType == 2
		Datastore = _FrostData_ArmorHands
	elseif aiGearType == 3
		Datastore = _FrostData_ArmorHead
	elseif aiGearType == 4
		Datastore = _FrostData_ArmorFeet
	elseif aiGearType == 7
		Datastore = _FrostData_ArmorCloak
	endif

	; Do we know if the entry exists already? Assume 'yes, we know it doesn't' for now.
	IntListAdd(Datastore, ds_key, aiExposureProtection + 1)
	IntListAdd(Datastore, ds_key, aiRainProtection + 1)
endFunction

function UpdateDatastoreEntry(string asKey, int aiExposureProtection, int aiRainProtection)

endFunction

function RevertDatastore()
	FrostDebug(1, "Setting default settings for body armor...")
	SetDefaults_Body()
	FrostDebug(1, "Setting default settings for body armor...done.")
	FrostDebug(1, "Setting default settings for hands armor...")
	SetDefaults_Hands()
	FrostDebug(1, "Setting default settings for hands armor...done.")
	FrostDebug(1, "Setting default settings for head armor...")
	SetDefaults_Head()
	FrostDebug(1, "Setting default settings for head armor...done.")
	FrostDebug(1, "Setting default settings for feet armor...")
	SetDefaults_Feet()
	FrostDebug(1, "Setting default settings for feet armor...done.")
	FrostDebug(1, "Setting default settings for cloak armor...")
	SetDefaults_Cloak()
	FrostDebug(1, "Setting default settings for cloak armor...done.")
endFunction

function RevertDatastoreEntry(string asKey)

endFunction
