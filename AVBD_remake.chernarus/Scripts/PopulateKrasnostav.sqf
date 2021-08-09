/*
Populate Krasnostav airfield by NATO
+ add a Kamysh, people like Kamyshes a lot
*/

// Populate cargo tower
 _null = KrasnostavTower01 call HLG_fnc_EfC_populateTower;

_heli01 = "CUP_B_Mi17_CDF" createVehicle [12116.601,12655.195,0];
_heli01 setDir 20;
_heli01 setFuel 0.45;
_heli01 setPosATL [12116.601,12655.195,0];

_heli02 = "CUP_C_SA330_Puma_HC1_ChernAvia" createVehicle [12221.6,12589.367,0];
_heli02 setDir 20;
_heli02 setFuel 0.45;
_heli02 setPosATL [12221.6,12589.367,0];

_heli03 = "CUP_C_SA330_Puma_HC1_ChernAvia" createVehicle [12238.007,12586.68,0];
_heli03 setDir 20;
_heli03 setFuel 0.45;
_heli03 setPosATL [12238.007,12586.68,0];

sleep 2;

_plane01 = "CUP_C_AN2_CIV" createVehicle [12012.48,12642.501,0];
_plane01 setDir 18;
_plane01 setFuel 0.45;
_plane01 setPosATL [12012.48,12642.501,0];

_plane02 = "CUP_C_AN2_CIV" createVehicle [12058.549,12629.595,0];
_plane02 setDir 18;
_plane02 setFuel 0.45;
_plane02 setPosATL [12058.549,12629.595,0];

{_x enableDynamicSimulation true} forEach [_heli01,_heli02,_heli03,_plane01,_plane02];

sleep 2;

// BTR80A
_kamysh = createVehicle ["CUP_B_BTR80A_CDF", [12302.1,12687.734,0], [], 0, "NONE"];
_kamysh setDir 305;
createVehicleCrew _kamysh;
_kamyshCrew = crew _kamysh;
_kamyshGroup = group (_kamyshCrew select 0);

_kamyshGroup enableDynamicSimulation true;

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_kamysh];
_wpKamysh01 = _kamyshGroup addWaypoint [[11985.495,12786.8,0], 0];
_wpKamysh02 = _kamyshGroup addWaypoint [[11991.146,12786.8,0], 0];
_wpKamysh03 = _kamyshGroup addWaypoint [[11991.146,12631.816,0], 0];
_wpKamysh03 setWaypointType "Cycle";
_kamyshGroup setSpeedMode "Limited";
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach _kamyshCrew};
{_x setSkill ["AimingAccuracy",0.15]} forEach _kamyshCrew;

if (missionNamespace getVariable "BIS_crewInImmobile" == 1) then
{
	_kamysh allowCrewInImmobile true;
};

sleep 5;

// LSV
_lsv = createVehicle ["CUP_B_UAZ_MG_CDF", [11951.58,12766.676,0], [], 0, "NONE"];
_lsv setDir 305;
createVehicleCrew _lsv;
_lsvCrew = crew _lsv;
_lsvGroup = group (_lsvCrew select 0);

_lsvGroup enableDynamicSimulation true;

{clearMagazineCargoGlobal _x; clearWeaponCargoGlobal _x; clearBackpackCargoGlobal _x; clearItemCargoGlobal _x} forEach [_lsv];
_wplsv01 = _lsvGroup addWaypoint [[11951.58,12766.676,0], 0];
_wplsv01 setWaypointType "Guard";
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach _lsvCrew};
{_x setSkill ["AimingAccuracy",0.15]} forEach _lsvCrew;

if (missionNamespace getVariable "BIS_crewInImmobile" == 1) then
{
	_lsv allowCrewInImmobile true;
};

sleep 2.5;

// 1st group - runway squad
_pos01a = [12457.199,12586.622,0];
_pos01b = [11969.639,12762.33,0];

_grp01 = grpNull;
_grp01 = [_pos01a, resistance, configFile >> "CfgGroups" >> "WEST" >> "CUP_B_CDF" >> "Infantry_MNT" >> "CUP_B_CDFInfSection_MG_MNT", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp01];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp01)};
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp01);
_grp01 enableDynamicSimulation true;

_wp01a = _grp01 addWaypoint [_pos01a, 0];
_wp01b = _grp01 addWaypoint [_pos01b, 0];
_wp01c = _grp01 addWaypoint [_pos01a, 0];
_wp01c setWaypointType "Cycle";

sleep 2.5;

// 2nd group - terminal team
_pos02a = [12225.285,12615.77,0];
_pos02b = [12027.93,12674.894,0];

_grp02 = grpNull;
_grp02 = [_pos02a, resistance, configFile >> "CfgGroups" >> "WEST" >> "CUP_B_CDF" >> "Infantry_MNT" >> "CUP_B_CDFInfSquad_Weapons_MNT", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp02];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp02)};
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp02);
_grp02 enableDynamicSimulation true;

_wp02a = _grp02 addWaypoint [_pos02a, 0];
_wp02b = _grp02 addWaypoint [_pos02b, 0];
_wp02c = _grp02 addWaypoint [_pos02a, 0];
_wp02c setWaypointType "Cycle";

sleep 2.5;

// 6th group - city team 01
_pos06a = [11097.397,12202.597,0];
_pos06b = [11279.452,12108.801,0];
_pos06c = [11330.412,12219.955,0];
_pos06d = [11169.405,12278.302,0];

_grp06 = grpNull;
_grp06 = [_pos06a, resistance, configFile >> "CfgGroups" >> "WEST" >> "CUP_B_CDF" >> "Infantry_MNT" >> "CUP_B_CDFInfSection_MG_MNT", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp06];
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp06);
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp06)};
_grp06 enableDynamicSimulation true;

_wp06a = _grp06 addWaypoint [_pos06a, 0];
_wp06b = _grp06 addWaypoint [_pos06b, 0];
_wp06c = _grp06 addWaypoint [_pos06c, 0];
_wp06d = _grp06 addWaypoint [_pos06d, 0];
_wp06e = _grp06 addWaypoint [_pos06c, 0];
_wp06f = _grp06 addWaypoint [_pos06b, 0];
_wp06g = _grp06 addWaypoint [_pos06a, 0];
_wp06g setWaypointType "Cycle";

sleep 2.5;

// 7th group - city team 02
_pos07a = [10968.52,12517.599,0];
_pos07b = [11121.935,12445.602,0];
_pos07c = [10999.472,12271.327,0];
_pos07d = [10835.29,12378.986,0];

_grp07 = grpNull;
_grp07 = [_pos07a, resistance, configFile >> "CfgGroups" >> "WEST" >> "CUP_B_CDF" >> "Infantry_MNT" >> "CUP_B_CDFInfSection_Patrol_MNT", [], [], [0.3, 0.4]] call BIS_fnc_spawnGroup;
{_x setBehaviour "Safe"; _x setSpeedMode "Limited"; _x setFormation "Column"} forEach [_grp07];
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp07);
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp07)};
_grp07 enableDynamicSimulation true;

_wp07a = _grp07 addWaypoint [_pos07a, 0];
_wp07b = _grp07 addWaypoint [_pos07b, 0];
_wp07c = _grp07 addWaypoint [_pos07c, 0];
_wp07d = _grp07 addWaypoint [_pos07d, 0];
_wp07e = _grp07 addWaypoint [_pos07c, 0];
_wp07f = _grp07 addWaypoint [_pos07b, 0];
_wp07g = _grp07 addWaypoint [_pos07a, 0];
_wp07g setWaypointType "Cycle";
