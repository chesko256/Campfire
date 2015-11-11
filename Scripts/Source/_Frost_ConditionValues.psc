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
bool property IsSkyReLoaded = false auto conditional hidden
bool property IsInDialogue = false auto conditional hidden
bool property IsVampire = false auto conditional hidden
bool property IsBeast = false auto conditional hidden
bool property IsImmune = false auto conditional hidden