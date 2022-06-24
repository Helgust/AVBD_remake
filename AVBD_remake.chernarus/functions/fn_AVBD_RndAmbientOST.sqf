/*
Create Horde of zombies to stalk players
*/

// Params
params
[
	["_delayMin",3,[999]], // min delay in minutes default 3 
	["_delayMax",5,[999]] // max delay in minutes default 10
];
private _delayFinal = (((random (_delayMax - _delayMin)) + _delayMin) * 60);
private _event = selectRandom HLG_AVBD_hordeEvents;

// HLG_AVBD_hordes = HLG_AVBD_hordes - [_event];
// if (count HLG_AVBD_hordes == 0) then {HLG_AVBD_hordeEvents = ["horde"]};
sleep _delayFinal;
_null = [_delayMin,_delayMax] spawn HLG_fnc_AVBD_RndAmbientOST;

_sound  = selectRandom AVBD_AmbSFX;
hint str _sound;
_sound remoteExec ["playSound"];

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
