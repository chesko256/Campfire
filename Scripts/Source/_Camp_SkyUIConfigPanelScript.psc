Scriptname _Camp_SkyUIConfigPanelScript extends SKI_ConfigBase

import _CampInternal

string CONFIG_PATH = "../CampfireData/"

; External scripts
_Camp_Compatibility property Compatibility auto

GlobalVariable property _Camp_Setting_ManualFireLighting auto
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
GlobalVariable property _Camp_Setting_AutoSaveLoad auto
GlobalVariable property _Camp_Setting_CurrentProfile auto
GlobalVariable property _Camp_CurrentlyPlacingObject auto
GlobalVariable property _Camp_HotkeyCreateItem auto
GlobalVariable property _Camp_HotkeyBuildCampfire auto
GlobalVariable property _Camp_HotkeyHarvestWood auto
GlobalVariable property _Camp_HotkeyInstincts auto

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
int TroubleshootingIndex = 0

int Gameplay_SettingCampingLegalityToggle_OID
int Gameplay_SettingCampingArmorTentsText_OID
int Gameplay_SettingCampingFireLightingText_OID
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

int Advanced_SettingAdvancedPlacement_OID
int Advanced_SettingMaxThreads_OID
int Advanced_SettingTrackFollowers_OID

int Help_TroubleshootingMenu_OID
int Guide_Topic1
int Guide_Topic2
int Guide_Topic3
int Guide_Topic4
int Guide_Topic5
int Guide_Topic6

int SaveLoad_SelectProfile_OID
int SaveLoad_RenameProfile_OID
int SaveLoad_ProfileHelp_OID
int SaveLoad_Enable_OID

float DEFAULT_THREADS = 20.0
float MIN_THREADS = 0.0
float MAX_THREADS = 30.0

Event OnConfigInit()
	Pages = new string[4]
	Pages[0] = "$CampfireGameplayPage"
	Pages[1] = "$CampfireAdvancedPage"
	Pages[2] = "$CampfireHelpPage"
	Pages[3] = "$CampfireSaveLoadPage"
	
	TroubleshootingList = new string[2]
	TroubleshootingList[0] = "$CampfireTroubleshooting0"
	TroubleshootingList[1] = "$CampfireTroubleshooting1"
endEvent

function PageReset_Gameplay()
	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("$CampfireGameplayHeaderCamping")
	
	if _Camp_Setting_CampingArmorTakeOff.GetValueInt() == 2
		Gameplay_SettingCampingArmorTentsText_OID = AddToggleOption("$CampfireGameplaySettingCampingRemoveGear", true)
	else
		Gameplay_SettingCampingArmorTentsText_OID = AddToggleOption("$CampfireGameplaySettingCampingRemoveGear", false)
	endif
	
	if _Camp_Setting_ManualFireLighting.GetValueInt() == 2
		Gameplay_SettingCampingFireLightingText_OID = AddToggleOption("$CampfireGameplaySettingCampingLightingMode", true)
	else
		Gameplay_SettingCampingFireLightingText_OID = AddToggleOption("$CampfireGameplaySettingCampingLightingMode", false)
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
	
	AddHeaderOption("$CampfireGameplayHeaderHotkeys")
	Gameplay_HotkeyCreateItem_OID = AddKeyMapOption("$CampfireGameplayHotkeyCreateItem", _Camp_HotkeyCreateItem.GetValueInt())
	Gameplay_HotkeyBuildCampfire_OID = AddKeyMapOption("$CampfireGameplayHotkeyBuildCampfire", _Camp_HotkeyBuildCampfire.GetValueInt())
	Gameplay_HotkeyHarvestWood_OID = AddKeyMapOption("$CampfireGameplayHotkeyHarvestWood", _Camp_HotkeyHarvestWood.GetValueInt())
	Gameplay_HotkeyInstincts_OID = AddKeyMapOption("$CampfireGameplayHotkeyInstincts", _Camp_HotkeyInstincts.GetValueInt())
	
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

function PageReset_Advanced()
	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("$CampfireAdvancedHeaderPlacement")
	
	if _Camp_Setting_AdvancedPlacement.GetValueInt() == 2
		Advanced_SettingAdvancedPlacement_OID = AddToggleOption("$CampfireAdvancedSettingAdvancedPlacement", true)
	else
		Advanced_SettingAdvancedPlacement_OID = AddToggleOption("$CampfireAdvancedSettingAdvancedPlacement", false)
	endif
	Advanced_SettingMaxThreads_OID = AddSliderOption("$CampfireAdvancedSettingMaxThreads", _Camp_Setting_MaxThreads.GetValueInt(), "{0}")
	
	SetCursorPosition(1) ; Move cursor to top right position
	AddHeaderOption("$CampfireAdvancedHeaderSystem")
	if _Camp_Setting_TrackFollowers.GetValueInt() == 2
		Advanced_SettingTrackFollowers_OID = AddToggleOption("$CampfireGameplaySettingTrackFollowers", true)
	else
		Advanced_SettingTrackFollowers_OID = AddToggleOption("$CampfireGameplaySettingTrackFollowers", false)
	endif
