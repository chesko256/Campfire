Scriptname _DE_boundcloakscript extends activemagiceffect  

Armor Property BoundCloak Auto

Event OnEffectStart(Actor ckTarget, Actor ckCaster)
	Utility.Wait(0.2)
	Game.GetPlayer().EquipItem(BoundCloak, false, true)
EndEvent

Event OnEffectFinish(Actor ckTarget, Actor ckCaster)
	int iCloakCount = Game.GetPlayer().GetItemCount(BoundCloak)
	if iCloakCount > 0
		Game.GetPlayer().RemoveItem(BoundCloak, iCloakCount, true)
	endif
EndEvent