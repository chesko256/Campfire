scriptname _DE_Campfire_SimpleScript extends ObjectReference

import Message
import utility
import debug

_Camp_Compatibility property Compatibility auto

Actor property PlayerRef auto

message property _DE_Campfire_Simple_Menu_Lit auto
message property _DE_Campfire_Simple_Menu_Unlit auto
message property _DE_Campfire_Simple_BooksError auto

MiscObject property Firewood01 auto
MiscObject property _DE_Deadwood01 auto
MiscObject property RuinedBook auto
MiscObject property RuinedBook02 auto

Keyword property MagicDamageFire auto
Keyword property MagicDamageFrost auto

MagicEffect property VoiceUnrelentingForceEffect01 auto
MagicEffect property VoiceUnrelentingForceEffect02 auto
MagicEffect property VoiceUnrelentingForceEffect03 auto

GlobalVariable property _DE_Setting_Lighting auto
GlobalVariable property _DE_BlockState auto
GlobalVariable property _DE_CampsitePlacementOn auto

Activator property _DE_Campfire_Simple_Books_Lit auto
Activator property _DE_Campfire_Simple_Books_Unlit auto
Activator property _DE_Campfire_Simple_Firewood_Lit auto
Activator property _DE_Campfire_Simple_Firewood_Unlit auto
Activator property _DE_Campfire_Simple_Deadwood_Lit auto
Activator property _DE_Campfire_Simple_Deadwood_Unlit auto
Activator property _DE_Campfire_Simple_Steam auto
Activator property _DE_Campfire_Simple_Embers auto
Activator property _DE_Campfire_Simple_Ashes auto

Light property _DE_Campfire_Light_3 auto

Sound property FXFireOut auto

ObjectReference property myBooksLit auto hidden
ObjectReference property myBooksUnlit auto hidden
ObjectReference property myFirewoodLit auto hidden
ObjectReference property myFirewoodUnlit auto hidden
ObjectReference property myDeadwoodLit auto hidden
ObjectReference property myDeadwoodUnlit auto hidden
ObjectReference property myLight auto hidden
ObjectReference property mySteam auto hidden
ObjectReference property myEmbers auto hidden
ObjectReference property myAshes auto hidden

bool bLit = false

State IgnoreSpells

	Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	endEvent

endState

Event OnInit()
	myLight = self.PlaceAtMe(_DE_Campfire_Light_3, abInitiallyDisabled = true)
	myBooksLit = self.PlaceAtMe(_DE_Campfire_Simple_Books_Lit, abInitiallyDisabled = true)
	myBooksUnlit = self.PlaceAtMe(_DE_Campfire_Simple_Books_Unlit, abInitiallyDisabled = true)
	myFirewoodLit = self.PlaceAtMe(_DE_Campfire_Simple_Firewood_Lit, abInitiallyDisabled = true)
	myFirewoodUnlit = self.PlaceAtMe(_DE_Campfire_Simple_Firewood_Unlit, abInitiallyDisabled = true)
	myDeadwoodLit = self.PlaceAtMe(_DE_Campfire_Simple_Deadwood_Lit, abInitiallyDisabled = true)
	myDeadwoodUnlit = self.PlaceAtMe(_DE_Campfire_Simple_Deadwood_Unlit, abInitiallyDisabled = true)
	mySteam = self.PlaceAtMe(_DE_Campfire_Simple_Steam, abInitiallyDisabled = true)
	myEmbers = self.PlaceAtMe(_DE_Campfire_Simple_Embers, abInitiallyDisabled = true)
	myAshes = self.PlaceAtMe(_DE_Campfire_Simple_Ashes,abInitiallyDisabled = true)
	
	RegisterForSingleUpdateGameTime(48)
endEvent

Event OnUpdateGameTime()
	
	if bLit
		Campfire_GoOut()
	else
		if myEmbers.IsEnabled()
			Campfire_SetState(false, false, false, false, false, false, false, false)
			RegisterForSingleUpdateGameTime(45)
		else
			Campfire_Destroy()
		endif
	endif

endEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	if akSource == none && (akAggressor as Actor).GetEquippedItemType(0) == 11
		if myFirewoodUnlit.IsEnabled()
			Campfire_LightFirewood()
		elseif myDeadwoodUnlit.IsEnabled()
			Campfire_LightDeadwood()
		elseif myBooksUnlit.IsEnabled()
			Campfire_LightBooks()
		endif
	endif
	
endEvent

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	
	GoToState("IgnoreSpells")
	
	if bLit == false
		if akEffect.HasKeyword(MagicDamageFire)
			if myFirewoodUnlit.IsEnabled()
				Campfire_LightFirewood()
			elseif myDeadwoodUnlit.IsEnabled()
				Campfire_LightDeadwood()
			elseif myBooksUnlit.IsEnabled()
				Campfire_LightBooks()
			endif
		endif
	else
		if akEffect == VoiceUnrelentingForceEffect01 || akEffect == VoiceUnrelentingForceEffect02 || akEffect == VoiceUnrelentingForceEffect03 || akEffect.HasKeyword(MagicDamageFrost)
			if myFirewoodLit.IsEnabled()
				Campfire_PutOutFirewood()
			elseif myDeadwoodLit.IsEnabled()
				Campfire_PutOutDeadwood()
			elseif myBooksLit.IsEnabled()
				Campfire_PutOutBooks()
			endif
		endif
	endif
	
	GoToState("")
	
