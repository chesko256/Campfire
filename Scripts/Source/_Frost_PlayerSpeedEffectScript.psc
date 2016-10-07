scriptname _Frost_PlayerSpeedEffectScript extends ActiveMagicEffect
{ Attached to movement speed exposure effects. }

float property effectMagnitude auto
Actor property PlayerRef auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.trace("Slowing down by " + effectMagnitude)
	PlayerRef.DamageAV("SpeedMult", effectMagnitude)

	; Force the speed to update instantly as per
	; http://www.creationkit.com/index.php?title=Actor_Value_List#Notes
	PlayerRef.DamageAV("CarryWeight", 0.1)
	PlayerRef.RestoreAV("CarryWeight", 0.1)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	debug.trace("Restoring movement speed by " + effectMagnitude)
	PlayerRef.RestoreAV("SpeedMult", effectMagnitude)

	PlayerRef.DamageAV("CarryWeight", 0.1)
	PlayerRef.RestoreAV("CarryWeight", 0.1)
EndEvent