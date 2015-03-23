scriptname _Frost_WoodpileNodeController extends ObjectReference

import Utility
import CampUtil

float RESET_TIME = 168.0
float BACKOFF_TIME
int RECURSIVE_SEARCH_COUNT = 5
float RECURSIVE_SEARCH_DISTANCE = 1000.0
bool eligible_for_reset = false
MiscObject property Firewood01 auto
Actor property PlayerRef auto
ObjectReference property my_wood_ref auto hidden
bool property harvested = false auto hidden

Formlist property _Camp_FirewoodPiles auto
Formlist property _Camp_FirewoodPileNodes auto
FormList property _Camp_FirewoodPiles_Small auto
FormList property _Camp_FirewoodPiles_Medium auto
FormList property _Camp_FirewoodPiles_Large auto
FormList property _Camp_FirewoodPiles_Huge auto

Container property _Camp_WoodHarvestFirewoodPile_Small auto
Container property _Camp_WoodHarvestFirewoodPile_Medium auto
Container property _Camp_WoodHarvestFirewoodPile_Large auto
Container property _Camp_WoodHarvestFirewoodPile_Huge auto

function Setup(ObjectReference _my_wood_ref)
	my_wood_ref = _my_wood_ref
	RegisterForSingleUpdate(0.1)
endFunction

function SearchForNearbyWoodpiles()
	ObjectReference woodref = Game.FindRandomReferenceOfAnyTypeInListFromRef(_Camp_FirewoodPiles, self, RECURSIVE_SEARCH_DISTANCE)
	if woodref
		Form woodform = woodref.GetBaseObject()
		;debug.trace("[Campfire] Woodpile Alias " + self + " assigned new reference " + woodref)
		
		if _Camp_FirewoodPiles_Small.HasForm(woodform)
			PlaceNodeController(_Camp_WoodHarvestFirewoodPile_Small, woodref, 0.8)
		elseif _Camp_FirewoodPiles_Medium.HasForm(woodform)
			PlaceNodeController(_Camp_WoodHarvestFirewoodPile_Medium, woodref)
		elseif _Camp_FirewoodPiles_Large.HasForm(woodform)
			PlaceNodeController(_Camp_WoodHarvestFirewoodPile_Large, woodref)
		elseif _Camp_FirewoodPiles_Huge.HasForm(woodform)
			PlaceNodeController(_Camp_WoodHarvestFirewoodPile_Huge, woodref, 1.6)
		endif
	endif
endFunction

function PlaceNodeController(Container akNodeController, ObjectReference akReference, float afScaleOverride = 1.0)
	ObjectReference my_node = Game.FindClosestReferenceOfAnyTypeInListFromRef(_Camp_FirewoodPileNodes, akReference, 1.0)
	_Camp_WoodpileNodeController my_controller = None
	if !my_node
		my_node = akReference.PlaceAtMe(akNodeController, abInitiallyDisabled = true)
		;debug.trace("[Campfire] Recursively placed woodpile node " + my_node)
		if my_node
			if afScaleOverride != 1.0
				my_node.SetScale(afScaleOverride)
			endif
			my_controller = my_node as _Camp_WoodpileNodeController
			my_controller.Setup(akReference)
		endif
	endif
endFunction

Event OnUpdate()
	; Use a recursive method to seek out nearby woodpiles and spread.
	int i = 0
	while i < RECURSIVE_SEARCH_COUNT
		SearchForNearbyWoodpiles()
		i += 1
	endWhile

	;debug.trace("[Campfire] Setting up new woodpile harvesting node " + self)

	;Store a random back-off value for use during reset
	BACKOFF_TIME = RandomFloat(0.0, 3.0)

	;Move upwards slightly so that the collider can be activated
	self.MoveTo(self, afZOffset = 0.50)
	self.SetFactionOwner(GetAreaCampingFaction(self))
	self.Enable()
	
	RegisterForModEvent("Campfire_WoodHarvestNodeReset", "WoodHarvestNodeReset")
	float _reset_time = RESET_TIME - RandomInt(-3, 3)
	;debug.trace("[Campfire] Woodpile respawning in " + _reset_time + " hours")
	RegisterForSingleUpdateGameTime(_reset_time)
endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if !(akBaseItem == Firewood01) && akSourceContainer == PlayerRef
		debug.notification("You cannot store that in a firewood pile.")
		PlayerRef.AddItem(akBaseItem, aiItemCount)
		self.RemoveItem(akBaseItem, aiItemCount)
	endif
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	int item_count = self.GetNumItems()
	debug.trace("[Campfire] item_count " + item_count + " harvested " + harvested)

	if item_count == 0
		harvested = true
		self.DisableNoWait()
		if !my_wood_ref.GetEnableParent()
			my_wood_ref.DisableNoWait()
		else
			debug.trace("[Campfire] This woodpile has an enable parent.")
		endif
		;Stagger updates every 21 - 27 hours to avoid hammering the system all at once
		float _reset_time = RESET_TIME - RandomInt(-3, 3)
		;debug.trace("[Campfire] Woodpile respawning in " + _reset_time + " hours")
		RegisterForSingleUpdateGameTime(_reset_time)
	endif
EndEvent

Event WoodHarvestNodeReset()
	;debug.trace("[Campfire] Woodpile node " + self + " received global reset signal, reverting...")
	RegisterForSingleUpdateGameTime(0.0)
endEvent

Event OnCellDetach()
	;debug.trace("[Campfire] Detached from cell, checking deletion eligibility...")
	if eligible_for_reset || !harvested
		utility.wait(BACKOFF_TIME)
		RegisterForSingleUpdateGameTime(0.0)
	endif
EndEvent

Event OnUpdateGameTime()
	;debug.trace("[Campfire] Woodpile node resetting after prescribed game time.")
	eligible_for_reset = true
	if !self.GetParentCell() || !self.GetParentCell().IsAttached()
		utility.wait(BACKOFF_TIME)
		NodeReset()
	endif
EndEvent

function NodeReset()
	debug.trace("[Campfire] Woodpile Harvest Node Controller resetting object.")
	UnregisterForModEvent("Campfire_WoodHarvestNodeReset")
	if my_wood_ref && my_wood_ref.IsDisabled()
		my_wood_ref.Enable()
	endif
	self.Disable()
	self.Delete()
endFunction