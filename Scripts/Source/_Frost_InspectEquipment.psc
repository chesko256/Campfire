scriptname _Frost_InspectEquipment extends ActiveMagicEffect

Message property _Frost_InspectEquipmentMsg_root auto
{
	Worn Equipment Protection

	Body Gear: X Warmth, X Coverage
	Head Gear: X Warmth, X Coverage
	Hands Gear: X Warmth, X Coverage
	Feet Gear: X Warmth, X Coverage
	Cloak: X Warmth, X Coverage
	Misc: X Warmth, X Coverage
	Total Warmth (with bonuses): X
	Total Coverage (with bonuses): X

	Inspect Equipment 	Restore Defaults	Back

}

Message property _Frost_InspectEquipmentMsg_select auto
{
	Which piece of gear would you like to inspect?

	Body	Head	Hands	Feet 	Cloak	Back
}

Message property _Frost_InspectEquipmentMsg_inspectwarmth auto
{
	At first glance, this equipment appears to provide X warmth.

	Checking the lining of the equipment, however, the warmth it really provides is...

	Poor(X)	Fair(X)	Good(X)	Excellent(X)	Max(X) 	Back
}

Message property _Frost_InspectEquipmentMsg_inspectcoverage auto
{
	The initial impression is that this gear provides X coverage.

	After inspecting the fittings and stitching, the coverage it really provides is...

	Poor(X)	Fair(X)	Good(X)	Excellent(X)	Max(X) 	Back
}

Message property _Frost_InspectEquipmentMsg_inspectconfirm auto
{
	The warmth and coverage of this gear has been changed.
}