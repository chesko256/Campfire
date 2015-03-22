Scriptname _Camp_SkyUIConfigPanelScript extends SKI_ConfigBase

; External scripts
_Camp_Compatibility property Compatibility auto
GlobalVariable property _DE_Setting_Lighting auto
GlobalVariable property _Camp_HelpDone_TentActivate auto
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
GlobalVariable property _Camp_Setting_MaxThreads auto
GlobalVariable property _Camp_Setting_EquipTentOutfit auto
GlobalVariable property _DE_Setting_WoodCinematic auto
GlobalVariable property _Camp_Setting_Legality auto
GlobalVariable property _DE_HelpDone_Visualize auto
GlobalVariable property _DE_HelpDone_PlacementError auto
GlobalVariable property _DE_Setting_Help auto
GlobalVariable property _Camp_Setting_AdvancedPlacement auto
GlobalVariable property _DE_SKSEVersion auto
GlobalVariable property _Camp_CurrentlyPlacingObject auto
GlobalVariable property _Camp_HotkeyCreateItem auto
GlobalVariable property _Camp_HotkeyBuildCampfire auto
GlobalVariable property _Camp_HotkeyHarvestWood auto
Spell property _Camp_CreateItemSpell auto
Spell property _Camp_CampfireSpell auto
Spell property _Camp_HarvestWoodSpell auto
Message property _Camp_TroubleshootingConfirmMsg auto

; Toggle states
bool bPresetChange = false

string[] TroubleshootingList
int TroubleshootingIndex = 0

int Gameplay_SettingCampingArmorTentsText_OID
int Gameplay_SettingCampingFireLightingText_OID
int Gameplay_SettingCampingPlacementVisualizationText_OID

int Gameplay_SettingCampingPlaceHelm_OID
int Gameplay_SettingCampingPlaceCuirass_OID
int Gameplay_SettingCampingPlaceBoots_OID
int Gameplay_SettingCampingPlaceGauntlets_OID
int Gameplay_SettingCampingPlaceBackpack_OID
int Gameplay_SettingCampingPlaceWeapons_OID
int Gameplay_SettingCampingPlaceShield_OID
int Gameplay_SettingCampingPlaceAmmo_OID

int Advanced_SettingTrackFollowers_OID
int Advanced_SettingMaxThreads_OID

int Visuals_SettingWoodCinematicToggle_OID
int Gameplay_SettingCampingLegalityToggle_OID
int Gameplay_HotkeyCreateItem_OID
int Gameplay_HotkeyBuildCampfire_OID
int Gameplay_HotkeyHarvestWood_OID

int Help_TroubleshootingMenu_OID
int Help_TutorialsToggle_OID
int Help_TutorialsResetText_OID
int Guide_Topic1
int Guide_Topic2
int Guide_Topic3
int Guide_Topic4

;#EndRegion

Event OnConfigInit()
	
	Pages = new string[3]
	Pages[0] = "$CampfireGameplayPage"
	Pages[1] = "$CampfireAdvancedPage"
	Pages[2] = "$CampfireHelpPage"
	
	TroubleshootingList = new string[2]
	TroubleshootingList[0] = "$CampfireTroubleshooting0"
	TroubleshootingList[1] = "$CampfireTroubleshooting1"

	;Frostfall.FrostfallDebug(0, "Initialized the SkyUI Mod Config Menu.")
	debug.trace("[CAMPFIRE] Initialized the SkyUI Mod Config Menu.")
	
endEvent