endFunction

function PageReset_SaveLoad()
	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("$CampfireSaveLoadHeaderProfile")
	SaveLoad_SelectProfile_OID = AddMenuOption("$CampfireSaveLoadCurrentProfile", GetProfileName(_Camp_Setting_CurrentProfile.GetValueInt()))
	if GetVersion() >= 4
		SaveLoad_RenameProfile_OID = AddInputOption("test", "$CampfireSaveLoadRenameProfile")
	else
		SaveLoad_RenameProfile_OID = AddTextOption("SkyUI 5.1+ Required", "$CampfireSaveLoadRenameProfile", OPTION_FLAG_DISABLED)
	endif
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
endFunction

function PageReset_Help()
	SetCursorFillMode(TOP_TO_BOTTOM)
	
	AddHeaderOption("$CampfireHelpHeaderTroubleshooting")

	Help_TroubleshootingMenu_OID = AddMenuOption("$CampfireHelpTroubleshootingSelectProblem", TroubleshootingList[TroubleshootingIndex])
	
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
	elseif page == "$CampfireAdvancedPage"
		PageReset_Advanced()
	elseif page == "$CampfireHelpPage"
		PageReset_Help()
	endif
endEvent

event OnOptionHighlight(int option)
	if option == Gameplay_SettingCampingArmorTentsText_OID
		SetInfoText("$CampfireOptionHighlightSettingCampingArmorTentsText")
	elseif option == Gameplay_SettingCampingFireLightingText_OID
		SetInfoText("$CampfireOptionHighlightSettingCampingFireLightingText")
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

	elseif option == Advanced_SettingAdvancedPlacement_OID
		SetInfoText("$CampfireOptionHighlightAdvancedPlacement")
	elseif option == Advanced_SettingMaxThreads_OID
		SetInfoText("$CampfireOptionHighlightSettingMaxThreads")
	elseif option == Advanced_SettingTrackFollowers_OID
		SetInfoText("$CampfireOptionHighlightSettingTrackFollowers")
	endif
endEvent

