scriptname _FrostInternal hidden

int[] function GetArmorDataFromPrecache(string asArmorName, Keyword akPrecache) global
	return StorageUtil.IntListToArray(akPrecache, "FF__" + asArmorName)
endFunction

bool function PrecacheHasArmorData(string asArmorName, Keyword akPrecache) global
	if asArmorName == ""
		return false
	endif

	if StorageUtil.IntListGet(akPrecache, "FF__" + asArmorName, 0) != 0
		return true
	else
		return false
	endif
endFunction

function TryToAddArmorToPrecache(Form akBaseItem, Keyword akPrecache) global
	if CampUtil.GetSKSELoaded()
		if akBaseItem as Armor
			string armorName = akBaseItem.GetName()
			if armorName != ""
				if StorageUtil.IntListGet(akPrecache, "FF__" + armorName, 0) == 0
					;debug.trace("Adding " + armorName + " to precache.")
					int[] armor_data = FrostUtil.GetClothingDatastoreHandler().GetArmorProtectionData(akBaseItem as Armor)
					bool result = StorageUtil.IntListCopy(akPrecache, "FF__" + armorName, armor_data)
				endif
			endif
		endif
	endif
endFunction

function TryToAddArmorDataToPrecache(Form akBaseItem, Int[] aiArmorData, Keyword akPrecache) global
	if CampUtil.GetSKSELoaded()
		if aiArmorData[0] != 0 && akBaseItem as Armor
			;debug.trace("Adding " + armorName + " to precache.")
			string armorName = akBaseItem.GetName()
			bool result = StorageUtil.IntListCopy(akPrecache, "FF__" + armorName, aiArmorData)
		endif
	endif
endFunction

function TryToRemoveArmorFromPrecache(Form akBaseItem, Keyword akPrecache) global
	if CampUtil.GetSKSELoaded()
		if akBaseItem as Armor
			string armorName = akBaseItem.GetName()
			if armorName != ""
				if StorageUtil.IntListGet(akPrecache, "FF__" + armorName, 0) != 0
					;debug.trace("Removing " + armorName + " from precache.")
					StorageUtil.IntListClear(akPrecache, "FF__" + armorName)
				endif
			endif
		endif
	endif
endFunction

int function RemoveAllArmorFromPrecache(Keyword akPrecache) global
	if CampUtil.GetSKSELoaded()
		return StorageUtil.ClearAllObjPrefix(akPrecache, "FF__")
	else
		return 0
	endif
endFunction

_Frost_Strings function GetFrostfallStrings() global
	return (Game.GetFormFromFile(0x068BED, "Frostfall.esp") as _Frost_Strings)
endFunction

bool function IsBetweenInclusive(float Value, float Beginning, float End) global
	if Value >= Beginning && Value <= End
		return true
	else
		return false
	endif
endFunction

function FrostDebug(int aiSeverity, string asLogMessage) global
	int LOG_LEVEL = (Game.GetFormFromFile(0x0006458F, "Frostfall.esp") as GlobalVariable).GetValueInt()
	if LOG_LEVEL <= 3 && LOG_LEVEL <= aiSeverity
		if aiSeverity == -1
			debug.trace("[Frostfall][SystemPerformance] " + asLogMessage)
		elseif aiSeverity == 0
			debug.trace("[Frostfall][Debug] " + asLogMessage)
		elseif aiSeverity == 1
			debug.trace("[Frostfall][Info] " + asLogMessage)
		elseif aiSeverity == 2
			debug.trace("[Frostfall][Warning] " + asLogMessage)
		elseif aiSeverity == 3
			debug.trace("[Frostfall][ERROR] " + asLogMessage)
		endif
	endif
endFunction