/*
Populate Cherno
*/

// Populate cargo post and towers
_null = ElectroPost01 call HLG_fnc_EfC_populatePost;
sleep 2;
_null = ElectroTower01 call HLG_fnc_EfC_populateTower;
sleep 2;
_null = ElectroTower02 call HLG_fnc_EfC_populateTower;
sleep 2;

// Empty vehicles
_boat01 = "CUP_C_Fishing_Boat_Chernarus" createVehicle [10199.179,1665.19,16.395];
_boat01 setDir 354;
_boat01 setFuel 0.45;
_boat01 setPosATL [10199.179,1665.19,16.395];

_boat02 = "CUP_C_Fishing_Boat_Chernarus" createVehicle [10177.969,1668.726,16.048];
_boat02 setDir 354;
_boat02 setFuel 0.45;
_boat02 setPosATL [10177.969,1668.726,16.048];

sleep 2;

_scooter01 = "CUP_C_Zodiac_CIV" createVehicle [10151.527,1675.533,17.045];
_scooter01 setDir 0;
_scooter01 setFuel 0.45;
_scooter01 setPosATL [10151.527,1675.533,17.045];

_scooter02 = "CUP_C_Zodiac_CIV" createVehicle [10144.458,1675.099,17.045];
_scooter02 setDir 0;
_scooter02 setFuel 0.45;
_scooter02 setPosATL [10144.458,1675.099,17.045];

_scooter03 = "CUP_C_Zodiac_CIV" createVehicle [10137.246,1675.231,17.045];
_scooter03 setDir 0;
_scooter03 setFuel 0.45;
_scooter03 setPosATL [10137.246,1675.231,17.045];

{_x enableDynamicSimulation true} forEach [_boat01,_boat02,_scooter01,_scooter02,_scooter03];

sleep 2;

// Speedboat
_speedboat = createVehicle ["CUP_B_RHIB_USMC", [10783.376,2098.219,0], [], 0, "NONE"];
createVehicleCrew _speedboat;
_speedboatCrew = crew _speedboat;
_speedboatGroup = group (_speedboatCrew select 0);

_speedboatGroup enableDynamicSimulation true;

_wpSpeedboat01 = _speedboatGroup addWaypoint [[10598.242,1899.598,0], 0];
_wpSpeedboat02 = _speedboatGroup addWaypoint [[9970.504,1541.591,0], 0];
_wpSpeedboat03 = _speedboatGroup addWaypoint [[10598.242,1899.598,0], 0];
_wpSpeedboat03 setWaypointType "Cycle";
_speedboatGroup setSpeedMode "Limited";
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach _speedboatCrew};
{_x setSkill ["AimingAccuracy",0.15]} forEach _speedboatCrew;

sleep 2.5;

// Kamysh
_kamysh = createVehicle [selectRandom ["CUP_B_BTR80A_CDF","CUP_B_LAV25_USMC"], [10382.91,2210.849,0], [], 0, "NONE"];
_kamysh setDir 42;
createVehicleCrew _kamysh;
_kamyshCrew = crew _kamysh;
_kamyshGroup = group (_kamyshCrew select 0);

_kamyshGroup enableDynamicSimulation true;

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_kamysh];
_wpKamysh01 = _kamyshGroup addWaypoint [[10382.91,2210.849,0], 0];
_wpKamysh01 setWaypointType "Guard";
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach _kamyshCrew};
{_x setSkill ["AimingAccuracy",0.15]} forEach _kamyshCrew;

if (missionNamespace getVariable "BIS_crewInImmobile" == 1) then
{
	_kamysh allowCrewInImmobile true;
};

sleep 2.5;

// Random vehicle 01 - LSV or Ifrit
_vehicle01 = createVehicle [selectRandom ["CUP_B_UAZ_MG_CDF","CUP_B_UAZ_AGS30_CDF","CUP_B_HMMWV_M2_USMC"], [9932.563,1992.404,0], [], 0, "NONE"];
_vehicle01 setdir 20;
createVehicleCrew _vehicle01;
_vehicle01Crew = crew _vehicle01;
_vehicle01Group = group (_vehicle01Crew select 0);

