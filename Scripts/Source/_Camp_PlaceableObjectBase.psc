scriptname _Camp_PlaceableObjectBase extends ObjectReference

; REQUIRED PROPERTIES
MiscObject property Required_InventoryItem auto
{REQUIRED: The item the player obtains when picking up this object.}

; PRIVATE
_Camp_ObjectPlacementThreadManager property PlacementSystem auto hidden
bool property initialized = false auto hidden
float[] property OriginAng auto hidden
ObjectReference property CenterObject auto hidden

_Camp_ObjectFuture function GetFuture(ObjectReference akObjectReference)
	return akObjectReference as _Camp_ObjectFuture
endFunction