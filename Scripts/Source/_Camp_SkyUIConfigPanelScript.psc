Scriptname _Camp_SkyUIConfigPanelScript extends SKI_ConfigBase

import _CampInternal

string CONFIG_PATH = "../CampfireData/"

; External scripts
_Camp_Compatibility property Compatibility auto

GlobalVariable property _Camp_Setting_EquipmentFlammable auto
GlobalVariable property _Camp_Setting_CampingArmorTakeOff auto
GlobalVariable property _Camp_Setting_TakeOff_Helm auto
GlobalVariable property _Camp_Setting_TakeOff_Cuirass auto
GlobalVariable property _Camp_Setting_TakeOff_Gauntlets auto
GlobalVariable property _Camp_Setting_TakeOff_Boots auto
GlobalVariable property _Camp_Setting_TakeOff_Backpack auto
GlobalVariable property _Camp_Setting_TakeOff_Weapons auto
GlobalVariable property _Camp_Setting_TakeOff_Shield auto
GlobalVariable property _Camp_Setting_TakeOff_Ammo auto
GlobalVariable property _Camp_Setting_TrackFollowers auto
GlobalVariable property _Camp_Setting_FollowersUseCampsite auto
GlobalVariable property _Camp_Setting_FollowersRemoveGearInTents auto
GlobalVariable property _Camp_Setting_MaxThreads auto
GlobalVariable property _Camp_Setting_EquipTentOutfit auto
GlobalVariable property _Camp_Setting_Legality auto
GlobalVariable property _Camp_Setting_AdvancedPlacement auto
GlobalVariable property _Camp_Setting_CompatibilityEO auto
GlobalVariable property _Camp_Setting_AutoSaveLoad auto
GlobalVariable property _Camp_Setting_CurrentProfile auto
GlobalVariable property _Camp_Setting_EnableTutorials auto
GlobalVariable property _Camp_Setting_InstinctsFindTinder auto
GlobalVariable property _Camp_Setting_InstinctsFindFlora auto
GlobalVariable property _Camp_Setting_InstinctsHearCreatures auto
GlobalVariable property _Camp_Setting_InstinctsSmellDead auto
GlobalVariable property _Camp_Setting_InstinctsSenseObjective auto
GlobalVariable property _Camp_Setting_InstinctsVFX auto
GlobalVariable property _Camp_Setting_InstinctsSFX auto
GlobalVariable property _Camp_Setting_CampfireMode auto
GlobalVariable property _Camp_CurrentlyPlacingObject auto
GlobalVariable property _Camp_HotkeyCreateItem auto
GlobalVariable property _Camp_HotkeyBuildCampfire auto
GlobalVariable property _Camp_HotkeyHarvestWood auto
GlobalVariable property _Camp_HotkeyInstincts auto

GlobalVariable property CampingPerkPoints auto
GlobalVariable property CampingPerkPointsEarned auto
GlobalVariable property CampingPerkPointProgress auto
GlobalVariable property CampingPerkPointsTotal auto
GlobalVariable property _Camp_PerkRank_Firecraft auto
GlobalVariable property _Camp_PerkRank_HighSpirits auto
GlobalVariable property _Camp_PerkRank_KeenSenses auto
GlobalVariable property _Camp_PerkRank_Resourceful auto
GlobalVariable property _Camp_PerkRank_Trailblazer auto

GlobalVariable property _Camp_Tutorial_FireBuilding1_Displayed auto
GlobalVariable property _Camp_Tutorial_FireBuilding2_Displayed auto
GlobalVariable property _Camp_Tutorial_FireBuilding3_Displayed auto
GlobalVariable property _Camp_Tutorial_FireBuilding4_Displayed auto
GlobalVariable property _Camp_Tutorial_FireBuilding5_Displayed auto
GlobalVariable property _Camp_Tutorial_SkillSystem1_Displayed auto
GlobalVariable property _Camp_Tutorial_SkillSystem2_Displayed auto
GlobalVariable property _Camp_Tutorial_SkillSystem3_Displayed auto

Actor property PlayerRef auto
ReferenceAlias property Follower1 auto
ReferenceAlias property Follower2 auto
ReferenceAlias property Follower3 auto
ReferenceAlias property Animal auto
Spell property _Camp_CreateItemSpell auto
Spell property _Camp_CampfireSpell auto
Spell property _Camp_HarvestWoodSpell auto
Spell property _Camp_SurvivalVisionPower auto
Spell property _Camp_FollowerDetectSpell auto
Message property _Camp_TroubleshootingConfirmMsg auto

string[] ProfileList
string[] TroubleshootingList
string[] CampfireModeList
int TroubleshootingIndex = 0

int Gameplay_SettingCampingCampfireMode_OID
int Gameplay_SettingCampingLegalityToggle_OID
int Gameplay_SettingCampingArmorTentsText_OID
int Gameplay_SettingCampingFlammabilityToggle_OID

int Gameplay_SettingCampingPlaceHelm_OID
int Gameplay_SettingCampingPlaceCuirass_OID
int Gameplay_SettingCampingPlaceBoots_OID
int Gameplay_SettingCampingPlaceGauntlets_OID
int Gameplay_SettingCampingPlaceBackpack_OID
int Gameplay_SettingCampingPlaceWeapons_OID
int Gameplay_SettingCampingPlaceShield_OID
int Gameplay_SettingCampingPlaceAmmo_OID

int Gameplay_SettingCampingFollowersInteract_OID
int Gameplay_SettingCampingFollowersRemoveGear_OID

int Gameplay_HotkeyCreateItem_OID
int Gameplay_HotkeyBuildCampfire_OID
int Gameplay_HotkeyHarvestWood_OID
int Gameplay_HotkeyInstincts_OID

int Instincts_SettingFindTinder_OID
int Instincts_SettingFindFlora_OID
int Instincts_SettingHearCreatures_OID
int Instincts_SettingSmellDead_OID
int Instincts_SettingSenseObjective_OID
int Instincts_SettingVFX_OID
int Instincts_SettingSFX_OID

int Advanced_SettingAdvancedPlacement_OID
int Advanced_SettingMaxThreads_OID
int Advanced_SettingTrackFollowers_OID
int Advanced_SettingEOCompatibility_OID
int Advanced_CampingSkillRespec_OID
int Advanced_CampingSkillRestore_OID
int Advanced_CampingSkillRestoreSlider_OID

int Help_TroubleshootingMenu_OID
int Help_SettingEnableTutorials_OID
int Help_ResetTutorials_OID
int Guide_Topic1
int Guide_Topic2
int Guide_Topic3
int Guide_Topic4
int Guide_Topic5
int Guide_Topic6

int SaveLoad_SelectProfile_OID
int SaveLoad_RenameProfile_OID
int SaveLoad_DefaultProfile_OID
int SaveLoad_ProfileHelp_OID
int SaveLoad_Enable_OID

float DEFAULT_THREADS = 20.0
float MIN_THREADS = 0.0
float MAX_THREADS = 30.0

Event OnConfigInit()
	Pages = new string[5]
	Pages[0] = "$CampfireGameplayPage"
	Pages[1] = "$CampfireInstinctsPage"
	Pages[2] = "$CampfireAdvancedPage"
	Pages[3] = "$CampfireHelpPage"
	Pages[4] = "$CampfireSaveLoadPage"

	CampfireModeList = new string[2]
	CampfireModeList[0] = "$CampfireCampfireModeQuick"
	CampfireModeList[1] = "$CampfireCampfireModeRealistic"
	
	TroubleshootingList = new string[2]
	TroubleshootingList[0] = "$CampfireTroubleshooting0"
	TroubleshootingList[1] = "$CampfireTroubleshooting1"
endEvent

int function GetVersion()
	return 4
endFunction

Event OnVersionUpdate(int a_version)
	if (a_version >= 3 && CurrentVersion < 3)
		debug.trace("[Campfire][Info] Upgrading MCM script to version " + a_version)
		OnConfigInit()
	endif
EndEvent

