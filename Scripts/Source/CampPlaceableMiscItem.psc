;/********s* ObjectReference/CampPlaceableMiscItem
* SCRIPTNAME
*/;
scriptname CampPlaceableMiscItem extends ObjectReference
;/*
* OVERVIEW
* Attach this script to a Grenade that represents the inventory item of a Placeable Object.
;*********/;

import CampUtil

;/********p* CampPlacementIndicator/Required_this_item
* SYNTAX
*/;
MiscObject property Required_this_item auto Mandatory
{
* DESCRIPTION
* Required: This inventory item, the object this script is attached to. }
;*********/;

;/********p* CampPlaceableMiscItem/Required_placement_indicator
* SYNTAX
*/;
Activator property Required_placement_indicator auto Mandatory
{
* DESCRIPTION
* Required: The object that will indicate to the player where to place this item. }
;*********/;

;/********p* CampPlaceableMiscItem/z_angle_offset
* SYNTAX
*/;
float property z_angle_offset auto
{
* DESCRIPTION
* Adjust Z angle (compass rotation) of placed item. Use if placed item is at a different angle than the placement indicator. }
;********/;

;/********p* CampPlaceableMiscItem/consumable_ingredient
* SYNTAX
*/;
Ingredient property consumable_ingredient auto
{
* DESCRIPTION
* Optional: An ingredient that is needed and consumed when using / placing this item. Fill only the ingredient or the misc item property. }
;********/;

;/********p* CampPlaceableMiscItem/consumable_misc_item
* SYNTAX
*/;
MiscObject property consumable_misc_item auto
{
* DESCRIPTION
* Optional: A misc item that is needed and consumed when using / placing this item. Fill only the ingredient or the misc item property. }
;********/;

;/********p* CampPlaceableMiscItem/consumable_cost
* SYNTAX
*/;
int property consumable_cost auto
{
* DESCRIPTION
* Optional: How many of the ingredients or misc items that will be consumed when this item is used / placed. }
;********/;

;/********p* CampPlaceableMiscItem/necessary_perk
* SYNTAX
*/;
Perk property necessary_perk auto
{
* DESCRIPTION
* Optional: A perk required to use / place this item. }
;********/;

;/********p* CampPlaceableMiscItem/consumable_ingredient_name
* SYNTAX
*/;
string property consumable_ingredient_name auto
{
* DESCRIPTION
* Optional: The name of any required ingredient. Used if user does not have SKSE installed. }
;********/;

;/********p* CampPlaceableMiscItem/consumable_miscitem_name
* SYNTAX
*/;
string property consumable_miscitem_name auto
{
* DESCRIPTION
* Optional: The name of any required misc item. Used if user does not have SKSE installed. }
;********/;

;/********p* CampPlaceableMiscItem/necessary_perk_name
* SYNTAX
*/;
string property necessary_perk_name auto
{
* DESCRIPTION
* Optional: The name of any required perk. Used if user does not have SKSE installed. }
;********/;

Event OnUnequipped(Actor akActor)
	debug.trace("OnUnequipped")
EndEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	debug.trace("New container " + akNewContainer + " old container " + akOldContainer)
	if akOldContainer == Game.GetPlayer() && akNewContainer == None
		;/debug.trace("Trying player control toggle.")
		InputEnableLayer myLayer = InputEnableLayer.Create()
		myLayer.DisablePlayerControls(true, true, true, true, true, true, true, true, true, true, true)
		Utility.WaitMenuMode(1.0)
		myLayer.EnablePlayerControls()
		myLayer = None
		Utility.WaitMenuMode(4.0)
		debug.trace("Trying AI mode.")
		Game.SetPlayerAIDriven()
		Utility.WaitMenuMode(1.0)
		Game.SetPlayerAIDriven(false)
		Utility.WaitMenuMode(4.0)
		debug.trace("Trying pass time.")
		Game.PassTime(0)
		Utility.WaitMenuMode(4.0)
		debug.trace("Trying force first person.")
		Game.ForceFirstPerson()
		Utility.WaitMenuMode(4.0)
		debug.trace("Trying force third person.")
		Game.ForceThirdPerson()
		Utility.WaitMenuMode(4.0)
		debug.trace("Trying fade out game.")
		Game.FadeOutGame(True, True, 0.0, 2.0, True)
		Utility.WaitMenuMode(1.0)
		Game.FadeOutGame(False, True, 0.0, 2.0)
		Utility.WaitMenuMode(4.0)
		debug.trace("Trying serve time.")
		Game.ServeTime()
		Utility.WaitMenuMode(4.0)
		debug.trace("Set inside memory hud mode.")
		Game.SetInsideMemoryHUDMode(true)
		Utility.WaitMenuMode(1.0)
		Game.SetInsideMemoryHUDMode(false)
		Utility.WaitMenuMode(4.0)
		debug.trace("Set chargen hud mode.")
		Game.SetCharGenHudMode(3)
		Utility.WaitMenuMode(1.0)
		Game.SetCharGenHudMode(0)
		Utility.WaitMenuMode(4.0)
		debug.trace("Set chargen mode.")
		Game.SetInCharGen(True, True, False)
		Utility.WaitMenuMode(1.0)
		Game.SetInCharGen(False, False, False)
		/;
		;/debug.trace("Activate myself.")
		Game.GetPlayer().Activate(Game.GetPlayer())
		Utility.WaitMenuMode(4.0)
		debug.trace("Playing pipboy close idle.")
		Idle pipclose = Game.GetFormFromFile(0x00022CF8, "Fallout4.esm") as Idle
		Game.GetPlayer().PlayIdle(pipclose)
		Utility.WaitMenuMode(4.0)
		debug.trace("Playing furniture interaction exit.")
		Idle exitfurn = Game.GetFormFromFile(0x00024575, "Fallout4.esm") as Idle
		Game.GetPlayer().PlayIdle(exitfurn)
		Utility.WaitMenuMode(4.0)
		debug.trace("Disable menus.")
		debug.EnableMenus(false)
		Utility.WaitMenuMode(1.0)
		debug.EnableMenus()
		Utility.WaitMenuMode(4.0)
		/;
		Actor PlayerRef = Game.GetPlayer()
		debug.trace("Starting workshop.")
		Container wb = Game.GetFormFromFile(0x005C1C, "CampfireFO4.esp") as Container
		ObjectReference wbr = PlayerRef.PlaceAtMe(wb)
		Utility.WaitMenuMode(5.0)
		wbr.StartWorkshop()
		
		debug.trace("Done!")

	endif
EndEvent

Event OnEquipped(Actor akActor)
	debug.trace("Got onequipped")
	if PlayerCanPlaceObjects()
		if akActor == Game.GetPlayer()
			CampUtil.GetPlacementSystem().PlaceableObjectUsed(Required_this_item,           \
                                                              Required_placement_indicator, \
										  					  consumable_ingredient,		\
										  					  consumable_misc_item,			\
										  					  consumable_cost,				\
										  					  necessary_perk,               \
                                                              consumable_ingredient_name,   \
                                                              consumable_miscitem_name,     \
                                                              necessary_perk_name)
		endif
	endif
endEvent