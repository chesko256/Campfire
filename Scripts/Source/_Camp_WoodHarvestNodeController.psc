scriptname _Camp_WoodHarvestNodeController extends ObjectReference

import Utility
import math

bool property use_ref_model = false auto
{Should this wood harvest node use the static's model? (Requires activator model with only collision)}

float RESET_TIME = 72.0
float BACKOFF_TIME
int MAX_YIELDS

MiscObject property _Camp_Tinder auto
MiscObject property _Camp_DeadwoodBranch auto
MiscObject property _Camp_DeadwoodLog auto
Quest property _Camp_MainQuest auto
Sound property _Camp_ChopWoodSM auto
Actor property PlayerRef auto
Spell property _Camp_WoodHarvestingStamina auto
FormList property _Camp_HarvestableWood_Mushrooms auto
Weapon property _Camp_WoodHarvestingAnimAxe auto
ObjectReference property my_wood_ref auto hidden
ObjectReference property my_mushroom_ref1 auto hidden
ObjectReference property my_mushroom_ref2 auto hidden
ObjectReference property current_activator auto hidden
ObjectReference property _Camp_WoodHarvestAttackTarget auto
ObjectReference property _Camp_WoodHarvestAnchor auto
FormList property woodChoppingAxes auto
message property WoodChoppingFailureMessage auto
int property remaining_yields auto hidden
float property tinder_yield_chance auto hidden
int property hit_count auto hidden
int property min_yield_branch auto hidden
int property max_yield_branch auto hidden
int property min_yield_deadwood auto hidden
int property max_yield_deadwood auto hidden
bool property is_stump auto hidden
bool property should_stand auto hidden
bool property disable_on_depleted auto hidden
bool eligible_for_deletion = false

;Animation state vars
bool was_first_person
bool was_sneaking
bool was_weapons_drawn
bool exit_on_next_hit
weapon main_weapon
weapon offhand_weapon

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == PlayerRef
		if PlayerRef.GetItemCount(woodChoppingAxes) == 0
			WoodChoppingFailureMessage.Show()
			return
		endif
		if remaining_yields <= 0
			ShowDepleteMessage()
			return
		endif
		if PlayerRef.IsSwimming()
			return
		endif
		ActivatedWithAxe()
	endif
endEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if akAggressor == PlayerRef && woodChoppingAxes.HasForm(akSource)
		HitWithAxe()
	endif
EndEvent

function Setup(int _remaining_yields, float _tinder_yield_chance, 		\
			   int _min_yield_branch, int _max_yield_branch,	 		\
			   int _min_yield_deadwood, int _max_yield_deadwood, 		\
			   bool _is_stump, bool _should_stand, 						\
			   bool _disable_on_depleted, ObjectReference _my_wood_ref)

	debug.trace("[Campfire] Setting up new wood harvesting node " + self)
	remaining_yields = _remaining_yields
	MAX_YIELDS = _remaining_yields
	tinder_yield_chance = _tinder_yield_chance
	min_yield_branch = _min_yield_branch
	max_yield_branch = _max_yield_branch
	min_yield_deadwood = _min_yield_deadwood
	max_yield_deadwood = _max_yield_deadwood
	is_stump = _is_stump
	should_stand = _should_stand
	disable_on_depleted = _disable_on_depleted
	my_wood_ref = _my_wood_ref
	GetMushrooms()

	;Store a random back-off value for use during reset
	BACKOFF_TIME = RandomFloat(0.0, 3.0)

	if !use_ref_model && !my_wood_ref.GetEnableParent()
		my_wood_ref.DisableNoWait()
	else
		debug.trace("[Campfire] Woodref " + my_wood_ref + " has enable parent " + my_wood_ref.GetEnableParent() + " or use_ref_model = " + use_ref_model)
	endif

	if use_ref_model
		;Move upwards slightly so that the collider can be activated
		self.MoveTo(self, afZOffset = 0.50)
	endif

	RegisterForSingleUpdateGameTime(RESET_TIME)
	RegisterForModEvent("Campfire_WoodHarvestNodeReset", "WoodHarvestNodeReset")
endFunction

function GetMushrooms()
	my_mushroom_ref1 = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_HarvestableWood_Mushrooms, self, 5.0)
	if my_mushroom_ref1
		int i = 0
		while !my_mushroom_ref2 && i < 3
			ObjectReference found_mushroom = Game.FindRandomReferenceOfAnyTypeInListFromRef(_Camp_HarvestableWood_Mushrooms, self, 5.0)
			if found_mushroom && found_mushroom != my_mushroom_ref1
				my_mushroom_ref2 = found_mushroom
				;debug.trace("[Campfire] Mushroom 2: " + my_mushroom_ref2)
			endif
			i += 1
		endWhile
	endif
