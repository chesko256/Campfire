scriptname _Camp_ConditionValues extends Quest conditional

bool property IsPlayerInInterior = false auto conditional hidden
bool property IsPlayerSittingNearFire = false auto conditional hidden
bool property IsPlayerSittingInTent = false auto conditional hidden
bool property IsPlayerLayingInTent = false auto conditional hidden
bool property IsChoppingWood = false auto conditional hidden
bool property IsPerkEligible = false auto conditional hidden
; Keep IsChoppingWoodEnvironment in Campfire for hooking against Frostfall's new wood harvesting system
bool property IsChoppingWoodEnvironment = false auto conditional hidden
bool property IsRidingFlyingMount = false auto conditional hidden
bool property TreesAreNearby = false auto conditional hidden
bool property IsSKSELoaded = false auto conditional hidden
bool property IsHearthfireLoaded = false auto conditional hidden
bool property IsDawnguardLoaded = false auto conditional hidden
bool property IsDragonbornLoaded = false auto conditional hidden
bool property IsFrostfallLoaded = false auto conditional hidden
bool property IsLastSeedLoaded = false auto conditional hidden