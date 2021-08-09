/*
Populate Green Mountane
*/
sleep 2;
// Supply boxes
_ammobox = "B_CargoNet_01_ammo_F" createVehicle [2858.904,9745.153,0.5];
_ammobox setPos [2858.904,9745.153,0.5];
_ammobox setDir 315;
_ammobox allowDamage false;
_ammobox call HLG_fnc_EfC_ammoboxNATO;
_ammobox enableDynamicSimulation true;


// Empty vehicle 01
_vehicle01 = "CUP_B_UAZ_AGS30_CDF" createVehicle [2846.1,9739.1,0];
_vehicle01 setDir 210;
_vehicle01 setFuel 0.45;
_vehicle01 setPosATL [2846.1,9739.1,0];

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_vehicle01];
_vehicle01 addItemCargoGlobal ["FirstAidKit",2];
_vehicle01 enableDynamicSimulation true;

// Empty vehicle 02
_vehicle02 = "CUP_B_UAZ_Unarmed_CDF" createVehicle [2856.5,9728.1,0];
_vehicle02 setDir 233;
_vehicle02 setFuel 0.45;
_vehicle02 setPosATL [2856.5,9728.1,0];

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_vehicle02];
_vehicle02 addItemCargoGlobal ["FirstAidKit",2];
_vehicle02 enableDynamicSimulation true;

sleep 2;

// 1st group - main squad
_pos01a = [2755,9866,0];
_pos01b = [2887,9742,0];

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
