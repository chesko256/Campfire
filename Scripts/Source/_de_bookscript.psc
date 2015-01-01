Scriptname _DE_BookScript extends ActiveMagicEffect

; #SUMMARY# =====================================================================================================================
; Name ...................: _DE_BookScript
; Attached To (EditorID)..: 
; Description ............: Handles legacy configuration system.
; Author .................: Chesko
; Last Approved (version) : 2.2
; Status .................: Complete
; Remarks ................: 
; ===============================================================================================================================

;#Region Properties
referencealias property Alias_DE_Player auto
referencealias property _DE_WoodHarvestingAlias auto
objectreference property _DE_XMarker_WoodHarvestEndRef auto
objectreference property _DE_Anchor auto
objectreference property _DE_PortalMarker auto
objectreference property _DE_TroubleshootChop auto
MiscObject property Firewood01 auto
weapon property Axe01 auto
furniture property _DE_WoodPilePlayer auto
message property _DE_BookMenu_Main auto
spell property _DE_Weathersense_Spell auto
Spell property _DE_SurvivalSkillsCombo_Spell auto

Quest property _DE_Main_1_6 auto

globalvariable property _DE_Setting_Shutdown auto
globalvariable property _DE_ExposurePoints auto
globalvariable property _DE_WetState auto
globalvariable property _DE_SwimState auto
globalvariable property _DE_HelpDone_ExposurePoints auto
globalvariable property _DE_HelpDone_Vampirism auto
globalvariable property _DE_HelpDone_Wet auto
globalvariable property _DE_HelpDone_Visualize auto
globalvariable property _DE_Setting_SystemMsg auto

spell property _DE_Hypo_Spell_0_2 auto
spell property _DE_Hypo_Spell_1 auto
spell property _DE_Hypo_Spell_2 auto
spell property _DE_Hypo_Spell_3 auto
spell property _DE_Hypo_Spell_4 auto
spell property _DE_Hypo_Spell_4NoFrost auto
spell property _DE_Hypo_Spell_5 auto
spell property _DE_Hypo_Spell_5NoFrost auto
spell property _DE_WetState_Spell auto
spell property _DE_WetState_Spell1 auto
spell property _DE_WetState_Spell2 auto
spell property _DE_WetState_Spell3 auto
spell property _DE_WetState_Spell1NoShader auto
spell property _DE_WetState_Spell2NoShader auto
spell property _DE_WetState_Spell3NoShader auto
spell property _DE_TorchState_Spell auto
spell property _DE_WEARExamineArmor_Spell auto
spell property _DE_NoWait_Spell auto
spell property _DE_CloakState_Spell auto
spell property _DE_CloakState_Spell_Burlap auto
spell property _DE_CloakState_Spell_Fur auto
spell property _DE_CloakState_Spell_Hide auto
spell property _DE_CloakState_Spell_Linen auto
spell property _DE_ColdWater_1 auto
spell property _DE_ColdWater_2 auto
spell property _DE_ColdWater_3 auto
spell property _DE_ColdWater_3_Perk auto
spell property _DE_ColdWater_Death auto
Spell property _DE_WellInsulatedConditionSpell auto
Spell property _DE_ConditioningState_Spell auto
Spell property _DE_ConditioningState_Spell_SkyRe auto
Spell property _DE_FlyingMountState_Spell auto
Spell property _DE_WerewolfSwimState auto
Spell property _DE_WalkingStickSpell auto
Spell property _DE_HandWarmingSpell auto
spell property _DE_NoWaitWerewolfFix_Spell auto

Formlist property _DE_Armor_Body_Full auto
Formlist property _DE_Armor_Body_Limited auto
Formlist property _DE_Armor_Head_Full auto
Formlist property _DE_Armor_Head_Limited auto
Formlist property _DE_Armor_Hands_Full auto
Formlist property _DE_Armor_Hands_Limited auto
Formlist property _DE_Armor_Feet_Full auto
Formlist property _DE_Armor_Feet_Limited auto

_DE_EPMonitor_1_6 property pMainScript auto
_DE_Compatibility property Compatibility auto

GlobalVariable property _DE_Setting_ExposureRate2 auto
GlobalVariable property _DE_Setting_FastTravel auto
GlobalVariable property _DE_Setting_Tent auto
{Actually governs axe durability as of Frostfall 2.0.}
GlobalVariable property _DE_Setting_Water auto
GlobalVariable property _DE_Setting_Armor auto
GlobalVariable property _DE_Setting_Lighting auto
GlobalVariable property _DE_Setting_WoodCinematic auto
GlobalVariable property _DE_Setting_DialogueStop auto
GlobalVariable property _DE_Setting_CampingArmorTakeOff auto
GlobalVariable property _DE_Setting_MovementPenalty auto
GlobalVariable property _DE_Setting_ConditionMsg auto
GlobalVariable property _DE_Setting_WEARMsg auto
GlobalVariable property _DE_Setting_EPValueMsg auto
GlobalVariable property _DE_Setting_Animation auto
GlobalVariable property _DE_Setting_SoundEffects auto
GlobalVariable property _DE_Setting_ForceFeedback auto
GlobalVariable property _DE_Setting_SimplePlacement auto
GlobalVariable property _DE_CampsitePlacementOn auto
GlobalVariable property _DE_HelpDone_PlacementError auto
GlobalVariable property _DE_HelpDone_Tents auto
GlobalVariable property _DE_RescueChanceAlone auto
GlobalVariable property _DE_RescueChanceFollower auto

_DE_ClothingMonitor_1_7 property ClothingMonitorRef auto
{Property to link to the Clothing Monitor script. Checks worn equipment.}

message property _DE_Backpack_Menu2_Main auto
{Menu: Main Menu}
message property _DE_Backpack_Menu2_Main_NoTentDur auto
{Menu: Main Menu - No Tent Durability Option}
Message property _DE_Backpack_Menu2_Setup auto
{Menu: Setup}
message property _DE_Backpack_Menu2_Setup_ClassicMode auto
{Menu: Setup Classic Mode}
message property _DE_Backpack_Menu2_Setup_LiteMode auto
{Menu: Setup Lite Mode}
message property _DE_Backpack_Menu2_ClassicModeApply auto
{Menu: Setup Classic Mode Confirmation Dialog}
message property _DE_Backpack_Menu2_LiteModeApply auto
{Menu: Setup Lite Mode Confirmation Dialog}
message property _DE_Backpack_Menu2_HelpMain auto
{Menu: Main Help Menu}
message property _DE_Backpack_Menu2_HelpCamping auto
{Menu: Camping Help}
message property _DE_Backpack_Menu2_HelpExposure auto
{Menu: Exposure Help Main Menu}
message property _DE_Backpack_Menu2_HelpExposure_Clothing auto
{Menu: Exposure Clothing Help}
message property _DE_Backpack_Menu2_HelpExposure_Food auto
{Menu: Exposure Food Help}
message property _DE_Backpack_Menu2_HelpExposure_Frost auto
{Menu: Exposure Frost Resistance Help}
message property _DE_Backpack_Menu2_HelpExposure_Location auto
{Menu: Exposure Location Help}
message property _DE_Backpack_Menu2_HelpExposure_Weather auto
{Menu: Exposure Weather Help}
message property _DE_Backpack_Menu2_HelpExposure_Wet auto
{Menu: Exposure Getting Wet Help}
message property _DE_Backpack_Menu2_HelpFT auto
{Menu: Exposure Fast Travel Help}
message property _DE_Backpack_Menu2_HelpWater auto
{Menu: Exposure Cold Water Help}

message Property _DE_Backpack_Menu2_Setup_Options_Camping Auto
{Menu: Camping options submenu}
message Property _DE_Backpack_Menu2_Setup_Options_Camping2 auto
Message Property _DE_Backpack_Menu2_Setup_Options_Exposure Auto
{Menu: Exposure options submenu}


