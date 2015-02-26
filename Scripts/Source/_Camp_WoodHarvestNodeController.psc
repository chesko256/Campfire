scriptname _Camp_WoodHarvestNodeController extends ObjectReference

import Utility
import math

MiscObject property _Camp_Tinder auto
MiscObject property _Camp_DeadwoodBranch auto
MiscObject property _Camp_DeadwoodLog auto
Quest property _Camp_MainQuest auto
Imagespacemodifier property _Camp_FadeDown auto
Imagespacemodifier property _Camp_Black auto
Imagespacemodifier property _Camp_FadeUp auto
Sound property _Camp_ChopWoodSM auto
Actor property PlayerRef auto
FormList property _Camp_HarvestableWood_Mushrooms auto
Weapon property _Camp_WoodHarvestingAnimAxe auto
ObjectReference property my_wood_ref auto hidden
ObjectReference property my_mushroom_ref auto hidden
ObjectReference property current_activator auto hidden
ObjectReference property _Camp_WoodHarvestAttackTarget auto
ObjectReference property _Camp_WoodHarvestAnchor auto
int property remaining_yields auto hidden
float property tinder_yield_chance auto hidden
int property hit_count auto hidden
int property min_yield_branch auto hidden
int property max_yield_branch auto hidden
int property min_yield_deadwood auto hidden
int property max_yield_deadwood auto hidden
bool property is_stump auto hidden
bool property disable_on_depleted auto hidden

;Animation state vars
float stamina_rate
float stamina
bool was_first_person
bool was_sneaking
bool exit_on_next_hit
weapon main_weapon
weapon offhand_weapon

function Setup(int _remaining_yields, float _tinder_yield_chance, 		\
			   int _min_yield_branch, int _max_yield_branch,	 		\
			   int _min_yield_deadwood, int _max_yield_deadwood, 		\
			   bool _is_stump, bool _disable_on_depleted,				\
			   ObjectReference _current_activator, ObjectReference _my_wood_ref)

	remaining_yields = _remaining_yields
	tinder_yield_chance = _tinder_yield_chance
	min_yield_branch = _min_yield_branch
	max_yield_branch = _max_yield_branch
	min_yield_deadwood = _min_yield_deadwood
	max_yield_deadwood = _max_yield_deadwood
	is_stump = _is_stump
	disable_on_depleted = _disable_on_depleted
	current_activator = _current_activator
	my_wood_ref = _my_wood_ref
	my_mushroom_ref = GetMushroom()

	RegisterForSingleUpdateGameTime(120)
	RegisterForModEvent("Campfire_WoodHarvestNodeReset", "WoodHarvestNodeReset")
endFunction


ObjectReference function GetMushroom()
	ObjectReference mushroom = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_HarvestableWood_Mushrooms, self, 200.0)
	return mushroom
endFunction

function ActivatedWithAxe()
	;Register for necessary animation and control events.
	RegisterForAnimationEvent(PlayerRef, "HitFrame")
	RegisterForControl("Move")

	was_first_person = False
	if PlayerRef.GetAnimationVariableBool("IsFirstPerson")
		was_first_person = True
		Game.ForceThirdPerson()
	endif
	
	Game.DisablePlayerControls()

	main_weapon = GetCurrentWeapon()
	offhand_weapon = GetCurrentWeapon(true)
	PlayerRef.AddItem(_Camp_WoodHarvestingAnimAxe, abSilent = true)
	PlayerRef.EquipItem(_Camp_WoodHarvestingAnimAxe, abSilent = true)

	float[] offset = GetGlobalOffset(PlayerRef, 100.0)
	_Camp_WoodHarvestAttackTarget.MoveTo(PlayerRef, offset[0], offset[1])
	int i = 0
	while !_Camp_WoodHarvestAttackTarget.Is3DLoaded() && i < 50
		utility.wait(0.1)
		i += 1
	endWhile
	
	;Sneak if not sneaking
	was_sneaking = False
	if !PlayerRef.IsSneaking()
		PlayerRef.StartSneaking()
	else
		was_sneaking = True
	endif

	Game.SetPlayerAIDriven()
	Game.SetHudCartMode(true)

	;Set the player's StaminaRate and Stamina to 0 so that they cannot power attack.
	stamina_rate = PlayerRef.GetAV("StaminaRate")
	stamina = PlayerRef.GetAV("Stamina")
	PlayerRef.SetAV("StaminaRate", 0.0)
	PlayerRef.SetAV("Stamina", 0.0)
	utility.wait(0.1)

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
	if control == "Move"
		exit_on_next_hit = true
	endif
