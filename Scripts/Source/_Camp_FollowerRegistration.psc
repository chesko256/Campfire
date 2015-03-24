Scriptname _Camp_FollowerRegistration extends ActiveMagicEffect  

Quest property _Camp_FollowerQuest auto

Race property DogCompanionRace auto

ReferenceAlias property Follower1 auto
ReferenceAlias property Follower2 auto
ReferenceAlias property Follower3 auto
ReferenceAlias property Animal auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.trace("Registering actor: " + akTarget.GetBaseObject().GetName() + " self " + self)
    if akTarget.GetRace() != DogCompanionRace
        RegisterFollower(akTarget)
    else
        RegisterAnimal(akTarget)
    endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    debug.trace("Unregistering actor: " + akTarget.GetBaseObject().GetName() + " self " + self)
    if akTarget.GetRace() != DogCompanionRace
        UnregisterFollower(akTarget)
    else
        UnregisterAnimal(akTarget)
    endif
EndEvent

function RegisterFollower(Actor akActor)
    ;Allow unregistration to happen first.
    utility.wait(2)

    ;Is this follower already registered?
    Actor first_actor_ref = Follower1.GetActorRef()
    Actor second_actor_ref = Follower2.GetActorRef()
    Actor third_actor_ref = Follower3.GetActorRef()
    if first_actor_ref == akActor
        return
    elseif second_actor_ref == akActor
        return
    elseif third_actor_ref == akActor
        return
    endif

    ;Register this follower in the first available alias
    if !first_actor_ref
        Follower1.ForceRefTo(akActor)
    elseif !second_actor_ref
        Follower2.ForceRefTo(akActor)
    elseif !third_actor_ref
        Follower3.ForceRefTo(akActor)
    else
        debug.trace("[Campfire] Tried to register " + akActor + " as Follower, but aliases were full.")
    endif
endFunction

function RegisterAnimal(Actor akAnimal)
    ;Allow unregistration to happen first.
    utility.wait(2)

    ;Is this animal already registered?
    Actor first_animal_ref = Animal.GetActorRef()
    if first_animal_ref == akAnimal
        return
    endif

    ;Register this animal in the first available alias
    if !first_animal_ref
        Animal.ForceRefTo(akAnimal)
    endif
endFunction

function UnregisterFollower(Actor akActor)
    if Follower1.GetActorRef() == akActor
        Follower1.Clear()
    elseif Follower2.GetActorRef() == akActor
        Follower2.Clear()
    elseif Follower3.GetActorRef() == akActor
        Follower3.Clear()
    endif
endFunction

function UnregisterAnimal(Actor akAnimal)
    if Animal.GetActorRef() == akAnimal
        Animal.Clear()
    endif
endFunction