message property _DE_ShutdownReactivate auto
message property _DE_Backpack_Menu2_Setup_HardcoreMode auto
message property _DE_Backpack_Menu2_Setup_OptionsHardcore auto
message property _DE_Backpack_Menu2_Setup_OptionsHardcore_BEAREnabled auto
message property _DE_Backpack_Menu2_Setup_OptionsHardcore_BEARDisabled auto
message property _DE_WearSelectMenu_RestoreDefaultsConfirm auto
message property _DE_WearSelectMenu_RestoreDefaults auto
message property _DE_Backpack_Menu2_HardcoreModeApply auto
message property _DE_Backpack_Menu2_Setup_FastTravelDisableOn auto
message property _DE_Backpack_Menu2_Setup_FastTravelDisableOff auto
message property _DE_Backpack_Menu2_Setup_Options_CombatDisableOn auto
message property _DE_Backpack_Menu2_Setup_Options_CombatDisableOff auto
message property _DE_Backpack_Menu2_Setup_WaitDisableOn auto
message property _DE_Backpack_Menu2_Setup_WaitDisableOff auto
message property _DE_Backpack_Menu2_Setup_Options auto
message property _DE_Backpack_Menu2_Setup_Options2 auto
message property _DE_Backpack_Menu2_Setup_Options3 auto
message property _DE_Backpack_Menu2_Setup_OptionsEffects auto
message property _DE_Backpack_Menu2_Setup_OptionsEffects2 auto
message property _DE_Backpack_Menu2_Setup_OptionsEffectsFrostShaderON auto
message property _DE_Backpack_Menu2_Setup_OptionsEffectsFrostShaderOFF auto
message property _DE_Backpack_Menu2_Setup_OptionsEffectsWetShaderON auto
message property _DE_Backpack_Menu2_Setup_OptionsEffectsWetShaderOFF auto
message property _DE_Backpack_Menu2_Setup_OptionsEffectsImageSpaceON auto
message property _DE_Backpack_Menu2_Setup_OptionsEffectsImageSpaceOFF auto
message property _DE_Backpack_Menu2_Setup_OptionsTutorialsON auto
message property _DE_Backpack_Menu2_Setup_OptionsTutorialsOFF auto
message property _DE_Backpack_Menu2_Setup_Compatibility auto
message property _DE_Backpack_Menu2_Setup_CompatibilityMovementON auto
message property _DE_Backpack_Menu2_Setup_CompatibilityMovementOFF auto
message property _DE_Backpack_Menu2_Setup_OptionsExposureRate auto 
message property _DE_Backpack_Menu2_Setup_OptionsTentEnabled auto
message property _DE_Backpack_Menu2_Setup_OptionsTentDisabled auto
message property _DE_Backpack_Menu2_Setup_OptionsFastTravelEnabled auto
message property _DE_Backpack_Menu2_Setup_OptionsFastTravelDisabled auto
message property _DE_Backpack_Menu2_Setup_OptionsWaterEnabled auto
message property _DE_Backpack_Menu2_Setup_OptionsWaterDisabled auto
message property _DE_Backpack_Menu2_Setup_OptionsUninstallNo auto
message property _DE_Backpack_Menu2_Setup_OptionsUninstallYes auto
message property _DE_Backpack_Menu2_Setup_OptionsFireLightOff auto
message property _DE_Backpack_Menu2_Setup_OptionsFireLightOn auto
message property _DE_Backpack_Menu2_Setup_Options_WoodHarvestCinematicOn auto
message property _DE_Backpack_Menu2_Setup_Options_WoodHarvestCinematicOff auto
message property _DE_Backpack_Menu2_HelpTroubleshooting auto
message property _DE_Backpack_Menu2_HelpTroubleshooting2 auto
message property _DE_Backpack_Menu2_HelpTroubleshootingEP auto
message property _DE_Backpack_Menu2_HelpTroubleshootingFT auto
message property _DE_Backpack_Menu2_HelpTroubleshootingSlow auto
message property _DE_Backpack_Menu2_HelpTroubleshootingStats auto
message property _DE_Backpack_Menu2_HelpTroubleshootingWait auto
message property _DE_Backpack_Menu2_HelpTroubleshootingWet auto
message property _DE_Backpack_Menu2_HelpTroubleshootingExit auto
message property _DE_Backpack_Menu2_HelpTroubleshootingConfirm auto
message property _DE_Backpack_Menu2_Setup_ExposureDeathOFF auto
message property _DE_Backpack_Menu2_Setup_ExposureDeathON auto
message property _DE_Backpack_Menu2_Setup_FastTravelOverview auto
message property _DE_Backpack_Menu2_Setup_FastTravelProcessingOFF auto
message property _DE_Backpack_Menu2_Setup_FastTravelProcessingON auto
message property _DE_Backpack_Menu2_Setup_Options_Notifications auto
message property _DE_Backpack_Menu2_Setup_Options_DialogueDisableOff auto
message property _DE_Backpack_Menu2_Setup_Options_DialogueDisableOn auto
message property _DE_Backpack_Menu2_Setup_RemoveGearOn auto
message property _DE_Backpack_Menu2_Setup_RemoveGearOff auto
message property _DE_Backpack_Menu2_Setup_Notifications_ConditionOn auto
message property _DE_Backpack_Menu2_Setup_Notifications_ConditionOff auto
message property _DE_Backpack_Menu2_Setup_Notifications_WeatherOn auto
message property _DE_Backpack_Menu2_Setup_Notifications_WeatherOff auto
message property _DE_Backpack_Menu2_Setup_Notifications_WEAROn auto
message property _DE_Backpack_Menu2_Setup_Notifications_WEAROff auto
message property _DE_Backpack_Menu2_Setup_Notifications_WeathersenseOn auto
message property _DE_Backpack_Menu2_Setup_Notifications_WeathersenseOff auto
message property _DE_Menu2Options_Compatibility_WACSuccess auto
message property _DE_Menu2Options_Compatibility_WACError auto
message property _DE_Backpack_Menu2_Setup_Compatibility_WAC auto
message property _DE_Backpack_Menu2_Setup_OptionsVampirismOn auto
message property _DE_Backpack_Menu2_Setup_OptionsVampirismOff auto
message property _DE_Backpack_Menu2_Setup_OptionsPlayerAnimationON auto
message property _DE_Backpack_Menu2_Setup_OptionsPlayerAnimationOFF auto
message property _DE_Backpack_Menu2_Setup_OptionsSoundEffectsON auto
message property _DE_Backpack_Menu2_Setup_OptionsSoundEffectsOFF auto
message property _DE_Backpack_Menu2_Setup_OptionsForceFeedbackON auto
message property _DE_Backpack_Menu2_Setup_OptionsForceFeedbackOFF auto
message property _DE_Backpack_Menu2_Setup_OptionsObjectPlacementSimple auto
message property _DE_Backpack_Menu2_Setup_OptionsObjectPlacementAdvanced auto
message property _DE_Backpack_Menu2_HelpTroubleshootingPlacement auto
message property _DE_Backpack_Menu2_Setup_Notifications_SystemOff auto
message property _DE_Backpack_Menu2_Setup_Notifications_SystemOn auto
message property _DE_Backpack_Menu2_Setup_Options_Camping_RescueAlone auto
message property _DE_Backpack_Menu2_Setup_Options_Camping_RescueFollower auto

message property _DE_TutorialsReset auto

message property _DE_ShutdownComplete auto
;#EndRegion

import utility

Event OnEffectStart(Actor akTarget, Actor akCaster)
		Menu2Setup()
endEvent

;#Region Main Menus
Function Menu2Setup()						
	int ibutton = _DE_Backpack_Menu2_Setup.Show()
	
	if ibutton == 0				;Hardcore Mode
		Menu2HardcoreMode()
	elseif ibutton == 1			;Classic Mode
		Menu2ClassicMode()
	elseif ibutton == 2			;Lite Mode
		Menu2LiteMode()
	elseif ibutton == 3			;Advanced Setup
		Menu2Options()
	elseif ibutton == 4			;Help
		Menu2HelpMain()
	elseif ibutton == 5			;Exit
		;Exit
	endif
	
endFunction

function Menu2Options()						
	int ibutton = _DE_Backpack_Menu2_Setup_Options.Show()
	
	if ibutton == 0
		Menu2Options_Exposure()
	elseif ibutton == 1
		Menu2Options_Camping()
	elseif ibutton == 2
		Menu2Options_Hardcore()
	elseif ibutton == 3
		Menu2Options2()
	elseif ibutton == 4
		Menu2Setup()		
	endif
endFunction