function PageReset_Gameplay()
	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("$CampfireGameplayHeaderCamping")

	int campfireMode = _Camp_Setting_CampfireMode.GetValueInt() 
	if campfireMode > 1
		campfireMode = 1
	endif
	Gameplay_SettingCampingCampfireMode_OID = AddMenuOption("$CampfireGameplaySettingCampfireMode", CampfireModeList[campfireMode])
	
	if _Camp_Setting_CampingArmorTakeOff.GetValueInt() == 2
		Gameplay_SettingCampingArmorTentsText_OID = AddToggleOption("$CampfireGameplaySettingCampingRemoveGear", true)
	else
		Gameplay_SettingCampingArmorTentsText_OID = AddToggleOption("$CampfireGameplaySettingCampingRemoveGear", false)
	endif

	if _Camp_Setting_Legality.GetValueInt() == 2
		Gameplay_SettingCampingLegalityToggle_OID = AddToggleOption("$CampfireGameplaySettingLegality", true)
	else
		Gameplay_SettingCampingLegalityToggle_OID = AddToggleOption("$CampfireGameplaySettingLegality", false)
	endif

	if _Camp_Setting_EquipmentFlammable.GetValueInt() == 2
		Gameplay_SettingCampingFlammabilityToggle_OID = AddToggleOption("$CampfireGameplaySettingFlammability", true)
	else
		Gameplay_SettingCampingFlammabilityToggle_OID = AddToggleOption("$CampfireGameplaySettingFlammability", false)
	endif

	AddEmptyOption()
	AddEmptyOption()
	
	AddHeaderOption("$CampfireGameplayHeaderHotkeys")
	Gameplay_HotkeyCreateItem_OID = AddKeyMapOption("$CampfireGameplayHotkeyCreateItem", _Camp_HotkeyCreateItem.GetValueInt())
	Gameplay_HotkeyBuildCampfire_OID = AddKeyMapOption("$CampfireGameplayHotkeyBuildCampfire", _Camp_HotkeyBuildCampfire.GetValueInt())
	Gameplay_HotkeyHarvestWood_OID = AddKeyMapOption("$CampfireGameplayHotkeyHarvestWood", _Camp_HotkeyHarvestWood.GetValueInt())
	if Compatibility.isSKSELoaded
		Gameplay_HotkeyInstincts_OID = AddKeyMapOption("$CampfireGameplayHotkeyInstincts", _Camp_HotkeyInstincts.GetValueInt())
	else
		Gameplay_HotkeyInstincts_OID = AddKeyMapOption("$CampfireGameplayHotkeyInstinctsSKSERequired", _Camp_HotkeyInstincts.GetValueInt())
	endif
	
	AddEmptyOption()

	SetCursorPosition(1) ; Move cursor to top right position

	AddHeaderOption("$CampfireGameplayHeaderTentDisplay")

	if _Camp_Setting_CampingArmorTakeOff.GetValueInt() == 2
		if _Camp_Setting_TakeOff_Cuirass.GetValueInt() == 2
			Gameplay_SettingCampingPlaceCuirass_OID = AddToggleOption("$CampfireGameplaySettingShowCuirass", true)
		else
			Gameplay_SettingCampingPlaceCuirass_OID = AddToggleOption("$CampfireGameplaySettingShowCuirass", false)
		endif
		if _Camp_Setting_TakeOff_Gauntlets.GetValueInt() == 2
			Gameplay_SettingCampingPlaceGauntlets_OID = AddToggleOption("$CampfireGameplaySettingShowGauntlets", true)
		else
			Gameplay_SettingCampingPlaceGauntlets_OID = AddToggleOption("$CampfireGameplaySettingShowGauntlets", false)
		endif
		if _Camp_Setting_TakeOff_Backpack.GetValueInt() == 2
			Gameplay_SettingCampingPlaceBackpack_OID = AddToggleOption("$CampfireGameplaySettingShowBackpack", true)
		else
			Gameplay_SettingCampingPlaceBackpack_OID = AddToggleOption("$CampfireGameplaySettingShowBackpack", false)
		endif
		if _Camp_Setting_TakeOff_Weapons.GetValueInt() == 2
			Gameplay_SettingCampingPlaceWeapons_OID = AddToggleOption("$CampfireGameplaySettingShowWeapons", true)
		else
			Gameplay_SettingCampingPlaceWeapons_OID = AddToggleOption("$CampfireGameplaySettingShowWeapons", false)
		endif
		if _Camp_Setting_TakeOff_Shield.GetValueInt() == 2
			Gameplay_SettingCampingPlaceShield_OID = AddToggleOption("$CampfireGameplaySettingShowShield", true)
		else
			Gameplay_SettingCampingPlaceShield_OID = AddToggleOption("$CampfireGameplaySettingShowShield", false)
		endif
		if _Camp_Setting_TakeOff_Ammo.GetValueInt() == 2
			Gameplay_SettingCampingPlaceAmmo_OID = AddToggleOption("$CampfireGameplaySettingShowAmmo", true)
		else
			Gameplay_SettingCampingPlaceAmmo_OID = AddToggleOption("$CampfireGameplaySettingShowAmmo", false)
		endif
		if _Camp_Setting_TakeOff_Helm.GetValueInt() == 2
			Gameplay_SettingCampingPlaceHelm_OID = AddToggleOption("$CampfireGameplaySettingShowHelm", true)
		else
			Gameplay_SettingCampingPlaceHelm_OID = AddToggleOption("$CampfireGameplaySettingShowHelm", false)
		endif
		if _Camp_Setting_TakeOff_Boots.GetValueInt() == 2
			Gameplay_SettingCampingPlaceBoots_OID = AddToggleOption("$CampfireGameplaySettingShowBoots", true)
		else
			Gameplay_SettingCampingPlaceBoots_OID = AddToggleOption("$CampfireGameplaySettingShowBoots", false)
		endif
	else
		Gameplay_SettingCampingPlaceCuirass_OID = AddToggleOption("$CampfireGameplaySettingShowCuirass", false, OPTION_FLAG_DISABLED)
		Gameplay_SettingCampingPlaceGauntlets_OID = AddToggleOption("$CampfireGameplaySettingShowGauntlets", false, OPTION_FLAG_DISABLED)
		Gameplay_SettingCampingPlaceBackpack_OID = AddToggleOption("$CampfireGameplaySettingShowBackpack", false, OPTION_FLAG_DISABLED)
		Gameplay_SettingCampingPlaceWeapons_OID = AddToggleOption("$CampfireGameplaySettingShowWeapons", false, OPTION_FLAG_DISABLED)
		Gameplay_SettingCampingPlaceShield_OID = AddToggleOption("$CampfireGameplaySettingShowShield", false, OPTION_FLAG_DISABLED)
		Gameplay_SettingCampingPlaceAmmo_OID = AddToggleOption("$CampfireGameplaySettingShowAmmo", false, OPTION_FLAG_DISABLED)
		Gameplay_SettingCampingPlaceHelm_OID = AddToggleOption("$CampfireGameplaySettingShowHelm", false, OPTION_FLAG_DISABLED)
		Gameplay_SettingCampingPlaceBoots_OID = AddToggleOption("$CampfireGameplaySettingShowBoots", false, OPTION_FLAG_DISABLED)
	endif

	AddHeaderOption("$CampfireGameplayHeaderFollowerTentDisplay")
	if _Camp_Setting_TrackFollowers.GetValueInt() == 2
		if _Camp_Setting_FollowersUseCampsite.GetValueInt() == 2
			Gameplay_SettingCampingFollowersInteract_OID = AddToggleOption("$CampfireGameplaySettingFollowersInteract", true)
		else
			Gameplay_SettingCampingFollowersInteract_OID = AddToggleOption("$CampfireGameplaySettingFollowersInteract", false)
		endif
		if _Camp_Setting_FollowersRemoveGearInTents.GetValueInt() == 2
			Gameplay_SettingCampingFollowersRemoveGear_OID = AddToggleOption("$CampfireGameplaySettingShowFollowerGear", true)
		else
			Gameplay_SettingCampingFollowersRemoveGear_OID = AddToggleOption("$CampfireGameplaySettingShowFollowerGear", false)
		endif
	else
		Gameplay_SettingCampingFollowersInteract_OID = AddToggleOption("$CampfireGameplaySettingFollowersInteract", false, OPTION_FLAG_DISABLED)		
		Gameplay_SettingCampingFollowersRemoveGear_OID = AddToggleOption("$CampfireGameplaySettingShowFollowerGear", false, OPTION_FLAG_DISABLED)
	endif
endFunction

function PageReset_Instincts()
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("$CampfireInstinctsHeaderDetection")
	if _Camp_Setting_InstinctsFindTinder.GetValueInt() == 2
		Instincts_SettingFindTinder_OID = AddToggleOption("$CampfireInstinctsSettingFindTinder", true)
	else
		Instincts_SettingFindTinder_OID = AddToggleOption("$CampfireInstinctsSettingFindTinder", false)
	endif
	if _Camp_Setting_InstinctsFindFlora.GetValueInt() == 2
		Instincts_SettingFindFlora_OID = AddToggleOption("$CampfireInstinctsSettingFindFlora", true)
	else
		Instincts_SettingFindFlora_OID = AddToggleOption("$CampfireInstinctsSettingFindFlora", false)
	endif
	if _Camp_Setting_InstinctsHearCreatures.GetValueInt() == 2
		Instincts_SettingHearCreatures_OID = AddToggleOption("$CampfireInstinctsSettingHearCreatures", true)
	else
		Instincts_SettingHearCreatures_OID = AddToggleOption("$CampfireInstinctsSettingHearCreatures", false)
	endif
	if _Camp_Setting_InstinctsSmellDead.GetValueInt() == 2
		Instincts_SettingSmellDead_OID = AddToggleOption("$CampfireInstinctsSettingSmellDead", true)
	else
		Instincts_SettingSmellDead_OID = AddToggleOption("$CampfireInstinctsSettingSmellDead", false)
	endif
	if _Camp_Setting_InstinctsSenseObjective.GetValueInt() == 2
		Instincts_SettingSenseObjective_OID = AddToggleOption("$CampfireInstinctsSettingSenseObjective", true)
	else
		Instincts_SettingSenseObjective_OID = AddToggleOption("$CampfireInstinctsSettingSenseObjective", false)
	endif

	SetCursorPosition(1)

	AddHeaderOption("$CampfireInstinctsHeaderEffects")
	if _Camp_Setting_InstinctsVFX.GetValueInt() == 2
		Instincts_SettingVFX_OID = AddToggleOption("$CampfireInstinctsSettingVFX", true)
	else
		Instincts_SettingVFX_OID = AddToggleOption("$CampfireInstinctsSettingVFX", false)
	endif
	if _Camp_Setting_InstinctsSFX.GetValueInt() == 2
		Instincts_SettingSFX_OID = AddToggleOption("$CampfireInstinctsSettingSFX", true)
	else
		Instincts_SettingSFX_OID = AddToggleOption("$CampfireInstinctsSettingSFX", false)
	endif
endFunction

