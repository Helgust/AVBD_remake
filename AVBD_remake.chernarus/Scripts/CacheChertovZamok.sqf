/*
Chache Balota
*/

// Supply box
_ammobox = "B_CargoNet_01_ammo_F" createVehicle [6884.8,11440.4,0];
_ammobox setPos [6884.8,11440.4,0];
_ammobox setDir 0;
_ammobox allowDamage false;
_ammobox call HLG_fnc_EfC_ammoboxCSAT;
_ammobox enableDynamicSimulation true;

_supplybox = "Box_NATO_Equip_F" createVehicle [6886.3,11438.3,0];
_supplybox setPos [6886.3,11438.3,0];
_supplybox setDir 251;
_supplybox allowDamage false;
_supplybox call HLG_fnc_EfC_supplyboxCSAT;
_supplybox enableDynamicSimulation true;

// Empty vehicle 01
_vehicle01 = "CUP_B_UAZ_Unarmed_CDF" createVehicle [6890.1,1443.6,0];
_vehicle01 setDir 200;
_vehicle01 setFuel 0.45;
_vehicle01 setPosATL [6890.1,1443.6,0];

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_vehicle01];
_vehicle01 addItemCargoGlobal ["FirstAidKit",2];
_vehicle01 enableDynamicSimulation true;

// Empty vehicle 02
_vehicle02 = "CUP_B_BRDM2_CDF" createVehicle [6896,11437.4,0];
_vehicle02 setDir 206.5;
_vehicle02 setFuel 0.45;
_vehicle02 setPosATL [6896,11437.4,0];

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_vehicle02];
_vehicle02 addItemCargoGlobal ["FirstAidKit",2];
_vehicle02 enableDynamicSimulation true;

sleep 2;

// 1st group - entry team
_pos01a = [6998.2,11469,0];
_pos01b = [6915.1,11295.4,0];
_pos01c = [6760.0,11418.2,0];
_pos01d = [6895,11567,0];

_grp01 = grpNull;
_grp01 = [_pos01a, resistance, configFile >> "CfgGroups" >> "WEST" >> "CUP_B_CDF" >> "Infantry_MNT" >> "CUP_B_CDFInfSquad_MNT", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup;
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
_pos02a = [6854.4,11468.1,0];
_pos02b = [6907.4,11375.7,0];

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
