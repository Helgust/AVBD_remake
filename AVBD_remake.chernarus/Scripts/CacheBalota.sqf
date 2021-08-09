/*
Chache Balota
*/

// Supply box
_ammobox = "B_CargoNet_01_ammo_F" createVehicle [5136.9,2349.6,0.053];
_ammobox setPos [5136.9,2349.6,0.053];
_ammobox setDir 200;
_ammobox allowDamage false;
_ammobox call HLG_fnc_EfC_ammoboxNATO;
_ammobox enableDynamicSimulation true;

_supplybox = "Box_NATO_Equip_F" createVehicle [5138.9,2347.9,0];
_supplybox setPos [5138.9,2347.9,0];
_supplybox setDir 85;
_supplybox allowDamage false;
_supplybox call HLG_fnc_EfC_supplyboxNATO;
_supplybox enableDynamicSimulation true;

// Empty vehicle 01
_vehicle01 = "CUP_B_UAZ_MG_CDF" createVehicle [5135.3,2355.3,0];
_vehicle01 setDir 180;
_vehicle01 setFuel 0.45;
_vehicle01 setPosATL [5135.3,2355.3,0];

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_vehicle01];
_vehicle01 addItemCargoGlobal ["FirstAidKit",2];
_vehicle01 enableDynamicSimulation true;

// Empty vehicle 02
_vehicle02 = "CUP_B_BRDM2_CDF" createVehicle [5141.5,2353.7,0];
_vehicle02 setDir 216.5;
_vehicle02 setFuel 0.45;
_vehicle02 setPosATL [5141.5,2353.7,0];

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_vehicle02];
_vehicle02 addItemCargoGlobal ["FirstAidKit",2];
_vehicle02 enableDynamicSimulation true;

sleep 2;

// Populate post
_null = HLG_BalotaPost01 call HLG_fnc_EfC_populatePost;

sleep 2;

// 1st group - hangar team
_pos01a = [5173.3,2281.1,0];
_pos01b = [5063.4,2345.6];
_pos01c = [5142.5,2419.9,0];
_pos01d = [5206.7,2342.4,0];

_grp01 = grpNull;
_grp01 = [_pos01a, resistance, configFile >> "CfgGroups" >> "WEST" >> "CUP_B_CDF" >> "Infantry_MNT" >> "CUP_B_CDFInfSection_AT_MNT", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup;
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

sleep 2;

// 2nd group - runway team
_pos02a = [4637.7,2565.6,0];
_pos02b = [5228.2,2218.2,0];

_grp02 = grpNull;
_grp02 = [_pos02a, resistance, configFile >> "CfgGroups" >> "WEST" >> "CUP_B_CDF" >> "Infantry_MNT" >> "CUP_B_CDFInfSection_MG_MNT", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp02];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp02)};
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp02);
_grp02 enableDynamicSimulation true;

_wp02a = _grp02 addWaypoint [_pos02a, 0];
_wp02b = _grp02 addWaypoint [_pos02b, 0];
_wp02c = _grp02 addWaypoint [_pos02a, 0];
_wp02c setWaypointType "Cycle";

sleep 2;

// 6th group - terminal team
_pos06a = [4679.8,2589.4,0];
_pos06b = [4817.3,2508.7,0];

_grp06 = grpNull;
_grp06 = [_pos06a, resistance, configFile >> "CfgGroups" >> "West" >> "CUP_B_CDF" >> "Infantry_MNT" >> "CUP_B_CDFInfSection_Patrol_MNT", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp06];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp06)};
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp06);
_grp06 enableDynamicSimulation true;

_wp06a = _grp06 addWaypoint [_pos06a, 0];
_wp06b = _grp06 addWaypoint [_pos06b, 0];
_wp06c = _grp06 addWaypoint [_pos06a, 0];
_wp06c setWaypointType "Cycle";
