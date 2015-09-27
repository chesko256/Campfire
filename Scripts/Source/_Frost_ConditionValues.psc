scriptname _Frost_ConditionValues extends Quest conditional

; Condition version of FrostUtil.PlayerAbleToWait()
bool property PlayerAbleToWait = true auto conditional hidden

; Condition version of FrostUtil.IsRidingFlyingMount()
bool property IsRidingFlyingMount = false auto conditional hidden

; Compatibility
bool property IsHearthfireLoaded = false auto conditional hidden
bool property IsDawnguardLoaded = false auto conditional hidden
bool property IsDragonbornLoaded = false auto conditional hidden
bool property IsLastSeedLoaded = false auto conditional hidden

; Heat Sources
int property PlayerHeatSourceSize = 0 auto conditional hidden
float property PlayerHeatSourceDistance = -1.0 auto conditional hidden
bool property PlayerNearFire = false auto conditional hidden