function Menu2Options2()					
	int ibutton = _DE_Backpack_Menu2_Setup_Options2.Show()
	
	if ibutton == 0
		Menu2Options_FastTravelOverview()
	elseif ibutton == 1
		Menu2Options_Effects()
	elseif ibutton == 2
		Menu2Options_Notifications()
	elseif ibutton == 3
		Menu2Options3()
	elseif ibutton == 4
		Menu2Setup()		
	endif
endFunction

function Menu2Options3()					
	int ibutton = _DE_Backpack_Menu2_Setup_Options3.Show()
	
	if ibutton == 0
		Menu2Options_Tutorials()
	elseif ibutton == 1
		Menu2Options_Compatibility()
	elseif ibutton == 2
		Uninstall()
	elseif ibutton == 3
		Menu2Options()		
	else
		Menu2Setup()	
	endif
endFunction

function Menu2Options_Exposure()						;Approved 2.0
	int ibutton = _DE_Backpack_Menu2_Setup_Options_Exposure.Show()
	if ibutton == 0
		Menu2Options_ExposureRate()
	elseif ibutton == 1
		Menu2Options_ExposureCombat()
	elseif ibutton == 2
		Menu2Options_ExposureDialogue()
	elseif ibutton == 3
		Menu2Options_Water()
	elseif ibutton == 4
		Menu2Options_Death()
	elseif ibutton == 5
		Menu2Options_Vampirism()
	Else
		Menu2Options()
	EndIf
EndFunction

function Menu2Options_Camping()
	int ibutton = _DE_Backpack_Menu2_Setup_Options_Camping.Show()
	if ibutton == 0
		Menu2Options_AxeDurability()
	elseif ibutton == 1
		Menu2Options_RemoveGearInTents()
	elseif ibutton == 2
		Menu2Options_FireKitLighting()
	elseif ibutton == 3
		Menu2Options_ObjectPlacement()
	elseif ibutton == 4
		Menu2Options_Camping2()
	elseif ibutton == 5
		Menu2Options()
	EndIf
EndFunction

function Menu2Options_Camping2()
	int ibutton = _DE_Backpack_Menu2_Setup_Options_Camping2.Show()
	if ibutton == 0
		Menu2Options_Camping_RescueAlone()
	elseif ibutton == 1
		Menu2Options_Camping_RescueFollower()
	elseif ibutton == 2
		Menu2Options_Camping()
	elseif ibutton == 3
		Menu2Options()
	endif
endFunction

function Menu2Options_Camping_RescueAlone()
	int ibutton = _DE_Backpack_Menu2_Setup_Options_Camping_RescueAlone.Show(_DE_RescueChanceAlone.GetValue() * 100)
	if ibutton == 0
		;- 10
		_DE_RescueChanceAlone.SetValue(_DE_RescueChanceAlone.GetValue() - 0.1)
		if _DE_RescueChanceAlone.GetValue() < 0.0
			_DE_RescueChanceAlone.SetValue(0.0)
		endif
		Menu2Options_Camping_RescueAlone()
	elseif ibutton == 1
		;-
		_DE_RescueChanceAlone.SetValue(_DE_RescueChanceAlone.GetValue() - 0.01)
		if _DE_RescueChanceAlone.GetValue() < 0.0
			_DE_RescueChanceAlone.SetValue(0.0)
		endif
		Menu2Options_Camping_RescueAlone()
	elseif ibutton == 2
		;+
		_DE_RescueChanceAlone.SetValue(_DE_RescueChanceAlone.GetValue() + 0.01)
		if _DE_RescueChanceAlone.GetValue() > 1.0
			_DE_RescueChanceAlone.SetValue(1.0)
		endif
		Menu2Options_Camping_RescueAlone()
	elseif ibutton == 3
		;+ 10
		_DE_RescueChanceAlone.SetValue(_DE_RescueChanceAlone.GetValue() + 0.1)
		if _DE_RescueChanceAlone.GetValue() > 1.0
			_DE_RescueChanceAlone.SetValue(1.0)
		endif
		Menu2Options_Camping_RescueAlone()
	else
		Menu2Options_Camping2()
	endif
endFunction

function Menu2Options_Camping_RescueFollower()
	int ibutton = _DE_Backpack_Menu2_Setup_Options_Camping_RescueFollower.Show(_DE_RescueChanceFollower.GetValue() * 100)
	if ibutton == 0
		;- 10
		_DE_RescueChanceFollower.SetValue(_DE_RescueChanceFollower.GetValue() - 0.1)
		if _DE_RescueChanceFollower.GetValue() < 0.0
			_DE_RescueChanceFollower.SetValue(0.0)
		endif
		Menu2Options_Camping_RescueFollower()
	elseif ibutton == 1
		;-
		_DE_RescueChanceFollower.SetValue(_DE_RescueChanceFollower.GetValue() - 0.01)
		if _DE_RescueChanceFollower.GetValue() < 0.0
			_DE_RescueChanceFollower.SetValue(0.0)
		endif
		Menu2Options_Camping_RescueFollower()
	elseif ibutton == 2
		;+
		_DE_RescueChanceFollower.SetValue(_DE_RescueChanceFollower.GetValue() + 0.01)
		if _DE_RescueChanceFollower.GetValue() > 1.0
			_DE_RescueChanceFollower.SetValue(1.0)
		endif
		Menu2Options_Camping_RescueFollower()
	elseif ibutton == 3
		;+ 10
		_DE_RescueChanceFollower.SetValue(_DE_RescueChanceFollower.GetValue() + 0.1)
		if _DE_RescueChanceFollower.GetValue() > 1.0
			_DE_RescueChanceFollower.SetValue(1.0)
		endif
		Menu2Options_Camping_RescueFollower()
	else
		Menu2Options_Camping2()
	endif
endFunction

function Menu2Options_Hardcore()
	int ibutton = _DE_Backpack_Menu2_Setup_OptionsHardcore.Show()
	if ibutton == 0
		Menu2Options_Hardcore_BEAR()
	elseif ibutton == 1
		Menu2Options_Hardcore_NoWait()
	elseif ibutton == 2
		Menu2Options_Hardcore_Movement()
	elseif ibutton == 3
		Menu2Options()
	endif
endFunction

function Menu2Options_FastTravelOverview()
	int ibutton = _DE_Backpack_Menu2_Setup_FastTravelOverview.Show()
	if ibutton == 0
		Menu2Options_FastTravel_Management()
	elseif ibutton == 1
		Menu2Options_FastTravel_Toggle()
	elseif ibutton == 2
		Menu2Options_FastTravel_AxeRequirement()
	else
		Menu2Options2()
	endif
endFunction

function Menu2Options_Effects()
	int ibutton = _DE_Backpack_Menu2_Setup_OptionsEffects.Show()
	
	if ibutton == 0
		Menu2Options_Effects_FrostShader()
	elseif ibutton == 1
		Menu2Options_Effects_WetShader()
	elseif ibutton == 2
		Menu2Options_Effects_ImageSpace()
	;elseif ibutton == 3
	;	Menu2Options_WoodHarvesting()
	elseif ibutton == 3
		Menu2Options_Effects2()
	elseif ibutton == 4
		Menu2Options2()
	endif
endFunction

function Menu2Options_Effects2()
	int ibutton = _DE_Backpack_Menu2_Setup_OptionsEffects2.Show()
	
	if ibutton == 0
		Menu2Options_Effects_ForceFeedback()
	elseif ibutton == 1
		Menu2Options_Effects_SoundEffects()
	elseif ibutton == 2
		Menu2Options_Effects_PlayerAnimation()
	elseif ibutton == 3
		Menu2Options_Effects()
	elseif ibutton == 4
		Menu2Options2()
	endif
endFunction

function Menu2Options_Notifications()
	
	int ibutton = _DE_Backpack_Menu2_Setup_Options_Notifications.Show()
	
	if ibutton == 0
		Menu2Options_Notifications_ConditionChanges()
	elseif ibutton == 1
		Menu2Options_Notifications_WeatherChanges()
	elseif ibutton == 2
		Menu2Options_Notifications_WEAR()
	elseif ibutton == 3
		Menu2Options_Notifications_Weathersense()
	elseif ibutton == 4
		Menu2Options_Notifications_System()
	else
		Menu2Options2()
	endif
	
endFunction

