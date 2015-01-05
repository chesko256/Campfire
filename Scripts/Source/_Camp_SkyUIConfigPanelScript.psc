Scriptname _Camp_SkyUIConfigPanelScript extends SKI_ConfigBase

; #SUMMARY# =====================================================================================================================
; Name ...................: _Camp_SkyUIConfigPanelScript
; Attached To (EditorID)..: 
; Description ............: Script that drives all SkyUI 3.4+ Mod Configuration Menu options. All string values are in the translation files.
; Author .................: Chesko
; Last Approved (version) : 
; Status .................: 
; Remarks ................: 
; ===============================================================================================================================

; External scripts
_Camp_Compatibility property Compatibility auto
GlobalVariable property _DE_Setting_Lighting auto
GlobalVariable property _DE_Setting_Tent auto
GlobalVariable property _Camp_HelpDone_TentActivate auto
GlobalVariable property _DE_Setting_CampingArmorTakeOff auto

GlobalVariable property _Camp_Setting_TakeOff_Helm auto
GlobalVariable property _Camp_Setting_TakeOff_Cuirass auto
GlobalVariable property _Camp_Setting_TakeOff_Gauntlets auto
GlobalVariable property _Camp_Setting_TakeOff_Boots auto
GlobalVariable property _Camp_Setting_TakeOff_Backpack auto
GlobalVariable property _Camp_Setting_TakeOff_Weapons auto
GlobalVariable property _Camp_Setting_TakeOff_Shield auto
GlobalVariable property _Camp_Setting_TakeOff_Ammo auto

GlobalVariable property _Camp_Setting_EquipTentOutfit auto

GlobalVariable property _DE_Setting_WoodCinematic auto
GlobalVariable property _Camp_Setting_Legality auto
GlobalVariable property _DE_HelpDone_Visualize auto
GlobalVariable property _DE_HelpDone_PlacementError auto
GlobalVariable property _DE_Setting_Help auto
GlobalVariable property _DE_Setting_SimplePlacement auto
GlobalVariable property _DE_Setting_Animation auto
GlobalVariable property _DE_SKSEVersion auto
GlobalVariable property _Camp_CurrentlyPlacingObject auto
GlobalVariable property _DE_HotkeySurvivalSkills auto

message property _DE_SkyUI_PresetConfirm auto

; Toggle states
bool bPresetChange = false

string[] TroubleshootingList
int TroubleshootingIndex = 0

int Gameplay_SettingCampingArmorTentsText_OID
int Gameplay_SettingCampingFireLightingText_OID
int Gameplay_SettingCampingDynamicCampfiresText_OID
int Gameplay_SettingCampingPlacementVisualizationText_OID

int Gameplay_SettingCampingPlaceHelm_OID
int Gameplay_SettingCampingPlaceCuirass_OID
int Gameplay_SettingCampingPlaceBoots_OID
int Gameplay_SettingCampingPlaceGauntlets_OID
int Gameplay_SettingCampingPlaceBackpack_OID
int Gameplay_SettingCampingPlaceWeapons_OID
int Gameplay_SettingCampingPlaceShield_OID
int Gameplay_SettingCampingPlaceAmmo_OID

int Visuals_SettingWoodCinematicToggle_OID
int Visuals_SettingAnimationToggle_OID
int Gameplay_SettingCampingLegalityToggle_OID
int Visuals_HotkeySurvivalSkills_OID
int Config_SaveText_OID
int Config_LoadText_OID

int Help_TroubleshootingMenu_OID
int Help_TutorialsToggle_OID
int Help_TutorialsResetText_OID
int Guide_Topic1
int Guide_Topic2
int Guide_Topic3
int Guide_Topic4

Spell property _DE_SurvivalSkillsCombo_Spell auto
Spell property _DE_HandWarmingSpell auto
ReferenceAlias property Alias_DE_Player auto

message property _DE_Backpack_Menu2_HelpTroubleshootingConfirm auto

;#EndRegion

Event OnConfigInit()																					;TRANSLATED
	
	Pages = new string[2]
	Pages[0] = "$CampfireGameplayPage"
	Pages[1] = "$CampfireGuidePage"
	
	TroubleshootingList = new string[2]
	TroubleshootingList[0] = "$CampfireTroubleshooting0"
	TroubleshootingList[1] = "$CampfireTroubleshooting1"

	;Frostfall.FrostfallDebug(0, "Initialized the SkyUI Mod Config Menu.")
	debug.trace("[CAMPFIRE] Initialized the SkyUI Mod Config Menu.")
	
endEvent

