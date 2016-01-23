scriptname _Camp_Strings extends Quest

; Harvest Wood strings
string property Follower_gathered auto
string property FollowerHarvestDeadwood auto
string property FollowerHarvestBranches auto
string property FollowerHarvestDeadwoodPlural auto
string property FollowerHarvestBranchesPlural auto
string property FollowerNameGeneric auto
string property AnimalNameGeneric auto

; Placement strings
string property IngredientRequired auto

; SkyUI MCM strings
string property HotkeyConflict1 auto
string property HotkeyConflict2 auto
string property HotkeyConflict3_mod auto
string property HotkeyConflict3_game auto
string property HotkeyDescription_CreateItem auto
string property HotkeyDescription_BuildCampfire auto
string property HotkeyDescription_HarvestWood auto
string property HotkeyDescription_Instincts auto

; Frostfall Critical Error strings
string property FrostfallCriticalError1 auto
string property FrostfallCriticalError2 auto
string property FrostfallCriticalError2NoSKSE auto
string property FrostfallCriticalError3 auto
string property FrostfallCriticalError4 auto

string property FrostfallCriticalErrorUnknown1 auto
string property FrostfallCriticalErrorUnknown2 auto
string property FrostfallCriticalErrorUnknown3 auto

; at enabled plug-in position 

;Campfire Error: Frostfall 2.6 or below was detected, but Campfire could not resolve this to an enabled plug-in in your load order. The cause of this is unknown, but could be due to improperly upgrading Frostfall 2.6 to 3.x. Ensure that you followed all instructions on the Frostfall 3 Quickstart Guide and clean-saved. You can continue to play, but there may be a problem with your save game or load order that requires a clean save.

;(Details: Game.GetFormFromFile(0xD63, "Chesko_Frostfall.esp") detected legacy Frostfall main quest 
;	FORM, but Game.GetModByName("Chesko_Frostfall.esp") couldn't find the plugin.)