function Menu2Options_Compatibility()
	int ibutton = _DE_Backpack_Menu2_Setup_Compatibility.Show()
	if ibutton == 0
		Menu2Options_Compatibility_WetandCold()
	;elseif ibutton == 1
	;	Menu2Options_Compatibility_GetSnowy()
	else
		Menu2Options3()
	endif
endFunction
;#EndRegion

;#Region Exposure Menus									;Approved 2.0
function Menu2Options_ExposureRate()					;Approved 2.0
	int ibutton = _DE_Backpack_Menu2_Setup_OptionsExposureRate.Show(pMainScript.pSetting_ExposureRate)
	
	if ibutton == 0		;Decrease
		if pMainScript.pSetting_ExposureRate > 0.0
			pMainScript.pSetting_ExposureRate -= 0.1
			Menu2Options_ExposureRate()
		else
			Menu2Options_ExposureRate()
		endif
	elseif ibutton == 1	;Increase
		if pMainScript.pSetting_ExposureRate < 4.0
			pMainScript.pSetting_ExposureRate += 0.1
			Menu2Options_ExposureRate()
		else
			Menu2Options_ExposureRate()
		endif
	elseif ibutton == 2 ;Exit
		Menu2Options_Exposure()
	endif
endFunction
	
function Menu2Options_ExposureCombat()					;Approved 2.0
	if pMainScript.pSetting_CombatDisable == true
		int ibutton = _DE_Backpack_Menu2_Setup_Options_CombatDisableOn.Show()
		if ibutton == 0
			pMainScript.pSetting_CombatDisable = false
			Menu2Options_ExposureCombat()
		elseif ibutton == 1
			Menu2Options_Exposure()
		endif
	elseif pMainScript.pSetting_CombatDisable == false
		int ibutton = _DE_Backpack_Menu2_Setup_Options_CombatDisableOff.Show()
		if ibutton == 0
			pMainScript.pSetting_CombatDisable = true
			Menu2Options_ExposureCombat()
		elseif ibutton == 1
			Menu2Options_Exposure()
		endif
	endif
endFunction	

function Menu2Options_ExposureDialogue()				;Approved 2.0
	
	if _DE_Setting_DialogueStop.GetValueInt() == 2
		int ibutton = _DE_Backpack_Menu2_Setup_Options_DialogueDisableOn.Show()
		if ibutton == 0
			_DE_Setting_DialogueStop.SetValue(1.0)
			Menu2Options_ExposureDialogue()
		elseif ibutton == 1
			Menu2Options_Exposure()
		endif
	elseif _DE_Setting_DialogueStop.GetValueInt() == 1
		int ibutton = _DE_Backpack_Menu2_Setup_Options_DialogueDisableOff.Show()
		if ibutton == 0
			_DE_Setting_DialogueStop.SetValue(2.0)
			Menu2Options_ExposureDialogue()
		elseif ibutton == 1
			Menu2Options_Exposure()
		endif
	endif
	
endFunction

function Menu2Options_Water()							;Approved 2.0
	if _DE_Setting_Water.GetValueInt() == 2
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsWaterEnabled.Show()
		if ibutton == 0		;Change
			_DE_Setting_Water.SetValue(1)
			Menu2Options_Water()
		elseif ibutton == 1
			Menu2Options_Exposure()
		endif
	else
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsWaterDisabled.Show()
		if ibutton == 0		;Change
			_DE_Setting_Water.SetValue(2)
			Menu2Options_Water()
		elseif ibutton == 1
			Menu2Options_Exposure()
		endif
	endif
endFunction

function Menu2Options_Death()							;Approved 2.0
	if pMainScript.pSetting_PlayerDeath == true
		int ibutton = _DE_Backpack_Menu2_Setup_ExposureDeathON.Show()
		if ibutton == 0
			pMainScript.pSetting_PlayerDeath = false
			Menu2Options_Death()
		elseif ibutton == 1
			Menu2Options_Exposure()
		endif
	elseif pMainScript.pSetting_PlayerDeath == false
		int ibutton = _DE_Backpack_Menu2_Setup_ExposureDeathOFF.Show()
		if ibutton == 0
			pMainScript.pSetting_PlayerDeath = true
			Menu2Options_Death()
		elseif ibutton == 1
			Menu2Options_Exposure()
		endif
	endif
endFunction

function Menu2Options_Vampirism()						;Approved 2.0
	if pMainScript.pSetting_VampireImmunity == true
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsVampirismOn.Show()
		if ibutton == 0
			pMainScript.pSetting_VampireImmunity = false
			Menu2Options_Vampirism()
		elseif ibutton == 1
			Menu2Options_Exposure()
		endif
	else
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsVampirismOff.Show()
		if ibutton == 0
			pMainScript.pSetting_VampireImmunity = true
			Menu2Options_Vampirism()
		elseif ibutton == 1
			Menu2Options_Exposure()
		endif
	endif
endFunction
;#EndRegion

;#Region Camping Menus									;Approved 2.0
function Menu2Options_AxeDurability()					;Approved 2.0
	if _DE_Setting_Tent.GetValueInt() == 2
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsTentEnabled.Show()
		if ibutton == 0		;Change
			_DE_Setting_Tent.SetValue(1)
			Menu2Options_AxeDurability()
		elseif ibutton == 1
			Menu2Options_Camping()
		endif			
	else
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsTentDisabled.Show()
		if ibutton == 0		;Change
			_DE_Setting_Tent.SetValue(2)
			Menu2Options_AxeDurability()
		elseif ibutton == 1
			Menu2Options_Camping()
		endif		
	endif
endFunction

function Menu2Options_RemoveGearInTents()				;Approved 2.0
	if _DE_Setting_CampingArmorTakeOff.GetValueInt() == 2
		int ibutton = _DE_Backpack_Menu2_Setup_RemoveGearOn.Show()
		if ibutton == 0
			_DE_Setting_CampingArmorTakeOff.SetValue(1.0)
			Menu2Options_RemoveGearInTents()
		elseif ibutton == 1
			Menu2Options_Camping()
		endif
	else
		int ibutton = _DE_Backpack_Menu2_Setup_RemoveGearOff.Show()
		if ibutton == 0
			_DE_Setting_CampingArmorTakeOff.SetValue(2.0)
			Menu2Options_RemoveGearInTents()
		elseif ibutton == 1
			Menu2Options_Camping()
		endif
	endif
endFunction

function Menu2Options_FireKitLighting()					;Approved 2.0
	if _DE_Setting_Lighting.GetValueInt() == 2
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsFireLightOn.Show()
		if ibutton == 0
			_DE_Setting_Lighting.SetValue(1)
			Menu2Options_FireKitLighting()
		elseif ibutton == 1
			Menu2Options_Camping()
		endif
	elseif _DE_Setting_Lighting.GetValueInt() == 1
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsFireLightOff.Show()
		if ibutton == 0
			_DE_Setting_Lighting.SetValue(2)
			Menu2Options_FireKitLighting()
		elseif ibutton == 1
			Menu2Options_Camping()
		endif
	endif
endFunction

function Menu2Options_ObjectPlacement()
	if _DE_Setting_SimplePlacement.GetValueInt() == 2
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsObjectPlacementSimple.Show()
		if ibutton == 0
			_DE_Setting_SimplePlacement.SetValue(1)
			Menu2Options_ObjectPlacement()
		elseif ibutton == 1
			Menu2Options_Camping()
		endif
	elseif _DE_Setting_Lighting.GetValueInt() == 1
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsObjectPlacementAdvanced.Show()
		if ibutton == 0
			_DE_Setting_SimplePlacement.SetValue(2)
			Menu2Options_ObjectPlacement()
		elseif ibutton == 1
			Menu2Options_Camping()
		endif
	endif
endFunction

;#EndRegion

;#Region Immersion Menus								;Approved 2.0
function Menu2Options_Hardcore_BEAR()					;Approved 2.0
	if ClothingMonitorRef.pSetting_Armor == true
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsHardcore_BEAREnabled.Show()
		if ibutton == 0
			ClothingMonitorRef.pSetting_Armor = false
			ClothingMonitorRef.WEARDisabled()
			Menu2Options_Hardcore_BEAR()
		elseif ibutton == 1
			Menu2Options_Hardcore_Bear_Default()
		elseif ibutton == 2
			Menu2Options_Hardcore()
		endif
	elseif ClothingMonitorRef.pSetting_Armor == false
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsHardcore_BEARDisabled.Show()
		if ibutton == 0
			ClothingMonitorRef.pSetting_Armor = true
			Game.DisablePlayerControls()			;Force the player out of the menus.
			Game.EnablePlayerControls()
			ClothingMonitorRef.WEAREnabledArray()
		elseif ibutton == 1
			Menu2Options_Hardcore_Bear_Default()
		elseif ibutton == 2
			Menu2Options_Hardcore()
		endif
	endif