_vehicle01Group enableDynamicSimulation true;

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_vehicle01];
_wpVehicle01 = _vehicle01Group addWaypoint [[9932.563,1992.404,0], 0];
_wpVehicle01 setWaypointType "Guard";
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach _vehicle01Crew};
{_x setSkill ["AimingAccuracy",0.15]} forEach _vehicle01Crew;

if (missionNamespace getVariable "BIS_crewInImmobile" == 1) then
{
	_vehicle01 allowCrewInImmobile true;
};

sleep 2.5;

// Random vehicle 02 - LSV or Ifrit
_vehicle02 = createVehicle [selectRandom ["CUP_B_UAZ_MG_CDF","CUP_B_UAZ_AGS30_CDF","CUP_B_HMMWV_M2_USMC"], [10619.895,2325.674,0], [], 0, "NONE"];
_vehicle02 setdir 260;
createVehicleCrew _vehicle02;
_vehicle02Crew = crew _vehicle02;
_vehicle02Group = group (_vehicle02Crew select 0);

_vehicle02Group enableDynamicSimulation true;

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_vehicle02];
_wpVehicle02 = _vehicle02Group addWaypoint [[10619.895,2325.674,0], 0];
_wpVehicle02 setWaypointType "Guard";
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach _vehicle02Crew};
{_x setSkill ["AimingAccuracy",0.15]} forEach _vehicle02Crew;

if (missionNamespace getVariable "BIS_crewInImmobile" == 1) then
{
	_vehicle02 allowCrewInImmobile true;
};

sleep 5;

// 1st group - west team
_pos01a = [10043.05,1868.18,0];
_pos01b = [9908.079,1868.712,0];
_pos01c = [9923.958,1989.922,0];
_pos01d = [10099.686,1915.291,0];

_grp01 = grpNull;
_grp01 = [_pos01a, WEST, configFile >> "CfgGroups" >> "West" >> "CUP_B_USMC" >> "Infantry" >> "CUP_B_USMC_FireTeam_Support", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp01];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp01)};
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp01);
_grp01 enableDynamicSimulation true;

_wp01a = _grp01 addWaypoint [_pos01a, 0];
_wp01b = _grp01 addWaypoint [_pos01b, 0];
_wp01c = _grp01 addWaypoint [_pos01c, 0];
_wp01d = _grp01 addWaypoint [_pos01d, 0];
_wp01e = _grp01 addWaypoint [_pos01a, 0];
_wp01e setWaypointType "Cycle";

sleep 5;

// 2nd group - north squad
_pos02a = [10478.715,2595.382,0];
_pos02b = [10523.079,2353.307,0];

_grp02 = grpNull;
_grp02 = [_pos02a, WEST, configFile >> "CfgGroups" >> "West" >> "CUP_B_USMC" >> "Infantry" >> "CUP_B_USMC_FireTeam_MG", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp02];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp02)};
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp02);
_grp02 enableDynamicSimulation true;

_wp02a = _grp02 addWaypoint [_pos02a, 0];
_wp02b = _grp02 addWaypoint [_pos02b, 0];
_wp02c = _grp02 addWaypoint [_pos02a, 0];
_wp02c setWaypointType "Cycle";

sleep 5;

// 6th group - central team
_pos06a = [10447.805,2112.087,0];
_pos06b = [10499.983,2007.729,0];
_pos06c = [10634.28,2106.09];
_pos06d = [10632.57,2186.504,0];

_grp06 = grpNull;
_grp06 = [_pos06a, WEST, configFile >> "CfgGroups" >> "West" >> "CUP_B_USMC" >> "Infantry" >> "CUP_B_USMC_InfSquad", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup;
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

// 6th group - Harbor team
_pos06a = [10045.391,1793.89,0];
_pos06b = [10337.103,1768.842,0];

_grp06 = grpNull;
_grp06 = [_pos06a, WEST, configFile >> "CfgGroups" >> "West" >> "CUP_B_USMC" >> "Infantry" >> "CUP_B_USMC_FireTeam", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp06];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp06)};
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp06);
_grp06 enableDynamicSimulation true;

_wp06a = _grp06 addWaypoint [_pos06a, 0];
_wp06b = _grp06 addWaypoint [_pos06b, 0];
_wp06e = _grp06 addWaypoint [_pos06a, 0];
_wp06e setWaypointType "Cycle";
