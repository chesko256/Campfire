Scriptname CampPlacementIndicator extends ObjectReference

import CampUtil
import _CampInternal

_Camp_ObjectPlacementThreadManager property PlacementSystem auto hidden

;/********p* CampPlacementIndicator/Required_furniture_to_place
* SYNTAX
*/;
Furniture property Required_furniture_to_place auto
{
* DESCRIPTION
* Required: The Furniture object to place with this indicator. Fill only the furniture or the activator, not both. }
;*********/;

;/********p* CampPlacementIndicator/Required_activator_to_place
* SYNTAX
*/;
Activator property Required_activator_to_place auto
{
* DESCRIPTION
* Required: The Activator object to place with this indicator. Fill only the furniture or the activator, not both. }
;*********/;

;/********p* CampPlacementIndicator/height_adjustment
* SYNTAX
*/;
float property height_adjustment = 1.0 auto
{
* DESCRIPTION
* (Default: 1.0) How much to adjust the placement indicator up or down. Useful if indicator is always above or below the ground. }
;*********/;

;/********p* CampPlacementIndicator/z_angle_adjustment
* SYNTAX
*/;
float property z_angle_adjustment = 0.0 auto
{
* DESCRIPTION
* (Default: 0.0) How much to adjust the placement indicator's z angle (compass rotation). Useful if indicator is always facing the wrong way. }
;*********/;

;/********p* CampPlacementIndicator/snap_to_terrain
* SYNTAX
*/;
Bool property snap_to_terrain = true auto
{
* DESCRIPTION
* (Default: True) Whether this object should rotate according to the slope of the terrain. Results in a more natural position. }
;*********/;

;/********p* CampPlacementIndicator/indicator_distance
* SYNTAX
*/;
Float property indicator_distance = 300.0 auto
{
* DESCRIPTION
* (Default: 300.0) The distance from the player to render the indicator. }
;*********/;

MiscObject property required_inventory_item auto hidden
ingredient property required_ingredient auto hidden
miscobject property required_miscitem auto hidden
int property cost = 0 auto hidden

Form form_to_place

float update_speed = 0.3

function Ready()
	PlacementSystem = CampUtil.GetPlacementSystem()	
	PlacementSystem.StartPlacement(self)
	if Required_furniture_to_place
		form_to_place = Required_furniture_to_place as Form
	elseif Required_activator_to_place
		form_to_place = Required_activator_to_place as Form
	endif
	RegisterForSingleUpdate(0.1)
endFunction

Event OnUpdate()
	CampDebug(0, "Indicator updating")
	bool keep_updating = PlacementSystem.UpdateIndicator(self, 							\
														 form_to_place,					\
														 required_inventory_item,		\
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
	;float tdiff = utility.GetCurrentRealTime() - t
	;CampDebug(0, "Update speed: " + tdiff)
endEvent