endFunction

Function Menu2Options_Hardcore_Bear_Default()			;Approved 2.0
	int ibuttontwo = _DE_WearSelectMenu_RestoreDefaults.Show()
	if ibuttontwo == 0
		Game.DisablePlayerControls()			;Force the player out of the menus.
		Game.EnablePlayerControls()
		ClothingMonitorRef.WEAREnabledArray()
		_DE_WearSelectMenu_RestoreDefaultsConfirm.Show()
	else
		Menu2Options_Hardcore_BEAR()
	endif
endFunction

function Menu2Options_Hardcore_NoWait()					;Approved 2.0
	if pMainScript.pSetting_NoWait == true
		int ibutton = _DE_Backpack_Menu2_Setup_WaitDisableOn.Show()
		if ibutton == 0
			pMainScript.pSetting_NoWait = false
			Menu2Options_Hardcore_NoWait()
		elseif ibutton == 1
			Menu2Options_Hardcore()
		endif
	elseif pMainScript.pSetting_NoWait == false
		int ibutton = _DE_Backpack_Menu2_Setup_WaitDisableOff.Show()
		if ibutton == 0
			pMainScript.pSetting_NoWait = true
			Menu2Options_Hardcore_NoWait()
		elseif ibutton == 1
			Menu2Options_Hardcore()
		endif
	endif
endFunction

function Menu2Options_Hardcore_Movement()				;Approved 2.0
	if _DE_Setting_MovementPenalty.GetValueInt() == 2
		int ibutton = _DE_Backpack_Menu2_Setup_CompatibilityMovementON.Show()
		if ibutton == 0
			_DE_Setting_MovementPenalty.SetValue(1.0)
			Menu2Options_Hardcore_Movement()
		elseif ibutton == 1
			Menu2Options_Hardcore()
		endif
	else
		int ibutton = _DE_Backpack_Menu2_Setup_CompatibilityMovementOFF.Show()
		if ibutton == 0
			_DE_Setting_MovementPenalty.SetValue(2.0)
			Menu2Options_Hardcore_Movement()
		elseif ibutton == 1
			Menu2Options_Hardcore()
		endif
	endif
endFunction
;#EndRegion

;#Region Fast Travel Menus								;Approved 2.0
function Menu2Options_FastTravel_Management()			;Approved 2.0
	if pMainScript.pSetting_FastTravelProcessing == true
		int ibutton = _DE_Backpack_Menu2_Setup_FastTravelProcessingON.Show()
		if ibutton == 0
			pMainScript.pSetting_FastTravelProcessing = false
			Game.EnableFastTravel()
			Menu2Options_FastTravel_Management()
		elseif ibutton == 1
			Menu2Options_FastTravelOverview()
		endif
	else
		int ibutton = _DE_Backpack_Menu2_Setup_FastTravelProcessingOFF.Show()
		if ibutton == 0
			pMainScript.pSetting_FastTravelProcessing = true
			Menu2Options_FastTravel_Management()
		elseif ibutton == 1
			Menu2Options_FastTravelOverview()
		endif
	endif
endFunction

function Menu2Options_FastTravel_Toggle()				;Approved 2.0
	if pMainScript.pSetting_FastTravelDisable == true
		int ibutton = _DE_Backpack_Menu2_Setup_FastTravelDisableOn.Show()
		if ibutton == 0
			pMainScript.pSetting_FastTravelDisable = false
			Menu2Options_FastTravel_Toggle()
		elseif ibutton == 1
			Menu2Options_FastTravelOverview()
		endif
	elseif pMainScript.pSetting_FastTravelDisable == false
		int ibutton = _DE_Backpack_Menu2_Setup_FastTravelDisableOff.Show()
		if ibutton == 0
			pMainScript.pSetting_FastTravelDisable = true
			Menu2Options_FastTravel_Toggle()
		elseif ibutton == 1
			Menu2Options_FastTravelOverview()
		endif
	endif
endFunction

function Menu2Options_FastTravel_AxeRequirement()		;Approved 2.0
	if _DE_Setting_FastTravel.GetValueInt() == 2
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsFastTravelEnabled.Show()
		if ibutton == 0		;Change
			_DE_Setting_FastTravel.SetValue(1)
			Menu2Options_FastTravel_AxeRequirement()
		elseif ibutton == 1
			Menu2Options_FastTravelOverview()
		endif			
	else
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsFastTravelDisabled.Show()
		if ibutton == 0		;Change
			_DE_Setting_FastTravel.SetValue(2)
			Menu2Options_FastTravel_AxeRequirement()
		elseif ibutton == 1
			Menu2Options_FastTravelOverview()
		endif		
	endif
endFunction
;#EndRegion

;#Region Effects										;Approved 2.0
function Menu2Options_Effects_FrostShader()				;Approved 2.0
	
	if pMainScript.pSetting_EffectFrostShader == true
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsEffectsFrostShaderON.Show()
		
		if ibutton == 0
			pMainScript.pSetting_EffectFrostShader = false
			Menu2Options_Effects_FrostShader()
		elseif ibutton == 1
			Menu2Options_Effects()
		endif
		
	else
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsEffectsFrostShaderOFF.Show()
	
		if ibutton == 0
			pMainScript.pSetting_EffectFrostShader = true
			Menu2Options_Effects_FrostShader()
		elseif ibutton == 1
			Menu2Options_Effects()
		endif
	endif
endFunction

function Menu2Options_Effects_WetShader()				;Approved 2.0
	
	if pMainScript.pSetting_EffectWetShader == true
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsEffectsWetShaderON.Show()
		
		if ibutton == 0
			pMainScript.pSetting_EffectWetShader = false
			Menu2Options_Effects_WetShader()
		elseif ibutton == 1
			Menu2Options_Effects()
		endif
		
	else
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsEffectsWetShaderOFF.Show()
	
		if ibutton == 0
			pMainScript.pSetting_EffectWetShader = true
			Menu2Options_Effects_WetShader()
		elseif ibutton == 1
			Menu2Options_Effects()
		endif
	endif
endFunction

function Menu2Options_Effects_ImageSpace()				;Approved 2.0
	if pMainScript.pSetting_FullScreenEffects == true
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsEffectsImageSpaceON.Show()
		
		if ibutton == 0
			pMainScript.pSetting_FullScreenEffects = false
			Menu2Options_Effects_ImageSpace()
		elseif ibutton == 1
			Menu2Options_Effects()
		endif
		
	else
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsEffectsImageSpaceOFF.Show()
	
		if ibutton == 0
			pMainScript.pSetting_FullScreenEffects = true
			Menu2Options_Effects_ImageSpace()
		elseif ibutton == 1
			Menu2Options_Effects()
		endif
	endif
endFunction

function Menu2Options_WoodHarvesting()					;Approved 2.0
	if _DE_Setting_WoodCinematic.GetValueInt() == 2
		int ibutton = _DE_Backpack_Menu2_Setup_Options_WoodHarvestCinematicOn.Show()
		if ibutton == 0
			_DE_Setting_WoodCinematic.SetValue(1)
			Menu2Options_WoodHarvesting()
		elseif ibutton == 1
			Menu2Options_Effects()
		endif
	elseif _DE_Setting_WoodCinematic.GetValueInt() == 1
		int ibutton = _DE_Backpack_Menu2_Setup_Options_WoodHarvestCinematicOff.Show()
		if ibutton == 0
			_DE_Setting_WoodCinematic.SetValue(2)
			Menu2Options_WoodHarvesting()
		elseif ibutton == 1
			Menu2Options_Effects()
		endif
	endif
endFunction