function PageReset_Gameplay()
	if !TroubleshootingList
		OnConfigInit()
	endif

	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("$CampfireGameplayHeaderCamping")
	
	if _Camp_Setting_CampingArmorTakeOff.GetValueInt() == 2
		Gameplay_SettingCampingArmorTentsText_OID = AddToggleOption("$CampfireGameplaySettingCampingRemoveGear", true)
	else
		Gameplay_SettingCampingArmorTentsText_OID = AddToggleOption("$CampfireGameplaySettingCampingRemoveGear", false)
	endif
	
	if _DE_Setting_Lighting.GetValueInt() == 2
		Gameplay_SettingCampingFireLightingText_OID = AddToggleOption("$CampfireGameplaySettingCampingLightingMode", true)
	else
		Gameplay_SettingCampingFireLightingText_OID = AddToggleOption("$CampfireGameplaySettingCampingLightingMode", false)
	endif

	if _Camp_Setting_Legality.GetValueInt() == 2
		Gameplay_SettingCampingLegalityToggle_OID = AddToggleOption("$CampfireGameplaySettingLegality", true)
	else
		Gameplay_SettingCampingLegalityToggle_OID = AddToggleOption("$CampfireGameplaySettingLegality", false)
	endif

	AddEmptyOption()
	
	AddHeaderOption("$CampfireVisualsHeaderHotkeys")
	Gameplay_HotkeyCreateItem_OID = AddKeyMapOption("$CampfireGameplayHotkeyCreateItem", _Camp_HotkeyCreateItem.GetValueInt())
	Gameplay_HotkeyBuildCampfire_OID = AddKeyMapOption("$CampfireGameplayHotkeyBuildCampfire", _Camp_HotkeyBuildCampfire.GetValueInt())
	Gameplay_HotkeyHarvestWood_OID = AddKeyMapOption("$CampfireGameplayHotkeyHarvestWood", _Camp_HotkeyHarvestWood.GetValueInt())
	
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
endFunction

function PageReset_Advanced()
	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("$CampfireAdvancedHeaderPlacement")
	
	if _Camp_Setting_AdvancedPlacement.GetValueInt() == 2
		Gameplay_SettingCampingPlacementVisualizationText_OID = AddToggleOption("$CampfireGameplaySettingCampingPlacementMode", true)
	else
		Gameplay_SettingCampingPlacementVisualizationText_OID = AddToggleOption("$CampfireGameplaySettingCampingPlacementMode", false)
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

function PageReset_Help()
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("$CampfireHelpHeaderTutorials")
	if _DE_Setting_Help.GetValueInt() == 2
		Help_TutorialsToggle_OID = AddToggleOption("$CampfireHelpSettingTutorialsShow", true)
	else
		Help_TutorialsToggle_OID = AddToggleOption("$CampfireHelpSettingTutorialsShow", false)
	endif
	Help_TutorialsResetText_OID = AddTextOption("", "$CampfireHelpSettingTutorialsReset")
	AddEmptyOption()
	AddHeaderOption("$CampfireHelpHeaderTroubleshooting")

	Help_TroubleshootingMenu_OID = AddMenuOption("$CampfireHelpTroubleshootingSelectProblem", TroubleshootingList[TroubleshootingIndex]) ;ZZZ
	
	SetCursorPosition(1) ; Move cursor to top right position
	AddHeaderOption("$CampfireGuideHeaderCamping")
	Guide_Topic1 = AddTextOption("$CampfireGuideCampingTopic1", "")
	Guide_Topic2 = AddTextOption("$CampfireGuideCampingTopic2", "")
	Guide_Topic3 = AddTextOption("$CampfireGuideCampingTopic3", "")
	Guide_Topic4 = AddTextOption("$CampfireGuideGearTopic1", "")
endFunction

