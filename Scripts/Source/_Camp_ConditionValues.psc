scriptname _Camp_ConditionValues extends Quest conditional

; Condition version of CampUtil.IsRefInInterior(PlayerRef)
bool property IsPlayerInInterior = false auto conditional hidden

; Tent conditions
bool property CurrentTentHasLantern = false auto conditional hidden
bool property CurrentTentHasVisualShelter = false auto conditional hidden

; Follower conditions
bool property Follower1Registered = false auto conditional hidden
bool property Follower2Registered = false auto conditional hidden
bool property Follower3Registered = false auto conditional hidden
bool property AnimalRegistered = false auto conditional hidden

; For follower packages
bool property IsPlayerSittingNearFire = false auto conditional hidden
bool property IsPlayerSittingInTent = false auto conditional hidden
bool property IsPlayerLayingInTent = false auto conditional hidden

; Whether the currently selected Campfire Perk is eligible for upgrade
bool property IsPerkEligible = false auto conditional hidden

; For dynamic backpack support
; Keep IsChoppingWoodEnvironment in Campfire for hooking against Frostfall's new wood harvesting system
bool property IsChoppingWood = false auto conditional hidden
bool property IsChoppingWoodEnvironment = false auto conditional hidden

; Compatibility
bool property IsF4SELoaded = false auto conditional hidden
bool property IsAutomatronLoaded = false auto conditional hidden
bool property IsWastelandWorkshopLoaded = false auto conditional hidden
bool property IsFarHarborLoaded = false auto conditional hidden
bool property IsSurvivalModeLoaded = false auto conditional hidden

; Campfire Lighting
bool property IsLightingFireFlameSpell = false auto conditional hidden

; Misc
bool property IsRidingFlyingMount = false auto conditional hidden
bool property TreesAreNearby = false auto conditional hidden
bool property IsSelectedObjectConjured = false auto conditional hidden
bool property IsCurrentTentConjured = false auto conditional hidden
bool property IsCurrentTentUsingFullBed = false auto conditional hidden