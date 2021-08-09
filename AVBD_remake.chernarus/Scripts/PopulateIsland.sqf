/*
Populate Military island
*/

_null = IslandTower01 call HLG_fnc_EfC_populateTower;
sleep 2;

// Empty vehicles

_heli01 = "CUP_B_UH1Y_Gunship_Dynamic_USMC" createVehicle [13657.742,2924.38,0];
_heli01 setDir 180;
_heli01 setFuel 0.235;
_heli01 setPosATL [13657.742,2924.38,0];
_heli01 enableDynamicSimulation true;

_heli02 = "CUP_B_UH1Y_Gunship_Dynamic_USMC" createVehicle [13691.06,2912.656,0];
_heli02 setDir 0;
_heli02 setFuel 0.25;
_heli02 setPosATL [13691.06,2912.656,0];
_heli02 enableDynamicSimulation true;

sleep 2;

_boat01 = "C_Rubberboat" createVehicle [11702.886,3132.496,0];
_boat01 setDir 98;
_boat01 setFuel 0.45;
_boat01 setPosATL [11702.886,3132.496,0];

_boat02 = "C_Rubberboat" createVehicle [11700.696,3122.658,0];
_boat02 setDir 98;
_boat02 setFuel 0.45;
_boat02 setPosATL [11700.696,3122.658,0];

_boat03 = "C_Rubberboat" createVehicle [11699.25,3112.647,0];
_boat03 setDir 98;
_boat03 setFuel 0.45;
_boat03 setPosATL [11699.25,3112.647,0];

{_x enableDynamicSimulation true} forEach [_heli01,_heli02,_boat01, _boat02,_boat03];


{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearItemCargoGlobal _x} forEach [_heli01,_heli02];

sleep 2;
// 1st group - patrol
_pos01a = [13702.334,2970.026,0];
_pos01b = [13654,3071.397,0];

_grp01 = grpNull;
_grp01 = [_pos01a, west, configFile >> "CfgGroups" >> "West" >> "CUP_B_USMC" >> "Infantry" >> "CUP_B_USMC_FireTeam", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp01];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp01)};
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp01);
_grp01 enableDynamicSimulation true;

_wp01a = _grp01 addWaypoint [_pos01a, 0];
_wp01b = _grp01 addWaypoint [_pos01b, 0];
_wp01c = _grp01 addWaypoint [_pos01a, 0];
_wp01c setWaypointType "Cycle";

	// Remove backpack with spare NLAWs
	// {if (typeOf _x == "B_Soldier_LAT_F") then {removeBackpackGlobal _x}} forEach (units _grp01);

sleep 5;

// 2nd group - base squad
_pos02a = [13662.619,2951.26,0];
_pos02b = [13658.507,2891.598,0];
_pos02c = [13729.047,2918.505,0];

_grp02 = grpNull;
_grp02 = [_pos02a, west, configFile >> "CfgGroups" >> "West" >> "CUP_B_USMC" >> "Infantry" >> "CUP_B_USMC_FireTeam", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp02];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp02)};
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp02);
_grp02 enableDynamicSimulation true;

_wp02a = _grp02 addWaypoint [_pos02a, 0];
_wp02b = _grp02 addWaypoint [_pos02b, 0];
_wp02c = _grp02 addWaypoint [_pos02c, 0];
_wp02d = _grp02 addWaypoint [_pos02a, 0];
_wp02d setWaypointType "Cycle";

	// Remove backpack with spare NLAWs
	// {if (typeOf _x == "B_Soldier_LAT_F") then {removeBackpackGlobal _x}} forEach (units _grp02);
