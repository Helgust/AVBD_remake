if (isServer) then
{
	//HLG_EfC_events = ["Paradrop","Mortar","Blackfoot","BattleHeliHelp","SU25", "RndBlastToNearCity", "CivCar", "CivHeli"];
	 HLG_EfC_events = ["CivCar"];

	_specialEvents = param [0,1,[999]];

	if (_specialEvents == 0) then {missionNamespace setVariable ["HLG_specialEvents",0]};
	if (_specialEvents == 1) then {missionNamespace setVariable ["HLG_specialEvents",1]};
};