function PageReset_Advanced()
	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("$CampfireAdvancedHeaderPlacement")
	
	if _Camp_Setting_AdvancedPlacement.GetValueInt() == 2
		Advanced_SettingAdvancedPlacement_OID = AddToggleOption("$CampfireAdvancedSettingAdvancedPlacement", true)
	else
		Advanced_SettingAdvancedPlacement_OID = AddToggleOption("$CampfireAdvancedSettingAdvancedPlacement", false)
	endif
	Advanced_SettingMaxThreads_OID = AddSliderOption("$CampfireAdvancedSettingMaxThreads", _Camp_Setting_MaxThreads.GetValueInt(), "{0}")
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddHeaderOption("$CampfireAdvancedHeaderCampingSkill")
	Advanced_CampingSkillRespec_OID = AddTextOption("$CampfireAdvancedCampingSkillRespec", "")
	Advanced_CampingSkillRestore_OID = AddToggleOption("$CampfireAdvancedCampingSkillRestore", false)
	Advanced_CampingSkillRestoreSlider_OID = AddSliderOption("$CampfireAdvancedCampingSkillRestoreAmount", 0, "{0}", OPTION_FLAG_DISABLED)

	SetCursorPosition(1) ; Move cursor to top right position
	AddHeaderOption("$CampfireAdvancedHeaderSystem")
	if _Camp_Setting_TrackFollowers.GetValueInt() == 2
		Advanced_SettingTrackFollowers_OID = AddToggleOption("$CampfireGameplaySettingTrackFollowers", true)
	else
		Advanced_SettingTrackFollowers_OID = AddToggleOption("$CampfireGameplaySettingTrackFollowers", false)
	endif
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddHeaderOption("$CampfireAdvancedHeaderCompatibility")
	if Compatibility.isEOLoaded
		if _Camp_Setting_CompatibilityEO.GetValueInt() == 2
			Advanced_SettingEOCompatibility_OID = AddToggleOption("$CampfireAdvancedSettingEOCompatibility", true)
		else
			Advanced_SettingEOCompatibility_OID = AddToggleOption("$CampfireAdvancedSettingEOCompatibility", false)
		endif
	else
		AddToggleOption("$CampfireAdvancedSettingEOCompatibilityNotInstalled", false, OPTION_FLAG_DISABLED)
	endif

endFunction

function PageReset_SaveLoad()
	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("$CampfireSaveLoadHeaderProfile")
	if Compatibility.isSKSELoaded
		if _Camp_Setting_AutoSaveLoad.GetValueInt() == 2
			SaveLoad_SelectProfile_OID = AddMenuOption("$CampfireSaveLoadCurrentProfile", GetProfileName(_Camp_Setting_CurrentProfile.GetValueInt()))
		else
			SaveLoad_SelectProfile_OID = AddMenuOption("$CampfireSaveLoadCurrentProfile", GetProfileName(_Camp_Setting_CurrentProfile.GetValueInt()), OPTION_FLAG_DISABLED)
		endif
		AddEmptyOption()
		AddEmptyOption()
		AddEmptyOption()
		AddEmptyOption()
		AddEmptyOption()
		AddEmptyOption()
		AddEmptyOption()
		AddEmptyOption()
		SaveLoad_ProfileHelp_OID = AddTextOption("$CampfireSaveLoadAboutProfiles", "")
		if _Camp_Setting_AutoSaveLoad.GetValueInt() == 2
			SaveLoad_Enable_OID = AddToggleOption("$CampfireSaveLoadEnable", true)
		else
			SaveLoad_Enable_OID = AddToggleOption("$CampfireSaveLoadEnable", false)
		endif
	else
		AddTextOption("$CampfireSKSE173Required", "", OPTION_FLAG_DISABLED)
	endif

	SetCursorPosition(1) ; Move cursor to top right position

	AddEmptyOption()
	if Compatibility.isSKSELoaded
		if _Camp_Setting_AutoSaveLoad.GetValueInt() == 2
			SKI_Main skyui = Game.GetFormFromFile(0x00000814, "SkyUI.esp") as SKI_Main
			if !skyui
				skyui = Game.GetFormFromFile(0x00000814, "SkyUI_SE.esp") as SKI_Main
			endif
			int version = skyui.ReqSWFRelease
			if version >= 1026 	; SkyUI 5.1+
				SaveLoad_RenameProfile_OID = AddInputOption("", "$CampfireSaveLoadRenameProfile")
			else
				SaveLoad_RenameProfile_OID = AddTextOption("$CampfireSkyUI51Required", "$CampfireSaveLoadRenameProfile", OPTION_FLAG_DISABLED)
			endif
			SaveLoad_DefaultProfile_OID = AddTextOption("", "$CampfireSaveLoadDefaultProfile")
		endif
	endif
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	if Compatibility.isSKSELoaded && _Camp_Setting_AutoSaveLoad.GetValueInt() == 2
		AddTextOption("$CampfireSaveLoadSettingsSaved", "", OPTION_FLAG_DISABLED)
	endif
endFunction

function PageReset_Help()
	SetCursorFillMode(TOP_TO_BOTTOM)
	
	AddHeaderOption("$CampfireHelpHeaderTroubleshooting")
	Help_TroubleshootingMenu_OID = AddMenuOption("$CampfireHelpTroubleshootingSelectProblem", TroubleshootingList[TroubleshootingIndex])
	
	AddEmptyOption()

	AddHeaderOption("$CampfireHelpHeaderTutorials")
	if _Camp_Setting_EnableTutorials.GetValueInt() == 2
		Help_SettingEnableTutorials_OID = AddToggleOption("$CampfireHelpEnableTutorials", true)
	else
		Help_SettingEnableTutorials_OID = AddToggleOption("$CampfireHelpEnableTutorials", false)
	endif
	Help_ResetTutorials_OID = AddTextOption("", "$CampfireHelpResetTutorials")

	SetCursorPosition(1) ; Move cursor to top right position
	AddHeaderOption("$CampfireGuideHeader")
	Guide_Topic1 = AddTextOption("$CampfireGuideTopic1", "")
	Guide_Topic2 = AddTextOption("$CampfireGuideTopic2", "")
	Guide_Topic3 = AddTextOption("$CampfireGuideTopic3", "")
	Guide_Topic6 = AddTextOption("$CampfireGuideTopic6", "")
	Guide_Topic4 = AddTextOption("$CampfireGuideTopic4", "")
	Guide_Topic5 = AddTextOption("$CampfireGuideTopic5", "")
endFunction

event OnPageReset(string page)
	if page == ""
		LoadCustomContent("campfire/logo.dds")
	else
		UnloadCustomContent()
	endif

	if !Pages || !TroubleshootingList
		OnConfigInit()
	endif
	
	if page == "$CampfireGameplayPage"
		PageReset_Gameplay()
	elseif page == "$CampfireInstinctsPage"
		PageReset_Instincts()
	elseif page == "$CampfireAdvancedPage"
		PageReset_Advanced()
	elseif page == "$CampfireHelpPage"
		PageReset_Help()
	elseif page == "$CampfireSaveLoadPage"
		PageReset_SaveLoad()
	endif
endEvent

event OnOptionHighlight(int option)
	if option == Gameplay_SettingCampingCampfireMode_OID
		SetInfoText("$CampfireOptionHighlightCampfireMode")
	elseif option == Gameplay_SettingCampingArmorTentsText_OID
		SetInfoText("$CampfireOptionHighlightSettingCampingArmorTentsText")
	elseif option == Gameplay_SettingCampingLegalityToggle_OID
		SetInfoText("$CampfireOptionHighlightSettingLegality")
	elseif option == Gameplay_SettingCampingFlammabilityToggle_OID
		SetInfoText("$CampfireOptionHighlightSettingFlammability")

	elseif option == Gameplay_SettingCampingPlaceHelm_OID
		SetInfoText("$CampfireOptionHighlightShowHelm")
	elseif option == Gameplay_SettingCampingPlaceCuirass_OID
		SetInfoText("$CampfireOptionHighlightShowCuirass")
	elseif option == Gameplay_SettingCampingPlaceBoots_OID
		SetInfoText("$CampfireOptionHighlightShowBoots")
	elseif option == Gameplay_SettingCampingPlaceGauntlets_OID
		SetInfoText("$CampfireOptionHighlightShowGauntlets")
	elseif option == Gameplay_SettingCampingPlaceBackpack_OID
		SetInfoText("$CampfireOptionHighlightShowBackpack")
	elseif option == Gameplay_SettingCampingPlaceWeapons_OID
		SetInfoText("$CampfireOptionHighlightShowWeapons")
	elseif option == Gameplay_SettingCampingPlaceShield_OID
		SetInfoText("$CampfireOptionHighlightShowShield")
	elseif option == Gameplay_SettingCampingPlaceAmmo_OID
		SetInfoText("$CampfireOptionHighlightShowAmmo")

	elseif option == Gameplay_SettingCampingFollowersInteract_OID
		SetInfoText("$CampfireOptionHighlightFollowersInteract")
	elseif option == Gameplay_SettingCampingFollowersRemoveGear_OID
		SetInfoText("$CampfireOptionHighlightShowFollowerGear")

	elseif option == Gameplay_HotkeyCreateItem_OID
		SetInfoText("$CampfireOptionHighlightHKCreateItem")
	elseif option == Gameplay_HotkeyBuildCampfire_OID
		SetInfoText("$CampfireOptionHighlightHKBuildCampfire")
	elseif option == Gameplay_HotkeyHarvestWood_OID
		SetInfoText("$CampfireOptionHighlightHKHarvestWood")
	elseif option == Gameplay_HotkeyInstincts_OID
		SetInfoText("$CampfireOptionHighlightHKInstincts")

	elseif option == Instincts_SettingFindTinder_OID
		SetInfoText("$CampfireOptionHighlightFindTinder")
	elseif option == Instincts_SettingFindFlora_OID
		SetInfoText("$CampfireOptionHighlightFindFlora")
	elseif option == Instincts_SettingHearCreatures_OID
		SetInfoText("$CampfireOptionHighlightHearCreatures")
	elseif option == Instincts_SettingSmellDead_OID
		SetInfoText("$CampfireOptionHighlightSmellDead")
	elseif option == Instincts_SettingSenseObjective_OID
		SetInfoText("$CampfireOptionHighlightSenseObjective")
	elseif option == Instincts_SettingVFX_OID
		SetInfoText("$CampfireOptionHighlightVFX")
	elseif option == Instincts_SettingSFX_OID
		SetInfoText("$CampfireOptionHighlightSFX")

	elseif option == Advanced_SettingAdvancedPlacement_OID
		SetInfoText("$CampfireOptionHighlightAdvancedPlacement")
	elseif option == Advanced_SettingMaxThreads_OID
		SetInfoText("$CampfireOptionHighlightSettingMaxThreads")
	elseif option == Advanced_SettingTrackFollowers_OID
		SetInfoText("$CampfireOptionHighlightSettingTrackFollowers")
	elseif option == Advanced_SettingEOCompatibility_OID
		SetInfoText("$CampfireOptionHighlightSettingEOCompatibility")
	elseif option == Advanced_CampingSkillRespec_OID
		SetInfoText("$CampfireOptionHighlightSettingRespec")
	elseif option == Advanced_CampingSkillRestore_OID
		SetInfoText("$CampfireOptionHighlightSettingRestore")

	elseif option == Help_SettingEnableTutorials_OID
		SetInfoText("$CampfireOptionHighlightSettingTutorials")
	elseif option == Help_ResetTutorials_OID
		SetInfoText("$CampfireOptionHighlightSettingResetTutorials")

	elseif option == SaveLoad_SelectProfile_OID
		SetInfoText("$CampfireOptionHighlightSettingSelectProfile")
	elseif option == SaveLoad_RenameProfile_OID
		SetInfoText("$CampfireOptionHighlightSettingRenameProfile")
	elseif option == SaveLoad_DefaultProfile_OID
		SetInfoText("$CampfireOptionHighlightSettingDefaultProfile")
	elseif option == SaveLoad_Enable_OID
		SetInfoText("$CampfireOptionHighlightSettingEnableSaveLoad")
	endif
