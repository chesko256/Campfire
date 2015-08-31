scriptname _Camp_ConditionValues extends Quest conditional

; Condition version of CampUtil.IsRefInInterior(PlayerRef)
bool property IsPlayerInInterior = false auto conditional hidden

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
bool property IsSKSELoaded = false auto conditional hidden
bool property IsHearthfireLoaded = false auto conditional hidden
bool property IsDawnguardLoaded = false auto conditional hidden
bool property IsDragonbornLoaded = false auto conditional hidden
bool property IsFrostfallLoaded = false auto conditional hidden
bool property IsLastSeedLoaded = false auto conditional hidden
bool property IsArtOfTheCatchLoaded = false auto conditional hidden

; Misc
bool property IsRidingFlyingMount = false auto conditional hidden
bool property TreesAreNearby = false auto conditional hidden