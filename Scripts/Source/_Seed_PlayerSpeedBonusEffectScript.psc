scriptname _Seed_PlayerSpeedBonusEffectScript extends ActiveMagicEffect
{ Attached to movement speed effects. }

Actor property PlayerRef auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Utility.Wait(0.3)
	; Force the speed to update instantly as per
	; http://www.creationkit.com/index.php?title=Actor_Value_List#Notes
	PlayerRef.DamageAV("CarryWeight", 0.1)
	PlayerRef.RestoreAV("CarryWeight", 0.1)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	Utility.Wait(0.3)
	PlayerRef.DamageAV("CarryWeight", 0.1)
	PlayerRef.RestoreAV("CarryWeight", 0.1)
EndEvent