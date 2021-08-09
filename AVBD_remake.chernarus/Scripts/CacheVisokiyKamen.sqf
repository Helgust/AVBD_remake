/*
Cache in mountain range
*/

// Supply boxes
_ammobox = "O_CargoNet_01_ammo_F" createVehicle [9028.1,4358.6,0];
_ammobox setPos [9028.1,4358.6,00];
_ammobox setDir 355;
_ammobox allowDamage false;
_ammobox call HLG_fnc_EfC_ammoboxSpecial;
_ammobox enableDynamicSimulation true;


// 1st group - lower team
_pos01a = [9201.6,4224.1,0];
_pos01b = [8848.6,4241.5,0];

_grp01 = grpNull;
_grp01 = [_pos01a, resistance, configFile >> "CfgGroups" >> "West" >> "CUP_B_CDF" >> "Infantry_MNT" >> "CUP_B_CDFInfSection_AT_MNT", [], [], [0.2, 0.3]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp01];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp01)};
{_x setSkill ["AimingAccuracy",0.1]} forEach (units _grp01);
_grp01 enableDynamicSimulation true;

_wp01a = _grp01 addWaypoint [_pos01a, 0];
_wp01b = _grp01 addWaypoint [_pos01b, 0];
_wp01c = _grp01 addWaypoint [_pos01a, 0];
_wp01c setWaypointType "Cycle";

sleep 2;

// 2nd group - upper team
_pos02a = [9144.7,4354.3,0];
_pos02b = [8864.0,4426.6,0];

_grp02 = grpNull;
_grp02 = [_pos02a, resistance, configFile >> "CfgGroups" >> "West" >> "CUP_B_CDF" >> "Infantry_MNT" >> "CUP_B_CDFInfSection_MG_MNT", [], [], [0.2, 0.3]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp02];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp02)};
{_x setSkill ["AimingAccuracy",0.1]} forEach (units _grp02);
_grp02 enableDynamicSimulation true;

_wp02a = _grp02 addWaypoint [_pos02a, 0];
_wp02b = _grp02 addWaypoint [_pos02b, 0];
_wp02c = _grp02 addWaypoint [_pos02a, 0];
_wp02c setWaypointType "Cycle";

