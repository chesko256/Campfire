scriptname _Camp_AidAsAbilityMonitor extends ReferenceAlias

import _CampInternal

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)

	debug.trace("Object equipped " + akBaseObject)
	if akBaseObject == _Camp_SurvivalSkillBuildCampsiteAid
		if PlayerCanPlaceObjects()
			debug.notification("Exit Pip-Boy to select campsite location.")
			; Block until exit menu
			Utility.Wait(0.1)
			PlayerRef.AddItem(_Camp_SurvivalSkillBuildCampsiteAid, 1, true)
			CampUtil.GetPlacementSystem().PlaceableObjectUsed(Required_this_item,           \
                                                              Required_placement_indicator, \
										  					  none,							\
										  					  none,							\
										  					  0,							\
										  					  none,               			\
                                                              "", 				    		\
                                                              "",						 	\
                                                              "")
		endif
	endif
EndEvent