endEvent

event OnOptionSelect(int option)
	if option == Gameplay_SettingCampingArmorTentsText_OID
		OnOptionSelectAction(_Camp_Setting_CampingArmorTakeOff, Gameplay_SettingCampingArmorTentsText_OID, "tent_remove_player_equipment")
		ForcePageReset()
	elseif option == Gameplay_SettingCampingLegalityToggle_OID
		OnOptionSelectAction(_Camp_Setting_Legality, Gameplay_SettingCampingLegalityToggle_OID, "camping_illegal_in_towns")
	elseif option == Gameplay_SettingCampingFlammabilityToggle_OID
		OnOptionSelectAction(_Camp_Setting_EquipmentFlammable, Gameplay_SettingCampingFlammabilityToggle_OID, "camping_gear_flammable")
	elseif option == Gameplay_SettingCampingPlaceHelm_OID
		OnOptionSelectAction(_Camp_Setting_TakeOff_Helm, Gameplay_SettingCampingPlaceHelm_OID, "tent_remove_player_helm")
	elseif option == Gameplay_SettingCampingPlaceCuirass_OID
		OnOptionSelectAction(_Camp_Setting_TakeOff_Cuirass, Gameplay_SettingCampingPlaceCuirass_OID, "tent_remove_player_cuirass")
	elseif option == Gameplay_SettingCampingPlaceGauntlets_OID
		OnOptionSelectAction(_Camp_Setting_TakeOff_Gauntlets, Gameplay_SettingCampingPlaceGauntlets_OID, "tent_remove_player_gauntlets")
	elseif option == Gameplay_SettingCampingPlaceBoots_OID
		OnOptionSelectAction(_Camp_Setting_TakeOff_Boots, Gameplay_SettingCampingPlaceBoots_OID, "tent_remove_player_boots")
	elseif option == Gameplay_SettingCampingPlaceShield_OID
		OnOptionSelectAction(_Camp_Setting_TakeOff_Shield, Gameplay_SettingCampingPlaceShield_OID, "tent_remove_player_shield")
	elseif option == Gameplay_SettingCampingPlaceWeapons_OID
		OnOptionSelectAction(_Camp_Setting_TakeOff_Weapons, Gameplay_SettingCampingPlaceWeapons_OID, "tent_remove_player_weapons")
	elseif option == Gameplay_SettingCampingPlaceAmmo_OID
		OnOptionSelectAction(_Camp_Setting_TakeOff_Ammo, Gameplay_SettingCampingPlaceAmmo_OID, "tent_remove_player_ammo")
	elseif option == Gameplay_SettingCampingPlaceBackpack_OID
		OnOptionSelectAction(_Camp_Setting_TakeOff_Backpack, Gameplay_SettingCampingPlaceBackpack_OID, "tent_remove_player_backpack")
	elseif option == Gameplay_SettingCampingFollowersInteract_OID
		OnOptionSelectAction(_Camp_Setting_FollowersUseCampsite, Gameplay_SettingCampingFollowersInteract_OID, "followers_use_campsite")
	elseif option == Gameplay_SettingCampingFollowersRemoveGear_OID
		OnOptionSelectAction(_Camp_Setting_FollowersRemoveGearInTents, Gameplay_SettingCampingFollowersRemoveGear_OID, "tent_remove_follower_equipment")
	elseif option == Instincts_SettingFindTinder_OID
		OnOptionSelectAction(_Camp_Setting_InstinctsFindTinder, Instincts_SettingFindTinder_OID, "instincts_find_tinder")
	elseif option == Instincts_SettingFindFlora_OID
		OnOptionSelectAction(_Camp_Setting_InstinctsFindFlora, Instincts_SettingFindFlora_OID, "instincts_find_flora")
	elseif option == Instincts_SettingHearCreatures_OID
		OnOptionSelectAction(_Camp_Setting_InstinctsHearCreatures, Instincts_SettingHearCreatures_OID, "instincts_hear_creatures")
	elseif option == Instincts_SettingSmellDead_OID
		OnOptionSelectAction(_Camp_Setting_InstinctsSmellDead, Instincts_SettingSmellDead_OID, "instincts_smell_dead")
	elseif option == Instincts_SettingSenseObjective_OID
		OnOptionSelectAction(_Camp_Setting_InstinctsSenseObjective, Instincts_SettingSenseObjective_OID, "instincts_sense_objective")
	elseif option == Instincts_SettingVFX_OID
		OnOptionSelectAction(_Camp_Setting_InstinctsVFX, Instincts_SettingVFX_OID, "instincts_vfx")
	elseif option == Instincts_SettingSFX_OID
		OnOptionSelectAction(_Camp_Setting_InstinctsSFX, Instincts_SettingSFX_OID, "instincts_sfx")
	elseif option == Advanced_SettingAdvancedPlacement_OID
		OnOptionSelectAction(_Camp_Setting_AdvancedPlacement, Advanced_SettingAdvancedPlacement_OID, "advanced_placement_mode")
	elseif option == Help_SettingEnableTutorials_OID
		OnOptionSelectAction(_Camp_Setting_EnableTutorials, Help_SettingEnableTutorials_OID, "enable_tutorials")
	elseif option == Help_ResetTutorials_OID
		bool b = ShowMessage("$CampfireTutorialResetPrompt")
		if b
			ShowMessage("$CampfireTutorialResetDone", false)
			ResetTutorials()
		endif
	elseif option == Advanced_SettingEOCompatibility_OID
		if _Camp_Setting_CompatibilityEO.GetValueInt() == 2
			_Camp_Setting_CompatibilityEO.SetValueInt(1)
			SetToggleOptionValue(Advanced_SettingEOCompatibility_OID, false)
		else
			bool b = ShowMessage("$CampfireEOCompatibilityDetailPrompt")
			if b
				_Camp_Setting_CompatibilityEO.SetValueInt(2)
				SetToggleOptionValue(Advanced_SettingEOCompatibility_OID, true)
			endif
		endif
		SaveSettingToCurrentProfile("eo_compatibility", _Camp_Setting_CompatibilityEO.GetValueInt())
	elseif option == Advanced_CampingSkillRestore_OID
		bool b = ShowMessage("$CampfireAdvancedCampingSkillRestoreConfirm")
		if b
			ShowMessage("$CampfireAdvancedCampingSkillRestoreSelect")
			SetToggleOptionValue(Advanced_CampingSkillRestore_OID, true, true)
			SetOptionFlags(Advanced_CampingSkillRestoreSlider_OID, OPTION_FLAG_NONE)
		endif
	elseif option == Advanced_CampingSkillRespec_OID
		bool b = ShowMessage("$CampfireAdvancedCampingSkillRespecConfirm")
		if b
			RefundCampingSkillPoints()
			ShowMessage("$CampfireAdvancedCampingSkillRestoreDone", false)
		endif
	elseif option == Advanced_SettingTrackFollowers_OID
		if _Camp_Setting_TrackFollowers.GetValueInt() == 2
			_Camp_Setting_TrackFollowers.SetValueInt(1)
			SetToggleOptionValue(Advanced_SettingTrackFollowers_OID, false)
			PlayerRef.RemoveSpell(_Camp_FollowerDetectSpell)
			Follower1.Clear()
			Follower2.Clear()
			Follower3.Clear()
			Animal.Clear()
		else
			_Camp_Setting_TrackFollowers.SetValueInt(2)
			SetToggleOptionValue(Advanced_SettingTrackFollowers_OID, true)
			PlayerRef.AddSpell(_Camp_FollowerDetectSpell, false)
		endif
		SaveSettingToCurrentProfile("follower_tracking", _Camp_Setting_TrackFollowers.GetValueInt())
	elseif option == SaveLoad_Enable_OID
		if _Camp_Setting_AutoSaveLoad.GetValueInt() == 2
			_Camp_Setting_AutoSaveLoad.SetValueInt(1)
			SetToggleOptionValue(SaveLoad_Enable_OID, false)
			JsonUtil.SetIntValue(CONFIG_PATH + "common", "auto_load", 1)
			JsonUtil.Save(CONFIG_PATH + "common")
		elseif _Camp_Setting_AutoSaveLoad.GetValueInt() == 1
			_Camp_Setting_AutoSaveLoad.SetValueInt(2)
			SetToggleOptionValue(SaveLoad_Enable_OID, true)
			JsonUtil.SetIntValue(CONFIG_PATH + "common", "auto_load", 2)
			JsonUtil.Save(CONFIG_PATH + "common")
			SaveAllSettings(_Camp_Setting_CurrentProfile.GetValueInt())
		endIf
		ForcePageReset()
	elseif option == SaveLoad_DefaultProfile_OID
		bool b = ShowMessage("$CampfireSaveLoadDefaultProfileConfirm")
		if b
			GenerateDefaultProfile(_Camp_Setting_CurrentProfile.GetValueInt())
			SwitchToProfile(_Camp_Setting_CurrentProfile.GetValueInt())
			ForcePageReset()
			ForcePageReset()
		endif
	endif

	if option == Guide_Topic1
		ShowGuideTopic1()
	elseif option == Guide_Topic2
		ShowGuideTopic2()
	elseif option == Guide_Topic3
		ShowGuideTopic3()
	elseif option == Guide_Topic4
		ShowGuideTopic4()
	elseif option == Guide_Topic5
		ShowGuideTopic5()
	elseif option == Guide_Topic6
		ShowGuideTopic6()
	elseif option == SaveLoad_ProfileHelp_OID
		ShowProfileHelp()
	endif