function PageReset_Gameplay()																			;TRANSLATED
	if !TroubleshootingList
		OnConfigInit()
	endif

	SetCursorFillMode(TOP_TO_BOTTOM)

	AddHeaderOption("$CampfireGameplayHeaderCamping")
	
	if _DE_Setting_CampingArmorTakeOff.GetValueInt() == 2
		Gameplay_SettingCampingArmorTentsText_OID = AddToggleOption("$CampfireGameplaySettingCampingRemoveGear", true)
	else
		Gameplay_SettingCampingArmorTentsText_OID = AddToggleOption("$CampfireGameplaySettingCampingRemoveGear", false)
	endif
	
	if _DE_Setting_SimplePlacement.GetValueInt() == 2
		Gameplay_SettingCampingPlacementVisualizationText_OID = AddToggleOption("$CampfireGameplaySettingCampingPlacementMode", false)
	else
		Gameplay_SettingCampingPlacementVisualizationText_OID = AddToggleOption("$CampfireGameplaySettingCampingPlacementMode", true)
	endif
	
	if _DE_Setting_Lighting.GetValueInt() == 2
		Gameplay_SettingCampingFireLightingText_OID = AddTextOption("$CampfireGameplaySettingCampingLightingMode", "$CampfireManual")
	else
		Gameplay_SettingCampingFireLightingText_OID = AddTextOption("$CampfireGameplaySettingCampingLightingMode", "$CampfireAutomatic")
	endif

	if _DE_Setting_Animation.GetValueInt() == 2
		Visuals_SettingAnimationToggle_OID = AddToggleOption("$CampfireVisualsSettingAnimation", true)
	else
		Visuals_SettingAnimationToggle_OID = AddToggleOption("$CampfireVisualsSettingAnimation", false)
	endif

	if _Camp_Setting_Legality.GetValueInt() == 2
		Gameplay_SettingCampingLegalityToggle_OID = AddToggleOption("$CampfireGameplaySettingLegality", false)
	else
		Gameplay_SettingCampingLegalityToggle_OID = AddToggleOption("$CampfireGameplaySettingLegality", true)
	endif

	AddEmptyOption()
	
	AddHeaderOption("$CampfireVisualsHeaderHotkeys")
	Visuals_HotkeySurvivalSkills_OID = AddKeyMapOption("$CampfireVisualsHotkeySurvivalSkills", _DE_HotkeySurvivalSkills.GetValueInt())
	
	AddEmptyOption()

	;AddHeaderOption("$CampfireHelpHeaderSaveConfig")
	;Config_SaveText_OID = AddTextOption("", "$CampfireConfigSave")
	;Config_LoadText_OID = AddTextOption("", "$CampfireConfigLoad")

	SetCursorPosition(1) ; Move cursor to top right position

	AddHeaderOption("$CampfireGameplayHeaderTentDisplay")

	if _Camp_Setting_TakeOff_Cuirass.GetValueInt() == 2
		Gameplay_SettingCampingPlaceCuirass_OID = AddToggleOption("$CampfireGameplaySettingShowCuirass", false)
	else
		Gameplay_SettingCampingPlaceCuirass_OID = AddToggleOption("$CampfireGameplaySettingShowCuirass", true)
	endif
		if _Camp_Setting_TakeOff_Gauntlets.GetValueInt() == 2
		Gameplay_SettingCampingPlaceGauntlets_OID = AddToggleOption("$CampfireGameplaySettingShowGauntlets", false)
	else
		Gameplay_SettingCampingPlaceGauntlets_OID = AddToggleOption("$CampfireGameplaySettingShowGauntlets", true)
	endif
	if _Camp_Setting_TakeOff_Backpack.GetValueInt() == 2
		Gameplay_SettingCampingPlaceBackpack_OID = AddToggleOption("$CampfireGameplaySettingShowBackpack", false)
	else
		Gameplay_SettingCampingPlaceBackpack_OID = AddToggleOption("$CampfireGameplaySettingShowBackpack", true)
	endif
	if _Camp_Setting_TakeOff_Weapons.GetValueInt() == 2
		Gameplay_SettingCampingPlaceWeapons_OID = AddToggleOption("$CampfireGameplaySettingShowWeapons", false)
	else
		Gameplay_SettingCampingPlaceWeapons_OID = AddToggleOption("$CampfireGameplaySettingShowWeapons", true)
	endif
	if _Camp_Setting_TakeOff_Shield.GetValueInt() == 2
		Gameplay_SettingCampingPlaceShield_OID = AddToggleOption("$CampfireGameplaySettingShowShield", false)
	else
		Gameplay_SettingCampingPlaceShield_OID = AddToggleOption("$CampfireGameplaySettingShowShield", true)
	endif
	if _Camp_Setting_TakeOff_Ammo.GetValueInt() == 2
		Gameplay_SettingCampingPlaceAmmo_OID = AddToggleOption("$CampfireGameplaySettingShowAmmo", false)
	else
		Gameplay_SettingCampingPlaceAmmo_OID = AddToggleOption("$CampfireGameplaySettingShowAmmo", true)
	endif
	if _Camp_Setting_TakeOff_Helm.GetValueInt() == 2
		Gameplay_SettingCampingPlaceHelm_OID = AddToggleOption("$CampfireGameplaySettingShowHelm", false)
	else
		Gameplay_SettingCampingPlaceHelm_OID = AddToggleOption("$CampfireGameplaySettingShowHelm", true)
	endif
	if _Camp_Setting_TakeOff_Boots.GetValueInt() == 2
		Gameplay_SettingCampingPlaceBoots_OID = AddToggleOption("$CampfireGameplaySettingShowBoots", false)
	else
		Gameplay_SettingCampingPlaceBoots_OID = AddToggleOption("$CampfireGameplaySettingShowBoots", true)
	endif

	AddHeaderOption("$CampfireHelpHeaderTutorials")
	if _DE_Setting_Help.GetValueInt() == 2
		Help_TutorialsToggle_OID = AddToggleOption("$CampfireHelpSettingTutorialsShow", true)
	else
		Help_TutorialsToggle_OID = AddToggleOption("$CampfireHelpSettingTutorialsShow", false)
	endif
	Help_TutorialsResetText_OID = AddTextOption("", "$CampfireHelpSettingTutorialsReset")

	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()
	AddEmptyOption()

	AddHeaderOption("$CampfireHelpHeaderTroubleshooting")
	Help_TroubleshootingMenu_OID = AddMenuOption("$CampfireHelpTroubleshootingSelectProblem", TroubleshootingList[TroubleshootingIndex]) ;ZZZ
