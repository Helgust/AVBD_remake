/*
Cache in Berezino  - LSVs, ammo + CDF guards
*/

// Military post
_null = HLG_BerezinoPost01 call HLG_fnc_EfC_populatePost;

// Supply boxes
_ammobox = "B_CargoNet_01_ammo_F" createVehicle [13091.5,10064,0];
_ammobox setPos [13091.5,10064,0];
_ammobox setDir 135;
_ammobox allowDamage false;
_ammobox call HLG_fnc_EfC_ammoboxNATO;
_ammobox enableDynamicSimulation true;

_supplybox = "Box_NATO_Equip_F" createVehicle [13092.5,10066.2,0];
_supplybox setPos [13092.5,10066.2,0];
_supplybox setDir 45;
_supplybox allowDamage false;
_supplybox call HLG_fnc_EfC_supplyboxNATO;
_supplybox enableDynamicSimulation true;

// Vehicles
_lsv01 = "CUP_B_UAZ_MG_CDF" createVehicle [13095.4,10072.2,0];
_lsv01 setDir 0;
_lsv01 setFuel 0.5;
_lsv01 setPosATL [13095.4,10072.2,0];

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearItemCargoGlobal _x} forEach [_lsv01];
_lsv01 addItemCargoGlobal ["FirstAidKit",2];
_lsv01 enableDynamicSimulation true;

_lsv02 = "CUP_B_UAZ_Unarmed_CDF" createVehicle [13089.6,10059.5,0];
_lsv02 setDir 155;
_lsv02 setFuel 0.5;
_lsv02 setPosATL [13089.6,10059.5,0];

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearItemCargoGlobal _x} forEach [_lsv02];
_lsv02 addItemCargoGlobal ["FirstAidKit",2];
_lsv02 enableDynamicSimulation true;

// 1st group - depot squad
_pos01a = [13128.1,10368.8,0];
_pos01b = [13104.6,10224.7,0];

_grp01 = grpNull;
_grp01 = [_pos01a, resistance, configFile >> "CfgGroups" >> "West" >> "CUP_B_CDF" >> "Infantry_MNT" >> "CUP_B_CDFInfSection_AT_MNT", [], [], [0.2, 0.5]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp01];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp01)};
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp01);

// Enable Dynamic simulation
_grp01 enableDynamicSimulation true;

_wp01a = _grp01 addWaypoint [_pos01a, 0];
_wp01b = _grp01 addWaypoint [_pos01b, 0];
_wp01c = _grp01 addWaypoint [_pos01a, 0];
_wp01c setWaypointType "Cycle";

// 2st group - hangar squad
_pos02a = [13039.9,9934.5,0];
_pos02b = [13073.4,10143.7,0];

_grp02 = grpNull;
_grp02 = [_pos02a, resistance, configFile >> "CfgGroups" >> "West" >> "CUP_B_CDF" >> "Infantry_MNT" >> "CUP_B_CDFInfSection_MG_MNT", [], [], [0.2, 0.5]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp02];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp01)};
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp02);

// Enable Dynamic simulation
_grp02 enableDynamicSimulation true;

_wp02a = _grp02 addWaypoint [_pos02a, 0];
_wp02b = _grp02 addWaypoint [_pos02b, 0];
_wp02c = _grp02 addWaypoint [_pos02a, 0];
_wp02c setWaypointType "Cycle";