endEvent

Event OnActivate(ObjectReference akActionRef)

	if _DE_CampsitePlacementOn.GetValueInt() == 2
		;Don't allow activation during placement.
		return
	endif

	if bLit
		int iButton = _DE_Campfire_Simple_Menu_Lit.Show()
		if iButton == 0
			Campfire_Destroy()
		else
			;do nothing
		endif
	else
		if myFirewoodUnlit.IsEnabled() || myDeadwoodUnlit.IsEnabled() || myBooksUnlit.IsEnabled()
			int iButton = _DE_Campfire_Simple_Menu_Lit.Show()
			if iButton == 0
				Campfire_Destroy()
			else
				;do nothing
			endif
		else
			int iButton = _DE_Campfire_Simple_Menu_Unlit.Show()		
  
			if iButton == 0
				Campfire_AddFirewood()
			elseif iButton == 1
				Campfire_AddDeadwood()
			elseif iButton == 2
				Campfire_AddBooks()
			elseif iButton == 3
				Campfire_Destroy()
			else
				;do nothing
			endif
		endif
	endif
		
endEvent

function Campfire_PutOutFirewood()

	Campfire_SetState(false, false, false, true, false, false, false, false)
	bLit = false

	FXFireOut.Play(self)
	
	mySteam.Enable()
	wait(2)
	mySteam.Disable(true)
	
endFunction

function Campfire_PutOutDeadwood()

	Campfire_SetState(false, false, false, false, false, true, false, false)
	bLit = false
	
	FXFireOut.Play(self)
	
	mySteam.Enable()
	wait(2)
	mySteam.Disable(true)
	
endFunction

function Campfire_PutOutBooks()

	Campfire_SetState(false, true, false, false, false, false, false, false)
	bLit = false

	FXFireOut.Play(self)
	
	mySteam.Enable()
	wait(2)
	mySteam.Disable(true)
	
endFunction

function Campfire_LightFirewood()

	Campfire_SetState(false, false, true, false, false, false, true, false)
	bLit = true
	
	Campfire_FirewoodRegister()
	
endFunction

function Campfire_LightDeadwood()

	Campfire_SetState(false, false, false, false, true, false, true, false)
	bLit = true
	
	Campfire_DeadwoodRegister()
	
endFunction

function Campfire_LightBooks()

	Campfire_SetState(true, false, false, false, false, false, true, false)
	bLit = true
	
	Campfire_DeadwoodRegister()
	
endFunction

function Campfire_FirewoodRegister()
	if Compatibility.isSKYRELoaded
		if PlayerRef.HasPerk(Compatibility.Traveller_Rank5)
			RegisterForSingleUpdateGameTime(12)
		elseif PlayerRef.HasPerk(Compatibility.Traveller_Rank4)
			RegisterForSingleUpdateGameTime(10.8)
		elseif PlayerRef.HasPerk(Compatibility.Traveller_Rank3)
			RegisterForSingleUpdateGameTime(9.6)
		elseif PlayerRef.HasPerk(Compatibility.Traveller_Rank2)
			RegisterForSingleUpdateGameTime(8.4)
		elseif PlayerRef.HasPerk(Compatibility.Traveller_Rank1)
			RegisterForSingleUpdateGameTime(7.2)
		else
			RegisterForSingleUpdateGameTime(6)
		endif
	else
		RegisterForSingleUpdateGameTime(6)
	endif
endFunction

function Campfire_DeadwoodRegister()
	if Compatibility.isSKYRELoaded
		if PlayerRef.HasPerk(Compatibility.Traveller_Rank5)
			RegisterForSingleUpdateGameTime(6)
			;notification("I have traveller rank 5")
		elseif PlayerRef.HasPerk(Compatibility.Traveller_Rank4)
			RegisterForSingleUpdateGameTime(5.4)
			;notification("I have traveller rank 4")
		elseif PlayerRef.HasPerk(Compatibility.Traveller_Rank3)
			RegisterForSingleUpdateGameTime(4.8)
			;notification("I have traveller rank 3")
		elseif PlayerRef.HasPerk(Compatibility.Traveller_Rank2)
			RegisterForSingleUpdateGameTime(4.2)
			;notification("I have traveller rank 2")
		elseif PlayerRef.HasPerk(Compatibility.Traveller_Rank1)
			RegisterForSingleUpdateGameTime(3.6)
			;notification("I have traveller rank 1")
		else
			RegisterForSingleUpdateGameTime(3)
			;notification("I have traveller rank 0")
		endif
	else
		RegisterForSingleUpdateGameTime(3)
		;notification("SkyRe not detected")
	endif
endFunction

function Campfire_GoOut()
	
	Campfire_SetState(false, false, false, false, false, false, false, true)
	bLit = false
	
	RegisterForSingleUpdateGameTime(3)
	
	if myAshes
		myAshes.Enable(true)
	endif
	