endFunction

function PageReset_Guide()																				;TRANSLATED
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("$CampfireGuideHeaderCamping")
	Guide_Topic1 = AddTextOption("$CampfireGuideCampingTopic1", "")
	Guide_Topic2 = AddTextOption("$CampfireGuideCampingTopic2", "")
	Guide_Topic3 = AddTextOption("$CampfireGuideCampingTopic3", "")
	Guide_Topic4 = AddTextOption("$CampfireGuideGearTopic1", "")
endFunction

event OnPageReset(string page)																			;TRANSLATED
	if page == ""
		LoadCustomContent("frostfall/frostfall_splash.swf")
	else
		UnloadCustomContent()
	endif
	
	if page == "$CampfireGameplayPage"
		PageReset_Gameplay()
	elseif page == "$CampfireGuidePage"
		PageReset_Guide()
	endif
endEvent

event OnOptionHighlight(int option)																		;TRANSLATED
	if option == Gameplay_SettingCampingArmorTentsText_OID
		SetInfoText("$CampfireOptionHighlightSettingCampingArmorTentsText")
	elseif option == Gameplay_SettingCampingPlacementVisualizationText_OID
		SetInfoText("$CampfireOptionHighlightPlacementMode")
	elseif option == Gameplay_SettingCampingFireLightingText_OID
		SetInfoText("$CampfireOptionHighlightSettingCampingFireLightingText")
	elseif option == Gameplay_SettingCampingDynamicCampfiresText_OID
		SetInfoText("")
	elseif option == Gameplay_SettingCampingLegalityToggle_OID
		SetInfoText("$CampfireOptionHighlightSettingLegality")
	elseif option == Visuals_SettingWoodCinematicToggle_OID
		SetInfoText("$CampfireOptionHighlightSettingWoodCinematicToggle")
	elseif option == Visuals_SettingAnimationToggle_OID
		SetInfoText("$CampfireOptionHighlightAnimation")
	elseif option == Visuals_HotkeySurvivalSkills_OID
		SetInfoText("$CampfireOptionHighlightHKSurvivalSkills")
	elseif option == Config_SaveText_OID
		SetInfoText("$CampfireOptionHighlightConfigSave")
	elseif option == Config_LoadText_OID
		SetInfoText("$CampfireOptionHighlightConfigLoad")
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