function Menu2Options_Effects_ForceFeedback()					;Approved 2.1
	if _DE_Setting_ForceFeedback.GetValueInt() == 2
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsForceFeedbackON.Show()
		if ibutton == 0
			_DE_Setting_ForceFeedback.SetValue(1)
			Menu2Options_Effects_ForceFeedback()
		elseif ibutton == 1
			Menu2Options_Effects2()
		endif
	elseif _DE_Setting_ForceFeedback.GetValueInt() == 1
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsForceFeedbackOFF.Show()
		if ibutton == 0
			_DE_Setting_ForceFeedback.SetValue(2)
			Menu2Options_Effects_ForceFeedback()
		elseif ibutton == 1
			Menu2Options_Effects2()
		endif
	endif
endFunction

function Menu2Options_Effects_SoundEffects()					;Approved 2.1
	if _DE_Setting_SoundEffects.GetValueInt() == 2
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsSoundEffectsON.Show()
		if ibutton == 0
			_DE_Setting_SoundEffects.SetValue(1)
			Menu2Options_Effects_SoundEffects()
		elseif ibutton == 1
			Menu2Options_Effects2()
		endif
	elseif _DE_Setting_SoundEffects.GetValueInt() == 1
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsSoundEffectsOFF.Show()
		if ibutton == 0
			_DE_Setting_SoundEffects.SetValue(2)
			Menu2Options_Effects_SoundEffects()
		elseif ibutton == 1
			Menu2Options_Effects2()
		endif
	endif
endFunction

function Menu2Options_Effects_PlayerAnimation()					;Approved 2.1
	if _DE_Setting_Animation.GetValueInt() == 2
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsPlayerAnimationON.Show()
		if ibutton == 0
			_DE_Setting_Animation.SetValue(1)
			Menu2Options_Effects_PlayerAnimation()
		elseif ibutton == 1
			Menu2Options_Effects2()
		endif
	elseif _DE_Setting_Animation.GetValueInt() == 1
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsPlayerAnimationOFF.Show()
		if ibutton == 0
			_DE_Setting_Animation.SetValue(2)
			Menu2Options_Effects_PlayerAnimation()
		elseif ibutton == 1
			Menu2Options_Effects2()
		endif
	endif
endFunction
;#EndRegion

function Menu2Options_Tutorials()						;Approved 2.0
	if pMainScript.pSetting_Tutorials == true
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsTutorialsON.Show()
		if ibutton == 0
			pMainScript.pSetting_Tutorials = false
			Menu2Options_Tutorials()
		elseif ibutton == 1
			_DE_HelpDone_ExposurePoints.SetValue(1)
			_DE_HelpDone_Vampirism.SetValue(1)
			_DE_HelpDone_Wet.SetValue(1)
			_DE_HelpDone_Visualize.SetValue(1)
			_DE_HelpDone_PlacementError.SetValue(1)
			_DE_HelpDone_Tents.SetValue(1)
			_DE_TutorialsReset.Show()
			Menu2Options_Tutorials()
		elseif ibutton == 2
			Menu2Options3()
		endif
	elseif pMainScript.pSetting_Tutorials == false
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsTutorialsOFF.Show()
		if ibutton == 0
			pMainScript.pSetting_Tutorials = true
			Menu2Options_Tutorials()
		elseif ibutton == 1
			_DE_HelpDone_ExposurePoints.SetValue(1)
			_DE_HelpDone_Vampirism.SetValue(1)
			_DE_HelpDone_Wet.SetValue(1)
			_DE_HelpDone_Visualize.SetValue(1)
			_DE_HelpDone_PlacementError.SetValue(1)
			_DE_HelpDone_Tents.SetValue(1)
			_DE_TutorialsReset.Show()
			Menu2Options_Tutorials()
		elseif ibutton == 2
			Menu2Options3()
		endif
	endif
endFunction		

;#Region Notifications									;Approved 2.0
function Menu2Options_Notifications_ConditionChanges()	;Approved 2.0
	if _DE_Setting_ConditionMsg.GetValueInt() == 2
		int ibutton = _DE_Backpack_Menu2_Setup_Notifications_ConditionOn.Show()
		if ibutton == 0
			_DE_Setting_ConditionMsg.SetValue(1.0)
			Menu2Options_Notifications_ConditionChanges()
		elseif ibutton == 1
			Menu2Options_Notifications()
		endif
	else
		int ibutton = _DE_Backpack_Menu2_Setup_Notifications_ConditionOff.Show()
		if ibutton == 0
			_DE_Setting_ConditionMsg.SetValue(2.0)
			Menu2Options_Notifications_ConditionChanges()
		elseif ibutton == 1
			Menu2Options_Notifications()
		endif
	endif
endFunction

function Menu2Options_Notifications_WeatherChanges()	;Approved 2.0
	if pMainScript.pSetting_MsgWeather == true
		int ibutton = _DE_Backpack_Menu2_Setup_Notifications_WeatherOn.Show()
		if ibutton == 0
			pMainScript.pSetting_MsgWeather = false
			Menu2Options_Notifications_WeatherChanges()
		elseif ibutton == 1
			Menu2Options_Notifications()
		endif
	else
		int ibutton = _DE_Backpack_Menu2_Setup_Notifications_WeatherOff.Show()
		if ibutton == 0
			pMainScript.pSetting_MsgWeather = true
			Menu2Options_Notifications_WeatherChanges()
		elseif ibutton == 1
			Menu2Options_Notifications()
		endif
	endif
endFunction

function Menu2Options_Notifications_WEAR()				;Approved 2.0
	if _DE_Setting_WEARMsg.GetValueInt() == 2
		int ibutton = _DE_Backpack_Menu2_Setup_Notifications_WEAROn.Show()
		if ibutton == 0
			_DE_Setting_WEARMsg.SetValue(1.0)
			Menu2Options_Notifications_WEAR()
		elseif ibutton == 1
			Menu2Options_Notifications()
		endif
	else
		int ibutton = _DE_Backpack_Menu2_Setup_Notifications_WEAROff.Show()
		if ibutton == 0
			_DE_Setting_WEARMsg.SetValue(2.0)
			Menu2Options_Notifications_WEAR()
		elseif ibutton == 1
			Menu2Options_Notifications()
		endif
	endif
endFunction

function Menu2Options_Notifications_Weathersense()		;Approved 2.0
	if _DE_Setting_EPValueMsg.GetValueInt() == 2
		int ibutton = _DE_Backpack_Menu2_Setup_Notifications_WeathersenseOn.Show()
		if ibutton == 0
			_DE_Setting_EPValueMsg.SetValue(1.0)
			Menu2Options_Notifications_Weathersense()
		elseif ibutton == 1
			Menu2Options_Notifications()
		endif
	else
		int ibutton = _DE_Backpack_Menu2_Setup_Notifications_WeathersenseOff.Show()
	
		if ibutton == 0
			_DE_Setting_EPValueMsg.SetValue(2.0)
			Menu2Options_Notifications_Weathersense()
		elseif ibutton == 1
			Menu2Options_Notifications()
		endif
	endif
endFunction

function Menu2Options_Notifications_System()		;Approved 2.2
	if _DE_Setting_EPValueMsg.GetValueInt() == 2
		int ibutton = _DE_Backpack_Menu2_Setup_Notifications_SystemOn.Show()
		if ibutton == 0
			_DE_Setting_SystemMsg.SetValue(1.0)
			Menu2Options_Notifications_System()
		elseif ibutton == 1
			Menu2Options_Notifications()
		endif
	else
		int ibutton = _DE_Backpack_Menu2_Setup_Notifications_SystemOff.Show()
		if ibutton == 0
			_DE_Setting_SystemMsg.SetValue(2.0)
			Menu2Options_Notifications_System()
		elseif ibutton == 1
			Menu2Options_Notifications()
		endif
	endif
endFunction

;#EndRegion

;#Region Compatibility									;Approved 2.1
function Menu2Options_Compatibility_WetandCold()		;Approved 2.1
	int ibutton = _DE_Backpack_Menu2_Setup_Compatibility_WAC.Show()
	if ibutton == 0
		Menu2Options_Compatibility()
	endif
endFunction
;#EndRegion

