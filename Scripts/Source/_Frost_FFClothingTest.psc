scriptname _Frost_FFClothingTest extends Whatever


; CRUD
function SetArmorData(Armor akArmor, int aiWarmth, int aiCoverage, 								\
									 int aiExtraBodyWarmth = 0, int aiExtraBodyCoverage = 0, 	\
									 int aiExtraHeadWarmth = 0, int aiExtraHeadCoverage = 0, 	\
									 int aiExtraHandsWarmth = 0, int aiExtraHandsCoverage = 0, 	\
									 int aiExtraFeetWarmth = 0, int aiExtraFeetCoverage = 0, 	\
									 int aiExtraCloakWarmth = 0, int aiExtraCloakCoverage = 0, 	\
									 int aiExtraMiscWarmth = 0, int aiExtraMiscCoverage = 0)
	string profile_path = CONFIG_PATH + "profile" + _Frost_Setting_CurrentProfile.GetValueInt()
	string dskey = GetDatastoreKeyFromForm(akArmor)
	JsonUtil.IntListAdd(profile_path, dskey, aiWarmth				+ 1) ; + 1 so that 0 is a meaningful value on Get
	JsonUtil.IntListAdd(profile_path, dskey, aiCoverage				+ 1)
	JsonUtil.IntListAdd(profile_path, dskey, aiExtraBodyWarmth		+ 1)
	JsonUtil.IntListAdd(profile_path, dskey, aiExtraBodyCoverage	+ 1)
	JsonUtil.IntListAdd(profile_path, dskey, aiExtraHeadWarmth		+ 1)
	JsonUtil.IntListAdd(profile_path, dskey, aiExtraHeadCoverage	+ 1)
	JsonUtil.IntListAdd(profile_path, dskey, aiExtraHandsWarmth		+ 1)
	JsonUtil.IntListAdd(profile_path, dskey, aiExtraHandsCoverage	+ 1)
	JsonUtil.IntListAdd(profile_path, dskey, aiExtraFeetWarmth		+ 1)
	JsonUtil.IntListAdd(profile_path, dskey, aiExtraFeetCoverage	+ 1)
	JsonUtil.IntListAdd(profile_path, dskey, aiExtraCloakWarmth		+ 1)
	JsonUtil.IntListAdd(profile_path, dskey, aiExtraCloakCoverage	+ 1)
	JsonUtil.IntListAdd(profile_path, dskey, aiExtraMiscWarmth		+ 1)
	JsonUtil.IntListAdd(profile_path, dskey, aiExtraMiscCoverage	+ 1)

	JsonUtil.Save(profile_path)
endFunction

bool function UpdateArmorData(Form akBaseObject, int aiWarmth = -1, int aiCoverage = -1, 					\
	                                        int aiExtraBodyWarmth = -1, int aiExtraBodyCoverage = -1, 	\
	                                        int aiExtraHeadWarmth = -1, int aiExtraHeadCoverage = -1, 	\
	                                        int aiExtraHandsWarmth = -1, int aiExtraHandsCoverage = -1, \
	                                        int aiExtraFeetWarmth = -1, int aiExtraFeetCoverage = -1, 	\
	                                        int aiExtraCloakWarmth = -1, int aiExtraCloakCoverage = -1, \
	                                        int aiExtraMiscWarmth = -1, int aiExtraMiscCoverage = -1)
	string profile_path = CONFIG_PATH + "profile" + _Frost_Setting_CurrentProfile.GetValueInt()
	string dskey = GetDatastoreKeyFromForm(akArmor)
	if ; key exists
		if aiWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 0, aiWarmth				+ 1) ; + 1 so that 0 is a meaningful value on Get
		endif
		if aiCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 1, aiCoverage				+ 1)
		endif
		if aiExtraBodyWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 2, aiExtraBodyWarmth		+ 1)
		endif
		if aiExtraBodyCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 3, aiExtraBodyCoverage		+ 1)
		endif
		if aiExtraHeadWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 4, aiExtraHeadWarmth		+ 1)
		endif
		if aiExtraHeadCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 5, aiExtraHeadCoverage		+ 1)
		endif
		if aiExtraHandsWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 6, aiExtraHandsWarmth		+ 1)
		endif
		if aiExtraHandsCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 7, aiExtraHandsCoverage	+ 1)
		endif
		if aiExtraFeetWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 8, aiExtraFeetWarmth		+ 1)
		endif
		if aiExtraFeetCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 9, aiExtraFeetCoverage		+ 1)
		endif
		if aiExtraCloakWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 10, aiExtraCloakWarmth		+ 1)
		endif
		if aiExtraCloakCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 11, aiExtraCloakCoverage	+ 1)
		endif
		if aiExtraMiscWarmth != -1
			JsonUtil.IntListSet(profile_path, dskey, 12, aiExtraMiscWarmth		+ 1)
		endif
		if aiExtraMiscCoverage != -1
			JsonUtil.IntListSet(profile_path, dskey, 13, aiExtraMiscCoverage	+ 1)
		endif
		JsonUtil.Save(profile_path)
	endif
endFunction

function DeleteArmorData(Form akBaseObject)

endFunction

; GET
int[] function GetArmorData(Form akBaseObject)

endFunction