/*

Populate cargo tower with CSAT Pacific units
8 units, those with same watch direction are in a same group

Example: _null = tower1 call HLG_fnc_EfC_populateTower;

usable positions and dirs:
[3,0][15,0]
[8,90][12,90]
[5,180][18,180]
[9,270][16,270]

*/

// Params
params
[
	["_tower",objNull,[objNull]]
];

// Check for validity
// if (isNull _tower) exitWith {["POPULATE TOWER: Non-existing unit tower %1 used!",_tower] call BIS_fnc_logFormat};

// Tower direction
_dir = getDir _tower;

// 1st group - dir as tower
_grp01 = createGroup west;
_grp01 setFormDir _dir;

_pos01a = (AGLToASL (_tower buildingPos 2));
_pos01b = (AGLToASL (_tower buildingPos 14));

_unit01a = _grp01 createUnit [selectRandom ["CUP_B_USMC_Soldier","CUP_B_USMC_Soldier_AR"], [0,0,0], [], 0, "CAN_COLLIDE"];
_unit01a setPosASL _pos01a;
_unit01b = _grp01 createUnit [selectRandom ["CUP_B_USMC_Soldier_Sniper_M40A3","CUP_B_USMC_Soldier_AR"], [0,0,0], [], 0, "CAN_COLLIDE"];
_unit01b setPosASL _pos01b;

{_x setUnitPos "Up"; _x disableAI "Path"; _x setDir _dir} forEach [_unit01a,_unit01b];
{_x setSkill ["AimingAccuracy",0.1]} forEach (units _grp01);
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp01)};

_grp01 enableDynamicSimulation true;

// 2nd group - dir as tower + 90
_grp02 = createGroup west;
_grp02 setFormDir (_dir + 90);

_pos02a = (AGLToASL (_tower buildingPos 7));
_pos02b = (AGLToASL (_tower buildingPos 11));

_unit02a = _grp02 createUnit [selectRandom ["CUP_B_USMC_Medic","CUP_B_USMC_Engineer"], [0,0,0], [], 0, "CAN_COLLIDE"];
_unit02a setPosASL _pos02a;
_unit02b = _grp02 createUnit [selectRandom ["CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Soldier_GL"], [0,0,0], [], 0, "CAN_COLLIDE"];
_unit02b setPosASL _pos02b;

{_x setUnitPos "Up"; _x disableAI "Path"; _x setDir (_dir + 90)} forEach [_unit02a,_unit02b];
{_x setSkill ["AimingAccuracy",0.1]} forEach (units _grp02);
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp02)};

_grp02 enableDynamicSimulation true;

// 3rd group - dir as tower + 180
_grp03 = createGroup west;
_grp03 setFormDir (_dir + 180);

_pos03a = (AGLToASL (_tower buildingPos 4));
_pos03b = (AGLToASL (_tower buildingPos 17));

_unit03a = _grp03 createUnit [selectRandom ["CUP_B_USMC_Soldier","CUP_B_USMC_Soldier_GL"], [0,0,0], [], 0, "CAN_COLLIDE"];
_unit03a setPosASL _pos03a;
_unit03b = _grp03 createUnit [selectRandom ["CUP_B_USMC_Soldier_Sniper","CUP_B_USMC_Soldier_AR"], [0,0,0], [], 0, "CAN_COLLIDE"];
_unit03b setPosASL _pos03b;

{_x setUnitPos "Up"; _x disableAI "Path"; _x setDir (_dir + 180)} forEach [_unit03a,_unit03b];
{_x setSkill ["AimingAccuracy",0.1]} forEach (units _grp03);
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp03)};

_grp03 enableDynamicSimulation true;

// 4th group - dir as tower - 90
_grp04 = createGroup west;
_grp04 setFormDir (_dir - 90);

_pos04a = (AGLToASL (_tower buildingPos 8));
_pos04b = (AGLToASL (_tower buildingPos 15));

_unit04a = _grp04 createUnit [selectRandom ["CUP_B_USMC_Soldier_TL","CUP_B_USMC_Officer"], [0,0,0], [], 0, "CAN_COLLIDE"];
_unit04a setPosASL _pos04a;
_unit04b = _grp04 createUnit ["CUP_B_USMC_Soldier_LAT", [0,0,0], [], 0, "CAN_COLLIDE"];
_unit04b setPosASL _pos04b;

{_x setUnitPos "Up"; _x disableAI "Path"; _x setDir (_dir - 90)} forEach [_unit04a,_unit04b];
{_x setSkill ["AimingAccuracy",0.1]} forEach (units _grp04);
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp04)};

_grp04 enableDynamicSimulation true;