event OnOptionSelect(int option)
	if option == Gameplay_SettingCampingArmorTentsText_OID
		if _Camp_Setting_CampingArmorTakeOff.GetValueInt() == 2
			_Camp_Setting_CampingArmorTakeOff.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingArmorTentsText_OID, false)
			ForcePageReset()
		else
			_Camp_Setting_CampingArmorTakeOff.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingArmorTentsText_OID, true)
			ForcePageReset()
		endif
		SaveSettingToCurrentProfile("tent_remove_player_equipment", _Camp_Setting_CampingArmorTakeOff.GetValueInt())
	elseif option == Gameplay_SettingCampingFireLightingText_OID
		if _Camp_Setting_ManualFireLighting.GetValueInt() == 2
			_Camp_Setting_ManualFireLighting.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingFireLightingText_OID, false)
		else
			_Camp_Setting_ManualFireLighting.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingFireLightingText_OID, true)
		endif
		SaveSettingToCurrentProfile("manual_fire_lighting", _Camp_Setting_ManualFireLighting.GetValueInt())
	elseif option == Gameplay_SettingCampingLegalityToggle_OID
		if _Camp_Setting_Legality.GetValueInt() == 2
			_Camp_Setting_Legality.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingLegalityToggle_OID, false)
		else
			_Camp_Setting_Legality.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingLegalityToggle_OID, true)
		endif
		SaveSettingToCurrentProfile("camping_illegal_in_towns", _Camp_Setting_Legality.GetValueInt())
	elseif option == Gameplay_SettingCampingFlammabilityToggle_OID
		if _Camp_Setting_EquipmentFlammable.GetValueInt() == 2
			_Camp_Setting_EquipmentFlammable.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingFlammabilityToggle_OID, false)
		else
			_Camp_Setting_EquipmentFlammable.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingFlammabilityToggle_OID, true)
		endif
		SaveSettingToCurrentProfile("CampingGearFlammable", _Camp_Setting_EquipmentFlammable.GetValueInt())
	elseif option == Gameplay_SettingCampingPlaceHelm_OID
		if _Camp_Setting_TakeOff_Helm.GetValueInt() == 2
			_Camp_Setting_TakeOff_Helm.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceHelm_OID, false)
		else
			_Camp_Setting_TakeOff_Helm.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceHelm_OID, true)
		endif
		SaveSettingToCurrentProfile("tent_remove_player_helm", _Camp_Setting_TakeOff_Helm.GetValueInt())
	elseif option == Gameplay_SettingCampingPlaceCuirass_OID
		if _Camp_Setting_TakeOff_Cuirass.GetValueInt() == 2
			_Camp_Setting_TakeOff_Cuirass.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceCuirass_OID, false)
		else
			_Camp_Setting_TakeOff_Cuirass.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceCuirass_OID, true)
		endif
		SaveSettingToCurrentProfile("tent_remove_player_cuirass", _Camp_Setting_TakeOff_Cuirass.GetValueInt())
	elseif option == Gameplay_SettingCampingPlaceGauntlets_OID
		if _Camp_Setting_TakeOff_Gauntlets.GetValueInt() == 2
			_Camp_Setting_TakeOff_Gauntlets.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceGauntlets_OID, false)
		else
			_Camp_Setting_TakeOff_Gauntlets.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceGauntlets_OID, true)
		endif
		SaveSettingToCurrentProfile("tent_remove_player_gauntlets", _Camp_Setting_TakeOff_Gauntlets.GetValueInt())
	elseif option == Gameplay_SettingCampingPlaceBoots_OID
		if _Camp_Setting_TakeOff_Boots.GetValueInt() == 2
			_Camp_Setting_TakeOff_Boots.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceBoots_OID, false)
		else
			_Camp_Setting_TakeOff_Boots.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceBoots_OID, true)
		endif
		SaveSettingToCurrentProfile("tent_remove_player_boots", _Camp_Setting_TakeOff_Boots.GetValueInt())
	elseif option == Gameplay_SettingCampingPlaceShield_OID
		if _Camp_Setting_TakeOff_Shield.GetValueInt() == 2
			_Camp_Setting_TakeOff_Shield.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceShield_OID, false)
		else
			_Camp_Setting_TakeOff_Shield.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceShield_OID, true)
		endif
		SaveSettingToCurrentProfile("tent_remove_player_shield", _Camp_Setting_TakeOff_Shield.GetValueInt())
	elseif option == Gameplay_SettingCampingPlaceWeapons_OID
		if _Camp_Setting_TakeOff_Weapons.GetValueInt() == 2
			_Camp_Setting_TakeOff_Weapons.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceWeapons_OID, false)
		else
			_Camp_Setting_TakeOff_Weapons.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceWeapons_OID, true)
		endif
		SaveSettingToCurrentProfile("tent_remove_player_weapons", _Camp_Setting_TakeOff_Weapons.GetValueInt())
	elseif option == Gameplay_SettingCampingPlaceAmmo_OID
		if _Camp_Setting_TakeOff_Ammo.GetValueInt() == 2
			_Camp_Setting_TakeOff_Ammo.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceAmmo_OID, false)
		else
			_Camp_Setting_TakeOff_Ammo.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceAmmo_OID, true)
		endif
		SaveSettingToCurrentProfile("tent_remove_player_ammo", _Camp_Setting_TakeOff_Ammo.GetValueInt())
	elseif option == Gameplay_SettingCampingPlaceBackpack_OID
		if _Camp_Setting_TakeOff_Backpack.GetValueInt() == 2
			_Camp_Setting_TakeOff_Backpack.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceBackpack_OID, false)
		else
			_Camp_Setting_TakeOff_Backpack.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceBackpack_OID, true)
		endif
		SaveSettingToCurrentProfile("tent_remove_player_backpack", _Camp_Setting_TakeOff_Backpack.GetValueInt())
	elseif option == Gameplay_SettingCampingFollowersInteract_OID
		if _Camp_Setting_FollowersUseCampsite.GetValueInt() == 2
			_Camp_Setting_FollowersUseCampsite.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingFollowersInteract_OID, false)
		else
			_Camp_Setting_FollowersUseCampsite.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingFollowersInteract_OID, true)
		endif
		SaveSettingToCurrentProfile("followers_use_campsite", _Camp_Setting_FollowersUseCampsite.GetValueInt())
	elseif option == Gameplay_SettingCampingFollowersRemoveGear_OID
		if _Camp_Setting_FollowersRemoveGearInTents.GetValueInt() == 2
			_Camp_Setting_FollowersRemoveGearInTents.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingFollowersRemoveGear_OID, false)
		else
			_Camp_Setting_FollowersRemoveGearInTents.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingFollowersRemoveGear_OID, true)
		endif
		SaveSettingToCurrentProfile("tent_remove_follower_equipment", _Camp_Setting_FollowersRemoveGearInTents.GetValueInt())
	elseif option == Advanced_SettingAdvancedPlacement_OID
		if _Camp_Setting_AdvancedPlacement.GetValueInt() == 2
			_Camp_Setting_AdvancedPlacement.SetValueInt(1)
			SetToggleOptionValue(Advanced_SettingAdvancedPlacement_OID, false)
		else
			_Camp_Setting_AdvancedPlacement.SetValueInt(2)
			SetToggleOptionValue(Advanced_SettingAdvancedPlacement_OID, true)
		endif
		SaveSettingToCurrentProfile("advanced_placement_mode", _Camp_Setting_AdvancedPlacement.GetValueInt())
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
	endif