;#Region Presets
function Menu2HardcoreMode()
	int ibutton = _DE_Backpack_Menu2_Setup_HardcoreMode.Show()
	
	if ibutton == 0		;Yes
		pMainScript.pSetting_PlayerDeath = true
		ClothingMonitorRef.pSetting_Armor = true										;W.E.A.R. Enabled
		pMainScript.pSetting_ExposureRate = 1.0											;Exposure Rate: 1.0x
		pMainScript.pSetting_FastTravelDisable = true
		pMainScript.pSetting_NoWait = false
		_DE_Setting_Lighting.SetValue(2)												;Manual Fire Kit lighting on
		_DE_Setting_FastTravel.SetValue(1)												;Fast Travel Requirement: On
		_DE_Setting_Tent.SetValue(2)													;Tent Durability: On
		_DE_Setting_Water.SetValue(2)													;Water Lethality: On
		Game.DisablePlayerControls()			;Force the player out of the menus.
		Game.EnablePlayerControls()
		ClothingMonitorRef.WEAREnabledArray()											;Set up W.E.A.R. values
		_DE_Backpack_Menu2_HardcoreModeApply.Show()
	elseif ibutton == 1
		Menu2Setup()	;No
	endif
endfunction

function Menu2ClassicMode()
	int ibutton = _DE_Backpack_Menu2_Setup_ClassicMode.Show()
	
	if ibutton == 0		;Yes
		pMainScript.pSetting_PlayerDeath = true
		ClothingMonitorRef.pSetting_Armor = false										;W.E.A.R. Disabled
		pMainScript.pSetting_ExposureRate = 1.0											;Exposure Rate: 1.0x
		pMainScript.pSetting_FastTravelDisable = false
		pMainScript.pSetting_NoWait = false
		_DE_Setting_Lighting.SetValue(1)												;Manual Fire Kit lighting Off
		_DE_Setting_FastTravel.SetValue(2)												;Fast Travel Requirement: On
		_DE_Setting_Tent.SetValue(2)													;Tent Durability: On
		_DE_Setting_Water.SetValue(2)													;Water Lethality: On
		ClothingMonitorRef.WEARDisabled()												;Ensure proper exposure protection values
		_DE_Backpack_Menu2_ClassicModeApply.Show()
	elseif ibutton == 1
		Menu2Setup()	;No
	endif
endfunction

function Menu2LiteMode()
	int ibutton = _DE_Backpack_Menu2_Setup_LiteMode.Show()
	
	if ibutton == 0		;Yes
		pMainScript.pSetting_PlayerDeath = false
		ClothingMonitorRef.pSetting_Armor = false										;W.E.A.R. Disabled
		pMainScript.pSetting_ExposureRate = 0.8											;Exposure Rate: 0.8x
		pMainScript.pSetting_FastTravelDisable = false
		pMainScript.pSetting_NoWait = false
		_DE_Setting_Lighting.SetValue(1)												;Manual Fire Kit lighting Off
		_DE_Setting_FastTravel.SetValue(1)												;Fast Travel Requirement: Off
		_DE_Setting_Tent.SetValue(1)													;Tent Durability: Off
		_DE_Setting_Water.SetValue(1)													;Water Lethality: Off
		ClothingMonitorRef.WEARDisabled()												;Ensure proper exposure protection values
		_DE_Backpack_Menu2_LiteModeApply.Show()
	elseif ibutton == 1
		Menu2Setup()	;No
	endif
endfunction
;#EndRegion	

;#Region Help
function Menu2HelpMain()
	
	int ibutton = _DE_Backpack_Menu2_HelpMain.Show()
	
	if ibutton == 0
		Menu2HelpExposure()
	elseif ibutton == 1
		_DE_Backpack_Menu2_HelpFT.Show()
		Menu2HelpMain()
	elseif ibutton == 2
		_DE_Backpack_Menu2_HelpWater.Show()
		Menu2HelpMain()
	elseif ibutton == 3
		_DE_Backpack_Menu2_HelpCamping.Show()
		Menu2HelpMain()
	elseif ibutton == 4
		Menu2Troubleshooting()
	elseif ibutton == 5
		Menu2Setup()
	endif	

endFunction	

function Menu2Troubleshooting()
	int ibutton = _DE_Backpack_Menu2_HelpTroubleshooting.Show()
	if ibutton == 0
		Menu2TroubleshootingWet()
	elseif ibutton == 1
		Menu2TroubleshootingStats()
	elseif ibutton == 2
		Menu2TroubleshootingSlow()
	elseif ibutton == 3
		Menu2TroubleshootingEP()
	elseif ibutton == 4
		Menu2Troubleshooting2()
	elseif ibutton == 5
		Menu2HelpMain()
	endif
endFunction

Function Menu2Troubleshooting2()
	int ibutton = _DE_Backpack_Menu2_HelpTroubleshooting2.Show()
	if ibutton == 0
		Menu2TroubleshootingFT()
	elseif ibutton == 1
		Menu2TroubleshootingWait()
	elseif ibutton == 2
		Menu2TroubleshootingPlacement()
	elseif ibutton == 3
		Menu2Troubleshooting()
	elseif ibutton == 4
		Menu2HelpMain()
	endif
endFunction

function Menu2TroubleshootingWet()
	int ibutton = _DE_Backpack_Menu2_HelpTroubleshootingWet.Show()
	if ibutton == 0
		Game.DisablePlayerControls()
		Game.EnablePlayerControls()
		utility.wait(1)
		Game.GetPlayer().RemoveSpell(_DE_WetState_Spell)
		Game.GetPlayer().RemoveSpell(_DE_WetState_Spell1)
		Game.GetPlayer().RemoveSpell(_DE_WetState_Spell2)
		Game.GetPlayer().RemoveSpell(_DE_WetState_Spell3)
		Game.GetPlayer().RemoveSpell(_DE_ColdWater_1)
		Game.GetPlayer().RemoveSpell(_DE_ColdWater_2)
		Game.GetPlayer().RemoveSpell(_DE_ColdWater_3)
		Game.GetPlayer().RemoveSpell(_DE_ColdWater_3_Perk)
		Game.GetPlayer().RemoveSpell(_DE_ColdWater_Death)
		pMainScript.pWetPoints = 0.0
		_DE_WetState.SetValue(0)
		utility.wait(1)
		_DE_Backpack_Menu2_HelpTroubleshootingConfirm.Show()
	elseif ibutton == 1
		Menu2Troubleshooting()
	endif
endFunction
	
function Menu2TroubleshootingWait()
	int ibutton = _DE_Backpack_Menu2_HelpTroubleshootingWait.Show()
	if ibutton == 0
		Game.DisablePlayerControls()
		Game.EnablePlayerControls()
		utility.wait(1)
		pMainScript.pSetting_NoWait = false
		Game.GetPlayer().RemoveSpell(_DE_NoWait_Spell)
		_DE_Backpack_Menu2_HelpTroubleshootingConfirm.Show()
	elseif ibutton == 1
		Menu2Troubleshooting2()
	endif
endFunction
	
function Menu2TroubleshootingStats()
	int ibutton = _DE_Backpack_Menu2_HelpTroubleshootingStats.Show()
	if ibutton == 0
		Game.DisablePlayerControls()
		Game.EnablePlayerControls()
		utility.wait(1)
		Game.GetPlayer().RemoveSpell(_DE_Hypo_Spell_0_2)
		Game.GetPlayer().RemoveSpell(_DE_Hypo_Spell_1)
		Game.GetPlayer().RemoveSpell(_DE_Hypo_Spell_2)
		Game.GetPlayer().RemoveSpell(_DE_Hypo_Spell_3)
		Game.GetPlayer().RemoveSpell(_DE_Hypo_Spell_4)
		Game.GetPlayer().RemoveSpell(_DE_Hypo_Spell_5)
		Game.GetPlayer().RemoveSpell(_DE_Hypo_Spell_4NoFrost)
		Game.GetPlayer().RemoveSpell(_DE_Hypo_Spell_5NoFrost)
		_DE_ExposurePoints.SetValue(90)
		_DE_Backpack_Menu2_HelpTroubleshootingConfirm.Show()
	elseif ibutton == 1
		Menu2Troubleshooting()
	endif
endFunction
	
function Menu2TroubleshootingSlow()
	int ibutton = _DE_Backpack_Menu2_HelpTroubleshootingSlow.Show()
	if ibutton == 0
		Game.DisablePlayerControls()
		Game.EnablePlayerControls()
		utility.wait(1)
		Game.GetPlayer().SetActorValue("SpeedMult", 100)
		_DE_Backpack_Menu2_HelpTroubleshootingConfirm.Show()
	elseif ibutton == 1
		Menu2Troubleshooting()
	endif