endEvent

function OnOptionSelectAction(GlobalVariable akSettingsGlobal, int aiOID, string asProfileSetting)
	if akSettingsGlobal.GetValueInt() == 2
		akSettingsGlobal.SetValueInt(1)
		SetToggleOptionValue(aiOID, false)
	else
		akSettingsGlobal.SetValueInt(2)
		SetToggleOptionValue(aiOID, true)
	endif
	SaveSettingToCurrentProfile(asProfileSetting, akSettingsGlobal.GetValueInt())
endFunction

event OnOptionDefault(int option)
	if option == Gameplay_SettingCampingCampfireMode_OID
		SetMenuOptionValue(Gameplay_SettingCampingCampfireMode_OID, CampfireModeList[1])
		_Camp_Setting_CampfireMode.SetValueInt(1)
		SaveSettingToCurrentProfile("campfire_mode", _Camp_Setting_CampfireMode.GetValueInt())
	elseif option == Gameplay_SettingCampingArmorTentsText_OID
		_Camp_Setting_CampingArmorTakeOff.SetValue(2)
		SetToggleOptionValue(Gameplay_SettingCampingArmorTentsText_OID, true)
		ForcePageReset()
		SaveSettingToCurrentProfile("tent_remove_player_equipment", _Camp_Setting_CampingArmorTakeOff.GetValueInt())
	elseif option == Gameplay_SettingCampingLegalityToggle_OID
		_Camp_Setting_Legality.SetValueInt(2)
		SetToggleOptionValue(Gameplay_SettingCampingLegalityToggle_OID, true)
		SaveSettingToCurrentProfile("camping_illegal_in_towns", _Camp_Setting_Legality.GetValueInt())
	elseif option == Gameplay_SettingCampingFlammabilityToggle_OID
		_Camp_Setting_EquipmentFlammable.SetValueInt(2)
		SetToggleOptionValue(Gameplay_SettingCampingFlammabilityToggle_OID, true)
		SaveSettingToCurrentProfile("camping_gear_flammable", _Camp_Setting_EquipmentFlammable.GetValueInt())
	elseif option == Gameplay_SettingCampingPlaceCuirass_OID
		_Camp_Setting_TakeOff_Cuirass.SetValueInt(1)
		SetToggleOptionValue(Gameplay_SettingCampingPlaceCuirass_OID, false)
		SaveSettingToCurrentProfile("tent_remove_player_cuirass", _Camp_Setting_TakeOff_Cuirass.GetValueInt())
	elseif option == Gameplay_SettingCampingPlaceHelm_OID
		_Camp_Setting_TakeOff_Helm.SetValueInt(2)
		SetToggleOptionValue(Gameplay_SettingCampingPlaceHelm_OID, true)
		SaveSettingToCurrentProfile("tent_remove_player_helm", _Camp_Setting_TakeOff_Helm.GetValueInt())
	elseif option == Gameplay_SettingCampingPlaceGauntlets_OID
		_Camp_Setting_TakeOff_Gauntlets.SetValueInt(2)
		SetToggleOptionValue(Gameplay_SettingCampingPlaceGauntlets_OID, true)
		SaveSettingToCurrentProfile("tent_remove_player_gauntlets", _Camp_Setting_TakeOff_Gauntlets.GetValueInt())
	elseif option == Gameplay_SettingCampingPlaceBoots_OID
		_Camp_Setting_TakeOff_Boots.SetValueInt(2)
		SetToggleOptionValue(Gameplay_SettingCampingPlaceBoots_OID, true)
		SaveSettingToCurrentProfile("tent_remove_player_boots", _Camp_Setting_TakeOff_Boots.GetValueInt())
	elseif option == Gameplay_SettingCampingPlaceShield_OID
		_Camp_Setting_TakeOff_Shield.SetValueInt(2)
		SetToggleOptionValue(Gameplay_SettingCampingPlaceShield_OID, true)
		SaveSettingToCurrentProfile("tent_remove_player_shield", _Camp_Setting_TakeOff_Shield.GetValueInt())
	elseif option == Gameplay_SettingCampingPlaceWeapons_OID
		_Camp_Setting_TakeOff_Weapons.SetValueInt(2)
		SetToggleOptionValue(Gameplay_SettingCampingPlaceWeapons_OID, true)
		SaveSettingToCurrentProfile("tent_remove_player_weapons", _Camp_Setting_TakeOff_Weapons.GetValueInt())
	elseif option == Gameplay_SettingCampingPlaceAmmo_OID
		_Camp_Setting_TakeOff_Ammo.SetValueInt(2)
		SetToggleOptionValue(Gameplay_SettingCampingPlaceAmmo_OID, true)
		SaveSettingToCurrentProfile("tent_remove_player_ammo", _Camp_Setting_TakeOff_Ammo.GetValueInt())
	elseif option == Gameplay_SettingCampingPlaceBackpack_OID
		_Camp_Setting_TakeOff_Backpack.SetValueInt(2)
		SetToggleOptionValue(Gameplay_SettingCampingPlaceBackpack_OID, true)
		SaveSettingToCurrentProfile("tent_remove_player_backpack", _Camp_Setting_TakeOff_Backpack.GetValueInt())
	elseif option == Gameplay_SettingCampingFollowersInteract_OID
		_Camp_Setting_FollowersUseCampsite.SetValueInt(2)
		SetToggleOptionValue(Gameplay_SettingCampingFollowersInteract_OID, true)
		SaveSettingToCurrentProfile("followers_use_campsite", _Camp_Setting_FollowersUseCampsite.GetValueInt())
	elseif option == Gameplay_SettingCampingFollowersRemoveGear_OID
		_Camp_Setting_FollowersRemoveGearInTents.SetValueInt(2)
		SetToggleOptionValue(Gameplay_SettingCampingFollowersRemoveGear_OID, true)
		SaveSettingToCurrentProfile("tent_remove_follower_equipment", _Camp_Setting_FollowersRemoveGearInTents.GetValueInt())
	elseif option == Instincts_SettingFindTinder_OID
		_Camp_Setting_InstinctsFindTinder.SetValueInt(2)
		SetToggleOptionValue(Instincts_SettingFindTinder_OID, true)
		SaveSettingToCurrentProfile("instincts_find_tinder", _Camp_Setting_InstinctsFindTinder.GetValueInt())
	elseif option == Instincts_SettingFindFlora_OID
		_Camp_Setting_InstinctsFindFlora.SetValueInt(2)
		SetToggleOptionValue(Instincts_SettingFindFlora_OID, true)
		SaveSettingToCurrentProfile("instincts_find_flora", _Camp_Setting_InstinctsFindFlora.GetValueInt())
	elseif option == Instincts_SettingHearCreatures_OID
		_Camp_Setting_InstinctsHearCreatures.SetValueInt(2)
		SetToggleOptionValue(Instincts_SettingHearCreatures_OID, true)
		SaveSettingToCurrentProfile("instincts_hear_creatures", _Camp_Setting_InstinctsHearCreatures.GetValueInt())
	elseif option == Instincts_SettingSmellDead_OID
		_Camp_Setting_InstinctsSmellDead.SetValueInt(2)
		SetToggleOptionValue(Instincts_SettingSmellDead_OID, true)
		SaveSettingToCurrentProfile("instincts_smell_dead", _Camp_Setting_InstinctsSmellDead.GetValueInt())
	elseif option == Instincts_SettingSenseObjective_OID
		_Camp_Setting_InstinctsSenseObjective.SetValueInt(1)
		SetToggleOptionValue(Instincts_SettingSenseObjective_OID, false)
		SaveSettingToCurrentProfile("instincts_sense_objective", _Camp_Setting_InstinctsSenseObjective.GetValueInt())
	elseif option == Instincts_SettingVFX_OID
		_Camp_Setting_InstinctsVFX.SetValueInt(2)
		SetToggleOptionValue(Instincts_SettingVFX_OID, true)
		SaveSettingToCurrentProfile("instincts_vfx", _Camp_Setting_InstinctsVFX.GetValueInt())
	elseif option == Instincts_SettingSFX_OID
		_Camp_Setting_InstinctsSFX.SetValueInt(2)
		SetToggleOptionValue(Instincts_SettingSFX_OID, true)
		SaveSettingToCurrentProfile("instincts_sfx", _Camp_Setting_InstinctsSFX.GetValueInt())
	elseif option == Advanced_SettingAdvancedPlacement_OID
		_Camp_Setting_AdvancedPlacement.SetValueInt(2)
		SetToggleOptionValue(Advanced_SettingAdvancedPlacement_OID, true)
		SaveSettingToCurrentProfile("advanced_placement_mode", _Camp_Setting_AdvancedPlacement.GetValueInt())
	elseif option == Advanced_SettingMaxThreads_OID
		_Camp_Setting_MaxThreads.SetValueInt(DEFAULT_THREADS as Int)
		SetSliderOptionValue(Advanced_SettingMaxThreads_OID, DEFAULT_THREADS, "{0}")
		SaveSettingToCurrentProfile("max_placement_threads", _Camp_Setting_MaxThreads.GetValueInt())
	elseif option == Advanced_SettingTrackFollowers_OID
		_Camp_Setting_TrackFollowers.SetValueInt(2)
		PlayerRef.AddSpell(_Camp_FollowerDetectSpell, false)
		SetToggleOptionValue(Advanced_SettingTrackFollowers_OID, true)
		SaveSettingToCurrentProfile("follower_tracking", _Camp_Setting_TrackFollowers.GetValueInt())
	elseif option == Advanced_SettingEOCompatibility_OID
		_Camp_Setting_CompatibilityEO.SetValueInt(1)
		SetToggleOptionValue(Advanced_SettingEOCompatibility_OID, false)
	elseif option == Help_SettingEnableTutorials_OID
		_Camp_Setting_EnableTutorials.SetValueInt(2)
		SaveSettingToCurrentProfile("enable_tutorials", _Camp_Setting_EnableTutorials.GetValueInt())
	endif
	if option == Gameplay_HotkeyCreateItem_OID
		UnregisterForKey(_Camp_HotkeyCreateItem.GetValueInt())
		_Camp_HotkeyCreateItem.SetValue(0)
		ForcePageReset()
		Game.GetPlayer().AddSpell(_Camp_CreateItemSpell, false)
		SaveSettingToCurrentProfile("hotkey_create_item", 0)
	elseif option == Gameplay_HotkeyBuildCampfire_OID
		UnregisterForKey(_Camp_HotkeyBuildCampfire.GetValueInt())
		_Camp_HotkeyBuildCampfire.SetValue(0)
		ForcePageReset()
		Game.GetPlayer().AddSpell(_Camp_CampfireSpell, false)
		SaveSettingToCurrentProfile("hotkey_build_campfire", 0)
	elseif option == Gameplay_HotkeyHarvestWood_OID
		UnregisterForKey(_Camp_HotkeyHarvestWood.GetValueInt())
		_Camp_HotkeyHarvestWood.SetValue(0)
		ForcePageReset()
		Game.GetPlayer().AddSpell(_Camp_HarvestWoodSpell, false)
		SaveSettingToCurrentProfile("hotkey_harvest_wood", 0)
	elseif option == Gameplay_HotkeyInstincts_OID
		UnregisterForKey(_Camp_HotkeyInstincts.GetValueInt())
		_Camp_HotkeyInstincts.SetValue(0)
		ForcePageReset()
		Game.GetPlayer().AddSpell(_Camp_SurvivalVisionPower, false)
		SaveSettingToCurrentProfile("hotkey_instincts", 0)
	endif