endEvent

event OnOptionDefault(int option)
	if option == Gameplay_SettingCampingArmorTentsText_OID
		_Camp_Setting_CampingArmorTakeOff.SetValue(2)
		SetToggleOptionValue(Gameplay_SettingCampingArmorTentsText_OID, true)
		ForcePageReset()
		SaveSettingToCurrentProfile("tent_remove_player_equipment", _Camp_Setting_CampingArmorTakeOff.GetValueInt())
	elseif option == Gameplay_SettingCampingFireLightingText_OID
		_Camp_Setting_ManualFireLighting.SetValue(1)
		SetToggleOptionValue(Gameplay_SettingCampingFireLightingText_OID, false)
		SaveSettingToCurrentProfile("manual_fire_lighting", _Camp_Setting_ManualFireLighting.GetValueInt())
	elseif option == Gameplay_SettingCampingLegalityToggle_OID
		_Camp_Setting_Legality.SetValueInt(2)
		SetToggleOptionValue(Gameplay_SettingCampingLegalityToggle_OID, true)
		SaveSettingToCurrentProfile("camping_illegal_in_towns", _Camp_Setting_Legality.GetValueInt())
	elseif option == Gameplay_SettingCampingFlammabilityToggle_OID
		_Camp_Setting_EquipmentFlammable.SetValueInt(2)
		SetToggleOptionValue(Gameplay_SettingCampingFlammabilityToggle_OID, true)
		SaveSettingToCurrentProfile("CampingGearFlammable", _Camp_Setting_EquipmentFlammable.GetValueInt())
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
	if option == Help_TroubleshootingMenu_OID
		SetMenuDialogOptions(TroubleshootingList)
		SetMenuDialogStartIndex(TroubleshootingIndex)
		SetMenuDialogDefaultIndex(0)
	endif
endEvent

event OnOptionMenuAccept(int option, int index)
	if option == Help_TroubleshootingMenu_OID
		if index == 0
			;do nothing
		elseif index == 1
			bool bChoice = ShowMessage("$CampfireTroubleshooterPrompt")
			if bChoice
				TroubleshootingPlacement()
			endif
		endif
	endif
endEvent

event OnOptionSliderOpen(int option)
	if option == Advanced_SettingMaxThreads_OID
		SetSliderDialogStartValue(_Camp_Setting_MaxThreads.GetValueInt())
		SetSliderDialogDefaultValue(DEFAULT_THREADS)
		SetSliderDialogRange(MIN_THREADS, MAX_THREADS)
		SetSliderDialogInterval(1.0)
	endif
endEvent

event OnOptionSliderAccept(int option, float value)
	if option == Advanced_SettingMaxThreads_OID
		_Camp_Setting_MaxThreads.SetValueInt(value as Int)
		SetSliderOptionValue(Advanced_SettingMaxThreads_OID, value, "{0}")
		SaveSettingToCurrentProfile("max_placement_threads", _Camp_Setting_MaxThreads.GetValueInt())
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
	if UI.IsMenuOpen("Console") || UI.IsMenuOpen("Book Menu") || UI.IsMenuOpen("BarterMenu") || UI.IsMenuOpen("ContainerMenu") || UI.IsMenuOpen("CraftingMenu") || UI.IsMenuOpen("Dialogue Menu") || UI.IsMenuOpen("FavoritesMenu") || UI.IsMenuOpen("InventoryMenu") || UI.IsMenuOpen("Journal Menu") || UI.IsMenuOpen("Lockpicking Menu") || UI.IsMenuOpen("MagicMenu") || UI.IsMenuOpen("MapMenu") || UI.IsMenuOpen("MessageBoxMenu") || UI.IsMenuOpen("Sleep/Wait Menu") || UI.IsMenuOpen("StatsMenu")
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
	int current_profile_index = _Camp_Setting_CurrentProfile.GetValueInt()
	JsonUtil.SetIntValue(CONFIG_PATH + "profile" + current_profile_index, asKeyName, aiValue)
	JsonUtil.Save(CONFIG_PATH + "profile" + current_profile_index)