endFunction

function ActivatedWithAxe()
	exit_on_next_hit = False
	;Register for necessary animation and control events.
	RegisterForAnimationEvent(PlayerRef, "HitFrame")
	RegisterForModEvent("Campfire_PlayerHit", "PlayerHit")
	RegisterForControl("Move")
	RegisterForControl("Forward")
	RegisterForControl("Back")
	RegisterForControl("Strafe Left")
	RegisterForControl("Strafe Right")
	RegisterForMenu("Dialogue Menu")

	;Register for update for emergency bail-out
	RegisterForSingleUpdate(15.0)

	was_first_person = False
	if PlayerRef.GetAnimationVariableBool("IsFirstPerson")
		was_first_person = True
		Game.ForceThirdPerson()
	endif
	was_weapons_drawn = False
	if PlayerRef.IsWeaponDrawn()
		was_weapons_drawn = true
	endif

	float[] offset = GetGlobalOffset(PlayerRef, 100.0)
	_Camp_WoodHarvestAttackTarget.MoveTo(PlayerRef, offset[0], offset[1])
	int i = 0
	while !_Camp_WoodHarvestAttackTarget.Is3DLoaded() && i < 50
		utility.wait(0.1)
		i += 1
	endWhile

	was_sneaking = False
	if PlayerRef.IsSneaking()
		was_sneaking = True
	endif

	;Should I stand or crouch?
	;Due to timing issues, it can be difficult to get the player to do what we want.
	;So, we need to loop and check the state until we definitely have the result we want.
	if should_stand && !IsWoodLyingDown()
		if PlayerRef.IsSneaking()
			i = 0
			while PlayerRef.IsSneaking() && i < 50
				PlayerRef.StartSneaking()
				utility.wait(0.1)
				i += 1
			endWhile
		endif
	else
		if !PlayerRef.IsSneaking()
			i = 0
			while !PlayerRef.IsSneaking() && i < 50
				PlayerRef.StartSneaking()
				utility.wait(0.1)
				i += 1
			endWhile
		endif
	endif
	utility.wait(0.1)
	
	Game.SetPlayerAIDriven()
	Game.SetHudCartMode(true)

	main_weapon = GetCurrentWeapon()
	offhand_weapon = GetCurrentWeapon(true)
	PlayerRef.AddItem(_Camp_WoodHarvestingAnimAxe, abSilent = true)
	PlayerRef.EquipItem(_Camp_WoodHarvestingAnimAxe, abSilent = true)

	;Wait for the stamina spell to take effect.
	i = 0
	while (!PlayerRef.HasSpell(_Camp_WoodHarvestingStamina) || PlayerRef.GetAV("Stamina") > 0.0) && i < 50
		utility.wait(0.1)
		i += 1
	endWhile

	;Set the flag to start the package
	(_Camp_MainQuest as _Camp_ConditionValues).IsChoppingWoodEnvironment = true
	PlayerRef.EvaluatePackage()
endFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if akSource == PlayerRef && asEventName == "HitFrame"
		ProcessActivatedHit()
	endif
EndEvent

