scriptname _Seed_SpoilSystem extends _Seed_BaseSystem

;/
    Food should spoil:
        In the player's inventory
        In your follower's inventories
        In the "Provisions" container

    Frequency:
    	Raw Meat, Raw Small Game, Raw Fish, Raw Seafood = 1 stage per 1 day
    	Cooked Meat, Cooked Game, Cooked Fish, Cooked Seafood = 1 stage per 3 days
    	Bread, Pastries, Fruit, Vegetables, Milk, Cheese = 1 stage per 5 days
    	Stews, Treats = 1 stage per 7 days
    

/;

ObjectReference property _Seed_ProvisionsContainerRef auto



function InitializeSystem()

endFunction

function AdvanceFollowerSpoilage()

endFunction

function AdvancePlayerSpoilage()

endFunction

function AdvanceProvisionsSpoilage()

endFunction

function SpoilFoodInContainer(ObjectReference akContainer)
	
endFunction