endEvent

event OnOptionMenuOpen(int option)
	if option == Gameplay_SettingCampingCampfireMode_OID
		SetMenuDialogOptions(CampfireModeList)
		SetMenuDialogStartIndex(0)
		SetMenuDialogDefaultIndex(0)
	endif

	if option == Help_TroubleshootingMenu_OID
		SetMenuDialogOptions(TroubleshootingList)
		SetMenuDialogStartIndex(TroubleshootingIndex)
		SetMenuDialogDefaultIndex(0)
	endif

	if option == SaveLoad_SelectProfile_OID
		string[] profile_list = new string[10]
		int i = 0
		while i < 10
			string pname = GetProfileName(i + 1)
			profile_list[i] = pname
			i += 1
		endWhile
		SetMenuDialogOptions(profile_list)
		SetMenuDialogStartIndex(_Camp_Setting_CurrentProfile.GetValueInt() - 1)
		SetMenuDialogDefaultIndex(0)
	endif
endEvent

event OnOptionMenuAccept(int option, int index)
	if option == Gameplay_SettingCampingCampfireMode_OID
		SetMenuOptionValue(Gameplay_SettingCampingCampfireMode_OID, CampfireModeList[index])
		_Camp_Setting_CampfireMode.SetValueInt(index)
		SaveSettingToCurrentProfile("campfire_mode", _Camp_Setting_CampfireMode.GetValueInt())
	elseif option == Help_TroubleshootingMenu_OID
		if index == 0
			;do nothing
		elseif index == 1
			bool bChoice = ShowMessage("$CampfireTroubleshooterPrompt")
			if bChoice
				TroubleshootingPlacement()
			endif
		endif
	elseif option == SaveLoad_SelectProfile_OID
		bool b = ShowMessage("$CampfireSaveLoadConfirm")
		if b
			SwitchToProfile(index + 1)
		endif
	endif
endEvent

event OnOptionSliderOpen(int option)
	if option == Advanced_SettingMaxThreads_OID
		SetSliderDialogStartValue(_Camp_Setting_MaxThreads.GetValueInt())
		SetSliderDialogDefaultValue(DEFAULT_THREADS)
		SetSliderDialogRange(MIN_THREADS, MAX_THREADS)
		SetSliderDialogInterval(1.0)
	elseif option == Advanced_CampingSkillRestoreSlider_OID
		SetSliderDialogStartValue(0.0)
		SetSliderDialogDefaultValue(0.0)
		SetSliderDialogRange(0, CampingPerkPointsTotal.GetValue())
		SetSliderDialogInterval(1.0)
	endif
endEvent

event OnOptionSliderAccept(int option, float value)
	if option == Advanced_SettingMaxThreads_OID
		_Camp_Setting_MaxThreads.SetValueInt(value as Int)
		SetSliderOptionValue(Advanced_SettingMaxThreads_OID, value, "{0}")
		SaveSettingToCurrentProfile("max_placement_threads", _Camp_Setting_MaxThreads.GetValueInt())
	elseif option == Advanced_CampingSkillRestoreSlider_OID
		CampingPerkPointProgress.SetValue(0.0)
		CampingPerkPoints.SetValue(value)
		CampingPerkPointsEarned.SetValue(value)
		ClearCampingPerks()
		ShowMessage("$CampfireAdvancedCampingSkillRestoreDone", false)
		SetOptionFlags(Advanced_CampingSkillRestoreSlider_OID, OPTION_FLAG_DISABLED, true)
		SetToggleOptionValue(Advanced_CampingSkillRestore_OID, false)
	endif
endEvent

event OnOptionInputOpen(int option)
	if option == SaveLoad_RenameProfile_OID
		SetInputDialogStartText(GetProfileName(_Camp_Setting_CurrentProfile.GetValueInt()))
	endif
endEvent

event OnOptionInputAccept(int option, string str)
	if option == SaveLoad_RenameProfile_OID
		if str != ""
			string profile_path = CONFIG_PATH + "profile" + _Camp_Setting_CurrentProfile.GetValueInt()
			JsonUtil.SetStringValue(profile_path, "profile_name", str)
			JsonUtil.Save(profile_path)
			ForcePageReset()
		else
			ShowMessage("$CampfireSaveLoadRenameErrorBlank", false)
		endif
	endif
endEvent

event OnOptionKeyMapChange(int option, int keyCode, string conflictControl, string conflictName)
	bool success
	if option == Gameplay_HotkeyBuildCampfire_OID
		success = RemapHotkey(option, keyCode, conflictControl, conflictName, _Camp_HotkeyBuildCampfire, _Camp_CampfireSpell)
		if success
			SaveSettingToCurrentProfile("hotkey_build_campfire", keyCode)
		endif
	elseif option == Gameplay_HotkeyCreateItem_OID
		success = RemapHotkey(option, keyCode, conflictControl, conflictName, _Camp_HotkeyCreateItem, _Camp_CreateItemSpell)
		if success
			SaveSettingToCurrentProfile("hotkey_create_item", keyCode)
		endif
	elseif option == Gameplay_HotkeyHarvestWood_OID
		success = RemapHotkey(option, keyCode, conflictControl, conflictName, _Camp_HotkeyHarvestWood, _Camp_HarvestWoodSpell)
		if success
			SaveSettingToCurrentProfile("hotkey_harvest_wood", keyCode)
		endif
	elseif option == Gameplay_HotkeyInstincts_OID
		success = RemapHotkey(option, keyCode, conflictControl, conflictName, _Camp_HotkeyInstincts, _Camp_SurvivalVisionPower)
		if success
			SaveSettingToCurrentProfile("hotkey_instincts", keyCode)
		endif
	endif
endEvent

bool function RemapHotkey(int option, int keyCode, string conflictControl, string conflictName, GlobalVariable akHotkeyGlobal, Spell akHotkeySpell)
	_Camp_Strings cs = GetCampfireStrings()
	if conflictControl != ""
		if conflictName != ""
			; "This key is already bound to " + conflictControl + " in " + conflictName + ". Undesirable behavior may occur; use with caution, or assign to a different control."
			bool b = ShowMessage(cs.HotkeyConflict1 + conflictControl + cs.HotkeyConflict2 + conflictName + cs.HotkeyConflict3_mod)
			if b
				akHotkeyGlobal.SetValueInt(keyCode)
				RegisterForKey(akHotkeyGlobal.GetValueInt())
				ForcePageReset()
				Game.GetPlayer().RemoveSpell(akHotkeySpell)
				return true
			endif
		else
			; "This key is already bound to " + conflictControl + " in Skyrim. Please select a different key."
			ShowMessage(cs.HotkeyConflict1 + conflictControl + cs.HotkeyConflict3_game, a_withCancel = false)
			return false
		endif
	else
		akHotkeyGlobal.SetValueInt(keyCode)
		RegisterForKey(akHotkeyGlobal.GetValueInt())
		ForcePageReset()
		Game.GetPlayer().RemoveSpell(akHotkeySpell)
		return true
	endif
endFunction

