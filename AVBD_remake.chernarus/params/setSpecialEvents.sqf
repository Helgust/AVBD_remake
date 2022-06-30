if (isServer) then
{
	//HLG_EfC_events = ["Paradrop","Mortar","Blackfoot","Mi17","SU25", "rndBlastToNearCity", "civCar"];
	 HLG_EfC_events = ["rndBlastToNearCity"];

	_specialEvents = param [0,0.2,[999]];

	if (_specialEvents == 0) then {missionNamespace setVariable ["HLG_specialEvents",0]};
	if (_specialEvents == 1) then {missionNamespace setVariable ["HLG_specialEvents",1]};
};