endFunction

int function LoadSettingFromProfile(int aiProfileIndex, string asKeyName)
	return JsonUtil.GetIntValue(CONFIG_PATH + "profile" + aiProfileIndex, asKeyName, -1)
endFunction

function LoadProfileOnStartup()
	int auto_load = JsonUtil.GetIntValue(CONFIG_PATH + "common", "auto_load", 0)
	if auto_load == 2
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
	; elseif auto_load == 1, pass (auto_load off)
	elseif auto_load == 0
		; The file or setting does not exist, create it and default to auto-loading.
		; default to Profile 1 and write the file
		_Camp_Setting_AutoSaveLoad.SetValueInt(2)
		_Camp_Setting_CurrentProfile.SetValueInt(1)
		JsonUtil.SetIntValue(CONFIG_PATH + "common", "auto_load", 2)
		JsonUtil.SetIntValue(CONFIG_PATH + "common", "last_profile", 1)
		JsonUtil.Save(CONFIG_PATH + "common")
		SwitchToProfile(1)
	endif
endFunction

function SwitchToProfile(int aiProfileIndex)
	_Camp_Setting_CurrentProfile.SetValueInt(aiProfileIndex)
	JsonUtil.SetIntValue(CONFIG_PATH + "common", "last_profile", aiProfileIndex)
	JsonUtil.Save(CONFIG_PATH + "common")

	int val = LoadSettingFromProfile(aiProfileIndex, "manual_fire_lighting")
	if val != -1
		_Camp_Setting_ManualFireLighting.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "CampingGearFlammable")
	if val != -1
		_Camp_Setting_EquipmentFlammable.SetValueInt(val)
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
	val = LoadSettingFromProfile(aiProfileIndex, "advanced_placement_mode")
	if val != -1
		_Camp_Setting_AdvancedPlacement.SetValueInt(val)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "max_placement_threads")
	if val != -1
		_Camp_Setting_MaxThreads.SetValueInt(val)
	endif

	val = LoadSettingFromProfile(aiProfileIndex, "hotkey_create_item")
	if val != -1 && val != 0
		RegisterForKey(_Camp_HotkeyCreateItem.GetValueInt())
		PlayerRef.RemoveSpell(_Camp_CreateItemSpell)
	else
		UnregisterForKey(_Camp_HotkeyCreateItem.GetValueInt())
		_Camp_HotkeyCreateItem.SetValue(0)
		PlayerRef.AddSpell(_Camp_CreateItemSpell, false)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "hotkey_build_campfire")
	if val != -1 && val != 0
		RegisterForKey(_Camp_HotkeyBuildCampfire.GetValueInt())
		PlayerRef.RemoveSpell(_Camp_CampfireSpell)
	else
		UnregisterForKey(_Camp_HotkeyBuildCampfire.GetValueInt())
		_Camp_HotkeyBuildCampfire.SetValue(0)
		PlayerRef.AddSpell(_Camp_CampfireSpell, false)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "hotkey_harvest_wood")
	if val != -1 && val != 0
		RegisterForKey(_Camp_HotkeyHarvestWood.GetValueInt())
		PlayerRef.RemoveSpell(_Camp_HarvestWoodSpell)
	else
		UnregisterForKey(_Camp_HotkeyHarvestWood.GetValueInt())
		_Camp_HotkeyHarvestWood.SetValue(0)
		PlayerRef.AddSpell(_Camp_HarvestWoodSpell, false)
	endif
	val = LoadSettingFromProfile(aiProfileIndex, "hotkey_instincts")
	if val != -1 && val != 0
		RegisterForKey(_Camp_HotkeyInstincts.GetValueInt())
		PlayerRef.RemoveSpell(_Camp_SurvivalVisionPower)
	else
		UnregisterForKey(_Camp_HotkeyInstincts.GetValueInt())
		_Camp_HotkeyInstincts.SetValue(0)
		ForcePageReset()
		PlayerRef.AddSpell(_Camp_SurvivalVisionPower, false)
	endif
endFunction