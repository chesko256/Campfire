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
GlobalVariable property _DE_Setting_WoodCinematic auto
GlobalVariable property _DE_Setting_SystemMsg auto
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

int Overview_CampfireText_OID
int Gameplay_SettingCampingArmorTentsText_OID
int Gameplay_SettingCampingFireLightingText_OID
int Gameplay_SettingCampingDynamicCampfiresText_OID
int Gameplay_SettingCampingPlacementVisualizationText_OID
int Visuals_SettingWoodCinematicToggle_OID
int Visuals_SettingAnimationToggle_OID
int Visuals_SettingSystemMsgToggle_OID
int Visuals_HotkeySurvivalSkills_OID

int Help_TroubleshootingMenu_OID
int Help_TutorialsToggle_OID
int Help_TutorialsResetText_OID
int Guide_Topic1
int Guide_Topic2
int Guide_Topic3
int Guide_Topic4
int Guide_Topic5
int Guide_Topic6
int Guide_Topic7
int Guide_Topic8
int Guide_Topic9
int Guide_Topic10
int Guide_Topic11
int Guide_Topic12
int Guide_Topic13
int Guide_Topic14
int Guide_Topic15
int Guide_Topic16
int Guide_Topic17
int Guide_Topic18

Spell property _DE_SurvivalSkillsCombo_Spell auto
Spell property _DE_WalkingStickSpell auto
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

	SetCursorPosition(1) ; Move cursor to top right position
	
	AddHeaderOption("$CampfireVisualsHeaderHotkeys")
	Visuals_HotkeySurvivalSkills_OID = AddKeyMapOption("$CampfireVisualsHotkeySurvivalSkills", _DE_HotkeySurvivalSkills.GetValueInt())
	
	AddHeaderOption("$CampfireHelpHeaderTutorials")
	if _DE_Setting_Help.GetValueInt() == 2
		Help_TutorialsToggle_OID = AddToggleOption("$CampfireHelpSettingTutorialsShow", true)
	else
		Help_TutorialsToggle_OID = AddToggleOption("$CampfireHelpSettingTutorialsShow", false)
	endif
	Help_TutorialsResetText_OID = AddTextOption("", "$CampfireHelpSettingTutorialsReset")

	AddHeaderOption("$CampfireHelpHeaderTroubleshooting")
	Help_TroubleshootingMenu_OID = AddMenuOption("$CampfireHelpTroubleshootingSelectProblem", TroubleshootingList[TroubleshootingIndex]) ;ZZZ

	if _DE_Setting_SystemMsg.GetValueInt() == 2
		Visuals_SettingSystemMsgToggle_OID = AddToggleOption("$CampfireVisualsSettingSystem", true)
	else
		Visuals_SettingSystemMsgToggle_OID = AddToggleOption("$CampfireVisualsSettingSystem", false)
	endif
endFunction