Event OnKeyDown(int KeyCode)
	if UI.IsMenuOpen("Console") || \
		UI.IsMenuOpen("Book Menu") || \
		UI.IsMenuOpen("BarterMenu") || \
		UI.IsMenuOpen("ContainerMenu") || \
		UI.IsMenuOpen("Crafting Menu") || \
		UI.IsMenuOpen("Dialogue Menu") || \
		UI.IsMenuOpen("FavoritesMenu") || \
		UI.IsMenuOpen("InventoryMenu") || \
		UI.IsMenuOpen("Journal Menu") || \
		UI.IsMenuOpen("Lockpicking Menu") || \
		UI.IsMenuOpen("MagicMenu") || \
		UI.IsMenuOpen("MapMenu") || \
		UI.IsMenuOpen("MessageBoxMenu") || \
		UI.IsMenuOpen("Sleep/Wait Menu") || \
		UI.IsMenuOpen("StatsMenu") || \
		UI.IsMenuOpen("UITextEntryMenu")
		return
	endif
	if KeyCode == _Camp_HotkeyCreateItem.GetValueInt()
		_Camp_CreateItemSpell.Cast(PlayerRef)
	elseif KeyCode == _Camp_HotkeyBuildCampfire.GetValueInt()
		_Camp_CampfireSpell.Cast(PlayerRef)
	elseif KeyCode == _Camp_HotkeyHarvestWood.GetValueInt()
		_Camp_HarvestWoodSpell.Cast(PlayerRef)
	elseif KeyCode == _Camp_HotkeyInstincts.GetValueInt()
		_Camp_SurvivalVisionPower.Cast(PlayerRef)
	endif
endEvent
	
string function GetCustomControl(int keyCode)
	_Camp_Strings cs = GetCampfireStrings()
	if (keyCode == _Camp_HotkeyCreateItem.GetValueInt())
		return cs.HotkeyDescription_CreateItem
	elseif (keyCode == _Camp_HotkeyBuildCampfire.GetValueInt())
		return cs.HotkeyDescription_BuildCampfire
	elseif (keyCode == _Camp_HotkeyHarvestWood.GetValueInt())
		return cs.HotkeyDescription_HarvestWood
	elseif (keyCode == _Camp_HotkeyInstincts.GetValueInt())
		return cs.HotkeyDescription_Instincts
	else
		return ""
	endIf
endFunction

function ShowGuideTopic1()
	ShowMessage("$CampfireGuideTopic1Text", false)
endfunction
function ShowGuideTopic2()
	ShowMessage("$CampfireGuideTopic2Text", false)
endfunction
function ShowGuideTopic3()
	ShowMessage("$CampfireGuideTopic3Text", false)
endfunction
function ShowGuideTopic4()
	ShowMessage("$CampfireGuideTopic4Text", false)
endfunction
function ShowGuideTopic5()
	ShowMessage("$CampfireGuideTopic5Text", false)
endFunction
function ShowGuideTopic6()
	ShowMessage("$CampfireGuideTopic6Text", false)
	ShowMessage("$CampfireGuideTopic6TextCont", false)
endFunction
function ShowProfileHelp()
	ShowMessage("$CampfireSaveLoadTopic", false)
	ShowMessage("$CampfireSaveLoadTopicCont", false)
	ShowMessage("$CampfireSaveLoadTopicCont2", false)
endFunction

function TroubleshootingPlacement()
	utility.wait(1)
	_Camp_CurrentlyPlacingObject.SetValue(1)
	_Camp_TroubleshootingConfirmMsg.Show()
endFunction

; @TODO: Don't duplicate registration with LoadProfileOnStartup()
function RegisterForKeysOnLoad()
	if _Camp_HotkeyCreateItem.GetValueInt() != 0
		RegisterForKey(_Camp_HotkeyCreateItem.GetValueInt())
	endIf
	if _Camp_HotkeyBuildCampfire.GetValueInt() != 0
		RegisterForKey(_Camp_HotkeyBuildCampfire.GetValueInt())
	endIf
	if _Camp_HotkeyHarvestWood.GetValueInt() != 0
		RegisterForKey(_Camp_HotkeyHarvestWood.GetValueInt())
	endIf
	if _Camp_HotkeyInstincts.GetValueInt() != 0
		RegisterForKey(_Camp_HotkeyInstincts.GetValueInt())
	endif
endFunction

string function GetProfileName(int aiProfileIndex)
	;bool b = JsonUtil.Load(CONFIG_PATH + "profile" + aiProfileIndex)
	return JsonUtil.GetStringValue(CONFIG_PATH + "profile" + aiProfileIndex, "profile_name", missing = "Profile " + aiProfileIndex)
endFunction

function SetProfileName(int aiProfileIndex, string asProfileName)
	JsonUtil.SetStringValue(CONFIG_PATH + "profile" + aiProfileIndex, "profile_name", asProfileName)
endFunction

function SaveSettingToCurrentProfile(string asKeyName, int aiValue)
	if _Camp_Setting_AutoSaveLoad.GetValueInt() == 2
		int current_profile_index = _Camp_Setting_CurrentProfile.GetValueInt()
		JsonUtil.SetIntValue(CONFIG_PATH + "profile" + current_profile_index, asKeyName, aiValue)
		JsonUtil.Save(CONFIG_PATH + "profile" + current_profile_index)
	endif
endFunction

int function LoadSettingFromProfile(int aiProfileIndex, string asKeyName)
	return JsonUtil.GetIntValue(CONFIG_PATH + "profile" + aiProfileIndex, asKeyName, -1)
endFunction

function LoadProfileOnStartup()
	int auto_load = JsonUtil.GetIntValue(CONFIG_PATH + "common", "auto_load", 0)
	if auto_load == 2
		_Camp_Setting_AutoSaveLoad.SetValueInt(2)
		int last_profile = JsonUtil.GetIntValue(CONFIG_PATH + "common", "last_profile", 0)
		if last_profile != 0
			_Camp_Setting_CurrentProfile.SetValueInt(last_profile)
			SwitchToProfile(last_profile)
		else
			; default to Profile 1 and write the file
			_Camp_Setting_CurrentProfile.SetValueInt(1)
			JsonUtil.SetIntValue(CONFIG_PATH + "common", "last_profile", 1)
			JsonUtil.Save(CONFIG_PATH + "common")
			SwitchToProfile(1)
		endif
	elseif auto_load == 1
		_Camp_Setting_AutoSaveLoad.SetValueInt(1)
	elseif auto_load == 0
		; The file or setting does not exist, create it and default to auto-loading.
		; default to Profile 1 and write the file
		_Camp_Setting_AutoSaveLoad.SetValueInt(2)
		_Camp_Setting_CurrentProfile.SetValueInt(1)
		JsonUtil.SetIntValue(CONFIG_PATH + "common", "auto_load", 2)
		JsonUtil.SetIntValue(CONFIG_PATH + "common", "last_profile", 1)
		JsonUtil.Save(CONFIG_PATH + "common")

		; Test reading to the newly saved file. If we can't read from it, STOP.
		int test = JsonUtil.GetIntValue(CONFIG_PATH + "common", "auto_load", 0)
		if test != 2
			return
		else
			SwitchToProfile(1)
		endif
	endif
endFunction

function SwitchToProfile(int aiProfileIndex)
	_Camp_Setting_CurrentProfile.SetValueInt(aiProfileIndex)
	JsonUtil.SetIntValue(CONFIG_PATH + "common", "last_profile", aiProfileIndex)
	JsonUtil.Save(CONFIG_PATH + "common")

	string pname = JsonUtil.GetStringValue(CONFIG_PATH + "profile" + aiProfileIndex, "profile_name", "")
	if pname == ""
		GenerateDefaultProfile(aiProfileIndex)
	endif
	CleanProfile(aiProfileIndex)

	int val = LoadSettingFromProfile(aiProfileIndex, "camping_gear_flammable")
	if val != -1
		_Camp_Setting_EquipmentFlammable.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "campfire_mode")
	if val != -1
		_Camp_Setting_CampfireMode.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "tent_remove_player_equipment")
	if val != -1
		_Camp_Setting_CampingArmorTakeOff.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "tent_remove_player_cuirass")
	if val != -1
		_Camp_Setting_TakeOff_Cuirass.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "tent_remove_player_helm")
	if val != -1
		_Camp_Setting_TakeOff_Helm.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "tent_remove_player_gauntlets")
	if val != -1
		_Camp_Setting_TakeOff_Gauntlets.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "tent_remove_player_boots")
	if val != -1
		_Camp_Setting_TakeOff_Boots.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "tent_remove_player_backpack")
	if val != -1
		_Camp_Setting_TakeOff_Backpack.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "tent_remove_player_weapons")
	if val != -1
		_Camp_Setting_TakeOff_Weapons.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "tent_remove_player_shield")
	if val != -1
		_Camp_Setting_TakeOff_Shield.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "tent_remove_player_ammo")
	if val != -1
		_Camp_Setting_TakeOff_Ammo.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "tent_remove_follower_equipment")
	if val != -1
		_Camp_Setting_FollowersRemoveGearInTents.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "follower_tracking")
	if val != -1
		_Camp_Setting_TrackFollowers.SetValueInt(val)
		if val == 2
			PlayerRef.AddSpell(_Camp_FollowerDetectSpell, false)
		else
			PlayerRef.RemoveSpell(_Camp_FollowerDetectSpell)
			Follower1.Clear()
			Follower2.Clear()
			Follower3.Clear()
			Animal.Clear()
		endif
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "followers_use_campsite")
	if val != -1
		_Camp_Setting_FollowersUseCampsite.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "camping_illegal_in_towns")
	if val != -1
		_Camp_Setting_Legality.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "instincts_find_tinder")
	if val != -1
		_Camp_Setting_InstinctsFindTinder.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "instincts_find_flora")
	if val != -1
		_Camp_Setting_InstinctsFindFlora.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "instincts_hear_creatures")
	if val != -1
		_Camp_Setting_InstinctsHearCreatures.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "instincts_smell_dead")
	if val != -1
		_Camp_Setting_InstinctsSmellDead.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "instincts_sense_objective")
	if val != -1
		_Camp_Setting_InstinctsSenseObjective.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "instincts_vfx")
	if val != -1
		_Camp_Setting_InstinctsVFX.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "instincts_sfx")
	if val != -1
		_Camp_Setting_InstinctsSFX.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "advanced_placement_mode")
	if val != -1
		_Camp_Setting_AdvancedPlacement.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "max_placement_threads")
	if val != -1
		_Camp_Setting_MaxThreads.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "eo_compatibility")
	if val != -1
		_Camp_Setting_CompatibilityEO.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "enable_tutorials")
	if val != -1
		_Camp_Setting_EnableTutorials.SetValueInt(val)
	endif

	val = LoadSettingFromProfile(aiProfileIndex, "hotkey_create_item")
	if val != -1 && val != 0
		RegisterForKey(val)
		_Camp_HotkeyCreateItem.SetValueInt(val)
		PlayerRef.RemoveSpell(_Camp_CreateItemSpell)
	else
		UnregisterForKey(_Camp_HotkeyCreateItem.GetValueInt())
		_Camp_HotkeyCreateItem.SetValue(0)
		PlayerRef.AddSpell(_Camp_CreateItemSpell, false)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "hotkey_build_campfire")
	if val != -1 && val != 0
		RegisterForKey(val)
		_Camp_HotkeyBuildCampfire.SetValueInt(val)
		PlayerRef.RemoveSpell(_Camp_CampfireSpell)
	else
		UnregisterForKey(_Camp_HotkeyBuildCampfire.GetValueInt())
		_Camp_HotkeyBuildCampfire.SetValue(0)
		PlayerRef.AddSpell(_Camp_CampfireSpell, false)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "hotkey_harvest_wood")
	if val != -1 && val != 0
		RegisterForKey(val)
		_Camp_HotkeyHarvestWood.SetValueInt(val)
		PlayerRef.RemoveSpell(_Camp_HarvestWoodSpell)
	else
		UnregisterForKey(_Camp_HotkeyHarvestWood.GetValueInt())
		_Camp_HotkeyHarvestWood.SetValue(0)
		PlayerRef.AddSpell(_Camp_HarvestWoodSpell, false)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "hotkey_instincts")
	if val != -1 && val != 0
		RegisterForKey(val)
		_Camp_HotkeyInstincts.SetValueInt(val)
		PlayerRef.RemoveSpell(_Camp_SurvivalVisionPower)
	else
		UnregisterForKey(_Camp_HotkeyInstincts.GetValueInt())
		_Camp_HotkeyInstincts.SetValue(0)
		ForcePageReset()
		PlayerRef.AddSpell(_Camp_SurvivalVisionPower, false)
	endif
