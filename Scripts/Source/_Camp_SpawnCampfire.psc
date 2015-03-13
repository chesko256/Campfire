Scriptname _Camp_SpawnCampfire extends activemagiceffect  

Keyword property ActorTypeCreature auto
Keyword property ImmuneParalysis auto
Actor property PlayerRef auto
Activator property _Camp_Indicator_Campfire auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if PlayerRef.GetRace().HasKeyword(ActorTypeCreature) || PlayerRef.GetRace().HasKeyword(ImmuneParalysis)
		;@TODO: Error message
	else
		Game.GetPlayer().PlaceAtMe(_Camp_Indicator_Campfire)
	endif
EndEvent