function PageReset_Guide()																				;TRANSLATED
	SetCursorFillMode(TOP_TO_BOTTOM)
	AddHeaderOption("$CampfireGuideHeaderExposure")
	Guide_Topic1 = AddTextOption("$CampfireGuideExposureTopic1", "")
	Guide_Topic2 = AddTextOption("$CampfireGuideExposureTopic2", "")
	Guide_Topic3 = AddTextOption("$CampfireGuideExposureTopic3", "")
	Guide_Topic4 = AddTextOption("$CampfireGuideExposureTopic4", "")
	Guide_Topic7 = AddTextOption("$CampfireGuideExposureTopic5", "")
	Guide_Topic13 = AddTextOption("$CampfireGuideExposureTopic6", "")
	Guide_Topic8 = AddTextOption("$CampfireGuideExposureTopic7", "")
	Guide_Topic9 = AddTextOption("$CampfireGuideExposureTopic8", "")
	
	AddHeaderOption("$CampfireGuideHeaderWater")
	Guide_Topic5 = AddTextOption("$CampfireGuideWaterTopic1", "")
	Guide_Topic6 = AddTextOption("$CampfireGuideWaterTopic2", "")
	
	SetCursorPosition(1) ; Move cursor to top right position
	
	AddHeaderOption("$CampfireGuideHeaderCamping")
	Guide_Topic14 = AddTextOption("$CampfireGuideCampingTopic1", "")
	Guide_Topic15 = AddTextOption("$CampfireGuideCampingTopic2", "")
	Guide_Topic16 = AddTextOption("$CampfireGuideCampingTopic3", "")
	
	AddHeaderOption("$CampfireGuideHeaderGear")
	Guide_Topic11 = AddTextOption("$CampfireGuideGearTopic1", "")
	Guide_Topic12 = AddTextOption("$CampfireGuideGearTopic2", "")
	Guide_Topic18 = AddTextOption("$CampfireGuideGearTopic3", "")
	Guide_Topic17 = AddTextOption("$CampfireGuideGearTopic4", "")

	AddHeaderOption("$CampfireGuideHeaderExtraFeatures")
	Guide_Topic10 = AddTextOption("$CampfireGuideExtraTopic1", "")
	
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
	elseif option == Visuals_SettingWoodCinematicToggle_OID
		SetInfoText("$CampfireOptionHighlightSettingWoodCinematicToggle")
	elseif option == Visuals_SettingAnimationToggle_OID
		SetInfoText("$CampfireOptionHighlightAnimation")
	elseif option == Visuals_HotkeySurvivalSkills_OID
		SetInfoText("$CampfireOptionHighlightHKSurvivalSkills")
	elseif option == Visuals_SettingSystemMsgToggle_OID
		SetInfoText("$CampfireOptionHighlightSystem")
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
	elseif option == Visuals_SettingSystemMsgToggle_OID
		if _DE_Setting_SystemMsg.GetValueInt() == 2
			_DE_Setting_SystemMsg.SetValueInt(1)
			SetToggleOptionValue(Visuals_SettingSystemMsgToggle_OID, false)
		else
			_DE_Setting_SystemMsg.SetValueInt(2)
			SetToggleOptionValue(Visuals_SettingSystemMsgToggle_OID, true)
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
	elseif option == Guide_Topic5
		ShowGuideTopic5()
	elseif option == Guide_Topic6
		ShowGuideTopic6()
	elseif option == Guide_Topic7
		ShowGuideTopic7()
	elseif option == Guide_Topic8
		ShowGuideTopic8()
	elseif option == Guide_Topic9
		ShowGuideTopic9()
	elseif option == Guide_Topic10
		ShowGuideTopic10()
	elseif option == Guide_Topic11
		ShowGuideTopic11()
	elseif option == Guide_Topic12
		ShowGuideTopic12()
	elseif option == Guide_Topic13
		ShowGuideTopic13()
	elseif option == Guide_Topic14
		ShowGuideTopic14()
	elseif option == Guide_Topic15
		ShowGuideTopic15()
	elseif option == Guide_Topic16
		ShowGuideTopic16()
	elseif option == Guide_Topic17
		ShowGuideTopic17()
	elseif option == Guide_Topic18
		ShowGuideTopic18()
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
	ShowMessage("$CampfireGuideExposureTopic1Text", false)
endfunction
function ShowGuideTopic2()
	ShowMessage("$CampfireGuideExposureTopic2Text", false)
endfunction
function ShowGuideTopic3()
	ShowMessage("$CampfireGuideExposureTopic3Text", false)
endfunction
function ShowGuideTopic4()
	ShowMessage("$CampfireGuideExposureTopic4Text", false)
endfunction
function ShowGuideTopic5()
	ShowMessage("$CampfireGuideWaterTopic1Text", false)
endfunction
function ShowGuideTopic6()
	ShowMessage("$CampfireGuideWaterTopic2Text", false)
endfunction
function ShowGuideTopic7()
	ShowMessage("$CampfireGuideExposureTopic5Text", false)
endfunction
function ShowGuideTopic8()
	ShowMessage("$CampfireGuideExposureTopic7Text", false)
endfunction
function ShowGuideTopic9()
	ShowMessage("$CampfireGuideExposureTopic8Text", false)
endfunction
function ShowGuideTopic10()
	ShowMessage("$CampfireGuideExtraTopic1Text", false)
endfunction
function ShowGuideTopic11()
	ShowMessage("$CampfireGuideGearTopic1Text", false)
endfunction
function ShowGuideTopic12()
	ShowMessage("$CampfireGuideGearTopic2Text", false)
endfunction
function ShowGuideTopic13()
	ShowMessage("$CampfireGuideExposureTopic6Text", false)
endfunction
function ShowGuideTopic14()
	ShowMessage("$CampfireGuideCampingTopic1Text", false)
endfunction
function ShowGuideTopic15()
	ShowMessage("$CampfireGuideCampingTopic2Text", false)
endFunction
function ShowGuideTopic16()
	ShowMessage("$CampfireGuideCampingTopic3Text", false)
endFunction
function ShowGuideTopic17()
	ShowMessage("$CampfireGuideGearTopic4Text", false)
endfunction
function ShowGuideTopic18()
	ShowMessage("$CampfireGuideGearTopic3Text", false)
endFunction
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