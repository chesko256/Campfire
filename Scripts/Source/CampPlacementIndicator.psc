Scriptname CampPlacementIndicator extends ObjectReference

import CampUtil

_Camp_ObjectPlacementThreadManager property PlacementSystem auto hidden

Furniture property Required_furniture_to_place auto
{ Required: The Furniture object to place with this indicator. Fill only the furniture or the activator, not both. }
Activator property Required_activator_to_place auto
{ Required: The Activator object to place with this indicator. Fill only the furniture or the activator, not both. }
MiscObject property Required_inventory_item auto
{ Required: The Misc Item that starts this placement indicator. }
float property height_adjustment = 1.0 auto
{ (Default: 1.0) How much to adjust the placement indicator up or down. Useful if indicator is always above or below the ground. }
float property z_angle_adjustment = 0.0 auto
{ (Default: 0.0) How much to adjust the placement indicator's z angle (compass rotation). Useful if indicator is always facing the wrong way. }
Bool property snap_to_terrain = true auto
{ (Default: True) Whether this object should rotate according to the slope of the terrain. Results in a more natural position. }
Float property indicator_distance = 400.0 auto
{ (Default: 400.0) The distance from the player to render the indicator. }

ingredient property required_ingredient auto hidden
miscobject property required_miscitem auto hidden
int property cost = 0 auto hidden

Form form_to_place

float update_speed = 0.3

Event OnInit()
	PlacementSystem = CampUtil.GetPlacementSystem()	
	PlacementSystem.StartPlacement(self)
	if Required_furniture_to_place
		form_to_place = Required_furniture_to_place as Form
	elseif Required_activator_to_place
		form_to_place = Required_activator_to_place as Form
	endif
	RegisterForSingleUpdate(0.1)
endEvent

Event OnUpdate()
	float t = utility.GetCurrentRealTime()
	bool keep_updating = PlacementSystem.UpdateIndicator(self, 							\
														 form_to_place,					\
														 Required_inventory_item,		\
														 indicator_distance,			\
														 height_adjustment,				\
														 z_angle_adjustment,			\
														 snap_to_terrain,				\
														 required_ingredient,			\
														 required_miscitem,				\
														 cost)
	if keep_updating
		RegisterForSingleUpdate(update_speed)
	else
		self.Disable()
		self.Delete()
	endif
	float tdiff = utility.GetCurrentRealTime() - t
	debug.trace("[Campfire] Update speed: " + tdiff)
endEvent