Event OnControlDown(string control)
	if control == "Move" || control == "Forward" || control == "Back" || control == "Strafe Left" || control == "Strafe Right"
		;Player pressed move to exit.
		exit_on_next_hit = true
	endif
EndEvent

Event OnMenuOpen(String MenuName)
	if MenuName == "Dialogue Menu"
		;Someone force-greeted us.
		exit_on_next_hit = true
	endif
endEvent

Event PlayerHit(Form akAggressor, Form akSource, Form akProjectile)
	exit_on_next_hit = true
endEvent

function ProcessActivatedHit()
	_Camp_ChopWoodSM.Play(PlayerRef)
	YieldResources()
	if remaining_yields <= 0 || exit_on_next_hit
		ExitActivatedChopping()
	endif
endFunction

function ExitActivatedChopping()
	UnregisterForAnimationEvent(PlayerRef, "HitFrame")
	UnregisterForModEvent("Campfire_PlayerHit")
	UnregisterForControl("Move")
	UnregisterForControl("Forward")
	UnregisterForControl("Back")
	UnregisterForControl("Strafe Left")
	UnregisterForControl("Strafe Right")
	UnregisterForMenu("Dialogue Menu")
	UnregisterForUpdate()
	exit_on_next_hit = false

	Game.SetPlayerAIDriven(false)
	(_Camp_MainQuest as _Camp_ConditionValues).IsChoppingWoodEnvironment = false
	_Camp_WoodHarvestAttackTarget.MoveTo(_Camp_WoodHarvestAnchor)

	;Re-equip the player's weapons and restore control.
	PlayerRef.SheatheWeapon()
	int i = 0
	while PlayerRef.IsWeaponDrawn() && i < 50
		utility.wait(0.1)
		i += 1
	endWhile
	if main_weapon
		PlayerRef.EquipItem(main_weapon, abSilent = True)
	endif
	if offhand_weapon
		PlayerRef.EquipItem(offhand_weapon, abSilent = True)
	endif
	PlayerRef.RemoveItem(_Camp_WoodHarvestingAnimAxe, PlayerRef.GetItemCount(_Camp_WoodHarvestingAnimAxe), true)
	
	;Set the player's stand / sneak state to what it was before
	if PlayerRef.IsSneaking() && !was_sneaking
		i = 0
		While PlayerRef.IsSneaking() && i < 50
			PlayerRef.StartSneaking()
			utility.wait(0.1)
			i += 1
		endwhile
	endif

	;Draw their weapons if they once had them drawn
	if was_weapons_drawn
		PlayerRef.DrawWeapon()
	endif

	Game.SetHudCartMode(false)
	if was_first_person
		Game.ForceFirstPerson()
	endif
endFunction

bool function IsWoodLyingDown()
	if (my_wood_ref.GetAngleX() <= 20.0 || my_wood_ref.GetAngleX() >= 340.0) && \
	   (my_wood_ref.GetAngleY() <= 20.0 || my_wood_ref.GetAngleY() >= 340.0)

		return false
	else
		return true
	endif
endFunction

Weapon function GetCurrentWeapon(bool abOffHand = false)
	Weapon the_weapon
	if !abOffHand
		int iWeaponType = PlayerRef.GetEquippedItemType(1)
		if iWeaponType > 0
			the_weapon = PlayerRef.GetEquippedWeapon()
		endif
	else
		int iOffWeaponType = PlayerRef.GetEquippedItemType(0)
		if iOffWeaponType > 0
			the_weapon = PlayerRef.GetEquippedWeapon(true)
		endif
	endif
	return the_weapon
endFunction

function HitWithAxe()
	hit_count += 1
	;debug.trace("[Campfire] Hit with axe! Hit count " + hit_count)
	if hit_count >= 3
		hit_count = 0
		_Camp_ChopWoodSM.Play(PlayerRef)
		YieldResources()
	endif
endFunction

