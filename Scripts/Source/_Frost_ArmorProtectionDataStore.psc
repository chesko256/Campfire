scriptname _Frost_ArmorProtectionDataStore extends Quest

import StorageUtil
import StringUtil

Armor property ArmorIronCuirass auto
Armor property ArmorIronGauntlets auto
Armor property ArmorIronHelmet auto
Armor property ArmorIronBoots auto

Keyword property _FrostData_ArmorBody auto
Keyword property _FrostData_ArmorHead auto
Keyword property _FrostData_ArmorHands auto
Keyword property _FrostData_ArmorFeet auto
Keyword property _FrostData_ArmorCloak auto

Event OnInit()
	test_setabunchofvalues()
EndEvent

int[] function GetArmorProtectionData()
	
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
	IntListAdd(Datastore, asKey, aiExposureProtection)
	IntListAdd(Datastore, asKey, aiRainProtection)
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
	IntListAdd(Datastore, ds_key, aiExposureProtection)
	IntListAdd(Datastore, ds_key, aiRainProtection)
endFunction

function UpdateDatastoreEntry(string asKey, int aiExposureProtection, int aiRainProtection)

endFunction

function RevertDatastore()

endFunction

function RevertDatastoreEntry(string asKey)

endFunction

function test_setabunchofvalues()
	int a_id = ArmorIronCuirass.GetFormID()
	int b_id = ArmorIronGauntlets.GetFormID()
	int c_id = ArmorIronHelmet.GetFormID()
	int d_id = ArmorIronBoots.GetFormID()

	int a_modindex = a_id/16777216
	if a_modindex < 0
		a_modindex = 0
	endif

	int b_modindex = a_id/16777216
	if b_modindex < 0
		b_modindex = 0
	endif

	int c_modindex = a_id/16777216
	if c_modindex < 0
		c_modindex = 0
	endif

	int d_modindex = a_id/16777216
	if d_modindex < 0
		d_modindex = 0
	endif

	debug.trace("The mod index of a is " + a_modindex)
	debug.trace("The mod index of b is " + b_modindex)
	debug.trace("The mod index of c is " + c_modindex)
	debug.trace("The mod index of d is " + d_modindex)

	debug.trace("The mod that added a is " + Game.GetModName(a_modindex))
	debug.trace("The mod that added b is " + Game.GetModName(b_modindex))
	debug.trace("The mod that added c is " + Game.GetModName(c_modindex))
	debug.trace("The mod that added d is " + Game.GetModName(d_modindex))

	string a_key = (a_id % 16777216) + "___" + Game.GetModName(a_modindex)
	string b_key = (b_id % 16777216) + "___" + Game.GetModName(b_modindex)
	string c_key = (c_id % 16777216) + "___" + Game.GetModName(c_modindex)
	string d_key = (d_id % 16777216) + "___" + Game.GetModName(d_modindex)

	debug.trace("The composite key for a is " + a_key)
	debug.trace("The composite key for b is " + b_key)
	debug.trace("The composite key for c is " + c_key)
	debug.trace("The composite key for d is " + d_key)

	IntListAdd(_FrostData_ArmorBody, a_key, 50)
	IntListAdd(_FrostData_ArmorBody, a_key, 30)
	IntListAdd(_FrostData_ArmorBody, b_key, 25)
	IntListAdd(_FrostData_ArmorBody, b_key, 25)
	IntListAdd(_FrostData_ArmorBody, c_key, 13)
	IntListAdd(_FrostData_ArmorBody, c_key, 12)
	IntListAdd(_FrostData_ArmorBody, d_key, 75)
	IntListAdd(_FrostData_ArmorBody, d_key, 125)

	int result_1 = IntListGet(_FrostData_ArmorBody, a_key, 0)
	int result_2 = IntListGet(_FrostData_ArmorBody, a_key, 1)
	int result_3 = IntListGet(_FrostData_ArmorBody, b_key, 0)
	int result_4 = IntListGet(_FrostData_ArmorBody, b_key, 1)
	int result_5 = IntListGet(_FrostData_ArmorBody, c_key, 0)
	int result_6 = IntListGet(_FrostData_ArmorBody, c_key, 1)
	int result_7 = IntListGet(_FrostData_ArmorBody, d_key, 0)
	int result_8 = IntListGet(_FrostData_ArmorBody, d_key, 1)
	
	debug.trace("Exposure protection for " + ArmorIronCuirass + ": " + result_1)
	debug.trace("Rain protection for " + ArmorIronCuirass + ": " + result_2)

	debug.trace("Exposure protection for " + ArmorIronGauntlets + ": " + result_3)
	debug.trace("Rain protection for " + ArmorIronGauntlets + ": " + result_4)

	debug.trace("Exposure protection for " + ArmorIronHelmet + ": " + result_5)
	debug.trace("Rain protection for " + ArmorIronHelmet + ": " + result_6)

	debug.trace("Exposure protection for " + ArmorIronBoots + ": " + result_7)
	debug.trace("Rain protection for " + ArmorIronBoots + ": " + result_8)
endFunction