endFunction

function Menu2TroubleshootingFT()
	int ibutton = _DE_Backpack_Menu2_HelpTroubleshootingFT.Show()
	if ibutton == 0
		Game.DisablePlayerControls()
		Game.EnablePlayerControls()
		utility.wait(1)
		_DE_Setting_FastTravel.SetValue(0)
		Game.GetPlayer().RemoveSpell(_DE_NoWait_Spell)
		pMainScript.pSetting_NoWait = false
		pMainScript.pSetting_FastTravelDisable = false
		Game.EnableFastTravel()
		_DE_Backpack_Menu2_HelpTroubleshootingConfirm.Show()
	elseif ibutton == 1
		Menu2Troubleshooting2()
	endif
endFunction

function Menu2TroubleshootingEP()
	int ibutton = _DE_Backpack_Menu2_HelpTroubleshootingEP.Show()
	if ibutton == 0
		Game.DisablePlayerControls()
		Game.EnablePlayerControls()
		utility.wait(1)
		_DE_ExposurePoints.SetValue(75)
		_DE_Backpack_Menu2_HelpTroubleshootingConfirm.Show()
	elseif ibutton == 1
		Menu2Troubleshooting()
	endif
endFunction
	
function Menu2TroubleshootingExit()						;No longer called
	int ibutton = _DE_Backpack_Menu2_HelpTroubleshootingExit.Show()
	if ibutton == 0
		;WoodHarvestScriptRef.UnregisterForAllEvents()
		_DE_WoodHarvestingAlias.Clear()
		_DE_XMarker_WoodHarvestEndRef.MoveTo(_DE_Anchor)
		_DE_PortalMarker.MoveTo(Game.GetPlayer())
		debug.CenterOnCell("_DE_TestCell")		
		;_DE_Backpack_Menu2_HelpTroubleshootingConfirm.Show()
	elseif ibutton == 1
		Menu2Troubleshooting2()
	endif
endFunction

function Menu2TroubleshootingPlacement()
	int ibutton = _DE_Backpack_Menu2_HelpTroubleshootingPlacement.Show()
	if ibutton == 0
		Game.DisablePlayerControls()
		Game.EnablePlayerControls()
		utility.wait(1)
		_DE_CampsitePlacementOn.SetValue(1)
		_DE_Backpack_Menu2_HelpTroubleshootingConfirm.Show()
	elseif ibutton == 1
		Game.DisablePlayerControls()
		Game.EnablePlayerControls()
		utility.wait(1)
		_DE_Setting_SimplePlacement.SetValue(2)
		_DE_Backpack_Menu2_HelpTroubleshootingConfirm.Show()
	else
		Menu2Troubleshooting2()
	endif
endFunction

function Menu2HelpExposure()

	int ibutton = _DE_Backpack_Menu2_HelpExposure.Show()
		
	if ibutton == 0
		_DE_Backpack_Menu2_HelpExposure_Location.Show()
		Menu2HelpExposure()									;Return here when player clicks back
	elseif ibutton == 1
		_DE_Backpack_Menu2_HelpExposure_Weather.Show()
		Menu2HelpExposure()
	elseif ibutton == 2
		_DE_Backpack_Menu2_HelpExposure_Wet.Show()
		Menu2HelpExposure()
	elseif ibutton == 3
		_DE_Backpack_Menu2_HelpExposure_Clothing.Show()
		Menu2HelpExposure()
	elseif ibutton == 4
		_DE_Backpack_Menu2_HelpExposure_Frost.Show()
		Menu2HelpExposure()
	elseif ibutton == 5
		_DE_Backpack_Menu2_HelpExposure_Food.Show()
		Menu2HelpExposure()
	elseif ibutton == 6
		Menu2HelpMain()
	endif
endFunction
;#EndRegion

function Uninstall()
	if pMainScript.ShutdownState == false
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsUninstallNo.Show()
		if ibutton == 0
			;Shut Down Frostfall
			_DE_ExposurePoints.SetValue(100.0)
			_DE_SwimState.SetValue(0)
			_DE_Setting_Lighting.SetValue(1)
			Game.GetPlayer().RemoveSpell(_DE_Hypo_Spell_0_2)
			Game.GetPlayer().RemoveSpell(_DE_Hypo_Spell_1)
			Game.GetPlayer().RemoveSpell(_DE_Hypo_Spell_2)
			Game.GetPlayer().RemoveSpell(_DE_Hypo_Spell_3)
			Game.GetPlayer().RemoveSpell(_DE_Hypo_Spell_4)
			Game.GetPlayer().RemoveSpell(_DE_Hypo_Spell_4NoFrost)
			Game.GetPlayer().RemoveSpell(_DE_Hypo_Spell_5)
			Game.GetPlayer().RemoveSpell(_DE_Hypo_Spell_5NoFrost)
			Game.GetPlayer().RemoveSpell(_DE_TorchState_Spell)
			Game.GetPlayer().RemoveSpell(_DE_CloakState_Spell)
			Game.GetPlayer().RemoveSpell(_DE_CloakState_Spell_Burlap)
			Game.GetPlayer().RemoveSpell(_DE_CloakState_Spell_Fur)
			Game.GetPlayer().RemoveSpell(_DE_CloakState_Spell_Hide)
			Game.GetPlayer().RemoveSpell(_DE_CloakState_Spell_Linen)
			;Game.GetPlayer().RemoveSpell(_DE_SwimDetect_Dry)
			;Game.GetPlayer().RemoveSpell(_DE_SwimDetect_Wet)
			Game.GetPlayer().RemoveSpell(_DE_WetState_Spell)
			Game.GetPlayer().RemoveSpell(_DE_WetState_Spell1)
			Game.GetPlayer().RemoveSpell(_DE_WetState_Spell1NoShader)
			Game.GetPlayer().RemoveSpell(_DE_WetState_Spell2)
			Game.GetPlayer().RemoveSpell(_DE_WetState_Spell2NoShader)
			Game.GetPlayer().RemoveSpell(_DE_WetState_Spell3)
			Game.GetPlayer().RemoveSpell(_DE_WetState_Spell3NoShader)
			Game.GetPlayer().RemoveSpell(_DE_Weathersense_Spell)
			Game.GetPlayer().RemoveSpell(_DE_WEARExamineArmor_Spell)
			Game.GetPlayer().RemoveSpell(_DE_ColdWater_1)
			Game.GetPlayer().RemoveSpell(_DE_ColdWater_2)
			Game.GetPlayer().RemoveSpell(_DE_ColdWater_3)
			Game.GetPlayer().RemoveSpell(_DE_ColdWater_3_Perk)
			Game.GetPlayer().RemoveSpell(_DE_ColdWater_Death)
			Game.GetPlayer().RemoveSpell(_DE_SurvivalSkillsCombo_Spell)
			Game.GetPlayer().RemoveSpell(_DE_NoWait_Spell)
			Game.GetPlayer().RemoveSpell(_DE_WellInsulatedConditionSpell)
			Game.GetPlayer().RemoveSpell(_DE_ConditioningState_Spell)
			Game.GetPlayer().RemoveSpell(_DE_ConditioningState_Spell_SkyRe)
			Game.GetPlayer().RemoveSpell(_DE_FlyingMountState_Spell)
			Game.GetPlayer().RemoveSpell(_DE_WerewolfSwimState)
			Game.GetPlayer().RemoveSpell(_DE_NoWaitWerewolfFix_Spell)
			Game.GetPlayer().RemoveSpell(_DE_WalkingStickSpell)
			Game.GetPlayer().RemoveSpell(_DE_HandWarmingSpell)
			Game.EnableFastTravel()
			ImageSpaceModifier.RemoveCrossFade(4.0)
			_DE_WetState.SetValue(0.0)
			pMainScript.pWetPoints = 0.0
			;Alias_DE_Player.Clear()
			pMainScript.ShutdownState = true
			_DE_ShutdownComplete.Show()
			Uninstall()
		else
			Menu2Options3()
		endif
	else
		int ibutton = _DE_Backpack_Menu2_Setup_OptionsUninstallYes.Show()
		if ibutton == 0
			pMainScript.ShutdownState = false
			Uninstall()
		else
			Menu2Options3()
		endif
	endif
endFunction