endFunction

function GenerateDefaultProfile(int aiProfileIndex)
	string profile_path = CONFIG_PATH + "profile" + aiProfileIndex
	JsonUtil.SetStringValue(profile_path, "profile_name", "Profile " + aiProfileIndex)
	JsonUtil.SetIntValue(profile_path, "camping_gear_flammable", 2)
	JsonUtil.SetIntValue(profile_path, "campfire_mode", 2)
	JsonUtil.SetIntValue(profile_path, "tent_remove_player_equipment", 2)
	JsonUtil.SetIntValue(profile_path, "tent_remove_player_cuirass", 1)
	JsonUtil.SetIntValue(profile_path, "tent_remove_player_helm", 2)
	JsonUtil.SetIntValue(profile_path, "tent_remove_player_gauntlets", 2)
	JsonUtil.SetIntValue(profile_path, "tent_remove_player_boots", 2)
	JsonUtil.SetIntValue(profile_path, "tent_remove_player_backpack", 2)
	JsonUtil.SetIntValue(profile_path, "tent_remove_player_weapons", 2)
	JsonUtil.SetIntValue(profile_path, "tent_remove_player_shield", 2)
	JsonUtil.SetIntValue(profile_path, "tent_remove_player_ammo", 2)
	JsonUtil.SetIntValue(profile_path, "tent_remove_follower_equipment", 2)
	JsonUtil.SetIntValue(profile_path, "follower_tracking", 2)
	JsonUtil.SetIntValue(profile_path, "followers_use_campsite", 2)
	JsonUtil.SetIntValue(profile_path, "camping_illegal_in_towns", 2)
	JsonUtil.SetIntValue(profile_path, "instincts_find_tinder", 2)
	JsonUtil.SetIntValue(profile_path, "instincts_find_flora", 2)
	JsonUtil.SetIntValue(profile_path, "instincts_hear_creatures", 2)
	JsonUtil.SetIntValue(profile_path, "instincts_smell_dead", 2)
	JsonUtil.SetIntValue(profile_path, "instincts_sense_objective", 1)
	JsonUtil.SetIntValue(profile_path, "instincts_vfx", 2)
	JsonUtil.SetIntValue(profile_path, "instincts_sfx", 2)
	JsonUtil.SetIntValue(profile_path, "advanced_placement_mode", 2)
	JsonUtil.SetIntValue(profile_path, "max_placement_threads", 20)
	JsonUtil.SetIntValue(profile_path, "eo_compatibility", 1)
	JsonUtil.SetIntValue(profile_path, "enable_tutorials", 2)
	JsonUtil.SetIntValue(profile_path, "hotkey_create_item", 0)
	JsonUtil.SetIntValue(profile_path, "hotkey_build_campfire", 0)
	JsonUtil.SetIntValue(profile_path, "hotkey_harvest_wood", 0)
	JsonUtil.SetIntValue(profile_path, "hotkey_instincts", 0)
	JsonUtil.Save(profile_path)
endFunction

function SaveAllSettings(int aiProfileIndex)
	string profile_path = CONFIG_PATH + "profile" + aiProfileIndex
	JsonUtil.SetIntValue(profile_path, "camping_gear_flammable", _Camp_Setting_EquipmentFlammable.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "campfire_mode", _Camp_Setting_CampfireMode.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "tent_remove_player_equipment", _Camp_Setting_CampingArmorTakeOff.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "tent_remove_player_cuirass", _Camp_Setting_TakeOff_Cuirass.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "tent_remove_player_helm", _Camp_Setting_TakeOff_Helm.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "tent_remove_player_gauntlets", _Camp_Setting_TakeOff_Gauntlets.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "tent_remove_player_boots", _Camp_Setting_TakeOff_Boots.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "tent_remove_player_backpack", _Camp_Setting_TakeOff_Backpack.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "tent_remove_player_weapons", _Camp_Setting_TakeOff_Weapons.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "tent_remove_player_shield", _Camp_Setting_TakeOff_Shield.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "tent_remove_player_ammo", _Camp_Setting_TakeOff_Ammo.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "tent_remove_follower_equipment", _Camp_Setting_FollowersRemoveGearInTents.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "follower_tracking", _Camp_Setting_TrackFollowers.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "followers_use_campsite", _Camp_Setting_FollowersUseCampsite.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "camping_illegal_in_towns", _Camp_Setting_Legality.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "instincts_find_tinder", _Camp_Setting_InstinctsFindTinder.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "instincts_find_flora", _Camp_Setting_InstinctsFindFlora.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "instincts_hear_creatures", _Camp_Setting_InstinctsHearCreatures.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "instincts_smell_dead", _Camp_Setting_InstinctsSmellDead.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "instincts_sense_objective", _Camp_Setting_InstinctsSenseObjective.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "instincts_vfx", _Camp_Setting_InstinctsVFX.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "instincts_sfx", _Camp_Setting_InstinctsSFX.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "advanced_placement_mode", _Camp_Setting_AdvancedPlacement.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "max_placement_threads", _Camp_Setting_MaxThreads.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "eo_compatibility", _Camp_Setting_CompatibilityEO.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "enable_tutorials", _Camp_Setting_EnableTutorials.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "hotkey_create_item", _Camp_HotkeyCreateItem.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "hotkey_build_campfire", _Camp_HotkeyBuildCampfire.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "hotkey_harvest_wood", _Camp_HotkeyHarvestWood.GetValueInt())
	JsonUtil.SetIntValue(profile_path, "hotkey_instincts", _Camp_HotkeyInstincts.GetValueInt())
	JsonUtil.Save(profile_path)
endFunction

function CleanProfile(int aiProfileIndex)
	string profile_path = CONFIG_PATH + "profile" + aiProfileIndex

	bool result
	result = JsonUtil.UnsetIntValue(profile_path, "manual_fire_lighting")
	JsonUtil.Save(profile_path)
endFunction

function ClearCampingPerks()
	_Camp_PerkRank_Resourceful.SetValueInt(0)
	_Camp_PerkRank_Trailblazer.SetValueInt(0)
	_Camp_PerkRank_Firecraft.SetValueInt(0)
	_Camp_PerkRank_KeenSenses.SetValueInt(0)
	_Camp_PerkRank_HighSpirits.SetValueInt(0)
endFunction

function RefundCampingSkillPoints()
	ClearCampingPerks()
	CampingPerkPoints.SetValueInt(CampingPerkPointsEarned.GetValueInt())
	CampingPerkPointProgress.SetValue(0.0)
endFunction

function ResetTutorials()
	_Camp_Tutorial_FireBuilding1_Displayed.SetValueInt(1)
	_Camp_Tutorial_FireBuilding2_Displayed.SetValueInt(1)
	_Camp_Tutorial_FireBuilding3_Displayed.SetValueInt(1)
	_Camp_Tutorial_FireBuilding4_Displayed.SetValueInt(1)
	_Camp_Tutorial_FireBuilding5_Displayed.SetValueInt(1)
	_Camp_Tutorial_SkillSystem1_Displayed.SetValueInt(1)
    _Camp_Tutorial_SkillSystem2_Displayed.SetValueInt(1)
    _Camp_Tutorial_SkillSystem3_Displayed.SetValueInt(1)
endFunction

GlobalVariable property _Camp_Setting_ManualFireLighting auto
{This setting is deprecated as of Campfire 1.6.}