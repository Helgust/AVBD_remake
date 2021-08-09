/*
Populate Green Mountane
*/
sleep 2;
// Supply boxes
_ammobox = "B_CargoNet_01_ammo_F" createVehicle [6341.1,7694.1,0.5];
_ammobox setPos [6341.1,7694.1,0.5];
_ammobox setDir 315;
_ammobox allowDamage false;
_ammobox call HLG_fnc_EfC_ammoboxNATO;
_ammobox enableDynamicSimulation true;

_supplybox = "Box_NATO_Equip_F" createVehicle [6340.2,7696.6,0.5];
_supplybox setPos [6340.2,7696.6,0.5];
_supplybox setDir 0;
_supplybox allowDamage false;
_supplybox call HLG_fnc_EfC_supplyboxNATO;
_supplybox enableDynamicSimulation true;

// Empty vehicle 01
_vehicle01 = "CUP_B_UAZ_MG_CDF" createVehicle [6323.9,7696.7,0];
_vehicle01 setDir 324;
_vehicle01 setFuel 0.45;
_vehicle01 setPosATL [6323.9,7696.7,0];

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_vehicle01];
_vehicle01 addItemCargoGlobal ["FirstAidKit",2];
_vehicle01 enableDynamicSimulation true;

// Empty vehicle 02
_vehicle02 = "CUP_B_UAZ_Unarmed_CDF" createVehicle [6330.8,7705.2,0];
_vehicle02 setDir 271;
_vehicle02 setFuel 0.45;
_vehicle02 setPosATL [6330.8,7705.2,0];

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_vehicle02];
_vehicle02 addItemCargoGlobal ["FirstAidKit",2];
_vehicle02 enableDynamicSimulation true;

sleep 2;

// 1st group - main squad
_pos01a = [6205,7761,0];
_pos01b = [6327.3,7720,0];

_grp01 = grpNull;
_grp01 = [_pos01a, West, configFile >> "CfgGroups" >> "West" >> "CUP_B_USMC" >> "Infantry" >> "CUP_B_USMC_FRTeam_DA", [], [], [0.2, 0.5]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp01];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp01)};
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp01);
_grp01 enableDynamicSimulation true;

_wp01a = _grp01 addWaypoint [_pos01a, 0];
_wp01b = _grp01 addWaypoint [_pos01b, 0];
_wp01c = _grp01 addWaypoint [_pos01a, 0];
_wp01c setWaypointType "Cycle";
