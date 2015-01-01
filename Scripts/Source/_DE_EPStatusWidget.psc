scriptname _DE_EPStatusWidget extends _DE_SKI_StatusWidget

_DE_Compatibility property Compatibility auto
_DE_EPMonitor_1_6 property Frostfall auto
GlobalVariable property _DE_DisplayEPWidget auto

Actor property PlayerRef auto

GlobalVariable property _DE_fBody auto
GlobalVariable property _DE_fHands auto
GlobalVariable property _DE_fFeet auto
GlobalVariable property _DE_fHead auto
GlobalVariable property _DE_ArmorPerk1Active auto
GlobalVariable property _DE_ArmorPerk2Active auto
GlobalVariable property _DE_ArmorPerk3Active auto
GlobalVariable property _DE_WellInsulatedApplied auto

MagicEffect property _DE_aaaArmorFFSelf_1 auto
MagicEffect property _DE_aaaArmorFFSelf_2 auto
MagicEffect property _DE_aaaArmorFFSelf_3 auto

bool bValidMenu = false
bool bDisplayWidget = true

; @overrides SKI_WidgetBase
event OnWidgetInit()
	RegisterForMenu("MagicMenu")
	RegisterForMenu("InventoryMenu")
	RegisterForMenu("Lockpicking Menu")
	RegisterForKey(264) ;Mouse up
	RegisterForKey(265)	;Mouse down
	RegisterForKey(46)	;C
endEvent

event OnGameReload()
	parent.OnGameReload()
	RegisterForMenu("MagicMenu")
	RegisterForMenu("InventoryMenu")
	RegisterForMenu("Lockpicking Menu")
	RegisterForKey(264)	;Mouse up
	RegisterForKey(265)	;Mouse down
	RegisterForKey(46)	;C
	RegisterForKey(273)	;Right thumbstick
endEvent

; @overrides SKI_WidgetBase
string function GetWidgetSource()
	return "frostfall/status.swf"
endFunction

function UpdateValue()
	;Get Exposure Protection
	float myBodyRating
	if _DE_fBody.GetValue() != 0.1
		myBodyRating = _DE_fBody.GetValue()
	else
		myBodyRating = 0
	endif
	
	float myHandsRating = _DE_fHands.GetValue()
	float myFeetRating = _DE_fFeet.GetValue()
	float myHeadRating = _DE_fHead.GetValue()
	
	;Calculate spell bonuses
	float mySpellRating = 0.0
	if PlayerRef.HasMagicEffect(_DE_aaaArmorFFSelf_1)			;Foxskin
		if _DE_ArmorPerk3Active.GetValue() == 1.0
			mySpellRating += 0.3	
		elseif _DE_ArmorPerk2Active.GetValue() == 1.0
			mySpellRating += 0.25
		elseif _DE_ArmorPerk1Active.GetValue() == 1.0
			mySpellRating += 0.2
		else
			mySpellRating += 0.1
		endif
	elseif PlayerRef.HasMagicEffect(_DE_aaaArmorFFSelf_2)		;Wolfskin
		if _DE_ArmorPerk3Active.GetValue() == 1.0
			mySpellRating += 0.6	
		elseif _DE_ArmorPerk2Active.GetValue() == 1.0
			mySpellRating += 0.5
		elseif _DE_ArmorPerk1Active.GetValue() == 1.0
			mySpellRating += 0.4
		else
			mySpellRating += 0.2
		endif
	elseif PlayerRef.HasMagicEffect(_DE_aaaArmorFFSelf_3)		;Bearskin
		if _DE_ArmorPerk3Active.GetValue() == 1.0
			mySpellRating += 0.9	
		elseif _DE_ArmorPerk2Active.GetValue() == 1.0
			mySpellRating += 0.75
		elseif _DE_ArmorPerk1Active.GetValue() == 1.0
			mySpellRating += 0.6
		else
			mySpellRating += 0.3	
		endif
	endif

	float myRating = myBodyRating + myHandsRating + myFeetRating + myHeadRating + mySpellRating
	bool bHasWellInsulated = PlayerRef.HasPerk(Compatibility.WellInsulated) && _DE_WellInsulatedApplied.GetValueInt() == 2
	if bHasWellInsulated
		myRating *= 1.25
	endif

	self.ValueText = (myRating * 100) as int
endFunction

Event OnMenuOpen(string MenuName)
	if Compatibility.isSKYUILoaded
		if Frostfall.pSetting_IsRunning == false || Frostfall.ShutdownState == true || _DE_DisplayEPWidget.GetValue() != 2
			bValidMenu = false
			self.Alpha = 0.0
		elseif MenuName == "MagicMenu" || MenuName == "Lockpicking Menu"
			bValidMenu = false
			self.Alpha = 0.0
		elseif MenuName == "InventoryMenu"
			bValidMenu = true
			self.Alpha = 100.0
			UpdateValue()
		endif
	endif
endEvent

;Handle the player zooming into items in the inventory
Event OnKeyDown(Int KeyCode)
	if bValidMenu
		if KeyCode == 264
			bDisplayWidget = false
			self.Alpha = 0.0
		elseif KeyCode == 265
			bDisplayWidget = true
			self.Alpha = 100.0
		elseif KeyCode == 46
			if bDisplayWidget == false
				bDisplayWidget = true
				self.Alpha = 100.0
			else
				bDisplayWidget = false
				self.Alpha = 0.0
			endif
		elseif KeyCode == 273
			if bDisplayWidget == false
				bDisplayWidget = true
				self.Alpha = 100.0
			else
				bDisplayWidget = false
				self.Alpha = 0.0
			endif
		endif
	endif	
endEvent