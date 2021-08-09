if (isServer) then
{
	 HLG_AVBD_hordeEvents = ["Horde"];

	_hordeEvents = param [0,1,[999]];

	if (_hordeEvents == 0) then {missionNamespace setVariable ["HLG_randomHordes",0]};
	if (_hordeEvents == 1) then {missionNamespace setVariable ["HLG_randomHordes",1]};
};
