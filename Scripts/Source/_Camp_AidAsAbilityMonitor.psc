scriptname _Camp_AidAsAbilityMonitor extends ReferenceAlias

import CampUtil

Actor property PlayerRef auto
Message property _Camp_CampsiteExitPipboy auto
Potion property _Camp_SurvivalSkillBuildCampsiteAid auto
Activator property _Camp_CampsiteIndicator auto

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
	if akBaseObject == _Camp_SurvivalSkillBuildCampsiteAid
		if PlayerCanPlaceObjects()
			_Camp_CampsiteExitPipboy.Show()
			; Block until exit menu
			Utility.Wait(0.5)
			PlayerRef.AddItem(_Camp_SurvivalSkillBuildCampsiteAid, 1, true)
			CampUtil.GetPlacementSystem().PlaceableObjectUsed(none,   						\
                                                              _Camp_CampsiteIndicator, 		\
										  					  none,							\
										  					  none,							\
										  					  0,							\
										  					  none,               			\
                                                              "", 				    		\
                                                              "",						 	\
                                                              "")
		else
			PlayerRef.AddItem(_Camp_SurvivalSkillBuildCampsiteAid, 1, true)
		endif
	endif
EndEvent