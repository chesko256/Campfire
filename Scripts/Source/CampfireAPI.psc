scriptname CampfireAPI extends Quest

;#Properties =======================================================================
CampfireData property CampData auto
_Camp_LegalAreaCheck property Legal auto
_Camp_Compatibility property Compatibility auto
Actor property PlayerRef auto
Formlist property _Camp_WorldspacesInteriors auto
Keyword property isCampfireCrimeToPlaceInTowns auto
Keyword property isCampfirePlaceableObject auto
Keyword property isCampfireTentWaterproof auto
Keyword property isCampfireTentWarm auto
GlobalVariable property _Camp_CurrentlyPlacingObject auto
GlobalVariable property _Camp_Setting_EquipmentFlammable auto
Quest property CampfireObjectPlacementSystem auto
ObjectReference property LastUsedCampfire auto hidden
ReferenceAlias property Follower1 auto
ReferenceAlias property Follower2 auto
ReferenceAlias property Follower3 auto
ReferenceAlias property Animal auto

Formlist property _Camp_TentActivators auto
Formlist property _Camp_FurTentsSmall auto
Formlist property _Camp_FurTentsLarge auto
Formlist property _Camp_LeatherTentsSmall auto
Formlist property _Camp_LeatherTentsLarge auto
Formlist property _Camp_ConjuredShelters auto

Message property _Camp_GeneralError_Placement auto
Message property _Camp_GeneralError_Swimming auto
Message property _Camp_GeneralError_Mounted auto
Message property _Camp_GeneralError_Sleeping auto
Message property _Camp_GeneralError_Busy auto