event OnOptionSelect(int option)																		;TRANSLATED
	if option == Gameplay_SettingCampingArmorTentsText_OID
		if _DE_Setting_CampingArmorTakeOff.GetValueInt() == 2
			_DE_Setting_CampingArmorTakeOff.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingArmorTentsText_OID, false)
		else
			_DE_Setting_CampingArmorTakeOff.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingArmorTentsText_OID, true)
		endif
	elseif option == Gameplay_SettingCampingPlacementVisualizationText_OID
		if _DE_Setting_SimplePlacement.GetValueInt() == 2
			_DE_Setting_SimplePlacement.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlacementVisualizationText_OID, true)
		else
			_DE_Setting_SimplePlacement.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlacementVisualizationText_OID, false)
		endif
	elseif option == Gameplay_SettingCampingFireLightingText_OID
		if _DE_Setting_Lighting.GetValueInt() == 1
			_DE_Setting_Lighting.SetValueInt(2)
			SetTextOptionValue(Gameplay_SettingCampingFireLightingText_OID, "$CampfireManual")
		else
			_DE_Setting_Lighting.SetValueInt(1)
			SetTextOptionValue(Gameplay_SettingCampingFireLightingText_OID, "$CampfireAutomatic")
		endif
	elseif option == Gameplay_SettingCampingLegalityToggle_OID
		if _Camp_Setting_Legality.GetValueInt() == 2
			_Camp_Setting_Legality.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingLegalityToggle_OID, true)
		else
			_Camp_Setting_Legality.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingLegalityToggle_OID, false)
		endif
	elseif option == Gameplay_SettingCampingPlaceHelm_OID
		if _Camp_Setting_TakeOff_Helm.GetValueInt() == 2
			_Camp_Setting_TakeOff_Helm.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceHelm_OID, true)
		else
			_Camp_Setting_TakeOff_Helm.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceHelm_OID, false)
		endif
	elseif option == Gameplay_SettingCampingPlaceCuirass_OID
		if _Camp_Setting_TakeOff_Cuirass.GetValueInt() == 2
			_Camp_Setting_TakeOff_Cuirass.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceCuirass_OID, true)
		else
			_Camp_Setting_TakeOff_Cuirass.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceCuirass_OID, false)
		endif
	elseif option == Gameplay_SettingCampingPlaceGauntlets_OID
		if _Camp_Setting_TakeOff_Gauntlets.GetValueInt() == 2
			_Camp_Setting_TakeOff_Gauntlets.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceGauntlets_OID, true)
		else
			_Camp_Setting_TakeOff_Gauntlets.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceGauntlets_OID, false)
		endif
	elseif option == Gameplay_SettingCampingPlaceBoots_OID
		if _Camp_Setting_TakeOff_Boots.GetValueInt() == 2
			_Camp_Setting_TakeOff_Boots.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceBoots_OID, true)
		else
			_Camp_Setting_TakeOff_Boots.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceBoots_OID, false)
		endif
	elseif option == Gameplay_SettingCampingPlaceShield_OID
		if _Camp_Setting_TakeOff_Shield.GetValueInt() == 2
			_Camp_Setting_TakeOff_Shield.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceShield_OID, true)
		else
			_Camp_Setting_TakeOff_Shield.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceShield_OID, false)
		endif
	elseif option == Gameplay_SettingCampingPlaceWeapons_OID
		if _Camp_Setting_TakeOff_Weapons.GetValueInt() == 2
			_Camp_Setting_TakeOff_Weapons.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceWeapons_OID, true)
		else
			_Camp_Setting_TakeOff_Weapons.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceWeapons_OID, false)
		endif
	elseif option == Gameplay_SettingCampingPlaceAmmo_OID
		if _Camp_Setting_TakeOff_Ammo.GetValueInt() == 2
			_Camp_Setting_TakeOff_Ammo.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceAmmo_OID, true)
		else
			_Camp_Setting_TakeOff_Ammo.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceAmmo_OID, false)
		endif
	elseif option == Gameplay_SettingCampingPlaceBackpack_OID
		if _Camp_Setting_TakeOff_Backpack.GetValueInt() == 2
			_Camp_Setting_TakeOff_Backpack.SetValueInt(1)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceBackpack_OID, true)
		else
			_Camp_Setting_TakeOff_Backpack.SetValueInt(2)
			SetToggleOptionValue(Gameplay_SettingCampingPlaceBackpack_OID, false)
		endif
	endif
	
	;#EndRegion
	
	if option == Visuals_SettingAnimationToggle_OID
		if _DE_Setting_Animation.GetValueInt() == 2
			_DE_Setting_Animation.SetValueInt(1)
			SetToggleOptionValue(Visuals_SettingAnimationToggle_OID, false)
		else
			_DE_Setting_Animation.SetValueInt(2)
			SetToggleOptionValue(Visuals_SettingAnimationToggle_OID, true)
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