function YieldResources()
	if remaining_yields > 0
		remaining_yields -= 1

		int branch_count = RandomInt(min_yield_branch, max_yield_branch)
		int deadwood_count = RandomInt(min_yield_deadwood, max_yield_deadwood)
		float tinder_roll = RandomFloat(0.1, 1.0)

		if branch_count > 0
			PlayerRef.AddItem(_Camp_DeadwoodBranch, branch_count)
		endif
		if deadwood_count > 0
			PlayerRef.AddItem(_Camp_DeadwoodLog, deadwood_count)
		endif
		if tinder_roll <= tinder_yield_chance
			PlayerRef.AddItem(_Camp_Tinder)
		endif

		if remaining_yields <= 0
			ShowDepleteMessage()
			
			if disable_on_depleted && my_wood_ref
				if my_mushroom_ref1
					my_mushroom_ref1.DisableNoWait()
				endif
				if my_mushroom_ref2
					my_mushroom_ref2.DisableNoWait()
				endif
				if use_ref_model
					self.DisableNoWait()
					if !my_wood_ref.GetEnableParent()
						my_wood_ref.DisableNoWait(true)
					endif
				else
					self.DisableNoWait(true)
				endif
			endif
			RegisterForSingleUpdateGameTime(RESET_TIME)
		endif
	endif
endFunction

function ShowDepleteMessage()
	if is_stump
		if disable_on_depleted
			;debug.notification("You successfully harvest the stump.")
		else
			debug.notification("This stump is depleted of useful materials.")
		endif
	else
		if disable_on_depleted
			;debug.notification("You successfully harvest the log.")
		else
			debug.notification("This log is depleted of useful materials.")
		endif
	endif
endFunction

Event WoodHarvestNodeReset()
	debug.trace("[Campfire] " + self + " received global reset signal for wood harvest node, reverting...")
	RegisterForSingleUpdateGameTime(0.0)
endEvent

Event OnUpdate()
	debug.trace("[Campfire] Harvest Node OnUpdate")
	if (_Camp_MainQuest as _Camp_ConditionValues).IsChoppingWoodEnvironment == true
		debug.trace("[Campfire] We got hung at some point; bail out.")
		ExitActivatedChopping()
	endif
endEvent

Event OnCellDetach()
	;debug.trace("[Campfire] Detached from cell, checking deletion eligibility...")
	if remaining_yields >= MAX_YIELDS
		utility.wait(BACKOFF_TIME)
		RegisterForSingleUpdateGameTime(0.0)
	endif
EndEvent

Event OnUpdateGameTime()
	;debug.trace("[Campfire] Node resetting after prescribed game time.")
	if !PlayerRef.HasLOS(self)
		utility.wait(BACKOFF_TIME)
		NodeReset()
	else
		RegisterForSingleLOSLost(PlayerRef, self)
	endif
EndEvent

Event OnLostLOS(Actor akViewer, ObjectReference akTarget)
	utility.wait(BACKOFF_TIME)
	NodeReset()
endEvent

function NodeReset()
	;debug.trace("[Campfire] Wood Harvest Node Controller resetting object.")
	UnregisterForModEvent("Campfire_WoodHarvestNodeReset")
	if my_wood_ref && my_wood_ref.IsDisabled()
		my_wood_ref.EnableNoWait()
		if my_mushroom_ref1
			my_mushroom_ref1.EnableNoWait()
		endif
		if my_mushroom_ref2
			my_mushroom_ref2.EnableNoWait()
		endif
	endif
	self.Disable()
	self.Delete()
endFunction

float[] function GetGlobalOffset(ObjectReference akSource, Float afDistance, float afOffset = 0.0)
    Float A = akSource.GetAngleZ() + afOffset
    Float YDist = Sin(A)
    Float XDist = Cos(A)

    XDist *= afDistance
    YDist *= afDistance

    Float[] Offsets = New Float[2]
    Offsets[0] = YDist
    Offsets[1] = XDist
    Return Offsets
EndFunction