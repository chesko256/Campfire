

function Fragment_1(Actor akActor)
bool locked = false
if akActor == CampUtil.GetTrackedFollower(1) && _Frost_Follower1AnimLock.GetValue() == 1
	_Frost_Follower1AnimLock.SetValueInt(2)
	locked = true
elseif akActor == CampUtil.GetTrackedFollower(2) && _Frost_Follower2AnimLock.GetValue() == 1
	_Frost_Follower2AnimLock.SetValueInt(2)
	locked = true
elseif akActor == CampUtil.GetTrackedFollower(2) && _Frost_Follower3AnimLock.GetValue() == 1
	_Frost_Follower3AnimLock.SetValueInt(2)
	locked = true
endif

if locked
	int i = Utility.RandomFloat()
	if i <= 0.50
		akActor.PlayIdle(IdleWarmHandsStanding)
	else
		akActor.PlayIdle(IdleWarmHandsCrouched)
	endif
endif
endFunction

function Fragment_2(Actor akActor)
akActor.PlayIdle(IdleStop_Loose)
if akActor == CampUtil.GetTrackedFollower(1)
	_Frost_Follower1AnimLock.SetValueInt(1)
elseif akActor == CampUtil.GetTrackedFollower(2)
	_Frost_Follower2AnimLock.SetValueInt(1)
elseif akActor == CampUtil.GetTrackedFollower(3)
	_Frost_Follower3AnimLock.SetValueInt(1)
endif
endFunction