event OnPageReset(string page)
	if page == ""
		LoadCustomContent("frostfall/frostfall_splash.swf")
	else
		UnloadCustomContent()
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
	elseif option == Gameplay_SettingCampingPlacementVisualizationText_OID
		SetInfoText("$CampfireOptionHighlightPlacementMode")
	elseif option == Gameplay_SettingCampingFireLightingText_OID
		SetInfoText("$CampfireOptionHighlightSettingCampingFireLightingText")
	elseif option == Gameplay_SettingCampingLegalityToggle_OID
		SetInfoText("$CampfireOptionHighlightSettingLegality")
	elseif option == Help_TutorialsToggle_OID
		SetInfoText("$CampfireOptionHighlightSettingTutorials")
	elseif option == Advanced_SettingMaxThreads_OID
		SetInfoText("$CampfireOptionHighlightSettingMaxThreads")
	elseif option == Advanced_SettingTrackFollowers_OID
		SetInfoText("$CampfireOptionHighlightSettingTrackFollowers")
	elseif option == Gameplay_HotkeyCreateItem_OID
		SetInfoText("$CampfireOptionHighlightHKCreateItem")
	elseif option == Gameplay_HotkeyBuildCampfire_OID
		SetInfoText("$CampfireOptionHighlightHKBuildCampfire")
	elseif option == Gameplay_HotkeyHarvestWood_OID
		SetInfoText("$CampfireOptionHighlightHKHarvestWood")
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
	elseif option == Gameplay_SettingCampingPlacementVisualizationText_OID
		if _Camp_Setting_AdvancedPlacement.GetValueInt() == 2
			_Camp_Setting_AdvancedPlacement.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlacementVisualizationText_OID, false)
		else
			_Camp_Setting_AdvancedPlacement.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlacementVisualizationText_OID, true)
		endif
	elseif option == Advanced_SettingTrackFollowers_OID
		if _Camp_Setting_TrackFollowers.GetValueInt() == 2
			_Camp_Setting_TrackFollowers.SetValueInt(1)
			SetToggleOptionValue(Advanced_SettingTrackFollowers_OID, false)
		else
			_Camp_Setting_TrackFollowers.SetValueInt(2)
			SetToggleOptionValue(Advanced_SettingTrackFollowers_OID, true)
		endif
	elseif option == Gameplay_SettingCampingFireLightingText_OID
		if _DE_Setting_Lighting.GetValueInt() == 2
			_DE_Setting_Lighting.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingFireLightingText_OID, false)
		else
			_DE_Setting_Lighting.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingFireLightingText_OID, true)
		endif
	elseif option == Gameplay_SettingCampingLegalityToggle_OID
		if _Camp_Setting_Legality.GetValueInt() == 2
			_Camp_Setting_Legality.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingLegalityToggle_OID, false)
		else
			_Camp_Setting_Legality.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingLegalityToggle_OID, true)
		endif
	elseif option == Gameplay_SettingCampingPlaceHelm_OID
		if _Camp_Setting_TakeOff_Helm.GetValueInt() == 2
			_Camp_Setting_TakeOff_Helm.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceHelm_OID, false)
		else
			_Camp_Setting_TakeOff_Helm.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceHelm_OID, true)
		endif
	elseif option == Gameplay_SettingCampingPlaceCuirass_OID
		if _Camp_Setting_TakeOff_Cuirass.GetValueInt() == 2
			_Camp_Setting_TakeOff_Cuirass.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceCuirass_OID, false)
		else
			_Camp_Setting_TakeOff_Cuirass.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceCuirass_OID, true)
		endif
	elseif option == Gameplay_SettingCampingPlaceGauntlets_OID
		if _Camp_Setting_TakeOff_Gauntlets.GetValueInt() == 2
			_Camp_Setting_TakeOff_Gauntlets.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceGauntlets_OID, false)
		else
			_Camp_Setting_TakeOff_Gauntlets.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceGauntlets_OID, true)
		endif
	elseif option == Gameplay_SettingCampingPlaceBoots_OID
		if _Camp_Setting_TakeOff_Boots.GetValueInt() == 2
			_Camp_Setting_TakeOff_Boots.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceBoots_OID, false)
		else
			_Camp_Setting_TakeOff_Boots.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceBoots_OID, true)
		endif
	elseif option == Gameplay_SettingCampingPlaceShield_OID
		if _Camp_Setting_TakeOff_Shield.GetValueInt() == 2
			_Camp_Setting_TakeOff_Shield.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceShield_OID, false)
		else
			_Camp_Setting_TakeOff_Shield.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceShield_OID, true)
		endif
	elseif option == Gameplay_SettingCampingPlaceWeapons_OID
		if _Camp_Setting_TakeOff_Weapons.GetValueInt() == 2
			_Camp_Setting_TakeOff_Weapons.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceWeapons_OID, false)
		else
			_Camp_Setting_TakeOff_Weapons.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceWeapons_OID, true)
		endif
	elseif option == Gameplay_SettingCampingPlaceAmmo_OID
		if _Camp_Setting_TakeOff_Ammo.GetValueInt() == 2
			_Camp_Setting_TakeOff_Ammo.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceAmmo_OID, false)
		else
			_Camp_Setting_TakeOff_Ammo.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceAmmo_OID, true)
		endif
	elseif option == Gameplay_SettingCampingPlaceBackpack_OID
		if _Camp_Setting_TakeOff_Backpack.GetValueInt() == 2
			_Camp_Setting_TakeOff_Backpack.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceBackpack_OID, false)
		else
			_Camp_Setting_TakeOff_Backpack.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceBackpack_OID, true)
		endif
	endif
	;#EndRegion
	
	;#Region Help Page
	if option == Help_TutorialsToggle_OID
		if _DE_Setting_Help.GetValueInt() == 2
			_DE_Setting_Help.SetValueInt(1)
			SetToggleOptionValue(Help_TutorialsToggle_OID, false)
		else
			_DE_Setting_Help.SetValueInt(2)
			SetToggleOptionValue(Help_TutorialsToggle_OID, true)
		endif
	elseif option == Help_TutorialsResetText_OID
		bool bChoice = ShowMessage("$CampfireTutorialResetPrompt")
		if bChoice
			_Camp_HelpDone_TentActivate.SetValueInt(1)
			_DE_HelpDone_Visualize.SetValueInt(1)
			_DE_HelpDone_PlacementError.SetValueInt(1)
		endif
	endif
	;#EndRegion
	
	;#Region Guide Page
	if option == Guide_Topic1
		ShowGuideTopic1()
	elseif option == Guide_Topic2
		ShowGuideTopic2()
	elseif option == Guide_Topic3
		ShowGuideTopic3()
	elseif option == Guide_Topic4
		ShowGuideTopic4()
	endif
	;#EndRegion