event OnOptionDefault(int option)																		;TRANSLATED
	if option == Gameplay_SettingCampingArmorTentsText_OID
		_DE_Setting_CampingArmorTakeOff.SetValue(2)
		SetToggleOptionValue(Gameplay_SettingCampingArmorTentsText_OID, true)
	elseif option == Gameplay_SettingCampingFireLightingText_OID
		_DE_Setting_Lighting.SetValue(1)
		SetTextOptionValue(Gameplay_SettingCampingFireLightingText_OID, "$CampfireAutomatic")
	elseif option == Gameplay_SettingCampingLegalityToggle_OID
		_Camp_Setting_Legality.SetValueInt(1)
		SetToggleOptionValue(Gameplay_SettingCampingLegalityToggle_OID, true)
	endif
	if option == Visuals_HotkeySurvivalSkills_OID
		UnregisterForKey(_DE_HotkeySurvivalSkills.GetValueInt())
		_DE_HotkeySurvivalSkills.SetValue(0)
		ForcePageReset()
		Game.GetPlayer().AddSpell(_DE_SurvivalSkillsCombo_Spell, false)
	endif
endEvent

event OnOptionMenuOpen(int option)																		;TRANSLATED
	if option == Help_TroubleshootingMenu_OID
		SetMenuDialogOptions(TroubleshootingList)
		SetMenuDialogStartIndex(TroubleshootingIndex)
		SetMenuDialogDefaultIndex(0)
	endif
endEvent

event OnOptionMenuAccept(int option, int index)															;TRANSLATED
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

event OnOptionKeyMapChange(int option, int keyCode, string conflictControl, string conflictName)
	if option == Visuals_HotkeySurvivalSkills_OID
		if conflictControl != ""
			if conflictName != ""
				ShowMessage("This key is already bound to " + conflictControl + " in " + conflictName + ". Undesirable behavior may occur; use with caution, or assign to a different control.")
				_DE_HotkeySurvivalSkills.SetValueInt(keyCode)
				RegisterForKey(_DE_HotkeySurvivalSkills.GetValueInt())
				ForcePageReset()
				Game.GetPlayer().RemoveSpell(_DE_SurvivalSkillsCombo_Spell)
			else
				ShowMessage("This key is already bound to " + conflictControl + " in Skyrim. Please select a different key.")
			endif
		else
			_DE_HotkeySurvivalSkills.SetValueInt(keyCode)
			RegisterForKey(_DE_HotkeySurvivalSkills.GetValueInt())
			ForcePageReset()
			Game.GetPlayer().RemoveSpell(_DE_SurvivalSkillsCombo_Spell)
		endif
	endif
endEvent

Event OnKeyDown(int KeyCode)
	;debug.trace("[Frostfall] iHotkeyWeathersense = " + iHotkeyWeathersense)
	if UI.IsMenuOpen("Console") || UI.IsMenuOpen("Book Menu") || UI.IsMenuOpen("BarterMenu") || UI.IsMenuOpen("ContainerMenu") || UI.IsMenuOpen("CraftingMenu") || UI.IsMenuOpen("Dialogue Menu") || UI.IsMenuOpen("FavoritesMenu") || UI.IsMenuOpen("InventoryMenu") || UI.IsMenuOpen("Journal Menu") || UI.IsMenuOpen("Lockpicking Menu") || UI.IsMenuOpen("MagicMenu") || UI.IsMenuOpen("MapMenu") || UI.IsMenuOpen("MessageBoxMenu") || UI.IsMenuOpen("Sleep/Wait Menu") || UI.IsMenuOpen("StatsMenu")
		return
	endif
	if KeyCode == _DE_HotkeySurvivalSkills.GetValueInt()
		_DE_SurvivalSkillsCombo_Spell.Cast(Game.GetPlayer())
	endif
endEvent
	
string function GetCustomControl(int keyCode)
	if (keyCode == _DE_HotkeySurvivalSkills.GetValueInt())
		return "Survival Skills"
	else
		return ""
	endIf
endFunction

;#Region Help Topics																					;TRANSLATED
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

;#Region Troubleshooters																				;TRANSLATED
function TroubleshootingPlacement()
	utility.wait(1)
	_Camp_CurrentlyPlacingObject.SetValue(1)
	_DE_Backpack_Menu2_HelpTroubleshootingConfirm.Show()
endFunction

function RegisterForKeysOnLoad()
	if _DE_HotkeySurvivalSkills.GetValueInt() != 0
		RegisterForKey(_DE_HotkeySurvivalSkills.GetValueInt())
	endIf
endFunction