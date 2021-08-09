/*
Cache in Sugarcane factory
*/

// Supply boxes
_ammobox = "O_CargoNet_01_ammo_F" createVehicle [11471.4,7503.0,0];
_ammobox setPos [11471.4,7503.0,0];
_ammobox setDir 0;
_ammobox allowDamage false;
_ammobox call HLG_fnc_EfC_ammoboxCSAT;
_ammobox enableDynamicSimulation true;

_supplybox = "Box_CSAT_Equip_F" createVehicle [11469.8,7504.0,0];
_supplybox setPos [11469.8,7504.0,0];
_supplybox setDir 85;
_supplybox allowDamage false;
_supplybox call HLG_fnc_EfC_supplyboxCSAT;
_supplybox enableDynamicSimulation true;

// Vehicles
_lsv01 = "CUP_B_UAZ_MG_CDF" createVehicle [11478.9,7517.0,0];
_lsv01 setDir 135;
_lsv01 setFuel 0.5;
_lsv01 setPosATL [11478.9,7517.0,0];

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearItemCargoGlobal _x} forEach [_lsv01];
_lsv01 addItemCargoGlobal ["FirstAidKit",2];
_lsv01 enableDynamicSimulation true;

_truck01 = "CUP_B_Kamaz_Open_CDF" createVehicle [11461.1,7513.6,0];
_truck01 setDir 42;
_truck01 setFuel 0.5;
_truck01 setPosATL [11461.1,7513.6,0];

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearItemCargoGlobal _x} forEach [_truck01];
_truck01 addItemCargoGlobal ["FirstAidKit",2];
_truck01 enableDynamicSimulation true;

sleep 2.5;

// 1st group - depot team
_pos01a = [11428.5,7625.2,0];
_pos01b = [11543.9,7504.2,0];

_grp01 = grpNull;
_grp01 = [_pos01a, west, configFile >> "CfgGroups" >> "West" >> "CUP_B_USMC" >> "Infantry" >> "CUP_B_USMC_FireTeam", [], [], [0.2, 0.5]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp01];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp01)};
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp01);
_grp01 enableDynamicSimulation true;

_wp01a = _grp01 addWaypoint [_pos01a, 0];
_wp01b = _grp01 addWaypoint [_pos01b, 0];
_wp01c = _grp01 addWaypoint [_pos01a, 0];
_wp01c setWaypointType "Cycle";

sleep 2.5;

// 2nd group - marksman on roof
_grp02 = createGroup west;
_grp02 setFormDir 100;
_unit02 = _grp02 createUnit ["CUP_B_USMC_Soldier_Marksman", [11472.6,7487.5,12.4], [], 0, "CAN_COLLIDE"];
_unit02 setPosATL [11472.6,7487.5,12.4];

{_x setUnitPos "Middle"; _x disableAI "Path"; _x setDir 100} forEach (units _grp02);
{_x setSkill ["AimingAccuracy",0.25]} forEach (units _grp02);
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp02)};
_grp02 enableDynamicSimulation true;

// 3rd group - northern team
_pos03a = [11406.9,7578.6,0];
_pos03b = [11394.8,7417,0];

_grp03 = grpNull;
_grp03 = [_pos03a, West, configFile >> "CfgGroups" >> "West" >> "CUP_B_USMC" >> "Infantry" >> "CUP_B_USMC_FireTeam", [], [], [0.2, 0.5]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp03];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp03)};
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp03);
_grp03 enableDynamicSimulation true;

_wp03a = _grp03 addWaypoint [_pos03a, 0];
_wp03b = _grp03 addWaypoint [_pos03b, 0];
_wp03c = _grp03 addWaypoint [_pos03a, 0];
_wp03c setWaypointType "Cycle";

// 4th group - rifleman on scaffolding
_grp04 = createGroup west;
_grp04 setFormDir 30;
_unit04 = _grp04 createUnit ["CUP_B_USMC_Soldier", [11478.2,7484.5,8.5], [], 0, "CAN_COLLIDE"];
_unit04 setPosATL [11478.2,7484.5,8.5];

{_x setUnitPos "Up"; _x disableAI "Path"; _x setDir 30} forEach (units _grp04);
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp04);
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp04)};
_grp04 enableDynamicSimulation true;