endEvent

event OnOptionDefault(int option)
	if option == Gameplay_SettingCampingArmorTentsText_OID
		_Camp_Setting_CampingArmorTakeOff.SetValue(2)
		SetToggleOptionValue(Gameplay_SettingCampingArmorTentsText_OID, true)
	elseif option == Gameplay_SettingCampingFireLightingText_OID
		_DE_Setting_Lighting.SetValue(1)
		SetTextOptionValue(Gameplay_SettingCampingFireLightingText_OID, "$CampfireAutomatic")
	elseif option == Gameplay_SettingCampingLegalityToggle_OID
		_Camp_Setting_Legality.SetValueInt(2)
		SetToggleOptionValue(Gameplay_SettingCampingLegalityToggle_OID, true)
	endif
	if option == Gameplay_HotkeyCreateItem_OID
		UnregisterForKey(_Camp_HotkeyCreateItem.GetValueInt())
		_Camp_HotkeyCreateItem.SetValue(0)
		ForcePageReset()
		Game.GetPlayer().AddSpell(_Camp_CreateItemSpell, false)
	elseif option == Gameplay_HotkeyBuildCampfire_OID
		UnregisterForKey(_Camp_HotkeyBuildCampfire.GetValueInt())
		_Camp_HotkeyBuildCampfire.SetValue(0)
		ForcePageReset()
		Game.GetPlayer().AddSpell(_Camp_CampfireSpell, false)
	elseif option == Gameplay_HotkeyHarvestWood_OID
		UnregisterForKey(_Camp_HotkeyHarvestWood.GetValueInt())
		_Camp_HotkeyHarvestWood.SetValue(0)
		ForcePageReset()
		Game.GetPlayer().AddSpell(_Camp_HarvestWoodSpell, false)
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
		SetSliderDialogDefaultValue(20.0)
		SetSliderDialogRange(0.0, 30.0)
		SetSliderDialogInterval(1.0)
	endif
endEvent

event OnOptionSliderAccept(int option, float value)
	if option == Advanced_SettingMaxThreads_OID
		_Camp_Setting_MaxThreads.SetValueInt(value as Int)
		SetSliderOptionValue(Advanced_SettingMaxThreads_OID, value, "{0}")
	endif
endEvent

