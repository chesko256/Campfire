scriptname _Frost_FFClothingTest extends Whatever


; CRUD
function SetArmorData(Armor akArmor, int aiBodyWarmth = 0, int aiBodyCoverage = 0, int aiHeadWarmth = 0, int aiHeadCoverage = 0, int aiHandsWarmth = 0, int aiHandsCoverage = 0, int aiFeetWarmth = 0, int aiFeetCoverage = 0, int aiCloakWarmth = 0, int aiCloakCoverage = 0, int aiMiscWarmth = 0, int aiMiscCoverage = 0)
	string profile_path = CONFIG_PATH + "profile" + _Frost_Setting_CurrentProfile.GetValueInt()
	string dskey = GetDatastoreKeyFromForm(akArmor)

	JsonUtil.IntListAdd(profile_path, dskey, aiBodyWarmth)

	JsonUtil.SetIntValue(CONFIG_PATH + "profile" + current_profile_index, asKeyName, aiValue)
	JsonUtil.Save(CONFIG_PATH + "profile" + current_profile_index)
endFunction

function UpdateArmorData(Form akBaseObject, int aiBodyWarmth = -1, int aiBodyCoverage = -1, int aiHeadWarmth = -1, int aiHeadCoverage = -1, int aiHandsWarmth = -1, int aiHandsCoverage = -1, int aiFeetWarmth = -1, int aiFeetCoverage = -1, int aiCloakWarmth = -1, int aiCloakCoverage = -1, int aiMiscWarmth = -1, int aiMiscCoverage = -1)
	if ; key exists
		;update
	else
		;return false
	endif
endFunction

function DeleteArmorData(Form akBaseObject)

endFunction

; GET
int[] function GetArmorData(Form akBaseObject)

endFunction