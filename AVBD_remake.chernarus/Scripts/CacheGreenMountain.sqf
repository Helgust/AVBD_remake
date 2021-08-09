/*
Populate Green Mountane
*/
// Military Tower
_null = HLG_ZelenayaTower01 call HLG_fnc_EfC_populateTower;
sleep 2;
// Supply boxes
_ammobox = "O_CargoNet_01_ammo_F" createVehicle [3699.8,5986.31,0];
_ammobox setPos [3699.8,5986.31,0];
_ammobox setDir 0;
_ammobox allowDamage false;
_ammobox call HLG_fnc_EfC_ammoboxCSAT;
_ammobox enableDynamicSimulation true;

// Empty vehicle 01
_vehicle01 = "CUP_B_UAZ_SPG9_CDF" createVehicle [3700.7,5978.6,0];
_vehicle01 setDir 31;
_vehicle01 setFuel 0.45;
_vehicle01 setPosATL [3700.7,5978.6,0];

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_vehicle01];
_vehicle01 addItemCargoGlobal ["FirstAidKit",2];
_vehicle01 enableDynamicSimulation true;

// Empty vehicle 02
_vehicle02 = "CUP_B_UAZ_Unarmed_CDF" createVehicle [3692.2,5995.5,0];
_vehicle02 setDir 62;
_vehicle02 setFuel 0.45;
_vehicle02 setPosATL [3692.2,5995.5,0];

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_vehicle02];
_vehicle02 addItemCargoGlobal ["FirstAidKit",2];
_vehicle02 enableDynamicSimulation true;

sleep 2;

// LSV
_lsv = createVehicle ["CUP_B_UAZ_MG_CDF", [3722.1,6021.7,0], [], 0, "NONE"];
_lsv setDir 30;
createVehicleCrew _lsv;
_lsvCrew = crew _lsv;
_lsvGroup = group (_lsvCrew select 0);

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_lsv];
_lsv addItemCargoGlobal ["FirstAidKit",2];
_wpLSV01 = _lsvGroup addWaypoint [[3955.4,5814.6,0], 0];
_wpLSV01 setWaypointType "Guard";
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach _lsvCrew};
{_x setSkill ["AimingAccuracy",0.15]} forEach _lsvCrew;

_lsvGroup enableDynamicSimulation true;

if (missionNamespace getVariable "BIS_crewInImmobile" == 1) then
{
	_lsv allowCrewInImmobile true;
};

sleep 2;

// 1st group - main squad
_pos01a = [3778.2,5943.5,0];
_pos01b = [3558.6,6290.80];

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