EndEvent

function ProcessActivatedHit()
	_Camp_ChopWoodSM.Play(PlayerRef)
	YieldResources()
	remaining_yields -= 1
	if remaining_yields <= 0 || exit_on_next_hit
		ExitActivatedChopping()
	endif
endFunction

function ExitActivatedChopping()
	UnregisterForAnimationEvent(PlayerRef, "HitFrame")
	UnregisterForControl("Move")
	exit_on_next_hit = false

	Game.SetPlayerAIDriven(false)
	(_Camp_MainQuest as _Camp_ConditionValues).IsChoppingWoodEnvironment = false
	_Camp_WoodHarvestAttackTarget.MoveTo(_Camp_WoodHarvestAnchor)

	;Re-equip the player's weapons and restore control.
	if main_weapon
		PlayerRef.EquipItem(main_weapon, abSilent = True)
	endif
	if offhand_weapon
		PlayerRef.EquipItem(offhand_weapon, abSilent = True)
	endif
	PlayerRef.RemoveItem(_Camp_WoodHarvestingAnimAxe, PlayerRef.GetItemCount(_Camp_WoodHarvestingAnimAxe), true)
	
	;Restore stamina values.
	PlayerRef.SetAV("StaminaRate", stamina_rate)
	PlayerRef.SetAV("Stamina", stamina)

	;Exit sneaking if sneaking, if they weren't sneaking
	if PlayerRef.IsSneaking() && !was_sneaking
		PlayerRef.StartSneaking()
		;Sometimes requires 2 attempts
		if PlayerRef.IsSneaking()
			PlayerRef.StartSneaking()
		endif
	endif
	Game.EnablePlayerControls()
	Game.SetHudCartMode(false)
	if was_first_person
		Game.ForceFirstPerson()
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

;/wait(0.2)
	_Camp_FadeDown.Apply()
	wait(0.5)
	_Camp_FadeDown.PopTo(_Camp_Black)
	PlayerRef.PlayIdle(IdleStop_Loose)
	_Camp_ChopWoodSM.Play(PlayerRef)
	wait(1.5)
	PlayerRef.AddSpell(_Camp_ChoppingAxeDisplay, false)
	_Camp_ChopWoodSM.Play(PlayerRef)
	wait(1.5)
	_Camp_ChopWoodSM.Play(PlayerRef)
	wait(1.5)
	_Camp_Black.PopTo(_Camp_FadeUp)
	YieldResources()
	wait(0.5)
	PlayerRef.PlayIdle(IdleWipeBrow)
	wait(2.2)
	PlayerRef.PlayIdle(IdleStop_Loose)
	wait(0.5)
	Game.EnablePlayerControls()
	PlayerRef.RemoveSpell(_Camp_ChoppingAxeDisplay)		
	if was_first_person
		Game.ForceFirstPerson()
	endif/;

function HitWithAxe()
	hit_count += 1
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
			
			if current_activator
				(current_activator as _Camp_WoodActivatorScript).GoHome()
			endif
			if disable_on_depleted && my_wood_ref
				my_wood_ref.DisableNoWait(true)
				if my_mushroom_ref
					my_mushroom_ref.DisableNoWait(true)
				endif
			endif
			RegisterForSingleUpdateGameTime(120)
		endif
	endif
endFunction

function ShowDepleteMessage()
	if is_stump
		if disable_on_depleted
			debug.notification("You successfully harvest the stump.")
		else
			debug.notification("This stump is depleted of useful material.")
		endif
	else
		if disable_on_depleted
			debug.notification("You successfully harvest the log.")
		else
			debug.notification("This log is depleted of useful material.")
		endif
	endif
endFunction

Event WoodHarvestNodeReset()
	debug.trace("[Campfire] " + self + " received master reset signal for wood harvest node, reverting...")
	NodeReset()
endEvent

Event OnUpdateGameTime()
	NodeReset()
EndEvent

function NodeReset()
	debug.trace("[Campfire] Wood Harvest Node Controller resetting object.")
	if my_wood_ref && my_wood_ref.IsDisabled()
		my_wood_ref.Enable()
		if my_mushroom_ref
			my_mushroom_ref.Enable()
		endif
	endif
	UnregisterForUpdateGameTime()
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