/*
Create Syndikat group and let it stalk players - as they are spawned in jungle, set aimingAccuracy to very low
*/

// Params
params
[
	["_delayMin",3,[999]], // min delay in minutes default 3 
	["_delayMax",6,[999]] // max delay in minutes default 10
];
private _delayFinal = (((random (_delayMax - _delayMin)) + _delayMin) * 60);
private _event = selectRandom HLG_AVBD_hordeEvents;

// HLG_AVBD_hordes = HLG_AVBD_hordes - [_event];
// if (count HLG_AVBD_hordes == 0) then {HLG_AVBD_hordeEvents = ["horde"]};
sleep _delayFinal;
_null = [_delayMin,_delayMax] spawn HLG_fnc_AVBD_horde;

if (_event == "Horde") then
{
	_livePlayers = [];
	{if (alive _x) then {_livePlayers pushBackUnique _x}} forEach allPlayers;
	hint "horde";
	"horde" remoteExec ["playSound"];
	sleep 2;

	_averagex=0;
	_averagey=0;
	_divide=count _livePlayers;
	_amount=AVBD_randomhordeminamount+floor random (AVBD_randomhordemaxamount-AVBD_randomhordeminamount+1);
	hint str _divide;
	waitUntil {sleep 5; !(_divide==0 or {side _x==east} count allGroups>=(144-_amount) or {currentWeapon _x!=""} count  units BIS_grpMain==0) };
	{_averagex=_averagex+(getPos vehicle _x select 0);
	_averagey=_averagey+(getPos vehicle _x select 1);
	sleep 2;} forEach _livePlayers;	
	_averagepos=[_averagex/_divide,_averagey/_divide,0];
	
	_pos=[(_averagepos select 0)-AVBD_randomhordemaxspawndist*0.5+random AVBD_randomhordemaxspawndist,(_averagepos select 1)-AVBD_randomhordemaxspawndist*0.5+random AVBD_randomhordemaxspawndist,0];
	horde_spawner setPos [_pos select 0,_pos select 1,1000];

	while{surfaceIsWater _pos
		or (getPos horde_spawner select 2)<(getPosATL horde_spawner select 2) 
		or _pos distance _averagepos>AVBD_randomhordemaxspawndist or _pos distance _averagepos<AVBD_randomhordeminspawndist}
	do
	{
		_pos=[(_averagepos select 0)-AVBD_randomhordemaxspawndist*0.5+random AVBD_randomhordemaxspawndist,(_averagepos select 1)-AVBD_randomhordemaxspawndist*0.5+random AVBD_randomhordemaxspawndist,0];
		horde_spawner setPos [_pos select 0,_pos select 1,0];
	};

	_marker=createMarker [format ["marker%1",random 100000], _averagepos];
	_marker setMarkerType "hd_objective";
	_marker setMarkerColor "ColorYellow";
	_marker setMarkerSize [1,1];

	_marker=createMarker [format ["marker%1",random 100000], getPos horde_spawner];
	_marker setMarkerType "hd_dot";
	_marker setMarkerColor "ColorRed";
	_marker setMarkerSize [1,1];

	_newGrp = grpNull;
	// TODO make it depends from dynamic _amount 
	_newGrp = [[getPos horde_spawner select 0,getPos horde_spawner select 1,0], Resistance, configfile >> "CfgGroups" >> "Indep" >> "Ryanzombiesfaction" >> "Ryanzombiesgroupfast" >> "Ryanzombiesgroupfast3", [], [], [0.2, 0.2]] call BIS_fnc_spawnGroup;

	// Enable Dynamic simulation
	_newGrp enableDynamicSimulation true;

	{_x setSkill ["aimingAccuracy",0.05]} forEach (units _newGrp);
	if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach units _newGrp};

	// Stalk players
	waitUntil {sleep 5; simulationEnabled (leader _newGrp)};

	_stalk = [_newGrp,group (allPlayers select 0)] spawn BIS_fnc_stalk;
};

// _newGrp = createGroup resistance;
// _unit01 = _newGrp createUnit ["RyanZombieC_man_1", [_axisX,_axisY,0], [], 0, "NONE"];

// // Enable Dynamic simulation
// _newGrp enableDynamicSimulation true;


// {_x setSkill ["aimingAccuracy",0.05];} forEach (units _newGrp);
// if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach units _newGrp};

// // Stalk players
// waitUntil {sleep 5; simulationEnabled (leader _newGrp)};
// _stalk = [_newGrp,group (allPlayers select 0)] spawn BIS_fnc_stalk;

// sleep 0.5;
// removeUniform _unit01;
// _unit01 forceAddUniform (selectRandom AVBD_Uniform);

/*
waitUntil {sleep 5; {(_x distance leader _newGrp) < (1500)} count allPlayers == 0};
{deleteVehicle _x} forEach (units _newGrp);
deleteGroup _newGrp;
*/
