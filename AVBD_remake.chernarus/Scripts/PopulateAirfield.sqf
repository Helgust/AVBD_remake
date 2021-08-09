/*
Populate Airfield by CSAT
*/

// Populate cargo towers
_null = AirfieldTower01 call HLG_fnc_EfC_populateTower;
sleep 2;
_null = AirfieldTower02 call HLG_fnc_EfC_populateTower;
sleep 2;
_null = AirfieldTower03 call HLG_fnc_EfC_populateTower;
sleep 2;
// Empty vehicles

_heli01 = "CUP_C_SA330_Puma_HC1_ChernAvia" createVehicle [4504.834,10726.923,0];
_heli01 setDir 240.572;
_heli01 setFuel 0.45;
_heli01 setPosATL [4504.834,10726.923,0];

_heli02 = "CUP_C_SA330_Puma_HC1_ChernAvia" createVehicle [4522.541,10694.892,0];
_heli02 setDir 240.572;
_heli02 setFuel 0.45;
_heli02 setPosATL [4522.541,10694.892,0];

_plane01 = "CUP_B_UH1Y_Gunship_Dynamic_USMC" createVehicle [4810.387,10196.084,0];
_plane01 setDir 240.572;
_plane01 setFuel 0.45;
_plane01 setPosATL [4810.387,10196.084,0];

sleep 2;

_plane02 = "CUP_C_AN2_CIV" createVehicle [4869.397,10176.137,0];
_plane02 setDir 240;
_plane02 setFuel 0.45;
_plane02 setPosATL [4869.397,10176.137,0];

_plane03 = "CUP_C_AN2_CIV" createVehicle [4892.505,10134.412,0];
_plane03 setDir 240;
_plane03 setFuel 0.45;
_plane03 setPosATL [4892.505,10134.412,0];

_plane04 = "CUP_B_C130J_USMC" createVehicle [4911.140,9984.143,0];
_plane04 setDir 331;
_plane04 setFuel 0.45;
_plane04 setPosATL [4911.140,9984.143,0];

{_x enableDynamicSimulation true} forEach [_heli01,_heli02,_plane01,_plane02,_plane03,_plane04];

sleep 2;

// Kamysh

_kamysh = createVehicle ["CUP_B_LAV25_USMC", [4703.872,9793.65,0], [], 0, "NONE"];
_kamysh setDir 305;
createVehicleCrew _kamysh;
_kamyshCrew = crew _kamysh;
_kamyshGroup = group (_kamyshCrew select 0);

_kamyshGroup enableDynamicSimulation true;

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_kamysh];
_wpKamysh01 = _kamyshGroup addWaypoint [[4703.872,9793.65,0], 0];
_wpKamysh02 = _kamyshGroup addWaypoint [[4614.179,10254.65,0], 0];
_wpKamysh03 = _kamyshGroup addWaypoint [[4703.872,9793.65,0], 0];
_wpKamysh03 setWaypointType "Cycle";
_kamyshGroup setSpeedMode "Limited";
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach _kamyshCrew};
{_x setSkill ["AimingAccuracy",0.15]} forEach _kamyshCrew;

if (missionNamespace getVariable "BIS_crewInImmobile" == 1) then
{
	_kamysh allowCrewInImmobile true;
};

sleep 5;

// Tigris
_tigris = createVehicle ["CUP_B_Ural_ZU23_CDF", [4739.976,10052.83,0], [], 0, "NONE"];
_tigris setDir 45;
createVehicleCrew _tigris;
_tigrisCrew = crew _tigris;
_tigrisGroup = group (_tigrisCrew select 0);

_tigrisGroup enableDynamicSimulation true;

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_tigris];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach _tigrisCrew};
{_x setSkill ["AimingAccuracy",0.15]} forEach _tigrisCrew;

if (missionNamespace getVariable "BIS_crewInImmobile" == 1) then
{
	_tigris allowCrewInImmobile true;
};

sleep 5;

// 1st group - runway team
_pos01a = [4868.536,9686.502,0];
_pos01b = [4167.675,10879.488,0];

_grp01 = grpNull;
_grp01 = [_pos01a, WEST, configFile >> "CfgGroups" >> "West" >> "CUP_B_USMC" >> "Infantry" >> "CUP_B_USMC_FireTeam", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp01];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp01)};
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp01);
_grp01 enableDynamicSimulation true;

_wp01a = _grp01 addWaypoint [_pos01a, 0];
_wp01b = _grp01 addWaypoint [_pos01b, 0];
_wp01c = _grp01 addWaypoint [_pos01a, 0];
_wp01c setWaypointType "Cycle";

sleep 5;

// 2nd group - terminal team
_pos02a = [4794.558,10221.196,0];
_pos02b = [4645.863,10150.778,0];
_pos02c = [4474.896,10433.103,0];
_pos02d = [4601.974,10479.938,0];

_grp02 = grpNull;
_grp02 = [_pos02a, WEST, configFile >> "CfgGroups" >> "West" >> "CUP_B_USMC" >> "Infantry" >> "CUP_B_USMC_FireTeam", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp02];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp02)};
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp02);
_grp02 enableDynamicSimulation true;

_wp02a = _grp02 addWaypoint [_pos02a, 0];
_wp02b = _grp02 addWaypoint [_pos02b, 0];
_wp02c = _grp02 addWaypoint [_pos02c, 0];
_wp02d = _grp02 addWaypoint [_pos02d, 0];
_wp02e = _grp02 addWaypoint [_pos02a, 0];
_wp02e setWaypointType "Cycle";

sleep 5;

// 6th group - hangar team 1
_pos06a = [4958.119,9935.102,0];
_pos06b = [4799.329,10223.879,0];
_pos06c = [4657.691,10164.565,0];
_pos06d = [4840.516,9896.125,0];

_grp06 = grpNull;
_grp06 = [_pos06a, WEST, configFile >> "CfgGroups" >> "West" >> "CUP_B_USMC" >> "Infantry" >> "CUP_B_USMC_FireTeam", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp06];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp06)};
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp06);
_grp06 enableDynamicSimulation true;

_wp06a = _grp06 addWaypoint [_pos06a, 0];
_wp06b = _grp06 addWaypoint [_pos06b, 0];
_wp06c = _grp06 addWaypoint [_pos06c, 0];
_wp06d = _grp06 addWaypoint [_pos06d, 0];
_wp06e = _grp06 addWaypoint [_pos06a, 0];
_wp06e setWaypointType "Cycle";

sleep 5;

// 7th group - hangar team 2
_pos07a = [4558.130,10637.097,0];
_pos07b = [4433.683,10844.632,0];
_pos07c = [4329.177,10800.688,0];
_pos07d = [4473.297,10581.926,0];

_grp07 = grpNull;
_grp07 = [_pos07a, WEST, configFile >> "CfgGroups" >> "West" >> "CUP_B_USMC" >> "Infantry" >> "CUP_B_USMC_FireTeam", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp07];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp07)};
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp07);
_grp07 enableDynamicSimulation true;

_wp07a = _grp07 addWaypoint [_pos07a, 0];
_wp07b = _grp07 addWaypoint [_pos07b, 0];
_wp07c = _grp07 addWaypoint [_pos07c, 0];
_wp07d = _grp07 addWaypoint [_pos07d, 0];
_wp07e = _grp07 addWaypoint [_pos07a, 0];
_wp07e setWaypointType "Cycle";
