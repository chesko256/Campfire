Scriptname _Camp_WoodAliasScript extends ReferenceAlias

ObjectReference property _Camp_HarvestLogActivatorRef auto

Event OnInit()
	_Camp_HarvestLogActivatorRef.MoveTo(self.GetRef())
EndEvent