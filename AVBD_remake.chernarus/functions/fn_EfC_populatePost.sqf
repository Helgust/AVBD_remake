/*
Populate cargo posts in Escape from Tanoa

Example: _null = post call HLG_fnc_EfC_populatePost;
*/

// Params
params
[
	["_post",objNull,[objNull]]
];

// Check for validity
// if (isNull _post) exitWith {["POPULATE POST: Non-existing post %1 used!",_post] call BIS_fnc_logFormat};

// Create group on the post
_grp01 = createGroup west;
_grp01 setFormDir ((getDir _post) - 180);

_pos01 = _post getRelPos [2,135];
_pos01 set [2, ((getPosASL _post select 2) + 4.4)];
_pos02 = _post getRelPos [2,225];
_pos02 set [2, ((getPosASL _post select 2) + 4.4)];

_unit01 = _grp01 createUnit [selectRandom ["CUP_B_USMC_Soldier","CUP_B_USMC_Soldier_GL","CUP_B_USMC_Soldier_LAT"], [0,0,0], [], 0, "CAN_COLLIDE"];
_unit01 setPosASL _pos01;
_unit02 = _grp01 createUnit [selectRandom ["CUP_B_USMC_Soldier","CUP_B_USMC_Soldier_AR","CUP_B_USMC_Soldier_Sniper_M40A3"], [0,0,0], [], 0, "CAN_COLLIDE"];
_unit02 setPosASL _pos02;

{_x setUnitPos "Up"; _x disableAI "Path"; _x setDir ((getDir _post) - 180)} forEach [_unit01,_unit02];
if (missionNamespace getVariable "BIS_enemyEquipment" == 1) then {{_null = _x execVM "Scripts\LimitEquipment.sqf"} forEach (units _grp01)};
{_x setSkill ["AimingAccuracy",0.15]} forEach (units _grp01);

_grp01 enableDynamicSimulation true;