endFunction

function Campfire_AddFirewood()

	if _DE_Setting_Lighting.GetValueInt() == 1
		Campfire_SetState(false, false, true, false, false, false, true, false)
		bLit = true
		Campfire_FirewoodRegister()
	else
		Campfire_SetState(false, false, false, true, false, false, false, false)
		bLit = false
		RegisterForSingleUpdateGameTime(48)
	endif

	if PlayerRef.GetItemCount(Firewood01) >= 6
		PlayerRef.RemoveItem(Firewood01, 6)
	endif
	
endFunction

function Campfire_AddDeadwood()

	if _DE_Setting_Lighting.GetValueInt() == 1
		Campfire_SetState(false, false, false, false, true, false, true, false)
		bLit = true
		Campfire_DeadwoodRegister()
	else
		Campfire_SetState(false, false, false, false, false, true, false, false)
		bLit = false
		RegisterForSingleUpdateGameTime(48)
	endif

	if PlayerRef.GetItemCount(_DE_Deadwood01) >= 15
		PlayerRef.RemoveItem(_DE_Deadwood01, 15)
	endif
	
	
	
endFunction

function Campfire_AddBooks()

	;Does the player have enough books?
	int iBook1Count = PlayerRef.GetItemCount(RuinedBook)
	int iBook2Count = PlayerRef.GetItemCount(RuinedBook02)
	if iBook1Count + iBook2Count < 10
		_DE_Campfire_Simple_BooksError.Show()
		return
	endif

	if _DE_Setting_Lighting.GetValueInt() == 1
		Campfire_SetState(true, false, false, false, false, false, true, false)
		bLit = true
		Campfire_DeadwoodRegister()
	else
		Campfire_SetState(false, true, false, false, false, false, false, false)
		bLit = false
		RegisterForSingleUpdateGameTime(48)
	endif

	;Eat books
	int iBooksConsumed = 0

	if iBook1Count >= 10
		PlayerRef.RemoveItem(RuinedBook, 10)
		iBooksConsumed = 10
	else
		PlayerRef.RemoveItem(RuinedBook, iBook1Count)
		iBooksConsumed = iBook1Count
	endif

	if iBooksConsumed < 10
		PlayerRef.RemoveItem(RuinedBook02, (10 - iBooksConsumed))
	endif

endFunction

function Campfire_Destroy()

	if mySteam
		mySteam.Disable()
		mySteam.Delete()
	endif
	if myLight
		myLight.Disable()
		myLight.Delete()
	endif
	if myBooksLit
		myBooksLit.Disable()
		myBooksLit.Delete()
	endif
	if myBooksUnlit
		myBooksUnlit.Disable()
		myBooksUnlit.Delete()
	endif
	if myFirewoodLit
		myFirewoodLit.Disable()
		myFirewoodLit.Delete()
	endif
	if myFirewoodUnlit
		myFirewoodUnlit.Disable()
		myFirewoodUnlit.Delete()
	endif
	if myDeadwoodLit
		myDeadwoodLit.Disable()
		myDeadwoodLit.Delete()
	endif
	if myDeadwoodUnlit
		myDeadwoodUnlit.Disable()
		myDeadwoodUnlit.Delete()
	endif
	if myEmbers
		myEmbers.Disable()
		myEmbers.Delete()
	endif
	if myAshes
		myAshes.Disable()
		myAshes.Delete()
	endif
	self.Disable()
	self.Delete()
	
endFunction

function Campfire_SetState(bool bBooksLit, bool bBooksUnlit, bool bFirewoodLit, bool bFirewoodUnlit, bool bDeadwoodLit, bool bDeadwoodUnlit, bool bLight, bool bEmbers)
	
	if myBooksUnlit
		if bBooksUnlit
			myBooksUnlit.Enable()
		else
			myBooksUnlit.Disable()
		endif
	endif

	if myFirewoodUnlit
		if bFirewoodUnlit
			myFirewoodUnlit.Enable()
		else
			myFirewoodUnlit.Disable()
		endif
	endif
	
	if myDeadwoodUnlit
		if bDeadwoodUnlit
			myDeadwoodUnlit.Enable()
		else
			myDeadwoodUnlit.Disable()
		endif
	endif
	
	if myBooksLit
		if bBooksLit
			myBooksLit.Enable()
		else
			myBooksLit.Disable()
		endif
	endif

	if myFirewoodLit
		if bFirewoodLit
			myFirewoodLit.Enable()
		else
			myFirewoodLit.Disable()
		endif
	endif
	
	if myDeadwoodLit
		if bDeadwoodLit
			myDeadwoodLit.Enable()
		else
			myDeadwoodLit.Disable()
		endif
	endif
	
	if myEmbers
		if bEmbers
			myEmbers.Enable()
		else
			myEmbers.Disable()
		endif
	endif
	
	if myLight
		if bLight
			myLight.Enable()
			
			while !(myLight.Is3DLoaded())
			endWhile
			
			if myLight.GetDistance(self) == 0.0
				myLight.MoveTo(self, afZOffset = 150.0)
			endif
			
		else
			myLight.Disable()
		endif
	endif
	
endFunction