event OnOptionKeyMapChange(int option, int keyCode, string conflictControl, string conflictName)
	if option == Gameplay_HotkeyBuildCampfire_OID
		if conflictControl != ""
			if conflictName != ""
				ShowMessage("This key is already bound to " + conflictControl + " in " + conflictName + ". Undesirable behavior may occur; use with caution, or assign to a different control.")
				_Camp_HotkeyBuildCampfire.SetValueInt(keyCode)
				RegisterForKey(_Camp_HotkeyBuildCampfire.GetValueInt())
				ForcePageReset()
				Game.GetPlayer().RemoveSpell(_Camp_CampfireSpell)
			else
				ShowMessage("This key is already bound to " + conflictControl + " in Skyrim. Please select a different key.")
			endif
		else
			_Camp_HotkeyBuildCampfire.SetValueInt(keyCode)
			RegisterForKey(_Camp_HotkeyBuildCampfire.GetValueInt())
			ForcePageReset()
			Game.GetPlayer().RemoveSpell(_Camp_CampfireSpell)
		endif
	elseif option == Gameplay_HotkeyCreateItem_OID
		if conflictControl != ""
			if conflictName != ""
				ShowMessage("This key is already bound to " + conflictControl + " in " + conflictName + ". Undesirable behavior may occur; use with caution, or assign to a different control.")
				_Camp_HotkeyCreateItem.SetValueInt(keyCode)
				RegisterForKey(_Camp_HotkeyCreateItem.GetValueInt())
				ForcePageReset()
				Game.GetPlayer().RemoveSpell(_Camp_CreateItemSpell)
			else
				ShowMessage("This key is already bound to " + conflictControl + " in Skyrim. Please select a different key.")
			endif
		else
			_Camp_HotkeyCreateItem.SetValueInt(keyCode)
			RegisterForKey(_Camp_HotkeyCreateItem.GetValueInt())
			ForcePageReset()
			Game.GetPlayer().RemoveSpell(_Camp_CreateItemSpell)
		endif
	elseif option == Gameplay_HotkeyHarvestWood_OID
		if conflictControl != ""
			if conflictName != ""
				ShowMessage("This key is already bound to " + conflictControl + " in " + conflictName + ". Undesirable behavior may occur; use with caution, or assign to a different control.")
				_Camp_HotkeyHarvestWood.SetValueInt(keyCode)
				RegisterForKey(_Camp_HotkeyHarvestWood.GetValueInt())
				ForcePageReset()
				Game.GetPlayer().RemoveSpell(_Camp_HarvestWoodSpell)
			else
				ShowMessage("This key is already bound to " + conflictControl + " in Skyrim. Please select a different key.")
			endif
		else
			_Camp_HotkeyHarvestWood.SetValueInt(keyCode)
			RegisterForKey(_Camp_HotkeyHarvestWood.GetValueInt())
			ForcePageReset()
			Game.GetPlayer().RemoveSpell(_Camp_HarvestWoodSpell)
		endif
	endif
endEvent

Event OnKeyDown(int KeyCode)
	;debug.trace("[Frostfall] iHotkeyWeathersense = " + iHotkeyWeathersense)
	if UI.IsMenuOpen("Console") || UI.IsMenuOpen("Book Menu") || UI.IsMenuOpen("BarterMenu") || UI.IsMenuOpen("ContainerMenu") || UI.IsMenuOpen("CraftingMenu") || UI.IsMenuOpen("Dialogue Menu") || UI.IsMenuOpen("FavoritesMenu") || UI.IsMenuOpen("InventoryMenu") || UI.IsMenuOpen("Journal Menu") || UI.IsMenuOpen("Lockpicking Menu") || UI.IsMenuOpen("MagicMenu") || UI.IsMenuOpen("MapMenu") || UI.IsMenuOpen("MessageBoxMenu") || UI.IsMenuOpen("Sleep/Wait Menu") || UI.IsMenuOpen("StatsMenu")
		return
	endif
	if KeyCode == _Camp_HotkeyCreateItem.GetValueInt()
		_Camp_CreateItemSpell.Cast(Game.GetPlayer())
	elseif KeyCode == _Camp_HotkeyBuildCampfire.GetValueInt()
		_Camp_CampfireSpell.Cast(Game.GetPlayer())
	elseif KeyCode == _Camp_HotkeyHarvestWood.GetValueInt()
		_Camp_HarvestWoodSpell.Cast(Game.GetPlayer())
	endif
endEvent
	
string function GetCustomControl(int keyCode)
	if (keyCode == _Camp_HotkeyCreateItem.GetValueInt())
		return "Survival Skill: Create Item"
	elseif (keyCode == _Camp_HotkeyBuildCampfire.GetValueInt())
		return "Survival Skill: Build Campfire"
	elseif (keyCode == _Camp_HotkeyHarvestWood.GetValueInt())
		return "Survival Skill: Harvest Wood"
	else
		return ""
	endIf
endFunction

;#Region Help Topics
function ShowGuideTopic1()
	ShowMessage("$CampfireGuideCampingTopic1Text", false)
endfunction
function ShowGuideTopic2()
	ShowMessage("$CampfireGuideCampingTopic2Text", false)
endfunction
function ShowGuideTopic3()
	ShowMessage("$CampfireGuideCampingTopic3Text", false)
endfunction
function ShowGuideTopic4()
	ShowMessage("$CampfireGuideGearTopic1Text", false)
endfunction
;#EndRegion

;#Region Troubleshooters
function TroubleshootingPlacement()
	utility.wait(1)
	_Camp_CurrentlyPlacingObject.SetValue(1)
	_Camp_TroubleshootingConfirmMsg.Show()
endFunction

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
endFunction